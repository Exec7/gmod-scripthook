--Stealed clientside server code by exechack.cc
--Hostname: Ψ UkraineRP #1 ◈ Оновлення◈ Набiр ◈ M9K - Part 9/10 - 06/04/2025


--PATH addons/dash/lua/dash/extensions/player.lua:
local PLAYER, ENTITY = FindMetaTable 'Player', FindMetaTable 'Entity'
local GetTable = ENTITY.GetTable

-- Utils
function player.Find(info)
	info = tostring(info)
	for k, v in ipairs(player.GetAll()) do
		if (info == v:SteamID()) or (info == v:SteamID64()) or (string.find(string.lower(v:Name()), string.lower(info), 1, true) ~= nil) then
			return v
		end
	end
end

function player.GetStaff()
	return table.Filter(player.GetAll(), PLAYER.IsAdmin)
end


function PLAYER:Timer(name, time, reps, callback, failure)
	name = self:SteamID64() .. '-' .. name
	timer.Create(name, time, reps, function()
		if IsValid(self) then
			callback(self)
		else
			if (failure) then
				failure()
			end

			timer.Destroy(name)
		end
	end)
end

function PLAYER:DestroyTimer(name)
	timer.Destroy(self:SteamID64() .. '-' .. name)
end

if (CLIENT) then return end

-- Fix for https://github.com/Facepunch/garrysmod-issues/issues/2447
local telequeue = {}
local setpos = ENTITY.SetPos
function PLAYER:SetPos(pos)
	telequeue[self] = pos
end

hook.Add('FinishMove', 'SetPos.FinishMove', function(pl)
	if telequeue[pl] then
		setpos(pl, telequeue[pl])
		telequeue[pl] = nil
		return true
	end
end)
--PATH addons/dash/lua/dash/extensions/net.lua:
setmetatable(net, {
	__call = function(self, name, func)
		return self.Receive(name, func)
	end
})

local hook_Call = hook.Call
local math_abs = math.abs
local math_min = math.min
local IsValid 	= IsValid
local Entity 	= Entity
local Color 	= Color
local WriteUInt = net.WriteUInt
local ReadUInt 	= net.ReadUInt
local Start 	= net.Start
local Send 		= (SERVER) and net.Send or net.SendToServer

local Incoming = net.Incoming
function net.Incoming(bitCount, pl)
	hook_Call('IncomingNetMessage', nil, bitCount, pl)
	return Incoming(bitCount, pl)
end

local ReadUInt = net.ReadUInt
function net.ReadUInt(bitCount)
	if (bitCount > 32) or (bitCount < 1) then
		error('Out of range bitCount! Got ' .. bitCount)
	end
	return ReadUInt(bitCount)
end

local ReadInt = net.ReadInt
function net.ReadInt(bitCount)
	if (bitCount > 32) or (bitCount < 1) then
		error('Out of range bitCount! Got ' .. bitCount)
	end
	return ReadInt(bitCount)
end

function net.WriteEntity(ent)
	if IsValid(ent) then
		WriteUInt(ent:EntIndex(), 13)
	else
		WriteUInt(0, 13)
	end
end

function net.ReadEntity()
	local i = ReadUInt(13)
	if (not i) then return end
	return Entity(i)
end

function net.WriteRGB(r, g, b)
	WriteUInt(r, 8)
	WriteUInt(g, 8)
	WriteUInt(b, 8)
end

function net.WriteRGBA(r, g, b, a)
	WriteUInt(r, 8)
	WriteUInt(g, 8)
	WriteUInt(b, 8)
	WriteUInt(a, 8)
end
local WriteRGBA = net.WriteRGBA

function net.WriteColor(c)
	WriteRGBA(c.r, c.g, c.b, c.a)
end

function net.ReadRGB()
	return ReadUInt(8), ReadUInt(8), ReadUInt(8)
end

function net.ReadRGBA()
	return ReadUInt(8), ReadUInt(8), ReadUInt(8), ReadUInt(8)
end
local ReadRGBA = net.ReadRGBA

function net.ReadColor()
	return Color(ReadRGBA())
end

function net.WriteNibble(i)
	WriteUInt(i, 4)
end

function net.ReadNibble()
	return ReadUInt(4)
end

function net.WriteByte(i)
	WriteUInt(i, 8)
end

function net.ReadByte()
	return ReadUInt(8)
end

function net.WriteShort(i)
	WriteUInt(i, 16)
end

function net.ReadShort()
	return ReadUInt(16)
end

function net.WriteLong(i)
	WriteUInt(i, 32)
end

function net.ReadLong()
	return ReadUInt(32)
end

function net.WritePlayer(pl)
	if IsValid(pl) then
		WriteUInt(pl:EntIndex(), 8)
	else
		WriteUInt(0, 8)
	end
end

function net.ReadPlayer()
	local i = ReadUInt(8)
	if (not i) then return end
	return Entity(i)
end

function net.Ping(msg, recipients)
	Start(msg)
	Send(recipients)
end

--PATH addons/dash/lua/dash/extensions/util.lua:
--[[---------------------------------------------------------
   Name: Tracer(vecStart, vecEnd, pEntity, iAttachment, flVelocity, bWhiz, pCustomTracerName, iParticleID)
   Desc: Create a tracer effect
-----------------------------------------------------------]]
-- Tracer flags
TRACER_FLAG_WHIZ = 0x0001
TRACER_FLAG_USEATTACHMENT = 0x0002

TRACER_DONT_USE_ATTACHMENT = -1

function util.Tracer(vecStart, vecEnd, pEntity, iAttachment, flVelocity, bWhiz, pCustomTracerName, iParticleID)
	local data = EffectData()
	data:SetStart(vecStart)
	data:SetOrigin(vecEnd)
	data:SetEntity(pEntity)
	data:SetScale(flVelocity)

	if (iParticleID ~= nil) then
		data:SetHitBox(iParticleID)
	end

	local fFlags = data:GetFlags()

	-- Flags
	if bWhiz then
		fFlags = bit.bor(fFlags, TRACER_FLAG_WHIZ)
	end

	if (iAttachment ~= TRACER_DONT_USE_ATTACHMENT) then
		fFlags = bit.bor(fFlags, TRACER_FLAG_USEATTACHMENT)
		data:SetAttachment(iAttachment)
	end

	data:SetFlags(fFlags)

	-- Fire it off
	if pCustomTracerName then
		util.Effect(pCustomTracerName, data)
	else
		util.Effect("Tracer", data)
	end
end


function util.FindHullIntersection(tbl, tr)
	local iDist = 1e12
	tbl.output = nil
	local vSrc = tbl.start
	local vHullEnd = vSrc + (tr.HitPos - vSrc) * 2
	tbl.endpos = vHullEnd
	local tBounds = { tbl.mins, tbl.maxs }
	local trTemp = util.TraceLine(tbl)

	if (trTemp.Fraction ~= 1) then
		table.CopyFromTo(trTemp, tr)
		return tr
	end

	local trOutput

	for i = 1, 2 do
		for j = 1, 2 do
			for k = 1, 2 do
				tbl.endpos = Vector( vHullEnd.x + tBounds[i].x,
					vHullEnd.y + tBounds[j].y,
					vHullEnd.z + tBounds[k].z )

				local trTemp = util.TraceLine(tbl)

				if (trTemp.Fraction ~= 1) then
					local iHitDistSqr = (trTemp.HitPos - vSrc):LengthSqr()

					if (iHitDistSqr < iDist) then
						trOutput = trTemp
						iDist = iHitDistSqr
					end
				end
			end
		end
	end

	if (trOutput) then
		table.CopyFromTo(trOutput, tr)
	end

	return tr
end

--[[---------------------------------------------------------
	Find an empty Vector
-----------------------------------------------------------]]
local Vector 				= Vector
local ents_FindInSphere 	= ents.FindInSphere
local util_PointContents 	= util.PointContents

local badpoints = {
	[CONTENTS_SOLID] 		= true,
	[CONTENTS_MOVEABLE] 	= true,
	[CONTENTS_LADDER]		= true,
	[CONTENTS_PLAYERCLIP] 	= true,
	[CONTENTS_MONSTERCLIP] 	= true,
}

local function isempty(pos, area)
	if badpoints[util_PointContents(pos)] then
		return false
	end
	local entities = ents_FindInSphere(pos, area)
	for i = 1, #entities do
		if (entities[i]:GetClass() == 'prop_physics') or (entities[i]:IsPlayer() and entities[i]:Alive()) then
			return false
		end
	end
	return true
end

function util.FindEmptyPos(pos, area, steps)
	pos = Vector(pos.x, pos.y, pos.z)
	area = area or 35

	if isempty(pos, area) then
		return pos
	end

	for i = 1, (steps or 6) do
		local step = (i * 50)
		if isempty(Vector(pos.x + step, pos.y, pos.z), area) then
			pos.x = pos.x + step
			return pos
		elseif isempty(Vector(pos.x, pos.y + step, pos.z), area) then
			pos.y = pos.y + step
			return pos
		elseif isempty(Vector(pos.x, pos.y, pos.z + step), area) then
			pos.z = pos.z + step
			return pos
		end
	end

	return pos
end

local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
function util.Base64Decode(data)
	data = string.gsub(data, '[^'..b..'=]', '')
	return (data:gsub('.', function(x)
		if (x == '=') then return '' end
		local r,f='',(b:find(x)-1)
		for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
		return r;
	end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
		if (#x ~= 8) then return '' end
		local c=0
		for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
		return string.char(c)
	end))
end

function resource.AddDir(dir, recursive)
	local files, folders = file.Find(dir .. '*', 'GAME')

	for k, v in ipairs(files) do
		-- resource.AddFile(dir .. v)
	end
	if (recursive == true) then
		for k, v in ipairs(folders) do
			resource.AddDir(dir .. v, recursive)
		end
	end
end

function IsValid(object)
	if (not object) then return false end

	local isvalid = object.IsValid
	if (not isvalid) then return false end

	return isvalid(object)
end
--PATH addons/dash/lua/dash/extensions/client/string.lua:
local surface_SetFont 		= surface.SetFont
local surface_GetTextSize 	= surface.GetTextSize
local string_Explode 		= string.Explode
local ipairs 				= ipairs

function string.Wrap(font, text, width)
	surface_SetFont(font)
		
	local sw = surface_GetTextSize(' ')
	local ret = {}
		
	local w = 0
	local s = ''

	local t = string_Explode('\n', text)
	for i = 1, #t do
		local t2 = string_Explode(' ', t[i], false)
		for i2 = 1, #t2 do
			local neww = surface_GetTextSize(t2[i2])
				
			if (w + neww >= width) then
				ret[#ret + 1] = s
				w = neww + sw
				s = t2[i2] .. ' '
			else
				s = s .. t2[i2] .. ' '
				w = w + neww + sw
			end
		end
		ret[#ret + 1] = s
		w = 0
		s = ''
	end
		
	if (s ~= '') then
		ret[#ret + 1] = s
	end

	return ret
end
--PATH addons/dash/lua/dash/extensions/client/util.lua:
local name = GetConVar('sv_skyname'):GetString()
local areas = {'lf', 'ft', 'rt', 'bk', 'dn', 'up'}
local maerials = {
	Material('skybox/'.. name .. 'lf'),
	Material('skybox/'.. name .. 'ft'),
	Material('skybox/'.. name .. 'rt'),
	Material('skybox/'.. name .. 'bk'),
	Material('skybox/'.. name .. 'dn'),
	Material('skybox/'.. name .. 'up'),
}
	 
function util.SetSkybox(skybox) -- Thanks someone from some fp post I cant find
	for i = 1, 6 do
		maerials[i]:SetTexture('$basetexture', Material('skybox/' .. skybox .. areas[i]):GetTexture('$basetexture'))
	end
end	
--PATH addons/__________tperson/lua/autorun/3t_loader.lua:
TPerson = TPerson or {
	['Path'] = '3tcore',
	['Color'] = {}
}

local function includeFile(file, module)
	if file == nil or not isstring(file) then return end
	module = isstring(module) and module .. '/' or ''
	local ext = string.sub(file, 1, 3)
	if ext == 'cl_' or ext == 'sh_' then
		if SERVER then
			AddCSLuaFile(module .. file)
		else
			include(module .. file)
		end
	end

	if (ext == 'sv_' or ext == 'sh_') and SERVER then include(module .. file) end
end

local function RunModule(module)
	local files, children = file.Find(module .. '/*', 'LUA')
	for _, f in ipairs(files) do
		includeFile(f, module)
	end

	if children then
		for _, child in ipairs(children) do
			RunModule(module .. '/' .. child)
		end
	end
end

local _, modules = file.Find(TPerson.Path .. '/*', 'LUA')
includeFile('sh_config.lua', TPerson.Path)

for _, module in ipairs(modules) do
	RunModule(TPerson.Path .. '/' .. module)
end
--PATH addons/__________tperson/lua/3tcore/data/cl_crosshair.lua:
local crosshair = {}
function TPerson.GetCrossHairs()
    return table.Copy(crosshair)
end

function TPerson.GetChrossHair()
    return crosshair[TPerson.GetConfig()['crosshair']['style']]
end

function TPerson.RegisterCrossHair(newCrosshair)
    crosshair[#crosshair + 1] = newCrosshair
end

TPerson.RegisterCrossHair({
    ['paint'] = function(x, y, w, h, color, scaleSpace, scaleHeight, scaleWidth)
        surface.SetDrawColor(color)
        surface.DrawRect(x - (scaleSpace * 2), y - (scaleSpace * 2), scaleWidth * 4, scaleHeight * 4)
    end
})

TPerson.RegisterCrossHair({
    ['paint'] = function(x, y, w, h, color, scaleSpace, scaleHeight, scaleWidth)
        surface.SetDrawColor(color)
        local space = scaleSpace * 1
        w = scaleWidth * 5
        h = scaleHeight * 2
        -- LEFT
        surface.DrawRect(x - (space + w), y - h * 0.5, w, h)
        -- RIGHT
        surface.DrawRect(x + space, y - h * 0.5, w, h)
        -- TOP
        surface.DrawRect(x - h * 0.5, y - (space + w), h, w)
        -- BOT
        surface.DrawRect(x - h * 0.5, y + space, h, w)
    end
})

TPerson.RegisterCrossHair({
    ['paint'] = function(x, y, w, h, color, scaleSpace, scaleHeight, scaleWidth)
        surface.SetDrawColor(color)
        local space = scaleSpace * 5
        w = scaleWidth * 5
        h = scaleHeight * 2
        -- LEFT
        surface.DrawRect(x - (space + w), y - h * 0.5, w, h)
        -- RIGHT
        surface.DrawRect(x + space, y - h * 0.5, w, h)
        -- TOP
        surface.DrawRect(x - h * 0.5, y - (space + w), h, w)
        -- BOT
        surface.DrawRect(x - h * 0.5, y + space, h, w)
    end
})

TPerson.RegisterCrossHair({
    ['paint'] = function(x, y, w, h, color, scaleSpace, scaleHeight, scaleWidth)
        surface.SetDrawColor(color)
        local space = scaleSpace * 5
        w = scaleWidth * 5
        h = scaleHeight * 2
        -- LEFT
        surface.DrawRect(x - (space + w), y - h * 0.5, w, h)
        -- RIGHT
        surface.DrawRect(x + space, y - h * 0.5, w, h)
        -- TOP
        surface.DrawRect(x - h * 0.5, y - (space + w), h, w)
        -- BOT
        surface.DrawRect(x - h * 0.5, y + space, h, w)
        -- MID
        surface.DrawRect(x - h * 0.5, y - h * 0.5, h, h)
    end
})

TPerson.RegisterCrossHair({
    ['paint'] = function(x, y, w, h, color, scaleSpace, scaleHeight, scaleWidth)
        surface.SetDrawColor(color)
        w, h = scaleWidth * 20, scaleHeight * 1
        -- HORI
        surface.DrawRect(x - (w * 0.5), y - (h * 0.5), w, h)
        -- VERTI
        surface.DrawRect(x - (h * 0.5), y - (w * 0.5), h, w)
    end
})

TPerson.RegisterCrossHair({
    ['paint'] = function(x, y, w, h, color, scaleSpace, scaleHeight, scaleWidth)
        surface.DrawCircle(x, y, scaleWidth * 1, color)
        surface.DrawCircle(x, y, scaleWidth * 10, color)
        surface.DrawCircle(x, y, scaleWidth * 11, color)
    end
})

local arrow = Material('gui/point.png')
TPerson.RegisterCrossHair({
    ['paint'] = function(x, y, w, h, color, scaleSpace, scaleHeight, scaleWidth)
        local size = scaleWidth * 10
        local space = scaleSpace * 5
        surface.SetDrawColor(color)
        surface.SetMaterial(arrow)
        surface.DrawTexturedRect(x - size * 0.5, y - space - size, size, size * 0.5)
        surface.DrawTexturedRectRotated(x, y + space + size * 0.75, size, size * 0.5, 180)
        surface.DrawTexturedRectRotated(x - space - size * 0.75, y, size, size * 0.5, 90)
        surface.DrawTexturedRectRotated(x + space + size * 0.75, y, size, size * 0.5, -90)
    end
})

TPerson.RegisterCrossHair({
    ['paint'] = function(x, y, w, h, color, scaleSpace, scaleHeight, scaleWidth)
        local size = scaleWidth * 10
        local space = scaleSpace * 5
        surface.SetDrawColor(color)
        surface.SetMaterial(arrow)
        surface.DrawCircle(x, y, 1, color) -- Center
        surface.DrawTexturedRect(x - size * 0.5, y - space - size, size, size * 0.5)
        surface.DrawTexturedRectRotated(x, y + space + size * 0.75, size, size * 0.5, 180)
        surface.DrawTexturedRectRotated(x - space - size * 0.75, y, size, size * 0.5, 90)
        surface.DrawTexturedRectRotated(x + space + size * 0.75, y, size, size * 0.5, -90)
    end
})

TPerson.RegisterCrossHair({
    ['paint'] = function(x, y, w, h, color, scaleSpace, scaleHeight, scaleWidth)
        local size = scaleWidth * 10
        local space = scaleSpace * 5
        surface.SetDrawColor(color)
        surface.SetMaterial(arrow)
        surface.DrawCircle(x, y, 1, color) -- Center
        surface.DrawCircle(x, y, size + space, color) -- Outer
        surface.DrawTexturedRect(x - size * 0.5, y - space - size, size, size * 0.5)
        surface.DrawTexturedRectRotated(x, y + space + size * 0.75, size, size * 0.5, 180)
        surface.DrawTexturedRectRotated(x - space - size * 0.75, y, size, size * 0.5, 90)
        surface.DrawTexturedRectRotated(x + space + size * 0.75, y, size, size * 0.5, -90)
    end
})
--PATH addons/__________tperson/lua/3tcore/data/cl_storage.lua:
local config
function TPerson.GetConfig()
    return config
end

function TPerson.SaveConfig(newConfig)
    if not newConfig or not TPerson.IsValidConfig(newConfig) then return false end
    config = newConfig
    file.Write('third_config.json', util.TableToJSON(config))
    chat.AddText(color_white, 'Ваші налаштування були збережені!')
    net.Start('TPerson:ToServer')
    net.WriteUInt(1, 3)
    net.WriteTable(config)
    net.SendToServer()
end

function TPerson.IsValidConfig(config)
    if not config or not istable(config) then return false end
    if not config['key'] or not isnumber(config['key']) then return false end
    if not config['view'] or not istable(config['view']) then return false end
    if not config['crosshair'] or not istable(config['crosshair']) then return false end
    if not config['crosshair'] or not isnumber(config['crosshair']['style']) then return false end
    local crosshairs = TPerson.GetCrossHairs()
    if crosshairs then
        local tr = crosshairs[config['crosshair']['style']]
        if not tr or tr['whitelist'] and (not tr['whitelist'][LocalPlayer():GetUserGroup()] and not tr['whitelist'][LocalPlayer():SteamID()]) then return false end
    end

    if not config['crosshair'] or not istable(config['crosshair']['color']) then return false end
    if not config['crosshair'] or not isnumber(config['crosshair']['sSpace']) then return false end
    if not config['crosshair'] or not isnumber(config['crosshair']['sWidth']) then return false end
    if not config['crosshair'] or not isnumber(config['crosshair']['sHeight']) then return false end
    if not config['crosshair'] or not isnumber(config['crosshair']['color']['r']) then return false end
    if not config['crosshair'] or not isnumber(config['crosshair']['color']['g']) then return false end
    if not config['crosshair'] or not isnumber(config['crosshair']['color']['b']) then return false end
    if not config['crosshair'] or not isnumber(config['crosshair']['color']['a']) then return false end
    if not config['view']['right'] or not isnumber(config['view']['right']) then return false end
    if not config['view']['up'] or not isnumber(config['view']['forward']) then return false end
    if not config['view']['forward'] or not isnumber(config['view']['forward']) then return false end
    if not config['allow'] or not istable(config['allow']) then return false end
    if config['allow']['third'] == nil or not isbool(config['allow']['third']) then return false end
    if config['allow']['crosshair1p'] == nil or not isbool(config['allow']['crosshair1p']) then return false end
    if config['allow']['crosshair3p'] == nil or not isbool(config['allow']['crosshair3p']) then return false end
    if config['allow']['cOnAiming'] == nil or not isbool(config['allow']['cOnAiming']) then return false end
    if config['allow']['tOnAiming'] == nil or not isbool(config['allow']['tOnAiming']) then return false end
    if config['allow']['tOnSpawn'] == nil or not isbool(config['allow']['tOnSpawn']) then return false end
    return true
end

function TPerson.ResetConfig()
    file.Write('third_config.json', util.TableToJSON(TPerson.DefaultSettings))
    config = TPerson.DefaultSettings
    config['crosshair']['color'] = Color(config['crosshair']['color']['r'], config['crosshair']['color']['g'], config['crosshair']['color']['b'], config['crosshair']['color']['a'])
    chat.AddText(color_white, 'Ваші налаштування було скинуто!')
end

local function Recursive(tbl1, tbl2)
    local equal = true
    for _, data in pairs(tbl1) do
        if istable(data) then
            equal = Recursive(data, tbl2[_])
            if not equal then break end
        else
            if tbl2[_] == nil or tbl2[_] ~= data then
                equal = false
                break
            end
        end
    end
    return equal
end

function TPerson.EqualToActual(newConfig)
    if not newConfig or not istable(newConfig) then return false end
    return Recursive(newConfig, config)
end

local function loadDefaultConfig()
    timer.Simple(1, function()
        if not file.Exists('third_config.json', 'DATA') then
            TPerson.ResetConfig()
        else
            local userC = util.JSONToTable(file.Read('third_config.json', 'DATA'))
            if TPerson.IsValidConfig(userC) then
                config = userC
                config['crosshair']['color'] = Color(config['crosshair']['color']['r'], config['crosshair']['color']['g'], config['crosshair']['color']['b'], config['crosshair']['color']['a'])
            else
                TPerson.ResetConfig()
            end
        end

        net.Start('TPerson:ToServer')
        net.WriteUInt(1, 3)
        net.WriteTable(config)
        net.SendToServer()
        TPerson.OnPlayerSpawn({
            ['userid'] = LocalPlayer():UserID()
        })
    end)
end

hook.Add('InitPostEntity', 'TPerson:InitSystem', loadDefaultConfig)
--PATH addons/shaccessorysystem/lua/accessory/cl_accessory.lua:
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
	if (!self.DrawOnArrested and ply.isArrested and ply:isArrested()) then
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

	if (ply ~= MySelf) then
		local dist = SH_ACC.RenderDistance
		if (dist > 0) then
			local mypos = MySelf:GetPos()
			if (mypos:Distance(ply:GetPos()) >= dist) then
				return end
		end
	end

	SH_ACC:DrawAccessories(ply, ply)
end)

gameevent.Listen("player_disconnect")

hook.Add("player_disconnect", "SH_ACC.player_disconnect", function(data)
	for _, v in ents.Iterator() do
		if (IsValid(v) and v.m_sAccOwner and v.m_sAccOwner == data.networkid) then
			SafeRemoveEntity(v)
		end
	end
end)

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

--PATH addons/shaccessorysystem/lua/accessory_offsets.lua:
-- Whenever you add a new model as an accessory, you NEED to register at least one offset (the "default" offset) which
-- will position your model on every player model. Without the "default" offset the add-on will throw an error and that's bad.
-- This is also where you position models manually for specific models. It can be very tedious to do so I recommend you
-- contact the author (http://steamcommunity.com/id/shendow/) before touching anything.

-- every little character counts
local B_HEAD = "ValveBiped.Bip01_Head1"
local B_SPINE2 = "ValveBiped.Bip01_Spine2"

local V = Vector
local A = Angle

function SH_ACC:GetOffset(mdl, ply)
	if (!self.Offsets[mdl]) then
		return false
	end

	return self.Offsets[mdl][ply:GetModel():lower()] or self.Offsets[mdl].default or false
end

function SH_ACC:GetModelOffset(bone, ply)
	local mdl = self.ModelOffsets[ply:GetModel():lower()]
	if (!mdl or !mdl[bone]) then
		return false
	end

	return mdl[bone]
end

function SH_ACC:DefineOffsetEasy(mdl, bone, pos, ang)
	self.Offsets[mdl] = {
		default = {
			bone = bone,
			pos = pos,
			ang = ang,
		}
	}
end

local function Offset(...)
	SH_ACC:DefineOffsetEasy(...)
end

/*
	PREDEFINED OFFSETS
*/

SH_ACC.Offsets = {}

-- ADDON: [GTA V] Giant Accessories Pack
Offset("models/modified/hat07.mdl", B_HEAD, V(4.8, -0.5, 0.2), A(0, -70, -90))
Offset("models/modified/hat08.mdl", B_HEAD, V(4.2, -0, 0.2), A(0, -80, -90))
Offset("models/sal/acc/fix/beerhat.mdl", B_HEAD, V(3, 0, 0.2), A(0, -75, -90))
Offset("models/modified/glasses01.mdl", B_HEAD, V(2, -0.1, 0.05), A(180, 110, 90))
Offset("models/modified/bandana.mdl", B_HEAD, V(-1.9, 1.5, 0), A(180, 110, 90))
Offset("models/modified/backpack_1.mdl", B_SPINE2, V(1.5, -4.2, 0), A(0, 80, 90))
Offset("models/modified/backpack_2.mdl", B_SPINE2, V(2, -4, 0), A(0, 80, 90))
Offset("models/modified/backpack_3.mdl", B_SPINE2, V(1.5, -4.2, 0), A(0, 80, 90))
Offset("models/sal/cat.mdl", B_HEAD, V(2, 0.5, 0), A(180, 110, 90))
Offset("models/sal/fox.mdl", B_HEAD, V(1.1, 0.5, 0), A(180, 110, 90))
Offset("models/sal/gingerbread.mdl", B_HEAD, V(0.5, 1, 0), A(180, 110, 90))
Offset("models/sal/acc/fix/scarf01.mdl", "ValveBiped.Bip01_Neck1", V(-18, 14, 0), A(180, 120, 90))
Offset("models/modified/headphones.mdl", B_HEAD, V(2.3, 0.8, 0), A(180, 110, 90))
Offset("models/sal/acc/fix/cheafhat.mdl", B_HEAD, V(7, 0, 0.4), A(180, 90, 90))
Offset("models/sal/halloween/bag.mdl", B_HEAD, V(0.5, 0.66, 0), A(180, 110, 90))
Offset("models/sal/halloween/bagr.mdl", B_HEAD, V(0.5, 0.66, 0), A(180, 110, 90))
Offset("models/sal/halloween/doctor.mdl", B_HEAD, V(0, -0.1, 0.05), A(180, 110, 90))
Offset("models/sal/halloween/headwrap1.mdl", B_HEAD, V(0.6, 1.6, 0), A(180, 110, 90))
Offset("models/modified/hat01_fix.mdl", B_HEAD, V(4.4, -0.7, 0.2), A(0, -70, -90))
Offset("models/modified/hat03.mdl", B_HEAD, V(4.4, -0.7, 0), A(0, -60, -90))
Offset("models/modified/hat04.mdl", B_HEAD, V(4.2, -2.1, 0), A(0, -60, -90))
Offset("models/modified/hat06.mdl", B_HEAD, V(5.3, -1, 0), A(0, -80, -90))
Offset("models/modified/mask5.mdl", B_HEAD, V(0.5, 1.2, 0.05), A(180, 110, 90))
Offset("models/sal/hawk_1.mdl", B_HEAD, V(-1.5, 1, 0.2), A(180, 110, 90))
Offset("models/sal/pig.mdl", B_HEAD, V(0.1, 0.5, 0), A(180, 105, 90))
Offset("models/sal/wolf.mdl", B_HEAD, V(-1, 1, 0), A(180, 105, 90))
Offset("models/sal/acc/fix/mask_1.mdl", B_HEAD, V(-62.5, 17.7, 0), A(180, 105, 90))
Offset("models/sal/acc/fix/mask_4.mdl", B_HEAD, V(0.2, 1, 0.05), A(180, 110, 90))
Offset("models/sal/halloween/monkey.mdl", B_HEAD, V(0.2, 0.8, 0), A(180, 110, 90))
Offset("models/sal/halloween/ninja.mdl", B_HEAD, V(-0.3, 0.8, 0.1), A(180, 110, 90))

-- ADDON: GMod Tower: Accessories Pack
Offset("models/captainbigbutt/skeyler/accessories/glasses04.mdl", B_HEAD, V(2.5, 2.8, 0.05), A(180, 110, 90))
Offset("models/captainbigbutt/skeyler/hats/strawhat.mdl", B_HEAD, V(5.08, -0.37, 0), A(0, 108.00, 90))
Offset("models/gmod_tower/aviators.mdl", B_HEAD, V(3.26, 1.73, 0), A(180, 98.26, 90))
Offset("models/captainbigbutt/skeyler/hats/sunhat.mdl", B_HEAD, V(5.02, 2.44, 1.50), A(-40.60, 129.64, 90))
Offset("models/captainbigbutt/skeyler/accessories/glasses03.mdl", B_HEAD, V(2.68, 3.56, 0), A(180, 114.32, 90))
Offset("models/captainbigbutt/skeyler/hats/cowboyhat.mdl", B_HEAD, V(6.07, -0.73, 0), A(180, 113.41, 90))
Offset("models/gmod_tower/starglasses.mdl", B_HEAD, V(3.23, 2.50, 0), A(180, 100.50, 90))
Offset("models/gmod_tower/fairywings.mdl", B_SPINE2, V(0, -0.67, 0), A(-91.86, 0, 0))
Offset("models/captainbigbutt/skeyler/hats/cat_ears.mdl", B_HEAD, V(2.53, 0, 0), A(180, 90, 90))
Offset("models/captainbigbutt/skeyler/hats/afro.mdl", "ValveBiped.Bip01_Head1", Vector(2.10871, 0, 0), Angle(180, 90, 90))
Offset("models/captainbigbutt/skeyler/hats/cat_hat.mdl", "ValveBiped.Bip01_Head1", Vector(5.43, 0.36, 0), Angle(180, 90, 90))
Offset("models/captainbigbutt/skeyler/hats/deadmau5.mdl", "ValveBiped.Bip01_Head1", Vector(3.87, 0.705, 0), Angle(180, 90, 90))
Offset("models/captainbigbutt/skeyler/hats/bear_hat.mdl", "ValveBiped.Bip01_Head1", Vector(5.79, -0.189, 0), Angle(180, 99.9, 90))
Offset("models/captainbigbutt/skeyler/hats/frog_hat.mdl", "ValveBiped.Bip01_Head1", Vector(5.29, -0.6, 0), Angle(180, 99.9, 90))
Offset("models/captainbigbutt/skeyler/hats/maid_headband.mdl", "ValveBiped.Bip01_Head1", Vector(3.25, 0, 0), Angle(-180, 90, 90))
Offset("models/captainbigbutt/skeyler/hats/zhat.mdl", "ValveBiped.Bip01_Head1", Vector(3.97, -0.36, 0), Angle(161, 101, 101))
Offset("models/gmod_tower/3dglasses.mdl", "ValveBiped.Bip01_Head1", Vector(2.89, 1.8, 0), Angle(180, 103, 90))
Offset("models/gmod_tower/partyhat.mdl", "ValveBiped.Bip01_Head1", Vector(6.78, 0, 0.72), Angle(180, 101, 76.8))

-- ADDON: Horse Mask Prop
Offset("models/horsie/horsiemask.mdl", "ValveBiped.Bip01_Head1", Vector(3.52, 3.37, 0), Angle(-90, 0, -26.9))

-- ADDON: Alienware mask from PAYDAY 2
Offset("models/snowzgmod/payday2/masks/maskalienware.mdl", "ValveBiped.Bip01_Head1", Vector(2.66, 4.33, 0), Angle(0, -90, -90))

-- ADDON: Freddy Mask SWEP
Offset("models/errolliamp/five_nights_at_freddys/freddy_mask.mdl", "ValveBiped.Bip01_Head1", Vector(-2.19, 1.05, 0), Angle(-180, 77.7, 90))

-- ADDON: MGS V TPP Venom's Respirator
Offset("models/mgsv/gear/venom_respirator.mdl", "ValveBiped.Bip01_Head1", Vector(0.36, 2.88, 0), Angle(180, 116, 90))

-- ADDON: Pirate Hat Model
Offset("models/piratehat/piratehat.mdl", "ValveBiped.Bip01_Head1", Vector(3.59, 0.746, 0), Angle(0, 109, 90))

-- ADDON: Detective Hat Model
Offset("models/ttt/deerstalker.mdl", "ValveBiped.Bip01_Head1", Vector(-1.84, 0.364, 0), Angle(0, 3.62, 0))

-- ADDON: MGS V TPP Chicken Hat
Offset("models/chicken_hat/chicken_hat.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0.72, 0), Angle(0, -71.8, -90))

-- ADDON: Polished Military Beret- FO3 HAT
Offset("models/fallout 3/polish_beret.mdl", "ValveBiped.Bip01_Head1", Vector(6.13, 1.77, 1.49), Angle(0, -90, -90))

-- ADDON: Animal masks from PAYDAY 2
Offset("models/snowzgmod/payday2/masks/maskarnold.mdl", "ValveBiped.Bip01_Head1", Vector(2.52, 3.97, 0), Angle(0, -90, -90))

-- ADDON: Wrench Mask
Offset("models/models/wrenchmask.mdl", "ValveBiped.Bip01_Head1", Vector(-1.37, 6.3, 0), Angle(0, -70.6, -90))

-- ADDON: Russian hat/Ushanka prop
Offset("models/russianhat1.mdl", "ValveBiped.Bip01_Head1", Vector(-6.12, -0.2, 0), Angle(180, -92.9, -90))

-- ADDON: GTA IV Bike Helmets
Offset("models/dean/gtaiv/helmet.mdl", "ValveBiped.Bip01_Head1", Vector(2.88, 0, 0), Angle(0, -90, -90))

-- ADDON: Halloween_Pumpkin
Offset("models/props/pumpkin_z.mdl", "ValveBiped.Bip01_Head1", Vector(3.98, 0, 0), Angle(0, -90, -90))

-- Offset copies
SH_ACC.Offsets["models/sal/bear.mdl"] = SH_ACC.Offsets["models/sal/cat.mdl"]
SH_ACC.Offsets["models/sal/owl.mdl"] = SH_ACC.Offsets["models/sal/fox.mdl"]
SH_ACC.Offsets["models/sal/penguin.mdl"] = SH_ACC.Offsets["models/sal/fox.mdl"]
SH_ACC.Offsets["models/sal/halloween/headwrap2.mdl"] = SH_ACC.Offsets["models/sal/halloween/headwrap1.mdl"]
SH_ACC.Offsets["models/modified/mask6.mdl"] = SH_ACC.Offsets["models/modified/mask5.mdl"]
SH_ACC.Offsets["models/sal/hawk_2.mdl"] = SH_ACC.Offsets["models/sal/hawk_1.mdl"]
SH_ACC.Offsets["models/sal/acc/fix/mask_2.mdl"] = SH_ACC.Offsets["models/modified/mask5.mdl"]
SH_ACC.Offsets["models/captainbigbutt/skeyler/hats/bunny_ears.mdl"] = SH_ACC.Offsets["models/captainbigbutt/skeyler/hats/cat_ears.mdl"]
SH_ACC.Offsets["models/captainbigbutt/skeyler/hats/heartband.mdl"] = SH_ACC.Offsets["models/captainbigbutt/skeyler/hats/maid_headband.mdl"]
SH_ACC.Offsets["models/captainbigbutt/skeyler/hats/starband.mdl"] = SH_ACC.Offsets["models/captainbigbutt/skeyler/hats/maid_headband.mdl"]
SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskbabyrhino.mdl"] = SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskarnold.mdl"]
SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskchuck.mdl"] = SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskarnold.mdl"]
SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskdolph.mdl"] = SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskarnold.mdl"]
SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskjeanclaude.mdl"] = SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskarnold.mdl"]
SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskmark.mdl"] = SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskarnold.mdl"]
SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskmonkeybusiness.mdl"] = SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskarnold.mdl"]
SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskthehog.mdl"] = SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskarnold.mdl"]

-- You shouldn't have to modify this.
-- These are model-specific bone offsets for when you have a model slightly different in a set of otherwise identical models
SH_ACC.ModelOffsets = {
	["models/player/breen.mdl"] = {
		[B_HEAD] = {
			pos = V(-1, 0.2, 0)
		},
	},
	["models/player/alyx.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.8, -0.4, 0)
		},
	},
	["models/player/p2_chell.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.8, -0.3, 0)
		},
	},
	["models/player/barney.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.25, 0.2, 0)
		},
	},
	["models/player/monk.mdl"] = {
		[B_HEAD] = {
			pos = V(0.5, -0.5, 0)
		},
	},
	["models/player/gman_high.mdl"] = {
		[B_HEAD] = {
			pos = V(0.8, 0, 0)
		},
	},
	["models/player/odessa.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.1, 0.65, 0)
		},
	},
	["models/player/mossman.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.8, -0.2, 0)
		},
	},
	["models/player/eli.mdl"] = {
		[B_HEAD] = {
			pos = V(0, -0.5, 0)
		},
	},
	["models/player/charple.mdl"] = {
		[B_HEAD] = {
			pos = V(0, -1.5, 0)
		},
	},
	["models/player/soldier_stripped.mdl"] = {
		[B_HEAD] = {
			pos = V(-1.2, -1.2, 0)
		},
	},

	["models/player/group01/male_01.mdl"] = {
		[B_HEAD] = {
			pos = V(0, 0.85, 0)
		},
	},
	["models/player/group01/male_03.mdl"] = {
		[B_HEAD] = {
			pos = V(0.25, 0, 0)
		},
	},
	["models/player/group01/male_06.mdl"] = {
		[B_HEAD] = {
			pos = V(0.35, 1, 0)
		},
	},
	["models/player/group01/female_01.mdl"] = {
		[B_HEAD] = {
			pos = V(-1, 0.33, 0)
		},
		[B_SPINE2] = {
			pos = V(-2, 1, 0)
		},
	},
	["models/player/group01/female_02.mdl"] = {
		[B_HEAD] = {
			pos = V(-1, 0.5, 0)
		},
		[B_SPINE2] = {
			pos = V(-2, 1, 0)
		},
	},
	["models/player/group01/female_03.mdl"] = {
		[B_HEAD] = {
			pos = V(-1.1, 0.0, 0)
		},
		[B_SPINE2] = {
			pos = V(-2, 1, 0)
		},
	},
	["models/player/group01/female_04.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.8, 0.5, 0)
		},
		[B_SPINE2] = {
			pos = V(-2, 1, 0)
		},
	},
}
SH_ACC.ModelOffsets["models/player/group01/male_04.mdl"] = SH_ACC.ModelOffsets["models/player/group01/male_03.mdl"]
SH_ACC.ModelOffsets["models/player/group01/female_05.mdl"] = SH_ACC.ModelOffsets["models/player/group01/female_03.mdl"]
SH_ACC.ModelOffsets["models/player/group01/female_06.mdl"] = SH_ACC.ModelOffsets["models/player/group01/female_01.mdl"]
SH_ACC.ModelOffsets["models/player/mossman_arctic.mdl"] = SH_ACC.ModelOffsets["models/player/mossman.mdl"]

/*
	CUSTOM OFFSETS
	Place your custom offsets here!
*/

Offset("models/player/items/humans/top_hat.mdl", B_HEAD, V(0, 1.43, 0), A(0, 113.47, 90))

hook.Add('GM.EndLoading', 'LoadingHat2', function()
	if IS_SERVER == 1 then
		Offset("models/hannya_mask_skull/hannya_mask_skull.mdl", B_HEAD, V(0, 1.43, 0), A(0, 293.47, 270))
	end
end)

-- Refresh the offsets
if (_FIRST_OFFSETS) then
	for _, v in ipairs (player.GetAll()) do
		if (v.SH_Accessories) then
			for id, cs in pairs (v.SH_Accessories) do
				local offset = SH_ACC:GetOffset(cs.m_sModel, v)
				cs.m_Offset = offset
			end
		end
	end
else
	_FIRST_OFFSETS = true
end

--PATH addons/shaccessorysystem/lua/accessory_list.lua:
-- This is the accessory list. It comes with accessories from a few add-ons (which can be enabled in accessory_addons.lua).
-- If you want to add a new accessory, you can use the SH_ACC:AddAccessory function.
-- To register an accessory, the id, model and slots are mandatory.
-- "id" is an unique identifier for the accessory.
-- "model" is the model of the accessory. Multi-model accessories are not supported.
-- "slots" are the slots that the accessory occupies. A slot may have only one accessory at a time (normally). An accessory can occupy multiple slots (a full face mask for example)
-- There are other settings such as:
-- "name", "price", "skin", "bodygroups", "material", "color", "scale", "canPurchase", "canSell",
-- "usergroups", "steamids", "jobs", "jobsexclude"
-- ...but these are optional.
-- After registering your entity, you need to set up an offset in accessory_offsets.lua
SH_SLOT_HEAD = 1
SH_SLOT_EYES = 2
SH_SLOT_MOUTH = 4
SH_SLOT_BACK = 8
SH_SLOT_NECK = 16
SH_ACC.List = {}
local precached = {}

function SH_ACC:AddAccessory(id, data)
	local mdl = data.mdl
	local slots = data.slot or data.slots
	assert(id and id ~= "", "empty accessory id")
	assert(mdl and id ~= "", "empty model name")
	assert(slots and slots > 0, "unassigned slot")
	local name = data.name or "Accessory"
	local price = data.price or 0
	local skin = data.skin or 0
	local bodygroups = data.bodygroups or {}
	local material = data.material or ""
	local color = data.color or Color(255, 255, 255)
	local scale = data.scale or 1
	local canPurchase = data.canPurchase or nil
	local canSell = data.canSell or nil
	local usergroups = data.usergroups or nil
	local steamids = data.steamids or nil
	assert(self.List[id] == nil, "accessory with id '" .. id .. "' already exists")

	self.List[id] = {
		id = id,
		mdl = mdl:lower(),
		slots = slots,
		name = name,
		price = price,
		skin = skin,
		bodygroups = bodygroups,
		material = material,
		color = color,
		scale = scale,
		canPurchase = canPurchase,
		canSell = canSell,
		usergroups = usergroups,
		steamids = steamids,
	}

	if not precached[mdl] then
		util.PrecacheModel(mdl)
		precached[mdl] = true
	end

	return self.List[id]
end

function SH_ACC:GetAccessory(id)
	return self.List[id]
end

function SH_ACC:CopyAccessory(id, acc, data)
	local newacc = table.Copy(acc)

	for k, v in pairs(data) do
		newacc[k] = v
	end

	return self:AddAccessory(id, newacc)
end

local New = function(...) return SH_ACC:AddAccessory(...) end
local Copy = function(...) return SH_ACC:CopyAccessory(...) end

--[[
	ADDON
	[GTA V] Giant Accessories Pack
]]
-- Head
local a = New("symbolcap1", {
	name = "Cap [Gray F]",
	price = 15000000,
	mdl = "models/modified/hat07.mdl",
	slot = SH_SLOT_HEAD
})

Copy("symbolcap2", a, {
	name = "Cap [Black F]",
	skin = 1,
	price = 15000000
})

Copy("symbolcap3", a, {
	name = "Cap [Light Gray C]",
	skin = 2,
	price = 15000000
})

Copy("symbolcap4", a, {
	name = "Cap [White LS]",
	skin = 3,
	price = 15000000
})

Copy("symbolcap5", a, {
	name = "Cap [Green Feud]",
	skin = 4,
	price = 15000000
})

Copy("symbolcap6", a, {
	name = "Cap [Kaki Magnetics]",
	skin = 5,
	price = 15000000
})

Copy("symbolcap7", a, {
	name = "Cap [Brown OG]",
	skin = 6,
	price = 15000000
})

Copy("symbolcap8", a, {
	name = "Cap [Blue Stank]",
	skin = 7,
	price = 15000000
})

Copy("symbolcap9", a, {
	name = "Cap [Olive Knight]",
	skin = 8,
	price = 15000000
})

Copy("symbolcap10", a, {
	name = "Cap [Dark Blue Monkey]",
	skin = 9,
	price = 15000000
})

Copy("symbolcap11", a, {
	name = "Cap [Dark Green Football]",
	skin = 10,
	price = 15000000
})

local a = New("symbolcap12", {
	name = "Cap [Orange LH]",
	price = 15000000,
	mdl = "models/modified/hat08.mdl",
	slot = SH_SLOT_HEAD
})

Copy("symbolcap13", a, {
	name = "Cap [Censored]",
	skin = 1,
	price = 15000000
})

Copy("symbolcap14", a, {
	name = "Cap [The Nut House]",
	skin = 2,
	price = 15000000
})

Copy("symbolcap15", a, {
	name = "Cap [Rusty Browns]",
	skin = 3,
	price = 15000000
})

Copy("symbolcap16", a, {
	name = "Cap [Bishop's]",
	skin = 4,
	price = 15000000
})

Copy("symbolcap17", a, {
	name = "Cap [247]",
	skin = 5,
	price = 15000000
})

Copy("symbolcap18", a, {
	name = "Cap [Fruit Basket]",
	skin = 6,
	price = 15000000
})

Copy("symbolcap19", a, {
	name = "Cap [Ron]",
	skin = 7,
	price = 15000000
})

Copy("symbolcap20", a, {
	name = "Cap [Meteorite]",
	skin = 8,
	price = 15000000
})

Copy("symbolcap21", a, {
	name = "Cap [Dusche Gold]",
	skin = 9,
	price = 15000000
})

Copy("symbolcap22", a, {
	name = "Cap [Vespucci Beach]",
	skin = 10,
	price = 15000000
})

Copy("symbolcap23", a, {
	name = "Cap [Orang-O-Tang]",
	skin = 11,
	price = 15000000
})

local a = New("beerhat1", {
	name = "Beer Hat [Pisswasser]",
	price = 30000000,
	mdl = "models/sal/acc/fix/beerhat.mdl",
	slot = SH_SLOT_HEAD
})

Copy("beerhat2", a, {
	name = "Beer Hat [Supa Wet]",
	skin = 1,
	price = 30000000
})

Copy("beerhat3", a, {
	name = "Beer Hat [Patriot]",
	skin = 2,
	price = 30000000
})

Copy("beerhat4", a, {
	name = "Beer Hat [Benedict]",
	skin = 3,
	price = 30000000
})

Copy("beerhat5", a, {
	name = "Beer Hat [Blarneys]",
	skin = 4,
	price = 30000000
})

Copy("beerhat6", a, {
	name = "Beer Hat [J Lager]",
	skin = 5,
	price = 30000000
})

local a = New("headphones1", {
	name = "Headphones [Red]",
	price = 20000000,
	mdl = "models/modified/headphones.mdl",
	slot = SH_SLOT_HEAD
})

Copy("headphones2", a, {
	name = "Headphones [Pink]",
	skin = 1,
	price = 20000000
})

Copy("headphones3", a, {
	name = "Headphones [Green]",
	skin = 2,
	price = 20000000
})

Copy("headphones4", a, {
	name = "Headphones [Yellow]",
	skin = 3,
	price = 20000000
})

New("chefhat", {
	name = "Chef's Hat",
	price = 75000000,
	mdl = "models/sal/acc/fix/cheafhat.mdl",
	slot = SH_SLOT_HEAD
})

local a = New("fedora1", {
	name = "Fedora [Gray]",
	price = 33333333,
	mdl = "models/modified/hat01_fix.mdl",
	slot = SH_SLOT_HEAD
})

Copy("fedora2", a, {
	name = "Fedora [Black]",
	skin = 1,
	price = 33333333
})

Copy("fedora3", a, {
	name = "Fedora [White]",
	skin = 2,
	price = 33333333
})

Copy("fedora4", a, {
	name = "Fedora [Yellow]",
	skin = 3,
	price = 33333333
})

Copy("fedora5", a, {
	name = "Fedora [Red]",
	skin = 4,
	price = 33333333
})

Copy("fedora6", a, {
	name = "Fedora [Black/Red]",
	skin = 5,
	price = 33333333
})

Copy("fedora7", a, {
	name = "Fedora [Brown/White]",
	skin = 6,
	price = 33333333
})

Copy("fedora8", a, {
	name = "Fedora [Blue/Black]",
	skin = 7,
	price = 33333333
})

local a = New("beanie1", {
	name = "Beanie [Red Stripes]",
	price = 10000000,
	mdl = "models/modified/hat03.mdl",
	slot = SH_SLOT_HEAD
})

Copy("beanie2", a, {
	name = "Beanie [Blue]",
	skin = 1,
	price = 12500000
})

Copy("beanie3", a, {
	name = "Beanie [Red]",
	skin = 2,
	price = 12500000
})

Copy("beanie4", a, {
	name = "Beanie [White]",
	skin = 3,
	price = 12500000
})

Copy("beanie5", a, {
	name = "Beanie [Black Stripes]",
	skin = 4,
	price = 10000000
})

local a = New("woolhat1", {
	name = "Wool Hat [Black]",
	price = 5000000,
	mdl = "models/modified/hat04.mdl",
	slot = SH_SLOT_HEAD
})

Copy("woolhat2", a, {
	name = "Wool Hat [Gray]",
	skin = 1,
	price = 5000000
})

Copy("woolhat3", a, {
	name = "Wool Hat [Gray Stripes]",
	skin = 2,
	price = 5000000
})

Copy("woolhat4", a, {
	name = "Wool Hat [Jamaica]",
	skin = 3,
	price = 30000000
})

Copy("woolhat5", a, {
	name = "Wool Hat [Dark Blue]",
	skin = 4,
	price = 5000000
})

New("flatcap", {
	name = "Flat Cap",
	price = 33333334,
	mdl = "models/modified/hat06.mdl",
	slot = SH_SLOT_HEAD
})

-- Eyes
local a = New("glasses1", {
	name = "Glasses [Gray]",
	price = 6000000,
	mdl = "models/modified/glasses01.mdl",
	slot = SH_SLOT_EYES
})

Copy("glasses2", a, {
	name = "Glasses [White]",
	skin = 1,
	price = 6000000
})

Copy("glasses3", a, {
	name = "Glasses [Green]",
	skin = 2,
	price = 6000000
})

Copy("glasses4", a, {
	name = "Glasses [Brown]",
	skin = 3,
	price = 6000000
})

Copy("glasses5", a, {
	name = "Glasses [Orange]",
	skin = 4,
	price = 6000000
})

Copy("glasses6", a, {
	name = "Glasses [Light Gray]",
	skin = 5,
	price = 6000000
})

New("plaguedoctor", {
	name = "Plague Doctor Mask",
	price = 15000000,
	slot = SH_SLOT_EYES,
	mdl = "models/sal/halloween/doctor.mdl"
})

local a = New("balletmask1", {
	name = "Ballet Mask [White]",
	price = 15000000,
	slot = SH_SLOT_EYES,
	mdl = "models/sal/acc/fix/mask_1.mdl"
})

Copy("balletmask2", a, {
	name = "Ballet Mask [Blue]",
	skin = 1,
	price = 15000000
})

Copy("balletmask3", a, {
	name = "Ballet Mask [Black]",
	skin = 2,
	price = 15000000
})

Copy("balletmask4", a, {
	name = "Ballet Mask [Gray]",
	skin = 3,
	price = 15000000
})

Copy("balletmask5", a, {
	name = "Ballet Mask [Yellow]",
	skin = 4,
	price = 15000000
})

Copy("balletmask6", a, {
	name = "Ballet Mask [Black 2]",
	skin = 5,
	price = 15000000
})

-- Mouth
New("bandana", {
	name = "Black Bandana",
	price = 10000000,
	slot = SH_SLOT_MOUTH,
	mdl = "models/modified/bandana.mdl"
})

-- Neck
local a = New("scarf1", {
	name = "Scarf [White]",
	price = 40000000,
	mdl = "models/sal/acc/fix/scarf01.mdl",
	slot = SH_SLOT_NECK
})

Copy("scarf2", a, {
	name = "Scarf [Gray]",
	skin = 1,
	price = 40000000
})

Copy("scarf3", a, {
	name = "Scarf [Black]",
	skin = 2,
	price = 40000000
})

Copy("scarf4", a, {
	name = "Scarf [Dark Blue]",
	skin = 3,
	price = 40000000
})

Copy("scarf5", a, {
	name = "Scarf [Red]",
	skin = 4,
	price = 40000000
})

Copy("scarf6", a, {
	name = "Scarf [Green]",
	skin = 5,
	price = 40000000
})

Copy("scarf7", a, {
	name = "Scarf [Pink]",
	skin = 6,
	price = 40000000
})

-- Whole head (Head + Eyes + Mouth)
New("catmask", {
	name = "Cat Mask",
	price = 30000000,
	slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/sal/cat.mdl"
})

New("bearmask", {
	name = "Bear Mask",
	price = 25000000,
	slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/sal/bear.mdl"
})

New("foxmask", {
	name = "Fox Mask",
	price = 15000000,
	slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/sal/fox.mdl"
})

New("owlmask", {
	name = "Owl Mask",
	price = 15000000,
	slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/sal/owl.mdl"
})

New("wolfmask", {
	name = "Wolf Mask",
	price = 15000000,
	slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/sal/wolf.mdl"
})

local a = New("monkeymask1", {
	name = "Monkey Mask [Normal]",
	price = 30000000,
	slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/sal/halloween/monkey.mdl"
})

Copy("monkeymask2", a, {
	name = "Monkey Mask [Gorilla]",
	skin = 1,
	price = 30000000
})

Copy("monkeymask3", a, {
	name = "Monkey Mask [Zombie]",
	skin = 2,
	price = 35000000
})

Copy("monkeymask4", a, {
	name = "Monkey Mask [Old]",
	skin = 3,
	price = 30000000
})

local a = New("santapenguin", {
	name = "Santa Penguin",
	price = 70000000,
	slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/sal/penguin.mdl"
})

a.canPurchase = function(ply)
	if os.date("%m") == "12" then
		return true
	else
		return false, "Придбати цей аксесуар ви зможете лише у грудні!"
	end
end

local a = New("eaglemask1", {
	name = "Eagle Mask [White]",
	price = 5000000,
	slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/sal/hawk_1.mdl"
})

Copy("eaglemask2", a, {
	name = "Eagle Mask [Brown]",
	mdl = "models/sal/hawk_2.mdl",
	price = 5000000
})

local a = New("paperbag1", {
	name = "Paper Bag",
	price = 15000000,
	slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/sal/halloween/bag.mdl"
})

Copy("paperbag2", a, {
	name = "Paper Bag [Grin]",
	skin = 1,
	price = 60000000
})

Copy("paperbag3", a, {
	name = "Paper Bag [Crying]",
	skin = 2,
	price = 15000000
})

Copy("paperbag4", a, {
	name = "Paper Bag [Smile]",
	skin = 3,
	price = 30000000
})

Copy("paperbag5", a, {
	name = "Paper Bag [Boss]",
	skin = 4,
	price = 15000000
})

Copy("paperbag6", a, {
	name = "Paper Bag [Teeth]",
	skin = 5,
	price = 60000000
})

Copy("paperbag7", a, {
	name = "Paper Bag [Timid]",
	skin = 6,
	price = 30000000
})

Copy("paperbag8", a, {
	name = "Paper Bag [Burger Shot]",
	skin = 7,
	price = 15000000
})

Copy("paperbag9", a, {
	name = "Paper Bag [Please Kill Me]",
	skin = 8,
	price = 60000000
})

Copy("paperbag10", a, {
	name = "Paper Bag [Satan]",
	skin = 9,
	price = 60000000
})

Copy("paperbag11", a, {
	name = "Paper Bag [Pig]",
	skin = 10,
	price = 30000000
})

Copy("paperbag12", a, {
	name = "Paper Bag [Tongue Out]",
	skin = 11,
	price = 60000000
})

Copy("paperbag13", a, {
	name = "Paper Bag [Angry]",
	skin = 12,
	price = 30000000
})

Copy("paperbag14", a, {
	name = "Paper Bag [Confused]",
	skin = 13,
	price = 30000000
})

Copy("paperbag15", a, {
	name = "Paper Bag [Death]",
	skin = 14,
	price = 30000000
})

Copy("paperbag16", a, {
	name = "Paper Bag [Dog]",
	skin = 15,
	price = 15000000
})

Copy("paperbag17", a, {
	name = "Paper Bag [Ghos]",
	skin = 16,
	price = 30000000
})

Copy("paperbag18", a, {
	name = "Paper Bag [Alien]",
	skin = 17,
	price = 15000000
})

Copy("paperbag19", a, {
	name = "Paper Bag [Help Me]",
	skin = 18,
	price = 60000000
})

Copy("paperbag20", a, {
	name = "Paper Bag [Rectangles]",
	skin = 19,
	price = 15000000
})

Copy("paperbag21", a, {
	name = "Paper Bag [Middle Finger]",
	skin = 20,
	price = 45000000
})

Copy("paperbag22", a, {
	name = "Paper Bag [Gentleman]",
	skin = 21,
	price = 30000000
})

Copy("paperbag23", a, {
	name = "Paper Bag [Stickers]",
	skin = 22,
	price = 60000000
})

Copy("paperbag24", a, {
	name = "Paper Bag [Picasso]",
	skin = 23,
	price = 20000000
})

Copy("paperbag25", a, {
	name = "Paper Bag [Black Heart]",
	skin = 24,
	price = 30000000
})

Copy("paperbag26", a, {
	name = "Paper Bag [Black]",
	skin = 25,
	price = 15000000
})

-- Face (Eyes + Mouth)
New("gingerbread", {
	name = "Gingerbread Mask",
	price = 70000000,
	slot = SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/sal/gingerbread.mdl"
})

local a = New("headwrap1", {
	name = "Headwrap [Gray Bandages]",
	price = 15000000,
	mdl = "models/sal/halloween/headwrap2.mdl",
	slot = SH_SLOT_EYES + SH_SLOT_MOUTH
})

a.scale = 0.9

Copy("headwrap2", a, {
	name = "Headwrap [Black Bandages]",
	skin = 1,
	price = 15000000
})

Copy("headwrap3", a, {
	name = "Headwrap [White Bandages]",
	skin = 2,
	price = 15000000
})

Copy("headwrap4", a, {
	name = "Headwrap [Rainbow Bandages]",
	skin = 3,
	price = 20000000
})

Copy("headwrap5", a, {
	name = "Headwrap [Do Not Cross]",
	mdl = "models/sal/halloween/headwrap1.mdl",
	price = 20000000
})

local a = New("hockeymask1", {
	name = "Hockey Mask [Please Stop Me]",
	price = 15000000,
	slot = SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/modified/mask5.mdl"
})

a.scale = 0.9

local a = New("hockeymask2", {
	name = "Hockey Mask [Bullet Holes]",
	price = 15000000,
	slot = SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/sal/acc/fix/mask_2.mdl"
})

a.scale = 0.9

Copy("hockeymask3", a, {
	name = "Hockey Mask [Dog]",
	skin = 1,
	price = 25000000
})

Copy("hockeymask4", a, {
	name = "Hockey Mask [Cat]",
	skin = 2,
	price = 25000000
})

Copy("hockeymask5", a, {
	name = "Hockey Mask [Dog 2]",
	skin = 3,
	price = 25000000
})

Copy("hockeymask6", a, {
	name = "Hockey Mask [Dog 3]",
	skin = 4,
	price = 25000000
})

Copy("hockeymask7", a, {
	name = "Hockey Mask [Crown]",
	skin = 5,
	price = 25000000
})

Copy("hockeymask8", a, {
	name = "Hockey Mask [Rotten Zombie]",
	skin = 6,
	price = 25000000
})

Copy("hockeymask9", a, {
	name = "Hockey Mask [Vile Zombie]",
	skin = 7,
	price = 30000000
})

Copy("hockeymask10", a, {
	name = "Hockey Mask [Flame Skull]",
	skin = 8,
	price = 30000000
})

Copy("hockeymask11", a, {
	name = "Hockey Mask [Nightmare Skull]",
	skin = 9,
	price = 30000000
})

Copy("hockeymask12", a, {
	name = "Hockey Mask [Electric Skull]",
	skin = 10,
	price = 30000000
})

Copy("hockeymask13", a, {
	name = "Hockey Mask [Skull]",
	skin = 11,
	price = 30000000
})

Copy("hockeymask14", a, {
	name = "Hockey Mask [Stitched]",
	skin = 12,
	price = 15000000
})

Copy("hockeymask15", a, {
	name = "Hockey Mask [Pale Stitched]",
	skin = 13,
	price = 15000000
})

Copy("hockeymask16", a, {
	name = "Hockey Mask [X]",
	skin = 14,
	price = 35000000
})

local a = New("skullmask1", {
	name = "Skull Mask [Black]",
	price = 40000000,
	slot = SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/modified/mask6.mdl"
})

a.scale = 0.9

Copy("skullmask2", a, {
	name = "Skull Mask [Gray]",
	skin = 1,
	price = 40000000
})

Copy("skullmask3", a, {
	name = "Skull Mask [White]",
	skin = 2,
	price = 40000000
})

Copy("skullmask4", a, {
	name = "Skull Mask [Dark Green]",
	skin = 3,
	price = 40000000
})

local a = New("pigmask1", {
	name = "Pig Mask [Normal]",
	price = 20000000,
	slot = SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/sal/pig.mdl"
})

Copy("pigmask2", a, {
	name = "Pig Mask [Bloody]",
	skin = 1,
	price = 40000000
})

local a = New("warriormask1", {
	name = "Warrior Mask [Metal]",
	price = 60000000,
	slot = SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/sal/acc/fix/mask_4.mdl"
})

Copy("warriormask2", a, {
	name = "Warrior Mask [Circuit]",
	skin = 1,
	price = 75000000
})

Copy("warriormask3", a, {
	name = "Warrior Mask [Molten]",
	skin = 2,
	price = 100000000
})

Copy("warriormask4", a, {
	name = "Warrior Mask [Purple]",
	skin = 3,
	price = 100000000
})

Copy("warriormask5", a, {
	name = "Warrior Mask [Carbon]",
	skin = 4,
	price = 60000000
})

Copy("warriormask6", a, {
	name = "Warrior Mask [Target]",
	skin = 5,
	price = 100000000
})

Copy("warriormask7", a, {
	name = "Warrior Mask [Concrete]",
	skin = 6,
	price = 60000000
})

Copy("warriormask8", a, {
	name = "Warrior Mask [Thunder]",
	skin = 7,
	price = 100000000
})

local a = New("ninja1", {
	name = "Ninja Mask [Black]",
	price = 30000000,
	slot = SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/sal/halloween/ninja.mdl"
})

Copy("ninja2", a, {
	name = "Ninja Mask [White]",
	skin = 1,
	price = 30000000
})

Copy("ninja3", a, {
	name = "Ninja Mask [Tan]",
	skin = 2,
	price = 30000000
})

Copy("ninja4", a, {
	name = "Ninja Mask [L.S Benders]",
	skin = 3,
	price = 30000000
})

Copy("ninja5", a, {
	name = "Ninja Mask [Justice]",
	skin = 4,
	price = 30000000
})

Copy("ninja6", a, {
	name = "Ninja Mask [Woodland Camo]",
	skin = 5,
	price = 35000000
})

Copy("ninja7", a, {
	name = "Ninja Mask [Red Stripes]",
	skin = 6,
	price = 55000000
})

Copy("ninja8", a, {
	name = "Ninja Mask [Love Fist]",
	skin = 7,
	price = 30000000
})

Copy("ninja9", a, {
	name = "Ninja Mask [T.P.I]",
	skin = 8,
	price = 30000000
})

Copy("ninja10", a, {
	name = "Ninja Mask [Pink Camo]",
	skin = 9,
	price = 60000000
})

Copy("ninja11", a, {
	name = "Ninja Mask [Police]",
	skin = 10,
	price = 30000000
})

-- Back
local a = New("backpack1", {
	name = "Backpack [Red]",
	price = 50000000,
	mdl = "models/modified/backpack_1.mdl",
	slot = SH_SLOT_BACK
})

Copy("backpack2", a, {
	name = "Backpack [Black]",
	skin = 1,
	price = 50000000
})

Copy("backpack3", a, {
	name = "Backpack [Orange]",
	skin = 2,
	price = 50000000
})

local a = New("backpackcamp1", {
	name = "Camping Backpack [Blue]",
	price = 75000000,
	mdl = "models/modified/backpack_2.mdl",
	slot = SH_SLOT_BACK
})

Copy("backpackcamp2", a, {
	name = "Camping Backpack [Green]",
	skin = 1,
	price = 75000000
})

Copy("backpackcamp3", a, {
	name = "Camping Backpack [Red/White]",
	skin = 2,
	price = 75000000
})

local a = New("backpackmil1", {
	name = "Military Backpack [Black]",
	price = 50000000,
	mdl = "models/modified/backpack_3.mdl",
	slot = SH_SLOT_BACK
})

Copy("backpackmil2", a, {
	name = "Military Backpack [Gray]",
	skin = 1,
	price = 50000000
})

--[[
	ADDON
	GMod Tower: Accessories Pack
]]
-- Head
local a = New("strawhat", {
	name = "Straw Hat",
	price = 70000000,
	slot = SH_SLOT_HEAD,
	mdl = "models/captainbigbutt/skeyler/hats/strawhat.mdl"
})

a.scale = 0.9

local a = New("sunhat", {
	name = "Sunshine Hat",
	price = 45000000,
	slot = SH_SLOT_HEAD,
	mdl = "models/captainbigbutt/skeyler/hats/sunhat.mdl"
})

a.scale = 0.9

local a = New("cowboyhat", {
	name = "Cowboy Hat",
	price = 55000000,
	slot = SH_SLOT_HEAD,
	mdl = "models/captainbigbutt/skeyler/hats/cowboyhat.mdl"
})

a.scale = 0.8

local a = New("catears", {
	name = "Cat Ears",
	price = 88000000,
	slot = SH_SLOT_HEAD,
	mdl = "models/captainbigbutt/skeyler/hats/cat_ears.mdl"
})

a.scale = 0.5

New("bunnyears", {
	name = "Bunny Ears",
	price = 100000000,
	slot = SH_SLOT_HEAD,
	mdl = "models/captainbigbutt/skeyler/hats/bunny_ears.mdl"
})

local a = New("afro", {
	name = "Afro",
	price = 50000000,
	slot = SH_SLOT_HEAD,
	mdl = "models/captainbigbutt/skeyler/hats/afro.mdl"
})

a.scale = 0.8

local a = New("cathat1", {
	name = "Cat Hat [Black]",
	price = 100000000,
	slot = SH_SLOT_HEAD,
	mdl = "models/captainbigbutt/skeyler/hats/cat_hat.mdl"
})

a.scale = 0.7

Copy("cathat2", a, {
	name = "Cat Hat [White]",
	skin = 1,
	price = 100000000
})

local a = New("bearhat", {
	name = "Bear Hat",
	price = 50000000,
	slot = SH_SLOT_HEAD,
	mdl = "models/captainbigbutt/skeyler/hats/bear_hat.mdl"
})

a.scale = 0.75

Copy("froghat", a, {
	name = "Frog Hat",
	mdl = "models/captainbigbutt/skeyler/hats/frog_hat.mdl",
	scale = 0.59,
	price = 50000000
})

local a = New("maidheadband", {
	name = "Maid's Headband",
	price = 30000000,
	slot = SH_SLOT_HEAD,
	mdl = "models/captainbigbutt/skeyler/hats/maid_headband.mdl"
})

a.scale = 0.75

Copy("heartband", a, {
	name = "Heartband",
	mdl = "models/captainbigbutt/skeyler/hats/heartband.mdl",
	price = 140000000
})

Copy("starband", a, {
	name = "Starband",
	mdl = "models/captainbigbutt/skeyler/hats/starband.mdl",
	price = 140000000
})

New("partyhat", {
	name = "Party Hat",
	price = 60000000,
	slot = SH_SLOT_HEAD,
	mdl = "models/gmod_tower/partyhat.mdl"
})

-- Eyes
local a = New("sunglasses", {
	name = "Sunglasses",
	price = 20000000,
	slot = SH_SLOT_EYES,
	mdl = "models/captainbigbutt/skeyler/accessories/glasses04.mdl"
})

a.scale = 0.8

New("aviators", {
	name = "Aviators",
	price = 20000000,
	slot = SH_SLOT_EYES,
	mdl = "models/gmod_tower/aviators.mdl"
})

New("shuttershades", {
	name = "Shutter Shades",
	price = 20000000,
	slot = SH_SLOT_EYES,
	mdl = "models/captainbigbutt/skeyler/accessories/glasses03.mdl"
})

New("starglasses", {
	name = "Star Glasses",
	price = 75000000,
	slot = SH_SLOT_EYES,
	mdl = "models/gmod_tower/starglasses.mdl"
})

local a = New("3dglasses", {
	name = "3D Glasses",
	price = 15000000,
	slot = SH_SLOT_EYES,
	mdl = "models/gmod_tower/3dglasses.mdl"
})

a.scale = 1.1

-- Whole head (Head + Eyes + Mouth)
local a = New("deadmaus", {
	name = "Deadmau5 Hat",
	price = 500000000,
	slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/captainbigbutt/skeyler/hats/deadmau5.mdl"
})

a.scale = 0.9

-- Back
New("fairywings", {
	name = "Fairy Wings",
	price = 222222222,
	slot = SH_SLOT_BACK,
	mdl = "models/gmod_tower/fairywings.mdl"
})

--[[
	ADDON
	Horse Mask Prop
]]
-- Whole head (Head + Eyes + Mouth)
local a = New("horsemask1", {
	name = "Horse Mask [Brown]",
	price = 40000000,
	slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/horsie/horsiemask.mdl"
})

Copy("horsemask2", a, {
	name = "Horse Mask [Black]",
	skin = 1,
	price = 40000000
})

--[[
	ADDON
	Alienware mask from PAYDAY 2
]]
-- Face (Eyes + Mouth)
New("alienwaremask", {
	name = "Alienware Mask",
	price = 65000000,
	slot = SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/snowzgmod/payday2/masks/maskalienware.mdl"
})

--[[
	ADDON
	Freddy Mask SWEP
]]
-- Whole head (Head + Eyes + Mouth)
local a = New("freddymask", {
	name = "Freddy Mask",
	price = 200000000,
	slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/errolliamp/five_nights_at_freddys/freddy_mask.mdl"
})

a.scale = 1.1

--[[
	ADDON
	Polished Military Beret- FO3 HAT
]]
-- Hat
local a = New("beret1", {
	name = "Beret [Red]",
	price = 40000000,
	slot = SH_SLOT_HEAD,
	mdl = "models/fallout 3/polish_beret.mdl"
})

Copy("beret2", a, {
	name = "Beret [Black]",
	skin = 1,
	price = 40000000
})

Copy("beret3", a, {
	name = "Beret [Green]",
	skin = 2,
	price = 40000000
})

--[[
	ADDON
	Animal masks from PAYDAY 2
]]
-- Face (Eyes + Mouth)
local a = New("pd2mask_arnold", {
	name = "Arnold Mask",
	price = 70000000,
	slot = SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/snowzgmod/payday2/masks/maskarnold.mdl"
})

a.scale = 0.95

local a = New("pd2mask_babyrhino", {
	name = "Baby Rhino Mask",
	price = 70000000,
	slot = SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/snowzgmod/payday2/masks/maskbabyrhino.mdl"
})

a.scale = 0.95

local a = New("pd2mask_chuck", {
	name = "Chuck Mask",
	price = 10000000,
	slot = SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/snowzgmod/payday2/masks/maskchuck.mdl"
})

a.scale = 0.95

local a = New("pd2mask_dolph", {
	name = "Dolph Mask",
	price = 90000000,
	slot = SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/snowzgmod/payday2/masks/maskdolph.mdl"
})

a.scale = 0.95

local a = New("pd2mask_jeanclaude", {
	name = "Jean-Claude Mask",
	price = 60000000,
	slot = SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/snowzgmod/payday2/masks/maskjeanclaude.mdl"
})

a.scale = 0.95

local a = New("pd2mask_mark", {
	name = "Mark Mask",
	price = 70000000,
	slot = SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/snowzgmod/payday2/masks/maskmark.mdl"
})

a.scale = 0.95

local a = New("pd2mask_monkeybusiness", {
	name = "Monkey Business Mask",
	price = 50000000,
	slot = SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/snowzgmod/payday2/masks/maskmonkeybusiness.mdl"
})

a.scale = 0.95

local a = New("pd2mask_thehog", {
	name = "The Hog Mask",
	price = 65000000,
	slot = SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/snowzgmod/payday2/masks/maskthehog.mdl"
})

a.scale = 0.95

--[[
	ADDON
	Wrench Mask
]]
-- Face (Eyes + Mouth)
local a = New("wrenchmask", {
	name = "Wrench Mask",
	price = 50000000,
	slot = SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/models/wrenchmask.mdl"
})

a.scale = 0.47

--[[
	ADDON
	GTA IV Bike Helmets
]]
-- Hat
local a = New("bikehelmet1", {
	name = "Bike Helmet [Black]",
	price = 50000000,
	slot = SH_SLOT_HEAD,
	mdl = "models/dean/gtaiv/helmet.mdl"
})

Copy("bikehelmet2", a, {
	name = "Bike Helmet [Gray]",
	skin = 1,
	price = 50000000
})

Copy("bikehelmet3", a, {
	name = "Bike Helmet [White]",
	skin = 2,
	price = 50000000
})

Copy("bikehelmet4", a, {
	name = "Bike Helmet [Red]",
	skin = 3,
	price = 50000000
})

Copy("bikehelmet5", a, {
	name = "Bike Helmet [Orange]",
	skin = 4,
	price = 50000000
})

Copy("bikehelmet6", a, {
	name = "Bike Helmet [Yellow]",
	skin = 5,
	price = 50000000
})

Copy("bikehelmet7", a, {
	name = "Bike Helmet [Green]",
	skin = 6,
	price = 50000000
})

Copy("bikehelmet8", a, {
	name = "Bike Helmet [Blue]",
	skin = 7,
	price = 50000000
})

Copy("bikehelmet9", a, {
	name = "Bike Helmet [Pink]",
	skin = 8,
	price = 50000000
})

Copy("bikehelmet10", a, {
	name = "Bike Helmet [Rainbow]",
	skin = 9,
	price = 66666666
})

Copy("bikehelmet11", a, {
	name = "Bike Helmet [Stars]",
	skin = 10,
	price = 60000000
})

Copy("bikehelmet12", a, {
	name = "Bike Helmet [Gradient]",
	skin = 11,
	price = 55000000
})

Copy("bikehelmet13", a, {
	name = "Bike Helmet [America]",
	skin = 12,
	price = 70000000
})

Copy("bikehelmet14", a, {
	name = "Bike Helmet [Black Stripe]",
	skin = 13,
	price = 55000000
})

Copy("bikehelmet15", a, {
	name = "Bike Helmet [White Stripe]",
	skin = 14,
	price = 55000000
})

--[[
	ADDON
	Halloween_Pumpkin
]]
local a = New("pumpkinhat", {
	name = "Pumpkin Hat",
	price = 120000000,
	slot = SH_SLOT_HEAD,
	mdl = "models/props/pumpkin_z.mdl"
})

a.scale = 0.5

local a = New("topbag", {
	name = "Тестовая хуита",
	skin = 27,
	price = 0,
	slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH,
	mdl = "models/sal/halloween/bagr.mdl"
})
a.steamids = {
	["STEAM_0:0:441584349"] = true,
	["STEAM_0:1:420570910"] = true,
	["STEAM_0:1:423775894"] = true,
	["STEAM_0:0:121551094"] = true,
	["STEAM_0:0:487003710"] = true,
}

--[[
	CUSTOM ACCESSORIES
	Place your custom accessories under this!
]]
-- Only admins may buy this hat, and this hat will only render when their team name is "Admin On Duty"
local a = New("tophat", {
	name = "Top Hat",
	price = 45000000,
	slot = SH_SLOT_HEAD,
	mdl = "models/player/items/humans/top_hat.mdl"
})
a.usergroups = {
	["superadmin"] = true,
}


----------------------------------\-/-\

hook.Add('GM.EndLoading', 'LoadingHat', function()
	if IS_SERVER == 1 then
		New("hannya_mask_skull", {
			name = "Immortals Hat",
			price = 150000,
			slot = SH_SLOT_HEAD,
			mdl = "models/hannya_mask_skull/hannya_mask_skull.mdl",
			canPurchase = function(ply)
				if ply:GetGangID() ~= 4 then return false, 'Спочатку вступіть у Immortals' end
				return true
			end
		})
	end
end)
--PATH addons/_ballistic_shields/lua/ballistic_shields/sh_bs_util.lua:
bshields = bshields or {}
bshields.config = bshields.config or {}
bshields.shields = {
	{
		[1] = {
			["angles"] = Angle( 4, 6, -14 ),
			["position"] = Vector( 0, 8, -1 )
		},
		[2] = {
			["angles"] = Angle( 6, 6, -12 ),
			["position"] = Vector( 8, 10, -4 )
		},
		[3] = {
			["angles"] = Angle( -3, 7, -16 ),
			["position"] = Vector( -1, 4, -3 )
		}
	},
	{
		[1] = {
			["angles"] = Angle( -12, 0, 0 ),
			["position"] = Vector( 6, -4, -8 )
		},
		[2] = {
			["angles"] = Angle( -12, 0, 0 ),
			["position"] = Vector( 16, -3, -12 )
		},
		[3] = {
			["angles"] = Angle( -12, 0, 0 ),
			["position"] = Vector( 6, -3, -12 )
		}
	},
	{
		[1] = {
			["angles"] = Angle( 70, 78, -16 ),
			["position"] = Vector( 1, -7, -13 )
		},
		[2] = {
			["angles"] = Angle( 70, 78, -16 ),
			["position"] = Vector( 1, -6, -22 )
		},
		[3] = {
			["angles"] = Angle( 70, 78, -16 ),
			["position"] = Vector( 1, -8, -12 )
		}
	}
}
--PATH addons/_________report_system/lua/cats/shared.lua:
if SERVER then
    function ScrW()
        return 1920
    end

    function ScrH()
        return 1080
    end
end

cats = cats or {}
cats.config = {}
cats.config.spawnSize = { 450, 220 }
cats.config.spawnPosAdmin = { ScrW() - 500, 50 }
cats.config.spawnPosUser = { ScrW() - 500, ScrH() - 250 }
cats.config.punchCardMode = 'dots'
cats.config.punchCardStart = 5
cats.config.defaultRating = 3
cats.config.ratingTimeout = 60
cats.config.newTicketSound = 'buttons/bell1.wav'
cats.lang = {
    openTickets = 'Відкриті скарги',
    myTicket = 'Моя скарга',
    userDisconnected = 'Гравець вийшов',
    claimedBy = 'Розбирається',
    sendMessage = 'Написати повідомлення...',
    typeYourMessage = 'Введіть повідомлення:',
    actions = 'Дії',
    action_claim = 'Взяти скаргу',
    action_unclaim = 'Передати скаргу',
    action_spectate = 'Спостерігати',
    action_goto = 'До гравця',
    action_bring = 'До себе',
    action_return = 'Повернути на місце',
    action_returnself = 'Повернутися на місце',
    action_copySteamID = 'Скопіювати SteamID',
    action_callon = 'Включити прохання про допомогу',
    action_calloff = 'Вимкнути прохання про допомогу',
    action_close = 'Закрити скаргу',
    error_wait = 'Тихо-тихо... Куди так розігнався?',
    error_noAccess = 'Помилка доступу',
    error_playerNotFound = 'Гравця не знайдено',
    error_ticketNotEnded = 'Скарга не закрита',
    error_ticketNotFound = 'Скаргу не знайдено',
    error_ticketEnded = 'Скаргу вже вирішено',
    error_ticketNotClaimed = 'Скаргу ніким не взято',
    error_ticketAlreadyClaimed = 'Скаргу вже взято',
    error_needToRate = 'Ти маєш оцінити минулу скаргу!',
    error_cantCancelHasAdmin = 'Не можна скасувати скаргу, яку розглядають',
    ticketClaimed = 'Скаргу взято',
    ticketUnclaimed = 'Скаргу віддано',
    ticketClaimedBy = 'Твою скаргу прийняв %s',
    ticketUnclaimedBy = 'Твою скаргу передано',
    ticketClosed = 'Скаргу закрито',
    ticketClosedBy = '%s закрив скаргу. Оціни його роботу!',
    ticketRatedForAdmin = 'Оцінка за твоєю скаргою: %s',
    ticketRatedForUser = 'Ти оцінив рішення скарги на %s',
    ticketUserLeft = 'Користувач, чию скаргу ти вирішував, вийшов',
    rateAdmin = 'Натисни нижче, щоб вибрати оцінку',
    ok = 'Готово',
    cancel = 'Відміна',
    ticket_noAdmins = 'На сервері немає адміністраторів',
    dow = { 'ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ', 'ВС' },
}

cats.config.serverID = 'UKRP'
cats.config.getPlayerName = function( ply ) return IsValid(ply) and (ply:Name() .. ' (' .. ply:SteamID() .. ')') or 'NO DATA' end
cats.config.playerCanSeeTicket = function( ply, ticketSteamID ) return ply:HasPermission( 'cats_see_requests' ) or ply:SteamID() == ticketSteamID end
cats.config.triggerText = function( ply, text )
    if cats.config.playerCanSeeTicket( ply, '' ) or ply:IsBanned() then return false end
    text = text:Trim()
    if text:sub( 1, 1 ) == '@' then
        return true, text:sub( 2 ):Trim()
    elseif text:sub( 1, 3 ) == '///' then
        return true, text:sub( 4 ):Trim()
    end
    return false
end

cats.config.notify = function( ply, msg, type )
    if IsValid( ply ) then
        rp.Notify( ply, type or 1, msg, '' )
    else
        rp.Notify_All( type or 1, msg, '' )
    end
end

cats.config.commands = {
    {
        text = cats.lang.action_spectate,
        icon = 'camera_go',
        click = function( ply ) RunConsoleCommand( 'FSpectate', ply:SteamID() ) end
    },
    {
        text = cats.lang.action_bring,
        icon = 'user_go',
        click = function( ply ) RunConsoleCommand( 'sam', 'bring', ply:SteamID() ) end
    },
    {
        text = cats.lang.action_return,
        icon = 'arrow_undo',
        click = function( ply ) RunConsoleCommand( 'sam', 'return', ply:SteamID() ) end
    },
    {
        text = cats.lang.action_goto,
        icon = 'arrow_right',
        click = function( ply ) RunConsoleCommand( 'sam', 'goto', ply:SteamID() ) end
    },
    {
        text = cats.lang.action_returnself,
        icon = 'arrow_rotate_clockwise',
        click = function() RunConsoleCommand( 'sam', 'return', LocalPlayer():SteamID() ) end
    },
    {
        text = cats.lang.action_copySteamID,
        icon = 'key_go',
        click = function( ply ) SetClipboardText( ply:SteamID() ) end
    },
}

if SERVER then
    ScrW = nil
    ScrH = nil
end
--PATH addons/_drones/lua/dronesrewrite/weapons/blaster2.lua:
DRONES_REWRITE.Weapons["Red Blaster"] = {
	Initialize = function(self, pos, ang)
		local ent = DRONES_REWRITE.Weapons["Template"].Initialize(self, "models/dronesrewrite/blaster/blaster.mdl", pos, ang, "models/dronesrewrite/attachment4/attachment4.mdl", pos)

		ent.PrimaryAmmo = 800
		ent.PrimaryAmmoMax = 800
		ent.PrimaryAmmoType = { DRONES_REWRITE.AmmoTypes.Blaster }

		ent.WaitTime = 0

		return ent
	end,

	Think = function(self, gun)
		DRONES_REWRITE.Weapons["Template"].Think(self, gun)

		if gun.PlaySound and CurTime() > gun.NextShoot2 then
			gun:EmitSound("vehicles/tank_readyfire1.wav", 78, 255, 1, CHAN_WEAPON)
			gun.PlaySound = false
		end
	end,

	Attack = function(self, gun)
		if not self:IsKeyDown("Fire2") and  CurTime() > gun.NextShoot and gun:HasPrimaryAmmo() then
			local src = gun:GetPos() + gun:GetForward() * 64 + gun:GetUp()

			local ammo = ents.Create("dronesrewrite_rd_laser")
			ammo:SetPos(src)
			ammo:SetAngles(gun:GetAngles() + AngleRand() * 0.004)
			ammo:Spawn()
			ammo.Owner = self:GetDriver()
			
			constraint.NoCollide(ammo, self, 0, 0)

			ammo:EmitSound("drones/alien_fire.wav", 85, 100, 1, CHAN_WEAPON)

			local ef = EffectData()
			ef:SetOrigin(src - gun:GetForward() * 20)
			ef:SetNormal(gun:GetForward())
			util.Effect("dronesrewrite_muzzleflashblaster2", ef)
	
			gun:SetPrimaryAmmo(-1)
			gun.NextShoot = CurTime() + 0.1
		end
	end,

	Attack2 = function(self, gun)
		if not self:IsKeyDown("Fire1") and CurTime() > gun.NextShoot2 and gun:HasPrimaryAmmo() then
			local src = gun:GetPos() + gun:GetForward() * 64 - gun:GetUp() * 2.5

			local ammo = ents.Create("dronesrewrite_rd_laser_sm")
			ammo:SetPos(src)
			ammo:SetAngles(gun:GetAngles() + AngleRand() * 0.02)
			ammo:Spawn()
			ammo.Owner = self:GetDriver()
			
			constraint.NoCollide(ammo, self, 0, 0)

			ammo:EmitSound("drones/alien_fire.wav", 85, math.random(90, 120), 1, CHAN_WEAPON)

			local ef = EffectData()
			ef:SetOrigin(src - gun:GetForward() * 21)
			ef:SetNormal(gun:GetForward())
			util.Effect("dronesrewrite_muzzleflashblaster2", ef)	

			gun:SetPrimaryAmmo(-1)
			gun.NextShoot2 = CurTime() + 0.02

			gun.WaitTime = math.Approach(gun.WaitTime, 1, 0.01)
			if gun.WaitTime >= 1 then 
				gun.PlaySound = true
				gun.NextShoot2 = CurTime() + 3.6
				gun.WaitTime = 0
			end
		end
	end
}
--PATH addons/_drones/lua/dronesrewrite/weapons/heligun.lua:
DRONES_REWRITE.Weapons["Helicopter Gun"] = {
	Initialize = function(self, pos, ang)
		local ent = DRONES_REWRITE.Weapons["Template"].InitializeNoHandler(self, "models/gibs/gunship_gibs_nosegun.mdl", pos, ang)

		DRONES_REWRITE.Weapons["Template"].SpawnSource(ent, Vector(60, 0, -12))

		ent.PrimaryAmmo = 3000
		ent.PrimaryAmmoMax = 3000
		ent.PrimaryAmmoType = { DRONES_REWRITE.AmmoTypes.Pistol }

		ent.WaitForAttack = 0

		return ent
	end,

	Think = function(self, gun)
		DRONES_REWRITE.Weapons["Template"].Think(self, gun)
	end,

	Attack = function(self, gun)
		if CurTime() > gun.NextShoot and gun:HasPrimaryAmmo() then
			if gun.WaitForAttack == 0 then
				self:EmitSound("npc/attack_helicopter/aheli_charge_up.wav", 90)
			end

			gun.WaitForAttack = gun.WaitForAttack + 1

			if gun.WaitForAttack > 60 then
				local damage = 14
				local force = 10

				self:SwitchLoopSound("GunHeli", true, "npc/attack_helicopter/aheli_weapon_fire_loop3.wav", 100, 1, 95)

				local bullet = {}
				bullet.Num = 1
				bullet.Src = gun.Source:GetPos()
				bullet.Dir = gun:GetLocalCamDir()
				bullet.Spread = Vector(0.07, 0.07, 0.07)
				bullet.Tracer = 1
				bullet.TracerName = "HelicopterTracer"
				bullet.Force = force
				bullet.Damage = damage
				bullet.Attacker = self:GetDriver()
				
				gun.Source:FireBullets(bullet)

				gun:SetPrimaryAmmo(-1)
			end

			gun.NextShoot = CurTime() + 0.02

			if gun.WaitForAttack > 220 then 
				gun.Tab.OnAttackStopped(self, gun) 
			end
		end
	end,

	OnAttackStopped = function(self, gun)
		self:SwitchLoopSound("GunHeli", false)
		gun.WaitForAttack = 0
		gun.NextShoot = CurTime() + 2
	end,

	Holster = function(self, gun)
		self:SwitchLoopSound("GunHeli", false)
	end,

	OnRemove = function(self, gun)
		self:SwitchLoopSound("GunHeli", false)
	end,
}
--PATH addons/_drones/lua/dronesrewrite/weapons/invisible.lua:
DRONES_REWRITE.Weapons["Invisible"] = {
	Initialize = function(self)
		local ent = DRONES_REWRITE.Weapons["Template"].InitializeNoDraw(self) 

		ent.IsInvisible = false
		ent.InvisibleEnergy = 100

		ent.SetInvisible = function(ent, n)
			self.PlayLoop = not n
			self.ShouldNpcsIgnore = n

			self:SetNoDraw(n)
			if not self.NoPropellers then
				for k, v in pairs(self.ValidPropellers) do
					v:SetNoDraw(n)
				end
			end

			for k, v in pairs(self.ValidWeapons) do
				if v.NoDrawWeapon then continue end

				if IsValid(v.Handler) then v.Handler:SetNoDraw(n) end
				v:SetNoDraw(n)
			end

			if n then
				self:AddHookClient("HUD", "InvisibleDraw", [[
					local drone = LocalPlayer():GetNWEntity("DronesRewriteDrone")
					if drone:IsValid() then	drone:DrawIndicator("Invisible", drone:GetNWInt("InvisibleEnergy")) end
				]])
			end

			ent.IsInvisible = n

			ParticleEffect("elecray_hit_drr", self:GetPos(), Angle(0, 0, 0))
			ent:EmitSound("ambient/energy/weld2.wav", 44, 255, 0.5)
		end

		return ent
	end,

	Think = function(self, gun)
		local num = math.floor(gun.InvisibleEnergy)
		self:SetNWInt("InvisibleEnergy", num)

		if gun.IsInvisible then
			gun.InvisibleEnergy = math.Approach(gun.InvisibleEnergy, 0, 0.05)

			if gun.InvisibleEnergy <= 0 then
				gun:SetInvisible(false)
			end
		else
			gun.InvisibleEnergy = math.Approach(gun.InvisibleEnergy, 100, 0.1)
		end
	end,

	Attack = function(self, gun)
		if CurTime() > gun.NextShoot then
			if not gun.IsInvisible and gun.InvisibleEnergy >= 50 then
				gun:SetInvisible(true)
			else
				gun:SetInvisible(false)
			end

			gun.NextShoot = CurTime() + 0.5
		end
	end,

	OnRemove = function(self, gun)
		self:RemoveHookClient("HUD", "InvisibleDraw")
	end
}
--PATH addons/_drones/lua/dronesrewrite/weapons/miniguntr.lua:
DRONES_REWRITE.Weapons["3-barrel Minigun"] = {
	Initialize = function(self, pos, ang)
		local ent = DRONES_REWRITE.Weapons["Template"].Initialize(self, "models/dronesrewrite/miniguntr/miniguntr.mdl", pos, ang, "models/dronesrewrite/attachment4/attachment4.mdl", pos)

		DRONES_REWRITE.Weapons["Template"].SpawnSource(ent, Vector(55, 0, 3))

		ent.Rotate = 0
		ent.Angle = 0

		ent.PrimaryAmmo = 2500
		ent.PrimaryAmmoMax = 2500
		ent.PrimaryAmmoType = { DRONES_REWRITE.AmmoTypes.Pistol }

		return ent
	end,

	Think = function(self, gun)
		DRONES_REWRITE.Weapons["Template"].Think(self, gun)

		if gun.StopRotating then
			gun.Rotate = math.Approach(gun.Rotate, 0, 0.025)
		end

		gun.Angle = gun.Angle + (gun.Rotate * 20)
		gun:ManipulateBoneAngles(gun:LookupBone("barr"), Angle(0, gun.Angle, 0))
	end,

	Attack = function(self, gun)
		if CurTime() > gun.NextShoot then
			if gun:HasPrimaryAmmo() then
				local tr = self:GetCameraTraceLine()

				local damage = 6
				local force = 7

				local bullet = {}
				bullet.Num = 1
				bullet.Src = gun.Source:GetPos()
				bullet.Dir = gun:GetLocalCamDir()
				bullet.Spread = Vector(0.01, 0.01, 0.01)
				bullet.Tracer = math.random(5, 12)
				bullet.Force = force
				bullet.Damage = damage
				bullet.Attacker = self:GetDriver()
				
				gun:EmitSound("weapons/ar2/fire1.wav", 80, math.random(100, 120), 1, CHAN_WEAPON)
				gun.Source:FireBullets(bullet)
				self:SwitchLoopSound("Minigun", true, "drones/minigunshoot.wav", 110, 1, 80)

				local phys = self:GetPhysicsObject()
				phys:ApplyForceCenter((gun:GetPos() - tr.HitPos):GetNormal() * 200000 / self.Weight)
				phys:AddAngleVelocity(VectorRand() * 600 / self.Weight)

				local ef = EffectData()
				ef:SetOrigin(gun.Source:GetPos())
				ef:SetNormal(gun:GetForward())
				util.Effect("dronesrewrite_muzzleflash", ef)

				gun:SetPrimaryAmmo(-1)
			else
				self:SwitchLoopSound("Minigun", false)
			end

			self:SetFuel(self:GetFuel() - 0.02)
			self:SwitchLoopSound("MinigunSpin", true, "vehicles/crane/crane_idle_loop3.wav", 100, 1, 90)

			gun.StopRotating = false
			gun.Rotate = 1
			gun.NextShoot = CurTime() + 0.015
		end
	end,

	OnAttackStopped = function(self, gun)
		gun.StopRotating = true
		gun:EmitSound("vehicles/apc/apc_shutdown.wav", 65, 80)

		self:SwitchLoopSound("Minigun", false)
		self:SwitchLoopSound("MinigunSpin", false)
	end,

	Holster = function(self, gun)
		gun.StopRotating = true
		gun:EmitSound("vehicles/apc/apc_shutdown.wav", 65, 80)

		self:SwitchLoopSound("Minigun", false)
		self:SwitchLoopSound("MinigunSpin", false)
	end,

	OnRemove = function(self, gun)
		self:SwitchLoopSound("Minigun", false)
		self:SwitchLoopSound("MinigunSpin", false)
	end
}
--PATH addons/_drones/lua/dronesrewrite/weapons/orbitalstrike.lua:
DRONES_REWRITE.Weapons["Orbital Strike"] = {
	Initialize = function(self)
		--local ent = 

		return DRONES_REWRITE.Weapons["Template"].InitializeNoDraw(self)
	end,

	Attack = function(self, gun)
		if self:WasKeyPressed("Fire1") and CurTime() > gun.NextShoot then
			local tr = self:GetCameraTraceLine()
			local point = tr.HitPos
			local attacker = self:GetDriver()

			local time = 0.2

			sound.Play("drones/alarm.wav", point, 100, 100, 1) 

			timer.Simple(time, function()
				sound.Play("npc/strider/charging.wav", point, 120, 100, 1) 

				local ef = EffectData()
				ef:SetOrigin(tr.HitPos)
				util.Effect("dronesrewrite_obs_laser", ef)
			end)

			timer.Simple(time + 1.5, function()
				if not IsValid(attacker) and not IsValid(self) then return end
				local ef = EffectData()
				ef:SetOrigin(point)
				util.Effect("dronesrewrite_explosionbig", ef)

				util.ScreenShake(point, 30, 2, 5, 20000) 

				sound.Play("npc/strider/fire.wav", point, 100, 100, 1) 
				sound.Play("ambient/explosions/explode_5.wav", point, 150, 100, 1)

				util.Decal("DrrBigExpo", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)

				local attacker = IsValid(attacker) and attacker or self
				util.BlastDamage(attacker, attacker, point, 800, math.random(450,550))
			end)

			gun.NextShoot = CurTime() + 12
		end
	end
}
--PATH addons/ukrp_main_content/lua/autorun/gopnik_player.lua:

local function AddPlayerModel( name, model )

    list.Set( "PlayerOptionsModel", name, model )
    player_manager.AddValidModel( name, model )
	player_manager.AddValidHands( "Gopnik", "models/half-dead/gopniks/extra/arms.mdl", 0, "00000000" )
    
end

AddPlayerModel( "Gopnik", "models/half-dead/Gopniks/extra/playermodelonly.mdl" )


--PATH addons/igs-core/lua/igs/dependencies/dash/wmat.lua:
if dash and texture then return end -- https://t.me/c/1353676159/41153
-- Thanks to SuperiorServers.co
-- require 'hash'

texture = {}

local TEXTURE = {
	__tostring = function(self)
		return self.Name
	end
}
TEXTURE.__index = TEXTURE
TEXTURE.__concat = TEXTURE.__tostring

debug.getregistry().Texture = TEXTURE

texture.textures = {}
texture.proxyurl = 'https://imgkit.gmod.app/?image=%s&size=%i'

if (not file.IsDir('texture', 'DATA')) then
	file.CreateDir 'texture'
end

function texture.Create(name)
	texture.Delete(name)

	local ret = setmetatable({
		Name 	= name,
		URL 	= '',
		Width 	= 1024,
		Height 	= 1024,
		Busy 	= false,
		Cache 	= true,
		Proxy 	= true,
		Format 	= 'jpg',
	}, TEXTURE)
	texture.textures[name] = ret
	return ret
end

function texture.Get(name)
	if texture.textures[name] then
		return texture.textures[name]:GetMaterial()
	end
end

function texture.Delete(name)
	texture.textures[name] = nil
end

function TEXTURE:SetSize(w, h)
	self.Width, self.Height = w, h
	return self
end

function TEXTURE:SetFormat(format) -- valid formats are whatever your webserver proxy can handle.
	self.Format = format
	return self
end

function TEXTURE:EnableCache(enable)
	self.Cache = enable
	return self
end

function TEXTURE:EnableProxy(enable)
	self.Proxy = enable
	return self
end


function TEXTURE:GetName()
	return self.Name
end

function TEXTURE:GetUID(reaccount)
	if (not self.UID) or reaccount then
		self.UID = hash.MD5(self.Name .. self.URL .. self.Width .. self.Height .. self.Format)
	end
	return self.UID
end

function TEXTURE:GetSize()
	return self.Width, self.Height
end

function TEXTURE:GetFormat()
	return self.Format
end

function TEXTURE:GetURL()
	return self.URL
end

function TEXTURE:GetFile()
	return self.File
end

function TEXTURE:GetMaterial()
	return self.IMaterial
end

function TEXTURE:GetError()
	return self.Error
end

function TEXTURE:IsBusy()
	return self.Busy == true
end

function TEXTURE:Download(url, onsuccess, onfailure)
	if (self.Name == nil) then
		self.Name = 'Web Material: ' .. url
	end
	self.URL = url
	self.File = 'texture/' .. self:GetUID() .. '.png'

	if self.Cache and file.Exists(self.File, 'DATA') then
		self.IMaterial = Material('data/' .. self.File, 'smooth')
		if onsuccess then
			onsuccess(self, self.IMaterial)
		end
	else
		self.Busy = true

		http.Fetch(self.Proxy and string.format(texture.proxyurl, url:URLEncode(), self.Width, self.Height, self.Format) or url, function(body, len, headers, code)
			if (self.Cache) then
				file.Write(self.File, body)
			end

			local tempfile = 'texture/tmp_' .. os.time() .. '_' .. self:GetUID() .. '.png'
			file.Write(tempfile, body)
			self.IMaterial = Material('data/' .. tempfile, 'smooth')
			file.Delete(tempfile)

			if onsuccess then
				onsuccess(self, self.IMaterial)
			end

			self.Busy = false
		end, function(error)

			self.Error = error

			if onfailure then
				onfailure(self, self.Error)
			end

			self.Busy = false
		end)
	end
	return self
end

function TEXTURE:RenderManual(func, callback)
	local cachefile = 'texture/' .. self:GetUID() .. '-render.png'

	if file.Exists(cachefile, 'DATA') then
		self.File = cachefile
		self.IMaterial = Material('data/' .. self.File, 'smooth')

		if callback then
			callback(self, self.IMaterial)
		end
	else
		hook.Add('HUDPaint', 'texture.render' .. self:GetName(), function()
			if self:IsBusy() then return end

			local w, h = self.Width, self.Height

			local drawRT = GetRenderTarget('texture_rt', w, h, true)
			local oldRT = render.GetRenderTarget()

			render.SetRenderTarget(drawRT)
				render.Clear(0, 0, 0, 0)
				render.ClearDepth()

				render.SetViewPort(0, 0, w, h) -- may need to tweak this all a bit later when I find use cases this doesn't work well for.
					func(self, w, h)

					if self.Cache then
						self.File = 'texture/' .. self:GetUID() .. '-render.png'
						file.Write(self.File, render.Capture({
							format = 'png',
							quality = 100,
							x = 0,
							y = 0,
							h = h,
							w = w
						}))
					end
				render.SetViewPort(0, 0, ScrW(), ScrH())
			render.SetRenderTarget(oldRT)

			self.IMaterial = Material('data/' .. self.File)

			if callback then
				callback(self, self.IMaterial)
			end

			hook.Remove('HUDPaint', 'texture.render' .. self:GetName())
		end)
	end
	return self
end

function TEXTURE:Render(func, callback)
	return self:RenderManual(function(self, w, h)
		cam.Start2D()
			func(self, w, h)
		cam.End2D()
	end, callback)
end

--PATH addons/igs-core/lua/igs/network/net_cl.lua:
-- Запрашивает покупку итема в инвентарь
function IGS.Purchase(sItemUID, callback)
	net.Start("IGS.Purchase")
		net.WriteString(sItemUID)
	net.SendToServer()

	net.Receive("IGS.Purchase",function()
		local errMsg  = net.ReadIGSError()

		local ITEM = IGS.GetItemByUID(sItemUID)
		if errMsg then
			if callback then callback(errMsg) end
			hook.Run("IGS.OnFailedPurchase", ITEM, errMsg)
		else
			local invDbID_ = IGS.C.Inv_Enabled and net.ReadUInt(IGS.BIT_INV_ID)
			if callback then callback(nil, invDbID_) end
			hook.Run("IGS.PlayerPurchasedItem", LocalPlayer(), ITEM, invDbID_)
		end
	end)
end

-- Активирует купленный итем (Только если IGS.C.Inv_Enabled)
function IGS.Activate(iInvID, callback)
	net.Start("IGS.Activate")
		net.WriteUInt(iInvID, IGS.BIT_INV_ID)
		net.WriteBool(callback)
	net.SendToServer()

	if not callback then return end
	net.Receive("IGS.Activate", function()
		local ok = net.ReadBool()
		local iPurchID = ok and net.ReadUInt(IGS.BIT_PURCH_ID)
		local sMsg_ = net.ReadIGSMessage()
		callback(ok, iPurchID, sMsg_)
	end)
end

function IGS.UseCoupon(sCoupon, callback)
	net.Start("IGS.UseCoupon")
		net.WriteString(sCoupon)
	net.SendToServer()

	net.Receive("IGS.UseCoupon", function()
		callback(net.ReadIGSError())
	end)
end

--[[-------------------------------------------------------------------------
	Ссылки
---------------------------------------------------------------------------]]
function IGS.GetPaymentURL(iSum,fCallback)
	net.Start("IGS.GetPaymentURL")
		net.WriteDouble(iSum)
	net.SendToServer()

	net.Receive("IGS.GetPaymentURL",function()
		fCallback(net.ReadString())
	end)
end



local cache,last_update = {},0 -- на сервере тоже кэширование
function IGS.GetLatestPurchases(fCallback)
	if last_update + 60 >= os.time() then
		fCallback(cache)
		return
	end

	net.Ping("IGS.GetLatestPurchases")
	net.Receive("IGS.GetLatestPurchases",function()
		local dat = {}
		for i = 1,net.ReadUInt(IGS.BIT_LATEST_PURCH) do
			dat[i] = net.ReadIGSPurchase() -- id и purchase не юзаются
		end

		cache = dat
		last_update = os.time()

		fCallback(dat)
	end)
end

-- тут таймаут не нужно. Даже если заспамить net - ничего не произойдет
function IGS.GetMyTransactions(fCallback)
	net.Ping("IGS.GetMyTransactions")

	net.Receive("IGS.GetMyTransactions",function()
		local dat = {}
		for i = 1,net.ReadUInt(IGS.BIT_TX) do
			dat[i] = net.ReadIGSTx()
		end

		fCallback(dat)
	end)
end

function IGS.GetMyPurchases(fCallback)
	net.Ping("IGS.GetMyPurchases")

	net.Receive("IGS.GetMyPurchases",function()
		local dat = {}
		for i = 1,net.ReadUInt(8) do
			dat[i] = net.ReadIGSPurchase()
		end

		fCallback(dat)
	end)
end




--[[-------------------------------------------------------------------------
	Инвентарь
---------------------------------------------------------------------------]]
function IGS.GetInventory(fCallback)
	net.Ping("IGS.GetInventory")

	net.Receive("IGS.GetInventory",function()
		local d = {}

		for i = 1,net.ReadUInt(7) do
			d[i] = net.ReadIGSInventoryItem()
		end

		fCallback(d)
	end)
end

function IGS.DropItem(iID,fCallback) -- энтити в каллбэке
	if not IGS.C.Inv_AllowDrop then
		IGS.ShowNotify("Дроп предметів відключений адміністратором", "Помилка")
		return
	end

	net.Start("IGS.DropItem")
		net.WriteUInt(iID,IGS.BIT_INV_ID)
	net.SendToServer()

	net.Receive("IGS.DropItem",function()
		local ent = net.ReadEntity()

		if fCallback then
			fCallback(ent)
		end
	end)
end




net.Receive("IGS.PaymentStatusUpdated",function()
	local t = {}
	t.paymentType = net.ReadString()
	t.orderSum    = net.ReadString()
	t.method      = net.ReadString()

	if t.method == "error" then
		t.errorMessage = net.ReadString()
	end

	hook.Run("IGS.PaymentStatusUpdated",t)
end)

net.Receive("IGS.UI",function()
	IGS.UI()
end)

--PATH addons/igs-core/lua/igs/interface/vgui/igs_group.lua:
local PANEL = {}

local PL_VARIANTS = PLUR({"варіант", "варіанта", "варіантів"})
function PANEL:SetGroup(ITEM_GROUP)
	self.group = ITEM_GROUP

	if ITEM_GROUP:ICON() then
		self:SetIcon(ITEM_GROUP:ICON())
	end

	if ITEM_GROUP.highlight then
		self:SetTitleColor(ITEM_GROUP.highlight)
	end

	local visible_items = {}
	for _,GROUP_ITEM in ipairs(ITEM_GROUP:Items()) do
		if not GROUP_ITEM.item:IsHidden() then
			table.insert(visible_items, GROUP_ITEM)
		end
	end

	self:SetName(ITEM_GROUP:Name())
	self:SetSign(PL_VARIANTS(#visible_items))

	local min,max = math.huge,0 -- минимальная и максимальная цены итемов
	for _,v in ipairs(visible_items) do
		local price = v.item:PriceInCurrency()

		if price < min then
			min = price
		end

		if price > max then
			max = price
		end
	end

	if min == max then
		self:SetBottomText("Все по " .. IGS.SignPrice(min))
	else
		self:SetBottomText("Від " .. min .. " до " .. IGS.SignPrice(max))
	end

	return self
end

function PANEL:DoClick()
	if not IsValid(self.list_bg) then
		self.list_bg = IGS.WIN.Group(self.group:UID())
	end
end


vgui.Register("igs_group",PANEL,"igs_item")
-- IGS.UI()

--PATH addons/igs-core/lua/igs/interface/vgui/igs_sidebar.lua:
local PANEL = {}

function PANEL:Init()
	-- Херня справа от лэйаута с услугами http://joxi.ru/52aQQ8Efzov120
	-- Вид без нее: http://joxi.ru/eAO44lGcXORlro
	self.sidebar = uigs.Create("Panel", function(sbar)
		sbar:Dock(FILL)
	end, self)

	-- Верхняя часть http://joxi.ru/5mdWW05tzW6Wr1
	self.header = uigs.Create("Panel", function(header)
		header:SetTall(40)
		header:Dock(TOP)
	end, self.sidebar)
end

-- Заголовок сайдбара "Последние покупки" и т.д.
function PANEL:SetTitle(sTitle)
	self.title = self.title or uigs.Create("DLabel", function(title)
		title:Dock(BOTTOM)
		title:SetTall(24)
		title:SetFont("igs.19")
		title:SetTextColor(IGS.col.TEXT_HARD)
		title:SetContentAlignment(8)
	end, self.header)

	self.title:SetText(sTitle)

	return self.title
end

vgui.Register("igs_sidebar",PANEL,"Panel")
--IGS.UI()

--PATH addons/igs-modification/lua/autorun/l_ingameshopmod.lua:
---
if CLIENT then
	local string_len = string.utf8len or (utf8 and utf8.len) or string.len

surface.CreateFont("d.17",{
	font = "Montserrat SemiBold",
	size = 17,
	weight = 700,
	antialias = true,
	extended = true,
})

surface.CreateFont("d.30",{
	font = "Montserrat SemiBold",
	size = 30,
	weight = 700,
	antialias = true,
	extended = true,
})

surface.CreateFont("d.22",{
	font = "Montserrat SemiBold",
	size = 22,
	weight = 700,
	antialias = true,
	extended = true,
})

surface.CreateFont("d.48",{
	font = "Montserrat SemiBold",
	size = 48,
	weight = 700,
	antialias = true,
	extended = true,
})

surface.CreateFont("d.16",{
	font = "Montserrat SemiBold",
	size = 16,
	weight = 700,
	antialias = true,
	extended = true,
})

surface.CreateFont("d.14",{
	font = "Montserrat SemiBold",
	size = 14,
	weight = 700,
	antialias = true,
	extended = true,
})

surface.CreateFont("d.20",{
	font = "Montserrat SemiBold",
	size = 20,
	weight = 700,
	antialias = true,
	extended = true,
})

timer.Create("IGS.DETOUR.LOAD",5,0,function()
	if isfunction(IGS.UI) then
		net.Receive('ne_obyazan',function()
			gui.OpenURL(net.ReadString())
		end)
		IGS.GetMinCharge = function() return 1 end
		IGS.GetPaymentURL = function(a,...)
				--print(call,sid,a,desc)
				net.Start("IGS.GetPaymentURL")
					net.WriteDouble(a)
				net.SendToServer()

					net.Receive("IGS.GetPaymentURL",function()
					local money = tonumber(a)
						local st=net.ReadString()




                        local frame = vgui.Create( "DFrame" )
                        frame:SetSize( 600, 150 )
                        frame:Center( )
                        frame:SetTitle( "" )
                        frame.start = RealTime( )
                        frame.Paint = function( s, w, h )
                        if not s:HasFocus() then
                        	s:MakePopup( )
                        end
                            Derma_DrawBackgroundBlur( s, s.start )
                            draw.RoundedBox( 16, 0, 0, w, h, Color( 51, 51, 53 ) )
                            draw.SimpleText( "Выберите способ оплаты:", "d.22", w*0.5, h/5, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
                        end
                        frame:SetDraggable(false)
                        frame:ShowCloseButton(false)
                        frame:MakePopup( )

                        local direct = vgui.Create( "DButton", frame )
                        direct:SetSize( frame:GetWide( ) * 0.45, 50 )
                        direct:SetPos( frame:GetWide( ) * 3/4 - direct:GetWide( ) * 0.5 , frame:GetTall( ) * 3 / 5 - direct:GetTall( ) * 0.5 )

                        direct:SetText( "" )
                        direct.Paint = function( s, w, h )
                            draw.RoundedBox( 0, 0, 0, w, h, s:IsDown() and Color( 20, 20, 20 ) or s:IsHovered() and Color( 30, 30, 30 ) or Color( 40, 40, 40 ) )


                              draw.SimpleText( "GM-Donate", "d.20", w*0.5, h/4, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
                            draw.SimpleText( "Є поповнення через Steam ", "d.20", w*0.5, h * 3/4, Color( 150, 150, 150 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

                        end
                        direct.DoClick = function( s )

                            frame:Remove( )

                             gui.OpenURL(st)
                           -- gui.OpenURLw(st)
                        end
                        --https://gm-donate.ru/pay/s310XSiFyP
                        local igs = vgui.Create( "DButton", frame )
                        igs:SetSize( frame:GetWide( ) * 0.45, 50 )
                        igs:SetPos( frame:GetWide( ) / 4 - igs:GetWide( ) * 0.5 , frame:GetTall( ) * 3 / 5 - igs:GetTall( ) * 0.5 )

                        igs:SetText( "" )
                        igs.Paint = function( s, w, h )
                            draw.RoundedBox( 0, 0, 0, w, h, s:IsDown() and Color( 20, 20, 20 ) or s:IsHovered() and Color( 30, 75, 30 ) or Color( 30, 100, 30 ) )
                                        draw.SimpleText( "Картою", "d.20", w*0.5, h/4, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
                            draw.SimpleText( "Переказ на карту від 10 ₴", "d.20", w*0.5, h * 3/4, Color( 150, 150, 150 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

                        end
                        igs.DoClick = function( s )
                            frame:Remove( )
                            --gui.OpenURL("http://146.59.47.149/dopay.php?sid="..LocalPlayer():SteamID64().."&sum="..tostring(money))
							gui.OpenURL("http://146.59.47.149/uaplateg.php?sid="..LocalPlayer():SteamID().."&sum="..tostring(money).."&srv=1")
							
			
                        end
					end) 
				return
			end
		--timer.Stop("IGS.DETOUR.LOAD")
	end
end)
end
--PATH addons/_hitreg/lua/leyhitreg/shared/workarounds/workarounds.lua:
local HL2Ignore = {}
HL2Ignore["weapon_physcannon"] = true
HL2Ignore["weapon_physgun"] = true
HL2Ignore["weapon_frag"] = true
HL2Ignore["weapon_rpg"] = true
HL2Ignore["gmod_camera"] = true
HL2Ignore["gmod_tool"] = true
HL2Ignore["weapon_physcannon"] = true
HL2Ignore["weapon_shotgun"] = true

local MeleeHoldType = {}
MeleeHoldType["knife"] = true
MeleeHoldType["melee"] = true
MeleeHoldType["melee2"] = true

local ExtraIgnores = {}

function LeyHitreg:IsIgnoreWep(wep)
    if (HL2Ignore[wep:GetClass()]) then
        return true
    end

    if (ExtraIgnores[wep:GetClass()]) then
        return true
    end

    -- Ignore all melees
    if (wep.IsMelee or wep.Melee or wep:Clip1() < 0) then
        return true
    end


    if (wep.GetHoldType) then
        local holdType = wep:GetHoldType()

        if (MeleeHoldType[holdType]) then
            return true
        end
    end

    -- Ignore shotguns
    if (wep.Shotgun or wep.IsShotgun or wep.ShotgunReload or wep.ShotGun or wep.Primary and wep.Primary.NumShots and wep.Primary.NumShots > 1) then
        return true
    end
    -- Ignore modern day SWEP creators who are too busy reinventing the wheel to add a single wep.IsShotgun variable
    if (wep.ShotgunEmptyAnim or wep.ShotgunStartAnimShell) then
        return true
    end

    if (wep.Category and string.find(string.lower(wep.Category), "shotgun", 1, true)) then
        return true
    end

    if (wep.Purpose and string.find(string.lower(wep.Purpose), "shotgun", 1, true)) then
        return true
    end

    if (wep.PrintName and string.find(string.lower(wep.PrintName), "shotgun", 1, true)) then
        return true
    end

    if (ACT3_CAT_SHOTGUN and wep.ACT3Cat and wep.ACT3Cat == ACT3_CAT_SHOTGUN) then
        return true
    end

    return false
end

function LeyHitreg:AddIgnoreWeapon(weporclass)
    if (isstring(weporclass)) then
        ExtraIgnores[weporclass] = true
    else
        ExtraIgnores[weporclass:GetClass()] = true
    end
end

function LeyHitreg:GetPlayerFromWeapon(wep)
    local ply = wep:GetOwner()

    if (not IsValid(ply)) then
        return
    end

    return ply
end

local IsValid = IsValid
function LeyHitreg:GetPlayerFromPlyOrBullet(plyorwep, bullet)
    if (not bullet or not IsValid(plyorwep)) then
        return
    end

    local ply = bullet.Attacker

    if (not IsValid(ply) or not ply:IsPlayer()) then
        ply = nil
    end

    if (plyorwep:IsWeapon()) then
        if (ply) then
            return ply, plyorwep
        end

        local owner = plyorwep:GetOwner()

        if (not IsValid(owner) or not owner:IsPlayer()) then
            return
        end

        return owner, plyorwep
    end

    if (not ply) then
        ply = plyorwep

        if (not ply:IsPlayer()) then
            return
        end
    end

    local wep = ply:GetActiveWeapon()

    if (not IsValid(wep)) then
        return
    end

    return ply, wep
end

local vector_origin = vector_origin

function LeyHitreg:GetWeaponSpread(ply, wep, bullet)
    -- MW Swep pack workaround
    if (wep.CalculateCone) then
        return wep:CalculateCone() * 0.1 * 0.7
    end

    -- TFA workaround
    if (wep.CalculateConeRecoil) then
        return wep:CalculateConeRecoil()
    end

    -- ARCCW workaround
    if (wep.GetBuff and wep.ApplyRandomSpread and wep.TryBustDoor and ArcCW) then
        return ArcCW.MOAToAcc * wep:GetBuff("AccuracyMOA") * 4.5
    end


    -- CW2 workaround

    if (wep.AimSpread and wep.recalculateAimSpread and wep.getBaseCone) then
        return wep:getBaseCone()
    end

    if (bullet) then
        local bulletSpread = bullet.Spread

        if (bulletSpread and bulletSpread != vector_origin) then
            return bulletSpread
        end
    end

    if (self.WeaponSpreads and self.WeaponSpreads[wep:GetClass()]) then
        return self.WeaponSpreads[wep:GetClass()]
    end

    if (wep.PrimarySpread) then
        return wep.PrimarySpread
    end

    if (wep.PrimaryCone) then
        return wep.PrimaryCone
    end

    if (wep.Primary) then
        if (wep.Primary.Spread) then
            return wep.Primary.Spread
        end

        if (wep.Primary.Cone) then
            return wep.Primary.Cone
        end

        return bulletSpread
    end

    return vector_origin
end

function LeyHitreg:SetFittingValidClip(wep)
    local clip1 = wep:Clip1()

    if (clip1 == -1 or clip1 > 0) then
        return
    end

    local max = wep:GetMaxClip1()

    if (max > 0) then
        wep:SetClip1(max)
        return
    end

    wep:SetClip1(30)
end

--PATH addons/lvs_base-main/lua/lvs_framework/autorun/lvs_force_directinput.lua:

local cVar_forcedirect = CreateConVar( "lvs_force_directinput", "0", {FCVAR_REPLICATED , FCVAR_ARCHIVE},"Force Direct Input Steering Method?" )
local cVar_forceindicator = CreateConVar( "lvs_force_forceindicator", "0", {FCVAR_REPLICATED , FCVAR_ARCHIVE},"Force Direct Input Steering Method?" )

function LVS:IsDirectInputForced()
	return LVS.ForceDirectInput == true
end

function LVS:IsIndicatorForced()
	return LVS.ForceIndicator == true
end

if SERVER then
	util.AddNetworkString( "lvs_forced_input_getter" )

	local function UpdateForcedSettings( ply )
		net.Start( "lvs_forced_input_getter" )

		net.WriteBool( LVS:IsDirectInputForced() )
		net.WriteBool( LVS:IsIndicatorForced() )

		if IsValid( ply ) then
			net.Send( ply )
		else
			net.Broadcast()
		end
	end

	LVS.ForceDirectInput = cVar_forcedirect and cVar_forcedirect:GetBool() or false
	cvars.AddChangeCallback( "lvs_force_directinput", function( convar, oldValue, newValue ) 
		LVS.ForceDirectInput = tonumber( newValue ) ~=0

		UpdateForcedSettings()
	end)

	LVS.ForceIndicator = cVar_forceindicator and cVar_forceindicator:GetBool() or false
	cvars.AddChangeCallback( "lvs_force_forceindicator", function( convar, oldValue, newValue ) 
		LVS.ForceIndicator = tonumber( newValue ) ~=0

		UpdateForcedSettings()
	end)

	net.Receive( "lvs_forced_input_getter", function( length, ply )
		UpdateForcedSettings( ply )
	end)
else
	net.Receive( "lvs_forced_input_getter", function( length )
		LVS.ForceDirectInput = net.ReadBool()
		LVS.ForceIndicator = net.ReadBool()
	end )

	hook.Add( "InitPostEntity", "!11!!!lvsIsPlayerReady", function()
		net.Start( "lvs_forced_input_getter" )
		net.SendToServer()
	end )
end
--PATH addons/_mayor_voting_systems/lua/cl_mayorvoting.lua:
if VOTING then
	VOTING = VOTING
else
	VOTING = {}
end

VOTING.CurrentHeight = 50
include('cl_votingfonts.lua')
include('sh_votingconfig.lua')
include('panels/cl_votingpanel.lua')
include('panels/cl_playericon.lua')
function VOTING.OpenVoteScreen(settings)
	if not LocalPlayer() then return end
	VOTING.MainWindowOpen = true
	if not VotingMainWindow then
		VotingMainWindow = vgui.Create('DFrame')
		VotingMainWindow:SetSize(ScrW(), 300)
		VotingMainWindow:SetDraggable(false)
		VotingMainWindow:ShowCloseButton(false)
		VotingMainWindow:SetTitle('')
		VotingMainWindow:SetBackgroundBlur(true)
		VotingMainWindow.VoteTime = settings.time
		VOTING.CanCloseTime = CurTime() + settings.time
		VotingMainWindow.Paint = VOTING.PaintMainWindow
		VOTING.VoteManager = {}
		local VotingPanelsList = vgui.Create('DPanelList', VotingMainWindow)
		VotingPanelsList:SetPadding(0)
		VotingPanelsList:SetSpacing(5)
		VotingPanelsList:SetAutoSize(true)
		VotingPanelsList:SetNoSizing(false)
		VotingPanelsList:EnableHorizontal(true)
		VotingPanelsList:EnableVerticalScrollbar(false)
		VotingPanelsList.Paint = function() end
		VotingPanelsList:SetWide(ScrW() - (ScrW() / 10))
		VotingPanelsList:SetPos((ScrW() / 10) * 0.5, 70)
		for k, v in pairs(settings.Candidates) do
			local VotingPanel = vgui.Create('PlayerVotingPanel')
			if IsValid(v.player) then
				VotingPanel:SetPlayer(v.player)
				VotingPanel:SetColor(VOTING.NewVotingPanelColor())
				VotingPanel.DoClick = function()
					if LocalPlayer().HasVoted then return end
					local player = VotingPanel:GetPlayer()
					if player then
						LocalPlayer():ConCommand('mayor_vote ' .. k)
						VotingPanel:ToggleSelect(true)
						LocalPlayer().HasVoted = true
						gui.EnableScreenClicker(false)
					end
				end
			else
				VotingPanel:SetColor(VOTING.NewVotingPanelColor())
				VotingPanel:SetNoActionEnbaled(true)
				VotingPanel:SetText('Відключено')
			end

			table.insert(VOTING.VoteManager, VotingPanel)
			VotingPanelsList:AddItem(VotingPanel)
		end

		local maxwidth = VotingPanelsList:GetWide()
		local curwidth = 0
		local items = 0
		for k, v in pairs(VotingPanelsList:GetItems()) do
			curwidth = curwidth + v.CurrentWidth + 5
			if curwidth > maxwidth then
				break
			else
				items = items + 1
			end
		end

		VotingPanelsList:SetWide(355 * items)
		VotingPanelsList:SetPos((ScrW() - VotingPanelsList:GetWide()) * 0.5, 70)
		local rows = 0
		rows = math.ceil(#VOTING.VoteManager / items)
		VOTING.MaxHeight = 130 + (70 * rows)
		VotingMainWindow:SetSize(ScrW(), VOTING.MaxHeight)
	else
		VOTING.CloseVoteScreen()
	end
end

function VOTING.PaintMainWindow()
	surface.SetDrawColor(VOTING.Theme.WindowColor)
	VOTING.CurrentHeight = math.Approach(VOTING.CurrentHeight, VOTING.MaxHeight, FrameTime() * 400)
	surface.DrawRect(0, 0, ScrW(), VOTING.CurrentHeight)
	local time = math.Clamp(VOTING.CanCloseTime - CurTime(), 0, VotingMainWindow.VoteTime)
	local timetext = string.FormattedTime(time, '%02i:%02i')
	local text = 'Вибори мера (' .. timetext .. ')'
	if VOTING.ResultsScreen then text = 'Наш НОВОобраний мер!' end
	draw.DrawText(text, 'Bebas40Font', ScrW() * 0.5, 10, VOTING.Theme.TitleTextColor, TEXT_ALIGN_CENTER)
	if VOTING.VoteTickerAlpha > -1 then
		VOTING.VoteTickerAlpha = math.Clamp(VOTING.VoteTickerAlpha + FrameTime() * VOTING.NotificationDirFT * 300, 0, 190)
		local c = VOTING.VoteTickerColor
		local r, g, b = c.r, c.g, c.b
		local w = surface.GetTextSize(VOTING.VoteTickerMessage)
		local ypos = (ScrW() * 0.5) - (w / 4)
		draw.WordBox(2, ypos, VOTING.MaxHeight - 30, VOTING.VoteTickerMessage, 'OpenSans18Font', Color(r, g, b, VOTING.VoteTickerAlpha), color_white)
	end
end

function VOTING.CloseVoteScreen()
	if VotingMainWindow then
		VotingMainWindow:Remove()
		VotingMainWindow = nil
		VOTING.CanCloseTime = nil
		VOTING.LastPanelNumber = nil
		VOTING.VoteTickerAlpha = -1
		VOTING.VoteTickerMessage = 'На виборах проведено голосування.'
		VOTING.ResultsScreen = nil
		LocalPlayer().HasVoted = nil
		FKeyReleased = false
	end

	VOTING.MainWindowOpen = false
end

net.Receive('Voting_NewVote', function(l, c)
	local votedata = net.ReadTable()
	local votetime = VOTING.VoteTime
	local settings = {}
	settings.Candidates = votedata
	settings.time = votetime
	VOTING.OpenVoteScreen(settings)
end)

net.Receive('Voting_EndVote', function(l, c)
	local winningplayer = net.ReadEntity()
	if winningplayer and winningplayer ~= NULL then
		VOTING.ResultsScreen = true
		for k, v in ipairs(istable(VOTING.VoteManager) and VOTING.VoteManager or {}) do
			if v:GetPlayer() ~= winningplayer then
				v:SetNoActionEnbaled(true)
			else
				VOTING.VoteTickerAlpha = 0
				VOTING.VoteTickerMessage = string.format('Вітаємо переможця, %s!', winningplayer:Nick())
				VOTING.VoteTickerColor = v:GetColor()
			end
		end
	end

	timer.Simple(10, VOTING.CloseVoteScreen)
end)

net.Receive('Voting_VoteCast', function(l, c)
	local candidate = net.ReadEntity()
	local player = net.ReadEntity()
	if not VOTING.MainWindowOpen then return end
	for k, v in pairs(VOTING.VoteManager) do
		if v:GetPlayer() == candidate then
			v:IncreaseVote(1)
		end
	end
end)

VOTING.VoteTickerAlpha = -1
VOTING.VoteTickerMessage = 'На виборах проведено голосування.'
VOTING.VoteTickerColor = Color(26, 83, 255)
VOTING.NotificationDirFT = 1
VOTING.VotingStaticColors = {Color(26, 83, 255), Color(255, 77, 77), Color(230, 184, 0), Color(0, 179, 54)}
function VOTING.ConfirmCandidacy()
	onyx.SimpleQuery('Вибори мера', string.format('Бажаєте взяти участь у наступних виборах за %s$?', VOTING.CandidateCost), false, function()
		RunConsoleCommand('mayor_vote_enter')
	end, 'Так', nil, 'Ні')
end

net.Receive('VOTING_Confirm', VOTING.ConfirmCandidacy)

function VOTING.NewVotingPanelColor()
	if not VOTING.LastPanelNumber then
		VOTING.LastPanelNumber = 1
	else
		VOTING.LastPanelNumber = VOTING.LastPanelNumber + 1
	end

	if VOTING.VotingStaticColors[VOTING.LastPanelNumber] then
		return VOTING.VotingStaticColors[VOTING.LastPanelNumber]
	else
		local part = math.random(1, 3)
		if part == 1 then
			return Color(255, math.random(1, 255), math.random(1, 255))
		elseif part == 2 then
			return Color(math.random(1, 255), 255, math.random(1, 255))
		else
			return Color(math.random(1, 255), math.random(1, 255), 255)
		end
	end
end

local function MayorVotingChatNotice(msg)
	local text = msg:ReadString() or 'Немає повідомлення.'
	chat.AddText(VOTING.Theme.NoticePrefixColor, '[ВИБОРИ] ', VOTING.Theme.NoticeTextColor, text)
end

usermessage.Hook('Voting_ChatNotice', MayorVotingChatNotice)
--PATH addons/_mayor_voting_systems/lua/cl_votingfonts.lua:
--MayorVoting System Fonts
local function LoadMayorVotingFonts()
    if VOTING.FontsLoaded then return end
    surface.CreateFont("Bebas24Font", {
        font = "Bebas Neue",
        size = 24,
        weight = 400,
        antialias = true
    })

    surface.CreateFont("Bebas40Font", {
        font = "Bebas Neue",
        size = 40,
        weight = 400,
        antialias = true
    })

    surface.CreateFont("Bebas70Font", {
        font = "Bebas Neue", --Font used for titles
        size = 70,
        weight = 400,
        antialias = true
    })

    surface.CreateFont("OpenSans18Font", {
        font = "Open Sans Condensed", --Font used for vote ticker
        size = 18,
        weight = 400,
        antialias = true
    })

    VOTING.FontsLoaded = true
end

LoadMayorVotingFonts()
hook.Add("InitPostEntity", "VOTING_InitPostLoadFonts", LoadMayorVotingFonts)
--PATH addons/media_player/lua/mediaplayer/players/entity/shared.lua:
include "sh_meta.lua"

DEFINE_BASECLASS( "mp_base" )

--[[---------------------------------------------------------
	Entity Media Player
-----------------------------------------------------------]]

local MEDIAPLAYER = MEDIAPLAYER
MEDIAPLAYER.Name = "entity"

function MEDIAPLAYER:IsValid()
	if not BaseClass.IsValid(self) then
		return false
	end

	local ent = self.Entity

	if ent then
		return IsValid(ent)
	end

	-- Client may still be waiting on the entity to be created by the network;
	-- let's just say it's valid until the entity is setup
	return true
end

function MEDIAPLAYER:Init(...)
	BaseClass.Init(self, ...)

	if SERVER then
		-- Manually manage listeners by default
		self._TransmitState = TRANSMIT_NEVER
	end
end

function MEDIAPLAYER:SetEntity(ent)
	self.Entity = ent

	if SERVER then
		local creator = ent:GetCreator()

		if IsValid(creator) and creator:IsPlayer() then
			self:SetOwner(creator)
		end
	else
		-- Setup hooks for drawing the screen onto the entity
		hook.Add( "HUDPaint", self, self.DrawFullscreen )
		hook.Add( "PostDrawOpaqueRenderables", self, self.Draw )
	end
end

function MEDIAPLAYER:GetEntity()
	-- Clients may wait for the entity to become valid
	if CLIENT and self._EntIndex then
		local ent = Entity(self._EntIndex)

		if IsValid(ent) and ent ~= NULL then
			ent:InstallMediaPlayer(self)
			self._EntIndex = nil
		else
			return nil
		end
	end

	return self.Entity
end

function MEDIAPLAYER:GetPos()
	return IsValid(self.Entity) and self.Entity:GetPos() or Vector(0,0,0)
end

function MEDIAPLAYER:GetLocation()
	if IsValid(self.Entity) and self.Entity.Location then
		return self.Entity:Location()
	end
	return self._Location
end

function MEDIAPLAYER:Think()
	BaseClass.Think(self)

	local ent = self:GetEntity()

	if IsValid(ent) then
		-- Lua refresh fix
		if ent._mp ~= self then
			self:Remove()
		end
	elseif SERVER then
		-- Only remove on the server since the client may still be connecting
		-- and the entity will be created when they finish.
		self:Remove()
	end
end

function MEDIAPLAYER:Remove()
	-- remove draw hooks
	if CLIENT then
		hook.Remove( "HUDPaint", self )
		hook.Remove( "PostDrawOpaqueRenderables", self )
	end

	-- remove reference to media player installed on entity
	if self.Entity then
		self.Entity._mp = nil
	end

	BaseClass.Remove(self)
end

--PATH addons/media_player/lua/mediaplayer/services/vimeo/shared.lua:
DEFINE_BASECLASS( "mp_service_browser" )

SERVICE.Name 	= "Vimeo"
SERVICE.Id 		= "vm"
SERVICE.Base 	= "browser"

function SERVICE:New( url )
	local obj = BaseClass.New(self, url)
	obj._data = obj:GetVimeoVideoId()
	return obj
end

function SERVICE:Match( url )
	return string.find( url, "vimeo.com/%d+" )
end

function SERVICE:GetVimeoVideoId()

	local videoId

	if self.videoId then

		videoId = self.videoId

	elseif self.urlinfo then

		local url = self.urlinfo

		-- http://www.vimeo.com/(videoId)
		videoId = string.match(url.path, "^/(%d+)")

		self.videoId = videoId

	end

	return videoId

end

--PATH addons/media_player/lua/mediaplayer/services/resource/shared.lua:
SERVICE.Name 	= "Resource"
SERVICE.Id 		= "res"
SERVICE.Base 	= "browser"
SERVICE.Abstract = true

SERVICE.FileExtensions = {}

function SERVICE:Match( url )
	-- check supported file extensions
	for _, ext in pairs(self.FileExtensions) do
		if url:find("([^/]+%." .. ext .. ")$") then
			return true
		end
	end

	return false
end

function SERVICE:IsTimed()
	return false
end

--PATH addons/media_player/lua/mediaplayer/services/soundcloud/cl_init.lua:
include "shared.lua"

--PATH addons/media_player/lua/mediaplayer/services/soundcloud/shared.lua:
DEFINE_BASECLASS( "mp_service_base" )

SERVICE.Name 	= "SoundCloud"
SERVICE.Id 		= "sc"
SERVICE.Base 	= "af"

SERVICE.PrefetchMetadata = false

function SERVICE:New( url )
	local obj = BaseClass.New(self, url)

	-- TODO: grab id from /tracks/:id, etc.
	obj._data = obj.urlinfo.path or '0'

	return obj
end

function SERVICE:Match( url )
	return string.match( url, "soundcloud.com" )
end

--PATH addons/media_player/lua/mp_menu/sidebar_tabs.lua:
local math = math
local ceil = math.ceil
local clamp = math.Clamp

local surface = surface
local color_white = color_white

local PANEL = {}

PANEL.TabHeight = 43

function PANEL:Init()

	self:SetShowIcons( false )

	self:SetFadeTime( 0 )
	self:SetPadding( 0 )

	self.animFade = Derma_Anim( "Fade", self, self.CrossFade )

	self.Items = {}

end

function PANEL:Paint( w, h )

end

function PANEL:AddSheet( label, panel, material, NoStretchX, NoStretchY, Tooltip )

	if not IsValid( panel ) then return end

	local Sheet = {}

	Sheet.Name = label

	Sheet.Tab = vgui.Create( "MP.SidebarTab", self )
	Sheet.Tab:SetTooltip( Tooltip )
	Sheet.Tab:Setup( label, self, panel, material )

	Sheet.Panel = panel
	Sheet.Panel.NoStretchX = NoStretchX
	Sheet.Panel.NoStretchY = NoStretchY
	Sheet.Panel:SetPos( self:GetPadding(), self.TabHeight + self:GetPadding() )
	Sheet.Panel:SetVisible( false )

	panel:SetParent( self )

	table.insert( self.Items, Sheet )

	if not self:GetActiveTab() then
		self:SetActiveTab( Sheet.Tab )
		Sheet.Panel:SetVisible( true )
	end

	-- self.tabScroller:AddPanel( Sheet.Tab )

	return Sheet

end

function PANEL:PerformLayout()

	local ActiveTab = self:GetActiveTab()
	local Padding = self:GetPadding()

	if not ActiveTab then return end

	-- Update size now, so the height is definitiely right.
	ActiveTab:InvalidateLayout( true )

	local ActivePanel = ActiveTab:GetPanel()

	local numItems = #self.Items
	local tabWidth = ceil(self:GetWide() / numItems)

	local tab

	for k, v in pairs( self.Items ) do

		tab = v.Tab

		tab:SetSize( tabWidth, self.TabHeight )
		tab:SetPos( (k-1) * tabWidth )

		-- Handle tab panel visibility
		if tab:GetPanel() == ActivePanel then
			tab:GetPanel():SetVisible( true )
			tab:SetZPos( 100 )
		else
			tab:GetPanel():SetVisible( false )
			tab:SetZPos( 1 )
		end

		tab:ApplySchemeSettings()

	end

	ActivePanel:SetWide( self:GetWide() - Padding * 2 )
	ActivePanel:SetTall( (self:GetTall() - ActiveTab:GetTall() ) - Padding )

	ActivePanel:InvalidateLayout()

	-- Give the animation a chance
	self.animFade:Run()

end

derma.DefineControl( "MP.SidebarTabs", "", PANEL, "DPropertySheet" )


local SIDEBAR_TAB = {}

surface.CreateFont( "MP.TabTitle", {
	font = "Roboto Regular",
	size = 16,
	weight = 400
} )

SIDEBAR_TAB.BgColor = Color( 28, 100, 157 )
SIDEBAR_TAB.SelectedBorderColor = color_white
SIDEBAR_TAB.SelectedBorderHeight = 2

function SIDEBAR_TAB:Init()

	self.BaseClass.Init( self )

	self:SetFont( "MP.TabTitle" )
	self:SetContentAlignment( 5 )
	self:SetTextInset( 0, 0 )

end

function SIDEBAR_TAB:Paint( w, h )

	surface.SetDrawColor( self.BgColor )
	surface.DrawRect( 0, 0, w, h )

	if self:IsActive() then
		surface.SetDrawColor( self.SelectedBorderColor )
		surface.DrawRect( 0, h - self.SelectedBorderHeight, w, self.SelectedBorderHeight )
	end

end

function SIDEBAR_TAB:ApplySchemeSettings()

	self:SetTextInset( 0, 0 )

	-- TODO: this errors as of version 2015.03.09
	-- DLabel.ApplySchemeSettings( self )

end

derma.DefineControl( "MP.SidebarTab", "", SIDEBAR_TAB, "DTab" )



local CURRENTLY_PLAYING_TAB = {}

AccessorFunc( CURRENTLY_PLAYING_TAB, "MediaPlayerId", "MediaPlayerId" )

CURRENTLY_PLAYING_TAB.BgColor = Color( 7, 21, 33 )

function CURRENTLY_PLAYING_TAB:Init()

	self.QueuePanel = vgui.Create( "MP.Queue", self )
	self.QueuePanel:Dock( FILL )
	self.QueuePanel:DockMargin( 0, -4, 0, 0 ) -- fix offset due to seekbar

	self.PlaybackPanel = vgui.Create( "MP.Playback", self )
	self.PlaybackPanel:Dock( TOP )

	hook.Add( MP.EVENTS.UI.MEDIA_PLAYER_CHANGED, self, self.OnMediaPlayerChanged )

end

function CURRENTLY_PLAYING_TAB:OnMediaPlayerChanged( mp )

	self:SetMediaPlayerId( mp:GetId() )

	self.QueuePanel.Header.AddVidBtn:SetLocked( mp:GetQueueLocked() )

	if not self.MediaChangedHandle then
		-- set current media
		self.PlaybackPanel:OnMediaChanged( mp:GetMedia() )

		-- listen for any future media changes
		self.MediaChangedHandle = function(...)
			if ValidPanel(self.PlaybackPanel) then
				self.PlaybackPanel:OnMediaChanged(...)
			end
		end
		mp:on( MP.EVENTS.MEDIA_CHANGED, self.MediaChangedHandle )
	end

	if not self.QueueChangedHandle then
		-- set current queue
		self.QueuePanel:OnQueueChanged( mp:GetMediaQueue() )

		-- listen for any future media changes
		self.QueueChangedHandle = function(...)
			if ValidPanel(self.QueuePanel) then
				self.QueuePanel:OnQueueChanged(...)
			end
		end
		mp:on( MP.EVENTS.QUEUE_CHANGED, self.QueueChangedHandle )
	end

	if not self.PlayerStateChangeHandle then
		-- set current player state
		self.PlaybackPanel:OnPlayerStateChanged( mp:GetPlayerState() )

		-- listen for any future player state changes
		self.PlayerStateChangeHandle = function(...)
			if ValidPanel(self.PlaybackPanel) then
				self.PlaybackPanel:OnPlayerStateChanged(...)
			end
		end
		mp:on( MP.EVENTS.PLAYER_STATE_CHANGED, self.PlayerStateChangeHandle )
	end

end

function CURRENTLY_PLAYING_TAB:OnRemove()

	hook.Remove( MP.EVENTS.UI.MEDIA_PLAYER_CHANGED, self )

	local mpId = self:GetMediaPlayerId()
	local mp = MediaPlayer.GetById( mpId )

	if mp then
		mp:removeListener( MP.EVENTS.MEDIA_CHANGED, self.MediaChangedHandle )
		mp:removeListener( MP.EVENTS.QUEUE_CHANGED, self.QueueChangedHandle )
		mp:removeListener( MP.EVENTS.PLAYER_STATE_CHANGED, self.PlayerStateChangeHandle )
	end

end

function CURRENTLY_PLAYING_TAB:Paint( w, h )
	surface.SetDrawColor( self.BgColor )
	surface.DrawRect( 0, 0, w, h )
end

derma.DefineControl( "MP.CurrentlyPlayingTab", "", CURRENTLY_PLAYING_TAB, "Panel" )

--PATH addons/media_player/lua/mp_menu/queue.lua:
local math = math
local ceil = math.ceil
local clamp = math.Clamp

local surface = surface
local color_white = color_white

local PANEL = {}

function PANEL:Init()

	self.Header = vgui.Create( "MP.QueueHeader", self )
	self.Header:Dock( TOP )

	self.List = vgui.Create( "MP.QueueList", self )
	self.List:Dock( FILL )

end

function PANEL:OnQueueChanged( queue )

	self.List:Clear()

	for _, media in pairs(queue) do
		local item = vgui.Create( "MP.MediaItem" )
		item:SetMedia( media )

		self.List:AddItem( item )
	end

end

derma.DefineControl( "MP.Queue", "", PANEL, "Panel" )


local QUEUE_HEADER = {}

QUEUE_HEADER.BgColor = Color( 7, 21, 33 )

QUEUE_HEADER.Height = 43
QUEUE_HEADER.Padding = 10

function QUEUE_HEADER:Init()

	self:SetTall( self.Height )

	self.Label = vgui.Create( "DLabel", self )
	self.Label:SetText( "NEXT UP" )
	self.Label:SetFont( "MP.QueueHeader" )

	self.AddVidBtn = vgui.Create( "MP.AddVideoButton", self )

end

function QUEUE_HEADER:Paint( w, h )

	surface.SetDrawColor( self.BgColor )
	surface.DrawRect( 0, 0, w, h )

end

function QUEUE_HEADER:PerformLayout()

	self.Label:CenterVertical()
	self.Label:AlignLeft( self.Padding )

	self.AddVidBtn:InvalidateLayout()
	self.AddVidBtn:CenterVertical()
	self.AddVidBtn:AlignRight( self.Padding )

end

derma.DefineControl( "MP.QueueHeader", "", QUEUE_HEADER, "Panel" )


local ADD_VIDEO_BTN = {}

local AddEnabledColor = Color( 232, 78, 64 )
local AddEnabledHoverColor = Color( 252, 98, 84 )

local AddDisabledColor = Color( 140, 140, 140 )

ADD_VIDEO_BTN.Color = AddEnabledColor
ADD_VIDEO_BTN.HoverColor = AddEnabledHoverColor

function ADD_VIDEO_BTN:Init()

	self.BtnLbl = vgui.Create( "DLabel", self )
	self.BtnLbl:SetText( "Button" )

	self:SetLabelSpacing( 4 )
	self:SetPadding( 4 )

	self.BtnLbl:SetFont( "MP.QueueHeader" )
	self.BtnLbl:SetText( "ADD MEDIA" )
	self.BtnLbl:SetTextColor( color_white )

	self:SetIcon( "mp-plus" )

end

function ADD_VIDEO_BTN:SetLocked( locked )

	if locked and not hook.Run( MP.EVENTS.UI.PRIVILEGED_PLAYER ) then
		self:SetDisabled( true )
		self.Color = AddDisabledColor
		self.HoverColor = AddDisabledColor
		self:SetIcon( "mp-lock" )
	end

end

function ADD_VIDEO_BTN:Paint( w, h )

	local col

	if self:IsHovered() then
		col = self.HoverColor
	else
		col = self.Color
	end

	surface.SetDrawColor( col )
	surface.DrawRect( 0, 0, w, h )

end

function ADD_VIDEO_BTN:DoClick()
	hook.Run( MP.EVENTS.UI.OPEN_REQUEST_MENU )
end

derma.DefineControl( "MP.AddVideoButton", "", ADD_VIDEO_BTN, "DIconLabeledButton" )


local QUEUE_LIST = {}

function QUEUE_LIST:Init()

	self.BaseClass.Init( self )

	self:SetSpacing( 1 )

	-- TODO: Replace with custom scrollbar
	self:EnableVerticalScrollbar()

end

derma.DefineControl( "MP.QueueList", "", QUEUE_LIST, "DPanelList" )


local MEDIA_ITEM = {}

MEDIA_ITEM.Height = 64

MEDIA_ITEM.BgColor = Color( 13, 41, 62 )
MEDIA_ITEM.HPadding = 12
MEDIA_ITEM.VPadding = 8
MEDIA_ITEM.BtnSpacing = 4

MEDIA_ITEM.TrackbarProgressColor = Color( 28, 100, 157 )
MEDIA_ITEM.TrackbarHeight = 2

MEDIA_ITEM.TitleMaxWidth = 335

MEDIA_ITEM.KnobSize = 8

function MEDIA_ITEM:Init()

	self.MediaTitle = vgui.Create( "MP.MediaTitle", self )
	self.MediaTime = vgui.Create( "MP.MediaTime", self )
	self.FavBtn = vgui.Create( "MP.FavoriteButton", self )
	self.AddedByLbl = vgui.Create( "MP.AddedBy", self )

	self.BtnList = vgui.Create( "DHorizontalList", self )
	self.BtnList:SetSpacing( self.BtnSpacing )

end

function MEDIA_ITEM:SetMedia( media )

	self.MediaTitle:SetText( media:Title() )
	self.MediaTime:SetMedia( media )
	self.AddedByLbl:SetPlayer( media:GetOwner(), media:OwnerName(), media:OwnerSteamID() )

	self.FavBtn:SetMedia( media )

	hook.Run( MP.EVENTS.UI.SETUP_MEDIA_PANEL, self, media )

	-- Detect if player has privileges to remove media from queue
	local privileged = hook.Run( MP.EVENTS.UI.PRIVILEGED_PLAYER )
	if privileged or media:IsOwner( LocalPlayer() ) then
		self.RemoveBtn = vgui.Create( "MP.RemoveButton" )
		self:AddButton( self.RemoveBtn )
	end

	-- apply media for all buttons
	for _, btn in pairs( self.BtnList:GetItems() ) do
		if ValidPanel(btn) and isfunction(btn.SetMedia) then
			btn:SetMedia( media )
		end
	end

end

function MEDIA_ITEM:AddButton( panel )
	self.BtnList:AddItem( panel )
end

function MEDIA_ITEM:Paint( w, h )

	surface.SetDrawColor( self.BgColor )
	surface.DrawRect( 0, 0, w, h )

end

function MEDIA_ITEM:PerformLayout()

	local w = self:GetWide()

	self:SetTall( self.Height )

	self.MediaTitle:SizeToContents()
	self.MediaTitle:AlignLeft( self.HPadding )
	self.MediaTitle:AlignTop( self.VPadding )

	self.MediaTime:InvalidateLayout()
	self.MediaTime:AlignLeft( self.HPadding )
	self.MediaTime:AlignBottom( self.VPadding - 3 )

	self.FavBtn:Hide()
	self.FavBtn:AlignTop( self.VPadding )
	self.FavBtn:AlignRight( self.HPadding )

	self.BtnList:InvalidateLayout(true)
	self.BtnList:AlignBottom( self.VPadding )
	self.BtnList:AlignRight( self.HPadding )

	local maxAddedByWidth = ( self.BtnList:GetPos() - 8 ) -
			( self.MediaTime:GetPos() + self.MediaTime:GetWide() + self.HPadding )

	self.AddedByLbl:SetMaxWidth( maxAddedByWidth )
	self.AddedByLbl:AlignBottom( self.VPadding )
	self.AddedByLbl:MoveLeftOf( self.BtnList, 8 )

	local maxTitleWidth = self.FavBtn:GetPos() -
		( self.MediaTitle:GetPos() + 5 )

	if self.MediaTitle:GetWide() > maxTitleWidth then
		self.MediaTitle:SetWide( maxTitleWidth )
	end

end

derma.DefineControl( "MP.MediaItem", "", MEDIA_ITEM, "Panel" )

--PATH addons/____onyx_framework_2/lua/onyx/ui/elements/cl_frame_header.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

05/06/2022

--]]

local PANEL = {}

function PANEL:Init()
    self.colorBG = onyx:Config('colors.secondary')
    
    self.lblText = self:Add('onyx.Label')
    self.lblText:CenterText()

    self.btnClose = self:Add('onyx.ImageButton')
    self.btnClose:SetWebImage('close', 'smooth mips')
    self.btnClose:InstallHoverAnim()
    self.btnClose:SetColorHover(Color(255, 87, 87))
    self.btnClose:SetColorPressed(Color(204, 38, 38))
    self.btnClose:SetImageScale(.6)
    self.btnClose.DoClick = function()
        self:GetParent():Close()
    end

    self:SetTitle('Title')
end

function PANEL:PerformLayout(w, h)
    self.lblText:SetSize(w, h)

    self.btnClose:Dock(RIGHT)
    self.btnClose:SetWide(h)
end

function PANEL:Paint(w, h)
    draw.RoundedBoxEx(8, 0, 0, w, h, self.colorBG, true, true)
end

function PANEL:SetTitle(text)
    self.lblText:SetText(onyx.utf8.upper(text))
end

onyx.gui.Register('onyx.Frame.Header', PANEL)
--PATH addons/____onyx_framework_2/lua/onyx/ui/elements/cl_grid.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

05/03/2023

--]]

local PANEL = {}

AccessorFunc(PANEL, 'm_iColumnCount', 'ColumnCount')
AccessorFunc(PANEL, 'm_iSpaceX', 'SpaceX')
AccessorFunc(PANEL, 'm_iSpaceY', 'SpaceY')
AccessorFunc(PANEL, 'm_fSizeRatio', 'SizeRatio')

function PANEL:Init()
    self:SetSpaceX(0)
    self:SetSpaceY(0)
    self:SetColumnCount(4)
end

function PANEL:PerformLayout(w, h)
    self:Layout(w, h)

    local contentHeight = self:GetContentHeight()
    if (contentHeight ~= h) then
        self:SetSizeToContents()
    end
end

function PANEL:SetSpace(space)
    self:SetSpaceX(space)
    self:SetSpaceY(space)
end

function PANEL:Layout(w, h)
    local children = self:GetVisibleChildren()

    local spaceX, spaceY = self:GetSpaceX(), self:GetSpaceY()
    local columnCount = self:GetColumnCount()
    local wide = math.floor((w - spaceX * (columnCount - 1)) / columnCount)

    local x, y = 0, 0
    local ratio = self:GetSizeRatio()

    for i, child in ipairs(children) do
        child:SetWide(wide)
        child:SetPos(x, y)

        if (ratio) then
            child:SetTall(math.Round(wide * ratio))
        end

        x = x + wide + spaceX

        if (i % columnCount == 0) then
            y = y + child:GetTall() + spaceY
            x = 0
        end
    end
end

function PANEL:GetVisibleChildren()
    local result, count = {}, 0
    for _, ch in ipairs(self:GetChildren()) do
        if (ch:IsVisible()) then
            count = count + 1
            result[count] = ch
        end
    end
    return result
end

function PANEL:GetContentHeight()
    local height = 0
    local children = self:GetChildren()
    local visible = 0

    for _, child in ipairs(children) do
        if (child:IsVisible()) then
            visible = visible + 1
        end
    end

    local rows = math.ceil(visible / self:GetColumnCount())
    local height = rows * self:GetRowHeight() + (rows - 1) * self:GetSpaceY()

    return height
end

function PANEL:GetRowHeight()
    local rowHeight = 0
    for _, ch in ipairs(self:GetVisibleChildren()) do
        rowHeight = math.max(rowHeight, ch:GetTall())
    end
    return rowHeight
end

function PANEL:SetSizeToContents()
    local contentHeight = self:GetContentHeight()
    self:SetTall(contentHeight)
end

function PANEL:AddItem(panel)
end

function PANEL:GetItems()
    return self:GetChildren()
end

onyx.gui.Register('onyx.Grid', PANEL)

-- ANCHOR Test

-- onyx.gui.Test('onyx.Frame', .66, .66, function(self)
--     self:MakePopup()

--     local list = self:Add('onyx.ScrollPanel')
--     list:Dock(FILL)

--     local grid = list:Add('onyx.Grid')
--     grid:Dock(TOP)
--     grid:SetSizeRatio(1.25)

--     for i = 1, 32 do
--         local button = grid:Add('onyx.Button')
--         button:SetText('Button #' .. i)
--         -- button:SetTall(100)
--         button:SetTextColor(color_black)
--         button.Paint = function(p, w, h)
--             surface.SetDrawColor(color_white)
--             surface.DrawRect(0, 0, w, h)

--             surface.SetDrawColor(0, 0, 255)
--             surface.DrawOutlinedRect(0, 0, w, h, 4)
--         end

--         grid:AddItem(button)
--     end

--     for var = 1, 32 do
--         if (var > 16) then
--             grid:GetChild(var - 1):SetVisible(false)
--         end
--     end

--     -- grid:InvalidateLayout(true)
--     -- grid:SetSizeToContents()
-- end)
--PATH addons/____onyx_creditstore/lua/onyx/modules/creditstore/core/item/cl_item.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

02/03/2023

--]]

local creditstore = onyx.creditstore

creditstore.items = creditstore.items or {}
creditstore.categories = creditstore.categories or {}

netchunk.Callback('onyx.creditstore:SyncItems', function(data, length, chunkAmount)
    creditstore.items = data

    hook.Run('onyx.credistore.ItemsSynced')

    creditstore:Print('Synchronized items (length: #, chunks: #)', length, chunkAmount)
end)

netchunk.Callback('onyx.creditstore:SyncCategories', function(data, length, chunkAmount)
    creditstore.categories = data

    hook.Run('onyx.credistore.CategoriesSynced')

    creditstore:Print('Synchronized categories (length: #, chunks: #)', length, chunkAmount)
end)
--PATH addons/____onyx_creditstore/lua/onyx/modules/creditstore/cfg/integrations/sh_blogs.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

05/05/2023

--]]
local INTEGRATION = {}

INTEGRATION.Name = 'bLogs'
INTEGRATION.Color = Color(63, 75, 184)
INTEGRATION.Desc = 'https://www.gmodstore.com/market/view/billys-logs'

function INTEGRATION:Check()
    return (GAS ~= nil and GAS.Logging ~= nil)
end

function INTEGRATION:Load()
    if (SERVER) then
        self:LoadPurchaseLogs()
        self:LoadActionLogs()
        self:LoadRefundLogs()
        self:LoadConversionLogs()
        self:LoadConfigLogs()
        self:LoadAdminLogs()
    end
end

function INTEGRATION:LoadPurchaseLogs()
    local MODULE = GAS.Logging:MODULE()
    MODULE.Category = "Onyx Store"
    MODULE.Name = "Purchases"
    MODULE.Colour = Color(123, 255, 90)

    MODULE:Setup(function()
        MODULE:Hook("onyx.creditstore.PlayerPurchasedItem", "onyx.credistore.logs", function(ply, uniqueID, price)
            local itemTable = onyx.creditstore.items[uniqueID]
            local itemName = itemTable and itemTable.name or '_UNKNOWN_'
        
            MODULE:Log('{1} purchased the item \'{2}\' (id: {3}) for {4}', GAS.Logging:FormatPlayer(ply), GAS.Logging:Highlight(itemName), GAS.Logging:Highlight(uniqueID), GAS.Logging:Highlight(string.Comma(price) .. ' credits'))
        end)
    end)

    GAS.Logging:AddModule(MODULE)
end

function INTEGRATION:LoadConversionLogs()
    local MODULE = GAS.Logging:MODULE()
    MODULE.Category = "Onyx Store"
    MODULE.Name = "Conversions"
    MODULE.Colour = Color(123, 255, 90)

    MODULE:Setup(function()
        MODULE:Hook("onyx.creditstore.PlayerConvertedMoney", "onyx.credistore.logs", function(ply, giveAmount, receiveAmount)
            MODULE:Log('{1} converted {2} to {3}', GAS.Logging:FormatPlayer(ply), GAS.Logging:FormatMoney(giveAmount), GAS.Logging:Highlight(string.Comma(receiveAmount) .. ' credits'))
        end)
        MODULE:Hook("onyx.creditstore.PlayerConvertedCredits", "onyx.credistore.logs", function(ply, giveAmount, receiveAmount)
            MODULE:Log('{1} converted {2} to {3}', GAS.Logging:FormatPlayer(ply), GAS.Logging:Highlight(string.Comma(giveAmount) .. ' credits'), GAS.Logging:FormatMoney(receiveAmount))
        end)
    end)

    GAS.Logging:AddModule(MODULE)
end

function INTEGRATION:LoadActionLogs()
    local MODULE = GAS.Logging:MODULE()
    MODULE.Category = "Onyx Store"
    MODULE.Name = "Actions"
    MODULE.Colour = Color(123, 255, 90)

    MODULE:Setup(function()
        MODULE:Hook("onyx.creditstore.PlayerUsedOption", "onyx.credistore.logs", function(ply, uniqueID, optionID)
            local itemTable = onyx.creditstore.items[uniqueID]
            local itemName = itemTable and itemTable.name or '_UNKNOWN_'
        
            MODULE:Log('{1} used {2} option on the inventory item \'{3}\' (id: {4})', GAS.Logging:FormatPlayer(ply), GAS.Logging:Highlight(optionID), GAS.Logging:Highlight(itemName), GAS.Logging:Highlight(uniqueID))
        end)
    end)

    GAS.Logging:AddModule(MODULE)
end

function INTEGRATION:LoadRefundLogs()
    local MODULE = GAS.Logging:MODULE()
    MODULE.Category = "Onyx Store"
    MODULE.Name = "Refunds"
    MODULE.Colour = Color(123, 255, 90)

    MODULE:Setup(function()
        MODULE:Hook("onyx.creditstore.PlayerRefundedItem", "onyx.credistore.logs", function(ply, uniqueID, price)
            local itemTable = onyx.creditstore.items[uniqueID]
            local itemName = itemTable and itemTable.name or '_UNKNOWN_'
        
            MODULE:Log('{1} refunded the inventory item \'{2}\' (id: {3}) for {4}', 
                GAS.Logging:FormatPlayer(ply),
                GAS.Logging:Highlight(itemName),
                GAS.Logging:Highlight(uniqueID),
                GAS.Logging:Highlight(string.Comma(price) .. ' credits')
            )
        end)
    end)

    GAS.Logging:AddModule(MODULE)
end

function INTEGRATION:LoadConfigLogs()
    local MODULE = GAS.Logging:MODULE()
    MODULE.Category = "Onyx Store"
    MODULE.Name = "Configuration"
    MODULE.Colour = Color(123, 255, 90)

    MODULE:Setup(function()
        MODULE:Hook("onyx.creditstore.PlayerCreatedCategory", "onyx.credistore.logs", function(ply, uniqueID, name)
            MODULE:Log('{1} created a new category \'{2}\' (id: {3})', GAS.Logging:FormatPlayer(ply), GAS.Logging:Highlight(name), GAS.Logging:Highlight(uniqueID))
        end)

        MODULE:Hook("onyx.creditstore.PlayerEditedCategory", "onyx.credistore.logs", function(ply, uniqueID)
            MODULE:Log('{1} edited the category with id: {2}', GAS.Logging:FormatPlayer(ply), GAS.Logging:Highlight(uniqueID))
        end)

        MODULE:Hook("onyx.creditstore.PlayerDeletedCategory", "onyx.credistore.logs", function(ply, uniqueID)
            MODULE:Log('{1} deleted the category with id: {2}', GAS.Logging:FormatPlayer(ply), GAS.Logging:Highlight(uniqueID))
        end)

        -------------------------------------------------------------------------------------------------------------------------
    
        MODULE:Hook("onyx.creditstore.PlayerCreatedItem", "onyx.credistore.logs", function(ply, uniqueID, typeID, name)
            local typeData = onyx.creditstore.types[typeID]
            local typeName = typeData and typeData.name or typeID

            MODULE:Log('{1} created a new item \'{2}\' (id: {3}, type: {4})', GAS.Logging:FormatPlayer(ply), GAS.Logging:Highlight(name), GAS.Logging:Highlight(uniqueID), GAS.Logging:Highlight(typeName))
        end)

        MODULE:Hook("onyx.creditstore.PlayerEditedItem", "onyx.credistore.logs", function(ply, uniqueID)
            MODULE:Log('{1} edited the item with id: {2}', GAS.Logging:FormatPlayer(ply), GAS.Logging:Highlight(uniqueID))
        end)

        MODULE:Hook("onyx.creditstore.PlayerDeletedItem", "onyx.credistore.logs", function(ply, uniqueID)
            MODULE:Log('{1} deleted the item with id: {2}', GAS.Logging:FormatPlayer(ply), GAS.Logging:Highlight(uniqueID))
        end)
    end)

    GAS.Logging:AddModule(MODULE)
end

function INTEGRATION:LoadAdminLogs()
    local MODULE = GAS.Logging:MODULE()
    MODULE.Category = "Onyx Store"
    MODULE.Name = "Admin"
    MODULE.Colour = Color(123, 255, 90)

    MODULE:Setup(function()
        MODULE:Hook("onyx.creditstore.AdminCheckedInventory", "onyx.credistore.logs", function(ply, steamid64)
            MODULE:Log('{1} requsted {2}\'s inventory', GAS.Logging:FormatPlayer(ply), GAS.Logging:FormatPlayer(steamid64))
        end)

        MODULE:Hook("onyx.creditstore.AdminItemGiven", "onyx.credistore.logs", function(ply, target, itemID)
            local itemTable = onyx.creditstore.items[itemID]
            local itemName = itemTable.name
            
            MODULE:Log('{1} gave {2} (id: {3}) to {4}', 
                GAS.Logging:FormatPlayer(ply),
                GAS.Logging:Highlight(itemName),
                GAS.Logging:Highlight(itemID),
                GAS.Logging:FormatPlayer(target)
            )
        end)

        MODULE:Hook("onyx.creditstore.AdminTakeItem", "onyx.credistore.logs", function(ply, target, it)
            local itemID = it.id
            local itemTable = onyx.creditstore.items[itemID]
            local itemName = itemTable and itemTable.name or '_UNKNOWN_'
            
            MODULE:Log('{1} deleted single {2} (id: {3}) from {4}', 
                GAS.Logging:FormatPlayer(ply),
                GAS.Logging:Highlight(itemName),
                GAS.Logging:Highlight(itemID),
                GAS.Logging:FormatPlayer(target)
            )
        end)

        MODULE:Hook("onyx.creditstore.AdminTakeItemMultiple", "onyx.credistore.logs", function(ply, target, itemID, amount)
            local itemTable = onyx.creditstore.items[itemID]
            local itemName = itemTable and itemTable.name or '_UNKNOWN_'
            
            MODULE:Log('{1} deleted {2} copies of {3} (id: {4}) from {5}', 
                GAS.Logging:FormatPlayer(ply),
                GAS.Logging:Highlight(string.Comma(amount)),
                GAS.Logging:Highlight(itemName),
                GAS.Logging:Highlight(itemID),
                GAS.Logging:FormatPlayer(target)
            )
        end)
    end)

    GAS.Logging:AddModule(MODULE)
end

onyx.creditstore:RegisterIntegration('blogs', INTEGRATION)
--PATH addons/____onyx_creditstore/lua/onyx/modules/creditstore/cfg/types/sh_ent.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

08/05/2023

--]]

onyx.creditstore:RegisterType('entity', {
    name = 'Entity',
    color = Color(66, 116, 53),
    stacking = true,
    options = {
        ['spawn'] = {
            removeItem = true,
            check = function(ply, data)
                if (not ply:Alive()) then
                    return false, onyx.lang:Get('youMustBeAlive')
                end

                return true
            end,
            func = function(ply, data)
                local entClass = data.entclass
                local entData = list.Get('SpawnableEntities')[entClass]
                if (not entData) then
                    return false
                end

                local pos = util.QuickTrace(ply:GetShootPos(), ply:GetAimVector() * 100, ply).HitPos
                local ang = ply:GetAngles()

                ang:RotateAroundAxis(ply:GetUp(), -90)

                local ent = ents.Create(entClass)
                ent:SetPos(pos)
                ent:SetAngles(ang)
                ent:Spawn()
            end
        }
    },
    settings = {
        {
            key = 'entclass',
            name = 'ENTITY',
            desc = 'The entity linked to the item.',
            icon = 'https://i.imgur.com/zgt3zea.png',
            type = 'combo',
            getOptions = function()
                local options = {}

                for id, data in pairs(list.Get('SpawnableEntities')) do
                    local name = data.PrintName
                    if (name) then
                        local printName = language.GetPhrase(name)

                        table.insert(options, {
                            text = printName,
                            data = id
                        })
                    end
                end

                table.sort(options, function(a, b)
                    return a.text < b.text
                end)

                return options
            end,
            onChoose = function(index, text, data, fields)
                local ent = list.Get('SpawnableEntities')[data]
                if (ent) then
                    fields.name.entry:SetValue(language.GetPhrase(ent.PrintName or 'Unknown'))
                    fields.name.entry:Highlight(onyx.GetOppositeAccentColor(), 3)
                end
            end,
            validateOption = function(data)
                -- do not be lazy to do this function, it is also used on the server side to validate value
                if (not data) then return false, 'You must choose an entity!' end
                if (not list.Get('SpawnableEntities')[data]) then return false end

                return true
            end
        }
    }
})
--PATH addons/____onyx_creditstore/lua/onyx/modules/creditstore/cfg/types/sh_health.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

01/05/2023

--]]

onyx.creditstore:RegisterType('health', {
    name = 'Health',
    color = Color(230, 98, 98),
    stacking = true,
    options = {
        ['use'] = {
            removeItem = true,
            check = function(ply, data)
                if (not ply:Alive()) then
                    return false, onyx.lang:Get('youMustBeAlive')
                end

                if (data.action == 1) then
                    if (ply:Health() >= data.amount) then
                        return false, onyx.lang:Get('healthIsFull')
                    end
                else
                    if (ply:Health() >= ply:GetMaxHealth()) then
                        return false, onyx.lang:Get('healthIsFull')
                    end
                end

                return true
            end,
            func = function(ply, data)
                local amount = tonumber(data.amount)
                local shouldSet = data.action == 1
                if (amount and amount > 0) then
                    if (shouldSet) then
                        ply:SetHealth(amount)
                    else
                        ply:SetHealth(math.min(ply:GetMaxHealth(), ply:Health() + amount))
                    end
                    return true
                end
            end
        }
    },
    settings = {
        {
            key = 'action',
            name = 'ACTION',
            desc = 'What to do',
            icon = 'https://i.imgur.com/zgt3zea.png',
            type = 'combo',
            options = {
                {text = 'Give Health', data = 0},
                {text = 'Set Health', data = 1},
            },
            validateOption = function(data)
                -- do not be lazy to do this function, it is also used on the server side to validate value
                if (data == nil) then return false, 'You must choose an action type!' end
                if (not isnumber(data)) then return false end
                if (data < 0 or data > 1) then return false end
        
                return true
            end
        },
        {
            key = 'amount',
            name = 'AMOUNT',
            desc = 'The amount of AP to give.',
            icon = 'https://i.imgur.com/zgt3zea.png',
            type = 'number',
            placeholder = '100',
            validateOption = function(value)
                if (not isnumber(value)) then
                    return false, 'The amount must be a number!'
                end
                if (value < 1) then
                    return false, 'The amount must be higher than 0!'
                end
                return true
            end
        }
    }
})
--PATH addons/____onyx_creditstore/lua/onyx/modules/creditstore/cfg/types/sh_vehicle.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

08/05/2023

--]]

onyx.creditstore:RegisterType('vehicle', {
    name = 'Vehicle',
    color = Color(31, 158, 126),
    noDuplicates = true,
    options = {
        ['spawn'] = {
            check = function(ply, data)
                if (not ply:Alive()) then
                    return false, onyx.lang:Get('youMustBeAlive')
                end

                if (IsValid(ply:GetVar('onyx_CreditstoreVehicle'))) then
                    return false, 'You already have spawned car'
                end

                return true
            end,
            func = function(ply, data)
                local vehicleID = data.vehiclescript
                local vehicleData = list.Get('Vehicles')[vehicleID]
                if (not vehicleData) then
                    return false
                end

                local pos = ply:GetPos() + Vector(0, 0, 100)
                local ang = ply:GetAngles()

                ang:RotateAroundAxis(ply:GetUp(), -90)

                local ent = ents.Create(vehicleData.Class)
                ent:SetModel(vehicleData.Model)
                ent:SetKeyValue('vehiclescript', vehicleData.KeyValues.vehiclescript)
                ent:SetPos(pos)
                ent:SetAngles(ang)
                -- ent:SetOwner(ply) -- this one disables collision lol
                ent:Spawn()
                ent:Activate()

                if (IsValid(ent)) then
                    if (ent.CPPISetOwner) then
                        ent:CPPISetOwner(ply)
                    end

                    if (ent.keysOwn) then
                        ent:keysOwn(ply)
                    end

                    local eyeang = ply:EyeAngles()

                    eyeang:RotateAroundAxis(ply:GetUp(), -90)

                    ply:EnterVehicle(ent)
                    ply:SetVar('onyx_CreditstoreVehicle', ent)
                    ply:SetEyeAngles(eyeang)
                end
            end
        }
    },
    settings = {
        {
            key = 'vehiclescript',
            name = 'VEHICLE',
            desc = 'The vehicle linked to the item.',
            icon = 'https://i.imgur.com/zgt3zea.png',
            type = 'combo',
            getOptions = function()
                local options = {}
        
                for id, data in pairs(list.Get('Vehicles')) do
                    local name = data.Name
                    local class = data.Class
                    if (class and class ~= 'prop_vehicle_prisoner_pod' and name) then
                        local printName = language.GetPhrase(name)
        
                        table.insert(options, {
                            text = printName,
                            data = id
                        })
                    end
                end
        
                table.sort(options, function(a, b)
                    return a.text < b.text
                end)
        
                return options
            end,
            onChoose = function(index, text, data, fields)
                local veh = list.Get('Vehicles')[data]
                if (veh) then
                    local model = veh.Model and (veh.Model ~= '' and veh.Model or 'models/error.mdl') or 'models/error.mdl'
                    fields.icon.picker:ChooseOptionID(2)
        
                    fields.icon.entry:SetValue(model)
                    fields.icon.entry:Highlight(onyx.GetOppositeAccentColor(), 3)
        
                    fields.name.entry:SetValue(veh.Name)
                    fields.name.entry:Highlight(onyx.GetOppositeAccentColor(), 3)
                end
            end,
            validateOption = function(data)
                -- do not be lazy to do this function, it is also used on the server side to validate value
                if (not data) then return false, 'You must choose a vehicle!' end
                if (not list.Get('Vehicles')[data]) then return false end
        
                return true
            end
        }
    }
})
--PATH addons/____onyx_creditstore/lua/onyx/modules/creditstore/ui/cl_admin_items.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

08/03/2023

--]]

local PANEL = {}

local colorPrimary = onyx:Config('colors.primary')
local colorSecondary = onyx:Config('colors.secondary')
local colorAccent = onyx:Config('colors.accent')
local colorTertiary = onyx:Config('colors.tertiary')
local font0 = onyx.Font('Comfortaa Bold@16')

function PANEL:Init()
    self.toolbar = self:Add('Panel')
    self.toolbar:Dock(TOP)
    self.toolbar:SetTall(onyx.ScaleTall(35))
    self.toolbar:DockMargin(0, 0, 0, onyx.ScaleTall(10))
    local padding = onyx.ScaleTall(5)
    self.toolbar.Paint = function(p, w, h)
        draw.RoundedBox(8, 0, 0, w, h, colorSecondary)
    end

    self.toolbar:DockPadding(padding, padding, padding, padding)

    self.search = self.toolbar:Add('onyx.TextEntry')
    self.search:SetPlaceholderText(onyx.lang:Get('searchName'))
    self.search:SetPlaceholderIcon('https://i.imgur.com/Nk3IUJT.png', 'smooth mips')
    self.search:Dock(LEFT)
    self.search:SetWide(onyx.ScaleWide(150))
    self.search:SetUpdateOnType(true)
    self.search.OnValueChange = function(panel, value)
        value = onyx.utf8.lower(value)

        for _, cat in ipairs(self.list:GetItems()) do
            local layout = cat.canvas:GetChild(0)
            local items = layout:GetChildren()
            local visibleItemAmount = 0

            for _, item in ipairs(items) do
                if (onyx.utf8.lower(item:GetName()):find(value, nil, true)) then
                    item:SetVisible(true)
                    visibleItemAmount = visibleItemAmount + 1
                else
                    item:SetVisible(false)
                end
            end

            layout:InvalidateLayout()

            cat:SetVisible(value == '' or visibleItemAmount > 0)
            cat:UpdateInTick()
        end
    end

    self.btnCreate = self.toolbar:Add('onyx.Button')
    self.btnCreate:Dock(RIGHT)
    self.btnCreate:SetText(onyx.lang:Get('createCategory'))
    self.btnCreate:SizeToContentsX(onyx.ScaleWide(20))
    self.btnCreate:SetFont(onyx.Font('Comfortaa@16'))
    self.btnCreate.DoClick = function()
        self:StartCategoryCreation()
    end

    self.list = self:Add('onyx.ScrollPanel')
    self.list:Dock(FILL)

    hook.Add('onyx.credistore.ItemsSynced', self, function(panel)
        panel:LoadItems()
    end)

    hook.Add('onyx.credistore.CategoriesSynced', self, function(panel)
        panel:LoadItems()
    end)

    self:LoadItems()
end

function PANEL:StartCategoryCreation()
    local frame = vgui.Create('onyx.Frame')
    frame:SetSize(onyx.ScaleWide(500), onyx.ScaleTall(500))
    frame:MakePopup()
    frame:Center()
    frame:SetTitle('ITEM CREATION')
    -- frame:Focus()

    local content = frame:Add('onyx.creditstore.AdminCategoryConfigurator')
    content:Dock(FILL)
    content:CategoryCreation()
    content.OnEditRequested = function()
        frame:Remove()
    end
end

function PANEL:LoadItems()
    local items = onyx.creditstore.items
    local cats = onyx.creditstore.categories

    --[[------------------------------
    Remove old items in case of update
    --------------------------------]]
    for _, child in ipairs(self.list:GetItems()) do
        child:Remove()
    end

    --[[------------------------------
    Sort items
    --------------------------------]]
    local sortedItems = {}
    for id in pairs(items) do
        table.insert(sortedItems ,id)
    end
    table.sort(sortedItems, function(a, b)
        return items[a].price < items[b].price
    end)

    local sortedCategories = {}
    for id in pairs(cats) do
        table.insert(sortedCategories ,id)
    end
    table.sort(sortedCategories, function(a, b)
        local aOrder = (cats[a].order or 98)
        local bOrder = (cats[b].order or 98)
        if (cats[a].nocategory) then
            aOrder = -1
        end
        if (cats[b].nocategory) then
            bOrder = -1
        end
        return aOrder < bOrder
    end)

    --[[------------------------------
    Add items
    --------------------------------]]

    local bFound = {}

    for catIndex, catID in pairs(sortedCategories) do
        for _, id in ipairs(sortedItems) do
            local item = items[id]
            if (item.category and item.category == catID) then
                bFound[id] = true
            end
        end
    end

    for catIndex, catID in pairs(sortedCategories) do
        local catData = cats[catID]
        local cat = self.list:Add('onyx.Category')
        cat:Dock(TOP)
        cat:SetIcon(catData.icon, 'smooth mips')
        cat:SetTitle(onyx.utf8.upper(catData.name))
        cat:SetSpace(0)
        cat:SetInset(onyx.ScaleTall(15))
        cat:DockMargin(0, 0, 0, onyx.ScaleTall(10))

        if (not catData.nocategory) then
            local btnEdit = cat.button:Add('onyx.ImageButton')
            btnEdit:SetURL('https://i.imgur.com/oOlN03M.png', 'smooth mips')
            btnEdit:Dock(RIGHT)
            btnEdit:SetImageSize(onyx.ScaleTall(16))
            btnEdit:DockMargin(0, 0, cat.button:GetTall() * .5, 0)
            btnEdit:SetColorIdle(colorAccent)
            btnEdit.DoClick = function()
                self:StartCategoryEdit(catID, catData)
            end
        end

        local content = cat:Add('onyx.Grid')
        content:Dock(TOP)
        content:SetTall(0)
        content:SetSpaceX(onyx.ScaleTall(10))
        content:SetSpaceY(content:GetSpaceX())
        content:SetColumnCount(5)
        content:SetSizeRatio(1.25)

        cat.canvas.Paint = function(p, w, h)
            draw.RoundedBox(8, 0, 0, w, h, colorPrimary)
        end

        if (catData.nocategory) then
            local slot = content:Add('onyx.creditstore.Item')
            slot:SetLabelHidden(true)
            slot.icon = onyx.wimg.Simple('https://i.imgur.com/MQ0s2hN.png', 'mips smooth')
            slot.text1 = onyx.lang:Get('create_u')
            slot.text2 = onyx.lang:Get('newItem')
            slot.PaintOver = function(p, w, h)
                local headerHeight = math.ceil(h * .2)
            
                draw.SimpleText(p.text1, font0, w * .5, headerHeight * .5, color_white, 1, 1)
                draw.SimpleText(p.text2, font0, w * .5, h - headerHeight * .5, color_white, 1, 1)
            end
            slot.DoClick = function(panel)
                self:StartItemCreation()
            end
        end

        for _, id in ipairs(sortedItems) do
            local item = items[id]
            if ((item.category and item.category == catID) or (catData.nocategory and not bFound[id])) then
                
                local slot = content:Add('onyx.creditstore.Item')
                slot:SetItem(id, {})
                slot:SetPriceTagVisible(true)
                slot.DoClick = function()
                    self:StartItemEdit(id, item)
                end

            end
        end

        cat:SetExpanded(true)
        cat:UpdateInTick(1)
        cat:UpdateInTick(10)
        cat:UpdateInTick(100)
    end
end

function PANEL:StartItemCreation()
    local frame = vgui.Create('onyx.Frame')
    frame:SetSize(onyx.ScaleWide(500), onyx.ScaleTall(500))
    frame:MakePopup()
    frame:Center()
    frame:SetTitle('ITEM CREATION')
    -- frame:Focus()

    local content = frame:Add('onyx.creditstore.AdminItemConfigurator')
    content:Dock(FILL)
    content:ItemCreation()
    content.OnEditRequested = function()
        frame:Remove()
    end
end

function PANEL:StartItemEdit(id, item)
    local frame = vgui.Create('onyx.Frame')
    frame:SetSize(onyx.ScaleWide(500), onyx.ScaleTall(500))
    frame:MakePopup()
    frame:Center()
    frame:SetTitle('ITEM EDITOR')
    -- frame:Focus()

    local content = frame:Add('onyx.creditstore.AdminItemConfigurator')
    content:Dock(FILL)
    content:ItemEditor(id, item)
    content.OnEditRequested = function()
        frame:Remove()
    end
end

function PANEL:StartCategoryEdit(id, category)
    local frame = vgui.Create('onyx.Frame')
    frame:SetSize(onyx.ScaleWide(500), onyx.ScaleTall(500))
    frame:MakePopup()
    frame:Center()
    frame:SetTitle('CATEGORY EDITOR')

    local content = frame:Add('onyx.creditstore.AdminCategoryConfigurator')
    content:Dock(FILL)
    content:CategoryEditor(id, category)
    content.OnEditRequested = function()
        frame:Remove()
    end
end

vgui.Register('onyx.creditstore.AdminItems', PANEL)
--PATH addons/____onyx_hud/lua/onyx/modules/hud/languages/cl_english.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

14/08/2024

--]]

local LANG = {}

--[[
    .............
    General Words
]]--

LANG[ 'hud_status_wanted' ] = 'Wanted'
LANG[ 'hud_status_speaking' ] = 'Speaking'
LANG[ 'hud_status_typing' ] = 'Typing'
LANG[ 'props' ] = 'Props'
LANG[ 'close' ] = 'Close'
LANG[ 'alert' ] = 'Alert'
LANG[ 'message' ] = 'Message'
LANG[ 'unknown' ] = 'Unknown'
LANG[ 'accept' ] = 'Accept'
LANG[ 'deny' ] = 'Deny'
LANG[ 'none' ] = 'None'
LANG[ 'add' ] = 'Add'
LANG[ 'remove' ] = 'Remove'
LANG[ 'jobs' ] = 'Jobs'
LANG[ 'door' ] = 'Door'
LANG[ 'vehicle' ] = 'Vehicle'
LANG[ 'door_groups' ] = 'Door groups'
LANG[ 'display' ] = 'Display'
LANG[ 'general' ] = 'General'
LANG[ 'speedometer' ] = 'Speedometer'
LANG[ 'fuel' ] = 'Fuel'
LANG[ 'vote' ] = 'Vote'
LANG[ 'question' ] = 'Question'

--[[
    .......
    Timeout
]]--

LANG[ 'timeout_title' ] = 'CONNECTION LOST'
LANG[ 'timeout_info' ] = 'Server is unavailable now, we are sorry'
LANG[ 'timeout_status' ] = 'You will be reconnected in %d seconds'

--[[
    ......
    Themes
]]--

LANG[ 'hud.theme.default.name' ] = 'Default'
LANG[ 'hud.theme.forest.name' ] = 'Forest'
LANG[ 'hud.theme.violet_night.name' ] = 'Violet Night'
LANG[ 'hud.theme.rustic_ember.name' ] = 'Rustic Ember'
LANG[ 'hud.theme.green_apple.name' ] = 'Green Apple'
LANG[ 'hud.theme.lavender.name' ] = 'Lavender'
LANG[ 'hud.theme.elegance.name' ] = 'Elegance'
LANG[ 'hud.theme.mint_light.name' ] = 'Mint'
LANG[ 'hud.theme.gray.name' ] = 'Gray'
LANG[ 'hud.theme.rose_garden.name' ] = 'Rose Garden'
LANG[ 'hud.theme.ocean_wave.name' ] = 'Ocean Wave'
LANG[ 'hud.theme.sky_blue.name' ] = 'Sky Blue'
LANG[ 'hud.theme.golden_dawn.name' ] = 'Golden Dawn'

--[[
    ....
    Help
    - Full phrase: "Type <command> to open settings"
]]

LANG[ 'hud_help_type' ] = 'Type'
LANG[ 'hud_help_to' ] = 'to open settings'

--[[
    .............
    3D2D Doors
]]--

LANG[ 'door_purchase' ] = 'Purchase {object}'
LANG[ 'door_sell' ] = 'Sell {object}'
LANG[ 'door_addowner' ] = 'Add owner'
LANG[ 'door_rmowner' ] = 'Remove owner'
LANG[ 'door_rmowner_help' ] = 'Choose the player you want to revoke ownership from'
LANG[ 'door_addowner_help' ] = 'Choose the player you want to grant ownership to'
LANG[ 'door_title' ] = 'Set title'
LANG[ 'door_title_help' ] = 'What title you want to set?'
LANG[ 'door_admin_disallow' ] = 'Disallow ownership'
LANG[ 'door_admin_allow' ] = 'Allow ownership'
LANG[ 'door_admin_edit' ] = 'Edit access'
LANG[ 'door_owned' ] = 'Private Property'
LANG[ 'door_unowned' ] = 'For Sale'

LANG[ 'hud_door_help' ] = 'Press {bind} to purchase for {price}'
LANG[ 'hud_door_owner' ] = 'Owner: {name}'
LANG[ 'hud_door_allowed' ] = 'Allowed to own'
LANG[ 'hud_door_coowners' ] = 'Coowners'
LANG[ 'hud_and_more' ] = 'and more...'

--[[
    .........
    Uppercase
]]--

LANG[ 'reconnect_u' ] = 'RECONNECT'
LANG[ 'disconnect_u' ] = 'DISCONNECT'
LANG[ 'settings_u' ] = 'SETTINGS'
LANG[ 'configuration_u' ] = 'CONFIGURATION'
LANG[ 'introduction_u' ] = 'INTRODUCTION'

--[[
    .........
    Lowercase
]]--

LANG[ 'seconds_l' ] = 'seconds'
LANG[ 'minutes_l' ] = 'minutes'

--[[
    .............
    Configuration
]]--

LANG[ 'hud.timeout.name' ] = 'Timeout Duration'
LANG[ 'hud.timeout.desc' ] = 'How many seconds before auto-reconnection'

LANG[ 'hud.alert_queue.name' ] = 'Alert Queue'
LANG[ 'hud.alert_queue.desc' ] = 'Should alerts be placed in queue'

LANG[ 'hud.props_counter.name' ] = 'Props Counter'
LANG[ 'hud.props_counter.desc' ] = 'Show props counter'

LANG[ 'hud.main_avatar_mode.name' ] = 'Main Avatar Type'
LANG[ 'hud.main_avatar_mode.desc' ] = 'Choose the type'

LANG[ 'hud.voice_avatar_mode.name' ] = 'Voice Avatar Type'
LANG[ 'hud.voice_avatar_mode.desc' ] = 'Choose the type'

LANG[ 'hud.hud_bar_type.name' ] = 'Indicator Bar Type'
LANG[ 'hud.hud_bar_type.desc' ] = 'Choose the type'

LANG[ 'hud.restrict_themes.name' ] = 'Restrict Themes'
LANG[ 'hud.restrict_themes.desc' ] = 'Restrict players to choose themes'

LANG[ 'hud.speedometer_mph.name' ] = 'Use Miles'
LANG[ 'hud.speedometer_mph.desc' ] = 'Switch units to miles per hour'

LANG[ 'hud.speedometer_max_speed.name' ] = 'Max Default Speed'
LANG[ 'hud.speedometer_max_speed.desc' ] = 'The max speed for the speedometer'

LANG[ 'hud.wpnsel_sounds.name' ] = 'Weapon Selection Sounds'
LANG[ 'hud.wpnsel_sounds.desc' ] = 'Enable weapon selection UI sounds'

LANG[ 'hud_should_draw' ] = 'Should draw the element'
LANG[ 'hud.main.name' ] = 'Main HUD'
LANG[ 'hud.ammo.name' ] = 'Ammo'
LANG[ 'hud.agenda.name' ] = 'Agenda'
LANG[ 'hud.alerts.name' ] = 'Alerts'
LANG[ 'hud.pickup_history.name' ] = 'Pickup History'
LANG[ 'hud.level.name' ] = 'Level'
LANG[ 'hud.voice.name' ] = 'Voice Panels'
LANG[ 'hud.overhead_health.name' ] = '3D2D Overhead Health'
LANG[ 'hud.overhead_armor.name' ] = '3D2D Overhead Armor'
LANG[ 'hud.vehicle.name' ] = 'Vehicle HUD'
LANG[ 'hud.notifications.name' ] = 'Notifications'

--[[
    ........
    Settings
]]--

LANG[ 'hud.theme.name' ] = 'Theme'
LANG[ 'hud.theme.desc' ] = 'Choose the HUD theme'

LANG[ 'hud.scale.name' ] = 'Scale'
LANG[ 'hud.scale.desc' ] = 'Adjust the scale of the HUD'

LANG[ 'hud.roundness.name' ] = 'Roundness'
LANG[ 'hud.roundness.desc' ] = 'Adjust the roundness of the HUD'

LANG[ 'hud.margin.name' ] = 'Margin'
LANG[ 'hud.margin.desc' ] = 'The distance between the HUD and the edges'

LANG[ 'hud.icons_3d.name' ] = '3D Models'
LANG[ 'hud.icons_3d.desc' ] = 'Render model icons in 3D'

LANG[ 'hud.compact.name' ] = 'Compact Mode'
LANG[ 'hud.compact.desc' ] = 'Enable the compact mode'

LANG[ 'hud.speedometer_blur.name' ] = 'Speedometer Blur'
LANG[ 'hud.speedometer_blur.desc' ] = 'Enable the blur for the speedometer'

LANG[ 'hud.3d2d_max_details.name' ] = 'Max 3D2D Details'
LANG[ 'hud.3d2d_max_details.desc' ] = 'The maximum amount of detailed info renders'

--[[
    ......
    Status
]]--

LANG[ 'hud_lockdown' ] = 'LOCKDOWN'
LANG[ 'hud_lockdown_help' ] = 'Please return to your homes!'

LANG[ 'hud_wanted' ] = 'WANTED'
LANG[ 'hud_wanted_help' ] = 'Reason: {reason}'

LANG[ 'hud_arrested' ] = 'ARRESTED'
LANG[ 'hud_arrested_help' ] = 'You will be released in {time}'

onyx.lang:AddPhrases( 'english', LANG )
--PATH addons/____onyx_hud/lua/onyx/modules/hud/languages/cl_polish.lua:
--[[
KayZed @ 2024
--]]

local LANG = {}

--[[
    .............
    General Words
]]--

LANG[ 'hud_status_wanted' ] = 'Poszukiwany'
LANG[ 'hud_status_speaking' ] = 'Mówi'
LANG[ 'hud_status_typing' ] = 'Pisze'
LANG[ 'props' ] = 'Propy'
LANG[ 'close' ] = 'Zamknij'
LANG[ 'alert' ] = 'Alert'
LANG[ 'message' ] = 'Wiadomość'
LANG[ 'unknown' ] = 'Nieznany'
LANG[ 'accept' ] = 'Akceptuj'
LANG[ 'deny' ] = 'Odrzuć'
LANG[ 'none' ] = 'Brak'
LANG[ 'add' ] = 'Dodaj'
LANG[ 'remove' ] = 'Usuń'
LANG[ 'jobs' ] = 'Prace'
LANG[ 'door' ] = 'Drzwi'
LANG[ 'vehicle' ] = 'Pojazd'
LANG[ 'door_groups' ] = 'Grupy drzwi'
LANG[ 'display' ] = 'Wyświetl'
LANG[ 'general' ] = 'Ogólne'
LANG[ 'speedometer' ] = 'Prędkościomierz'
LANG[ 'fuel' ] = 'Paliwo'
LANG[ 'vote' ] = 'Głosowanie'
LANG[ 'question' ] = 'Pytanie'

--[[
    .......
    Timeout
]]--

LANG[ 'timeout_title' ] = 'UTRATA POŁĄCZENIA'
LANG[ 'timeout_info' ] = 'Serwer jest obecnie niedostępny, przepraszamy'
LANG[ 'timeout_status' ] = 'Zostaniesz ponownie połączony za %d sekund'

--[[
    ......
    Themes
]]--

LANG[ 'hud.theme.default.name' ] = 'Domyślny'
LANG[ 'hud.theme.forest.name' ] = 'Las'
LANG[ 'hud.theme.violet_night.name' ] = 'Fioletowa Noc'
LANG[ 'hud.theme.rustic_ember.name' ] = 'Zardzewiały Żar'
LANG[ 'hud.theme.green_apple.name' ] = 'Zielone Jabłko'
LANG[ 'hud.theme.lavender.name' ] = 'Lawenda'
LANG[ 'hud.theme.elegance.name' ] = 'Elegancja'
LANG[ 'hud.theme.mint_light.name' ] = 'Mięta'
LANG[ 'hud.theme.gray.name' ] = 'Szary'
LANG[ 'hud.theme.rose_garden.name' ] = 'Różany Ogród'
LANG[ 'hud.theme.ocean_wave.name' ] = 'Oceaniczna Fala'
LANG[ 'hud.theme.sky_blue.name' ] = 'Niebieskie Niebo'
LANG[ 'hud.theme.golden_dawn.name' ] = 'Złota Jutrzenka'

--[[
    ....
    Help
    - Full phrase: "Type <command> to open settings"
]]

LANG[ 'hud_help_type' ] = 'Wpisz'
LANG[ 'hud_help_to' ] = 'aby otworzyć ustawienia'

--[[
    .............
    3D2D Doors
]]--

LANG[ 'door_purchase' ] = 'Kup {object}'
LANG[ 'door_sell' ] = 'Sprzedaj {object}'
LANG[ 'door_addowner' ] = 'Dodaj właściciela'
LANG[ 'door_rmowner' ] = 'Usuń właściciela'
LANG[ 'door_rmowner_help' ] = 'Wybierz gracza, któremu chcesz odebrać własność'
LANG[ 'door_addowner_help' ] = 'Wybierz gracza, któremu chcesz przyznać własność'
LANG[ 'door_title' ] = 'Ustaw tytuł'
LANG[ 'door_title_help' ] = 'Jaki tytuł chcesz ustawić?'
LANG[ 'door_admin_disallow' ] = 'Odmów własności'
LANG[ 'door_admin_allow' ] = 'Zezwól na własność'
LANG[ 'door_admin_edit' ] = 'Edytuj dostęp'
LANG[ 'door_owned' ] = 'Własność Prywatna'
LANG[ 'door_unowned' ] = 'Na Sprzedaż'

LANG[ 'hud_door_help' ] = 'Naciśnij {bind}, aby kupić za {price}'
LANG[ 'hud_door_owner' ] = 'Właściciel: {name}'
LANG[ 'hud_door_allowed' ] = 'Uprawnieni do posiadania'
LANG[ 'hud_door_coowners' ] = 'Współwłaściciele'
LANG[ 'hud_and_more' ] = 'i więcej...'

--[[
    .........
    Uppercase
]]--

LANG[ 'reconnect_u' ] = 'PONOWNIE POŁĄCZ'
LANG[ 'disconnect_u' ] = 'ROZŁĄCZ'
LANG[ 'settings_u' ] = 'USTAWIENIA'
LANG[ 'configuration_u' ] = 'KONFIGURACJA'
LANG[ 'introduction_u' ] = 'WPROWADZENIE'

--[[
    .........
    Lowercase
]]--

LANG[ 'seconds_l' ] = 'sekundy'
LANG[ 'minutes_l' ] = 'minuty'

--[[
    .............
    Configuration
]]--

LANG[ 'hud.timeout.name' ] = 'Czas Trwania Przerwy'
LANG[ 'hud.timeout.desc' ] = 'Ile sekund przed automatycznym ponownym połączeniem'

LANG[ 'hud.alert_queue.name' ] = 'Kolejka Alertów'
LANG[ 'hud.alert_queue.desc' ] = 'Czy alerty powinny być umieszczone w kolejce'

LANG[ 'hud.props_counter.name' ] = 'Licznik propów'
LANG[ 'hud.props_counter.desc' ] = 'Pokaż licznik propów'

LANG[ 'hud.main_avatar_mode.name' ] = 'Główny Typ Awatara'
LANG[ 'hud.main_avatar_mode.desc' ] = 'Wybierz typ'

LANG[ 'hud.voice_avatar_mode.name' ] = 'Typ Awatara Głosowego'
LANG[ 'hud.voice_avatar_mode.desc' ] = 'Wybierz typ'

LANG[ 'hud.restrict_themes.name' ] = 'Ogranicz Motywy'
LANG[ 'hud.restrict_themes.desc' ] = 'Ogranicz graczy do wyboru motywów'

LANG[ 'hud.speedometer_mph.name' ] = 'Używaj Mil'
LANG[ 'hud.speedometer_mph.desc' ] = 'Przełącz jednostki na mile na godzinę'

LANG[ 'hud.speedometer_max_speed.name' ] = 'Maksymalna Domyślna Prędkość'
LANG[ 'hud.speedometer_max_speed.desc' ] = 'Maksymalna prędkość dla prędkościomierza'

LANG[ 'hud_should_draw' ] = 'Czy powinno rysować element'
LANG[ 'hud.main.name' ] = 'Główne HUD'
LANG[ 'hud.ammo.name' ] = 'Amunicja'
LANG[ 'hud.agenda.name' ] = 'Agenda'
LANG[ 'hud.alerts.name' ] = 'Alerty'
LANG[ 'hud.pickup_history.name' ] = 'Historia Podnoszenia'
LANG[ 'hud.level.name' ] = 'Poziom'
LANG[ 'hud.voice.name' ] = 'Panele Głosowe'
LANG[ 'hud.overhead_health.name' ] = '3D2D Pasek Zdrowia'
LANG[ 'hud.overhead_armor.name' ] = '3D2D Pasek Pancerza'
LANG[ 'hud.vehicle.name' ] = 'HUD Pojazdu'

--[[
    ........
    Settings
]]--

LANG[ 'hud.theme.name' ] = 'Motyw'
LANG[ 'hud.theme.desc' ] = 'Wybierz motyw HUDu'

LANG[ 'hud.scale.name' ] = 'Skala'
LANG[ 'hud.scale.desc' ] = 'Dostosuj skalę HUDu'

LANG[ 'hud.roundness.name' ] = 'Zaokrąglenie'
LANG[ 'hud.roundness.desc' ] = 'Dostosuj zaokrąglenie HUDu'

LANG[ 'hud.margin.name' ] = 'Margines'
LANG[ 'hud.margin.desc' ] = 'Odległość między HUDem a krawędziami'

LANG[ 'hud.icons_3d.name' ] = '3D Modele'
LANG[ 'hud.icons_3d.desc' ] = 'Renderuj ikony modeli w 3D'

LANG[ 'hud.compact.name' ] = 'Tryb Kompaktowy'
LANG[ 'hud.compact.desc' ] = 'Włącz tryb kompaktowy'

LANG[ 'hud.speedometer_blur.name' ] = 'Rozmycie Prędkościomierza'
LANG[ 'hud.speedometer_blur.desc' ] = 'Włącz rozmycie prędkościomierza'

LANG[ 'hud.3d2d_max_details.name' ] = 'Maks. Detale 3D2D'
LANG[ 'hud.3d2d_max_details.desc' ] = 'Maksymalna ilość szczegółowych informacji renderowanych'

--[[
    ......
    Status
]]--

LANG[ 'hud_lockdown' ] = 'GODZINA POLICYJNA'
LANG[ 'hud_lockdown_help' ] = 'Proszę wrócić do swoich domów!'

LANG[ 'hud_wanted' ] = 'POSZUKIWANY'
LANG[ 'hud_wanted_help' ] = 'Powód: {reason}'

LANG[ 'hud_arrested' ] = 'ARESZTOWANY'
LANG[ 'hud_arrested_help' ] = 'Zostaniesz wypuszczony za {time}'

onyx.lang:AddPhrases( 'polish', LANG )
--PATH addons/____onyx_hud/lua/onyx/modules/hud/core/cl_scaling.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

14/08/2024

--]]

-- I made this to cache calculated values for UI scaling
-- It is working cheaper than using raw functions ;P

local CONVAR = CreateClientConVar( 'cl_onyx_hud_scale', '100', true, false, 'Scale', 50, 150 )

local currentContextID
local cache = {
    [ 1 ] = {}, -- ScaleWide
    [ 2 ] = {} -- ScaleTall
}

local scale do
    local Round = math.Round
    function scale( int, method, storageIndex )
        local scaleFunc = onyx[ method ]
        local scaleInt = onyx.hud.GetScale() -- from outside

        if ( currentContextID ) then
            local cacheTable = cache[ storageIndex ]
            local cached = cacheTable[ int ]

            if ( cached ) then
                return cached
            else
                local result = Round( scaleFunc( int ) * scaleInt )
    
                cache[ storageIndex ][ int ] = result
    
                return result
            end
        else
            return Round( scaleFunc( int ) * scaleInt )
        end
    end
end

function onyx.hud.GetScale()
    return ( CONVAR:GetInt() / 100 )
end

function onyx.hud.StartScaling( contextID )
    currentContextID = contextID
end

function onyx.hud.EndScaling()
    if ( currentContextID ) then
        currentContextID = nil
    end
end

function onyx.hud.ScaleWide( int )
    return scale( int, 'ScaleWide', 1 )
end

function onyx.hud.ScaleTall( int )
    return scale( int, 'ScaleTall', 2 )
end

function onyx.hud.ResetScaleCache()
    local client = LocalPlayer()

    for index = 1, 2 do
        cache[ index ] = {}
    end

    for id, element in pairs( onyx.hud.elements ) do
        if ( element.onSizeChanged ) then
            element:onSizeChanged( client )
        end
    end
end

cvars.AddChangeCallback( 'cl_onyx_hud_scale', function( _, _, new )
    onyx.hud.ResetScaleCache()
    onyx.hud.BuildFonts()
end, 'onyx.hud.Update' )

hook.Add( 'OnScreenSizeChanged', 'onyx.hud.ResetScaleCache', function()
    onyx.hud.ResetScaleCache()
    onyx.hud.BuildFonts()
end )
--PATH addons/____onyx_hud/lua/onyx/modules/hud/core/cl_theme.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

14/08/2024

--]]

onyx.hud.themes = onyx.hud.themes or {}

local CONVAR_THEME = CreateClientConVar( 'cl_onyx_hud_theme_id', 'default', true, false )

cvars.AddChangeCallback( 'cl_onyx_hud_theme_id', function( _, _, new )
    hook.Run( 'onyx.hud.OnChangedTheme', onyx.hud:GetCurrentTheme() )
end, 'onyx.hud.internal' )

-- predefined colors
local COLORS = {
    [ 'light' ] = {
        textPrimary = color_black,
        textSecondary = Color( 45, 45, 45 ),
        textTertiary = Color( 70, 70, 70),
        negative = Color( 210, 35, 35),
        lockdown = Color( 166, 44, 44)
    },
    [ 'dark' ] = {
        textPrimary = color_white,
        textSecondary = Color( 171, 171, 171),
        textTertiary = Color( 97, 97, 97),
        negative = Color( 255, 76, 76),
        lockdown = Color( 255, 76, 76)
    }
}

function onyx.hud:GetColor( id )
    local themeTable = self:GetCurrentTheme()
    local colorsTable = themeTable.colors
    
    return ( colorsTable[ id ] )
end

function onyx.hud:GetCurrentTheme()
    if ( self:GetOptionValue( 'restrict_themes' ) ) then
        return self.themes[ 'default' ]
    else
        local themeID = CONVAR_THEME:GetString()
        return ( self.themes[ themeID ] or self.themes[ 'default' ] )
    end
end

function onyx.hud:IsDark()
    return self:GetCurrentTheme().dark
end

function onyx.hud:CreateTheme( id, data )
    local colors = data.colors
    local _, _, lightness = ColorToHSL( colors.primary )
    local isDark = lightness < .5
    local predefinedColors = COLORS[ isDark and 'dark' or 'light' ]

    data.id = id
    data.dark = isDark
    data.isDark = isDark
    
    table.Inherit( colors, predefinedColors )
    
    self.themes[ id ] = data
end

--PATH addons/____onyx_hud/lua/onyx/modules/hud/elements/cl_status.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

18/08/2024

--]]

local hud = onyx.hud

local L = function( ... ) return onyx.lang:Get( ... ) end
local WIMG_LOCKDOWN = onyx.wimg.Create( 'hud_lockdown', 'smooth mips' )
local WIMG_WANTED = onyx.wimg.Create( 'hud_wanted', 'smooth mips' )
local WIMG_ARRESTED = onyx.wimg.Create( 'hud_arrested', 'smooth mips' )

local function drawLabel( x, y, w, h, padding, wimg, title, desc, color, desc2 )
    local x0, y0 = x + w * .5, y + h * .5
    local iconSize = h - padding * 2
    local hh = h

    if desc2 then
        hh = hh + h * .2
    end

    hud.DrawRoundedBox( x, y, w, hh, hud:GetColor( 'primary' ) )

    wimg:Draw( x + padding, y + padding, iconSize, iconSize, ColorAlpha( color, 100 + 155 * math.abs( math.sin( CurTime() * 4 ) ) ) )

    draw.SimpleText( title, hud.fonts.TinyBold, x + padding * 2 + iconSize, y0, color, 0, 4 )
    draw.SimpleText( desc, hud.fonts.Tiny, x + padding * 2 + iconSize, y0, hud:GetColor( 'textSecondary' ), 0, 0 )
    if desc2 then
        draw.SimpleText(desc2, hud.fonts.Tiny, x + w * .02, y0 + h * .33, hud:GetColor( 'textSecondary' ), 0, 0 )
    end
end

hud:RegisterElement( 'status', { 
    height = 120,
    priority = 60,
    drawFn = function( element, client, scrW, scrH )
        local parent = onyx.hud.elements[ 'agenda' ]
        local screenPadding = hud.GetScreenPadding()
        local padding = hud.ScaleTall( parent.padding )
        local w = hud.ScaleWide( parent.width )
        local h = hud.ScaleTall( 50 )
        local space = hud.ScaleTall( 7.5 )

        local x, y = scrW - w - screenPadding, screenPadding
        if ( parent.active ) then
            y = y + hud.ScaleTall( parent.height ) + space
        end

        local tb = nw.GetGlobal('LockDown_I')
        if ( nw.GetGlobal('LockDown') and istable(tb) ) then
            local time = math.ceil(tb.EndTime) - math.ceil(CurTime())
            drawLabel( x, y, w, h, padding, WIMG_LOCKDOWN, L( 'hud_lockdown' ), L( 'hud_lockdown_help' ) .. ' | ' .. time .. ' сек', hud:GetColor( 'lockdown' ) )
            y = y + h + space
        end

        if ( client:IsWanted() ) then
            drawLabel( x, y, w, h, padding, WIMG_WANTED, L( 'hud_wanted' ), L( 'hud_wanted_help', { reason = client:WantedReson() or '' } ), hud.GetAnimColor( 0 ) )
            y = y + h + space
        end

        if ( client:GetNetVar('Arrest') ) then
            local timeLeft = client:GetNetVar('Arrest_Info').EndTime and math.Clamp( math.Round( client:GetNetVar('Arrest_Info').EndTime - CurTime() ), 0, 9999 ) or -1
            local timeFormatted
        
            if ( timeLeft >= 0 ) then
                if ( timeLeft > 300 ) then
                    timeFormatted = string.format( '%d %s', math.Round( timeLeft / 60 ) , L( 'minutes_l' ) )
                else
                    timeFormatted = string.format( '%d %s', timeLeft , L( 'seconds_l' ) )
                end
            else
                timeFormatted = L( 'unknown' )
            end

            local helpText = L( 'hud_arrested_help', { time = timeFormatted } )
            local ReasonText = L( 'hud_arrested_reason', { reason = client:GetNetVar('Arrest_Info').Reson } )

            drawLabel( x, y, w, h, padding, WIMG_ARRESTED, L( 'hud_arrested' ), helpText, hud:GetColor( 'textPrimary' ), ReasonText )
        end
    end, 
} )
--PATH addons/____onyx_scoreboard/lua/onyx/modules/scoreboard/languages/cl_turkish.lua:
--[[

Author: maellwoe
Email: maellwoe@hotmail.com

14/03/2024

--]]

local LANG = {}

-- Phrases
LANG['copied_clipboard'] = 'Panoya kopyalandı'
LANG['scoreboard_search'] = 'Ara... (Name/SteamID)'
LANG['you'] = 'Sen'
LANG['friend'] = 'Arkadaş'
LANG['addon_return_u'] = 'GERI'

-- Columns
LANG['scoreboard_col_team'] = 'Takım'
LANG['scoreboard_col_job'] = 'Meslek'
LANG['scoreboard_col_money'] = 'Para'
LANG['scoreboard_col_rank'] = 'Yetki'
LANG['scoreboard_col_karma'] = 'Karma'
LANG['scoreboard_col_playtime'] = 'OynamaSuresi'
LANG['scoreboard_col_health'] = 'Can'
LANG['scoreboard_col_level'] = 'Seviye'
LANG['scoreboard_col_none'] = 'Hicbiri'
LANG['scoreboard_col_gang'] = 'Gang'
LANG['scoreboard_col_ashop_badges'] = 'Rozetler'

-- Name Effects
LANG['scoreboard_eff_default'] = 'Varsayılan'
LANG['scoreboard_eff_glow'] = 'Parıltı'
LANG['scoreboard_eff_rainbow'] = 'Gökkuşağı'
LANG['scoreboard_eff_scanning_vertical'] = 'Taranıyor (Dikey)'
LANG['scoreboard_eff_scanning_horizontal'] = 'Taranıyor (Yatay)'
LANG['scoreboard_eff_gradient_invert'] = 'Gradyan (Rengi Ters Çevir)'
LANG['scoreboard_eff_wavy_dual'] = 'Dalgalı (Çift Renk)'

-- Buttons
LANG['scoreboard_btn_profile'] = 'Profili aç'
LANG['scoreboard_btn_freeze'] = 'Dondur'
LANG['scoreboard_btn_goto'] = 'Git'
LANG['scoreboard_btn_bring'] = 'Getir'
LANG['scoreboard_btn_return'] = 'Geri Gonder'
LANG['scoreboard_btn_respawn'] = 'Yeniden Dogur'
LANG['scoreboard_btn_slay'] = 'Öldür'
LANG['scoreboard_btn_spectate'] = 'İzle'

-- Words
LANG['rank_id'] = 'Yetki Tanımlayıcı'
LANG['name'] = 'İsim'
LANG['effect'] = 'Effekt'
LANG['color'] = 'Renk'
LANG['preview'] = 'Ön izleme'
LANG['creation'] = 'Oluşturum'
LANG['save'] = 'Kayıt'
LANG['dead'] = 'Ölü'
LANG['create_new'] = 'Yeni Oluştur'
LANG['column'] = 'Kolon'

-- Settings
LANG['addon_settings_u'] = 'AYARLAR'
LANG['scoreboard_ranks_u'] = 'YETKILER'
LANG['scoreboard_columns_u'] = 'KOLONLAR'

LANG['scoreboard.title.name'] = 'Başlık'
LANG['scoreboard.title.desc'] = 'Çerçeve için bir başlık gir'

LANG['scoreboard.group_teams.name'] = 'Grup Takımları'
LANG['scoreboard.group_teams.desc'] = '(DarkRP) Grupları iş kategorilerine göre gruplandırın'

LANG['scoreboard.colored_players.name'] = 'Renklendirilmiş Gradyan'
LANG['scoreboard.colored_players.desc'] = 'Oyuncu satırında renklendirilmiş gradyanı göster'

LANG['scoreboard.blur.name'] = 'Blur Teması'
LANG['scoreboard.blur.desc'] = 'Blur temasını etkinleştir'

LANG['scoreboard.scale.name'] = 'Çerçeve Boyutu Ölçeği'
LANG['scoreboard.scale.desc'] = 'Skor tablosunun çerçeve boyutunu ölçeklendirin'

onyx.lang:AddPhrases('turkish', LANG)
--PATH addons/____onyx_scoreboard/lua/onyx/modules/scoreboard/core/columns/sh_columns.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

03/03/2024

--]]

onyx.scoreboard.columns = onyx.scoreboard.columns or {}
onyx.scoreboard.columnsCustomizable = onyx.scoreboard.columnsCustomizable or {}
onyx.scoreboard.columnsMaxAmount = 5
onyx.scoreboard.columnsDefault = {
    [1] = 'team',
    [2] = 'rank',
    [3] = 'money',
    [4] = 'playtime',
}

function onyx.scoreboard:RegisterColumn(id, data)
    if (SERVER) then data = {} end -- server doesn't need that

    data.name = 'scoreboard_col_' .. id
    data.id = id

    onyx.scoreboard.columns[id] = data
end

do
    local BASE_COLUMNS = {
        -- {
        --     name = '',
        --     icon = 'https://i.imgur.com/FQK7XQx.png',
        --     small = true,
        --     getValue = function(client)
        --         return client:Frags()
        --     end
        -- },
        -- {
        --     name = '',
        --     icon = 'https://i.imgur.com/13t90iD.png',
        --     small = true,
        --     getValue = function(client)
        --         return client:Deaths()
        --     end
        -- }
    }

    function onyx.scoreboard:GetActiveColumns()
        local columns = {}

        -- configurable options
        for index = 1, self.columnsMaxAmount do
            local cfgID = self.columnsCustomizable[index]
            if (cfgID) then
                local cfgData = self.columns[cfgID]
                if (cfgData and (not cfgData.customCheck or cfgData.customCheck())) then
                    table.insert(columns, cfgData)
                end
            else
                local defaultID = onyx.scoreboard.columnsDefault[index]
                if (defaultID) then
                    local defaultData = self.columns[defaultID]
                    if (defaultData and (not defaultData.customCheck or defaultData.customCheck())) then
                        table.insert(columns, defaultData)
                    end
                end
            end
        end

        -- default columns
        for _, column in ipairs(BASE_COLUMNS) do
            table.insert(columns, column)
        end

        return columns
    end
end
--PATH addons/____onyx_scoreboard/lua/onyx/modules/scoreboard/ui/cl_columns_row.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

02/03/2024

--]]

local COLOR_PRIMARY = onyx:Config('colors.primary')
local COLOR_SECONDARY = onyx:Config('colors.secondary')
local COLOR_TERTIARY = onyx:Config('colors.tertiary')
local COLOR_ACCENT = onyx:Config('colors.accent')
local SHADOW_ALPHA = 200
local COLOR_SHADOW = Color(0, 0, 0, 100)
local COLOR_GRAY = Color(149, 149, 149)
local COLOR_GRAY_LIGHT = Color(198, 198, 198)
local SHADOW_DISTANCE = 2

--[[------------------------------
PANEL
--------------------------------]]
local PANEL = {}

AccessorFunc(PANEL, 'm_Font', 'Font')
AccessorFunc(PANEL, 'm_bHeader', 'Header')

function PANEL:Init()
    self.m_Font = onyx.Font('Comfortaa@16')
    self.columns = {}
end

function PANEL:InitColumns()
    local activeColumns = onyx.scoreboard:GetActiveColumns()

    self.columnsAmount = #activeColumns
    self.realColumnsAmount = self.columnsAmount - 2

    for index, column in ipairs(activeColumns) do
        self.columns[index] = self:CreateColumn(column, index)
    end
end

function PANEL:CreateColumn(data, index)
    local column = self:Add('onyx.Label')
    if (data.id == 'team' and DarkRP) then
        column:SetText(onyx.lang:Get('scoreboard_col_job'))
    else
        column:SetText(onyx.lang:Get(data.name))
    end

    column:SetFont(self.m_Font)
    column:CenterText()
    column:SetExpensiveShadow(SHADOW_DISTANCE, COLOR_SHADOW)
    column.data = data

    if (not data.small and self.realColumnsAmount == 1) then
        column:SetContentAlignment(4)
        column.TextLeft = true
    end

    if (self:GetHeader()) then
        column:SetTextColor(COLOR_GRAY)

        if (data.icon) then
            local wimgIcon = onyx.wimg.Simple(data.icon, 'smooth mips')
            column:SetText('')
            column.Paint = function(panel, w, h)
                local size = math.min(h, onyx.ScaleTall(16))
                local space = onyx.ScaleTall(5)
                local font = panel:GetFont()
                local textColor = panel:GetTextColor()
                local text = data.small and '' or data.name
                local textNotEmpty = text ~= ''
                local y0 = h * .5
                local x0 = w * .5
                local textW, textH

                if (textNotEmpty) then
                    surface.SetFont(font)
                    textW, textH = surface.GetTextSize(text)

                    local totalW = textW + size + space
                    local x = x0 - totalW * .5

                    wimgIcon:Draw(x + SHADOW_DISTANCE, y0 - size * .5 + SHADOW_DISTANCE, size, size, COLOR_SHADOW)
                    wimgIcon:Draw(x, y0 - size * .5, size, size, textColor)
                    draw.SimpleText(text, font, x + size + space, y0, textColor, 0, 1)
                else
                    wimgIcon:Draw(x0 - size * .5 + SHADOW_DISTANCE, y0 - size * .5 + SHADOW_DISTANCE, size, size, COLOR_SHADOW)
                    wimgIcon:Draw(x0 - size * .5, y0 - size * .5, size, size, textColor)
                end
            end
        end
    else
        if (data.buildFunc) then
            column:SetText('')
            column.NoText = true
            column.Paint = nil
        end
    end

    return column
end

function PANEL:SetValue(index, formattedValue, rawValue)
    local column = self:GetColumn(index)
    if (not column.NoText) then
        column:SetText(formattedValue)
    end
    column.TextValue = formattedValue -- if GetText got overrided
    column.Value = rawValue or formattedValue
end

function PANEL:SetColor(index, value)
    self:GetColumn(index):SetTextColor(value)
end

function PANEL:SetClickFunc(index, func)
    local column = self:GetColumn(index)
    column:Import('click')
    column.DoClick = func
    column.Think = function(panel)
        if (not panel.hoverBlocked) then
            panel:SetTextColor(panel:IsHovered() and color_white or COLOR_GRAY)
        end
    end
end

function PANEL:GetColumn(index)
    local column = self.columns[index]
    assert(column, 'Invalid column')
    return column
end

function PANEL:PerformLayout(w, h)
    local bEqual = false
    local widthLeft = 1
    local columnsAmount = #self.columns

    local smallWidth = w * .066
    local smallAmount = 0

    local bigAmount = 0
    local bigAreaWidth = w

    -- calculate sizes
    if (not bEqual) then
        for index = columnsAmount, 1, -1 do
            local column = self.columns[index]
            local data = column.data
            if (data.small) then
                smallAmount = smallAmount + 1
                bigAreaWidth = bigAreaWidth - smallWidth
            else
                bigAmount = bigAmount + 1
            end
        end
    end

    -- set sizes
    for index, column in ipairs(self.columns) do
        local width = not bEqual and math.Round(column.data.small and smallWidth or bigAreaWidth / bigAmount) or math.Round(w / columnsAmount)
        local side = bigAmount == 0 and RIGHT or LEFT
        local zpos = bigAmount == 0 and (columnsAmount - index) or index

        column:SetWide(width)
        column:SetZPos(zpos)
        column:Dock(side)
    end
end

onyx.gui.Register('onyx.Scoreboard.ColumnsRow', PANEL)
--PATH addons/_pcasino/lua/perfectcasino/core/cl_core.lua:
if not file.Exists("pcasino_data", "DATA") then
	file.CreateDir("pcasino_data")
	file.CreateDir("pcasino_data/ui")
end	

PerfectCasino.Icons = {}
PerfectCasino.IconsList = {} -- This is a list of all the icons. It is used in some UI elements to allow players to cycle through them all.
function PerfectCasino.Core.AddIcon(id, name, url)
	PerfectCasino.Icons[id] = {name = name, url = url, mat = Material("ukrainerp/kazik_ebat/"..id..".png")}

	table.insert(PerfectCasino.IconsList, id)
end

PerfectCasino.Core.AddIcon("anything", "Anything", "https://0wain.xyz/icons/pcasino/anything.png")

PerfectCasino.Core.AddIcon("bell", "Bell", "https://0wain.xyz/icons/pcasino/bell.png")
PerfectCasino.Core.AddIcon("berry", "Strawberry", "https://0wain.xyz/icons/pcasino/berry.png")
PerfectCasino.Core.AddIcon("cherry", "Cherry", "https://0wain.xyz/icons/pcasino/cherry.png")
PerfectCasino.Core.AddIcon("clover", "Clover", "https://0wain.xyz/icons/pcasino/clover.png")
PerfectCasino.Core.AddIcon("diamond", "Diamond", "https://0wain.xyz/icons/pcasino/diamond.png")
PerfectCasino.Core.AddIcon("dollar", "Dollar", "https://0wain.xyz/icons/pcasino/dollar.png")
PerfectCasino.Core.AddIcon("melon", "Watermelon", "https://0wain.xyz/icons/pcasino/melon.png")
PerfectCasino.Core.AddIcon("seven", "Seven", "https://0wain.xyz/icons/pcasino/seven.png")

PerfectCasino.Core.AddIcon("gold", "Gold Bars", "https://0wain.xyz/icons/pcasino/gold.png")
PerfectCasino.Core.AddIcon("coins", "Coins", "https://0wain.xyz/icons/pcasino/coins.png")
PerfectCasino.Core.AddIcon("emerald", "Emerald", "https://0wain.xyz/icons/pcasino/emerald.png")
PerfectCasino.Core.AddIcon("bag", "Money Bag", "https://0wain.xyz/icons/pcasino/bag.png")
PerfectCasino.Core.AddIcon("bar", "Gold Bar", "https://0wain.xyz/icons/pcasino/bar.png")
PerfectCasino.Core.AddIcon("coin", "Coin", "https://0wain.xyz/icons/pcasino/coin.png")
PerfectCasino.Core.AddIcon("vault", "Vault", "https://0wain.xyz/icons/pcasino/vault.png")
PerfectCasino.Core.AddIcon("chest", "Treasure Chest", "https://0wain.xyz/icons/pcasino/chest.png")

-- Other
PerfectCasino.Core.AddIcon("mystery_1", "Mystery Wheel 1", "https://0wain.xyz/icons/pcasino/mystery_1.png")
PerfectCasino.Core.AddIcon("mystery_2", "Mystery Wheel 2", "https://0wain.xyz/icons/pcasino/mystery_2.png")
PerfectCasino.Core.AddIcon("mystery_3", "Mystery Wheel 3", "https://0wain.xyz/icons/pcasino/mystery_3.png")
PerfectCasino.Core.AddIcon("dolla", "Dolla", "https://0wain.xyz/icons/pcasino/dolla.png")

function PerfectCasino.Core.LoadIcons()
	--[[for k, v in pairs(PerfectCasino.Icons) do
		print("[pCasino]", "Checking icon", k)
		if file.Exists( "pcasino_data/ui/"..k..".png", "DATA" ) then print("	", "Found") continue end

		print("	", "Attempting to download from", v.url)
		http.Fetch(v.url, function( body, len, headers, code )
			file.Write("pcasino_data/ui/"..k..".png", body)
			v.mat = Material("data/pcasino_data/ui/"..k..".png")

			print("[pCasino]", k, "Download is complete. The image can be found at", "pcasino_data/ui/"..k..".png")
		end)
	end]]
end

hook.Add("HUDPaint", "pVault:LoadIcons", function()
	hook.Remove("HUDPaint", "pVault:LoadIcons")
	PerfectCasino.Core.LoadIcons()
end)



-- Seat text

local draw_simpletext = draw.SimpleText
hook.Add("HUDPaint", "pVault:ChairLeave", function()
	local myChair = LocalPlayer():GetVehicle()
	if (not IsValid(myChair)) or (not IsValid(myChair:GetParent())) then return end
	if not (myChair:GetParent():GetClass() == "pcasino_chair") then return end

	draw_simpletext(PerfectCasino.Translation.UI.LeaveSeat, "pCasino.Entity.Bid", ScrW()*0.5, ScrH(), color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
end)

-- Free spin received
net.Receive("pCasino:FreeSpin", function()
	PerfectCasino.Spins = net.ReadUInt(6)
end)



-- Improved toolgun
concommand.Add("pcasino_clone", function()
	if not PerfectCasino.Core.Access(LocalPlayer()) then return end
	local entity = LocalPlayer():GetEyeTrace().Entity

	if not string.match(entity:GetClass(), "pcasino") then return end
	if not entity.data then return end

	PerfectCasino.UI.CurrentSettings.Entity = entity:GetClass()
	PerfectCasino.UI.CurrentSettings.Settings = table.Copy(entity.data)

	if IsValid(PerfectCasino.UI.ConfigMenu) then
		PerfectCasino.UI.ConfigMenu:Close()
	end

	PerfectCasino.UI.Config()

	local comboBox = PerfectCasino.UI.ConfigMenu.entitySelectBox
	local key
	for k, v in pairs(comboBox.Choices) do
		if not (v == PerfectCasino.Translation.Entities[entity:GetClass()]) then continue end

		key = k
	end

	if not key then return end
	comboBox:ChooseOptionID(key)

	PerfectCasino.UI.ConfigMenu:Hide()
end)

-- Used for debugging
concommand.Add("pcasino_print_data", function()
	if not PerfectCasino.Core.Access(LocalPlayer()) then return end
	local entity = LocalPlayer():GetEyeTrace().Entity

	if not string.match(entity:GetClass(), "pcasino") then return end
	if not entity.data then return end

	PrintTable(entity.data)
end)
--PATH addons/____plogs/lua/plogs/lib/pon1.lua:
--[[
addons/lgos/lua/plogs/lib/pon1.lua
--]]
--[[ 

DEVELOPMENTAL VERSION;

VERSION 1.2.1
Copyright thelastpenguin™ 

	You may use this for any purpose as long as:
	-	You don't remove this copyright notice.
	-	You don't claim this to be your own.
	-	You properly credit the author, thelastpenguin™, if you publish your work based on (and/or using) this.
	
	If you modify the code for any purpose, the above still applies to the modified code.
	
	The author is not held responsible for any damages incured from the use of pon1, you use it at your own risk.

DATA TYPES SUPPORTED:
 - tables  - 		k,v - pointers
 - strings - 		k,v - pointers
 - numbers -		k,v
 - booleans- 		k,v
 - Vectors - 		k,v
 - Angles  -		k,v
 - Entities- 		k,v
 - Players - 		k,v
 
CHANGE LOG
V 1.1.0
 - Added Vehicle, NPC, NextBot, Player, Weapon1
V 1.2.0
 - Added custom handling for k,v tables without any array compon1ent.
V 1.2.1
 - fixed deserialization bug.
 
THANKS TO...
 - VERCAS for the inspiration.
]]


local pon1 = {};
_G.pon1 = pon1;

local type, count = type, table.Count ;
local tonumber = tonumber ;
local format = string.format;
do
	local type, count = type, table.Count ;
	local tonumber = tonumber ;
	local format = string.format;

	local encode = {};
	
	local tryCache ;
	
	local cacheSize = 0;
	
	encode['table'] = function( self, tbl, output, cache )
		
		if( cache[ tbl ] )then
			output[ #output + 1 ] = format('(%x)',  cache[tbl] );
			return ;
		else
			cacheSize = cacheSize + 1;
			cache[ tbl ] = cacheSize;
		end
		-- CALCULATE COMPONENT SIZES
		local nSize = #tbl;
		local kvSize = count( tbl ) - nSize;
		
		if( nSize == 0 and kvSize > 0 )then
			output[ #output + 1 ] = '[';
		else
			output[ #output + 1 ] = '{';
			
			if nSize > 0 then
				for i = 1, nSize do
					local v = tbl[ i ];
					if not v then continue end
					local tv = type( v );
					-- HANDLE POINTERS
					if( tv == 'string' )then
						local pid = cache[ v ];
						if( pid )then
							output[ #output + 1 ] = format('(%x)',  pid );
						else
							cacheSize = cacheSize + 1;
							cache[ v ] = cacheSize;
							
							self.string( self, v, output, cache );
						end
					else
						self[ tv ]( self, v, output, cache );
					end
				end
			end
		end
			
		if( kvSize > 0 )then
			if( nSize > 0 )then
				output[ #output + 1 ] = '~';
			end
			for k,v in next, tbl do
				if( type( k ) ~= 'number' or k < 1 or k > nSize )then
					local tk, tv = type( k ), type( v );
					
					-- THE KEY
					if( tk == 'string' )then
						local pid = cache[ k ];
						if( pid )then
							output[ #output + 1 ] = format('(%x)',  pid );
						else
							cacheSize = cacheSize + 1;
							cache[ k ] = cacheSize;
							
							self.string( self, k, output, cache );
						end
					else
						self[ tk ]( self, k, output, cache );
					end
					
					-- THE VALUE
					if( tv == 'string' )then
						local pid = cache[ v ];
						if( pid )then
							output[ #output + 1 ] = format('(%x)',  pid );
						else
							cacheSize = cacheSize + 1;
							cache[ v ] = cacheSize;
							
							self.string( self, v, output, cache );
						end
					else
						self[ tv ]( self, v, output, cache );
					end
					
				end
			end
		end
		output[ #output + 1 ] = '}';
	end
	--    ENCODE STRING
	local gsub = string.gsub ;
	encode['string'] = function( self, str, output )
		--if tryCache( str, output ) then return end
		local estr, count = gsub( str, ";", "\\;");
		if( count == 0 )then
			output[ #output + 1 ] = '\''..str..';';
		else
			output[ #output + 1 ] = '"'..estr..'";';
		end
	end
	--    ENCODE NUMBER
	encode['number'] = function( self, num, output )
		if num%1 == 0 then
			if num < 0 then
				output[ #output + 1 ] = format( 'x%x;', -num );
			else
				output[ #output + 1 ] = format('X%x;', num );
			end
		else
			output[ #output + 1 ] = tonumber( num )..';';
		end
	end
	--    ENCODE BOOLEAN
	encode['boolean'] = function( self, val, output )
		output[ #output + 1 ] = val and 't' or 'f'
	end
	--    ENCODE VECTOR
	encode['Vector'] = function( self, val, output )
		output[ #output + 1 ] = ('v'..val.x..','..val.y)..(','..val.z..';');
	end
	--    ENCODE ANGLE
	encode['Angle'] = function( self, val, output )
		output[ #output + 1 ] = ('a'..val.p..','..val.y)..(','..val.r..';');
	end
	encode['Entity'] = function( self, val, output )
		output[ #output + 1] = 'E'..(IsValid( val ) and (val:EntIndex( )..';') or '#');
	end
	encode['Player']  = encode['Entity'];
	encode['Vehicle'] = encode['Entity'];
	encode['Weapon']  = encode['Entity'];
	encode['NPC']     = encode['Entity'];
	encode['NextBot'] = encode['Entity'];
	
	encode['nil'] = function()
		output[ #output + 1 ] = '?';
	end
	encode.__index = function( key )
		ErrorNoHalt('Type: '..key..' can not be encoded. Encoded as as pass-over value.');
		return encode['nil'];
	end
	
	do
		local empty, concat = table.Empty, table.concat ;
		function pon1.encode( tbl )
			local output = {};
			cacheSize = 0;
			encode[ 'table' ]( encode, tbl, output, {} );
			local res = concat( output );
			
			return res;
		end
	end
end

do
	local tonumber = tonumber ;
	local find, sub, gsub, Explode = string.find, string.sub, string.gsub, string.Explode ;
	local Vector, Angle, Entity = Vector, Angle, Entity ;
	
	local decode = {};
	decode['{'] = function( self, index, str, cache )
		
		local cur = {};
		cache[ #cache + 1 ] = cur;
		
		local k, v, tk, tv = 1, nil, nil, nil;
		while( true )do
			tv = sub( str, index, index );
			if( not tv or tv == '~' )then
				index = index + 1;
				break ;
			end
			if( tv == '}' )then
				return index + 1, cur;
			end
			
			-- READ THE VALUE
			index = index + 1;
			index, v = self[ tv ]( self, index, str, cache );
			cur[ k ] = v;
			
			k = k + 1;
		end
		
		while( true )do
			tk = sub( str, index, index );
			if( not tk or tk == '}' )then
				index = index + 1;
				break ;
			end
			
			-- READ THE KEY
			
			index = index + 1;
			index, k = self[ tk ]( self, index, str, cache );
			
			-- READ THE VALUE
			tv = sub( str, index, index );
			index = index + 1;
			index, v = self[ tv ]( self, index, str, cache );
			
			cur[ k ] = v;
		end
		
		return index, cur;
	end
	decode['['] = function( self, index, str, cache )
		
		local cur = {};
		cache[ #cache + 1 ] = cur;
		
		local k, v, tk, tv = 1, nil, nil, nil;
		while( true )do
			tk = sub( str, index, index );
			if( not tk or tk == '}' )then
				index = index + 1;
				break ;
			end
			
			-- READ THE KEY
			index = index + 1;
			index, k = self[ tk ]( self, index, str, cache );
			if not k then continue end
			
			-- READ THE VALUE
			tv = sub( str, index, index );
			index = index + 1;
			if not self[tv] then
				print('did not find type: '..tv)
			end
			index, v = self[ tv ]( self, index, str, cache );
			
			cur[ k ] = v;
		end
		
		return index, cur;
	end
	
	-- STRING
	decode['"'] = function( self, index, str, cache )
		local finish = find( str, '";', index, true );
		local res = gsub( sub( str, index, finish - 1 ), '\\;', ';' );
		index = finish + 2;
		
		cache[ #cache + 1 ] = res;
		return index, res;
	end
	-- STRING NO ESCAPING NEEDED
	decode['\''] = function( self, index, str, cache )
		local finish = find( str, ';', index, true );
		local res = sub( str, index, finish - 1 )
		index = finish + 1;
		
		cache[ #cache + 1 ] = res;
		return index, res;
	end
	
	-- NUMBER
	decode['n'] = function( self, index, str, cache )
		index = index - 1;
		local finish = find( str, ';', index, true );
		local num = tonumber( sub( str, index, finish - 1 ) );
		index = finish + 1;
		return index, num;
	end
	decode['0'] = decode['n'];
	decode['1'] = decode['n'];
	decode['2'] = decode['n'];
	decode['3'] = decode['n'];
	decode['4'] = decode['n'];
	decode['5'] = decode['n'];
	decode['6'] = decode['n'];
	decode['7'] = decode['n'];
	decode['8'] = decode['n'];
	decode['9'] = decode['n'];
	decode['-'] = decode['n'];
	-- positive hex
	decode['X'] = function( self, index, str, cache )
		local finish = find( str, ';', index, true );
		local num = tonumber( sub( str, index, finish - 1), 16 );
		index = finish + 1;
		return index, num;
	end
	-- negative hex
	decode['x'] = function( self, index, str, cache )
		local finish = find( str, ';', index, true );
		local num = -tonumber( sub( str, index, finish - 1), 16 );
		index = finish + 1;
		return index, num;
	end
	
	-- POINTER
	decode['('] = function( self, index, str, cache )
		local finish = find( str, ')', index, true );
		local num = tonumber( sub( str, index, finish - 1), 16 );
		index = finish + 1;
		return index, cache[ num ];
	end
	
	-- BOOLEAN. ONE DATA TYPE FOR YES, ANOTHER FOR NO.
	decode[ 't' ] = function( self, index )
		return index, true;
	end
	decode[ 'f' ] = function( self, index )
		return index, false;
	end
	
	-- VECTOR
	decode[ 'v' ] = function( self, index, str, cache )
		local finish =  find( str, ';', index, true );
		local vecStr = sub( str, index, finish - 1 );
		index = finish + 1; -- update the index.
		local segs = Explode( ',', vecStr, false );
		return index, Vector( tonumber( segs[1] ), tonumber( segs[2] ), tonumber( segs[3] ) );
	end
	-- ANGLE
	decode[ 'a' ] = function( self, index, str, cache )
		local finish =  find( str, ';', index, true );
		local angStr = sub( str, index, finish - 1 );
		index = finish + 1; -- update the index.
		local segs = Explode( ',', angStr, false );
		return index, Angle( tonumber( segs[1] ), tonumber( segs[2] ), tonumber( segs[3] ) );
	end
	-- ENTITY
	decode[ 'E' ] = function( self, index, str, cache )
		if( str[index] == '#' )then
			index = index + 1;
			return index, NULL ;
		else
			local finish = find( str, ';', index, true );
			local num = tonumber( sub( str, index, finish - 1 ) );
			index = finish + 1;
			return index, Entity( num );
		end
	end
	-- PLAYER 
	decode[ 'P' ] = function( self, index, str, cache )
		local finish = find( str, ';', index, true );
		local num = tonumber( sub( str, index, finish - 1 ) );
		index = finish + 1;
		return index, Entity( num ) or NULL;
	end
	-- NIL
	decode['?'] = function( self, index, str, cache )
		return index + 1, nil;
	end

	
	function pon1.decode( data )
		local _, res = decode[sub(data,1,1)]( decode, 2, data, {});
		return res;
	end
end


--PATH addons/____sam/lua/sam/sh_permissions.lua:
if SAM_LOADED then return end

local permissions = {}

local give_permission
if SERVER then
	local permissions_to_add = {}

	give_permission = function(name, permission)
		if sam.ranks.ranks_loaded() then
			local rank = sam.ranks.get_rank(name)
			if rank and rank.data.permissions[permission] == nil then
				sam.ranks.give_permission(name, permission)
			end
		else
			table.insert(permissions_to_add, {name, permission})
		end
	end

	hook.Add("SAM.LoadedRanks", "SAM.Command.GivePermissions", function()
		for k, v in ipairs(permissions_to_add) do
			give_permission(v[1], v[2])
		end
	end)
end

local get_next_Other = function()
	for i, v in ipairs(permissions) do
		if v.category == "Other" then
			return i
		end
	end
	return #permissions + 1
end

function sam.permissions.add(permission, category, rank)
	if not sam.isstring(category) then
		category = "Other"
	end

	local permission_data = {
		name = permission,
		category = category,
		rank = rank,
		value = value
	}

	local index = sam.permissions.get_index(permission)
	if not index then
		if category ~= "Other" then
			table.insert(permissions, get_next_Other(), permission_data)
		else
			table.insert(permissions, permission_data)
		end
		hook.Call("SAM.AddedPermission", nil, permission, category, rank, value)
	else
		permissions[index] = permission_data
		hook.Call("SAM.PermissionModified", nil, permission, category, rank, value)
	end

	if SERVER and rank then
		give_permission(rank, permission)
	end
end

function sam.permissions.get_index(permission)
	for i, v in ipairs(permissions) do
		if v.name == permission then
			return i
		end
	end
end

function sam.permissions.remove(permission)
	local index = sam.permissions.get_index(permission)
	if index then
		table.remove(permissions, index)
		hook.Call("SAM.RemovedPermission", nil, permission)
	end
end

function sam.permissions.exists(permission)
	return sam.permissions.get_index(permission) and true or false
end

function sam.permissions.get()
	return permissions
end
--PATH addons/____sam/lua/sam/ranks/sh_ranks.lua:
if SAM_LOADED then return end

SAM_IMMUNITY_SUPERADMIN = 100
SAM_IMMUNITY_ADMIN = 50
SAM_IMMUNITY_USER = 1

function sam.ranks.get_ranks()
	return sam.get_global("Ranks", {})
end

function sam.ranks.get_rank(rank)
	local ranks = sam.ranks.get_ranks()
	return ranks[rank]
end

function sam.ranks.is_rank(rank)
	if sam.ranks.get_rank(rank) then
		return true
	else
		return false
	end
end

function sam.ranks.is_default_rank(rank)
	return rank == "superadmin" or rank == "admin" or rank == "user"
end

function sam.ranks.inherits_from(rank, rank_2)
	if rank == rank_2 then
		return true
	end

	while true do
		rank = sam.ranks.get_rank(rank)

		if rank then
			local inherits_from = rank.inherit
			if inherits_from == rank_2 then
				return true
			end

			rank = rank.inherit
		else
			return false
		end
	end
end

function sam.ranks.has_permission(rank, permission)
	while true do
		if rank == "superadmin" then
			return true
		end

		rank = sam.ranks.get_rank(rank)

		if rank then
			local rank_permission = rank.data.permissions[permission]
			if rank_permission ~= nil then
				return rank_permission
			end

			rank = rank.inherit
		else
			return false
		end
	end
end

function sam.ranks.get_limit(rank, limit_type)
	while true do
		if rank == "superadmin" then return -1 end

		rank = sam.ranks.get_rank(rank)

		if rank then
			local limit = rank.data.limits[limit_type]
			if limit ~= nil then
				return limit
			end

			rank = rank.inherit
		else
			return cvars.Number("sbox_max" .. limit_type, 0)
		end
	end
end

function sam.ranks.get_immunity(rank)
	rank = sam.ranks.get_rank(rank)
	return rank and rank.immunity or false
end

function sam.ranks.can_target(rank_1, rank_2)
	rank_1, rank_2 = sam.ranks.get_rank(rank_1), sam.ranks.get_rank(rank_2)
	if not rank_1 or not rank_2 then
		return false
	end
	return rank_1.immunity >= rank_2.immunity
end

function sam.ranks.get_ban_limit(rank)
	rank = sam.ranks.get_rank(rank)
	return rank and rank.ban_limit or false
end

if CLIENT then
	hook.Add("SAM.ChangedGlobalVar", "SAM.Ranks.CheckLoadedRanks", function(key, value)
		if key == "Ranks" then
			hook.Call("SAM.LoadedRanks", nil, value)
			hook.Remove("SAM.ChangedGlobalVar", "SAM.Ranks.CheckLoadedRanks")
		end
	end)
end

--PATH addons/____sam/lua/sam/command/arguments/map.lua:
if SAM_LOADED then return end

local sam, command = sam, sam.command

command.new_argument("map")
	:OnExecute(function(argument, input, ply, _, result)
		local map_name = sam.is_valid_map(input)
		if not map_name and not (argument.optional and input == "None") then
			ply:sam_send_message("invalid", {
				S = "map", S_2 = input
			})
			return false
		end

		table.insert(result, map_name)
	end)

	:Menu(function(set_result, _, buttons, argument)
		local maps = buttons:Add("SAM.ComboBox")
		maps:SetTall(25)

		if argument.optional then
			maps:AddChoice("None", nil, true)
		end

		for _, map_name in ipairs(sam.get_global("Maps", {})) do
			if not (argument.exclude_current and map_name == game.GetMap()) then
				maps:AddChoice(map_name)
			end
		end

		function maps:OnSelect(_, value)
			set_result(value)
		end

		local value = argument.optional and "None" or maps:GetOptionText(1)
		maps:SetValue(value)
		maps:OnSelect(nil, value)

		return maps
	end)

	:AutoComplete(function(_, result, name)
		for _, map_name in ipairs(sam.get_global("Maps", {})) do
			if map_name:lower():find(name, 1, true) then
				table.insert(result, map_name)
			end
		end
	end)
:End()

--PATH addons/____sam/lua/sam/command/arguments/number.lua:
if SAM_LOADED then return end

local sam, command = sam, sam.command

local get_number = function(argument, input, gsub)
	if (input == "" or input == nil) and argument.optional then
		if argument.default ~= nil then
			return argument.default
		end
		return ""
	end

	local number = tonumber(input)
	if gsub ~= false and not isnumber(number) then
		number = tonumber(input:gsub("%D", ""), 10 /*gsub returns two args*/)
	end

	return number
end

command.new_argument("number")
	:OnExecute(function(argument, input, ply, _, result, i)
		local number = get_number(argument, input)
		if number == "" then
			result[i] = nil
		elseif not number then
			ply:sam_send_message("invalid", {
				S = argument.hint or "number", S_2 = input
			})
			return false
		else
			if argument.min then
				number = math.max(number, argument.min)
			end

			if argument.max then
				number = math.min(number, argument.max)
			end

			if argument.round then
				number = math.Round(number)
			end

			result[i] = number
		end
	end)
	:Menu(function(set_result, body, buttons, argument)
		local number_entry = buttons:Add("SAM.TextEntry")
		number_entry:SetUpdateOnType(true)
		number_entry:SetNumeric(true)
		number_entry:SetTall(25)

		number_entry:SetCheck(function(number)
			number = get_number(argument, number, false)
			set_result(number)
			return number or false
		end)

		local hint = argument.hint or "number"
		if argument.default then
			hint = hint .. " = " .. tostring(argument.default)
		end
		number_entry:SetPlaceholder(hint)

		return number_entry
	end)
:End()
--PATH addons/____sam/lua/sam/command/arguments/player.lua:
if SAM_LOADED then return end

local sam, command = sam, sam.command

local can_target_player = function(arg, admin, target, cmd, input)
	if not IsValid(target) or not target:IsPlayer() or not target:sam_get_nwvar("is_authed") then
		if input then
			admin:sam_send_message("cant_find_target", {
				S = input
			})
		end
		return false
	end

	if not arg.allow_higher_target and not admin:CanTarget(target) then
		if cmd then
			admin:sam_send_message("cant_target_player", {
				S = target:Name()
			})
		end
		return false
	end

	if arg.cant_target_self and admin == target then
		if cmd then
			admin:sam_send_message("cant_target_self", {
				S = cmd.name
			})
		end
		return false
	end

	return true
end

local check_text_match = function(text, ply)
	if ply:Name():lower():find(text, 1, true) then return true end
	if ply:GetUserGroup():lower():find(text, 1, true) then return true end
	if team.GetName(ply:Team()):lower():find(text, 1, true) then return true end

	if not ply:IsBot() then
		return ply:SteamID():lower():find(text, 1, true) or ply:SteamID64():lower():find(text, 1, true)
	end

	return false
end

command.new_argument("player")
	:OnExecute(function(arg, input, ply, cmd, result, n)
		if input == nil and arg.optional then
			if sam.isconsole(ply) then
				ply:sam_send_message("cant_target_self", {
					S = cmd.name
				})
				return false
			end
			result[n] = {ply, admin = ply, input = input}
			return
		end

		local single_target = arg.single_target
		local targets = {admin = ply, input = input}

		if input == "*" then
			if single_target then
				ply:sam_send_message("cant_target_multi_players")
				return false
			end
			local players = player.GetAll()
			for i = 1, #players do
				local v = players[i]
				if can_target_player(arg, ply, v) then
					table.insert(targets, v)
				end
			end
		elseif input:sub(1, 1) == "#" and not single_target then
			local tmp = {}
			for _, v in ipairs(input:sub(2):Trim():Split(",")) do
				v = tonumber(v)
				if not sam.isnumber(v) then continue end
				local target = Entity(v)
				if not tmp[target] and IsValid(target) and target:IsPlayer() then
					tmp[target] = true
					if can_target_player(arg, ply, target) then
						table.insert(targets, target)
					end
				end
			end
		else
			local target
			if input == "^" then
				target = ply
			elseif input == "@" and not sam.isconsole(ply) then
				target = ply:GetEyeTrace().Entity
			elseif sam.is_steamid(input) then
				target = player.GetBySteamID(input)
			elseif sam.is_steamid64(input) then
				target = player.GetBySteamID64(input)
			elseif input:sub(1, 1) == "#" then
				local index = input:sub(2):Trim()
				index = tonumber(index)

				if not isnumber(index) then
					ply:sam_send_message("invalid_id", {
						S = input
					})
					return false
				end

				target = Entity(index)

				if not IsValid(target) or not target:IsPlayer() then
					ply:sam_send_message("player_id_not_found", {
						S = index
					})
					return false
				end
			else
				if input:sub(1, 1) == "%" and #input > 1 then
					input = input:sub(2)
				end

				target = sam.player.find_by_name(input)
				if sam.istable(target) then
					if single_target then
						ply:sam_send_message("found_multi_players", {T = target})
						return false
					else
						for k, v in ipairs(target) do
							if can_target_player(arg, ply, v) then
								table.insert(targets, v)
							end
						end
						goto _end
					end
				end
			end

			if not can_target_player(arg, ply, target, cmd, input) then
				return false
			end

			table.insert(targets, target)
		end

		::_end::

		if #targets == 0 then
			ply:sam_send_message("cant_find_target", {
				S = input
			})
			return false
		end
		result[n] = targets
	end)

	-- Do NOT ask me about this code at all please because I feel shit about it but I'm not gonna make
	-- a file specially for this one
	:Menu(function(set_result, body, buttons, argument, childs)
		if body.ply_list then
			local ply_list = body.ply_list
			ply_list.argument = argument
			ply_list.set_result = set_result
			ply_list.multi_select = argument.single_target ~= true

			if argument.single_target == true and #ply_list:GetSelected() > 1 then
				ply_list:ClearSelection()
			end

			ply_list:OnRowSelected()
			ply_list:GetParent():Show()

			return
		end

		local SUI = sam.SUI

		local SetVisible = FindMetaTable("Panel").SetVisible

		local left_body = body:Add("SAM.Panel")
		left_body:Dock(LEFT)
		left_body:DockMargin(0, 0, 5, 0)
		left_body:SetWide(0)
		left_body.no_remove = true
		left_body.no_change = "player"

		SetVisible(left_body, false)
		left_body.SetVisible = function(s, visible)
			if visible == s:IsVisible() or visible == s.visible_state then return end

			if visible then
				SetVisible(s, true)
				s:InvalidateLayout(true)
			end

			s.visible_state = visible
			s:Stop()

			s:SizeTo(visible and SUI.Scale(320) or 0, -1, 0.2, 0, 0, function()
				SetVisible(s, visible)
				s:InvalidateParent(true)
			end)
		end
		left_body:Show()

		table.insert(childs, left_body)

		local ply_list = left_body:Add("SAM.ScrollPanel")
		ply_list:Dock(FILL)
		ply_list:Background(Color(34, 34, 34), 3)
		ply_list.argument = argument
		ply_list.set_result = set_result
		ply_list.multi_select = argument.single_target ~= true
		ply_list.Paint = function(s, w, h)
			s:RoundedBox("Background", 3, 0, 0, w, h, SUI.GetColor("text_entry_bg"))
		end

		local lines = {}
		function ply_list:OnClickLine(line, clear)
			local multi_select = ply_list.multi_select
			if not multi_select and not clear then return end

			if multi_select and input.IsKeyDown(KEY_LCONTROL) then
				if line.Selected then
					line.Selected = false
					self.main_selected_line = nil
					self:OnRowSelected()
					return
				end
				clear = false
			end

			if multi_select and input.IsKeyDown(KEY_LSHIFT) then
				local selected = self:GetSelectedLine()
				if selected then
					self.main_selected_line = self.main_selected_line or selected

					if clear then
						self:ClearSelection()
					end

					local first = math.min(self.main_selected_line.id, line.id)
					local last = math.max(self.main_selected_line.id, line.id)

					for id = first, last do
						local line_2 = lines[id]
						local was_selected = line_2.Selected

						line_2.Selected = true

						if not was_selected then
							self:OnRowSelected(line_2.id, line_2)
						end
					end

					return
				end
			end

			if not multi_select or clear then
				self:ClearSelection()
			end

			line.Selected = true

			self.main_selected_line = line
			self:OnRowSelected(line.id, line)
		end

		function ply_list:GetSelected()
			local ret = {}
			for _, v in ipairs(lines) do
				if v.Selected then
					table.insert(ret, v)
				end
			end
			return ret
		end

		function ply_list:GetSelectedLine()
			for _, line in ipairs(lines) do
				if line.Selected then return line end
			end
		end

		function ply_list:ClearSelection()
			for _, line in ipairs(lines) do
				line.Selected = false
			end
			self:OnRowSelected()
		end

		function ply_list:OnRowSelected()
			local plys = {}
			for k, v in ipairs(ply_list:GetSelected()) do
				plys[k] = v.ply:EntIndex()
			end
			if #plys == 0 then
				self.set_result(nil)
			else
				self.set_result("#" .. table.concat(plys, ","))
			end
		end

		function ply_list:OnRowRightClick(_, line)
			local dmenu = vgui.Create("SAM.Menu")
			dmenu:SetInternal(line)

			local name = line.ply:Name()
			dmenu:AddOption("Copy Name", function()
				SetClipboardText(name)
			end)

			dmenu:AddSpacer()

			local steamid = line.ply:SteamID()
			dmenu:AddOption("Copy SteamID", function()
				SetClipboardText(steamid)
			end)

			dmenu:AddOption("Copy SteamID64", function()
				SetClipboardText(util.SteamIDTo64(steamid))
			end)

			dmenu:Open()
			dmenu:SetPos(input.GetCursorPos())
		end

		local item_click = function(s)
			ply_list:OnClickLine(s, true)
		end

		local item_rightclick = function(s)
			if not s.Selected then
				ply_list:OnClickLine(s, true)
			end
			ply_list:OnRowRightClick(s.id, s)
		end

		local item_cursor = function(s)
			if input.IsMouseDown(MOUSE_LEFT) then
				ply_list:OnClickLine(s)
			end
		end

		local added_players = {}

		local add_player = function(ply, i)
			if can_target_player(ply_list.argument, LocalPlayer(), ply) then
				local player_button = ply_list:Add("SAM.Button")
				player_button:Dock(TOP)
				player_button:DockMargin(0, 0, 0, 2)
				player_button:DockPadding(4, 4, 4, 4)
				player_button:SetContained(false)
				player_button:SetText("")
				player_button:SetZPos(i)
				player_button.DoClick = item_click
				player_button.DoRightClick = item_rightclick
				player_button.OnCursorMoved = item_cursor

				local line = player_button:Add("SAM.PlayerLine")
				line:SetMouseInputEnabled(false)
				line:SetInfo({
					steamid = ply:IsBot() and "BOT" or ply:SteamID(),
					name = ply:Name(),
					rank = ply:GetUserGroup()
				})

				player_button:InvalidateLayout(true)
				player_button:SizeToChildren(false, true)

				player_button.ply = ply
				player_button.line = line
				player_button.id = table.insert(lines, player_button)
				body.search_entry:OnValueChange()

				added_players[ply] = true
			end
		end

		ply_list:On("Think", function()
			local players = player.GetAll()
			for i = 1, #players do
				local ply = players[i]
				if not added_players[ply] then
					add_player(ply, i)
				end
			end

			local argument = ply_list.argument
			for i = 1, #lines do
				local line = lines[i]
				local ply = line.ply

				if not can_target_player(argument, LocalPlayer(), ply) then
					line:Remove()
					table.remove(lines, i)
					added_players[ply] = nil
					ply_list:OnRowSelected()
					break
				end

				line = line.line
				line:SetName(ply:Name())
				line:SetRank(ply:GetUserGroup())
			end
		end)

		local search_entry = left_body:Add("SAM.TextEntry")
		search_entry:Dock(TOP)
		search_entry:DockMargin(0, 0, 0, 5)
		search_entry:SetPlaceholder("Search... (name/steamid/rank/job)")
		search_entry:SetBackground(Color(34, 34, 34))
		search_entry:SetTall(25)
		search_entry:SetNoBar(true)

		function search_entry:OnValueChange(text)
			if text == nil then
				text = self:GetValue()
			end
			if text ~= "" then
				ply_list:ClearSelection()
			end
			text = text:lower()
			for i, line in ipairs(lines) do
				local ply = line.ply
				if IsValid(ply) then
					line:SetVisible(check_text_match(text, ply))
				end
			end
			ply_list:GetCanvas():InvalidateLayout(true)
		end

		body.ply_list = ply_list
		body.search_entry = search_entry
	end)

	:AutoComplete(function(arg, result, name)
		local ply = LocalPlayer()
		for k, v in ipairs(player.GetAll()) do
			if can_target_player(arg, ply, v) and v:Name():lower():find(name, 1, true) then
				table.insert(result, "%" .. v:Name())
			end
		end
	end)
:End()

--PATH addons/____sam/lua/sam/command/arguments/steamid.lua:
if SAM_LOADED then return end

local sam, command = sam, sam.command

local cached_ranks = {}
local targeting_offline = {}

local check_steamid = function(steamid)
	if not sam.is_steamid(steamid) then
		if sam.is_steamid64(steamid) then
			return util.SteamIDFrom64(steamid)
		else
			return nil
		end
	end

	return steamid
end

local can_target_steamid_callback = function(data, promise)
	local ply, steamid = promise.ply, promise.steamid

	if not data or sam.ranks.can_target(promise.rank, data.rank) then
		promise:resolve({steamid})
	elseif IsValid(ply) then
		ply:sam_send_message("cant_target_player", {
			S = steamid
		})
	end

	targeting_offline[ply] = nil
	cached_ranks[steamid] = data ~= nil and data or false
end

command.new_argument("steamid")
	:OnExecute(function(argument, input, ply, _, result, i)
		local steamid = check_steamid(input)
		if not steamid then
			ply:sam_send_message("invalid", {
				S = "steamid/steamid64", S_2 = input
			})
			return false
		end

		if argument.allow_higher_target then
			result[i] = steamid
			return
		end

		local promise = sam.Promise.new()
		promise.ply = ply
		promise.rank = ply:GetUserGroup()
		promise.steamid = steamid

		local target = player.GetBySteamID(steamid)
		if sam.isconsole(ply) then
			promise:resolve({steamid})
		elseif target then
			if ply:CanTarget(target) then
				promise:resolve({steamid, target})
			else
				ply:sam_send_message("cant_target_player", {
					S = steamid
				})
			end
		elseif cached_ranks[steamid] ~= nil then
			can_target_steamid_callback(cached_ranks[steamid], promise)
		else
			targeting_offline[ply] = true

			sam.SQL.FQuery([[
				SELECT
					`rank`
				FROM
					`sam_players`
				WHERE
					`steamid` = {1}
			]], {steamid}, can_target_steamid_callback, true, promise)
		end

		result[i] = promise
	end)
	:Menu(function(set_result, body, buttons, argument)
		local steamid_entry = buttons:Add("SAM.TextEntry")
		steamid_entry:SetTall(25)
		steamid_entry:SetUpdateOnType(true)
		steamid_entry:SetPlaceholder("steamid/steamid64")

		steamid_entry:SetCheck(function(steamid)
			steamid = check_steamid(steamid)
			set_result(steamid)
			return steamid or false
		end)

		return steamid_entry
	end)
:End()

timer.Create("SAM.ClearCachedRanks", 60 * 2.5, 0, function()
	table.Empty(cached_ranks)
end)

hook.Add("SAM.ChangedSteamIDRank", "RemoveIfCached", function(steamid)
	cached_ranks[steamid] = nil
end)

hook.Add("SAM.CanRunCommand", "StopIfTargetingOffline", function(ply)
	if targeting_offline[ply] then
		return false
	end
end)

--PATH addons/____sam/lua/sam/sh_restrictions.lua:
if SAM_LOADED then return end

local loaded = false
local load_restrictions = function()
	local sam = sam
	local config = sam.config
	local hook = hook
	local SERVER = SERVER

	if CLIENT then
		local add_setting = function(body, title, key)
			local setting = body:Add("SAM.LabelPanel")
			setting:Dock(TOP)
			setting:SetLabel(title)

			local enable = setting:Add("SAM.ToggleButton")
			enable:SetConfig(key, true)

			return setting
		end

		config.add_menu_setting("Restrictions", function(body)
			local setting = body:Add("SAM.LabelPanel")
			setting:Dock(TOP)
			setting:DockMargin(8, 6, 8, 0)
			setting:SetLabel("Restrictions (Check these settings in ranks' permissions)")

			local setting_body = body:Add("Panel")
			setting_body:Dock(TOP)
			setting_body:DockMargin(8, 6, 8, 0)
			setting_body:DockPadding(8, 0, 8, 0)

			add_setting(setting_body, "Tool (Eg. using button tool)", "Restrictions.Tool")
			add_setting(setting_body, "Spawning (Eg. spawning props)", "Restrictions.Spawning")
			add_setting(setting_body, "Limits (Eg. how many props can you spawn)", "Restrictions.Limits")

			function setting_body:PerformLayout()
				setting_body:SizeToChildren(false, true)
			end
		end)
	end

	local tools = weapons.GetStored("gmod_tool")
	if sam.istable(tools) then
		if config.get("Restrictions.Tool", true) then
			for k, v in pairs(tools.Tool) do
				sam.permissions.add(v.Mode, "Tools - " .. (v.Category or "Other"), "user")
			end

			hook.Add("CanTool", "SAM.Module.Restrictions", function(ply, _, tool)
				if not ply:HasPermission(tool) then
					if CLIENT and sam.player.check_cooldown(ply, "ToolNoPermission", 0.1) then
						ply:sam_send_message("You don't have permission to use this tool.")
					end
					return false
				end
			end)
		else
			for k, v in pairs(tools.Tool) do
				sam.permissions.remove(v.Mode)
			end

			hook.Remove("CanTool", "SAM.Module.Restrictions")
		end
	end

	sam.permissions.add("admin_weapons", "Spawning", "superadmin")

	local function no_permission(ply, name)
		ply:sam_play_sound("buttons/button10.wav")
		ply:sam_send_message("You don't have permission to spawn {S Blue}.", {
			S = name
		})
	end

	local spawning = {
		PlayerSpawnProp = {
			name = "props",
			permission = "user",
			call_gm = true,
		},
		PlayerGiveSWEP = {
			name = "give_weapons",
			cb = function(_, ply, _, wep)
				if wep.sam_AdminOnly and not ply:HasPermission("admin_weapons") then
					no_permission(ply, "admin weapons")
					return false
				end
				return true
			end,
			hook = sam.hook_first,
		},
		PlayerSpawnSWEP = {
			name = "spawn_weapons",
			cb = function(_, ply, _, wep)
				if wep.sam_AdminOnly and not ply:HasPermission("admin_weapons") then
					no_permission(ply, "admin weapons")
					return false
				end
				return true
			end,
			hook = sam.hook_first,
		},
		PlayerSpawnSENT = {
			name = "entities",
			check_limit = "sents"
		},
		PlayerSpawnNPC = {
			name = "npcs",
			check_limit = "npcs",
		},
		PlayerSpawnVehicle = {
			name = "vehicles",
			check_limit = "vehicles",
		},
		PlayerSpawnRagdoll = {
			name = "ragdolls",
			permission = "user",
			check_limit = "ragdolls",
		}
	}

	local override_lists = {
		"Weapon",
		-- "SpawnableEntities"
	}

	local function LimitReachedProcess(ply, str)
		if not IsValid(ply) then return true end
		return ply:CheckLimit(str)
	end

	local GAMEMODE = GAMEMODE
	if config.get("Restrictions.Spawning", true) then
		for k, v in pairs(spawning) do
			local name = v
			local permission = "superadmin"
			local check
			local check_limit
			local hook = sam.hook_last
			if istable(v) then
				name = v.name
				permission = v.permission or permission
				if v.call_gm then
					check = GAMEMODE[k]
				elseif v.cb then
					check = v.cb
				end
				hook = v.hook or hook
				check_limit = v.check_limit
			end

			sam.permissions.add(name, "Spawning", permission)

			if SERVER then
				hook(k, "SAM.Spawning." .. k .. name, function(ply, ...)
					if not ply:HasPermission(name) then
						no_permission(ply, name)
						return false
					end

					if check_limit then
						return LimitReachedProcess(ply, check_limit)
					end

					if check then
						return check(GAMEMODE, ply, ...)
					end

					return true
				end)
			end
		end

		for i = 1, #override_lists do
			for k, v in pairs(list.GetForEdit(override_lists[i])) do
				v.sam_AdminOnly = v.sam_AdminOnly or v.AdminOnly
				v.AdminOnly = false
			end
		end
	else
		sam.permissions.add("admin_weapons")

		for k, v in pairs(spawning) do
			sam.permissions.remove(istable(v) and v.name or v)

			if SERVER then
				hook.Remove(k, "SAM.Spawning." .. k)
			end
		end

		for i = 1, #override_lists do
			for k, v in pairs(list.GetForEdit(override_lists[i])) do
				if v.sam_AdminOnly then
					v.AdminOnly = v.sam_AdminOnly
				end
			end
		end
	end

	local PLAYER = FindMetaTable("Player")
	if config.get("Restrictions.Limits", true) then
		local get_limit = sam.ranks.get_limit
		function PLAYER:GetLimit(limit_type)
			return get_limit(self:GetUserGroup(), limit_type)
		end

		sam.hook_first("PlayerCheckLimit", "SAM.PlayerCheckLimit", function(ply, limit_type, count)
			local ply_limit = ply:GetLimit(limit_type)
			if ply_limit < 0 then return true end

			if count > ply_limit - 1 then
				return false
			end

			return true
		end)

		sam.limit_types = {}
		for _, limit_type in SortedPairs(cleanup.GetTable(), true) do
			local cvar = GetConVar("sbox_max" .. limit_type)
			if cvar then
				table.insert(sam.limit_types, limit_type)
			end
		end
	else
		sam.limit_types = nil
		PLAYER.GetLimit = nil
		hook.Remove("PlayerCheckLimit", "SAM.PlayerCheckLimit")
	end

	if not loaded then
		loaded = true
		hook.Call("SAM.LoadedRestrictions")
	end
end

timer.Simple(5, function()
	if true then
		sam.config.hook({"Restrictions.Tool", "Restrictions.Spawning", "Restrictions.Limits"}, load_restrictions)
	end
end)

--PATH addons/____sui/lua/sui/vgui/sui_text_entry.lua:
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

sui.scaling_functions(Panel)

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
	self:ScaleInit()

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

	self:OnScaleChange()
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

function Panel:OnScaleChange()
	self:InvalidateLayout()
	self:InvalidateLayout(true)
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
			self:RoundedBox("Bar2", 0, (w * 0.5) - (bar * 0.5), h - 1, bar, 1, bar_color or text_entry_3)
		end
	end
end

-- https://github.com/ValveSoftware/source-sdk-2013/blob/0d8dceea4310fde5706b3ce1c70609d72a38efdf/mp/src/vgui2/vgui_controls/TextEntry.cpp#L969
function Panel:GetNumLines(wide)
	local num_lines = 1

	wide = wide or self:GetWide() - 2

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

--PATH addons/____sam/lua/sam/menu/tabs/ranks.lua:
if SAM_LOADED then return end
if SERVER then return end

local sam = sam
local SUI = sam.SUI

local GetColor = SUI.GetColor
local Line = sui.TDLib.LibClasses.Line
local AnimatedSetVisible = sui.TDLib.LibClasses.AnimatedSetVisible

local RANK_NAME = SUI.CreateFont("RankName", "Roboto Bold", 18)
local RANK_INFO = SUI.CreateFont("RankInfo", "Roboto Medium", 12)

local CREATE_RANK = SUI.CreateFont("CreateRank", "Roboto Bold", 16, 200)
local RANK_TITLE = SUI.CreateFont("RankTitle", "Roboto Bold", 20)

local rank_menu = function(rank, data)
	local valid = sui.valid_options()

	local imm, banlim
	if rank then
		imm, banlim = data.immunity, data.ban_limit
	end

	local edit_rank = vgui.Create("SAM.QueryBox")
	edit_rank:SetWide(470)
	edit_rank:SetTitle(rank and string.format("Edit Rank '%s'", rank) or "Create Rank")

	local new_name = rank
	if not sam.ranks.is_default_rank(rank) then
		local name = edit_rank:Add("SAM.LabelPanel")
		name:SetLabel("Rank Name")

		local entry = name:Add("SAM.TextEntry")
		entry:SetSize(210, 28)
		entry:SetNoBar(false)
		entry:SetPlaceholder("")
		entry:SetValue(rank or "")
		entry:SetCheck(function(_name)
			new_name = _name

			if _name == rank then return end
			if _name == "" or sam.ranks.is_rank(_name) then
				return false
			end
		end)

		valid.Add(entry)
	end

	local new_immunity = imm
	do
		local immunity = edit_rank:Add("SAM.LabelPanel")
		immunity:SetLabel("Immunity (2~99)")
		immunity:DockMargin(0, 5, 0, 0)

		local entry = immunity:Add("SAM.TextEntry")
		entry:SetSize(210, 28)
		entry:SetNumeric(true)
		entry:DisallowFloats(true)
		entry:DisallowNegative(true)
		entry:SetPlaceholder("")
		entry:SetValue(imm or "2")
		entry:SetCheck(function(_immunity)
			new_immunity = _immunity

			if _immunity == "" then
				return false
			end

			_immunity = tonumber(_immunity)
			new_immunity = _immunity
			if _immunity < 2 or _immunity > 99 then
				return false
			end
		end)

		valid.Add(entry)
	end

	local new_banlimit = banlim
	do
		local banlimit = edit_rank:Add("SAM.LabelPanel")
		banlimit:SetLabel("Ban Limit (1y 1mo 1w 1d 1h 1m)")
		banlimit:DockMargin(0, 5, 0, 0)

		local entry = banlimit:Add("SAM.TextEntry")
		entry:SetSize(210, 28)
		entry:SetNoBar(false)
		entry:SetPlaceholder("")
		entry:SetValue(banlim and sam.reverse_parse_length(banlim) or "2w")
		entry:SetCheck(function(_banlimit)
			new_banlimit = sam.parse_length(_banlimit)
			if not new_banlimit and _banlimit ~= banlim then
				return false
			end
		end)

		valid.Add(entry)
	end

	local inherit = rank and sam.ranks.get_rank(rank).inherit or "user"
	local new_inherit = inherit
	do
		local inherits_from = edit_rank:Add("SAM.LabelPanel")
		inherits_from:SetLabel("Inherits From")
		inherits_from:DockMargin(0, 5, 0, 0)

		local entry = inherits_from:Add("SAM.ComboBox")
		entry:SetSize(210, 28)
		entry:SetValue(inherit)

		for name in SortedPairsByMemberValue(sam.ranks.get_ranks(), "immunity", true) do
			if name ~= rank and not sam.ranks.inherits_from(name, rank) then
				entry:AddChoice(name)
			end
		end

		function entry:OnSelect(_, value)
			new_inherit = value
		end
	end


	edit_rank:Done()
	edit_rank.save:SetEnabled(true)
	edit_rank.save:SetText("SAVE")

	if rank then
		edit_rank:SetCallback(function()
			local to_run = {}

			if new_immunity ~= imm then
				table.insert(to_run, {"changerankimmunity", rank, new_immunity})
			end

			if new_banlimit ~= banlim then
				table.insert(to_run, {"changerankbanlimit", rank, new_banlimit})
			end

			if new_inherit ~= inherit then
				table.insert(to_run, {"changeinherit", rank, new_inherit})
			end

			if new_name ~= rank then
				table.insert(to_run, {"renamerank", rank, new_name})
			end
			sam.command.run_commands(to_run)
		end)
	else
		edit_rank:SetCallback(function()
			RunConsoleCommand("sam", "addrank", new_name, new_inherit, new_immunity, new_banlimit)
		end)
	end

	function edit_rank.save:Think()
		self:SetEnabled(valid.IsValid())
	end
end

sam.menu.add_tab("https://raw.githubusercontent.com/Srlion/Addons-Data/main/icons/sam/military_rank.png", function(column_sheet)
	local current_rank

	local parent = column_sheet:Add("Panel")
	parent:Dock(FILL)
	parent:DockMargin(0, 1, 0, 0)

	local title = parent:Add("SAM.Label")
	title:Dock(TOP)
	title:DockMargin(10, 10, 0, 0)
	title:SetFont(SAM_TAB_TITLE_FONT)
	title:SetText("Ranks")
	title:SetTextColor(GetColor("menu_tabs_title"))
	title:SizeToContents()

	local total = parent:Add("SAM.Label")
	total:Dock(TOP)
	total:DockMargin(10, 6, 0, 0)
	total:SetFont(SAM_TAB_DESC_FONT)
	total:SetText(table.Count(sam.ranks.get_ranks()) .. " total ranks")
	total:SetTextColor(GetColor("menu_tabs_title"))
	total:SizeToContents()

	local search_entry
	do
		local container = parent:Add("SAM.Panel")
		container:Dock(TOP)
		container:DockMargin(10, 6, 10, SUI.Scale(15))
		container:SetTall(30)

		search_entry = container:Add("SAM.TextEntry")
		search_entry:Dock(LEFT)
		search_entry:SetNoBar(true)
		search_entry:SetPlaceholder("Search...")
		search_entry:SetRadius(4)
		search_entry:SetWide(220)
	end

	local create_rank = parent:Add("SAM.Button")
	create_rank:SetFont(CREATE_RANK)
	create_rank:SetText("Create Rank")
	create_rank:Dock(BOTTOM)
	create_rank:DockMargin(10, 0, 10, 10)

	create_rank:On("DoClick", function()
		rank_menu()
	end)

	local right_body = parent:Add("Panel")
	right_body:Dock(RIGHT)
	right_body:DockMargin(0, 5, 10, 10)
	right_body:SetWide(0)
	right_body:SetZPos(-1)

	local rank_title = right_body:Add("SAM.Label")
	rank_title:Dock(TOP)
	rank_title:DockMargin(0, 0, 0, 5)
	rank_title:SetFont(RANK_TITLE)
	rank_title:SetTextColor(GetColor("menu_tabs_title"))

	local permissions_body = right_body:Add("SAM.CollapseCategory")
	permissions_body:Dock(FILL)
	permissions_body:GetCanvas():DockPadding(0, 0, 5, 0)

	local function refresh_access()
		if not IsValid(current_rank) then return end

		for k, v in ipairs(permissions_body.items) do
			AnimatedSetVisible(v.img, sam.ranks.has_permission(current_rank.name, v.name))
		end
	end

	for k, v in ipairs({"SAM.ChangedInheritRank", "SAM.RankPermissionGiven", "SAM.RankPermissionTaken"}) do
		hook.Add(v, "SAM.Menu.RefreshPermissions ", refresh_access)
	end

	local function refresh_permissions()
		permissions_body:GetCanvas():Clear()
		table.Empty(permissions_body.items)
		table.Empty(permissions_body.categories)

		local item_click = function(s)
			local rank = current_rank.name
			if not sam.ranks.has_permission(rank, s.name) then
				RunConsoleCommand("sam", "givepermission", rank, s.name)
			else
				RunConsoleCommand("sam", "takepermission", rank, s.name)
			end
		end

		for k, v in ipairs(sam.permissions.get()) do
			local item = permissions_body:add_item(v.name, v.category)
			item:SetContentAlignment(4)
			item:SetTextInset(6, 0)
			item:SizeToContentsY(SUI.Scale(10))
			item:SetZPos(k)
			item.name = v.name
			item.DoClick = item_click

			local img = item:Add("SAM.Image")
			img:Dock(RIGHT)
			img:DockMargin(4, 4, 4, 4)
			img:InvalidateParent(true)
			img:SetWide(img:GetTall())
			img:SetImageColor(Color(52, 161, 224))
			img:SetImage("https://raw.githubusercontent.com/Srlion/Addons-Data/main/icons/sam/check_mark.png")

			item.img = img
		end
	end

	local limits_body

	do
		local permissions_search = right_body:Add("SAM.TextEntry")
		permissions_search:Dock(TOP)
		permissions_search:DockMargin(0, 0, 5, 10)
		permissions_search:SetNoBar(true)
		permissions_search:SetPlaceholder("Search...")
		permissions_search:SetRadius(4)
		permissions_search:SetTall(30)

		function permissions_search:OnValueChange(text)
			if limits_body and limits_body:IsVisible() then
				local children = limits_body:GetCanvas():GetChildren()
				for k, v in ipairs(children) do
					v:AnimatedSetVisible(v.title:find(text, nil, true) ~= nil)
				end
				limits_body:InvalidateLayout(true)
			else
				permissions_body:Search(text:lower())
			end
		end

		Line(right_body):SetZPos(2)
	end

	local function load_limits()
		if sam.limit_types then
			if limits_body then return end
		else
			if limits_body then
				limits_body:SetVisible(false)
				permissions_body:AnimatedSetVisible(true)
				limits_body:Remove()
				limits_body = nil
			end
			return
		end

		limits_body = right_body:Add("SAM.ScrollPanel")
		limits_body:Dock(FILL)
		limits_body:GetCanvas():DockPadding(0, 0, 5, 0)
		limits_body:SetVisible(false)

		local item_enter = function(s)
			if not IsValid(current_rank) then return end

			local rank = current_rank.name

			local limit = math.Clamp(s:GetValue(), -1, 1000)
			if limit ~= sam.ranks.get_limit(rank, s.limit_type) then
				RunConsoleCommand("sam", "changeranklimit", rank, s.limit_type, limit)
			else
				s:SetText(tostring(sam.ranks.get_limit(rank, s.limit_type)))
			end
		end

		local not_empty = function(s)
			return s and s ~= ""
		end

		local limit_values = {}
		for k, v in ipairs(sam.limit_types) do
			local immunity = limits_body:Add("SAM.LabelPanel")
			immunity:SetLabel(v)
			immunity:DockMargin(5, 0, 0, 5)

			local entry = immunity:Add("SAM.TextEntry")
			entry:SetSize(60, 26)
			entry:SetNumeric(true)
			entry:DisallowFloats(true)
			entry:SetPlaceholder("")
			entry:SetCheck(not_empty)
			entry.limit_type = v
			entry.OnEnter = item_enter

			table.insert(limit_values, entry)
		end

		function limits_body:Refresh()
			if not IsValid(current_rank) then return end

			local rank = current_rank.name
			for k, v in ipairs(limit_values) do
				v:SetValue(tostring(sam.ranks.get_limit(rank, v.limit_type)))
			end
		end

		local right_current_rank = right_body:Add("SAM.Button")
		right_current_rank:Dock(BOTTOM)
		right_current_rank:DockMargin(0, 5, 0, 0)
		right_current_rank:SetFont(CREATE_RANK)
		right_current_rank:SetText("Switch to Limits")
		right_current_rank:On("DoClick", function()
			limits_body:AnimatedToggleVisible()
			permissions_body:AnimatedToggleVisible()

			if permissions_body:AnimatedIsVisible() then
				right_current_rank:SetText("Switch to Limits")
			else
				right_current_rank:SetText("Switch to Permissions")
			end
		end)

		limits_body:On("OnRemove", function()
			right_current_rank:Remove()
		end)
		limits_body:Refresh()
	end

	local function refresh_all()
		timer.Create("SAM.Menu.Ranks.Refresh", 1, 1, function()
			load_limits()
			refresh_permissions()
			refresh_access()
		end)
	end

	sam.config.hook({"Restrictions.Limits"}, refresh_all)

	for k, v in ipairs({"SAM.AddedPermission", "SAM.PermissionModified", "SAM.RemovedPermission"}) do
		hook.Add(v, "SAM.Menu.RefreshPermissions", refresh_all)
	end

	local body = parent:Add("SAM.ScrollPanel")
	body:Dock(FILL)
	body:DockMargin(10, 0, 5, 10)
	body:SetVBarPadding(6)

	body:Line():SetZPos(-101)

	local select_rank = function(s)
		if not IsValid(s) then
			current_rank = nil
			right_body:SizeTo(0, -1, 0.3)
			return
		end

		if IsValid(current_rank) then
			current_rank.Selected = false

			if current_rank == s then
				current_rank = nil
				right_body:SizeTo(0, -1, 0.3)
				return
			end
		end

		s.Selected = true
		current_rank = s
		refresh_access()
		if limits_body then
			limits_body:Refresh()
		end
		right_body:SizeTo(SUI.Scale(300), -1, 0.3)

		rank_title:SetText(s.name)
		rank_title:SizeToContents()
	end

	local ranks = {}

	function search_entry:OnValueChange()
		local value = self:GetValue()
		for k, v in pairs(ranks) do
			local show = k:find(value, nil, true)
			show = show ~= nil
			v.line:AnimatedSetVisible(show)
			v:GetParent():AnimatedSetVisible(show)
		end
	end

	local add_rank = function(rank_name, data)
		if rank_name == "superadmin" then return end
		if not IsValid(body) then return end

		local line = body:Add("SAM.Panel")
		line:Dock(TOP)
		line:DockMargin(0, 0, 0, 10)
		line:SetTall(34)
		line:SetZPos(-data.immunity)
		line:InvalidateLayout(true)

		local container = line:Add("SAM.Button")
		container:Dock(FILL)
		container:DockMargin(0, 0, 5, 0)
		container:DockPadding(5, 5, 0, 5)
		container:SetText("")
		container:SetContained(false)
		container.name = rank_name

		ranks[rank_name] = container

		container:On("DoClick", select_rank)

		function container:DoRightClick()
			rank_name = container.name

			if rank_name == "user" then return end

			local dmenu = vgui.Create("SAM.Menu")
			dmenu:SetSize(w, h)
			dmenu:SetInternal(container)

			dmenu:AddOption("Edit Rank", function()
				rank_menu(rank_name, sam.ranks.get_rank(rank_name))
			end)

			if not sam.ranks.is_default_rank(rank_name) then
				dmenu:AddSpacer()

				dmenu:AddOption("Remove Rank", function()
					local remove_rank = vgui.Create("SAM.QueryBox")
					remove_rank:SetWide(350)

					local check = remove_rank:Add("SAM.Label")
					check:SetText("Are you sure that you want to remove '" .. rank_name .. "'?")
					check:SetFont("SAMLine")
					check:SetWrap(true)
					check:SetAutoStretchVertical(true)

					remove_rank:Done()
					remove_rank.save:SetEnabled(true)
					remove_rank.save:SetText("REMOVE")
					remove_rank.save:SetContained(false)
					remove_rank.save:SetColors(GetColor("query_box_cancel"), GetColor("query_box_cancel_text"))

					remove_rank.cancel:SetContained(true)
					remove_rank.cancel:SetColors()

					remove_rank:SetCallback(function()
						RunConsoleCommand("sam", "removerank", rank_name)
					end)
				end)
			end

			dmenu:Open()
			dmenu:SetPos(input.GetCursorPos())
		end

		do
			local name = container:Add("SAM.Label")
			name:Dock(TOP)
			name:DockMargin(0, 0, 0, 2)
			name:SetTextColor(GetColor("player_list_names"))
			name:SetFont(RANK_NAME)
			name:SetText(rank_name)
			name:SizeToContents()

			local immunity = container:Add("SAM.Label")
			immunity:Dock(TOP)
			immunity:SetTextColor(GetColor("player_list_steamid"))
			immunity:SetFont(RANK_INFO)
			immunity:SetText("Immunity: " .. data.immunity)
			immunity:SizeToContents()

			local banlimit = container:Add("SAM.Label")
			banlimit:Dock(TOP)
			banlimit:SetTextColor(GetColor("player_list_steamid"))
			banlimit:SetFont(RANK_INFO)
			banlimit:SetText("Ban limit: " .. sam.reverse_parse_length(sam.parse_length(data.ban_limit)))
			banlimit:SizeToContents()

			local inherit = container:Add("SAM.Label")
			inherit:Dock(TOP)
			inherit:SetTextColor(GetColor("player_list_steamid"))
			inherit:SetFont(RANK_INFO)
			inherit:SetText("Inherits from: " .. (sam.isstring(data.inherit) and data.inherit or "none"))
			inherit:SizeToContents()
		end

		container:InvalidateLayout(true)
		container:SizeToChildren(false, true)
		line:SizeToChildren(false, true)

		local _line = body:Line()
		_line:SetZPos(-data.immunity)

		container.line = _line
		container.data = data
	end

	for rank_name, v in pairs(sam.ranks.get_ranks()) do
		add_rank(rank_name, v)
	end

	hook.Add("SAM.AddedRank", "SAM.RefreshRanksList", function(name, rank)
		add_rank(name, rank)
	end)

	hook.Add("SAM.RemovedRank", "SAM.RefreshRanksList", function(name)
		local line = ranks[name]
		if not IsValid(line) then return end

		line.line:Remove()
		line:GetParent():Remove()
		ranks[name] = nil

		if line == current_rank then
			select_rank()
		end
	end)

	-- This is just better than caching panels for stuff that ain't gonna be called a lot
	hook.Add("SAM.RankNameChanged", "SAM.RefreshRanksList", function(name, new_name)
		local line = ranks[name]
		if not IsValid(line) then return end

		-- if current_rank == name then
		-- 	rank_name:SetText(new_name)
		-- end

		line:GetChildren()[1]:SetText(new_name)

		ranks[new_name], ranks[name] = line, nil
		line.name = new_name
	end)

	hook.Add("SAM.RankImmunityChanged", "SAM.RefreshRanksList", function(name, immunity)
		local line = ranks[name]
		if not IsValid(line) then return end

		line:GetChildren()[2]:SetText("Immunity: " .. immunity)
		line:GetParent():SetZPos(-immunity)

		-- SetZPos is kinda weird to deal with
		line.line:SetZPos(-immunity + 1)
		line.line:SetZPos(-immunity)
	end)

	hook.Add("SAM.RankBanLimitChanged", "SAM.RefreshRanksList", function(name, new_limit)
		local line = ranks[name]
		if IsValid(line) then
			line:GetChildren()[3]:SetText("Ban limit: " .. sam.reverse_parse_length(new_limit))
		end
	end)

	hook.Add("SAM.ChangedInheritRank", "SAM.RefreshRanksList", function(name, new_inherit)
		local line = ranks[name]
		if IsValid(line) then
			line:GetChildren()[4]:SetText("Inherits from: " .. new_inherit)
		end
	end)

	return parent
end, function()
	return LocalPlayer():HasPermission("manage_ranks")
end, 3)
--PATH addons/____sam/lua/sam/modules/cami.lua:
--[[
CAMI - Common Admin Mod Interface.
Copyright 2020 CAMI Contributors

Makes admin mods intercompatible and provides an abstract privilege interface
for third party addons.

Follows the specification on this page:
https://github.com/glua/CAMI/blob/master/README.md

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]

-- Version number in YearMonthDay format.
local version = 20211019

if CAMI and CAMI.Version >= version then return end

CAMI = CAMI or {}
CAMI.Version = version


--- @class CAMI_USERGROUP
--- defines the charactaristics of a usergroup
--- @field Name string @The name of the usergroup
--- @field Inherits string @The name of the usergroup this usergroup inherits from
--- @field CAMI_Source string @The source specified by the admin mod which registered this usergroup (if any, converted to a string)

--- @class CAMI_PRIVILEGE
--- defines the charactaristics of a privilege
--- @field Name string @The name of the privilege
--- @field MinAccess "'user'" | "'admin'" | "'superadmin'" @Default group that should have this privilege
--- @field Description string | nil @Optional text describing the purpose of the privilege
local CAMI_PRIVILEGE = {}
--- Optional function to check if a player has access to this privilege
--- (and optionally execute it on another player)
---
--- ⚠ **Warning**: This function may not be called by all admin mods
--- @param actor GPlayer @The player
--- @param target GPlayer | nil @Optional - the target
--- @return boolean @If they can or not
--- @return string | nil @Optional reason
function CAMI_PRIVILEGE:HasAccess(actor, target)
end

--- Contains the registered CAMI_USERGROUP usergroup structures.
--- Indexed by usergroup name.
--- @type CAMI_USERGROUP[]
local usergroups = CAMI.GetUsergroups and CAMI.GetUsergroups() or {
    user = {
        Name = "user",
        Inherits = "user",
        CAMI_Source = "Garry's Mod",
    },
    admin = {
        Name = "admin",
        Inherits = "user",
        CAMI_Source = "Garry's Mod",
    },
    superadmin = {
        Name = "superadmin",
        Inherits = "admin",
        CAMI_Source = "Garry's Mod",
    }
}

--- Contains the registered CAMI_PRIVILEGE privilege structures.
--- Indexed by privilege name.
--- @type CAMI_PRIVILEGE[]
local privileges = CAMI.GetPrivileges and CAMI.GetPrivileges() or {}

--- Registers a usergroup with CAMI.
---
--- Use the source parameter to make sure CAMI.RegisterUsergroup function and
--- the CAMI.OnUsergroupRegistered hook don't cause an infinite loop
--- @param usergroup CAMI_USERGROUP @The structure for the usergroup you want to register
--- @param source any @Identifier for your own admin mod. Can be anything.
--- @return CAMI_USERGROUP @The usergroup given as an argument
function CAMI.RegisterUsergroup(usergroup, source)
    if source then
        usergroup.CAMI_Source = tostring(source)
    end
    usergroups[usergroup.Name] = usergroup

    hook.Call("CAMI.OnUsergroupRegistered", nil, usergroup, source)
    return usergroup
end

--- Unregisters a usergroup from CAMI. This will call a hook that will notify
--- all other admin mods of the removal.
---
--- ⚠ **Warning**: Call only when the usergroup is to be permanently removed.
---
--- Use the source parameter to make sure CAMI.UnregisterUsergroup function and
--- the CAMI.OnUsergroupUnregistered hook don't cause an infinite loop
--- @param usergroupName string @The name of the usergroup.
--- @param source any @Identifier for your own admin mod. Can be anything.
--- @return boolean @Whether the unregistering succeeded.
function CAMI.UnregisterUsergroup(usergroupName, source)
    if not usergroups[usergroupName] then return false end

    local usergroup = usergroups[usergroupName]
    usergroups[usergroupName] = nil

    hook.Call("CAMI.OnUsergroupUnregistered", nil, usergroup, source)

    return true
end

--- Retrieves all registered usergroups.
--- @return CAMI_USERGROUP[] @Usergroups indexed by their names.
function CAMI.GetUsergroups()
    return usergroups
end

--- Receives information about a usergroup.
--- @param usergroupName string
--- @return CAMI_USERGROUP | nil @Returns nil when the usergroup does not exist.
function CAMI.GetUsergroup(usergroupName)
    return usergroups[usergroupName]
end

--- Checks to see if potentialAncestor is an ancestor of usergroupName.
--- All usergroups are ancestors of themselves.
---
--- Examples:
--- * `user` is an ancestor of `admin` and also `superadmin`
--- * `admin` is an ancestor of `superadmin`, but not `user`
--- @param usergroupName string @The usergroup to query
--- @param potentialAncestor string @The ancestor to query
--- @return boolean @Whether usergroupName inherits potentialAncestor.
function CAMI.UsergroupInherits(usergroupName, potentialAncestor)
    repeat
        if usergroupName == potentialAncestor then return true end

        usergroupName = usergroups[usergroupName] and
                         usergroups[usergroupName].Inherits or
                         usergroupName
    until not usergroups[usergroupName] or
          usergroups[usergroupName].Inherits == usergroupName

    -- One can only be sure the usergroup inherits from user if the
    -- usergroup isn't registered.
    return usergroupName == potentialAncestor or potentialAncestor == "user"
end

--- Find the base group a usergroup inherits from.
---
--- This function traverses down the inheritence chain, so for example if you have
--- `user` -> `group1` -> `group2`
--- this function will return `user` if you pass it `group2`.
---
--- ℹ **NOTE**: All usergroups must eventually inherit either user, admin or superadmin.
--- @param usergroupName string @The name of the usergroup
--- @return "'user'" | "'admin'" | "'superadmin'" @The name of the root usergroup
function CAMI.InheritanceRoot(usergroupName)
    if not usergroups[usergroupName] then return end

    local inherits = usergroups[usergroupName].Inherits
    while inherits ~= usergroups[usergroupName].Inherits do
        usergroupName = usergroups[usergroupName].Inherits
    end

    return usergroupName
end

--- Registers an addon privilege with CAMI.
---
--- ⚠ **Warning**: This should only be used by addons. Admin mods must *NOT*
---  register their privileges using this function.
--- @param privilege CAMI_PRIVILEGE
--- @return CAMI_PRIVILEGE @The privilege given as argument.
function CAMI.RegisterPrivilege(privilege)
    privileges[privilege.Name] = privilege

    hook.Call("CAMI.OnPrivilegeRegistered", nil, privilege)

    return privilege
end

--- Unregisters a privilege from CAMI.
--- This will call a hook that will notify any admin mods of the removal.
---
--- ⚠ **Warning**: Call only when the privilege is to be permanently removed.
--- @param privilegeName string @The name of the privilege.
--- @return boolean @Whether the unregistering succeeded.
function CAMI.UnregisterPrivilege(privilegeName)
    if not privileges[privilegeName] then return false end

    local privilege = privileges[privilegeName]
    privileges[privilegeName] = nil

    hook.Call("CAMI.OnPrivilegeUnregistered", nil, privilege)

    return true
end

--- Retrieves all registered privileges.
--- @return CAMI_PRIVILEGE[] @All privileges indexed by their names.
function CAMI.GetPrivileges()
    return privileges
end

--- Receives information about a privilege.
--- @param privilegeName string
--- @return CAMI_PRIVILEGE | nil
function CAMI.GetPrivilege(privilegeName)
    return privileges[privilegeName]
end

-- Default access handler
local defaultAccessHandler = {["CAMI.PlayerHasAccess"] =
    function(_, actorPly, privilegeName, callback, targetPly, extraInfoTbl)
        -- The server always has access in the fallback
        if not IsValid(actorPly) then return callback(true, "Fallback.") end

        local priv = privileges[privilegeName]

        local fallback = extraInfoTbl and (
            not extraInfoTbl.Fallback and actorPly:IsAdmin() or
            extraInfoTbl.Fallback == "user" and true or
            extraInfoTbl.Fallback == "admin" and actorPly:IsAdmin() or
            extraInfoTbl.Fallback == "superadmin" and actorPly:IsSuperAdmin())


        if not priv then return callback(fallback, "Fallback.") end

        local hasAccess =
            priv.MinAccess == "user" or
            priv.MinAccess == "admin" and actorPly:IsAdmin() or
            priv.MinAccess == "superadmin" and actorPly:IsSuperAdmin()

        if hasAccess and priv.HasAccess then
            hasAccess = priv:HasAccess(actorPly, targetPly)
        end

        callback(hasAccess, "Fallback.")
    end,
    ["CAMI.SteamIDHasAccess"] =
    function(_, _, _, callback)
        callback(false, "No information available.")
    end
}

--- @class CAMI_ACCESS_EXTRA_INFO
--- @field Fallback "'user'" | "'admin'" | "'superadmin'" @Fallback status for if the privilege doesn't exist. Defaults to `admin`.
--- @field IgnoreImmunity boolean @Ignore any immunity mechanisms an admin mod might have.
--- @field CommandArguments table @Extra arguments that were given to the privilege command.

--- Checks if a player has access to a privilege
--- (and optionally can execute it on targetPly)
---
--- This function is designed to be asynchronous but will be invoked
---  synchronously if no callback is passed.
---
--- ⚠ **Warning**: If the currently installed admin mod does not support
---                 synchronous queries, this function will throw an error!
--- @param actorPly GPlayer @The player to query
--- @param privilegeName string @The privilege to query
--- @param callback fun(hasAccess: boolean, reason: string|nil) @Callback to receive the answer, or nil for synchronous
--- @param targetPly GPlayer | nil @Optional - target for if the privilege effects another player (eg kick/ban)
--- @param extraInfoTbl CAMI_ACCESS_EXTRA_INFO | nil @Table of extra information for the admin mod
--- @return boolean | nil @Synchronous only - if the player has the privilege
--- @return string | nil @Synchronous only - optional reason from admin mod
function CAMI.PlayerHasAccess(actorPly, privilegeName, callback, targetPly,
extraInfoTbl)
    local hasAccess, reason = nil, nil
    local callback_ = callback or function(hA, r) hasAccess, reason = hA, r end

    hook.Call("CAMI.PlayerHasAccess", defaultAccessHandler, actorPly,
        privilegeName, callback_, targetPly, extraInfoTbl)

    if callback ~= nil then return end

    if hasAccess == nil then
        local err = [[The function CAMI.PlayerHasAccess was used to find out
        whether Player %s has privilege "%s", but an admin mod did not give an
        immediate answer!]]
        error(string.format(err,
            actorPly:IsPlayer() and actorPly:Nick() or tostring(actorPly),
            privilegeName))
    end

    return hasAccess, reason
end

--- Get all the players on the server with a certain privilege
--- (and optionally who can execute it on targetPly)
---
--- ℹ **NOTE**: This is an asynchronous function!
--- @param privilegeName string @The privilege to query
--- @param callback fun(players: GPlayer[]) @Callback to receive the answer
--- @param targetPly GPlayer | nil @Optional - target for if the privilege effects another player (eg kick/ban)
--- @param extraInfoTbl CAMI_ACCESS_EXTRA_INFO | nil @Table of extra information for the admin mod
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

    for _, ply in ipairs(allPlys) do
        CAMI.PlayerHasAccess(ply, privilegeName,
            function(...) onResult(ply, ...) end,
            targetPly, extraInfoTbl)
    end
end

--- @class CAMI_STEAM_ACCESS_EXTRA_INFO
--- @field IgnoreImmunity boolean @Ignore any immunity mechanisms an admin mod might have.
--- @field CommandArguments table @Extra arguments that were given to the privilege command.

--- Checks if a (potentially offline) SteamID has access to a privilege
--- (and optionally if they can execute it on a target SteamID)
---
--- ℹ **NOTE**: This is an asynchronous function!
--- @param actorSteam string | nil @The SteamID to query
--- @param privilegeName string @The privilege to query
--- @param callback fun(hasAccess: boolean, reason: string|nil) @Callback to receive  the answer
--- @param targetSteam string | nil @Optional - target SteamID for if the privilege effects another player (eg kick/ban)
--- @param extraInfoTbl CAMI_STEAM_ACCESS_EXTRA_INFO | nil @Table of extra information for the admin mod
function CAMI.SteamIDHasAccess(actorSteam, privilegeName, callback,
targetSteam, extraInfoTbl)
    hook.Call("CAMI.SteamIDHasAccess", defaultAccessHandler, actorSteam,
        privilegeName, callback, targetSteam, extraInfoTbl)
end

--- Signify that your admin mod has changed the usergroup of a player. This
--- function communicates to other admin mods what it thinks the usergroup
--- of a player should be.
---
--- Listen to the hook to receive the usergroup changes of other admin mods.
--- @param ply GPlayer @The player for which the usergroup is changed
--- @param old string @The previous usergroup of the player.
--- @param new string @The new usergroup of the player.
--- @param source any @Identifier for your own admin mod. Can be anything.
function CAMI.SignalUserGroupChanged(ply, old, new, source)
    hook.Call("CAMI.PlayerUsergroupChanged", nil, ply, old, new, source)
end

--- Signify that your admin mod has changed the usergroup of a disconnected
--- player. This communicates to other admin mods what it thinks the usergroup
--- of a player should be.
---
--- Listen to the hook to receive the usergroup changes of other admin mods.
--- @param steamId string @The steam ID of the player for which the usergroup is changed
--- @param old string @The previous usergroup of the player.
--- @param new string @The new usergroup of the player.
--- @param source any @Identifier for your own admin mod. Can be anything.
function CAMI.SignalSteamIDUserGroupChanged(steamId, old, new, source)
    hook.Call("CAMI.SteamIDUsergroupChanged", nil, steamId, old, new, source)
end

--PATH addons/____sam/lua/sam/modules/rrd_commands.lua:
if SAM_LOADED then return end
local sam, command = sam, sam.command
sam_sits = sam_sits or {}
command.set_category( "Tood's Extras" )
-- DarkRP util.lua positioning
function Pos_IsEmpty( vec, ignore )
	ignore = ignore or {}
	local point = util.PointContents( vec )
	local a = point ~= CONTENTS_SOLID and point ~= CONTENTS_MOVEABLE and point ~= CONTENTS_LADDER and point ~= CONTENTS_PLAYERCLIP and point ~= CONTENTS_MONSTERCLIP
	local b = true
	for _, v in ipairs( ents.FindInSphere( vec, 35 ) ) do
		if ( v:IsNPC() or v:IsPlayer() or v:GetClass() == "prop_physics" ) and not table.HasValue( ignore, v ) then
			b = false
			break
		end
	end
	return a and b
end

function Pos_FindEmpty( pos, ignore, dist, step, area )
	if Pos_IsEmpty( pos, ignore ) and Pos_IsEmpty( pos + area, ignore ) then return pos end
	for j = step, dist, step do
		for i = -1, 1, 2 do
			local k = j * i
			if Pos_IsEmpty( pos + Vector( k, 0, 0 ), ignore ) and Pos_IsEmpty( pos + Vector( k, 0, 0 ) + area, ignore ) then return pos + Vector( k, 0, 0 ) end
			if Pos_IsEmpty( pos + Vector( 0, k, 0 ), ignore ) and Pos_IsEmpty( pos + Vector( 0, k, 0 ) + area, ignore ) then return pos + Vector( 0, k, 0 ) end
			if Pos_IsEmpty( pos + Vector( 0, 0, k ), ignore ) and Pos_IsEmpty( pos + Vector( 0, 0, k ) + area, ignore ) then return pos + Vector( 0, 0, k ) end
		end
	end
	return pos
end

command.new( "editsits" ):SetPermission( "editsits" ):Help( "Gives you a SWEP to create and/or delete sit positions." ):OnExecute( function( ply )
	if ply:HasWeapon( "t_sit_editor" ) then
		sam.player.send_message( ply, "You already have the editor tool." )
		return
	end

	ply:Give( "t_sit_editor" )
	sam.player.send_message( ply, [[SIT EDITOR TOOL
Left Click to place a sit.
Right Click on or nearby a sit position to delete it.]] )
end ):End()

command.new( "sit" ):SetPermission( "sit" ):Help( "Teleports you to a random sit position." ):OnExecute( function( ply )
	if not file.Exists( "sam/" .. game.GetMap() .. ".txt", "DATA" ) then
		sam.player.send_message( ply, "No sit positions are currently set for " .. game.GetMap() .. ". Use !editsits to set up positions." )
		return
	else
		local data = util.JSONToTable( file.Read( "sam/" .. game.GetMap() .. ".txt", "DATA" ) )
		local vec = math.random( 1, #data )
		local pos = data[vec]
		if ply.SitReturnPos ~= nil then
			ply:SetPos( Pos_FindEmpty( ply.SitReturnPos, {}, 600, 30, Vector( 16, 16, 64 ) ) )
			ply.SitReturnPos = nil
		else
			ply.SitReturnPos = ply:GetPos()
			ply:SetPos( Pos_FindEmpty( pos, {}, 600, 30, Vector( 16, 16, 64 ) ) )
		end
	end
end ):End()

command.new( "jumppower" ):SetPermission( "jumppower" ):AddArg( "player", {
	single_target = true
} ):AddArg( "number", {
	hint = "amount",
	min = 1,
	max = 5000,
	round = true,
} ):OnExecute( function( _, targets, amount )
	for i = 1, #targets do
		targets[i]:SetJumpPower( amount )
	end
end ):End()

command.new( "launch" ):SetPermission( "launch" ):AddArg( "player", {
	single_target = true
} ):OnExecute( function( _, targets )
	for i = 1, #targets do
		targets[i]:SetVelocity( Vector( math.Round( math.random( 100, 150 ) ), math.Round( math.random( 100, 150 ) ), math.Round( math.random( 800, 1000 ) ) ) )
	end
end ):End()
--PATH addons/____sam/lua/sam/modules/teleport.lua:
if SAM_LOADED then return end

local sam, command, language = sam, sam.command, sam.language

command.set_category("Teleport")

local find_empty_pos -- https://github.com/FPtje/DarkRP/blob/b147d6fa32799136665a9fd52d35c2fe87cf7f78/gamemode/modules/base/sv_util.lua#L149
do
	local is_empty = function(vector, ignore)
		local point = util.PointContents(vector)
		local a = point ~= CONTENTS_SOLID
			and point ~= CONTENTS_MOVEABLE
			and point ~= CONTENTS_LADDER
			and point ~= CONTENTS_PLAYERCLIP
			and point ~= CONTENTS_MONSTERCLIP
		if not a then return false end

		local ents_found = ents.FindInSphere(vector, 35)
		for i = 1, #ents_found do
			local v = ents_found[i]
			if (v:IsNPC() or v:IsPlayer() or v:GetClass() == "prop_physics" or v.NotEmptyPos) and v ~= ignore then
				return false
			end
		end

		return true
	end

	local distance, step, area = 600, 30, Vector(16, 16, 64)
	local north_vec, east_vec, up_vec = Vector(0, 0, 0), Vector(0, 0, 0), Vector(0, 0, 0)

	find_empty_pos = function(pos, ignore)
		if is_empty(pos, ignore) and is_empty(pos + area, ignore) then
			return pos
		end

		for j = step, distance, step do
			for i = -1, 1, 2 do
				local k = j * i

				-- North/South
				north_vec.x = k
				if is_empty(pos + north_vec, ignore) and is_empty(pos + north_vec + area, ignore) then
					return pos + north_vec
				end

				-- East/West
				east_vec.y = k
				if is_empty(pos + east_vec, ignore) and is_empty(pos + east_vec + area, ignore) then
					return pos + east_vec
				end

				-- Up/Down
				up_vec.z = k
				if is_empty(pos + up_vec, ignore) and is_empty(pos + up_vec + area, ignore) then
					return pos + up_vec
				end
			end
		end

		return pos
	end
end

command.new("bring")
	:DisallowConsole()
	:SetPermission("bring", "admin")

	:AddArg("player", {cant_target_self = true})

	:Help("bring_help")

	:OnExecute(function(ply, targets)
		if not ply:Alive() then
			return ply:sam_send_message("dead")
		end

		if ply:InVehicle() then
			return ply:sam_send_message("leave_car")
		end

		if ply:sam_get_exclusive(ply) then
			return ply:sam_send_message(ply:sam_get_exclusive(ply))
		end

		local teleported = {admin = ply}
		local all = targets.input == "*"

		for i = 1, #targets do
			local target = targets[i]

			if target:sam_get_exclusive(ply) then
				if not all then
					ply:sam_send_message(target:sam_get_exclusive(ply))
				end
				continue
			end

			if not target:Alive() then
				target:Spawn()
			end

			target.sam_tele_pos, target.sam_tele_ang = target:GetPos(), target:EyeAngles()

			target:ExitVehicle()
			target:SetVelocity(Vector(0, 0, 0))
			target:SetPos(find_empty_pos(ply:GetPos(), target))
			target:SetEyeAngles((ply:EyePos() - target:EyePos()):Angle())

			table.insert(teleported, target)
		end

		if #teleported > 0 then
			sam.player.send_message(nil, "bring", {
				A = ply, T = teleported
			})
		end
	end)
:End()

command.new("goto")
	:DisallowConsole()
	:SetPermission("goto", "admin")

	:AddArg("player", {single_target = true, allow_higher_target = true, cant_target_self = true})

	:Help("goto_help")

	:OnExecute(function(ply, targets)
		if ply:sam_get_exclusive(ply) then
			return ply:sam_send_message(ply:sam_get_exclusive(ply))
		end

		if not ply:Alive() then
			ply:Spawn()
		end

		local target = targets[1]
		ply.sam_tele_pos, ply.sam_tele_ang = ply:GetPos(), ply:EyeAngles()

		ply:ExitVehicle()
		ply:SetVelocity(Vector(0, 0, 0))
		ply:SetPos(find_empty_pos(target:GetPos(), ply))
		ply:SetEyeAngles((target:EyePos() - ply:EyePos()):Angle())

		sam.player.send_message(nil, "goto", {
			A = ply, T = targets
		})
	end)
:End()

command.new("return")
	:SetPermission("return", "admin")

	:AddArg("player", {single_target = true, optional = true})

	:Help("return_help")

	:OnExecute(function(ply, targets)
		local target = targets[1]

		local last_pos, last_ang = target.sam_tele_pos, target.sam_tele_ang
		if not last_pos then
			return sam.player.send_message(ply, "no_location", {
				T = targets
			})
		end

		if target:sam_get_exclusive(ply) then
			return ply:sam_send_message(target:sam_get_exclusive(ply))
		end

		if not target:Alive() then
			return ply:sam_send_message(target:Name() .. " is dead!")
		end

		target:ExitVehicle()
		target:SetVelocity(Vector(0, 0, 0))
		target:SetPos(last_pos)
		target:SetEyeAngles(last_ang)

		target.sam_tele_pos, target.sam_tele_ang = nil, nil

		sam.player.send_message(nil, "returned", {
			A = ply, T = targets
		})
	end)
:End()
--PATH addons/__________911emergencyresponse/lua/autorun/sh_911emergencyresponse_loader.lua:
EmergencyDispatch = EmergencyDispatch or {}
EmergencyResponse = EmergencyResponse or {}
EmergencyDispatch.Sound = {}
EmergencyDispatch.DispatchCallouts = {}
EmergencyDispatch.ColorsConfiguration = {}
emergencymodNotificationSave = emergencymodNotificationSave or {}
include( "emergencyresponse/sh_config.lua" )
if SERVER then
	AddCSLuaFile( "emergencyresponse/sh_config.lua" )
	AddCSLuaFile( "emergencyresponse/client/cl_init.lua" )
	AddCSLuaFile( "emergencyresponse/client/cl_functions.lua" )
	AddCSLuaFile( "emergencyresponse/client/cl_victim_interface.lua" )
	AddCSLuaFile( "emergencyresponse/client/cl_respond_interface.lua" )
	include( "emergencyresponse/server/sv_init.lua" )
elseif CLIENT then
	include( "emergencyresponse/client/cl_init.lua" )
	include( "emergencyresponse/client/cl_functions.lua" )
	include( "emergencyresponse/client/cl_victim_interface.lua" )
	include( "emergencyresponse/client/cl_respond_interface.lua" )
end
--PATH addons/_cuffs/lua/autorun/sh_handcuffs.lua:
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
	
	local Distance = cuffs:GetRopeLength()
	local kidnapper = cuffs:GetKidnapper()
	if Distance<=0 or not IsValid(kidnapper) then return end // No forced movement
	
	if kidnapper==ply then return end
	
	local TargetPoint = (kidnapper:IsPlayer() and kidnapper:GetShootPos()) or kidnapper:GetPos()
	local MoveDir = (TargetPoint - ply:GetPos()):GetNormal()
	local ShootPos = ply:GetShootPos() + (Vector(0,0, (ply:Crouching() and 0)))
	
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
	local vertMult = math.max((math.Max(300-(xDif + yDif), -10)*0.08)^1.01  + (zDif*0.5),0)
	
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
// Internal Cuffs hooks
hook.Add( "CuffsCanHandcuff", "Cuff Protect", function( ply, target )
	return not target:GetTeamTable().nocuff and not RSP:InsideSafeZone( ply:GetPos() ) and not RSP:InsideSafeZone( target:GetPos() )
end)

if CLIENT then
	//
	// HUD
	local font0 = onyx.Font('Comfortaa Bold@20')
	local col1 = Color(255,255,255,20)
	local col2 = Color(255,0,0)
	local col3 = Color(0,255,0)
	hook.Add( "HUDPaint", "Cuffs CuffedInteractPrompt", function()
		if LocalPlayer():IsHandcuffed() then return end
		
		local tr,cuff = GetTrace( LocalPlayer() )
		if not (tr and IsValid(cuff)) then return end
		
		local w,h = (ScrW()*0.5), (ScrH()*0.5)
		
		local TextPos = h-40
		
		surface.SetDrawColor( color_black )
		surface.DrawOutlinedRect( w-101, TextPos-1, 202, 22 )
		surface.SetDrawColor( col1 )
		surface.DrawRect( w-100, TextPos, 200, 20 )
		
		onyx.hud.ScissorRect( w-100, TextPos, ((cuff:GetCuffBroken()/100)*200), 20, function()
			surface.SetDrawColor( col3 )
			surface.DrawRect( w-100,TextPos, 200,20 )

			onyx.DrawMatGradient(w-100,TextPos, 200,20, LEFT, col2)
		end )
		TextPos = TextPos-25
		
		if IsValid(cuff:GetFriendBreaking()) then
			if cuff:GetFriendBreaking()==LocalPlayer() then
				onyx.hud.DrawShadowText2D( "Звільнення...", font0, w, TextPos, color_white, TEXT_ALIGN_CENTER )
				TextPos = TextPos-20
			end
		else
			local str = string.format( "%s розв'язати", (input.LookupBinding("+use") or "[USE]"):upper() )
			onyx.hud.DrawShadowText2D( str, font0, w, TextPos, color_white, TEXT_ALIGN_CENTER )
			TextPos = TextPos-20
		end
		
		if cuff:GetRopeLength()>0 then
			if IsValid(cuff:GetKidnapper()) then
				if cuff:GetKidnapper()==LocalPlayer() then
					local str = string.format( "%s відпустити", (input.LookupBinding("+reload") or "[Reload]"):upper() )
					onyx.hud.DrawShadowText2D( str, font0, w, TextPos, color_white, TEXT_ALIGN_CENTER )
					TextPos = TextPos-20
				end
			else
				local str = string.format( "%s вести за собою", (input.LookupBinding("+reload") or "[Reload]"):upper() )
				onyx.hud.DrawShadowText2D( str, font0, w, TextPos, color_white, TEXT_ALIGN_CENTER )
				TextPos = TextPos-20
			end
		end
		
		if cuff:GetCanBlind() then
			local str = string.format( "%s %s очі", (input.LookupBinding("+attack2") or "[PRIMARY FIRE]"):upper(), cuff:GetIsBlind() and "розв'язати" or "зав'язати" )
			onyx.hud.DrawShadowText2D( str, font0, w, TextPos, color_white, TEXT_ALIGN_CENTER )
			TextPos = TextPos-20
		end
	end)
	
	//
	// Bind hooks
	hook.Add( "PlayerBindPress", "Cuffs CuffedInteract", function(ply, bind, pressed)
		if bind:lower()=="+attack" and pressed then
			if ply:KeyDown( IN_USE ) then
				local isDragging = false
				for _,c in ipairs(ents.FindByClass("weapon_handcuffed")) do
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
		elseif bind:lower()=="+attack2" and pressed then
			local tr,cuffs = GetTrace( ply )
			if tr and cuffs:GetCanBlind() then
				net.Start( "Cuffs_BlindPlayer" )
					net.WriteEntity( tr.Entity )
					net.WriteBit( not cuffs:GetIsBlind() )
				net.SendToServer()
				return true
			end
		elseif bind:lower()=="+reload" and pressed then
			local tr,cuffs = GetTrace( ply )
			if tr and cuffs:GetRopeLength()>0 then
				net.Start( "Cuffs_DragPlayer" )
					net.WriteEntity( tr.Entity )
					net.WriteBit( LocalPlayer()~=cuffs:GetKidnapper() )
				net.SendToServer()
				return true
			end
		elseif bind:lower()=="+use" and pressed then
			local tr,cuffs = GetTrace( ply )
			if tr then
				net.Start( "Cuffs_FreePlayer" )
					net.WriteEntity( tr.Entity )
				net.SendToServer()
				return true
			else
				local tr = util.TraceLine( {start=ply:EyePos(), endpos=ply:EyePos()+(ply:GetAimVector()*100), filter=ply} )
				if IsValid(tr.Entity) and tr.Entity:GetNWBool("Cuffs_TieHook") then
					net.Start("Cuffs_UntiePlayers") net.SendToServer()
				end
			end
		end
	end)
	
	//
	// Render
	local DefaultRope = Material("cable/rope")
	hook.Add( "PostDrawOpaqueRenderables", "Cuffs DragRope", function()
		local allCuffs = ents.FindByClass( "weapon_handcuffed" )
		for i=1,#allCuffs do
			local cuff = allCuffs[i]
			if not (IsValid(cuff) and IsValid(cuff.Owner) and cuff.GetRopeLength and cuff:GetRopeLength()>0 and cuff.GetKidnapper and IsValid(cuff:GetKidnapper())) then continue end
			
			local kidnapper = cuff:GetKidnapper()
			local kidPos = (kidnapper:IsPlayer() and kidnapper:GetPos() + Vector(0,0,37)) or kidnapper:GetPos()
			
			local pos = cuff.Owner:GetPos()
			local bone = cuff.Owner:LookupBone( "ValveBiped.Bip01_R_Hand" )
			if bone then
				pos = cuff.Owner:GetBonePosition( bone )
				if (pos.x==0 and pos.y==0 and pos.z==0) then pos = cuff.Owner:GetPos() end
			end
			
			if not cuff.RopeMat then cuff.RopeMat = DefaultRope end
			render.SetMaterial( cuff.RopeMat )
			render.DrawBeam( kidPos, pos, 0.7, 0, 5, color_white )
			render.DrawBeam( pos, kidPos, -0.7, 0, 5, color_white )
		end
	end)
	
	local HeadBone = "ValveBiped.Bip01_Head1"
	local RenderPos = {
		Blind = {Vector(3.5,3,2.6), Vector(3.8,4.8,0), Vector(3.5,3,-2.8), Vector(2.4,-2,-3.8), Vector(1.5,-4.5,0), Vector(2.4,-2,3.8)},
	}
	hook.Add( "PostPlayerDraw", "Cuffs DrawBlind", function( ply )
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
					render.DrawBeam( newPos, lastpos, 1.5, 0, 1, color_white )
					lastpos = newPos
				end
				render.DrawBeam( lastpos, firstpos, 1.5, 0, 1, color_white )
			end
		end
	end)
end
--PATH addons/_boombox/lua/retroboombox/sh_config.lua:
RetroBoombox.Config.Language = "ru"
RetroBoombox.Config.KeyBase = KEY_LALT
RetroBoombox.Config.ShouldUseParticles = false
RetroBoombox.Config.MaxSoundVolume = 200
RetroBoombox.Config.BoomboxCanBeDestroyed = true
RetroBoombox.Config.BoomboxUseLimitedToOwner = true
RetroBoombox.Config.Frequencies = {
	{
		name = "Radio paradise",
		logo = "https://images-eu.ssl-images-amazon.com/images/I/51A-N2vXAlL.png",
		url = "https://stream.radioparadise.com/mp3-128"
	},
	{
		name = "Lux FM (Pадіо Люкс)",
		logo = "https://images-ext-1.discordapp.net/external/-qMCyA3xEYYfdbYYh1fzWG_lYSnXIAZxGirOkkz69qI/https/static.mytuner.mobi/media/tvos_radios/Ffv2L6fYjd.png",
		url = "https://icecastdc.luxnet.ua/lux"
	},
	{
		name = "Радио Мелодия (Radio Melodia)",
		logo = "https://images-ext-2.discordapp.net/external/dP_OwTGn5KGLtlav7vuJTN7FY25MTTAnv79OlJEo2QY/https/static.mytuner.mobi/media/tvos_radios/njZQTUEzwg.png?width=634&height=634",
		url = "https://online.melodiafm.ua/MelodiaFM"
	},
	{
		name = "Радио Пятница (Pyatnica)",
		logo = "https://images-ext-2.discordapp.net/external/uO80K6W7RpLoWjasyvVI5Pdqepj8vR9YCaptDoWPQj8/https/static.mytuner.mobi/media/tvos_radios/QMYLLUQXxH.png",
		url = "https://cast.radiogroup.com.ua/radiopyatnica"
	},
	{
		name = "Авторадио (Avto Radio)",
		logo = "https://images-ext-1.discordapp.net/external/4BemU0_EUQUusx9Srmp0JMUWRfkbPDH72cT1Js-zq54/https/static.mytuner.mobi/media/tvos_radios/wqbAFqPhdT.png",
		url = "https://cast.radiogroup.com.ua/avtoradio"
	},
	{
		name = "Радіо БАЙРАКТАР",
		logo = "https://images-ext-2.discordapp.net/external/ZLj1Q1PE7_tau_M3_r_ghIFEBH92Vt9uFYXbK60TY24/https/static.mytuner.mobi/media/tvos_radios/mvpkxw3cdxuu.jpg",
		url = "https://online-news.radioplayer.ua/RadioNews"
	},
	{
		name = "Kiss FM",
		url = "https://online.kissfm.ua/KissFM_HD"
	},
	{
		name = "KissFM Deep",
		url = "https://online.kissfm.ua/KissFM_Deep"
	},
	{
		name = "Hit FM",
		logo = "https://cdn.webrad.io/images/logos/radioua-net/hit-fm.png",
		url = "https://online.hitfm.ua/HitFM_Live"
	},
	{
		name = "Anison FM",
		url = "http://pool.anison.fm:9000/AniSonFM(320)"
	}
}

--[[
	 List of available light colors :
	 ["white"] = Color( 255, 255, 255, 255 ),
	 ["green"] = Color( 0, 255, 157, 255 ),
	 ["darkgreen"] = Color( 63, 127, 79, 255 ),
	 ["lightblue"] = Color( 0, 255, 255, 255 ),
	 ["blue"] = Color( 0, 161, 255, 255 ),
	 ["hardblue"] = Color( 0, 127, 127, 255 ),
	 ["darkblue"] = Color( 0, 31, 127, 255 ),
	 ["orange"] = Color( 255, 191, 0, 255 ),
	 ["darkorange"] = Color( 255, 93, 0, 255 ),
	 ["purple"] = Color( 127, 0, 255, 255 ),
	 ["darkpurple"] = Color( 63, 0, 127, 255 ),
	 ["red"] = Color( 255, 0, 0, 255 ),
	 ["darkred"] = Color( 127, 0, 0, 255 ),
	 ["pink"] = Color( 255, 0, 97, 255 ),
	 ["yellow"] = Color( 255, 229, 0, 255),
	 You can use "zero" on lights to make that the is no light.

	 The Secondary color should be one of these :
	 gold
	 silver
	 bronze
 ]]
RetroBoombox.Config.Boombox = {
	["boombox_starter"] = {
		MainColor = "darkblue",
		SecondaryColor = "darkblue",
		MainLightsColor = "white",
		TubeLightsColor = "white",
		SoundLightsColor = "purple",
		ScreenBackgroundColor = Color( 90, 100, 200, 255 ),
		ScreenContentColor = Color( 255, 255, 255, 255 ),
	},
}
--PATH addons/__snow_event/lua/autorun/sh_snow_event.lua:
game.AddParticles( 'particles/zck_snowball.pcf' )
PrecacheParticleSystem( 'zck_snowball_explode' )
PrecacheParticleSystem( 'zck_snowball_pickup' )
PrecacheParticleSystem( 'zck_snowball_trail' )
--PATH addons/__________skeypads/lua/skeypads/integrations/sh_logs.lua:
plogs.Register( 'Keypad Crack', false )
plogs.AddHook( 'sKeypads::SuccessfulCrack', function( pl, ent )
	local cracker = ent:GetMeta():getOwner()
	plogs.PlayerLog( pl, 'Keypad Crack', Format( '%s(%s) зламав кейпад %s(%s)', pl:Name(), pl:SteamID(), cracker:Name(), cracker:SteamID() ), {
		['Name'] = pl:Name(),
		['SteamID'] = pl:SteamID()
	} )
end )
--PATH addons/__________skeypads/lua/skeypads/vgui/cl_friendsmenu.lua:
concommand.Add( 'ukrp_keypads_addfriends', function()
    if IsValid( framefriends ) then framefriends:Remove() end
    framefriends = vgui.Create( 'onyx.Frame' )
    framefriends:SetSize( ScrW() * 0.25, ScrH() * 0.7 )
    framefriends:Center()
    framefriends:MakePopup()
    framefriends:SetTitle( 'Додати товариша до кейпаду' )
    --
    local currentFriends = sKeypads.Friends.getAll()
    framefriends.dlabel = vgui.Create( 'onyx.Label', framefriends )
    framefriends.dlabel:Dock( TOP )
    framefriends.dlabel:DockMargin( 3, 3, 3, 3 )
    framefriends.dlabel:SetHeight( 70 )
    framefriends.dlabel:SetText( 'Товарищі, яких ви внесли в цей список,\nзможуть використовувати сканер відбитків пальців на Кейпадах.\nЦей список актуальний після рестарту.' )
    --
    framefriends.dlabel2 = vgui.Create( 'onyx.Label', framefriends )
    framefriends.dlabel2:Dock( TOP )
    framefriends.dlabel2:DockMargin( 3, 3, 3, 3 )
    framefriends.dlabel2:SetHeight( 70 )
    framefriends.dlabel2:SetText( '\n\nВаші товарищі:' )
    --
    framefriends.friendsList = vgui.Create( 'DListView', framefriends )
    framefriends.friendsList:Dock( TOP )
    framefriends.friendsList:DockMargin( 3, 3, 3, 3 )
    framefriends.friendsList:AddColumn( 'SteamID64' )
    framefriends.friendsList:AddColumn( 'Ім\'я' )
    framefriends.friendsList:SetTall( 200 )
    framefriends.friendsList:SetMultiSelect( false )
    --
    for _, v in ipairs( currentFriends ) do
        steamworks.RequestPlayerInfo( v, function( name ) framefriends.friendsList:AddLine( v, name or 'ERROR' ) end )
    end

    framefriends.friendsList:SelectFirstItem()
    --
    framefriends.remove = vgui.Create( 'onyx.Button', framefriends )
    framefriends.remove:Dock( TOP )
    framefriends.remove:DockMargin( 3, 3, 3, 3 )
    framefriends.remove:SetText( 'Видалити товарища' )
    framefriends.remove.DoClick = function()
        local lineID = framefriends.friendsList:GetSelectedLine()
        local line = framefriends.friendsList:GetLine( lineID )
        if not line then return end
        local friend = line:GetColumnText( 1 )
        sKeypads.Friends.remove( friend )
        framefriends.friendsList:RemoveLine( lineID )
        RunConsoleCommand( 'ukrp_keypads_addfriends' )
    end

    framefriends.addSteam = vgui.Create( 'onyx.Button', framefriends )
    framefriends.addSteam:Dock( TOP )
    framefriends.addSteam:DockMargin( 3, 3, 3, 3 )
    framefriends.addSteam:SetText( 'Додайте SteamID64' )
    framefriends.addSteam.DoClick = function()
        Derma_StringRequest( 'Додати товарища', 'Введіть SteamID64 товарища, якого хочете додати:', '', function( steamid64 )
            if not sKeypads.Utils.isValidSteamID( steamid64 ) then return end
            sKeypads.Friends.add( steamid64 )
            steamworks.RequestPlayerInfo( steamid64, function( name ) framefriends.friendsList:AddLine( steamid64, name or 'ERROR' ) end )
        end, nil, 'Додати', 'Відхилити' )
    end

    framefriends.dlabel3 = vgui.Create( 'onyx.Label', framefriends )
    framefriends.dlabel3:Dock( TOP )
    framefriends.dlabel3:DockMargin( 3, 3, 3, 3 )
    framefriends.dlabel3:SetHeight( 50 )
    framefriends.dlabel3:SetText( 'Додати гравця в онлайні:' )
    --
    local localPly = LocalPlayer()
    local onlinePlys = false
    framefriends.scrollpanel = vgui.Create( 'onyx.ScrollPanel', framefriends )
    framefriends.scrollpanel:Dock( TOP )
    framefriends.scrollpanel:SetHeight( 120 )
    framefriends.scrollpanel:DockMargin( 3, 3, 3, 3 )
    for _, v in SortedPairs( player.GetHumans(), function( a, b ) return a:Nick() > b:Nick() end ) do
        if not IsValid( v ) then continue end
        if v == localPly then continue end
        for _, id in ipairs( currentFriends ) do
            if id == v:SteamID64() then goto skip end
        end

        local addPlayer = vgui.Create( 'onyx.Button', framefriends.scrollpanel )
        addPlayer:Dock( TOP )
        addPlayer:DockMargin( 10, 3, 10, 3 )
        addPlayer:SetText( 'Оновити' )
        addPlayer:SetText( v:Nick() )
        addPlayer.DoClick = function( s )
            local steamid64 = v:SteamID64()
            sKeypads.Friends.add( steamid64 )
            steamworks.RequestPlayerInfo( steamid64, function( name ) framefriends.friendsList:AddLine( steamid64, name or 'ERROR' ) end )
            s:Remove()
        end

        onlinePlys = true
        :: skip ::
    end

    if not onlinePlys then
        framefriends.dlabel4 = vgui.Create( 'onyx.Label', framefriends )
        framefriends.dlabel4:Dock( TOP )
        framefriends.dlabel4:DockMargin( 3, 3, 3, 3 )
        framefriends.dlabel4:SetHeight( 20 )
        framefriends.dlabel4:SetText( '[Доступ є лише у вас]' )
    end

    framefriends.dlabel5 = vgui.Create( 'onyx.Label', framefriends )
    framefriends.dlabel5:Dock( TOP )
    framefriends.dlabel5:DockMargin( 3, 3, 3, 3 )
    framefriends.dlabel5:SetHeight( 30 )
    framefriends.dlabel5:SetText( '' )
    --
    framefriends.refresh = vgui.Create( 'onyx.Button', framefriends )
    framefriends.refresh:Dock( TOP )
    framefriends.refresh:DockMargin( 3, 3, 3, 3 )
    framefriends.refresh:SetText( 'Оновити' )
    framefriends.refresh.DoClick = function() RunConsoleCommand( 'ukrp_keypads_addfriends' ) end
end )
--PATH addons/____slib/lua/slib/vgui/cl_scollapsiblepanel.lua:
local PANEL = {}

local font, font_smaller = slib.createFont("Roboto", 16), slib.createFont("Roboto", 14)
local textcolor, textcolor_min55, shade_5, shade_10 = slib.getTheme("textcolor"), slib.getTheme("textcolor", -55), slib.getTheme("maincolor", 5), slib.getTheme("maincolor", 10)
local margin = slib.getTheme("margin")

function PANEL:Init()
    self.collapsed = true
    self.defaultH = slib.getScaledSize(24, "y")
    self.halfTall = slib.getScaledSize(8, "y")
    self:SetTall(self.defaultH)
    self:SetText("")

    self.button = vgui.Create("SButton", self)
    :SetTall(self.defaultH)
    :Dock(TOP)

    self.button.Paint = function(s,w,h)
        surface.SetDrawColor(shade_5)
        surface.DrawRect(0,h - 2,w,2)
    end

    self.button.DoClick = function()
        self.collapsed = !self.collapsed

        if self.onClicked then if self.onClicked() == true then return end end
        self:SizeTo(-1, self:getChildsHeight(), .3)
    end

    slib.wrapFunction(self, "Dock", nil, function() return self end, true)
    slib.wrapFunction(self, "DockMargin", nil, function() return self end, true)
    slib.wrapFunction(self, "SetZPos", nil, function() return self end, true)
    slib.wrapFunction(self, "SetTall", nil, function() return self end, true)
    slib.wrapFunction(self, "SetWide", nil, function() return self end, true)
    slib.wrapFunction(self, "SetPos", nil, function() return self end, true)
end

function PANEL:getChildCount()
    local count = 0

    for k,v in ipairs(self:GetChildren()) do
        if v:IsVisible() and v != self.button then
            count = count + 1
        end
    end

    return count
end

function PANEL:getChildsHeight()
    local height = self.defaultH

    if self.collapsed then
        for k,v in ipairs(self:GetChildren()) do
            if v == self.button or !v:IsVisible() then continue end
            local l, t, r, b = v:GetDockMargin()
            height = height + v:GetTall() + b + t
        end
    end

    return height + ((self.collapsed and height > self.defaultH) and margin or 0)
end

function PANEL:setTitle(str)
    self.title = str

    return self
end

function PANEL:ForceSize(add_tall)
    self:SizeTo(-1, self:getChildsHeight() + (add_tall or 0), .3)
end

function PANEL:forceCollapse()
    self:InvalidateChildren()
    self:SetTall(select(2, self:ChildrenSize()) + margin)

    return self
end

function PANEL:Paint(w, h)
    surface.SetDrawColor(self.bg or shade_10)
    surface.DrawRect(0,0,w,h)

    surface.SetDrawColor(shade_10)
    surface.DrawRect(0,0,w,self.defaultH)
    surface.DrawRect(w-1,0,1,h)
    surface.DrawRect(0,0,1,h)

    draw.SimpleText(self.title, font, w * .5, self.defaultH * .5, textcolor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    draw.SimpleText(self.collapsed and "-" or "+", font, w - margin - self.halfTall, self.defaultH * .5, textcolor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    if self.collapsed and self:getChildCount() <= 0 then 
        local offset = self:GetTall() - self.defaultH
        draw.SimpleText(self.emptyMsg or "", font_smaller, w * .5, self.defaultH + offset * .5, textcolor_min55, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
end

vgui.Register("SCollapsiblePanel", PANEL, "EditablePanel")
--PATH addons/____slib/lua/slib/vgui/cl_splayerselector.lua:
slib.panels = slib.panels or {}

local PANEL = {}

local font, sid_font, empty_font = slib.createFont("Roboto", 13), slib.createFont("Roboto", 11), slib.createFont("Roboto", 15)
local textcolor, textcolor_60 = slib.getTheme("textcolor"), slib.getTheme("textcolor", -60)
local hovercolor, margin, maincolor_12, maincolor_15 = slib.getTheme("hovercolor"), slib.getTheme("margin"), slib.getTheme("maincolor", 12), slib.getTheme("maincolor", 15)
local icon = Material("slib/down-arrow.png", "smooth")
local placeholder = "Вибрати варіант"

function PANEL:Init()
    self:SetTall(slib.getScaledSize(25, "y"))
    self:setTitle(placeholder, TEXT_ALIGN_LEFT)
    self.iteration = 0
    self.options = {}
    self.option_h = slib.getScaledSize(32, "y")
    self.titl = ""

    self.close = vgui.Create("DButton")
    self.close:Dock(FILL)
    self.close:SetText("")
    self.close:SetVisible(false)

    self.close.Paint = function() end

    self.close.DoClick = function()
        self.close:SetVisible(false)
        if IsValid(self.droppedFrame) then
            self.droppedFrame:SetVisible(false)
        end

        if isfunction(self.onClose) then self.onClose(self) end

        self:setTitle(self.titl, TEXT_ALIGN_LEFT, true)

        if !self.ply then
            self:setTitle(placeholder, TEXT_ALIGN_LEFT)
        end
    end

    self.droppedFrame = vgui.Create("EditablePanel")
    self.droppedFrame:SetWide(self:GetWide())
    self.droppedFrame:SetVisible(false)

    self.search = vgui.Create("STextEntry", self.droppedFrame)
    :Dock(TOP)
    :SetTall(self:GetTall())
    
    self.search.onValueChange = function(val)
        for k,v in ipairs(self.droppedMenu:GetCanvas():GetChildren()) do
            if !v.ply then continue end

            local filtered = false

            if self.filter then
                if self.filter(v.ply) == false then filtered = true end
            end

            v:SetVisible((val:Trim() == "" or string.find(v.nick:lower(), val:lower()) or val == v.sid64) and !filtered)
        end

        self.droppedMenu.SizeToChilds()
        self.droppedMenu:GetCanvas():InvalidateLayout(true)
    end

    self.closesearch = vgui.Create("SButton", self.search)
    self.closesearch:SetSize(self.option_h, self.option_h)
    self.closesearch.Paint = function(s,w,h) end
    self.closesearch.DoClick = self.close.DoClick

    self.droppedMenu = vgui.Create("SScrollPanel", self.droppedFrame)
    self.droppedMenu:SetWide(self:GetWide())
    self.droppedMenu:SetPos(0, self:GetTall())
    self.droppedMenu.Paint = function(s,w,h)
        surface.SetDrawColor(maincolor_15)
        surface.DrawRect(0,0,w,h)

        draw.SimpleText("No entries.", empty_font, w * .5, self.option_h * .5, textcolor_60, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    self.droppedMenu.SizeToChilds = function()
        local childs = self.droppedMenu:GetCanvas():GetChildren()
        local visible_childs = 0
        local childs_h = 0

        for k,v in ipairs(childs) do
            if v:IsVisible() then
                childs_h = childs_h + v:GetTall()
                visible_childs = visible_childs + 1
            end

            if visible_childs >= 5 then break end
        end
        
        self.droppedMenu:SetTall(math.max(childs_h, visible_childs <= 0 and self.option_h or 0))
        self.droppedFrame:SetTall(self.droppedMenu:GetTall() + self.search:GetTall())
    end

    self.no_player = vgui.Create("SButton", self.droppedMenu)
    :Dock(TOP)
    :SetLinePos(0)
    :SetTall(slib.getScaledSize(32, "y"))
    :SetZPos(-100)
    :SetVisible(false)

    self.no_player.skipVisible = true

    local noply_titl = "Немає гравця/Не на гравця"

    self.no_player.Paint = function(s,w,h)        
        surface.SetDrawColor(s:IsHovered() and maincolor_12 or maincolor_15)
        surface.DrawRect(0, 0, w, h)

        draw.SimpleText(noply_titl, slib.createFont("Roboto", 19), margin, h * .5, textcolor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end

    self.no_player.DoClick = function()
        self.titl = noply_titl
        self.ply = nil

        self.close.DoClick()
        self:setTitle(noply_titl, TEXT_ALIGN_LEFT, true)

        if isfunction(self.onValueChange) then
            self.onValueChange(val, ply)
        end
    end

    slib.panels["SPlayerSelector"] = slib.panels["SPlayerSelector"] or {}
    table.insert(slib.panels["SPlayerSelector"], self)

    timer.Simple(0, function()
        if !IsValid(self) then return end

        for k,v in ipairs(player.GetAll()) do
            self:addOption(v)
        end
    end)
end

function PANEL:SetScrollBG(col)
    self.droppedMenu.scrollbg = col
end

function PANEL:FindSelectPlayer(ply)
    for k,v in ipairs(self.droppedMenu:GetCanvas():GetChildren()) do
        if v.ply == ply then
            v.DoClick()
            
            break
        end
    end
end

function PANEL:SetPlaceholder(str)
    self:setTitle(str, TEXT_ALIGN_LEFT)
end

function PANEL:OnRemove()
    if IsValid(self.droppedFrame) then self.droppedFrame:Remove() end
end

function PANEL:popupAlone()
    self:DoClick()

    local x, y = input.GetCursorPos()
    if !IsValid(self.droppedFrame) then return end
    self.droppedFrame:SetWide(self:GetWide())
    self.droppedFrame:SetPos(x, y)
    self.droppedFrame:MakePopup()
    self:SetVisible(false)

    self.droppedMenu:SetWide(self.droppedFrame:GetWide())

    self.onClose = function() self:Remove() end

    return self
end

function PANEL:updatedFilters()
    for k, v in ipairs(self.droppedMenu:GetCanvas():GetChildren()) do
        local result = true
        
        if v.skipVisible then continue end

        if self.filter then
            if self.filter(v.ply) == false then result = false end    
        end

        v:SetVisible(result)
    end

    self:pickFirst()
end

function PANEL:pickFirst()
    local childs = self.droppedMenu:GetCanvas():GetChildren()

    for k,v in ipairs(childs) do
        if !v:IsVisible() then continue end
        
        v.DoClick(true)

        break
    end
end

function PANEL:ScrollToFirst()
    local childs = self.droppedMenu:GetCanvas():GetChildren()

    for k,v in ipairs(childs) do
        if !v:IsVisible() then continue end
        
        self.droppedMenu:ScrollToChild(v)

        break
    end
end

function PANEL:ShowNoPlayer(bool)
    self.no_player:SetVisible(bool)

    self.droppedMenu:InvalidateLayout(true)
    self.droppedMenu:SizeToChilds()
end

function PANEL:addOption(ply)
    self.addedPlys = self.addedPlys or {}
    
    if self.addedPlys[ply] then return end
    
    self.addedPlys[ply] = true

    local iteration = self.iteration
    local nick, sid64 = ply:Nick(), ply:SteamID64()

    self.options[iteration] = vgui.Create("SButton", self.droppedMenu)
    :Dock(TOP)
    :SetLinePos(0)
    :SetTall(self.option_h)

    local visibility = !self.filter or self.filter(ply) != false
    self.options[iteration]:SetVisible(visibility)

    self.options[iteration].ply = ply
    self.options[iteration].nick = nick
    self.options[iteration].sid64 = sid64
    
    local avatar = vgui.Create("AvatarImage", self.options[iteration])
    avatar:SetPlayer(ply, 64)
    avatar:SetSize(self.option_h, self.option_h)
    avatar:SetMouseInputEnabled(false)

    local wide = self.options[iteration]:GetWide()

    self.options[iteration].accentheight = 1

    self.droppedMenu:InvalidateLayout(true)
    self.droppedMenu:SizeToChilds()

    self.options[iteration].DoClick = function()
        self.titl = nick
        self.ply = ply

        self.close.DoClick()
        self:setTitle(nick, TEXT_ALIGN_LEFT, true)

        if isfunction(self.onValueChange) then
            self.onValueChange(val, ply)
        end
    end

    self.options[iteration].Paint = function(s,w,h)
        if !IsValid(ply) then s:Remove() if IsValid(self.droppedMenu) then self.droppedMenu:InvalidateLayout(true) end end
        
        surface.SetDrawColor(s:IsHovered() and maincolor_12 or maincolor_15)
        surface.DrawRect(0, 0, w, h)

        draw.SimpleText(nick, self.buttonfont or self.options[iteration].font, self.option_h + margin, h * .5, textcolor, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
        draw.SimpleText(sid64, sid_font, self.option_h + margin, h * .5, textcolor_60, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    end
    
    if wide > self:GetWide() then
        self:SetWide(wide)
    end
    
    self.iteration = self.iteration + 1

    self.lastchild = self.options[iteration]

    return self
end

function PANEL:SelectOption(int)
    self.options[int].DoClick()

    return self
end

function PANEL:Reposition()
    local x, y = self:LocalToScreen(0,0)
    if !IsValid(self.droppedMenu) then return end
    self.droppedFrame:SetWide(self:GetWide())
    self.droppedFrame:SetPos(x, y)
    self.droppedFrame:MakePopup()

    self.droppedMenu:SetWide(self.droppedFrame:GetWide())
    self.closesearch:SetPos(self:GetWide() - self.option_h, 0)
end

function PANEL:DoClick()
    self.close:SetVisible(!self.droppedFrame:IsVisible())
    self.close:MakePopup()

    local childs = self.droppedMenu:GetCanvas():GetChildren()

    self.droppedFrame:SetVisible(!self.droppedFrame:IsVisible())
    self.search:SetValue(self.search.placeholder)

    for k, v in ipairs(childs) do
        local result = true

        if v.skipVisible then continue end

        if self.filter then
            if self.filter(v.ply) == false then result = false end    
        end

        v:SetVisible(result)
    end

    self.droppedMenu:GetCanvas():InvalidateLayout()

    self:ScrollToFirst()

    self.droppedMenu.SizeToChilds()

    self:setTitle("")

    self:Reposition()
end

function PANEL:OnSizeChanged()
    self:Reposition()
end

function PANEL:PaintOver(w,h)
    local size = math.min(h * .7, slib.getScaledSize(12, "y"))
    local thickness = slib.getScaledSize(2, "x")

    draw.NoTexture()

    local wantedCol = (self:IsHovered() or (IsValid(self.closesearch) and self.closesearch:IsHovered())) and color_white or hovercolor

    surface.SetDrawColor(wantedCol)
    surface.SetMaterial(icon)
    surface.DrawTexturedRect(w - size - margin * 2, h * .5 - size * .5, size, size)
end

hook.Add("OnEntityCreated", "slib:AddNewPlayerSelector", function(ent)
    timer.Simple(3, function()
        if IsValid(ent) and slib.panels["SPlayerSelector"] and ent:IsPlayer() then
            for k,v in ipairs(slib.panels["SPlayerSelector"]) do
                if !IsValid(v) then continue end

                v:addOption(ent)
            end
        end
    end)
end)

vgui.Register("SPlayerSelector", PANEL, "SButton")
--PATH addons/____sprinter/lua/s_printer/languages/sh_russian.lua:
if CLIENT then
    slib.setLang("sprinter", "ru", "main", "Главная")
    slib.setLang("sprinter", "ru", "logs", "Логи")
    slib.setLang("sprinter", "ru", "upgrades", "Улучшения")
    slib.setLang("sprinter", "ru", "settings", "Настройки")
    slib.setLang("sprinter", "ru", "overclocking", "Разгон")
    slib.setLang("sprinter", "ru", "noisereduction", "Подавление шума")
    slib.setLang("sprinter", "ru", "dmgresistance", "Устойчивость к дамагу")
    slib.setLang("sprinter", "ru", "notifications", "Уведомления")

    slib.setLang("sprinter", "ru", "notify-withdraw", "Уведомить о выводе")
    slib.setLang("sprinter", "ru", "notify-on-damage", "Уведомить о дамаге")
    slib.setLang("sprinter", "ru", "notify-low-hp", "Уведомлять о низком уровне HP")
    slib.setLang("sprinter", "ru", "notify-low-battery", "Уведомлять о низком заряде батареи")

    slib.setLang("sprinter", "ru", "withdrawn-money", "Выведенные деньги")
    slib.setLang("sprinter", "ru", "received-damage", "Полученный урон")
    slib.setLang("sprinter", "ru", "upgraded-printer", "Улучшенные принтеры")
    slib.setLang("sprinter", "ru", "turned-on", "Включенные")
    slib.setLang("sprinter", "ru", "turned-off", "Выключенные")

    slib.setLang("sprinter", "ru", "are-you-sure", "Вы уверены?")
    slib.setLang("sprinter", "ru", "this-will-cost", "Это будет стоить %s")

    slib.setLang("sprinter", "ru", "nothing-to-show", "Здесь нечего показывать")

    slib.setLang("sprinter", "ru", "condition", "Состояние")
    slib.setLang("sprinter", "ru", "temperature", "Температура")
    slib.setLang("sprinter", "ru", "clockspeed", "Тактовая частота")
    slib.setLang("sprinter", "ru", "income", "Доход(мин)")
    slib.setLang("sprinter", "ru", "eject", "Извлечь")
    slib.setLang("sprinter", "ru", "withdraw", "Снять")
    slib.setLang("sprinter", "ru", "repair", "Восстановить")
    slib.setLang("sprinter", "ru", "recharge", "Перезарядить")

    slib.setLang("sprinter", "ru", "empty", "Пусто")

    slib.setLang("sprinter", "ru", "swep-name", "Сумка для принтера")
    slib.setLang("sprinter", "ru", "swep-instructions", "Первичный огонь, чтобы убрать принтер в кобуру, вторичный огонь, чтобы выбросить принтер!")
else
    slib.setLang("sprinter", "ru", "upgraded", "Вы улучшили принтер за %s")
    slib.setLang("sprinter", "ru", "recharged", "Вы зарядили принтер за %s")
    slib.setLang("sprinter", "ru", "repaired", "Вы отремонтировали принтер за %s")
    slib.setLang("sprinter", "ru", "repaired-rack", "Вы отремонтировали стойку за %s")
    slib.setLang("sprinter", "ru", "withdrawn", "Вы сняли %s")
    slib.setLang("sprinter", "ru", "recharged-all", "Вы зарядили каждый принтер в стойке за %s")
    slib.setLang("sprinter", "ru", "recharged-this-many", "Вы зарядили %s принтер(ов) в стойке за %s")
    slib.setLang("sprinter", "ru", "repaired-all", "Вы отремонтировали каждый принтер в стойке за %s")
    slib.setLang("sprinter", "ru", "repaired-this-many", "Вы отремонтировали %s принтер(ов) в стойке за %s")
    slib.setLang("sprinter", "ru", "no-eject-space", "Нет места для извлечения принтера")
    slib.setLang("sprinter", "ru", "printer-was-damaged", "Ваш принтер %s получил дамаг!")
    slib.setLang("sprinter", "ru", "printer-low-hp", "У вашего принтера %s низкий уровень HP!")
    slib.setLang("sprinter", "ru", "someone-has-withdrawn", "Кто-то снял деньги с вашего %s принтера!")
    slib.setLang("sprinter", "ru", "battery-low", "У вашего принтера %s низкий заряд батареи, вам следует зарядить его!")
    slib.setLang("sprinter", "ru", "rewarded-on-destroy", "Вы получили %s в награду за уничтожение принтера!")

    slib.setLang("sprinter", "ru", "full-printer-bag", "Сумка для принтера полна!")
end

slib.setLang("sprinter", "ru", "rack", "Стойка для принтера")
slib.setLang("sprinter", "ru", "insufficient-permissions", "У вас недостаточно прав для этого!")
--PATH addons/____sprinter/lua/s_printer/sh_sprinter.lua:
local alreadySetKeysPrinters = {
    ["bodycolor"] = true,
    ["Price"] = true,
    -- ["customCheck"] = true,
    -- ["failmsg"] = true,
    ["Max"] = true,
    ["allowed"] = true
}

local customKeysRack = {
    ["bodycolor"] = true,
    ["godmode"] = true,
    ["water_affect"] = true,
    ["vip"] = true
}

sPrinter.loadDarkRPContent = function()
    -- for k, v in ipairs(sPrinter.config["drp_categories"] or {}) do
    --     DarkRP.createCategory{ 
    --         name = v.name,
    --         categorises = "entities",
    --         startExpanded = true,
    --         color = v.color,
    --         canSee = v.canSee or function(ply) return false end,
    --         sortOrder = v.sortOrder
    --     }
    -- end

    if !sPrinter.config["rack"]["disabled"] then
        local rack_ent = {
            ENT = "sprinter_rack",
            Desc = "",
            Model = "models/stromic/rack.mdl",
            Max = sPrinter.config["rack"]["max"] or 1,
            category = sPrinter.config["rack"]["category"] or (sPrinter.config["drp_categories"] and sPrinter.config["drp_categories"][1] and sPrinter.config["drp_categories"][1].name) or "Printers",
            Command = "buy_spprinter_rack",
            allowed = {},
            RemoveOnJobChange = true,
        }

        for k,v in pairs(sPrinter.config["rack"]) do
            if customKeysRack[k] then continue end

            rack_ent[k] = v
        end

        rp.AddEntites(slib.getLang("sprinter", sPrinter.config["language"], "rack"),rack_ent)
    end

    for name, data in SortedPairsByMemberValue(sPrinter.config.printers, "sortorder") do
        local ENT = {}
        
        ENT.Base = "sprinter_base"
        ENT.Category = "sPrinter"
        ENT.PrintName = name
        ENT.Author = "Stromic"
        ENT.Spawnable = false
        ENT.name = name
        ENT.data = data
        
        local classstring = string.lower(string.gsub(name, " ", "_"))
        local classname = "sprinter_"..classstring
        scripted_ents.Register( ENT, classname)

        if SERVER then
            function ENT:PostInit()
                if data.bodycolor then
                    self:SetColor(data.bodycolor)
                end
            end
        end

        local entData = {
            ENT = classname,
            Desc = "",
            Model = "models/stromic/money_printer.mdl",
            Price = data.Price,
            category = data.category or (sPrinter.config["drp_categories"] and sPrinter.config["drp_categories"][1] and sPrinter.config["drp_categories"][1].name) or "Printers",
            -- customCheck = data.customCheck and data.customCheck or data.usergroup and function(ply) return CLIENT or data.usergroup[ply:GetUserGroup()] end or nil,
            Max = data.Max or 1,
            allowed = data.allowed and data.allowed or nil,
            Command = "buy_sp"..classstring,
            RemoveOnJobChange = true
        }

        for k,v in pairs(data) do
            if alreadySetKeysPrinters[k] then continue end

            entData[k] = v
        end

        rp.AddEntites(name,entData)
    end
end

-- local SWEP = {Primary = {}, Secondary = {}}

-- if CLIENT then
--     SWEP.PrintName = slib.getLang("sprinter", sPrinter.config["language"], "swep-name")
--     SWEP.Slot = 4
--     SWEP.SlotPos = 1
--     SWEP.DrawAmmo = false
--     SWEP.DrawCrosshair = true
--     SWEP.Instructions = slib.getLang("sprinter", sPrinter.config["language"], "swep-instructions")   
-- end

-- SWEP.Author = "Stromic"
-- SWEP.Category = "sPrinter"
-- SWEP.WorldModel	= ""

-- SWEP.Spawnable = true
-- SWEP.AdminOnly = false

-- SWEP.Primary.ClipSize = -1
-- SWEP.Primary.DefaultClip = 0
-- SWEP.Primary.Automatic = false
-- SWEP.Primary.Ammo = ""

-- SWEP.Secondary.ClipSize = -1
-- SWEP.Secondary.DefaultClip = 0
-- SWEP.Secondary.Automatic = false
-- SWEP.Secondary.Ammo = ""

-- SWEP.PrimaryAttack = function() end
-- SWEP.SecondaryAttack = function() end

-- SWEP.PreDrawViewModel = function() return true end

-- function SWEP:Initialize()
--     self:SetHoldType("normal")
-- end

-- if SERVER then
--     local items = {}

--     local function unholsterPrinter(swep, printer, key)
--         local posBase = IsValid(swep.Owner) and swep.Owner or swep

--         if posBase:IsPlayer() then
--             local trace = {}
--             trace.start = posBase:EyePos()
--             trace.endpos = trace.start + posBase:GetAimVector() * 85
--             trace.filter = posBase

--             local tr = util.TraceLine(trace)

--             posBase = tr.HitPos
--         else
--             local posBase = posBase:GetPos()
--             posBase.z = posBase.z + (20 * key)
--         end

--         printer:SetCollisionGroup(0)
--         printer:SetNoDraw(false)
--         printer:SetPos(posBase)

--         local phys = printer:GetPhysicsObject()
--         if IsValid(phys) then
--             phys:EnableMotion(true)
--             phys:Wake()
--         end

--         items[swep][key] = nil
--     end

--     function SWEP:PrimaryAttack()
--         self:SetNextPrimaryFire(CurTime() + 0.5)
--         local owner = self.Owner

--         if !IsValid(owner) then return end

--         items[self] = items[self] or {}
        
--         local printerCount = 0

--         for k,v in ipairs(items[self]) do
--             if !IsValid(v) then continue end
--             printerCount = printerCount + 1
--         end
        
--         local max = isnumber(sPrinter.config["max_printer_bag"]) and sPrinter.config["max_printer_bag"] or sPrinter.config["max_printer_bag"][owner:GetUserGroup()] or sPrinter.config["max_printer_bag"]["default"]

--         if printerCount >= max then
--             slib.notify(sPrinter.config["prefix"]..slib.getLang("sprinter", sPrinter.config["language"], "full-printer-bag"), owner)
--         return end

--         local trace = owner:GetEyeTrace()
--         local ent = trace.Entity

--         if !IsValid(ent) or ent:GetPos():DistToSqr(owner:GetPos()) > 10000 or ent.Base ~= "sprinter_base" then return end
--         if IsValid(ent:GetRack()) then ent:Eject() end

--         items[self][#items[self] + 1] = ent

--         ent:SetCollisionGroup(10)
--         ent:SetNoDraw(true)
--         ent:SetPos(Vector(0,0,999))
--         ent:Power(false)

--         local phys = ent:GetPhysicsObject()
--         if IsValid(phys) then
--             phys:EnableMotion(false)
--         end
--     end

--     function SWEP:SecondaryAttack()
--         self:SetNextSecondaryFire(CurTime() + 0.5)

--         if !items[self] or table.IsEmpty(items[self]) then return end

--         for i = table.Count(items[self]), 0, -1 do
--             local printer = items[self][i]
--             if !IsValid(printer) then continue end
--             unholsterPrinter(self, printer, i)
--             break
--         end
--     end

--     function SWEP:OnRemove()
--         if !items[self] or table.IsEmpty(items[self]) then return end
--         for i = 1, table.Count(items[self]) do
--             local printer = items[self][i]
--             if !IsValid(printer) then continue end
--             unholsterPrinter(self, printer, i)
--         end
--     end
-- end
    
-- weapons.Register( SWEP, "sprinter_bag" )
--PATH addons/ukrp_main_content/lua/autorun/ssu_security_standard.lua:
--Add Playermodel
player_manager.AddValidModel( "SSU", "models/player/ssu_security_standard.mdl" )
--PATH addons/____plogs/lua/ui/controls/avatarbutton.lua:

-----------------------------------------------------
local PANEL = {}

function PANEL:Init()
	self:SetText('')

	self.AvatarImage = ui.Create('AvatarImage', self)

	self.Button = ui.Create('DButton', self)
	self.Button:SetText('')
	self.Button.DoClick = function()
		self:DoClick()
	end
	self.Button.OnCursorEntered = function()
		self.Hovered = true
	end
	self.Button.OnCursorExited = function()
		self.Hovered = false
	end
	self.Button.PaintOver = function(_, w, h)
		derma.SkinHook('Paint', 'AvatarImage', self, w, h)
	end
	self.Button.Paint = function() end
end

function PANEL:PerformLayout()
	self.AvatarImage:SetPos(0,0)
	self.AvatarImage:SetSize(self:GetWide(), self:GetTall())

	self.Button:SetPos(0,0)
	self.Button:SetSize(self:GetWide(), self:GetTall())
end

function PANEL:DoClick()
	if IsValid(self.Player) then
		self.Player:ShowProfile()
	else
		gui.OpenURL('http://steamcommunity.com/profiles/' .. self.SteamID64)
	end
end

function PANEL:SetPlayer(pl)
	self.AvatarImage:SetPlayer(pl)
	self.SteamID64 = pl:SteamID64()
	self.Player = pl
end

vgui.Register('ui_avatarbutton', PANEL, 'DPanel')
--PATH addons/__main/lua/wos/anim_extension/loader/loader.lua:
--[[-------------------------------------------------------------------
	wiltOS Animation Register:
		A simple register to keep track of all wiltOS extensions installed
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
wOS.AnimExtension = wOS.AnimExtension or {}
wOS.AnimExtension.Mounted = wOS.AnimExtension.Mounted or {}

local string = string
local file = file

local function _AddCSLuaFile( lua )

	if SERVER then
		AddCSLuaFile( lua )
	end
	
end

local function _include( load_type, lua )

	if load_type then
		include( lua )
	end
	
end

function wOS.AnimExtension:Autoloader()
	
	for _,source in pairs( file.Find( "wos/anim_extension/extensions/*", "LUA"), true ) do
		local lua = "wos/anim_extension/extensions/" .. source
		_AddCSLuaFile( lua )
		_include( SERVER, lua )
		_include( CLIENT, lua )
	end
	
	_AddCSLuaFile( "wos/anim_extension/vgui/wiltos_anim_viewer.lua" )
	_include( CLIENT, "wos/anim_extension/vgui/wiltos_anim_viewer.lua" )
	
	_AddCSLuaFile( "wos/anim_extension/core/sh_metatable.lua" )
	_include( SERVER, "wos/anim_extension/core/sh_metatable.lua" )
	_include( CLIENT, "wos/anim_extension/core/sh_metatable.lua" )
	
	_AddCSLuaFile( "wos/anim_extension/core/sh_holdtypes.lua" )
	_include( SERVER, "wos/anim_extension/core/sh_holdtypes.lua" )
	_include( CLIENT, "wos/anim_extension/core/sh_holdtypes.lua" )

	_AddCSLuaFile( "wos/anim_extension/core/sh_prone_support.lua" )
	_include( SERVER, "wos/anim_extension/core/sh_prone_support.lua" )
	_include( CLIENT, "wos/anim_extension/core/sh_prone_support.lua" )
	
	for _,source in pairs( file.Find( "wos/anim_extension/holdtypes/*", "LUA"), true ) do
		local lua = "wos/anim_extension/holdtypes/" .. source
		_AddCSLuaFile( lua )
		_include( SERVER, lua )
		_include( CLIENT, lua )
	end
	
end

wOS.AnimExtension:Autoloader()
--PATH addons/_dance/lua/wos/fortnite/vgui/vgui_tauntcam.lua:
--This is a global version of the Garry's Mod Taunt Camera function, intended to work on any gamemode.
--I TAKE NO CREDIT FOR THIS, SO DON'T TRY AND BULLSHIT ANYTHING

wOS = wOS or {}
wOS.Fortnite = wOS.Fortnite or {}

function wOS.Fortnite:CreateTauntCamera( endless )

	local CAM = {}

	local WasOn					= false

	local CustomAngles			= Angle( 0, 0, 0 )
	local PlayerLockAngles		= nil

	local InLerp				= 0
	local OutLerp				= 1

	CAM.Remove = function( self )
		self = nil
		return
	end
	
	CAM.ShouldDrawLocalPlayer = function( self, ply, on )

		return on || OutLerp < 1

	end

	CAM.CalcView = function( self, view, ply, on )

		if ( !ply:Alive() || !IsValid( ply:GetViewEntity() ) || ply:GetViewEntity() != ply ) then on = false end

		if ( WasOn != on ) then

			if ( on ) then InLerp = 0 end
			if ( !on ) then OutLerp = 0 end

			WasOn = on

		end

		if ( !on && OutLerp >= 1 ) then

			CustomAngles = view.angles * 1
			PlayerLockAngles = nil
			InLerp = 0
			return

		end

		if ( PlayerLockAngles == nil ) then return end

		local TargetOrigin = view.origin - CustomAngles:Forward() * 100
		local tr = util.TraceHull( { start = view.origin, endpos = TargetOrigin, mask = MASK_SHOT, filter = player.GetAll(), mins = Vector( -8, -8, -8 ), maxs = Vector( 8, 8, 8 ) } )
		TargetOrigin = tr.HitPos + tr.HitNormal
		view.drawviewer = self:ShouldDrawLocalPlayer( ply, on )

		if ( InLerp < 1 ) then

			InLerp = InLerp + FrameTime() * 5.0
			view.origin = LerpVector( InLerp, view.origin, TargetOrigin )
			view.angles = LerpAngle( InLerp, PlayerLockAngles, CustomAngles )
			return view

		end

		if ( OutLerp < 1 ) then

			OutLerp = OutLerp + FrameTime() * 3.0
			view.origin = LerpVector( 1-OutLerp, view.origin, TargetOrigin )
			view.angles = LerpAngle( 1-OutLerp, PlayerLockAngles, CustomAngles )
			return view

		end

		view.angles = CustomAngles * 1
		view.origin = TargetOrigin
		return view

	end

	CAM.CreateMove = function( self, cmd, ply, on )
	
		if ( !ply:Alive() ) then on = false end
		if ( !on ) then return end

		--Added check for endless taunts
		if ( endless and cmd:KeyDown( IN_JUMP ) ) then
			self:Remove()
			wOS.Fortnite.TauntCamera = nil
			net.Start( "wOS.Fortnite.CancelEmote" )
			net.SendToServer()
		end

		
		if ( PlayerLockAngles == nil ) then
			PlayerLockAngles = cmd:GetViewAngles()
		end
	
		CustomAngles.pitch	= CustomAngles.pitch	+ cmd:GetMouseY() * 0.01
		CustomAngles.yaw	= CustomAngles.yaw		- cmd:GetMouseX() * 0.01

		cmd:SetViewAngles( PlayerLockAngles )
		cmd:ClearButtons()
		cmd:ClearMovement()

		return true

	end

	return CAM

end
--PATH addons/_dance/lua/wos/fortnite/core/sh_core.lua:
--[[-------------------------------------------------------------------
	Fortnite Dancing Shared Core:
		All shared functions for good prediction between server/client
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
----------------------------- Copyright 2019 ]]--[[
							  
	Lua Developer: King David
	Contact: www.wiltostech.com
]]--

wOS = wOS or {}
wOS.Fortnite = wOS.Fortnite or {}

hook.Add( "CalcMainActivity", "wOS.Fortnite.PerformEmote", function( ply )
	
	if ply:InVehicle() then return end
	if ply:GetNWBool( "wOS.Fortnite.EmoteEnabled", false ) then
		if not ply.WOS_FortniteLastBool then
			ply:SetCycle( 0 )
			ply.WOS_FortniteLastBool = true
		end
		local seq = ply:GetNWString( "wOS.Fortnite.Emote", "" )
		seq = ply:LookupSequence( seq )
		if not seq or seq < 1 then return end
		return -1, seq
	end
	ply.WOS_FortniteLastBool = ply.WOS_FortniteLastBool or ply:GetNWBool( "wOS.Fortnite.EmoteEnabled", false )
end )

hook.Add( "UpdateAnimation", "wOS.Fortnite.AnimationSpeed", function( ply, _, __ )

	if not ply:Alive() then return end
	if ply:InVehicle() then return end
	if !ply:GetNWBool( "wOS.Fortnite.EmoteEnabled", false ) then return end 
	ply:SetPlaybackRate( 1 )
	return true
	
end )
--PATH addons/xenin_the_xenin_framework_1900562881/lua/xeninui/libs/icon_dl.lua:
XeninUI.CachedIcons = XeninUI.CachedIcons or {}

if (!file.IsDir("xenin/icons", "DATA")) then
	file.CreateDir("xenin/icons")
end
if (!file.IsDir("xenin/icons/imgur", "DATA")) then
	file.CreateDir("xenin/icons/imgur")
end



local function DownloadImage(tbl)
	local p = XeninUI.Promises.new()

	if (!isstring(tbl.id)) then
		return p:reject("ID invalid")
	end

	local id = tbl.id
	local idLower = id:lower()
	local url = tbl.url or "https://i.imgur.com"
	local type = tbl.type or "png"

	if (XeninUI.CachedIcons[id] and XeninUI.CachedIcons[id] != "Loading") then
		return p:resolve(XeninUI.CachedIcons[id])
	end

	local read = file.Read("xenin/icons/imgur/" .. idLower .. "." .. type)
	if read then
		XeninUI.CachedIcons[id] = Material("../data/xenin/icons/imgur/" .. idLower .. "." .. type, "smooth")

		return p:resolve(XeninUI.CachedIcons[id])
	end

	local fullURL = tbl.fullURL or url .. "/" .. id .. "." .. type
	http.Fetch(fullURL, function(body, size, headers, code)
		if (code != 200) then
			return p:reject("Unable to download image due to code not being 200. Code: " .. code .. " ID:  " .. id .. " URL: " .. url .. "/" .. id .. "." .. type)
		end

		local str = "xenin/icons/imgur/" .. idLower .. "." .. type
		file.Write(str, body)

		XeninUI.CachedIcons[id] = Material("../data/" .. str, "smooth")

		p:resolve(XeninUI.CachedIcons[id])
	end, function(err)
		p:reject("Unable to download image. ID: " .. id .. " URL: " .. url .. "/" .. id .. "." .. type)
	end)

	return p
end

function XeninUI:DownloadIcon(pnl, tbl, pnlVar)
	if (!tbl) then return end

	local p = XeninUI.Promises.new()

	if isstring(tbl) then
		tbl = {
		{
		id = tbl } }
	end

	local i = 1
	local function AsyncDownload()
		if (!tbl[i]) then p:reject()end

		pnl[pnlVar or "Icon"] = "Loading"
		DownloadImage(tbl[i]):next(function(result)
			p:resolve(result):next(function()
				pnl[pnlVar or "Icon"] = result
			end, function(err)
				print(err)
			end)
		end, function(err)
			print(err)

			i = i + 1

			AsyncDownload()
		end)
	end

	AsyncDownload()

	return p
end

function XeninUI:DrawIcon(x, y, w, h, pnl, col, loadCol, var)
	col = col or color_white
	loadCol = loadCol or XeninUI.Theme.Accent
	var = var or "Icon"

	if (pnl[var] and type(pnl[var]) == "IMaterial") then
		surface.SetMaterial(pnl[var])
		surface.SetDrawColor(col)
		surface.DrawTexturedRect(x, y, w, h)
	elseif (pnl[var] != nil) then
		XeninUI:DrawLoadingCircle(h, h, h, loadCol)
	end
end



function XeninUI:GetIcon(id)
	local _type = type(id)
	if (_type == "IMaterial") then
		return id
	end

	if self.CachedIcons[id] then
		return self.CachedIcons[id]
	end

	local read = file.Read("xenin/icons/" .. id:lower() .. ".png")
	if read then
		self.CachedIcons[id] = Material("../data/xenin/icons/" .. id:lower() .. ".png", "smooth")
	else
		self.CachedIcons[id] = "Loading"
	end

	http.Fetch("https://i.imgur.com/" .. id .. ".png", function(body, len)
		local str = "xenin/icons/" .. id:lower() .. ".png"
		file.Write(str, body)

		self.CachedIcons[id] = Material("../data/" .. str, "smooth")
	end)
end

--PATH addons/xenin_the_xenin_framework_1900562881/lua/xeninui/libs/configurator/classes/cache.lua:
do
  local _class_0
  local _base_0 = {
    __name = "XeninUI.Configurator.Cache",
    get = function(self, id)
      return self.cache[id]
    end,
    set = function(self, id, val)
      self.cache[id] = val
    end,
    __type = function(self)
      return self.__name
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self)
      self.cache = {}
    end,
    __base = _base_0
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  XeninUI.Configurator.Cache = _class_0
end

--PATH addons/xenin_the_xenin_framework_1900562881/lua/xeninui/libs/configurator/ui/frame.lua:
local PANEL = {}

function PANEL:Init()
  if IsValid(XeninUI.Configurator.AdminMenu) then XeninUI.Configurator.AdminMenu:Remove()end

  XeninUI.Configurator.AdminMenu = self

  self:SetSize(1020, 800)
  self:Center()
  self:MakePopup()

  self.Top = self:Add("Xenin.Configurator.Admin.Top")
  self.Top:Dock(TOP)
  self.Top:DockMargin(16, 16, 16, 16)
  self.Top:SetText({
    "Title",
    "Subtitle"
  })

  self.Sidebar = self:Add("Xenin.Configurator.Admin.Sidebar")
  self.Sidebar:Dock(LEFT)
end

function PANEL:AddTab(...)
  self.Sidebar:AddTab(...)
end

function PANEL:SetActive(id)
  self.Sidebar:SetActive(id)
end

function PANEL:PerformLayout(w, h)
  self.Top:SetTall(40)
  self.Sidebar:SetWide(200)
end

function PANEL:Paint(w, h)
  local x, y = self:LocalToScreen()

  BSHADOWS.BeginShadow()
  draw.RoundedBox(6, x, y, w, h, XeninUI.Theme.Background)
  BSHADOWS.EndShadow(1, 2, 2, 255, 0, 0)

  draw.RoundedBoxEx(6, 0, 0, w, 40 + 32, XeninUI.Theme.Primary, true, true, false, false)
end

function PANEL:SetScript(script)
  local __laux_type = (istable(script) and script.__type and script:__type()) or type(script)
  assert(__laux_type == "string", "Expected parameter `script` to be type `string` instead of `" .. __laux_type .. "`")
  self.script = script
  local ctr = XeninUI.Configurator:FindControllerByScriptName(script)
  local tabs = ctr:getTabs()
  for i, v in ipairs(tabs) do
    self.Sidebar:AddTab(v.name, v.icon, v.color, v.panel, script, v)
  end
  self.Top:SetScript(script, ctr)
  self.Top:SetText(ctr:getTitle())
  self.Sidebar:SetActive(1)
end

vgui.Register("Xenin.Configurator.Admin", PANEL, "EditablePanel")

concommand.Add("xenin_config", function(ply, cmd, args)
  assert(XeninUI.Permissions:canAccessFramework(ply), "You don't have access to this config")
  local script = args[1]
  assert(isstring(script), "You need the script ID you're looking for")
  local controller = XeninUI.Configurator:FindControllerByScriptName(script)
  assert(controller != nil, "That script does not exist")

  local frame = vgui.Create("Xenin.Configurator.Admin")
  frame:SetScript(script)
end, function(cmd, args)
  local script = string.lower(string.Trim(args))
  local tbl = {}
  for i, v in ipairs(XeninUI.Configurator:GetControllers()) do
    if (#script > 0 and !v:getScript():find(script)) then continue end

    table.insert(tbl, "xenin_config " .. v:getScript())
  end


  table.sort(tbl, function(a, b)
    return a > b end)

  return tbl
end)

--PATH addons/xenin_the_xenin_framework_1900562881/lua/xeninui/libs/configurator/ui/search_bar.lua:
local function __laux_concat_0(...)
  local arr = {
  ...
  }
  local result = {}
  for _, obj in ipairs(arr) do
    for i = 1, #obj do
      result[#result + 1] = obj[i]
    end
    for k, v in pairs(obj) do
      if type(k) == "number" and k > #obj then result[k] = v
      elseif type(k) ~= "number" then
        result[k] = v
      end
    end
  end
  return result
end
local PANEL = {}

function PANEL:Init()
  self.textentry:SetUpdateOnType(true)
  self.textentry.OnValueChange = function(pnl, text)
    self:Search(text:lower())
  end
end

function PANEL:RemovePopup()
  if IsValid(self.Popup) then self.Popup:Remove()end
end

PANEL.OnRemove = PANEL.RemovePopup

XeninUI:CreateFont("Xenin.Configurator.Admin.SearchBar.Title", 18)
XeninUI:CreateFont("Xenin.Configurator.Admin.SearchBar.Subtitle", 13)

function PANEL:Paint(w, h)
  if IsValid(self.Popup) then
    return draw.RoundedBoxEx(self:GetRounded(), 0, 0, w, h, self:GetBackgroundColor(), true, true, false, false)
  end

  draw.RoundedBox(self:GetRounded(), 0, 0, w, h, self:GetBackgroundColor())
end

function PANEL:CreatePopup(results)
  local size = #results
  local x, y = self:GetPos()
  x = x + 16
  y = y + 16
  y = y + self:GetTall()
  local w = self:GetWide()
  local h = 16 + (size * 48 + ((size - 1) * 4))
  if (size == 0) then h = h + 30
  end

  self.Popup = XeninUI.Configurator.AdminMenu:Add("DPanel")
  self.Popup:SetPos(x, y)
  self.Popup:SetSize(w, h)
  self.Popup:SetZPos(100)
  self.Popup:SetDrawOnTop(true)
  self.Popup.Paint = function(pnl, w, h)
    XeninUI:DrawRoundedBoxEx(6, 0, 0, w, h, XeninUI.Theme.Navbar, false, false, true, true)
  end

  self.Popup.Layout = self.Popup:Add("DListLayout")
  self.Popup.Layout:DockPadding(8, 8, 8, 8)
  self.Popup.Layout:Dock(TOP)

  if (size == 0) then
    local panel = self.Popup.Layout:Add("DLabel")
    panel:SetText("No Results")
    panel:SetFont("Xenin.Configurator.Admin.SearchBar.Title")
    panel:SetTextColor(color_white)
    panel:SetContentAlignment(5)

    return
  end

  for i = 1, size do
    local result = results[i]
    local panel = self.Popup.Layout:Add("DButton")
    panel:DockMargin(0, 0, 0, 4)
    panel:SetText("")
    panel:SetTall(48)
    panel.Result = result
    panel.Color = XeninUI.Theme.Navbar
    local cat = {
      icon = result.icon,
      color = result.color
    }
    XeninUI:DownloadIcon(panel, cat.icon)
    local desc = result.desc
    if (#desc >= 58) then
      desc = result.desc:sub(1, 58 - 3) .. "..."
    end
    panel.Markup = markup.Parse("<font=Xenin.Configurator.Admin.SearchBar.Title><color=255,255,255>" .. tostring(result.name) .. "</color></font>")
    panel.Paint = function(pnl, w, h)
      XeninUI:DrawRoundedBox(6, 0, 0, w, h, pnl.Color)
      XeninUI:DrawIcon(8, 8, h - 16, h - 16, pnl, cat.color)

      pnl.Markup:Draw(h, h * 0.5, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
      XeninUI:DrawShadowText(desc, "Xenin.Configurator.Admin.SearchBar.Subtitle", h, h * 0.5, Color(179, 179, 179), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, 150)

      surface.SetFont("Xenin.Configurator.Admin.SearchBar.Title")
      local tw, th = pnl.Markup:GetWidth(), pnl.Markup:GetHeight()
      surface.SetFont("Xenin.Configurator.Admin.SearchBar.Subtitle")
      local sw, sh = surface.GetTextSize(result.category)
      XeninUI:DrawRoundedBox(6, h + tw + 4, h * 0.5 - th * 0.5 - 6, sw + 8, sh, result.color or cat.color)
      local col = XeninUI:GetContrastColor(result.color or cat.color, color_white, Color(65, 65, 65))
      draw.SimpleText(result.category, "Xenin.Configurator.Admin.SearchBar.Subtitle", h + tw + 4 + 4, h * 0.5 - th * 0.5 - 6, col, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    end
    panel.OnCursorEntered = function(pnl, w, h)
      pnl:LerpColor("Color", XeninUI.Theme.Background)
    end
    panel.OnCursorExited = function(pnl, w, h)
      pnl:LerpColor("Color", XeninUI.Theme.Navbar)
    end
    panel.DoClick = function(pnl)
      if result.onClick then
        result.onClick(pnl, XeninUI.Configurator.AdminMenu)
      end

      self:RemovePopup()
    end
  end
end

function PANEL:Find(text, search)
  return text:find(search, nil, nil, true)
end

function PANEL:SetScript(script, ctr)
  self.script = script
  self.ctr = ctr
end

function PANEL:AddToSearch(name, desc, category, id, extra)
  if extra == nil then extra = {}
  end
  table.insert(self.Results, __laux_concat_0({
    name = name,
    desc = desc,
    category = category,
    catId = id
  }, extra))
end

function PANEL:GetSettings()
  if (self:HasReachedSearchLimit()) then return end
end

function PANEL:HasReachedSearchLimit()
  return #self.Results >= 4
end

function PANEL:Search(text)
  self:RemovePopup()
  if (#text == 0) then return end
  self.Results = self.ctr:getSearch(text)

  self:CreatePopup(self.Results)
end

vgui.Register("Xenin.Configurator.Admin.SearchBar", PANEL, "XeninUI.TextEntry")

--PATH addons/xenin_the_xenin_framework_1900562881/lua/xeninui/libs/configurator/ui/settings.lua:
local PANEL = {}

XeninUI:CreateFont("Xenin.Configurator.Admin.Panel.Title", 40)
XeninUI:CreateFont("Xenin.Configurator.Admin.Panel.Navbar", 24)
XeninUI:CreateFont("Xenin.Configurator.Admin.Panel.Setting", 18)
XeninUI:CreateFont("Xenin.Configurator.Admin.Panel.Setting.Italic", 18, nil, {
italic = true
})
XeninUI:CreateFont("Xenin.Configurator.Admin.Panel.Category", 22)
XeninUI:CreateFont("Xenin.Configurator.Admin.Panel.Selectbox", 18)
XeninUI:CreateFont("Xenin.Configurator.Admin.Panel.Save", 24)

AccessorFunc(PANEL, "m_networkId", "NetworkId")

function PANEL:OnSearch() end

function PANEL:Init()
  self.Categories = {}
  self.Settings = {}

  self:DockPadding(16, 16, 16, 16)

  self:SetNetworkId("settings")

  self.Navbar = self:Add("XeninUI.Navbar")
  self.Navbar:Dock(TOP)
  self.Navbar.accent = XeninUI.Theme.Purple
  self.Navbar.textActive = color_white
  self.Navbar.font = "Xenin.Configurator.Admin.Panel.Navbar"
  self.Navbar.padding = 40
  self.Navbar.startHeight = 50
  self.Navbar.dockLeft = 0
  self.Navbar.Paint = function(pnl, w, h)
    XeninUI:DrawRoundedBoxEx(6, 0, 0, w, h, XeninUI.Theme.Primary, true, true, false, false)
  end
  self.Navbar:SetBody(self)

  self.Bottom = self:Add("Panel")
  self.Bottom:Dock(BOTTOM)
  self.Bottom:DockMargin(0, 16, 0, 0)
  self.Bottom:SetTall(32)

  self.Save = self.Bottom:Add("XeninUI.ButtonV2")
  self.Save:Dock(RIGHT)
  self.Save:SetText("Save")
  self.Save:SetFont("Xenin.Configurator.Admin.Panel.Save")
  self.Save:SetRoundness(6)
  self.Save:SetSolidColor(XeninUI.Theme.Accent)
  self.Save:SetHoverColor(XeninUI.Theme.Green)
  self.Save:SetTextColor(color_white)
  self.Save:SizeToContentsX(24)
  self.Save.DoClick = function(pnl)
    local id = self:GetNetworkId()
    local settings = {}
    for tabName, tab in pairs(self.Navbar.panels) do
      for i, v in ipairs(tab.Settings) do
        if (!v:IsVisible()) then continue end

        local id = v.Data.id
        local val = v.Input:GetSettingValue()

        self.ctr:set(id, val)
        settings[id] = val
      end
    end

    XeninUI.Configurator.Network:sendSaveSettings(self.script, settings)
  end
  XeninUI:AddRippleClickEffect(self.Save, color_black)
end

function PANEL:PerformLayout(w, h)
  self.Navbar:SetTall(self.Navbar.startHeight)
end

function PANEL:SetTitle(title) end

function PANEL:CreateCategory(name)
  local panel = self.Body:Add("DPanel")
  panel:Dock(TOP)
  panel:DockPadding(0, 36, 0, 40)
  panel.Name = name
  panel.Paint = function(pnl, w, h)

    draw.SimpleText(pnl.Name, "Xenin.Configurator.Admin.Panel.Category", 8, 32 * 0.5, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
  end
  panel.PerformLayout = function(pnl, w, h)
    pnl:SizeToChildren(false, true)
  end

  return panel
end

function PANEL:GetCategories()
  return self.Categories
end

function PANEL:GetCategory(cat)
  return self.Categories[cat]
end

function PANEL:SetController(ctr)
  local tabs = self.ctr:getSettingTabs()
  local settings = self.ctr:getSettingsByCategory()
  for i, v in ipairs(tabs) do
    self.Navbar:AddTab(v.name, "Xenin.Configurator.Admin.Panel.Setting", settings[v.name])
  end
  if tabs[1] then
    self.Navbar:SetActive(tabs[1].name)
  end
end

function PANEL:SetSettings(tbl)
  self.settings = tbl

  for i, v in ipairs(tbl) do
    self:AddSetting(v)
  end
end

function PANEL:SetScript(script)
  self.script = script
  self.ctr = XeninUI.Configurator:FindControllerByScriptName(script)
end

function PANEL:SetData(data)
  self:SetTitle(data.name)
  self:SetController(self.ctr)
end

vgui.Register("Xenin.Configurator.Admin.Panel", PANEL, "XeninUI.Panel")


local PANEL = {}

function PANEL:Init()
  self.Categories = {}
  self.Settings = {}

  self.Top = self:Add("Panel")
  self.Top:Dock(TOP)
  self.Top.Paint = function(pnl, w, h)
    XeninUI:DrawRoundedBoxEx(6, 0, 0, w, h, XeninUI.Theme.Navbar, false, false, true, true)
  end

  self.Navbar = self.Top:Add("DPanel")
  self.Navbar:Dock(FILL)
  self.Navbar.Paint = function() end
  self.Navbar.SetActive = function(pnl, id)
    local active = pnl.Active
    pnl.Active = id

    local btn = pnl.Buttons[active]
    if IsValid(btn) then
      btn:LerpColor("TextColor", Color(145, 145, 145))
    end

    btn = pnl.Buttons[id]
    if (!IsValid(btn)) then return end

    if active then
      btn:LerpColor("TextColor", color_white)
      local cat = self:GetCategory(btn:GetText())
      if ispanel(cat) then
        self.Scroll:ScrollToChild(cat)
      end
    else
      btn.TextColor = color_white
    end
  end
  self.Navbar.Buttons = {}
  self.Navbar.AddButton = function(pnl, name)
    local btn = pnl:Add("DButton")
    btn:Dock(LEFT)
    btn:SetText(name)
    btn:SetFont("Xenin.Configurator.Admin.Panel.Setting.Navbar")
    btn:SizeToContentsX(24)
    btn:SizeToContentsY()
    btn.TextColor = Color(145, 145, 145)
    btn.Paint = function(pnl, w, h)
      pnl:SetTextColor(pnl.TextColor)
    end
    btn.OnCursorEntered = function(pnl)
      pnl:LerpColor("TextColor", color_white)
    end
    btn.OnCursorExited = function()
      if (pnl.Active == btn.Id) then return end

      btn:LerpColor("TextColor", Color(145, 145, 145))
    end
    btn.DoClick = function()
      pnl:SetActive(btn.Id)
    end

    local id = table.insert(pnl.Buttons, btn)
    pnl.Buttons[id].Id = id
  end
  self.Navbar.SetActiveButtonByName = function(pnl, name)
    for i, v in ipairs(pnl.Buttons) do
      if (v:GetText() != name) then continue end

      v:LerpColor("TextColor", color_white)
      pnl:SetActive(v.Id)
    end
  end

  self.Scroll = self:Add("XeninUI.Scrollpanel.Wyvern")
  self.Scroll:Dock(FILL)
  self.Scroll:DockMargin(0, 16, 0, 0)

  self.Body = self.Scroll:Add("Panel")

  self:SetActive(1)
end

function PANEL:SetData(data)
  if (!istable(data)) then return end

  self.settings = data
  for i, v in ipairs(data) do
    self:AddSetting(v)
  end
  self:SetActive(1)
end

function PANEL:CreateCategory(name)
  local panel = self.Body:Add("DPanel")
  panel:Dock(TOP)
  panel:DockPadding(0, 28, 0, 20)
  panel.Name = name
  panel.Paint = function(pnl, w, h)

    draw.SimpleText(pnl.Name, "Xenin.Configurator.Admin.Panel.Category", 8, 32 * 0.5, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
  end
  panel.PerformLayout = function(pnl, w, h)
    pnl:SizeToChildren(false, true)
  end

  return panel
end

function PANEL:GetCategory(cat)
  return self.Categories[cat]
end

function PANEL:HighlightSetting(cat, id)
  for catId, catPnl in pairs(self.Categories) do
    if (catId != cat) then continue end

    for i, v in ipairs(catPnl:GetChildren()) do
      if (v.Data.id != id) then continue end

      v:Highlight()

      return v, i
    end
  end
end

function PANEL:AddSetting(tbl)
  if (!self.Categories[tbl.subCategory]) then
    local foundCat
    for i, v in pairs(self.Navbar.Buttons) do
      if (v:GetText() != tbl.subCategory) then continue end

      foundCat = true
      break
    end
    if (!foundCat) then
      self:AddButton(tbl.subCategory)
    end
    self.Categories[tbl.subCategory] = self:CreateCategory(tbl.subCategory)
  end

  local input = XeninUI.Configurator:CreateInputPanel(tbl.type, self, tbl)
  if input.SetData then
    input:SetData(tbl.data)
  end
  if input.SetInput then
    input:SetInput(tbl.value)
  end

  local panel = self.Categories[tbl.subCategory]:Add("DPanel")
  input:SetParent(panel)
  panel:Dock(TOP)
  panel.Data = tbl
  panel.Height = input.Height or 48
  panel:SetTall(input.Height or 48)
  panel.Input = input
  panel.Markup = markup.Parse("<font=Xenin.Configurator.Admin.Panel.Setting><color=145,145,145>" .. tostring(tbl.name) .. "</color></font>")
  panel.Paint = function(pnl, w, h)
    local x = 0
    if tbl.onPaint then x = x + tbl.onPaint(pnl, w, h)
    end
    surface.SetDrawColor(100, 100, 100)
    surface.DrawRect(0, h - 1, w, 1)

    pnl.Markup:Draw(x + 8, 48 * 0.5, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
  end
  panel.FlashAlpha = 0
  panel.PaintOver = function(pnl, w, h)
    local alpha = pnl.FlashAlpha
    if (alpha <= 1) then return end

    surface.SetDrawColor(ColorAlpha(XeninUI.Theme.Green, alpha / (255 / 50)))
    surface.DrawRect(0, 0, w, h)

    XeninUI:MaskInverse(function()
      surface.DrawRect(1, 1, w - 2, h - 2)
    end, function()
      surface.SetDrawColor(ColorAlpha(XeninUI.Theme.Green, alpha))
      surface.DrawRect(0, 0, w, h)
    end)
  end
  panel.Highlight = function(pnl)
    pnl:EndAnimations()

    pnl:Lerp("FlashAlpha", 255, 0.7, function()
      timer.Simple(0.2, function()
        if (!IsValid(pnl)) then return end

        pnl:Lerp("FlashAlpha", 0, 0.5)
      end)
    end)
  end

  if tbl.func then
    tbl.func(input, panel)
  end
  if (tbl.onChange or tbl.data.onChange) then
    input.onChange = tbl.onChange or tbl.data.onChange
  end
  if tbl.data.postInit then
    tbl.data.postInit(input, panel)
  end
  if tbl.data.hidden then
    panel:SetVisible(false)
  end
  panel.PerformLayout = function(pnl, w, h)
    local l, t, r, b = pnl.Input:GetDockMargin()
    pnl.Input:SetTall(h - t - b)
    pnl.Input:SetPos(w - l - pnl.Input:GetWide() - r, t)
  end

  table.insert(self.Settings, panel)
end

function PANEL:SetActive(id)
  self.Navbar:SetActive(id)
end

function PANEL:AddButton(name)
  self.Navbar:AddButton(name)
end

function PANEL:PerformLayout(w, h)
  self.Top:SetTall(38)

  if IsValid(self.Body) then
    self.Body:SetWide(math.min(600, w - 56))
    self.Body:SizeToContentsY()
    self.Body:Center()
    self.Body:SizeToChildren(false, true)
  end

  for i, v in ipairs(self.Settings) do
    v:SetTall(v.Height or 48)
  end
end

XeninUI:CreateFont("Xenin.Configurator.Admin.Panel.Setting.Navbar", 18)

vgui.Register("Xenin.Configurator.Admin.Panel.Setting", PANEL, "XeninUI.Panel")

--PATH addons/xenin_the_xenin_framework_1900562881/lua/xeninui/libs/configurator/ui/entities/entity_grid.lua:
local PANEL = {}

function PANEL:SetScript(script)
  self.script = script
  self.ctr = XeninUI.Configurator:FindControllerByScriptName(script)
end

function PANEL:Call(id, default, ...)
  local value = self.Template[id] or default

  if isfunction(value) then
    return value(...)
  else
    return value
  end
end

function PANEL:OnSearch(text)
  text = text:lower()

  local panels = self.Layout:GetChildren()
  for i, v in ipairs(panels) do
    local result = v:Search(text)
    v:SetVisible(result)
  end

  self.Layout:InvalidateLayout()
end

function PANEL:SetData(tbl)
  assert(tbl ~= nil, "cannot destructure nil value")
  local __entity, name, script = tbl.__entity, tbl.name, tbl.script

  self:SetScript(script)
  self.Entity = __entity
  self:SetTitle(name)

  self.Navbar:SetVisible(false)
  self.Template = XeninUI.Configurator.Entities:get(self.Entity)
  self.BaseEnt = XeninUI.Configurator.Entities:create(self.Entity)

  self.TopBar = self:Add("Panel")
  self.TopBar:Dock(TOP)
  self.TopBar:DockMargin(0, 16, 0, 8)

  self.Subtitle = self.TopBar:Add("DLabel")
  self.Subtitle:SetFont("Xenin.Configurator.Admin.Panel.Navbar")
  self.Subtitle:SetText("Subtitle")

  self.Save.DoClick = function(pnl)
    for _, row in ipairs(self.Layout:GetChildren()) do
      if (row.StartedActive and !row.Active) then
        row.Entity:delete(true)
        row:DoSaveAnimation(XeninUI.Theme.Red)
        row.StartedActive = false

        continue
      end
      if (!row.Active) then continue end

      local ent = XeninUI.Configurator.Entities:create(self.Entity)
      local settings = IsValid(row.Settings) and row.Settings.Rows:GetSettings()
      if (!settings) then continue end
      for i, v in pairs(settings) do
        ent["set" .. tostring(i)](ent, v)
      end

      row.StartedActive = true
      row:DoSaveAnimation(XeninUI.Theme.Green)
      ent:save(true)
    end
  end

  self.Layout = self.Scroll:Add("DIconLayout")
  self.Layout:Dock(TOP)
  self.Layout:DockMargin(0, 0, 8, 0)
  self.Layout:SetBorder(0)
  self.Layout:SetSpaceY(8)
  self.Layout:SetSpaceX(8)
  self.Layout.Columns = self:Call("gridColumns", 5)
  self.Layout.PerformLayout = function(pnl, w, h)
    local children = pnl:GetChildren()
    local count = pnl.Columns
    local width = w / math.min(count, #children)

    local x = 0
    local y = 0

    local spacingX = pnl:GetSpaceX()
    local spacingY = pnl:GetSpaceY()
    local border = pnl:GetBorder()
    local innerWidth = w - border * 2 - spacingX * (count - 1)

    for i, child in ipairs(children) do
      if (!IsValid(child)) then continue end
      if (!child:IsVisible()) then continue end

      child:SetPos(border + x * innerWidth / count + spacingX * x, border + y * child:GetTall() + spacingY * y)
      child:SetSize(self:Call("gridColumnWidth", function()
        return innerWidth / count
      end, innerWidth, count, w, h, x, y), self:Call("gridColumnHeight", function()
        return innerWidth / count
      end, innerWidth, count, w, h, x, y))

      x = x + 1
      if (x >= count) then
        x = 0
        y = y + 1
      end
    end

    pnl:SizeToChildren(false, true)
  end

  self:CreateContent()
end

XeninUI:CreateFont("Xenin.Configurator.Grid", 12)

local matTick = Material("xenin/tick.png", "smooth")
function PANEL:CreateColumn(data, index)
  local panel = self.Layout:Add("DButton")
  panel:SetText("")
  panel.BackgroundColor = XeninUI.Theme.Background
  panel.OutlineColor = XeninUI.Theme.Navbar
  panel.TextColor = Color(174, 174, 174)
  panel.StartedActive = tobool(data.isActive)
  panel.Search = data.search or function(pnl, text)
    return pnl.Name:find(text)
  end
  panel.Entity = data.isActive or XeninUI.Configurator.Entities:create(self.Entity)
  panel.Name = panel.Entity and panel.Entity.getName and panel.Entity:getName()
  if (!panel.Name) then
    panel.Name = data.name or "Unknown name"
  end
  self:Call("gridSetDefaultData", function() end, panel.Entity, data, index)
  panel.SelectionAlpha = 0
  panel.Paint = function(...)
    self:Call("gridPaint", function(pnl, w, h)
      draw.RoundedBox(6, 0, 0, w, h, pnl.BackgroundColor)

      pnl:DrawSelected(w, h)
    end, ...)
  end
  panel.DrawSelected = function(...)
    self:Call("gridDrawSelected", function(pnl, w, h)
      local alpha = pnl.SelectionAlpha
      if (alpha <= 1) then return end

      local size = h * 0.25
      local x = w * 0.5 - size * 0.5
      local y = h * 0.5 - size * 0.5
      local col = ColorAlpha(XeninUI.Theme.Accent, alpha / 8)

      local topRight = !pnl.Settings:IsVisible()
      local bottomRight = true
      if pnl.Settings:IsVisible() then
        bottomRight = pnl.Settings:GetTall() < (h * 0.95)
      end
      XeninUI:DrawRoundedBoxEx(6, 0, 0, w, h, col, true, topRight, true, bottomRight)

      if (true) then return end
      XeninUI:MaskInverse(function()
        XeninUI:DrawCircle(w * 0.5, h * 0.5, size * 0.85, 30, col)
      end, function()
        XeninUI:DrawCircle(w * 0.5, h * 0.5, size, 30, col)
      end)

      surface.SetDrawColor(col)
      surface.SetMaterial(matTick)
      surface.DrawTexturedRect(x + 1, y + 1, size, size)
    end, ...)
  end
  panel.PaintOver = function(pnl, w, h)
    self:Call("gridPaintOver", function(pnl, w, h)
      local topRight = !pnl.Settings:IsVisible()
      local bottomRight = true
      if pnl.Settings:IsVisible() then
        bottomRight = pnl.Settings:GetTall() < (h * 0.95)
      end
      XeninUI:MaskInverse(function()
        XeninUI:DrawRoundedBoxEx(6, 1, 1, w - 2, h - 2, pnl.OutlineColor, true, topRight, true, bottomRight)
      end, function()
        XeninUI:DrawRoundedBoxEx(6, 0, 0, w, h, pnl.OutlineColor, true, topRight, true, bottomRight)
      end)

      if (!IsValid(pnl.Display)) then
        draw.SimpleText("No Image", "Xenin.Configurator.Grid", w * 0.5, h * 0.5, Color(174, 174, 174), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
      end



      XeninUI.DrawMultiLine(pnl.Name, "Xenin.Configurator.Grid", w - 16, 16, w * 0.5, h - 8, pnl.TextColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
    end, pnl, w, h)

    if (!pnl.SaveAnimation) then return end

    local size = math.max(w, h)
    XeninUI:Mask(function()
      XeninUI:DrawRoundedBox(6, 0, 0, w, h, color_white)
    end, function()
      XeninUI:DrawCircle(w * 0.5, h * 0.5, size * (pnl.SaveAnimation * 1.2), 30, ColorAlpha(pnl.SaveColor, 255 - (pnl.SaveAnimation * 255)))
    end)
  end
  panel.OnCursorEntered = function(...)
    self:Call("gridOnCursorEntered", function(pnl)
      pnl:LerpColor("TextColor", color_white)
      pnl:LerpColor("OutlineColor", ColorAlpha(XeninUI.Theme.Accent, 150))
    end, ...)
  end
  panel.OnCursorExited = function(...)
    if (panel.Settings:IsVisible()) then return end

    self:Call("gridOnCursorExited", function(pnl)
      pnl:LerpColor("TextColor", Color(174, 174, 174))
      pnl:LerpColor("OutlineColor", XeninUI.Theme.Navbar)
    end, ...)
  end
  panel.DoSaveAnimation = function(pnl, color)
    if color == nil then color = XeninUI.Theme.Green
    end
    pnl.SaveColor = color
    pnl.SaveAnimation = 0
    pnl:Lerp("SaveAnimation", 1, 0.7, function()
      pnl.SaveAnimation = nil
    end)
  end
  panel.DoClick = function(pnl)
    self:Call("gridDoClick", function(pnl)
      pnl:SetState(!pnl.Active)
    end, pnl)
  end
  panel.SetState = function(pnl, state)
    local instant = pnl.Active == nil
    pnl.Active = state

    local val = state and 255 or 0
    if instant then
      pnl.SelectionAlpha = val
    else
      pnl:Lerp("SelectionAlpha", val)
    end
  end
  panel:SetState(tobool(data.isActive))

  if (data.display and data.display != "") then
    local isModel = data.display:find(".mdl")
    local panelClass = isModel and "DModelPanel" or "Panel"
    if (isModel and data.isSpawnIcon) then
      panelClass = "SpawnIcon"
    end
    panel.Display = panel:Add(panelClass)
    panel.Display:Dock(FILL)
    panel.Display:SetMouseInputEnabled(false)
    if isModel then
      panel.Display:SetModel(data.display)
      if data.isSpawnIcon then
        panel.Display:DockMargin(8, 8, 8, 8)
      else
        panel.Display.LayoutEntity = function() end
        if IsValid(panel.Display.Entity) then
          local mn, mx = panel.Display.Entity:GetRenderBounds()
          local size = 0
          size = math.max(size, math.abs(mn.x) + math.abs(mx.x))
          size = math.max(size, math.abs(mn.y) + math.abs(mx.y))
          size = math.max(size, math.abs(mn.z) + math.abs(mx.z))
          panel.Display:SetFOV(45)
          panel.Display:SetCamPos(Vector(size, size, size))
          panel.Display:SetLookAt((mn + mx) * 0.5)
          if data.color then
            panel.Display:SetColor(data.color)
          end
        end
      end
    elseif (isstring(data.display) and data.display != "") then
      XeninUI:DownloadIcon(panel.Display, data.display)
      panel.Display.Paint = function(pnl, w, h)
        XeninUI:DrawIcon(8, 8, w - 16, h - 16, pnl)
      end
    end
  end

  panel.Cog = panel:Add("DButton")
  panel.Cog:SetText("")
  XeninUI:DownloadIcon(panel.Cog, "CEIrmnK")
  panel.Cog.Color = Color(174, 174, 174)
  panel.Cog.Paint = function(pnl, w, h)
    XeninUI:DrawIcon(4, 4, w - 8, h - 8, pnl, pnl.Color)
  end
  panel.Cog.OnCursorEntered = function(pnl)
    panel:OnCursorEntered()
    pnl:LerpColor("Color", XeninUI.Theme.Accent)
  end
  panel.Cog.OnCursorExited = function(pnl)
    panel:OnCursorExited()
    pnl:LerpColor("Color", Color(174, 174, 174))
  end
  panel.Cog.DoClick = function(pnl)
    local vis = !panel.Settings:IsVisible()
    panel.Settings:SetVisible(vis)

    if vis then
      panel.Settings.JustOpened = true
      panel.Settings:SetTall(panel.Settings.Rows:GetChildSize())
      local aX, aY = panel:LocalToScreen()
      aX = aX + panel:GetWide()
      panel.Settings:SetPos(aX, aY)
      panel.Settings:MakePopup()
    end
  end

  panel.Settings = vgui.Create("EditablePanel")
  panel.Settings:SetZPos(100)
  panel.Settings:SetDrawOnTop(true)
  panel.Settings:SetVisible(false)
  panel.Settings:SetTall(0)
  panel.Settings:SetWide(self:Call("gridSettingsWidth", 250))
  panel.Settings.Paint = function(pnl, w, h)
    XeninUI:DrawRoundedBoxEx(6, 0, 0, w, h, XeninUI.Theme.Background, false, true, false, true)

    local bottomLeft = panel:GetTall() < (h * 0.95)
    XeninUI:MaskInverse(function()
      XeninUI:DrawRoundedBoxEx(6, 1, 1, w - 2, h - 2, XeninUI.Theme.Background, false, true, bottomLeft, true)
    end, function()
      XeninUI:DrawRoundedBoxEx(6, 0, 0, w, h, panel.OutlineColor, false, true, bottomLeft, true)
    end)
  end
  panel.Settings.Think = function(pnl)

    local focus = pnl:HasHierarchicalFocus()
    if (focus) then return end
    if pnl.JustOpened then
      pnl.JustOpened = false

      return
    end

    pnl:SetVisible(false)
    if (panel:IsHovered() or panel:IsChildHovered()) then return end
    panel:OnCursorExited()
  end

  panel.Settings.Rows = panel.Settings:Add("Xenin.Configurator.Admin.Entity.Row.Settings")
  panel.Settings.Rows:DockMargin(4, 4, 4, 4)
  panel.Settings.Rows:AddSettings(panel.Entity or self.BaseEnt)
  panel.Settings.Rows.Parent = panel
  panel.Settings.Rows:Dock(FILL)
  panel.Settings.Rows.Paint = function() end
  panel.Settings.Rows.GetChildSize = function(pnl)
    local height = 0
    local size = 0
    for i, v in ipairs(pnl.Settings) do
      if (!v:IsVisible()) then continue end

      size = size + 1
      height = height + v:GetTall()
    end
    height = height - (size * 3)

    return height + 8
  end

  panel.OnRemove = function(pnl)
    if (!IsValid(panel.Settings)) then return end

    panel.Settings:Remove()
  end
  panel.PerformLayout = function(pnl, w, h)
    pnl.Cog:SetSize(24, 24)
    pnl.Cog:AlignTop(4)
    pnl.Cog:AlignRight(4)
  end


  self:Call("gridPostInit", function() end, panel)
end

function PANEL:CreateContent()
  local data = self.Template.getAllEntities()
  local content = self.Template.getGridContent()

  for i, v in ipairs(content) do
    local tbl = self:Call("getGridData", function(tbl)
      return tbl end, v)
    if (!tbl) then continue end

    self:CreateColumn(tbl, i)
  end
end

vgui.Register("Xenin.Configurator.Admin.EntityGrid", PANEL, "Xenin.Configurator.Admin.Panel")

--PATH addons/xenin_the_xenin_framework_1900562881/lua/xeninui/libs/configurator/ui/entities/entity_list_row.lua:
local PANEL = {}

function PANEL:OnDelete() end
function PANEL:DoClick() end

function PANEL:SetEntity(entity, template, isList)
  local __lauxi0 = template.getListView(entity, isList)
  assert(__lauxi0 ~= nil, "cannot destructure nil value")
  local display, title, subtitle = __lauxi0.display, __lauxi0.title, __lauxi0.subtitle

  self.Entity = entity
  self.Title = markup.Parse("<font=Xenin.Configurator.Row.Title><color=255,255,255>" .. tostring(title) .. "</color></font>")
  self.Subtitle = markup.Parse("<font=Xenin.Configurator.Row.Subtitle><color=174,174,174>" .. tostring(subtitle) .. "</color></font>")
  self:SetDisplay(display)
end

function PANEL:Init()
  self.Edit = self:Add("XeninUI.ButtonV2")
  self.Edit:SetText("Edit")
  self.Edit:SetFont("Xenin.Configurator.Row.Title")
  self.Edit:SetSolidColor(XeninUI.Theme.GreenDark)
  self.Edit:SetRoundness(6)
  self.Edit.DoClick = function(pnl)
    self:DoClick()
  end

  self.Delete = self:Add("XeninUI.ButtonV2")
  self.Delete:SetVisible(false)
  self.Delete:SetText("")
  self.Delete:SetSolidColor(XeninUI.Theme.Red)
  self.Delete:SetRoundness(6)
  self.Delete.DoClick = function(pnl)
    self:OnDelete()
  end
  self.Delete.PaintOver = function(pnl, w, h)
    local size = h * 0.5
    surface.SetMaterial(XeninUI.Materials.CloseButton)
    surface.SetDrawColor(color_white)
    surface.DrawTexturedRect(w * 0.5 - size * 0.5 + 1, h * 0.5 - size * 0.5, size, size)
  end
end

function PANEL:Think()
  if (self.DeleteDisabled) then return end

  self.Delete:SetVisible(self:IsHovered() or self:IsChildHovered())
end

function PANEL:SetDisplay(display)
  if (!display) then return end
  if (IsValid(self.Display)) then return end

  self.Display = self:Add("SpawnIcon")
  self.Display:Dock(LEFT)
  self.Display:SetWide(56)
  self.Display.Model = display
  self.Display:SetMouseInputEnabled(false)


  timer.Simple(0, function()
    self.Display:SetModel(self.Display.Model)
  end)
end

function PANEL:Paint(w, h)
  XeninUI:DrawRoundedBox(6, 0, 0, w, h, XeninUI.Theme.Navbar)

  local x = h + 4

  self.Title:Draw(x, h * 0.5 + 1, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
  self.Subtitle:Draw(x, h * 0.5 + 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
end

function PANEL:PerformLayout(w, h)
  self.Edit:SizeToContentsX(24)
  self.Edit:SizeToContentsY(8)
  self.Edit:AlignRight(12)
  self.Edit:CenterVertical()

  self.Delete:SetSize(self.Edit:GetTall(), self.Edit:GetTall())
  self.Delete:AlignRight(w - self.Edit.x + 12)
  self.Delete:CenterVertical()
end

vgui.Register("Xenin.Configurator.Admin.EntityList.Row", PANEL)

--PATH addons/xenin_the_xenin_framework_1900562881/lua/xeninui/libs/players/ui/frame.lua:
local PANEL = {}

function PANEL:Init()
  if IsValid(XeninUI.Players.Frame) then
    XeninUI.Players.Frame:Remove()
  end

  XeninUI.Players.Frame = self

  self:SetTitle("Xenin Hub")
  self:MakePopup()

  self.Sidebar = self:Add("XeninUI.SidebarV2")
  self.Sidebar:Dock(LEFT)
  self.Sidebar:SetBody(self)
  self.Sidebar:CreateDivider()
  self.Sidebar:CreatePanel("Notifications", nil, "XeninUI.Players.Notifications", "8JweIot")
  self.Sidebar:SetActiveByName("Notifications")

  self.Player = self.Sidebar:Add("XeninUI.Sidebar.Player")
  self.Player:Dock(TOP)
end

function PANEL:PerformLayout(w, h)
  self.BaseClass.PerformLayout(self, w, h)

  self:SetSize(XeninUI.Frame.Width, XeninUI.Frame.Height)
  self:Center()

  local sw = 0
  for i, v in ipairs(self.Player.Text.Rows) do
    surface.SetFont(v.font)
    local tw = surface.GetTextSize(v.text)

    sw = math.max(sw, 68 + tw + 68 * 0.5 + 8)
  end
  for i, v in ipairs(self.Sidebar.Sidebar) do
    surface.SetFont("XeninUI.SidebarV2.Name")
    local nameTw = surface.GetTextSize(v.Name or "")
    surface.SetFont(v.DescFont)
    local descTw = surface.GetTextSize(v.Desc or "")

    local tw = math.max(nameTw, descTw) + 12 + 8
    if v.Icon then
      tw = tw + 68
    end

    sw = math.max(sw, tw)
  end
  self.Sidebar:SetWide(sw)
  self.Sidebar:SetTall(56)

  self.Player:SetTall(68)
end

vgui.Register("XeninUI.Players", PANEL, "XeninUI.Frame")

--PATH addons/xenin_the_xenin_framework_1900562881/lua/xeninui/libs/players/ui/notifications/main.lua:
local PANEL = {}

XeninUI:CreateFont("XeninUI.Players.Notifications", 20)

function PANEL:Init()
  self:DockPadding(16, 16, 16, 16)

  self.Top = self:Add("Panel")
  self.Top:Dock(TOP)

  self.Top.Title = self.Top:Add("DLabel")
  self.Top.Title:Dock(LEFT)
  self.Top.Title:SetFont("XeninUI.Players.Notifications")
  self.Top.Title:SetTextColor(Color(222, 222, 222))
  self.Top.Title:SetText("Latest Notifications")

  self.Scroll = self:Add("XeninUI.Scrollpanel.Wyvern")
  self.Scroll:Dock(FILL)
  self.Scroll:DockMargin(0, 8, 0, 0)

  self.Layout = self.Scroll:Add("DListLayout")
  self.Layout:Dock(TOP)
  self.Layout:DockMargin(0, 0, 8, 0)

  self.Loading = true
  hook.Add("XeninUI.Players.GotNotifications", self, function(self, notifications)
    if self.Loading then
      self:ClearNotifications()
      for i, v in ipairs(notifications) do
        self:AddNotification(v)
      end
      self.Loading = false
      self:InvalidateLayout()
    end
  end)

  self:GetNotifications()

  self:AddTimer("XeninUI.Players.Notifications.UpdateRead", 1, 0, function()
    if (!IsValid(self)) then return end

    local notificationPanels = self:GetNotificationsInView()
    local notifications = {}
    for i, v in ipairs(notificationPanels) do
      if (!v.Notification) then continue end
      if (v.Notification.readAt) then continue end

      v.Notification.readAt = os.time()
      v.BackgroundColor = XeninUI.Theme.Primary

      table.insert(notifications, v.Notification.id)
    end

    if (#notifications == 0) then return end
    XeninUI.Players.Network:sendReadNotifications(notifications)
  end)
end

function PANEL:GetNotifications()
  XeninUI.Players.Network:sendReceiveNotifications()
end

function PANEL:ClearNotifications()
  self.Layout:Clear()
end

function PANEL:AddNotification(notification)
  local row = self.Layout:Add("XeninUI.Players.Notifications.Row")
  row:Dock(TOP)
  row:DockMargin(0, 0, 0, 4)
  row:SetNotification(notification)
end

function PANEL:PerformLayout(w, h)
  self.Top.Title:SizeToContents()

  for i, v in ipairs(self.Layout:GetChildren()) do
    v:SetTall(v:CalculateHeight())
    print(v:IsVisible())
  end
end

function PANEL:Paint(w, h)
  if self.Loading then
    draw.SimpleText("Loading", "XeninJC.Admin.Queue.Loading", w * 0.5, h * 0.5 - h / 8, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
    XeninUI:DrawLoadingCircle(w * 0.5, h * 0.5 + 16, h / 4, XeninUI.Theme.Accent)
  end
end

function PANEL:GetNotificationsInView()
  local sH = self.Scroll:GetTall()
  local sY = self.Scroll.VBar.Scroll
  local sB = sH + sY

  local notifications = {}
  for i, v in ipairs(self.Layout:GetChildren()) do
    assert(v ~= nil, "cannot destructure nil value")
    local y = v.y
    if (y > sB) then continue end
    if (sY > y) then continue end
    if (sB < y) then continue end
    if (!v.Notification) then continue end
    if (v.Notification.readAt) then continue end

    table.insert(notifications, v)
  end

  return notifications
end

vgui.Register("XeninUI.Players.Notifications", PANEL)

--PATH addons/xenin_the_xenin_framework_1900562881/lua/xeninui/elements/slider.lua:
local PANEL = {}

AccessorFunc(PANEL, "m_sliderColor", "Color")
AccessorFunc(PANEL, "m_max", "Max")
AccessorFunc(PANEL, "m_min", "Min")
AccessorFunc(PANEL, "m_sliderHeight", "Height")

function PANEL:Init()
  self:SetText("")

  self:SetMin(0)
  self:SetMax(10)
  self:SetHeight(2)
  self:SetColor(XeninUI.Theme.Accent)
  self.fraction = 0

  self.grip = vgui.Create("DButton", self)
  self.grip:SetText("")
  self.grip:NoClipping(true)
  self.grip.xOffset = 0
  self.grip.startSize = self:GetHeight() * 4
  self.grip.size = self.grip.startSize
  self.grip.outlineSize = self.grip.startSize
  self.grip.Paint = function(pnl, w, h)
    XeninUI:DrawCircle(pnl.startSize, h * 0.5, pnl.outlineSize, 45, ColorAlpha(self:GetColor(), 30), 0)

    XeninUI:DrawCircle(pnl.startSize, h * 0.5, pnl.size, 45, self:GetColor(), 0)
  end
  self.grip.OnCursorEntered = function(pnl)
    pnl:Lerp("outlineSize", pnl.startSize * 2)
  end
  self.grip.OnCursorExited = function(pnl)
    pnl:Lerp("outlineSize", pnl.startSize)
  end
  self.grip.OnMousePressed = function(pnl)
    pnl.Depressed = true

    pnl:MouseCapture(true)

    pnl:LerpWidth(pnl:GetTall() * 2)
  end
  self.grip.OnMouseReleased = function(pnl)
    pnl.Depressed = nil



    pnl:LerpWidth(pnl.startSize * 2)
    pnl:MouseCapture(false)
  end
  self.grip.OnCursorMoved = function(pnl, x, y)
    if (!pnl.Depressed) then return end

    local x, y = pnl:LocalToScreen(x, y)
    x, y = self:ScreenToLocal(x, y)

    local w = self:GetWide()
    local newX = math.Clamp(x / w, 0, 1)
    self.fraction = newX

    self:OnValueChanged(self.fraction)
    self:InvalidateLayout()
  end
  self.grip:SetWide(self.grip.startSize * 2)
end

function PANEL:OnMousePressed()
  local x, y = self:CursorPos()
  local w = self:GetWide() + (self:GetHeight() * 2)
  local newX = math.Clamp(x / w, 0, 1)

  self.fraction = newX
  self:OnValueChanged(self.fraction)
  self:InvalidateLayout()
end

function PANEL:OnValueChanged(fraction) end

function PANEL:Paint(w, h)
  local height = self:GetHeight()
  local y = h * 0.5 - height * 0.5

  surface.SetDrawColor(ColorAlpha(self:GetColor(), 50))
  surface.DrawRect(height, y, w - (height * 2), height)

  local width = self.fraction * (w - (self:GetHeight() * 0.5))
  surface.SetDrawColor(self:GetColor())
  surface.DrawRect(height, y, width, height)
end

function PANEL:PerformLayout(w, h)
  self.grip:SetTall(h)
  self.grip:SetPos(self.fraction * (w - self.grip.size - (self:GetHeight() * 0.5)))
end

vgui.Register("XeninUI.Slider", PANEL, "DButton")

--PATH addons/battlepass/lua/battlepass/challenges/zakazi_5_chelovek.lua:
local CHALLENGE = BATTLEPASS:CreateTemplateChallenge()
CHALLENGE:SetName("Закажи 5 человек")
CHALLENGE:SetIcon("battlepass/challenges/shipments.png") -- <- ??
CHALLENGE:SetDesc("")
CHALLENGE:SetProgressDesc("---")
CHALLENGE:SetFinishedDesc("---")
CHALLENGE:SetID("zakazi_5_chelovek")
CHALLENGE:SetPremium(true)

CHALLENGE:AddHook("playerRequestedHit", function(self, ply, _ply)
  if IsValid( _ply ) and ply == _ply and _ply.BattlePass.Owned.owned then
    self:AddProgress(1)
    self:NetworkProgress()
  end
end)

BATTLEPASS:RegisterChallenge(CHALLENGE)
--PATH addons/battlepass/lua/battlepass/challenges/zarobi_100000_za_prodaj_meta.lua:
local CHALLENGE = BATTLEPASS:CreateTemplateChallenge()
CHALLENGE:SetName("Зароби 100000$ за продаж мету.")
CHALLENGE:SetIcon("battlepass/challenges/shipments.png") -- <- ??
CHALLENGE:SetDesc("")
CHALLENGE:SetProgressDesc("---")
CHALLENGE:SetFinishedDesc("---")
CHALLENGE:SetID("zarobi_100000_za_prodaj_meta")

CHALLENGE:AddHook("playerMethbuyer_BattlePass", function(self, ply, _ply, sum)
  print('1')
  --print(self, ply, _ply, sum)
  if IsValid( _ply ) and ply == _ply then
    self:AddProgress(sum)
    self:NetworkProgress()
  end
end)

BATTLEPASS:RegisterChallenge(CHALLENGE)
--PATH addons/battlepass/lua/battlepass/rewards/money.lua:
local REWARD = BATTLEPASS:CreateReward()

function REWARD:CanUnlock(ply, reward)
	return true
end

function REWARD:GetTooltip(reward)
	return reward
end

local materialid = BATTLEPASS.Materials
function REWARD:GetModel(reward)
	return materialid.money3
end

function REWARD:GetName(reward)
	return string.Comma(reward, '.') .. '$'
end

function REWARD:Unlock(ply, reward)
	if (SERVER) then
		ply:addMoney(reward)
	end
end

REWARD:Register("money")
--PATH addons/battlepass/lua/battlepass/rewards/perm_var.lua:
local REWARD = BATTLEPASS:CreateReward()

function REWARD:CanUnlock(ply, reward)
	return true
end

function REWARD:GetTooltip(reward)
	return ""
end

function REWARD:GetModel()
	return ".mdl"
end

function REWARD:GetName(reward)
	return "Unknown name"
end

function REWARD:Unlock(ply, reward)
	BATTLEPASS:SetPermanentVariable(ply, reward, true)
end

REWARD:Register("perm_var")


--PATH addons/battlepass/lua/battlepass/ui/button.lua:
local PANEL = {}

AccessorFunc(PANEL, "m_disableHoverDraw", "DisableHoverDraw")

function PANEL:Init()
  self.Hover = 0
end

function PANEL:PaintOver(w, h)
  if self:IsHovered() or self.Depressed then
    self.Hover = self.Hover + (1 - self.Hover) * 7 * FrameTime()
  else
    self.Hover = self.Hover + (0 - self.Hover) * 7 * FrameTime()
  end

  if (!self:GetDisableHoverDraw()) then
    surface.SetDrawColor(255, 255, 255, 20 * self.Hover)
    surface.DrawRect(0, 0, w, h)
  end
end


vgui.Register("BATTLEPASS_Button", PANEL, "DButton")

--PATH addons/________anticrash/lua/z_anticrash/client/cl_entityvision.lua:
-- [[ CREATED BY ZOMBIE EXTINGUISHER ]]

CL_ANTICRASH.ENTVISION = {}

local wireframeMat = Material( "models/wireframe" )
local chamsColor = Color(255,0,255)
local chamsColVector = Vector(chamsColor.r/1, chamsColor.g/1, chamsColor.b/1)

local viewingPlayers = {}
local globalVision = false

function CL_ANTICRASH.ENTVISION.AddPlayer(ply)

	if LocalPlayer():IsSuperAdmin() then
		viewingPlayers[ply] = true
	end
	
end

function CL_ANTICRASH.ENTVISION.RemovePlayer(ply)

	if LocalPlayer():IsSuperAdmin() then
		viewingPlayers[ply] = nil
	end

end 

function CL_ANTICRASH.ENTVISION.HasPlayer(ply)
	return viewingPlayers[ply] ~= nil
end


function CL_ANTICRASH.ENTVISION.SetGlobalVision(bool)

	if LocalPlayer():IsSuperAdmin() then
		globalVision = bool
	end

end

function CL_ANTICRASH.ENTVISION.GetGlobalVision()
	return globalVision
end

local function EntityVision()

	if table.Count(viewingPlayers) == 0 and !globalVision then return end

	cam.Start3D()
	
		render.SuppressEngineLighting(true)
		render.MaterialOverride(wireframeMat)
		render.SetColorModulation (chamsColVector.x, chamsColVector.y, chamsColVector.z)
		
		for _, ent in ents.Iterator() do

			local creator = ent:CPPIGetOwner()
			
			if creator and (viewingPlayers[creator] or globalVision) then
				ent:DrawModel()
			end
			
		end
	
		render.MaterialOverride()
		render.SuppressEngineLighting(false)
		
	cam.End3D()	
	
end
hook.Add("HUDPaint", "cl_anticrash_EntityVision", EntityVision)

--PATH addons/__advdupe2/lua/advdupe2/file_browser.lua:
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

vgui.Register("advdupe2_browser", PANEL, "Panel")

--PATH addons/__advdupe2/lua/advdupe2/sh_codec_legacy.lua:
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
--PATH addons/____bricks_gangs/lua/bricks_server/languages/bricks_gangs/polish.lua:
BRICKS_SERVER.Func.AddLanguageStrings( "polish", {
    ["gang"] = "Gang",
    ["gangNew"] = "Nowy Gang",
    ["gangRequestCooldown"] = "Poczekaj prosze, zanim złożysz prośbe o nowy gang!",
    ["gangRequestDataCooldown"] = "Poczekaj prosze, zanim złożysz prośbe o informacje o kolejnym gangu!",
    ["gangNewUpgrade"] = "Nowe ulepszenie",
    ["gangUpgradeTierEdit"] = "%s - Tier %d",
    ["gangNewAchievement"] = "Nowe osiągnięcie",
    ["gangNewTerritory"] = "Nowe terytorium",
    ["gangRewardTime"] = "Czas nagrody",
    ["gangRewardTimeQuery"] = "Jak często okupujący gang powinien dostawać nagrody?",
    ["gangRewards"] = "Nagrody",
    ["gangNewLeaderboard"] = "Nowa tablica wyników",
    ["gangRankQuery"] = "Jaką range chciałbyś im ustawić?",
    ["gangPlayerAlreadyRank"] = "Gracz ma obecnie tą range!",
    ["gangInvalidRank"] = "Niepoprawna ranga.",
    ["gangKick"] = "Kick",
    ["gangKickConfirm"] = "Jesteś pewien ,że chcesz wyrzucić członka?",
    ["gangSetOwner"] = "Ustaw właściciela",
 
    ["gangInbox"] = "GANG INBOX",
    ["gangNoNotifications"] = "Nie masz żadnych powiadomień!",
    ["gangTimeAgo"] = "%s temu",
    ["gangNotification"] = "Powiadomienia odnośnie gangu",
    ["gangNotificationHeader"] = "Jaki ma być nagłówek powiadomienia?",
    ["gangAdminNotification"] = "Powiadomienia admina",
    ["gangNotificationBody"] = "Jaka ma być treść powiadomienia?",
    ["gangAdminNotificationSent"] = "Wyślij powiadomienie admina gangu do %s!",
 
    ["gangVariables"] = "Zmienne gangu",
    ["gangUpgrades"] = "Ulepszenia gangu",
    ["gangAchievements"] = "Osiągnięcia gangu",
    ["gangTerritories"] = "Terytoria gangu",
    ["gangLeaderboards"] = "Wynik gangu",
 
    ["gangClaimedAchievement"] = "Pomyślnie odebrano nagrody za osiągnięcie!",
    ["gangAlreadyAssociation"] = "Twój gang ma już tego typu powiązania z innym gangiem!",
    ["gangAlreadySentAssociation"] = "Twój gang już im wysłał zaproszenie do sojuszu!",
    ["gangAssociationSent"] = "Oferta sojuszu wysłana!",
    ["gangAssociationAccepted"] = "Zaakceptowano oferte soujusz!",
    ["gangNoAssociation"] = "Twój gang nie ma żadnego powiązanai z tym gangiem!",
    ["gangAssociationDissolved"] = "Sojusz zerwano!",
 
    ["gangOwner"] = "Właściciel",
    ["gangOfficer"] = "Officer",
    ["gangMember"] = "Członek",
 
    ["gangCannotDeposit"] = "Nie możesz zdepozytować tej broni!",
    ["gangStorageFull"] = "Magazyn twojego gangu jest pełny!",
    ["gangDepositedItem"] = "You have deposited an item into your gang's storage!",
    ["gangDroppedItem"] = "Wyrzucono 1 przedmiot z magazynu gangu.",
    ["gangUsedItem"] = "Użyto 1 przedmiotu z magazynu gangu.",
    ["gangCantUse"] = "Nie możesz tego użyć!",
 
    ["gangKicked"] = "Zostałeś wykopany z gangu %s!",
    ["gangAlreadyIn"] = "Już jesteś w gangu!",
    ["gangNameLength"] = "Nazwagangu nie może być dłuższa niż %d liter!",
    ["gangIconLength"] = "Ikona gangu URL nie może być dłuższy %d liter!",
    ["gangCreatedFor"] = "Twój nowy gang został stworzony na %s!",
    ["gangCreated"] = "Twój nowy gang został stworzony!",
    ["gangCreationNoMoney"] = "Nie masz wystarczjąco pieniędzy, potrzebujesz %s!",
    ["gangWaitBeforeSaving"] = "Prosze poczekaj %d zanim zapiszesz swoje zmiany!",
    ["gangRolesUpdated"] = "	Role w gangu zuaktualizowane!",
    ["gangCannotTarget"] = "You cannot target this player!",
    ["gangRankNotExists"] = "Ta ranga nie istnieje!",
    ["gangCantPromote"] = "	Nie możesz awansować kogoś z wyższą rangą niż twoją!",
    ["gangRankSet"] = "Ranga ustawiona!",
    ["gangRankSetFail"] = "Niepowodzenie w ustawianiu rangi!",
    ["gangSettingsUpdated"] = "Ustawienia gangu zaktualizowane!",
    ["gangPlayerKicked"] = "Wyrzucono %s z twojego gangu!",
    ["gangPlayerKickError"] = "Bład przy wyrzucaniu członka gangu!",
    ["gangWaitBeforeInvite"] = "Prosze poczekaj 5 sekund zanim zaprosisz kolejną osobe!",
    ["gangPlayerOffline"] = "Ten gracz nie jest już online!",
    ["gangPlayerAlreadyInvited"] = "Ten gracz już został zaproszony!",
    ["gangPlayerInvited"] = "Zaprosiłeś %s do swojego gangu!",
    ["gangInviteReceived"] = "Zostałeś zaproszony do gangu %s! wpisz !gang aby zaakceptować.",
    ["gangLeaveCurrent"] = "Musisz pierw opuścić swój gang!",
    ["gangReachedMemberLimit"] = "Gang osiągnąl maksymalną liczbe członków!",
    ["gangJoined"] = "Pomyślnie dołączono %s!",
    ["gangNotEnoughMoney"] = "Nie masz wystarczająco pieniędzy!",
    ["gangDepositedMoney"] = "Pomyślnie wpłacomo %s do twojego gangu!",
    ["gangWithdrewMoney"] = "Pomyślnie wypłacono %s z twojego gangu!",
    ["gangDisbanded"] = "	Pomyśłnie rozwiązano %s!",
    ["gangOwnershipTransfered"] = "Zmieniono posiadacza gangu z %s na %s!",
    ["gangLeft"] = "Odeszłeś od %s!",
 
    ["gangTerritoryCaptured"] = "Twój gang zajął %s terytorium!",
    ["gangIncorrectLevel"] = "Twój gang nie jest na wystarczającym poziomie by kupić to ulepszenie!",
    ["gangIncorrectGroup"] = "Nie jesteś uprawnioną grupą by kupić to ulepszenie!",
    ["gangUpgradeBought"] = "Ulepszenie zakupione za %s!",
    ["gangNotEnoughFunds"] = "Twój gang nie ma wystarczająco pieniędzy by kupić to ulepzenie!",
 
    ["gangAddAchievement"] = "Dodaj osiągnięcie",
    ["gangNewAchievementType"] = "Jaki powinien być typ nowego osiągnięcia?",
    ["gangAddLeaderboard"] = "Dodaj ranking",
    ["gangNewLeaderboardType"] = "Jaki powinien być nowy typ tabeli wyników?",
    ["gangAddTerritory"] = "Dodaj terytorium",
    ["gangAddTier"] = "Dodaj poziom",
    ["gangTierX"] = "Poziom %d",
    ["gangNewUpgradeType"] = "Jaki powinien byc nowy typ ulepszenia?",
    ["gangNewUpgradeDesc"] = "Opis nowego ulepszenia.",
 
    ["gangDepositMenu"] = "Menu wpłat gangu",
    ["gangDepositInventoryQuery"] = "Czy chcesz zdepozytować %s z twojego ekwipunku?",
    ["gangDepositPlayerQuery"] = "Czy chcesz zdepozytować %s z wyposażenia?",
    ["gangNoDepositItems"] = "Nie masz żadnych itemów które możesz zdepozytować!",
 
    ["gangMenu"] = "Menu gangu",
    ["gangNone"] = "Brak gangu",
    ["gangID"] = "ID: %d",
    ["gangDashboard"] = "Dashboard",
    ["gangMembers"] = "Członkowie",
    ["gangStorage"] = "Magazyn",
    ["gangUpgrades"] = "Ulepszenia",
    ["gangBalance"] = "Środki",
    ["gangAchievements"] = "Osiągnięcia",
    ["gangAssociations"] = "Sojusze",
    ["gangLeaderboards"] = "Tablica wyników",
    ["gangTerritories"] = "Terytorium",
    ["gangRanks"] = "Rangi",
    ["gangCreate"] = "Stwóz gang",
    ["gangProgress"] = "Progres: %s",
 
    ["gangNoneFound"] = "Nie znaleziono gangów pasujących do Twojego wyszukiwania.",
    ["gangMemberCount"] = "%d/%d członków",
    ["gangFailedToLoad"] = "Niepowodzenie w wczytywaniu danych!",
    ["gangSetRank"] = "Ustaw range",
    ["gangDissolveAssociation"] = "Czy chciałbyś rozwiązać to stowarzyszenie?",
    ["gangAssociationStatus"] = "Status: %s",
    ["gangNeutral"] = "Neutral",
    ["gangCreateString"] = "Stwórz gang po %s",
    ["gangName"] = "Nazwa gangu:",
    ["gangIcon"] = "Icon URL:",
 
    ["gangInformation"] = "INFORMACJE GANGU",
    ["gangChat"] = "CHAT GANGU",
    ["gangMessage"] = "Wiadomości gangu",
    ["gangActions"] = "Akcje gangu",
    ["gangDepositMoney"] = "Wpłać pieniądze",
    ["gangDepositMoneyQuery"] = "Ile chciałbyś wpłacić?",
    ["gangDepositMoneyLess"] = "Nie możesz zdepozytować mniej niż %s!",
    ["gangDepositMoneyMuch"] = "Środki twojego gangu nie pokryją tego, musisz ulepszyć środki gangu!",
    ["gangWithdrawMoney"] = "Wypłać pieniądze",
    ["gangWithdrawMoneyQuery"] = "Ile chciałbyś wypłacić?",
    ["gangWithdrawMoneyLess"] = "Nie możesz wypłacić mniej niż %s!",
    ["gangWithdrawMoneyMuch"] = "Twój gang nie ma wystarczających funduszy!",
    ["gangInvitePlayer"] = "Zaproś gracza",
    ["gangInvitePlayerQuery"] = "Jakiego gracza chciałbyś zaprosić?",
    ["gangDisband"] = "Rozwiąż gang",
    ["gangDisbandQuery"] = "Usunięcie gangu jest pernamentne, wpisz %s aby go usunąć.",
    ["gangTransfer"] = "Zamień włąściciela",
    ["gangTransferQuery"] = "Komu chciałbyś przekazać opieke nad gangiem?",
    ["gangLeave"] = "Opuść gang",
    ["gangLeaveQuery"] = "Jetseś pewny ,że chcesz opuścić gang?",
    ["gangMemberUpper"] = "CZŁONKOWIE GANGU",
    ["gangHighestRank"] = "Najwyższa ranga",
    ["gangLowestRank"] = "Najniższa ranga",
 
    ["gangUnsavedChanges"] = "Uwaga! Masz niezapisane zmiany.",
    ["gangSaveChanges"] = "Zapisz zmiany",
    ["gangReset"] = "Reset",
    ["gangRanksUpper"] = "RANGI GANGU",
    ["gangNewRank"] = "Rangi gangu",
    ["gangRankName"] = "Nazwa rangi",
    ["gangRankColor"] = "Rank Color",
    ["gangClearPerms"] = "Wyczyść uprawnienia",
    ["gangDeleteRank"] = "Usuń range",
    ["gangDeleteRankQuery"] = "Jesteś pewien że chcesz usunąć tą range?",
 
    ["gangStorageUpper"] = "MAGAZYN GANGU",
    ["gangStorageProgress"] = "Miejsce %d/%d",
    ["gangClaimed"] = "odebrane",
    ["gangUnclaimed"] = "nieodebrane",
    ["gangClaimedAgo"] = "Odebrane %s temu",
    ["gangRewardsEvery"] = "Biorąc pod uwagę każdy %s",
    ["gangBuyUpgrade"] = "Czy chcesz kupić to ulepszenie za %s?",
    ["gangUpgradeTier"] = "Ulepsz poziom %d/%d",
    ["gangCurrent"] = "Obecne: %s",
    ["gangNext"] = "Następny poziom: %s",
 
    ["gangTerritoryUpper"] = "TERYTORIUM",
    ["gangCaptured"] = "ZAJĘTY",
    ["gangTerritoryAlready"] = "Twój gang już zajął te terytorium!",
    ["gangCaptureFail"] = "Odsunąłeś się za daleko lub zginąłeś, złajmowanie nie powiodło się!",
    ["gangTerritoryPlaced"] = "Terytorium zostało wyznaczone.",
    ["gangInvalidTerritory"] = "Niewłaściwy teren, wybierz właściwy teren na menu narzędzi.",
    ["gangTerritoryRemoved"] = "Terytorium usunięte.",
    ["gangTerritoryRemoveFail"] = "Możesz używać tego narzędzia by usuwać/tworzyć an terytoria.",
    ["gangTerritoryDesc"] = "Tworzy i usuwa terytoria na serwerach Bricks, LeftClick - ustaw, RightClick - usuń.",
    ["gangTerritory"] = "Terytoria",
    ["gangTerritoryPlacer"] = "Ustawiacz terytoriów",
    ["gangTerritoryDescSmall"] = "Umieszcza i usuwa terytoria z Brick's Server.",
    ["gangTerritoryInstructions"] = "LeftClick - umieść, RightClick - usuń.",
 
    ["gangSettings"] = "Ustawa",
    ["gangManagement"] = "Zarządzanie",
    ["gangChatLower"] = "Czat gangu",
    ["gangDepositItems"] = "Wpłać przedmioty",
    ["gangWithdrawItems"] = "wypłać przedmioty",
    ["gangViewStorage"] = "Zobacz magazyn",
    ["gangEditRoles"] = "Edytuj role",
    ["gangEditSettings"] = "Edytuj ustawienia",
    ["gangInvitePlayers"] = "Zaproś graczy",
    ["gangKickPlayers"] = "Wyrzuć graczy",
    ["gangChangeRank"] = "Zmień range graczy",
    ["gangPurchaseUpgrades"] = "Kup ulepszenie",
    ["gangAcceptDeclineInbox"] = "Akceptuj/odrzuć powiadomienia w skrzynce",
    ["gangAssociationSend"] = "Wyślij propozycje sojuszu",
    ["gangAssociationAccept"] = "Akceptuj ",
    ["gangSendChatMessages"] = "Wyślij wiadomość głosową",
    ["gangMaxMembers"] = "Max Members",
    ["gangMaxBalance"] = "Max Balance",
    ["gangStorageSlots"] = "Sloty w magazynie",
    ["gangXSlots"] = "%d Slotów",
    ["gangSlots"] = "Sloty",
    ["gangIncreasedHealth"] = "Zwiększone życie",
    ["gangExtraHealth"] = "Dodatkowe życie",
    ["gangXHP"] = "+%d HP",
    ["gangIncreasedArmor"] = "Zwiększony pancerz",
    ["gangXAP"] = "+%d AP",
    ["gangExtraArmor"] = "Dodatkowy pancerz",
    ["gangIncreasedSalary"] = "Increased Salary",
    ["gangExtraSalary"] = "Extra Salary",
    ["gangPermWeapon"] = "Pernamenta broń",
    ["gangWeapon"] = "Broń",
    ["gangBalanceFull"] = "Środki Gangu",
    ["gangMembersFull"] = "Członkowie Gangu",
    ["gangStorageFull"] = "Magazyn Gangu",
    ["gangItems"] = "Przedmioty",
    ["gangItem"] = "Przedmiot",
    ["gangLevel"] = "Poziom Gangu",
    ["gangInvite"] = "Zaproszenia gangu",
    ["gangInviteReceivedInbox"] = "Zostałeś zaproszony do gangu %s!",
    ["gangAssociationInvite"] = "Zaproszenie do sojuszu",
    ["gangAssociationInviteInbox"] = "Gang %s zaproponował sojusz '%s' z twoim gangiem!",
    ["gangAssociationCreated"] = "Sojusz stworzony",
    ["gangAssociationCreatedInbox"] = "Twój gang ma teraz sojusz '%s' z gangiem %s!",
    ["gangAssociationDissolved"] = "sojusz rozwiązany",
    ["gangAssociationDissolvedInbox"] = "Twój sojusz z gangiem %s został rozwiązany!",
    ["gangInboxAchievement"] = "Gang Achievement",
    ["gangInboxAchievementCompleted"] = "Twój gang zdobył '%s' osiągnięcie!",
    ["gangInboxAchievementCompletedReward"] = "Twój gang zdobył '%s' osiągnięcie, nagrody: %s!",
    ["gangExperienceFull"] = "Doświadczenie gangu",
    ["gangJobWhitelist"] = "Lista prac",
    ["gangJobs"] = "Prace",
    ["gangJobsSelect"] = "Wybierz drużyny, na których znajdują się gracze na białej liście.",
    ["gangStorageItems"] = "Przedmioty w magazynie",
    ["gangAllyRequest"] = "Czy na pewno chcesz poprosić o sojusz z tym gangiem?",
    ["gangWarRequest"] = "Czy napewno chcesz zacząć wojne z tym gangiem?",
    ["gangSetLevel"] = "Ustaw poziom",
    ["gangSetLevelQuery"] = "Jaki powinien być nowy poziom gangu?",
    ["gangSetLevelMsg"] = "Ustawiono poziom gangu z %s to %d!",
    ["gangAddExperience"] = "Dodaj XP",
    ["gangAddExperienceQuery"] = "How much experience would you like to add to the gang?",
    ["gangAddExperienceMsg"] = "Pomyśłnie dodano %s punktó XP do gangu %s!",
    ["gangSetBalance"] = "Ustaw środki",
    ["gangSetBalanceQuery"] = "Jakie powiiny być środki gangu?",
    ["gangSetBalanceMsg"] = "Zmieniono środki gangu z %s na %s!",
    ["gangAddBalance"] = "Dodaj środki",
    ["gangAddBalanceQuery"] = "Ile pieniędzy chciałeś dodać gangowi?",
    ["gangAddBalanceMsg"] = "Dodano %s pieniędzy do środków gangu %s!",
    ["gangViewMembers"] = "Zobacz członków",
    ["gangCantKickOwner"] = "Nie możesz wyrzucić właściciela gangu!",
    ["gangKickSuccessAdmin"] = "Pomyślnie wykopano członka gangu!",
    ["gangKickFailAdmin"] = "Niepowodzenie wyrzucania członka z gangu!",
    ["gangSetRankSuccessAdmin"] = "Ustawiono range członkowi gangu!",
    ["gangSetRankFailAdmin"] = "Nieudało się ustawić rangi członkowi gangu!",
    ["gangMemberAlreadyOwner"] = "Ten członek jest już włąścicielem gangu!",
    ["gangNotMember"] = "Ten gracz nie jest członkiem tego gangu!",
    ["gangOwnershipTransferedAdmin"] = "Pomyśłnie zmieniono właściciela gangu!",
    ["gangDeleteAdminQuery"] = "Usunięcia gangu nie można cofnąć, wpisz %s aby go usunąć.",
    ["gangDeleteSuccessAdmin"] = "Pomyślnie usunięto gang %s!",
    ["gangMenuBind"] = "Gang Menu Bind",
} )
--PATH addons/____bricks_framework/lua/bricks_server/languages/bricks_server/russian.lua:
BRICKS_SERVER.Func.AddLanguageStrings( "russian", {
    ["search"] = "Поиск",
    ["invalidPlayerProfile"] = "Запрошен неверный профиль игрока!",
    ["unbound"] = "НЕ ПРИВЯЗАН",
    ["themes"] = "Темы",
    ["groups"] = "Группы",
    ["general"] = "Основное",
    ["itemWhitelisting"] = "Белый список предметов",
    ["rarities"] = "Раритеты",
    ["languages"] = "Языки",
    ["disabled"] = "Отключено",
    ["enabled"] = "Включено",
    ["purchase"] = "Купить",
    ["profile"] = "Профиль",
    ["view"] = "Посмотреть",
    ["admin"] = "АДМИН",
    ["noToolPermission"] = "Нет прав.",
    ["settings"] = "Настройки",
    ["players"] = "Игроки",
    ["modules"] = "Модули",

    ["userGroupEditor"] = "Редактор групп пользователей",
    ["addNewGroup"] = "Добавить новую группу",
    ["newUserGroup"] = "Какой должна быть новая группа пользователей?",
    ["groupName"] = "Название",

    ["custom"] = "Свое",
    ["addNew"] = "Добавить новую",
    ["material"] = "Материал",
    ["directImage"] = "Введите URL прямого изображения ниже.",
    ["default"] = "Стандарт",
    ["selectMaterial"] = "Вы должны выбрать материал!",

    ["errorNoText"] = "ОШИБКА: НЕТ ТЕКСТА",
    ["selectOption"] = "Выберите опцию",
    ["selectValue"] = "Выберите значение.",
    ["selectColor"] = "Выберите цвет.",
    ["configSaved"] = "Конфиг сохранен!",
    ["cmdNoPermission"] = "Нет прав.",
    ["entityPosUpdated"] = "Позиция entity сохранена.",
    ["noEntitiesSpawned"] = "Нет сохраненных entities.",
    ["xEntitiesSpawned"] = "%d сохранил entities где был заспавнен.",
    ["error"] = "ERROR",

    ["seconds"] = "%d секунд",
    ["second"] = "%d секунда",
    ["minutes"] = "%d минуты",
    ["minute"] = "%d минута",
    ["hours"] = "%d часы",
    ["hour"] = "%d час",

    ["noRarity"] = "Нет редкости",

    ["config"] = "Настройки [Конфиг]",
    ["edit"] = "Изменить",
    ["editColor"] = "Изменить цвет",
    ["editName"] = "Изменить название",
    ["remove"] = "Удалить",
    ["name"] = "Название",
    ["description"] = "Описание",
    ["model"] = "Модель",
    ["icon"] = "Значек",
    ["type"] = "Тип",
    ["price"] = "Стоимость",
    ["group"] = "Группа",
    ["category"] = "Категория",
    ["color"] = "Цвет",
    ["invalidType"] = "Неверный тип.",
    ["invalidOption"] = "Неверная опция.",
    ["invalidChoice"] = "Неверный выбор.",
    ["invalidGroup"] = "Неверная группа.",
    ["invalidPlayer"] = "Неверный игрок.",
    ["true"] = "ВКЛ",
    ["false"] = "ВЫКЛ",
    ["noDescription"] = "Нет описания",
    ["other"] = "Остальное",
    ["completed"] = "Выполнено",
    ["close"] = "Закрыть",
    ["main"] = "Меню",
    
    ["valueQuery"] = "Что следует %s?",
    ["dataValueQuery"] = "Какие данные должны это?",
    ["newNameQuery"] = "Что следует новому имени?",
    ["newDescriptionQuery"] = "Что следует новому описанию?",
    ["newModelQuery"] = "Что следует новой моделе?",
    ["newIconQuery"] = "Что следует новой иконке?",
    ["newColorQuery"] = "Что следует новому цвету?",
    ["npcTypeQuery"] = "Какой тип этого NPC?",
    ["newTypeQuery"] = "Что следует типу",
    ["groupRequirementQuery"] = "Что следует требованиям группы?",
    ["levelRequirementQuery"] = "Что следует уровню группы?",
    ["newPriceQuery"] = "Что следует новой стоимости?",
    ["newCategoryQuery"] = "Что следует новой категории?",

    ["npcEditor"] = "Настройка NPC [Editor]",
    ["addNPC"] = "Добавить NPC",
    ["newNPC"] = "Новый NPC",

    ["ok"] = "OK",
    ["cancel"] = "Отмена",
    ["save"] = "Сохранить",
    ["confirm"] = "Подтвердить",
    ["nil"] = "NIL",
    ["none"] = "Ничего",
    ["selected"] = "Выбрано",
    ["unselected"] = "Не выбрано",
    ["add"] = "Добавить",

    ["shootyStick"] = "Стрелка!",
    ["permanent"] = "Вечная",
    ["tierX"] = "(Уровень %d)",
    ["someDescription"] = "Некоторое описание.",
    ["invalidNPC"] = "BRICKS SERVER ERROR: Неверный NPC",

    ["disconnected"] = "Отключился",
    ["profileView"] = "Просмотр профиля",
    ["loading"] = "Загрузка",
    ["statistics"] = "Статистика",
    ["steamID64"] = "SteamID64",
    ["donationRank"] = "Рейтинг пожертвований",
    ["staffRank"] = "Рейтинг персонала",
    ["currentJob"] = "Текущее место работы",
    ["wallet"] = "Бумажник",
    ["level"] = "Уровень",
    ["levelX"] = "Уровень %d",
    ["experience"] = "ОПЫТ",
    ["exp"] = "EXP",
    ["money"] = "Деньги",
    ["playerLogs"] = "Логи игрока",
    ["deleteLogs"] = "Удалить логи",
    ["xLogs"] = "%d логи",
    ["xAdminGroups"] = "%d Админ группы",
    ["noUserGroups"] = "Нет групп пользователей",
    ["userGroups"] = "Группы пользователей: %s",
    ["editUserGroups"] = "Изменить группы пользователей",
    ["newGroupColor"] = "Что следует новому цвету группу?",
    ["newGroupName"] = "Какое название новой группы?",
    ["groupAlreadyExists"] = "Эта группа уже существует!",
    ["whitelist"] = "Белый список",
    ["unWhitelist"] = "Искл. из белого списка",
    ["addCustom"] = "Добавить свое",
    ["entClassWhitelist"] = "Какой класс сущностей вы бы хотели добавить в белый список?",
    ["entClassAlreadyOnList"] = "Этот класс сущностей уже есть в списке!",
    ["changesServerRestart"] = "Некоторые изменения не вступят в силу, пока сервер не будет перезагружен!",
    ["comingSoon"] = "Скоро!",
    ["features"] = "ФУНКЦИИ",
    ["addNewRarity"] = "Добавить новый раритет",
    ["newRarity"] = "Новый раритет",
    ["needToAddRarity"] = "Вы должны сначала добавить тип редкости!",
    ["whatRarityItem"] = "Какой редкости стоит этот предмет?",
    ["invalidRarity"] = "Неверная редкость.",
    ["rarityAlreadyExists"] = "Редкость с таким названием уже существует!",
    ["themeColorX"] = "Тема - Цвет %d",
    ["themeTextColor"] = "Тема - Цвет текста",
    ["presetAccents"] = "Предустановленные акценты",
    ["presetBackgrounds"] = "Предустановленные фоны",
    ["resetToBaseThemes"] = "Сбросить тему к стандарту",
    ["resetToCurrentThemes"] = "Сброс к текущим темам",
    ["toggle"] = "Включить",
    ["menu"] = "Меню",
    ["emptyValue"] = "Пустое значение",
    ["newValueQuery"] = "Что следует пустому значению?",
    ["pressKey"] = "НАЖМИТЕ НА A",

    ["entityPlacer"] = "Спавн нового Entity",
    ["invalidEntityType"] = "Неверный тип объекта, выберите правильный из меню инструментов.",
    ["entityPlaced"] = "Объект успешно размещен.",
    ["entityRemoved"] = "Сущность успешно удалена.",
    ["canOnlyUseToolEntity"] = "Вы можете использовать этот инструмент только для удаления или создания объекта.",
    ["entityType"] = "Entity Тип",
    ["entityPlacerDescription"] = "Размещает и удаляет объекты с сервера Bricks и сохраняет их позиции. Левый щелчок - место. Правый клик - удалить.",
    ["entityPlacerDescriptionSmall"] = "Размещает и удаляет объекты",
    ["entityPlacerInstructions"] = "Левый клик - разместить, правый клик - удалить.",

    ["npcPlacer"] = "Установка NPC",
    ["npcPlaced"] = "NPC успешно размещен.",
    ["invalidNPCType"] = "Неверный тип NPC, выберите правильный из меню инструментов.",
    ["npcRemoved"] = "NPC успешно удален.",
    ["errorNotNPC"] = "Вы можете использовать этот инструмент только для удаления или создания NPC.",
    ["npcPlacerDescription"] = "Размещает и удаляет NPC с сервера Bricks. Щелкните левой кнопкой мыши - поместите, щелкните правой кнопкой мыши - удалите.",
    ["npcPlacerDescriptionSmall"] = "Размещает и удаляет NPC с сервера Brick.",

    ["inventory"] = "Инвентарь",
    ["player"] = "Игрок",
    ["drop"] = "Выбросить",
    ["use"] = "Использовать",
    ["dropAll"] = "Выбросить все",
    ["delete"] = "Удалить",
} )
--PATH addons/____bricks_framework/lua/sh_cami.lua:
--[[
CAMI - Common Admin Mod Interface.
Copyright 2020 CAMI Contributors

Makes admin mods intercompatible and provides an abstract privilege interface
for third party addons.

Follows the specification on this page:
https://github.com/glua/CAMI/blob/master/README.md

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]

-- Version number in YearMonthDay format.
local version = 20201130

if CAMI and CAMI.Version >= version then return end

CAMI = CAMI or {}
CAMI.Version = version


--- @class CAMI_USERGROUP
--- defines the charactaristics of a usergroup
--- @field Name string @The name of the usergroup
--- @field Inherits string @The name of the usergroup this usergroup inherits from

--- @class CAMI_PRIVILEGE
--- defines the charactaristics of a privilege
--- @field Name string @The name of the privilege
--- @field MinAccess "'user'" | "'admin'" | "'superadmin'" @Default group that should have this privilege
--- @field Description string | nil @Optional text describing the purpose of the privilege
local CAMI_PRIVILEGE = {}
--- Optional function to check if a player has access to this privilege
--- (and optionally execute it on another player)
---
--- ⚠ **Warning**: This function may not be called by all admin mods
--- @param actor GPlayer @The player
--- @param target GPlayer | nil @Optional - the target
--- @return boolean @If they can or not
--- @return string | nil @Optional reason
function CAMI_PRIVILEGE:HasAccess(actor, target)
end

--- Contains the registered CAMI_USERGROUP usergroup structures.
--- Indexed by usergroup name.
--- @type CAMI_USERGROUP[]
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

--- Contains the registered CAMI_PRIVILEGE privilege structures.
--- Indexed by privilege name.
--- @type CAMI_PRIVILEGE[]
local privileges = CAMI.GetPrivileges and CAMI.GetPrivileges() or {}

--- Registers a usergroup with CAMI.
---
--- Use the source parameter to make sure CAMI.RegisterUsergroup function and
--- the CAMI.OnUsergroupRegistered hook don't cause an infinite loop
--- @param usergroup CAMI_USERGROUP @The structure for the usergroup you want to register
--- @param source any @Identifier for your own admin mod. Can be anything.
--- @return CAMI_USERGROUP @The usergroup given as an argument
function CAMI.RegisterUsergroup(usergroup, source)
    usergroups[usergroup.Name] = usergroup

    hook.Call("CAMI.OnUsergroupRegistered", nil, usergroup, source)
    return usergroup
end

--- Unregisters a usergroup from CAMI. This will call a hook that will notify
--- all other admin mods of the removal.
---
--- ⚠ **Warning**: Call only when the usergroup is to be permanently removed.
---
--- Use the source parameter to make sure CAMI.UnregisterUsergroup function and
--- the CAMI.OnUsergroupUnregistered hook don't cause an infinite loop
--- @param usergroupName string @The name of the usergroup.
--- @param source any @Identifier for your own admin mod. Can be anything.
--- @return boolean @Whether the unregistering succeeded.
function CAMI.UnregisterUsergroup(usergroupName, source)
    if not usergroups[usergroupName] then return false end

    local usergroup = usergroups[usergroupName]
    usergroups[usergroupName] = nil

    hook.Call("CAMI.OnUsergroupUnregistered", nil, usergroup, source)

    return true
end

--- Retrieves all registered usergroups.
--- @return CAMI_USERGROUP[] @Usergroups indexed by their names.
function CAMI.GetUsergroups()
    return usergroups
end

--- Receives information about a usergroup.
--- @param usergroupName string
--- @return CAMI_USERGROUP | nil @Returns nil when the usergroup does not exist.
function CAMI.GetUsergroup(usergroupName)
    return usergroups[usergroupName]
end

--- Checks to see if potentialAncestor is an ancestor of usergroupName.
--- All usergroups are ancestors of themselves.
---
--- Examples:
--- * `user` is an ancestor of `admin` and also `superadmin`
--- * `admin` is an ancestor of `superadmin`, but not `user`
--- @param usergroupName string @The usergroup to query
--- @param potentialAncestor string @The ancestor to query
--- @return boolean @Whether usergroupName inherits potentialAncestor.
function CAMI.UsergroupInherits(usergroupName, potentialAncestor)
    repeat
        if usergroupName == potentialAncestor then return true end

        usergroupName = usergroups[usergroupName] and
                         usergroups[usergroupName].Inherits or
                         usergroupName
    until not usergroups[usergroupName] or
          usergroups[usergroupName].Inherits == usergroupName

    -- One can only be sure the usergroup inherits from user if the
    -- usergroup isn't registered.
    return usergroupName == potentialAncestor or potentialAncestor == "user"
end

--- Find the base group a usergroup inherits from.
---
--- This function traverses down the inheritence chain, so for example if you have
--- `user` -> `group1` -> `group2`
--- this function will return `user` if you pass it `group2`.
---
--- ℹ **NOTE**: All usergroups must eventually inherit either user, admin or superadmin.
--- @param usergroupName string @The name of the usergroup
--- @return "'user'" | "'admin'" | "'superadmin'" @The name of the root usergroup
function CAMI.InheritanceRoot(usergroupName)
    if not usergroups[usergroupName] then return end

    local inherits = usergroups[usergroupName].Inherits
    while inherits ~= usergroups[usergroupName].Inherits do
        usergroupName = usergroups[usergroupName].Inherits
    end

    return usergroupName
end

--- Registers an addon privilege with CAMI.
---
--- ⚠ **Warning**: This should only be used by addons. Admin mods must *NOT*
---  register their privileges using this function.
--- @param privilege CAMI_PRIVILEGE
--- @return CAMI_PRIVILEGE @The privilege given as argument.
function CAMI.RegisterPrivilege(privilege)
    privileges[privilege.Name] = privilege

    hook.Call("CAMI.OnPrivilegeRegistered", nil, privilege)

    return privilege
end

--- Unregisters a privilege from CAMI.
--- This will call a hook that will notify any admin mods of the removal.
---
--- ⚠ **Warning**: Call only when the privilege is to be permanently removed.
--- @param privilegeName string @The name of the privilege.
--- @return boolean @Whether the unregistering succeeded.
function CAMI.UnregisterPrivilege(privilegeName)
    if not privileges[privilegeName] then return false end

    local privilege = privileges[privilegeName]
    privileges[privilegeName] = nil

    hook.Call("CAMI.OnPrivilegeUnregistered", nil, privilege)

    return true
end

--- Retrieves all registered privileges.
--- @return CAMI_PRIVILEGE[] @All privileges indexed by their names.
function CAMI.GetPrivileges()
    return privileges
end

--- Receives information about a privilege.
--- @param privilegeName string
--- @return CAMI_PRIVILEGE | nil
function CAMI.GetPrivilege(privilegeName)
    return privileges[privilegeName]
end

-- Default access handler
local defaultAccessHandler = {["CAMI.PlayerHasAccess"] =
    function(_, actorPly, privilegeName, callback, targetPly, extraInfoTbl)
        -- The server always has access in the fallback
        if not IsValid(actorPly) then return callback(true, "Fallback.") end

        local priv = privileges[privilegeName]

        local fallback = extraInfoTbl and (
            not extraInfoTbl.Fallback and actorPly:IsAdmin() or
            extraInfoTbl.Fallback == "user" and true or
            extraInfoTbl.Fallback == "admin" and actorPly:IsAdmin() or
            extraInfoTbl.Fallback == "superadmin" and actorPly:IsSuperAdmin())


        if not priv then return callback(fallback, "Fallback.") end

        local hasAccess =
            priv.MinAccess == "user" or
            priv.MinAccess == "admin" and actorPly:IsAdmin() or
            priv.MinAccess == "superadmin" and actorPly:IsSuperAdmin()

        if hasAccess and priv.HasAccess then
            hasAccess = priv:HasAccess(actorPly, targetPly)
        end

        callback(hasAccess, "Fallback.")
    end,
    ["CAMI.SteamIDHasAccess"] =
    function(_, _, _, callback)
        callback(false, "No information available.")
    end
}

--- @class CAMI_ACCESS_EXTRA_INFO
--- @field Fallback "'user'" | "'admin'" | "'superadmin'" @Fallback status for if the privilege doesn't exist. Defaults to `admin`.
--- @field IgnoreImmunity boolean @Ignore any immunity mechanisms an admin mod might have.
--- @field CommandArguments table @Extra arguments that were given to the privilege command.

--- Checks if a player has access to a privilege
--- (and optionally can execute it on targetPly)
---
--- This function is designed to be asynchronous but will be invoked
---  synchronously if no callback is passed.
---
--- ⚠ **Warning**: If the currently installed admin mod does not support
---                 synchronous queries, this function will throw an error!
--- @param actorPly GPlayer @The player to query
--- @param privilegeName string @The privilege to query
--- @param callback fun(hasAccess: boolean, reason: string|nil) @Callback to receive the answer, or nil for synchronous
--- @param targetPly GPlayer | nil @Optional - target for if the privilege effects another player (eg kick/ban)
--- @param extraInfoTbl CAMI_ACCESS_EXTRA_INFO | nil @Table of extra information for the admin mod
--- @return boolean | nil @Synchronous only - if the player has the privilege
--- @return string | nil @Synchronous only - optional reason from admin mod
function CAMI.PlayerHasAccess(actorPly, privilegeName, callback, targetPly,
extraInfoTbl)
    local hasAccess, reason = nil, nil
    local callback_ = callback or function(hA, r) hasAccess, reason = hA, r end

    hook.Call("CAMI.PlayerHasAccess", defaultAccessHandler, actorPly,
        privilegeName, callback_, targetPly, extraInfoTbl)

    if callback ~= nil then return end

    if hasAccess == nil then
        local err = [[The function CAMI.PlayerHasAccess was used to find out
        whether Player %s has privilege "%s", but an admin mod did not give an
        immediate answer!]]
        error(string.format(err,
            actorPly:IsPlayer() and actorPly:Nick() or tostring(actorPly),
            privilegeName))
    end

    return hasAccess, reason
end

--- Get all the players on the server with a certain privilege
--- (and optionally who can execute it on targetPly)
---
--- ℹ **NOTE**: This is an asynchronous function!
--- @param privilegeName string @The privilege to query
--- @param callback fun(players: GPlayer[]) @Callback to receive the answer
--- @param targetPly GPlayer | nil @Optional - target for if the privilege effects another player (eg kick/ban)
--- @param extraInfoTbl CAMI_ACCESS_EXTRA_INFO | nil @Table of extra information for the admin mod
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

    for _, ply in ipairs(allPlys) do
        CAMI.PlayerHasAccess(ply, privilegeName,
            function(...) onResult(ply, ...) end,
            targetPly, extraInfoTbl)
    end
end

--- @class CAMI_STEAM_ACCESS_EXTRA_INFO
--- @field IgnoreImmunity boolean @Ignore any immunity mechanisms an admin mod might have.
--- @field CommandArguments table @Extra arguments that were given to the privilege command.

--- Checks if a (potentially offline) SteamID has access to a privilege
--- (and optionally if they can execute it on a target SteamID)
---
--- ℹ **NOTE**: This is an asynchronous function!
--- @param actorSteam string | nil @The SteamID to query
--- @param privilegeName string @The privilege to query
--- @param callback fun(hasAccess: boolean, reason: string|nil) @Callback to receive  the answer
--- @param targetSteam string | nil @Optional - target SteamID for if the privilege effects another player (eg kick/ban)
--- @param extraInfoTbl CAMI_STEAM_ACCESS_EXTRA_INFO | nil @Table of extra information for the admin mod
function CAMI.SteamIDHasAccess(actorSteam, privilegeName, callback,
targetSteam, extraInfoTbl)
    hook.Call("CAMI.SteamIDHasAccess", defaultAccessHandler, actorSteam,
        privilegeName, callback, targetSteam, extraInfoTbl)
end

--- Signify that your admin mod has changed the usergroup of a player. This
--- function communicates to other admin mods what it thinks the usergroup
--- of a player should be.
---
--- Listen to the hook to receive the usergroup changes of other admin mods.
--- @param ply GPlayer @The player for which the usergroup is changed
--- @param old string @The previous usergroup of the player.
--- @param new string @The new usergroup of the player.
--- @param source any @Identifier for your own admin mod. Can be anything.
function CAMI.SignalUserGroupChanged(ply, old, new, source)
    hook.Call("CAMI.PlayerUsergroupChanged", nil, ply, old, new, source)
end

--- Signify that your admin mod has changed the usergroup of a disconnected
--- player. This communicates to other admin mods what it thinks the usergroup
--- of a player should be.
---
--- Listen to the hook to receive the usergroup changes of other admin mods.
--- @param steamId string @The steam ID of the player for which the usergroup is changed
--- @param old string @The previous usergroup of the player.
--- @param new string @The new usergroup of the player.
--- @param source any @Identifier for your own admin mod. Can be anything.
function CAMI.SignalSteamIDUserGroupChanged(steamId, old, new, source)
    hook.Call("CAMI.SteamIDUsergroupChanged", nil, steamId, old, new, source)
end

--PATH addons/____bricks_framework/lua/bricks_server/itemtypes/spawned_shipment.lua:
local ITEM = BRICKS_SERVER.Func.CreateItemType( "spawned_shipment" )

ITEM.GetItemData = function( ent )
    local itemData = { "spawned_weapon", ent:GetModel(), CustomShipments[ent:Getcontents()].entity }

    if( CustomShipments[ent:Getcontents()] and CustomShipments[ent:Getcontents()].model ) then
        itemData[2] = CustomShipments[ent:Getcontents()].model or ent:GetModel()
    end
    
    return itemData, (ent:Getcount() or 1)
end

ITEM.OnSpawn = function( ply, pos, itemData, itemAmount )
    local ent = ents.Create( "spawned_weapon" )
    if( not IsValid( ent ) ) then return end
    ent:SetPos( pos )
    ent:SetWeaponClass( itemData[3] )
    ent:Setamount( itemAmount or 1 )
    ent:SetModel( itemData[2] )
    ent:Spawn()
end

ITEM.GetInfo = function( itemData )
    return { (itemData[4] or "Unknown"), (itemData[5] or BRICKS_SERVER.Func.L( "someDescription" )), (BRICKS_SERVER.CONFIG.INVENTORY.ItemRarities or {})[itemData[3] or ""] }
end

ITEM:Register()
--PATH addons/____bricks_framework/lua/bricks_server/vgui/bricks_server_combo.lua:

local PANEL = {}

Derma_Install_Convar_Functions( PANEL )

AccessorFunc( PANEL, "m_bDoSort", "SortItems", FORCE_BOOL )

function PANEL:Init()
	self:SetTall( 40 )
	self:Clear()

	self:SetIsMenu( true )
	self:SetSortItems( true )
	self:SetText( "" )
end

function PANEL:SetBackColor( color )
    self.backColor = color
end

function PANEL:SetHighlightColor( color )
    self.highlightColor = color
end

function PANEL:Clear()

	self.Choices = {}
	self.Data = {}
	self.ChoiceIcons = {}
	self.selected = nil

	if ( self.Menu ) then
		self.Menu:Remove()
		self.Menu = nil
	end

end

function PANEL:GetOptionText( id )

	return self.Choices[ id ]

end

function PANEL:GetOptionData( id )

	return self.Data[ id ]

end

function PANEL:GetOptionTextByData( data )

	for id, dat in pairs( self.Data ) do
		if ( dat == data ) then
			return self:GetOptionText( id )
		end
	end

	-- Try interpreting it as a number
	for id, dat in pairs( self.Data ) do
		if ( dat == tonumber( data ) ) then
			return self:GetOptionText( id )
		end
	end

	-- In case we fail
	return data

end

function PANEL:PerformLayout()

end

function PANEL:ChooseOption( value, index )

	if ( self.Menu ) then
		self.Menu:Remove()
		self.Menu = nil
	end

	self.text = value

	-- This should really be the here, but it is too late now and convar changes are handled differently by different child elements
	--self:ConVarChanged( self.Data[ index ] )

	self.selected = index
	self:OnSelect( index, value, self.Data[ index ] )

end

function PANEL:ChooseOptionID( index )

	local value = self:GetOptionText( index )
	self:ChooseOption( value, index )

end

function PANEL:GetSelectedID()

	return self.selected

end

function PANEL:GetSelected()

	if ( !self.selected ) then return end

	return self:GetOptionText( self.selected ), self:GetOptionData( self.selected )

end

function PANEL:OnSelect( index, value, data )

	-- For override

end

function PANEL:AddChoice( value, data, select, icon )

	local i = table.insert( self.Choices, value )

	if ( data ) then
		self.Data[ i ] = data
	end
	
	if ( icon ) then
		self.ChoiceIcons[ i ] = icon
	end

	if ( select ) then

		self:ChooseOption( value, i )

	end

	return i

end

function PANEL:IsMenuOpen()

	return IsValid( self.Menu ) && self.Menu:IsVisible()

end

function PANEL:OpenMenu( pControlOpener )

	if ( pControlOpener && pControlOpener == self.TextEntry ) then
		return
	end

	-- Don't do anything if there aren't any options..
	if ( #self.Choices == 0 ) then return end

	-- If the menu still exists and hasn't been deleted
	-- then just close it and don't open a new one.
	if ( IsValid( self.Menu ) ) then
		self.Menu:Remove()
		self.Menu = nil
	end

	self.Menu = vgui.Create( "bricks_server_dmenu" )

	if ( self:GetSortItems() ) then
		local sorted = {}
		for k, v in pairs( self.Choices ) do
			local val = tostring( v ) --tonumber( v ) || v -- This would make nicer number sorting, but SortedPairsByMemberValue doesn't seem to like number-string mixing
			if ( string.len( val ) > 1 && !tonumber( val ) && val:StartWith( "#" ) ) then val = language.GetPhrase( val:sub( 2 ) ) end
			table.insert( sorted, { id = k, data = v, label = val } )
		end
		for k, v in SortedPairsByMemberValue( sorted, "label" ) do
			local option = self.Menu:AddOption( v.data, function() self:ChooseOption( v.data, v.id ) end )
			if ( self.ChoiceIcons[ v.id ] ) then
				option:SetIcon( self.ChoiceIcons[ v.id ] )
			end
		end
	else
		for k, v in pairs( self.Choices ) do
			local option = self.Menu:AddOption( v, function() self:ChooseOption( v, k ) end )
			if ( self.ChoiceIcons[ k ] ) then
				option:SetIcon( self.ChoiceIcons[ k ] )
			end
		end
	end

	local x, y = self:LocalToScreen( 0, self:GetTall() )

	self.Menu:SetMaxHeight( ScrH()*0.2 )
	self.Menu.dontRoundTop = true
	self.Menu:SetMinimumWidth( self:GetWide() )
	self.Menu:Open( x, y, false, self )

end

function PANEL:CloseMenu()

	if ( IsValid( self.Menu ) ) then
		self.Menu:Remove()
	end

end

-- This really should use a convar change hook
function PANEL:CheckConVarChanges()

	if ( !self.m_strConVar ) then return end

	local strValue = GetConVarString( self.m_strConVar )
	if ( self.m_strConVarValue == strValue ) then return end

	self.m_strConVarValue = strValue

	self:SetValue( self:GetOptionTextByData( self.m_strConVarValue ) )

end

function PANEL:Think()

	self:CheckConVarChanges()

end

function PANEL:SetValue( strValue )

	self.text = strValue

end

function PANEL:DoClick()

	if ( self:IsMenuOpen() ) then
		return self:CloseMenu()
	end

	self:OpenMenu()

end

function PANEL:SetRoundedBoxDimensions( roundedBoxX, roundedBoxY, roundedBoxW, roundedBoxH )
	self.roundedBoxX, self.roundedBoxY, self.roundedBoxW, self.roundedBoxH = roundedBoxX, roundedBoxY, roundedBoxW, roundedBoxH
end

local alpha = 0
function PANEL:Paint( w, h )
	if( self:IsMenuOpen() or self:IsHovered() ) then
		alpha = math.Clamp( alpha+10, 0, 100 )
	else
		alpha = math.Clamp( alpha-10, 0, 100 )
	end

	local roundBottom = not (self:IsMenuOpen() and (self.optionCount or 1) > 0)

	draw.RoundedBoxEx( (self.cornerRadius or 5), (self.roundedBoxX or 0), (self.roundedBoxY or 0), (self.roundedBoxW or w), (self.roundedBoxH or h), (self.backColor or BRICKS_SERVER.Func.GetTheme( 3 )), true, true, roundBottom, roundBottom )

	surface.SetAlphaMultiplier( alpha/255 )
	draw.RoundedBoxEx( (self.cornerRadius or 5), (self.roundedBoxX or 0), (self.roundedBoxY or 0), (self.roundedBoxW or w), (self.roundedBoxH or h), (self.highlightColor or BRICKS_SERVER.Func.GetTheme( 2 )), true, true, roundBottom, roundBottom )
	surface.SetAlphaMultiplier( 1 )

	draw.SimpleText( (self.text or BRICKS_SERVER.Func.L( "none" )), "BRICKS_SERVER_Font20", w*0.5, h*0.5, BRICKS_SERVER.Func.GetTheme( 6, 20+(not self:IsMenuOpen() and 235*(alpha/100) or 0) ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
end

derma.DefineControl( "bricks_server_combo", "", PANEL, "DButton" )

--PATH addons/____bricks_framework/lua/bricks_server/vgui/bricks_server_config_npcs.lua:
local PANEL = {}

function PANEL:Init()

end

function PANEL:FillPanel()
    local itemActions = {
        [1] = { BRICKS_SERVER.Func.L( "edit" ), function( k, v )
            BRICKS_SERVER.Func.CreateNPCEditor( k, v, function( NPCTable ) 
                BS_ConfigCopyTable.NPCS[k] = NPCTable
                BRICKS_SERVER.Func.ConfigChange( "NPCS" )
                self.RefreshPanel()
            end, function() end )
        end }
    }
    
    BS_ConfigCopyTable.NPCS = BS_ConfigCopyTable.NPCS or {}
    function self.RefreshPanel()
        self:Clear()

        self.slots = nil
        if( self.grid and IsValid( self.grid ) ) then
            self.grid:Remove()
        end

        BRICKS_SERVER.Func.FillVariableConfigs( self, "NPCS", "NPCS" )

        for k, v in pairs( BS_ConfigCopyTable.NPCS or {} ) do
            local itemBack = vgui.Create( "DPanel", self )
            itemBack:Dock( TOP )
            itemBack:DockMargin( 0, 0, 0, 5 )
            itemBack:SetTall( 100 )
            itemBack:DockPadding( 0, 0, 25, 0 )
            itemBack.Paint = function( self2, w, h )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
                draw.RoundedBox( 5, 5, 5, h-10, h-10, BRICKS_SERVER.Func.GetTheme( 2 ) )

                draw.SimpleText( v.Name, "BRICKS_SERVER_Font33", h+15, 5, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
                draw.SimpleText( v.Type, "BRICKS_SERVER_Font20", h+15, 32, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
            end

            local itemIcon = vgui.Create( "DModelPanel" , itemBack )
            itemIcon:SetPos( 5, 5 )
            itemIcon:SetSize( itemBack:GetTall()-10, itemBack:GetTall()-10 )
            itemIcon:SetModel( v.Model or "models/breen.mdl" )
            itemIcon:SetCamPos( itemIcon:GetCamPos()+Vector( 40, 0, 0 ) )
            itemIcon:SetColor( v.ModelColor or Color( 255, 255, 255 ) )
            function itemIcon:LayoutEntity(ent) return end

            if( IsValid( itemIcon.Entity ) ) then
                local eyepos = itemIcon.Entity:GetBonePosition( (itemIcon.Entity:LookupBone("ValveBiped.Bip01_Head1") or 1) ) or Vector( 0, 0, 0 )
                eyepos:Add(Vector(0, 0, 2))	-- Move up slightly
                itemIcon:SetLookAt(eyepos)
                itemIcon:SetCamPos(eyepos-Vector(-20, 0, 0))	-- Move cam in front of eyes
                itemIcon.Entity:SetEyeTarget(eyepos-Vector(-12, 0, 0))
            end

            local newItemActions = table.Copy( itemActions )
            if( BRICKS_SERVER.DEVCONFIG.NPCTypes[(v.Type or "")] and BRICKS_SERVER.DEVCONFIG.NPCTypes[(v.Type or "")].TypeDataFunction ) then
                newItemActions[2] = { (BRICKS_SERVER.Func.L( "edit" ) .. " " .. (BRICKS_SERVER.DEVCONFIG.NPCTypes[(v.Type or "")].TypeDataName or "Data")), function( k, v )
                    if( BRICKS_SERVER.DEVCONFIG.NPCTypes[(v.Type or "")] and BRICKS_SERVER.DEVCONFIG.NPCTypes[(v.Type or "")].TypeDataFunction ) then
                        BRICKS_SERVER.DEVCONFIG.NPCTypes[(v.Type or "")].TypeDataFunction( k, v )
                        BRICKS_SERVER.Func.ConfigChange( "NPCS" )
                    end
                end }
                newItemActions[3] = { BRICKS_SERVER.Func.L( "remove" ), function( k, v )
                    BS_ConfigCopyTable.NPCS[k] = nil
                    BRICKS_SERVER.Func.ConfigChange( "NPCS" )
                    self.RefreshPanel()
                end, BRICKS_SERVER.DEVCONFIG.BaseThemes.Red, BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkRed }
            else
                newItemActions[2] = { BRICKS_SERVER.Func.L( "remove" ), function( k, v )
                    BS_ConfigCopyTable.NPCS[k] = nil
                    BRICKS_SERVER.Func.ConfigChange( "NPCS" )
                    self.RefreshPanel()
                end, BRICKS_SERVER.DEVCONFIG.BaseThemes.Red, BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkRed }
            end

            for key2, val2 in ipairs( newItemActions ) do
                local itemAction = vgui.Create( "DButton", itemBack )
                itemAction:Dock( RIGHT )
                itemAction:SetText( "" )
                itemAction:DockMargin( 5, 25, 0, 25 )
                surface.SetFont( "BRICKS_SERVER_Font25" )
                local textX, textY = surface.GetTextSize( val2[1] )
                textX = textX+20
                itemAction:SetWide( math.max( (ScrW()/2560)*150, textX ) )
                local changeAlpha = 0
                itemAction.Paint = function( self2, w, h )
                    if( self2:IsDown() ) then
                        changeAlpha = math.Clamp( changeAlpha+10, 0, 125 )
                    elseif( self2:IsHovered() ) then
                        changeAlpha = math.Clamp( changeAlpha+10, 0, 75 )
                    else
                        changeAlpha = math.Clamp( changeAlpha-10, 0, 75 )
                    end
                    
                    if( val2[3] ) then
                        draw.RoundedBox( 5, 0, 0, w, h, val2[3] )
                    else
                        draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
                    end
            
                    surface.SetAlphaMultiplier( changeAlpha/255 )
                        if( val2[4] ) then
                            draw.RoundedBox( 5, 0, 0, w, h, val2[4] )
                        else
                            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
                        end
                    surface.SetAlphaMultiplier( 1 )
            
                    draw.SimpleText( val2[1], "BRICKS_SERVER_Font25", w*0.5, h*0.5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
                end
                itemAction.DoClick = function()
                    val2[2]( k, v )
                end
            end
        end

        local addNewNPC = vgui.Create( "DButton", self )
        addNewNPC:Dock( TOP )
        addNewNPC:SetText( "" )
        addNewNPC:SetTall( 40 )
        local changeAlpha = 0
        addNewNPC.Paint = function( self2, w, h )
            if( self2:IsDown() ) then
                changeAlpha = math.Clamp( changeAlpha+10, 0, 125 )
            elseif( self2:IsHovered() ) then
                changeAlpha = math.Clamp( changeAlpha+10, 0, 75 )
            else
                changeAlpha = math.Clamp( changeAlpha-10, 0, 75 )
            end
            
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
    
            surface.SetAlphaMultiplier( changeAlpha/255 )
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
            surface.SetAlphaMultiplier( 1 )
    
            draw.SimpleText( BRICKS_SERVER.Func.L( "addNPC" ), "BRICKS_SERVER_Font25", w*0.5, h*0.5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
        addNewNPC.DoClick = function()
            BS_ConfigCopyTable.NPCS = BS_ConfigCopyTable.NPCS or {}
            local newNPC = {
                Name = BRICKS_SERVER.Func.L( "newNPC" )
            }
            table.insert( BS_ConfigCopyTable.NPCS, newNPC )
            BRICKS_SERVER.Func.ConfigChange( "NPCS" )
            self.RefreshPanel()
        end
    end
    self.RefreshPanel()
end

function PANEL:Paint( w, h )
    
end

vgui.Register( "bricks_server_config_npcs", PANEL, "bricks_server_scrollpanel" )
--PATH addons/____bricks_framework/lua/bricks_server/vgui/bricks_server_config_rarities.lua:
local PANEL = {}

function PANEL:Init()
    self.margin = 0
end

function PANEL:FillPanel()
    self.panelWide, self.panelTall = ScrW()*0.6-BRICKS_SERVER.DEVCONFIG.MainNavWidth, ScrH()*0.65-40

    self.topBar = vgui.Create( "DPanel", self )
    self.topBar:Dock( TOP )
    self.topBar:SetTall( 60 )
    self.topBar.Paint = function( self, w, h ) 
        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
        surface.DrawRect( 0, 0, w, h )
    end 

    surface.SetFont( "BRICKS_SERVER_Font20" )
    local textX, textY = surface.GetTextSize( "Create Rarity" )
    local totalContentW = 16+5+textX

    local createNewButton = vgui.Create( "DButton", self.topBar )
    createNewButton:Dock( RIGHT )
    createNewButton:DockMargin( 10, 10, 25, 10 )
    createNewButton:SetWide( totalContentW+27 )
    createNewButton:SetText( "" )
    local alpha = 0
    local addMat = Material( "bricks_server/add_16.png" )
    createNewButton.Paint = function( self2, w, h )
        draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )

        if( not self2:IsDown() and self2:IsHovered() ) then
            alpha = math.Clamp( alpha+10, 0, 255 )
        else
            alpha = math.Clamp( alpha-10, 0, 255 )
        end

        surface.SetAlphaMultiplier( alpha/255 )
        draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )
        surface.SetAlphaMultiplier( 1 )

        BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )

        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6, 20+(235*(alpha/255)) ) )
        surface.SetMaterial( addMat )
        local iconSize = 16
        surface.DrawTexturedRect( 12, (h*0.5)-(iconSize*0.5), iconSize, iconSize )

        draw.SimpleText( "Create Rarity", "BRICKS_SERVER_Font20", 12+iconSize+5, h*0.5, BRICKS_SERVER.Func.GetTheme( 6, 20+(235*(alpha/255)) ), 0, TEXT_ALIGN_CENTER )
    end
    createNewButton.DoClick = function()
        BS_ConfigCopyTable.GENERAL.Rarities = BS_ConfigCopyTable.GENERAL.Rarities or {}
        table.insert( BS_ConfigCopyTable.GENERAL.Rarities, 1, { BRICKS_SERVER.Func.L( "newRarity" ) .. " " .. (#BS_ConfigCopyTable.GENERAL.Rarities or 0)+1, "SolidColor", Color( 125, 125, 125 ) } )
        self:Refresh()
        BRICKS_SERVER.Func.ConfigChange( "GENERAL" )

        BRICKS_SERVER.Func.CreateTopNotification( "New rarity added!", 3, BRICKS_SERVER.DEVCONFIG.BaseThemes.Green )
    end

    self.searchBar = vgui.Create( "bricks_server_searchbar", self.topBar )
    self.searchBar:Dock( LEFT )
    self.searchBar:DockMargin( 25, 10, 10, 10 )
    self.searchBar:SetWide( ScrW()*0.2 )
    self.searchBar:SetBackColor( BRICKS_SERVER.Func.GetTheme( 1 ) )
    self.searchBar:SetHighlightColor( BRICKS_SERVER.Func.GetTheme( 0 ) )
    self.searchBar.OnChange = function()
        self:Refresh()
    end

    self.scrollPanel = vgui.Create( "bricks_server_scrollpanel_bar", self )
    self.scrollPanel:Dock( FILL )
    self.scrollPanel:DockMargin( 25, 25, 25, 25 )
    self.scrollPanel.Paint = function( self, w, h ) end 

    self.spacing = 25
    local gridWide = self.panelWide-50-10-10
    self.slotsWide = 2
    self.slotWide, self.slotTall = (gridWide-((self.slotsWide-1)*self.spacing))/self.slotsWide, 150

    self.grid = vgui.Create( "DIconLayout", self.scrollPanel )
    self.grid:Dock( TOP )
    self.grid:SetSpaceY( 10 )
    self.grid:SetSpaceX( self.spacing )

    self:Refresh()
end

function PANEL:Refresh()
    self.grid:Clear()

    local sortedItems = {}
    for k, v in pairs( BS_ConfigCopyTable.GENERAL.Rarities or {} ) do
        if( self.searchBar:GetValue() != "" and not string.find( string.lower( v[1] ), string.lower( self.searchBar:GetValue() ) ) ) then
            continue
        end

        local itemTable = table.Copy( v )
        itemTable.Key = k

        table.insert( sortedItems, itemTable)
    end

    table.sort( sortedItems, function( a, b ) return ((a or {}).Key or 0) > ((b or {}).Key or 0) end )

    for k, v in pairs( sortedItems ) do
        local rarityBack = vgui.Create( "DPanel", self.grid )
        rarityBack:SetSize( self.slotWide, self.slotTall )
        rarityBack.Paint = function( self2, w, h ) end

        local rarityNum = vgui.Create( "DPanel", rarityBack )
        rarityNum:Dock( LEFT )
        rarityNum:DockMargin( 0, 0, 10, 0 )
        rarityNum:SetWide( 35 )
        rarityNum.Paint = function( self2, w, h )
            draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3, 125 ) )
    
            draw.SimpleText( #(BS_ConfigCopyTable.GENERAL.Rarities or {})-v.Key+1, "BRICKS_SERVER_Font25", w*0.5, h*0.5, BRICKS_SERVER.Func.GetTheme( 6, 20 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end

        local rarityUpButton = vgui.Create( "DButton", rarityNum )
        rarityUpButton:SetText( "" )
        rarityUpButton:Dock( TOP )
        rarityUpButton:SetTall( rarityNum:GetWide() )
        local alpha = 0
        local upMat = Material( "materials/bricks_server/up_16.png" )
        rarityUpButton.Paint = function( self2, w, h )
            if( not self2:IsDown() and self2:IsHovered() ) then
                alpha = math.Clamp( alpha+10, 0, 255 )
            else
                alpha = math.Clamp( alpha-10, 0, 255 )
            end
    
            surface.SetAlphaMultiplier( alpha/255 )
            draw.RoundedBoxEx( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ), true, true, false, false )
            surface.SetAlphaMultiplier( 1 )
    
            BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 3 ), 8 )

            surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6, 20+(235*(alpha/255)) ) )
            surface.SetMaterial( upMat )
            local iconSize = 16
            surface.DrawTexturedRect( (h-iconSize)*0.5, (h*0.5)-(iconSize*0.5), iconSize, iconSize )
        end
        rarityUpButton.DoClick = function()
            if( v.Key >= #BS_ConfigCopyTable.GENERAL.Rarities ) then return end

            local targetTable = BS_ConfigCopyTable.GENERAL.Rarities[v.Key+1]

            if( not targetTable ) then return end

            BS_ConfigCopyTable.GENERAL.Rarities[v.Key+1] = v
            BS_ConfigCopyTable.GENERAL.Rarities[v.Key] = targetTable

            self:Refresh()
            BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
        end

        local rarityDownButton = vgui.Create( "DButton", rarityNum )
        rarityDownButton:SetText( "" )
        rarityDownButton:Dock( BOTTOM )
        rarityDownButton:SetTall( rarityNum:GetWide() )
        local alpha = 0
        local downMat = Material( "materials/bricks_server/down_16.png" )
        rarityDownButton.Paint = function( self2, w, h )
            if( not self2:IsDown() and self2:IsHovered() ) then
                alpha = math.Clamp( alpha+10, 0, 255 )
            else
                alpha = math.Clamp( alpha-10, 0, 255 )
            end
    
            surface.SetAlphaMultiplier( alpha/255 )
            draw.RoundedBoxEx( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ), false, false, true, true )
            surface.SetAlphaMultiplier( 1 )
    
            BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 3 ), 8 )

            surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6, 20+(235*(alpha/255)) ) )
            surface.SetMaterial( downMat )
            local iconSize = 16
            surface.DrawTexturedRect( (h-iconSize)*0.5, (h*0.5)-(iconSize*0.5), iconSize, iconSize )
        end
        rarityDownButton.DoClick = function()
            if( v.Key <= 1 ) then return end

            local targetTable = BS_ConfigCopyTable.GENERAL.Rarities[v.Key-1]

            if( not targetTable ) then return end

            BS_ConfigCopyTable.GENERAL.Rarities[v.Key-1] = v
            BS_ConfigCopyTable.GENERAL.Rarities[v.Key] = targetTable

            self:Refresh()
            BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
        end

        local rarityPanel = vgui.Create( "DPanel", rarityBack )
        rarityPanel:Dock( FILL )
        rarityPanel.Paint = function( self2, w, h )
            draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
    
            draw.SimpleText( v[1], "BRICKS_SERVER_Font30", 10+15, 10, BRICKS_SERVER.Func.GetRarityColor( v ), 0, 0 )
            draw.SimpleText( BRICKS_SERVER.DEVCONFIG.RarityTypes[v[2]].Title, "BRICKS_SERVER_Font21", 10+15, 32, BRICKS_SERVER.Func.GetTheme( 6, 125 ), 0, 0 )
        end

        surface.SetFont( "BRICKS_SERVER_Font30" )
        local nameX, nameY = surface.GetTextSize( v[1] )

        local rarityEditNameButton = vgui.Create( "DButton", rarityPanel )
        rarityEditNameButton:SetText( "" )
        rarityEditNameButton:SetSize( 16, 16 )
        rarityEditNameButton:SetPos( 10+15+nameX+5, 10+(nameY*0.5)-6 )
        local alpha = 20
        local editMat = Material( "materials/bricks_server/edit_16.png" )
        rarityEditNameButton.Paint = function( self2, w, h )
            if( not self2:IsDown() and self2:IsHovered() ) then
                alpha = math.Clamp( alpha+10, 20, 255 )
            else
                alpha = math.Clamp( alpha-10, 20, 255 )
            end
    
            surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6, alpha ) )
            surface.SetMaterial( editMat )
            local iconSize = 16
            surface.DrawTexturedRect( (h-iconSize)*0.5, (h*0.5)-(iconSize*0.5), iconSize, iconSize )
        end
        rarityEditNameButton.DoClick = function()
            BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), "What should the new rarity name be?", v[1], function( text ) 
                if( text == v[1] ) then return end

                BS_ConfigCopyTable.GENERAL.Rarities[v.Key][1] = text
                self:Refresh()
                BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
        end
    
        local rarityBox = vgui.Create( "bricks_server_raritybox", rarityPanel )
        rarityBox:SetSize( 10, rarityBack:GetTall() )
        rarityBox:SetPos( 0, 0 )
        rarityBox:SetRarityName( v[1], 1 )
        rarityBox:SetCornerRadius( 8 )
        rarityBox:SetRoundedBoxDimensions( false, false, 20, false )

        surface.SetFont( "BRICKS_SERVER_Font20" )
        local typeX, typeY = surface.GetTextSize( "Edit Type" )

        local editTypeButton = vgui.Create( "DButton", rarityPanel )
        editTypeButton:SetText( "" )
        editTypeButton:SetSize( typeX+25, 35 )
        editTypeButton:SetPos( rarityBack:GetWide()-rarityNum:GetWide()-10-10-40-editTypeButton:GetWide()-5, rarityBack:GetTall()-10-editTypeButton:GetTall() )
        local alpha = 0
        editTypeButton.Paint = function( self2, w, h )
            draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )

            if( not self2:IsDown() and self2:IsHovered() ) then
                alpha = math.Clamp( alpha+10, 0, 255 )
            else
                alpha = math.Clamp( alpha-10, 0, 255 )
            end
    
            surface.SetAlphaMultiplier( alpha/255 )
            draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )
            surface.SetAlphaMultiplier( 1 )
    
            BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 0 ), 8 )

            draw.SimpleText( "Edit Type", "BRICKS_SERVER_Font20", w*0.5, h*0.5-1, BRICKS_SERVER.Func.GetTheme( 6, 20+(235*(alpha/255)) ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
        editTypeButton.DoClick = function()
			local options = {}
			for k, v in pairs( BRICKS_SERVER.DEVCONFIG.RarityTypes ) do
				options[k] = v.Title
            end
            
			BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "admin" ), "What should the rarity color type be?", v[2], options, function( value, data ) 
				if( BRICKS_SERVER.DEVCONFIG.RarityTypes[data] ) then
                    if( data == v[2] ) then return end

                    local oldColors = BS_ConfigCopyTable.GENERAL.Rarities[v.Key][3]
                    if( data == "Rainbow" ) then
                        BS_ConfigCopyTable.GENERAL.Rarities[v.Key][3] = nil
                    elseif( data == "SolidColor" ) then
                        BS_ConfigCopyTable.GENERAL.Rarities[v.Key][3] = (oldColors and (((istable( oldColors ) and not oldColors.r) and oldColors[1]) or oldColors)) or Color( 125, 125, 125 )
                    else
                        BS_ConfigCopyTable.GENERAL.Rarities[v.Key][3] = ((istable( oldColors ) and not oldColors.r) and oldColors) or { oldColors, oldColors }
                    end

                    BS_ConfigCopyTable.GENERAL.Rarities[v.Key][2] = data
                    self:Refresh()
                    BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
				else
					notification.AddLegacy( BRICKS_SERVER.Func.L( "invalidType" ), 1, 3 )
				end
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
        end

        local deleteButton = vgui.Create( "DButton", rarityPanel )
        deleteButton:SetText( "" )
        deleteButton:SetSize( 40, 40 )
        deleteButton:SetPos( rarityBack:GetWide()-rarityNum:GetWide()-10-10-deleteButton:GetWide(), rarityBack:GetTall()-10-deleteButton:GetTall() )
        local alpha = 0
        local deleteMat = Material( "materials/bricks_server/delete.png" )
        deleteButton.Paint = function( self2, w, h )
            draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )

            if( not self2:IsDown() and self2:IsHovered() ) then
                alpha = math.Clamp( alpha+10, 0, 255 )
            else
                alpha = math.Clamp( alpha-10, 0, 255 )
            end
    
            surface.SetAlphaMultiplier( alpha/255 )
            draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
            surface.SetAlphaMultiplier( 1 )
    
            BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 4 ), 8 )

            surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6, 20+(235*(alpha/255)) ) )
            surface.SetMaterial( deleteMat )
            local iconSize = 24
            surface.DrawTexturedRect( (h-iconSize)*0.5, (h*0.5)-(iconSize*0.5), iconSize, iconSize )
        end
        deleteButton.DoClick = function()
            BRICKS_SERVER.Func.CreatePopoutQuery( "Are you sure you want to remove this rarity?", self, self.panelWide, self.panelTall, "Confirm", "Cancel", function()
                table.remove( BS_ConfigCopyTable.GENERAL.Rarities, v.Key )
                self:Refresh()
                BRICKS_SERVER.Func.ConfigChange( "GENERAL" )

                BRICKS_SERVER.Func.CreateTopNotification( "Rarity successfully removed!", 3, BRICKS_SERVER.DEVCONFIG.BaseThemes.Red )
            end )
        end

        if( v[2] == "Gradient" or v[2] == "Fade" or v[2] == "SolidColor" ) then
            local colorsBack = vgui.Create( "DPanel", rarityPanel )
            colorsBack:SetSize( 0, 30 )
            colorsBack:SetPos( 10+10, rarityBack:GetTall()-10-colorsBack:GetTall() )
            colorsBack.Paint = function( self2, w, h ) end
            colorsBack.AddColor = function( color, doClick )
                colorsBack:SetWide( colorsBack:GetWide()+colorsBack:GetTall()+((colorsBack:GetWide() > 0 and 5) or 0) )

                local colorButton = vgui.Create( "DButton", colorsBack )
                colorButton:SetText( "" )
                colorButton:Dock( LEFT )
                colorButton:DockMargin( 0, 0, 5, 0 )
                colorButton:SetWide( colorsBack:GetTall() )
                local alpha = 0
                local x, y, w, h = 0, 0, colorButton:GetWide(), colorButton:GetWide()
                colorButton.Paint = function( self2, w, h )
                    local toScreenX, toScreenY = self2:LocalToScreen( 0, 0 )
                    if( x != toScreenX or y != toScreenY ) then
                        x, y = toScreenX, toScreenY
                    end

                    draw.RoundedBox( 8, 0, 0, w, h, color )
        
                    if( not self2:IsDown() and self2:IsHovered() ) then
                        alpha = math.Clamp( alpha+10, 0, 125 )
                    else
                        alpha = math.Clamp( alpha-10, 0, 125 )
                    end
            
                    surface.SetAlphaMultiplier( alpha/255 )
                    draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )
                    surface.SetAlphaMultiplier( 1 )
                end
                colorButton.DoClick = function()
                    doClick( colorButton, x+w-5, y+(h*0.5) )
                end
            end

            if( v[2] == "Gradient" or v[2] == "Fade" ) then
                for key, val in pairs( v[3] ) do
                    colorsBack.AddColor( val, function( colorButton, x, y )
                        colorButton.Menu = vgui.Create( "bricks_server_popupdmenu" )
                        colorButton.Menu:AddOption( "Edit Color", function() 
                            BRICKS_SERVER.Func.ColorRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newColorQuery" ), val, function( color ) 
                                BS_ConfigCopyTable.GENERAL.Rarities[v.Key][3][key] = color
                                self:Refresh()
                                BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
                            end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
                        end )
                        if( #v[3] > 2 ) then
                            colorButton.Menu:AddOption( "Remove", function() 
                                if( #v[3] <= 2 ) then return end

                                table.remove( BS_ConfigCopyTable.GENERAL.Rarities[v.Key][3], key )
                                self:Refresh()
                                BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
                            end )
                        end
                        colorButton.Menu:Open( colorButton, x, y-(colorButton.Menu:GetTall()*0.5) )
                    end )
                end

                colorsBack:SetWide( colorsBack:GetWide()+colorsBack:GetTall()+((colorsBack:GetWide() > 0 and 5) or 0) )

                local colorAddButton = vgui.Create( "DButton", colorsBack )
                colorAddButton:SetText( "" )
                colorAddButton:Dock( LEFT )
                colorAddButton:DockMargin( 0, 0, 5, 0 )
                colorAddButton:SetWide( colorsBack:GetTall() )
                local alpha = 0
                local addMat = Material( "materials/bricks_server/add_16_thin.png" )
                colorAddButton.Paint = function( self2, w, h )
                    draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )
        
                    if( not self2:IsDown() and self2:IsHovered() ) then
                        alpha = math.Clamp( alpha+10, 0, 255 )
                    else
                        alpha = math.Clamp( alpha-10, 0, 255 )
                    end
            
                    surface.SetAlphaMultiplier( alpha/255 )
                    draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )
                    surface.SetAlphaMultiplier( 1 )
            
                    BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 0 ), 8 )
        
                    surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6, 20+(235*(alpha/255)) ) )
                    surface.SetMaterial( addMat )
                    local iconSize = 16
                    surface.DrawTexturedRect( (h-iconSize)*0.5, (h*0.5)-(iconSize*0.5), iconSize, iconSize )
                end
                colorAddButton.DoClick = function()
                    BRICKS_SERVER.Func.ColorRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newColorQuery" ), Color( 125, 125, 125 ), function( color ) 
                        table.insert( BS_ConfigCopyTable.GENERAL.Rarities[v.Key][3], color )
                        self:Refresh()
                        BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
                    end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
                end
            else
                colorsBack.AddColor( v[3], function()
                    BRICKS_SERVER.Func.ColorRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newColorQuery" ), v[3], function( color ) 
                        BS_ConfigCopyTable.GENERAL.Rarities[v.Key][3] = color
                        self:Refresh()
                        BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
                    end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
                end )
            end
        end
    end
end

function PANEL:Paint( w, h )
    
end

vgui.Register( "bricks_server_config_rarities", PANEL, "DPanel" )
--PATH addons/____bricks_framework/lua/bricks_server/vgui/bricks_server_settings.lua:
local PANEL = {}

function PANEL:FillSettings()
    self:Clear()

    for k, v in pairs( BRICKS_SERVER.BASECLIENTCONFIG ) do
        local type = v[2] or ""
        if( type == "string" or type == "number" or type == "bind" or type == "bool" ) then
            local displayValue = BRICKS_SERVER.Func.GetClientConfig( k ) or BRICKS_SERVER.Func.L( "emptyValue" )
            if( type == "bind" and BRICKS_SERVER.DEVCONFIG.KEY_BINDS[displayValue] ) then
                displayValue = string.upper( BRICKS_SERVER.DEVCONFIG.KEY_BINDS[displayValue] )
            elseif( type == "bool" ) then
                displayValue = string.upper( tostring( BRICKS_SERVER.Func.GetClientConfig( k ) or false ) )
            end

            local variableBack = vgui.Create( "DPanel", self )
            variableBack:Dock( TOP )
            variableBack:DockMargin( 0, 0, 0, 5 )
            variableBack:SetTall( 65 )
            variableBack:DockPadding( 0, 0, 30, 0 )
            variableBack.Paint = function( self2, w, h )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

                draw.SimpleText( v[1] or k, "BRICKS_SERVER_Font33", 15, 5, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
                draw.SimpleText( displayValue, "BRICKS_SERVER_Font20", 18, 32, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
            end

            local variableAction = vgui.Create( "DButton", variableBack )
            variableAction:SetPos( 0, 0 )
            variableAction:SetSize( (ScrW()*0.6)-BRICKS_SERVER.DEVCONFIG.MainNavWidth-20, variableBack:GetTall() )
            variableAction:SetText( "" )
            local changeAlpha = 0
            variableAction.Paint = function( self2, w, h ) 
                if( self2:IsDown() ) then
                    changeAlpha = math.Clamp( changeAlpha+10, 0, 125 )
                elseif( self2:IsHovered() ) then
                    changeAlpha = math.Clamp( changeAlpha+10, 0, 95 )
                else
                    changeAlpha = math.Clamp( changeAlpha-10, 0, 95 )
                end

                surface.SetAlphaMultiplier( changeAlpha/255 )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
                surface.SetAlphaMultiplier( 1 )
            end
            variableAction.DoClick = function( self2 )
                if( type == "bind" ) then
                    self2:RequestFocus()
                    displayValue = BRICKS_SERVER.Func.L( "pressKey" )
                elseif( type == "bool" ) then
                    BRICKS_SERVER.Func.ChangeClientConfig( k, not (BRICKS_SERVER.Func.GetClientConfig( k ) or false) )
                    self:FillSettings()
                elseif( type == "number" ) then
                    BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newValueQuery" ), BRICKS_SERVER.Func.GetClientConfig( k ) or 0, function( number ) 
                        BRICKS_SERVER.Func.ChangeClientConfig( k, number )
                        self:FillSettings()
                    end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), true )
                elseif( type == "string" ) then
                    BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newValueQuery" ), BRICKS_SERVER.Func.GetClientConfig( k ) or "", function( text ) 
                        BRICKS_SERVER.Func.ChangeClientConfig( k, text )
                        self:FillSettings()
                    end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
                end
            end

            if( type == "bind" ) then
                variableAction.OnKeyCodeReleased = function( self, text )
                    BRICKS_SERVER.Func.ChangeClientConfig( k, text )
                    self:FocusNext()
                    displayValue = BRICKS_SERVER.Func.GetClientConfig( k ) or BRICKS_SERVER.Func.L( "emptyValue" )
                    if( BRICKS_SERVER.DEVCONFIG.KEY_BINDS[displayValue] ) then
                        displayValue = string.upper( BRICKS_SERVER.DEVCONFIG.KEY_BINDS[displayValue] )
                    end
                end
            end
        end
    end
end

function PANEL:Init()
    self:FillSettings()
end

function PANEL:Paint( w, h )

end

vgui.Register( "bricks_server_settings", PANEL, "bricks_server_scrollpanel" )
--PATH addons/____bricks_gangs/lua/bricks_server/modules/gangs/vgui/bricks_server_gangmenu_members.lua:
local PANEL = {}

function PANEL:Init()

end

function PANEL:FillPanel( gangTable )
    local topBar = vgui.Create( "DPanel", self )
    topBar:Dock( TOP )
    topBar:DockMargin( 10, 10, 10, 5 )
    topBar:SetTall( 40 )
    topBar.Paint = function( self2, w, h ) end

    if( LocalPlayer():GangHasPermission( "InvitePlayers" ) ) then
        local invite = vgui.Create( "DButton", topBar )
        invite:Dock( RIGHT )
        invite:DockMargin( 5, 0, 0, 0 )
        invite:SetWide( 40 )
        invite:SetText( "" )
        local Alpha = 0
        local inviteMat = Material( "bricks_server/invite.png" )
        invite.Paint = function( self2, w, h )
            if( self2:IsDown() ) then
                Alpha = 0
            elseif( self2:IsHovered() ) then
                Alpha = math.Clamp( Alpha+5, 0, 100 )
            else
                Alpha = math.Clamp( Alpha-5, 0, 100 )
            end
        
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
            surface.SetAlphaMultiplier( Alpha/255 )
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
            surface.SetAlphaMultiplier( 1 )
        
            surface.SetDrawColor( 255, 255, 255, 20+(235*(Alpha/100)) )
            surface.SetMaterial( inviteMat )
            local iconSize = 24
            surface.DrawTexturedRect( (w*0.5)-(iconSize*0.5), (h*0.5)-(iconSize*0.5), iconSize, iconSize )
        end
        invite.DoClick = function()
            local options = {}
            for k, v in player.Iterator() do
                if( gangTable.Members[v:SteamID()] ) then continue end
                
                options[v:SteamID()] = v:Nick() .. " (" .. ((not v:IsBot() and v:SteamID()) or "BOT") .. ")"
            end

            BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "gang" ), BRICKS_SERVER.Func.L( "gangInvitePlayerQuery" ), BRICKS_SERVER.Func.L( "none" ), options, function( value, data ) 
                if( options[data] ) then
                    net.Start( "BRS.Net.GangInvite" )
                        net.WriteString( data )
                    net.SendToServer()
                else
                    notification.AddLegacy( BRICKS_SERVER.Func.L( "invalidPlayer" ), 1, 3 )
                end
            end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), true )
        end
    end

    local sortBy = vgui.Create( "bricks_server_combo", topBar )
    sortBy:Dock( RIGHT )
    sortBy:DockMargin( 5, 0, 0, 0 )
    sortBy:SetWide( 150 )
    sortBy:SetValue( BRICKS_SERVER.Func.L( "gangHighestRank" ) )
    local sortChoice = "rank_low_to_high"
    sortBy:AddChoice( BRICKS_SERVER.Func.L( "gangHighestRank" ), "rank_low_to_high" )
    sortBy:AddChoice( BRICKS_SERVER.Func.L( "gangLowestRank" ), "rank_high_to_low" )
    sortBy.OnSelect = function( self2, index, value, data )
        sortChoice = data
        self.RefreshPanel()
    end

    local searchBarBack = vgui.Create( "DPanel", topBar )
    searchBarBack:Dock( FILL )
    local search = Material( "materials/bricks_server/search.png" )
    local Alpha = 0
    local Alpha2 = 20
    local searchBar
    local color1 = BRICKS_SERVER.Func.GetTheme( 2 )
    searchBarBack.Paint = function( self2, w, h )
        draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

        if( searchBar:IsEditing() ) then
            Alpha = math.Clamp( Alpha+5, 0, 100 )
            Alpha2 = math.Clamp( Alpha2+20, 20, 255 )
        else
            Alpha = math.Clamp( Alpha-5, 0, 100 )
            Alpha2 = math.Clamp( Alpha2-20, 20, 255 )
        end
        
        draw.RoundedBox( 5, 0, 0, w, h, Color( color1.r, color1.g, color1.b, Alpha ) )
    
        surface.SetDrawColor( 255, 255, 255, Alpha2 )
        surface.SetMaterial(search)
        local size = 24
        surface.DrawTexturedRect( w-size-(h-size)*0.5, (h-size)*0.5, size, size )
    end
    
    searchBar = vgui.Create( "bricks_server_search", searchBarBack )
    searchBar:Dock( FILL )

    local scrollPanel = vgui.Create( "bricks_server_scrollpanel", self )
    scrollPanel:Dock( FILL )
    scrollPanel:DockMargin( 10, 0, 10, 10 )
    scrollPanel.Paint = function( self, w, h ) end 

    local spacing = 5
    local gridWide = self.panelWide-20
    local slotsWide = 3
    local slotWide = (gridWide-((slotsWide-1)*spacing))/slotsWide
    local slotTall = 75

    local grid = vgui.Create( "DIconLayout", scrollPanel )
    grid:Dock( TOP )
    grid:SetTall( slotTall )
    grid:SetSpaceY( spacing )
    grid:SetSpaceX( spacing )

    local ownerMat = Material( "bricks_server/crown.png" )

    function self.RefreshPanel()
        grid:Clear()
        grid.slots = 0

        local showMembers = {}
        for k, v in pairs( gangTable.Members or {} ) do
            if( (searchBar:GetValue() != "" and not string.find( string.lower( v[1] ), string.lower( searchBar:GetValue() ) )) ) then
                continue
            end

            local memberPly = player.GetBySteamID( k )

            local sortValue = v[2]+((not IsValid( memberPly ) and 100) or 0)

            table.insert( showMembers, { sortValue, k } )
        end
        
        if( sortChoice and string.EndsWith( sortChoice, "high_to_low" ) ) then
            table.SortByMember( showMembers, 1, false )
        else
            table.SortByMember( showMembers, 1, true )
        end

        for k, v in pairs( showMembers ) do
            local memberKey, memberTable = v[2], (gangTable.Members or {})[v[2]]

            grid.slots = (grid.slots or 0)+1
            local slots = grid.slots
            local slotsTall = math.ceil( slots/slotsWide )
            grid:SetTall( (slotsTall*slotTall)+((slotsTall-1)*spacing) ) 

            BRICKS_SERVER.Func.GangCreateMemberSlot( grid, slotWide, slotTall, memberKey, memberTable[1], memberTable[2], gangTable )
        end
    end
    self.RefreshPanel()

    searchBar.OnChange = function()
        self.RefreshPanel()
    end
end

function PANEL:Paint( w, h )

end

vgui.Register( "bricks_server_gangmenu_members", PANEL, "DPanel" )
--PATH addons/____bricks_gangs/lua/bricks_server/modules/gangs/vgui/bricks_server_gangmenu_page_version.lua:
local PANEL = {}

function PANEL:Init()
    self.mainPanel = vgui.Create( "DPanel", self )
    self.mainPanel:Dock( FILL )
    self.mainPanel.Paint = function( self2, w, h ) end

    self.pageWide = ScrW()*0.6-BRICKS_SERVER.DEVCONFIG.MainNavWidth

    hook.Add( "BRS.Hooks.RefreshGang", self, function( self, valuesChanged, refreshGang )
        if( IsValid( self ) ) then
            if( not valuesChanged or valuesChanged["Roles"] or valuesChanged["Members"] or valuesChanged["Icon"] or valuesChanged["Owner"] ) then
                self:RefreshGang()
            end
        else
            hook.Remove( "BRS.Hooks.RefreshGang", self )
        end
    end )

    hook.Add( "BRS.Hooks.ConfigReceived", self, function( self, valuesChanged )
        if( IsValid( self ) ) then
            if( not valuesChanged or valuesChanged.GANGS ) then
                self:RefreshGang()
            end
        else
            hook.Remove( "BRS.Hooks.ConfigReceived", self )
        end
    end )
end

function PANEL:RefreshGang()
    if( IsValid( self.sheet ) ) then
        if( IsValid( self.sheet.ActiveButton ) ) then
            self.previousSheet = self.sheet.ActiveButton.label
        end
        self.sheet:Remove()
    end

    self.mainPanel:Clear()

    self.sheet = vgui.Create( "bricks_server_colsheet", self.mainPanel )
    self.sheet:Dock( FILL )
    self.sheet.Navigation:SetWide( BRICKS_SERVER.DEVCONFIG.MainNavWidth )
    self.sheet.Navigation.Paint = function( self2, w, h )
        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 3, 125 ) )
        surface.DrawRect( 0, 0, w, h )
	end

    local gangTable = (BRICKS_SERVER_GANGS or {})[LocalPlayer():GetGangID()]

    local height = 55
    local avatarBackSize = height
    local avatarSize = ((gangTable or {}).Icon and height-8) or 32
    local textStartPos = 65

    local avatarBack = vgui.Create( "DPanel", self.sheet.Navigation )
    avatarBack:Dock( TOP )
    avatarBack:DockMargin( 10, 10, 10, 0 )
    avatarBack:SetTall( height )
    local iconMat
    BRICKS_SERVER.Func.GetImage( (gangTable or {}).Icon or "question.png", function( mat ) 
        iconMat = mat 
    end )
    local groupData = LocalPlayer():GangGetGroupData()
    avatarBack.Paint = function( self2, w, h )
        draw.RoundedBox( 8, 0, 0, avatarBackSize, avatarBackSize, BRICKS_SERVER.Func.GetTheme( 1 ) )

        draw.SimpleText( ((gangTable and (gangTable.Name or BRICKS_SERVER.Func.L( "nil" ))) or BRICKS_SERVER.Func.L( "gangNone" )), "BRICKS_SERVER_Font23", textStartPos, h*0.5+2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_BOTTOM )
        draw.SimpleText( ((groupData and groupData[1]) or "None"), "BRICKS_SERVER_Font17", textStartPos+1, h*0.5-2, ((groupData and groupData[2]) or BRICKS_SERVER.Func.GetTheme( 6 )), 0, 0 )

        if( iconMat ) then
            surface.SetDrawColor( 255, 255, 255, 255 )
            surface.SetMaterial( iconMat )
            surface.DrawTexturedRect( (avatarBackSize-avatarSize)*0.5, (avatarBackSize-avatarSize)*0.5, avatarSize, avatarSize )
        end
    end

    local levelBarH = 16
    local levelBack = vgui.Create( "DPanel", self.sheet.Navigation )
    levelBack:Dock( TOP )
    levelBack:DockMargin( 10, 10, 10, 25 )
    levelBack:SetTall( levelBarH+20 )
    levelBack.Paint = function( self2, w, h )
        draw.SimpleText( string.upper( BRICKS_SERVER.Func.L( "levelX", (gangTable or {}).Level or 0) ), "BRICKS_SERVER_Font15", 0, h-levelBarH-3, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_BOTTOM )

        local currentXP = math.max( 0, ((gangTable or {}).Experience or 0)-BRICKS_SERVER.Func.GetGangExpToLevel( 0, ((gangTable or {}).Level or 0) ) )
        local goalXP = math.max( 0, BRICKS_SERVER.Func.GetGangExpToLevel( ((gangTable or {}).Level or 0), ((gangTable or {}).Level or 0)+1 ) )

        draw.SimpleText( string.Comma( math.floor( currentXP ) ) .. "/" .. string.Comma( math.floor( goalXP ) ) .. "XP", "BRICKS_SERVER_Font15", w, h-levelBarH-3, Color( BRICKS_SERVER.Func.GetTheme( 6 ).r, BRICKS_SERVER.Func.GetTheme( 6 ).g, BRICKS_SERVER.Func.GetTheme( 6 ).b, 75 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM )

        draw.RoundedBox( levelBarH*0.5, 0, h-levelBarH, w, levelBarH, BRICKS_SERVER.Func.GetTheme( 1 ) )
        draw.RoundedBox( levelBarH*0.5, 0, h-levelBarH, math.Clamp( w*(currentXP/goalXP), 0, w ), levelBarH, BRICKS_SERVER.Func.GetTheme( 5 ) )
    end

    if( not gangTable ) then
        local inboxButton = vgui.Create( "DButton", self.sheet.Navigation )
        inboxButton:SetSize( 36, 36 )
        inboxButton:SetPos( self.sheet.Navigation:GetWide()-10-inboxButton:GetWide(), 10 )
        inboxButton:SetText( "" )
        local Alpha = 0
        local inboxMat = Material( "bricks_server/invite.png" )
        inboxButton.Paint = function( self2, w, h )
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
            surface.SetMaterial( inboxMat )
            local iconSize = 24
            surface.DrawTexturedRect( (w*0.5)-(iconSize*0.5), (h*0.5)-(iconSize*0.5), iconSize, iconSize )
        end

        BRICKS_SERVER.Func.GangCreateInbox( self, inboxButton, true, inboxButton:GetTall()+5, inboxButton:GetPos() )
    end

    local pages = {}
    if( gangTable ) then
        table.insert( pages, { BRICKS_SERVER.Func.L( "gangDashboard" ), "bricks_server_gangmenu_dashboard", "dashboard.png" } )
        table.insert( pages, { BRICKS_SERVER.Func.L( "gangMembers" ), "bricks_server_gangmenu_members", "gangs_24.png" } )

        if( LocalPlayer():GangHasPermission( "ViewItem" ) and BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "storage" ) ) then
            table.insert( pages, { BRICKS_SERVER.Func.L( "gangStorage" ), "bricks_server_gangmenu_storage", "crate_24.png" } )
        end

        table.insert( pages, { BRICKS_SERVER.Func.L( "gangUpgrades" ), "bricks_server_gangmenu_upgrades", "gang_upgrades.png" } )

        if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "achievements" ) ) then
            table.insert( pages, { BRICKS_SERVER.Func.L( "gangAchievements" ), "bricks_server_gangmenu_achievements", "gang_achievements.png" } )
        end

        if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "associations" ) ) then
            table.insert( pages, { BRICKS_SERVER.Func.L( "gangAssociations" ), "bricks_server_gangmenu_associations", "gang_relation.png" } )
        end

        if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "leaderboards" ) ) then
            table.insert( pages, { BRICKS_SERVER.Func.L( "gangLeaderboards" ), "bricks_server_gangmenu_leaderboards", "gang_leaderboard.png" } )
        end

        if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "territories" ) ) then
            table.insert( pages, { BRICKS_SERVER.Func.L( "gangTerritories" ), "bricks_server_gangmenu_territories", "gang_territory.png" } )
        end

        if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "printers" ) ) then
            table.insert( pages, { BRICKS_SERVER.Func.L( "gangPrinters" ), "bricks_server_gangmenu_printers", "gang_printers.png" } )
        end

        if( LocalPlayer():GangHasPermission( "EditSettings" ) ) then
            table.insert( pages, { BRICKS_SERVER.Func.L( "settings" ), "bricks_server_gangmenu_settings", "settings_24.png" } )
        end

        if( LocalPlayer():GangHasPermission( "EditRoles" ) ) then
            table.insert( pages, { BRICKS_SERVER.Func.L( "gangRanks" ), "bricks_server_gangmenu_roles", "gang_ranks.png" } )
        end
    else
        table.insert( pages, { BRICKS_SERVER.Func.L( "gangCreate" ), "bricks_server_gangmenu_create", "gang_new.png" } )
    end

    if( BRICKS_SERVER.Func.HasAdminAccess( LocalPlayer() ) ) then
        table.insert( pages, { BRICKS_SERVER.Func.L( "admin" ), "bricks_server_gangmenu_admin", "admin_24.png", BRICKS_SERVER.Func.GetTheme( 4 ), BRICKS_SERVER.Func.GetTheme( 5 ) } )
    end

    for k, v in pairs( pages ) do
        local page = vgui.Create( v[2], self.sheet )
        page:Dock( FILL )
        page.panelWide, page.panelHeight = self.pageWide, ScrH()*0.65-40
        page.Paint = function( self, w, h ) end 

        if( page.FillPanel ) then
            self.sheet:AddSheet( v[1], page, function()
                page:FillPanel( gangTable ) 
            end, v[3], v[4], v[5] )
        else
            self.sheet:AddSheet( v[1], page, false, v[3], v[4], v[5] )
        end
    end

    if( self.previousSheet ) then
        self.sheet:SetActiveSheet( self.previousSheet )
    end
end

function PANEL:Paint( w, h )

end

vgui.Register( "bricks_server_gangmenu_page_version", PANEL, "DPanel" )
--PATH addons/____bricks_gangs/lua/bricks_server/modules/gangs/vgui/bricks_server_gangmenu_upgrades.lua:
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
                surface.DrawTexturedRect( (w*0.5)-(iconSize*0.5), (h*0.5)-(iconSize*0.5), iconSize, iconSize )
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
                    surface.DrawTexturedRect( (w*0.5)-(iconSize*0.5), (h*0.5)-(iconSize*0.5), iconSize, iconSize )
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
                    surface.DrawTexturedRect( (w*0.5)-(iconSize*0.5), (h*0.5)-(iconSize*0.5), iconSize, iconSize )
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

                    draw.SimpleText( BRICKS_SERVER.Func.L( "gangUpgradeTier", math.min( upgrade, #upgradeTiers ), #upgradeTiers ), "BRICKS_SERVER_Font17", 10, h*0.5-1, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
                    
                    draw.SimpleText( math.floor( decimal*100 ) .. "%", "BRICKS_SERVER_Font17", w-10, h*0.5-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
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

                        draw.SimpleText( text, "BRICKS_SERVER_Font17", w*0.5, h*0.5-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
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

                        draw.SimpleText( text, "BRICKS_SERVER_Font17", w*0.5, h*0.5-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
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
--PATH addons/____bricks_gangs/lua/bricks_server/modules/gangs/submodules/leaderboards/client/cl_gang_leaderboards.lua:
BRICKS_SERVER.Func.AddConfigPage( BRICKS_SERVER.Func.L( "gangLeaderboards" ), "bricks_server_config_gang_leaderboards", "gangs" )

net.Receive( "BRS.Net.SendGangLeaderboardTables", function()
    BRS_GANG_LEADERBOARDS = net.ReadTable() or {}

    hook.Run( "BRS.Hooks.RefreshGangLeaderboards" )
end )

net.Receive( "BRS.Net.SendLeaderboardGangTables", function()
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

    hook.Run( "BRS.Hooks.RefreshGangLeaderboards" )
end )

function BRICKS_SERVER.Func.RequestLeaderboardGangs()
    if( CurTime() < (BRS_REQUEST_LEADERBOARDGANG_COOLDOWN or 0) ) then return end

    BRS_REQUEST_LEADERBOARDGANG_COOLDOWN = CurTime()+10

    net.Start( "BRS.Net.RequestLeaderboardGangs" )
    net.SendToServer()
end

function BRICKS_SERVER.Func.RequestGangLeaderboards()
    if( CurTime() < (BRS_REQUEST_GANGLEADERBOARDS_COOLDOWN or 0) ) then return end

    BRS_REQUEST_GANGLEADERBOARDS_COOLDOWN = CurTime()+1

    net.Start( "BRS.Net.RequestGangLeaderboards" )
    net.SendToServer()
end
--PATH addons/_outfitter/lua/autorun/client/chat_commands_cl.lua:
-- Example: list.Set("ChatCommands","test",function(paramstr,msg) PrintTable{paramstr,msg} return true end)

local cmds={["!"]=true,["\\"]=true,["/"]=true,["."]=true}
local disable_legacy,disable_legacy2
local function Parse(pl,msg)
	if not cmds[msg:sub(1,1)] then return end
	local pos=string.find(msg," ",1,true)

	local com,paramstr
	if pos then
		com,paramstr=msg:sub(2,pos-1),msg:sub(pos+1,-1)
	else
		com=msg:sub(2,-1)
		paramstr=""
	end

	local ret = hook.Run("ChatCommand",com,paramstr,msg)
	if ret==true then return ret end
	if ret==false then return end
	
	local commands = list and list.GetForEdit("ChatCommands")
	local command = commands[com] or commands[com:lower()]
	
	if command then
		local ok,ret = xpcall(command,debug.traceback,paramstr,msg)
		if not ok then ErrorNoHalt(("%s\n"):format(ret)) end
		if ret==true then return ret end
		if ret==false then return end
	end
	
end

hook.Add("OnPlayerChat","ChatCommand",function(pl,msg)
	if pl~=LocalPlayer() then return end
	return Parse(pl,msg)
end)

hook.Add("PlayerSay","ChatCommand",function(pl,msg)
	if pl~=LocalPlayer() then return end
	if not disable_legacy then
		hook.Remove("OnPlayerChat","ChatCommand")
		disable_legacy =  true
	end

	return Parse(pl,msg)
end)

-- For custom chatboxes
hook.Add("OnClientChatCommand","ChatCommand",function(...)
	if not disable_legacy2 then
		hook.Remove("PlayerSay","ChatCommand")
		hook.Remove("OnPlayerChat","ChatCommand")
		disable_legacy2 = true
	end	
	return Parse(...)
end)

--PATH addons/_bitminers2/lua/bitminers2_config.lua:
BM2CONFIG = {}
--Setting this to false will disable the generator from making sound.
BM2CONFIG.GeneratorsProduceSound = true
--Dollas a bitcoins sells for. Dont make this too large or it will be too easy to make money
BM2CONFIG.BitcoinValue = 218
--This is a value that when raising or lowering will effect the speed of all bitminers.
--This is a balanced number and you should only change it if you know you need to. Small increments make big differences
BM2CONFIG.BaseSpeed = 0.005
--The higher this number, the faster the generator will loose fuel.
--You can use this to balance out more so they need to buy fuel more frequently
BM2CONFIG.BaseFuelDepletionRate = 0.9 --0.9 default
--This will allow you to change the default generator output level
BM2CONFIG.GeneratorPowerOutput = 10 --This should only be whole numbers, 10 == 1000W
--These should be 1 by default, changing them high will increase the default
--speed for that bitminer. Making it lower than 1 makes it slower. 
--Remember this is a multiplier so 1 = normal, 2 = twice as fast, 3 = three times as fast, 0.5 = half as slow
BM2CONFIG.BitminerSpeedMulipliers = {
	["bitminerS1"] = 0.88,
	["bitminerS2"] = 1.03,
	["bitminerRack"] = 0.48
}

hook.Add( "loadCustomDarkRPItems", "BM2.RegisterEntities", function()
	DarkRP.createCategory{
		name = "Bitminers 2",
		categorises = "entities",
		startExpanded = true,
		color = Color( 120, 120, 255, 255 ),
		sortOrder = 1,
	}

	DarkRP.createEntity( "Bitminer S1", {
		ent = "bm2_bitminer_1",
		model = "models/bitminers2/bitminer_1.mdl",
		price = 5000,
		max = 4,
		cmd = "buybitminers1",
		category = "Bitminers 2"
	} )

	DarkRP.createEntity( "Bitminer S2", {
		ent = "bm2_bitminer_2",
		model = "models/bitminers2/bitminer_3.mdl",
		price = 25000,
		max = 4,
		cmd = "buybitminers2",
		category = "Bitminers 2"
	} )

	DarkRP.createEntity( "Bitminer Server", {
		ent = "bm2_bitminer_server",
		model = "models/bitminers2/bitminer_2.mdl",
		price = 50000,
		max = 16,
		cmd = "buybitminerserver",
		category = "Bitminers 2"
	} )

	DarkRP.createEntity( "Bitminer Rack", {
		ent = "bm2_bitminer_rack",
		model = "models/bitminers2/bitminer_rack.mdl",
		price = 100000,
		max = 2,
		cmd = "buybitminerrack",
		category = "Bitminers 2"
	} )

	DarkRP.createEntity( "Extension Lead", {
		ent = "bm2_extention_lead",
		model = "models/bitminers2/bitminer_plug_3.mdl",
		price = 500,
		max = 8,
		cmd = "buybitminerextension",
		category = "Bitminers 2"
	} )

	DarkRP.createEntity( "Power Lead", {
		ent = "bm2_power_lead",
		model = "models/bitminers2/bitminer_plug_2.mdl",
		price = 500,
		max = 10,
		cmd = "buybitminerpowerlead",
		category = "Bitminers 2"
	} )

	DarkRP.createEntity( "Generator", {
		ent = "bm2_generator",
		model = "models/bitminers2/generator.mdl",
		price = 6000,
		max = 3,
		cmd = "buybitminergenerator",
		category = "Bitminers 2"
	} )

	DarkRP.createEntity( "Fuel", {
		ent = "bm2_fuel",
		model = "models/props_junk/gascan001a.mdl",
		price = 1000,
		max = 4,
		cmd = "buybitminerfuel",
		category = "Bitminers 2"
	} )

	hook.Call( "BM2_DLC_loadCustomDarkRPItems" )
end )
--PATH addons/__main/lua/autorun/client/cl_permaload.lua:
/*
   ____          _          _   ____          __  __       _ _                     
  / ___|___   __| | ___  __| | | __ ) _   _  |  \/  | __ _| | |__   ___  _ __ ___  
 | |   / _ \ / _` |/ _ \/ _` | |  _ \| | | | | |\/| |/ _` | | '_ \ / _ \| '__/ _ \ 
 | |__| (_) | (_| |  __/ (_| | | |_) | |_| | | |  | | (_| | | |_) | (_) | | | (_) |
  \____\___/ \__,_|\___|\__,_| |____/ \__, | |_|  |_|\__,_|_|_.__/ \___/|_|  \___/ 
                                      |___/                                        
*/

if not PermaProps then PermaProps = {} end

print("---------------------------------")
print("| Loading ClientSide PermaProps |")
print("---------------------------------")

for k, v in pairs(file.Find("permaprops/cl_*.lua", "LUA")) do
	
	include("permaprops/".. v)
	print("permaprops/".. v)


end

print("---------------------------------")
print("| Loading Shared PermaProps |")
print("---------------------------------")

for k, v in pairs(file.Find("permaprops/sh_*.lua", "LUA")) do
	
	include("permaprops/".. v)
	print("permaprops/".. v)


end

print("---------------------------------")
--PATH addons/unbox/lua/autorun/client/cl_unboxing_2.lua:
include("unbox_config_2.lua")

BUC2.History = {}
BUC2.buttonsLocked = false

surface.CreateFont( "ub2_1", {
	font = "Open Sans Semibold", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	size = 19,
	weight = 8000,
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
	extended = true
} )

surface.CreateFont( "ub2_2", {
	font = "Open Sans Semibold", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	size = 13,
	weight = 10,
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
	extended = true
} )

surface.CreateFont( "ub2_3", {
	font = "Open Sans Semibold", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	size = 30,
	weight = 8000,
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
	extended = true
} )

surface.CreateFont( "ub2_4", {
	font = "Open Sans Semibold", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	size = 24,
	weight = 8000,
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
	extended = true
} )

surface.CreateFont( "ub2_5", {
	font = "Open Sans Semibold", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	size = 85,
	weight = 8000,
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
	outline = true,
	extended = true
} )

surface.CreateFont( "ub2_6", {
	font = "Open Sans Semibold", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	size = 45,
	weight = 8000,
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
	outline = true,
	extended = true
} )

surface.CreateFont( "ub2_7", {
	font = "Open Sans Semibold", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	size = 16,
	weight = 8000,
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
	extended = true
} )

local function divColor( clr, x )
	return Color( clr.r/x, clr.g/x, clr.b/x )
end

local ButtonBlur = Material( "opencase/button_blur.png" )

local headerHight = 30

local ubButtons = {
	[ "Shop" ] = {
		Name = "Магазин",
		Icon = Material "opencase/icons/shop.png",
		Color = Color( 0, 152, 226 ),
		Order = 1
	},
	[ "Crate" ] = {
		Icon = Material "opencase/icons/inventory.png",
		Color = Color( 255, 196, 0 ),
		Order = 2
	},
	[ "Spin" ] = {Hidden = true, Order = 99},
}

local ub_createUpgrade
local ub_createSpin
local poorApi = { // Old (poorly coded) unbox api
	pages = {},
}

local ubFrame = nil
local ubPage = "Crate"

local isOpen = false

local p = FindMetaTable("Panel")

//local inventoryBackground = Material("bu2/inventory_background.png","smooth noclamp")

//local spinBackground = Material("bu2/spin_bg.png","smooth noclamp")
//local spinGlass = Material("bu2/spin_glass.png","smooth noclamp")
local itemShadowMat = Material("bu2/item_shadow.png","smooth noclamp")
local itemBackgroundMat = Material "opencase/bluredcircle.png"
//local itemBannerMat = Material("bu2/item_banner.png","smooth noclamp")
local moneyIcon = Material("bu2/money.png","smooth noclamp")

local OpenCase_Panel = {}
 
local frameColor = Color(30 , 35, 39 ,255)
 
local function FixCam( mdlpnl )
	 local mn, mx = mdlpnl.Entity:GetRenderBounds()
local size = 0
size = math.max( size, math.abs(mn.x) + math.abs(mx.x) )
size = math.max( size, math.abs(mn.y) + math.abs(mx.y) )
size = math.max( size, math.abs(mn.z) + math.abs(mx.z) )

mdlpnl:SetFOV( 45 )
mdlpnl:SetCamPos( Vector( size, size, size ) )
mdlpnl:SetLookAt( (mn + mx) * 0.5 )
end


local function ub_findByIGSid( itemID )
	for k,v in pairs( BUC2.ITEMS ) do
		if v.weaponName == itemID or v.amount == itemID then
			return k
		end
	end
end

net.Receive("ub_annouceunbox", function()
	local player = net.ReadEntity()
	local items = net.ReadTable( )

	local msg = {
		player:Name(), team.GetColor(player:Team()),
		Color(255,255,255,255), " Відкрив кейс і отримав -> ",
	}
	for i, itemID in pairs( items ) do
		local itemName = BUC2.ITEMS[itemID].name1
		local itemColor = BUC2.ITEMS[itemID].color

		if i ~= 1 then
			table.Add( msg, {Color(255,255,255), ", "} )
		end
		table.Add( msg, {itemColor, itemName} )
	end

	table.Add( msg, {
		Color(255,255,255,255), " /unbox"
	} )

	--Print the message
	chat.AddText( unpack( msg ) )
end) 

local function GenerateOutline( self )
	local x = 4
	local w,h = self:GetSize( )

	self.OutlineTop = {
		{x = 0, y = x},
		{x = x, y = 0},

		{x = w - x, y = 0},
		{x = w, y = x},
	}
	self.OutlineBottom = {
		{x = x, y = h},
		{x = 0, y = h - x},

		{x = w, y = h - x},
		{x = w - x, y = h},
	}
end

local SizeW = ScrW() <= 800 and (800 + 10) or 982
local resultWin = ScrW() <= 800 and 88 or 89

local ModelPanel = CompileFile "unbox/modelpanel.lua" {
	outline = GenerateOutline,
	cam = FixCam,
	mat1 = itemBackgroundMat,
	mat2 = moneyIcon
}
local CratePanel = CompileFile "unbox/crate.lua" ( )

function initUnboxFrame()

	if IsValid( sdasdasdsadasd ) then
		sdasdasdsadasd:Remove( )
	end
	BUC2.buttonsLocked = false

	ubPage = "Crate"

	isOpen = true
	ubFrame = vgui.Create("DFrame")
	sdasdasdsadasd = ubFrame
	ubFrame:SetSize(SizeW + 10, ScrH() <= 600 and 600 or 700)
	ubFrame:Center()
	ubFrame:SetDraggable(false)
	ubFrame:SetVisible(true)
	ubFrame:U_PaintFrame() 
	ubFrame:ShowCloseButton(false)
	ubFrame:MakePopup()

	// remove dframe default title
	ubFrame:SetTitle ""
	ubFrame:DockPadding( 5, 0, 5, 5 )


	local close_button = vgui.Create( "DButton" )
	close_button:MakePopup( )
	close_button:NoClipping( true )
	close_button:SetSize( 32, 32 )
	close_button:SetText ""
	close_button:RequestFocus( )
	close_button.Paint = function( self, w, h )
		surface.SetDrawColor( frameColor )
		surface.DrawRect( 0, 0, w, h )

		draw.SimpleText( "X", "DermaLarge", w*0.5, h*0.5, Color( 255, 0, 0 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

		DisableClipping( true )
			draw.NoTexture( )
			surface.DrawPoly( {
				{x = -w * 1.5, y = h},
				{x = 0, y = 0},
				{x = 0, y = h}
			} )
		DisableClipping( false )
	end
	close_button.DoClick = function( self )
		if BUC2.buttonsLocked then return end
		if IsValid( ubFrame ) then
			ubFrame:Remove( )
		else // is it possible?
			self:Remove( )
		end
	end
	ubFrame.PerformLayout = function( self, w, h )
		local x,y = self:GetPos( )
		close_button:SetPos( x + w - 32, y - 32 )
	end
	ubFrame.OnRemove = function( )
		BUC2.buttonsLocked = false
		isOpen = false
		if IsValid( close_button ) then
			close_button:Remove( )
		end
	end


	ubFrame.historyHeader = vgui.Create( "EditablePanel", ubFrame )
	ubFrame.historyHeader:DockMargin( 5, 5, 5, 10 )
	ubFrame.historyHeader:Dock( TOP )
	ubFrame.historyHeader:SetTall( 115 )
	ubFrame.historyHeader.Fill = function( self, data )
		self:Clear( )
		for k, v in pairs( data ) do
			local id = ub_findByIGSid( v )
			if not id then continue end
			local t = vgui.CreateFromTable( ModelPanel, self )
			t:Dock( LEFT )
			t:DockMargin( 5, 0, 10, 0 )
			t:SetWide( 100 )
			t:Set( id )
	
		end
	end
	ubFrame.historyHeader:Fill( BUC2.History )


	local buttonsPanel = vgui.Create( "EditablePanel", ubFrame )
	buttonsPanel:Dock( TOP )
	buttonsPanel:SetTall( 35 )
	buttonsPanel:DockMargin(5, 0, 5, 5)


	ubFrame.scroller = vgui.Create( "DHorizontalScroller", ubFrame )
	ubFrame.scroller:Dock( FILL )
	ubFrame.scroller:SetShowDropTargets( false )
	ubFrame.scroller.btnLeft.Paint=nil
	ubFrame.scroller.btnRight.Paint=nil

	ubFrame.scroller.GetScroll = function( self ) return self.OffsetX end
	ubFrame.scroller.OnMouseWheeled = nil
	--ubFrame.scroller:SetOverlap( -100 )
	ubFrame.scroller:InvalidateParent( true )

	local function CreatePage( id, data )
		local btn = vgui.Create( "DButton", buttonsPanel )
		if data.Hidden then
			btn:SetVisible( false )
		end
		btn:Dock( LEFT )
		btn:DockMargin( 0, 0, 10, 0 )
		btn:SetText ""
		btn.Name = data.Name
		btn.Icon = data.Icon
		btn.Color = data.Color

		btn.CalculateSize = function( self )
			if self.Name then
				surface.SetFont( "ub2_3" )
				local w,h = surface.GetTextSize( self.Name )

				self:SetWide( w + 4 + 32 + 4 + 15 )
			else
				self:SetWide( 4 + 32 + 4 )
			end
		end
		btn:CalculateSize( )

		btn.Paint = function( self, w, h )
			local clr = self.Color or Color( 27, 151, 223 )
			clr = active == self and divColor(clr, 1.5) or self:IsDown() and divColor(clr, 2) or self:IsHovered() and divColor(clr, 1.75) or clr
			
			DisableClipping( true )
				surface.SetDrawColor( clr )
				surface.SetMaterial( ButtonBlur )
				surface.DrawTexturedRect( -w/10, -h/3.4, w + w/5, h + h/1.7 )
			DisableClipping( false )
			
			draw.RoundedBox( 0, 0, 0, w, h, clr )

			surface.SetDrawColor( 255, 255, 255 )
			surface.SetMaterial( self.Icon )
			surface.DrawTexturedRect( 4, h*0.5 - 16, 32, 32 )

			draw.SimpleText( self.Name, "ub2_3", 32 + 4 + 4, h*0.5 - 2 /*center font*/, Color( 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		end

		local page = vgui.Create("DScrollPanel" , ubFrame.scroller)
		page:Dock( LEFT )
		page:SetWide( SizeW ) 
		page.Paint = function()end
		page:InvalidateParent( true )

		poorApi.pages[ id ] = page

		btn.DoClick = function( self )
			if BUC2.buttonsLocked then return end
			ub_Goto( id )
		end

		ubFrame.scroller:AddPanel( page )
	end

	for id, data in SortedPairsByMemberValue( ubButtons, "Order" ) do
		CreatePage( id, data )
	end

	local igs_money = vgui.Create( "EditablePanel", buttonsPanel )
	igs_money:Dock( RIGHT )
	igs_money:DockMargin( 0, 0, 10, 0 )
	igs_money:SetText ""

	local last

	igs_money.CalculateSize = function( self )
		surface.SetFont( "ub2_3" )
		local w,h = surface.GetTextSize( self.Text )

		self:SetWide( w + 4 + 32 + 4 + 8 )
	end

	igs_money.Paint = function( self, w, h )
		local igs = LocalPlayer():IGSFunds( )
		if last ~= igs then
			last = igs
			self.Text = igs .. " ₴"
			self:CalculateSize( )
		end
		draw.RoundedBox( 0, 0, 0, w, h, Color( 92, 137, 52 ) )

		draw.SimpleText( self.Text, "ub2_3", 32 + 4 + 4, h*0.5 - 2 /*center font*/, Color( 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	local plus = vgui.Create( "DButton", igs_money )
	plus:Dock( LEFT )
	plus:SetWide( 32 )
	plus:SetText ""
	plus.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 145, 235, 65 ) )
		draw.SimpleText( "+", "DermaLarge", w*0.5, h*0.5, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	plus.DoClick = function( self )
		if BUC2.buttonsLocked then return end
		IGS.WIN.Deposit( 100 )
	end

	poorApi.pages.Crate.Paint = function(s , w , h)

		--[[surface.SetDrawColor(255,255,255,255)
		surface.SetMaterial(inventoryBackground)
		surface.DrawTexturedRect(0,0,w,h)]]

		--draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 255, 0 ) )
		if LocalPlayer().ubinv == nil or table.Count(LocalPlayer().ubinv) == 0 then
			draw.SimpleText("ПУСТО:(","ub2_5",w*0.5 , h*0.5,Color(255,255,255,255) , 1 , 1)
		end

	end

	ub_CreateInventory()
	ub_createShop()
	-- ub_createUpgrade( )
	ub_createSpin( )

	ubFrame.scroller:ScrollToChild( poorApi.pages.Shop ) // todo: Shop
end

local diagBack = Material("bu2/dialog_background.png", "noclamp smooth")

function ub_refreshInventory()

	if isOpen then
		
		poorApi.pages.Crate:Clear( )

		ub_CreateInventory()

	end

end

function createTansactionWindow(itemID , Amount)


	local buyWindow = vgui.Create("DFrame")
	buyWindow:SetSize(400 , 200)
	buyWindow:Center()
	buyWindow:SetTitle("")
	buyWindow:ShowCloseButton(false)
	buyWindow.itemID = itemID
	buyWindow.Amount = Amount
	buyWindow:SetText("")
	buyWindow.Paint = function(s , w , h)

		Derma_DrawBackgroundBlur( s, CurTime() )

		surface.SetDrawColor(255,255,255,255)
		surface.SetMaterial(diagBack)
		surface.DrawTexturedRect(0,0,w,h) 

		draw.SimpleText("Чек", "ub2_6",200 , 60, Color(255,255,255) , 1,1)

		draw.SimpleText("Кейс : "..BUC2.ITEMS[s.itemID].name2, "ub2_4",200 , 90, Color(255,255,255) , 1,1)
		draw.SimpleText("Количество : "..s.Amount, "ub2_4",200 , 115, Color(255,255,255) , 1,1)
		draw.SimpleText("Цена: "..(BUC2.ITEMS[s.itemID].price * s.Amount).."₴", "ub2_4",200 , 115 + 25, Color(255,255,255) , 1,1)


	end
	buyWindow:SetVisible(true)
	buyWindow:MakePopup()

	local cb = vgui.Create("DButton",buyWindow)
	cb:SetPos(23,200 - 35)
	cb:SetSize(200 - 60,23)
	cb:SetText("")
	cb.p = buyWindow
	cb.Paint = function(s , w  ,h)

		draw.RoundedBox(0,0,0,w,h , Color(30,150,30))

		draw.SimpleText("ОТМЕНА","ub2_2",math.floor(w*0.5) , math.floor(h*0.5) , Color(255,255,255,255) , 1 , 1)

	end
	cb.DoClick = function(s)

		s.p:Close()

	end

	local bb = vgui.Create("DButton",buyWindow)
	bb:SetPos(400 - 23 - (200-60),200 - 35)
	bb:SetSize(200 - 60,23)
	bb:SetText("")
	bb.itemID = itemID
	bb.Amount = Amount
	bb.parent = buyWindow
	bb.price = BUC2.ITEMS[itemID].price * Amount
	bb.canBuy = false
	bb.Paint = function(s , w  ,h)

		local c = Color(30,150,30)

		if not BUC2.BuyItemsWithPoints and not BUC2.BuyItemsWithPoints2 then
			
			if IGS.CanAfford(LocalPlayer(),s.price) == false then
				
				s.canBuy = false 
				c = Color(90,90,90) 

			else

				s.canBuy = true

			end


		else
			if BUC2.BuyItemsWithPoints then
				if LocalPlayer():PS_HasPoints(s.price) == false then
					s.canBuy = false 
					c = Color(90,90,90) 
				else
					s.canBuy = true
				end
			else
				if BUC2.BuyItemsWithPoints2 then
					if LocalPlayer().PS2_Wallet.points < s.price then
						s.canBuy = false 
						c = Color(90,90,90) 
					else
						s.canBuy = true
					end
				end
			end

		end

		draw.RoundedBox(0,0,0,w,h , c)

		draw.SimpleText("КУПИТЬ","ub2_2",math.floor(w*0.5) , math.floor(h*0.5) , Color(255,255,255,255) , 1 , 1)

	end
	bb.DoClick = function(s)
		LocalPlayer().cdcasebuy = LocalPlayer().cdcasebuy or 0
		if s.canBuy and LocalPlayer().cdcasebuy < CurTime() then

			net.Start("ub_purchase")
				net.WriteString(s.itemID)
				net.WriteInt(s.Amount , 8)
			net.SendToServer() 

			LocalPlayer().cdcasebuy = CurTime() + 3

			s.parent:Close()
		end

	end

end

--[[local matsfstars = Material( "data/sfstarslogos.jpg", "smooth" )
http.Fetch( "https://i.imgur.com/Noiu7Pp.png", function( data )
    file.Write( "sfstarslogos.jpg", data )
    matsfstars = Material( "data/sfstarslogos.jpg" )
end )

local matrande = Material( "data/randelogos.jpg", "smooth" )
http.Fetch( "https://i.imgur.com/3zOYJLQ.png", function( data )
    file.Write( "randelogos.jpg", data )
    matrande = Material( "data/randelogos.jpg" )
end )]]

function ub_createShop()

	local xPos = 0
	local yPos = 0

	for k , v in pairs(BUC2.ITEMS) do
		
		if v.canBuy then

			local temp = vgui.CreateFromTable( CratePanel, poorApi.pages.Shop, "CratePanel" )
			temp:SetSize( 180, 180 )
			temp:SetPos(xPos + 5, yPos + 10)
			temp:Set( v )

			local amountPanel = vgui.Create("DPanel",temp)
			amountPanel:Dock( BOTTOM )
			amountPanel:SetTall( 30 )
			amountPanel.Paint = function(s , w , h)

				--[[draw.RoundedBox(0,0,0,w , h , Color(30,40,50))

				surface.SetDrawColor(Color(0,0,0))

				surface.DrawLine(0,0,180,0)
				surface.DrawLine(0,29,180,29)
				surface.DrawLine(0,28,180,28)

				surface.DrawLine(0,0,0,30)
				surface.DrawLine(1,0,1,30)

				surface.DrawLine(179,0,179,30)
				surface.DrawLine(178,0,178,30)]]

				draw.RoundedBox( 6, 5, 5, 80, 20, Color( 0, 75, 0 ) )

			end

			local plusAmount = vgui.Create("DButton",amountPanel)
			plusAmount:SetPos(5,5)
			plusAmount:SetSize(20,20)
			plusAmount:SetText("")
			plusAmount.Paint = function(s , w ,h)

				draw.RoundedBox(6,0,0,w,h , Color(0, 152, 0))

				draw.SimpleText("-","ub2_2",w*0.5 , h*0.5 , Color(255,255,255,255) , 1 , 1)

			end
			plusAmount.DoClick = function(s)

				s.dis.Amount = s.dis.Amount - 1

				if s.dis.Amount < 1 then
					
					s.dis.Amount = 1

				end

			end

			local minusAmount = vgui.Create("DButton",amountPanel)
			minusAmount:SetPos(180 *0.5 - 5 - 20 , 5)
			minusAmount:SetSize(20,20)
			minusAmount:SetText("")
			minusAmount.Paint = function(s , w ,h)

				draw.RoundedBox(6,0,0,w,h , Color(0, 152, 0))

				draw.SimpleText("+","ub2_2",w*0.5 , h*0.5 , Color(255,255,255,255) , 1 , 1)
 
			end
			minusAmount.DoClick = function(s)

				s.dis.Amount = s.dis.Amount + 1

				if s.dis.Amount > 16 then
					
					s.dis.Amount = 16

				end

			end

			local amountDisplay = vgui.Create("DPanel",amountPanel)
			amountDisplay:SetPos(5 + 20, 5)
			amountDisplay:SetSize((180*0.5 - 20 - 20 - 5 - 5),20)
			amountDisplay.Amount = 1
			amountDisplay.Paint = function(s , w , h)

				draw.SimpleText(s.Amount,"ub2_2",w*0.5 , h*0.5 , Color(255,255,255,255) , TEXT_ALIGN_CENTER , TEXT_ALIGN_CENTER)

			end

			plusAmount.dis = amountDisplay
			minusAmount.dis = amountDisplay


			local buyButton = vgui.Create("DButton",amountPanel)
			buyButton:SetPos(180*0.5 + 5 , 5)
			buyButton:SetSize(180*0.5 - 5 - 5 , 20)
			buyButton.item = k
			buyButton.dis = amountDisplay
			buyButton.Paint = function(s , w , h)

				draw.RoundedBox(6,0,0,w,h , Color(0, 152, 0))
				if BUC2.ITEMS[s.item].discountedFrom and BUC2.ITEMS[s.item].discountedFrom > 0 then
					draw.SimpleText((BUC2.ITEMS[s.item].discountedFrom * s.dis.Amount) .."₴","ub2_2", 10 , h * 0.5, Color(255,255,255,255) , 0 , 1)

					draw.SimpleText((BUC2.ITEMS[s.item].price * s.dis.Amount).."₴","ub2_1", 40, h * 0.5, Color(255,0,0,255) , 0 , 1)
					draw.SimpleText((BUC2.ITEMS[s.item].price * s.dis.Amount).."₴","ub2_1", 39, h * 0.5-1, Color(255,255,255,255) , 0 , 1)

					surface.SetDrawColor( 255, 255, 255, 255 )
					surface.DrawLine( 5, 5, w * 0.5 - 5, h - 5 )
				else
					draw.SimpleText((BUC2.ITEMS[s.item].price * s.dis.Amount).."₴","ub2_1", w*0.5, h * 0.5, Color(255,255,255,255) , 1 , 1)
				end

			end
			buyButton:SetText("")
			buyButton.DoClick = function(s)

				createTansactionWindow(s.item , s.dis.Amount)

			end

			temp:SetCursor "hand"
			temp.OnMouseReleased = function( s )
				--createTansactionWindow(s.item , s.dis.Amount)
				local t = BUC2.ITEMS[s.item].itemType
			 
				if t == "Crate" then
					initSpinMenu(s.item, true) 
					ub_Goto("Spin") 
				end
			end
			temp.item = k
			temp.dis = amountDisplay

			
			

			xPos = xPos + 198

			if xPos > SizeW - 100 then
				
				xPos = 0
				yPos = yPos + 180 + 15

			end

		end

	end

end

function createModelModule(k , v , x ,y)
	local temp = vgui.Create("DPanel" , poorApi.pages.Crate)
	temp:SetSize(180, 180)
	temp:SetPos(x + 10 , y + 10)
	temp.itemTable = v
	temp.itemType = v.itemType 
	temp.outlinec = Color(0,0,0) 
	temp.Paint = function(s , w ,h)

		surface.SetDrawColor(255,255,255,255)
		surface.SetMaterial(itemShadowMat)
		surface.DrawTexturedRect(0,0,180,180)

		local col = s.itemTable.color

		--[[ surface.SetDrawColor(col)
		surface.SetMaterial(itemBannerMat)
		surface.DrawTexturedRect(0,180,180,40)--]] 

		--Draw text

		draw.SimpleText(s.itemTable.name2,"ub2_1",w*0.5,2,Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
		--draw.SimpleText(s.itemTable.name2,"ub2_2",5,200,Color(255,255,255))

	end

	if v.model then
		local mod = vgui.Create("DModelPanel" , temp)
		mod:SetPos(0,0)
		mod:SetSize(180,180)
		mod:SetModel(v.model)
		mod:SetAnimated(false)
		mod.ang = mod.Entity:GetAngles()
		function mod:LayoutEntity(Entity)
			if ( self.bAnimated ) then
				self:RunAnimation()
			end
		end

		FixCam( mod )
	end
	
	local over = vgui.Create("DButton" , temp)
	over:SetText("")
	over:SetPos(0,0)
	over:SetSize(180,180)
	over.col = Color(0,0,0,255)
	over.alpha = 0
	over.itemID = k
	over.Paint = function(s , w , h)

		--draw.SimpleText("OPEN","ub2_3",180*0.5,180*0.5,Color(255,255,255 , s.alpha) , 1 , 1)
		if BUC2.ITEMS[s.itemID].itemType == "Weapon" then
			
			if BUC2.ITEMS[s.itemID].permanent then
				
				draw.RoundedBox(0 , 0,0 , 180 , 20 , Color(255,90,90,255))
				draw.SimpleText("PERMANENT","ub2_1",180*0.5 , 10,Color(255,255,255) , 1 , 1)

			end

		end

		draw.RoundedBox(0,0,0,w,h,Color(40,40,40,s.alpha))

		surface.SetDrawColor(s.col)

		surface.DrawLine(0,180 , 180, 180)
		for i = 0 , 1 do  

			surface.DrawOutlinedRect( i, i, w - (i*2),h - (i*2))

		end

	end
	over.Think = function(s)

		if s:IsHovered() then
			
			s.col = Color(30,150,30)
			s.alpha = Lerp(10*FrameTime() , s.alpha ,190)

		else

			s.col = Color(0,0,0)
			s.alpha = Lerp(10*FrameTime() , s.alpha , 0)

		end 

	end

	return over

end


function createPngModule(k , v , x ,y)
	
	local temp = vgui.CreateFromTable( CratePanel, poorApi.pages.Crate, "CratePanel" )
	temp:SetSize( 180, 180 )
	temp:SetPos(x + 5 , y + 10)
	temp:Set( v )
	
	local over = vgui.Create("DButton" , temp)
	over:SetText("")
	over:SetPos(0,0)
	over:SetSize(180,180)
	over.col = Color(0,0,0,255)
	over.alpha = 0
	over.itemID = k
	over.Paint = function(s , w , h)

		draw.RoundedBox(0,0,0,w,h,Color(40,40,40,s.alpha))

		--draw.SimpleText("OPEN","ub2_3",180*0.5,180*0.5,Color(255,255,255 , s.alpha) , 1 , 1)

		surface.SetDrawColor(s.col)

		surface.DrawLine(0,180 , 180, 180)
		for i = 0 , 1 do  

			surface.DrawOutlinedRect( i, i, w - (i*2),h - (i*2))

		end

	end
	over.Think = function(s)

		if s:IsHovered() then
			
			s.col = Color(30,150,30)
			s.alpha = Lerp(10*FrameTime() , s.alpha ,190)

		else

			s.col = Color(0,0,0)
			s.alpha = Lerp(10*FrameTime() , s.alpha , 0)

		end 

	end

	return over

end

local containPanel = nil

function generateTape(itemID)

	local totalChance = 0

	for k , v in pairs(BUC2.ITEMS[itemID].items) do
		
			v = BUC2.ITEMS[v]

			totalChance = totalChance + v.chance

	end

	local itemList = {}

	for i = 0  , 99 do
		
		local num = math.random(1 , totalChance)

		local prevCheck = 0
		local curCheck = 0

		local item = nil

		for k ,v in pairs(BUC2.ITEMS[itemID].items) do
			
			v = BUC2.ITEMS[v]

			if v.itemType ~= "Key" and v.itemType ~= "Crate" then

				if num >= prevCheck and num <= prevCheck + v.chance then
					

					item = v.name1

				end

				prevCheck = prevCheck + v.chance

			end

		end

		itemList[i] = item

	end

	return itemList

end

net.Receive("StartClientSpinAnimation",function()

	LocalPlayer():EmitSound("buttons/lever1.wav")

	local tbl = net.ReadTable( )
	poorApi.pages.Spin:DoSpin( tbl )

end)  

net.Receive("StartClientUpgradeAnimation",function()

	local mode = net.ReadUInt( 3 )

	if not isOpen then return end
	if !IsValid( ubFrame ) then return end

	if mode == 0 then // failed, something went wrong!
		BUC2.buttonsLocked = false

	elseif mode == 1 then // Won!
		poorApi.pages.Upgrade:DoSpin( true )

	elseif mode == 2 then // Fail
		poorApi.pages.Upgrade:DoSpin( false )

	else
		// internet problems?
	end

	local upgrade = poorApi.pages.Upgrade
	if (mode == 1 or mode == 2) and not upgrade.IsMoney then
		local left = upgrade:GetLeft( )
		if left then
			local left_item = upgrade.Items[ left ]
			if IsValid( left_item.panel ) then
				left_item.panel:Remove( )
			end
		end
	end

end)

function initSpinMenu(itemID, check)

	if containPanel ~= nil then
		
		poorApi.pages.Spin:Clear()
		containPanel:Remove()

	end  

	poorApi.pages.Spin.GetCaseID = function() return itemID end

	local opencaseblur = Material( "opencase/opencase.png" )
	opencaseblur:Recompute( )

	local temp = vgui.CreateFromTable( CratePanel, poorApi.pages.Spin, "CratePanel" )
	poorApi.pages.Spin.spinPanel = temp
	temp:Dock( TOP )
	temp:SetTall( 225 )
	temp:DockMargin( 8, 10, 8, 0 )
	temp:Set( BUC2.ITEMS[ itemID ] )
	temp:SetTooltip( )
	local red = Color( 255, 0, 0 )
	temp.PaintBackground = function( self, w, h )
		surface.SetDrawColor( red )
		surface.SetMaterial( opencaseblur )
		surface.DrawTexturedRect( 0, 0, w, h )

		draw.SimpleText( self.itemTable.name2, "ub2_3", w*0.5, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
		--draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 100, 100, 100 ) )
	end 

	if not check then
		local color = Color( 255, 24, 24 )
		local OpenButton = vgui.Create( "DButton", temp )
		OpenButton:SetPos( (3*SizeW/4) - 75, 225*0.5 - 20 )
		OpenButton:SetSize( 166, 40 )
		OpenButton:SetText ""
		OpenButton.Mat = Material( "opencase/icons/unbox.png" )
		OpenButton.Paint = function( self, w, h )
			draw.RoundedBox( 6, 0, 0, w, h, self:IsDown() and divColor( color, 1.75 ) or self:IsHovered() and divColor( color, 1.25 ) or color )

			surface.SetDrawColor( 255, 255, 255 )
			surface.SetMaterial( self.Mat )
			surface.DrawTexturedRect( 10, h*0.5 - 19*0.5 + 1, 24, 19 )

			draw.SimpleText( "ВІДКРИТИ", "ub2_3", 44, h*0.5, Color( 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		end 

		local tbl = {
			1, 2, 3, 5, 10
		}
		local count = table.Count( tbl )

		local Available = 0
		for k,v in pairs( LocalPlayer().ubinv ) do
			if v == itemID then
				Available = Available + 1
				if Available == tbl[ count ] then
					break
				end
			end
		end

		if Available < 10 then
			tbl = {
				1, 2, 3, 4, 5
			}
		end

		for k, v in pairs( tbl ) do
			if v > Available then
				tbl[ k ] = nil
			end
		end
		count = table.Count( tbl )

		local active = 1
		if count > 1 then

			local panel = vgui.Create( "EditablePanel", temp )
			local size = count * 40 + (count - 1) * 1
			panel:SetPos( (SizeW/5) - size*0.5, 225*0.5 - 20 )
			panel:SetSize( size, 40 )
			panel.Paint = function( self, w, h )
				draw.RoundedBox( 0, 2, 0, w - 4, h, Color( 73, 11, 11 ) )
			end


			local color = Color( 216, 12, 12 )
			for k, v in next, tbl do
				local bt = vgui.Create( "DButton", panel )
				bt:Dock( LEFT )
				bt:DockMargin( k == 1 and 0 or 1, 0, 0, 0 )
				bt:SetWide( 40 )
				bt:SetText ""
				if k ~= 1 and k ~= count then
					bt.PaintBox = function( self, w, h )
						draw.RoundedBox( 0, 0, 0, w, h, active == v and divColor( color, 1.5 ) or self:IsDown() and divColor( color, 2 ) or self:IsHovered() and divColor( color, 1.75 ) or color )
					end
				else
					bt.PaintBox = function( self, w, h )
						if k == 1 then
							draw.RoundedBoxEx( 6, 0, 0, w, h, active == v and divColor( color, 1.5 ) or self:IsDown() and divColor( color, 2 ) or self:IsHovered() and divColor( color, 1.75 ) or color, true, false, true, false )
						else
							draw.RoundedBoxEx( 6, 0, 0, w, h, active == v and divColor( color, 1.5 ) or self:IsDown() and divColor( color, 2 ) or self:IsHovered() and divColor( color, 1.75 ) or color, false, true, false, true )
						end
					end
				end
				bt.Paint = function( self, w, h )
					self:PaintBox( w, h )
					draw.SimpleText( v, "ub2_3", w*0.5, h*0.5, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				end
				bt.DoClick = function( s )
					active = v
				end
			end
		end

		OpenButton.requestSent = nil
		OpenButton.DoClick = function( self, w, h )
			if Available < active then return end
			if not self.requestSent then
				self.requestSent = true
				BUC2.buttonsLocked = true
				net.Start("BeginSpin")
					net.WriteString( itemID )
					net.WriteUInt( active, 4 )
				net.SendToServer( )
			end 
		end
	end

	containPanel = vgui.Create("EditablePanel", poorApi.pages.Spin)
	containPanel:Dock( TOP )
	containPanel:DockMargin( 0, 10, 0, 0 )

	--Create All the Items Modules

	if BUC2.ITEMS[itemID] ~= nil then
		
		if BUC2.ITEMS[itemID].items ~= nil and table.Count(BUC2.ITEMS[itemID].items) > 0 then
			
			local xPos = 5
			local yPos = 10 

			for k, v in pairs(BUC2.ITEMS[itemID].items) do
				

				local testPan = vgui.CreateFromTable( ModelPanel, containPanel )
				testPan:SetPos(xPos,yPos)
				testPan:SetSize(100 , 110)
				testPan:Set( v )
				xPos = xPos + 100 + 9

				if xPos > SizeW - 50 then
					
					xPos = 5
					yPos = yPos + 100 + 20 + 9

				end

			end

			containPanel:SetTall( yPos + 110 )

		end

	end


end

function ub_inventory_menu(itemID)

	local m = vgui.Create("DMenu")
	m:SetPos(gui.MouseX() , gui.MouseY())

	local t = BUC2.ITEMS[itemID].itemType
 
	if t == "Crate" then

		local t = m:AddOption("Відкрити")
		t.id = itemID
		t.DoClick = function(s) 
			initSpinMenu(s.id) 
			ub_Goto("Spin") 
		end

	end

	if t == "Entity" then
		
		local e = m:AddOption("Spawn", function(s)

			net.Start("ub_spawnEntity")
				net.WriteString(s.id)
			net.SendToServer()

			isOpen = false
			ubFrame:Close()

		end)
		e.id = itemID

	end

	if t == "Weapon" then 
		
		m:AddOption("Equip", function(s)

			net.Start("ub_equipweapon")
				net.WriteString(itemID)
			net.SendToServer()

		end)
		m.id = itemID

	end

	--[[local sm = m:AddSubMenu("Подарить")
	for k , v in pairs(player.GetAll()) do
		
		if v ~= LocalPlayer() then
			 
			local temp = sm:AddOption(v:Name() , function(s)

				net.Start("ub_giftitem")
					net.WriteString(s.id)
					net.WriteEntity(s.ply)
				net.SendToServer()

			end)
			temp.id = itemID
			temp.ply = v

		end

	end]]

	--sm:AddSpacer()

	m:Open()

end
 
function ub_CreateInventory()

	if LocalPlayer().ubinv ~= nil and table.Count(LocalPlayer().ubinv) > 0 then
		
		local xPos = 0
		local yPos = 0

		for k , v in pairs(LocalPlayer().ubinv) do

			if v ~= nil and BUC2.ITEMS[v] ~= nil then

				local id = v
				v = BUC2.ITEMS[v]
				local pan = nil



				if v.itemType == "Key" or v.itemType == "Crate" then
					
					pan = createPngModule(k , v , xPos ,yPos) 

				else

					pan = createModelModule(k , v , xPos , yPos)

				end

				pan.itemID = id
				pan.DoClick = function(s)

					ub_inventory_menu(s.itemID)

				end

				xPos = xPos + 198

				if xPos > SizeW - 100 then
					
					xPos = 0
					yPos = yPos + 190

				end

			end

		end

	end

end


local prevPos = 0
function ub_Goto(page)

	if page ~= ubPage then

		ubST = 0
		ubPage = page

	end

	local function navTo( pnl )
		if not IsValid( pnl ) then return end
		local x, y = ubFrame.scroller:GetCanvas( ):GetChildPosition( pnl )
		local w, h = pnl:GetSize()

		x = x + w * 0.5
		x = x - ubFrame.scroller:GetWide() * 0.5

		--self:SetScroll( x )
		ubFrame.scroller.Think = function( self )
			self:SetScroll( Lerp( 10*FrameTime(), self:GetScroll( ), x ) )
			if math.abs(x - self:GetScroll( )) < 0.1 then
				self:SetScroll( x )
				self.Think = nil
			end
		end
	end

	navTo( poorApi.pages[ page ] )

end 

function p:U_PaintFrame()

	self.Paint = function(s , w ,h)

		draw.RoundedBox(0,0,0,w,h, frameColor)
 
		surface.SetDrawColor( Color( 0,0,0,255 ) )
		surface.DrawOutlinedRect( 0, 0, w,h)

	end
 
end


net.Receive( "ub_openui", function( )

	if isOpen == false then

		initUnboxFrame( ) 

	end

end )

function ub_hasItem(itemID)

	for k , v in pairs(LocalPlayer().ubinv) do
		
		if v == itemID then
			
			return true 

		end

	end

	return false

end


net.Receive("ub_inventory_update", function()
	local len = net.ReadDouble()
	local e = net.ReadData(len)
	e = util.Decompress(e)
	e = util.JSONToTable(e)
	
	--Convert from ID'S to string ID's
	local i = {}
	for k ,v in pairs(e) do 
		for a = 1 , v do
			table.insert(i, k)
		end 
	end  
	LocalPlayer().ubinv = i
	ub_refreshInventory()
end)

net.Receive( "ub_history_update", function()
	local tbl = util.JSONToTable( util.Decompress( net.ReadData( net.ReadUInt( 8 ) ) ) )

	BUC2.History = tbl

	if not isOpen then return end
	if !IsValid( ubFrame ) or !IsValid( ubFrame.historyHeader ) then return end

	if not tbl then return end
	if table.Count( tbl ) == 0 then return end

	ubFrame.historyHeader:Fill( tbl )
end )

 

net.Receive("unboxadmin" , function()

	local isAllowed = false

	for k , v in pairs(BUC2.RanksThatCanGiveItems) do
		
		if LocalPlayer():GetUserGroup() == v then
			
			isAllowed = true

		end

	end

end)

function ub_giveitems()

	local frame = vgui.Create("DFrame")
	frame:SetSize(250,160)
	frame:Center()
	frame:SetVisible(true)
	frame:SetTitle("Unboxing Admin Panel")
	frame:MakePopup()

	local item = vgui.Create("DComboBox",frame)
	item:SetPos(20 , 35)
	item:SetSize(210,20)
	item:SetValue("Select An Item")
	for k , v in pairs(BUC2.ITEMS) do
		if v.itemType ~= "IGS" and v.itemType ~= "Points" and v.itemType ~= "Points2" and v.itemType ~= "PSItem" and v.itemType ~= "PSItem2" then
			item:AddChoice(v.name2, k)
		end
	end

	local target = vgui.Create("DComboBox",frame)
	target:SetPos(20 , 35 + 30)
	target:SetSize(210,20)
	target:SetValue("Select A Player")
	for k , v in player.Iterator() do
		target:AddChoice(v:Name() , v)
	end

	local amount = vgui.Create( "DTextEntry", frame )	
	amount:SetPos( 20 , 35 + 30 + 30 )
	amount:SetSize( 210, 20 )
	amount:SetText( "Enter Amount" )

	local give = vgui.Create( "DButton", frame )	
	give:SetPos( 20 , 35 + 30 + 30 + 30 )
	give:SetSize( 210, 20 )
	give:SetText( "Give" )
	give.target = target
	give.item = item
	give.amount = amount
	give.DoClick = function(s)

		if BUC2.buttonsLocked then return end

		local _ , case = s.item:GetSelected()
		if BUC2.ITEMS[case] ~= nil then
			
			local name , ply = s.target:GetSelected()

			if name ~= "Select A Player" and IsValid(ply) then
				
				local amount = tonumber(amount:GetValue())

				if amount ~= nil and amount > 0 and amount < 1000 then
					
					net.Start("ub_admingiveitems")
						net.WriteString(case)	
						net.WriteEntity(ply)
						net.WriteInt(amount , 8)
					net.SendToServer()	

				end

			end

		end


	end

end

local UpgradePage = CompileFile "unbox/upgrade.lua" {
	ModelPanel = ModelPanel,
	find = ub_findByIGSid,
	FixCam = FixCam,
	divColor = divColor,
}

function ub_createUpgrade( )
	local page = vgui.CreateFromTable( UpgradePage, poorApi.pages.Upgrade, "Upgrade Panel" )
	page:Dock( FILL )
	page:InvalidateParent( true )
	page:SetTall( poorApi.pages.Upgrade:GetTall( ) )
	poorApi.pages.Upgrade.DoSpin = function(s, b) page:DoSpin( b ) end
	poorApi.pages.Upgrade.GetLeft = function(s) page:GetLeft( ) end
end

local SpinnerPanel = CompileFile "unbox/spinner.lua" {
	ModelPanel = ModelPanel,
	generateTape = generateTape,
	frameColor = frameColor,
	gradientL = gradientL,
	gradientR = gradientR,
}

function ub_createSpin( )

	poorApi.pages.Spin.OnFinish = function( self )
		net.Start( "SpinEnded" )
			net.WriteBool( true )
		net.SendToServer( )

		LocalPlayer( ):EmitSound( "buttons/lever6.wav" )

		timer.Simple(2.5,function()

			ub_Goto("Crate")
			BUC2.buttonsLocked = false

		end)
	end
	poorApi.pages.Spin.DoSpin = function( self, tbl )

		// hide childs
		--[[ for k, v in pairs( self:GetChildren( ) ) do
			if v:GetName( ) ~= "Spinner" then
				v:SetVisible( false )
			end
		end--]] -- unnecessary, because it will be recreated on next attempt to spin
		if IsValid( self.spinPanel ) then
			self.spinPanel:Remove( )
		end

		local caseID = self:GetCaseID( )
		local p = nil
		for i, id in next, tbl do
			local panel = vgui.CreateFromTable( SpinnerPanel, self, "Spinner" )
			panel:Dock( TOP )
			panel:DockMargin( 5, 5, 5, 5 )
			panel:SetWide( SizeW )
			panel:SetTall( 115 )
			panel:SetID( caseID )
			panel:DoSpin( id )
			panel:SetZPos( -200 )
			p = panel
		end
		if !IsValid( p ) then BUC2.buttonsLocked = false return end
		p.OnFinish = self.OnFinish
	end
end

concommand.Add("ub_admin", function()
	ub_giveitems()
end)

net.Receive("ub_getInventoryAdmin", function()
	local ply = net.ReadEntity()
	local items = net.ReadTable()

	local ubAdmin = vgui.Create("DFrame")
	ubAdmin:SetSize(550, 600)
	ubAdmin:Center()
	ubAdmin:SetTitle("Инвентарь игрока [" .. ply:Nick() .. "]")
	ubAdmin:SetDraggable(false)
	ubAdmin:U_PaintFrame()
	ubAdmin:MakePopup()

	local ubScroll = ubAdmin:Add("DScrollPanel")
	ubScroll:Dock(FILL)

	local ubGrid = ubScroll:Add("DGrid")
	ubGrid:Dock(FILL)
	ubGrid:SetCols(5)
	ubGrid:SetColWide(110)
	ubGrid:SetRowHeight(110)

	for name, count in pairs(items) do
		for i = 1, count do
			local item = vgui.CreateFromTable(CratePanel)
			item:Set(BUC2.ITEMS[name])
			item:SetSize(100, 100)

			ubGrid:AddItem(item)
		end
	end
end)

concommand.Add('UDALIT', function()
	sdasdasdsadasd:Remove()
end)

--[[ hook.Add("HUDPaint", "showskidd", function()
	if isOpen then
		local colorskidki = HSVToColor( CurTime() % 6 * 60, 1, 1 )
		colorskidki.a = 255
		draw.SimpleText("СКИДКИ ДО 90% НА ВСЕ КЕЙСЫ!","ub2_5",ScrW() * 0.5 , ScrH() * 0.5 - 350,colorskidki , 1 , 1)
	end
end)--]] 
--PATH gamemodes/darkrp/gamemode/core/var_sh.lua:
nw.Register( 'Statistic_Money' ):Write( net.WriteTable ):Read( net.ReadTable ):SetGlobal()
--PATH gamemodes/darkrp/gamemode/core/binds/binds_config_cl.lua:
rp.Binds.Add( 'AdminMenu', KEY_M, BIND_TOGGLE, function() sam.menu.open_menu() end )
rp.Binds.Add( 'Door', KEY_F2, BIND_TOGGLE, function() RunConsoleCommand( 'rp.keysMenu' ) end )
rp.Binds.Add( 'Donate', KEY_F6, BIND_TOGGLE, function() IGS.UI() end )
rp.Binds.Add( 'F4', KEY_F4, BIND_TOGGLE, function() RunConsoleCommand( 'F4' ) end )
rp.Binds.Add( 'Masks', KEY_T, BIND_TOGGLE, function() if rp.Team[LocalPlayer():Team()].IsDisguse then RunConsoleCommand( 'disg' ) end end )
rp.Binds.Add( 'Masks2', KEY_G, BIND_TOGGLE, function()
    if LocalPlayer():onyx_GetNetVar( 'Disgue' ) then
        RunConsoleCommand( 'mask_off' )
    elseif LocalPlayer():onyx_GetNetVar( 'Disguise_G' ) then
        RunConsoleCommand( 'Disguise_FF' )
    end
end )
--PATH gamemodes/darkrp/gamemode/core/chat/chat_cl.lua:
local char_to_hex = function( c ) return string.format( '%%%02X', string.byte( c ) ) end
local function urlencode( url )
	if url == nil then return end
	url = url:gsub( '\n', '\r\n' )
	url = url:gsub( '([^%w ])', char_to_hex )
	url = url:gsub( ' ', '+' )
	return url
end

net.Receive( 'rp.Voice', function()
	local text = net.ReadString()
	local ply = net.ReadEntity()
	if LocalPlayer():GetPos():Distance( ply:GetPos() ) > 1000 then return end
	--
	sound.PlayURL( 'https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=' .. urlencode( text ) .. '&tl=ru', '3d', function( x )
		if IsValid( x ) and IsValid( ply ) then
			x:SetPos( ply:GetPos() )
			x:SetVolume( 1 )
			x:Play()
			x:Set3DFadeDistance( 200, 1000 )
			ply.tts_snd = x
			hook.Remove( 'Think', 'rp.Voice.' .. ply:SteamID64() )
		end
	end )
end )

hook.Add( 'Think', 'rp.Voice.Govorilka', function()
	for _, ply in player.Iterator() do
		if IsValid( ply.tts_snd ) then ply.tts_snd:SetPos( ply:GetPos() ) end
	end
end )
--PATH gamemodes/darkrp/gamemode/core/hunger/init_sh.lua:
function PLAYER:GetHunger()
	return self:onyx_GetNetVar( 'Hunger' ) or 0
end
--PATH gamemodes/darkrp/gamemode/core/sandbox/search_models_cl.lua:
local function GetAllFiles(tab, folder, extension, path)
	local files, folders = file.Find(folder .. "/*", path)

	for k, v in ipairs(files) do
		if (v:EndsWith(extension)) then
			tab[#tab+1] = (folder .. v):lower()
		end
	end

	local i = 1
	local function doRecurse()
		GetAllFiles(tab, folder .. folders[i] .. "/", extension, path)
		i = i + 1

		if (folders[i]) then
			timer.Simple(0.1, doRecurse)
		else
			hook.Run("SearchUpdate")
		end
	end

	if (folders[1]) then
		doRecurse()
	else
		hook.Run("SearchUpdate")
	end
end


local model_list = nil
search.AddProvider(function(str)
	str = str:PatternSafe()

	if (model_list == nil) then
		model_list = {}
		GetAllFiles(model_list, "models/", ".mdl", "GAME")
	end

	local list = {}
	for k, v in ipairs(model_list) do
		if (v:find(str)) then
			if (UTIL_IsUselessModel(v)) then continue end

			local entry = {
				text = v:GetFileFromFilename(),
				func = function() RunConsoleCommand("gm_spawn", v) end,
				icon = spawnmenu.CreateContentIcon("model", g_SpawnMenu.SearchPropPanel, {model = v}),
				words = {v}
			}

			list[#list+1] = entry
			if (#list >= 128) then break end
		end
	end

	return list
end);
--PATH gamemodes/darkrp/gamemode/core/sandbox/spawnmenu/controls/preset_editor_cl.lua:

local PANEL = {}

AccessorFunc(PANEL, "m_strType", 		"Type")
AccessorFunc(PANEL, "m_ConVars", 		"ConVars")
AccessorFunc(PANEL, "m_PresetControl", "PresetControl")



--[[---------------------------------------------------------
   Name: Init
-----------------------------------------------------------]]
function PANEL:Init()

	-- This needs to be drawn on top of the spawn menu..
	self:SetDrawOnTop(true)

	self:SetSize(450, 350)
	self:SetTitle("Preset Editor")

	self.PresetList = vgui.Create("DListBox", self)

	self.pnlEditor = vgui.Create("DPanel", self)

		self.pnlDetails = vgui.Create("DPanel", self.pnlEditor)

		self.pnlModify = vgui.Create("DPanel", self.pnlEditor)

			-- TODO: ICON!
			self.btnDelete = vgui.Create("DButton", self.pnlModify)
			self.btnDelete.DoClick = function() self:Delete() end
			self.btnDelete:SetText("#Delete")

			self.txtRename = vgui.Create("DTextEntry", self.pnlModify)

			self.btnRename = vgui.Create("DButton", self.pnlModify)
			self.btnRename:SetText("#Rename")
			self.btnRename.DoClick = function() self:Rename() end

	self.pnlAdd = vgui.Create("DPanel", self)

		self.txtName = vgui.Create("DTextEntry", self.pnlAdd)

		self.btnAdd = vgui.Create("DButton", self.pnlAdd)
		self.btnAdd:SetText("#Add Preset")
		self.btnAdd.DoClick = function() self:Add() end

	self.pnlClose = vgui.Create("DPanel", self)

		self.btnCloseIt = vgui.Create("DButton", self.pnlClose)
		self.btnCloseIt:SetText("#Close")
		self.btnCloseIt.DoClick = function() self:Remove() end

end

--[[---------------------------------------------------------
   Name: SetType
-----------------------------------------------------------]]
function PANEL:SetType(strType)
	self.m_strType = strType
	self:Update()
end


--[[---------------------------------------------------------
   Name: Update
-----------------------------------------------------------]]
function PANEL:Update()

	self.PresetList:Clear()

	local Presets = presets.GetTable(self.m_strType)
	local sortedPresets, i = {}, 1
	for name in pairs(Presets) do
		sortedPresets[i] = name
		i = i + 1
	end
	table.sort(sortedPresets)

	for _, name in ipairs(sortedPresets) do

		local item = self.PresetList:AddItem(name)
		item.Data = Presets[name]

	end

end

--[[---------------------------------------------------------
   Name: PerformLayout
-----------------------------------------------------------]]
function PANEL:PerformLayout()

	DFrame.PerformLayout(self)

	self.pnlClose:SetSize(100, 30)
	self.pnlClose:AlignRight(10)
	self.pnlClose:AlignBottom(10)
	self.btnCloseIt:StretchToParent(5, 5, 5, 5)

	self.pnlAdd:StretchToParent(10, 10, 10, 10)
	self.pnlAdd:CopyHeight(self.pnlClose)
	self.pnlAdd:AlignBottom(10)
	self.pnlAdd:StretchRightTo(self.pnlClose, 10)

		self.btnAdd:SetSize(80, 20)
		self.btnAdd:AlignRight(5)
		self.btnAdd:CenterVertical()

		self.txtName:SetPos(5, 5)
		self.txtName:StretchRightTo(self.btnAdd, 5)
		self.txtName:CenterVertical()

	self.PresetList:StretchToParent(10, 30, 5, 5)
	self.PresetList:StretchBottomTo(self.pnlAdd, 10)
	self.PresetList:SetWide(130)

	self.pnlEditor:CopyBounds(self.PresetList)
	self.pnlEditor:MoveRightOf(self.PresetList, 5)
	self.pnlEditor:StretchToParent(nil, nil, 10, nil)

		self.pnlModify:StretchToParent(5, 5, 5, 5)
		self.pnlModify:SetTall(30)
		self.pnlModify:AlignBottom(5)

			self.btnDelete:SetSize(40, 20)
			self.btnDelete:AlignRight(5)
			self.btnDelete:CenterVertical()

			self.btnRename:SetSize(50, 20)
			self.btnRename:MoveLeftOf(self.btnDelete, 5)
			self.btnRename:CenterVertical()

			self.txtRename:StretchToParent(5, 5, 5, 5)
			self.txtRename:StretchRightTo(self.btnRename, 5)

		self.pnlDetails:CopyBounds(self.pnlModify)
		self.pnlDetails:AlignTop(5)
		self.pnlDetails:StretchBottomTo(self.pnlModify, 5)


end

--[[---------------------------------------------------------
   Name:
-----------------------------------------------------------]]
function PANEL:Delete()

	local Selected = self.PresetList:GetSelectedValues()
	if (!Selected) then return end

	presets.Remove(self.m_strType, Selected)
	self:Update()

	if (self.m_PresetControl) then
		self.m_PresetControl:Update()
	end

end

--[[---------------------------------------------------------
   Name:
-----------------------------------------------------------]]
function PANEL:Rename()

	local Selected = self.PresetList:GetSelectedValues()
	if (!Selected) then return end

	local ToName = self.txtRename:GetValue()
	if (!ToName || ToName == "") then return end

	-- Todo, Handle name collision

	presets.Rename(self.m_strType, Selected, ToName)
	self:Update()

	self.PresetList:SelectByName(ToName)

	self.txtRename:SetText("")

	if (self.m_PresetControl) then
		self.m_PresetControl:Update()
	end

end

--[[---------------------------------------------------------
   Name:
-----------------------------------------------------------]]
function PANEL:Add()

	if (!self.m_ConVars) then return end

	local ToName = self.txtName:GetValue()
	if (!ToName || ToName == "") then return end

	-- Todo, Handle name collision
	local tabValues = {}

	for k, v in pairs(self.m_ConVars) do
		tabValues[ v ] = GetConVarString(v)
	end

	presets.Add(self.m_strType, ToName, tabValues)
	self:Update()

	self.PresetList:SelectByName(ToName)

	self.txtName:SetText("")

	if (self.m_PresetControl) then
		self.m_PresetControl:Update()
	end

end

vgui.Register("PresetEditor", PANEL, "DFrame")
--PATH gamemodes/darkrp/gamemode/core/sandbox/spawnmenu/creationmenu/content/contentsidebartoolbox_cl.lua:
local PANEL = {}

--[[---------------------------------------------------------
   Name: Init
-----------------------------------------------------------]]
function PANEL:Init()

	self:SetOpenSize(200)
	self:DockPadding(5, 5, 5, 5)

	local panel = vgui.Create("DPanel", self)
	panel:Dock(TOP)
	panel:SetSize(24, 24)
	panel:DockPadding(2, 2, 2, 2)

	local Button = vgui.Create("DImageButton", panel)
	Button:SetImage("icon16/text_heading_1.png")
	Button:Dock(LEFT)
	Button:SetStretchToFit(false)
	Button:SetSize(20, 20)
	local slot = Button:Droppable("SandboxContentPanel")

	Button.OnDrop =	function(self, target)

		local label = vgui.Create("ContentHeader", target)
		return label

	end

	local panel = vgui.Create("DPanel", self)
	panel:Dock(FILL)
	panel:DockPadding(5, 5, 5, 5)

	local label = vgui.Create("DTextEntry", panel)
	label:Dock(TOP)

	local icons = vgui.Create("DIconBrowser", panel)
	icons:Dock(FILL)

	--
	-- If we select a node from the sidebar, update the text/icon/actions in the toolbox (at the bottom)
	--
	hook("ContentSidebarSelection", "SidebarToolboxSelection", function(pnlContent, node)

		if (!IsValid(node ) || !IsValid(label) || !IsValid(icons)) then return end

		label:SetText(node:GetText())
		icons:SelectIcon(node:GetIcon())
		icons:ScrollToSelected()

		label.OnChange = function()
			node:SetText(label:GetText())
			hook.Run("SpawnlistContentChanged")
		end

		icons.OnChange = function()
			node:SetIcon(icons:GetSelectedIcon())
			hook.Run("SpawnlistContentChanged")
		end

	end )

end

vgui.Register("ContentSidebarToolbox", PANEL, "DDrawer")
--PATH addons/__main/lua/weapons/g36_balrog/shared.lua:
-- Variables that are used on both client and server
SWEP.Gun = ("g36_balrog") -- must be the name of your swep but NO CAPITALS!
SWEP.Category				= "CSO/CF Weapons" --Category where you will find your weapons
SWEP.Author				= "Zekeou"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "Balrog V G36C"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 3			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox		= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   	= false		-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight					= 30		-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "smg"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg makes for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_rifl_g36b.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_smg_ump45.mdl"	-- Weapon world model
SWEP.ShowWorldModel			= false
SWEP.Base				= "zekeou_gun_base" --the Base this weapon will work on. PLEASE RENAME THE BASE! 
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("weapons/G36B/B5_fire.wav")		-- Script that calls the primary fire sound
SWEP.Primary.SilencedSound 	= Sound("")		-- Sound if the weapon is silenced
SWEP.Primary.RPM			= 750			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.3		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "smg1"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. 
--Use AirboatGun for a light metal peircing shotgun pellets
SWEP.SelectiveFire		= true
SWEP.CanBeSilenced		= false

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 28	-- Base damage per bullet
SWEP.Primary.Spread		= .02	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .01 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(4.159, 0, 0.2)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(4.159, 0, 0.2)
SWEP.SightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector(0,0,0)	--These are for the angles your viewmodel will be when running
SWEP.RunSightsAng = Vector(0,0,0)	--Again, use the Swep Construction Kit

SWEP.WElements = {
	["G36_Balrog"] = { type = "Model", model = "models/weapons/w_rifl_g36b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.709, 0.816, 0.953), angle = Angle(-11.178, 0, 180), size = Vector(0.963, 0.963, 0.963), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}


--PATH gamemodes/darkrp/entities/weapons/gmod_tool/ghostentity.lua:

--[[---------------------------------------------------------
   Starts up the ghost entity
   The most important part of this is making sure it gets deleted properly
-----------------------------------------------------------]]
function ToolObj:MakeGhostEntity(model, pos, angle)
-- 214 
	util.PrecacheModel(model)

	-- We do ghosting serverside in single player
	-- It's done clientside in multiplayer
	if (SERVER && !game.SinglePlayer()) then return end
	if (CLIENT && game.SinglePlayer()) then return end

	-- Release the old ghost entity
	self:ReleaseGhostEntity()

	-- Don't allow ragdolls/effects to be ghosts
	if (!util.IsValidProp(model)) then return end

	if (CLIENT) then
		self.GhostEntity = ents.CreateClientProp(model)
	else
		self.GhostEntity = ents.Create("prop_physics")
	end

	-- If there's too many entities we might not spawn..
	if not IsValid(self.GhostEntity) then
		self.GhostEntity = nil
		return
	end

	self.GhostEntity:SetModel(model)
	self.GhostEntity:SetPos(pos)
	self.GhostEntity:SetAngles(angle)
	self.GhostEntity:Spawn()

	self.GhostEntity:SetSolid(SOLID_VPHYSICS)
	self.GhostEntity:SetMoveType(MOVETYPE_NONE)
	self.GhostEntity:SetNotSolid(true)
	self.GhostEntity:SetRenderMode(RENDERMODE_TRANSALPHA)
	self.GhostEntity:SetColor(Color(255, 255, 255, 150))

end

--[[---------------------------------------------------------
   Starts up the ghost entity
   The most important part of this is making sure it gets deleted properly
-----------------------------------------------------------]]
function ToolObj:StartGhostEntity(ent)

	-- We can't ghost ragdolls because it looks like ass
	local class = ent:GetClass()

	-- We do ghosting serverside in single player
	-- It's done clientside in multiplayer
	if (SERVER && !game.SinglePlayer()) then return end
	if (CLIENT && game.SinglePlayer()) then return end

	self:MakeGhostEntity(ent:GetModel(), ent:GetPos(), ent:GetAngles())

end

--[[---------------------------------------------------------
   Releases up the ghost entity
-----------------------------------------------------------]]
function ToolObj:ReleaseGhostEntity()

	if (self.GhostEntity) then
		if (!self.GhostEntity:IsValid()) then self.GhostEntity = nil return end
		self.GhostEntity:Remove()
		self.GhostEntity = nil
	end

	if (self.GhostEntities) then

		for k,v in pairs(self.GhostEntities) do
			if (v:IsValid()) then v:Remove() end
			self.GhostEntities[k] = nil
		end

		self.GhostEntities = nil
	end

	if (self.GhostOffset) then

		for k,v in pairs(self.GhostOffset) do
			self.GhostOffset[k] = nil
		end

	end

end

--[[---------------------------------------------------------
   Update the ghost entity
-----------------------------------------------------------]]
function ToolObj:UpdateGhostEntity()

	if (self.GhostEntity == nil) then return end
	if (!self.GhostEntity:IsValid()) then self.GhostEntity = nil return end

	local tr = util.GetPlayerTrace(self:GetOwner())
	local trace = util.TraceLine(tr)
	if (!trace.Hit) then return end

	local Ang1, Ang2 = self:GetNormal(1):Angle(), (trace.HitNormal * -1):Angle()
	local TargetAngle = self:GetEnt(1):AlignAngles(Ang1, Ang2)

	self.GhostEntity:SetPos(self:GetEnt(1):GetPos())
	self.GhostEntity:SetAngles(TargetAngle)

	local TranslatedPos = self.GhostEntity:LocalToWorld(self:GetLocalPos(1))
	local TargetPos = trace.HitPos + (self:GetEnt(1):GetPos() - TranslatedPos) + (trace.HitNormal)

	self.GhostEntity:SetPos(TargetPos)

end
--PATH addons/__main/lua/weapons/gmod_tool/stools/fading_door.lua:
--[[
	STool: Fading Doors
	Version: 2.1.1
	Author: http://www.steamcommunity.com/id/zapk
--]]

--[[
	New in 2.1.0:
	-	Fixed "No Effect" not working.
	-	Cleaned up code.
--]]

TOOL.Category = "Roleplay"
TOOL.Name = "#tool.fading_door.name"

TOOL.ClientConVar["key"] = "5"
TOOL.ClientConVar["toggle"] = "0"
TOOL.ClientConVar["reversed"] = "0"
TOOL.ClientConVar["noeffect"] = "0"

-- create convar fading_door_nokeyboard (defualt 0)
local noKeyboard = CreateConVar("fading_door_nokeyboard", "0", FCVAR_ARCHIVE, "Set to 1 to disable using fading doors with the keyboard")

local function checkTrace(tr)
	-- edgy, yes, but easy to read

	return tr.Entity
		and tr.Entity:IsValid()
		and not (
			tr.Entity:IsPlayer()
			or tr.Entity:IsNPC()
			or tr.Entity:IsVehicle()
			or tr.HitWorld
		)
end

if CLIENT then
	-- handle languages
	language.Add( "tool.fading_door.name", "Fading Door" )
	language.Add( "tool.fading_door.desc", "Makes an object fade away when activated." )
	language.Add( "tool.fading_door.0", "Click on an object to make it a fading door." )
	language.Add( "Undone_fading_door", "Undone Fading Door" )

	-- handle tool panel
	function TOOL:BuildCPanel()
		self:AddControl( "Header", { Text = "#tool.fading_door.name", Description = "#tool.fading_door.desc" } )
		self:AddControl( "CheckBox", { Label = "Start Faded", Command = "fading_door_reversed" } )
		self:AddControl( "CheckBox", { Label = "Toggle", Command = "fading_door_toggle" } )
		self:AddControl( "CheckBox", { Label = "No Effect", Command = "fading_door_noeffect" } )
		self:AddControl( "Numpad", { Label = "Fade", ButtonSize = "22", Command = "fading_door_key" } )
	end

	-- leftclick trace function
	TOOL.LeftClick = checkTrace

	return
end

local function fadeActivate(self)
	self.fadeActive = true

	self.fadeMaterial = self:GetMaterial()
	self.fadeColor = self:GetColor()

	if self.noEffect then
		self:SetColor(Color(255, 255, 255, 0))
		self:SetMaterial("Models/effects/vol_light001")
	else
		self:SetMaterial("sprites/heatwave")
	end

	self:DrawShadow(false)
	self:SetNotSolid(true)

	local phys = self:GetPhysicsObject()

	if IsValid(phys) then
		self.fadeMoveable = phys:IsMoveable()
		phys:EnableMotion(false)
	end

	if WireLib then
		Wire_TriggerOutput(self, "FadeActive", 1)
	end
end

local function fadeDeactivate(self)
	self.fadeActive = false

	self:SetMaterial(self.fadeMaterial or "")
	self:SetColor(self.fadeColor or color_white)

	self:DrawShadow(true)
	self:SetNotSolid(false)

	local phys = self:GetPhysicsObject()

	if IsValid(phys) then
		phys:EnableMotion(self.fadeMoveable or false)
	end

	if WireLib then
		Wire_TriggerOutput(self, "FadeActive", 0)
	end
end

local function fadeToggleActive(self, ply)
	if noKeyboard:GetBool() and not numpad.FromButton() then
		ply:ChatPrint("You cannot use fading doors with the keyboard on this server.")
		ply:ChatPrint("Try using a button or keypad instead.")
		return
	end

	if self.fadeActive then
		self:fadeDeactivate()
	else
		self:fadeActivate()
	end
end

local function onUp(ply, ent)
	if not (ent:IsValid() and ent.fadeToggleActive and not ent.fadeToggle) then
		return
	end

	ent:fadeToggleActive(ply)
end

numpad.Register("Fading Door onUp", onUp)

local function onDown(ply, ent)
	if not (ent:IsValid() and ent.fadeToggleActive) then
		return
	end

	ent:fadeToggleActive(ply)
end

numpad.Register("Fading Door onDown", onDown)

-- I hate wire.
local function getWireInputs(ent)
	local inputs = ent.Inputs
	local names, types, descs = {}, {}, {}

	if inputs then
		local num
		for _, data in pairs(inputs) do
			num = data.Num
			names[num] = data.Name
			types[num] = data.Type
			descs[num] = data.Desc
		end
	end

	return names, types, descs
end

local function doWireInputs(ent)
	local inputs = ent.Inputs

	if not inputs then
		Wire_CreateInputs(ent, {"Fade"})
		return
	end

	local names, types, descs = {}, {}, {}
	local num

	for _, data in pairs(inputs) do
		num = data.Num
		names[num] = data.Name
		types[num] = data.Type
		descs[num] = data.Desc
	end

	table.insert(names, "Fade")

	WireLib.AdjustSpecialInputs(ent, names, types, descs)
end

local function doWireOutputs(ent)
	local outputs = ent.Outputs

	if not outputs then
		Wire_CreateOutputs(ent, {"FadeActive"})
		return;
	end

	local names, types, descs = {}, {}, {}
	local num

	for _, data in pairs(outputs) do
		num = data.Num
		names[num] = data.Name
		types[num] = data.Type
		descs[num] = data.Desc
	end

	table.insert(names, "FadeActive")

	WireLib.AdjustSpecialOutputs(ent, names, types, descs)
end

local function TriggerInput(self, name, value, ...)
	if name == "Fade" then
		if value == 0 and self.fadePrevWireOn then
			self.fadePrevWireOn = false

			if not self.fadeToggle then
				self:fadeToggleActive()
			end
		else
			if not self.fadePrevWireOn then
				self.fadePrevWireOn = true
				self:fadeToggleActive()
			end
		end
	elseif self.fadeTriggerInput then
		return self:fadeTriggerInput(name, value, ...)
	end
end

local function PreEntityCopy(self)
	local info = WireLib.BuildDupeInfo(self)

	if info then
		duplicator.StoreEntityModifier(self, "WireDupeInfo", info)
	end

	if self.fadePreEntityCopy then
		self:fadePreEntityCopy()
	end
end

local function PostEntityPaste(self, ply, ent, ents)
	if self.EntityMods and self.EntityMods.WireDupeInfo then
		WireLib.ApplyDupeInfo(ply, self, self.EntityMods.WireDupeInfo, function(id) return ents[id] end)
	end

	if self.fadePostEntityPaste then
		self:fadePostEntityPaste(ply, ent, ents)
	end
end


local function onRemove(self)
	numpad.Remove(self.fadeUpNum)
	numpad.Remove(self.fadeDownNum)
end

local function dooEet(ply, ent, stuff)
	if ent.isFadingDoor then
		ent:fadeDeactivate()
		onRemove(ent)
	else
		ent.isFadingDoor = true

		ent.fadeActivate = fadeActivate
		ent.fadeDeactivate = fadeDeactivate
		ent.fadeToggleActive = fadeToggleActive

		ent:CallOnRemove("Fading Door", onRemove)
	end

	ent.fadeUpNum = numpad.OnUp(ply, stuff.key, "Fading Door onUp", ent)
	ent.fadeDownNum = numpad.OnDown(ply, stuff.key, "Fading Door onDown", ent)
	ent.fadeToggle = stuff.toggle
	ent.noEffect = stuff.noEffect

	if stuff.reversed then
		ent:fadeActivate()
	end

	duplicator.StoreEntityModifier(ent, "Fading Door", stuff)

	return true
end

duplicator.RegisterEntityModifier("Fading Door", dooEet)

if not FadingDoor then
	local function legacy(ply, ent, data)
		return dooEet(ply, ent, {
			key      = data.Key,
			toggle   = data.Toggle,
			reversed = data.Inverse,
			noEffect = data.NoEffect
		})
	end

	duplicator.RegisterEntityModifier("FadingDoor", legacy)
end

local function doUndo(undoData, ent)
	if IsValid(ent) then
		onRemove(ent)
		ent:fadeDeactivate()

		ent.isFadingDoor = false

		if WireLib then
			ent.TriggerInput = ent.fadeTriggerInput

			if ent.Inputs then
				Wire_Link_Clear(ent, "Fade")
				ent.Inputs['Fade'] = nil
				WireLib._SetInputs(ent)
			end if ent.Outputs then
				local port = ent.Outputs['FadeActive']

				if port then
					for i,inp in ipairs(port.Connected) do
						if (inp.Entity:IsValid()) then
							Wire_Link_Clear(inp.Entity, inp.Name)
						end
					end
				end

				ent.Outputs['FadeActive'] = nil
				WireLib._SetOutputs(ent)
			end
		end
	end
end

function TOOL:LeftClick(tr)
	if not checkTrace(tr) then
		return false
	end

	local ent = tr.Entity
	local ply = self:GetOwner()

	if ent:GetClass() == "ent_textscreen" then
		rp.notify(ply,'Ты че # совсем # иди нахуй # #',ply:Name(),'Еблан','дурак','блять')
		return false
	end


	dooEet(ply, ent, {
		key      = self:GetClientNumber("key"),
		toggle   = self:GetClientNumber("toggle") == 1,
		reversed = self:GetClientNumber("reversed") == 1,
		noEffect = self:GetClientNumber("noeffect") == 1
	})

	undo.Create("Fading_Door")
		undo.AddFunction(doUndo, ent)
		undo.SetPlayer(ply)
	undo.Finish()

	return true
end

--PATH addons/_ballistic_shields/lua/ballistic_shields/sh_bs_util.lua:
bshields = bshields or {}
bshields.config = bshields.config or {}
bshields.shields = {
	{
		[1] = {
			["angles"] = Angle( 4, 6, -14 ),
			["position"] = Vector( 0, 8, -1 )
		},
		[2] = {
			["angles"] = Angle( 6, 6, -12 ),
			["position"] = Vector( 8, 10, -4 )
		},
		[3] = {
			["angles"] = Angle( -3, 7, -16 ),
			["position"] = Vector( -1, 4, -3 )
		}
	},
	{
		[1] = {
			["angles"] = Angle( -12, 0, 0 ),
			["position"] = Vector( 6, -4, -8 )
		},
		[2] = {
			["angles"] = Angle( -12, 0, 0 ),
			["position"] = Vector( 16, -3, -12 )
		},
		[3] = {
			["angles"] = Angle( -12, 0, 0 ),
			["position"] = Vector( 6, -3, -12 )
		}
	},
	{
		[1] = {
			["angles"] = Angle( 70, 78, -16 ),
			["position"] = Vector( 1, -7, -13 )
		},
		[2] = {
			["angles"] = Angle( 70, 78, -16 ),
			["position"] = Vector( 1, -6, -22 )
		},
		[3] = {
			["angles"] = Angle( 70, 78, -16 ),
			["position"] = Vector( 1, -8, -12 )
		}
	}
}
--PATH addons/_ballistic_shields/lua/ballistic_shields/sh_bs_util.lua:
bshields = bshields or {}
bshields.config = bshields.config or {}
bshields.shields = {
	{
		[1] = {
			["angles"] = Angle( 4, 6, -14 ),
			["position"] = Vector( 0, 8, -1 )
		},
		[2] = {
			["angles"] = Angle( 6, 6, -12 ),
			["position"] = Vector( 8, 10, -4 )
		},
		[3] = {
			["angles"] = Angle( -3, 7, -16 ),
			["position"] = Vector( -1, 4, -3 )
		}
	},
	{
		[1] = {
			["angles"] = Angle( -12, 0, 0 ),
			["position"] = Vector( 6, -4, -8 )
		},
		[2] = {
			["angles"] = Angle( -12, 0, 0 ),
			["position"] = Vector( 16, -3, -12 )
		},
		[3] = {
			["angles"] = Angle( -12, 0, 0 ),
			["position"] = Vector( 6, -3, -12 )
		}
	},
	{
		[1] = {
			["angles"] = Angle( 70, 78, -16 ),
			["position"] = Vector( 1, -7, -13 )
		},
		[2] = {
			["angles"] = Angle( 70, 78, -16 ),
			["position"] = Vector( 1, -6, -22 )
		},
		[3] = {
			["angles"] = Angle( 70, 78, -16 ),
			["position"] = Vector( 1, -8, -12 )
		}
	}
}
--PATH addons/__main/lua/weapons/m9k_ares_shrike/shared.lua:
-- Variables that are used on both client and server
SWEP.Gun = ("m9k_ares_shrike") -- must be the name of your swep but NO CAPITALS!
if (GetConVar(SWEP.Gun.."_allowed")) != nil then
	if not (GetConVar(SWEP.Gun.."_allowed"):GetBool()) then SWEP.Base = "bobs_blacklisted" SWEP.PrintName = SWEP.Gun return end
end
SWEP.Category				= "M9K Machine Guns"
SWEP.Author				= ""
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "Ares Shrike"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 39			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight				= 30			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "ar2"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_ares_shrike01.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_ares_shrike.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Weapon_shrk.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 650			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 200		-- Size of a clip
SWEP.Primary.DefaultClip		= 400		-- Bullets you start with
SWEP.Primary.KickUp				= 0.6		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.4		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.5		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "ar2"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 65		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 30	-- Base damage per bullet
SWEP.Primary.Spread		= .03	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .02 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(-3.804, 0, 0.495)
SWEP.IronSightsAng = Vector(0.119, -0.019, 0)
SWEP.SightsPos = Vector(-3.804, 0, 0.495)
SWEP.SightsAng = Vector(0.119, -0.019, 0)
SWEP.RunSightsPos = Vector(1.639, -3.444, 0)
SWEP.RunSightsAng = Vector(-7.46, 47.048, 0)

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
--PATH addons/__main/lua/weapons/m9k_mossberg590/shared.lua:
-- Variables that are used on both client and server
SWEP.Gun = ("m9k_mossberg590") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "Mossberg 590"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 25			-- Position in the slot
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

SWEP.ViewModelFOV			= 60
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_shot_mberg_590.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_mossberg_590.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_shotty_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Mberg_590.Single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 75		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 8			-- Size of a clip
SWEP.Primary.DefaultClip		= 30	-- Default number of bullets in a clip
SWEP.Primary.KickUp				= 1				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.8		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.8	-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "buckshot"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 
SWEP.ShellTime			= .5

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 10		-- How many bullets to shoot per trigger pull, AKA pellets
SWEP.Primary.Damage		= 9	-- Base damage per bullet
SWEP.Primary.Spread		= .03	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .03	-- Ironsight accuracy, should be the same for shotguns
-- Because irons don't magically give you less pellet spread!

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(-2.72, -3.143, 1.26)
SWEP.IronSightsAng = Vector(0, -0.75, 3)
SWEP.SightsPos = Vector(-2.72, -3.143, 1.26)
SWEP.SightsAng = Vector(0, -0.75, 3)
SWEP.RunSightsPos = Vector(7, -9.429, -0.857)
SWEP.RunSightsAng = Vector(-7, 63, 0)



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
--PATH addons/__main/lua/weapons/m9k_svt40/shared.lua:
-- Variables that are used on both client and server
SWEP.Gun = ("m9k_svt40") -- must be the name of your swep but NO CAPITALS!
if (GetConVar(SWEP.Gun.."_allowed")) != nil then
	if not (GetConVar(SWEP.Gun.."_allowed"):GetBool()) then SWEP.Base = "bobs_blacklisted" SWEP.PrintName = SWEP.Gun return end
end
SWEP.Category				= "M9K Sniper Rifles"
SWEP.Author				= ""
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "SVT 40"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 48			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox		= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   	= false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= false		-- Set false if you want no crosshair from hip
SWEP.XHair					= false		-- Used for returning crosshair after scope. Must be the same as DrawCrosshair
SWEP.Weight				= 50			-- Rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.BoltAction				= false		-- Is this a bolt action rifle?
SWEP.HoldType 				= "rpg"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_snip_svt40.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_svt_40.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_scoped_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_SVT40.single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 350		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 10		-- Size of a clip
SWEP.Primary.DefaultClip			= 60	-- Bullets you start with
SWEP.Primary.KickUp				= 1				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 1			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 1		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "ar2"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.ScopeZoom			= 5	
SWEP.Secondary.UseACOG			= false -- Choose one scope type
SWEP.Secondary.UseMilDot		= true	-- I mean it, only one	
SWEP.Secondary.UseSVD			= false	-- If you choose more than one, your scope will not show up at all
SWEP.Secondary.UseParabolic		= false	
SWEP.Secondary.UseElcan			= false
SWEP.Secondary.UseGreenDuplex	= false	
SWEP.Secondary.UseAimpoint		= false
SWEP.Secondary.UseMatador		= false

SWEP.data 				= {}
SWEP.data.ironsights		= 1
SWEP.ScopeScale 			= 0.7
SWEP.ReticleScale 			= 0.6

SWEP.Primary.NumShots	= 1		--how many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 80	--base damage per bullet
SWEP.Primary.Spread		= .01	--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .0001 -- ironsight accuracy, should be the same for shotguns

-- enter iron sight info and bone mod info below

SWEP.IronSightsPos = Vector(-3.462, -1.775, 0.079)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(-3.462, -1.775, 0.079)
SWEP.SightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector(3.388, -4.501, 0)
SWEP.RunSightsAng = Vector(-9.096, 47.727, 0)



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
--PATH addons/__main/lua/weapons/m9k_winchester73/shared.lua:
-- Variables that are used on both client and server
SWEP.Gun = ("m9k_winchester73") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "73 Winchester Carbine"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 41			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight				= 3			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "ar2"	-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_winchester1873.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_winchester_1873.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_shotty_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_73.Single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 66		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 8			-- Size of a clip
SWEP.Primary.DefaultClip			= 30	-- Default number of bullets in a clip
SWEP.Primary.KickUp			= .2				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.1	-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "AirboatGun"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 
SWEP.ShellTime			= .54

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull, AKA pellets
SWEP.Primary.Damage		= 85	-- Base damage per bullet
SWEP.Primary.Spread		= .01	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001	-- Ironsight accuracy, should be the same for shotguns
-- Because irons don't magically give you less pellet spread!, but this isn't a shotgun so whatever, man!

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(4.356, 0, 2.591)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(4.356, 0, 2.591)
SWEP.SightsAng = Vector(0, 0, 0)
SWEP.GSightsPos = Vector (0, 0, 0)
SWEP.GSightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector (-2.3095, -3.0514, 2.3965)
SWEP.RunSightsAng = Vector (-19.8471, -33.9181, 10)

SWEP.ViewModelBoneMods = {
	["shell"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}

if (gmod.GetGamemode().Name == "Murderthon 9000") then

	SWEP.Slot		= 1				-- Slot in the weapon selection menu
	SWEP.Weight		= 3			-- rank relative ot other weapons. bigger is better

end

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
--PATH addons/__main/lua/weapons/scout_xbow/shared.lua:
-- Variables that are used on both client and server
SWEP.Gun = ("scout_xbow") -- must be the name of your swep but NO CAPITALS!
SWEP.Category				= "CSO/CF Weapons" --Category where you will find your weapons
SWEP.Author				= "Zekeou"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "Crossbow"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 122		-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= false		-- Set false if you want no crosshair from hip
SWEP.Weight				= 50			-- Rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.XHair					= false		-- Used for returning crosshair after scope. Must be the same as DrawCrosshair
SWEP.BoltAction				= false		-- Is this a bolt action rifle?
SWEP.HoldType 				= "ar2"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_snip_xxbow.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_snip_g3sg1.mdl"	-- Weapon world model
SWEP.ShowWorldModel			= false
SWEP.Base 				= "zekeou_scoped_base" --the Base this weapon will work on. PLEASE RENAME THE BASE!
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("weapons/Xbow/Crossbow_Fire.wav")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 300		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 10		-- Size of a clip
SWEP.Primary.DefaultClip			= 60	-- Bullets you start with
SWEP.Primary.KickUp			= 1				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 1			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= 1		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "SniperPenetratedRound"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.ScopeZoom			= 8	
SWEP.Secondary.UseACOG			= false -- Choose one scope type
SWEP.Secondary.UseMilDot		= true	-- I mean it, only one	
SWEP.Secondary.UseSVD			= false	-- If you choose more than one, your scope will not show up at all
SWEP.Secondary.UseParabolic		= false	
SWEP.Secondary.UseElcan			= false
SWEP.Secondary.UseGreenDuplex	= false	

SWEP.data 				= {}
SWEP.data.ironsights			= 1
SWEP.ScopeScale 			= 0.5
SWEP.ReticleScale 				= 0.6

SWEP.Primary.NumShots	= 1		--how many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 45	--base damage per bullet
SWEP.Primary.Spread		= .023	--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .0001 -- ironsight accuracy, should be the same for shotguns

-- enter iron sight info and bone mod info below

SWEP.IronSightsPos = Vector(5.079, -4.016, 1.2)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(5.079, -4.016, 1.2)
SWEP.SightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector (0, 0, 0)
SWEP.RunSightsAng = Vector (0, 0, 0)

SWEP.WElements = {
	["Scout_Xbow"] = { type = "Model", model = "models/weapons/w_snip_xxbow.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(0.634, 0.238, 1.103), angle = Angle(-6.19, -0.9, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

--PATH addons/__________skeypads/lua/weapons/skeypad_checker/cl_init.lua:
include( 'shared.lua' )
local keypadInfo = false
local boxColor = Color( 10, 10, 10, 180 )
local font1 = onyx.Font( 'Comfortaa Bold@20' )
function SWEP:DrawHUD()
    local scale = ScrH() / 1080
    local infoText = 'Натисніть лівою клавішою миші на кейпад,\nщоб переглянути інформацію про нього та під\'єднані до нього FadingDoor.\nЩоб скасувати свій вибір, натисніть праву клавішу миші.'
    if keypadInfo then
        infoText = string.Replace( 'Захищено: %p\nВласник: %o', '%p', tostring( keypadInfo.isProtected ) )
        infoText = string.Replace( infoText, '%o', keypadInfo.ownerName )
        if keypadInfo.others == nil then
            keypadInfo = false
            hook.Remove( 'PreDrawHalos', 'sKeypads::AdminCheckerHalos' )
            return
        end

        cam.Start3D( EyePos(), EyeAngles() )
        render.SetColorMaterial()
        for _, u in pairs( keypadInfo.fadingDoors ) do
            if IsValid( keypadInfo.keypad ) then render.DrawBeam( keypadInfo.keypad:GetPos(), u:GetPos(), 2, 0.01, 20, color_white ) end
        end

        cam.End3D()
    end

    local splitText = string.Split( infoText, '\n' )
    local rowY = ScrH() * 0.5
    for k, v in ipairs( splitText ) do
        draw.WordBox( 2, 10 * scale, rowY + ( k - 1 ) * 26, v, font1, boxColor, color_white )
    end
end

function SWEP:SecondaryAttack()
    keypadInfo = false
    hook.Remove( 'PreDrawHalos', 'sKeypads::AdminCheckerHalos' )
end

function SWEP:Holster()
    keypadInfo = false
    hook.Remove( 'PreDrawHalos', 'sKeypads::AdminCheckerHalos' )
end

net.Receive( 'sKeypads::SendKeypadCheckerData', function()
    keypadInfo = {
        keypad = net.ReadEntity(),
        fadingDoors = net.ReadTable(),
        keypadType = net.ReadString(),
        isProtected = net.ReadBool(),
        ownerName = net.ReadString()
    }

    keypadInfo.others = {}
    table.insert( keypadInfo.others, keypadInfo.keypad )
    for _, u in pairs( keypadInfo.fadingDoors ) do
        keypadInfo.others[#keypadInfo.others + 1] = u
    end

    hook.Add( 'PreDrawHalos', 'sKeypads::AdminCheckerHalos', function() halo.Add( keypadInfo.others, sKeypads.Config.door_halo_color, 5, 5, 2, nil, true ) end )
end )
--PATH addons/swb_css/lua/weapons/swb_deagle/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Desert Eagle .50 AE"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(-6.355, -2.747, 2.039)
	SWEP.AimAng = Vector(0.209, 0, 0)
	
	SWEP.SprintPos = Vector(0, -17.514, -12.271)
	SWEP.SprintAng = Vector(63.637, 0, 0)
	
	SWEP.ZoomAmount = 5
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.IconLetter = "f"
	
	SWEP.MuzzleEffect = "swb_pistol_large"
	SWEP.MuzzlePosMod = {x = 6.5, y =	30, z = -2}
	SWEP.PosBasedMuz = true
end

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
SWEP.NormalHoldType = "357"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "swb_base"
SWEP.Category = "SUP Weapons"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 55
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/cstrike/c_pist_deagle.mdl"
SWEP.WorldModel		= "models/weapons/w_pist_deagle.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 7
SWEP.Primary.DefaultClip	= 7
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "357"

SWEP.FireDelay = 0.25
SWEP.FireSound = Sound("Weapon_DEagle.Single")
SWEP.Recoil = 2.2
SWEP.DryFire = true

SWEP.HipSpread = 0.045
SWEP.AimSpread = 0.009
SWEP.VelocitySensitivity = 1.7
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.015
SWEP.SpreadCooldown = 0.28
SWEP.Shots = 1
SWEP.Damage = 40
SWEP.DeployTime = 1
--PATH addons/swb_css/lua/weapons/swb_sg550/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "SIG SG550"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(-7.461, -13.646, 1.519)
	SWEP.AimAng = Vector(0, 0, 0)
		
	SWEP.SprintPos = Vector(0, 0, 0)
	SWEP.SprintAng = Vector(-7.739, 28.141, 0)
	
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
	
	SWEP.MuzzleEffect = "muzzleflash_m14"
	SWEP.PosBasedMuz = true
	SWEP.IconLetter = "o"
	
	SWEP.MuzzleEffect = "swb_rifle_med"
	SWEP.MuzzlePosMod = {x = 7, y = 55, z = -3}
	SWEP.PosBasedMuz = true
end

SWEP.PlayBackRate = 1
SWEP.PlayBackRateSV = 1
SWEP.FadeCrosshairOnAim = true
SWEP.PreventQuickScoping = true

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true

SWEP.SpeedDec = 30
SWEP.BulletDiameter = 5.56
SWEP.CaseLength = 45

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "swb_base"
SWEP.Category = "SUP Weapons"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 55
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/cstrike/c_snip_sg550.mdl"
SWEP.WorldModel		= "models/weapons/w_snip_sg550.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"

SWEP.FireDelay = 0.0857
SWEP.FireSound = Sound("Weapon_SG550.Single")
SWEP.Recoil = 1.1

SWEP.HipSpread = 0.055
SWEP.AimSpread = 0.00025
SWEP.VelocitySensitivity = 2.2
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.15
SWEP.Shots = 1
SWEP.Damage = 28
SWEP.DeployTime = 1
--PATH addons/swb_css/lua/weapons/swb_usp/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "USP .45"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(-3.441, -4.723, 1.12)
	SWEP.AimAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(0, -17.514, -12.271)
	SWEP.SprintAng = Vector(63.637, 0, 0)
	
	SWEP.ZoomAmount = 5
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.IconLetter = "y"
	
	SWEP.MuzzleEffect = "swb_pistol_med"
	SWEP.MuzzleEffectSupp = "swb_silenced_small"
end

SWEP.FadeCrosshairOnAim = false

SWEP.PlayBackRate = 30
SWEP.PlayBackRateSV = 12
SWEP.SpeedDec = 10
SWEP.BulletDiameter = 11.5
SWEP.CaseLength = 22.8

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
SWEP.Category = "SUP Weapons"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 55
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/cstrike/c_pist_usp.mdl"
SWEP.WorldModel		= "models/weapons/w_pist_usp.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 12
SWEP.Primary.DefaultClip	= 12
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "pistol"

SWEP.FireDelay = 0.14
SWEP.FireSound = Sound("Weapon_USP.Single")
SWEP.FireSoundSuppressed = Sound("Weapon_USP.SilencedShot")
SWEP.Recoil = 0.75
SWEP.DryFire = true

SWEP.Suppressable = true
SWEP.SuppressedOnEquip = true

SWEP.HipSpread = 0.04
SWEP.AimSpread = 0.01
SWEP.VelocitySensitivity = 1.2
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.16
SWEP.Shots = 1
SWEP.Damage = 20
SWEP.DeployTime = 1
--PATH addons/_cuffs/lua/weapons/weapon_cuff_rope.lua:
-------------------------------------
---------------- Cuffs --------------
-------------------------------------
-- Copyright (c) 2015 Nathan Healy --
-------- All rights reserved --------
-------------------------------------
-- weapon_cuff_standard.lua SHARED --
--                                 --
-- Rope handcuffs.                 --
-------------------------------------

SWEP.Base = "weapon_cuff_base"

SWEP.Category = "Other"
SWEP.Author = "my_hat_stinks"
SWEP.Instructions = "A weak restraint."

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.AdminSpawnable = true

SWEP.Slot = 3
SWEP.PrintName = "Наручники"

//
// Handcuff Vars
SWEP.CuffTime = 0.1 // Seconds to handcuff
SWEP.CuffSound = Sound( "buttons/lever7.wav" )

SWEP.CuffMaterial = "models/props_foliage/tree_deciduous_01a_trunk"
SWEP.CuffRope = "cable/rope"
SWEP.CuffStrength = 0.8
SWEP.CuffRegen = 5
SWEP.RopeLength = 50
SWEP.CuffReusable = true

SWEP.CuffBlindfold = true

SWEP.CuffStrengthVariance = 0.1 // Randomise strangth
SWEP.CuffRegenVariance = 0.2 // Randomise regen
--PATH addons/_avatar/lua/weapons/weapon_earth_bending.lua:
SWEP.Category = "Avatar"
SWEP.PrintName = "Earth Bending"
SWEP.Author = "Kilburn, robotboy655, MaxOfS2D, Tenrys & Kurome76" -- changing this will void your support
SWEP.Purpose = "Bend Earth."
SWEP.Slot = 1
SWEP.SlotPos = 10
SWEP.Spawnable = true
SWEP.ViewModel = Model( "models/weapons/c_arms.mdl" )
SWEP.WorldModel = ""
SWEP.ViewModelFOV = 54
SWEP.UseHands = true
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"
SWEP.DrawAmmo = false
local SwingSound = Sound( "WeaponFrag.Throw" )
function SWEP:Initialize()
	self:SetHoldType( "fist" )
end

function SWEP:SetupDataTables()
	self:NetworkVar( "Float", 0, "NextMeleeAttack" )
	self:NetworkVar( "Float", 1, "NextIdle" )
end

function SWEP:GetViewModelPosition( pos, ang )
	--this is always applied
	local DefPos = Vector( 0, 0, -1 )
	local DefAng = Vector( 0, 0, 0 )
	if DefAng then
		ang = ang * 1
		ang:RotateAroundAxis( ang:Right(), DefAng.x )
		ang:RotateAroundAxis( ang:Up(), DefAng.y )
		ang:RotateAroundAxis( ang:Forward(), DefAng.z )
	end

	if DefPos then
		local Right = ang:Right()
		local Up = ang:Up()
		local Forward = ang:Forward()
		pos = pos + DefPos.x * Right
		pos = pos + DefPos.y * Forward
		pos = pos + DefPos.z * Up
	end
	return pos, ang
end

function SWEP:UpdateNextIdle()
	local vm = self:GetOwner():GetViewModel()
	self:SetNextIdle( CurTime() + vm:SequenceDuration() / vm:GetPlaybackRate() )
end

function SWEP:PrimaryAttack()
	self:GetOwner():SetAnimation( PLAYER_ATTACK1 )
	local vm = self:GetOwner():GetViewModel()
	vm:SendViewModelMatchingSequence( vm:LookupSequence( "fists_uppercut" ) )
	self:EmitSound( SwingSound )
	self:UpdateNextIdle()
	self:SetNextMeleeAttack( CurTime() + 0.2 )
	self:SetNextPrimaryFire( CurTime() + 0.9 )
	self:SetNextSecondaryFire( CurTime() + 0.9 )
end

local randomErruptionMdlTbl = { "models/props_wasteland/rockcliff01b.mdl", "models/props_wasteland/rockcliff01c.mdl", "models/props_wasteland/rockcliff01e.mdl", "models/props_wasteland/rockcliff01f.mdl", "models/props_wasteland/rockcliff01g.mdl", "models/props_wasteland/rockcliff01j.mdl", "models/props_wasteland/rockcliff01k.mdl" }
function SWEP:SecondaryAttack()
	self:GetOwner():SetAnimation( PLAYER_ATTACK1 )
	local vm = self:GetOwner():GetViewModel()
	vm:SendViewModelMatchingSequence( vm:LookupSequence( "fists_uppercut" ) )
	self:EmitSound( SwingSound )
	self:UpdateNextIdle()
	self:SetNextPrimaryFire( CurTime() + 0.9 )
	self:SetNextSecondaryFire( CurTime() + 0.9 )
	if SERVER then
		local srcpos = self:GetOwner():GetShootPos()
		local tr = util.TraceLine( {
			start = srcpos,
			endpos = srcpos + vector_up * -110,
			filter = self:GetOwner()
		} )

		if tr.Hit then
			if self:GetOwner():EyeAngles().p > 75 then
				local rok = ents.Create( "prop_dynamic" )
				rok:SetModel( table.Random( randomErruptionMdlTbl ) )
				rok:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
				rok:SetPos( tr.HitPos + tr.HitNormal * -20 )
				rok:SetColor( Color( 255, 255, 255, 255 ) )
				rok:SetRenderMode( RENDERMODE_NORMAL )
				rok:SetKeyValue( "solid", "6" )
				--rok:SetParent(ply)
				rok:Spawn()
				rok:Activate()
				rok.DoNotDuplicate = true
				rok:SetPhysicsAttacker( self:GetOwner(), 5 )
				rok:SetOwner( self:GetOwner() )
				rok:Fire( "kill", "", 2 )
				sound.Play( "physics/concrete/boulder_impact_hard" .. math.random( 1, 4 ) .. ".wav", tr.HitPos )
				util.ScreenShake( tr.HitPos, 5, 5, 1, 256 )
				local dmginfo = DamageInfo()
				dmginfo:SetAttacker( self:GetOwner() )
				dmginfo:SetInflictor( rok )
				dmginfo:SetDamage( math.random( 20, 40 ) )
				dmginfo:SetDamageForce( vector_up * 6000 )
				dmginfo:SetDamageType( DMG_CRUSH )
				for _, v in ipairs( ents.FindAlongRay( tr.HitPos, tr.HitPos + vector_up * 128, Vector( -60, -60, -60 ), Vector( 60, 60, 60 ) ) ) do
					if v ~= self:GetOwner() and IsValid( v ) and not v:IsWeapon() then
						local phys = v:GetPhysicsObject()
						if IsValid( phys ) then phys:ApplyForceOffset( vector_up * 80 * phys:GetMass(), self:GetOwner():GetShootPos() ) end
						v:TakeDamageInfo( dmginfo )
						if v:IsPlayer() or v:IsNPC() or v.Type == "nextbot" then
							v:SetVelocity( -self:GetOwner():GetAimVector() * 650 )
							if v.Type == "nextbot" then v.loco:SetVelocity( -self:GetOwner():GetAimVector() * 650 ) end
						end
					end
				end

				self:GetOwner():SetVelocity( -self:GetOwner():GetAimVector() * 600 )
				timer.Simple( 2 / 20, function()
					if not IsValid( rok ) then return end
					for i = 0, 40 do
						timer.Simple( i / 45, function()
							if not IsValid( rok ) then return end
							rok:SetPos( rok:GetPos() + vector_up * -math.Rand( 2, 5 ) * 2 + VectorRand() * 4 )
							rok:SetAngles( rok:GetAngles() + Angle( 0, math.random( -34, 34 ), 0 ) )
						end )
					end
				end )
				return
			end

			for i = 2, 40 do
				local forward = self:GetOwner():GetAimVector() * 45 * i
				local ftr = util.TraceLine( {
					start = srcpos + forward,
					endpos = srcpos + forward + self:GetOwner():GetAimVector() * 70,
					filter = self:GetOwner()
				} )

				if not ftr.HitWorld then
					local ownr = self:GetOwner()
					timer.Simple( i / 20, function()
						local dtr = util.TraceLine( {
							start = srcpos + forward,
							endpos = srcpos + forward + vector_up * -400,
							filter = ownr
						} )

						if dtr.HitWorld then
							local rok = ents.Create( "prop_dynamic" )
							rok:SetModel( table.Random( randomErruptionMdlTbl ) )
							rok:SetAngles( Angle( 0, math.random( 0, 360 ), 0 ) )
							rok:SetPos( dtr.HitPos + dtr.HitNormal * -20 )
							rok:SetColor( Color( 255, 255, 255, 255 ) )
							rok:SetRenderMode( RENDERMODE_NORMAL )
							rok:SetKeyValue( "solid", "6" )
							--rok:SetParent(ply)
							rok:Spawn()
							rok:Activate()
							rok.DoNotDuplicate = true
							rok:SetPhysicsAttacker( ownr, 5 )
							rok:SetOwner( ownr )
							rok:Fire( "kill", "", 4 - i / 20 )
							sound.Play( "physics/concrete/boulder_impact_hard" .. math.random( 1, 4 ) .. ".wav", dtr.HitPos )
							util.ScreenShake( dtr.HitPos, 5, 5, 1, 256 )
							local dmginfo = DamageInfo()
							dmginfo:SetAttacker( ownr )
							dmginfo:SetInflictor( rok )
							dmginfo:SetDamage( math.random( 100, 500 ) )
							dmginfo:SetDamageForce( vector_up * 6000 )
							dmginfo:SetDamageType( DMG_CRUSH )
							for _, v in ipairs( ents.FindAlongRay( dtr.HitPos, dtr.HitPos + vector_up * 128, Vector( -60, -60, -60 ), Vector( 60, 60, 60 ) ) ) do
								if v ~= ownr and IsValid( v ) and not v:IsWeapon() then
									local phys = v:GetPhysicsObject()
									if IsValid( phys ) then phys:ApplyForceOffset( vector_up * 80 * phys:GetMass(), ownr:GetShootPos() ) end
									v:TakeDamageInfo( dmginfo )
								end
							end

							timer.Simple( 3 - i / 20, function()
								if not IsValid( rok ) then return end
								for i = 0, 40 do
									timer.Simple( i / 45, function()
										if not IsValid( rok ) then return end
										rok:SetPos( rok:GetPos() + vector_up * -math.Rand( 2, 5 ) * 2 + VectorRand() * 4 )
										rok:SetAngles( rok:GetAngles() + Angle( 0, math.random( -34, 34 ), 0 ) )
									end )
								end
							end )
						end
					end )
				end
			end
		end
	end
end

local randomMdlTbl = { "models/props_wasteland/rockgranite03c.mdl", "models/props_wasteland/rockgranite03b.mdl", "models/props_wasteland/rockgranite03a.mdl", "models/props_wasteland/rockgranite02c.mdl", "models/props_wasteland/rockgranite02a.mdl" }
function SWEP:DealDamage()
	--local anim = self:GetSequenceName(self:GetOwner():GetViewModel():GetSequence())
	if SERVER then
		local srcpos = self:GetOwner():GetShootPos() + self:GetOwner():GetForward() * 64
		local tr = util.TraceLine( {
			start = srcpos,
			endpos = srcpos + vector_up * -110,
			filter = self:GetOwner()
		} )

		if tr.Hit then
			local multishot = math.random() < 0.3
			if multishot then
				for _ = 0, 4 do
					local rok = ents.Create( "prop_physics" )
					rok:SetModel( "models/props_junk/rock001a.mdl" )
					rok:SetPos( tr.HitPos + tr.HitNormal * 16 + VectorRand() * 16 )
					rok:SetColor( Color( 255, 255, 255, 255 ) )
					rok:SetRenderMode( RENDERMODE_NORMAL )
					--rok:SetParent(ply)
					rok:Spawn()
					rok:Activate()
					rok.DoNotDuplicate = true
					rok:SetPhysicsAttacker( self:GetOwner(), 5 )
					rok:SetOwner( self:GetOwner() )
					rok:Fire( "kill", "", 5 )
					rok:EmitSound( "physics/concrete/boulder_impact_hard" .. math.random( 1, 4 ) .. ".wav" )
					rok:AddCallback( "PhysicsCollide", function( ent, data )
						if data.DeltaTime > 0.2 and data.Speed > 250 then
							if IsValid( data.HitEntity ) then
								local dmginfo = DamageInfo()
								dmginfo:SetAttacker( ent:GetPhysicsAttacker( 5 ) )
								dmginfo:SetInflictor( ent )
								dmginfo:SetDamage( 50 )
								dmginfo:SetDamageType( 5 )
								dmginfo:SetDamageForce( data.OurOldVelocity )
								data.HitEntity:TakeDamageInfo( dmginfo )
							end

							ent:EmitSound( "physics/concrete/concrete_break" .. math.random( 1, 3 ) .. ".wav", 75, math.random( 90, 110 ), 0.5 )
						end
					end )

					local phys = rok:GetPhysicsObject()
					if IsValid( phys ) then
						phys:SetMass( 50 )
						phys:AddGameFlag( FVPHYSICS_HEAVY_OBJECT )
						phys:AddGameFlag( FVPHYSICS_DMG_SLICE )
						phys:SetVelocity( rok:GetUp() * 240 + self:GetOwner():GetVelocity() )
						phys:EnableDrag( false )
						--phys:SetBuoyancyRatio(0)
					end

					timer.Simple( 0.35, function()
						if not IsValid( rok ) then return end
						if not IsValid( self ) then return end
						if not IsValid( self:GetOwner() ) then return end
						rok:SetAngles( self:GetOwner():EyeAngles() )
						rok:EmitSound( "physics/concrete/concrete_block_impact_hard" .. math.random( 1, 3 ) .. ".wav" )
						local phys = rok:GetPhysicsObject()
						if IsValid( phys ) then
							phys:SetVelocity( rok:GetForward() * 3000 + vector_up * 100 )
							phys:SetAngleVelocity( rok:GetUp() * 2000 )
						end
					end )
				end
			else
				local discchance = math.random() < 0.4
				local earthdisc = ents.Create( "prop_physics" )
				if discchance then
					earthdisc:SetModel( "models/avatar/earth_disc.mdl" )
					earthdisc:SetModelScale( 0.5 )
					earthdisc:PhysicsInit( SOLID_VPHYSICS )
				else
					earthdisc:SetModel( table.Random( randomMdlTbl ) )
				end

				earthdisc:SetPos( tr.HitPos + tr.HitNormal * 8 )
				earthdisc:SetColor( Color( 255, 255, 255, 255 ) )
				earthdisc:SetRenderMode( RENDERMODE_NORMAL )
				--earthdisc:SetParent(ply)
				earthdisc:Spawn()
				earthdisc:Activate()
				earthdisc.DoNotDuplicate = true
				earthdisc:SetPhysicsAttacker( self:GetOwner(), 5 )
				earthdisc:SetOwner( self:GetOwner() )
				earthdisc:Fire( "kill", "", 5 )
				earthdisc:EmitSound( "physics/concrete/boulder_impact_hard" .. math.random( 1, 4 ) .. ".wav" )
				earthdisc:AddCallback( "PhysicsCollide", function( ent, data )
					if data.DeltaTime > 0.2 then
						if data.Speed > 250 then
							if IsValid( data.HitEntity ) then
								local dmginfo = DamageInfo()
								dmginfo:SetAttacker( ent:GetPhysicsAttacker( 5 ) )
								dmginfo:SetInflictor( ent )
								dmginfo:SetDamage( 50 )
								dmginfo:SetDamageType( DMG_CRUSH )
								dmginfo:SetDamageForce( data.OurOldVelocity )
								data.HitEntity:TakeDamageInfo( dmginfo )
							end

							ent:EmitSound( "physics/concrete/concrete_break" .. math.random( 1, 3 ) .. ".wav", 75, math.random( 90, 110 ), 0.5 )
						end
					end
				end )

				local phys = earthdisc:GetPhysicsObject()
				if IsValid( phys ) then
					phys:SetMass( 100 )
					phys:AddGameFlag( FVPHYSICS_HEAVY_OBJECT )
					if discchance then phys:AddGameFlag( FVPHYSICS_DMG_SLICE ) end
					phys:SetVelocity( earthdisc:GetUp() * 240 + self:GetOwner():GetVelocity() )
					phys:EnableDrag( false )
					--phys:SetBuoyancyRatio(0)
				end

				timer.Simple( 0.35, function()
					if not IsValid( earthdisc ) then return end
					if not IsValid( self ) then return end
					earthdisc:SetAngles( self:GetOwner():EyeAngles() )
					earthdisc:EmitSound( "physics/concrete/concrete_block_impact_hard" .. math.random( 1, 3 ) .. ".wav" )
					local phys = earthdisc:GetPhysicsObject()
					if IsValid( phys ) then
						phys:SetVelocity( earthdisc:GetForward() * 3000 + vector_up * 100 )
						phys:SetAngleVelocity( earthdisc:GetUp() * 2000 )
					end
				end )
			end

			timer.Simple( 0.27, function()
				if not IsValid( self ) then return end
				local anim = "fists_left"
				if math.random() < 0.5 then anim = "fists_right" end
				local vm = self:GetOwner():GetViewModel()
				vm:SendViewModelMatchingSequence( vm:LookupSequence( anim ) )
				self:GetOwner():SetAnimation( PLAYER_ATTACK1 )
			end )
		end
		--self.part:SetParent(self:GetOwner())
	end
end

function SWEP:Think()
	local vm = self:GetOwner():GetViewModel()
	local idletime = self:GetNextIdle()
	if idletime > 0 and CurTime() > idletime then
		vm:SendViewModelMatchingSequence( vm:LookupSequence( "fists_idle_0" .. math.random( 1, 2 ) ) )
		self:UpdateNextIdle()
	end

	local meleetime = self:GetNextMeleeAttack()
	if meleetime > 0 and CurTime() > meleetime then
		self:DealDamage()
		self:SetNextMeleeAttack( 0 )
	end
end

function SWEP:Deploy()
	local speed = GetConVar( "sv_defaultdeployspeed" ):GetInt()
	local vm = self:GetOwner():GetViewModel()
	vm:SendViewModelMatchingSequence( vm:LookupSequence( "fists_draw" ) )
	vm:SetPlaybackRate( speed )
	self:SetNextPrimaryFire( CurTime() + vm:SequenceDuration() / speed )
	self:SetNextSecondaryFire( CurTime() + vm:SequenceDuration() / speed )
	self:UpdateNextIdle()
	return true
end

function SWEP:Holster()
	self:SetNextMeleeAttack( 0 )
	return true
end

function SWEP:OnRemove()
	self:Holster()
	return true
end

function SWEP:OnDrop()
	self:Holster()
	self:Remove() -- You can't drop fists
end

local color1 = Color( 150, 150, 60, 255 )
function SWEP:DrawHUD()
	local x, y = ScrW(), ScrH()
	local w, h = x * 0.5, y * 0.5
	draw.SimpleTextOutlined( "Стихія: Земля", onyx.Font( "Comfortaa@24" ), w, y - h / 8, color1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 2, color_black )
end
--PATH addons/_avatar/lua/weapons/weapon_fire_bending.lua:
SWEP.Category = "Avatar"
SWEP.PrintName = "Fire Bending"
SWEP.Author = "Kilburn, robotboy655, MaxOfS2D, Tenrys & Kurome76" -- changing this will void your support
SWEP.Purpose = "Bend Fire."
SWEP.Slot = 1
SWEP.SlotPos = 10
SWEP.Spawnable = true
SWEP.ViewModel = Model( "models/weapons/c_arms.mdl" )
SWEP.WorldModel = ""
SWEP.ViewModelFOV = 54
SWEP.UseHands = true
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"
SWEP.DrawAmmo = false
local SwingSound = Sound( "WeaponFrag.Throw" )
game.AddParticles( "particles/mnb_flamethrower.pcf" )
PrecacheParticleSystem( "flamethrower" )
sound.Add( {
	name = "bending.fire",
	channel = CHAN_AUTO,
	volume = 1.0,
	level = 75,
	pitch = { 100, 100 },
	sound = "npc/grag/garg_beam_start.wav"
} )

function SWEP:Initialize()
	self:SetHoldType( "fist" )
	self.doFire = false
	self.right = false
	self.altright = false
end

function SWEP:SetupDataTables()
	self:NetworkVar( "Float", 0, "NextMeleeAttack" )
	self:NetworkVar( "Float", 1, "NextIdle" )
end

function SWEP:GetViewModelPosition( pos, ang )
	--this is always applied
	local DefPos = Vector( 0, 0, -1 )
	local DefAng = Vector( 0, 0, 0 )
	if DefAng then
		ang = ang * 1
		ang:RotateAroundAxis( ang:Right(), DefAng.x )
		ang:RotateAroundAxis( ang:Up(), DefAng.y )
		ang:RotateAroundAxis( ang:Forward(), DefAng.z )
	end

	if DefPos then
		local Right = ang:Right()
		local Up = ang:Up()
		local Forward = ang:Forward()
		pos = pos + DefPos.x * Right
		pos = pos + DefPos.y * Forward
		pos = pos + DefPos.z * Up
	end
	return pos, ang
end

function SWEP:UpdateNextIdle()
	local vm = self:GetOwner():GetViewModel()
	self:SetNextIdle( CurTime() + vm:SequenceDuration() / vm:GetPlaybackRate() )
end

function SWEP:PrimaryAttack()
	self:GetOwner():SetAnimation( PLAYER_ATTACK1 )
	local anim = "fists_left"
	if math.random() < 0.5 then anim = "fists_right" end
	local vm = self:GetOwner():GetViewModel()
	vm:SendViewModelMatchingSequence( vm:LookupSequence( anim ) )
	self:EmitSound( SwingSound )
	self:UpdateNextIdle()
	self:SetNextMeleeAttack( CurTime() + 0.2 )
	self:SetNextPrimaryFire( CurTime() + 0.9 )
	self:SetNextSecondaryFire( CurTime() + 0.9 )
end

local thunderSounds = { "ambient/halloween/thunder_01.wav", "ambient/halloween/thunder_04.wav", "ambient/halloween/thunder_06.wav", "ambient/halloween/thunder_07.wav" }
function SWEP:SecondaryAttack()
	self:GetOwner():SetAnimation( PLAYER_ATTACK1 )
	local right = self:GetOwner():EyeAngles():Right()
	local src = self:GetOwner():WorldSpaceCenter() + vector_up * 12 + right * -4
	local anim = "fists_left"
	if self.altright == true then
		anim = "fists_right"
		src = self:GetOwner():WorldSpaceCenter() + vector_up * 12 + right * 4
	end

	local vm = self:GetOwner():GetViewModel()
	vm:SendViewModelMatchingSequence( vm:LookupSequence( anim ) )
	self:EmitSound( SwingSound )
	self:UpdateNextIdle()
	local bullet = {}
	bullet.Num = 3
	bullet.Src = src
	bullet.Dir = self:GetOwner():GetAimVector()
	bullet.Spread = Vector( 0.05, 0.05, 0 )
	bullet.Tracer = 1
	bullet.Force = 5
	bullet.Damage = 200
	bullet.AmmoType = "Gauss"
	bullet.TracerName = "tooltracer"
	bullet.HullSize = 4
	bullet.Callback = function( _, tr, dmginfo )
		local g = math.random( 1, 4 )
		if g == 1 then
			dmginfo:SetDamageType( DMG_AIRBOAT )
		elseif g == 2 then
			dmginfo:SetDamageType( DMG_BLAST )
		elseif g == 3 then
			dmginfo:SetDamageType( DMG_DISSOLVE )
		else
			dmginfo:SetDamageType( DMG_SHOCK )
		end

		if SERVER then
			local FireLight1 = ents.Create( "light_dynamic" )
			FireLight1:SetKeyValue( "brightness", "4" )
			FireLight1:SetKeyValue( "distance", "256" )
			FireLight1:SetPos( tr.HitPos + tr.HitNormal * 2 )
			FireLight1:SetLocalAngles( self:GetOwner():EyeAngles() )
			FireLight1:Fire( "Color", "60 150 255" )
			--FireLight1:SetParent(self)
			FireLight1:Spawn()
			FireLight1:Activate()
			FireLight1:Fire( "TurnOn", "", 0 )
			FireLight1:Fire( "Kill", "", 0.07 )
			self:DeleteOnRemove( FireLight1 )
		end

		util.BlastDamageInfo( dmginfo, tr.HitPos + tr.HitNormal * 12, 80 )
	end

	self:ShootEffects()
	self:GetOwner():FireBullets( bullet )
	if SERVER then
		self:GetOwner():EmitSound( "bms_ambience/object_ambience/o_ambience_disaster_arc" .. math.random( 1, 5 ) .. ".wav", 75 )
		self:GetOwner():EmitSound( table.Random( thunderSounds ), 80 )
		local FireLight1 = ents.Create( "light_dynamic" )
		FireLight1:SetKeyValue( "brightness", "4" )
		FireLight1:SetKeyValue( "distance", "256" )
		FireLight1:SetPos( self:GetOwner():GetShootPos() )
		FireLight1:SetLocalAngles( self:GetOwner():EyeAngles() )
		FireLight1:Fire( "Color", "60 150 255" )
		FireLight1:SetParent( self )
		FireLight1:Spawn()
		FireLight1:Activate()
		FireLight1:Fire( "TurnOn", "", 0 )
		FireLight1:Fire( "Kill", "", 0.07 )
		self:DeleteOnRemove( FireLight1 )
	end

	if self.altright ~= true then
		self.altright = true
	else
		self.altright = false
	end

	self:SetNextPrimaryFire( CurTime() + 0.9 )
	self:SetNextSecondaryFire( CurTime() + 0.9 )
end

function SWEP:DealDamage()
	local anim = self:GetSequenceName( self:GetOwner():GetViewModel():GetSequence() )
	if SERVER then
		if IsValid( self.part ) then
			self.part:Remove()
			self:GetOwner():StopSound( "bending.fire" )
			self:GetOwner():EmitSound( "bending.fire" )
		end

		self.part = ents.Create( "info_particle_system" )
		self.part:SetPos( self:GetOwner():WorldSpaceCenter() )
		self.part:SetAngles( self:GetOwner():EyeAngles() )
		self.part:SetKeyValue( "effect_name", "flamethrower" )
		self.part:SetKeyValue( "start_active", tostring( 1 ) )
		self.part:Spawn()
		self.part:Activate()
		self.part.DoNotDuplicate = true
		self.part:Fire( "kill", "", 1 )
		self:DeleteOnRemove( self.part )
		local FireLight1 = ents.Create( "light_dynamic" )
		FireLight1:SetKeyValue( "brightness", "4" )
		FireLight1:SetKeyValue( "distance", "256" )
		FireLight1:SetPos( self:GetOwner():GetShootPos() )
		FireLight1:SetLocalAngles( self:GetOwner():EyeAngles() )
		FireLight1:Fire( "Color", "255 150 60" )
		FireLight1:SetParent( self )
		FireLight1:Spawn()
		FireLight1:Activate()
		FireLight1:Fire( "TurnOn", "", 0 )
		FireLight1:Fire( "Kill", "", 1 )
		self:DeleteOnRemove( FireLight1 )
		self:GetOwner():EmitSound( "bending.fire" )
		local right = self:GetOwner():EyeAngles():Right()
		if anim == "fists_right" then
			self.part:SetPos( self:GetOwner():WorldSpaceCenter() + vector_up * 12 + right * 4 )
			self.right = true
		else
			self.right = false
		end

		self.doFire = true
		timer.Simple( 1, function()
			if not IsValid( self ) then return end
			if not IsValid( self:GetOwner() ) then return end
			self:GetOwner():EmitSound( "npc/grag/garg_beam_stop.wav" )
			self:GetOwner():StopSound( "bending.fire" )
			if not IsValid( self.part ) then return end
			self.doFire = false
		end )
		--self.part:SetParent(self:GetOwner())
	end
end

function SWEP:GetHeadPos( ent )
	local model = ent:GetModel() or ""
	if model:find( "crow" ) or model:find( "seagull" ) or model:find( "pigeon" ) then
		return ent:LocalToWorld( ent:OBBCenter() + Vector( 0, 0, -5 ) )
	elseif ent:GetAttachment( ent:LookupAttachment( "eyes" ) ) ~= nil then
		return ent:GetAttachment( ent:LookupAttachment( "eyes" ) ).Pos
	else
		return ent:LocalToWorld( ent:OBBCenter() )
	end
end

function SWEP:Think()
	local vm = self:GetOwner():GetViewModel()
	local idletime = self:GetNextIdle()
	if idletime > 0 and CurTime() > idletime then
		vm:SendViewModelMatchingSequence( vm:LookupSequence( "fists_idle_0" .. math.random( 1, 2 ) ) )
		self:UpdateNextIdle()
	end

	local meleetime = self:GetNextMeleeAttack()
	if meleetime > 0 and CurTime() > meleetime then
		self:DealDamage()
		self:SetNextMeleeAttack( 0 )
	end

	local right = self:GetOwner():EyeAngles():Right()
	if IsValid( self.part ) then
		if self.right then
			self.part:SetPos( self:GetOwner():WorldSpaceCenter() + vector_up * 12 + right * 4 )
		else
			self.part:SetPos( self:GetOwner():WorldSpaceCenter() + vector_up * 12 + right * -4 )
		end

		self.part:SetAngles( self:GetOwner():EyeAngles() )
	end

	local dmginfo = DamageInfo()
	dmginfo:SetAttacker( self:GetOwner() )
	dmginfo:SetInflictor( self )
	dmginfo:SetDamage( math.random( 8, 12 ) )
	dmginfo:SetDamageForce( self:GetOwner():GetAimVector() * 5000 )
	if math.random() < 0.5 then
		dmginfo:SetDamageType( DMG_BURN )
	else
		dmginfo:SetDamageType( DMG_SLOWBURN )
	end

	if self.doFire == true and SERVER then
		local srcpos = self:GetOwner():GetShootPos()
		local aim = self:GetOwner():GetAimVector()
		local tr = util.TraceLine( {
			start = srcpos,
			endpos = srcpos + aim * 600,
			filter = self:GetOwner()
		} )

		for _, v in ipairs( ents.FindAlongRay( srcpos, srcpos + aim * 600, Vector( -20, -20, -20 ), Vector( 20, 20, 20 ) ) ) do
			if v ~= self and v ~= self:GetOwner() and IsValid( v ) and not v:IsWeapon() and v:GetClass() ~= "predicted_viewmodel" and self:GetOwner():IsLineOfSightClear( self:GetHeadPos( v ) + vector_up * 4 ) then
				local phys = v:GetPhysicsObject()
				if IsValid( phys ) then phys:ApplyForceOffset( aim * ( 80 + phys:GetMass() * 10 ), self:GetOwner():GetShootPos() ) end
				v:TakeDamageInfo( dmginfo )
				if math.random() < 0.2 then v:Ignite( 5 ) end
			end
		end

		--if !tr.Hit then return end
		local bpos = tr.HitPos + aim * 80 + tr.HitNormal * 90
		local FireLight1 = ents.Create( "light_dynamic" )
		FireLight1:SetKeyValue( "brightness", "4" )
		FireLight1:SetKeyValue( "distance", "160" )
		FireLight1:SetPos( bpos )
		FireLight1:SetLocalAngles( self:GetOwner():EyeAngles() )
		FireLight1:Fire( "Color", "255 150 60" )
		FireLight1:SetParent( self )
		FireLight1:Spawn()
		FireLight1:Activate()
		FireLight1:Fire( "TurnOn", "", 0 )
		FireLight1:Fire( "Kill", "", 0.07 )
		self:DeleteOnRemove( FireLight1 )
		local rand = math.random( 1, 3 )
		if rand == 1 then
			dmginfo:SetDamageType( DMG_BURN )
		elseif rand == 2 then
			dmginfo:SetDamageType( DMG_BLAST )
		else
			dmginfo:SetDamageType( DMG_SLOWBURN )
		end

		util.BlastDamageInfo( dmginfo, bpos, 128 )
	end
end

function SWEP:DoImpactEffect( tr )
	if tr.HitSky then return end
	local effect = EffectData()
	effect:SetOrigin( tr.HitPos )
	effect:SetNormal( tr.HitNormal )
	util.Effect( "cball_explode", effect )
	util.Decal( "FadingScorch", tr.HitPos + tr.HitNormal * 1, tr.HitPos + tr.HitNormal * -1, self )
	sound.Play( "bms_ambience/object_ambience/o_ambience_disaster_bigspark" .. math.random( 1, 2 ) .. ".wav", tr.HitPos, 75 )
	return true
end

function SWEP:Deploy()
	local speed = GetConVar( "sv_defaultdeployspeed" ):GetInt()
	local vm = self:GetOwner():GetViewModel()
	vm:SendViewModelMatchingSequence( vm:LookupSequence( "fists_draw" ) )
	vm:SetPlaybackRate( speed )
	self:SetNextPrimaryFire( CurTime() + vm:SequenceDuration() / speed )
	self:SetNextSecondaryFire( CurTime() + vm:SequenceDuration() / speed )
	self:UpdateNextIdle()
	return true
end

function SWEP:Holster()
	if IsValid( self:GetOwner() ) then self:GetOwner():StopSound( "bending.fire" ) end
	self:SetNextMeleeAttack( 0 )
	return true
end

function SWEP:OnRemove()
	self:Holster()
	return true
end

function SWEP:OnDrop()
	self:Holster()
	self:Remove() -- You can't drop fists
end

local color1 = Color( 255, 60, 60 )
function SWEP:DrawHUD()
	local x, y = ScrW(), ScrH()
	local w, h = x * 0.5, y * 0.5
	draw.SimpleTextOutlined( "Стихія: Вогонь", onyx.Font( "Comfortaa@24" ), w, y - h / 8, color1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 2, color_black )
end
--PATH addons/__main/lua/weapons/weapon_hl2brokenbottle/shared.lua:

AddCSLuaFile()

SWEP.PrintName				= "Broken Bottle"
SWEP.Author				= "Dr. Towers"
SWEP.Instructions			= "Primary attack: Stab"
SWEP.Category				= "HL2 Melee Pack"

SWEP.Slot				= 1
SWEP.SlotPos				= 0

SWEP.Spawnable				= true

SWEP.ViewModel				= Model( "models/weapons/HL2meleepack/v_brokenbottle.mdl" )
SWEP.WorldModel				= Model( "models/weapons/HL2meleepack/w_brokenbottle.mdl" )
SWEP.ViewModelFOV			= 62
SWEP.UseHands				= true

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo		= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= true
SWEP.Secondary.Ammo		= "none"

SWEP.DrawAmmo			= false

SWEP.HitDistance		= 28
SWEP.HitInclination		= 0.2
SWEP.HitPushback		= 0
SWEP.HitRate			= 0.50
SWEP.MinDamage			= 5
SWEP.MaxDamage			= 15

local SwingSound = Sound( "WeaponFrag.Roll" )
local HitSoundWorld = Sound( "GlassBottle.ImpactHard" )
local HitSoundBody = Sound( "Flesh_Bloody.ImpactHard" )

function SWEP:Initialize()

	self:SetHoldType( "knife" )
end

function SWEP:PrimaryAttack()

	self.Owner:SetAnimation( PLAYER_ATTACK1 )

	local vm = self.Owner:GetViewModel()
	
	self:EmitSound( SwingSound )
	self.Weapon:SetNextPrimaryFire( CurTime() + self.HitRate )

	vm:SendViewModelMatchingSequence( vm:LookupSequence( "misscenter1" ) )

	timer.Create("hitdelay", 0.2, 1, function() self:Hitscan() end)

	timer.Start( "hitdelay" )

end

function SWEP:SecondaryAttack()

	return true	
end

function SWEP:OnDrop()
	
end

function SWEP:Hitscan()

//This function calculate the trajectory

	local tr = util.TraceLine( {
		start = self.Owner:GetShootPos(),
		endpos = self.Owner:GetShootPos() + ( self.Owner:GetAimVector() * self.HitDistance * 1.5 ),
		filter = self.Owner,
		mask = MASK_SHOT_HULL
	} )

//This if shot the bullets

	if ( tr.Hit ) then
		
		bullet = {}
		bullet.Num    = 1
		bullet.Src    = self.Owner:GetShootPos()
		bullet.Dir    = self.Owner:GetAimVector()
		bullet.Spread = Vector(0, 0, 0)
		bullet.Tracer = 0
		bullet.Force  = 5
		bullet.Hullsize = 0
		bullet.Distance = self.HitDistance * 1.5
		bullet.Damage = math.random( 5, 15 )
		self.Owner:FireBullets(bullet)

		self:EmitSound( SwingSound )

		//vm:SendViewModelMatchingSequence( vm:LookupSequence( "hitcenter1" ) )

		if tr.Entity:IsPlayer() or string.find(tr.Entity:GetClass(),"npc") or string.find(tr.Entity:GetClass(),"prop_ragdoll") then
			self:EmitSound( HitSoundBody )
		else
			self:EmitSound( HitSoundWorld )
		end

	
//if end
		//else vm:SendViewModelMatchingSequence( vm:LookupSequence( "misscenter1" ) )
		end

end

function SWEP:Deploy()

	local vm = self.Owner:GetViewModel()
	vm:SendViewModelMatchingSequence( vm:LookupSequence( "draw" ) )
	
	self.Weapon:SetNextPrimaryFire( CurTime() + 0.5 )
	
	return true
end

function SWEP:Holster()

	return true
end

function SWEP:OnRemove()

	timer.Remove("hitdelay")
	return true
end
--PATH addons/__main/lua/weapons/weapon_ninjaskunai.lua:
/*

 ██████╗██████╗ ███████╗ █████╗ ████████╗███████╗██████╗     ██████╗ ██╗   ██╗    ███╗   ███╗ █████╗ ██████╗  █████╗ ███╗   ██╗███████╗ ██████╗ 
██╔════╝██╔══██╗██╔════╝██╔══██╗╚══██╔══╝██╔════╝██╔══██╗    ██╔══██╗╚██╗ ██╔╝    ████╗ ████║██╔══██╗██╔══██╗██╔══██╗████╗  ██║╚══███╔╝██╔═══██╗
██║     ██████╔╝█████╗  ███████║   ██║   █████╗  ██║  ██║    ██████╔╝ ╚████╔╝     ██╔████╔██║███████║██████╔╝███████║██╔██╗ ██║  ███╔╝ ██║   ██║
██║     ██╔══██╗██╔══╝  ██╔══██║   ██║   ██╔══╝  ██║  ██║    ██╔══██╗  ╚██╔╝      ██║╚██╔╝██║██╔══██║██╔══██╗██╔══██║██║╚██╗██║ ███╔╝  ██║   ██║
╚██████╗██║  ██║███████╗██║  ██║   ██║   ███████╗██████╔╝    ██████╔╝   ██║       ██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██║██║ ╚████║███████╗╚██████╔╝
 ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═════╝     ╚═════╝    ╚═╝       ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝ ╚═════╝ 

------------------------------------------------------------------------------------------------------------------------------------------------------

██████╗  ██████╗     ███╗   ██╗ ██████╗ ████████╗    ██████╗ ███████╗██╗   ██╗██████╗ ██╗      ██████╗  █████╗ ██████╗                               
██╔══██╗██╔═══██╗    ████╗  ██║██╔═══██╗╚══██╔══╝    ██╔══██╗██╔════╝██║   ██║██╔══██╗██║     ██╔═══██╗██╔══██╗██╔══██╗                              
██║  ██║██║   ██║    ██╔██╗ ██║██║   ██║   ██║       ██████╔╝█████╗  ██║   ██║██████╔╝██║     ██║   ██║███████║██║  ██║                              
██║  ██║██║   ██║    ██║╚██╗██║██║   ██║   ██║       ██╔══██╗██╔══╝  ██║   ██║██╔═══╝ ██║     ██║   ██║██╔══██║██║  ██║                              
██████╔╝╚██████╔╝    ██║ ╚████║╚██████╔╝   ██║       ██║  ██║███████╗╚██████╔╝██║     ███████╗╚██████╔╝██║  ██║██████╔╝                              
╚═════╝  ╚═════╝     ╚═╝  ╚═══╝ ╚═════╝    ╚═╝       ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝     ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝                               

██╗███╗   ██╗     █████╗ ███╗   ██╗██╗   ██╗    ███████╗██╗  ██╗ █████╗ ██████╗ ███████╗     ██████╗ ██████╗     ███████╗ ██████╗ ██████╗ ███╗   ███╗
██║████╗  ██║    ██╔══██╗████╗  ██║╚██╗ ██╔╝    ██╔════╝██║  ██║██╔══██╗██╔══██╗██╔════╝    ██╔═══██╗██╔══██╗    ██╔════╝██╔═══██╗██╔══██╗████╗ ████║
██║██╔██╗ ██║    ███████║██╔██╗ ██║ ╚████╔╝     ███████╗███████║███████║██████╔╝█████╗      ██║   ██║██████╔╝    █████╗  ██║   ██║██████╔╝██╔████╔██║
██║██║╚██╗██║    ██╔══██║██║╚██╗██║  ╚██╔╝      ╚════██║██╔══██║██╔══██║██╔═══╝ ██╔══╝      ██║   ██║██╔══██╗    ██╔══╝  ██║   ██║██╔══██╗██║╚██╔╝██║
██║██║ ╚████║    ██║  ██║██║ ╚████║   ██║       ███████║██║  ██║██║  ██║██║     ███████╗    ╚██████╔╝██║  ██║    ██║     ╚██████╔╝██║  ██║██║ ╚═╝ ██║
╚═╝╚═╝  ╚═══╝    ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝       ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝     ╚═════╝ ╚═╝  ╚═╝    ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝

-------------------------------------------------------- DO NOT REUPLOAD IN ANY SHAPE OR FORM -------------------------------------------------------- 
-------------------------------------------------------- DO NOT REUPLOAD IN ANY SHAPE OR FORM -------------------------------------------------------- 
-------------------------------------------------- IF YOU EDIT ANYTHING YOU ARE VOID OF MY SUPPORT --------------------------------------------------- 
-------------------------------------------------- IF YOU EDIT ANYTHING YOU ARE VOID OF MY SUPPORT --------------------------------------------------- 

*/
AddCSLuaFile()
AddCSLuaFile( "autorun/cl_mas_ninjaskunai_options.lua" )
AddCSLuaFile( "autorun/sh_mas_ninjaskunai_fonts.lua" )
include( "autorun/cl_mas_ninjaskunai_options.lua" )
include( "autorun/sh_mas_ninjaskunai_fonts.lua" )

if (CLIENT) then

	SWEP.PrintName			= "MAS: Ninja's Kunai"
	SWEP.Author				= "Maranzo"
	SWEP.Category 			= "Weapons"
	SWEP.Instructions		= [[
	LMB: Attack
	RMB: Ability 1
	"F" Key: Ability 2
	"C" Key: Ability 3
	"T" Key: Ultimate Ability
	Mouse3: Ability Selection
	
	]]
	
end // end If Client

SWEP.ViewModel			=	Model( "models/weapons/maranzosabilitysweps/c_mas_ninjakunai.mdl" )
SWEP.UseHands			=	true
SWEP.WorldModel			=	Model( "models/weapons/maranzosabilitysweps/w_mas_ninjakunai.mdl" )
SWEP.HoldType			=	"knife"
SWEP.ViewModelFOV 		= 	54
SWEP.Spawnable 			= 	GetConVar( "sk_mas_ninjaskunai_enabled" ):GetBool()
SWEP.AdminOnly 			= 	GetConVar( "sk_mas_ninjaskunai_adminonly" ):GetBool()

SWEP.Weight				= 	5
SWEP.AutoSwitchTo		= 	true
SWEP.AutoSwitchFrom		= 	false
SWEP.ShouldDropOnDie	=	false

SWEP.Slot				= 	1 -- Secondary weapon
SWEP.SlotPos			= 	0 -- Takes up the beginning slot
SWEP.DrawAmmo			= 	false -- Do not show ammo on HUD
SWEP.DrawCrosshair		= 	true

SWEP.Primary.ClipSize		= 	-1 -- Infinite Ammo
SWEP.Primary.DefaultClip	= 	-1 -- Starts Infinite
SWEP.Primary.Automatic		= 	true -- is automatic
SWEP.Primary.Ammo			= 	"none" -- "none" bc no ammo needed
SWEP.Primary.Spread			= 	0 -- "none" bc no ammo needed
SWEP.Primary.Damage			= 	25
SWEP.Primary.DamageUppercut	= 	40

SWEP.Secondary.ClipSize		= 	-1 -- Infinite again
SWEP.Secondary.DefaultClip	= 	-1
SWEP.Secondary.Automatic	= 	false -- is not automatic
SWEP.Secondary.Ammo			= 	"none" -- No ammo needed
SWEP.Secondary.MaxDistance	= 	6000

SWEP.SwingDelay1			=	0.24
SWEP.SwingDelay2			=	1
SWEP.ModDelay				=	1
SWEP.ModDmg					=	1
SWEP.Hit					= 	false
SWEP.HitTime				= 	CurTime()
SWEP.HitDistance		 	= 	50

// Abilities

ASWEP_Ability_AutoAttack		= 1
ASWEP_Ability_ThrowKunai		= 2
ASWEP_Ability_NinjaDash			= 3
ASWEP_Ability_Concealment		= 4
ASWEP_Ability_Substitution		= 5
ASWEP_Ability_Select			= 6
ASWEP_Ability_Holster			= 7

SWEP.AbilityTable = {
	["Equipped"] = {
		[ASWEP_Ability_AutoAttack]		= {
			["Category"] = "AutoAttack",
			["Name"] = "Kunai Slash",
			["Description"] = "Slash your target with your kunai." },
		[ASWEP_Ability_ThrowKunai]		= { ["Category"] = "Ability 1", ["Name"] = "Throw Kunai", ["Description"] = "Throw your kunai at your target dealing 35 damage." },
		[ASWEP_Ability_NinjaDash]		= { ["Category"] = "Ability 2", ["Name"] = "Ninja Dash", ["Description"] = "Dash in the direction you're aiming!" },
		[ASWEP_Ability_Concealment]		= {	["Category"] = "Ability 3", ["Name"] = "Concealment", ["Description"] = "Crouch down and conceal yourself for a time. Standing, taking non-fall damage, or approaching someone disables this." },
		[ASWEP_Ability_Substitution]	= {	["Category"] = "Ultimate", ["Name"] = "Substitution", ["Description"] = "Awaken your latent power to create and control an illusion of yourself. Return to your casting location after taking damage." },
	},
}

-------------------------------------------------------------------

local ability_icons = {
	[ASWEP_Ability_AutoAttack] 		= { def = Material( 'hud/maranzo_abilityswep/icon_aa_kunaislash.png' ), cast = Material( 'hud/maranzo_abilityswep/icon_aa_kunaislash.png' ) },
	[ASWEP_Ability_ThrowKunai] 		= { def = Material( 'hud/maranzo_abilityswep/icon_kunaithrow.png' ), 	cast = Material( 'hud/maranzo_abilityswep/icon_kunaithrow_cast.png' ) },
	[ASWEP_Ability_NinjaDash] 		= { def = Material( 'hud/maranzo_abilityswep/icon_dash.png' ), 			cast = Material( 'hud/maranzo_abilityswep/icon_dash_cast.png' ) },
	[ASWEP_Ability_Concealment]		= { def = Material( 'hud/maranzo_abilityswep/icon_concealment.png' ), 	cast = Material( 'hud/maranzo_abilityswep/icon_concealment_cast.png' ) },
	[ASWEP_Ability_Substitution] 	= { def = Material( 'hud/maranzo_abilityswep/icon_substitution.png' ), 	cast = Material( 'hud/maranzo_abilityswep/icon_substitution_cast.png' ) },
}

local function DrawCenteredRect( x, y, w, h )
	surface.DrawTexturedRect( x - w * 0.5, y - h * 0.5, w, h )
end

	
if (CLIENT) then
	local WepSelectIcon = Material( "icons/weapon_ninjaskunai_weaponselect.png" )
	local Size = 128
	
	function SWEP:DrawWeaponSelection( x, y, w, h, a )
		surface.SetDrawColor( 255, 255, 255, a )
		surface.SetMaterial( WepSelectIcon )
	
		surface.DrawTexturedRect( x + ( ( w - Size ) * 0.5 ), y + 2, Size, Size )
	
		-- Draw weapon info box
		self:PrintWeaponInfo( x + w + 20, y + h * 0.95, a )
	end
end

-------------------------------------------------------------------
-- Precache Misc Sounds

local SwingSound = Sound( "WeaponFrag.Throw" )
local HitSound = Sound( "npc/roller/blade_cut.wav" )
local HitSoundSquish = Sound( "npc/roller/blade_cut.wav" )
local HitSoundHard = Sound( "npc/roller/blade_out.wav" )

--------------------------------------------------------------------
-- Define Local Functions

// Keys down for SinglePlayer
local keysDown = {}

// Effect F'n for think
local function playEffect( origin, entity, flags, effectstr, iterations, scale, magnitude, r1, r2, rz )
	
	if !iterations then iterations = 1 end
	if !scale then scale = 1 end
	if !magnitude then magnitude = 1 end
	if !r1 then r1 = 0 r2 = 0 end
	if !r2 then r2 = r1 end
		local TF_ed = EffectData()
		TF_ed:SetOrigin( origin )
		TF_ed:SetEntity( entity )
		TF_ed:SetFlags( flags )
		TF_ed:SetScale( scale )
		TF_ed:SetMagnitude( magnitude )
	for i=1, iterations do
		local randVec = !rz and Vector( math.random( -r1, r2 ), math.random( -r1, r2 ), 0 ) or Vector( math.random( -r1, r2 ), math.random( -r1, r2 ), math.random( -r1, r2 ) )
		TF_ed:SetOrigin( origin + randVec )
		util.Effect( effectstr, TF_ed, true, true )
	end
	
end

--------------------------------------------------------------------
-- Define SWEP Functions

local MAS = {}
function SWEP:Initialize( bool )
	self.Spawnable			= 	GetConVar( "sk_mas_ninjaskunai_enabled" ):GetBool()
	self.AdminOnly			= 	GetConVar( "sk_mas_ninjaskunai_adminonly" ):GetBool()
	
	if Maranzos_AbilitySWEPs then 
		Maranzos_AbilitySWEPs.BMS_InfUlt= tobool( GetConVarNumber( "sk_mas_ninjaskunai_infinitecharge" ) )
		Maranzos_AbilitySWEPs.BMS_NoCD	= tobool( GetConVarNumber( "sk_mas_ninjaskunai_nocooldown" ) )
		
		table.Merge( MAS, Maranzos_AbilitySWEPs ) -- Merge that shit rather than reference it
	end
	
	MAS.IsCasting					=	false
	MAS.Ability 					=	{}
	MAS.Ability.AA 					= 	{}	-- Auto Attack
	MAS.Ability.ThrowKn 			= 	{}	-- Throw Kunai
	MAS.Ability.NinjaDash 			= 	{}	-- Ninja Dash
	MAS.Ability.Conceal 			= 	{}	-- Concealment
	MAS.Ability.Substitution 		= 	{}	-- Ultimate: Substitution
	
	-- Ultimate: Substitution
	MAS.Ability.Substitution.MarkedPos		=	vector_origin
	MAS.Ability.Substitution.MarkedAngles	=	angle_zero
	MAS.Ability.Substitution.MaxCharge		=	100
	MAS.Ability.Substitution.SoundCast		= 	Sound( "npc/antlion/idle1.wav" )
	MAS.Ability.Substitution.SoundHit		= 	Sound( "physics/cardboard/cardboard_box_impact_bullet4.wav" )
	MAS.Ability.Substitution.SoundEnd		= 	Sound( "npc/antlion_guard/far_foot_heavy1.wav" )
	
	-- Throw Kunai
	MAS.Ability.ThrowKn.Cooldown		=	1	-- seconds
	MAS.Ability.ThrowKn.Damage			=	35
	MAS.Ability.ThrowKn.SoundCast		=	Sound( "npc/manhack/mh_blade_snick1.wav" )
	MAS.Ability.ThrowKn.SoundHit		=	Sound( "phx/eggcrack.wav" )
	MAS.Ability.ThrowKn.SoundMiss		=	Sound( "phx/hmetal1.wav" )
	
	-- Ninja Dash
	MAS.Ability.NinjaDash.Cooldown		=	60	-- seconds
	MAS.Ability.NinjaDash.DashDistance	=	600
	MAS.Ability.NinjaDash.DashSpeed		=	1800
	MAS.Ability.NinjaDash.Duration		=	1	-- seconds
	MAS.Ability.NinjaDash.SoundCast		= 	Sound( "Sand.BulletImpact" )
	MAS.Ability.NinjaDash.Legs			=	ConVarExists( "cl_legs" )
	if CLIENT and MAS.Ability.NinjaDash.Legs then
		MAS.Ability.NinjaDash.LegsNum	=	GetConVarNumber( "cl_legs" )
	end
	
	-- Concealment
	MAS.Ability.Conceal.Cooldown		=	14	-- seconds
	MAS.Ability.Conceal.Duration		=	10
	MAS.Ability.Conceal.SoundCast		=	Sound( "ambient/energy/spark2.wav" ) -- Activate Sound
	--MAS.Ability.Conceal.SoundCast		=	Sound( "buttons/spark2.wav" ) -- Activate Sound
	MAS.Ability.Conceal.SoundHit		=	Sound( "npc/barnacle/neck_snap2.wav" ) -- Hit Sound
	MAS.Ability.Conceal.SoundEnd		=	Sound( "ambient/energy/spark4.wav" ) -- Activate Sound
	--MAS.Ability.Conceal.SoundEnd		=	Sound( "buttons/spark1.wav" ) -- Activate Sound
	
	if Maranzos_AbilitySWEPs.BMS_NoCD then
		self.SwingDelay1					=	0.24
		self.SwingDelay2					=	0.24
		MAS.Ability.Substitution.Cooldown		=	1
		MAS.Ability.ThrowKn.Cooldown		=	1
		MAS.Ability.NinjaDash.Cooldown		=	1
		MAS.Ability.Conceal.Cooldown		=	1
		MAS.Ability.NinjaDash.CooldownMiss	=	1
		MAS.Ability.Conceal.CooldownMiss	=	1
	end
	
	
	local ply = self.Owner
	
	if (CLIENT) then
		self.DrawCrosshair		= 	GetConVar( "cl_mas_crosshairon" ):GetBool()
		self.KB = Maranzos_AbilitySWEPs.keyconfigs
		
		// Define a table of instructions
		self.Instr = {}
		self.Instr["H1"] = self.KB[ 1 ] .. " : "
		self.Instr["H2"] = self.KB[ 2 ] .. " : "
		self.Instr["H3"] = self.KB[ 3 ] .. " : "
		self.Instr["H4"] = self.KB[ 4 ] .. " : "
		self.Instr["H5"] = self.KB[ 5 ] .. " : "
		self.Instr["H6"] = self.KB[ 6 ] .. " : "
		self.Instr["1"] = "Attack"
		self.Instr["2"] = "Throw Kunai"
		self.Instr["3"] = "Ninja Dash"
		self.Instr["4"] = "Concealment"
		self.Instr["5"] = "Ultimate: Substitution"
		self.Instr["6"] = "Ability Selection"
		self.Instr["7"] = "\n".. "Press your Reload key to holster your weapon!"
		self.Instr["8"] = "\n".. "Check the Options menu to Rebind Abilities and Enable Menu & Flashlight use."
	
		// Run when key pressed
		if !game.SinglePlayer() then
			hook.Add( "PlayerButtonDown", "MAS.Keybind.NinjasKunai" .. ply:EntIndex(), function( ply, btn )
				local Wep = ply:GetActiveWeapon()
				
				if ( ply:IsValid() and ply:Alive() and Wep:IsValid() and Wep:GetClass() == "weapon_ninjaskunai" ) then
					
					if self.KB and self.KB["Btn"][btn] and IsFirstTimePredicted() then 
						-- AutoAttack & Ability #1:Throw Kunai are bound to +attack & +attack2 by default & won't trigger anything here.
						if !vgui.CursorVisible() then
							
							if self.KB["Btn"][btn] == ASWEP_Ability_NinjaDash then 
							// Abil 2: Ninja Dash
								local CD = MAS.Ability.NinjaDash.Cooldown
								if ( self:GetA2_Active() or self:GetIsCasting() or self:GetA2_CD() != 0 ) then 
									return 
								end
								local ability = ASWEP_Ability_NinjaDash
								self:SetIsCasting( true )
								
								net.Start( "Maranzo_AbilitySWEP_ninjaskunai_Cast" )
								net.WriteInt( ability, 4 )
								net.WriteEntity( self )
								net.SendToServer()
								
							elseif self.KB["Btn"][btn] == ASWEP_Ability_Concealment then 
							// Abil 3: Concealment
								local CD = MAS.Ability.Conceal.Cooldown
								if ( !( self:GetA3_Active() or self:GetA3_CD() == CD + 2 ) and ( self:GetIsCasting() or self:GetA3_CD() != 0 ) ) then 
									return 
								end
								local ability = ASWEP_Ability_Concealment
								self:SetIsCasting( true )
								
								net.Start( "Maranzo_AbilitySWEP_ninjaskunai_Cast" )
								net.WriteInt( ability, 4 )
								net.WriteEntity( self )
								net.SendToServer()
								
							elseif self.KB["Btn"][btn] == ASWEP_Ability_Substitution then 
							// Ultimate: Substitution
								if ( self:GetIsCasting() or self:GetAU_Active() ) then 
									return -- do nothing
								end
								
								self:SetIsCasting( true )
								local ability = ASWEP_Ability_Substitution
								
								net.Start( "Maranzo_AbilitySWEP_ninjaskunai_Cast" )
								net.WriteInt( ability, 4 )
								net.WriteEntity( self )
								net.SendToServer()
								
							end // end Key Check
						end // end if cursor visible
						
						if self.KB["Btn"][btn] == ASWEP_Ability_Select then
						// Ability Selection
							self:DrawAbilitySelection()
							
						end // end Key check, cursor visible OK
						
					end // end Btn Pushed Check
				end // end if ply & alive & weapon
			end) // end Hook
		else // if game is SinglePlayer
			-- do nothing
		end // end if SinglePlayer
	
		// Run when key pressed
		hook.Add( "PlayerBindPress", "MAS.Keybind.NinjasKunai" .. ply:EntIndex(), function( ply, bind, down )
			local Wep = ply:GetActiveWeapon()
			if ( ply and ply:IsValid() and ply:Alive() and MASconvar_preventbinds:GetBool() and Wep:IsValid() and ply:GetActiveWeapon():GetClass() == "weapon_ninjaskunai" ) then
				if ( string.find( bind, "impulse 100" ) or string.find( bind, "+menu" ) or string.find( bind, "+menu_context" ) ) then 
					return true
				end // end string find 
			end // end if Valid
		end) // end Hook
		
	end // end If Client
	
	if !bool then
		self:SetHoldType( "knife" )
		if (SERVER) then
			self:SetCharge( 0 )
		end
	end

end  // end Fn Initialize

// On Lua Edited
function SWEP:OnReloaded()
	
	
	if Maranzos_AbilitySWEPs then 
		Maranzos_AbilitySWEPs.BMS_InfUlt= tobool( GetConVarNumber( "sk_mas_ninjaskunai_infinitecharge" ) )
		Maranzos_AbilitySWEPs.BMS_NoCD	= tobool( GetConVarNumber( "sk_mas_ninjaskunai_nocooldown" ) )
		
		table.Merge( MAS, Maranzos_AbilitySWEPs ) -- Merge that shit rather than reference it
	end
	
	MAS.IsCasting					=	false
	MAS.Ability 					=	{}
	MAS.Ability.AA 					= 	{}	-- Auto Attack
	MAS.Ability.ThrowKn 			= 	{}	-- Throw Kunai
	MAS.Ability.NinjaDash 			= 	{}	-- Ninja Dash
	MAS.Ability.Conceal 			= 	{}	-- Concealment
	MAS.Ability.Substitution 		= 	{}	-- Ultimate: Substitution
	
	-- Ultimate: Substitution
	MAS.Ability.Substitution.MarkedPos		=	vector_origin
	MAS.Ability.Substitution.MarkedAngles	=	angle_zero
	MAS.Ability.Substitution.MaxCharge		=	100
	MAS.Ability.Substitution.SoundCast		= 	Sound( "npc/antlion/idle1.wav" )
	MAS.Ability.Substitution.SoundHit		= 	Sound( "physics/cardboard/cardboard_box_impact_bullet4.wav" )
	MAS.Ability.Substitution.SoundEnd		= 	Sound( "npc/antlion_guard/far_foot_heavy1.wav" )
	
	-- Throw Kunai
	MAS.Ability.ThrowKn.Cooldown		=	1	-- seconds
	MAS.Ability.ThrowKn.Damage			=	35
	MAS.Ability.ThrowKn.SoundCast		=	Sound( "npc/manhack/mh_blade_snick1.wav" )
	MAS.Ability.ThrowKn.SoundHit		=	Sound( "phx/eggcrack.wav" )
	MAS.Ability.ThrowKn.SoundMiss		=	Sound( "phx/hmetal1.wav" )
	
	-- Ninja Dash
	MAS.Ability.NinjaDash.Cooldown		=	60	-- seconds
	MAS.Ability.NinjaDash.DashDistance	=	600
	MAS.Ability.NinjaDash.DashSpeed		=	1800
	MAS.Ability.NinjaDash.Duration		=	1	-- seconds
	MAS.Ability.NinjaDash.SoundCast		= 	Sound( "Sand.BulletImpact" )
	MAS.Ability.NinjaDash.Legs			=	ConVarExists( "cl_legs" )
	if CLIENT and MAS.Ability.NinjaDash.Legs then
		MAS.Ability.NinjaDash.LegsNum	=	GetConVarNumber( "cl_legs" )
	end
	
	-- Concealment
	MAS.Ability.Conceal.Cooldown		=	14	-- seconds
	MAS.Ability.Conceal.Duration		=	10
	MAS.Ability.Conceal.SoundCast		=	Sound( "ambient/energy/spark2.wav" ) -- Activate Sound
	--MAS.Ability.Conceal.SoundCast		=	Sound( "buttons/spark2.wav" ) -- Activate Sound
	MAS.Ability.Conceal.SoundHit		=	Sound( "npc/barnacle/neck_snap2.wav" ) -- Hit Sound
	MAS.Ability.Conceal.SoundEnd		=	Sound( "ambient/energy/spark4.wav" ) -- Activate Sound
	--MAS.Ability.Conceal.SoundEnd		=	Sound( "buttons/spark1.wav" ) -- Activate Sound
	
	if Maranzos_AbilitySWEPs.BMS_NoCD then
		self.SwingDelay1					=	0.24
		self.SwingDelay2					=	0.24
		MAS.Ability.Substitution.Cooldown		=	1
		MAS.Ability.ThrowKn.Cooldown		=	1
		MAS.Ability.NinjaDash.Cooldown		=	1
		MAS.Ability.Conceal.Cooldown		=	1
		MAS.Ability.NinjaDash.CooldownMiss	=	1
		MAS.Ability.Conceal.CooldownMiss	=	1
	end
	
end

function SWEP:DrawAbilitySelection()
	
	if ( MAS.Editor != nil ) then
		MAS.Editor:Remove()
		MAS.Editor = nil
	elseif !vgui.CursorVisible() then
		local x = ScrW()
		local y = ScrH()
		local BGColor = Color( 0, 130, 200, 200 )
		local FGColor = Color(50, 50, 50, 150)
		local BorderColor = Color( 0, 100, 165, 255 )
		local TColor1 = Color(255, 255, 255, 255)
		local TColor2 = Color(255, 180, 20, 255)
		local TColor3 = Color(255, 240, 220, 255)
		local TColorBG = Color(60, 60, 60, 255)
		local OvlColor = Color(255, 255, 0, 100)
		MAS.Editor = vgui.Create( "DFrame" ) //Create a Frame to contain everything.
		MAS.Editor:SetTitle( "" )
		MAS.Editor:SetSize( x, y )
		MAS.Editor:Center()
		MAS.Editor:SetVisible( true )
		MAS.Editor:ShowCloseButton( false )
		function MAS.Editor:Paint()
			surface.SetDrawColor( BGColor )
			surface.DrawRect( 0, 0, x, y )
			surface.SetDrawColor( BorderColor )
			for i=1, 6 do
				surface.DrawOutlinedRect( 0+i, 0+i, x - i*2, y - i*2 )
			end
			local Tx = x*0.5
			local Ty = y/20
			draw.SimpleText("Ability Selection", "MaranzoAbil_UltimateFont", Tx + 2, Ty + 2, TColorBG, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText("Ability Selection", "MaranzoAbil_UltimateFont", Tx, Ty, TColor1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
			
		local DButton = vgui.Create( "DButton", MAS.Editor )
		local size = 64
		local border = 12
		DButton:SetSize( size, size )
		DButton:SetPos( x - size - border, y - size - border )
		DButton:SetText( "Close" )
		DButton:SetTextColor( TColor1 )
		DButton:SetFontInternal( "MaranzoAbil_DefaultFont" )
		DButton:SetExpensiveShadow( 1, TColorBG )
		DButton.DoClick = function()
			MAS.Editor:Remove()
			MAS.Editor = nil
		end
		local Dw, Dh
		function DButton:Paint( w, h)
			Dw = w
			Dh = h
			draw.RoundedBox( 8, 0, 0, Dw, Dh, BorderColor )
			draw.RoundedBox( 8, 0, 0, Dw - 4, Dh - 4, FGColor )
		end
		
		
		MAS.Editor.Scroll = vgui.Create( "DScrollPanel", MAS.Editor ) //Create the Scroll panel
		MAS.Editor.Scroll:SetSize( x - 24, y - y/5 )
		MAS.Editor.Scroll:SetPos( 12, y/20 )
		
		MAS.Editor.List = vgui.Create( "DIconLayout", MAS.Editor.Scroll )
		MAS.Editor.List:SetSize( x - 30, y - y/5 )
		MAS.Editor.List:SetPos( 0, 0 )
		MAS.Editor.List:SetSpaceX( 5 )
		MAS.Editor.List:SetSpaceY( 10 )
		
		// Create list
		for k, v in ipairs( self.AbilityTable["Equipped"] ) do -- ipairs is a temp fix until I add additional abilities
			local ListItem = MAS.Editor.List:Add( "DPanel" ) //Add DPanel to the DIconLayout
			ListItem:SetSize( MAS.Editor.List:GetWide(), y/7 ) //Set the size of it
			function ListItem:Paint( w, h )
				local drawColor = Color( 255, 255, 255, 255 )
				local ability = k
				local material = ability_icons[ ability ] and ability_icons[ ability ].def or ability_icons[ ASWEP_Ability_AutoAttack ].def
				local size = 64
				local Tx = w/50
				local Ty = 2
				surface.SetMaterial( material )
				surface.SetDrawColor( drawColor )
				DrawCenteredRect( size*0.5 + Tx, h*0.5, size, size )
				draw.SimpleText( v["Category"], "MaranzoAbil_DefaultFont", Tx +2, 2 +2, TColorBG, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT )
				draw.SimpleText( v["Category"], "MaranzoAbil_DefaultFont", Tx, 2, TColor2, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT )
				draw.SimpleText( v["Name"], "MaranzoAbil_DefaultFont", Tx +2, h - 28 +2, TColorBG, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT )
				draw.SimpleText( v["Name"], "MaranzoAbil_DefaultFont", Tx, h - 28, TColor1, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT )
			end // end ListItem Paint
			
			local DLabel = vgui.Create( "DLabel", ListItem )
			local w = ListItem:GetWide()
			local h = ListItem:GetTall()
			local Tx, Sx
			if x > 1200 then
				if x > 1350 then Tx = w/7 Sx = w - Tx * 2.5
				else Tx = w/6 Sx = w - Tx * 2 end
			else Tx = w/4 Sx = w - Tx end
			
			local Ty = 12
			DLabel:SetSize( Sx, h - 14 )
			DLabel:SetPos( Tx, Ty )
			DLabel:SetText( v["Description"] )
			DLabel:SetContentAlignment( 4 )
			DLabel:SetTextColor( TColor3 )
			DLabel:SetTextInset( 0, 0 )
			DLabel:SetFontInternal( "MaranzoAbil_DefaultFont" )
			DLabel:SetWrap( true )
			DLabel:SetExpensiveShadow( 1, TColorBG )
			
		end // end For Loop List Creation
		
	end
	
end

function SWEP:DrawHUD()
	
	// Setup Var's used across the board
	local Charge = self:GetCharge()
	local ability
	local ACTIVE
	local CD
	
	if !MASconvar_drawhud:GetBool() then return end
	// Ability Icon Draw
	local drawColor = ( prohibited ) and Color( 100, 100, 100, 255 ) or Color( 255, 255, 255, 255 ) -- shortened If statement	
	local size = ( menushown && ability == menu_ability ) and 128 or 64 // 128 | 64
	local ultsize = ( menushown && ability == menu_ability ) and 128 or 128 // 128 | 128
	
	-- positioning
	local x = ScrW()*0.5 -- Ult (Center)
	local y = ScrH() - 70
	local dif = 110
	local x0 = x - dif * 1.7 -- AA
	local x1 = x - dif
	local x2 = x + dif
	local x3 = x + dif * 1.7
	local TxtY = y + size * 0.65
	local Txt2Y = y + size * 0.65 + 2
	local TColor = Color(255, 255, 255, 255)
	local T2Color = Color(20, 20, 20, 255)
	
	// Auto-Attack
	ability = ASWEP_Ability_AutoAttack
	ACTIVE = self:GetAA_Active()
	CD = self:GetAA_CD()
	drawColor = ( CD > 0 ) and Color( 100, 100, 100, 255 ) or Color( 255, 255, 255, 255 ) -- shortened If statement
	surface.SetMaterial( ability_icons[ ability ].def )
	surface.SetDrawColor( drawColor )
	DrawCenteredRect( x0, y, size, size )
	draw.SimpleText( self.KB[ ability ], "MaranzoAbil_DefaultFont", x0 + 1, Txt2Y, T2Color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText( self.KB[ ability ], "MaranzoAbil_DefaultFont", x0, TxtY, TColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	
	// Ability 1
	ability = ASWEP_Ability_ThrowKunai
	ACTIVE = self:GetA1_Active()
	CD = self:GetA1_CD()
	if !ACTIVE then // Not Active
		surface.SetMaterial( ability_icons[ ability ].def )
		
		if CD > 0 then
			drawColor = Color( 100, 100, 100, 255 )
			surface.SetDrawColor( drawColor )
			DrawCenteredRect( x1, y, size, size )
			draw.SimpleText( CD, "MaranzoAbil_DefaultFont", x1, y, TColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		else
			drawColor = Color( 255, 255, 255, 255 )
			surface.SetDrawColor( drawColor )
			DrawCenteredRect( x1, y, size, size )
		end
		
	else // Active
		drawColor = Color( 255, 255, 255, 255 ) -- shortened If statement
		surface.SetMaterial( ability_icons[ ability ].cast )
		surface.SetDrawColor( drawColor )
		DrawCenteredRect( x1, y, size, size )
	end // end if Active
	
	draw.SimpleText( self.KB[ ability ], "MaranzoAbil_DefaultFont", x1 + 1, Txt2Y, T2Color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText( self.KB[ ability ], "MaranzoAbil_DefaultFont", x1, TxtY, TColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	
	
	// Ability 2
	ability = ASWEP_Ability_NinjaDash
	ACTIVE = self:GetA2_Active()
	CD = self:GetA2_CD()
	if !ACTIVE then // Not Active
		surface.SetMaterial( ability_icons[ ability ].def )
		
		if CD > 0 then
			drawColor = Color( 100, 100, 100, 255 )
			surface.SetDrawColor( drawColor )
			DrawCenteredRect( x2, y, size, size )
			draw.SimpleText( CD, "MaranzoAbil_DefaultFont", x2, y, TColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		else
			drawColor = Color( 255, 255, 255, 255 )
			surface.SetDrawColor( drawColor )
			DrawCenteredRect( x2, y, size, size )
		end
		
	else // Active
		drawColor = Color( 255, 255, 255, 255 )
		surface.SetMaterial( ability_icons[ ability ].cast )
		surface.SetDrawColor( drawColor )
		DrawCenteredRect( x2, y, size, size )
	end // end if Active
	
	draw.SimpleText( self.KB[ ability ], "MaranzoAbil_DefaultFont", x2 + 1, Txt2Y, T2Color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText( self.KB[ ability ], "MaranzoAbil_DefaultFont", x2, TxtY, TColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	
	
	// Ability 3
	ability = ASWEP_Ability_Concealment
	ACTIVE = self:GetA3_Active()
	CD = self:GetA3_CD()
	if !ACTIVE then // Not Active
		surface.SetMaterial( ability_icons[ ability ].def )
		
		if CD > 0 then
			drawColor = Color( 100, 100, 100, 255 )
			surface.SetDrawColor( drawColor )
			DrawCenteredRect( x3, y, size, size )
			draw.SimpleText( CD, "MaranzoAbil_DefaultFont", x3, y, TColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		else
			drawColor = Color( 255, 255, 255, 255 )
			surface.SetDrawColor( drawColor )
			DrawCenteredRect( x3, y, size, size )
		end
		
	else // Active
		drawColor = Color( 255, 255, 255, 255 )
		surface.SetMaterial( ability_icons[ ability ].cast )
		surface.SetDrawColor( drawColor )
		DrawCenteredRect( x3, y, size, size )
	end // end if Active
	
	draw.SimpleText( self.KB[ ability ], "MaranzoAbil_DefaultFont", x3 + 1, Txt2Y, T2Color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText( self.KB[ ability ], "MaranzoAbil_DefaultFont", x3, TxtY, TColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	
	// Ultimate
	ability = ASWEP_Ability_Substitution
	ACTIVE = self:GetAU_Active()
	if !ACTIVE then // Not Active
		surface.SetMaterial( ability_icons[ ability ].def )
		
		if Charge < 100 then
			drawColor = Color( 100, 100, 100, 255 )
			surface.SetDrawColor( drawColor )
			DrawCenteredRect( x, y - 32, size * 1.7, size * 1.7 )
		else
			drawColor = Color( 255, 255, 255, 255 )
			surface.SetDrawColor( drawColor )
			DrawCenteredRect( x, y - 32, ultsize, ultsize )
		end
		
	else // Active
		drawColor = Color( 255, 255, 255, 255 )
		surface.SetMaterial( ability_icons[ ability ].cast )
		surface.SetDrawColor( drawColor )
		DrawCenteredRect( x, y - 32, ultsize, ultsize )
	end // end if Active
	draw.SimpleText( self.KB[ ability ], "MaranzoAbil_DefaultFont", x + 1, Txt2Y, T2Color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText( self.KB[ ability ], "MaranzoAbil_DefaultFont", x, TxtY, drawColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	
	
----------------------------
	// Variables
	-- local ChargeColor = Color(40,200,255,180) - Nice Blue
	local ChargeColor = Color(255,255,255,255)
	local FullChargeColor = Color(255,200,40,180)
	local x = ScrW() * 0.5
	local y = ScrH() - 120
	
	// Charge HUD Draw
	if Charge >= MAS.Ability.Substitution.MaxCharge then
		-- do nothing
	elseif !ACTIVE then // not max charge & not active
		-- Draw Charge %
		local ChargeText = Charge.."%"
		draw.SimpleText(ChargeText, "MaranzoAbil_UltimateFont", x + 12, ScrH() - 98, Color( 20, 20, 20, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		draw.SimpleText(ChargeText, "MaranzoAbil_UltimateFont" , x + 10, ScrH() - 100, ChargeColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	
	return true
  end

// Specifically draw crosshair
function SWEP:DoDrawCrosshair( x, y )	
	-- little box
    surface.SetDrawColor(0, 0, 0, 125)
    surface.DrawRect(x - 3, y - 3, 6, 6)
    
    surface.SetDrawColor(255, 255, 255, 150)
    surface.DrawRect( x - 2, y - 2, 4, 4)
	return true
end

function SWEP:SetupDataTables()

	self:NetworkVar( "Float", 0, "NextMeleeAttack" )
	self:NetworkVar( "Float", 1, "NextIdle" )
	self:NetworkVar( "Float", 2, "AA_CD" )
	self:NetworkVar( "Float", 3, "A1_CD" )
	self:NetworkVar( "Float", 4, "A2_CD" )
	self:NetworkVar( "Float", 5, "A3_CD" )
	
	self:NetworkVar( "Int", 0, "Charge" )
	
	self:NetworkVar( "String", 0, "Ability" )
	
	self:NetworkVar( "Bool", 0, "AA_Active" )
	self:NetworkVar( "Bool", 1, "A1_Active" )
	self:NetworkVar( "Bool", 2, "A2_Active" )
	self:NetworkVar( "Bool", 3, "A3_Active" )
	self:NetworkVar( "Bool", 4, "AU_Active" )
	self:NetworkVar( "Bool", 5, "IsCasting" )
	self:NetworkVar( "Bool", 6, "CastOnCrouch" )

end

function SWEP:UpdateNextIdle( ply )
	
	local ply = ply or self.Owner
	local vm = ply:GetViewModel()
	self:SetNextIdle( CurTime() + vm:SequenceDuration() / vm:GetPlaybackRate() )

end

local reloadToggle = false
local reloadTime = CurTime()
function SWEP:Reload()
	
	local curtime = CurTime()
	if curtime < reloadTime then return end
	reloadTime = curtime + 0.5
	-- Visual FX
	local anim					=	reloadToggle and "kunai_draw" or "kunai_holster"
	local vm 					= 	self.Owner:GetViewModel()
	local speed 				= 	GetConVarNumber( "sv_defaultdeployspeed" ) or 1
	local Duration				= 	vm:SequenceDuration() / speed
	local CD					=	reloadToggle and Duration or 1000000000
	local HoldType				=	reloadToggle and "knife" or "normal"
	vm:SendViewModelMatchingSequence( vm:LookupSequence( anim ) )
	self:SetHoldType( HoldType )
	self:SetNextPrimaryFire( curtime + CD )
	self:SetNextSecondaryFire( curtime + CD )
	self:SetNextIdle( curtime + CD )
	
	reloadToggle = !reloadToggle
	self:SetIsCasting( reloadToggle )
	
	return false
end

// Primary Attack
local hideCheckDel = CurTime()
function SWEP:PrimaryAttack( right )
	
	local ply = self.Owner
	local vm = self.Owner:GetViewModel()
	
	self:SetHoldType( "knife" )
	self:SetAA_Active( true )
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
	self:SetNextMeleeAttack( CurTime() + 0.1 * self.ModDelay )
	
	local anim = "kunai_left"
	if ( vm:GetSequenceName( vm:GetSequence() ) == anim ) then anim = "kunai_right" end -- alternate swings
	local CD = self.SwingDelay1 * self.ModDelay
	self:SetAA_CD( CD )
	timer.Simple( CD, function()
		if self:IsValid() and !self:GetAA_Active() then self:SetAA_CD( 0 ) end
	end)
	self:SetNextPrimaryFire( CurTime() + CD )
	self:SetNextSecondaryFire( CurTime() + CD )
	
	vm:SendViewModelMatchingSequence( vm:LookupSequence( anim ) )
	self:EmitSound( SwingSound )
	
	self:UpdateNextIdle()

end

// Secondary Attack
function SWEP:SecondaryAttack()
	
	-- Checks
	local A1_CD = self:GetA1_CD()
	local AA_CD = self:GetAA_CD()
	if ( A1_CD != 0 or AA_CD != 0 ) then return end
	
	-- Variables
	local ply = self.Owner
	local vm = self.Owner:GetViewModel()
	local anim = "kunai_throw"
	local CD = MAS.Ability.ThrowKn.Cooldown
	
	-- Set A1 CD
	self:SetA1_Active( true )
	self:SetA1_CD( CD )
	local itCD = CD
	timer.Create( "MAS.Ability.ThrowKunai.CD" .. ply:EntIndex(), 1, itCD, function()
		if self:IsValid() then
			CD = CD - 1
			if CD < 0 then CD = 0 end
			self:SetA1_CD( CD )
		else
			timer.Remove( "MAS.Ability.ThrowKunai.CD" .. ply:EntIndex() )
		end
	end)
	self:SetNextSecondaryFire( CurTime() + CD )
	
	-- Set AA CD
	self:SetAA_Active( true )
	CD = self.SwingDelay2 * self.ModDelay
	self:SetAA_CD( CD )
	timer.Create( "MAS.Ability.ThrowKunai.Cast" .. ply:EntIndex(), 1, CD, function()
		if self:IsValid() then self:SetAA_Active( false ) self:SetAA_CD( 0 ) end
	end)
	self:SetNextPrimaryFire( CurTime() + CD )
	
	-- Prep Ability
	self:SetHoldType( "melee" ) -- raise 3rd person arm
	local GoThrowKnife = 0.5 * self.ModDelay
	self:SetNextMeleeAttack( CurTime() + GoThrowKnife )
	if SERVER and self:GetA3_Active() then self:ConcealmentUnHide( ply, self ) end -- unhide if concealed
	
	vm:SendViewModelMatchingSequence( vm:LookupSequence( anim ) )
	
	self:UpdateNextIdle()
	
end // end Secondary Attack

// Set Tracer Origin
function SWEP:GetTracerOrigin()
	local origin = self.Owner:GetShootPos() - Vector( 0, 0, 2 )
	return origin
end

function SWEP:DealDamage( ability )
	
	if !IsFirstTimePredicted() then return end
	
	local vm = self.Owner:GetViewModel()
	local anim = vm:GetSequenceName( vm:GetSequence() )
	local ply = self.Owner
	
	self.Owner:LagCompensation( true )
	
	
	if (!ability) then
	
		local trace = util.TraceLine( {
			start = self.Owner:GetShootPos(),
			endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * self.HitDistance,
			filter = self.Owner,
			mask = MASK_SHOT_HULL
		} )
	
		if ( !IsValid( trace.Entity ) ) then
			trace = util.TraceHull( {
				start = self.Owner:GetShootPos(),
				endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * self.HitDistance,
				filter = self.Owner,
				mins = Vector( -10, -10, -8 ),
				maxs = Vector( 10, 10, 8 ),
				mask = MASK_SHOT_HULL
			} )
		end // end Hull Trace

		-- Because SWEP:Think is ran shared in SP
		if ( SERVER and trace.Hit ) then
			local randSound = math.random( 1, 20 )
			local randPitch = math.random( 80, 130 )
			if randSound > 5 then randSound = HitSound elseif
			randSound == 5 then randSound = HitSoundSquish else
				randSound = HitSoundHard
				randPitch = math.random( 80, 120 )
			end
			self.Owner:EmitSound( randSound, 75, randPitch )
		end
		
		self.Hit = false


		if ( SERVER && IsValid( trace.Entity ) ) then
		
			local phys = trace.Entity:GetPhysicsObject()
			if ( IsValid( phys ) ) then
				phys:ApplyForceOffset( self.Owner:GetAimVector() * 80 * phys:GetMass(), trace.HitPos )
			end
			
			if ( SERVER && IsValid( trace.Entity ) && ( trace.Entity:IsNPC() || trace.Entity:IsPlayer() || trace.Entity:Health() > 0 ) ) then
				
				if ( ( trace.Entity:IsNPC() || trace.Entity:IsPlayer() ) && !trace.Entity:IsLagCompensated() ) then
					trace.Entity:SetLagCompensated( true )
				end
				
				local dmginfo = DamageInfo()
				local attacker = self.Owner
				if ( !IsValid( attacker ) ) then attacker = self end
		
				dmginfo:SetAttacker( attacker )
				dmginfo:SetInflictor( self )
				dmginfo:SetDamage( self.Primary.Damage * self.ModDmg )
		
				if ( anim == "kunai_left" ) then
					dmginfo:SetDamageForce( self.Owner:GetRight() * 4912 + self.Owner:GetForward() * 9998 )
				elseif ( anim == "kunai_right" ) then
					dmginfo:SetDamageForce( self.Owner:GetRight() * -4912 + self.Owner:GetForward() * 9989 )
				end
		
				trace.Entity:TakeDamageInfo( dmginfo )
				
				self.Hit = true
				local charge = self:GetCharge() + 3
				self:SetCharge( charge )
				self.HitTime = CurTime()
		
			end // end if Entity is Player or NPC or Health > 0
		end // end if Server & Entity
		
		self.Owner:LagCompensation( false )
	
	elseif ability == ASWEP_Ability_ThrowKunai then // end if Auto Attack
	
		trace = util.TraceHull( {
			start = self.Owner:GetShootPos(),
			endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * self.Secondary.MaxDistance,
			filter = self.Owner,
			mins = Vector( -10, -10, -8 ),
			maxs = Vector( 10, 10, 8 ),
			mask = MASK_SHOT_HULL
		} )
		
		if SERVER and IsValid( trace.Entity ) && ( trace.Entity:IsNPC() || trace.Entity:IsPlayer() ) && !trace.Entity:IsLagCompensated() then
			trace.Entity:SetLagCompensated( true )
		end
		
		local Bullet = {}
			Bullet.Attacker = 	self.Owner
			Bullet.Num		=	1
			Bullet.Src		=	ply:GetShootPos()
			Bullet.Dir		=	ply:GetAimVector()
			Bullet.Distance	=	self.Secondary.MaxDistance
			Bullet.HullSize =	10
			Bullet.Spread	=	Vector( self.Primary.Spread, self.Primary.Spread, 0 )
			Bullet.Tracer	=	1 -- Tracer every bullet
			Bullet.TracerName	= "AirboatGunHeavyTracer"
			Bullet.Force	=	1
			Bullet.Damage	=	self.Primary.Damage
			Bullet.AmmoType	=	"" -- No ammo type
			Bullet.Callback = function( attacker, tr, dmginfo )
	
		self.Hit = false
		dmginfo:SetInflictor( self )
		
		-- Do Ability
		self:ThrowKunai( tr.Entity )
		dmginfo:SetDamage( MAS.Ability.ThrowKn.Damage * self.ModDmg )
		
		if ( SERVER && IsValid( tr.Entity ) && ( tr.Entity:IsNPC() || tr.Entity:IsPlayer() || tr.Entity:Health() > 0 ) ) then
			
			local randPitch = math.random( 70, 130 )
			tr.Entity:EmitSound( HitSound, 90, randPitch )
			
			if ( !IsValid( attacker ) ) then attacker = self end
			dmginfo:SetDamageType( DMG_GENERIC )
			dmginfo:SetDamageForce( self.Owner:GetForward() * 10500 )
			
			-- Set a static amount of damage
			tr.Entity:TakeDamageInfo( dmginfo )
			
			-- Set Charge & Hit
			self.Hit = true
			local charge = self:GetCharge() + dmginfo:GetDamage()/10 
			self:SetCharge( charge )
			self.HitTime = CurTime()
			
			-- Nullify bullet damage
			dmginfo:SetDamage( 0 )
			dmginfo:SetDamageType( DMG_FALL )
			dmginfo:SetInflictor( tr.Entity )
			dmginfo:SetAttacker( tr.Entity )
			
	
		end // end if Server & Entity
		
		end // end callback function
		
		self.Owner:FireBullets( Bullet )
		self.Owner:SetAnimation( PLAYER_ATTACK1 )
		
		if CLIENT then
			ply:EmitSound( SwingSound )
			 
			-- Hide World Model Client-side
			function self:DrawWorldModel() return false end
			timer.Simple( self.SwingDelay1 * self.ModDelay, function() 
				if ply:IsValid() and self:IsValid() then 
					function self:DrawWorldModel() self:DrawModel() end
				end 
			end)
			
		else -- if Server
			local randPitch = math.random( 110, 140 )
			ply:EmitSound( MAS.Ability.ThrowKn.SoundCast, 70, randPitch )
			
			self.Owner:DrawWorldModel( false )
			timer.Simple( self.SwingDelay1 * self.ModDelay, function() 
				if ply:IsValid() and self:IsValid() then 
					ply:DrawWorldModel( true ) 
					self:SetHoldType( "knife" )
				end 
			end)
		end
	
		self.Owner:LagCompensation( false )
		
	end // end Ability 1: Throw Kunai

end // end DealDamage Function

//// Throw Kunai ////
function SWEP:ThrowKunai( target )
	
	local ply	=	self.Owner
	local CD	=	self:GetA1_CD()
	
	if SERVER then
		if ply:IsValid() and ply:Alive() and CD > 0 then
			// Ply Effect
			
			if target:IsValid() and ( target:IsNPC() or target:IsPlayer() ) then
				
				//Effect
				local Origin = target:GetPos() + Vector(0,0,1)
				playEffect( Origin, target, 1, "bloodspray", 1, 5, 1 )
				local randPitch = math.random( 80, 100 )
				target:EmitSound( MAS.Ability.ThrowKn.SoundHit, 75, randPitch )
				target:EmitSound( MAS.Ability.ThrowKn.SoundCast, 70, 120 )
			
			end // end if target
		end // end if ply
	end // end If Server
	
end // end Throw Kunai Ability

//// Ninja Dash ////
function SWEP:NinjaDash( ply, self, Wep )
	
	local ply	=	ply or self.Owner
	local Wep 	=	Wep or ply:GetActiveWeapon()
	local CD	=	self:GetA2_CD()
	
	if ply:IsValid() and ply:Alive() and CD > 0 and self:GetA2_Active() then
	local Wep = ply:GetActiveWeapon()
		
		if Wep and Wep:GetClass() == "weapon_ninjaskunai" then
	
			-- Set Networked Values
			local speed = MAS.Ability.NinjaDash.DashSpeed
			local maxDist = MAS.Ability.NinjaDash.DashDistance
			local legs = MAS.Ability.NinjaDash.Legs
			if legs then 
				ply:ConCommand( "cl_legs 0" )
			end
			
			local hullTrace = util.TraceHull({
				start = ply:EyePos(),
				endpos = ply:EyePos() + ply:EyeAngles():Forward() * maxDist,
				filter = ply,
				mins = Vector(-16, -16, 0),
				maxs = Vector(16, 16, 9)
			})
			
			local groundTrace = util.TraceEntity({
				start = hullTrace.HitPos + Vector(0, 0, 1),
				endpos = hullTrace.HitPos - ( ply:EyePos() - ply:GetPos() ),
				filter = ply
			}, ply)
		
			local endPos = groundTrace.HitPos
			local startPos = ply:GetPos()
			local dashDist = (endPos - ply:EyePos()):Length()
			local moveTime = dashDist / speed -- Move Time
			local dashDir = ( endPos - ply:GetPos() ):GetNormalized() -- Direction
			local startTime = CurTime() -- Start Time
			
			local randPitch = math.random( 90, 110 )
			ply:EmitSound( MAS.Ability.NinjaDash.SoundCast, 70, randPitch )
		
			local CD = 1 -- in seconds
		
			hook.Add( "Move", "MAS.Ability.NinjaDash.Cast" .. ply:EntIndex(), function( ent, data )
				if ent != ply then return end
				if ply:IsValid() and Wep:IsValid() and self:GetA2_Active() then
					// Weapon Check
					if ( Wep:GetClass() != "weapon_ninjaskunai" ) then
						self:SetA2_Active( false )
						return
					end
					// Try to convince the player to crouch
						data:SetButtons( bit.bor( data:GetButtons(), IN_DUCK ) )
					
					// Define Variables
						local timeElapsed = CurTime() - startTime
						local NewDir = dashDir * math.min( ( math.min( timeElapsed, moveTime ) * speed ), dashDist )
						local NewPos = startPos + NewDir
					
					// Set Origin based on Time
						data:SetOrigin( NewPos )
						data:SetVelocity( vector_origin )
					
					// Finish Movement
						if ( timeElapsed >= moveTime ) then
							self:SetIsCasting( false )
							self:SetA2_Active( false )
							data:SetVelocity( NewDir * 0.5 )
							data:SetOrigin( endPos )
							hook.Remove( "Move", "MAS.Ability.NinjaDash.Cast" .. ply:EntIndex() )
						end;
					
			
					return true -- Dont Move the normal way!
				else // not valid or inactive
					hook.Remove( "Move", "MAS.Ability.NinjaDash.Cast" .. ply:EntIndex() )
				end
			end) // end Move Hook
			
			-- Negate fall damage	
			hook.Add("EntityTakeDamage", "MAS.Ability.NinjasKunai.OnTakeFallDamage" .. ply:EntIndex(), function( ent, DmgInfo )
			
				if ent == ply then
					if Wep:IsValid() then 
						if DmgInfo:IsFallDamage() then 
							DmgInfo:SetDamage( 0 ) 
							timer.Remove( "MAS.Ability.NinjasKunai.OnTakeFallDamage" .. ply:EntIndex() )
							hook.Remove( "EntityTakeDamage", "MAS.Ability.NinjasKunai.OnTakeFallDamage" .. ply:EntIndex() )
						end
					else 
						timer.Remove( "MAS.Ability.NinjasKunai.OnTakeFallDamage" .. ply:EntIndex() )
						hook.Remove( "EntityTakeDamage", "MAS.Ability.NinjasKunai.OnTakeFallDamage" .. ply:EntIndex() )
						return
					end
				end
			end)
			
			-- Remove fall damage negation 
			timer.Create( "MAS.Ability.NinjasKunai.OnTakeFallDamage" .. ply:EntIndex(), 3, 1, function()
				hook.Remove( "EntityTakeDamage", "MAS.Ability.NinjasKunai.OnTakeFallDamage" .. ply:EntIndex() )
				hook.Remove( "GetFallDamage", "MAS.Ability.NinjaDash.FallDamage" .. ply:EntIndex() )
			end )
			
			-- Countdown CD
			local CD = MAS.Ability.NinjaDash.Cooldown
			self:SetA2_CD( CD )
			local itCD = CD
			timer.Create( "MAS.Ability.NinjaDash.CD" .. ply:EntIndex() , 1, itCD, function()
				if IsValid(Wep) and IsValid(self) then
					CD = CD - 1
					self:SetA2_CD( CD )
				else
					timer.Remove( "MAS.Ability.NinjaDash.CD" .. ply:EntIndex() )
				end
			end)
		end // if Wep is Valid & Kunai
	end // end if ply
end // end Ninja Dash Ability

//// Concealment Ability ////
function SWEP:Concealment( ply, self, Wep )
	-- variable check
	local ply	=	ply or self.Owner
	local Wep	=	Wep or ply:GetWeapon( "weapon_ninjaskunai" )
	
	if SERVER and ply:IsValid() and ply:Alive() and Wep:IsValid() then 
		local CD	=	self:GetA3_CD()
		if CD == MAS.Ability.Conceal.Cooldown + 2 then
			self:SetIsCasting( false )
			self:SetCastOnCrouch( false )
			self:SetA3_CD( MAS.Ability.Conceal.Cooldown )
			ply:EmitSound( MAS.Ability.Conceal.SoundCast, 70, 100 )
			ply:SetNoDraw( true )
			ply:SetRenderMode(RENDERMODE_TRANSALPHA)
			ply:SetColor( Color(0, 0, 0, 0 ) )
			function self:DrawWorldModel() return false end
			ply:DrawWorldModel( false )
			ply:SetNoTarget( true )
			
			hook.Add("EntityTakeDamage", "MAS.Ability.Concealment.Hidden" .. ply:EntIndex(), function( ent, DmgInfo )
			
				if ent == ply then
					if Wep:IsValid() then 
						if DmgInfo:IsFallDamage() then DmgInfo:ScaleDamage( 0.5 ) return end
						if self:GetA3_Active() == true then
							self:ConcealmentUnHide( ply, self, Wep )
							hook.Remove( "EntityTakeDamage", "MAS.Ability.Concealment.Hidden" .. ply:EntIndex() )
						else
							hook.Remove( "EntityTakeDamage", "MAS.Ability.Concealment.Hidden" .. ply:EntIndex() )
						end
					else -- !Wep 
						// Return to normal
						ply:EmitSound( MAS.Ability.Conceal.SoundEnd, 70, 100 )
						ply:SetNoDraw( false )
						ply:DrawShadow()
						ply:SetRenderMode(RENDERMODE_NORMAL)
						ply:SetColor( Color( 255, 255, 255, 255 ) )
						function self:DrawWorldModel() return self:DrawModel() end
						ply:DrawWorldModel( true )
						ply:SetNoTarget( false )
						hook.Remove( "EntityTakeDamage", "MAS.Ability.Concealment.Hidden" .. ply:EntIndex() )
						return
					end
				end // end ent == ply
			end)
			
			local uhDur = MAS.Ability.Conceal.Duration -- time in seconds
			local uhDel = 0.2 -- Delay desired
			local uhIt = uhDur / uhDel -- number of iterations desired
			timer.Create( "MAS.Ability.Concealment.UnHide" .. ply:EntIndex(), uhDel, uhIt, function()
				uhIt = uhIt - 1
				if ply:IsValid() and ply:Alive() then
					if Wep:IsValid() then
						if self:GetA3_Active() then
							
							// Check for people around you!
							local canCast = true
							local targets = ents.FindInSphere( ply:GetPos(), 150 )
							for k, v in ipairs( targets ) do
								if ( ( v:IsPlayer() and !ply ) or v:IsNPC() ) then
									canCast = false
									self:ConcealmentUnHide( ply, self, Wep )
									timer.Remove( "MAS.Ability.Concealment.UnHide" .. ply:EntIndex() )
									break
								end
							end
							
							// Check if timer done
							if uhIt == 0 then
								self:ConcealmentUnHide( ply, self, Wep )
							end
						else // !A3Active, remove
							timer.Remove( "MAS.Ability.Concealment.UnHide" .. ply:EntIndex() )
						end // end A3 not Active
							
					else // else !Wep
						// Return to normal
						ply:EmitSound( MAS.Ability.Conceal.SoundEnd, 70, 100 )
						ply:SetNoDraw( false )
						ply:SetRenderMode(RENDERMODE_NORMAL)
						ply:SetColor( Color( 255, 255, 255, 255 ) )
						function self:DrawWorldModel() return self:DrawModel() end
						ply:DrawWorldModel( true )
						ply:SetNoTarget( false )
						timer.Remove( "MAS.Ability.Concealment.UnHide" .. ply:EntIndex() )
						hook.Remove( "EntityTakeDamage", "MAS.Ability.Concealment.Hidden" .. ply:EntIndex() )
					end
				end // end if Ply check
				
			end ) // end Timer
			ply:ChatPrint( "[MAS] Ninja's Kunai: You are now concealed." )
		end // end if CD = CD + 2 
	end // end If Server and Checks
	
end // end Concealment Ability

function SWEP:ConcealmentUnHide( ply, self, Wep )
	-- variable check
	local ply	=	ply or self.Owner
	local Wep	=	Wep or ply:GetWeapon( "weapon_ninjaskunai" )
	
	if SERVER and ply:IsValid() and ply:Alive() then 
		if Wep:IsValid() and self:GetA3_Active() then
			self:SetA3_Active( false )
			function self:DrawWorldModel() return self:DrawModel() end
		
			-- Countdown CD
			local CD = MAS.Ability.Conceal.Cooldown
			self:SetA3_CD( CD )
			local itCD = CD
			timer.Create( "MAS.Ability.Concealment.CD" .. ply:EntIndex() , 1, itCD, function()
				if Wep:IsValid() then
					CD = CD - 1
					if CD < 1 then CD = 0 end
					self:SetA3_CD( CD )
				else
					timer.Remove( "MAS.Ability.Concealment.CD" .. ply:EntIndex() )
				end
			end)
		end
		
		// Return to normal
		ply:EmitSound( MAS.Ability.Conceal.SoundEnd, 70, 100 )
		ply:SetNoDraw( false )
		ply:ChatPrint( "[MAS] Ninja's Kunai: You are no longer concealed." )
		ply:SetRenderMode(RENDERMODE_NORMAL)
		ply:SetColor( Color( 255, 255, 255, 255 ) )
		function self:DrawWorldModel() return self:DrawModel() end
		ply:DrawWorldModel( true )
		ply:SetNoTarget( false )
		hook.Remove( "EntityTakeDamage", "MAS.Ability.Concealment.Hidden" .. ply:EntIndex() )
	end // end SERVER & Checks
	
end
hook.Add( "PlayerDeath", "Dolboebstvo", function( ply, inflictor, attacker )
	if MAS and MAS.Ability then
	ply:EmitSound( MAS.Ability.Conceal.SoundEnd, 70, 100 )
			ply:SetNoDraw( false )
			ply:ChatPrint( "[MAS] Ninja's Kunai: You are no longer concealed." )
			ply:SetRenderMode(RENDERMODE_NORMAL)
			ply:SetColor( Color( 255, 255, 255, 255 ) )
			ply:DrawWorldModel( true )
			ply:SetNoTarget( false )
			hook.Remove( "EntityTakeDamage", "MAS.Ability.Concealment.Hidden" .. ply:EntIndex() )
	end
end )

///// ULTIMATE ABILITY /////
function SWEP:Substitution( ply )
	
	local ply = ply or self.Owner
	
	local Charge = self:GetCharge()
	
	if Charge >= 100 then -- ULTIMATE Ability
		if !self:GetIsCasting() and ply:IsValid() and ply:Alive() then
			// Prevent other abilities
			self:SetAU_Active( true )
			self:SetIsCasting( true )
			
			// Define variables
			local timeset	 			= 	0
			local vel 					= 	ply:GetVelocity()
			local vm 					= 	ply:GetViewModel()
			local anim					=	"kunai_ultimate"
			local speed 				= 	GetConVarNumber( "sv_defaultdeployspeed" ) or 1
			local Duration 				= 	vm:SequenceDuration() / speed
			local Wep					=	ply:GetActiveWeapon()
			--local Origin 				= 	ply:GetPos() + Vector( 0, 0, 1 )
			--local Origin2 				= 	ply:GetShootPos()
			
			// ViewModel + Prevent Attacks
			vm:SendViewModelMatchingSequence( vm:LookupSequence( anim ) )
			self:UpdateNextIdle( ply )
			Wep:SetNextPrimaryFire( CurTime() + Duration )
			Wep:SetNextSecondaryFire( CurTime() + Duration )
			
			// Initial Action & FX
			self:SetCharge( 0 )
			MAS.Ability.Substitution.MarkedPos = ply:GetPos()
			MAS.Ability.Substitution.MarkedAngles = ply:EyeAngles()
			ply:EmitSound( MAS.Ability.Substitution.SoundCast )
			
			-- Fn for Returning to Pos
			local function Substitute( victim, death )
				hook.Add( "Tick", "MAS.Ability.Substitution.OnTakeDamage" .. ply:EntIndex(), function()
					if victim:IsValid() and victim:Alive() then
						
						-- FX
						local Origin 		= 	victim:GetPos() + Vector( 0, 0, 10 )
						playEffect( Origin, victim, 3, "WheelDust", 5, 4, 10 )
						victim:EmitSound( MAS.Ability.Substitution.SoundHit, 80, 100 )
						
						-- Ability
						hook.Remove( "Tick", "MAS.Ability.Substitution.OnTakeDamage" .. ply:EntIndex() )
						victim:SetPos( MAS.Ability.Substitution.MarkedPos )
						victim:SetEyeAngles( MAS.Ability.Substitution.MarkedAngles )
						victim:SetVelocity( -victim:GetVelocity() ) -- negate velocity
						MAS.Ability.Substitution.MarkedPos 		= 	vector_origin
						MAS.Ability.Substitution.MarkedAngles 	= 	angle_zero
						if Wep:IsValid() then
							victim:EmitSound( MAS.Ability.Substitution.SoundEnd, 60, 100 )
							self:SetAU_Active( false )
						end
						
					else // ply valid & alive
						hook.Remove( "Tick", "MAS.Ability.Substitution.OnTakeDamage" .. ply:EntIndex() )
					end
				end )
			end
			
			-- Negate any damage	
			hook.Add("EntityTakeDamage", "MAS.Ability.Substitution.OnTakeDamage" .. ply:EntIndex(), function( ent, DmgInfo )
				if ent == ply then
					if Wep:IsValid() then 
						if DmgInfo:GetDamage() > 0 then
							DmgInfo:SetDamage( 0 )
							if self:GetA2_Active() then
								self:SetA2_Active( false )
								self:SetIsCasting( false )
								hook.Remove( "Move", "MAS.Ability.NinjaDash.Cast" .. ply:EntIndex() )
							end
							hook.Remove( "EntityTakeDamage", "MAS.Ability.Substitution.OnTakeDamage" .. ply:EntIndex() )
							hook.Remove( "PlayerDeath", "MAS.Ability.Substitution.OnDeath" .. ply:EntIndex() )
							Substitute( ply )
							return true
						end
					else  -- !Wep
						hook.Remove( "EntityTakeDamage", "MAS.Ability.Substitution.OnTakeDamage" .. ply:EntIndex() )
						hook.Remove( "PlayerDeath", "MAS.Ability.Substitution.OnDeath" .. ply:EntIndex() )
						return
					end
				end // end if Ent == Ply
			end) // end Hook: Entity Take Damage -- Subst
			
			-- Warn of Death
			hook.Add( "PlayerDeath", "MAS.Ability.Substitution.OnDeath" .. ply:EntIndex(), function( ent, infl, atk )
				if ent == ply and ent != atk then
					ply:ChatPrint( " " )
					ply:ChatPrint( "[MAS] Ninja's Kunai: That special attack managed to hit you through your substitution. Avoid getting hit by any more of those." )
					local time = 3
					timer.Simple( time, function()
						if ply:IsValid() and timer.Exists( "MAS.Ability.Substitution.Death" .. ply:EntIndex() ) then
							ply:ChatPrint( " " )
							ply:ChatPrint( "[MAS] Ninja's Kunai: If you get another Ninja's Kunai in 30 seconds you will receive an 80% recharge." )
						end
					end)
					local iterations = 0
					local maxIt = 30 + time
					timer.Create( "MAS.Ability.Substitution.Death" .. ply:EntIndex(), 1, maxIt, function()
						iterations = iterations + 1
						if ply:IsValid() and ply:Alive() then -- if Ply
							local SWEP = ply:GetWeapon( "weapon_ninjaskunai" )
							if SWEP:IsValid() then
								SWEP:GetTable():SetCharge( 80 )
								timer.Remove( "MAS.Ability.Substitution.Death" .. ply:EntIndex() )
								hook.Remove(  "PlayerDeath", "MAS.Ability.Substitution.OnDeath" .. ply:EntIndex() )
								ply:ChatPrint( " " )
								ply:ChatPrint( "[MAS] Ninja's Kunai: You received an 80% recharge." )
							elseif iterations >= maxIt then -- no SWEP & iteration up
								timer.Remove( "MAS.Ability.Substitution.Death" .. ply:EntIndex() )
								hook.Remove(  "PlayerDeath", "MAS.Ability.Substitution.OnDeath" .. ply:EntIndex() )
							end
						elseif iterations >= maxIt then -- no Ply & iteration up
							timer.Remove( "MAS.Ability.Substitution.Death" .. ply:EntIndex() )
							hook.Remove(  "PlayerDeath", "MAS.Ability.Substitution.OnDeath" .. ply:EntIndex() )
						end
					end ) // end Death & Regain timer
				end // end if Ent == Ply
			end ) // end Death Hook
			
			-- Remove damage & kill negation
			
			
			// Ability Cast
			timer.Simple( Duration, function() 
				if Wep:IsValid() then
					-- Deactivate cast lock, not ability
					self:SetIsCasting( false )
				end
			end ) // end Deactivation
			
			
		end // end if Is Casting
	else // end if charge 100%
		if Maranzos_AbilitySWEPs.BMS_InfUlt then
			self:SetCharge( 100 )
		end
	end
	return true
end

// Dropped Weapon
function SWEP:OnDrop()

	self:Remove() -- You can't drop a soul

end

// Holster
function SWEP:Holster()
	local ply = self.Owner
	-- Prevent abilities from working if weapon switched to prevent abuse
	if SERVER and ( self:GetA2_Active() or self:GetA3_Active() or self:GetAU_Active() ) then
		self.Owner:ChatPrint( "[MAS] Ninja's Kunai: Ability Canceled - Weapon not active")
	end
	reloadToggle = false
	self:SetCastOnCrouch( false )
	self:SetA2_Active( false )
	if self:GetA2_CD() > MAS.Ability.NinjaDash.Cooldown then self:SetA2_CD( 0 ) end
	if self:GetA3_Active() and self:GetA3_CD() <= MAS.Ability.Conceal.Cooldown then self:ConcealmentUnHide( ply, self ) else -- UnHide if Hidden
		self:SetA3_Active( false )
		if self:GetA3_CD() > MAS.Ability.Conceal.Cooldown then self:SetA3_CD( 0 ) end
	end
	self:SetAU_Active( false )
	hook.Remove( "EntityTakeDamage", "MAS.Ability.Substitution.OnTakeDamage" .. ply:EntIndex() )
	hook.Remove( "PlayerDeath", "MAS.Ability.Substitution.OnTakeDamage" .. ply:EntIndex() )
	self:SetIsCasting( false )
	return true
	
end

// Weapon Info
function SWEP:PrintWeaponInfo(x, y, alpha)

	if (self.DrawWeaponInfoBox == false) then return end

	if (self.InfoMarkup == nil) then
		local str
		local title_color = "<color = 255, 200, 0, 255>"
		local hl_color = "<color = 247, 168, 32, 200>"
		local text_color = "<color = 255, 255, 255, 200>"
		
		str = "<font=DermaDefaultBold>"
		if (self.Author != "") then str = str .. title_color .. "Author:</color>\t" .. text_color .. self.Author .. "</color>\n" end
		if (self.Contact != "") then str = str .. title_color .. "Contact:</color>\t" .. text_color .. self.Contact .. "</color>\n\n" end
		if (self.Purpose != "") then str = str .. title_color .. "Purpose:</color>\n" .. text_color .. self.Purpose .. "</color>\n\n" end

		-- Set the instructions
		if (self.Instructions != "") then str = str .. title_color .. "Instructions:</color>\n"
			local myInstr = self.Instr
			for i = 1, table.Count(myInstr) do
				local HL = myInstr["H"..i]
				local TL = myInstr[""..i]
				if ( HL != nil ) then
					str = str .. hl_color .. HL .. text_color .. TL .. "\n"
					table.remove( myInstr, i )
					table.remove( myInstr, tostring(i) )
				elseif TL != nil then -- If No Headline, then Check Text Line
					str = str .. text_color .. TL .. "\n"
				end
			end
		end // end of Instructions
		str = str .. "</font>"
		
		self.InfoMarkup = markup.Parse(str, 250)
	end
	
	local outerColor 	= 	Color( 0, 100, 165, 255 )
	local innerColor 	= 	Color( 0, 130, 200, 255 )
	
	surface.SetDrawColor(outerColor)
	surface.SetTexture(self.SpeechBubbleLid)
	surface.DrawTexturedRect(x, y - 69.5, 128, 64) 
	draw.RoundedBox(8, x - 5, y - 6, 260, self.InfoMarkup:GetHeight() + 18, outerColor)
	draw.RoundedBox(8, x - 2, y - 3, 254, self.InfoMarkup:GetHeight() + 12, innerColor)
	
	self.InfoMarkup:Draw(x + 5, y + 5, nil, nil, alpha)
end

// Deployed Weapon
function SWEP:Deploy()
	
	local speed = GetConVarNumber( "sv_defaultdeployspeed" ) or 1
	local vm = self.Owner:GetViewModel()
	vm:SetPlaybackRate( speed )
	vm:SendViewModelMatchingSequence( vm:LookupSequence( "kunai_draw" ) )
	local dur = vm:SequenceDuration() / speed
	self:SetNextPrimaryFire( CurTime() + dur )
	self:SetNextSecondaryFire( CurTime() + dur )
	self:UpdateNextIdle()

	if ( SERVER ) then
		-- do nothing
	else // Client
		self.DrawCrosshair		= 	GetConVar( "cl_mas_crosshairon" ):GetBool()
	end
	
	return true

end // end Fn Deploy

// Weapons Think Too
function SWEP:Think()
	
	local ply = self.Owner
	local vm = self.Owner:GetViewModel()
	local curtime = CurTime()
	local idletime = self:GetNextIdle()
	
	// Singleplayer Button Check
	if CLIENT and game.SinglePlayer() then
		
		if !vgui.CursorVisible() and !vgui.GetKeyboardFocus() and self.KB then
		
			local Wep = ply:GetActiveWeapon()
			if !( ply:IsValid() and ply:Alive() and Wep:IsValid() and Wep:GetClass() == "weapon_ninjaskunai" ) then return end
			
			for btn, ability in pairs( self.KB["Btn"] ) do
				if ability != 1 and ability != 2 then
					if ( input.IsButtonDown( btn ) ) and !table.HasValue( keysDown, btn ) then
						table.insert( keysDown, btn )
						
						if ( ply:IsValid() and ply:Alive() and Wep:IsValid() and Wep:GetClass() == "weapon_ninjaskunai" ) then
							-- AutoAttack & Ability #1:Throw Kunai are bound to +attack & +attack2 by default & won't trigger anything here.
							
							if ability == ASWEP_Ability_NinjaDash then 
							// Abil 2: Ninja Dash
								local CD = MAS.Ability.NinjaDash.Cooldown
								if ( self:GetA2_Active() or self:GetIsCasting() or self:GetA2_CD() != 0 ) then 
									return 
								end
								self:SetIsCasting( true )
								
								net.Start( "Maranzo_AbilitySWEP_ninjaskunai_Cast" )
								net.WriteInt( ability, 4 )
								net.WriteEntity( self )
								net.SendToServer()
								
							elseif ability == ASWEP_Ability_Concealment then 
							// Abil 3: Concealment
								local CD = MAS.Ability.Conceal.Cooldown
								if ( !( self:GetA3_Active() or self:GetA3_CD() == CD + 2 ) and ( self:GetIsCasting() or self:GetA3_CD() != 0 ) ) then 
									return 
								end
								self:SetIsCasting( true )
								
								net.Start( "Maranzo_AbilitySWEP_ninjaskunai_Cast" )
								net.WriteInt( ability, 4 )
								net.WriteEntity( self )
								net.SendToServer()
								
							elseif ability == ASWEP_Ability_Substitution then 
							// Ultimate: Substitution
								if ( self:GetIsCasting() or self:GetAU_Active() ) then 
									return -- do nothing
								end
								
								self:SetIsCasting( true )
								
								net.Start( "Maranzo_AbilitySWEP_ninjaskunai_Cast" )
								net.WriteInt( ability, 4 )
								net.WriteEntity( self )
								net.SendToServer()
								
							end // end Key Check
							
							if ability == ASWEP_Ability_Select then
							// Ability Selection
								self:DrawAbilitySelection()
								
							end // end Key check, cursor visible OK <-- Not set currently for SP
							
						end // end if ply & alive & weapon
						
					elseif !( input.IsButtonDown( btn ) ) and table.HasValue( keysDown, btn ) then
						table.RemoveByValue( keysDown, btn )
					end // end Btn Release
				end // end Exclude AA & A1
			end // end For Btn check
		end // end  if !Mouse Visible
	end // end SinglePlayer
	
	if ( idletime > 0 && curtime > idletime ) then
		
		--vm:SendViewModelMatchingSequence( vm:LookupSequence( "kunai_idle0" .. math.random( 1, 2 ) ) )
		vm:SendViewModelMatchingSequence( vm:SelectWeightedSequence( ACT_VM_IDLE ) )
		self:UpdateNextIdle()
	
	end

	local meleetime = self:GetNextMeleeAttack()
	if ( meleetime > 0 && curtime > meleetime ) then

		self:SetNextMeleeAttack( 0 )
		self:SetAA_Active( false )
		
		-- If Ability 1: Throw Kunai
		if ( self:GetA1_Active() ) then 
			
			-- Do Throw Kunai
			self:DealDamage( ASWEP_Ability_ThrowKunai )
			self:SetA1_Active( false )
			
		else // end if an ability
			self:DealDamage()
		end // end regular attack

	end // end Melee Time
	
	// Ability 3: Concealment Checks
	if SERVER then
		local A3Active = self:GetA3_Active()
		if A3Active then
			local isCasting = self:GetIsCasting()
			local CastOnCrouch = self:GetCastOnCrouch()
			if CastOnCrouch and isCasting then
				if ply:Crouching() then
					local canCast = true
					local targets = ents.FindInSphere( ply:GetPos(), 150 )
					for k, v in ipairs( targets ) do
						if ( ( v:IsPlayer() and !ply ) or v:IsNPC() ) then
							canCast = false
							ply:ChatPrint( "[MAS] Ninja's Kunai: You are too close to someone." )
							self:SetCastOnCrouch( false )
							self:SetIsCasting( false )
							self:SetA3_Active( false )
							self:SetA3_CD( 0 )
							break
						end
					end
					if canCast then
						self:SetCastOnCrouch( false )
						self:SetIsCasting( false )
						local Wep = ply:GetActiveWeapon()
						self:Concealment( ply, self, Wep )
					end
				end
			// !CastOnCrouch, check if standing or ply casts an ability
			elseif !ply:Crouching() then
				// Deactivate & Cooldown
				self:ConcealmentUnHide( ply, self, Wep )
			end
		end // end A3Active
	end
	
end // end SWEP think


----------------------------------------------------------------------
---- Net Usage

if (SERVER) then
	
	util.AddNetworkString( "Maranzo_AbilitySWEP_ninjaskunai_Cast" )
	util.AddNetworkString( "Maranzo_AbilitySWEP_ninjaskunai_CastCancel" )

	// Run the real ability server-side
	net.Receive( "Maranzo_AbilitySWEP_ninjaskunai_Cast", function( len, ply )
		
		if ( IsValid( ply ) and ply:Alive() and ply:GetActiveWeapon():GetClass() == "weapon_ninjaskunai" ) then
			local ability = net.ReadInt( 4 )
			local Wep = ply:GetActiveWeapon()
			local SWEP = net.ReadEntity()

			if not IsValid(SWEP) or not SWEP.GetA2_Active then return end
				
			if ability == ASWEP_Ability_NinjaDash then 
				if ( !SWEP:GetA2_Active() and !SWEP:GetIsCasting() and SWEP:GetA2_CD() == 0 ) then 
					local CD = MAS.Ability.NinjaDash.Cooldown
					SWEP:SetA2_Active( true )
					SWEP:SetA2_CD( CD + 2 ) -- +2 to alert the think
					SWEP:SetIsCasting( true )
					SWEP:NinjaDash( ply, SWEP, Wep )
					
				end // end Ninja Dash
				
			elseif ability == ASWEP_Ability_Concealment then 
				local CD = MAS.Ability.Conceal.Cooldown
				if ( !SWEP:GetA3_Active() ) then
					if ( !SWEP:GetIsCasting() and SWEP:GetA3_CD() == 0 ) then
						-- Prevent more Abilities
						SWEP:SetA3_Active( true )
						SWEP:SetIsCasting( true )
						SWEP:SetCastOnCrouch( true )
						
						-- Cooldown Active
						SWEP:SetA3_CD( CD + 2 )
						// Do not Timer Cooldown until it has been cast via Think
						
					end // end if !Casting and CD == 0
					
				elseif SWEP:GetA3_CD() == CD + 2 then // if it IS active & CD + 2
					SWEP:SetA3_Active( false )
					SWEP:SetIsCasting( false )
					SWEP:SetCastOnCrouch( false )
					SWEP:SetA3_CD( 0 )
				end // end Concealment
				
			elseif ability == ASWEP_Ability_Substitution then 
				
				if ( !SWEP:GetAU_Active() and !SWEP:GetIsCasting() ) then
					SWEP:Substitution( ply )
				end
				
			end
			
		end // end If Ply & Weapon
		
	end ) // end Net Receive
	
end

if (CLIENT) then

	net.Receive( "Maranzo_AbilitySWEP_ninjaskunai_Cast", function( len, ply )
		
		local ply = LocalPlayer()
		local Wep = ply:GetActiveWeapon()
		local SWEP = Wep:GetTable()
		
		if ( IsValid( ply ) and ply:Alive() and ply:GetActiveWeapon():GetClass() == "weapon_ninjaskunai" ) then
			local ability = net.ReadInt( 4 )
			
			if ability == ASWEP_Ability_NinjaDash then 
				
				chat.AddText( "No Legs!" )
				local started = net.ReadBool()
				local legs = "cl_legs "
				local legsNum = started and 0 or MAS.Ability.NinjaDash.LegsNum
				ply:ConCommand( legs .. legsNum )
				
			elseif ability == ASWEP_Ability_Concealment then 
				-- Do nothing right now
				
			elseif ability == ASWEP_Ability_Substitution then 
				-- Do nothing
				
			end
			
		end // end If Ply & Weapon
		
	end ) // end Net Receive
	
	
	
end
--PATH addons/__main/lua/weapons/weapon_vape_custom.lua:
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
--PATH addons/__main/lua/weapons/weapon_vape_helium.lua:
-- weapon_vape_helium.lua
-- Defines a vape which makes the player float

-- Vape SWEP by Swamp Onions - http://steamcommunity.com/id/swamponions/

if CLIENT then
	include('weapon_vape/cl_init.lua')
else
	include('weapon_vape/shared.lua')
end

SWEP.Instructions = "LMB: Rip Fat Clouds\n (Hold and release)\nRMB & Reload: Play Sounds\n\nHelium-infused juice has a levitating effect when it enters the bloodstream."

SWEP.PrintName = "Helium Vape"

SWEP.VapeID = 4

--gets overridden
SWEP.SoundPitchMod = 60

SWEP.VapeAccentColor = Vector(0.9,1,0)
SWEP.VapeTankColor = Vector(0.2,0.3,0.5)

hook.Add( "HUDPaint", "VapeHeliumBar", function()
	if vapeHelium or 0 > 0 then
		local alpha = math.min(1, vapeHelium/10)
		draw.RoundedBox( 8, (ScrW()*0.5)-64, ScrH()-48, 128, 32, Color( 0, 0, 0, 128*alpha ) )
		draw.RoundedBox( 0, (ScrW()*0.5)-58, ScrH()-42, 1.16*vapeHelium, 20, Color( 0, 100, 200, 255*alpha ) )
		draw.DrawText("He", "DermaLarge", (ScrW()*0.5), ScrH()-84, Color( 255, 255, 255, 255*alpha ), TEXT_ALIGN_CENTER )
	end
end )
--PATH addons/__main/lua/weapons/weapon_vape/shared.lua:
-- weapon_vape/shared.lua
-- Defines common shared code/defaults for Vape SWEP

-- Vape SWEP by Swamp Onions - http://steamcommunity.com/id/swamponions/

SWEP.Author = "Swamp Onions"

SWEP.Instructions = "LMB: Rip Fat Clouds\n (Hold and release)\nRMB & Reload: Play Sounds\n\nVape Nation!"

SWEP.PrintName = "Vape"

SWEP.IconLetter	= "V"
SWEP.Category = "Vapes"
SWEP.Slot = 1
SWEP.SlotPos = 0

SWEP.ViewModelFOV = 62 --default

SWEP.WepSelectIcon = surface and surface.GetTextureID("vape_icon")
SWEP.BounceWeaponIcon = false

SWEP.ViewModel = "models/swamponions/vape.mdl"
SWEP.WorldModel = "models/swamponions/vape.mdl"
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Primary.Clipsize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"

SWEP.Secondary.Clipsize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.DrawAmmo = false
SWEP.HoldType = "slam"

SWEP.VapeID = 1

function SWEP:Deploy()
	self:SetHoldType("slam")
end

function SWEP:PrimaryAttack()
	if SERVER then
		VapeUpdate(self.Owner, self.VapeID)
	end
	self.Weapon:SetNextPrimaryFire(CurTime() + 0.1)
end

function SWEP:SecondaryAttack()
	if GetConVar("vape_block_sounds"):GetBool() then return end
	
	local pitch = 100 + (self.SoundPitchMod or 0) + (self.Owner:Crouching() and 40 or 0)
	self:EmitSound("vapegogreen.wav", 80, pitch + math.Rand(-5,5))
	if SERVER then
		net.Start("VapeTalking")
		net.WriteEntity(self.Owner)
		net.WriteFloat(CurTime() + (0.6*100/pitch))
		net.Broadcast()
	end
end

function SWEP:Reload()
	if GetConVar("vape_block_sounds"):GetBool() then return end

	if self.reloading then return end
	self.reloading=true
	timer.Simple(0.5, function() self.reloading=false end)
	local pitch = 100 + (self.SoundPitchMod or 0) + (self.Owner:Crouching() and 40 or 0)
	self:EmitSound("vapenaysh.wav", 80, pitch + math.Rand(-5,5))
	if SERVER then
		net.Start("VapeTalking")
		net.WriteEntity(self.Owner)
		net.WriteFloat(CurTime() + (2.2*100/pitch))
		net.Broadcast()
	end
end

function SWEP:Holster()
	if SERVER and IsValid(self.Owner) then
		ReleaseVape(self.Owner)
	end
	return true
end

SWEP.OnDrop = SWEP.Holster
SWEP.OnRemove = SWEP.Holster
--PATH addons/_avatar/lua/weapons/weapon_water_bending.lua:
SWEP.Category = "Avatar"
SWEP.PrintName = "Water Bending"
SWEP.Author = "Kilburn, robotboy655, MaxOfS2D, Tenrys & Kurome76" -- changing this will void your support
SWEP.Purpose = "Bend Water."
SWEP.Slot = 1
SWEP.SlotPos = 10
SWEP.Spawnable = true
SWEP.ViewModel = Model( "models/weapons/c_arms.mdl" )
SWEP.WorldModel = ""
SWEP.ViewModelFOV = 54
SWEP.UseHands = true
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"
SWEP.DrawAmmo = false
local SwingSound = Sound( "WeaponFrag.Throw" )
function SWEP:Initialize()
	self:SetHoldType( "fist" )
end

function SWEP:SetupDataTables()
	self:NetworkVar( "Float", 0, "NextMeleeAttack" )
	self:NetworkVar( "Float", 1, "NextIdle" )
end

function SWEP:GetViewModelPosition( pos, ang )
	--this is always applied
	local DefPos = Vector( 0, 0, -1 )
	local DefAng = Vector( 0, 0, 0 )
	if DefAng then
		ang = ang * 1
		ang:RotateAroundAxis( ang:Right(), DefAng.x )
		ang:RotateAroundAxis( ang:Up(), DefAng.y )
		ang:RotateAroundAxis( ang:Forward(), DefAng.z )
	end

	if DefPos then
		local Right = ang:Right()
		local Up = ang:Up()
		local Forward = ang:Forward()
		pos = pos + DefPos.x * Right
		pos = pos + DefPos.y * Forward
		pos = pos + DefPos.z * Up
	end
	return pos, ang
end

function SWEP:UpdateNextIdle()
	local vm = self:GetOwner():GetViewModel()
	self:SetNextIdle( CurTime() + vm:SequenceDuration() / vm:GetPlaybackRate() )
end

function SWEP:PrimaryAttack()
	self:GetOwner():SetAnimation( PLAYER_ATTACK1 )
	local anim = "fists_left"
	if math.random() < 0.5 then anim = "fists_right" end
	local vm = self:GetOwner():GetViewModel()
	vm:SendViewModelMatchingSequence( vm:LookupSequence( anim ) )
	self:EmitSound( SwingSound )
	self:UpdateNextIdle()
	self:SetNextMeleeAttack( CurTime() + 0.2 )
	self:SetNextPrimaryFire( CurTime() + 0.9 )
	self:SetNextSecondaryFire( CurTime() + 0.9 )
end

function SWEP:SecondaryAttack()
	self:GetOwner():SetAnimation( PLAYER_ATTACK1 )
	local vm = self:GetOwner():GetViewModel()
	vm:SendViewModelMatchingSequence( vm:LookupSequence( "fists_uppercut" ) )
	self:EmitSound( SwingSound )
	local srcpos = self:GetOwner():GetShootPos() + self:GetOwner():GetForward() * 64
	local tr = util.TraceLine( {
		start = srcpos,
		endpos = srcpos + vector_up * -110,
		filter = self:GetOwner()
	} )

	if tr.Hit then
		local effectdata = EffectData()
		effectdata:SetOrigin( tr.HitPos )
		effectdata:SetScale( 10 )
		util.Effect( "watersplash", effectdata )
		if SERVER then
			local rand = math.random( 1, 3 )
			for _ = 0, 6 do
				local icicle = ents.Create( "prop_physics" )
				icicle:SetModel( "models/sprops/misc/cones/size_0/cone_3x48.mdl" )
				icicle:SetMaterial( "models/player/shared/ice_player" )
				icicle:SetPos( tr.HitPos + tr.HitNormal * 16 + VectorRand() * 20 )
				icicle:SetColor( Color( 255, 255, 255, math.random( 150, 255 ) ) )
				icicle:SetRenderMode( RENDERMODE_TRANSCOLOR )
				icicle:SetCollisionGroup( COLLISION_GROUP_INTERACTIVE_DEBRIS )
				--icicle:SetParent(ply)
				icicle:Spawn()
				icicle:Activate()
				icicle.DoNotDuplicate = true
				icicle:SetPhysicsAttacker( self:GetOwner(), 5 )
				icicle:SetOwner( self:GetOwner() )
				icicle:Fire( "kill", "", 5 )
				icicle:EmitSound( "weapons/icicle_freeze_victim_01.wav", 75, 100, 0.4 )
				icicle:AddCallback( "PhysicsCollide", function( ent, data )
					if data.Speed > 250 then
						if IsValid( data.HitEntity ) then
							local dmginfo = DamageInfo()
							dmginfo:SetAttacker( ent:GetPhysicsAttacker( 5 ) )
							dmginfo:SetInflictor( ent )
							dmginfo:SetDamage( 50 )
							dmginfo:SetDamageType( 5 )
							dmginfo:SetDamageForce( data.OurOldVelocity )
							data.HitEntity:TakeDamageInfo( dmginfo )
						end

						local effectdata = EffectData()
						effectdata:SetOrigin( data.HitPos )
						util.Effect( "GlassImpact", effectdata )
						ent:EmitSound( "weapons/icicle_melt_01.wav", 70, math.random( 95, 105 ) )
						ent:Fire( "kill", "", 0.2 )
					end
				end )

				local phys = icicle:GetPhysicsObject()
				if IsValid( phys ) then
					phys:SetMaterial( "glass" )
					phys:SetMass( 40 )
					phys:AddGameFlag( FVPHYSICS_HEAVY_OBJECT )
					phys:AddGameFlag( FVPHYSICS_DMG_SLICE )
					phys:SetVelocity( icicle:GetUp() * 240 + self:GetOwner():GetVelocity() )
					phys:EnableDrag( false )
					--phys:SetBuoyancyRatio(0)
				end

				timer.Simple( 0.35, function()
					if not IsValid( icicle ) then return end
					if not IsValid( self ) then return end
					local newang = icicle:GetAngles()
					newang:RotateAroundAxis( self:GetOwner():EyeAngles():Right(), -self:GetOwner():EyeAngles().p + 90 + 180 )
					icicle:SetAngles( newang )
					--icicle:SetAngles(self:GetOwner():EyeAngles())
				end )

				timer.Simple( 0.4, function()
					if not IsValid( icicle ) then return end
					if not IsValid( self ) then return end
					icicle:EmitSound( "weapons/icicle_hit_world_0" .. rand .. ".wav", 75, 100, 0.4 )
					local phys = icicle:GetPhysicsObject()
					if IsValid( phys ) then
						phys:SetVelocity( icicle:GetUp() * 3000 + vector_up * 100 )
						phys:SetAngleVelocity( self:GetUp() * 500 )
					end
				end )
			end

			timer.Simple( 0.27, function()
				if not IsValid( self ) then return end
				local anim = "fists_left"
				if math.random() < 0.5 then anim = "fists_right" end
				local vm = self:GetOwner():GetViewModel()
				vm:SendViewModelMatchingSequence( vm:LookupSequence( anim ) )
				self:GetOwner():SetAnimation( PLAYER_ATTACK1 )
			end )
		end
	end

	self:SetNextPrimaryFire( CurTime() + 0.9 )
	self:SetNextSecondaryFire( CurTime() + 0.9 )
end

function SWEP:DealDamage()
	local anim = self:GetSequenceName( self:GetOwner():GetViewModel():GetSequence() )
	if SERVER then
		self:GetOwner():EmitSound( "ambient/water/water_splash" .. math.random( 1, 3 ) .. ".wav" )
		local right = self:GetOwner():EyeAngles():Right()
		local scr = self:GetOwner():WorldSpaceCenter() + vector_up * 5 + right * -8
		if anim == "fists_right" then scr = self:GetOwner():WorldSpaceCenter() + vector_up * 5 + right * 8 end
		--if tr.Hit then
		local splash = ents.Create( "prop_dynamic" )
		splash:SetModel( "models/blackout.mdl" )
		splash:SetAngles( self:GetOwner():EyeAngles() )
		splash:SetPos( scr + self:GetOwner():GetAimVector() * 10 )
		splash:SetColor( Color( 255, 255, 255, 255 ) )
		splash:SetRenderMode( RENDERMODE_NORMAL )
		--splash:SetKeyValue("solid","6")
		--splash:SetParent(ply)
		splash:Spawn()
		splash:Activate()
		splash.DoNotDuplicate = true
		splash:SetOwner( self:GetOwner() )
		splash:Fire( "kill", "", 8 )
		for i = 0, 300 do
			timer.Simple( i / 300, function()
				if IsValid( splash ) then
					local srcpos = splash:GetPos()
					local ownr = splash:GetOwner()
					local effectdata = EffectData()
					effectdata:SetScale( math.random( 6, 7 ) )
					effectdata:SetEntity( splash )
					effectdata:SetOrigin( srcpos )
					if math.random() < 0.9 then util.Effect( "watersplash", effectdata ) end
					local dmginfo = DamageInfo()
					dmginfo:SetAttacker( ownr )
					dmginfo:SetInflictor( splash )
					dmginfo:SetDamage( math.random( 10, 30 ) )
					dmginfo:SetDamageForce( vector_up * 5000 )
					dmginfo:SetDamageType( DMG_DROWN )
					for _, v in ipairs( ents.FindInSphere( srcpos, 32 ) ) do
						if v ~= ownr and IsValid( v ) and not v:IsWeapon() then
							local phys = v:GetPhysicsObject()
							if IsValid( phys ) then phys:ApplyForceOffset( splash:GetForward() * ( 80 + phys:GetMass() * 40 ), srcpos ) end
							v:TakeDamageInfo( dmginfo )
							if v:IsPlayer() or v:IsNPC() or v.Type == "nextbot" then
								v:SetVelocity( splash:GetForward() * 50 )
								if v.Type == "nextbot" then v.loco:SetVelocity( splash:GetForward() * 50 ) end
							end
						end
					end

					splash:SetPos( splash:GetPos() + splash:GetForward() * 16 )
					local htr = util.TraceLine( {
						start = srcpos,
						endpos = srcpos + splash:GetForward() * 64
					} )

					--filter = ownr
					if htr.HitWorld then
						splash:Remove()
						return
					end
				end
			end )
		end
		--end
		--self.part:SetParent(self:GetOwner())
	end
end

function SWEP:Reload()
	if timer.TimeLeft( "maxusedelay" .. self:EntIndex() ) == nil then
		local vm = self:GetOwner():GetViewModel()
		vm:SendViewModelMatchingSequence( vm:LookupSequence( "fists_uppercut" ) )
		self:GetOwner():SetAnimation( PLAYER_ATTACK1 )
		if math.random() < 0.9 then
			if SERVER then
				local FireLight1 = ents.Create( "light_dynamic" )
				FireLight1:SetKeyValue( "brightness", "4" )
				FireLight1:SetKeyValue( "distance", "160" )
				FireLight1:SetPos( self:GetOwner():GetShootPos() )
				FireLight1:SetLocalAngles( self:GetOwner():EyeAngles() )
				FireLight1:Fire( "Color", "60 150 255" )
				FireLight1:SetParent( self )
				FireLight1:Spawn()
				FireLight1:Activate()
				FireLight1:Fire( "TurnOn", "", 0 )
				FireLight1:Fire( "Kill", "", 1 )
				self:DeleteOnRemove( FireLight1 )
			end

			local effectdata = EffectData()
			effectdata:SetScale( math.random( 6, 7 ) )
			effectdata:SetEntity( self:GetOwner() )
			effectdata:SetOrigin( self:GetOwner():WorldSpaceCenter() )
			util.Effect( "watersplash", effectdata )
			for _, v in ipairs( ents.FindInSphere( self:GetOwner():GetPos(), 64 ) ) do
				if v:IsPlayer() or v:IsNPC() then
					v:SetHealth( math.Clamp( v:Health() + math.random( 1, 4 ), 0, v:GetMaxHealth() * 1.1 ) )
					local effectdata = EffectData()
					effectdata:SetScale( math.random( 6, 7 ) )
					effectdata:SetEntity( v )
					effectdata:SetOrigin( v:WorldSpaceCenter() )
					util.Effect( "watersplash", effectdata )
				end
			end
		end

		timer.Create( "maxusedelay" .. self:EntIndex(), 0.07, 1, function() end )
	end
end

function SWEP:Think()
	local vm = self:GetOwner():GetViewModel()
	local idletime = self:GetNextIdle()
	if idletime > 0 and CurTime() > idletime then
		vm:SendViewModelMatchingSequence( vm:LookupSequence( "fists_idle_0" .. math.random( 1, 2 ) ) )
		self:UpdateNextIdle()
	end

	local meleetime = self:GetNextMeleeAttack()
	if meleetime > 0 and CurTime() > meleetime then
		self:DealDamage()
		self:SetNextMeleeAttack( 0 )
	end
end

function SWEP:Deploy()
	local speed = GetConVar( "sv_defaultdeployspeed" ):GetInt()
	local vm = self:GetOwner():GetViewModel()
	vm:SendViewModelMatchingSequence( vm:LookupSequence( "fists_draw" ) )
	vm:SetPlaybackRate( speed )
	self:SetNextPrimaryFire( CurTime() + vm:SequenceDuration() / speed )
	self:SetNextSecondaryFire( CurTime() + vm:SequenceDuration() / speed )
	self:UpdateNextIdle()
	return true
end

function SWEP:Holster()
	self:SetNextMeleeAttack( 0 )
	return true
end

function SWEP:OnRemove()
	self:Holster()
	return true
end

function SWEP:OnDrop()
	self:Holster()
	self:Remove() -- You can't drop fists
end

local color1 = Color( 60, 60, 255 )
function SWEP:DrawHUD()
	local x, y = ScrW(), ScrH()
	local w, h = x * 0.5, y * 0.5
	draw.SimpleTextOutlined( "Стихія: Вода", onyx.Font( "Comfortaa@24" ), w, y - h / 8, color1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 2, color_black )
end
--PATH gamemodes/darkrp/entities/weapons/weaponchecker.lua:
AddCSLuaFile()

SWEP.Base = 'weapon_rp_base'

if CLIENT then
	SWEP.PrintName 		= 'Перевірка на збро.'
	SWEP.Slot 			= 3
	SWEP.SlotPos 		= 0
	SWEP.Instructions 	= ''
end

SWEP.ViewModel 		= Model('models/weapons/v_hands.mdl')
SWEP.ViewModelFOV 	= 62

SWEP.Spawnable = true
SWEP.Category = 'RP'
-- qwt 
SWEP.Primary.Delay = 2

function SWEP:PrimaryAttack()
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

	if CLIENT then return end

    self.Owner:LagCompensation(true)
    local ent = self.Owner:GetEyeTrace().Entity
    self.Owner:LagCompensation(false)

	if (not IsValid(ent)) or (not ent:IsPlayer()) or (self.Owner:GetPos():Distance(ent:GetPos()) > self.HitDistance) then return end

	if ent:IsPlayer() then 
		local BlackWep = {}
		local GreenWep = rp.Team[ent:Team()].Weapons
		local HasWep = ent:GetWeapons()
		for k, v in ipairs( HasWep ) do
			if !table.HasValue(GreenWep , v:GetClass()) then 
				if !v.IGS_Swep then
					if !table.HasValue(rp.Setting.DefaultWeapon['Citizen'],v:GetClass()) then 
						BlackWep[v:GetClass()] = v:GetClass()
					end
				end
			end
		end

		self.Owner:EmitSound("npc/combine_soldier/gear5.wav", 50, 100)

		net.Start('WeaponChecker')
		net.WriteTable(BlackWep)
		net.WriteEntity(ent)
		net.Send(self.Owner)
		hook.Call('playerWeaponsChecked',nil,self.Owner,ent)
	end 
end

if SERVER then 
	util.AddNetworkString('WeaponChecker')
else
	net.Receive('WeaponChecker', function(len,pl)	
		local Tb = net.ReadTable()
		local ply = net.ReadEntity()

		if ply:HasLicense() then
			chat.AddText(Color(0,255,0), 'У людини є ліцензія.')
		end

		chat.AddText(Color(255,255,255), 'Зброя:')
		for k, v in pairs(Tb) do
			if weapons.Get(v) then 
				chat.AddText(Color(255,0,0), ('- ' .. weapons.Get(v).PrintName))
			end
		end	
	end)
end
--PATH addons/__snow_event/lua/weapons/zck_snowballswep/cl_init.lua:
include( 'shared.lua' )
SWEP.PrintName = 'Snowball'
SWEP.Slot = 1
SWEP.SlotPos = 2
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true
function SWEP:Initialize()
	self:SetHoldType( self.HoldType )
end

function SWEP:SecondaryAttack()
	local owner = self:GetOwner()
	self:SendWeaponAnim( ACT_VM_SECONDARYATTACK )
	owner:SetAnimation( PLAYER_ATTACK1 )
	local tr = owner:GetEyeTrace()
	if tr.Hit and tr.HitWorld and tr.MatType == 74 and owner:GetPos():Distance( tr.HitPos ) < 300 then
		local snowballCount = self:GetSnowballCount()
		if snowballCount < zck.config.Swep.MaxAmmo then
			owner:EmitSound( 'zck_snowball_pickup' )
			ParticleEffect( 'zck_snowball_pickup', tr.HitPos, angle_zero, NULL )
		end
	end

	self:SetNextSecondaryFire( CurTime() + self.Secondary.Delay )
end

function SWEP:PrimaryAttack()
	self:SendWeaponAnim( ACT_VM_THROW )
	self:GetOwner():SetAnimation( PLAYER_ATTACK1 )
	timer.Simple( 0.5, function() if IsValid( self ) then self:SendWeaponAnim( ACT_VM_DRAW ) end end )
end

function SWEP:Deploy()
	self:SendWeaponAnim( ACT_VM_DRAW )
end

local col1 = ColorAlpha( color_black, 125 )
local snowball_icon = onyx.wimg.Simple( 'https://i.imgur.com/ht4922P.png', 'smooth' )
local w, h
function SWEP:DrawHUD()
	w, h = onyx.ScaleWide( 200, 1920 ), onyx.ScaleTall( 200, 1080 )
	snowball_icon( ScrW() * 0.5 - w * 0.5, ScrH() - h, w, h )
	draw.SimpleText( self:GetSnowballCount(), onyx.Font( 'Comfortaa Bold@80' ), ScrW() * 0.5, ScrH() - h * 0.55, col1, 1, 1 )
end

function SWEP:Holster()
	self:SendWeaponAnim( ACT_VM_HOLSTER )
end
--PATH addons/__main/lua/weapons/zekeou_scoped_base/cl_init.lua:
include('shared.lua')

SWEP.PrintName				= ""				// 'Nice' Weapon name (Shown on HUD)	
SWEP.Slot				= 4				// Slot in the weapon selection menu
SWEP.SlotPos				= 1				// Position in the slot
SWEP.DrawAmmo				= true				// Should draw the default HL2 ammo counter				// Should draw the default crosshair
SWEP.DrawWeaponInfoBox			= true				// Should draw the weapon info box
SWEP.BounceWeaponIcon   			= true				// Should the weapon icon bounce?
SWEP.CSMuzzleFlashes			= true
--PATH addons/_farmer/lua/entities/ba_medquality_meals/shared.lua:
ENT.Base = "base_gmodentity";
ENT.Type = "anim";

ENT.PrintName		= "Med Quality Meals";
ENT.Category 		= "Business: Animals";
ENT.Author			= "EnnX49";

ENT.Contact    		= "";
ENT.Purpose 		= "";
ENT.Instructions 	= "" ;

ENT.Spawnable			= true;
ENT.AdminSpawnable		= true;

--PATH addons/_farmer/lua/entities/ba_topquality_meals/cl_init.lua:
include("shared.lua");

surface.CreateFont("BA_Box_Text", {
	font = "Tahoma",
	size = 30,
	weight = 700,
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

surface.CreateFont("BA_Box_Big", {
	font = "Tahoma",
	size = 64,
	weight = 700,
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

surface.CreateFont("BA_Box_Icon", {
	font = "Webdings",
	size = 256,
	weight = 0,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = true,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
});

function ENT:Initialize()	
end;


function ENT:Think()
end;

function ENT:Draw()
	self:DrawModel();
	
	local camPos = self:GetPos();
	local camAng = self:GetAngles();
	
	camAng:RotateAroundAxis(camAng:Up(), 0);
	camAng:RotateAroundAxis(camAng:Forward(), 90);
	camAng:RotateAroundAxis(camAng:Right(), 0);
	
	local name = self:GetNWString("name");
	local length = (string.len(self:GetNWString("name"))*21);

	local color = string.Explode(",", self:GetNWString("color"));
	
	local amount = math.Clamp((self:GetNWInt("amount")*2)/length, 0, (length));
	
	
	if (LocalPlayer():GetPos():Distance(self:GetPos()) < B_Animals_Config.DrawDistance) then
		cam.Start3D2D(camPos+camAng:Up()*19.5, camAng, 0.125)
			draw.RoundedBox(0, -120, -87, 240, 170, Color(0, 0, 0, 230));
			draw.SimpleText(self:GetNWString("name"), "BA_Box_Text", 0, -70, Color(tonumber(color[1]) or 0, tonumber(color[2]) or 0, tonumber(color[3]) or 0, 200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER);

			--draw.SimpleText("F", "BA_Box_Icon", 0, 0, Color(tonumber(color[1]) or 0, tonumber(color[2]) or 0, tonumber(color[3]) or 0, 20), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER);
			draw.SimpleText(self:GetNWInt("amount").."cal", "BA_Box_Big", 0, 0, Color(tonumber(color[1]) or 0, tonumber(color[2]) or 0, tonumber(color[3]) or 0, 200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER);
		cam.End3D2D();
		
		camAng:RotateAroundAxis(camAng:Forward(), -90);	
		cam.Start3D2D(camPos+camAng:Up()*12, camAng, 0.125)
			draw.RoundedBox(0, -120, -145, 240, 290, Color(0, 0, 0, 230));

		cam.End3D2D();
		cam.Start3D2D(camPos+camAng:Up()*12, camAng, 0.2)
			draw.SimpleText("C", "BA_Box_Icon", 0, 0, Color(tonumber(color[1]) or 0, tonumber(color[2]) or 0, tonumber(color[3]) or 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER);
		cam.End3D2D();
	end;
end;
--PATH gamemodes/darkrp/entities/entities/base_edit.lua:

AddCSLuaFile()
DEFINE_BASECLASS( "base_anim" )

ENT.Spawnable = false
ENT.AdminOnly = false
ENT.Editable = true

function ENT:Initialize()

	if ( CLIENT ) then return end

	self:SetModel( "models/maxofs2d/cube_tool.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetUseType( ONOFF_USE )

end

function ENT:SpawnFunction( ply, tr, ClassName )

	if ( !tr.Hit ) then return end

	local SpawnPos = tr.HitPos + tr.HitNormal * 10
	local SpawnAng = ply:EyeAngles()
	SpawnAng.p = 0
	SpawnAng.y = SpawnAng.y + 180

	local ent = ents.Create( ClassName )
	ent:SetPos( SpawnPos )
	ent:SetAngles( SpawnAng )
	ent:Spawn()
	ent:Activate()

	return ent

end

function ENT:EnableForwardArrow()

	self:SetBodygroup( 1, 1 )

end

--PATH addons/_bitminers2/lua/entities/bm2_bitminer_rack/shared.lua:
ENT.Type = "anim"
ENT.PrintName = "Bitminer Rack"
ENT.Spawnable = true
ENT.Category = "Bitminers"
ENT.upgrades = {
	CPU = {
		name = "Overclocks all server by +256MHz",
		cost = { 7200, 12800, 16500, 24000, 25900, 32400, 134000, 32800, 35800, 35800, 35800, 35800, 134000, 32800, 35800, 35800, 35800, 35800, 134000, 32800, 32800, 32800, 32800, 32800 },
		amountPerUpgrade = 1.400
	},
	CORES = {
		name = "Adds an extra core", --Altough were not using it, by having an empty table it will prevent errors
		cost = {}
	}
}

function ENT:SetupDataTables()
	self:NetworkVar( "Bool", 1, "HasPower" )
	self:NetworkVar( "Bool", 2, "IsOn" )
	self:NetworkVar( "Bool", 3, "IsMining" )
	self:NetworkVar( "Float", 1, "BitcoinAmount" )
	self:NetworkVar( "Int", 1, "CPUUpgrade" )
	self:NetworkVar( "Int", 2, "CoreUpgrade" )
	self:NetworkVar( "Float", 3, "ClockSpeed" )
	self:NetworkVar( "Int", 4, "CoreCount" )
	--A string table of all the updates that have been purchased.
	self:NetworkVar( "String", 1, "Updates" )
	self:NetworkVar( "String", 2, "ConnectedServers" )
	self:NetworkVar( "Entity", 0, "owning_ent" )
end
--PATH addons/_bitminers2ex/lua/entities/bm2_extra_fuel_line/shared.lua:
ENT.Type = "anim"
ENT.Base = "bm2_base"
ENT.PrintName = "Fuel Line"
ENT.Spawnable = true
ENT.Category = "Bitminers"
--PATH addons/_bitminers2/lua/entities/bm2_fuel/cl_init.lua:
include( "shared.lua" )
function ENT:Draw()
	self:DrawModel()
end
--PATH addons/_doctor/lua/entities/bp_beaker/shared.lua:
ENT.Type = "anim"
ENT.Base = "bp_base"

ENT.PrintName = "Beaker"
ENT.Spawnable = true
ENT.Category = "Blue's Pharmaceuticals"

ENT.RenderGroup = RENDERGROUP_BOTH

ENT.States = {
	CREATING = 1,
	WAITING_FOR_MIX_AND_BURN = 2,
	MIXING_AND_BURNING = 3,
	WAITING_FOR_FREEZING = 4,
	FREEZING = 5,
	READY_TO_PRESS = 6,
	RUINED = 7
}

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "LiquidAmount")
	self:NetworkVar("Int", 1, "BeakerState")
	self:NetworkVar("Int", 2, "Recipe")
	self:NetworkVar("Int", 3, "StirAngle")
	self:NetworkVar("Float", 0, "FreezeStartTime")
	self:NetworkVar("Float", 1, "FreezeTime")
	self:NetworkVar("Entity", 0, "owning_ent")
end
--PATH addons/_doctor/lua/entities/bp_bunsen_burner/shared.lua:
ENT.Type = "anim"
ENT.Base = "bp_base"

ENT.PrintName = "Bunsen Burner"
ENT.Spawnable = true
ENT.Category = "Blue's Pharmaceuticals"

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:SetupDataTables()
	self:NetworkVar("Entity", 0, "ConnectedBeaker")
	self:NetworkVar("Float", 0, "BurnCookTime")
	self:NetworkVar("Float", 1, "BurnStartTime")
	self:NetworkVar("Float", 2, "MixAmount")
	self:NetworkVar("Entity", 1, "owning_ent")
end
--PATH addons/_doctor/lua/entities/bp_chemical_deio/cl_init.lua:
include("shared.lua")

local levelIcon = Material("blues_pharm/ui/level.png", "smooth")
local titleIcon = Material("blues_pharm/ui/title.png", "smooth")

function ENT:Draw()
	self:DrawModel()
end

function ENT:DrawTranslucent()
	if self:GetPos():DistToSqr(LocalPlayer():GetPos()) > BLUES_PHARMA.CONFIG.Cam3D2DRenderDist  then return end

	local ang = self:GetAngles()
	local pos = self:GetPos() + (ang:Up() * 20)

	local ang1 = self:WorldToLocalAngles((LocalPlayer():EyePos() - pos):Angle())
	local ang2 = self:LocalToWorldAngles(Angle(0, ang1.y + 90, 90))

	cam.Start3D2D(pos, ang2, 0.05)
		surface.SetMaterial(titleIcon)
		surface.SetDrawColor(Color(255, 255, 255, 255))
		surface.DrawTexturedRect(-180, -270, 300, 65)

		draw.RoundedBox(0, -180, -270, 20, 65, Color(43, 43, 43))

		draw.SimpleText(BLUES_PHARMA.Chemicals[self.ChemicalID].name, "BP_Chemical_Title",  -155, -270, Color(255, 255, 255), 0, 0)

		surface.SetMaterial(levelIcon)
		surface.SetDrawColor(Color(255, 255, 255, 60))
		surface.DrawTexturedRect(-155, -240, 32, 32)

		draw.SimpleText(self:GetLiquidAmount().."ml", "BP_Chemical_Amount",  - 120, -240, Color(255, 255, 255, 60), 0, 0)
	cam.End3D2D()
end
--PATH addons/____bricks_framework/lua/entities/bricks_server_npc/shared.lua:
ENT.Base = "base_ai" 
ENT.Type = "ai"
 
ENT.PrintName		= "Shop"
ENT.Category		= "Bricks Server"
ENT.Author			= "Brick Wall"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable		= false

function ENT:SetupDataTables()
    self:NetworkVar( "Int", 0, "NPCKeyVar" )
end
--PATH addons/_ballistic_shields/lua/entities/bs_rshield/cl_init.lua:
include( "shared.lua" )
include( "ballistic_shields/cl_bs_util.lua" )
ENT.RenderGroup = RENDERGROUP_BOTH
function ENT:Draw()
	if bshields.config.rShieldTexture == "" then
		self:DrawModel()
		return
	end

	local webmat = surface.GetURL( bshields.config.rShieldTexture, 256, 256 )
	if self.Mat then render.MaterialOverrideByIndex( 1, self.Mat ) end
	local html_mat = webmat
	local matdata = {
		["$basetexture"] = html_mat:GetName(),
		["$decal"] = 1,
		["$translucent"] = 1
	}

	local uid = string.Replace( html_mat:GetName(), "__vgui_texture_", "" )
	self.Mat = CreateMaterial( "bshields_webmat_" .. uid, "VertexLitGeneric", matdata )
	self:DrawModel()
	render.ModelMaterialOverride( nil )
end
--PATH gamemodes/darkrp/entities/entities/cook_furnite/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "[Cook] Газова плита"
ENT.Author = "Jerivssss"
ENT.Spawnable = true
ENT.AdminSpawnable = true 
ENT.Category = "RP"

--PATH gamemodes/darkrp/entities/entities/cook_vendin_machine/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "[Cook] Автомат з їжею"
ENT.Author = "Jerivssss"
ENT.Spawnable = true
ENT.AdminSpawnable = true 
ENT.Category = "RP"

--PATH addons/_drones/lua/entities/dronesrewrite_antidote.lua:
AddCSLuaFile()

ENT.Base = "base_anim"
ENT.Type = "anim"
ENT.PrintName = "Spider Antidote"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite Tools"

if SERVER then
	function ENT:SpawnFunction(ply, tr, class)
		if not tr.Hit then return end

		local pos = tr.HitPos + tr.HitNormal * 16

		local ent = ents.Create(class)
		ent:SetPos(pos)
		ent:SetAngles(Angle(0, (ply:GetPos() - tr.HitPos):Angle().y + 90, 0))
		ent:Spawn()
		ent:Activate()

		return ent
	end

	function ENT:Initialize()
	    self:SetModel("models/props_lab/jar01a.mdl")
	    self:SetMoveType(MOVETYPE_VPHYSICS)
	    self:SetSolid(SOLID_VPHYSICS)
	    self:PhysicsInit(SOLID_VPHYSICS)
	    self:SetUseType(SIMPLE_USE)

	    local phys = self:GetPhysicsObject()
	    if IsValid(phys) then phys:Wake() end
	end

	function ENT:Use(activator, caller)
		if not activator:IsPlayer() then return end

		local val = -5

		if activator.DRR_Poisoned then
			val = 5

			activator:ChatPrint("[Drones] You feel bad")
			
			net.Start("dronesrewrite_playsound")
				net.WriteString("vo/npc/male01/moan04.wav")
			net.Send(activator)

			if math.random(1, 2) == 1 then
				timer.Create("dronesrewrite_stoppoison_antidote" .. activator:EntIndex(), 2, 1, function()
					if IsValid(activator) then
						hook.Remove("Think", "dronesrewrite_bite_poison" .. activator:EntIndex())
						activator.DRR_Poisoned = false
					end
				end)
			end
		else
			if activator.SHOULDDIE_ANTIDOTE then 
				activator:Kill() 
				activator.SHOULDDIE_ANTIDOTE = false

				return
			end

			activator.SHOULDDIE_ANTIDOTE = true

			timer.Create("dronesrewrite_antidoteshit" .. activator:EntIndex(), 30, 1, function()
				if IsValid(activator) then
					activator.SHOULDDIE_ANTIDOTE = false
				end
			end)
		end

		activator:SetHealth(math.min(activator:Health() + val, activator:GetMaxHealth()))

		self:Remove()
	end

	function ENT:OnTakeDamage(dmg)
		self:TakePhysicsDamage(dmg)
	end
else
	function ENT:Draw()
		self:DrawModel()
	end
end
--PATH addons/_drones/lua/entities/dronesrewrite_bomb/shared.lua:
ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
//ENT.PrintName = "BMB 'Flying Bomb'"
ENT.PrintName = "Bomb Drone"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "BMB"

ENT.Weight = 500

ENT.Model = "models/dronesrewrite/bomb/bomb.mdl"

ENT.HealthAmount = 145
ENT.DefaultHealth = 145

ENT.HUD_hudName = "Drones 1"
ENT.OverlayName = "Red"

ENT.FirstPersonCam_pos = Vector(23, 0, 7)
ENT.ThirdPersonCam_distance = 80
ENT.RenderCam = false

ENT.DoExplosionEffect = false

ENT.NoiseCoefficient = 0

ENT.HUD_shouldDrawWeps = false

ENT.Speed = 7500
ENT.UpSpeed = 38000
ENT.RotateSpeed = 5
ENT.AngOffset = 1.6
ENT.PitchOffset = 0.2
ENT.Alignment = 3

ENT.Fuel = 150
ENT.MaxFuel = 150
ENT.FuelReduction = 0.4

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.AllowYawRestrictions = true
ENT.YawMin = -50
ENT.YawMax = 50

ENT.UseFlashlight = false

ENT.AI_NoSkipZ = true
ENT.AI_AirZ = -50
ENT.AI_DistanceEnemy = 20
ENT.AI_MaxDistance = 60

ENT.Sounds = {
	PropellerSound = {
		Name = "vehicles/tank_turret_loop1.wav",
		Pitch = 60,
		Level = 70
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_1.wav",
		Pitch = 100,
		Level = 90
	}
}

ENT.NoPropellers = true
ENT.Propellers = {
	Model = "models/props_junk/PopCan01a.mdl",
	Info = { Vector(0, 0, 0) }
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()

ENT.Weapons = {
	["Bomb"] = { Name = "Bomb" }
}
--PATH addons/_drones/lua/entities/dronesrewrite_controller/shared.lua:
ENT.Base = "base_anim"
ENT.Type = "anim"
ENT.PrintName = "Controller"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite Tools"

--function ENT:GetDistance() return self:GetNWInt("Distance") end
--PATH addons/_drones/lua/entities/dronesrewrite_crucifier/cl_init.lua:
include("shared.lua")

--PATH addons/_drones/lua/entities/dronesrewrite_doll/cl_init.lua:
include("shared.lua")

--PATH addons/_drones/lua/entities/dronesrewrite_firestorm/cl_init.lua:
include("shared.lua")

--PATH addons/_drones/lua/entities/dronesrewrite_gr_laser_sm.lua:
AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Spawnable = false

if SERVER then
	function ENT:Initialize()
	    self:SetModel("models/dronesrewrite/lray_sm/lray_sm.mdl")
	    self:SetMoveType(MOVETYPE_VPHYSICS)
	    self:SetSolid(SOLID_VPHYSICS)
	    self:PhysicsInit(SOLID_VPHYSICS)

	    self:DrawShadow(false)
		self:SetColor(Color(255, 255, 255))

	    local phys = self:GetPhysicsObject()

	    phys:SetMass(1)
		phys:EnableDrag(false)
		phys:EnableGravity(false)	
	    phys:Wake()

	    self:SetCustomCollisionCheck(true)
	end

	function ENT:PhysicsUpdate(phys)
		if self.LastPhys == CurTime() then return end

		if self:WaterLevel() >= 3 then self:Remove() end

		phys:ApplyForceCenter(self:GetForward() * 100000)

		self.LastPhys = CurTime()
	end

	function ENT:PhysicsCollide(data, physobj)
		local ent = data.HitEntity
		if ent:IsValid() then
			local owner = self.Owner
			ent:TakeDamage(math.random(2,4), owner, owner)
			ent:Ignite(0.3,1)
		end

		local tr = util.TraceLine({
			start = self:GetPos(),
			endpos = self:GetPos() + self:GetForward() * 1024,
			filter = self,
			mask = MASK_SOLID_BRUSHONLY
		})

		ParticleEffect("sparks_rdbl", self:GetPos(), Angle(0, 0, 0))

		util.Decal("FadingScorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)

		self:Remove()
	end
else
	function ENT:Draw()
		local dlight = DynamicLight(self:EntIndex())
		if dlight then
			dlight.pos = self:GetPos()
			dlight.r = 0
			dlight.g = 255
			dlight.b = 0
			dlight.brightness = 1
			dlight.Decay = 1000
			dlight.Size = 150
			dlight.DieTime = CurTime() + 0.3
		end	

		render.SetMaterial(Material("particle/particle_glow_04_additive"))

		local color = Color(0, 255, 0, 255)
		local xs = 18
		
		render.DrawSprite(self:GetPos() - self:GetForward() * 12, xs, xs, color)
		render.DrawSprite(self:GetPos() - self:GetForward() * 6, xs, xs, color)
		render.DrawSprite(self:GetPos(), xs, xs, color)
		render.DrawSprite(self:GetPos() + self:GetForward() * 6, xs, xs, color)
		render.DrawSprite(self:GetPos() + self:GetForward() * 12, xs, xs, color)

		self:DrawModel()
	end
end
--PATH addons/_drones/lua/entities/dronesrewrite_laser/cl_init.lua:
include("shared.lua")
--PATH addons/_drones/lua/entities/dronesrewrite_skyartillery/shared.lua:
ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Death from Above"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"
ENT.AdminOnly = true

ENT.UNIT = "DFA"

ENT.Model = "models/dronesrewrite/skyartillery/skyartillery.mdl"

ENT.Weight = 2000
ENT.SpawnHeight = 128

ENT.HUD_hudName = "Drones 1"
ENT.OverlayName = "Sci Fi"

ENT.UseNightVision = true
ENT.UseFlashlight = false

ENT.NoiseCoefficient = 0

ENT.HealthAmount = 3000
ENT.DefaultHealth = 3000

ENT.DoExplosionEffect = "splode_big_drone_main"

ENT.HackValue = 5
ENT.ImmuneToJammer = true

ENT.ExplosionForce = 0.4
ENT.ExplosionAngForce = 0.01

ENT.Speed = 20000
ENT.UpSpeed = 90000
ENT.RotateSpeed = 4
ENT.AngOffset = 3

ENT.Alignment = 0.3

ENT.PitchOffset = 0.05

ENT.FirstPersonCam_pos = Vector(60, 0, -8)
ENT.ThirdPersonCam_distance = 300
ENT.RenderCam = false

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.PitchMin = -25

ENT.Fuel = 800
ENT.MaxFuel = 800
ENT.FuelReduction = 0.4

ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.Slots = {
	["Weapon"] = 2
}

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/attack_helicopter/aheli_rotor_loop1.wav",
		NoPitchChanges = true,
		Level = 80
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_5.wav",
		Level = 140
	}
}

ENT.Propellers = {
	Immortal = true,
	Damage = 200,
	Scale = 2,
	HitRange = 40,
	Model = "models/dronesrewrite/propellers/propeller2_5.mdl",

	Info = {
		Vector(-76.5, 76.5, 23),
		Vector(-76.5, -76.5, 23),
		Vector(108.5, 76.5, 23),
		Vector(108.5, -76.5, 23)
	}
}

ENT.Attachments = {
	["RocketL1"] = {
		Pos = Vector(40, 28, -13)
	},

	["RocketL2"] = {
		Pos = Vector(-10, 28, -13)
	},

	["RocketL3"] = {
		Pos = Vector(-10, -28, -13)
	},

	["RocketL4"] = {
		Pos = Vector(40, -28, -13)
	},

	["Up"] = {
		Pos = Vector(-15, 0, 28),
		Angle = Angle(0, 0, 180)
	}
}

ENT.Weapons = {
	["Rocket Launcher"] = {
		Name = "Rocket Launcher",
		Sync = {
			["Rocket Launcher 2"] = { fire1 = "fire1" },
			["Rocket Launcher 3"] = { fire1 = "fire1" },
			["Rocket Launcher 4"] = { fire1 = "fire1" }
		},

		Attachment = "RocketL1"
	},

	["Rocket Launcher 2"] = {
		Name = "Rocket Launcher",
		Select = false,
		Attachment = "RocketL2"
	},

	["Rocket Launcher 3"] = {
		Name = "Rocket Launcher",
		Select = false,
		Attachment = "RocketL3"
	},

	["Rocket Launcher 4"] = {
		Name = "Rocket Launcher",
		Select = false,
		Attachment = "RocketL4"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()
--PATH addons/_eml/lua/entities/eml_macid/shared.lua:
ENT.Base = "base_anim";
ENT.Type = "anim";

ENT.PrintName		= "Соляна Кислота";
ENT.Category 		= "EML";
ENT.Author			= "EnnX49";

ENT.Contact    		= "";
ENT.Purpose 		= "";
ENT.Instructions 	= "" ;

ENT.Spawnable			= true;
ENT.AdminSpawnable		= true;

--PATH addons/_eml/lua/entities/eml_redp/cl_init.lua:
include("shared.lua");

surface.CreateFont("methFont", {
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
	shadow = false,
	additive = false,
	outline = false,
});

function ENT:Initialize()	

end;

function ENT:Draw()
	self:DrawModel();
	
	local pos = self:GetPos()
	local ang = self:GetAngles()

	
	ang:RotateAroundAxis(ang:Up(), 90);
	ang:RotateAroundAxis(ang:Forward(), 90);	
	if LocalPlayer():GetPos():Distance(self:GetPos()) < self:GetNWInt("distance") then
		cam.Start3D2D(pos + ang:Up(), Angle(0, LocalPlayer():EyeAngles().y-90, 90), 0.1)
				draw.SimpleTextOutlined("Червоний Фосфор ("..self:GetNWInt("amount").." КГ)", "methFont", 32, -96, Color(175, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100));			
		cam.End3D2D()	
	end;
end;

-- maxAmount = 60
-- amount = x


--PATH addons/_eml/lua/entities/eml_stove/cl_init.lua:
include("shared.lua");


function ENT:Initialize()	
	self.emitTime = CurTime();
	self.firePlace1 = ParticleEmitter(self:GetPos());
	self.firePlace2 = ParticleEmitter(self:GetPos());
	self.firePlace3 = ParticleEmitter(self:GetPos());
	self.firePlace4 = ParticleEmitter(self:GetPos());
end;

function ENT:Think()

	local firePos1 = self:GetPos()+(self:GetUp()*20)+(self:GetForward()*2.8)+(self:GetRight()*11.5);
	local firePos2 = self:GetPos()+(self:GetUp()*20)+(self:GetForward()*2.8)+(self:GetRight()*-11.2);
	local firePos3 = self:GetPos()+(self:GetUp()*20)+(self:GetForward()*-9.8)+(self:GetRight()*-11.2);
	local firePos4 = self:GetPos()+(self:GetUp()*20)+(self:GetForward()*-9.8)+(self:GetRight()*11.5);
	
	if (self:GetNWInt("gasStorage")>0) then
		if (self.emitTime < CurTime()) then
			if (self:GetNWBool("firePlace1")) then
				local smoke = self.firePlace1:Add("particle/smokesprites_000"..math.random(1,9), firePos1);
				smoke:SetVelocity(Vector(0, 0, 150));
				smoke:SetDieTime(math.Rand(0.6, 2.3));
				smoke:SetStartAlpha(math.Rand(150, 200));
				smoke:SetEndAlpha(0);
				smoke:SetStartSize(math.random(0, 5));
				smoke:SetEndSize(math.random(33, 55));
				smoke:SetRoll(math.Rand(180, 480));
				smoke:SetRollDelta(math.Rand(-3, 3));
				smoke:SetColor(EML_Stove_SmokeColor_R, EML_Stove_SmokeColor_G, EML_Stove_SmokeColor_B);
				smoke:SetGravity(Vector(0, 0, 10));
				smoke:SetAirResistance(256);
				self.emitTime = CurTime() + .1;
			end;
			if (self:GetNWBool("firePlace2")) then
				local smoke = self.firePlace2:Add("particle/smokesprites_000"..math.random(1,9), firePos2);
				smoke:SetVelocity(Vector(0, 0, 150));
				smoke:SetDieTime(math.Rand(0.6, 2.3));
				smoke:SetStartAlpha(math.Rand(150, 200));
				smoke:SetEndAlpha(0);
				smoke:SetStartSize(math.random(0, 5));
				smoke:SetEndSize(math.random(33, 55));
				smoke:SetRoll(math.Rand(180, 480));
				smoke:SetRollDelta(math.Rand(-3, 3));
				smoke:SetColor(EML_Stove_SmokeColor_R, EML_Stove_SmokeColor_G, EML_Stove_SmokeColor_B);
				smoke:SetGravity(Vector(0, 0, 10));
				smoke:SetAirResistance(256);
				self.emitTime = CurTime() + .1;
			end;
			if (self:GetNWBool("firePlace3")) then
				local smoke = self.firePlace3:Add("particle/smokesprites_000"..math.random(1,9), firePos3);
				smoke:SetVelocity(Vector(0, 0, 150));
				smoke:SetDieTime(math.Rand(0.6, 2.3));
				smoke:SetStartAlpha(math.Rand(150, 200));
				smoke:SetEndAlpha(0);
				smoke:SetStartSize(math.random(0, 5));
				smoke:SetEndSize(math.random(33, 55));
				smoke:SetRoll(math.Rand(180, 480));
				smoke:SetRollDelta(math.Rand(-3, 3));
				smoke:SetColor(EML_Stove_SmokeColor_R, EML_Stove_SmokeColor_G, EML_Stove_SmokeColor_B);
				smoke:SetGravity(Vector(0, 0, 10));
				smoke:SetAirResistance(256);
				self.emitTime = CurTime() + .1;
			end;
			if (self:GetNWBool("firePlace4")) then
				local smoke = self.firePlace4:Add("particle/smokesprites_000"..math.random(1,9), firePos4);
				smoke:SetVelocity(Vector(0, 0, 150));
				smoke:SetDieTime(math.Rand(0.6, 2.3));
				smoke:SetStartAlpha(math.Rand(150, 200));
				smoke:SetEndAlpha(0);
				smoke:SetStartSize(math.random(0, 5));
				smoke:SetEndSize(math.random(33, 55));
				smoke:SetRoll(math.Rand(180, 480));
				smoke:SetRollDelta(math.Rand(-3, 3));
				smoke:SetColor(EML_Stove_SmokeColor_R, EML_Stove_SmokeColor_G, EML_Stove_SmokeColor_B);
				smoke:SetGravity(Vector(0, 0, 10));
				smoke:SetAirResistance(256);
				self.emitTime = CurTime() + .1;
			end;		
		end;
	end;
end;


local laser = Material("cable/redlaser")
function ENT:Draw()
	self:DrawModel();
	
	local pos = self:GetPos()
	local ang = self:GetAngles()
	
	ang:RotateAroundAxis(ang:Up(), 90);
	ang:RotateAroundAxis(ang:Forward(), 90);

	if LocalPlayer():GetPos():Distance(self:GetPos()) < self:GetNWInt("distance") then
		render.SetMaterial(laser);
		--Fire Place #1
		render.DrawBeam(self:GetPos()+(self:GetUp()*20)+(self:GetForward()*2.8)+(self:GetRight()*11.5), self:GetPos()+(self:GetUp()*24)+(self:GetForward()*2.8)+(self:GetRight()*11.5), 1, 1, 1, Color(255, 0, 0, 0));
		
		--Fire Place #2
		render.DrawBeam(self:GetPos()+(self:GetUp()*20)+(self:GetForward()*2.8)+(self:GetRight()*-11.2), self:GetPos()+(self:GetUp()*24)+(self:GetForward()*2.8)+(self:GetRight()*-11.2), 1, 1, 1, Color(255, 0, 0, 0));

		--Fire Place #3
		render.DrawBeam(self:GetPos()+(self:GetUp()*20)+(self:GetForward()*-9.8)+(self:GetRight()*-11.2), self:GetPos()+(self:GetUp()*24)+(self:GetForward()*-9.8)+(self:GetRight()*-11.2), 1, 1, 1, Color(255, 0, 0, 0));
		
		--Fire Place #4
		render.DrawBeam(self:GetPos()+(self:GetUp()*20)+(self:GetForward()*-9.8)+(self:GetRight()*11.5), self:GetPos()+(self:GetUp()*24)+(self:GetForward()*-9.8)+(self:GetRight()*11.5), 1, 1, 1, Color(255, 0, 0, 0));		
		
		cam.Start3D2D(pos+ang:Up()*14.5, ang, 0.1)
		
			surface.SetDrawColor(Color(0, 0, 0, 200));
			surface.DrawRect(-215, -51, 194, 20)
			
			surface.SetDrawColor(EML_Stove_IndicatorColor);
			surface.DrawRect(-213, -50, math.Round((self:GetNWInt("gasStorage")*190)/self:GetNWInt("gasStorageMax")), 18)	
			draw.SimpleTextOutlined(math.Round((self:GetNWInt("gasStorage")*100)/self:GetNWInt("gasStorageMax")).."%", "Roboto_15", -211, -48, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT, 1, Color(25, 25, 25, 200));

			surface.SetDrawColor(Color(0, 0, 0, 200));
			surface.DrawRect(-215, -90, 48, 32)	

			--Fire Place #1
			if !self:GetNWBool("firePlace1") then
				surface.SetDrawColor(Color(255, 0, 0, 255));
			elseif self:GetNWBool("firePlace1") then
				if (self:GetNWInt("gasStorage")>0) then
					surface.SetDrawColor(Color(0, 255, 0, 255));
				else 		
					surface.SetDrawColor(Color(255, 0, 0, 255));
				end;
			end;
				surface.SetMaterial(Material( "icon16/stop.png" ));
				surface.DrawTexturedRect(-212.5, -73, 14, 14);
				
			--Fire Place #2
			if !self:GetNWBool("firePlace2") then			
				surface.SetDrawColor(Color(255, 0, 0, 255));
			elseif self:GetNWBool("firePlace2") then
				if (self:GetNWInt("gasStorage")>0) then
					surface.SetDrawColor(Color(0, 255, 0, 255));
				else 		
					surface.SetDrawColor(Color(255, 0, 0, 255));
				end;
			end;				
				surface.SetMaterial(Material( "icon16/stop.png" ));
				surface.DrawTexturedRect(-184.5, -73, 14, 14);	
				
			--Fire Place #3
			if !self:GetNWBool("firePlace3") then				
				surface.SetDrawColor(Color(255, 0, 0, 255));	
			elseif self:GetNWBool("firePlace3") then		
				if (self:GetNWInt("gasStorage")>0) then
					surface.SetDrawColor(Color(0, 255, 0, 255));
				else 		
					surface.SetDrawColor(Color(255, 0, 0, 255));
				end;
			end;	
				surface.SetMaterial(Material( "icon16/stop.png" ));		
				surface.DrawTexturedRect(-184.5, -89, 14, 14);	
			
			--Fire Place #4
			if !self:GetNWBool("firePlace4") then					
				surface.SetDrawColor(Color(255, 0, 0, 255));
			elseif self:GetNWBool("firePlace4") then			
				if (self:GetNWInt("gasStorage")>0) then
					surface.SetDrawColor(Color(0, 255, 0, 255));
				else 		
					surface.SetDrawColor(Color(255, 0, 0, 255));
				end;
			end;
				surface.SetMaterial(Material( "icon16/stop.png" ));
				surface.DrawTexturedRect(-212.5, -89, 14, 14);			
					
		cam.End3D2D()
	end;
end;
--PATH addons/_eml/lua/entities/eml_water/shared.lua:
ENT.Base = "base_anim";
ENT.Type = "anim";

ENT.PrintName		= "Вода";
ENT.Category 		= "EML";
ENT.Author			= "EnnX49";

ENT.Contact    		= "";
ENT.Purpose 		= "";
ENT.Instructions 	= "" ;

ENT.Spawnable			= true;
ENT.AdminSpawnable		= true;

--PATH addons/__________scripts__loader/lua/entities/ent_bail/cl_init.lua:
include( 'shared.lua' )
function ENT:Draw()
    self:DrawModel()
end

net.Receive( 'lrpbail', function()
    local ply = LocalPlayer()
    onyx.SimpleQuery( 'Викупитись', 'Ви точно хочете витратити ' .. rp.FormatMoney( ENT_BailSum ) .. ' на викуп?', false, function()
        if ply:CanAfford( ENT_BailSum ) then
            net.Start( 'lrpbail' )
            net.SendToServer()
        else
            ply:ChatPrint( 'У вас немає грошей!' )
        end
    end, 'Так', nil, 'Ні' )
end )
--PATH addons/__main/lua/entities/ent_undertale_bone_ground.lua:
AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"

ENT.Editable		= true
ENT.PrintName		= "Undertale Bone"
ENT.Spawnable 		= false
ENT.AdminSpawnable 	= false

function ENT:Initialize()
	if( SERVER ) then
		self:SetModel( "models/undertale/undertale_bone.mdl" )
		self:SetTrigger( true )
		//self.Entity:PhysicsInit(SOLID_BBOX)
		//self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
		//self.Entity:SetSolid(SOLID_BBOX)
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_NONE )
		self:SetSolid( SOLID_NONE )

		self:SetVar( "value", -50 )
		self:SetVar( "position", self:GetPos() )
		self:SetVar( "seed", math.Rand( 0, 1 ) )
		self:SetVar( "reverse", false )
		
		local phys = self:GetPhysicsObject()
		if( IsValid( phys ) ) then
			phys:Wake()
		end

		timer.Simple(5,function() self:Remove() end)
	end
end

local sound1 = false
function ENT:PhysicsUpdate()
	if( SERVER ) then
		local value = math.min( self:GetVar( "value" ), 35 )
		local counter = self:GetVar( "value" )
		
		local seed = self:GetVar( "seed", NULL )
		
		if( self:GetVar( "reverse", NULL ) ) then
			self:SetVar( "value", counter - 2 )
			if( value < -20 ) then
				self:Remove()
			end
		else
			self:SetVar( "value", counter + 2 )
		end
		
		if( value > 10 ) then
			if( value < 15 ) && !self:GetVar( "reverse", NULL ) && !sound1 then
				local pos = self:GetVar( "pos", NULL )
				local normal = self:GetVar( "normal", NULL )

				sound.Play( Sound( "undertale/bone_end.wav" ), pos + normal * 50 )

				sound1 = true
				
				util.TraceHull( {
					start = pos,
					endpos = pos + normal * 50,
					filter = function( ent )
						if( ent:IsValid() ) then
						//if( ent:GetClass() == "ent_undertale_bone") then return false end
							if ent == self.Owner then return end
							ent:TakeDamage( 35, self.Owner, self )
							if( ent:IsValid() ) then
								return false
							end
						end
					end,
					ignoreworld = true,
					mins = -Vector( 30, 30, 30 ),
					maxs = Vector( 30, 30, 30 ),
					mask = MASK_SHOT_HULL
				} )
			end
			
			if( self:GetVar( "do", NULL ) == NULL ) then
				self:SetVar( "do", true )
				self:SetSolid( SOLID_VPHYSICS )
			end
		end
		
		if( counter > 100 ) then
			self:SetVar( "reverse", true )
			sound1 = false
		end
		
		local phys = self:GetPhysicsObject()
		local position = self:GetVar( "position", NULL )
		
		local val1 = math.sin( ( math.max( 0, value ) + 50 ) / 10 ) * 30
		local val2 = ( seed - 0.5 ) * 13
		
		self:SetPos( position + self:GetUp() * ( val1 - val2 - 5 ) )
		
		phys:Wake()
	end
end
--PATH gamemodes/darkrp/entities/entities/grover_lamp/cl_init.lua:
include("Shared.lua")

function ENT:Draw()
	self:DrawModel()


local status = 'Off'

if self:GetNWBool('IsOn') then
	status = 'On'
else
	status = 'Off'
end


if self:GetNWBool('IsOn') and LocalPlayer():GetPos():Distance(self:GetPos()) < 500 then
	self.dlight = DynamicLight( self:EntIndex() )
	if ( self.dlight ) then
		self.dlight.pos = self:GetPos() + Vector(0,0,60)
		self.dlight.r = 255
		self.dlight.g = 0
		self.dlight.b = 0
		self.dlight.brightness = 4
		self.dlight.Decay = 2000
		self.dlight.Size = 500
		self.dlight.DieTime = CurTime() + 1
	end
end



end  



--PATH addons/_drones/lua/entities/item_drr_grenades.lua:
AddCSLuaFile()

ENT.Base = "item_drr_ammobase"
ENT.Type = "anim"
ENT.PrintName = "Grenades"
ENT.Category = "Drones Rewrite Ammo"
ENT.Spawnable = true
ENT.AdminSpaawnable = true

ENT.Amount = 15
ENT.Model = "models/dronesrewrite/ammobox/ammobox.mdl"
ENT.Material = "models/dronesrewrite/ammunition/ammo_exp"

--PATH addons/_drones/lua/entities/item_drr_grenadesfire.lua:
AddCSLuaFile()

ENT.Base = "item_drr_ammobase"
ENT.Type = "anim"
ENT.PrintName = "Fire Grenades"
ENT.Category = "Drones Rewrite Ammo"
ENT.Spawnable = true
ENT.AdminSpaawnable = true

ENT.Amount = 15
ENT.Model = "models/dronesrewrite/ammobox/ammobox.mdl"
ENT.Material = "models/dronesrewrite/ammunition/ammo_fire"

--PATH addons/_drones/lua/entities/item_drr_rifle.lua:
AddCSLuaFile()

ENT.Base = "item_drr_ammobase"
ENT.Type = "anim"
ENT.PrintName = "Rifle Ammo"
ENT.Category = "Drones Rewrite Ammo"
ENT.Spawnable = true
ENT.AdminSpaawnable = true

ENT.Amount = 80
ENT.Model = "models/dronesrewrite/ammobox/ammobox.mdl"
ENT.Material = "models/dronesrewrite/ammunition/ammo_rif"

--PATH gamemodes/darkrp/entities/entities/lootbox_3/cl_init.lua:
include("Shared.lua")

function ENT:Draw()
	self:DrawModel()
end  





--PATH gamemodes/darkrp/entities/entities/lootbox_3/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "[RP] Лут Ящик - Збройовий" 
ENT.Author = "Jerivssss"
ENT.Spawnable = true
ENT.AdminSpawnable = true 
ENT.Category = "RP"

--PATH addons/lvs_base-main/lua/entities/lvs_armor_penetrate.lua:
AddCSLuaFile()

ENT.Type            = "anim"

ENT.RenderGroup = RENDERGROUP_BOTH 

ENT.LifeTime = 15

if SERVER then
	local CountTotal = {}

	function ENT:Initialize()
		CountTotal[ self:EntIndex() ] = true

		local Num = table.Count( CountTotal )

		if (Num > 30 and math.random(1,2) == 1) or Num > 60 then
			self:Remove()

			return
		end

		self:SetMoveType( MOVETYPE_NONE )
		self:SetSolid( SOLID_NONE )
		self:DrawShadow( false )
		self.DieTime = CurTime() + self.LifeTime
	end

	function ENT:OnRemove()
		CountTotal[ self:EntIndex() ] = nil
	end

	function ENT:Think()
		self:NextThink( CurTime() + 0.1 )

		if not IsValid( self:GetParent() ) then self:Remove() return end

		if (self.DieTime or 0) > CurTime() then return true end

		self:Remove()

		return false
	end

	return
end

ENT.GlowMat1 = Material( "particle/particle_ring_wave_8" )
ENT.GlowMat2 = Material( "sprites/light_glow02_add" )
ENT.DecalMat = Material( "particle/particle_noisesphere" )
ENT.MatSmoke = {
	"particle/smokesprites_0001",
	"particle/smokesprites_0002",
	"particle/smokesprites_0003",
	"particle/smokesprites_0004",
	"particle/smokesprites_0005",
	"particle/smokesprites_0006",
	"particle/smokesprites_0007",
	"particle/smokesprites_0008",
	"particle/smokesprites_0009",
	"particle/smokesprites_0010",
	"particle/smokesprites_0011",
	"particle/smokesprites_0012",
	"particle/smokesprites_0013",
	"particle/smokesprites_0014",
	"particle/smokesprites_0015",
	"particle/smokesprites_0016"
}

local CountTotal = {}

function ENT:Initialize()
	CountTotal[ self:EntIndex() ] = true

	self.RandomAng = math.random(0,360)
	self.DieTime = CurTime() + self.LifeTime

	local Pos = self:GetPos()
	local Dir = self:GetUp()

	self.emitter = ParticleEmitter( Pos, false )

	self:EmitSound( "lvs/armor_pen_"..math.random(1,3)..".wav", 95 )
end

function ENT:Smoke()
	local T = CurTime()

	if (self.DieTime or 0) < T then return end

	if not IsValid( self.emitter ) then return end

	if (self.NextFX or 0) < T then
		self.NextFX = T + 0.2 + table.Count( CountTotal ) / 50

		local particle = self.emitter:Add( self.MatSmoke[math.random(1,#self.MatSmoke)], self:GetPos() )

		if particle then
			particle:SetVelocity( self:GetUp() * 60 + VectorRand() * 30 )
			particle:SetDieTime( math.Rand(1.5,2) )
			particle:SetAirResistance( 100 ) 
			particle:SetStartAlpha( 30 )
			particle:SetEndAlpha( 0 )
			particle:SetStartSize( 0 )
			particle:SetEndSize( 60 )
			particle:SetRollDelta( math.Rand( -1, 1 ) )
			particle:SetColor( 50,50,50 )
			particle:SetGravity( Vector( 0, 0, 200 ) )
			particle:SetCollide( false )
		end
	end
end

function ENT:Think()
	self:Smoke()
end

function ENT:OnRemove()
	CountTotal[ self:EntIndex() ] = nil

	if not IsValid(self.emitter) then return end

	self.emitter:Finish()
end

function ENT:Draw()
	local Timed = 1 - (self.DieTime - CurTime()) / self.LifeTime
	local Scale = math.max(math.min(2 - Timed * 2,1),0)

	local Scale02 = math.max(Scale - 0.8,0) / 0.2

	cam.Start3D2D( self:GetPos() + self:GetAngles():Up(), self:GetAngles(), 1 )
		surface.SetDrawColor( 255 * Scale02, (93 + 50 * Scale) * Scale02, (50 * Scale) * Scale02, (200 * Scale) * Scale02 )

		surface.SetMaterial( self.GlowMat1 )
		surface.DrawTexturedRectRotated( 0, 0, 8 , 8 , self.RandomAng )

		surface.SetMaterial( self.GlowMat2 )
		surface.DrawTexturedRectRotated( 0, 0, 16 , 16 , self.RandomAng )

		surface.SetDrawColor( 0, 0, 0, 255 )
		surface.SetMaterial( self.DecalMat )
		surface.DrawTexturedRectRotated( 0, 0, 16 , 16 , self.RandomAng )
	cam.End3D2D()
end

function ENT:DrawTranslucent()
	self:Draw()
end

--PATH addons/lvs_cars_3027255911/lua/entities/lvs_base_wheeldrive/shared.lua:

ENT.Base = "lvs_base"

ENT.PrintName = "[LVS] Wheeldrive Base"
ENT.Author = "Luna"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars"

ENT.Spawnable			= false
ENT.AdminSpawnable		= false

ENT.MaxHealth = 600
ENT.MaxHealthEngine = 50
ENT.MaxHealthFuelTank = 10

ENT.MaxVelocity = 1400
ENT.MaxVelocityReverse = 700

ENT.EngineCurve = 0.65
ENT.EngineCurveBoostLow = 1
ENT.EngineTorque = 350
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.ThrottleRate = 3.5

ENT.ForceLinearMultiplier = 1
ENT.ForceAngleMultiplier = 0.5

ENT.TransGears = 4
ENT.TransGearsReverse = 1
ENT.TransMinGearHoldTime = 1
ENT.TransShiftSpeed = 0.3
ENT.TransWobble = 40
ENT.TransWobbleTime = 1.5
ENT.TransWobbleFrequencyMultiplier = 1
ENT.TransShiftSound = "lvs/vehicles/generic/gear_shift.wav"

ENT.SteerSpeed = 3
ENT.SteerReturnSpeed = 10

ENT.FastSteerActiveVelocity = 500
ENT.FastSteerAngleClamp = 10
ENT.FastSteerDeactivationDriftAngle = 7

ENT.SteerAssistDeadZoneAngle = 1
ENT.SteerAssistMaxAngle = 15
ENT.SteerAssistExponent = 1.5
ENT.SteerAssistMultiplier = 3

ENT.MouseSteerAngle = 20
ENT.MouseSteerExponent = 2

ENT.PhysicsWeightScale = 1
ENT.PhysicsMass = 1000
ENT.PhysicsInertia = Vector(1500,1500,750)
ENT.PhysicsDampingSpeed = 4000
ENT.PhysicsDampingForward = true
ENT.PhysicsDampingReverse = false

ENT.WheelPhysicsMass = 100
ENT.WheelPhysicsInertia = Vector(10,8,10)
ENT.WheelPhysicsTireHeight = 4
ENT.WheelPhysicsMaterials = {
	[0] = "friction_00", -- 0
	[1] = "friction_10", --  0.1
	[2] = "friction_25", --  0.25
	[3] = "rubber",  --  0.8
	[4] = "rubber",
	[5] = "rubber",
	[6] = "rubber",
	[7] = "rubber",
	[8] = "rubber",
	[9] = "rubber",
	[10] = "jeeptire", --  1.337 -- i don't believe friction in havok can go above 1, however other settings such as bouncyness and elasticity are affected by it as it seems. We use jeeptire as default even tho it technically isn't the "best" choice, but rather the most common one
	[11] = "jalopytire", -- 1.337
	[12] = "phx_tire_normal", --  3
}

ENT.AutoReverseVelocity = 50

ENT.WheelBrakeLockupRPM = 20

ENT.WheelBrakeForce = 400

ENT.WheelSideForce = 800
ENT.WheelDownForce = 500

ENT.AllowSuperCharger = true
ENT.SuperChargerVolume = 0.6
ENT.SuperChargerSound = "lvs/vehicles/generic/supercharger_loop.wav"
ENT.SuperChargerVisible = true

ENT.AllowTurbo = true
ENT.TurboVolume = 0.6
ENT.TurboSound = "lvs/vehicles/generic/turbo_loop.wav"
ENT.TurboBlowOff = {"lvs/vehicles/generic/turbo_blowoff1.wav","lvs/vehicles/generic/turbo_blowoff2.wav"}

ENT.DeleteOnExplode = false

ENT.lvsAllowEngineTool = true
ENT.lvsShowInSpawner = false

function ENT:SetupDataTables()
	self:CreateBaseDT()

	self:AddDT( "Float", "Steer" )
	self:AddDT( "Float", "Throttle" )
	self:AddDT( "Float", "MaxThrottle" )
	self:AddDT( "Float", "Brake" )

	self:AddDT( "Float", "NWMaxSteer" )

	self:AddDT( "Float", "WheelVelocity" )

	self:AddDT( "Int", "NWGear" )
	self:AddDT( "Int", "TurnMode" )
	self:AddDT( "Int", "SirenMode" )

	self:AddDT( "Bool", "Reverse" )
	self:AddDT( "Bool", "NWHandBrake" )

	self:AddDT( "Bool", "RacingHud" )
	self:AddDT( "Bool", "Backfire" )

	self:AddDT( "Entity", "Engine" )
	self:AddDT( "Entity", "FuelTank" )
	self:AddDT( "Entity", "LightsHandler" )
	self:AddDT( "Entity", "Turbo" )
	self:AddDT( "Entity", "Compressor" )

	self:AddDT( "Vector", "AIAimVector" )

	self:TurretSystemDT()
	self:TrackSystemDT()

	if SERVER then
		self:SetMaxThrottle( 1 )
		self:SetSirenMode( -1 )
	end
end

function ENT:TurretSystemDT()
end

function ENT:TrackSystemDT()
end

function ENT:StabilityAssist()
	if self:GetReverse() then
		return self.PhysicsDampingReverse
	end

	return self.PhysicsDampingForward
end

function ENT:GetMaxSteerAngle()
	if CLIENT then return self:GetNWMaxSteer() end

	local EntTable = self:GetTable()

	if EntTable._WheelMaxSteerAngle then return EntTable._WheelMaxSteerAngle end

	local Cur = 0

	for _, Axle in pairs( EntTable._WheelAxleData ) do
		if not Axle.SteerAngle then continue end

		if Axle.SteerAngle > Cur then
			Cur = Axle.SteerAngle
		end
	end

	EntTable._WheelMaxSteerAngle = Cur

	self:SetNWMaxSteer( Cur )

	return Cur
end

function ENT:GetTargetVelocity()
	local Reverse = self:GetReverse()

	if self:IsManualTransmission() then
		local Gear = self:GetGear()
		local EntTable = self:GetTable()

		local NumGears = Reverse and EntTable.TransGearsReverse or EntTable.TransGears
		local MaxVelocity = Reverse and EntTable.MaxVelocityReverse or EntTable.MaxVelocity

		local GearedVelocity = math.min( (MaxVelocity / NumGears) * (Gear + 1), MaxVelocity )

		return GearedVelocity * (Reverse and -1 or 1)
	end

	if Reverse then
		return -self.MaxVelocityReverse
	end

	return self.MaxVelocity
end

function ENT:HasHighBeams()
	local EntTable = self:GetTable()

	if isbool( EntTable._HasHighBeams ) then return EntTable._HasHighBeams end

	if not istable( EntTable.Lights ) then return false end

	local HasHigh = false

	for _, data in pairs( EntTable.Lights ) do
		if not istable( data ) then continue end

		for id, typedata in pairs( data ) do
			if id == "Trigger" and typedata == "high" then
				HasHigh = true

				break
			end
		end
	end

	EntTable._HasHighBeams = HasHigh

	return HasHigh
end

function ENT:HasFogLights()
	local EntTable = self:GetTable()

	if isbool( EntTable._HasFogLights ) then return EntTable._HasFogLights end

	if not istable( EntTable.Lights ) then return false end

	local HasFog = false

	for _, data in pairs( EntTable.Lights ) do
		if not istable( data ) then continue end

		for id, typedata in pairs( data ) do
			if id == "Trigger" and typedata == "fog" then
				HasFog = true

				break
			end
		end
	end

	EntTable._HasFogLights = HasFog

	return HasFog
end

function ENT:HasTurnSignals()
	local EntTable = self:GetTable()

	if isbool( EntTable._HasTurnSignals ) then return EntTable._HasTurnSignals end

	if not istable( EntTable.Lights ) then return false end

	local HasTurnSignals = false

	for _, data in pairs( EntTable.Lights ) do
		if not istable( data ) then continue end

		for id, typedata in pairs( data ) do
			if id == "Trigger" and (typedata == "turnleft" or  typedata == "turnright" or typedata == "main+brake+turnleft" or typedata == "main+brake+turnright") then
				HasTurnSignals = true

				break
			end
		end
	end

	EntTable._HasTurnSignals = HasTurnSignals

	return HasTurnSignals
end

function ENT:GetGear()
	local Gear = self:GetNWGear()

	if Gear <= 0 then
		return -1
	end

	if self:GetReverse() then
		return math.Clamp( Gear, 1, self.TransGearsReverse )
	end

	return math.Clamp( Gear, 1, self.TransGears )
end

function ENT:IsManualTransmission()
	return self:GetNWGear() > 0
end

function ENT:BodygroupIsValid( name, groups )
	if not name or not istable( groups ) then return false end

	local EntTable = self:GetTable()

	local id = -1

	if EntTable._StoredBodyGroups then
		if EntTable._StoredBodyGroups[ name ] then
			id = EntTable._StoredBodyGroups[ name ]
		end
	else
		EntTable._StoredBodyGroups = {}
	end

	if id == -1 then
		for _, data in pairs( self:GetBodyGroups() ) do
			if data.name == name then
				id = data.id

				break
			end
		end
	end

	if id == -1 then return false end

	EntTable._StoredBodyGroups[ name ] = id

	local cur = self:GetBodygroup( id )

	for _, active in pairs( groups ) do
		if cur == active then return true end
	end

	return false
end

function ENT:GetWheelUp()
	return self:GetUp()
end

function ENT:GetVehicleType()
	return "car"
end

--PATH addons/lvs_cars_3027255911/lua/entities/lvs_item_transmission_manual.lua:
AddCSLuaFile()

ENT.Type            = "anim"

ENT.PrintName = "Transmission - Manual"
ENT.Author = "Luna"
ENT.Category = "[LVS]"

ENT.Spawnable		= true
ENT.AdminOnly		= false

if SERVER then
	function ENT:SpawnFunction( ply, tr, ClassName )
		if not tr.Hit then return end

		local ent = ents.Create( ClassName )
		ent:SetPos( tr.HitPos + tr.HitNormal * 5 )
		ent:Spawn()
		ent:Activate()

		return ent
	end

	function ENT:Initialize()	
		self:SetModel( "models/diggercars/manual.mdl" )
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:PhysWake()
	end

	function ENT:Think()
		return false
	end

	function ENT:PhysicsCollide( data )
		if self.MarkForRemove then return end

		local ent = data.HitEntity

		if not IsValid( ent ) or not ent.LVS or not isfunction( ent.EnableManualTransmission ) then return end

		if isfunction( ent.IsManualTransmission ) and ent:IsManualTransmission() then return end

		if ent:EnableManualTransmission() ~= false then
			ent:EmitSound("npc/dog/dog_rollover_servos1.wav")

			self.MarkForRemove = true

			SafeRemoveEntityDelayed( self, 0 )
		end
	end

	function ENT:OnTakeDamage( dmginfo )
	end

else
	function ENT:Draw( flags )
		self:DrawModel( flags )
	end
end

--PATH addons/lvs_cars_3027255911/lua/entities/lvs_tank_wheeldrive/shared.lua:

ENT.Base = "lvs_base_wheeldrive"

ENT.PrintName = "[LVS] Wheeldrive Tank"
ENT.Author = "Luna"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars"

ENT.Spawnable			= false
ENT.AdminSpawnable		= false

ENT.MaxHealthEngine = 400
ENT.MaxHealthFuelTank = 100

function ENT:TrackSystemDT()
	self:AddDT( "Entity", "TrackDriveWheelLeft" )
	self:AddDT( "Entity", "TrackDriveWheelRight" )
end

function ENT:GetVehicleType()
	return "tank"
end
--PATH addons/lvs_cars_3027255911/lua/entities/lvs_trailer_pak40/sh_turret.lua:

include("entities/lvs_tank_wheeldrive/modules/sh_turret.lua")
include("entities/lvs_tank_wheeldrive/modules/sh_turret_ballistics.lua")

ENT.TurretBallisticsProjectileVelocity = ENT.ProjectileVelocityArmorPiercing
ENT.TurretBallisticsMuzzleAttachment = "muzzle"
ENT.TurretBallisticsViewAttachment = "sight"

ENT.TurretAimRate = 15

ENT.TurretRotationSound = "common/null.wav"

ENT.TurretPitchPoseParameterName = "cannon_pitch"
ENT.TurretPitchMin = -10
ENT.TurretPitchMax = 6
ENT.TurretPitchMul = -0.75
ENT.TurretPitchOffset = -2

ENT.TurretYawPoseParameterName = "cannon_yaw"
ENT.TurretYawMin = -10
ENT.TurretYawMax = 10
ENT.TurretYawMul = -1
ENT.TurretYawOffset = 0
--PATH addons/lvs_cars_3027255911/lua/entities/lvs_wheeldrive_attachment_follower.lua:
AddCSLuaFile()

ENT.Type            = "anim"
ENT.DoNotDuplicate = true

function ENT:SetupDataTables()
	self:NetworkVar( "Entity",0, "Base" )
	self:NetworkVar( "Entity",1, "Master" )
end

function ENT:GetMins()
	return self:OBBMins()
end

function ENT:GetMaxs()
	return self:OBBMaxs()
end

if SERVER then
	function ENT:SetFollowAttachment( id )
		self._attidFollow = id
	end

	function ENT:Initialize()
		self:SetUseType( SIMPLE_USE )
		self:PhysicsInit( SOLID_VPHYSICS )
		self:AddEFlags( EFL_NO_PHYSCANNON_INTERACTION )

		-- this is so vj npcs can still see us
		self:AddEFlags( EFL_DONTBLOCKLOS )

		self:DrawShadow( false )

		self:SetMaterial( "models/wireframe" )

		local PhysObj = self:GetPhysicsObject()

		if not IsValid( PhysObj ) then return end

		PhysObj:SetMass( 1 )
		PhysObj:EnableDrag( false )
		PhysObj:EnableGravity( false ) 
		PhysObj:EnableMotion( true )

		timer.Simple( 0, function()
			if not IsValid( self ) or not self.GetBase then return end

			local Base = self:GetBase()

			if not IsValid( Base ) or not Base.GetWheels then return end

			for _, Wheel in pairs( Base:GetWheels() ) do
				if not IsValid( Wheel ) then continue end

				local nocollide_constraint = constraint.NoCollide(self,Wheel,0,0)
				nocollide_constraint.DoNotDuplicate = true
			end
		end )
	end

	function ENT:Think()
		local T = CurTime()

		self:NextThink( T )

		local Base = self:GetBase()
		local Master = self:GetMaster()

		if not self._attidFollow or not IsValid( Base ) or not IsValid( Master ) then return true end

		local PhysObj = Master:GetPhysicsObject()

		if not IsValid( PhysObj ) then return true end

		if PhysObj:IsMotionEnabled() then PhysObj:EnableMotion( false ) end

		local att = Base:GetAttachment( self._attidFollow )

		if not att then self:NextThink( T + 1 ) return true end

		local OldAng = Master:GetAngles()
		local NewAng = att.Ang

		if OldAng ~= NewAng then
			Master:SetAngles( att.Ang )
			self:PhysWake()
		end

		return true
	end

	function ENT:OnHealthChanged( dmginfo, old, new )
	end

	function ENT:OnRepaired()
	end

	function ENT:OnDestroyed( dmginfo )
	end

	function ENT:OnTakeDamage( dmginfo )
		local base = self:GetBase()

		if not IsValid( base ) then return end

		local OldTotalHealth = 0
		local NewTotalHealth = 0
		local CallDestroyed = false

		local children = self:GetChildren()

		for _, entity in pairs( children ) do
			if entity:GetClass() ~= "lvs_armor" then continue end

			OldTotalHealth = OldTotalHealth + entity:GetHP()

			if entity._IsRepairFunctionTagged then continue end

			entity._IsRepairFunctionTagged = true

			local OldOnRepaired = entity.OnRepaired

			entity.OnRepaired = function( ent )
				if IsValid( self ) then
					self:OnRepaired()
				end

				OldOnRepaired( ent )
			end
		end

		base:OnTakeDamage( dmginfo )

		for _, entity in pairs( children ) do
			if entity:GetClass() ~= "lvs_armor" then continue end

			local HP = entity:GetHP()

			NewTotalHealth = NewTotalHealth + HP

			if HP > 0 then continue end

			CallDestroyed = true
		end

		self:OnHealthChanged( dmginfo, OldTotalHealth, NewTotalHealth )

		if CallDestroyed then
			self:OnDestroyed( dmginfo )
		end
	end

	function ENT:PhysicsCollide( data, phys )
		local base = self:GetBase()

		if not IsValid( base ) then return end

		base:PhysicsCollide( data, phys )
	end

	function ENT:Use( ply )
		if (ply._lvsNextUse or 0) > CurTime() then return end

		local base = self:GetBase()

		if not IsValid( base ) then return end

		base:Use( ply )
	end

	function ENT:OnRemove()
	end

	return
end

function ENT:Initialize()
end

function ENT:OnRemove()
end

function ENT:Draw()
	if not LVS.DeveloperEnabled then return end

	self:DrawModel()
end

--PATH addons/lvs_cars_3027255911/lua/entities/lvs_wheeldrive_ferrari360/shared.lua:

ENT.Base = "lvs_base_wheeldrive"

ENT.PrintName = "Ferrari 360"
ENT.Author = "Digger"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars - Pack"

ENT.VehicleCategory = "Cars"
ENT.VehicleSubCategory = "Civilian"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/ferrari_360/ferrari_360.mdl"

ENT.MaxVelocity = 2900

ENT.EngineTorque = 120
ENT.EngineIdleRPM = 750
ENT.EngineMaxRPM = 10000

ENT.TransGears = 6
ENT.TransGearsReverse = 1
ENT.TransMinGearHoldTime = 1
ENT.TransShiftSpeed = 0.2
ENT.TransWobble = 50
ENT.TransWobbleTime = 2.5
ENT.TransWobbleFrequencyMultiplier = 1.5

ENT.PhysicsMass = 1000

ENT.WheelPhysicsMass = 100

ENT.ForceLinearMultiplier = 1.5 -- multiply all linear forces (such as downforce, wheel side force, ect)
ENT.ForceAngleMultiplier = 0.75 -- multiply all angular forces such turn stability / inertia. Exception: Wheel/Engine torque. Those remain unchanged.

ENT.RandomColor = {
	Color(10,12,19),
	Color(101,3,0),
	Color(10,10,10),
	Color(101,126,169),
	Color(85,85,85),
	Color(255,191,0),
	Color(14,32,14),
	Color(6,10,51),
	Color(200,200,200),
}

ENT.HornSound = "lvs/horn2.wav"
ENT.HornPos = Vector(40,0,35)

ENT.EngineSounds = {
	{
		sound = "lvs/vehicles/ferrari_365/eng_idle_loop.wav",
		Volume = 1,
		Pitch = 110,
		PitchMul = 25,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_IDLE_ONLY,
	},
	{
		sound = "lvs/vehicles/ferrari_360/eng_loop.wav",
		Volume = 1,
		Pitch = 80,
		PitchMul = 160,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_REV_UP,
		UseDoppler = true,
	},
	{
		sound = "lvs/vehicles/dodge_charger/eng_revdown_loop.wav",
		Volume = 1,
		Pitch = 80,
		PitchMul = 160,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_REV_DOWN,
		UseDoppler = true,
	},
}

ENT.ExhaustPositions = {
	{
		pos = Vector(-83.75,27.98,15.85),
		ang = Angle(0,180,0),
	},
	{
		pos = Vector(-83.75,-27.98,15.85),
		ang = Angle(0,180,0),
	},
	{
		pos = Vector(-84.53,24.9,15.9),
		ang = Angle(0,180,0),
	},
	{
		pos = Vector(-84.53,-24.9,15.9),
		ang = Angle(0,180,0),
	}
}


ENT.Lights = {
	{
		Trigger = "main",
		SubMaterialID = 19,
		SubMaterialBrightness = 10,
		Sprites = {
			{ pos = Vector(68.79,27.62,24.73), colorB = 200, colorA = 150, width = 60, height = 60 },
			{ pos = Vector(68.79,-27.62,24.73), colorB = 200, colorA = 150, width = 60, height = 60 },
		},
		ProjectedTextures = {
			{ pos = Vector(68.79,27.62,24.73), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
			{ pos = Vector(68.79,-27.62,24.73), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
		},
	},
	{
		Trigger = "main",
		SubMaterialID = 11,
	},

	{
		Trigger = "main+brake",
		SubMaterialID = 26,
		SubMaterialBrightness = 10,
		Sprites = {
			{ pos = Vector(-80.84,-28.92,29.18), colorG = 0, colorB = 0, colorA = 150, width = 30, height = 30, bodygroup = { name = "taillight_right", active = { 0 } }, },
			{ pos = Vector(-83.74,-21.58,29.21), colorG = 0, colorB = 0, colorA = 150, width = 30, height = 30, bodygroup = { name = "taillight_right", active = { 0 } }, },
			{ pos = Vector(-80.84,28.92,29.18), colorG = 0, colorB = 0, colorA = 150, width = 30, height = 30, bodygroup = { name = "taillight_left", active = { 0 } }, },
			{ pos = Vector(-83.74,21.58,29.21), colorG = 0, colorB = 0, colorA = 150, width = 30, height = 30, bodygroup = { name = "taillight_left", active = { 0 } }, },
		},
	},

	{
		Trigger = "brake",
		SubMaterialID = 22,
	},
	{
		Trigger = "high",
		SubMaterialID = 18,
		Sprites = {
			{ pos = Vector(69.67,-22.81,23.56), colorB = 200, colorA = 150 },
			{ pos = Vector(69.67,22.81,23.56), colorB = 200, colorA = 150 },
		},
		ProjectedTextures = {
			{ pos = Vector(69.67,-22.81,23.56), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
			{ pos = Vector(69.67,22.81,23.56), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
		},
	},
	{
		Trigger = "fog",
		SubMaterialID = 17,
		Sprites = {
			{ pos = Vector(66.28,-30.36,26.76), colorB = 200, colorA = 150 },
			{ pos = Vector(66.28,30.36,26.76), colorB = 200, colorA = 150 },
		},
	},

	{
		Trigger = "reverse",
		SubMaterialID = 27,
		SubMaterialBrightness = 25,
		Sprites = {

			{ pos = Vector(-83.74,-21.58,29.21), height = 25, width = 25, colorA = 150, bodygroup = { name = "taillight_right", active = { 0 } }, },
			{ pos = Vector(-83.74,21.58,29.21), height = 25, width = 25, colorA = 150, bodygroup = { name = "taillight_left", active = { 0 } }, },

		}
	},
	{
		Trigger = "turnright",
		SubMaterialID = 9,
		SubMaterialBrightness = 25,
		Sprites = {
			{ pos = Vector(-80.84,-28.92,29.18), colorG = 100, colorB = 0, colorA = 50, bodygroup = { name = "taillight_right", active = { 0 } }, },
			{ width = 45, height = 45, pos = Vector(32.37,-38.62,22.49), colorG = 100, colorB = 0, colorA = 50 },
			{ width = 25, height = 25, pos = Vector(65.54,-32.72,25.08), colorG = 100, colorB = 0, colorA = 50 },
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 8,
		SubMaterialBrightness = 25,
		Sprites = {
			{ pos = Vector(-80.84,28.92,29.18), colorG = 100, colorB = 0, colorA = 50, bodygroup = { name = "taillight_left", active = { 0 } }, },
			{ width = 45, height = 45, pos = Vector(32.37,38.62,22.49), colorG = 100, colorB = 0, colorA = 50 },
			{ width = 25, height = 25, pos = Vector(65.54,32.72,25.08), colorG = 100, colorB = 0, colorA = 50 },
		},
	},
}


--PATH addons/lvs_cars_3027255911/lua/entities/lvs_wheeldrive_sdkfz250/shared.lua:

ENT.Base = "lvs_tank_wheeldrive"

ENT.PrintName = "Schuetzenpanzerwagen"
ENT.Author = "Luna"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars"

ENT.VehicleCategory = "Cars"
ENT.VehicleSubCategory = "Armored"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/sdkfz250/2501.mdl"
ENT.MDL_DESTROYED = "models/diggercars/sdkfz250/250_dead.mdl"

ENT.AITEAM = 1

ENT.DSArmorIgnoreForce = 1000

ENT.MaxHealth = 650
ENT.MaxHealthEngine = 400
ENT.MaxHealthFuelTank = 100

--damage system
ENT.CannonArmorPenetration = 2700

ENT.MaxVelocity = 700
ENT.MaxVelocityReverse = 250

ENT.EngineCurve = 0.7
ENT.EngineTorque = 100

ENT.PhysicsWeightScale = 1.5
ENT.PhysicsInertia = Vector(2500,2500,850)

ENT.TransGears = 3
ENT.TransGearsReverse = 1

ENT.lvsShowInSpawner = true

ENT.HornSound = "lvs/horn1.wav"
ENT.HornPos = Vector(70,0,40)

ENT.EngineSounds = {
	{
		sound = "lvs/vehicles/sdkfz250/eng_idle_loop.wav",
		Volume = 0.5,
		Pitch = 85,
		PitchMul = 25,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_IDLE_ONLY,
	},
	{
		sound = "lvs/vehicles/sdkfz250/eng_loop.wav",
		Volume = 1,
		Pitch = 20,
		PitchMul = 100,
		SoundLevel = 85,
		SoundType = LVS.SOUNDTYPE_REV_UP,
		UseDoppler = true,
	},
	{
		sound = "lvs/vehicles/sdkfz250/eng_revdown_loop.wav",
		Volume = 1,
		Pitch = 20,
		PitchMul = 100,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_REV_DOWN,
		UseDoppler = true,
	},
}

ENT.ExhaustPositions = {
	{
		pos = Vector(35.31,39.22,26.35),
		ang = Angle(0,90,0),
	},
}

function ENT:OnSetupDataTables()
	self:AddDT( "Entity", "FrontGunnerSeat" )
	self:AddDT( "Entity", "RearGunnerSeat" )
	self:AddDT( "Bool", "UseHighExplosive" )
end

function ENT:InitWeapons()
	self:AddGunnerWeapons()
	self:AddTopGunnerWeapons()
end


function ENT:GunnerInRange( Dir )
	return self:AngleBetweenNormal( self:GetForward(), Dir ) < 35
end

function ENT:AddGunnerWeapons()
	local COLOR_RED = Color(255,0,0,255)
	local COLOR_WHITE = Color(255,255,255,255)

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/mg.png")
	weapon.Ammo = 1000
	weapon.Delay = 0.1
	weapon.HeatRateUp = 0.2
	weapon.HeatRateDown = 0.25
	weapon.Attack = function( ent )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		if not base:GunnerInRange( ent:GetAimVector() ) then

			if not IsValid( base.SNDTurretMGf ) then return true end

			base.SNDTurretMGf:Stop()
	
			return true
		end

		local ID = base:LookupAttachment( "f_muzzle" )

		local Muzzle = base:GetAttachment( ID )

		if not Muzzle then return end

		local bullet = {}
		bullet.Src 	= Muzzle.Pos
		bullet.Dir 	= (ent:GetEyeTrace().HitPos - bullet.Src):GetNormalized()
		bullet.Spread = Vector(0.01,0.01,0.01)
		bullet.TracerName = "lvs_tracer_yellow_small"
		bullet.Force	= 10
		bullet.EnableBallistics = true
		bullet.HullSize 	= 0
		bullet.Damage	= 25
		bullet.Velocity = 15000
		bullet.Attacker 	= ent:GetDriver()
		ent:LVSFireBullet( bullet )

		local effectdata = EffectData()
		effectdata:SetOrigin( bullet.Src )
		effectdata:SetNormal( Muzzle.Ang:Forward() )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle", effectdata )

		ent:TakeAmmo( 1 )

		base:PlayAnimation( "shot_f" )

		if not IsValid( base.SNDTurretMGf ) then return end

		base.SNDTurretMGf:Play()
	end
	weapon.StartAttack = function( ent )
		local base = ent:GetVehicle()

		if not IsValid( base ) or not IsValid( base.SNDTurretMGf ) then return end

		base.SNDTurretMGf:Play()
	end
	weapon.FinishAttack = function( ent )
		local base = ent:GetVehicle()

		if not IsValid( base ) or not IsValid( base.SNDTurretMGf ) then return end

		base.SNDTurretMGf:Stop()
	end
	weapon.OnThink = function( ent, active )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		if not ent:GetAI() and not IsValid( ent:GetDriver() ) then
			base:SetPoseParameter("f_pitch",  15 )
			base:SetPoseParameter("f_yaw", 0 )

			return
		end

		local Angles = base:WorldToLocalAngles( ent:GetAimVector():Angle() )
		Angles:Normalize()

		base:SetPoseParameter("f_yaw", -Angles.y )
		base:SetPoseParameter("f_pitch",  -Angles.p )
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		local Pos2D = ent:GetEyeTrace().HitPos:ToScreen()

		local Col =  base:GunnerInRange( ent:GetAimVector() ) and COLOR_WHITE or COLOR_RED

		base:PaintCrosshairCenter( Pos2D, Col )
		base:LVSPaintHitMarker( Pos2D )
	end
	weapon.OnOverheat = function( ent )
		ent:EmitSound("lvs/overheat.wav")
	end
	self:AddWeapon( weapon, 2 )
end

function ENT:TopGunnerInRange( ent )
	local AimPos = ent:GetEyeTrace().HitPos
	local AimAng = (AimPos - self:LocalToWorld( Vector(-72.27,0.06,66.07) )):Angle()

	local _, Ang = WorldToLocal( AimPos, AimAng, Vector(-72.27,0,66), self:LocalToWorldAngles( Angle(0,180,0) ) )

	return math.abs( Ang.y ) < 35 and Ang.p < 10 and Ang.p > -80
end

function ENT:AddTopGunnerWeapons()
	local COLOR_RED = Color(255,0,0,255)
	local COLOR_WHITE = Color(255,255,255,255)

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/mg.png")
	weapon.Ammo = 1000
	weapon.Delay = 0.1
	weapon.HeatRateUp = 0.2
	weapon.HeatRateDown = 0.25
	weapon.Attack = function( ent )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		if not base:TopGunnerInRange( ent ) then

			if not IsValid( base.SNDTurretMGt ) then return true end

			base.SNDTurretMGt:Stop()
	
			return true
		end

		local ID = base:LookupAttachment( "r_muzzle" )

		local Muzzle = base:GetAttachment( ID )

		if not Muzzle then return end

		local bullet = {}
		bullet.Src 	= Muzzle.Pos
		bullet.Dir 	= (ent:GetEyeTrace().HitPos - bullet.Src):GetNormalized()
		bullet.Spread = Vector(0.01,0.01,0.01)
		bullet.TracerName = "lvs_tracer_yellow_small"
		bullet.Force	= 10
		bullet.EnableBallistics = true
		bullet.HullSize 	= 0
		bullet.Damage	= 25
		bullet.Velocity = 15000
		bullet.Attacker 	= ent:GetDriver()
		ent:LVSFireBullet( bullet )

		local effectdata = EffectData()
		effectdata:SetOrigin( bullet.Src )
		effectdata:SetNormal( Muzzle.Ang:Forward() )
		effectdata:SetEntity( ent )
		util.Effect( "lvs_muzzle", effectdata )

		ent:TakeAmmo( 1 )

		base:PlayAnimation( "shot_r" )

		if not IsValid( base.SNDTurretMGt ) then return end

		base.SNDTurretMGt:Play()
	end
	weapon.StartAttack = function( ent )
		local base = ent:GetVehicle()

		if not IsValid( base ) or not IsValid( base.SNDTurretMGt ) then return end

		base.SNDTurretMGt:Play()
	end
	weapon.FinishAttack = function( ent )
		local base = ent:GetVehicle()

		if not IsValid( base ) or not IsValid( base.SNDTurretMGt ) then return end

		base.SNDTurretMGt:Stop()
	end
	weapon.OnThink = function( ent, active )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		if not ent:GetAI() and not IsValid( ent:GetDriver() ) then
			base:SetPoseParameter("r_pitch",  80 )
			base:SetPoseParameter("r_yaw", 0 )

			return
		end

		local AimPos = ent:GetEyeTrace().HitPos
		local AimAng = (AimPos - base:LocalToWorld( Vector(-72.27,0.06,66.07) )):Angle()

		local Pos, Ang = WorldToLocal( AimPos, AimAng, Vector(-72.27,0,66), base:LocalToWorldAngles( Angle(0,180,0) ) )

		base:SetPoseParameter("r_pitch",  -Ang.p )
		base:SetPoseParameter("r_yaw", -Ang.y )
	end
	weapon.HudPaint = function( ent, X, Y, ply )
		local base = ent:GetVehicle()

		if not IsValid( base ) then return end

		local Pos2D = ent:GetEyeTrace().HitPos:ToScreen()

		local Col = base:TopGunnerInRange( ent ) and COLOR_WHITE or COLOR_RED

		base:PaintCrosshairCenter( Pos2D, Col )
		base:LVSPaintHitMarker( Pos2D )
	end
	weapon.OnOverheat = function( ent )
		ent:EmitSound("lvs/overheat.wav")
	end
	self:AddWeapon( weapon, 3 )
end


function ENT:CalcMainActivityPassenger( ply )
	local FrontGunnerSeat = self:GetFrontGunnerSeat()
	local RearGunnerSeat = self:GetRearGunnerSeat()

	if not IsValid( FrontGunnerSeat ) or not IsValid( RearGunnerSeat ) then return end

	if FrontGunnerSeat:GetDriver() ~= ply and RearGunnerSeat:GetDriver() ~= ply then return end

	if ply.m_bWasNoclipping then 
		ply.m_bWasNoclipping = nil 
		ply:AnimResetGestureSlot( GESTURE_SLOT_CUSTOM ) 
		
		if CLIENT then 
			ply:SetIK( true )
		end 
	end 

	ply.CalcIdeal = ACT_STAND
	ply.CalcSeqOverride = ply:LookupSequence( "cwalk_revolver" )

	return ply.CalcIdeal, ply.CalcSeqOverride
end

function ENT:UpdateAnimation( ply, velocity, maxseqgroundspeed )
	ply:SetPlaybackRate( 1 )

	if CLIENT then
		local FrontGunnerSeat = self:GetFrontGunnerSeat()
		local RearGunnerSeat = self:GetRearGunnerSeat()

		if ply == self:GetDriver() then
			ply:SetPoseParameter( "vehicle_steer", self:GetSteer() /  self:GetMaxSteerAngle() )
			ply:InvalidateBoneCache()
		end

		if IsValid( FrontGunnerSeat ) and FrontGunnerSeat:GetDriver() == ply then
			local Pitch = math.Remap( self:GetPoseParameter( "f_pitch" ),0,1,-15,15)
			local Yaw = math.Remap( self:GetPoseParameter( "f_yaw" ),0,1,-35,35) 

			ply:SetPoseParameter( "aim_pitch", Pitch * 1.5 )
			ply:SetPoseParameter( "aim_yaw", Yaw * 1.5 )

			ply:SetPoseParameter( "head_pitch", -Pitch * 2 )
			ply:SetPoseParameter( "head_yaw", -Yaw * 3 )

			ply:SetPoseParameter( "move_x", 0 )
			ply:SetPoseParameter( "move_y", 0 )

			ply:InvalidateBoneCache()
		end

		if IsValid( RearGunnerSeat ) and RearGunnerSeat:GetDriver() == ply then
			local Pitch = math.Remap( self:GetPoseParameter( "r_pitch" ),0,1,-15,15)
			local Yaw = math.Remap( self:GetPoseParameter( "r_yaw" ),0,1,-35,35) 

			ply:SetPoseParameter( "aim_pitch", Pitch * 3 - 10 )
			ply:SetPoseParameter( "aim_yaw", Yaw * 1.5 )

			ply:SetPoseParameter( "head_pitch", -Pitch * 2 )
			ply:SetPoseParameter( "head_yaw", -Yaw * 3 )

			ply:SetPoseParameter( "move_x", 0 )
			ply:SetPoseParameter( "move_y", 0 )

			ply:InvalidateBoneCache()
		end

		GAMEMODE:GrabEarAnimation( ply )
		GAMEMODE:MouthMoveAnimation( ply )
	end

	return false
end


--PATH addons/lvs_cars_3027255911/lua/entities/lvs_wheeldrive_sdkfz250/cl_tankview.lua:

include("entities/lvs_tank_wheeldrive/modules/cl_tankview.lua")

function ENT:TankViewOverride( ply, pos, angles, fov, pod )
	if pod == self:GetFrontGunnerSeat() and not pod:GetThirdPersonMode() then
		local ID = self:LookupAttachment( "f_eye" )

		local Muzzle = self:GetAttachment( ID )

		if Muzzle then
			pos =  Muzzle.Pos
		end
	end

	if pod == self:GetRearGunnerSeat() and not pod:GetThirdPersonMode() then
		local ID = self:LookupAttachment( "r_eye" )

		local Muzzle = self:GetAttachment( ID )

		if Muzzle then
			pos =  Muzzle.Pos
		end
	end

	return pos, angles, fov
end
--PATH addons/lvs_cars_3027255911/lua/entities/lvs_wheeldrive_steerhandler.lua:
AddCSLuaFile()

ENT.Type            = "anim"
ENT.DoNotDuplicate = true

if SERVER then
	function ENT:Initialize()	
		self:SetModel( "models/dav0r/hoverball.mdl" )
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetRenderMode( RENDERMODE_TRANSALPHA )
		self:AddFlags( FL_OBJECT )

		local PObj = self:GetPhysicsObject()

		if not IsValid( PObj ) then 
			self:Remove()

			return
		end

		PObj:SetMass( 1 )
		PObj:EnableMotion( false )
		PObj:EnableDrag( false )

		self:SetNotSolid( true )
		self:SetColor( Color( 255, 255, 255, 0 ) ) 
		self:SetRenderMode( RENDERMODE_TRANSALPHA )
		self:DrawShadow( false )
	end

	function ENT:Think()
		return false
	end

	return
end

function ENT:Think()
	return false
end

function ENT:Draw()
end

--PATH addons/lvs_cars_3027255911/lua/entities/lvs_wheeldrive_template/shared.lua:

ENT.Base = "lvs_base_wheeldrive"

ENT.PrintName = "template script"
ENT.Author = "*your name*"
ENT.Information = ""
ENT.Category = "[LVS] *your category*"

ENT.Spawnable			= false -- set to "true" to make it spawnable
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 40 -- spawn normal offset, raise to prevent spawning into the ground
--ENT.SpawnNormalOffsetSpawner = 0 -- offset for ai vehicle spawner

ENT.MDL = "models/props_interiors/Furniture_Couch02a.mdl"
--ENT.MDL_DESTROYED = "models/props_interiors/Furniture_Couch02a.mdl"
--[[
ENT.GibModels = {
	"models/gibs/manhack_gib01.mdl",
	"models/gibs/manhack_gib02.mdl",
	"models/gibs/manhack_gib03.mdl",
	"models/gibs/manhack_gib04.mdl",
	"models/props_c17/canisterchunk01a.mdl",
	"models/props_c17/canisterchunk01d.mdl",
	"models/props_c17/oildrumchunk01a.mdl",
	"models/props_c17/oildrumchunk01b.mdl",
	"models/props_c17/oildrumchunk01c.mdl",
	"models/props_c17/oildrumchunk01d.mdl",
	"models/props_c17/oildrumchunk01e.mdl",
}
]]

ENT.AITEAM = 1
--[[
TEAMS:
	0 = FRIENDLY TO EVERYONE
	1 = FRIENDLY TO TEAM 1 and 0
	2 = FRIENDLY TO TEAM 2 and 0
	3 = HOSTILE TO EVERYONE
]]

ENT.MaxHealth = 400 -- max health
--ENT.MaxHealthEngine = 100 -- max health engine
--ENT.MaxHealthFuelTank = 100 -- max health fuel tank

--ENT.DSArmorDamageReduction = 0.1 -- damage reduction multiplier. Damage is clamped to a minimum of 1 tho
--ENT.DSArmorDamageReductionType = DMG_BULLET + DMG_CLUB -- which damage type to damage reduce

--ENT.DSArmorIgnoreDamageType = DMG_SONIC -- ignore this damage type completely
--ENT.DSArmorIgnoreForce = 1000 -- add general immunity against small firearms, 1000 = 10mm armor thickness
--ENT.DSArmorBulletPenetrationAdd = 250 -- changes how far bullets can cheat through the body to hit critical hitpoints and armor


--[[
PLEASE READ:
	Ideally you only need change:

	ENT.MaxVelocity -- to change top speed
	ENT.EngineTorque -- to change acceleration speed
	ENT.EngineIdleRPM -- optional: only used for rpm gauge. This will NOT change engine sound.
	ENT.EngineMaxRPM -- optional: only used for rpm gauge. This will NOT change engine sound.

	ENT.TransGears -- in a sane range based on maxvelocity. Dont set 10 gears for a car that only does 10kmh this will sound like garbage. Ideally use a total of 3 - 6 gears

	I recommend keeping everything else at default settings.
	(leave them commented-out or remove them from this script)
]]

ENT.MaxVelocity = 1400 -- max velocity in forward direction in gmod-units/second
--ENT.MaxVelocityReverse = 700 -- max velocity in reverse

--ENT.EngineCurve = 0.65 -- value goes from 0 to 1. Get into a car and type "developer 1" into the console to see the current engine curve
--ENT.EngineCurveBoostLow = 1 -- first gear torque boost multiplier
ENT.EngineTorque = 150
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

--ENT.ThrottleRate = 3.5 -- modify the throttle update rate, see it as the speed with which you push the pedal

--ENT.ForceLinearMultiplier = 1 -- multiply all linear forces (such as downforce, wheel side force, ect)
--ENT.ForceAngleMultiplier = 0.5 -- multiply all angular forces such turn stability / inertia. Exception: Wheel/Engine torque. Those remain unchanged.

ENT.TransGears = 4 -- amount of gears in forward direction. NOTE: the engine sound system calculates the  gear ratios based on topspeed and amount of gears. This can not be changed.
--ENT.TransGearsReverse = 1 -- amount of gears in reverse direction
--ENT.TransMinGearHoldTime = 1 -- minimum time the vehicle should stay in a gear before allowing it to shift again.
--ENT.TransShiftSpeed = 0.3 -- in seconds. How fast the transmission handles a shift. The transmission mimics a manual shift by applying clutch, letting off throttle, releasing clutch and applying throttle again even tho it is automatic.
--ENT.TransWobble = 40 -- basically how much "play" is in the drivedrain. 
--ENT.TransWobbleTime = 1.5 -- in seconds. How long after a shift or after applying throttle the engine will wobble up and down in rpm
--ENT.TransWobbleFrequencyMultiplier = 1 -- changes the frequency of the wobble
--ENT.TransShiftSound = "lvs/vehicles/generic/gear_shift.wav"  change gear shift sound

--ENT.SteerSpeed = 3 -- steer speed
--ENT.SteerReturnSpeed = 10 -- steer return speed to neutral steer

--ENT.FastSteerActiveVelocity = 500 -- at which velocity the steering will clamp the steer angle
--ENT.FastSteerAngleClamp = 10 -- to which the steering angle is clamped to when speed is above ENT.FastSteerActiveVelocity
--ENT.FastSteerDeactivationDriftAngle = 7 -- allowed drift angle until ENT.FastSteerActiveVelocity is ignored and the steering becomes unclamped

--ENT.SteerAssistDeadZoneAngle = 1 -- changes how much drift the counter steer system allows before interfering. 1 = 1� of drift without interfering
--ENT.SteerAssistMaxAngle = 15 -- max steering angle the counter steer system is allowed to help the player
--ENT.SteerAssistExponent = 1.5 -- an exponent to the counter steering curve. Just leave it at 1.5
--ENT.SteerAssistMultiplier = 3 -- how "quick" the counter steer system is steering

--ENT.MouseSteerAngle = 20 -- smaller value = more direct steer   bigger value = smoother steer, just leave it at 20
--ENT.MouseSteerExponent = 2 -- just leave it at 2. Fixes wobble.

--ENT.PhysicsWeightScale = 1 -- this is the value you need to change in order to make a vehicle feel heavier. Just leave it at 1 unless you really need to change it
--ENT.PhysicsMass = 1000 -- do not mess with this unless you can balance everything yourself again.
--ENT.PhysicsInertia = Vector(1500,1500,750) -- do not mess with this unless you can balance everything yourself again.
--ENT.PhysicsDampingSpeed = 4000 -- do not mess with this unless you can balance everything yourself again.

--ENT.PhysicsDampingForward = true -- internal physics damping to reduce wobble. Just keep it enabled in forward direction.
--ENT.PhysicsDampingReverse = false -- disabling this in reverse allows for a reverse 180� turn. If you want to go fast in reverse you should set this to true in order to get good stability

--ENT.WheelPhysicsMass = 100 -- do not mess with this unless you can balance everything yourself again.
--ENT.WheelPhysicsInertia = Vector(10,8,10) -- do not mess with this unless you can balance everything yourself again.
--ENT.WheelPhysicsTireHeight = 4 -- changes the tire height. If tire is blown the wheel sink this amount into the ground. Set to 0 to disable tire damage
--[[
-- physics friction lookup table. The default used one is 10, jeeptire
ENT.WheelPhysicsMaterials = {
	[0] = "friction_00", -- 0
	[1] = "friction_10", --  0.1
	[2] = "friction_25", --  0.25
	[3] = "popcan", --  0.3
	[4] = "glassbottle", --  0.4
	[5] = "glass", --  0.5
	[6] = "snow", --  0.6
	[7] = "roller", --  0.7
	[8] = "rubber", --  0.8
	[9] = "slime", --  0.9
	[10] = "jeeptire", --  1.337 -- i don't believe friction in havok can go above 1, however other settings such as bouncyness and elasticity are affected by it as it seems. We use jeeptire as default even tho it technically isn't the "best" choice, but rather the most common one
	[11] = "jalopytire", -- 1.337
	[12] = "phx_tire_normal", --  3
}
]]

--ENT.AutoReverseVelocity = 50 -- below this velocity the transmission is allowed to automatically shift into reverse when holding the brake button

--ENT.WheelBrakeLockupRPM = 20 -- below this wheel rpm it will engage the auto brake when the throttle is 0

--ENT.WheelBrakeForce = 400 -- how strong the brakes are. Just leave at 400. Allows for good braking while still allowing some turning. It has some build in ABS but it isnt perfect because even tho velocities say it isnt sliding the wheel will still visually slide in source...

--ENT.WheelSideForce = 800 -- basically a sideways cheatforce that gives you better stability in turns. You shouldn't have to edit this.
--ENT.WheelDownForce = 500 -- wheels use jeeptire as physprop. To this a downward force is applied to increase traction. You shouldn't have to edit this.

--ENT.AllowSuperCharger = true -- allow this vehicle to equip a supercharger?
--ENT.SuperChargerVolume = 1 -- change superchager sound volume
--ENT.SuperChargerSound = "lvs/vehicles/generic/supercharger_loop.wav" -- change supercharger sound file

--ENT.AllowTurbo = true -- allow this vehilce to equip a turbocharger?
--ENT.TurboVolume = 1 -- change turbocharger sound volume
--ENT.TurboSound = "lvs/vehicles/generic/turbo_loop.wav" -- change turbo sound file
--ENT.TurboBlowOff = {"lvs/vehicles/generic/turbo_blowoff1.wav","lvs/vehicles/generic/turbo_blowoff1.wav"} -- change blowoff sound. If you only have one file you can just pass it as a string instead of a table.

--ENT.DeleteOnExplode = false -- remove the vehicle when it explodes?

--ENT.lvsAllowEngineTool = true -- alow the engine tool to be used on this vehicle?
--ENT.lvsShowInSpawner = false -- show this vehicle in vehicle spawner entity?

 --[[
--ENT.RandomColor = {} -- table with colors to set on spawn
	-- accepts colors and skin+color combo:

	-- example variant1:
	ENT.RandomColor = {
		Color(255,255,255),
		Color(255,255,255),
		Color(255,255,255),
		Color(255,255,255),
		Color(255,255,255),
		Color(255,255,255),
	}


	-- example variant2:
	ENT.RandomColor = {
		{
			Skin = 1,
			Color = Color(255,255,255),
			BodyGroups = {
				[1] = 3, -- set bodygroup 1 to 3
				[5] = 7, -- set bodygroup 5 to 7
			},
		},
		{
			Skin = 2,
			Color = Color(255,255,255),
		},
		{
			Skin = 3,
			Color = Color(255,255,255),
		},
		{
			Skin = 4,
			Color = Color(255,255,255),
		},
		{
			Skin = 5,
			Color = Color(255,255,255),
		},
		{
			Skin = 6,
			Color = Color(255,255,255),
			Wheels = {  -- can also color wheels in this variant
				Skin = 0,
				Color = Color(255,255,0),
			},
		},
	}
 ]]
 
--ENT.HornSound = "lvs/horn2.wav" add a horn sound
--ENT.HornSoundInterior = "lvs/horn2.wav" -- leave it commented out, that way it uses the same as ENT.HornSound
--ENT.HornPos = Vector(40,0,35) -- horn sound position
 
 
--[[weapons]]
function ENT:InitWeapons()
	-- add a weapon:

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/bullet.png")

	-- overheat system:
	weapon.Ammo = 1000
	weapon.Delay = 0.1
	weapon.HeatRateUp = 0.2
	weapon.HeatRateDown = 0.25

	-- clip system example:
	--[[
	weapon.Clip = 20
	weapon.Ammo = 60
	weapon.Delay = 0.1
	weapon.ReloadSpeed = 2
	weapon.OnReload = function( ent )
		ent:EmitSound("lvs/vehicles/sherman/cannon_reload.wav" )
	end
	]]

	weapon.Attack = function( ent )
		-- "ent" can be either the weapon handler or the vehicle(which has a integrated weapon handler)
		-- "ent" is where ent:SetHeat, ent:GetHeat, ent:GetAmmo ect functions are called on.
		-- for seat 1 (which is the driver), ent is equal to self (the vehicle), passenger seats usually return the weapon handler and not self.
		-- if you want to be 100% sure to get the actual vehicle, just call ent:GetVehicle() it will always return the base vehicle.

		local bullet = {}
		bullet.Src 	= ent:LocalToWorld( Vector(25,0,30) )
		bullet.Dir 	= ent:GetForward()
		bullet.Spread 	= Vector( 0.015,  0.015, 0 )
		bullet.TracerName = "lvs_tracer_orange"
		bullet.Force	= 10 -- this divided by 100 = penetration in mm
		--bullet.Force1km = 5 -- bullet force at 1km
		--bullet.EnableBallistics = true  -- enable ballistics?
		bullet.HullSize 	= 15
		bullet.Damage	= 10
		bullet.Velocity = 30000
		bullet.SplashDamage = 100
		bullet.SplashDamageRadius = 25
		--bullet.SplashDamageEffect = "lvs_bullet_impact"
		--bullet.SplashDamageType = DMG_SONIC
		--bullet.SplashDamageForce = 500
		bullet.Attacker 	= ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo) end

		ent:LVSFireBullet( bullet )

		ent:TakeAmmo( 1 )
	end
	weapon.StartAttack = function( ent ) end
	weapon.FinishAttack = function( ent ) end
	weapon.OnSelect = function( ent ) end
	weapon.OnDeselect = function( ent ) end
	weapon.OnThink = function( ent, active ) end
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end
	weapon.OnRemove = function( ent ) end
	--[[
	weapon.CalcView = function( ent, ply, pos, angles, fov, pod )

		-- build view yourself:
		local view = {}
		view.origin = pos
		view.angles = angles
		view.fov = fov
		view.drawviewer = false

		return view

		--or use inbuild camera system:
		--if pod:GetThirdPersonMode() then
		--	pos = pos + ent:GetUp() * 100 -- move camera 100 units up in third person
		--end
		--return LVS:CalcView( ent, ply, pos, angles, fov, pod )
	end
	]]
	--[[
	weapon.HudPaint = function( ent, X, Y, ply )
		-- hud paint that is only active when the weapon is selected
		-- draw stuff like crosshair here
	end
	]]
	--self:AddWeapon( weapon ) -- add weapon to driver seat. Uncomment to make it useable.

	--self:AddWeapon( weapon, 2 ) -- this would register to weapon to seat 2
	--self:AddWeapon( weapon, 3 ) -- seat 3.. ect

--[[
	-- or use presets (defined in "lvs_base\lua\lvs_framework\autorun\lvs_defaultweapons.lua"):
	self.PosLMG = Vector(25,0,30)	-- this is used internally as variable in LMG script
	self.DirLMG = 0				-- this is used internally as variable in LMG script
	self:AddWeapon( LVS:GetWeaponPreset( "LMG" ) )
]]
end

--[[ engine sounds ]]
-- valid SoundType's are:
-- LVS.SOUNDTYPE_IDLE_ONLY -- only plays in idle
-- LVS.SOUNDTYPE_NONE -- plays all the time except in idle
-- LVS.SOUNDTYPE_REV_UP -- plays when revving up
-- LVS.SOUNDTYPE_REV_DOWN -- plays when revving down
-- LVS.SOUNDTYPE_ALL -- plays all the time
ENT.EngineSounds = {
	{
		sound = "vehicles/apc/apc_idle1.wav",
		Volume = 1,
		Pitch = 85,
		PitchMul = 25,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_IDLE_ONLY,
	},
	{
		sound = "vehicles/airboat/fan_motor_fullthrottle_loop1.wav",
		--sound_int = "path/to/interior/sound.wav",
		Volume = 1, -- adjust volume
		Pitch = 50, -- start pitch value
		PitchMul = 100, -- value that gets added to Pitch at max engine rpm
		SoundLevel = 75, -- if too quiet, adjust soundlevel.
		SoundType = LVS.SOUNDTYPE_NONE,
		UseDoppler = true, -- use doppler system?
	},
}


--[[ exhaust ]]
--[[
ENT.ExhaustPositions = {
	{
		pos = Vector(-100.04,14.72,4.84),
		ang = Angle(0,180,0),
	},
	{
		pos = Vector(-100.04,-14.72,4.84),
		ang = Angle(0,180,0),
	}
}
]]


--[[ lights ]]
ENT.Lights = {}
-- see: https://raw.githubusercontent.com/SpaxscE/lvs_cars/main/zzz_ENT_lights_info.lua
-- or https://discord.com/channels/1036581288653627412/1140195565368508427/1140195750207291403

--PATH addons/__main/lua/entities/m9k_ammo_buckshot/shared.lua:
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Buckshot"
ENT.Category		= "M9K Ammunition"

ENT.Spawnable		= true
ENT.AdminOnly = false
ENT.DoNotDuplicate = true

if SERVER then

AddCSLuaFile("shared.lua")

function ENT:SpawnFunction(ply, tr)

	if (!tr.Hit) then return end
	
	local SpawnPos = tr.HitPos + tr.HitNormal * 16
	
	local ent = ents.Create("m9k_ammo_buckshot")
	
	ent:SetPos(SpawnPos)
	ent:Spawn()
	ent:Activate()
	ent.Planted = false
	
	return ent
end


/*---------------------------------------------------------
   Name: Initialize
---------------------------------------------------------*/
function ENT:Initialize()

	local model = ("models/Items/BoxBuckshot.mdl")
	
	self.Entity:SetModel(model)
	
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:DrawShadow(false)
	
	self.Entity:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	
	local phys = self.Entity:GetPhysicsObject()
	
	if (phys:IsValid()) then
		phys:Wake()
	end

	self.Entity:SetUseType(SIMPLE_USE)
end


/*---------------------------------------------------------
   Name: PhysicsCollide
---------------------------------------------------------*/
function ENT:PhysicsCollide(data, physobj)
	
	// Play sound on bounce
	if (data.Speed > 80 and data.DeltaTime > 0.2) then
		self.Entity:EmitSound("Default.ImpactSoft")
	end
end

/*---------------------------------------------------------
   Name: OnTakeDamage
---------------------------------------------------------*/
function ENT:OnTakeDamage(dmginfo)

	if dmginfo:GetAttacker():GetClass() == "m9k_ammo_explosion" then return end
	
	self.Entity:TakePhysicsDamage(dmginfo)
	if GetConVar("M9KAmmoDetonation") == nil then return end
	if not (GetConVar("M9KAmmoDetonation"):GetBool()) then return end
	blaster = dmginfo:GetAttacker()
	pos = self.Entity:GetPos()+Vector(0,0,10)
	
	dice = math.random(1,5)

	if dmginfo:GetDamage() >75 or dice == 1 then
		self.Entity:Remove()
	
		local effectdata = EffectData()
		effectdata:SetOrigin(self.Entity:GetPos())
		util.Effect("ThumperDust", effectdata)
		util.Effect("Explosion", effectdata)
	
		timer.Simple(.01, function()
		
			for i=1, 300 do //if that turns out to be too many, i might have to call it 200 or something. goddamn, 1200 calculations in a heartbeat.
			
			ouchies = {}
			ouchies.start = pos
			ouchies.endpos = pos + Vector(math.Rand(-1,1), math.Rand(-1,1), math.Rand(0,1)) * 64000
			ouchies = util.TraceLine(ouchies)
			
			if ouchies.Hit and not ouchies.HitSky then 
				util.Decal("Impact.Concrete", ouchies.HitPos + ouchies.HitNormal, ouchies.HitPos - ouchies.HitNormal )//and ouchies.Entity then
				ouchies.Entity:TakeDamage(30 * math.Rand(.85,1.15), blaster, self.Entity)
			end
			end
		end)
	end	

end


/*---------------------------------------------------------
   Name: Use
---------------------------------------------------------*/
function ENT:Use(activator, caller)

	
	if (activator:IsPlayer()) and not self.Planted then
		// Give the collecting player some free health
		activator:GiveAmmo(100, "buckshot")
		self.Entity:Remove()
	end
end

end

if CLIENT then

/*---------------------------------------------------------
   Name: Initialize
---------------------------------------------------------*/
function ENT:Initialize()
end

/*---------------------------------------------------------
   Name: DrawPre
---------------------------------------------------------*/
function ENT:Draw()
	
	self.Entity:DrawModel()
	
	local ledcolor = Color(230, 45, 45, 255)

  	local TargetPos = self.Entity:GetPos() + (self.Entity:GetUp() * 3) + (self.Entity:GetRight() * 2) + (self.Entity:GetForward() * 3.54)

	local FixAngles = self.Entity:GetAngles()
	local FixRotation = Vector(0, 90, 90)
	
	FixAngles:RotateAroundAxis(FixAngles:Right(), FixRotation.x)
	FixAngles:RotateAroundAxis(FixAngles:Up(), FixRotation.y)
	FixAngles:RotateAroundAxis(FixAngles:Forward(), FixRotation.z)

	self.Text = "Buckshot"
	
	cam.Start3D2D(TargetPos, FixAngles, .07)
		draw.SimpleText(self.Text, "DermaLarge", 31, -22, ledcolor, 1, 1)
	cam.End3D2D()
end

end
--PATH addons/__main/lua/entities/m9k_ammo_smg/shared.lua:
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "SMG Rounds"
ENT.Category		= "M9K Ammunition"

ENT.Spawnable		= true
ENT.AdminOnly = false
ENT.DoNotDuplicate = true

if SERVER then

AddCSLuaFile("shared.lua")

function ENT:SpawnFunction(ply, tr)

	if (!tr.Hit) then return end
	
	local SpawnPos = tr.HitPos + tr.HitNormal * 16
	
	local ent = ents.Create("m9k_ammo_smg")
	
	ent:SetPos(SpawnPos)
	ent:Spawn()
	ent:Activate()
	ent.Planted = false
	
	return ent
end


/*---------------------------------------------------------
   Name: Initialize
---------------------------------------------------------*/
function ENT:Initialize()

	local model = ("models/Items/BoxSRounds.mdl")
	
	self.Entity:SetModel(model)
	
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:DrawShadow(false)
	
	self.Entity:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	
	local phys = self.Entity:GetPhysicsObject()
	
	if (phys:IsValid()) then
		phys:Wake()
	end

	self.Entity:SetUseType(SIMPLE_USE)
end


/*---------------------------------------------------------
   Name: PhysicsCollide
---------------------------------------------------------*/
function ENT:PhysicsCollide(data, physobj)
	
	// Play sound on bounce
	if (data.Speed > 80 and data.DeltaTime > 0.2) then
		self.Entity:EmitSound("Default.ImpactSoft")
	end
end

/*---------------------------------------------------------
   Name: OnTakeDamage
---------------------------------------------------------*/
function ENT:OnTakeDamage(dmginfo)

	if dmginfo:GetAttacker():GetClass() == "m9k_ammo_explosion" then return end
	self.Entity:TakePhysicsDamage(dmginfo)
	if GetConVar("M9KAmmoDetonation") == nil then return end
	if not (GetConVar("M9KAmmoDetonation"):GetBool()) then return end
	blaster = dmginfo:GetAttacker()
	pos = self.Entity:GetPos()+Vector(0,0,10)
	
	dice = math.random(1,5)

	if dmginfo:GetDamage() >75 or dice == 1 then
		self.Entity:Remove()
	
		local effectdata = EffectData()
		effectdata:SetOrigin(self.Entity:GetPos())
		util.Effect("ThumperDust", effectdata)
		util.Effect("Explosion", effectdata)
	
		timer.Simple(.01, function()
		
			for i=1, 100 do
			
			ouchies = {}
			ouchies.start = pos
			ouchies.endpos = pos + Vector(math.Rand(-1,1), math.Rand(-1,1), math.Rand(0,1)) * 64000
			ouchies = util.TraceLine(ouchies)
			
			if ouchies.Hit and not ouchies.HitSky then 
				util.Decal("Impact.Concrete", ouchies.HitPos + ouchies.HitNormal, ouchies.HitPos - ouchies.HitNormal )//and ouchies.Entity then
				ouchies.Entity:TakeDamage(30 * math.Rand(.85,1.15), blaster, self.Entity)
			end
			end
		end)
	end	

end


/*---------------------------------------------------------
   Name: Use
---------------------------------------------------------*/
function ENT:Use(activator, caller)

	
	if (activator:IsPlayer()) and not self.Planted then
		// Give the collecting player some free health
		activator:GiveAmmo(100, "smg1")
		self.Entity:Remove()
	end
end

end

if CLIENT then

/*---------------------------------------------------------
   Name: Initialize
---------------------------------------------------------*/
function ENT:Initialize()
end

/*---------------------------------------------------------
   Name: DrawPre
---------------------------------------------------------*/
function ENT:Draw()
	
	self.Entity:DrawModel()
	
	local ledcolor = Color(230, 45, 45, 255)

  	local TargetPos = self.Entity:GetPos() + (self.Entity:GetUp() * 11.6) + (self.Entity:GetRight() * 2) + (self.Entity:GetForward() * 1.5)

	local FixAngles = self.Entity:GetAngles()
	local FixRotation = Vector(90, 90, 90)
	
	FixAngles:RotateAroundAxis(FixAngles:Right(), FixRotation.x)
	FixAngles:RotateAroundAxis(FixAngles:Up(), FixRotation.y)
	FixAngles:RotateAroundAxis(FixAngles:Forward(), FixRotation.z)

	self.Text = "SMG Rounds"
	
	cam.Start3D2D(TargetPos, FixAngles, .07)
		draw.SimpleText(self.Text, "DermaLarge", 31, -22, ledcolor, 1, 1)
	cam.End3D2D()
end

end
--PATH addons/igs-core/lua/entities/npc_igs/cl_init.lua:
IGS.sh("shared.lua")

function ENT:Draw()
	self:DrawModel()
	onyx.npc.label( self, "Донат послуги" )
end

--PATH addons/_pcasino/lua/entities/pcasino_roulette_table/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Roulette Table"
ENT.Author = "Owain Owjo & The One Free-Man"
ENT.Category = "pCasino"
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.noDrag = true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "LastRoundNumber")
	self:NetworkVar("Int", 1, "StartRoundIn")
end

-- This is a lot of confusing math and took me ages to actually get right on the grid. Just accept it for what it is, I cache it, so it's not really a big deal... right? :/
-- I essentially map each bet "type" based on some math, because they're all in a grid. Best way I could think of without manually mapping every button.
function ENT:GetCurrentPad(pos)
	if not self.padCache then
		self.padCache = {}
		-- Set priority
		self.padCache[1] = {} -- The outer buttons, they don't overlap and there's not many of them, so we can do them first.
		self.padCache[2] = {} -- The 2x2 overlaps, they overlap the most so they should be done second.
		self.padCache[3] = {} -- The 1x2 or 2x1 crossovers, they also overlap so they should be done before the base numbers. We put the row bets in here too.
		self.padCache[4] = {} -- The base numbers

		local startPos = Vector(4.1, -13.3, 14)
		local sizeW, sizeH = -6.2, 4.4
		-- 1 to 36 numbers
		for i=1, 36 do
			self.padCache[4]["num_"..i] = {
				boundsA = {x = (startPos.x + (sizeW*((i-1)%3))), y = (startPos.y + (sizeH*math.floor((i-1)/3)))},
				boundsB = {x = (startPos.x + (sizeW*(((i-1)%3)+1))), y = (startPos.y + (sizeH*(math.floor((i-1)/3)+1)))}
			}

			-- Add the numbers it covers
			self.padCache[4]["num_"..i].numbers = {[i] = true}

			-- Add the payout if won
			self.padCache[4]["num_"..i].payout = 35
		end

		local startPos = Vector(-1.1, -10.2, 14)
		local sizeW, sizeH = -2, 2.21
		local row = 0
		local newI
		-- The 2x2 bets
		for i=1, 22 do
			self.padCache[2]["2x2_"..i] = {
				boundsA = {x = (startPos.x + (sizeW*((i-1)%2))) + ((sizeW*2.15)*((i-1)%2)), y = (startPos.y + (sizeH*math.floor((i-1)*0.5))) + (sizeH*math.floor((i-1)*0.5))},
				boundsB = {x = (startPos.x + (sizeW*(((i-1)%2)+1))) + ((sizeW*2.15)*((i-1)%2)), y = (startPos.y + (sizeH*(math.floor((i-1)*0.5)+1))) + (sizeH*math.floor((i-1)*0.5))}
			}

			-- Add the numbers it covers
			newI = i + row
			self.padCache[2]["2x2_"..i].numbers = {}
			self.padCache[2]["2x2_"..i].numbers[newI] = true
			self.padCache[2]["2x2_"..i].numbers[newI+1] = true
			self.padCache[2]["2x2_"..i].numbers[newI+3] = true
			self.padCache[2]["2x2_"..i].numbers[newI+4] = true
			
			-- The end of a row
			if i%2 == 0 then
				row = row + 1
			end

			-- Add the payout if won
			self.padCache[2]["2x2_"..i].payout = 8
		end

		local startPos = Vector(-1.1, -12.4, 14)
		local sizeW, sizeH = -2, 2.21
		local row = 0
		local newI
		-- The horizontal bets
		for i=1, 24 do
			self.padCache[3]["hrztl_"..i] = {
				boundsA = {x = (startPos.x + (sizeW*((i-1)%2))) + ((sizeW*2.15)*((i-1)%2)), y = (startPos.y + (sizeH*math.floor((i-1)*0.5))) + (sizeH*math.floor((i-1)*0.5))},
				boundsB = {x = (startPos.x + (sizeW*(((i-1)%2)+1))) + ((sizeW*2.15)*((i-1)%2)), y = (startPos.y + (sizeH*(math.floor((i-1)*0.5)+1))) + (sizeH*math.floor((i-1)*0.5))}
			}

			-- Add the numbers it covers
			newI = i + row
			self.padCache[3]["hrztl_"..i].numbers = {}
			self.padCache[3]["hrztl_"..i].numbers[newI] = true
			self.padCache[3]["hrztl_"..i].numbers[newI+1] = true

			-- The end of a row
			if i%2 == 0 then
				row = row + 1
			end

			-- Add the payout if won
			self.padCache[3]["hrztl_"..i].payout = 17
		end

		local startPos = Vector(2.1, -10.2, 14)
		local sizeW, sizeH = -2, 2.21
		-- The vertical bets
		for i=1, 33 do
			self.padCache[3]["vrtcl_"..i] = {
				boundsA = {x = (startPos.x + (sizeW*((i-1)%3))) + ((sizeW*2.15)*((i-1)%3)), y = (startPos.y + (sizeH*math.floor((i-1)/3))) + (sizeH*math.floor((i-1)/3))},
				boundsB = {x = (startPos.x + (sizeW*(((i-1)%3)+1))) + ((sizeW*2.15)*((i-1)%3)), y = (startPos.y + (sizeH*(math.floor((i-1)/3)+1))) + (sizeH*math.floor((i-1)/3))}
			}

			-- Add the numbers it covers
			self.padCache[3]["vrtcl_"..i].numbers = {}
			self.padCache[3]["vrtcl_"..i].numbers[i] = true
			self.padCache[3]["vrtcl_"..i].numbers[i+3] = true

			-- Add the payout if won
			self.padCache[3]["vrtcl_"..i].payout = 17
		end

		local startPos = Vector(5.3, -13.3, 14)
		local sizeW, sizeH = -2, 4.4
		local start
		-- Row bets
		for i=1, 12 do
			self.padCache[3]["row_"..i] = {
				boundsA = {x = startPos.x, y = (startPos.y + (sizeH*(i-1)))},
				boundsB = {x = (startPos.x + sizeW), y = (startPos.y + (sizeH*(i)))},
			}

			-- Add the numbers it covers
			start = (i-1)*3
			self.padCache[3]["row_"..i].numbers = {[start+1] = true, [start+2] = true, [start+3] = true}

			-- Add the payout if won
			self.padCache[3]["row_"..i].payout = 11
		end

		-- 0 is bigger, so we gotta do it manually
		self.padCache[4]["num_0"] = {
			boundsA = {x = 4.3, y = -18.6},
			boundsB = {x = -14.3, y = -13.6}
		}
		-- Add the numbers it covers
		self.padCache[4]["num_0"].numbers = {[0] = true}
		-- Add the payout if won
		self.padCache[4]["num_0"].payout = 35

		local startPos = Vector(4.1, 39.5, 14)
		local sizeW, sizeH = -6.2, 4.4
		-- Sets of 12
		for i=1, 3 do
			self.padCache[1]["2to1_"..i] = {
				boundsA = {x = (startPos.x + (sizeW*(i-1))), y = startPos.y},
				boundsB = {x = (startPos.x + (sizeW*(i))), y = (startPos.y + sizeH)}
			}

			-- Add the numbers it covers
			self.padCache[1]["2to1_"..i].numbers = {}
			for n=i, 36, 3 do
				self.padCache[1]["2to1_"..i].numbers[n] = true
			end

			-- Add the payout if won
			self.padCache[1]["2to1_"..i].payout = 2
		end

		local startPos = Vector(9.3, -13.4, 14.6)
		local sizeW, sizeH = -5, 17.7
		local start
		-- Sets of 12
		for i=1, 3 do
			self.padCache[1]["12s_"..i] = {
				boundsA = {x = startPos.x, y = (startPos.y + (sizeH*(i-1)))},
				boundsB = {x = (startPos.x + sizeW), y = (startPos.y + (sizeH*(i)))},
			}

			-- Add the numbers it covers
			self.padCache[1]["12s_"..i].numbers = {}
			start = 12*(i-1)+1
			for n=start, start+11 do
				self.padCache[1]["12s_"..i].numbers[n] = true
			end

			-- Add the payout if won
			self.padCache[1]["12s_"..i].payout = 2
		end

		local startPos = Vector(14.5, -13.4, 14.6)
		local sizeW, sizeH = -5, 8.85
		local types = {"1to18", "even", "red", "black", "odd", "19to36"}
		for k, v in ipairs(types) do
			self.padCache[1][v] = {
				boundsA = {x = startPos.x, y = (startPos.y + (sizeH*(k-1)))},
				boundsB = {x = (startPos.x + sizeW), y = (startPos.y + (sizeH*(k)))},
			}

			-- Add the numbers it covers
			self.padCache[1][v].numbers = {}
			for i=1, 36 do
				if (v == "1to18") and (i <= 18) then
					self.padCache[1][v].numbers[i] = true
				elseif (v == "19to36") and (i >= 19) then 
					self.padCache[1][v].numbers[i] = true
				elseif (v == "even") and (i%2 == 0) then 
					self.padCache[1][v].numbers[i] = true
				elseif (v == "odd") and (i%2 == 1) then 
					self.padCache[1][v].numbers[i] = true
				elseif (v == "red") and table.HasValue({1, 3, 5, 7, 9, 12, 14, 16, 18, 19, 21, 23, 25, 27, 30, 32, 34, 36}, i) then 
					self.padCache[1][v].numbers[i] = true
				elseif (v == "black") and table.HasValue({2, 4, 6, 8, 10, 11, 13, 15, 17, 20, 22, 24, 26, 28, 29, 31, 33, 35}, i) then 
					self.padCache[1][v].numbers[i] = true
				end
			end

			-- Add the payout if won
			self.padCache[1][v].payout = 1
		end

		-- Raise bet
		self.padCache[1]["bet_raise"] = {
			boundsA = {x = -20, y = -5.2},
			boundsB = {x = -23.7, y = -0.567747},
		}
		-- Lower bet
		self.padCache[1]["bet_lower"] = {
			boundsA = {x = -20, y = 10.5},
			boundsB = {x = -23.7, y = 15.5},
		}

		-- Find the center point of all the 3d2d inputs
		for i, _ in ipairs(self.padCache) do
			for k, v in pairs(_) do
				self.padCache[i][k].origin = {x = v.boundsA.x+((v.boundsB.x - v.boundsA.x)*0.5), y = v.boundsA.y+((v.boundsB.y - v.boundsA.y)*0.5)}
			end
		end
	end
	for i, _ in ipairs(self.padCache) do
		for k, v in pairs(_) do
			if (pos.x < v.boundsA.x) and (pos.x > v.boundsB.x) and (pos.y > v.boundsA.y) and (pos.y < v.boundsB.y) and (pos.z > 13) and (pos.z < 15) then
				return k, v
			end
		end
	end

	return false
end
function ENT:GetPadByName(padName)
	if not self.padCache then
		self:GetCurrentPad(Vector(0, 0, 0)) -- Generate the cache
	end

	for i, _ in ipairs(self.padCache) do
		for k, v in pairs(_) do
			if k == padName then
				return k, v
			end
		end
	end
end
function ENT:GetPadsFromNumber(number)
	local pads = {}

	for i, _ in ipairs(self.padCache) do
		for k, v in pairs(_) do
			if v.numbers and v.numbers[number] then
				table.insert(pads, k)
			end
		end
	end

	return pads
end

PerfectCasino.Core.RegisterEntity("pcasino_roulette_table", {
	-- Bet data
	bet = {
		betLimit = {d = 3000, t = "num"},
		default = {d = 500, t = "num"},
		max = {d = 1000, t = "num"},
		min = {d = 100, t = "num"},
		iteration = {d = 100, t = "num"}
	},
	general = {
		betPeriod = {d = 30, t = "num"} -- The default bet
	}
},
"models/freeman/owain_roulette_table.mdl")
--PATH addons/_pcasino/lua/entities/pcasino_sign_stand/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Sign Stand"
ENT.Author = "Owain Owjo & The One Free-Man"
ENT.Category = "pCasino"
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.noDrag = true

PerfectCasino.Core.RegisterEntity("pcasino_sign_stand", {
	-- General data
	general = {
		text = {d = "Casino", t = "string"} -- The text to show
	}
},
"models/freeman/owain_casinosign_standing.mdl")
--PATH addons/_boombox/lua/entities/retro_boombox_base/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Retro Boombox Base"
ENT.Category = "Main"
ENT.Author = "Venatuss"
ENT.Spawnable = false
function ENT:SetupDataTables()
	self:NetworkVar( "Bool", 0, "Power" )
	self:NetworkVar( "Bool", 1, "Playing" )
	self:NetworkVar( "Float", 0, "Frequence" )
	self:NetworkVar( "Float", 1, "SoundLevel" )
	self:NetworkVar( "Float", 2, "LightMode" )
end

ENT.MainColor = "white"
ENT.SecondaryColor = "silver"
ENT.TubeLightsColor = "white"
ENT.MainLightsColor = "white"
ENT.SoundLightsColor = "red"
ENT.ScreenBackgroundColor = Color( 32, 32, 32, 255 )
ENT.ScreenContentColor = Color( 0, 255, 219, 255 )
--PATH addons/__main/lua/entities/savav_beer/shared.lua:
ENT.Base = "base_anim"
ENT.Type = "anim"

ENT.PrintName		= "Beer"
ENT.Author			= "SaVav"
ENT.Category 		= "SaVav's trash"
ENT.Contact    		= ""
ENT.Purpose 		= "take it"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true


--PATH addons/__main/lua/entities/savav_cocaine/shared.lua:
ENT.Base = "base_anim"
ENT.Type = "anim"

ENT.PrintName		= "cocaine"
ENT.Author			= "SaVav"
ENT.Category 		= "SaVav's trash"
ENT.Contact    		= ""
ENT.Purpose 		= "take it"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true


--PATH addons/__________skeypads/lua/entities/skeypad_cracker/cl_init.lua:
include( 'shared.lua' )
function ENT:Initialize()
end

local screenPos = Vector( 2.1, .65, 4.12 )
local screenAngles = Angle( 0, 270, 0 )
local circleMat = onyx.wimg.Create( 'cracker_circle', 'noclamp smooth' )
function ENT:Draw()
    self:DrawModel()
    cam.Start3D2D( self:LocalToWorld( screenPos ), self:LocalToWorldAngles( screenAngles ), 0.004 )
    local circleSize = 130
    local circleSpacing = 60
    local circleX = -( circleSize * 3 + circleSpacing * 2 ) * 0.5
    for i = 0, 2 do
        circleMat( circleX + i * ( circleSize + circleSpacing ), 120 + math.sin( ( CurTime() + i * .2 ) * 4 ) * 25, circleSize, circleSize )
    end

    cam.End3D2D()
end
--PATH gamemodes/darkrp/entities/entities/spawned_money/cl_init.lua:
include("Shared.lua")

local LocalPlayer = LocalPlayer
local Color = Color
local cam = cam
local draw = draw
local Angle = Angle
local Vector = Vector
local color_white = Color(255, 255, 255)
local color_black = Color(0, 0, 0)

local money = 100

function ENT:Draw()
	self:DrawModel()
	local pos = self:GetPos()
	local ang = self:GetAngles()
	local mypos = LocalPlayer():GetPos()
	local dist = pos:Distance(mypos)
	if dist > 250 or (mypos - mypos):DotProduct(LocalPlayer():GetAimVector()) < 0 then return end
	-- fancy math says we dont need to draw
	color_white.a = 250 - dist
	color_black.a = 250 - dist
	cam.Start3D2D(pos + ang:Up() * 0.9, ang, 0.015)
	draw.SimpleTextOutlined(rp.FormatMoney(self:GetNWInt('GetMoney')), 'Roboto_150', 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, color_black)
	cam.End3D2D()
	ang:RotateAroundAxis(ang:Right(), 180)
	cam.Start3D2D(pos, ang, 0.015)
	draw.SimpleTextOutlined(rp.FormatMoney(self:GetNWInt('GetMoney')), 'Roboto_150', 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, color_black)
	cam.End3D2D()
end
--PATH addons/uweedadvancedcannabisgrowth/lua/entities/uweed_scale/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "[UWeed] Scale"
ENT.Author = "Owain Owjo"
ENT.Category = "UWeed"
ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Entity", 0, "owning_ent")
	self:NetworkVar("Entity", 1, "CurrentBag")
end
--PATH addons/lvs_cars_3027255911/lua/effects/lvs_carengine_blacksmoke.lua:
EFFECT.Smoke = {
	"particle/smokesprites_0001",
	"particle/smokesprites_0002",
	"particle/smokesprites_0003",
	"particle/smokesprites_0004",
	"particle/smokesprites_0005",
	"particle/smokesprites_0006",
	"particle/smokesprites_0007",
	"particle/smokesprites_0008",
	"particle/smokesprites_0009",
	"particle/smokesprites_0010",
	"particle/smokesprites_0011",
	"particle/smokesprites_0012",
	"particle/smokesprites_0013",
	"particle/smokesprites_0014",
	"particle/smokesprites_0015",
	"particle/smokesprites_0016"
}

function EFFECT:Init( data )
	local Pos = data:GetOrigin()
	local Ent = data:GetEntity()

	if not IsValid( Ent ) then return end

	local emitter = Ent:GetParticleEmitter( Ent:WorldToLocal( Pos ) )

	if not IsValid( emitter ) then return end

	local particle = emitter:Add( self.Smoke[ math.random(1, #self.Smoke ) ], Pos )

	local rCol = math.random(30,60)

	local Scale = math.Rand(1,8)

	if not particle then return end

	particle:SetVelocity( Vector(0,0,80) + VectorRand() * 80 )
	particle:SetDieTime( Scale )
	particle:SetAirResistance( 200 ) 
	particle:SetStartAlpha( 100 / Scale )
	particle:SetStartSize( 20 )
	particle:SetEndSize( math.random(15,30) * Scale )
	particle:SetRoll( math.pi / Scale )
	particle:SetRollDelta( math.Rand(-1,1) )
	particle:SetColor( rCol, rCol, rCol )
	particle:SetGravity( Vector( 0, 0, math.random(-40,80) ) )
	particle:SetCollide( true )
	particle:SetBounce( 0 )
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end

--PATH addons/lvs_base-main/lua/effects/lvs_muzzle_colorable.lua:

function EFFECT:Init( data )
	local Pos = data:GetOrigin()
	local Dir = data:GetNormal()
	local Ent = data:GetEntity()
	local Col = data:GetStart() or Vector(255,255,255)
	local Vel = Dir * 10

	if IsValid( Ent ) then
		Vel = Ent:GetVelocity()
	end

	local emitter = ParticleEmitter( Pos, false )

	if not IsValid( emitter ) then return end

	for i = 0, 12 do
		local particle = emitter:Add( "effects/muzzleflash2", Pos + Dir * i * 0.7 * math.random(1,2) * 0.5 )
		local Size = 1

		if not particle then continue end

		particle:SetVelocity( Dir * 800 + Vel )
		particle:SetDieTime( 0.05 )
		particle:SetStartAlpha( 255 * Size )
		particle:SetStartSize( math.max( math.random(10,24) - i * 0.5,0.1 ) * Size )
		particle:SetEndSize( 0 )
		particle:SetRoll( math.Rand( -1, 1 ) )
		particle:SetColor( Col.x, Col.y, Col.z )
		particle:SetCollide( false )
	end

	emitter:Finish()
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end

--PATH addons/lvs_cars_3027255911/lua/effects/lvs_physics_wheelsmoke.lua:

EFFECT.SmokeMat = {
	"particle/smokesprites_0001",
	"particle/smokesprites_0002",
	"particle/smokesprites_0003",
	"particle/smokesprites_0004",
	"particle/smokesprites_0005",
	"particle/smokesprites_0006",
	"particle/smokesprites_0007",
	"particle/smokesprites_0008",
	"particle/smokesprites_0009",
	"particle/smokesprites_0010",
	"particle/smokesprites_0011",
	"particle/smokesprites_0012",
	"particle/smokesprites_0013",
	"particle/smokesprites_0014",
	"particle/smokesprites_0015",
	"particle/smokesprites_0016"
}

function EFFECT:Init( data )
	local pos = data:GetOrigin()
	local ent = data:GetEntity()

	if not IsValid( ent ) then return end

	local dir = data:GetNormal()

	local emitter = ent:GetParticleEmitter( ent:GetPos() )

	local VecCol = (render.GetLightColor( pos + dir ) * 0.5 + Vector(0.3,0.3,0.3)) * 255

	for i = 1, 2 do
		local particle = emitter:Add( self.SmokeMat[ math.random(1,#self.SmokeMat) ] , pos )

		if not particle then continue end

		particle:SetVelocity( VectorRand() * 50 )
		particle:SetDieTime( math.Rand(0.5,1.5) )
		particle:SetAirResistance( 10 ) 
		particle:SetStartAlpha( 50 )
		particle:SetStartSize( 20 )
		particle:SetEndSize( 60 )
		particle:SetRollDelta( math.Rand(-1,1) )
		particle:SetColor( math.min( VecCol.r, 255 ), math.min( VecCol.g, 255 ), math.min( VecCol.b, 255 ) )
		particle:SetGravity( Vector(0,0,5) )
		particle:SetCollide( false )
	end
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end

--PATH addons/lvs_cars_3027255911/lua/effects/lvs_physics_wheelwatersplash.lua:

EFFECT.WaterWake = Material("effects/splashwake1")

function EFFECT:Init( data )
	local Pos = data:GetOrigin() + Vector(0,0,1)
	local Ent = data:GetEntity()
	self.Size = data:GetMagnitude()

	if not IsValid( Ent ) then return end

	self.LifeTime = 1
	self.DieTime = CurTime() + self.LifeTime

	local RainFX = data:GetFlags() == 1

	if RainFX then
		self.Size = self.Size * 2

	else
		self.Splash = {
			Pos = Pos,
			Mat = self.WaterWake,
			RandomAng = math.random(0,360),
		}
	end

	self.VecCol = (render.GetLightColor( Pos ) * 0.25 + Vector(0.75,0.75,0.75)) * 255

	local emitter = Ent:GetParticleEmitter( Ent:GetPos() )
	local Vel = Ent:GetVelocity():Length()

	for i = 1, 3 do
		if emitter and emitter.Add then
			local particle = emitter:Add( "effects/splash4", Pos + VectorRand() * self.Size * 0.1 )
			if not particle then continue end

			particle:SetVelocity( Vector(0,0,math.Clamp(Vel / 100,100,250)) )
			particle:SetDieTime( 0.25 + math.min(Vel / 500,0.2) )
			particle:SetAirResistance( 60 ) 
			particle:SetStartAlpha( RainFX and 5 or 150 )
			particle:SetEndAlpha( 0 )
			particle:SetStartSize( self.Size * 0.2 )
			particle:SetEndSize(  self.Size )
			particle:SetRollDelta( math.Rand(-1,1) * 5 )
			particle:SetColor( math.min( self.VecCol.r, 255 ), math.min( self.VecCol.g, 255 ), math.min( self.VecCol.b, 255 ) )
			particle:SetGravity( Vector( 0, 0, -600 ) )
			particle:SetCollide( false )
		end
	end
end


function EFFECT:Think()
	if CurTime() > self.DieTime then
		return false
	end
	return true
end

function EFFECT:Render()
	if not self.Splash or not self.LifeTime or not self.VecCol then return end

	local Scale = 1 - (self.DieTime - CurTime()) / self.LifeTime

	local Alpha = math.max( 100 - 150 * Scale ^ 2, 0 )

	if Alpha <= 0 then return end

	local Size = (self.Size + self.Size * Scale) * 1.5

	cam.Start3D2D( self.Splash.Pos, Angle(0,0,0), 1 )
		surface.SetMaterial( self.Splash.Mat )
		surface.SetDrawColor( math.min( self.VecCol.r, 255 ), math.min( self.VecCol.g, 255 ), math.min( self.VecCol.b, 255 ), Alpha )
		surface.DrawTexturedRectRotated( 0, 0, Size, Size, self.Splash.RandomAng )
	cam.End3D2D()
end
--PATH addons/____inventory/lua/itemstore/vgui/newcontainerwindow.lua:
local PANEL = {}

function PANEL:Init()
	self:SetSkin( "itemstore" )

	self.Container = vgui.Create( "ItemStoreNewContainer", self )
	self.Container:Dock( FILL )
end

function PANEL:Refresh()
	self.Container:Refresh()
end

function PANEL:SetContainerID( id )
	self.Container:SetContainerID( id )

	local con = itemstore.containers.Get( id )
	if not con then return end

	local p = 1
	local sw, sh = 48, 48
	local cw, ch = con:GetWidth(), con:GetHeight()
	local w, h = 10 + ( sw + p ) * cw, 34 + 37 + ( sh + p ) * ch

	self:SetSize( w, h )
end

function PANEL:GetContainerID()
	return self.Container:GetContainerID()
end

vgui.Register( "ItemStoreNewContainerWindow", PANEL, "DFrame" )

--PATH addons/____plogs/lua/plogs_hooks/weaponscheck.lua:
plogs.Register('Чекер оружия', false, Color(205, 92, 92))

plogs.AddHook('playerWeaponsChecked', function(ply, pl)
	plogs.PlayerLog(ply, 'Чекер оружия', ply:NameID() .. ' проверил чекером оружия игрока ' .. pl:NameID(), {
		['Ник проверящего'] 	= ply:Name(),
		['Стимид проверящего']	= ply:SteamID(),
		['Ник которого проверили'] = pl:Name(),
		['Стимид которого проверили'] = pl:SteamID()
	})
end)

plogs.AddHook('playerWeaponsReturned', function(ply, pl)
	plogs.PlayerLog(ply, 'Чекер оружия', ply:NameID() .. ' вернул конфискованное оружие игроку ' .. pl:NameID(), {
		['Ник проверящего'] 	= ply:Name(),
		['Стимид проверящего']	= ply:SteamID(),
		['Ник которого проверили'] = pl:Name(),
		['Стимид которого проверили'] = pl:SteamID()
	})
end)

plogs.AddHook('playerWeaponsConfiscated', function(ply, pl)
	plogs.PlayerLog(ply, 'Чекер оружия', ply:NameID() .. ' конфисковал оружие у игрока ' .. pl:NameID(), {
		['Ник проверящего'] 	= ply:Name(),
		['Стимид проверящего']	= ply:SteamID(),
		['Ник которого проверили'] = pl:Name(),
		['Стимид которого проверили'] = pl:SteamID()
	})
end)
--PATH addons/____esclib/lua/elib/essentials/esc_print.lua:
----------------------------
--# MESSAGE SEND TO CHAT #--
----------------------------
local netstream = esclib.netstream
if SERVER then
    local PLAYER_META = FindMetaTable("Player")
    function PLAYER_META:EsclibChatPrint(...)
        netstream.Start(self, "esclib.message", ...)
    end
else --CLIENT
    netstream.Hook("esclib.message", function(...)
		chat.AddText(...)
	end)
end


--https://github.com/Be1zebub/Small-GLua-Things/blob/master/printtable_v2.lua

local white = Color( 230, 230, 230 )
local red = Color( 212, 53, 109 )
local yellow = Color( 212, 202, 107 )
local purple = Color( 157, 110, 212 )
local cyan = Color( 102, 217, 239 )
local dark = Color( 105, 105, 105 )

local IsValidKeyName

do
	local reserved = { [ "and" ] = true, [ "break" ] = true, [ "do" ] = true, [ "else" ] = true, [ "elseif" ] = true, [ "end" ] = true, [ "false" ] = true, [ "for" ] = true, [ "function" ] = true, [ "if" ] = true, [ "in" ] = true, [ "local" ] = true, [ "nil" ] = true, [ "not" ] = true, [ "or" ] = true, [ "repeat" ] = true, [ "return" ] = true, [ "then" ] = true, [ "true" ] = true, [ "until" ] = true, [ "while" ] = true}

	function IsValidKeyName( key )
		-- name cant be reserved word
		if reserved[ key ] then return false end

		-- it should start with letters or underscore, It should continue with alphanumerics
		if ( key:match( "^[%a_][%w_]*$" ) == nil ) then return false end

		return true
	end
end

local MsgC = MsgC

if SERVER and system.IsLinux() then
	function MsgC( ... ) -- polyfill to make MsgC works in linux srcds
		for _, v in ipairs( { ... } ) do
			if ( IsColor( v ) ) then
				Msg( string.format( "\27[38;2;%d;%d;%dm", v.r, v.g, v.b ) )
			else
				Msg( v )
			end
		end

		Msg("\27[0m")
	end
end

local function Round( num )
	return math.Round( num, 3 )
end

local gmodObjects = {}

function gmodObjects.Player( v )
	MsgC( cyan, "Player", white, "( ", purple, v:UserID(), white, " )" )
end

function gmodObjects.Entity( v )
	MsgC( cyan, "Entity", white, "( ", purple, v:EntIndex(), white, " )" )
end

local gmodAxisObjects = { Vector = true, Angle = true }

local function MsgValue( v )
	if isstring( v ) then
		if v:find( "\n", 1, true ) then
			MsgC( yellow, "[[", v, "]]" )
		else
			MsgC( yellow, "\"", v, "\"" )
		end
	elseif IsColor( v ) then
		MsgC(
			cyan, "Color", white, "( ",
			purple, v.r, red, ", ",
			purple, v.g, red, ", ",
			purple, v.b
		)

		if v.a ~= 255 then
			MsgC(
				red, ", ",
				purple, v.a
			)
		end

		MsgC( white, " )" )
	elseif gmodObjects[ type( v ) ] then
		gmodObjects[ type( v ) ]( v )
	elseif gmodAxisObjects[ type( v ) ] then
		MsgC(
			cyan, type( v ), white, "( ",
			purple, Round( v[ 1 ] )
		)

		if v[ 2 ] ~= 0 then
			MsgC( red, ", ", purple, Round( v[ 2 ] ) )
		end

		if v[ 3 ] ~= 0 then
			MsgC( red, ", ", purple, Round( v[ 3 ] ) )
		end

		MsgC( white, " )" )
	elseif isfunction( v ) then
		local info = debug.getinfo( v )
		local defined = info.linedefined == info.lastlinedefined and info.linedefined or info.linedefined .. "-" .. info.lastlinedefined

		MsgC( purple, v, dark, " --[[ ", info.short_src, ":", defined, " ]]" )
	else
		MsgC( purple, v )
	end
end

local function MsgKey( indent, k )
	if ( isstring( k ) == false ) then
		MsgC( indent, red, "[ " )
		MsgValue( k )
		MsgC( red, " ] = " )
	elseif ( IsValidKeyName( k ) ) then
		MsgC( indent, white, k, red, " = " )
	else
		MsgC( indent, red, "[ ", yellow, "\"", k, yellow, "\"", red, " ] = " )
	end
end

function esclib:PrintTable( tbl, lvl, already )
	already = already or { [ tbl ] = true }
	lvl = lvl or 1

	local len = 0
	for _ in pairs( tbl ) do
		len = len + 1
	end

	if ( len == 0 ) then
		return MsgC( red, "{}" )
	end

	local isSeq = len == #tbl
	local not_isSeq = not isSeq

	if ( not_isSeq ) then
		local new = {}
		local index = 0

		for k, v in pairs( tbl ) do
			index = index + 1
			new[ index ] = { k = k, v = v }
		end

		table.sort( new, function( a, b )
			if ( isnumber( a.k ) and isnumber( b.k ) ) then
				return a.k < b.k
			end

			return tostring( a.k ) < tostring( b.k )
		end )

		tbl = new
	end

	local iter = isSeq and ipairs or pairs
	local indent = string.rep( "  ", lvl )
	local table_indent = string.rep( "  ", lvl - 1 )
	local i = 1

	MsgC( red, "{\n" )

	for k, v in iter( tbl ) do
		if ( isSeq ) then
			Msg( indent )
		else
			k, v = v.k, v.v
			MsgKey( indent, k )
		end

		if ( istable( v ) and IsColor( v ) == false ) then
			if already[ v ] then
				MsgC( purple, tostring( v ) )
			else
				already[ v ] = true
				esclib:PrintTable( v, lvl + 1, already )
			end
		else
			MsgValue( v )
		end

		if i == len then
			Msg( "\n" )
		else
			MsgC( red, ",\n" )
		end

		i = i + 1
	end

	MsgC( table_indent, red, "}" )

	if ( lvl == 1 ) then Msg( "\n" ) end
end






-------------------------
--# LOGGING FUNCTIONS #--
-------------------------
local log_invitation_clr = Color(170,170,170)
local log_client_color = Color(255,181,20)
local log_server_color = Color(20,188,255)
function esclib.print(message)
    local info = debug.getinfo(2, "Sl")
    local source = info and info.source or ""
    local filename = source:match("@(.-)$") or source
    local line = info and info.currentline or -1

    local prefix = (CLIENT and "∎∎∎" or "∎∎∎") .. " "
    local location = string.format("[%s | %s:%s] ",
        CLIENT and "CLIENT" or "SERVER",
        filename,
        line
    )

    local content = tostring(message)
    local msg_istable = type(message) == "table"
    if msg_istable then
        content = ""
    end

    MsgC(
        CLIENT and log_client_color or log_server_color,
        prefix,
        log_invitation_clr,
        location,
        CLIENT and log_client_color or log_server_color,
        content .. "\n"
    )

    if msg_istable then
        esclib:PrintTable(message)
    end
end
--PATH addons/____esclib/lua/elib/essentials/settings_menu/settings_types/esc_type_form.lua:
local draw_bg = esclib.settings_shared_funcs.draw_bg
local VarsIsEqual = esclib.settings_shared_funcs.VarsIsEqual
local SharedDoRightClick = esclib.settings_shared_funcs.SharedDoRightClick

------------
--# FORM #--
------------
local stype = esclib:RegisterSettingsType("form")
stype.form_data = {}
stype:Require("FormFields")
stype:Require("value")
stype:SoftRequire("HintTranslateKey")
function stype:Build( parent )
	local addon     = parent.addon
	local varid     = parent.var_uid
	local varc      = parent.var
	local callback  = parent.ApplyValue
	local varc_copy = parent.initial_values
	local settab    = parent.bg
	local listing   = parent.parent
	local def_val   = parent.default_value or {}

	local button_wide = parent:GetWide()
	local button_tall = parent:GetTall()

	local clr = esclib.addon:GetColors()
	local font = esclib:AdaptiveFont("esclib", 20, 500)
	local font2 = esclib:AdaptiveFont("esclib", 16, 500)
	local name_tr  = varc.name or addon:Translate(varc.name_tr)
	local desc = varc.desc or addon:Translate(varc.desc_tr)

	local name = esclib.util:TextCutAccurate(name_tr, font, button_wide-15-90, "...")

	local form_data = table.Copy(varc.FormFields)

	local shadow_bg = Color(0,0,0, 200)
	local mat = esclib:GetMaterial("cross.png")
	local x,y = 0,0
	for sub_name,subvar in pairs(varc.value) do
		local var_pnl = listing:Add("DButton")
		var_pnl:SetSize(button_wide, button_tall)
		var_pnl:SetText("")
		var_pnl.DoRightClick = function(self) 
			local context = SharedDoRightClick(self, settab, name_tr, addon, varid, varc.value[sub_name], nil, callback)

			local set_default = esclib.addon:Translate("phrase_ReturnDefault", addon:GetLanguage())
			context:AddButton(set_default, function()
				esclib:SafeMerge(varc.value[sub_name] or {}, def_val[sub_name] or {}, true)
				callback(varid,varc.value)
			end, esclib:GetMaterial("revert.png"))
		end

		local remove_btn = var_pnl:Add("DButton")
		remove_btn:SetText("")
		remove_btn:SetSize(var_pnl:GetTall()*0.8, var_pnl:GetTall())
		remove_btn:SetPos(var_pnl:GetWide()-remove_btn:GetWide(), var_pnl:GetTall()*0.5 - remove_btn:GetTall()*0.5)
		function remove_btn:Paint(w,h)
			local hovered = self:IsHovered()

			esclib.draw:MaterialCentered(w*0.5, h*0.5, h*0.15, hovered and clr.button.discard or clr.button.text, mat)
		end

		function remove_btn:DoClick()
			esclib:ConfirmWindow("", esclib.addon:Translate("phrase_AreYouSure", addon:GetLanguage()),function(res)
				if res then
					varc.value[sub_name] = nil
					callback()
					parent:SaveAll()
				end
			end)
		end

		function var_pnl:DoClick()
			local pnl = esclib:GeneratePopWindow()
			pnl:SetTitle(sub_name)
			pnl:SetSize(button_wide,esclib.scrh*0.7)
			pnl:SetRoundSize(8)
			pnl:SetIcon(esclib:GetMaterial("cog.png"))
			
			function pnl:OnEndDragging()
				x,y = self:GetPos()
			end

			local content = pnl:GetContent()

			local function own_build()
				content:Clear()
			
				local plist = content:Add("esclib.scrollpanel")
				plist:Dock(FILL)
				plist:InvalidateParent(true)
				plist:Clear()

				local layout = plist:Add("DIconLayout")
				-- layout:SetSize(plist:GetWide(), plist:GetTall())
				layout:SetWide(plist:GetWide())
				layout:SetBorder(5)
				layout:SetSpaceY(5)
				layout:SetStretchHeight(true)
				layout:Clear()
				
				for _,form_value in ipairs(form_data) do
					local form_name = form_value["uid"]
					local var_value = subvar[form_name]

					local var = {}
					esclib:SafeMerge(var, form_value, true)

					if type(var_value) == "table" then
						var.value = table.Copy(var_value)
					else
						var.value = var_value
					end

					local var_base = layout:Add("DPanel")
					var_base:SetSize(plist:GetWide()-layout:GetBorder()*2, button_tall)
					var_base.Paint = nil
					var_base.addon = addon
					var_base.var_uid = form_name
					var_base.var = var
					if def_val[sub_name] then
						var_base.default_value = def_val[sub_name][form_name]
					end

					var_base.initial_values = varc.value[sub_name]
					var_base.ApplyValue = function()
						subvar[form_name] = var_base.var.value
						varc.value[sub_name][form_name] = var_base.var.value
						-- callback()
						own_build()
					end
					var_base.bg = pnl.bg
					var_base.parent = listing

					local ftype = form_value["type"]
					local builder = esclib.allowed_settings_types[ftype]
					if builder then
						builder:Build(var_base)
					end
				end

				timer.Simple(0, function()
					if not IsValid(pnl) or not IsValid(layout) then return end
					
					local tall = layout:GetTall() + pnl.titlepanel:GetTall() + layout:GetBorder()
					pnl:SetTall(math.min(tall, esclib.scrh*0.7))
					if x == 0 and y == 0 then
						pnl:Center()
						x,y = pnl:GetPos()
					else
						pnl:SetPos(x,y)
					end
				end)
			end

			function pnl.bg:OnClose()
				callback()
			end

			own_build()
		end

		local mat = esclib:GetMaterial("wrench.png")
		local offset_x = 15.0
        local first_text = name.." ["..sub_name.."]"
        local second_text = ""
        for _,form_value in ipairs(form_data) do
            if form_value.form_display then
                local form_name = form_value.name or addon:Translate(form_value.name_tr) or ""
                local text_to_add = form_name..": "..tostring(varc.value[sub_name][form_value.uid])
                if second_text ~= "" then
                    second_text = second_text..', '
                end
                second_text = second_text..text_to_add
            end
        end
		function var_pnl:Paint(w,h)
			local hovered = self:IsHovered()
			local is_changed = not VarsIsEqual(varc_copy[varid][sub_name], varc.value[sub_name])
			draw_bg(w,h,hovered,clr,is_changed)

			draw.SimpleText(first_text,font,offset_x,8,clr.button.text,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
			draw.SimpleText(second_text,font2,offset_x,h-8,clr.button.accent,TEXT_ALIGN_LEFT,TEXT_ALIGN_BOTTOM)

			if hovered then
				offset_x = Lerp(0.1, offset_x, h)
				esclib.draw:MaterialCentered(offset_x-h*0.5, h*0.5, h*0.25, clr.button.text, mat)
			else
				offset_x = Lerp(0.1, offset_x, 15.0)
			end
		end
	end

	parent:Hide()

	local button = listing:Add("DButton")
	button:SetSize(button_wide, button_tall)
	button:SetText("")
	if desc then
		local added = ""
		button:eAddHint(added.." "..desc,esclib:AdaptiveFont("esclib", 20, 500),TEXT_ALIGN_CENTER,settab)
	end
	
	local offsety = button:GetTall()*0.2
	local clr_black = Color(0,0,0)
	function button:Paint(w,h)
		local hovered = self:IsHovered()
		draw.RoundedBox(8,0,0,w,h,hovered and clr.button.accent_hover or clr.button.accent)
		
		draw.SimpleText("+ "..name,font,15,8,clr_black,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.SimpleText(desc,font2,15,h-8,clr_black,TEXT_ALIGN_LEFT,TEXT_ALIGN_BOTTOM)
	end

	function button:DoClick()
		local hint = varc.HintTranslateKey and addon:Translate(varc.HintTranslateKey) or esclib.addon:Translate("window_ValueEdit", addon.info.language)
		local text_input = esclib:TextInputWindow(name_tr, hint, false, false, 
			function(result)
				if not result then return end

				local tbl = {}

				for _,v in ipairs(form_data) do
					tbl[v["uid"]] = v["value"] or ""
				end

				varc.value[result] = tbl
				callback()
				parent:SaveAll()
			end,
			function(val)
				local slen = string.len(string.Trim(val) or "")
				local maxv = 255
				local minv = 2

				if not ((slen >= minv) and (slen <= maxv)) then
					return string.format("%s <= #str <= %s", minv, maxv)
				end
				return not ((slen >= minv) and (slen <= maxv))
			end,
			addon.info.language
		)
		text_input:SetText("")
	end
end



---------------
--# EXAMPLE #--
---------------

--[[
sv_tab:AddVar("rank_form", "form")
:SetNameTranslateKey("s_rank_name")
:SetDescTranslateKey("s_rank_desc")
:SetHintTranslateKey("s_rank_hint")
:SetShared(true)
:SetValue({
    ["superadmin"] = {
        ["rank_draw"] = true,
        ["rank_name"] = "superadmin",
        ["rank_color1"] = Color(220,27,255),
        ["rank_color2"] = Color(255,0,150),
        ["rank_glow"] = true,
        ["rank_admin_cmds"] = true,
    },
    ["user"] = {
        ["rank_draw"] = false,
        ["rank_name"] = "user",
        ["rank_color1"] = Color(255,255,255),
        ["rank_color2"] = Color(255,255,255),
        ["rank_glow"] = false,
        ["rank_admin_cmds"] = false,
    },
}) -- by default
:SetFormFields({
    {
        ["uid"] = "rank_draw",
        ["type"] = "bool",
        ["name_tr"] = "form_rank_draw",
        ["value"] = true,
    },
    {
        ["uid"] = "rank_name",
        ["type"] = "str",
        ["name_tr"] = "form_rank_name",
        ["MinimumCharCount"] = 1,
        ["MaximumCharCount"] = 255,
        ["value"] = "change_me",
        ["form_display"] = true,
    },
    {
        ["uid"] = "rank_color1",
        ["type"] = "clr",
        ["name_tr"] = "form_rank_color1",
        ["value"] = Color(255,255,255),
    },
    {
        ["uid"] = "rank_color2",
        ["type"] = "clr",
        ["name_tr"] = "form_rank_color2",
        ["value"] = Color(255,255,255),
    },
    {
        ["uid"] = "rank_glow",
        ["type"] = "bool",
        ["name_tr"] = "form_rank_glow",
        ["value"] = false,
    },
    {
        ["uid"] = "rank_admin_cmds",
        ["type"] = "bool",
        ["name_tr"] = "form_rank_admin_cmds",
        ["value"] = false,
    },
})
--]]
--PATH addons/____echat/lua/echat/config/config.lua:
echat.config = echat.config or {}
local cfg = echat.config

--------------------
--# Basic config #--
--------------------
cfg.multiline = false
cfg.emojies = true
cfg.max_message_len = 256 --maximum chars
cfg.chat_name = "Чат" --name in the left corner

------------------------
--# In game defaults #--
------------------------
cfg.base_font_size = 20
cfg.chat_spacey = 1
cfg.message_time = 8 -- in seconds
cfg.maximum_lines = 512 --maximum active lines in chat (for optimization)
cfg.maximum_autocomplete_hints = 80
cfg.pos_x = 0.01 --Relative X position of the left corner of the chat on the screen [0, 1]
cfg.pos_y = 0.45 --Relative Y position of the left corner of the chat on the screen [0, 1]
cfg.size_width = 0.36 --Relative size (width) from the screen. [0, 1]
cfg.size_height = 0.33 --Relative size (height) from the screen. [0, 1]
cfg.clear_chat = false --Clear chat textentry after closing it
cfg.ambilight = true --Enable ambilight effect
cfg.ambilight_clr1 = Color(0,225,255,100)
cfg.ambilight_clr2 = Color(0,255,157,100)


-------------------------
--# Message modifiers #--
-------------------------
--formats:
-- {hour}:{minute}:{second} --24 time format
-- {hour12}:{minute}:{second} {am_pm} --12 hours format
-- {time}, 24 hours time format
-- {time12}, 12 hours time format
-- {message} Full message. fe - [superadmin] onexev: hello world!
cfg.time_format = "{hour}:{minute}"

-- <time> -- formatted time (see above)
-- <adafont_mono> - adaptive monospaced font | <adafont> - adaptive font
--custom parsers like <clr> you can found in core/parsers.lua
cfg.message_format = "<clr:gray><adafont_mono><time><adafont> <clr:red2> {message}"


--["Rank / SteamID64"] = "format"
-- formats: {rank}, {nick}, {job_color} {steamid}, {steamid64}
-- You can use emoji here!
-- custom parsers like <clr> you can found in core/parsers.lua
-- <clr:> uses colors from pallete
-- <theme:main.text> uses colors from themes.lua
cfg.rank_formats = {
    -- ["superadmin"] = "<clr:white>:fire: <rainbow>[{rank}] {job_color}{nick}",

    -- ["admin"] = "<rgb:255,40,0>[Administrator]{job_color} {nick}",
    
    --steamid64 example (it is a higher priority than rank format)
    -- ["76561198123505655"] = "<rgb:255,40,0>[echat dev] {job_color}{nick}",

    --format, if no required format is found, i.e. default format (user for example) --DONT CHANGE NAME __default__
    ["__default__"] = "{job_color}{nick}",
}


-----------------------
--# Custom commands #--
-----------------------
-- me_command, pm_command, ooc_command, advert_command - only works in DarkRP

--formats: {nick} {text}
cfg.me_command = {
    ["enabled"] = false,
    ["format"] = "<clr:pink>[Action] {nick}: {text}",
}

--formats: {from} {to} {from_nick} {to_nick}
--{from_nick} {to_nick} are needed to avoid formatting by usergroup (if you want it)
cfg.pm_command = {
    ["enabled"] = false,
    ["sender"] = { --outcoming message
        ["format"] = "<clr:green>[PM] <clr:orange>{from}<clr:green> -> <clr:orange>{to}<clr:white>: "
    },
    ["reciever"] = { --incoming message
        ["format"] = "<clr:green>[PM] <clr:orange>{from}<clr:green> -> <clr:orange>{to}<clr:white>: "
    }
}

--formats: {jobclr} {ply} {ply_nick} {steamid} {steamid64}
cfg.ooc_command = {
    ["enabled"] = false,
    ["format"] = "{jobclr}[OOC] {ply}<clr:white>: ",
}

--formats {jobclr} {ply} {ply_nick} {steamid} {steamid64}
cfg.advert_command = {
    ["enabled"] = false,
    ["format"] = "<clr:orange>[Advert] {ply}: <clr:orange>"
}

--You can specify any of your commands here and they will be a autocomplete hint in the game.
cfg.custom_commands = {
    -- ["!best_ban"] = { --will be !best_ban <player_name> <reason> <time>
    --     ["args"] = { --It's just a list of supposed arguments
    --         "<player_name>", --any string here
    --         "<reason>",
    --         "<time>",
    --     },
    --     ["description"] = "Your best ban command",
    -- },
    
    -- ["!best_ban"] = {}, --can be empty (no arguments and description)
}

-------------------
--# Game events #--
-------------------
cfg.game_events = {
    --formats: {username} {steamid}
    ["player_connect"] = {
        ["enable"] = false,
        ["format"] = "<clr:green>[+] <clr:white>Гравець <clr:gold>{username} ({steamid}) <clr:white>приєднався до сервера"--"<clr:green>[+] <clr:white>{player} "
    },

    --formats: {username} {steamid} {reason}
    ["player_disconnect"] = {
        ["enable"] = false,
        ["format"] = "<clr:red>[-] <clr:white>Гравець <clr:gold>{username} ({steamid}) <clr:white>відключився від сервера <clr:gold>[{reason}]"--"<clr:green>[+] <clr:white>{player} "
    },

    --formats: {text}
    ["server_say"] = {
        ["enable"] = true,
        ["format"] = "<clr:gray>[Console]: <clr:white>{text}",
    },
}


------------------------------
--# Modifiers accesibility #--
------------------------------
--If not defined there then parser will be available for everyone
--If the table is empty, no one has access
cfg.rank_parsers = {
    ["rainbow"] = {
        ["superadmin"] = true,
        --["moderator"] = true, --for example
    },
    ["shake"] = {
        ["superadmin"] = true,
    },
    ["separator"] = {
        ["superadmin"] = true,
    },
    ["rgb"] = {
        ["superadmin"] = true,
    },
    ["clr"] = {
        ["superadmin"] = true,
    },
    ["font"] = {
        ["superadmin"] = true,
    },
    ["adafont"] = { --adaptive font
        ["superadmin"] = true,
    },
    ["adafont_mono"] = { --adaptive font monospaced
        ["superadmin"] = true,
    },
    ["bg_col"] = {
        ["superadmin"] = true,
    },
    ["theme"] = { --theme colors
        ["superadmin"] = true,
    },
    ["time"] = { --Useful if you want to specify the current time on the computer when sending a message from the server
        ["superadmin"] = true,
    },
    ["img"] = {
        ["superadmin"] = true,
    },
    -- ["separator"] = {}, --no one can use it
}

-- chatlisteners access control 
-- Display information about chat listeners only to the necessary people
cfg.chatlisteners_access_control = {
    ["enabled"] = false, --enable access control? false - everyone can see

    --Config
    ["jobs"] = {
        ["__inversed__"] = false, --If true, the jobs listed here do not see chatlisteners, otherwise - only these jobs can see chatlisteners
        ["YourSuperCoolJob"] = true,
    },

    ["usergroups"] = { --has more priority
        ["__inversed__"] = false, --If true, the usergroups listed here do not see chatlisteners
        ["superadmin"] = true,
    },
}


----------------------
--# Autocompleters #--
----------------------
--you can enable/disable some autocompleters here
--to disable, simple change true -> false
-- NOTE: Restart needed
cfg.autocompleters = {
    ["PlayerHelper"] = true, --PlayerHelper - id from complete_helpers.lua
    ["EmojiHelper"] = true,
    ["ParserHelper"] = true,
    ["DarkRP_Commands"] = true, --If you have a different gamemode, disables automatically, no need to disable that here.
    ["SAM_Commands"] = true,
    ["sAdmin_Commands"] = true,
}

---------------
--# Pallete #--
---------------
--pallete for <clr> modifier
cfg.pallete = {
    red = Color(255, 0, 0),
    red2 = Color(150, 50, 50),
    green = Color(0, 255, 0),
    blue = Color(0, 0, 255),
    yellow = Color(255, 255, 0),
    orange = Color(255, 165, 0),
    purple = Color(128, 0, 128),
    pink = Color(255, 192, 203),
    cyan = Color(0, 255, 255),
    white = Color(255, 255, 255),
    black = Color(0, 0, 0),
	gold = Color(255, 215, 0),
	silver = Color(192, 192, 192),
	gray = Color(128, 128, 128),
}




--DONT TOUCH IT! Lua refresh compat
if isfunction(echat.Restart) then echat:Restart() end
--PATH addons/____echat/lua/echat/config/languages.lua:
local langs = {
	---------------
	--# ENGLISH #--
	---------------
	["en"] = {
		__name__ = "English", --name in game
		__code__ = "US", --Language code: https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2

		chat_mode_normal = "Say",
		chat_mode_team = "Team",

		type_something = "Type something...",
		send = "Send",
		settings = "Settings",
		emoji = "Emoji",
		copied_to_clipboard = "Text copied to clipboard!",
		sizing_mode = "Editing size",
		goto_end = "Go to end",
		copy = "Copy",

		--parser related
		rgb_hint = "RGB color 3 or 4 number(alpha)",
		rainbow_hint = "Rainbow effect",
		separator_hint = "Separation line. No arguments",
		clr_hint = "Color from pallete",
		shaking_hint = "Start / Stop shaking effect. Param: [0(none),1] - Shake intensivity",
		font_hint = "Use specific font",

		--settings related
		s_tab_general = "General",
		s_tab_location = "Location",
		s_tab_parser_examples = "Parser examples",
		s_chat_spacey_name = "Message gap",
		s_chat_spacey_desc = "Distance between chat messages",
		s_font_size_name = "Font size", --font size
		s_msg_time_name = "Message time",
		s_msg_time_desc = "Message time on screen in seconds",
		s_max_lines_name = "Maximum lines",
		s_max_lines_desc = "Maximum lines visible in chat",
		s_posx_name = "Position X",
		s_posy_name = "Position Y",
		s_sizew_name = "Width",
		s_sizeh_name = "Height",
		s_xywh_mod_name = "This setting is automatically saved when you change the chat window",
		s_autocomplete_count_name = "Autocomplete hints",
		s_autocomplete_count_desc = "Autocomplete hints count when you typing something",
		s_base_font_size_name = "Font size",
		s_base_font_size_desc = "Base font size (screen dependent)",
		s_clean_chat_name = "Clean input on close",
		s_clean_chat_desc = "Clean the input when closing chat",
		s_ambilight_name = "Ambilight",
		s_ambilight_clr1_name = "Ambilight color 1",
		s_ambilight_clr2_name = "Ambilight color 2",
		s_chat_name_name = "Chat name",
	},

	-----------------
	--# UKRAINIAN #--
	-----------------
	["ua"] = {
		__name__ = "Українська", --name in game
		__code__ = "UA", --Language code: https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2

		chat_mode_normal = "Сказати",
		chat_mode_team = "Группа",

		type_something = "Напишіть щось...",
		send = "Відправити",
		settings = "Налаштування",
		emoji = "Емодзі",
		copied_to_clipboard = "Текст скопійовано у буфер обміну!",
		sizing_mode = "Редагування розміру ",
		goto_end = "До кінця",
		copy = "Скопіювати",

		--parser related
		rgb_hint = "RGB колій 3 чи 4 числа(альфа канал)",
		rainbow_hint = "Ефект веселки. Переливається будь-яким новим кольором",
		separator_hint = "Лінія розділу. Без аргументів",
		clr_hint = "Колір з палітри",
		shaking_hint = "Почати / зупинити Ефект тряски. Параметр: [0(none),1] - сила",
		font_hint = "Використовувати специфічний шрифт",

		--settings related
		s_tab_general = "Основа",
		s_tab_location = "Положення",
		s_tab_parser_examples = "Приклади парсера",
		s_chat_spacey_name = "Відстань між повідомленнями",
		s_chat_spacey_desc = "Дистанція між повідомленнями у чаті",
		s_font_size_name = "Розмір шрифту", --font size
		s_msg_time_name = "Час повідомлення",
		s_msg_time_desc = "Час повідомлення на екрані в секундах",
		s_max_lines_name = "Максимум ліній",
		s_max_lines_desc = "Максимум ліній, які можна побачити в чаті",
		s_posx_name = "Позиція X",
		s_posy_name = "Позиція Y",
		s_sizew_name = "Ширина",
		s_sizeh_name = "Висота",
		s_xywh_mod_name = "Це налаштування автоматично зберігається коли ви редагуєте вікно чату",
		s_autocomplete_count_name = "Кількість підказок",
		s_autocomplete_count_desc = "Кількість підказок при наборі тексту у вікні чату",
		s_base_font_size_name = "Розмір шрифту",
		s_base_font_size_desc = "Базовий розмір шрифту (залежить від екрану)",
		s_clean_chat_name = "Очистити набір",
		s_clean_chat_desc = "Очистити набір при закриті",
		s_ambilight_name = "Підсвічування",
		s_ambilight_clr1_name = "Колір підсвічування 1",
		s_ambilight_clr2_name = "Колір підсвічування 2",
		s_chat_name_name = "Назва чату",
	},

	---------------
	--# SPANISH #--
	---------------
	--by https://www.gmodstore.com/users/Goran
	["es"] = {
		__name__ = "Español",--name in game
		__code__ = "ES", --Language code: https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2

		chat_mode_normal = "Decir",
		chat_mode_team = "Equipo",

		type_something = "Escribe algo...",
		send = "Enviar",
		settings = "Ajustes",
		emoji = "Emoji",
		copied_to_clipboard = "¡Texto copiado al portapapeles!",
		sizing_mode = "Editar tamaño",
		goto_end = "Ir al final",
		copy = "Copiar",

		--parser related
		rgb_hint = "Color RGB. Admite 3 o 4 números (4 = alpha)",
		rainbow_hint = "Efecto arcoíris",
		separator_hint = "Línea de separación. Sin argumentos",
		clr_hint = "Paleta de colores",
		shaking_hint = "Iniciar / Detener efecto de temblor. Parám.: [0(nada),1] - Intensidad del temblor",
		font_hint = "Usar una fuente específica",

		--settings related
		s_tab_general = "General",
		s_tab_location = "Ubicación",
		s_tab_parser_examples = "Ejemplos de analizador",
		s_chat_spacey_name = "Espacio de los mensajes",
		s_chat_spacey_desc = "Distancia entre los mensajes de chat",
		s_font_size_name = "Tamaño de la fuente", --font size
		s_msg_time_name = "Duración del mensaje",
		s_msg_time_desc = "Tiempo del mensaje en pantalla en segundos",
		s_max_lines_name = "Líneas máximas",
		s_max_lines_desc = "Líneas máximas visibles",
		s_posx_name = "Posición en eje X",
		s_posy_name = "Posición en eje Y",
		s_sizew_name = "Largo",
		s_sizeh_name = "Alto",
		s_xywh_mod_name = "Este ajuste se guarda automáticamente cuando modificas la ventana de chat",
		s_autocomplete_count_name = "Pistas de autocompletado",
		s_autocomplete_count_desc = "Autocompleta los comandos mientras se escribe",
		s_base_font_size_name = "Tamaño de la fuente",
		s_base_font_size_desc = "Tamaño de la fuente base (depende de la resolución)",
		s_clean_chat_name = "Limpiar la entrada",
		s_clean_chat_desc = "Limpiar la entrada al cerrar",
		s_ambilight_name = "Subrayado",
		s_ambilight_clr1_name = "Color de subrayado 1",
		s_ambilight_clr2_name = "Color de subrayado 2",
		s_chat_name_name = "Nombre del chat",
	},


	--------------
	--# FRENCH #--
	--------------
	-- by https://www.gmodstore.com/users/76561198273468522
	["fr"] = {
		__name__ = "French",--name in game
		__code__ = "FR", --Language code: https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2

		chat_mode_normal = "Parler",
		chat_mode_team = "Equipe",

		type_something = "Ecrire quelque chose...",
		send = "Envoyer",
		settings = "Paramètres",
		emoji = "Emoji",
		copied_to_clipboard = "Texte copié dans le presse-papier !",
		sizing_mode = "Taille d'édition",
		goto_end = "Aller jusqu'au bout",
		copy = "Copier",

		--parser related
		rgb_hint = "Couleur RBG 3 ou 4 chiffres (alpha)",
		rainbow_hint = "Effet arc-en-ciel",
		separator_hint = "Ligne de séparation",
		clr_hint = "Couleur depuis la palette",
		shaking_hint = "Commencer / arrêter l'effet de secousse. Param: [0(none),1] - Intensité de la secousse",
		font_hint = "Utiliser une police spécifique",

		--settings related
		s_tab_general = "Général",
		s_tab_location = "Emplacement",
		s_tab_parser_examples = "Exemple d'analyse",
		s_chat_spacey_name = "Ecart de message",
		s_chat_spacey_desc = "Distance entre les messages dans le chat",
		s_font_size_name = "Taille de la police", --font size
		s_msg_time_name = "Durée du messages",
		s_msg_time_desc = "Durée du message à l'écran en secondes",
		s_max_lines_name = "Lignes maximum",
		s_max_lines_desc = "Maximum de lignes visibles dans le chat",
		s_posx_name = "Position X",
		s_posy_name = "Position Y",
		s_sizew_name = "Largeur",
		s_sizeh_name = "Hauteur",
		s_xywh_mod_name = "Ce paramètre est automatiquement enregistré lorsque vous modifiez la fenêtre de discussion",
		s_autocomplete_count_name = "Compteur du correcteur semi-automatique ",
		s_autocomplete_count_desc = "Compteur du correcteur semi-automatique pendant que vous tapez quelque chose",
		s_base_font_size_name = "Taille de la police",
		s_base_font_size_desc = "Taille de police de base (en fonction de l'écran)",
		s_clean_chat_name = "Nettoyez l'entrée lors",
		s_clean_chat_desc = "Nettoyez l'entrée lors de la fermeture",
		s_ambilight_name = "Sous-lumière",
		s_ambilight_clr1_name = "Couleur de sous-lumière 1",
		s_ambilight_clr2_name = "Couleur de sous-lumière 2",
		s_chat_name_name = "Nom du chat",
	},

	---------------
	--# DEUTSCH #--
	---------------
	--by https://www.gmodstore.com/users/76561198801156110
	["de"] = {
		__name__ = "Deutsch",--Name im Spiel
		__code__ = "DE", --Sprachcode: https://de.wikipedia.org/wiki/ISO_3166-1_alpha-2

		chat_mode_normal = "Sprechen",
		chat_mode_team = "Team",

		type_something = "Etwas schreiben...",
		send = "Senden",
		settings = "Einstellungen",
		emoji = "Emoji",
		copied_to_clipboard = "Text in die Zwischenablage kopiert!",
		sizing_mode = "Bearbeitungsgröße",
		goto_end = "Zum Ende gehen",
		copy = "Kopieren",

		--Parser-bezogen
		rgb_hint = "RGB-Farbe mit 3 oder 4 Ziffern (Alpha)",
		rainbow_hint = "Regenbogeneffekt",
		separator_hint = "Trennlinie",
		clr_hint = "Farbe aus der Palette",
		shaking_hint = "Starten/Stoppen des Schüttel-Effekts. Parameter: [0(keiner), 1] - Intensität des Schüttelns",
		font_hint = "Bestimmte Schriftart verwenden",

		--Einstellungsbezogen
		s_tab_general = "Allgemein",
		s_tab_location = "Ort",
		s_tab_parser_examples = "Parser-Beispiele",
		s_chat_spacey_name = "Nachrichtenabstand",
		s_chat_spacey_desc = "Abstand zwischen den Nachrichten im Chat",
		s_font_size_name = "Schriftgröße",
		s_msg_time_name = "Nachrichtendauer",
		s_msg_time_desc = "Dauer der Nachricht auf dem Bildschirm in Sekunden",
		s_max_lines_name = "Maximale Zeilen",
		s_max_lines_desc = "Maximale sichtbare Zeilen im Chat",
		s_posx_name = "Position X",
		s_posy_name = "Position Y",
		s_sizew_name = "Breite",
		s_sizeh_name = "Höhe",
		s_xywh_mod_name = "Diese Einstellung wird automatisch gespeichert, wenn Sie das Chat-Fenster ändern",
		s_autocomplete_count_name = "Semi-automatischer Autokorrektur-Zähler",
		s_autocomplete_count_desc = "Zähler für die semi-automatische Autokorrektur während des Schreibens",
		s_base_font_size_name = "Basis-Schriftgröße",
		s_base_font_size_desc = "Grundlegende Schriftgröße (abhängig vom Bildschirm)",
		s_clean_chat_name = "Reinigen Sie den Eingang",
		s_clean_chat_desc = "Reinigen Sie den Eingang beim Schließen",
		s_ambilight_name = "Unterstreichung",
		s_ambilight_clr1_name = "Basis-Schriftgröße",
		s_ambilight_clr2_name = "Basis-Schriftgröße",
		s_chat_name_name = "Basis-Schriftgröße",
	},

	--------------
	--# POLISH #--
	--------------
	-- by https://www.gmodstore.com/users/76561198260331846
	["pl"] = {
		__name__ = "Polish",
		__code__ = "PL",

		chat_mode_normal = "Globalny",
		chat_mode_team = "Drużyna",

		type_something = "Napisz coś...",
		send = "Wyślij",
		settings = "Ustawienia",
		emoji = "Emotki",
		copied_to_clipboard = "Tekst skopiowany do schowka!",
		sizing_mode = "Edycja rozmiarów",
		goto_end = "Idź do końca",
		copy = "Skopiuj",

		--parser related
		rgb_hint = "Kolor RGB 3 lub 4 wartości(alpha)",
		rainbow_hint = "Efekt tęczy",
		separator_hint = "Separator. Brak argumentów!",
		clr_hint = "Kolor z palety",
		shaking_hint = "Rozpocznij / Zatrzymaj efekt wstrząsów. Parametry: [0(none),1] - Intensywność wstrząsów",
		font_hint = "Użyj konkretnej czcionki",

		--settings related
		s_tab_general = "Ogólne",
		s_tab_location = "Lokalizacja",
		s_tab_parser_examples = "Przykłady parsera",
		s_chat_spacey_name = "Odstęp wiadomości",
		s_chat_spacey_desc = "Dystans między wiadomościami czatu",
		s_font_size_name = "Rozmiar czcionki", --font size
		s_msg_time_name = "Czas wiadomości",
		s_msg_time_desc = "Czas wiadomości na ekranie w sekundach",
		s_max_lines_name = "Maksymalna liczba linii",
		s_max_lines_desc = "Maksymalna ilość linii na czacie",
		s_posx_name = "Pozycja X",
		s_posy_name = "Pozycja Y",
		s_sizew_name = "Szerokość",
		s_sizeh_name = "Wysokość",
		s_xywh_mod_name = "To ustawienie jest automatycznie zapisywane po zmianie okna czatu",
		s_autocomplete_count_name = "Podpowiedzi autouzupełnienia",
		s_autocomplete_count_desc = "Liczba podpowiedzi autouzupełnienia, gdy coś piszesz",
		s_base_font_size_name = "Rozmiar czcionki",
		s_base_font_size_desc = "Podstawowy rozmiar czcionki (zależne od ekranu)",
		s_clean_chat_name = "Oczyść dane wejściowe",
		s_clean_chat_desc = "Oczyść dane wejściowe podczas zamykania",
		s_ambilight_name = "Podświetlenie",
		s_ambilight_clr1_name = "Podstawowy rozmiar czcionki",
		s_ambilight_clr2_name = "Podstawowy rozmiar czcionki",
		s_chat_name_name = "Podstawowy rozmiar czcionki",
	},

	--------------
	--# Turkish #--
	--------------
	-- by https://www.gmodstore.com/users/maellwoe
	["tr"] = {
        __name__ = "Turkish",
        __code__ = "TR",

        chat_mode_normal = "Konuş",
        chat_mode_team = "Takım",

        type_something = "Bir şeyler yaz...",
        send = "Gönder",
        settings = "Ayarlar",
        emoji = "Emoji",
        copied_to_clipboard = "Pano'ya kopyalandı.",
        sizing_mode = "Boyut ayarlanıyor",
        goto_end = "En sona git",
        copy = "Kopyala",

        --parser related
        rgb_hint = "3 veya 4 rakamlı RGB Renk(alpha)",
        rainbow_hint = "Gökkuşağı efekti",
        separator_hint = "Ayrım çizgisi. Konu yok.",
        clr_hint = "Palet'ten renk",
        shaking_hint = "Sallanma efektini Başlat / Durdur Param: [0(yok),1] - Sallanma Yoğunluğu",
        font_hint = "Spesifik font kullan",

        --settings related
        s_tab_general = "Genel",
        s_tab_location = "Konum",
        s_tab_parser_examples = "Ayrıştırıcı örnekleri",
        s_chat_spacey_name = "Mesaj boşluğu",
        s_chat_spacey_desc = "Sohbet mesajları arasındaki mesafe",
        s_font_size_name = "Font büyüklüğü", --font size
        s_msg_time_name = "Mesaj Zamanı",
        s_msg_time_desc = "Mesaj Zamanı'nda saniye",
        s_max_lines_name = "Maksimum satır",
        s_max_lines_desc = "Ekranda en fazla kaç satır gözükeceği",
        s_posx_name = "X Pozisyonu",
        s_posy_name = "Y Pozisyonu",
        s_sizew_name = "Genişlik",
        s_sizeh_name = "Uzunluk",
        s_xywh_mod_name = "Bu ayar, sohbet penceresini değiştirdiğinizde otomatik olarak kaydedilir",
        s_autocomplete_count_name = "Düzeltme ipuçları",
        s_autocomplete_count_desc = "Bir şeyler yazdığında hatalıları düzeltmek için ipuçları",
        s_base_font_size_name = "Font büyüklüğü",
        s_base_font_size_desc = "Temel yazı tipi boyutu (ekrana bağlı)",
		s_clean_chat_name = "Kapatırken girişi",
		s_clean_chat_desc = "Kapatırken girişi temizleyin",
		s_ambilight_name = "Podświetlenie",
		s_ambilight_clr1_name = "Podstawowy rozmiar czcionki",
		s_ambilight_clr2_name = "Podstawowy rozmiar czcionki",
		s_chat_name_name = "Podstawowy rozmiar czcionki",
    },

	----------------
	--# Chinese #--
	----------------
	-- by https://www.gmodstore.com/users/modcraft
	["zh-cn"] = {
		__name__ = "简体中文",
		__code__ = "CN",

		chat_mode_normal = "发言",
		chat_mode_team = "队伍",

		type_something = "说些什么...",
		send = "发送",
		settings = "设置",
		emoji = "表情",
		copied_to_clipboard = "已复制文本到剪切板!",
		sizing_mode = "编辑尺寸中",
		goto_end = "回到底部",
		copy = "复制",

		--parser related
		rgb_hint = "RGB 颜色 3 到 4 个数字(alpha)",
		rainbow_hint = "彩虹效果",
		separator_hint = "分割线. 无参数",
		clr_hint = "调色板上的颜色",
		shaking_hint = "开始 / 停止 抖动效果. 参数: [0,1] - 抖动强度",
		font_hint = "使用指定字体",

		--settings related
		s_tab_general = "一般",
		s_tab_location = "位置",
		s_tab_parser_examples = "解析器例子",
		s_chat_spacey_name = "间隔距离",
		s_chat_spacey_desc = "各条消息间的间隔距离",
		s_font_size_name = "字体大小", --font size
		s_msg_time_name = "消息时间",
		s_msg_time_desc = "消息显示在屏幕上的秒数",
		s_max_lines_name = "最大行数",
		s_max_lines_desc = "聊天中的最大可见行数",
		s_posx_name = "坐标 X",
		s_posy_name = "坐标 Y",
		s_sizew_name = "宽度",
		s_sizeh_name = "高度",
		s_xywh_mod_name = "设置将会在你关闭窗口后自动保存",
		s_autocomplete_count_name = "自动补全提示",
		s_autocomplete_count_desc = "在输入时使用自动补全",
		s_base_font_size_name = "字体大小",
		s_base_font_size_desc = "基础字体大小 (基于屏幕)",
		s_clean_chat_name = "关闭时清洁输入",
		s_clean_chat_desc = "关闭时清洁输入",
		s_ambilight_name = "高亮",
		s_ambilight_clr1_name = "基础字体大小",
		s_ambilight_clr2_name = "基础字体大小",
		s_chat_name_name = "基础字体大小",
	},
}

echat.addon:RegisterLanguages(langs)

-- if GetConVar("gmod_language") not in languages table, sets this language
echat.addon:SetDefaultLanguage("ua")
--PATH addons/____echat/lua/echat/core/modules/game_events.lua:
if SERVER then --only on server

local cfg = echat.config.game_events

----------------------
--# Player connect #--
----------------------
if cfg["player_connect"] and cfg["player_connect"].enable then
    hook.Add("player_connect", "echat.game_event.player_connect", function(data)
        if not data then return end

        local msg = cfg["player_connect"]["format"]
        local formatted_msg = esclib.text:KeyFormat(msg, {
            ["username"] = echat:EscapeParsed(data.name or "Unknown"),
            ["steamid"] = data.networkid or "STEAM_0:0:0",
        })

        local players = player.GetAll()
        local parsed = echat:ParseText(echat:FinalParse(formatted_msg))
        echat:SendParsedMessageToPlayer(nil, players, parsed)

    end)
    gameevent.Listen( "player_connect" )
end

-------------------------
--# Player disconnect #--
-------------------------
if cfg["player_disconnect"] and cfg["player_disconnect"].enable then
    hook.Add("player_disconnect", "echat.game_event.player_disconnect", function(data)
        if not data then return end

        local msg = cfg["player_disconnect"]["format"]
        local formatted_msg = esclib.text:KeyFormat(msg, {
            ["username"] = echat:EscapeParsed(data.name or "Unknown"),
            ["steamid"] = data.networkid or "STEAM_0:0:0",
            ["reason"] = data.reason or "Unknown"
        })

        local players = player.GetAll()
        local parsed = echat:ParseText(echat:FinalParse(formatted_msg))
        echat:SendParsedMessageToPlayer(nil, players, parsed)

    end)
    gameevent.Listen( "player_disconnect" )
end

if cfg["server_say"] and cfg["server_say"].enable then
    hook.Add( "player_say", "echat.game_event.player_say", function( data )
        if (not data.userid) or (data.userid != 0) then return end --check if server
        if (not data.text) or (data.text == "") then return end

        local msg = data.text or "???"
        local fmt = cfg["server_say"]["format"]
        local formatted_msg = esclib.text:KeyFormat(fmt, {
            ["text"] = msg,
        })

        local players = player.GetAll()
        local parsed = echat:ParseText(echat:FinalParse(formatted_msg))
        echat:SendParsedMessageToPlayer(nil, players, parsed)
    end )

    gameevent.Listen( "player_say" )
end


end --IF SERVER



if CLIENT then --ON CLIENT
    
    --Support for say console command
    hook.Add( "player_say", "echat.game_event.player_say", function( data )
        if (not data.userid) then return end
        if (LocalPlayer():UserID() ~= data.userid) then return end
        if (not data.text) or (data.text == "") then return end

        echat:SendMessageToServer(data.text)
    end )
    gameevent.Listen( "player_say" )

end --IF CLIENT

--PATH addons/____inventory/lua/itemstore/items/base_rp.lua:
ITEM.Name = "RP Item Base"
ITEM.Model = "models/error.mdl"
ITEM.Base = "base_entity"

function ITEM:CanPickup( pl, ent )
	if not ent.dt or not ent.dt.owning_ent then return true end

	if not itemstore.config.IgnoreOwner and ent:Getowning_ent() ~= pl then
		pl:ChatPrint( "Ти не можеш це забрати, це не твоє!" )
		return false
	end

	return true
end
