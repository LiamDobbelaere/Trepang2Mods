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

local GrenadeProjClassPath = "/Game/Weapon/DecoyGrenade/DecoyGrenadeProjectile.DecoyGrenadeProjectile_C"
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

    local camMgr = UEHelpers:GetPlayerController().PlayerCameraManager
    local camLoc = camMgr:GetCameraLocation()
    local camRot = camMgr:GetCameraRotation()

    local pawn = UEHelpers:GetPlayerController().Pawn
    local pawnLoc = pawn:K2_GetActorLocation()  -- works in most UE4SS builds
    local pawnRot = pawn:K2_GetActorRotation()

    -- 3) Choose a spawn transform (location/rotation/scale)
    -- loc = camLoc-- GetLookLocation(1000) --{X=0.0, Y=0.0, Z=100.0}
    -- rot = camRot --{Pitch=0.0, Yaw=0.0, Roll=0.0}

    -- 4) Optional: spawn params (collision handling etc.)
    local params = {}
    -- If your bindings expose this enum:
    -- params.SpawnCollisionHandlingOverride = ESpawnActorCollisionHandlingMethod.AlwaysSpawn

    -- 5) Spawn the actor
    -- Depending on UE4SS bindings, either of these exist:
    local grenade = world:SpawnActor(GrenadeBPClass, loc, rot, params)          -- common overload
    --local col = grenade.Collision or grenade.Sphere or grenade.Capsule or grenade.CollisionComponent
    --if col and col.SetCollisionEnabled then
    --    col.SetCollisionEnabled(0)
    --end
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

NotifyOnNewObject(GrenadeProjClassPath, function(obj)
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
                print('Existing grenade teleported')
            elseif obj.K2_SetActorLocation then
                obj:K2_SetActorLocation(banishLocation, false, nil, true)
                print('Existing grenade location set')
            end
            
            SpawnRandomGrenade(location, rotation)
            
            isReplacing = false

            print("[UE4SS] Replaced grenade via NotifyOnNewObject:", obj:GetFullName())
        end
    end)
end)

-- NotifyOnNewObject("Class /Script/CPPFPS.BaseProjectile",function ()
--     print("A grenade entered the world")
-- end)

local function tprint (tbl, indent)
  if not indent then indent = 0 end
  local toprint = string.rep(" ", indent) .. "{\r\n"
  indent = indent + 2 
  for k, v in pairs(tbl) do
    toprint = toprint .. string.rep(" ", indent)
    if (type(k) == "number") then
      toprint = toprint .. "[" .. k .. "] = "
    elseif (type(k) == "string") then
      toprint = toprint  .. k ..  "= "   
    end
    if (type(v) == "number") then
      toprint = toprint .. v .. ",\r\n"
    elseif (type(v) == "string") then
      toprint = toprint .. "\"" .. v .. "\",\r\n"
    elseif (type(v) == "table") then
      toprint = toprint .. tprint(v, indent + 2) .. ",\r\n"
    else
      toprint = toprint .. "\"" .. tostring(v) .. "\",\r\n"
    end
  end
  toprint = toprint .. string.rep(" ", indent-2) .. "}"
  return toprint
end

RegisterHook('Function /Script/CPPFPS.BaseCharacter:SpawnGrenadeProjectile', function(self, a, b)   
    ExecuteInGameThread(function()
        print("ooh ooh")

        local FirstPlayerController = UEHelpers:GetPlayerController()
        local Pawn = FirstPlayerController.Pawn    
        ---@type ABaseCharacter
        local Character = FirstPlayerController.Character

        --print(tprint(Character.GetGrenadeInventory()))
        

        -- Character.GetGrenadeInventory(Character)[1].NumGrenades = 10

        local grenadeClass = FindObject(nil, "DecoyGrenadeProjectile_C", nil, nil)


        -- local grenadePickupClass = FindObject(nil, "GrenadePickupBox_DecoyGrenades_C", nil, nil)

        -- print(grenadeClass.GetFullName(grenadeClass))
        -- print(grenadePickupClass.GetFullName(grenadePickupClass))       

        -- Character.SetGrenadeInventory(Character, {
        --     {
        --         GrenadeProjectile=grenadeClass,
        --         GrenadePickup=grenadePickupClass,
        --         NumGrenades=5,
        --         bInfinite=false,
        --         bNPCEnabled=true
        --     }
        -- })
    end)
end)

local function RotatorToVector(rot)
    local pitch = math.rad(rot.Pitch)
    local yaw = math.rad(rot.Yaw)

    local x = math.cos(pitch) * math.cos(yaw)
    local y = math.cos(pitch) * math.sin(yaw)
    local z = math.sin(pitch)

    return {X=x, Y=y, Z=z}
end

local function GetLookLocation(maxDist)
    maxDist = maxDist or 10000.0

    local world = UEHelpers:GetWorld()
    if world == nil then return nil end

    -- Get player controller and camera
    local pc = UEHelpers:GetPlayerController()
    if pc == nil or pc.PlayerCameraManager == nil then return nil end

    local camMgr = pc.PlayerCameraManager
    local camLoc = camMgr:GetCameraLocation()
    local camRot = camMgr:GetCameraRotation()

    -- Build trace start/end
    local start = camLoc
    local dir = RotatorToVector(camRot)
    local finish = {X=start.X + dir.X * maxDist, Y=start.Y + dir.Y * maxDist, Z=start.Z + dir.Z * maxDist}

    -- Trace setup (visibility channel, ignore self)
    local params = {}
    params.bTraceComplex = true
    local pawn = pc.Pawn
    -- Add pawn as ignored actor

    local hit = {}
    local hitSomething = world:LineTraceSingleByChannel(hit, start, finish, 3, params)

    if hitSomething then
        return hit.Location, hit.ImpactNormal, camRot  -- point on surface, its normal, and camera rot (for fallback)
    else
        return finish, nil, camRot                      -- straight ahead at maxDist
    end
end

local function Execute()
    ExecuteInGameThread(function()
        SpawnRandomGrenade()
    end)
end

RegisterKeyBind(Key.E, { ModifierKey.CONTROL }, Execute)
