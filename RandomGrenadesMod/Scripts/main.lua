local UEHelpers = require("UEHelpers")

-- /Game/Weapon/DecoyGrenade/DecoyGrenadeProjectile.DecoyGrenadeProjectile_C
-- /Game/Weapon/VortexGrenade/VortexGrenadeProjectile.VortexGrenadeProjectile_C
-- /Game/Weapon/Flashbang/FlashBangGrenadeProjectile.FlashBangGrenadeProjectile_C
-- /Game/Weapon/ThrusterGrenade/ThrusterGrenadeProjectile.ThrusterGrenadeProjectile_C
-- /Game/Weapon/GasGrenade/GasGrenadeProjectile.GasGrenadeProjectile_C
-- /Game/Weapon/Shared/Projectiles/MolotovProjectile.MolotovProjectile_C
-- /Game/Weapon/ProximityMine/BP_ProxMineProjectile.BP_ProxMineProjectile_C
-- /Game/Blueprint/Rat/BP_Rat_SuicideBomber.BP_Rat_SuicideBomber_C

-- /Game/Blueprint/Rat/ThrowableRatProjectile.ThrowableRatProjectile_C
-- /Game/Weapon/Shared/Projectiles/ChemlightProjectile.ChemlightProjectile_C
-- /Game/Weapon/Shared/Projectiles/GrenadeLauncherProjectile.GrenadeLauncherProjectile_C
-- /Game/Character/NPC/Special/Mothman/BP_Mothball_Projectile.BP_Mothball_Projectile_C

-- BlueprintGeneratedClass /Game/Weapon/Shared/DamageType/DT_GrenadeLauncherProjectileHit.DT_GrenadeLauncherProjectileHit_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/BP_Crossbow_LingeringBolt.BP_Crossbow_LingeringBolt_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/BP_MolotovDebris.BP_MolotovDebris_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/BP_MolotovDebris_NoNav.BP_MolotovDebris_NoNav_C
-- BlueprintGeneratedClass /Game/Character/NPC/Special/Mothman/BP_Mothball_Projectile.BP_Mothball_Projectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/Tracer/UNUSEDBaseBulletTrailActor.UNUSEDBaseBulletTrailActor_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/Tracer/UNUSEDBulletTrailActorSlowMo.UNUSEDBulletTrailActorSlowMo_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/MeleeProjectile.MeleeProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/WeakMeleeProjectile.WeakMeleeProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/MeleeKickProjectile.MeleeKickProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/BaseGrenadeProjectile.BaseGrenadeProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/RocketLauncherProjectile.RocketLauncherProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/BaseMineProjectile.BaseMineProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/ProximityMine/BP_ProxMineProjectile.BP_ProxMineProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/DecoyGrenade/DecoyGrenadeProjectile.DecoyGrenadeProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Flashbang/FlashBangGrenadeProjectile.FlashBangGrenadeProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/VortexGrenade/VortexGrenadeProjectile.VortexGrenadeProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/ThrusterGrenade/ThrusterGrenadeProjectile.ThrusterGrenadeProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/HelicopterFlareProjectile.HelicopterFlareProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/AARocketProjectile.AARocketProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/BP_HelicopterMissile.BP_HelicopterMissile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/ChemlightProjectile.ChemlightProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/Prop_Chemlight_AutoRemove.Prop_Chemlight_AutoRemove_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/FlareProjectile.FlareProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/Prop_Flare_AutoRemove.Prop_Flare_AutoRemove_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/FlareProjectile_Phann.FlareProjectile_Phann_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/ExplosiveCrossbowProjectile.ExplosiveCrossbowProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/CrossbowProjectile_NonExplosive.CrossbowProjectile_NonExplosive_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/GrenadeLauncherProjectile.GrenadeLauncherProjectile_C
-- BlueprintGeneratedClass /Game/Blueprint/HVT/Patch03/SideSite32/BP_MortarProjectile.BP_MortarProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/GrenadeLauncher_HomingProjectile.GrenadeLauncher_HomingProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/MolotovProjectile.MolotovProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/MolotovProjectile_Cheap.MolotovProjectile_Cheap_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/MolotovProjectile_Cheap_NoNav.MolotovProjectile_Cheap_NoNav_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/FragGrenadeProjectile.FragGrenadeProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/GasGrenade/GasGrenadeProjectile.GasGrenadeProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/BaseThrowableBladeProjectile.BaseThrowableBladeProjectile_C
-- BlueprintGeneratedClass /Game/Blueprint/Rat/ThrowableRatProjectile.ThrowableRatProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Tomahawk/TomahawkProjectile.TomahawkProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/ThrowingKnife/ThrowingKnifeProjectile.ThrowingKnifeProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/ThrowingKnife/Cheat_ThrowingKnifeProjectile.Cheat_ThrowingKnifeProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/BaseBulletProjectileBP.BaseBulletProjectileBP_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/TaserProjectile.TaserProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/RevolverProjectile.RevolverProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/DevPistolProjectile.DevPistolProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/PlasmaProjectile.PlasmaProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/PlasmaChargedProjectile.PlasmaChargedProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/50BMGProjectile.50BMGProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/DMRProjectile.DMRProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/PistolProjectile.PistolProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/RifleProjectile.RifleProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/HelicopterMinigunProjectile.HelicopterMinigunProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/LMG_HomingProjectile.LMG_HomingProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/ShotgunProjectile.ShotgunProjectile_C
-- BlueprintGeneratedClass /Game/Weapon/Shared/Projectiles/ShotgunIncendiaryProjectile.ShotgunIncendiaryProjectile_C

local possibleGrenades = {
  'DecoyGrenadeProjectile_C',
  'VortexGrenadeProjectile_C',
  'FlashBangGrenadeProjectile_C',
  'ThrusterGrenadeProjectile_C',
  'GasGrenadeProjectile_C',
  'MolotovProjectile_C',
--  'BP_Rat_SuicideBomber_C',
  'BP_ProxMineProjectile_C',
  'FragGrenadeProjectile_C',
  'ThrowingKnifeProjectile_C',
  'TomahawkProjectile_C'
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

            local forwardOffset = 100.0

            -- Get forward vector (try actor method first, then fall back to Kismet)
            local forward = nil
            if obj.GetActorForwardVector then
                forward = obj:GetActorForwardVector()
            end

            local spawnLocation = location
            if forward then
                spawnLocation = {
                    X = location.X + forward.X * forwardOffset,
                    Y = location.Y + forward.Y * forwardOffset,
                    Z = location.Z + forward.Z * forwardOffset
                }
            end

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
            
            SpawnRandomGrenade(spawnLocation, rotation)
            
            isReplacing = false

            print("[UE4SS] Replaced grenade via NotifyOnNewObject:", obj:GetFullName())
        end
    end)
end)