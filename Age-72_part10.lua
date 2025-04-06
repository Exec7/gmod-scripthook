--Stealed clientside server code by exechack.cc
--Hostname: Age of Clones | Clone Wars Roleplay | Eigener Spielmodus - Part 10/12 - 06/04/2025


--PATH addons/arccw_weapons/lua/arccw/shared/attachments/15a_top_short.lua:
att.PrintName = "15a Short Top"
att.Description = "DC-15a short-top. Designed short-range combat."
att.Desc_Pros = {}
att.Icon = Material("interfaz/armas/swrp_att_a280_barrel2.png")
att.Desc_Cons = {}

att.AutoStats = true

att.Slot = {"15a_top"}
att.ActivateElements = {"15a_top_short"}

att.Mult_MoveSpeed = 0.9

att.Mult_Range = 0.90
att.Mult_Damage = 1.15
att.Mult_Recoil = 0.95
att.Mult_SightTime = 1.1
att.Mult_AccuracyMOA = 0.75
att.Mult_ShootPitch = 0.9
--addons/arccw_weapons/lua/arccw/shared/attachments/242_barrel_sniper.lua:
att.PrintName = "NT-242 Extended Barrel"
att.Description = "Extended barrel for NT-242."
att.SortOrder = 40
att.Desc_Pros = {}
att.Icon = Material("interfaz/armas/swrp_att_a280c_grip.png")
att.Desc_Cons = {}

att.AutoStats = true
att.Slot = "242_barrel"
att.ActivateElements = {"242_barrel_extended"}

att.Override_MuzzleEffect = "wpn_muzzleflash_dc17_green"
att.Override_Tracer = "tracer_green"

att.Mult_MoveSpeed = 0.9
att.Mult_MoveDispersion = 1.25
att.Mult_SightTime = 1.15
att.Mult_Range = 2.5
att.Mult_RPM = 0.9
att.Mult_Damage = 2
att.Override_AccuracyMOA = 0.1
att.Mult_ShootPitch = 0.70

--addons/arccw_weapons/lua/arccw/shared/attachments/perk_gunslinger.lua:
att.PrintName = "Gunslinger"

att.Icon = Material("interfaz/iconos/kraken/jedi guns dirty fighting/1908223959_3315526753.png")
att.Description = "Specialist training and a little extra gun care allow you to cycle the action more quickly after a shot, improving your rate of fire."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "perk"

att.AutoStats = true
att.Mult_CycleTime = .7

att.Hook_Compatible = function(wep)
    if wep:GetBuff_Override("Override_ManualAction", wep.ManualAction) then return end
    for i, v in pairs(wep.Firemodes) do
        if !v then continue end
        if v.Mode and v.Override_ManualAction then
            return
        end
    end
    return false
end

att.NotForNPCs = true
--addons/arccw_weapons/lua/arccw/shared/attachments/perk_masita_medic.lua:
att.PrintName = "Combat Medic"
att.Icon = Material("interfaz/iconos/kraken/jedi guns saboteur/940267439_136247775.png")
att.Description = "You're a Combat Medic, you are the sole reason why the team is still kicking."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = "perk"

att.NotForNPC = true

att.UBGL = true
att.UBGL_PrintName = "Healing Darts"
att.UBGL_Automatic = true
att.UBGL_ClipSize = 1
att.UBGL_Ammo = "ar2"
att.UBGL_RPM = 50
att.UBGL_Recoil = 1
att.UBGL_Capacity = 1

local function Ammo(wep)
    return wep.Owner:GetAmmoCount("ar2")
end

att.UBGL_Fire = function(wep, ubgl)
    wep.Owner:FireBullets({
        Src = wep.Owner:EyePos(),
        Num = 1,
        Damage = 0,
        Force = 0,
        Attacker = wep.Owner,
        Dir = wep.Owner:EyeAngles():Forward(),
        Callback = function(_, tr, dmg)
            local ent = tr.Entity
            local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM
            local dmgmax = 25
            local dmgmin = 1
            local delta = dist / 5
            delta = math.Clamp(delta, 0, 1)
            local amt = Lerp(delta, dmgmax, dmgmin)

            ent:SetHealth(math.Clamp(ent:Health() + (amt), 10, (ent:GetMaxHealth() * 1.5)))
        end
    })

    wep:EmitSound("masita/perks/combatheal_var_08.mp3", 100)

end

att.UBGL_Reload = function(wep, ubgl)
    if wep:Clip2() >= 1 then return end

    if Ammo(wep) <= 0 then return end

    local reserve = Ammo(wep)

    reserve = reserve + wep:Clip2()

    local clip = 1

    local load = math.Clamp(clip, 0, reserve)

    wep.Owner:SetAmmo(reserve - load, "pistol")

    wep:SetClip2(load)
end
--addons/arccw_weapons/lua/arccw/shared/attachments/perk_pointman.lua:
att.PrintName = "Pointman"

att.Icon = Material("interfaz/iconos/kraken/jedi juns sharpshooter/3178788454_3701931000.png")
att.Description = "Firearms and dexterity training for quick response in breaching situations. Drills in confined spaces allow you to more effectively handle long weapons in close quarters.\n\nThe pointman is always the first to enter, and the first to identify and disable threats."
att.Desc_Pros = {
    "Reduces barrel length for CQB situations."
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "perk"
att.SortOrder = 7

att.AutoStats = true
att.Add_BarrelLength = -10
att.M_Hook_Mult_RPM = function(wep, data)
    if wep:GetCurrentFiremode().Mode == 1 then
        data.mult = data.mult * 1.15
    end
end

att.NotForNPCs = true
--addons/arccw_weapons/lua/arccw/shared/attachments/perk_underload.lua:
att.PrintName = "Underload"

att.Icon = Material("interfaz/iconos/kraken/sith merc arsenal/756989185_3020183531.png")
att.Description = "Just because it fits, does not mean you have to fill it. Partially filled magazines reduces follower stress and improves feeding rate."
att.Desc_Pros = {
    "More fire rate, less reload time. More heat capacity & reliability"
}
att.Desc_Cons = {
    "Reduces ammo capacity."
}
att.Desc_Neutrals = {
}
att.Slot = "perk"

att.AutoStats = true
att.SortOrder = 1

function att.Hook_GetCapacity(wep, cap)
    return math.max(math.floor(cap * (1 - 0.14)), 1)
end

att.Hook_Compatible = function(wep)
    if wep.RejectMagSizeChange or wep:GetCapacity() == 1 then return false end
end


att.Mult_MalfunctionMean = 1.25
att.Mult_HeatCapacity = 1.25
att.Mult_RPM = 1.05
att.Mult_ReloadTime = 0.95

att.NotForNPCs = true
--addons/arccw_weapons/lua/arccw/shared/attachments/special_heal.lua:
att.PrintName = "Healing Rounds"
att.AbbrevName = "Healing Rounds"
att.Icon = Material("interfaz/iconos/jedi/healer.png")
att.Description = "Experimental overcharged plasma that can heal instead dealing damage."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = "perk"

att.NotForNPC = true

att.UBGL = true
att.UBGL_PrintName = "Healing Darts"
att.UBGL_Automatic = true
att.UBGL_ClipSize = 1
att.UBGL_Ammo = "ar2"
att.UBGL_RPM = 50
att.UBGL_Recoil = 1
att.UBGL_Capacity = 1

local function Ammo(wep)
    return wep.Owner:GetAmmoCount("ar2")
end

att.UBGL_Fire = function(wep, ubgl)
    wep.Owner:FireBullets({
        Src = wep.Owner:EyePos(),
        Num = 1,
        Damage = 0,
        Force = 0,
        Attacker = wep.Owner,
        Dir = wep.Owner:EyeAngles():Forward(),
        Callback = function(_, tr, dmg)
            local ent = tr.Entity
            local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM
            local dmgmax = 25
            local dmgmin = 1
            local delta = dist / 5
            delta = math.Clamp(delta, 0, 1)
            local amt = Lerp(delta, dmgmax, dmgmin)

            ent:SetHealth(math.Clamp(ent:Health() + (amt), 10, (ent:GetMaxHealth() * 1.5)))
        end
    })

    wep:EmitSound("everfall/equipment/bacta_bomb/bactabomb_corebass_distant_var_03.mp3", 100)

end

att.UBGL_Reload = function(wep, ubgl)
    if wep:Clip2() >= 1 then return end

    if Ammo(wep) <= 0 then return end

    local reserve = Ammo(wep)

    reserve = reserve + wep:Clip2()

    local clip = 1

    local load = math.Clamp(clip, 0, reserve)

    wep.Owner:SetAmmo(reserve - load, "pistol")

    wep:SetClip2(load)
end
--addons/arccw_weapons/lua/arccw/shared/attachments/sw_mag_dc15a_100drum.lua:
att.PrintName = "SW-Drum Magazine"
att.AbbrevName = "100-Round Mag"
att.SortOrder = 100
att.Icon = nil
att.Description = "Twin-drum magazine, ideal for suppressive fire. Bulky construction and high ammo capacity substantially increases weight, making the weapon difficult to handle. Prone to failures."
att.Desc_Pros = {}
att.Desc_Cons = {}

att.Desc_Neutrals = {}
att.Slot = "dc15a_magazine_100"

att.Model = "models/weapons/arccw/atts/magazine/rt97_rifle_magazine.mdl"
att.DroppedModel = "models/Items/BoxSRounds.mdl"
att.OffsetAng = Angle(0, 0, -90)

att.AutoStats = true

att.HideIfBlocked = true

att.Override_ClipSize = 100

att.Mult_SightTime = 1.4
att.Mult_ReloadTime = 1.7
att.Mult_Sway = 2.1

att.Mult_SpeedMult = 0.9
att.Mult_ShootSpeedMult = 0.8

att.Mult_DrawTime = 1.25
att.Mult_HolsterTime = 1.25

att.Mult_HipDispersion = 1.3

--[[]
att.Override_Jamming = true
att.Override_HeatCapacity = 200
att.Override_HeatDissipation = 4
att.Override_HeatDelayTime = 3
]]

--lua/arccw/shared/attachments/uc_40mm_caseless.lua:
att.PrintName = "40mm Caseless Grenades"
att.AbbrevName = "Caseless"
att.Icon = Material("entities/att/arccw_uc_40mm_caseless.png", "mips smooth")
att.Description = "Russian caseless VOG-25 grenades converted for use in regular tubes.\nWithout the need to remove an empty case, these can be reloaded faster; but the caseless design also means less propellant and less explosive power."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_40mm"

att.AutoStats = true

att.Mult_ReloadTime = 0.78
att.Mult_MuzzleVelocity = 0.85
att.Mult_Damage = 0.75
att.Mult_DamageMin = 0.75

att.Mult_ShootPitch = 1.1

att.ActivateElements = {"40mm_caseless"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_caseless"
end
--lua/arccw/shared/attachments/uc_40mm_incendiary.lua:
att.PrintName = "40mm Incendiary Grenades" -- trol
att.AbbrevName = "Incendiary"
att.Icon = Material("entities/att/arccw_uc_40mm_generic.png", "mips smooth")
att.Description = "Hand-made grenades loaded with a fuel mixture that disperses on impact, burning an area over time."
att.Desc_Pros = {
    "uc.40mm.incendiary"
}
att.Desc_Cons = {
    "uc.40mm.mindmg"
}
att.Desc_Neutrals = {
}
att.Slot = "uc_40mm"

att.AutoStats = true

att.Override_ShootEntity = "arccw_uc_40mm_incendiary"

--att.Mult_Recoil = 1

att.ActivateElements = {"40mm_incendiary"}
--lua/arccw/shared/attachments/uc_fg_match.lua:
att.PrintName = "Match Trigger"

att.Icon = Material("entities/att/arccw_uc_matchgradetrigger.png", "mips smooth")
att.Description = "Hair trigger for competition shooting allows crisp trigger pulls, improving first shot performance."
att.Desc_Pros = {
    "uc.match.1",
    "uc.match.2",
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = {"uc_fg","uc_fg_singleshot"}
att.SortOrder = 2
att.AutoStats = true

att.Hook_Compatible = function(wep)
    if wep:GetIsManualAction() then
        return false
    end
end

att.Override_ShotRecoilTable = {[1] = 0.75}
att.Mult_TriggerDelayTime = 0.5

--[[]
att.M_Hook_Mult_AccuracyMOA = function(wep, data)
    if wep:GetBurstCount() == 0 then
        data.mult = data.mult * 0.5
    end
end
]]

att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"
--lua/arccw/shared/attachments/uc_fg_preciserifling.lua:
att.PrintName = "Precision Rifling"

att.Icon = Material("entities/att/arccw_uc_precisionrifling.png", "mips smooth")
att.Description = "High-precision machined rifling allows the weapon to shoot much more consistently."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = {"uc_fg","uc_fg_singleshot"}
att.AutoStats = true
att.SortOrder = 1

att.Hook_Compatible = function(wep)
    if wep:GetIsShotgun() then
        return false
    end
end

att.Mult_AccuracyMOA = 0.75

att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"
--lua/arccw/shared/attachments/uc_muzzle_supp_cylinder.lua:
att.PrintName = "Cylinder Suppressor"
att.Icon = Material("entities/att/acwatt_uc_muzzle_supp_cylinder.png", "mips smooth")
att.Description = "Traps propellant gas from the muzzle, reducing visual and audible report.\nBulky and heavy, but provides better ballistic performance.\n\n\"By the time you figured it out, it would be too late.\""
att.Desc_Neutrals = {"uc.muzzleblocking", "uc.exclusive.shotgun"}

att.AutoStats = true
att.Slot = {"muzzle_shotgun","muzzle"}

att.GivesFlags = {"muzzleblocking"}
att.ExcludeFlags = {"nomuzzleblocking"}

att.SortOrder = 150

att.Model = "models/weapons/arccw/atts/ud_silencer_870.mdl"
att.ModelOffset = Vector(-1, 0, 0)
att.OffsetAng = Angle(0, 0, 0)

att.Silencer = true
att.Override_MuzzleEffect = "muzzleflash_suppressed"
att.IsMuzzleDevice = true

att.Mult_ShootPitch = 1.1
att.Mult_ShootVol = 0.75

att.Add_BarrelLength = 6
att.Mult_SightTime = 1.15
att.Mult_HipDispersion = 1.2
att.Mult_Sway = 1.15
att.Mult_Range = 1.1

att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"

att.Hook_Compatible = function(wep)
    if !wep:GetIsShotgun() then
        return false
    end
end
--lua/arccw/shared/attachments/uc_optic_acog.lua:
att.PrintName = "Trijicon Advanced Combat Optical Gunsight (4x)"
att.AbbrevName = "ACOG (4x)"
att.Icon = Material("entities/att/acwatt_uc_optic_acog.png", "mips smooth")
att.Description = "Medium range combat scope for improved precision at longer ranges.\nEquipped with backup iron sights for use in emergencies."

att.SortOrder = 4

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom",
}
att.Desc_Neutrals = {"uc.bus"}

att.AutoStats = true
att.Slot = {"optic", "ud_optic", "ud_acog"}

att.Model = "models/weapons/arccw/atts/ud_acog.mdl"
att.ModelOffset = Vector(0, 0, 0)
att.ModelScale = Vector(1.15, 1.15, 1.15)
att.OffsetAng = Angle(0, 0, 0)

att.AdditionalSights = {
    {
        Pos = Vector(0, 8, -1.48),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ViewModelFOV = 38,
        IgnoreExtra = true,
        CrosshairInSights = false,
        HolosightBone = "holosight",
        HolosightData = {
            Holosight = true,
            HolosightReticle = Material("hud/scopes/uc_acog_reticle.png", "smooth"),
            HolosightNoFlare = true,
            HolosightSize = 11,
            HolosightPiece = "models/weapons/arccw/atts/ud_acog_hsp.mdl",
            HolosightBlackbox = true,
            HolosightMagnification = UC_HalfScope( 4 ),
            Colorable = true,
        },
    },
    {
        Pos = Vector(-0.005, 11, -2.632),
        Ang = Angle(-1, 0, 0),
        Magnification = 1.1,
        IgnoreExtra = true,
        HolosightData = {
            Holosight = false,
        },
    },
}

att.Colorable = true
att.HolosightPiece = "models/weapons/arccw/atts/ud_acog_hsp.mdl"

att.Mult_SightedSpeedMult = 0.75
--lua/arccw/shared/attachments/uc_optic_leupold_dppro.lua:
att.PrintName = "Leupold DeltaPoint Pro Reflex Sight (LP)"
att.AbbrevName = "DP-Pro (LP)"
att.Icon = Material("entities/att/acwatt_uc_optic_leupold_dppro.png", "mips smooth")
att.Description = "Low-profile reflex sight. While its lens isn't as wide as other reflex sights, it's significantly lighter and small enough to use on pistols."

att.SortOrder = 0.5

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"optic", "optic_lp"}

att.Model = "models/weapons/arccw/atts/uc_leupold_dppro.mdl"
att.ModelScale = Vector(1.32, 1.56, 1.2)
att.ModelOffset = Vector(0, -0.05, 0.15)
att.AdditionalSights = {
    {
        Pos = Vector(0, 9, -0.85),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE
    }
}

att.Holosight = true
att.HolosightReticle = Material("hud/reticles/uc_reddot.png", "mips smooth")
att.HolosightPiece = "models/weapons/arccw/atts/uc_leupold_dppro_hsp.mdl"
att.HolosightNoFlare = false
att.HolosightSize = 2
att.HolosightBone = "holosight"
att.Colorable = true

att.Mult_SightedSpeedMult = .95
--lua/arccw/shared/attachments/uc_optic_micro_t1.lua:
att.PrintName = "AIMPOINT Micro T-1 Red Dot Reflex Sight (RDS)"
att.AbbrevName = "Micro T-1 (RDS)"
att.Icon = Material("entities/att/acwatt_uc_optic_micro_t1.png", "mips smooth")
att.Description = "Improves sighted visibility with a red-dot targeting reticle, while adding minimal extra weight."

att.SortOrder = 1

att.Desc_Pros = {
    "autostat.holosight",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"optic"}

att.Model = "models/weapons/arccw/atts/uc_mirco_t1.mdl"
att.ModelOffset = Vector(0,0,0.2)
att.ModelScale = Vector(1.2,1.2,1.2)

att.AdditionalSights = {
    {
        Pos = Vector(0, 9, -1.59),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ScrollFunc = ArcCW.SCROLL_NONE
    }
}

att.Holosight = true
att.HolosightReticle = Material("hud/reticles/uc_reddot.png", "mips smooth")
att.HolosightPiece = "models/weapons/arccw/atts/uc_mirco_t1_hsp.mdl"
att.HolosightNoFlare = false
att.HolosightSize = 1.5
att.HolosightBone = "holosight"
att.Colorable = true

att.Mult_SightedSpeedMult = .9
--lua/arccw/shared/attachments/uc_optic_nvis.lua:
att.PrintName = "N-Vision HALO-LR Thermal Scope (1-6x)"
att.AbbrevName = "HALO-LR (1-6x)"
att.Icon = Material("entities/att/acwatt_uc_optic_nvis.png", "mips smooth")
att.Description = "Cutting-edge night vision optic that highlights targets via infrared imaging. The complicated electronics result in a massive weight gain for the base weapon."

att.SortOrder = 6

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom",
    "autostat.thermal"
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
    "Double-tap +USE to toggle imaging modes"
}
att.AutoStats = true
att.Slot = {"optic"}

att.Model = "models/weapons/arccw/atts/uc_nvis.mdl"
att.ModelOffset = Vector(0, 0, 0.18)


att.AdditionalSights = {
    {
        Pos = Vector(-0.035, 6.5, -1.25),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ViewModelFOV = 25,
        ScrollFunc = ArcCW.SCROLL_ZOOM,
        ZoomLevels = 3,
        ScopeMagnification = UC_HalfScope( 1.5 ),
        Thermal = true,
        ThermalScopeColor = Color(255, 255, 255),
        ThermalHighlightColor = Color(255, 255, 255),
        ThermalFullColor = false,
        ThermalScopeSimple = false,
        ThermalNoCC = false,
        ThermalBHOT = false,
        IgnoreExtra = true,
        Contrast = 0.51,
        Brightness = 0.1,
        ForceLowRes = true,
        FPSLock = 42,
    },
    {
        Pos = Vector(-0.035, 6.5, -1.25),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ViewModelFOV = 25,
        ScrollFunc = ArcCW.SCROLL_ZOOM,
        ZoomLevels = 3,
        ScopeMagnification = UC_HalfScope( 1.5 ),
        Thermal = true,
        ThermalScopeColor = Color(255, 255, 255),
        ThermalHighlightColor = Color(0, 0, 0),
        ThermalFullColor = false,
        ThermalScopeSimple = false,
        ThermalNoCC = false,
        ThermalBHOT = false,
        IgnoreExtra = true,
        Contrast = 0.7,
        Brightness = 0.5,
        ForceLowRes = true,
        FPSLock = 42,
    },
    {
        Pos = Vector(-0.035, 6.5, -1.25),
        Ang = Angle(0, 0, 0),
        Magnification = 1.1,
        ViewModelFOV = 25,
        ScrollFunc = ArcCW.SCROLL_ZOOM,
        ZoomLevels = 3,
        ScopeMagnification = UC_HalfScope( 1.5 ),
        IgnoreExtra = true,
        ForceLowRes = true,
        FPSLock = 42,

        SpecialScopeFunction = function(screen)
            render.PushRenderTarget(screen)

            DrawColorModify({
                ["$pp_colour_addr"] = 0,
                ["$pp_colour_addg"] = 0,
                ["$pp_colour_addb"] = 0,
                ["$pp_colour_brightness"] = 0,
                ["$pp_colour_contrast"] = 1,
                ["$pp_colour_colour"] = 0.75,
                ["$pp_colour_mulr"] = 0,
                ["$pp_colour_mulg"] = 0,
                ["$pp_colour_mulb"] = 0
            })

            render.PopRenderTarget()
        end,
    },
}

att.ScopeGlint = false

att.Holosight = true
att.HolosightReticle = Material("hud/scopes/uc_nvis_reticle1grid.png", "mips smooth")
att.HolosightNoFlare = true
att.HolosightSize = 20
att.HolosightBone = "holosight"
att.HolosightPiece = "models/weapons/arccw/atts/uc_nvis_hsp.mdl"
att.Colorable = false

att.HolosightBlackbox = true

att.HolosightMagnification = UC_HalfScope( 1.5 )
att.HolosightMagnificationMin = UC_HalfScope( 1.5 )
att.HolosightMagnificationMax = UC_HalfScope( 6 )

att.Mult_SightTime = 1.1
att.Mult_SightedSpeedMult = 0.7
att.Mult_Sway = 1.25
--lua/arccw/shared/attachments/uc_tp_gang.lua:
att.PrintName = "Homeboy"
-- BANDIT STYLE IS BACK, BABY
att.Icon = Material("entities/att/arccw_uc_tp_homeboy.png", "smooth mips")
att.Description = "GANGSTAS ROLL UP IN DA HOOD, POP POP POP POP POP [-----], I BALL HARD STICK A GLOCK UP IN YOUR FACE [-----], DROP DROP DROP DROP DROP GO YOUR HOMIES [-----]"
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
    "uc.homeboy"
}
att.Slot = "uc_tp"

att.AutoStats = true
att.SortOrder = 14

--[[]
att.Mult_HipDispersion = 0.5
att.Mult_RecoilSide = 1.25
att.Mult_SightTime = 1.75
att.Mult_Sway = 1.5
]]

att.Mult_HipDispersion = 0.85
att.Mult_MoveDispersion = 0.75

att.LHIK = true
att.LHIKHide = true

att.Override_ActivePos = Vector(1, 0, 1)
att.Override_ActiveAng = Angle(0, 0, -60)

att.Override_ActivePos_Priority = 15
att.Override_ActiveAng_Priority = 15

att.Override_RecoilDirection = Angle(0.707, -0.707, 0)
att.Override_RecoilDirectionSide = Angle(0.707, 0.707, 0)

att.Override_AddSightRoll = -45

att.Hook_Compatible = function(wep, data)
    if wep:GetIsManualAction() and wep:GetBuff("HoldtypeActive") ~= "pistol" and wep:GetBuff("HoldtypeActive") ~= "revolver" then return false end
end

att.NotForNPCs = true
--lua/arccw/shared/attachments/uc_tp_pointshoot.lua:
att.PrintName = "Point Shooting"

att.Icon = Material("entities/att/arccw_uc_tp_pointshooting.png", "smooth mips")
att.Description = "Dedicated practice at shooting without using the sights has given you the ability to fire from the hip more effectively. If John Rambo can do it, so can you."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_tp"

att.AutoStats = true
att.SortOrder = 6

att.Mult_HipDispersion = 0.75

att.NotForNPCs = true
--lua/arccw/shared/attachments/uc_tp_strafe.lua:
att.PrintName = "Strafe"

att.Icon = Material("entities/att/arccw_uc_tp_strafe.png", "smooth mips")
att.Description = "Active experience in simulated combat drills has conditioned you to shoot while walking towards the enemy. When firing, you can walk at your normal speed."
att.Desc_Pros = {
    "uc.neverflinch"
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_tp"

att.AutoStats = true
att.SortOrder = 2

att.Override_ShootSpeedMult = 1
att.Mult_SightedSpeedMult = 1.2

att.NotForNPCs = true
--lua/arccw/shared/attachments/uc_ubgl_masterkey.lua:
att.PrintName = "Masterkey Underslung Shotgun"
att.AbbrevName = "Masterkey Shotgun"
att.Icon = Material("entities/att/acwatt_uc_ubgl_masterkey.png", "mips smooth")
att.Description = "Underslung shotgun primarily used to breach doors, but loaded with #00 Buckshot for your pleasure."

att.SortOrder = -100000

att.AutoStats = true
att.Desc_Pros = {
}
att.Slot = "uc_ubgl"
att.ExcludeFlags = {"uc_noubgl"}

att.LHIK = true

att.ModelOffset = Vector(1.0, 0, -1.7)
att.Model = "models/weapons/arccw/atts/uc_ubgl_masterkey.mdl"

att.SelectUBGLSound =  ""
att.ExitUBGLSound = ""

att.UBGL = true

att.UBGL_PrintName = "UBSG"
att.UBGL_Automatic = false
att.UBGL_MuzzleEffect = "muzzleflash_shotgun"
att.UBGL_Ammo = "buckshot"
att.UBGL_RPM = 120
att.UBGL_Recoil = 1

-- ??
att.UBGL_Capacity = 4
att.UBGL_ClipSize = 4

att.LHIK_GunDriver = 2
att.LHIK_CamDriver = 3

local pretty = GetConVar("arccw_uc_infiniteubwammo")

att.Hook_ModifyAttBodygroups = function(wep, data)
    if wep:GetBuff_Override("UC_UseClassicM203Mount") then
        data.element.Model:SetBodygroup(1, 1)
    end
end

local function Ammo(wep)
    return (pretty:GetBool() and 9999 or wep:GetOwner():GetAmmoCount("buckshot"))
end

att.Hook_LHIK_TranslateAnimation = function(wep, key)
    if key == "idle" then
        if wep:GetNW2Bool("MasterkeyInReload", false) or wep:GetNW2Float("MasterkeyReloadTime", CurTime()) >= CurTime() then
            return "DoNotPlayIdle"
        elseif wep:GetInUBGL() then
            return "idle_armed"
        else
            return "idle"
        end
    end
end

att.Hook_ShouldNotSight = function(wep)
    if wep:GetInUBGL() then
        return true
    end
end


att.Hook_OnSelectUBGL = function(wep)
    wep:SetNextSecondaryFire(CurTime() + 0.7)
    if (game.SinglePlayer() and SERVER) or (!game.SinglePlayer() and CLIENT and IsFirstTimePredicted()) then
        wep:DoLHIKAnimation("to_armed", 0.7)
        wep:PlaySoundTable({
            {s = "arccw_uc/common/rattle_b2i_rifle.ogg", t = 0},
            {s = "arccw_uc/common/raise.ogg", t = 0.15},
            {s = "arccw_uc/common/grab.ogg", t = 0.3},
        })
    end
end

att.Hook_OnDeselectUBGL = function(wep)
    wep:SetNextSecondaryFire(CurTime() + 0.7)
    if (game.SinglePlayer() and SERVER) or (!game.SinglePlayer() and CLIENT and IsFirstTimePredicted()) then
        wep:DoLHIKAnimation("to_idle", 0.7)
        wep:PlaySoundTable({
            {s = "arccw_uc/common/rattle_b2i_rifle.ogg", t = 0},
            {s = "arccw_uc/common/shoulder.ogg", t = 0.3},
        })
    end
end

local f1 = {
    ")arccw_uc/common/ub12ga/fire-01.ogg",
    ")arccw_uc/common/ub12ga/fire-02.ogg",
    ")arccw_uc/common/ub12ga/fire-03.ogg",
    ")arccw_uc/common/ub12ga/fire-04.ogg",
    ")arccw_uc/common/ub12ga/fire-05.ogg",
    ")arccw_uc/common/ub12ga/fire-06.ogg",
}
local f2 = {
    ")arccw_uc/common/ub12ga/fire-dist-01.ogg",
    ")arccw_uc/common/ub12ga/fire-dist-02.ogg",
    ")arccw_uc/common/ub12ga/fire-dist-03.ogg",
    ")arccw_uc/common/ub12ga/fire-dist-04.ogg",
    ")arccw_uc/common/ub12ga/fire-dist-05.ogg",
    ")arccw_uc/common/ub12ga/fire-dist-06.ogg",
}
local f3 = {
    ")arccw_uc/common/ub12ga/mech-01.ogg",
    ")arccw_uc/common/ub12ga/mech-02.ogg",
    ")arccw_uc/common/ub12ga/mech-03.ogg",
    ")arccw_uc/common/ub12ga/mech-04.ogg",
    ")arccw_uc/common/ub12ga/mech-05.ogg",
    ")arccw_uc/common/ub12ga/mech-06.ogg",
}

att.UBGL_Fire = function(wep, ubgl)
    if wep:Clip2() <= 0 or wep:GetNextPrimaryFire() > CurTime() then return end
    if wep:GetNW2Bool("MasterkeyNeedsPump", false) then return end

    local owner = wep:GetOwner()

    local dir = (owner:EyeAngles() + wep:GetFreeAimOffset()):Forward()

    local bullet = {
        DamageMax = 18, -- 6 pellets to kill
        DamageMin = 13, -- 8 pelllets to kill
        Range = 50,
        RangeMin = 5,
        DamageType = DMG_BUCKSHOT + DMG_BULLET,
        Penleft = 0,
        Penetration = 0,
        Num = 1,
        Damaged = {},
        Weapon = wep,
        BodyDamageMults = ArcCW.UC.BodyDamageMults_Shotgun,
    }

    local data = {
        Attacker = owner,
        Dir        = dir,
        Src        = wep:GetShootSrc(),
        Spread     = Vector(0, 0, 0),
        Damage     = 0,
        Num        = 1,
        Force      = 10,
        HullSize   = 4,
        Weapon     = wep,
        Callback = function(attacker, tr, dmg)
            -- HACK: Pass a fake bullet table instead of ourselves so we don't use the weapon's attributes unintentionally
            bullet.Travelled = (tr.HitPos - tr.StartPos):Length()
            ArcCW:BulletCallback(att, tr, dmg, bullet)
        end
    }

    if wep:GetOwner():IsPlayer() then
        for n = 1, 8 do
            local dirry = Vector(dir.x, dir.y, dir.z)
            math.randomseed(math.Round(util.SharedRandom(n, -1337, 1337, !game.SinglePlayer() and wep:GetOwner():GetCurrentCommand():CommandNumber() or CurTime()) * (wep:EntIndex() % 30241)))
            wep:ApplyRandomSpread(dirry, ArcCW.MOAToAcc * 100)
            data.Dir = dirry
            if GetConVar("arccw_bullet_enable"):GetBool() then
                ArcCW:ShootPhysBullet(wep, data.Src, (250 / ArcCW.HUToM) * data.Dir:GetNormalized(), 0, bullet)
            else
                owner:FireBullets(data, true)
            end
        end
    else
        data.Spread = Vector(ArcCW.MOAToAcc * 50, ArcCW.MOAToAcc * 50, 0)
        data.Num = 8
        owner:FireBullets(data, true)
    end

    if (game.SinglePlayer() and SERVER) or (!game.SinglePlayer() and CLIENT and IsFirstTimePredicted()) then
        wep:MyEmitSound(table.Random(f1), 80, 100, 1, CHAN_STATIC )
        wep:MyEmitSound(table.Random(f2), 149, 100, 1, CHAN_STATIC )
        wep:MyEmitSound(table.Random(f3), 80, 100, 1, CHAN_STATIC )
    end
    
    if game.SinglePlayer() and SERVER or (!game.SinglePlayer() and CLIENT and IsFirstTimePredicted()) then
        wep:DoEffects()
        wep:DoLHIKAnimation("fire")
    end
    wep:SetNextPrimaryFire(CurTime() + 0.4)
    wep:SetClip2(wep:Clip2() - 1)
    wep:SetNW2Bool("MasterkeyNeedsPump", true)
    wep:SetNW2Float("MasterkeyPumpTime", CurTime() + 0.3)
end

att.Hook_Think = function(wep)
    local p = wep:GetOwner()
    local pred = game.SinglePlayer() and SERVER or (!game.SinglePlayer() and CLIENT and IsFirstTimePredicted())
    if wep:GetNW2Bool("MasterkeyInReload", false) then
        if wep:GetNW2Float("MasterkeyReloadTime", CurTime()) <= CurTime() then
            if (!p and false or p:KeyDown(IN_ATTACK)) or Ammo(wep) <= 0 or wep:Clip2() == 4 then
                wep:SetReloading(CurTime() + 0.5)
                wep:SetNW2Float("MasterkeyPumpTime", CurTime() + 0.5)
                wep:SetNW2Float("MasterkeyReloadTime", CurTime() + 0.5)
                if pred then
                    wep:DoLHIKAnimation("sgreload_end")
                    wep:PlaySoundTable({
                        {s = ")arccw_uc/common/shoulder.ogg", t = 0.1},
                    })
                end
                wep:SetNW2Bool("MasterkeyInReload", false)
            else
                wep:SetReloading(CurTime() + 0.9)
                wep:SetNW2Float("MasterkeyReloadTime", CurTime() + 0.7)
                if pred then
                    wep:DoLHIKAnimation("sgreload_insert", 0.9)
                    wep:PlaySoundTable({
                        {s = ")arccw_uc/common/shotgun-insert-alt-01.ogg", t = 0.05},
                    })
                end
                wep:SetClip2(wep:Clip2() + 1)
                if !pretty:GetBool() then
                    wep:GetOwner():RemoveAmmo(1, "buckshot")
                end
            end
        end
    elseif wep:GetNW2Bool("MasterkeyNeedsPump", false) and wep:GetNW2Float("MasterkeyPumpTime", CurTime()) <= CurTime() and wep:Clip2() > 0 and !wep:GetOwner():KeyDown( IN_ATTACK ) then
        wep:SetNW2Bool("MasterkeyNeedsPump", false)
        wep:SetPriorityAnim(CurTime() + 0.4)
        if pred then
            wep:DoLHIKAnimation("cycle", 1.0)
            wep:PlaySoundTable({
                {s = ")weapons/arccw_ud/870/rack_1.ogg", t = 0.02},
                {s = ")weapons/arccw_ud/870/eject.ogg", t = 0.13},
                {s = ")weapons/arccw_ud/870/rack_2.ogg", t = 0.17},
            })
        end
    end
end

att.UBGL_Reload = function(wep, ubgl)
    if wep:Clip2() >= 4 then return end
    if Ammo(wep) <= 0 then return end

    wep:SetNextSecondaryFire(CurTime() + 1)

    local holy = (game.SinglePlayer() and SERVER) or (!game.SinglePlayer() and CLIENT and IsFirstTimePredicted())
    if wep:Clip2() == 0 then -- Always pump on empty.
        wep:SetNW2Bool("MasterkeyNeedsPump", true)
    end
    --[[if wep:Clip2() == 0 then
        if holy then
            wep:DoLHIKAnimation("sgreload_start_empty", 2)
            wep:PlaySoundTable({
                {s = ")weapons/arccw_ud/870/rack_1.ogg", t = 0},
                {s = ")arccw_uc/common/shotgun-insert-alt-01.ogg", t = 0.8},
                {s = ")weapons/arccw_ud/870/rack_2.ogg", t = 1.5},
                {s = ")arccw_uc/common/shoulder.ogg", t = 1.6},
            })
        end
        wep:SetNW2Bool("MasterkeyNeedsPump", false)
        wep:SetReloading(CurTime() + 2)
        wep:SetNW2Float("MasterkeyReloadTime", CurTime() + 2)

        wep:SetClip2(wep:Clip2() + 1)
        if !pretty:GetBool() then
            wep:GetOwner():RemoveAmmo(1, "buckshot")
        end
    else]]
        if holy then
            wep:DoLHIKAnimation("sgreload_start", 0.7)
            wep:PlaySoundTable({
                {s = ")arccw_uc/common/raise.ogg", t = 0.15},
                {s = ")arccw_uc/common/grab.ogg", t = 0.3},
            })
        end
        wep:SetReloading(CurTime() + 0.7)
        wep:SetNW2Float("MasterkeyReloadTime", CurTime() + 0.7)
    --end
    wep:SetNW2Bool("MasterkeyInReload", true)

    --local reserve = Ammo(wep)
    --reserve = reserve + wep:Clip2()
    --local clip = 4
    --local load = math.Clamp(clip, 0, reserve)
    --wep:GetOwner():SetAmmo(reserve - load, "smg1_grenade")
    --wep:SetClip2(load)
end

att.Mult_SightTime = 1.2
att.Mult_SpeedMult = 0.9
att.Mult_SightedSpeedMult = 0.85
--addons/arccw_weapons/lua/arccw/shared/attachments/wepcamo_camo.lua:
att.PrintName = "Digital Camouflage"
att.Icon = nil
att.Description = "Digtial camouflage finish."
att.Desc_Pros = {}
att.Desc_Cons = {}

att.Slot = "rep_vibrocamo"
att.Free = true
att.ActivateElements = {"wepcamo-digital"}

att.SortOrder = 4 *-1
--addons/arccw_base_modified/lua/arccw/client/cl_garbage.lua:
ArcCW.CSModels       = {} -- [entid] = { Weapon = NULL, WModels = {}, VModels = {} }
ArcCW.CSModelPile    = {} -- { {Model = NULL, Weapon = NULL} }
ArcCW.FlashlightPile = {} -- { {Weapon = NULL, ProjectedTexture = NULL}}
ArcCW.ReferenceModel = NULL

local function ArcCW_CollectGarbage()
    local removed, removedents = 0, {}

    for i, k in pairs(ArcCW.CSModels) do
        if !IsValid(k.Weapon) then
            removed = removed + 1

            table.insert(removedents, i)

            if k.WModels then for _, m in pairs(k.WModels) do SafeRemoveEntity(m.Model) end end
            if k.VModels then for _, m in pairs(k.VModels) do SafeRemoveEntity(m.Model) end end
        end
    end

    for _, i in pairs(removedents) do ArcCW.CSModels[i] = nil end

    local newpile = {}

    for _, k in pairs(ArcCW.CSModelPile) do
        if IsValid(k.Weapon) then
            table.insert(newpile, k)

            continue
        end

        SafeRemoveEntity(k.Model)

        removed = removed + 1
    end

    ArcCW.CSModelPile = newpile

    if GetConVar("developer"):GetBool() and removed > 0 then
        print("Removed " .. tostring(removed) .. " CSModels")
    end
end

hook.Add("PostCleanupMap", "ArcCW_CleanGarbage", function()
    ArcCW_CollectGarbage()
end)

timer.Create("ArcCW CSModel Garbage Collector", 5, 0, ArcCW_CollectGarbage)

hook.Add("PostDrawEffects", "ArcCW_CleanFlashlights", function()
    local newflashlightpile = {}

    for _, k in pairs(ArcCW.FlashlightPile) do
        if IsValid(k.Weapon) and k.Weapon == LocalPlayer():GetActiveWeapon() then
            table.insert(newflashlightpile, k)

            continue
        end

        if k.ProjectedTexture and k.ProjectedTexture:IsValid() then
            k.ProjectedTexture:Remove()
        end
    end

    ArcCW.FlashlightPile = newflashlightpile

    local wpn = LocalPlayer():GetActiveWeapon()

    if !wpn then return end
    if !IsValid(wpn) then return end
    if !wpn.ArcCW then return end

    if GetViewEntity() == LocalPlayer() then return end

    wpn:KillFlashlightsVM()
end)

concommand.Add("arccw_dev_loadallattmodels", function()
    local e = ClientsideModel("models/weapons/v_pistol.mdl")
    print("created subject", e)
    
    for i, v in pairs(ArcCW.AttachmentTable) do
        if v.Model then
            print("\t- " .. v.Model)
            e:SetModel(v.Model)
        end
    end

    print("removed subject", e)
    e:Remove()
end)
--lua/arccw/client/cl_uc_menu.lua:
local function DoGenericSpawnmenuRightclickMenu(self)
    local clickmenu = DermaMenu()

    clickmenu:AddOption("#spawnmenu.menu.copy", function()
        SetClipboardText(self:GetSpawnName())
    end):SetIcon("icon16/page_copy.png")

    if isfunction(self.OpenMenuExtra) then
        self:OpenMenuExtra(clickmenu)
    end

    clickmenu:Open()
end


CreateClientConVar("arccw_uc_menu", 1, true, false, "Cool menu!", 0, 1) -- extra safety cause     people say it not work

hook.Add( "PopulateWeapons", "UC_AddWeaponContent", function( pnlContent, tree, node )

    if !GetConVar("arccw_uc_menu"):GetBool() then return end

    local AllUCWeapons = {}
    local AllUCWeaponsByPack = {}
    for classname, _ in pairs( weapons.GetList() ) do
        local wep = weapons.Get(_.ClassName)
        if wep.Spawnable and wep.Category == "ArcCW - Urban Coalition" then
            AllUCWeapons[_.ClassName] = wep
        end
    end

    for classname, weapondata in pairs( AllUCWeapons ) do
        local pack = weapondata.UC_CategoryPack or "_Unknown"
        if pack then
            if !AllUCWeaponsByPack[pack] then AllUCWeaponsByPack[pack] = {} end
            table.insert(AllUCWeaponsByPack[pack], classname)
        end
    end

    -- PrintTable(AllUCWeapons)
    -- PrintTable(AllUCWeaponsByPack)

    local NodeToUse = nil
    -- MW base devs, I tried to recreate this spawnmenu stuff without looking at the code for yours
    -- BUT I WAS FUCKING BAWLING MY EYES OUT TRYING TO GET HOW TO DO THIS NEXT LINE
    -- anyways you guys probably are not reading this so i will end it here thank you
    -- ( i had the idea to do this kinda shit like. 2 days before smgs were pushed. i'm fucking crying i crode 😭😭😭 )
    for _, UCNode in pairs(tree:Root():GetChildNodes()) do
        if UCNode:GetText() == "ArcCW - Urban Coalition" then
            NodeToUse = UCNode
            break
        end
    end

    if !NodeToUse then return end

    NodeToUse.DoPopulate = function(self)
        -- If we've already populated it - forget it.
        if (self.PropPanel) then return end

        -- Create the container panel
        self.PropPanel = vgui.Create("ContentContainer", pnlContent)
        self.PropPanel:SetVisible(false)
        self.PropPanel:SetTriggerSpawnlistChange(false)

        for pack, class in SortedPairs( AllUCWeaponsByPack ) do
            local label = vgui.Create("ContentHeader", NodeToUse)
            label:SetText( string.Right( pack, #pack-1 ) )
            self.PropPanel:Add(label)

            local alphabeticallist = {}
            for _, k in pairs(class) do table.insert(alphabeticallist, {AllUCWeapons[k], PrintName = AllUCWeapons[k].PrintName}) end
            for k, e in SortedPairsByMemberValue( alphabeticallist, "PrintName" ) do
                local ent = e[1]
                CreateUCWeapon( self.PropPanel, {
                    nicename	= ent.PrintName or ent.ClassName,
                    spawnname	= ent.ClassName,
                    material	= ent.IconOverride or "entities/" .. ent.ClassName .. ".png",
                    admin		= ent.AdminOnly,

                    uc_manu = ent.Trivia_Manufacturer,
                    uc_year = ent.Trivia_Year,
                    uc_cali = ent.Trivia_Calibre,
                } )
            end

        end
    end

    -- InternalDoClick is called on the first child node before our function override.
    -- Remove its results and regenerate our cool tab
    if tree:Root():GetChildNode(0) == NodeToUse then
        NodeToUse.PropPanel:Remove()
        NodeToUse.PropPanel = nil
        NodeToUse:InternalDoClick()
    end
end )

function CreateUCWeapon(container, obj)
    if !obj.material then return end
    if !obj.nicename then return end
    if !obj.spawnname then return end
    local icon = vgui.Create("UCWepSel", container)
    icon:SetContentType("weapon")
    icon:SetSpawnName(obj.spawnname)

    icon:SetName(obj.nicename, obj.spawnname, {
        manu = obj.uc_manu,
        year = obj.uc_year,
        cali = obj.uc_cali
    })

    icon:SetMaterial(obj.material)
    icon:SetAdminOnly(obj.admin)
    icon:SetColor(Color(135, 206, 250, 255))

    icon.DoClick = function()
        RunConsoleCommand("gm_giveswep", obj.spawnname)
        surface.PlaySound("ui/buttonclickrelease.wav")
    end

    icon.DoMiddleClick = function()
        RunConsoleCommand("gm_spawnswep", obj.spawnname)
        surface.PlaySound("ui/buttonclickrelease.wav")
    end

    icon.OpenMenuExtra = function(self, menu)
        menu:AddOption("#spawnmenu.menu.spawn_with_toolgun", function()
            RunConsoleCommand("gmod_tool", "creator")
            RunConsoleCommand("creator_type", "3")
            RunConsoleCommand("creator_name", obj.spawnname)
        end):SetIcon("icon16/brick_add.png")

        local opt = menu:AddOption("#spawnmenu.menu.use_as_npc_gun", function()
            RunConsoleCommand("gmod_npcweapon", self:GetSpawnName())
        end)

        if self:GetSpawnName() == GetConVar("gmod_npcweapon"):GetString() then
            opt:SetIcon("icon16/monkey_tick.png")
        else
            opt:SetIcon("icon16/monkey.png")
        end
    end

    icon.OpenMenu = DoGenericSpawnmenuRightclickMenu

    if IsValid(container) then
        container:Add(icon)
    end

    return icon
end


-- fixed 
-- timer.Simple(2, function()
--     ArcCW.IncompatibleAddons["2654687324"] = "Prevents Urban Decay's M16 from properly loading."
-- end)

--addons/sh_lounge_chatbox/lua/chatbox/cl_util.lua:
function LOUNGE_CHAT.PaintScroll(panel)
	local styl = LOUNGE_CHAT.Style

	local scr = panel:GetVBar()

    function scr:Paint(w, h)
        draw.RoundedBox(0, AOCW(5), 0, AOCW(10), h, Color(0, 0, 0, 100))
    end

    function scr.btnUp:Paint(w, h)
        --draw.RoundedBox(0, AOCW(5), 0, AOCW(10), h, Color(175, 175, 175))
    end

    function scr.btnDown:Paint(w, h)
        --draw.RoundedBox(0, AOCW(5), 0, AOCW(10), h, Color(175, 175, 175))
    end

    function scr.btnGrip:Paint(w, h)
        draw.RoundedBox(0, AOCW(5), 0, AOCW(10), h, Color(255, 255, 255))
    end
end

function LOUNGE_CHAT.Menu()
	local styl = LOUNGE_CHAT.Style

	if (IsValid(_LOUNGE_CHAT_MENU)) then
		_LOUNGE_CHAT_MENU:Remove()
	end

	local th = 48 * _LOUNGE_CHAT_SCALE
	local m = th * 0.25

	local cancel = vgui.Create("DPanel")
	cancel:SetDrawBackground(false)
	cancel:StretchToParent(0, 0, 0, 0)
	cancel:MoveToFront()
	cancel:MakePopup()

	local pnl = vgui.Create("DPanel")
	pnl:SetDrawBackground(false)
	pnl:SetSize(20, 1)
	pnl.AddOption = function(me, text, callback)
		surface.SetFont("LOUNGE_CHAT_16")
		local wi, he = surface.GetTextSize(text)
		wi = wi + m * 2
		he = he + m

		me:SetWide(math.max(wi, me:GetWide()))
		me:SetTall(pnl:GetTall() + he)

		local btn = vgui.Create("DButton", me)
		btn:SetText(text)
		btn:SetFont("LOUNGE_CHAT_16")
		btn:SetColor(styl.text)
		btn:Dock(TOP)
		btn:SetSize(wi, he)
		btn.Paint = function(me, w, h)
			surface.SetDrawColor(styl.menu)
			surface.DrawRect(0, 0, w, h)

			if (me.Hovered) then
				surface.SetDrawColor(styl.hover)
				surface.DrawRect(0, 0, w, h)
			end

			if (me:IsDown()) then
				surface.SetDrawColor(styl.hover)
				surface.DrawRect(0, 0, w, h)
			end
		end
		btn.DoClick = function(me)
			callback()
			pnl:Close()
		end
	end
	pnl.Open = function(me)
		me:SetPos(gui.MouseX(), gui.MouseY())
		me:MakePopup()
	end
	pnl.Close = function(me)
		if (me.m_bClosing) then
			return end

		me.m_bClosing = true
		me:AlphaTo(0, LOUNGE_CHAT.Anims.FadeOutTime, 0, function()
			me:Remove()
		end)
	end
	_LOUNGE_CHAT_MENU = pnl

	cancel.OnMouseReleased = function(me, mc)
		pnl:Close()
	end
	cancel.Think = function(me)
		if (!IsValid(pnl)) then
			me:Remove()
		end
	end

	return pnl
end

function LOUNGE_CHAT.Label(text, font, color, parent)
	local label = vgui.Create("DLabel")
	label:SetFont(font)
	label:SetText(text)
	label:SetColor(color)
	if (parent) then
		label:SetParent(parent)
	end
	label:SizeToContents()
	label:SetMouseInputEnabled(false)

	return label
end

function LOUNGE_CHAT.NumSlider(parent)
	local slider = vgui.Create("DNumSlider", parent)
	slider.TextArea:SetTextColor(LOUNGE_CHAT.Color("text"))
	slider.TextArea:SetFont("LOUNGE_CHAT_16")
	slider.TextArea:SetDrawLanguageID(false)
	slider.TextArea:SetCursorColor(LOUNGE_CHAT.Color("text"))
	slider.Label:SetVisible(false)
	slider.Slider.Paint = function(me, w, h)
		draw.RoundedBox(0, 0, h * 0.5 - 1, w, 2, LOUNGE_CHAT.Color("bg"))
	end
	slider.Slider.Knob.Paint = function(me, w, h)
		draw.RoundedBox(4, 0, 0, w, h, LOUNGE_CHAT.Color("header"))

		if (me.Hovered) then
			surface.SetDrawColor(LOUNGE_CHAT.Color("hover"))
			surface.DrawRect(0, 0, w, h)
		end

		if (me:IsDown()) then
			surface.SetDrawColor(LOUNGE_CHAT.Color("hover"))
			surface.DrawRect(0, 0, w, h)
		end
	end

	return slider
end

local matChecked = Material("shenesis/chat/checked.png", "noclamp smooth")

function LOUNGE_CHAT.Checkbox(text, cvar, parent)
	local pnl = vgui.Create("DPanel", parent)
	pnl:SetDrawBackground(false)
	pnl:SetTall(draw.GetFontHeight("LOUNGE_CHAT_20_B"))

		local lbl = LOUNGE_CHAT.Label(LOUNGE_CHAT.Lang(text), "LOUNGE_CHAT_20", LOUNGE_CHAT.Color("text"), pnl)
		lbl:Dock(FILL)

		local chk = vgui.Create("DCheckBox", pnl)
		chk:SetConVar(cvar)
		chk:SetWide(pnl:GetTall() - 4)
		chk:Dock(RIGHT)
		chk:DockMargin(2, 2, 2, 2)
		chk.Paint = function(me, w, h)
			if (me:GetChecked()) then
				draw.RoundedBox(4, 0, 0, w, h, LOUNGE_CHAT.Color("header"))

				surface.SetDrawColor(LOUNGE_CHAT.Color("text"))
				surface.SetMaterial(matChecked)
				surface.DrawTexturedRectRotated(w * 0.5, h * 0.5, h - 4, h - 4, 0)
			else
				draw.RoundedBox(4, 0, 0, w, h, LOUNGE_CHAT.Color("bg"))
			end
		end

	return pnl
end

function LOUNGE_CHAT.Button(text, parent, callback)
	local btn = vgui.Create("DButton", parent)
	if (istable(text)) then
		btn:SetText(LOUNGE_CHAT.Lang(unpack(text)))
	else
		btn:SetText(LOUNGE_CHAT.Lang(text))
	end
	btn:SetFont("LOUNGE_CHAT_16")
	btn:SetTextColor(LOUNGE_CHAT.Color("text"))
	btn.Paint = function(me, w, h)
		draw.RoundedBox(4, 0, 0, w, h, LOUNGE_CHAT.Color(me.m_bAlternateBG and "bg" or "inbg"))

		if (me.Hovered) then
			draw.RoundedBox(4, 0, 0, w, h, LOUNGE_CHAT.Color("hover"))
		end

		if (me:IsDown()) then
			draw.RoundedBox(4, 0, 0, w, h, LOUNGE_CHAT.Color("hover"))
		end
	end
	btn.DoClick = function(me)
		callback(me)
	end

	return btn
end

// https://facepunch.com/showthread.php?t=1522945&p=50524545&viewfull=1#post50524545
local sin, cos, rad = math.sin, math.cos, math.rad
local rad0 = rad(0)
local function DrawCircle(x, y, radius, seg)
	local cir = {
		{x = x, y = y}
	}

	for i = 0, seg do
		local a = rad((i / seg) * -360)
		table.insert(cir, {x = x + sin(a) * radius, y = y + cos(a) * radius})
	end

	table.insert(cir, {x = x + sin(rad0) * radius, y = y + cos(rad0) * radius})
	surface.DrawPoly(cir)
end

local chat_roundavatars = CreateClientConVar("lounge_chat_roundavatars", 1, true, false)

function LOUNGE_CHAT:Avatar(ply, siz, par)
	if (!isstring(ply) and !IsValid(ply)) then
		return end

	siz = siz or 32
	local hsiz = siz * 0.5

	local url = "http://steamcommunity.com/profiles/" .. (isstring(ply) and ply or ply:SteamID64())

	local pnl = vgui.Create("DPanel", par)
	pnl:SetSize(siz, siz)
	pnl:SetDrawBackground(false)
	pnl.Paint = function() end

		local av = vgui.Create("AvatarImage", pnl)
		if (isstring(ply)) then
			av:SetSteamID(ply, siz)
		else
			av:SetPlayer(ply, siz)
		end
		av:SetPaintedManually(true)
		av:SetSize(siz, siz)
		av:Dock(FILL)

			-- TODO: refresh on lang change
			local btn = vgui.Create("DButton", av)
			btn:SetToolTip(self.Lang("click_here_to_view_x_profile", isstring(ply) and ply or ply:Nick()))
			btn:SetText("")
			btn:Dock(FILL)
			btn.Paint = function() end
			btn.DoClick = function(me)
				gui.OpenURL(url)
			end

	pnl.Paint = function(me, w, h)
		if (chat_roundavatars:GetBool()) then
			render.ClearStencil()
			render.SetStencilEnable(true)

			render.SetStencilWriteMask(1)
			render.SetStencilTestMask(1)

			render.SetStencilFailOperation(STENCILOPERATION_REPLACE)
			render.SetStencilPassOperation(STENCILOPERATION_ZERO)
			render.SetStencilZFailOperation(STENCILOPERATION_ZERO)
			render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_NEVER)
			render.SetStencilReferenceValue(1)

			draw.NoTexture()
			surface.SetDrawColor(color_black)
			DrawCircle(hsiz, hsiz, hsiz, hsiz)

			render.SetStencilFailOperation(STENCILOPERATION_ZERO)
			render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
			render.SetStencilZFailOperation(STENCILOPERATION_ZERO)
			render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
			render.SetStencilReferenceValue(1)

			av:PaintManual()

			render.SetStencilEnable(false)
			render.ClearStencil()
		else
			av:PaintManual()
		end
	end

	return pnl
end

function LOUNGE_CHAT.Color(c)
	return LOUNGE_CHAT.Style[c]
end

function LOUNGE_CHAT.Lang(s, ...)
	return string.format(LOUNGE_CHAT.Language[s] or s, ...)
end

function LOUNGE_CHAT.ParseColor(col)
	if (istable(col) and col.r) then
		return col
	end

	if (isstring(col)) then
		local h = LOUNGE_CHAT.Colors[col:lower()]
		if (h) then
			return LOUNGE_CHAT.HexToColor(h)
		elseif (col:len() == 6) then
			return LOUNGE_CHAT.HexToColor(col)
		else
			local _, __, r, g, b = string.find(col, "(%d+),(%d+),(%d+)")
			if (r and g and b) then
				return Color(r, g, b)
			end
		end
	end

	return color_white
end

function LOUNGE_CHAT.ColorToHex(col)
	local nR, nG, nB = col.r, col.g, col.b

    local sColor = ""
    nR = string.format("%X", nR)
    sColor = sColor .. ((string.len(nR) == 1) and ("0" .. nR) or nR)
    nG = string.format("%X", nG)
    sColor = sColor .. ((string.len(nG) == 1) and ("0" .. nG) or nG)
    nB = string.format("%X", nB)
    sColor = sColor .. ((string.len(nB) == 1) and ("0" .. nB) or nB)

    return sColor
end

function LOUNGE_CHAT.HexToColor(hex)
	if (type(hex) ~= "string") then
		return end

	hex = hex:gsub("#","")
	local r, g, b = tonumber("0x"..hex:sub(1, 2)), tonumber("0x"..hex:sub(3, 4)), tonumber("0x"..hex:sub(5, 6))

	return Color(r or 255, g or 255, b or 255)
end

function LOUNGE_CHAT.Timestamp(time)
	return os.date(LOUNGE_CHAT.TimestampFormat, time or os.time())
end

function LOUNGE_CHAT.GetDownloadedImage(url)
	local filename = util.CRC(url)
	local path = LOUNGE_CHAT.ImageDownloadFolder .. "/" .. filename .. ".png"

	if (file.Exists(path, "DATA")) then
		return Material("data/" .. path, "noclamp smooth")
	else
		return false
	end
end

function LOUNGE_CHAT.DownloadImage(url, success, failed)
	local filename = util.CRC(url)
	local path = LOUNGE_CHAT.ImageDownloadFolder .. "/" .. filename .. ".png"

	failed = failed or function() end

	http.Fetch(url, function(body)
		if (!body) then
			failed()
			return
		end

		if (!file.IsDir(LOUNGE_CHAT.ImageDownloadFolder, "DATA")) then
			file.CreateDir(LOUNGE_CHAT.ImageDownloadFolder)
		end

		local ok = pcall(function()
			file.Write(path, body)
			success(Material("data/" .. path, "noclamp smooth"))
		end)

		if (!ok) then
			failed()
		end
	end)
end

local floor = math.floor

function LOUNGE_CHAT.SecondsToEnglish(d, s)
	s = s or false
	d = math.max(0, math.Round(d))
	local tbl = {}

	if (d >= 31556926) then
		local i = floor(d / 31556926)
		table.insert(tbl, i .. (s and "y" or " year" .. (i > 1 and "s" or "")))
		d = d % 31556926
	end
	if (d >= 2678400) then
		local i = floor(d / 2678400)
		table.insert(tbl, i .. (s and "m" or " month" .. (i > 1 and "s" or "")))
		d = d % 2678400
	end
	if (d >= 86400) then
		local i = floor(d / 86400)
		table.insert(tbl, i .. (s and "d" or " day" .. (i > 1 and "s" or "")))
		d = d % 86400
	end
	if (d >= 3600) then
		local i = floor(d / 3600)
		table.insert(tbl, i .. (s and "h" or " hour" .. (i > 1 and "s" or "")))
		d = d % 3600
	end
	if (d >= 60) then
		local i = floor(d / 60)
		table.insert(tbl, i .. (s and "min" or " minute" .. (i > 1 and "s" or "")))
		d = d % 60
	end
	if (d > 0) then
		table.insert(tbl, d .. (s and "s" or " second" .. (d > 1 and "s" or "")))
	end

	return table.concat(tbl, ", ")
end

LOUNGE_CHAT.utf8 = {}

function LOUNGE_CHAT.utf8.sub(str, s, e)
	str = utf8.force(str)

	s = s or 1
	e = e or str:len()

	local maxchars = -1
	if (e < 0) then -- starting from the end
		maxchars = utf8.len(str) - math.abs(e)
		e = str:len()
	end

	local ns = ""
	for p, c in utf8.codes(str) do
		if (p < s) or (c == 2560) then
			continue
		elseif (p > e) then
			break end

		local ch
		local ok = pcall(function()
			ch = utf8.char(c)
		end)

		if (!ok) then
			continue end

		ns = ns .. ch

		if (maxchars > 0) then
			maxchars = maxchars - 1

			if (maxchars == 0) then
				break
			end
		end
	end

	return ns
end

function LOUNGE_CHAT.sub(str, s, e)
	if (LOUNGE_CHAT.UseUTF8) then
		return LOUNGE_CHAT.utf8.sub(str, s, e)
	else
		return string.sub(str, s, e)
	end
end
--addons/fspectate/lua/sh_cami.lua:
--[[
CAMI - Common Admin Mod Interface.
Makes admin mods intercompatible and provides an abstract privilege interface
for third party addons.

IMPORTANT: This is a draft script. It is very much WIP.

Follows the specification on this page:
https://docs.google.com/document/d/1QIRVcAgZfAYf1aBl_dNV_ewR6P25wze2KmUVzlbFgMI


Structures:
	CAMI_USERGROUP, defines the charactaristics of a usergroup:
	{
		Name
			string
			The name of the usergroup
		Inherits
			string
			The name of the usergroup this usergroup inherits from
	}

	CAMI_PRIVILEGE, defines the charactaristics of a privilege:
	{
		Name
			string
			The name of the privilege
		MinAccess
			string
			One of the following three: user/admin/superadmin
		HasAccess
			function(
				privilege :: CAMI_PRIVILEGE,
				actor     :: Player,
				target    :: Player
			) :: bool
			optional
			Function that decides whether a player can execute this privilege,
			optionally on another player (target).
	}
]]

-- Version number in YearMonthDay format.
local version = 20150902.1

if CAMI and CAMI.Version >= version then return end

CAMI = CAMI or {}
CAMI.Version = version

--[[
usergroups
	Contains the registered CAMI_USERGROUP usergroup structures.
	Indexed by usergroup name.
]]
local usergroups = CAMI.GetUsergroups and CAMI.GetUsergroups() or {
	user = {
		Name = "user",
		Inherits = "user"
	},
	admin = {
		Name = "admin",
		Inherits = "user"
	},
	superadmin = {
		Name = "superadmin",
		Inherits = "admin"
	}
}

--[[
privileges
	Contains the registered CAMI_PRIVILEGE privilege structures.
	Indexed by privilege name.
]]
local privileges = CAMI.GetPrivileges and CAMI.GetPrivileges() or {}

--[[
CAMI.RegisterUsergroup
	Registers a usergroup with CAMI.

	Parameters:
		usergroup
			CAMI_USERGROUP
			(see CAMI_USERGROUP structure)
		source
			any
			Identifier for your own admin mod. Can be anything.
			Use this to make sure CAMI.RegisterUsergroup function and the
			CAMI.OnUsergroupRegistered hook don't cause an infinite loop



	Return value:
		CAMI_USERGROUP
			The usergroup given as argument.
]]
function CAMI.RegisterUsergroup(usergroup, source)
	usergroups[usergroup.Name] = usergroup

	hook.Call("CAMI.OnUsergroupRegistered", nil, usergroup, source)
	return usergroup
end

--[[
CAMI.UnregisterUsergroup
	Unregisters a usergroup from CAMI. This will call a hook that will notify
	all other admin mods of the removal.

	Call only when the usergroup is to be permanently removed.

	Parameters:
		usergroupName
			string
			The name of the usergroup.
		source
			any
			Identifier for your own admin mod. Can be anything.
			Use this to make sure CAMI.UnregisterUsergroup function and the
			CAMI.OnUsergroupUnregistered hook don't cause an infinite loop

	Return value:
		bool
			Whether the unregistering succeeded.
]]
function CAMI.UnregisterUsergroup(usergroupName, source)
	if not usergroups[usergroupName] then return false end

	local usergroup = usergroups[usergroupName]
	usergroups[usergroupName] = nil

	hook.Call("CAMI.OnUsergroupUnregistered", nil, usergroup, source)

	return true
end

--[[
CAMI.GetUsergroups
	Retrieves all registered usergroups.

	Return value:
		Table of CAMI_USERGROUP, indexed by their names.
]]
function CAMI.GetUsergroups()
	return usergroups
end

--[[
CAMI.GetUsergroup
	Receives information about a usergroup.

	Return value:
		CAMI_USERGROUP
			Returns nil when the usergroup does not exist.
]]
function CAMI.GetUsergroup(usergroupName)
	return usergroups[usergroupName]
end

--[[
CAMI.UsergroupInherits
	Returns true when usergroupName1 inherits usergroupName2.
	Note that usergroupName1 does not need to be a direct child.
	Every usergroup trivially inherits itself.

	Parameters:
		usergroupName1
			string
			The name of the usergroup that is queried.
		usergroupName2
			string
			The name of the usergroup of which is queried whether usergroupName1
			inherits from.

	Return value:
		bool
			Whether usergroupName1 inherits usergroupName2.
]]
function CAMI.UsergroupInherits(usergroupName1, usergroupName2)
	repeat
		if usergroupName1 == usergroupName2 then return true end

		usergroupName1 = usergroups[usergroupName1] and
						 usergroups[usergroupName1].Inherits or
						 usergroupName1
	until not usergroups[usergroupName1] or
		  usergroups[usergroupName1].Inherits == usergroupName1

	-- One can only be sure the usergroup inherits from user if the
	-- usergroup isn't registered.
	return usergroupName1 == usergroupName2 or usergroupName2 == "user"
end

--[[
CAMI.InheritanceRoot
	All usergroups must eventually inherit either user, admin or superadmin.
	Regardless of what inheritance mechism an admin may or may not have, this
	always applies.

	This method always returns either user, admin or superadmin, based on what
	usergroups eventually inherit.

	Parameters:
		usergroupName
			string
			The name of the usergroup of which the root of inheritance is
			requested

	Return value:
		string
			The name of the root usergroup (either user, admin or superadmin)
]]
function CAMI.InheritanceRoot(usergroupName)
	if not usergroups[usergroupName] then return end

	local inherits = usergroups[usergroupName].Inherits
	while inherits ~= usergroups[usergroupName].Inherits do
		usergroupName = usergroups[usergroupName].Inherits
	end

	return usergroupName
end

--[[
CAMI.RegisterPrivilege
	Registers a privilege with CAMI.
	Note: do NOT register all your admin mod's privileges with this function!
	This function is for third party addons to register privileges
	with admin mods, not for admin mods sharing the privileges amongst one
	another.

	Parameters:
		privilege
			CAMI_PRIVILEGE
			See CAMI_PRIVILEGE structure.

	Return value:
		CAMI_PRIVILEGE
			The privilege given as argument.
]]
function CAMI.RegisterPrivilege(privilege)
	privileges[privilege.Name] = privilege

	hook.Call("CAMI.OnPrivilegeRegistered", nil, privilege)

	return privilege
end

--[[
CAMI.UnregisterPrivilege
	Unregisters a privilege from CAMI. This will call a hook that will notify
	all other admin mods of the removal.

	Call only when the privilege is to be permanently removed.

	Parameters:
		privilegeName
			string
			The name of the privilege.

	Return value:
		bool
			Whether the unregistering succeeded.
]]
function CAMI.UnregisterPrivilege(privilegeName)
	if not privileges[privilegeName] then return false end

	local privilege = privileges[privilegeName]
	privileges[privilegeName] = nil

	hook.Call("CAMI.OnPrivilegeUnregistered", nil, privilege)

	return true
end

--[[
CAMI.GetPrivileges
	Retrieves all registered privileges.

	Return value:
		Table of CAMI_PRIVILEGE, indexed by their names.
]]
function CAMI.GetPrivileges()
	return privileges
end

--[[
CAMI.GetPrivilege
	Receives information about a privilege.

	Return value:
		CAMI_PRIVILEGE when the privilege exists.
			nil when the privilege does not exist.
]]
function CAMI.GetPrivilege(privilegeName)
	return privileges[privilegeName]
end

--[[
CAMI.PlayerHasAccess
	Queries whether a certain player has the right to perform a certain action.
	Note: this function does NOT return an immediate result!
	The result is in the callback!

	Parameters:
		actorPly
			Player
			The player of which is requested whether they have the privilege.
		privilegeName
			string
			The name of the privilege.
		callback
			function(bool, string)
			This function will be called with the answer. The bool signifies the
			yes or no answer as to whether the player is allowed. The string
			will optionally give a reason.
		targetPly
			Optional.
			The player on which the privilege is executed.
		extraInfoTbl
			Optional.
			Table containing extra information.
			Officially supported members:
				Fallback
					string
					Either of user/admin/superadmin. When no admin mod replies,
					the decision is based on the admin status of the user.
					Defaults to admin if not given.
				IgnoreImmunity
					bool
					Ignore any immunity mechanisms an admin mod might have.
				CommandArguments
					table
					Extra arguments that were given to the privilege command.

	Return value:
		None, the answer is given in the callback function in order to allow
		for the admin mod to perform e.g. a database lookup.
]]
-- Default access handler
local defaultAccessHandler = {["CAMI.PlayerHasAccess"] =
	function(_, actorPly, privilegeName, callback, _, extraInfoTbl)
		-- The server always has access in the fallback
		if not IsValid(actorPly) then return callback(true, "Fallback.") end

		local priv = privileges[privilegeName]

		local fallback = extraInfoTbl and (
			not extraInfoTbl.Fallback and actorPly:IsAdmin() or
			extraInfoTbl.Fallback == "user" and true or
			extraInfoTbl.Fallback == "admin" and actorPly:IsAdmin() or
			extraInfoTbl.Fallback == "superadmin" and actorPly:IsSuperAdmin())


		if not priv then return callback(fallback, "Fallback.") end

		callback(
			priv.MinAccess == "user" or
			priv.MinAccess == "admin" and actorPly:IsAdmin() or
			priv.MinAccess == "superadmin" and actorPly:IsSuperAdmin()
			, "Fallback.")
	end,
	["CAMI.SteamIDHasAccess"] =
	function(_, _, _, callback)
		callback(false, "No information available.")
	end
}
function CAMI.PlayerHasAccess(actorPly, privilegeName, callback, targetPly,
extraInfoTbl)
	hook.Call("CAMI.PlayerHasAccess", defaultAccessHandler, actorPly,
		privilegeName, callback, targetPly, extraInfoTbl)
end

--[[
CAMI.GetPlayersWithAccess
	Finds the list of currently joined players who have the right to perform a
	certain action.
	NOTE: this function will NOT return an immediate result!
	The result is in the callback!

	Parameters:
		privilegeName
			string
			The name of the privilege.
		callback
			function(players)
			This function will be called with the list of players with access.
		targetPly
			Optional.
			The player on which the privilege is executed.
		extraInfoTbl
			Optional.
			Table containing extra information.
			Officially supported members:
				Fallback
					string
					Either of user/admin/superadmin. When no admin mod replies,
					the decision is based on the admin status of the user.
					Defaults to admin if not given.
				IgnoreImmunity
					bool
					Ignore any immunity mechanisms an admin mod might have.
				CommandArguments
					table
					Extra arguments that were given to the privilege command.
]]
function CAMI.GetPlayersWithAccess(privilegeName, callback, targetPly,
extraInfoTbl)
	local allowedPlys = {}
	local allPlys = player.GetAll()
	local countdown = #allPlys

	local function onResult(ply, hasAccess, _)
		countdown = countdown - 1

		if hasAccess then table.insert(allowedPlys, ply) end
		if countdown == 0 then callback(allowedPlys) end
	end

	for _, ply in pairs(allPlys) do
		CAMI.PlayerHasAccess(ply, privilegeName,
			function(...) onResult(ply, ...) end,
			targetPly, extraInfoTbl)
	end
end

--[[
CAMI.SteamIDHasAccess
	Queries whether a player with a steam ID has the right to perform a certain
	action.
	Note: the player does not need to be in the server for this to
	work.

	Note: this function does NOT return an immediate result!
	The result is in the callback!

	Parameters:
		actorSteam
			Player
			The SteamID of the player of which is requested whether they have
			the privilege.
		privilegeName
			string
			The name of the privilege.
		callback
			function(bool, string)
			This function will be called with the answer. The bool signifies the
			yes or no answer as to whether the player is allowed. The string
			will optionally give a reason.
		targetSteam
			Optional.
			The SteamID of the player on which the privilege is executed.
		extraInfoTbl
			Optional.
			Table containing extra information.
			Officially supported members:
				IgnoreImmunity
					bool
					Ignore any immunity mechanisms an admin mod might have.
				CommandArguments
					table
					Extra arguments that were given to the privilege command.

	Return value:
		None, the answer is given in the callback function in order to allow
		for the admin mod to perform e.g. a database lookup.
]]
function CAMI.SteamIDHasAccess(actorSteam, privilegeName, callback,
targetSteam, extraInfoTbl)
	hook.Call("CAMI.SteamIDHasAccess", defaultAccessHandler, actorSteam,
		privilegeName, callback, targetSteam, extraInfoTbl)
end

--[[
CAMI.SignalUserGroupChanged
	Signify that your admin mod has changed the usergroup of a player. This
	function communicates to other admin mods what it thinks the usergroup
	of a player should be.

	Listen to the hook to receive the usergroup changes of other admin mods.

	Parameters:
		ply
			Player
			The player for which the usergroup is changed
		old
			string
			The previous usergroup of the player.
		new
			string
			The new usergroup of the player.
		source
			any
			Identifier for your own admin mod. Can be anything.
]]
function CAMI.SignalUserGroupChanged(ply, old, new, source)
	hook.Call("CAMI.PlayerUsergroupChanged", nil, ply, old, new, source)
end

--[[
CAMI.SignalSteamIDUserGroupChanged
	Signify that your admin mod has changed the usergroup of a disconnected
	player. This communicates to other admin mods what it thinks the usergroup
	of a player should be.

	Listen to the hook to receive the usergroup changes of other admin mods.

	Parameters:
		ply
			string
			The steam ID of the player for which the usergroup is changed
		old
			string
			The previous usergroup of the player.
		new
			string
			The new usergroup of the player.
		source
			any
			Identifier for your own admin mod. Can be anything.
]]
function CAMI.SignalSteamIDUserGroupChanged(steamId, old, new, source)
	hook.Call("CAMI.SteamIDUsergroupChanged", nil, steamId, old, new, source)
end

--addons/gm_express_binding/lua/gm_express_bindings/p2m/cl_init.lua:
local GREEN = Color( 50, 200, 50 )
local GREY = Color( 200, 200, 200 )
local ORANGE = Color( 225, 100, 50 )
local BLUE = Color( 93, 145, 240 )

return function( Module )
    function Module.Enable()
        local downloadStart

        express.Receive( "prop2mesh_download", function( objects )
            if downloadStart then
                local diff = math.Round( SysTime() - downloadStart, 2 )
                MsgC(
                    GREEN, "Completed download of ",
                    GREY, #objects,
                    GREEN, " P2M objects in ",
                    GREY, diff,
                    GREEN, " seconds ",
                    GREY, "(",
                    BLUE, "Accelerated by Express",
                    GREY, ")",
                    "\n"
                )
            end
            prop2mesh.downloads = prop2mesh.downloads + #objects

            for _, obj in ipairs( objects ) do
                local crc = obj.crc
                local partData = obj.partData
                if partData then
                    prop2mesh.handleDownload( crc, partData )
                end
            end
        end )

        express.ReceivePreDl( "prop2mesh_download", function( _, _, size )
            downloadStart = SysTime()
            size = string.NiceSize( size )
            MsgC( GREEN, "Starting Accelerated P2M download ", GREY, "(", ORANGE, size, GREY, ")", "\n" )
        end )
    end

    function Module.Disable()
        express.ClearReceiver( "prop2mesh_download" )
    end
end

--addons/gm_express/lua/gm_express/sh_init.lua:
AddCSLuaFile()

require( "sfs" )
if SERVER then
    util.AddNetworkString( "express" )
    util.AddNetworkString( "express_proof" )
    util.AddNetworkString( "express_small" )
    util.AddNetworkString( "express_receivers_made" )
end

express = {}
express._receivers = {}
express._protocol = "http"
express._maxRetries = 35
express._awaitingProof = {}
express._preDlReceivers = {}
express._maxDataSize = 100 * 1024 * 1024
express._jsonHeaders = {
    ["Accept"] = "application/json",
    ["Content-Type"] = "application/json"
}
express._bytesHeaders = {
    ["Accept"] = "application/octet-stream"
}


-- Removes a receiver --
function express.ClearReceiver( message )
    message = string.lower( message )
    express._receivers[message] = nil
end


-- Registers a PreDownload receiver --
function express.ReceivePreDl( message, preDl )
    message = string.lower( message )
    express._preDlReceivers[message] = preDl
end


-- Given prepared data, sends it to the API --
function express:Put( data, cb )
    local success = function( code, body )
        express._checkResponseCode( code )

        local response = util.JSONToTable( body )
        assert( response, "Invalid JSON" )
        assert( response.id, "No ID returned" )

        cb( response.id )
    end

    local failed = function( reason )
        error( "Express: Failed to upload data: " .. reason )
    end

    self.HTTP( {
        method = "POST",
        url = self:makeAccessURL( "write" ),
        body = data,
        success = success,
        failed = failed,
        headers = {
            ["Accept"] = "application/json"
        },
        type = "application/octet-stream",
        timeout = CLIENT and 240 or 60
    } )
end


-- Runs the express receiver for the given message --
function express:Call( message, ply, data )
    local cb = self:_getReceiver( message )
    if not cb then return end

    if CLIENT then return cb( data ) end
    if SERVER then return cb( ply, data ) end
end


-- Runs the express pre-download receiver for the given message --
function express:CallPreDownload( message, ply, id, size, needsProof )
    local cb = self:_getPreDlReceiver( message )
    if not cb then return end

    if CLIENT then return cb( message, id, size, needsProof ) end
    if SERVER then return cb( message, ply, id, size, needsProof ) end
end


-- Handles a net message containing an ID to download from the API --
function express.OnMessage( _, ply )
    local message = net.ReadString()
    if not express:_getReceiver( message ) then
        error( "Express: Received a message that has no listener! (" .. message .. ")" )
    end

    local id = net.ReadString()
    local needsProof = net.ReadBool()

    local function makeRequest( size )
        if size then
            local check = express:CallPreDownload( message, ply, id, size, needsProof )
            if check == false then return end
        end

        express:_get( id, function( data, hash )
            express:Call( message, ply, data )

            if not needsProof then return end

            net.Start( "express_proof" )
            net.WriteString( hash )
            express.shSend( ply )
        end )
    end

    if express:_getPreDlReceiver( message ) then
        if SERVER then
            -- Server decides for itself
            return express:_getSize( id, makeRequest )
        else
            -- Clients trust the server
            local size = net.ReadUInt( 27 )
            return makeRequest( size )
        end
    end

    makeRequest()
end

-- Handles a net message with data sent via NetStream
function express.OnSmallMessage( _, ply )
    local message = net.ReadString()

    local hasReceiver = express:_getReceiver( message )

    local id = "netstream:" .. message
    local size = net.ReadUInt( 27 )
    local needsProof = net.ReadBool()

    if hasReceiver then
        local shouldHalt = false

        if express:_getPreDlReceiver( message ) then
            local check = express:CallPreDownload( message, ply, id, size, needsProof )
            if check == false then
                shouldHalt = true
            end
        end

        net.ReadStream( ply, function( body )
            -- FIXME: Still calls the onProof callbacak even if we exit early
            if shouldHalt then return end

            express.HandleReceivedData( body, "", function( data )
                express:Call( message, ply, data )
            end )
        end )
    else
        -- We have to read it even if we don't want it, otherwise it stays in the sender's WriteStreams
        -- FIXME: This still calls the onProof callback if it's provided
        net.ReadStream( ply, function()
            error( "Express: Received a message that has no listener! (" .. message .. ")" )
        end )
    end
end


-- Handles a net message containing a proof of data download --
function express.OnProof( _, ply )
    -- Server prefixes the hash with the player's Steam ID
    local prefix = ply and ply:SteamID64() .. "-" or ""
    local hash = prefix .. net.ReadString()
    print( "Received express proof", hash )

    local cb = express._awaitingProof[hash]
    if not cb then return end

    ProtectedCall( cb, ply )
    express._awaitingProof[hash] = nil
end


function express.HTTP( tbl )
    return (express.HTTP_Override or _G.HTTP)( tbl )
end


net.Receive( "express", express.OnMessage )
net.Receive( "express_proof", express.OnProof )
net.Receive( "express_small", express.OnSmallMessage )

include( "sh_helpers.lua" )

if SERVER then
    include( "sv_init.lua" )
    AddCSLuaFile( "cl_init.lua" )
else
    include( "cl_init.lua" )
end

do
    local loaded = false
    local function alertLoad()
        loaded = true
        hook.Run( "ExpressLoaded" )
    end

    -- FIXME: This doesn't work in all gamemodes, what should we use instead?
    hook.Add( "CreateTeams", "ExpressLoaded", alertLoad )

    -- A backup in case our CreateTeams hook is never called
    hook.Add( "Think", "ExpressLoadedBackup", function()
        hook.Remove( "Think", "ExpressLoadedBackup" )
        if loaded then return end

        alertLoad()
    end )
end

--addons/aocrp_map/lua/gmaps/sh_gmaps.lua:
gmaps.POIRed = Color(200,40,40)
-- gmaps.POIGreen = Color(55,206,0)
-- gmaps.POIBlue = Color(0,115,246)

gmaps.NavPath = Color(208,0,0)
gmaps.NavFlag = Color(228,228,0)
gmaps.Teal = Color(118,210,255)
gmaps.Player = Color(0,130,200)
gmaps.Null = Color(220,220,220,255)

gmaps.Config.Maps[game.GetMap()] = gmaps.Config.Maps[game.GetMap()] or {nav=true}

gmaps.POI = gmaps.POI or {}

function gmaps.CanSee(poi,ply)
	if !poi then return false
	else 
		local can = hook.Run("CanSeePOI",poi,ply)
		if can != nil then return can
		elseif !istable(poi.privacy) then return true
		elseif (poi.owner == ply) then return true
		else
			if nut then
				if (table.HasValue(poi.privacy,ply:getFaction())) or (table.HasValue(poi.privacy,ply)) then return true
				else return false end
			else
				if (table.HasValue(poi.privacy,ply:Team())) or (table.HasValue(poi.privacy,ply)) then return true
				else return false end
			end
		end
	end
end

function gmaps.CanNavigate()
	return gmaps.Config.Maps[game.GetMap()].nav
end

local meta = FindMetaTable("Player")
function meta.GMapsLimit(ply,limit)
	assert(gmaps.Config.Limits[limit]!=nil, "Tried to get a limit which does not exist: "..limit.."\n")
	local copy = {}
	local i = 0
	for k,v in pairs(gmaps.Config.Limits[limit]) do
		i=i+1
		copy[i]={k,v}
	end
	table.sort(copy,function(a,b) return (a[2] == -1) and (a[2] < b[2]) end)
	
	local adminfunc = ply.CheckGroup and ply.CheckGroup or ply.IsUserGroup
	for k,v in ipairs(copy) do
		if adminfunc(ply,v[1]) then
			return v[2]
		end
	end
	
	return -1
	
end
function meta.GMapsPermission(ply,perm)
	assert(gmaps.Config.Permissions[perm]!=nil, "Tried to get a permission which does not exist: "..perm.."\n")
	local adminfunc = ply.CheckGroup and ply.CheckGroup or ply.IsUserGroup
	
	return adminfunc(ply,gmaps.Config.Permissions[perm])
	
end
if not meta.CheckGroup then
	timer.Simple(.01,function()
		if serverguard then
			function meta:CheckGroup(rank)
				local rankData = serverguard.ranks:GetRank(rank);

				if (rankData) then
					return serverguard.player:GetImmunity(self) >= rankData.immunity;
				end;
				
				return false
			end;
		end
	end)
end

--Holy shit this is a stupid workaround for a stupid issue.
--TODO: cache min/max for better optimization.
--http://www.codewithc.com/c-program-for-lagrange-interpolation/
function math.LagrangeInterpolation(points,x)
	local min,max = points[1].y, points[1].y
	local y=0
	local s,t = 1,1
	local h = "0"
	for i=1, #points do
		min,max = points[i].y < min and points[i].y or min, points[i].y > max and points[i].y or max
		s=1;
		t=1;
		for j=1, #points do
			if(j!=i) then
				s=s*(x-points[j].x);
				t=t*(points[i].x-points[j].x);
			end
		end
		y=y+((s/t)*points[i].y);
	end
	return math.Clamp(y,min,max)
end

function string.BadWord(text)
	for k,v in pairs(gmaps.Config.BannedWords) do
		for w in string.gmatch( text:lower(), string.PatternSafe(v) ) do
			return w
		end
	end
	return false
end
--addons/aocrp_map/lua/gmaps/cl_dallpoi.lua:

local PNL = {}

AccessorFunc(PNL,"m_PNL","Panel")

function PNL:Init()
	
	local items = {}
	
	InstallBlur(self)
	
	self:SetSize(300,491)
	self:DockPadding(5,32,5,5)
	self:MakePopup()
	self:Center()
	self:SetScreenLock(true)
	
	-- self:ShowCloseButton(false)
	
	self.lblTitle:SetFont("gmaps_FrameTitle")
	-- self.lblTitle:SetTextColor(Color(255,255,255))
	self.lblTitle:SetTextColor(Color(255,255,255))
	self.lblTitle:SetExpensiveShadow(2,Color(0,0,0,200))
	self.lblTitle:SetTall(100)
	self:SetTitle("GMaps - All POI's")
	
	self.AllCheck = vgui.Create("DCheckBoxLabel",self)
	self.AllCheck:Dock(BOTTOM)
	self.AllCheck:DockMargin(0,5,0,0)
	self.AllCheck:SetText("Show private POI's? (Admin only)")
	self.AllCheck.Label:SetFont("gmaps_Details")
	self.AllCheck.Label:SetTextColor(Color(255,255,255))
	self.AllCheck.Label:SetExpensiveShadow(1,Color(0,0,0,200))
	self.AllCheck.Label:SetContentAlignment(4)
	self.AllCheck.Label:Dock(FILL)
	self.AllCheck.Label:DockMargin(20,-1,0,0)
	self.AllCheck:SizeToContents()
	self.AllCheck:SetVisible(LocalPlayer():GMapsPermission("ViewPrivatePOI"))
	function self.AllCheck.OnChange(this,check)
		for k,v in SortedPairsByMemberValue(items,"name")do
			v:SetVisible(check or v.cansee)
		end
		self:InvalidateChildren()
	end
	
	self.List = vgui.Create("DScrollPanel",self)
	self.List:Dock(FILL)
	
	local is = gmaps.Config.POISize
	local h = is+24
	local iy = h/2-is/2
	local ix = iy-is*.1
	for k,poi in SortedPairsByMemberValue(gmaps.POI, "name") do
		local cansee = gmaps.CanSee(poi,LocalPlayer())
		local item = vgui.Create("DButton",self.List)
		item.name = poi.name
		item.cansee = cansee
		item:SetVisible(cansee)
		item:SetText("")
		item:SetTooltip(poi.owner:IsPlayer() and "Created by "..poi.owner:Nick() or "Public POI")
		item:Dock(TOP)
		item:DockMargin(0,0,0,5)
		-- item:SetTall(gmaps.Config.POIInfoWidth/1.6)
		item:SetTall(h)
		function item.Paint(this,w,h)
			surface.SetDrawColor(color_black)
			surface.DrawOutlinedRect(0,0,w,h)
			if this.Depressed then
				local r,g,b = poi.color.r/2,poi.color.g/2,poi.color.b/2
				surface.SetDrawColor(Color(r,g,b))
			elseif this.Hovered then
				surface.SetDrawColor(Color(240,240,240))
			else
				surface.SetDrawColor(Color(210,210,210))
			end
			surface.DrawRect(1,1,w-2,h-2)
			
			surface.SetMaterial(Material(poi.icon,"unlitgeneric smooth"))
			surface.SetDrawColor(color_black)
			surface.DrawTexturedRect(ix+1,iy+1,is,is)
			surface.SetDrawColor(poi.color)
			surface.DrawTexturedRect(ix,iy,is,is)
			
			if !cansee then
				surface.SetMaterial(Material("materials/gmaps/hidden.png","unlitgeneric smooth"))
				surface.SetDrawColor(color_black)
				surface.DrawTexturedRect(w-24-7+1,3,24,24)
				surface.SetDrawColor(Color(240,240,0))
				surface.DrawTexturedRect(w-24-7,2,24,24)
			end
		end
		
		function item.DoClick(this)
			local map = self:GetPanel()
			map:CenterOnPOI(poi)
			
			self:Close()
		end
		function item.DoRightClick(this)
			gmaps.POIDetails(poi)
		end
		
		local title = vgui.Create("DLabel",item)
		title:Dock(FILL)
		title:DockMargin(ix+is+ix,0,0,0)
		title:SetContentAlignment(4)
		title:SetFont("gmaps_FrameTitle")
		title:SetText(poi.name)
		title:SetTextColor(poi.color)
		title:SetExpensiveShadow(2,Color(0,0,0,200))
		
		table.insert(items,item)
	end
	
	if self.List.VBar:IsVisible() then
		for k,v in pairs(items)do
			v:DockMargin(1,0,2,5)
		end
	end
	
end

function PNL:PerformLayout()

	local titlePush = 0

	if ( IsValid( self.imgIcon ) ) then

		self.imgIcon:SetPos( 5, 5 )
		self.imgIcon:SetSize( 16, 16 )
		titlePush = 16

	end

	self.btnClose:SetPos( self:GetWide() - 31 - 4, 0 )
	self.btnClose:SetSize( 31, 31 )

	self.btnMaxim:SetPos( self:GetWide() - 31 * 2 - 4, 0 )
	self.btnMaxim:SetSize( 31, 31 )

	self.btnMinim:SetPos( self:GetWide() - 31 * 3 - 4, 0 )
	self.btnMinim:SetSize( 31, 31 )

	self.lblTitle:SetPos( 8 + titlePush, 2 )
	self.lblTitle:SetSize( self:GetWide() - 25 - titlePush, 30 )

end

function PNL:OnFocusChanged(b)
	if !b and vgui.FocusedHasParent( self ) then
		self:Close()
	end
end


vgui.Register("DAllPOI",PNL,"DFrame")
--addons/billy_gas/lua/gmodadminsuite/modules/commands/lang/chinese.lua:
return {
    Name = "Chinese",
    Flag = "flags16/cn.png",
    Phrases = function()
        return {
            module_name = "命令管理器",

            no_permission = "对不起，您没有使用这个命令的权限。",
            commands = "命令",
            command = "命令",
            action = "操作",
            help = "帮助",
            new_command = "+ 新命令",
            wiki = "维基",
            run_command = "运行命令",
            edit_command = "编辑命令",
            form_help = "帮助文本...（可选）",
            form_help_tip = "这是在命令菜单的“帮助”列中显示的文本。",
            select_action = "选择操作...",
            hide_in_chat = "在聊天中隐藏？",
            hide_in_chat_tip = "如果选中，当有人输入时命令将不会在聊天中显示。",
            finished = "完成",
            commands_case_insensitive = "所有命令都不区分大小写。",
            ok = "确定",
            cannot_create_command = "无法创建命令！",
            cancel = "取消",
            delete_command = "删除命令",
            copy_command = "复制命令",
            permissions = "权限",
            permissions_editor = "打开权限编辑器",
            permissions_tip = "允许您对用户组和团队/职业进行白名单和黑名单设置。",
            can_access_command = "可以访问命令",
            teams = "团队",
            usergroups = "用户组",
            anyone_can_access = "任何人都可以访问这个命令",
            whitelisted_only = "只有白名单中的人可以访问这个命令",
            non_blacklisted_only = "只有非黑名单中的人可以访问这个命令",
            whitelisted_and_blacklisted = "只有白名单中的人（除了黑名单中的人）可以访问这个命令",
            custom_usergroup = "+ 自定义用户组",
            custom_usergroup_text = "输入用户组",
            custom_usergroup_placeholder = "用户组...",
            reason_usergroup_blacklisted = "您的用户组被禁止使用这个命令。",
            reason_usergroup_not_whitelisted = "您的用户组没有被列入这个命令的白名单。",
            reason_team_blacklisted = "您的团队被禁止使用这个命令。",
            reason_team_not_whitelisted = "您的团队没有被列入这个命令的白名单。",
            saved_exclamation = "已保存！",
            set_position = "设置位置",
            position_set = "位置已设置！",
            set_position_instruction = "前往期望的位置并面向期望的方向",
            set_position_instruction_2 = "完成后，取消固定菜单，然后位置和角度将被保存",

            action_open_commands_menu = "打开命令菜单",
            action_command = "运行控制台命令",
            action_chat = "说出聊天消息",
            action_website = "打开网站",
            action_lua_function_sv = "运行服务器端Lua函数",
            action_lua_function_cl = "运行客户端Lua函数",
            action_gas_module = "打开GAS模块",
            action_teleport = "传送",

            form_action_command = "要运行的控制台命令",
            form_action_chat = "要说的聊天消息",
            form_action_website = "要打开的网站",
            form_action_lua_function_sv = "要运行的服务器端Lua函数",
            form_action_lua_function_cl = "要运行的客户端Lua函数",
            form_action_gas_module = "要打开的GAS模块",
            form_action_teleport = "传送",

            error_command_exists = "这个名称的命令已经存在！",
            error_no_command = "您没有输入命令。",
            error_no_command_execute = "您没有输入要执行的命令。",
            error_no_action = "您没有为这个命令选择一个操作。",
            error_invalid_website = "您输入的网站不是一个有效的URL。",
            error_no_lua_function = "您没有选择要执行的Lua函数。",
            error_no_gas_module = "您没有选择要打开的GAS模块。",
            error_no_position_set = "您没有为这个传送设置位置和角度。",
        }
    end
}

--addons/billy_gas/lua/gmodadminsuite/modules/playerdatabase/lang/chinese.lua:
return {
    Name = "Chinese",
    Flag = "flags16/cn.png",
    Phrases = function()
        return {
            module_name = "玩家数据库",

            right_click_to_focus = "右键点击聚焦",
            steamid = "SteamID",
            name = "名称",
            usergroup = "用户组",
            ip_address = "IP地址",
            last_seen = "最后出现",
            copy_steamid = "复制SteamID",
            copy_steamid64 = "复制SteamID64",
            copy_usergroup = "复制用户组",
            copy_ip_address = "复制IP地址",
            copy_name = "复制名称",
            copy_steam_profile_link = "复制Steam个人资料链接",
            search = "搜索",
            country = "国家",
            copy_country = "复制国家",
            search_usergroup = "搜索用户组",
            search_ip_address = "搜索IP地址",
            search_country = "搜索国家",
            search_name = "搜索名称",
            none = "< 无 >",
            cancel = "取消",
        }
    end
}

--addons/billy_gas/lua/gmodadminsuite/cl_country_codes.lua:
--Source: https://datahub.io/core/country-list

GAS.CountryCodes = GAS.CountryCodes or GAS.spon.decode([[[S02DMS08DominicaS02IOS1EBritish Indian Ocean TerritoryS02FMS1FMicronesia, Federated States ofS02AMS07ArmeniaS02JOS06JordanS02CMS08CameroonS02BMS07BermudaS02FOS0DFaroe IslandsS02AOS06AngolaS02DOS12Dominican RepublicS02BOS1FBolivia, Plurinational State ofS02TKS07TokelauS02ZMS06ZambiaS02COS08ColombiaS02TMS0CTurkmenistanS02RSS06SerbiaS02MSS0AMontserratS02PSS13Palestine, State ofS02PMS19Saint Pierre and MiquelonS02SMS0ASan MarinoS02MMS07MyanmarS02WSS05SamoaS02USS0DUnited StatesS02BQS20Bonaire, Sint Eustatius and SabaS02ROS07RomaniaS02MOS05MacaoS02GQS11Equatorial GuineaS02SOS07SomaliaS02AQS0AAntarcticaS02BSS07BahamasS02TWS19Taiwan, Province of ChinaS02ASS0EAmerican SamoaS02MWS06MalawiS02IQS04IraqS02CRS0ACosta RicaS02ESS05SpainS02GUS04GuamS02ZWS08ZimbabweS02AUS09AustraliaS02UYS07UruguayS02LSS07LesothoS02KMS07ComorosS02PYS08ParaguayS02LUS0ALuxembourgS02AWS05ArubaS02NUS04NiueS02GWS0DGuinea-BissauS02BWS08BotswanaS02IMS0BIsle of ManS02VIS14Virgin Islands, U.S.S02CWS08CuraçaoS02SKS08SlovakiaS02GTS09GuatemalaS02KYS0ECayman IslandsS02ECS07EcuadorS02GSS2CSouth Georgia and the South Sandwich IslandsS02LYS05LibyaS02FIS07FinlandS02KWS06KuwaitS02GIS09GibraltarS02IDS09IndonesiaS02CYS06CyprusS02BYS07BelarusS02ETS08EthiopiaS02HKS09Hong KongS02GYS06GuyanaS02CIS0ECôte d'IvoireS02BBS08BarbadosS02EGS05EgyptS02VUS07VanuatuS02KGS0AKyrgyzstanS02YES05YemenS02GBS0EUnited KingdomS02LIS0DLiechtensteinS02GDS07GrenadaS02LKS09Sri LankaS02ADS07AndorraS02CUS04CubaS02CDS25Congo, the Democratic Republic of theS02KIS08KiribatiS02GMS06GambiaS02LBS07LebanonS02UMS24United States Minor Outlying IslandsS02AFS0BAfghanistanS02SBS0FSolomon IslandsS02GFS0DFrench GuianaS02CGS05CongoS02MFS1ASaint Martin (French part)S02BFS0CBurkina FasoS02CFS18Central African RepublicS02KES05KenyaS02KHS08CambodiaS02NFS0ENorfolk IslandS02EHS0EWestern SaharaS02SDS05SudanS02CNS05ChinaS02MDS14Moldova, Republic ofS02IES07IrelandS02NES05NigerS02CHS0BSwitzerlandS02AGS13Antigua and BarbudaS02WFS11Wallis and FutunaS02TFS1BFrench Southern TerritoriesS02GHS05GhanaS02KNS15Saint Kitts and NevisS02BTS06BhutanS02PFS10French PolynesiaS02BES07BelgiumS02VAS1DHoly See (Vatican City State)S02BJS05BeninS02ILS06IsraelS02NLS0BNetherlandsS02RUS12Russian FederationS02FJS04FijiS02NCS0DNew CaledoniaS02DJS08DjiboutiS02GLS09GreenlandS02INS05IndiaS02ALS07AlbaniaS02THS08ThailandS02CLS05ChileS02SLS0CSierra LeoneS02DES07GermanyS02BLS11Saint BarthélemyS02HNS08HondurasS02PTS08PortugalS02SJS16Svalbard and Jan MayenS02GNS06GuineaS02MYS08MalaysiaS02SSS0BSouth SudanS02BNS11Brunei DarussalamS02TJS0ATajikistanS02MHS10Marshall IslandsS02TLS0BTimor-LesteS02MRS0AMauritaniaS02ARS09ArgentinaS02SRS08SurinameS02PRS0BPuerto RicoS02MLS04MaliS02PWS05PalauS02MQS0AMartiniqueS02TRS06TurkeyS02VNS08Viet NamS02TTS13Trinidad and TobagoS02TNS07TunisiaS02GPS0AGuadeloupeS02STS15Sao Tome and PrincipeS02SNS07SenegalS02PNS08PitcairnS02KPS26Korea, Democratic People's Republic ofS02HUS07HungaryS02BRS06BrazilS02JPS05JapanS02MUS09MauritiusS02TVS06TuvaluS02FRS06FranceS02GRS06GreeceS02SVS0BEl SalvadorS02ERS07EritreaS02YTS07MayotteS02KRS12Korea, Republic ofS02HRS07CroatiaS02IRS19Iran, Islamic Republic ofS02NRS05NauruS02NOS06NorwayS02LRS07LiberiaS02MPS18Northern Mariana IslandsS02SXS19Sint Maarten (Dutch part)S02UZS0AUzbekistanS02MXS06MexicoS02BDS0ABangladeshS02HTS05HaitiS02BVS0DBouvet IslandS02CVS0ACape VerdeS02TDS04ChadS02LVS06LatviaS02MZS0AMozambiqueS02SYS14Syrian Arab RepublicS02SZS09SwazilandS02FKS1BFalkland Islands (Malvinas)S02AXS0EÅland IslandsS02MNS08MongoliaS02MES0AMontenegroS02TZS1CTanzania, United Republic ofS02MVS08MaldivesS02MKS2AMacedonia, the Former Yugoslav Republic ofS02KZS0AKazakhstanS02CXS10Christmas IslandS02NPS05NepalS02NZS0BNew ZealandS02ATS07AustriaS02CAS06CanadaS02BAS16Bosnia and HerzegovinaS02BZS06BelizeS02CZS0ECzech RepublicS02GAS05GabonS02AZS0AAzerbaijanS02ITS05ItalyS02LTS09LithuaniaS02DZS07AlgeriaS02PKS08PakistanS02CCS17Cocos (Keeling) IslandsS02LAS20Lao People's Democratic RepublicS02GGS08GuernseyS02NAS07NamibiaS02MTS05MaltaS02PAS06PanamaS02SAS0CSaudi ArabiaS02GES07GeorgiaS02MAS07MoroccoS02AES14United Arab EmiratesS02PLS06PolandS02LCS0BSaint LuciaS02QAS05QatarS02RWS06RwandaS02MCS06MonacoS02ZAS0CSouth AfricaS02SCS0ASeychellesS02VCS20Saint Vincent and the GrenadinesS02BGS08BulgariaS02TCS18Turks and Caicos IslandsS02JES06JerseyS02EES07EstoniaS02NGS07NigeriaS02PHS0BPhilippinesS02VES21Venezuela, Bolivarian Republic ofS02SHS2CSaint Helena, Ascension and Tristan da CunhaS02PES04PeruS02SES06SwedenS02RES08RéunionS02NIS09NicaraguaS02VGS17Virgin Islands, BritishS02BHS07BahrainS02TGS04TogoS02BIS07BurundiS02UAS07UkraineS02MGS0AMadagascarS02PGS10Papua New GuineaS02SGS09SingaporeS02AIS08AnguillaS02TOS05TongaS02SIS08SloveniaS02OMS04OmanS02CKS0CCook IslandsS02UGS06UgandaS02HMS21Heard Island and McDonald IslandsS02DKS07DenmarkS02JMS07JamaicaS02ISS07Iceland)]])
GAS.CountryCodesReverse = GAS.CountryCodesReverse or GAS:table_Flip(GAS.CountryCodes)
--addons/billy_gas/lua/gmodadminsuite/cl_menubar.lua:
local function L(phrase, ...)
	if (#({...}) == 0) then
		return GAS:Phrase(phrase)
	else
		return GAS:PhraseFormat(phrase, nil, ...)
	end
end

hook.Add("PopulateMenuBar", "gmodadminsuite.menubar", function(p)
	p.GASMenu = p:AddOrGetMenu("GmodAdminSuite")

	p.GASMenu:AddOption(L"open_gas", function()
		RunConsoleCommand("gmodadminsuite")
	end):SetIcon("icon16/shield.png")

	p.GASMenu:AddSpacer()

	for ident, tab in pairs(GAS.Modules.Info) do
		hook.Add("gmodadminsuite:LoadModule:"..ident, "gmodadminsuite.menubar", function()
			p.GASMenu:AddOption(tab.Name, function()
				GAS:PlaySound("popup")
				RunConsoleCommand("gmodadminsuite", ident)
			end):SetIcon(tab.Icon)
			hook.Remove("gmodadminsuite:LoadModule:"..ident, "gmodadminsuite.menubar")
		end)
	end
end)
--addons/billy_gas/lua/gmodadminsuite/cl_selection_prompts.lua:
local function L(phrase, ...)
	if (#({...}) == 0) then
		return GAS:Phrase(phrase)
	else
		return GAS:PhraseFormat(phrase, nil, ...)
	end
end

GAS.SelectionPrompts = {}

function GAS.SelectionPrompts:PromptTeam(callback, _menu, muted)
	if (not muted) then GAS:PlaySound("btn_light") end

	local menu = _menu or DermaMenu()

	if (DarkRP) then
		local categories = {}
		for i,c in ipairs(DarkRP.getCategories().jobs) do
			if (GAS:table_IsEmpty(c.members)) then continue end
			table.insert(categories, {members = c.members, name = c.name, color = c.color})
		end
		table.SortByMember(categories, "name", true)
		for i,v in ipairs(categories) do
			local submenu, _submenu = menu:AddSubMenu(v.name)
			bVGUI_DermaMenuOption_ColorIcon(_submenu, v.color)

			local teams = {}
			for i,t in ipairs(v.members) do
				table.insert(teams, {index = t.team, name = t.name})
			end
			table.SortByMember(teams, "name", true)
			for i,v in ipairs(teams) do
				bVGUI_DermaMenuOption_ColorIcon(submenu:AddOption(v.name, function()
					callback(v.index)
					if (not muted) then GAS:PlaySound("btn_heavy") end
				end), team.GetColor(v.index))
			end
		end
	else
		local teams = {}
		for i,t in ipairs(team.GetAllTeams()) do
			table.insert(teams, {index = i, name = t.Name})
		end
		table.SortByMember(teams, "name", true)
		for i,v in ipairs(teams) do
			bVGUI_DermaMenuOption_ColorIcon(menu:AddOption(v.name, function()
				callback(v.index)
				if (not muted) then GAS:PlaySound("btn_heavy") end
			end), team.GetColor(v.index))
		end
	end

	if (not _menu) then	menu:Open() end
end

function GAS.SelectionPrompts:PromptLuaFunction(callback, _menu, muted)
	if (not muted) then GAS:PlaySound("btn_light") end

	local menu = _menu or DermaMenu()
	local lua_function_names = table.GetKeys(GAS.LuaFunctions)
	table.sort(lua_function_names)
	for i,lua_function_name in ipairs(lua_function_names) do
		bVGUI_DermaMenuOption_GreenToRed(i, #lua_function_names, menu:AddOption(lua_function_name, function()
			callback(lua_function_name, GAS.LuaFunctions[lua_function_name])
			if (not muted) then GAS:PlaySound("btn_heavy") end
		end))
	end
	if (not _menu) then	menu:Open() end
end

function GAS.SelectionPrompts:PromptUsergroup(callback, _menu, muted)
	if (not muted) then GAS:PlaySound("btn_light") end

	local menu = _menu or DermaMenu()
	menu:AddOption(L"custom_ellipsis", function()
		bVGUI.StringQuery(L"add_usergroup", nil, L"usergroup_ellipsis", function(usergroup)
			callback(usergroup)
		end)
	end):SetIcon("icon16/pencil.png")
	menu:AddSpacer()
	local usergroups = {}
	for _,ply in ipairs(player.GetHumans()) do
		for v in pairs(OpenPermissions:GetUserGroups(ply)) do
			usergroups[v] = true
		end
	end
	usergroups = table.GetKeys(usergroups)
	table.sort(usergroups)
	for i,v in ipairs(usergroups) do
		bVGUI_DermaMenuOption_GreenToRed(i, #usergroups, menu:AddOption(v, function()
			callback(v)
			if (not muted) then GAS:PlaySound("btn_heavy") end
		end))
	end
	if (not _menu) then	menu:Open() end
end

function GAS.SelectionPrompts:PromptSteamID64(callback, _menu, muted)
	print("PromptSteamID64 is deprecated")
	GAS.SelectionPrompts:PromptAccountID(function(account_id, ...)
		callback(GAS:AccountIDToSteamID64(account_id, ...))
	end, _menu, play_sound)
end

function GAS.SelectionPrompts:PromptAccountID(callback, _menu, muted, filter)
	if (not muted) then GAS:PlaySound("btn_light") end

	local menu = _menu or DermaMenu()
	menu:AddOption(L"steamid_ellipsis", function()
		bVGUI.StringQuery(L"add_steamid", L("add_steamid_help", LocalPlayer():SteamID(), LocalPlayer():SteamID64()), L"enter_steamid_ellipsis", function(text)
			if (text:find("^STEAM_%d:%d:%d+$")) then
				local ply = player.GetBySteamID(text)
				if (IsValid(ply)) then
					callback(GAS:SteamIDToAccountID(text), ply)
				else
					callback(GAS:SteamIDToAccountID(text))
				end
			elseif (text:find("^7656119%d+$")) then
				local ply = player.GetBySteamID64(text)
				if (IsValid(ply)) then
					callback(GAS:SteamID64ToAccountID(text), ply)
				else
					callback(GAS:SteamID64ToAccountID(text))
				end
			end
		end, function(text)
			if (text:find("^STEAM_%d:%d:%d+$") or text:find("^7656119%d+$")) then
				return true
			end
		end)
	end):SetIcon("materials/gmodadminsuite/steam.png")
	menu:AddSpacer()

	local distance_submenu, pnl = menu:AddSubMenu(L"by_distance") pnl:SetIcon("icon16/world.png")
	local usergroups_submenu, pnl = menu:AddSubMenu(L"by_usergroup") pnl:SetIcon("icon16/group.png")
	local jobs_submenu, pnl = menu:AddSubMenu(L"by_team") pnl:SetIcon("icon16/user_suit.png")
	local players_submenu, pnl = menu:AddSubMenu(L"by_name") pnl:SetIcon("icon16/emoticon_grin.png")

	local stuff_to_add = {
		usergroups = {},
		jobs = {},
		players = {},
		distances = {}
	}
	for _,ply in ipairs(player.GetHumans()) do
		if (filter and filter[ply]) then continue end
		
		table.insert(stuff_to_add.players, {account_id = ply:AccountID(), nick = ply:Nick(), ply = ply})
		table.insert(stuff_to_add.distances, {distance = ply:GetPos():DistToSqr(LocalPlayer():GetPos()), account_id = ply:AccountID(), nick = ply:Nick(), ply = ply})

		local team_name = team.GetName(ply:Team())
		stuff_to_add.jobs[team_name] = stuff_to_add.jobs[team_name] or {}
		table.insert(stuff_to_add.jobs[team_name], {account_id = ply:AccountID(), nick = ply:Nick(), ply = ply})

		for v in pairs(OpenPermissions:GetUserGroups(ply)) do
			stuff_to_add.usergroups[v] = stuff_to_add.usergroups[v] or {}
			table.insert(stuff_to_add.usergroups[v], {account_id = ply:AccountID(), nick = ply:Nick(), ply = ply})
		end
	end

	local usergroups = table.GetKeys(stuff_to_add.usergroups)
	table.sort(usergroups)
	local jobs = table.GetKeys(stuff_to_add.jobs)
	table.sort(jobs)
	local players = stuff_to_add.players
	table.SortByMember(players, "nick")
	local distances = stuff_to_add.distances
	table.SortByMember(distances, "distance")

	local function PlayerInfoOverlay(option, ply)
		function option:OnCursorEntered()
			if (not IsValid(ply)) then return end
			bVGUI.PlayerTooltip.Create({
				canfocus = false,
				player = ply,
				copiedphrase = L"copied",
				focustip = L"right_click_to_focus",
				creator = self
			})
		end
		function option:OnCursorExited()
			bVGUI.PlayerTooltip.Close()
		end
		option.OnMouseReleased_Old = option.OnMouseReleased
		function option:OnMouseReleased(mouse)
			if (mouse == MOUSE_RIGHT) then
				bVGUI.PlayerTooltip.Focus()
			end
			option:OnMouseReleased_Old(mouse)
		end
	end
	for _,ply in ipairs(distances) do
		local option = distance_submenu:AddOption(ply.nick, function()
			if (not muted) then GAS:PlaySound("btn_heavy") end
			callback(ply.account_id, ply.ply)
		end)
		bVGUI_DermaMenuOption_ColorIcon(option, team.GetColor(ply.ply:Team()))
		PlayerInfoOverlay(option, ply.ply)
	end
	for _,ply in ipairs(players) do
		local option = players_submenu:AddOption(ply.nick, function()
			if (not muted) then GAS:PlaySound("btn_heavy") end
			callback(ply.account_id, ply.ply)
		end)
		bVGUI_DermaMenuOption_ColorIcon(option, team.GetColor(ply.ply:Team()))
		PlayerInfoOverlay(option, ply.ply)
	end
	for i,usergroup in ipairs(usergroups) do
		local submenu, _ = usergroups_submenu:AddSubMenu(usergroup)
		bVGUI_DermaMenuOption_GreenToRed(i, #usergroups, _)
		table.SortByMember(stuff_to_add.usergroups[usergroup], "nick")
		for _,ply in ipairs(stuff_to_add.usergroups[usergroup]) do
			local option = submenu:AddOption(ply.nick, function()
				if (not muted) then GAS:PlaySound("btn_heavy") end
				callback(ply.account_id, ply.ply)
			end)
			bVGUI_DermaMenuOption_ColorIcon(option, team.GetColor(ply.ply:Team()))
			PlayerInfoOverlay(option, ply.ply)
		end
	end
	for _,job in ipairs(jobs) do
		local submenu, submenu_option = jobs_submenu:AddSubMenu(job)
		bVGUI_DermaMenuOption_ColorIcon(submenu_option, team.GetColor(GAS:TeamFromName(job)))
		table.SortByMember(stuff_to_add.jobs[job], "nick")
		for _,ply in ipairs(stuff_to_add.jobs[job]) do
			local option = submenu:AddOption(ply.nick, function()
				if (not muted) then GAS:PlaySound("btn_heavy") end
				callback(ply.account_id, ply.ply)
			end)
			bVGUI_DermaMenuOption_ColorIcon(option, team.GetColor(ply.ply:Team()))
			PlayerInfoOverlay(option, ply.ply)
		end
	end

	if (not _menu) then	menu:Open() end
end
--lua/autorun/jabba.lua:
local function AddPlayerModel( name, model )

	list.Set( "PlayerOptionsModel", name, model )
	player_manager.AddValidModel( name, model )
	
end


AddPlayerModel( "Hutt", 		                      "models/hgn/swrp/swrp/hutt_01.mdl" )

--lua/autorun/krsn_ds2_forlorn_npc.lua:
local Category = "Dark Souls 2"

local NPC = {	Name = "Forlorn - Ally",
				Class = "npc_citizen",
				Model = 
"models/kerosenn/dark_souls_2/enemies/forlorn/ds2_forlorn_ally.mdl",
				Health = "250",
				KeyValues = { citizentype = 4 },
				Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" },
				Category = Category }

list.Set( "NPC", "npc_krsn_forlorn_ally", NPC )

local Category = "Dark Souls 2"

local NPC = {	Name = "Forlorn - Enemy",
				Class = "npc_combine_s",
				Model = 
"models/kerosenn/dark_souls_2/enemies/forlorn/ds2_forlorn_enemy.mdl",
				Health = "250",
				Weapons = { "weapon_smg1", "weapon_ar2", "weapon_shotgun" },
				Category = Category }

list.Set( "NPC", "npc_krsn_forlorn_enemy", NPC )

--addons/weapon_jedi/lua/lscs/autorun/lscs_damage.lua:
-- this is where the public saber system differentiates the most from the GVP version.
-- in GVP, since i have full control over what weapon systems to expect, the bullet or damage data is never actually messed with as blood effects, damage, tracer information ect all happen through internal communication with the weapon systems.
-- on a public version however, it can not be done like this as we do not know what kind of weapons there are and if they rely on their callbacks ect. Generally the public version is written in alot more cancerous way, as it has to support a wide range of unknown weapon systems.
-- so instead of preventing it all before it happens, this system just lets it happen and then tries to clean up the mess afterwards. BIG GAY

local meta = FindMetaTable( "Player" )

LSCS_BLOCK_NONSABER = 4
LSCS_BLOCK_PERFECT = 3
LSCS_BLOCK_NORMAL = 2
LSCS_BLOCK = 1
LSCS_UNBLOCKED = 0

function meta:lscsSuppressFalldamage( time )
	self._lscsPreventFallDamageTill = time
end

function meta:lscsIsFalldamageSuppressed()
	if self._lscsPreventFallDamageTill == true then
		return true
	else
		return (self._lscsPreventFallDamageTill or 0) > CurTime()
	end
end

function meta:lscsShouldBleed()
	return self:GetNWBool( "lscsShouldBleed", true ) -- gay
end

if SERVER then
	util.AddNetworkString( "lscs_hitmarker" )

	hook.Add("GetFallDamage", "!!lscs_RemoveFallDamage", function(ply, speed)
		if ply:lscsIsFalldamageSuppressed() then
			return 0
		end
	end)

	-- engine stuff doesnt come with the correct callbacks, tracer name and whatnot
	-- so this must be done manually
	local ClassDeflectable = {
		["npc_turret_floor"] = true,
		["npc_strider"] = true,
		["npc_helicopter"] = true,
		["npc_combinegunship"] = true,
	}
	local AmmoTypeDeflectable = {
		["CombineCannon"] = true, -- dropship container gun, the container gives a NULL entity as attacker and inflictor... amazing stuff
		["AR2"] = true, -- AR2
	}


	-- fix conflict with CAP:Code  https://steamcommunity.com/sharedfiles/filedetails/?id=175394472
	local HookSG = false
	hook.Add( "LSCS:EntityFireBullets", "StarGate.CAP.Code.Fix", function( entity, bullet )
		if HookSG == false then
			local FireBulletsSG = hook.GetTable()["EntityFireBullets"]["StarGate.EntityFireBullets"]

			if isfunction( FireBulletsSG ) then
				HookSG = FireBulletsSG

				return HookSG( entity, bullet )
			else
				HookSG = true
			end
		else
			if HookSG ~= true then
				return HookSG( entity, bullet )
			end
		end
	end)


	hook.Add( "EntityFireBullets", "!!!lscs_deflecting", function( entity, bullet )
		if IsValid( entity ) and entity.IsVJBaseSNPC then return end -- for some reason VJBase npc's act different and already break by doing nothing in this hook. So let's let EntityTakeDamage handle this instead. Don't return anything.

		local oldCallback = bullet.Callback
		bullet.Callback = function(att, tr, dmginfo)
			local ply = tr.Entity

			if IsValid( ply ) and ply:IsPlayer() then
				local wep = ply:GetActiveWeapon()

				if not IsValid( wep ) or not wep.LSCS or dmginfo:GetDamage() == 0 then -- damage = 0... ArcCW... detected...
					if oldCallback then
						oldCallback( att, tr, dmginfo )
					end

					return
				end

				local DeflectHack = not bullet.TracerName and AmmoTypeDeflectable[ bullet.AmmoType ] -- if this is true its most likely the AR2 or the dropship container

				if IsValid( bullet.Attacker ) and ClassDeflectable[ bullet.Attacker:GetClass() ] then -- this is for everything else that uses that similar to AR2 plasma bullet type
					DeflectHack = true
				end

				if DeflectHack  then
					bullet.TracerName = "ar2tracer_custom" -- inject a tracer, since i couldnt get vanilla ar2tracer to work i just made my own
				end

				wep:DeflectBullet( att, tr, dmginfo, bullet )

				if DeflectHack then
					bullet.TracerName = nil -- remove the tracer when we are done to avoid conflicts
				end

				if dmginfo:GetDamage() ~= 0 and dmginfo:GetDamageType() ~= DMG_REMOVENORAGDOLL then -- dirty but works
					if oldCallback then -- engine weapons <sometimes> dont have a callback so this check is needed
						oldCallback( att, tr, dmginfo )
					end
				end
			else
				-- just allow normal callback to run if not player
				if oldCallback then -- engine weapons <sometimes> dont have a callback so this check is needed
					oldCallback( att, tr, dmginfo )
				end
			end
		end

		local ShouldFireBullet = hook.Run( "LSCS:EntityFireBullets", entity, bullet ) -- this will allow other addons to still be able to hook into FireBullets while keeping LSCS deflecting intact

		if ShouldFireBullet == false then
			return false
		end

		return true
	end)


	hook.Add( "EntityTakeDamage", "!!!lscs_block_damage", function( ply, dmginfo )

		if not ply:IsPlayer() then return end

		if dmginfo:IsDamageType( DMG_PREVENT_PHYSICS_FORCE ) and dmginfo:IsDamageType( DMG_REMOVENORAGDOLL ) then return end -- failed bullet deflect detected. Don't run block code, but allow damage.

		if dmginfo:GetDamage() == 0 and dmginfo:GetDamageType() == DMG_REMOVENORAGDOLL then return true end -- deflected bullet detected. Don't run block code, prevent damage.

		if not ply:lscsShouldBleed() then
			ply:lscsClearBlood()
		end

		local wep = ply:GetActiveWeapon()

		if not IsValid( wep ) or not wep.LSCS then return end

		if dmginfo:IsDamageType( DMG_BULLET + DMG_AIRBOAT ) then -- some npcs shoot "fake" bullets that just do entitytakedamage with a visual bullet effect
			return wep:BlockDMGinfoBullet( dmginfo ) -- and these can not be deflected properly as they aint calling FireBullets. However we still treat them as bullets internally.
		else
			return wep:Block( dmginfo ) > LSCS_UNBLOCKED
		end
	end )

	util.AddNetworkString( "lscs_saberdamage" )
	util.AddNetworkString( "lscs_clearblood" )

	local slice = {
		["npc_zombie"] = true,
		["npc_zombine"] = true,
		["npc_fastzombie"] = true,
	}

	function LSCS:ApplyDamage( ply, victim, pos, dir )
		local plyID = ply:EntIndex()
		local Time = CurTime()

		if victim._lscsHitTimes then
			local HitTime = victim._lscsHitTimes[ plyID ]

			if HitTime then
				if HitTime > Time then return end
			end
		end

		local dmg = DamageInfo()
		dmg:SetAttacker( ply )
		dmg:SetDamageForce( (victim:GetPos() - ply:GetPos()):GetNormalized() * 10000 )
		dmg:SetDamagePosition( pos ) 
		dmg:SetDamageType( DMG_ENERGYBEAM )

		if slice[ victim:GetClass() ] then -- gay, because it plays metal slicing sound
			victim:SetPos( victim:GetPos() + Vector(0,0,5) ) -- ragdoll spawns 5 units lower than the npc is at causing ragdoll spazz...
			dmg:SetDamageType( bit.bor( DMG_CRUSH, DMG_SLASH ) )
		end

		local wep = ply:GetActiveWeapon()

		if not IsValid( wep ) or not wep.LSCS then return end
		if not wep:GetDMGActive() then return end

		local startpos = ply:GetShootPos()
		local projectile = wep:GetProjectile()

		if IsValid( projectile ) then
			startpos = projectile:GetPos()
		else
			ply:LagCompensation( true )
		end

		local trace = util.TraceLine( {
			start = startpos,
			endpos = pos + dir,
			filter = function( ent ) 
				return ent == victim
			end
		} )

		ply:LagCompensation( false )

		if (trace.HitPos - startpos):Length() > 100 then return end -- protection against net abusers or 1000 ping players

		if not victim._lscsHitTimes then victim._lscsHitTimes = {} end

		victim._lscsHitTimes[ plyID ] = Time + 0.15

		dmg:SetDamage( LSCS.SaberDamage * wep:GetCombo().DamageMul )

		dmg:SetInflictor( wep )

		if victim:IsPlayer() then
			local victim_wep = victim:GetActiveWeapon()
			if IsValid( victim_wep ) and victim_wep.LSCS then
				local Blocked = victim_wep:Block( dmg ) -- this will modify dmginfo internally

				if Blocked ~= LSCS_UNBLOCKED then
					wep:OnBlocked( Blocked ) -- callback function

					return
				end
			end
		end

		if victim:IsPlayer() or victim:IsNPC() or victim:IsNextBot() then
			victim:EmitSound( "saber_hit" )
		else
			victim:EmitSound( "saber_lighthit" )
		end

		victim:TakeDamageInfo( dmg )

		net.Start( "lscs_saberdamage" )
			net.WriteVector( pos )
			net.WriteVector( dir )
			net.WriteBool( false )
		net.Broadcast()
	end

	net.Receive( "lscs_saberdamage", function( len, ply )
		if not IsValid( ply ) then return end

		local wep = ply:GetActiveWeapon()

		if not IsValid( wep ) or not wep.LSCS then return end

		local victim = net.ReadEntity()
		local pos = net.ReadVector()
		local dir = net.ReadVector()

		if not IsValid( victim ) or ply == victim then return end

		LSCS:ApplyDamage( ply, victim, pos, dir )
	end)

	function meta:lscsSetShouldBleed( bleed )
		if bleed then
			if self.lscsBloodColor then
				self:SetBloodColor( self.lscsBloodColor )
			end
		else
			if not self.lscsBloodColor then
				self.lscsBloodColor = self:GetBloodColor()
			end

			self:SetBloodColor( DONT_BLEED )
		end
		self:SetNWBool( "lscsShouldBleed", bleed )
	end

	function meta:lscsClearBlood()
		net.Start( "lscs_clearblood" )
			net.WriteEntity( self )
		net.Broadcast()
	end
else
	net.Receive( "lscs_hitmarker", function( length )
		local num = net.ReadInt( 4 )

		LocalPlayer():EmitSound("lscs/saber/reflect"..num..".mp3", 140, 100, 1, CHAN_ITEM2 )
	end)

	net.Receive( "lscs_saberdamage", function( len )
		local pos = net.ReadVector()
		local dir = net.ReadVector()
		
		local effectdata = EffectData()
			effectdata:SetOrigin( pos )
			effectdata:SetNormal( dir )
			
		if net.ReadBool( ) then
			util.Effect( "saber_block", effectdata, true, true )
		else
			util.Effect( "saber_hit", effectdata, true, true )
		end
	end)

	-- for some reason ply:RemoveAllDecals() doesnt work on players when called serverside... bug? It's gay because every line lscs_damage.lua is gay
	net.Receive( "lscs_clearblood", function( len )
		local ply = net.ReadEntity()
		if not IsValid( ply ) then return end
		ply:RemoveAllDecals()
	end)
end
--addons/weapon_jedi/lua/lscs/autorun/lscs_gesture_anims.lua:

local meta = FindMetaTable( "Player" )

if SERVER then
	util.AddNetworkString( "lscs_animations" )

	function meta:lscsPlayAnimation( anim )
		net.Start( "lscs_animations" )
			net.WriteEntity( self )
			net.WriteBool( false )
			net.WriteString( anim )
		net.Broadcast()
	end
else
	-- just some gesture smoothing taken directly from my Jedi Academy saber. If someone has an idea how to replace the think player.getall please tell me. 
	-- In real tests this never made a difference in performance as the blade rendering is 10000 times worse than this
	hook.Add("Think", "!!!!lscs_unforgiveable_playerGetAll_loop_in_think_hook", function()
		local FT = FrameTime()
		local FT10 = FT * 10

		local Time = CurTime() 

		for _, ply in ipairs( player.GetAll() ) do
			local weapon = ply:GetActiveWeapon()

			if IsValid( weapon ) and weapon.LSCS then
				ply._lscsResetGestures = true

				local TargetWeight = weapon:GetGestureTime() > Time and 1 or 0
				ply._smGestureWeight = ply._smGestureWeight and ply._smGestureWeight + math.Clamp(TargetWeight - ply._smGestureWeight,-FT * 4,FT10) or 0
				ply:AnimSetGestureWeight( GESTURE_SLOT_ATTACK_AND_RELOAD, ply._smGestureWeight )

				local VCDWeight = ((ply.__sm_lscsVCD or 0) < Time) and 0 or (1 - ply._smGestureWeight)
				ply.__sm_lscsVCDWeight = ply.__sm_lscsVCDWeight and ply.__sm_lscsVCDWeight + math.Clamp(VCDWeight - ply.__sm_lscsVCDWeight,-FT10,FT10) or 0
				ply:AnimSetGestureWeight( GESTURE_SLOT_VCD, ply.__sm_lscsVCDWeight )
			else
				if ply._lscsResetGestures then -- in case some other addon uses these slots. Lets not take them hostage by having weight set to 0
					ply._lscsResetGestures = nil
					ply.__sm_lscsVCD = nil

					ply:AnimSetGestureWeight( GESTURE_SLOT_ATTACK_AND_RELOAD, 1 )
					ply:AnimResetGestureSlot( GESTURE_SLOT_ATTACK_AND_RELOAD )

					ply:AnimSetGestureWeight( GESTURE_SLOT_VCD, 1 )
					ply:AnimResetGestureSlot( GESTURE_SLOT_VCD )
				end
			end
		end
	end)

	net.Receive( "lscs_animations", function( len )
		local ply = net.ReadEntity()

		if not IsValid( ply ) then return end

		local IsAttackAnim = net.ReadBool()

		local seq = net.ReadString()

		if IsAttackAnim then
			local start = tonumber( net.ReadString() )

			if ply == LocalPlayer() then
				if ply.s_vcd_anim ~= seq then
					-- this should only get called when a prediction error occurs or while in singleplayer/as host
					ply:AddVCDSequenceToGestureSlot( GESTURE_SLOT_ATTACK_AND_RELOAD, ply:LookupSequence( seq ), start, true )
				end
			else
				ply:AddVCDSequenceToGestureSlot( GESTURE_SLOT_ATTACK_AND_RELOAD, ply:LookupSequence( seq ),start, true )
			end
		else
			local seqid = ply:LookupSequence( seq )

			ply.__sm_lscsVCD = CurTime() + 0.5
			ply:AddVCDSequenceToGestureSlot( GESTURE_SLOT_VCD, seqid,0, false )
		end
	end )
end

--addons/weapon_jedi/lua/lscs/combos/electrostaff.lua:
COMBO.id = "electrostaff"
COMBO.PrintName = "Elektrostab"
COMBO.Author = "Deltaa"
COMBO.Description = "Der perfekte Kampf mit dem Elektrostab."

COMBO.DeflectBullets = false
COMBO.AutoBlock = true

COMBO.LeftSaberActive = false

COMBO.HoldType = "melee2"
COMBO.BPDrainPerHit = 5
COMBO.DamageMultiplier = 0.1
COMBO.MaxBlockPoints = 25

COMBO.Attacks = {
	["____"] = {
		AttackAnim = "judge_b_s1_t2",
		BeginAttack = function(weapon, ply)
			weapon:DoAttackSound()
		end,
		FinishAttack = function( weapon, ply ) end,
		Delay = 0,
		Duration = 0.6,
	},
	["-45-"] = {
		AttackAnim = "h_c3_t2",
		BeginAttack = function( weapon, ply ) 
			weapon:DoAttackSound()
            ply:Freeze(true)
		end,
		FinishAttack = function(weapon, ply)
            ply:Freeze(false)
        end,
		Delay = 0.3,
		Duration = 0.65,
	},

	["W_S_"] = {
		AttackAnim = "phalanx_b_s1_t1",
		BeginAttack = function( weapon, ply )  
			weapon:DoAttackSound()
			ply:lscsSetTimedMove( 1, CurTime(), 0.7, Vector(250,0,0) )
			ply:lscsSetTimedMove( 2, CurTime() + 0.7, 0.2, Vector(100,0,0) )
			ply:lscsSetTimedMove( 3, CurTime() + 0.9, 0.4, Vector(0,0,0) )

			timer.Simple(0.2, function()
				if not IsValid( weapon ) then return end
				weapon:DoAttackSound()
			end)
			timer.Simple(0.6, function()
				if not IsValid( weapon ) then return end
				weapon:DoAttackSound()
			end)
		end,
		FinishAttack = function( weapon, ply ) end,
		Delay = 0.1,
		Duration = 0.6,
	},
	["__S_"] = {
		AttackAnim = "phalanx_b_s1_t1",
		BeginAttack = function( weapon, ply ) 
			weapon:DoAttackSound()
			ply:lscsSetTimedMove( 1, CurTime(), 0.3, Vector(-10,0,0) )
		end,
		FinishAttack = function( weapon, ply ) end,
		Delay = 0.1,
		Duration = 0.6,
	},
	["_A__"] = {
		AttackAnim = "pure_h_left_t2",
		BeginAttack = function(weapon, ply)  
			weapon:DoAttackSound()
		end,
		FinishAttack = function( weapon, ply ) end,
		Delay = 0,
		Duration = 0.7,
	},
	["___D"] = {
		AttackAnim = "pure_h_right_t1",
		BeginAttack = function( weapon, ply )  
			weapon:DoAttackSound()
		end,
		FinishAttack = function( weapon, ply ) end,
		Delay = 0,
		Duration = 0.7,
	},
    ["WA__"] = {
		AttackAnim = "pure_h_left_t2",
		BeginAttack = function(weapon, ply)  
			weapon:DoAttackSound()
		end,
		FinishAttack = function( weapon, ply ) end,
		Delay = 0,
		Duration = 0.7,
	},
	["W__D"] = {
		AttackAnim = "pure_h_right_t1",
		BeginAttack = function( weapon, ply )  
			weapon:DoAttackSound()
		end,
		FinishAttack = function( weapon, ply ) end,
		Delay = 0,
		Duration = 0.7,
	},
	["W___"] = {
		AttackAnim = "h_c1_t2",
		BeginAttack = function( weapon, ply )  
			weapon:DoAttackSound()
			if ply:OnGround() then
				ply:SetVelocity(Angle(0, ply:EyeAngles().y, 0):Forward() * 1000)
			end
			ply:lscsSetTimedMove(1, CurTime(), 0.9, Vector(0,0,0) )
		end,
		FinishAttack = function( weapon, ply ) end,
		Delay = 0.1,
		Duration = 0.8,
	},
}

--addons/weapon_jedi/lua/lscs/combos/soresu.lua:
COMBO.id = "soresu"
COMBO.PrintName = "Form III | Soresu"
COMBO.Author = "Deltaa"
COMBO.Description = "Der Weg des Mynock"

COMBO.DeflectBullets = true
COMBO.AutoBlock = true

COMBO.LeftSaberActive = false

COMBO.HoldType = "lscs_soresu"

COMBO.DamageMultiplier = 1
COMBO.MaxBlockPoints = 150

COMBO.Attacks = {
	["BACKFLIP"] = {
		AttackAnim = "rollback",
		BeginAttack = function( weapon, ply )  
			weapon:SetDMGActive( false )

			ply:SetVelocity( Vector(0,0,250) - Angle(0,ply:EyeAngles().y,0):Forward() * 100 )
			ply:lscsSuppressFalldamage( CurTime() + 5 )
		end,
		FinishAttack = function( weapon, ply ) end,
		Delay = 0.0,
		Duration = 0.5,
	},
	["ROLL_RIGHT"] = {
		AttackAnim = "rollright",
		BeginAttack = function( weapon, ply )  
			weapon:DoAttackSound()

			ply:SetVelocity( Vector(0,0,50) + Angle(0,ply:EyeAngles().y,0):Right() * 600 )
			ply:lscsSuppressFalldamage( CurTime() + 5 )
		end,
		FinishAttack = function( weapon, ply ) end,
		Delay = 0.0,
		Duration = 1,
	},
	["ROLL_LEFT"] = {
		AttackAnim = "rollleft",
		BeginAttack = function( weapon, ply )  
			weapon:DoAttackSound()

			ply:SetVelocity( Vector(0,0,50) - Angle(0,ply:EyeAngles().y,0):Right() * 600 )
			ply:lscsSuppressFalldamage( CurTime() + 5 )
		end,
		FinishAttack = function( weapon, ply ) end,
		Delay = 0.0,
		Duration = 1,
	},
	["____"] = {
		AttackAnim = "judge_b_s2_t3",
		BeginAttack = function(weapon, ply)  
			weapon:DoAttackSound()
		end,
		FinishAttack = function(weapon, ply) end,
		Delay = 0.25,
		Duration = 0.5,
	},
	["W_S_"] = {
		AttackAnim = "vanguard_r_s3_t2",
		BeginAttack = function( weapon, ply )  
			weapon:DoAttackSound()

			ply:lscsSetTimedMove(1, CurTime() + 0.2, 0.7, Vector(50, 0, 0) )
		end,
		FinishAttack = function( weapon, ply ) end,
		Delay = 0,
		Duration = 0.7,
	},
	["__S_"] = {
		AttackAnim = "b_right_t1",
		BeginAttack = function(weapon, ply) 
			weapon:DoAttackSound()
			ply:lscsSetTimedMove(1, CurTime(), 0.3, Vector(-10,0,0))
		end,
		FinishAttack = function(weapon, ply) end,
		Delay = 0.1,
		Duration = 0.5,
	},
	["_A__"] = {
		AttackAnim = "h_left_t2",
		BeginAttack = function(weapon, ply)  
			weapon:DoAttackSound()
			ply:lscsSetTimedMove(1, CurTime(), 0.3, Vector(0, -100, 0))
			ply:lscsSetTimedMove(2, CurTime() + 0.3, 0.3, Vector(0, 0, 0))
		end,
		FinishAttack = function(weapon, ply) end,
		Delay = 0.25,
		Duration = 0.5,
	},
	["___D"] = {
		AttackAnim = "h_right_t2",
		BeginAttack = function(weapon, ply)  
			weapon:DoAttackSound()
			ply:lscsSetTimedMove(1, CurTime(), 0.3, Vector(0,100,0))
			ply:lscsSetTimedMove(2, CurTime() + 0.3, 0.3, Vector(0,0,0))
		end,
		FinishAttack = function( weapon, ply ) end,
		Delay = 0.25,
		Duration = 0.5,
	},
	["W__D"] = {
		AttackAnim = "judge_b_right_t3",
		BeginAttack = function( weapon, ply )  
			weapon:DoAttackSound()
			ply:lscsSetTimedMove( 1, CurTime(), 0.4, Vector(1,1,0) )
		end,
		FinishAttack = function( weapon, ply ) end,
		Delay = 0.1,
		Duration = 0.8,
	},
	["WA__"] = {
		AttackAnim = "judge_b_left_t3",
		BeginAttack = function( weapon, ply )  
			weapon:DoAttackSound()
			ply:lscsSetTimedMove( 1, CurTime(), 0.3, Vector(25,-25,0) )
		end,
		FinishAttack = function( weapon, ply ) end,
		Delay = 0.1,
		Duration = 0.6,
	},
	["__SD"] = {
		AttackAnim = "judge_b_s2_t1",
		BeginAttack = function( weapon, ply )  
			weapon:DoAttackSound()

			ply:lscsSetTimedMove(1, CurTime(), 0.3, Vector(-1,1,0))
		end,
		FinishAttack = function( weapon, ply ) end,
		Delay = 0.2,
		Duration = 0.5,
	},
	["_AS_"] = {
		AttackAnim = "vanguard_b_left_t3",
		BeginAttack = function(weapon, ply)  
			weapon:DoAttackSound()

			ply:lscsSetTimedMove(1, CurTime(), 0.3, Vector(-1,-1,0))
		end,
		FinishAttack = function( weapon, ply ) end,
		Delay = 0.3,
		Duration = 0.6,
	},
	["W___"] = {
		AttackAnim = "pure_h_s2_t2",
		BeginAttack = function( weapon, ply )  
			weapon:DoAttackSound()

			ply:lscsSetTimedMove(1, CurTime(), 0.3, Vector(100, 0, 0))
            ply:lscsSetTimedMove(2, CurTime() + 1, 0.3, Vector(100, 0, 0))
		end,
		FinishAttack = function( weapon, ply ) end,
		Delay = 0.1,
		Duration = 1.5,
	},
}
--lua/autorun/policedroid.lua:
player_manager.AddValidModel( "policedroid", "models/player/valley/policedroid.mdl" ) 
list.Set( "PlayerOptionsModel",  "policedroid", "models/player/valley/policedroid.mdl" ) 

--addons/tools/lua/autorun/rb655_ext_props.lua:

AddCSLuaFile()

local function rb655_property_filter( filtor, ent, ply )
	if ( type( filtor ) == "string" && filtor != ent:GetClass() ) then return false end
	if ( type( filtor ) == "table" && !table.HasValue( filtor, ent:GetClass() ) ) then return false end
	if ( type( filtor ) == "function" && !filtor( ent, ply ) ) then return false end

	return true
end

function AddEntFunctionProperty( name, label, pos, filtor, func, icon )
	properties.Add( name, {
		MenuLabel = label,
		MenuIcon = icon,
		Order = pos,
		Filter = function( self, ent, ply )
			if ( !IsValid( ent ) or !gamemode.Call( "CanProperty", ply, name, ent ) ) then return false end
			if ( !rb655_property_filter( filtor, ent, ply ) ) then return false end
			return true
		end,
		Action = function( self, ent )
			self:MsgStart()
				net.WriteEntity( ent )
			self:MsgEnd()
		end,
		Receive = function( self, length, ply )
			local ent = net.ReadEntity()

			if ( !IsValid( ply ) or !IsValid( ent ) or !self:Filter( ent, ply ) ) then return false end

			func( ent, ply )
		end
	} )
end

function AddEntFireProperty( name, label, pos, class, input, icon )
	AddEntFunctionProperty( name, label, pos, class, function( e ) e:Fire( unpack( string.Explode( " ", input ) ) ) end, icon )
end

local ExplodeIcon = "icon16/bomb.png"
local EnableIcon = "icon16/tick.png"
local DisableIcon = "icon16/cross.png"
local ToggleIcon = "icon16/arrow_switch.png"

local SyncFuncs = {}

SyncFuncs.prop_door_rotating = function( ent )
	ent:SetNWBool( "Locked", ent:GetSaveTable().m_bLocked )
	local state = ent:GetSaveTable().m_eDoorState
	ent:SetNWBool( "Closed", state == 0 or state == 3 )
end
SyncFuncs.func_door = function( ent )
	ent:SetNWBool( "Locked", ent:GetSaveTable().m_bLocked )
	--[[local state = ent:GetSaveTable().m_eDoorState
	ent:SetNWBool( "Closed", state == 0 or state == 3 )]]
end
SyncFuncs.func_door_rotating = function( ent )
	ent:SetNWBool( "Locked", ent:GetSaveTable().m_bLocked )
	--[[local state = ent:GetSaveTable().m_eDoorState
	ent:SetNWBool( "Closed", state == 0 or state == 3 )]]
end
SyncFuncs.prop_vehicle_jeep = function( ent )
	ent:SetNWBool( "Locked", ent:GetSaveTable().VehicleLocked )
	ent:SetNWBool( "HasDriver", IsValid( ent:GetDriver() ) )
	ent:SetNWBool( "m_bRadarEnabled", ent:GetSaveTable().m_bRadarEnabled )
end
SyncFuncs.prop_vehicle_airboat = function( ent )
	ent:SetNWBool( "Locked", ent:GetSaveTable().VehicleLocked )
	ent:SetNWBool( "HasDriver", IsValid( ent:GetDriver() ) )
end
--[[SyncFuncs.prop_vehicle_prisoner_pod = function( ent )
	ent:SetNWBool( "Locked", ent:GetSaveTable().VehicleLocked )
	ent:SetNWBool( "HasDriver", IsValid( ent:GetDriver() ) )
end]]
SyncFuncs.func_tracktrain = function( ent )
	ent:SetNWInt( "m_dir", ent:GetSaveTable().m_dir )
	ent:SetNWBool( "m_moving", ent:GetSaveTable().speed != 0 )
	--[[local driver = ent:GetDriver()
	ent:SetNWBool( "HasDriver", IsValid( driver ) )]]
end

-- hook.Add( "Tick", "rb655_prop_sync", function()
-- 	if ( CLIENT ) then return end

-- 	for id, ply in pairs( player.GetAll() ) do
-- 		local ent = ply:GetEyeTrace().Entity
-- 		if ( !IsValid( ent ) ) then continue end
-- 		if ( SyncFuncs[ ent:GetClass() ] ) then
-- 			SyncFuncs[ ent:GetClass() ]( ent )
-- 		end
-- 	end
-- end )

local e = 0
local dissolver
function rb655_dissolve( ent )
	local phys = ent:GetPhysicsObject()
	if ( IsValid( phys ) ) then phys:EnableGravity( false ) end

	ent:SetName( "rb655_dissolve" .. e )

	if ( !IsValid( dissolver ) ) then
		dissolver = ents.Create( "env_entity_dissolver" )
		dissolver:SetPos( ent:GetPos() )
		dissolver:Spawn()
		dissolver:Activate()
		dissolver:SetKeyValue( "magnitude", 100 )
		dissolver:SetKeyValue( "dissolvetype", 0 )
	end
	dissolver:Fire( "Dissolve", "rb655_dissolve" .. e )

	timer.Create( "rb655_ep_cleanupDissolved", 60, 1, function()
		if ( IsValid( dissolver ) ) then dissolver:Remove() end
	end )

	e = e + 1
end

-------------------------------------------------- Half - Life 2 Specific --------------------------------------------------

AddEntFireProperty( "rb655_door_open", "Open", 655, function( ent, ply )
	if ( !ent:GetNWBool( "Closed" ) && ent:GetClass() == "prop_door_rotating" ) then return false end

	return rb655_property_filter( { "prop_door_rotating", "func_door_rotating", "func_door" }, ent, ply )
end, "Open", "icon16/door_open.png" )
AddEntFireProperty( "rb655_door_close", "Close", 656, function( ent, ply )
	if ( ent:GetNWBool( "Closed" ) && ent:GetClass() == "prop_door_rotating" ) then return false end

	return rb655_property_filter( { "prop_door_rotating", "func_door_rotating", "func_door" }, ent, ply )
end, "Close", "icon16/door.png" )
AddEntFireProperty( "rb655_door_lock", "Lock", 657, function( ent, ply )
	if ( ent:GetNWBool( "Locked" ) && ent:GetClass() != "prop_vehicle_prisoner_pod" ) then return false end

	return rb655_property_filter( { "prop_door_rotating", "func_door_rotating", "func_door", "prop_vehicle_jeep", "prop_vehicle_airboat", "prop_vehicle_prisoner_pod" }, ent, ply )
end, "Lock", "icon16/lock.png" )
AddEntFireProperty( "rb655_door_unlock", "Unlock", 658, function( ent, ply )
	--if ( !ent:GetNWBool( "Locked" ) && ent:GetClass() != "prop_vehicle_prisoner_pod" ) then return false end

	return rb655_property_filter( { "prop_door_rotating", "func_door_rotating", "func_door", "prop_vehicle_jeep", "prop_vehicle_airboat", "prop_vehicle_prisoner_pod" }, ent, ply )
end, "Unlock", "icon16/lock_open.png" )

AddEntFireProperty( "rb655_func_movelinear_open", "Start", 655, "func_movelinear", "Open", "icon16/arrow_right.png" )
AddEntFireProperty( "rb655_func_movelinear_close", "Return", 656, "func_movelinear", "Close", "icon16/arrow_left.png" )

AddEntFireProperty( "rb655_func_tracktrain_StartForward", "Start Forward", 655, function( ent, ply )
	if ( ent:GetNWInt( "m_dir" ) == 1 ) then return false end

	return rb655_property_filter( "func_tracktrain", ent, ply )
end, "StartForward", "icon16/arrow_right.png" )
AddEntFireProperty( "rb655_func_tracktrain_StartBackward", "Start Backward", 656, function( ent, ply )
	if ( ent:GetNWInt( "m_dir" ) == -1 ) then return false end

	return rb655_property_filter( "func_tracktrain", ent, ply )
end, "StartBackward", "icon16/arrow_left.png" )
--AddEntFireProperty( "rb655_func_tracktrain_Reverse", "Reverse", 657, "func_tr2acktrain", "Reverse", "icon16/arrow_undo.png" ) -- Same as two above
AddEntFireProperty( "rb655_func_tracktrain_Stop", "Stop", 658, function( ent, ply )
	if ( !ent:GetNWBool( "m_moving" ) ) then return false end

	return rb655_property_filter( "func_tracktrain", ent, ply )
end, "Stop", "icon16/shape_square.png" )
AddEntFireProperty( "rb655_func_tracktrain_Resume", "Resume", 659, function( ent, ply )
	if ( ent:GetNWInt( "m_moving" ) ) then return false end

	return rb655_property_filter( "func_tracktrain", ent, ply )
end, "Resume", "icon16/resultset_next.png" )
--AddEntFireProperty( "rb655_func_tracktrain_Toggle", "Toggle", 660, "func_track2train", "Toggle", ToggleIcon ) -- Same as two above

AddEntFireProperty( "rb655_breakable_break", "Break", 655, function( ent, ply )
	if ( ent:Health() < 1 ) then return false end

	return rb655_property_filter( { "func_breakable", "func_physbox", "prop_physics", "func_pushable" }, ent, ply )
end, "Break", ExplodeIcon ) -- Do not include item_item_crate, it insta crashes the server, dunno why.

AddEntFunctionProperty( "rb655_dissolve", "Disintegrate", 657, function( ent, ply )
	if ( ent:GetModel() && ent:GetModel():StartWith( "*" ) ) then return false end
	if ( ent:IsPlayer() ) then return false end

	return true
end, function( ent )
	rb655_dissolve( ent )
end, "icon16/wand.png" )

AddEntFireProperty( "rb655_turret_toggle", "Toggle", 655, { "npc_combine_camera", "npc_turret_ceiling", "npc_turret_floor" }, "Toggle", ToggleIcon )
AddEntFireProperty( "rb655_self_destruct", "Self Destruct", 656, { "npc_turret_floor", "npc_helicopter" }, "SelfDestruct", ExplodeIcon )

AddEntFunctionProperty( "rb655_turret_ammo_remove", "Deplete Ammo", 657, function( ent )
	if ( bit.band( ent:GetSpawnFlags(), 256 ) == 256 ) then return false end
	if ( ent:GetClass() == "npc_turret_floor" or ent:GetClass() == "npc_turret_ceiling" ) then return true end
	return false
end, function( ent )
	ent:SetKeyValue( "spawnflags", bit.bor( ent:GetSpawnFlags(), 256 ) )
	ent:Activate()
end, "icon16/delete.png" )

AddEntFunctionProperty( "rb655_turret_ammo_restore", "Restore Ammo", 658, function( ent )
	if ( bit.band( ent:GetSpawnFlags(), 256 ) == 0 ) then return false end
	if ( ent:GetClass() == "npc_turret_floor" or ent:GetClass() == "npc_turret_ceiling" ) then return true end
	return false
end, function( ent )
	ent:SetKeyValue( "spawnflags", bit.bxor( ent:GetSpawnFlags(), 256 ) )
	ent:Activate()
end, "icon16/add.png" )

AddEntFunctionProperty( "rb655_turret_make_friendly", "Make Friendly", 659, function( ent )
	if ( bit.band( ent:GetSpawnFlags(), 512 ) == 512 ) then return false end
	if ( ent:GetClass() == "npc_turret_floor" ) then return true end
	return false
end, function( ent )
	ent:SetKeyValue( "spawnflags", bit.bor( ent:GetSpawnFlags(), SF_FLOOR_TURRET_CITIZEN ) )
	--ent:SetMaterial( "models/combine_turrets/floor_turret/floor_turret_citizen" )
	ent:Activate()
end, "icon16/user_green.png" )

AddEntFunctionProperty( "rb655_turret_make_hostile", "Make Hostile", 660, function( ent )
	if ( bit.band( ent:GetSpawnFlags(), 512 ) == 0 ) then return false end
	if ( ent:GetClass() == "npc_turret_floor" ) then return true end
	return false
end, function( ent )
	ent:SetKeyValue( "spawnflags", bit.bxor( ent:GetSpawnFlags(), SF_FLOOR_TURRET_CITIZEN ) )
	ent:Activate()
end, "icon16/user_red.png" )

AddEntFireProperty( "rb655_suitcharger_recharge", "Recharge", 655, "item_suitcharger", "Recharge", "icon16/arrow_refresh.png" )

AddEntFireProperty( "rb655_manhack_jam", "Jam", 655, "npc_manhack", "InteractivePowerDown", ExplodeIcon )

AddEntFireProperty( "rb655_scanner_mineadd", "Equip Mine", 655, "npc_clawscanner", "EquipMine", "icon16/add.png" )
AddEntFireProperty( "rb655_scanner_minedeploy", "Deploy Mine", 656, "npc_clawscanner", "DeployMine", "icon16/arrow_down.png" ) -- m_bIsOpen
AddEntFireProperty( "rb655_scanner_disable_spotlight", "Disable Spotlight", 658, { "npc_clawscanner", "npc_cscanner" }, "DisableSpotlight", DisableIcon ) -- SpotlightDisabled

-- AddEntFireProperty( "rb655_dropship_d1", "1", 655, "npc_combinedropship", "DropMines 1", DisableIcon )

AddEntFireProperty( "rb655_rollermine_selfdestruct", "Self Destruct", 655, "npc_rollermine", "InteractivePowerDown", ExplodeIcon )
AddEntFireProperty( "rb655_rollermine_turnoff", "Turn Off", 656, "npc_rollermine", "TurnOff", DisableIcon ) -- m_bTurnedOn
AddEntFireProperty( "rb655_rollermine_turnon", "Turn On", 657, "npc_rollermine", "TurnOn", EnableIcon )

AddEntFireProperty( "rb655_helicopter_gun_on", "Enable Turret", 655, "npc_helicopter", "GunOn", EnableIcon ) -- m_fHelicopterFlags = 1?
AddEntFireProperty( "rb655_helicopter_gun_off", "Disable Turret", 656, "npc_helicopter", "GunOff", DisableIcon ) -- m_fHelicopterFlags = 0?
AddEntFireProperty( "rb655_helicopter_dropbomb", "Drop Bomb", 657, "npc_helicopter", "DropBomb", "icon16/arrow_down.png" )
AddEntFireProperty( "rb655_helicopter_norm_shoot", "Start Normal Shooting", 660, "npc_helicopter", "StartNormalShooting", "icon16/clock.png" ) -- m_nShootingMode = 0
AddEntFireProperty( "rb655_helicopter_long_shoot", "Start Long Cycle Shooting", 661, "npc_helicopter", "StartLongCycleShooting", "icon16/clock_red.png" ) -- m_nShootingMode = 1
AddEntFireProperty( "rb655_helicopter_deadly_on", "Enable Deadly Shooting", 662, "npc_helicopter", "EnableDeadlyShooting", EnableIcon ) -- m_bDeadlyShooting
AddEntFireProperty( "rb655_helicopter_deadly_off", "Disable Deadly Shooting", 663, "npc_helicopter", "DisableDeadlyShooting", DisableIcon )

AddEntFireProperty( "rb655_gunship_OmniscientOn", "Enable Omniscient", 655, "npc_combinegunship", "OmniscientOn", EnableIcon ) -- m_fOmniscient
AddEntFireProperty( "rb655_gunship_OmniscientOff", "Disable Omniscient", 656, "npc_combinegunship", "OmniscientOff", DisableIcon )
AddEntFireProperty( "rb655_gunship_BlindfireOn", "Enable Blindfire", 657, "npc_combinegunship", "BlindfireOn", EnableIcon ) -- m_fBlindfire
AddEntFireProperty( "rb655_gunship_BlindfireOff", "Disable Blindfire", 658, "npc_combinegunship", "BlindfireOff", DisableIcon )

AddEntFireProperty( "rb655_alyx_HolsterWeapon", "Holster Weapon", 655, function( ent )
	if ( !ent:IsNPC() or ent:GetClass() != "npc_alyx" or !IsValid( ent:GetActiveWeapon() ) ) then return false end
	return true
end, "HolsterWeapon", "icon16/gun.png" )
AddEntFireProperty( "rb655_alyx_UnholsterWeapon", "Unholster Weapon", 656, "npc_alyx", "UnholsterWeapon", "icon16/gun.png" )
AddEntFireProperty( "rb655_alyx_HolsterAndDestroyWeapon", "Holster And Destroy Weapon", 657, function( ent )
	if ( !ent:IsNPC() or ent:GetClass() != "npc_alyx" or !IsValid( ent:GetActiveWeapon() ) ) then return false end
	return true
end, "HolsterAndDestroyWeapon", "icon16/gun.png" )

AddEntFireProperty( "rb655_antlion_burrow", "Burrow", 655, { "npc_antlion" , "npc_antlion_worker" }, "BurrowAway", "icon16/arrow_down.png" )
AddEntFireProperty( "rb655_barnacle_free", "Free Target", 655, "npc_barnacle", "LetGo", "icon16/heart.png" )

AddEntFireProperty( "rb655_zombine_suicide", "Suicide", 655, "npc_zombine", "PullGrenade", ExplodeIcon )
AddEntFireProperty( "rb655_zombine_sprint", "Sprint", 656, "npc_zombine", "StartSprint", "icon16/flag_blue.png" )

AddEntFireProperty( "rb655_thumper_enable", "Enable", 655, "prop_thumper", "Enable", EnableIcon ) -- m_bEnabled
AddEntFireProperty( "rb655_thumper_disable", "Disable", 656, "prop_thumper", "Disable", DisableIcon )

AddEntFireProperty( "rb655_dog_fetch_on", "Start Playing Fetch", 655, "npc_dog", "StartCatchThrowBehavior", "icon16/accept.png" ) -- m_bDoCatchThrowBehavior=true
AddEntFireProperty( "rb655_dog_fetch_off", "Stop Playing Fetch", 656, "npc_dog", "StopCatchThrowBehavior", "icon16/cancel.png" )

AddEntFireProperty( "rb655_soldier_look_off", "Enable Blindness", 655, "npc_combine_s", "LookOff", "icon16/user_green.png" )
AddEntFireProperty( "rb655_soldier_look_on", "Disable Blindness", 656, "npc_combine_s", "LookOn", "icon16/user_gray.png" )

AddEntFireProperty( "rb655_citizen_wep_pick_on", "Permit Weapon Upgrade Pickup", 655, "npc_citizen", "EnableWeaponPickup", EnableIcon )
AddEntFireProperty( "rb655_citizen_wep_pick_off", "Restrict Weapon Upgrade Pickup", 656, "npc_citizen", "DisableWeaponPickup", DisableIcon )
AddEntFireProperty( "rb655_citizen_panic", "Start Panicking", 658, { "npc_citizen", "npc_alyx", "npc_barney" }, "SetReadinessPanic", "icon16/flag_red.png" )
AddEntFireProperty( "rb655_citizen_panic_off", "Stop Panicking", 659, { "npc_citizen", "npc_alyx", "npc_barney" }, "SetReadinessHigh", "icon16/flag_green.png" )

AddEntFireProperty( "rb655_camera_angry", "Make Angry", 656, "npc_combine_camera", "SetAngry", "icon16/flag_red.png" )
AddEntFireProperty( "rb655_combine_mine_disarm", "Disarm", 655, "combine_mine", "Disarm", "icon16/wrench.png" )

AddEntFireProperty( "rb655_hunter_enable", "Enable Shooting", 655, "npc_hunter", "EnableShooting", EnableIcon )
AddEntFireProperty( "rb655_hunter_disable", "Disable Shooting", 656, "npc_hunter", "DisableShooting", DisableIcon )

AddEntFireProperty( "rb655_vortigaunt_enable", "Enable Armor Recharge", 655, "npc_vortigaunt", "EnableArmorRecharge", EnableIcon )
AddEntFireProperty( "rb655_vortigaunt_disable", "Disable Armor Recharge", 656, "npc_vortigaunt", "DisableArmorRecharge", DisableIcon )

AddEntFireProperty( "rb655_antlion_enable", "Enable Jump", 655, { "npc_antlion", "npc_antlion_worker" }, "EnableJump", EnableIcon )
AddEntFireProperty( "rb655_antlion_disable", "Disable Jump", 656, { "npc_antlion", "npc_antlion_worker" }, "DisableJump", DisableIcon )
AddEntFireProperty( "rb655_antlion_hear", "Hear Bugbait", 657, { "npc_antlion", "npc_antlion_worker" }, "HearBugbait", EnableIcon )
AddEntFireProperty( "rb655_antlion_ignore", "Ignore Bugbait", 658, { "npc_antlion", "npc_antlion_worker" }, "IgnoreBugbait", DisableIcon )

AddEntFireProperty( "rb655_antlion_grub_squash", "Squash", 655, "npc_antlion_grub", "Squash", "icon16/bug.png" )

AddEntFireProperty( "rb655_antlionguard_bark_on", "Enable Antlion Summon", 655, "npc_antlionguard", "EnableBark", EnableIcon )
AddEntFireProperty( "rb655_antlionguard_bark_off", "Disable Antlion Summon", 656, "npc_antlionguard", "DisableBark", DisableIcon )

AddEntFireProperty( "rb655_headcrab_burrow", "Burrow", 655, "npc_headcrab", "BurrowImmediate", "icon16/arrow_down.png" )

AddEntFireProperty( "rb655_strider_stand", "Force Stand", 655, "npc_strider", "Stand", "icon16/arrow_up.png" )
AddEntFireProperty( "rb655_strider_crouch", "Force Crouch", 656, "npc_strider", "Crouch", "icon16/arrow_down.png" )
AddEntFireProperty( "rb655_strider_break", "Destroy", 657, { "npc_strider", "npc_clawscanner", "npc_cscanner" }, "Break", ExplodeIcon )

-- This just doesn't do anything
AddEntFireProperty( "rb655_patrol_on", "Start Patrolling", 660, { "npc_citizen", "npc_combine_s" }, "StartPatrolling", "icon16/flag_green.png" )
AddEntFireProperty( "rb655_patrol_off", "Stop Patrolling", 661, { "npc_citizen", "npc_combine_s" }, "StopPatrolling", "icon16/flag_red.png" )

AddEntFireProperty( "rb655_strider_aggressive_e", "Make More Aggressive", 658, "npc_strider", "EnableAggressiveBehavior", EnableIcon )
AddEntFireProperty( "rb655_strider_aggressive_d", "Make Less Aggressive", 659, "npc_strider", "DisableAggressiveBehavior", DisableIcon )

AddEntFunctionProperty( "rb655_healthcharger_recharge", "Recharge", 655, "item_healthcharger", function( ent )
	local n = ents.Create( "item_healthcharger" )
	n:SetPos( ent:GetPos() )
	n:SetAngles( ent:GetAngles() )
	n:Spawn()
	n:Activate()
	n:EmitSound( "items/suitchargeok1.wav" )

	undo.ReplaceEntity( ent, n )
	cleanup.ReplaceEntity( ent, n )

	ent:Remove()
end, "icon16/arrow_refresh.png" )

-------------------------------------------------- Vehicles --------------------------------------------------

AddEntFunctionProperty( "rb655_vehicle_exit", "Kick Driver", 655, function( ent )
	if ( ent:IsVehicle() && ent:GetNWBool( "HasDriver" ) ) then return true end
	return false
end, function( ent )
	if ( !IsValid( ent:GetDriver() ) or !ent:GetDriver().ExitVehicle ) then return end
	ent:GetDriver():ExitVehicle()
end, "icon16/car.png" )

AddEntFireProperty( "rb655_vehicle_radar", "Enable Radar", 655, function( ent )
	if ( !ent:IsVehicle() or ent:GetClass() != "prop_vehicle_jeep" ) then return false end
	if ( ent:LookupAttachment( "controlpanel0_ll" ) == 0 ) then return false end -- These two attachments must exist!
	if ( ent:LookupAttachment( "controlpanel0_ur" ) == 0 ) then return false end
	if ( ent:GetNWBool( "m_bRadarEnabled", false ) ) then return false end
	return true
end, "EnableRadar", "icon16/application_add.png" )

AddEntFireProperty( "rb655_vehicle_radar_off", "Disable Radar", 655, function( ent )
	if ( !ent:IsVehicle() or ent:GetClass() != "prop_vehicle_jeep" ) then return false end
	-- if ( ent:LookupAttachment( "controlpanel0_ll" ) == 0 ) then return false end -- These two attachments must exist!
	-- if ( ent:LookupAttachment( "controlpanel0_ur" ) == 0 ) then return false end
	if ( !ent:GetNWBool( "m_bRadarEnabled", false ) ) then return false end
	return true
end, "DisableRadar", "icon16/application_delete.png" )

AddEntFunctionProperty( "rb655_vehicle_enter", "Enter Vehicle", 656, function( ent )
	if ( ent:IsVehicle() && !ent:GetNWBool( "HasDriver" ) ) then return true end
	return false
end, function( ent, ply )
	ply:ExitVehicle()
	ply:EnterVehicle( ent )
end, "icon16/car.png" )

AddEntFunctionProperty( "rb655_vehicle_add_gun", "Mount Gun", 657, function( ent )
	if ( !ent:IsVehicle() ) then return false end
	if ( ent:GetNWBool( "EnableGun", false ) ) then return false end
	if ( ent:GetBodygroup( 1 ) == 1 ) then return false end
	if ( ent:LookupSequence( "aim_all" ) > 0 ) then return true end
	if ( ent:LookupSequence( "weapon_yaw" ) > 0 && ent:LookupSequence( "weapon_pitch" ) > 0 ) then return true end
	return false
end, function( ent )
	ent:SetKeyValue( "EnableGun", "1" )
	ent:Activate()

	ent:SetBodygroup( 1, 1 )

	ent:SetNWBool( "EnableGun", true )
end, "icon16/gun.png" )

-------------------------------------------------- Garry's Mod Specific --------------------------------------------------

AddEntFunctionProperty( "rb655_baloon_break", "Pop", 655, "gmod_balloon", function( ent, ply )
	local dmginfo = DamageInfo()
	dmginfo:SetAttacker( ply )

	ent:OnTakeDamage( dmginfo )
end, ExplodeIcon )

AddEntFunctionProperty( "rb655_dynamite_activate", "Explode", 655, "gmod_dynamite", function( ent, ply )
	ent:Explode( 0, ply )
end, ExplodeIcon )

-- Emitter
AddEntFunctionProperty( "rb655_emitter_on", "Start Emitting", 655, function( ent )
	if ( ent:GetClass() == "gmod_emitter" && !ent:GetOn() ) then return true end
	return false
end, function( ent, ply )
	ent:SetOn( true )
end, EnableIcon )

AddEntFunctionProperty( "rb655_emitter_off", "Stop Emitting", 656, function( ent )
	if ( ent:GetClass() == "gmod_emitter" && ent:GetOn() ) then return true end
	return false
end, function( ent, ply )
	ent:SetOn( false )
end, DisableIcon )

-- Lamps
AddEntFunctionProperty( "rb655_lamp_on", "Enable", 655, function( ent )
	if ( ent:GetClass() == "gmod_lamp" && !ent:GetOn() ) then return true end
	return false
end, function( ent, ply )
	ent:Switch( true )
end, EnableIcon )

AddEntFunctionProperty( "rb655_lamp_off", "Disable", 656, function( ent )
	if ( ent:GetClass() == "gmod_lamp" && ent:GetOn() ) then return true end
	return false
end, function( ent, ply )
	ent:Switch( false )
end, DisableIcon )

-- Light
AddEntFunctionProperty( "rb655_light_on", "Enable", 655, function( ent )
	if ( ent:GetClass() == "gmod_light" && !ent:GetOn() ) then return true end
	return false
end, function( ent, ply )
	ent:SetOn( true )
end, EnableIcon )

AddEntFunctionProperty( "rb655_light_off", "Disable", 656, function( ent )
	if ( ent:GetClass() == "gmod_light" && ent:GetOn() ) then return true end
	return false
end, function( ent, ply )
	ent:SetOn( false )
end, DisableIcon )

-- No thruster, it is glitchy

-------------------------------------------------- HL1 Specific --------------------------------------------------

AddEntFireProperty( "rb655_func_rotating_forward", "Start Forward", 655, "func_rotating", "StartForward", "icon16/arrow_right.png" )
AddEntFireProperty( "rb655_func_rotating_backward", "Start Backward", 656, "func_rotating", "StartBackward", "icon16/arrow_left.png" )
AddEntFireProperty( "rb655_func_rotating_reverse", "Reverse", 657, "func_rotating", "Reverse", "icon16/arrow_undo.png" )
AddEntFireProperty( "rb655_func_rotating_stop", "Stop", 658, "func_rotating", "Stop", "icon16/shape_square.png" )

AddEntFireProperty( "rb655_func_platrot_up", "Go Up", 655, "func_platrot", "GoUp", "icon16/arrow_up.png" )
AddEntFireProperty( "rb655_func_platrot_down", "Go Down", 656, "func_platrot", "GoDown", "icon16/arrow_down.png" )
AddEntFireProperty( "rb655_func_platrot_toggle", "Toggle", 657, "func_platrot", "Toggle", ToggleIcon )

AddEntFireProperty( "rb655_func_train_start", "Start", 655, "func_train", "Start", "icon16/arrow_right.png" )
AddEntFireProperty( "rb655_func_train_stop", "Stop", 656, "func_train", "Stop", "icon16/arrow_left.png" )
AddEntFireProperty( "rb655_func_train_toggle", "Toggle", 657, "func_train", "Toggle", ToggleIcon )

-------------------------------------------------- Pickupable Items --------------------------------------------------

AddEntFunctionProperty( "rb655_item_suit", "Wear", 655, function( ent, ply )
	if ( ent:GetClass() != "item_suit" ) then return false end
	if ( !ply:IsSuitEquipped() ) then return true end
	return false
end, function( ent, ply )
	ent:Remove()
	ply:EquipSuit()
end, "icon16/user_green.png" )

local CheckFuncs = {}
CheckFuncs[ "item_ammo_pistol" ] = function( ply ) return ply:GetAmmoCount( "pistol" ) < 9999 end
CheckFuncs[ "item_ammo_pistol_large" ] = function( ply ) return ply:GetAmmoCount( "pistol" ) < 9999 end
CheckFuncs[ "item_ammo_smg1" ] = function( ply ) return ply:GetAmmoCount( "smg1" ) < 9999 end
CheckFuncs[ "item_ammo_smg1_large" ] = function( ply ) return ply:GetAmmoCount( "smg1" ) < 9999 end
CheckFuncs[ "item_ammo_smg1_grenade" ] = function( ply ) return ply:GetAmmoCount( "smg1_grenade" ) < 9999 end
CheckFuncs[ "item_ammo_ar2" ] = function( ply ) return ply:GetAmmoCount( "ar2" ) < 9999 end
CheckFuncs[ "item_ammo_ar2_large" ] = function( ply ) return ply:GetAmmoCount( "ar2" ) < 9999 end
CheckFuncs[ "item_ammo_ar2_altfire" ] = function( ply ) return ply:GetAmmoCount( "AR2AltFire" ) < 9999 end
CheckFuncs[ "item_ammo_357" ] = function( ply ) return ply:GetAmmoCount( "357" ) < 9999 end
CheckFuncs[ "item_ammo_357_large" ] = function( ply ) return ply:GetAmmoCount( "357" ) < 9999 end
CheckFuncs[ "item_ammo_crossbow" ] = function( ply ) return ply:GetAmmoCount( "xbowbolt" ) < 9999 end
CheckFuncs[ "item_rpg_round" ] = function( ply ) return ply:GetAmmoCount( "rpg_round" ) < 9999 end
CheckFuncs[ "item_box_buckshot" ] = function( ply ) return ply:GetAmmoCount( "buckshot" ) < 9999 end
CheckFuncs[ "item_battery" ] = function( ply ) return ply:Armor() < 100 end
CheckFuncs[ "item_healthvial" ] = function( ply ) return ply:Health() < 100 end
CheckFuncs[ "item_healthkit" ] = function( ply ) return ply:Health() < 100 end
CheckFuncs[ "item_grubnugget" ] = function( ply ) return ply:Health() < 100 end

AddEntFunctionProperty( "rb655_pickupitem", "Pick up", 655, function( ent, ply )
	if ( !table.HasValue( table.GetKeys( CheckFuncs ), ent:GetClass() ) ) then return false end
	if ( CheckFuncs[ ent:GetClass() ]( ply ) ) then return true end
	return false
end, function( ent, ply )
	ply:Give( ent:GetClass() )
	ent:Remove()
end, "icon16/user_green.png" )

-------------------------------------------------- NPCs --------------------------------------------------

-- Passive NPCs - You cannot make these hostile or friendly
local passive = {
	"npc_seagull", "npc_crow", "npc_piegon",  "monster_cockroach",
	"npc_dog", "npc_gman", "npc_antlion_grub",
	-- "monster_scientist", -- Can't attack, but does run away
	"monster_nihilanth", -- Doesn't attack from spawn menu, so not allowing to change his dispositions
	"npc_turret_floor" -- Uses a special input for this sort of stuff
}

local friendly = {
	"npc_monk", "npc_alyx", "npc_barney", "npc_citizen",
	"npc_turret_floor", "npc_dog", "npc_vortigaunt",
	"npc_kleiner", "npc_eli", "npc_magnusson", "npc_breen", "npc_mossman", -- They can use SHOTGUNS!
	"npc_fisherman", -- He sorta can use shotgun
	"monster_barney", "monster_scientist", "player"
}

local hostile = {
	"npc_turret_ceiling", "npc_combine_s", "npc_combinegunship", "npc_combinedropship",
	"npc_cscanner", "npc_clawscanner", "npc_turret_floor", "npc_helicopter", "npc_hunter", "npc_manhack",
	"npc_stalker", "npc_rollermine", "npc_strider", "npc_metropolice", "npc_turret_ground",
	"npc_cscanner", "npc_clawscanner", "npc_combine_camera", -- These are friendly to enemies

	"monster_human_assassin", "monster_human_grunt", "monster_turret", "monster_miniturret", "monster_sentry"
}

local monsters = {
	"npc_antlion", "npc_antlion_worker", "npc_antlionguard", "npc_barnacle", "npc_fastzombie", "npc_fastzombie_torso",
	"npc_headcrab", "npc_headcrab_fast", "npc_headcrab_black", "npc_headcrab_poison", "npc_poisonzombie", "npc_zombie", "npc_zombie_torso", "npc_zombine",
	"monster_alien_grunt", "monster_alien_slave", "monster_babycrab", "monster_headcrab", "monster_bigmomma", "monster_bullchicken", "monster_barnacle",
	"monster_alien_controller", "monster_gargantua", "monster_nihilanth", "monster_snark", "monster_zombie", "monster_tentacle", "monster_houndeye"
}

---------------------------- Functional stuff ----------------------------

local NPCsThisWorksOn = {}
local function RecalcUsableNPCs()
	-- Not resetting NPCsThisWorksOn as you can't remove classes from the tables below
	-- Not including passive monsters here, you can't make them hostile or friendly
	for _, class in pairs( friendly ) do NPCsThisWorksOn[ class ] = true end
	for _, class in pairs( hostile ) do NPCsThisWorksOn[ class ] = true end
	for _, class in pairs( monsters ) do NPCsThisWorksOn[ class ] = true end
end
RecalcUsableNPCs()

-- For mods
function ExtProp_AddPassive( class ) table.insert( passive, class ) end -- Probably shouldn't exist
function ExtProp_AddFriendly( class ) table.insert( friendly, class ) RecalcUsableNPCs() end
function ExtProp_AddHostile( class ) table.insert( hostile, class ) RecalcUsableNPCs() end
function ExtProp_AddMonster( class ) table.insert( monsters, class ) RecalcUsableNPCs() end

local friendliedNPCs = {}
local hostaliziedNPCs = {}
local function SetRelationships( ent, tab, status )
	for id, fnpc in pairs( tab ) do
		if ( !IsValid( fnpc ) ) then table.remove( tab, id ) continue end
		fnpc:AddEntityRelationship( ent, status, 999 )
		ent:AddEntityRelationship( fnpc, status, 999 )
	end
end

local function Rbt_ProcessOtherNPC( ent )
	if ( table.HasValue( friendly, ent:GetClass() ) && !table.HasValue( hostaliziedNPCs, ent ) ) then -- It's a friendly that isn't made hostile
		SetRelationships( ent, friendliedNPCs, D_LI )
		SetRelationships( ent, hostaliziedNPCs, D_HT )
	elseif ( table.HasValue( hostile, ent:GetClass() ) && !table.HasValue( friendliedNPCs, ent ) ) then -- It's a hostile that isn't made friendly
		SetRelationships( ent, friendliedNPCs, D_HT )
		SetRelationships( ent, hostaliziedNPCs, D_LI )
	elseif ( table.HasValue( monsters, ent:GetClass() ) && !table.HasValue( friendliedNPCs, ent ) && !table.HasValue( hostaliziedNPCs, ent ) ) then -- It's a monster that isn't made friendly or hostile to the player
		SetRelationships( ent, friendliedNPCs, D_HT )
		SetRelationships( ent, hostaliziedNPCs, D_HT )
	end
end

if ( SERVER ) then
	hook.Add( "OnEntityCreated", "rb655_properties_friently/hostile", function( ent )
		if ( ent:IsNPC() ) then Rbt_ProcessOtherNPC( ent ) end
	end )
end

AddEntFunctionProperty( "rb655_make_friendly", "Make Friendly", 652, function( ent )
	if ( ent:IsNPC() && !table.HasValue( passive, ent:GetClass() ) && NPCsThisWorksOn[ ent:GetClass() ] ) then return true end
	return false
end, function( ent )
	table.insert( friendliedNPCs, ent )
	table.RemoveByValue( hostaliziedNPCs, ent )

	-- Remove the NPC from any squads so the console doesn't spam. TODO: Add a suffix like _friendly instead?
	ent:Fire( "SetSquad", "" )

	-- Special case for stalkers
	if ( ent:GetClass() == "npc_stalker" ) then
		ent:SetSaveValue( "m_iPlayerAggression", 0 )
	end

	-- Is this even necessary anymore?
	for id, class in pairs( friendly ) do ent:AddRelationship( class .. " D_LI 999" ) end
	for id, class in pairs( monsters ) do ent:AddRelationship( class .. " D_HT 999" ) end
	for id, class in pairs( hostile ) do ent:AddRelationship( class .. " D_HT 999" ) end

	SetRelationships( ent, friendliedNPCs, D_LI )
	SetRelationships( ent, hostaliziedNPCs, D_HT )

	for id, oent in pairs( ents.GetAll() ) do
		if ( oent:IsNPC() && oent != ent ) then Rbt_ProcessOtherNPC( oent ) end
	end

	ent:Activate()
end, "icon16/user_green.png" )

AddEntFunctionProperty( "rb655_make_hostile", "Make Hostile", 653, function( ent )
	if ( ent:IsNPC() && !table.HasValue( passive, ent:GetClass() ) && NPCsThisWorksOn[ ent:GetClass() ] ) then return true end
	return false
end, function( ent )
	table.insert( hostaliziedNPCs, ent )
	table.RemoveByValue( friendliedNPCs, ent )

	-- Remove the NPC from any squads so the console doesn't spam. TODO: Add a suffix like _hostile instead?
	ent:Fire( "SetSquad", "" )

	-- Special case for stalkers
	if ( ent:GetClass() == "npc_stalker" ) then
		ent:SetSaveValue( "m_iPlayerAggression", 1 )
	end

	-- Is this even necessary anymore?
	for id, class in pairs( hostile ) do ent:AddRelationship( class .. " D_LI 999" ) end
	for id, class in pairs( monsters ) do ent:AddRelationship( class .. " D_HT 999" ) end
	for id, class in pairs( friendly ) do ent:AddRelationship( class .. " D_HT 999" ) end

	SetRelationships( ent, friendliedNPCs, D_HT )
	SetRelationships( ent, hostaliziedNPCs, D_LI )

	for id, oent in pairs( ents.GetAll() ) do
		if ( oent:IsNPC() && oent != ent ) then Rbt_ProcessOtherNPC( oent ) end
	end
end, "icon16/user_red.png" )

--addons/admin_sam/lua/sam/libs/sh_types.lua:
if SAM_LOADED then return end

-- https://gist.github.com/CapsAdmin/0d9c1e77d0fc22d910e182bfeb9812e5
local getmetatable = getmetatable

do
	local types = {
		["string"] = "",
		["boolean"] = true,
		["number"] = 0,
		["function"] = function() end,
		["thread"] = coroutine.create(getmetatable),
		["Color"] = Color(0, 0, 0),
	}

	for k, v in pairs(types) do
		if not getmetatable(v) then
			debug.setmetatable(v, {MetaName = k})
		else
			getmetatable(v).MetaName = k
		end
	end
end

function sam.type(value)
	if value == nil then
		return "nil"
	end
	local meta = getmetatable(value)
	if meta then
		meta = meta.MetaName
		if meta then
			return meta
		end
	end
	return "table"
end

do
	local function add(name)
		local new_name = name
		if name == "bool" then
			new_name = "boolean"
		end
		sam["is" .. name:lower()] = function(value)
			local meta = getmetatable(value)
			if meta and meta.MetaName == new_name then
				return true
			else
				return false
			end
		end
	end

	add("string")
	add("number")
	add("bool")
	add("function")

	add("Angle")
	add("Vector")
	add("Panel")
	add("Matrix")
end

function sam.isentity(value)
	local meta = getmetatable(value)
	if meta then
		if meta.MetaName == "Entity" then
			return true
		end
		meta = meta.MetaBaseClass
		if meta then
			return meta.MetaName == "Entity"
		end
	end
	return false
end
sam.IsEntity = sam.isentity

local type = sam.type
function sam.istable(value)
	return type(value) == "table"
end
--addons/admin_sam/lua/sam/player/sh_player.lua:
if SAM_LOADED then return end

local sam = sam
local config = sam.config

do
	local _player = {}
	sam.player = setmetatable(sam.player, {
		__index = _player,
		__newindex = function(_, k, v)
			_player[k] = v
			if sam.isfunction(v) and debug.getlocal(v, 1) == "ply" then
				FindMetaTable("Player")["sam_" .. k] = v
				sam.console["sam_" .. k] = v
			end
		end
	})
end

function sam.player.find_by_name(name)
	name = name:lower()
	local current, players = nil, player.GetAll()
	for i = 1, #players do
		local ply = players[i]
		local found = ply:Name():lower():find(name, 1, true)
		if found then
			if current then
				if not sam.istable(current) then
					current = {current, ply}
				else
					table.insert(current, ply)
				end
			else
				current = ply
			end
		end
	end
	return current
end

do
	if CLIENT then
		config.add_menu_setting("Chat Prefix (Leave empty for no prefix)", function()
			local entry = vgui.Create("SAM.TextEntry")
			entry:SetPlaceholder("")
			entry:SetNoBar(true)
			entry:SetConfig("ChatPrefix", "")

			return entry
		end)
	end

	function sam.player.send_message(ply, msg, tbl)
		if SERVER then
			if sam.isconsole(ply) then
				local result = sam.format_message(msg, tbl)
				sam.print(unpack(result, 1, result.__cnt))
			else
				return sam.netstream.Start(ply, "send_message", msg, tbl)
			end
		else
			local prefix_result = sam.format_message(config.get("ChatPrefix", ""))
			local prefix_n = #prefix_result

			local result = sam.format_message(msg, tbl, prefix_result, prefix_n)
			chat.AddText(unpack(result, 1, result.__cnt))
		end
	end

	if SERVER then
		function sam.player.add_text(ply, ...)
			if sam.isconsole(ply) then
				sam.print(...)
			else
				sam.netstream.Start(ply, "add_text", ...)
			end
		end
	end

	if CLIENT then
		sam.netstream.Hook("send_message", function(msg, tbl)
			sam.player.send_message(nil, msg, tbl)
		end)

		sam.netstream.Hook("add_text", function(...)
			chat.AddText(...)
		end)
	end
end

do
	local PLAYER = FindMetaTable("Player")

	timer.Simple(0, function()
		function PLAYER:GetUserGroup()
			return self:sam_get_nwvar("rank", "user")
		end
	end)

	function PLAYER:IsAdmin()
		return self:CheckGroup("admin")
	end

	function PLAYER:IsSuperAdmin()
		return self:CheckGroup("superadmin")
	end

	local inherits_from = sam.ranks.inherits_from
	function PLAYER:CheckGroup(name)
		return inherits_from(self:GetUserGroup(), name)
	end

	local has_permission = sam.ranks.has_permission
	function PLAYER:HasPermission(perm)
		return has_permission(self:GetUserGroup(), perm)
	end

	local can_target = sam.ranks.can_target
	function PLAYER:CanTarget(ply)
		return can_target(self:GetUserGroup(), ply:GetUserGroup())
	end

	function PLAYER:CanTargetRank(rank)
		return can_target(self:GetUserGroup(), rank)
	end

	local get_ban_limit = sam.ranks.get_ban_limit
	function PLAYER:GetBanLimit(ply)
		return get_ban_limit(self:GetUserGroup())
	end

	function PLAYER:sam_get_play_time()
		return self:sam_get_nwvar("play_time", 0) + self:sam_get_session_time()
	end

	function PLAYER:sam_get_session_time()
		return os.time() - self:sam_get_nwvar("join_time", 0)
	end

	if SERVER then
		function PLAYER:Ban(length)
			self:sam_ban(length)
		end

		-- if an addon like FPP loads before sam while DarkRP is installed, it will use darkrp.oldSetUserGroup which is gmod default
		-- so we add a timer to make sure sam's SetUserGroup gets called
		-- also i don't use (Set/Get)NwVar because when i send a hook that player rank changed to clients, ply:GetUserGroup won't be updated yet in clientside inside that hook
		timer.Simple(0, function()
			sam.oldSetUserGroup = sam.oldSetUserGroup or PLAYER.SetUserGroup
			function PLAYER:SetUserGroup(name)
				self:sam_set_nwvar("rank", name)
				return sam.oldSetUserGroup(self, name)
			end
		end)

		hook.Remove("PlayerInitialSpawn", "PlayerAuthSpawn")
	end
end

do
	local set_cooldown = function(ply, name, time)
		if not ply.sam_cool_downs then
			ply.sam_cool_downs = {}
		end
		ply.sam_cool_downs[name] = SysTime() + time
		return true
	end

	function sam.player.check_cooldown(ply, name, time)
		if not ply.sam_cool_downs or not ply.sam_cool_downs[name] then
			return set_cooldown(ply, name, time)
		end

		local current_time = SysTime()
		local cool_down = ply.sam_cool_downs[name]
		if cool_down > current_time then
			return false, cool_down - current_time
		else
			return set_cooldown(ply, name, time)
		end
	end
end

--addons/admin_sam_sui/lua/sui/vgui/sui_property_sheet.lua:
local draw = draw
local surface = surface
local vgui = vgui

local TYPE_MATERIAL = TYPE_MATERIAL

local RealFrameTime = RealFrameTime
local IsValid = IsValid
local Lerp = Lerp
local pairs = pairs
local TypeID = TypeID

local TDLib_Classes = sui.TDLib.LibClasses
local TextColor = TDLib_Classes.TextColor
local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name

local PROPERTY_SHEET_FONT = SUI.CreateFont("PropertySheet", "Roboto Regular", 18)

local PANEL = {}

AccessorFunc(PANEL, "m_FontName", "Font", FORCE_STRING)

function PANEL:Init()
	self.tabs = {}

	self:SetFont(PROPERTY_SHEET_FONT)

	local tab_scroller = self:Add("DHorizontalScroller")
	tab_scroller:Dock(TOP)

	self.tabs_tall = 26
	self.tab_scroller = tab_scroller

	self:ScaleChanged()
	SUI.OnScaleChanged(self, self.ScaleChanged)
end

function PANEL:ScaleChanged()
	self.tab_scroller:SetTall(SUI.Scale(self.tabs_tall))

	for k, v in pairs(self.tab_scroller.Panels) do
		if v:IsValid() then
			if v.Material then
				v:SetWide(self.tab_scroller:GetTall())
			else
				v:SizeToContentsX()
			end
		end
	end

	self:InvalidateLayout(true)
end

function PANEL:Paint(w, h)
	self:RoundedBox("Background", 1, 0, 0, w, self.tab_scroller:GetTall(), SUI.GetColor("property_sheet_bg"))
end

function PANEL:PaintOver(w, h)
	local active_tab = self:GetActiveTab()
	if not IsValid(active_tab) then return end

	local tab_scroller = self.tab_scroller
	local offset = tab_scroller:GetTall() - SUI.Scale(1)

	local x = active_tab:LocalToScreen(0) - self:LocalToScreen(0)

	if not self.activeTabX then
		self.activeTabX = x
		self.activeTabW = active_tab:GetWide()
	end

	local delta = RealFrameTime() * 6
	if delta then
		self.activeTabX = Lerp(delta, self.activeTabX, x)
		self.activeTabW = Lerp(delta, self.activeTabW, active_tab:GetWide())
	end

	self:RoundedBox("Background2", 1, self.activeTabX, tab_scroller.y + offset, self.activeTabW, SUI.Scale(1), SUI.GetColor("property_sheet_tab_active"))
end

local tab_Paint = function(s, w, h)
	s.circle_click_color = SUI.GetColor("property_sheet_tab_click")
	if s.property_sheet:GetActiveTab() == s then
		TextColor(s, SUI.GetColor("property_sheet_tab_active"))
	else
		TextColor(s, SUI.GetColor("property_sheet_tab"))
	end
end

local tab_DoClick = function(s)
	s.parent:SetActiveTab(s)
end

local image_paint = function(s, w, h)
	surface.SetDrawColor(color_white)
	surface.SetMaterial(s.Material)
	surface.DrawTexturedRectRotated(w * 0.5, h * 0.5, w - 10, h - 10, 0)
end

function PANEL:AddSheet(name, load_func)
	local tab = vgui.Create("DButton")
	if TypeID(name) == TYPE_MATERIAL then
		tab:SetText("")
		tab.Material = name
		tab.Paint = image_paint
		tab:SetWide(self.tab_scroller:GetTall())
	else
		tab:SetFont(self:GetFont())
		tab:SetText(name)
		tab:SetTextInset(10, 0)
		tab:SizeToContentsX()

		tab.Paint = tab_Paint
	end

	tab.parent = self
	tab.DoClick = tab_DoClick

	tab.load_func = load_func
	tab.property_sheet = self

	tab.On = TDLib_Classes.On
	TDLib_Classes.CircleClick(tab)

	self.tab_scroller:AddPanel(tab)

	if not self:GetActiveTab() then
		self:SetActiveTab(tab)
	end

	table.insert(self.tabs, tab)

	return tab
end

function PANEL:GetActiveTab()
	return self.active_tab
end

function PANEL:SetActiveTab(new_tab)
	if IsValid(new_tab) and not IsValid(new_tab.panel) then
		local panel = new_tab.load_func(self)
		panel:SetParent(self)
		panel:SetVisible(false)

		panel.tab = new_tab
		new_tab.panel = panel
	end

	if self.active_tab and IsValid(self.active_tab.panel) then
		self.active_tab.panel:SetVisible(false)
	end

	if IsValid(new_tab) then
		new_tab.panel:SetVisible(true)
	end

	self.active_tab = new_tab
end

sui.register("PropertySheet", PANEL, "EditablePanel")
--addons/admin_sam_sui/lua/sui/vgui/sui_query_box.lua:
local ScrW, ScrH = ScrW, ScrH
local DisableClipping = DisableClipping
local SetDrawColor = surface.SetDrawColor
local DrawRect = surface.DrawRect
local BlurPanel = sui.TDLib.BlurPanel
local lerp_color = sui.lerp_color

local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name

local GetColor = SUI.GetColor

local PANEL = {}

function PANEL:SetCallback(callback)
	self.callback = callback
end

function PANEL:Init()
	self:SetSize(0, 0)

	local bottom = self:Add("Panel")
	bottom:Dock(BOTTOM)
	bottom:DockMargin(4, 10, 4, 4)
	bottom:SetZPos(100)

	local save = bottom:Add(NAME .. ".Button")
	save:SetText("SAVE")
	save:Dock(RIGHT)
	save:SetEnabled(false)
	self.save = save

	function save.DoClick()
		self.callback()
		self:Remove()
	end

	local cancel = bottom:Add(NAME .. ".Button")
	cancel:Dock(RIGHT)
	cancel:DockMargin(0, 0, 4, 0)
	cancel:SetContained(false)
	cancel:SetColors(GetColor("query_box_cancel"), GetColor("query_box_cancel_text"))
	cancel:SetText("CANCEL")
	self.cancel = cancel

	function cancel.DoClick()
		self:Remove()
	end

	bottom:SetSize(save:GetWide() * 2 + 4, SUI.Scale(30))

	local body = self:Add("Panel")
	body:Dock(FILL)
	body:DockMargin(4, 4, 4, 4)
	body:DockPadding(3, 3, 3, 3)
	body:InvalidateLayout(true)
	body:InvalidateParent(true)

	local added = 1
	function body.OnChildAdded(s, child)
		added = added + 1
		child:Dock(TOP)
		child:SetZPos(added)
		child:InvalidateLayout(true)
		s:InvalidateLayout(true)
	end
	self.body = body

	function self:Add(name)
		return body:Add(name)
	end

	local old_Paint = self.Paint
	local trans = Color(0, 0, 0, 0)
	local new_col = Color(70, 70, 70, 100)
	function self:Paint(w, h)
		lerp_color(trans, new_col)

		local x, y = self:LocalToScreen(0, 0)
		DisableClipping(true)
			BlurPanel(self)
			SetDrawColor(trans)
			DrawRect(x * -1, y * -1, ScrW(), ScrH())
		DisableClipping(false)

		old_Paint(self, w, h)
	end
end

function PANEL:ChildrenHeight()
	local body = self.body

	self.header:InvalidateLayout(true)
	local height = self.header:GetTall()

	body:InvalidateLayout(true)
	self:InvalidateLayout(true)
	height = height + select(2, body:ChildrenSize())

	height = height + SUI.Scale(30) + 14 + 6

	return height
end

function PANEL:Paint(w, h)
	if GetColor("frame_blur") then
		BlurPanel(self)
	end

	self:RoundedBox("Background", 8, 0, 0, w, h, GetColor("query_box_bg"))
end

function PANEL:Done()
	self:InvalidateChildren(true)

	self.size_to_children = function()
		local h = self:ChildrenHeight()
		self:RealSetSize(self:GetWide(), h)
		self.real_h = h
	end

	self:Center()
	self:MakePopup()
	self:DoModal(true)

	timer.Simple(0.08, function()
		self:AddAnimations(self:GetWide(), self:ChildrenHeight(), true)
	end)
end

sui.register("QueryBox", PANEL, NAME .. ".Frame")
--addons/weapons_other/lua/autorun/sh_handcuffs.lua:
-------------------------------------
---------------- Cuffs --------------
-------------------------------------
-- Copyright (c) 2015 Nathan Healy --
-------- All rights reserved --------
-------------------------------------
-- sh_handcuffs.lua         SHARED --
--                                 --
-- Shared handcuff stuff.          --
-------------------------------------

AddCSLuaFile()

//
// Config
local ProtectedJobs = {
	"TEAM_ADMIN", "TEAM_MOD", "TEAM_MODERATOR",
}

// 
// Utility
local function GetTrace( ply )
	local tr = util.TraceLine( {start=ply:EyePos(), endpos=ply:EyePos()+(ply:GetAimVector()*100), filter=ply} )
	if IsValid(tr.Entity) and tr.Entity:IsPlayer() then
		local cuffed,wep = tr.Entity:IsHandcuffed()
		if cuffed then return tr,wep end
	end
end

//
// PLAYER extensions
local PLAYER = FindMetaTable( "Player" )
function PLAYER:IsHandcuffed()
	local wep = self:GetActiveWeapon()
	if IsValid(wep) and wep.IsHandcuffs then
		return true,wep
	end
	
	return false
end

//
// Override Movement
hook.Add( "SetupMove", "Cuffs Move Penalty", function(ply, mv, cmd)
	local cuffed, cuffs = ply:IsHandcuffed()
	if not (cuffed and IsValid(cuffs)) then return end
	
	mv:SetMaxClientSpeed( mv:GetMaxClientSpeed()*0.6 )
	
	if cuffs:GetRopeLength()<=0 then return end // No forced movement
	if not IsValid(cuffs:GetKidnapper()) then return end // Nowhere to move to
	
	local kidnapper = cuffs:GetKidnapper()
	if kidnapper==ply then return end
	
	local TargetPoint = (kidnapper:IsPlayer() and kidnapper:GetShootPos()) or kidnapper:GetPos()
	local MoveDir = (TargetPoint - ply:GetPos()):GetNormal()
	local ShootPos = ply:GetShootPos() + (Vector(0,0, (ply:Crouching() and 0)))
	local Distance = cuffs:GetRopeLength()
	
	local distFromTarget = ShootPos:Distance( TargetPoint )
	if distFromTarget<=(Distance+5) then return end
	if ply:InVehicle() then
		if SERVER and (distFromTarget>(Distance*3)) then
			ply:ExitVehicle()
		end
		
		return
	end
	
	local TargetPos = TargetPoint - (MoveDir*Distance)
	
	local xDif = math.abs(ShootPos[1] - TargetPos[1])
	local yDif = math.abs(ShootPos[2] - TargetPos[2])
	local zDif = math.abs(ShootPos[3] - TargetPos[3])
	
	local speedMult = 3+ ( (xDif + yDif)*0.5)^1.01
	local vertMult = math.max((math.Max(300-(xDif + yDif), -10)*0.08)^1.01  + (zDif/2),0)
	
	if kidnapper:GetGroundEntity()==ply then vertMult = -vertMult end
	
	local TargetVel = (TargetPos - ShootPos):GetNormal() * 10
	TargetVel[1] = TargetVel[1]*speedMult
	TargetVel[2] = TargetVel[2]*speedMult
	TargetVel[3] = TargetVel[3]*vertMult
	local dir = mv:GetVelocity()
	
	local clamp = 50
	local vclamp = 20
	local accel = 200
	local vaccel = 30*(vertMult/50)
	
	dir[1] = (dir[1]>TargetVel[1]-clamp or dir[1]<TargetVel[1]+clamp) and math.Approach(dir[1], TargetVel[1], accel) or dir[1]
	dir[2] = (dir[2]>TargetVel[2]-clamp or dir[2]<TargetVel[2]+clamp) and math.Approach(dir[2], TargetVel[2], accel) or dir[2]
	
	if ShootPos[3]<TargetPos[3] then
		dir[3] = (dir[3]>TargetVel[3]-vclamp or dir[3]<TargetVel[3]+vclamp) and math.Approach(dir[3], TargetVel[3], vaccel) or dir[3]
		
		if vertMult>0 then ply.Cuff_ForceJump=ply end
	end
	
	mv:SetVelocity( dir )
	
	if SERVER and mv:GetVelocity():Length()>=(mv:GetMaxClientSpeed()*10) and ply:IsOnGround() and CurTime()>(ply.Cuff_NextDragDamage or 0) then
		ply:SetHealth( ply:Health()-1 )
		if ply:Health()<=0 then ply:Kill() end
		
		ply.Cuff_NextDragDamage = CurTime()+0.1
	end
end)

//
// Vehicles
hook.Add( "CanPlayerEnterVehicle", "Cuffs PreventVehicle", function( ply )
	-- if ply:IsHandcuffed() then return false end
end)

//
// Internal Cuffs hooks
hook.Add( "CuffsCanHandcuff", "Cuff ProtectAdmin", function( ply, target )
	if IsValid(target) and target:IsPlayer() and ProtectedJobs then
		for i=1,#ProtectedJobs do
			if ProtectedJobs[i] and _G[ ProtectedJobs[i] ] and target:Team()==_G[ ProtectedJobs[i] ] then return false end
		end
	end
end)

if CLIENT then
	//
	// HUD
	local Col = {
		Text = Color(255,255,255), TextShadow=Color(0,0,0), Rope = Color(255,255,255),
		
		BoxOutline = Color(0,0,0), BoxBackground = Color(255,255,255,20), BoxLeft = Color(255,0,0), BoxRight = Color(0,255,0),
	}
	local matGrad = Material( "gui/gradient" )
	hook.Add( "HUDPaint", "Cuffs CuffedInteractPrompt", function()
		if LocalPlayer():IsHandcuffed() then return end
		
		local tr,cuff = GetTrace( LocalPlayer() )
		if not (tr and IsValid(cuff)) then return end
		
		local w,h = (ScrW()/2), (ScrH()/2)
		
		local TextPos = h-40
		
				
		if IsValid(cuff:GetFriendBreaking()) then
			if cuff:GetFriendBreaking()==LocalPlayer() then
		surface.SetDrawColor( Col.BoxOutline )
		surface.DrawOutlinedRect( w-101, TextPos-1, 202, 22 )
		surface.SetDrawColor( Col.BoxBackground )
		surface.DrawRect( w-100, TextPos, 200, 20 )
		
		render.SetScissorRect( w-100, TextPos, (w-100)+((cuff:GetCuffBroken()/100)*200), TextPos+20, true )
			surface.SetDrawColor( Col.BoxRight )
			surface.DrawRect( w-100,TextPos, 200,20 )
			
			surface.SetMaterial( matGrad )
			surface.SetDrawColor( Col.BoxLeft )
			surface.DrawTexturedRect( w-100,TextPos, 200,20 )
		render.SetScissorRect( 0,0,0,0, false )
		TextPos = TextPos-25

				draw.SimpleText( "Befreie Gefangenen...", "HandcuffsText", w+1, TextPos+1, Col.TextShadow, TEXT_ALIGN_CENTER )
				draw.SimpleText( "Befreie Gefangenen...", "HandcuffsText", w, TextPos, Col.Text, TEXT_ALIGN_CENTER )
				TextPos = TextPos-20
			end
		end
		


		
	end)
	
	//
	// Bind hooks
	hook.Add( "PlayerBindPress", "Cuffs CuffedInteract", function(ply, bind, pressed)
		if ply~=LocalPlayer() then return end
		
		if bind:lower()=="+attack" and pressed then
			if ply:KeyDown( IN_USE ) then
				local isDragging = false
				for _,c in pairs(ents.FindByClass("weapon_handcuffed")) do
					if c.GetRopeLength and c.GetKidnapper and c:GetRopeLength()>0 and c:GetKidnapper()==ply then
						isDragging=true
						break
					end
				end
				if isDragging then
					net.Start("Cuffs_TiePlayers") net.SendToServer()
					return true
				end
			end
		elseif bind:lower()=="+use" and pressed then
				local tr = util.TraceLine( {start=ply:EyePos(), endpos=ply:EyePos()+(ply:GetAimVector()*100), filter=ply} )
				if IsValid(tr.Entity) and tr.Entity:GetNWBool("Cuffs_TieHook") then
					net.Start("Cuffs_UntiePlayers") net.SendToServer()
				end
		end
	end)
	
	//
	// Render
	local DragBone = "ValveBiped.Bip01_R_Hand"
	local DefaultRope = Material("cable/rope")
	hook.Add( "PostDrawOpaqueRenderables", "Cuffs DragRope", function()
		local allCuffs = ents.FindByClass( "weapon_handcuffed" )
		for i=1,#allCuffs do
			local cuff = allCuffs[i]
			if not (IsValid(cuff) and IsValid(cuff.Owner) and cuff.GetRopeLength and cuff:GetRopeLength()>0 and cuff.GetKidnapper and IsValid(cuff:GetKidnapper())) then continue end
			
			local kidnapper = cuff:GetKidnapper()
			local kidPos = (kidnapper:IsPlayer() and kidnapper:GetPos() + Vector(0,0,37)) or kidnapper:GetPos()
			
			local pos = cuff.Owner:GetPos()
			local bone = cuff.Owner:LookupBone( DragBone )
			if bone then
				pos = cuff.Owner:GetBonePosition( bone )
				if (pos.x==0 and pos.y==0 and pos.z==0) then pos = cuff.Owner:GetPos() end
			end
			
			if not cuff.RopeMat then cuff.RopeMat = DefaultRope end
			render.SetMaterial( cuff.RopeMat )
			render.DrawBeam( kidPos, pos, 0.7, 0, 5, Col.Rope )
			render.DrawBeam( pos, kidPos, -0.7, 0, 5, Col.Rope )
		end
	end)
	
	local HeadBone = "ValveBiped.Bip01_Head1"
	local RenderPos = {
		Blind = {Vector(3.5,3,2.6), Vector(3.8,4.8,0), Vector(3.5,3,-2.8), Vector(2.4,-2,-3.8), Vector(1.5,-4.5,0), Vector(2.4,-2,3.8)},
		Gag = {Vector(1.0,4.2,2), Vector(1.0,5.5,-0.1), Vector(1.0,4.5,-2), Vector(0,0,-3.4), Vector(-0.8,-3,0), Vector(0,0,3.4)},
	}
	hook.Add( "PostPlayerDraw", "Cuffs DrawGag", function( ply )
		if not IsValid(ply) then return end
		
		local cuffed, cuff = ply:IsHandcuffed()
		if not (cuffed and IsValid(cuff)) then return end
		
		render.SetMaterial( DefaultRope )
		if cuff:GetIsBlind() then
			local pos,ang
			local bone = cuff.Owner:LookupBone( HeadBone )
			if bone then
				pos, ang = cuff.Owner:GetBonePosition( bone )
			end
			if pos and ang then
				local firstpos = pos + (ang:Forward()*RenderPos.Blind[1].x) + (ang:Right()*RenderPos.Blind[1].y) + (ang:Up()*RenderPos.Blind[1].z)
				local lastpos = firstpos
				for i=2,#RenderPos.Blind do
					local newPos = pos + (ang:Forward()*RenderPos.Blind[i].x) + (ang:Right()*RenderPos.Blind[i].y) + (ang:Up()*RenderPos.Blind[i].z)
					render.DrawBeam( newPos, lastpos, 1.5, 0, 1, Col.Rope )
					lastpos = newPos
				end
				render.DrawBeam( lastpos, firstpos, 1.5, 0, 1, Col.Rope )
			end
		end
		if cuff:GetIsGagged() then
			local pos,ang
			local bone = cuff.Owner:LookupBone( HeadBone )
			if bone then
				pos, ang = cuff.Owner:GetBonePosition( bone )
			end
			if pos and ang then
				local firstpos = pos + (ang:Forward()*RenderPos.Gag[1].x) + (ang:Right()*RenderPos.Gag[1].y) + (ang:Up()*RenderPos.Gag[1].z)
				local lastpos = firstpos
				for i=2,#RenderPos.Gag do
					local newPos = pos + (ang:Forward()*RenderPos.Gag[i].x) + (ang:Right()*RenderPos.Gag[i].y) + (ang:Up()*RenderPos.Gag[i].z)
					render.DrawBeam( newPos, lastpos, 1.5, 0, 1, Col.Rope )
					lastpos = newPos
				end
				render.DrawBeam( lastpos, firstpos, 1.5, 0, 1, Col.Rope )
			end
		end
	end)
end

--addons/aoc_nextbots/lua/summe_nextbots/cl_main.lua:
surface.CreateFont( "SummeNB.Title", {
	font = "Agency FB",
	extended = true,
	size = 50,
	weight = 1,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = false,
})

surface.CreateFont( "SummeNB.Debug", {
	font = "Roboto",
	extended = false,
	size = 40,
	weight = 200,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = true,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = false,
})
--addons/aocrp_pixelui/lua/pixelui/core/cl_color.lua:

--[[
PIXEL UI
Copyright (C) 2021 Tom O'Sullivan (Tom.bat)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
]]

do
    local format = string.format
    function PIXEL.DecToHex(dec, zeros)
        return format("%0" .. (zeros or 2) .. "x", dec)
    end

    local max = math.max
    local min = math.min
    function PIXEL.ColorToHex(color)
        return format("#%02X%02X%02X",
            max(min(color.r, 255), 0),
            max(min(color.g, 255), 0),
            max(min(color.b, 255), 0)
        )
    end
end

function PIXEL.ColorToHSL(col)
    local r = col.r / 255
    local g = col.g / 255
    local b = col.b / 255
    local max, min = math.max(r, g, b), math.min(r, g, b)
    b = max + min

    local h = b / 2
    if max == min then return 0, 0, h end

    local s, l = h, h
    local d = max - min
    s = l > .5 and d / (2 - b) or d / b

    if max == r then
        h = (g - b) / d + (g < b and 6 or 0)
    elseif max == g then
        h = (b - r) / d + 2
    elseif max == b then
        h = (r - g) / d + 4
    end

    return h * .16667, s, l
end

local createColor = Color
do
    local function hueToRgb(p, q, t)
        if t < 0 then t = t + 1 end
        if t > 1 then t = t - 1 end
        if t < 1 / 6 then return p + (q - p) * 6 * t end
        if t < 1 / 2 then return q end
        if t < 2 / 3 then return p + (q - p) * (2 / 3 - t) * 6 end
        return p
    end

    function PIXEL.HSLToColor(h, s, l, a)
        local r, g, b
        local t = h / (2 * math.pi)

        if s == 0 then
            r, g, b = l, l, l
        else
            local q
            if l < 0.5 then
                q = l * (1 + s)
            else
                q = l + s - l * s
            end

            local p = 2 * l - q
            r = hueToRgb(p, q, t + 1 / 3)
            g = hueToRgb(p, q, t)
            b = hueToRgb(p, q, t - 1 / 3)
        end

        return createColor(r * 255, g * 255, b * 255, (a or 1) * 255)
    end
end

function PIXEL.CopyColor(col)
    return createColor(col.r, col.g, col.b, col.a)
end

function PIXEL.OffsetColor(col, offset)
    return createColor(col.r + offset, col.g + offset, col.b + offset)
end

do
    local match = string.match
    local tonumber = tonumber

    function PIXEL.HexToColor(hex)
        local r, g, b = match(hex, "#(..)(..)(..)")
        return createColor(
            tonumber(r, 16),
            tonumber(g, 16),
            tonumber(b, 16)
        )
    end
end

do
    local curTime = CurTime
    local hsvToColor = HSVToColor

    local lastUpdate = 0
    local lastCol = createColor(0, 0, 0)

    function PIXEL.GetRainbowColor()
        local time = curTime()
        if lastUpdate == time then return lastCol end

        lastUpdate = time
        lastCol = hsvToColor((time * 50) % 360, 1, 1)

        return lastCol
    end
end

do
    local colorToHSL = ColorToHSL

    function PIXEL.IsColorLight(col)
        local _, _, lightness = colorToHSL(col)
        return lightness >= .5
    end
end

function PIXEL.LerpColor(t, from, to)
    return createColor(from.r, from.g, from.b, from.a):Lerp(t, to)
end

function PIXEL.IsColorEqualTo(from, to)
    return from.r == to.r and from.g == to.g and from.b == to.b and from.a == to.a
end

local colorMeta = FindMetaTable("Color")
colorMeta.Copy = PIXEL.CopyColor
colorMeta.IsLight = PIXEL.IsColorLight
colorMeta.EqualTo = PIXEL.IsColorEqualTo

function colorMeta:Offset(offset)
    self.r = self.r + offset
    self.g = self.g + offset
    self.b = self.b + offset
    return self
end

--[[ local lerp = Lerp
function colorMeta:Lerp(t, to)
    self.r = lerp(t, self.r, to.r)
    self.g = lerp(t, self.g, to.g)
    self.b = lerp(t, self.b, to.b)
    self.a = lerp(t, self.a, to.a)
    return self
end
 ]]
--addons/aocrp_pixelui/lua/pixelui/drawing/cl_overheads.lua:

--[[
PIXEL UI
Copyright (C) 2021 Tom O'Sullivan (Tom.bat)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
]]

PIXEL.RegisterFontUnscaled("UI.Overhead", "Open Sans Bold", 100)

local localPly
local function checkDistance(ent)
    if not IsValid(localPly) then localPly = LocalPlayer() end
    if localPly:GetPos():DistToSqr(ent:GetPos()) > 200000 then return true end
end

local disableClipping = DisableClipping
local start3d2d, end3d2d = cam.Start3D2D, cam.End3D2D
local Icon = icon

local function drawOverhead(ent, pos, text, ang, scale)
    if ang then
        ang = ent:LocalToWorldAngles(ang)
    else
        ang = (pos - localPly:GetPos()):Angle()
        ang:SetUnpacked(0, ang[2] - 90, 90)
    end

    PIXEL.SetFont("UI.Overhead")
    local w, h = PIXEL.GetTextSize(text)
    w = w + 40
    h = h + 6

    local x, y = -(w * .5), -h

    local oldClipping = disableClipping(true)

    start3d2d(pos, ang, scale or 0.05)
    if not Icon then
        PIXEL.DrawRoundedBox(12, x, y, w, h, PIXEL.Colors.Primary)
        PIXEL.DrawText(text, "UI.Overhead", 0, y + 1, PIXEL.Colors.PrimaryText, TEXT_ALIGN_CENTER)
    else
        x = x - 40
        PIXEL.DrawRoundedBox(12, x, y, h, h, PIXEL.Colors.Primary)
        PIXEL.DrawRoundedBoxEx(12, x + (h - 12), y + h - 20, w + 15, 20, PIXEL.Colors.Primary, false, false, false, true)
        PIXEL.DrawText(text, "UI.Overhead", x + h + 15, y + 8, PIXEL.Colors.PrimaryText)
        PIXEL.DrawImgur(x + 10, y + 10, h - 20, h - 20, Icon, color_white)
    end
    end3d2d()

    disableClipping(oldClipping)
end

local entOffset = 2
function PIXEL.DrawEntOverhead(ent, text, angleOverride, posOverride, scaleOverride)
    if checkDistance(ent) then return end

    if posOverride then
        drawOverhead(ent, ent:LocalToWorld(posOverride), text, angleOverride, scaleOverride)
        return
    end

    local pos = ent:OBBMaxs()
    pos:SetUnpacked(0, 0, pos[3] + entOffset)

    drawOverhead(ent, ent:LocalToWorld(pos), text, angleOverride, scaleOverride)
end

local eyeOffset = Vector(0, 0, 7)
local fallbackOffset = Vector(0, 0, 73)
function PIXEL.DrawNPCOverhead(ent, text, angleOverride, offsetOverride, scaleOverride)
    if checkDistance(ent) then return end

    local eyeId = ent:LookupAttachment("eyes")
    if eyeId then
        local eyes = ent:GetAttachment(eyeId)
        if eyes then
            eyes.Pos:Add(offsetOverride or eyeOffset)
            drawOverhead(ent, eyes.Pos, text, angleOverride, scaleOverride)
            return
        end
    end

    drawOverhead(ent, ent:GetPos() + fallbackOffset, text, angleOverride, scaleOverride)
end

function PIXEL.EnableIconOverheads(new)
    local oldIcon = Icon
    Icon = new
    return oldIcon
end
--addons/joes_stuff/lua/shielddlc/sh_config.lua:
-- should you be able to shoot out of the shield
SWRPShield.shootoutofshield = true

-- Health of the personal shield
SWRPShield.personalshieldhp = 300

-- Cooldown of the personal shield
SWRPShield.personalshieldcooldown = 60
--addons/weapons_other/lua/autorun/sh_starwarsfusioncutter_convars.lua:
local convarFlags = {FCVAR_NOTIFY}
local convarPrefix = "sv_starwarsfusioncutter_"

CreateConVar(convarPrefix .. "enable_door_unlocking", 1, convarFlags) -- Allow door unlocking
--addons/sse_101/lua/sse/cl_lib.lua:
-- Everything was coded in 1920x1080 - just Convert it
local w = 1920
local h = 1080

function SSEW(sw)
return ScrW() * ((sw or 0) / w)
end

function SSEH(sh)
return ScrH() * ((sh or 0) / h)
end



-- Taken from PixelUI
SSE_Imgur_Materials = {}

file.CreateDir("SSE")

function SSE.GetImgur(id, callback, useproxy, matSettings)
    if SSE_Imgur_Materials[id] then return callback(SSE_Imgur_Materials[id]) end

    if file.Exists("SSE/" .. id .. ".png", "DATA") then
        SSE_Imgur_Materials[id] = Material("../data/SSE/" .. id .. ".png", matSettings or "noclamp smooth mips")
        return callback(SSE_Imgur_Materials[id])
    end

    http.Fetch(useproxy and "https://proxy.duckduckgo.com/iu/?u=https://i.imgur.com" or "https://i.imgur.com/" .. id .. ".png",
        function(body, len, headers, code)
            if len > 2097152 then
                SSE_Imgur_Materials[id] = Material("nil")
                return callback(SSE_Imgur_Materials[id])
            end
            file.Write("SSE/" .. id .. ".png", body)
            SSE_Imgur_Materials[id] = Material("../data/SSE/" .. id .. ".png", matSettings or "noclamp smooth mips")

            return callback(SSE_Imgur_Materials[id])
        end,
        function(error)
            if useproxy then
                SSE_Imgur_Materials[id] = Material("nil")
                return callback(SSE_Imgur_Materials[id])
            end
            return SSE.GetImgur(id, callback, true)
        end
    )
end


function SSE.Scale(value)
    return math.max(value * (ScrH() / 1440), 1)
end

-- IMGUI FONT

-- String->Bool mappings for whether font has been created
local _createdFonts = {}

-- Cached IMGUIFontNamd->GModFontName
local _imguiFontToGmodFont = {}

local EXCLAMATION_BYTE = string.byte("!")
function SSE.xFont(font, defaultSize)
	-- special font
	if string.byte(font, 1) == EXCLAMATION_BYTE then

		local existingGFont = _imguiFontToGmodFont[font]
		if existingGFont then
			return existingGFont
		end

		-- Font not cached; parse the font
		local name, size, weight = font:match("!([^@]+)@([^#]+)#(.+)")
		if size then size = tonumber(size) end
		if weight then weight = tonumber(weight) end

		if not size and defaultSize then
			name = font:match("^!([^@]+)$")
			size = defaultSize
		end

		weight = weight or 1  -- Default weight if not specified
        print(weight)

		local fontName = string.format("SSE_%s_%d_%d", name, size, weight)
		_imguiFontToGmodFont[font] = fontName
		if not _createdFonts[fontName] then
			surface.CreateFont(fontName, {
				font = name,
				size = SSE.Scale(size),
				weight = weight
			})
			_createdFonts[fontName] = true
		end

		return fontName
	end
	return font
end



function SSE:DrawTextShadow(string, font, x, y, color, align, shadowcolor)

    if shadowcolor then 
        if !IsColor(shadowcolor) then shadowcolor = Color(0,0,0) end
    else
        shadowcolor = Color(0,0,0) 
    end

    draw.DrawText(string,font, x+1, y+1, shadowcolor, align)
    draw.DrawText(string,font, x, y, color, align)
    
end



function SSE:DefaultFrame(title)
    title = title or "Frame"

    local MainFrame = vgui.Create("DFrame")
    MainFrame:SetSize(600, 400)
    MainFrame:Center()
    MainFrame:SetDraggable(true)
    MainFrame:SetTitle("")
    MainFrame:ShowCloseButton(false)
    MainFrame:SetSizable(true)
    MainFrame:MakePopup()
    MainFrame:DockPadding(25, 25, 25, 25)
    MainFrame:SetMinimumSize(400, 200)

    local btnWide = 70
    local btnHeight = 25
    local lineColor = Color(255, 255, 255)

    function MainFrame:Paint(w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 210))
        draw.RoundedBox(0, 10, 10, 5, h - 20, lineColor)
        draw.RoundedBox(0, 10, 10, w - btnWide - 30, 5, lineColor)
        draw.RoundedBox(0, 10, h - 15, w - 20, 5, lineColor)
        draw.RoundedBox(0, w - 15, 10 + btnHeight + 10, 5, h - 20 - btnHeight - 10, lineColor)
    end

    

    function MainFrame:Think()
        if input.IsKeyDown(KEY_ESCAPE) then
            self:Remove()
        end
    end

    local TitlePanel = vgui.Create("DPanel", MainFrame)
    TitlePanel:Dock(TOP)
    TitlePanel:SetTall(55)
    TitlePanel:DockMargin(0, 0, 0, 5)
    local textPadding = 20
    title = string.upper(title)

    function MainFrame:SetNewTitle(text)
        title = string.upper(text)
    end

    local currentFont = SSE.xFont(SSE.Config.FrameTitleFont)

    function TitlePanel:Paint(w, h)
        surface.SetFont(currentFont)
        local textW, textH = surface.GetTextSize(title)
        self:SetTall(textH)
        draw.RoundedBox(0, 0, 0, textW + textPadding, h - 3, Color(255, 255, 255))
        draw.DrawText(title, currentFont, 10, 0, Color(0, 0, 0), TEXT_ALIGN_LEFT)
    end

    local CloseButton = vgui.Create("DButton", MainFrame)
    CloseButton:SetText("")

    function CloseButton:Paint(w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(155, 0, 0, 255))
    end

    function ResizeButtonToFrameSize(w, h)
        CloseButton:SetPos(w - btnWide - 10, 10)
        CloseButton:SetSize(btnWide, btnHeight)
    end

    function CloseButton:DoClick()
        MainFrame:Remove()
    end

    ResizeButtonToFrameSize(MainFrame:GetWide(), MainFrame:GetTall())

    function MainFrame:OnSizeChanged(w, h)
        ResizeButtonToFrameSize(w, h)
    end

    return MainFrame
end



function SSE:Button(panel, text, func, style)
    style = style or "b"
    local DButton = vgui.Create("DButton",panel)

    DButton:SetText("")
    DButton.textfont = SSE.xFont(SSE.Config.ButtonFont)
    surface.SetFont(DButton.textfont)
    local textW, textH = surface.GetTextSize(text)

    DButton:SetTall(textH+SSEH(10))
    DButton:SetWide(textW+SSEW(30))

    function DButton:SetNewText(text)
        self.printtext = text

        surface.SetFont(DButton.textfont)
        local textW, textH = surface.GetTextSize(text)
    
        DButton:SetTall(textH+SSEH(10))
        DButton:SetWide(textW+SSEW(30))
    end

    DButton.printtext = text
    DButton.btncolor = Color(0,0,0,210)
    DButton.akzent = Color(200,200,200,255)
    DButton.akzenthover = Color(255,255,255,255)
    DButton.textcolor = Color(200,200,200,255)
    DButton.textcolorhover = Color(255,255,255,255)
    DButton.akcl = DButton.akzent
    DButton.txtcl = DButton.textcolor
    DButton.akzentsize = 3
    DButton.fillcolor = Color(0,0,0,200)
    local top = string.find(style, "t")
    local bot = string.find(style, "b")
    local left = string.find(style, "l")
    local right = string.find(style, "r")
    local fill = string.find(style, "c")
    
    function DButton:Paint(w,h)
        self.akcl = self:IsHovered() and self.akzenthover or self.akzent
        self.txtcl = self:IsHovered() and self.textcolorhover or self.textcolor
        
        if fill then
            draw.RoundedBox(0, 0, 0, w, h, DButton.fillcolor)
        end
        
        if top then
            draw.RoundedBox(0, 0, 0, w, self.akzentsize, DButton.akcl)
        end
        
        if bot then
            draw.RoundedBox(0, 0, h-self.akzentsize, w, self.akzentsize, DButton.akcl)
        end   

        if left then
            draw.RoundedBox(0, 0, 0, self.akzentsize, h, DButton.akcl)
        end

        if right then
            draw.RoundedBox(0, w-self.akzentsize, 0, self.akzentsize, h, DButton.akcl)
        end
    
        surface.SetFont(self.textfont)
        local txtW, txtH = surface.GetTextSize(text)

        draw.DrawText(self.printtext, self.textfont, w/2, h/2-txtH/2, self.txtcl, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    function DButton:DoClick()
        func(self)
    end
    
    return DButton
end


function SSE:TextEntry(panel,placeholder)
	local TextEntry = vgui.Create( "DTextEntry", panel ) -- create the form as a child of frame

    TextEntry:SetFont(SSE.xFont("!Agency FB@35#1"))
    TextEntry:SetPlaceholderText(placeholder)
    TextEntry:SetTextColor(Color(255,255,255,255))
    TextEntry:SetPlaceholderColor(Color(200,200,200))
    TextEntry:SetCursorColor(Color(255,255,255,255))
    TextEntry:SetDrawBackground(false)
    TextEntry:SetDrawBorder(true)
    function TextEntry:PaintOver(w,h) 
        surface.SetDrawColor( 255, 255, 255, 128 )
        surface.DrawOutlinedRect(0,0,w,h,1)
        return
    end
	return TextEntry
end

function SSE:ScrollBar(parent) 
    local DScrollPanel = vgui.Create("DScrollPanel", parent)
    --DScrollPanel:SetSize(400, 250)
    --DScrollPanel:Center()

    local sbar = DScrollPanel:GetVBar()
    function sbar:Paint(w, h)
        draw.RoundedBox(0, SSEW(5), 0, SSEW(10), h, Color(0, 0, 0, 100))
    end
    function sbar.btnUp:Paint(w, h)
        --draw.RoundedBox(0, SSEW(5), 0, SSEW(10), h, Color(175, 175, 175))
    end
    function sbar.btnDown:Paint(w, h)
        --draw.RoundedBox(0, SSEW(5), 0, SSEW(10), h, Color(175, 175, 175))
    end
    function sbar.btnGrip:Paint(w, h)
        draw.RoundedBox(0, SSEW(5), 0, SSEW(10), h, Color(255, 255, 255))
    end

    return DScrollPanel
end










local interactbind = input.LookupBinding( "use" )
function SSE:TraceEntityHUD()

    local ent = LocalPlayer():GetEyeTrace().Entity
    if !IsValid(ent) then return end
    if ent:IsWorld() then return end
    if ent:GetPos():DistToSqr(LocalPlayer():GetPos()) > SSE.Config.HUDDistance*SSE.Config.HUDDistance then return end

    if ent.SSE_HUDName then
        SSE:DrawTextShadow(ent.SSE_HUDName or "", SSE.xFont("!Agency FB@45#1000"), ScrW()/2,ScrH()/2-SSEH(30), Color(255,255,255), TEXT_ALIGN_CENTER)
        SSE:DrawTextShadow(string.format(SSE.Config.HUDInteractLang ,string.upper(interactbind)),SSE.xFont("!Agency FB@35#1"), ScrW()/2,ScrH()/2, Color(255,255,255), TEXT_ALIGN_CENTER)
    end
end

hook.Add("HUDPaint", "SSE.HudPaint", function()
    SSE:TraceEntityHUD()
end)





















--lua/autorun/venator_bacta.lua:
-- Created by Oninoni
-- Based on Code by Syphadias
-- Huge thanks to them!

-- This has to match the map Name
if not (game.GetMap() == "rp_venator_extensive_v1_4") then return end

-- The Ammount of Bacta Tanks that are used
local bactaCount = 2

-- The Name of the prop_vehicle_prisoner_pod without its suffix (e.g. bacta1, bacta2, ... -> bacta)
local entityName = "bacta"

-- Bacta Seat Don't fricking touch anything below this line!
local Category = "Map Utilities"
local function StandAnimation( vehicle, player )
	return player:SelectWeightedSequence( ACT_GMOD_NOCLIP_LAYER )
end
local V = {
    Name = "Bacta Tank Seat",
	Model = "models/lordtrilobite/starwars/props/bactatankb.mdl",
    Class = "prop_vehicle_prisoner_pod",
    Category = Category,
 
    Author = "Syphadias, Oninoni",
    Information = "Seat with custom animation",
    Offset = 16,
 
    KeyValues = {
        vehiclescript = "scripts/vehicles/prisoner_pod.txt",
        limitview = "0"
    },
    Members = {
        HandleAnimation = StandAnimation
    }
}
list.Set( "Vehicles", "bacta_seat", V )
 
if SERVER then
    local seatCache = {}
    local function IsValidSeat(seat)
        local seat = seatCache[seat]
     
        if seat and IsValid(seat) then
			return true
        end
     
        return false
    end
	
	hook.Add("Think", "UpdateseatPosBacta", function()
		for i = 1, bactaCount, 1 do
			if !IsValidSeat(i) then
				seatCache[i] = ents.FindByName(entityName .. i)[1]

				if !IsValidSeat(i) then
					continue
				end
			end

			seatCache[i]:SetVehicleClass("bacta_seat")
		end
	end)
end
--lua/wos/anim_extension/extensions/wos_prone.lua:
--[[-------------------------------------------------------------------
	wiltOS Animation Extension Register:
		Prints some feedback saying the Animation Extension successfully loaded.
			Powered by
						  _ _ _    ___  ____  
				__      _(_) | |_ / _ \/ ___| 
				\ \ /\ / / | | __| | | \___ \ 
				 \ V  V /| | | |_| |_| |___) |
				  \_/\_/ |_|_|\__|\___/|____/ 
											  
 _____         _                 _             _           
|_   _|__  ___| |__  _ __   ___ | | ___   __ _(_) ___  ___ 
  | |/ _ \/ __| '_ \| '_ \ / _ \| |/ _ \ / _` | |/ _ \/ __|
  | |  __/ (__| | | | | | | (_) | | (_) | (_| | |  __/\__ \
  |_|\___|\___|_| |_|_| |_|\___/|_|\___/ \__, |_|\___||___/
                                         |___/             
-------------------------------------------------------------------]]--[[
							  
	Lua Developer: King David
	Contact: http://steamcommunity.com/groups/wiltostech
		
----------------------------------------]]--

wOS.AnimExtension.Mounted[ "Prone Mod" ] = true
MsgC( Color( 255, 255, 255 ), "[wOS] Successfully mounted animation extension: Prone Mod\n" )
--lua/wos/anim_extension/vgui/wiltos_anim_viewer.lua:
--[[-------------------------------------------------------------------
	wiltOS Animation Viewer:
		A Supplement to the animation base, it allows you to view more than	
					2000 animations/sequences with it's model viewer
			Powered by
						  _ _ _    ___  ____  
				__      _(_) | |_ / _ \/ ___| 
				\ \ /\ / / | | __| | | \___ \ 
				 \ V  V /| | | |_| |_| |___) |
				  \_/\_/ |_|_|\__|\___/|____/ 
											  
 _____         _                 _             _           
|_   _|__  ___| |__  _ __   ___ | | ___   __ _(_) ___  ___ 
  | |/ _ \/ __| '_ \| '_ \ / _ \| |/ _ \ / _` | |/ _ \/ __|
  | |  __/ (__| | | | | | | (_) | | (_) | (_| | |  __/\__ \
  |_|\___|\___|_| |_|_| |_|\___/|_|\___/ \__, |_|\___||___/
                                         |___/             
-------------------------------------------------------------------]]--[[
							  
	Lua Developer: King David
	Contact: http://steamcommunity.com/groups/wiltostech
		
----------------------------------------]]--
wOS = wOS or {}

local w, h = ScrW(), ScrH()

surface.CreateFont( "wOS.Anim.TitleFont", {
	font = "Roboto Cn", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 24*(h/1200),
	weight = 1000,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "wOS.Anim.DescFont",{
	font = "Roboto Cn", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 18*(h/1200),
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

list.Add( "DesktopWindows", {
	icon = "wos/anim_extension/emblem.png",
	title = "wiltOS Viewer",
	init = function() wOS:OpenAnimationMenu() end,
})

function wOS:OpenAnimationMenu()

	if self.OverFrame then 
		self.OverFrame:Remove()
		self.OverFrame = nil
		gui.EnableScreenClicker( false )
		return 
	end

	self.OverFrame = vgui.Create( "DFrame" )
	self.OverFrame:SetSize( w, h )
	self.OverFrame:Center()
	self.OverFrame.Paint = function() end
	self.OverFrame:SetTitle( "" )
	self.OverFrame:ShowCloseButton( false )
	self.OverFrame:SetDraggable( false )
	
	gui.EnableScreenClicker( true )
	self.AnimMenu = vgui.Create( "DFrame", self.OverFrame )
	self.AnimMenu:SetSize( w*0.5, h*0.5 )
	self.AnimMenu:Center()
	self.AnimMenu.Display = LocalPlayer():GetModel()
	self.AnimMenu:MakePopup()
	self.AnimMenu:SetTitle( "" )
	self.AnimMenu:ShowCloseButton( false )
	self.AnimMenu:SetDraggable( false )
	
	local fw, fh = self.AnimMenu:GetSize()
	local padx = fh*0.025
	local pady = padx
	
	local modelmenu = vgui.Create( "DAdjustableModelPanel", self.AnimMenu )
	modelmenu:SetPos( padx, pady )
	modelmenu:SetSize( fw/2 - padx - padx/2, fh - 2*pady )
	modelmenu.LayoutEntity = function() local ent = modelmenu:GetEntity() ent:SetEyeTarget( modelmenu:GetCamPos() ) ent:FrameAdvance( FrameTime() ) end
	
	self.AnimMenu.Paint = function( pan, ww, hh )
		if not vgui.CursorVisible() then gui.EnableScreenClicker( true ) end
		draw.RoundedBox( 3, 0, 0, ww, hh, Color( 25, 25, 25, 245 ) )
		--draw.SimpleText( "Animation Viewer", "wOS.Anim.TitleFont", ww/2, hh*0.05, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )	
		surface.SetDrawColor( Color( 0, 155, 155, 255 ) )
		surface.DrawOutlinedRect( padx, pady, modelmenu:GetWide(), modelmenu:GetTall() )
	end 
		
	local lister = vgui.Create( "DListView", self.AnimMenu )
	lister:SetPos( fw/2 + padx/2, pady )
	lister:SetSize( fw/2 - padx - padx/2, fh*0.77 - pady)	
	lister:AddColumn( "Name" )
	lister:SetMultiSelect( false )
	lister:SetHideHeaders( true )
	lister.Pages = {}
	lister.CurrentPage = 1
	
	function lister:Think()
		if wOS.AnimMenu.Display != modelmenu:GetModel() then
			modelmenu:RebuildModel()
		end	
	end
	
	function lister:RebuildCache( ent )
		lister:Clear()
		lister.BasePages = {} // SUPERIOR JACOBS EDIT // https://steamcommunity.com/id/AwesomeJacob/
		lister.Pages = {}
		lister.CurrentPage = 1
		local max = 500
		local count = 0
		local curpage = 1
		for k, v in SortedPairsByValue( ent:GetSequenceList() ) do
			if not lister.BasePages[ curpage ] then lister.BasePages[ curpage ] = {} end
			if count < max then
				table.insert( lister.BasePages[ curpage ], string.lower( v ) )
				if curpage == 1 then
					local line = lister:AddLine( string.lower( v ) )
					line.OnSelect = function()
						ent:ResetSequence( v )
						ent:SetCycle( 0 )
					end
				end
				count = count + 1
			else
				curpage = curpage + 1
				count = 0
			end
		end

		lister.Pages = lister.BasePages
	end

	// SUPERIOR JACOBS EDIT
	// https://steamcommunity.com/id/AwesomeJacob/
	function lister:RebuildToLines( ent, lines )
		lister:Clear()
		lister.Pages = {}
		lister.CurrentPage = 1
		local max = 500
		local count = 0
		local curpage = 1
		for k, v in SortedPairsByValue( lines ) do
			if not lister.Pages[ curpage ] then lister.Pages[ curpage ] = {} end
			if count < max then
				table.insert( lister.Pages[ curpage ], string.lower( v ) )
				if curpage == 1 then
					local line = lister:AddLine( string.lower( v ) )
					line.OnSelect = function()
						ent:ResetSequence( v )
						ent:SetCycle( 0 )
					end
				end
				count = count + 1
			else
				curpage = curpage + 1
				count = 0
			end
		end
	end
	//

	function lister:ChangePage( page )
		lister:Clear()
		if not page then return end	
		if not lister.Pages[ page ] then return end
		local ent = modelmenu:GetEntity()
		for k, v in pairs( lister.Pages[ page ] ) do
			local line = lister:AddLine( string.lower( v ) )
			line.OnSelect = function()
				ent:ResetSequence( v )
				ent:SetCycle( 0 )
			end
		end

		lister:SelectFirstItem()
	end

	function modelmenu:RebuildModel()
		modelmenu:SetModel( wOS.AnimMenu.Display )
		local ent = modelmenu:GetEntity()
		local pos = ent:GetPos()
		local campos = pos + Vector( -150, 0, 0 )
		modelmenu:SetCamPos( campos )
		modelmenu:SetFOV( 45 )
		modelmenu:SetLookAng( ( campos * -1 ):Angle() )
		lister:RebuildCache( modelmenu:GetEntity() )
	end

	local nextbutt = vgui.Create( "DButton", self.AnimMenu )
	nextbutt:SetSize( fw*0.15, fh*0.05 )
	nextbutt:SetPos( fw*0.85 - padx, fh*0.95 - pady*1.5 - nextbutt:GetTall() )
	nextbutt:SetText( "" )
	nextbutt.Paint = function( pan, ww, hh )
		draw.RoundedBox( 5, 0, 0, ww, hh, ( pan:IsDown() and Color( 0, 55, 155, 155 ) ) or Color( 155, 155, 155, 155 ) )
		draw.SimpleText( "NEXT PAGE", "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	nextbutt.DoClick = function( pan )
		lister.CurrentPage = math.Clamp( lister.CurrentPage + 1, 1, #lister.Pages )
		lister:ChangePage( lister.CurrentPage )
	end
	
	// SUPERIOR JACOBS EDIT
	// https://steamcommunity.com/id/AwesomeJacob/
	local pagedisplay = vgui.Create( "DLabel", self.AnimMenu )
	pagedisplay:SetSize( fw*0.15, fh*0.05 )
	pagedisplay:SetPos( fw/2 + padx/2, fh*0.95 - pady*2 - nextbutt:GetTall() - pagedisplay:GetTall() )
	pagedisplay:SetText( "" )
	pagedisplay.Paint = function( pan, ww, hh )
		draw.RoundedBox( 5, 0, 0, ww, hh, Color( 155, 155, 155, 155 ) )
		draw.SimpleText( "PAGE: "..lister.CurrentPage.."/"..#lister.Pages, "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local searchbar = vgui.Create( "DTextEntry", self.AnimMenu )
	searchbar:SetSize( fw*0.15 * 1.5, fh*0.05 * 0.8 )
	searchbar:SetPos( fw*0.85 - padx + fw*0.15 - searchbar:GetWide(), fh*0.95 - pady*2 - nextbutt:GetTall() - fh*0.05/2 - searchbar:GetTall()/2 )
	searchbar:SetFont("wOS.Anim.DescFont")
	searchbar:SetText( "" )

	local searchtext = vgui.Create( "DButton", self.AnimMenu )
	searchtext:SetSize( fw*0.15 * 0.5, fh*0.05 )
	searchtext:SetPos( fw/2 + padx/2 + fw*0.15 + padx, fh*0.95 - pady*2 - nextbutt:GetTall() - searchtext:GetTall() )
	searchtext:SetText( "" )
	searchtext.Paint = function( pan, ww, hh )
		draw.RoundedBox( 5, 0, 0, ww, hh, ( pan:IsDown() and Color( 0, 55, 155, 155 ) ) or Color( 155, 155, 155, 155 ) )
		draw.SimpleText( "SEARCH", "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	searchtext.DoClick = function( pan )
		local var = string.lower(searchbar:GetValue())
		local page = 1
		local line = 0

		if (var == "") then
			lister.Pages = lister.BasePages
			lister:ChangePage( page )
		else
			local found = {}
									
			for i = 1, #lister.BasePages do
				for _, v in ipairs( lister.BasePages[i] ) do
					if (string.find(v, var)) then
						table.insert(found, v)
					end
				end
			end

			lister:RebuildToLines( modelmenu:GetEntity(), found )
		end
	end
	//

	local prevbutt = vgui.Create( "DButton", self.AnimMenu )
	prevbutt:SetSize( fw*0.15, fh*0.05 )
	prevbutt:SetPos( fw/2 + padx/2, fh*0.95 - pady*1.5 - prevbutt:GetTall() )
	prevbutt:SetText( "" )
	prevbutt.Paint = function( pan, ww, hh )
		draw.RoundedBox( 5, 0, 0, ww, hh, ( pan:IsDown() and Color( 0, 55, 155, 155 ) ) or Color( 155, 155, 155, 155 ) )
		draw.SimpleText( "PREVIOUS PAGE", "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	prevbutt.DoClick = function( pan )
		lister.CurrentPage = math.Clamp( lister.CurrentPage - 1, 1, #lister.Pages )
		lister:ChangePage( lister.CurrentPage )
	end
	
	local replaybutt = vgui.Create( "DButton", self.AnimMenu )
	replaybutt:SetSize( fw*0.15, fh*0.05 )
	replaybutt:SetPos( fw/2 + padx/2 + replaybutt:GetWide() + padx, fh*0.95 - pady*1.5 - replaybutt:GetTall() )
	replaybutt:SetText( "" )
	replaybutt.Paint = function( pan, ww, hh )
		draw.RoundedBox( 5, 0, 0, ww, hh, ( pan:IsDown() and Color( 0, 55, 155, 155 ) ) or Color( 155, 155, 155, 155 ) )
		draw.SimpleText( "REPLAY SELECTION", "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	replaybutt.DoClick = function( pan )
		local selected = lister:GetSelectedLine()
		if not selected then return end
		local ent = modelmenu:GetEntity()
		ent:ResetSequence( lister:GetLines()[ selected ]:GetValue( 1 ) )
		ent:SetCycle( 0 )		
	end
	
	local closebutt = vgui.Create( "DButton", self.AnimMenu )
	closebutt:SetSize( fw*0.3, fh*0.05 )
	closebutt:SetPos( fw/2 + fw*0.1, fh*0.95 - pady )
	closebutt:SetText( "" )
	closebutt.Paint = function( pan, ww, hh )
		draw.RoundedBox( 5, 0, 0, ww, hh, ( pan:IsDown() and Color( 0, 55, 155, 155 ) ) or Color( 155, 155, 155, 155 ) )
		draw.SimpleText( "CLOSE MENU", "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	closebutt.DoClick = function( pan )
		wOS:OpenAnimationMenu()	
	end
	
	local mw, mh = modelmenu:GetSize()
	
	local infoframe = vgui.Create( "DPanel", modelmenu )
	infoframe:SetSize( mw, mh*0.2 )
	infoframe:SetPos( 0, mh*0.8 )
	infoframe.Paint = function( pan, ww, hh )
		if not lister:GetLines()[ lister:GetSelectedLine() ] then return end
		local title = lister:GetLines()[ lister:GetSelectedLine() ]:GetValue( 1 )
		local ent = modelmenu:GetEntity()
		local act = ent:LookupSequence( title )
		draw.SimpleText( "SEQUENCE: " .. title, "wOS.Anim.DescFont", ww/2, hh*0.25, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		if act then
			local actn = ent:GetSequenceActivityName( act )
			act = ent:GetSequenceActivity( act )
			if not act then 
				draw.SimpleText( "ACT ID: NONE", "wOS.Anim.DescFont", ww/2, hh*0.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			else
				draw.SimpleText( "ACT ID: " .. act, "wOS.Anim.DescFont", ww/2, hh*0.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			end
			if not actn then 
				draw.SimpleText( "ACT NAME: N/A", "wOS.Anim.DescFont", ww/2, hh*0.75, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			else
				draw.SimpleText( "ACT NAME: " .. actn, "wOS.Anim.DescFont", ww/2, hh*0.75, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			end
		end	
	end
	
	local holdframe = vgui.Create( "DFrame", self.OverFrame )
	holdframe:SetSize( fw*0.3, fh*0.1 )
	holdframe:SetPos( fw*1.5 + fw*0.01, fh - fh/2 )
	holdframe:SetText( "" )
	holdframe:SetTitle( "" )
	holdframe:ShowCloseButton( false )
	holdframe:SetDraggable( false )
	holdframe.Paint = function( pan, ww, hh )
		draw.RoundedBox( 3, 0, 0, ww, hh, Color( 25, 25, 25, 245 ) )
	end
	holdframe.Think = function( pan )
		local endy = fh*0.1
		if pan.Expand then
			endy = fh
		end
		pan:SetTall( math.Approach( pan:GetTall(), endy, 15 ) )
	end
	holdframe.Expand = false
	holdframe:MakePopup()
	
	local iw, ih = holdframe:GetSize()
	
	local togglebutt = vgui.Create( "DButton", holdframe )
	togglebutt:SetSize( iw*0.9, fh*0.05 )
	togglebutt:SetPos( iw*0.05, ih - fh*0.075 )
	togglebutt:SetText( "" )
	togglebutt.Paint = function( pan, ww, hh )
		draw.RoundedBox( 5, 0, 0, ww, hh, ( pan:IsDown() and Color( 0, 55, 155, 155 ) ) or Color( 155, 155, 155, 155 ) )
		draw.SimpleText( ( holdframe.Expand and "Close Holdtype Creator" ) or "Open Holdtype Creator", "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	
	local ACTS = { 
		[ "Idle Standing" ] = "ACT_MP_STAND_IDLE", 
		[ "Slow Walk" ] = "ACT_MP_WALK", 
		[ "Running" ] = "ACT_MP_RUN", 
		[ "Sprinting" ] = "ACT_MP_SPRINT",
		[ "Idle Crouching" ] = "ACT_MP_CROUCH_IDLE", 
		[ "Walk Crouching" ] = "ACT_MP_CROUCHWALK", 
		[ "Attack Standing" ] = "ACT_MP_ATTACK_STAND_PRIMARYFIRE",
		[ "Attack Crouching" ] = "ACT_MP_ATTACK_CROUCH_PRIMARYFIRE",
		[ "Reload Standing" ] = "ACT_MP_RELOAD_STAND",
		[ "Reload Crouching" ] = "ACT_MP_RELOAD_CROUCH",
		[ "Swimming" ] = "ACT_MP_SWIM",
		[ "Jumping" ] = "ACT_MP_JUMP",
		[ "Landing" ] = "ACT_LAND",
	}
	
	local title = vgui.Create( "DLabel", holdframe )
	title:SetSize( iw*0.8, fh*0.05 )
	title:SetPos( iw*0.05, ih )
	title:SetText( "Base Holdtype:" )
	title:SetFont( "wOS.Anim.TitleFont" )
	
	local basetype = vgui.Create( "DTextEntry", holdframe )
	basetype:SetSize( iw*0.8, fh*0.03 )
	basetype:SetPos( iw*0.05, ih + fh*0.05 )
	
	local baselist = vgui.Create( "DImageButton", holdframe )
	baselist:SetSize( fh*0.03, fh*0.03 )
	baselist:SetPos( iw*0.86, ih + fh*0.05 )
	baselist:SetImage( "icon16/application_view_list.png" )	
	baselist.DoClick = function( pan )
		if pan.ItemIconOptions then pan.ItemIconOptions:Remove() pan.ItemIconOptions = nil end
		pan.ItemIconOptions = DermaMenu( baselist )
		pan.ItemIconOptions:MakePopup()
		pan.ItemIconOptions:SetPos( gui.MouseX(), gui.MouseY() )
		pan.ItemIconOptions.Think = function( self )
			if not pan then self:Remove() end
		end
		local holdlist = { "pistol", "smg", "grenade", "ar2", "shotgun", "rpg", "physgun", "crossbow", "melee", "slam", "normal", "fist", "melee2", "passive", "knife", "duel", "camera", "magic", "revolver" }
		for name, _ in pairs( wOS.AnimExtension.TranslateHoldType ) do
			table.insert( holdlist, name )
		end
		for _, typ in ipairs( holdlist ) do
			pan.ItemIconOptions:AddOption( typ, function( self ) 
				basetype:SetText( typ )
				self:Remove()
			end )
		end			
	end
	
	local title = vgui.Create( "DLabel", holdframe )
	title:SetSize( iw*0.9, fh*0.05 )
	title:SetPos( iw*0.05, ih + fh*0.09 )
	title:SetText( "Holdtype Name:" )
	title:SetFont( "wOS.Anim.TitleFont" )
	
	local nametext = vgui.Create( "DTextEntry", holdframe )
	nametext:SetSize( iw*0.9, fh*0.03 )
	nametext:SetPos( iw*0.05, ih + fh*0.15 )
	
	local title = vgui.Create( "DLabel", holdframe )
	title:SetSize( iw*0.9, fh*0.05 )
	title:SetPos( iw*0.05, ih + fh*0.19 )
	title:SetText( "Holdtype Code:" )
	title:SetFont( "wOS.Anim.TitleFont" )
	
	local prefix = vgui.Create( "DTextEntry", holdframe )
	prefix:SetSize( iw*0.9, fh*0.03 )
	prefix:SetPos( iw*0.05, ih + fh*0.25 )
	prefix:SetText( "wos-custom-xxx" )
	
	local title2 = vgui.Create( "DLabel", holdframe )
	title2:SetSize( iw*0.9, fh*0.05 )
	title2:SetPos( iw*0.05, ih + fh*0.29 )
	title2:SetText( "Current Action:" )
	title2:SetFont( "wOS.Anim.TitleFont" )
	
	local DComboBox = vgui.Create( "DComboBox", holdframe )
	DComboBox:SetSize( iw*0.9, fh*0.03 )
	DComboBox:SetPos( iw*0.05, ih + fh*0.35 )
	DComboBox:SetValue( "Idle Standing" )
	for act, _ in pairs( ACTS ) do
		DComboBox:AddChoice( act )
	end
	
	local AddSeq = vgui.Create( "DButton", holdframe )
	AddSeq:SetSize( iw*0.9, fh*0.05 )
	AddSeq:SetPos( iw*0.05, fh*0.515 )
	AddSeq:SetText( "" )
	AddSeq.Paint = function( pan, ww, hh )
		draw.RoundedBox( 5, 0, 0, ww, hh, ( pan:IsDown() and Color( 0, 55, 155, 155 ) ) or Color( 155, 155, 155, 155 ) )
		draw.SimpleText( "Add Selected Sequence", "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	
	local AppList = vgui.Create( "DListView", holdframe )
	AppList:SetSize( iw*0.9, fh*0.3 )
	AppList:SetPos( iw*0.05, fh*0.6 )
	AppList:SetMultiSelect( false )
	AppList:AddColumn( "Animation" )
	AppList:AddColumn( "Weight" )
	AppList.OnRowRightClick = function( pan, id, line )
		if pan.ItemIconOptions then pan.ItemIconOptions:Remove() pan.ItemIconOptions = nil end
		pan.ItemIconOptions = DermaMenu( AppList )
		pan.ItemIconOptions:MakePopup()
		pan.ItemIconOptions:SetPos( gui.MouseX(), gui.MouseY() )
		pan.ItemIconOptions.Think = function( self )
			if not pan then self:Remove() end
		end
		pan.ItemIconOptions:AddOption( "Change Weight", function( self ) 

			local Scratch = vgui.Create( "DNumberScratch", holdframe:GetParent() )
			Scratch:SetSize( 1, 1 )
			Scratch:Center()
			Scratch:MakePopup()
			Scratch:SetValue( pan.Selections[ pan.ActSelect ][ line:GetValue( 1 ) ]*100 or 100 )
			Scratch:SetMin( 0 )
			Scratch:SetMax( 100 )
			Scratch.OnMousePressed = function() end
			Scratch.OnMouseReleased = function() end
			Scratch.OnValueChanged = function( panz )
				pan.Selections[ pan.ActSelect ][ line:GetValue( 1 ) ] = math.Round( panz:GetFloatValue() )/100
			end
			Scratch.Think = function( panz )
				if input.IsMouseDown( MOUSE_LEFT ) or input.IsMouseDown( MOUSE_RIGHT ) then
					panz:Remove()
					AppList:ReloadAll()
					return
				end
				panz:SetActive( true )
				panz:MouseCapture( true )
				panz:LockCursor()
				if ( !system.IsLinux() ) then
					panz:SetCursor( "none" )
				end
				panz:SetShouldDrawScreen( true )
			end
			hook.Add( "DrawOverlay", "wOS.AnimExtension.ReallyFuckedUpWorkAround", function()
				if ( !IsValid( Scratch ) ) then hook.Remove( "DrawOverlay", "wOS.AnimExtension.ReallyFuckedUpWorkAround" ) return end
				Scratch:PaintScratchWindow()
			end )
			self:Remove()
		end )	
		pan.ItemIconOptions:AddOption( "Remove", function( self ) 
			pan.Selections[ pan.ActSelect ][ line:GetValue( 1 ) ] = nil
			pan:RemoveLine( id )
			self:Remove()
		end )	
	end
	AppList.Selections = {}
	AppList.ActSelect = DComboBox:GetValue()
	AppList.ReloadAll = function( pan ) 
		pan:Clear()
		if pan.Selections[ pan.ActSelect ] then
			for sequence, weight in pairs( pan.Selections[ pan.ActSelect ] ) do
				pan:AddLine( sequence, weight * 100 .. "%" )
			end
		end
	end
	AppList:ReloadAll()
	
	AddSeq.DoClick = function( pan )
		local l = lister:GetSelected()[1]
		if l then
			AppList:AddLine( l:GetValue(1), "100%" )
			if not AppList.Selections[ AppList.ActSelect ] then
				AppList.Selections[ AppList.ActSelect ] = {}
			end
			AppList.Selections[ AppList.ActSelect ][ l:GetValue(1) ] = 1
		end
	end
	
	DComboBox.OnSelect = function( panel, index, value )
		AppList.ActSelect = value
		AppList:ReloadAll()
	end
	
	togglebutt.DoClick = function( pan )
		holdframe.Expand = !holdframe.Expand
		if !holdframe.Expand then
			basetype:SetText( "" )
			nametext:SetText( "" )
			prefix:SetText( "wos-custom-xxx" )
			DComboBox:SetValue( "Idle Standing" )
			AppList.ActSelect = "Idle Standing"
			AppList.Selections = {}
			AppList:ReloadAll()
		end
	end
	
	local CreateHoldType = vgui.Create( "DButton", holdframe )
	CreateHoldType:SetSize( iw*0.9, fh*0.05 )
	CreateHoldType:SetPos( iw*0.05, fh*0.925 )
	CreateHoldType:SetText( "" )
	CreateHoldType.Paint = function( pan, ww, hh )
		draw.RoundedBox( 5, 0, 0, ww, hh, ( pan:IsDown() and Color( 0, 55, 155, 155 ) ) or Color( 155, 155, 155, 155 ) )
		draw.SimpleText( "Print Holdtype ( Console )", "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	CreateHoldType.DoClick = function( pan )
		chat.AddText( color_white, "[", Color( 0, 175, 255 ), "wOS", color_white, "] The Holdtype code has been printed into console!" )
		local name = ( nametext:GetText():len() > 0 and nametext:GetText() ) or "Rename Me" 
		local pref = ( prefix:GetText():len() > 0 and prefix:GetText() ) or "wos-custom-xxx" 
		local base = ( basetype:GetText():len() > 0 and basetype:GetText() ) or "normal"
		print( [[--=====================================================================]] )
		print( [[/*		My Custom Holdtype
			Created by ]] .. LocalPlayer():Nick() .. [[( ]] .. LocalPlayer():SteamID() .. [[ )*/]])
		print( [[
local DATA = {}
DATA.Name = "]] .. name .. [["
DATA.HoldType = "]] .. pref .. [["
DATA.BaseHoldType = "]] .. base .. [["
DATA.Translations = {} 
]])
		for slot, data in pairs( AppList.Selections ) do
			if table.Count( data ) > 0 then
				print( [[DATA.Translations[ ]] .. ACTS[slot] .. [[ ] = {]] )
				for seq, weight in pairs( data ) do
					print( [[	{ Sequence = "]] .. seq .. [[", Weight = ]] .. weight .. [[ },]])
				end
				print( [[}]] )
				print( "" )
			end
		end
		print( [[wOS.AnimExtension:RegisterHoldtype( DATA )]] )
		print( [[--=====================================================================]] )
	end
	
end
--lua/wos/anim_extension/holdtypes/leapattack.lua:
--[[-------------------------------------------------------------------
	Blade Symphony Judgement - Heavy Hold Type:
		Uses the Heavy variation of the Judgement animations from Blade Symphony to create a variety Hold Type
			Powered by
						  _ _ _    ___  ____  
				__      _(_) | |_ / _ \/ ___| 
				\ \ /\ / / | | __| | | \___ \ 
				 \ V  V /| | | |_| |_| |___) |
				  \_/\_/ |_|_|\__|\___/|____/ 
											  
 _____         _                 _             _           
|_   _|__  ___| |__  _ __   ___ | | ___   __ _(_) ___  ___ 
  | |/ _ \/ __| '_ \| '_ \ / _ \| |/ _ \ / _` | |/ _ \/ __|
  | |  __/ (__| | | | | | | (_) | | (_) | (_| | |  __/\__ \
  |_|\___|\___|_| |_|_| |_|\___/|_|\___/ \__, |_|\___||___/
                                         |___/             
----------------------------- Copyright 2017, David "King David" Wiltos ]]--[[
							  
	Lua Developer: King David
	Contact: http://steamcommunity.com/groups/wiltostech
		
-- Copyright 2017, David "King David" Wiltos ]]--


local DATA = {}

DATA.Name = "character holdtype"
DATA.HoldType = "leapattack"
DATA.BaseHoldType = "melee2"
DATA.Translations = {}

DATA.Translations[ ACT_MP_STAND_IDLE ]					= "customcharacter_idle"
DATA.Translations[ ACT_MP_WALK ]						= "walk_charactercustom"
DATA.Translations[ ACT_MP_RUN ]							= "run_charactercustom"
DATA.Translations[ ACT_MP_CROUCH_IDLE ]					= "couch_idle"
DATA.Translations[ ACT_MP_CROUCHWALK ]					= "cwalk_melee1"
DATA.Translations[ ACT_MP_ATTACK_STAND_PRIMARYFIRE ]	= "leapattack" 
DATA.Translations[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	= "leapattack" 
--DATA.Translations[ ACT_MP_RELOAD_STAND ]				= IdleActivity + 6
--DATA.Translations[ ACT_MP_RELOAD_CROUCH ]				= IdleActivity + 6
DATA.Translations[ ACT_MP_JUMP ]						= "inair"
--DATA.Translations[ ACT_MP_SWIM ]						= IdleActivity + 9
DATA.Translations[ ACT_LAND ]							= "wos_bs_shared_jump_land"

wOS.AnimExtension:RegisterHoldtype( DATA )
--addons/wos-passiveevent-ageo/lua/autorun/wos_pes_enums.lua:
--[[-------------------------------------------------------------------]]--[[
							  
	Copyright wiltOS Technologies LLC, 2021
	
	Contact: www.wiltostech.com
		
----------------------------------------]]--

WOS_PES = WOS_PES or {}

WOS_PES.EVENT = WOS_PES.EVENT or {}
WOS_PES.EVENT.ERROR = -1
WOS_PES.EVENT.MANUAL = 0
WOS_PES.EVENT.RANDOM = 1
WOS_PES.EVENT.SCHEDULED = 2
WOS_PES.EVENT.SIMULATION = 3

WOS_PES.CREATOR = WOS_PES.CREATOR or {}
WOS_PES.CREATOR.EVENT = 0
WOS_PES.CREATOR.SIMULATION = 1

WOS_PES.CLEAN_MODE = WOS_PES.CLEANUPMODES or {}
WOS_PES.CLEAN_MODE.TITLE = "Clean Up Mode"
WOS_PES.CLEAN_MODE.FULL = "Full"
WOS_PES.CLEAN_MODE.NONE = "None"
WOS_PES.CLEAN_MODE.OBJECTIVE = "Objective Only"
--addons/z_anticrash_v1.4.6/lua/z_anticrash/languages/fr.lua:
-- [[ CREATED BY ZOMBIE EXTINGUISHER ]]

local fr = {
	
	-- Stats
	lag = "DÉCALAGE",
	collisions = "COLLISIONS",
	props = "OBJETS",
	propsFrozen = "OBJETS GELÉS",
	npcs = "PNJS",
	vehicles = "VÉHICULES",
	players = "JOUEURS",
	uptime = "TEMPS",
	entities = "ENTITÉS",
	spawned = "APPARUS",
	fps = "IPS",
	tickrate = "TEMPS DE RAFRAÎCHISSEMENT",
	runAntiLagMeasures = "LANCER UNE OPÉRATION ANTI-DÉCALAGE",
	
	-- Users
	search = "Chercher",
	constraints = "CONTRAINTES",
	showEntities = "Montrer les Entités",
	hideEntities = "Cacher les Entités",
	resetMap = "Réinitialiser la carte",
	freezeEntities = "Geler les entités",
	removeEntities = "Supprimer les Entités",
	
	-- Global
	noCollideEntities = "Non-Collision des entités",
	
	-- Lag
	heavyLag = "Un important décalage a été détecté !",
	lagIsStuck = "Attention: le décalage est bloqué !",
	crashPrevented = "Prévention d'un arrêt brutal du serveur !",
	cleaningMap = "+ Réinitialisation de la carte...",
	removingEnts = "+ Suppression de %s entités",
	revertChanges = "+ Supression des %s entités créées il y a moins de %s minutes",
	freezeingEnts = "+ Gel de %s entités",
	noCollidingEnts = "+ Non-Collision de %s entités",
	offenderWarning = "%s a un nombre d'entités suspectes (%s) avant le décalage !",
	freezingAllEntities = "Geler toutes les entités (%s)",
	
	-- Dupes
	dupesNotEnabled = "Les copies ne sont pas activées sur ce serveur !",
	advDupesNotEnabled = "Les copies avancées ne sont pas activées sur ce serveur !",
	dupeExceedsSize = "Cette copie a dépassée la taille maximale autorisée ! (size:%s, max:%s)",
	dupeInformation = "%s apparition d'une copie contenant %s entités et %s contraintes physiques",

	-- Notifications
	triggeredAntiLagMeasures = "Déclenchement d'opérations anti-décalage !",
	ranAntilagMeasures = "Des opérations anti-décalage ont étés exécutées !",
	hasNoEntities = "n'a pas d'entités !",
	youRemovedFrom = "Vous avez supprimé %s entités depuis %s!",
	removedYourObjects = "supprimé vos objets apparus !",
	youFrozeFrom = "Vous avez gelé %s entités depuis %s!",
	frozeYourObjects = "gelé vos objets apparus!",
	enabledSpawnAbility = "Vous pouvez désormais faire apparaître des objets !",
	disabledSpawnAbility = "Vous ne pouvez désormais plus faire apparaître des objets!",
	youEnabledSpawnAbility = "Vous avez activé la possibilité de faire apparaître des objets à %s !",
	youEnabledSpawnAbility = "Vous avez désactivé la possibilité de faire apparaître des objets à %s !",
	
	resetTheMap = "Réinitialiser la carte !",
	noEntNameFound = "L'entité %s n'a pas été trouvée !",
	noEntitiesFound = "Aucune entité trouvée !",
	noUnfrozenEntsFound = "Aucune entité non-gelée trouvée !",
	noUnCollidedEntsFound = "Aucune entité sans collision trouvée !",
	freezeAllEnts = "%s a gelé toutes %s! (%s)",
	noCollideAllEnts = "%s a désactivé les collisions de toutes %s! (%s)",
	removedAllEntName = "%s a supprimé toutes %s! (%s)",
	entitiesLowCase = "entités",
	
	-- Console Log
	removedEntitiesFrom = "%s a supprimé %s entités depuis %s!",
	frozeEntitiesFrom = "%s a gelé %s entités depuis %s!",
	enabledSpawningCapabilities = "%s a ré-activé les capacités d'apparition pour %s!",
	disabledSpawningCapabilities = "%s a désactivé les capacités d'apparition pour %s!",
	removingHighCollision = "Supression des grosses collisions %s (%s) par %s!",
	
}

return fr
--addons/z_anticrash_v1.4.6/lua/z_anticrash/languages/pl.lua:
-- [[ CREATED BY ZOMBIE EXTINGUISHER ]]

local pl = {
	
	-- Stats
	lag = "LAG",
	collisions = "KOLIZJE",
	props = "PROPY",
	propsFrozen = "ZAMROŻONE PROPY",
	npcs = "NPC",
	vehicles = "POJAZDY",
	players = "GRACZE",
	uptime = "CZAS PRACY",
	entities = "BYTY",
	spawned = "PRZYWOŁANE",
	fps = "FPSY",
	tickrate = "TICKRATE",
	runAntiLagMeasures = "WŁĄCZ ŚRODKI ANTY-LAGOWE",
	
	-- Users
	search = "Wyszukaj",
	constraints = "OGARNICZENIA",
	showEntities = "Wyświetl Byty",
	hideEntities = "Ukryj Byty",
	resetMap = "Resetuj Mapę",
	freezeEntities = "Zamróź Byty",
	removeEntities = "Usuń Byty",
	
	-- Global
	noCollideEntities = "Byty Bez Kolizji",
	
	-- Lag
	heavyLag = "Wykryto dużego laga!",
	lagIsStuck = "Uwaga: serwer utknął na lagu!",
	crashPrevented = "Zapobiegnięto crashowi serwera!",
	cleaningMap = "+ Czyszczenie mapy...",
	removingEnts = "+ Usuwanie %s bytów",
	revertChanges = "+ Usuwanie %s bytów stworzonych przez ostatnie %s minut",
	freezeingEnts = "+ Zamrażanie %s bytów",
	noCollidingEnts = "+ Wyłączanie kolizji %s bytą",
	offenderWarning = "%s ma podejrzaną ilość propów (%s) stworzonych przed lagiem!",
	freezingAllEntities = "Zamrożono wszystkie byty (%s)",
	
	-- Dupes
	dupesNotEnabled = "Kopie nie są włączone na tym serwerze!",
	advDupesNotEnabled = "Zaawansowane kopie nie są włączone na tym serwerze!",
	dupeExceedsSize = "Kopia przekracza limit bytów! (ilość:%s, max:%s)",
	dupeInformation = "%s przywołuje kopie zawierająca %s bytów i %s ograniczeń",
	
	-- Notifications
	triggeredAntiLagMeasures = "uruchomiono środki anty-lagowe!",
	ranAntilagMeasures = "uruchomił środki anty-lagowe!",
	hasNoEntities = "nie ma bytów!",
	youRemovedFrom = "Usunąłeś %s bytów z %s!",
	removedYourObjects = "usunął twoje byty!",
	youFrozeFrom = "You froze %s entities from %s!",
	frozeYourObjects = "zamroził twoje byty!",
	enabledSpawnAbility = "przywrócił twoją możliwość przywoływania obiektów!",
	disabledSpawnAbility = "wyłączył twoją możliwość przywoływania obiektów!",
	youEnabledSpawnAbility = "Włączyłeś możliwość przywoływania obiektów gracza %s!",
	youDisabledSpawnAbility = "Wyłączyłeś możliwość przywoływania obiektów gracza %s!",
	
	resetTheMap = "zresetował mapę!",
	noEntNameFound = "Nie znaleziono %s!",
	noEntitiesFound = "Nie znaleziono bytów!",
	noUnfrozenEntsFound = "Nie znaleziono odmrożonych bytów!",
	noUnCollidedEntsFound = "Nie znaleziono bytów bez kolizji!",
	freezeAllEnts = "%s zamroził wszystkie %s! (%s)",
	noCollideAllEnts = "%s wyłączył kolizję wszystkich %s! (%s)",
	removedAllEntName = "%s usunął wszystkie %s! (%s)",
	entitiesLowCase = "byty/ów",
	removingOutOfBounds = "Usuwanie %s poza granicami",
	
	-- Console Log
	removedEntitiesFrom = "%s usunął byty gracza %s z %s!",
	frozeEntitiesFrom = "%s zamroził byty gracza %s z %s!",
	enabledSpawningCapabilities = "%s przywrócił możliwość przywoływania gracza %s!",
	disabledSpawningCapabilities = "%s wyłączył możliwość przywoływania dla %s!",
	removingHighCollision = "Usuwanie %s (%s) o dużej kolizji z %s!",
	
	-- Exploits
	chatClearKick = "%s został wyrzucony za używanie exploita ChatClear!",
	
}

return pl
--addons/tools_advdupe/lua/advdupe2/file_browser.lua:
--[[
	Title: Adv. Dupe 2 File Browser

	Desc: Displays and interfaces with duplication files.

	Author: TB

	Version: 1.0
]]

local History = {}
local Narrow = {}

local switch = true
local count = 0

local function AddHistory(txt)
	txt = string.lower(txt)
	local char1 = txt[1]
	local char2
	for i = 1, #History do
		char2 = History[i][1]
		if (char1 == char2) then
			if (History[i] == txt) then
				return
			end
		elseif (char1 < char2) then
			break
		end
	end

	table.insert(History, txt)
	table.sort(History, function(a, b) return a < b end)
end

local function NarrowHistory(txt, last)
	txt = string.lower(txt)
	local temp = {}
	if (last <= #txt and last ~= 0 and #txt ~= 1) then
		for i = 1, #Narrow do
			if (Narrow[i][last + 1] == txt[last + 1]) then
				table.insert(temp, Narrow[i])
			elseif (Narrow[i][last + 1] ~= '') then
				break
			end
		end
	else
		local char1 = txt[1]
		local char2
		for i = 1, #History do
			char2 = History[i][1]
			if (char1 == char2) then
				if (#txt > 1) then
					for k = 2, #txt do
						if (txt[k] ~= History[i][k]) then
							break
						end
						if (k == #txt) then
							table.insert(temp, History[i])
						end
					end
				else
					table.insert(temp, History[i])
				end
			elseif (char1 < char2) then
				break
			end
		end
	end

	Narrow = temp
end

local function tableSortNodes(tbl)
    for k, v in ipairs(tbl) do tbl[k] = {string.lower(v.Label:GetText()), v} end
    table.sort(tbl, function(a,b) return a[1]<b[1] end)
    for k, v in ipairs(tbl) do tbl[k] = v[2] end
end

local BROWSERPNL = {}
AccessorFunc(BROWSERPNL, "m_bBackground", "PaintBackground", FORCE_BOOL)
AccessorFunc(BROWSERPNL, "m_bgColor", "BackgroundColor")
Derma_Hook(BROWSERPNL, "Paint", "Paint", "Panel")
Derma_Hook(BROWSERPNL, "PerformLayout", "Layout", "Panel")

local setbrowserpnlsize
local function SetBrowserPnlSize(self, x, y)
	setbrowserpnlsize(self, x, y)
	self.pnlCanvas:SetWide(x)
	self.pnlCanvas.VBar:SetUp(y, self.pnlCanvas:GetTall())
end

function BROWSERPNL:Init()
	setbrowserpnlsize = self.SetSize
	self.SetSize = SetBrowserPnlSize
	self.pnlCanvas = vgui.Create("advdupe2_browser_tree", self)

	self:SetPaintBackground(true)
	self:SetPaintBackgroundEnabled(false)
	self:SetPaintBorderEnabled(false)
	self:SetBackgroundColor(self:GetSkin().text_bright)
end

function BROWSERPNL:OnVScroll(iOffset)
	self.pnlCanvas:SetPos(0, iOffset)
end

derma.DefineControl("advdupe2_browser_panel", "AD2 File Browser", BROWSERPNL, "Panel")

local BROWSER = {}
AccessorFunc(BROWSER, "m_pSelectedItem", "SelectedItem")
Derma_Hook(BROWSER, "Paint", "Paint", "Panel")

local origSetTall
local function SetTall(self, val)
	origSetTall(self, val)
	self.VBar:SetUp(self:GetParent():GetTall(), self:GetTall())
end

function BROWSER:Init()
	self:SetTall(0)
	origSetTall = self.SetTall
	self.SetTall = SetTall

	self.VBar = vgui.Create("DVScrollBar", self:GetParent())
	self.VBar:Dock(RIGHT)
	self.Nodes = 0
	self.ChildrenExpanded = {}
	self.ChildList = self
	self.m_bExpanded = true
	self.Folders = {}
	self.Files = {}
	self.LastClick = CurTime()
end

local function GetNodePath(node)
	local path = node.Label:GetText()
	local area = 0
	local name = ""
	node = node.ParentNode
	if (not node.ParentNode) then
		if (path == "Public") then
			area = 1
		elseif (path == "Advanced Duplicator 1") then
			area = 2
		end
		return "", area
	end

	while (true) do

		name = node.Label:GetText()
		if (name == "Advanced Duplicator 2") then
			break
		elseif (name == "Public") then
			area = 1
			break
		elseif (name == "Advanced Duplicator 1") then
			area = 2
			break
		end
		path = name .. "/" .. path
		node = node.ParentNode
	end

	return path, area
end

function BROWSER:DoNodeLeftClick(node)
	if (self.m_pSelectedItem == node and CurTime() - self.LastClick <= 0.25) then -- Check for double click
		if (node.Derma.ClassName == "advdupe2_browser_folder") then
			if (node.Expander) then
				node:SetExpanded() -- It's a folder, expand/collapse it
			end
		else
			AdvDupe2.UploadFile(GetNodePath(node))
		end
	else
		self:SetSelected(node) -- A node was clicked, select it
	end
	self.LastClick = CurTime()
end

local function AddNewFolder(node)
	local Controller = node.Control:GetParent():GetParent()
	local name = Controller.FileName:GetValue()
	local char = string.match(name, "[^%w_ ]")
	if char then
		AdvDupe2.Notify("Name contains invalid character ("..char..")!", NOTIFY_ERROR)
		Controller.FileName:SelectAllOnFocus(true)
		Controller.FileName:OnGetFocus()
		Controller.FileName:RequestFocus()
		return
	end
	if (name == "" or name == "Folder_Name...") then
		AdvDupe2.Notify("Name is blank!", NOTIFY_ERROR)
		Controller.FileName:SelectAllOnFocus(true)
		Controller.FileName:OnGetFocus()
		Controller.FileName:RequestFocus()
		return
	end
	local path, area = GetNodePath(node)
	if (area == 0) then
		path = AdvDupe2.DataFolder .. "/" .. path .. "/" .. name
	elseif (area == 1) then
		path = AdvDupe2.DataFolder .. "/=Public=/" .. path .. "/" .. name
	else
		path = "adv_duplicator/" .. path .. "/" .. name
	end

	if (file.IsDir(path, "DATA")) then
		AdvDupe2.Notify("Folder name already exists.", NOTIFY_ERROR)
		Controller.FileName:SelectAllOnFocus(true)
		Controller.FileName:OnGetFocus()
		Controller.FileName:RequestFocus()
		return
	end
	file.CreateDir(path)

	local Folder = node:AddFolder(name)
	node.Control:Sort(node)

	if (not node.m_bExpanded) then
		node:SetExpanded()
	end

	node.Control:SetSelected(Folder)
	if (Controller.Expanded) then
		AdvDupe2.FileBrowser:Slide(false)
	end
end

local function CollapseChildren(node)
	node.m_bExpanded = false
	if (node.Expander) then
		node.Expander:SetExpanded(false)
		node.ChildList:SetTall(0)
		for i = 1, #node.ChildrenExpanded do
			CollapseChildren(node.ChildrenExpanded[i])
		end
		node.ChildrenExpanded = {}
	end
end

local function CollapseParentsComplete(node)
	if (not node.ParentNode.ParentNode) then
		node:SetExpanded(false)
		return
	end
	CollapseParentsComplete(node.ParentNode)
end

function AdvDupe2.GetFilename(path, overwrite)
	if not overwrite and file.Exists(path .. ".txt", "DATA") then
		for i = 1, AdvDupe2.FileRenameTryLimit do
			local p = string.format("%s_%03d.txt", path, i)
			if not file.Exists(p, "DATA") then
				return p
			end
		end
		return false
	end
	return path .. ".txt"
end

local function GetFullPath(node)
	local path, area = GetNodePath(node)
	if (area == 0) then
		path = AdvDupe2.DataFolder .. "/" .. path .. "/"
	elseif (area == 1) then

	else
		path = "adv_duplicator/" .. path .. "/"
	end
	return path
end

local function GetNodeRoot(node)
	local Root
	while (true) do
		if (not node.ParentNode.ParentNode) then
			Root = node
			break
		end
		node = node.ParentNode
	end
	return Root
end

local function RenameFileCl(node, name)
	local path, area = GetNodePath(node)
	local File, FilePath, tempFilePath = "", "", ""
	if (area == 0) then
		tempFilePath = AdvDupe2.DataFolder .. "/" .. path
	elseif (area == 1) then
		tempFilePath = AdvDupe2.DataFolder .. "/=Public=/" .. path
	elseif (area == 2) then
		tempFilePath = "adv_duplicator/" .. path
	end

	File = file.Read(tempFilePath .. ".txt")
	FilePath = AdvDupe2.GetFilename(
		string.sub(tempFilePath, 1, #tempFilePath - #node.Label:GetText()) .. name)

	if (not FilePath) then
		AdvDupe2.Notify("Rename limit exceeded, could not rename.", NOTIFY_ERROR)
		return
	end

	FilePath = AdvDupe2.SanitizeFilename(FilePath)
	file.Write(FilePath, File)
	if (file.Exists(FilePath, "DATA")) then
		file.Delete(tempFilePath .. ".txt")
		local NewName = string.Explode("/", FilePath)
		NewName = string.sub(NewName[#NewName], 1, -5)
		node.Label:SetText(NewName)
		node.Label:SizeToContents()
		AdvDupe2.Notify("File renamed to " .. NewName)
	else
		AdvDupe2.Notify("File was not renamed.", NOTIFY_ERROR)
	end

	node.Control:Sort(node.ParentNode)
end

local function MoveFileClient(node)
	if (not node) then
		AdvDupe2.Notify("Select a folder to move the file to.", NOTIFY_ERROR)
		return
	end
	if (node.Derma.ClassName == "advdupe2_browser_file") then
		AdvDupe2.Notify("You muse select a folder as a destination.", NOTIFY_ERROR)
		return
	end
	local base = AdvDupe2.DataFolder
	local ParentNode

	local node2 = node.Control.ActionNode
	local path, area = GetNodePath(node2)
	local path2, area2 = GetNodePath(node)

	if (area ~= area2 or path == path2) then
		AdvDupe2.Notify("Cannot move files between these directories.", NOTIFY_ERROR)
		return
	end
	if (area == 2) then base = "adv_duplicator" end

	local savepath = AdvDupe2.GetFilename(
						 base .. "/" .. path2 .. "/" .. node2.Label:GetText())
	local OldFile = base .. "/" .. path .. ".txt"

	local ReFile = file.Read(OldFile)
	file.Write(savepath, ReFile)
	file.Delete(OldFile)
	local name2 = string.Explode("/", savepath)
	name2 = string.sub(name2[#name2], 1, -5)
	node2.Control:RemoveNode(node2)
	node2 = node:AddFile(name2)
	node2.Control:Sort(node)
	AdvDupe2.FileBrowser:Slide(false)
	AdvDupe2.FileBrowser.Info:SetVisible(false)
end

local function DeleteFilesInFolders(path)
	local files, folders = file.Find(path .. "*", "DATA")

	for k, v in pairs(files) do file.Delete(path .. v) end

	for k, v in pairs(folders) do DeleteFilesInFolders(path .. v .. "/") end

	file.Delete(path)
end

local function SearchNodes(node, name)
	local tab = {}
	for k, v in pairs(node.Files) do
		if (string.find(string.lower(v.Label:GetText()), name)) then
			table.insert(tab, v)
		end
	end

	for k, v in pairs(node.Folders) do
		for i, j in pairs(SearchNodes(v, name)) do
			table.insert(tab, j)
		end
	end

	return tab
end

local function Search(node, name)
	local pnFileBr = AdvDupe2.FileBrowser
	pnFileBr.Search = vgui.Create("advdupe2_browser_panel", pnFileBr)
	pnFileBr.Search:SetPos(pnFileBr.Browser:GetPos())
	pnFileBr.Search:SetSize(pnFileBr.Browser:GetSize())
	pnFileBr.Search.pnlCanvas.Search = true
	pnFileBr.Browser:SetVisible(false)
	local Files = SearchNodes(node, name)
	tableSortNodes(Files)
	for k, v in pairs(Files) do
		pnFileBr.Search.pnlCanvas:AddFile(v.Label:GetText()).Ref = v
	end
end

function BROWSER:DoNodeRightClick(node)
	self:SetSelected(node)

	local parent = self:GetParent():GetParent()
	parent.FileName:KillFocus()
	parent.Desc:KillFocus()
	local Menu = DermaMenu()
	local root = GetNodeRoot(node).Label:GetText()
	if (node.Derma.ClassName == "advdupe2_browser_file") then
		if (node.Control.Search) then
			Menu:AddOption("Open", function()
				AdvDupe2.UploadFile(GetNodePath(node.Ref))
			end)
			Menu:AddOption("Preview", function()
				local ReadPath, ReadArea = GetNodePath(node.Ref)
				if (ReadArea == 0) then
					ReadPath = AdvDupe2.DataFolder .. "/" .. ReadPath .. ".txt"
				elseif (ReadArea == 1) then
					ReadPath = AdvDupe2.DataFolder .. "/-Public-/" .. ReadPath .. ".txt"
				else
					ReadPath = "adv_duplicator/" .. ReadPath .. ".txt"
				end
				if (not file.Exists(ReadPath, "DATA")) then
					AdvDupe2.Notify("File does not exist", NOTIFY_ERROR)
					return
				end

				local read = file.Read(ReadPath)
				local name = string.Explode("/", ReadPath)
				name = name[#name]
				name = string.sub(name, 1, #name - 4)
				local success, dupe, info, moreinfo = AdvDupe2.Decode(read)
				if (success) then
					AdvDupe2.LoadGhosts(dupe, info, moreinfo, name, true)
				end
			end)
		else
			Menu:AddOption("Open", function()
				AdvDupe2.UploadFile(GetNodePath(node))
			end)
			Menu:AddOption("Preview", function()
				local ReadPath, ReadArea = GetNodePath(node)
				if (ReadArea == 0) then
					ReadPath = AdvDupe2.DataFolder .. "/" .. ReadPath .. ".txt"
				elseif (ReadArea == 1) then
					ReadPath = AdvDupe2.DataFolder .. "/-Public-/" .. ReadPath .. ".txt"
				else
					ReadPath = "adv_duplicator/" .. ReadPath .. ".txt"
				end
				if (not file.Exists(ReadPath, "DATA")) then
					AdvDupe2.Notify("File does not exist", NOTIFY_ERROR)
					return
				end

				local read = file.Read(ReadPath)
				local name = string.Explode("/", ReadPath)
				name = name[#name]
				name = string.sub(name, 1, #name - 4)
				local success, dupe, info, moreinfo = AdvDupe2.Decode(read)
				if (success) then
					AdvDupe2.LoadGhosts(dupe, info, moreinfo, name, true)
				end
			end)
			Menu:AddSpacer()
			Menu:AddOption("Rename", function()
				if (parent.Expanding) then return end
				parent.Submit:SetMaterial("icon16/page_edit.png")
				parent.Submit:SetTooltip("Rename File")
				parent.Desc:SetVisible(false)
				parent.Info:SetVisible(false)
				parent.FileName.FirstChar = true
				parent.FileName.PrevText = parent.FileName:GetValue()
				parent.FileName:SetVisible(true)
				parent.FileName:SetText(node.Label:GetText())
				parent.FileName:SelectAllOnFocus(true)
				parent.FileName:OnMousePressed()
				parent.FileName:RequestFocus()
				parent.Expanding = true
				AdvDupe2.FileBrowser:Slide(true)
				parent.Submit.DoClick = function()
					local name = parent.FileName:GetValue()
					if (name == "") then
						AdvDupe2.Notify("Name field is blank.", NOTIFY_ERROR)
						parent.FileName:SelectAllOnFocus(true)
						parent.FileName:OnGetFocus()
						parent.FileName:RequestFocus()
						return
					end
					AddHistory(name)
					RenameFileCl(node, name)
					AdvDupe2.FileBrowser:Slide(false)
				end
				parent.FileName.OnEnter = parent.Submit.DoClick
			end)
			Menu:AddOption("Move File", function()
				parent.Submit:SetMaterial("icon16/page_paste.png")
				parent.Submit:SetTooltip("Move File")
				parent.FileName:SetVisible(false)
				parent.Desc:SetVisible(false)
				parent.Info:SetText(
					"Select the folder you want to move \nthe File to.")
				parent.Info:SizeToContents()
				parent.Info:SetVisible(true)
				AdvDupe2.FileBrowser:Slide(true)
				node.Control.ActionNode = node
				parent.Submit.DoClick = function()
					MoveFileClient(node.Control.m_pSelectedItem)
				end
			end)
			Menu:AddOption("Delete", function()
				parent.Submit:SetMaterial("icon16/bin_empty.png")
				parent.Submit:SetTooltip("Delete File")
				parent.FileName:SetVisible(false)
				parent.Desc:SetVisible(false)
				if (#node.Label:GetText() > 22) then
					parent.Info:SetText(
						'Are you sure that you want to delete \nthe FILE, "' ..
							node.Label:GetText() .. '" \nfrom your CLIENT?')
				else
					parent.Info:SetText(
						'Are you sure that you want to delete \nthe FILE, "' ..
							node.Label:GetText() .. '" from your CLIENT?')
				end
				parent.Info:SizeToContents()
				parent.Info:SetVisible(true)
				AdvDupe2.FileBrowser:Slide(true)
				parent.Submit.DoClick = function()
					local path, area = GetNodePath(node)
					if (area == 1) then
						path = "-Public-/" .. path
					end
					if (area == 2) then
						path = "adv_duplicator/" .. path .. ".txt"
					else
						path = AdvDupe2.DataFolder .. "/" .. path .. ".txt"
					end
					node.Control:RemoveNode(node)
					file.Delete(path)
					AdvDupe2.FileBrowser:Slide(false)
				end
			end)
		end
	else
		if (root ~= "-Advanced Duplicator 1-") then
			Menu:AddOption("Save", function()
				if (parent.Expanding) then return end
				parent.Submit:SetMaterial("icon16/page_save.png")
				parent.Submit:SetTooltip("Save Duplication")
				if (parent.FileName:GetValue() == "Folder_Name...") then
					parent.FileName:SetText("File_Name...")
				end
				parent.Desc:SetVisible(true)
				parent.Info:SetVisible(false)
				parent.FileName.FirstChar = true
				parent.FileName.PrevText = parent.FileName:GetValue()
				parent.FileName:SetVisible(true)
				parent.FileName:SelectAllOnFocus(true)
				parent.FileName:OnMousePressed()
				parent.FileName:RequestFocus()
				node.Control.ActionNode = node
				parent.Expanding = true
				AdvDupe2.FileBrowser:Slide(true)
				parent.Submit.DoClick = function()
					local name = parent.FileName:GetValue()
					if (name == "" or name == "File_Name...") then
						AdvDupe2.Notify("Name field is blank.", NOTIFY_ERROR)
						parent.FileName:SelectAllOnFocus(true)
						parent.FileName:OnGetFocus()
						parent.FileName:RequestFocus()
						return
					end
					local desc = parent.Desc:GetValue()
					if (desc == "Description...") then
						desc = ""
					end
					AdvDupe2.SavePath = GetFullPath(node) .. name
					AddHistory(name)
					if (game.SinglePlayer()) then
						RunConsoleCommand("AdvDupe2_SaveFile", name, desc, GetNodePath(node))
					else
						RunConsoleCommand("AdvDupe2_SaveFile", name)
					end
					AdvDupe2.FileBrowser:Slide(false)
				end
				parent.FileName.OnEnter =
					function()
						parent.FileName:KillFocus()
						parent.Desc:SelectAllOnFocus(true)
						parent.Desc.OnMousePressed()
						parent.Desc:RequestFocus()
					end
				parent.Desc.OnEnter = parent.Submit.DoClick
			end)
		end
		Menu:AddOption("New Folder", function()
			if (parent.Expanding) then return end
			parent.Submit:SetMaterial("icon16/folder_add.png")
			parent.Submit:SetTooltip("Add new folder")
			if (parent.FileName:GetValue() == "File_Name...") then
				parent.FileName:SetText("Folder_Name...")
			end
			parent.Desc:SetVisible(false)
			parent.Info:SetVisible(false)
			parent.FileName.FirstChar = true
			parent.FileName.PrevText = parent.FileName:GetValue()
			parent.FileName:SetVisible(true)
			parent.FileName:SelectAllOnFocus(true)
			parent.FileName:OnMousePressed()
			parent.FileName:RequestFocus()
			parent.Expanding = true
			AdvDupe2.FileBrowser:Slide(true)
			parent.Submit.DoClick = function() AddNewFolder(node) end
			parent.FileName.OnEnter = parent.Submit.DoClick
		end)
		Menu:AddOption("Search", function()
			parent.Submit:SetMaterial("icon16/find.png")
			parent.Submit:SetTooltip("Search Files")
			if (parent.FileName:GetValue() == "Folder_Name...") then
				parent.FileName:SetText("File_Name...")
			end
			parent.Desc:SetVisible(false)
			parent.Info:SetVisible(false)
			parent.FileName.FirstChar = true
			parent.FileName.PrevText = parent.FileName:GetValue()
			parent.FileName:SetVisible(true)
			parent.FileName:SelectAllOnFocus(true)
			parent.FileName:OnMousePressed()
			parent.FileName:RequestFocus()
			parent.Expanding = true
			AdvDupe2.FileBrowser:Slide(true)
			parent.Submit.DoClick = function()
				Search(node, string.lower(parent.FileName:GetValue()))
				AddHistory(parent.FileName:GetValue())
				parent.FileName:SetVisible(false)
				parent.Submit:SetMaterial("icon16/arrow_undo.png")
				parent.Submit:SetTooltip("Return to Browser")
				parent.Info:SetVisible(true)
				parent.Info:SetText(#parent.Search.pnlCanvas.Files ..
										' files found searching for, "' ..
										parent.FileName:GetValue() .. '"')
				parent.Info:SizeToContents()
				parent.Submit.DoClick = function()
					parent.Search:Remove()
					parent.Search = nil
					parent.Browser:SetVisible(true)
					AdvDupe2.FileBrowser:Slide(false)
					parent.Cancel:SetVisible(true)
				end
				parent.Cancel:SetVisible(false)
			end
			parent.FileName.OnEnter = parent.Submit.DoClick
		end)
		if (node.Label:GetText()[1] ~= "-") then
			Menu:AddOption("Delete", function()
				parent.Submit:SetMaterial("icon16/bin_empty.png")
				parent.Submit:SetTooltip("Delete Folder")
				parent.FileName:SetVisible(false)
				parent.Desc:SetVisible(false)
				if (#node.Label:GetText() > 22) then
					parent.Info:SetText(
						'Are you sure that you want to delete \nthe FOLDER, "' ..
							node.Label:GetText() .. '" \nfrom your CLIENT?')
				else
					parent.Info:SetText(
						'Are you sure that you want to delete \nthe FOLDER, "' ..
							node.Label:GetText() .. '" from your CLIENT?')
				end
				parent.Info:SizeToContents()
				parent.Info:SetVisible(true)
				AdvDupe2.FileBrowser:Slide(true)
				parent.Submit.DoClick = function()
					local path, area = GetNodePath(node)
					if (area == 1) then
						path = "-Public-/" .. path
					end
					if (area == 2) then
						path = "adv_duplicator/" .. path .. "/"
					else
						path = AdvDupe2.DataFolder .. "/" .. path .. "/"
					end
					node.Control:RemoveNode(node)
					DeleteFilesInFolders(path)
					AdvDupe2.FileBrowser:Slide(false)
				end
			end)
		end
	end
	if (not node.Control.Search) then
		Menu:AddSpacer()
		Menu:AddOption("Collapse Folder", function()
			if (node.ParentNode.ParentNode) then
				node.ParentNode:SetExpanded(false)
			end
		end)
		Menu:AddOption("Collapse Root", function() CollapseParentsComplete(node) end)
		if (parent.Expanded) then
			Menu:AddOption("Cancel Action", function() parent.Cancel:DoClick() end)
		end
	end

	Menu:Open()
end

local function CollapseParents(node, val)
	if (not node) then return end
	node.ChildList:SetTall(node.ChildList:GetTall() - val)
	CollapseParents(node.ParentNode, val)
end

function BROWSER:RemoveNode(node)
	local parent = node.ParentNode
	parent.Nodes = parent.Nodes - 1
	if (node.IsFolder) then
		if (node.m_bExpanded) then
			CollapseParents(parent, node.ChildList:GetTall() + 20)
			for i = 1, #parent.ChildrenExpanded do
				if (node == parent.ChildrenExpanded[i]) then
					table.remove(parent.ChildrenExpanded, i)
					break
				end
			end
		elseif (parent.m_bExpanded) then
			CollapseParents(parent, 20)
		end
		for i = 1, #parent.Folders do
			if (node == parent.Folders[i]) then
				table.remove(parent.Folders, i)
			end
		end
		node.ChildList:Remove()
		node:Remove()
	else
		for i = 1, #parent.Files do
			if (node == parent.Files[i]) then
				table.remove(parent.Files, i)
			end
		end
		CollapseParents(parent, 20)
		node:Remove()
		if (#parent.Files == 0 and #parent.Folders == 0) then
			parent.Expander:Remove()
			parent.Expander = nil
			parent.m_bExpanded = false
		end
	end
	if (self.VBar.Scroll > self.VBar.CanvasSize) then
		self.VBar:SetScroll(self.VBar.Scroll)
	end
	if (self.m_pSelectedItem) then
		self.m_pSelectedItem = nil
	end
end

function BROWSER:OnMouseWheeled(dlta)
	return self.VBar:OnMouseWheeled(dlta)
end

function BROWSER:AddFolder(text)
	local node = vgui.Create("advdupe2_browser_folder", self)
	node.Control = self

	node.Offset = 0
	node.ChildrenExpanded = {}
	node.Icon:SetPos(18, 1)
	node.Label:SetPos(44, 0)
	node.Label:SetText(text)
	node.Label:SizeToContents()
	node.ParentNode = self
	node.IsFolder = true
	self.Nodes = self.Nodes + 1
	node.Folders = {}
	node.Files = {}
	table.insert(self.Folders, node)
	self:SetTall(self:GetTall() + 20)

	return node
end

function BROWSER:AddFile(text)
	local node = vgui.Create("advdupe2_browser_file", self)
	node.Control = self
	node.Offset = 0
	node.Icon:SetPos(18, 1)
	node.Label:SetPos(44, 0)
	node.Label:SetText(text)
	node.Label:SizeToContents()
	node.ParentNode = self
	self.Nodes = self.Nodes + 1
	table.insert(self.Files, node)
	self:SetTall(self:GetTall() + 20)

	return node
end

function BROWSER:Sort(node)
	tableSortNodes(node.Folders)
	tableSortNodes(node.Files)

	for i = 1, #node.Folders do
		node.Folders[i]:SetParent(nil)
		node.Folders[i]:SetParent(node.ChildList)
		node.Folders[i].ChildList:SetParent(nil)
		node.Folders[i].ChildList:SetParent(node.ChildList)
	end
	for i = 1, #node.Files do
		node.Files[i]:SetParent(nil)
		node.Files[i]:SetParent(node.ChildList)
	end
end

function BROWSER:SetSelected(node)
	if (IsValid(self.m_pSelectedItem)) then
		self.m_pSelectedItem:SetSelected(false)
	end
	self.m_pSelectedItem = node
	if (node) then node:SetSelected(true) end
end

local function ExpandParents(node, val)
	if (not node) then return end
	node.ChildList:SetTall(node.ChildList:GetTall() + val)
	ExpandParents(node.ParentNode, val)
end

function BROWSER:Expand(node)
	node.ChildList:SetTall(node.Nodes * 20)
	table.insert(node.ParentNode.ChildrenExpanded, node)
	ExpandParents(node.ParentNode, node.Nodes * 20)
end

local function ExtendParents(node)
	if (not node) then return end
	node.ChildList:SetTall(node.ChildList:GetTall() + 20)
	ExtendParents(node.ParentNode)
end

function BROWSER:Extend(node)
	node.ChildList:SetTall(node.ChildList:GetTall() + 20)
	ExtendParents(node.ParentNode)
end

function BROWSER:Collapse(node)
	CollapseParents(node.ParentNode, node.ChildList:GetTall())

	for i = 1, #node.ParentNode.ChildrenExpanded do
		if (node.ParentNode.ChildrenExpanded[i] == node) then
			table.remove(node.ParentNode.ChildrenExpanded, i)
			break
		end
	end
	CollapseChildren(node)
end

function BROWSER:RenameNode(name)
	self.ActionNode.Label:SetText(name)
	self.ActionNode.Label:SizeToContents()
	self:Sort(self.ActionNode.ParentNode)
end

function BROWSER:MoveNode(name)
	self:RemoveNode(self.ActionNode)
	self.ActionNode2:AddFile(name)
	self:Sort(self.ActionNode2)
end

function BROWSER:DeleteNode()
	self:RemoveNode(self.ActionNode)
end

derma.DefineControl("advdupe2_browser_tree", "AD2 File Browser", BROWSER, "Panel")

local FOLDER = {}

AccessorFunc(FOLDER, "m_bBackground", "PaintBackground", FORCE_BOOL)
AccessorFunc(FOLDER, "m_bgColor", "BackgroundColor")

Derma_Hook(FOLDER, "Paint", "Paint", "Panel")

function FOLDER:Init()
	self:SetMouseInputEnabled(true)

	self:SetTall(20)
	self:SetPaintBackground(true)
	self:SetPaintBackgroundEnabled(false)
	self:SetPaintBorderEnabled(false)
	self:SetBackgroundColor(Color(0, 0, 0, 0))

	self.Icon = vgui.Create("DImage", self)
	self.Icon:SetImage("icon16/folder.png")

	self.Icon:SizeToContents()

	self.Label = vgui.Create("DLabel", self)
	self.Label:SetDark(true)

	self.m_bExpanded = false
	self.Nodes = 0
	self.ChildrenExpanded = {}

	self:Dock(TOP)

	self.ChildList = vgui.Create("Panel", self:GetParent())
	self.ChildList:Dock(TOP)
	self.ChildList:SetTall(0)
end

local function ExpandNode(self)
	self:GetParent():SetExpanded()
end

function FOLDER:AddFolder(text)
	if (self.Nodes == 0) then
		self.Expander = vgui.Create("DExpandButton", self)
		self.Expander.DoClick = ExpandNode
		self.Expander:SetPos(self.Offset, 2)
	end

	local node = vgui.Create("advdupe2_browser_folder", self.ChildList)
	node.Control = self.Control

	node.Offset = self.Offset + 20

	node.Icon:SetPos(18 + node.Offset, 1)
	node.Label:SetPos(44 + node.Offset, 0)
	node.Label:SetText(text)
	node.Label:SizeToContents()
	node.Label:SetDark(true)
	node.ParentNode = self
	node.IsFolder = true
	node.Folders = {}
	node.Files = {}

	self.Nodes = self.Nodes + 1
	self.Folders[#self.Folders + 1] = node

	if (self.m_bExpanded) then
		self.Control:Extend(self)
	end

	return node
end

function FOLDER:Clear()
	for _, node in ipairs(self.Folders) do
		node:Remove() end
	for _, node in ipairs(self.Files) do
		node:Remove() end
	self.Nodes = 0
end

function FOLDER:AddFile(text)
	if (self.Nodes == 0) then
		self.Expander = vgui.Create("DExpandButton", self)
		self.Expander.DoClick = ExpandNode
		self.Expander:SetPos(self.Offset, 2)
	end

	local node = vgui.Create("advdupe2_browser_file", self.ChildList)
	node.Control = self.Control
	node.Offset = self.Offset + 20
	node.Icon:SetPos(18 + node.Offset, 1)
	node.Label:SetPos(44 + node.Offset, 0)
	node.Label:SetText(text)
	node.Label:SizeToContents()
	node.Label:SetDark(true)
	node.ParentNode = self

	self.Nodes = self.Nodes + 1
	table.insert(self.Files, node)

	if (self.m_bExpanded) then
		self.Control:Extend(self)
	end

	return node
end


function FOLDER:LoadDataFolder(folderPath)
	self:Clear()
	self.LoadingPath = folderPath
	self.LoadingFiles, self.LoadingDirectories = file.Find(folderPath .. "*", "DATA", "nameasc")
	if self.LoadingFiles == nil then self.LoadingFiles = {} end
	if self.LoadingDirectories == nil then self.LoadingDirectories = {} end
	self.FileI, self.DirI = 1, 1
	self.LoadingFirst = true
end

function FOLDER:Think()
	if self.LoadingPath then
		local path, files, dirs, fileI, dirI = self.LoadingPath, self.LoadingFiles, self.LoadingDirectories, self.FileI, self.DirI
		if dirI > #dirs then
			if fileI > #files then
				self.LoadingPath = nil
				return
			else
				local fileName = files[fileI]
				local fileNode = self:AddFile(string.StripExtension(fileName))
				fileI = fileI + 1
			end
		else
			local dirName = dirs[dirI]
			local dirNode = self:AddFolder(dirName)
			dirNode:LoadDataFolder(path .. dirName .. "/")
			dirI = dirI + 1
		end

		self.FileI = fileI
		self.DirI = dirI

		if self.LoadingFirst then
			if self.LoadingPath == "advdupe2/" then self:SetExpanded(true) end
			self.LoadingFirst = false
		end
	end
end


function FOLDER:SetExpanded(bool)
	if (not self.Expander) then return end
	if (bool == nil) then
		self.m_bExpanded = not self.m_bExpanded
	else
		self.m_bExpanded = bool
	end
	self.Expander:SetExpanded(self.m_bExpanded)
	if (self.m_bExpanded) then
		self.Control:Expand(self)
	else
		self.Control:Collapse(self)
	end
end

function FOLDER:SetSelected(bool)
	if (bool) then
		self:SetBackgroundColor(self:GetSkin().bg_color_bright)
	else
		self:SetBackgroundColor(Color(0, 0, 0, 0))
	end
end

function FOLDER:OnMousePressed(code)
	if (code == 107) then
		self.Control:DoNodeLeftClick(self)
	elseif (code == 108) then
		self.Control:DoNodeRightClick(self)
	end
end

derma.DefineControl("advdupe2_browser_folder", "AD2 Browser Folder node", FOLDER, "Panel")

local FILE = {}

AccessorFunc(FILE, "m_bBackground", "PaintBackground", FORCE_BOOL)
AccessorFunc(FILE, "m_bgColor", "BackgroundColor")
Derma_Hook(FILE, "Paint", "Paint", "Panel")

function FILE:Init()
	self:SetMouseInputEnabled(true)

	self:SetTall(20)
	self:SetPaintBackground(true)
	self:SetPaintBackgroundEnabled(false)
	self:SetPaintBorderEnabled(false)
	self:SetBackgroundColor(Color(0, 0, 0, 0))

	self.Icon = vgui.Create("DImage", self)
	self.Icon:SetImage("icon16/page.png")

	self.Icon:SizeToContents()

	self.Label = vgui.Create("DLabel", self)
	self.Label:SetDark(true)

	self:Dock(TOP)
end

function FILE:SetSelected(bool)
	if (bool) then
		self:SetBackgroundColor(self:GetSkin().bg_color_bright)
	else
		self:SetBackgroundColor(Color(0, 0, 0, 0))
	end
end

function FILE:OnMousePressed(code)
	if (code == 107) then
		self.Control:DoNodeLeftClick(self)
	elseif (code == 108) then
		self.Control:DoNodeRightClick(self)
	end
end

derma.DefineControl("advdupe2_browser_file", "AD2 Browser File node", FILE, "Panel")

local PANEL = {}
AccessorFunc(PANEL, "m_bBackground", "PaintBackground", FORCE_BOOL)
AccessorFunc(PANEL, "m_bgColor", "BackgroundColor")
Derma_Hook(PANEL, "Paint", "Paint", "Panel")
Derma_Hook(PANEL, "PerformLayout", "Layout", "Panel")

function PANEL:PerformLayout()
	if (self:GetWide() == self.LastX) then return end
	local x = self:GetWide()

	if (self.Search) then
		self.Search:SetWide(x)
	end

	self.Browser:SetWide(x)
	local x2, y2 = self.Browser:GetPos()
	local BtnX = x - self.Help:GetWide() - 5
	self.Help:SetPos(BtnX, 3)
	BtnX = BtnX - self.Refresh:GetWide() - 5
	self.Refresh:SetPos(BtnX, 3)

	BtnX = x - self.Submit:GetWide() - 15
	self.Cancel:SetPos(BtnX, self.Browser:GetTall() + 20)
	BtnX = BtnX - self.Submit:GetWide() - 5
	self.Submit:SetPos(BtnX, self.Browser:GetTall() + 20)

	self.FileName:SetWide(BtnX - 10)
	self.FileName:SetPos(5, self.Browser:GetTall() + 20)
	self.Desc:SetWide(x - 10)
	self.Desc:SetPos(5, self.Browser:GetTall() + 39)
	self.Info:SetPos(5, self.Browser:GetTall() + 20)

	self.LastX = x
end

local pnlorigsetsize
local function PanelSetSize(self, x, y)
	if (not self.LaidOut) then
		pnlorigsetsize(self, x, y)

		self.Browser:SetSize(x, y - 20)
		self.Browser:SetPos(0, 20)

		if (self.Search) then
			self.Search:SetSize(x, y - 20)
			self.Search:SetPos(0, 20)
		end

		self.LaidOut = true
	else
		pnlorigsetsize(self, x, y)
	end

end

local function UpdateClientFiles()

	local pnlCanvas = AdvDupe2.FileBrowser.Browser.pnlCanvas

	for i = 1, 2 do
		if (pnlCanvas.Folders[1]) then
			pnlCanvas:RemoveNode(pnlCanvas.Folders[1])
		end
	end

	local advdupe2 = pnlCanvas:AddFolder("Advanced Duplicator 2")
	local advdupe1 = pnlCanvas:AddFolder("Advanced Duplicator 1")

	advdupe1:LoadDataFolder("adv_duplicator/")
	advdupe2:LoadDataFolder("advdupe2/")

	if (pnlCanvas.Folders[2]) then
		if (#pnlCanvas.Folders[2].Folders == 0 and #pnlCanvas.Folders[2].Files == 0) then
			pnlCanvas:RemoveNode(pnlCanvas.Folders[2])
		end

		pnlCanvas.Folders[1]:SetParent(nil)
		pnlCanvas.Folders[1]:SetParent(pnlCanvas.ChildList)
		pnlCanvas.Folders[1].ChildList:SetParent(nil)
		pnlCanvas.Folders[1].ChildList:SetParent(pnlCanvas.ChildList)
	end

end

function PANEL:Init()

	AdvDupe2.FileBrowser = self
	self.Expanded = false
	self.Expanding = false
	self.LastX = 0
	self.LastY = 0
	pnlorigsetsize = self.SetSize
	self.SetSize = PanelSetSize

	self:SetPaintBackground(true)
	self:SetPaintBackgroundEnabled(false)
	self:SetBackgroundColor(self:GetSkin().bg_color_bright)

	self.Browser = vgui.Create("advdupe2_browser_panel", self)
	UpdateClientFiles()
	self.Refresh = vgui.Create("DImageButton", self)
	self.Refresh:SetMaterial("icon16/arrow_refresh.png")
	self.Refresh:SizeToContents()
	self.Refresh:SetTooltip("Refresh Files")
	self.Refresh.DoClick = function(button) UpdateClientFiles() end

	self.Help = vgui.Create("DImageButton", self)
	self.Help:SetMaterial("icon16/help.png")
	self.Help:SizeToContents()
	self.Help:SetTooltip("Help Section")
	self.Help.DoClick = function(btn)
		local Menu = DermaMenu()
		Menu:AddOption("Bug Reporting", function()
			gui.OpenURL("https://github.com/wiremod/advdupe2/issues")
		end)
		Menu:AddOption("Controls", function()
			gui.OpenURL("https://github.com/wiremod/advdupe2/wiki/Controls")
		end)
		Menu:AddOption("Commands", function()
			gui.OpenURL(
				"https://github.com/wiremod/advdupe2/wiki/Server-settings")
		end)
		Menu:Open()
	end

	self.Submit = vgui.Create("DImageButton", self)
	self.Submit:SetMaterial("icon16/page_save.png")
	self.Submit:SizeToContents()
	self.Submit:SetTooltip("Confirm Action")
	self.Submit.DoClick = function()
		self.Expanding = true
		AdvDupe2.FileBrowser:Slide(false)
	end

	self.Cancel = vgui.Create("DImageButton", self)
	self.Cancel:SetMaterial("icon16/cross.png")
	self.Cancel:SizeToContents()
	self.Cancel:SetTooltip("Cancel Action")
	self.Cancel.DoClick = function()
		self.Expanding = true
		AdvDupe2.FileBrowser:Slide(false)
	end

	self.FileName = vgui.Create("DTextEntry", self)
	self.FileName:SetAllowNonAsciiCharacters(true)
	self.FileName:SetText("File_Name...")
	self.FileName.Last = 0

	self.FileName.OnEnter = function()
		self.FileName:KillFocus()
		self.Desc:SelectAllOnFocus(true)
		self.Desc.OnMousePressed()
		self.Desc:RequestFocus()
	end
	self.FileName.OnMousePressed = function()
		self.FileName:OnGetFocus()
		if (self.FileName:GetValue() == "File_Name..." or
			self.FileName:GetValue() == "Folder_Name...") then
			self.FileName:SelectAllOnFocus(true)
		end
	end
	self.FileName:SetUpdateOnType(true)
	self.FileName.OnTextChanged = function()

		if (self.FileName.FirstChar) then
			if (string.lower(self.FileName:GetValue()[1] or "") == string.lower(input.LookupBinding("menu") or "q")) then
				self.FileName:SetText(self.FileName.PrevText)
				self.FileName:SelectAll()
				self.FileName.FirstChar = false
			else
				self.FileName.FirstChar = false
			end
		end

		local new, changed = self.FileName:GetValue():gsub("[^%w_ ]", "")
		if changed > 0 then
			self.FileName:SetText(new)
			self.FileName:SetCaretPos(#new)
		end
		if (#self.FileName:GetValue() > 0) then
			NarrowHistory(self.FileName:GetValue(), self.FileName.Last)
			local options = {}
			if (#Narrow > 4) then
				for i = 1, 4 do table.insert(options, Narrow[i]) end
			else
				options = Narrow
			end
			if (#options ~= 0 and #self.FileName:GetValue() ~= 0) then
				self.FileName.HistoryPos = 0
				self.FileName:OpenAutoComplete(options)
				self.FileName.Menu.Attempts = 1
				if (#Narrow > 4) then
					self.FileName.Menu:AddOption("...", function() end)
				end
			elseif (IsValid(self.FileName.Menu)) then
				self.FileName.Menu:Remove()
			end
		end
		self.FileName.Last = #self.FileName:GetValue()
	end
	self.FileName.OnKeyCodeTyped = function(txtbox, code)
		txtbox:OnKeyCode(code)

		if (code == KEY_ENTER and not txtbox:IsMultiline() and txtbox:GetEnterAllowed()) then
			if (txtbox.HistoryPos == 5 and txtbox.Menu:ChildCount() == 5) then
				if ((txtbox.Menu.Attempts + 1) * 4 < #Narrow) then
					for i = 1, 4 do
						txtbox.Menu:GetChild(i):SetText(Narrow[i + txtbox.Menu.Attempts * 4])
					end
				else
					txtbox.Menu:GetChild(5):Remove()
					for i = 4, (txtbox.Menu.Attempts * 4 - #Narrow) * -1 + 1, -1 do
						txtbox.Menu:GetChild(i):Remove()
					end

					for i = 1, #Narrow - txtbox.Menu.Attempts * 4 do
						txtbox.Menu:GetChild(i):SetText(Narrow[i + txtbox.Menu.Attempts * 4])
					end
				end
				txtbox.Menu:ClearHighlights()
				txtbox.Menu:HighlightItem(txtbox.Menu:GetChild(1))
				txtbox.HistoryPos = 1
				txtbox.Menu.Attempts = txtbox.Menu.Attempts + 1
				return true
			end

			if (IsValid(txtbox.Menu)) then
				txtbox.Menu:Remove()
			end
			txtbox:FocusNext()
			txtbox:OnEnter()
			txtbox.HistoryPos = 0
		end

		if (txtbox.m_bHistory or IsValid(txtbox.Menu)) then
			if (code == KEY_UP) then
				txtbox.HistoryPos = txtbox.HistoryPos - 1;
				if (txtbox.HistoryPos ~= -1 or txtbox.Menu:ChildCount() ~= 5) then
					txtbox:UpdateFromHistory()
				else
					txtbox.Menu:ClearHighlights()
					txtbox.Menu:HighlightItem(txtbox.Menu:GetChild(5))
					txtbox.HistoryPos = 5
				end
			end
			if (code == KEY_DOWN or code == KEY_TAB) then
				txtbox.HistoryPos = txtbox.HistoryPos + 1;
				if (txtbox.HistoryPos ~= 5 or txtbox.Menu:ChildCount() ~= 5) then
					txtbox:UpdateFromHistory()
				else
					txtbox.Menu:ClearHighlights()
					txtbox.Menu:HighlightItem(txtbox.Menu:GetChild(5))
				end
			end

		end
	end
	self.FileName.OnValueChange = function()
		if (self.FileName:GetValue() ~= "File_Name..." and
			self.FileName:GetValue() ~= "Folder_Name...") then
			local new, changed = self.FileName:GetValue():gsub("[^%w_ ]", "")
			if changed > 0 then
				self.FileName:SetText(new)
				self.FileName:SetCaretPos(#new)
			end
		end
	end

	self.Desc = vgui.Create("DTextEntry", self)
	self.Desc.OnEnter = self.Submit.DoClick
	self.Desc:SetText("Description...")
	self.Desc.OnMousePressed = function()
		self.Desc:OnGetFocus()
		if (self.Desc:GetValue() == "Description...") then
			self.Desc:SelectAllOnFocus(true)
		end
	end

	self.Info = vgui.Create("DLabel", self)
	self.Info:SetVisible(false)

end

function PANEL:Slide(expand)
	if (expand) then
		if (self.Expanded) then
			self:SetTall(self:GetTall() - 40)
			self.Expanded = false
		else
			self:SetTall(self:GetTall() + 5)
		end
	else
		if (not self.Expanded) then
			self:SetTall(self:GetTall() + 40)
			self.Expanded = true
		else
			self:SetTall(self:GetTall() - 5)
		end
	end
	count = count + 1
	if (count < 9) then
		timer.Simple(0.01, function() self:Slide(expand) end)
	else
		if (expand) then
			self.Expanded = true
		else
			self.Expanded = false
		end
		self.Expanding = false
		count = 0
	end
end

function PANEL:GetFullPath(node)
	return GetFullPath(node)
end

function PANEL:GetNodePath(node)
	return GetNodePath(node)
end

if (game.SinglePlayer()) then
	net.Receive("AdvDupe2_AddFile", function()
		local asvNode = AdvDupe2.FileBrowser.AutoSaveNode
		local actNode = AdvDupe2.FileBrowser.Browser.pnlCanvas.ActionNode
		if (net.ReadBool()) then
			if (IsValid(asvNode)) then
				local name = net.ReadString()
				for iD = 1, #asvNode.Files do
					if (name == asvNode.Files[i]) then return end
				end
				asvNode:AddFile(name)
				asvNode.Control:Sort(asvNode)
			end
		else
			actNode:AddFile(net.ReadString())
			actNode.Control:Sort(actNode)
		end
	end)
end

vgui.Register("advdupe2_browser", PANEL, "Panel")

--addons/wos-passiveevent-ageo/lua/wos/pes/vgui/wos_datacopy_editor.lua:
--[[-------------------------------------------------------------------]]--[[
							  
	Copyright wiltOS Technologies LLC, 2023
	
	Contact: www.wiltostech.com
		
----------------------------------------]]--


























































































































































local PANEL = {}

function PANEL:Init()

end

function PANEL:SetVariableData( data )
    self.VariableData = table.Copy( data )
    self:RebuildData()
end

function PANEL:SetBasePanel( pan )
    self.DataPanel = pan
end

function PANEL:GetVariableData()
    return self.VariableData
end
--
-- Clears and rebuilds the controls. Should only really be called internally.
--
function PANEL:RebuildData()

	--
	-- we're rebuilding - so clear all the old controls
	--
	self:Clear()

    if not self.VariableData then return end

    -- Enforces that it is at the top of the list
    self:GetCategory( "Base Entity Data", true )

	for name, data in pairs( self.VariableData ) do
		self:EditVariable( name, data )
	end

end

local function VarToPropertyType( var )
    if isbool( var ) then
        return "Bool"
    elseif IsColor( var ) then
        return "VectorColor"
    elseif isvector( var ) then
        return "Vector"
    elseif isangle( var ) then
        return "Angle"
    end

    return "String"
end

function PANEL:CreateNestedEditor( varname, editdata )
    local category = self:GetCategory( varname, true )
    local count = 0
    for val_name, val in pairs( editdata ) do
        if istable( val ) then continue end
        count = count + 1
        local row = self:CreateRow( varname, val_name )
        row:Setup( VarToPropertyType( val ) )
        row:SetValue( val )
        row:SetEnabled( true )

        row.DataUpdate = function( _ ) end
        row.DataChanged = function( _, vald )
            if not IsValid( self.DataPanel ) then return end
            self.VariableData[ varname ][ val_name ] = vald
        end
    end
    if count < 1 then category:Remove() end
end

--
-- Called internally. Adds an entity variable to watch.
--
function PANEL:EditVariable( varname, editdata )

	if ( istable( editdata ) ) then 
        /*
            Uncomment this function if you DARE. It will add some nested tables (only one layer of nest)
            Need to make a TABLE row type for PES, so we can ADD to tables. Only then will this official get added back
        */

        // self:CreateNestedEditor( varname, editdata ) 
        return 
    end

	local row = self:CreateRow( "Base Entity Data", varname )
	row:Setup( VarToPropertyType( editdata ) )
    row:SetValue( editdata )
    row:SetEnabled( true )

	row.DataUpdate = function( _ ) end
	row.DataChanged = function( _, val )
        if not IsValid( self.DataPanel ) then return end
        self.VariableData[ varname ] = val
	end

end

vgui.Register( "WOS_PES_DATACOPY_EDITOR", PANEL, "DProperties" )
--addons/wos-passiveevent-ageo/lua/wos/pes/vars/angle.lua:
--[[-------------------------------------------------------------------]]--[[
							  
	Copyright wiltOS Technologies LLC, 2021
	
	Contact: www.wiltostech.com
		
----------------------------------------]]--


local VAR = {}

VAR.Name = "Angle"
VAR.UseTool = true
VAR.DirtyValidate = true

VAR.ToolTips = {
    { text = "Save your current aiming angles", key = "gui/lmb.png", },
}

VAR.IsValid = function(varTable, value)
    if not isangle(value) then
        return false
    end

    return true
end

VAR.DermaElement = function(varTable, value)
    local panel = vgui.Create("DPanel")
    panel.Value = value

    function panel:Paint(ww, hh)
        if isangle(self.Value) then
            draw.SimpleText("Angle set at: " .. tostring(self.Value), nil, ww * 0.5, hh * 0.5, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Angle needs to be set!", nil, ww * 0.5, hh * 0.5, Color(255, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end

    return panel
end

VAR.GetValue = function(panel)
    return panel.Value
end

VAR.PrimaryAttack = function(wep, ply, panel)
    panel.Value = ply:EyeAngles()
end

VAR.OnStart = function(node, value, var)
    if !isangle(value) then

        local vec = Angle(value)
        if vec then
            node:SetVar(var.Name, vec)
        end
    end
end

VAR.Draw3D = function(wep, ply, element)
    local ang = element.Value
    if not isangle(vec) then return end

    local pos = EyePos()
    render.DrawLine(pos, pos + ang:Forward() * 30 , Color(255, 255, 255), false)
end

return VAR

--addons/wos-passiveevent-ageo/lua/wos/pes/vars/int.lua:
--[[-------------------------------------------------------------------]]--[[
							  
	Copyright wiltOS Technologies LLC, 2021
	
	Contact: www.wiltostech.com
		
----------------------------------------]]--


local VAR = {}

VAR.Name = "Int"

VAR.IsValid = function(varTable, value)
    if not isnumber(value) then
        return false
    end
    return true
end

VAR.DermaElement = function(varTable, value)
    local numberWang = vgui.Create("DNumberWang")
    numberWang:SetDecimals(0)

    if isnumber(varTable.Min) then
        numberWang:SetMin(varTable.Min)
    else
         numberWang:SetMin( 0 )
    end

    if isnumber(varTable.Max) then
        numberWang:SetMax(varTable.Max)
    else
        numberWang:SetMax( math.huge )
    end

    if isnumber(value) then
        numberWang:SetValue(value)
    else
        numberWang:SetValue(varTable.Default)
    end

    return numberWang
end

VAR.GetValue = function(numberWang)
    return numberWang:GetValue()
end

return VAR

--addons/wos-passiveevent-ageo/lua/wos/pes/vars/pathvar.lua:

local VAR = {}

VAR.Name = "Path"
VAR.UseTool = true

VAR.ToolTips = {
    { text = "Add the position and angle you are AIMING AT to the path", key = "gui/lmb.png", },
    { text = "Add your current EYE position and angle to the path", key = "gui/lmb.png", key2 = "gui/e.png", },
    { text = "Add your current STANDING position and angle to the path", key = "gui/lmb.png", key2 = "icon16/control_fastforward.png", },
    { text = "Remove the last added position and angle from the path", key = "gui/rmb.png", },
}

VAR.IsValid = function(varTable, value)

	if (value == nil) then return false end
	if type(value) != "table" then return false end


	if #value != table.Count(value) then return false end

	if #value  < 1 then return false end

	return true
end

VAR.GetValue = function(element)
    if element.Path then
        return element.Path
    end
end

VAR.PrimaryAttack = function(wep, ply, element)
	element.Path = element.Path or {}

    local pos =  ply:GetEyeTrace().HitPos
    if ply:KeyDown( IN_SPEED ) then
        pos = ply:GetPos()
    elseif ply:KeyDown( IN_USE ) then
        pos = ply:EyePos()
    end

    local ang = ply:EyeAngles()
    
    local allowed = hook.Call( "wOS.CombatSim.CanPlaceEntity", nil, wep, ply, pos )
    if isbool( allowed ) and allowed == false then return end

	table.insert(element.Path, {
		Vector = pos,
		Angle = ang,
	})
    panel:RefreshList()
end

VAR.DermaElement = function(varTable, value)
    local panel = vgui.Create("DPanel")
    panel:SetTall( 180 )
    panel.Path = value

    function panel:Paint(ww, hh) end

    local listView = vgui.Create("DListView", panel)
    listView:Dock( FILL )
    listView:AddColumn("Vector")
    listView:AddColumn("Angle")    
    listView.RefreshList = function( pan )
        pan:Clear()
        if not panel.Path or #panel.Path < 1 then
            pan:AddLine( "Path needs to be set!" )
            return
        end

        for id, vdata in pairs( panel.Path or {} ) do
            local line = pan:AddLine( vdata.Vector, vdata.Angle )
            line.ID = id
        end
        
    end

    listView.OnRowRightClick = function( pan, id, line )
        table.remove( panel.Path, line.ID )
        pan:RefreshList()
    end

    listView:RefreshList()
    panel.RefreshList = function() listView:RefreshList() end

    return panel
end

VAR.SecondaryAttack = function(wep, ply, element)
	element.Path = element.Path or {}
	if #element.Path > 0 then
		table.remove(element.Path, #element.Path)
	end
end

VAR.Draw3D = function(wep, ply, element)
	local path = element.Path or {}

	for _, v in pairs(path) do
		local pos = v.Vector
		local ang = v.Angle

		local pos2 = pos + ang:Forward() * 10

		render.DrawLine(pos, pos2, Color(0, 0, 0), true)
		render.DrawWireframeSphere(pos, 5, 10, 10, Color(255, 255, 255, 255))
	end
end

return VAR
--addons/billy_gas/lua/vgui/bvgui/httplogo.lua:
file.CreateDir("gas_http_png")

local PANEL = {}

local logo_mat = Material("gmodadminsuite/gmodadminsuite.vtf")
function PANEL:Init()
	local this = self

	self.Directory = "gas_http_png"

	self:Dock(TOP)
	self:SetTall(128 + 20 + 10 + 25 + 10)

	self.Logo = vgui.Create("DImage", self)
	self.Logo:SetSize(128,128)
	self.Logo:SetMaterial(logo_mat)

	self.LoadingOverlay = vgui.Create("bVGUI.LoadingPanel", self)
	self.LoadingOverlay:Dock(FILL)
	self.LoadingOverlay:SetLoading(false)

	self.URLContainer = vgui.Create("bVGUI.BlankPanel", self)
	self.URLContainer:Dock(TOP)
	self.URLContainer:DockMargin(0,128 + 20 + 20,0,0)
	self.URLContainer:SetTall(25)
	function self.URLContainer:PerformLayout()
		this.URLField:Center()
	end

	self.URLField = vgui.Create("bVGUI.TextEntry", self.URLContainer)
	self.URLField:SetPlaceholderText("URL...")
	self.URLField:SetSize(128 + 20 + 40, 25)
	function self.URLField:OnLoseFocus()
		self:ResetValidity()
		if (self:GetValue() == "") then
			this.Logo:SetVisible(true)
			this.Logo:SetMaterial(logo_mat)
			return
		end

		this.Logo:SetVisible(false)
		this.LoadingOverlay:SetLoading(true)

		local crc = util.CRC(os.date("%d%m%Y") .. self:GetValue()) .. ".png"

		http.Fetch(self:GetValue(), function(body, size, headers, code)
			this.LoadingOverlay:SetLoading(false)
			if (body:find("^.PNG")) then
				file.Write(this.Directory .. "/" .. crc, body)
				this.Logo:SetVisible(true)
				this.Logo:SetMaterial(Material("data/" .. this.Directory .. "/" .. crc))
				self:SetValid(true)
			else
				self:SetInvalid(true)
			end
			if (this.Always) then
				this:Always()
			end
			if (this.Success) then
				this:Success()
			end
		end, function()
			this.LoadingOverlay:SetLoading(false)
			self:SetInvalid(true)
			if (this.Always) then
				this:Always()
			end
			if (this.Failure) then
				this:Failure()
			end
		end)
	end
end

function PANEL:Paint(w,h)
	surface.SetDrawColor(0,0,0,200)
	surface.DrawRect((w - (128 + 20)) / 2,0,128 + 20,128 + 20)

	if (self.URLField._Invalid) then
		surface.SetDrawColor(255,0,0,100)
		surface.DrawRect((w - 128) / 2,10,128,128)
	end
end

function PANEL:GetURL()
	if (this.URLField._Valid) then
		return self.URLField:GetValue()
	else
		return false
	end
end

function PANEL:SetPlaceholderText(text)
	self.URLField:SetPlaceholderText(text)
end

function PANEL:SetDirectory(path)
	self.Directory = path
	file.CreateDir(path)
end

function PANEL:PerformLayout()
	self.Logo:AlignTop(10)
	self.Logo:CenterHorizontal()
end

derma.DefineControl("bVGUI.HTTPImageInput", nil, PANEL, "bVGUI.BlankPanel")
--addons/billy_gas/lua/vgui/bvgui/mouseinfo_tooltip.lua:
if (IsValid(bVGUI.MouseInfoTooltip)) then
	if (IsValid(bVGUI.MouseInfoTooltip.Label)) then
		bVGUI.PlayerTooltip.Label:Remove()
	end
end

bVGUI.MouseInfoTooltip = {}
bVGUI.MouseInfoTooltip.Create = function(text)
	if (IsValid(bVGUI.MouseInfoTooltip.Label)) then
		bVGUI.MouseInfoTooltip.Label:Remove()
	end
	bVGUI.MouseInfoTooltip.Label = vgui.Create("DLabel")
	bVGUI.MouseInfoTooltip.Label:SetFont(bVGUI.FONT(bVGUI.FONT_RUBIK, "BOLD", 12))
	bVGUI.MouseInfoTooltip.Label:SetText(text)
	bVGUI.MouseInfoTooltip.Label:SizeToContents()
	bVGUI.MouseInfoTooltip.Label:SetContentAlignment(5)

	bVGUI.MouseInfoTooltip.Label.CurrentTextColor = Color(255, 255, 255, 255)
	bVGUI.MouseInfoTooltip.Label.CurrentY = 15

	bVGUI.MouseInfoTooltip.Label:SetTextColor(bVGUI.MouseInfoTooltip.Label.CurrentTextColor)
	bVGUI.MouseInfoTooltip.Label:SetPos(gui.MouseX(), bVGUI.MouseInfoTooltip.Label.CurrentY)

	bVGUI.MouseInfoTooltip.Label:SetZPos(32767)
	bVGUI.MouseInfoTooltip.Label:MakePopup()
	bVGUI.MouseInfoTooltip.Label:MoveToFront()
	bVGUI.MouseInfoTooltip.Label:SetMouseInputEnabled(false)
	bVGUI.MouseInfoTooltip.Label:SetKeyBoardInputEnabled(false)

	bVGUI.MouseInfoTooltip.Label.SysTime = SysTime()
	bVGUI.MouseInfoTooltip.Label.SysTimeEnd = SysTime() + 5
	function bVGUI.MouseInfoTooltip.Label:Think()
		self.CurrentTextColor.a = Lerp(FrameTime() * 10, self.CurrentTextColor.a, 0)
		self.CurrentY = Lerp(FrameTime() * 10, self.CurrentY, 20)

		self:SetTextColor(self.CurrentTextColor)
		self:SetPos(gui.MouseX() - (self:GetWide() / 2) + 5, gui.MouseY() + self:GetTall() + self.CurrentY)

		if (self.CurrentTextColor.a <= 1) then
			self:Remove()
		end
	end
end
--addons/billy_gas/lua/vgui/openpermissions_columnlayout.lua:
local PANEL = {}

OpenPermissions_COLUMN_LAYOUT_COLUMN_GROW = 0
OpenPermissions_COLUMN_LAYOUT_COLUMN_SHRINK = 1
OpenPermissions_COLUMN_LAYOUT_COLUMN_GROW_COLUMN = 2

function PANEL:Init()
	self.Columns = {}
	self.Rows = {}
	self.ColumnPadding = 0
	self.RowPadding = 0

	function self.pnlCanvas:PerformLayout()
		self:GetParent():ColumnLayout()
		self:InvalidateParent(true)
	end
end

function PANEL:SetPaddings(column_padding, row_padding)
	self.ColumnPadding = column_padding
	self.RowPadding = row_padding
end

function PANEL:SetColumns(...)
	self.Columns = {...}
	self.GrowColumnCount = 0
	for _,v in ipairs(self.Columns) do
		if (v == OpenPermissions_COLUMN_LAYOUT_COLUMN_GROW or v == OpenPermissions_COLUMN_LAYOUT_COLUMN_GROW_COLUMN) then
			self.GrowColumnCount = self.GrowColumnCount + 1
		end
	end
end

function PANEL:AddRow(...)
	local i = table.insert(self.Rows, {...})
	self.pnlCanvas:InvalidateLayout(true)
	return i
end

function PANEL:RemoveRow(row_index)
	for _,element in ipairs(self.Rows[row_index]) do
		element:Remove()
	end
	table.remove(self.Rows, row_index)
	self.pnlCanvas:InvalidateLayout(true)
end

function PANEL:ColumnLayout()
	local column_widths = {}
	local row_heights = {}
	for row_i, elements in ipairs(self.Rows) do
		for column_i, element in ipairs(elements) do
			if (self.Columns[column_i] == OpenPermissions_COLUMN_LAYOUT_COLUMN_SHRINK) then
				local element_w = element:GetWide()
				local column_w = column_widths[column_i]
				if (not column_w or element_w > column_w) then
					column_widths[column_i] = element_w
				end
			end
			if (self.Columns[column_i] ~= OpenPermissions_COLUMN_LAYOUT_COLUMN_GROW_COLUMN) then
				local element_h = element:GetTall()
				local row_h = row_heights[row_i]
				if (not row_h or element_h > row_h) then
					row_heights[row_i] = element_h
				end
			end
		end
	end
	local grow_column_width = 0
	for i,v in pairs(column_widths) do
		grow_column_width = grow_column_width - v - self.ColumnPadding
	end
	grow_column_width = ((grow_column_width + self:GetWide()) / self.GrowColumnCount) - 4

	local row_y = 0
	for row_i, elements in ipairs(self.Rows) do
		local column_x = 0
		for column_i, element in ipairs(elements) do
			local column_sizing = self.Columns[column_i]
			if (column_sizing == OpenPermissions_COLUMN_LAYOUT_COLUMN_SHRINK) then
				element:SetWide(column_widths[column_i])
				element:SetPos(column_x, row_y)
				column_x = column_x + column_widths[column_i] + self.ColumnPadding
			elseif (column_sizing == OpenPermissions_COLUMN_LAYOUT_COLUMN_GROW or column_sizing == OpenPermissions_COLUMN_LAYOUT_COLUMN_GROW_COLUMN) then
				if (OpenPermissions_COLUMN_LAYOUT_COLUMN_GROW_COLUMN) then
					element:SetWide(grow_column_width)
				else
					element:SetSize(grow_column_width, row_heights[row_i])
				end
				element:SetPos(column_x, row_y)
				column_x = column_x + grow_column_width + self.ColumnPadding
			end
		end
		row_y = row_y + row_heights[row_i] + self.RowPadding
	end
end

derma.DefineControl("OpenPermissions.ColumnLayout", nil, PANEL, "OpenPermissions.ScrollPanel")
--gamemodes/starwarsrp/gamemode/modules/terminals/cl_imgui.lua:
local imgui = {}

imgui.skin = {
	background = Color(0, 0, 0, 0),
	backgroundHover = Color(0, 0, 0, 0),

	border = Color(255, 255, 255),
	borderHover = Color(255, 127, 0),
	borderPress = Color(255, 80, 0),

	foreground = Color(255, 255, 255),
	foregroundHover = Color(255, 127, 0),
	foregroundPress = Color(255, 80, 0),
}

local devCvar = GetConVar("developer")
function imgui.IsDeveloperMode()
	return not imgui.DisableDeveloperMode and devCvar:GetInt() > 0
end

local _devMode = false -- cached local variable updated once in a while

function imgui.Hook(name, id, callback)
	local hookUniqifier = debug.getinfo(4).short_src
	hook.Add(name, "IMGUI / " .. id .. " / " .. hookUniqifier, callback)
end

local localPlayer
local gState = {}

local function shouldAcceptInput()
	-- don't process input during non-main renderpass
	if render.GetRenderTarget() ~= nil then
		return false
	end

	-- don't process input if we're doing VGUI stuff (and not in context menu)
	if vgui.CursorVisible() and vgui.GetHoveredPanel() ~= g_ContextMenu then
		return false
	end

	return true
end


imgui.Hook("PreRender", "Input", function()
	-- calculate mouse state
	if shouldAcceptInput() then
		local useBind = input.LookupBinding("+use", true)
		local attackBind = input.LookupBinding("+attack", true)
		local USE = useBind and input.GetKeyCode(useBind)
		local ATTACK = attackBind and input.GetKeyCode(attackBind)

		local wasPressing = gState.pressing
		gState.pressing = (USE and input.IsButtonDown(USE)) or (ATTACK and input.IsButtonDown(ATTACK))
		gState.pressed = not wasPressing and gState.pressing
	end
end)

hook.Add("NotifyShouldTransmit", "IMGUI / ClearRenderBounds", function(ent, shouldTransmit)
	if shouldTransmit and ent._imguiRBExpansion then
		ent._imguiRBExpansion = nil
	end
end)

local traceResultTable = {}
local traceQueryTable = { output = traceResultTable, filter = {} }
local function isObstructed(eyePos, hitPos, ignoredEntity)
	local q = traceQueryTable
	q.start = eyePos
	q.endpos = hitPos
	q.filter[1] = localPlayer
	q.filter[2] = ignoredEntity

	local tr = util.TraceLine(q)
	if tr.Hit then
		return true, tr.Entity
	else
		return false
	end
end

function imgui.Start3D2D(pos, angles, scale, distanceHide, distanceFadeStart)
	if not IsValid(localPlayer) then
		localPlayer = LocalPlayer()
	end

	if gState.shutdown == true then
		return
	end

	if gState.rendering == true then
		print(
			"[IMGUI] Starting a new IMGUI context when previous one is still rendering" ..
			"Shutting down rendering pipeline to prevent crashes.."
		)
		gState.shutdown = true
		return false
	end

	_devMode = imgui.IsDeveloperMode()

	local eyePos = localPlayer:EyePos()
	local eyePosToPos = pos - eyePos

	-- OPTIMIZATION: Test that we are in front of the UI
	do
		local normal = angles:Up()
		local dot = eyePosToPos:Dot(normal)

		if _devMode then gState._devDot = dot end

		-- since normal is pointing away from surface towards viewer, dot<0 is visible
		if dot >= 0 then
			return false
		end
	end

	-- OPTIMIZATION: Distance based fade/hide
	if distanceHide then
		local distance = eyePosToPos:Length()
		if distance > distanceHide then
			return false
		end

		if _devMode then
			gState._devDist = distance
			gState._devHideDist = distanceHide
		end

		if distanceHide and distanceFadeStart and distance > distanceFadeStart then
			local blend = math.min(math.Remap(distance, distanceFadeStart, distanceHide, 1, 0), 1)
			render.SetBlend(blend)
			surface.SetAlphaMultiplier(blend)
		end
	end

	gState.rendering = true
	gState.pos = pos
	gState.angles = angles
	gState.scale = scale

	cam.Start3D2D(pos, angles, scale)

	-- calculate mousepos
	if not vgui.CursorVisible() or vgui.IsHoveringWorld() then
		local tr = localPlayer:GetEyeTrace()
		local eyepos = tr.StartPos
		local eyenormal

		if vgui.CursorVisible() and vgui.IsHoveringWorld() then
			eyenormal = gui.ScreenToVector(gui.MousePos())
		else
			eyenormal = tr.Normal
		end

		local planeNormal = angles:Up()

		local hitPos = util.IntersectRayWithPlane(eyepos, eyenormal, pos, planeNormal)
		if hitPos then
			local obstructed, obstructer = isObstructed(eyepos, hitPos, gState.entity)
			if obstructed then
				gState.mx = nil
				gState.my = nil

				if _devMode then gState._devInputBlocker = "collision " .. obstructer:GetClass() .. "/" .. obstructer:EntIndex() end
			else
				local diff = pos - hitPos

				-- This cool code is from Willox's keypad CalculateCursorPos
				local x = diff:Dot(-angles:Forward()) / scale
				local y = diff:Dot(-angles:Right()) / scale

				gState.mx = x
				gState.my = y
			end
		else

			gState.mx = nil
			gState.my = nil

			if _devMode then gState._devInputBlocker = "not looking at plane" end
		end
	else
		gState.mx = nil
		gState.my = nil

		if _devMode then gState._devInputBlocker = "not hovering world" end
	end

	if _devMode then gState._renderStarted = SysTime() end

	return true
end

function imgui.Entity3D2D(ent, lpos, lang, scale, ...)
	gState.entity = ent
	local ret = imgui.Start3D2D(ent:LocalToWorld(lpos), ent:LocalToWorldAngles(lang), scale, ...)
	if not ret then
		gState.entity = nil
	end
	return ret
end

local function calculateRenderBounds(x, y, w, h)
	local pos = gState.pos
	local fwd, right = gState.angles:Forward(), gState.angles:Right()
	local scale = gState.scale
	local firstCorner, secondCorner =
		pos + fwd * x * scale + right * y * scale,
		pos + fwd * (x + w) * scale + right * (y + h) * scale

	local minrb, maxrb = Vector(math.huge, math.huge, math.huge), Vector(-math.huge, -math.huge, -math.huge)

	minrb.x = math.min(minrb.x, firstCorner.x, secondCorner.x)
	minrb.y = math.min(minrb.y, firstCorner.y, secondCorner.y)
	minrb.z = math.min(minrb.z, firstCorner.z, secondCorner.z)
	maxrb.x = math.max(maxrb.x, firstCorner.x, secondCorner.x)
	maxrb.y = math.max(maxrb.y, firstCorner.y, secondCorner.y)
	maxrb.z = math.max(maxrb.z, firstCorner.z, secondCorner.z)

	return minrb, maxrb
end

function imgui.ExpandRenderBoundsFromRect(x, y, w, h)
	local ent = gState.entity
	if IsValid(ent) then
		-- make sure we're not applying same expansion twice
		local expansion = ent._imguiRBExpansion
		if expansion then
			local ex, ey, ew, eh = unpack(expansion)
			if ex == x and ey == y and ew == w and eh == h then
				return
			end
		end

		local minrb, maxrb = calculateRenderBounds(x, y, w, h)

		ent:SetRenderBoundsWS(minrb, maxrb)
		if _devMode then
			print("[IMGUI] Updated renderbounds of ", ent, " to ", minrb, "x", maxrb)
		end

		ent._imguiRBExpansion = {x, y, w, h}
	else
		if _devMode then
			print("[IMGUI] Attempted to update renderbounds when entity is not valid!! ", debug.traceback())
		end
	end
end

local devOffset = Vector(0, 0, 30)
local devColours = {
	background = Color(0, 0, 0, 200),
	title = Color(78, 205, 196),
	mouseHovered = Color(0, 255, 0),
	mouseUnhovered = Color(255, 0, 0),
	pos = Color(255, 255, 255),
	distance = Color(200, 200, 200, 200),
	ang = Color(255, 255, 255),
	dot = Color(200, 200, 200, 200),
	angleToEye = Color(200, 200, 200, 200),
	renderTime = Color(255, 255, 255),
	renderBounds = Color(0, 0, 255)
}

local function developerText(str, x, y, clr)
	draw.SimpleText(
		str, "DefaultFixedDropShadow", x, y, clr, TEXT_ALIGN_CENTER, nil
	)
end

local function drawDeveloperInfo()
	local camAng = localPlayer:EyeAngles()
	camAng:RotateAroundAxis(camAng:Right(), 90)
	camAng:RotateAroundAxis(camAng:Up(), -90)

	cam.IgnoreZ(true)
	cam.Start3D2D(gState.pos + devOffset, camAng, 0.15)

	local bgCol = devColours["background"]
	surface.SetDrawColor(bgCol.r, bgCol.g, bgCol.b, bgCol.a)
	surface.DrawRect(-100, 0, 200, 140)

	local titleCol = devColours["title"]
	developerText("imgui developer", 0, 5, titleCol)

	surface.SetDrawColor(titleCol.r, titleCol.g, titleCol.b)
	surface.DrawLine(-50, 16, 50, 16)

	local mx, my = gState.mx, gState.my
	if mx and my then
		developerText(
			string.format("mouse: hovering %d x %d", mx, my),
			0, 20, devColours["mouseHovered"]
		)
	else
		developerText(
			string.format("mouse: %s", gState._devInputBlocker or ""),
			0, 20, devColours["mouseUnhovered"]
		)
	end

	local pos = gState.pos
	developerText(
		string.format("pos: %.2f %.2f %.2f", pos.x, pos.y, pos.z),
		0, 40, devColours["pos"]
	)

	developerText(
		string.format("distance %.2f / %.2f", gState._devDist or 0, gState._devHideDist or 0),
		0, 53, devColours["distance"]
	)

	local ang = gState.angles
	developerText(string.format("ang: %.2f %.2f %.2f", ang.p, ang.y, ang.r), 0, 75, devColours["ang"])
	developerText(string.format("dot %d", gState._devDot or 0), 0, 88, devColours["dot"])

	local angToEye = (pos - localPlayer:EyePos()):Angle()
	angToEye:RotateAroundAxis(ang:Up(), -90)
	angToEye:RotateAroundAxis(ang:Right(), 90)

	developerText(
		string.format("angle to eye (%d,%d,%d)", angToEye.p, angToEye.y, angToEye.r),
		0, 100, devColours["angleToEye"]
	)

	developerText(
		string.format("rendertime avg: %.2fms", (gState._devBenchAveraged or 0) * 1000),
		0, 120, devColours["renderTime"]
	)

	cam.End3D2D()
	cam.IgnoreZ(false)

	local ent = gState.entity
	if IsValid(ent) and ent._imguiRBExpansion then
		local ex, ey, ew, eh = unpack(ent._imguiRBExpansion)
		local minrb, maxrb = calculateRenderBounds(ex, ey, ew, eh)
		render.DrawWireframeBox(vector_origin, angle_zero, minrb, maxrb, devColours["renderBounds"])
	end
end

function imgui.End3D2D()
	if gState then
		if _devMode then
			local renderTook = SysTime() - gState._renderStarted
			gState._devBenchTests = (gState._devBenchTests or 0) + 1
			gState._devBenchTaken = (gState._devBenchTaken or 0) + renderTook
			if gState._devBenchTests == 100 then
				gState._devBenchAveraged = gState._devBenchTaken / 100
				gState._devBenchTests = 0
				gState._devBenchTaken = 0
			end
		end
		gState.rendering = false
		cam.End3D2D()
		render.SetBlend(1)
		surface.SetAlphaMultiplier(1)

		if _devMode then
			drawDeveloperInfo()
		end

		gState.entity = nil
	end
end

function imgui.CursorPos()
	local mx, my = gState.mx, gState.my
	return mx, my
end

function imgui.IsHovering(x, y, w, h)
	local mx, my = gState.mx, gState.my
	return mx and my and mx >= x and mx <= (x + w) and my >= y and my <= (y + h)
end
function imgui.IsPressing()
	return shouldAcceptInput() and gState.pressing
end
function imgui.IsPressed()
	return shouldAcceptInput() and gState.pressed
end

-- String->Bool mappings for whether font has been created
local _createdFonts = {}

-- Cached IMGUIFontNamd->GModFontName
local _imguiFontToGmodFont = {}

local EXCLAMATION_BYTE = string.byte("!")
function imgui.xFont(font, defaultSize)
	-- special font
	if string.byte(font, 1) == EXCLAMATION_BYTE then

		local existingGFont = _imguiFontToGmodFont[font]
		if existingGFont then
			return existingGFont
		end

		-- Font not cached; parse the font
		local name, size = font:match("!([^@]+)@(.+)")
		if size then size = tonumber(size) end

		if not size and defaultSize then
			name = font:match("^!([^@]+)$")
			size = defaultSize
		end

		local fontName = string.format("IMGUI_%s_%d", name, size)
		_imguiFontToGmodFont[font] = fontName
		if not _createdFonts[fontName] then
			surface.CreateFont(fontName, {
				font = name,
				size = size
			})
			_createdFonts[fontName] = true
		end

		return fontName
	end
	return font
end

function imgui.xButton(x, y, w, h, borderWidth, borderClr, hoverClr, pressColor)
	local bw = borderWidth or 1

	local bgColor = imgui.IsHovering(x, y, w, h) and imgui.skin.backgroundHover or imgui.skin.background
	local borderColor =
		((imgui.IsPressing() and imgui.IsHovering(x, y, w, h)) and (pressColor or imgui.skin.borderPress))
		or (imgui.IsHovering(x, y, w, h) and (hoverClr or imgui.skin.borderHover))
		or (borderClr or imgui.skin.border)

	surface.SetDrawColor(bgColor)
	surface.DrawRect(x, y, w, h)

	if bw > 0 then
		surface.SetDrawColor(borderColor)

		surface.DrawRect(x, y, w, bw)
		surface.DrawRect(x, y + bw, bw, h - bw * 2)
		surface.DrawRect(x, y + h-bw, w, bw)
		surface.DrawRect(x + w - bw + 1, y, bw, h)
	end

	return shouldAcceptInput() and imgui.IsHovering(x, y, w, h) and gState.pressed
end


function imgui.xCursor(x, y, w, h)
	local fgColor = imgui.IsPressing() and imgui.skin.foregroundPress or imgui.skin.foreground
	local mx, my = gState.mx, gState.my

	if not mx or not my then return end

	if x and w and (mx < x or mx > x + w) then return end
	if y and h and (my < y or my > y + h) then return end

	local cursorSize = math.ceil(0.3 / gState.scale)
	surface.SetDrawColor(fgColor)
	surface.DrawLine(mx - cursorSize, my, mx + cursorSize, my)
	surface.DrawLine(mx, my - cursorSize, mx, my + cursorSize)
end

function imgui.xTextButton(text, font, x, y, w, h, borderWidth, color, hoverClr, pressColor)
	local fgColor =
		((imgui.IsPressing() and imgui.IsHovering(x, y, w, h)) and (pressColor or imgui.skin.foregroundPress))
		or (imgui.IsHovering(x, y, w, h) and (hoverClr or imgui.skin.foregroundHover))
		or (color or imgui.skin.foreground)

	local clicked = imgui.xButton(x, y, w, h, borderWidth, color, hoverClr, pressColor)

	font = imgui.xFont(font, math.floor(h * 0.618))
	draw.SimpleText(text, font, x + w / 2, y + h / 2, fgColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	return clicked
end


AOCRP.IMGUI = imgui





--gamemodes/starwarsrp/gamemode/modules/main/cl_afk.lua:
AOCRP.AFK = {}

local afkStart = 9 * 60

local afkKick = 10 * 60


hook.Add("StartCommand", "AOCRP.AFK.StartCommand", function(p, cmd)
	p.afk_lastMouseX = cmd:GetMouseX()
	p.afk_lastMouseY = cmd:GetMouseY()

	if p.afk_lastMouseX != 0 || p.afk_lastMouseY != 0 then
		p.afk_lastMove = CurTime()
	else
		p.afk_lastMove = p.afk_lastMove || CurTime()
	end
end)


function AOCRP.AFK:CreateTimers()
    if timer.Exists("AOCRP_AFK") then timer.Remove("AOCRP_AFK") end
    timer.Create("AOCRP_AFK", 1, 0, function() 


        local p = LocalPlayer()
        local ct = CurTime()


        p.lastGuiMouse = p.lastGuiMouse or gui.MouseX()
        
        if gui.MouseX() != p.lastGuiMouse then 
            p.lastGuiMouse = gui.MouseX()
            p.afk_lastMove = ct
        end

        if p:IsSuperAdmin() or p:GetAOCVIP() then
            return
        end
        if !p:Alive() then
            return 
        end 



        
        p.afk_lastMove = p.afk_lastMove || ct


    
        if (p.afk_lastMove + afkKick < ct) then
            if player.GetCount() < 75 then return end 
            AOCRP:Kick(LocalPlayer(),"Du warst zu lange Inaktiv. (15min)")
            --p:Kick("Du warst zu lange AFK")
        elseif (p.afk_lastMove + afkStart < ct) then
            if (!p.afk_notified) then

                AOCRP.HUD:Notification(p, {text="Du wirst in einer Minute wegen Inaktivität gekickt!.", title="ACHTUNG", barcolor=Color(255,0,0), titlecolor=Color(255,0,0), sound="ambient/alarms/warningbell1.wav", delay=60}) 
                --p:ChatPrint("[AFK] Du bist nun als abwesend markiert.")
                p.afk_notified = true
            end
        else
            if (p.afk_notified) then
                AOCRP.HUD:Notification(p, {text="Du bist nicht mehr als abwesend markiert.", title="AFK", barcolor=Color(0,255,0), titlecolor=Color(0,255,0)}) 
                p.afk_notified = false
            end
        end

    end)
end 
--gamemodes/starwarsrp/gamemode/modules/gui/sh_hudcalls.lua:
AOCRP.HUD = AOCRP.HUD or {}

if SERVER then

    util.AddNetworkString("AOCRP.HUD.CutScene")
    util.AddNetworkString("AOCRP.HUD.CutSceneNew")

    function AOCRP.HUD:CallRankNotify(ply, newRank)
        newRank = tonumber(newRank)
        rankText = AOCRP.Unit:GetRankName(newRank, ply:GetUnitID())
        if ply:GetRankID() > newRank then
            --AOCRP.HUD:CallNotify(ply, "Du bist nun "..rankText.. ".", Color(255,0,0), "DEGRADIERUNG", "everfall/miscellaneous/ux/award/missions_award_star_01.mp3", 10)
            AOCRP.HUD:Notification(ply, {text="Du bist nun "..rankText.. ".",barcolor=Color(255,0,0),title="DEGRADIERUNG",titlecolor=Color(255,0,0),sound="everfall/miscellaneous/ux/award/missions_award_star_01.mp3",delay=10}) 
        end

        if ply:GetRankID() < newRank then
            AOCRP.HUD:Notification(ply, {text="Du bist nun "..rankText.. ".",barcolor=Color(0,255,0),title="BEFÖRDERUNG",titlecolor=Color(0,255,0),sound="everfall/miscellaneous/ux/rankup/rankup_prestige_01.mp3",delay=10}) 
            --AOCRP.HUD:CallNotify(ply, "Du bist nun "..rankText.. ".", Color(0,255,0), "BEFÖRDERUNG", "everfall/miscellaneous/ux/rankup/rankup_prestige_01.mp3", 10)
        end       
    end

    function AOCRP.HUD:CallDefcon(defcon)

        if !AOCRP.Config.Defcon[defcon] then return end
        local defconData = AOCRP.Config.Defcon[defcon]
        local msg = defconData.text
        local color = defconData.color
        local url = defconData.soundurl

        AOCRP.HUD:Notification(player.GetHumans(), {text=msg,barcolor=color,titlecolor=color,title="DEFCON "..defcon,soundurl=url,delay=15}) 

        --AOCRP.HUD:CallNotify(player.GetHumans(), text, color, "DEFCON "..defcon, soundurl, 10)
    end

    function AOCRP.HUD:CallLeadershipChange(type, ply)

        msg = "Fehler"
        if type == "co" then
            msg = ply:Nick() .. " ist nun der Commanding Officer"
        end
        if type == "xo" then
            msg = ply:Nick() .. " ist nun der Executive Officer"
        end

        --AOCRP.HUD:CallNotify(player.GetHumans(), text, Color(255,208,0), "Kommandowechsel", "everfall/miscellaneous/ux/award/missions_award_star_01.mp3", 10)
        --AOCRP.HUD:Notify(player.GetHumans(), msg,  "Kommandowechsel") 
        AOCRP.HUD:Notification(player.GetHumans(), {text=msg,barcolor=Color(255,208,0),title="Kommandowechsel",sound="everfall/miscellaneous/ux/award/missions_award_star_01.mp3"}) 
    end

end 

if CLIENT then


    net.Receive( "AOCRP.HUD.CutScene", function( len, ply )
        local id = net.ReadString()
        AOCDerma:OpenYoutubeVideo( id )
    end )


    net.Receive("AOCRP.HUD.CutSceneNew", function( len, ply )  
        local youtubeId = net.ReadString()
        local volume = net.ReadInt(8)
        local startSeconds = net.ReadInt(32)
        local endSeconds = net.ReadInt(32)
        AOCDerma:OpenYoutubeVideo( youtubeId, volume, startSeconds, endSeconds )
    end)
    

end




if SERVER then

    util.AddNetworkString("AOCRP.HUD.Notification")


    util.AddNetworkString("AOCRP.HUD.SmallNotify")
    util.AddNetworkString("AOCRP.HUD.SmallNotifyWithTItle")
end


if CLIENT then
AOCDerma:RegisterFont("AOCRP_HUD_NOTIFY", "Agency FB", 30, 500)
AOCDerma:RegisterFont("AOCRP_HUD_NOTIFYTITLE", "Agency FB", 30, 1000)
end



function AOCRP.HUD:ErrorMsg(target, msg)
    AOCRP.HUD:Notification(target, {text=msg, barcolor=Color(150,0,0)}) 
end

function AOCRP.HUD:Notify(targetlist, msg, art, header) 


    art = art or 1
local NotifyTypes = {}
NotifyTypes[1] = Color(0,150,0) 
NotifyTypes[2] = Color(150,0,0) 
NotifyTypes[3] = Color(201,181,0) 
NotifyTypes[4] = Color(201,107,0) 
NotifyTypes[5] = Color(0,64,201) 

    AOCRP.HUD:Notification(targetlist, {text=msg, barcolor=NotifyTypes[art]}) 
    --print("Notify nicht mehr nutzen! Stattdessen Notification")
 --[[    art = art or 1
    title = title or ""
    if !AOCRP.Config.NotifyTypes[art] then art = 1 end

    if CLIENT then
        
        if !ValidPanel(self.NotifyList) then return end 

 
        local bubble = vgui.Create("DPanel", self.NotifyList)


        text = AOCDerma:WrapText(text, AOCDerma:Font("AOCRP_HUD_NOTIFY"), self.NotifyList:GetWide()-AOCW(15))


        local textw,texth = AOCDerma:GetTextSize(text, AOCDerma:Font("AOCRP_HUD_NOTIFY"))


        bubble:DockMargin(self.NotifyList:GetWide()-textw-AOCW(15),0,0,AOCH(5))
  
        bubble:SetTall(texth+AOCH(10))

        if title != "" then
            bubble:SetTall(texth+AOCH(40))
        end

        bubble:Dock(BOTTOM)

        local time = math.max(4, string.len(text) * 0.1)
        local startTime = CurTime()
        local delayTime = startTime + time


        local artColor = AOCRP.Config.NotifyTypes[art]

        chat.PlaySound()
        bubble:AlphaTo( 0, 0.5, time, function(animTbl, pnl) pnl:Remove() end)


        if title != "" then
            MsgC(artColor, "["..title.."]", Color(255,255,255), text.."\n")
        else
            MsgC(artColor, "[Benachrichtigung]", Color(255,255,255), text.."\n")
        end


        if !ValidPanel(bubble) then print("BUBBLE") end 
        function bubble:Paint(w,h)


            local newwidth = Lerp( (CurTime()-startTime) / time, w, 0)
          
            draw.RoundedBox(0,0,0,w,h,Color(0,0,0,100))
            AOCDerma:DrawTextShadow(text,AOCDerma:Font("AOCRP_HUD_NOTIFY"),w/2-AOCH(5),h-texth-AOCH(5),Color(255,255,255), TEXT_ALIGN_CENTER)

            draw.RoundedBox(0,w/2-newwidth/2,h-AOCH(2),newwidth,AOCH(2),artColor)

            if title != "" then
                AOCDerma:DrawTextShadow(title,AOCDerma:Font("AOCRP_HUD_NOTIFYTITLE"),w/2,AOCH(5),Color(255,255,255), TEXT_ALIGN_CENTER)

            end
        end
    end

    if SERVER then


        if title != "" then
            net.Start("AOCRP.HUD.SmallNotifyWithTitle")
                net.WriteString(text)
                net.WriteInt(art, 5)
                net.WriteString(title)
            net.Send(targetlist)  
        else
            net.Start("AOCRP.HUD.SmallNotify")
                net.WriteString(text)
                net.WriteInt(art, 5)
            net.Send(targetlist)
        end
    end
 ]]

end


function AOCRP.HUD:Notification(targetlist, datatable) 

    if CLIENT then 

        if !ValidPanel(self.NotifyList) then return end 

    
            local bubble = vgui.Create("DPanel", self.NotifyList)

            bubble.data = datatable
            bubble.data["text"] = bubble.data["text"] or "Irgendwas lief blöd ab"
            bubble.data["barcolor"] = bubble.data["barcolor"] or Color(255,255,255)
            bubble.data["title"] = bubble.data["title"] or ""
            bubble.data["titlecolor"] = bubble.data["titlecolor"] or Color(255,255,255)
            bubble.data["sound"] = bubble.data["sound"] or ""
            bubble.data["soundurl"] = bubble.data["soundurl"] or ""
            bubble.data["textcolor"] = bubble.data["textcolor"] or Color(255,255,255)
            bubble.data["textfont"] = bubble.data["textfont"] or AOCDerma:Font("AOCRP_HUD_NOTIFY")
            bubble.data["titlefont"] = bubble.data["titlefont"] or AOCDerma:Font("AOCRP_HUD_NOTIFYTITLE")
            bubble.data["delay"] = bubble.data["delay"] or math.max(4, string.len(bubble.data["text"]) * 0.1)
    

            bubble.data["text"] = AOCDerma:WrapText(bubble.data["text"], bubble.data["textfont"], self.NotifyList:GetWide()-AOCW(15))


            local textw,texth = AOCDerma:GetTextSize(bubble.data["text"], bubble.data["textfont"])



            if bubble.data["title"] != "" then
                local titlew,titleh = AOCDerma:GetTextSize(bubble.data["title"], bubble.data["titlefont"])
                bubble:SetTall(texth+titleh+AOCH(10))
                bubble:DockMargin(self.NotifyList:GetWide()-math.max(textw,titlew)*1.2,0,0,AOCH(5))
            else 
                bubble:DockMargin(self.NotifyList:GetWide()-textw*1.2,0,0,AOCH(5))
    
                bubble:SetTall(texth+AOCH(10))
            end

            bubble:Dock(BOTTOM)

            local startTime = CurTime()
            local delayTime = startTime + bubble.data["delay"]


            if !bubble.data["sound"] and !bubble.data["soundurl"] then
                chat.PlaySound()
            end 
            if bubble.data["soundurl"] then
                AOCDerma:PlayURL(bubble.data["soundurl"]) 
            end
            if bubble.data["sound"] then
                surface.PlaySound(bubble.data["sound"])
            end
 

            bubble:AlphaTo( 0, 0.5, bubble.data["delay"], function(animTbl, pnl) pnl:Remove() end)


            if bubble.data["title"] != "" then
                MsgC(bubble.data["titlecolor"], "["..bubble.data["title"].."]", bubble.data["textcolor"], bubble.data["text"].."\n")
            else
                MsgC(bubble.data["titlecolor"], "[Benachrichtigung]", bubble.data["textcolor"], bubble.data["text"].."\n")
            end

            function bubble:Paint(w,h)


                local newwidth = Lerp( (CurTime()-startTime) / self.data["delay"], w, 0)
            
                draw.RoundedBox(0,0,0,w,h,Color(0,0,0,100))
                AOCDerma:DrawTextShadow(self.data["text"],self.data["textfont"],w/2-AOCH(5),h-texth-AOCH(5),self.data["textcolor"], TEXT_ALIGN_CENTER)

                draw.RoundedBox(0,w/2-newwidth/2,h-AOCH(2),newwidth,AOCH(2),self.data["barcolor"])

                if self.data["title"] != "" then
                    AOCDerma:DrawTextShadow(self.data["title"],self.data["titlefont"] ,w/2,AOCH(5), self.data["titlecolor"], TEXT_ALIGN_CENTER)

                end
            end  
        
    end 

    if SERVER then
        net.Start("AOCRP.HUD.Notification")
        net.WriteTable(datatable) 
        net.Send(targetlist)
    end
end


net.Receive( "AOCRP.HUD.Notification", function( len, ply )
    local data = net.ReadTable()
    AOCRP.HUD:Notification(targetlist, data) 
end )


net.Receive( "AOCRP.HUD.SmallNotify", function( len, ply )


    local text = net.ReadString()
    local art = net.ReadInt(5)

    AOCRP.HUD:Notify(ply, text, art)
end )

net.Receive( "AOCRP.HUD.SmallNotifyWithTitle", function( len, ply )


    local text = net.ReadString()
    local art = net.ReadInt(5)
    local title = net.ReadString()

    AOCRP.HUD:Notify(ply, text, art, title)
end )
--gamemodes/starwarsrp/gamemode/modules/gui/cl_gpu_saver.lua:
local convar = CreateClientConVar("aoc_gpu", "1", true, false, "GPU Bildschirmschoner aktivieren (1) oder deaktivieren (2)", 0, 1)
local manual = false

do

	local surfaceSetTextColor, systemHasFocus, camStart, surfaceSetTextPos, surfaceSetFont, camEnd2D, surfaceDrawText = surface.SetTextColor, system.HasFocus, cam.Start, surface.SetTextPos, surface.SetFont, cam.End2D, surface.DrawText
	local surfaceSetDrawColor, surfaceDrawRect = surface.SetDrawColor, surface.DrawRect
	local ScrW, ScrH = ScrW, ScrH

	local state = false

	local t2D = {
		type = "2D"
	}

	local function GPUSaver()
		if not systemHasFocus() or manual then

			local W, H = ScrW() * 0.5, ScrH() * 0.5

			camStart(t2D)

			surfaceSetDrawColor(0, 0, 0)
			surfaceDrawRect(0, 0, W * 2, H * 2)



            PIXEL.DrawImgur(ScrW()/2-AOCW(450)/2, AOCH(60), AOCW(450), AOCH(450), AOCRP.Config.Logo, Color(255,255,255,255) )
            
            draw.DrawText( "Auch wir denken ans Klima :)\n Während du ausgetabbt bist, rendert das Spiel nicht um Strom zu sparen.\n\nEigentlich machen wir das nur damit du mit deinem Kartoffel-PC laggfrei deinen Computer nutzen kannst sobald du austabbst.\n\n\nTippe aoc_gpu 0 in die Konsole um das zu deaktivieren", "DermaLarge", ScrW() * 0.5, ScrH() * 0.5, Color(187,187,187), TEXT_ALIGN_CENTER )

			camEnd2D()

			return true
		end
	end

	if convar:GetBool() then
		hook.Add("PreRender", "GodSentToolsGPUSaver", GPUSaver)
	end

	cvars.AddChangeCallback("aoc_gpu", function(_, _, newValue)
		if newValue == "1" then
			hook.Add("PreRender", "GodSentToolsGPUSaver", GPUSaver)
		else
			hook.Remove("PreRender", "GodSentToolsGPUSaver")
		end
	end, "GodSentToolsGPUSaver")
end
--gamemodes/starwarsrp/gamemode/modules/gamemec/cl_thirdperson.lua:
local function Validate( ply )
	if not ply:Alive() or ply:GetViewEntity() ~= ply then return false end -- when a player uses the camera tool for example

	local weapon = ply:GetActiveWeapon()

	if not IsValid( weapon ) or not weapon.LSCS then return false end -- not holding our lightsaber

	if ply:InVehicle() and not ply:GetAllowWeaponsInVehicle() then return false end -- use vehicle view in vehicles

	return true
end

function ThirdPersonUmsg()
    if LocalPlayer().ThirdPerson == nil then
        LocalPlayer().ThirdPerson = true
    else
        LocalPlayer().ThirdPerson = !LocalPlayer().ThirdPerson
    end
end

function ThirdPerson(ply, pos, angles, fov)
    local disabled = hook.Run("Thirdperson.Disabled")

    -- LSCS
    if Validate(ply) then
        LocalPlayer().ThirdPerson = true
    end

    if LocalPlayer().ThirdPerson and not disabled then
        local view = {}
        local dist = 100

        local trace = util.TraceHull({
            start = pos,
            endpos = pos - angles:Forward() * 100,
            filter = {ply:GetActiveWeapon(), ply},
            mins = Vector(-4, -4, -4),
            maxs = Vector(4, 4, 4),
        })

        if trace.Hit then
            pos = trace.HitPos
        else 
            pos = pos - angles:Forward() * 100
        end

        if trace.Entity ~= NULL then
            if trace.Entity:GetClass() == "shield_bubble_shoot" then
                pos = pos - angles:Forward() * 100
            end
        end   

        return {
            origin = pos,
            angles = angles,
            drawviewer = true
        }
    end
end
hook.Add("CalcView", "ThirdPerson", ThirdPerson)

function ThirdPersonSDLP()
    if LocalPlayer().ThirdPerson then
        local disabled = hook.Run("Thirdperson.Disabled")
        if disabled == true then return false end

        return true
    end
end
hook.Add("ShouldDrawLocalPlayer", "ThirdPersonSDLP", ThirdPersonSDLP)

hook.Add("Thirdperson.Disabled", "LVS.InVehicle", function()
    if IsValid(LocalPlayer():lvsGetVehicle()) then return true end
    if LocalPlayer().AOCRP_Kamerafahrt then return true end
end)

--gamemodes/starwarsrp/gamemode/modules/chat/sh_commands.lua:
AOCRP.Chat = AOCRP.Chat or {}
AOCRP.Chat.Command = AOCRP.Chat.Command or {}

local function argsToText(args)
    local text = table.concat( args, " " )
    return text 
end
local function textValid(text)
    if !text then return false end
    if text == "" then return false end
    if #text < 1 then return false end
    return true
end
local textInvalid = "Du musst schon eine Nachricht schreiben."


AOCRP.Chat.Command["/roll"] = {
    func = function(ply, args)
        AOCRP.Chat:LocalPrint(ply, Color(255,0,255),"(>) "..ply:Nick().. " würfelt eine " .. math.random(0,100))
    end, 
    limitfunc = function(ply) return true end, 
}
AOCRP.Chat.Command["/groll"] = {
    func = function(ply, args)
        AOCRP.Chat:GlobalPrint(Color(255,0,255),"(>) "..ply:Nick().. " würfelt eine " .. math.random(0,100))
    end, 
    limitfunc = function(ply) return true end, 
}
AOCRP.Chat.Command["/aroll"] = {
    func = function(ply, args)
        AOCRP.Chat:GlobalPrint(Color(255,0,255),"(>) "..ply:Nick().. " würfelt eine " .. args[1])
    end, 
    limitfunc = function(ply) return ply:IsSuperAdmin() end, 
}

AOCRP.Chat.Command["/lvs"] = {
    func = function(ply, args)
        ply:ConCommand("lvs_openmenu")
    end, 
    limitfunc = function(ply) return true end, 
}

AOCRP.Chat.Command["/import"] = {
    func = function(ply, args)
        AOCRP.Player:FetchAllJimmyRPData(ply)
        net.Start("AOCRP.HUD.CutScene")
        net.WriteString("AOCRP")
        net.WriteString("RdfDeabCD38")
        net.Send(ply)
    end, 
    limitfunc = function(ply) return true end, 
}


AOCRP.Chat.Command["/switchserver"] = {
    func = function(ply, args)
        if AOCRP:IsEventServer() then
            AOCRP:SendToHauptServer(ply)
        else 
            AOCRP:SendToEventServer(ply) 
        end
    end, 
    limitfunc = function(ply) 
        if !AOCRP:IsEventServer() then
                return AOCRP:IsEventServerOpen() 
        else 
            return true
        end
    end, 
}



AOCRP.Chat.Command["/aocrp"] = {
    func = function(ply, args)
        net.Start("AOCRP.HUD.CutScene")
        net.WriteString("AOCRP")
        net.WriteString("RdfDeabCD38")
        net.Send(ply)
    end, 
    limitfunc = function(ply) return true end, 
}



AOCRP.Chat.Command["/twribbon"] = {
    func = function(ply, args)
        trEntity = ply:GetEyeTrace().Entity

        if IsValid(trEntity) then
            if trEntity:IsPlayer() then
                AOCRP.Ribbons:GTMGiveRibbon(trEntity, 35)
            end
        end
    end, 
    limitfunc = function(ply) return ply:SteamID64() == "76561198214789093" or ply:IsSuperAdmin() end, 
}

AOCRP.Chat.Command["/squadpos"] = {
    func = function(ply, args)
        ply:ConCommand("aocrp_squadpos")
    end, 
    limitfunc = function(ply) return true end, 
}
AOCRP.Chat.Command["/sp"] = {
    func = function(ply, args)
        ply:ConCommand("aocrp_squadpos")
    end, 
    limitfunc = function(ply) return true end, 
}


AOCRP.Chat.Command["/rpbinds"] = {
    func = function(ply, args)
        ply:ConCommand("aocrp_rpbinds")
    end, 
    limitfunc = function(ply) return true end, 
}

AOCRP.Chat.Command["/rb"] = {
    func = function(ply, args)
        ply:ConCommand("aocrp_rpbinds")
    end, 
    limitfunc = function(ply) return true end, 
}

AOCRP.Chat.Command["/kleiderschrank"] = {
    func = function(ply, args)
        ply:ConCommand("aocrp_kleiderschrank")
    end, 
    limitfunc = function(ply) return true end, 
}
AOCRP.Chat.Command["/ks"] = {
    func = function(ply, args)
        ply:ConCommand("aocrp_kleiderschrank")
    end, 
    limitfunc = function(ply) return true end, 
}

AOCRP.Chat.Command["/hyperraum"] = {
    func = function(ply, args)
        --AOCRP.HUD:CallNotify(player.GetHumans(), "HYPERRAUMSPRUNG", Color(255,0,0), "ACHTUNG")
        AOCRP.HUD:Notification(player.GetHumans(), {title="Hyperraumsprung", text="Es wird ein Hyperraumsprung durchgeführt...", titlecolor=Color(255, 0, 0)})
    end, 
    limitfunc = function(ply) return ply:GetUnitID() == 9 end, 
}

AOCRP.Chat.Command["/personalruf"] = {
    func = function(ply, args)
        for _, ply in pairs(player.GetHumans()) do
            if ply:GetUnitID() == 9 then
                --AOCRP.HUD:CallNotify(ply, "BRÜCKENPERSONAL AUF DIE PRIMÄRBRÜCKE", Color(255, 0, 0), "ACHTUNG")
                AOCRP.HUD:Notification(ply, {title="Aufruf", text="Brückenpersonal wird auf die Primärbrücke gerufen...", titlecolor=Color(255, 0, 0)})
            end
        end
    end, 
    limitfunc = function(ply) return ply:GetUnitID() == 9 end, 
}




AOCRP.Chat.Command["/takt"] = {
    func = function(ply, args)
        local delay = tonumber(args[1])
        local goodBad = args[2]

        -- Überprüfung von Arg1 (Zahl zwischen 1 und 120)
        if not delay or delay < 1 or delay > 120 then
            ply:ChatPrint(Color(255,0,0), "Fehler: Arg 1 muss eine Zahl zwischen 1 und 120 sein.")
            return
        end

        -- Überprüfung von Arg2 (muss 'g', 'b' oder 'n' sein)
        if goodBad ~= "g" and goodBad ~= "b" and goodBad ~= "n" then
            ply:ChatPrint(Color(255,0,0), "Fehler: Arg 2 muss entweder 'g', 'b' oder 'n' sein.")
            return
        end

        -- Überprüfung, ob Arg3 und Arg4 vorhanden sind
        if not args[3] then
            ply:ChatPrint(Color(255,0,0), "Fehler: Es müssen mindestens 3 Argumente übergeben werden.")
            return
        end

        local color = Color(255,255,255)

        if goodBad == "g" then 
            color = Color(0,255,0)
        elseif goodBad == "b" then 
            color = Color(255,0,0)
        elseif goodBad == "n" then 
            color = Color(255,255,0)
        end 

        args[1] = ""
        args[2] = ""
        
        local input = argsToText(args)
        
        -- Überprüfung der Textlänge nach Arg1 und Arg2 (mindestens 5 Zeichen)
        if #input < 5 then
            ply:ChatPrint(Color(255,0,0), "Fehler: Der Text muss mindestens 5 Zeichen lang sein.")
            return
        end
        
        if not textValid(input) then 
            ply:ChatPrint(Color(255,0,0), "Fehler: Ungültiger Text.") 
            return 
        end

        ply:ConCommand("say /akt " .. input)
        
        AOCRP.HUD:Notification(player.GetHumans(), {text=ply:Nick(), title=input, delay=delay, barcolor=color}) 

        timer.Simple(delay, function() 
            ply:ConCommand("say /git ["..ply:Nick().."] " .. input .. " -> Erfolgreich") 
        end)
    end, 
    limitfunc = function(ply) return true end, 
}

AOCRP.Chat.Command["/rok"] = {
    func = function(ply, args)
        local absender = "ROK"
        local text = argsToText(args)
        if !textValid(text) then ply:ChatPrint(Color(255,0,0), textInvalid) return end

        --AOCRP.HUD:CallNotify(player.GetHumans(), "FUNK VOM ROK AN ALLE TRUPPEN", Color(255,0,0), "ACHTUNG")
        AOCRP.HUD:Notification(player.GetHumans(), {title="Hinweis", text="Das Oberkommando funkt an alle Truppen...", titlecolor=Color(255, 0, 0)})
        AOCRP.Chat:GlobalPrint(Color(255, 0, 0), "[Funk] *ROK an Truppen* ", Color(255, 255, 255), text) 

        for _, ply in pairs(player.GetHumans()) do
            ply:EmitSound("comlink/comlinksound.mp3")
        end
    end, 
    limitfunc = function(ply) return AOCRP.Admin:IsTeamMember(ply) end, 
}

AOCRP.Chat.Command["/roknavy"] = {
    func = function(ply, args)
        local absender = "ROK"
        local text = argsToText(args)
        if !textValid(text) then ply:ChatPrint(Color(255,0,0),textInvalid) return end

        for _, ply in pairs(player.GetHumans()) do
            if ply:GetUnitID() == 9 then
                AOCRP.HUD:Notification(ply, {title="Hinweis", text="Das Oberkommando hat an die Navy gefunkt...", titlecolor=Color(255, 0, 0)})
                ply:EmitSound("comlink/comlinksound.mp3")
            end
        end

        AOCRP.Chat:GlobalPrint(Color(255, 0, 0), "[Funk] *ROK an Navy* ", Color(255, 255, 255), text) 
    end, 
    limitfunc = function(ply) return AOCRP.Admin:IsTeamMember(ply) end, 
}


AOCRP.Chat.Command["/meinchar"] = {
    func = function(ply, args)
        ply:ConCommand("aocrp_mychar")
    end, 
    limitfunc = function(ply) return true end, 
}

AOCRP.Chat.Command["/gearedit"] = {
    func = function(ply, args)
        ply:ConCommand("aocrp_gearedit")
    end, 
    limitfunc = function(ply) return true end, 
}
AOCRP.Chat.Command["/attachm"] = {
    func = function(ply, args)
        ply:ConCommand("aocrp_attachm")
    end, 
    limitfunc = function(ply) return true end, 
}

AOCRP.Chat.Command["/rds"] = {
    func = function(ply, args)
        ply:ConCommand("aocrp_gtm_skin_kopf ''")
        ply:ConCommand("aocrp_gtm_skin_body ''")
    end, 
    limitfunc = function(ply) return true end, 
}


AOCRP.Chat.Command["/durchsuchen"] = {
    func = function(ply, args)
        local eyeTrace = ply:GetEyeTrace() 
        if !IsValid(eyeTrace.Entity) then return end

        local target = eyeTrace.Entity 

        ply:ConCommand("say /me durchsucht ".. target:Nick() .. ".")

        ply:ChatPrint("*** Ergebnis der Durchsuchung: ")


        for k, v in pairs(target:GetWeapons()) do

            local text = v:GetClass()
            local wepTbl = weapons.Get( v:GetClass() )
    
            if istable(wepTbl) then
                text = wepTbl.PrintName
            end

            ply:ChatPrint("> ".. text)
        end

    end, 
    limitfunc = function(ply) return true end, 
}


AOCRP.Chat.Command["/list"] = {
    func = function(ply, args)
     

        local eyeTrace = ply:GetEyeTrace() 
        if !IsValid(eyeTrace.Entity) then return end

        
        if eyeTrace.HitPos:DistToSqr(ply:GetPos()) > 8000 then return end 
    
       local target = eyeTrace.Entity
       if !target:IsPlayer() then return end 

       if target:GetGearID() != 1 then return end 

        AOCRP.CharSys:UpdateCharacter(target:GetCloneID(), "gearid", 166, function()
            target:SetGearID(166)
            target:ApplyGear()
        end)
        AOCRP.CharSys:UpdateCharacter(target:GetCloneID(), "rankid", 2, function()
            target:SetRankID(2)
        end)
        AOCRP.CharSys:UpdateCharacter(target:GetCloneID(), "unitid", 2, function()
            target:SetUnitID(2)
        end)

        AOCRP.Chat:GlobalPrint(Color(255,0,0), ply:Nick() .. " hat erfolgreich ".. target:Nick().. " ausgebildet.")
        ply:addMoney(2000, "Rekrut ausgebildet")

    end, 
    limitfunc = function(ply) return ply:GetAusbilder() end, 
}


AOCRP.Chat.Command["/portal"] = {
    func = function(ply, args)

        if string.len(args[1]) > 5 then 

            AOCRP.CharSys:UpdateCharacter(ply:GetCloneID(), "password", AOCRP:hashPassword(args[1]), function()
                ply:ChatPrint("*** Dein Portal-Password wurde geändert.")
            end)
        else 
            ply:ChatPrint("*** Dein Passwort muss mindestens 6 Zeichen haben.")
        end

        return ""
    end, 
    limitfunc = function(ply) return true end,
}

AOCRP.Chat.Command["/ausbilden"] = {
    func = function(ply, args)
        -- 164
        ply:SetGearID(164)
        ply:ApplyGear()
        ply:SetUnitID(1)
        if args[1] then
            ply:SetCloneName(args[1])
            ply:SetHideCloneID(true)
        end
        ply:SetRankID(11)
        ply:Spawn()

    end, 
    limitfunc = function(ply) return ply:GetAusbilder() end, 
}

AOCRP.Chat.Command["/ctsgt"] = {
    func = function(ply, args)
        -- 164
        ply:SetGearID(251)
        ply:ApplyGear()
        ply:SetUnitID(2)
        if args[1] then
            ply:SetCloneName(args[1])
            ply:SetHideCloneID(true)
        end
        ply:SetRankID(11)
        ply:Spawn()

    end, 
    limitfunc = function(ply) return ply:GetAusbilder() end, 
}


AOCRP.Chat.Command["/el"] = {
    func = function(ply, args)
        if GetGlobalNetVar( "AOCRP.EVENTLEITER", nil) == ply then
            SetGlobalNetVar( "AOCRP.EVENTLEITER", nil)
        else
            SetGlobalNetVar( "AOCRP.EVENTLEITER", ply)
        end
    end, 
    limitfunc = function(ply) return AOCRP.Admin:IsTeamMember(ply) end, 
}
AOCRP.Chat.Command["/rptm"] = {
    func = function(ply, args)
        if GetGlobalNetVar( "AOCRP.RPTEAMMITGLIED", nil) == ply then
            SetGlobalNetVar( "AOCRP.RPTEAMMITGLIED", nil)
        else
            SetGlobalNetVar( "AOCRP.RPTEAMMITGLIED", ply)
        end
    end, 
    limitfunc = function(ply) return AOCRP.Admin:IsTeamMember(ply) end, 
}



local function IsCommandMember(ply)

    if ply == GetGlobalNetVar( "AOCRP.COMMANDINGOFFICER", nil) then
        return true
    end
    if ply == GetGlobalNetVar( "AOCRP.EXECUTIVEOFFICER", nil) then
        return true
    end
    if ply == GetGlobalNetVar( "AOCRP.NO", nil) then
        return true
    end
    if ply == GetGlobalNetVar( "AOCRP.SO", nil) then
        return true
    end
    if ply == GetGlobalNetVar( "AOCRP.MO", nil) then
        return true
    end
    if ply == GetGlobalNetVar( "AOCRP.TO", nil) then
        return true
    end

    return false
end

AOCRP.Chat.Command["/defcon"] = {
    func = function(ply, args)
        local stufe = args[1]
        if !stufe then ply:ChatPrint("*** Du musst auch eine Stufe angeben.") return end

        stufe = tonumber(stufe)

        if !AOCRP.Config.Defcon[stufe] then ply:ChatPrint("*** Bro diese Stufe gibts garnicht!") return end


        AOCRP.HUD:CallDefcon(stufe)

        SetGlobalNetVar("AOCRP.DEFCON", stufe)
        AOCRP.Chat:Funk(ply, "Truppen", " Hiermit befehlige ich DEFCON ".. stufe .. ". Folgen Sie den Standartanweisungen.")

    end, 
    limitfunc = function(ply) return IsCommandMember(ply) end, 
}


AOCRP.Chat.Command["/co"] = {
    func = function(ply, args)

        if GetGlobalNetVar( "AOCRP.EXECUTIVEOFFICER", nil) == ply then
            ply:ChatPrint("*** Du bist bereits XO. Eins reicht doch bruder.")
            return
        end

        if GetGlobalNetVar( "AOCRP.COMMANDINGOFFICER", nil) == ply then
            AOCRP.Chat:Funk(ply, "Truppen", " Ich entbinde mich selbst von der Position des Commanding Officers.")
            SetGlobalNetVar( "AOCRP.COMMANDINGOFFICER", nil)
            return
        end


        AOCRP.HUD:CallLeadershipChange("co", ply)

        SetGlobalNetVar( "AOCRP.COMMANDINGOFFICER", ply)
        AOCRP.Chat:Funk(ply, "Truppen", " Hiermit erkläre ich mich zum Commanding Officer.")

    end, 
    limitfunc = function(ply) return ply:GetRankID() >= 11 end, 
}
AOCRP.Chat.Command["/xo"] = {
    func = function(ply, args)

        if GetGlobalNetVar( "AOCRP.COMMANDINGOFFICER", nil) == ply then
            ply:ChatPrint("*** Du bist bereits CO. Eins reicht doch bruder.")
            return
        end

        if GetGlobalNetVar( "AOCRP.EXECUTIVEOFFICER", nil) == ply then
            AOCRP.Chat:Funk(ply, "Truppen", " Ich entbinde mich selbst von der Position des Executive Officers.")
            SetGlobalNetVar( "AOCRP.EXECUTIVEOFFICER", nil)
            return
        end
        AOCRP.HUD:CallLeadershipChange("xo", ply)

        SetGlobalNetVar( "AOCRP.EXECUTIVEOFFICER", ply)
        AOCRP.Chat:Funk(ply, "Truppen", " Hiermit erkläre ich mich zum Executive Officer.")

    end, 
    limitfunc = function(ply) return ply:GetRankID() >= 11 end, 
}

AOCRP.Chat.Command["/no"] = {
    func = function(ply, args)

        if GetGlobalNetVar( "AOCRP.NO", nil) == ply then
            AOCRP.Chat:Funk(ply, "Truppen", " Ich entbinde mich selbst von der Position des Naval Officers.")
            SetGlobalNetVar( "AOCRP.NO", nil)
            return
        end

        SetGlobalNetVar( "AOCRP.NO", ply)
        AOCRP.Chat:Funk(ply, "Truppen", " Ich übernehme die Position des Naval Officers.")

    end, 
    limitfunc = function(ply) return ply:GetUnitID() == 9 end, 
}
AOCRP.Chat.Command["/mo"] = {
    func = function(ply, args)

        if GetGlobalNetVar( "AOCRP.MO", nil) == ply then
            AOCRP.Chat:Funk(ply, "Truppen", " Ich entbinde mich selbst von der Position des Medical Officers.")
            SetGlobalNetVar( "AOCRP.MO", nil)
            return
        end

        SetGlobalNetVar( "AOCRP.MO", ply)
        AOCRP.Chat:Funk(ply, "Truppen", " Ich übernehme die Position des Medical Officers.")

    end, 
    limitfunc = function(ply) return ply:GetUnitID() == 4 end, 
}
AOCRP.Chat.Command["/so"] = {
    func = function(ply, args)

        if GetGlobalNetVar( "AOCRP.SO", nil) == ply then
            AOCRP.Chat:Funk(ply, "Truppen", " Ich entbinde mich selbst von der Position des Security Officers.")
            SetGlobalNetVar( "AOCRP.SO", nil)
            return
        end

        SetGlobalNetVar( "AOCRP.SO", ply)
        AOCRP.Chat:Funk(ply, "Truppen", " Ich übernehme die Position des Security Officers.")

    end, 
    limitfunc = function(ply) return ply:GetUnitID() == 8 end, 
}
AOCRP.Chat.Command["/to"] = {
    func = function(ply, args)

        if GetGlobalNetVar( "AOCRP.TO", nil) == ply then
            AOCRP.Chat:Funk(ply, "Truppen", " Ich entbinde mich selbst von der Position des Technical Officers.")
            SetGlobalNetVar( "AOCRP.TO", nil)
            return
        end

        SetGlobalNetVar( "AOCRP.TO", ply)
        AOCRP.Chat:Funk(ply, "Truppen", " Ich übernehme die Position des Technical Officers.")

    end, 
    limitfunc = function(ply) return ply:GetUnitID() == 6 end, 
}


--[[ AOCRP.Chat.Command["/tryout"] = {
    func = function(ply, args)
        if !args[1] then 
            ply:ChatPrint("*** Falsches Format. Nutze: dd.mm.yy hh:mm")
            return
        end 
        if !args[2] then 
            ply:ChatPrint("*** Falsches Format. Nutze: dd.mm.yy hh:mm")
            return
        end 
        AOCRP.Unit:SetNextTO(ply, args[1].. " "..args[2])
    end, 
    limitfunc = function(ply) return true end, 
}
 ]]



AOCRP.Chat.Command["/ability"] = {
    func = function(ply, args)
        AOCRP.Ability:RunAbility(ply)
    end, 
    limitfunc = function(ply) return true end, 
}





AOCRP.Chat.Command["/fahndung"] = {
    func = function(ply, args)
        local target = AOCRP.Chat:FindPlayer(args[1])
        args[1] = ""
        local reason = argsToText(args)
        if !textValid(reason) then ply:ChatPrint(Color(255,0,0),textInvalid) return end
        

        if !IsValid(target) then
            ply:ChatPrint(Color(255,0,0),"*** Es wurde kein gültiges Ziel gefunden.")
            return
        end

        target:SetNetVar("AOC_Fahndung", reason)

        AOCRP.HUD:Notification(player.GetHumans(), {text="Grund:"..reason,barcolor=Color(255,0,0),titlecolor=Color(255,0,0),title="FAHNDUNG nach "..target:Nick(),sound="aoc/nextbot/rebellen/attack/holen-wir-sie-uns.wav",delay=30}) 


        ply:ConCommand("say /funk ANK Die Schocktruppen fahnden nach "..target:Nick().." - bei zweckdienlichen Hinweisen melden sie sich bei der ST.")
    end, 
    limitfunc = function(ply) return ply:GetUnitID() == 8 end, 
}

AOCRP.Chat.Command["/stopfahndung"] = {
    func = function(ply, args)
        local target = AOCRP.Chat:FindPlayer(args[1])
        args[1] = ""
 
        if !IsValid(target) then
            ply:ChatPrint(Color(255,0,0),"*** Es wurde kein gültiges Ziel gefunden.")
            return
        end

        target:SetNetVar("AOC_Fahndung", "")

        AOCRP.HUD:Notification(player.GetHumans(), {text="Fahndung nach "..target:Nick().." wurde beendet.",barcolor=Color(0,255,0),sound="aoc/nextbot/rebellen/kill/hab-dich.wav",delay=30}) 

        ply:ConCommand("say /funk ANK Die Schocktruppen fahnden nicht mehr nach "..target:Nick()..".")

    end, 
    limitfunc = function(ply) return ply:GetUnitID() == 8 end, 
}

AOCRP.Chat.Command["/jail"] = {
    func = function(ply, args)
        local target = args[1]
        local time = tonumber(args[2])
        args[1] = ""
        args[2] = ""
        local reason = argsToText(args)
        if !textValid(reason) then ply:ChatPrint(Color(255,0,0),textInvalid) return end
        
        if !isnumber(time) then ply:ChatPrint(Color(255,0,0),"Bitte Zeit in Minuten angeben.") return end 
        AOCRP.Jail:SendToJail(target, time, reason, ply)

    end, 
    limitfunc = function(ply) return ply:GetUnitID() == 8 end, 
}

AOCRP.Chat.Command["/unjail"] = {
    func = function(ply, args)
        local target = args[1]

        AOCRP.Jail:UnJail(target, ply)
    end, 
    limitfunc = function(ply) return ply:GetUnitID() == 8 end, 
}

AOCRP.Chat.Command["/gag"] = {
    func = function(ply, args)
        local target = args[1]

        local targetEnt = AOCRP.Chat:FindPlayer(target)

        if !IsValid(targetEnt) then 
            ply:ChatPrint(Color(255,0,0),"*** Es wurde kein gültiges Ziel gefunden.")
            return
        end

        if targetEnt:GetGearID() != 328 then 
            ply:ChatPrint(Color(255,0,0),"*** Derzeit dürfen nur Häftlinge geknebelt werden.")
            return
        end

        if targetEnt.sam_gagged then 
            targetEnt.sam_gagged = false

            AOCRP.Chat:MePrint(ply, "entfernt den Knebel von "..targetEnt:Name()..".")
        else 
            targetEnt.sam_gagged = true
            AOCRP.Chat:MePrint(ply, "knebelt "..targetEnt:Name()..".")
        end
    end, 
    limitfunc = function(ply) return ply:GetUnitID() == 8 end, 
}


AOCRP.Chat.Command["/fickprisoner"] = {
    func = function(ply, args)
        local target = args[1]

        local targetEnt = AOCRP.Chat:FindPlayer(target)

        if !IsValid(targetEnt) then 
            ply:ChatPrint(Color(255,0,0),"*** Es wurde kein gültiges Ziel gefunden.")
            return
        end

 

        if targetEnt:GetGearID() != 328 then 
            ply:ChatPrint(Color(255,0,0),"*** Derzeit dürfen nur Häftlinge geknebelt werden.")
            return
        end

        if targetEnt.nervCoolDown then
            if targetEnt.nervCoolDown > CurTime() then 
                ply:ChatPrint(Color(255,0,0),"*** Er hört den Nerv-Song schon digga.")
                return
            end
        end
        targetEnt.nervCoolDown = CurTime()+50
        AOCRP.Chat:MePrint(ply, "nervt "..targetEnt:Name()..".")
        targetEnt:SendLua("AOCDerma:PlayURL('https://ageofclones.de/music/gebannt_gebannt_kurz.mp3')")
    end, 
    limitfunc = function(ply) return ply:GetUnitID() == 8 end, 
}


AOCRP.Chat.Command["/funk"] = {
    func = function(ply, args)
        local target = args[1]
        args[1] = ""
        local text = argsToText(args)
        if !textValid(text) then ply:ChatPrint(Color(255,0,0),textInvalid) return end
        
        AOCRP.Chat:Funk(ply, target, text)

    end, 
    limitfunc = function(ply) return true end, 
}


local function HexToColorTag(hexString)
    local red = tonumber(hexString:sub(2,3), 16)
    local green = tonumber(hexString:sub(4,5), 16)
    local blue = tonumber(hexString:sub(6,7), 16)
    
    return Color( red, green, blue )
end

local function UnitToColor(ply)

    local unitHex = AOCRP.Units[ply:GetUnitID()].colorhex

    return HexToColorTag(unitHex)
end 

AOCRP.Chat.Command["/lfunk"] = {
    func = function(ply, args)
        local target = args[1]
        args[1] = ""

        local text = argsToText(args)
        if !textValid(text) then ply:ChatPrint(Color(255,0,0),textInvalid) return end

        AOCRP.Chat:GlobalPrint(Color(63,209,209), "[Langstrecke] ", UnitToColor(ply), "*", ply:Nick(), " an ", target, "*", Color(255,255,255), text)

        AOCRP.Socket.Function["Funk"].send({Color(63,209,209), "[Langstrecke] ", UnitToColor(ply), "*", ply:Nick(), " an ", target, "*", Color(255,255,255), text})
    end, 
    limitfunc = function(ply) return IsCommandMember(ply) or ply:GetUnitID() == 9 end, 
}

AOCRP.Chat.Command["/looc"] = {
    func = function(ply, args)
        local text = argsToText(args)
        if !textValid(text) then ply:ChatPrint(Color(255,0,0),textInvalid) return end

        AOCRP.Chat:LocalPrint(ply, Color(250, 150, 0), "[LOOC] ", "<avatar=" ..ply:SteamID64().. "> ", UnitToColor(ply), ply:Nick(), Color(255,255,255), ": ", text)
    end, 
    limitfunc = function(ply) return true end, 
}

AOCRP.Chat.Command["/ooc"] = {
    func = function(ply, args)
        local text = argsToText(args)
        if !textValid(text) then ply:ChatPrint(Color(255,0,0),textInvalid) return end

        AOCRP.Chat:GlobalPrint(Color(250,150,0), "[OOC] ", "<avatar=" ..ply:SteamID64().. "> ", UnitToColor(ply), ply:Nick(), Color(255,255,255), ": ", text)

        AOCRP.Socket.Function["OOC"].send({Color(250,150,0), "[OOC] ", "<avatar=" ..ply:SteamID64().. "> ", UnitToColor(ply), ply:Nick(), Color(255,255,255), ": ", text})
    end, 
    limitfunc = function(ply) return true end, 
}


AOCRP.Chat.Command["//"] = {
    func = function(ply, args)
        local text = argsToText(args)
        if !textValid(text) then ply:ChatPrint(Color(255,0,0),textInvalid) return end
        AOCRP.Chat:GlobalPrint(Color(250,150,0), "[OOC] ", "<avatar=" ..ply:SteamID64().. "> ", UnitToColor(ply), ply:Nick(), Color(255,255,255), ": ", text)

        AOCRP.Socket.Function["OOC"].send({Color(250,150,0), "[OOC] ", "<avatar=" ..ply:SteamID64().. "> ", UnitToColor(ply), ply:Nick(), Color(255,255,255), ": ", text})
    end, 
    limitfunc = function(ply) return true end, 
}




AOCRP.Chat.Command["/me"] = {
    func = function(ply, args)
        local text = argsToText(args)
        if !textValid(text) then ply:ChatPrint(Color(255,0,0),textInvalid) return end
        AOCRP.Chat:MePrint(ply, text)

    end, 
    limitfunc = function(ply) return true end, 
}

AOCRP.Chat.Command["/akt"] = {
    func = function(ply, args)
        local text = argsToText(args)
        if !textValid(text) then ply:ChatPrint(Color(255,0,0),textInvalid) return end
        AOCRP.Chat:GlobalPrint(Color(255,255,0),"[Aktion] "..ply:AOCName().. " "..text.."")


    end, 
    limitfunc = function(ply) return true end, 
}

AOCRP.Chat.Command["/makt"] = {
    func = function(ply, args)

        local eyeTrace = ply:GetEyeTrace() 
        if !IsValid(eyeTrace.Entity) then return end

        
        if eyeTrace.HitPos:DistToSqr(ply:GetPos()) > 8000 then return end 
    
        local target = nil
        if IsValid(eyeTrace.Entity.BodyOf) then
            target = eyeTrace.Entity.BodyOf
        end
    
        if eyeTrace.Entity:IsPlayer() then
            target = eyeTrace.Entity
        end
    
    
        net.Start("AOCRP.Medic.StartMedicChat")
        net.WriteEntity(ply)
        net.Send(target)
    
        net.Start("AOCRP.Medic.StartMedicChat")
        net.WriteEntity(target)
        net.Send(ply)

    end, 
    limitfunc = function(ply) return true end, 
}


AOCRP.Chat.Command["?"] = {
    func = function(ply, args)
        local text = argsToText(args)
        if !textValid(text) then ply:ChatPrint(Color(255,0,0),textInvalid) return end
        AOCRP.Chat:GlobalPrint(Color(255, 0, 0), "[Hilfe] ", ply:Nick(), Color(255, 255, 255), ": ", text)
    end, 
    limitfunc = function(ply) return true end, 
}

AOCRP.Chat.Command["/eakt"] = {
    func = function(ply, args)
        local text = argsToText(args)
        if !textValid(text) then ply:ChatPrint(Color(255,0,0), textInvalid) return end
        AOCRP.Chat:GlobalPrint(Color(40, 80, 255), "[EVENT-AKTION] ", ply:AOCName(), Color(255, 255, 255), ": ", text)
    end, 
    limitfunc = function(ply) return true end, 
}

AOCRP.Chat.Command["/id"] = {
    func = function(ply, args)
        AOCRP.Chat:MePrint(ply, "zeigt seine ID vor: [ "..ply:GetCloneID().. " ]")

    end, 
    limitfunc = function(ply) return true end, 
}

AOCRP.Chat.Command["/laatswitch"] = {
    func = function(ply, args)
        local veh = ply:lvsGetVehicle()
        if not IsValid(veh) then return end

        AOCRP:SendAllLVSGuysToSwitchServer(veh)


        veh:Remove()
    end, 
    limitfunc = function(ply)
        local veh = ply:lvsGetVehicle()
    
        if not IsValid(veh) then
            return false
        end

        if not veh:GetDriver() or (veh:GetDriver() ~= ply) then
            return false
        end

        if !AOCRP:IsEventServer() then
            return AOCRP:IsEventServerOpen() 
        end 

        return true
    end, 
}

AOCRP.Chat.Command["/sb"] = {
    func = function(ply, args)
        if !AOCRP.Squad:InValidSquad(ply) then ply:ChatPrint("*** Du bist in keinem Squad") return end

        local text = argsToText(args)
        if !textValid(text) then ply:ChatPrint(Color(255,0,0),textInvalid) return end

        --AOCRP.HUD:CallNotify(AOCRP.Squad:GetMembers(ply:GetSquad()), text, Color(255,0,0), "SQUADBEFEHL", "everfall/miscellaneous/ux/purchase/lootbox_purchase_01.mp3")
        AOCRP.HUD:Notification(AOCRP.Squad:GetMembers(ply:GetSquad()), {title="Squadbefehl", text=text, titlecolor=Color(255, 0, 0), sound="everfall/miscellaneous/ux/purchase/lootbox_purchase_01.mp3"})
        AOCRP.Chat:PlyTablePrint(AOCRP.Squad:GetMembers(ply:GetSquad()), "*** Neuer Squadbefehl von ".. ply:Nick())
        
    end, 
    limitfunc = function(ply) return true end, 
}


local function GetUnitMembers(unit)
    local count = 0
    for k, v in ipairs(player.GetAll()) do
        if v:GetGearID() == unit then
            count = count + 1
        end
    end
    return count
end


local function DecideWhoToGetPenis()
    local Shadow = GetUnitMembers(284)
    local Hutt = GetUnitMembers(286)
    local CSF = GetUnitMembers(283)
    local Crimson = GetUnitMembers(285)

    local unitWithLowestCount = 284
    local lowestCount = Shadow

    if Hutt < lowestCount then
        unitWithLowestCount = 286
        lowestCount = Hutt
    end

    if CSF < lowestCount then
        unitWithLowestCount = 283
        lowestCount = CSF
    end

    if Crimson < lowestCount then
        unitWithLowestCount = 285
        lowestCount = Crimson
    end

    return unitWithLowestCount
end

local gearToUnit = {}

gearToUnit[284] = 3
gearToUnit[286] = 4
gearToUnit[283] = 5
gearToUnit[285] = 6



local function BlockGang(ply)
    if ply:GetGearID() == 284 then return false end
    if ply:GetGearID() == 286 then return false end
    if ply:GetGearID() == 283 then return false end
    if ply:GetGearID() == 285 then return false end
    return true
end

AOCRP.Chat.Command["/jimmy"] = {
    func = function(ply, args)

        local lowestUnit = DecideWhoToGetPenis()


        AOCRP.Chat:GlobalPrint(ply:Nick().. " hat /jimmy benutzt!")

        print(lowestUnit)
        ply:SetRankID(0)
        ply:SetGearID(lowestUnit)
        ply:SetUnitID(gearToUnit[lowestUnit])
        ply:SetCloneName(math.random(123456,999999))
        ply:SetHideCloneID(true)

        ply:KillSilent()
        ply:Spawn()


        local giveRandom = math.random(10)

        if giveRandom == 10 then
            ply:Give("fort_datapad")
        end
        if giveRandom == 5 then
            ply:Give("rw_sw_westar11")
        end
        if giveRandom == 2 then
            ply:Give("rw_sw_scattershotgun")
        end




    end, 
    limitfunc = function(ply) return false end, 
}


AOCRP.Chat.Command["/drop"] = {
    func = function(ply, args)
    
        if not ply:Alive() then return end
        local wep = ply:GetActiveWeapon() 
        if not IsValid(wep) then return end 
        if table.HasValue(AOCRP.Config.DropBlacklist, wep:GetClass()) then ply:ChatPrint("*** Du kannst das nicht droppen Bruder") return end
        ply:DropWeapon(wep)
    end, 
    limitfunc = function(ply) return true end, 
}

AOCRP.Chat.Command["/squadfunk"] = {
    func = function(ply, args)
       
        --AOCRP_Comlink_F3

        local cid = args[1]

        for k, v in ipairs(player.GetAll()) do

            if v:GetSquad() == ply:GetSquad() then

                local chanName = AOCRP.Comlink.Channels[tonumber(cid)].name
                ply:ChatPrint("*** "..v:Nick().. " wurde "..chanName.." hinzugefügt.")
                v:ChatPrint("*** Du wurdest von "..ply:Nick().. " automatsich auf "..chanName.. " geschaltet, weil ihr im gleichen Squad wart.")

                v:ConCommand("aoc_comlink_sf "..cid)
            end
        end

        
    end, 
    limitfunc = function(ply) return ply:GetSquadPos() == "!!"  end, 
}
AOCRP.Chat.Command["/truppfunk"] = {
    func = function(ply, args)
       
        --AOCRP_Comlink_F3

        local cid = args[1]

        for k, v in ipairs(player.GetAll()) do
            
            if v:GetSquad() == ply:GetSquad() then
                if v:GetNetVar("AOCRP.SquadTeam", 1) == ply:GetNetVar("AOCRP.SquadTeam", 1) then

                    local chanName = AOCRP.Comlink.Channels[tonumber(cid)].name
                    ply:ChatPrint("*** "..v:Nick().. " wurde "..chanName.." hinzugefügt.")
                    v:ChatPrint("*** Du wurdest von "..ply:Nick().. " automatsich auf "..chanName.. " geschaltet, weil ihr im gleichen Squad-Trupp wart.")
                    v:ConCommand("aoc_comlink_tf "..cid)
                end
            end
        end

        
    end, 
    limitfunc = function(ply) return ply:GetSquadPos() == "!" or ply:GetSquadPos() == "!!" end, 
}


AOCRP.Chat.Command["/helmoverlay"] = {
    func = function(ply, args)
        ply:SendLua("LocalPlayer().DrawHelmetOverlay = !LocalPlayer().DrawHelmetOverlay")
    end, 
    limitfunc = function(ply) return AOCRP.GTM:HasItem(ply, "helmet_hud") end, 
}

AOCRP.Chat.Command["/squadliste"] = {
    func = function(ply, args)
        ply:SendLua("LocalPlayer().SquadList = !LocalPlayer().SquadList")
    end, 
    limitfunc = function(ply) return true end, 
}

AOCRP.Chat.Command["/sl"] = {
    func = function(ply, args)
        ply:SendLua("LocalPlayer().SquadList = !LocalPlayer().SquadList")
    end, 
    limitfunc = function(ply) return true end, 
}

AOCRP.Chat.Command["/hud"] = {
    func = function(ply, args)
        ply:SendLua("LocalPlayer().DontDrawAOCHUD = !LocalPlayer().DontDrawAOCHUD")
    end, 
    limitfunc = function(ply) return true end, 
}


AOCRP.Chat.Command["/it"] = {
    func = function(ply, args)
        local text = argsToText(args)
        AOCRP.Chat:LocalPrint(ply, Color(255, 255, 255), "*** ", text)
    end, 
    limitfunc = function(ply) return true end, 
}

AOCRP.Chat.Command["/animation"] = {
    func = function(ply, args)
        ply:SelectWeapon("aoc_animationswep")
    end, 
    limitfunc = function(ply) return true end, 
}

AOCRP.Chat.Command["/git"] = {
    func = function(ply, args)
        local text = argsToText(args)
        AOCRP.Chat:GlobalPrint("*** " .. text) 
    end, 
    limitfunc = function(ply) return true end, 
}




AOCRP.Chat.Command["/knochen"] = {
    func = function(ply, args)
        local bonecount = ply:GetBoneCount()
        for i = 0, bonecount do
            ply:ManipulateBonePosition(i, Vector(0, 0, 0))
            ply:ManipulateBoneAngles(i, Angle(0, 0, 0))
        end
        ply:ChatPrint("*** Deine Animationen wurden zurückgesetzt, du bist nun kein Krüppel mehr Bruder.")
    end, 
    limitfunc = function(ply) return true end, 
}


AOCRP.Chat.Command["/streamer"] = {
    func = function(ply, args)
        if !args[1] then ply:ChatPrint("*** Gib dein Namen für Twitch ein.") return end
        if !ply:GetAOCStreamer() then
            AOCRP.HUD:Notify(ply, "Du bist kein Streamer!", 2)
            return
        end
        
            local currentState = ply:GetNetVar("AOCRP_StreamerLive", false)

            if currentState then
                ply:SetNetVar("AOCRP_StreamerLive", false)
                ply:ChatPrint("*** Streamermodus deaktiviert.")
            else 
                ply:SetNetVar("AOCRP_StreamerLive", true)
                AOCRP.Chat:GlobalPrint(Color(255, 0, 0), "#############################") 
                AOCRP.Chat:GlobalPrint(Color(255, 255, 255), ply:Nick(), " ist jetzt Live!") 
                AOCRP.Chat:GlobalPrint(Color(150, 0, 255), "[https://twitch.tv/".. args[1] .."](".. "https://twitch.tv/" .. args[1] .. ")") 
                AOCRP.Chat:GlobalPrint(Color(255, 0, 0), "#############################") 

                --AOCRP.HUD:CallNotify(player.GetHumans(), ply:Nick().. " streamt jetzt Age of Clones!", Color(117,0,102), "LIVESTREAM", "everfall/miscellaneous/ux/award/eor_mvpappear_05.mp3")
                AOCRP.HUD:Notification(player.GetHumans(), {title="LIVESTREAM", text=ply:Nick().. " streamt jetzt Age of Clones!", titlecolor=Color(117,0,102), sound="everfall/miscellaneous/ux/award/eor_mvpappear_05.mp3"})
            end

    end, 
    limitfunc = function(ply) return true end, 
}


AOCRP.Chat.Command["/reloadplydata"] = {
    func = function(ply, args)
        ply:LoadPlayerData()
    end, 
    limitfunc = function(ply) return ply:IsSuperAdmin() end, 
}

AOCRP.Chat.Command["/waldbrand"] = {
    func = function(ply, args)
        
        MapVote.Start(25, nil, nil, nil)
    end, 
    limitfunc = function(ply) return ply:IsSuperAdmin() end, 
}



AOCRP.Chat.Command["/reloadfunks"] = {
    func = function(ply, args)
        AOCRP.Comlink:ReloadChannelData()
    end, 
    limitfunc = function(ply) return ply:IsSuperAdmin() end, 
}




AOCRP.Chat.Command["/missletest"] = {
    func = function(ply, args)

        for k, v in pairs(ents.FindByClass("aoc_rocketmarker")) do
            local target = ply
            local ent = ents.Create( "lvs_protontorpedo" )
            ent:SetPos( v:GetPos() )
            ent:SetAngles( v:GetAngles())
            ent:Spawn()
            ent:Activate()
            ent:SetAttacker( ply )
            ent:SetTarget(ply)
            ent:Enable()

            if ent:GetTarget() != NULL then
                AOCRP.Chat:GlobalPrint("[ACHTUNG] Magazin "..v:GetBatteryName().. " hat ein Ziel anvisiert und feuert")
            end
        end


   


    end, 
    limitfunc = function(ply) return ply:IsSuperAdmin() end, 
}


AOCRP.Chat.Command["/sm"] = {
    func = function(ply, args)
        net.Start("AOCRP.Music.Stop")
        net.Send(ply)
    end, 
    limitfunc = function(ply) return true end, 
}

AOCRP.Chat.Command["/mv"] = {
    func = function(ply, args)

        local vol = tonumber(args[1])

        if !isnumber(vol) then ply:ChatPrint("*** /mv (0-300)") return end 

        net.Start("AOCRP.Music.ChangeVolume")
            net.WriteInt(vol, 10)
        net.Send(ply)
        
    end, 
    limitfunc = function(ply) return true end, 
}



AOCRP.Chat.Command["/antishock"] = {
    func = function(ply, args)
        ply:ConCommand("say /akt löst sein Anti-Stun-Modul aus.")
        ply:Freeze(false)
        ply:EmitSound("everfall/equipment/battle_command/start/health_battlecommand_start_var_01.mp3")
    end, 
    limitfunc = function(ply) return ply:IsSuperAdmin() end, 
}

AOCRP.Chat.Command["/pm"] = {
    func = function(ply, args)
        local text = argsToText(args)
        ply:ConCommand("sam pm "..text.." ")
    end, 
    limitfunc = function(ply) return true end, 
}

AOCRP.Chat.Command["/smoke"] = {
    func = function(ply, args)
        local entit = ents.Create("rw_sw_ent_nade_smoke")
        entit:SetPos(ply:GetEyeTrace().HitPos)
        entit:Spawn()
        entit:Detonate(entit, ply:GetEyeTrace().HitPos)
        entit.IsDetonated = true
    end, 
    limitfunc = function(ply) return ply:IsSuperAdmin() end, 
}

AOCRP.Chat.Command["/mreset"] = {
    func = function(ply, args)
        ply:SetMaterial("")
        for i=0,31 do 
            ply:SetSubMaterial(i, nil) 
        end 
        ply:SetColor( Color( 255, 255, 255, 255 ) ) 
        ply:ChatPrint("*** Material/Farbe zurückgesetzt!")
    end, 
    limitfunc = function(ply) return ply:IsSuperAdmin() or ply:IsUserGroup("Administrator") or ply:IsUserGroup("Moderator") or ply:IsUserGroup("Junior-Moderator") or ply:IsUserGroup("Senior-Moderator")  end, 
}

AOCRP.Chat.Command["/fickdich"] = {
    func = function(ply, args)
        local text = argsToText(args)
        ply:SetSubMaterial(text, "starwars/grady/itemshop/212th/arf/cheek/full/orange") 
        ply:ChatPrint(text)
    end, 
    limitfunc = function(ply) return ply:IsSuperAdmin() or ply:IsUserGroup("Administrator") or ply:IsUserGroup("Moderator") or ply:IsUserGroup("Junior-Moderator") or ply:IsUserGroup("Senior-Moderator")  end, 
}

AOCRP.Chat.Command["/helm"] = {
    func = function(ply, args)


        local bodygroup = ply:FindBodygroupByName( "Helmet" )


        if bodygroup != -1 then
            if ply:GetBodygroup( bodygroup ) == 1 then
                ply:SetBodygroup(bodygroup, 0)
            else
                ply:SetBodygroup(bodygroup, 1)
            end
        end
    end, 
    limitfunc = function(ply) return true end, 
}

AOCRP.Chat.Command["/rf"] = {
    func = function(ply, args)


        local bodygroup = ply:FindBodygroupByName( "Rangefinder" )


        if bodygroup != -1 then
            if ply:GetBodygroup( bodygroup ) == 1 then
                ply:SetBodygroup(bodygroup, 2)
            else
                ply:SetBodygroup(bodygroup, 1)
            end
        end
    end, 
    limitfunc = function(ply) return true end, 
}

AOCRP.Chat.Command["/mb"] = {
    func = function(ply, args)


        local bodygroup = ply:FindBodygroupByName( "Macrobinoculars" )


        if bodygroup != -1 then
            if ply:GetBodygroup( bodygroup ) == 1 then
                ply:SetBodygroup(bodygroup, 2)
            else
                ply:SetBodygroup(bodygroup, 1)
            end
        end
    end, 
    limitfunc = function(ply) return true end, 
}


AOCRP.Chat.Command["/skinreset"] = {
    func = function(ply, args)
        ply:ChatPrint(Color(0,255,0), "*** Deine Materials wurden zurückgesetzt.")
        AOCRP.GTM:ResetSubMaterials(ply)
    end, 
    limitfunc = function(ply) return true end, 
}

AOCRP.Chat.Command["/sr"] = {
    func = function(ply, args)
        ply:ChatPrint(Color(0,255,0), "*** Deine Materials wurden zurückgesetzt.")
        AOCRP.GTM:ResetSubMaterials(ply)
    end, 
    limitfunc = function(ply) return true end, 
}



AOCRP.Chat.Command["/etp"] = {
    func = function(ply, args)

        if ply.AOC_ETP then
            ply:ChatPrint("*** Du bist nun nicht mehr für einen Event-Teleport markiert.")
            ply.AOC_ETP = false
        else 
            ply:ChatPrint("*** Du bist nun für einen Event-Teleport markiert.")
            ply.AOC_ETP = true
        end

    end, 
    limitfunc = function(ply) return true end, 
}



AOCRP.Chat.Command["/skintable"] = {
    func = function(ply, args)
        for k, v in pairs(ply:GetMaterials()) do
            local id = tonumber(k) - 1
            ply:ChatPrint(id.." = "..v)
        end
    end, 
    limitfunc = function(ply) return true end, 
}

concommand.Add( "aocrp_testskin", function( ply, cmd, args )
    ply:SetSubMaterial(args[1], args[2])
end )

AOCRP.Chat.Command["/knochen"] = {
    func = function(ply, args)
        local bonecount = ply:GetBoneCount()
        for i = 0, bonecount do
            ply:ManipulateBonePosition(i, Vector(0, 0, 0))
            ply:ManipulateBoneAngles(i, Angle(0, 0, 0))
        end
        ply:ChatPrint("*** Deine Animationen wurden zurückgesetzt, du bist nun kein Krüppel mehr Bruder.")
                
    end, 
    limitfunc = function(ply) return true end, 
}


AOCRP.Chat.Command["/dioxis"] = {
    func = function(ply, args)
        local entit = ents.Create("rw_sw_ent_nade_poison")
        entit:SetPos(ply:GetEyeTrace().HitPos)
        entit:SetOwner(ply)
        entit:Spawn()
        entit:Detonate(entit, ply:GetEyeTrace().HitPos)
        entit.IsDetonated = true
    end, 
    limitfunc = function(ply) return ply:IsSuperAdmin() end, 
}

AOCRP.Chat.Command["/rakghoul"] = {
    func = function(ply, args)
        if not AOCRP.Admin:IsTeamMember(ply) then return end

		local target = AOCRP.Chat:FindPlayer(args[1])
		if IsValid(target) then
			AOCRP.Rakghoul:Transform(target)

			AOCRP.HUD:Notification(ply, {title="Verwandelt", text="Du hast " .. target:Nick() .. " zu einem Rakghoul verwandelt.", titlecolor=Color(255, 208, 0)})
			AOCRP.HUD:Notification(target, {title="Verwandelt", text="Du wurdest zu einem Rakghoul verwandelt.", titlecolor=Color(255, 123, 0)})
		else
			AOCRP.HUD:Notification(ply, {title="Fehler!", text="Der Spieler konnte nicht gefunden werden...", titlecolor=Color(255, 0, 0)})
		end
    end, 
    limitfunc = function(ply) return AOCRP.Admin:IsTeamMember(ply) end,
}



if CLIENT then
    AOCRP_StartTime = 0
    -- Define the start command
    concommand.Add("aocrp_timer", function()
        if AOCRP_StartTime == 0 then
            AOCRP_StartTime = SysTime()
            chat.AddText(Color(0, 255, 0), "Stoppuhr gestartet.")
        else 
            local stopTime = SysTime()
            local elapsedTime = stopTime - AOCRP_StartTime  -- Elapsed time in seconds
    
    
            chat.AddText(Color(0, 255, 0), string.format("Zeitmessung: %.2f s", elapsedTime))
    
            -- Reset the start time
            AOCRP_StartTime = 0
        end 
    end)

   
end
--addons/wos-passiveevent-ageo/lua/wos/pes/config/general/sh_config.lua:
--[[-------------------------------------------------------------------]]--[[
							  
	Copyright wiltOS Technologies LLC, 2021
	
	Contact: www.wiltostech.com
		
----------------------------------------]]--


wOS = wOS or {}
wOS.PES = wOS.PES or {}
wOS.PES.Config = wOS.PES.Config or {}

// What user groups can create new events?
wOS.PES.Config.CreateEventUsersgroup = {
	["superadmin"] = true,
}

// How often should we roll for a random event to happen, if there are any on the server? ( IN SECONDS )
wOS.PES.Config.RandomInterval = 3

// What is the maximum amount of random events that can run at the same time?
// 0 = NO LIMIT!
wOS.PES.Config.MaxRandoms = 1

// How long in advance should we wait to allow someone to snooze a randomly selected event? ( IN SECONDS )
// To prevent potentially weird overlap, this should always be less than the random interval
wOS.PES.Config.SnoozeDelay = 5

// This can be a table or a single value
wOS.PES.Config.SnoozeText = "The event \"[[name]]\" is about to start randomly in [[time]]. \n\nDo you want to snooze it?"

// The minimum amount of players required for a random event to execute. Set this to false if you do not want this to be considered
wOS.PES.Config.RandomMinimumPlayers = false
--addons/wos-passiveevent-ageo/lua/wos/pes/core/cl_core.lua:
--[[-------------------------------------------------------------------]]--[[
							  
	Copyright wiltOS Technologies LLC, 2021
	
	Contact: www.wiltostech.com
		
----------------------------------------]]--

























































































































































wOS = wOS || {}
wOS.PES = wOS.PES || {}
wOS.PES.Triggers = wOS.PES.Triggers || {}
wOS.PES.Triggers.Data = wOS.PES.Triggers.Data || {}
wOS.PES.Nodes = wOS.PES.Nodes || {}
wOS.PES.Nodes.Data = wOS.PES.Nodes.Data || {}

if wOS.PES.GetActiveMenu then return end

surface.CreateFont( "wOS.PES.NodeText", {
	font = "Arial",
	extended = true,
	size = 25*(ScrH()/1200),
	weight = 1300,
} )

surface.CreateFont( "wOS.PES.CategoryText", {
	font = "Arial",
	extended = true,
	size = 20*(ScrH()/1200),
	weight = 1300,
} )

local nodeMenu
local mainMenu
local missionMenu

local currentPanel

local editingNode
local editingVar

function wOS.PES:GetEditingVar()
    return editingVar
end

function wOS.PES:SetEditingVar(node, varTable)
    local parent = self:GetNodeMenu()
    if not parent then return end
    editingVar = node.varDerma[varTable.Name]
    editingNode = node
    parent:Hide()
end

function wOS.PES:SetActiveMenu( pan )
    currentPanel = pan
end

function wOS.PES:GetActiveMenu()
    return currentPanel
end

function wOS.PES:SetNodeMenu( pan )
    nodeMenu = pan
end

function wOS.PES:GetNodeMenu()
    return nodeMenu
end

function wOS.PES:IsEditingVar()
    local curr_pan = self:GetActiveMenu()
    local nmenu = self:GetNodeMenu()
    local evar = self:GetEditingVar()
    return IsValid( evar ) and IsValid( nmenu ) and curr_pan == nmenu
end

// The entry point into the menus
function wOS.PES:OpenMenu()
    if self:IsEditingVar() then
        local element = wOS.PES:GetEditingVar()
        local varTable = element.varTable
        local varType = wOS.PES.Vars:Get(varTable.Type)
        if varType then
            local value = varType.GetValue(element)
            if value != nil then
                editingNode:SetVar(varTable.Name, value)
            end
        end
    end

    local cur_pan = self:GetActiveMenu()
    if IsValid(cur_pan) then
        if cur_pan.menu then
            if not cur_pan.menu.CreationType or cur_pan.menu.CreationType == WOS_PES.CREATOR.EVENT then 
                cur_pan:Show()
                return
            end
        end
        cur_pan:Remove()
    end

    wOS.PES:OpenMainMenu()
end

// This is the first menu that is shown or the fallback
function wOS.PES:OpenMainMenu()
    if IsValid(mainMenu) then
        mainMenu:Show()
    else
        local pnl = vgui.Create("DFrame")
        pnl:SetTitle( "PES Toolgun" )
        pnl:SetSize(256,512)
        pnl:Center()
        pnl:MakePopup()
        pnl:SetDraggable(false)

        local startMission = vgui.Create("DButton", pnl)
        startMission:SetHeight(128)
        startMission:SetText("Start Event")
        startMission:Dock(TOP)
        startMission:DockPadding(0,3,0,0)
        startMission.DoClick = function()
            mainMenu:Hide()
            wOS.PES:OpenMissionMenu()
        end

        local makeEvent = vgui.Create("DButton", pnl)
        makeEvent:SetHeight(128)
        makeEvent:Dock(TOP)
        makeEvent:DockPadding(0,3,0,3)
        makeEvent:SetText("List Events")

        makeEvent.DoClick = function()
            mainMenu:Hide()
            wOS.PES:OpenNodeMenu()
        end

		local adminMenu = vgui.Create("DButton", pnl)
		adminMenu:SetHeight(128)
		adminMenu:Dock(TOP)
		adminMenu:DockPadding(0,3,0,3)
		adminMenu:SetText("Admin Menu")

		adminMenu.DoClick = function()
			wOS.PES:OpenAdminList()
		end

        mainMenu = pnl
    end

    self:SetActiveMenu( mainMenu )
end

local makeEventButton = function(name, parent)

    local info = vgui.Create("DButton", parent)
    info:SetText(name)
    info:Dock(TOP)
    info:DockMargin(0, 0, 0, 10)

    info.Think = function( pan )
		if name == "+" then return end
        if not IsValid(parent) then return end
        if not parent.MissionName then return end
        if parent.MissionName[name] then return end
        pan:Remove()
    end

    info.DoClick = function( pan )
       parent.EventName = name
    end

    return info
end

// This is the admin selection menu
function wOS.PES:OpenAdminList()
    local cur_pan = self:GetActiveMenu()
	if IsValid(cur_pan) then
		cur_pan:Remove()
	end

	local pnl = vgui.Create("DFrame")
	pnl:SetTitle( "PES Toolgun" )
	local size = ScrH()*(512/1080)
	pnl:SetSize(size/2, size)
	pnl:Center()
	pnl:MakePopup()
    pnl:SetDraggable(false)
	
	self:SetActiveMenu( pnl )

    local startMission = vgui.Create("DButton", pnl)
    startMission:SetHeight(128)
    startMission:SetText("PES Admin Settings")
    startMission:Dock(TOP)
    startMission:DockPadding(0,3,0,0)
    startMission.DoClick = function()
        pnl:Hide()
        self:SetActiveMenu( self:OpenAdminSettings() )
    end

    local makeEvent = vgui.Create("DButton", pnl)
    makeEvent:SetHeight(128)
    makeEvent:Dock(TOP)
    makeEvent:DockPadding(0,3,0,3)
    makeEvent:SetText("List Scheduled Events")

    makeEvent.DoClick = function()
        pnl:Hide()
        self:SetActiveMenu( self:OpenScheduledMenu() )
    end

    local adminMenu = vgui.Create("DButton", pnl)
    adminMenu:SetHeight(128)
    adminMenu:Dock(TOP)
    adminMenu:DockPadding(0,3,0,3)
    adminMenu:SetText("Event Viewer")

    adminMenu.DoClick = function()
        wOS.PES.RequestOpenAdminPreMenu()
    end

end

function wOS.PES:OpenAdminActiveList( events )

    local cur_pan = self:GetActiveMenu()
	if IsValid(cur_pan) then
		cur_pan:Remove()
	end

    local bw, bh = ScrW()*0.27, ScrH()*0.25

	local base = vgui.Create("DFrame")
	base:SetSize( bw, bh )
	base:Center()
	base:MakePopup()
	base:SetDraggable(false)
	base:SetTitle("")
	base:ShowCloseButton(false)
	base.Paint = function(self, w, h)
		surface.SetDrawColor(35.5,35.5,35.5)
		surface.DrawRect(0,0, w, h)

        draw.SimpleText("Currently Running Events", "wOS.PES.NodeText", w*0.02, h*0.04, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end

	local close = vgui.Create("DButton", base)
	close:SetSize(bh*0.08,bh*0.08)
	close:SetPos(bw - bh*0.087, 0)
	close:SetText("")
	close.Paint = function(self, w, h)
		local col = Color(255, 255, 255, (self.Hovered and 255) or 150)
        surface.SetDrawColor(col)
		surface.DrawLine(0,0, w, h)
		surface.DrawLine(w,0, 0, h)
    end
	close.DoClick = function() base:Remove() end

	self:SetActiveMenu( base )

    local tabsheet = vgui.Create( "DPropertySheet", base )
    tabsheet:Dock( FILL )

    local manual_sheet = vgui.Create( "DScrollPanel", tabsheet )
    //manual_sheet.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 128, 255, self:GetAlpha() ) ) end 
    tabsheet:AddSheet( "Manual Events", manual_sheet, "icon16/joystick.png" )

    local random_sheet = vgui.Create( "DScrollPanel", tabsheet )
    //random_sheet.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 128, 0, self:GetAlpha() ) ) end 
    tabsheet:AddSheet( "Random Events", random_sheet, "icon16/arrow_switch.png" )

    local sched_sheet = vgui.Create( "DScrollPanel", tabsheet )
    //sched_sheet.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 128, 255, self:GetAlpha() ) ) end 
    tabsheet:AddSheet( "Scheduled Events", sched_sheet, "icon16/clock.png" )

    local sim_sheet = vgui.Create( "DScrollPanel", tabsheet )
    //sim_sheet.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 128, 0, self:GetAlpha() ) ) end 
    tabsheet:AddSheet( "Simulations", sim_sheet, "icon16/computer.png" )

    for id, dat in pairs( events ) do
        local name = dat[1]
        local etype = dat[2]
        local sim = dat[3]

        if sim then
            sim = sim .. " - "
        else
            sim = ""
        end

        local ebutton = vgui.Create( "DButton" )
        ebutton.ID = id 
        ebutton.Name = sim .. name
        ebutton.Type = etype
        ebutton:SetText( ebutton.Name )
        -- ebutton.Paint = function( pan, ww, hh )

        -- end
        ebutton.DoClick = function( pan )
            wOS.PES.RequestOpenAdminViewer( pan.ID )
        end

        if etype == WOS_PES.EVENT.MANUAL then
            manual_sheet:AddItem( ebutton )
        elseif etype == WOS_PES.EVENT.RANDOM then
            random_sheet:AddItem( ebutton )
        elseif etype == WOS_PES.EVENT.SCHEDULED then
            sched_sheet:AddItem( ebutton )
        elseif etype == WOS_PES.EVENT.SIMULATION then
            sim_sheet:AddItem( ebutton )
        else
            ebutton:Remove()
            continue
        end
        ebutton:Dock( TOP )
        ebutton:DockMargin( 0, 0, 0, 5 )
    end

    -- local dum_sheet = vgui.Create( "DScrollPanel", tabsheet )
    -- dum_sheet.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 128, 255, self:GetAlpha() ) ) end 
    -- tabsheet:AddSheet( "Quests", dum_sheet, "icon16/wand.png" )
end

// Admin viewer of current event
function wOS.PES:OpenAdminEventViewer( id, nodes )
    local cur_pan = self:GetActiveMenu()
	if IsValid(cur_pan) then
		cur_pan:Remove()
	end

	local base = vgui.Create("DFrame")
	base:SetSize(ScrW(), ScrH())
	base:Center()
	base:MakePopup()
	base:SetDraggable(false)
	base:SetTitle("")
	base:ShowCloseButton(false)
	base.Paint = function(self, w, h)
		surface.SetDrawColor(35.5,35.5,35.5)
		surface.DrawRect(0,0, w, h)
	end
	local close = vgui.Create("DButton", base)
	close:SetSize(20,20)
	close:SetPos(ScrW()-20, 0)
	close:SetText("")
	close.Paint = function(self, w, h)
		local col = Color(255, 255, 255, (self.Hovered and 255) or 150)
        surface.SetDrawColor(col)
		surface.DrawLine(0,0, w, h)
		surface.DrawLine(w,0, 0, h)
    end
	close.DoClick = function() base:Remove() end

	local mini = vgui.Create("DButton", base)
	mini:SetSize(20,20)
	mini:SetPos(ScrW()-45, 0)
	mini:SetText("")
	mini.Paint = function(self, w, h)
		local col = Color(255, 255, 255, (self.Hovered and 255) or 150)

		surface.SetDrawColor(col)
		surface.DrawLine(0,h/2, w, h/2)
	end
	mini.DoClick = function() base:Hide() end


	base.menu = vgui.Create("WOS_PES_ViewNodeBG", base)
    local menu = base.menu
    
	menu:Dock(FILL)
    menu:DockMargin(0,0,0,0)
    

	local but = vgui.Create("DButton", base)
	but:SetPos(base:GetWide() - 100, 60)
	but:SetSize(90, 40)
	but:SetText("Stop Current Event")
	but.DoClick = function()
		wOS.PES.RequestStop( id )
        close:DoClick()
	end

	for index, data in ipairs(nodes) do
		local button = menu:AddNode( id )
		button.Links = data.Links
		button.Active = data.Active
		button.Type = data.Type
		button:SetPos(data.Pos.x, data.Pos.y)
		button:SetText("")
        button.TextName = data.Name

	    button:FormLinks()
	end

	self:SetActiveMenu( base )

    // Added some cleansing to the timer so we don't have it residually there
    // Also forced it to close the menu through the close button if the case of no data
	timer.Create("wOS.PES.Admin.Sync", 1, 0, function()

        local cur_pan = wOS.PES:GetActiveMenu()
        if !IsValid(cur_pan) then timer.Destroy( "wOS.PES.Admin.Sync") return end
        if !cur_pan.menu then timer.Destroy( "wOS.PES.Admin.Sync") return end
        if not cur_pan.menu.CreationType then timer.Destroy( "wOS.PES.Admin.Sync") return end 
        if cur_pan.menu.CreationType != WOS_PES.CREATOR.EVENT then timer.Destroy( "wOS.PES.Admin.Sync") return end

        wOS.PES.RequestAdminSync(id, function(len)
            local nodes = net.ReadActivePESEvent()
            if #nodes <= 0 then
                for index, node in pairs(menu.Nodes) do
                    node:Remove()
                end
                timer.Destroy( "wOS.PES.Admin.Sync") 
                close:DoClick()
                return 
            end
            if not menu then return end
            if not menu.Nodes then return end
            for index, data in pairs(nodes) do
                if not IsValid(menu.Nodes[index]) then continue end
                menu.Nodes[index].Active = data.Active
            end
        end)
	end)
end

// Build editor menu
function wOS.PES:OpenNodeMenu( event, dirty, force_reset )
	local nMenu = wOS.PES:GetNodeMenu()
    if IsValid(nMenu) then
        if not event and not force_reset then
            nMenu:Show()
            self:SetActiveMenu( nMenu )
            return
        else
            nMenu:Remove()
        end
    end

    local base = vgui.Create("DFrame")
    base:SetSize(ScrW(), ScrH())
    base:Center()
    base:MakePopup()
    base:SetDraggable(false)
    base:SetTitle("")
    base:ShowCloseButton(false)
    base:SetZPos( 5 )
    base.Paint = function(self, w, h)
        surface.SetDrawColor(35.5, 35.5, 35.5)
        surface.DrawRect(0,0, w, h)
    end

    local close = vgui.Create("DButton", base)
    close:SetSize(20,20)
    close:SetPos(ScrW()-20, 0)
    close:SetText("")
    close:SetZPos( 10 )
    close.Paint = function(self, w, h)
        local col = Color(255, 255, 255, (self.Hovered and 255) or 150)

        surface.SetDrawColor(col)
        surface.DrawLine(0,0, w, h)
        surface.DrawLine(w,0, 0, h)
    end
    close.DoClick = function() hook.Call( "wOS.PES.OnCreatorClose", nil, WOS_PES.CREATOR.EVENT ) base:Remove() end

    local mini = vgui.Create("DButton", base)
    mini:SetSize(20,20)
    mini:SetPos(ScrW()-45, 0)
    mini:SetText("")
    mini:SetZPos( 10 )
    mini.Paint = function(self, w, h)
        local col = Color(255, 255, 255, (self.Hovered and 255) or 150)

        surface.SetDrawColor(col)
        surface.DrawLine(0,h/2, w, h/2)
    end
    mini.DoClick = function() base:Hide() end

    local scroll = vgui.Create("DScrollPanel", base)
    scroll:SetWide(100)
    scroll:SetTall( base:GetTall() )
    scroll:Dock(LEFT)
    scroll:DockPadding(5,5,5,5)
	scroll:DockMargin(16,16,16,16)
    scroll:SetZPos( 10 )
    scroll.Paint = function( pan, ww, hh )
		draw.RoundedBox(4, 0, 0, ww, hh, Color(0, 0, 0, 150))
		draw.RoundedBox(4, 4, 4, ww-8, hh-8, Color(36,36,36))
		draw.RoundedBox(4, 4, 4, ww-8, hh-8, Color(255,255,255,100))
    end
    base.scroll = scroll

	local menu = vgui.Create("WOS_PES_NodeBG", base)
	menu:Dock(FILL)
	menu:DockMargin(0,0,0,0)
	base.menu = menu

    if not event then
	    local start = menu:CreateStartNode()
    else
        menu.Importable = event.Importable
        menu.Name = event.Name
        menu.Description = event.Description
        menu.random = event.random
        menu.DirtyNodes = dirty

        for index, node in pairs(event.Nodes) do
            
            local pNode
            if index == 1 then
                pNode = menu:CreateStartNode()
            else
                pNode = menu:AddNode()
                pNode.Type = node.Type
            end

            pNode:SetPos(node.Pos.x, node.Pos.y )
            
            if pNode.Type != node.Type then continue end
            pNode:SetVars(node._vars, dirty)
		    pNode:SetDisableVars(node._toggles, dirty)
        end

        for index, node in pairs(event.Nodes) do
            if node.Triggers then
                for triggerName, panelTable in pairs(node.Triggers) do
                    for _, otherID in pairs(panelTable) do
                        local pnl, oPnl = menu.Nodes[index], menu.Nodes[otherID]
                        menu:MakeLink(pnl, oPnl, triggerName)
                    end
                end
            end
        end

        for _, node in pairs(menu.Nodes) do
            node:CreateLinks()
        end
    end

    local info = vgui.Create("DButton", base.scroll)
    info:SetText("Event Manager")
    info:Dock(TOP)
    info:DockMargin(0, 0, 0, 10)
    info.DoClick = function()
        wOS.PES.GetImportableEvents( function( events )
            local menu = base.menu
            if not menu then return end
            local tot = {}
            for _, data in pairs( events ) do
                data.Category = data.Category or "Event"
                table.insert( tot, data )
            end
            wOS.PES.GetImportableSimulations( function( sims )
                for _, data in pairs( sims ) do
                    data.Category = data.Category or "Simulation"
                    data.IsSimulation = true
                    data.Settings = nil
                    table.insert( tot, data )
                end
                menu:OpenEventSelector( tot )
            end )
        end, true )
    end

    if event then
        local delin = vgui.Create("DButton", base.scroll)
        delin:SetText("Delete Event")
        delin:Dock(TOP)
        delin:DockMargin( 0, 0, 0, 10 )
        delin.DoClick = function()
            menu:OpenEventDeleter()
        end
    end

    self:SetNodeMenu( base )
    self:SetActiveMenu( base )
end
// Starting an event
function wOS.PES:OpenMissionMenu()
    if IsValid(missionMenu) then
        missionMenu:Show()
        missionMenu:RequestUpdate()
    else
        local hh = ScrH() * 0.4

        local base = vgui.Create("DFrame")
        base:SetTitle( "Mission Menu" )
        base:SetSize(200 + 100, hh)
        base:Center()
        base:MakePopup()
        base:SetDraggable(false)

		base.Paint = function(self, w, h)
			surface.SetDrawColor(0,0,0)
			surface.DrawRect(0,0, w,h)
			if base.scroll and base.scroll.EventName then
				draw.SimpleText(base.scroll.EventName, "DermaDefault", w * 0.3, 10 )
			end
		end

        local scrollpanel = vgui.Create("DScrollPanel", base)
        scrollpanel:SetSize(180, hh - 30)
        scrollpanel:SetPos(10, 30)
        wOS.PES.RequestEventList(function(missionNames)
            base.scroll.MissionName = {}
            for index, name in pairs(missionNames) do
                makeEventButton(name, base.scroll)
                base.scroll.MissionName[name] = true
            end
        end)

		-- instant

		local button = vgui.Create("DButton", base)
		button:SetText("Start Now")
		button:SetSize(80, 30)
		button:SetPos(210, 30)
		button.DoClick = function()
			if base.scroll.EventName then
				wOS.PES.RequestEventStart(base.scroll.EventName)
			end
		end

		local timeStart = vgui.Create("DButton", base)
		timeStart:SetPos(210, 110)
		timeStart:SetSize(80, 30)
		timeStart:SetText("Schedule Later")

		timeStart.DoClick = function()
			if not base.scroll.EventName then return end
			local pnl = vgui.Create("DFrame")
			pnl:SetSize(ScrW()*0.5, ScrH() * 0.5)
			pnl:Center()
			pnl:MakePopup()
            pnl:SetTitle( "Event Scheduler" )
			pnl.Think = function( pan )
				pan:MoveToFront()
			end

			local calendar = vgui.Create("wOSCalendar", pnl)
			calendar:Dock(FILL)

			local confirm = vgui.Create("DButton", pnl)
			confirm:Dock(BOTTOM)
			confirm:DockMargin(5,5,5,5)
			confirm:SetTall(40)
			confirm:SetText("Start Event")
			confirm.DoClick = function( pan )
				wOS.PES.RequestEventStartTime(base.scroll.EventName, calendar:GetTime() )
				base:Remove()
				pan:Remove()
			end
		end

        base.scroll = scrollpanel
        missionMenu = base

        function missionMenu:RequestUpdate()
            wOS.PES.RequestEventList(function(missionNames)
                local oldTable = table.Copy(missionMenu.scroll.MissionName)

                local newTable = {}

                for index, name in pairs(missionNames) do
                    if !oldTable[name] then
                        makeEventButton(name, missionMenu.scroll)
                    end
                    newTable[name] = true
                end
                missionMenu.scroll.MissionName = newTable
            end)
        end
    end
end


// Helper functions
local function charWrap(text, pxWidth)
    local total = 0

    text = text:gsub(".", function(char)
        total = total + surface.GetTextSize(char)

        if total >= pxWidth then
            total = 0
            return "\n" .. char
        end

        return char
    end)

    return text, total
end

function wOS.PES.WrapText(text, font, pxWidth)
    local total = 0

    surface.SetFont(font)

    local spaceSize = surface.GetTextSize(' ')
    text = text:gsub("(%s?[%S]+)", function(word)
            local char = string.sub(word, 1, 1)
            if char == "\n" or char == "\t" then
                total = 0
            end

            local wordlen = surface.GetTextSize(word)
            total = total + wordlen

            if wordlen >= pxWidth then
                local splitWord, splitPoint = charWrap(word, pxWidth - (total - wordlen))
                total = splitPoint
                return splitWord
            elseif total < pxWidth then
                return word
            end

            if char == ' ' then
                total = wordlen - spaceSize
                return '\n' .. string.sub(word, 2)
            end

            total = wordlen
            return '\n' .. word
        end)

    return text
end


hook.Add("PostDrawOpaqueRenderables", "wOS.CombatSim.EditingVar", function()
	local ply = LocalPlayer()

	local wep = ply:GetActiveWeapon()
    if not IsValid( wep ) then return end
	if wep:GetClass() != "wos_pes_tool" and wep:GetClass() != "wos_simulation_tool" then return end

    if not wOS.PES:IsEditingVar() then return end
    
    local element = wOS.PES:GetEditingVar()

    local varTable = element.varTable
    local varType = wOS.PES.Vars:Get(varTable.Type)
    if varType and varType.Draw3D then
        varType.Draw3D(wep, wep.Owner, element)
    end
end)
--gamemodes/starwarsrp/entities/weapons/aoc_animationswep.lua:
AddCSLuaFile()


SWEP.PrintName = "Unbewaffnet"
SWEP.Author = "Lt. Sammy"
SWEP.Purpose = ""
SWEP.Instructions = "Linksklick: Ziehen\nRechtsklick: Animation durchführen\nR: Animation auswählen"
SWEP.Spawnable = true
SWEP.Category = "AOCRP - Tools"

SWEP.ViewModel = "models/weapons/c_arms_animations.mdl"
SWEP.WorldModel = ""

SWEP.Slot = 0
SWEP.SlotPos = -1

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.DrawCrosshair = false
SWEP.DoingAnimation = nil

function SWEP:Initialize()
  self:SetHoldType("normal")
  
	self.Time = 0
	self.Range = 150
end

function SWEP:ResetAnimations()
	if IsValid( self:GetOwner() ) then
		for i = 0, self:GetOwner():GetBoneCount() - 1 do
			self:GetOwner():ManipulateBoneAngles(i, Angle(0, 0, 0), true)
		end
		self.DoingAnimation = nil
	end
end

local function CreateDeathRagdoll(ply, pos)
    local rag = ents.Create( "prop_ragdoll" )



    rag:SetPos( pos )
    rag:SetModel( ply:GetModel() )
    rag:SetColor( ply:GetColor() )
    rag.BodyOf = ply
    rag:SetNetVar("AOC_BodyOf", ply)
    rag:SetNetVar("AOCRP.QIM.Menu", "leiche" ) 
    rag:Spawn()
    rag:Activate()
    rag:SetCollisionGroup( COLLISION_GROUP_DEBRIS_TRIGGER )


    for k, v in pairs(ply:GetBodyGroups()) do
        rag:SetBodygroup(v.id, ply:GetBodygroup( v.id ))
    end

    for k, v in pairs(ply:GetMaterials()) do
        if ply:GetSubMaterial( k ) != "" then
            rag:SetSubMaterial(k, ply:GetSubMaterial( k ))
        end
    end

	ply.DeathRagdoll = rag


    return rag
end

function SWEP:StartRagCarry(ent)


	if !IsValid(ent) then return end
	if !IsValid(ent.BodyOf) then return end

	self:ResetAnimations()

	local ply = self.Owner

	-- Create the model
	local shoulderModel = ents.Create("prop_physics")
	shoulderModel:SetModel(ent:GetModel())
	shoulderModel:Spawn()
	if not IsValid(shoulderModel) then return end

	shoulderModel.Player = ent.BodyOf
	self.Owner.Carrying = shoulderModel

--[[ 	-- Create undo 
	undo.Create("ShoulderModel")
		undo.AddEntity(shoulderModel)
		undo.SetPlayer(ply)
	undo.Finish() ]]

	-- Find the right shoulder bone
	local boneIndex = ply:LookupBone("ValveBiped.Bip01_R_Clavicle") -- Replace with the correct bone name
	if not boneIndex then return end

	local newPos = Vector(5.831298828125, -0.7596435546875, 40.8671875)
	local newAngle = Angle(14.767464637756, -75.881004333496, -174.55282592773)


	-- Get the bone's position and angles
	local bonePos, boneAng = ply:GetBonePosition(boneIndex)

	-- Convert the local position and angle to world space
	local worldPos,worldAng = LocalToWorld(newPos, newAngle, self.Owner:GetPos(), self.Owner:EyeAngles())

		-- Apply the new position and angles to the model
	shoulderModel:SetPos(worldPos)
	shoulderModel:SetAngles(worldAng)
    -- Attach the model to the bone
    shoulderModel:FollowBone(ply, boneIndex)


	-- Do Animation on player 

	local bones = {
		-- right forearm
		["ValveBiped.Bip01_R_Forearm"] = {
			ang = Angle(-0.00025442455080338, -52.429595947266, 89.664733886719),
		},
		-- right upperarm
		["ValveBiped.Bip01_R_UpperArm"] = {
			ang = Angle(80.192611694336, 2.8423953056335, 94.373184204102),
		},
		-- right hand
		["ValveBiped.Bip01_R_Hand"] = {
			ang = Angle(-1.4941038898542, -71.009773254395, -1.2699882972811)
		},
	}

	for k, v in pairs(bones) do
		if ply:LookupBone(k) != nil then
			ply:ManipulateBoneAngles( ply:LookupBone(k), v.ang, 0 )
		end
	end

	-- Do Animation on model
	local bones = {
		-- spine 1
		["ValveBiped.Bip01_Spine1"] = {
			ang = Angle(1.6648587916279, 43.780479431152, 5.1226429604867),
		},
		-- right thigh
		["ValveBiped.Bip01_R_Thigh"] = {
			ang = Angle(1.956179857254, -59.220958709717, -1.2097960710526),
		},
		-- left upperarm
		["ValveBiped.Bip01_L_UpperArm"] = {
			ang = Angle(-17.813495635986, -98.522872924805, -9.0985994338989),
		},
		-- left thigh
		["ValveBiped.Bip01_L_Thigh"] = {
			ang = Angle(18.060621261597, -60.012195587158, 4.2870988845825),
		},
		-- left forearm
		["ValveBiped.Bip01_L_Forearm"] = {
			ang = Angle(18.679718017578, -12.648487091064, -21.691505432129),
		},
		-- right upperarm
		["ValveBiped.Bip01_R_UpperArm"] = {
			ang = Angle(27.442066192627, -95.857238769531, 24.148738861084),
		},
	}

	for k, v in pairs(bones) do
		if shoulderModel:LookupBone(k) != nil then
			shoulderModel:ManipulateBoneAngles( shoulderModel:LookupBone(k), v.ang, 0 )
		end
	end

	shoulderModel:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)

	self.Owner.Car_OldWalkSpeed = self.Owner:GetWalkSpeed()
	self.Owner.Car_OldRunSpeed = self.Owner:GetRunSpeed()


	local amount = 70
	self.Owner:SetWalkSpeed(amount)
	self.Owner:SetRunSpeed(amount)

	if IsValid(shoulderModel.Player) then 

		for k, v in pairs(shoulderModel.Player:GetBodyGroups()) do
			shoulderModel:SetBodygroup(v.id, shoulderModel.Player:GetBodygroup( v.id ))
		end
		--PrintTable(ply:GetMaterials())
		for k, v in pairs(shoulderModel.Player:GetMaterials()) do
			if shoulderModel.Player:GetSubMaterial( k ) != "" then
				shoulderModel:SetSubMaterial(k, shoulderModel.Player:GetSubMaterial( k ))
			end
		end


		shoulderModel.Player.MyCarry = shoulderModel

		shoulderModel.Player:Spectate( OBS_MODE_CHASE )
		shoulderModel.Player:SpectateEntity( shoulderModel )
	end

end 


SWEP.PropMapping = {}

SWEP.PropMapping["aoc_ammobox"] = {
	playerBones = {
		-- right forearm
		["ValveBiped.Bip01_R_Forearm"] = {
			ang = Angle(-61.147, 30.6646, 48.0154),
		},
		-- right upperarm
		["ValveBiped.Bip01_R_UpperArm"] = {
			ang = Angle(45.0425, 60.6242, 123.3634),
		},
	},
	entPos = Vector(29.4546,-17.3179,4.1365),
	entAng = Angle(-36.0197,-168.4136,-171.2869),
	bone = "ValveBiped.Bip01_R_Hand"
}
SWEP.PropMapping["aoc_medicbox"] = {
	playerBones = {
		-- right forearm
		["ValveBiped.Bip01_R_Forearm"] = {
			ang = Angle(-61.147, 30.6646, 48.0154),
		},
		-- right upperarm
		["ValveBiped.Bip01_R_UpperArm"] = {
			ang = Angle(45.0425, 60.6242, 123.3634),
		},
	},
	entPos = Vector(29.4546,-17.3179,4.1365),
	entAng = Angle(-36.0197,-168.4136,-171.2869),
	bone = "ValveBiped.Bip01_R_Hand"
}
SWEP.PropMapping["aoc_waffenkiste"] = {
	playerBones = {
		-- right forearm
		["ValveBiped.Bip01_R_Forearm"] = {
			ang = Angle(-61.147, 30.6646, 48.0154),
		},
		-- right upperarm
		["ValveBiped.Bip01_R_UpperArm"] = {
			ang = Angle(45.0425, 60.6242, 123.3634),
		},
	},
	entPos = Vector(29.4546,-17.3179,4.1365),
	entAng = Angle(-36.0197,-168.4136,-171.2869),
	bone = "ValveBiped.Bip01_R_Hand"
}
SWEP.PropMapping["aoc_vehicleammo"] = {
	playerBones = {
		-- right forearm
		["ValveBiped.Bip01_R_Forearm"] = {
			ang = Angle(-61.147, 30.6646, 48.0154),
		},
		-- right upperarm
		["ValveBiped.Bip01_R_UpperArm"] = {
			ang = Angle(45.0425, 60.6242, 123.3634),
		},
	},
	entPos = Vector(29.4546,-17.3179,4.1365),
	entAng = Angle(-36.0197,-168.4136,-171.2869),
	bone = "ValveBiped.Bip01_R_Hand"
}
SWEP.PropMapping["aoc_training"] = {
	playerBones = {
		-- right forearm
		["ValveBiped.Bip01_R_Forearm"] = {
			ang = Angle(-61.147, 30.6646, 48.0154),
		},
		-- right upperarm
		["ValveBiped.Bip01_R_UpperArm"] = {
			ang = Angle(45.0425, 60.6242, 123.3634),
		},
	},
	entPos = Vector(29.4546,-17.3179,4.1365),
	entAng = Angle(-36.0197,-168.4136,-171.2869),
	bone = "ValveBiped.Bip01_R_Hand"
}
SWEP.PropMapping["turret_eweb_ammo"] = {
	playerBones = {
	
		-- right upperarm
		["ValveBiped.Bip01_R_UpperArm"] = {
			ang = Angle(23.5993,36.5215,61.604),
		},
	},
	entPos = Vector(8.2891,-18.7217,-7.6509),
	entAng = Angle(21.0439,-98.2578,135.6931),
	bone = "ValveBiped.Bip01_R_Hand"
}


SWEP.PropMapping["sse_heal_canister"] = {
	playerBones = {
		["ValveBiped.Bip01_R_Forearm"] = {
			ang = Angle(-48.6888,66.0906,0),
		},
		["ValveBiped.Bip01_L_Forearm"] = {
			ang = Angle(-0.538,47.3183,97.1548),
		},
		-- right upperarm
		["ValveBiped.Bip01_R_UpperArm"] = {
			ang = Angle(31.2519,80.685,84.4852),
		},
	},
	entPos = Vector(6.6278,-9.6265,17.0913),
	entAng = Angle(-27.7024,-173.6187,-176.7883),
	bone = "ValveBiped.Bip01_R_Hand"
}
SWEP.PropMapping["sse_armor_canister"] = {
	playerBones = {
		["ValveBiped.Bip01_R_Forearm"] = {
			ang = Angle(-48.6888,66.0906,0),
		},
		["ValveBiped.Bip01_L_Forearm"] = {
			ang = Angle(-0.538,47.3183,97.1548),
		},
		-- right upperarm
		["ValveBiped.Bip01_R_UpperArm"] = {
			ang = Angle(31.2519,80.685,84.4852),
		},
	},
	entPos = Vector(6.6278,-9.6265,17.0913),
	entAng = Angle(-27.7024,-173.6187,-176.7883),
	bone = "ValveBiped.Bip01_R_Hand"
}

local function IsEntityFrozen(ent)
	if not IsValid(ent) then return false end -- Ensure the entity is valid
	local phys = ent:GetPhysicsObject()
	if not IsValid(phys) then return false end -- Ensure the entity has a valid physics object

	return not phys:IsMotionEnabled() -- Returns true if the entity is frozen
end

local function CopyEntityNetworkVarsToTable(ent)
    if not IsValid(ent) then return nil end -- Validate entity

    local data = {} -- Store copied values
	if not ent.GetNetworkVars then return end
    local netVars = ent:GetNetworkVars() -- Get all set NetworkVars

    for varName, value in pairs(netVars) do
        data[varName] = value -- Store in table
    end

    return data -- Return copied data
end

local function ApplyNetworkVarsFromTable(ent, data)
    if not IsValid(ent) or not data then return false end -- Validate input

    for varName, value in pairs(data) do
        local setter = ent["Set" .. varName] -- Dynamically find setter function
        if setter then
            setter(ent, value) -- Apply stored value
        end
    end

    return true -- Return success
end

function SWEP:StartPropCarry(ent)

	if IsValid(self.Owner.CarryingProp) then return end

	if !IsValid(ent) then return end
	--if !IsValid(ent.BodyOf) then return end

	self:ResetAnimations()

	local ply = self.Owner



	-- Create the model
	local shoulderModel = ents.Create(ent:GetClass())
	shoulderModel:SetModel(ent:GetModel())
	shoulderModel:Spawn()
	if not IsValid(shoulderModel) then return end
	
	local mapping = self.PropMapping[ent:GetClass()]
	self:SetHoldType("passive")
	self.Owner.CarryingProp = shoulderModel
	self.Owner.CarryingProp.NetData = CopyEntityNetworkVarsToTable(ent)


	-- Find the right shoulder bone
	local boneIndex = ply:LookupBone(mapping.bone) -- Replace with the correct bone name
	if not boneIndex then return end


	-- Get the bone's position and angles
	local bonePos, boneAng = ply:GetBonePosition(boneIndex)

	-- Convert the local position and angle to world space
	local worldPos,worldAng = LocalToWorld(mapping.entPos, mapping.entAng, self.Owner:GetPos(), self.Owner:EyeAngles())

		-- Apply the new position and angles to the model
	shoulderModel:SetPos(worldPos)
	shoulderModel:SetAngles(worldAng)
    -- Attach the model to the bone
    shoulderModel:FollowBone(ply, boneIndex)



	for k, v in pairs(mapping.playerBones) do
		if ply:LookupBone(k) != nil then
			ply:ManipulateBoneAngles( ply:LookupBone(k), v.ang, 0 )
		end
	end

	shoulderModel:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)

	self.Owner.Car_OldWalkSpeed = self.Owner:GetWalkSpeed()
	self.Owner.Car_OldRunSpeed = self.Owner:GetRunSpeed()


	local amount = 70
	self.Owner:SetWalkSpeed(amount)
	self.Owner:SetRunSpeed(amount)


end 

hook.Add("OnPlayerJump", "AOC_Carry_PreventJump", function(ply)
    if IsValid(ply.Carrying) then
        return false -- Prevent jumping by returning false
    end
end)
-- Prevent weapon switching if the player is restricted
hook.Add("PlayerSwitchWeapon", "AOC_Carry_PreventWeaponSwitch", function(ply, oldWeapon, newWeapon)
	--[[ if IsValid(ply.Carrying) then
        return true -- Prevent switching by returning true
    end ]]
end)

function SWEP:StopCarry(norag)
	if IsValid(self.Owner.Carrying) then





		if !norag then 

			-- Get player's position and eye angles
			local playerPos = self.Owner:GetPos()
			local playerAng = self.Owner:EyeAngles()
			local spawnPos = playerPos + (playerAng:Forward() * 50) + Vector(0, 0, 40)

			local carryPly = self.Owner.Carrying.Player
			local ragdoll = CreateDeathRagdoll(carryPly, spawnPos)
			self.Owner.Carrying.Player:Spectate( OBS_MODE_CHASE )
			self.Owner.Carrying.Player:SpectateEntity( ragdoll )
		end

		self.Owner.Carrying:Remove()
		self.Owner.Carrying = nil

		self.Owner.CarryingProp = nil

	end
	self.Owner.Carrying = nil

	if IsValid(self.Owner.CarryingProp) then
		
		if !norag then 

	

			local ent = ents.Create(self.Owner.CarryingProp:GetClass())
			ent:Spawn()
			ent:SetPos(self.Owner.CarryingProp:GetPos())
			ent:SetAngles(self.Owner.CarryingProp:GetAngles())
			

				ent:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR) -- No collision with players
				ent:CollisionRulesChanged() -- Apply changes

				ApplyNetworkVarsFromTable(ent, self.Owner.CarryingProp.NetData)
			
				timer.Simple(duration or 1.5, function()
					if IsValid(ent) then
						ent:SetCollisionGroup(COLLISION_GROUP_NONE) -- Restore normal collision
						ent:CollisionRulesChanged()
					end
				end)
		
		end

		self.Owner.CarryingProp:Remove()
		self.Owner.CarryingProp = nil

	end

	self.Owner:SetWalkSpeed(self.Owner.Car_OldWalkSpeed)
	self.Owner:SetRunSpeed(self.Owner.Car_OldRunSpeed)

	self:SetHoldType("normal")
	self:ResetAnimations()
end



function SWEP:PrimaryAttack()

	if not IsFirstTimePredicted() then return end
	--self:SetHoldType("passive")
	if SERVER then 



		local eyeTrace = self.Owner:GetEyeTrace()
		if eyeTrace.HitPos:DistToSqr(self.Owner:GetPos()) > 8000 then return end
		if !IsValid(eyeTrace.Entity) then return end
		local ent = eyeTrace.Entity

		if IsValid(ent.BodyOf) then
			if !IsValid(self.Owner.Carrying) then
				self:StartRagCarry(ent)
				ent:Remove()
			end
		end 
		
		if self.PropMapping[ent:GetClass()] then
			if IsEntityFrozen(ent) then return end
			if IsValid(self.Owner.CarryingProp) then return end
			self:StartPropCarry(ent)
			ent:Remove()
		end
	
	end 	
end




function SWEP:DoAnimation(anim)
	if AOCRP.Animation.FreeAnims[anim] then

		if AOCRP.Animation.FreeAnims[anim].bones then 
			for k, v in pairs(AOCRP.Animation.FreeAnims[anim].bones) do
				if self:GetOwner():LookupBone(k) != nil then
					self:GetOwner():ManipulateBoneAngles( self:GetOwner():LookupBone(k), v.ang, true )
				end
			end
			self.DoingAnimation = anim
		end

		if AOCRP.Animation.FreeAnims[anim].wosAnim then
			net.Start("AOCRP.Animation.DoWOS")
				net.WriteEntity(self:GetOwner())
				net.WriteString(AOCRP.Animation.FreeAnims[anim].wosAnim)
			net.SendPVS(self:GetOwner():GetPos())
		end

	end
end


function SWEP:SecondaryAttack() 
	if ((!IsFirstTimePredicted())) then return end


	if IsValid(self.Owner.Carrying) or IsValid(self.Owner.CarryingProp) then
		self:StopCarry()
		return
	end

	self:SetNextSecondaryFire(CurTime()+1)

	if SERVER then
		local anim = self:GetOwner():GetNetVar("AOCRP.Animation.Current", "salute")

		if self.DoingAnimation then
			if self.DoingAnimation != anim then
				self:ResetAnimations()
				self:DoAnimation(anim)
			else
				self:ResetAnimations()
			end
		else 
			--local anim = self:GetOwner():GetNetVar("AOCRP.Animation.Current", "salute")
			self:DoAnimation(anim)
		end
	end
end

function SWEP:Reload() 

end

function SWEP:PreDrawViewModel(vm, pl, wep)
  return true
end
function SWEP:OnRemove()
	self:ResetAnimations()
end

function SWEP:Holster(wep)
  if ((!IsFirstTimePredicted())) then return end


  if IsValid(self.Owner.Carrying) or IsValid(self.Owner.CarryingProp) then
	self:StopCarry()
  end
  
  self:ResetAnimations()
  return true
end

function SWEP:IsOwnerTooFast()
  return (self:GetOwner():GetAbsVelocity():Length() > 150)
end



if CLIENT then 
	AOCDerma:RegisterFont("AOCRP_Anim_Infobox", "Agency FB", 20, 1)
end 

local CMoveData = FindMetaTable("CMoveData")

function CMoveData:RemoveKeys(keys)
	-- Using bitwise operations to clear the key bits.
	local newbuttons = bit.band(self:GetButtons(), bit.bnot(keys))
	self:SetButtons(newbuttons)
end



function SWEP:Think()



	if IsValid(self.Owner.Carrying) then
		if IsValid(self.Owner.Carrying.Player) then
			if self.Owner.Carrying.Player:Alive() then
				self:StopCarry(true)
			end
		else
			self:StopCarry(true)
		end

		
	end

	if self.Drag and (not self.Owner:KeyDown(IN_ATTACK) or not IsValid(self.Drag.Entity)) then
		self.Drag = nil
	end

	if self.DoingAnimation then
		if self:IsOwnerTooFast() then
			self:ResetAnimations()
		end
	end

	if CLIENT then
		if gui.IsGameUIVisible() then return end
		--if scb.chatbox:IsVisible() then return end
		--if vgui.CursorVisible() then return end
		if input.IsKeyDown(KEY_R) then
			if input.IsKeyDown(KEY_LALT) then
				if !ValidPanel(AOCDerma.RMenu) then
					local RadialMenuData = {}

					if AOCRP.Animation.FreeAnims then
						for k, v in pairs(AOCRP.Animation.FreeAnims) do
							if v.gtmitem then
								if !AOCRP.GTM:HasItem(LocalPlayer(), v.gtmitem) then 
									continue 
								end
							end
							local favorite = tobool(cookie.GetNumber( "aoc_"..k, 0 ))
							if !favorite then 
								continue 
							end

							local animData = { name = v.name, func = function() LocalPlayer():ConCommand("aoc_animswep "..k) end }
							if v.wosAnim then 
								animData = { name = v.name, func = function() LocalPlayer():ConCommand("aoc_animation "..k) end }
							end
							table.insert(RadialMenuData, animData)
						end
					end

					AOCDerma:RadialMenu(RadialMenuData)
				end
				return 
			end
			    if !ValidPanel(AOCAnimationFrame) then
					if vgui.CursorVisible() then return end
					if AOCRP_DefaultFrameOpen then return end
					AOCAnimationFrame = AOCDerma:DefaultFrame()
					AOCAnimationFrame:SetSize(AOCW(300),AOCH(800))
					AOCAnimationFrame:Center()
					AOCAnimationFrame:SetNewTitle("Animationen")
					AOCAnimationFrame:SetSizable(false)
					AOCAnimationFrame:SetDraggable(false)

					local infoPanel = vgui.Create("DPanel", AOCAnimationFrame)
					infoPanel:Dock(TOP)
					infoPanel:SetTall(AOCH(70))

					function infoPanel:Paint(w,h)
						draw.DrawText("Auswählen, R loslassen und Linksklick\nRechtsklick auf Knöpfe zum Favorisieren\nALT+R für Favoritenrad", AOCDerma:Font("AOCRP_Anim_Infobox"), w/2, 0, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
					end 

					local scrollPanel = AOCDerma:ScrollBar(AOCAnimationFrame)
					scrollPanel:Dock(FILL)

					if AOCRP.Animation.FreeAnims then
						for k, v in pairs(AOCRP.Animation.FreeAnims) do

							local favorite = tobool(cookie.GetNumber( "aoc_"..k, 0 ))

							if !favorite then continue end 

							if v.gtmitem then
								if !AOCRP.GTM:HasItem(LocalPlayer(), v.gtmitem) then 
									continue 
								end
							end
							local anbtn = AOCDerma:Button(scrollPanel, v.name, function() 
							
								LocalPlayer():ConCommand("aoc_animswep "..k)
							
							end, "b")
							anbtn:Dock(TOP)

							function anbtn:PaintOver(w,h)
								if LocalPlayer():GetNetVar("AOCRP.Animation.Current", "salute") == k then
									self.akzent = Color(0,200,0,255)
									self.akzenthover = Color(0,255,0,255)
								else
									if favorite then 
										self.akzent = Color(255,196,0)
										self.akzenthover = Color(255,196,0)
									else
											self.akzent = Color(200,200,200,255)
											self.akzenthover = Color(255,255,255,255)	
									end				
								end
							end
							function anbtn:DoRightClick() 
								if favorite then
									cookie.Set( "aoc_"..k, 0 )
								else
									cookie.Set( "aoc_"..k, 1 )
								end
								favorite = tobool(cookie.GetNumber( "aoc_"..k, 0 ))
							end

						end
						for k, v in pairs(AOCRP.Animation.FreeAnims) do

							local favorite = tobool(cookie.GetNumber( "aoc_"..k, 0 ))

							if favorite then continue end  

							if v.gtmitem then
								if !AOCRP.GTM:HasItem(LocalPlayer(), v.gtmitem) then 
									continue 
								end
							end
							local anbtn = AOCDerma:Button(scrollPanel, v.name, function() 
							
								LocalPlayer():ConCommand("aoc_animswep "..k)
							
							end, "b")
							anbtn:Dock(TOP)

							function anbtn:PaintOver(w,h)
								if LocalPlayer():GetNetVar("AOCRP.Animation.Current", "salute") == k then
									self.akzent = Color(0,200,0,255)
									self.akzenthover = Color(0,255,0,255)
								else
									if favorite then 
										self.akzent = Color(255,196,0)
										self.akzenthover = Color(255,196,0)
									else
											self.akzent = Color(200,200,200,255)
											self.akzenthover = Color(255,255,255,255)	
									end				
								end
							end
							function anbtn:DoRightClick() 
								if favorite then
									cookie.Set( "aoc_"..k, 0 )
								else
									cookie.Set( "aoc_"..k, 1 )
								end
								favorite = tobool(cookie.GetNumber( "aoc_"..k, 0 ))
							end

						end
					end
				end
		else
			if ValidPanel(AOCAnimationFrame) then
				AOCAnimationFrame:Remove()
			end		
			if ValidPanel(AOCDerma.RMenu) then AOCDerma.RMenu:Remove() end
		end
	end
end

if SERVER then
	concommand.Add( "aoc_animswep", function( ply, cmd, args )

		if ply:GetNetVar("AOCRP.Animation.Current", "") == args[1] then return end
		
		if AOCRP.Animation.FreeAnims[args[1]] then

			if AOCRP.Animation.FreeAnims[args[1]].gtmitem then
				if !AOCRP.GTM:HasItem(ply, AOCRP.Animation.FreeAnims[args[1]].gtmitem) then 
					AOCRP.HUD:Notification(ply, {text="Du hast kein Zugriff auf diese Animation."}) 
					return 
				end 
			end 

			ply:SetNetVar("AOCRP.Animation.Current", args[1])
			--ply:ChatPrint("*** Animation auf '"..AOCRP.Animation.FreeAnims[args[1]].name .. "' gewechselt.")

			AOCRP.HUD:Notification(ply, {text="Animation auf '"..AOCRP.Animation.FreeAnims[args[1]].name .. "' gewechselt."}) 
		else 
			AOCRP.HUD:Notification(ply, {text="Diese Animation existiert nicht."}) 
		end
	end )

	concommand.Add( "aoc_animation", function( ply, cmd, args )

		
		if AOCRP.Animation.FreeAnims[args[1]] then

			if AOCRP.Animation.FreeAnims[args[1]].gtmitem then
				if !AOCRP.GTM:HasItem(ply, AOCRP.Animation.FreeAnims[args[1]].gtmitem) then 
					AOCRP.HUD:Notification(ply, {text="Du hast kein Zugriff auf diese Animation."}) 
					return 
				end 
			end 

			if AOCRP.Animation.FreeAnims[args[1]].wosAnim then
				net.Start("AOCRP.Animation.DoWOS")
					net.WriteEntity(ply)
					net.WriteString(AOCRP.Animation.FreeAnims[args[1]].wosAnim)
				net.SendPVS(ply:GetPos())

					
				ply:SetNetVar("AOCRP.Animation.Current", args[1])

			else 
				AOCRP.HUD:Notification(ply, {text="Diese Animation unterstützt das nicht."}) 
			end
		else 
			AOCRP.HUD:Notification(ply, {text="Diese Animation existiert nicht."}) 
		end
	end )

	util.AddNetworkString("AOCRP.Animation.DoWOS")
end


if CLIENT then 
	net.Receive( "AOCRP.Animation.DoWOS", function()

		local target = net.ReadEntity()
		local anim = net.ReadString()

		target:AddVCDSequenceToGestureSlot(GESTURE_SLOT_CUSTOM, target:LookupSequence(anim), 0, true)
	end )
end 
--addons/arccw_weapons/lua/weapons/aocrp_a180.lua:
AddCSLuaFile()

SWEP.Base = "arccw_masita_base"
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Slot = 2

SWEP.Category = "AOCRP - Eingestellte Waffen"
SWEP.Credits = "Kraken"
SWEP.PrintName = "A-187"
SWEP.Trivia_Class = "Blaster Pistol"
SWEP.Trivia_Desc = "The A-180 blaster, also known as the A180 pistol, was a modular blaster manufactured by BlasTech Industries. It was a highly versatile design with multiple configurations that could be easily reconfigured from a blaster pistol to a blaster rifle, a sniper rifle/longblaster, or an portable ion launcher depending on the situation."
SWEP.IconOverride = "entities/sopsmisc/a180.png"

-- Viewmodel properties
SWEP.UseHands = true
SWEP.ViewModel = "models/arccw/kraken/sops-v2/c_a180.mdl"
SWEP.WorldModel = "models/arccw/kraken/sops-v2/w_a180.mdl"
SWEP.ViewModelFOV = 58
SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos = Vector(-15, 7.5, -5),
    ang = Angle(-10, 0, 180)
}

-- Damage & Tracer
SWEP.BodyDamageMults =  {
    [HITGROUP_HEAD] = 2.5,
    [HITGROUP_CHEST] = 1.3,
    [HITGROUP_LEFTARM] = 0.9,
    [HITGROUP_RIGHTARM] = 0.9,
}

SWEP.Damage = 36
SWEP.RangeMin = 102
SWEP.DamageMin = 23
SWEP.Range = 306
SWEP.Penetration = 8
SWEP.DamageType = DMG_BULLET
SWEP.MuzzleVelocity = 800
SWEP.TraceNum = 1
SWEP.Tracer = "tracer_blue"
SWEP.TracerCol = Color(0, 0, 250)
SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 20

SWEP.Recoil = 0.64
SWEP.RecoilSide = 0.12
SWEP.RecoilRise = 0.65
SWEP.Delay = 60 / 302

SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 1
    },
    {
        Mode = 0
    },         
}

SWEP.AccuracyMOA = 0.5
SWEP.HipDispersion = 150
SWEP.MoveDispersion = 100

-- Sounds & Muzzleflash
SWEP.Primary.Ammo = "ar2"
SWEP.ShootVol = 50
SWEP.ShootPitch = 100
SWEP.ShootPitchVariation = 0.05

SWEP.FirstShootSound = "sops-v2/weapons/a180.wav"
SWEP.ShootSound = "sops-v2/weapons/a180.wav"
SWEP.ShootSoundSilenced = "sops-v2/weapons/silenced.mp3"

SWEP.NoFlash = nil
-- SWEP.MuzzleEffect = "wpn_muzzleflash_dc17"
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false
SWEP.MuzzleFlashColor = Color(0, 0, 250)

-- Ironsight & Holdtype
SWEP.IronSightStruct = {
    Pos = Vector(-6.126, -4.178, 3.4),
    Ang = Angle(0, 0, 0),
     Magnification = 1.3,
     SwitchToSound = "weapon_hand/ads/0242-00001a46.mp3",
     SwitchFromSound = "weapon_hand/ads/0242-00001a43.mp3",
     ViewModelFOV = 55,
}

SWEP.HoldtypeHolstered = "normal"
SWEP.HoldtypeActive = "pistol"
SWEP.HoldtypeSights = "revolver"
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL

SWEP.SprintPos = Vector(1, -6, -5)
SWEP.SprintAng = Angle(40, 0, 0)

SWEP.ActivePos = Vector(-2, 3, 3)
SWEP.ActiveAng = Angle(1, 0, 0)

SWEP.HolsterPos = Vector(0.532, -6, 0)
SWEP.HolsterAng = Angle(-4.633, 36.881, 0)

SWEP.CustomizePos = Vector(8, 0, 3)
SWEP.CustomizeAng = Angle(5, 30, 30)

-- Attachments
SWEP.AttachmentElements = {
    ["a180_barrele"] = {
        VMBodygroups = {{ind = 1, bg = 1}},
        AttPosMods = {
            [2] = {
                vpos = Vector(0.3, -0.5, 11),
            },
        }
    },
    ["a180_grip"] = {
        VMBodygroups = {
            {ind = 2, bg = 1},
        },
    },
}
SWEP.Attachments = {  
    {
        PrintName = "Energiemodus",
        DefaultAttName = "Standard",
        Slot = "aocrp_ammo",
    },   
    {
        PrintName = "Optic",
        DefaultAttName = "None",
        Slot = "optic",
        Bone = "a180",
        Offset = {
            vpos = Vector(0.3, -1, 0),
            vang = Angle(90, 0, -90),
        },
        CorrectiveAng = Angle(0, 0, 0),
        CorrectivePos = Vector(0, 0, -0.025),
    },  
    {
        PrintName = "Muzzle",
        DefaultAttName = "None",
        Slot = {"muzzle", "cr2_muzzle", "cr2c_muzzle", "stealth_muzzle", "b1120_muzzle"},
        Bone = "a180",
        Offset = {
            vpos = Vector(0.3, -0.5, 9),
            vang = Angle(90, 0, 0),

        },
    },  
    {
        PrintName = "Tactical",
        DefaultAttName = "None",
        Slot = {"tactical", "tac_pistol", "tac"},
        VMScale = Vector(0.8, 0.8, 0.8),
        Bone = "a180",
        Offset = {
            vpos = Vector(0.5, -0.5, 5),
            vang = Angle(90, 0, 0),
        },
    },  
    {
        PrintName = "Grip",
        Slot = "grip",
        DefaultAttName = "Standard Grip"
    },
    {
        PrintName = "Barrel",
        DefaultAttName = "None",
        Slot = "a180_barrele",
    },    
    {
        PrintName = "Grip",
        DefaultAttName = "None",
        Slot = "a180_grip",

    },  
    {
        PrintName = "Charm",
        DefaultAttName = "None",
        Slot = {"charm"},
        Bone = "a180",
        VMScale = Vector(0.6, 0.6, 0.6),
        Offset = {
            vpos = Vector(1, -0.9, -1.4),
            vang = Angle(90, 0, -90),
        },
    },       
    {
        PrintName = "Killcounter",
        DefaultAttName = "None",
        Slot = {"killcounter"},
        Bone = "a180",
        Offset = {
            vpos = Vector(0.9, -0.5, 1),
            vang = Angle(90, 0, -90),
        },
    },     
}

-- Don't touch this unless you know what you're doing
SWEP.Animations = {
    ["idle"] = {
        Source = "idle"
    },
    ["fire"] = {
        Source = "shoot",
    },
    ["draw"] = {
        Source = "draw",
        SoundTable = {
            {
                s = "sops-v2/interaction/equip.wav",
                p = 100, 
                v = 75, 
                t = 0.1,
                c = CHAN_ITEM,
            },
        }
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = {
            {
                s = "sops-v2/interaction/equip2.wav",
                p = 100, 
                v = 75, 
                t = 0.1,
                c = CHAN_ITEM,
            },
        }
    },
    ["reload"] = {
        Source = "reload",
        LHIK = true,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {s = "everfall/weapons/miscellaneous/reload/overheat/overheat_manualcooling_var_02.mp3", t = 0.1/30},
            {s = "everfall/weapons/miscellaneous/reload/reset/overheatactivecoolingsuccess_var_04.mp3", t = 1.20},
        },
    },
}


-- AOCRP WAFFENSTATS 02.06.2024
SWEP.Damage = 36
SWEP.DamageMin = 23
SWEP.RangeMin = 102
SWEP.Range = 306
SWEP.Delay = 60 / 302
SWEP.Primary.ClipSize = 20
SWEP.Category = 'REP'


--addons/arccw_weapons/lua/weapons/aocrp_dc17.lua:
AddCSLuaFile()

SWEP.Base = "arccw_masita_base"
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Slot = 2

-- Trivia
SWEP.Category = "AOCRP - Eingestellte Waffen"
SWEP.Credits = "Kraken/Masita"
SWEP.PrintName = "DC-17"
SWEP.Trivia_Class = "Blaster Pistol"
SWEP.Trivia_Desc = "The DC-17 hand blaster, also known as DC-17 blaster pistol, was a heavy blaster pistol wielded by the clone troopers of the Grand Army of the Galactic Republic during the Clone Wars. An advanced firearm, it was fielded to elite soldiers in the army, most notably Advanced Recon Commandos, clone trooper commanders, and clone jet troopers."
SWEP.Trivia_Manufacturer = "BlasTech Industries"
SWEP.Trivia_Calibre = "Tibanna Gas"
SWEP.Trivia_Year = 2023
SWEP.IconOverride = "entities/masita/dc17.png"

SWEP.UseHands = true
SWEP.MirrorVMWM = true
SWEP.NoHideLeftHandInCustomization = true

SWEP.ViewModel = "models/venator/weapons/viewmodels/c_dc17.mdl"
SWEP.WorldModel = "models/venator/weapons/worldmodels/w_dc-17.mdl"
SWEP.ViewModelFOV = 58
SWEP.WorldModelOffset = {
    pos = Vector(-11.3, 4.3, -3),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
}

SWEP.Damage = 30
SWEP.RangeMin = 390
SWEP.DamageMin = 15
SWEP.Range = 1075
SWEP.Penetration = 1
SWEP.DamageType = DMG_BULLET
SWEP.MuzzleVelocity = 400

SWEP.TraceNum = 1
SWEP.PhysTracerProfile = 1

SWEP.TracerNum = 1
SWEP.Tracer = "tracer_blue"
SWEP.TracerCol = Color(0, 0, 255)
SWEP.HullSize = 1.5

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 20

SWEP.Recoil = 0.98
SWEP.RecoilPunch = 0.8
SWEP.RecoilSide = 0.17
SWEP.RecoilRise = 0.24

SWEP.Delay = 60 / 325
SWEP.Num = 1
SWEP.Firemodes = {
	{
		Mode = 1
	},
    {
		Mode = -2
	},
    {
        Mode = 0
    },
}

SWEP.AccuracyMOA = 0.22 
SWEP.HipDispersion = 530
SWEP.MoveDispersion = 50

SWEP.NoFlash = nil
-- SWEP.MuzzleEffect = "wpn_muzzleflash_dc17"
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false
SWEP.MuzzleFlashColor = Color(0, 0, 255)

---- Ironsight
SWEP.IronSightStruct = {
    Pos = Vector(-3.922, -4.125, 0.237),
    Ang = Vector(0.158, -3.961, 0),
     Magnification = 1.2,
     SwitchToSound = "armasclasicas/wpn_cis_medequip.wav",
     ViewModelFOV = 50,
}

SWEP.Primary.Ammo = "ar2"

-- Sound & Holdtype
SWEP.ShootVol = 50
SWEP.ShootPitch = 100
SWEP.ShootPitchVariation = 0.05

SWEP.FirstShootSound = "armas/disparos/dc17_2.wav"
SWEP.ShootSound = "armas/disparos/dc17_1.wav"
SWEP.ShootSoundSilenced = "armas/disparos/dc19.wav"

SWEP.HoldtypeHolstered = "normal"
SWEP.HoldtypeActive = "pistol"
SWEP.HoldtypeSights = "revolver"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL

SWEP.ActivePos = Vector(1, 6, 1)
SWEP.ActiveAng = Angle(-3.2, -3, 0)

SWEP.SprintPos = Vector(1, -6, -10)
SWEP.SprintAng = Angle(40, 0, 0)

SWEP.HolsterPos = Vector(4, -3, 2)
SWEP.HolsterAng = Vector(-15, 30, -15)

SWEP.CustomizePos = Vector(10, 0, -1.08)
SWEP.CustomizeAng = Angle(6.8, 30.7, 10.3)



SWEP.Attachments = {
    {
        PrintName = "Energiemodus",
        DefaultAttName = "Standard",
        Slot = "aocrp_ammo",
    },  
    {
        PrintName = "Sight", 
        DefaultAttName = "Standard", 
        Slot = "optic",
        Bone = "DC-17",
        Offset = {
            vpos = Vector(0, -2.3, 0),
            vang = Angle(90, 0, -90),
        },
        CorrectiveAng = Angle(9, 0, 0),
        CorrectivePos = Vector(0, 0, 0),
    },  
    {
        PrintName = "Tactical",
        DefaultAttName = "None",
        Slot = {"tactical", "tac_pistol", "tac"},
        WMScale = Vector(0.7, 0.7, 0.7),
        VMScale = Vector(0.7, 0.7, 0.7),
        Bone = "DC-17",
        Offset = {
            vpos = Vector(0, -0.3, 2.7),
            vang = Angle(90, 0, -90),
        },
    },     
    {
        PrintName = "Muzzle", 
        DefaultAttName = "None", 
        Slot = {"muzzle", "cr2_muzzle", "cr2c_muzzle", "stealth_muzzle"},
        Bone = "DC-17",
        Offset = {
            vpos = Vector(0, -1.2, 3.442),
            vang = Angle(90, 0, -90),
        },
    },      
    {
        PrintName = "Charm",
        DefaultAttName = "None",
        Slot = {"charm"},
        VMScale = Vector(0.7,0.7,0.7),
        Bone = "DC-17",
        Offset = {
            vpos = Vector(0.7, -0.848, 0.184),
            vang = Angle(90, 0, -90),
        },
    },    
    {
        PrintName = "Killcounter",
        DefaultAttName = "None",
        Slot = {"killcounter"},
        Bone = "DC-17",
        Offset = {
            vpos = Vector(0.7, -0.848, -3),
            vang = Angle(90, 0, -90),
        },
    },   
}


SWEP.Animations = {
    ["idle"] = {
        Source = false,
    },
    ["fire"] = {
        Source = "fire"
    },
    ["fire_iron"] = {
        Source = false,
    },
    ["draw"] = {
        Source = "draw",
        SoundTable = {
            {
                s = "draw/gunfoley_pistol_draw_var_06.mp3", -- sound; can be string or table
                p = 100, -- pitch
                v = 75, -- volume
                t = 0, -- time at which to play relative to Animations.Time
                c = CHAN_ITEM, -- channel to play the sound
            },
        }
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = {
            {
                s = "holster/gunfoley_pistol_sheathe_var_09.mp3", -- sound; can be string or table
                p = 100, -- pitch
                v = 75, -- volume
                t = 0, -- time at which to play relative to Animations.Time
                c = CHAN_ITEM, -- channel to play the sound
            },
        }
    },
    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
        SoundTable = {
            {s = "dc17_1", t = 1 / 60}, --s sound file
        },
    },


sound.Add({
    name =          "dc17_1",
    channel =       CHAN_ITEM,
    volume =        1.0,
    sound =             "armasclasicas/wpn_wristrocket_reload.wav"
    }),
}


-- AOCRP WAFFENSTATS 02.06.2024
SWEP.Damage = 30
SWEP.DamageMin = 15
SWEP.RangeMin = 390
SWEP.Range = 1075
SWEP.Delay = 60 / 325
SWEP.Primary.ClipSize = 20
SWEP.Category = 'REP'
--addons/arccw_weapons/lua/weapons/aocrp_e22.lua:
AddCSLuaFile()

SWEP.Base = "arccw_meeks_sw_base"
SWEP.Spawnable = true
SWEP.Category = "AOCRP - Eingestellte Waffen"
SWEP.Credits = { Author1 = "cat"}
SWEP.PrintName = "E-22"
SWEP.Trivia_Class = "Blaster Carbine"
SWEP.Trivia_Desc = ""
SWEP.Trivia_Manufacturer = "BlasTech Industries"
SWEP.Trivia_Calibre = "Medium Density Bolt"
SWEP.Trivia_Mechanism = "Energized Compressed Tibanna"
SWEP.Trivia_Country = "GAR"
SWEP.Trivia_Year = 2020

SWEP.Slot = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/arccw/bf2017/c_e11.mdl"
SWEP.WorldModel = "models/arccw/masita/rising/w_e22.mdl"
SWEP.ViewModelFOV = 70
SWEP.HideViewmodel = true
--[[ SWEP.WorldModelOffset = {
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1
} ]]


SWEP.DefaultBodygroups = "000000000000"

SWEP.Damage = 66
SWEP.RangeMin = 300
SWEP.DamageMin = 33
SWEP.Range = 3000
SWEP.Penetration = 1
SWEP.DamageType = DMG_BULLET
SWEP.MuzzleVelocity = 400


SWEP.TraceNum = 1
SWEP.PhysTracerProfile = 1

SWEP.TracerNum = 1
SWEP.Tracer = "tfa_tracer_blue"
SWEP.TracerCol = Color(0, 0, 255)
SWEP.HullSize = 1.5

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 102

SWEP.Recoil = 0.5
SWEP.RecoilSide = 0.2
SWEP.RecoilRise = 0.18

SWEP.Delay = 60 / 333
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = -2
    },
    {
        Mode = 1
    }, 
    {
        Mode = 0
    },         
}

SWEP.AccuracyMOA = 0.52 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 530 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 50

SWEP.NoFlash = nil -- disable light flash
-- SWEP.MuzzleEffect = "wpn_muzzleflash_dc17"
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false --
SWEP.MuzzleFlashColor = Color(0, 0, 255)


----AMMO / stuff----

SWEP.Primary.Ammo = "ar2"

SWEP.ShootVol = 100
SWEP.ShootPitch = 100

SWEP.ShootSound = "weapons/empire_e_series/e22/main/e22.wav"
SWEP.ShootSoundSilenced = "w/dc19.wav"

SWEP.IronSightStruct = {
    Pos = Vector(-3.201, -5.321, 2.319),
    Ang = Angle(0, 0, 0),
     Magnification = 1,
     SwitchToSound = "zoom_in/gunfoley_zoomin_blasterheavy_05.mp3",
     ViewModelFOV = 55,
}


SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(4, -3, -2)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(3, 0, 0)
SWEP.SprintAng = Angle(-10, 40, -40)

SWEP.HolsterPos = Vector(4, -3, 2)
SWEP.HolsterAng = Vector(-15, 30, -15)

SWEP.CustomizePos = Vector(20.824, -4, -4.897)
SWEP.CustomizeAng = Angle(12.149, 30.547, 0)

SWEP.DefaultElements = {"dp24", "muzzle"}

SWEP.AttachmentElements = {
    ["dp24"] = {
        VMElements = {
            {
                Model = "models/arccw/masita/rising/w_e22.mdl",
                Bone = "v_e11_reference001",
                Scale = Vector(1.2, 1.2, 1.2),
                Offset = {
                    pos = Vector(-2.5, 7, 3),
                    ang = Angle(0,0, 0)
                }
            }
        }
    },
    ["muzzle"] = {
         VMElements = {
            {
                Model = "models/hunter/plates/plate.mdl",
                Bone = "e11_sight",
                Scale = Vector(0, 0, 0),                
                Offset = {
                    pos = Vector(-0.8, 4, 12),
                    ang = Angle(90, 0, 0)
                },
                IsMuzzleDevice = true
            }
        },
        WMElements = {
            {
                Model = "models/hunter/plates/plate.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(0,0,0),
                Offset = {
                    pos = Vector(23, 1, -7),
                    ang = Angle(-12, 0, 180)
                },
                IsMuzzleDevice = true
            },            
        }, -- change the world model to something else. Please make sure it's compatible with the last one.
    }
}
--[[ 
WMOverride = "models/arccw/masita/rising/w_e22.mdl" ]]

SWEP.Attachments = {
    {
        PrintName = "Energiemodus",
        DefaultAttName = "Standard",
        Slot = "aocrp_ammo",
    },  
    {
        PrintName = "Optic", -- print name
        DefaultAttName = "Iron Sights", -- used to display the "no attachment" text
        Slot = "optic",

        Bone = "e11_sight", -- relevant bone any attachments wwill be mostly referring to
        Offset = {
            vpos = Vector(-0.1, -0.6, 0),
            vang = Angle(90, 0, -90),
            wpos = Vector(4, 1.5, -4.9),
            wang = Angle(-10, 2, -180)
        },
    },  
    {
        PrintName = "Tactical", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"tactical","tac_pistol"},
        NoWM = true,
        Bone = "e11_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.6, 3.3, 15),
            vang = Angle(90, 0, 0),
            wpos = Vector(2200, 120, -700),
            wang = Angle(-15, 0, -90)
        },
    },    
    {
        PrintName = "Foregrip", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = "foregrip",
        NoWM = true,
        Bone = "e11_sight", -- relevant bone any attachments wwill be mostly referring to
        Offset = {
            vpos = Vector(0, 3, 15),
            vang = Angle(90, 0, -90),
        },
        SlideAmount = {
        vmin = Vector(-0.2, 4, 10),
        vmax = Vector(-0.2, 4, 16),
        },          
    },      
    {
        PrintName = "Charms", -- print name
        DefaultAttName = "No Charm", -- used to display the "no attachment" text
        Slot = {"charm"},
        Bone = "e11_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(1, 2.5, 7),
            vang = Angle(90, 0, -90),
            wpos = Vector(11.2,2, -3.6),
            wang = Angle(0 , 0, 180)
        },
    },          
    {
        PrintName = "Killcounter", -- print name
        DefaultAttName = "None", -- used to display the "no attachment" text
        Slot = {"killcounter"},
        NoWM = true,
        Bone = "e11_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(1, 1.2, 7),
            vang = Angle(90, 0, -90),
            wpos = Vector(1400, 150, -500),
            wang = Angle(-15 , 0, 180)
        },
    },   
}   

SWEP.Animations = {
    ["idle"] = {
        Source = "idle"
    },
    ["fire"] = {
        Source = "fire"
    },
    ["draw"] = {
        Source = "draw",
        Mult = 1.4,
        SoundTable = {
            {
                s = "w/dc15s/overheat_manualcooling_resetfoley_generic_var_01.mp3", -- sound; can be string or table
                p = 100, -- pitch
                v = 75, -- volume
                t = 0, -- time at which to play relative to Animations.Time
                c = CHAN_ITEM, -- channel to play the sound
            },
        }
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = {
            {
                s = "w/dc15s/gunfoley_blaster_sheathe_var_03.mp3", -- sound; can be string or table
                p = 100, -- pitch
                v = 75, -- volume
                t = 0, -- time at which to play relative to Animations.Time
                c = CHAN_ITEM, -- channel to play the sound
            },
        }
    },
    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1, 
        SoundTable = {
            {s = "ArcCW_e22.reload2", t = 4 / 30}, --s sound file
        },
    },


sound.Add({
    name =          "ArcCW_e22.reload2",
    channel =       CHAN_ITEM,
    volume =        1.0,
    sound =             "weapons/empire_e_series/e22/rifles.wav"
    }),
}


-- AOCRP WAFFENSTATS 02.06.2024
SWEP.Damage = 50
SWEP.DamageMin = 33
SWEP.RangeMin = 300
SWEP.Range = 3000
SWEP.Delay = 60 / 333
SWEP.Primary.ClipSize = 40
SWEP.Category = 'REP'
--addons/arccw_weapons/lua/weapons/aocrp_sb2.lua:
AddCSLuaFile()

SWEP.Base = "arccw_masita_base"
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Category = "REP"
SWEP.Credits = "Kraken/Masita"
SWEP.PrintName = "SB-2"
SWEP.Trivia_Class = "Blaster Heavy Shotgun"
SWEP.Trivia_Desc = "The SB-2 was a type of blaster that could pierce through enemy defenses. It was used by the Grand Army of the Republic's clone troopers during the Clone Wars between the Galactic Republic and the Confederacy of Independent Systems. The DP-23 fired blue blaster bolts, and had a ridged barrel with a pointed muzzle, a black stock, and a small foregrip."
SWEP.Trivia_Manufacturer = "Unknown"
SWEP.Trivia_Calibre = "Tibanna Gas"
SWEP.Trivia_Year = 2023
SWEP.IconOverride = "entities/masita/sb2.png"

SWEP.Slot = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/servius/weapons/viewmodels/c_sb-2.mdl"
SWEP.WorldModel = "models/servius/weapons/worldmodels/w_sb-2.mdl"
SWEP.ViewModelFOV = 55
SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos = Vector(-5, 5, -6),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
}

SWEP.DefaultBodygroups = "000000000000"

SWEP.BodyDamageMults =  {
    [HITGROUP_HEAD] = 1.5,
    [HITGROUP_CHEST] = 1.5,
    [HITGROUP_LEFTARM] = 0.9,
    [HITGROUP_RIGHTARM] = 0.9,
}

SWEP.Damage = 50
SWEP.NoLastCycle = true
SWEP.ManualAction = true
SWEP.ShotgunReload = true
SWEP.RangeMin = 50
SWEP.DamageMin = 17
SWEP.Range = 100
SWEP.Penetration = 1
SWEP.DamageType = DMG_BUCKSHOT
SWEP.MuzzleVelocity = 400

SWEP.TraceNum = 1
SWEP.PhysTracerProfile = 1

SWEP.TracerNum = 1
SWEP.Tracer = "tracer_blue"
SWEP.TracerCol = Color(0, 0, 255)
SWEP.HullSize = 1.5

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 12

SWEP.Recoil = 2
SWEP.RecoilSide = 2
SWEP.RecoilPunch = 0.9
SWEP.RecoilRise = 0.9

SWEP.Delay = 10/30
SWEP.Num = 5
SWEP.Firemodes = {
	{
		Mode = 1
	},
    {
        Mode = 0
    },
}

SWEP.AccuracyMOA = 50 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 450 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 100

SWEP.NoFlash = nil -- disable light flash
SWEP.MuzzleEffect = "wpn_muzzleflash_dc17"
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false
SWEP.MuzzleFlashColor = Color(0, 0, 255)


----AMMO / stuff----

SWEP.Primary.Ammo = "ar2"

SWEP.ShootVol = 100
SWEP.ShootPitch = 100

SWEP.ShootSound = "armas/disparos/sb2.wav"
SWEP.ShootSoundSilenced = "armas/disparos/silenced_sniper.mp3"

SWEP.IronSightStruct = {
    Pos = Vector(-3.724, -3.964, 2.733),
    Ang = Vector(0, 0, 3),
     Magnification = 1.2,
     SwitchToSound = "weapon_hand/ads/0242-00001a46.mp3",
     SwitchFromSound = "weapon_hand/ads/0242-00001a43.mp3",
     ViewModelFOV = 50,
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "shotgun"
SWEP.HoldtypeSights = "smg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN

SWEP.ActivePos = Vector(-1, 4, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(.5, -6, -12)
SWEP.SprintAng = Angle(40, 0, 0)

SWEP.HolsterPos = Vector(4, -3, 2)
SWEP.HolsterAng = Vector(-15, 30, -15)

SWEP.CustomizePos = Vector(20.824, -3, 3.897)
SWEP.CustomizeAng = Angle(12.149, 50.547, 45)

SWEP.Attachments = {
    {
        PrintName = "Energiemodus",
        DefaultAttName = "Standard",
        Slot = "aocrp_ammo",
    },  
    {
        PrintName = "Sight", 
        DefaultAttName = "Standard",
        Slot = "optic",
        Bone = "w_sb2",
        Offset = {
            vpos = Vector(0.261, 0.523, 2.338),
            vang = Angle(0, -90, 0),
        },
        CorrectiveAng = Angle(0, 180, 0),
        CorrectivePos = Vector(0, 0, 0),
    }, 
    {
        PrintName = "Tactical", 
        DefaultAttName = "None",
        Slot = {"tactical","tac_pistol"},
        Bone = "w_sb2", 
        Offset = {
            vpos = Vector(0.894, 8.522, 1.233),
            vang = Angle(0, -90, 90),
        },
    },    
    {
        PrintName = "Muzzle", 
        DefaultAttName = "None",
        Slot = {"muzzle", "cr2_muzzle", "cr2c_muzzle", "stealth_muzzle"},
        Bone = "w_sb2",
        Offset = {
            vpos = Vector(0.2, 15.5, 1.1),
            vang = Angle(0, -90, 0),
        },
    },    
    {
        PrintName = "Charm",
        DefaultAttName = "None", 
        Slot = {"charm"},
        Bone = "w_sb2", 
        Offset = {
            vpos = Vector(0.796, -0.996, 1.276),
            vang = Angle(0, -90, 0),
        },
    },          
}
SWEP.Animations = {
    ["idle"] = {
        Source = "neutral"
    },
    ["fire"] = {
        Source = "shoot",
    },
    ["cycle"] = {
        Source = "pump",
        Time = 0.9,
        SoundTable = {
            {s = "armas/disparos/sb2_pump.wav", t = 0.1 / 30}, 
        },
    },
    ["draw"] = {
        Source = "draw",
        Mult = 1.4,
        SoundTable = {
            {
                s = "draw/gunfoley_blaster_draw_var_10.mp3",
                p = 100, 
                v = 75, 
                t = 0,
                c = CHAN_ITEM,
            },
        }
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = {
            {
                s = "w/dc15s/gunfoley_blaster_sheathe_var_03.mp3", -- sound; can be string or table
                p = 100, -- pitch
                v = 75, -- volume
                t = 0, -- time at which to play relative to Animations.Time
                c = CHAN_ITEM, -- channel to play the sound
            },
        }
    },
    ["sgreload_start"] = {
        Source = "reload_start",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        SoundTable = {
			{s = "everfall/weapons/handling/misc_handling/hard_pickups/023d-0000106a.mp3", 	t = 0/30},
			{s = "weapons/fesiugmw2/foley/wpfoly_winchester_reload_loop_v1.wav", 	t = 14/30},
		},
    },
    ["sgreload_insert"] = {
        Source = "reload_insert",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        SoundTable = {{s = "everfall/weapons/handling/reload_shells/heavy_shells/023d-00000777.mp3", 		t = 3/30}},
        RestoreAmmo = 1,
    },
    ["sgreload_finish"] = {
        Source = {"reload_finish"},
        SoundTable = {{s = "armas/disparos/sb2_pump.wav", 		t = 8/30}},
    },


sound.Add({
    name =          "ArcCW_dc15a.reload2",
    channel =       CHAN_ITEM,
    volume =        1.0,
    sound =             "weapons/bf3/heavy.wav"
    }),
}
--addons/arccw_base_modified/lua/weapons/arccw_base/cl_lhik.lua:
local function qerp(delta, a, b)
    local qdelta = -(delta ^ 2) + (delta * 2)

    qdelta = math.Clamp(qdelta, 0, 1)

    return Lerp(qdelta, a, b)
end

SWEP.LHIKAnimation_IsIdle = false
SWEP.LHIKAnimation = nil
SWEP.LHIKAnimationStart = 0
SWEP.LHIKAnimationTime = 0

SWEP.LHIKCamAng = Angle(0, 0, 0)
SWEP.LHIKGunAng = Angle(0, 0, 0)

function SWEP:DoLHIKAnimation(key, time, spbitch)
    if !IsValid(self:GetOwner()) then return end

    if game.SinglePlayer() and !spbitch then
        timer.Simple(0, function() if IsValid(self) then self:DoLHIKAnimation(key, time, true) end end)
        return
    end

    local vm = self:GetOwner():GetViewModel()
    if !IsValid(vm) then return end

    local lhik_model
    local lhik_anim_model
    local LHIK_GunDriver
    local LHIK_CamDriver
    local offsetang

    local tranim = self:GetBuff_Hook("Hook_LHIK_TranslateAnimation", key)

    key = tranim or key

    for i, k in pairs(self.Attachments) do
        if !k.Installed then continue end
        if !k.VElement then continue end

        if self:GetBuff_Stat("LHIK", i) then
            lhik_model = k.VElement.Model
            lhik_anim_model = k.GodDriver and k.GodDriver.Model or false
            offsetang = k.VElement.OffsetAng

            if self:GetBuff_Stat("LHIK_GunDriver", i) then
                LHIK_GunDriver = self:GetBuff_Stat("LHIK_GunDriver", i)
            end

            if self:GetBuff_Stat("LHIK_CamDriver", i) then
                LHIK_CamDriver = self:GetBuff_Stat("LHIK_CamDriver", i)
            end
        end
    end

    if !IsValid(lhik_model) then return false end

    local seq = lhik_model:LookupSequence(key)

    if !seq then return false end
    if seq == -1 then return false end

    lhik_model:ResetSequence(seq)
    if IsValid(lhik_anim_model) then
        lhik_anim_model:ResetSequence(seq)
    end

    if !time or time < 0 then time = lhik_model:SequenceDuration(seq) end

    self.LHIKAnimation = seq
    self.LHIKAnimationStart = UnPredictedCurTime()
    self.LHIKAnimationTime = time

    self.LHIKAnimation_IsIdle = false

    if IsValid(lhik_anim_model) and LHIK_GunDriver then
        local att = lhik_anim_model:LookupAttachment(LHIK_GunDriver)
        local ang = lhik_anim_model:GetAttachment(att).Ang
        local pos = lhik_anim_model:GetAttachment(att).Pos

        self.LHIKGunAng = lhik_anim_model:WorldToLocalAngles(ang) - Angle(0, 90, 90)
        self.LHIKGunPos = lhik_anim_model:WorldToLocal(pos)

        self.LHIKGunAngVM = vm:WorldToLocalAngles(ang) - Angle(0, 90, 90)
        self.LHIKGunPosVM = vm:WorldToLocal(pos)
    end

    if IsValid(lhik_anim_model) and LHIK_CamDriver then
        local att = lhik_anim_model:LookupAttachment(LHIK_CamDriver)
        local ang = lhik_anim_model:GetAttachment(att).Ang

        self.LHIKCamOffsetAng = offsetang
        self.LHIKCamAng = lhik_anim_model:WorldToLocalAngles(ang)
    end

    -- lhik_model:SetCycle(0)
    -- lhik_model:SetPlaybackRate(dur / time)

    return true
end

SWEP.LHIKDelta = {}
SWEP.LHIKDeltaAng = {}
SWEP.ViewModel_Hit = Vector(0, 0, 0)
SWEP.Customize_Hide = 0

function SWEP:GetLHIKAnim()
    local cyc = (UnPredictedCurTime() - self.LHIKAnimationStart) / self.LHIKAnimationTime

    if cyc > 1 then return nil end
    if self.LHIKAnimation_IsIdle then return nil end

    return self.LHIKAnimation
end

function SWEP:DoLHIK()
    if !IsValid(self:GetOwner()) then return end

    local justhide = false
    local lhik_model = nil
    local lhik_anim_model = nil
    local hide_component = false
    local delta = 1

    local vm = self:GetOwner():GetViewModel()

    if !ArcCW.ConVars["reloadincust"]:GetBool() and !self.NoHideLeftHandInCustomization and !self:GetBuff_Override("Override_NoHideLeftHandInCustomization") then
        if self:GetState() == ArcCW.STATE_CUSTOMIZE then
            self.Customize_Hide = math.Approach(self.Customize_Hide, 1, FrameTime() / 0.25)
        else
            self.Customize_Hide = math.Approach(self.Customize_Hide, 0, FrameTime() / 0.25)
        end
    end

    for i, k in pairs(self.Attachments) do
        if !k.Installed then continue end
        -- local atttbl = ArcCW.AttachmentTable[k.Installed]

        -- if atttbl.LHIKHide then
        if self:GetBuff_Stat("LHIKHide", i) then
            justhide = true
        end

        if !k.VElement then continue end

        -- if atttbl.LHIK then
        if self:GetBuff_Stat("LHIK", i) then
            lhik_model = k.VElement.Model
            if k.GodDriver then
                lhik_anim_model = k.GodDriver.Model
            end
        end
    end

    if self.LHIKTimeline then
        local tl = self.LHIKTimeline

        local stage, next_stage, next_stage_index

        for i, k in pairs(tl) do
            if !k or !k.t then continue end
            if k.t + self.LHIKStartTime > UnPredictedCurTime() then
                next_stage_index = i
                break
            end
        end

        if next_stage_index then
            if next_stage_index == 1 then
                -- we are on the first stage.
                stage = {t = 0, lhik = 0}
                next_stage = self.LHIKTimeline[next_stage_index]
            else
                stage = self.LHIKTimeline[next_stage_index - 1]
                next_stage = self.LHIKTimeline[next_stage_index]
            end
        else
            stage = self.LHIKTimeline[#self.LHIKTimeline]
            next_stage = {t = self.LHIKEndTime, lhik = self.LHIKTimeline[#self.LHIKTimeline].lhik}
        end

        local local_time = UnPredictedCurTime() - self.LHIKStartTime

        local delta_time = next_stage.t - stage.t
        delta_time = (local_time - stage.t) / delta_time

        delta = qerp(delta_time, stage.lhik, next_stage.lhik)

        if lhik_model and IsValid(lhik_model) then
            local key

            if stage.lhik > next_stage.lhik then
                key = "in"
            elseif next_stage.lhik > stage.lhik then
                key = "out"
            end

            if key then
                local tranim = self:GetBuff_Hook("Hook_LHIK_TranslateAnimation", key)

                key = tranim or key

                local seq = lhik_model:LookupSequence(key)

                if seq and seq > 0 then
                    lhik_model:SetSequence(seq)
                    lhik_model:SetCycle(delta)
                    if lhik_anim_model then
                        lhik_anim_model:SetSequence(seq)
                        lhik_anim_model:SetCycle(delta)
                    end
                end
            end
        end

        -- if tl[4] <= UnPredictedCurTime() then
        --     -- it's over
        --     delta = 1
        -- elseif tl[3] <= UnPredictedCurTime() then
        --     -- transition back to 1
        --     delta = (UnPredictedCurTime() - tl[3]) / (tl[4] - tl[3])
        --     delta = qerp(delta, 0, 1)

        --     if lhik_model and IsValid(lhik_model) then
        --         local key = "out"

        --         local tranim = self:GetBuff_Hook("Hook_LHIK_TranslateAnimation", key)

        --         key = tranim or key

        --         local seq = lhik_model:LookupSequence(key)

        --         if seq and seq > 0 then
        --             lhik_model:SetSequence(seq)
        --             lhik_model:SetCycle(delta)
        --         end
        --     end
        -- elseif tl[2] <= UnPredictedCurTime() then
        --     -- hold 0
        --     delta = 0
        -- elseif tl[1] <= UnPredictedCurTime() then
        --     -- transition to 0
        --     delta = (UnPredictedCurTime() - tl[1]) / (tl[2] - tl[1])
        --     delta = qerp(delta, 1, 0)

        --     if lhik_model and IsValid(lhik_model) then
        --         local key = "in"

        --         local tranim = self:GetBuff_Hook("Hook_LHIK_TranslateAnimation", key)

        --         key = tranim or key

        --         local seq = lhik_model:LookupSequence(key)

        --         if seq and seq > 0 then
        --             lhik_model:SetSequence(seq)
        --             lhik_model:SetCycle(delta)
        --         end
        --     end
    else
        -- hasn't started yet
        delta = 1
    end

    if delta == 1 and self.Customize_Hide > 0 then
        if !lhik_model or !IsValid(lhik_model) then
            justhide = true
            delta = math.min(self.Customize_Hide, delta)
        else
            hide_component = true
        end
    end

    if justhide then
        for _, bone in pairs(ArcCW.LHIKBones) do
            local vmbone = vm:LookupBone(bone)

            if !vmbone then continue end -- Happens when spectating someone prolly

            local vmtransform = vm:GetBoneMatrix(vmbone)

            if !vmtransform then continue end -- something very bad has happened

            local vm_pos = vmtransform:GetTranslation()
            local vm_ang = vmtransform:GetAngles()

            local newtransform = Matrix()

            newtransform:SetTranslation(LerpVector(delta, vm_pos, vm_pos - (EyeAngles():Up() * 12) - (EyeAngles():Forward() * 12) - (EyeAngles():Right() * 4)))
            newtransform:SetAngles(vm_ang)

            vm:SetBoneMatrix(vmbone, newtransform)
        end
    end

    if !lhik_model or !IsValid(lhik_model) then return end

    lhik_model:SetupBones()

    if justhide then return end

    local cyc = (UnPredictedCurTime() - self.LHIKAnimationStart) / self.LHIKAnimationTime

    if self.LHIKAnimation and cyc < 1 then
        lhik_model:SetSequence(self.LHIKAnimation)
        lhik_model:SetCycle(cyc)
        if IsValid(lhik_anim_model) then
            lhik_anim_model:SetSequence(self.LHIKAnimation)
            lhik_anim_model:SetCycle(cyc)
        end
    else
        local key = "idle"

        local tranim = self:GetBuff_Hook("Hook_LHIK_TranslateAnimation", key)

        key = tranim or key

        if key and key != "DoNotPlayIdle" then
            self:DoLHIKAnimation(key, -1)
        end

        self.LHIKAnimation_IsIdle = true
    end

    local cf_deltapos = Vector(0, 0, 0)
    local cf = 0


    for _, bone in pairs(ArcCW.LHIKBones) do
        local vmbone = vm:LookupBone(bone)
        local lhikbone = lhik_model:LookupBone(bone)

        if !vmbone then continue end
        if !lhikbone then continue end

        local vmtransform = vm:GetBoneMatrix(vmbone)
        local lhiktransform = lhik_model:GetBoneMatrix(lhikbone)

        if !vmtransform then continue end
        if !lhiktransform then continue end

        local vm_pos = vmtransform:GetTranslation()
        local vm_ang = vmtransform:GetAngles()
        local lhik_pos = lhiktransform:GetTranslation()
        local lhik_ang = lhiktransform:GetAngles()

        local newtransform = Matrix()

        newtransform:SetTranslation(LerpVector(delta, vm_pos, lhik_pos))
        newtransform:SetAngles(LerpAngle(delta, vm_ang, lhik_ang))

        if !self:GetBuff_Override("LHIK_GunDriver") and self.LHIKDelta[lhikbone] and self.LHIKAnimation and cyc < 1 then
            local deltapos = lhik_model:WorldToLocal(lhik_pos) - self.LHIKDelta[lhikbone]

            if !deltapos:IsZero() then
                cf_deltapos = cf_deltapos + deltapos
                cf = cf + 1
            end
        end

        self.LHIKDelta[lhikbone] = lhik_model:WorldToLocal(lhik_pos)

        if hide_component then
            local new_pos = newtransform:GetTranslation()
            newtransform:SetTranslation(LerpVector(self.Customize_Hide, new_pos, new_pos - (EyeAngles():Up() * 12) - (EyeAngles():Forward() * 12) - (EyeAngles():Right() * 4)))
        end

        local matrix = Matrix(newtransform)

        vm:SetBoneMatrix(vmbone, matrix)

        -- local vm_pos, vm_ang = vm:GetBonePosition(vmbone)
        -- local lhik_pos, lhik_ang = lhik_model:GetBonePosition(lhikbone)

        -- local pos = LerpVector(delta, vm_pos, lhik_pos)
        -- local ang = LerpAngle(delta, vm_ang, lhik_ang)

        -- vm:SetBonePosition(vmbone, pos, ang)
    end

    if !cf_deltapos:IsZero() and cf > 0 and self:GetBuff_Override("LHIK_Animation") then
        local new = Vector(0, 0, 0)
        local viewmult = self:GetBuff_Override("LHIK_MovementMult") or 1

        new[1] = cf_deltapos[2] * viewmult
        new[2] = cf_deltapos[1] * viewmult
        new[3] = cf_deltapos[3] * viewmult

        self.ViewModel_Hit = LerpVector(0.25, self.ViewModel_Hit, new / cf):GetNormalized()
    end
end
--addons/arccw_base_modified/lua/weapons/arccw_base/cl_light.lua:
SWEP.Flashlights = {} -- tracks projectedlights
-- {{att = int, light = ProjectedTexture}}
SWEP.CheapFlashlights = {} -- tracks cheap flashlight models + lights
-- {{att = int, dlight = DynamicLight, vlight = ClientsideModel}}

function SWEP:GetHasFlashlights()
    for i, k in pairs(self.Attachments) do
        if !k.Installed then continue end
        if self:GetBuff_Stat("Flashlight", i) != nil then return true end
    end

    return false
end

function SWEP:CreateFlashlightsVM()
    self:KillFlashlights()
    self.Flashlights = {}

    local total_lights = 0

    for i, k in pairs(self.Attachments) do
        if !k.Installed then continue end
        if self:GetBuff_Stat("Flashlight", i) then
            local newlight = {
                att = i,
                light = ProjectedTexture(),
                bone = self:GetBuff_Stat("FlashlightBone", i) or "laser",
                col = self:GetBuff_Stat("FlashlightColor", i) or Color(255, 255, 255),
                br = self:GetBuff_Stat("FlashlightBrightness", i) or 2
            }
            total_lights = total_lights + 1

            local l = newlight.light
            if !IsValid(l) then continue end

            table.insert(self.Flashlights, newlight)

            l:SetFOV(self:GetBuff_Stat("FlashlightFOV", i) or 50)

            if self:GetBuff_Stat("FlashlightHFOV", i) then
                l:SetHorizontalFOV(self:GetBuff_Stat("FlashlightHFOV", i))
            end

            if self:GetBuff_Stat("FlashlightVFOV", i) then
                l:SetVerticalFOV(self:GetBuff_Stat("FlashlightVFOV", i))
            end

            l:SetFarZ(self:GetBuff_Stat("FlashlightFarZ", i) or 512)
            l:SetNearZ(self:GetBuff_Stat("FlashlightNearZ", i) or 4)

            local atten = self:GetBuff_Stat("FlashlightAttenuationType", i) or ArcCW.FLASH_ATT_LINEAR

            l:SetLinearAttenuation(0)
            l:SetConstantAttenuation(0)
            l:SetQuadraticAttenuation(0)

                if atten == ArcCW.FLASH_ATT_CONSTANT then
                    l:SetConstantAttenuation(100)
                elseif atten == ArcCW.FLASH_ATT_QUADRATIC then
                    l:SetQuadraticAttenuation(100)
                else
                    l:SetLinearAttenuation(100)
                end

            l:SetColor(self:GetBuff_Stat("FlashlightColor", i) or Color(255, 255, 255))
            l:SetTexture(self:GetBuff_Stat("FlashlightTexture", i))
            l:SetBrightness(self:GetBuff_Stat("FlashlightBrightness", i))
            l:SetEnableShadows(true)
            l:Update()

            local g_light = {
                Weapon = self,
                ProjectedTexture = l
            }

            table.insert(ArcCW.FlashlightPile, g_light)
        end
    end

    if total_lights > 2 then -- you are a madman
        for i, k in pairs(self.Flashlights) do
            if k.light:IsValid() then k.light:SetEnableShadows(false) end
        end
    end
end

-- for world model flashlights we will use a cheap solution similar to what HL2 uses
-- throw up a volumetric light model
-- function SWEP:CreateFlashlightsWM()
--     self:KillFlashlights()
--     self.CheapFlashlights = {}
--     for i, k in pairs(self.Attachments) do
--         if !k.Installed then continue end
--         local atttbl = ArcCW.AttachmentTable[k.Installed]

--         if atttbl.Flashlight then
--             local newlight = {
--                 att = i,
--                 vlight = ClientsideModel(ArcCW.VolumetricLightModel),
--                 scale_x = 1,
--                 scale_y = 1,
--                 maxz = atttbl.FlashlightFarZ or 512,
--                 bone = atttbl.FlashlightBone or "laser",
--                 col = Color(255, 255, 255)
--             }

--             local vl = newlight.vlight

--             if !IsValid(vl) then continue end

--             table.insert(self.CheapFlashlights, newlight)

--             local xfov = atttbl.FlashlightHFOV or atttbl.FlashlightFOV or 50
--             local yfov = atttbl.FlashlightVFOV or atttbl.FlashlightFOV or 50

--             local target_x = 128 * (xfov / 90)
--             local target_y = 128 * (yfov / 90)

--             local scale_x = target_x / ArcCW.VolumetricLightX
--             local scale_y = target_y / ArcCW.VolumetricLightY

--             newlight.scale_x = scale_x
--             newlight.scale_y = scale_y

--             vl:SetNoDraw(ArcCW.NoDraw)
--             vl:DrawShadow(false)
--             local col = atttbl.FlashlightColor or Color(255, 255, 255)
--             col = Color(255, 0, 0)
--             newlight.col = col
--             -- vl:SetColor(col)

--             local g_light = {
--                 Model = vl,
--                 Weapon = self
--             }

--             table.insert(ArcCW.CSModelPile, g_light)
--         end
--     end
-- end

function SWEP:KillFlashlights()
    self:KillFlashlightsVM()
    -- self:KillFlashlightsWM()
end

function SWEP:KillFlashlightsVM()
    if !self.Flashlights then return end

    for i, k in pairs(self.Flashlights) do
        if k.light and k.light:IsValid() then
            k.light:Remove()
        end
    end

    self.Flashlights = nil
end

function SWEP:KillFlashlightsWM()
    -- if !self.CheapFlashlights then return end

    -- for i, k in pairs(self.CheapFlashlights) do
    --     if k.vlight and k.vlight:IsValid() then
    --         k.vlight:Remove()
    --     end
    -- end

    -- self.CheapFlashlights = nil
end

-- given fov and distance solve apparent size
local function solvetriangle(angle, dist)
    local a = angle / 2
    local b = dist
    return b * math.tan(a) * 2
end

local flashlight_mat = Material("models/effects/vol_light002")
-- local flashlight_mat = Material("effects/blueblacklargebeam")

function SWEP:DrawFlashlightsWM()
    -- if !self.CheapFlashlights then
    --     self:CreateFlashlightsWM()
    -- end

    local owner = self:GetOwner()

    for i, k in pairs(self.Attachments) do
        if !k.Installed then continue end
        local atttbl = ArcCW.AttachmentTable[k.Installed]

        if !atttbl or !self:GetBuff_Stat("Flashlight", i) then continue end

        local maxz = atttbl.FlashlightFarZ or 512
        local bone = atttbl.FlashlightBone or "laser"
        local col = atttbl.FlashlightColor or Color(255, 255, 255)

        if !k.WElement then continue end
        local model = k.WElement.Model
        if !IsValid(model) then return end

        local pos, ang, dir

        if !model then
            pos = owner:EyePos()
            ang = owner:EyeAngles()
            dir = ang:Forward()
        else
            local att = model:LookupAttachment(bone or "laser")

            att = att == 0 and model:LookupAttachment("muzzle") or att

            if att == 0 then
                pos = model:GetPos()
                ang = IsValid(owner) and owner:EyeAngles() or model:GetAngles()
                dir = ang:Forward()
                dir_2 = ang:Up()
            else
                local attdata  = model:GetAttachment(att)
                pos, ang = attdata.Pos, attdata.Ang
                dir = -ang:Right()
                dir_2 = ang:Up()
            end
        end

        local maxs = Vector(2, 2, 2)
        local mins = -maxs

        -- scale volumetric light
        local tr = util.TraceHull({
            start = pos,
            endpos = pos + (dir * maxz),
            mask = MASK_OPAQUE,
            mins = mins,
            maxs = maxs
        })

        local z = (tr.HitPos - tr.StartPos):Length()
        -- local s_z = z / ArcCW.VolumetricLightZ

        local xfov = atttbl.FlashlightHFOV or atttbl.FlashlightFOV or 50
        local yfov = atttbl.FlashlightVFOV or atttbl.FlashlightFOV or 50

        -- local target_x = 128 * (xfov / 90)
        -- local target_y = 128 * (yfov / 90)

        local target_x = solvetriangle(xfov, z)
        local target_y = target_x

        if xfov != yfov then
            target_y = solvetriangle(yfov, z)
        end

        local vs = EyeAngles():Up()

        local c1 = pos + vs
        local c4 = pos - vs
        local c2 = tr.HitPos + (vs * target_y * 0.75)
        local c3 = tr.HitPos - (vs * target_y * 0.75)

        render.SetMaterial(flashlight_mat)
        render.DrawQuad(c1,c2,c3,c4, col)

        -- local scale = Matrix()
        -- scale:Scale(Vector(s_x, s_y, s_z))

        -- k.vlight:SetPos(pos)
        -- k.vlight:SetAngles(ang + Angle(0, 0, 90))
        -- k.vlight:EnableMatrix("RenderMultiply", scale)
        -- k.vlight:SetColor(Color(255, 0, 0, 255))
        -- k.vlight:SetRenderMode(RENDERMODE_NORMAL)
        -- k.vlight:SetKeyValue("RenderFX", kRenderFxNone)
        -- k.vlight:DrawModel()
        -- place dynamic light to make some light appear

        local dl = DynamicLight(self:EntIndex())

        local delta = (z / maxz)
        delta = math.Clamp(delta, 0, 1)

        if dl then
            dl.pos = tr.HitPos
            dl.r = col.r
            dl.g = col.g
            dl.b = col.b
            dl.brightness = Lerp(delta, atttbl.FlashlightBrightness or 2, 0)
            -- print(z / maxz)
            dl.Decay = 1000 / 1
            dl.dietime = CurTime() + 0.1
            dl.size = xfov * 5
        end
    end
end

function SWEP:DrawFlashlightsVM()
    if !self.Flashlights then
        self:CreateFlashlightsVM()
    end

    local owner = self:GetOwner()

    for i, k in pairs(self.Flashlights) do
        local model = (self.Attachments[k.att].VElement or {}).Model

        local pos, ang

        if !model then
            pos = owner:EyePos()
            ang = owner:EyeAngles()
        else
            local att = model:LookupAttachment(k.bone or "laser")

            att = att == 0 and model:LookupAttachment("muzzle") or att

            if att == 0 then
                pos = model:GetPos()
                ang = owner:EyeAngles()
            else
                local attdata  = model:GetAttachment(att)
                pos, ang = attdata.Pos, attdata.Ang
            end
        end

        local tr = util.TraceLine({
            start = owner:EyePos(),
            endpos = owner:EyePos() - ang:Right() * 128,
            mask = MASK_OPAQUE,
            filter = LocalPlayer(),
        })
        if tr.Fraction < 1 then -- We need to push the flashlight back
            local tr2 = util.TraceLine({
                start = owner:EyePos(),
                endpos = owner:EyePos() + ang:Right() * 128,
                mask = MASK_OPAQUE,
                filter = LocalPlayer(),
            })
            -- push it as back as the area behind us allows
            pos = pos + ang:Right() * 128 * math.min(1 - tr.Fraction, tr2.Fraction)
        end

        ang:RotateAroundAxis(ang:Up(), 90)

        k.light:SetPos(pos)
        k.light:SetAngles(ang)
        k.light:Update()

        -- local col = k.col

        -- local dl = DynamicLight(self:EntIndex())

        -- if dl then
        --     dl.pos = pos
        --     dl.r = col.r
        --     dl.g = col.g
        --     dl.b = col.b
        --     dl.brightness = k.br or 2
        --     -- print(z / maxz)
        --     dl.Decay = 1000 / 0.1
        --     dl.dietime = CurTime() + 0.1
        --     dl.size = (k.br or 2) * 64
        -- end
    end
end

--addons/arccw_weapons/lua/weapons/arccw_blaster_dc15x.lua:
AddCSLuaFile()
SWEP.Base = "arccw_meeks_sw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "AOCRP - Nicht eingestelle Waffen" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "DC-15x"
SWEP.Trivia_Class = "Modular Blaster"
SWEP.Trivia_Desc = "High tech scouting rifle."
SWEP.Trivia_Manufacturer = "BlasTech Industries"
SWEP.Trivia_Calibre = "Medium Density"
SWEP.Trivia_Mechanism = "Energized Compressed Tibanna"
SWEP.Trivia_Country = "GAR"

SWEP.ViewModel = "models/arccw/ser/starwars/c_dc15x.mdl"
SWEP.WorldModel = "models/arccw/ser/starwars/w_dc15x.mdl"
SWEP.IconOverride = "materials/entities/dc15x.png"
SWEP.ViewModelFOV = 70

SWEP.WorldModelOffset = {
    pos = Vector(8, 1., -3.5),
    ang = Angle(-5, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 1.2
}


SWEP.DefaultBodygroups = "111"
SWEP.DefaultWMBodygroups = "111"
SWEP.DefaultSkin = 0
SWEP.DefaultWMSkin = 0

SWEP.NoHideLeftHandInCustomization = false

SWEP.Damage = 145
SWEP.DamageMin = 56 -- damage done at maximum range
SWEP.RangeMin = 230 -- how far bullets will retain their maximum damage for
SWEP.Range = 550 -- in METRES
SWEP.Penetration = 1
SWEP.DamageType = DMG_BULLET
SWEP.DamageTypeHandled = false -- set to true to have the base not do anything with damage types
-- this includes: igniting if type has DMG_BURN; adding DMG_AIRBOAT when hitting helicopter; adding DMG_BULLET to DMG_BUCKSHOT

SWEP.MuzzleVelocity = 400 -- projectile muzzle velocity in m/s
SWEP.PhysBulletDontInheritPlayerVelocity = true

SWEP.BodyDamageMults = nil

SWEP.AlwaysPhysBullet = false
SWEP.NeverPhysBullet = false
SWEP.PhysTracerProfile = 3 -- color for phys tracer.

SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerFinalMag = 0 -- the last X bullets in a magazine are all tracers
SWEP.Tracer = "tfa_tracer_blue" -- override tracer (hitscan) effect
SWEP.TracerCol = Color(0, 47, 255)
SWEP.HullSize = 1.5 -- HullSize used by FireBullets

SWEP.ChamberSize = 0 -- how many rounds can be chambered.
SWEP.Primary.ClipSize = 12 -- DefaultClip is automatically set.

SWEP.AmmoPerShot = 1

SWEP.ReloadInSights = false
SWEP.ReloadInSights_CloseIn = 0.25
SWEP.ReloadInSights_FOVMult = 0.875
SWEP.LockSightsInReload = false

SWEP.Recoil = 0.5
SWEP.RecoilSide = 0.2
SWEP.RecoilRise = 1
SWEP.MaxRecoilBlowback = 1
SWEP.VisualRecoilMult = 1
SWEP.RecoilPunch = 2
SWEP.RecoilPunchBackMax = 30

SWEP.RecoilDirection = Angle(1, 0, 0)
SWEP.RecoilDirectionSide = Angle(0, 1, 0)

SWEP.Delay = 60 / 110 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemode = 2 -- 0: safe, 1: semi, 2: auto, negative: burst
SWEP.Firemodes = {
    {
		Mode = 1,
    },
	{
		Mode = 0,
		CustomBars = "",
   	}
}

SWEP.ShotRecoilTable = nil -- {[1] = 0.25, [2] = 2} etc.

SWEP.NotForNPCS = true
SWEP.NPCWeaponType = nil -- string or table, the NPC weapons for this gun to replace

SWEP.AccuracyMOA = 1 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 50 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 50 -- inaccuracy added by moving. Applies in sights as well! Walking speed is considered as "maximum".
SWEP.SightsDispersion = 0 -- dispersion that remains even in sights
SWEP.JumpDispersion = 200 -- dispersion penalty when in the air

SWEP.ShootWhileSprint = false

SWEP.Primary.Ammo = "ar2" -- what ammo type the gun uses
SWEP.MagID = "mpk1" -- the magazine pool this gun draws from

SWEP.ShootSound = "w/dc15x/sdkaswq.wav"
SWEP.ShootSoundSilenced = "w/dc19.wav"
SWEP.ShootSoundLooping = nil
SWEP.FirstShootSoundSilenced = nil
SWEP.ShootDrySound = nil -- Add an attachment hook for Hook_GetShootDrySound please!
SWEP.DistantShootSound = nil
SWEP.FiremodeSound = "weapons/arccw/firemode.wav"
SWEP.MeleeSwingSound = "weapons/arccw/melee_lift.wav"
SWEP.MeleeMissSound = "weapons/arccw/melee_miss.wav"
SWEP.MeleeHitSound = "weapons/arccw/melee_hitworld.wav"
SWEP.MeleeHitNPCSound = "weapons/arccw/melee_hitbody.wav"


SWEP.NoFlash = nil -- disable light flash
-- SWEP.MuzzleEffect = "wpn_muzzleflash_dc17"
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false -- Use Gmod muzzle effects rather than particle effects

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on
SWEP.ProceduralViewBobAttachment = 1 -- attachment on which coolview is affected by, default is muzzleeffect
SWEP.CamAttachment = nil -- if set, this attachment will control camera movement
SWEP.MuzzleFlashColor = Color(0, 102, 255)

SWEP.SpeedMult = 0.9
SWEP.SightedSpeedMult = 0.75
SWEP.ShootSpeedMult = 1

SWEP.IronSightStruct = {
    Pos = Vector(-2.93, -7, 1.54),
    Ang = Angle(0, 0, 0),
    Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
    Magnification = 1,
    CrosshairInSights = false,
}


SWEP.SightTime = 0.13
SWEP.SprintTime = 0
-- If Malfunction is enabled, the gun has a random chance to be jammed
-- after the gun is jammed, it won't fire unless reload is pressed, which plays the "unjam" animation
-- if no "unjam", "fix", or "cycle" animations exist, the weapon will reload instead
SWEP.Malfunction = false
SWEP.MalfunctionJam = true -- After a malfunction happens, the gun will dryfire until reload is pressed. If unset, instead plays animation right after.
SWEP.MalfunctionTakeRound = true -- When malfunctioning, a bullet is consumed.
SWEP.MalfunctionWait = 0.5 -- The amount of time to wait before playing malfunction animation (or can reload)
SWEP.MalfunctionMean = nil -- The mean number of shots between malfunctions, will be autocalculated if nil
SWEP.MalfunctionVariance = 0.25 -- The fraction of mean for variance. e.g. 0.2 means 20% variance
SWEP.MalfunctionSound = "weapons/arccw/malfunction.wav"

SWEP.HoldtypeHolstered = "smg"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "smg"
SWEP.HoldtypeCustomize = "slam"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.CanBash = true
SWEP.MeleeDamage = 25
SWEP.MeleeRange = 16
SWEP.MeleeDamageType = DMG_CLUB
SWEP.MeleeTime = 0.5
SWEP.MeleeGesture = nil
SWEP.MeleeAttackTime = 0.2


SWEP.BashPreparePos = Vector(2.187, -4.117, -7.14)
SWEP.BashPrepareAng = Angle(32.182, -3.652, -19.039)

SWEP.BashPos = Vector(8.876, 0, 0)
SWEP.BashAng = Angle(-16.524, 70, -11.046)

SWEP.ActivePos = Vector(0, 0, 0)
SWEP.ActiveAng = Angle(0, 0, 0)


SWEP.HolsterPos = Vector(0.532, -6, 0)
SWEP.HolsterAng = Angle(-4.633, 36.881, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, 0)
SWEP.BarrelOffsetCrouch = nil
SWEP.BarrelOffsetHip = Vector(3, 0, -3)

SWEP.CustomizePos = Vector(9.824, 0, -4.897)
SWEP.CustomizeAng = Angle(12.149, 30.547, 0)

SWEP.InBipodPos = Vector(-8, 0, -4)
SWEP.InBipodMult = Vector(2, 1, 1)

SWEP.BarrelLength = 24

SWEP.SightPlusOffset = true

SWEP.DefaultElements = {}

SWEP.Attachments = {
	[1] = {
		PrintName = "Optic", -- print name
		DefaultAttName = "Iron Sights", -- used to display the "no attachment" text
		Slot = "optic",
		Bone = "optic", -- relevant bone any attachments will be mostly referring to
		Offset = {
            vpos = Vector(0.02, -0.2, 0),
            vang = Angle(90, 0, -90),
            wpos = Vector(6, 0.8, -4.6),
            wang = Angle(-7, 0, 180),
        },
        NoWM = false,
	},
    [2] = {
        PrintName = "Tactical", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"tactical", "tac_pistol"},
        Bone = "optic", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.8, 1, 15),
            vang = Angle(90, 0, -0),
            wpos = Vector(24, 1.4, -5),
            wang = Angle(-5, 0, -90),
        },
        NoWM = false,
    },
    [3] = {
        PrintName = "Foregrip", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = "foregrip",
        Bone = "optic", -- relevant bone any attachments wwill be mostly referring to
        Offset = {
            vpos = Vector(0, 2, 15),
            vang = Angle(90, 0, -90),    
            wang = Angle(-3, 0, 180)      
        },
        SlideAmount = {
        vmin = Vector(-0.2, 2.6, 6),
        vmax = Vector(-0.2, 2.6, 12),
        wmin = Vector(15, 0.6, -2.3), 
        wmax = Vector(15, 0.6, -2.3)       -- how far this attachment can slide in both directions.
        },         
    },    
    [4] = {
        PrintName = "Charms", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"charm"},
        Bone = "optic", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(1, 1.6, -3.8),
            vang = Angle(90, 0, -90),
            wpos = Vector(2.3, 1.8, -2.3),
            wang = Angle(0, 0, 180)
        },
        NoWM = false,
    },
    [5] = {
        PrintName = "Muzzle", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"muzzle", "cr2_muzzle", "cr2c_muzzle", "stealth_muzzle", "b1120_muzzle"},
        Bone = "optic", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 1, 20),
            vang = Angle(90, 0, -90),
            wpos = Vector(26, 0.75, -5.25),
            wang = Angle(-5, 0.5, 180)
        },
        NoWM = false,
    },
    [6] = {
        PrintName = "Magazine", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {},
        Bone = "optic", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.3, 2.3, 4),
            vang = Angle(0, 0, 0),
        },
    },        
    [7] = {
        PrintName = "Energization", -- print name
        DefaultAttName = "Standard Energization", -- used to display the "no attachment" text
        Slot = {"ammo", "special_ammo"},
    },
    [8] = {
        PrintName = "Training/Perk", -- print name
        DefaultAttName = "None", -- used to display the "no attachment" text
        Slot = "perk",
    },                    
}

SWEP.AutosolveSourceSeq = "idle"

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },
	["fire"] = {
        Source = "fire",
    },
	["fire_sight"] = {
        Source = "",
    },
	["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
		SoundTable = {
	        {
				s = "weapons/bf3/standard_reload2.ogg", -- sound; can be string or table
				p = 100, -- pitch
				v = 40, -- volume
				t = 0, -- time at which to play relative to Animations.Time
				c = CHAN_USER_BASE, -- channel to play the sound
			},
		},
        LHIK = true,
    },
    ["draw"] = {
        Source = "draw",
        Mult = 1.5,
        SoundTable = {
            {
                s = "w/dc15s/gunfoley_blaster_draw_var_04.mp3", -- sound; can be string or table
                p = 100, -- pitch
                v = 75, -- volume
                t = 0, -- time at which to play relative to Animations.Time
                c = CHAN_ITEM, -- channel to play the sound
            },
        }
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = {
            {
                s = "w/dc15s/gunfoley_blaster_sheathe_var_01.mp3", -- sound; can be string or table
                p = 100, -- pitch
                v = 75, -- volume
                t = 0, -- time at which to play relative to Animations.Time
                c = CHAN_ITEM, -- channel to play the sound
            },
        }
    },
}
--addons/arccw_weapons/lua/weapons/arccw_blaster_valken38x.lua:
AddCSLuaFile()
SWEP.Base = "arccw_meeks_sw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "AOCRP - Nicht eingestelle Waffen" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Valken 38x"
SWEP.Trivia_Class = "Modular Blaster"
SWEP.Trivia_Desc = "High tech verstile modular blaster base, suited for allround usage."
SWEP.Trivia_Manufacturer = "BlasTech Industries"
SWEP.Trivia_Calibre = "Medium Density"
SWEP.Trivia_Mechanism = "Energized Compressed Tibanna"
SWEP.Trivia_Country = "GAR"

SWEP.ViewModel = "models/arccw/ser/starwars/c_valken38x.mdl"
SWEP.WorldModel = "models/arccw/ser/starwars/w_valken38x.mdl"
SWEP.IconOverride = ""
SWEP.ViewModelFOV = 70

SWEP.DefaultBodygroups = "00000000"
SWEP.DefaultWMBodygroups = "00000000"
SWEP.DefaultSkin = 0
SWEP.DefaultWMSkin = 0

SWEP.NoHideLeftHandInCustomization = false

SWEP.Damage = 85
SWEP.DamageMin = 40 -- damage done at maximum range
SWEP.DamageRand = 0 -- damage will vary randomly each shot by this fraction
SWEP.RangeMin = 250 -- how far bullets will retain their maximum damage for
SWEP.Range = 450 -- in METRES
SWEP.Penetration = 1
SWEP.DamageType = DMG_BULLET
SWEP.DamageTypeHandled = false -- set to true to have the base not do anything with damage types
-- this includes: igniting if type has DMG_BURN; adding DMG_AIRBOAT when hitting helicopter; adding DMG_BULLET to DMG_BUCKSHOT

SWEP.MuzzleVelocity = 400 -- projectile muzzle velocity in m/s

SWEP.AlwaysPhysBullet = false
SWEP.NeverPhysBullet = false
SWEP.PhysTracerProfile = 3 -- color for phys tracer.

SWEP.TracerNum = 1 -- tracer every X
SWEP.TracerFinalMag = 0 -- the last X bullets in a magazine are all tracers
SWEP.Tracer = "tfa_tracer_blue" -- override tracer (hitscan) effect
SWEP.TracerCol = Color(0, 47, 255)
SWEP.HullSize = 2 -- HullSize used by FireBullets

SWEP.ChamberSize = 0 -- how many rounds can be chambered.
SWEP.Primary.ClipSize = 10 -- DefaultClip is automatically set.

SWEP.AmmoPerShot = 1

SWEP.ReloadInSights = false
SWEP.ReloadInSights_CloseIn = 0.25
SWEP.ReloadInSights_FOVMult = 0.875
SWEP.LockSightsInReload = false

SWEP.Recoil = 0.5
SWEP.RecoilSide = 0.15
SWEP.RecoilRise = 0.53
SWEP.VisualRecoilMult = 2
SWEP.RecoilPunch = 1.4
SWEP.RecoilPunchBackMax = 0.9

SWEP.RecoilDirection = Angle(1.1, 0, 0)
SWEP.RecoilDirectionSide = Angle(0, 1.1, 0)

SWEP.Delay = 60 / 130 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemode = 2 -- 0: safe, 1: semi, 2: auto, negative: burst
SWEP.Firemodes = {
	{
		Mode = 2,
   	},
    {
		Mode = 1,
    },
	{
		Mode = 0,
   	}
}

SWEP.NotForNPCS = true
SWEP.NPCWeaponType = nil -- string or table, the NPC weapons for this gun to replace

SWEP.AccuracyMOA = 0.3 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 410 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 65 -- inaccuracy added by moving. Applies in sights as well! Walking speed is considered as "maximum".
SWEP.SightsDispersion = 65 -- dispersion that remains even in sights
SWEP.JumpDispersion = 200 -- dispersion penalty when in the air

SWEP.ShootWhileSprint = false

SWEP.Primary.Ammo = "ar2" -- what ammo type the gun uses
SWEP.MagID = "mpk1" -- the magazine pool this gun draws from

SWEP.ShootVol = 50 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound
SWEP.ShootPitchVariation = 0.05

SWEP.ShootSound = "w/valken/blasters_valken-38x_laser_close_var_01.mp3"
SWEP.ShootSoundSilenced = "w/dc19.wav"
SWEP.FiremodeSound = "weapons/arccw/firemode.wav"
SWEP.MeleeSwingSound = "weapons/arccw/melee_lift.wav"
SWEP.MeleeMissSound = "weapons/arccw/melee_miss.wav"
SWEP.MeleeHitSound = "weapons/arccw/melee_hitworld.wav"
SWEP.MeleeHitNPCSound = "weapons/arccw/melee_hitbody.wav"


SWEP.NoFlash = nil -- disable light flash
-- SWEP.MuzzleEffect = "wpn_muzzleflash_dc17"
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false -- Use Gmod muzzle effects rather than particle effects

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.ProceduralViewBobAttachment = 1 -- attachment on which coolview is affected by, default is muzzleeffect
SWEP.MuzzleFlashColor = Color(0, 102, 255)

SWEP.SpeedMult = 0.9
SWEP.SightedSpeedMult = 0.75
SWEP.ShootSpeedMult = 1

SWEP.IronSightStruct = {
    Pos = Vector(-3.04, -0, 1.3),
    Ang = Angle(0, 0, 2),
    Midpoint = { -- Where the gun should be at the middle of it's irons
        Pos = Vector(0, 0, 0),
        Ang = Angle(0, 0, 0),
    },
    Magnification = 1,
    CrosshairInSights = false,
}


SWEP.SightTime = 0.13
SWEP.SprintTime = 0
-- If Malfunction is enabled, the gun has a random chance to be jammed
-- after the gun is jammed, it won't fire unless reload is pressed, which plays the "unjam" animation
-- if no "unjam", "fix", or "cycle" animations exist, the weapon will reload instead
SWEP.Malfunction = false
SWEP.MalfunctionJam = true -- After a malfunction happens, the gun will dryfire until reload is pressed. If unset, instead plays animation right after.
SWEP.MalfunctionTakeRound = true -- When malfunctioning, a bullet is consumed.
SWEP.MalfunctionWait = 0.5 -- The amount of time to wait before playing malfunction animation (or can reload)
SWEP.MalfunctionMean = nil -- The mean number of shots between malfunctions, will be autocalculated if nil
SWEP.MalfunctionVariance = 0.25 -- The fraction of mean for variance. e.g. 0.2 means 20% variance
SWEP.MalfunctionSound = "weapons/arccw/malfunction.wav"

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "ar2"
SWEP.HoldtypeCustomize = "slam"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.CanBash = true
SWEP.MeleeDamage = 25
SWEP.MeleeRange = 16
SWEP.MeleeDamageType = DMG_CLUB
SWEP.MeleeTime = 0.5
SWEP.MeleeGesture = nil
SWEP.MeleeAttackTime = 0.2

SWEP.SprintPos = Vector(6, -4, 0)
SWEP.SprintAng = Angle(-16.524, 60, -11.046)

SWEP.BashPreparePos = Vector(2.187, -4.117, -7.14)
SWEP.BashPrepareAng = Angle(32.182, -3.652, -19.039)

SWEP.BashPos = Vector(8.876, 0, 0)
SWEP.BashAng = Angle(-16.524, 70, -11.046)

SWEP.ActivePos = Vector(0, 3, 0)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.HolsterPos = Vector(0.532, -6, 0)
SWEP.HolsterAng = Angle(-4.633, 36.881, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, 0)
SWEP.BarrelOffsetCrouch = nil
SWEP.BarrelOffsetHip = Vector(3, 0, -3)

SWEP.CustomizePos = Vector(10.824, -7, 4.897)
SWEP.CustomizeAng = Angle(12.149, 45.547, 45)

SWEP.InBipodPos = Vector(-8, 0, -4)
SWEP.InBipodMult = Vector(2, 1, 1)

SWEP.BarrelLength = 24

SWEP.SightPlusOffset = true

SWEP.DefaultElements = {}

SWEP.AttachmentElements = {
    ["ironsight"] = {
        VMElements = {
            {
                Model = "models/arccw/props/e11r_scope/e11r_scope.mdl",
                Bone = "weapon",
                Scale = Vector(1, 1, 1),
                Offset = {
                    pos = Vector(0.05, -2.85, 0.8),
                    ang = Angle(-0.3, 0, -90)
                }
            }
        },
        WMElements = { -- Purely handles muzzle effect on the world model
            {
                Model = "models/hunter/plates/plate.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(0, 0, 0),
                Offset = {
                    pos = Vector(20, 0.5, -8),
                    ang = Angle(0, 0, 0)
                },
                IsMuzzleDevice = true
            }
        }, -- change the world model to something else. Please make sure it's compatible with the last one.
    },
}


SWEP.Attachments = {
	[1] = {
		PrintName = "Optic", -- print name
		DefaultAttName = "Iron Sights", -- used to display the "no attachment" text
		Slot = "optic",
		Bone = "Valken38x_material", -- relevant bone any attachments will be mostly referring to
		Offset = {
            vpos = Vector(0.2, -2, 1.5),
            vang = Angle(0, -90, 0),
            wpos = Vector(6, 1.5, -5),
            wang = Angle(-10, 2, 180)
        },
        CorrectiveAng = Angle(0, 180, 0),
        NoWM = false
	},
    [2] = {
        PrintName = "Tactical", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"tactical", "tac_pistol"},
        Bone = "Valken38x_material", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(1, 8, 0.7),
            vang = Angle(0, -90, 90),
            wpos = Vector(14, 2, -5.5),
            wang = Angle(-10, 5, -90)
        },
        NoWM = false
    },
    [3] = {
        PrintName = "Charms", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"charm"},
        Bone = "Valken38x_material", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(1, 2, 0.6),
            vang = Angle(90, -90, -90),
            wpos = Vector(6, 1.8, -4.5),
            wang = Angle(0, 0, 180)
        },
    },
    [4] = {
        PrintName = "Foregrip", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = "foregrip",
        Bone = "Valken38x_material", -- relevant bone any attachments wwill be mostly referring to /
        Offset = {
            vpos = Vector(-0, 0.2, 0),
            vang = Angle(90, -90, -90),
            wpos = Vector(9, .5, 2),
            wang = Angle(0, 0, 180)            
        },
        SlideAmount = {
        vmin = Vector(-0, 1, 0),
        vmax = Vector(-0, 3, 0),
        wmin = Vector(9, 0.8, -4), 
        wmax = Vector(9, 0.8, -4) -- how far this attachment can slide in both directions.
        },          -- Set this to false if you want the foregrips to display on ViewModels.          
    },
    [5] = {
        PrintName = "Energization", -- print name
        DefaultAttName = "Standard Energization", -- used to display the "no attachment" text
        Slot = "ammo",
    },
    [6] = {
        PrintName = "Training/Perk", -- print name
        DefaultAttName = "None", -- used to display the "no attachment" text
        Slot = "perk",
    },
    [7] = {
        PrintName = "Magazine", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {},
        Bone = "Magazine", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(2, 0.7, -1.6),
            vang = Angle(180, 0, 0),
            wpos = Vector(9.5, 1.5, -3.8),
            wang = Angle(80, 90, 0) 
        },
    },
    [8] = {
        PrintName = "Muzzle", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"muzzle"},
        Bone = "Valken38x_material", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.2, 21.5, .6),
            vang = Angle(0, -90, -90),
            wpos = Vector(26.6, 0.3, -7.7),
            wang = Angle(-10, 2, 180) 
        },
    },                              
}

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },
	["fire"] = {
        Source = "fire",
    },
    ["enter_sight"] = {
        Source = "neutral",
        Time = 0, -- Overwrites the duration of the animation (changes speed). Don't set to use sequence length
    },
    ["fire_iron"] = {
        Source = "neutral",
         -- Overwrites the duration of the animation (changes speed). Don't set to use sequence length
    },
    ["idle_sight"] = {
        Source = "Neutral",
    },       
	["reload"] = {
        Source = "reload",
        LHIK = true,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
		SoundTable = {
	        {
				s = "w/dc15s/overheat_manualcooling_resetfoley_generic_var_03.mp3", -- sound; can be string or table
				p = 100, -- pitch
				v = 100, -- volume
				t = 0.1, -- time at which to play relative to Animations.Time
				c = CHAN_ITEM, -- channel to play the sound
			},
			{
				s = "w/dc15s/overheatactivecoolingsuccess_var_01.mp3", -- "everfall/weapons/miscellaneous/charge/blasters_deathray_charge_start_var_04.mp3"sound; can be string or table
				p = 100, -- pitch
				v = 100, -- volume
				t = 2.79, -- time at which to play relative to Animations.Time
				c = CHAN_ITEM, -- channel to play the sound
			},
		}
    },
    ["draw"] = {
        Source = "draw",
        Mult = 1.5,
        SoundTable = {
            {
                s = "w/dc15s/gunfoley_blaster_draw_var_04.mp3", -- sound; can be string or table
                p = 100, -- pitch
                v = 75, -- volume
                t = 0, -- time at which to play relative to Animations.Time
                c = CHAN_ITEM, -- channel to play the sound
            },
        }
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = {
            {
                s = "w/dc15s/gunfoley_blaster_sheathe_var_01.mp3", -- sound; can be string or table
                p = 100, -- pitch
                v = 75, -- volume
                t = 0, -- time at which to play relative to Animations.Time
                c = CHAN_ITEM, -- channel to play the sound
            },
        }
    },
}
--addons/arccw_weapons/lua/weapons/arccw_dual_rg4d.lua:
AddCSLuaFile()

SWEP.Base = "arccw_meeks_sw_base"
SWEP.Spawnable = true
SWEP.Category = "AOCRP - Droidenwaffen"
SWEP.Credits = { Author1 = "cat"}
SWEP.PrintName = "Dual RG-4D"
SWEP.Trivia_Class = "CIS Dual Blaster Pistol"
SWEP.Trivia_Desc = "High tech compact Dual RG-4D Blaster Pistol."
SWEP.Trivia_Manufacturer = "Baktoid Combat Automata"
SWEP.Trivia_Calibre = "Medium Density Bolt"
SWEP.Trivia_Mechanism = "Energized Compressed Tibanna"
SWEP.Trivia_Country = "GAR"
SWEP.Trivia_Year = 2020

SWEP.Slot = 1

SWEP.UseHands = true

SWEP.ViewModel = "models/arccw/strasser/weapons/c_ddeagle.mdl"
SWEP.WorldModel = "models/arccw/weapons/synbf3/w_scoutblaster.mdl"
SWEP.ViewModelFOV = 90
SWEP.HideViewmodel = true
SWEP.WorldModelOffset = {
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 0.09
}

SWEP.IconOverride = "materials/entities/rw_sw_dual_rg4d.png"

SWEP.DefaultBodygroups = "000000000000"

SWEP.Damage = 30
SWEP.RangeMin = 120
SWEP.DamageMin = 22
SWEP.Range = 320
SWEP.Penetration = 1
SWEP.DamageType = DMG_BULLET
SWEP.MuzzleVelocity = 400

SWEP.NoHideLeftHandInCustomization = true

SWEP.TraceNum = 1
SWEP.PhysTracerProfile = 1

SWEP.TracerNum = 1
SWEP.Tracer = "tfa_tracer_red"
SWEP.TracerCol = Color(250, 0, 0)
SWEP.HullSize = 1.5

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 20*2

SWEP.Recoil = 0.7
SWEP.RecoilPunch = 1.4
SWEP.RecoilSide = 0.25
SWEP.RecoilRise = 0.31

SWEP.Delay = 60 / 380
SWEP.Num = 1
SWEP.Firemodes = {
	{
		Mode = 2
	},
    {
        Mode = 1
    },
    {
        Mode = 0
    },    
}

SWEP.AccuracyMOA = 0.75 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 800 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 50


----AMMO / stuff----

SWEP.Primary.Ammo = "ar2"

SWEP.ShootVol = 100
SWEP.ShootPitch = 100

SWEP.ShootSound = "w/rg4d.wav"

SWEP.MuzzleFlashColor = Color(255, 0, 0, 50)

SWEP.IronSightStruct = {
    Pos = Vector(0, -4, 1),
    Ang = Angle(0, 0, 0),
     Magnification = 1.2,
     SwitchToSound = "zoom_in/gunfoley_zoomin_blasterheavy_01.mp3",
     ViewModelFOV = 90,
}
SWEP.HoldtypeHolstered = ""
SWEP.HoldtypeActive = "duel"
SWEP.HoldtypeSights = ""


SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(0, -5, -4)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(0, -14,-10)
SWEP.SprintAng = Angle(40, 0, 0)

SWEP.HolsterPos = Vector(0.532, -6, 0)
SWEP.HolsterAng = Vector(-25, 0, 0)

SWEP.ReloadPos = Vector(0, -10, -5)

SWEP.CustomizePos = Vector(-0.5, -8, -4.897)
SWEP.CustomizeAng = Angle(30, 0, 0)

SWEP.InBipodPos = Vector(-8, 0, -4)
SWEP.InBipodMult = Vector(2, 1, 1)
SWEP.DrawCrosshair = true

SWEP.BarrelLength = 60
SWEP.BarrelOffsetSighted = Vector(0, 0, 0)
SWEP.BarrelOffsetHip = Vector(3, 0, -3)
SWEP.DefaultElements = {"rg4d", "rg4d+"}

SWEP.AttachmentElements = {
    ["rg4d"] = {
        VMElements = {
            {
                Model = "models/arccw/kuro/sw_battlefront/weapons/rg4d_blaster.mdl",
                Bone = "LeftHand_1stP",
                Scale = Vector(1.1, 1.1, 1.1),
                Offset = {
                    pos = Vector(7.5, -0.5, -1),
                    ang = Angle(-5, -2, 90)
                }
            }
        },
    },
    ["rg4d+"] = {
         VMElements = {
            {
                Model = "models/arccw/kuro/sw_battlefront/weapons/rg4d_blaster.mdl",
                Bone = "RightHand_1stP",
                Scale = Vector(1.1, 1.1, 1.1),                
                Offset = {
                    pos = Vector(-7.5, 0.5, 1),
                    ang = Angle(0, 178, 90)
                }
            }
        }, 
        WMElements = {
            {
                Model = "models/arccw/kuro/sw_battlefront/weapons/rg4d_blaster.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(1.1, 1.1, 1.1),
                Offset = {
                    pos = Vector(90.5, 10, 20.75),
                    ang = Angle(180, -180, 2)
                }
            },
            {
                Model = "models/arccw/kuro/sw_battlefront/weapons/rg4d_blaster.mdl",
                Bone = "ValveBiped.Bip01_L_Hand",
                Scale = Vector(1.1, 1.1, 1.1),
                Offset = {
                    pos = Vector(10, 230, -25),
                    ang = Angle(180, -180, 2)
                }
            },
        },            -- change the world model to something else. Please make sure it's compatible with the last one.
    }
}
WMOverride = "models/arccw/kuro/sw_battlefront/weapons/rg4d_blaster.mdl"

--SWEP.Attachments 
SWEP.Attachments = {
    [1] = {
        PrintName = "Tactical", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"tactical","tac_pistol"},
        Bone = "RightHand_1stP", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(-12, -5, 1.5),
            vang = Angle(175, 0, 0),
        },
    },    
    [2] = {
        PrintName = "Energization", -- print name
        DefaultAttName = "Standard Energization", -- used to display the "no attachment" text
        Slot = "ammo",
    }
}


SWEP.Animations = {
    ["idle"] = {
        Source = "idle"
    },
    ["fire"] = {
        Source = {"shoot_lw", "shoot_rw"},
    },
    ["draw"] = {
        Source = "draw",
        Mult = 1.5,
        SoundTable = {
            {
                s = "draw/gunfoley_pistol_draw_var_10.mp3", -- sound; can be string or table
                p = 100, -- pitch
                v = 75, -- volume
                t = 0, -- time at which to play relative to Animations.Time
                c = CHAN_ITEM, -- channel to play the sound
            },
        }
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = {
            {
                s = "holster/gunfoley_pistol_sheathe_var_09.mp3", -- sound; can be string or table
                p = 100, -- pitch
                v = 75, -- volume
                t = 0, -- time at which to play relative to Animations.Time
                c = CHAN_ITEM, -- channel to play the sound
            },
        }
    },
    ["reload"] = {
        Source = "reload", 
        Time = 3.35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_PHYSGUN,
        SoundTable = {
            {s = "ArcCW_dc17.reload2", t = 4 / 30}, --s sound file
        },
    },


sound.Add({
    name =          "ArcCW_dc17.reload2",
    channel =       CHAN_ITEM,
    volume =        1.0,
    sound =             "weapons/bf3/pistols.wav"
    }),
}

-- AOCRP WAFFENSTATS arccw_dual_rg4d - 02.06.2024
SWEP.Damage = 30
SWEP.DamageMin = 15
SWEP.RangeMin = 90
SWEP.Range = 350
SWEP.Delay = 60 / 520
SWEP.Primary.ClipSize = 40
SWEP.Category = 'KUS'
--addons/arccw_weapons/lua/weapons/arccw_e5c.lua:
AddCSLuaFile()

SWEP.Base = "arccw_meeks_sw_base"
SWEP.Spawnable = true
SWEP.Category = "AOCRP - Droidenwaffen"
SWEP.Credits = { Author1 = "cat"}
SWEP.PrintName = "E-5C"
SWEP.Trivia_Class = "CIS Heavy Blaster Rifle"
SWEP.Trivia_Desc = "High tech CIS E-5C Heavy Blaster Rifle"
SWEP.Trivia_Manufacturer = "Baktoid Combat Automata"
SWEP.Trivia_Calibre = "Medium Density Bolt"
SWEP.Trivia_Mechanism = "Energized Compressed Tibanna"
SWEP.Trivia_Country = "GAR"
SWEP.Trivia_Year = 2020

SWEP.Slot = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/arccw/bf2017/c_t21.mdl"
SWEP.WorldModel = "models/arccw/bf2017/w_t21.mdl"
SWEP.ViewModelFOV = 70
SWEP.HideViewmodel = true
SWEP.WorldModelOffset = {
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 0.009
}

SWEP.IconOverride = "materials/entities/rw_sw_e5c.png"

SWEP.DefaultBodygroups = "000000000000"

SWEP.Damage = 35
SWEP.RangeMin = 145
SWEP.DamageMin = 24
SWEP.Range = 376
SWEP.Penetration = 1
SWEP.DamageType = DMG_BULLET
SWEP.MuzzleVelocity = 400


SWEP.TraceNum = 1
SWEP.PhysTracerProfile = 1


SWEP.TracerNum = 1
SWEP.Tracer = "tfa_tracer_red"
SWEP.TracerCol = Color(0, 0, 255)
SWEP.HullSize = 1.5

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 100

SWEP.Recoil = 0.44
SWEP.RecoilSide = 0.25
SWEP.RecoilPunch = 0.8
SWEP.RecoilRise = 0.34

SWEP.Delay = 60 / 444
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 2
    },
    {
        Mode = 0
    },         
}

SWEP.AccuracyMOA = 0.75 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 400 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 50

SWEP.Bipod_Integral = true -- Integral bipod (ie, weapon model has one)
SWEP.BipodDispersion = 0.8 -- Bipod dispersion for Integral bipods
SWEP.BipodRecoil = 0.5 -- Bipod recoil for Integral bipods

----AMMO / stuff----

SWEP.Primary.Ammo = "ar2"

SWEP.ShootVol = 100
SWEP.ShootPitch = 100

SWEP.ShootSound = "w/e5c.wav"
SWEP.ShootSoundSilenced = "w/dc19.wav"

SWEP.NoFlash = nil -- disable light flash
SWEP.MuzzleEffect = "wpn_muzzleflash_dc17_red"
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false

SWEP.MuzzleFlashColor = Color(250, 0, 0)

SWEP.IronSightStruct = {
    Pos = Vector(-1.7, -9, 0.8),
    Ang = Angle(0, 0, 0),
     Magnification = 1,
     SwitchToSound = "",
     ViewModelFOV = 55,
}
SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(5, -3, -1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(3, 0, 0)
SWEP.SprintAng = Angle(-10, 40, -40)

SWEP.HolsterPos = Vector(3.4, -6, 2)
SWEP.HolsterAng = Vector(-15, 30, -15)
SWEP.CustomizePos = Vector(20.824, -14, 3.897)
SWEP.CustomizeAng = Angle(12.149, 50.547, 45)

SWEP.DefaultElements = {"e5c", "muzzle"}

SWEP.AttachmentElements = {
    ["e5c"] = {
        VMElements = {
            {
                Model = "models/arccw/kuro/sw_battlefront/weapons/e5c_blaster.mdl",
                Bone = "v_t21_reference001",
                Scale = Vector(1, 1, 1),
                Offset = {
                    pos = Vector(0.699, 3.5, -2.8),
                    ang = Angle(0,-90, 0)
                }
            }
        },
    },
    ["muzzle"] = {
        VMElements = {
           {
               Model = "models/hunter/plates/plate.mdl",
               Bone = "t21_sight",
               Scale = Vector(0, 0, 0),                
               Offset = {
                   pos = Vector(-0.5, 4, 17 ),
                   ang = Angle(-90, 180, 0)
               },
               IsMuzzleDevice = true
           }
       },
        WMElements = {
            {
                Model = "models/arccw/kuro/sw_battlefront/weapons/e5c_blaster.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(1.1, 1.1, 1.1),
                Offset = {
                    pos = Vector(400, 50.5, 500),
                    ang = Angle(-15, 0, 180)
                }
            },
            {
                Model = "models/hunter/plates/plate.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(0, 0, 0),
                Offset = {
                    pos = Vector(3000, 0, -1100),
                    ang = Angle(-15, 0, 180)
                },
                IsMuzzleDevice = true
            },
        }, -- change the world model to something else. Please make sure it's compatible with the last one.
    }
}

WMOverride = "models/arccw/kuro/sw_battlefront/weapons/e5c_blaster.mdl"
--SWEP.Attachments 
SWEP.Attachments = {
    [1] = {
        PrintName = "Optic", -- print name
        DefaultAttName = "Iron Sights", -- used to display the "no attachment" text
        Slot = "optic",
        WMScale = Vector(111, 111, 111),
        Bone = "t21_sight", -- relevant bone any attachments wwill be mostly referring to
        Offset = {
            vpos = Vector(0.7, -2.3, 1.5),
            vang = Angle(90, 0, -90),
            wpos = Vector(150, 50, -750),
            wang = Angle(-15, 0, 180)
        },
    },    
    [2] = {
        PrintName = "Foregrip", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = "foregrip",
        WMScale = Vector(111, 111, 111),
        Bone = "t21_sight", -- relevant bone any attachments wwill be mostly referring to
        Offset = {
            vpos = Vector(0.5, 2.3, 11),
            vang = Angle(90, 0, -90),
            wang = Angle(170, 180, 0),
        },
        SlideAmount = {
        vmin = Vector(0.5, 2.3, 7),
        vmax = Vector(0.5, 2.3, 11),
        wmin = Vector(1800, 50, -550), 
        wmax = Vector(1800, 50, -550) -- how far this attachment can slide in both directions.
        },         
    },
    [3] = {
        PrintName = "Tactical", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"tactical","tac_pistol"},
        WMScale = Vector(111, 111, 111),
        Bone = "t21_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(1.7, 2.3, 14),
            vang = Angle(90, 0, 0),
            wpos = Vector(1800, 150, -550),
            wang = Angle(-15, 0, -90)
        },
    },
    [4] = {
        PrintName = "Muzzle", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"muzzle", "cr2_muzzle", "cr2c_muzzle", "stealth_muzzle"},
        WMScale = Vector(111, 111, 111),
        Bone = "t21_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.7, 0.7, 23),
            vang = Angle(90, 0, -90),
            wpos = Vector(2800, 50, -1070),
            wang = Angle(-15, 0, -90)
        },
    },
    [5] = {
        PrintName = "Magazine", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {},
        Bone = "t21_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.3, 2.3, 4),
            vang = Angle(0, 0, 0),
        },
    },        
    [6] = {
        PrintName = "Energization", -- print name
        DefaultAttName = "Standard Energization", -- used to display the "no attachment" text
        Slot = "ammo",
    },
    [7] = {
        PrintName = "Training/Perk", -- print name
        DefaultAttName = "None", -- used to display the "no attachment" text
        Slot = "perk",
    },
    [8] = {
        PrintName = "Charms", -- print name
        DefaultAttName = "No Charm", -- used to display the "no attachment" text
        Slot = {"charm"},
        WMScale = Vector(111, 111, 111),
        Bone = "t21_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(2, 0.8, 2),
            vang = Angle(90, 0, -90),
            wpos = Vector(600, 100, -520),
            wang = Angle(-10 , 0, 180)
        },
    },          
}


SWEP.Animations = {
    ["idle"] = {
        Source = "idle"
    },
    ["fire"] = {
        Source = "fire"
    },
    ["draw"] = {
        Source = "draw",
    },
    ["holster"] = {
        Source = "holster",
    },
    ["reload"] = {
        Source = "reload", 
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {s = "ArcCW_dc15a.reload2", t = 4 / 30}, --s sound file
        },
    },


sound.Add({
    name =          "ArcCW_dc15a.reload2",
    channel =       CHAN_ITEM,
    volume =        1.0,
    sound =             "weapons/bf3/heavy.wav"
    }),
}


-- AOCRP WAFFENSTATS arccw_e5c - 02.06.2024
SWEP.Damage = 25
SWEP.DamageMin = 10
SWEP.RangeMin = 500
SWEP.Range = 3500
SWEP.Delay = 60 / 500
SWEP.Primary.ClipSize = 55
SWEP.Category = 'KUS'
--addons/arccw_weapons/lua/weapons/arccw_sops_fc1.lua:
AddCSLuaFile()

SWEP.Base = "arccw_masita_base"
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Slot = 4

-- Trivia
SWEP.Category = "AOCRP - Nicht eingestelle Waffen"
SWEP.Credits = "Kraken"
SWEP.PrintName = "FC-1 Flechette Launcher"
SWEP.Trivia_Class = "High-Explosive Weapon"
SWEP.Trivia_Desc = "Flechette launchers were weapons that fired flechettes. Golan Arms's FC-1 flechette launcher and the Salus Corporation's DF-D1 Duo-Flechette Rifle were both models of flechette launcher."
SWEP.Trivia_Year = 2023
SWEP.IconOverride = "entities/sopsmisc/flechette.png"

-- Viewmodel & Entity Properties
SWEP.HideViewmodel = false
SWEP.UseHands = true

SWEP.ViewModel = "models/arccw/masita/viewmodels/base_rifle_animations.mdl"
SWEP.WorldModel = "models/weapons/synbf3/w_t21.mdl"
SWEP.ViewModelFOV = 66
SWEP.HideViewmodel = true
SWEP.WorldModelOffset = {
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 0.09
}

-- Damage & Tracer
SWEP.ShootEntity = "rocket_micro"
SWEP.MuzzleVelocity = 3400

SWEP.Jamming = true
SWEP.HeatGain = 1
SWEP.HeatCapacity = 2.5
SWEP.HeatDissipation = 2 -- rounds' worth of heat lost per second
SWEP.HeatLockout = true -- overheating means you cannot fire until heat has been fully depleted
SWEP.HeatDelayTime = 1.7
SWEP.HeatFix = true -- when the "fix" animation is played, all heat is restored.

SWEP.ChamberSize = 0 
SWEP.Primary.ClipSize = 6
SWEP.ExtendedClipSize = 8
SWEP.ReducedClipSize = 2

SWEP.Recoil = 1.87
SWEP.RecoilSide = 0.23
SWEP.RecoilRise = 0.78
SWEP.Delay = 60 / 102

SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 1
    },
    {
        Mode = 2
    },
    {
        Mode = 0
    },         
}

SWEP.AccuracyMOA = 0.5
SWEP.HipDispersion = 300
SWEP.MoveDispersion = 200

-- Sounds & Muzzleflash
SWEP.Primary.Ammo = "RPG_Round"
SWEP.MagID = "rpg7"

SWEP.ShootVol = 50
SWEP.ShootPitch = 70
SWEP.ShootPitchVariation = 0.05

SWEP.FirstShootSound = "sops-v2/weapons/fc1.wav"
SWEP.ShootSound = "sops-v2/weapons/fc1.wav"
SWEP.ShootSoundSilenced = "sops-v2/weapons/silenced.mp3"

SWEP.NoFlash = nil
SWEP.MuzzleEffect = "wpn_muzzleflash_dc17_orange"
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false
SWEP.MuzzleFlashColor = Color(250, 233, 0)

-- Ironsight & Holdtype
SWEP.IronSightStruct = {
    Pos = Vector(-3.33, -1, -1),
    Ang = Angle(1, -0.5, -3),
     Magnification = 2,
     SwitchToSound = "sops-v2/interaction/zoom_start.mp3",
     SwitchFromSound = "sops-v2/interaction/zoom_end.mp3",
     ViewModelFOV = 55,
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN

SWEP.ActivePos = Vector(0, 2, 0)
SWEP.ActiveAng = Angle(1, -0.5, -5)

SWEP.SprintPos = Vector(7, 0, -4)
SWEP.SprintAng = Angle(5, 40, 0)

SWEP.CustomizePos = Vector(9.824, 2, -2.897)
SWEP.CustomizeAng = Angle(12.149, 30.547, 0)

SWEP.HolsterPos = Vector(4, -3, 2)
SWEP.HolsterAng = Vector(-15, 30, -15)

-- Attachments 
SWEP.DefaultElements = {"blaster", "muzzle"}
SWEP.AttachmentElements = {
    ["blaster"] = {
        VMElements = {
            {
                Model = "models/arccw/kraken/sops-v2/fc1.mdl",
                Bone = "E11S_CONTR",
                ModelBodygroups = "0000000",
                Scale = Vector(1, 1, 1),
                Offset = {
                    pos = Vector(0.1, 0, -1.5),
                    ang = Angle(0, -90, 0)
                }
            }
        },
    },
    ["muzzle"] = {
        VMElements = {
           {
               Model = "models/hunter/plates/plate.mdl",
               Bone = "E11S_CONTR",
               Scale = Vector(0, 0, 0),                
               Offset = {
                   pos = Vector(0, 14, -5),
                   ang = Angle(-90, 180, 0)
               },
               IsMuzzleDevice = true
           }
        },
        WMElements = {
            {
                Model = "models/arccw/kraken/sops-v2/fc1.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(1.1, 1.1, 1.1),
                ModelBodygroups = "0000000",
                Offset = {
                    pos = Vector(100, 10, -50),
                    ang = Angle(-15, 0, 180)
                }
            },
            {
                Model = "models/hunter/plates/plate.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(0, 0, 0),
                Offset = {
                    pos = Vector(250, 15, -100),
                    ang = Angle(-15, 0, 180)
                },
                IsMuzzleDevice = true
            },              
        },
    }
}WMOverride = "models/arccw/kraken/sops-v2/fc1.mdl"

SWEP.Attachments = {     
    {
        PrintName = "Optic", 
        DefaultAttName = "Standard", 
        Slot = "optic",
        WMScale = Vector(11, 11, 11),
        Bone = "E11S_CONTR",
        Offset = {
            vpos = Vector(0, -6, 3.5),
            vang = Angle(0, -90, 0),
            wpos = Vector(0, 8.7, -90),
            wang = Angle(-15, 0, 180)
        },
        CorrectiveAng = Angle(0, 180, 0),
        CorrectivePos = Vector(0, 0, 0)
    },  
    {
        PrintName = "Tactical",
        DefaultAttName = "None",
        Slot = {"tactical", "tac_pistol", "tac"},
        VMScale = Vector(1, 1, 1),
        WMScale = Vector(11, 11, 11),
        Bone = "E11S_CONTR", 
        Offset = {
            vpos = Vector(2.6, 9, 1),
            vang = Angle(0, -90, 90),
            wpos = Vector(220, 42, -110),
            wang = Angle(-15, 0, -90)
        },
    },  
    {
        PrintName = "Rocket", 
        DefaultAttName = "None",
        Slot = {"ammo_rocket"},
    },
    {
        PrintName = "Grip",
        Slot = "grip",
        DefaultAttName = "None"
    },         
    {
        PrintName = "Perk",
        DefaultAttName = "None",
        Slot = {"perk", "mw3_pro"},
    },
    {
        PrintName = "Internal Modifications",
        DefaultAttName = "None",
        Slot = {"uc_fg"},
    },
    {
        PrintName = "Charm",
        DefaultAttName = "None",
        Slot = {"charm"},
        Bone = "E11S_CONTR",
        VMScale = Vector(0.7, 0.7, 0.7),
        WMScale = Vector(9, 9, 9),
        Offset = {
            vpos = Vector(2.6, -2, 0.5),
            vang = Angle(0, -90, 0),
            wpos = Vector(65, 41, -65),
            wang = Angle(-15, 0, 180)
        },
    },    
}

-- Don't touch this unless you know what you're doing
SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },
    ["fire"] = {
        Source = {"shoot"},
    },
    ["fire_iron"] = {
        Source = false,
    },
    ["draw"] = {
        Source = "draw",
        Mult = 1,
        SoundTable = {
            {
                s = "sops-v2/interaction/equip.wav",
                p = 100,
                v = 75,
                t = 0.1,
                c = CHAN_ITEM,
            },
        }
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = {
            {
                s = "sops-v2/interaction/equip2.wav",
                p = 100, 
                v = 75, 
                t = 0.1,
                c = CHAN_ITEM,
            },
        }
    },
    ["reload"] = {
        Source = "reload", 
        LHIK = true,
        Mult = 1,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {s = "everfall/weapons/miscellaneous/reload/overheat/overheat_overheated_large_var_02.mp3", t = 10 / 60},
            {s = "everfall/weapons/miscellaneous/reload/reset/overheat_reset_var_04.mp3", t = 120 / 60},
        },
    },
}
--addons/arccw_weapons/lua/weapons/arccw_sops_tl50.lua:
AddCSLuaFile()

SWEP.Base = "arccw_masita_base"
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Slot = 3

-- Trivia
SWEP.Category = "AOCRP - Nicht eingestelle Waffen"
SWEP.Credits = "Kraken"
SWEP.PrintName = "TL-50"
SWEP.Trivia_Class = "Blaster Heavy Repeater"
SWEP.Trivia_Desc = "The TL-50 Heavy Repeater was a model of heavy repeating blaster rifle that was manufactured for the special forces of the Galactic Empire. In addition to sending storms of blaster bolts from its multiple barrels, the rifle could gather its energy into a powerful concussion blast. It could also be modified with an extended barrel for reduced spread and with a power cell for increased cooling power. During the Galactic Civil War against the Rebel Alliance, Commander Iden Versio of the Empire's elite Inferno Squad carried a TL-50 Heavy Repeater."
SWEP.IconOverride = "entities/sopsmisc/tl50.png"

-- Viewmodel & Entity Properties
SWEP.UseHands = true
SWEP.ViewModel = "models/arccw/kraken/sops-v2/c_tl-50.mdl"
SWEP.WorldModel = "models/arccw/kraken/sops-v2/w_tl-50.mdl"
SWEP.ViewModelFOV = 55
SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos = Vector(-22, 10, -6),
    ang = Angle(-10, 0, 180)
}

-- Damage & Tracer
SWEP.Damage = 47
SWEP.RangeMin = 250
SWEP.DamageMin = 23
SWEP.Range = 423
SWEP.Penetration = 7
SWEP.DamageType = DMG_BULLET

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 50
SWEP.ExtendedClipSize = 75
SWEP.ReducedClipSize = 30

SWEP.MuzzleVelocity = 800
SWEP.TraceNum = 1
SWEP.Tracer = "tracer_red"
SWEP.TracerCol = Color(250, 0, 0)
SWEP.HullSize = 0.5

SWEP.Recoil = 0.54
SWEP.RecoilSide = 0.21
SWEP.RecoilRise = 0.72

SWEP.Delay = 60 / 520
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

-- Speed Mult
SWEP.SpeedMult = 1
SWEP.SightedSpeedMult = 0.83
SWEP.SightTime = 0.3

-- Ammo, Sounds & MuzzleEffect
SWEP.Primary.Ammo = "ar2"

SWEP.ShootVol = 50
SWEP.ShootPitch = 100
SWEP.ShootPitchVariation = 0.05

SWEP.FirstShootSound = "sops-v2/weapons/tl50.wav"
SWEP.ShootSound = "sops-v2/weapons/tl50.wav"
SWEP.ShootSoundSilenced = "sops-v2/weapons/silenced.mp3"

SWEP.NoFlash = nil
SWEP.MuzzleEffect = "wpn_muzzleflash_dc17_red"
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false
SWEP.MuzzleFlashColor = Color(250, 0, 0)

-- Ironsight
SWEP.IronSightStruct = {
    Pos = Vector(-9.122, -19.1, 2.43),
    Ang = Angle(0, 0, 0),
     Magnification = 1.2,
     SwitchToSound = "sops-v2/interaction/zoom_start.mp3",
     SwitchFromSound = "sops-v2/interaction/zoom_end.mp3",
     ViewModelFOV = 50,
}

-- Holdtype
SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(-4, -7, 2)
SWEP.ActiveAng = Angle(1, -0.5, -5)

SWEP.SprintPos = Vector(7, 0, -4)
SWEP.SprintAng = Angle(5, 40, 0)

SWEP.CustomizePos = Vector(9.824, -10, 0)
SWEP.CustomizeAng = Angle(12.149, 30.547, 0)

SWEP.HolsterPos = Vector(4, -3, 2)
SWEP.HolsterAng = Vector(-15, 30, -15)

-- Attachments
SWEP.Attachments = {   
    {
        PrintName = "Optic",
        DefaultAttName = "None",
        Slot = "optic",
        Bone = "TL-50",
        Offset = {
            vpos = Vector(-0.1, -5, -2.7),
            vang = Angle(0, 90, 180),
        },
        CorrectiveAng = Angle(0, -180, 0),
        CorrectivePos = Vector(0, 0, 0),
    }, 
    {
        PrintName = "Tactical",
        DefaultAttName = "None",
        Slot = {"tactical", "tac_pistol", "tac"},
        VMScale = Vector(0.7, 0.7, 0.7),
        Bone = "TL-50",
        Offset = {
            vpos = Vector(-0.1, -15, 1.5),
            vang = Angle(0, 90, -180),
        },
    },  
    {
        PrintName = "Energization", 
        DefaultAttName = "Standard",
        Slot = {"ammo", "ammo_masita"},
    },
    {
        PrintName = "Perk",
        DefaultAttName = "None",
        Slot = {"perk", "mw3_pro"},
    },
    {
        PrintName = "Internal Modifications",
        DefaultAttName = "None",
        Slot = {"uc_fg"},
    },   
    {
        PrintName = "Grip",
        Slot = "grip",
        DefaultAttName = "Standard Grip"
    },    
    {
        PrintName = "Killcounter",
        DefaultAttName = "None",
        Slot = {"killcounter"},
        Bone = "TL-50",
        Offset = {
            vpos = Vector(0.7, -6, -2),
            vang = Angle(0, 90, 205),
        },
    },     
    {
        PrintName = "Charms",
        DefaultAttName = "None",
        Slot = {"charm"},
        Bone = "TL-50",
        Offset = {
            vpos = Vector(1.2, -0, 0.250),
            vang = Angle(0, 90, 180),
        },
    },   
}

-- Don't touch this unless you know what you're doing
SWEP.Animations = {
    ["idle"] = {
        Source = "idle"
    },
    ["fire"] = {
        Source = "fire",
    },
    ["fire_iron"] = {
        Source = false,
    },
    ["draw"] = {
        Source = "draw",
        SoundTable = {
            {
                s = "sops-v2/interaction/equip.wav",
                p = 100,
                v = 75,
                t = 0.1,
                c = CHAN_ITEM,
            },
        }
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = {
            {
                s = "sops-v2/interaction/equip2.wav",
                p = 100, 
                v = 75, 
                t = 0.1,
                c = CHAN_ITEM,
            },
        }
    },
    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Time = 3,
        SoundTable = {
            {s = "everfall/weapons/miscellaneous/reload/overheat/overheat_manualcooling_var_02.mp3", t = 5 / 30},
            {s = "weapon_hand/reload_gentle/mag_eject/023d-00001014.mp3", t = 10 / 30},
            {s = "weapon_hand/reload_gentle/mag_load/023d-00000dda.mp3", t = 65 / 30},
            {s = "everfall/weapons/miscellaneous/reload/reset/overheatactivecoolingsuccess_var_04.mp3", t = 90 / 30},
        },
    },
}
--addons/arccw_weapons/lua/weapons/arccw_sops_x11.lua:
AddCSLuaFile()

SWEP.Base = "arccw_masita_base"
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Slot = 2

-- Trivia
SWEP.Category = "AOCRP - Nicht eingestelle Waffen"
SWEP.Credits = "Kraken"
SWEP.PrintName = "X-11"
SWEP.Trivia_Class = "Blaster-Experimental Pistol"
SWEP.Trivia_Desc = "The X-11 hand blaster, also known as X-11 blaster pistol, was a heavy blaster pistol wielded by the Clone Trooper 'Echo' of the Grand Army of the Galactic Republic during the Clone Wars."
SWEP.Trivia_Calibre = "Tibanna Gas"
SWEP.IconOverride = "entities/sopsmisc/x11.png"

-- Viewmodel & Entity Properties
SWEP.HideViewmodel = false
SWEP.UseHands = true

SWEP.ViewModel = "models/arccw/masita/viewmodels/blasterpistol_template.mdl"
SWEP.WorldModel = "models/arccw/bf2017/w_e11.mdl"
SWEP.ViewModelFOV = 55
SWEP.HideViewmodel = true
SWEP.WorldModelOffset = {
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 0.09
}

-- Damage & Tracer
SWEP.BodyDamageMults =  {
    [HITGROUP_HEAD] = 2.5,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_LEFTARM] = 0.9,
    [HITGROUP_RIGHTARM] = 0.9,
}

SWEP.Damage = 37
SWEP.RangeMin = 107
SWEP.DamageMin = 20
SWEP.Range = 289
SWEP.Penetration = 8
SWEP.DamageType = DMG_BULLET
SWEP.MuzzleVelocity = 800
SWEP.TraceNum = 1
SWEP.Tracer = "tracer_blue"
SWEP.TracerCol = Color(0, 0, 250)
SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 23

SWEP.Recoil = 0.43
SWEP.RecoilSide = 0.12
SWEP.RecoilRise = 0.98
SWEP.Delay = 60 / 265

SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 1
    },
    {
        Mode = 2
    },
    {
        Mode = 0
    },         
}

SWEP.AccuracyMOA = 50
SWEP.HipDispersion = 250
SWEP.MoveDispersion = 100

-- Sounds & Muzzleflash
SWEP.Primary.Ammo = "ar2"

SWEP.ShootVol = 50
SWEP.ShootPitch = 100
SWEP.ShootPitchVariation = 0.05

SWEP.FirstShootSound = "sops-v2/weapons/x11.wav"
SWEP.ShootSound = "sops-v2/weapons/x11.wav"
SWEP.ShootSoundSilenced = "sops-v2/weapons/silenced.mp3"

SWEP.NoFlash = nil
-- SWEP.MuzzleEffect = "wpn_muzzleflash_dc17"
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false
SWEP.MuzzleFlashColor = Color(0, 0, 250)

-- Ironsight & Holdtype
SWEP.IronSightStruct = {
    Pos = Vector(-5.74, -12.646, 1),
    Ang = Angle(0, -1, 0),
     Magnification = 1.3,
     SwitchToSound = "sops-v2/interaction/zoom_start.mp3",
     SwitchFromSound = "sops-v2/interaction/zoom_end.mp3",
     ViewModelFOV = 55,
}

SWEP.HoldtypeHolstered = "normal"
SWEP.HoldtypeActive = "pistol"
SWEP.HoldtypeSights = "revolver"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL

SWEP.ActivePos = Vector(-4, 0, 0)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(0, 0, -20)
SWEP.SprintAng = Angle(40, 0, 0)

SWEP.HolsterPos = Vector(0.532, -6, 0)
SWEP.HolsterAng = Vector(-15, 0, 0)

SWEP.CustomizePos = Vector(10, -13, 0)
SWEP.CustomizeAng = Angle(12, 50.5, 45)

-- Attachments 
SWEP.DefaultElements = {"blaster", "muzzle"}
SWEP.AttachmentElements = {
    ["blaster"] = {
        VMElements = {
            {
                Model = "models/arccw/kraken/sops-v2/holo_x11.mdl",
                Bone = "DC-15SA",
                Scale = Vector(0.9, 0.9, 0.9),
                Offset = {
                    pos = Vector(-0.5, 0.9, -4.9),
                    ang = Angle(90, 0, -92)
                }
            }
        },
    },
    ["muzzle"] = {
        VMElements = {
           {
               Model = "models/hunter/plates/plate.mdl",
               Bone = "DC-15SA",
               Scale = Vector(0, 0, 0),                
               Offset = {
                   pos = Vector(-2, 3, 9),
                   ang = Angle(-90, 180, 0)
               },
               IsMuzzleDevice = true
           }
        },
        WMElements = {
            {
                Model = "models/arccw/kraken/sops-v2/holo_x11.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(1.1, 1.1, 1.1),
                Offset = {
                    pos = Vector(30, 20, -10),
                    ang = Angle(-15, 0, 180)
                }
            },
            {
                Model = "models/hunter/plates/plate.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(0, 0, 0),
                Offset = {
                    pos = Vector(120, 20, -50),
                    ang = Angle(-15, 0, 180)
                },
                IsMuzzleDevice = true
            },              
        },
    }
}WMOverride = "models/arccw/kraken/sops-v2/holo_x11.mdl"

SWEP.Attachments = {
    {
        PrintName = "Optic", 
        DefaultAttName = "Standard", 
        Slot = "optic",
        WMScale = Vector(11, 11, 11),
        Bone = "DC-15SA",
        Offset = {
            vpos = Vector(-0.58, -2.2, -5),
            vang = Angle(90, 0, -90),
            wpos = Vector(35, 20, -55),
            wang = Angle(-15, 0, 180)
        },
        CorrectiveAng = Angle(0, 0, 0)
    },    
    {
        PrintName = "Tactical",
        DefaultAttName = "None",
        Slot = {"tactical", "tac_pistol", "tac"},
        VMScale = Vector(0.7, 0.7, 0.7),
        WMScale = Vector(11, 11, 11),
        Bone = "DC-15SA", 
        Offset = {
            vpos = Vector(-0.58, 1.4, 3),
            vang = Angle(90, 0, -90),
            wpos = Vector(110, 20, -28  ),
            wang = Angle(-15, 0, 180)
        },
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "None",
        VMScale = Vector(1, 1, 1),
        WMScale = Vector(11, 11, 11),
        Slot = {"muzzle", "cr2_muzzle", "cr2c_muzzle", "stealth_muzzle", "b1120_muzzle"},
        Bone = "DC-15SA",
        Offset = {
            vpos = Vector(-0.58, -1.2, 4.6),
            vang = Angle(90, 0, -92),
            wpos = Vector(150, 21, -73),
            wang = Angle(-15, 0, 180)

        },
    },       
    {
        PrintName = "Ammunition",
        DefaultAttName = "Standard",
        Slot = {"ammo"},
    },
    {
        PrintName = "Perk",
        DefaultAttName = "None",
        Slot = "perk",
    },
    {
        PrintName = "Internal Modifications",
        DefaultAttName = "None",
        Slot = "uc_fg",
    },
    {
        PrintName = "Charm",
        DefaultAttName = "None",
        Slot = {"charm"},
        Bone = "DC-15SA",
        VMScale = Vector(0.6, 0.6, 0.6),
        WMScale = Vector(9, 9, 9),
        Offset = {
            vpos = Vector(0.3, -1, -1),
            vang = Angle(90, 0, -90),
            wpos = Vector(70, 29, -50),
            wang = Angle(-15, 0, 180)
        },
    },     
    {
        PrintName = "Killcounter",
        DefaultAttName = "None",
        Slot = {"killcounter"},
        WMScale = Vector(11, 11, 11),
        Bone = "DC-15SA",
        Offset = {
            vpos = Vector(0.2, -1.3, 2.7),
            vang = Angle(90, 0, -90),
            wpos = Vector(120, 29, -64),
            wang = Angle(-15, 0, 180)
        },
    },      
}

-- Don't touch this unless you know what you're doing
SWEP.Animations = {
    ["idle"] = {
        Source = false
    },
    ["fire"] = {
        Source = {"Fire"},
    },
    ["fire_iron"] = {
        Source = {"Fire"},
    },
    ["draw"] = {
        Source = "draw",
        Mult = 1,
        SoundTable = {
            {
                s = "sops-v2/interaction/equip.wav",
                p = 100,
                v = 75,
                t = 0.1,
                c = CHAN_ITEM,
            },
        }
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = {
            {
                s = "sops-v2/interaction/equip2.wav",
                p = 100, 
                v = 75, 
                t = 0.1,
                c = CHAN_ITEM,
            },
        }
    },
    ["reload"] = {
        Source = "reload", 
        LHIK = true,
        Mult = 1,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {s = "everfall/weapons/miscellaneous/reload/overheat/overheat_overheated_large_var_02.mp3", t = 10 / 60},
            {s = "everfall/weapons/miscellaneous/reload/reset/overheat_reset_var_04.mp3", t = 105 / 60},
        },
    },
}
--addons/arccw_weapons/lua/weapons/arccw_sops_x11_dual.lua:
AddCSLuaFile()

SWEP.Base = "arccw_masita_base"
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Slot = 2

-- Trivia
SWEP.Category = "AOCRP - Nicht eingestelle Waffen"
SWEP.Credits = "Kraken/Masita"
SWEP.PrintName = "X-11 Dual"
SWEP.Trivia_Class = "Blaster-Experimental Pistol"
SWEP.Trivia_Desc = "The X-11 hand blaster, also known as X-11 blaster pistol, was a heavy blaster pistol wielded by the Clone Trooper 'Echo' of the Grand Army of the Galactic Republic during the Clone Wars."
SWEP.IconOverride = "entities/sopsmisc/dual x11.png"

-- Viewmodel & Entity Properties
SWEP.HideViewmodel = false
SWEP.UseHands = true

SWEP.ViewModel = "models/arccw/masita/viewmodels/blasterdualpistol_template.mdl"
SWEP.WorldModel = "models/arccw/bf2017/w_e11.mdl"
SWEP.ViewModelFOV = 65
SWEP.NoHideLeftHandInCustomization = true
SWEP.HideViewmodel = true
SWEP.WorldModelOffset = {
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 0.09
}

-- Damage & Tracer
SWEP.BodyDamageMults =  {
    [HITGROUP_HEAD] = 2.5,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_LEFTARM] = 0.9,
    [HITGROUP_RIGHTARM] = 0.9,
}

SWEP.Damage = 38
SWEP.RangeMin = 132
SWEP.DamageMin = 23
SWEP.Range = 304
SWEP.Penetration = 2
SWEP.DamageType = DMG_BULLET
SWEP.MuzzleVelocity = 800
SWEP.TraceNum = 1
SWEP.Tracer = "tracer_blue"
SWEP.TracerCol = Color(0, 0, 250)
SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 46

SWEP.Recoil = 1.04
SWEP.RecoilSide = 0.12
SWEP.RecoilRise = 0.56
SWEP.Delay = 60 / 402

SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 1
    },
    {
        Mode = 2
    },
    {
        Mode = 0
    },         
}

SWEP.AccuracyMOA = 0.2 
SWEP.HipDispersion = 350
SWEP.MoveDispersion = 100

-- Sounds & Muzzleflash
SWEP.Primary.Ammo = "ar2"

SWEP.ShootVol = 50
SWEP.ShootPitch = 100
SWEP.ShootPitchVariation = 0.05

SWEP.FirstShootSound = "sops-v2/weapons/x11.wav"
SWEP.ShootSound = "sops-v2/weapons/x11.wav"
SWEP.ShootSoundSilenced = "sops-v2/weapons/silenced.mp3"

SWEP.NoFlash = nil
SWEP.MuzzleEffect = false
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false
SWEP.MuzzleFlashColor = Color(0, 0, 250)

-- Ironsight & Holdtype
SWEP.IronSightStruct = {
    Pos = Vector(0, -5, 0.6),
    Ang = Angle(0, 0, 0),
     Magnification = 1.3,
     SwitchToSound = "weapon_hand/ads/0242-00001a46.mp3",
     SwitchFromSound = "weapon_hand/ads/0242-00001a43.mp3",
     ViewModelFOV = 55,
}

SWEP.HoldtypeHolstered = "normal"
SWEP.HoldtypeActive = "duel"
SWEP.HoldtypeSights = "duel"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(-1, -5, -1)
SWEP.ActiveAng = Angle(5, 0, 0)

SWEP.SprintPos = Vector(0, -14,-10)
SWEP.SprintAng = Angle(40, 0, 0)

SWEP.HolsterPos = Vector(0.532, -6, 0)
SWEP.HolsterAng = Vector(-25, 0, 0)

SWEP.ReloadPos = Vector(0, -5, -0)

SWEP.CustomizePos = Vector(-0.5, -8, -4.897)
SWEP.CustomizeAng = Angle(10, 0, 0)

-- Attachments 
SWEP.DefaultElements = {"blaster", "blasterdual"}
SWEP.AttachmentElements = {
    ["blaster"] = {
        VMElements = {
            {
                Model = "models/arccw/kraken/sops-v2/holo_x11.mdl",
                Bone = "Gun1",
                Scale = Vector(1.1, 1.1, 1.1),
                Offset = {
                    pos = Vector(0, 2.5, -0.4),
                    ang = Angle(90, 90, 175)
                }
            },
            {
                Model = "models/arccw/kraken/sops-v2/holo_x11.mdl",
                Bone = "Gun2",
                Scale = Vector(1.1, 1.1, 1.1),
                Offset = {
                    pos = Vector(0.1, 3, -0.2),
                    ang = Angle(80, 95, 175)
                }
            },
        },
    },
    ["blasterdual"] = {
        WMElements = {
            {
                Model = "models/arccw/kraken/sops-v2/holo_x11.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(1, 1, 1),
                Offset = {
                    pos = Vector(70, 15, -10),
                    ang = Angle(180, -180, 2)
                }
            },
            {
                Model = "models/arccw/kraken/sops-v2/holo_x11.mdl",
                Bone = "ValveBiped.Bip01_L_Hand",
                Scale = Vector(1, 1, 1),
                Offset = {
                    pos = Vector(-23, 230, -55),
                    ang = Angle(180, -180, 2)
                }
            },
        },              
    }
}WMOverride = "models/arccw/kraken/sops-v2/holo_x11.mdl"

SWEP.Attachments = { 
    {
        PrintName = "Ammo",
        DefaultAttName = "Standard",
        Slot = {"ammo"},
    },
    {
        PrintName = "Perk",
        DefaultAttName = "None",
        Slot = "perk",
    },
    {
        PrintName = "Internal Modifications",
        DefaultAttName = "None",
        Slot = "uc_fg",
    },
}

-- Don't touch this unless you know what you're doing
SWEP.Animations = {
    ["idle"] = {
        Source = false
    },
    ["idle_inspect"] = {
        Source = "lookat01",
        Time = 7,
    },
    ["exit_inspect"] = {
        Source = "idle"
    },
    ["fire"] = {
        Source = {"shoot_l", "shoot_r"},
    },
    ["fire_iron"] = {
        Source = {"shoot_l", "shoot_r"},
    },
    ["bash"] = {
        Source = "bash"
    },
    ["draw"] = {
        Source = "draw",
        Mult = 1,
        SoundTable = {
            {
                s = "weapons/valken1908/retrofitescapadedraw2.wav",
                p = 100,
                v = 75,
                t = 0,
                c = CHAN_ITEM,
            },
        }
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = {
            {
                s = "weapons/valken1908/retrofitescapadedraw2.wav",
                p = 100, 
                v = 75, 
                t = 0,
                c = CHAN_ITEM,
            },
        }
    },
    ["reload"] = {
        Source = "reload", 
        LHIK = true,
        Mult = 1,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_PHYSGUN,
        SoundTable = {
            {s = "everfall/weapons/miscellaneous/reload/overheat/overheat_overheated_large_var_02.mp3", t = 10 / 60},
            {s = "everfall/weapons/miscellaneous/reload/reset/overheat_reset_var_04.mp3", t = 105 / 60},
        },
    },
}
--addons/arccw_weapons/lua/weapons/arccw_sops_z6chaingun.lua:
AddCSLuaFile()

SWEP.Base = "arccw_masita_base"
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Slot = 4

-- Trivia
SWEP.Category = "AOCRP - Nicht eingestelle Waffen"
SWEP.Credits = "Kraken"
SWEP.PrintName = "Z-6 Chaingun"
SWEP.Trivia_Class = "Blaster Heavy Canon"
SWEP.Trivia_Desc = "Available only to the Clone Commander class of the Republic, or the Rail ARC Troopers of Kamino, the Chaingun is a large shoulder-worn weapon, which is particularly effective, and indeed intended for attacking infantry, especially droids."
SWEP.IconOverride = "entities/sopsmisc/z6chain.png"

-- Viewmodel & Entity Properties
SWEP.ViewModel = "models/weapons/c_rpg.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"
SWEP.ViewModelFOV = 60
SWEP.HideViewmodel = true
SWEP.WorldModelOffset = {
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 0.009
}

-- Damage & Tracer
SWEP.BodyDamageMults =  {
    [HITGROUP_HEAD] = 2.5,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_LEFTARM] = 0.9,
    [HITGROUP_RIGHTARM] = 0.9,
}

SWEP.Damage = 28
SWEP.RangeMin = 89
SWEP.DamageMin = 21
SWEP.Range = 302
SWEP.Penetration = 2
SWEP.DamageType = DMG_BULLET
SWEP.MuzzleVelocity = 800
SWEP.TraceNum = 1
SWEP.Tracer = "tracer_blue"
SWEP.TracerCol = Color(0, 0, 250)
SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 220

SWEP.Recoil = 0.45
SWEP.RecoilSide = 0.23
SWEP.RecoilRise = 0.98
SWEP.Delay = 60 / 321

SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 2
    },
    {
        Mode = 0
    },         
}

SWEP.AccuracyMOA = 0.5
SWEP.HipDispersion = 400
SWEP.MoveDispersion = 100

-- Special Properties
SWEP.TriggerDelay = true

-- Sounds & Muzzleflash
SWEP.Primary.Ammo = "ar2"

SWEP.ShootVol = 50
SWEP.ShootPitch = 125
SWEP.ShootPitchVariation = 0.05

SWEP.FirstShootSound = "sops-v2/weapons/z6_chain/fire.wav"
SWEP.ShootSound = "sops-v2/weapons/z6_chain/fire.wav"
SWEP.ShootSoundSilenced = "sops-v2/weapons/silenced.mp3"

SWEP.NoFlash = nil
-- SWEP.MuzzleEffect = "wpn_muzzleflash_dc17"
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false
SWEP.MuzzleFlashColor = Color(0, 0, 250)

-- Ironsight
SWEP.IronSightStruct = {
    Pos = Vector(-11, -12, 3.5),
    Ang = Vector(0, 0, 0),
     Magnification = 1.5,
     SwitchToSound = "sops-v2/interaction/zoom_start.mp3",
     SwitchFromSound = "sops-v2/interaction/zoom_end.mp3",
     ViewModelFOV = 50,
}

-- Holdtype
SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "rpg"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(-7, -12, 4)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(5.226, -2, 0)
SWEP.SprintAng = Angle(-18, 36, -13.5)

SWEP.CustomizePos = Vector(8, -4.8, -3)
SWEP.CustomizeAng = Angle(11.199, 38, 0)

SWEP.HolsterPos = Vector(4, -3, 2)
SWEP.HolsterAng = Vector(-15, 30, -15)

SWEP.Jamming = true
SWEP.HeatGain = 0.95 
SWEP.HeatCapacity = 100
SWEP.HeatDissipation = 10
SWEP.HeatLockout = true
SWEP.HeatDelayTime = 0.5

-- Attachments
SWEP.DefaultElements = {"chain", "muzzle"}
SWEP.AttachmentElements = {
    ["chain"] = {
        VMElements = {
            {
                Model = "models/arccw/kraken/sops-v2/chaingun_base.mdl",
                Bone = "base",
                Scale = Vector(1, 1, 1),
                Offset = {
                    pos = Vector(-1, 4, 13.5),
                    ang = Angle(0, -180, 90),
                }
            }
        }
    },
    ["muzzle"] = {
         VMElements = {
            {
                Model = "models/hunter/plates/plate.mdl",
                Bone = "base",
                Scale = Vector(0, 0, 0),                
                Offset = {
                    pos = Vector(-3, 0, 13),
                    ang = Angle(90, 0, 0)
                },
                IsMuzzleDevice = true
            }
        },
        WMElements = {
            {
                Model = "models/arccw/kraken/sops-v2/chaingun_base.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(0.9, 0.9, 0.9),
                Offset = {
                    pos = Vector(900, 0, -320),
                    ang = Angle(0, 90, 180)
                }
            },
            {
                Model = "models/hunter/plates/plate.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(0, 0, 0),
                Offset = {
                    pos = Vector(2000, 0, -650),
                    ang = Angle(0, 0, 180)
                },
                IsMuzzleDevice = true
            },            
        },
    }
}

SWEP.Attachments = {    
    {
        PrintName = "Energization", 
        DefaultAttName = "Standard",
        Slot = {"ammo", "ammo_masita"},
    },
    {
        PrintName = "Grip",
        Slot = "grip",
        DefaultAttName = "Standard Grip"
    },
    {
        PrintName = "Perk",
        DefaultAttName = "None",
        Slot = {"perk", "mw3_pro"},
    },
    {
        PrintName = "Internal Modifications",
        DefaultAttName = "None",
        Slot = {"uc_fg"},
    },   
    {
        PrintName = "Tactical", 
        DefaultAttName = "None",
        Slot = {"tactical", "tac_pistol", "tac"},
        Bone = "base",
        VMScale = Vector(1, 1, 1),
        WMScale = Vector(111, 111, 111),
        Offset = {
            vpos = Vector(2.2, 1, 19.76),
            vang = Angle(90, 0, 0),
            wpos = Vector(450, 360, -575),
            wang = Angle(0, 0, -90)
        },
    }, 
    {
        PrintName = "Charm",
        DefaultAttName = "None",
        Slot = {"charm"},
        Bone = "base",
        VMScale = Vector(0.7, 0.7, 0.7),
        WMScale = Vector(111, 111, 111),
        Offset = {   
            vpos = Vector(2.7, 1, 8),
            vang = Angle(90, 0, -90),
            wpos = Vector(450, 345, -575),
            wang = Angle(0, 0, 180)
        },
    },    
    {
        PrintName = "Killcounter",
        DefaultAttName = "None",
        Slot = {"killcounter"},
        Bone = "base",
        WMScale = Vector(111, 111, 111),
        Offset = {
            vpos = Vector(2.9, 2, 4),
            vang = Angle(90, 0, -90),
            wpos = Vector(0, 395, -450),
            wang = Angle(0, 0, 180)
        },
    },    
}

-- Don't touch this unless you know what you're doing
SWEP.Animations = {
    ["idle"] = {
        Source = "idle1"
    },
    ["trigger"] = {
        Source = "fire",
        SoundTable = {
            {s = "sops-v2/weapons/z6x/active.wav", t = 0.01/30},
        },
    },
    ["fire"] = {
        Source = false,
    },
    ["fire_iron"] = {
        Source = false,
    },
    ["draw"] = {
        Source = "draw",
        SoundTable = {
            {
                s = "sops-v2/interaction/equip.wav",
                p = 100, 
                v = 75,
                t = 0.1, 
                c = CHAN_ITEM,
            },
        }
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = {
            {
                s = "sops-v2/interaction/equip2.wav",
                p = 100,
                v = 75,
                t = 0.1,
                c = CHAN_ITEM,
            },
        }
    },
    ["reload"] = {
        Source = "reload",
        Time = 3.4, 
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {s = "sops-v2/weapons/z6_chain/reload1.wav", t = 0.1/30},
            {s = "sops-v2/weapons/z6_chain/reload2.wav", t = 70/30},
        },
    },
}

SWEP.Hook_ModifyRPM = function(wep, delay)
    return delay / Lerp(wep:GetBurstCount() / 15, 1, 3)
end
--addons/arccw_weapons/lua/weapons/arccw_z4.lua:
AddCSLuaFile()

SWEP.Base = "arccw_meeks_sw_base"
SWEP.Spawnable = true
SWEP.Category = "AOCRP - Droidenwaffen"
SWEP.Credits = { Author1 = "cat"}
SWEP.PrintName = "Droideka Z4"
SWEP.Trivia_Class = "CIS Rotary Canon"
SWEP.Trivia_Desc = "High tech CIS Rotary Canon Blaster"
SWEP.Trivia_Manufacturer = "Baktoid Combat Automata"
SWEP.Trivia_Calibre = "Medium Density Bolt"
SWEP.Trivia_Mechanism = "Energized Compressed Tibanna"
SWEP.Trivia_Country = "GAR"
SWEP.Trivia_Year = 2020

SWEP.Slot = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/arccw/bf2017/c_t21.mdl"
SWEP.WorldModel = "models/arccw/bf2017/w_t21.mdl"
SWEP.ViewModelFOV = 60
SWEP.HideViewmodel = true
SWEP.WorldModelOffset = {
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 0.009
}

SWEP.IconOverride = "materials/entities/rw_sw_z6.png"

SWEP.DefaultBodygroups = "000000000000"

SWEP.Damage = 25
SWEP.RangeMin = 145
SWEP.DamageMin = 16
SWEP.Range = 375
SWEP.Penetration = 1
SWEP.DamageType = DMG_BULLET
SWEP.MuzzleVelocity = 400


SWEP.TraceNum = 1
SWEP.PhysTracerProfile = 1

SWEP.TracerNum = 1
SWEP.Tracer = "tfa_tracer_red"
SWEP.TracerCol = Color(250, 0, 0)
SWEP.HullSize = 1.5

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 150

SWEP.Recoil = 0.28
SWEP.RecoilSide = 0.25
SWEP.RecoilPunch = 2
SWEP.RecoilRise = 0.34

SWEP.Delay = 245 / 2400
SWEP.Num = 1

SWEP.BobMult = 1

SWEP.Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 0,
    },
}

SWEP.AccuracyMOA = 0.55 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 330 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 50

SWEP.Bipod_Integral = true -- Integral bipod (ie, weapon model has one)
SWEP.BipodDispersion = 0.8 -- Bipod dispersion for Integral bipods
SWEP.BipodRecoil = 0.5 -- Bipod recoil for Integral bipods

SWEP.NoFlash = nil -- disable light flash
SWEP.MuzzleEffect = "wpn_muzzleflash_dc17_red"
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false --
SWEP.MuzzleFlashColor = Color(250, 0, 0)

SWEP.SpeedMult = 0.15
SWEP.SightedSpeedMult = 0.05
SWEP.SightTime = 1

----AMMO / stuff----

SWEP.Primary.Ammo = "ar2"

SWEP.ShootVol = 100
SWEP.ShootPitch = 100
SWEP.ShootPitchVariation = 0.02

SWEP.ShootSound = "w/z6.wav"

SWEP.IronSightStruct = {
    Pos = Vector(0, -12, -4),
    Ang = Angle(0, 0, 0),
    Magnification = 1,
    SwitchToSound = "zoom_in/gunfoley_zoomin_blasterheavy_05.mp3",
    CrosshairInSights = true
}
SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "crossbow"
SWEP.HoldtypeSights = "crossbow"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN

SWEP.ActivePos = Vector(4, -10, -8)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(5, -30, -20)
SWEP.SprintAng = Angle(40, 0, -10)

SWEP.HolsterPos = Vector(4, -3, 2)
SWEP.HolsterAng = Vector(-15, 30, -15)

SWEP.CustomizePos = Vector(20.824, -4, -4.897)
SWEP.CustomizeAng = Angle(12.149, 30.547, 0)

SWEP.DefaultElements = {"z4", "muzzle"}

SWEP.AttachmentElements = {
    ["z4"] = {
        VMElements = {
            {
                Model = "models/arccw/sw_battlefront/weapons/z6_rotary_cannon.mdl",
                Bone = "v_t21_reference001",
                Scale = Vector(1.2, 1.1, 1.2),
                Offset = {
                    pos = Vector(.1, -0.3, 1),
                    ang = Angle(0,-90, 0)
                },
            }
        },
    },
    ["muzzle"] = {
         VMElements = {
            {
                Model = "models/hunter/plates/plate.mdl",
                Bone = "t21_sight",
                Scale = Vector(0, 0, 0),                
                Offset = {
                    pos = Vector(-0.5, 5, 16),
                    ang = Angle(90, 0, 0)
                },
                IsMuzzleDevice = true
            }
        },
        WMElements = {
            {
                Model = "models/arccw/sw_battlefront/weapons/z6_rotary_cannon.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(1.1, 1.1, 1.1),
                Offset = {
                    pos = Vector(3.75, 2.5, -1.5),
                    ang = Angle(-10, 0, 180)
                }
            },
            {
                Model = "models/hunter/plates/plate.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(0, 0, 0),
                Offset = {
                    pos = Vector(4500, 0, -700),
                    ang = Angle(-15, 0, 180)
                },
                IsMuzzleDevice = true
            },            
        }, -- change the world model to something else. Please make sure it's compatible with the last one.
    }
}

WMOverride = "models/arccw/sw_battlefront/weapons/z6_rotary_cannon.mdl"

SWEP.Jamming = true
SWEP.HeatGain = 0.8 -- heat gained per shot
SWEP.HeatCapacity = 75 -- rounds that can be fired non-stop before the gun jams, playing the "fix" animation
SWEP.HeatDissipation = 10 -- rounds' worth of heat lost per second
SWEP.HeatLockout = true -- overheating means you cannot fire until heat has been fully depleted
SWEP.HeatDelayTime = 0.5

--SWEP.Attachments 
SWEP.Attachments = {       
    [1] = {
        PrintName = "Tactical", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"tactical","tac_pistol"},
        Bone = "t21_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.5, 0.6, 35),
            vang = Angle(90, 0, 0),
        },
    },            
    [2] = {
        PrintName = "Energization", -- print name
        DefaultAttName = "Standard Energization", -- used to display the "no attachment" text
        Slot = "ammo",
    },
    [3] = {
        PrintName = "Training/Perk", -- print name
        DefaultAttName = "None", -- used to display the "no attachment" text
        Slot = "perk",
    },
    [4] = {
        PrintName = "Charms", -- print name
        DefaultAttName = "No Charm", -- used to display the "no attachment" text
        Slot = {"charm"},
        Bone = "t21_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.2, 1, 29),
            vang = Angle(90, 0, -90),
        },
    },          
}

SWEP.Animations = {
    ["idle"] = {
        Source = "idle"
    },
    ["fire"] = {
        Source = "fire"
    },
    ["draw"] = {
        Source = "draw",
        Mult = 2,
        SoundTable = {
            {
                s = "draw/blasters_deathray_foley_undeploy_var_03.mp3", -- sound; can be string or table
                p = 100, -- pitch
                v = 200, -- volume
                t = 0, -- time at which to play relative to Animations.Time
                c = CHAN_ITEM, -- channel to play the sound
            },
        }
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = {
            {
                s = "holster/blasters_deathray_foley_undeploy_var_02.mp3", -- sound; can be string or table
                p = 100, -- pitch
                v = 75, -- volume
                t = 0, -- time at which to play relative to Animations.Time
                c = CHAN_ITEM, -- channel to play the sound
            },
        }
    },
    ["reload"] = {
        Source = "reload", 
        SoundTable = {
            {s = "ArcCW_dc15a.reload2", t = 4 / 30}, --s sound file
        },
    },


sound.Add({
    name =          "ArcCW_z6.reload2",
    channel =       CHAN_ITEM,
    volume =        1.0,
    sound =             "weapons/bf3/heavy.wav"
    }),
}

-- AOCRP WAFFENSTATS arccw_z4 - 02.06.2024
SWEP.Damage = 20
SWEP.DamageMin = 11
SWEP.RangeMin = 120
SWEP.Range = 350
SWEP.Delay = 60 / 650
SWEP.Primary.ClipSize = 500
SWEP.Category = 'KUS'
--lua/weapons/blood_knucle/shared.lua:
if CLIENT then
SWEP.DrawWeaponInfoBox = false
end

SWEP.Author       = "-CRY-minal-"
SWEP.Purpose      = "Fresh meat!"
SWEP.Instructions = "Kick their ass!"

SWEP.ShowWorldModel = false
SWEP.PrintName = "Bloody knucle"
SWEP.Category = "Gluk Melee"
SWEP.Spawnable= true

SWEP.ViewModelFOV = 60
SWEP.ViewModel = "models/weapons/cstrike/c_knife_t.mdl"
SWEP.WorldModel = "models/weapons/w_knife_t.mdl"
SWEP.ViewModelFlip = false
SWEP.BobScale = 1
SWEP.SwayScale = 0
SWEP.HoldType = "knife"

SWEP.AutoSwitchTo = true
SWEP.AutoSwitchFrom = false
SWEP.Weight = 0
SWEP.Slot = 0
SWEP.SlotPos = 0

SWEP.UseHands = true
SWEP.DrawAmmo = false
SWEP.Base = "weapon_base"

SWEP.Idle = 0
SWEP.IdleTimer = CurTime()

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"
SWEP.Primary.Damage = 41
SWEP.Primary.DelayMiss = 0.7
SWEP.Primary.DelayHit = 0.9
SWEP.Primary.Force = 3000

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"

SWEP.ViewModelBoneMods = {
	["v_weapon.Knife_Handle"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}


SWEP.VElements = {
	["part1"] = { type = "Model", model = "models/props_c17/TrapPropeller_Lever.mdl", bone = "v_weapon.Knife_Handle", rel = "", pos = Vector(0.05, 0.2, 1.5), angle = Angle(180, 90, -90), size = Vector(0.3, 0.3, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/flesh", skin = 0, bodygroup = {} },
	["part2++"] = { type = "Model", model = "models/Gibs/HGIBS_rib.mdl", bone = "v_weapon.Knife_Handle", rel = "", pos = Vector(0, 1.5, 1.5), angle = Angle(90, 90, -90), size = Vector(0.15, 0.15, 0.15), color = Color(255, 180, 180, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["flesh"] = { type = "Model", model = "models/props_canal/canal_cap001.mdl", bone = "v_weapon.Knife_Handle", rel = "", pos = Vector(-0.201, 0.8, 3.299), angle = Angle(0, 0, 0), size = Vector(0.009, 0.009, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/flesh", skin = 0, bodygroup = {} },
	["flesh+"] = { type = "Model", model = "models/props_canal/canal_cap001.mdl", bone = "v_weapon.Knife_Handle", rel = "", pos = Vector(-0.201, 1.5, 2.299), angle = Angle(0, 0, 0), size = Vector(0.009, 0.009, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/flesh", skin = 0, bodygroup = {} },
	["part2"] = { type = "Model", model = "models/Gibs/HGIBS_rib.mdl", bone = "v_weapon.Knife_Handle", rel = "", pos = Vector(0, 1.5, 2.299), angle = Angle(90, 90, -90), size = Vector(0.15, 0.15, 0.15), color = Color(255, 180, 180, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["flesh++"] = { type = "Model", model = "models/props_canal/canal_cap001.mdl", bone = "v_weapon.Knife_Handle", rel = "", pos = Vector(-0.201, 1.5, 1.5), angle = Angle(0, 0, 0), size = Vector(0.009, 0.009, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/flesh", skin = 0, bodygroup = {} },
	["part2+"] = { type = "Model", model = "models/Gibs/HGIBS_rib.mdl", bone = "v_weapon.Knife_Handle", rel = "", pos = Vector(0, 1, 3.299), angle = Angle(90, 90, -90), size = Vector(0.15, 0.15, 0.15), color = Color(255, 180, 180, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["scull"] = { type = "Model", model = "models/Gibs/HGIBS.mdl", bone = "v_weapon.Knife_Handle", rel = "", pos = Vector(-0.091, 0, 3.599), angle = Angle(0, 90, 0), size = Vector(0.109, 0.109, 0.109), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}




SWEP.WElements = {
	["part5"] = { type = "Model", model = "models/props_canal/canal_cap001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.9, 0, 0), angle = Angle(0, 90, 0), size = Vector(0.009, 0.009, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/flesh", skin = 0, bodygroup = {} },
	["part2"] = { type = "Model", model = "models/props_canal/canal_cap001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.9, 0, -1.5), angle = Angle(0, 90, 0), size = Vector(0.009, 0.009, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/flesh", skin = 0, bodygroup = {} },
	["part3"] = { type = "Model", model = "models/props_canal/canal_cap001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.599, 0, 1.2), angle = Angle(0, 90, 0), size = Vector(0.009, 0.009, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/flesh", skin = 0, bodygroup = {} },
	["part1"] = { type = "Model", model = "models/props_c17/TrapPropeller_Lever.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.599, 0, 0), angle = Angle(0, 0, 90), size = Vector(0.3, 0.3, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/flesh", skin = 0, bodygroup = {} },
	["part4"] = { type = "Model", model = "models/props_canal/canal_cap001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.599, 0, -2.3), angle = Angle(0, 90, 0), size = Vector(0.009, 0.009, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/flesh", skin = 0, bodygroup = {} }
}



function SWEP:Initialize()
self:SetWeaponHoldType( self.HoldType )
self.Idle = 0
self.IdleTimer = CurTime() + 1
end

function SWEP:Deploy()
self:SetWeaponHoldType( self.HoldType )
self.Weapon:SendWeaponAnim( ACT_VM_DRAW )
self.Idle = 0
self.IdleTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
return true
end

function SWEP:Holster()
self.Idle = 0
self.IdleTimer = CurTime()
return true
end

function SWEP:PrimaryAttack()
self:SetHoldType( self.HoldType )
local tr = util.TraceLine( {
start = self.Owner:GetShootPos(),
endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * 64,
filter = self.Owner,
mask = MASK_SHOT_HULL,
} )
if !IsValid( tr.Entity ) then
tr = util.TraceHull( {
start = self.Owner:GetShootPos(),
endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * 64,
filter = self.Owner,
mins = Vector( -16, -16, 0 ),
maxs = Vector( 16, 16, 0 ),
mask = MASK_SHOT_HULL,
} )
end
if SERVER then
if IsValid( tr.Entity ) then
local dmg = DamageInfo()
local attacker = self.Owner
if !IsValid( attacker ) then
attacker = self
end
dmg:SetAttacker( attacker )
dmg:SetInflictor( self )
dmg:SetDamage( self.Primary.Damage )
dmg:SetDamageForce( self.Owner:GetForward() * self.Primary.Force )
tr.Entity:TakeDamageInfo( dmg )
end
if !tr.Hit then
self.Owner:EmitSound( "Weapon_HL_Crowbar.Miss" )
end
if tr.Hit then
local bullet = {}
bullet.Num = 1
bullet.Src = self.Owner:GetShootPos()
bullet.Dir = self.Owner:GetAimVector()
bullet.Distance = 64
bullet.Spread = Vector( 0, 0, 0 )
bullet.Tracer = 0
bullet.Force = 0
bullet.Damage = 0
bullet.AmmoType = "none"
self.Owner:FireBullets( bullet )
if tr.Entity:IsNPC() || tr.Entity:IsPlayer() then
self.Owner:EmitSound( "Flesh.ImpactHard" )
else
self.Owner:EmitSound( "Weapon_HL_Crowbar.Hit" )
end
end
end
if !tr.Hit then
self.Weapon:SendWeaponAnim( ACT_VM_MISSCENTER )
self:SetNextPrimaryFire( CurTime() + self.Primary.DelayMiss )
self:SetNextSecondaryFire( CurTime() + self.Primary.DelayMiss )
end
if tr.Hit then
self.Weapon:SendWeaponAnim( ACT_VM_MISSCENTER )
self:SetNextPrimaryFire( CurTime() + self.Primary.DelayHit )
self:SetNextSecondaryFire( CurTime() + self.Primary.DelayHit )
end
self:ShootEffects()
self.Idle = 0
self.IdleTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
end

function SWEP:SecondaryAttack()
end

function SWEP:ShootEffects()
self.Owner:SetAnimation( PLAYER_ATTACK1 )
end

function SWEP:Reload()
end

function SWEP:Think()
if self.IdleTimer <= CurTime() then
if self.Idle == 0 then
self.Idle = 1
end
if SERVER and self.Idle == 1 then
self.Weapon:SendWeaponAnim( ACT_VM_IDLE )
end
self.IdleTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
end
end






/********************************************************
	SWEP Construction Kit base code
		Created by Clavus
	Available for public use, thread at:
	   facepunch.com/threads/1032378
	   
	   
	DESCRIPTION:
		This script is meant for experienced scripters 
		that KNOW WHAT THEY ARE DOING. Don't come to me 
		with basic Lua questions.
		
		Just copy into your SWEP or SWEP base of choice
		and merge with your own code.
		
		The SWEP.VElements, SWEP.WElements and
		SWEP.ViewModelBoneMods tables are all optional
		and only have to be visible to the client.
********************************************************/

function SWEP:Initialize()

	// other initialize code goes here

	if CLIENT then
		
		self:SetWeaponHoldType( self.HoldType )	
		// Create a new table for every weapon instance
		self.VElements = table.FullCopy( self.VElements )
		self.WElements = table.FullCopy( self.WElements )
		self.ViewModelBoneMods = table.FullCopy( self.ViewModelBoneMods )

		self:CreateModels(self.VElements) // create viewmodels
		self:CreateModels(self.WElements) // create worldmodels
		
		// init view model bone build function
		if IsValid(self.Owner) then
			local vm = self.Owner:GetViewModel()
			if IsValid(vm) then
				self:ResetBonePositions(vm)
				
				--[[// Init viewmodel visibility
				if (self.ShowViewModel == nil or self.ShowViewModel) then
					vm:SetColor(Color(255,255,255,255))
				else
					// we set the alpha to 1 instead of 0 because else ViewModelDrawn stops being called
					vm:SetColor(Color(255,255,255,1))
					// ^ stopped working in GMod 13 because you have to do Entity:SetRenderMode(1) for translucency to kick in
					// however for some reason the view model resets to render mode 0 every frame so we just apply a debug material to prevent it from drawing
					vm:SetMaterial("Debug/hsv")			
				end]]--
			end
		end
		
	end

end

function SWEP:Holster()
	
	if CLIENT and IsValid(self.Owner) then
		local vm = self.Owner:GetViewModel()
		if IsValid(vm) then
			self:ResetBonePositions(vm)
		end
	end
	
	return true
end

function SWEP:OnRemove()
	self:Holster()
end

if CLIENT then

	SWEP.vRenderOrder = nil
	function SWEP:ViewModelDrawn()
		
		local vm = self.Owner:GetViewModel()
		if !IsValid(vm) then return end
		
		if (!self.VElements) then return end
		
		self:UpdateBonePositions(vm)

		if (!self.vRenderOrder) then
			
			// we build a render order because sprites need to be drawn after models
			self.vRenderOrder = {}

			for k, v in pairs( self.VElements ) do
				if (v.type == "Model") then
					table.insert(self.vRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.vRenderOrder, k)
				end
			end
			
		end

		for k, name in ipairs( self.vRenderOrder ) do
		
			local v = self.VElements[name]
			if (!v) then self.vRenderOrder = nil break end
			if (v.hide) then continue end
			
			local model = v.modelEnt
			local sprite = v.spriteMaterial
			
			if (!v.bone) then continue end
			
			local pos, ang = self:GetBoneOrientation( self.VElements, v, vm )
			
			if (!pos) then continue end
			
			if (v.type == "Model" and IsValid(model)) then

				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )
				
				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end
				
				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end
				
				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end
				
				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end
				
			elseif (v.type == "Sprite" and sprite) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
				
			elseif (v.type == "Quad" and v.draw_func) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()

			end
			
		end
		
	end

	SWEP.wRenderOrder = nil
	function SWEP:DrawWorldModel()
		
		if (self.ShowWorldModel == nil or self.ShowWorldModel) then
			self:DrawModel()
		end
		
		if (!self.WElements) then return end
		
		if (!self.wRenderOrder) then

			self.wRenderOrder = {}

			for k, v in pairs( self.WElements ) do
				if (v.type == "Model") then
					table.insert(self.wRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.wRenderOrder, k)
				end
			end

		end
		
		if (IsValid(self.Owner)) then
			bone_ent = self.Owner
		else
			// when the weapon is dropped
			bone_ent = self
		end
		
		for k, name in pairs( self.wRenderOrder ) do
		
			local v = self.WElements[name]
			if (!v) then self.wRenderOrder = nil break end
			if (v.hide) then continue end
			
			local pos, ang
			
			if (v.bone) then
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent )
			else
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent, "ValveBiped.Bip01_R_Hand" )
			end
			
			if (!pos) then continue end
			
			local model = v.modelEnt
			local sprite = v.spriteMaterial
			
			if (v.type == "Model" and IsValid(model)) then

				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )
				
				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end
				
				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end
				
				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end
				
				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end
				
			elseif (v.type == "Sprite" and sprite) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
				
			elseif (v.type == "Quad" and v.draw_func) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()

			end
			
		end
		
	end

	function SWEP:GetBoneOrientation( basetab, tab, ent, bone_override )
		
		local bone, pos, ang
		if (tab.rel and tab.rel != "") then
			
			local v = basetab[tab.rel]
			
			if (!v) then return end
			
			// Technically, if there exists an element with the same name as a bone
			// you can get in an infinite loop. Let's just hope nobody's that stupid.
			pos, ang = self:GetBoneOrientation( basetab, v, ent )
			
			if (!pos) then return end
			
			pos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
		else
		
			bone = ent:LookupBone(bone_override or tab.bone)

			if (!bone) then return end
			
			pos, ang = Vector(0,0,0), Angle(0,0,0)
			local m = ent:GetBoneMatrix(bone)
			if (m) then
				pos, ang = m:GetTranslation(), m:GetAngles()
			end
			
			if (IsValid(self.Owner) and self.Owner:IsPlayer() and 
				ent == self.Owner:GetViewModel() and self.ViewModelFlip) then
				ang.r = -ang.r // Fixes mirrored models
			end
		
		end
		
		return pos, ang
	end

	function SWEP:CreateModels( tab )

		if (!tab) then return end

		// Create the clientside models here because Garry says we can't do it in the render hook
		for k, v in pairs( tab ) do
			if (v.type == "Model" and v.model and v.model != "" and (!IsValid(v.modelEnt) or v.createdModel != v.model) and 
					string.find(v.model, ".mdl") and file.Exists (v.model, "GAME") ) then
				
				v.modelEnt = ClientsideModel(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)
				if (IsValid(v.modelEnt)) then
					v.modelEnt:SetPos(self:GetPos())
					v.modelEnt:SetAngles(self:GetAngles())
					v.modelEnt:SetParent(self)
					v.modelEnt:SetNoDraw(true)
					v.createdModel = v.model
				else
					v.modelEnt = nil
				end
				
			elseif (v.type == "Sprite" and v.sprite and v.sprite != "" and (!v.spriteMaterial or v.createdSprite != v.sprite) 
				and file.Exists ("materials/"..v.sprite..".vmt", "GAME")) then
				
				local name = v.sprite.."-"
				local params = { ["$basetexture"] = v.sprite }
				// make sure we create a unique name based on the selected options
				local tocheck = { "nocull", "additive", "vertexalpha", "vertexcolor", "ignorez" }
				for i, j in pairs( tocheck ) do
					if (v[j]) then
						params["$"..j] = 1
						name = name.."1"
					else
						name = name.."0"
					end
				end

				v.createdSprite = v.sprite
				v.spriteMaterial = CreateMaterial(name,"UnlitGeneric",params)
				
			end
		end
		
	end
	
	local allbones
	local hasGarryFixedBoneScalingYet = false

	function SWEP:UpdateBonePositions(vm)
		
		if self.ViewModelBoneMods then
			
			if (!vm:GetBoneCount()) then return end
			
			// !! WORKAROUND !! //
			// We need to check all model names :/
			local loopthrough = self.ViewModelBoneMods
			if (!hasGarryFixedBoneScalingYet) then
				allbones = {}
				for i=0, vm:GetBoneCount() do
					local bonename = vm:GetBoneName(i)
					if (self.ViewModelBoneMods[bonename]) then 
						allbones[bonename] = self.ViewModelBoneMods[bonename]
					else
						allbones[bonename] = { 
							scale = Vector(1,1,1),
							pos = Vector(0,0,0),
							angle = Angle(0,0,0)
						}
					end
				end
				
				loopthrough = allbones
			end
			// !! ----------- !! //
			
			for k, v in pairs( loopthrough ) do
				local bone = vm:LookupBone(k)
				if (!bone) then continue end
				
				// !! WORKAROUND !! //
				local s = Vector(v.scale.x,v.scale.y,v.scale.z)
				local p = Vector(v.pos.x,v.pos.y,v.pos.z)
				local ms = Vector(1,1,1)
				if (!hasGarryFixedBoneScalingYet) then
					local cur = vm:GetBoneParent(bone)
					while(cur >= 0) do
						local pscale = loopthrough[vm:GetBoneName(cur)].scale
						ms = ms * pscale
						cur = vm:GetBoneParent(cur)
					end
				end
				
				s = s * ms
				// !! ----------- !! //
				
				if vm:GetManipulateBoneScale(bone) != s then
					vm:ManipulateBoneScale( bone, s )
				end
				if vm:GetManipulateBoneAngles(bone) != v.angle then
					vm:ManipulateBoneAngles( bone, v.angle )
				end
				if vm:GetManipulateBonePosition(bone) != p then
					vm:ManipulateBonePosition( bone, p )
				end
			end
		else
			self:ResetBonePositions(vm)
		end
		   
	end
	 
	function SWEP:ResetBonePositions(vm)
		
		if (!vm:GetBoneCount()) then return end
		for i=0, vm:GetBoneCount() do
			vm:ManipulateBoneScale( i, Vector(1, 1, 1) )
			vm:ManipulateBoneAngles( i, Angle(0, 0, 0) )
			vm:ManipulateBonePosition( i, Vector(0, 0, 0) )
		end
		
	end

	/**************************
		Global utility code
	**************************/

	// Fully copies the table, meaning all tables inside this table are copied too and so on (normal table.Copy copies only their reference).
	// Does not copy entities of course, only copies their reference.
	// WARNING: do not use on tables that contain themselves somewhere down the line or you'll get an infinite loop
	function table.FullCopy( tab )

		if (!tab) then return nil end
		
		local res = {}
		for k, v in pairs( tab ) do
			if (type(v) == "table") then
				res[k] = table.FullCopy(v) // recursion ho!
			elseif (type(v) == "Vector") then
				res[k] = Vector(v.x, v.y, v.z)
			elseif (type(v) == "Angle") then
				res[k] = Angle(v.p, v.y, v.r)
			else
				res[k] = v
			end
		end
		
		return res
		
	end
	
end
--lua/weapons/demonic_sword/shared.lua:
SWEP.Author       = "Killua"
SWEP.PrintName    = "Demonic sword"
SWEP.Category     = "Gluk Melee"
SWEP.Contact      = "Type:Melee Class:Demonic"
SWEP.Purpose      = ""
SWEP.Instructions = "LMB to attack, RBM to special attack, Special +damage"
 
SWEP.AdminSpawnable = true
SWEP.AutoSwitchTo   = false
SWEP.Spawnable      = true
SWEP.AutoSwitchFrom = false
SWEP.FiresUnderwater= false
SWEP.Weight         = 5
SWEP.DrawCrosshair  = true
SWEP.Slot           = 0
SWEP.SlotPos        = 1
SWEP.DrawAmmo		= false
SWEP.base           = "weapon_base"
SWEP.HoldType       = "melee2"

SWEP.UseHands = true
SWEP.ViewModelFOV   = 50
SWEP.ViewModel = "models/weapons/cstrike/c_knife_t.mdl"
SWEP.WorldModel = "models/weapons/w_knife_t.mdl"
SWEP.ViewModelFlip  = false
SWEP.ShowWorldModel = false

SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_L_Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(-23.519, 0, 0), angle = Angle(0, 0, 0) },
	["v_weapon.Knife_Handle"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(50, 0, 0) },
	["ValveBiped.Bip01_R_Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(-8.334, 3.888, 5.741), angle = Angle(10, 0, 0) },
	["ValveBiped.Bip01_R_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0.925), angle = Angle(-47.778, 0, 0) }
}
SWEP.VElements = {
	["hils++"] = { type = "Model", model = "models/hunter/misc/squarecap1x1x1.mdl", bone = "v_weapon.Knife_Handle", rel = "hils", pos = Vector(0, 3.9, 4.8), angle = Angle(90, 90, 0), size = Vector(0.029, 0.029, 0.029), color = Color(75, 75, 75, 255), surpresslightning = false, material = "phoenix_storms/torpedo", skin = 0, bodygroup = {} },
	["hils+"] = { type = "Model", model = "models/hunter/misc/sphere1x1.mdl", bone = "v_weapon.Knife_Handle", rel = "hils", pos = Vector(0, 0, -0.101), angle = Angle(0, 90, 0), size = Vector(0.029, 0.039, 0.029), color = Color(75, 75, 75, 255), surpresslightning = false, material = "phoenix_storms/torpedo", skin = 0, bodygroup = {} },
	["hils++++"] = { type = "Model", model = "models/hunter/misc/squarecap1x1x1.mdl", bone = "v_weapon.Knife_Handle", rel = "hils", pos = Vector(0, -3.901, 4.8), angle = Angle(-90, 90, 0), size = Vector(0.029, 0.029, 0.029), color = Color(75, 75, 75, 255), surpresslightning = false, material = "phoenix_storms/torpedo", skin = 0, bodygroup = {} },
	["hils+++"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "v_weapon.Knife_Handle", rel = "hils", pos = Vector(0, -3.5, 5), angle = Angle(90, 0, 90), size = Vector(0.025, 0.05, 0.159), color = Color(60, 60, 60, 255), surpresslightning = false, material = "phoenix_storms/metal_plate", skin = 0, bodygroup = {} },
	["blade"] = { type = "Model", model = "models/hunter/triangles/1x1x1carved025.mdl", bone = "v_weapon.Knife_Handle", rel = "hils", pos = Vector(0, 0, 13.5), angle = Angle(0, 45, 0), size = Vector(0.029, 0.029, 0.349), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/smallwheel_side", skin = 0, bodygroup = {} },
	["hils"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "v_weapon.Knife_Handle", rel = "", pos = Vector(0, 0, -0.7), angle = Angle(0, 45, 0), size = Vector(0.05, 0.039, 0.109), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/car_tire", skin = 0, bodygroup = {} }
}
SWEP.WElements = {
	["hils++"] = { type = "Model", model = "models/hunter/misc/squarecap1x1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "hils", pos = Vector(0, 3.9, 4.8), angle = Angle(90, 90, 0), size = Vector(0.029, 0.029, 0.029), color = Color(75, 75, 75, 255), surpresslightning = false, material = "phoenix_storms/torpedo", skin = 0, bodygroup = {} },
	["hils+"] = { type = "Model", model = "models/hunter/misc/sphere1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "hils", pos = Vector(0, 0, -0.101), angle = Angle(0, 90, 0), size = Vector(0.029, 0.039, 0.029), color = Color(75, 75, 75, 255), surpresslightning = false, material = "phoenix_storms/torpedo", skin = 0, bodygroup = {} },
	["hils"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 1, 2.5), angle = Angle(-170, 50, 8), size = Vector(0.05, 0.039, 0.109), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/car_tire", skin = 0, bodygroup = {} },
	["hils+++"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "hils", pos = Vector(0, -3.5, 5), angle = Angle(90, 0, 90), size = Vector(0.025, 0.05, 0.159), color = Color(60, 60, 60, 255), surpresslightning = false, material = "phoenix_storms/metal_plate", skin = 0, bodygroup = {} },
	["blade"] = { type = "Model", model = "models/hunter/triangles/1x1x1carved025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "hils", pos = Vector(0, 0, 13.5), angle = Angle(0, 45, 0), size = Vector(0.029, 0.029, 0.349), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/smallwheel_side", skin = 0, bodygroup = {} },
	["hils++++"] = { type = "Model", model = "models/hunter/misc/squarecap1x1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "hils", pos = Vector(0, -3.901, 4.8), angle = Angle(-90, 90, 0), size = Vector(0.029, 0.029, 0.029), color = Color(75, 75, 75, 255), surpresslightning = false, material = "phoenix_storms/torpedo", skin = 0, bodygroup = {} }
}


SWEP.BobScale = 1
SWEP.SwayScale = 0

SWEP.Idle = 0
SWEP.IdleTimer = CurTime()

SWEP.Primary.ClipSize 	 = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic   = true
SWEP.Primary.Ammo 		 = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"

SWEP.Primary.Damage 	 = 40
SWEP.Primary.DelayMiss	 = 1
SWEP.Primary.DelayHit 	 = 0.5
SWEP.Primary.Force 		 = 1
SWEP.Primary.ImpactDecal = "ManhackCut"
SWEP.Primary.Range       = 16

SWEP.Secondary.Life        = true
SWEP.Secondary.Damage 	   = 75
SWEP.Secondary.DelayMiss   = 1.5
SWEP.Secondary.DelayHit	   = 0.9
SWEP.Secondary.Force	   = 5
SWEP.Secondary.ImpactDecal = "Impact.Metal"
SWEP.Secondary.Range       = 18

local SwingSound = Sound( "WeaponFrag.Roll" )
local HitSoundWorld = Sound( "GlassBottle.ImpactHard" )
local HitSoundBody = Sound( "Flesh_Bloody.ImpactHard" )
local HitSoundProp = Sound( "" )
local indec = 0

SWEP.indec = 0

function SWEP:Initialize()
self:SetWeaponHoldType( self.HoldType )
self.Idle = 0
self.IdleTimer = CurTime() + 1
end

function SWEP:Deploy()
self:SetWeaponHoldType( self.HoldType )
self.Weapon:SendWeaponAnim( ACT_VM_DRAW )
self.Idle = 0
self.IdleTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
return true
end

function SWEP:Holster()
self.Idle = 0
self.IdleTimer = CurTime()
self.indec = 0
return true
end

function SWEP:PrimaryAttack()
self:SetHoldType( self.HoldType )
self:EmitSound( SwingSound )
local bullet = {}
bullet.Num = 1
bullet.Src = self.Owner:GetShootPos()
bullet.Dir = self.Owner:GetAimVector()
bullet.Distance = self.Primary.Distance
bullet.Spread = Vector( 0, 0, 0 )
bullet.Tracer = 0
bullet.Force = self.Primary.Force
bullet.Damage = 0
bullet.AmmoType = "none"

local tr = util.TraceLine( {
start = self.Owner:GetShootPos(),
endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * self.Primary.Range*4,
filter = self.Owner,
mask = MASK_SHOT_HULL,
} )
if ( tr.Hit ) then
util.Decal(self.Primary.ImpactDecal, tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)  
end
if !IsValid( tr.Entity ) then
tr = util.TraceHull( {
start = self.Owner:GetShootPos(),
endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * self.Primary.Range*4,
filter = self.Owner,
mins = Vector( -1* self.Primary.Range, -1*self.Primary.Range, 0 ),
maxs = Vector(  1* self.Primary.Range,  1*self.Primary.Range, 0 ),
mask = MASK_SHOT_HULL,
} )
end
if SERVER then
if IsValid( tr.Entity ) then
local dmg = DamageInfo()
local attacker = self.Owner
if !IsValid( attacker ) then
attacker = self
end
dmg:SetAttacker( attacker )
dmg:SetInflictor( self )
dmg:SetDamage( self.Primary.Damage )
dmg:SetDamageForce( self.Owner:GetForward() * self.Primary.Force )
tr.Entity:TakeDamageInfo( dmg )
end
if ( tr.Hit ) then
		if tr.Entity:IsPlayer() or string.find(tr.Entity:GetClass(),"npc") or string.find(tr.Entity:GetClass(),"prop_ragdoll") or string.find(tr.Entity:GetClass(),"prop_physics") then
		if string.find(tr.Entity:GetClass(),"prop_physics") then
		self:EmitSound( HitSoundProp )
		else
		self:EmitSound( HitSoundBody )
		if self.indec < 11 then
		self.Primary.Damage = self.Primary.Damage + 5
		self.Secondary.Damage = self.Secondary.Damage + 5
		self.indec = self.indec + 1
		
		end
		end
		self.Owner:FireBullets(bullet)	
		else
		self:EmitSound( HitSoundWorld )
		end
		end
end
if !tr.Hit then
self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
self:SetNextPrimaryFire( CurTime() + self.Primary.DelayMiss )
self:SetNextSecondaryFire( CurTime() + self.Primary.DelayMiss )
end
if tr.Hit then
self.Weapon:SendWeaponAnim( ACT_VM_MISSCENTER )
self:SetNextPrimaryFire( CurTime() + self.Primary.DelayHit )
self:SetNextSecondaryFire( CurTime() + self.Primary.DelayHit )
end
self:ShootEffects()
self.Idle = 0
self.IdleTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
end


function SWEP:SecondaryAttack()
self:SetHoldType( self.HoldType )
self:EmitSound( SwingSound )
local bullet = {}
bullet.Num = 1
bullet.Src = self.Owner:GetShootPos()
bullet.Dir = self.Owner:GetAimVector()
bullet.Distance = self.Secondary.Distance
bullet.Spread = Vector( 0, 0, 0 )
bullet.Tracer = 0
bullet.Force = self.Secondary.Force
bullet.Damage = 0
bullet.AmmoType = "none"

local tr = util.TraceLine( {
start = self.Owner:GetShootPos(),
endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * self.Secondary.Range*4,
filter = self.Owner,
mask = MASK_SHOT_HULL,
} )
if ( tr.Hit ) then
util.Decal(self.Secondary.ImpactDecal, tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)  
end
if !IsValid( tr.Entity ) then
tr = util.TraceHull( {
start = self.Owner:GetShootPos(),
endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * self.Secondary.Range*4,
filter = self.Owner,
mins = Vector( -16, -16, 0 ),
maxs = Vector( 16, 16, 0 ),
mask = MASK_SHOT_HULL,
} )
end
if SERVER then
if IsValid( tr.Entity ) then
local dmg = DamageInfo()
local attacker = self.Owner
if !IsValid( attacker ) then
attacker = self
end
dmg:SetAttacker( attacker )
dmg:SetInflictor( self )
dmg:SetDamage( self.Secondary.Damage )
dmg:SetDamageForce( self.Owner:GetForward() * self.Secondary.Force )
tr.Entity:TakeDamageInfo( dmg )
end
if ( tr.Hit ) then
		if tr.Entity:IsPlayer() or string.find(tr.Entity:GetClass(),"npc") or string.find(tr.Entity:GetClass(),"prop_ragdoll") or string.find(tr.Entity:GetClass(),"prop_physics") then
		if string.find(tr.Entity:GetClass(),"prop_physics") then
		self:EmitSound( HitSoundProp )
		else
		self:EmitSound( HitSoundBody )
		if self.indec < 11 then
		self.Primary.Damage = self.Primary.Damage + 5
		self.Secondary.Damage = self.Secondary.Damage + 5
		self.indec = self.indec + 1
		end
		end
		self.Owner:FireBullets(bullet)	
		else
		self:EmitSound( HitSoundWorld )
		end
		end
end
if !tr.Hit then
self.Weapon:SendWeaponAnim( ACT_VM_SECONDARYATTACK )
self:SetNextPrimaryFire( CurTime() + self.Secondary.DelayMiss )
self:SetNextSecondaryFire( CurTime() + self.Secondary.DelayMiss )
end
if tr.Hit then
self.Weapon:SendWeaponAnim( ACT_VM_SECONDARYATTACK )
self:SetNextPrimaryFire( CurTime() + self.Secondary.DelayHit )
self:SetNextSecondaryFire( CurTime() + self.Secondary.DelayHit )
end
self:ShootEffects()
self.Idle = 0
self.IdleTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
end

function SWEP:ShootEffects()
self.Owner:SetAnimation( PLAYER_ATTACK1 )
end

function SWEP:Reload()
end

function SWEP:Think()
if self.IdleTimer <= CurTime() then
if self.Idle == 0 then
self.Idle = 1
end
if SERVER and self.Idle == 1 then
self.Weapon:SendWeaponAnim( ACT_VM_IDLE )
end
self.IdleTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
end
end


/********************************************************
	SWEP Construction Kit base code
		Created by Clavus
	Available for public use, thread at:
	   facepunch.com/threads/1032378
	   
	   
	DESCRIPTION:
		This script is meant for experienced scripters 
		that KNOW WHAT THEY ARE DOING. Don't come to me 
		with basic Lua questions.
		
		Just copy into your SWEP or SWEP base of choice
		and merge with your own code.
		
		The SWEP.VElements, SWEP.WElements and
		SWEP.ViewModelBoneMods tables are all optional
		and only have to be visible to the client.
********************************************************/

function SWEP:Initialize()

	// other initialize code goes here

	if CLIENT then
		
		self:SetWeaponHoldType( self.HoldType )	
		// Create a new table for every weapon instance
		self.VElements = table.FullCopy( self.VElements )
		self.WElements = table.FullCopy( self.WElements )
		self.ViewModelBoneMods = table.FullCopy( self.ViewModelBoneMods )

		self:CreateModels(self.VElements) // create viewmodels
		self:CreateModels(self.WElements) // create worldmodels
		
		// init view model bone build function
		if IsValid(self.Owner) then
			local vm = self.Owner:GetViewModel()
			if IsValid(vm) then
				self:ResetBonePositions(vm)
				
				--[[// Init viewmodel visibility
				if (self.ShowViewModel == nil or self.ShowViewModel) then
					vm:SetColor(Color(255,255,255,255))
				else
					// we set the alpha to 1 instead of 0 because else ViewModelDrawn stops being called
					vm:SetColor(Color(255,255,255,1))
					// ^ stopped working in GMod 13 because you have to do Entity:SetRenderMode(1) for translucency to kick in
					// however for some reason the view model resets to render mode 0 every frame so we just apply a debug material to prevent it from drawing
					vm:SetMaterial("Debug/hsv")			
				end]]--
			end
		end
		
	end

end

function SWEP:Holster()
	
	if CLIENT and IsValid(self.Owner) then
		local vm = self.Owner:GetViewModel()
		if IsValid(vm) then
			self:ResetBonePositions(vm)
		end
	end
	
	return true
end

function SWEP:OnRemove()
	self:Holster()
end

if CLIENT then

	SWEP.vRenderOrder = nil
	function SWEP:ViewModelDrawn()
		
		local vm = self.Owner:GetViewModel()
		if !IsValid(vm) then return end
		
		if (!self.VElements) then return end
		
		self:UpdateBonePositions(vm)

		if (!self.vRenderOrder) then
			
			// we build a render order because sprites need to be drawn after models
			self.vRenderOrder = {}

			for k, v in pairs( self.VElements ) do
				if (v.type == "Model") then
					table.insert(self.vRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.vRenderOrder, k)
				end
			end
			
		end

		for k, name in ipairs( self.vRenderOrder ) do
		
			local v = self.VElements[name]
			if (!v) then self.vRenderOrder = nil break end
			if (v.hide) then continue end
			
			local model = v.modelEnt
			local sprite = v.spriteMaterial
			
			if (!v.bone) then continue end
			
			local pos, ang = self:GetBoneOrientation( self.VElements, v, vm )
			
			if (!pos) then continue end
			
			if (v.type == "Model" and IsValid(model)) then

				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )
				
				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end
				
				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end
				
				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end
				
				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end
				
			elseif (v.type == "Sprite" and sprite) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
				
			elseif (v.type == "Quad" and v.draw_func) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()

			end
			
		end
		
	end

	SWEP.wRenderOrder = nil
	function SWEP:DrawWorldModel()
		
		if (self.ShowWorldModel == nil or self.ShowWorldModel) then
			self:DrawModel()
		end
		
		if (!self.WElements) then return end
		
		if (!self.wRenderOrder) then

			self.wRenderOrder = {}

			for k, v in pairs( self.WElements ) do
				if (v.type == "Model") then
					table.insert(self.wRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.wRenderOrder, k)
				end
			end

		end
		
		if (IsValid(self.Owner)) then
			bone_ent = self.Owner
		else
			// when the weapon is dropped
			bone_ent = self
		end
		
		for k, name in pairs( self.wRenderOrder ) do
		
			local v = self.WElements[name]
			if (!v) then self.wRenderOrder = nil break end
			if (v.hide) then continue end
			
			local pos, ang
			
			if (v.bone) then
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent )
			else
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent, "ValveBiped.Bip01_R_Hand" )
			end
			
			if (!pos) then continue end
			
			local model = v.modelEnt
			local sprite = v.spriteMaterial
			
			if (v.type == "Model" and IsValid(model)) then

				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )
				
				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end
				
				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end
				
				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end
				
				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end
				
			elseif (v.type == "Sprite" and sprite) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
				
			elseif (v.type == "Quad" and v.draw_func) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()

			end
			
		end
		
	end

	function SWEP:GetBoneOrientation( basetab, tab, ent, bone_override )
		
		local bone, pos, ang
		if (tab.rel and tab.rel != "") then
			
			local v = basetab[tab.rel]
			
			if (!v) then return end
			
			// Technically, if there exists an element with the same name as a bone
			// you can get in an infinite loop. Let's just hope nobody's that stupid.
			pos, ang = self:GetBoneOrientation( basetab, v, ent )
			
			if (!pos) then return end
			
			pos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
		else
		
			bone = ent:LookupBone(bone_override or tab.bone)

			if (!bone) then return end
			
			pos, ang = Vector(0,0,0), Angle(0,0,0)
			local m = ent:GetBoneMatrix(bone)
			if (m) then
				pos, ang = m:GetTranslation(), m:GetAngles()
			end
			
			if (IsValid(self.Owner) and self.Owner:IsPlayer() and 
				ent == self.Owner:GetViewModel() and self.ViewModelFlip) then
				ang.r = -ang.r // Fixes mirrored models
			end
		
		end
		
		return pos, ang
	end

	function SWEP:CreateModels( tab )

		if (!tab) then return end

		// Create the clientside models here because Garry says we can't do it in the render hook
		for k, v in pairs( tab ) do
			if (v.type == "Model" and v.model and v.model != "" and (!IsValid(v.modelEnt) or v.createdModel != v.model) and 
					string.find(v.model, ".mdl") and file.Exists (v.model, "GAME") ) then
				
				v.modelEnt = ClientsideModel(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)
				if (IsValid(v.modelEnt)) then
					v.modelEnt:SetPos(self:GetPos())
					v.modelEnt:SetAngles(self:GetAngles())
					v.modelEnt:SetParent(self)
					v.modelEnt:SetNoDraw(true)
					v.createdModel = v.model
				else
					v.modelEnt = nil
				end
				
			elseif (v.type == "Sprite" and v.sprite and v.sprite != "" and (!v.spriteMaterial or v.createdSprite != v.sprite) 
				and file.Exists ("materials/"..v.sprite..".vmt", "GAME")) then
				
				local name = v.sprite.."-"
				local params = { ["$basetexture"] = v.sprite }
				// make sure we create a unique name based on the selected options
				local tocheck = { "nocull", "additive", "vertexalpha", "vertexcolor", "ignorez" }
				for i, j in pairs( tocheck ) do
					if (v[j]) then
						params["$"..j] = 1
						name = name.."1"
					else
						name = name.."0"
					end
				end

				v.createdSprite = v.sprite
				v.spriteMaterial = CreateMaterial(name,"UnlitGeneric",params)
				
			end
		end
		
	end
	
	local allbones
	local hasGarryFixedBoneScalingYet = false

	function SWEP:UpdateBonePositions(vm)
		
		if self.ViewModelBoneMods then
			
			if (!vm:GetBoneCount()) then return end
			
			// !! WORKAROUND !! //
			// We need to check all model names :/
			local loopthrough = self.ViewModelBoneMods
			if (!hasGarryFixedBoneScalingYet) then
				allbones = {}
				for i=0, vm:GetBoneCount() do
					local bonename = vm:GetBoneName(i)
					if (self.ViewModelBoneMods[bonename]) then 
						allbones[bonename] = self.ViewModelBoneMods[bonename]
					else
						allbones[bonename] = { 
							scale = Vector(1,1,1),
							pos = Vector(0,0,0),
							angle = Angle(0,0,0)
						}
					end
				end
				
				loopthrough = allbones
			end
			// !! ----------- !! //
			
			for k, v in pairs( loopthrough ) do
				local bone = vm:LookupBone(k)
				if (!bone) then continue end
				
				// !! WORKAROUND !! //
				local s = Vector(v.scale.x,v.scale.y,v.scale.z)
				local p = Vector(v.pos.x,v.pos.y,v.pos.z)
				local ms = Vector(1,1,1)
				if (!hasGarryFixedBoneScalingYet) then
					local cur = vm:GetBoneParent(bone)
					while(cur >= 0) do
						local pscale = loopthrough[vm:GetBoneName(cur)].scale
						ms = ms * pscale
						cur = vm:GetBoneParent(cur)
					end
				end
				
				s = s * ms
				// !! ----------- !! //
				
				if vm:GetManipulateBoneScale(bone) != s then
					vm:ManipulateBoneScale( bone, s )
				end
				if vm:GetManipulateBoneAngles(bone) != v.angle then
					vm:ManipulateBoneAngles( bone, v.angle )
				end
				if vm:GetManipulateBonePosition(bone) != p then
					vm:ManipulateBonePosition( bone, p )
				end
			end
		else
			self:ResetBonePositions(vm)
		end
		   
	end
	 
	function SWEP:ResetBonePositions(vm)
		
		if (!vm:GetBoneCount()) then return end
		for i=0, vm:GetBoneCount() do
			vm:ManipulateBoneScale( i, Vector(1, 1, 1) )
			vm:ManipulateBoneAngles( i, Angle(0, 0, 0) )
			vm:ManipulateBonePosition( i, Vector(0, 0, 0) )
		end
		
	end

	/**************************
		Global utility code
	**************************/

	// Fully copies the table, meaning all tables inside this table are copied too and so on (normal table.Copy copies only their reference).
	// Does not copy entities of course, only copies their reference.
	// WARNING: do not use on tables that contain themselves somewhere down the line or you'll get an infinite loop
	function table.FullCopy( tab )

		if (!tab) then return nil end
		
		local res = {}
		for k, v in pairs( tab ) do
			if (type(v) == "table") then
				res[k] = table.FullCopy(v) // recursion ho!
			elseif (type(v) == "Vector") then
				res[k] = Vector(v.x, v.y, v.z)
			elseif (type(v) == "Angle") then
				res[k] = Angle(v.p, v.y, v.r)
			else
				res[k] = v
			end
		end
		
		return res
		
	end
	
end


--addons/billy_gas_logging/lua/weapons/gas_log_scanner/shared.lua:
local function L(phrase, discriminator)
	return GAS:Phrase(phrase, "logging", discriminator)
end

local COLOR_RED = Color(255, 0, 0)
local SCANNER_HUD

SWEP.PrintName    = "bLogs Scanner"
SWEP.Category     = "AOCRP - Tools"
SWEP.Author       = "GmodAdminSuite"
SWEP.Purpose      = "This scanner allows you to view logs related to entities in the world"
SWEP.Instructions = "Look at an entity"
SWEP.Contact      = "www.gmodadminsuite.com"

SWEP.Slot           = 5
SWEP.SlotPos        = 2
SWEP.DrawAmmo       = false
SWEP.DrawCrosshair  = true
SWEP.Weight         = 5
SWEP.AutoSwitchTo   = false
SWEP.AutoSwitchFrom = false

SWEP.ViewModel  = "models/weapons/v_emptool.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"
SWEP.Spawnable  = true
SWEP.AdminOnly  = true

SWEP.ShowViewModel  = true
SWEP.ShowWorldModel = false

SWEP.Primary.ClipSize    = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic   = false
SWEP.Primary.Ammo        = "none"

SWEP.Secondary.ClipSize    = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic   = false
SWEP.Secondary.Ammo        = "none"

SWEP.HolsterSound       = Sound("npc/turret_floor/retract.wav")
SWEP.DeploySound        = Sound("npc/turret_floor/deploy.wav")
SWEP.ErrorSound         = Sound("npc/roller/code2.wav")
SWEP.ViewLogsSound      = Sound("AlyxEMP.Discharge")
SWEP.ShowInterfaceSound = Sound("gmodadminsuite/btn_light.ogg")
SWEP.HideInterfaceSound = Sound("gmodadminsuite/btn_heavy.ogg")

SWEP.WElements = {
	["scanner"] = {
		type = "Model",
		model = "models/weapons/w_emptool.mdl",
		bone = "ValveBiped.Anim_Attachment_LH",
		rel = "",
		pos = Vector(0.518, -3.636, 6.752),
		angle = Angle(38.57, -180, 12.857),
		size = Vector(1, 1, 1),
		color = Color(255, 255, 255, 255),
		surpresslightning = false,
		material = "",
		skin = 0,
		bodygroup = {}
	}
}

if (CLIENT) then
	function SWEP:Initialize()
		self:CreateModels(self.WElements)
	end
end

function SWEP:PrimaryAttack()
	self:SendWeaponAnim(ACT_VM_FIDGET)

	if (CLIENT) then
		if (IsValid(self.HUD) and self.HUD:IsVisible()) then
			self.LastInspectedEnt = self.HUD.InspectingEnt
			self.LastInspectedEntHUD = self.HUD

			self.HUD:ShowCloseButton(true)
			self.HUD:ShowFullscreenButton(true)
			self.HUD:ShowPinButton(true)
			self.HUD:MakePopup()

			GAS:PlaySound("popup")
			self.HUD = nil
			self:CreateInterface()

			local tr = self.Owner:GetEyeTrace()
			local effectdata = EffectData()
			effectdata:SetOrigin(tr.HitPos)
			effectdata:SetNormal(tr.HitNormal)
			effectdata:SetMagnitude(8)
			effectdata:SetScale(1)
			effectdata:SetRadius(16)
			util.Effect("cball_bounce", effectdata)

			self:EmitSound(self.ViewLogsSound)
		else
			self:EmitSound(self.ErrorSound)
		end
	end

	return true
end

function SWEP:SecondaryAttack()
	return false
end

if (SERVER) then
	util.AddNetworkString("gmodadminsuite:gas_log_scanner:Init")
	function SWEP:Deploy()
		if (not IsFirstTimePredicted()) then return end
		self:SetHoldType("duel")
		self:EmitSound(self.DeploySound)
		self:SendWeaponAnim(ACT_VM_DRAW)
		
		GAS:netStart("gas_log_scanner:Init")
		net.Send(self.Owner)
	end
else
	function SWEP:NetworkedDeploy()
		hook.Add("PreDrawHalos", "gas_log_scanner:Halo", function()
			if (not IsValid(self)) then
				timer.Remove("gas_log_scanner:UncacheData")
				timer.Remove("gas_log_scanner:LoadLogs")
				hook.Remove("PreDrawHalos", "gas_log_scanner:Halo")
				if (IsValid(SCANNER_HUD)) then
					SCANNER_HUD:Close()
				end
			else
				self:DrawHalo()
			end
		end)
		self:CreateInterface()
	end
	net.Receive("gmodadminsuite:gas_log_scanner:Init", function()
		timer.Create("gas_log_scanner:Init", 0, 0, function()
			if (IsValid(LocalPlayer():GetActiveWeapon()) and LocalPlayer():GetActiveWeapon():GetClass() == "gas_log_scanner" and LocalPlayer():GetActiveWeapon().NetworkedDeploy ~= nil) then
				LocalPlayer():GetActiveWeapon():NetworkedDeploy()
				timer.Remove("gas_log_scanner:Init")
			end
		end)
	end)
end

function SWEP:Holster()
	if (not IsFirstTimePredicted()) then
		return
	end
	self:EmitSound(self.HolsterSound)
	if (CLIENT) then
		timer.Remove("gas_log_scanner:UncacheData")
		timer.Remove("gas_log_scanner:LoadLogs")
		hook.Remove("PreDrawHalos", "gas_log_scanner:Halo")
		if (IsValid(self.HUD)) then
			self.HUD:Close()
		end
	end
	return true
end

if (SERVER) then
	function SWEP:Think()
		if (not IsValid(self.Owner)) then return end
		local tr = self.Owner:GetEyeTrace()
		if (IsValid(tr.Entity) and not tr.Entity:IsWorld()) then
			self:SetHoldType("magic")
		else
			self:SetHoldType("duel")
		end
	end
end

if (CLIENT) then
	hook.Add("PlayerSwitchWeapon", "gas_log_scanner:RemoveMenuOnSwitch", function(ply, oldWeapon, newWeapon)
		if (ply ~= LocalPlayer()) then return end
		if (IsValid(oldWeapon) and oldWeapon:GetClass() == "gas_log_scanner") then
			if (IsValid(newWeapon) and newWeapon:GetClass() == "gas_log_scanner") then
				return
			else
				timer.Remove("gas_log_scanner:UncacheData")
				timer.Remove("gas_log_scanner:LoadLogs")
				hook.Remove("PreDrawHalos", "gas_log_scanner:Halo")
				if (IsValid(oldWeapon.HUD)) then
					oldWeapon.HUD:Close()
				end
			end
		end
	end)

	function SWEP:CreateInterface()
		timer.Remove("gas_log_scanner:LoadLogs")
		if (IsValid(self.HUD)) then
			self.HUD:Close()
		end
		if (IsValid(SCANNER_HUD)) then
			SCANNER_HUD:Close()
		end

		self.HUD = vgui.Create("bVGUI.Frame")
		local HUD = self.HUD
		SCANNER_HUD = HUD

		HUD.FirstLoad = true
		HUD:SetTitle("bLogs Scanner")
		HUD:SetSize(425,400)
		HUD:SetPos(1050,300)
		HUD:ShowCloseButton(false)
		HUD:ShowFullscreenButton(false)
		HUD:ShowPinButton(false)
		HUD:SetVisible(false)

		HUD.Pagination = vgui.Create("bVGUI.Pagination", HUD)
		HUD.Pagination:SetTall(30)
		HUD.Pagination:Dock(TOP)
		HUD.Pagination:SetPages(1)
		function HUD.Pagination:OnPageSelected(page)
			HUD.Logs:Clear()
			HUD.Logs:SetLoading(true)
			local function LoadLogs()
				if (not IsValid(HUD) or not IsValid(self)) then return end
				HUD.FirstLoad = nil
				if (not IsValid(HUD.InspectingEnt)) then
					HUD.Logs:SetLoading(false)
				else
					local function LoadScannerLogs()
						GAS:StartNetworkTransaction("logging:LoadScannerLogs", function()
							net.WriteUInt(page, 16)
							net.WriteEntity(HUD.InspectingEnt)
						end, function(data_present, l)
							if (not IsValid(HUD)) then return end
							HUD.Logs:SetLoading(false)
							if (data_present) then
								local ent = net.ReadEntity()
								local pages = net.ReadUInt(16)
								local logs = GAS:DeserializeTable(util.Decompress(net.ReadData(l - 16 - 16)))

								HUD.Pagination:SetPages(pages)
								for _,log in ipairs(logs) do
									local module_data = GAS.Logging.IndexedModules[log[2]]
									local formatted_log = GAS.Logging:FormatMarkupLog(log, GAS.Logging.Config.ColoredLogs or true)
									local log_row = HUD.Logs:AddRow("<color=" .. GAS:Unvectorize(module_data.Colour or bVGUI.COLOR_WHITE) .. ">" .. GAS:EscapeMarkup(module_data.Name) .. "</color>", GAS:SimplifyTimestamp(log[3]), formatted_log)
									log_row.Data = log
									log_row.IsColored = GAS.Logging.Config.ColoredLogs or true
								end
							end
						end)
					end
					if (GAS.Logging.IndexedModules == nil) then
						GAS:StartNetworkTransaction("logging:GetModules", nil, function()
							net.ReadBool()
							local data_len = net.ReadUInt(16)

							GAS.Logging.Modules = {}
							GAS.Logging.IndexedModules = GAS:DeserializeTable(util.Decompress(net.ReadData(data_len)))
							for module_id, module_data in pairs(GAS.Logging.IndexedModules) do
								if (module_data.Offline) then continue end
								GAS.Logging.Modules[module_data.Category] = GAS.Logging.Modules[module_data.Category] or {}
								GAS.Logging.Modules[module_data.Category][module_data.Name] = module_data
							end

							LoadScannerLogs()
						end)
					else
						LoadScannerLogs()
					end
				end
			end
			if (HUD.FirstLoad) then
				timer.Create("gas_log_scanner:LoadLogs", .5, 1, LoadLogs)
			else
				LoadLogs()
			end
		end

		HUD.Logs = vgui.Create("bVGUI.Table", HUD)
		HUD.Logs:Dock(FILL)
		HUD.Logs:AddColumn(L"module", bVGUI.TABLE_COLUMN_SHRINK, TEXT_ALIGN_CENTER)
		HUD.Logs:AddColumn(L"when", bVGUI.TABLE_COLUMN_SHRINK, TEXT_ALIGN_CENTER)
		HUD.Logs:AddColumn(L"log", bVGUI.TABLE_COLUMN_GROW)
		HUD.Logs:SetRowCursor("hand")
		HUD.Logs:SetLoading(true)

		function HUD.Logs:OnRowRightClicked(row)
			self:OnRowClicked(row)
		end
		function HUD.Logs:OnRowClicked(row)
			GAS.Logging:OpenLogsContextMenu(row)
		end
	end

	SWEP.HaloTable = {}
	function SWEP:DrawHalo()
		if (not IsValid(self) or not IsValid(self.Owner) or self.Owner:GetActiveWeapon() ~= self) then
			return hook.Remove("PreDrawHalos", "gas_log_scanner:Halo")
		end
		local tr = self.Owner:GetEyeTrace()
		if (IsValid(tr.Entity) and not tr.Entity:IsWorld()) then
			if (tr.Entity == self.LastInspectedEnt and IsValid(self.LastInspectedEntHUD)) then
				self.HaloTable[1] = nil
				return
			end
			if (self.HaloTable[1] == nil) then
				self:EmitSound(self.ShowInterfaceSound)
			end
			self.HaloTable[1] = tr.Entity

			halo.Add(self.HaloTable, COLOR_RED, 2, 2, 5, true, true)

			if (IsValid(self.HUD)) then
				self.HUD:SetVisible(true)
				self.HUD:SetTitle(tr.Entity:GetClass() .. " (" .. tr.Entity:EntIndex() .. ")")
				self.HUD.InspectingEnt = tr.Entity
				if (self.HUD.LastInspectedEnt ~= tr.Entity) then
					self.HUD.LastInspectedEnt = tr.Entity
					self.HUD.FirstLoad = true
					self.HUD.Pagination:SetPages(1)
					self.HUD.Pagination:SetPage(1)
					self.HUD.Pagination:OnPageSelected(1)
				end
				if (self.HUD.UncacheData) then
					self.HUD.UncacheData = nil
					self.HUD.Pagination:SetPage(1)
					self.HUD.Pagination:OnPageSelected(1)
				end
			end

			timer.Remove("gas_log_scanner:UncacheData")
		else
			self.LastInspectedEntHUD = nil
			self.LastInspectedEnt = nil

			if (self.HaloTable[1] ~= nil) then
				self:EmitSound(self.HideInterfaceSound)
			end
			self.HaloTable[1] = nil

			if (IsValid(self.HUD)) then
				self.HUD:SetVisible(false)
				self.HUD.InspectingEnt = nil
				if (not timer.Exists("gas_log_scanner:UncacheData") and not self.HUD.UncacheData) then
					timer.Create("gas_log_scanner:UncacheData", 3, 1, function()
						self.HUD.UncacheData = true
					end)
				end
			end
		end
	end

	-- Credit for this goes to the SWEP Construction Kit
	-- https://github.com/Clavus/SWEP_Construction_Kit

	SWEP.wRenderOrder = nil
	function SWEP:DrawWorldModel()
		if (self.GetBoneOrientation == nil) then return end
		
		if (self.ShowWorldModel == nil or self.ShowWorldModel) then
			self:DrawModel()
		end

		if (not self.wRenderOrder) then
			self.wRenderOrder = {}
			for k, v in pairs(self.WElements) do
				if (v.type == "Model") then
					table.insert(self.wRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.wRenderOrder, k)
				end
			end
		end

		if (IsValid(self.Owner)) then
			bone_ent = self.Owner
		else
			bone_ent = self
		end

		for k, name in pairs(self.wRenderOrder) do
			local v = self.WElements[name]
			if (not v) then
				self.wRenderOrder = nil
				break
			end
			if (v.hide) then continue end

			local pos, ang

			if (v.bone) then
				pos, ang = self:GetBoneOrientation(self.WElements, v, bone_ent)
			else
				pos, ang = self:GetBoneOrientation(self.WElements, v, bone_ent, "ValveBiped.Bip01_R_Hand")
			end

			if (not pos) then continue end

			local model = v.modelEnt

			model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z)
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)
			model:SetAngles(ang)
			local matrix = Matrix()
			matrix:Scale(v.size)
			model:EnableMatrix("RenderMultiply", matrix)

			if (v.material == "") then
				model:SetMaterial("")
			elseif (model:GetMaterial() ~= v.material) then
				model:SetMaterial(v.material)
			end

			if (v.skin and v.skin ~= model:GetSkin()) then
				model:SetSkin(v.skin)
			end

			if (v.bodygroup) then
				for k, v in pairs(v.bodygroup) do
					if (model:GetBodygroup(k) ~= v) then
						model:SetBodygroup(k, v)
					end
				end
			end

			if (v.surpresslightning) then
				render.SuppressEngineLighting(true)
			end

			render.SetColorModulation(v.color.r / 255, v.color.g / 255, v.color.b / 255)
			render.SetBlend(v.color.a / 255)
			model:DrawModel()
			render.SetBlend(1)
			render.SetColorModulation(1, 1, 1)

			if (v.surpresslightning) then
				render.SuppressEngineLighting(false)
			end
		end
	end

	function SWEP:CreateModels(tab)
		for k, v in pairs(tab) do
			if
				(v.type == "Model" and v.model and v.model ~= "" and (not IsValid(v.modelEnt) or v.createdModel ~= v.model) and
					string.find(v.model, ".mdl") and
					file.Exists(v.model, "GAME"))
			 then
				v.modelEnt = ClientsideModel(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)
				if (IsValid(v.modelEnt)) then
					v.modelEnt:SetPos(self:GetPos())
					v.modelEnt:SetAngles(self:GetAngles())
					v.modelEnt:SetParent(self)
					v.modelEnt:SetNoDraw(true)
					v.createdModel = v.model
				else
					v.modelEnt = nil
				end
			elseif
				(v.type == "Sprite" and v.sprite and v.sprite ~= "" and (not v.spriteMaterial or v.createdSprite ~= v.sprite) and
					file.Exists("materials/" .. v.sprite .. ".vmt", "GAME"))
			 then
				local name = v.sprite .. "-"
				local params = {["$basetexture"] = v.sprite}
				local tocheck = {"nocull", "additive", "vertexalpha", "vertexcolor", "ignorez"}
				for i, j in pairs(tocheck) do
					if (v[j]) then
						params["$" .. j] = 1
						name = name .. "1"
					else
						name = name .. "0"
					end
				end

				v.createdSprite = v.sprite
				v.spriteMaterial = CreateMaterial(name, "UnlitGeneric", params)
			end
		end
	end
end

--gamemodes/starwarsrp/entities/weapons/grabblehook.lua:
// A more realistic grappling hook

if SERVER then
	AddCSLuaFile()
	util.AddNetworkString( "realistic_hook BreakFree" )
end

SWEP.Base = "weapon_base"

SWEP.PrintName = "Greifhaken"
SWEP.Category = "AOCRP - Tools"
SWEP.Author = "my_hat_stinks"
SWEP.Instructions = "Fire to launch the hook"

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.AdminSpawnable = true

SWEP.Slot = 3
SWEP.SlotPos = 1

SWEP.ViewModelFOV = 80
SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.ViewModelFlip   = false

SWEP.WorldModel = "models/weapons/w_alyx_gun.mdl"
SWEP.ViewModel = "models/weapons/c_pistol.mdl"
SWEP.UseHands = true
SWEP.CanDrop = true

SWEP.Primary.Recoil = 1
SWEP.Primary.Damage = 5
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0
SWEP.Primary.Delay = 0.05

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "hatshook_ammo"
SWEP.Primary.ClipMax = -1

SWEP.Secondary.ClipSize = 8
SWEP.Secondary.DefaultClip = 32
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.ClipMax = 32
SWEP.Secondary.Delay = 0.5

SWEP.DeploySpeed = 1.5

SWEP.PrimaryAnim = ACT_VM_PRIMARYATTACK
SWEP.ReloadAnim = ACT_VM_RELOAD
SWEP.HoldType = "pistol"

---- For TTT
SWEP.Kind = WEAPON_EQUIP
SWEP.AutoSpawnable      = false
SWEP.AmmoEnt = "none"
SWEP.NoSights = true
SWEP.EquipMenuData = {
	type = "item_weapon",
	desc = "A grappling hook.\n\nScale walls or grab things from afar."
};



--Standard swep functions--
---------------------------
function SWEP:SetupDataTables()
	self:NetworkVar( "Entity", 0, "Hook" )
	
	self:NetworkVar( "Int", 0, "Cooldown" )
end

function SWEP:Initialize()
	hook.Add( "SetupMove", self, self.PlayerMove )
	--hook.Add( "Tick", self, self.Tick )
	
	if CLIENT then
		self.VElements = table.FullCopy( self.VElements )
		self:CreateModels(self.VElements) // create viewmodels
		
		hook.Add( "PostDrawOpaqueRenderables", self, self.VMDraw )
	end
	
	if SERVER then
		local timerName = tostring(self).." Hook Broken Cooldown"
		timer.Create( timerName, 0.1, 0, function()
			if not IsValid(self) then timer.Destroy(timerName) return end
			self:SetCooldown( math.Approach(self:GetCooldown(), 0, 2) )
		end)
	end
	
	self.Primary.DefaultClip = cvars.Number("hatshook_ammo") or (-1)
	self.Primary.ClipSize = cvars.Number("hatshook_ammo") or (-1)
	self:SetClip1( cvars.Number("hatshook_ammo") or (-1) )
	
	return self.BaseClass.Initialize( self )
end
function SWEP:PrimaryAttack()
	if self:GetCooldown()>0 then return end
	
	self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
	self:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
	
	if CLIENT and (not IsFirstTimePredicted()) then return end
	
	if IsValid( self:GetHook() ) then
		local hk = self:GetHook()
		if not (hk.GetHasHit and hk:GetHasHit()) then return end
		
		if SERVER then hk:SetDist( math.Approach( hk:GetDist(), 0, 10 ) ) end
		self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
		self:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
	elseif SERVER then
		self:LaunchHook()
	end
end
function SWEP:SecondaryAttack()
	if self:GetCooldown()>0 then return end
	
	self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
	self:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
	
	if IsValid( self:GetHook() ) then
		local hk = self:GetHook()
		if not (hk.GetHasHit and hk:GetHasHit()) then return end
		
		if SERVER then hk:SetDist( hk:GetDist() + 10 ) end
		self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
		self:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
	elseif SERVER then
		self:LaunchHook()
	end
end
function SWEP:Reload()
	if SERVER and IsValid(self:GetHook()) then
		if self:GetHook():GetDurability()>0 then
			self:SetCooldown( self:GetHook():GetDurability()+20 )
		else
			self:SetCooldown(10)
		end
		self:GetHook():Remove()
		
		if self:Clip1()==0 then
			self:Remove()
			return
		end
	end
end

-- Handling the hook entity --
------------------------------
function SWEP:LaunchHook()
	if not IsValid( self.Owner ) then return end
	
	if self:Clip1()>0 then
		self:SetClip1(math.max(self:Clip1()-1, 0))
	elseif self:Clip1()==0 then
		return
	end
	
	if not cvars.Bool( "hatshook_physics" ) then return self:LaunchInstant() end
	
	//self:EmitSound( "physics/metal/metal_box_impact_bullet"..math.random(1,3)..".wav" )
	sound.Play( "physics/metal/metal_canister_impact_soft"..math.random(1,3)..".wav", self.Owner:GetShootPos(), 75, 100, 0.5 )
	self.Owner:ViewPunch( Angle( math.Rand(-5,-2.5), math.Rand(-2,2), 0 ) )
	
	local hk = ents.Create( "ent_realistic_hook" )
	if not IsValid(hk) then return end // Shouldn't happen
	hk:SetPos( self.Owner:GetShootPos() - self.Owner:GetAimVector()*10 )
	local ang = self.Owner:EyeAngles()
	ang:RotateAroundAxis( ang:Up(), 90 )
	hk:SetAngles( ang )
	hk.FireVelocity = self.Owner:GetAimVector() * 500
	hk:SetOwner( self.Owner )
	hk:Spawn()
	
	self:SetHook( hk )
	hk:SetWep( self )
end
function SWEP:Holster()
	if SERVER and self:Clip1()==0 then self:Remove() end
	
	return true
end

function SWEP:GetFilter()
	return cvars.Bool( "hatshook_hookplayers" ) and {self.Owner} or player.GetAll()
end
function SWEP:LaunchInstant()
	local tr = util.TraceLine({
		start=self.Owner:GetShootPos(),
		endpos=self.Owner:GetShootPos()+(self.Owner:GetAimVector() * cvars.Number("hatshook_speed")),
		filter=self:GetFilter()
	})
	if tr.HitSky or not tr.Hit then return end
	
	sound.Play( "physics/metal/metal_canister_impact_soft"..math.random(1,3)..".wav", self.Owner:GetShootPos(), 75, 100, 0.5 )
	self.Owner:ViewPunch( Angle( math.Rand(-10,-5), math.Rand(-4,4), 0 ) )
	
	local hk = ents.Create( "ent_realistic_hook" )
	if not IsValid(hk) then return end // Shouldn't happen
	hk:SetPos( tr.HitPos )
	hk:SetAngles( tr.Normal:Angle() )
	hk.FireVelocity = Vector(0,0,0)
	hk:SetOwner( self.Owner )
	hk:Spawn()
	
	self:SetHook( hk )
	hk:SetWep( self )
	
	hk:PhysicsCollide( {HitEntity=tr.Entity, HitPos=tr.HitPos, HitNormal=tr.Normal} )
end

local HookCable = Material( "cable/cable2" )
function SWEP:DrawRope( attPos )
	if not attPos then return end
	
	
	local hk = self:GetHook()
	if not IsValid(hk) then return end
	
	if self.Owner~=LocalPlayer() or hook.Call("ShouldDrawLocalPlayer", GAMEMODE, self.Owner) then return hk:Draw() end
	
	if IsValid( hk:GetTargetEnt() ) then
		local bpos, bang = hk:GetTargetEnt():GetBonePosition( hk:GetFollowBone() )
		local npos, nang = hk:GetFollowOffset(), hk:GetFollowAngle()
		if npos and nang and bpos and bang then
			npos:Rotate( nang )
			nang = nang+bang
			
			npos = bpos+npos
			
			hk:SetPos( npos )
			hk:SetAngles( nang )
		end
	end
	
	render.SetMaterial( HookCable )
	render.DrawBeam( hk:GetPos(), attPos, 1, 0, 2, Color(255,255,255,255) )
end
function SWEP:DrawWorldModel()
	if IsValid(GetViewEntity()) and GetViewEntity()~=LocalPlayer() then return end
	self:DrawModel()
	local att = self:GetAttachment( 1 )
	self:DrawRope( att.Pos )
end
function SWEP:VMDraw()
	if not (self.Owner==LocalPlayer() and self.Owner:GetActiveWeapon()==self and hook.Call("ShouldDrawLocalPlayer", GAMEMODE, self.Owner)~=false) then return end
	if IsValid(GetViewEntity()) and GetViewEntity()~=LocalPlayer() then return end
	
	local vm = IsValid( self.Owner ) and self.Owner:GetViewModel()
	local pos = self:GetPos()
	if IsValid(vm) and vm:GetAttachment( 1 ) then pos = vm:GetAttachment( 1 ).Pos end
	
	self:DrawRope( pos )
end

-- HUD Stuff --
---------------
if CLIENT then
	surface.CreateFont( "hatshook_small", {size=15} )
	surface.CreateFont( "hatshook_large", {size=25, weight=1000} )
end
local function ShadowText( txt, font, x, y )
	draw.DrawText( txt, font, x+1, y+1, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
	draw.DrawText( txt, font, x, y, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
end
local ChargeBarCol = { White = Color(255,255,255), DefCol1 = Color(255,50,50), DefCol2 = Color(50,255,50) }
local Gradient = Material( "gui/gradient" )
local function DrawChargeBar( xpos, ypos, width, height, charge, col1, col2 )
	draw.NoTexture()
	
	surface.SetDrawColor( ChargeBarCol.White )
	surface.DrawOutlinedRect( xpos, ypos, width, height )
	
	charge = math.Clamp( charge or 50, 0, 100)
	barLen = (width-2)*(charge/100)
	render.SetScissorRect( xpos+1, ypos+1, xpos+1+barLen, (ypos+height)-1, true )
		surface.SetDrawColor( col2 or ChargeBarCol.DefCol2 )
		surface.DrawRect( xpos+1, ypos+1, width-1, height-2 )
		
		surface.SetMaterial( Gradient )
		surface.SetDrawColor( col1 or ChargeBarCol.DefCol1 )
		surface.DrawTexturedRect( xpos+1, ypos+1, width-1, height-2 )
	render.SetScissorRect( xpos+1, ypos+1, xpos+1+barLen, (ypos+height)-1, false )
	
	draw.NoTexture()
end
function SWEP:DrawHUD()
	if IsValid( self:GetHook() ) and self:GetHook():GetHasHit() then
		ShadowText( "Seillänge: "..tostring(self:GetHook():GetDist()), "hatshook_small", ScrW()/2, ScrH()/2+40 )
		ShadowText( (input.LookupBinding("+attack") or "[PRIMARY FIRE]"):upper() .. " - Seil verkürzen", "hatshook_small", ScrW()/2, ScrH()/2+70 )
		ShadowText( (input.LookupBinding("+attack2") or "[SECONDARY FIRE]"):upper() .. " - Seil verlängern", "hatshook_small", ScrW()/2, ScrH()/2+85 )
		ShadowText( (input.LookupBinding("+reload") or "[RELOAD]"):upper() .. " - Seil trennen", "hatshook_small", ScrW()/2, ScrH()/2+100 )
		
		if IsValid( self:GetHook():GetTargetEnt() ) and self:GetHook():GetTargetEnt():IsPlayer() then
			DrawChargeBar( (ScrW()/2)-70, (ScrH()/2)+20, 140, 15, self:GetHook():GetDurability() )
		else
			ShadowText( (input.LookupBinding("+use") or "[USE]"):upper() .. " - Abspringen", "hatshook_small", ScrW()/2, ScrH()/2+115 )
		end
	elseif self:GetCooldown()>0 then
		DrawChargeBar( (ScrW()/2)-70, (ScrH()/2)+20, 140, 15, self:GetCooldown() )
	end
	
	if self:Clip1()>=0 then
		ShadowText( "Hooks Remaining: " .. tostring(self:Clip1()), "hatshook_large", ScrW()/2, ScrH()-50 )
	end
	
	return self.BaseClass.DrawHUD( self ) // TTT Crosshair is drawn here, we have to call it
end

-- Movement Handling --
-----------------------
local function ValidPullEnt(ent)
	if (not IsValid(ent)) or ent:IsPlayer() then return false end
	local phys = ent:GetPhysicsObject()
	
	return (not IsValid(phys)) or ((not phys:HasGameFlag(FVPHYSICS_NO_PLAYER_PICKUP)) and (phys:GetMass()<=50) and (ent.CanPickup!=false) and phys:IsMotionEnabled())
end

function SWEP:PlayerMove( ply, mv, cmd )
	if not (IsValid(self:GetHook()) and self:GetHook().GetHasHit and self:GetHook():GetHasHit()) then return end
	if not (IsValid(self.Owner) and IsValid(ply) and self.Owner:Alive() and ply:Alive()) then return end
	
	local hk = self:GetHook()
	
	if (IsValid(hk:GetTargetEnt()) and hk:GetTargetEnt()~=self and ply~=hk:GetTargetEnt() and (hk:GetTargetEnt():IsPlayer() or ValidPullEnt(hk:GetTargetEnt()))) then return end
	if (hk:GetTargetEnt()==hk or (not (ValidPullEnt(hk:GetTargetEnt()) or hk:GetTargetEnt():IsPlayer()))) and ply~=self.Owner then return end
	
	if (not (ply.InVehicle and self.Owner.InVehicle)) or ply:InVehicle() or self.Owner:InVehicle() or (not ply:Alive()) then
		if SERVER then
			self:SetCooldown(10)
			hk:Remove()
		end
		return
	end
	
	if ply~=self.Owner then
		ply.was_pushed = {t=CurTime(),att=self.Owner}
	end
	
	if ply:KeyPressed( IN_USE ) and ply==self.Owner then
		if hk:GetPos()[3] > ply:GetShootPos()[3] then
			mv:SetVelocity( mv:GetVelocity() + Vector(0,0,300) )
		end
		
		if SERVER then
			self:SetCooldown(10)
			hk:Remove()
		end
	end
	
	local TargetPoint = hk:GetPos()
	local ApproachDir = (TargetPoint-ply:GetPos()):GetNormal()
	local ShootPos = self.Owner:GetShootPos() + (Vector(0,0, (self.Owner:Crouching() and 0) or (hk:GetUp()[1]>0.9 and -45) or 0))
	local Distance = hk:GetDist()
	
	if ply~=self.Owner then // Swap direction
		TargetPoint = ShootPos
		ShootPos = ply:GetShootPos() + (Vector(0,0, (ply:Crouching() and 0) or (hk:GetUp()[1]>0.9 and -45) or 0))
		ApproachDir = (TargetPoint-ply:GetPos()):GetNormal()
	end
	
	local DistFromTarget = ShootPos:Distance( TargetPoint )
	if DistFromTarget<(Distance+5) then return end // 5 units off actual distance
	local TargetPos = TargetPoint - (ApproachDir*Distance)
	
	local xDif = math.abs(ShootPos[1] - TargetPos[1])
	local yDif = math.abs(ShootPos[2] - TargetPos[2])
	local zDif = math.abs(ShootPos[3] - TargetPos[3])
	
	--local speedMult = ((DistFromTarget*0.01)^1.1)
	local speedMult = 3+ ( (xDif + yDif)*0.5)^1.01
	local vertMult = math.max((math.Max(300-(xDif + yDif), -10)*0.08)^1.01  + (zDif/2),0)
	if ply~=self.Owner and self.Owner:GetGroundEntity()==ply then vertMult = -vertMult end
	
	local TargetVel = (TargetPos - ShootPos):GetNormal() * 10
	TargetVel[1] = TargetVel[1]*speedMult
	TargetVel[2] = TargetVel[2]*speedMult
	TargetVel[3] = TargetVel[3]*vertMult
	local dir = mv:GetVelocity()
	
	local clamp = 50
	local vclamp = 20
	local accel = 200
	local vaccel = 30*(vertMult/50)
	
	dir[1] = (dir[1]>TargetVel[1]-clamp or dir[1]<TargetVel[1]+clamp) and math.Approach(dir[1], TargetVel[1], accel) or dir[1]
	dir[2] = (dir[2]>TargetVel[2]-clamp or dir[2]<TargetVel[2]+clamp) and math.Approach(dir[2], TargetVel[2], accel) or dir[2]
	
	if ShootPos[3]<TargetPos[3] then
		dir[3] = (dir[3]>TargetVel[3]-vclamp or dir[3]<TargetVel[3]+vclamp) and math.Approach(dir[3], TargetVel[3], vaccel) or dir[3]
		
		if vertMult>0 then self.ForceJump=ply end
	end
	
	mv:SetVelocity( dir )
	//return mv
end

local function ForceJump( ply )
	if not (IsValid(ply) and ply:IsPlayer()) then return end
	if not ply:OnGround() then return end
	
	local tr = util.TraceLine( {start = ply:GetPos(), endpos = ply:GetPos()+Vector(0,0,20), filter = ply} )
	if tr.Hit then return end
	
	ply:SetPos(ply:GetPos()+Vector(0,0,5) )
end
function SWEP:Think()
	if self.ForceJump then
		if IsValid(self.Owner) and self.ForceJump==self.Owner then
			ForceJump( self.Owner )
		elseif IsValid( self:GetHook() ) and IsValid( self:GetHook():GetTargetEnt() ) and self.ForceJump == self:GetHook():GetTargetEnt() then
			ForceJump( self.ForceJump )
		end
		self.ForceJump = nil
	end
	if SERVER then
		self:EntityPull()
		
		if self:Clip1()==0 and not IsValid(self:GetHook()) then
			self:Remove()
		end
	end
end

function SWEP:EntityPull() // For pulling entities
	local hk = self:GetHook()
	if IsValid(self.Owner) and IsValid(hk) and hk.GetTargetEnt and IsValid(hk:GetTargetEnt()) and ValidPullEnt(hk:GetTargetEnt()) then
		local ply = hk:GetTargetEnt()
		local phys = ply:GetPhysicsObject()
		if ply:IsPlayer() or (not IsValid(phys)) then return end
		
		local TargetPoint = self.Owner:GetShootPos()
		local ShootPos = ply:GetPos()
		local ApproachDir = (TargetPoint-ply:GetPos()):GetNormal()
		local Distance = hk:GetDist()
		
		local DistFromTarget = ShootPos:Distance( TargetPoint )
		if DistFromTarget<(Distance+5) then return end
		local TargetPos = TargetPoint - (ApproachDir*Distance)
		
		local xDif = math.abs(ShootPos[1] - TargetPos[1])
		local yDif = math.abs(ShootPos[2] - TargetPos[2])
		local zDif = math.abs(ShootPos[3] - TargetPos[3])
		
		--local speedMult = ((DistFromTarget*0.01)^1.1)
		local speedMult = 3+ ( (xDif + yDif)*0.5)^1.01
		local vertMult = math.max((math.Max(100-(xDif + yDif), -10)*0.1)^1.01  + (zDif/2), 0)
		if self.Owner:GetGroundEntity()==ply then vertMult = -vertMult end
		
		local TargetVel = (TargetPos - ShootPos):GetNormal() * 6 * (1 - (phys:GetMass()/50))
		TargetVel[1] = TargetVel[1]*speedMult
		TargetVel[2] = TargetVel[2]*speedMult
		TargetVel[3] = TargetVel[3]*vertMult
		local dir = ply:GetVelocity()
		
		local clamp = 50
		local vclamp = 20
		local accel = 200
		local vaccel = 40*(vertMult/50)
		
		dir[1] = (dir[1]>TargetVel[1]-clamp or dir[1]<TargetVel[1]+clamp) and math.Approach(dir[1], TargetVel[1], accel) or dir[1]
		dir[2] = (dir[2]>TargetVel[2]-clamp or dir[2]<TargetVel[2]+clamp) and math.Approach(dir[2], TargetVel[2], accel) or dir[2]
		
		if ShootPos[3]<TargetPos[3] and vertMult~=0 then
			dir[3] = (dir[3]>TargetVel[3]-vclamp or dir[3]<TargetVel[3]+vclamp) and math.Approach(dir[3], TargetVel[3], vaccel) or dir[3]
		end
		
		phys:SetVelocity( dir )
	end
end


SWEP.VElements = {
	["gun"] = { type = "Model", model = "models/weapons/w_alyx_gun.mdl", bone = "ValveBiped.square", rel = "", pos = Vector(1.1, -1.1, -1.4), angle = Angle(-100, 146, 68), size = Vector(1,1,1), color = Color(255, 255, 255, 255) }
}
-- SWEP Construction Kit code by Clavus, removed everything I don't need. http://facepunch.com/threads/1032378 --
-----------------------------------------------------------------------------------------------------------------
function SWEP:ViewModelDrawn()
	if not IsValid( self.Owner ) then return end
	local vm = self.Owner:GetViewModel()
	if !IsValid(vm) then return end
	
	if (!self.VElements) then return end
	for k, v in pairs( self.VElements ) do
		if not file.Exists( v.model, "GAME" ) then continue end
		local model = v.modelEnt
		
		if (!v.bone) then continue end
		
		local pos, ang = self:GetBoneOrientation( self.VElements, v, vm )
		if (!pos) then continue end
		
		if IsValid(model) then
			model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)
			model:SetAngles(ang)
			local matrix = Matrix()
			matrix:Scale(v.size)
			model:EnableMatrix( "RenderMultiply", matrix )
			
			model:SetMaterial("")
			
			render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
			render.SetBlend(v.color.a/255)
			model:DrawModel()
			render.SetBlend(1)
			render.SetColorModulation(1, 1, 1)
		end
	end
end

function SWEP:GetBoneOrientation( basetab, tab, ent, bone_override )
	local bone, pos, ang
	bone = ent:LookupBone(bone_override or tab.bone)
	
	if (!bone) then return end
	
	pos, ang = Vector(0,0,0), Angle(0,0,0)
	local m = ent:GetBoneMatrix(bone)
	if (m) then pos, ang = m:GetTranslation(), m:GetAngles() end
	
	if (IsValid(self.Owner) and self.Owner:IsPlayer() and ent == self.Owner:GetViewModel() and self.ViewModelFlip) then
		ang.r = -ang.r // Fixes mirrored models
	end
	
	return pos, ang
end

function SWEP:CreateModels( tab )
	if (!tab) then return end
	for k, v in pairs( tab ) do
		if (v.type == "Model" and v.model and v.model != "" and (!IsValid(v.modelEnt) or v.createdModel != v.model) and  string.find(v.model, ".mdl") and file.Exists (v.model, "GAME") ) then
			v.modelEnt = ClientsideModel(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)
			if (IsValid(v.modelEnt)) then
				v.modelEnt:SetPos(self:GetPos())
				v.modelEnt:SetAngles(self:GetAngles())
				v.modelEnt:SetParent(self)
				v.modelEnt:SetNoDraw(true)
				v.createdModel = v.model
			else
				v.modelEnt = nil
			end
		end
	end
end

function table.FullCopy( tab )
	if (!tab) then return nil end
	local res = {}
	for k, v in pairs( tab ) do
		if (type(v) == "table") then res[k] = table.FullCopy(v)
		elseif (type(v) == "Vector") then res[k] = Vector(v.x, v.y, v.z)
		elseif (type(v) == "Angle") then res[k] = Angle(v.p, v.y, v.r)
		else res[k] = v end
	end
	return res
end

// Make a TTT Swep from what we've got
local TTTSwep = table.Copy( SWEP ) // It's the same as the normal swep, copy over the table
TTTSwep.Base = "weapon_tttbase" // Using TTT weapon base
TTTSwep.Slot = 6 // Put it in the proper slot

TTTSwep.Spawnable = false // Make the TTT version hidden, so people don't accidentally spawn it
TTTSwep.AdminOnly = false
TTTSwep.AdminSpawnable = false

TTTSwep.CanBuy = {ROLE_TRAITOR, ROLE_DETECTIVE} // Make it buyable
weapons.Register( TTTSwep, "ttt_realistic_hook" ) // Register the new weapon

--addons/weapons_other/lua/weapons/handcuffs.lua:
-------------------------------------



---------------- Cuffs --------------



-------------------------------------



-- Copyright (c) 2015 Nathan Healy --



-------- All rights reserved --------



-------------------------------------



-- weapon_cuff_elastic.lua  SHARED --



--                                 --



-- Elastic handcuffs.              --



-------------------------------------







AddCSLuaFile()







SWEP.Base = "weapon_cuff_base"







SWEP.Category = "AOCRP - Tools"



SWEP.Author = "my_hat_stinks"



SWEP.Instructions = "Stretchable restraint."







SWEP.Spawnable = true



SWEP.AdminOnly = false



SWEP.AdminSpawnable = true







SWEP.Slot                    = 2
SWEP.SlotPos                = 0


SWEP.PrintName = "Handschellen"







//



// Handcuff Vars



SWEP.CuffTime = 0.8 // Seconds to handcuff



SWEP.CuffSound = Sound( "buttons/lever7.wav" )







SWEP.CuffMaterial = "models/props_pipes/GutterMetal01a"



SWEP.CuffRope = "cable/red"



SWEP.CuffStrength = 1.0



SWEP.CuffRegen = 0.6



SWEP.RopeLength = 50



SWEP.CuffReusable = true







SWEP.CuffBlindfold = false


SWEP.CuffGag = false






SWEP.CuffStrengthVariance = 0.1 // Randomise strangth



SWEP.CuffRegenVariance = 0.3 // Randomise regen




--addons/weapons_other/lua/weapons/jet_astromech.lua:

AddCSLuaFile()

SWEP.ViewModel = Model( "models/weapons/c_arms_animations.mdl" )
SWEP.WorldModel = ""

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.PrintName	= "Raketenantrieb - Astromech"
SWEP.Category	= "Star Wars Jetpacks"

SWEP.Slot		= 4
SWEP.SlotPos	= 1

SWEP.DrawAmmo		= false
SWEP.DrawCrosshair	= false
SWEP.Spawnable		= true
SWEP.AdminOnly		= false

if SERVER then
	SWEP.AutoSwitchTo		= false
	SWEP.AutoSwitchFrom		= false
end

function SWEP:SetupDataTables()
	self:NetworkVar( "Int", 0, "Fuel" )
	if ( SERVER ) then
		self:SetFuel(100)
	end
end

function SWEP:Initialize()
	self:SetHoldType( "normal" )
end



function SWEP:Reload()
end

function SWEP:PrimaryAttack()
	if CLIENT then return end
	local ply = self:GetOwner()
	local ex = ply:GetNWEntity('Jetted')
	if IsValid(ex) then
		ex:Remove()
		ply:SetNWEntity('Jetted',NULL)
		ply.LastJetExecuted = CurTime()
	else
		if !ply:IsOnGround() then return end
		--if (ply.LastJetExecuted or 0) >= CurTime() then return end
		local jp = ents.Create('mk3')
		jp:SetSlotName('mk3')
		jp:Spawn()
		jp:Attach(ply)
		ply.Jetted = jp
		ply:SetNWEntity('Jetted',jp)
	end
	ply:EmitSound('buttons/button14.wav')
end

local skinint = 1

function SWEP:SecondaryAttack()
	if CLIENT then return end
	local ply = self:GetOwner()
	local ex = ply:GetNWEntity('Jetted')
	if !IsValid(ex) then return end
	skinint = (skinint + 1)%3
	ex:SetSkin(skinint)
	ply:EmitSound('')
end

function SWEP:Deploy()
	return true
end

function SWEP:Equip()

end

function SWEP:ShouldDropOnDie() return false end


if SERVER then return end

--function SWEP:DrawHUD() end
--function SWEP:PrintWeaponInfo( x, y, alpha ) end

--function SWEP:HUDShouldDraw( name )
	--if ( name == "CHudWeaponSelection" ) then return true end
	--if ( name == "CHudChat" ) then return true end
	--return false
--end
--addons/arccw_weapons/lua/weapons/masita_dc15s.lua:
AddCSLuaFile()

SWEP.Base = "arccw_masita_base"
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Slot = 3 -- Change this if you want to select the weapon with other number

-- Trivia
SWEP.Category = "AOCRP - Nicht eingestelle Waffen"
SWEP.Credits = "Kraken/Masita"
SWEP.PrintName = "DC-15s"
SWEP.Trivia_Class = "Blaster Carabine"
SWEP.Trivia_Desc = "The DC-15A blaster carbine, also referred to as the DC-15S blaster, was a blaster carbine model used by the Grand Army of the Republic. It was part of the DC-15 family. While smaller than the larger DC-15A blaster rifle, both could be referred to as blaster rifles. It was one of the most common weapons issued to clone troopers during the Clone Wars and were used during many battles."
SWEP.Trivia_Manufacturer = "BlasTech Industries"
SWEP.Trivia_Calibre = "Tibanna Gas"
SWEP.Trivia_Year = 2023
SWEP.IconOverride = "entities/masita/dc15s.png"

-- Viewmodel & Entity Properties
SWEP.UseHands = true
SWEP.MirrorVMWM = true
SWEP.NoHideLeftHandInCustomization = false

SWEP.ViewModel = "models/servius/starwars/c_dc15s.mdl"
SWEP.WorldModel = "models/servius/starwars/w_dc15s.mdl"
SWEP.ViewModelFOV = 58
SWEP.WorldModelOffset = {
    pos = Vector(-9, 3.5, -4.5),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
}

-- Damage & Tracer
SWEP.BodyDamageMults =  {
    [HITGROUP_HEAD] = 1.6,
    [HITGROUP_CHEST] = 1.2,
    [HITGROUP_LEFTARM] = 0.9,
    [HITGROUP_RIGHTARM] = 0.9,
}

SWEP.Damage = 37
SWEP.RangeMin = 198
SWEP.DamageMin = 21
SWEP.Range = 399
SWEP.Penetration = 1.1
SWEP.DamageType = DMG_BULLET
SWEP.MuzzleVelocity = 400
SWEP.TraceNum = 1
SWEP.PhysTracerProfile = 1
SWEP.TracerNum = 1
SWEP.Tracer = "tracer_blue"
SWEP.TracerCol = Color(0, 0, 250)
SWEP.HullSize = 1
SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 34

SWEP.Recoil = 0.67
SWEP.RecoilSide = 0.34
SWEP.RecoilRise = 0.53
SWEP.Delay = 60 / 255

SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 1
    },
    {
        Mode = 2
    },
    {
        Mode = 0
    },         
}

SWEP.AccuracyMOA = 0.5 
SWEP.HipDispersion = 490
SWEP.MoveDispersion = 60

-- Sounds & Muzzleflash
SWEP.Primary.Ammo = "ar2"

SWEP.ShootVol = 50
SWEP.ShootPitch = 100
SWEP.ShootPitchVariation = 0.05

SWEP.ShootSound = "armas/disparos/dc15s.wav"
SWEP.ShootSoundSilenced = "armas/disparos/dc19.wav"

SWEP.NoFlash = nil
-- SWEP.MuzzleEffect = "wpn_muzzleflash_dc17"
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false
SWEP.MuzzleFlashColor = Color(0, 0, 250)

-- Ironsight & Holdtype
SWEP.IronSightStruct = {
    Pos = Vector(-2.837, 0.619, 1.656),
    Ang = Angle(0, 0, 0),
     Magnification = 1.3,
     SwitchToSound = "weapon_hand/ads/0242-00001a46.mp3",
     SwitchFromSound = "weapon_hand/ads/0242-00001a43.mp3",
     ViewModelFOV = 55,
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "smg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1

SWEP.ActivePos = Vector(0, 2, 0.5)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(7, 0, 0)
SWEP.SprintAng = Angle(5, 40, 0)

SWEP.CustomizePos = Vector(10, -5, 1)
SWEP.CustomizeAng = Angle(15, 40, 30)

SWEP.HolsterPos = Vector(4, -3, 2)
SWEP.HolsterAng = Vector(-15, 30, -15)

-- Attachments 
SWEP.Attachments = {
    {
        PrintName = "Sight", 
        DefaultAttName = "Standard", 
        Slot = "optic",
        Bone = "DC15",
        Offset = {
            vpos = Vector(0, -1.6, -0.5),
            vang = Angle(90, 0, -90),
        },
    },    
    {
        PrintName = "Grip",
        DefaultAttName = "None",
        Slot = "foregrip",
        Bone = "DC15",
        Offset = {
            vpos = Vector(-0.101, 2.378, 6.164),
            vang = Angle(90, 0, -90),
        },
        SlideAmount = {
        vmin = Vector(-0.2, 0, 5.100),
        vmax = Vector(-0.2, 0, 9),
        },          
    },
    {
        PrintName = "Stock",
        DefaultAttName = "None",
        Bone = "DC15",
        Slot = "stock",
        Offset = {
            vpos = Vector(0, 0.5, -9.1),
            vang = Angle(0, 0, -90),
        },
    }, 
    {
        PrintName = "Tactical",
        DefaultAttName = "None",
        Slot = {"tactical", "tac_pistol", "tac"},
        VMScale = Vector(0.7, 0.7, 0.7),
        Bone = "DC15", 
        Offset = {
            vpos = Vector(0.8, -0.5, 10),
            vang = Angle(90, 0, 0),
        },
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "None",
        Slot = {"muzzle", "cr2_muzzle", "cr2c_muzzle", "stealth_muzzle", "b1120_muzzle"},
        Bone = "DC15",
        Offset = {
            vpos = Vector(0.1, -0.442, 11.638),
            vang = Angle(90, 0, -90),

        },
    },    
    {
        PrintName = "Ammo",
        DefaultAttName = "Standard",
        Slot = {"ammo"},
    },
    {
        PrintName = "Perk",
        DefaultAttName = "None",
        Slot = "perk",
    },
    {
        PrintName = "Internal Modifications",
        DefaultAttName = "None",
        Slot = "uc_fg",
    },
    {
        PrintName = "Charm",
        DefaultAttName = "None",
        Slot = {"charm"},
        Bone = "DC15",
        VMScale = Vector(0.7, 0.7, 0.7),
        Offset = {
            vpos = Vector(0.9, -0.7, 5.7),
            vang = Angle(90, 0, -90),
        },
    },     
    {
        PrintName = "Killcounter",
        DefaultAttName = "None",
        Slot = {"killcounter"},
        Bone = "DC15",
        Offset = {
            vpos = Vector(0.8, -0.2, -5),
            vang = Angle(90, 0, -90),
        },
    },      
}

-- Don't touch this unless you know what you're doing
SWEP.Animations = {
    ["idle"] = {
        Source = false,
    },
    ["fire"] = {
        Source = "fire"
    },
    ["fire_iron"] = {
        Source = false,
    },
    ["draw"] = {
        Source = "draw",
        Mult = 1.4,
        SoundTable = {
            {
                s = "w/dc15s/overheat_manualcooling_resetfoley_generic_var_01.mp3",
                p = 100,
                v = 75,
                t = 0,
                c = CHAN_ITEM,
            },
        }
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = {
            {
                s = "w/dc15s/gunfoley_blaster_sheathe_var_03.mp3",
                p = 100, 
                v = 75, 
                t = 0,
                c = CHAN_ITEM,
            },
        }
    },
    ["reload"] = {
        Source = "reload", 
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        SoundTable = {
            {s = "dc15s_1", t = 1.68 / 60},
            {s = "everfall/weapons/miscellaneous/reload/overheat/overheat_manualcooling_var_02.mp3", t = 0.1},
        },
    },

sound.Add({
    name =          "dc15s_1",
    channel =       CHAN_ITEM,
    volume =        1.5,
    sound =             "armasclasicas/wpn_empire_medreload.wav"
    }),

}
--addons/arccw_weapons/lua/weapons/masita_dc15s_train.lua:
AddCSLuaFile()

SWEP.Base = "arccw_masita_base"
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Slot = 3 -- Change this if you want to select the weapon with other number

-- Trivia
SWEP.Category = "AOCRP - Nicht eingestelle Waffen"
SWEP.Credits = "Kraken/Masita"
SWEP.PrintName = "Training DC-15s"
SWEP.Trivia_Class = "Blaster Carabine"
SWEP.Trivia_Desc = "The DC-15A blaster carbine, also referred to as the DC-15S blaster, was a blaster carbine model used by the Grand Army of the Republic. It was part of the DC-15 family. While smaller than the larger DC-15A blaster rifle, both could be referred to as blaster rifles. It was one of the most common weapons issued to clone troopers during the Clone Wars and were used during many battles."
SWEP.Trivia_Manufacturer = "BlasTech Industries"
SWEP.Trivia_Calibre = "Tibanna Gas"
SWEP.Trivia_Year = 2023
SWEP.IconOverride = "entities/masita/dc15s_training.png"

-- Viewmodel & Entity Properties
SWEP.UseHands = true
SWEP.MirrorVMWM = true
SWEP.NoHideLeftHandInCustomization = true

SWEP.ViewModel = "models/servius/starwars/c_dc15s.mdl"
SWEP.WorldModel = "models/servius/starwars/w_dc15s.mdl"
SWEP.ViewModelFOV = 58
SWEP.WorldModelOffset = {
    pos = Vector(-9, 3.5, -4.5),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
}

-- Damage & Tracer
SWEP.BodyDamageMults =  {
    [HITGROUP_HEAD] = 1.6,
    [HITGROUP_CHEST] = 1.2,
    [HITGROUP_LEFTARM] = 0.9,
    [HITGROUP_RIGHTARM] = 0.9,
}

SWEP.Damage = 1
SWEP.RangeMin = 198
SWEP.DamageMin = 1
SWEP.Range = 399
SWEP.Penetration = 1.1
SWEP.DamageType = DMG_BULLET
SWEP.MuzzleVelocity = 400
SWEP.TraceNum = 1
SWEP.PhysTracerProfile = 1
SWEP.TracerNum = 1
SWEP.Tracer = "tracer_orange"
SWEP.TracerCol = Color(250, 167, 0)
SWEP.HullSize = 1
SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 34

SWEP.Recoil = 0.67
SWEP.RecoilSide = 0.34
SWEP.RecoilRise = 0.53
SWEP.Delay = 60 / 255

SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 1
    },
    {
        Mode = 2
    },
    {
        Mode = 0
    },         
}

SWEP.AccuracyMOA = 0.5 
SWEP.HipDispersion = 490
SWEP.MoveDispersion = 60

-- Sounds & Muzzleflash
SWEP.Primary.Ammo = "ar2"

SWEP.ShootVol = 50
SWEP.ShootPitch = 100
SWEP.ShootPitchVariation = 0.05

SWEP.ShootSound = "armas/disparos/dc15s.wav"
SWEP.ShootSoundSilenced = "armas/disparos/dc19.wav"

SWEP.NoFlash = nil
SWEP.MuzzleEffect = "wpn_muzzleflash_dc17_orange"
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false
SWEP.MuzzleFlashColor = Color(250, 162, 0)

-- Ironsight & Holdtype
SWEP.IronSightStruct = {
    Pos = Vector(-2.837, 0.619, 1.656),
    Ang = Angle(0, 0, 0),
     Magnification = 1.3,
     SwitchToSound = "weapon_hand/ads/0242-00001a46.mp3",
     SwitchFromSound = "weapon_hand/ads/0242-00001a43.mp3",
     ViewModelFOV = 55,
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "smg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1

SWEP.ActivePos = Vector(0, 2, 0.5)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(7, 0, 0)
SWEP.SprintAng = Angle(5, 40, 0)

SWEP.CustomizePos = Vector(10, -5, 1)
SWEP.CustomizeAng = Angle(15, 40, 30)

SWEP.HolsterPos = Vector(4, -3, 2)
SWEP.HolsterAng = Vector(-15, 30, -15)

-- Attachments 
SWEP.Attachments = {
    {
        PrintName = "Sight", 
        DefaultAttName = "Standard", 
        Slot = "optic",
        Bone = "DC15",
        Offset = {
            vpos = Vector(0, -1.6, -0.5),
            vang = Angle(90, 0, -90),
        },
    },    
    {
        PrintName = "Grip",
        DefaultAttName = "None",
        Slot = "foregrip",
        Bone = "DC15",
        Offset = {
            vpos = Vector(-0.101, 2.378, 6.164),
            vang = Angle(90, 0, -90),
        },
        SlideAmount = {
        vmin = Vector(-0.2, 0, 5.100),
        vmax = Vector(-0.2, 0, 9),
        },          
    },
    {
        PrintName = "Stock",
        DefaultAttName = "None",
        Bone = "DC15",
        Slot = "stock",
        Offset = {
            vpos = Vector(0, 0.5, -9.1),
            vang = Angle(0, 0, -90),
        },
    }, 
    {
        PrintName = "Tactical",
        DefaultAttName = "None",
        Slot = {"tactical", "tac_pistol", "tac"},
        VMScale = Vector(0.7, 0.7, 0.7),
        Bone = "DC15", 
        Offset = {
            vpos = Vector(0.8, -0.5, 10),
            vang = Angle(90, 0, 0),
        },
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "None",
        Slot = {"muzzle", "cr2_muzzle", "cr2c_muzzle", "stealth_muzzle", "b1120_muzzle"},
        Bone = "DC15",
        Offset = {
            vpos = Vector(0.1, -0.442, 11.638),
            vang = Angle(90, 0, -90),

        },
    },    
    {
        PrintName = "Ammo",
        DefaultAttName = "Standard",
        Slot = {"ammo"},
    },
    {
        PrintName = "Perk",
        DefaultAttName = "None",
        Slot = "perk",
    },
    {
        PrintName = "Internal Modifications",
        DefaultAttName = "None",
        Slot = "uc_fg",
    },
    {
        PrintName = "Charm",
        DefaultAttName = "None",
        Slot = {"charm"},
        Bone = "DC15",
        VMScale = Vector(0.7, 0.7, 0.7),
        Offset = {
            vpos = Vector(0.9, -0.7, 5.7),
            vang = Angle(90, 0, -90),
        },
    },     
    {
        PrintName = "Killcounter",
        DefaultAttName = "None",
        Slot = {"killcounter"},
        Bone = "DC15",
        Offset = {
            vpos = Vector(0.8, -0.2, -5),
            vang = Angle(90, 0, -90),
        },
    },      
}

-- Don't touch this unless you know what you're doing
SWEP.Animations = {
    ["idle"] = {
        Source = false,
    },
    ["fire"] = {
        Source = "fire"
    },
    ["fire_iron"] = {
        Source = false,
    },
    ["draw"] = {
        Source = "draw",
        Mult = 1.4,
        SoundTable = {
            {
                s = "w/dc15s/overheat_manualcooling_resetfoley_generic_var_01.mp3",
                p = 100,
                v = 75,
                t = 0,
                c = CHAN_ITEM,
            },
        }
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = {
            {
                s = "w/dc15s/gunfoley_blaster_sheathe_var_03.mp3",
                p = 100, 
                v = 75, 
                t = 0,
                c = CHAN_ITEM,
            },
        }
    },
    ["reload"] = {
        Source = "reload", 
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        SoundTable = {
            {s = "dc15s_1", t = 1.68 / 60},
            {s = "everfall/weapons/miscellaneous/reload/overheat/overheat_manualcooling_var_02.mp3", t = 0.1},
        },
    },

sound.Add({
    name =          "dc15s_1",
    channel =       CHAN_ITEM,
    volume =        1.5,
    sound =             "armasclasicas/wpn_empire_medreload.wav"
    }),

}
--addons/arccw_weapons/lua/weapons/masita_dc19.lua:
AddCSLuaFile()

SWEP.Base = "arccw_masita_base"
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Slot = 3 -- Change this if you want to select the weapon with other number

-- Trivia
SWEP.Category = "AOCRP - Nicht eingestelle Waffen"
SWEP.Credits = "Kraken/Masita"
SWEP.PrintName = "DC-19"
SWEP.Trivia_Class = "Blaster Carabine"
SWEP.Trivia_Desc = "The DC-15A blaster carbine, also referred to as the DC-15S blaster, was a blaster carbine model used by the Grand Army of the Republic. It was part of the DC-15 family. While smaller than the larger DC-15A blaster rifle, both could be referred to as blaster rifles. It was one of the most common weapons issued to clone troopers during the Clone Wars and were used during many battles."
SWEP.Trivia_Manufacturer = "BlasTech Industries"
SWEP.Trivia_Calibre = "Tibanna Gas"
SWEP.Trivia_Year = 2023
SWEP.IconOverride = "entities/masita/dc19.png"

-- Viewmodel & Entity Properties
SWEP.UseHands = true
SWEP.MirrorVMWM = true
SWEP.NoHideLeftHandInCustomization = true

SWEP.ViewModel = "models/servius/starwars/c_dc15s.mdl"
SWEP.WorldModel = "models/servius/starwars/w_dc15s.mdl"
SWEP.ViewModelFOV = 58
SWEP.WorldModelOffset = {
    pos = Vector(-9, 3.5, -4.5),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
}

-- Damage & Tracer
SWEP.BodyDamageMults =  {
    [HITGROUP_HEAD] = 1.7,
    [HITGROUP_CHEST] = 1.2,
    [HITGROUP_LEFTARM] = 0.9,
    [HITGROUP_RIGHTARM] = 0.9,
}

SWEP.Damage = 45
SWEP.RangeMin = 224
SWEP.DamageMin = 26
SWEP.Range = 478
SWEP.Penetration = 1.1
SWEP.DamageType = DMG_BULLET
SWEP.MuzzleVelocity = 400
SWEP.TraceNum = 1
SWEP.PhysTracerProfile = 1
SWEP.TracerNum = 1
SWEP.Tracer = nil
SWEP.TracerCol = nil
SWEP.HullSize = 1
SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 34

SWEP.Recoil = 0.67
SWEP.RecoilSide = 0.34
SWEP.RecoilRise = 0.53
SWEP.Delay = 60 / 298

SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 1
    },
    {
        Mode = 2
    },
    {
        Mode = 0
    },         
}

SWEP.AccuracyMOA = 0.5 
SWEP.HipDispersion = 490
SWEP.MoveDispersion = 60

-- Sounds & Muzzleflash
SWEP.ShootVol = 50
SWEP.ShootPitch = 100
SWEP.ShootPitchVariation = 0.05

SWEP.ShootSound = "armas/disparos/dc19.wav"
SWEP.ShootSoundSilenced = "armas/disparos/dc19.wav"

SWEP.NoFlash = nil
SWEP.MuzzleEffect = nil
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false
SWEP.MuzzleFlashColor = Color(0,0,0)

-- Ironsight & Holdtype
SWEP.IronSightStruct = {
    Pos = Vector(-2.837, 0.619, 1.656),
    Ang = Angle(0, 0, 0),
     Magnification = 1.3,
     SwitchToSound = "weapon_hand/ads/0242-00001a46.mp3",
     SwitchFromSound = "weapon_hand/ads/0242-00001a43.mp3",
     ViewModelFOV = 55,
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "smg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1

SWEP.ActivePos = Vector(0, 2, 0.5)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(7, 0, 0)
SWEP.SprintAng = Angle(5, 40, 0)

SWEP.CustomizePos = Vector(10, -5, 1)
SWEP.CustomizeAng = Angle(15, 40, 30)

SWEP.HolsterPos = Vector(4, -3, 2)
SWEP.HolsterAng = Vector(-15, 30, -15)

-- Attachments 
SWEP.Attachments = {
    {
        PrintName = "Sight", 
        DefaultAttName = "Standard", 
        Slot = "optic",
        Bone = "DC15",
        Offset = {
            vpos = Vector(0, -1.6, -0.5),
            vang = Angle(90, 0, -90),
        },
    },    
    {
        PrintName = "Grip",
        DefaultAttName = "None",
        Slot = "foregrip",
        Bone = "DC15",
        Offset = {
            vpos = Vector(-0.101, 2.378, 6.164),
            vang = Angle(90, 0, -90),
        },
        SlideAmount = {
        vmin = Vector(-0.2, 0, 5.100),
        vmax = Vector(-0.2, 0, 9),
        },          
    },
    {
        PrintName = "Stock",
        DefaultAttName = "None",
        Bone = "DC15",
        Slot = "stock",
        Offset = {
            vpos = Vector(0, 0.5, -9.1),
            vang = Angle(0, 0, -90),
        },
    }, 
    {
        PrintName = "Tactical",
        DefaultAttName = "None",
        Slot = {"tactical", "tac_pistol", "tac"},
        VMScale = Vector(0.7, 0.7, 0.7),
        Bone = "DC15", 
        Offset = {
            vpos = Vector(0.8, -0.5, 10),
            vang = Angle(90, 0, 0),
        },
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "None",
        Slot = {"muzzle", "cr2_muzzle", "cr2c_muzzle", "stealth_muzzle", "b1120_muzzle"},
        Bone = "DC15",
        Offset = {
            vpos = Vector(0.1, -0.442, 11.638),
            vang = Angle(90, 0, -90),

        },
    },    
    {
        PrintName = "Ammo",
        DefaultAttName = "Standard",
        Slot = {"ammo"},
    },
    {
        PrintName = "Perk",
        DefaultAttName = "None",
        Slot = "perk",
    },
    {
        PrintName = "Internal Modifications",
        DefaultAttName = "None",
        Slot = "uc_fg",
    },
    {
        PrintName = "Charm",
        DefaultAttName = "None",
        Slot = {"charm"},
        Bone = "DC15",
        VMScale = Vector(0.7, 0.7, 0.7),
        Offset = {
            vpos = Vector(0.9, -0.7, 5.7),
            vang = Angle(90, 0, -90),
        },
    },     
    {
        PrintName = "Killcounter",
        DefaultAttName = "None",
        Slot = {"killcounter"},
        Bone = "DC15",
        Offset = {
            vpos = Vector(0.8, -0.2, -5),
            vang = Angle(90, 0, -90),
        },
    },      
}

-- Don't touch this unless you know what you're doing
SWEP.Animations = {
    ["idle"] = {
        Source = false,
    },
    ["fire"] = {
        Source = "fire"
    },
    ["fire_iron"] = {
        Source = false,
    },
    ["draw"] = {
        Source = "draw",
        Mult = 1.4,
        SoundTable = {
            {
                s = "w/dc15s/overheat_manualcooling_resetfoley_generic_var_01.mp3",
                p = 100,
                v = 75,
                t = 0,
                c = CHAN_ITEM,
            },
        }
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = {
            {
                s = "w/dc15s/gunfoley_blaster_sheathe_var_03.mp3",
                p = 100, 
                v = 75, 
                t = 0,
                c = CHAN_ITEM,
            },
        }
    },
    ["reload"] = {
        Source = "reload", 
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        SoundTable = {
            {s = "dc15s_1", t = 1.68 / 60},
            {s = "everfall/weapons/miscellaneous/reload/overheat/overheat_manualcooling_var_02.mp3", t = 0.1},
        },
    },

sound.Add({
    name =          "dc15s_1",
    channel =       CHAN_ITEM,
    volume =        1.5,
    sound =             "armasclasicas/wpn_empire_medreload.wav"
    }),

}
--addons/arccw_weapons/lua/weapons/masita_nt242.lua:
AddCSLuaFile()

SWEP.Base = "arccw_masita_base"
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Slot = 3 -- Change this if you want to select the weapon with other number

-- Trivia
SWEP.Category = "AOCRP - Nicht eingestelle Waffen"
SWEP.Credits = "Kraken/Masita"
SWEP.PrintName = "NT-242"
SWEP.Trivia_Class = "Blaster Sniper Rifle"
SWEP.Trivia_Desc = "The NT-242 was a type of sniper rifle. The NT-242 was considered a tank buster by many users and was one of the heaviest longblasters. The NT-242 was powerful at range, and could be modified to have a disruptor shot which could engage vehicles."
SWEP.Trivia_Manufacturer = "Unknown"
SWEP.Trivia_Calibre = "Tibanna Gas"
SWEP.Trivia_Year = 2023
SWEP.IconOverride = "entities/masita/nt242.png"

SWEP.UseHands = true

SWEP.ViewModel = "models/everfall/weapons/viewmodels/c_nt242.mdl"
SWEP.WorldModel = "models/everfall/weapons/worldmodels/w_nt242.mdl"
SWEP.ViewModelFOV = 55
SWEP.MirrorVMWM = true
SWEP.HideViewmodel = false
SWEP.WorldModelOffset = {
    pos = Vector(-11.5, 4, -5),
    ang = Angle(-10, 0, 180),
    bone = "ValveBiped.Bip01_R_Hand",
}

SWEP.DefaultWMBodygroups = "02"
SWEP.DefaultBodygroups = "02"

-- Properties
SWEP.BodyDamageMults = {
    [HITGROUP_HEAD] = 2.5,
    [HITGROUP_CHEST] = 1.3,
    [HITGROUP_LEFTARM] = 0.9,
    [HITGROUP_RIGHTARM] = 0.9,
}

SWEP.Damage = 176
SWEP.RangeMin = 273
SWEP.DamageMin = 69
SWEP.Range = 1072

SWEP.Penetration = 1.3
SWEP.DamageType = DMG_BULLET
SWEP.MuzzleVelocity = 400

SWEP.TracerNum = 1
SWEP.Tracer = "tracer_purple"
SWEP.TracerCol = Color(247, 0, 255)
SWEP.HullSize = 1.5

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 18

SWEP.Recoil = 1.4
SWEP.RecoilSide = 0.3
SWEP.RecoilRise = 0.19

SWEP.Delay = 60 / 98
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 1
    },
    {
        Mode = 0
    },         
}

SWEP.AccuracyMOA = 0.1
SWEP.HipDispersion = 300

SWEP.MoveDispersion = 60
SWEP.NoFlash = nil
SWEP.MuzzleEffect = "wpn_muzzleflash_dc17_purple"
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false
SWEP.MuzzleFlashColor = Color(247, 0, 255)

SWEP.Primary.Ammo = "ar2"
SWEP.ShootVol = 100
SWEP.ShootPitch = 100

SWEP.ShootSound = "armas/disparos/nt242.mp3"
SWEP.ShootSoundSilenced = "armas/disparos/silenced_sniper.mp3"
SWEP.IronSightStruct = {
    Pos = Vector(-3.71, -5.549, 1.526),
    Ang = Angle(0, 0, 0),
     Magnification = 2,
     SwitchToSound = "weapon_hand/ads/0242-00001a46.mp3",
     SwitchFromSound = "weapon_hand/ads/0242-00001a43.mp3",
     ViewModelFOV = 50,
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(0, 0, 2)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(7, 0, -4)
SWEP.SprintAng = Angle(5, 40, 0)

SWEP.CustomizePos = Vector(9.824, 2, -2.897)
SWEP.CustomizeAng = Angle(12.149, 30.547, 0)

SWEP.HolsterPos = Vector(4, -3, 2)
SWEP.HolsterAng = Vector(-15, 30, -15)

SWEP.InBipodPos = Vector(-8, 0, -4)
SWEP.InBipodMult = Vector(2, 1, 1)

SWEP.Bipod_Integral = true
SWEP.BipodDispersion = 1
SWEP.BipodRecoil = 1

SWEP.AttachmentElements = {
    ["242_barrel_extended"] = {
        VMBodygroups = {{ind = 2, bg = 1}},
        NameChange = "Extended NT-242",
        AttPosMods = {
            [3] = {
                vpos = Vector(0.007, 0.98, 47.5),
            },
        }
    },
}

SWEP.Attachments = {
    [1] = {
        PrintName = "Sight",
        DefaultAttName = "Standard", 
        Slot = "optic",
        Bone = "nt242", 
        Offset = {
            vpos = Vector(0, -1.1, 4.93),
            vang = Angle(90, 0, -90),
        },
        CorrectiveAng = Angle(0, 0, 0),
        CorrectivePos = Vector(0, 0, 0),
    },
    [2] = {
        PrintName = "Barrel", 
        DefaultAttName = "Standard",
        Slot = "242_barrel",
    },  
    [3] = {
        PrintName = "Muzzle",
        DefaultAttName = "Standard",
        Slot = {"muzzle", "dlt19_muzzle", "dc15a_muzzle", "cr2_muzzle", "cr2c_muzzle", "stealth_muzzle", "b1120_muzzle"},
        Bone = "nt242",
        Offset = {
            vpos = Vector(0.007, 0.98, 40.043),
            vang = Angle(90, 0, 0),
        },
    },
    [4] = {
        PrintName = "Grip",
        DefaultAttName = "None",
        Slot = {"foregrip", "bipod"},
        Bone = "nt242", 
        Offset = {
            vpos = Vector(0, 2.253, 15.001),
            vang = Angle(90, 0, -90),
        },
        SlideAmount = {
            vmin = Vector(0, 2, 15),
            vmax = Vector(0, 2, 25),
        },  
    }, 
    [5] = {
        PrintName = "Tactical", 
        DefaultAttName = "None",
        Slot = {"tactical","tac_pistol"},
        Bone = "nt242", 
        Offset = {
            vpos = Vector(0.939, 0.982, 14.303),
            vang = Angle(90, 0, 0),
        },
    },    
    [6] = {
        PrintName = "Ammo", 
        DefaultAttName = "Standard",
        Slot = "ammo",
    },  
    [7] = {
        PrintName = "Perk", 
        DefaultAttName = "Standard",
        Slot = "perk",
    },
    [8] = {
        PrintName = "Charm", 
        DefaultAttName = "None", 
        Slot = {"charm"},
        Bone = "nt242", 
        VMScale = Vector(0.7, 0.7, 0.7),
        Offset = {
            vpos = Vector(0.931, 1.174, 0),
            vang = Angle(90, 0, -90),
        },
    },    
    [9] = {
        PrintName = "Killcounter", 
        DefaultAttName = "None", 
        Slot = {"killcounter"},
        VMScale = Vector(0.9, 0.9, 0.9),
        Bone = "nt242", 
        Offset = {
            vpos = Vector(0.931, 1.174, 5),
            vang = Angle(90, 0, -90),
        },
    },          
}

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },
    ["fire"] = {
        Source = "shoot"
    },
    ["draw"] = {
        Source = "draw",
        Mult = 1.1,
        SoundTable = {
            {s = "everfall/weapons/handling/reload_heavy/locknload/023d-00000f08.mp3", t = 1}
        },
    },
    ["reload"] = {
        Source = "reload",
        LHIK = true,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2, 
        SoundTable = {
            {s = "nt242_r1", t = 3 / 30}, --s sound file
            {s = "everfall/weapons/handling/reload_heavy/locknload/023d-00000f08.mp3", t = 2.2}
        },
    },


sound.Add({
    name =          "nt242_r1",
    channel =       CHAN_ITEM,
    volume =        1.5,
    sound =             "armasclasicas/wpn_republic_medreload.wav"
    }),
}
--addons/star_wars_mortar/lua/weapons/mortar_constructor_dark/shared.lua:
AddCSLuaFile()

SWEP.Base = "mortar_constructor"
SWEP.PrintName = "Mortar Dark"
SWEP.Spawnable = true

SWEP.Author = "DolUnity"
SWEP.Purpose = "Place a Mortar"
SWEP.Instructions = "Place the mortar with attack \nPick it up with duck and use"
SWEP.Category = "AOCRP - Eingestellte Waffen"
SWEP.Spawnable = true
SWEP.ViewModel = "models/weapons/c_pistol.mdl"
SWEP.UseHands = true
SWEP.DrawAmmo = false

function SWEP:OnSpawn(ent)
    ent:SetSkin(1)
end
--lua/weapons/neon_sword/shared.lua:
if CLIENT then
SWEP.DrawWeaponInfoBox = true
end

SWEP.Author       = "-CRY-minal-"
SWEP.Purpose      = "Big F*cking Sword 9K!"
SWEP.Instructions = "Too strong..."

SWEP.PrintName = "Neon BFS 9K"
SWEP.Category = "Gluk Melee"
SWEP.Spawnable= true
SWEP.AdminOnly= true

SWEP.ViewModelFOV = 75
SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.ViewModelFlip = false
SWEP.BobScale = 1
SWEP.SwayScale = 0

SWEP.HoldType = "melee2"

SWEP.ShowWorldModel = false

SWEP.AutoSwitchTo = true
SWEP.AutoSwitchFrom = false
SWEP.Weight = 0
SWEP.Slot = 0
SWEP.SlotPos = 0

SWEP.UseHands = true
SWEP.DrawAmmo = false
SWEP.Base = "weapon_base"

SWEP.Idle = 0
SWEP.IdleTimer = CurTime()

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"
SWEP.Primary.Damage = 9000
SWEP.Primary.DelayMiss = 0.15
SWEP.Primary.DelayHit = 0.3
SWEP.Primary.Force = 999999

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"

SWEP.ViewModelBoneMods = {}
SWEP.VElements = {
	["part3+"] = { type = "Model", model = "models/props_combine/combine_train02a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "part1", pos = Vector(0.5, 20, 0), angle = Angle(-90, -30, 0), size = Vector(0.025, 0.025, 0.025), color = Color(0, 175, 255, 255), surpresslightning = true, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["part1+"] = { type = "Model", model = "models/phxtended/tri2x1x1solid.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "part1", pos = Vector(-4.301, -17, -2.3), angle = Angle(0, -90, 0), size = Vector(0.189, 0.189, 0.079), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["part3++"] = { type = "Model", model = "models/props_combine/combine_train02a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "part1", pos = Vector(0, -20, 0), angle = Angle(-90, 0, 0), size = Vector(0.019, 0.019, 0.019), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["part3+++"] = { type = "Model", model = "models/props_phx/gears/rack18.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "part1", pos = Vector(-2.451, 6, 0), angle = Angle(90, 0, 0), size = Vector(0.3, 0.3, 0.3), color = Color(0, 175, 255, 255), surpresslightning = true, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["part2"] = { type = "Model", model = "models/maxofs2d/thruster_propeller.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "part1", pos = Vector(-0.5, 4, -0.201), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["part1"] = { type = "Model", model = "models/hunter/plates/plate025x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 2.5, -19), angle = Angle(0, -5, 89), size = Vector(0.699, 0.699, 0.699), color = Color(0, 60, 60, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	["part2+"] = { type = "Model", model = "models/maxofs2d/thruster_propeller.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "part1", pos = Vector(-0.5, 13, -0.201), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["part1++"] = { type = "Model", model = "models/phxtended/tri2x1x1solid.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "part1", pos = Vector(-4.2, 16.399, -1.201), angle = Angle(0, -90, 0), size = Vector(0.1, 0.1, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["part3"] = { type = "Model", model = "models/props_combine/combine_train02a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "part1", pos = Vector(5, -1, 0), angle = Angle(-90, 0, 0), size = Vector(0.025, 0.052, 0.025), color = Color(0, 175, 255, 255), surpresslightning = true, material = "phoenix_storms/white", skin = 0, bodygroup = {} }
}
SWEP.WElements = {
	["part1"] = { type = "Model", model = "models/hunter/plates/plate025x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 0, -20), angle = Angle(0, 0, 90), size = Vector(0.699, 0.699, 0.699), color = Color(60, 60, 80, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	["part1+"] = { type = "Model", model = "models/phxtended/tri2x1x1solid.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "part1", pos = Vector(-4.6, -17, -2.3), angle = Angle(0, -90, 0), size = Vector(0.189, 0.189, 0.079), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["part2++"] = { type = "Model", model = "models/maxofs2d/thruster_propeller.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "part1", pos = Vector(0, 4, -0.201), angle = Angle(0, 0, 180), size = Vector(0.5, 0.5, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["part3++"] = { type = "Model", model = "models/props_combine/combine_train02a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "part1", pos = Vector(0, -20, 0), angle = Angle(-90, 0, 0), size = Vector(0.019, 0.019, 0.019), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["part2+++"] = { type = "Model", model = "models/maxofs2d/thruster_propeller.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "part1", pos = Vector(0, 13, 0.2), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["part3+++"] = { type = "Model", model = "models/props_combine/combine_train02a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "part1", pos = Vector(5, -1, 0), angle = Angle(-90, 0, 0), size = Vector(0.025, 0.05, 0.025), color = Color(0, 145, 255, 255), surpresslightning = true, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["part2"] = { type = "Model", model = "models/maxofs2d/thruster_propeller.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "part1", pos = Vector(0, 4, 0.2), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["part3"] = { type = "Model", model = "models/props_phx/gears/rack18.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "part1", pos = Vector(-2.8, 5, 0), angle = Angle(90, 0, 0), size = Vector(0.3, 0.3, 0.3), color = Color(0, 145, 255, 255), surpresslightning = true, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["part1++"] = { type = "Model", model = "models/phxtended/tri2x1x1solid.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "part1", pos = Vector(-4.2, 16.399, -1.201), angle = Angle(0, -90, 0), size = Vector(0.1, 0.1, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["part2+"] = { type = "Model", model = "models/maxofs2d/thruster_propeller.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "part1", pos = Vector(0, 13, -0.201), angle = Angle(0, 0, 180), size = Vector(0.5, 0.5, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["part3+"] = { type = "Model", model = "models/props_combine/combine_train02a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "part1", pos = Vector(0.5, 20, 0), angle = Angle(-90, -30, 0), size = Vector(0.025, 0.025, 0.025), color = Color(0, 145, 255, 255), surpresslightning = true, material = "phoenix_storms/white", skin = 0, bodygroup = {} }
}

function SWEP:Initialize()
self:SetWeaponHoldType( self.HoldType )
self.Idle = 0
self.IdleTimer = CurTime() + 1
end

function SWEP:Deploy()
self:SetWeaponHoldType( self.HoldType )
self.Weapon:SendWeaponAnim( ACT_VM_DRAW )
self.Idle = 0
self.IdleTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
return true
end

function SWEP:Holster()
self.Idle = 0
self.IdleTimer = CurTime()
return true
end

function SWEP:PrimaryAttack()
self:SetHoldType( self.HoldType )
local tr = util.TraceLine( {
start = self.Owner:GetShootPos(),
endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * 64,
filter = self.Owner,
mask = MASK_SHOT_HULL,
} )
if !IsValid( tr.Entity ) then
tr = util.TraceHull( {
start = self.Owner:GetShootPos(),
endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * 64,
filter = self.Owner,
mins = Vector( -16, -16, 0 ),
maxs = Vector( 16, 16, 0 ),
mask = MASK_SHOT_HULL,
} )
end
if SERVER then
if IsValid( tr.Entity ) then
local dmg = DamageInfo()
local attacker = self.Owner
if !IsValid( attacker ) then
attacker = self
end
dmg:SetAttacker( attacker )
dmg:SetInflictor( self )
dmg:SetDamage( self.Primary.Damage )
dmg:SetDamageForce( self.Owner:GetForward() * self.Primary.Force )
tr.Entity:TakeDamageInfo( dmg )
end
if !tr.Hit then
self.Owner:EmitSound( "weapons/iceaxe/iceaxe_swing1.wav" )
end
if tr.Hit then
local bullet = {}
bullet.Num = 1
bullet.Src = self.Owner:GetShootPos()
bullet.Dir = self.Owner:GetAimVector()
bullet.Distance = 90
bullet.Spread = Vector( 0, 0, 0 )
bullet.Tracer = 0
bullet.Force = 9000
bullet.Damage = 0
bullet.AmmoType = "none"
self.Owner:FireBullets( bullet )
if tr.Entity:IsNPC() || tr.Entity:IsPlayer() then
self.Owner:EmitSound( "weapons/crossbow/bolt_fly4.wav" )
else
self.Owner:EmitSound( "weapons/crossbow/bolt_fly4.wav" )
end
end
end
if !tr.Hit then
self.Weapon:SendWeaponAnim( ACT_VM_MISSCENTER )
self:SetNextPrimaryFire( CurTime() + self.Primary.DelayMiss )
self:SetNextSecondaryFire( CurTime() + self.Primary.DelayMiss )
end
if tr.Hit then
self.Weapon:SendWeaponAnim( ACT_VM_MISSCENTER )
self:SetNextPrimaryFire( CurTime() + self.Primary.DelayHit )
self:SetNextSecondaryFire( CurTime() + self.Primary.DelayHit )
end
self:ShootEffects()
self.Idle = 0
self.IdleTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
end

function SWEP:SecondaryAttack()
end

function SWEP:ShootEffects()
self.Owner:SetAnimation( PLAYER_ATTACK1 )
end

function SWEP:Reload()
end

function SWEP:Think()
if self.IdleTimer <= CurTime() then
if self.Idle == 0 then
self.Idle = 1
end
if SERVER and self.Idle == 1 then
self.Weapon:SendWeaponAnim( ACT_VM_IDLE )
end
self.IdleTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
end
end






/********************************************************
	SWEP Construction Kit base code
		Created by Clavus
	Available for public use, thread at:
	   facepunch.com/threads/1032378
	   
	   
	DESCRIPTION:
		This script is meant for experienced scripters 
		that KNOW WHAT THEY ARE DOING. Don't come to me 
		with basic Lua questions.
		
		Just copy into your SWEP or SWEP base of choice
		and merge with your own code.
		
		The SWEP.VElements, SWEP.WElements and
		SWEP.ViewModelBoneMods tables are all optional
		and only have to be visible to the client.
********************************************************/

function SWEP:Initialize()

	// other initialize code goes here

	if CLIENT then
		
		self:SetWeaponHoldType( self.HoldType )	
		// Create a new table for every weapon instance
		self.VElements = table.FullCopy( self.VElements )
		self.WElements = table.FullCopy( self.WElements )
		self.ViewModelBoneMods = table.FullCopy( self.ViewModelBoneMods )

		self:CreateModels(self.VElements) // create viewmodels
		self:CreateModels(self.WElements) // create worldmodels
		
		// init view model bone build function
		if IsValid(self.Owner) then
			local vm = self.Owner:GetViewModel()
			if IsValid(vm) then
				self:ResetBonePositions(vm)
				
				--[[// Init viewmodel visibility
				if (self.ShowViewModel == nil or self.ShowViewModel) then
					vm:SetColor(Color(255,255,255,255))
				else
					// we set the alpha to 1 instead of 0 because else ViewModelDrawn stops being called
					vm:SetColor(Color(255,255,255,1))
					// ^ stopped working in GMod 13 because you have to do Entity:SetRenderMode(1) for translucency to kick in
					// however for some reason the view model resets to render mode 0 every frame so we just apply a debug material to prevent it from drawing
					vm:SetMaterial("Debug/hsv")			
				end]]--
			end
		end
		
	end

end

function SWEP:Holster()
	
	if CLIENT and IsValid(self.Owner) then
		local vm = self.Owner:GetViewModel()
		if IsValid(vm) then
			self:ResetBonePositions(vm)
		end
	end
	
	return true
end

function SWEP:OnRemove()
	self:Holster()
end

if CLIENT then

	SWEP.vRenderOrder = nil
	function SWEP:ViewModelDrawn()
		
		local vm = self.Owner:GetViewModel()
		if !IsValid(vm) then return end
		
		if (!self.VElements) then return end
		
		self:UpdateBonePositions(vm)

		if (!self.vRenderOrder) then
			
			// we build a render order because sprites need to be drawn after models
			self.vRenderOrder = {}

			for k, v in pairs( self.VElements ) do
				if (v.type == "Model") then
					table.insert(self.vRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.vRenderOrder, k)
				end
			end
			
		end

		for k, name in ipairs( self.vRenderOrder ) do
		
			local v = self.VElements[name]
			if (!v) then self.vRenderOrder = nil break end
			if (v.hide) then continue end
			
			local model = v.modelEnt
			local sprite = v.spriteMaterial
			
			if (!v.bone) then continue end
			
			local pos, ang = self:GetBoneOrientation( self.VElements, v, vm )
			
			if (!pos) then continue end
			
			if (v.type == "Model" and IsValid(model)) then

				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )
				
				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end
				
				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end
				
				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end
				
				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end
				
			elseif (v.type == "Sprite" and sprite) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
				
			elseif (v.type == "Quad" and v.draw_func) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()

			end
			
		end
		
	end

	SWEP.wRenderOrder = nil
	function SWEP:DrawWorldModel()
		
		if (self.ShowWorldModel == nil or self.ShowWorldModel) then
			self:DrawModel()
		end
		
		if (!self.WElements) then return end
		
		if (!self.wRenderOrder) then

			self.wRenderOrder = {}

			for k, v in pairs( self.WElements ) do
				if (v.type == "Model") then
					table.insert(self.wRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.wRenderOrder, k)
				end
			end

		end
		
		if (IsValid(self.Owner)) then
			bone_ent = self.Owner
		else
			// when the weapon is dropped
			bone_ent = self
		end
		
		for k, name in pairs( self.wRenderOrder ) do
		
			local v = self.WElements[name]
			if (!v) then self.wRenderOrder = nil break end
			if (v.hide) then continue end
			
			local pos, ang
			
			if (v.bone) then
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent )
			else
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent, "ValveBiped.Bip01_R_Hand" )
			end
			
			if (!pos) then continue end
			
			local model = v.modelEnt
			local sprite = v.spriteMaterial
			
			if (v.type == "Model" and IsValid(model)) then

				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )
				
				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end
				
				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end
				
				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end
				
				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end
				
			elseif (v.type == "Sprite" and sprite) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
				
			elseif (v.type == "Quad" and v.draw_func) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()

			end
			
		end
		
	end

	function SWEP:GetBoneOrientation( basetab, tab, ent, bone_override )
		
		local bone, pos, ang
		if (tab.rel and tab.rel != "") then
			
			local v = basetab[tab.rel]
			
			if (!v) then return end
			
			// Technically, if there exists an element with the same name as a bone
			// you can get in an infinite loop. Let's just hope nobody's that stupid.
			pos, ang = self:GetBoneOrientation( basetab, v, ent )
			
			if (!pos) then return end
			
			pos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
		else
		
			bone = ent:LookupBone(bone_override or tab.bone)

			if (!bone) then return end
			
			pos, ang = Vector(0,0,0), Angle(0,0,0)
			local m = ent:GetBoneMatrix(bone)
			if (m) then
				pos, ang = m:GetTranslation(), m:GetAngles()
			end
			
			if (IsValid(self.Owner) and self.Owner:IsPlayer() and 
				ent == self.Owner:GetViewModel() and self.ViewModelFlip) then
				ang.r = -ang.r // Fixes mirrored models
			end
		
		end
		
		return pos, ang
	end

	function SWEP:CreateModels( tab )

		if (!tab) then return end

		// Create the clientside models here because Garry says we can't do it in the render hook
		for k, v in pairs( tab ) do
			if (v.type == "Model" and v.model and v.model != "" and (!IsValid(v.modelEnt) or v.createdModel != v.model) and 
					string.find(v.model, ".mdl") and file.Exists (v.model, "GAME") ) then
				
				v.modelEnt = ClientsideModel(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)
				if (IsValid(v.modelEnt)) then
					v.modelEnt:SetPos(self:GetPos())
					v.modelEnt:SetAngles(self:GetAngles())
					v.modelEnt:SetParent(self)
					v.modelEnt:SetNoDraw(true)
					v.createdModel = v.model
				else
					v.modelEnt = nil
				end
				
			elseif (v.type == "Sprite" and v.sprite and v.sprite != "" and (!v.spriteMaterial or v.createdSprite != v.sprite) 
				and file.Exists ("materials/"..v.sprite..".vmt", "GAME")) then
				
				local name = v.sprite.."-"
				local params = { ["$basetexture"] = v.sprite }
				// make sure we create a unique name based on the selected options
				local tocheck = { "nocull", "additive", "vertexalpha", "vertexcolor", "ignorez" }
				for i, j in pairs( tocheck ) do
					if (v[j]) then
						params["$"..j] = 1
						name = name.."1"
					else
						name = name.."0"
					end
				end

				v.createdSprite = v.sprite
				v.spriteMaterial = CreateMaterial(name,"UnlitGeneric",params)
				
			end
		end
		
	end
	
	local allbones
	local hasGarryFixedBoneScalingYet = false

	function SWEP:UpdateBonePositions(vm)
		
		if self.ViewModelBoneMods then
			
			if (!vm:GetBoneCount()) then return end
			
			// !! WORKAROUND !! //
			// We need to check all model names :/
			local loopthrough = self.ViewModelBoneMods
			if (!hasGarryFixedBoneScalingYet) then
				allbones = {}
				for i=0, vm:GetBoneCount() do
					local bonename = vm:GetBoneName(i)
					if (self.ViewModelBoneMods[bonename]) then 
						allbones[bonename] = self.ViewModelBoneMods[bonename]
					else
						allbones[bonename] = { 
							scale = Vector(1,1,1),
							pos = Vector(0,0,0),
							angle = Angle(0,0,0)
						}
					end
				end
				
				loopthrough = allbones
			end
			// !! ----------- !! //
			
			for k, v in pairs( loopthrough ) do
				local bone = vm:LookupBone(k)
				if (!bone) then continue end
				
				// !! WORKAROUND !! //
				local s = Vector(v.scale.x,v.scale.y,v.scale.z)
				local p = Vector(v.pos.x,v.pos.y,v.pos.z)
				local ms = Vector(1,1,1)
				if (!hasGarryFixedBoneScalingYet) then
					local cur = vm:GetBoneParent(bone)
					while(cur >= 0) do
						local pscale = loopthrough[vm:GetBoneName(cur)].scale
						ms = ms * pscale
						cur = vm:GetBoneParent(cur)
					end
				end
				
				s = s * ms
				// !! ----------- !! //
				
				if vm:GetManipulateBoneScale(bone) != s then
					vm:ManipulateBoneScale( bone, s )
				end
				if vm:GetManipulateBoneAngles(bone) != v.angle then
					vm:ManipulateBoneAngles( bone, v.angle )
				end
				if vm:GetManipulateBonePosition(bone) != p then
					vm:ManipulateBonePosition( bone, p )
				end
			end
		else
			self:ResetBonePositions(vm)
		end
		   
	end
	 
	function SWEP:ResetBonePositions(vm)
		
		if (!vm:GetBoneCount()) then return end
		for i=0, vm:GetBoneCount() do
			vm:ManipulateBoneScale( i, Vector(1, 1, 1) )
			vm:ManipulateBoneAngles( i, Angle(0, 0, 0) )
			vm:ManipulateBonePosition( i, Vector(0, 0, 0) )
		end
		
	end

	/**************************
		Global utility code
	**************************/

	// Fully copies the table, meaning all tables inside this table are copied too and so on (normal table.Copy copies only their reference).
	// Does not copy entities of course, only copies their reference.
	// WARNING: do not use on tables that contain themselves somewhere down the line or you'll get an infinite loop
	function table.FullCopy( tab )

		if (!tab) then return nil end
		
		local res = {}
		for k, v in pairs( tab ) do
			if (type(v) == "table") then
				res[k] = table.FullCopy(v) // recursion ho!
			elseif (type(v) == "Vector") then
				res[k] = Vector(v.x, v.y, v.z)
			elseif (type(v) == "Angle") then
				res[k] = Angle(v.p, v.y, v.r)
			else
				res[k] = v
			end
		end
		
		return res
		
	end
	
end
--addons/joes_stuff/lua/weapons/shield_deployer_4/shared.lua:
AddCSLuaFile()

SWEP.Base = "shield_deployer_base"
SWEP.PrintName = "Shield Level 4 Deployer"
SWEP.Category = "AOCRP - Schilde"

SWEP.Author = "Joe"
SWEP.Purpose = "Deploy Shields"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true


SWEP.ENT_CLASS = "shield_4"
--addons/weapon_jedi/lua/weapons/weapon_lscs/cl_init.lua:
include( "shared.lua" )
include("sh_combo.lua")
include("sh_animations.lua")
include("sh_blockpoints.lua")
include( "sh_stance_override.lua" )
include("cl_worldmodel.lua")
include("cl_effects.lua")

SWEP.Slot = 0
SWEP.SlotPos = 0

language.Add( "lscsGlowstick", "Lightsaber" )

local circles = include("includes/circles/circles.lua")

local X = ScrW() - 110
local Y = ScrH() - 100

-- removed for performance optimization
--local BP_BG = circles.New(CIRCLE_OUTLINED, 126, 0, 0, 12)
--BP_BG:SetColor( Color(0, 0, 0, 200) )
--BP_BG:SetX( X )
--BP_BG:SetY( Y )

local BP = circles.New(CIRCLE_OUTLINED, 125, 0, 0, 10)
BP:SetColor( Color(255, 0, 0, 255) )
BP:SetX( X )
BP:SetY( Y )

-- removed for performance optimization
--local CH_BG = circles.New(CIRCLE_OUTLINED, 106, 0, 0, 12)
--CH_BG:SetColor( Color(0, 0, 0, 200) )
--CH_BG:SetX( X )
--CH_BG:SetY( Y )

local CH = circles.New(CIRCLE_OUTLINED, 105, 0, 0, 10)
CH:SetColor( Color(255, 200, 0, 255) )
CH:SetX( X )
CH:SetY( Y )

local mat_xhair = Material( "sprites/hud/v_crosshair1" )
local mat_glow = Material( "sprites/light_glow02_add" )

local COLOR_WHITE = Color( 255, 255, 255, 255 )
local VECTOR_NULL = Vector(0,0,0)

local segmentLength = 5
local segmentSpace = 10

local OldCombo
local ComboIcon = Material("entities/item_stance_yongli.png")

local advBG = Material( "lscs/ui/hud_adv.png" ) -- added for performance optimization
local bpBG = Material( "lscs/ui/hud_bp.png" ) -- added for performance optimization

AOCDerma:RegisterFont("AOCRP.NEWHUD.COMBONAME", "Agency FB", 30, 100)
function SWEP:DrawHUD()
	local ply = LocalPlayer()

	if ply:InVehicle() and not ply:GetAllowWeaponsInVehicle() then return end

	local combo = self:GetCombo()

	local segmentDist = segmentLength + segmentSpace
	local ActiveValueCH = 160 * self:GetComboHits()
	local ActiveValueBP = (160 /  self:GetMaxBlockPoints()) * self:GetBlockPoints()


    local ply = LocalPlayer()

    AOCDerma:DrawTextShadow("Dein Kampfstil", AOCDerma:Font("AOCRP.NEWHUD.FIREMODE"), hexaVertices[1].x+AOCW(250/2), hexaVertices[4].y-AOCH(55), Color(204,204,204), TEXT_ALIGN_CENTER)
    AOCDerma:DrawTextShadow(combo.name, AOCDerma:Font("AOCRP.NEWHUD.COMBONAME"), hexaVertices[1].x+AOCW(250/2), hexaVertices[4].y-AOCH(35), Color(255,255,255), TEXT_ALIGN_CENTER)

	-- added for performance optimization
	surface.SetDrawColor(Color(0, 0, 0, 200))

	if not LSCS:HUDShouldHide( LSCS_HUD_POINTS_ADVANTAGE ) then
		surface.SetMaterial( advBG )
		surface.DrawTexturedRect( X - 146, Y - 156, 256,256, 0 )
	end

	if combo.AutoBlock and not LSCS:HUDShouldHide( LSCS_HUD_POINTS_BLOCK ) then
		surface.SetMaterial(bpBG)
		surface.DrawTexturedRect( X - 146, Y - 156, 256,256, 0 )
	end


	draw.NoTexture()

	-- the way im using circles is probably not ideal...  but fuck it, it looks so awesome.  This is probably the thing that will pop up in your profiler
	local Offset = 150
	for A = 0, 170 - segmentDist, segmentDist do
		local Start = Offset + A

		if A < ActiveValueCH and not LSCS:HUDShouldHide( LSCS_HUD_POINTS_ADVANTAGE ) then
			CH:SetStartAngle( Start  )
			CH:SetEndAngle( Start  + segmentLength )
			CH()
		end

		if not combo.AutoBlock or LSCS:HUDShouldHide( LSCS_HUD_POINTS_BLOCK ) then continue end

		if A < ActiveValueBP then
			BP:SetStartAngle( Start  )
			BP:SetEndAngle( Start  + segmentLength )
			BP()
		end
	end

	local Pos = ply:GetPos()

	if self:IsComboActive() then return end	

	for _, v in ipairs( player.GetAll() ) do -- oh no he did it again... How else would you do it tho?
		if v == ply or (v:GetPos() - Pos):Length() > 400 then continue end

		local _pos = self:GetPlayerBlockPos( v )

		if _pos and _pos ~= VECTOR_NULL then
			local Pos2D = _pos:ToScreen()
			if not Pos2D.visible then continue end

			local BlockDistance = self:GetBlockDistanceTo( _pos )

			local Col

			if BlockDistance < self:GetBlockDistanceNormal() then
				if BlockDistance < self:GetBlockDistancePerfect() then
					Col = Color( 0, 255, 0, 255 ) -- why
				else
					Col = Color( 255, 255, 0, 255 ) -- am i not
				end
			else
				Col = Color( 255, 0, 0, 255 ) -- caching these?
			end

			surface.SetDrawColor( Col.r, Col.g, Col.b, Col.a )

			if self:GetPlayerCurComboUnblockable( v ) then
				draw.SimpleText( "!", "LSCS_BLOCK_FONT", Pos2D.x, Pos2D.y, Col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			else
				surface.SetMaterial( mat_xhair )
				surface.DrawTexturedRectRotated( Pos2D.x, Pos2D.y, 40, 40, 0 )
			end

			surface.SetDrawColor( Col.r * 0.5, Col.g * 0.5, Col.b * 0.5, Col.a )
			local SZ = 1000 * self:GetAttackMultiplier( v )
			surface.SetMaterial(mat_glow)
			surface.DrawTexturedRectRotated( Pos2D.x, Pos2D.y, SZ, SZ, 0 )
		end
	end
end

function SWEP:GetPlayerBlockPos( ply )
	if not IsValid( ply ) or not ply.GetActiveWeapon then return false end

	local wep = ply:GetActiveWeapon()

	if not IsValid( wep ) or not wep.LSCS or not wep.GetBlockPos then return false end

	return wep:GetBlockPos()
end

function SWEP:GetPlayerCurComboUnblockable( ply )
	if not IsValid( ply ) or not ply.GetActiveWeapon then return false end

	local wep = ply:GetActiveWeapon()

	if not IsValid( wep ) or not wep.LSCS or not wep.CurComboUnblockable then return false end

	return wep:CurComboUnblockable()
end

function SWEP:GetAttackMultiplier( ply )
	if not IsValid( ply ) or not ply.GetActiveWeapon then return false end

	local wep = ply:GetActiveWeapon()

	if not IsValid( wep ) or not wep.LSCS or not wep.GetComboHits then return false end

	return wep:GetComboHits()
end

local circle = Material( "vgui/circle" )
local size = 5

function SWEP:DoDrawCrosshair( x, y )
	local ply = LocalPlayer()

	local pos = ply:lscsGetViewOrigin() + ply:EyeAngles():Forward() * 100 -- this method IS needed in case some other third person addon is overwriting the view

	local scr = pos:ToScreen()

	if scr.visible then
		surface.SetMaterial( circle )
		surface.SetDrawColor( 0, 0, 0, 255 )
		surface.DrawTexturedRect( scr.x - size * 0.5 + 1, scr.y - size * 0.5 + 1, size, size )

		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawTexturedRect( scr.x - size * 0.5, scr.y - size * 0.5, size, size )
	end

	return true
end

function SWEP:DrawWeaponSelection( x, y, wide, tall, alpha )
	draw.SimpleText( "n", "WeaponIcons", x + wide/2, y + tall*0.2, Color( 255, 210, 0, 255 ), TEXT_ALIGN_CENTER )
end

function SWEP:CalcView( ply, pos, angles, fov )
	if not IsValid( ply ) or ply:GetViewEntity() ~= ply or not ply:Alive() then return end

	ply._lscsCalcViewTime = CurTime() + 0.1 -- this is used to detect if its broken

	return ply:lscsGetViewOrigin(), ply:EyeAngles(), fov
end

function SWEP:Reload()
end

function SWEP:OnActiveChanged( oldActive, active )
end

function SWEP:OnTick()
end

function SWEP:OnRemove()
	self:ClearWorldModel()
	self:ClearBladeModel()
end

function SWEP:EmitSoundUnpredicted( sound )
	-- dont do anything on client
end

surface.CreateFont( "LSCS_BP_FONT", {
	font = "Verdana",
	extended = false,
	size = 16,
	weight = 2000,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = false,
} )

surface.CreateFont( "LSCS_BLOCK_FONT", {
	font = "Verdana",
	extended = false,
	size = 60,
	weight = 2000,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = false,
} )
--addons/aoc_nextbots/lua/weapons/weapon_npc_e5bx.lua:
AddCSLuaFile()

SWEP.Base   = "weapon_summes_npcbase"

SWEP.PrintName = "NPC: E5-BX"
SWEP.Spawnable = false
SWEP.Author = "Summe"

SWEP.WorldModel = "models/npc/weapons/w_e5.mdl"
SWEP.Weight = 3

SWEP.Damage = 15
SWEP.NextShoot = 0.2
SWEP.Tracer = "effect_npc_laser_yellow"
SWEP.ImpactEffect = "rw_sw_impact_yellow"
SWEP.Sound = "everfall/weapons/e-5/bx/blasters_e5_bx_laser_close_var_01.mp3"
SWEP.ClipSize = 30
SWEP.Spread = 0.01
--addons/aoc_nextbots/lua/weapons/weapon_npc_ee3.lua:
AddCSLuaFile()

SWEP.Base   = "weapon_summes_npcbase"

SWEP.PrintName = "NPC: EE3"
SWEP.Spawnable = false
SWEP.Author = "Deltaa"

SWEP.WorldModel = "models/arccw/sw_battlefront/weapons/ee3_noscope.mdl"
SWEP.Weight = 3

SWEP.NextShoot = 0.3
SWEP.Damage = 25
SWEP.Tracer = "effect_npc_laser_red"
SWEP.ImpactEffect = "rw_sw_impact_red"
SWEP.Sound = "everfall/weapons/ee-3/blasters_ee3_laser_close_var_01.mp3"
SWEP.ClipSize = 30
SWEP.Spread = 0.1


--gamemodes/starwarsrp/entities/entities/aoc_vehicleammo.lua:
AddCSLuaFile()


ENT.Type = "anim"
ENT.Base = "base_anim"

ENT.PrintName		= "Fahrzeugmunition"
ENT.Author			= "Lt. Sammy"
ENT.Contact			= ""
ENT.Purpose			= ""
ENT.Instructions	= ""
ENT.Category        = "AOCRP"
ENT.Spawnable       = true
ENT.AOCRPInteract = true

if SERVER then
        
    function ENT:Initialize()

        self:SetModel( "models/reizer_props/srsp/sci_fi/crate_01/crate_01.mdl" )
        self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
        self:SetMoveType( MOVETYPE_VPHYSICS )   -- after all, gmod is a physics
        self:SetSolid( SOLID_VPHYSICS )         -- Toolbox
    
        self:SetUseType( SIMPLE_USE )


            local phys = self:GetPhysicsObject()
        if (phys:IsValid()) then
            phys:Wake()
        end
    end
    
    function ENT:Refil( entity )
		if self.MarkForRemove then return end

		if not IsValid( entity ) then return end

		if not entity.LVS then return end

		if entity:WeaponRestoreAmmo() then
			entity:EmitSound("items/ammo_pickup.wav")

			self.MarkForRemove = true

			SafeRemoveEntityDelayed( self, 0 )
		end
	end

	function ENT:PhysicsCollide( data, physobj )
		self:Refil( data.HitEntity )
	end


end


--gamemodes/starwarsrp/entities/entities/aoc_waffenabgabe.lua:
AddCSLuaFile()


ENT.Type = "anim"
ENT.Base = "base_anim"

ENT.PrintName		= "Waffenabgabe"
ENT.Author			= "Lt. Sammy"
ENT.Contact			= ""
ENT.Purpose			= ""
ENT.Instructions	= ""
ENT.Category        = "AOCRP"
ENT.Spawnable       = true
ENT.AOCRPInteract = true

if SERVER then
        
    function ENT:Initialize()

        self:SetModel( "models/reizer_props/srsp/sci_fi/armory_01/armory_01.mdl" )
        self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
        self:SetMoveType( MOVETYPE_VPHYSICS )   -- after all, gmod is a physics
        self:SetSolid( SOLID_VPHYSICS )         -- Toolbox
    
        self:SetUseType( SIMPLE_USE )


            local phys = self:GetPhysicsObject()
        if (phys:IsValid()) then
            phys:Wake()
        end
    end

    ENT.WaffenLager = {}

    function ENT:Use(activator, caller)
        if self.WaffenLager[activator:EntIndex()] then
            --self.WaffenLager[activator:EntIndex()] = nil
            for k, v in pairs(self.WaffenLager[activator:EntIndex()]) do
                activator:Give(v)
            end

            self.WaffenLager[activator:EntIndex()] = nil
        else
            local waffen = activator:GetWeapons()

            local classTbl = {}

            for k, v in pairs(waffen) do
                if table.HasValue(AOCRP.Config.DefaultWeapons, v:GetClass()) then continue end
                if table.HasValue(AOCRP.Config.NoStripWeapons, v:GetClass()) then continue end

                table.insert(classTbl, v:GetClass())

                activator:StripWeapon(v:GetClass())
            end

            self.WaffenLager[activator:EntIndex()] = classTbl
        end
    end
end



if CLIENT then

    function ENT:Draw()
        self.BaseClass.Draw(self)  -- We want to override rendering, so don't call baseclass.
                                    -- Use this when you need to add to the rendering.
        --self:DrawEntityOutline( 1.0 ) -- Draw an outline of 1 world unit.
        --self:DrawModel()       -- Draw the model.


    end

end
--addons/aoc_nextbots/lua/entities/aocrp_nextbot_b1_sniper.lua:
AddCSLuaFile()

ENT.Base = "summe_nextbot"
ENT.PrintName = "B1 Sniper"
ENT.Category = "AOCRP | Nextbots"
ENT.Spawnable = false
ENT.AdminOnly = false

ENT.Model = "models/cis_npc/hydro/b1_battledroids/aat/b1_battledroid_aat.mdl"
ENT.Weapon = "weapon_npc_e5s"
ENT.HP = 300
ENT.ShootingRange = 7500
ENT.LooseRadius = 7500
ENT.Proficiency = 0.1
ENT.Speed = 100

ENT.Melee = true
ENT.MeleeDamage = 25
ENT.MeleeDelay = 3

ENT.ThrowGrenades = false
ENT.Grenades = {"summe_gr_grenade"}

ENT.Sounds = {
    ["killed"] = {
        "aoc/nextbot/b1/killed/scream1.wav",
        "aoc/nextbot/b1/killed/scream2.wav",
        "aoc/nextbot/b1/killed/scream3.wav",
        "aoc/nextbot/b1/killed/scream4.wav",
        "aoc/nextbot/b1/killed/scream5.wav"
    },

    ["attacking"] = {
        "aoc/nextbot/b1/attack/ausloeschen.wav",
        "aoc/nextbot/b1/attack/roger-roger.wav",
        "aoc/nextbot/b1/attack/scanne-das-ziel.wav",
        "aoc/nextbot/b1/attack/scanne-feindeinheit.wav",
        "aoc/nextbot/b1/attack/siegt.wav",
        "aoc/nextbot/b1/attack/ziel-erfasst.wav",
    },

    ["kill"] = {
        "aoc/nextbot/b1/kill/knapp.wav",
        "aoc/nextbot/b1/kill/nimm-das.wav",
        "aoc/nextbot/b1/kill/yeah.wav"
    }
}

ENT.Anims = {
    ["idle"] = {0},
    ["shoot"] = {"Smg1angryidle1"},
    ["reload"] = {"reload_smg1"},
    ["walk_slow"] = {"walk_all"},
    ["walk_fast"] = {"run_all"},
    ["melee"] = {"swing"},
}
--addons/aoc_nextbots/lua/entities/aocrp_nextbot_elitecombine.lua:
AddCSLuaFile()

ENT.Base = "summe_nextbot"
ENT.PrintName = "Benjamin Heuer"
ENT.Category = "AOCRP | Nextbots"
ENT.Spawnable = false
ENT.AdminOnly = false

ENT.Model = "models/Combine_Super_Soldier.mdl"
ENT.Weapon = "weapon_npc_e5s"
ENT.HP = 400
ENT.ShootingRange = 7500
ENT.LooseRadius = 7500
ENT.Proficiency = .05

ENT.Melee = true
ENT.MeleeDamage = 25
ENT.MeleeDelay = 3

ENT.ThrowGrenades = false
ENT.Grenades = {}

ENT.Sounds = {}

ENT.Anims = {
    ["idle"] = {"idle1"},
    ["shoot"] = {"shootar2alt"},
    ["reload"] = {"reload"},
    ["walk_slow"] = {"walk_all"},
    ["walk_fast"] = {"runaimall1_sg"},
    ["melee"] = {"meleeattack01"},
}

function ENT:OnNPCSpawn()
    self:PlayAnimation("idle")
end
--addons/aoc_nextbots/lua/entities/aocrp_nextbot_trando.lua:
AddCSLuaFile()

ENT.Base = "summe_nextbot"
ENT.PrintName = "Trandoshaner"
ENT.Category = "AOCRP | Nextbots"
ENT.Spawnable = false
ENT.AdminOnly = false

ENT.Model = {
    "models/npc_hcn/starwars/bf/bossk/bossk.mdl",
    "models/npc_hcn/starwars/bf/bossk/bossk_black.mdl",
    "models/npc_hcn/starwars/bf/bossk/bossk_blue.mdl",
    "models/npc_hcn/starwars/bf/bossk/bossk_green.mdl",
    "models/npc_hcn/starwars/bf/bossk/bossk_red.mdl"
}

ENT.Weapon = "weapon_npc_ee3"
ENT.HP = 600
ENT.ShootingRange = 2000
ENT.LooseRadius = 4000
ENT.Proficiency = 0.3
ENT.Speed = 100

ENT.Melee = true
ENT.MeleeDamage = 25
ENT.MeleeDelay = 3

ENT.ThrowGrenades = false
ENT.Grenades = {"summe_gr_grenade"}

ENT.Sounds = {}

ENT.Anims = {
    ["idle"] = {"adooridle"},
    ["shoot"] = {"shoot_smg1"},
    ["reload"] = {"reload_smg1"},
    ["walk_slow"] = {"walk_hold_smg1"},
    ["walk_fast"] = {"run_hold_smg1"},
    ["melee"] = {"swing"},
}

function ENT:OnNPCSpawn()
    self:SetSkin(math.random(0, 2))
    self:PlayAnimation("idle")
end
--addons/arccw_base_modified/lua/entities/arccw_ammo_357_large.lua:
AddCSLuaFile()

ENT.Base                      = "arccw_ammo"
ENT.RenderGroup               = RENDERGROUP_TRANSLUCENT

ENT.PrintName                 = "Magnum Ammo (Large)"
ENT.Category                  = "ArcCW - Ammo"

ENT.Spawnable                 = true
ENT.Model                     = "models/items/arccw/magnum_ammo_closed.mdl"

ENT.AmmoType = "357"
ENT.AmmoCount = 60
ENT.Scale = 1.5

ENT.DetonationDamage = 50
ENT.DetonationRadius = 128
ENT.DetonationSound = "weapons/357_fire2.wav"
--addons/arccw_base_modified/lua/entities/arccw_ammo_buckshot_large.lua:
AddCSLuaFile()

ENT.Base                      = "arccw_ammo"

ENT.PrintName                 = "Shotgun Ammo (Large)"
ENT.Category                  = "ArcCW - Ammo"

ENT.Spawnable                 = true
ENT.Model                     = "models/items/arccw/shotgun_ammo_closed.mdl"
ENT.Scale = 1.5

ENT.AmmoType = "buckshot"
ENT.AmmoCount = 100

ENT.DetonationDamage = 80
ENT.DetonationRadius = 128
ENT.DetonationSound = "weapons/shotgun/shotgun_fire6.wav"
--lua/entities/arccw_ammo_plinking.lua:
AddCSLuaFile()

ENT.Base                      = "arccw_ammo"
ENT.RenderGroup               = RENDERGROUP_TRANSLUCENT

ENT.PrintName                 = "Plinking Ammo"
ENT.Category                  = "ArcCW - Ammo"

ENT.Spawnable                 = true
ENT.Model                     = "models/items/arccw/plinking_ammo.mdl"

ENT.AmmoType = "plinking"
ENT.AmmoCount = 100

ENT.DetonationDamage = 10
ENT.DetonationRadius = 128
ENT.DetonationSound = nil

DEFINE_BASECLASS(ENT.Base)
function ENT:DetonateRound()
    BaseClass.DetonateRound(self)
    self:EmitSound("weapons/pistol/pistol_fire2.wav", 70, 175, 0.8)
end
--addons/arccw_base_modified/lua/entities/arccw_ammo_smg1_grenade.lua:
AddCSLuaFile()

ENT.Base                      = "arccw_ammo"

ENT.PrintName                 = "Rifle Grenade"
ENT.Category                  = "ArcCW - Ammo"

ENT.Spawnable                 = true
ENT.Model                     = "models/Items/AR2_Grenade.mdl"
ENT.Health = 15

ENT.AmmoType = "smg1_grenade"
ENT.AmmoCount = 1

ENT.DetonationDamage = 50 -- Per-round damage
ENT.DetonationRadius = 300

function ENT:DetonateRound(attacker)
    local nade = ents.Create("arccw_gl_ammodet")
    nade:SetPos(self:GetPos())
    nade:SetAngles(self:GetAngles() + AngleRand(-10, 10))
    nade:Spawn()
    nade:GetPhysicsObject():AddVelocity(self:GetVelocity() + self:GetForward() * math.random(500, 2000))
    nade:SetOwner(attacker or self.Burner)
    self:Remove()
end

function ENT:Detonate(wet, attacker)
    if wet then
        self:DetonateRound(attacker)
    else
        local e = EffectData()
        e:SetOrigin(self:GetPos())
        util.Effect("Explosion", e)

        util.BlastDamage(self, attacker, self:GetPos(), self.DetonationRadius, self.DetonationDamage)
        self:Remove()
    end
end
--addons/arccw_base_modified/lua/entities/arccw_ammo_smg1_large.lua:
AddCSLuaFile()

ENT.Base                      = "arccw_ammo"

ENT.PrintName                 = "Carbine Ammo (Large)"
ENT.Category                  = "ArcCW - Ammo"

ENT.Spawnable                 = true
ENT.Model                     = "models/items/arccw/smg_ammo.mdl"
ENT.Scale = 1.5

ENT.AmmoType = "smg1"
ENT.AmmoCount = 300

ENT.DetonationDamage = 30
ENT.DetonationRadius = 256
ENT.DetonationSound = "weapons/smg1/npc_smg1_fire1.wav"
--addons/arccw_base_modified/lua/entities/arccw_att_dropped.lua:
AddCSLuaFile()

ENT.Base = "arccw_att_base"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT
ENT.Category = "ArcCW - Attachments"
ENT.PrintName = "Attachment Box"
ENT.Spawnable = false

ENT.Model = "models/Items/BoxMRounds.mdl"

function ENT:Draw()
    self:DrawModel()

    local cvar2d3d = ArcCW.ConVars["2d3d"]:GetInt()
    if cvar2d3d == 0 or (cvar2d3d == 1 and LocalPlayer():GetEyeTrace().Entity != self) then return end

    if (EyePos() - self:WorldSpaceCenter()):LengthSqr() <= 262144 then -- 512^2
        local ang = LocalPlayer():EyeAngles()
        local name = self:GetNWString("boxname", nil) or self.PrintName

        ang:RotateAroundAxis(ang:Forward(), 180)
        ang:RotateAroundAxis(ang:Right(), 90)
        ang:RotateAroundAxis(ang:Up(), 90)

        cam.Start3D2D(self:WorldSpaceCenter() + Vector(0, 0, 14), ang, 0.1)
            surface.SetFont("ArcCW_32_Unscaled")
            local w = surface.GetTextSize(name)

            surface.SetTextPos(-w / 2 + 2, 2)
            surface.SetTextColor(0, 0, 0, 150)
            surface.DrawText(name)

            surface.SetTextPos(-w / 2, 0)
            surface.SetTextColor(255, 255, 255, 255)
            surface.DrawText(name)

            local count = self:GetNWInt("boxcount", 0)
            local str = count .. " Attachment" .. (count != 1 and "s" or "")
            local w2 = surface.GetTextSize(str)

            surface.SetTextPos(-w2 / 2 + 2, 26)
            surface.SetTextColor(0, 0, 0, 150)
            surface.DrawText(str)
            surface.SetTextPos(-w2 / 2, 24)
            surface.SetTextColor(255, 255, 255, 255)
            surface.DrawText(str)
        cam.End3D2D()
    end
end
--addons/arccw_weapons/lua/entities/arccw_nade_dc17m/shared.lua:
ENT.Type = "anim"
ENT.Base = "arccw_thr"
ENT.PrintName = "Grenade Launcher Rocket"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/weapons/tfa_starwars/w_thermal.mdl"
ENT.FuseTime = 4
ENT.ArmTime = 1
ENT.ImpactFuse = true

AddCSLuaFile()

function ENT:Initialize()
    if SERVER then
		ParticleEffectAttach( "astw2_halo_reach_grenade_launcher_trail", PATTACH_POINT_FOLLOW, self, 1 )
		util.SpriteTrail( self, 0, Color(255,185,20,185), false, 16, 4, 0.22, 0.01, "effects/halo3/trail/basic_trail" )
		util.SpriteTrail( self, 0, Color(255,155,20,155), false, 12, 4, 0.25, 0.01, "effects/halo3/trail/flaming_trail" )
        self:SetModel( self.Model )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:SetSolid( SOLID_VPHYSICS )
        self:PhysicsInit( SOLID_VPHYSICS )
        self:SetCollisionGroup( COLLISION_GROUP_PROJECTILE )
        self:DrawShadow( true )

        local phys = self:GetPhysicsObject()
        if phys:IsValid() then
            phys:Wake()
			phys:SetMass(1)
            phys:SetBuoyancyRatio(0)
            phys:EnableGravity( true )
        end

        self.kt = CurTime() + self.FuseTime
        self.motorsound = CreateSound( self, "weapons/masita_extras/cw/wpn_rep_unit_lockon_lp.wav")
		self.motorsound:Play()
    end
	if CLIENT then
	ParticleEffectAttach( "astw2_halo_reach_grenade_launcher_trail", PATTACH_POINT_FOLLOW, self, 1 )
	end
    self.at = CurTime() + self.ArmTime
    self.Armed = false
end

function ENT:OnRemove()
    if SERVER then
        self.motorsound:Stop()
    end
end


function ENT:PhysicsCollide(data, physobj)
if SERVER then
		if data.Speed > 25 then
            self:EmitSound(Sound("weapons/grenades/wpn_fraggrenade_1p_hardsurface_bounce_01_lr_v" .. math.random(1,2) .. ".wav"))
		end
		end
	if self.at <= CurTime() and self.ImpactFuse then
            self:Detonate()


        end
		local effectdata = EffectData()
            effectdata:SetOrigin( self:GetPos() )
        util.Effect( "StunstickImpact", effectdata)
end

function ENT:Arm()
    if SERVER then
        
    end
end

function ENT:Think()



    if CurTime() >= self.at and !self.Armed then
        self:Arm()
        self.Armed = true
    end

    if SERVER then

        if self.Armed then
            local phys = self:GetPhysicsObject()
        end
	
	if CurTime() >= self.at then
            local targets = ents.FindInSphere(self:GetPos(), 16)
            for _, k in pairs(targets) do
                if k:IsPlayer() or k:IsNPC() then
                    if self:Visible( k ) and k:Health() > 0 then
                        self:Detonate()
                    end
                elseif (k:IsValid() and scripted_ents.IsBasedOn( k:GetClass(), "base_nextbot" )) then
                    self:Detonate()
                end
            end
        end

        if CurTime() >= self.kt then
            self:Detonate()
        end
    end

    if CLIENT then
        -- if self:IsValid() then
            -- local emitter = ParticleEmitter(self:GetPos())

            -- if !self:IsValid() or self:WaterLevel() > 2 then return end

	-- local smoke = emitter:Add("effects/halo3/muzzle_magnum", self:GetPos())
        -- smoke:SetGravity( Vector(math.Rand(-5, 5), math.Rand(-5, 5), math.Rand(-20, -25)) )
        -- smoke:SetVelocity( self:GetAngles():Forward() * 100 )
        -- smoke:SetDieTime( math.Rand(0.1,0.15) )
        -- smoke:SetStartAlpha( 255 )
        -- smoke:SetEndAlpha( 0 )
        -- smoke:SetStartSize( 3 )
        -- smoke:SetEndSize( 0 )
        -- smoke:SetRoll( math.Rand(-180, 180) )
        -- smoke:SetRollDelta( math.Rand(-0.2,0.2) )
        -- smoke:SetColor( 255, 125, 55 )
        -- smoke:SetAirResistance( 2 )
        -- smoke:SetPos( self:GetPos() )
        -- smoke:SetLighting( false )
		
        -- emitter:Finish()
        -- end
    end
end

function ENT:Detonate()
    if SERVER then
        if !self:IsValid() then return end
        local effectdata = EffectData()
            effectdata:SetOrigin( self:GetPos() )

        if self:WaterLevel() >= 1 then
            util.Effect( "WaterSurfaceExplosion", effectdata )
        else
            ParticleEffect( "astw2_halo_3_frag_explosion", self:GetPos(), self:GetAngles() )
	-- sound.Play( "halo/halo_reach/weapons/grenade_launcher_expl" .. math.random(1,3) .. ".ogg",  self:GetPos(), 100, 100 )
	self:EmitSound("grenades/gren_expl" .. math.random(1,4) .. "_close.ogg", 120, 100, 1, CHAN_AUTO)
        end

        local attacker = self

        if self.Owner:IsValid() then
            attacker = self.Owner
        end
	local targets = ents.FindInSphere(self:GetPos(), 300)
        for _, k in pairs(targets) do
            if k != self and k:GetPos().z < self:GetPos().z + 64 then
                local damage = DamageInfo()
                damage:SetAttacker( self:GetOwner() )
                damage:SetDamage( 5 )
                damage:SetDamageType( DMG_SHOCK )
                damage:SetInflictor( self )
                k:TakeDamageInfo( damage )
            end
        end
	util.Decal( "astw2_halo_reach_impact_soft_terrain_explosion", self:GetPos(), self:GetPos() - Vector(0, 0, 32), self )
         util.BlastDamage(self, attacker, self:GetPos(), 300, 250)
	 util.ScreenShake(self:GetPos(),4500,100,0.6,1024)
	 
        self:Remove()
    end
end

function ENT:Draw()
    if CLIENT then
        self:DrawModel()

        if self.Armed then
            cam.Start3D() -- Start the 3D function so we can draw onto the screen.
                render.SetMaterial( Material("effects/halo3/8pt_ringed_star_flare") ) -- Tell render what material we want, in this case the flash from the gravgun
                render.DrawSprite( self:GetPos(), math.random(25, 50), math.random(30, 55), Color(255, 200, 150) ) -- Draw the sprite in the middle of the map, at 16x16 in it's original colour with full alpha.
            cam.End3D()
        end
    end
end
--lua/entities/arccw_uc_40mm_airburst.lua:
AddCSLuaFile()

ENT.Base = "arccw_uc_40mm_he"
ENT.PrintName = "40mm Airburst"

ENT.GrenadeDamage = 75
ENT.GrenadeRadius = 300
ENT.ExplosionEffect = false
ENT.Scorch = false
ENT.DragCoefficient = 0.75
ENT.DetonateOnImpact = false

ENT.NextTraceTime = 0

if SERVER then
    function ENT:Think()
        if SERVER and CurTime() - self.SpawnTime >= self.FuseTime then
            self:Detonate()
        end

        if self.SpawnTime + 0.2 < CurTime() and self.NextTraceTime < CurTime() then
            self.NextTraceTime = CurTime() + 0.1

            local dir = self:GetVelocity():GetNormalized()
            local deg = math.Clamp(1.5 - dir:Cross(Vector(0, 0, -1)):Length(), 0.5, 1)

            local tr = util.TraceHull({
                start = self:GetPos(),
                endpos = self:GetPos() + dir * (1024 * deg),
                filter = self,
                mins = Vector(-16, -16, -8),
                maxs = Vector(16, 16, 8)
            })
            if tr.Hit then
                self:Detonate()
            end
        end

    end
end

function ENT:DoDetonation()
    local attacker = IsValid(self:GetOwner()) and self:GetOwner() or self
    local dir = self:GetVelocity():GetNormalized()
    local effectdata = EffectData()
    effectdata:SetOrigin(self:GetPos())

    if self:WaterLevel() >= 1 then
        util.Effect("WaterSurfaceExplosion", effectdata)
        self:EmitSound("weapons/underwater_explode3.wav", 125, 100, 1, CHAN_AUTO)
    else
        effectdata:SetMagnitude(4)
        effectdata:SetScale(1)
        effectdata:SetRadius(4)
        effectdata:SetNormal(dir)
        util.Effect("Sparks", effectdata)
        self:EmitSound("physics/metal/metal_box_break1.wav", 100, 200)
    end

    -- The steeper the vertical angle, the higher the damage
    local deg = math.Clamp(1.5 - dir:Cross(Vector(0, 0, -1)):Length(), 0.5, 1)

    self:FireBullets({
        Attacker = attacker,
        Damage = 25,
        Force = 5,
        Distance = 2048,
        HullSize = 16,
        Num = 64,
        Tracer = 1,
        Src = self:GetPos(),
        Dir = dir,
        Spread = Vector(1, 1, 0),
        IgnoreEntity = self,
    })
    local dmg = DamageInfo()
    dmg:SetAttacker(IsValid(self:GetOwner()) and self:GetOwner() or self)
    dmg:SetDamageType(DMG_BULLET)
    dmg:SetInflictor(self)
    dmg:SetDamageForce(self:GetVelocity() * 100)
    for _, ent in pairs(ents.FindInCone(self:GetPos(), dir, 1024, 0.707)) do
        local tr = util.QuickTrace(self:GetPos(), ent:WorldSpaceCenter() - self:GetPos(), self)
        if tr.Entity == ent then
            dmg:SetDamage(math.Rand(75, 150) * deg * math.Clamp(tr.Fraction, 0.5, 1))
            ent:TakeDamageInfo(dmg)
        end
    end

    util.BlastDamage(self, attacker, self:GetPos(), self.GrenadeRadius, self.GrenadeDamage or self.Damage or 0)
end

--[[]
function ENT:BurstEffect()
    local dir = self:GetVelocity():GetNormalized()
    local emitter = ParticleEmitter(self:GetPos())
    if !self:IsValid() or self:WaterLevel() > 2 then return end
    if !IsValid(emitter) then return end
    for i = 1, 64 do
        local fire = emitter:Add("particles/smokey", self:GetPos())
        fire:SetVelocity( VectorRand() * 500 + dir * 1000 )
        fire:SetGravity( Vector(0, 0, -90) )
        fire:SetDieTime( math.Rand(0.25, 0.5) )
        fire:SetStartAlpha( 200 )
        fire:SetEndAlpha( 0 )
        fire:SetStartSize( 10 )
        fire:SetEndSize( 128 )
        fire:SetRoll( math.Rand(-180, 180) )
        fire:SetRollDelta( math.Rand(-0.2,0.2) )
        fire:SetColor( 255, 255, 255 )
        fire:SetAirResistance( 150 )
        fire:SetPos( self:GetPos() )
        fire:SetLighting( false )
        fire:SetCollide(true)
        fire:SetBounce(0.75)
        fire:SetNextThink( CurTime() + FrameTime() )
        fire:SetThinkFunction( function(pa)
            if !pa then return end
            local col1 = Color(150, 150, 150)
            local col2 = Color(200, 200, 200)

            local col3 = col1
            local d = pa:GetLifeTime() / pa:GetDieTime()
            col3.r = Lerp(d, col1.r, col2.r)
            col3.g = Lerp(d, col1.g, col2.g)
            col3.b = Lerp(d, col1.b, col2.b)

            pa:SetColor(col3.r, col3.g, col3.b)
            pa:SetNextThink( CurTime() + FrameTime() )
        end )
    end
    emitter:Finish()
end
]]
--lua/entities/arccw_uc_40mm_napalm.lua:
AddCSLuaFile()

ENT.Base = "arccw_uc_40mm_he"
ENT.PrintName = "40mm Napalm"

ENT.GrenadeDamage = 50
ENT.GrenadeRadius = 150
ENT.ExplosionEffect = false
ENT.Scorch = false
ENT.DragCoefficient = 0.75
ENT.DetonateOnImpact = false

ENT.NextTraceTime = 0

if SERVER then
    function ENT:Think()
        if SERVER and CurTime() - self.SpawnTime >= self.FuseTime then
            self:Detonate()
        end

        if self.SpawnTime + 0.2 < CurTime() and self.NextTraceTime < CurTime() then
            self.NextTraceTime = CurTime() + 0.1
            local dir = self:GetVelocity():GetNormalized()
            local tr = util.TraceHull({
                start = self:GetPos(),
                endpos = self:GetPos() + dir * 512,
                filter = self,
                mins = Vector(-16, -16, -8),
                maxs = Vector(16, 16, 8)
            })
            if tr.Hit then
                self:Detonate()
            end
        end

    end
end

function ENT:DoDetonation()
    local effectdata = EffectData()
    effectdata:SetOrigin(self:GetPos())

    if self:WaterLevel() >= 1 then
        util.Effect("WaterSurfaceExplosion", effectdata)
        self:EmitSound("weapons/underwater_explode3.wav", 125, 100, 1, CHAN_AUTO)
    else
        effectdata:SetMagnitude(4)
        effectdata:SetScale(1)
        effectdata:SetRadius(4)
        effectdata:SetNormal(self:GetVelocity():GetNormalized())
        util.Effect("Sparks", effectdata)
        self:EmitSound("physics/metal/metal_box_break1.wav", 100, 200)
        self:EmitSound("ambient/fire/gascan_ignite1.wav", 100, 100, 0.75)
    end

    for i = 1, math.random(5, 7) do
        local cloud = ents.Create("arccw_uc_napalm")
        cloud.FireTime = math.Rand(20, 40)

        if !IsValid(cloud) then return end

        local vel = VectorRand() * 500

        cloud.Order = i
        cloud:SetPos(self:GetPos() - (self:GetVelocity() * FrameTime()) + VectorRand())
        --cloud:SetAbsVelocity(vel + self:GetVelocity())
        cloud:SetOwner(self:GetOwner())
        cloud:Spawn()
        cloud:GetPhysicsObject():SetVelocityInstantaneous(self:GetVelocity() + vel)

    end
end
--gamemodes/starwarsrp/entities/entities/ctf_flag.lua:
AddCSLuaFile()

ENT.Base="base_gmodentity"
ENT.Type="anim"
ENT.Spawnable=true
ENT.Author="drlol"
ENT.PrintName="Capture the Flag"
ENT.Category="AOCRP"
ENT.Purpose=""

function ENT:CreateFlag(ply)
	local targ=self
	if ply~=nil then targ=ply end

	local ang=targ:GetAngles()

	targ.flag_parts={}

	targ.flag_parts.pole=ents.Create("prop_physics")
		targ.flag_parts.pole:SetModel("models/hunter/plates/plate175.mdl")
		targ.flag_parts.pole:Spawn()
		targ.flag_parts.pole:SetParent(targ,3)
		targ.flag_parts.pole:SetPos(Vector(0,1.5,30))
		targ.flag_parts.pole:SetAngles(Angle(ang.x, ang.y, 90))
		targ.flag_parts.pole:SetMaterial("models/debug/debugwhite")
		targ.flag_parts.pole:SetColor(Color(70,70,70))
		if targ~=self then targ.flag_parts.pole:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE) end
			
	targ.flag_parts.flag=ents.Create("prop_physics")
		targ.flag_parts.flag:SetModel("models/hunter/plates/plate05x075.mdl")
		targ.flag_parts.flag:Spawn()
		targ.flag_parts.flag:SetParent(targ,3)
		targ.flag_parts.flag:SetPos(Vector(0,-13,58))
		targ.flag_parts.flag:SetAngles(Angle(90, ang.y, ang.z))
		targ.flag_parts.flag:SetMaterial("models/debug/debugwhite")
		targ.flag_parts.flag:SetColor(Color(255,255,255))
		if targ~=self then targ.flag_parts.flag:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE) end
end


function ENT:Initialize()
	self:SetModel("models/xeon133/slider/slider_stand_12x12x24.mdl")
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetMaterial("phoenix_storms/metalfloor_2-3")

 	if SERVER then
 		self:SetUseType(SIMPLE_USE)
 		self:PhysicsInit(SOLID_VPHYSICS)

    	local phys = self:GetPhysicsObject()
    	if (phys:IsValid()) then
			phys:Wake()
			phys:EnableMotion(false)
			self:Activate()
		end

		timer.Simple(0, function()
			self:CreateFlag()
		end)
	end
end

function ENT:SetupDataTables()

	self:NetworkVar("Bool", 0, "HasTeam")
	self:NetworkVar("Bool", 1, "Captured")
	self:NetworkVar("String", 0, "TeamName")
	self:NetworkVar("Vector", 0, "TeamColor")
	self:NetworkVar("String", 1, "FlagOwner")
	self:NetworkVar("Int", 0, "Points")

	if SERVER then
		self:SetHasTeam(false)
		self:SetCaptured(false)
		self:SetTeamName("NONE")
		self:SetTeamColor(Vector(1,1,1))
		self:SetFlagOwner("0")
		self:SetPoints(0)
	end

end

if SERVER then

function ENT:Use(ply)

if not self:GetHasTeam() then
	if ply.ctf_team~=nil then 
		ctf_chatmsg({Color(255,70,70), "Du must dein aktuelles Team verlassen um ein neues zu erstellen"}, ply)
		return
	end
	net.Start("ctf_flags_setupteam")
		net.WriteEntity(self)
	net.Send(ply)
else
	if ply.ctf_team==self then
		ctf_chatmsg({Color(255,70,70), "Du hast Team  ", self:GetTeamColor():ToColor(), self:GetTeamName(), Color(255,70,70), " verlassen"}, ply)
		ply.ctf_team=nil 
		net.Start("ctf_flags_leaveteam")
			net.WriteEntity(ply)
		net.Broadcast()
		return 
	end
	if ply.ctf_team~=nil then
		ctf_chatmsg({Color(255,70,70), "Du musst dein aktuelles Team verlassen um einem neuen beizutreten"}, ply)
		return
	end
	net.Start("ctf_flags_jointeam")
		net.WriteEntity(ply)
		net.WriteEntity(self)
	net.Broadcast()
	ply.ctf_team=self
	ctf_chatmsg({Color(70,255,70), "Du bist Team ", self:GetTeamColor():ToColor(), self:GetTeamName(), Color(70,255,70), " beigetreten"}, ply)
end

end

function ENT:OnRemove()
	local plys=player.GetAll()

	for i=1,#plys do
		local v=plys[i]
		if v.ctf_team~=nil and v.ctf_team==self then
			v.ctf_team=nil
			net.Start("ctf_flags_leaveteam")
				net.WriteEntity(v)
			net.Broadcast()
		end
		if v.ctf_captured~=nil and v.ctf_captured==self then
			v.ctf_captured=nil
			v.flag_parts.pole:Remove()
			v.flag_parts.flag:Remove()
			net.Start("ctf_flags_droppedflag")
				net.WriteEntity(v)
			net.Broadcast()
		end
	end
end

function ENT:StartTouch(ent)

	if not ent:IsPlayer() or ent.ctf_team==nil then return end
	
	if ent.ctf_team==self then
		if ent.ctf_captured==nil then return end

		local captured=ent.ctf_captured
		captured.flag_parts.pole:SetNoDraw(false)
		captured.flag_parts.flag:SetNoDraw(false)
		captured:SetCaptured(false)
		ctf_globalmsg(Color(51,255,0), self:GetTeamName() .. " hat die Flagge von " .. captured:GetTeamName().." gesichert!")
		self:SetPoints(self:GetPoints()+1)
		ent.ctf_captured=nil
		net.Start("ctf_flags_droppedflag")
			net.WriteEntity(ent)
		net.Broadcast()
		ent.flag_parts.pole:Remove()
		ent.flag_parts.flag:Remove()

	elseif not self:GetCaptured() then
		if ent.ctf_captured~=nil then return end

		self.flag_parts.pole:SetNoDraw(true)
		self.flag_parts.flag:SetNoDraw(true)
		self:SetCaptured(true)
		ctf_globalmsg(Color(255,0,0), "Jemand hat die Flagge von " .. self:GetTeamName() .. " geklaut!")
		ent.ctf_captured=self

		self:CreateFlag(ent)
		local ang=ent:GetAngles()
		local p1,p2=ent.flag_parts.pole:GetPos(),ent.flag_parts.flag:GetPos()
		ent.flag_parts.flag:SetAngles(Angle(ang.x+90,ang.y,ang.z))
		ent.flag_parts.pole:SetPos(Vector(-20,0, 3))
		ent.flag_parts.flag:SetPos(Vector(-20,-14.5,31))
		ent.flag_parts.flag:SetColor(self:GetTeamColor():ToColor())

		net.Start("ctf_flags_capturedflag")
			net.WriteEntity(ent)
			net.WriteEntity(self)
		net.Broadcast()
	end

end

end

if CLIENT then


AOCDerma:RegisterFont("AOCRP_CTF_Name", "Agency FB", 50, 1000)
AOCDerma:RegisterFont("AOCRP_CTF_Small", "Agency FB", 25, 1000)

	
	





function ENT:Draw()

	local ply=LocalPlayer()
	self:DrawModel()

	local team_name="[E] zum einrichten"
	local team_col=self:GetTeamColor():ToColor()

	if self:GetHasTeam() then
		team_name=self:GetTeamName()
	end

	local ang=Angle(0,EyeAngles().y,0)
	ang:RotateAroundAxis(ang:Up(),-90)
	ang:RotateAroundAxis(ang:Forward(),90)

	local pos=self:GetPos()+Vector(0,0,90)

	surface.SetFont("TargetIDSmall")
	local tw2=surface.GetTextSize("Drücke [E] zum beitreten")

	cam.Start3D2D(pos, ang, 0.3)

		AOCDerma:DrawTextShadow(string.upper(team_name), AOCDerma:Font("AOCRP_CTF_Name"), 0, -10, team_col, TEXT_ALIGN_CENTER)

		if self:GetHasTeam() then

			
			if ply.ctf_team==nil then
				AOCDerma:DrawTextShadow("Drücke [E] zum beitreten", AOCDerma:Font("AOCRP_CTF_Small"), 0, 30, Color(255,255,255), TEXT_ALIGN_CENTER)

			end

			AOCDerma:DrawTextShadow(self:GetPoints(), AOCDerma:Font("AOCRP_CTF_Name"), 0, -50, team_col, TEXT_ALIGN_CENTER)

		end
	cam.End3D2D()

	if self:GetHasTeam() and not self:GetCaptured() and ply.ctf_team~=nil and ply.ctf_team~=self then
		render.SetColorMaterial()
		render.DrawSphere(self:GetPos()+Vector(0,0,30), 70, 20, 20, Color(team_col.r, team_col.g, team_col.b, 40))
	end
end

end
--addons/aoc_fire_system/lua/entities/fire/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"

ENT.PrintName = "Feuer"
ENT.Author = "Orange Cosmos RP Team (Jake, Noob, Crap-Head)"
ENT.Contact = "N/A"
ENT.Category = "AOCRP"
ENT.Spawnable = true
ENT.AdminOnly = false

local PMETA = FindMetaTable( "Player" )

function PMETA:CanSee( ent, close )
	if close then
		if not self:HasLOS( ent ) then 
			return false 
		end
	end

	local fov = self:GetFOV()
	local disp = ent:GetPos() - self:GetPos()
	local dist = disp:Length()
	local size = ent:BoundingRadius() * 0.5
	
	local MaxCos = math.abs( math.cos( math.acos( dist / math.sqrt( dist * dist + size * size ) ) + fov * ( math.pi / 180 ) ) )
	disp:Normalize()

	if disp:Dot( self:EyeAngles():Forward() ) > MaxCos and ent:GetPos():DistToSqr( self:GetPos() ) < 5000*5000 then
		return true
	end
	
	return false
end
--lua/entities/heracles421_lfs_mtt/shared.lua:
ENT.Type            = "anim"
DEFINE_BASECLASS( "heracles421_lfs_base" )

ENT.PrintName = "MTT"
ENT.Author = "Heracles421"
ENT.Information = ""
ENT.Category = "[LFS] Galactica Networks"

ENT.Spawnable		= true
ENT.AdminSpawnable	= false
ENT.AITEAM = 1

ENT.RotorPos = Vector(323,0,310)

ENT.MDL = "models/heracles421/galactica_vehicles/mtt.mdl"
ENT.GibModels = {
	"models/heracles421/galactica_vehicles/mtt.mdl",
}

ENT.MaxPrimaryAmmo = 1500

ENT.Mass = 20000

ENT.SeatPos = Vector(320,0,300)
--ENT.SeatPos = Vector(-25,0,20)
ENT.SeatAng = Angle(0,-90,0)

ENT.MaxHealth = 50000
ENT.MoveSpeed = 15
ENT.BoostSpeed = 25
ENT.LerpMultiplier = 0.5
ENT.HeightOffset = -10
ENT.TraceDistance = 200
ENT.IgnoreWater = false
ENT.HideDriver = true
ENT.AutomaticFrameAdvance = true

ENT.TraceSubdivision = 2
ENT.TraceDistance = 300

sound.Add( {
	name = "GALACTICA_MTT_FIRE",
	channel = CHAN_WEAPON,
	volume = 1.0,
	level = 125,
	pitch = {65, 85},
	sound = "heracles421/galactica_vehicles/mtt_sideguns_fire.mp3"
} )

sound.Add( {
	name = "GALACTICA_MTT_ENGINE",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 120,
	pitch = 85,
	sound = "heracles421/galactica_vehicles/mtt_engine.wav"
} )

ENT.ShadowParams = {
	secondstoarrive		= 0.001,
	maxangular			= 25,
	maxangulardamp		= 100000,
	maxspeed			= 1000000,
	maxspeeddamp		= 500000,
	dampfactor			= 1,
	teleportdistance	= 0,
}

--addons/arccw_weapons/lua/entities/imp_rocket/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "MiniMag Rocket"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/weapons/star_wars_battlefront/com_weap_missile.mdl"
ENT.FuseTime = 15
ENT.ArmTime = 0

AddCSLuaFile()

function ENT:Initialize()
    if SERVER then
        self:SetModel( self.Model )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:SetSolid( SOLID_VPHYSICS )
        self:PhysicsInit( SOLID_VPHYSICS )
        self:SetCollisionGroup( COLLISION_GROUP_PROJECTILE )
        self:DrawShadow( true )

        local phys = self:GetPhysicsObject()
        if phys:IsValid() then
            phys:Wake()
	phys:SetMass(2)
            phys:SetBuoyancyRatio(0)
            phys:EnableGravity( false )
        end

        self.kt = CurTime() + self.FuseTime
        self.motorsound = CreateSound( self, "weapons/star_wars_battlefront/common/ammo_rocket_lp02.wav")
    end

    self.at = CurTime() + self.ArmTime
    self.Armed = false
end

function ENT:OnRemove()
    if SERVER then
        self.motorsound:Stop()
    end
end


function ENT:PhysicsCollide(data, physobj)
    if self.at <= CurTime() then
        self:Detonate()
    elseif self.at > CurTime() then
        local effectdata = EffectData()
            effectdata:SetOrigin( self:GetPos() )
        util.Effect( "RPGShotDown", effectdata)
        util.Effect( "StunstickImpact", effectdata)
        self:Remove()
    end
end

function ENT:Arm()
    if SERVER then
        self.motorsound:Play()
    end
end

function ENT:Think()

    if CurTime() >= self.at and !self.Armed then
        self:Arm()
        self.Armed = true
    end

    if SERVER then

        if self.Armed then
            local phys = self:GetPhysicsObject()
            phys:ApplyForceCenter( self:GetAngles():Forward() * 500 )
        end

        if CurTime() >= self.kt then
            self:Detonate()
        end
    end

    if CLIENT then
        if self.Armed then
		ParticleEffectAttach( "astw2_swbf_muzzle_imp_sniper", PATTACH_POINT_FOLLOW, self, 0 )
            local emitter = ParticleEmitter(self:GetPos())

            if !self:IsValid() or self:WaterLevel() > 2 then return end

            local smoke = emitter:Add("effects/swbf/thicksmoke", self:GetPos())
        smoke:SetGravity( Vector(math.Rand(-5, 5), math.Rand(-5, 5), math.Rand(-20, -25)) )
        smoke:SetVelocity( self:GetAngles():Forward() * 100 )
        smoke:SetDieTime( math.Rand(0.5,0.75) )
        smoke:SetStartAlpha( 85 )
        smoke:SetEndAlpha( 0 )
        smoke:SetStartSize( 15 )
        smoke:SetEndSize( 140 )
        smoke:SetRoll( math.Rand(-180, 180) )
        smoke:SetRollDelta( math.Rand(-0.2,0.2) )
        smoke:SetColor( 225, 225, 225 )
        smoke:SetAirResistance( 50 )
        smoke:SetPos( self:GetPos() )
        smoke:SetLighting( true )
        emitter:Finish()
        end
    end
end

function ENT:Detonate()
    if SERVER then
        if !self:IsValid() then return end
        local effectdata = EffectData()
            effectdata:SetOrigin( self:GetPos() )

        if self:WaterLevel() >= 1 then
            util.Effect( "WaterSurfaceExplosion", effectdata )
        else
            ParticleEffect( "astw2_swbf_explosion_imp_rocket", self:GetPos(), self:GetAngles() )
	sound.Play( "weapons/star_wars_battlefront/common/exp_ord_rocket_large0" .. math.random(1,3) .. ".wav",  self:GetPos(), 100, 100 )
        end

        local attacker = self

        if self.Owner:IsValid() then
            attacker = self.Owner
        end

        util.BlastDamage(self, attacker, self:GetPos(), 400, 400)
		util.Decal( "Scorch", self:GetPos(), self:GetPos() - Vector(0, 0, 32), self )
		util.ScreenShake(self:GetPos(),18000,500,1.2,2048)
        self:Remove()
    end
end

function ENT:Draw()
    if CLIENT then
        self:DrawModel()

        if self.Armed then
            cam.Start3D() -- Start the 3D function so we can draw onto the screen.
                render.SetMaterial( Material("effects/blueflare1") ) -- Tell render what material we want, in this case the flash from the gravgun
                render.DrawSprite( self:GetPos(), math.random(200, 300), math.random(200, 300), Color(150, 255, 100) ) -- Draw the sprite in the middle of the map, at 16x16 in it's original colour with full alpha.
            cam.End3D()
        end
    end
end
--addons/joes_stuff/lua/entities/joe_bomb/cl_init.lua:
include('shared.lua')

function ENT:Draw()
	self:DrawModel()

end
--addons/lvs_addons/lua/entities/laat_mainrocket.lua:
AddCSLuaFile()

ENT.Type            = "anim"
DEFINE_BASECLASS( "lunasflightschool_missile" )

if SERVER then
    function ENT:Initialize()	
		self:SetModel( "models/weapons/w_missile_launch.mdl" )
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetRenderMode( RENDERMODE_TRANSALPHA )
		self:PhysWake()
		local pObj = self:GetPhysicsObject()
		
		if IsValid( pObj ) then
			pObj:EnableGravity( false ) 
			pObj:SetMass( 1 ) 
		end
		
		self.LifeTime = CurTime() + 12
	end

	local function GetValidEntity(ent)
		return IsValid(ent) and ent or Entity(0)
	end

    function ENT:Think()	
		local curtime = CurTime()
		self:NextThink(curtime)
		
		self:BlindFire()
		
		if self.MarkForRemove then
			self:Detonate()
		end
		
		if self.Explode then
			local Inflictor = self:GetInflictor()
			local Attacker = self:GetAttacker()

			util.BlastDamage(GetValidEntity(Inflictor), GetValidEntity(Attacker), self:GetPos(), 500, 500)
			
			self:Detonate()
		end
		
		if self.LifeTime <= curtime then
			self:Detonate()
		end
		
		return true
	end

    function ENT:PhysicsCollide( data )
		if self:GetDisabled() then
			self.MarkForRemove = true
		else
			local HitEnt = data.HitEntity
			
			if IsValid(HitEnt) && not self.Explode && (HitEnt.LFS || HitEnt.IdentifiesAsLFS) then 
                local Pos = self:GetPos()

                local effectdata = EffectData()
                    effectdata:SetOrigin(Pos)
                    effectdata:SetNormal(-self:GetForward())
                util.Effect("manhacksparks", effectdata, true, true)

                local dmginfo = DamageInfo()
                    dmginfo:SetDamage(500)
                    dmginfo:SetAttacker(IsValid(self:GetAttacker()) && self:GetAttacker() || self)
                    dmginfo:SetDamageType(DMG_BLAST)
                    dmginfo:SetInflictor(self) 
                    dmginfo:SetDamagePosition(Pos) 
                HitEnt:TakeDamageInfo(dmginfo)

                sound.Play("Missile.ShotDown", Pos, 140)
			end
			
			self.Explode = true
		end
	end
end
--addons/lvs_addons/lua/entities/laat_rocketlauncher/shared.lua:
ENT.Base            = "base_entity"
ENT.Type            = "anim"

ENT.PrintName       = "Rockets"
ENT.Author          = "!Ben"
ENT.Information     = ""
ENT.Category        = "[LFS] - Star Wars Pack"

ENT.Spawnable		= false
ENT.AdminSpawnable	= false

ENT.RenderGroup = RENDERGROUP_BOTH

ENT.AutomaticFrameAdvance = true
--addons/lvs_addons/lua/entities/lvs_base_fakehover/cl_init.lua:
include("shared.lua")
include("sh_camera_eyetrace.lua")
include("cl_camera.lua")
include("cl_hud.lua")
--addons/lvs_addons/lua/entities/lvs_base_starfighter/cl_camera.lua:

ENT._lvsSmoothFreeLook = 0

function ENT:CalcViewDirectInput( ply, pos, angles, fov, pod )
	local ViewPosL = pod:WorldToLocal( pos )

	local view = {}
	view.fov = fov
	view.drawviewer = true
	view.angles = self:GetAngles()

	local FreeLook = ply:lvsKeyDown( "FREELOOK" )
	local Zoom = ply:lvsKeyDown( "ZOOM" )

	if not pod:GetThirdPersonMode() then

		if FreeLook then
			view.angles = pod:LocalToWorldAngles( ply:EyeAngles() )
		end

		local velL = self:WorldToLocal( self:GetPos() + self:GetVelocity() )

		local Dividor = math.abs( velL.x )
		local SideForce = math.Clamp( velL.y / Dividor, -1, 1)
		local UpForce = math.Clamp( velL.z / Dividor, -1, 1)

		local ViewPunch = Vector(0,math.Clamp(SideForce * 10,-1,1),math.Clamp(UpForce * 10,-1,1))
		if Zoom then
			ViewPunch = Vector(0,0,0)
		end

		pod._lerpPosOffset = pod._lerpPosOffset and pod._lerpPosOffset + (ViewPunch - pod._lerpPosOffset) * RealFrameTime() * 5 or Vector(0,0,0)
		pod._lerpPos = pos

		view.origin = pos + pod:GetForward() *  -pod._lerpPosOffset.y * 0.5 + pod:GetUp() *  pod._lerpPosOffset.z * 0.5
		view.angles.p = view.angles.p - pod._lerpPosOffset.z * 0.1
		view.angles.y = view.angles.y + pod._lerpPosOffset.y * 0.1
		view.drawviewer = false

		return view
	end

	pod._lerpPos = pod._lerpPos or self:GetPos()

	local radius = 550
	radius = radius + radius * pod:GetCameraDistance()

	if FreeLook then
		local velL = self:WorldToLocal( self:GetPos() + self:GetVelocity() )

		local SideForce = math.Clamp(velL.y / 10,-250,250)
		local UpForce = math.Clamp(velL.z / 10,-250,250)

		pod._lerpPosL = pod._lerpPosL and (pod._lerpPosL + (Vector(radius, SideForce,150 + radius * 0.1 + radius * pod:GetCameraHeight() + UpForce) - pod._lerpPosL) * RealFrameTime() * 12) or Vector(0,0,0)
		pod._lerpPos = self:LocalToWorld( pod._lerpPosL )

		view.origin = pod._lerpPos
		view.angles = self:LocalToWorldAngles( Angle(0,180,0) )
	else
		local TargetPos = self:LocalToWorld( Vector(500,0,150 + radius * 0.1 + radius * pod:GetCameraHeight()) )

		local Sub = TargetPos - pod._lerpPos
		local Dir = Sub:GetNormalized()
		local Dist = Sub:Length()

		local DesiredPos = TargetPos - self:GetForward() * (300 + radius) - Dir * 100

		pod._lerpPos = pod._lerpPos + (DesiredPos - pod._lerpPos) * RealFrameTime() * (Zoom and 30 or 12)
		pod._lerpPosL = self:WorldToLocal( pod._lerpPos )

		local vel = self:GetVelocity()

		view.origin = pod._lerpPos
		view.angles = self:GetAngles()
	end

	view.origin = view.origin + ViewPosL

	return view
end

function ENT:CalcViewMouseAim( ply, pos, angles, fov, pod )
	local cvarFocus = math.Clamp( LVS.cvarCamFocus:GetFloat() , -1, 1 )

	self._lvsSmoothFreeLook = self._lvsSmoothFreeLook + ((ply:lvsKeyDown( "FREELOOK" ) and 0 or 1) - self._lvsSmoothFreeLook) * RealFrameTime() * 10

	local view = {}
	view.origin = pos
	view.fov = fov
	view.drawviewer = true
	view.angles = (self:GetForward() * (1 + cvarFocus) * self._lvsSmoothFreeLook * 0.8 + ply:EyeAngles():Forward() * math.max(1 - cvarFocus, 1 - self._lvsSmoothFreeLook)):Angle()

	if cvarFocus >= 1 then
		view.angles = LerpAngle( self._lvsSmoothFreeLook, ply:EyeAngles(), self:GetAngles() )
	else
		view.angles.r = 0
	end

	if not pod:GetThirdPersonMode() then

		view.drawviewer = false

		return view
	end

	local radius = 550
	radius = radius + radius * pod:GetCameraDistance()

	local TargetOrigin = view.origin - view.angles:Forward() * radius  + view.angles:Up() * (radius * 0.2 + radius * pod:GetCameraHeight())
	local WallOffset = 4

	local tr = util.TraceHull( {
		start = view.origin,
		endpos = TargetOrigin,
		filter = function( e )
			local c = e:GetClass()
			local collide = not c:StartWith( "prop_physics" ) and not c:StartWith( "prop_dynamic" ) and not c:StartWith( "prop_ragdoll" ) and not e:IsVehicle() and not c:StartWith( "gmod_" ) and not c:StartWith( "lvs_" ) and not c:StartWith( "player" ) and not e.LVS

			return collide
		end,
		mins = Vector( -WallOffset, -WallOffset, -WallOffset ),
		maxs = Vector( WallOffset, WallOffset, WallOffset ),
	} )

	view.origin = tr.HitPos

	if tr.Hit and not tr.StartSolid then
		view.origin = view.origin + tr.HitNormal * WallOffset
	end

	return view
end

function ENT:CalcViewOverride( ply, pos, angles, fov, pod )
	return pos, angles, fov
end

function ENT:CalcViewDriver( ply, pos, angles, fov, pod )
	if ply:lvsMouseAim() then
		return self:CalcViewMouseAim( ply, pos, angles, fov, pod )
	else
		return self:CalcViewDirectInput( ply, pos, angles, fov, pod )
	end
end

function ENT:CalcViewPassenger( ply, pos, angles, fov, pod )
	return LVS:CalcView( self, ply, pos, angles, fov, pod )
end

function ENT:LVSCalcView( ply, original_pos, original_angles, original_fov, pod )
	local pos, angles, fov = self:CalcViewOverride( ply, original_pos, original_angles, original_fov, pod )

	if self:GetDriverSeat() == pod then
		return self:CalcViewDriver( ply, pos, angles, fov, pod )
	else
		return self:CalcViewPassenger( ply, pos, angles, fov, pod )
	end
end
--addons/lvs_addons/lua/entities/lvs_base_starfighter/sh_camera_eyetrace.lua:

function ENT:GetEyeTrace( trace_forward )
	local startpos = self:LocalToWorld( self:OBBCenter() )

	local pod = self:GetDriverSeat()

	if IsValid( pod ) then
		startpos = pod:LocalToWorld( pod:OBBCenter() )
	end

	local AimVector = trace_forward and self:GetForward() or self:GetAimVector()

	local data = {
		start = startpos,
		endpos = (startpos + AimVector * 50000),
		filter = self:GetCrosshairFilterEnts(),
	}

	local trace = util.TraceLine( data )

	return trace
end

function ENT:GetAimVector()
	if self:GetAI() then
		return self:GetAIAimVector()
	end

	local Driver = self:GetDriver()

	if not IsValid( Driver ) then return self:GetForward() end

	if not Driver:lvsMouseAim() then
		if Driver:lvsKeyDown( "FREELOOK" ) then
			local pod = self:GetDriverSeat()

			if not IsValid( pod ) then return Driver:EyeAngles():Forward() end

			if pod:GetThirdPersonMode() then
				return -self:GetForward()
			else
				return Driver:GetAimVector()
			end
		else
			return self:GetForward()
		end
	end

	if SERVER then
		local pod = self:GetDriverSeat()

		if not IsValid( pod ) then return Driver:EyeAngles():Forward() end

		return pod:WorldToLocalAngles( Driver:EyeAngles() ):Forward()
	else
		return Driver:EyeAngles():Forward()
	end
end

--lua/entities/lvs_fakehover_mtt/shared.lua:
ENT.Base = "lvs_base_fakehover"

ENT.PrintName = "MTT"
ENT.Author = "Luna (Base), ItzTinonTime"
ENT.Information = "The Multi-Troop Transport (MTT) was a heavily armored repulsorlift transport vehicle manufactured by Baktoid Armor Workshop and used by both the Trade Federation during their Invasion of Naboo and later the Confederacy of Independent Systems to transport B1-series battle droids."
ENT.Category = "[LVS] - Star Wars"

ENT.VehicleCategory = "Star Wars"
ENT.VehicleSubCategory = "Hover Tanks"

ENT.Spawnable = true
ENT.AdminSpawnable = false

ENT.MDL = "models/heracles421/galactica_vehicles/mtt.mdl"
ENT.GibModels = {
    "models/heracles421/galactica_vehicles/mtt.mdl",
}

ENT.AITEAM = 1

ENT.MaxHealth = 4200

ENT.ForceAngleMultiplier = 2
ENT.ForceAngleDampingMultiplier = 2

ENT.ForceLinearMultiplier = 1
ENT.ForceLinearRate = 0.5
ENT.LerpMultiplier = 3

ENT.MaxVelocityX = 120
ENT.MaxVelocityY = 120

ENT.MaxTurnRate = 0.4

ENT.BoostAddVelocityX = 120
ENT.BoostAddVelocityY = 120

ENT.GroundTraceHitWater = false
ENT.GroundTraceLength = 50
ENT.GroundTraceHull = 100

ENT.LAATC_PICKUPABLE = true
ENT.LAATC_DROP_IN_AIR = true
ENT.LAATC_PICKUP_POS = Vector(-400,0,-210)
ENT.LAATC_PICKUP_Angle = Angle(0,0,0)

function ENT:OnSetupDataTables()
	self:AddDT( "Bool", "IsCarried" )
	self:AddDT( "Entity", "GunnerSeat" )

	if SERVER then
		self:NetworkVarNotify( "IsCarried", self.OnIsCarried )
	end
end

function ENT:GetAimAngles()
    local trace = self:GetEyeTrace()

    -- Ensure trace hit position is valid
    if not trace.Hit then return Angle(0, 0, 0), Angle(0, 0, 0) end

    -- Target position from the trace
    local targetPos = trace.HitPos

    -- Adjust aim positions
    local rightWeaponPos = self:LocalToWorld(Vector(10, -60, 81))
    local leftWeaponPos = self:LocalToWorld(Vector(10, 60, 81))

    -- Calculate aim angles towards the same target position
    local AimAnglesR = (targetPos - rightWeaponPos):Angle()
    local AimAnglesL = (targetPos - leftWeaponPos):Angle()

    -- Convert to local angles
    local localAimAnglesR = self:WorldToLocalAngles(AimAnglesR)
    local localAimAnglesL = self:WorldToLocalAngles(AimAnglesL)

    return localAimAnglesR, localAimAnglesL
end

function ENT:WeaponsInRange()
	if self:GetIsCarried() then return false end

	local AimAnglesR, AimAnglesL = self:GetAimAngles()

    -- Set the weapon range
	return not ((AimAnglesR.p >= 20 and AimAnglesL.p >= 20) or (AimAnglesR.p <= -30 and AimAnglesL.p <= -30) or (math.abs(AimAnglesL.y) + math.abs(AimAnglesL.y)) >= 60)
end

function ENT:InitWeapons()
    local primaryWeapon = {}
    primaryWeapon.Icon = Material("lvs/weapons/hmg.png")
    primaryWeapon.Ammo = 500
    primaryWeapon.Delay = 0.2
    primaryWeapon.HeatRateUp = 0.15
    primaryWeapon.HeatRateDown = 0.25
    primaryWeapon.Cooldown = 0
    primaryWeapon.Attack = function(ent)
        if ent:GetIsCarried() then return true end
        if not ent:WeaponsInRange() then return true end

        local curTime = CurTime()
        if curTime < (ent.NextPrimaryFire or 0) then return end

        local ID1 = ent:LookupAttachment("muzzle_right_top")
        local ID2 = ent:LookupAttachment("muzzle_right_bottom")
        local ID3 = ent:LookupAttachment("muzzle_left_top")
        local ID4 = ent:LookupAttachment("muzzle_left_bottom")

        local Muzzle1 = ent:GetAttachment(ID1)
        local Muzzle2 = ent:GetAttachment(ID2)
        local Muzzle3 = ent:GetAttachment(ID3)
        local Muzzle4 = ent:GetAttachment(ID4)

        if not Muzzle1 or not Muzzle2 or not Muzzle3 or not Muzzle4 then return end

        local FirePos = {
            [1] = Muzzle1,
            [2] = Muzzle2,
            [3] = Muzzle3,
            [4] = Muzzle4,
        }

        ent.FireIndex = ent.FireIndex and ent.FireIndex + 1 or 1

        if ent.FireIndex > 4 then
            ent.FireIndex = 1
        end

        ent:EmitSound("GALACTICA_MTT_FIRE")

        local Pos = FirePos[ent.FireIndex].Pos
        local Dir = (ent:GetEyeTrace().HitPos - Pos):GetNormalized():Angle()

        local bullet = {}
        bullet.Src = Pos
        bullet.Dir = Dir:Forward()
        bullet.Spread = Vector(0.01, 0.01, 0)
        bullet.TracerName = "lvs_laser_red_short"
        bullet.Force = 100
        bullet.HullSize = 1
        bullet.Damage = 35
        bullet.Velocity = 12000
        bullet.Attacker = ent:GetDriver()
        bullet.Callback = function(att, tr, dmginfo)
            local effectdata = EffectData()
            effectdata:SetStart(Vector(255, 50, 50))
            effectdata:SetOrigin(tr.HitPos)
            effectdata:SetNormal(tr.HitNormal)
            util.Effect("lvs_laser_impact", effectdata)
        end
        ent:LVSFireBullet(bullet)


        local effectdata = EffectData()
        effectdata:SetStart(Vector(255, 50, 50))
        effectdata:SetOrigin(bullet.Src)
        effectdata:SetNormal(Dir:Forward())
        effectdata:SetEntity(ent)
        util.Effect("lvs_muzzle_colorable", effectdata)

        ent:TakeAmmo()

        ent.NextPrimaryFire = curTime + (ent.FireIndex == 4 and 0.3 or 0.2)
    end
    primaryWeapon.OnSelect = function(ent)
        ent:EmitSound("physics/metal/weapon_impact_soft3.wav")
    end
    primaryWeapon.OnOverheat = function(ent)
        ent:EmitSound("lvs/overheat.wav")
    end
    primaryWeapon.OnThink = function(ent, active)
        if ent:GetIsCarried() then
            ent:SetPoseParameter("cannon_right_pitch", 0)
            ent:SetPoseParameter("cannon_right_yaw", 0)
            ent:SetPoseParameter("cannon_left_pitch", 0)
            ent:SetPoseParameter("cannon_left_yaw", 0)
            return
        end

        local AimAnglesR, AimAnglesL = ent:GetAimAngles()
        ent:SetPoseParameter("cannon_right_pitch", AimAnglesR.p)
        ent:SetPoseParameter("cannon_right_yaw", AimAnglesR.y)
        ent:SetPoseParameter("cannon_left_pitch", AimAnglesL.p)
        ent:SetPoseParameter("cannon_left_yaw", AimAnglesL.y)
    end
    self:AddWeapon(primaryWeapon)

    local openRack = {}
    openRack.Icon = Material("lvs/weapons/gunship_reardoor.png")
    openRack.Ammo = -1
    openRack.Delay = 0
    openRack.HeatRateUp = 0
    openRack.HeatRateDown = 0
    openRack.StartAttack = function(ent)
        ent:OpenRack()
    end
    openRack.OnSelect = function(ent)
        ent:EmitSound("physics/metal/weapon_impact_soft3.wav")
    end
    openRack.OnOverheat = function(ent)
        ent:EmitSound("lvs/overheat.wav")
    end
    self:AddWeapon(openRack)
end

ENT.EngineSounds = {
    {
        sound = "itztinontime/itt_mtt/mtt_engine.wav",
        Pitch = 70,
        PitchMin = 0,
        PitchMax = 255,
        PitchMul = 30,
        FadeIn = 0,
        FadeOut = 1,
        FadeSpeed = 1.5,
        UseDoppler = true,
        SoundLevel = 100,
    }
}

sound.Add({
    name = "LVS.AAT.LASER_EXPLOSION",
    channel = CHAN_STATIC,
    volume = 1,
    level = 75,
    pitch = {160, 180},
    sound = {
        "lvs/vehicles/aat/turret/impact1.ogg",
        "lvs/vehicles/aat/turret/impact2.ogg",
        "lvs/vehicles/aat/turret/impact3.ogg",
        "lvs/vehicles/aat/turret/impact4.ogg"
    }
})

--addons/lvs_addons/lua/entities/lvs_neutralstarfighter_swtor/cl_init.lua:
include("shared.lua")

ENT.EngineColor = Color( 0, 255, 85)
ENT.EngineGlow = Material( "sprites/light_glow02_add" )
ENT.EnginePos = {
	Vector(-130,250,200),
	Vector(-130,-250,200),
}


function ENT:CalcViewOverride( ply, pos, angles, fov, pod )
	if pod == self:GetDriverSeat() then

		if pod:GetThirdPersonMode() then
			pos = pos + self:GetUp() * 100, angles, fov
		end

		return pos, angles, fov
	end

	return pos, angles, fov
end

function ENT:OnSpawn()
	self:RegisterTrail( Vector(-34,326,-13), 0, 20, 2, 1000, 150 )
	self:RegisterTrail( Vector(-34,-326,-13), 0, 20, 2, 1000, 150 )
end

function ENT:OnFrame()
	self:EngineEffects()
end

function ENT:EngineEffects()
	if not self:GetEngineActive() then return end

	local T = CurTime()

	if (self.nextEFX or 0) > T then return end

	self.nextEFX = T + 0.01

	local THR = self:GetThrottle()

	local emitter = self:GetParticleEmitter( self:GetPos() )

	if not IsValid( emitter ) then return end

	for _, pos in pairs( self.EnginePos ) do
		local vOffset = self:LocalToWorld( pos )
		local vNormal = -self:GetForward()

		vOffset = vOffset + vNormal * 5

		local particle = emitter:Add( "effects/muzzleflash2", vOffset )

		if not particle then continue end

		particle:SetVelocity( vNormal * (math.Rand(500,1000) + self:GetBoost() * 10) + self:GetVelocity() )
		particle:SetLifeTime( 0 )
		particle:SetDieTime( 0.1 )
		particle:SetStartAlpha( 255 )
		particle:SetEndAlpha( 0 )
		particle:SetStartSize( math.Rand(15,25) )
		particle:SetEndSize( math.Rand(0,10) )
		particle:SetRoll( math.Rand(-1,1) * 100 )
		particle:SetColor( 0, 255, 85 )
	end
end

function ENT:PostDrawTranslucent()
	if not self:GetEngineActive() then return end

	local Size = 80 + self:GetThrottle() * 120 + self:GetBoost() * 2

	render.SetMaterial( self.EngineGlow )

	for _, pos in pairs( self.EnginePos ) do
		render.DrawSprite(  self:LocalToWorld( pos ), Size, Size, self.EngineColor )
	end
end

function ENT:OnStartBoost()
	self:EmitSound( "ophra/ships/powerstart3.wav", 85 )
end

function ENT:OnStopBoost()
	self:EmitSound( "ophra/ships/shutdown.wav", 85 )
end


--addons/lvs_addons/lua/entities/lvs_reptransport_swtor/shared.lua:

ENT.Base = "lvs_base_starfighter"

ENT.PrintName = "Republic transporter"
ENT.Author = "Ophra"
ENT.Information = "Transporter of the Zakuul Empire"
ENT.Category = "[LVS] - SWTOR"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/ophra/ships/veh_rep_troop_transport_flight.mdl"
ENT.GibModels = {
	"models/salza/arc170_gib1.mdl",
	"models/salza/arc170_gib2.mdl",
	"models/salza/arc170_gib3.mdl",
	"models/salza/arc170_gib4.mdl",
	"models/salza/arc170_gib5.mdl",
	"models/salza/arc170_gib6.mdl"
}

ENT.AITEAM = 1

ENT.MaxVelocity = 2150
ENT.MaxThrust = 2150

ENT.ThrustVtol = 55
ENT.ThrustRateVtol = 3

ENT.TurnRatePitch = 1
ENT.TurnRateYaw = 1
ENT.TurnRateRoll = 1

ENT.ForceLinearMultiplier = 1

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 1

ENT.MaxHealth = 800
ENT.MaxShield = 100

function ENT:OnSetupDataTables()
	self:AddDT( "Bool", "Foils" )
	self:AddDT( "Entity", "TailGunnerSeat" )

	if SERVER then
		self:NetworkVarNotify( "Foils", self.OnFoilsChanged )
	end
end

function ENT:InitWeapons()
	self.FirePositions = {
		Vector(310.04,-50.06,-52.21),
        Vector(310.04,50.06,-52.21),
	}


	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hmg.png")
	weapon.Ammo = 1000
	weapon.Delay = 0.15
	weapon.HeatRateUp = 0.5
	weapon.HeatRateDown = 1
	weapon.Attack = function( ent )
		ent.NumPrim = ent.NumPrim and ent.NumPrim + 1 or 1
		if ent.NumPrim > #ent.FirePositions then ent.NumPrim = 1 end
 
 
		local pod = ent:GetDriverSeat()

		if not IsValid( pod ) then return end

		local startpos = pod:LocalToWorld( pod:OBBCenter() )
		local trace = util.TraceHull( {
			start = startpos,
			endpos = (startpos + ent:GetForward() * 50000),
			mins = Vector( -10, -10, -10 ),
			maxs = Vector( 10, 10, 10 ),
			filter = ent:GetCrosshairFilterEnts()
		} )

		local CurPos = ent.FirePositions[ent.NumPrim]

		local bullet = {}
		bullet.Src 	= ent:LocalToWorld( CurPos )
		bullet.Dir 	= (trace.HitPos - bullet.Src):GetNormalized()
		bullet.Spread 	= Vector( 0.025,  0.025, 0 )
		bullet.TracerName = "lvs_laser_green"
		bullet.Force	= 10
		bullet.HullSize 	= 30
		bullet.Damage	= 40
		bullet.Velocity = 50000
		bullet.Attacker 	= ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo)
			local effectdata = EffectData()
				effectdata:SetStart( Vector(0,255,0) ) 
				effectdata:SetOrigin( tr.HitPos )
			util.Effect( "lvs_laser_explosion", effectdata )
		end
		ent:LVSFireBullet( bullet )

		local effectdata = EffectData()
		effectdata:SetStart( Vector(50,255,50) )
		effectdata:SetOrigin( bullet.Src )
		effectdata:SetNormal( ent:GetForward() )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle_colorable", effectdata )

		ent:TakeAmmo()

		if CurPos.y > 0 then
			ent.SNDLeft:PlayOnce( 100 + math.cos( CurTime() + ent:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
		else
			ent.SNDRight:PlayOnce( 100 + math.cos( CurTime() + ent:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
		end
	end
	weapon.OnSelect = function( ent )
		ent:EmitSound("ophra/ships/weaponswitch.wav")
		if ent.SetFoils then ent:SetFoils( true ) end
	end
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end
	self:AddWeapon( weapon )
end


	local COLOR_RED = Color(255,0,0,255)
	local COLOR_WHITE = Color(255,255,255,255)

	

ENT.FlyByAdvance = 0.5
ENT.FlyBySound = "lvs/vehicles/arc170/flyby.wav" 
ENT.DeathSound = "lvs/vehicles/generic_starfighter/crash.wav"

ENT.EngineSounds = {
	{
		sound = "ophra/ships/flysound5.wav",
		Volume = 3000,
		Pitch = 80,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 40,
		FadeIn = 0,
		FadeOut = 1,
		FadeSpeed = 1.5,
		UseDoppler = true,
	},
}

--addons/laat_g/lua/entities/lvs_repulsorlift_gunship_heavy/cl_drawing.lua:

function ENT:PreDraw()
	self:DrawDriverBTL()

	return true
end

function ENT:PreDrawTranslucent()
	return false
end

function ENT:DrawDriverBTL()
	local pod = self:GetBTPodL()

	if not IsValid( pod ) then return end

	local plyL = LocalPlayer()
	local ply = pod:GetDriver()

	if not IsValid( ply ) or (ply == plyL and plyL:GetViewEntity() == plyL) then return end

	local ID = self:LookupAttachment( "muzzle_ballturret_left" )
	local Muzzle = self:GetAttachment( ID )

	if not Muzzle then return end

	local _,Ang = LocalToWorld( Vector(0,0,0), Angle(-90,0,-90), Muzzle.Pos, Muzzle.Ang )

	ply:SetSequence( "drive_jeep" )
	ply:SetRenderAngles( Ang )
	ply:DrawModel()
end
--addons/laat_g/lua/entities/lvs_repulsorlift_gunship_heavy/sh_gunner2.lua:
function ENT:InitWeaponGunner2()	
	local COLOR_RED = Color(255,0,0,255)
	local COLOR_WHITE = Color(255,255,255,255)

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/hmg.png")
	weapon.Delay = 0.55
	weapon.HeatRateUp = 0.2
	weapon.HeatRateDown = 0.2	
	weapon.Attack = function( ent )
        	if not ent:GetVehicle() then return true end
		local pod = ent:GetDriverSeat()

		if not IsValid( pod ) then return end

		local dir = ent:GetAimVector()
		
		if ent:AngleBetweenNormal( dir, ent:GetForward() ) > 70 then return true end

		local trace = ent:GetEyeTrace()

		local veh = ent:GetVehicle()

		-- veh.SNDTail:PlayOnce( 60 + math.Rand(-3,3), 1 )
		
		local ID2 = self:LookupAttachment( "40mm" )
		local Muzzle2 = self:GetAttachment( ID2 )

		local bullet = {}
		bullet.Src = Muzzle2.Pos
		bullet.Dir = (trace.HitPos - bullet.Src):GetNormalized()	
		bullet.Spread 	= Vector( 0.01,  0.01, 0.01 )
		bullet.TracerName = "lvs_laser_green"
		bullet.Force	= 30
		bullet.HullSize 	= 30
		bullet.Damage	= 300
		bullet.SplashDamage = 100
		bullet.SplashDamageRadius = 400
		bullet.Velocity = 10000
		bullet.Attacker 	= ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo)
			local effectdata = EffectData()
				effectdata:SetStart( Vector(-180,100,75) )
				effectdata:SetOrigin( tr.HitPos )
				effectdata:SetNormal( tr.HitNormal )
				-- util.Effect( "lvs_concussion_explosion", effectdata )
				util.Effect( "lvs_concussion_explosion_large", effectdata )
		end
		ent:LVSFireBullet( bullet )
		ent:EmitSound("lvs/vehicles/laat/fire_large.wav", 100 )
	end
	weapon.OnSelect = function( ent )
		ent:EmitSound("physics/metal/weapon_impact_soft3.wav")
	end
	weapon.OnOverheat = function( ent )
		ent:EmitSound("lvs/overheat.wav")
	end
	weapon.CalcView = function( ent, ply, pos, angles, fov, pod )
		local base = ent:GetVehicle()
		base.ZoomFov = 30

		if not IsValid( base ) then 
			return LVS:CalcView( ent, ply, pos, angles, fov, pod )
		end

		if pod:GetThirdPersonMode() then
			pos = pos + base:GetUp() * 100
		end

		return LVS:CalcView( base, ply, pos, angles, fov, pod )
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local Col = (ent:AngleBetweenNormal( ent:GetAimVector(), ent:GetForward() ) > 70) and COLOR_RED or COLOR_WHITE

		local Pos2D = ent:GetEyeTrace().HitPos:ToScreen() 

		local base = ent:GetVehicle()

		base:LVSPaintHitMarker( Pos2D )

		if not ent:GetDriverSeat():GetThirdPersonMode() then
			local mat = Material( "hud/ac130/40mm.png" )
			surface.SetDrawColor( Col )
			surface.SetMaterial( mat ) 
			surface.DrawTexturedRectRotated( X - 962, Y -542, X , Y , 0 )
		else
			base:PaintCrosshairCenter( Pos2D, Col )
			base:PaintCrosshairOuter( Pos2D, Col )
		end

	end
	self:AddWeapon( weapon, 4 )
end
--addons/lvs_addons/lua/entities/lvs_repulsorlift_gunship_space/cl_init.lua:
include("shared.lua")
include("cl_spotlights.lua")
include("cl_prediction.lua")
include("sh_driverweapons.lua")
include("sh_gunnerweapons.lua")

ENT.EngineGlow = Material("sprites/light_glow02_add")
ENT.EngineColor = Color(255, 255, 255, 10)

ENT.ReactorColor = Color(0, 127, 255)
ENT.ReactorPos = {
	Vector(-270, -20, 265),
	Vector(-270, 20, 265),
}

function ENT:OnSpawn()
	self:RegisterTrail(Vector(-100, 440, 70), 5, 50, 2, 100, 150)
	self:RegisterTrail(Vector(-100, -440, 70), 5, 50, 2, 100, 150)
end

function ENT:OnFrame()
	self:WingTurretProjector()
	self:DrawSpotlights()
	self:PredictPoseParamaters()
    self:Boom()
end

function ENT:Boom()
	if self:GetHP() > 500 then
		self.bommed = false
		self:StopParticles()
	end

	if self.bommed == false then
		if self:GetHP() < 500 then
			ParticleEffectAttach("env_fire_large_smoke", PATTACH_POINT_FOLLOW, self, self:LookupAttachment("R_Heat_Hatch"))
			self.bommed = true

			local effectdata = EffectData()
			effectdata:SetOrigin(self:LocalToWorld(Vector(-300, 0, 180)))
			util.Effect("lvs_explosion_small", effectdata)
		end
	end
end

function ENT:PostDrawTranslucent()
	if not self:GetEngineActive() then return end

	render.SetMaterial(self.EngineGlow)
	local delta = CurTime() - self.ActiveTime
	local max = math.min(15 * ( delta / 1 ), 15)

	local t = 0
	for _, v in pairs(self.ReactorPos) do
		local vOffset = self:LocalToWorld(v)
		local vNormal = -self:GetForward()

		for i = 0, max do
			local vUp = -self:GetUp()
			local ind = i * 2
			local vOffsetTmp = vOffset + vNormal * -2 + vUp * ind + vNormal * ind

			render.DrawSprite(vOffsetTmp, 60, 60, self.ReactorColor)
		end

		t = t + 1
	end
end

function ENT:WingTurretProjector()
	local FireWingTurret = self:GetWingTurretFire()

	if FireWingTurret == self.OldWingTurretFire then return end

	self.OldWingTurretFire = FireWingTurret

	if FireWingTurret then
		local effectdata = EffectData()
		effectdata:SetEntity( self )
		util.Effect( "lfs_fb_wingturret_projector", effectdata )
	end
end

function ENT:CalcViewOverride( ply, pos, angles, fov, pod )
	if pod == self:GetDriverSeat() then

		if pod:GetThirdPersonMode() then
			pos = pos + self:GetUp() * 100, angles, fov
		end

		return pos, angles, fov
	end

	if pod:GetThirdPersonMode() then
		pos = ply:GetShootPos() + pod:GetUp() * 40
	else
		pos = pos + pod:GetUp() * 40
	end

	return pos, angles, fov
end

function ENT:OnStartBoost()
	self:EmitSound( "^laat_bf2/boost_" .. math.random(1, 2) .. ".wav", 85 )
end

function ENT:OnStopBoost()
end

function ENT:OnEngineActiveChanged( Active )
	if Active then
		self:EmitSound("laat_bf2/engine_start.mp3")
		self.ActiveTime = CurTime()
	else
		self:EmitSound("laat_bf2/engine_end.mp3")
		self.StopTime = CurTime()
	end
end


--addons/lvs_addons/lua/entities/lvs_repulsorlift_stap/shared.lua:
-- If there's any bugs feel free to fix them, credit would be nice, but if not it's all gucci :D
ENT.Base = "lvs_base_repulsorlift"

ENT.PrintName = "STAP Speeder"
ENT.Author = "Wolf"
ENT.Information = "CIS STAP Speeder"
ENT.Category = "AOCRP - KUS - Flugobjekte"

ENT.Spawnable			= true
ENT.AdminOnly			= false

ENT.MDL = "models/ace/comm/tessa/droid_stap.mdl"

ENT.AITEAM = 2

ENT.MaxVelocity = 2000
ENT.MaxThrust = 1000

ENT.ThrustVtol = 55
ENT.ThrustRateVtol = 3

ENT.TurnRatePitch = 2
ENT.TurnRateYaw = 2
ENT.TurnRateRoll = 2

ENT.ForceLinearMultiplier = 1

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 1

ENT.MaxHealth = 1200
ENT.MaxShield = 0

function ENT:InitWeapons()
	local weapon = {}
	weapon.Icon = Material("lvs/weapons/dual_mg.png")
	weapon.Delay = 0.15
	weapon.HeatRateUp = 0.5
	weapon.HeatRateDown = 1
	weapon.Attack = function( ent )
		local bullet = {}
		bullet.Dir 	= ent:GetForward()
		bullet.Spread 	= Vector( 0.015,  0.015, 0 )
		bullet.TracerName = "lvs_laser_red"
		bullet.Force	= 10
		bullet.HullSize 	= 25
		bullet.Damage	= 35
		bullet.Velocity = 60000
		bullet.Attacker 	= ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo)
			local effectdata = EffectData()
				effectdata:SetStart( Vector(255,50,50) ) 
				effectdata:SetOrigin( tr.HitPos )
				effectdata:SetNormal( tr.HitNormal )
			util.Effect( "lvs_laser_explosion", effectdata )
		end

		for i = -1,1,2 do
			bullet.Src 	= ent:LocalToWorld( Vector(80, 15.2 * i,23.5) )

			local effectdata = EffectData()
			effectdata:SetStart( Vector(255,50,50) )
			effectdata:SetOrigin( bullet.Src )
			effectdata:SetNormal( ent:GetForward() )
			effectdata:SetEntity( ent )
			util.Effect( "lvs_muzzle_colorable", effectdata )

			ent:LVSFireBullet( bullet )
		end

		ent:TakeAmmo()

		ent.PrimarySND:PlayOnce( 100 + math.cos( CurTime() + ent:EntIndex() * 1337 ) * 5 + math.Rand(-1,1), 1 )
	end
	weapon.OnSelect = function( ent ) ent:EmitSound("physics/metal/weapon_impact_soft3.wav") end
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end
	self:AddWeapon( weapon )
	
	self:AddWeapon( LVS:GetWeaponPreset( "TURBO" ) )
end

ENT.FlyByAdvance = 0.75
ENT.FlyBySound = "lvs/vehicles/naboo_n1_starfighter/flyby.wav" 
ENT.DeathSound = "lvs/vehicles/generic_starfighter/crash.wav"

ENT.EngineSounds = {
	{
		sound = "lvs/vehicles/vulturedroid/loop.wav",
		Pitch = 80,
		PitchMin = 0,
		PitchMax = 255,
		PitchMul = 40,
		FadeIn = 0,
		FadeOut = 1,
		FadeSpeed = 1.5,
		UseDoppler = true,
	},
}
--addons/lvs_addons/lua/entities/lvs_starfighter_eta2/cl_init.lua:
include("shared.lua")

ENT.EngineColor = Color( 0, 180, 255, 255)
ENT.EngineGlow = Material( "sprites/light_glow02_add" )
ENT.EnginePos = {
	Vector(-115.797,-15.056,-18.838),
	Vector(-115.797,15.056,-18.838),
}

function ENT:OnSpawn()
	self:SetPoseParameter("sFoils", 0)
	self:RegisterTrail( Vector(-48.852,104.794,-24.138), 0, 20, 2, 1000, 150 )
	self:RegisterTrail( Vector(-48.852,-104.794,-24.138), 0, 20, 2, 1000, 150 )
end

local ply = nil

function ENT:OnFrame()

	ply = self:GetDriver()

	if IsValid(ply) or self:GetAI() then
		self.canopyState = 0
	else
		self.canopyState = 1
	end
	
	self.canopyLerp = Lerp(0.1, self.canopyLerp or 0, self.canopyState)
	self:SetPoseParameter("cockpitOpen", self.canopyLerp)

	self:EngineEffects()
	self:AnimAstromech()
	self:AnimWings()
end

function ENT:EngineEffects()
	if not self:GetEngineActive() then return end

	local T = CurTime()

	if (self.nextEFX or 0) > T then return end

	self.nextEFX = T + 0.01

	local THR = self:GetThrottle()

	local emitter = self:GetParticleEmitter( self:GetPos() )

	if not IsValid( emitter ) then return end

	for _, pos in pairs( self.EnginePos ) do
		local vOffset = self:LocalToWorld( pos )
		local vNormal = -self:GetForward()

		vOffset = vOffset + vNormal * 5

		local particle = emitter:Add( "effects/muzzleflash2", vOffset )

		if not particle then continue end

		particle:SetVelocity( vNormal * (math.Rand(500,1000) + self:GetBoost() * 10) + self:GetVelocity() )
		particle:SetLifeTime( 0 )
		particle:SetDieTime( 0.1 )
		particle:SetStartAlpha( 255 )
		particle:SetEndAlpha( 0 )
		particle:SetStartSize( math.Rand(20,25) )
		particle:SetEndSize( math.Rand(0,10) )
		particle:SetRoll( math.Rand(-1,1) * 100 )
		particle:SetColor( 50, 180, 255 )
	end
end

function ENT:AnimAstromech()
	local T = CurTime()

	if (self.nextAstro or 0) < T then
		self.nextAstro = T + math.Rand(0.5,2)
		self.AstroAng = 0 - math.Rand(-180,180)

		local HasShield = self:GetShield() > 0

		if self.OldShield == true and not HasShield then
			self:EmitSound( "lvs/vehicles/naboo_n1_starfighter/astromech/shieldsdown"..math.random(1,2)..".ogg",100 )
		else
			if math.random(0,4) == 3 then
				self:EmitSound( "lvs/vehicles/naboo_n1_starfighter/astromech/"..math.random(1,11)..".ogg", 70 )
			end
		end
		
		self.OldShield = HasShield
	end

	self.smastro = self.smastro and (self.smastro + ((self.AstroAng or 0) - self.smastro) * RealFrameTime() * 10) or 0

	self:ManipulateBoneAngles( 4, Angle(self.smastro,0,0) )
end

function ENT:AnimWings()
	self._sm_wing = self._sm_wing or 1

	local target_wing = self:GetFoils() and 0 or 1
	local RFT = RealFrameTime() * (0.5 + math.abs( math.sin( self._sm_wing * math.pi ) ) * 0.5)

	local Rate = RFT * 1

	self._sm_wing = self._sm_wing + math.Clamp(target_wing - self._sm_wing,-Rate,Rate)

	local DoneMoving = self._sm_wing == 1 or self._sm_wing == 0

	if self._oldDoneMoving ~= DoneMoving then
		self._oldDoneMoving = DoneMoving
		if not DoneMoving then
			self:EmitSound("lvs/vehicles/arc170/sfoils.wav")
		end
	end

	if ( self:GetFoils() ) then
		self.foilVar = 0
	else
		self.foilVar = 1
	end
	self.foilLerp = Lerp(0.01, self.foilLerp or 0, self.foilVar)

	self:SetPoseParameter("sFoils", 1-self._sm_wing)

	self:InvalidateBoneCache()
end

function ENT:PostDrawTranslucent()
	if not self:GetEngineActive() then return end

	local Size = 50 + self:GetThrottle() * 120 + self:GetBoost() * 6

	render.SetMaterial( self.EngineGlow )

	for _, pos in pairs( self.EnginePos ) do
		render.DrawSprite(  self:LocalToWorld( pos ), Size, Size, self.EngineColor )
		render.DrawSprite(  self:LocalToWorld( pos ), Size*.4, Size*.4, Color( 255, 255, 255, 120) )
	end
end

function ENT:OnStartBoost()
	self:EmitSound( "lvs/vehicles/arc170/boost.wav", 85 )
end

function ENT:OnStopBoost()
	self:EmitSound( "lvs/vehicles/arc170/brake.wav", 85 )
end

--addons/lvs_addons/lua/entities/lvs_starfighter_wwing/cl_init.lua:
include("shared.lua")

ENT.EngineColor = Color( 255, 220, 150, 255)
ENT.EngineGlow = Material( "sprites/light_glow02_add" )
ENT.EnginePos = {
	Vector(-70,-110,22),
	Vector(-70,110,22),
}

function ENT:CalcViewOverride( ply, pos, angles, fov, pod )
	if self:GetDriver() == ply then
		local newpos = pos + self:GetForward() * 37 + self:GetUp() * 8

		return newpos, angles, fov
	else
		return pos, angles, fov
	end
end

function ENT:OnSpawn()
	self:RegisterTrail( Vector(-75,110,22), 0, 20, 2, 1000, 150 )
	self:RegisterTrail( Vector(-75,-110,22), 0, 20, 2, 1000, 150 )
end

function ENT:OnFrame()
	self:EngineEffects()
end

function ENT:EngineEffects()
	if not self:GetEngineActive() then return end

	local T = CurTime()

	if (self.nextEFX or 0) > T then return end

	self.nextEFX = T + 0.01

	local THR = self:GetThrottle()

	local emitter = self:GetParticleEmitter( self:GetPos() )

	if not IsValid( emitter ) then return end

	for _, pos in pairs( self.EnginePos ) do
		local vOffset = self:LocalToWorld( pos )
		local vNormal = -self:GetForward()

		vOffset = vOffset + vNormal * 5

		local particle = emitter:Add( "effects/muzzleflash2", vOffset )

		if not particle then continue end

		particle:SetVelocity( vNormal * math.Rand(500,1000) + self:GetVelocity() )
		particle:SetLifeTime( 0 )
		particle:SetDieTime( 0.1 )
		particle:SetStartAlpha( 255 )
		particle:SetEndAlpha( 0 )
		particle:SetStartSize( math.Rand(15,25) )
		particle:SetEndSize( math.Rand(0,10) )
		particle:SetRoll( math.Rand(-1,1) * 100 )
		particle:SetColor( 255, 200, 50 )
	end
end

function ENT:PostDrawTranslucent()
	if not self:GetEngineActive() then return end

	local Size = 60 + self:GetThrottle() * 60 + self:GetBoost()

	render.SetMaterial( self.EngineGlow )

	for _, pos in pairs( self.EnginePos ) do
		render.DrawSprite(  self:LocalToWorld( pos ), Size, Size, self.EngineColor )
	end
end

function ENT:OnStartBoost()
	self:EmitSound( "lvs/vehicles/vwing/boost.wav", 85 )
end

function ENT:OnStopBoost()
	self:EmitSound( "lvs/vehicles/vwing/brake.wav", 85 )
end

--addons/lvs_addons/lua/entities/lvs_starfighterinterceptor_swtor/cl_init.lua:
include("shared.lua")

function ENT:OnSpawn()
	self:RegisterTrail( Vector(-151,87,15), 0, 20, 2, 1000, 150 )
	self:RegisterTrail( Vector(-151,-87,15), 0, 20, 2, 1000, 150 )
	self:RegisterTrail( Vector(-151,87,-15), 0, 20, 2, 1000, 150 )
	self:RegisterTrail( Vector(-151,-87,-15), 0, 20, 2, 1000, 150 )
end
 
-- Engine Particles start

ENT.EngineColor = Color( 255, 0, 0)
ENT.EngineGlow = Material( "sprites/light_glow02_add" )
ENT.EnginePos = {
	Vector(-116.72,-31.53,21.1),
	Vector(-116.72,31.53,21.1),
}

function ENT:OnSpawn()
	self:RegisterTrail( Vector(-34,326,-13), 0, 20, 2, 1000, 150 )
	self:RegisterTrail( Vector(-34,-326,-13), 0, 20, 2, 1000, 150 )
end

function ENT:EngineEffects()
	if not self:GetEngineActive() then return end

	local T = CurTime()

	if (self.nextEFX or 0) > T then return end

	self.nextEFX = T + 0.01

	local THR = self:GetThrottle()

	local emitter = self:GetParticleEmitter( self:GetPos() )

	if not IsValid( emitter ) then return end

	for _, pos in pairs( self.EnginePos ) do
		local vOffset = self:LocalToWorld( pos )
		local vNormal = -self:GetForward()

		vOffset = vOffset + vNormal * 5

		local particle = emitter:Add( "effects/muzzleflash2", vOffset )

		if not particle then continue end

		particle:SetVelocity( vNormal * (math.Rand(500,1000) + self:GetBoost() * 10) + self:GetVelocity() )
		particle:SetLifeTime( 0 )
		particle:SetDieTime( 0.1 )
		particle:SetStartAlpha( 255 )
		particle:SetEndAlpha( 0 )
		particle:SetStartSize( math.Rand(15,25) )
		particle:SetEndSize( math.Rand(0,10) )
		particle:SetRoll( math.Rand(-1,1) * 100 )
		particle:SetColor( 255, 0, 0)
	end
end

function ENT:OnFrame()
	self:EngineEffects()
end


-- Engine Particles End

function ENT:PostDraw()
	if not self:GetEngineActive() then return end
 
 
end

 

function ENT:OnStartBoost()
	self:EmitSound( "ophra/ships/powerstart3.wav", 85 )
end

function ENT:OnStopBoost()
	self:EmitSound( "ophra/ships/shutdown.wav", 85 )
end


--addons/lvs_addons/lua/entities/lvs_turret_ai/cl_init.lua:
include("shared.lua")

function ENT:CalcViewOverride( ply, pos, angles, fov, pod )

	if self:GetGunnerSeat() == ply:GetVehicle() then
		if pod:GetThirdPersonMode() then
			return pos + self:GetUp() * 100, angles, fov
		end
	end

	return pos, angles, fov
end

function ENT:OnSpawn()
end

function ENT:OnFrame()
end

function ENT:PostDrawTranslucent()
end

function ENT:EngineEffects()
end

function ENT:AnimGunner()
end

function ENT:AnimAstromech()
end

function ENT:AnimCockpit()
end

function ENT:OnStartBoost()
end

function ENT:OnStopBoost()
end

--addons/lvs_addons/lua/entities/lvs_turret_ai/shared.lua:
ENT.Base = "lvs_base_turret"

ENT.PrintName = "Anti-Infantry Turret"
ENT.Author = "Luna"
ENT.Information = "Infantry Problem? Rotary laser cannon says 'Not Anymore.'"
ENT.Category = "[LVS] - Turrets (Republic)"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/antiinfantryturret/Anti-InfantryTurret.mdl"

ENT.AITEAM = 2

ENT.MaxVelocity = 3000
ENT.MaxThrust = 3000

ENT.ThrustVtol = 55
ENT.ThrustRateVtol = 3

ENT.TurnRatePitch = 1
ENT.TurnRateYaw = 1
ENT.TurnRateRoll = 1

ENT.ForceLinearMultiplier = 1

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 1

ENT.LAATC_PICKUPABLE = true
ENT.LAATC_DROP_IN_AIR = true
ENT.LAATC_PICKUP_POS = Vector(-200,0,25)
ENT.LAATC_PICKUP_Angle = Angle(0,0,0)

ENT.MaxHealth = 4800

function ENT:OnSetupDataTables()
	self:AddDT( "Bool", "IsCarried" )
	self:AddDT( "Entity", "GunnerSeat" )
	self:AddDT( "Float", "TurretPitch" )
	self:AddDT( "Float", "TurretYaw" )

	if SERVER then
		self:NetworkVarNotify( "IsCarried", self.OnIsCarried )
	end
end

function ENT:TraceTurret()
	local ID = self:LookupAttachment( "muzzle" )
	local Muzzle = self:GetAttachment( ID )

	if not Muzzle then return end

	local dir = Muzzle.Ang:Up()
	local pos = Muzzle.Pos

	local trace = util.TraceLine( {
		start = pos,
		endpos = (pos + dir * 50000),
	} )

	return trace
end

function ENT:GetAimAngles( ent )
    local trace = ent:GetEyeTrace()
    local AimAngles = self:WorldToLocalAngles( (trace.HitPos - self:LocalToWorld( Vector(0,0,60) ) ):GetNormalized():Angle() )

    return AimAngles
end

function ENT:WeaponsInRange( ent )
    local AimAngles = self:GetAimAngles( ent )

    return not (AimAngles.p >= 19 or AimAngles.p <= -24)
end

function ENT:InitWeapons()
	local weapon = {}
    weapon.Icon = Material("lvs/weapons/mg.png")
    weapon.Delay = 0.08
    weapon.HeatRateUp = .2
    weapon.HeatRateDown = .3
    weapon.Attack = function( ent )
        if not ent:GetVehicle():WeaponsInRange( ent ) then return true end
		local base = ent:GetVehicle()

		local ID = self:LookupAttachment( "muzzle" )
		local Muzzle = self:GetAttachment( ID )

		if not Muzzle then return end	

		local Pos = Muzzle.Pos
		local Dir = Muzzle.Ang:Up()

		local bullet = {}
		bullet.Src 	= Pos
		bullet.Dir 	= Dir
		bullet.Spread 	= Vector( 0.015,  0.015, 0.015 )
		bullet.TracerName = "lvs_laser_blue_short"
		bullet.Force	= 10
		bullet.HullSize 	= 25
		bullet.Damage	= 20
		bullet.Velocity = 20000
		bullet.Attacker 	= ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo)
			local effectdata = EffectData()
				effectdata:SetStart( Vector(50,50,255) ) 
				effectdata:SetOrigin( tr.HitPos )
				effectdata:SetNormal( tr.HitNormal )
			util.Effect( "lvs_laser_impact", effectdata )
		end

		local effectdata = EffectData()
		effectdata:SetStart( Vector(50,50,255) )
		effectdata:SetOrigin( bullet.Src )
		effectdata:SetNormal( Dir )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle_colorable", effectdata )

		base.PrimarySND:PlayOnce( 100 + math.Rand(-3,3), 1 )
		ent:LVSFireBullet( bullet )
		
	end
	weapon.OnSelect = function( ent ) ent:EmitSound("physics/metal/weapon_impact_soft3.wav")end
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end
	weapon.OnThink = function( ent, active )	
		if ent:GetVehicle():GetIsCarried( ent ) then
			self:SetPoseParameter("turret_pitch", 0 )
			self:SetPoseParameter("turret_yaw", 0 )
		end
		
		local AimAngles = self:GetAimAngles( ent )

		self:SetPoseParameter("turret_pitch", AimAngles.p )
		self:SetPoseParameter("turret_yaw", AimAngles.y )
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		local Pos2D = base:TraceTurret().HitPos:ToScreen()

		base:PaintCrosshairCenter( Pos2D, color_white )
		base:PaintCrosshairOuter( Pos2D, color_white )
		base:LVSPaintHitMarker( Pos2D )
	end
	self:AddWeapon( weapon, 2 )
end

ENT.DeathSound = "lvs/vehicles/generic_starfighter/crash.wav"
--addons/lvs_addons/lua/entities/lvs_walker_atte/cl_prediction.lua:

function ENT:PredictPoseParamaters()
	local pod = self:GetTurretSeat()

	if not IsValid( pod ) then return end

	local plyL = LocalPlayer()
	local ply = pod:GetDriver()

	if ply ~= plyL then return end

	self:SetPosTurret()
	self:SetPoseParameterTurret( pod:lvsGetWeapon() )
end

--addons/lvs_addons/lua/entities/lvs_walker_atte_hoverscript/shared.lua:

ENT.Base = "lvs_base"

ENT.PrintName = "[LVS] Generic Hover"
ENT.Author = "Luna"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS]"

ENT.ForceLinearMultiplier = 1

ENT.ForceAngleMultiplier = 1
ENT.ForceAngleDampingMultiplier = 1

ENT.HoverHeight = 140
ENT.HoverTraceLength = 200
ENT.HoverHullRadius = 20

ENT.HoverCollisionFilter = {
	[COLLISION_GROUP_DEBRIS] = true,
	[COLLISION_GROUP_DEBRIS_TRIGGER] = true,
	[COLLISION_GROUP_PLAYER] = true,
	[COLLISION_GROUP_WEAPON] = true,
	[COLLISION_GROUP_VEHICLE_CLIP] = true,
	[COLLISION_GROUP_WORLD] = true,
}

ENT.DisableBallistics = true

function ENT:SetupDataTables()
	self:CreateBaseDT()
end

function ENT:GetCrosshairFilterLookup()
	if self._EntityLookUp then return self._EntityLookUp end

	self._EntityLookUp = {}

	for _, ent in pairs( self:GetCrosshairFilterEnts() ) do
		self._EntityLookUp[ ent:EntIndex() ] = true
	end

	return self._EntityLookUp
end

function ENT:GetVehicleType()
	return "walker"
end
--addons/joes_stuff/lua/entities/shield_base/cl_init.lua:
include('shared.lua')

function ENT:Initialize()
	self.laserend = nil
	SWRPShield.ents[self] = true
end

function ENT:Draw()
	self:DrawModel()
end

function ENT:OnRemove()
	SWRPShield.ents[self] = nil
end
--addons/sse_101/lua/entities/sse_box_heal.lua:
AddCSLuaFile()


ENT.Base = "sse_base"
ENT.PrintName		= "Healbox"
ENT.Spawnable       = true
ENT.ConfigName = "Healbox"
ENT.Category        = "SSE"
if SERVER then
        

    function ENT:Use( activator, caller )

        activator:SetHealth(activator:GetMaxHealth())
        activator:SetArmor(activator:GetMaxArmor())

    end


end


--addons/sse_101/lua/entities/sse_heal_canister.lua:
AddCSLuaFile()

ENT.Base = "sse_base"

ENT.PrintName		= "Bacta Canister"
ENT.Spawnable       = true
ENT.Editable = true
ENT.ConfigName = "HealCanister"
ENT.Category        = "SSE"
function ENT:SetupDataTables()

 
    self:NetworkVar( "Float",	0, "HealContent",	{ KeyName = "healcontent",	Edit = { type = "Float",		order = 1, min = 0, max = 1000000 } } )

    if SERVER then
        self:SetHealContent(self:ConfigValue("DefaultHealth"))
    end

end

if SERVER then
        

    local lastUseTime = 0

    function ENT:Use( activator, caller )

        if IsValid(activator) and activator:IsPlayer() then
            local currentTime = CurTime()
            if currentTime - lastUseTime >= self:ConfigValue("Delay") then
                lastUseTime = currentTime

                local healAmount = self:ConfigValue("AddHealth")
                if self:GetHealContent() > 0 then
                    local maxHealth = activator:GetMaxHealth()
                    local currentHealth = activator:Health()
                    local newHealth = math.min(currentHealth + healAmount, maxHealth)
                    if newHealth > currentHealth then
                        self:SetHealContent(self:GetHealContent() - healAmount)
                        if self:GetHealContent() <= 0 then
                            self:Remove()
                        end
                        activator:SetHealth(newHealth)
                        self:EmitSound(self:ConfigValue("Sound") )
                    end
                end
            end
        end
    end



end


--addons/sse_101/lua/entities/sse_weapondrop.lua:
AddCSLuaFile()


ENT.Base = "sse_base"
ENT.PrintName		= "Weapondrop"
ENT.Spawnable       = true
ENT.Editable = true
ENT.ConfigName = "WeaponDrop"
ENT.Category        = "SSE"
function ENT:SetupDataTables()

    self:NetworkVar( "String", 0, "WeaponClass", { KeyName = "WeaponClass",	Edit = { type = "Text"  } } ) 


    if SERVER then
        self:SetWeaponClass("weapon_crowbar")
    end

end

if SERVER then
    
    function ENT:Use( activator, caller )
       
        if activator:HasWeapon(self:GetWeaponClass()) then 
            activator:StripWeapon(self:GetWeaponClass())
        else 
            activator:Give(self:GetWeaponClass())
            activator:SelectWeapon(self:GetWeaponClass())
        end
    end

end


--addons/aoc_nextbots/lua/entities/summe_boarding_pod_landed/cl_init.lua:
include('shared.lua')

function ENT:Draw()
    self:DrawModel()
end
--addons/arccw_weapons/lua/entities/tfbow_arrow/cl_init.lua:

-- Copyright (c) 2018-2020 TFA Base Devs

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

include("shared.lua")
local cv_ht = GetConVar("host_timescale")

function ENT:Draw()
	local ang, tmpang
	tmpang = self:GetAngles()
	ang = tmpang

	if not self.roll then
		self.roll = 0
	end

	local phobj = self:GetPhysicsObject()

	if IsValid(phobj) then
		self.roll = self.roll + phobj:GetVelocity():Length() / 3600 * cv_ht:GetFloat()
	end

	ang:RotateAroundAxis(ang:Forward(), self.roll)
	self:SetAngles(ang)
	self:DrawModel() -- Draw the model.
	self:SetAngles(tmpang)
end

--addons/arccw_weapons/lua/entities/tfbow_arrow_stuck/cl_init.lua:

-- Copyright (c) 2018-2020 TFA Base Devs

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

include("shared.lua")

function ENT:Draw()
	self:DrawModel() -- Draw the model.
end

--addons/arccw_weapons/lua/entities/tfbow_arrow_stuck/shared.lua:

-- Copyright (c) 2018-2020 TFA Base Devs

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

ENT.Type = "anim"
ENT.PrintName = "TFBow Arrow Stuck"
ENT.Author = "TheForgottenArchitect"
ENT.Contact = "Don't"
ENT.Purpose = "Arrow Entity"
ENT.Instructions = "Arrow that's stuck in ground"

local cv_al = GetConVar("sv_tfa_arrow_lifetime")

function ENT:Initialize()
	if SERVER then
		if cv_al:GetInt() ~= -1 then
			timer.Simple( cv_al:GetFloat(), function()
				if IsValid(self) then
					self:Remove()
				end
			end)
		end

		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		local phys = self:GetPhysicsObject()

		if (phys:IsValid()) then
			phys:Wake()
			phys:SetMass(2)
		end

		if IsValid(self) and self.SetUseType then
			self:SetUseType(SIMPLE_USE)
		end
	end

	if (self:GetModel() and self:GetModel() == "") then
		self:SetModel("models/weapons/w_tfa_arrow.mdl")
	end

	self:SetOwner(nil)
	self.PhysicsCollide = function() end
	self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	local phys = self:GetPhysicsObject()

	if (phys:IsValid()) then
		phys:Sleep()
	end
end

function ENT:Use(activator, caller)
	if activator:IsPlayer() and activator:GetWeapon(self.gun) then
		activator:GiveAmmo(1, activator:GetWeapon(self.gun):GetPrimaryAmmoType(), false)
		self:Remove()
	end
end

--addons/aocrp_emplacements/lua/entities/turret_40mm_frag/shared.lua:
 ENT.Type 			= "anim"  
 ENT.Base 			= "base_gmodentity"     
 ENT.PrintName			= "40mm High Explosive"  
 ENT.Author			= "Generic Default"  
 ENT.Contact			= "AIDS"  
 ENT.Purpose			= "SPLODE"  
 ENT.Instructions		= "SHOOT"  
 
ENT.Spawnable			= false
ENT.AdminSpawnable		= false


--addons/tools/lua/entities/vanilla_modelship2/cl_init.lua:
include("shared.lua")
function ENT:Draw()
    self:DrawModel()
end

--addons/arccw_weapons/lua/effects/arccw_apex_muzzle_energy_big/init.lua:
local ang

EFFECT.ParticleName = "tfa_apex_energy_muzzle_big"

function EFFECT:Init(data)
    self.WeaponEnt = data:GetEntity()
    if not IsValid(self.WeaponEnt) then return end
    self.Attachment = data:GetAttachment() or 1
    self.Position = self:GetTracerShootPos(data:GetOrigin(), self.WeaponEnt, self.Attachment)

    if IsValid(self.WeaponEnt.Owner) then
        if self.WeaponEnt.Owner == LocalPlayer() then
            if not self.WeaponEnt:IsFirstPerson() then
                ang = self.WeaponEnt.Owner:EyeAngles()
                ang:Normalize()
                --ang.p = math.max(math.min(ang.p,55),-55)
                self.Forward = ang:Forward()
            else
                self.WeaponEnt = self.WeaponEnt.Owner:GetViewModel()
            end
            --ang.p = math.max(math.min(ang.p,55),-55)
        else
            ang = self.WeaponEnt.Owner:EyeAngles()
            ang:Normalize()
            self.Forward = ang:Forward()
        end
    end

    self.Forward = self.Forward or data:GetNormal()
    self.Angle = self.Forward:Angle()

    local dlight = DynamicLight(self.WeaponEnt:EntIndex())
    if (dlight) then
        dlight.pos = self.Position + self.Angle:Up() * 3 + self.Angle:Right() * -2
        dlight.r = 85
        dlight.g = 178
        dlight.b = 255
        dlight.brightness = 5
        dlight.Size = math.Rand(32, 64)
        dlight.Decay = math.Rand(32, 64) / 0.05
        dlight.DieTime = CurTime() + 0.05
    end

    self.Right = self.Angle:Right()
    self.vOffset = self.Position
    dir = self.Forward

    ParticleEffectAttach( self.ParticleName, PATTACH_POINT_FOLLOW, self.WeaponEnt, self.Attachment)
end

function EFFECT:Think()
    return false
end

function EFFECT:Render()
end

--addons/arccw_weapons/lua/effects/arccw_apex_muzzle_sniper/init.lua:
local ang

EFFECT.ParticleName = "tfa_apex_muzzle_sniper"

function EFFECT:Init(data)
    self.WeaponEnt = data:GetEntity()
    if not IsValid(self.WeaponEnt) then return end
    self.Attachment = data:GetAttachment() or 1
    self.Position = self:GetTracerShootPos(data:GetOrigin(), self.WeaponEnt, self.Attachment)

    if IsValid(self.WeaponEnt.Owner) then
        if self.WeaponEnt.Owner == LocalPlayer() then
            if not self.WeaponEnt:IsFirstPerson() then
                ang = self.WeaponEnt.Owner:EyeAngles()
                ang:Normalize()
                --ang.p = math.max(math.min(ang.p,55),-55)
                self.Forward = ang:Forward()
            else
                self.WeaponEnt = self.WeaponEnt.Owner:GetViewModel()
            end
            --ang.p = math.max(math.min(ang.p,55),-55)
        else
            ang = self.WeaponEnt.Owner:EyeAngles()
            ang:Normalize()
            self.Forward = ang:Forward()
        end
    end

    self.Forward = self.Forward or data:GetNormal()
    self.Angle = self.Forward:Angle()
        
    local dlight = DynamicLight(self.WeaponEnt:EntIndex())
    if (dlight) then
        dlight.pos = self.Position + self.Angle:Up() * 3 + self.Angle:Right() * -2
        dlight.r = 255
        dlight.g = 192
        dlight.b = 64
        dlight.brightness = 5
        dlight.Size = math.Rand(32, 64)
        dlight.Decay = math.Rand(32, 64) / 0.05
        dlight.DieTime = CurTime() + 0.05
    end
    
    self.Right = self.Angle:Right()
    self.vOffset = self.Position
    dir = self.Forward

    ParticleEffectAttach( self.ParticleName, PATTACH_POINT_FOLLOW, self.WeaponEnt, self.Attachment)
end

function EFFECT:Think()
    return false
end

function EFFECT:Render()
end

--addons/arccw_weapons/lua/effects/arccw_apex_tracer_pistol/init.lua:
EFFECT.TracerName = "tfa_apex_tracer_pistol"

function EFFECT:Init(data)
    self.WeaponEnt = data:GetEntity()
    --print(self.ParticleName)
    if not IsValid(self.WeaponEnt) then return end
    self.Attachment = data:GetAttachment() or 1
    self.Position = self:GetTracerShootPos(data:GetStart(), self.WeaponEnt, self.Attachment)

    if IsValid(self.WeaponEnt.Owner) then
        if self.WeaponEnt.Owner == LocalPlayer() then
            if not self.WeaponEnt.Owner:GetViewEntity() then
                ang = self.WeaponEnt.Owner:EyeAngles()
                ang:Normalize()
                --ang.p = math.max(math.min(ang.p,55),-55)
                self.Forward = ang:Forward()
            else
                self.WeaponEnt = self.WeaponEnt.Owner:GetViewModel()
            end
            --ang.p = math.max(math.min(ang.p,55),-55)
        else
            ang = self.WeaponEnt.Owner:EyeAngles()
            ang:Normalize()
            self.Forward = ang:Forward()
        end
    end

    self.EndPos = data:GetOrigin()
    -- util.ParticleTracerEx(self.ParticleName, self.StartPos, self.EndPos, false, self:EntIndex(), self.Attachment)
    local pcf = CreateParticleSystem(self.WeaponEnt, self.TracerName, PATTACH_POINT, self.Attachment)
    if IsValid(pcf) then
        pcf:SetControlPoint(0,self.Position)
        pcf:SetControlPoint(1,self.EndPos)
        pcf:StartEmission()
    end
    timer.Simple(5.0, function()
        if IsValid(pcf) then
            pcf:StopEmissionAndDestroyImmediately()
        end
    end)
end

function EFFECT:Think()
    return false
end

function EFFECT:Render()
    if self.InValid then return false end
end
--addons/arccw_weapons/lua/effects/effect_astw2_halo2_tracer_beam/init.lua:
EFFECT.InValid = false
EFFECT.ParticleName = "astw2_halo_2_sentinel_beam_tracer"
--Thank you, GoodFishman for allowing me to steal this (Whilst stealing it from ArcCW yourself) <3

function EFFECT:Init(data)
	self.WeaponEnt = data:GetEntity()
	--print(self.ParticleName)
	if !IsValid(self.WeaponEnt) or !IsValid(self) then return end
	if not IsValid(self.WeaponEnt) then return end
	
	if (self.WeaponEnt.Akimbo) then
		self.Attachment = 1 + (game.SinglePlayer() and self.WeaponEnt:GetNW2Int("AnimCycle") or self.WeaponEnt.AnimCycle)
	else
		self.Attachment = data:GetAttachment()
	end
	
	self.Position = self:GetTracerShootPos(data:GetStart(), self.WeaponEnt, self.Attachment)

	if IsValid(self.WeaponEnt.Owner) then
		if self.WeaponEnt.Owner == LocalPlayer() then
			if not self.WeaponEnt.Owner:GetViewEntity() then
				ang = self.WeaponEnt.Owner:EyeAngles()
				ang:Normalize()
				--ang.p = math.max(math.min(ang.p,55),-55)
				self.Forward = ang:Forward()
			else
				-- self.WeaponEnt = self.WeaponEnt.Owner:GetViewModel()
			end
			--ang.p = math.max(math.min(ang.p,55),-55)
		else
			ang = self.WeaponEnt.Owner:EyeAngles()
			ang:Normalize()
			self.Forward = ang:Forward()
		end
	end

	self.EndPos = data:GetOrigin()
	--util.ParticleTracerEx(self.ParticleName, self.StartPos, self.EndPos, false, self:EntIndex(), self.Attachment)
	local pcf = CreateParticleSystem(self.WeaponEnt, self.ParticleName, PATTACH_POINT, self.Attachment)
	if IsValid(pcf) then
		pcf:SetControlPoint(0,self.Position)
		pcf:SetControlPoint(1,self.EndPos)
		pcf:StartEmission()
	end
	timer.Simple(3.0, function()
		if IsValid(pcf) then
			pcf:StopEmissionAndDestroyImmediately()
		end
	end)
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
	if self.InValid then return false end
end
--addons/arccw_weapons/lua/effects/effect_astw2_halo2_tracer_carbine/init.lua:

local Tracer = Material( "effects/halo2/plasma_cannon_contrail" )
local Tracer2  = Material( "effects/halo2/plasma_contrail" )
local Width = 10
local Width2 = 15


function EFFECT:Init( data )

	self.Position = data:GetStart()
	self.EndPos = data:GetOrigin()
	self.WeaponEnt = data:GetEntity()
	self.Attachment = data:GetAttachment()
	self.StartPos = self:GetTracerShootPos( self.Position, self.WeaponEnt, self.Attachment )
	self:SetRenderBoundsWS( self.StartPos, self.EndPos )

	self.Dir = ( self.EndPos - self.StartPos ):GetNormalized()
	self.Dist = self.StartPos:Distance( self.EndPos )
	
	self.LifeTime = 0.15
	self.LifeTime2 = 0.25
	self.DieTime = CurTime() + self.LifeTime
	self.DieTime2 = CurTime() + self.LifeTime2

end

function EFFECT:Think()

	if ( CurTime() > self.DieTime ) then return false end
	return true

end

function EFFECT:Render()

	local r = 255
	local g = 255
	local b = 255
	
	local v = ( self.DieTime - CurTime() ) / self.LifeTime
	
	local v2 = ( self.DieTime2 - CurTime() ) / self.LifeTime2

	render.SetMaterial( Tracer )
	render.DrawBeam( self.StartPos, self.EndPos, (v * Width)*3/2, 0, (self.Dist/10)*math.Rand(-2,2), Color( 225, 255, 155, v * 155 ) )
	
	render.SetMaterial( Tracer2 )
	render.DrawBeam( self.StartPos, self.EndPos, (v2 * Width2)*2/3, 0, (self.Dist/10)*math.Rand(-2,2), Color( 225, 255, 155, (v2 * 100)*3/2.5 ) )

end
--addons/arccw_weapons/lua/effects/effect_astw2_halo3_tracer_br/init.lua:

TRACER_FLAG_USEATTACHMENT	= 0x0002;
SOUND_FROM_WORLD			= 0;
CHAN_STATIC					= 6;

EFFECT.Speed				= 4000;
EFFECT.Length				= -256;
//EFFECT.WhizSound			= Sound( "nomad/whiz.wav" );		-- by Robinhood76 (http:--www.freesound.org/people/Robinhood76/sounds/96556/)
EFFECT.WhizDistance			= 72;

local MaterialMain			= Material( "effects/halo3/trail_ar" );
local MaterialFront			= Material( "effects/halo3/8pt_ringed_star_flare" );

function EFFECT:GetTracerOrigin( data )

	-- this is almost a direct port of GetTracerOrigin in fx_tracer.cpp
	local start = data:GetStart();
	
	-- use attachment?
	if( bit.band( data:GetFlags(), TRACER_FLAG_USEATTACHMENT ) == TRACER_FLAG_USEATTACHMENT ) then

		local entity = data:GetEntity();
		
		if( not IsValid( entity ) ) then return start; end
		if( not game.SinglePlayer() and entity:IsEFlagSet( EFL_DORMANT ) ) then return start; end
		
		if( entity:IsWeapon() and entity:IsCarriedByLocalPlayer() ) then
			-- can't be done, can't call the real function
			-- local origin = weapon:GetTracerOrigin();
			-- if( origin ) then
			-- 	return origin, angle, entity;
			-- end
			
			-- use the view model
			local pl = entity:GetOwner();
			if( IsValid( pl ) ) then
				local vm = pl:GetViewModel();
				if( IsValid( vm ) and not LocalPlayer():ShouldDrawLocalPlayer() ) then
					entity = vm;
				else
					-- HACK: fix the model in multiplayer
					if( entity.WorldModel ) then
						entity:SetModel( entity.WorldModel );
					end
				end
			end
		end

		local attachment = entity:GetAttachment( data:GetAttachment() );
		if( attachment ) then
			start = attachment.Pos;
		end

	end
	
	return start;

end


function EFFECT:Init( data )

	self.StartPos = self:GetTracerOrigin( data );
	self.EndPos = data:GetOrigin();
	
	self.Entity:SetRenderBoundsWS( self.StartPos, self.EndPos );

	local diff = ( self.EndPos - self.StartPos );
	
	self.Normal = diff:GetNormal();
	self.StartTime = 0;
	self.LifeTime = ( diff:Length() + self.Length ) / self.Speed;
	
	-- whiz by sound
	local weapon = data:GetEntity();
	if( IsValid( weapon ) and ( not weapon:IsWeapon() or not weapon:IsCarriedByLocalPlayer() ) ) then

		local dist, pos, time = util.DistanceToLine( self.StartPos, self.EndPos, EyePos() );
	end

end


function EFFECT:Think()

	self.LifeTime = self.LifeTime - FrameTime();
	self.StartTime = self.StartTime + FrameTime(); 

	return self.LifeTime > 0;

end


function EFFECT:Render()

	local endDistance = self.Speed * self.StartTime;
	local startDistance = endDistance - self.Length;
	
	startDistance = math.max( 0, startDistance );
	endDistance = math.max( 0, endDistance );

	local startPos = self.StartPos + self.Normal * startDistance;
	local endPos = self.StartPos + self.Normal * endDistance;
	
	render.SetMaterial( MaterialFront );
	render.DrawSprite( endPos, 0, 0, color_white );

	render.SetMaterial( MaterialMain );
	render.DrawBeam( startPos, endPos, 3, 0, 1, color_white );
	
end

--addons/arccw_weapons/lua/effects/effect_astw2_halo_ce_impact_turret_covenant/init.lua:
EFFECT.Duration			= 0.25;
EFFECT.Size				= 48;

local MaterialGlow		= Material( "effects/halo_ce/flare_pr_overcharge" );

function EFFECT:Init( data )

	self.Position = data:GetOrigin();
	self.Normal = data:GetNormal();
	self.LifeTime = self.Duration;

	-- particles
	local emitter = ParticleEmitter( self.Position );
	if( emitter ) then
		
		for i = 1, 1 do

			local particle = emitter:Add( "effects/halo_ce/flare_generic2", self.Position + self.Normal * 2 );
			particle:SetVelocity( ( self.Normal + Vector(math.Rand(3, 5),math.Rand(3, 5),1) * 0.75 ):GetNormal() * math.Rand( 75, 125 ) );
			particle:SetDieTime( math.Rand( 0.05, 0.15 ) );
			particle:SetStartAlpha( 255 );
			particle:SetEndAlpha( 0 );
			particle:SetStartSize( math.Rand( 3, 5 ) );
			particle:SetEndSize( 30 );
			particle:SetRoll( math.Rand(-55, 85) );
			particle:SetGravity( Vector( 0, 0, 0 ) );
			particle:SetColor(255, 200, 240);
			particle:SetCollide( true );
			particle:SetBounce( 0 );
			particle:SetAirResistance( 500 );

		end
		
		for i = 1, 1 do

			local particle = emitter:Add( "effects/halo_ce/light_ring_expand", self.Position + self.Normal * 2 );
			particle:SetVelocity( ( self.Normal + Vector(math.Rand(3, 5),math.Rand(3, 5),1) * 0.75 ):GetNormal() * math.Rand( 75, 125 ) );
			particle:SetDieTime( math.Rand( 0.2, 0.3 ) );
			particle:SetStartAlpha( 155 );
			particle:SetEndAlpha( 0 );
			particle:SetStartSize( math.Rand( 3, 5 ) );
			particle:SetEndSize( 45 );
			particle:SetRoll( math.Rand(-55, 85) );
			particle:SetGravity( Vector( 0, 0, 0 ) );
			particle:SetColor(255, 175, 225);
			particle:SetCollide( true );
			particle:SetBounce( 0 );
			particle:SetAirResistance( 500 );

		end

		
	for i = 1, 1 do

			local particle = emitter:Add( "effects/halo_ce/light_ring_expand", self.Position + self.Normal * 2 );
			particle:SetVelocity( ( self.Normal + Vector(math.Rand(3, 5),math.Rand(3, 5),1) * 0.75 ):GetNormal() * math.Rand( 75, 125 ) );
			particle:SetDieTime( math.Rand( 0.1, 0.2 ) );
			particle:SetStartAlpha( 255 );
			particle:SetEndAlpha( 0 );
			particle:SetStartSize( math.Rand( 3, 5 ) );
			particle:SetEndSize( 55 );
			particle:SetRoll( math.Rand(-55, 85) );
			particle:SetGravity( Vector( 0, 0, 0 ) );
			particle:SetColor(255, 200, 240);
			particle:SetCollide( true );
			particle:SetBounce( 0 );
			particle:SetAirResistance( 500 );

		end
		emitter:Finish();
	end
	end


function EFFECT:Think()

	self.LifeTime = self.LifeTime - FrameTime();
	return self.LifeTime > 0;

end


function EFFECT:Render()

	local frac = math.max( 0, self.LifeTime / self.Duration );
	local rgb = 255 * frac;
	local color = Color( 255, 135, 230, 255 );

	render.SetMaterial( MaterialGlow );
	render.DrawQuadEasy( self.Position + self.Normal, self.Normal, self.Size, self.Size, color );

end

--addons/arccw_weapons/lua/effects/effect_astw2_halo_spv3_tracer_plasma_pistol/init.lua:

TRACER_FLAG_USEATTACHMENT	= 0x0002;
SOUND_FROM_WORLD			= 0;
CHAN_STATIC					= 6;

EFFECT.Speed				= 1800;
EFFECT.Length				= 75;
//EFFECT.WhizSound			= Sound( "nomad/whiz.wav" );		-- by Robinhood76 (http:--www.freesound.org/people/Robinhood76/sounds/96556/)
EFFECT.WhizDistance			= 72;

local MaterialMain			= Material( "effects/halo_spv3/flash/muzzle_flash/muzzle_flash_pp_side" );
local MaterialFront			= Material( "effects/halo_spv3/flash/smg_new" );

function EFFECT:GetTracerOrigin( data )

	-- this is almost a direct port of GetTracerOrigin in fx_tracer.cpp
	local start = data:GetStart();
	
	-- use attachment?
	if( bit.band( data:GetFlags(), TRACER_FLAG_USEATTACHMENT ) == TRACER_FLAG_USEATTACHMENT ) then

		local entity = data:GetEntity();
		
		if( not IsValid( entity ) ) then return start; end
		if( not game.SinglePlayer() and entity:IsEFlagSet( EFL_DORMANT ) ) then return start; end
		
		if( entity:IsWeapon() and entity:IsCarriedByLocalPlayer() ) then
			-- can't be done, can't call the real function
			-- local origin = weapon:GetTracerOrigin();
			-- if( origin ) then
			-- 	return origin, angle, entity;
			-- end
			
			-- use the view model
			local pl = entity:GetOwner();
			if( IsValid( pl ) ) then
				local vm = pl:GetViewModel();
				if( IsValid( vm ) and not LocalPlayer():ShouldDrawLocalPlayer() ) then
					entity = vm;
				else
					-- HACK: fix the model in multiplayer
					if( entity.WorldModel ) then
						entity:SetModel( entity.WorldModel );
					end
				end
			end
		end

		local attachment = entity:GetAttachment( data:GetAttachment() );
		if( attachment ) then
			start = attachment.Pos;
		end

	end
	
	return start;

end


function EFFECT:Init( data )

	self.StartPos = self:GetTracerOrigin( data );
	self.EndPos = data:GetOrigin();
	
	self.Entity:SetRenderBoundsWS( self.StartPos, self.EndPos );

	local diff = ( self.EndPos - self.StartPos );
	
	self.Normal = diff:GetNormal();
	self.StartTime = 0;
	self.LifeTime = ( diff:Length() + self.Length ) / self.Speed;
	
	-- whiz by sound
	local weapon = data:GetEntity();
	if( IsValid( weapon ) and ( not weapon:IsWeapon() or not weapon:IsCarriedByLocalPlayer() ) ) then

		local dist, pos, time = util.DistanceToLine( self.StartPos, self.EndPos, EyePos() );
	end

end


function EFFECT:Think()

	self.LifeTime = self.LifeTime - FrameTime();
	self.StartTime = self.StartTime + FrameTime(); 

	return self.LifeTime > 0;

end


function EFFECT:Render()

	local endDistance = self.Speed * self.StartTime;
	local startDistance = endDistance - self.Length;
	
	startDistance = math.max( 0, startDistance );
	endDistance = math.max( 0, endDistance );

	local startPos = self.StartPos + self.Normal * startDistance;
	local endPos = self.StartPos + self.Normal * endDistance;
	
	render.SetMaterial( MaterialFront );
	render.DrawSprite( endPos, 0, 0, color_white );

	render.SetMaterial( MaterialMain );
	render.DrawBeam( startPos, endPos, 7, 0, 1, color_white );
	
end

--addons/arccw_weapons/lua/effects/effect_astw2_halo_spv3_tracer_spiker/init.lua:

TRACER_FLAG_USEATTACHMENT	= 0x0002;
SOUND_FROM_WORLD			= 0;
CHAN_STATIC					= 6;

EFFECT.Speed				= 4000;
EFFECT.Length				= 200;
//EFFECT.WhizSound			= Sound( "nomad/whiz.wav" );		-- by Robinhood76 (http:--www.freesound.org/people/Robinhood76/sounds/96556/)
EFFECT.WhizDistance			= 72;

local MaterialMain			= Material( "effects/halo_spv3/flash/muzzle_flash/muzzle_flash_ar_side" );
local MaterialFront			= Material( "effects/halo_spv3/flash/smg_new" );

function EFFECT:GetTracerOrigin( data )

	-- this is almost a direct port of GetTracerOrigin in fx_tracer.cpp
	local start = data:GetStart();
	
	-- use attachment?
	if( bit.band( data:GetFlags(), TRACER_FLAG_USEATTACHMENT ) == TRACER_FLAG_USEATTACHMENT ) then

		local entity = data:GetEntity();
		
		if( not IsValid( entity ) ) then return start; end
		if( not game.SinglePlayer() and entity:IsEFlagSet( EFL_DORMANT ) ) then return start; end
		
		if( entity:IsWeapon() and entity:IsCarriedByLocalPlayer() ) then
			-- can't be done, can't call the real function
			-- local origin = weapon:GetTracerOrigin();
			-- if( origin ) then
			-- 	return origin, angle, entity;
			-- end
			
			-- use the view model
			local pl = entity:GetOwner();
			if( IsValid( pl ) ) then
				local vm = pl:GetViewModel();
				if( IsValid( vm ) and not LocalPlayer():ShouldDrawLocalPlayer() ) then
					entity = vm;
				else
					-- HACK: fix the model in multiplayer
					if( entity.WorldModel ) then
						entity:SetModel( entity.WorldModel );
					end
				end
			end
		end

		local attachment = entity:GetAttachment( data:GetAttachment() );
		if( attachment ) then
			start = attachment.Pos;
		end

	end
	
	return start;

end


function EFFECT:Init( data )

	self.StartPos = self:GetTracerOrigin( data );
	self.EndPos = data:GetOrigin();
	
	self.Entity:SetRenderBoundsWS( self.StartPos, self.EndPos );

	local diff = ( self.EndPos - self.StartPos );
	
	self.Normal = diff:GetNormal();
	self.StartTime = 0;
	self.LifeTime = ( diff:Length() + self.Length ) / self.Speed;
	
	-- whiz by sound
	local weapon = data:GetEntity();
	if( IsValid( weapon ) and ( not weapon:IsWeapon() or not weapon:IsCarriedByLocalPlayer() ) ) then

		local dist, pos, time = util.DistanceToLine( self.StartPos, self.EndPos, EyePos() );
	end

end


function EFFECT:Think()

	self.LifeTime = self.LifeTime - FrameTime();
	self.StartTime = self.StartTime + FrameTime(); 

	return self.LifeTime > 0;

end


function EFFECT:Render()

	local endDistance = self.Speed * self.StartTime;
	local startDistance = endDistance - self.Length;
	
	startDistance = math.max( 0, startDistance );
	endDistance = math.max( 0, endDistance );

	local startPos = self.StartPos + self.Normal * startDistance;
	local endPos = self.StartPos + self.Normal * endDistance;
	
	render.SetMaterial( MaterialFront );
	render.DrawSprite( endPos, 0, 0, color_white );

	render.SetMaterial( MaterialMain );
	render.DrawBeam( startPos, endPos, 7, 0, 1, color_white );
	
end

--addons/arccw_weapons/lua/effects/effect_astw2_haloreach_impact_focus_rifle/init.lua:
EFFECT.Duration			= 0.25;
EFFECT.Size				= 32;

local MaterialGlow		= Material( "effects/halo3/flare1" );

function EFFECT:Init( data )

	self.Position = data:GetOrigin();
	self.Normal = data:GetNormal();
	self.LifeTime = self.Duration;

	-- particles
	local emitter = ParticleEmitter( self.Position );
	if( emitter ) then
	
			local particle = emitter:Add( "effects/halo3/flare1", self.Position + self.Normal * 2 );
			particle:SetVelocity( ( self.Normal + VectorRand() * 0.75 ):GetNormal() * math.Rand( 75, 125 ) );
			particle:SetDieTime( math.Rand( 0.05, 0.1 ) );
			particle:SetStartAlpha( 255 );
			particle:SetEndAlpha( 0 );
			particle:SetStartSize( math.Rand( 2, 5 ) );
			particle:SetEndSize( 20 );
			particle:SetRoll( math.Rand(0,180) );
			particle:SetGravity( Vector( 0, 0, 0 ) );
			particle:SetCollide( true );
			particle:SetBounce( 0 );
			particle:SetAirResistance( 500 );
			particle:SetColor(255,145,25)
		
			local particle = emitter:Add( "effects/halo3/flash_large", self.Position + self.Normal * 2 );
			particle:SetVelocity( ( self.Normal + VectorRand() * 0.75 ):GetNormal() * math.Rand( 75, 125 ) );
			particle:SetDieTime( math.Rand( 0.05, 0.2 ) );
			particle:SetStartAlpha( 255 );
			particle:SetEndAlpha( 0 );
			particle:SetStartSize( math.Rand( 2, 5 ) );
			particle:SetEndSize( 20 );
			particle:SetRoll( math.Rand(0,180) );
			particle:SetGravity( Vector( 0, 0, 0 ) );
			particle:SetCollide( true );
			particle:SetBounce( 0 );
			particle:SetAirResistance( 500 );
			particle:SetColor(255,145,25)

			local particle = emitter:Add( "effects/halo3/electric_arcs", self.Position + self.Normal * 2 );
			particle:SetVelocity( ( self.Normal + VectorRand() * 0.75 ):GetNormal() * math.Rand( 75, 125 ) );
			particle:SetDieTime( math.Rand( 0.05, 0.5 ) );
			particle:SetStartAlpha( 255 );
			particle:SetEndAlpha( 0 );
			particle:SetStartSize( math.Rand( 2, 5 ) );
			particle:SetEndSize( 20 );
			particle:SetRoll( math.Rand(0,180) );
			particle:SetGravity( Vector( 0, 0, 0 ) );
			particle:SetCollide( true );
			particle:SetBounce( 0 );
			particle:SetAirResistance( 500 );
			particle:SetColor(125,155,255)
			
			local particle = emitter:Add( "effects/halo3/explosive_burst", self.Position + self.Normal * 2 );
			particle:SetVelocity( ( self.Normal + VectorRand() * 0.75 ):GetNormal() * math.Rand( 75, 125 ) );
			particle:SetDieTime( math.Rand( 0.05, 0.2 ) );
			particle:SetStartAlpha( 255 );
			particle:SetEndAlpha( 0 );
			particle:SetStartSize( math.Rand( 2, 5 ) );
			particle:SetEndSize( 35 );
			particle:SetRoll( math.Rand(0,180) );
			particle:SetGravity( Vector( 0, 0, 0 ) );
			particle:SetCollide( true );
			particle:SetBounce( 0 );
			particle:SetAirResistance( 500 );
			particle:SetColor(125,155,255)

		emitter:Finish();
	end
end


function EFFECT:Think()

	self.LifeTime = self.LifeTime - FrameTime();
	return self.LifeTime > 0;

end


function EFFECT:Render()

	local frac = math.max( 0, self.LifeTime / self.Duration );
	local rgb = 255 * frac;
	local color = Color( 255, 155, 55, 255 );

	render.SetMaterial( MaterialGlow );
	render.DrawQuadEasy( self.Position + self.Normal, self.Normal, self.Size, self.Size, color );

end

--addons/arccw_weapons/lua/effects/effect_astw2_swbf_electric_arc/init.lua:

local Tracer = Material( "effects/swbf/arccaster_lightning" )
local Tracer2  = Material( "effects/swbf/arccaster_lightning" )
local Width = math.random(35,50)
local Width2 = math.random(20,25)

function EFFECT:Init( data )

	self.Position = data:GetStart()
	self.EndPos = data:GetOrigin()
	self.WeaponEnt = data:GetEntity()
	self.Attachment = data:GetAttachment()
	self.StartPos = self:GetTracerShootPos( self.Position, self.WeaponEnt, self.Attachment )
	self:SetRenderBoundsWS( self.StartPos, self.EndPos )

	self.Dir = ( self.EndPos - self.StartPos ):GetNormalized()
	self.Dist = self.StartPos:Distance( self.EndPos )
	
	self.LifeTime = 0.25
	self.LifeTime2 = 0.45
	self.DieTime = CurTime() + self.LifeTime
	self.DieTime2 = CurTime() + self.LifeTime2

end

function EFFECT:Think()

	if ( CurTime() > self.DieTime ) then return false end
	return true

end

function EFFECT:Render()

	local r = 255
	local g = 255
	local b = 255
	
	local v = ( self.DieTime - CurTime() ) / self.LifeTime
	
	local v2 = ( self.DieTime2 - CurTime() ) / self.LifeTime2

	render.SetMaterial( Tracer )
	render.DrawBeam( self.StartPos, self.EndPos, (v * Width)*3/2, 0, (self.Dist/10)*math.Rand(-2,2), Color( 110, 100, 255, v * 155 ) )
	
	render.SetMaterial( Tracer2 )
	render.DrawBeam( self.StartPos, self.EndPos, (v2 * Width2)*2/3, 0, (self.Dist/10)*math.Rand(-2,2), Color( 200, 195, 255, (v2 * 100)*3/2.5 ) )

end

--addons/arccw_weapons/lua/effects/effect_astw2_swbf_laser_purple/init.lua:

TRACER_FLAG_USEATTACHMENT	= 0x0002;
SOUND_FROM_WORLD			= 0;
CHAN_STATIC					= 6;

EFFECT.Speed				= 4000;
EFFECT.Length				= 128;
//EFFECT.WhizSound			= Sound( "nomad/whiz.wav" );		-- by Robinhood76 (http:--www.freesound.org/people/Robinhood76/sounds/96556/)
EFFECT.WhizDistance			= 72;

local MaterialMain			= Material( "effects/swbf/violetlaser_bolt" );
local MaterialFront			= Material( "effects/swbf/violetlaser" );

function EFFECT:GetTracerOrigin( data )

	-- this is almost a direct port of GetTracerOrigin in fx_tracer.cpp
	local start = data:GetStart();
	
	-- use attachment?
	if( bit.band( data:GetFlags(), TRACER_FLAG_USEATTACHMENT ) == TRACER_FLAG_USEATTACHMENT ) then

		local entity = data:GetEntity();
		
		if( not IsValid( entity ) ) then return start; end
		if( not game.SinglePlayer() and entity:IsEFlagSet( EFL_DORMANT ) ) then return start; end
		
		if( entity:IsWeapon() and entity:IsCarriedByLocalPlayer() ) then
			-- can't be done, can't call the real function
			-- local origin = weapon:GetTracerOrigin();
			-- if( origin ) then
			-- 	return origin, angle, entity;
			-- end
			
			-- use the view model
			local pl = entity:GetOwner();
			if( IsValid( pl ) ) then
				local vm = pl:GetViewModel();
				if( IsValid( vm ) and not LocalPlayer():ShouldDrawLocalPlayer() ) then
					entity = vm;
				else
					-- HACK: fix the model in multiplayer
					if( entity.WorldModel ) then
						entity:SetModel( entity.WorldModel );
					end
				end
			end
		end

		local attachment = entity:GetAttachment( data:GetAttachment() );
		if( attachment ) then
			start = attachment.Pos;
		end

	end
	
	return start;

end


function EFFECT:Init( data )

	self.StartPos = self:GetTracerOrigin( data );
	self.EndPos = data:GetOrigin();
	
	self.Entity:SetRenderBoundsWS( self.StartPos, self.EndPos );

	local diff = ( self.EndPos - self.StartPos );
	
	self.Normal = diff:GetNormal();
	self.StartTime = 0;
	self.LifeTime = ( diff:Length() + self.Length ) / self.Speed;
	
	-- whiz by sound
	local weapon = data:GetEntity();
	if( IsValid( weapon ) and ( not weapon:IsWeapon() or not weapon:IsCarriedByLocalPlayer() ) ) then

		local dist, pos, time = util.DistanceToLine( self.StartPos, self.EndPos, EyePos() );
	end
end


function EFFECT:Think()

	self.LifeTime = self.LifeTime - FrameTime();
	self.StartTime = self.StartTime + FrameTime(); 

	return self.LifeTime > 0;

end


function EFFECT:Render()

	local endDistance = self.Speed * self.StartTime;
	local startDistance = endDistance - self.Length;
	
	startDistance = math.max( 0, startDistance );
	endDistance = math.max( 0, endDistance );

	local startPos = self.StartPos + self.Normal * startDistance;
	local endPos = self.StartPos + self.Normal * endDistance;
	
	render.SetMaterial( MaterialFront );
	render.DrawSprite( endPos, 0, 0, color_white );

	render.SetMaterial( MaterialMain );
	render.DrawBeam( startPos, endPos, 10, 0, 1, color_white );
	
end

--addons/arccw_weapons/lua/effects/effect_astw2_swbf_laser_white/init.lua:

TRACER_FLAG_USEATTACHMENT	= 0x0002;
SOUND_FROM_WORLD			= 0;
CHAN_STATIC					= 6;

EFFECT.Speed				= 6500;
EFFECT.Length				= 64;
//EFFECT.WhizSound			= Sound( "nomad/whiz.wav" );		-- by Robinhood76 (http:--www.freesound.org/people/Robinhood76/sounds/96556/)
EFFECT.WhizDistance			= 72;

local MaterialMain			= Material( "effects/sw_laser_white_main" );
local MaterialFront			= Material( "effects/sw_laser_white_front" );

function EFFECT:GetTracerOrigin( data )

	-- this is almost a direct port of GetTracerOrigin in fx_tracer.cpp
	local start = data:GetStart();
	
	-- use attachment?
	if( bit.band( data:GetFlags(), TRACER_FLAG_USEATTACHMENT ) == TRACER_FLAG_USEATTACHMENT ) then

		local entity = data:GetEntity();
		
		if( not IsValid( entity ) ) then return start; end
		if( not game.SinglePlayer() and entity:IsEFlagSet( EFL_DORMANT ) ) then return start; end
		
		if( entity:IsWeapon() and entity:IsCarriedByLocalPlayer() ) then
			-- can't be done, can't call the real function
			-- local origin = weapon:GetTracerOrigin();
			-- if( origin ) then
			-- 	return origin, angle, entity;
			-- end
			
			-- use the view model
			local pl = entity:GetOwner();
			if( IsValid( pl ) ) then
				local vm = pl:GetViewModel();
				if( IsValid( vm ) and not LocalPlayer():ShouldDrawLocalPlayer() ) then
					entity = vm;
				else
					-- HACK: fix the model in multiplayer
					if( entity.WorldModel ) then
						entity:SetModel( entity.WorldModel );
					end
				end
			end
		end

		local attachment = entity:GetAttachment( data:GetAttachment() );
		if( attachment ) then
			start = attachment.Pos;
		end

	end
	
	return start;

end


function EFFECT:Init( data )

	self.StartPos = self:GetTracerOrigin( data );
	self.EndPos = data:GetOrigin();
	
	self.Entity:SetRenderBoundsWS( self.StartPos, self.EndPos );

	local diff = ( self.EndPos - self.StartPos );
	
	self.Normal = diff:GetNormal();
	self.StartTime = 0;
	self.LifeTime = ( diff:Length() + self.Length ) / self.Speed;
	
	-- whiz by sound
	local weapon = data:GetEntity();
	if( IsValid( weapon ) and ( not weapon:IsWeapon() or not weapon:IsCarriedByLocalPlayer() ) ) then

		local dist, pos, time = util.DistanceToLine( self.StartPos, self.EndPos, EyePos() );
	end

end


function EFFECT:Think()

	self.LifeTime = self.LifeTime - FrameTime();
	self.StartTime = self.StartTime + FrameTime(); 

	return self.LifeTime > 0;

end


function EFFECT:Render()

	local endDistance = self.Speed * self.StartTime;
	local startDistance = endDistance - self.Length;
	
	startDistance = math.max( 0, startDistance );
	endDistance = math.max( 0, endDistance );

	local startPos = self.StartPos + self.Normal * startDistance;
	local endPos = self.StartPos + self.Normal * endDistance;
	
	render.SetMaterial( MaterialFront );
	render.DrawSprite( endPos, 8, 8, color_white );

	render.SetMaterial( MaterialMain );
	render.DrawBeam( startPos, endPos, 10, 0, 1, color_white );
	
end

--addons/aoc_nextbots/lua/effects/effect_npc_laser_red_big.lua:
TRACER_FLAG_USEATTACHMENT = 0x0002
SOUND_FROM_WORLD = 0
CHAN_STATIC = 6

EFFECT.Speed = 6500
EFFECT.Length = 64
EFFECT.WhizDistance = 72

local MaterialMain = Material("effects/sw_laser_red_main")
local MaterialFront = Material("effects/sw_laser_red_front")
local MaterialGlow = Material("sprites/light_glow02_add")
local ColorRed = Color(255, 0, 0)

function EFFECT:GetTracerOrigin(data)
    local start = data:GetStart()

    if (bit.band(data:GetFlags(), TRACER_FLAG_USEATTACHMENT) == TRACER_FLAG_USEATTACHMENT) then
        local entity = data:GetEntity()

        if (not IsValid(entity)) then
            return start
        end
        if (not game.SinglePlayer() and entity:IsEFlagSet(EFL_DORMANT)) then
            return start
        end

        if (entity:IsWeapon() and entity:IsCarriedByLocalPlayer()) then
            local pl = entity:GetOwner()
            if (IsValid(pl)) then
                local vm = pl:GetViewModel()
                if (IsValid(vm) and not LocalPlayer():ShouldDrawLocalPlayer()) then
                    entity = vm
                else
                    if (entity.WorldModel) then
                        entity:SetModel(entity.WorldModel)
                    end
                end
            end
        end

        local attachment = entity:GetAttachment(data:GetAttachment())
        if (attachment) then
            start = attachment.Pos
        end
    end

    return start
end

function EFFECT:Init(data)
    self.StartPos = self:GetTracerOrigin(data)
    self.EndPos = data:GetOrigin()

    self.Entity:SetRenderBoundsWS(self.StartPos, self.EndPos)

    local diff = (self.EndPos - self.StartPos)

    self.Normal = diff:GetNormal()
    self.StartTime = 0
    self.LifeTime = (diff:Length() + self.Length) / self.Speed

    local weapon = data:GetEntity()
    if (IsValid(weapon) and (not weapon:IsWeapon() or not weapon:IsCarriedByLocalPlayer())) then
        local dist, pos, time = util.DistanceToLine(self.StartPos, self.EndPos, EyePos())
    end
end

function EFFECT:Think()
    self.LifeTime = self.LifeTime - FrameTime()
    self.StartTime = self.StartTime + FrameTime()

    return self.LifeTime > 0
end

function EFFECT:Render()
    local endDistance = self.Speed * self.StartTime
    local startDistance = endDistance - self.Length

    startDistance = math.max(0, startDistance)
    endDistance = math.max(0, endDistance)

    local startPos = self.StartPos + self.Normal * startDistance
    local endPos = self.StartPos + self.Normal * endDistance

    render.SetMaterial(MaterialFront)
    render.DrawSprite(endPos, 13, 13, color_white)

    render.SetMaterial(MaterialMain)
    render.DrawBeam(startPos, endPos, 15, 0, 1, color_white)

    render.SetMaterial(MaterialGlow)
    render.DrawSprite(startPos, 50, 50, ColorRed)
end

--addons/arccw_weapons/lua/effects/effect_t_laser_blue/init.lua:

TRACER_FLAG_USEATTACHMENT	= 0x0002;
SOUND_FROM_WORLD			= 0;
CHAN_STATIC					= 6;

EFFECT.Speed				= 6500;
EFFECT.Length				= 1800;
//EFFECT.WhizSound			= Sound( "nomad/whiz.wav" );		-- by Robinhood76 (http:--www.freesound.org/people/Robinhood76/sounds/96556/)
EFFECT.WhizDistance			= 72;

local MaterialMain			= Material( "effects/sw_laser_blue_main" );
local MaterialFront			= Material( "effects/sw_laser_blue_front" );

function EFFECT:GetTracerOrigin( data )

	-- this is almost a direct port of GetTracerOrigin in fx_tracer.cpp
	local start = data:GetStart();
	
	-- use attachment?
	if( bit.band( data:GetFlags(), TRACER_FLAG_USEATTACHMENT ) == TRACER_FLAG_USEATTACHMENT ) then

		local entity = data:GetEntity();
		
		if( not IsValid( entity ) ) then return start; end
		if( not game.SinglePlayer() and entity:IsEFlagSet( EFL_DORMANT ) ) then return start; end
		
		if( entity:IsWeapon() and entity:IsCarriedByLocalPlayer() ) then
			-- can't be done, can't call the real function
			-- local origin = weapon:GetTracerOrigin();
			-- if( origin ) then
			-- 	return origin, angle, entity;
			-- end
			
			-- use the view model
			local pl = entity:GetOwner();
			if( IsValid( pl ) ) then
				local vm = pl:GetViewModel();
				if( IsValid( vm ) and not LocalPlayer():ShouldDrawLocalPlayer() ) then
					entity = vm;
				else
					-- HACK: fix the model in multiplayer
					if( entity.WorldModel ) then
						entity:SetModel( entity.WorldModel );
					end
				end
			end
		end

		local attachment = entity:GetAttachment( data:GetAttachment() );
		if( attachment ) then
			start = attachment.Pos;
		end

	end
	
	return start;

end


function EFFECT:Init( data )

	self.StartPos = self:GetTracerOrigin( data );
	self.EndPos = data:GetOrigin();
	
	self.Entity:SetRenderBoundsWS( self.StartPos, self.EndPos );

	local diff = ( self.EndPos - self.StartPos );
	
	self.Normal = diff:GetNormal();
	self.StartTime = 0;
	self.LifeTime = ( diff:Length() + self.Length ) / self.Speed;
	
	-- whiz by sound
	local weapon = data:GetEntity();
	if( IsValid( weapon ) and ( not weapon:IsWeapon() or not weapon:IsCarriedByLocalPlayer() ) ) then

		local dist, pos, time = util.DistanceToLine( self.StartPos, self.EndPos, EyePos() );
	end
end


function EFFECT:Think()

	self.LifeTime = self.LifeTime - FrameTime();
	self.StartTime = self.StartTime + FrameTime(); 

	return self.LifeTime > 0;

end


function EFFECT:Render()

	local endDistance = self.Speed * self.StartTime;
	local startDistance = endDistance - self.Length;
	
	startDistance = math.max( 0, startDistance );
	endDistance = math.max( 0, endDistance );

	local startPos = self.StartPos + self.Normal * startDistance;
	local endPos = self.StartPos + self.Normal * endDistance;
	
	render.SetMaterial( MaterialFront );
	render.DrawSprite( endPos, 8, 8, color_white );

	render.SetMaterial( MaterialMain );
	render.DrawBeam( startPos, endPos, 10, 0, 1, color_white );
	
end

--addons/weapon_jedi/lua/effects/force_block.lua:
--DO NOT EDIT OR REUPLOAD THIS FILE

function EFFECT:Init( data )
	self.Ent = data:GetEntity()
	self.Pos = data:GetOrigin()
	
	self.mat = Material( "effects/select_ring" )
	
	self.LifeTime = 0.6
	self.DieTime = CurTime() + self.LifeTime

	if not IsValid( self.Ent ) then return end

	self.Model = ClientsideModel( self.Ent:GetModel(), RENDERGROUP_TRANSLUCENT )
	self.Model:SetMaterial("models/alyx/emptool_glow")
	self.Model:SetColor( Color(0,70,150,255) )
	self.Model:SetParent( self.Ent, 0 )
	self.Model:SetMoveType( MOVETYPE_NONE )
	self.Model:SetLocalPos( Vector( 0, 0, 0 ) )
	self.Model:SetLocalAngles( Angle( 0, 0, 0 ) )
	self.Model:AddEffects( EF_BONEMERGE )

	for i = 0,self.Ent:GetBoneCount() do
		self.Model:ManipulateBoneScale( i, Vector(1,1,1) * 1.1 )
	end

	for i = 0, self.Ent:GetNumBodyGroups() do
		self.Model:SetBodygroup(i, self.Ent:GetBodygroup(i))
	end
end

function EFFECT:Think()
	if self.DieTime < CurTime() or not IsValid( self.Ent ) or not self.Ent:Alive() then 
		if IsValid( self.Model ) then
			self.Model:Remove()
		end

		return false
	end
	
	return true
end

function EFFECT:Render()
end

--addons/weapon_jedi/lua/effects/force_replenish.lua:
--DO NOT EDIT OR REUPLOAD THIS FILE


EFFECT.mat = Material( "sprites/light_glow02_add" )


function EFFECT:Init( data )
	self.Ent = data:GetEntity()
	self.Pos = data:GetOrigin()

	self.LifeTime = 1
	self.DieTime = CurTime() + self.LifeTime

	if not IsValid( self.Ent ) then return end

	self.Model = ClientsideModel( self.Ent:GetModel(), RENDERGROUP_TRANSLUCENT )

	self.Model:SetMaterial("models/alyx/emptool_glow")
	self.Model:SetColor( Color(255,0,0,255) )
	self.Model:SetParent( self.Ent, 0 )
	self.Model:SetMoveType( MOVETYPE_NONE )
	self.Model:SetLocalPos( Vector( 0, 0, 0 ) )
	self.Model:SetLocalAngles( Angle( 0, 0, 0 ) )
	self.Model:AddEffects( EF_BONEMERGE )

	for i = 0,self.Ent:GetBoneCount() do
		self.Model:ManipulateBoneScale( i, Vector(1,1,1) * 1.1 )
	end

	for i = 0, self.Ent:GetNumBodyGroups() do
		self.Model:SetBodygroup(i, self.Ent:GetBodygroup(i))
	end
end

function EFFECT:Think()
	if self.DieTime < CurTime() or not IsValid( self.Ent ) or (self.Ent.Alive and not self.Ent:Alive()) then 
		if IsValid( self.Model ) then
			self.Model:Remove()
		end

		return false
	end

	if IsValid( self.Model ) then
		self.Model:SetColor( Color(255 * (self.DieTime - CurTime()) / self.LifeTime,0,0,255) )
	end

	return true
end

function EFFECT:Render()
	if not IsValid( self.Ent ) then return end

	local Scale = (self.DieTime - CurTime()) / self.LifeTime
	render.SetMaterial( self.mat )
	render.DrawSprite( self.Ent:LocalToWorld( Vector(0,0,40) ), 250 * Scale, 250 * Scale, Color( 150 * Scale, 0, 0, 150 * Scale ) )
end
	

--addons/aocrp_emplacements/lua/effects/gdcw_universal_impact_t/init.lua:

					//Sound,Impact

					// 1        2       3      4      5
					//Dirt, Concrete, Metal, Glass, Flesh

					// 1     2     3      4      5      6      7      8         9
					//Dust, Dirt, Sand, Metal, Smoke, Wood,  Glass, Blood, YellowBlood
local mats={				
	[MAT_ALIENFLESH]		={5,9},
	[MAT_ANTLION]			={5,9},
	[MAT_BLOODYFLESH]		={5,8},
	[MAT_CLIP]			={3,5},
	[MAT_COMPUTER]			={4,5},
	[MAT_FLESH]			={5,8},
	[MAT_GRATE]			={3,4},
	[MAT_METAL]			={3,4},
	[MAT_PLASTIC]			={2,5},
	[MAT_SLOSH]			={5,5},
	[MAT_VENT]			={3,4},
	[MAT_FOLIAGE]			={1,5},
	[MAT_TILE]			={2,5},
	[MAT_CONCRETE]			={2,1},
	[MAT_DIRT]			={1,2},
	[MAT_SAND]			={1,3},
	[MAT_WOOD]			={2,6},
	[MAT_GLASS]			={4,7},
}

local sounds={
	[1]={"Bullet.Dirt",},
	[2]={"Bullet.Concrete",},
	[3]={"Bullet.Metal",},
	[4]={"Bullet.Glass",},
	[5]={"Bullet.Flesh",},
}

function EFFECT:Init(data)
	self.Origin = data:GetOrigin()
	self.DirVec = data:GetNormal()
	self.Scale  = data:GetScale()
	self.Radius = data:GetRadius()
	self.Emitter = ParticleEmitter( self.Origin )

	self.Mat=math.ceil(self.Radius)


	
	if(self.Mat != nil)then
		if     mats[self.Mat][2]==1 then	self:Dust()	
		elseif mats[self.Mat][2]==2 then	self:Dirt()
		elseif mats[self.Mat][2]==3 then	self:Sand()
		elseif mats[self.Mat][2]==4 then	self:Metal()
		elseif mats[self.Mat][2]==5 then	self:Smoke()
		elseif mats[self.Mat][2]==6 then	self:Wood()
		elseif mats[self.Mat][2]==7 then	self:Glass()
		elseif mats[self.Mat][2]==8 then	self:Blood()
		elseif mats[self.Mat][2]==9 then	self:YellowBlood()
		else 					self:Smoke()
		end
	else
		self:Dirt()
	end
end
 
 function EFFECT:Dust()
	sound.Play( "Bullet.Impact", self.Origin)
	self.Emitter = ParticleEmitter( self.Origin )
		
	for i=0, 15*self.Scale do
		local Smoke = self.Emitter:Add( "particles/smokey", self.Origin )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 0,500*self.Scale) + VectorRand():GetNormalized()*100*self.Scale )
		Smoke:SetDieTime( math.Rand( 1 , 2.5 )*self.Scale )
		Smoke:SetStartAlpha( math.Rand( 80, 100 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 12*self.Scale )
		Smoke:SetEndSize( 30*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 300 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 130,125,115 )
		end
	end

	for i=0, 10*self.Scale do
		local Smoke = self.Emitter:Add( "particle/particle_composite", self.Origin )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 0,400*self.Scale) + VectorRand():GetNormalized()*20*self.Scale )
		Smoke:SetDieTime( math.Rand( 0.5 , 1.5 )*self.Scale )
		Smoke:SetStartAlpha( 150 )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 20*self.Scale )
		Smoke:SetEndSize( 30*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 400 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-50, 50) * self.Scale, math.Rand(-50, 50) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 105,100,90 )
		end
	end

	for i=0, 10*self.Scale do
		local Debris = self.Emitter:Add( "effects/fleck_cement"..math.random(1,2), self.Origin )
		if (Debris) then
		Debris:SetVelocity ( self.DirVec * math.random(200,300*self.Scale) + VectorRand():GetNormalized() * 300*self.Scale )
		Debris:SetDieTime( math.random( 0.6, 1) )
		Debris:SetStartAlpha( 255 )
		Debris:SetEndAlpha( 0 )
		Debris:SetStartSize( math.random(2,5*self.Scale) )
		Debris:SetRoll( math.Rand(0, 360) )
		Debris:SetRollDelta( math.Rand(-5, 5) )			
		Debris:SetAirResistance( 50 ) 			 			
		Debris:SetColor( 105,100,90 )
		Debris:SetGravity( Vector( 0, 0, -600) ) 
		Debris:SetCollide( true )
		Debris:SetBounce( 1 )			
		end
	end
	
		for i=0,1 do 
			local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Origin )
			if (Flash) then
			Flash:SetVelocity( self.DirVec*100 )
			Flash:SetAirResistance( 200 )
			Flash:SetDieTime( 0.1 )
			Flash:SetStartAlpha( 255 )
			Flash:SetEndAlpha( 0 )
			Flash:SetStartSize( math.Rand( 30, 40 )*self.Scale )
			Flash:SetEndSize( 0 )
			Flash:SetRoll( math.Rand(180,480) )
			Flash:SetRollDelta( math.Rand(-1,1) )
			Flash:SetColor(255,255,255)	
			end
		end
 end
 
 function EFFECT:Dirt()
		sound.Play( "Bullet.Impact", self.Origin)
	self.Emitter = ParticleEmitter( self.Origin )
		
	for i=0, 15*self.Scale do
		local Smoke = self.Emitter:Add( "particles/smokey", self.Origin )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 0,500*self.Scale) + VectorRand():GetNormalized()*100*self.Scale )
		Smoke:SetDieTime( math.Rand( 1 , 2.5 )*self.Scale )
		Smoke:SetStartAlpha( math.Rand( 80, 100 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 12*self.Scale )
		Smoke:SetEndSize( 30*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 300 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 90,85,75 )
		end
	end

	for i=0, 10*self.Scale do
		local Smoke = self.Emitter:Add( "particle/particle_composite", self.Origin )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 0,400*self.Scale) + VectorRand():GetNormalized()*20*self.Scale )
		Smoke:SetDieTime( math.Rand( 0.5 , 1.5 )*self.Scale )
		Smoke:SetStartAlpha( 200 )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 20*self.Scale )
		Smoke:SetEndSize( 30*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 400 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-50, 50) * self.Scale, math.Rand(-50, 50) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 90,85,75 )
		end
	end

	for i=0, 15*self.Scale do
		local Debris = self.Emitter:Add( "effects/fleck_cement"..math.random(1,2), self.Origin )
		if (Debris) then
		Debris:SetVelocity ( self.DirVec * math.random(200,300*self.Scale) + VectorRand():GetNormalized() * 300*self.Scale )
		Debris:SetDieTime( math.random( 0.75, 1.25) )
		Debris:SetStartAlpha( 255 )
		Debris:SetEndAlpha( 0 )
		Debris:SetStartSize( math.random(3,7*self.Scale) )
		Debris:SetRoll( math.Rand(0, 360) )
		Debris:SetRollDelta( math.Rand(-5, 5) )			
		Debris:SetAirResistance( 50 ) 			 			
		Debris:SetColor( 90,85,75 )
		Debris:SetGravity( Vector( 0, 0, -600) ) 
		Debris:SetCollide( true )
		Debris:SetBounce( 1 )			
		end
	end
	
		for i=0,1 do 
			local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Origin )
			if (Flash) then
			Flash:SetVelocity( self.DirVec*100 )
			Flash:SetAirResistance( 200 )
			Flash:SetDieTime( 0.1 )
			Flash:SetStartAlpha( 255 )
			Flash:SetEndAlpha( 0 )
			Flash:SetStartSize( math.Rand( 10, 20 )*self.Scale )
			Flash:SetEndSize( 0 )
			Flash:SetRoll( math.Rand(180,480) )
			Flash:SetRollDelta( math.Rand(-1,1) )
			Flash:SetColor(255,255,255)	
			end
		end
 end

 function EFFECT:Sand()
		sound.Play( "Bullet.Impact", self.Origin)
	self.Emitter = ParticleEmitter( self.Origin )
		
	for i=0, 15*self.Scale do
		local Smoke = self.Emitter:Add( "particles/smokey", self.Origin )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 0,500*self.Scale) + VectorRand():GetNormalized()*100*self.Scale )
		Smoke:SetDieTime( math.Rand( 1 , 2.5 )*self.Scale )
		Smoke:SetStartAlpha( math.Rand( 60, 80 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 12*self.Scale )
		Smoke:SetEndSize( 30*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 300 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 120,110,90 )
		end
	end

	for i=0, 20*self.Scale do
		local Smoke = self.Emitter:Add( "particle/particle_composite", self.Origin )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 0,400*self.Scale) + VectorRand():GetNormalized()*20*self.Scale )
		Smoke:SetDieTime( math.Rand( 0.5 , 1.5 )*self.Scale )
		Smoke:SetStartAlpha( 150 )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 20*self.Scale )
		Smoke:SetEndSize( 30*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 400 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-50, 50) * self.Scale, math.Rand(-50, 50) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 120,110,90 )
		end
	end

	
 end

 function EFFECT:Metal()
			sound.Play( "Bullet.Impact", self.Origin)
	self.Emitter = ParticleEmitter( self.Origin )
		
	for i=0, 15*self.Scale do
		local Smoke = self.Emitter:Add( "particle/smokestack", self.Origin )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 0,50*self.Scale) + VectorRand():GetNormalized()*200*self.Scale )
		Smoke:SetDieTime( math.Rand( 3 , 7 )*self.Scale )
		Smoke:SetStartAlpha( math.Rand( 50, 70 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 20*self.Scale )
		Smoke:SetEndSize( 40*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 300 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 100,100,100 )
		end
	end
	
		for i=0,3 do 
			local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Origin )
			if (Flash) then
			Flash:SetVelocity( self.DirVec*100 )
			Flash:SetAirResistance( 200 )
			Flash:SetDieTime( 0.1 )
			Flash:SetStartAlpha( 255 )
			Flash:SetEndAlpha( 0 )
			Flash:SetStartSize( math.Rand( 20, 30 )*self.Scale^2 )
			Flash:SetEndSize( 0 )
			Flash:SetRoll( math.Rand(180,480) )
			Flash:SetRollDelta( math.Rand(-1,1) )
			Flash:SetColor(255,255,255)	
			end
		end

 	 
 		for i=0, 20*self.Scale do 
 			local particle = self.Emitter:Add( "effects/spark", self.Origin ) 
 			if (particle) then 
 			particle:SetVelocity( ((self.DirVec*0.75)+VectorRand()) * math.Rand(50, 300)*self.Scale ) 
 			particle:SetDieTime( math.Rand(0.3, 0.5) ) 				 
 			particle:SetStartAlpha( 255 )  				 
 			particle:SetStartSize( math.Rand(4, 6)*self.Scale ) 
 			particle:SetEndSize( 0 ) 				 
 			particle:SetRoll( math.Rand(0, 360) ) 
 			particle:SetRollDelta( math.Rand(-5, 5) ) 				 
 			particle:SetAirResistance( 20 ) 
 			particle:SetGravity( Vector( 0, 0, -600 ) ) 
 			end 
			
		end 

end


 function EFFECT:Smoke()
		sound.Play( "Bullet.Impact", self.Origin)
	self.Emitter = ParticleEmitter( self.Origin )
		
	for i=0, 15*self.Scale do
		local Smoke = self.Emitter:Add( "particle/smokestack", self.Origin )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 20,70*self.Scale) + VectorRand():GetNormalized()*150*self.Scale )
		Smoke:SetDieTime( math.Rand( 3 , 7 )*self.Scale )
		Smoke:SetStartAlpha( math.Rand( 50, 70 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 20*self.Scale )
		Smoke:SetEndSize( 50*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 200 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) ) ) 			
		Smoke:SetColor( 100,100,100 )
		end
	end

	for i=0, 15*self.Scale do
		local Debris = self.Emitter:Add( "effects/fleck_tile"..math.random(1,2), self.Origin )
		if (Debris) then
		Debris:SetVelocity ( self.DirVec * math.random(50,100*self.Scale) + VectorRand():GetNormalized() * 300*self.Scale )
		Debris:SetDieTime( math.random( 0.75, 1) )
		Debris:SetStartAlpha( 255 )
		Debris:SetEndAlpha( 0 )
		Debris:SetStartSize( math.random(1,3*self.Scale) )
		Debris:SetRoll( math.Rand(0, 360) )
		Debris:SetRollDelta( math.Rand(-5, 5) )			
		Debris:SetAirResistance( 50 ) 			 			
		Debris:SetColor( 90,85,75 )
		Debris:SetGravity( Vector( 0, 0, -600) ) 
		Debris:SetCollide( true )
		Debris:SetBounce( 1 )			
		end
	end

		for i=0,1 do 
			local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Origin )
			if (Flash) then
			Flash:SetVelocity( self.DirVec*100 )
			Flash:SetAirResistance( 200 )
			Flash:SetDieTime( 0.1 )
			Flash:SetStartAlpha( 255 )
			Flash:SetEndAlpha( 0 )
			Flash:SetStartSize( math.Rand( 10, 20 )*self.Scale^2 )
			Flash:SetEndSize( 0 )
			Flash:SetRoll( math.Rand(180,480) )
			Flash:SetRollDelta( math.Rand(-1,1) )
			Flash:SetColor(255,255,255)	
			end
		end
 end

 function EFFECT:Wood()
		sound.Play( "Bullet.Impact", self.Origin)
	self.Emitter = ParticleEmitter( self.Origin )
		
	for i=0, 5*self.Scale do
		local Smoke = self.Emitter:Add( "particle/smokestack", self.Origin )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 20,70*self.Scale) + VectorRand():GetNormalized()*150*self.Scale )
		Smoke:SetDieTime( math.Rand( 3 , 7 )*self.Scale )
		Smoke:SetStartAlpha( math.Rand( 40, 60 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 20*self.Scale )
		Smoke:SetEndSize( 50*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 200 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) ) ) 			
		Smoke:SetColor( 100,100,100 )
		end
	end

	for i=0, 10*self.Scale do
		local Smoke = self.Emitter:Add( "particle/smokestack", self.Origin )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 20,70*self.Scale) + VectorRand():GetNormalized()*150*self.Scale )
		Smoke:SetDieTime( math.Rand( 3 , 7 )*self.Scale )
		Smoke:SetStartAlpha( math.Rand( 40, 60 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 20*self.Scale )
		Smoke:SetEndSize( 50*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 200 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) ) ) 			
		Smoke:SetColor( 90,85,75 )
		end
	end

	for i=0, 15*self.Scale do
		local Debris = self.Emitter:Add( "effects/fleck_wood"..math.random(1,2), self.Origin+self.DirVec )
		if (Debris) then
		Debris:SetVelocity ( self.DirVec * math.random(50,300*self.Scale) + VectorRand():GetNormalized() * 300*self.Scale )
		Debris:SetDieTime( math.random( 0.75, 1) )
		Debris:SetStartAlpha( 255 )
		Debris:SetEndAlpha( 0 )
		Debris:SetStartSize( math.random(3,6*self.Scale) )
		Debris:SetRoll( math.Rand(0, 360) )
		Debris:SetRollDelta( math.Rand(-5, 5) )			
		Debris:SetAirResistance( 50 ) 			 			
		Debris:SetColor( 90,85,75 )
		Debris:SetGravity( Vector( 0, 0, -600) ) 
		Debris:SetCollide( true )
		Debris:SetBounce( 0.5 )			
		end
	end

 end

 function EFFECT:Glass()

	
	for i=0, 10*self.Scale do
		local Debris = self.Emitter:Add( "effects/fleck_glass"..math.random(1,3), self.Origin+self.DirVec )
		if (Debris) then
		Debris:SetVelocity ( self.DirVec * math.random(50,200)*self.Scale + VectorRand():GetNormalized() * 60*self.Scale )
		Debris:SetDieTime( math.random( 1, 1.5) )
		Debris:SetStartAlpha( 255 )
		Debris:SetEndAlpha( 0 )
		Debris:SetStartSize( math.random(2,4*self.Scale) )
		Debris:SetRoll( math.Rand(0, 360) )
		Debris:SetRollDelta( math.Rand(-15, 15) )			
		Debris:SetAirResistance( 50 ) 			 			
		Debris:SetColor( 100,100,100 )
		Debris:SetGravity( Vector( 0, 0, -600) ) 
		Debris:SetCollide( true )
		Debris:SetBounce( 0.3 )			
		end
	end

	for i=0, 20*self.Scale do
		local Debris = self.Emitter:Add( "effects/fleck_glass"..math.random(1,3), self.Origin )
		if (Debris) then
		Debris:SetVelocity ( self.DirVec*-1 * math.random(50,300)*self.Scale + VectorRand():GetNormalized() * 60*self.Scale )
		Debris:SetDieTime( math.random( 0.5, 1) )
		Debris:SetStartAlpha( 255 )
		Debris:SetEndAlpha( 0 )
		Debris:SetStartSize( math.random(2,4*self.Scale) )
		Debris:SetRoll( math.Rand(0, 360) )
		Debris:SetRollDelta( math.Rand(-15, 15) )			
		Debris:SetAirResistance( 50 ) 			 			
		Debris:SetColor( 100,100,100 )
		Debris:SetGravity( Vector( 0, 0, -600) ) 	
		end
	end
 end

 function EFFECT:Blood()

	for i=0, 10*self.Scale do
		local Smoke = self.Emitter:Add( "particle/particle_composite", self.Origin )
		if (Smoke) then
		Smoke:SetVelocity( VectorRand():GetNormalized()*math.random(0,50)*self.Scale )
		Smoke:SetDieTime( math.Rand( 0.3 , 0.7 ) )
		Smoke:SetStartAlpha( 80 )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 10*self.Scale )
		Smoke:SetEndSize( 30*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 400 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-50, 50) * self.Scale, math.Rand(-50, 50) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 70,35,35 )
		end
	end

 end

 function EFFECT:YellowBlood()

	for i=0, 10*self.Scale do
		local Smoke = self.Emitter:Add( "particle/particle_composite", self.Origin )
		if (Smoke) then
		Smoke:SetVelocity( VectorRand():GetNormalized()*math.random(0,70)*self.Scale )
		Smoke:SetDieTime( math.Rand( 0.3 , 0.7 ) )
		Smoke:SetStartAlpha( 80 )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 10*self.Scale )
		Smoke:SetEndSize( 30*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 400 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-50, 50) * self.Scale, math.Rand(-50, 50) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 120,120,0 )
		end
	end
 end
 

function EFFECT:Think( )
return false
end

function EFFECT:Render()
end
--addons/weapon_jedi/lua/effects/rb655_force_repulse_in.lua:

function EFFECT:Init( data )
	local pos = data:GetOrigin()
	--local rad = data:GetRadius()
	local emitter = ParticleEmitter( pos )

	if ( !emitter ) then return end

	local particle = emitter:Add( "effects/rb655_splash_warpring1", pos )
	if ( particle ) then
		particle:SetLifeTime( 0 )
		particle:SetDieTime( 0.5 )

		particle:SetGravity( Vector( 0, 0, 0 ) )
		particle:SetVelocity( Vector( 0, 0, 0 ) )

		particle:SetStartSize( 100 )
		particle:SetEndSize( 0 )

		particle:SetStartAlpha( 0 )
		particle:SetEndAlpha( 200 )

		particle:SetColor( 255, 255, 255 )
		--particle:SetAngleVelocity( Angle( math.Rand( -180, 180 ), math.Rand( -180, 180 ), math.Rand( -180, 180 ) ) )
	end

	--[[local particle = emitter:Add( "effects/select_ring", pos )
	if ( particle ) then
		particle:SetLifeTime( 0 )
		particle:SetDieTime( 0.3 )

		particle:SetGravity( Vector( 0, 0, 0 ) )
		particle:SetVelocity( Vector( 0, 0, 0 ) )

		particle:SetStartSize( math.random( 38, 42 ) )
		particle:SetEndSize( math.random( 48, 52 ) )

		particle:SetStartAlpha( 255 )
		particle:SetEndAlpha( 255 )

		particle:SetColor( 0, 255, 255 )
		--particle:SetAngleVelocity( Angle( math.Rand( -180, 180 ), math.Rand( -180, 180 ), math.Rand( -180, 180 ) ) )
	end]]

	emitter:Finish()
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end
