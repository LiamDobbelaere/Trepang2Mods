local UEHelpers = require("UEHelpers")

-- /Game/Weapon/DecoyGrenade/DecoyGrenadeProjectile.DecoyGrenadeProjectile_C
-- /Game/Weapon/VortexGrenade/VortexGrenadeProjectile.VortexGrenadeProjectile_C
-- /Game/Weapon/Flashbang/FlashBangGrenadeProjectile.FlashBangGrenadeProjectile_C
-- /Game/Weapon/ThrusterGrenade/ThrusterGrenadeProjectile.ThrusterGrenadeProjectile_C
-- /Game/Weapon/GasGrenade/GasGrenadeProjectile.GasGrenadeProjectile_C

local possibleGrenades = {
 'DecoyGrenadeProjectile_C',
 'VortexGrenadeProjectile_C',
 'FlashBangGrenadeProjectile_C',
 'ThrusterGrenadeProjectile_C',
 'GasGrenadeProjectile_C'
}

local grenadeToReplace = "/Game/Weapon/DecoyGrenade/DecoyGrenadeProjectile.DecoyGrenadeProjectile_C"
local isReplacing =false

local function SpawnGrenade(className, loc, rot)
    print('SpawnGrenade '..className)
    local GrenadeBPClass = FindObject(nil, className, nil, nil)  -- UClass for the actor BP
    if GrenadeBPClass == nil then
        print("Could not find "..className)
        return
    end

    -- 2) Get the world
    local world = UEHelpers:GetWorld()
    if world == nil then
        print("World not found")
        return
    end

    local pawn = UEHelpers:GetPlayerController().Pawn

    local params = {}
    local grenade = world:SpawnActor(GrenadeBPClass, loc, rot, params)
    if grenade.SetOwner then grenade.SetOwner(grenade, pawn) end

    if grenade ~= nil then
        print("Spawned: " .. grenade:GetFullName())
    else
        print("Spawn failed")
    end

end

local function SpawnRandomGrenade(loc, rot)
    SpawnGrenade(possibleGrenades[math.random(#possibleGrenades)], loc, rot)
end

NotifyOnNewObject(grenadeToReplace, function(obj)
    if isReplacing then return end

    isReplacing = true
    -- destroy on game thread after it finishes spawning
    ExecuteInGameThread(function()
        if obj then
            local location = obj:K2_GetActorLocation()
            local rotation = obj:K2_GetActorRotation()

            -- obj.K2_DestroyActor(obj)
            local banishLocation = {X=0, Y=0, Z=-99999}
            
            if obj.SetActorEnableCollision then obj.SetActorEnableCollision(obj, false) end
            if obj.SetActorHiddenInGame then obj.SetActorHiddenInGame(obj, true) end
            if obj.SetActorTickEnabled then obj.SetActorTickEnabled(obj, false) end
            if obj.SetLifeSpan then obj.SetLifeSpan(obj, 10.0) end
            if obj.K2_TeleportTo then
                obj:K2_TeleportTo(banishLocation, rotation)
            elseif obj.K2_SetActorLocation then
                obj:K2_SetActorLocation(banishLocation, false, nil, true)
            end
            
            SpawnRandomGrenade(location, rotation)
            
            isReplacing = false

            print("[UE4SS] Replaced grenade via NotifyOnNewObject:", obj:GetFullName())
        end
    end)
end)