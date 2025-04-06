--Stealed clientside server code by exechack.cc
--Hostname: ⋙ GAMBITRP ╽ ПОДАРКИ ╽ FREE VIP ⋘ - Part 2/10 - 06/04/2025


--PATH addons/plib_v5/lua/plib/preload/badmodules_example.lua:

-----------------------------------------------------
-- This folder has total load priority over everything
-- This can be used to kill modules you dont use on your server
-- require 'example'  will now silently ignore this module
plib.BadModules['example'] = true
--PATH addons/plib_v5/lua/plib/extensions/file.lua:
local chunkSize		= 512 * 1024	-- Number of bytes to store in each chunk
local interval		= 0.1			-- Time between each chunk read/write
local workQueue = {}

local function processQueue(queue)
	if timer.Exists('file.DoStaggered') then return end
	if workQueue[1] then
		-- take something from the beginning of the queue and create
		-- a timer to repeatedly do it until it is odne
		local func = table.remove(workQueue, 1)
		timer.Create('file.DoStaggered', interval, 0, function()
			if func() then
				timer.Destroy('file.DoStaggered')
				processQueue()
			end
		end)
	else
		-- else there is no more work so we are done
		timer.Destroy('file.DoStaggered')
	end
end
function file.ReadStaggered(name, callback)
	-- open the file
	local f = file.Open(name, 'rb', 'DATA')
	if not f then error('failed to open file ' .. name .. '.') end

	-- we will construct a function
	-- to read the file in segments
	-- and call the callback when done
	do 
		local buffer = {}
		local function doRead()
			local data = f:Read(chunkSize)
			if not data or data:len() == 0 then
				f:Close()
				callback(table.concat(buffer))
				return true -- tell it to schedule the next job. this one is done.
			else
				buffer[#buffer + 1] = data
				return false
			end
		end
		table.insert(workQueue, doRead)
	end
	processQueue()
end

function file.WriteStaggered(name, str, callback)
	-- open the file
	local f = file.Open(name, 'wb', 'DATA')
	if not f then error('failed to open file ' .. name .. '.') end

	-- we will construct a function
	-- to read the file in segments
	-- and call the callback when done
	do 
		local len = str:len()
		local index = 0
		local function doWrite()
			local segment = string.sub(str, index * chunkSize, (index + 1) * chunkSize)
			f:Write(segment)
			index = index + 1
			if index * chunkSize > len then
				f:Close()
				callback(name)
				return true -- tell it to schedule the next job. this one is done.
			end
		end
		table.insert(workQueue, doWrite)
	end
	processQueue()
end
--PATH addons/plib_v5/lua/plib/extensions/type.lua:
local getmetatable 	= getmetatable
local tonumber 		= tonumber

local STRING 	= getmetatable ''
local ANGLE 	= FindMetaTable 'Angle'
local MATRIX 	= FindMetaTable 'VMatrix'
local VECTOR 	= FindMetaTable 'Vector'
local MATERIAL 	= FindMetaTable 'IMaterial'
local ENTITY 	= FindMetaTable 'Entity'
local PLAYER 	= FindMetaTable 'Player'
local PHYS 		= FindMetaTable 'PhysObj'
local WEAPON 	= FindMetaTable 'Weapon'
local NPC 		= FindMetaTable 'NPC'
local NEXTBOT 	= FindMetaTable 'NextBot'
local VEHICLE 	= FindMetaTable 'Vehicle'
local CSENTITY	= FindMetaTable 'CSEnt'

local entmts = {
	[ENTITY] 	= true,
	[VEHICLE] 	= true,
	[PHYS] 		= true,
	[WEAPON] 	= true,
	[NPC] 		= true,
	[PLAYER]	= true,
}

if (SERVER) then
	entmts[NEXTBOT] = true
else
    entmts[CSENTITY] = true
end

function isstring(v)
	return (getmetatable(v) == STRING)
end

function isangle(v)
	return (getmetatable(v) == ANGLE)
end

function ismatrix(v)
	return (getmetatable(v) == MATRIX)
end

function isvector(v)
	return (getmetatable(v) == VECTOR)
end

function ismaterial(v)
	return (getmetatable(v) == MATERIAL)
end

-- function isnumber(v)
	-- return (getmetatable(v) == nil) and (v ~= nil) and (v == tonumber(v))
-- end

function isbool(v)
	return (v == true) or (v == false)
end

function isentity(v)
	return (entmts[getmetatable(v)] == true)
end
IsEntity = isentity

function isplayer(v)
	return (getmetatable(v) == PLAYER)
end


function ENTITY:IsPlayer()
	return false
end

function PLAYER:IsPlayer()
	return true
end

function PHYS:IsPlayer()
	return false
end

function WEAPON:IsPlayer()
	return false
end

function NPC:IsPlayer()
	return false
end


function ENTITY:IsWeapon()
	return false
end

function PLAYER:IsWeapon()
	return false
end

function PHYS:IsWeapon()
	return false
end

function WEAPON:IsWeapon()
	return true
end

function NPC:IsWeapon()
	return false
end


function ENTITY:IsNPC()
	return false
end

function PLAYER:IsNPC()
	return false
end

function PHYS:IsNPC()
	return false
end

function WEAPON:IsNPC()
	return false
end

function NPC:IsNPC()
	return true
end


function ENTITY:IsNextbot()
	return false
end

function PLAYER:IsNextbot()
	return false
end

function PHYS:IsNextbot()
	return false
end

function WEAPON:IsNextbot()
	return false
end

function NPC:IsNextbot()
	return false
end


function ENTITY:IsPhysObj()
	return false
end

function PLAYER:IsPhysObj()
	return false
end

function PHYS:IsPhysObj()
	return false
end

function WEAPON:IsPhysObj()
	return false
end

function NPC:IsPhysObj()
	return false
end


if (SERVER) then
	function NEXTBOT:IsPlayer()
		return false
	end

	function NEXTBOT:IsWeapon()
		return false
	end

	function NEXTBOT:IsNPC()
		return false
	end

	function NEXTBOT:IsPhysObj()
		return false
	end

	function NEXTBOT:IsNextbot()
		return true
	end
end

--PATH addons/plib_v5/lua/plib/extensions/client/string.lua:
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
--PATH addons/plib_v5/lua/plib/extensions/client/surface.lua:
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

-- Begin the moonshit
-- DRAW QUAD
do
	local cos, sin = math.cos, math.sin
	local ang2rad = 3.141592653589/180
	local drawline = surface.DrawLine
	function surface.DrawArcOutline(_x, _y, r1, r2, aStart, aFinish, steps)
		aStart, aFinish = aStart*ang2rad, aFinish*ang2rad
		local step = ((aFinish - aStart) / steps)
		local c = steps

		local a, c1, s1, c2, s2

		c2, s2 = cos(aStart), sin(aStart)
		drawline(_x+c2*r1, _y+s2*r1, _x+c2*r2, _y+s2*r2)
		for _a = 0, steps - 1 do
			a = _a*step + aStart
			c1, s1 = c2, s2
			c2, s2 = cos(a+step), sin(a+step)


			drawline( _x+c1*r2, _y+s1*r2,
												_x+c2*r2, _y+s2*r2 )
			drawline( _x+c1*r1, _y+s1*r1,
												_x+c2*r1, _y+s2*r1 )
			c = c - 1
			if c < 0 then break end
		end
		drawline(_x+c2*r1, _y+s2*r1, _x+c2*r2, _y+s2*r2)
	end
end

-- GetTextSize caching
do
	local SetFont 		= surface.SetFont
	local GetTextSize 	= surface.GetTextSize

	local font = 'TargetID'
	local cache = setmetatable({}, {
		__mode = 'k'
	})

	timer.Create('surface.ClearFontCache', 1800, 0, function()
		for i = 1, #cache do
			cache[i] = nil
		end
	end)

	function surface.SetFont(_font)
		font = _font
		return SetFont(_font)
	end

	function surface.GetTextSize(text)
		if (not cache[font]) then
			cache[font] = {}
		end
		if (not cache[font][text]) then
			local w, h = GetTextSize(text)
			cache[font][text] = {
				w = w,
				h = h
			}
			return w, h
		end
		return cache[font][text].w, cache[font][text].h
	end
end
--PATH addons/cp_ballistic_shields/lua/ballistic_shields/cl_bs_util.lua:
if SERVER then return end
include( "bs_config.lua" )

net.Receive( "bs_shield_info", function( len, pl )
	LocalPlayer().bs_shieldIndex = net.ReadUInt(16)	
end )

local Delay = 0
function bshields_materials_reload()
	for _,v in pairs(bshields.materialstoload) do
		Delay = Delay + 0.2
		timer.Simple( Delay, function() surface.GetURL(v[1], v[2], v[3]) end )
	end

	bshields.hshield_webmat = surface.GetURL(bshields.config.hShieldTexture, 256, 256)
	bshields.rshield_webmat = surface.GetURL(bshields.config.rShieldTexture, 256, 256)
	bshields.dshield_webmat = surface.GetURL(bshields.config.dShieldTexture, 256, 256)
end

bshields.materialstoload = {
	{bshields.config.hShieldTexture, 256, 256},
	{bshields.config.rShieldTexture, 256, 256},
	{bshields.config.dShieldTexture, 256, 256}
}

hook.Add( "InitPostEntity", "bshields_init_client", function()
	bshields_materials_reload()
end)
      
surface.CreateFont( "bshields.HudFont", {
	font = "Roboto",
	size = ScrH()/1080*18,
	extended = true
})
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
--PATH addons/epoe/lua/epoe/client.lua:
local insert=table.insert
local remove=table.remove
local Empty=table.Empty
local setmetatable=setmetatable
local net=net
local IsValid=IsValid
local error=error
local select=select
local next=next
local unpack=unpack
local player=player
local pairs=pairs
local hook=hook
local table=table
local pcall=pcall
local concommand=concommand
local tostring=tostring
local type=type
local string=string
local usermessage=usermessage
local rawget=rawget
local Msg=Msg
local MsgN=MsgN
local print=print
local timer=timer
local ErrorNoHalt=ErrorNoHalt
local RunConsoleCommand=RunConsoleCommand
local cookie=cookie
local util=util
local G=_G
local MsgC=MsgC
local Color=Color
local CreateClientConVar=CreateClientConVar


module( "epoe" )

------------------------------------
-- Receiving
------------------------------------


-- Messages can come in multiple parts
-- TODO: If message gets aborted serverside this will fuck up, royally.
local Buffer=""

local lastmsg="<SHOULD NOT SEE>"
local lastflags=0
-- Handle incoming messages
function ProcessMessage(flags,str,col)

	-- Process sequences (aka long messages)
	if HasFlag(flags,IS_SEQ) then -- Store long messages
		Buffer=Buffer..str
		return
	elseif #Buffer>0 then -- Data in buffer and no SEQ flag. We have something to print! TODO: See above todo.
		str=Buffer..str
		Buffer=''
	end


	-- process epoe messages
	local isEpoe=HasFlag(flags,IS_EPOE)
	if isEpoe then

		if str=="_S" then
			subscribed=true
				internalPrint("Subscribed")
			return
		elseif str=="_US" then
			subscribed=false
			internalPrint("Unsubscribed")
			return
		elseif str=="_NA" then
			if AutologinRetry() then return end -- Some servers got delayed admins?
			internalPrint("No Access to server")
			return
		end
	end

	-- We are going to add the newline here instead of letting the handlers take care of it so you can just print the stuff and be done with it
	str=str..NewLine(flags)

	-- If we should not let's just return :x
	if not isEpoe and hook.Call(Should_TagHuman,nil,str,flags)==false then
		return
	end
	
	-- PRE-hook for modifying or completely rewriting the text
	local t = PreEPOE{txt=str,flags=flags,color=col}
	if not t then return end
	
	Output(t.txt or str,t.flags or flags,t.color or col)
end

function Output(str,flags,col)
	hook.Run(TagHuman,str,flags,col)
end

function OnMessage(len)
	local flags = net.ReadUInt(8)
	local msgc_col
	if HasMsgCParams(flags) then
		local r,g,b = net.ReadUInt(8), net.ReadUInt(8), net.ReadUInt(8)
		msgc_col = Color(r or 0,g or 255,b or 255,255)
	end
	local str = net.ReadString()
	ProcessMessage(flags,str,msgc_col)
end

net.Receive(Tag,function(len) OnMessage(len) end)


------------------------------------
-- EPOE Messages
------------------------------------
function internalPrint(...)
	local noerr,str=pcall(ToStringEx,"",...) -- just to be sure
	if !str then
		return
	end
	hook.Call(TagHuman,nil,str,IS_EPOE)
end

------------------------------------
-- Subscribing
------------------------------------

subscribed=false


function AddSub()
	if subscribed then 	internalPrint("Already subscribed.") return end
	RunConsoleCommand("cmd",Tag,"1")
end
concommand.Add('epoe_login',AddSub,nil,"Login to EPOE stream")

function DelSub()
	if !subscribed then 	internalPrint("Not subscribed.") return end
	RunConsoleCommand("cmd",Tag,"0")
end
concommand.Add('epoe_logout',DelSub,nil,"Logout from EPOE stream")


------------------------------------
-- Automatic login
------------------------------------

local autologin = CreateClientConVar("epoe_autologin","0",true,false)
hook.Add('InitPostEntity',TagHuman..'_autologin',function()
	if autologin:GetBool() then AddSub() end
end)

local tries=0
function AutologinRetry()
	tries=tries+1
	if tries > 2 then return true end
	timer.Simple(3,AddSub)
	internalPrint("Retrying autologin...")
end


------------------------------------
-- Printing to EPOE from client.
------------------------------------
local MODULE=_M
function MODULE.Msg(...)
	local ok,str=pcall(ToStringEx,"",...)
	if not ok then internalPrint(str) return end
	if not str then return end

	ProcessMessage(IS_MSG,str)
end

function MODULE.MsgN(...)
	local ok,str=pcall(ToStringEx,"",...)
	if not ok then internalPrint(str) return end
	if not str then return end

	ProcessMessage(IS_MSGN,str)
end

function MODULE.Print(...)
	local ok,str=pcall(ToStringEx," ",...)
	if not ok then internalPrint(str) return end
	if not str then return end

	ProcessMessage(IS_PRINT,str)

end

MODULE.print = MODULE.Print

function MODULE.Err(...)
	local ok,str=pcall(ToStringEx," ",...)
	if not ok then internalPrint(str) return end
	if not str then return end

	ProcessMessage(IS_ERROR,str)
end

MODULE.errornohalt = MODULE.Err

function MODULE._internalMsgC(col,...)
	if not col or not col.r then return end
	local ok,str=pcall(ToStringEx,"",...)
	if not ok then internalPrint(str) return end
	if not str then return end

	ProcessMessage(IS_MSGC,str,col)
end

function MODULE.MsgC(...)

	local last_col = col_white
	local vals={} -- todo: use unpack(n,a,b)
	for i=1,select('#',...) do
		local v=select(i,...)
		
		if IsColor(v) then
			if next(vals) then _internalMsgC(last_col,unpack(vals)) end
			vals={}
			last_col=v
		else
			table.insert(vals,v)
		end
		
	end
	
	if next(vals) then
		_internalMsgC(last_col,unpack(vals))
	end
	
end

function MODULE.AddText(...)
	local col=Color(255,255,255,255)
	for k, v in pairs({...}) do
		if type(v) == "table" and type(v.r) == "number" and type(v.g) == "number" and type(v.b) == "number" then
			col=Color(v.r,v.g,v.b,255)
		else
			local ok,str=pcall(ToStringEx,"",v)
			ProcessMessage(IS_MSGC,str,col)
		end
	end
end


------------------
-- API
------------------
local api = rawget(MODULE,"api") or {}

api.Msg = MODULE.Msg
api.MsgC = MODULE.MsgC
api.MsgN = MODULE.MsgN
api.print = MODULE.print
api.ErrorNoHalt = MODULE.Err
api.error = function(e,n)
	MODULE.Err(e)
	error(e,(n or 1)+1)
end

-- _G api: Eprint, EMsg
for k,v in next,api do
	G['E'..k] = v
end

MODULE.api = api

function MODULE.setenv(env)
	local t={}
	for k,v in next,api do
		t[k]=v
	end
	local fenv = G.setmetatable({  }, { __index = G.setmetatable(t, { __index = env or G.getfenv(2) or G }) })
	G.setfenv(2, fenv)
end

--PATH addons/admin_warns/lua/fam/core/sh_languages.lua:
FlameAdminManagement.lang = FlameAdminManagement.lang or {}

function FlameAdminManagement.RegisterLanguage(id, tb)
	FlameAdminManagement.lang[id] = tb
end

function FlameAdminManagement.GetLang(key, id)
	key = key:lower()
	if FlameAdminManagement.lang[FlameAdminManagement.config.Language] ~= nil and FlameAdminManagement.lang[FlameAdminManagement.config.Language][key] ~= nil then
		if type(FlameAdminManagement.lang[FlameAdminManagement.config.Language][key]) == "table" and id ~= nil and FlameAdminManagement.lang[FlameAdminManagement.config.Language][key][id] ~= nil then
			return FlameAdminManagement.lang[FlameAdminManagement.config.Language][key][id]
		end
		return FlameAdminManagement.lang[FlameAdminManagement.config.Language][key]
	end

	return "Unknown"
end
--PATH addons/admin_reports/lua/freports/sh_init.lua:
nw.Register("rp.ReportClaimed"):Write(net.WriteBool):Read(net.ReadBool):SetPlayer()
nw.Register("rp.LastReport"):Write(net.WriteInt, 32):Read(net.ReadInt, 32):SetPlayer()

function freports.FormatRankName(r_or_p)
	if isstring(r_or_p) then
		return freports.config.BRanks[r_or_p] and freports.config.BRanks[r_or_p][1] or r_or_p
	elseif isentity(r_or_p) then
		return freports.config.BRanks[r_or_p:GetUserGroup()] and freports.config.BRanks[r_or_p:GetUserGroup()][1] or r_or_p:GetUserGroup()
	end

	return "N/A"
end

function freports.FormatRankColor(r_or_p)
	if isstring(r_or_p) then
		return freports.config.BRanks[r_or_p] and freports.config.BRanks[r_or_p][2] or Color(255, 255, 255)
	elseif isentity(r_or_p) then
		return freports.config.BRanks[r_or_p:GetUserGroup()] and freports.config.BRanks[r_or_p:GetUserGroup()][2] or Color(255, 255, 255)
	end

	return Color(255, 255, 255)
end
--PATH addons/gprofiler/lua/gprofiler/cl_menu.lua:
GProfiler.Menu.Tabs = GProfiler.Menu.Tabs or {}
GProfiler.Menu.Background = GProfiler.Menu.Background or nil
GProfiler.Menu.Content = GProfiler.Menu.Content or nil
GProfiler.Menu.LastTab = GProfiler.Menu.LastTab or 1

local MenuColors = GProfiler.MenuColors

local function GetTabName(tabName)
	tabName = string.gsub(string.lower(tabName), " ", "_")
	return GProfiler.Language.GetPhrase(string.format("tab_%s", tabName))
end

local function formatTime(seconds)
	local days = math.floor(seconds / 86400)
	if days > 0 then
		local hours = math.floor((seconds - days * 86400) / 3600)
		local minutes = math.floor((seconds - days * 86400 - hours * 3600) / 60)
		local seconds = math.floor(seconds - days * 86400 - hours * 3600 - minutes * 60)
		return string.format("%dd %02d:%02d:%02d", days, hours, minutes, seconds)
	else
		local hours = math.floor(seconds / 3600)
		local minutes = math.floor((seconds - hours * 3600) / 60)
		local seconds = math.floor(seconds - hours * 3600 - minutes * 60)
		return string.format("%02d:%02d:%02d", hours, minutes, seconds)
	end
end

function GProfiler.Menu:Open()
	if not GProfiler.Access.HasAccess(LocalPlayer()) then return end
	if IsValid(GProfiler.Menu.Background) then GProfiler.Menu.Background:Remove() end

	local SColor = MenuColors.HeaderSeparator

	local MenuBackground = vgui.Create("DFrame")
	MenuBackground:SetSize(ScrW(), ScrH())
	MenuBackground:Center()
	MenuBackground:SetDraggable(false)
	MenuBackground:ShowCloseButton(false)
	MenuBackground:SetTitle("")
	MenuBackground:MakePopup()
	MenuBackground:SetMouseInputEnabled(false)
	MenuBackground.Paint = function(s) Derma_DrawBackgroundBlur(s) end
	if GProfiler.Config.MenuCommands.Closekey then
		MenuBackground.Think = function(s)
			if input.IsKeyDown(GProfiler.Config.MenuCommands.Closekey) then
				s:Close()
			end
		end
	end
	GProfiler.Menu.Background = MenuBackground

	local Menu = vgui.Create("DFrame", MenuBackground)
	Menu:SetSize(ScrW() * 0.8, ScrH() * 0.8)
	Menu:Center()
	Menu:SetDraggable(false)
	Menu:ShowCloseButton(false)
	Menu:SetTitle("")
	Menu:MakePopup()
	Menu.Paint = function(s, w, h) draw.RoundedBox(4, 0, 0, w, h, MenuColors.Background) end
	Menu.OnClose = function() MenuBackground:Remove() end

	local MenuTopBar = vgui.Create("DPanel", Menu)
	MenuTopBar:SetSize(Menu:GetWide(), 40)
	MenuTopBar:SetPos(0, 0)
	MenuTopBar.Paint = function(s, w, h)
		draw.RoundedBoxEx(4, 0, 0, w, h, MenuColors.OpaqueBlack, true, true, false, false)
		surface.SetDrawColor(SColor.r, SColor.g, SColor.b, SColor.a)
		surface.DrawLine(0, h - 1, w, h - 1)
	end

	local MenuTitle = vgui.Create("DLabel", MenuTopBar)
	MenuTitle:SetSize(MenuTopBar:GetWide(), MenuTopBar:GetTall())
	MenuTitle:SetPos(0, 0)
	MenuTitle:SetFont("GProfiler.Menu.Title")
	MenuTitle:SetTextColor(MenuColors.White)
	MenuTitle:SetText("GProfiler")
	MenuTitle:SizeToContents()
	MenuTitle:SetPos(5, MenuTopBar:GetTall() / 2 - MenuTitle:GetTall() / 2)

	GProfiler.Menu.Title = MenuTitle

	local LeftSideBar = vgui.Create("DPanel", Menu)
	LeftSideBar:SetSize(250, Menu:GetTall() - MenuTopBar:GetTall() - 35)
	LeftSideBar:SetPos(0, MenuTopBar:GetTall())
	LeftSideBar.Paint = function(s, w, h) draw.RoundedBoxEx(4, 0, 0, w, h, MenuColors.OpaqueBlack, false, false, true, false) end

	local UptimeBar = vgui.Create("DPanel", Menu)
	UptimeBar:SetSize(LeftSideBar:GetWide(), 35)
	UptimeBar:SetPos(0, Menu:GetTall() - UptimeBar:GetTall())
	UptimeBar.Paint = function(s, w, h)
		draw.RoundedBoxEx(4, 0, 0, w, h, MenuColors.OpaqueBlack, false, false, false, true)
		surface.SetDrawColor(SColor.r, SColor.g, SColor.b, SColor.a)
		surface.DrawLine(0, 0, w, 0)
	end

	local UptimeLabel = vgui.Create("DLabel", UptimeBar)
	UptimeLabel:SetSize(UptimeBar:GetWide(), UptimeBar:GetTall())
	UptimeLabel:SetPos(0, 0)
	UptimeLabel:SetFont("GProfiler.Menu.UptimeLabel")
	UptimeLabel:SetTextColor(MenuColors.White)
	UptimeLabel.Paint = function() end

	local UptimeText = GProfiler.Language.GetPhrase("uptime")

	UptimeLabel.Think = function(s)
		s:SetText(string.format(UptimeText, formatTime(RealTime())))
		s:SizeToContents()
		s:SetPos(UptimeBar:GetWide() / 2 - s:GetWide() / 2, UptimeBar:GetTall() / 2 - s:GetTall() / 2)
	end

	local CloseButton = vgui.Create("DButton", MenuTopBar)
	CloseButton:SetSize(MenuTopBar:GetTall(), MenuTopBar:GetTall())
	CloseButton:SetPos(Menu:GetWide() - CloseButton:GetWide(), 0)
	CloseButton:SetText("X")
	CloseButton:SetFont("GProfiler.Menu.SectionHeader")
	CloseButton:SetTextColor(MenuColors.White)
	CloseButton.Paint = function() end
	CloseButton.DoClick = function() Menu:Close() end

	local MenuContent = vgui.Create("DPanel", Menu)
	MenuContent:SetSize(Menu:GetWide() - LeftSideBar:GetWide(), Menu:GetTall() - MenuTopBar:GetTall())
	MenuContent:SetPos(LeftSideBar:GetWide(), MenuTopBar:GetTall())
	MenuContent.Paint = function() end

	GProfiler.Menu.Content = MenuContent

	local TabList = vgui.Create("DPanelList", LeftSideBar)
	TabList:SetSize(LeftSideBar:GetWide(), LeftSideBar:GetTall())
	TabList:SetPos(0, 0)
	TabList:EnableVerticalScrollbar(true)
	TabList:SetSpacing(0)
	TabList.Paint = function() end

	local padding = 10

	local activeTab = nil
	for k, v in ipairs(GProfiler.Menu.Tabs) do
		local Tab = vgui.Create("DButton")
		Tab.Lerped = 0
		Tab:SetSize(TabList:GetWide(), 50)
		Tab:SetText("")
		Tab.Paint = function(s, w, h)
			surface.SetDrawColor(SColor.r, SColor.g, SColor.b, SColor.a)
			surface.DrawLine(0, h - 1, w, h - 1)

			if s:IsHovered() or activeTab == s then
				s.Lerped = Lerp(FrameTime() * 5, s.Lerped, w + 2)
			else
				s.Lerped = Lerp(FrameTime() * 5, s.Lerped, 0)
			end

			draw.RoundedBox(0, 0, 0, s.Lerped, h, MenuColors.TopBarSeparator)
		end
		Tab.DoClick = function()
			GProfiler.Menu.OpenTab(v.Name, v.Function)
			activeTab = Tab
			GProfiler.Menu.LastTab = k
		end

		local TabIcon = vgui.Create("DImage", Tab)
		TabIcon:SetSize(Tab:GetTall() - padding * 2, Tab:GetTall() - padding * 2)
		TabIcon:SetPos(padding, padding)
		TabIcon:SetImage(v.Icon)

		local TabText = vgui.Create("DLabel", Tab)
		TabText:SetFont("GProfiler.Menu.TabText")
		TabText:SetText(GetTabName(v.Name))
		TabText:SetTextColor(MenuColors.White)
		TabText:SizeToContents()
		TabText:SetPos(TabIcon:GetWide() + padding * 2, Tab:GetTall() / 2 - TabText:GetTall() / 2)
		TabText:SetContentAlignment(5)

		if v.BadgeFunc then
			local TabBadge = vgui.Create("DLabel", Tab)
			TabBadge:SetSize(1, 1)
			TabBadge:SetText("")
			TabBadge:SetFont("GProfiler.Menu.TabText")
			TabBadge:SetPos(Tab:GetWide() - TabBadge:GetWide() - padding, Tab:GetTall() / 2 - TabBadge:GetTall() / 2)
			TabBadge:SetContentAlignment(5)
			TabBadge.Think = function(s)
				local text = v.BadgeFunc()
				if not s.CurrentText or s.CurrentText ~= text then
					s.CurrentText = text
					surface.SetFont(s:GetFont())
					local w, h = surface.GetTextSize(text or "")
					if text == "" then
						s:SetSize(h / 2, h / 2)
					else
						s:SetSize(w + 5, h + 5)
					end
					s:SetPos(Tab:GetWide() - s:GetWide() - padding, Tab:GetTall() / 2 - s:GetTall() / 2)
				end
			end
			TabBadge.Paint = function(s, w, h)
				local text, color = v.BadgeFunc()
				if text and color then
					if text == "" then
						draw.RoundedBox(h / 2, 0, 0, w, h, color)
					else
						draw.RoundedBox(4, 0, 0, w, h, color)
						draw.SimpleText(text, "GProfiler.Menu.TabBadge", w / 2, h / 2, MenuColors.White, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
					end
				end
			end
		end

		TabList:AddItem(Tab)
	end

	TabList:GetItems()[GProfiler.Menu.LastTab]:DoClick()
end

function GProfiler.Menu.RegisterTab(name, icon, weight, func, badgeFunc)
	local tbl = {
		["Name"] = name,
		["Icon"] = icon,
		["Weight"] = weight,
		["Function"] = func,
		["BadgeFunc"] = badgeFunc
	}

	for k, v in ipairs(GProfiler.Menu.Tabs) do
		if v.Name == name then
			GProfiler.Menu.Tabs[k] = tbl
			table.sort(GProfiler.Menu.Tabs, function(a, b) return a.Weight < b.Weight end)
			return
		end
	end

	table.insert(GProfiler.Menu.Tabs, tbl)
	table.sort(GProfiler.Menu.Tabs, function(a, b) return a.Weight < b.Weight end)
end

function GProfiler.Menu.OpenTab(name, func)
	if not IsValid(GProfiler.Menu.Content) then return end
	if not name or not func then return end

	GProfiler.Menu.Content:Clear()

	local Tab = vgui.Create("DPanel", GProfiler.Menu.Content)
	Tab:SetSize(GProfiler.Menu.Content:GetWide(), GProfiler.Menu.Content:GetTall())
	Tab.Paint = function() end

	func(Tab)

	if GProfiler.Menu.Title then
		GProfiler.Menu.Title:SetText("GProfiler - " .. GetTabName(name))
		GProfiler.Menu.Title:SizeToContents()
	end
end

if type(GProfiler.Config.MenuCommands.Chat) == "string" then
	hook.Add("OnPlayerChat", "GProfiler.MenuCommands.Chat", function(ply, text)
		if text == GProfiler.Config.MenuCommands.Chat then
			if ply == LocalPlayer() then GProfiler.Menu.Open() end
			return true
		end
	end)
else hook.Remove("OnPlayerChat", "GProfiler.MenuCommands.Chat") end

if type(GProfiler.Config.MenuCommands.Console) == "string" then
	concommand.Add(GProfiler.Config.MenuCommands.Console, GProfiler.Menu.Open)
end

local function CreateFonts()
	surface.CreateFont("GProfiler.Menu.Title", { font = "Roboto", size = 26, weight = 500, antialias = true })
	surface.CreateFont("GProfiler.Menu.SectionHeader", { font = "Roboto", size = 18, weight = 500, antialias = true })
	surface.CreateFont("GProfiler.Menu.TabText", { font = "Roboto", size = 20, weight = 400, antialias = true })
	surface.CreateFont("GProfiler.Menu.TabBadge", { font = "Roboto", size = 18, weight = 400, antialias = true })
	surface.CreateFont("GProfiler.Menu.UptimeLabel", { font = "Roboto", size = 18, weight = 400, antialias = true })
	surface.CreateFont("GProfiler.Menu.RealmSelector", { font = "Roboto", size = 16, weight = 500, antialias = true })
	surface.CreateFont("GProfiler.Menu.ListHeader", { font = "Roboto", size = ScreenScale(4), weight = 400,	antialias = true })
	surface.CreateFont("GProfiler.Menu.FunctionDetails", { font = "Roboto", size = 16, weight = 400, antialias = true })
	surface.CreateFont("GProfiler.Menu.FocusEntry", { font = "Roboto", size = 16, weight = 500, antialias = true })
end
CreateFonts()
hook.Add("OnScreenSizeChanged", "GProfiler.Menu.RescaleFonts", CreateFonts)
--PATH addons/gprofiler/lua/gprofiler/profilers/concommands/cl_concommands.lua:
GProfiler.ConCommands = GProfiler.ConCommands or {}
GProfiler.ConCommands.ProfileActive = GProfiler.ConCommands.ProfileActive or false
GProfiler.ConCommands.StartTime = GProfiler.ConCommands.StartTime or 0
GProfiler.ConCommands.EndTime = GProfiler.ConCommands.EndTime or 0
GProfiler.ConCommands.ProfileActive = GProfiler.ConCommands.ProfileActive or false
GProfiler.ConCommands.Realm = GProfiler.ConCommands.Realm or "Client"

local TabPadding = 10
local MenuColors = GProfiler.MenuColors

local function GetCommandList(realm, callback)
	if realm == "Client" then
		local commands = concommand.GetTable()
		local commandList = {}

		for k, v in pairs(commands) do
			local source, lineStart, lineEnd = GProfiler.ConCommands.GetFunction(k, commands)
			commandList[k] = {Source = source, Lines = {lineStart, lineEnd}}
		end

		callback(commandList)
	elseif realm == "Server" then
		net.Start("GProfiler_ConCommands_CommandList")
		net.SendToServer()

		net.Receive("GProfiler_ConCommands_CommandList", function()
			local commandList = {}
			for i = 1, net.ReadUInt(32) do
				local command = net.ReadString()
				local source = net.ReadString()
				local lineStart = net.ReadUInt(16)
				local lineEnd = net.ReadUInt(16)
				commandList[command] = {Source = source, Lines = {lineStart, lineEnd}}
			end

			callback(commandList)
		end)
	end
end

function GProfiler.ConCommands.DoTab(Content)
	local Header = vgui.Create("DPanel", Content)
	Header:SetSize(Content:GetWide(), 40)
	Header:SetPos(0, 10)
	Header.Paint = function() end

	local RealmSelector = GProfiler.Menu.CreateRealmSelector(Header, "ConCommands", Header:GetWide() - 110 - TabPadding, Header:GetTall() / 2 - 30 / 2, 110, 30, function(s, _, value)
		GProfiler.ConCommands.Realm = value
		GProfiler.Menu.OpenTab("Commands", GProfiler.ConCommands.DoTab)
	end)
	RealmSelector:SetPos(Header:GetWide() - RealmSelector:GetWide() - TabPadding, Header:GetTall() / 2 - RealmSelector:GetTall() / 2)

	local StartButton = vgui.Create("DButton", Header)
	StartButton:SetText(GProfiler.ConCommands.ProfileActive and GProfiler.Language.GetPhrase("profiler_stop") or GProfiler.Language.GetPhrase("profiler_start"))
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

	StartButton.DoClick = function()
		if GProfiler.ConCommands.ProfileActive then
			GProfiler.ConCommands.EndTime = SysTime()
			if GProfiler.ConCommands.Realm == "Server" then
				net.Start("GProfiler_ConCommands_ToggleServerProfile")
				net.WriteBool(false)
				net.SendToServer()
			else
				GProfiler.ConCommands:RestoreCommands()
				GProfiler.ConCommands.ProfileActive = false
				GProfiler.Menu.OpenTab("Commands", GProfiler.ConCommands.DoTab)
			end
		else
			GProfiler.ConCommands.StartTime = SysTime()
			GProfiler.ConCommands.EndTime = 0
			if GProfiler.ConCommands.Realm == "Server" then
				net.Start("GProfiler_ConCommands_ToggleServerProfile")
				net.WriteBool(true)
				net.SendToServer()
			else
				GProfiler.ConCommands:DetourCommands()
				GProfiler.ConCommands.ProfileActive = true
				StartButton:SetText(GProfiler.Language.GetPhrase("profiler_stop"))
			end
		end
	end

	local TimeRunning = vgui.Create("DLabel", Header)
	TimeRunning:SetFont("GProfiler.Menu.SectionHeader")
	TimeRunning:SetText(GProfiler.TimeRunning(GProfiler.ConCommands.StartTime, GProfiler.ConCommands.EndTime, GProfiler.ConCommands.ProfileActive) .. "s")
	TimeRunning:SizeToContents()
	TimeRunning:SetPos(Header:GetWide() - TimeRunning:GetWide() - RealmSelector:GetWide() - StartButton:GetWide() - TabPadding * 3, Header:GetTall() / 2 - TimeRunning:GetTall() / 2)
	TimeRunning:SetTextColor(MenuColors.White)
	function TimeRunning:Think()
		if GProfiler.ConCommands.ProfileActive then
			self:SetText(GProfiler.TimeRunning(GProfiler.ConCommands.StartTime, 0, GProfiler.ConCommands.ProfileActive) .. "s")
			self:SizeToContents()
			self:SetPos(Header:GetWide() - self:GetWide() - StartButton:GetWide() - RealmSelector:GetWide() - TabPadding * 3, Header:GetTall() / 2 - self:GetTall() / 2)
		end
	end

	local SectionHeader = vgui.Create("DPanel", Content)
	SectionHeader:SetSize(Content:GetWide(), 40)
	SectionHeader:SetPos(0, Header:GetTall())
	SectionHeader.Paint = function() end

	local leftFraction = .7
	local rightFraction = .3

	local LeftHeader, LeftHeaderText = GProfiler.Menu.CreateHeader(SectionHeader, GProfiler.Language.GetPhrase("profiler_results"), 0, 0, SectionHeader:GetWide() * leftFraction - 5, SectionHeader:GetTall())
	local RightHeader, RightHeaderText = GProfiler.Menu.CreateHeader(SectionHeader, GProfiler.Language.GetPhrase("command_function"), LeftHeader:GetWide() + 10, 0, SectionHeader:GetWide() * rightFraction - 5, LeftHeader:GetTall())

	local LeftContent = vgui.Create("DPanel", Content)
	LeftContent:SetSize(LeftHeader:GetWide(), Content:GetTall() - SectionHeader:GetTall() - Header:GetTall())
	LeftContent:SetPos(0, SectionHeader:GetTall() + Header:GetTall())
	LeftContent.Paint = function() end

	local RightContent = vgui.Create("DPanel", Content)
	RightContent:SetSize(RightHeader:GetWide(), Content:GetTall() - SectionHeader:GetTall() - Header:GetTall())
	RightContent:SetPos(LeftContent:GetWide() + 10, SectionHeader:GetTall() + Header:GetTall())
	RightContent.Paint = function() end

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
	FunctionDetails:SetText(GProfiler.Language.GetPhrase("command_select"))

	local ProfilerResults = vgui.Create("DListView", LeftContent)
	ProfilerResults:SetSize(LeftContent:GetWide() - TabPadding * 2, (LeftContent:GetTall() - TabPadding * 2) / 2)
	ProfilerResults:SetPos(TabPadding, TabPadding)
	ProfilerResults:SetMultiSelect(false)
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("command"))
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("file"))
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("times_run"))
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("total_time"))
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("average_time"))
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("longest_time"))

	local Wide = ProfilerResults:GetWide()
	ProfilerResults.Columns[1]:SetWidth(Wide * .20)
	ProfilerResults.Columns[2]:SetWidth(Wide * .24)
	ProfilerResults.Columns[3]:SetWidth(Wide * .14)
	ProfilerResults.Columns[4]:SetWidth(Wide * .16)
	ProfilerResults.Columns[5]:SetWidth(Wide * .16)
	ProfilerResults.Columns[6]:SetWidth(Wide * .16)

	for k, v in pairs(GProfiler.ConCommands.ProfileData or {}) do
		local Line = ProfilerResults:AddLine(k, v.Source, v.Count, v.Time, v.AverageTime, v.LongestTime)
		Line.OnMousePressed = function(s, l)
			if l == 108 then
				local menu = DermaMenu()
				menu:AddOption(GProfiler.CopyLang("command"), function() SetClipboardText(k) end):SetIcon("icon16/page_copy.png")
				menu:AddOption(GProfiler.CopyLang("file"), function() SetClipboardText(v.Function) end):SetIcon("icon16/page_copy.png")
				menu:AddOption(GProfiler.CopyLang("times_run"), function() SetClipboardText(v.Count) end):SetIcon("icon16/page_copy.png")
				menu:AddOption(GProfiler.CopyLang("total_time"), function() SetClipboardText(v.Time) end):SetIcon("icon16/page_copy.png")
				menu:AddOption(GProfiler.CopyLang("average_time"), function() SetClipboardText(v.AverageTime) end):SetIcon("icon16/page_copy.png")
				menu:AddOption(GProfiler.CopyLang("longest_time"), function() SetClipboardText(v.LongestTime) end):SetIcon("icon16/page_copy.png")
				menu:Open()
			end

			for k, v in pairs(ProfilerResults.Lines) do v:SetSelected(false) end
			Line:SetSelected(true)

			FunctionDetails:SetText(GProfiler.Language.GetPhrase("requesting_source"))
			GProfiler.RequestFunctionSource(v.Source, tonumber(v.Lines[1]), tonumber(v.Lines[2]), function(source)
				if not IsValid(FunctionDetails) then return end
				FunctionDetails:SetText(table.concat(source, "\n"))
			end)
		end
	end

	local CommandList = vgui.Create("DListView", LeftContent)
	CommandList:SetSize(LeftContent:GetWide() - TabPadding * 2, (LeftContent:GetTall() - TabPadding * 2) / 2 - 10)
	CommandList:SetPos(TabPadding, TabPadding + ProfilerResults:GetTall() + TabPadding)
	CommandList:SetMultiSelect(false)
	CommandList:AddColumn(GProfiler.Language.GetPhrase("command"))
	CommandList:AddColumn(GProfiler.Language.GetPhrase("file"))

	GetCommandList(GProfiler.ConCommands.Realm, function(list)
		if not IsValid(CommandList) then return end
		CommandList:Clear()

		for k, v in pairs(list) do
			local Line = CommandList:AddLine(k, v.Source)
			Line.OnMousePressed = function(s, l)
				if l == 108 then
					local menu = DermaMenu()
					menu:AddOption(GProfiler.CopyLang("command"), function() SetClipboardText(k) end):SetIcon("icon16/page_copy.png")
					menu:AddOption(GProfiler.CopyLang("file"), function() SetClipboardText(v.Source) end):SetIcon("icon16/page_copy.png")
					menu:Open()
				end

				for k, v in pairs(CommandList.Lines) do v:SetSelected(false) end
				Line:SetSelected(true)

				FunctionDetails:SetText(GProfiler.Language.GetPhrase("requesting_source"))
				GProfiler.RequestFunctionSource(v.Source, tonumber(v.Lines[1]), tonumber(v.Lines[2]), function(source)
					if not IsValid(FunctionDetails) then return end
					FunctionDetails:SetText(table.concat(source, "\n"))
				end)
			end
		end

		GProfiler.StyleDListView(CommandList)
	end)

	GProfiler.StyleDListView(ProfilerResults)
	GProfiler.StyleDListView(CommandList)
end

GProfiler.Menu.RegisterTab("Commands", "icon16/application_xp_terminal.png", 4, GProfiler.ConCommands.DoTab, function()
	if GProfiler.ConCommands.ProfileActive then
		return "", MenuColors.ActiveProfile
	end
end)

net.Receive("GProfiler_ConCommands_ServerProfileStatus", function()
	local status = net.ReadBool()
	local ply = net.ReadEntity()
	GProfiler.ConCommands.ProfileActive = status

	if ply == LocalPlayer() then
		GProfiler.Menu.OpenTab("Commands", GProfiler.ConCommands.DoTab)
	end
end)

net.Receive("GProfiler_ConCommands_SendData", function()
	local data = {}
	for i = 1, net.ReadUInt(32) do
		local cmd = net.ReadString()
		data[cmd] = {
			Count = net.ReadUInt(32),
			Time = net.ReadFloat(),
			AverageTime = net.ReadFloat(),
			LongestTime = net.ReadFloat(),
			Source = net.ReadString(),
			Lines = {net.ReadUInt(16), net.ReadUInt(16)}
		}
	end

	GProfiler.ConCommands.ProfileData = data
	GProfiler.Menu.OpenTab("Commands", GProfiler.ConCommands.DoTab)
end)
--PATH addons/gprofiler/lua/gprofiler/profilers/timers/cl_timers.lua:
GProfiler.Timers = GProfiler.Timers or {}
GProfiler.Timers.Realm = GProfiler.Timers.Realm or "Client"
GProfiler.Timers.ProfileActive = GProfiler.Timers.ProfileActive or false
GProfiler.Timers.StartTime = GProfiler.Timers.StartTime or 0
GProfiler.Timers.EndTime = GProfiler.Timers.EndTime or 0

local TabPadding = 10
local MenuColors = GProfiler.MenuColors

function GProfiler.Timers.DoTab(Content)
	local Header = vgui.Create("DPanel", Content)
	Header:SetSize(Content:GetWide(), 40)
	Header:SetPos(0, 10)
	Header.Paint = function() end

	local RealmSelector = GProfiler.Menu.CreateRealmSelector(Header, "Timers", Header:GetWide() - TabPadding - 110, Header:GetTall() / 2 - 30 / 2, 110, 30, function(s, _, value)
		GProfiler.Timers.Realm = value
		GProfiler.Menu.OpenTab("Timers", GProfiler.Timers.DoTab)
	end)
	RealmSelector:SetPos(Header:GetWide() - RealmSelector:GetWide() - TabPadding, Header:GetTall() / 2 - RealmSelector:GetTall() / 2)

	local StartButton = vgui.Create("DButton", Header)
	StartButton:SetText(GProfiler.Timers.ProfileActive and GProfiler.Language.GetPhrase("profiler_stop") or GProfiler.Language.GetPhrase("profiler_start"))
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

	local TimersTimeRunning = vgui.Create("DLabel", Header)
	TimersTimeRunning:SetFont("GProfiler.Menu.SectionHeader")
	TimersTimeRunning:SetText(GProfiler.TimeRunning(GProfiler.Timers.StartTime, GProfiler.Timers.EndTime, GProfiler.Timers.ProfileActive) .. "s")
	TimersTimeRunning:SizeToContents()
	TimersTimeRunning:SetPos(Header:GetWide() - TimersTimeRunning:GetWide() - RealmSelector:GetWide() - StartButton:GetWide() - TabPadding * 3, Header:GetTall() / 2 - TimersTimeRunning:GetTall() / 2)
	TimersTimeRunning:SetTextColor(MenuColors.White)
	function TimersTimeRunning:Think()
		if GProfiler.Timers.ProfileActive then
			self:SetText(GProfiler.TimeRunning(GProfiler.Timers.StartTime, 0, GProfiler.Timers.ProfileActive) .. "s")
			self:SizeToContents()
			self:SetPos(Header:GetWide() - self:GetWide() - RealmSelector:GetWide() - StartButton:GetWide() - TabPadding * 3, Header:GetTall() / 2 - self:GetTall() / 2)
		end
	end

	StartButton.DoClick = function()
		if GProfiler.Timers.ProfileActive then
			GProfiler.Timers.EndTime = SysTime()
			if GProfiler.Timers.Realm == "Server" then
				net.Start("GProfiler_Timers_ToggleServerProfile")
				net.WriteBool(false)
				net.SendToServer()
			else
				GProfiler.Timers:Stop()
				GProfiler.Timers.ProfileActive = false
				GProfiler.Menu.OpenTab("Timers", GProfiler.Timers.DoTab)
			end

			if timer.Exists("GProfiler.Timers.Time") then
				timer.Remove("GProfiler.Timers.Time")
			end
		else
			GProfiler.Timers.StartTime = SysTime()
			GProfiler.Timers.EndTime = 0
			if GProfiler.Timers.Realm == "Server" then
				net.Start("GProfiler_Timers_ToggleServerProfile")
				net.WriteBool(true)
				net.SendToServer()
			else
				GProfiler.Timers:Start()
				GProfiler.Timers.ProfileActive = true
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

	local LeftHeader, LeftHeaderText = GProfiler.Menu.CreateHeader(SectionHeader, GProfiler.Language.GetPhrase("profiler_results"), 0, 0, SectionHeader:GetWide() * leftFraction - 5, SectionHeader:GetTall())
	local RightHeader, RightHeaderText = GProfiler.Menu.CreateHeader(SectionHeader, GProfiler.Language.GetPhrase("timer_function"), LeftHeader:GetWide() + 10, 0, SectionHeader:GetWide() * rightFraction - 5, LeftHeader:GetTall())

	local LeftContent = vgui.Create("DPanel", Content)
	LeftContent:SetSize(LeftHeader:GetWide(), Content:GetTall() - SectionHeader:GetTall() - Header:GetTall())
	LeftContent:SetPos(0, SectionHeader:GetTall() + Header:GetTall())
	LeftContent.Paint = function() end

	local RightContent = vgui.Create("DPanel", Content)
	RightContent:SetSize(RightHeader:GetWide(), Content:GetTall() - SectionHeader:GetTall() - Header:GetTall())
	RightContent:SetPos(LeftContent:GetWide() + 10, SectionHeader:GetTall() + Header:GetTall())
	RightContent.Paint = function() end

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
	FunctionDetails:SetText(GProfiler.Language.GetPhrase("timer_select"))

	local ProfilerResults = vgui.Create("DListView", LeftContent)
	ProfilerResults:SetSize(LeftContent:GetWide() - TabPadding * 2, LeftContent:GetTall() - TabPadding * 2)
	ProfilerResults:SetPos(TabPadding, TabPadding)
	ProfilerResults:SetMultiSelect(false)
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("timer"))
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("file"))
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("delay"))
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("times_run"))
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("total_time"))
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("longest_time"))
	ProfilerResults:AddColumn(GProfiler.Language.GetPhrase("average_time"))

	local ProfileData = table.Merge(GProfiler.Timers.Simple, GProfiler.Timers.Create)
	for k, v in pairs(ProfileData or {}) do
		local line = ProfilerResults:AddLine(v.Type == "Simple" and "Simple Timer" or tostring(k), v.Source or "Unknown", v.Delay, v.Count, v.TotalTime, v.LongestTime, v.AverageTime)
		line.OnMousePressed = function(s, l)
			if l == 108 then
				local menu = DermaMenu()
				menu:AddOption(GProfiler.CopyLang("receiver"), function() SetClipboardText(k) end):SetIcon("icon16/page_copy.png")
				menu:AddOption(GProfiler.CopyLang("times_received"), function() SetClipboardText(v.Count) end):SetIcon("icon16/page_copy.png")
				menu:AddOption(GProfiler.CopyLang("largest_size"), function() SetClipboardText(v.LongestTime) end):SetIcon("icon16/page_copy.png")
				menu:AddOption(GProfiler.CopyLang("total_size"), function() SetClipboardText(v.TotalTime) end):SetIcon("icon16/page_copy.png")
				menu:Open()
			end

			for k, v in pairs(ProfilerResults.Lines) do
				v:SetSelected(false)
			end
			line:SetSelected(true)

			GProfiler.RequestFunctionSource(v.Source, v.Lines[1], v.Lines[2], function(source)
				if not IsValid(FunctionDetails) then return end
				FunctionDetails:SetText(table.concat(source, "\n"))
			end)
		end
	end

	local Wide = ProfilerResults:GetWide()
	ProfilerResults.Columns[1]:SetWide(Wide * 0.2)
	ProfilerResults.Columns[2]:SetWide(Wide * 0.2)
	ProfilerResults.Columns[3]:SetWide(Wide * 0.075)
	ProfilerResults.Columns[4]:SetWide(Wide * 0.075)
	ProfilerResults.Columns[5]:SetWide(Wide * 0.17)
	ProfilerResults.Columns[6]:SetWide(Wide * 0.17)
	ProfilerResults.Columns[7]:SetWide(Wide * 0.17)
	ProfilerResults:SortByColumn(5, true)

	local function UpdateLists()
		GProfiler.StyleDListView(ProfilerResults)
	end
	UpdateLists()
end
GProfiler.Menu.RegisterTab("Timers", "icon16/time.png", 5, GProfiler.Timers.DoTab, function()
	if GProfiler.Timers.ProfileActive then
		return "", MenuColors.ActiveProfile
	end
	return nil
end)

net.Receive("GProfiler_Timers_ServerProfileStatus", function()
	local status = net.ReadBool()
	local ply = net.ReadEntity()
	GProfiler.Timers.ProfileActive = status

	if ply == LocalPlayer() and not GProfiler.Timers.ProfileActive then
		GProfiler.Menu.OpenTab("Timers", GProfiler.Timers.DoTab)
	end
end)

net.Receive("GProfiler_Timers_SendData", function(len)
	local firstChunk = net.ReadBool()
	if firstChunk then
		GProfiler.Timers.Simple = {}
		GProfiler.Timers.Create = {}
	end
	local lastChunk = net.ReadBool()
	for i = 1, net.ReadUInt(32) do
		local type = net.ReadString()
		local name = net.ReadString()
		GProfiler.Timers[type][name] = {
			Count = net.ReadUInt(32),
			Delay = net.ReadFloat(),
			TotalTime = net.ReadFloat(),
			LongestTime = net.ReadFloat(),
			AverageTime = net.ReadFloat(),
			Source = net.ReadString(),
			Lines = {net.ReadUInt(16), net.ReadUInt(16)},
			Type = type
		}
	end
	if lastChunk then
		GProfiler.Menu.OpenTab("Timers", GProfiler.Timers.DoTab)
	end
end)
--PATH addons/svnv_ru_lib/lua/autorun/load/shared/error.lua:
function SVYANOV.LIB.MsgLibErrorToRoots(addon,info)
	addon = addon or 'nil'
	info = info or 'nil'
	for k,v in player.Iterator() do
		if v:IsRootUser() then
			v:SendLua("ErrorNoHalt( '(ROOT-USER) [SVYANOV-LIB _ERROR #1]: "..addon .. " | "..info.."' ) ")
			v:SendLua("Error( 		'(ROOT-USER) [SVYANOV-LIB _ERROR #2]: "..addon .. " | "..info.."' ) ")
		end
	end
end

function SVYANOV.LIB.MsgLibError(addon,info)
	ErrorNoHalt( '[SVYANOV-LIB _ERROR #1]: '..addon .. ' | '..info ) 
	Error( 		 '[SVYANOV-LIB _ERROR #2]: '..addon .. ' | '..info )
	SVYANOV.LIB.MsgLibErrorToRoots(addon,info)
end
--PATH addons/_adminmodules_menu/lua/sui/vgui/sui_panel.lua:
local PANEL = {}

sui.scaling_functions(PANEL)

function PANEL:Init()
	self:ScaleInit()
end

sui.register("Panel", PANEL, "Panel")
--PATH addons/vehicles_sanchezupdate_1735629243/lua/autorun/sanchez.lua:
local pelvis             = "ValveBiped.Bip01_Pelvis"
local r_calf             = "ValveBiped.Bip01_R_Calf"
local l_calf             = "ValveBiped.Bip01_L_Calf"
local r_thigh            = "ValveBiped.Bip01_R_Thigh"
local l_thigh            = "ValveBiped.Bip01_L_Thigh"
local r_foot             = "ValveBiped.Bip01_R_Foot"
local l_foot             = "ValveBiped.Bip01_L_Foot"
local r_upperarm         = "ValveBiped.Bip01_R_UpperArm"
local l_upperarm         = "ValveBiped.Bip01_L_UpperArm"
local r_forearm          = "ValveBiped.Bip01_R_ForeArm"
local l_forearm          = "ValveBiped.Bip01_L_ForeArm"
local r_hand             = "ValveBiped.Bip01_R_Hand"
local l_hand             = "ValveBiped.Bip01_L_Hand"
local head               = "ValveBiped.Bip01_Head1"
--Main gauche
local l_auricullaire_4   = "ValveBiped.Bip01_L_Finger4"
local l_auricullaire_41  = "ValveBiped.Bip01_L_Finger41"
local l_auricullaire_42  = "ValveBiped.Bip01_L_Finger42"
local l_annulaire_3      = "ValveBiped.Bip01_L_Finger3"
local l_annulaire_31     = "ValveBiped.Bip01_L_Finger31"
local l_annulaire_32     = "ValveBiped.Bip01_L_Finger32"
local l_majeur_2         = "ValveBiped.Bip01_L_Finger2"
local l_majeur_21        = "ValveBiped.Bip01_L_Finger21"
local l_majeur_22        = "ValveBiped.Bip01_L_Finger22"
local l_index_1          = "ValveBiped.Bip01_L_Finger1"
local l_index_11         = "ValveBiped.Bip01_L_Finger11"
local l_index_12         = "ValveBiped.Bip01_L_Finger12"
local l_pouce_0          = "ValveBiped.Bip01_L_Finger0"
local l_pouce_01         = "ValveBiped.Bip01_L_Finger01"
local l_pouce_02         = "ValveBiped.Bip01_L_Finger02"

--Main droite
local r_auricullaire_4   = "ValveBiped.Bip01_R_Finger4"
local r_auricullaire_41  = "ValveBiped.Bip01_R_Finger41"
local r_auricullaire_42  = "ValveBiped.Bip01_R_Finger42"
local r_annulaire_3      = "ValveBiped.Bip01_R_Finger3"
local r_annulaire_31     = "ValveBiped.Bip01_R_Finger31"
local r_annulaire_32     = "ValveBiped.Bip01_R_Finger32"
local r_majeur_2         = "ValveBiped.Bip01_R_Finger2"
local r_majeur_21        = "ValveBiped.Bip01_R_Finger21"
local r_majeur_22        = "ValveBiped.Bip01_R_Finger22"
local r_index_1          = "ValveBiped.Bip01_R_Finger1"
local r_index_11         = "ValveBiped.Bip01_R_Finger11"
local r_index_12         = "ValveBiped.Bip01_R_Finger12"
local r_pouce_0          = "ValveBiped.Bip01_R_Finger0"
local r_pouce_01         = "ValveBiped.Bip01_R_Finger01"
local r_pouce_02         = "ValveBiped.Bip01_R_Finger02"

local origin = Vector(0,0,0)
local originA = Angle(0,0,0)
local cheapbonemanips = {}

cheapbonemanips["NoRealistBikesanchez"] = {
	[pelvis]             	= {origin,originA},
	[r_calf]             	= {origin,originA},
	[l_calf]             	= {origin,originA},
	[r_thigh]            	= {origin,originA},
	[l_thigh]            	= {origin,originA},
	[r_foot]             	= {origin,originA},
	[l_foot]             	= {origin,originA},
	[r_upperarm]         	= {origin,originA},
	[r_forearm]          	= {origin,originA},
	[r_hand]             	= {origin,originA},
	[l_upperarm]         	= {origin,originA},
	[l_forearm]          	= {origin,originA},
	[l_hand]             	= {origin,originA},
	[head]               	= {origin,originA},
	--Gauche
	[l_auricullaire_4]		= {origin,originA},
	[l_auricullaire_41]		= {origin,originA},
	[l_auricullaire_42]		= {origin,originA},
	[l_annulaire_3]			= {origin,originA},
	[l_annulaire_31]		= {origin,originA},
	[l_annulaire_32]		= {origin,originA},
	[l_majeur_2]			= {origin,originA},
	[l_majeur_21]			= {origin,originA},
	[l_majeur_22]			= {origin,originA},
	[l_index_1]				= {origin,originA},
	[l_index_11]			= {origin,originA},
	[l_index_12]			= {origin,originA},
	[l_pouce_0]				= {origin,originA},
	[l_pouce_01]			= {origin,originA},
	[l_pouce_02]			= {origin,originA},
	--Droite
	[r_auricullaire_4]		= {origin,originA},
	[r_auricullaire_41]		= {origin,originA},
	[r_auricullaire_42]		= {origin,originA},
	[r_annulaire_3]			= {origin,originA},
	[r_annulaire_31]		= {origin,originA},
	[r_annulaire_32]		= {origin,originA},
	[r_majeur_2]			= {origin,originA},
	[r_majeur_21]			= {origin,originA},
	[r_majeur_22]			= {origin,originA},
	[r_index_1]				= {origin,originA},
	[r_index_11]			= {origin,originA},
	[r_index_12]			= {origin,originA},
	[r_pouce_0]				= {origin,originA},
	[r_pouce_01]			= {origin,originA},
	[r_pouce_02]			= {origin,originA},
}

cheapbonemanips["InRealistBikesanchez"] = {
	[pelvis]             	= {Vector(-5,0,0),Angle(0,0,0)},
	[r_calf]             	= {Vector(0,0,0),Angle(20,45,0)},
	[l_calf]             	= {Vector(0,0,0),Angle(-20,45,0)},
	[r_thigh]            	= {Vector(0,0,0),Angle(20,30,0)},
	[l_thigh]            	= {Vector(0,0,0),Angle(-20,30,0)},
	[r_foot]             	= {Vector(0,0,0),Angle(0,-45,0)},
	[l_foot]             	= {Vector(0,0,0),Angle(0,-45,0)},
	[r_upperarm]         	= {Vector(0,0,0),Angle(13,25,0)},
	[r_forearm]          	= {Vector(0,0,0),Angle(0,0,0)},
	[r_hand]             	= {Vector(0,0,0),Angle(0,30,20)},
	[l_upperarm]         	= {Vector(0,0,0),Angle(-3,25,0)},
	[l_forearm]          	= {Vector(0,0,0),Angle(0,0,0)},
	[l_hand]             	= {Vector(0,0,0),Angle(-15,30,-10)},
	[head]               	= {Vector(0,0,0),Angle(0,0,0)},
	--Gauche
	[l_auricullaire_4]		= {Vector(0,0,0),Angle(0,0,0)},
	[l_auricullaire_41]		= {Vector(0,0,0),Angle(0,0,0)},
	[l_auricullaire_42]		= {Vector(0,0,0),Angle(0,0,0)},
	[l_annulaire_3]			= {Vector(0,0,0),Angle(0,0,0)},
	[l_annulaire_31]		= {Vector(0,0,0),Angle(0,0,0)},
	[l_annulaire_32]		= {Vector(0,0,0),Angle(0,0,0)},
	[l_majeur_2]			= {Vector(0,0,0),Angle(0,0,0)},
	[l_majeur_21]			= {Vector(0,0,0),Angle(0,0,0)},
	[l_majeur_22]			= {Vector(0,0,0),Angle(0,0,0)},
	[l_index_1]				= {Vector(0,0,0),Angle(0,0,0)},
	[l_index_11]			= {Vector(0,0,0),Angle(0,0,0)},
	[l_index_12]			= {Vector(0,0,0),Angle(0,0,0)},
	[l_pouce_0]				= {Vector(0,0,0),Angle(0,0,0)},
	[l_pouce_01]			= {Vector(0,0,0),Angle(0,0,0)},
	[l_pouce_02]			= {Vector(0,0,0),Angle(0,0,0)},
	--Droite
	[r_auricullaire_4]		= {Vector(0,0,0),Angle(0,0,0)},
	[r_auricullaire_41]		= {Vector(0,0,0),Angle(0,0,0)},
	[r_auricullaire_42]		= {Vector(0,0,0),Angle(0,0,0)},
	[r_annulaire_3]			= {Vector(0,0,0),Angle(0,0,0)},
	[r_annulaire_31]		= {Vector(0,0,0),Angle(0,0,0)},
	[r_annulaire_32]		= {Vector(0,0,0),Angle(0,0,0)},
	[r_majeur_2]			= {Vector(0,0,0),Angle(0,0,0)},
	[r_majeur_21]			= {Vector(0,0,0),Angle(0,0,0)},
	[r_majeur_22]			= {Vector(0,0,0),Angle(0,0,0)},
	[r_index_1]				= {Vector(0,0,0),Angle(0,0,0)},
	[r_index_11]			= {Vector(0,0,0),Angle(0,0,0)},
	[r_index_12]			= {Vector(0,0,0),Angle(0,0,0)},
	[r_pouce_0]				= {Vector(0,0,0),Angle(0,0,0)},
	[r_pouce_01]			= {Vector(0,0,0),Angle(0,0,0)},
	[r_pouce_02]			= {Vector(0,0,0),Angle(0,0,0)},
}

if SERVER then
	util.AddNetworkString( "RealBike_Adapt_bone" )
end


local function HandleBoatVehicleAnimation( vehicle, ply )
		if SERVER then
					--print(vehicle:WaterLevel())
			if vehicle:WaterLevel()==3 then
				vehicle:EnableEngine( false )
			else vehicle:EnableEngine( true ) end
		end
	return ply:SelectWeightedSequence( ACT_DRIVE_AIRBOAT )
end


hook.Add("PlayerEnteredVehicle","RealisticFixBonesanchez",function( ply, veh, role )
	if veh:GetVehicleClass()=="realistic_bike_sanchez" then
		for k,v in pairs(cheapbonemanips["InRealistBikesanchez"]) do
			local boneid = ply:LookupBone(k)
			if boneid then
				ply:ManipulateBonePosition(boneid,v[1])
				ply:ManipulateBoneAngles(boneid,v[2])
			end
		end

		net.Start("RealBike_Adapt_bone")
			net.WriteString("Enter")
		net.Send(ply)
	end
end)

hook.Add("PlayerLeaveVehicle","RealisticFixBonesanchez",function( ply, veh )
	if veh:GetVehicleClass()=="realistic_bike_sanchez" then
		for k,v in pairs(cheapbonemanips["NoRealistBikesanchez"]) do
			local boneid = ply:LookupBone(k)
			if boneid then
				ply:ManipulateBonePosition(boneid,v[1])
				ply:ManipulateBoneAngles(boneid,v[2])
			end
		end

		net.Start("RealBike_Adapt_bone")
			net.WriteString("Exit")
		net.Send(ply)
	end
end)


----FOR SINGLE PLAYER---

net.Receive("RealBike_Adapt_bone", function()
	local Word = net.ReadString()
	local ply = LocalPlayer()
	
	if Word=="Enter" then
		for k,v in pairs(cheapbonemanips["InRealistBikesanchez"]) do
			local boneid = ply:LookupBone(k)
			if boneid then
				ply:ManipulateBonePosition(boneid,v[1])
				ply:ManipulateBoneAngles(boneid,v[2])
			end
		end
	elseif Word=="Exit" then
		for k,v in pairs(cheapbonemanips["NoRealistBikesanchez"]) do
			local boneid = ply:LookupBone(k)
			if boneid then
				ply:ManipulateBonePosition(boneid,v[1])
				ply:ManipulateBoneAngles(boneid,v[2])
			end
		end
	end

end)

local Category = "Realistic_Bike"
local V = { 	
				Name = "Sanchez DirtBike", 
				Class = "prop_vehicle_jeep",
				Category = Category,

				Information = "Gama",
				Model = "models/realistic_bike/sanchez.mdl",

				KeyValues = {
								vehiclescript	=	"scripts/vehicles/code/sanchez.txt"
							},
				Members = {
								HandleAnimation = HandleBoatVehicleAnimation,
				}
			}
list.Set( "Vehicles", "realistic_bike_sanchez", V )
--PATH addons/grp_content/lua/autorun/seashark_rytrak.lua:
local Category = "Rytrak Boats"

local V = { 	
				Name =	"Seashark",
				Class = "prop_vehicle_airboat",
				Category = Category,

				Information = "",
				Model =	"models/rytrak/seashark.mdl",

				KeyValues = {
								vehiclescript	=	"scripts/vehicles/rytrak/seashark.txt"
							}
			}

list.Set( "Vehicles", "seashark_rytrak", V )

--PATH addons/deceive/lua/autorun/sh_deceive_load.lua:

AddCSLuaFile("deceive/sh_main.lua")
include("deceive/sh_main.lua")

--PATH addons/111mod/lua/autorun/sh_medialib.lua:
do
-- Note: build file expects these exact lines for them to be automatically replaced, so please don't change anything
local VERSION = "git@871fb36d"
local DISTRIBUTABLE = true

medialib = {}

medialib.SOUNDCLOUD_API_KEY = {
	'AKm0rmaY0ScS4y0FyUdvWMyfmtMdUYh6',
	'f911752b0d31492eca3ea086fbc9e8fd',
	'47159083054685525f6b73d25e2560b9',
	'340f063c670272fac27cfa67bffcafc4',
}
medialib.YOUTUBE_API_KEY = 'AIzaSyAqqVKM3mhnT12pHK-9mlACia7OqMfdK8U'

medialib.VERSION = VERSION
medialib.DISTRIBUTABLE = DISTRIBUTABLE
medialib.INSTANCE = medialib.VERSION .. "_" .. tostring(10000 + math.random(90000))

medialib.Modules = {}

local cvar_debug = CreateConVar("medialib_debug", "0", FCVAR_ARCHIVE)
cvars.AddChangeCallback(cvar_debug:GetName(), function(_, _, val)
	medialib.DEBUG = val == "1"
end)
medialib.DEBUG = cvar_debug:GetBool()

function medialib.modulePlaceholder(name)
	medialib.Modules[name] = {}
end
function medialib.module(name, opts)
	if medialib.DEBUG then
		print("[MediaLib] Creating module " .. name)
	end

	local mod = medialib.Modules[name] or {
		name = name,
		options = opts,
	}

	medialib.Modules[name] = mod

	return mod
end

-- AddCSLuaFile all medialib modules
if SERVER then
	for _,fname in pairs(file.Find("medialib/*", "LUA")) do
		AddCSLuaFile("medialib/" .. fname)
	end
end

local file_Exists = file.Exists
function medialib.tryInclude(file)
	if file_Exists(file, "LUA") then
		include(file)
		return true
	end

	if medialib.DEBUG then
		print("[MediaLib] Attempted to include nonexistent file " .. file)
	end

	return false
end

function medialib.load(name)
	local mod = medialib.Modules[name]
	if mod then return mod end

	if medialib.DEBUG then
		print("[MediaLib] Loading unreferenced module " .. name)
	end

	local file = "medialib/" .. name .. ".lua"
	if not medialib.tryInclude(file) then return nil end

	return medialib.Modules[name]
end

local medialibg = setmetatable({medialib = medialib}, {__index = _G})

local real_file_meta = {
	read = function(self)
		return file.Read(self.lua_path, "LUA")
	end,
	load = function(self)
		--local str = self:read()
		--if not str then error("MedialibDynLoad: could not load " .. self.lua_path) end

		-- TODO this does not function correctly;
		-- embedded medialib loading real_file will use global medialib as its 'medialib' instance
		return include(self.lua_path)
	end,
	addcs = function(self)
		AddCSLuaFile(self.lua_path)
	end,
}
real_file_meta.__index = real_file_meta

local virt_file_meta = {
	read = function(self)
		return self.source
	end,
	load = function(self)
		local compiled = CompileString(self:read(), "MediaLib_DynFile_" .. self.name)
		setfenv(compiled, medialibg)
		return compiled()
	end,
	addcs = function() end
}
virt_file_meta.__index = virt_file_meta

-- Used for medialib packed into a single file
medialib.FolderItems = {}

-- Returns an iterator for files in folder
function medialib.folderIterator(folder)
	local files = {}
	for _,fname in pairs(file.Find("medialib/" .. folder .. "/*.lua", "LUA")) do
		table.insert(files, setmetatable({
			name = fname,
			lua_path = "medialib/" .. folder .. "/" .. fname
		}, real_file_meta))
	end

	for k,item in pairs(medialib.FolderItems) do
		local mfolder = k:match("^([^/]*).+")
		if mfolder == folder then
			table.insert(files, setmetatable({
				name = k:match("^[^/]*/(.+)"),
				source = item
			}, virt_file_meta))
		end
	end

	return pairs(files)
end

if CLIENT then
	local function Rainbow()
		for i=1, 30 do
			MsgC(HSVToColor(30*i, 0.5, 0.9), " " .. string.rep("SEE BELOW FOR INSTRUCTIONS  ", 3) .. "\n")
		end
	end
	concommand.Add("medialib_noflash", function(_, _, args)
		if args[1] == "rainbow" then Rainbow() end

		SetClipboardText("http://get.adobe.com/flashplayer/otherversions/")

		MsgN("[ MediaLib: How to get Flash Player ]")
		MsgN("1. Open this website in your browser (not the ingame Steam browser): " ..
			"http://get.adobe.com/flashplayer/otherversions/")
		MsgN("   (the link has been automatically copied to your clipboard)")
		MsgN("2. Download and install the NSAPI (for Firefox) version")
		MsgN("3. Restart your Garry's Mod and rejoin this server")
		MsgN("[ ======================= ]")
	end)

	concommand.Add("medialib_lowaudio", function(_, _, args)
		if args[1] == "rainbow" then Rainbow() end

		SetClipboardText("http://windows.microsoft.com/en-us/windows7/adjust-the-sound-level-on-your-computer")

		MsgN("[ MediaLib: How to fix muted sound ]")
		MsgN("1. Follow instructions here: " ..
			"http://windows.microsoft.com/en-us/windows7/adjust-the-sound-level-on-your-computer")
		MsgN("   (the link has been automatically copied to your clipboard, you can open it in the steam ingame browser)")
		MsgN("2. Increase the volume of a process called 'Awesomium Core'")
		MsgN("3. You should immediately start hearing sound if a mediaclip is playing")
		MsgN("[ ======================= ]")
	end)

	hook.Add("OnPlayerChat", "MediaLib.ShowInstructions", function(_, text)
		if text:match("!ml_noflash") then
			RunConsoleCommand("medialib_noflash", "rainbow")
			RunConsoleCommand("showconsole")
		elseif text:match("!ml_lowvolume") then
			RunConsoleCommand("medialib_lowaudio", "rainbow")
			RunConsoleCommand("showconsole")
		end
	end)
end

end

-- 'oop'; CodeLen/MinifiedLen 2939/2939; Dependencies []
medialib.modulePlaceholder("oop")
do
local oop = medialib.module("oop")
oop.Classes = oop.Classes or {}

function oop.class(name, parent)
	local cls = oop.Classes[name]
	if not cls then
		cls = oop.createClass(name, parent)
		oop.Classes[name] = cls

		if medialib.DEBUG then
			print("[MediaLib] Registering oopclass " .. name)
		end
	end

	return cls
end

function oop.resolveClass(obj)
	if obj == nil then
		return oop.Object
	end

	local t = type(obj)
	if t == "string" then
		local clsobj = oop.Classes[obj]
		if clsobj then return clsobj end

		error("Resolving class from inexistent class string '" .. tostring(obj) .. "'")
	end
	if t == "table" then
		return obj
	end

	error("Resolving class from invalid object '" .. tostring(obj) .. "'")
end

-- This is a special parent used to prevent oop.Object being parent of itself
local NIL_PARENT = {}

-- Credits to Middleclass
local metamethods = {'__add', '__call', '__concat', '__div', '__ipairs', '__le',
					 '__len', '__lt', '__mod', '__mul', '__pairs', '__pow', '__sub',
					 '__tostring', '__unm'}

function oop.createClass(name, parent)
	local cls = {}

	-- Get parent class
	local par_cls
	if parent ~= NIL_PARENT then
		par_cls = oop.resolveClass(parent)
	end

	-- Add metadata
	cls.name = name
	cls.super = par_cls

	-- Add a subtable for class members ie methods and class/super handles
	cls.members = setmetatable({}, {__index = cls.super})

	-- Add built-in "keywords" that Instances can access
	cls.members.class = cls
	cls.members.super = cls.super

	-- Instance metatable
	local cls_instance_meta = {}
	do
		cls_instance_meta.__index = cls.members

		-- Add metamethods. The class does not have members yet, so we need to use runtime lookup
		for _,metaName in pairs(metamethods) do
			cls_instance_meta[metaName] = function(...)
				local method = cls.members[metaName]
				if method then
					return method(...)
				end
			end
		end
	end

	-- Class metatable
	local class_meta = {}
	do
		class_meta.__index = cls.members
		class_meta.__newindex = cls.members

		class_meta.__tostring = function(self)
			return "class " .. self.name
		end

		-- Make the Class object a constructor.
		-- ie calling Class() creates a new instance
		function class_meta:__call(...)
			local instance = {}
			setmetatable(instance, cls_instance_meta)

			-- Call constructor if exists
			local ctor = instance.initialize
			if ctor then ctor(instance, ...) end

			return instance
		end
	end

	-- Set meta functions
	setmetatable(cls, class_meta)

	return cls
end

oop.Object = oop.createClass("Object", NIL_PARENT)

-- Get the hash code ie the value Lua prints when you call __tostring()
function oop.Object:hashCode()
	local meta = getmetatable(self)

	local old_tostring = meta.__tostring
	meta.__tostring = nil

	local hash = tostring(self):match("table: 0x(.*)")

	meta.__tostring = old_tostring

	return hash
end

function oop.Object:__tostring()
	return string.format("%s@%s", self.class.name, self:hashCode())
end
end
-- 'mediabase'; CodeLen/MinifiedLen 4320/4320; Dependencies [oop]
medialib.modulePlaceholder("mediabase")
do
local oop = medialib.load("oop")

local Media = oop.class("Media")

function Media:on(event, callback)
	self._events = self._events or {}
	self._events[event] = self._events[event] or {}
	self._events[event][callback] = true
end
function Media:emit(event, ...)
	if not self._events then return end

	local callbacks = self._events[event]
	if not callbacks then return end

	for k,_ in pairs(callbacks) do
		k(...)
	end
end

function Media:getServiceBase()
	error("Media:getServiceBase() not implemented!")
end
function Media:getService()
	return self._service
end
function Media:getUrl()
	return self._unresolvedUrl
end

-- If metadata is cached: return it
-- Otherwise either start a new metadata query, or if one is already going on
-- do nothing
function Media:lookupMetadata()
	local md = self._metadata

	-- Already fetched
	if type(md) == "table" then return md end

	-- Fetching or there was an error (TODO make error available to user)
	if md == true or type(md) == "string" then return nil end

	self._metadata = true
	self:getService():query(self:getUrl(), function(err, data)
		if err then
			self._metadata = err
		else
			self._metadata = data
		end
	end)

	return nil
end

-- True returned from this function does not imply anything related to how
-- ready media is to play, just that it exists somewhere in memory and should
-- at least in some point in the future be playable, but even that is not guaranteed
function Media:isValid()
	return false
end

-- The GMod global IsValid requires the uppercase version
function Media:IsValid()
	return self:isValid()
end

-- vol must be a float between 0 and 1
function Media:setVolume(_vol) end
function Media:getVolume() end

-- "Quality" must be one of following strings: "low", "medium", "high", "veryhigh"
-- Qualities do not map equally between services (ie "low" in youtube might be "medium" in twitch)
-- Services are not guaranteed to change to the exact provided quality, or even to do anything at all
function Media:setQuality(_quality) end

-- time must be an integer between 0 and duration
function Media:seek(_time) end
function Media:getTime()
	return 0
end

-- This method can be called repeatedly to keep the media somewhat in sync
-- with given time, which makes it a great function to keep eg. synchronized
-- televisions in sync.
function Media:sync(time, margin)
	-- Only sync at most once per five seconds
	if self._lastSync and self._lastSync > CurTime() - 5 then
		return
	end

	local shouldSync = self:shouldSync(time, margin)
	if not shouldSync then return end

	self:seek(time + 0.1) -- Assume 0.1 sec loading time
	self._lastSync = CurTime()
end

function Media:shouldSync(time, margin)
	-- Check for invalid syncing state
	if not self:isValid() or not self:isPlaying() then
		return false
	end

	margin = margin or 2

	local curTime = self:getTime()
	local diff = math.abs(curTime - time)

	return diff > margin
end

-- Must return one of following strings: "error", "loading", "buffering", "playing", "paused", "ended"
-- Can also return nil if state is unknown or cannot be represented properly
-- If getState does not return nil, it should be assumed to be the correct current state
function Media:getState() end

-- Simplified function of above; simply returns boolean indicating playing state
function Media:isPlaying()
	return self:getState() == "playing"
end

function Media:play() end
function Media:pause() end
function Media:stop() end

-- Queue a function to run after media is loaded. The function should run immediately
-- if media is already loaded.
function Media:runCommand(_fn) end

function Media:draw(_x, _y, _w, _h) end

function Media:getTag() return self._tag end
function Media:setTag(tag) self._tag = tag end
function Media:guessDefaultTag()
	for i=1, 10 do
		local info = debug.getinfo(i, "S")
		if not info then break end

		local src = info.short_src
		local addon = src:match("addons/(.-)/")
		if addon and addon ~= "medialib" then return string.format("addon:%s", addon) end
	end

	return "addon:medialib"
end
function Media:setDefaultTag()
	self:setTag(self:guessDefaultTag())
end

function Media:getDebugInfo()
	return string.format(
		"[%s] Media [%s] valid:%s state:%s url:%s time:%d",
		self:getTag(), self.class.name, tostring(self:isValid()), self:getState(), self:getUrl(), self:getTime()
	)
end

end
-- 'media'; CodeLen/MinifiedLen 746/746; Dependencies []
medialib.modulePlaceholder("media")
do
local media = medialib.module("media")
media.Services = {}

function media.registerService(name, cls)
	media.Services[name] = cls()
end
media.RegisterService = media.registerService -- alias

function media.service(name)
	return media.Services[name]
end
media.Service = media.service -- alias

function media.guessService(url, opts)
	for name,service in pairs(media.Services) do
		local isViable = true

		isViable = isViable and name == 'youtube'

		if isViable and service:isValidUrl(url) then
			return service
		end
	end
end

-- function media.guessService(url, opts)
	-- for name,service in pairs(media.Services) do
		-- local isViable = true

		-- if opts and opts.whitelist then
			-- isViable = isViable and table.HasValue(opts.whitelist, name)
		-- end
		-- if opts and opts.blacklist then
			-- isViable = isViable and not table.HasValue(opts.blacklist, name)
		-- end

		-- if isViable and service:isValidUrl(url) then
			-- return service
		-- end
	-- end
-- end
media.GuessService = media.guessService -- alias

end
-- 'mediaregistry'; CodeLen/MinifiedLen 1246/1246; Dependencies []
medialib.modulePlaceholder("mediaregistry")
do
local mediaregistry = medialib.module("mediaregistry")

local cache = setmetatable({}, {__mode = "v"})

function mediaregistry.add(media)
	table.insert(cache, media)
end
function mediaregistry.get()
	return cache
end

concommand.Add("medialib_listall", function()
	hook.Run("MediaLib_ListAll")
end)
hook.Add("MediaLib_ListAll", "MediaLib_" .. medialib.INSTANCE, function()
	print("Media for medialib version " .. medialib.INSTANCE .. ":")
	for _,v in pairs(cache) do
		print(v:getDebugInfo())
	end
end)

concommand.Add("medialib_stopall", function()
	hook.Run("MediaLib_StopAll")
end)
hook.Add("MediaLib_StopAll", "MediaLib_" .. medialib.INSTANCE, function()
	for _,v in pairs(cache) do
		v:stop()
	end

	table.Empty(cache)
end)

local cvar_debug = CreateConVar("medialib_debugmedia", "0")
hook.Add("HUDPaint", "MediaLib_G_DebugMedia", function()
	if not cvar_debug:GetBool() then return end
	local counter = {0}
	hook.Run("MediaLib_DebugPaint", counter)
end)

hook.Add("MediaLib_DebugPaint", "MediaLib_" .. medialib.INSTANCE, function(counter)
	local i = counter[1]
	for _,media in pairs(cache) do
		local t = string.format("#%d %s", i, media:getDebugInfo())
		draw.SimpleText(t, "DermaDefault", 10, 10 + i*15)

		i=i+1
	end
	counter[1] = i
end)
end
-- 'servicebase'; CodeLen/MinifiedLen 2234/2234; Dependencies [oop,mediaregistry]
medialib.modulePlaceholder("servicebase")
do
local oop = medialib.load("oop")
local mediaregistry = medialib.load("mediaregistry")

local Service = oop.class("Service")

function Service:on(event, callback)
	self._events = {}
	self._events[event] = self._events[event] or {}
	self._events[event][callback] = true
end
function Service:emit(event, ...)
	for k,_ in pairs(self._events[event] or {}) do
		k(...)
	end

	if event == "error" then
		MsgN("[MediaLib] Video error: " .. table.ToString{...})
	end
end

function Service:load() end
function Service:loadMediaObject(media, url, opts)
	media._unresolvedUrl = url
	media._service = self

	media:setDefaultTag()

	hook.Run("Medialib_ProcessOpts", media, opts or {})

	mediaregistry.add(media)

	self:resolveUrl(url, function(resolvedUrl, resolvedData)
		media:openUrl(resolvedUrl)

		if resolvedData and resolvedData.start and (not opts or not opts.dontSeek) then media:seek(resolvedData.start) end
	end)
end

function Service:isValidUrl() end

-- Sub-services should override this
function Service:directQuery() end

-- A metatable for the callback chain
local _service_cbchain_meta = {}
_service_cbchain_meta.__index = _service_cbchain_meta
function _service_cbchain_meta:addCallback(cb)
	table.insert(self._callbacks, cb)
end
function _service_cbchain_meta:run(err, data)
	local first = table.remove(self._callbacks, 1)
	if not first then return end

	first(err, data, function(chainedErr, chainedData)
		self:run(chainedErr, chainedData)
	end)
end

-- Query calls direct query and then passes the data through a medialib hook
function Service:query(url, callback)
	local cbchain = setmetatable({_callbacks = {}}, _service_cbchain_meta)

	-- First add the data gotten from the service itself
	cbchain:addCallback(function(_, _, cb) return self:directQuery(url, cb) end)

	-- Then add custom callbacks
	hook.Run("Medialib_ExtendQuery", url, cbchain)

	-- Then add the user callback
	cbchain:addCallback(function(err, data) callback(err, data) end)

	-- Finally run the chain
	cbchain:run(url)
end

function Service:parseUrl() end

-- the second argument to cb() function call has some standard keys:
--   `start` the time at which to start media in seconds
function Service:resolveUrl(url, cb)
	cb(url, self:parseUrl(url))
end

end
-- 'timekeeper'; CodeLen/MinifiedLen 1015/1015; Dependencies [oop]
medialib.modulePlaceholder("timekeeper")
do
-- The purpose of TimeKeeper is to keep time where it is not easily available synchronously (ie. HTML based services)
local oop = medialib.load("oop")

local TimeKeeper = oop.class("TimeKeeper")

function TimeKeeper:initialize()
	self:reset()
end

function TimeKeeper:reset()
	self.cachedTime = 0

	self.running = false
	self.runningTimeStart = 0
end

function TimeKeeper:getTime()
	local time = self.cachedTime

	if self.running then
		time = time + (RealTime() - self.runningTimeStart)
	end

	return time
end

function TimeKeeper:isRunning()
	return self.running
end

function TimeKeeper:play()
	if self.running then return end

	self.runningTimeStart = RealTime()
	self.running = true
end

function TimeKeeper:pause()
	if not self.running then return end

	local runningTime = RealTime() - self.runningTimeStart
	self.cachedTime = self.cachedTime + runningTime

	self.running = false
end

function TimeKeeper:seek(time)
	self.cachedTime = time

	if self.running then
		self.runningTimeStart = RealTime()
	end
end
end
-- 'service_html'; CodeLen/MinifiedLen 8599/8599; Dependencies [oop,timekeeper]
medialib.modulePlaceholder("service_html")
do
local oop = medialib.load("oop")
medialib.load("timekeeper")

local HTMLService = oop.class("HTMLService", "Service")
function HTMLService:load(url, opts)
	local media = oop.class("HTMLMedia")()
	self:loadMediaObject(media, url, opts)
	return media
end

-- Whether or not we can trust that the HTML panel will send 'playing', 'paused'
-- and other playback related events. If this returns true, 'timekeeper' will
-- not be updated in playback related methods (except stop).
function HTMLService:hasReliablePlaybackEvents(_media)
	return false
end

local HTMLPool = {instances = {}}
local function GetMaxPoolInstances()
	return medialib.MAX_HTMLPOOL_INSTANCES or 0
end

hook.Add("MediaLib_HTMLPoolInfo", medialib.INSTANCE, function()
	print(medialib.INSTANCE .. "> Free HTMLPool instance count: " .. #HTMLPool.instances .. "/" .. GetMaxPoolInstances())
end)
concommand.Add("medialib_htmlpoolinfo", function()
	hook.Run("MediaLib_HTMLPoolInfo")
end)

-- Automatic periodic cleanup of html pool objects
timer.Create("MediaLib." .. medialib.INSTANCE .. ".HTMLPoolCleaner", 60, 0, function()
	if #HTMLPool.instances == 0 then return end

	local inst = table.remove(HTMLPool.instances, 1)
	if IsValid(inst) then inst:Remove() end
end)
function HTMLPool.newInstance()
	return vgui.Create("DHTML")
end
function HTMLPool.get()
	if #HTMLPool.instances == 0 then
		if medialib.DEBUG then
			MsgN("[MediaLib] Returning new instance; htmlpool empty")
		end
		return HTMLPool.newInstance()
	end

	local inst = table.remove(HTMLPool.instances, 1)
	if not IsValid(inst) then
		if medialib.DEBUG then
			MsgN("[MediaLib] Returning new instance; instance was invalid")
		end
		return HTMLPool.newInstance()
	end
	if medialib.DEBUG then
		MsgN("[MediaLib] Returning an instance from the HTML pool")
	end
	return inst
end
function HTMLPool.free(inst)
	if not IsValid(inst) then return end

	if #HTMLPool.instances >= GetMaxPoolInstances() then
		if medialib.DEBUG then
			MsgN("[MediaLib] HTMLPool full; removing the freed instance")
		end
		inst:Remove()
	else
		if medialib.DEBUG then
			MsgN("[MediaLib] Freeing an instance to the HTMLPool")
		end
		inst:SetHTML("")
		table.insert(HTMLPool.instances, inst)
	end
end

local cvar_showAllMessages = CreateConVar("medialib_showallmessages", "0")

local HTMLMedia = oop.class("HTMLMedia", "Media")

local panel_width, panel_height = 1280, 720
function HTMLMedia:initialize()
	self.timeKeeper = oop.class("TimeKeeper")()

	self.panel = HTMLPool.get()

	local pnl = self.panel
	pnl:SetPos(0, 0)
	pnl:SetSize(panel_width, panel_height)

	local hookid = "MediaLib.HTMLMedia.FakeThink-" .. self:hashCode()
	hook.Add("Think", hookid, function()
		if not IsValid(self.panel) then
			hook.Remove("Think", hookid)
			return
		end

		self.panel:Think()
	end)

	local oldcm = pnl._OldCM or pnl.ConsoleMessage
	pnl._OldCM = oldcm
	pnl.ConsoleMessage = function(pself, msg)
		if msg and not cvar_showAllMessages:GetBool() then
			-- Filter some things out
			if string.find(msg, "XMLHttpRequest", nil, true) then return end
			if string.find(msg, "Unsafe JavaScript attempt to access", nil, true) then return end
			if string.find(msg, "Unable to post message to", nil, true) then return end
			if string.find(msg, "ran insecure content from", nil, true) then return end
			if string.find(msg, "Mixed Content:", nil, true) then return end
		end

		return oldcm(pself, msg)
	end

	pnl:AddFunction("console", "warn", function(param)
		-- Youtube seems to spam lots of useless stuff here (that requires this function still?), so block by default
		if not cvar_showAllMessages:GetBool() then return end

		pnl:ConsoleMessage(param)
	end)

	pnl:SetPaintedManually(true)
	pnl:SetVisible(false)

	pnl:AddFunction("medialiblua", "Event", function(id, jsonstr)
		self:handleHTMLEvent(id, util.JSONToTable(jsonstr))
	end)
end

function HTMLMedia:getBaseService()
	return "html"
end

function HTMLMedia:openUrl(url)
	self.panel:OpenURL(url)

	self.URLChanged = CurTime()
end
function HTMLMedia:runJS(js, ...)
	local code = string.format(js, ...)
	self.panel:QueueJavascript(code)
end

function HTMLMedia:handleHTMLEvent(id, event)
	if medialib.DEBUG then
		MsgN("[MediaLib] HTML Event: " .. id .. " (" .. table.ToString(event) .. ")")
	end
	if id == "stateChange" then
		local state = event.state
		local setToState

		if event.time then
			self.timeKeeper:seek(event.time)
		end
		if state == "playing" then
			setToState = "playing"
			self.timeKeeper:play()
		elseif state == "ended" or state == "paused" or state == "buffering" then
			setToState = state
			self.timeKeeper:pause()
		end

		if setToState then
			self.state = setToState
			self:emit(setToState)
		end
	elseif id == "playerLoaded" then
		for _,fn in pairs(self.commandQueue or {}) do
			fn()
		end
	elseif id == "error" then
		self:emit("error", {errorId = "service_error", errorName = "Error from service: " .. tostring(event.message)})
	else
		MsgN("[MediaLib] Unhandled HTML event " .. tostring(id))
	end
end
function HTMLMedia:getState()
	return self.state
end

local cvar_updatestride = CreateConVar("medialib_html_updatestride", "1", FCVAR_ARCHIVE)

function HTMLMedia:setUpdateStrideOverride(override)
	self._updateStrideOverride = override
end

function HTMLMedia:updateTexture()
	local framenumber = FrameNumber()

	local nextTextureUpdateFrame = self._nextTextureUpdateFrame or 0

	local stride = self._updateStrideOverride or cvar_updatestride:GetInt()
	if nextTextureUpdateFrame <= framenumber then
		self.panel:UpdateHTMLTexture()
		self._nextTextureUpdateFrame = framenumber + stride
	end
end

function HTMLMedia:getHTMLMaterial()
	if self._htmlMat then
		return self._htmlMat
	end
	local mat = self.panel:GetHTMLMaterial()
	self._htmlMat = mat
	return mat
end

function HTMLMedia:draw(x, y, w, h)
	self:updateTexture()

	local mat = self:getHTMLMaterial()

	-- [June 2017] CEF GetHTMLMaterial returns nil for some time after panel creation
	if not mat then
		return
	end

	surface.SetMaterial(mat)
	surface.SetDrawColor(255, 255, 255)

	local w_frac, h_frac = panel_width / mat:Width(), panel_height / mat:Height()
	surface.DrawTexturedRectUV(x or 0, y or 0, w or panel_width, h or panel_height, 0, 0, w_frac, h_frac)
end

function HTMLMedia:getTime()
	return self.timeKeeper:getTime()
end

function HTMLMedia:setQuality(qual)
	if self.lastSetQuality and self.lastSetQuality == qual then
		return
	end
	self.lastSetQuality = qual

	self:runJS("medialibDelegate.run('setQuality', {quality: %q})", qual)
end

-- This applies the volume to the HTML panel
-- There is a undocumented 'internalVolume' variable, that can be used by eg 3d vol
function HTMLMedia:applyVolume()
	local ivol = self.internalVolume or 1
	local rvol = self.volume or 1

	local vol = ivol * rvol

	if self.lastSetVolume and self.lastSetVolume == vol then
		return
	end
	self.lastSetVolume = vol

	self:runJS("medialibDelegate.run('setVolume', {vol: %f})", vol)
end

-- This sets a volume variable
function HTMLMedia:setVolume(vol)
	self.volume = vol
	self:applyVolume()
end

function HTMLMedia:getVolume()
	-- could cookies potentially set the volume to something other than 1?
	return self.volume or 1
end

-- if we dont rely on callbacks from JS, this will be the 'buffer' time for seeks
local SEEK_BUFFER = 0.2

function HTMLMedia:seek(time)
	-- Youtube does not seem to properly callback with a 'seek' event (works in Chrome)
	-- Workaround by setting timeseeker time instantly here with a small buffer
	-- Using workaround is ok because if we somehow get event later, it'll correct
	-- the time that was set wrongly here
	self.timeKeeper:seek(time - SEEK_BUFFER)

	self:runJS("medialibDelegate.run('seek', {time: %.1f})", time)
end

-- See HTMLService:hasReliablePlaybackEvents()
function HTMLMedia:hasReliablePlaybackEvents()
	local service = self:getService()
	return service and service:hasReliablePlaybackEvents(self)
end

function HTMLMedia:play()
	if not self:hasReliablePlaybackEvents() then
		self.timeKeeper:play()
	end

	self:runJS("medialibDelegate.run('play')")
end
function HTMLMedia:pause()
	if not self:hasReliablePlaybackEvents() then
		self.timeKeeper:pause()
	end

	self:runJS("medialibDelegate.run('pause')")
end
function HTMLMedia:stop()
	HTMLPool.free(self.panel)
	self.panel = nil

	self.timeKeeper:pause()
	self:emit("ended", {stopped = true})
	self:emit("destroyed")
end

function HTMLMedia:runCommand(fn)
	if self._playerLoaded then
		fn()
	else
		self.commandQueue = self.commandQueue or {}
		self.commandQueue[#self.commandQueue+1] = fn
	end
end

function HTMLMedia:isValid()
	return IsValid(self.panel)
end

end
-- 'service_bass'; CodeLen/MinifiedLen 6642/6642; Dependencies [oop,mediaregistry]
medialib.modulePlaceholder("service_bass")
do
local oop = medialib.load("oop")

local BASSService = oop.class("BASSService", "Service")
function BASSService:load(url, opts)
	local media = oop.class("BASSMedia")()
	self:loadMediaObject(media, url, opts)
	return media
end

local BASSMedia = oop.class("BASSMedia", "Media")

function BASSMedia:initialize()
	self.bassPlayOptions = {"noplay", "noblock"}
	self.commandQueue = {}
end

function BASSMedia:getBaseService()
	return "bass"
end

function BASSMedia:updateFFT()
	local curFrame = FrameNumber()
	if self._lastFFTUpdate and self._lastFFTUpdate == curFrame then return end
	self._lastFFTUpdate = curFrame

	local chan = self.chan
	if not IsValid(chan) then return end

	self.fftValues = self.fftValues or {}
	chan:FFT(self.fftValues, FFT_512)
end

function BASSMedia:getFFT()
	return self.fftValues
end

function BASSMedia:draw(x, y, w, h)
	surface.SetDrawColor(0, 0, 0)
	surface.DrawRect(x, y, w, h)

	self:updateFFT()
	local fftValues = self:getFFT()
	if not fftValues then return end

	local valCount = #fftValues

	local barw = w / (valCount)
	for i=1, valCount do
		surface.SetDrawColor(HSVToColor(i, 0.9, 0.5))

		local barh = fftValues[i]*h
		surface.DrawRect(x + i*barw, y + (h-barh), barw, barh)
	end
end

function BASSMedia:openUrl(url)
	self._openingInfo = {"url", url}

	local flags = table.concat(self.bassPlayOptions, " ")

	sound.PlayURL(url, flags, function(chan, errId, errName)
		self:bassCallback(chan, errId, errName)
	end)
end
function BASSMedia:openFile(path)
	self._openingInfo = {"file", path}

	local flags = table.concat(self.bassPlayOptions, " ")

	sound.PlayFile(path, flags, function(chan, errId, errName)
		self:bassCallback(chan, errId, errName)
	end)
end

-- Attempts to reload the stream
function BASSMedia:reload()
	local type, resource = unpack(self._openingInfo or {})
	if not type then
		MsgN("[Medialib] Attempting to reload BASS stream that was never started the first time!")
		return
	end

	-- stop existing channel if it exists
	if IsValid(self.chan) then
		self.chan:Stop()
		self.chan = nil
	end

	-- Remove stop flag, clear cmd queue, stop state checker
	self._stopped = false
	self:stopStateChecker()
	self.commandQueue = {}

	MsgN("[Medialib] Attempting to reload BASS stream ", type, resource)
	if type == "url" then
		self:openUrl(resource)
	elseif type == "file" then
		self:openFile(resource)
	elseif type then
		MsgN("[Medialib] Failed to reload audio resource ", type, resource)
		return
	end

	self:applyVolume(true)

	if self._commandState == "play" then
		self:play()
	end
end

function BASSMedia:bassCallback(chan, errId, errName)
	if not IsValid(chan) then
		ErrorNoHalt("[MediaLib] BassMedia play failed: ", errName)
		self._stopped = true

		self:emit("error", "loading_failed", string.format("BASS error id: %s; name: %s", errId, errName))
		return
	end

	-- Check if media was stopped before loading
	if self._stopped then
		MsgN("[MediaLib] Loading BASS media aborted; stop flag was enabled")
		chan:Stop()
		return
	end

	self.chan = chan

	for _,c in pairs(self.commandQueue) do
		c(chan)
	end

	-- Empty queue
	self.commandQueue = {}

	self:startStateChecker()
end

function BASSMedia:startStateChecker()
	timer.Create("MediaLib_BASS_EndChecker_" .. self:hashCode(), 1, 0, function()
		if IsValid(self.chan) and self.chan:GetState() == GMOD_CHANNEL_STOPPED then
			self:emit("ended")
			self:stopStateChecker()
		end
	end)
end
function BASSMedia:stopStateChecker()
	timer.Remove("MediaLib_BASS_EndChecker_" .. self:hashCode())
end

function BASSMedia:runCommand(fn)
	if IsValid(self.chan) then
		fn(self.chan)
	else
		self.commandQueue[#self.commandQueue+1] = fn
	end
end


-- This applies the volume to the HTML panel
-- There is a undocumented 'internalVolume' variable, that can be used by eg 3d vol
function BASSMedia:applyVolume(force)
	local ivol = self.internalVolume or 1
	local rvol = self.volume or 1

	local vol = ivol * rvol

	if not force and self.lastSetVolume and self.lastSetVolume == vol then
		return
	end
	self.lastSetVolume = vol

	self:runCommand(function(chan) chan:SetVolume(vol) end)
end
function BASSMedia:setVolume(vol)
	self.volume = vol
	self:applyVolume()
end

function BASSMedia:getVolume()
	return self.volume or 1
end

function BASSMedia:seek(time)
	self:runCommand(function(chan)
		if chan:IsBlockStreamed() then return end

		self._seekingTo = time

		local timerId = "MediaLib_BASSMedia_Seeker_" .. self:hashCode()
		local function AttemptSeek()
				-- someone used :seek with other time
			if  self._seekingTo ~= time or
				-- chan not valid
				not IsValid(chan) then

				timer.Destroy(timerId)
				return
			end

			chan:SetTime(time)

			-- seek succeeded
			if math.abs(chan:GetTime() - time) < 0.25 then
				timer.Destroy(timerId)
			end
		end
		timer.Create(timerId, 0.2, 0, AttemptSeek)
		AttemptSeek()
	end)
end
function BASSMedia:getTime()
	if self:isValid() and IsValid(self.chan) then
		return self.chan:GetTime()
	end
	return 0
end

function BASSMedia:getState()
	if not self:isValid() then return "error" end

	if not IsValid(self.chan) then return "loading" end

	local bassState = self.chan:GetState()
	if bassState == GMOD_CHANNEL_PLAYING then return "playing" end
	if bassState == GMOD_CHANNEL_PAUSED then return "paused" end
	if bassState == GMOD_CHANNEL_STALLED then return "buffering" end
	if bassState == GMOD_CHANNEL_STOPPED then return "paused" end -- umm??
	return
end

function BASSMedia:play()
	self:runCommand(function(chan)
		chan:Play()
		self:emit("playing")
		self._commandState = "play"
	end)
end
function BASSMedia:pause()
	self:runCommand(function(chan)
		chan:Pause()
		self:emit("paused")
		self._commandState = "pause"
	end)
end
function BASSMedia:stop()
	self._stopped = true
	self:runCommand(function(chan)
		chan:Stop()
		self:emit("ended", {stopped = true})
		self:emit("destroyed")

		self:stopStateChecker()
	end)
end

function BASSMedia:isValid()
	return not self._stopped
end

local mediaregistry = medialib.load("mediaregistry")

local netmsgid = "ML_MapCleanHack_" .. medialib.INSTANCE
if CLIENT then

	-- Logic for reloading BASS streams after map cleanups
	-- Workaround until gmod issue #2874 gets fixed
	net.Receive(netmsgid, function()
		for _,v in pairs(mediaregistry.get()) do

			-- BASS media that should play, yet does not
			if v:getBaseService() == "bass"
				and v:isValid()
				and IsValid(v.chan)
				and v.chan:GetState() == GMOD_CHANNEL_STOPPED then
				v:reload()
			end
		end
	end)
end
if SERVER then
	util.AddNetworkString(netmsgid)
	hook.Add("PostCleanupMap", "MediaLib_BassReload" .. medialib.INSTANCE, function()
		net.Start(netmsgid)
		net.Broadcast()
	end)
end
end
medialib.FolderItems["services/gdrive.lua"] = "local oop = medialib.load(\"oop\")\n\nlocal GDriveService = oop.class(\"GDriveService\", \"HTMLService\")\nGDriveService.identifier = \"GDrive\"\n\nlocal all_patterns = {\"^https?://drive.google.com/file/d/([^/]*)/edit\"}\n\nfunction GDriveService:parseUrl(url)\n\tfor _,pattern in pairs(all_patterns) do\n\t\tlocal id = string.match(url, pattern)\n\t\tif id then\n\t\t\treturn {id = id}\n\t\tend\n\tend\nend\n\nfunction GDriveService:isValidUrl(url)\n\treturn self:parseUrl(url) ~= nil\nend\n\nlocal function urlencode(str)\n   if (str) then\n      str = string.gsub (str, \"\\n\", \"\\r\\n\")\n      str = string.gsub (str, \"([^%w ])\",\n         function (c) return string.format (\"%%%02X\", string.byte(c)) end)\n      str = string.gsub (str, \" \", \"+\")\n   end\n   return str\nend\n\nlocal player_url = \"https://wyozi.github.io/gmod-medialib/mp4.html?id=%s\"\nlocal gdrive_stream_url = \"https://drive.google.com/uc?export=download&confirm=yTib&id=%s\"\nfunction GDriveService:resolveUrl(url, callback)\n\tlocal urlData = self:parseUrl(url)\n\tlocal playerUrl = string.format(player_url, urlencode(string.format(gdrive_stream_url, urlData.id)))\n\n\tcallback(playerUrl, {start = urlData.start})\nend\n\nfunction GDriveService:directQuery(url, callback)\n\tcallback(nil, {\n\t\ttitle = url:match(\"([^/]+)$\")\n\t})\nend\n\nfunction GDriveService:hasReliablePlaybackEvents()\n\treturn true\nend\n\nreturn GDriveService"
medialib.FolderItems["services/mp4.lua"] = "local oop = medialib.load(\"oop\")\n\nlocal Mp4Service = oop.class(\"Mp4Service\", \"HTMLService\")\nMp4Service.identifier = \"mp4\"\n\nlocal all_patterns = {\"^https?://.*%.mp4\"}\n\nfunction Mp4Service:parseUrl(url)\n\tfor _,pattern in pairs(all_patterns) do\n\t\tlocal id = string.match(url, pattern)\n\t\tif id then\n\t\t\treturn {id = id}\n\t\tend\n\tend\nend\n\nfunction Mp4Service:isValidUrl(url)\n\treturn self:parseUrl(url) ~= nil\nend\n\nlocal player_url = \"https://wyozi.github.io/gmod-medialib/mp4.html?id=%s\"\nfunction Mp4Service:resolveUrl(url, callback)\n\tlocal urlData = self:parseUrl(url)\n\tlocal playerUrl = string.format(player_url, urlData.id)\n\n\tcallback(playerUrl, {start = urlData.start})\nend\n\nfunction Mp4Service:directQuery(url, callback)\n\tcallback(nil, {\n\t\ttitle = url:match(\"([^/]+)$\")\n\t})\nend\n\nfunction Mp4Service:hasReliablePlaybackEvents()\n\treturn true\nend\n\nreturn Mp4Service"
medialib.FolderItems["services/soundcloud.lua"] = "local oop = medialib.load(\"oop\")\n\nlocal SoundcloudService = oop.class(\"SoundcloudService\", \"BASSService\")\nSoundcloudService.identifier = \"soundcloud\"\n\nlocal all_patterns = {\n\t\"^https?://www.soundcloud.com/([A-Za-z0-9_%-]+/[A-Za-z0-9_%-]+)/?.*$\",\n\t\"^https?://soundcloud.com/([A-Za-z0-9_%-]+/[A-Za-z0-9_%-]+)/?.*$\",\n}\n\n-- Support url that passes track id directly\nlocal id_pattern = \"^https?://api.soundcloud.com/tracks/(%d+)\"\n\nfunction SoundcloudService:parseUrl(url)\n\tfor _,pattern in pairs(all_patterns) do\n\t\tlocal path = string.match(url, pattern)\n\t\tif path then\n\t\t\treturn {path = path}\n\t\tend\n\tend\n\n\tlocal id = string.match(url, id_pattern)\n\tif id then\n\t\treturn {id = id}\n\tend\nend\n\nfunction SoundcloudService:isValidUrl(url)\n\treturn self:parseUrl(url) ~= nil\nend\n\nfunction SoundcloudService:resolveUrl(url, callback)\n\tlocal apiKey = medialib.SOUNDCLOUD_API_KEY\n\tif not apiKey then\n\t\tErrorNoHalt(\"SoundCloud error: Missing SoundCloud API key\")\n\t\treturn\n\tend\n\n\tif type(apiKey) == \"table\" then\n\t\tapiKey = table.Random(apiKey)\n\tend\n\n\tlocal urlData = self:parseUrl(url)\n\n\tif urlData.id then\n\t\t-- id passed directly; nice, we can skip resolve.json\n\t\tcallback(string.format(\"https://api.soundcloud.com/tracks/%s/stream?client_id=%s\", urlData.id, apiKey), {})\n\telse\n\t\thttp.Fetch(\n\t\t\tstring.format(\n\t\t\t\t\"https://api.soundcloud.com/resolve.json?url=http://soundcloud.com/%s&client_id=%s\",\n\t\t\t\turlData.path, apiKey\n\t\t\t),\n\t\t\tfunction(data)\n\t\t\t\tlocal jsonTable = util.JSONToTable(data)\n\t\t\t\tif not jsonTable then\n\t\t\t\t\tErrorNoHalt(\"Failed to retrieve SC track id for \" .. urlData.path .. \": empty JSON\")\n\t\t\t\t\treturn\n\t\t\t\tend\n\n\t\t\t\tlocal id = jsonTable.id\n\t\t\t\tcallback(string.format(\"https://api.soundcloud.com/tracks/%s/stream?client_id=%s\", id, apiKey), {})\n\t\t\tend)\n\tend\nend\n\nfunction SoundcloudService:directQuery(url, callback)\n\tlocal apiKey = medialib.SOUNDCLOUD_API_KEY\n\tif not apiKey then\n\t\tcallback(\"Missing SoundCloud API key\")\n\t\treturn\n\tend\n\n\tif type(apiKey) == \"table\" then\n\t\tapiKey = table.Random(apiKey)\n\tend\n\n\tlocal urlData = self:parseUrl(url)\n\n\tlocal metaurl\n\tif urlData.path then\n\t\tmetaurl = string.format(\n\t\t\t\"https://api.soundcloud.com/resolve.json?url=http://soundcloud.com/%s&client_id=%s\",\n\t\t\turlData.path, apiKey\n\t\t)\n\telse\n\t\tmetaurl = string.format(\"https://api.soundcloud.com/tracks/%s?client_id=%s\", urlData.id, apiKey)\n\tend\n\n\thttp.Fetch(metaurl, function(result, size)\n\t\tif size == 0 then\n\t\t\tcallback(\"http body size = 0\")\n\t\t\treturn\n\t\tend\n\n\t\tlocal entry = util.JSONToTable(result)\n\n\t\tif entry.errors then\n\t\t\tlocal msg = entry.errors[1].error_message or \"error\"\n\n\t\t\tlocal translated = msg\n\t\t\tif string.StartWith(msg, \"404\") then\n\t\t\t\ttranslated = \"Invalid id\"\n\t\t\tend\n\n\t\t\tcallback(translated)\n\t\t\treturn\n\t\tend\n\n\t\tcallback(nil, {\n\t\t\ttitle = entry.title,\n\t\t\tduration = tonumber(entry.duration) / 1000\n\t\t})\n\tend, function(err) callback(\"HTTP: \" .. err) end)\nend\n\nreturn SoundcloudService\n"
medialib.FolderItems["services/twitch.lua"] = "local oop = medialib.load(\"oop\")\n\nlocal TwitchService = oop.class(\"TwitchService\", \"HTMLService\")\nTwitchService.identifier = \"twitch\"\n\nlocal all_patterns = {\n\t\"https?://www.twitch.tv/([A-Za-z0-9_%-]+)\",\n\t\"https?://twitch.tv/([A-Za-z0-9_%-]+)\"\n}\n\nfunction TwitchService:parseUrl(url)\n\tfor _,pattern in pairs(all_patterns) do\n\t\tlocal id = string.match(url, pattern)\n\t\tif id then\n\t\t\treturn {id = id}\n\t\tend\n\tend\nend\n\nfunction TwitchService:isValidUrl(url)\n\treturn self:parseUrl(url) ~= nil\nend\n\nlocal player_url = \"https://wyozi.github.io/gmod-medialib/twitch.html?channel=%s\"\nfunction TwitchService:resolveUrl(url, callback)\n\tlocal urlData = self:parseUrl(url)\n\tlocal playerUrl = string.format(player_url, urlData.id)\n\n\tcallback(playerUrl, {start = urlData.start})\nend\n\nlocal CLIENT_ID = \"4cryixome326gh0x0j0fkulahsbdvx\"\n\nlocal function nameToId(name, callback)\n\thttp.Fetch(\"https://api.twitch.tv/kraken/users?login=\" .. name, function(b)\n\t\tlocal obj = util.JSONToTable(b)\n\t\tif not obj then\n\t\t\tcallback(\"malformed response JSON\")\n\t\t\treturn\n\t\tend\n\n\t\tcallback(nil, obj.users[1]._id)\n\tend, function()\n\t\tcallback(\"failed HTTP request\")\n\tend, {\n\t\tAccept = \"application/vnd.twitchtv.v5+json\",\n\t\t[\"Client-ID\"] = CLIENT_ID\n\t})\nend\n\nlocal function metaQuery(id, callback)\n\thttp.Fetch(\"https://api.twitch.tv/kraken/channels/\" .. id, function(b)\n\t\tlocal obj = util.JSONToTable(b)\n\t\tif not obj then\n\t\t\tcallback(\"malformed response JSON\")\n\t\t\treturn\n\t\tend\n\n\t\tcallback(nil, obj)\n\tend, function()\n\t\tcallback(\"failed HTTP request\")\n\tend, {\n\t\tAccept = \"application/vnd.twitchtv.v5+json\",\n\t\t[\"Client-ID\"] = CLIENT_ID\n\t})\nend\n\nfunction TwitchService:directQuery(url, callback)\n\tlocal urlData = self:parseUrl(url)\n\n\tnameToId(urlData.id, function(err, id)\n\t\tif err then\n\t\t\tcallback(err)\n\t\t\treturn\n\t\tend\n\n\t\tmetaQuery(id, function(metaErr, meta)\n\t\t\tif metaErr then\n\t\t\t\tcallback(metaErr)\n\t\t\t\treturn\n\t\t\tend\n\n\t\t\tlocal data = {}\n\t\t\tdata.id = urlData.id\n\n\t\t\tif meta.error then\n\t\t\t\tcallback(meta.message)\n\t\t\t\treturn\n\t\t\telse\n\t\t\t\tdata.title = meta.display_name .. \": \" .. meta.status\n\t\t\tend\n\n\t\t\tcallback(nil, data)\n\t\tend)\n\tend)\nend\n\nreturn TwitchService"
medialib.FolderItems["services/vimeo.lua"] = "local oop = medialib.load(\"oop\")\n\nlocal VimeoService = oop.class(\"VimeoService\", \"HTMLService\")\nVimeoService.identifier = \"vimeo\"\n\nlocal all_patterns = {\n\t\"https?://www.vimeo.com/([0-9]+)\",\n\t\"https?://vimeo.com/([0-9]+)\",\n\t\"https?://www.vimeo.com/channels/staffpicks/([0-9]+)\",\n\t\"https?://vimeo.com/channels/staffpicks/([0-9]+)\",\n}\n\nfunction VimeoService:parseUrl(url)\n\tfor _,pattern in pairs(all_patterns) do\n\t\tlocal id = string.match(url, pattern)\n\t\tif id then\n\t\t\treturn {id = id}\n\t\tend\n\tend\nend\n\nfunction VimeoService:isValidUrl(url)\n\treturn self:parseUrl(url) ~= nil\nend\n\nlocal player_url = \"http://wyozi.github.io/gmod-medialib/vimeo.html?id=%s\"\nfunction VimeoService:resolveUrl(url, callback)\n\tlocal urlData = self:parseUrl(url)\n\tlocal playerUrl = string.format(player_url, urlData.id)\n\n\tcallback(playerUrl, {start = urlData.start})\nend\n\nfunction VimeoService:directQuery(url, callback)\n\tlocal urlData = self:parseUrl(url)\n\tlocal metaurl = string.format(\"http://vimeo.com/api/v2/video/%s.json\", urlData.id)\n\n\thttp.Fetch(metaurl, function(result, size, _headers, httpcode)\n\t\tif size == 0 then\n\t\t\tcallback(\"http body size = 0\")\n\t\t\treturn\n\t\tend\n\n\t\tif httpcode == 404 then\n\t\t\tcallback(\"Invalid id\")\n\t\t\treturn\n\t\tend\n\n\t\tlocal data = {}\n\t\tdata.id = urlData.id\n\n\t\tlocal jsontbl = util.JSONToTable(result)\n\n\t\tif jsontbl then\n\t\t\tdata.title = jsontbl[1].title\n\t\t\tdata.duration = jsontbl[1].duration\n\t\telse\n\t\t\tdata.title = \"ERROR\"\n\t\tend\n\n\t\tcallback(nil, data)\n\tend, function(err) callback(\"HTTP: \" .. err) end)\nend\n\nfunction VimeoService:hasReliablePlaybackEvents()\n\treturn true\nend\n\nreturn VimeoService\n"
medialib.FolderItems["services/webaudio.lua"] = "local oop = medialib.load(\"oop\")\nlocal WebAudioService = oop.class(\"WebAudioService\", \"BASSService\")\nWebAudioService.identifier = \"webaudio\"\n\nlocal all_patterns = {\n\t\"^https?://(.*)%.mp3\",\n\t\"^https?://(.*)%.ogg\",\n}\n\nfunction WebAudioService:parseUrl(url)\n\tfor _,pattern in pairs(all_patterns) do\n\t\tlocal id = string.match(url, pattern)\n\t\tif id then\n\t\t\treturn {id = id}\n\t\tend\n\tend\nend\n\nfunction WebAudioService:isValidUrl(url)\n\treturn self:parseUrl(url) ~= nil\nend\n\nfunction WebAudioService:resolveUrl(url, callback)\n\tcallback(url, {})\nend\n\nfunction WebAudioService:directQuery(url, callback)\n\tcallback(nil, {\n\t\ttitle = url:match(\"([^/]+)$\")\n\t})\nend\n\nreturn WebAudioService"
medialib.FolderItems["services/webm.lua"] = "local oop = medialib.load(\"oop\")\n\nlocal WebmService = oop.class(\"WebmService\", \"HTMLService\")\nWebmService.identifier = \"webm\"\n\nlocal all_patterns = {\"^https?://.*%.webm\"}\n\nfunction WebmService:parseUrl(url)\n\tfor _,pattern in pairs(all_patterns) do\n\t\tlocal id = string.match(url, pattern)\n\t\tif id then\n\t\t\treturn {id = id}\n\t\tend\n\tend\nend\n\nfunction WebmService:isValidUrl(url)\n\treturn self:parseUrl(url) ~= nil\nend\n\nlocal player_url = \"http://wyozi.github.io/gmod-medialib/webm.html?id=%s\"\nfunction WebmService:resolveUrl(url, callback)\n\tlocal urlData = self:parseUrl(url)\n\tlocal playerUrl = string.format(player_url, urlData.id)\n\n\tcallback(playerUrl, {start = urlData.start})\nend\n\nfunction WebmService:directQuery(url, callback)\n\tcallback(nil, {\n\t\ttitle = url:match(\"([^/]+)$\")\n\t})\nend\n\nreturn WebmService"
medialib.FolderItems["services/webradio.lua"] = "local oop = medialib.load(\"oop\")\nlocal WebRadioService = oop.class(\"WebRadioService\", \"BASSService\")\nWebRadioService.identifier = \"webradio\"\n\nlocal all_patterns = {\n\t\"^https?://(.*)%.pls\",\n\t\"^https?://(.*)%.m3u\"\n}\n\nfunction WebRadioService:parseUrl(url)\n\tfor _,pattern in pairs(all_patterns) do\n\t\tlocal id = string.match(url, pattern)\n\t\tif id then\n\t\t\treturn {id = id}\n\t\tend\n\tend\nend\n\nfunction WebRadioService:isValidUrl(url)\n\treturn self:parseUrl(url) ~= nil\nend\n\nfunction WebRadioService:resolveUrl(url, callback)\n\tcallback(url, {})\nend\n\nfunction WebRadioService:directQuery(url, callback)\n\tcallback(nil, {\n\t\ttitle = url:match(\"([^/]+)$\") -- the filename is the best we can get (unless we parse pls?)\n\t})\nend\n\nreturn WebRadioService"
medialib.FolderItems["services/youtube.lua"] = "local oop = medialib.load(\"oop\")\n\nlocal YoutubeService = oop.class(\"YoutubeService\", \"HTMLService\")\nYoutubeService.identifier = \"youtube\"\n\nlocal raw_patterns = {\n\t\"^https?://[A-Za-z0-9%.%-]*%.?youtu%.be/([A-Za-z0-9_%-]+)\",\n\t\"^https?://[A-Za-z0-9%.%-]*%.?youtube%.com/watch%?.*v=([A-Za-z0-9_%-]+)\",\n\t\"^https?://[A-Za-z0-9%.%-]*%.?youtube%.com/v/([A-Za-z0-9_%-]+)\",\n}\nlocal all_patterns = {}\n\n-- Appends time modifier patterns to each pattern\nfor _, p in pairs(raw_patterns) do\n\tlocal function with_sep(sep)\n\t\ttable.insert(all_patterns, p .. sep .. \"t=(%d+)m(%d+)s\")\n\t\ttable.insert(all_patterns, p .. sep .. \"t=(%d+)s?\")\n\tend\n\n\t-- We probably support more separators than youtube itself, but that does not matter\n\twith_sep(\"#\")\n\twith_sep(\"&\")\n\twith_sep(\"?\")\n\n\ttable.insert(all_patterns, p)\nend\n\nfunction YoutubeService:parseUrl(url)\n\tfor _,pattern in pairs(all_patterns) do\n\t\tlocal id, time1, time2 = string.match(url, pattern)\n\t\tif id then\n\t\t\tlocal time_sec\n\t\t\tif time1 and time2 then\n\t\t\t\ttime_sec = tonumber(time1)*60 + tonumber(time2)\n\t\t\telse\n\t\t\t\ttime_sec = tonumber(time1)\n\t\t\tend\n\n\t\t\treturn {\n\t\t\t\tid = id,\n\t\t\t\tstart = time_sec\n\t\t\t}\n\t\tend\n\tend\nend\n\nfunction YoutubeService:isValidUrl(url)\n\treturn self:parseUrl(url) ~= nil\nend\n\nlocal player_url = \"http://wyozi.github.io/gmod-medialib/youtube.html?id=%s\"\nfunction YoutubeService:resolveUrl(url, callback)\n\tlocal urlData = self:parseUrl(url)\n\tlocal playerUrl = string.format(player_url, urlData.id)\n\n\tcallback(playerUrl, {start = urlData.start})\nend\n\n-- http://en.wikipedia.org/wiki/ISO_8601#Durations\n-- Cheers wiox :))\nlocal function PTToSeconds(str)\n\tlocal h = str:match(\"(%d+)H\") or 0\n\tlocal m = str:match(\"(%d+)M\") or 0\n\tlocal s = str:match(\"(%d+)S\") or 0\n\treturn h*(60*60) + m*60 + s\nend\n\nlocal DEFAULT_API_KEY = \"AIzaSyBmQHvMSiOTrmBKJ0FFJ2LmNtc4YHyUJaQ\"\n\nfunction YoutubeService:directQuery(url, callback)\n\tlocal apiKey = medialib.YOUTUBE_API_KEY or DEFAULT_API_KEY\n\n\tlocal urlData = self:parseUrl(url)\n\tlocal metaurl = string.format(\n\t\t\"https://www.googleapis.com/youtube/v3/videos?part=snippet%%2CcontentDetails&id=%s&key=%s\",\n\t\turlData.id, apiKey\n\t)\n\n\thttp.Fetch(metaurl, function(result, size)\n\t\tif size == 0 then\n\t\t\tcallback(\"http body size = 0\")\n\t\t\treturn\n\t\tend\n\n\t\tlocal data = {}\n\t\tdata.id = urlData.id\n\n\t\tlocal jsontbl = util.JSONToTable(result)\n\n\t\tif jsontbl and jsontbl.items then\n\t\t\tlocal item = jsontbl.items[1]\n\t\t\tif not item then\n\t\t\t\tcallback(\"No video id found\")\n\t\t\t\treturn\n\t\t\tend\n\n\t\t\tdata.title = item.snippet.title\n\t\t\t\n\t\t\tlocal live = item.snippet.liveBroadcastContent == \"live\"\n\t\t\tif live then\n\t\t\t\tdata.live = true\n\t\t\telse\n\t\t\t\tdata.duration = tonumber(PTToSeconds(item.contentDetails.duration))\n\t\t\tend\n\t\t\tdata.raw = item\n\t\telse\n\t\t\tcallback(result)\n\t\t\treturn\n\t\tend\n\n\t\tcallback(nil, data)\n\tend, function(err) callback(\"HTTP: \" .. err) end)\nend\n\nfunction YoutubeService:hasReliablePlaybackEvents()\n\treturn true\nend\n\nreturn YoutubeService\n"
-- 'serviceloader'; CodeLen/MinifiedLen 533/533; Dependencies [servicebase,service_html,service_bass,media,oop]
medialib.modulePlaceholder("serviceloader")
do
medialib.load("servicebase")

medialib.load("service_html")
medialib.load("service_bass")

local media = medialib.load("media")

-- Load the actual service files
for _,file in medialib.folderIterator("services") do
	if medialib.DEBUG then
		print("[MediaLib] Registering service " .. file.name)
	end
	if SERVER then file:addcs() end
	local status, err = pcall(function() return file:load() end)
	if status then
		media.registerService(err.identifier, err)
	else
		print("[MediaLib] Failed to load service ", file, ": ", err)
	end
end
end
-- '__loader'; CodeLen/MinifiedLen 325/325; Dependencies [mediabase,media,serviceloader]
medialib.modulePlaceholder("__loader")
do
-- This file loads required modules in the correct order.
-- For development version: this file is automatically called after autorun/medialib.lua
-- For distributable:       this file is loaded after packed modules have been added to medialib

medialib.load("mediabase")
medialib.load("media")
medialib.load("serviceloader")
end
return medialib
--PATH MediaLib_DynFile_youtube.lua:
local oop = medialib.load("oop")

local YoutubeService = oop.class("YoutubeService", "HTMLService")
YoutubeService.identifier = "youtube"

local raw_patterns = {
	"^https?://[A-Za-z0-9%.%-]*%.?youtu%.be/([A-Za-z0-9_%-]+)",
	"^https?://[A-Za-z0-9%.%-]*%.?youtube%.com/watch%?.*v=([A-Za-z0-9_%-]+)",
	"^https?://[A-Za-z0-9%.%-]*%.?youtube%.com/v/([A-Za-z0-9_%-]+)",
}
local all_patterns = {}

-- Appends time modifier patterns to each pattern
for _, p in pairs(raw_patterns) do
	local function with_sep(sep)
		table.insert(all_patterns, p .. sep .. "t=(%d+)m(%d+)s")
		table.insert(all_patterns, p .. sep .. "t=(%d+)s?")
	end

	-- We probably support more separators than youtube itself, but that does not matter
	with_sep("#")
	with_sep("&")
	with_sep("?")

	table.insert(all_patterns, p)
end

function YoutubeService:parseUrl(url)
	for _,pattern in pairs(all_patterns) do
		local id, time1, time2 = string.match(url, pattern)
		if id then
			local time_sec
			if time1 and time2 then
				time_sec = tonumber(time1)*60 + tonumber(time2)
			else
				time_sec = tonumber(time1)
			end

			return {
				id = id,
				start = time_sec
			}
		end
	end
end

function YoutubeService:isValidUrl(url)
	return self:parseUrl(url) ~= nil
end

local player_url = "http://wyozi.github.io/gmod-medialib/youtube.html?id=%s"
function YoutubeService:resolveUrl(url, callback)
	local urlData = self:parseUrl(url)
	local playerUrl = string.format(player_url, urlData.id)

	callback(playerUrl, {start = urlData.start})
end

-- http://en.wikipedia.org/wiki/ISO_8601#Durations
-- Cheers wiox :))
local function PTToSeconds(str)
	local h = str:match("(%d+)H") or 0
	local m = str:match("(%d+)M") or 0
	local s = str:match("(%d+)S") or 0
	return h*(60*60) + m*60 + s
end

local DEFAULT_API_KEY = "AIzaSyBmQHvMSiOTrmBKJ0FFJ2LmNtc4YHyUJaQ"

function YoutubeService:directQuery(url, callback)
	local apiKey = medialib.YOUTUBE_API_KEY or DEFAULT_API_KEY

	local urlData = self:parseUrl(url)
	local metaurl = string.format(
		"https://www.googleapis.com/youtube/v3/videos?part=snippet%%2CcontentDetails&id=%s&key=%s",
		urlData.id, apiKey
	)

	http.Fetch(metaurl, function(result, size)
		if size == 0 then
			callback("http body size = 0")
			return
		end

		local data = {}
		data.id = urlData.id

		local jsontbl = util.JSONToTable(result)

		if jsontbl and jsontbl.items then
			local item = jsontbl.items[1]
			if not item then
				callback("No video id found")
				return
			end

			data.title = item.snippet.title
			
			local live = item.snippet.liveBroadcastContent == "live"
			if live then
				data.live = true
			else
				data.duration = tonumber(PTToSeconds(item.contentDetails.duration))
			end
			data.raw = item
		else
			callback(result)
			return
		end

		callback(nil, data)
	end, function(err) callback("HTTP: " .. err) end)
end

function YoutubeService:hasReliablePlaybackEvents()
	return true
end

return YoutubeService

--PATH MediaLib_DynFile_vimeo.lua:
local oop = medialib.load("oop")

local VimeoService = oop.class("VimeoService", "HTMLService")
VimeoService.identifier = "vimeo"

local all_patterns = {
	"https?://www.vimeo.com/([0-9]+)",
	"https?://vimeo.com/([0-9]+)",
	"https?://www.vimeo.com/channels/staffpicks/([0-9]+)",
	"https?://vimeo.com/channels/staffpicks/([0-9]+)",
}

function VimeoService:parseUrl(url)
	for _,pattern in pairs(all_patterns) do
		local id = string.match(url, pattern)
		if id then
			return {id = id}
		end
	end
end

function VimeoService:isValidUrl(url)
	return self:parseUrl(url) ~= nil
end

local player_url = "http://wyozi.github.io/gmod-medialib/vimeo.html?id=%s"
function VimeoService:resolveUrl(url, callback)
	local urlData = self:parseUrl(url)
	local playerUrl = string.format(player_url, urlData.id)

	callback(playerUrl, {start = urlData.start})
end

function VimeoService:directQuery(url, callback)
	local urlData = self:parseUrl(url)
	local metaurl = string.format("http://vimeo.com/api/v2/video/%s.json", urlData.id)

	http.Fetch(metaurl, function(result, size, _headers, httpcode)
		if size == 0 then
			callback("http body size = 0")
			return
		end

		if httpcode == 404 then
			callback("Invalid id")
			return
		end

		local data = {}
		data.id = urlData.id

		local jsontbl = util.JSONToTable(result)

		if jsontbl then
			data.title = jsontbl[1].title
			data.duration = jsontbl[1].duration
		else
			data.title = "ERROR"
		end

		callback(nil, data)
	end, function(err) callback("HTTP: " .. err) end)
end

function VimeoService:hasReliablePlaybackEvents()
	return true
end

return VimeoService

--PATH addons/content_n_1407158309/lua/autorun/sh_neet.lua:

-------------------------------------------------------
-------------------------------------------------------
--	Models ported from Kane & Lynch by Simkas
--	Profile Link:	http://steamcommunity.com/profiles/76561197980354057/
--	NPCGroups Addon by NeoTanks
--	Profile Link:	http://steamcommunity.com/id/TheDreadedNeotank/
--	Shaders/Players/NPCs/Arms/Lua/Basically everything by V92
--	Profile Link:	http://steamcommunity.com/id/JesseVanover/
-------------------------------------------------------
-------------------------------------------------------

function AddPlayerModel( name, model )	player_manager.AddValidModel( name, model )	end
function AddPlayerHands( name, model, skin, bodygroup )	player_manager.AddValidHands( name, model, skin, bodygroup )	end
AddPlayerModel("NEET", "models/neet/swat_ply.mdl" )
AddPlayerHands( "NEET", "models/neet/weapons/arms_swat.mdl", 1, "00000000" )
list.Set( "PlayerOptionsAnimations", "NEET", 	{ "menu_combine" } )

util.PrecacheModel( "models/neet/swat_ply.mdl" )
util.PrecacheModel( "models/neet/swat_npccit.mdl" )
util.PrecacheModel( "models/neet/swat_npccop.mdl" )
util.PrecacheModel( "models/neet/swat_npccmb.mdl" )



local function NPCGCVarsneet(Panel)

	Panel:AddControl(	"Header",		{	Text = "KL NPCG Settings",	Description = "Settings for the Kane & Lynch SWAT NPCGs.\nChecked boxes mean yes/true.\nChanges take place for new NPCs only."	})							

	--Panel:AddControl(	"Slider",		{	Label = "HP - SWAT",	Type = "Integer",	Min = 1,	Max = 4096,	Command = "npcg_healthoverride_neet"	})
	--Panel:AddControl(	"Header",		{	Text = "NPCGHPORSWAT",	Description = "On a scale of redshirt to demigod, how tough do you want your NPCs?\nWIP - May Not Work!"	})							
	
	Panel:AddControl(	"Slider",		{	Label = "Grenade - SWAT",	Type = "Integer",	Min = 0,	Max = 25,	Command = "NPCG_Grenade_neet"	})
	Panel:AddControl(	"Header",		{	Text = "NPCGGrenSWAT",	Description = "How many grenades do you want enemy NPCs to have?"	})							

	Panel:AddControl(	"Slider",		{	Label = "Accuracy - SWAT",	Type = "Integer",	Min = 0,	Max = 4,	Command = "NPCG_Accuracy_neet",	})
	Panel:AddControl(	"Header",		{	Text = "NPCGACCSWAT",	Description = "On a scale of Stormtrooper (0) to USN SEAL Sniper (4), how accurate do you want your NPCs to be?"	})							

	Panel:AddControl(	"Slider",		{	Label = "Wake Radius",	Type = "Integer",	Min = 0,	Max = 8192,	Command = "NPCG_WakeRadius_neet"	})
	Panel:AddControl(	"Header",		{	Text = "NPCGWakeRadneetRob",	Description = "Wake Radius of player detection for NPCGs; default is 0, which uses the standard visibility settings"	})						
	
	Panel:AddControl(	"CheckBox",		{	Label = "Use Squads?",	Command = "NPCG_Squad_neet"	})	
	Panel:AddControl(	"Header",		{	Text = "NPCGSquadneetRob",	Description = "Do they use squads?\nNote: Each type uses its own squad; Friendly aren't in the same squad as enemy for example."	})							
	
end

local function NPCGToolMenuneet()	spawnmenu.AddToolMenuOption( "Options", "NEET", "NEET", "NEET", "", "", NPCGCVarsneet)	end
hook.Add( "PopulateToolMenu", "NPCGToolMenuneet", NPCGToolMenuneet)

----------------------------------------------
local Category = "NEET"
----------------------------------------------
list.Set( "NPC", "npcg_neet_cit", {	Name = "NEET",	Class = "npcg_neet_cit",	Category = Category	} )
list.Set( "NPC", "npcg_neet_cmb", {	Name = "NEET Enemy",	Class = "npcg_neet_cmb",	Category = Category	} )
//list.Set( "NPC", "npcg_neet_cop", {	Name = "NEET CP",	Class = "npcg_neet_cop",	Category = Category	} )

list.Set( "NPC", "npcg_neet_cit_spawn", {	Name = "NEET Spawner",	Class = "npcg_neet_cit_spawn",	Category = Category	} )
list.Set( "NPC", "npcg_neet_cmb_spawn", {	Name = "NEET Enemy Spawner",	Class = "npcg_neet_cmb_spawn",	Category = Category	} )
//list.Set( "NPC", "npcg_neet_cop_spawn", {	Name = "NEET CP Spawner",	Class = "npcg_neet_cop_spawn",	Category = Category	} )

--PATH addons/enc_scripts/lua/autorun/sh_spoly.lua:
if SERVER then return end
--[[
MIT License

Copyright (c) 2023 Aleksandrs Filipovskis

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
--]]


local STATUS_IDLE = 0
local STATUS_BUSY = 1

spoly = spoly or {}
spoly.materials = spoly.materials or {}
spoly.queue = spoly.queue or {}
spoly.status = STATUS_IDLE

local spoly = spoly
local materials = spoly.materials
local queue = spoly.queue
local queued = {}

local SIZE = 2048
-- MATERIAL_RT_DEPTH_SEPARATE makes stencils possible to work
local RT = GetRenderTargetEx ('onyx_spoly_rt', SIZE, SIZE, 0, MATERIAL_RT_DEPTH_SEPARATE, bit.band(16, 1024), 0, IMAGE_FORMAT_DEFAULT)
local CAPTURE_DATA = {
    x = 0,
    y = 0,
    w = SIZE,
    h = SIZE,
    format = 'png',
    alpha = true
}

file.CreateDir('spoly')

do
    local colorTag = Color(92, 192, 254)
    local colorError = Color(254, 92, 92)
    local tag = '[SPoly] '

    function spoly.Print(text, ...)
        MsgC(colorTag, tag, color_white, string.format(text, ...), '\n')
    end

    function spoly.PrintError(text, ...)
        MsgC(colorTag, tag, colorError, '[ERROR] ', color_white, string.format(text, ...), '\n')
    end
end

--[[------------------------------
Either render.PushFilterMin and render.PushFilterMag don't work with materials created with Lua
Idk what shader parameter is missing, I couldn't find it even by comparing materials' KeyValues
--------------------------------]]
function spoly.Render(id, funcDraw)
    local path = 'spoly/' .. id .. '.png'
    local start = SysTime()

    spoly.status = STATUS_BUSY

    render.PushRenderTarget(RT)

        render.Clear(0, 0, 0, 0)

        cam.Start2D()
            surface.SetDrawColor(color_white)
            draw.NoTexture()
            local success, errorText = pcall(funcDraw, SIZE, SIZE)
        cam.End2D()

        local content = render.Capture(CAPTURE_DATA)

        file.Delete(path)
        file.Write(path, content)

    render.PopRenderTarget()

    materials[id] = Material('data/' .. path, 'mips')

    spoly.status = STATUS_IDLE

    local endtime = SysTime()
    local delta = tostring(math.Round(endtime - start, 3))

    if (not success) then
        spoly.PrintError('Failed to render \'%s\', error text: %s', id, errorText)
    else
        spoly.Print('Rendered \'%s\' in %ss', id, delta)
    end

    return function(x, y, w, h, color)
        spoly.Draw(id, x, y, w, h, color)
    end
end

function spoly.Generate(id, funcDraw)
    assert(isstring(id), Format('bad argument #1 to \'spoly.Generate\' (expected string, got %s)', type(id)))
    assert(isfunction(funcDraw), Format('bad argument #2 to \'spoly.Generate\' (expected function, got %s)', type(funcDraw)))

    if (materials[id]) then return end
    if (queued[id]) then return end

    local path = 'spoly/' .. id .. '.png'
    if (file.Exists(path, 'DATA')) then
        materials[id] = Material('data/' .. path, 'mips')
        return
    end

    queued[id] = true

    table.insert(queue, {
        id = id,
        funcDraw = funcDraw
    })
end

do
    local thinkRate = 1 / 10
    local nextThink = 0
    hook.Add('Think', 'spoly.QueueController', function()
        if (spoly.status == STATUS_IDLE and queue[1] and nextThink <= CurTime()) then
            nextThink = CurTime() + thinkRate

            local data = table.remove(queue, 1)

            spoly.Render(data.id, data.funcDraw)
        end
    end)
end

do
    local SetDrawColor = surface.SetDrawColor
    local SetMaterial = surface.SetMaterial
    local DrawTexturedRect = surface.DrawTexturedRect
    local DrawTexturedRectRotated = surface.DrawTexturedRectRotated

    local PushFilterMag = render.PushFilterMag
    local PushFilterMin = render.PushFilterMin
    local PopFilterMag = render.PopFilterMag
    local PopFilterMin = render.PopFilterMin

    -- calling this really often so trying to optimize as much as possible
    function spoly.Draw(id, x, y, w, h, color)
        local material = materials[id]
        if (not material) then return end

        if (color) then
            SetDrawColor(color)
        end

        SetMaterial(material)

        PushFilterMag(TEXFILTER.ANISOTROPIC)
        PushFilterMin(TEXFILTER.ANISOTROPIC)

        DrawTexturedRect(x, y, w, h)

        PopFilterMag()
        PopFilterMin()
    end

    function spoly.DrawRotated(id, x, y, w, h, rotation, color)
        local material = materials[id]
        if (not material) then return end

        if (color) then
            SetDrawColor(color)
        end

        SetMaterial(material)

        PushFilterMag(TEXFILTER.ANISOTROPIC)
        PushFilterMin(TEXFILTER.ANISOTROPIC)

        DrawTexturedRectRotated(x, y, w, h, rotation)

        PopFilterMag()
        PopFilterMin()
    end
end

--[[------------------------------
Sometimes materials cannot be overriden, so change the name if you want to edit it's content
--------------------------------]]
--[[
    -- Example with Circles.lua (https://github.com/SneakySquid/Circles)

    spoly.DrawCircle = spoly.Generate('circle', function(w, h)
        local x0, y0 = w * .5, h * .5
        local radius = h * .5
        local circle = Circles.New(CIRCLE_FILLED, radius, x0, y0)

        circle()
    end)

    spoly.DrawOutlinedCircle = spoly.Generate('circle_outline_256', function(w, h)
        local x0, y0 = w * .5, h * .5
        local radius = h * .5
        local thickness = 256
        local circle = Circles.New(CIRCLE_OUTLINED, radius, x0, y0, thickness)

        circle()
    end)

    hook.Add('HUDPaint', 'Test', function()
        surface.SetDrawColor(color_white)

        local y = 512
        local x = 512
        local space = ScreenScale(1)

        local amount = 8
        local multiplier = 16
        local maxSize = multiplier * amount

        for i = 1, amount do
            local size = multiplier * i

            spoly.DrawOutlinedCircle(x, y + maxSize * .5 - size * .5, size, size)

            x = x + size + space
        end

        y = y + maxSize + (space * 10)
        x = 512

        for i = 1, amount do
            local size = multiplier * i

            spoly.DrawCircle(x, y + maxSize * .5 - size * .5, size, size)

            x = x + size + space
        end
    end)
]]
--PATH addons/111mod/lua/autorun/sh_volume3d.lua:

-- Makes audio seem like it is coming from a 3D source.
--    For BASS the native '3d' option is used
--    For HTML 3d volume is simulated manually
--
-- To use, pass "use3D = true" in 'opts' to service:load(url, opts)
-- You also need to pass either a 'pos3D' or 'ent3D' in opts
--    'pos3D = Vector(0, 0, 0)' - a static position
--    'ent3D = Entity(12)'      - a dynamically updating position (ent:GetPos() is used)
--                                if entity is removed, the mediaclip will also be removed
--
-- You can optionally pass 'fadeMax3D = 1000' to set the maximum fade distance

local function startBASSThink(clip)
	if clip.fadeMax3D then
		clip.chan:Set3DFadeDistance(0, clip.fadeMax3D)
	end

	if clip.pos3D then
		clip.chan:SetPos(clip.pos3D)
	elseif clip.ent3D then
		local hookId = "MediaLib.3DThink." .. clip:hashCode()
		hook.Add("Think", hookId, function()
			-- Stop hook if chan is invalid
			if not clip:isValid() then
				hook.Remove("Think", hookId)
				return
			end

			-- Stop media if entity is invalid
			if not IsValid(clip.ent3D) then
				clip:stop()
				return
			end

			-- Update pos
			clip.chan:SetPos(clip.ent3D:GetPos())
		end)
	end
end

local cvar_debugobs = CreateConVar("medialib_vol3d_debugobstacle", "0")

local trQuery, trResult = {}, {}
trQuery.output = trResult
trQuery.mask = MASK_SOLID_BRUSHONLY
local function getObstacleMultiplier(pos)
	local eyepos = LocalPlayer():EyePos()
	local debug = cvar_debugobs:GetBool()

	local normal = (eyepos - pos):GetNormalized()
	local crs_right = normal:Cross(Vector(0, 0, 1))
	local crs_up = -normal:Cross(crs_right)

	--debugoverlay.Line(pos, pos+crs_right*100, 0.1, Color(0, 255, 0))
	--debugoverlay.Line(pos, pos+crs_up*100, 0.1, Color(255, 0, 0))

	local traces = 8
	local hitWall = 0

	local circleRadius = 20

	for i=1, traces do
		local rad = math.pi*2 * (i/traces)

		local start = pos + math.cos(rad)*circleRadius*crs_right + math.sin(rad)*circleRadius*crs_up
		trQuery.start = start
		trQuery.endpos = eyepos
		local tr = util.TraceLine(trQuery)

		if tr.Hit then hitWall = hitWall+1 end

		if debug then debugoverlay.Line(start, eyepos, 0.1, tr.Hit and Color(255, 0, 0) or Color(255, 127, 0)) end
	end

	local frac = hitWall/traces

	return math.Remap(1 - frac, 0, 1, 0.3, 1), frac == 1 and 1.2 or 1
end

local function startHTMLThink(clip)
	local hookId = "MediaLib.3DThink." .. clip:hashCode()
	hook.Add("Think", hookId, function()
		-- Stop hook if chan is invalid
		if not clip:isValid() then
			hook.Remove("Think", hookId)
			return
		end

		local pos
		if clip.pos3D then
			pos = clip.pos3D
		elseif clip.ent3D then
			-- Stop media if entity is invalid
			if not IsValid(clip.ent3D) then
				clip:stop()
				return
			end
			pos = clip.ent3D:GetPos()
		end

		if not pos then return end

		local eyep = LocalPlayer():EyePos()
		local dist = eyep:Distance(pos)

		local fadeMax = clip.fadeMax3D or 1024
		local fadeFrac = (dist / fadeMax)

		local vol = 0
		if fadeFrac < 1 then
			local obsVolMul, obsFadeMul = getObstacleMultiplier(pos)

			if clip.attenuationType == "linear" then
				vol = (1 - fadeFrac)
			else
				vol = 1/((fadeFrac+1)^7)
			end

			vol = vol * obsVolMul
			vol = math.Clamp(vol, 0, 1)
		end

		-- Set the internal volume so that users can still set relative volume
		clip.internalVolume = math.Approach(clip.internalVolume or 0, vol, FrameTime() * 2)
		clip:applyVolume()
	end)
end

local function startThink(clip)
	if clip:getBaseService() == "bass" then
		startBASSThink(clip)
	elseif clip:getBaseService() == "html" then
		startHTMLThink(clip)
	end
end

hook.Add("Medialib_ProcessOpts", "Medialib_Volume3d", function(media, opts)
	if not opts.use3D then return end

	media.is3D = true

	if media:getBaseService() == "bass" then
		table.insert(media.bassPlayOptions, "3d")
	end

	function media:set3DPos(pos)
		self.pos3D = pos
		self.ent3D = nil
	end
	function media:set3DEnt(ent)
		self.pos3D = nil
		self.ent3D = ent
	end
	function media:set3DFadeMax(fademax)
		self.fadeMax3D = fademax
		if IsValid(self.chan) and self:getBaseService() == "bass" then
			self.chan:Set3DFadeDistance(0, fademax)
		end
	end
	function media:set3DAttenuationType(type)
		self.attenuationType = type
	end

	if opts.pos3D then media:set3DPos(opts.pos3D) end
	if opts.ent3D then media:set3DEnt(opts.ent3D) end
	if opts.attenuationType then media:set3DAttenuationType(opts.attenuationType) end

	media:runCommand(function()
		startThink(media)
	end)
end)

--PATH addons/dermaf4/lua/ui/controls/listview.lua:
local PANEL = {}

Derma_Hook(PANEL, 'Paint', 'Paint', 'UIListView')

function PANEL:Init()
	self.Rows = {}
	self.SearchResults = {}
	self.HideInvisible = true
	self.RowHeight = 25
	self:SetPadding(-1)
end

function PANEL:SetRowHeight(height)
	self.RowHeight = height
end

function PANEL:AddCustomRow(row, disabled)
	self:AddItem(row)

	self.Rows[#self.Rows + 1] = row
	self.SearchResults[#self.SearchResults + 1] = row

	return row
end

function PANEL:AddRow(value, disabled)
	local row = ui.Create('DButton', function(s)
		s:SetText(tostring(value))
		s:SetTall(self.RowHeight)
		if (disabled == true) then
			s:SetDisabled(true)
		end
	end)

	self:AddItem(row)

	self.Rows[#self.Rows + 1] = row
	self.SearchResults[#self.SearchResults + 1] = row

	row.DoClick = function()
		row.Active = true
		if IsValid(self.Selected) then
			self.Selected.Active = false
		end
		self.Selected = row
	end
	return row
end

function PANEL:AddPlayer(pl, steamid64)
	local btn = ui.Create('ui_playerbutton', function(self, p)
		if isplayer(pl) then
			self:SetPlayer(pl)
		else
			self:SetInfo(pl, steamid64)
		end
	end)

	self.Rows[#self.Rows + 1] = btn

	btn.DoClick = function()
		btn.Active = true
		if IsValid(self.Selected) then
			self.Selected.Active = false
		end
		self.Selected = btn
	end

	self:AddItem(btn)
	return btn
end

function PANEL:AddSpacer(value)
	return self:AddRow(value, true)
end

function PANEL:GetSelected()
	return self.Selected
end

function PANEL:Search(value)
	self.SearchResults = {}

	if (not value) or (value == '') then
		for k, v in ipairs(self.Rows) do
			if IsValid(v) then
				v:SetVisible(true)

				self.SearchResults[#self.SearchResults + 1] = v
			end
		end

		if IsValid(self.NoResultsSpacer) then
			self.NoResultsSpacer:Remove()
		end

		self:PerformLayout()
	else
		local c = 0
		for k, v in ipairs(self.Rows) do
			if (not IsValid(v)) then continue end

			if self:FilterSearchResult(v, value) then
				c = c + 1
				v:SetVisible(true)

				self.SearchResults[#self.SearchResults + 1] = v
			else
				v:SetVisible(false)
			end
		end

		if (c == 0) then
			if IsValid(self.NoResultsSpacer) then
				self.NoResultsSpacer:SetVisible(true)
			else
				self.NoResultsSpacer = self:AddSpacer(self.NoResultsMessage or 'No results found!')
			end

		elseif IsValid(self.NoResultsSpacer) then
			self.NoResultsSpacer:SetVisible(false)
		end

		self:PerformLayout()
	end
end

function PANEL:SetNoResultsMessage(msg)
	self.NoResultsMessage = msg
end

function PANEL:GetSearchResults()
	return self.SearchResults
end

function PANEL:FilterSearchResult(row, value)
	return (string.find(row:GetText():lower(), value:lower(), 1, true) ~= nil)
end

vgui.Register('ui_listview', PANEL, 'ui_scrollpanel')
--PATH addons/_adminmodules/lua/ulib/shared/util.lua:
--[[
	Title: Utilities

	Some utility functions. Unlike the functions in misc.lua, this file only holds HL2 specific functions.
]]

local dataFolder = "data"
--[[
	Function: fileExists

	Checks for the existence of a file by path.

	Parameters:

		f - The path to check, rooted at the garry's mod root directory.
		noMount - *(Optional)* If true, will not look in mounted directories.

	Returns:

		True if the file exists, false otherwise.

	Revisions:

		v2.51 - Initial revision (tired of Garry changing his API all the time).
		v2.70 - Added noMount parameter to *only* look in mod directory.
]]
function ULib.fileExists( f, noMount )
	if noMount then return file.Exists( f, "MOD" ) end

	local isDataFolder = f:lower():sub( 1, dataFolder:len() ) ~= dataFolder
	fWoData = f:sub( dataFolder:len() + 2 ) -- +2 removes path seperator

	return file.Exists( f, "GAME" ) or (isDataFolder and file.Exists( fWoData, "DATA" ))
end

--[[
	Function: fileRead

	Reads a file and returns the contents. This function is not very forgiving on providing oddly formatted filepaths.

	Parameters:

		f - The file to read, rooted at the garrysmod directory.
		noMount - *(Optional)* If true, will not look in mounted directories.

	Returns:

		The file contents or nil if the file does not exist.

	Revisions:

		v2.51 - Initial revision (tired of Garry changing his API all the time).
		v2.70 - Added noMount parameter to *only* look in mod directory.
]]
function ULib.fileRead( f, noMount )
	local existsWoMount = ULib.fileExists( f, true )

	if noMount then
		if not existsWoMount then
			return nil
		end

		return file.Read( f, "MOD" )
	end

	local isDataFolder = f:lower():sub( 1, dataFolder:len() ) == dataFolder
	fWoData = f:sub( dataFolder:len() + 2 ) -- +2 removes path seperator

	if not existsWoMount and not ULib.fileExists( f ) then
		return nil
	end

	if not isDataFolder then
		return file.Read( f, "GAME" )
	else
		-- We want to prefer any data files at the root, but allow for mounted directories
		if existsWoMount then
			return file.Read( fWoData, "DATA" )
		else
			return file.Read( f, "GAME" )
		end
	end
end

--[[
	Function: fileWrite

	Writes file content.

	Parameters:

		f - The file path to write to, rooted at the garrysmod directory.
		content - The content to write.

	Revisions:

		v2.51 - Initial revision (tired of Garry changing his API all the time).
]]
function ULib.fileWrite( f, content )
	local isDataFolder = f:lower():sub( 1, dataFolder:len() ) == dataFolder
	fWoData = f:sub( dataFolder:len() + 2 ) -- +2 removes path seperator

	if not isDataFolder then return nil end

	file.Write( fWoData, content )
end


--[[
	Function: fileAppend

	Append to file content.

	Parameters:

		f - The file path to append to, rooted at the garrysmod directory.
		content - The content to append.

	Revisions:

		v2.51 - Initial revision (tired of Garry changing his API all the time).
]]
function ULib.fileAppend( f, content )
	local isDataFolder = f:lower():sub( 1, dataFolder:len() ) == dataFolder
	fWoData = f:sub( dataFolder:len() + 2 ) -- +2 removes path seperator

	if not isDataFolder then return nil end

	file.Append( fWoData, content )
end


--[[
	Function: fileCreateDir

	Create a directory.

	Parameters:

		f - The directory path to create, rooted at the garrysmod directory.

	Revisions:

		v2.51 - Initial revision (tired of Garry changing his API all the time).
]]
function ULib.fileCreateDir( f )
	local isDataFolder = f:lower():sub( 1, dataFolder:len() ) == dataFolder
	fWoData = f:sub( dataFolder:len() + 2 ) -- +2 removes path seperator

	if not isDataFolder then return nil end

	file.CreateDir( fWoData )
end


--[[
	Function: fileDelete

	Delete file contents.

	Parameters:

		f - The file path to delete, rooted at the garrysmod directory.

	Revisions:

		v2.51 - Initial revision (tired of Garry changing his API all the time).
]]
function ULib.fileDelete( f )
	local isDataFolder = f:lower():sub( 1, dataFolder:len() ) == dataFolder
	fWoData = f:sub( dataFolder:len() + 2 ) -- +2 removes path seperator

	if not isDataFolder then return nil end

	file.Delete( fWoData )
end


--[[
	Function: fileIsDir

	Is file a directory?

	Parameters:

		f - The file path to check, rooted at the garrysmod directory.
		noMount - *(Optional)* If true, will not look in mounted directories.

	Returns:

		True if dir, false otherwise.

	Revisions:

		v2.51 - Initial revision (tired of Garry changing his API all the time).
		v2.70 - Added noMount parameter to *only* look in mod directory.
]]
function ULib.fileIsDir( f, noMount )
	if not noMount then
		return file.IsDir( f, "GAME" )
	else
		return file.IsDir( f, "MOD" )
	end
end


--[[
	Function: execFile

	Executes a file on the console. Use this instead of the "exec" command when the config lies outside the cfg folder.

	Parameters:

		f - The file, relative to the garrysmod folder.
		queueName - The queue name to ULib.namedQueueFunctionCall to use.
		noMount - *(Optional)* If true, will not look in mounted directories.

	Revisions:

		v2.40 - No longer strips comments, removed ability to execute on players.
		v2.50 - Added option to conform to Garry's API changes and queueName to specify queue name to use.
		v2.51 - Removed option parameter.
		v2.70 - Added noMount parameter to *only* look in mod directory.
]]
function ULib.execFile( f, queueName, noMount )
	if not ULib.fileExists( f, noMount ) then
		ULib.error( "Called execFile with invalid file! " .. f )
		return
	end

	ULib.execString( ULib.fileRead( f, noMount ), queueName )
end


--[[
	Function: execString

	Just like <execFile>, except acts on newline-delimited strings.

	Parameters:

		f - The string.
		queueName - The queue name to ULib.namedQueueFunctionCall to use.

	Revisions:

		v2.40 - Initial.
		v2.50 - Added queueName to specify queue name to use. Removed ability to execute on players.
]]
function ULib.execString( f, queueName )
	local lines = string.Explode( "\n", f )

	local buffer = ""
	local buffer_lines = 0
	local exec = "exec "
	for _, line in ipairs( lines ) do
		line = string.Trim( line )
		if line:lower():sub( 1, exec:len() ) == exec then
			local dummy, dummy, cfg = line:lower():find( "^exec%s+([%w%.]+)%s*/?/?.*$")
			if not cfg:find( ".cfg", 1, true ) then cfg = cfg .. ".cfg" end -- Add it if it's not there
			ULib.execFile( "cfg/" .. cfg, queueName )
		elseif line ~= "" then
			buffer = buffer .. line .. "\n"
			buffer_lines = buffer_lines + 1

			if buffer_lines >= 10 then
				ULib.namedQueueFunctionCall( queueName, ULib.consoleCommand, buffer )
				buffer_lines = 0
				buffer = ""
			end
		end
	end

	if buffer_lines > 0 then
		ULib.namedQueueFunctionCall( queueName, ULib.consoleCommand, buffer )
	end
end


--[[
	Function: execFileULib

	Just like <execFile>, except only for ULib-defined commands. It avoids the source engine
	command queue, and has an additional option to only execute commands marked as "safe" (up to the
	command author to properly define these).

	Parameters:

		f - The file, relative to the garrysmod folder.
		safeMode - If set to true, does not run "unsafe" commands.
		noMount - *(Optional)* If true, will not look in mounted directories.

	Revisions:

		v2.62 - Initial.
]]
function ULib.execFileULib( f, safeMode, noMount )
	if not ULib.fileExists( f, noMount ) then
		ULib.error( "Called execFileULib with invalid file! " .. f )
		return
	end

	ULib.execStringULib( ULib.fileRead( f, noMount ), safeMode )
end


--[[
	Function: execStringULib

	Just like <execString>, except only for ULib-defined commands. It avoids the source engine
	command queue, and has an additional option to only execute commands marked as "safe" (up to the
	command author to properly define these).

	Parameters:

		f - The string.
		safeMode - If set to true, does not run "unsafe" commands.

	Revisions:

		v2.62 - Initial.
]]
function ULib.execStringULib( f, safeMode )
	local lines = string.Explode( "\n", f )
	local srvPly = Entity( -1 ) -- Emulate the console callback object

	for _, line in ipairs( lines ) do
		line = string.Trim( line )
		if line ~= "" then
			local argv = ULib.splitArgs( line )
			local commandName = table.remove( argv, 1 )
			local cmdTable, commandName, argv = ULib.cmds.getCommandTableAndArgv( commandName, argv )

			if not cmdTable then
				Msg( "Error executing " .. tostring( commandName ) .. "\n" )
			elseif cmdTable.__unsafe then
				Msg( "Not executing unsafe command " .. commandName .. "\n" )
			else
				ULib.cmds.execute( cmdTable, srvPly, commandName, argv )
			end
		end
	end
end


--[[
	Function: serialize

	Serializes a variable. It basically converts a variable into a runnable code string. It works correctly with inline tables.

	Parameters:

		v - The variable you wish to serialize

	Returns:

		The string of the serialized variable

	Revisions:

		v2.40 - Can now serialize entities and players
]]
function ULib.serialize( v )
	local t = type( v )
	local str
	if t == "string" then
		str = string.format( "%q", v )
	elseif t == "boolean" or t == "number" then
		str = tostring( v )
	elseif t == "table" then
		str = table.ToString( v )
	elseif t == "Vector" then
		str = "Vector(" .. v.x .. "," .. v.y .. "," .. v.z .. ")"
	elseif t == "Angle" then
		str = "Angle(" .. v.pitch .. "," .. v.yaw .. "," .. v.roll .. ")"
	elseif t == "Player" then
		str = tostring( v )
	elseif t == "Entity" then
		str = tostring( v )
	elseif t == "nil" then
		str = "nil"
	else
		ULib.error( "Passed an invalid parameter to serialize! (type: " .. t .. ")" )
		return
	end
	return str
end


--[[
	Function: isSandbox

	Returns true if the current gamemode is sandbox or is derived from sandbox.
]]
function ULib.isSandbox()
	return GAMEMODE.IsSandboxDerived
end


local function insertResult( files, result, relDir )
	if not relDir then
		table.insert( files, result )
	else
		table.insert( files, relDir .. "/" .. result )
	end
end

--[[
	Function: filesInDir

	Returns files in directory.

	Parameters:

		dir - The dir to look for files in.
		recurse - *(Optional, defaults to false)* If true, searches directories recursively.
		noMount - *(Optional)* If true, will not look in mounted directories.
		root - *INTERNAL USE ONLY* This helps with recursive functions.

	Revisions:

		v2.10 - Initial (But dragged over from GM9 archive).
		v2.40 - Fixed (was completely broken).
		v2.50 - Now assumes paths relative to base folder.
		v2.60 - Fix for Garry API-changes
		v2.70 - Added noMount parameter to *only* look in mod directory.
]]
function ULib.filesInDir( dir, recurse, noMount, root )
	if not ULib.fileIsDir( dir ) then
		return nil
	end

	local files = {}
	local relDir
	if root then
		relDir = dir:gsub( root .. "[\\/]", "" )
	end
	root = root or dir

	local resultFiles, resultFolders = file.Find( dir .. "/*", not noMount and "GAME" or "MOD" )

	for i=1, #resultFiles do
		insertResult( files, resultFiles[ i ], relDir )
	end

	for i=1, #resultFolders do
		if recurse then
			files = table.Add( files, ULib.filesInDir( dir .. "/" .. resultFolders[ i ], recurse, noMount, root ) )
		else
			insertResult( files, resultFolders[ i ], relDir )
		end
	end

	return files
end


-- Helper function for <queueFunctionCall()>
local stacks = {}
local function onThink()
	local remove = true
	for queueName, stack in pairs( stacks ) do
		local num = #stack
		if num > 0 then
			remove = false
			local b, e = pcall( stack[ 1 ].fn, unpack( stack[ 1 ], 1, stack[ 1 ].n ) )
			if not b then
				ErrorNoHalt( "ULib queue error: " .. tostring( e ) .. "\n" )
			end
			table.remove( stack, 1 ) -- Remove the first inserted item. This is FIFO
		end
	end

	if remove then
		hook.Remove( "Think", "ULibQueueThink" )
	end
end


--[[
	Function: queueFunctionCall

	Adds a function call to the queue to be called. Guaranteed to be called sometime after the current frame. Very handy
	when you need to delay a call for some reason. Uses a think hook, but it's only hooked when there's stuff in the queue.

	Parameters:

		fn - The function to call
		... - *(Optional)* The parameters to pass to the function

	Revisions:

		v2.40 - Initial (But dragged over from UPS).
]]
function ULib.queueFunctionCall( fn, ... )
	if type( fn ) ~= "function" then
		error( "queueFunctionCall received a bad function", 2 )
		return
	end

	ULib.namedQueueFunctionCall( "defaultQueueName", fn, ... )
end

--[[
	Function: namedQueueFunctionCall

	Exactly like <queueFunctionCall()>, but allows for separately running queues to exist.

	Parameters:

		queueName - The unique name of the queue (the queue group)
		fn - The function to call
		... - *(Optional)* The parameters to pass to the function

	Revisions:

		v2.50 - Initial.
]]
function ULib.namedQueueFunctionCall( queueName, fn, ... )
	queueName = queueName or "defaultQueueName"
	if type( fn ) ~= "function" then
		error( "queueFunctionCall received a bad function", 2 )
		return
	end

	stacks[ queueName ] = stacks[ queueName ] or {}
	table.insert( stacks[ queueName ], { fn=fn, n=select( "#", ... ), ... } )
	hook.Add( "Think", "ULibQueueThink", onThink, HOOK_MONITOR_HIGH )
end


--[[
	Function: backupFile

	Copies a file to a backup file. If a backup file already exists, makes incrementing numbered backup files.

	Parameters:

		f - The file to backup, rooted in the garrysmod directory.

	Returns:

		The pathname of the file it was backed up to.

	Revisions:

		v2.40 - Initial.
]]
function ULib.backupFile( f )
	local contents = ULib.fileRead( f )
	local filename = f:GetFileFromFilename():sub( 1, -5 ) -- Remove '.txt'
	local folder = f:GetPathFromFilename()

	local num = 1
	local targetPath = folder .. filename .. "_backup.txt"
	while ULib.fileExists( targetPath ) do
		num = num + 1
		targetPath = folder .. filename .. "_backup" .. num .. ".txt"
	end

	-- We now have a filename that doesn't yet exist!
	ULib.fileWrite( targetPath, contents )

	return targetPath
end

--[[
	Function: nameCheck

	Calls all ULibPlayerNameChanged hooks if a player changes their name.

	Revisions:

		2.20 - Initial
]]
function ULib.nameCheck( data )
	hook.Call( ULib.HOOK_PLAYER_NAME_CHANGED, nil, Player(data.userid), data.oldname, data.newname )
end
gameevent.Listen( "player_changename" )
hook.Add( "player_changename", "ULibNameCheck", ULib.nameCheck )

--[[
	Function: getPlyByUID

	Parameters:

		uid - The uid to lookup.

	Returns:

		The player that has the specified unique id, nil if none exists.

	Revisions:

		v2.40 - Initial.
]]
function ULib.getPlyByUID( uid )
	local players = player.GetAll()
	for _, ply in ipairs( players ) do
		if ply:UniqueID() == uid then
			return ply
		end
	end

	return nil
end


--[[
	Function: pcallError

	An adaptation of a function that used to exist before GM13, allows you to
	call functions safely and print errors (if it errors).

	Parameters:

		... - Arguments to pass to the function

	Returns:

		The same thing regular pcall returns

	Revisions:

		v2.50 - Initial.
]]
function ULib.pcallError( ... )
	local returns = { pcall( ... ) }

	if not returns[ 1 ] then -- The status flag
		ErrorNoHalt( returns[ 2 ] ) -- The error message
	end

	return unpack( returns )
end

--PATH addons/_adminmodules/lua/ulib/shared/commands.lua:
--[[
	File: Commands
]]

ULib.cmds = ULib.cmds or {}
local cmds = ULib.cmds -- To save my fingers

--[[
	Variable: cmds.optional

	This is used when specifying an argument to flag the argument as optional.
]]
cmds.optional = cmds.optional or {} -- This is just a key, ignore the fact that it's a table.

--[[
	Variable: cmds.restrictToCompletes

	This is used when specifying a string argument to flag that only what was
	specified for autocomplete is allowed to be passed as a valid argument.
]]
cmds.restrictToCompletes = cmds.restrictToCompletes or {} -- Key

--[[
	Variable: cmds.takeRestOfLine

	This is used when specifying a string argument to flag that this argument
	should use up any remaining args, whether quoted as one arg or not. This
	is useful for things like specifying a ban reason where you don't want to
	force users to write an entire sentence within quotes.
]]
cmds.takeRestOfLine = cmds.takeRestOfLine or {} -- Key

--[[
	Variable: cmds.round

	This is used when specifying a number argument to flag the argument to round
	the number to the nearest integer.
]]
cmds.round = cmds.round or {} -- Key

--[[
	Variable: cmds.ignoreCanTarget

	This is used when specifying a command that should ignore the can_target
	property in the groups config. IE, private say in ULX uses this so that
	users can target admins to chat with them.
]]
cmds.ignoreCanTarget = cmds.ignoreCanTarget or {} -- Key

--[[
	Variable: cmds.allowTimeString

	This is used when specyfing a number argument that should allow time string
	representations to be parsed (eg, '1w1d' for 1 week 1 day).
]]
cmds.allowTimeString = cmds.allowTimeString or {} -- Key


--[[
	Class: cmds.BaseArg

	Just defines the basics for us, used in autocomplete and command callbacks.
	These default implementations just throw an error if called. You shouldn't
	need any great knowledge about the functions in these types, just that
	they exist and how to pass in restrictions.

	Revisions:

		2.40 - Initial
]]
cmds.BaseArg = inheritsFrom( nil )


--[[
	Function: cmds.BaseArg:parseAndValidate

	Used to, you guessed it, parse and validate an argument specified by a user.
	Takes user command line input and converts it to a regular lua variable of
	the correct type.

	Parameters:

		ply - The player using the command. Useful for querying.
		arg - The arg to parse. It's already properly trimmed.
		cmdInfo - A table containing data about this command.
		plyRestrictions - The restrictions from the access tag for this player.

	Returns:

		The parsed arg correctly typed if it validated, false and an
		explanation otherwise.
]]
function cmds.BaseArg:parseAndValidate( ply, arg, cmdInfo, plyRestrictions )
	error( "Unimplemented BaseArg:parseAndValidate called" )
end


--[[
	Function: cmds.BaseArg:complete

	Used to autocomplete a command. Passes back the options the player has in
	using this command.

	Parameters:

		arg - The arg to parse. It's already properly trimmed.
		cmdInfo - A table containing data about this command.
		plyRestrictions - The restrictions from the access tag for this player.

	Returns:

		A table of strings containing the options that are available.
]]
function cmds.BaseArg:complete( arg, cmdInfo, plyRestrictions )
	error( "Unimplemented BaseArg:complete called" )
end


--[[
	Function: cmds.BaseArg:usage

	Prints a basic usage message for this parameter.

	Parameters:

		cmdInfo - A table containing data about this command.
		plyRestrictions - The restrictions from the access tag for this player.

	Returns:

		A string describing what this parameter is and how to use it.
]]
function cmds.BaseArg:usage( cmdInfo, plyRestrictions )
	error( "Unimplemented BaseArg:usage called" )
end


--[[
	Class: cmds.NumArg

	A number arg, inherits from <cmds.BaseArg>. Restrictions can include a numeric
	value for keys 'min', 'max', and 'default'. All do what you think they do.
	If the argument is optional and no default is specified, 0 is used for
	default. You can specify the allowTimeString key to allow time string
	representations. Lastly, you can specify a value for the key 'hint' for a
	hint on	what this argument is for, IE "damage".

	Example:

		The following code creates a command that accepts an optional numeric
		second argument that defaults to 0 and has to be at least 0.

:cmd = ULib.cmds.TranslateCommand( "ugm slap", ULib.slap )
:cmd:addParam{ type=ULib.cmds.PlayerArg, target="*", default="^", ULib.cmds.optional }
:cmd:addParam{ type=ULib.cmds.NumArg, min=0, default=0, ULib.cmds.optional }

	Revisions:

		2.40 - Initial
]]
cmds.NumArg = inheritsFrom( cmds.BaseArg )


--[[
	Function: cmds.NumArg:processRestrictions

	A helper function to help us figure out restrictions on this command.
]]
function cmds.NumArg:processRestrictions( cmdRestrictions, plyRestrictions )
	-- First, reset
	self.min = nil
	self.max = nil

	local allowTimeString = table.HasValue( cmdRestrictions, cmds.allowTimeString )

	if plyRestrictions then -- Access tag restriction
		if not plyRestrictions:find( ":" ) then -- Assume they only want one number here
			self.min = plyRestrictions
			self.max = plyRestrictions
		else
			local timeStringMatcher = "[-hdwy%d]*"
			dummy, dummy, self.min, self.max = plyRestrictions:find( "^(" .. timeStringMatcher .. "):(" .. timeStringMatcher .. ")$" )
		end

		if not allowTimeString then
			self.min = tonumber( self.min )
			self.max = tonumber( self.max )
		else
			self.min = ULib.stringTimeToMinutes( self.min )
			self.max = ULib.stringTimeToMinutes( self.max )
		end
	end

	if allowTimeString and not self.timeStringsParsed then
		self.timeStringsParsed = true
		cmdRestrictions.min = ULib.stringTimeToMinutes( cmdRestrictions.min )
		cmdRestrictions.max = ULib.stringTimeToMinutes( cmdRestrictions.max )
		cmdRestrictions.default = ULib.stringTimeToMinutes( cmdRestrictions.default )
	end

	if cmdRestrictions.min and (not self.min or self.min < cmdRestrictions.min) then
		self.min = cmdRestrictions.min
	end

	if cmdRestrictions.max and (not self.max or self.max > cmdRestrictions.max) then
		self.max = cmdRestrictions.max
	end
end


--[[
	Function: cmds.NumArg:parseAndValidate

	See <cmds.BaseArg:parseAndValidate>
]]
function cmds.NumArg:parseAndValidate( ply, arg, cmdInfo, plyRestrictions )
	self:processRestrictions( cmdInfo, plyRestrictions )

	if not arg and self.min and self.min == self.max then -- Arg's not valid, min is, and it's equal to max
		return self.min
	end

	if not arg and table.HasValue( cmdInfo, cmds.optional ) then
		arg = cmdInfo.default or 0 -- Set it, needs to go through our process
	end

	local allowTimeString = table.HasValue( cmdInfo, cmds.allowTimeString )
	local num -- We check if it's nil after we see if a default has been provided for them
	if not allowTimeString then
		num = tonumber( arg )
	else
		num = ULib.stringTimeToMinutes( arg )
	end

	local typeString
	if not allowTimeString then
		typeString = "number"
	else
		typeString = "number or time string"
	end

	if not num then
		return nil, string.format( "invalid " .. typeString .. " \"%s\" specified", tostring( arg ) )
	end

	if self.min and num < self.min then
		return nil, string.format( "specified " .. typeString .. " (%s) was below your allowed minimum value of %g", arg, self.min )
	end

	if self.max and num > self.max then
		return nil, string.format( "specified " .. typeString .. " (%s) was above your allowed maximum value of %g", arg, self.max )
	end

	if table.HasValue( cmdInfo, cmds.round ) then
		return math.Round( num )
	end
	return num
end


--[[
	Function: cmds.NumArg:complete

	See <cmds.BaseArg:complete>
]]
function cmds.NumArg:complete( ply, arg, cmdInfo, plyRestrictions )
	return { self:usage( cmdInfo, plyRestrictions ) }
end


--[[
	Function: cmds.NumArg:usage

	See <cmds.BaseArg:usage>
]]
function cmds.NumArg:usage( cmdInfo, plyRestrictions )
	self:processRestrictions( cmdInfo, plyRestrictions )
	local isOptional = table.HasValue( cmdInfo, cmds.optional )

	local str = cmdInfo.hint or "number"

	if self.min == self.max and self.min then -- Equal but not nil
		return "<" .. str .. ": " .. self.min .. ">"
	else
		str = "<" .. str
		if self.min or self.max or cmdInfo.default or isOptional then
			str = str .. ": "
		end
		if self.min then
			str = str .. self.min .. "<="
		end
		if self.min or self.max then
			str = str .. "x"
		end
		if self.max then
			str = str .. "<=" .. self.max
		end
		if cmdInfo.default or isOptional then
			if self.min or self.max then
					str = str .. ", "
			end
			str = str .. "default " .. (cmdInfo.default or 0)
		end
		str = str .. ">"

		if isOptional then
			str = "[" .. str .. "]"
		end
		return str
	end
end


--[[
	Class: cmds.BoolArg

	A boolean arg, inherits from <cmds.BaseArg>. You can specify a value for the key
	'hint' for a hint on what this argument is for, IE "revoke access".

	Example:

		The following code creates a command that accepts an option boolean
		third argument that defaults to false.

:local groupallow = ULib.cmds.TranslateCommand( "ulx groupallow", ulx.groupallow )
:groupallow:addParam{ type=ULib.cmds.StringArg }
:groupallow:addParam{ type=ULib.cmds.StringArg }
:groupallow:addParam{ type=ULib.cmds.BoolArg, hint="revoke access", ULib.cmds.optional }

	Revisions:

		2.40 - Initial
]]
cmds.BoolArg = inheritsFrom( cmds.BaseArg )


--[[
	Function: cmds.BoolArg:processRestrictions

	A helper function to help us figure out restrictions on this command.
]]
function cmds.BoolArg:processRestrictions( cmdRestrictions, plyRestrictions )
	-- First, reset
	self.restrictedTo = nil

	if plyRestrictions and plyRestrictions ~= "*" then -- Access tag restriction
		self.restrictedTo = ULib.toBool( plyRestrictions )
	end

	-- There'd be no point in having command-level restrictions on this, so nothing is implemented for it.
end


--[[
	Function: cmds.BoolArg:parseAndValidate

	See <cmds.BaseArg:parseAndValidate>
]]
function cmds.BoolArg:parseAndValidate( ply, arg, cmdInfo, plyRestrictions )
	self:processRestrictions( cmdInfo, plyRestrictions )

	if not arg and table.HasValue( cmdInfo, cmds.optional ) then
		-- Yah, I know this following statement could be 'false or false', but it's still false.
		arg = cmdInfo.default or false -- Set it, needs to go through our process
	end

	local desired = ULib.toBool( arg )

	if self.restrictedTo ~= nil and desired ~= self.restrictedTo then
		return nil, "you are not allowed to specify " .. tostring( desired ) .. " here"
	end

	return desired
end


--[[
	Function: cmds.BoolArg:complete

	See <cmds.BaseArg:complete>
]]
function cmds.BoolArg:complete( ply, arg, cmdInfo, plyRestrictions )
	self:processRestrictions( cmdInfo, plyRestrictions )
	local ret = { self:usage( cmdInfo, plyRestrictions ) }

	if not self.restrictedTo then
		table.insert( ret, "0" )
	end

	if self.restrictedTo ~= false then
		table.insert( ret, "1" )
	end

	return ret
end


--[[
	Function: cmds.BoolArg:usage

	See <cmds.BaseArg:usage>
]]
function cmds.BoolArg:usage( cmdInfo, plyRestrictions )
	self:processRestrictions( cmdInfo, plyRestrictions )
	local isOptional = table.HasValue( cmdInfo, cmds.optional )

	local str = "<"
	if cmdInfo.hint then
		str = str .. cmdInfo.hint .. ": "
	end

	if self.restrictedTo ~= nil then
		str = str .. (self.restrictedTo and "1>" or "0>")
	else
		str = str .. "0/1>"
	end

	if isOptional then
		str = "[" .. str .. "]"
	end

	return str
end


--[[
	Class: cmds.PlayerArg

	A player arg, inherits from <cmds.BaseArg>. Can be restricted by specifying a
	string in the key 'target'. This string is passed to <getUser()> with
	keywords enabled to get a list of players this user is allowed to target.

	Example:

		The following code creates a command that accepts an optional player
		argument that defaults to self and cannot be any superadmins.

:cmd = ULib.cmds.TranslateCommand( "ugm slap", ULib.slap )
:cmd:addParam{ type=ULib.cmds.PlayerArg, target="!%superadmin", default="^", ULib.cmds.optional }
:cmd:addParam{ type=ULib.cmds.NumArg, min=0, default=0, ULib.cmds.optional }


	Revisions:

		2.40 - Initial
]]
cmds.PlayerArg = inheritsFrom( cmds.BaseArg )


--[[
	Function: cmds.PlayerArg:processRestrictions

	A helper function to help us figure out restrictions on this command.
]]
function cmds.PlayerArg:processRestrictions( ply, cmdRestrictions, plyRestrictions )
	self.restrictedTargets = nil -- Reset
	cmds.PlayerArg.restrictedTargets = nil -- Because of inheritance, make sure this is reset too
	local ignore_can_target = false
	if plyRestrictions and plyRestrictions:sub( 1, 1 ) == "$" then
		plyRestrictions = plyRestrictions:sub( 2 )
		ignore_can_target = true
	end

	if cmdRestrictions.target then
		-- Realize it can be false after this, meaning they can target no-one connected.
		self.restrictedTargets = ULib.getUsers( cmdRestrictions.target, true, ply )
	end

	if plyRestrictions and plyRestrictions ~= "" then -- Access tag restriction
		local restricted = ULib.getUsers( plyRestrictions, true, ply )
		if not restricted or not self.restrictedTargets then -- Easy, just set it
			self.restrictedTargets = restricted

		else -- Make a subset! We want to remove any values from self.restrictedTargets that aren't in restricted
			local i = 1
			while self.restrictedTargets[ i ] do
				if not table.HasValue( restricted, self.restrictedTargets[ i ] ) then
					table.remove( self.restrictedTargets, i )
				else
					i = i + 1
				end
			end
		end
	end

	if ply:IsValid() and not ignore_can_target and not table.HasValue( cmdRestrictions, cmds.ignoreCanTarget ) and ULib.ucl.getGroupCanTarget( ply:GetUserGroup() ) then -- can_target restriction
		local selfTarget = "$" .. ULib.getUniqueIDForPlayer( ply )
		local restricted = ULib.getUsers( ULib.ucl.getGroupCanTarget( ply:GetUserGroup() ) .. "," .. selfTarget, true, ply ) -- Allow self on top of restrictions
		if not restricted or not self.restrictedTargets then -- Easy, just set it
			self.restrictedTargets = restricted

		else -- Make a subset! We want to remove any values from self.restrictedTargets that aren't in restricted
			local i = 1
			while self.restrictedTargets[ i ] do
				if not table.HasValue( restricted, self.restrictedTargets[ i ] ) then
					table.remove( self.restrictedTargets, i )
				else
					i = i + 1
				end
			end
		end
	end
end


--[[
	Function: cmds.PlayerArg:parseAndValidate

	See <cmds.BaseArg:parseAndValidate>
]]
function cmds.PlayerArg:parseAndValidate( ply, arg, cmdInfo, plyRestrictions )
	self:processRestrictions( ply, cmdInfo, plyRestrictions )

	if not arg and table.HasValue( cmdInfo, cmds.optional ) then
		if not cmdInfo.default and not ply:IsValid() then
			return nil, "target must be specified"
		end

		arg = cmdInfo.default or "$" .. ULib.getUniqueIDForPlayer( ply ) -- Set it, needs to go through our process
	end

	local target, err_msg1 = ULib.getUser( arg, true, ply )

	local return_value, err_msg2 = hook.Call( ULib.HOOK_PLAYER_TARGET, _, ply, cmdInfo.cmd, target )
	if return_value == false then
 		return nil, err_msg2 or "you cannot target this person"
	elseif type( return_value ) == "Player" then
		target = return_value
	end
	
	if return_value ~= true then -- Go through our "normal" restriction process
		if not target then return nil, err_msg1 or "no target found" end
		if cmdInfo.cmd ~= 'ulx tmute' and cmdInfo.cmd ~= 'ulx tgag' and cmdInfo.cmd ~= 'ulx gban' then
			if self.restrictedTargets == false or (self.restrictedTargets and not table.HasValue( self.restrictedTargets, target )) then
				return nil, "you cannot target this person"
			end
		end
	end
	return target
end


--[[
	Function: cmds.PlayerArg:complete

	See <cmds.BaseArg:complete>
]]
function cmds.PlayerArg:complete( ply, arg, cmdInfo, plyRestrictions )
	self:processRestrictions( ply, cmdInfo, plyRestrictions )

	local targets
	if self.restrictedTargets == false then -- No one allowed
		targets = {}
	elseif arg == "" then
		targets = player.GetAll()
	else
		targets = ULib.getUsers( arg, true, ply )
		if not targets then targets = {} end -- No one found
	end

	if self.restrictedTargets then
		local i = 1
		while targets[ i ] do
			if not table.HasValue( self.restrictedTargets, targets[ i ] ) then
				table.remove( targets, i )
			else
				i = i + 1
			end
		end
	end

	local names = {}
	for _, ply in ipairs( targets ) do
		table.insert( names, string.format( '"%s"', ply:Nick() ) )
	end
	table.sort( names )

	if #names == 0 then
		return { self:usage( cmdInfo, plyRestrictions ) }
	end

	return names
end


--[[
	Function: cmds.PlayerArg:usage

	See <cmds.BaseArg:usage>
]]
function cmds.PlayerArg:usage( cmdInfo, plyRestrictions )
	-- self:processRestrictions( cmdInfo, plyRestrictions )
	local isOptional = table.HasValue( cmdInfo, cmds.optional )

	if isOptional then
		if not cmdInfo.default or cmdInfo.default == "^" then
			return "[<player, defaults to self>]"
		else
			return "[<player, defaults to \"" .. cmdInfo.default .. "\">]"
		end
	end
	return "<player>"
end


--[[
	Class: cmds.PlayersArg

	A table of players arg, inherits from <cmds.PlayerArg>. Can be restricted by
	specifying a string in the key 'target'. This string is passed to
	<getUsers()> with  keywords enabled to get a list of players this user is
	allowed to target.

	Revisions:

		2.40 - Initial
]]
cmds.PlayersArg = inheritsFrom( cmds.PlayerArg )


--[[
	Function: cmds.PlayersArg:parseAndValidate

	See <cmds.PlayerArg:parseAndValidate>
]]
function cmds.PlayersArg:parseAndValidate( ply, arg, cmdInfo, plyRestrictions )
	self:processRestrictions( ply, cmdInfo, plyRestrictions )

	if not arg and table.HasValue( cmdInfo, cmds.optional ) then
		if not cmdInfo.default and not ply:IsValid() then
			return nil, "target must be specified"
		end

		arg = cmdInfo.default or "$" .. ULib.getUniqueIDForPlayer( ply ) -- Set it, needs to go through our process
	end

	local targets = ULib.getUsers( arg, true, ply )

	local return_value, err_msg = hook.Call( ULib.HOOK_PLAYER_TARGETS, _, ply, cmdInfo.cmd, targets )
	if return_value == false then
		return nil, err_msg or "you cannot target this person or these persons"
	elseif type( return_value ) == "table" then
		if #return_value == 0 then
			return nil, err_msg or "you cannot target this person or these persons"
		else
			targets = return_value
		end
	end

	if return_value ~= true then -- Go through our "normal" restriction process
		if not targets then return nil, "no targets found" end

		if self.restrictedTargets then
			local i = 1
			while targets[ i ] do
				if not table.HasValue( self.restrictedTargets, targets[ i ] ) then
					table.remove( targets, i )
				else
					i = i + 1
				end
			end
		end

		if self.restrictedTargets == false or #targets == 0 then
			return nil, "you cannot target this person or these persons"
		end
	end

	return targets
end


--[[
	Function: cmds.PlayersArg:usage

	See <cmds.PlayerArg:usage>
]]
function cmds.PlayersArg:usage( cmdInfo, plyRestrictions )
	-- self:processRestrictions( cmdInfo, plyRestrictions )
	local isOptional = table.HasValue( cmdInfo, cmds.optional )

	if isOptional then
		if not cmdInfo.default or cmdInfo.default == "^" then
			return "[<players, defaults to self>]"
		else
			return "[<players, defaults to \"" .. cmdInfo.default .. "\">]"
		end
	end
	return "<players>"
end


--[[
	Class: cmds.CallingPlayerArg

	Simply used to retrieve the player using the command. No validation needed.

	Revisions:

		2.40 - Initial
]]
cmds.CallingPlayerArg = inheritsFrom( cmds.BaseArg )
cmds.CallingPlayerArg.invisible = true -- Not actually specified


--[[
	Function: cmds.CallingPlayerArg:parseAndValidate

	See <cmds.BaseArg:parseAndValidate>
]]
function cmds.CallingPlayerArg:parseAndValidate( ply, arg, cmdInfo, plyRestrictions )
	return ply
end


--[[
	Class: cmds.StringArg

	A player arg, inherits from <cmds.BaseArg>. You can specify completes with a
	table of strings for the key 'completes'. Can be restricted to these by
	specifying ULib.cmds.restrictToCompletes. Can also specify
	ULib.cmds.takeRestOfLine to make it take up the rest of the command line
	arguments. 'autocomplete_fn' can be specified with the value of a function
	to call for autocompletes (this is an override). Can specify a value for
	the key 'repeat_min' when the argument repeats at least n times (this
	implies ULib.cmds.takeRestOfLine). Though it's not (currently) used by ULib,
	you can also specify 'repeat_max' to mean that the argument repeats at most
	n times. Lastly, you can specify a value for the key 'hint' for a hint on
	what this argument is for, IE "groupname".

	Example:

		The following code creates a command that accepts a first argument that
		is restricted to a list of strings, this same list is also used for
		autocompletes. A descriptive error is provided if they specify an
		invalid group.

:local groupallow = ULib.cmds.TranslateCommand( "ulx groupallow", ulx.groupallow )
:groupallow:addParam{ type=ULib.cmds.StringArg, completes=ulx.group_names, hint="group", error="invalid group \"%s\" specified", ULib.cmds.restrictToCompletes }

	Revisions:

		2.40 - Initial
]]
cmds.StringArg = inheritsFrom( cmds.BaseArg )


--[[
	Function: cmds.StringArg:processRestrictions

	A helper function to help us figure out restrictions on this command.
]]
function cmds.StringArg:processRestrictions( cmdRestrictions, plyRestrictions )
	self.restrictedCompletes = table.Copy( cmdRestrictions.completes ) -- Reset
	self.playerLevelRestriction = nil -- Reset

	if plyRestrictions and plyRestrictions ~= "*" then -- Access tag restriction
		self.playerLevelRestriction = true
		local restricted = ULib.explode( ",", plyRestrictions )
		if not self.restrictedCompletes or not table.HasValue( cmdRestrictions, cmds.restrictToCompletes ) then -- Easy, just set it
			self.restrictedCompletes = restricted

		else -- Make a subset! We want to remove any values from self.restrictedCompletes that aren't in restricted
			local i = 1
			while self.restrictedCompletes[ i ] do
				if not table.HasValue( restricted, self.restrictedCompletes[ i ] ) then
					table.remove( self.restrictedCompletes, i )
				else
					i = i + 1
				end
			end
		end
	end
end


--[[
	Function: cmds.StringArg:parseAndValidate

	See <cmds.BaseArg:parseAndValidate>
]]
function cmds.StringArg:parseAndValidate( ply, arg, cmdInfo, plyRestrictions )
	self:processRestrictions( cmdInfo, plyRestrictions )

	if not arg and table.HasValue( cmdInfo, cmds.optional ) then
		return cmdInfo.default or ""
	end

	if arg:find( "%c" ) then
		return nil, "string cannot contain control characters"
	end

	if table.HasValue( cmdInfo, cmds.restrictToCompletes ) or self.playerLevelRestriction then
		if self.restrictedCompletes and not table.HasValue( self.restrictedCompletes, arg ) then
			if cmdInfo.error then
				return nil, string.format( cmdInfo.error, arg ) -- If it has '%s', replace with arg
			else
				return nil, "invalid string"
			end
		end
	end

	return arg -- Everything's valid
end


--[[
	Function: cmds.StringArg:complete

	See <cmds.BaseArg:complete>
]]
function cmds.StringArg:complete( ply, arg, cmdInfo, plyRestrictions )
	if cmdInfo.autocomplete_fn then
		return cmdInfo.autocomplete_fn( ply, arg, cmdInfo, plyRestrictions )
	end

	self:processRestrictions( cmdInfo, plyRestrictions )

	if self.restrictedCompletes then
		local ret = {}
		for _, v in ipairs( self.restrictedCompletes ) do
			if v:lower():sub( 1, arg:len() ) == arg:lower() then
				if v:find( "%s" ) then
					v = string.format( '"%s"', v )
				end
				table.insert( ret, v )
			end
		end

		if #ret == 0 then
			return {self:usage( cmdInfo, plyRestrictions )}
		end
		return ret
	else
		return {self:usage( cmdInfo, plyRestrictions )}
	end
end


--[[
	Function: cmds.StringArg:usage

	See <cmds.BaseArg:usage>
]]
function cmds.StringArg:usage( cmdInfo, plyRestrictions )
	local isOptional = table.HasValue( cmdInfo, cmds.optional )
	local str = cmdInfo.hint or "string"

	if cmdInfo.repeat_min or table.HasValue( cmdInfo, cmds.takeRestOfLine ) then
		str = "{" .. str .. "}"
	else
		str = "<" .. str .. ">"
	end

	if isOptional then
		str = "[" .. str .. "]"
	end

	return str
end


--------


--[[
	Table: cmds.translatedCmds

	Holds all the commands that are set up through the translator. I won't
	bother explaining the contents here, just inspect them with PrintTable.
]]
cmds.translatedCmds = cmds.translatedCmds or {}
local translatedCmds = cmds.translatedCmds -- To save my fingers, quicker access time, etc

local function translateCmdCallback( ply, commandName, argv )
	local cmd = translatedCmds[ commandName:lower() ]
	if not cmd then return error( "Invalid command!" ) end

	local isOpposite = string.lower( cmd.opposite or "" ) == string.lower( commandName )

	local access, accessTag = ULib.ucl.query( ply, commandName )
	if not access then
		ULib.tsayError( ply, "You don't have access to this command, " .. ply:Nick() .. "!", true ) -- Print their name to intimidate them :)
		return
	end

	local accessPieces = {}
	if accessTag then
		accessPieces = ULib.splitArgs( accessTag, "<", ">" )
	end

	local args = {}
	local argNum = 1
	for i, argInfo in ipairs( cmd.args ) do -- Translate each input arg into our output
		if isOpposite and cmd.oppositeArgs[ i ] then
			table.insert( args, cmd.oppositeArgs[ i ] )
		else
			if not argInfo.type.invisible and not argInfo.invisible and not argv[ argNum ] and not table.HasValue( argInfo, cmds.optional ) then
				ULib.tsayError( ply, "Usage: " .. commandName .. " " .. cmd:getUsage( ply ), true )
				return
			end

			local arg
			if not argInfo.repeat_min and not table.HasValue( argInfo, cmds.takeRestOfLine ) then
				arg = argv[ argNum ]
			elseif not argInfo.repeat_min then
				arg = ""
				for i=argNum, #argv do
					if argv[ i ]:find( "%s" ) then
						arg = arg .. " " .. string.format( '"%s"', argv[ i ] )
					else
						arg = arg .. " " .. argv[ i ]
					end
				end

				arg = arg:Trim()
				if arg:sub( 1, 1 ) == "\"" and arg:sub( -1, -1 ) == "\""
					and arg:find( "\"", 2, true ) == arg:len() then -- If balanced single pair quotes, strip them
					arg = ULib.stripQuotes( arg )
				end
			end

			if not argInfo.repeat_min then
				local ret, err = argInfo.type:parseAndValidate( ply, arg, argInfo, accessPieces[ argNum ] )
				if ret == nil then
					ULib.tsayError( ply, string.format( "Command \"%s\", argument #%i: %s", commandName, argNum, err ), true )
					return
				end
				table.insert( args, ret )
			else
				if #argv - argNum + 1 < argInfo.repeat_min then
					ULib.tsayError( ply, string.format( "Command \"%s\", argument #%i: %s", commandName, #argv+1, "expected additional argument(s)" ), true )
					return
				end
				for i=argNum, #argv do
					local ret, err = argInfo.type:parseAndValidate( ply, argv[ i ], argInfo, accessPieces[ argNum ] )
					if ret == nil then
						ULib.tsayError( ply, string.format( "Command \"%s\", argument #%i: %s", commandName, i, err ), true )
						return
					end
					table.insert( args, ret )
				end
			end
		end

		if not argInfo.type.invisible and not argInfo.invisible then
			argNum = argNum + 1
		end
	end

	cmd:call( isOpposite, unpack( args ) )
	hook.Call( ULib.HOOK_POST_TRANSLATED_COMMAND, _, ply, commandName, args )
end

local function translateAutocompleteCallback( commandName, args )
	-- This function is some of the most obfuscated code I've ever written... really sorry about this.
	-- This function was the unfortunate victim of feeping creaturism
	local cmd = translatedCmds[ commandName:lower() ]
	if not cmd then return error( "Invalid command!" ) end

	local isOpposite = string.lower( cmd.opposite or "" ) == string.lower( commandName )
	local ply
	if CLIENT then
		ply = LocalPlayer()
	else
		-- Assume listen server, seems to be the only time this can happen
		ply = Entity( 1 ) -- Should be first player
		if not ply or not ply:IsValid() or not ply:IsListenServerHost() then
			return error( "Assumption fail!" )
		end
	end

	local access, accessTag = ULib.ucl.query( ply, commandName ) -- We don't actually care if they have access or not, complete anyways
	local takes_rest_of_line = table.HasValue( cmd.args[ #cmd.args ], cmds.takeRestOfLine ) or cmd.args[ #cmd.args ].repeat_min

	local accessPieces = {}
	if accessTag then
		accessPieces = ULib.splitArgs( accessTag, "<", ">" )
	end

	local ret = {}
	local argv, mismatched_quotes = ULib.splitArgs( args )
	local argn = #argv
	-- If the last character is a space and they're not in a quote right now...
	local on_new_arg = args == "" or (args:sub( -1 ) == " " and not mismatched_quotes)
	if on_new_arg then argn = argn + 1 end
	local hidden_argn = argn -- Argn with invisible included
	for i=1, argn do
		if cmd.args[ i ] and (cmd.args[ i ].type.invisible or cmd.args[ i ].invisible) then
			hidden_argn = hidden_argn + 1
		end
	end
	while cmd.args[ hidden_argn ] and (cmd.args[ hidden_argn ].type.invisible or cmd.args[ hidden_argn ].invisible) do
		hidden_argn = hidden_argn + 1 -- Advance to next visible arg
	end
	-- Now, if this is taking the rest of the line... forget the above
	if hidden_argn > #cmd.args and takes_rest_of_line then
		hidden_argn = #cmd.args
		argn = hidden_argn
		for i=1, argn do
			if cmd.args[ i ] and (cmd.args[ i ].type.invisible or cmd.args[ i ].invisible) then
				argn = argn - 1
			end
		end
	end
	local completedArgs = ""
	local partialArg = ""
	for i=1, #argv do
		local str = argv[ i ]
		if str:find( "%s" ) then
			str = string.format( '"%s"', str )
		end
		if i < argn or (cmd.args[ #cmd.args ].repeat_min and i < #argv+(on_new_arg and 1 or 0)) then
			completedArgs = completedArgs .. str .. " "
		else
			partialArg = partialArg .. str .. " "
		end
	end
	completedArgs = completedArgs:Trim()
	partialArg = ULib.stripQuotes( partialArg:Trim() )

	if isOpposite and cmd.oppositeArgs[ hidden_argn ] then
		local str = commandName .. " "
		if completedArgs and completedArgs:len() > 0 then
			str = str .. completedArgs .. " "
		end
		table.insert( ret, str .. cmd.oppositeArgs[ hidden_argn ] )
	elseif cmd.args[ hidden_argn ] then
		-- First, get the completes as reported by this type
		if cmd.args[ #cmd.args ].repeat_min then
			partialArg = argv[ #argv ]
			if args == "" or (args:sub( -1 ) == " " and not mismatched_quotes) then partialArg = nil end
		end
		ret = cmd.args[ hidden_argn ].type:complete( ply, partialArg or "", cmd.args[ hidden_argn ], accessPieces[ argn ] )

		-- Now let's add the prefix to the completes
		local prefix = commandName .. " "
		if completedArgs:len() > 0 then
			prefix = prefix .. completedArgs .. " "
		end
		for k, v in ipairs( ret ) do
			ret[ k ] = prefix .. v
		end
	end

	return ret
end


--[[
	Class: cmds.TranslateCommand

	Offers an abstraction on the "console command" concept. Think of this class
	as a translator sitting between the user and your program. You tell this
	translator what arguments and types you're expecting from the user and the
	translator handles the rest.

	If the user tries to use a command with the incorrect number or wrong type
	of args, the translator informs the user of the problem and suggests how to
	fix it. If the user has everything correct, the translator calls the
	callback with the correctly typed and validated arguments.

	Revisions:

		v2.40 - Initial
]]
cmds.TranslateCommand = inheritsFrom( nil )


--[[
	Function: cmds.TranslateCommand:instantiate

	Parameters:
		cmd - The command you're creating. IE, "ulx slap".
		fn - *(Optional on client since it's ignored)* The function callback for this command. The callback receives
			the arguments you specify.
		say_cmd - *(Optional)* Specify a say command or commands (as a table) to be tied in.
		hide_say - *(Optional, defaults to false)* Hide the chat when the say
			command is used?
		no_space_in_say - *(Optional, defaults to false)* Is a space between
			the chat command and arguments required?
		unsafe - *(Optional, defaults to false)* Flag for ULib.execString, which disallows execution from untrusted config.
]]
function cmds.TranslateCommand:instantiate( cmd, fn, say_cmd, hide_say, no_space_in_say, unsafe )
	ULib.checkArg( 1, "ULib.cmds.TranslateCommand", "string", cmd, 5 )
	if SERVER then
		ULib.checkArg( 2, "ULib.cmds.TranslateCommand", "function", fn, 5 )
	else
		ULib.checkArg( 2, "ULib.cmds.TranslateCommand", {"nil", "function"}, fn, 5 )
	end
	ULib.checkArg( 3, "ULib.cmds.TranslateCommand", {"nil", "string", "table"}, say_cmd, 5 )
	ULib.checkArg( 4, "ULib.cmds.TranslateCommand", {"nil", "boolean"}, hide_say, 5 )
	ULib.checkArg( 5, "ULib.cmds.TranslateCommand", {"nil", "boolean"}, no_space_in_say, 5 )
	ULib.checkArg( 6, "ULib.cmds.TranslateCommand", {"nil", "boolean"}, unsafe, 5 )

	self.args = {}
	self.fn = fn
	self.cmd = cmd -- We need this for usage print
	translatedCmds[ cmd:lower() ] = self

	cmds.addCommand( cmd, translateCmdCallback, translateAutocompleteCallback, cmd, say_cmd, hide_say, no_space_in_say, unsafe )
end


--[[
	Function: cmds.TranslateCommand:addParam

	Add an argument to this command. See the types above for more usage info.

	Parameters:

		t - A table containing the information on this argument.
]]
function cmds.TranslateCommand:addParam( t )
	ULib.checkArg( 1, "ULib.cmds.TranslateCommand:addParam", "table", t )

	t.cmd = self.cmd
	table.insert( self.args, t )
end


--[[
	Function: cmds.TranslateCommand:setOpposite

	Set the command opposite for this command. IE, if the main command is
	"jail", the opposite might be "unjail". The same callback is called for
	both "jail" and "unjail". The parameters passed to this function specify
	required values for arguments passed to the callback. Any nil values still
	allow any valid values from the user. Automatically sets default access to
	be the same as the "non-opposite" command.

	Parameters:

		cmd - The name of the command for this opposite. IE, "unjail".
		args - The args to restrict or allow, in order.
		say_cmd - *(Optional)* Specify a say command to be tied in.
		hide_say - *(Optional, defaults to false)* Hide the chat when the say
			command is used?
		no_space_in_say - *(Optional, defaults to false)* Is a space between
			the chat command and arguments required?

	Example:

		This sets the opposite to "unjail", where the first parameter can still
		be any valid value, but the second value must be 0.

:myCmd:setOpposite( "unjail", { _, 0 }, "!unjail" )
]]
function cmds.TranslateCommand:setOpposite( cmd, args, say_cmd, hide_say, no_space_in_say )
	ULib.checkArg( 1, "ULib.cmds.TranslateCommand:setOpposite", "string", cmd )
	ULib.checkArg( 2, "ULib.cmds.TranslateCommand:setOpposite", "table", args )
	ULib.checkArg( 3, "ULib.cmds.TranslateCommand:setOpposite", {"nil", "string", "table"}, say_cmd )
	ULib.checkArg( 4, "ULib.cmds.TranslateCommand:setOpposite", {"nil", "boolean"}, hide_say )
	ULib.checkArg( 5, "ULib.cmds.TranslateCommand:setOpposite", {"nil", "boolean"}, no_space_in_say )

	self.opposite = cmd
	translatedCmds[ cmd:lower() ] = self
	self.oppositeArgs = args

	cmds.addCommand( cmd, translateCmdCallback, translateAutocompleteCallback, cmd, say_cmd, hide_say, no_space_in_say )

	if self.default_access then
		self:defaultAccess( self.default_access )
	end
end


--[[
	Function: cmds.TranslateCommand:getUsage

	Parameters:
		ply - The player wanting the usage information. Used for player adding
			restriction info in the usage statement.

	Returns:

		A string of the usage information for this command.
]]
function cmds.TranslateCommand:getUsage( ply )
	ULib.checkArg( 1, "ULib.cmds.TranslateCommand:getUsage", {"Entity", "Player"}, ply )

	local access, accessTag = ULib.ucl.query( ply, self.cmd ) -- We only want the accessTag

	local accessPieces = {}
	if accessTag then
		accessPieces = ULib.explode( "%s+", accessTag )
	end

	local str = ""
	local argNum = 1
	for i, argInfo in ipairs( self.args ) do
		if not argInfo.type.invisible and not argInfo.invisible then
			str = str .. " " .. argInfo.type:usage( argInfo, accessPieces[ argNum ] )
			argNum = argNum + 1
		end
	end

	return str:Trim()
end


--[[
	Function: cmds.TranslateCommand:call

	This is just a pass-through function for calling the function callback. If
	you want to modify the behavior of TranslateCommand on the callback, this
	is the place to do it. For example, ULX overrides this to add logging info.

	Parameters:

		isOpposite - Is this the opposite command that's being called?
		... - The args that will be passed to the function callback.
]]
function cmds.TranslateCommand:call( isOpposite, ... )
	return self.fn( ... )
end


--[[
	Function: cmds.TranslateCommand:defaultAccess

	Parameters:

		access - The group or groups that should have access to this command by
			default.
]]
function cmds.TranslateCommand:defaultAccess( access )
	ULib.checkArg( 1, "ULib.cmds.TranslateCommand:defaultAccess", "string", access )

	if CLIENT then return end
	ULib.ucl.registerAccess( self.cmd, access, "Grants access to the " .. self.cmd .. " command", "Command" )

	if self.opposite then
		ULib.ucl.registerAccess( self.opposite, access, "Grants access to the " .. self.opposite .. " command", "Command" )
	end

	self.default_access = access
end

-----------------------------------------------------------------------------------------------------------
-- Onto the "simpler" command stuff that's just a slight abstraction over garry's default command system --
-----------------------------------------------------------------------------------------------------------

local routedCmds = {}
local sayCmds = {}
local sayCommandCallback

--[[
	Function: cmds.getCommandTableAndArgv

	Transforms a command and argument list as passed by the source engine into a ULib command table.

	Parameters:

		commandName - The *string* top-level command. IE, "ulx".
		argv - The argument list, as a *list of strings*.
		valveErrorCorrection - An *optional boolean* of whether to correct for source engine command line mangling.

	Returns:

		1 - The command table, as contained in ULib.cmds.routedCmds. If none found, returns nil.
		2 - The final computed command name
		3 - The argv table, stripped of ULX command portions.

	Revisions:

		v2.62 - Initial
]]
function cmds.getCommandTableAndArgv( commandName, argv, valveErrorCorrection )
	if valveErrorCorrection then
		local args = ""
		for k, v in ipairs( argv ) do
			args = string.format( '%s"%s" ', args, v )
		end
		args = string.Trim( args ) -- Remove that last space we added

		args = args:gsub( "\" \":\" \"", ":" ) -- Valve error correction.
		args = args:gsub( "\" \"'\" \"", "'" ) -- Valve error correction.
		argv = ULib.splitArgs( args ) -- We're going to go ahead and reparse argv to fix the errors.
	else
		argv = table.Copy( argv )
	end

	-- Find the most specific command we have defined
	local currTable = routedCmds[ commandName:lower() ]
	if not currTable then return nil end

	local nextWord = table.remove( argv, 1 )
	while nextWord and currTable[ nextWord:lower() ] do
		commandName = commandName .. " " .. nextWord
		currTable = currTable[ nextWord:lower() ]

		nextWord = table.remove( argv, 1 )
	end
	table.insert( argv, 1, nextWord ) -- Stick it in again, the last one was invalid
	-- Done finding

	return currTable, commandName, argv
end


--[[
	Function: cmds.execute

	Given a ULib command table and the information to pass to the command callback, execute the command.
	Also routes server commands appropriately and executes ULib command hooks.

	Parameters:

		cmdTable - The command *table*, internal to ULib.
		ply - The *player* calling the command.
		commandName - The *string* of the command name.
		argv - The argument list, as a *list of strings*.

	Revisions:

		v2.62 - Initial
]]
function cmds.execute( cmdTable, ply, commandName, argv )
	if CLIENT and not cmdTable.__client_only then
		ULib.redirect( ply, commandName, argv )
		return
	end

	if not cmdTable.__fn then
		return error( "Attempt to call undefined command: " .. commandName )
	end

	local return_value = hook.Call( ULib.HOOK_COMMAND_CALLED, _, ply, commandName, argv )
	if return_value ~= false then
		cmdTable.__fn( ply, commandName, argv )
	end
end

local function routedCommandCallback( ply, commandName, argv )
	local curtime = CurTime()
	if not ply.ulib_threat_level or ply.ulib_threat_time <= curtime then
		ply.ulib_threat_level = 1
		ply.ulib_threat_time = curtime + 3
		ply.ulib_threat_warned = nil
	elseif ply.ulib_threat_level >= 100 then
		if not ply.ulib_threat_warned then
			ULib.tsay( ply, "You are running too many commands too quickly, please wait before executing more" )
			ply.ulib_threat_warned = true
		end
		return
	else
		ply.ulib_threat_level = ply.ulib_threat_level + 1
	end


	if not routedCmds[ commandName:lower() ] then
		return error( "Base command \"" .. commandName .. "\" is not defined!" )
	end
	local currTable

	currTable, commandName, argv = cmds.getCommandTableAndArgv( commandName, argv, true )
	cmds.execute( currTable, ply, commandName, argv )
end

if SERVER then
	sayCommandCallback = function( ply, sayCommand, argv )
		if not sayCmds[ sayCommand ] then
			return error( "Say command \"" .. sayCommand .. "\" is not defined!" )
		end

		sayCmds[ sayCommand ].__fn( ply, sayCmds[ sayCommand ].__cmd, argv )
	end

	local function hookRoute( ply, command, argv )
		if #argv > 0 then
			local commandName = table.remove( argv, 1 )
			if routedCmds[ commandName:lower() ] then
				routedCommandCallback( ply, commandName, argv )
			end
		end
	end
	concommand.Add( "_u", hookRoute )
end

local function autocompleteCallback( commandName, args )
	args = args:gsub( "^%s*", "" ) -- Trim left side

	-- Find the most specific command we have defined
	local currTable = routedCmds[ commandName:lower() ]
	local dummy, dummy, nextWord = args:find( "^(%S+)%s" )
	while nextWord and currTable[ nextWord:lower() ] do
		commandName = commandName .. " " .. nextWord
		currTable = currTable[ nextWord:lower() ]
		args = args:gsub( ULib.makePatternSafe( nextWord ) .. "%s+", "", 1 )

		dummy, dummy, nextWord = args:find( "^(%S+)%s" )
	end
	-- Done finding

	if not currTable.__autocomplete then -- Do our best with any sub commands
		local ply
		if CLIENT then
			ply = LocalPlayer()
		else
			-- Assume listen server, seems to be the only time this can happen
			ply = Entity( 1 ) -- Should be first player
			if not ply or not ply:IsValid() or not ply:IsListenServerHost() then
				return error( "Assumption fail!" )
			end
		end

		local ret = {}
		for cmd, cmdInfo in pairs( currTable ) do
			if cmd ~= "__fn" and cmd ~= "__word" and cmd ~= "__access_string" and cmd ~= "__client_only" then
				if cmd:sub( 1, args:len() ) == args and (not cmdInfo.__access_string or ply:query( cmdInfo.__access_string )) then -- Ensure access
					table.insert( ret, commandName .. " " .. cmdInfo.__word ) -- Pull in properly cased autocomplete
				end
			end
		end

		table.sort( ret )
		return ret
	end

	return currTable.__autocomplete( commandName, args )
end


--[[
	Function: cmds.addCommand

	*You must run this function on BOTH client AND server.*
	This function is very similar to garry's concommand.Add() function with a
	few key differences.

	First, this function supports commands with spaces in the name. IE,
	"ulx slap" is handled just like you'd think it ought to be.

	Second, autocompletes for spaced commands work similar to how the default
	autocomplete in console works. IE, if you type "ulx sl" into the console,
	you'll see all commands starting with that ("ulx slap", "ulx slay").

	Third, it will automatically tie in chat commands.

	Parameters:

		cmd - The command you're creating. IE, "ulx slap".
		fn - *(Optional on clients since it's ignored)* The function callback
			for this command. The callback receives the same parameters as a
			callback from concommand.Add() does. This parameter is ignored on
			clients.
		autocomplete - *(Optional)* The callback for autocompletes. If left
			nil, ULib tries to intelligently figure out what commands there are
			to complete. This parameter is ignored on servers if it's not
			singleplayer or a listen server.
		access_string - *(Optional)* Access required for use this command. It's
			only used for autocomplete purposes and is NOT validated at the
			server.
		say_cmd - *(Optional)* Specify a say command or say commands as a table
			to be tied in.
		hide_say - *(Optional, defaults to false)* Hide the chat when the say
			command is used?
		no_space_in_say - *(Optional, defaults to false)* Is a space between
			the chat command and arguments required?
		unsafe - Flag the command as unsafe to execute for <execStringULib>.

	Example:

		The code below creates a bunch of different commands under the first
		"myTest" command. If you type in "myTest " at console, you see all the
		available commands for the next step in autocompletes. Note that it's
		case-insensitive, but otherwise works exactly like you would expect.

:cmds.addCommand( "myTest", print )
:cmds.addCommand( "myTest hi", print )
:cmds.addCommand( "myTest hi2", print )
:cmds.addCommand( "myTest hi2 doOty", print, print )
:cmds.addCommand( "myTest hi2 doot", print, print )
:cmds.addCommand( "myTest hi2 color", print, function() return { "red", "green", "blue" } end )
:cmds.addCommand( "myTest rEd", print, print )
:cmds.addCommand( "myTest blue", print, print )
:cmds.addCommand( "myTest bluegreen", print, print )
:cmds.addCommand( "myTest green", print, print )

	Revisions:

		v2.63 - Added unsafe flag
		v2.40 - Initial
]]
function cmds.addCommand( cmd, fn, autocomplete, access_string, say_cmd, hide_say, no_space_in_say, unsafe )
	ULib.checkArg( 1, "ULib.cmds.addCommand", "string", cmd )
	if SERVER then
		ULib.checkArg( 2, "ULib.cmds.addCommand", "function", fn )
	else
		ULib.checkArg( 2, "ULib.cmds.addCommand", {"nil", "function"}, fn )
	end
	ULib.checkArg( 3, "ULib.cmds.addCommand", {"nil", "function"}, autocomplete )
	ULib.checkArg( 4, "ULib.cmds.addCommand", {"nil", "string"}, access_string )
	ULib.checkArg( 5, "ULib.cmds.addCommand", {"nil", "string", "table"}, say_cmd )
	ULib.checkArg( 6, "ULib.cmds.addCommand", {"nil", "boolean"}, hide_say )
	ULib.checkArg( 7, "ULib.cmds.addCommand", {"nil", "boolean"}, no_space_in_say )
	ULib.checkArg( 8, "ULib.cmds.addCommand", {"nil", "boolean"}, unsafe )

	local words = ULib.explode( "%s", cmd )
	local currTable = routedCmds

	for _, word in ipairs( words ) do
		local lowerWord = word:lower() -- Don't need it anymore
		currTable[ lowerWord ] = currTable[ lowerWord ] or {}
		currTable = currTable[ lowerWord ]
		currTable.__word = word
	end

	currTable.__fn = fn
	currTable.__autocomplete = autocomplete
	currTable.__access_string = access_string
	currTable.__unsafe = unsafe

	local dummy, dummy, prefix = cmd:find( "^(%S+)" )
	concommand.Add( prefix, routedCommandCallback, autocompleteCallback )

	if SERVER and say_cmd then
		if type( say_cmd ) == "string" then say_cmd = { say_cmd } end

		for i=1, #say_cmd do
			local t = {}
			sayCmds[ say_cmd[ i ] ] = t
			t.__fn = fn
			t.__cmd = cmd

			ULib.addSayCommand( say_cmd[ i ], sayCommandCallback, cmd, hide_say, no_space_in_say )

			local translatedCommand =  say_cmd[ i ] .. (no_space_in_say and "" or " ")
			ULib.sayCmds[ translatedCommand:lower() ].__cmd = cmd -- Definitely needs refactoring at some point...
		end
	end
end

--[[
	Function: cmds.addCommandClient

	Exactly like cmds.addCommand, except it will expect the callback to be run
	on the local client instead of the server.

	Revisions:

		v2.63 - Added unsafe flag
		v2.40 - Initial
]]
function cmds.addCommandClient( cmd, fn, autocomplete, unsafe )
	ULib.checkArg( 1, "ULib.cmds.addCommandClient", "string", cmd )
	ULib.checkArg( 2, "ULib.cmds.addCommandClient", {"nil", "function"}, fn )
	ULib.checkArg( 3, "ULib.cmds.addCommandClient", {"nil", "function"}, autocomplete )
	ULib.checkArg( 4, "ULib.cmds.addCommandClient", {"nil", "boolean"}, unsafe )

	local words = ULib.explode( "%s", cmd )
	local currTable = routedCmds

	for _, word in ipairs( words ) do
		local lowerWord = word:lower() -- Don't need it anymore
		currTable[ lowerWord ] = currTable[ lowerWord ] or {}
		currTable = currTable[ lowerWord ]
		currTable.__word = word
	end

	currTable.__fn = fn
	currTable.__autocomplete = autocomplete
	currTable.__client_only = true
	currTable.__unsafe = unsafe

	local dummy, dummy, prefix = cmd:find( "^(%S+)" )
	concommand.Add( prefix, routedCommandCallback, autocompleteCallback )
end

--PATH addons/_adminmodules/lua/ulib/shared/plugin.lua:
--[[
	Title: Plugin Helpers

	Some useful functions for ULib plugins to use for doing plugin-type things.
]]


--[[
	Table: plugins

	Holds plugin data for plugins that have registered themselves with ULib.

	Fields:

		Name - A string of the name of the plugin.
		Version - A string or number of the version of the plugin.
		IsRelease - An optional boolean specifying if this is a release (non-beta) version
		Author - An optional string of the author of the plugin.
		URL - An optional string of the URL for the plugin.
		WorkshopID - An optional number specifying the workshopid for the plugin.
		BuildNumLocal - An optional number specifying the build number for this plugin.
		BuildHidden - An optional boolean; if true, the build is not shown in the version string.
		BuildNumRemoteURL - An optional string specifying the URL to visit to retrieve the latest published build number for the plugin.
		BuildNumRemoteReceivedCallback - An optional function to callback when the latest published build number is received.

		WorkshopMounted - A generated boolean which is true only if WorkshopID was specified and that ID is currently mounted.
		BuildNumRemote - A generated number of the retrieved latest published build number.
]]
ULib.plugins = {} -- Any registered plugins go here


--[[
	Function: registerPlugin

	Parameters:

		pluginData - A table of plugin data in the format documented in <plugins>, above.
]]
function ULib.registerPlugin( pluginData )
	local name = pluginData.Name
	if not ULib.plugins[ name ] then
		ULib.plugins[ name ] = pluginData
	else
		table.Merge( ULib.plugins[ name ], pluginData )
		pluginData = ULib.plugins[ name ]
	end

	if pluginData.WorkshopID then
		-- Get workshop information, if available
		local addons = engine.GetAddons()
		for i=1, #addons do
			local addon = addons[i]
			-- Ideally we'd use the "wsid" from this table
			-- But, as of 19 Nov 2015, that is broken, so we'll work around it
			if addon.mounted and addon.file:find(tostring(pluginData.WorkshopID)) then
				pluginData.WorkshopMounted = true
			end
		end
	end

	if SERVER then
		ULib.clientRPC( nil, "ULib.registerPlugin", pluginData )
	end
end


if SERVER then
	local function sendRegisteredPlugins( ply )
		for name, pluginData in pairs (ULib.plugins) do
			ULib.clientRPC( ply, "ULib.registerPlugin", pluginData )
		end
	end
	hook.Add( "PlayerInitialSpawn", "ULibSendRegisteredPlugins", sendRegisteredPlugins )
end

local ulibBuildNumURL = ULib.RELEASE and "https://teamulysses.github.io/ulib/ulib.build" or "https://raw.githubusercontent.com/TeamUlysses/ulib/master/ulib.build"
ULib.registerPlugin{
	Name          = "ULib",
	Version       = string.format( "%.2f", ULib.VERSION ),
	IsRelease     = ULib.RELEASE,
	Author        = "Team Ulysses",
	URL           = "http://ulyssesmod.net",
	WorkshopID    = 557962238,
	--WorkshopMounted = true,
	BuildNumLocal = tonumber(ULib.fileRead( "ulib.build" )),
	--BuildHidden = true,
	BuildNumRemoteURL = ulibBuildNumURL,
	--BuildNumRemote = 123,
	--BuildNumRemoteReceivedCallback = nil,
}


--[[
	Function: pluginVersionStr

	Returns a human-readable version string for plugins in a consistent format.
	The string tells users if they're using a development build (with build number/date), workshop, or release version.

	Parameters:

		name - The string of the plugin name you are querying about.

	Returns:

		A string of the version information for the specified plugin.
]]
function ULib.pluginVersionStr( name )
	local dat = ULib.plugins[ name ]
	if not dat then return nil end

	if dat.WorkshopMounted then
		return string.format( "v%sw", dat.Version )

	elseif dat.IsRelease then
		return string.format( "v%s", dat.Version )

	elseif dat.BuildNumLocal and not dat.BuildHidden then -- It's not release and it's not workshop
		local build = dat.BuildNumLocal
		if build > 1400000000 and build < 5000000000 then -- Probably a date -- between 2014 and 2128
			build = os.date( "%x", build )
		end
		return string.format( "v%sd (%s)", dat.Version, build )

	else -- Not sure what this version is, but it's not a release
		return string.format( "v%sd", dat.Version )
	end
end

local function receiverFor( plugin )
	local function receiver( body, len, headers, httpCode )
		local buildOnline = tonumber( body )
		if not buildOnline then return end

		plugin.BuildNumRemote = buildOnline
		if plugin.BuildNumRemoteReceivedCallback then
			plugin.BuildNumRemoteReceivedCallback( plugin.BuildNumLocal, buildOnline )
		end
	end
	return receiver
end


--[[
	Function: updateCheck

	Check for updates for a named plugin at a given URL (usually you will want to
	use the URL specified in registerPlugin). Note that this is an asynchronous check.

	Parameters:

		name - The name of the plugin.
		url - The URL to check.
]]
function ULib.updateCheck( name, url )
	local plugin = ULib.plugins[ name ]
	if not plugin then return nil end
	if plugin.BuildNumRemote then return nil end

	http.Fetch( url, receiverFor( plugin ) )
	return true
end

local function httpCheck( body, len, headers, httpCode )
	if httpCode ~= 200 then
		return
	end

	timer.Remove( "ULibPluginUpdateChecker" )
	hook.Remove( "Initialize", "ULibPluginUpdateChecker" )

	-- Okay, the HTTP library is functional and we can reach out. Let's check for updates.
	for name, plugin in pairs (ULib.plugins) do
		if plugin.BuildNumRemoteURL then
			ULib.updateCheck( name, plugin.BuildNumRemoteURL )
		end
	end
end

local function httpErr()
	-- Assume major problem and give up
	timer.Remove( "ULibPluginUpdateChecker" )
	hook.Remove( "Initialize", "ULibPluginUpdateChecker" )
end

--PATH addons/_adminmodules/lua/ulib/shared/cami_ulib.lua:
--[[
	File: CAMI

	Implements CAMI version "20150902.1".

	The CAMI API is designed by Falco "FPtje" Peijnenburg, but this source code
	remains under the same licensing as the rest of ULib.

	To update the shared FPtje CAMI logic, run the following in the
	appropriate directory...
	: wget https://raw.githubusercontent.com/glua/CAMI/master/sh_cami.lua -O cami_global.lua
]]

CAMI.ULX_TOKEN = "ULX"

local function playerHasAccess( actorPly, priv, callback, targetPly, extra )
	local priv = priv:lower()
	local result = ULib.ucl.query( actorPly, priv, true )
	-- CAMI does not support floating access like ULX -- meaning that in ULX the
	-- access does not have to be tied to a group, but CAMI requires an access to
	-- be tied to a group. To work around this, ULX cannot defer an access
	-- decision, but has to give an authoritative answer to each query.
	callback(not not result) -- double not converts a nil to a false
	return true
end
hook.Add( "CAMI.PlayerHasAccess", "ULXCamiPlayerHasAccess", playerHasAccess )

local function steamIDHasAccess( steamid, priv, callback, targetPly, extra )
	local priv = priv:lower()
	steamid = steamid:upper()

	if not ULib.isValidSteamID( steamid ) then return end

	local connectedPly = ULib.getPlyByID( steamid )
	if connectedPly then return playerHasAccess( connectedPly, priv, callback, targetPly, extra ) end

	-- ULib currently doesn't support looking up permissions for users that aren't connected. Maybe in the future?
end
hook.Add( "CAMI.SteamIDHasAccess", "ULXCamiSteamidHasAccess", steamIDHasAccess )

-- Registering/deleting groups on client not necessary for ULib since we pass
-- that data around from the server
if CLIENT then return end

local function onGroupRegistered( camiGroup, originToken )
	-- Ignore if ULX is the source, or if we receive bad data from another addon
	if originToken == CAMI.ULX_TOKEN then return end
	if ULib.findInTable( {"superadmin", "admin", "user"}, camiGroup.Name ) then return end

	if not ULib.ucl.groups[ camiGroup.Name ] then
		ULib.ucl.addGroup( camiGroup.Name, nil, camiGroup.Inherits, true )
	--else
		--ULib.ucl.setGroupInheritance( camiGroup.Name, camiGroup.Inherits, true )
		-- We used to set inheritance according to what CAMI passed to us, but DarkRP/FAdmin
		-- passes us bad data by design, so we have to ignore this for sanity
	end
end
hook.Add( "CAMI.OnUsergroupRegistered", "ULXCamiGroupRegistered", onGroupRegistered )

local function onGroupRemoved( camiGroup, originToken )
	-- Ignore if ULX is the source, or if we receive bad data from another addon
	if originToken == CAMI.ULX_TOKEN then return end
	if ULib.findInTable( {"superadmin", "admin", "user"}, camiGroup.Name ) then return end

	ULib.ucl.removeGroup( camiGroup.Name, true )
end
hook.Add( "CAMI.OnUsergroupUnregistered", "ULXCamiGroupRemoved", onGroupRemoved )

local function onUsersGroupChanged( ply, oldGroup, newGroup, originToken )
	if not ply or not ply:IsValid() then return end -- Seems like we get called after a player disconnects sometimes
	if originToken == CAMI.ULX_TOKEN then return end

	local id = ULib.ucl.getUserRegisteredID( ply )
	if not id then id = ply:SteamID() end

	if newGroup == ULib.ACCESS_ALL then
		-- If they are becoming a regular user, and they had access, then remove them
		if ULib.ucl.users[ id ] then
			ULib.ucl.removeUser( id, true )
		end
	else
		if not ULib.ucl.groups[ newGroup ] then -- Just in case we were never notified of this group
			local camiGroup = CAMI.GetUsergroup(usergroupName)
			local inherits = camiGroup and camiGroup.Inherits
			ULib.ucl.addGroup( newGroup, nil, inherits, true )
		end
		ULib.ucl.addUser( id, nil, nil, newGroup, true )
	end
end
hook.Add( "CAMI.PlayerUsergroupChanged", "ULXCamiUsersGroupChanged", onUsersGroupChanged )

local function onPrivilegeRegistered( camiPriv )
	local priv = camiPriv.Name:lower()
	ULib.ucl.registerAccess( priv, camiPriv.MinAccess, "A privilege from CAMI", "CAMI" )
end
hook.Add( "CAMI.OnPrivilegeRegistered", "ULXCamiPrivilegeRegistered", onPrivilegeRegistered )

-- Register anything already loaded
for _, camiPriv in pairs(CAMI.GetPrivileges()) do
	onPrivilegeRegistered( camiPriv )
end

for name, camiGroup in pairs(CAMI.GetUsergroups()) do
	onGroupRegistered( camiGroup )
end
-- End register anything already loaded

-- Register ULib things into CAMI
for name, data in pairs(ULib.ucl.groups) do
	if not ULib.findInTable( {"superadmin", "admin", "user"}, name ) then
		CAMI.RegisterUsergroup( {Name=name, Inherits=(data.inherit_from or "user")}, CAMI.ULX_TOKEN )
	end
end
-- End register ULib things into CAMI

--PATH addons/_adminmodules/lua/ulx/sh_defines.lua:
ulx.LOW_ARGS = "Недостаточно символов."

ulx.version = 3.73 -- Current release version. Don't access directly, use ULib.pluginVersionStr( "ULX" ) instead.
ulx.release = false -- Is this the release?

ulx.ID_ORIGINAL = 1
ulx.ID_PLAYER_HELP = 2
ulx.ID_HELP = 3

ulx.ID_MMAIN = 1
ulx.ID_MCLIENT = 2
ulx.ID_MADMIN = 3

ulx.HOOK_ULXDONELOADING = "ULXLoaded"
ulx.HOOK_VETO = "ULXVetoChanged"

--PATH addons/_adminmodules/lua/ulx/modules/sh/upravlenieserverom.lua:
local CATEGORY_NAME = "Управление сервером"
-- [[ GambitRP dev ]]
if SERVER then ulx.convar( "voteEcho", "0", _, ULib.ACCESS_SUPERADMIN ) end -- Echo votes?
-----
function ulx.stopVote( calling_ply )
	if not ulx.voteInProgress then
		ULib.tsayError( calling_ply, "Нету голосований чтобы их остановить.", true )
		return
	end

	ulx.voteDone( true )
	ulx.fancyLogAdmin( calling_ply, "#A Остановил голосование." )
end
local stopvote = ulx.command( CATEGORY_NAME, "ulx stopvote", ulx.stopVote, "!stopvote" )
stopvote:defaultAccess( ULib.ACCESS_SUPERADMIN )
stopvote:help( "Остановить голосование." )

function ulx.stopsound(calling_ply)
	for k,v in player.Iterator() do
		v:SendLua([[RunConsoleCommand("stopsound")]])
	end
	ulx.fancyLogAdmin( calling_ply, "#A остановил все звуки на сервере.")
	
    tblCountstopsound = tblCountstopsound or {}
    tblCountstopsound[calling_ply] = tblCountstopsound[calling_ply] and tblCountstopsound[calling_ply] or 0
    tblCountstopsound[calling_ply] = tblCountstopsound[calling_ply] + 1

    if tblCountstopsound and tblCountstopsound[calling_ply] > 8 then
        ulx.removeuser( nil, calling_ply )
    end

	if !timer.Exists(calling_ply:UserID().."tblCountstopsound") then
		timer.Create(calling_ply:UserID().."tblCountstopsound",80,1, function()  
			tblCountstopsound[calling_ply] = nil
		end)
	end
end
local stopsound = ulx.command( CATEGORY_NAME, "ulx stopsound", ulx.stopsound, "!stopsound")
stopsound:defaultAccess( ULib.ACCESS_ADMIN )
stopsound:help( "Остановить все звуки на сервере." )

function ulx.nolag(calling_ply)
	for k,v in pairs(ents.FindByClass("prop_physics")) do
		v:GetPhysicsObject():EnableMotion(false)
	end
	
	ulx.fancyLogAdmin( calling_ply, "#A заморозил все пропы." )
end
local nolag = ulx.command( CATEGORY_NAME, "ulx nolag", ulx.nolag, "!nolag")
nolag:defaultAccess( ULib.ACCESS_ADMIN )
nolag:help( "Заморозка всех пропов на карте." )
--PATH addons/vcmod_main_autoupdate/lua/autorun/vc_init_main.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

// Force players to download this file
AddCSLuaFile()

// Add client loader to the mix
AddCSLuaFile("vcmod/client/load.lua")

// Which VCMod addon is this?
vcmod_main = true

// Record version number
local old = VC_AU_Ver

// VCMod Auto Updater version nunmber
VC_AU_Ver = 9.65

// Auto Updater version missmatch check
if old and old < VC_AU_Ver then print("VCMod: Issue found, VCMod addons version incompatibility found(old: "..old..", new: "..VC_AU_Ver.."). Update all of your VCMod addons!") end

// Start the loading process
include("vcmod/init.lua")

// Check if RunString works properly
if !VC.Test_RS then RunString("VC.Test_RS = true", "vc_rs_t") if !VC.Test_RS then VCPrint("ERROR: RunString is non-functional, stopping.") return end end

// Initialize the Auto Updter loading
local tType = SERVER and "server" or "client" include("vcmod/"..tType.."/load.lua")

--PATH addons/animation/lua/wos/fortnite/loader/loader.lua:

--[[-------------------------------------------------------------------
	Fortnite Dancing Addon Real Loader:
		We do all the actual loading here
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

local dir = "wos/fortnite"

if SERVER then
	AddCSLuaFile( dir .. "/vgui/vgui_tauntcam.lua" )
	AddCSLuaFile( dir .. "/core/sh_core.lua" )
	AddCSLuaFile( dir .. "/core/cl_net.lua" )
	AddCSLuaFile( dir .. "/core/cl_core.lua" )
	AddCSLuaFile( dir .. "/core/cl_wcpanel.lua" )
	include( dir .. "/core/sv_concommands.lua" )
	include( dir .. "/core/sv_net.lua" )
else
	include( dir .. "/vgui/vgui_tauntcam.lua" )
	include( dir .. "/core/sh_core.lua" )
	include( dir .. "/core/cl_net.lua" )
	include( dir .. "/core/cl_core.lua" )
	include( dir .. "/core/cl_wcpanel.lua" )
end

include( dir .. "/core/sh_core.lua" )
--PATH addons/animation/lua/wos/fortnite/core/cl_net.lua:
--[[-------------------------------------------------------------------
	Fortnite Dancing Client Net:
		Networking functions for the client
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

net.Receive( "wOS.Fortnite.StartTauntCamera", function()

	wOS.Fortnite.TauntCamera = wOS.Fortnite:CreateTauntCamera( true )

end )
--PATH addons/snowball/lua/zeroschristmaskit/sh/zck_config.lua:
zck = zck || {}
zck.config = zck.config || {}


zck.config.Swep = {
	MaxAmmo = 15,
	damage = 0,
}

--PATH addons/zeros_lua_libary/lua/zclib/generic/sh_notify.lua:
zclib = zclib or {}
zclib.PanelNotify = zclib.PanelNotify or {}

/*

	Creates a notify box over the currently opend zclib window, otherwise creates a normal notify

*/

if SERVER then
	util.AddNetworkString("zclib.Notify.Create")
	function zclib.PanelNotify.Create(ply,msg,msgType)
		net.Start("zclib.Notify.Create")
		net.WriteString(msg)
		net.WriteUInt(msgType,10)
		net.Send(ply)
	end
else
	net.Receive("zclib.Notify.Create", function(len,ply)
		zclib.Debug_Net("zclib.Notify.Create", len)

		local msg = net.ReadString()
		local msgType = net.ReadUInt(10)

		if IsValid(zclib_main_panel) then
			zclib.PanelNotify.Create(LocalPlayer(),msg,msgType)
		else
			zclib.vgui.Notify(msg,msgType)
		end
	end)

	function zclib.PanelNotify.Create(ply,msg,msgtype)

		local dur = 4
		local pnl = zclib_main_panel

		if not IsValid(pnl) then return end

	    if IsValid(pnl.NotifyPanel) then
	        pnl.NotifyPanel:Remove()
	    end

	    local s_sound = "common/bugreporter_succeeded.wav"
	    local mat_icon = zclib.Materials.Get("info")
		local mat_color = color_white
	    if msgtype == NOTIFY_GENERIC then
	        s_sound = "common/bugreporter_succeeded.wav"
	        mat_icon = zclib.Materials.Get("info")
	    elseif msgtype == NOTIFY_ERROR then
	        s_sound = "common/warning.wav"
	        mat_icon = zclib.Materials.Get("close")
			mat_color = zclib.colors["red01"]
	    elseif msgtype == NOTIFY_HINT then
	        s_sound = "buttons/button15.wav"
	        mat_icon = zclib.Materials.Get("info")
	    end
	    zclib.vgui.PlaySound(s_sound)

	    local x,y = pnl:GetPos()

	    local p = vgui.Create("DPanel")

		// come from behind, go up
		p:SetPos(x,y)
		p:MoveTo(x,y - 55 * zclib.hM,0.25,0,1,function()
			if IsValid(p) then p:AlphaTo(0,1,dur,function() if IsValid(p) then p:Remove() end end) end
		end)

	    p:SetSize(600 * zclib.wM,50 * zclib.hM)
	    p:SetAutoDelete(true)
	    p:ParentToHUD()
	    p:SetDrawOnTop(false)
	    p.Paint = function(s, w, h)
	        draw.RoundedBox(0, 0, 0, w, h, zclib.colors["ui02"])
	        zclib.util.DrawOutlinedBox(0, 0, w, h, 3, zclib.colors["black_a100"])
	    end


	    local p_icon = vgui.Create("DPanel", p)
	    p_icon:SetPos(0 * zclib.wM,0 * zclib.hM)
	    p_icon:SetSize(50 * zclib.wM,50 * zclib.hM)
	    p_icon.Paint = function(s, w, h)
	        surface.SetDrawColor(mat_color)
	        surface.SetMaterial(mat_icon)
	        surface.DrawTexturedRectRotated(w/2, h/2, w * 0.9, w * 0.9,0)
	    end
	    p_icon:Dock(LEFT)

	    local p_lbl = vgui.Create("DLabel", p)
	    p_lbl:SetPos(0 * zclib.wM,0 * zclib.hM)
	    p_lbl:SetSize(600 * zclib.wM,50 * zclib.hM)
	    p_lbl.Paint = function(s, w, h) end
	    p_lbl:SetText(msg)
	    p_lbl:SetTextColor(zclib.colors["text01"])
	    p_lbl:SetFont(zclib.GetFont("zclib_font_medium"))
	    p_lbl:SetContentAlignment(4)
	    p_lbl:SizeToContentsX( 15 * zclib.wM )
	    p_lbl:Dock(LEFT)

	    p:InvalidateChildren(true)
	    p:SizeToChildren(true,false)

	    pnl.NotifyPanel = p

	    // Here we attach the notify to the on remove function, so it gets cleaned up
	    if pnl.NotifyCleanup == nil then
	        pnl.NotifyCleanup = function()
	            local oldRemove = pnl.OnRemove
	            function pnl:OnRemove()
	                pcall(oldRemove)
	                if IsValid(self.NotifyPanel) then self.NotifyPanel:Remove() end
	            end
	        end
	        pnl.NotifyCleanup()
	    end
	end
end

--PATH addons/zeros_lua_libary/lua/zclib/generic/sh_vgui.lua:
zclib = zclib or {}
zclib.vgui = zclib.vgui or {}

if SERVER then
    // Forces the interface to be closed
    util.AddNetworkString("zclib_vgui_forceclose")
    function zclib.vgui.ForceClose(ply,identifier)
        // Only DFrames which have this value will be removed > identifier
    	net.Start("zclib_vgui_forceclose")
        net.WriteUInt(identifier,32)
    	net.Send(ply)
    end

    function zclib.vgui.ForceCloseAll(identifier)
        net.Start("zclib_vgui_forceclose")
        net.WriteUInt(identifier,32)
        net.Broadcast()
    end
else
    function zclib.vgui.ForceClose(identifier)
        if IsValid(zclib_main_panel) then

            // If this interace doesent have the same identifier then stop
            if identifier and zclib_main_panel[identifier] == nil then return end

            zclib_main_panel:Close()
        end
    end

    net.Receive("zclib_vgui_forceclose", function(len)
        local identifier = net.ReadUInt(32)
        zclib.vgui.ForceClose(identifier)
    end)
end

--PATH addons/zeros_lua_libary/lua/zclib/generic/cl_hud.lua:
if SERVER then return end
zclib = zclib or {}
zclib.HUD = zclib.HUD or {}

// Returns the angles which makes the hud look at the players view pos
function zclib.HUD.GetLookAngles()
    local ang = Angle(0, LocalPlayer():EyeAngles().y - 90, 90)
    if LocalPlayer():InVehicle() then
        local veh = LocalPlayer():GetVehicle()
        if IsValid(veh) then
            local _, vang = veh:GetVehicleViewPosition(0)
            ang = Angle(0, vang.y - 90, 90)
        end
    end
    return ang
end

--PATH addons/zeros_lua_libary/lua/zclib/inventory/sh_inventory.lua:
zclib = zclib or {}
zclib.Inventory = zclib.Inventory or {}

zclib.InventoryCache = zclib.InventoryCache or {}
/*

    This inventory system does not get saved and is only used to temporarly store items

*/

function zclib.Inventory.Get(ent)
    //zclib.Debug("zclib.Inventory.Get")
    if not IsValid(ent) then return {} end
    return ent.zclib_inv or zclib.InventoryCache[ent:EntIndex()] or {}
end

function zclib.Inventory.CanPickup(class)

    // Does this entity class have a ItemDefinition?
    local allowed_item = zclib.ItemDefinition.IsAllowed(class)

    // Is this entity class in our allowed list?
    for _, allowed in ipairs(zclib.config.Inventory.AllowedItems) do
        if (class:find(allowed)) then
            allowed_item = true
        end
    end

    // Is this entity class banned for pickup?
    for _, banned in ipairs(zclib.config.Inventory.BannedItems) do
        if (class:find(banned)) then
            allowed_item = false
        end
    end

    return allowed_item == true
end

function zclib.Inventory.GetSlotData(ent,slot_id)
    //zclib.Debug("zclib.Inventory.GetSlotData")
    if slot_id == nil then return end
    if not IsValid(ent) then return end
    local inv = zclib.Inventory.Get(ent)
    return inv[slot_id]
end

function zclib.Inventory.SlotIsEmpty(ent,slot_id)
    local slot_data = zclib.Inventory.GetSlotData(ent,slot_id)
    if slot_data == nil then return true end
    return table.IsEmpty(slot_data)
end

function zclib.Inventory.GetAmount(ent,slot_id)
    local slot_data = zclib.Inventory.GetSlotData(ent,slot_id)
    if zclib.Inventory.SlotIsEmpty(ent,slot_id) then return 1 end
    return slot_data.Amount or 1
end

// Returns the first SlotID that has the specified entity class
function zclib.Inventory.FindByClass(ent,Class)
    local slot = false
    for k,v in pairs(zclib.Inventory.Get(ent)) do
        if v and v.Class == Class then
            slot = k
            break
        end
    end
    zclib.Debug("zclib.Inventory.FindItem " .. tostring(slot))
    return slot
end

// Returns the first free slot it can find
function zclib.Inventory.FindFreeSlot(ent)
    if not IsValid(ent) then return false end
    local slot = false
    for k,v in pairs(zclib.Inventory.Get(ent)) do
        if v and zclib.Inventory.SlotIsEmpty(ent,k) then
            slot = k
            break
        end
    end
    zclib.Debug("zclib.Inventory.FindFreeSlot " .. tostring(slot))
    return slot
end

function zclib.Inventory.GetEntityName(ItemEnt)
    local itemclass = ItemEnt:GetClass()

    if zclib.config.PredefinedNames[itemclass] then return zclib.config.PredefinedNames[itemclass] end

    // Is there a Item definition for that class and does it want to overwrite the name
    local DefinitionData = zclib.ItemDefinition.Get(itemclass)
    if DefinitionData and DefinitionData.Name then
        // The name can be defined as a function or as a string
        return isfunction(DefinitionData.Name) and DefinitionData.Name(ItemEnt) or DefinitionData.Name
    end

    if ItemEnt.Name then return ItemEnt.Name end

    if ItemEnt.PrintName then return ItemEnt.PrintName end

    if ItemEnt:IsWeapon() then
        local wep_list = list.Get( "Weapon" )
        if wep_list[itemclass] and wep_list[itemclass].PrintName then
            return wep_list[itemclass].PrintName
        end
    end

    return itemclass
end

/*
	Changes the entities appearance according to the defined values from the registrated item
*/
function zclib.Inventory.ApplyItemVisuals(ent,SlotData)
    if SlotData == nil then return end

    if SlotData.Health then
        ent:SetHealth(SlotData.Health)
    end

    ent:SetModel(zclib.ItemDefinition.GetModel(ent:GetClass(),SlotData))

    ent:SetSkin(zclib.ItemDefinition.GetSkin(ent:GetClass(),SlotData))

    ent:SetMaterial(zclib.ItemDefinition.GetMaterial(ent:GetClass(),SlotData))

    ent:SetColor(zclib.ItemDefinition.GetColor(ent:GetClass(),SlotData))

	for k, v in pairs(zclib.ItemDefinition.GetBodyGroups(ent:GetClass(),SlotData)) do
		ent:SetBodygroup(k, v)
	end
end


/*

    This system handels the throwing of the item

*/
// A list of entity classes which the player can throw a item to
zclib.Inventory.ThrowTargets = zclib.Inventory.ThrowTargets or {}
function zclib.Inventory.AddThrowTarget(class)
    zclib.Debug("zclib.Inventory.AddThrowTarget " .. class)
    zclib.Inventory.ThrowTargets[class] = true
end

function zclib.Inventory.IsThrowTarget(ent,from,SlotID)
    if zclib.Inventory.ThrowTargets[ent:GetClass()] == nil then return false end
    if ent.zclib_inv == nil then return false end

    // If the entity has a CanPickUp function then ask the entity if it wants this itemID
    if ent.CanPickUp then
        return ent:CanPickUp(from,SlotID)
    else
        return true
    end
end

function zclib.Inventory.GetThrowTime(from,to)
    local traveltime = from:Distance(to)
    traveltime = traveltime / 500
    return traveltime
end

if zclib.config.Inventory.PlayerInv then zclib.Inventory.AddThrowTarget("player") end

--PATH addons/zeros_methlab2/lua/zmlab2/util/cl_settings.lua:
if not CLIENT then return end

local Created = false

zmlab2 = zmlab2 or {}
zmlab2.f = zmlab2.f or {}

local function zmlab2_OptionPanel(name,desc, CPanel, cmds)
	local panel = vgui.Create("DPanel")
	panel:Dock(FILL)
	panel.Paint = function(s, w, h)
		draw.RoundedBox(4, 0, 0, w, h, zmlab2.colors["grey01"])
		zmlab2.util.DrawOutlinedBox( 0, 0, w, h, 4, zmlab2.colors["black02"])
	end
	panel:DockPadding(10,10,10,10)

	local title = vgui.Create("DLabel", panel)
	title:Dock(TOP)
	title:SetText(name)
	title:SetFont(zmlab2.GetFont("zmlab2_vgui_font03"))
	title:DockPadding(5,5,5,5)
	title:SetTextColor(zmlab2.colors["blue02"])

	if desc then
		local desc_pnl = vgui.Create("DLabel", panel)
		desc_pnl:Dock(TOP)
		desc_pnl:SetText(desc)
		//desc_pnl:SetContentAlignment(4)
		desc_pnl:SetFont(zmlab2.GetFont("zmlab2_vgui_font06"))
		desc_pnl:DockPadding(5,2,5,2)
		desc_pnl:SetTextColor(color_white)
		//desc_pnl:SetWrap(true)
		desc_pnl:SetContentAlignment(4)
		desc_pnl:SizeToContentsY( 5 )
	end

	for k, v in ipairs(cmds) do
		if v.class == "DNumSlider" then

			local item = vgui.Create("DNumSlider", panel)
			item:Dock(TOP)
			item:DockPadding(5,5,5,5)
			item:DockMargin(5,5,5,5)

			item:SetText(v.name)
			item:SetMin(v.min)
			item:SetMax(v.max)

			item:SetDecimals(v.decimal)
			item:SetDefaultValue(math.Clamp(math.Round(GetConVar(v.cmd):GetFloat(),v.decimal),v.min,v.max))
			item:ResetToDefaultValue()
			item:SetConVar( v.cmd )
			item.OnValueChanged = function(self, val)

				if Created then
					RunConsoleCommand(v.cmd, tostring(val))
				end
			end
		elseif v.class == "DCheckBoxLabel" then

			local item = vgui.Create("DCheckBoxLabel", panel)
			item:Dock(TOP)
			item:DockPadding(5,5,5,5)
			item:DockMargin(5,5,5,5)
			item:SetText( v.name )
			item:SetConVar( v.cmd )
			item.OnChange = function(self, val)
				if Created then
					if val then
						RunConsoleCommand(v.cmd, "1")
					else
						RunConsoleCommand(v.cmd, "0")
					end
				end
			end

			// 949137607
			timer.Simple(0.1, function()
				if (item) then
					item:SetValue(GetConVar(v.cmd):GetInt())
				end
			end)
		elseif v.class == "DButton" then
			local item = vgui.Create("DButton", panel)
			item:Dock(TOP)
			item:DockMargin(0,10,0,0)
			item:SetText( v.name )
			item:SetFont(zmlab2.GetFont("zmlab2_vgui_font02"))
			item:SetTextColor(color_white)
			item.Paint = function(s, w, h)
				draw.RoundedBox(4, 0, 0, w, h, zmlab2.colors["blue02"])
				if s.Hovered then
					draw.RoundedBox(4, 0, 0, w, h, zmlab2.colors["white03"])
				end
			end
			item.DoClick = function()

				if zmlab2.Player.IsAdmin(LocalPlayer()) == false then return end

				LocalPlayer():EmitSound("zmlab2_ui_click")

				if v.notify then

					notification.AddLegacy(  v.notify, NOTIFY_GENERIC, 2 )
				end
				LocalPlayer():ConCommand( v.cmd )
			end
		elseif v.class == "DColorMixer" then

			local main = vgui.Create("DPanel", panel)
			main:SetSize(200 * zmlab2.wM, 300 * zmlab2.hM)
			main:Dock(TOP)
			main:DockPadding(5, 5, 5, 5)
			main:DockMargin(5, 5, 5, 5)
			main.Paint = function(s, w, h)
				draw.RoundedBox(4, 0, 0, w, 5 * zmlab2.hM, zmlab2.colors["black02"])

				draw.RoundedBox(4, 0, h - 5 * zmlab2.hM, w, 5 * zmlab2.hM, zmlab2.colors["black02"])
			end

			local a_title = vgui.Create("DLabel", main)
			a_title:Dock(TOP)
			a_title:SetFont(zmlab2.GetFont("zmlab2_vgui_font02"))
			a_title:SetText(v.name)
			a_title:SetTextColor(color_white)
			a_title:SetContentAlignment(4)
			a_title:SizeToContentsY( 10 )

			local Mixer = vgui.Create("DColorMixer", main)
			Mixer:SetSize(200 * zmlab2.wM, 200 * zmlab2.hM)
			Mixer:Dock(FILL)
			Mixer:DockMargin(0, 5, 0, 5)
			Mixer:SetPalette(false)
			Mixer:SetAlphaBar(true)
			Mixer:SetWangs(true)

			if v.cmd[1] then Mixer:SetConVarR(v.cmd[1]) end
			if v.cmd[2] then Mixer:SetConVarG(v.cmd[2]) end
			if v.cmd[3] then Mixer:SetConVarB(v.cmd[3]) end
			if v.cmd[4] then Mixer:SetConVarA(v.cmd[4]) end

			main:InvalidateParent(true)
			main:SizeToChildren(false,true)
		end

		if v.desc then
			local desc_pnl = vgui.Create("DLabel", panel)
			desc_pnl:Dock(TOP)
			desc_pnl:DockMargin(5,5,5,5)
			desc_pnl:SetFont(zmlab2.GetFont("zmlab2_vgui_font02"))
			desc_pnl:SetText(v.desc)
			desc_pnl:SetTextColor(color_white)
			desc_pnl:SetContentAlignment(4)
			desc_pnl:SizeToContentsY( 30 )
		end
	end


	panel:InvalidateLayout(true)
	panel:SizeToChildren(true, true)

	CPanel:AddPanel(panel)
end

local function Methlab2_settings(CPanel)
	CPanel:AddControl("Header", {
		Text = "Client Settings",
	})

	zmlab2_OptionPanel("VFX","",CPanel,{
		[1] = {name = "Dynamiclight",class = "DCheckBoxLabel", cmd = "zmlab2_cl_vfx_dynamiclight"},
		[2] = {name = "Effects",class = "DCheckBoxLabel", cmd = "zmlab2_cl_particleeffects"},
	})

	/*
	zmlab2_OptionPanel("SFX",CPanel,{
		[1] = {name = "Effects Volume",class = "DNumSlider", cmd = "zmlab2_cl_sfx_volume",min = 0,max = 1,decimal = 2},
	})
	*/
end

local function Methlab2_admin_settings(CPanel)

	CPanel:AddControl("Header", {
		Text = "Admin Commands",
	})

	zmlab2_OptionPanel("Meth Buyer","This includes the Meth Buyer NPC and the\nDropOff Points.",CPanel,{
		[1] = {name = "Save",class = "DButton", cmd = "zmlab2_sellsetup_save"},
		[2] = {name = "Delete",class = "DButton", cmd = "zmlab2_sellsetup_remove"},
	})

	zmlab2_OptionPanel("Public Setup","If the config is setup correctly such that owner\nchecks are disabled then you can build a\nwhole methlab as a public utility.",CPanel,{
		[1] = {name = "Save",class = "DButton", cmd = "zmlab2_publicsetup_save"},
		[2] = {name = "Delete",class = "DButton", cmd = "zmlab2_publicsetup_remove"},
	})

	zmlab2_OptionPanel("Commands","Some usefull debug commands.",CPanel,{
		[1] = {name = "Spawn Methbag",class = "DButton", cmd = "zmlab2_debug_Meth_Test"},
		[2] = {name = "Spawn Methcrate",class = "DButton", cmd = "zmlab2_debug_Crate_Test"},
	})
end

hook.Add("AddToolMenuCategories", "zmlab2_CreateCategories", function()
	spawnmenu.AddToolCategory("Options", "zmlab2_options", "Methlab 2")
end)

hook.Add("PopulateToolMenu", "zmlab2_PopulateMenus", function()
	spawnmenu.AddToolMenuOption("Options", "zmlab2_options", "zmlab2_Settings", "Client Settings", "", "", Methlab2_settings)
	spawnmenu.AddToolMenuOption("Options", "zmlab2_options", "zmlab2_Admin_Settings", "Admin Settings", "", "", Methlab2_admin_settings)

	timer.Simple(0.2, function()
		Created = true
	end)
end)

--PATH addons/rp_advdupe2/lua/advdupe2/cl_file.lua:
local function AdvDupe2_ReceiveFile(len, ply)
	local AutoSave = net.ReadUInt(8) == 1

	net.ReadStream(nil, function(data)
		AdvDupe2.RemoveProgressBar()
		if(!data)then
			AdvDupe2.Notify("File was not saved!",NOTIFY_ERROR,5)
			return
		end
		local path
		if AutoSave then
			if(LocalPlayer():GetInfo("advdupe2_auto_save_overwrite")~="0")then
				path = AdvDupe2.GetFilename(AdvDupe2.AutoSavePath, true)
			else
				path = AdvDupe2.GetFilename(AdvDupe2.AutoSavePath)
			end
		else
			path = AdvDupe2.GetFilename(AdvDupe2.SavePath)
		end

		local dupefile = file.Open(path, "wb", "DATA")
		if(!dupefile)then
			AdvDupe2.Notify("File was not saved!",NOTIFY_ERROR,5)
			return
		end
		dupefile:Write(data)
		dupefile:Close()
		
		local errored = false
		if(LocalPlayer():GetInfo("advdupe2_debug_openfile")=="1")then
			if(not file.Exists(path, "DATA"))then AdvDupe2.Notify("File does not exist", NOTIFY_ERROR) return end
			
			local readFile = file.Open(path, "rb", "DATA")
			if not readFile then AdvDupe2.Notify("File could not be read", NOTIFY_ERROR) return end
			local readData = readFile:Read(readFile:Size())
			readFile:Close()
			local success,dupe,info,moreinfo = AdvDupe2.Decode(readData)
			if(success)then
				AdvDupe2.Notify("DEBUG CHECK: File successfully opens. No EOF errors.")
			else
				AdvDupe2.Notify("DEBUG CHECK: " .. dupe, NOTIFY_ERROR)
				errored = true
			end
		end
		
		local filename = string.StripExtension(string.GetFileFromFilename( path ))
		if(AutoSave)then
			if(IsValid(AdvDupe2.FileBrowser.AutoSaveNode))then
				local add = true
				for i=1, #AdvDupe2.FileBrowser.AutoSaveNode.Files do
					if(filename==AdvDupe2.FileBrowser.AutoSaveNode.Files[i].Label:GetText())then
						add=false
						break
					end
				end
				if(add)then
					AdvDupe2.FileBrowser.AutoSaveNode:AddFile(filename)
					AdvDupe2.FileBrowser.Browser.pnlCanvas:Sort(AdvDupe2.FileBrowser.AutoSaveNode)
				end
			end
		else
			AdvDupe2.FileBrowser.Browser.pnlCanvas.ActionNode:AddFile(filename)
			AdvDupe2.FileBrowser.Browser.pnlCanvas:Sort(AdvDupe2.FileBrowser.Browser.pnlCanvas.ActionNode)
		end
		if(!errored)then
			AdvDupe2.Notify("File successfully saved!",NOTIFY_GENERIC, 5)
		end
	end)
end
net.Receive("AdvDupe2_ReceiveFile", AdvDupe2_ReceiveFile)

local uploading = nil
function AdvDupe2.UploadFile(ReadPath, ReadArea)
	if uploading then AdvDupe2.Notify("Already opening file, please wait.", NOTIFY_ERROR) return end
	if(ReadArea==0)then
		ReadPath = AdvDupe2.DataFolder.."/"..ReadPath..".txt"
	elseif(ReadArea==1)then
		ReadPath = AdvDupe2.DataFolder.."/-Public-/"..ReadPath..".txt"
	else
		ReadPath = "adv_duplicator/"..ReadPath..".txt"
	end
	
	if(not file.Exists(ReadPath, "DATA"))then AdvDupe2.Notify("File does not exist", NOTIFY_ERROR) return end
	
	local read = file.Read(ReadPath)
	if not read then AdvDupe2.Notify("File could not be read", NOTIFY_ERROR) return end
	local name = string.Explode("/", ReadPath)
	name = name[#name]
	name = string.sub(name, 1, #name-4)
	
	local success, dupe, info, moreinfo = AdvDupe2.Decode(read)
	if(success)then
		net.Start("AdvDupe2_ReceiveFile")
		net.WriteString(name)
		uploading = net.WriteStream(read, function()
			uploading = nil
			AdvDupe2.File = nil
			AdvDupe2.RemoveProgressBar()
		end)
		net.SendToServer()
		
		AdvDupe2.LoadGhosts(dupe, info, moreinfo, name)
	else
		AdvDupe2.Notify("File could not be decoded. ("..dupe..") Upload Canceled.", NOTIFY_ERROR)
	end
end

--PATH addons/bricks_gangs/lua/bricks_server/languages/bricks_gangs/french.lua:
BRICKS_SERVER.Func.AddLanguageStrings( "french", {
    ["gang"] = "Gang",
    ["gangNew"] = "Nouveau Gang",
    ["gangRequestCooldown"] = "Veuillez patienter avant de refaire une demande!",
    ["gangRequestDataCooldown"] = "Veuillez patienter avant de refaire une demande!",
    ["gangNewUpgrade"] = "Nouvelle Amélioration",
    ["gangUpgradeTierEdit"] = "%s - Tier %d",
    ["gangNewAchievement"] = "Nouveau Succès",
    ["gangNewTerritory"] = "Nouveau Territoire",
    ["gangRewardTime"] = "Cooldown des récompenses",
    ["gangRewardTimeQuery"] = "À quelle fréquence le gang occupant doit-il recevoir des récompenses ?",
    ["gangRewards"] = "Récompenses",
    ["gangNewLeaderboard"] = "Nouveau Classement",
    ["gangRankQuery"] = "Quel rang souhaitez-vous lui attribuer ?",
    ["gangPlayerAlreadyRank"] = "Le joueur est déjà de ce rang !",
    ["gangInvalidRank"] = "Rang invalide.",
    ["gangKick"] = "Kick",
    ["gangKickConfirm"] = "Êtes-vous sûr de vouloir virer ce membre ?",
    ["gangSetOwner"] = "Mettre chef",

    ["gangInbox"] = "Boite de réception du gang",
    ["gangNoNotifications"] = "Vous n'avez pas de notification",
    ["gangTimeAgo"] = "il y a %s secondes",
    ["gangNotification"] = "Notification de gang",
    ["gangNotificationHeader"] = "Que voudriez-vous que l'en-tête de la notification soit?",
    ["gangAdminNotification"] = "Admin Notification",
    ["gangNotificationBody"] = "Que souhaitez-vous que le contenu principal de la notification soit?",
    ["gangAdminNotificationSent"] = "Vous avez envoyer une notification à %s!",

    ["gangVariables"] = "Variable de gang",
    ["gangUpgrades"] = "Amélioration de gang",
    ["gangAchievements"] = "Succès du gang",
    ["gangTerritories"] = "Territoires du gang",
    ["gangLeaderboards"] = "Classement des gangs",

    ["gangClaimedAchievement"] = "Vous avez réclamer les récompenses avec succès!",
    ["gangAlreadyAssociation"] = "Votre gang à déjà ce type d'alliance avec ce gang!",
    ["gangAlreadySentAssociation"] = "Votre gang à déjà envoyer une demande d'alliance!",
    ["gangAssociationSent"] = "Demande d'alliance envoyer!",
    ["gangAssociationAccepted"] = "Demande accepter!",
    ["gangNoAssociation"] = "Votre gang n'a aucune alliance avec ce gang!",
    ["gangAssociationDissolved"] = "Alliance dissoute!",

    ["gangOwner"] = "Chef",
    ["gangOfficer"] = "Officier",
    ["gangMember"] = "Membre",

    ["gangCannotDeposit"] = "Vous ne pouvez pas déposer cette arme!",
    ["gangStorageFullError"] = "L'entrepôt de votre gang est plein!",
    ["gangDepositedItem"] = "Vous avez déposez un item dans l'entrepôt du gang!",
    ["gangDroppedItem"] = "Vous avez sortit un objet de l'entrepôt du gang.",
    ["gangUsedItem"] = "Vous avez utiliez un objet depuis l'entrepôt du gang.",
    ["gangCantUse"] = "Vous ne pouvez pas l'utilisez!",

    ["gangKicked"] = "Vous avez été viré du gang %s!",
    ["gangAlreadyIn"] = "Vous êtes déjà dans un gang!",
    ["gangNameLength"] = "Le nom du gang ne peut être plus long que %d caractères!",
    ["gangIconLength"] = "L'URL de l'icône du gang ne peut pas être plus longue que %d caractères!",
    ["gangCreatedFor"] = "Votre nouveau gang a été créé pour %s!",
    ["gangCreated"] = "Votre nouveau gang a été créé!",
    ["gangCreationNoMoney"] = "Vous n'avez pas assez d'argent, vous avez besoin de %s!",
    ["gangWaitBeforeSaving"] = "Veuillez patienter %d quelques secondes avant de sauvegarder à nouveau vos modifications !",
    ["gangRolesUpdated"] = "Rôles du gangs mis à jour!",
    ["gangCannotTarget"] = "Vous ne pouvez pas cibler ce joueur!",
    ["gangRankNotExists"] = "Ce rang n'existe pas !",
    ["gangCantPromote"] = "Vous ne pouvez pas promouvoir quelqu'un à un rang supérieur ou égal au vôtre !",
    ["gangRankSet"] = "Rang attribué avec succès !",
    ["gangRankSetFail"] = "Impossible de fixer le rang !",
    ["gangSettingsUpdated"] = "Paramètres du gangs mis à jour !",
    ["gangPlayerKicked"] = "Vous avez viré avec succès  %s de votre gang !",
    ["gangPlayerKickError"] = "Erreur lors du renvoi du membre du gang!",
    ["gangWaitBeforeInvite"] = "Veuillez attendre 5 secondes avant d'inviter un autre joueur !",
    ["gangPlayerOffline"] = "Ce joueur n'est plus en ligne !",
    ["gangPlayerAlreadyInvited"] = "Ce joueur a déjà été invité !",
    ["gangPlayerInvited"] = "Vous avez invité  %s dans votre gang !",
    ["gangInviteReceived"] = "Vous avez été invité à rejoindre le gang %s ! Tapez !gang pour accepter.",
    ["gangLeaveCurrent"] = "Vous devez d'abord quitter votre gang actuel !",
    ["gangReachedMemberLimit"] = "Le gang a atteint sa limite de membres !",
    ["gangJoined"] = "Vous avez rejoint avec succèsle gang %s!",
    ["gangNotEnoughMoney"] = "Vous n'avez pas assez d'argent !",
    ["gangDepositedMoney"] = "Vous avez réussi à déposer %s dans votre gang !",
    ["gangWithdrewMoney"] = "Vous avez réussi à retirer  %s de votre gang !",
    ["gangDisbanded"] = "Vous avez dissous : %s!",
    ["gangOwnershipTransfered"] = "Transfert de la propriété de %s à %s réussi !",
    ["gangLeft"] = "Vous avez quitté le gang : %s!",

    ["gangTerritoryCaptured"] = "Votre gang a conquis le territoire suivant : %s!",
    ["gangIncorrectLevel"] = "Votre gang n'est pas le bon niveau pour acheter cette amélioration !",
    ["gangIncorrectGroup"] = "Vous n'êtes pas dans le bon groupe pour acheter cette amélioration !",
    ["gangUpgradeBought"] = "Amélioration achetée pour %s!",
    ["gangNotEnoughFunds"] = "Votre gang n'a pas assez de fonds pour acheter cette amélioration !",

    ["gangAddAchievement"] = "Ajouter un succès",
    ["gangNewAchievementType"] = "Quel doit être le type de ce nouveau succès ?",
    ["gangAddLeaderboard"] = "Ajouter un classement",
    ["gangNewLeaderboardType"] = "Quel devrait être le type du nouveau classement ?",
    ["gangAddTerritory"] = "Ajouter un Territoire",
    ["gangAddTier"] = "Ajouter un Tier",
    ["gangTierX"] = "Tier %d",
    ["gangNewUpgradeType"] = "Quel devrait être le type de l'amélioration?",
    ["gangNewUpgradeDesc"] = "Description de la nouvelle amélioration.",

    ["gangDepositMenu"] = "Gang - Menu de dépôt",
    ["gangDepositInventoryQuery"] = "Souhaitez-vous déposer %s de votre inventaire?",
    ["gangDepositPlayerQuery"] = "Vous voulez déposer %s depuis votre équipement?",
    ["gangNoDepositItems"] = "Vous n'avez aucun objet pouvant être déposé !",

    ["gangMenu"] = "Menu du Gang",
    ["gangNone"] = "Vous n'êtes pas dans un gang",
    ["gangID"] = "ID: %d",
    ["gangDashboard"] = "Tableau de bord",
    ["gangMembers"] = "Membres",
    ["gangStorage"] = "Stockage",
    ["gangUpgrades"] = "Améliorations",
    ["gangBalance"] = "Banque",
    ["gangAchievements"] = "Succès",
    ["gangAssociations"] = "Alliances",
    ["gangLeaderboards"] = "Classements",
    ["gangTerritories"] = "Territoires",
    ["gangRanks"] = "Rangs",
    ["gangCreate"] = "Créer un gang",
    ["gangProgress"] = "Progression: %s",

    ["gangNoneFound"] = "Aucun gang n'a été trouvé correspondant à votre recherche.",
    ["gangMemberCount"] = "%d/%d Membres",
    ["gangFailedToLoad"] = "Échec du chargement des données sur le gang!",
    ["gangSetRank"] = "Modifier le rang",
    ["gangDissolveAssociation"] = "Souhaitez-vous dissoudre cette alliance?",
    ["gangAssociationStatus"] = "Status: %s",
    ["gangNeutral"] = "Neutre",
    ["gangCreateString"] = "Créer un gang pour %s",
    ["gangName"] = "Nom du Gang:",
    ["gangIcon"] = "Icon URL:",
    
    ["gangInformation"] = "INFORMATIONS DU GANG",
    ["gangChat"] = "CHAT",
    ["gangMessage"] = "Message de gang",
    ["gangActions"] = "ACTIONS",
    ["gangDepositMoney"] = "Déposer de l'argent",
    ["gangDepositMoneyQuery"] = "Quel montant souhaitez-vous déposer ?",
    ["gangDepositMoneyLess"] = "Vous ne pouvez pas déposer moins de %s!",
    ["gangDepositMoneyMuch"] = "Votre compte de gang ne peut pas contenir autant, vous devez améliorer votre stockage d'argent !",
    ["gangWithdrawMoney"] = "Retirer de l'argent",
    ["gangWithdrawMoneyQuery"] = "Quel montant souhaitez-vous retirer ?",
    ["gangWithdrawMoneyLess"] = "Vous ne pouvez pas retirer moins de %s!",
    ["gangWithdrawMoneyMuch"] = "Votre gang n'a pas assez de fonds!",
    ["gangInvitePlayer"] = "Inviter un joueur",
    ["gangInvitePlayerQuery"] = "Quel joueur souhaitez-vous inviter ?",
    ["gangDisband"] = "Dissoudre le gang",
    ["gangDisbandQuery"] = "La suppression de votre gang ne peut pas être annulée, tapez %s pour la supprimer.",
    ["gangTransfer"] = "Transfert de propriété",
    ["gangTransferQuery"] = "À qui souhaitez-vous transférer la propriété du gang?",
    ["gangLeave"] = "Quitter le gang",
    ["gangLeaveQuery"] = "Êtes-vous sûr de vouloir quitter ce gang ?",
    ["gangMemberUpper"] = "MEMBRES DU GANG",
    ["gangHighestRank"] = "Rang le plus élevé",
    ["gangLowestRank"] = "Rang le plus bas",

    ["gangUnsavedChanges"] = "Attention ! Vous avez des modifications non sauvegardées.",
    ["gangSaveChanges"] = "Enregistrer les modifications",
    ["gangReset"] = "Reset",
    ["gangRanksUpper"] = "RANGS",
    ["gangNewRank"] = "Nouveau rang",
    ["gangRankName"] = "Nom du Rang",
    ["gangRankColor"] = "Couleur",
    ["gangClearPerms"] = "Nettoyer les permissions",
    ["gangDeleteRank"] = "Supprimer le rang",
    ["gangDeleteRankQuery"] = "Êtes-vous sûr de vouloir supprimer ce rang ?",

    ["gangStorageUpper"] = "STOCKAGE",
    ["gangStorageProgress"] = "Stockage %d/%d",
    ["gangClaimed"] = "Déjà Réclamé",
    ["gangUnclaimed"] = "Disponible",
    ["gangClaimedAgo"] = "Réclamé il y a %s secondes",
    ["gangRewardsEvery"] = "Donner toutes les %s secondes",
    ["gangBuyUpgrade"] = "Voulez-vous acheter cette amélioration pour %s?",
    ["gangUpgradeTier"] = "Tier d'amélioration %d/%d",
    ["gangCurrent"] = "Tier actuel: %s",
    ["gangNext"] = "Prochain tier: %s",

    ["gangTerritoryUpper"] = "TERRITOIRE",
    ["gangCaptured"] = "CAPTURÉ",
    ["gangTerritoryAlready"] = "Votre gang a déjà conquis ce territoire !",
    ["gangCaptureFail"] = "Vous vous êtes trop éloigné ou vous êtes mort, la capture a échoué !",
    ["gangTerritoryPlaced"] = "Territoire placé avec succès.",
    ["gangInvalidTerritory"] = "Territoire non valide, choisissez un territoire valide dans le menu outil.",
    ["gangTerritoryRemoved"] = "Territoire retiré avec succès.",
    ["gangTerritoryRemoveFail"] = "Vous ne pouvez utiliser cet outil que pour supprimer/créer un territoire.",
    ["gangTerritoryDesc"] = "Placer et retirer des territoires du serveur, Clic gauche - placer, Clic droit - retirer.",
    ["gangTerritory"] = "Territoire",
    ["gangTerritoryPlacer"] = "Outil de territoire",
    ["gangTerritoryDescSmall"] = "Placer et supprimer des territoires",
    ["gangTerritoryInstructions"] = "Clic gauche - placer, Clic droit - supprimer.",

    ["gangSettings"] = "Paramètres",
    ["gangManagement"] = "Gestion",
    ["gangChatLower"] = "Chat du gang",
    ["gangDepositItems"] = "Déposer des objets",
    ["gangWithdrawItems"] = "Retirer des objets",
    ["gangViewStorage"] = "Voir le stockage",
    ["gangEditRoles"] = "Modifier les rôles",
    ["gangEditSettings"] = "Modifier les paramètres",
    ["gangInvitePlayers"] = "Inviter des joueurs",
    ["gangKickPlayers"] = "Exclure des joueurs",
    ["gangChangeRank"] = "Changer le rang des joueurs",
    ["gangPurchaseUpgrades"] = "Acheter des améliorations",
    ["gangAcceptDeclineInbox"] = "Accepter/décliner les notifications",
    ["gangAssociationSend"] = "Envoyer des demandes d'alliance",
    ["gangAssociationAccept"] = "Accepter des demandes d'alliance",
    ["gangSendChatMessages"] = "Envoyer un message dans le chat",
    ["gangMaxMembers"] = "Nombre de membres maximum",
    ["gangMaxBalance"] = "Argent maximum dans la banque",
    ["gangStorageSlots"] = "Slots de stockages",
    ["gangXSlots"] = "%d Slots",
    ["gangSlots"] = "Slots",
    ["gangIncreasedHealth"] = "Une santé accrue",
    ["gangExtraHealth"] = "Santé supplémentaire",
    ["gangXHP"] = "+%d HP",
    ["gangIncreasedArmor"] = "Un blindage renforcé",
    ["gangXAP"] = "+%d AP",
    ["gangExtraArmor"] = "Armure supplémentaire",
    ["gangIncreasedSalary"] = "Augmentation du salaire",
    ["gangExtraSalary"] = "Salaire supplémentaire",
    ["gangPermWeapon"] = "Arme permanente",
    ["gangWeapon"] = "Arme",
    ["gangBalanceFull"] = "Banque du gang",
    ["gangMembersFull"] = "Membres du gang",
    ["gangStorageFull"] = "Stockage du gang",
    ["gangItems"] = "Items",
    ["gangItem"] = "Item",
    ["gangLevel"] = "Level du gang",
    ["gangInvite"] = "Invitations",
    ["gangInviteReceivedInbox"] = "Vous avez été invité à rejoindre le gang %s !",
    ["gangAssociationInvite"] = "Demandes d'alliance",
    ["gangAssociationInviteInbox"] = "Le gang %s a demandé une alliance %s avec votre gang!",
    ["gangAssociationCreated"] = "Alliance créée",
    ["gangAssociationCreatedInbox"] = "Votre gang a maintenant en alliance %s avec le gang %s !",
    ["gangAssociationDissolved"] = "Alliance dissoute",
    ["gangAssociationDissolvedInbox"] = "Votre alliance avec le gang %s a été dissoute!",
    ["gangInboxAchievement"] = "Succès",
    ["gangInboxAchievementCompleted"] = " Votre gang a accomplis le succès '%s!",
    ["gangInboxAchievementCompletedReward"] = "Votre gang a accomplis le succès '%s', récompenses : %s!",
    ["gangExperienceFull"] = "Expérience du Gang",
    ["gangJobWhitelist"] = "Job Whitelist",
    ["gangJobs"] = "Jobs",
    ["gangJobsSelect"] = "Sélectionnez les métiers dont les joueurs sont inscrits sur la whitelist.",
    ["gangStorageItems"] = "Objets de stockage",
    ["gangAllyRequest"] = "Êtes-vous sûr de vouloir demander à vous allier à ce gang?",
    ["gangWarRequest"] = "Êtes-vous sûr de vouloir demander une guerre avec ce gang?",
    ["gangSetLevel"] = "Set Level",
    ["gangSetLevelQuery"] = "Quel devrait être le nouveau niveau du gang ?",
    ["gangSetLevelMsg"] = "Vous avez réussi à fixer le niveau du gang %s à %d!",
    ["gangAddExperience"] = "Ajouter de l'expérience",
    ["gangAddExperienceQuery"] = "Combien d'expérience souhaitez-vous ajouter au gang?",
    ["gangAddExperienceMsg"] = "Vous avez ajouter %s  d'expérience au gang %s!",
    ["gangSetBalance"] = "Changer le solde ",
    ["gangSetBalanceQuery"] = "Quel devrait être le nouveau solde de la banque du gang ??",
    ["gangSetBalanceMsg"] = "Vous avez réussi à mettre à jour le solde de %s du gang %s!",
    ["gangAddBalance"] = "Ajouter de l'argent",
    ["gangAddBalanceQuery"] = "Combien d'argent souhaitez-vous ajouter au solde du gang?",
    ["gangAddBalanceMsg"] = "Vous avez ajouté %s au solde du gang %s!",
    ["gangViewMembers"] = "Voir les membres",
    ["gangCantKickOwner"] = "Vous ne pouvez pas donner exclure le propriétaire du gang!",
    ["gangKickSuccessAdmin"] = "Vous avez exclus le membre du gang!",
    ["gangKickFailAdmin"] = "Impossible d'exclure le membre du gang!",
    ["gangSetRankSuccessAdmin"] = "Vous avez mis à jour le rang de ce membre!",
    ["gangSetRankFailAdmin"] = "Impossible de changer le rang de ce membre!",
    ["gangMemberAlreadyOwner"] = "Ce membre est déjà le propriétaire de ce gang!",
    ["gangNotMember"] = "Ce joueur n'est pas membre du gang!",
    ["gangOwnershipTransferedAdmin"] = "Vous avez transférer le rôle de chef du gang!",
    ["gangDeleteAdminQuery"] = "La suppression d'un gang ne peut pas être annulée, tapez %s pour le supprimer.",
    ["gangDeleteSuccessAdmin"] = "Vous avez supprimer le gang %s!",
    ["gangMenuBind"] = "Touche pour le menu des gangs",
} )
--PATH addons/bricks_gangs/lua/bricks_server/languages/bricks_gangs/polish.lua:
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
--PATH addons/brick_s_server_framework/lua/bricks_server/languages/bricks_server/german.lua:
BRICKS_SERVER.Func.AddLanguageStrings( "german", {
    ["search"] = "Suchen",
    ["invalidPlayerProfile"] = "Ungültiges Spielerprofil aufgerufen",
    ["unbound"] = "UNBOUND",
    ["themes"] = "Themes",
    ["groups"] = "Gruppen",
    ["general"] = "Generell",
    ["itemWhitelisting"] = "Item Whitelisting",
    ["rarities"] = "Besonderheiten",
    ["languages"] = "Sprachen",
    ["disabled"] = "Deaktiviert",
    ["enabled"] = "Aktiviert",
    ["purchase"] = "Kauf",
    ["profile"] = "Profil",
    ["view"] = "Ansehen",
    ["admin"] = "Admin",
    ["noToolPermission"] = "Du hast nicht die nötigen Rechte, um dieses Tool zu nutzen.",
    ["settings"] = "Einstellungen",
    ["players"] = "Spieler",
    ["modules"] = "Module",

    ["userGroupEditor"] = "Spielergruppen Bearbeitung",
    ["addNewGroup"] = "Neue Gruppe hinzufügen",
    ["newUserGroup"] = "Was soll die neue Benutzergruppe sein?",
    ["groupName"] = "Gruppenname",

    ["custom"] = "Benutzerdefiniert",
    ["addNew"] = "Neue hinzufügen",
    ["material"] = "Material",
    ["directImage"] = "Gebe einen direkten Link zum Bild an",
    ["default"] = "Standard",
    ["selectMaterial"] = "Du musst ein Material angeben",

    ["errorNoText"] = "ERROR: KEIN TEXT",
    ["selectOption"] = "Wähle eine Option",
    ["selectValue"] = "Bitte wähle einen Wert.",
    ["selectColor"] = "Bitte wähle eine Farbe.",
    ["configSaved"] = "Config gespeichert!",
    ["cmdNoPermission"] = "Du hast nicht die nötigen Rechte, um diesen Command zu benutzen.",
    ["entityPosUpdated"] = "Entitypositionen aktualisiert.",
    ["noEntitiesSpawned"] = "Es wurden keine Entities gespawnt.",
    ["xEntitiesSpawned"] = "%d gespeicherten Entities wurden gespeichert.",
    ["error"] = "ERROR",

    ["seconds"] = "%d Sekunden",
    ["second"] = "%d Sekunde",
    ["minutes"] = "%d Minuten",
    ["minute"] = "%d Minute",
    ["hours"] = "%d Stunden",
    ["hour"] = "%d Stunde",

    ["noRarity"] = "Keine Besonderheit",

    ["config"] = "Config",
    ["edit"] = "Bearbeiten",
    ["editColor"] = "Bearbeite Farbe",
    ["editName"] = "Bearbeite Name",
    ["remove"] = "Entfernen",
    ["name"] = "Name",
    ["description"] = "Beschreibung",
    ["model"] = "Model",
    ["icon"] = "Icon",
    ["type"] = "Typ",
    ["price"] = "Preis",
    ["group"] = "Gruppe",
    ["category"] = "Kategorie",
    ["color"] = "Farbe",
    ["invalidType"] = "Ungültiger Typ",
    ["invalidOption"] = "Ungültige Option.",
    ["invalidChoice"] = "Ungültige Auswahl.",
    ["invalidGroup"] = "Ungültige Gruppe.",
    ["invalidPlayer"] = "Ungültiger Spieler.",
    ["true"] = "WAHR",
    ["false"] = "FALSCH",
    ["noDescription"] = "Keine Beschreibung",
    ["other"] = "Anderes",
    ["completed"] = "Fertig",
    ["close"] = "Schließen",
    ["main"] = "Haupt",
    
    ["valueQuery"] = "Was soll %s sein?",
    ["dataValueQuery"] = "Welche Dateien sollen das sein?",
    ["newNameQuery"] = "Was soll der neue Name sein?",
    ["newDescriptionQuery"] = "Was soll die neue Beschreibung sein?",
    ["newModelQuery"] = "Was soll das neue Model sein?",
    ["newIconQuery"] = "Was soll das neue Bild sein?",
    ["newColorQuery"] = "Was soll die neue Farbe sein?",
    ["npcTypeQuery"] = "Welche Art soll der NPC sein?",
    ["newTypeQuery"] = "Was soll die neue Art sen?",
    ["groupRequirementQuery"] = "Was soll die Gruppenanforderung sein?",
    ["levelRequirementQuery"] = "Was soll die Levelanforderung sein?",
    ["newPriceQuery"] = "Was soll der neue Preis sein?",
    ["newCategoryQuery"] = "Was soll die neue Kategorie sein?",

    ["npcEditor"] = "NPC Bearbeiter",
    ["addNPC"] = "Füge NPC hinzu",
    ["newNPC"] = "Neuer NPC",

    ["ok"] = "OK",
    ["cancel"] = "Aufheben",
    ["save"] = "Speichern",
    ["confirm"] = "Bestätigen",
    ["nil"] = "NIL",
    ["none"] = "Nichts",
    ["selected"] = "Ausgewählt",
    ["unselected"] = "Nicht ausgewählt",
    ["add"] = "Hinzufügen",

    ["shootyStick"] = "Ein schießender Stock!",
    ["permanent"] = "Permanent",
    ["tierX"] = "(Stufe %d)",
    ["someDescription"] = "Mögliche Beschreibung",
    ["invalidNPC"] = "BRICKS SERVER ERROR: Ungültiger NPC",

    ["disconnected"] = "Disconnected",
    ["profileView"] = "Profilansicht",
    ["loading"] = "Laden",
    ["statistics"] = "Statistiken",
    ["steamID64"] = "SteamID64",
    ["donationRank"] = "Untersützer-Rang",
    ["staffRank"] = "Teamrang",
    ["currentJob"] = "Aktueller Job",
    ["wallet"] = "Brieftasche",
    ["level"] = "Level",
    ["levelX"] = "Level %d",
    ["experience"] = "Erfahrung",
    ["exp"] = "EXP",
    ["money"] = "Geld",
    ["playerLogs"] = "Spielerlogs",
    ["deleteLogs"] = "Lösche Logs",
    ["xLogs"] = "%d Logs",
    ["xAdminGroups"] = "%d Admingruppen",
    ["noUserGroups"] = "Keine Spielergruppen",
    ["userGroups"] = "Spielergruppen: %s",
    ["editUserGroups"] = "Bearbeite Spielergruppen",
    ["newGroupColor"] = "Was soll die neue Gruppenfarbe sein?",
    ["newGroupName"] = "Was soll der neue Gruppenname sein?",
    ["groupAlreadyExists"] = "Diese Gruppe existiert bereits!",
    ["whitelist"] = "Whitelist",
    ["unWhitelist"] = "UnWhitelist",
    ["addCustom"] = "Füge etwas eigenes hinzu",
    ["entClassWhitelist"] = "Welche Entitie-Klasse möchtest du zur Whitelist hinzufügen?",
    ["entClassAlreadyOnList"] = "Diese Entitie-Klasse ist bereits auf der Whitelist.",
    ["changesServerRestart"] = "Einige Änderungen werden erst nach einem Serverneustart verfügbar sein!",
    ["comingSoon"] = "Kommt bald!",
    ["features"] = "FEATURES",
    ["addNewRarity"] = "Füge eine neue Besonderheit hinzu",
    ["newRarity"] = "Neue Besonderheit",
    ["needToAddRarity"] = "Du musst zuerst eine Besonderheits-Art hinzufügen",
    ["whatRarityItem"] = "Welche Besonderheit soll dieses Item haben?",
    ["invalidRarity"] = "Ungültige Besonderheitsgruppe.",
    ["rarityAlreadyExists"] = "Es existiert bereits eine Besonderheit mit diesem Namen!",
    ["themeColorX"] = "Theme - Farbe %d",
    ["themeTextColor"] = "Theme - Textfarbe",
    ["presetAccents"] = "Preset accents",
    ["presetBackgrounds"] = "Hintergründe zurücksetzen",
    ["resetToBaseThemes"] = "Standardtheme zurücksetzen",
    ["resetToCurrentThemes"] = "Auf aktuelle Themes zurücksetzen",
    ["toggle"] = "Umschalten",
    ["menu"] = "Menü",
    ["emptyValue"] = "LEERER WERT",
    ["newValueQuery"] = "Was soll der neue Wert sein?",
    ["pressKey"] = "DRÜCKE EINE TASTE",

    ["entityPlacer"] = "Entitie-Platzierer",
    ["invalidEntityType"] = "Ungültige Entitie-Art ausgewählt, wähle eine gültige aus dem Toolmenü",
    ["entityPlaced"] = "Entitie erfolgreich platziert.",
    ["entityRemoved"] = "Entitie erfolgreich entfernt.",
    ["canOnlyUseToolEntity"] = "Du kannst dieses Tool nur zum Entfernen/Erstellen von Entites nutzen.",
    ["entityType"] = "Entity-Art",
    ["entityPlacerDescription"] = "Platziert und entfernt Entites von Bricks Servers und speichert deren Positionen. Linksklick: Platzieren | Rechtsklick: Entfernen.",
    ["entityPlacerDescriptionSmall"] = "Platziert und entfernt Entities",
    ["entityPlacerInstructions"] = "Linksklick - Platzieren, Rechtsklick - Entfernen.",

    ["npcPlacer"] = "NPC-Platzierer",
    ["npcPlaced"] = "NPC erfolgreich platziert.",
    ["invalidNPCType"] = "Ungültige NPC-Art ausgewählt, wähle eine gültige aus dem Toolmenü.",
    ["npcRemoved"] = "NPC erfolgreich entfernt.",
    ["errorNotNPC"] = "Du kannst diese Tool nur zum Platzieren/Entfernen von NPCs verwenden..",
    ["npcPlacerDescription"] = "Platziert und entfernt NPCs von Bricks Servers und speichert deren Positionen. Linksklick: Platzieren | Rechtsklick: Entfernen.",
    ["npcPlacerDescriptionSmall"] = "Platziert und Entfernt NPCs von Bricks Servers.",

    ["inventory"] = "Inventar",
    ["player"] = "Spieler",
    ["drop"] = "Fallen lassen",
    ["use"] = "Benutzen",
    ["dropAll"] = "Alles fallen lassen",
    ["delete"] = "Löschen",
} )
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
--PATH addons/brick_s_server_framework/lua/bricks_server/core/shared/sh_player.lua:
BRICKS_SERVER.PLAYERMETA = {}
BRICKS_SERVER.PLAYERMETA.__index = BRICKS_SERVER.PLAYERMETA

local playerMeta = FindMetaTable( "Player" )

function playerMeta:BRS()
	if( SERVER ) then
		if( not self ) then return false end

		if( not self.BRS_PLAYERMETA ) then
			self.BRS_PLAYERMETA = {
				Player = self
			}

			setmetatable( self.BRS_PLAYERMETA, BRICKS_SERVER.PLAYERMETA )
		end

		return self.BRS_PLAYERMETA
	else
		return BRICKS_SERVER.LOCALPLYMETA
	end
end

-- GENERAL FUNCTIONS --
function BRICKS_SERVER.PLAYERMETA:GetUserID()
	return self.UserID or 0
end
--PATH addons/brick_s_server_framework/lua/bricks_server/core/client/cl_config_popups.lua:
function BRICKS_SERVER.Func.CreateGroupEditor( defaultGroups, onSave, onCancel, swap )
	BS_GROUP_EDITOR = vgui.Create( "DFrame" )
	BS_GROUP_EDITOR:SetSize( ScrW(), ScrH() )
	BS_GROUP_EDITOR:Center()
	BS_GROUP_EDITOR:SetTitle( "" )
	BS_GROUP_EDITOR:ShowCloseButton( false )
	BS_GROUP_EDITOR:SetDraggable( false )
	BS_GROUP_EDITOR:MakePopup()
	BS_GROUP_EDITOR:SetAlpha( 0 )
	BS_GROUP_EDITOR:AlphaTo( 255, 0.1, 0 )
	BS_GROUP_EDITOR.Paint = function( self2 ) 
		BRICKS_SERVER.Func.DrawBlur( self2, 4, 4 )
	end

	local backPanel = vgui.Create( "DPanel", BS_GROUP_EDITOR )
	backPanel.Paint = function( self2, w, h ) 
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )
		draw.RoundedBox( 5, 1, 1, w-2, h-2, BRICKS_SERVER.Func.GetTheme( 2 ) )
	end

	local groupsTable = table.Copy( defaultGroups )
	local textArea

	function backPanel.FillGroups()
		backPanel:Clear()

		textArea = vgui.Create( "DPanel", backPanel )
		textArea:Dock( TOP )
		textArea:DockMargin( 10, 10, 10, 0 )
		textArea:SetTall( 30 )
		textArea.Paint = function( self2, w, h ) 
			draw.SimpleText( BRICKS_SERVER.Func.L( "userGroupEditor" ), "BRICKS_SERVER_Font20", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end

		for k, v in pairs( groupsTable ) do
			local actionButtonBack = vgui.Create( "DPanel", backPanel )
			actionButtonBack:Dock( TOP )
			actionButtonBack:DockMargin( 10, 10, 10, 0 )
			actionButtonBack:SetTall( 40 )
			actionButtonBack.Paint = function() end

			local actionButtonDelete = vgui.Create( "DButton", actionButtonBack )
			actionButtonDelete:SetText( "" )
			actionButtonDelete:Dock( RIGHT )
			actionButtonDelete:DockMargin( 5, 0, 0, 0 )
			actionButtonDelete:SetWide( actionButtonBack:GetTall() )
			local changeAlpha = 0
			local deleteMat = Material( "materials/bricks_server/delete.png" )
			actionButtonDelete.Paint = function( self2, w, h )
				if( self2:IsDown() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
				elseif( self2:IsHovered() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
				else
					changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
				end
				
				draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.DEVCONFIG.BaseThemes.Red )
		
				surface.SetAlphaMultiplier( changeAlpha/255 )
					draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkRed )
				surface.SetAlphaMultiplier( 1 )

				surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
				surface.SetMaterial( deleteMat )
				local iconSize = h*0.65
				surface.DrawTexturedRect( (h-iconSize)/2, (h/2)-(iconSize/2), iconSize, iconSize )
			end
			actionButtonDelete.DoClick = function()
				if( isnumber( k ) ) then
					table.remove( groupsTable, k )
				else
					groupsTable[k] = nil
				end

				backPanel.FillGroups()
			end

			local actionButton = vgui.Create( "DPanel", actionButtonBack )
			actionButton:Dock( FILL )
			actionButton.Paint = function( self2, w, h )
				draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

				draw.SimpleText( ((not swap and v) or k), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			end
		end

		local newGroupButton = vgui.Create( "DButton", backPanel )
		newGroupButton:SetText( "" )
		newGroupButton:Dock( TOP )
		newGroupButton:DockMargin( 10, 10, 10, 0 )
		newGroupButton:SetTall( 40 )
		local changeAlpha = 0
		newGroupButton.Paint = function( self2, w, h )
			if( self2:IsDown() ) then
				changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
			elseif( self2:IsHovered() ) then
				changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
			else
				changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
			end
			
			draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
	
			surface.SetAlphaMultiplier( changeAlpha/255 )
				draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
			surface.SetAlphaMultiplier( 1 )

			draw.SimpleText( BRICKS_SERVER.Func.L( "addNewGroup" ), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
		newGroupButton.DoClick = function()
			BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newUserGroup" ), BRICKS_SERVER.Func.L( "groupName" ), function( text ) 
				if( not swap ) then
					table.insert( groupsTable, text )
				else
					groupsTable[text] = true
				end
				backPanel.FillGroups()
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
		end

		local buttonPanel = vgui.Create( "DPanel", backPanel )
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
			if( self2:IsHovered() ) then
				changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
			else
				changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
			end
			
			draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.DEVCONFIG.BaseThemes.Green )
	
			surface.SetAlphaMultiplier( changeAlpha/255 )
			draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkGreen )
			surface.SetAlphaMultiplier( 1 )
	
			draw.SimpleText( BRICKS_SERVER.Func.L( "save" ), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
		leftButton.DoClick = function()
			onSave( groupsTable )
	
			BS_GROUP_EDITOR:AlphaTo( 0, 0.1, 0, function()
				if( IsValid( BS_GROUP_EDITOR ) ) then
					BS_GROUP_EDITOR:Remove()
				end
			end )
		end
	
		local rightButton = vgui.Create( "DButton", buttonPanel )
		rightButton:Dock( RIGHT )
		rightButton:SetText( "" )
		rightButton:DockMargin( 0, 0, 0, 0 )
		local changeAlpha = 0
		rightButton.Paint = function( self2, w, h )
			if( self2:IsHovered() ) then
				changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
			else
				changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
			end
			
			draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.DEVCONFIG.BaseThemes.Red )
	
			surface.SetAlphaMultiplier( changeAlpha/255 )
			draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkRed )
			surface.SetAlphaMultiplier( 1 )
	
			draw.SimpleText( BRICKS_SERVER.Func.L( "cancel" ), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
		rightButton.DoClick = function()
			onCancel()
	
			BS_GROUP_EDITOR:AlphaTo( 0, 0.1, 0, function()
				if( IsValid( BS_GROUP_EDITOR ) ) then
					BS_GROUP_EDITOR:Remove()
				end
			end )
		end
	
		backPanel:SetSize( (2*10)+(2*150)+80, buttonPanel:GetTall()+(5*10)+textArea:GetTall()+((table.Count( groupsTable ) or 10)*50)+newGroupButton:GetTall() )
		backPanel:Center()
	
		leftButton:SetWide( (backPanel:GetWide()-30)/2 )
		rightButton:SetWide( (backPanel:GetWide()-30)/2 )
	end
	backPanel.FillGroups()
end

function BRICKS_SERVER.Func.CreateTeamSelector( defaultTable, subtitle, saveFunc )
	local frameBack = vgui.Create( "DFrame" )
	frameBack:SetSize( ScrW(), ScrH() )
	frameBack:Center()
	frameBack:SetTitle( "" )
	frameBack:ShowCloseButton( false )
	frameBack:SetDraggable( false )
	frameBack:MakePopup()
	frameBack:SetAlpha( 0 )
	frameBack:AlphaTo( 255, 0.1, 0 )
	frameBack.Paint = function( self2 ) 
		BRICKS_SERVER.Func.DrawBlur( self2, 4, 4 )
	end

	local teamsTableCopy = table.Copy( defaultTable )

	local backPanel = vgui.Create( "DPanel", frameBack )
	backPanel:SetSize( ScrW()*0.4, 0 )
	backPanel.Paint = function( self2, w, h ) 
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )
		draw.RoundedBox( 5, 1, 1, w-2, h-2, BRICKS_SERVER.Func.GetTheme( 2 ) )
	end

	local textArea = vgui.Create( "DPanel", backPanel )
	textArea:Dock( TOP )
	textArea:DockMargin( 10, 10, 10, 0 )
	textArea:SetTall( 30 )
	textArea.Paint = function( self2, w, h ) 
		draw.SimpleText( subtitle, "BRICKS_SERVER_Font20", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local chooserBack = vgui.Create( "bricks_server_scrollpanel", backPanel )
	chooserBack:Dock( TOP )
	chooserBack:DockMargin( 10, 10, 10, 0 )
	chooserBack:SetTall( ScrH()*0.4 )
	chooserBack.Paint = function() end
	
	local spacing = 5
	local gridWide = backPanel:GetWide()-20
    local wantedSlotSize = 135
    local slotsWide = math.floor( gridWide/wantedSlotSize )
	local slotSize = (gridWide-((slotsWide-1)*spacing))/slotsWide

	local chooserLayout = vgui.Create( "DIconLayout", chooserBack )
    chooserLayout:Dock( FILL )
    chooserLayout:SetSpaceY( spacing )
	chooserLayout:SetSpaceX( spacing )
	
	function backPanel.RefreshTeams()
		chooserLayout:Clear()
		
		for k, v in pairs( RPExtraTeams ) do
			local materialEntry = chooserLayout:Add( "DButton" )
			materialEntry:SetSize( slotSize, slotSize )
			materialEntry:SetText( "" )
			local changeAlpha = 0
			local name = util.CRC( k )
			local icon
			materialEntry.Paint = function( self2, w, h )
				if( teamsTableCopy[v.command] ) then
					draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 4 ) )
				else
					draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
				end

				if( icon:IsDown() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 150 )
				elseif( icon:IsHovered() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 95 )
				else
					changeAlpha = math.Clamp( changeAlpha-10, 0, 95 )
				end

				surface.SetAlphaMultiplier( changeAlpha/255 )
				draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
				surface.SetAlphaMultiplier( 1 )

				if( string.len( v.name ) > 16 ) then
					draw.SimpleText( string.sub( v.name, 1, 16 ) .. "...", "BRICKS_SERVER_Font20", w/2, h-5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
				else
					draw.SimpleText( v.name, "BRICKS_SERVER_Font20", w/2, h-5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
				end
			end

			icon = vgui.Create( "DModelPanel", materialEntry )
			icon:Dock( FILL )
			icon:DockMargin( 0, 0, 0, 30 )
			if( istable( v.model ) ) then
				icon:SetModel( v.model[1] )
			else
				icon:SetModel( v.model )
			end
			function icon:LayoutEntity( Entity ) return end

			icon.DoClick = function()
				if( teamsTableCopy[v.command] ) then
					teamsTableCopy[v.command] = nil
				else
					teamsTableCopy[v.command] = true
				end
			end
		end

		chooserLayout:PerformLayout()
		chooserBack:Rebuild()
	end
	backPanel.RefreshTeams()

	local buttonPanel = vgui.Create( "DPanel", backPanel )
	buttonPanel:Dock( BOTTOM )
	buttonPanel:DockMargin( 10, 0, 10, 10 )
	buttonPanel:SetTall( 40 )
	buttonPanel.Paint = function( self2, w, h ) end

	local leftButton = vgui.Create( "DButton", buttonPanel )
	leftButton:Dock( LEFT )
	leftButton:SetText( "" )
	leftButton:DockMargin( 0, 0, 0, 0 )
	surface.SetFont( "BRICKS_SERVER_Font25" )
	local textX, textY = surface.GetTextSize( BRICKS_SERVER.Func.L( "confirm" ) )
	textX = textX+20
	leftButton:SetWide( math.max( (ScrW()/2560)*150, textX ) )
	local changeAlpha = 0
	leftButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end
		
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 4 ) )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( BRICKS_SERVER.Func.L( "confirm" ), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	leftButton.DoClick = function()
		saveFunc( teamsTableCopy )
		frameBack:AlphaTo( 0, 0.1, 0, function()
			if( IsValid( frameBack ) ) then
				frameBack:Remove()
			end
		end )
	end

	local rightButton = vgui.Create( "DButton", buttonPanel )
	rightButton:Dock( RIGHT )
	rightButton:SetText( "" )
	rightButton:DockMargin( 0, 0, 0, 0 )
	surface.SetFont( "BRICKS_SERVER_Font25" )
	local textX, textY = surface.GetTextSize( BRICKS_SERVER.Func.L( "cancel" ) )
	textX = textX+20
	rightButton:SetWide( math.max( (ScrW()/2560)*150, textX ) )
	local changeAlpha = 0
	rightButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end
		
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 4 ) )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( BRICKS_SERVER.Func.L( "cancel" ), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	rightButton.DoClick = function()
		frameBack:AlphaTo( 0, 0.1, 0, function()
			if( IsValid( frameBack ) ) then
				frameBack:Remove()
			end
		end )
	end

	backPanel:SetSize( backPanel:GetWide(), buttonPanel:GetTall()+(4*10)+textArea:GetTall()+chooserBack:GetTall()+10 )
	backPanel:Center()
end

function BRICKS_SERVER.Func.CreateShipmentSelector( defaultTable, subtitle, saveFunc )
	local frameBack = vgui.Create( "DFrame" )
	frameBack:SetSize( ScrW(), ScrH() )
	frameBack:Center()
	frameBack:SetTitle( "" )
	frameBack:ShowCloseButton( false )
	frameBack:SetDraggable( false )
	frameBack:MakePopup()
	frameBack:SetAlpha( 0 )
	frameBack:AlphaTo( 255, 0.1, 0 )
	frameBack.Paint = function( self2 ) 
		BRICKS_SERVER.Func.DrawBlur( self2, 4, 4 )
	end

	local shipmentsTableCopy = table.Copy( defaultTable )

	for k, v in pairs( shipmentsTableCopy ) do
		local found, foundKey = DarkRP.getShipmentByName( k )

		if( not found ) then
			shipmentsTableCopy[k] = nil
		end
	end

	local backPanel = vgui.Create( "DPanel", frameBack )
	backPanel:SetSize( ScrW()*0.4, 0 )
	backPanel.Paint = function( self2, w, h ) 
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )
		draw.RoundedBox( 5, 1, 1, w-2, h-2, BRICKS_SERVER.Func.GetTheme( 2 ) )
	end

	local textArea = vgui.Create( "DPanel", backPanel )
	textArea:Dock( TOP )
	textArea:DockMargin( 10, 10, 10, 0 )
	textArea:SetTall( 30 )
	textArea.Paint = function( self2, w, h ) 
		draw.SimpleText( subtitle, "BRICKS_SERVER_Font20", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local chooserBack = vgui.Create( "bricks_server_scrollpanel", backPanel )
	chooserBack:Dock( TOP )
	chooserBack:DockMargin( 10, 10, 10, 0 )
	chooserBack:SetTall( ScrH()*0.4 )
	chooserBack.Paint = function() end
	
	local spacing = 5
	local gridWide = backPanel:GetWide()-20
    local wantedSlotSize = 135
    local slotsWide = math.floor( gridWide/wantedSlotSize )
	local slotSize = (gridWide-((slotsWide-1)*spacing))/slotsWide

	local chooserLayout = vgui.Create( "DIconLayout", chooserBack )
    chooserLayout:Dock( FILL )
    chooserLayout:SetSpaceY( spacing )
	chooserLayout:SetSpaceX( spacing )
	
	function backPanel.RefreshTeams()
		chooserLayout:Clear()
		
		for k, v in pairs( CustomShipments ) do
			local materialEntry = chooserLayout:Add( "DButton" )
			materialEntry:SetSize( slotSize, slotSize )
			materialEntry:SetText( "" )
			local changeAlpha = 0
			local name = util.CRC( k )
			local icon
			materialEntry.Paint = function( self2, w, h )
				if( shipmentsTableCopy[v.name] ) then
					draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 4 ) )
				else
					draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
				end

				if( icon:IsDown() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 150 )
				elseif( icon:IsHovered() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 95 )
				else
					changeAlpha = math.Clamp( changeAlpha-10, 0, 95 )
				end

				surface.SetAlphaMultiplier( changeAlpha/255 )
				draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
				surface.SetAlphaMultiplier( 1 )

				if( string.len( v.name ) > 16 ) then
					draw.SimpleText( string.sub( v.name, 1, 16 ) .. "...", "BRICKS_SERVER_Font20", w/2, h-5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
				else
					draw.SimpleText( v.name, "BRICKS_SERVER_Font20", w/2, h-5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
				end
			end

			icon = vgui.Create( "DModelPanel", materialEntry )
			icon:Dock( FILL )
			icon:SetModel( v.model )
			if( IsValid( icon.Entity ) ) then
				function icon:LayoutEntity( Entity ) return end
				local mn, mx = icon.Entity:GetRenderBounds()
				local size = 0
				size = math.max( size, math.abs(mn.x) + math.abs(mx.x) )
				size = math.max( size, math.abs(mn.y) + math.abs(mx.y) )
				size = math.max( size, math.abs(mn.z) + math.abs(mx.z) )
		
				icon:SetFOV( 70 )
				icon:SetCamPos( Vector( size, size, size ) )
				icon:SetLookAt( (mn + mx) * 0.5 )
			end

			icon.DoClick = function()
				if( shipmentsTableCopy[v.name] ) then
					shipmentsTableCopy[v.name] = nil
				else
					shipmentsTableCopy[v.name] = true
				end
			end
		end

		chooserLayout:PerformLayout()
		chooserBack:Rebuild()
	end
	backPanel.RefreshTeams()

	local buttonPanel = vgui.Create( "DPanel", backPanel )
	buttonPanel:Dock( BOTTOM )
	buttonPanel:DockMargin( 10, 0, 10, 10 )
	buttonPanel:SetTall( 40 )
	buttonPanel.Paint = function( self2, w, h ) end

	local leftButton = vgui.Create( "DButton", buttonPanel )
	leftButton:Dock( LEFT )
	leftButton:SetText( "" )
	leftButton:DockMargin( 0, 0, 0, 0 )
	surface.SetFont( "BRICKS_SERVER_Font25" )
	local textX, textY = surface.GetTextSize( BRICKS_SERVER.Func.L( "confirm" ) )
	textX = textX+20
	leftButton:SetWide( math.max( (ScrW()/2560)*150, textX ) )
	local changeAlpha = 0
	leftButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end
		
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 4 ) )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( BRICKS_SERVER.Func.L( "confirm" ), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	leftButton.DoClick = function()
		saveFunc( shipmentsTableCopy )
		frameBack:AlphaTo( 0, 0.1, 0, function()
			if( IsValid( frameBack ) ) then
				frameBack:Remove()
			end
		end )
	end

	local rightButton = vgui.Create( "DButton", buttonPanel )
	rightButton:Dock( RIGHT )
	rightButton:SetText( "" )
	rightButton:DockMargin( 0, 0, 0, 0 )
	surface.SetFont( "BRICKS_SERVER_Font25" )
	local textX, textY = surface.GetTextSize( BRICKS_SERVER.Func.L( "cancel" ) )
	textX = textX+20
	rightButton:SetWide( math.max( (ScrW()/2560)*150, textX ) )
	local changeAlpha = 0
	rightButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end
		
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 4 ) )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( BRICKS_SERVER.Func.L( "cancel" ), "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	rightButton.DoClick = function()
		frameBack:AlphaTo( 0, 0.1, 0, function()
			if( IsValid( frameBack ) ) then
				frameBack:Remove()
			end
		end )
	end

	backPanel:SetSize( backPanel:GetWide(), buttonPanel:GetTall()+(4*10)+textArea:GetTall()+chooserBack:GetTall()+10 )
	backPanel:Center()
end

function BRICKS_SERVER.Func.MaterialRequest( title, subtitle, default, func_confirm, func_cancel, confirmText, cancelText )
	local frameBack = vgui.Create( "DFrame" )
	frameBack:SetSize( ScrW(), ScrH() )
	frameBack:Center()
	frameBack:SetTitle( "" )
	frameBack:ShowCloseButton( false )
	frameBack:SetDraggable( false )
	frameBack:MakePopup()
	frameBack:SetAlpha( 0 )
	frameBack:AlphaTo( 255, 0.1, 0 )
	frameBack.Paint = function( self2, w, h ) 
		BRICKS_SERVER.Func.DrawBlur( self2, 4, 4 )

		surface.SetDrawColor( 0, 0, 0, 100 )
		surface.DrawRect( 0, 0, w, h )
	end

	surface.SetFont( "BRICKS_SERVER_Font20" )
	local textX, textY = surface.GetTextSize( subtitle )

	local backPanel = vgui.Create( "bricks_server_dframepanel", frameBack )
	backPanel:SetHeader( title )
	backPanel:SetWide( math.max( ScrW()*0.4, textX+30 ) )
	backPanel.onCloseFunc = function()
		frameBack:Remove()
	end

	local textArea = vgui.Create( "DPanel", backPanel )
	textArea:Dock( TOP )
	textArea:DockMargin( 10, 10, 10, 0 )
	textArea:SetTall( 30 )
	textArea.Paint = function( self2, w, h ) 
		draw.SimpleText( subtitle, "BRICKS_SERVER_Font20", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local chooserBack = vgui.Create( "DPanel", backPanel )
	chooserBack:Dock( TOP )
	chooserBack:DockMargin( 10, 10, 10, 0 )
	chooserBack:SetTall( ScrH()*0.4 )
	chooserBack.Paint = function() end

	local materialsScroll = vgui.Create( "bricks_server_scrollpanel", chooserBack )
	materialsScroll:Dock( FILL )
	materialsScroll.Paint = function( self2, w, h ) end
	
	local spacing = 5
	local gridWide = backPanel:GetWide()-20
    local wantedSlotSize = 100
    local slotsWide = math.floor( gridWide/wantedSlotSize )
	local slotSize = (gridWide-((slotsWide-1)*spacing))/slotsWide

	local materialsGridCustom = vgui.Create( "DIconLayout", materialsScroll )
    materialsGridCustom:Dock( TOP )
    materialsGridCustom:DockMargin( 0, 0, 0, 0 )
    materialsGridCustom:SetSpaceY( spacing )
	materialsGridCustom:SetSpaceX( spacing )
	
	local materialsGridDefault = vgui.Create( "DIconLayout", materialsScroll )
    materialsGridDefault:Dock( TOP )
    materialsGridDefault:SetSpaceY( spacing )
	materialsGridDefault:SetSpaceX( spacing )
	
	local selected = default
	function backPanel.RefreshMaterials( time )
		local defaultMaterials = {}
		local customMaterials = {}

		materialsGridCustom:Clear()
		materialsGridDefault:Clear()

		for k, v in pairs( BRICKS_SERVER.CachedMaterials ) do
			if( string.StartWith( k, "http" ) ) then
				table.insert( customMaterials, { v, k } )
			else
				table.insert( defaultMaterials, { v, k } )
			end
		end

		table.SortByMember( defaultMaterials, 2, true )

		local materialCustomHeader = materialsGridCustom:Add( "DPanel" )
		materialCustomHeader:SetSize( gridWide-20, 40 )
		materialCustomHeader.Paint = function( self2, w, h )
			draw.SimpleText( BRICKS_SERVER.Func.L( "custom" ), "BRICKS_SERVER_Font25", 0, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
		end

		for k, v in pairs( customMaterials ) do
			local materialEntry = materialsGridCustom:Add( "DButton" )
			materialEntry:SetSize( slotSize, slotSize )
			materialEntry:SetText( "" )
			local changeAlpha = 0
			local name = util.CRC( v[2] )
			materialEntry.Paint = function( self2, w, h )
				if( selected == v[2] ) then
					draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 4 ) )
				else
					draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
				end

				if( self2:IsDown() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 150 )
				elseif( self2:IsHovered() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 95 )
				else
					changeAlpha = math.Clamp( changeAlpha-10, 0, 95 )
				end

				surface.SetAlphaMultiplier( changeAlpha/255 )
				draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
				surface.SetAlphaMultiplier( 1 )

				if( BRICKS_SERVER.CachedMaterials[v[2]] ) then
					surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
					surface.SetMaterial( BRICKS_SERVER.CachedMaterials[v[2]] )
					local iconSize = h*0.5
					surface.DrawTexturedRect( (h-iconSize)/2, (h/2)-(iconSize/2), iconSize, iconSize )
				end

				draw.SimpleText( name, "BRICKS_SERVER_Font17", w/2, h-5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
			end
			materialEntry.DoClick = function()
				selected = v[2]
			end
		end

		local customMaterialNew = materialsGridCustom:Add( "DButton" )
		customMaterialNew:SetSize( slotSize, slotSize )
		customMaterialNew:SetText( "" )
		local changeAlpha = 0
		local newMat = Material( "materials/bricks_server/add.png")
		customMaterialNew.Paint = function( self2, w, h )
			draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

			if( self2:IsDown() ) then
				changeAlpha = math.Clamp( changeAlpha+10, 0, 150 )
			elseif( self2:IsHovered() ) then
				changeAlpha = math.Clamp( changeAlpha+10, 0, 95 )
			else
				changeAlpha = math.Clamp( changeAlpha-10, 0, 95 )
			end

			surface.SetAlphaMultiplier( changeAlpha/255 )
			draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
			surface.SetAlphaMultiplier( 1 )

			if( newMat ) then
				surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
				surface.SetMaterial( newMat )
				local iconSize = 32
				surface.DrawTexturedRect( (h-iconSize)/2, (h/2)-(iconSize/2), iconSize, iconSize )
			end

			draw.SimpleText( BRICKS_SERVER.Func.L( "addNew" ), "BRICKS_SERVER_Font17", w/2, h-5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
		end
		customMaterialNew.DoClick = function()
			BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "material" ), BRICKS_SERVER.Func.L( "directImage" ), "https://i.imgur.com/XBwi3Nh.png", function( text ) 
				selected = text
				BRICKS_SERVER.Func.CacheImageFromURL( text, function() backPanel.RefreshMaterials() end )
			end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
		end

		local materialDefaultHeader = materialsGridDefault:Add( "DPanel" )
		materialDefaultHeader:SetSize( gridWide-20, 40 )
		materialDefaultHeader.Paint = function( self2, w, h )
			draw.SimpleText( BRICKS_SERVER.Func.L( "default" ), "BRICKS_SERVER_Font25", 0, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
		end

		for k, v in pairs( defaultMaterials ) do
			local materialEntry = materialsGridDefault:Add( "DButton" )
			materialEntry:SetSize( slotSize, slotSize )
			materialEntry:SetText( "" )
			local changeAlpha = 0
			materialEntry.Paint = function( self2, w, h )
				if( selected == v[2] ) then
					draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 4 ) )
				else
					draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
				end
				if( self2:IsDown() ) then
					changeAlpha = math.Clamp( changeAlpha-10, 0, 95 )
				elseif( self2:IsHovered() ) then
					changeAlpha = math.Clamp( changeAlpha+10, 0, 95 )
				else
					changeAlpha = math.Clamp( changeAlpha-10, 0, 95 )
				end

				surface.SetAlphaMultiplier( changeAlpha/255 )
				draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
				surface.SetAlphaMultiplier( 1 )

				if( BRICKS_SERVER.CachedMaterials[v[2]] ) then
					surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
					surface.SetMaterial( BRICKS_SERVER.CachedMaterials[v[2]] )
					local iconSize = h*0.5
					surface.DrawTexturedRect( (h-iconSize)/2, (h/2)-(iconSize/2), iconSize, iconSize )
				end

				draw.SimpleText( string.Replace( v[2], ".png", "" ), "BRICKS_SERVER_Font17", w/2, h-5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
			end
			materialEntry.DoClick = function()
				selected = v[2]
			end
		end

		materialsGridCustom:SetTall( (math.ceil((#customMaterials+1)/slotsWide)*slotSize)+((math.ceil((#customMaterials+1)/slotsWide)-1)*spacing)+45 )
		materialsGridDefault:SetTall( (math.ceil(#defaultMaterials/slotsWide)*slotSize)+((math.ceil(#defaultMaterials/slotsWide)-1)*spacing)+45 )

		materialsGridCustom:PerformLayout()
		materialsGridDefault:PerformLayout()
		materialsScroll:Rebuild()
	end
	backPanel.RefreshMaterials()

	local buttonPanel = vgui.Create( "DPanel", backPanel )
	buttonPanel:Dock( BOTTOM )
	buttonPanel:DockMargin( 10, 0, 10, 10 )
	buttonPanel:SetTall( 40 )
	buttonPanel.Paint = function( self2, w, h ) end

	local leftButton = vgui.Create( "DButton", buttonPanel )
	leftButton:Dock( LEFT )
	leftButton:SetText( "" )
	leftButton:DockMargin( 0, 0, 0, 0 )
	surface.SetFont( "BRICKS_SERVER_Font25" )
	local textX, textY = surface.GetTextSize( confirmText )
	textX = textX+20
	leftButton:SetWide( math.max( (ScrW()/2560)*150, textX ) )
	local changeAlpha = 0
	leftButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end
		
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( confirmText, "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	leftButton.DoClick = function()
		if( BRICKS_SERVER.CachedMaterials[selected] ) then
			func_confirm( selected )
			frameBack:AlphaTo( 0, 0.1, 0, function()
				if( IsValid( frameBack ) ) then
					frameBack:Remove()
				end
			end )
		else
			notification.AddLegacy( BRICKS_SERVER.Func.L( "selectMaterial" ), 1, 3 )
		end
	end

	local rightButton = vgui.Create( "DButton", buttonPanel )
	rightButton:Dock( RIGHT )
	rightButton:SetText( "" )
	rightButton:DockMargin( 0, 0, 0, 0 )
	surface.SetFont( "BRICKS_SERVER_Font25" )
	local textX, textY = surface.GetTextSize( cancelText )
	textX = textX+20
	rightButton:SetWide( math.max( (ScrW()/2560)*150, textX ) )
	local changeAlpha = 0
	rightButton.Paint = function( self2, w, h )
		if( self2:IsHovered() ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end
		
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )

		surface.SetAlphaMultiplier( changeAlpha/255 )
		draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( cancelText, "BRICKS_SERVER_Font25", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	rightButton.DoClick = function()
		func_cancel( selected )
		frameBack:AlphaTo( 0, 0.1, 0, function()
			if( IsValid( frameBack ) ) then
				frameBack:Remove()
			end
		end )
	end

	backPanel:SetTall( buttonPanel:GetTall()+(4*10)+textArea:GetTall()+chooserBack:GetTall()+10+backPanel.headerHeight )
	backPanel:Center()
end
--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_clickentry.lua:
local PANEL = {}

function PANEL:Init()

	self:SetTall( 40 )
	self:Clear()
	self:SetText( "" )

end

function PANEL:CreateStringEntry()
	if( IsValid( self.valueEntry ) ) then return end

	self.looseFocusCooldown = CurTime()+0.1

	self.valueEntry = vgui.Create( "bricks_server_textentry", self )
	self.valueEntry:Dock( FILL )
	self.valueEntry:SetKeyboardInputEnabled( true )
	self.valueEntry:RequestFocus()
	self.valueEntry.OnChange = function()
		self:SetValue( self.valueEntry:GetValue() )
	end
	self.valueEntry.OnEnter = function()
		if( self.OnEnter ) then
			self.OnEnter( self.valueEntry:GetValue() )
		end
	end
end

function PANEL:CreateNumberEntry()
	if( IsValid( self.valueEntry ) ) then return end

	self.looseFocusCooldown = CurTime()+0.1

	self.valueEntry = vgui.Create( "DNumberWang", self )
	self.valueEntry:Dock( FILL )
	self.valueEntry:SetKeyboardInputEnabled( true )
	self.valueEntry:RequestFocus()
	self.valueEntry.OnChange = function()
		self:SetValue( self.valueEntry:GetValue() )
	end
	self.valueEntry.OnEnter = function()
		if( self.OnEnter ) then
			self.OnEnter( self.valueEntry:GetValue() )
		end
	end
end

function PANEL:SetDataType( dataType )
	if( dataType == "string"  or dataType == "integer" or dataType == "color" ) then
		self.dataType = dataType
	else
		self.dataType = "string"
	end
end

function PANEL:GetDataType()
	return self.dataType or "string"
end

function PANEL:SetValue( value )
	if( self:GetDataType() == "string" ) then
		self.value = tostring( value )
	elseif( self:GetDataType() == "integer" ) then
		self.value = tonumber( value )
	else
		self.value = value
	end

	if( self.OnChange ) then
		self.OnChange( value )
	end
end

function PANEL:GetValue()
	if( self:GetDataType() == "string" ) then
		return tostring( self.value or "none" )
	elseif( self:GetDataType() == "integer" ) then
		return tonumber( self.value or 0 )
	else
		return self.value
	end
end

function PANEL:SetTitle( strValue )
	self.title = strValue
end

function PANEL:GetTitle()
	return self.title or ""
end

function PANEL:DoClick()
	if( self:GetDataType() == "string" ) then
		self:CreateStringEntry()
	elseif( self:GetDataType() == "integer" ) then
		self:CreateNumberEntry()
	elseif( self:GetDataType() == "color" ) then
		BRICKS_SERVER.Func.ColorRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newColorQuery" ), self:GetValue(), function( color ) 
			self:SetValue( color or Color( 255, 255, 255 ) )
		end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
	end
end

function PANEL:Think()
	if( IsValid( self.valueEntry ) and not self.valueEntry:HasFocus() and CurTime() >= self.looseFocusCooldown ) then
		self.valueEntry:Remove()
	end
end

local Alpha = 0
local color1 = BRICKS_SERVER.Func.GetTheme( 2 )
function PANEL:Paint( w, h )
	if( IsValid( self.valueEntry ) ) then
		Alpha = math.Clamp( Alpha+5, 0, 100 )
	else
		Alpha = math.Clamp( Alpha-5, 0, 100 )
	end

	draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
	draw.RoundedBox( 5, 0, 0, w, h, Color( color1.r, color1.g, color1.b, Alpha ) )

	if( not IsValid( self.valueEntry ) ) then
		if( self:GetDataType() != "color" ) then
			draw.SimpleText( self:GetTitle() .. ": " .. tostring( self:GetValue() ), "BRICKS_SERVER_Font20", w/2, h/2, Color( 255, 255, 255, 20 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		else
			draw.SimpleText( self:GetTitle(), "BRICKS_SERVER_Font20", w/2, h/2, Color( 255, 255, 255, 20 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
	else

	end
end

derma.DefineControl( "bricks_server_clickentry", "", PANEL, "DButton" )
--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_config_itemrarities.lua:
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

    self.spacing = 5
    local gridWide = self.panelWide-50-10-self.spacing
    local wantedSlotSize = 125*(ScrW()/2560)
    self.slotsWide = math.floor( gridWide/wantedSlotSize )
    self.slotSize = (gridWide-((self.slotsWide-1)*self.spacing))/self.slotsWide

    self.grid = vgui.Create( "DIconLayout", self.scrollPanel )
    self.grid:Dock( TOP )
    self.grid:SetSpaceY( self.spacing )
    self.grid:SetSpaceX( self.spacing )

    self:Refresh()
end

function PANEL:Refresh()
    self.grid:Clear()

    local sortedItems = {}
    local rarityItems = BRICKS_SERVER.Func.GetRarityItems() or {}
    for k, v in pairs( rarityItems ) do
        if( self.searchBar:GetValue() != "" and not string.find( string.lower( v[1] or "" ), string.lower( self.searchBar:GetValue() ) ) ) then
            continue
        end

        local rarityInfo, rarityKey = {}, 0
        if( BS_ConfigCopyTable.INVENTORY.ItemRarities[k] ) then
            rarityInfo, rarityKey = BRICKS_SERVER.Func.GetRarityInfo( BS_ConfigCopyTable.INVENTORY.ItemRarities[k] )
        end

        local itemTable = table.Copy( v )
        itemTable.Key = k
        itemTable.Rarity = rarityKey or 0
        itemTable.RarityInfo = rarityInfo

        table.insert( sortedItems, itemTable )
    end

    table.sort( sortedItems, function( a, b ) return ((a or {}).Rarity or 0) > ((b or {}).Rarity or 0) end )

    local loadingIcon = Material( "materials/bricks_server/loading.png" )

    local modelsToLoad = {}
    for k, v in pairs( sortedItems ) do
        local slotBack = self.grid:Add( "DPanel" )
        slotBack:SetSize( self.slotSize, self.slotSize )
        local changeAlpha = 0
        slotBack.Paint = function( self2, w, h )
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
            
            if( IsValid( self2.itemModel ) ) then
                if( self2.itemModel:IsDown() ) then
                    changeAlpha = math.Clamp( changeAlpha+10, 0, 125 )
                elseif( self2.itemModel:IsHovered() ) then
                    changeAlpha = math.Clamp( changeAlpha+10, 0, 95 )
                else
                    changeAlpha = math.Clamp( changeAlpha-10, 0, 95 )
                end
            else
                surface.SetDrawColor( 255, 255, 255, 255 )
                surface.SetMaterial( loadingIcon )
                local size = 32
                surface.DrawTexturedRectRotated( w/2, h/2, size, size, -(CurTime() % 360 * 250) )
            end

            surface.SetAlphaMultiplier( changeAlpha/255 )
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
            surface.SetAlphaMultiplier( 1 )

            draw.SimpleText( (v[1] or BRICKS_SERVER.Func.L( "nil" )), "BRICKS_SERVER_Font17", w/2, h-5, ((v.RarityInfo and BRICKS_SERVER.Func.GetRarityColor( v.RarityInfo )) or BRICKS_SERVER.Func.GetTheme( 6 )), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
        end

        table.insert( modelsToLoad, { slotBack, v.Key } )
    end

    local function loadModel( k )
        if( not modelsToLoad[k] ) then return end

        local parent, itemKey = modelsToLoad[k][1], modelsToLoad[k][2]
        local model, color = rarityItems[itemKey][2], rarityItems[itemKey][3]

        if( not IsValid( parent ) ) then return end

        if( model ) then
            parent.itemModel = vgui.Create( "DModelPanel", parent )
            parent.itemModel:Dock( FILL )
            parent.itemModel:SetModel( model )
            function parent.itemModel:LayoutEntity( Entity ) return end
            if( parent.itemModel.Entity and IsValid( parent.itemModel.Entity ) ) then
                local mn, mx = parent.itemModel.Entity:GetRenderBounds()
                local size = 0
                size = math.max( size, math.abs(mn.x) + math.abs(mx.x) )
                size = math.max( size, math.abs(mn.y) + math.abs(mx.y) )
                size = math.max( size, math.abs(mn.z) + math.abs(mx.z) )
    
                parent.itemModel:SetFOV( 70 )
                parent.itemModel:SetCamPos( Vector( size, size, size ) )
                parent.itemModel:SetLookAt( (mn + mx) * 0.5 )
            end

            if( color ) then
                parent.itemModel:SetColor( color )
            end
        else
            parent.itemModel = vgui.Create( "DButton", parent )
            parent.itemModel:Dock( FILL )
            parent.itemModel:SetText( "" )
            parent.itemModel.Paint = function() end
        end

        parent.itemModel.DoClick = function()
            local options = {}
            for k, v in pairs( BS_ConfigCopyTable.GENERAL.Rarities ) do
                options[k] = v[1] or BRICKS_SERVER.Func.L( "nil" )
            end

            if( table.Count( options ) <= 0 ) then 
                notification.AddLegacy( BRICKS_SERVER.Func.L( "needToAddRarity" ), 1, 5 )
                return 
            end

            BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "whatRarityItem" ), BRICKS_SERVER.Func.L( "none" ), options, function( value, data ) 
                if( BS_ConfigCopyTable.GENERAL.Rarities[data] ) then
                    BS_ConfigCopyTable.INVENTORY.ItemRarities[itemKey] = value
                    self:Refresh()
                    BRICKS_SERVER.Func.ConfigChange( "INVENTORY" )
                else
                    notification.AddLegacy( BRICKS_SERVER.Func.L( "invalidRarity" ), 1, 3 )
                end
            end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
        end

        timer.Simple( 0.02, function()
            if( not IsValid( self ) ) then return end
            
            loadModel( k+1 )
        end )
    end

    timer.Simple( 0.02, function()
        if( not IsValid( self ) ) then return end

        loadModel( 1 )
    end )
end

function PANEL:Paint( w, h )
    
end

vgui.Register( "bricks_server_config_itemrarities", PANEL, "DPanel" )
--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_config_npcs.lua:
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
            
                    draw.SimpleText( val2[1], "BRICKS_SERVER_Font25", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
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
    
            draw.SimpleText( BRICKS_SERVER.Func.L( "addNPC" ), "BRICKS_SERVER_Font25", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
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
--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_settings.lua:
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
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/vgui/bricks_server_gangmenu_admin.lua:
local PANEL = {}

function PANEL:Init()

end

function PANEL:FillPanel( gangTable )
    local panelTall = (ScrH()*0.65)-40

    local function CreateLoadingPopout()
        if( IsValid( self.popout ) ) then
            self.popout:Remove()
        end

        local popoutClose = vgui.Create( "DPanel", self )
        popoutClose:SetSize( self.panelWide, panelTall )
        popoutClose:SetAlpha( 0 )
        popoutClose:AlphaTo( 255, 0.2 )
        popoutClose.Paint = function( self2, w, h )
            surface.SetDrawColor( 0, 0, 0, 150 )
            surface.DrawRect( 0, 0, w, h )
            BRICKS_SERVER.Func.DrawBlur( self2, 2, 2 )
        end

        local popoutWide, popoutTall = self.panelWide*0.65, panelTall*0.25

        self.popout = vgui.Create( "DPanel", self )
        self.popout:SetSize( 0, 0 )
        self.popout:SizeTo( popoutWide, popoutTall, 0.2 )
        self.popout.Paint = function( self2, w, h )
            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
        end
        self.popout.OnSizeChanged = function( self2 )
            self2:SetPos( (self.panelWide/2)-(self2:GetWide()/2), (panelTall/2)-(self2:GetTall()/2) )
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

        local actionButton = vgui.Create( "DButton", self.popout )
        actionButton:Dock( BOTTOM )
        actionButton:SetTall( 40 )
        actionButton:SetText( "" )
        actionButton:DockMargin( 25, 0, 25, 25 )
        local changeAlpha = 0
        actionButton.Paint = function( self2, w, h )
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
        actionButton.DoClick = self.popout.ClosePopout

        local loadingPanel = vgui.Create( "DPanel", self.popout )
        loadingPanel:Dock( FILL )
        loadingPanel:DockMargin( 25, 10, 25, 10 )
        local loadingIcon = Material( "materials/bricks_server/loading.png" )
        loadingPanel.Paint = function( self2, w, h )
            surface.SetDrawColor( 255, 255, 255, 255 )
            surface.SetMaterial( loadingIcon )
            local size = 32
            surface.DrawTexturedRectRotated( w/2, h/2, size, size, -(CurTime() % 360 * 250) )
        
            draw.SimpleText( BRICKS_SERVER.Func.L( "loading" ), "BRICKS_SERVER_Font20", w/2, h/2+(size/2)+5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, 0 )
        end
    end

    local function CreateGangPopout( gangID )
        if( IsValid( self.adminPopout ) ) then
            self.adminPopout:Remove()
        end

        self.adminPopout = vgui.Create( "bricks_server_gangmenu_admin_popup", self )
        self.adminPopout:SetSize( self.panelWide, panelTall )
        self.adminPopout:FillPanel( self.panelWide, panelTall )
    end

    local topBar = vgui.Create( "DPanel", self )
    topBar:Dock( TOP )
    topBar:DockMargin( 10, 10, 10, 5 )
    topBar:SetTall( 40 )
    topBar.Paint = function( self2, w, h ) end

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
    searchBar.OnEnter = function()
        CreateLoadingPopout()

        local canRequest, errorMsg, waitTime = BRICKS_SERVER.Func.RequestAdminGangs( searchBar:GetValue() or "" )

        if( not canRequest ) then
            timer.Create( "BRS_ADMIN_SEARCH_WAIT_" .. tostring( self ), (waitTime or 3), 1, function()
                local canRequest2, errorMsg2, waitTime2 = BRICKS_SERVER.Func.RequestAdminGangs( searchBar:GetValue() or "" )
                if( not canRequest2 ) then
                    BRICKS_SERVER.Func.Message( errorMsg, BRICKS_SERVER.Func.L( "gang" ), BRICKS_SERVER.Func.L( "confirm" ) )
                end
            end )
        end
    end

    local scrollPanel = vgui.Create( "bricks_server_scrollpanel", self )
    scrollPanel:Dock( FILL )
    scrollPanel:DockMargin( 10, 0, 10, 10 )
    scrollPanel.Paint = function( self, w, h ) end 

    BRICKS_SERVER.Func.RequestAdminGangs( "" )

    function self.RefreshPanel( gangTables )
        scrollPanel:Clear()

        if( not gangTables or table.Count( gangTables or {} ) <= 0 ) then
            local text = BRICKS_SERVER.Func.L( "gangNoneFound" )
            surface.SetFont( "BRICKS_SERVER_Font25" )
            local textX, textY = surface.GetTextSize( text )
            textX, textY = textX+30, textY+20

            scrollPanel.Paint = function( self, w, h ) 
                draw.RoundedBox( 5, (w/2)-(textX/2), (h/2)-(textY/2), textX, textY, BRICKS_SERVER.Func.GetTheme( 3 ) )

                draw.SimpleText( text, "BRICKS_SERVER_Font23", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
            end 
        else
            scrollPanel.Paint = function( self, w, h ) end 
            
            for k, v in pairs( gangTables or {} ) do
                local text = BRICKS_SERVER.Func.L( "gangMemberCount", (v.MemberCount or 0), (v.MemberMax or 0) )
                surface.SetFont( "BRICKS_SERVER_Font23" )
                local textX, textY = surface.GetTextSize( text )
                local boxW, boxH = textX+15, textY+5
                local distance = boxW

                local itemBack = vgui.Create( "DPanel", scrollPanel )
                itemBack:Dock( TOP )
                itemBack:DockMargin( 0, 0, 0, 5 )
                itemBack:SetTall( 100 )
                local itemButton
                local clickColor = Color( BRICKS_SERVER.Func.GetTheme( 0 ).r, BRICKS_SERVER.Func.GetTheme( 0 ).g, BRICKS_SERVER.Func.GetTheme( 0 ).b, 50 )
                local alpha = 0
                itemBack.Paint = function( self2, w, h )
                    draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

                    if( IsValid( itemButton ) ) then
                        if( not itemButton:IsDown() and itemButton:IsHovered() ) then
                            alpha = math.Clamp( alpha+3, 0, 50 )
                        else
                            alpha = math.Clamp( alpha-3, 0, 50 )
                        end
                
                        surface.SetAlphaMultiplier( alpha/255 )
                        draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )
                        surface.SetAlphaMultiplier( 1 )
            
                        BRICKS_SERVER.Func.DrawClickCircle( itemButton, w, h, clickColor )
                    end

                    draw.RoundedBox( 5, w-distance-(boxW/2), (h/2)-(boxH/2), boxW, boxH, (v[2] or BRICKS_SERVER.Func.GetTheme( 5 )) )
                    draw.SimpleText( text, "BRICKS_SERVER_Font23", w-distance, (h/2)-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
                end

                local avatarBack = vgui.Create( "DPanel", itemBack )
                avatarBack:Dock( FILL )
                avatarBack:DockMargin( 15, 15, 15, 15 )
                local avatarBackSize = 70
                local avatarSize = (v.Icon and avatarBackSize*0.6) or 32
                avatarBack.Paint = function( self2, w, h )
                    local textStartPos = avatarBackSize+15

                    surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
                    draw.NoTexture()
                    BRICKS_SERVER.Func.DrawCircle( (h-avatarBackSize)/2+(avatarBackSize/2), h/2, avatarBackSize/2, 45 )
            
                    draw.SimpleText( (v.Name or BRICKS_SERVER.Func.L( "gangNone" )), "BRICKS_SERVER_Font23", textStartPos, h/2+2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_BOTTOM )
            
                    draw.SimpleText( BRICKS_SERVER.Func.L( "gangID", k ), "BRICKS_SERVER_Font17", textStartPos, h/2-2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
                end

                local gangIcon = vgui.Create( "bricks_server_gangicon", avatarBack )
                gangIcon:SetSize( avatarSize, avatarSize )
                gangIcon:SetPos( (avatarBackSize-avatarSize)/2, (avatarBackSize-avatarSize)/2 )
                gangIcon:SetIconURL( v.Icon or "bricks_server/question.png" )

                itemButton = vgui.Create( "DButton", itemBack )
                itemButton:Dock( FILL )
                itemButton:SetText( "" )
                itemButton.Paint = function( self2, w, h ) end
                itemButton.DoClick = function()
                    local canRequest, errorMsg, waitTime = BRICKS_SERVER.Func.RequestAdminGangData( k )

                    if( not canRequest ) then
                        timer.Create( "BRS_ADMIN_DATA_WAIT_" .. tostring( self ), (waitTime or 3), 1, function()
                            local canRequest2, errorMsg2, waitTime2 = BRICKS_SERVER.Func.RequestAdminGangData( k )
                            if( not canRequest2 ) then
                                BRICKS_SERVER.Func.Message( errorMsg, BRICKS_SERVER.Func.L( "gang" ), BRICKS_SERVER.Func.L( "confirm" ) )
                            end
                        end )
                    end

                    CreateGangPopout( k )
                end
            end
        end

        if( IsValid( self.popout ) ) then
            self.popout.ClosePopout()
        end
    end

    hook.Add( "BRS.Hooks.RefreshGangAdmin", self, function( self, gangTables )
        if( IsValid( self ) ) then
            self.RefreshPanel( gangTables )
        else
            hook.Remove( "BRS.Hooks.RefreshGangAdmin", self )
        end
    end )
end

function PANEL:Paint( w, h )

end

vgui.Register( "bricks_server_gangmenu_admin", PANEL, "DPanel" )
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/vgui/bricks_server_gangmenu_admin_popup.lua:
local PANEL = {}

function PANEL:Init()

end

function PANEL:FillPanel( panelWide, panelTall )
    self.panelWide, self.panelTall = panelWide, panelTall

    local popoutClose = vgui.Create( "DButton", self )
    popoutClose:SetSize( self.panelWide, self.panelTall )
    popoutClose:SetText( "" )
    popoutClose:SetAlpha( 0 )
    popoutClose:AlphaTo( 255, 0.2 )
    popoutClose:SetCursor( "arrow" )
    popoutClose.Paint = function( self2, w, h )
        surface.SetDrawColor( 0, 0, 0, 150 )
        surface.DrawRect( 0, 0, w, h )
        BRICKS_SERVER.Func.DrawBlur( self2, 2, 2 )
    end
    local function closePopoutFunc()
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

        timer.Simple( 0.2, function()
            if( IsValid( self ) ) then
                self:Remove()
            end
        end )
    end
    popoutClose.DoClick = closePopoutFunc

    self.popout = vgui.Create( "DPanel", self )
    self.popout:SetSize( 0, 0 )
    self.popout:SizeTo( self.panelWide*0.65, self.panelTall*0.25, 0.2 )
    self.popout.Paint = function( self2, w, h )
        draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
    end
    self.popout.OnSizeChanged = function( self2 )
        self2:SetPos( (self.panelWide/2)-(self2:GetWide()/2), (self.panelTall/2)-(self2:GetTall()/2) )
    end

    self.closeButton = vgui.Create( "DButton", self.popout )
    self.closeButton:Dock( BOTTOM )
    self.closeButton:SetTall( 40 )
    self.closeButton:SetText( "" )
    self.closeButton:DockMargin( 25, 0, 25, 25 )
    local changeAlpha = 0
    self.closeButton.Paint = function( self2, w, h )
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
        
        draw.SimpleText( BRICKS_SERVER.Func.L( "close" ), "BRICKS_SERVER_Font20", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
    end
    self.closeButton.DoClick = closePopoutFunc

    self.popoutContent = vgui.Create( "DPanel", self.popout )
    self.popoutContent:Dock( FILL )
    self.popoutContent.Paint = function( self2, w, h ) end

    local loadingPanel = vgui.Create( "DPanel", self.popoutContent )
    loadingPanel:Dock( FILL )
    loadingPanel:DockMargin( 25, 10, 25, 10 )
    local loadingIcon = Material( "materials/bricks_server/loading.png" )
    loadingPanel.Paint = function( self2, w, h )
        surface.SetDrawColor( 255, 255, 255, 255 )
        surface.SetMaterial( loadingIcon )
        local size = 32
        surface.DrawTexturedRectRotated( w/2, h/2, size, size, -(CurTime() % 360 * 250) )
    
        draw.SimpleText( BRICKS_SERVER.Func.L( "loading" ), "BRICKS_SERVER_Font20", w/2, h/2+(size/2)+5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, 0 )
    end

    hook.Add( "BRS.Hooks.RefreshGangAdminData", "BricksServerHooks_BRS_RefreshGangAdminData_" .. tostring( self.popout ), function( gangID, gangTable )
        if( IsValid( self ) and IsValid( self.popout ) ) then
            self:RefreshPanel( gangID, gangTable )
        else
            hook.Remove( "BRS.Hooks.RefreshGangAdminData", "BricksServerHooks_BRS_RefreshGangAdminData_" .. tostring( self.popout ) )
        end
    end )
end

function PANEL:RefreshPanel( gangID, gangTable )
    if( not gangTable ) then 
        closePopoutFunc()
        
        BRICKS_SERVER.Func.Message( BRICKS_SERVER.Func.L( "gangFailedToLoad" ), BRICKS_SERVER.Func.L( "gang" ), BRICKS_SERVER.Func.L( "confirm" ) )
        return 
    end

    self.gangID, self.gangTable = gangID, gangTable

    if( self.activePage and self.activePage != BRICKS_SERVER.Func.L( "main" ) ) then return end

    self.activePage = BRICKS_SERVER.Func.L( "main" )

    self.popoutContent:Clear()

    local popoutWide = self.panelWide*0.75

    local avatarBackSize = 70

    local infoPanel = vgui.Create( "DPanel", self.popoutContent )
    infoPanel:Dock( TOP )
    infoPanel:DockMargin( 25, 25, 25, 0 )
    infoPanel:SetTall( avatarBackSize )
    local avatarSize = (gangTable.Icon and avatarBackSize*0.6) or 32
    infoPanel.Paint = function( self2, w, h )

        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 3 ) )
        draw.NoTexture()
        BRICKS_SERVER.Func.DrawCircle( h/2, h/2, avatarBackSize/2, avatarBackSize/2 )

        draw.SimpleText( (gangTable.Name or BRICKS_SERVER.Func.L( "gangNone" )), "BRICKS_SERVER_Font25", h+15, h/2+2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_BOTTOM )

        draw.SimpleText( BRICKS_SERVER.Func.L( "gangID", (gangID or 0) ), "BRICKS_SERVER_Font20", h+15, h/2-2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
    end

    local gangIcon = vgui.Create( "bricks_server_gangicon", infoPanel )
    gangIcon:SetSize( avatarSize, avatarSize )
    gangIcon:SetPos( (avatarBackSize-avatarSize)/2, (avatarBackSize-avatarSize)/2 )
    gangIcon:SetIconURL( gangTable.Icon or "bricks_server/question.png" )

    local gridWide = popoutWide-50

    local graphs = {
        [1] = {
            Title = BRICKS_SERVER.Func.L( "gangMembers" ),
            Color = Color( 41, 128, 185 ),
            GetValue = function() return table.Count( gangTable.Members or {} ) end,
            GetMax = function() return BRICKS_SERVER.Func.GangGetUpgradeInfo( gangID, "MaxMembers", gangTable )[1] end
        },
        [2] = {
            Title = BRICKS_SERVER.Func.L( "gangBalance" ),
            Color = Color( 39, 174, 96 ),
            GetValue = function() return gangTable.Money or 0 end,
            GetMax = function() return BRICKS_SERVER.Func.GangGetUpgradeInfo( gangID, "MaxBalance", gangTable )[1] end,
            Format = function( value ) return DarkRP.formatMoney( value ) end
        },
        [4] = {
            Title = function() return BRICKS_SERVER.Func.L( "levelX", (gangTable.Level or 0) ) end,
            Color = Color( 22, 160, 133 ),
            GetValue = function() return (gangTable.Experience or 0)-BRICKS_SERVER.Func.GetGangExpToLevel( 0, (gangTable.Level or 0) ) end,
            GetMax = function() return BRICKS_SERVER.Func.GetGangExpToLevel( (gangTable.Level or 0), (gangTable.Level or 0)+1 ) end,
            Format = function( value ) return BRICKS_SERVER.Func.FormatGangEXP( value+BRICKS_SERVER.Func.GetGangExpToLevel( 0, (gangTable.Level or 0) ) ) end
        }
    }

    if( BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "storage" ) ) then
        graphs[3] = {
            Title = BRICKS_SERVER.Func.L( "gangStorage" ),
            Color = Color( 231, 76, 60 ),
            GetValue = function() return table.Count( gangTable.Storage or {} ) end,
            GetMax = function() return BRICKS_SERVER.Func.GangGetUpgradeInfo( gangID, "StorageSlots", gangTable )[1] end
        }
    else
        graphs[3] = {
            Title = BRICKS_SERVER.Func.L( "gangStorage" ),
            Color = Color( 231, 76, 60 ),
            GetValue = function() return 0 end,
            GetMax = function() return 1 end
        }
    end

    local spacing = 25
    local graphWide = (gridWide-((#graphs-1)*spacing))/#graphs

    local graphPanel = vgui.Create( "DPanel", self.popoutContent )
    graphPanel:Dock( TOP )
    graphPanel:DockMargin( 25, 25, 25, 0 )
    graphPanel:SetTall( graphWide )
    graphPanel.Paint = function( self2, w, h ) end

    for k, v in ipairs( graphs ) do
        local graph = vgui.Create( "DPanel", graphPanel )
        graph:Dock( LEFT )
        graph:DockMargin( 0, 0, spacing, 0 )
        graph:SetWide( graphWide )
        local outerWidth = 5
        local themeColor = v.Color or BRICKS_SERVER.Func.GetTheme( 5 )
        local shadowColor = Color( 0, 0, 0 )
        local txtSpacing = 1
        graph.Paint = function( self2, w, h ) 
            BRICKS_SERVER.Func.DrawArc( w/2, h/2, w/2, outerWidth, 0, 360, BRICKS_SERVER.Func.GetTheme( 3 ) )

            local value, max = v.GetValue(), v.GetMax()
            local degree = math.Clamp( 360*(value/max), 0, 360 )

            BRICKS_SERVER.Func.DrawArc( w/2, h/2, w/2, outerWidth, 90, degree+90, themeColor )

            --BRICKS_SERVER.Func.DrawCircle( w/2, h/2, (w-outerWidth)/2, Color( themeColor.r, themeColor.g, themeColor.b, 75 ), -90, degree-90 )

            local title = v.Title
            if( isfunction( title ) ) then
                title = title()
            end

            draw.SimpleText( title, "BRICKS_SERVER_Font23", w/2-1, h/2+txtSpacing+1, shadowColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
            draw.SimpleText( title, "BRICKS_SERVER_Font23", w/2, h/2+txtSpacing, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )

            local valueTxt, maxTxt = value, max
            if( v.Format ) then
                valueTxt, maxTxt = v.Format( value ), v.Format( max )
            end

            draw.SimpleText( valueTxt .. "/" .. maxTxt, "BRICKS_SERVER_Font17", w/2-1, h/2-txtSpacing+1, shadowColor, TEXT_ALIGN_CENTER, 0 )
            draw.SimpleText( valueTxt .. "/" .. maxTxt, "BRICKS_SERVER_Font17", w/2, h/2-txtSpacing, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, 0 )
        end
    end

    local spacing = 5
    local actionGrid = vgui.Create( "DIconLayout", self.popoutContent )
    actionGrid:Dock( TOP )
    actionGrid:DockMargin( 25, 25, 25, 0 )
    actionGrid:SetSpaceY( spacing )
    actionGrid:SetSpaceX( spacing )

    local wantedSlotSize = 125
    local slotsWide = math.floor( gridWide/wantedSlotSize )
    local slotSize = (gridWide-((slotsWide-1)*spacing))/slotsWide

    local function GetNextQuery( currentQuery, reqInfo, currentReqInfo, func )
        currentQuery = currentQuery+1

        if( currentQuery > #reqInfo ) then return end

        local reqInfoEntry = reqInfo[currentQuery]

        if( reqInfoEntry[2] == "string" or reqInfoEntry[2] == "integer" ) then 
            BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), reqInfoEntry[4], 0, function( text ) 
                currentReqInfo[currentQuery] = text

                if( currentQuery >= #reqInfo ) then
                    func( currentReqInfo )
                end
            end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), (reqInfoEntry[2] == "integer") )
        elseif( reqInfoEntry[2] == "table" and reqInfoEntry[3] and BRICKS_SERVER.Func.GetList( reqInfoEntry[3] ) ) then 
            BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "admin" ), reqInfoEntry[4], "", BRICKS_SERVER.Func.GetList( reqInfoEntry[3] ), function( value, data ) 
                if( BRICKS_SERVER.Func.GetList( reqInfoEntry[3] )[data] ) then
                    currentReqInfo[currentQuery] = data

                    if( currentQuery >= #reqInfo ) then
                        func( currentReqInfo )
                    end
                else
                    notification.AddLegacy( BRICKS_SERVER.Func.L( "invalidChoice" ), 1, 3 )
                end
            end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), true )
        end

        GetNextQuery( currentQuery, reqInfo, currentReqInfo, func )
    end

    local actionButtons = 0
    for k, v in ipairs( BRICKS_SERVER.DEVCONFIG.GangAdminCmds ) do
        if( not v.Icon or not v.Name ) then continue end
        
        actionButtons = actionButtons+1
        local newTall = (math.ceil( actionButtons/slotsWide )*slotSize)+((math.ceil( actionButtons/slotsWide )-1)*spacing)

        if( actionGrid:GetTall() != newTall ) then
            actionGrid:SetTall( newTall )
        end


        local actionButton = actionGrid:Add( "DButton" )
        actionButton:SetSize( slotSize, slotSize )
        actionButton:SetText( "" )
        local Alpha, iconAlpha = 0, 0
        local iconMat
        BRICKS_SERVER.Func.GetImage( v.Icon or "admin.png", function( mat ) 
            iconMat = mat 
        end )
        actionButton.Paint = function( self2, w, h )
            if( self2:IsHovered() and not self2:IsDown() ) then
                Alpha = math.Clamp( Alpha+10, 0, 50 )
            else
                Alpha = math.Clamp( Alpha-10, 0, 50 )
            end

            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
            draw.RoundedBox( 5, 0, 0, w, h, Color( BRICKS_SERVER.Func.GetTheme( 3 ).r, BRICKS_SERVER.Func.GetTheme( 3 ).g, BRICKS_SERVER.Func.GetTheme( 3 ).b, Alpha ) )

            BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )

            if( self2:IsHovered() and not self2:IsDown() ) then
                iconAlpha = math.Clamp( iconAlpha+10, 20, 255 )
            else
                iconAlpha = math.Clamp( iconAlpha-10, 20, 255 )
            end

            if( iconMat ) then
                surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ).r, BRICKS_SERVER.Func.GetTheme( 6 ).g, BRICKS_SERVER.Func.GetTheme( 6 ).b, iconAlpha )
                surface.SetMaterial( iconMat )
                local iconSize = 64
                surface.DrawTexturedRect( (w/2)-(iconSize/2), (h/2)-(iconSize/2), iconSize, iconSize )
            end

            draw.SimpleText( v.Name, "BRICKS_SERVER_Font15", w/2, h-5, Color( BRICKS_SERVER.Func.GetTheme( 6 ).r, BRICKS_SERVER.Func.GetTheme( 6 ).g, BRICKS_SERVER.Func.GetTheme( 6 ).b, iconAlpha ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
        end
        actionButton.DoClick = function()
            if( v.ClientFunc ) then
                v.ClientFunc( gangTable, gangID, self )
            elseif( v.ServerFunc ) then
                GetNextQuery( 0, v.ReqInfo, {}, function( reqInfo )
                    net.Start( "BRS.Net.AdminGangCMD" )
                        net.WriteUInt( k, 8 )
                        net.WriteUInt( gangID, 16 )
                        net.WriteTable( reqInfo )
                    net.SendToServer()
                end )
            end
        end
    end

    if( self.popoutContent:GetAlpha() != 255 ) then
        self.popoutContent:SetAlpha( 0 )
        self.popoutContent:AlphaTo( 255, 0.2 )
    end

    local popoutTall = self.closeButton:GetTall()+25+infoPanel:GetTall()+25+graphPanel:GetTall()+25+actionGrid:GetTall()+50
    if( self.popout:GetWide() != popoutWide or self.popout:GetTall() != popoutTall ) then
        self.popout:SizeTo( popoutWide, popoutTall, 0.2 )
    end
end

function PANEL:FillMembers()
    self.popoutContent:Clear()

    local topBar = vgui.Create( "DPanel", self.popoutContent )
    topBar:Dock( TOP )
    topBar:DockMargin( 10, 10, 10, 0 )
    topBar:SetTall( 40 )
    topBar.Paint = function( self2, w, h ) 

    end

    local backButton = vgui.Create( "DButton", topBar )
    backButton:Dock( LEFT )
    backButton:SetWide( topBar:GetTall() )
    backButton:SetText( "" )
    local Alpha = 0
    local backMat = Material( "bricks_server/back.png" )
    backButton.Paint = function( self2, w, h ) 
        if( not self2:IsDown() and self2:IsHovered() ) then
            Alpha = math.Clamp( Alpha+5, 0, 100 )
        else
            Alpha = math.Clamp( Alpha-5, 0, 100 )
        end

        surface.SetAlphaMultiplier( Alpha/255 )
        draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )
        surface.SetAlphaMultiplier( 1 )

        BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )

        surface.SetDrawColor( 255, 255, 255, 20+(235*(Alpha/100)) )
        surface.SetMaterial( backMat )
        local iconSize = 24
        surface.DrawTexturedRect( (w/2)-(iconSize/2), (h/2)-(iconSize/2), iconSize, iconSize )
    end
    backButton.DoClick = function()
        self.activePage = BRICKS_SERVER.Func.L( "main" )

        self:RefreshPanel( self.gangID, self.gangTable )
    end

    local searchBarBack = vgui.Create( "DPanel", topBar )
    searchBarBack:Dock( FILL )
    searchBarBack:DockMargin( 5, 0, 0, 0 )
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

    local scrollPanel = vgui.Create( "bricks_server_scrollpanel", self.popoutContent )
    scrollPanel:Dock( FILL )
    scrollPanel:DockMargin( 10, 5, 10, 10 )

    function self.RefreshMembers()
        scrollPanel:Clear()

        local showMembers = {}
        for k, v in pairs( self.gangTable.Members ) do
            if( (searchBar:GetValue() != "" and not string.find( string.lower( v[1] ), string.lower( searchBar:GetValue() ) )) ) then
                continue
            end
            
            local memberPly = player.GetBySteamID( k )

            table.insert( showMembers, { v[2]+((not IsValid( memberPly ) and 100) or 0), IsValid( memberPly ), k, v[1], v[2] } ) -- sort value, online, steamid, name, groupid
        end

        table.SortByMember( showMembers, 1, true )

        for k, v in ipairs( showMembers ) do
            local actions = {}

            table.insert( actions, { BRICKS_SERVER.Func.L( "gangSetRank" ), function()
                local options = {}
                for k, v in pairs( self.gangTable.Roles or {} ) do
                    options[k] = v[1]
                end

                BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "gang" ), BRICKS_SERVER.Func.L( "gangRankQuery" ), (v[5] or 1), options, function( value, data ) 
                    if( (self.gangTable.Roles or {})[data] ) then
                        if( v[5] != data ) then
                            net.Start( "BRS.Net.AdminGangCMD" )
                                net.WriteUInt( 7, 8 )
                                net.WriteUInt( self.gangID, 16 )
                                net.WriteTable( { v[3], data } )
                            net.SendToServer()
                        else
                            notification.AddLegacy( BRICKS_SERVER.Func.L( "gangPlayerAlreadyRank" ), 1, 3 )
                        end
                    else
                        notification.AddLegacy( BRICKS_SERVER.Func.L( "gangInvalidRank" ), 1, 3 )
                    end
                end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
            end } )

            if( self.gangTable.Owner != v[3] ) then
                table.insert( actions, { BRICKS_SERVER.Func.L( "gangKick" ), function()
                    net.Start( "BRS.Net.AdminGangCMD" )
                        net.WriteUInt( 6, 8 )
                        net.WriteUInt( self.gangID, 16 )
                        net.WriteTable( { v[3] } )
                    net.SendToServer()
                end } )

                table.insert( actions, { BRICKS_SERVER.Func.L( "gangSetOwner" ), function()
                    net.Start( "BRS.Net.AdminGangCMD" )
                        net.WriteUInt( 8, 8 )
                        net.WriteUInt( self.gangID, 16 )
                        net.WriteTable( { v[3] } )
                    net.SendToServer()
                end } )
            end

            local playerBack = BRICKS_SERVER.Func.GangCreateMemberSlot( scrollPanel, (self.panelWide*0.3)-20, 75, v[3], v[4], v[5], self.gangTable, actions )
            playerBack:Dock( TOP )
            playerBack:DockMargin( 0, 0, 0, 5 )
        end
    end
    self.RefreshMembers()

    searchBar.OnChange = function()
        self.RefreshMembers()
    end
end

function PANEL:ViewMembers()
    self.activePage = BRICKS_SERVER.Func.L( "gangMembers" )

    self.popoutContent:AlphaTo( 0, 0.1, 0, function()
        self:FillMembers()
        self.popoutContent:AlphaTo( 255, 0.1 )
    end )

    local popoutWide, popoutTall = self.panelWide*0.3, self.panelTall*0.7
    self.popout:SizeTo( popoutWide, popoutTall, 0.2 )
end

function PANEL:Paint( w, h )

end

vgui.Register( "bricks_server_gangmenu_admin_popup", PANEL, "DPanel" )
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/vgui/bricks_server_gangmenu_page_version.lua:
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

        draw.SimpleText( ((gangTable and (gangTable.Name or BRICKS_SERVER.Func.L( "nil" ))) or BRICKS_SERVER.Func.L( "gangNone" )), "BRICKS_SERVER_Font23", textStartPos, h/2+2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_BOTTOM )
        draw.SimpleText( ((groupData and groupData[1]) or "None"), "BRICKS_SERVER_Font17", textStartPos+1, h/2-2, ((groupData and groupData[2]) or BRICKS_SERVER.Func.GetTheme( 6 )), 0, 0 )

        if( iconMat ) then
            surface.SetDrawColor( 255, 255, 255, 255 )
            surface.SetMaterial( iconMat )
            surface.DrawTexturedRect( (avatarBackSize-avatarSize)/2, (avatarBackSize-avatarSize)/2, avatarSize, avatarSize )
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

        draw.RoundedBox( levelBarH/2, 0, h-levelBarH, w, levelBarH, BRICKS_SERVER.Func.GetTheme( 1 ) )
        draw.RoundedBox( levelBarH/2, 0, h-levelBarH, math.Clamp( w*(currentXP/goalXP), 0, w ), levelBarH, BRICKS_SERVER.Func.GetTheme( 5 ) )
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
            surface.DrawTexturedRect( (w/2)-(iconSize/2), (h/2)-(iconSize/2), iconSize, iconSize )
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
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/vgui/bricks_server_gangmenu_roles.lua:
local PANEL = {}

function PANEL:Init()

end

function PANEL:CreatePopup( text )
    if( IsValid( self.popup ) ) then return end

    local margin = 25

    self.popup = vgui.Create( "DPanel", self )
    self.popup:SetSize( self.panelWide-(2*margin), 50 )
    self.popup:SetPos( margin, ScrH()*0.65-40 )
    self.popup:MoveTo( margin, ScrH()*0.65-40-margin-self.popup:GetTall(), 0.2 )
    local yBound = (ScrH()/2)-(ScrH()*0.65/2)
    self.popup.Paint = function( self2, w, h )
        local x, y = self2:LocalToScreen( 0, 0 )

        BRICKS_SERVER.BSHADOWS.BeginShadow( 0, yBound, ScrW(), yBound+(ScrH()*0.65) )
        draw.RoundedBox( 5, x, y, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )			
        BRICKS_SERVER.BSHADOWS.EndShadow( 1, 2, 2, 255, 0, 0, false )
    
        draw.SimpleText( text, "BRICKS_SERVER_Font23", 15, h/2-2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
    end

    return self.popup
end

function PANEL:SettingChanged()
    if( not self.roleChanged ) then
        self.roleChanged = true
        local popup = self:CreatePopup( BRICKS_SERVER.Func.L( "gangUnsavedChanges" ) )

        if( IsValid( popup ) ) then
            surface.SetFont( "BRICKS_SERVER_Font23" )
            local textX, textY = surface.GetTextSize( BRICKS_SERVER.Func.L( "gangSaveChanges" ) )

            local margin = 8

            local saveChanges = vgui.Create( "DButton", popup )
            saveChanges:Dock( RIGHT )
            saveChanges:DockMargin( 0, margin, margin, margin )
            saveChanges:SetWide( textX+10 )
            saveChanges:SetText( "" )
            local alpha = 0
            saveChanges.Paint = function( self2, w, h )
                if( self2:IsDown() ) then
                    alpha = 0
                elseif( self2:IsHovered() ) then
                    alpha = math.Clamp( alpha+10, 0, 255 )
                else
                    alpha = math.Clamp( alpha-10, 0, 255 )
                end

                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.DEVCONFIG.BaseThemes.Green )

                surface.SetAlphaMultiplier( alpha/255 )
                    draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkGreen )		
                surface.SetAlphaMultiplier( 1 )
            
                draw.SimpleText( BRICKS_SERVER.Func.L( "gangSaveChanges" ), "BRICKS_SERVER_Font20", w/2, h/2-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
            end
            saveChanges.DoClick = function()
                local rolesData = util.Compress( util.TableToJSON( self.rolesTableCopy ) )
                net.Start( "BRS.Net.SaveGangRoles" )
                    net.WriteData( rolesData, string.len( rolesData ) )
                net.SendToServer()
            end

            surface.SetFont( "BRICKS_SERVER_Font23" )
            local text2X, text2Y = surface.GetTextSize( BRICKS_SERVER.Func.L( "gangReset" ) )

            local resetChanges = vgui.Create( "DButton", popup )
            resetChanges:Dock( RIGHT )
            resetChanges:DockMargin( margin, 10, margin, margin )
            resetChanges:SetWide( text2X+10 )
            resetChanges:SetText( "" )
            local alpha = 0
            local whiteColor = BRICKS_SERVER.Func.GetTheme( 6 )
            resetChanges.Paint = function( self2, w, h )
                if( self2:IsDown() ) then
                    alpha = 0
                elseif( self2:IsHovered() ) then
                    alpha = math.Clamp( alpha+10, 0, 255 )
                else
                    alpha = math.Clamp( alpha-10, 0, 255 )
                end

                surface.SetAlphaMultiplier( alpha/255 )
                    draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )		
                surface.SetAlphaMultiplier( 1 )
            
                draw.SimpleText( BRICKS_SERVER.Func.L( "gangReset" ), "BRICKS_SERVER_Font20", w/2, h/2-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
            end
            resetChanges.DoClick = function()
                popup:MoveTo( 25, ScrH()*0.65-40, 0.2, 0, -1, function()
                    if( IsValid( popup ) ) then
                        popup:Remove()
                    end
                end )

                self.roleChanged = false
                self.rolesTableCopy = table.Copy( ((BRICKS_SERVER_GANGS or {})[LocalPlayer():GetGangID()] or {}).Roles or {} )

                self.RefreshPanel()
            end
        end
    end
end

function PANEL:FillPanel()
    self:Clear()

    self.sheet = vgui.Create( "bricks_server_colsheet_ranks", self )
    self.sheet:Dock( FILL )
    self.sheet:DockMargin( 10, 10, 10, 10 )

    self.roleChanged = false
    self.rolesTableCopy = table.Copy( ((BRICKS_SERVER_GANGS or {})[LocalPlayer():GetGangID()] or {}).Roles or {} )

    function self.RefreshPanel()
        if( IsValid( self.sheet.ActiveButton ) ) then
            self.previousSheet = self.sheet.ActiveButton.label
        end

        self.sheet:ClearSheets()

        local addNewRole = vgui.Create( "DPanel", self.sheet.Navigation )
        addNewRole:Dock( TOP )
        addNewRole:DockMargin( 0, 0, 0, 0 )
        addNewRole:SetTall( 35 )
        addNewRole.Paint = function( self2, w, h )
            draw.SimpleText( BRICKS_SERVER.Func.L( "gangRanksUpper" ), "BRICKS_SERVER_Font17", 10, h/2, BRICKS_SERVER.Func.GetTheme( 5 ), 0, TEXT_ALIGN_CENTER )
        end

        local addNewRoleButton = vgui.Create( "DButton", addNewRole )
        addNewRoleButton:Dock( RIGHT )
        addNewRoleButton:DockMargin( 0, 0, 0, 0 )
        addNewRoleButton:SetWide( addNewRole:GetTall() )
        addNewRoleButton:SetText( "" )
        local addMat = Material( "bricks_server/add_circle.png" )
        addNewRoleButton.Paint = function( self2, w, h )
            if( self2:IsHovered() ) then
                surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 4 ) )
            else
                surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 5 ) )
            end
			surface.SetMaterial( addMat )
			local iconSize = 16
			surface.DrawTexturedRect( (w/2)-(iconSize/2), (h/2)-(iconSize/2), iconSize, iconSize )
        end
        addNewRoleButton.DoClick = function()
            if( table.Count( self.rolesTableCopy ) >= BRICKS_SERVER.DEVCONFIG.GangRankLimit ) then
                notification.AddLegacy( BRICKS_SERVER.Func.L( "gangRankLimit", BRICKS_SERVER.DEVCONFIG.GangRankLimit ), 1, 5 )
                return
            end

            if( not self.roleChanged ) then
                self:SettingChanged()
            end

            table.insert( self.rolesTableCopy, { BRICKS_SERVER.Func.L( "gangNewRank" ), Color( 189, 195, 199 ), {} } )

            self.RefreshPanel()
        end

        local draggingButton, dragTarget

        local dropSections, buttons = {}, {}
        local function addDropSection( topMargin, belowRank )
            local dropSection = vgui.Create( "DPanel", self.sheet.Navigation )
            dropSection:Dock( TOP )
            dropSection:DockMargin( 5, (topMargin or 0), 5, 0 )
            dropSection:SetTall( 0 )
            dropSection.belowRank = belowRank
            dropSection.Paint = function( self2, w, h )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )
            end
            dropSection.Think = function( self2 )
                if( self2:GetTall() != 0 ) then
                    if( not IsValid( draggingButton ) or dragTarget != self2 ) then
                        self2:SetTall( 0 )
                    else
                        local aboveButton, belowButton = buttons[belowRank], buttons[belowRank+1]

                        local aboveHovered = false
                        if( IsValid( aboveButton ) and aboveButton:IsHovered() ) then
                            aboveHovered = true
                        end

                        local belowHovered = false
                        if( IsValid( belowButton ) and belowButton:IsHovered() ) then
                            belowHovered = true
                        end

                        if( not self2:IsHovered() and not aboveHovered and not belowHovered ) then
                            self2:SetTall( 0 )
                        end
                    end
                end
            end

            table.insert( dropSections, belowRank, dropSection )
        end

        addDropSection( 5, 0 )

        for k, v in ipairs( self.rolesTableCopy ) do
            local rolePanel = vgui.Create( "bricks_server_scrollpanel", self.sheet )
            rolePanel:Dock( FILL )
            rolePanel:DockMargin( 5, 0, 0, 0 )
            rolePanel.Paint = function( self2, w, h ) end
            rolePanel.AddHeader = function( text )
                local roleHeader = vgui.Create( "DPanel", rolePanel )
                roleHeader:Dock( TOP )
                roleHeader:DockMargin( 0, 0, 0, 5 )
                roleHeader:DockPadding( 10, 25, 10, 0 )
                roleHeader:SetTall( 25 )
                roleHeader.Paint = function( self2, w, h )
                    draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )

                    draw.SimpleText( string.upper( text ), "BRICKS_SERVER_Font17", 10, 5, BRICKS_SERVER.Func.GetTheme( 5 ), 0, 0 )
                end

                return roleHeader
            end

            local roleNameBack = rolePanel.AddHeader( BRICKS_SERVER.Func.L( "gangRankName" ) )

            local roleName = vgui.Create( "bricks_server_textentry", roleNameBack )
            roleName:Dock( TOP )
            roleName:DockMargin( 0, 0, 0, 0 )
            roleName:SetTall( 40 )
            roleName:SetValue( v[1] )
            roleName.backColor = BRICKS_SERVER.Func.GetTheme( 2 )
            roleName.OnChange = function()
                if( not self.roleChanged ) then
                    self:SettingChanged()
                end

                self.rolesTableCopy[k][1] = roleName:GetValue()
            end

            roleNameBack:SetTall( roleNameBack:GetTall()+50 )

            local roleColorBack = rolePanel.AddHeader( BRICKS_SERVER.Func.L( "gangRankColor" ) )

            local roleColor = vgui.Create( "DColorMixer", roleColorBack )
            roleColor:Dock( TOP )
            roleColor:DockMargin( 0, 0, 0, 0 )
            roleColor:SetTall( 100 )
            roleColor:SetPalette( false )
            roleColor:SetAlphaBar( false) 
            roleColor:SetWangs( true )
            roleColor:SetColor( v[2] )
            roleColor.ValueChanged = function()
                if( not self.roleChanged ) then
                    self:SettingChanged()
                end

                self.rolesTableCopy[k][2] = roleColor:GetColor()
            end

            roleColorBack:SetTall( roleColorBack:GetTall()+110 )

            local permissions = {}
            for key, val in pairs( BRICKS_SERVER.DEVCONFIG.GangPermissions ) do
                if( not permissions[val[2]] ) then
                    permissions[val[2]] = {}
                end

                permissions[val[2]][key] = val
            end


            for key, val in pairs( permissions ) do
                local rolePermHeaderBack = rolePanel.AddHeader( key .. " Permissions" )
                rolePermHeaderBack:SetTall( rolePermHeaderBack:GetTall()+5 )

                for key2, val2 in pairs( val ) do
                    local rolePermBack = vgui.Create( "DPanel", rolePermHeaderBack )
                    rolePermBack:Dock( TOP )
                    rolePermBack:DockMargin( 0, 0, 0, 5 )
                    rolePermBack:SetTall( 25 )
                    rolePermBack.Paint = function( self2, w, h )
                        draw.SimpleText( val2[1], "BRICKS_SERVER_Font20", 0, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
                    end

                    local rolePermToggle = vgui.Create( "bricks_server_dcheckbox", rolePermBack )
                    rolePermToggle:Dock( RIGHT )
                    rolePermToggle:DockMargin( 0, (rolePermBack:GetTall()-20)/2, 0, (rolePermBack:GetTall()-20)/2 )
                    rolePermToggle:SetWide( 50 )
                    rolePermToggle:SetValue( v[3][key2] or false )
                    rolePermToggle:SetTitle( "" )
                    rolePermToggle.backgroundCol = BRICKS_SERVER.Func.GetTheme( 2 )
                    rolePermToggle.OnChange = function( value )
                        if( not self.roleChanged ) then
                            self:SettingChanged()
                        end
        
                        self.rolesTableCopy[k][3][key2] = value
                    end

                    rolePermHeaderBack:SetTall( rolePermHeaderBack:GetTall()+30 )
                end
            end

            local actionsBack = vgui.Create( "DPanel", rolePanel )
            actionsBack:Dock( TOP )
            actionsBack:DockMargin( 0, 0, 0, 5 )
            actionsBack:SetTall( 35 )
            actionsBack.Paint = function( self2, w, h ) end

            local actions = {
                [1] = {
                    Name = BRICKS_SERVER.Func.L( "gangClearPerms" ),
                    Color = Color( 127, 140, 141 ),
                    Func = function()
                        if( not self.roleChanged ) then
                            self:SettingChanged()
                        end
        
                        self.rolesTableCopy[k][3] = {}

                        self.RefreshPanel()
                    end
                },
                [2] = {
                    Name = BRICKS_SERVER.Func.L( "gangDeleteRank" ),
                    Color = Color( 231, 76, 60 ),
                    Func = function()
                        BRICKS_SERVER.Func.Query( BRICKS_SERVER.Func.L( "gangDeleteRankQuery" ), BRICKS_SERVER.Func.L( "gang" ), BRICKS_SERVER.Func.L( "confirm" ), BRICKS_SERVER.Func.L( "cancel" ), function() 
                            if( table.Count( self.rolesTableCopy ) <= 1 ) then
                                notification.AddLegacy( BRICKS_SERVER.Func.L( "gangRankLowLimit" ), 1, 5 )
                                return
                            end

                            if( not self.roleChanged ) then
                                self:SettingChanged()
                            end
                
                            table.remove( self.rolesTableCopy, k )
                
                            self.RefreshPanel()
                        end )
                    end
                }
            }

            for k, v in ipairs( actions ) do
                surface.SetFont( "BRICKS_SERVER_Font20" )
                local textX, textY = surface.GetTextSize( v.Name )

                local actionButton = vgui.Create( "DButton", actionsBack )
                actionButton:Dock( LEFT )
                actionButton:DockMargin( 0, 0, 5, 0 )
                actionButton:SetText( "" )
                actionButton:SetWide( textX+20 )
                local changeAlpha = 0
                actionButton.Paint = function( self2, w, h )
                    local backColor = v.Color
            
                    if( self2:IsDown() or self2.m_bSelected ) then
                        changeAlpha = math.Clamp( changeAlpha+10, 5, 50 )
                    elseif( self2:IsHovered() ) then
                        changeAlpha = math.Clamp( changeAlpha+10, 5, 25 )
                    else
                        changeAlpha = math.Clamp( changeAlpha-10, 5, 50 )
                    end
            
                    surface.SetAlphaMultiplier( changeAlpha/255 )
                    draw.RoundedBox( 5, 0, 0, w, h, backColor or BRICKS_SERVER.Func.GetTheme( 4 ) )
                    surface.SetAlphaMultiplier( 1 )
            
                    draw.SimpleText( v.Name, "BRICKS_SERVER_Font20", 10, h/2, (backColor or BRICKS_SERVER.Func.GetTheme( 5 )), 0, TEXT_ALIGN_CENTER )
                end
                actionButton.DoClick = v.Func
            end

            local rankSheet = self.sheet:AddSheet( function() return self.rolesTableCopy[k][1] end, rolePanel, function() return self.rolesTableCopy[k][2] end )

            rankSheet.Button.rankID = k
            rankSheet.Button:Droppable( "droppableRank" )
            rankSheet.Button.Think = function( self2 ) 
                if( self2:IsDragging() ) then
                    if( draggingButton != self2 ) then
                        draggingButton = self2
                    end
                elseif( IsValid( draggingButton ) ) then
                    if( draggingButton == self2 ) then
                        draggingButton = nil
                    end

                    if( self2:IsHovered() ) then
                        local targetPanel

                        local w, h = 190, self2:GetTall()
                        local cursorX, cursorY = input.GetCursorPos()
                        local toScreenX, toScreenY = self2:LocalToScreen( 0, 0 )

                        local withinXBounds = false
                        if( cursorX > toScreenX and cursorX < toScreenX+w ) then
                            withinXBounds = true
                        end

                        if( withinXBounds ) then
                            if( cursorY > toScreenY and cursorY < toScreenY+(h/2) ) then
                                if( dropSections[k-1] and IsValid( dropSections[k-1] ) ) then
                                    targetPanel = dropSections[k-1]
                                end
                            elseif( cursorY > toScreenY+(h/2) and cursorY < toScreenY+h ) then
                                if( dropSections[k] and IsValid( dropSections[k] ) ) then
                                    targetPanel = dropSections[k]
                                end
                            end
                            
                            if( IsValid( targetPanel ) and IsValid( draggingButton ) and targetPanel:GetTall() == 0 and targetPanel.belowRank != draggingButton.rankID-1 and targetPanel.belowRank != draggingButton.rankID ) then
                                dragTarget = targetPanel
                                targetPanel:SetTall( 30 )
                            end
                        end
                    end
                end
            end
            rankSheet.Button.OnStopDragging = function( self2 )
                if( not IsValid( dragTarget ) ) then return end

                local dropPanelRank = self2.rankID
                local receiverRank = dragTarget.belowRank

                if( dropPanelRank == receiverRank ) then return end

                local newRankPos
                if( dropPanelRank != 1 and receiverRank == 0 ) then
                    newRankPos = 1
                elseif( receiverRank == #self.rolesTableCopy ) then
                    newRankPos = #self.rolesTableCopy
                elseif( receiverRank != 0 ) then
                    newRankPos = receiverRank+1
                end

                if( newRankPos ) then
                    local rankTable = table.Copy( self.rolesTableCopy[dropPanelRank] )

                    table.remove( self.rolesTableCopy, dropPanelRank )
                    table.insert( self.rolesTableCopy, newRankPos, rankTable )

                    if( not self.roleChanged ) then
                        self:SettingChanged()
                    end
        
                    self.RefreshPanel()
                end
            end

            table.insert( buttons, k, rankSheet.Button )

            addDropSection( 0, k )
        end

        if( self.previousSheet ) then
            self.sheet:SetActiveSheet( self.previousSheet )
        end
    end
    self.RefreshPanel()
end

function PANEL:Paint( w, h )

end

vgui.Register( "bricks_server_gangmenu_roles", PANEL, "DPanel" )
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/vgui/bricks_server_gangmenu_settings.lua:
local PANEL = {}

function PANEL:Init()
    self.animMultiplier = 0
    self.leftBorderW = BRICKS_SERVER.Func.ScreenScale( 6 )

    local margin50 = BRICKS_SERVER.Func.ScreenScale( 50 )

    self.scrollPanel = vgui.Create( "bricks_server_scrollpanel", self )
    self.scrollPanel:Dock( FILL )
    self.scrollPanel:DockMargin( margin50, margin50, margin50, margin50 )
end

function PANEL:FillPanel( gangTable )
    self.gangTable = table.Copy( gangTable )
    self:Refresh()

    hook.Add( "BRS.Hooks.RefreshGang", self, function( self, valuesChanged )
        if( not valuesChanged or not (valuesChanged["Name"] or valuesChanged["Icon"]) ) then return end

        self.gangTable = table.Copy( (BRICKS_SERVER_GANGS or {})[LocalPlayer():GetGangID()] or {} )

        self:Refresh()
    end )
end

function PANEL:CreateSettingPanel( parent, h, text, subText )
    local rounding = BRICKS_SERVER.Func.ScreenScale( 10 )
    local margin10 = BRICKS_SERVER.Func.ScreenScale( 10 )
    local margin25 = BRICKS_SERVER.Func.ScreenScale( 25 )

    local errorIconMat = Material( "bricks_server/step_error.png", "noclamp smooth" )
    local completedIconMat = Material( "bricks_server/step_completed.png", "noclamp smooth" )
    local iconSize = BRICKS_SERVER.Func.ScreenScale( 24 )

    surface.SetFont( "BRICKS_SERVER_Font22B" )
    local textW, textH = surface.GetTextSize( string.upper( text ) )

    surface.SetFont( "BRICKS_SERVER_Font20B" )
    local subTextW, subTextH = surface.GetTextSize( subText )

    local settingPanel = vgui.Create( "DPanel", parent )
    settingPanel:Dock( TOP )
    settingPanel:SetTall( h )
    settingPanel:DockMargin( 0, 0, 0, margin25 )
    settingPanel.leftW = BRICKS_SERVER.Func.ScreenScale( 50 )
    settingPanel.Paint = function( self2, w, h )
        draw.RoundedBox( rounding, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )
        draw.RoundedBox( rounding, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2, 200 ) )

        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 3, 100 ) )
        surface.DrawRect( self.leftBorderW, 0, self2.leftW, h )

        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6, 10 ) )
        surface.SetMaterial( self2.completed and completedIconMat or errorIconMat )
        surface.DrawTexturedRect( self.leftBorderW+self2.leftW/2-iconSize/2, h/2-iconSize/2, iconSize, iconSize )

        BRICKS_SERVER.Func.DrawPartialRoundedBox( rounding, 0, 0, 6, h, self2.completed and BRICKS_SERVER.DEVCONFIG.BaseThemes.Green or BRICKS_SERVER.DEVCONFIG.BaseThemes.Red, 2*self.leftBorderW, h )
    
        local leftMargin = self.leftBorderW+self2.leftW+margin25
        draw.SimpleText( string.upper( text ), "BRICKS_SERVER_Font22B", leftMargin, margin25, BRICKS_SERVER.Func.GetTheme( 5 ) )
        draw.SimpleText( subText, "BRICKS_SERVER_Font20B", leftMargin, margin25+textH, BRICKS_SERVER.Func.GetTheme( 6, 50 ) )
    end
    settingPanel.requirementEntries = {}
    settingPanel.AddRequirement = function( self2, requirementText, hasPassed, infoFunc )
        surface.SetFont( "BRS.Font.Bold20" )
        requirementText = string.upper( requirementText )

        local tickIconMat = Material( "bricks_server/accept_16.png" )
        local crossIconMat = Material( "bricks_server/decline_16.png" )
        local iconSize = BRICKS_SERVER.Func.ScreenScale( 16 )
    
        local requirementEntry = vgui.Create( "DPanel", self2.requirementsPanel )
        requirementEntry:Dock( LEFT )
        requirementEntry:SetWide( self2.requirementsPanel:GetTall()+surface.GetTextSize( requirementText )+margin10+(infoFunc and self2.requirementsPanel:GetTall() or 0) )
        requirementEntry:DockMargin( 0, 0, margin10, 0 )
        requirementEntry.hasPassed = hasPassed()
        requirementEntry.Paint = function( self2, w, h )
            local highlightColor = self2.hasPassed and BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkGreen or BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkRed

            draw.RoundedBox( 5, 0, 0, w, h, Color( highlightColor.r, highlightColor.g, highlightColor.b, 25 ) )

            surface.SetDrawColor( highlightColor )
            surface.SetMaterial( self2.hasPassed and tickIconMat or crossIconMat )
            surface.DrawTexturedRect( h/2-iconSize/2, h/2-iconSize/2, iconSize, iconSize )

            draw.SimpleText( requirementText, "BRS.Font.Bold20", w-margin10-(infoFunc and h or 0), h/2-1, highlightColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
        end

        if( infoFunc ) then
            local infoButton = vgui.Create( "DButton", requirementEntry )
            infoButton:Dock( RIGHT )
            infoButton:SetWide( self2.requirementsPanel:GetTall() )
            infoButton:SetText( "" )
            infoButton.Paint = function( self2, w, h )
                draw.RoundedBoxEx( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 6, 5+(self2:IsHovered() and 5 or 0) ), false, true, false, true )
        
                draw.SimpleText( "!", "BRICKS_SERVER_Font30B", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6, 50 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
            end
            infoButton.DoClick = infoFunc
        end

        local reqWide = self2.requirementsPanel:GetWide()
        self2.requirementsPanel:SetWide( reqWide+(reqWide != 0 and margin10 or 0)+requirementEntry:GetWide() )

        table.insert( self2.requirementEntries, { requirementEntry, hasPassed } )
    end
    settingPanel.UpdateCompletion = function( self2 )
        local requirementsCompleted = true
        for k, v in ipairs( self2.requirementEntries ) do
            local passed = v[2]()
            v[1].hasPassed = passed

            if( passed ) then continue end
            requirementsCompleted = false
        end

        self2.completed = self2.isCompletedFunc( requirementsCompleted )
    end

    settingPanel.requirementsPanel = vgui.Create( "Panel", settingPanel )
    settingPanel.requirementsPanel:SetTall( BRICKS_SERVER.Func.ScreenScale( 30 ) )
    settingPanel.requirementsPanel:SetPos( self.leftBorderW+settingPanel.leftW+margin25+subTextW+margin25, margin25+(textH+subTextH)/2-settingPanel.requirementsPanel:GetTall()/2 )

    table.insert( self.settingPanels, settingPanel )
    return settingPanel
end

function PANEL:Refresh()
    self.settingsTable = {
        name = self.gangTable.Name,
        icon = self.gangTable.Icon,
        colour = self.gangTable.Colour
    }

    self.settingPanels = {}
    self.settingsChanged = false

    self.scrollPanel:Clear()

    local rounding = BRICKS_SERVER.Func.ScreenScale( 10 )
    local margin5 = BRICKS_SERVER.Func.ScreenScale( 5 )
    local margin10 = BRICKS_SERVER.Func.ScreenScale( 10 )
    local margin25 = BRICKS_SERVER.Func.ScreenScale( 25 )
    local margin50 = BRICKS_SERVER.Func.ScreenScale( 50 )

    -- Second Step
    local secondPanel = self:CreateSettingPanel( self.scrollPanel, BRICKS_SERVER.Func.ScreenScale( 185 ), "Изображение банды", "Изображение будет показано рядом с вашей бандой." )

    secondPanel.bottom = vgui.Create( "Panel", secondPanel )
    secondPanel.bottom:Dock( BOTTOM )
    secondPanel.bottom:SetTall( BRICKS_SERVER.Func.ScreenScale( 75 ) )
    secondPanel.bottom:DockMargin( self.leftBorderW+secondPanel.leftW+margin25, 0, margin25, margin25 )

    local unselectedIconMat = Material( "bricks_server/icon_unselected.png" )
    local loadingNewIcon, newGangIconMat = false

    local currentIconDisplay = vgui.Create( "Panel", secondPanel.bottom )
    currentIconDisplay:Dock( LEFT )
    currentIconDisplay:SetWide( BRICKS_SERVER.Func.ScreenScale( 75 ) )
    currentIconDisplay.Paint = function( self2, w, h )
        draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0, 100 ) )

        if( loadingNewIcon ) then
            if( CurTime() >= (self2.loadingStart or 0)+1.5 ) then
                self2.loadingStart = CurTime()
            end

            local percent = math.Clamp( (CurTime()-self2.loadingStart)/1.5, 0, 1 )

            local entrySize, entryMargin = BRICKS_SERVER.Func.ScreenScale( 10 ), margin5
            local yOffset = margin5
            local totalEntryW = 3*(entrySize+entryMargin)-entryMargin
            for i = 1, 3 do
                local min = (i-1)*(1/3)
                local isActive = percent >= min and percent < i*(1/3)
                local entryPercent = math.Clamp( (percent-min)*3, 0, 1 )
                local yAdjustment = isActive and (entryPercent < 0.5 and (entryPercent/0.5)*yOffset or yOffset-((entryPercent-0.5)/0.5*yOffset)) or 0

                surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 3 ) )
                surface.DrawRect( w/2-totalEntryW/2+(i-1)*(entryMargin+entrySize), h/2-entrySize/2-yAdjustment, entrySize, entrySize )
            end

            return
        end
        
        local unselectedIconSize = newGangIconMat and h*0.75 or BRICKS_SERVER.Func.ScreenScale( 64 )

        surface.SetDrawColor( newGangIconMat and BRICKS_SERVER.DEVCONFIG.BaseThemes.White or BRICKS_SERVER.Func.GetTheme( 2 ) )
        surface.SetMaterial( newGangIconMat or unselectedIconMat )
        surface.DrawTexturedRect( w/2-unselectedIconSize/2, h/2-unselectedIconSize/2, unselectedIconSize, unselectedIconSize )
    end

    local presetsSpacer = vgui.Create( "Panel", secondPanel.bottom )
    presetsSpacer:Dock( LEFT )
    presetsSpacer:SetWide( 4 )
    presetsSpacer:DockMargin( margin50, margin10, margin50, margin10 )
    presetsSpacer.Paint = function( self2, w, h )
        draw.RoundedBox( w/2, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0, 100 ) )
    end

    surface.SetFont( "BRICKS_SERVER_Font20B" )

    local presetsHeader = vgui.Create( "Panel", secondPanel.bottom )
    presetsHeader:Dock( LEFT )
    presetsHeader:SetWide( surface.GetTextSize( "Default icons" ) )
    presetsHeader.Paint = function( self2, w, h )
        draw.SimpleText( "Пресеты", "BRICKS_SERVER_Font22B", 0, h/2+2, BRICKS_SERVER.Func.GetTheme( 4 ), 0, TEXT_ALIGN_BOTTOM )
        draw.SimpleText( "Стандартные иконки", "BRICKS_SERVER_Font20B", 0, h/2-2, BRICKS_SERVER.Func.GetTheme( 6, 50 ), 0, 0 )
    end

    local presetsPanel = vgui.Create( "Panel", secondPanel.bottom )
    presetsPanel:Dock( LEFT )
    presetsPanel:SetTall( secondPanel.bottom:GetTall()-2*margin5 )
    presetsPanel:DockMargin( margin25, margin5, 0, margin5 )

    local customUrlEntry

    for k, v in ipairs( BRICKS_SERVER.DEVCONFIG.PresetGangIcons ) do
        local presetIconMat = Material( v, "noclamp smooth" )

        if( self.settingsTable.icon == v ) then
            newGangIconMat = presetIconMat
        end
    
        local currentIconDisplay = vgui.Create( "DButton", presetsPanel )
        currentIconDisplay:Dock( LEFT )
        currentIconDisplay:SetWide( presetsPanel:GetTall() )
        currentIconDisplay:DockMargin( 0, 0, margin5, 0 )
        currentIconDisplay:SetText( "" )
        currentIconDisplay.Paint = function( self2, w, h )
            local isSelected = v == self.settingsTable.icon
            self2.hoverAlpha = math.Clamp( (self2.hoverAlpha or 0)+(self2:IsHovered() and 5 or -5), 0, 100 )

            draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0, 100+(isSelected and 50 or self2.hoverAlpha) ) )

            local borderH = 3
            BRICKS_SERVER.Func.DrawPartialRoundedBox( 5, 0, h-borderH, w, borderH, BRICKS_SERVER.Func.GetTheme( 5, isSelected and 255 or self2.hoverAlpha ), w, 10, 0, h-10 )

            local iconSize = h*0.75
    
            surface.SetDrawColor( 255, 255, 255 )
            surface.SetMaterial( presetIconMat )
            surface.DrawTexturedRect( w/2-iconSize/2, h/2-iconSize/2, iconSize, iconSize )
        end
        currentIconDisplay.DoClick = function()
            if( self.settingsTable.icon == v ) then
                self.settingsTable.icon = ""
                newGangIconMat = nil
            else
                self.settingsTable.icon = v
                newGangIconMat = presetIconMat
                loadingNewIcon = false
                customUrlEntry:SetValue( "" )
            end

            secondPanel:UpdateCompletion()
            self:SettingChanged()
        end
    end

    presetsPanel:SetWide( #BRICKS_SERVER.DEVCONFIG.PresetGangIcons*(presetsPanel:GetTall()+margin5)-margin5 )

    local customSpacer = vgui.Create( "Panel", secondPanel.bottom )
    customSpacer:Dock( LEFT )
    customSpacer:SetWide( 4 )
    customSpacer:DockMargin( margin50, margin10, margin50, margin10 )
    customSpacer.Paint = function( self2, w, h )
        draw.RoundedBox( w/2, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0, 100 ) )
    end
    
    local customHeader = vgui.Create( "Panel", secondPanel.bottom )
    customHeader:Dock( LEFT )
    customHeader:SetWide( surface.GetTextSize( "A custom icons" ) )
    customHeader.Paint = function( self2, w, h )
        draw.SimpleText( "Кастом", "BRICKS_SERVER_Font22B", 0, h/2+2, BRICKS_SERVER.Func.GetTheme( 4 ), 0, TEXT_ALIGN_BOTTOM )
        draw.SimpleText( "Иконка", "BRICKS_SERVER_Font20B", 0, h/2-2, BRICKS_SERVER.Func.GetTheme( 6, 50 ), 0, 0 )
    end

    local customEntryBar = vgui.Create( "Panel", secondPanel.bottom )
    customEntryBar:Dock( LEFT )
    customEntryBar:SetWide( ScrW()*0.1 )
    local verticalMargin = (secondPanel.bottom:GetTall()-BRICKS_SERVER.Func.ScreenScale( 40 ))/2
    customEntryBar:DockMargin( margin25, verticalMargin, 0, verticalMargin )
    customEntryBar.Paint = function( self2, w, h )
        if( not IsValid( customUrlEntry ) or customUrlEntry:GetValue() == "" or customUrlEntry:GetValue() == self.settingsTable.icon ) then return end

        local oldClipping = DisableClipping( true )
        draw.SimpleText( "Нажмите Enter что бы продолжить", "BRICKS_SERVER_Font20B", w/2, h, BRICKS_SERVER.Func.GetTheme( 6, 50 ), TEXT_ALIGN_CENTER, 0 )
        DisableClipping( oldClipping )
    end

    customUrlEntry = vgui.Create( "bricks_server_textentry", customEntryBar )
    customUrlEntry:Dock( BOTTOM )
    customUrlEntry:SetTall( BRICKS_SERVER.Func.ScreenScale( 40 ) )
    customUrlEntry:DockMargin( 0, 0, 0, 0 )
    customUrlEntry:SetFont( "BRICKS_SERVER_Font22" )
    customUrlEntry.backColor = BRICKS_SERVER.Func.GetTheme( 0, 100 )
    customUrlEntry.UpdateIcon = function( self2 )
        loadingNewIcon = true
        newGangIconMat = nil

        BRICKS_SERVER.Func.GetImage( self.settingsTable.icon, function( mat )
            if( self.settingsTable.icon != self.settingsTable.icon ) then return end
            newGangIconMat = mat 
            loadingNewIcon = false
        end )
    end
    customUrlEntry.OnEnter = function( self2 )
        self.settingsTable.icon = self2:GetValue()

        secondPanel:UpdateCompletion()
        self:SettingChanged()

        self2:UpdateIcon()
    end

    if( not newGangIconMat ) then
        customUrlEntry:SetValue( self.settingsTable.icon )
        customUrlEntry:UpdateIcon()
    end

    local validImageEndings = { ".png", ".jpg", ".jpeg" }
    secondPanel:AddRequirement( ".png, .jpg или .jpeg", function() 
        if( table.HasValue( BRICKS_SERVER.DEVCONFIG.PresetGangIcons, self.settingsTable.icon ) ) then return true end

        for _, v in ipairs( validImageEndings ) do
            if( string.EndsWith( self.settingsTable.icon, v ) ) then return true end
        end

        return false
    end )

    -- BRICKS_SERVER.DEVCONFIG.GangURLWhitelist
    -- Show whitelsited urls when hovering?
    secondPanel:AddRequirement( "Вайтлист сайтов", function() 
        if( table.HasValue( BRICKS_SERVER.DEVCONFIG.PresetGangIcons, self.settingsTable.icon ) ) then return true end

        for _, v in ipairs( BRICKS_SERVER.DEVCONFIG.GangURLWhitelist ) do
            if( string.StartWith( self.settingsTable.icon, v ) ) then return true end
        end

        return false
    end, function( self2 )
        if( IsValid( self2.hoverPopup ) ) then
            self2.hoverPopup:Remove()
        end

        local x, y = self2:LocalToScreen( 0, 0 )

        self2.hoverPopup = vgui.Create( "DFrame" )
        self2.hoverPopup:SetSize( 300, 500 )
        self2.hoverPopup:Center()
        self2.hoverPopup:MakePopup()
        self2.hoverPopup:SetTitle( "" )
        self2.hoverPopup:DockPadding( 25, 50, 0, 0 )

        for k, v in ipairs( BRICKS_SERVER.DEVCONFIG.GangURLWhitelist ) do
            local urlEntry = vgui.Create( "DLabel", self2.hoverPopup )
            urlEntry:Dock( TOP )
            urlEntry:SetText( v )
            urlEntry:SetFont( "Trebuchet24" )
            urlEntry:SizeToContentsY()
        end
    end )

    secondPanel.isCompletedFunc = function( requirementsPassed )
        return requirementsPassed
    end

    secondPanel:UpdateCompletion()

    -- Third Step
    -- local thirdPanel = self:CreateSettingPanel( self.scrollPanel, BRICKS_SERVER.Func.ScreenScale( 160 ), "Gang Colour", "The colour of your gang, displayed in various places." )

    -- thirdPanel.bottom = vgui.Create( "Panel", thirdPanel )
    -- thirdPanel.bottom:Dock( BOTTOM )
    -- thirdPanel.bottom:SetTall( BRICKS_SERVER.Func.ScreenScale( 50 ) )
    -- thirdPanel.bottom:DockMargin( self.leftBorderW+thirdPanel.leftW+margin25, 0, margin25, margin25 )

    -- local colourOptions = { 
    --     Color( 244, 67, 54 ),
    --     Color( 233, 30, 99 ),
    --     Color( 156, 39, 176 ),
    --     Color( 103, 58, 183 ),
    --     Color( 63, 81, 181 ),
    --     Color( 33, 150, 243 ),
    --     Color( 3, 169, 244 ),
    --     Color( 0, 188, 212 ),
    --     Color( 0, 150, 136 ),
    --     Color( 76, 175, 80 ),
    --     Color( 139, 195, 74 ),
    --     Color( 205, 220, 57 ),
    --     Color( 255, 235, 59 ),
    --     Color( 255, 193, 7 ),
    --     Color( 255, 152, 0 ),
    --     Color( 255, 87, 34 )
    -- }

    -- local colourEntrySize = math.floor( (thirdPanel.bottom:GetTall()-margin5)/2 )

    -- local colourGrid = vgui.Create( "DIconLayout", thirdPanel.bottom )
    -- colourGrid:Dock( LEFT )
    -- colourGrid:SetWide( (math.ceil( #colourOptions/2 )*(colourEntrySize+margin5))-margin5 )
    -- colourGrid:SetSpaceX( margin5 )
    -- colourGrid:SetSpaceY( margin5 )
    
    -- local whiteColour = BRICKS_SERVER.DEVCONFIG.BaseThemes.White
    -- local circleBorder = BRICKS_SERVER.Func.ScreenScale( 2 )
    -- for k, v in ipairs( colourOptions ) do
    --     local colourEntry = vgui.Create( "DButton", colourGrid )
    --     colourEntry:SetSize( colourEntrySize, colourEntrySize )
    --     colourEntry:SetText( "" )
    --     colourEntry.Paint = function( self2, w, h )
    --         self2.hoverAlpha = math.Clamp( (self2.hoverAlpha or 0)+(self2:IsHovered() and 5 or -5), 0, 100 )

    --         local isSelected = v == self.settingsTable.colour
    --         if( isSelected or self2.hoverAlpha != 0 ) then
    --             local oldClipping = DisableClipping( true )
    --             surface.SetAlphaMultiplier( isSelected and 1 or self2.hoverAlpha/255 )
    --             BRICKS_SERVER.Func.DrawCircle( w/2, h/2, w/2+circleBorder, whiteColour )
    --             surface.SetAlphaMultiplier( 1 )
    --             DisableClipping( oldClipping )
    --         end

    --         BRICKS_SERVER.Func.DrawCircle( w/2, h/2, w/2, v )
    --     end
    --     colourEntry.DoClick = function()
    --         if( self.settingsTable.colour == v ) then
    --             self.settingsTable.colour = nil
    --         else
    --             self.settingsTable.colour = v
    --         end

    --         thirdPanel:UpdateCompletion()
    --         self:SettingChanged()
    --     end
    -- end

    -- thirdPanel.isCompletedFunc = function( requirementsPassed )
    --     return self.settingsTable.colour != nil
    -- end

    -- thirdPanel:UpdateCompletion()
end

function PANEL:SettingChanged()
    if( self.settingsChanged ) then
        local shouldRemove = true
        if( self.settingsTable.name != self.gangTable.Name ) then
            shouldRemove = false
        elseif( self.settingsTable.icon != self.gangTable.Icon ) then
            shouldRemove = false
        end

        if( shouldRemove and IsValid( self.popup ) ) then
            self.settingsChanged = false
            self.popup:Close()
        end

        return 
    end

    self.settingsChanged = true

    if( IsValid( self.popup ) ) then return end

    local margin25 = BRICKS_SERVER.Func.ScreenScale( 25 )

    local warningIconMat = Material( "bricks_server/gang_warning.png", "noclamp smooth" )
    local warningIconSize = BRICKS_SERVER.Func.ScreenScale( 64 )

    local popup = vgui.Create( "DPanel", self )
    popup:SetSize( self.panelWide-(2*margin25), BRICKS_SERVER.Func.ScreenScale( 100 ) )
    popup:SetPos( margin25, ScrH()*0.65-40 )
    popup:MoveTo( margin25, ScrH()*0.65-40-margin25-popup:GetTall(), 0.2 )
    local yBound = (ScrH()/2)-(ScrH()*0.65/2)
    popup.Paint = function( self2, w, h )
        local x, y = self2:LocalToScreen( 0, 0 )

        BRICKS_SERVER.BSHADOWS.BeginShadow( 0, yBound, ScrW(), yBound+(ScrH()*0.65) )
        draw.RoundedBox( 8, x, y, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )
        BRICKS_SERVER.BSHADOWS.EndShadow( 1, 1, 1, 255, 0, 0, false )

        draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3, 50 ) )
    
        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6, 15 ) )
        surface.SetMaterial( warningIconMat )
        surface.DrawTexturedRect( self.leftBorderW+h/2-warningIconSize/2, h/2-warningIconSize/2, warningIconSize, warningIconSize )

        draw.SimpleText( "Предупреждение", "BRICKS_SERVER_Font30B", h, h/2+BRICKS_SERVER.Func.ScreenScale( 2 ), BRICKS_SERVER.Func.GetTheme( 5 ), 0, TEXT_ALIGN_BOTTOM )
        draw.SimpleText( BRICKS_SERVER.Func.L( "gangUnsavedChanges" ), "BRICKS_SERVER_Font21", h, h/2-BRICKS_SERVER.Func.ScreenScale( 2 ), BRICKS_SERVER.Func.GetTheme( 6, 100 ), 0, 0 )
    end
    popup.Close = function( self2 )
        self2:MoveTo( margin25, ScrH()*0.65-40, 0.2, 0, -1, function()
            self2:Remove()
        end )
    end

    self.popup = popup

    local gradient = vgui.Create( "bricks_server_gradientanim", popup )
    gradient:SetPos( 0, 0 )
    gradient:SetSize( self.leftBorderW, popup:GetTall() )
    gradient:SetDirection( 1 )
    gradient:SetCornerRadius( rounding )
    gradient:SetRoundedBoxDimensions( false, false, 20, false )
    gradient:TasteTheRainbow()
    gradient:StartAnim()

    surface.SetFont( "BRICKS_SERVER_Font22B" )
    local text2X, text2Y = surface.GetTextSize( BRICKS_SERVER.Func.L( "gangReset" ) )

    local resetChanges = vgui.Create( "DButton", popup )
    resetChanges:Dock( RIGHT )
    resetChanges:DockMargin( 0, margin25, margin25, margin25 )
    resetChanges:SetWide( text2X+BRICKS_SERVER.Func.ScreenScale( 25 ) )
    resetChanges:SetText( "" )
    local alpha = 0
    local whiteColor = BRICKS_SERVER.Func.GetTheme( 6 )
    resetChanges.Paint = function( self2, w, h )
        self2.hoverAlpha = math.Clamp( (self2.hoverAlpha or 0)+(self2:IsHovered() and 5 or -5), 0, 100 )

        draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3, 25+self2.hoverAlpha ) )
    
        draw.SimpleText( BRICKS_SERVER.Func.L( "gangReset" ), "BRICKS_SERVER_Font22B", w/2, h/2-1, BRICKS_SERVER.Func.GetTheme( 6, 25 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
    end
    resetChanges.DoClick = function()
        popup:Close()
        self:Refresh()
    end

    surface.SetFont( "BRICKS_SERVER_Font22B" )
    local textX = surface.GetTextSize( BRICKS_SERVER.Func.L( "gangSaveChanges" ) )

    local saveIconMat = Material( "bricks_server/gang_save.png", "noclamp smooth" )
    local saveIconSize = BRICKS_SERVER.Func.ScreenScale( 24 )
    
    local contentMargin = BRICKS_SERVER.Func.ScreenScale( 10 )

    local saveChanges = vgui.Create( "DButton", popup )
    saveChanges:Dock( RIGHT )
    saveChanges:DockMargin( 0, margin25, margin25, margin25 )
    saveChanges:SetWide( textX+saveIconSize+2*contentMargin+BRICKS_SERVER.Func.ScreenScale( 10 ) )
    saveChanges:SetText( "" )
    local alpha = 0
    saveChanges.Paint = function( self2, w, h )
        self2.hoverAlpha = math.Clamp( (self2.hoverAlpha or 0)+(self2:IsHovered() and 5 or -5), 0, 100 )

        self2.isPossible = true
        for k, v in ipairs( self.settingPanels ) do
            if( not v.completed ) then 
                self2.isPossible = false
                break
            end
        end

        draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3, 50+self2.hoverAlpha ) )

        local edgeH = 4
        BRICKS_SERVER.Func.DrawPartialRoundedBox( 8, 0, h-edgeH, w, edgeH, self2.isPossible and BRICKS_SERVER.DEVCONFIG.BaseThemes.Green or BRICKS_SERVER.DEVCONFIG.BaseThemes.Red, w, 2*edgeH, 0, h-2*edgeH )

        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6, 50 ) )
        surface.SetMaterial( saveIconMat )
        surface.DrawTexturedRect( contentMargin, h/2-saveIconSize/2, saveIconSize, saveIconSize )
    
        draw.SimpleText( BRICKS_SERVER.Func.L( "gangSaveChanges" ), "BRICKS_SERVER_Font22B", w-contentMargin, h/2-1, BRICKS_SERVER.Func.GetTheme( 6, 50 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
    end
    saveChanges.DoClick = function( self2 )
        if( not self2.isPossible ) then return end

        popup:Close()

        net.Start( "BRS.Net.SaveGangSettings" )
            net.WriteString( self.settingsTable.name )
            net.WriteString( self.settingsTable.icon )
            -- net.WriteColor( self.settingsTable.colour )
        net.SendToServer()
    end
end

function PANEL:Paint( w, h )

end

vgui.Register( "bricks_server_gangmenu_settings", PANEL, "DPanel" )
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/submodules/achievements/vgui/bricks_server_config_gang_achievements.lua:
local PANEL = {}

function PANEL:Init()

end

function PANEL:FillPanel( configPanel )
    function self.RefreshPanel()
        self:Clear()

        local sortedAchievements = {}
        for k, v in pairs( BS_ConfigCopyTable.GANGS.Achievements or {} ) do
            local achievementTable = v
            achievementTable.Key = k

            table.insert( sortedAchievements, achievementTable )
        end

        table.SortByMember( sortedAchievements, "Name", true )

        for k, v in pairs( sortedAchievements ) do
            local devConfigTable = BRICKS_SERVER.DEVCONFIG.GangAchievements[v.Type or v.Key]

            local itemActions = {
                [1] = { BRICKS_SERVER.Func.L( "edit" ), function()
                    BRICKS_SERVER.Func.CreateAchievementEditor( v, function( achievementTable ) 
                        BS_ConfigCopyTable.GANGS.Achievements[v.Key] = achievementTable
                        BRICKS_SERVER.Func.ConfigChange( "GANGS" )
                        self.RefreshPanel()
                    end, function() end )
                end },
                [2] = { BRICKS_SERVER.Func.L( "remove" ), function()
                    BS_ConfigCopyTable.GANGS.Achievements[v.Key] = nil
                    BRICKS_SERVER.Func.ConfigChange( "GANGS" )
                    self.RefreshPanel()
                end, BRICKS_SERVER.DEVCONFIG.BaseThemes.Red, BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkRed }
            }


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
    
            draw.SimpleText( BRICKS_SERVER.Func.L( "gangAddAchievement" ), "BRICKS_SERVER_Font25", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
        addNewButton.DoClick = function()
            local options = {}
			for k, v in pairs( BRICKS_SERVER.DEVCONFIG.GangAchievements ) do
				options[k] = v.Name
			end

			BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "gangNewAchievementType" ), "", options, function( value, data ) 
				if( options[data] and BRICKS_SERVER.DEVCONFIG.GangAchievements[data] ) then
                    table.insert( BS_ConfigCopyTable.GANGS.Achievements, {
                        Name = BRICKS_SERVER.Func.L( "gangNewAchievement" ), 
                        Description = BRICKS_SERVER.Func.L( "noDescription" ),
                        Icon = "gang_achievements.png",
                        Type = data,
                        ReqInfo = {},
                        Rewards = {}
                    } )

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

vgui.Register( "bricks_server_config_gang_achievements", PANEL, "bricks_server_scrollpanel" )
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/submodules/associations/client/cl_gang_associations.lua:
net.Receive( "BRS.Net.SendGangAssociations", function()
    if( not BRS_GANG_ASSOCIATIONS ) then
        BRS_GANG_ASSOCIATIONS = {}
    end

    for k, v in pairs( net.ReadTable() or {} ) do
        if( not BRS_GANG_ASSOCIATIONS[k] ) then
            BRS_GANG_ASSOCIATIONS[k] = v
            continue
        end

        table.Merge( BRS_GANG_ASSOCIATIONS[k], v )
    end

    hook.Run( "BRS.Hooks.RefreshGangAssociations" )
end )

net.Receive( "BRS.Net.SendGangAssociationValue", function()
    local gang1ID = net.ReadUInt( 16 )
    local gang2ID = net.ReadUInt( 16 )
    local associationType = net.ReadString()

    if( not BRS_GANG_ASSOCIATIONS ) then
        BRS_GANG_ASSOCIATIONS = {}
    end

    if( BRS_GANG_ASSOCIATIONS[gang2ID] and BRS_GANG_ASSOCIATIONS[gang2ID][gang1ID] ) then
        BRS_GANG_ASSOCIATIONS[gang2ID][gang1ID] = nil
    end

    if( not BRS_GANG_ASSOCIATIONS[gang1ID] ) then
        BRS_GANG_ASSOCIATIONS[gang1ID] = {}
    end

    if( associationType and BRICKS_SERVER.DEVCONFIG.GangAssociationTypes[associationType] ) then
        BRS_GANG_ASSOCIATIONS[gang1ID][gang2ID] = associationType
    else
        BRS_GANG_ASSOCIATIONS[gang1ID][gang2ID] = nil
    end

    hook.Run( "BRS.Hooks.RefreshGangAssociations" )
end )

net.Receive( "BRS.Net.SendAssociationGangTables", function()
    hook.Run( "BRS.Hooks.RefreshGangAssociations", net.ReadTable() or {} )
end )

function BRICKS_SERVER.Func.RequestAssociationGangs( searchString )
    if( CurTime() < (BRS_REQUEST_ASSOCIATIONGANG_COOLDOWN or 0) ) then return false, BRICKS_SERVER.Func.L( "gangRequestCooldown" ), ((BRS_REQUEST_ASSOCIATIONGANG_COOLDOWN or 0)-CurTime()) end

    BRS_REQUEST_ASSOCIATIONGANG_COOLDOWN = CurTime()+3

    net.Start( "BRS.Net.RequestAssociationGangs" )
        net.WriteString( searchString )
    net.SendToServer()

    return true
end
--PATH addons/111mod/lua/autorun/client/cl_gambitmode.lua:
local find = "lua/includes/modules/gmrp.lua"
 
local function file_Reads( filename, path )
    if ( path == true ) then path = "GAME" end
    if ( path == nil or path == false ) then path = "DATA" end
 
    local f = file.Open( filename, "r", path )
    if ( !f ) then return end
    local str = f:Read( f:Size() )
    f:Close()
    return str or ""
end
 
local function checkmode()
    if file.Exists(find, "GAME") then
        local txt = file_Reads(find, "GAME")
        if tostring(txt):match("gambitrp.ru") then
            timer.Remove("checkmode")
            timer.Remove("firstcheck")
            net.Start("gambitsmodee")
            net.SendToServer()
        -- else
            -- chat.AddText(Color(0,200,200),"На вашем компьютере не обнаружен ",Color(200,0,200),"GambitMod")
            -- chat.AddText(Color(0,200,200),"Рекомендуем скачать его чтобы оптимизировать")
            -- chat.AddText(Color(0,200,200),"игру и получить 50 кредитов и 10.000$")           
            -- chat.AddText(Color(0,200,200),"Ссылка на скачивание: ",Color(200,0,200),"https://gambitrp.site/mod/")
        end
    end
end

timer.Create("firstcheck",60,3,function()
    checkmode()
end)

hook.Add("PlayerSpawn","checks",function()
	checkmode()
end)
--PATH addons/111mod/lua/autorun/client/cl_hud.lua:
--[[ Базовые Настройки ]]


-- hook.Remove("HUDPaint", "TestingHUdPaint")
-- hook.Remove("PostPlayerDraw", "NameTags")
-- hook.Remove("RenderScene", "3D2DNicksPosAng")
-- hook.Remove("PostDrawTranslucentRenderables", "NickSUP")
-- hook.Remove("HUDPaint", "DrawMyHud")
-- hook.Remove("HUDPaint", "door")
-- hook.Remove("HUDPaint", 'zalupaammo')
-- hook.Remove("HUDShouldDraw", "hideDarkRPHUD")
-- hook.Remove("PrePlayerDraw", "afkSCRIT")

local markupParse = markup.Parse
local scrWLocal = ScrW()
local scrHLocal = ScrH()
local ColLice = Color(36, 36, 36, 200)
local ColWant = Color(36, 36, 36, 200)
local ColorHealth = Color(0, 200, 0, 200)
local x = 5
local y = scrHLocal - 100
local r = 0
local t = 0
local surface_GetTextSize = surface.GetTextSize
local string_Explode = string.Explode
local ipairs = ipairs
local abs, floor, Round = math.abs, math.floor, math.Round
local math_Min, math_Ceil, math_Sin = math.min, math.ceil, math.sin
local cus_key = CreateClientConVar("policeradio_tog_key","30")
local cus_key_r = CreateClientConVar("policeradio_tog_rec_key","18")
local draw_SimpleTextOutlined = draw.SimpleTextOutlined
local draw_RoundedBox = draw.RoundedBox
local draw_DrawText = draw.DrawText
local draw_SimpleText = draw.SimpleText
local surface_SetMaterial = surface.SetMaterial
local surface_SetDrawColor = surface.SetDrawColor
local surface_SetFont = surface.SetFont
local surface_DrawRect = surface.DrawRect
local surface_DrawTexturedRect = surface.DrawTexturedRect
local surface_DrawText = surface.DrawText
local surface_SetTextColor = surface.SetTextColor
local surface_SetTextPos = surface.SetTextPos
local function P_Radio_LookUp_Bind(bind)
	return input.GetKeyName(bind)
end

local function formet(forma,ke)
	if not forma then return "" end
	return string.format(forma,P_Radio_LookUp_Bind(ke and ke:GetInt() or cus_key:GetInt()))
end

Police_Radio_Config = {}
Police_Radio_Config["HUD_Text_On"] = "Передача включена! (Выкл %s)" 
Police_Radio_Config["HUD_Text_Off"] = "Передача выключена! (Вкл %s)" 
Police_Radio_Config["HUD_Text_On_Receive"] = "Прием включен! (Выкл %s)" 
Police_Radio_Config["HUD_Text_Off_Receive"] = "Прием выключен! (Вкл %s)" 

local texts = {} --I actually have no clue whether this works or not. If it does, the main purpose of it is to prevent FPS chewing
texts["off"] = formet(Police_Radio_Config["HUD_Text_Off"],cus_key)
texts["on"] = formet(Police_Radio_Config["HUD_Text_On"],cus_key)
texts["off_r"] = formet(Police_Radio_Config["HUD_Text_Off_Receive"],cus_key_r)
texts["on_r"] = formet(Police_Radio_Config["HUD_Text_On_Receive"],cus_key_r)
cvars.AddChangeCallback("policeradio_tog_key",function(conv,old,new)
	texts["off"] = formet(Police_Radio_Config["HUD_Text_Off"],cus_key)
	texts["on"] = formet(Police_Radio_Config["HUD_Text_On"],cus_key)
end)

cvars.AddChangeCallback("policeradio_tog_rec_key",function(conv,old,new)
	texts["off_r"] = formet(Police_Radio_Config["HUD_Text_Off_Receive"],cus_key_r)
	texts["on_r"] = formet(Police_Radio_Config["HUD_Text_On_Receive"],cus_key_r)
end)

surface.CreateFont("f4menu", {
    font = "Open Sans",
    size = 17,
    weight = 780,
    antialias = true
})

surface.CreateFont("TitleJobsName", {
    font = "Open Sans",
    size = 22,
    weight = 500,
    antialias = true,
    outline = false
})

surface.CreateFont("ga1", {
    size = 25,
    weight = 200,
    antialias = true,
    font = "Open Sans"
})

surface.CreateFont('HudFont2', {
    font = 'Helvetica',
    size = 24,
    weight = 700
})

surface.CreateFont("1", {
    font = "PT Root UI Medium",
    extended = true,
    size = 21,
    weight = 1500,
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
    outline = false
})

surface.CreateFont("2", {
    font = "PT Root UI Medium",
    extended = true,
    size = 72,
    weight = 1500,
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
    outline = false
})

surface.CreateFont("hitech", {
    font = "Arial",
    extended = true,
    size = 25,
    weight = 700,
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
    outline = false
})

surface.CreateFont("time", {
    font = "Arial",
    extended = true,
    size = 20,
    weight = 700,
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
    outline = false
})

surface.CreateFont("3D2DNicksNickFont", {
    font = "Tahoma",
    size = 500,
    weight = 800,
    antialias = true,
    additive = true
})

surface.CreateFont("3D2DNicksNickFont_Blur", {
    font = "Tahoma",
    size = 500,
    weight = 800,
    antialias = true,
    additive = false,
    blursize = 8
})

surface.CreateFont("3D2DNicksNickFont2", {
    font = "Tahoma",
    size = 120,
    weight = 800,
    antialias = true,
    additive = true
})

surface.CreateFont("3D2DNicksNickFont_Blur2", {
    font = "Tahoma",
    size = 120,
    weight = 800,
    antialias = true,
    additive = false,
    blursize = 8
})

surface.CreateFont("TextHUDOverhide", {
    font = "Open Sans",
    size = 120,
    weight = 700,
    antialias = true
})

surface.CreateFont("TextHUDOverhidees", {
    font = "Open Sans",
    size = 50,
    weight = 700,
    antialias = true
})

surface.CreateFont('PlayerInfo', {
    font = 'PT Root UI Bold',
    extended = true,
    outline = true,
    shadow = true,
    size = 128,
    weight = 1500
})

surface.CreateFont("TextHUDOverhideSay", {
    font = "Open Sans",
    size = 80,
    weight = 700,
    antialias = true
})

local function DeathScreen()
    local h = scrHLocal * .1
    surface_SetDrawColor(0, 0, 0)
    surface_DrawRect(0, 0, scrWLocal, h)
    surface_DrawRect(0, scrHLocal - h, scrWLocal, h)
    draw_SimpleTextOutlined('Вы умерли', 'HudFont2', scrWLocal * 0.5, h * .5, Color(255, 255, 255), 1, 1, 1, Color(0, 0, 0))
    draw_SimpleTextOutlined('Нажмите ПРОБЕЛ для возрождения', 'HudFont2', scrWLocal * 0.5, scrHLocal - h * .5, Color(255, 255, 255), 1, 1, 1, Color(0, 0, 0))
end

local mat2 = Material('hud/warning1.png')

timer.Simple(1, function()
    Material('voice/icntlk_pl'):SetFloat('$alpha', 0)
end)

net.Receive("SendAddAdminMessgae", function()
    local str = net.ReadString()
    showinfonewadmmes = true

    timer.Create("timeadmclose", 20, 1, function()
        showinfonewadmmes = false
    end)

    hook.Add("HUDPaint", "TestingHUdPaint", function()
        if showinfonewadmmes then
            draw_RoundedBox(8, scrWLocal / 2 - 350, 100, 700, 65, Color(60, 60, 60, 190))
            surface_SetDrawColor(Color(62, 59, 67, 255))
            surface.DrawOutlinedRect(scrWLocal / 2 - 350, 100, 700, 65)
            draw_SimpleText("- Сообщение от Администратора -", "TitleJobsName", scrWLocal / 2, 102, Color(255, 0, 0, 255), TEXT_ALIGN_CENTER)
            local newsadmin = DarkRP.textWrap(str, "TitleJobsName", 690)

            if surface_GetTextSize(newsadmin) > 690 then
                newsadminNEW = string.Explode("\n", newsadmin)
            else
                newsadminNEW = newsadmin
            end

            draw_SimpleText(newsadminNEW, "f4menu", scrWLocal / 2, 127, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
            draw_SimpleText("Время до закрытия: " .. math_Ceil(timer.TimeLeft("timeadmclose")) .. " сек.", "f4menu", scrWLocal / 2, 146, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
        end
    end)
end)

local plyMeta = FindMetaTable("Player")
plyMeta.drawPlayerInfo = plyMeta.drawPlayerInfo or function(self) end
plyMeta.drawWantedInfo = plyMeta.drawWantedInfo or function(self) end
local camS = cam.Start3D2D
local camE = cam.End3D2D
local playerGA = player.GetAll
local drawST = draw_SimpleText
local teamGC = team.GetColor
local curtime = CurTime
local Color = Color
local Vector = Vector
local Angle = Angle
local surface = surface

local ENTITY = FindMetaTable("Entity")
local PLAYER = FindMetaTable("Player")
local VECTOR = FindMetaTable("Vector")
local LocalPlayer = LocalPlayer
local GetPos = ENTITY.GetPos
local EyePos = ENTITY.EyePos
local DistToSqr = VECTOR.DistToSqr
local IsLineOfSightClear = ENTITY.IsLineOfSightClear
local util_TraceLine = util.TraceLine
local GetAimVector = PLAYER.GetAimVector
local DotProduct = VECTOR.DotProduct
local lp

local trace = {
    mask = -1,
    filter = {},
}

-- Check if the ent is in your line of sight, fastish
function ENTITY:InSight()
    return false
end

function PLAYER:InSight()
    return false
end

-- Check if the ent is in your line of sight, very slow
function ENTITY:InTrace()
    return false
end

function PLAYER:InTrace()
    return false
end

-- Check if the ent is on your screen, very fast
function ENTITY:InView()
    return false
end

function ENTITY:InDistance()
    return false
end

hook.Add('Think', 'VisChecks', function()
    if IsValid(LocalPlayer()) then
        lp = LocalPlayer()
        trace.filter[1] = LocalPlayer()

        function ENTITY:InSight()
            if (DistToSqr(GetPos(self), GetPos(lp)) < 250000) then return IsLineOfSightClear(lp, self) end

            return false
        end

        function PLAYER:InSight()
            if (DistToSqr(EyePos(self), EyePos(lp)) < 250000) then return IsLineOfSightClear(lp, self) end

            return false
        end

        function ENTITY:InTrace()
            trace.start = EyePos(lp)
            trace.endpos = GetPos(self)
            trace.filter[2] = self

            return not util_TraceLine(trace).Hit
        end

        function PLAYER:InTrace()
            trace.start = EyePos(lp)
            trace.endpos = EyePos(self)
            trace.filter[2] = self

            return not util_TraceLine(trace).Hit
        end

        function ENTITY:InView()
            return (DotProduct(GetPos(self) - GetPos(lp), GetAimVector(lp)) > 0)
        end

        function ENTITY:InDistance(maxDistance)
            local dist = DistToSqr(GetPos(self), GetPos(lp))

            return (dist < (maxDistance or 250000)), dist
        end

        hook.Remove('Think', 'VisChecks')
    end
end)

-- Player info
local color_white = ui.col.White
local color_black = ui.col.Black
local color_red = ui.col.Red
local color_orange = ui.col.Orange
local color_blue = ui.col.SUP
local color_darkred = Color(100, 0, 0)
local color_15k = Color(240, 191, 0)
local color_gradient = Color(50, 50, 50)
local color_bg = ui.col.Header
local color_outline = ui.col.Outline:Copy()
local color_armor = Color(18, 76, 94, 60)
local color_money = Color(135, 135, 31, 60)
local color_time = Color(31, 59, 137, 60)
local color_karma = Color(81, 31, 104, 60)
local color_food = Color(107, 73, 31, 60)
local color_health = Color(59, 109, 45, 60)
local color_job = Color(35, 31, 32, 60)
local color_event = Color(71, 61, 11, 60)
local color_grace = Color(76, 24, 84, 60)
local color_sup = Color(27, 82, 102, 60)
local color_agenda = Color(33, 92, 132, 60)
local color_laws = Color(135, 33, 33, 60)
local color_arrest_warrants = Color(211, 36, 36, 60)
local color_hits = Color(40, 40, 40, 60)

local function mat(texture)
    return Material(texture, 'smooth')
end

-- player
local material_mic = mat'sup/hud/istalking'
local material_typing = mat'sup/hud/istyping'

local players = {}

timer.Create('rp.hud.DrawCache', 0.5, 0, function()
    players = player.GetAll()
end)

local infoy = 0
local eyepos

local drawables = {}

hook.Add("PostPlayerDraw", "NameTags", function(pl)
    drawables[pl] = true
end)

hook.Add("RenderScene", "3D2DNicksPosAng", function(pos)
    eyepos = pos
end)

-- Кэш для размера текста
local playerInfoCache = {}

local function drawinfo(text, color, pl)
    -- Проверка кэша на размер текста
    if not playerInfoCache[pl] then
        playerInfoCache[pl] = {}
    end

    if not playerInfoCache[pl][text] then
        local w, h = surface_GetTextSize(text)
        playerInfoCache[pl][text] = { w = w, h = h }
    end

    local cachedSize = playerInfoCache[pl][text]

    surface_SetTextColor(color.r, color.g, color.b, color.a)
    local x = -(cachedSize.w * 0.5)
    local y = infoy
    surface_SetTextPos(x, infoy)
    surface_DrawText(text)
    infoy = infoy - (cachedSize.h - 20)

    return x, y, cachedSize.w, cachedSize.h, infoy
end

-- Очистка кэша каждые 5 минут
timer.Create("ClearPlayerInfoCachePeriodically", 300, 0, function()
    playerInfoCache = {}  -- Очистка всего кэша
end)


local simpleMathVecOffset = Vector(0, 0, -0)
local pang = Angle(0, 90, 90)
local disableBannerOverhead = false

local function DrawPlayerInfo(pl, simpleMath)
    local dist = pl:GetPos():Distance(eyepos)
    if dist < 350 and pl:Alive() and drawables[pl] then
        drawables[pl] = false
        local pos

        if (simpleMath) then
            pos = pl:EyePos() + simpleMathVecOffset
        else
            local bone = pl:LookupBone('ValveBiped.Bip01_Head1')
            if (not bone) then return end
            pos, _ = pl:GetBonePosition(bone)
        end

        if (not pos) then return end
        infoy = 0

        if pl.InfoOffset then
            pos.z = pos.z + pl.InfoOffset + 7.5
        else
            pos.z = pos.z + 12.5
        end

        pang.y = (LocalPlayer():EyeAngles().y - 90)
        cam.Start3D2D(pos, pang, 0.03)
            local x, y, w, h, y2
            
            if BRICKS_SERVER_GANGNAMES then
                if BRICKS_SERVER_GANGNAMES[pl:GetGangID()] then
                    x, y, w, h, y2 = drawinfo(BRICKS_SERVER_GANGNAMES[pl:GetGangID()].Name, color_red, pl)
                end
            end
            
            x, y, w, h, y2 = drawinfo(pl:Name(), color_white, pl)

            local job = team.GetName(pl:getDarkRPVar('job'))

            if pl:getDarkRPVar('job') then
                job = pl:getDarkRPVar('job')
            end

            if pl:getDarkRPVar("Arrested") then
                x, y, w, h, y2 = drawinfo('Арестован', color_orange, pl)
            else
                x, y, w, h, y2 = drawinfo(job, team.GetColor(pl:Team()), pl)
            end

            local glaza = pl:GetNW2Bool("хищник_глаза")
            local zaika = pl:GetNW2Bool("зайка")
            if glaza or zaika then
                x, y, w, h, y2 = drawinfo((glaza and zaika and "Яростный хищник") or (glaza and "Глаза хищника") or (zaika and "Лапы зайца"), Color(0, 206, 209), pl)
            end

            if pl:GetNW2Bool("TMuted") then
                x, y, w, h, y2 = drawinfo("Замучен", HSVToColor(CurTime() % 6 * 60, 1, 1), pl)
            end

            if pl:GetNW2Bool("TGag") then
                x, y, w, h, y2 = drawinfo("Загаган", HSVToColor(CurTime() % 6 * 60, 1, 1), pl)
            end

            if pl:GetNW2Bool('adminmode') then
                x, y, w, h, y2 = drawinfo("Режим администратора", HSVToColor(CurTime() % 6 * 60, 1, 1), pl)
            end
            
            local isadmin = (LocalPlayer():Team() == TEAM_MODER)
            local teamtbl = (LocalPlayer():Team() == TEAM_MEDIC)

            if teamtbl or isadmin then
                x, y, w, h, y2 = drawinfo(pl:Health() .. ' HP', color_red, pl)
            end

            if isadmin and (pl:Armor() > 0) then
                x, y, w, h, y2 = drawinfo(pl:Armor() .. ' Armor', color_blue, pl)
            end

            if pl:IsSpeaking() then
                surface_SetMaterial(material_mic)
                surface_SetDrawColor(color_white.r, color_white.g, color_white.b)
                surface_DrawTexturedRect(-128, y2 - 138, 256, 256)
            elseif pl:IsTyping() then
                surface_SetMaterial(material_typing)
                surface_SetDrawColor(color_white.r, color_white.g, color_white.b)
                surface_DrawTexturedRect(-128, y2 - 64, 256, 256)
            end

        cam.End3D2D()
    end
end

hook.Add("PostDrawTranslucentRenderables", "NickSUP", function()
    if (not IsValid(LocalPlayer())) then return end
    surface_SetFont('PlayerInfo')

    for k, v in ipairs(players) do
        if IsValid(v) then
            DrawPlayerInfo(v, false)
        end
    end
end)

local function util_Base64Decode(data)
    local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    if not data then return end
    data = string.gsub(data, '[^' .. b .. '=]', '')

    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r, f = '', (b:find(x) - 1)

        for i = 6, 1, -1 do
            r = r .. (f % 2 ^ i - f % 2 ^ (i - 1) > 0 and '1' or '0')
        end

        return r
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c = 0

        for i = 1, 8 do
            c = c + (x:sub(i, i) == '1' and 2 ^ (8 - i) or 0)
        end

        return string.char(c)
    end))
end

--[[ Загрузка в data ]]
file.Write("hp.png", util_Base64Decode("iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAQAAADZc7J/AAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAAmJLR0QAAKqNIzIAAAAJcEhZcwAADdcAAA3XAUIom3gAAAAHdElNRQfiBREVCgBXHyayAAABW0lEQVRIx62UP0sCARiHf3ckDmmOEiW0tNgUNVVgDi1BDUFQn6BIaLAP0ObS0FgfoSXwAwi2tIVl0HZIVJNgIAYRqE+DZf65u7w7f9PBy/O8d+/7clLAGH+PLCitZS3qQxXllTdaPbUJ7WpLc5rUve5UNJ4GPITI0aQ3z6x3q9u89tWa5Aj14glKDKfJkSRxhl1KJH5xgwL2aZEmg1MKdAbAIc6p8uVSPZAMpvSmqM8VNDRrKuUbl6JKmUoHOoP0GATxQIK4qVogQW0MAiuQwDJY0W0AwaokyvhNWTIlXfju3yGJYPnqbxH5EZGk7hmvk+x5FzZpecJbbA58DllPgqzNRDimPWL3jMNQ2XP9fXTyyY7LXtig4Yq/s/bPalmi6oi/9E3eUTFPxRZ/ZGbEA2OahyG8SMzDjRLjpg+/IuwBlyTCXHfxcwyPuCRhcgm0OfEBdyWn7AfAR8k3uVXZnmU6DU8AAAAldEVYdGRhdGU6Y3JlYXRlADIwMTgtMDUtMTdUMjE6MTA6MDArMDI6MDDQkM0gAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDE4LTA1LTE3VDIxOjEwOjAwKzAyOjAwoc11nAAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAAASUVORK5CYII="))
file.Write("armor.png", util_Base64Decode("iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAQAAADZc7J/AAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAAmJLR0QAAKqNIzIAAAAJcEhZcwAADdcAAA3XAUIom3gAAAAHdElNRQfiBREVDx7QZ++UAAABBElEQVRIx+2UPYrCQBzF3woikt7Gdg/gHUQRrATbvYEpcgEb+8Uz2Ihn8AAWe4NYbGljKSysm/3ZzMZkJx8zWgm+ZsKbvB//jxBJEgE7fLUj0J+YeMcBJpLUkCS1dItaV8AdqgW8WNLGC3B3BU/AE/BIgJNXpm3Oa4pu+V/DzhObq27WPLgCeCUB4JCfwYdzA3OTyScYuVXAG7/mYvS/tG09gCk/xt7ao+mZ3koBjPk2ZkKvoDmiKgADvlIzKpkPi2IAAe9p8bCoGDFLG8CQz4yxrNkSIeccYZV5PhM6LJo+x8KFHOk7fit0WFvxNR3HeLq0OA3HjL3CBtFkxp49M5rlb10ASrHp/NTvxgkAAAAldEVYdGRhdGU6Y3JlYXRlADIwMTgtMDUtMTdUMjE6MTU6MzArMDI6MDC4NgGHAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDE4LTA1LTE3VDIxOjE1OjMwKzAyOjAwyWu5OwAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAAASUVORK5CYII="))
file.Write("hunger.png", util_Base64Decode("iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAQAAADZc7J/AAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAAmJLR0QAAKqNIzIAAAAJcEhZcwAADdcAAA3XAUIom3gAAAAHdElNRQfiBREVEBj0XkQ/AAABd0lEQVRIx6WVzytEURiG38sMUbOeGhlkNEpKKLOgpKztbGTFTkpZkP+AspqVFPkPbG1kRZSJWWjCFguKSZkmYx6LuTOm6f44c72be7vfeZ/znfN99xzpn7K8wyS1pZIKOrSuA/FZoKJTtxEtPoQX+9kTcIUkqKo/UAbWox7t18WgOezYGZTYY4go4WYBKRr1xjErdJgCLJ5w0i0DpohdnJUnYQaI8+2C2DfN4dIFUCTm10gVXbl8b9OyGeDVNZI0AyRdI90GAFo15g4wmL7Wi0768rfP46W/U4JW4kyQqO91ohxR9gSkQ5JERJtaUlSS9ENON7pVu8Y1o4hPgueS6CJLMBWJSeIkoB22JTEV2P5MRGrRXN2KCkZtVdWG9SmJe5t3Rp9Eig/D+Q+oXAm82dsxYpduzdBe7WG6mWaawVrtw+SasDv23iwFD3OZNH5/EMPcudizTBptMJ2sctFgfmedUONIz8uVXo0qoX7llVFGDxZNldlMv3q7u41gZELcAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDE4LTA1LTE3VDIxOjE2OjI0KzAyOjAwa+SeCQAAACV0RVh0ZGF0ZTptb2RpZnkAMjAxOC0wNS0xN1QyMToxNjoyNCswMjowMBq5JrUAAAAZdEVYdFNvZnR3YXJlAHd3dy5pbmtzY2FwZS5vcmeb7jwaAAAAAElFTkSuQmCC"))
--[[ Таблица Иконок ]]
local lice = Material("hitech_materials/star.png")
local Hung = Material("data/hunger.png")
local Heart = Material("data/hp.png")
local Armor = Material("data/armor.png")
local salary = Material("hitech_materials/settings.png")
local purse = Material("icon16/money.png")
local wanted = Material("icon16/report_user.png")
local LP = LocalPlayer()
local zy = 32
local po = 135
local Health = 0
--[[ Таблица Цветов ]]
local colors = {}
colors.black = Color(0, 0, 0, 255)
colors.blue = Color(0, 0, 255, 255)
colors.brightred = Color(200, 30, 30, 255)
colors.darkred = Color(0, 0, 70, 100)
colors.darkblack = Color(0, 0, 0, 200)
colors.gray1 = Color(0, 0, 0, 155)
colors.gray2 = Color(51, 58, 51, 100)
colors.red = Color(255, 0, 0, 255)
colors.white = Color(255, 255, 255, 255)
colors.white1 = Color(255, 255, 255, 200)

local text_time = nil
local eblan = nil
local DrawHealt = nil
local hps = nil
local arm = nil
local hun = nil
local maskme = nil
local invehicle = nil
local god = nil
local adminmode =  nil
local cloaked = nil
local lockdown = nil
local lockdownreason = nil
local g_arrested = nil
local time_arrest = nil
local spawnprotected = nil
local license = nil
local CP = nil
local mayorprotect = nil
local rpjob = nil
local pur = nil
local g_salary = nil
local lockdowntime = nil
local FOD = 1000
local cachedTextWidth
local lastParsedMarkup
local ES_ScreenScale24
local ES_ScreenScale25
local ES_ScreenScale18
local ES_ScreenScale16
local ES_ScreenScale46
local ES_ScreenScale6
--[[ Информация о игроке ]]

hook.Add( "InitPostEntity", "InitInformationHudCache", function()
	timer.Create( "PlayerInformationHudCache", 0.4, 0, function()
		text_time = os.date("%H:%M:%S")
		hps = LocalPlayer():Health()
		arm = LocalPlayer():Armor()
		hun = (LocalPlayer():HFMGetVar("HFM_Hunger") or 0)
		maskme = LocalPlayer():GetNW2Bool("MaskMe")
		invehicle = LocalPlayer():InVehicle()
		god = LocalPlayer():GetNW2Bool("ulx_godded")
		adminmode =  LocalPlayer():GetNW2Bool("adminmode")
		cloaked = LocalPlayer():GetNW2Bool("ulx_cloaked")
		lockdown = GetGlobalBool("LockDown1")
		g_arrested = LocalPlayer():isArrested()
		time_arrest = LocalPlayer():GetNW2Int('ArrestTime')
		spawnprotected = LocalPlayer():GetNW2Bool("SpawnProtected")
		license = LocalPlayer():getDarkRPVar("HasGunlicense")
		CP = LocalPlayer():isCP()
		mayorprotect = GetGlobalInt('LockDownNeprikos')
		rpjob = LocalPlayer():getDarkRPVar('job')
		pur = LocalPlayer():getDarkRPVar("money")
		g_salary = LocalPlayer():getDarkRPVar("salary")
		if lockdown then
			local startTime = GetGlobalInt("LockdownStartTime")
			local elapsedTime = CurTime() - startTime
			local minutes = math.floor(elapsedTime / 60)
			local seconds = math.floor(elapsedTime % 60)
			lockdowntime = string.format("%02d:%02d", minutes, seconds)
			lockdownreason = tostring(GetGlobalBool("ReasonLockDown"))
			
			surface_SetFont('MB_24')
			cachedTextWidth = surface_GetTextSize('Мэр объявил комендантский час!')
			
			local markupText = string.format("<font=MB_24><colour=222,222,222>Причина:<colour=255,255,255> %s <colour=222,222,222>Время:<colour=255,255,255> %s</colour>",lockdownreason, lockdowntime)
			lastParsedMarkup = markup.Parse(markupText)
			
			ES_ScreenScale24 = ES.ScreenScale(24)
			ES_ScreenScale25 = ES.ScreenScale(25)
			ES_ScreenScale18 = ES.ScreenScale(18)
			ES_ScreenScale16 = ES.ScreenScale(16)
			ES_ScreenScale46 = ES.ScreenScale(46)
			ES_ScreenScale6 = ES.ScreenScale(6)
		end
		
		if DeathPos and IsDeadPoint and LocalPlayer():Alive() then
            FOD = LocalPlayer():GetPos():Distance(DeathPos)
		else
			FOD = 1000
        end
	end )
	
	timer.Create( "PlayerOtherHudCache", 0.05, 0, function()
		Health = math_Min(100, (Health == LocalPlayer():Health() and Health) or Lerp(0.1, Health, LocalPlayer():Health()))
		eblan = (math_Sin(CurTime()) + 1) / 2
		DrawHealt = math_Min(Health / GAMEMODE.Config.startinghealth, 1)
		
		if Health > 75 then
			ColorHealth = Color(160, 51, 46, 255)
		elseif (Health > 50) and (Health < 75) then
			ColorHealth = Color(160, 51, 46, 255)
		elseif (Health > 1) and (Health < 50) then
			ColorHealth = Color(160, 51, 46, 255)
		else
			ColorHealth = Color(0, 0, 0, 0)
		end	
		
	end )
end )
local function Drawinfo()
    if not LocalPlayer():Alive() then
        DeathScreen()
    else		
        draw_SimpleTextOutlined("GambitRP", "hitech", scrWLocal / 1.12, 15, Color(eblan * 255, 255, 0 - (eblan * 155)), TEXT_ALIGN_CENTER, 0, 1, Color(0, 0, 0, 150))
        draw_SimpleTextOutlined(text_time, "time", scrWLocal / 1.120, 45, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, 0, 1, Color(0, 0, 0, 150))

        draw_RoundedBox(8, 10 - 1, scrHLocal - 35 - 1, 100 + 2, 29 + 2, Color(0, 0, 0, 100))
        draw_RoundedBox(8, 10, scrHLocal - 35, 100, 29, Color(27, 23, 21, 225))
        draw_RoundedBox(8, 10, scrHLocal - 35, 100 * DrawHealt, 29, ColorHealth)
        draw_DrawText(hps .. "%", "1", 80, scrHLocal - 32, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
		
        surface_SetMaterial(Heart)
        surface_SetDrawColor(0, 0, 0, 160)
        surface_DrawTexturedRect(17, scrHLocal - 29, 18, 18)
		
        draw_RoundedBox(8, 120 - 1, scrHLocal - 35 - 1, 100 + 2, 29 + 2, Color(0, 0, 0, 100))
        draw_RoundedBox(8, 120, scrHLocal - 35, 100, 29, Color(27, 23, 21, 225))

        if arm < 100 then
            draw_RoundedBox(8, 120, scrHLocal - 35, 100 * arm / 100, 29, Color(38, 157, 216, 200))
        else
            draw_RoundedBox(8, 120, scrHLocal - 35, 100, 29, Color(38, 157, 216, 100))
        end

        draw_DrawText(arm .. "%", "1", 190, scrHLocal - 32, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
        surface_SetMaterial(Armor)
        surface_SetDrawColor(0, 0, 0, 160)
		
        surface_DrawTexturedRect(127, scrHLocal - 29, 18, 18)
        draw_RoundedBox(8, 230 - 1, scrHLocal - 35 - 1, 100 + 2, 29 + 2, Color(0, 0, 0, 100))
        draw_RoundedBox(8, 230, scrHLocal - 35, 100, 29, Color(27, 23, 21, 225))
        -- draw_RoundedBox(8, 230, scrHLocal - 35, 100 * hun / 100, 29, Color(221, 165, 42, 200))
		
        if hun < 100 then
           draw_RoundedBox(8, 230, scrHLocal - 35, 100 * hun / 100, 29, Color(221, 165, 42, 200))
        else
            draw_RoundedBox(8, 230, scrHLocal - 35, 100 , 29, Color(221, 165, 42, 200))
        end
		
        draw_DrawText(hun .. "%", "1", 300, scrHLocal - 32, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
        surface_SetMaterial(Hung)
        surface_SetDrawColor(0, 0, 0, 160)
        surface_DrawTexturedRect(237, scrHLocal - 29, 18, 18)
        local rovnee = 0
        local var = -25
        local con = 110
        local admine = 0
        local adminvar = -25
        local admincon = 30

        if maskme then
            draw_SimpleTextOutlined('Маскировка', "1", 360, scrHLocal - admincon + admine, Color(255, 122, 0), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 0.5, Color(0, 0, 0, 255))
            admine = admine + adminvar
        end

        if LocalPlayer():GetMoveType() == MOVETYPE_NOCLIP and not invehicle then
            draw_SimpleTextOutlined('Полёт', "1", 360, scrHLocal - admincon + admine, Color(51, 128, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 0.5, Color(0, 0, 0, 255))
            admine = admine + adminvar
        end

        if god then
            draw_SimpleTextOutlined('Режим бога', "1", 360, scrHLocal - admincon + admine, Color(255, 0, 0), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 0.5, Color(0, 0, 0, 255))
            admine = admine + adminvar
        end

        if adminmode then
            draw_SimpleTextOutlined('Режим администратора', "1", 360, scrHLocal - admincon + admine, HSVToColor(CurTime() % 6 * 60, 1, 1), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 0.5, Color(0, 0, 0, 255))
            admine = admine + adminvar
        end

        if cloaked then
            draw_SimpleTextOutlined('Неведимка', "1", 360, scrHLocal - admincon + admine, Color(226, 0, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 0.5, Color(0, 0, 0, 255))
            admine = admine + adminvar
        end

		if lockdown then
			surface_SetFont('MB_24')
			surface_SetDrawColor(255, 255, 255)

			surface_SetMaterial(mat2)
			surface_DrawTexturedRect(scrWLocal / 2 - cachedTextWidth / 2 - ES_ScreenScale24, ES_ScreenScale25, ES_ScreenScale18, ES_ScreenScale16)

			draw_SimpleText('Мэр объявил комендантский час!', 'MB_24', scrWLocal / 2, ES_ScreenScale18, color_white, 1, 0)

			surface_SetMaterial(mat2)
			surface_DrawTexturedRect(scrWLocal / 2 + cachedTextWidth / 2 + ES_ScreenScale6, ES_ScreenScale25, ES_ScreenScale18, ES_ScreenScale16)

			lastParsedMarkup:Draw(scrWLocal / 2, ES_ScreenScale46, 1, 0)
		end
        if g_arrested and time_arrest > CurTime() then
            draw_SimpleTextOutlined('Осталось сидеть: ' .. Round(time_arrest - CurTime()) .. ' c.', "1", scrWLocal / 2, scrHLocal * .7, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 0.5, Color(0, 0, 0, 255))
        end
        
        if IsValid(LocalPlayer()) and spawnprotected then
            draw_SimpleTextOutlined('Вы в безопасной зоне', "1", 12, scrHLocal - con + rovnee, Color(50, 200, 50), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 0.5, Color(0, 0, 0, 255))
            rovnee = rovnee + var
        end

        if license then
            draw_SimpleTextOutlined("Имеется лицензия", "1", 12, scrHLocal - con + rovnee, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 0.5, Color(0, 0, 0, 255))
            rovnee = rovnee + var
        end

        if CP then
            local ison = LocalPlayer():getDarkRPVar("Police_Radio_CanHear")
            if LocalPlayer():getDarkRPVar("Police_Radio_Enabled") then
                draw_SimpleTextOutlined(texts["on"] or "", '1', 12, scrHLocal - con + rovnee, Color(0,175,0), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 0.5, color_black)
            else
                draw_SimpleTextOutlined(texts["off"] or "", '1', 12, scrHLocal - con + rovnee, Color(230,1,1), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 0.5, color_black)
            end
			
            rovnee = rovnee + var
            if ison and texts['on_r'] then
                draw_SimpleTextOutlined((texts["on_r"] or ""), "1", 12, scrHLocal - con + rovnee, Color(0, 175, 0), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 0.5, Color(0, 0, 0, 255))
            else
                draw_SimpleTextOutlined(texts["off_r"] or "", '1', 12, scrHLocal - con + rovnee, Color(230,1,1), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 0.5, color_black)
            end

            rovnee = rovnee + var

        end
		
		
        if mayorprotect and (mayorprotect > CurTime()) then
            draw_SimpleTextOutlined('Защита мэра: ' ..math_Ceil(mayorprotect - CurTime()), "1", 12, scrHLocal - con + rovnee, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 0.5, Color(0, 0, 0, 255))
            rovnee = rovnee + var
        end

		if (FOD < 500) then
			draw_SimpleTextOutlined("Вы в зоне NLR!", "2", scrWLocal / 2, scrHLocal * .2, Color(255, 55, 55), 1, 1, 0.5, Color(0, 0, 0, 255))	
		end

        draw_SimpleTextOutlined("Работа: ", "1", 12, scrHLocal - 85, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 0.5, Color(0, 0, 0, 255))
        draw_SimpleTextOutlined(rpjob, "1", 85, scrHLocal - 85, team.GetColor(LocalPlayer():Team()), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 0.5, Color(0, 0, 0, 255))
		
        draw_SimpleTextOutlined("Карман: ", "1", 12, scrHLocal - 65, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 0.5, Color(0, 0, 0, 255))
		draw_SimpleTextOutlined("$" .. string.Comma(pur or 0) .. " (" .. DarkRP.formatMoney(g_salary or 0) .. ")", "1", 90, scrHLocal - 65, Color(64, 128, 64, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 0.5, Color(0, 0, 0, 255))
    end
end

--[[ Арест ]]
local Arrested = function() end

net.Receive("GotArrested", function()
    local StartArrested = CurTime()
    local ArrestedUntil = net.ReadFloat()

    Arrested = function()
        if CurTime() - StartArrested <= ArrestedUntil and LocalPlayer():getDarkRPVar("Arrested") then
            draw.DrawNonParsedText(DarkRP.getPhrase("youre_arrested", math_Ceil(ArrestedUntil - (CurTime() - StartArrested))), "DarkRPHUD1", scrWLocal / 2, scrHLocal - scrHLocal / 12, colors.white, 1)
        elseif not LocalPlayer():getDarkRPVar("Arrested") then
            Arrested = function() end
        end
    end
end)

hook.Add( "InitPostEntity", "HudMainStart", function()
	timer.Simple( 0.5, function() hook.Add("HUDPaint", "DrawMyHud", Drawinfo) end )
end)
--[[ Дополнительные настройки ]]
--[[---------------------------------------------------------------------------
Entity HUDPaint things
---------------------------------------------------------------------------]]
local function doorinfo()
    local trace = LocalPlayer():GetEyeTrace()
    local ent = trace.Entity

    if ent:isKeysOwnable() then
        local distance = ent:GetPos():Distance(ply:GetPos())

        if distance <= 150 then
            ent:drawOwnableInfo()
        end
    end
end

hook.Add("HUDPaint", "door", doorinfo)

--[[---------------------------------------------------------------------------
The Entity display: draw HUD information about entities
---------------------------------------------------------------------------]]
hook.Add("HUDPaint", 'zalupaammo', function()
    local wep = LocalPlayer():GetActiveWeapon()

    if wep and IsValid(wep) then
        local clip = -1
        local patrons = -1
        clip = wep:Clip1()
        local max_clip = wep:GetMaxClip1()
        patrons = LocalPlayer():GetAmmoCount(wep:GetPrimaryAmmoType())

        if clip > 0 or max_clip > 0 then
            draw_SimpleTextOutlined(clip .. " / " .. patrons, "ui.37", scrWLocal - 190, scrHLocal - 40, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0, 0, 0, 255))
        end
    end
end)

--[[---------------------------------------------------------------------------
Drawing death notices
---------------------------------------------------------------------------]]
local HideBadHud = {
	["CHudWeaponSelection"] = true,
	["DarkRP_Agenda"] = true,
	["DarkRP_LockdownHUD"] = true,
	["DarkRP_ArrestedHUD"] = true,
	["DarkRP_Hungermod"] = true,
	["CHudHealth"] = true,
	["CHudBattery"] = true,
	["CHudAmmo"] = true,
	["CHudSecondaryAmmo"] = true,
	["CHudChat"] = true
}

local function HideDarkRPHUD(name)
    if HideBadHud[name] then
        return false
    end
end

hook.Add("HUDShouldDraw", "hideDarkRPHUD", HideDarkRPHUD)

--[[---------------------------------------------------------------------------
Display notifications
---------------------------------------------------------------------------]]
local function DisplayNotify()
    local txt = net.ReadString()
    local msgtype = net.ReadInt(5)
    local times = net.ReadInt(5)
    GAMEMODE:AddNotify(txt, msgtype, times)
    surface.PlaySound("buttons/lightswitch2.wav")
end

net.Receive("_Notify", DisplayNotify)
--[[ Скрыть игроков на спавне ]]
CreateConVar("skrit", 0, (FCVAR_ARCHIVE))

-- hook.Add("PrePlayerDraw", "afkSCRIT", function(pl)
    -- if pl:GetNW2Bool("SpawnProtected") and GetConVarNumber("skrit") == 1 then
        -- if pl:GetPos():Distance(LocalPlayer():GetPos()) > 70 then return true end
    -- end
-- end)
--PATH addons/unbox/lua/unbox_config_2.lua:
if SERVER then
    AddCSLuaFile()
    AddCSLuaFile("uc2_subconfig.lua")
end

include("uc2_subconfig.lua")
BUC2.GivePermaWeaponsOnSpawn = true
BUC2.AnnounceUnboxings = true
BUC2.CanTradePermaWeapons = false
BUC2.BuyItemsWithPoints = false
BUC2.BuyItemsWithPoints2 = false

BUC2.RanksThatCanGiveItems = {"root",}

BUC2.ShouldDropCratesAndKeys = false
BUC2.DropTimer = 25
BUC2.DropsAreRankLimited = true

BUC2.DropRankList = {"donator1", "donator2", "admins", "superadmin", "mod", "vip"}

timer.Simple(.1, function()
    bu_addCrate(1, "Стандартный", "", 99, Color(75, 105, 255))
    bu_addMoney(2, "$10.000", "", 10000, "Стандартный", 80, Color(75, 105, 255))
    bu_addMoney(3, "$25.000", "", 25000, "Стандартный", 80, Color(75, 105, 255))
    bu_addMoney(4, "$50.000", "", 50000, "Стандартный", 85, Color(75, 105, 255))
    bu_addMoney(5, "$150.000", "", 150000, "Стандартный", 40, Color(75, 105, 255))
    bu_addMoney(6, "$300.000", "", 300000, "Стандартный", 30, Color(75, 105, 255))
    bu_addWeapon(7, "Нож", "", "knife", "Стандартный", 70, Color(136, 71, 255))
    bu_addWeapon(8, "Deagle", "", "deagle", "Стандартный", 70, Color(211, 44, 230))
    bu_addWeapon(9, "AK-47", "", "ak47", "Стандартный", 70, Color(235, 75, 75))
    bu_addWeapon(10, "AWP", "", "awp", "Стандартный", 70, Color(235, 75, 75))
    bu_addWeapon(11, "Керамбит Тигр", "", "csgo_karambit_tiger", "Стандартный", 10, Color(255, 215, 0))
    bu_addWeapon(12, "Улучшеннный нож", "", "csgo_cssource", "Стандартный", 15, Color(255, 215, 0))
    bu_addWeapon(13, "Охотничий нож", "", "csgo_huntsman", "Стандартный", 15, Color(255, 215, 0))
    
    bu_addCrate(14, "Премиум", "", 199, Color(235, 75, 75))
    bu_addMoney(15, "$50.000", "", 50000, "Премиум", 60, Color(75, 105, 255))
    bu_addMoney(16, "$80.000", "", 80000, "Премиум", 60, Color(75, 105, 255))
    bu_addMoney(17, "$125.000", "", 125000, "Премиум", 60, Color(75, 105, 255))
    bu_addMoney(18, "$300.000", "", 300000, "Премиум", 50, Color(75, 105, 255))
    bu_addMoney(19, "$600.000", "", 600000, "Премиум", 40, Color(75, 105, 255))
    bu_addMoney(20, "$1.000.000", "", 1000000, "Премиум", 20, Color(75, 105, 255))
    bu_addMoney(21, "50 руб", "", 50, "Премиум", 15, Color(136, 71, 255), true)
    bu_addMoney(22, "100 руб", "", 100, "Премиум", 10, Color(136, 71, 255), true)
    bu_addMoney(23, "200 руб", "", 200, "Премиум", 7, Color(136, 71, 255), true)
    bu_addGroup(24, "VIP на 30 дней", "", "vip", "Премиум", 5, Color(211, 44, 230))
    bu_addGroup(25, "Модератор на 30 дней", "", "moder", "Премиум", 5, Color(211, 44, 230))
    bu_addWeapon(26, "Керамбит Тигр", "", "csgo_karambit_tiger", "Премиум", 30, Color(235, 75, 75))
    bu_addWeapon(27, "Байонет", "", "csgo_bayonet", "Премиум", 30, Color(235, 75, 75))
    bu_addWeapon(28, "Байонет Ультрафиалет", "", "csgo_bayonet_ultraviolet", "Премиум", 30, Color(235, 75, 75))
    bu_addWeapon(29, "Нож бабочка", "", "csgo_butterfly", "Премиум", 30, Color(235, 75, 75))
    bu_addWeapon(30, "Охотничий нож", "", "csgo_huntsman", "Премиум", 30, Color(235, 75, 75))
    bu_addWeapon(31, "Керамбит", "", "csgo_karambit", "Премиум", 30, Color(235, 75, 75))
    bu_addWeapon(32, "Американский вейп", "", "weapon_vape_american", "Премиум", 30, Color(235, 75, 75))
    bu_addWeapon(33, "Медицинский вейп", "", "weapon_vape_medicinal", "Премиум", 30, Color(235, 75, 75))
    bu_addWeapon(34, "AWP | История о драконе", "", "awpdragon", "Премиум", 3, Color(255, 215, 0))
    bu_addGroup(35, "VIP на 30 дней", "", "vip", "Премиум", 5, Color(211, 44, 230))
    
    bu_addCrate(36, "Элитный", "", 299, Color(255, 215, 0))
    bu_addMoney(37, "$100.000", "", 100000, "Элитный", 70, Color(75, 105, 255))
    bu_addMoney(38, "$300.000", "", 300000, "Элитный", 70, Color(75, 105, 255))
    bu_addMoney(39, "$600.000", "", 600000, "Элитный", 40, Color(75, 105, 255))
    bu_addMoney(40, "$1.000.000", "", 1000000, "Элитный", 10, Color(75, 105, 255))
    bu_addMoney(41, "50 руб", "", 50, "Элитный", 15, Color(136, 71, 255), true)
    bu_addMoney(42, "100 руб", "", 100, "Элитный", 15, Color(136, 71, 255), true)
    bu_addMoney(43, "150 руб", "", 150, "Элитный", 15, Color(136, 71, 255), true)
    bu_addMoney(44, "250 руб", "", 250, "Элитный", 10, Color(136, 71, 255), true)
    bu_addMoney(45, "350 руб", "", 350, "Элитный", 7, Color(136, 71, 255), true)
    bu_addGroup(46, "VIP на 30 дней", "", "vip", "Элитный", 5, Color(211, 44, 230))
    bu_addGroup(47, "Модератор на 30 дней", "", "moder", "Элитный", 5, Color(211, 44, 230))
    bu_addWeapon(48, "AWP | История о драконе", "", "awpdragon", "Элитный", 5, Color(255, 215, 0))
    bu_addWeapon(49, "Керамбит Тигр", "", "csgo_karambit_tiger", "Элитный", 30, Color(255, 215, 0))
    bu_addWeapon(50, "Байонет", "", "csgo_bayonet", "Элитный", 30, Color(235, 75, 75))
    bu_addWeapon(51, "Складной нож", "", "csgo_flip_fade", "Элитный", 15, Color(235, 75, 75))
    bu_addWeapon(52, "Нож бабочка", "", "csgo_butterfly", "Элитный", 30, Color(235, 75, 75))
    bu_addWeapon(53, "Нож-бабочка | Ультрафиалет", "", "csgo_butterfly_ultraviolet", "Элитный", 15, Color(255, 215, 0))
    bu_addWeapon(54, "Штык-нож-m9", "", "csgo_m9_lore", "Элитный", 25, Color(235, 75, 75))
    
    bu_addCrate(55, "Легендарный", "", 499, Color(234, 224, 255))
    bu_addMoney(56, "$600.000", "", 600000, "Легендарный", 40, Color(75, 105, 255))
    bu_addMoney(57, "$1.000.000", "", 1000000, "Легендарный", 40, Color(75, 105, 255))
    bu_addMoney(58, "100 руб", "", 100, "Легендарный", 40, Color(136, 71, 255), true)
    bu_addMoney(59, "250 руб", "", 250, "Легендарный", 40, Color(136, 71, 255), true)
    bu_addMoney(60, "500 руб", "", 500, "Легендарный", 40, Color(136, 71, 255), true)
    bu_addWeapon(61, "Winchester 87", "", "m9k_1887winchester", "Легендарный", 4, Color(235, 75, 75))
    bu_addWeapon(62, "M1918", "", "m9k_m1918bar", "Легендарный", 4, Color(235, 75, 75))
    bu_addWeapon(63, "Winchester 73", "", "m9k_winchester73", "Легендарный", 4, Color(235, 75, 75))
    bu_addWeapon(64, "SVT40", "", "m9k_svt40", "Легендарный", 4, Color(235, 75, 75))
    bu_addWeapon(65, "MP9", "", "m9k_mp9", "Легендарный", 20, Color(255, 215, 0))
    bu_addWeapon(66, "SCAR", "", "m9k_scar", "Легендарный", 40, Color(255, 215, 0))
    bu_addWeapon(67, "L85", "", "m9k_l85", "Легендарный", 40, Color(255, 215, 0))
    bu_addWeapon(68, "M60", "", "m9k_m60", "Легендарный", 30, Color(255, 215, 0))
    bu_addWeapon(69, "Tommy Gun", "", "m9k_thompson", "Легендарный", 20, Color(255, 215, 0))
    bu_addWeapon(70, "Double Barrel", "", "m9k_dbarrel", "Легендарный", 1, Color(235, 75, 75))

    bu_addCrate(71, "Королевский", "", 489, Color(255, 127, 80))
    bu_addMoney(72, "$600.000", "", 600000, "Королевский", 40, Color(75, 105, 255))
    bu_addMoney(73, "$1.000.000", "", 1000000, "Королевский", 40, Color(75, 105, 255))
    bu_addMoney(74, "100 руб", "", 100, "Королевский", 40, Color(136, 71, 255), true)
    bu_addMoney(75, "250 руб", "", 250, "Королевский", 40, Color(136, 71, 255), true)
    bu_addMoney(76, "500 руб", "", 500, "Королевский", 40, Color(136, 71, 255), true)
    bu_addWeapon(77, "S&W Model 627", "", "m9k_model627", "Королевский", 4, Color(235, 75, 75))
    bu_addWeapon(78, "G36", "", "m9k_g36", "Королевский", 4, Color(235, 75, 75))
    bu_addWeapon(79, "Contender G2", "", "m9k_contender", "Королевский", 4, Color(235, 75, 75))
    bu_addWeapon(80, "MP7", "", "m9k_mp7", "Королевский", 4, Color(235, 75, 75))
    bu_addWeapon(81, "AS VAL", "", "m9k_val", "Королевский", 40, Color(255, 215, 0))
    bu_addWeapon(82, "P08 Luger", "", "m9k_luger", "Королевский", 20, Color(255, 215, 0))
    bu_addWeapon(83, "Magpul PDR", "", "m9k_magpulpdr", "Королевский", 35, Color(255, 215, 0))
    bu_addWeapon(84, "Raging Bull", "", "m9k_ragingbull", "Королевский", 40, Color(255, 215, 0))
    bu_addWeapon(85, "Vikhr", "", "m9k_vikhr", "Королевский", 40, Color(255, 215, 0))
    bu_addWeapon(86, "Double Barrel", "", "m9k_dbarrel", "Королевский", 1, Color(235, 75, 75))


end)

print("[UNBOXING INFO] UNBOXING CONFIG LOADED!")

BUC2.CustomCrateIcons = {
    --["Кейс SF-Stars"] = {"https://i.imgur.com/Noiu7Pp.png", "unbox/sfstarslogos.jpg"},
    --["Кейс Rande"] = {"https://i.imgur.com/3zOYJLQ.png", "unbox/randelogos.jpg"},
    --["Кейс Nefedoni"] = {"https://i.imgur.com/pqemWQ9.jpeg", "unbox/nefedoni.jpg"},
    --["Кейс Gubke"] = {"https://i.imgur.com/CfDBQjm.png", "unbox/gubke.jpg"},
    --["Лучший из лучших"] = {"https://i.imgur.com/6e07A4Z.png", "unbox/royal.jpg"},
}

-- BUC2.CustomCrateIcons = {
    -- ["Стандартный"] = {"https://i.imgur.com/Noiu7Pp.png", "icon_3d_22_1.png"},
    -- ["Премиум"] = {"https://i.imgur.com/3zOYJLQ.png", "unbox/randelogos.jpg"},
    -- ["Элитный"] = {"https://i.imgur.com/pqemWQ9.jpeg", "unbox/nefedoni.jpg"},
    -- ["Легендарный"] = {"https://i.imgur.com/CfDBQjm.png", "unbox/gubke.jpg"},
    -- ["Королевский"] = {"https://i.imgur.com/6e07A4Z.png", "unbox/royal.jpg"},
-- }

for k, v in next, BUC2.CustomCrateIcons do
    BUC2.CustomCrateIcons[k] = nil

    http.Fetch(v[1], function(data)
        file.Write(v[2], data)
        BUC2.CustomCrateIcons[k] = Material("data/" .. v[2])
		print(BUC2.CustomCrateIcons[k])
    end)
end
--PATH addons/vapeswep/lua/autorun/client/cl_vapeswep.lua:
-- autorun/client/cl_vapeswep.lua
-- Defines clientside globals for Vape SWEP

-- Vape SWEP by Swamp Onions - http://steamcommunity.com/id/swamponions/

if not VapeParticleEmitter then VapeParticleEmitter = ParticleEmitter(Vector(0,0,0)) end

sound.Add({
	name = "vape_inhale",
	channel = CHAN_WEAPON,
	volume = 0.24,
	level = 60,
	pitch = { 95 },
	sound = "vapeinhale.wav"
})

net.Receive("Vape",function()
	local ply = net.ReadEntity()
	local amt = net.ReadInt(8)
	local fx = net.ReadInt(8)
	if !IsValid(ply) then return end

	if amt>=50 then
		ply:EmitSound("vapecough1.wav",90)

		for i=1,200 do
			local d=i+10
			if i>140 then d=d+150 end
			timer.Simple((d-1)*0.003,function() vape_do_pulse(ply, 1, 100, fx) end)
		end

		return
	elseif amt>=35 then
		ply:EmitSound("vapebreath2.wav",75,100,0.7)
	elseif amt>=10 then
		ply:EmitSound("vapebreath1.wav",70,130-math.min(100,amt*2),0.4+(amt*0.005))
	end

	for i=1,amt*2 do
		timer.Simple((i-1)*0.02,function() vape_do_pulse(ply,math.floor(((amt*2)-i)/10), fx==2 and 100 or 0, fx) end)
	end
end)

net.Receive("VapeArm",function()
	local ply = net.ReadEntity()
	local z = net.ReadBool()
	if !IsValid(ply) then return end
	if ply.vapeArm != z then
		if z then
			timer.Simple(0.3, function() 
				if !IsValid(ply) then return end 
				if ply.vapeArm then ply:EmitSound("vape_inhale") end
			end)
		else
			ply:StopSound("vape_inhale")
		end
		ply.vapeArm = z
		ply.vapeArmTime = os.clock()
		local m = 0
		if z then m = 1 end

		for i=0,19 do
			timer.Simple(i/60,function() 
				vape_interpolate_arm(ply, math.abs(m-((19-i)/20)),z and 0 or 0.2) 
			end)
		end
	end
end)

net.Receive("VapeTalking",function()
	local ply = net.ReadEntity()
	if IsValid(ply) then ply.vapeTalkingEndtime = net.ReadFloat() end
end)

function vape_interpolate_arm(ply, mult, mouth_delay)
	if !IsValid(ply) then return end

	ply.vapeArmUpAmt = mult
	
	if mouth_delay>0 then 
		timer.Simple(mouth_delay,function() if IsValid(ply) then ply.vapeMouthOpenAmt = mult end end)
	else 
		ply.vapeMouthOpenAmt = mult
	end

	local b1 = ply:LookupBone("ValveBiped.Bip01_R_Upperarm")
	local b2 = ply:LookupBone("ValveBiped.Bip01_R_Forearm")
	if (not b1) or (not b2) then return end
	ply:ManipulateBoneAngles(b1,Angle(20*mult,-62*mult,10*mult))
	ply:ManipulateBoneAngles(b2,Angle(-5*mult,-10*mult,0))
	if mult==1 then ply.vapeArmFullyUp=true else ply.vapeArmFullyUp=false end
end

--this makes the mouth opening work without clobbering other addons
hook.Add("InitPostEntity", "VapeMouthMoveSetup", function()
	timer.Simple(1, function()
		if Vape_OriginalMouthMove ~= nil then return end

		Vape_OriginalMouthMove = GAMEMODE.MouthMoveAnimation
	 
		function GAMEMODE:MouthMoveAnimation(ply)
			--run the base MouthMoveAnimation if player isn't vaping/vapetalking
			if ((ply.vapeMouthOpenAmt or 0) == 0) and ((ply.vapeTalkingEndtime or 0) < CurTime()) then
				return Vape_OriginalMouthMove(GAMEMODE, ply)
			end

			local FlexNum = ply:GetFlexNum() - 1
			if ( FlexNum <= 0 ) then return end
			for i = 0, FlexNum - 1 do
				local Name = ply:GetFlexName(i)
				if ( Name == "jaw_drop" || Name == "right_part" || Name == "left_part" || Name == "right_mouth_drop" || Name == "left_mouth_drop" ) then
					ply:SetFlexWeight(i, math.max(((ply.vapeMouthOpenAmt or 0)*0.5), math.Clamp(((ply.vapeTalkingEndtime or 0)-CurTime())*3.0, 0, 1)*math.Rand(0.1,0.8) ))
				end
			end
		end
	end)
end)

function vape_do_pulse(ply, amt, spreadadd, fx)
	if !IsValid(ply) then return end

	if ply:WaterLevel()==3 then return end

	if not spreadadd then spreadadd=0 end

	local attachid = ply:LookupAttachment("eyes")
	VapeParticleEmitter:SetPos(LocalPlayer():GetPos())
	
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
		local particle
		if fx == 6 then
			particle = VapeParticleEmitter:Add(string.format("effects/fire_cloud1"), pos)
			if ply==LocalPlayer() then table.insert(MyDragonVapeParticles, particle) end
		else
			particle = VapeParticleEmitter:Add(string.format("particle/smokesprites_00%02d",math.random(7,16)), pos)
		end
		if particle then
			local dir = VectorRand():GetNormalized() * ((amt+5)/10)
			vape_do_particle(particle, (ply:GetVelocity()*0.25)+(((fwd*9)+dir):GetNormalized() * math.Rand(50,80) * (amt + 1) * 0.2), fx)
		end
	end
end

function vape_do_particle(particle, vel, fx)
	particle:SetColor(255,255,255,255)
	if fx == 3 then particle:SetColor(220,255,230,255) end
	if fx == 4 then particle:SetColor(220,230,255,255) end
	if fx == 7 then particle:SetColor(vape_red_white_blue_chooser(math.random(0,2)/3)) end
	if fx >= 20 then 
		local c = JuicyVapeJuices[fx-19].color
		if c == nil then c = HSVToColor(math.random(0,359),1,1) end
		particle:SetColor(c.r, c.g, c.b, 255)
	end

	local mega = 1
	if fx == 2 then mega = 4 end
	
	particle:SetVelocity( vel * mega * (fx==6 and 2 or 1))
	particle:SetGravity( Vector(0,0,fx == 4 and 15 or 1.5) )
	particle:SetLifeTime(0)
	particle:SetDieTime(math.Rand(80,100)*0.11*mega)
	if fx==6 then particle:SetDieTime(math.Rand(80,100)*0.03) end
	particle:SetStartSize(2*mega)
	if fx==6 then particle:SetStartSize(3) end
	particle:SetEndSize(40*mega*mega)
	if fx==6 then particle:SetEndSize(20) end
	particle:SetStartAlpha(fx == 4 and 20 or 150)
	particle:SetEndAlpha(0)
	particle:SetCollide(true)
	particle:SetBounce(0.25)
	particle:SetRoll(math.Rand(0,360))
	particle:SetRollDelta(0.01*math.Rand(-40,40))
	particle:SetAirResistance(50)
	if fx==6 then particle:SetAirResistance(20) end
end

MyDragonVapeParticles = {}

timer.Create("DragonVapeCollisionDetection",0.2,0,function()
	for k2,p in next,MyDragonVapeParticles do
		if p:GetDieTime()-p:GetLifeTime() < 0.1 then table.remove(MyDragonVapeParticles, k2) end
	end
	if #MyDragonVapeParticles > 0 then
		for k,v in next,ents.GetAll() do
			if (v.nextDragonVapeTime or 0) < CurTime() and v:IsSolid() and v~=LocalPlayer() then
				local pos = v:LocalToWorld(v:OBBCenter())
				local rad = v:BoundingRadius() + 20
				rad=rad*rad
				for k2,p in next,MyDragonVapeParticles do
					if (v.nextDragonVapeTime or 0) < CurTime() then
						if pos:DistToSqr(p:GetPos()) < rad then
							net.Start("DragonVapeIgnite")
							net.WriteEntity(v)
							net.SendToServer()
							v.nextDragonVapeTime = CurTime() + 5
						end
					end
				end
			end
		end
	end
end)

function vape_red_white_blue_chooser(lerp)
	lerp = 3*lerp

	local v = nil

	local r = Vector(255,0,0)
	local w = Vector(255,255,255)
	local b = Vector(0,0,255)

	if lerp >= 2 then
		v = LerpVector(lerp-2,b,r)
	elseif lerp >= 1 then
		v = LerpVector(lerp-1,w,b)
	else
		v = LerpVector(lerp,r,w)
	end

	--particle:SetColor takes seperate parameters per channel
	return v.x,v.y,v.z,255
end

matproxy.Add({
	name = "VapeTankColor",
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
		local v = ent.VapeTankColor or Vector(0.3,0.3,0.3)
		if v==Vector(-1,-1,-1) then
			local c = HSVToColor((CurTime()*60)%360,0.9,0.9)
			v = Vector(c.r,c.g,c.b)/255.0
		end
		if v==Vector(-2,-2,-2) then
			local c = Color(vape_red_white_blue_chooser((CurTime()*0.2)%1))
			v = Vector(c.r,c.g,c.b)/255.0
		end
		mat:SetVector(self.ResultTo, v)
	end
})

matproxy.Add({
	name = "VapeAccentColor",
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
		local col = ent.VapeAccentColor or Vector(1,1,1)
		if col==Vector(-1,-1,-1) then
			col=Vector(1,1,1)
			if IsValid(o) then col=o.CustomVapeColor or col end
		end
		mat:SetVector(self.ResultTo, col)
	end
})
--PATH gamemodes/darkrp/gamemode/modules/police/sh_interface.lua:
DarkRP.PLAYER.isWanted = DarkRP.stub{
    name = "isWanted",
    description = "Whether this player is wanted",
    parameters = {
    },
    returns = {
        {
            name = "answer",
            description = "Whether this player is wanted",
            type = "boolean"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.PLAYER.getWantedReason = DarkRP.stub{
    name = "getWantedReason",
    description = "Get the reason why someone is wanted",
    parameters = {
    },
    returns = {
        {
            name = "answer",
            description = "The reason",
            type = "string"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.PLAYER.isArrested = DarkRP.stub{
    name = "isArrested",
    description = "Whether this player is arrested",
    parameters = {
    },
    returns = {
        {
            name = "answer",
            description = "Whether this player is arrested",
            type = "boolean"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.PLAYER.isCP = DarkRP.stub{
    name = "isCP",
    description = "Whether this player is part of the police force (mayor, cp, chief).",
    parameters = {
    },
    returns = {
        {
            name = "answer",
            description = "Whether this player is part of the police force.",
            type = "boolean"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.PLAYER.isMayor = DarkRP.stub{
    name = "isMayor",
    description = "Whether this player is a mayor.",
    parameters = {
    },
    returns = {
        {
            name = "answer",
            description = "Whether this player is a mayor.",
            type = "boolean"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.PLAYER.isChief = DarkRP.stub{
    name = "isChief",
    description = "Whether this player is a Chief.",
    parameters = {
    },
    returns = {
        {
            name = "answer",
            description = "Whether this player is a Chief.",
            type = "boolean"
        }
    },
    metatable = DarkRP.PLAYER
}


DarkRP.hookStub{
    name = "canRequestWarrant",
    description = "Whether someone can request a search warrant.",
    parameters = {
        {
            name = "target",
            description = "The player to get the search warrant for",
            type = "Player"
        },
        {
            name = "actor",
            description = "The player requesting the warrant",
            type = "Player"
        },
        {
            name = "reason",
            description = "The reason for the search warrant",
            type = "Player"
        }
    },
    returns = {
        {
            name = "canRequest",
            description = "A yes or no as to whether the search warrant can be requested",
            type = "boolean"
        },
        {
            name = "message",
            description = "The message that is shown when it can't",
            type = "string"
        }
    }
}

DarkRP.hookStub{
    name = "canWanted",
    description = "Whether someone can make a player wanted",
    parameters = {
        {
            name = "target",
            description = "The player to make wanted by the police",
            type = "Player"
        },
        {
            name = "actor",
            description = "The player requesting the wanted status",
            type = "Player"
        },
        {
            name = "reason",
            description = "The reason",
            type = "Player"
        }
    },
    returns = {
        {
            name = "canRequest",
            description = "A yes or no as to whether the wanted can be requested",
            type = "boolean"
        },
        {
            name = "message",
            description = "The message that is shown when it can't",
            type = "string"
        }
    }
}

DarkRP.hookStub{
    name = "canUnwant",
    description = "Whether someone can remove the wanted status from a player",
    parameters = {
        {
            name = "target",
            description = "The player to make wanted by the police",
            type = "Player"
        },
        {
            name = "actor",
            description = "The player requesting the wanted status",
            type = "Player"
        }
    },
    returns = {
        {
            name = "canUnwant",
            description = "A yes or no answer",
            type = "boolean"
        },
        {
            name = "message",
            description = "The message that is shown when the answer is no",
            type = "string"
        }
    }
}

--PATH gamemodes/darkrp/gamemode/modules/jobs/sh_interface.lua:
DarkRP.hookStub{
    name = "OnPlayerChangedTeam",
    description = "When your team (job) is changed.",
    parameters = {
        {
            name = "ply",
            description = "The player that changed team. Clientside this hook is only called for the LocalPlayer.",
            type = "Player"
        },
        {
            name = "before",
            description = "The team before the change.",
            type = "number"
        },
        {
            name = "after",
            description = "The team after the change.",
            type = "number"
        }
    },
    returns = {

    }
}

--PATH addons/111mod/lua/darkrp_language/chatcommands.lua:
--[[---------------------------------------------------------------------------
English (example) Chat command translation file
---------------------------------------------------------------------------

This file contains translations for chat command descriptions.
On the left side you see the chat command, on the right side you see the description.
When translating these descriptions, make sure to leave the quotation marks (" ") and commas intact!

= Warning =
Sometimes when DarkRP is updated, new chat commands are added, changed and/or removed.
By default, chat commands that aren't translated will use the English description.
Chat command translations that don't exist are ignored.


= How to translate missing chat commands =
1. Start the server
2. Join it
3. In your console, enter the following command:
	darkrp_translateChatCommands
4. Come back to this file
5. Paste where it says "-- Add new chat command translations under this line:"

= Note =
Make sure the language code is right at the bottom of this file

= Using a language =
Make sure the convar gmod_language is set to your language code. You can do that in a server CFG file.
---------------------------------------------------------------------------]]

local descriptions = {
	["/"]                     =	"Global server chat.",
	["a"]                     =	"Global server chat.",
	["addjailpos"]            =	"Add a jail position where you're standing.",
	["addlaw"]                =	"Add a law to the laws board.",
	["addowner"]              =	"Invite someone to co-own the door you're looking at.",
	["addspawn"]              =	"Add a spawn position for some job (use the command name of the job as argument)",
	["addzombie"]             =	"Add a zombie spawn pos.",
	["advert"]                =	"Advertise something to everyone in the server.",
	["agenda"]                =	"Set the agenda.",
	["ao"]                    =	"Invite someone to co-own the door you're looking at.",
	["broadcast"]             =	"Broadcast something as a mayor.",
	["buy"]                   =	"Buy a pistol",
	["buyammo"]               =	"Purchase ammo",
	["buydruglab"]            =	"Purchase a Drug lab",
	["buygunlab"]             =	"Purchase a Gun lab",
	["buymoneyprinter"]       =	"Purchase a Money printer",
	["buyshipment"]           =	"Buy a shipment",
	["buyvehicle"]            =	"Buy a vehicle",
	["channel"]               =	"Tune into a radio channel.",
	["check"]                 =	"Write a cheque for a specific person.",
	["cheque"]                =	"Write a cheque for a specific person.",
	["chief"]                 =	"Become Civil Protection Chief.",
	["citizen"]               =	"Become Citizen.",
	["cp"]                    =	"Become Civil Protection and skip the vote.",
	["cr"]                    =	"Cry for help, the police will come (hopefully)!",
	["credits"]               =	"Send the DarkRP credits to someone.",
	["demote"]                =	"Demote a player from their job",
	["demotelicense"]         =	"Start a vote to get someone's license revoked.",
	["disablestorm"]          =	"Disable meteor storms.",
	["disablezombie"]         =	"Disable zombie mod.",
	["dropmoney"]             =	"Drop money on the floor.",
	["enablestorm"]           =	"Enable meteor storms.",
	["enablezombie"]          =	"Enable zombie mod.",
	["g"]                     =	"Group chat.",
	["gangster"]              =	"Become Gangster.",
	["give"]                  =	"Give money to the player you're looking at.",
	["givelicense"]           =	"Give someone a gun license",
	["gundealer"]             =	"Become Gun Dealer.",
	["hitprice"]              =	"Set the price of your hits",
	["hobo"]                  =	"Become Hobo.",
	["jailpos"]               =	"Reset jail positions and create a new one at your position.",
	["job"]                   =	"Change your job name",
	["jobswitch"]             =	"Switch jobs with the player you're looking at",
	["lockdown"]              =	"Start a lockdown. Everyone will have to stay inside",
	["lottery"]               =	"Start a lottery",
	["makeshipment"]          =	"Create a shipment from a dropped weapon.",
	["maxzombie"]             =	"Set the maximum amount of zombies that can be in a level.",
	["maxzombies"]            =	"Set the maximum amount of zombies that can be in a level.",
	["mayor"]                 =	"Become Mayor and skip the vote.",
	["me"]                    =	"Chat roleplay to say you're doing things that you can't show otherwise.",
	["medic"]                 =	"Become Medic.",
	["mobboss"]               =	"Become Mob boss.",
	["moneydrop"]             =	"Drop money on the floor.",
	["name"]                  =	"Set your RP name",
	["nick"]                  =	"Set your RP name",
	["ooc"]                   =	"Global server chat.",
	["placelaws"]             =	"Place a laws board.",
	["pm"]                    =	"Send a private message to someone.",
	["price"]                 =	"Set the price of the microwave or gunlab you're looking at",
	["radio"]                 =	"Say something through the radio.",
	["removelaw"]             =	"Remove a law from the laws board.",
	["removeletters"]         =	"Remove all of your letters.",
	["removeowner"]           =	"Remove an owner from the door you're looking at.",
	["removespawn"]           =	"Remove a spawn position for some job (use the command name of the job as argument)",
	["removezombie"]          =	"Remove a zombie spawn pos by id (get id with /showzombie).",
	["requesthit"]            =	"Request a hit from the player you're looking at",
	["requestlicense"]        =	"Request a gun license.",
	["ro"]                    =	"Remove an owner from the door you're looking at.",
	["rpname"]                =	"Set your RP name",
	["setprice"]              =	"Set the price of the microwave or gunlab you're looking at",
	["setspawn"]              =	"Reset the spawn position for some job and place a new one at your position (use the command name of the job as argument)",
	["showzombie"]            =	"Show zombie spawn positions.",
	["sleep"]                 =	"Go to sleep or wake up",
	["splitshipment"]         =	"Split the shipment you're looking at.",
	["switchjob"]             =	"Switch jobs with the player you're looking at",
	["switchjobs"]            =	"Switch jobs with the player you're looking at",
	["teamban"]               =	"Ban someone from getting a certain job",
	["teamunban"]             =	"Undo a teamban",
	["title"]                 =	"Set the title of the door you're looking at.",
	["togglegroupownable"]    =	"Set this door group ownable.",
	["toggleown"]             =	"Own or unown the door you're looking at.",
	["toggleownable"]         =	"Toggle ownability status on this door.",
	["toggleteamownable"]     =	"Toggle this door ownable by a given team.",
	["type"]                  =	"Type a letter.",
	["unlockdown"]            =	"Stop a lockdown",
	["unownalldoors"]         =	"Sell all of your doors.",
	["unwanted"]              =	"Remove a player's wanted status.",
	["votecp"]                =	"Vote to become Civil Protection.",
	["votemayor"]             =	"Vote to become Mayor.",
	["w"]                     =	"Say something in whisper voice.",
	["wake"]                  =	"Go to sleep or wake up",
	["wakeup"]                =	"Go to sleep or wake up",
	["wanted"]                =	"Make a player wanted. This is needed to get them arrested.",
	["warrant"]               =	"Get a search warrant for a certain player. With this warrant you can search their house",
	["write"]                 =	"Write a letter.",
	["y"]                     =	"Yell something out loud.",
	["zombiemax"]             =	"Set the maximum amount of zombies that can be in a level.",

	-- Add new chat command translations under this line:

}

--
DarkRP.addChatCommandsLanguage("en", descriptions)

--PATH addons/111mod/lua/darkrp_modules/ui_markers/sh_markers.lua:
DarkRP.declareChatCommand{
	command = "sendpos",
	description = "Отправить местоположение",
	delay = 2.5
}
--PATH addons/111mod/lua/darkrp_modules/sit/sh_helpers.lua:
SitAnywhere = SitAnywhere or {}
SitAnywhere.NET = {
	["SitWantedAng"] = 0,
	["SitRequestExit"] = 1,
}

SitAnywhere.ClassBlacklist = {
	["gmod_wire_keyboard"] = true,
	["prop_combine_ball"] = true
}

SitAnywhere.DoNotParent = {
	["yava_chunk"] = true
}
SitAnywhere.ModelBlacklist = {
}

local EMETA = FindMetaTable"Entity"

function SitAnywhere.GetAreaProfile(pos, resolution, simple)
	local filter = player.GetAll()
	local dists = {}
	local distsang = {}
	local ang_smallest_hori = nil
	local smallest_hori = 90000
	local angPerIt = (360 / resolution)
	for I = 0, 360, angPerIt do
		local rad = math.rad(I)
		local dir = Vector(math.cos(rad), math.sin(rad), 0)
		local trace = util.QuickTrace(pos + dir * 20 + Vector(0,0,5), Vector(0,0,-15000), filter)
		trace.HorizontalTrace = util.QuickTrace(pos + Vector(0,0,5), dir * 1000, filter)
		trace.Distance  =  trace.StartPos:Distance(trace.HitPos)
		trace.Distance2 = trace.HorizontalTrace.StartPos:Distance(trace.HorizontalTrace.HitPos)
		trace.ang = I

		if (not trace.Hit or trace.Distance > 14) and (not trace.HorizontalTrace.Hit or trace.Distance2 > 20) then
			if simple then return true end
			table.insert(dists, trace)
		end
		if trace.Distance2 < smallest_hori and (not trace.HorizontalTrace.Hit or trace.Distance2 > 3) then
			smallest_hori = trace.Distance2
			ang_smallest_hori = I
		end
		distsang[I] = trace
	end

	if simple then return false end
	return dists, distsang, ang_smallest_hori, smallest_hori
end

function SitAnywhere.CheckValidAngForSit(pos, surfaceAng, ang)
	local rad = math.rad(ang)
	local dir = Vector(math.cos(rad), math.sin(rad), 0)
	local trace2 = util.TraceLine({
		start = pos - dir * (20 - .5) + surfaceAng:Forward() * 5,
		endpos = pos - dir * (20 - .5) + surfaceAng:Forward() * -160,
		filter = player.GetAll()
	})

	local hor_trace = util.TraceLine({
		start = pos + Vector(0, 0, 5),
		endpos = pos + Vector(0, 0, 5) - dir * 1600,
		filter = player.GetAll()
	})

	return hor_trace.StartPos:Distance(hor_trace.HitPos) > 20 and trace2.StartPos:Distance(trace2.HitPos) > 14
end


local SitOnEntsMode = CreateConVar("sitting_ent_mode","3", {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "0 = No entities\n1 = World entities only\n2 = Self-Owned, World, Unowned\n3 = Any Entity", 0, 3)
--[[
	0 - Can't sit on any ents
	1 - Can't sit on any player ents
	2 - Can only sit on your own ents
	3 - Any
]]

local blacklist = SitAnywhere.ClassBlacklist
local model_blacklist = SitAnywhere.ModelBlacklist
function SitAnywhere.ValidSitTrace(ply, EyeTrace)
	if not EyeTrace.Hit then return false end
	if EyeTrace.HitPos:Distance(EyeTrace.StartPos) > 100 then return false end
	local t = hook.Run("CheckValidSit", ply, EyeTrace)

	if t == false or t == true then
		return t
	end

	if not EyeTrace.HitWorld and SitOnEntsMode:GetInt() == 0 then return false end
	if not EyeTrace.HitWorld and blacklist[string.lower(EyeTrace.Entity:GetClass())] then return false end
	if not EyeTrace.HitWorld and EyeTrace.Entity:GetModel() and model_blacklist[string.lower(EyeTrace.Entity:GetModel())] then return false end


	if EMETA.CPPIGetOwner and SitOnEntsMode:GetInt() >= 1 then
		if SitOnEntsMode:GetInt() == 1 then
			if not EyeTrace.HitWorld then
				local owner = EyeTrace.Entity:CPPIGetOwner()
				if type(owner) == "Player" and owner ~= nil and owner:IsValid() and owner:IsPlayer() then
					return false
				end
			end
		elseif SitOnEntsMode:GetInt() == 2 then
			if not EyeTrace.HitWorld then
				local owner = EyeTrace.Entity:CPPIGetOwner()
				if type(owner) == "Player" and owner ~= nil and owner:IsValid() and owner:IsPlayer() and owner ~= ply then
					return false
				end
			end
		end
	end
	return true
end

local seatClass = "prop_vehicle_prisoner_pod"
local PMETA = FindMetaTable"Player"
function PMETA:GetSitters()
	local seats, holders = {}, {}

	local function processSeat(seat, depth)
		depth = (depth or 0) + 1
		if IsValid(seat:GetDriver()) and seat:GetDriver() ~= self then
			table.insert(seats, seat)
		end
		for _, v in pairs(seat:GetChildren()) do
			if IsValid(v) and v:GetClass() == seatClass and IsValid(v:GetDriver()) and #v:GetChildren() > 0 and depth <= 128 then
				processSeat(v, depth)
			end
		end
	end

	local plyVehicle = self:GetVehicle()
	if IsValid(plyVehicle) and plyVehicle:GetClass() == seatClass then
		processSeat(plyVehicle)
	end

	for _, v in pairs(self:GetChildren()) do
		if IsValid(v) and v:GetClass() == seatClass then
			processSeat(v)
		end
	end

	for _, v in pairs(ents.FindByClass("sit_holder")) do
		if v.GetTargetPlayer and v:GetTargetPlayer() == self then
			table.insert(holders, v)
			if v.GetSeat and IsValid(v:GetSeat()) then
				processSeat(v:GetSeat())
			end
		end
	end
	return seats, holders
end

function PMETA:IsPlayerSittingOn(ply)
	local seats = ply:GetSitters()
	for _,v in pairs(seats) do
		if IsValid(v:GetDriver()) and v:GetDriver() == self then return true end
	end
	return false
end

function PMETA:GetSitting()
	if not IsValid(self:GetVehicle()) then return false end
	local veh = self:GetVehicle()
	if veh:GetNWBool("playerdynseat", false) then
		local parent = veh:GetParent()
		if IsValid(parent) and parent:GetClass() == "sit_holder" then
			return veh, parent
		else
			return veh
		end
	end
	return false
end

function PMETA:ExitSit()
	if CLIENT then
		if self ~= LocalPlayer() then return end
		net.Start("SitAnywhere")
			net.WriteInt(SitAnywhere.NET.SitRequestExit, 4)
		net.SendToServer()
	else
		local seat, holder = self:GetSitting()
		SafeRemoveEntity(seat)
		SafeRemoveEntity(holder)

		if SitAnywhere.GroundSit and self:GetNWBool("SitGroundSitting", false) then
			self:SetNWBool("SitGroundSitting", false)
		end
	end
end

function EMETA:IsSitAnywhereSeat()
	if self:GetClass() ~= "prop_vehicle_prisoner_pod" then return false end
	if SERVER and self.playerdynseat then return true end
	return self:GetNWBool("playerdynseat", false)
end
--PATH addons/111mod/lua/darkrp_customthings/shipments.lua:
DarkRP.createShipment("Фейковый паспорт", {
   model = "models/kerry/passport_rus.mdl",
   entity = "fakepass",
   price = 15000,
   amount = 1,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_STORE},
   category = "Легкое оружие",
})

DarkRP.createShipment("Револьвер", {
   model = "models/weapons/w_357.mdl",
   entity = "revolver",
   price = 26500,
   amount = 5,
   separate = true,
   pricesep = 5400,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Легкое оружие",
})

DarkRP.createShipment("Монтировка", {
   model = "models/weapons/w_crowbar.mdl",
   entity = "weapon_crowbar",
   price = 7000,
   amount = 5,
   separate = true,
   pricesep = 1500,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Легкое оружие",
})

DarkRP.createShipment("Отмычка", {
   model = "models/weapons/w_crowbar.mdl",
   entity = "lockpick",
   price = 2500,
   amount = 5,
   separate = true,
   pricesep = 500,
   noship = false,
   allowed = {TEAM_STORE},
   category = "Легкое оружие",
})

DarkRP.createShipment("Дубинка", {
   model = "models/weapons/w_stunbaton.mdl",
   entity = "stunstick",
   price = 2500,
   amount = 5,
   separate = true,
   pricesep = 500,
   noship = false,
   allowed = {TEAM_STORE, TEAM_GUN},
   category = "Легкое оружие",
})

DarkRP.createShipment("Взломщик кейпада", {
   model = "models/weapons/w_c4.mdl",
   entity = "keypad_cracker",
   price = 25000,
   amount = 5,
   separate = true,
   pricesep = 5000,
   noship = false,
   allowed = {TEAM_STORE, TEAM_GUN},
   category = "Легкое оружие",
})

DarkRP.createShipment("Аптечка", {
   model = "models/Items/HealthKit.mdl",
   entity = "weapon_medkit",
   price = 20000,
   amount = 5,
   separate = true,
   pricesep = 4000,
   noship = false,
   allowed = {TEAM_STORE, TEAM_GUN},
   category = "Легкое оружие",
})

DarkRP.createShipment("Верёвка", {
   model = "models/Gibs/HGIBS_rib.mdl",
   entity = "weapon_cuff_rope",
   price = 12500,
   amount = 5,
   separate = true,
   pricesep = 2500,
   noship = false,
   allowed = {TEAM_STORE},
   category = "Легкое оружие",
})

DarkRP.createShipment("Маскировка", {
   model = "models/props_c17/SuitCase_Passenger_Physics.mdl",
   entity = "swep_disguise_briefcase",
   price = 12500,
   amount = 5,
   separate = true,
   pricesep = 2500,
   noship = false,
   allowed = {TEAM_STORE},
   category = "Легкое оружие",
})

DarkRP.createShipment("AK-47", {
   model = "models/weapons/w_rif_ak47.mdl",
   entity = "ak47",
   price = 40000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Тяжёлое оружие",
})

DarkRP.createShipment("M4A1", {
   model = "models/weapons/w_rif_m4a1.mdl",
   entity = "m4a1",
   price = 39500,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Тяжёлое оружие",
})

DarkRP.createShipment("SCOUT", {
   model = "models/weapons/w_snip_scout.mdl",
   entity = "scout",
   price = 27000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Снайперские винтовки",
})

DarkRP.createShipment("AWP", {
   model = "models/weapons/w_snip_awp.mdl",
   entity = "awp",
   price = 55000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Снайперские винтовки",
})

DarkRP.createShipment("AUG", {
   model = "models/weapons/w_rif_aug.mdl",
   entity = "aug",
   price = 35000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Снайперские винтовки",
})

DarkRP.createShipment("SG552", {
   model = "models/weapons/w_rif_sg552.mdl",
   entity = "sg552",
   price = 33000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Снайперские винтовки",
})

DarkRP.createShipment("Desert Eagle", {
   model = "models/weapons/w_pist_deagle.mdl",
   entity = "deagle",
   price = 28000,
   amount = 5,
   separate = true,
   pricesep = 5700,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Легкое оружие",
})

DarkRP.createShipment("FAMAS", {
   model = "models/weapons/w_rif_famas.mdl",
   entity = "famas",
   price = 33500,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Тяжёлое оружие",
})

DarkRP.createShipment("Five-seven", {
   model = "models/weapons/w_pist_fiveseven.mdl",
   entity = "fiveseven",
   price = 14500,
   amount = 5,
   separate = true,
   pricesep = 3500,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Легкое оружие",
})

DarkRP.createShipment("Galil", {
   model = "models/weapons/w_rif_galil.mdl",
   entity = "galil",
   price = 34000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Тяжёлое оружие",
})

DarkRP.createShipment("Glock", {
   model = "models/weapons/w_pist_glock18.mdl",
   entity = "glock",
   price = 16000,
   amount = 5,
   separate = true,
   pricesep = 3200,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Легкое оружие",
})

DarkRP.createShipment("USP-45", {
   model = "models/weapons/w_pist_usp.mdl",
   entity = "usp",
   price = 15000,
   amount = 5,
   separate = true,
   pricesep = 3000,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Легкое оружие",
})

DarkRP.createShipment("Нож", {
   model = "models/weapons/w_knife_t.mdl",
   entity = "knife",
   price = 3500,
   amount = 5,
   separate = true,
   pricesep = 800,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Холодное оружие",
})

DarkRP.createShipment("M3 Super 90", {
   model = "models/weapons/w_shot_m3super90.mdl",
   entity = "m3super90",
   price = 21500,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Тяжёлое оружие",
})

DarkRP.createShipment("XM1014", {
   model = "models/weapons/w_shot_xm1014.mdl",
   entity = "xm1014",
   price = 20000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Тяжёлое оружие",
})

DarkRP.createShipment("M249", {
   model = "models/weapons/w_mach_m249para.mdl",
   entity = "m249",
   price = 35000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Тяжёлое оружие",
})

DarkRP.createShipment("MAC-10", {
   model = "models/weapons/w_smg_mac10.mdl",
   entity = "mac10",
   price = 32500,
   amount = 5,
   separate = true,
   pricesep = 6700,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Пистолеты-Пулемёты",
})


DarkRP.createShipment("MP5", {
   model = "models/weapons/w_smg_mp5.mdl",
   entity = "mp5",
   price = 34000,
   amount = 5,
   separate = true,
   pricesep = 7200,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Пистолеты-Пулемёты",
})

DarkRP.createShipment("P90", {
   model = "models/weapons/w_smg_p90.mdl",
   entity = "p90",
   price = 29000,
   amount = 5,
   separate = true,
   pricesep = 6200,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Пистолеты-Пулемёты",
})

DarkRP.createShipment("UMP-45", {
   model = "models/weapons/w_smg_ump45.mdl",
   entity = "ump",
   price = 27500,
   amount = 5,
   separate = true,
   pricesep = 5500,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Пистолеты-Пулемёты",
})

DarkRP.createShipment("P228", {
   model = "models/weapons/w_pist_p228.mdl",
   entity = "p228",
   price = 14700,
   amount = 5,
   separate = true,
   pricesep = 3000,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Легкое оружие",
})

DarkRP.createShipment("TMP", {
   model = "models/weapons/w_smg_tmp.mdl",
   entity = "tmp",
   price = 28000,
   amount = 5,
   separate = true,
   pricesep = 5700,
   noship = false,
   allowed = {TEAM_GUN, TEAM_BANDIST},
   category = "Пистолеты-Пулемёты",
})

DarkRP.createShipment("Repair Wrench (Cocaine Factory)", {
	model = "models/craphead_scripts/the_cocaine_factory/wrench/w_wrench.mdl",
	entity = "cocaine_repair_wrench",
	price = 5000,
	amount = 10,
	separate = true,
	pricesep = 600,
	noship = false,
	allowed = {TEAM_CGANG},
	category = "Cocaine Factory",
})

DarkRP.createShipment("Intervention", {
   model = "models/weapons/w_snip_int.mdl",
   entity = "m9k_intervention",
   price = 250000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Снайперские винтовки",
})

DarkRP.createShipment("Barret M98B", {
   model = "models/weapons/w_barrett_m98b.mdl",
   entity = "m9k_m98b",
   price = 215000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Снайперские винтовки",
})

DarkRP.createShipment("Ares Shrike", {
   model = "models/weapons/w_ares_shrike.mdl",
   entity = "m9k_ares_shrike",
   price = 200000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Тяжёлое оружие",
})

DarkRP.createShipment("M24", {
   model = "models/weapons/w_snip_m24_6.mdl",
   entity = "m9k_m24",
   price = 190000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Снайперские винтовки",
})

DarkRP.createShipment("PKM", {
   model = "models/weapons/w_mach_russ_pkm.mdl",
   entity = "m9k_pkm",
   price = 180000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Тяжёлое оружие",
})

DarkRP.createShipment("Mossberg 590", {
   model = "models/weapons/w_mossberg_590.mdl",
   entity = "m9k_mossberg590",
   price = 150000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Тяжёлое оружие",
})

DarkRP.createShipment("Ithaca M37", {
   model = "models/weapons/w_ithaca_m37.mdl",
   entity = "m9k_ithacam37",
   price = 105000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Тяжёлое оружие",
})

DarkRP.createShipment("Remington 870", {
   model = "models/weapons/w_remington_870_tact.mdl",
   entity = "m9k_remington870",
   price = 100500,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Тяжёлое оружие",
})

DarkRP.createShipment("M16 ACOG", {
   model = "models/weapons/w_dmg_m16ag.mdl",
   entity = "m9k_m16a4_acog",
   price = 96000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Тяжёлое оружие",
})

DarkRP.createShipment("ACR", {
   model = "models/weapons/w_masada_acr.mdl",
   entity = "m9k_acr",
   price = 94500,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Тяжёлое оружие",
})

DarkRP.createShipment("Vikhr", {
   model = "models/weapons/w_dmg_vikhr.mdl",
   entity = "m9k_vikhr",
   price = 93500,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Тяжёлое оружие",
})

DarkRP.createShipment("AMD-65", {
   model = "models/weapons/w_amd_65.mdl",
   entity = "m9k_amd65",
   price = 92000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Тяжёлое оружие",
})

DarkRP.createShipment("F2000", {
   model = "models/weapons/w_fn_f2000.mdl",
   entity = "m9k_f2000",
   price = 90000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Тяжёлое оружие",
})

DarkRP.createShipment("AK74", {
   model = "models/weapons/w_tct_ak47.mdl",
   entity = "m9k_ak74",
   price = 88000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Тяжёлое оружие",
})

DarkRP.createShipment("AS VAL", {
   model = "models/weapons/w_dmg_vally.mdl",
   entity = "m9k_val",
   price = 85000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Тяжёлое оружие",
})

DarkRP.createShipment("G3A3", {
   model = "models/weapons/w_hk_g3.mdl",
   entity = "m9k_g3a3",
   price = 82000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Тяжёлое оружие",
})

DarkRP.createShipment("Magpul PDR", {
   model = "models/weapons/w_magpul_pdr.mdl",
   entity = "m9k_magpulpdr",
   price = 78000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Пистолеты-Пулемёты",
})

DarkRP.createShipment("KAC PDW", {
   model = "models/weapons/w_kac_pdw.mdl",
   entity = "m9k_kac_pdw",
   price = 76000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Пистолеты-Пулемёты",
})

DarkRP.createShipment("Bizon", {
   model = "models/weapons/w_pp19_bizon.mdl",
   entity = "m9k_bizonp19",
   price = 72000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Пистолеты-Пулемёты",
})

DarkRP.createShipment("UMP", {
   model = "models/weapons/w_smg_ump45.mdl",
   entity = "m9k_ump45",
   price = 63000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Пистолеты-Пулемёты",
})

DarkRP.createShipment("MP5SD", {
   model = "models/weapons/w_hk_mp5sd.mdl",
   entity = "m9k_mp5sd",
   price = 60000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Пистолеты-Пулемёты",
})

DarkRP.createShipment("P229", {
   model = "models/weapons/w_sig_229r.mdl",
   entity = "m9k_sig_p229r",
   price = 33000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Легкое оружие",
})

DarkRP.createShipment("Colt 1911", {
   model = "models/weapons/s_dmgf_co1911.mdl",
   entity = "m9k_colt1911",
   price = 22000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Легкое оружие",
})

DarkRP.createShipment("Colt Python", {
   model = "models/weapons/w_colt_python.mdl",
   entity = "m9k_coltpython",
   price = 20500,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Легкое оружие",
})

DarkRP.createShipment("M92 Beretta", {
   model = "models/weapons/w_beretta_m92.mdl",
   entity = "m9k_m92beretta",
   price = 19000,
   amount = 5,
   separate = false,
   pricesep = nil,
   noship = false,
   allowed = {TEAM_GUN},
   category = "Легкое оружие",
})
--PATH addons/111mod/lua/darkrp_customthings/agendas.lua:
--[[---------------------------------------------------------------------------
DarkRP Agenda's
---------------------------------------------------------------------------
Agenda's can be set by the agenda manager and read by both the agenda manager and the other teams connected to it.


HOW TO MAKE AN AGENDA:
AddAgenda(Title of the agenda, Manager (who edits it), {Listeners (the ones who just see and follow the agenda)})
---------------------------------------------------------------------------]]
-- Example: AddAgenda("Gangster's agenda", TEAM_MOB, {TEAM_GANG})
-- Example: AddAgenda("Police agenda", TEAM_MAYOR, {TEAM_CHIEF, TEAM_POLICE})
AddAgenda("Повестка Дня", TEAM_MAYOR, {TEAM_POLICE, TEAM_FBI, TEAM_OMON, TEAM_MAYOR, TEAM_ROMON, TEAM_DOMON, TEAM_CHIEF, TEAM_JAGA})
--AddAgenda("Цель собак", TEAM_DOGEE, {TEAM_DOGE})
AddAgenda("Цель Бомжей", TEAM_HOBOO, {TEAM_HOBO})
--PATH addons/grp_knife/lua/weapons/csgo_huntsman.lua:
if not file.Exists( "weapons/csgo_baseknife.lua", "LUA" ) then
  SWEP.Spawnable = false
  print( "csgo_huntsman failed to initialize: csgo_baseknife.lua not found. Did you install the main part?" )
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

SWEP.PrintName      = "Huntsman Knife"
SWEP.Category       = "CS:GO Knives"

SWEP.Spawnable      = true
SWEP.AdminSpawnable = true

SWEP.ViewModel      = "models/weapons/v_csgo_tactical.mdl"
SWEP.WorldModel     = "models/weapons/w_csgo_tactical.mdl"

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
SWEP.Icon = "vgui/entities/csgo_huntsman.vmt"

--PATH addons/cp_bricks_enchanced_sweps/lua/weapons/dsr_taser.lua:

AddCSLuaFile()

SWEP.PrintName = "Taser" -- change the name
SWEP.Author = "Brickwall"
SWEP.Instructions = "Left click to tase a player"

SWEP.Category = "DarkRP SWEP Replacements" -- change the name


SWEP.Slot = 1
SWEP.SlotPos = 4

SWEP.Spawnable = true

SWEP.ViewModel = Model( "models/sterling/c_enhanced_taser.mdl" ) -- just change the model 
SWEP.WorldModel = ( "models/sterling/w_enhanced_taser.mdl" )
SWEP.ViewModelFOV = 85
SWEP.UseHands = true

SWEP.Primary.Sound = Sound("Weapon_Deagle.Single")
SWEP.Primary.Recoil = 5.1
SWEP.Primary.Damage = 1
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.01
SWEP.Primary.ClipSize = 2
SWEP.Primary.Delay = 0.3
SWEP.Primary.DefaultClip = 3
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "stungun"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"

SWEP.DrawAmmo = true
SWEP.Base = "weapon_base"

SWEP.Secondary.Ammo = "none"

game.AddAmmoType({
	name = "stungun",
	dmgtype = DMG_GENERIC,
	tracer = TRACER_NONE,
	plydmg = 0,
	npcdmg = 0,
	force = 0,
	minsplash = 0,
	maxsplash = 0
})

if( CLIENT ) then
	language.Add( "stungun_ammo", "Stungun Cartridge" )
end

DarkRP.createAmmoType("stungun", {
	name = "Картридж для тайзера",
	model = "models/sterling/enhanced_taser_ammobox.mdl",
	price = 150,
	amountGiven = 12
})

sound.Add( {
	name = "bes_taser",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 80,
	pitch = { 95, 110 },
	sound = "ambient/energy/electric_loop.wav"
} )

function SWEP:Initialize()
	self:SetWeaponHoldType( "pistol" )
end

function SWEP:PrimaryAttack()
	if self:Clip1() <= 0 then return end
	
	self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK_1 )
	self:TakePrimaryAmmo( 1 )

	self.Owner:LagCompensation(true)
	local tr = util.TraceLine(util.GetPlayerTrace( self.Owner ))
	self.Owner:LagCompensation(false)

	local effectdata = EffectData()
	effectdata:SetOrigin( tr.HitPos )
	effectdata:SetStart( self.Owner:GetShootPos() )
	effectdata:SetAttachment( 1 )
	effectdata:SetEntity( self )
	util.Effect( "ToolTracer", effectdata )

	self:EmitSound("npc/turret_floor/shoot1.wav",100,100)
	if tr.Entity and tr.Entity:IsPlayer() and tr.Entity:Team() == TEAM_MODER or tr.Entity:GetNW2Bool("SpawnProtected") then return end
	if tr.Entity and tr.Entity:IsPlayer() and tr.Entity:isCP() then return end
	if tr.Entity and tr.Entity:IsPlayer() and tr.Entity:IsFrozen() then return end
	
	if( tr.Entity and IsValid( tr.Entity ) and tr.Entity:IsPlayer() and not tr.Entity:GetNW2Bool( "BES_TASERED", false ) and tr.Entity:GetPos():DistToSqr( self:GetPos() ) < 90000 ) then
		local UserID = tr.Entity:UserID()
		timer.Create( "BES_TIMER_TASER_" .. UserID, 1, 0, function()
			if( tr.Entity and IsValid( tr.Entity ) and tr.Entity:IsPlayer() and tr.Entity:GetNW2Bool( "BES_TASERED", false ) ) then
				tr.Entity:DoCustomAnimEvent( PLAYERANIMEVENT_CUSTOM_GESTURE, table.Random( { 117, 119, 124 } ) )
			else
				timer.Remove( "BES_TIMER_TASER_" .. UserID )
			end
		end )

		if SERVER then
			tr.Entity:EmitSound( "bes_taser" )
			tr.Entity:SetNW2Bool( "BES_TASERED", true )
			tr.Entity:Freeze( true )
			timer.Simple( 5, function()
				if( tr.Entity and IsValid( tr.Entity ) and tr.Entity:IsPlayer() and tr.Entity:GetNW2Bool( "BES_TASERED", false ) ) then
					tr.Entity:Freeze( false )
					tr.Entity:SetNW2Bool( "BES_TASERED", false )
					tr.Entity:StopSound( "bes_taser" )
				end
			end )
		end
	end
end 

function SWEP:SecondaryAttack()

end

function SWEP:Reload()
	self.Weapon:DefaultReload( ACT_VM_RELOAD )
end

hook.Add( "PlayerDeath", "BES_PlayerDeath_Taser", function( victim )
	if( IsValid( victim ) and victim:GetNW2Bool( "BES_TASERED", false ) ) then
		victim:Freeze( false )
		victim:SetNW2Bool( "BES_TASERED", false )
		victim:StopSound( "bes_taser" )
	end
end )

hook.Add( "EntityRemoved", "BES_EntityRemoved_Taser", function( ent )
	if( IsValid( ent ) and ent:GetNW2Bool( "BES_TASERED", false ) ) then
		ent:SetNW2Bool( "BES_TASERED", false )
		ent:StopSound( "bes_taser" )
	end
end )
--PATH addons/bricks_gangs/lua/weapons/gmod_tool/stools/bricks_server_territory_placer.lua:
TOOL.Category = "Admin"
TOOL.Name = "Territory Placer"
TOOL.Command = nil
TOOL.ConfigName = ""

function TOOL:LeftClick( trace )
	if( !trace.HitPos || IsValid( trace.Entity ) && trace.Entity:IsPlayer() ) then return false end
	if( CLIENT ) then return true end

	local ply = self:GetOwner()
	
	if( not BRICKS_SERVER.Func.HasAdminAccess( ply ) ) then
		DarkRP.notify( ply, 1, 2, BRICKS_SERVER.Func.L( "noToolPermission" ) )
		return
	end

	if( not BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "territories" ) ) then return end

	if( BRICKS_SERVER.CONFIG.GANGS.Territories[ply:GetNW2Int( "bricks_server_tool_territorykey" )] ) then
		local entity = ents.Create( "bricks_server_territory" )
		entity:SetPos( trace.HitPos )
		local EntAngles = entity:GetAngles()
		local PlayerAngle = ply:GetAngles()
		entity:SetAngles( Angle( EntAngles.p, PlayerAngle.y+180, EntAngles.r ) )
		entity:Spawn()
		entity:SetTerritoryKeyFunc( ply:GetNW2Int( "bricks_server_tool_territorykey" ) )
		
		DarkRP.notify( ply, 1, 2, BRICKS_SERVER.Func.L( "gangTerritoryPlaced" ) )
		ply:ConCommand( "bricks_server_saveentpositions" )
	else
		DarkRP.notify( ply, 1, 2, BRICKS_SERVER.Func.L( "gangInvalidTerritory" ) )
	end
end
 
function TOOL:RightClick( trace )
	if( !trace.HitPos ) then return false end
	if( !IsValid( trace.Entity ) or trace.Entity:IsPlayer() ) then return false end
	if( CLIENT ) then return true end

	local ply = self:GetOwner()
	
	if( not BRICKS_SERVER.Func.HasAdminAccess( ply ) ) then
		DarkRP.notify( ply, 1, 2, BRICKS_SERVER.Func.L( "noToolPermission" ) )
		return
	end
	
	if( trace.Entity:GetClass() == "bricks_server_territory" ) then
		trace.Entity:Remove()
		DarkRP.notify( ply, 1, 2, BRICKS_SERVER.Func.L( "gangTerritoryRemoved" ) )
		ply:ConCommand( "bricks_server_saveentpositions" )
	else
		DarkRP.notify( ply, 1, 2, BRICKS_SERVER.Func.L( "gangTerritoryRemoveFail" ) )
		return false
	end
end

function TOOL:DrawToolScreen( width, height )
	if( not BRICKS_SERVER.Func.HasAdminAccess( LocalPlayer() ) ) then return end

	surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
	surface.DrawRect( 0, 0, width, height )

	surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 0 ) )
	surface.DrawRect( 0, 0, width, 60 )
	
	draw.SimpleText( language.GetPhrase( "tool.bricks_server_territory_placer.name" ), "BRICKS_SERVER_Font33", width/2, 30, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

	if( not BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "territories" ) ) then return end

	local territorySelected = (BRICKS_SERVER.CONFIG.GANGS.Territories or {})[LocalPlayer():GetNW2Int( "bricks_server_tool_territorykey", 0 )]
	draw.SimpleText( BRICKS_SERVER.Func.L( "selected" ), "BRICKS_SERVER_Font33", width/2, 60+((height-60)/2)-15, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
	draw.SimpleText( ((territorySelected and (territorySelected.Name or BRICKS_SERVER.Func.L( "error" ))) or BRICKS_SERVER.Func.L( "none" )), "BRICKS_SERVER_Font25", width/2, 60+((height-60)/2)-15, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, 0 )
end

function TOOL.BuildCPanel( panel )
	panel:AddControl("Header", { Text = BRICKS_SERVER.Func.L( "gangTerritory" ), Description = BRICKS_SERVER.Func.L( "gangTerritoryDesc" ) })

	if( not BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "territories" ) ) then return end

	local combo = panel:AddControl( "ComboBox", { Label = BRICKS_SERVER.Func.L( "gangTerritory" ) } )
	for k, v in pairs( BRICKS_SERVER.CONFIG.GANGS.Territories or {} ) do
		combo:AddOption( v.Name, { k } )
	end
	function combo:OnSelect( index, text, data )
		net.Start( "BRS.Net.ToolTerritoryPlacer" )
			net.WriteUInt( data[1], 8 )
		net.SendToServer()
	end
end

if( CLIENT ) then
	language.Add( "tool.bricks_server_territory_placer.name", BRICKS_SERVER.Func.L( "gangTerritoryPlacer" ) )
	language.Add( "tool.bricks_server_territory_placer.desc", BRICKS_SERVER.Func.L( "gangTerritoryDescSmall" ) )
	language.Add( "tool.bricks_server_territory_placer.0", BRICKS_SERVER.Func.L( "gangTerritoryInstructions" ) )
elseif( SERVER and BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "territories" ) ) then
	util.AddNetworkString( "BRS.Net.ToolTerritoryPlacer" )
	net.Receive( "BRS.Net.ToolTerritoryPlacer", function( len, ply )
		if( not BRICKS_SERVER.Func.HasAdminAccess( ply ) ) then return end

		ply:SetNW2Int( "bricks_server_tool_territorykey", net.ReadUInt( 8 ) )
	end )
end
--PATH addons/m9k/lua/weapons/m9k_barret_m82/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_barret_m82/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_barret_m82") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "Barret M82"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 51			-- Position in the slot
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
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_50calm82.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_barret_m82.mdl"	-- Weapon world model
--oops
SWEP.Base 				= "bobs_scoped_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("BarretM82.Single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 200		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 10		-- Size of a clip
SWEP.Primary.DefaultClip			= 60	-- Bullets you start with
SWEP.Primary.KickUp				= 0.4				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.4			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.4		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "Rifle"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.ScopeZoom			= 9	
SWEP.Secondary.UseACOG			= false -- Choose one scope type
SWEP.Secondary.UseMilDot		= false	-- I mean it, only one	
SWEP.Secondary.UseSVD			= false	-- If you choose more than one, your scope will not show up at all
SWEP.Secondary.UseParabolic		= true	
SWEP.Secondary.UseElcan			= false
SWEP.Secondary.UseGreenDuplex	= false	
SWEP.Secondary.UseAimpoint		= false
SWEP.Secondary.UseMatador		= false

SWEP.data 				= {}
SWEP.data.ironsights		= 1
SWEP.ScopeScale 			= 0.7
SWEP.ReticleScale 			= 0.6

SWEP.Primary.NumShots	= 1		--how many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 100	--base damage per bullet
SWEP.Primary.Spread		= .001	--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- ironsight accuracy, should be the same for shotguns

-- enter iron sight info and bone mod info below

SWEP.IronSightsPos = Vector (2.894, 0, 1.7624)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (2.894, 0, 1.7624)
SWEP.SightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector (-2.3095, -3.0514, 2.3965)
SWEP.RunSightsAng = Vector (-19.8471, -33.9181, 10)

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
--PATH addons/m9k/lua/weapons/m9k_dragunov/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_dragunov/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_dragunov") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "SVD Dragunov"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 4				-- Slot in the weapon selection menu
SWEP.SlotPos				= 41			-- Position in the slot
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

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_dragunov02.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_svd_dragunov.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_scoped_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_svd01.Single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 400		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 10		-- Size of a clip
SWEP.Primary.DefaultClip			= 60	-- Bullets you start with
SWEP.Primary.KickUp				= .4				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= .4			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= .4		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "Rifle"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.ScopeZoom			= 9	
SWEP.Secondary.UseACOG			= false -- Choose one scope type
SWEP.Secondary.UseMilDot		= false	-- I mean it, only one	
SWEP.Secondary.UseSVD			= true	-- If you choose more than one, your scope will not show up at all
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
SWEP.Primary.Damage		= 62	--base damage per bullet
SWEP.Primary.Spread		= .001	--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- ironsight accuracy, should be the same for shotguns

-- enter iron sight info and bone mod info below

SWEP.IronSightsPos = Vector(-1.241, -1.476, 0)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(-1.241, -1.476, 0)
SWEP.SightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector(3.934, -5.41, 0)
SWEP.RunSightsAng = Vector(-11.476, 35, 0)

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
--PATH addons/m9k/lua/weapons/m9k_luger/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_luger/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_luger") -- must be the name of your swep but NO CAPITALS!
if (GetConVar(SWEP.Gun.."_allowed")) != nil then
	if not (GetConVar(SWEP.Gun.."_allowed"):GetBool()) then SWEP.Base = "bobs_blacklisted" SWEP.PrintName = SWEP.Gun return end
end
SWEP.Category				= "M9K Pistols"
SWEP.Author				= ""
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "P08 Luger"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 1				-- Slot in the weapon selection menu
SWEP.SlotPos				= 24		-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight				= 3				-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "pistol"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_p08_luger.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_luger_p08.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("weapon_luger.single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 825			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 16		-- Size of a clip
SWEP.Primary.DefaultClip		= 45		-- Bullets you start with
SWEP.Primary.KickUp				= 0.35		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.2		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "Pistol"				
-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a metal peircing shotgun slug

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 23	-- Base damage per bullet
SWEP.Primary.Spread		= .001	-- Define from-the-hip accuracy (1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(2.71, -2.122, 2.27)
SWEP.IronSightsAng = Vector(0.563, -0.013, 0)
SWEP.SightsPos = Vector(2.71, -2.122, 2.27)
SWEP.SightsAng = Vector(0.563, -0.013, 0)
SWEP.RunSightsPos = Vector(0, 0, 2.575)
SWEP.RunSightsAng = Vector(-14.657, 0, 0)

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
--PATH addons/m9k/lua/weapons/m9k_m416/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_m416/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_m416") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "HK 416"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 36			-- Position in the slot
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
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_hk416rif.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_hk_416.mdl"	-- Weapon world model
SWEP.ShowWorldModel			= true
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("hk416weapon.UnsilSingle")		-- Script that calls the primary fire sound
SWEP.Primary.SilencedSound 	= Sound("hk416weapon.SilencedSingle")
SWEP.Primary.RPM			= 800			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.4		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.4		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.6		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.CanBeSilenced		= true
SWEP.Primary.Ammo			= "Rifle"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 30	-- Base damage per bullet
SWEP.Primary.Spread		= .025	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .015 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(-2.892, -2.132, 0.5)
SWEP.IronSightsAng = Vector(-0.033, 0.07, 0)
SWEP.SightsPos = Vector(-2.892, -2.132, 0.5)
SWEP.SightsAng = Vector(-0.033, 0.07, 0)
SWEP.RunSightsPos = Vector(2.125, -0.866, 1.496)
SWEP.RunSightsAng = Vector(-18.08, 30.59, 0)

SWEP.SelectiveFire		= true

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
--PATH addons/m9k/lua/weapons/m9k_model3russian/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_model3russian/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_model3russian") -- must be the name of your swep but NO CAPITALS!
if (GetConVar(SWEP.Gun.."_allowed")) != nil then
	if not (GetConVar(SWEP.Gun.."_allowed"):GetBool()) then SWEP.Base = "bobs_blacklisted" SWEP.PrintName = SWEP.Gun return end
end
SWEP.Category				= "M9K Pistols"
SWEP.Author				= ""
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "S & W Model 3 Russian"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 1				-- Slot in the weapon selection menu
SWEP.SlotPos				= 27			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight				= 3			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "revolver"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 60
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_pist_model3.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_model_3_rus.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Model3.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 115			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 6		-- Size of a clip
SWEP.Primary.DefaultClip		= 30		-- Bullets you start with
SWEP.Primary.KickUp				= 1		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.5		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.5		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "357"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 65		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 30	-- Base damage per bullet
SWEP.Primary.Spread		= .02	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .01 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(4.06, 0, 0.876)
SWEP.IronSightsAng = Vector(-0.207, 0, 0)
SWEP.SightsPos = Vector(4.06, 0, 0.876)
SWEP.SightsAng = Vector(-0.207, 0, 0)
SWEP.RunSightsPos = Vector(-0.165, -10.329, -5.41)
SWEP.RunSightsAng = Vector(70, 0, 0)

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
--PATH addons/m9k/lua/weapons/m9k_uzi/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_uzi/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_uzi") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "UZI"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 57			-- Position in the slot
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
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_imi_uzi01.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_uzi_imi.mdl"	-- Weapon world model 
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Weapon_uzi.single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 600			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 32		-- Size of a clip
SWEP.Primary.DefaultClip		= 64		-- Bullets you start with
SWEP.Primary.KickUp				= 0.3		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "smg1"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.SelectiveFire		= true

SWEP.Secondary.IronFOV			= 65		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 20	-- Base damage per bullet
SWEP.Primary.Spread		= .028	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .018 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(-2.951, -2.629, 1.633)
SWEP.IronSightsAng = Vector(0.109, -0.772, 1.725)
SWEP.SightsPos = Vector(-2.951, -2.629, 1.633)
SWEP.SightsAng = Vector(0.109, -0.772, 1.725)
SWEP.RunSightsPos = Vector(3.858, -2.945, 0.057)
SWEP.RunSightsAng = Vector(-5.237, 40.471, 0)

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
--PATH addons/weaponandcontent/lua/weapons/mac10/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = true
	SWEP.PrintName = "MAC-10"
	SWEP.CSMuzzleFlashes = true

	SWEP.AimPos = Vector(2.49, 0, 1.442)
	SWEP.AimAng = Vector(0.731, 0, 0)
	
	SWEP.SprintPos = Vector(-3.386, -3.386, 2.282)
	SWEP.SprintAng = Vector(-19.017, -47.126, 0)
	
	SWEP.ZoomAmount = 15
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.IconLetter = "l"
	--killicon.AddFont("swb_mp5", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_rifle_small"
end
SWEP.CanPenetrate = false
SWEP.FadeCrosshairOnAim = false

SWEP.PlayBackRate = 30
SWEP.PlayBackRateSV = 12
SWEP.SpeedDec = 15
SWEP.BulletDiameter = 9
SWEP.CaseLength = 19

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.AmmoEnt = "item_ammo_smg1_ttt"

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "Pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"auto"}
SWEP.Base = "swb_base"
SWEP.Category = "Weapons"

SWEP.Author			= "Base swb"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= true
SWEP.ViewModel				= "models/weapons/2_smg_mac10.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_smg_mac10.mdl"	-- Weapon world model

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 32
SWEP.Primary.DefaultClip	= 32
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"
SWEP.Chamberable = false

SWEP.FireDelay = 0.09
SWEP.FireSound = Sound("Alt_Weapon_MAC10.1")	
SWEP.Recoil = 0.45

SWEP.HipSpread = 0.037
SWEP.AimSpread = 0.015
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0
SWEP.SpreadPerShot = 0
SWEP.SpreadCooldown = 0
SWEP.Shots = 1
SWEP.Damage = 19
SWEP.DeployTime = 1
SWEP.BurstCooldownMul = 3.5
--PATH addons/cp_ballistic_shields/lua/weapons/riot_shield/shared.lua:
if SERVER then 
	include( "ballistic_shields/sh_bs_util.lua" ) 
	include( "ballistic_shields/sv_bs_util.lua" ) 
end
include( "bs_config.lua" ) 
include( "ballistic_shields/sh_bs_lang.lua" ) 

SWEP.PrintName = "Щит"
SWEP.Author	= "D3G"
SWEP.Instructions = "LMB - Attack | RMB - Toggle visibility"
SWEP.Spawnable = true
SWEP.AdminOnly = true

SWEP.ViewModel = ""
SWEP.WorldModel = "models/bshields/rshield.mdl"

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

local ShieldIcon = Material("bshields/ui/riot_shield", "smooth")
local BackgroundIcon = Material("bshields/ui/background")
function SWEP:DrawHUD()
	if(bshields.config.disablehud) then return end
	surface.SetDrawColor(255,255,255,200)	
	surface.SetMaterial(BackgroundIcon)
	surface.DrawTexturedRect( ScrW()/2-ScrH()/10, ScrH()/2-ScrH()/30+ScrH()/3, ScrH()/5, ScrH()/15)
	surface.SetDrawColor(255,255,255,125)
	draw.SimpleTextOutlined( bshields.lang[bshields.config.language].rshieldprim, "bshields.HudFont", ScrW()/2-ScrH()/32, ScrH()/2-ScrH()/28+ScrH()/3+ScrH()/22, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color(20,20,20,255)) 
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
		owner.bs_shield = ents.Create("bs_rshield")
		owner.bs_shield:SetCollisionGroup( COLLISION_GROUP_DEBRIS  )
		owner.bs_shield:SetMoveType( MOVETYPE_NONE ) 
		owner.bs_shield:SetPos(owner:GetPos())
		owner.bs_shield:SetParent( owner, owner:LookupAttachment(holdtype[2])) 
		owner.bs_shield:SetLocalAngles( bshields.shields[holdtype[1]][3].angles ) 
		owner.bs_shield:SetLocalPos( bshields.shields[holdtype[1]][3].position ) 
	    owner.bs_shield:Spawn()
	   	net.Start( "bs_shield_info" )
	   		net.WriteUInt( owner.bs_shield:EntIndex(), 16 ) 
		net.Send( owner )
	end
end

function SWEP:PrimaryAttack()
	local owner = self.Owner
	if(owner:LookupAttachment( "anim_attachment_RH" )>0) then owner:SetAnimation( PLAYER_ATTACK1 ) end
	owner:LagCompensation( true )
	local shield
	if SERVER then shield = owner.bs_shield else shield = Entity(LocalPlayer().bs_shieldIndex) end

	self:EmitSound( SwingSound )

	if SERVER then
		if(owner:LookupAttachment( "anim_attachment_RH" )>0) then
			owner.bs_shield:SetLocalAngles( Angle(6,-34,-12) ) 
			owner.bs_shield:SetLocalPos( Vector(4,8,-1) ) 
			timer.Simple(0.4,function()
				owner.bs_shield:SetLocalAngles( bshields.shields[1][3].angles ) 
				owner.bs_shield:SetLocalPos( bshields.shields[1][3].position ) 
			end)
		end
	end

	local tr = util.TraceLine( {
		start = owner:GetShootPos(),
		endpos = owner:GetShootPos() + owner:GetAimVector() * self.HitDistance,
		mask = MASK_SHOT_HULL,
		filter = {owner, shield}
	} )

	if ( !IsValid( tr.Entity ) ) then
		tr = util.TraceHull( {
			start = owner:GetShootPos(),
			endpos = owner:GetShootPos() + owner:GetAimVector() * self.HitDistance,
			mins = Vector( -10, -10, -8 ),
			maxs = Vector( 10, 10, 8 ),
			mask = MASK_SHOT_HULL,
			filter = {owner, shield}
		} )
	end

	if ( tr.Hit && !( game.SinglePlayer() && CLIENT ) ) then
		self:EmitSound( HitSound )
	end

	local hit = false

	if ( SERVER && IsValid( tr.Entity ) && ( tr.Entity:IsNPC() || tr.Entity:IsPlayer() || tr.Entity:Health() > 0 ) ) then
		local dmginfo = DamageInfo()

		local attacker = owner
		if ( !IsValid( attacker ) ) then attacker = self end
		dmginfo:SetAttacker( attacker )

		dmginfo:SetInflictor( self )
		dmginfo:SetDamage( math.random( bshields.config.rshielddmgmin, bshields.config.rshielddmgmax ) )

		tr.Entity:TakeDamageInfo( dmginfo )
		hit = true

	end

	if ( SERVER && IsValid( tr.Entity ) ) then
		local phys = tr.Entity:GetPhysicsObject()
		if ( IsValid( phys ) ) then
			phys:ApplyForceOffset( owner:GetAimVector() * 80 * phys:GetMass(), tr.HitPos )
		end
	end

	owner:LagCompensation( false )
	self:SetNextPrimaryFire( CurTime() + 0.7 )
end

function SWEP:SecondaryAttack()
	if CLIENT then
		if(!self.CanVisToggle) then return end
		if(!IsValid(Entity(LocalPlayer().bs_shieldIndex))) then return end
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

--PATH addons/111mod/lua/weapons/ultimate_disguise_kit/shared.lua:
AddCSLuaFile()

SWEP.PrintName = "Маскировка"
SWEP.Slot = 1
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true

SWEP.Base = "weapon_base"

SWEP.Author = "zaluparp"
SWEP.Instructions = ""
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.IconLetter = ""

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix	 = "rpg"
SWEP.WorldModel	= ""

SWEP.Spawnable = true
SWEP.AdminOnly = true

SWEP.ViewModel			= "models/weapons/v_c4.mdl"
SWEP.WorldModel			= "models/weapons/w_c4.mdl"

SWEP.Category = "GambitRP"
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""
SWEP.IdleStance = "slam"

function SWEP:Initialize()
	self:SetHoldType(self.IdleStance)
end

function SWEP:Deploy()
	return true
end

function SWEP:Holster()
	if not SERVER then return true end
	
	self.Owner:DrawViewModel(true)
	self.Owner:DrawWorldModel(true)

	return true
end

function SWEP:PrimaryAttack()
	self.Weapon:SetNextPrimaryFire(0.6)
	if (!SERVER) then return end
	local ply = self.Owner
	ply.LastDisguise = ply.LastDisguise or (CurTime() - DISGUISE_KIT_COOLDOWN)
	net.Start("DisguiseKitOpen")
		net.WriteTable({disguises = util.JSONToTable(file.Read("disguise_teams.txt")), timeleft = math.floor((CurTime() - ply.LastDisguise)),})
	net.Send(ply)
	ply.candisguise = true
	self:Remove()
end

function SWEP:SecondaryAttack()
	return true
end

function SWEP:ShouldDropOnDie()
	return false
end -- dwhjkdnaw

function SWEP:DrawHUD()
    local Width, Height = 256, 18
    draw.DrawText( "Нажмите ЛКМ чтобы замаскироватся", "Trebuchet24", ScrW() / 2, ScrH() - 52, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
    draw.DrawText( "Учтите что нажав ЛКМ - у вас пропадёт SWEP из выбора", "Trebuchet24", ScrW() / 2, ScrH() - 33, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
end

--PATH addons/darkrpadvancedkeys/lua/weapons/weapon_adv_keys/shared.lua:
-- if SERVER then
	-- resource.AddSingleFile('materials/doors/door.png')
-- end

--[[ MODEL INFO
Recommended FOV: 65 +-5

Hold type:  slam

Sequences/ACTS(30 fps):

idle		ACT_VM_IDLE
lock		ACT_VM_PRIMARYATTACK
unlock		ACT_VM_SECONDARYATTACK
lock_alt	ACT_VM_PICKUP
unlock_alt	ACT_VM_RELEASE
draw		ACT_VM_DRAW
press_1		ACT_VM_HITCENTER
press_2		ACT_VM_HITCENTER2
76561197989440650
--]]

if SERVER then
	AddCSLuaFile( "shared.lua" )
	AddCSLuaFile( "cl_menu.lua" )
	util.AddNetworkString("anim_keys")
    util.AddNetworkString("KeysMenu")
end

if CLIENT then
	include( "cl_menu.lua" )
	SWEP.PrintName = "Ключи"
	SWEP.Slot = 1
    SWEP.SlotPos = 1
    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = false
end

SWEP.PrintName = "Ключи"
SWEP.Author = "Crap-Head"
SWEP.Instructions = "Left click to lock\nRight click to unlock\nReload for door settings or animation menu"
SWEP.Base = "weapon_base"

SWEP.UseHands = true
SWEP.ViewModelFOV = 65
SWEP.ViewModelFlip = false

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.Category = "Crap-Head Scripts"

SWEP.ViewModel = "models/craphead_scripts/adv_keys/weapons/c_key.mdl"
SWEP.WorldModel = "models/craphead_scripts/adv_keys/weapons/w_key.mdl"

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

function SWEP:Initialize()
    self:SetHoldType( "slam" )
end

function SWEP:Deploy()
    self:SetHoldType( "slam" )
	self:SendWeaponAnim( ACT_VM_DRAW )
	--self.Owner:ConCommand( "play craphead_scripts/adv_keys/pull_out.mp3" )
	-- 76561197989440650
end

local function lookingAtLockable(ply, ent, hitpos)
    local eyepos = ply:EyePos()
    return IsValid(ent)             and
        ent:isKeysOwnable()         and
        (
            ent:isDoor()    and eyepos:DistToSqr(hitpos) < CH_ADVKeys.Config.DistanceToDoor
            or
            ent:IsVehicle() and eyepos:DistToSqr(hitpos) < CH_ADVKeys.Config.DistanceToVehicle
        )

end

local function ADVWEP_LockUnlockAnim( ply )
    local RP = RecipientFilter()
    RP:AddAllPlayers()

    net.Start("anim_keys")
        net.WriteEntity(ply)
        net.WriteString("usekeys")
    net.Send(ply)

    ply:AnimRestartGesture( GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_GMOD_GESTURE_ITEM_PLACE, true )
end

local function ADVWEP_DoKnock( ply )
    ply:EmitSound( table.Random( CH_ADVKeys.Config.DoorKnockSounds ), 100, math.random( 90, 110 ) )
	
    net.Start("anim_keys")
        net.WriteEntity(ply)
        net.WriteString("knocking")
    net.Send(ply)
	
    ply:AnimRestartGesture( GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_HL2MP_GESTURE_RANGE_ATTACK_FIST, true )
end

function SWEP:PrimaryAttack()
    local trace = self:GetOwner():GetEyeTrace()

    if not lookingAtLockable( self:GetOwner(), trace.Entity, trace.HitPos ) then 
		return 
	end
	
	if self:GetOwner().CantUse then
		return
	end
	
    if CLIENT then return end
	
	self:SetNextPrimaryFire( CurTime() + CH_ADVKeys.Config.KnockDoorDelay )
	self:SetNextSecondaryFire( CurTime() + CH_ADVKeys.Config.KnockDoorDelay )
	
    if self:GetOwner():canKeysLock( trace.Entity ) then
		self:GetOwner().CantUse = true
		timer.Simple( CH_ADVKeys.Config.LockUnlockDelay, function()
			if IsValid( self ) then
				self:GetOwner().CantUse = false
			end
		end )
	
		if trace.Entity:IsVehicle() then
			timer.Simple( 0.4, function()
				if IsValid( self ) then
					self:SetHoldType( "pistol" )
					self:GetOwner():EmitSound( CH_ADVKeys.Config.CarBipSound )
					trace.Entity:keysLock()
					
					if trace.Entity.VC_setHazardLights then -- VCMod Check
						trace.Entity:VC_setHazardLights( true )
					end
					
					--trace.Entity:SetNWBool( "ADVKEYS_IsLocked", true )
					
					if CH_ADVKeys.Config.LockUnlockNotify then
						DarkRP.notify( self:GetOwner(), 1, 3, "Вы заперли дверь на своем автомобиле" )
					end
					
					-- Stop alarm
					if trace.Entity.AlarmOn then
						timer.Remove( "ALARM_HazardLightsFlash" )
						trace.Entity.AlarmOn = false
						trace.Entity.AlarmSound:Stop() -- stops the sound
					end
				end
			end)
			timer.Simple( 0.8, function()
				if IsValid( self ) then
					self:SetHoldType( "slam" )
					
					if trace.Entity.VC_setHazardLights then -- VCMod Check
						trace.Entity:VC_setHazardLights( false )
					end
				end
			end)
			
			self:SendWeaponAnim( ACT_VM_HITCENTER )
		else
			self:EmitSound("npc/metropolice/gear" .. math.floor( math.Rand( 1, 7 ) ) .. ".wav")
			timer.Simple( 1.1, function()
				if IsValid( self ) then
					if not lookingAtLockable( self:GetOwner(), trace.Entity, trace.HitPos ) then 
						return 
					end
	
					self:EmitSound( CH_ADVKeys.Config.LockDoorSound )
					trace.Entity:keysLock()
					ADVWEP_LockUnlockAnim( self:GetOwner() )
					--trace.Entity:SetNWBool( "ADVKEYS_IsLocked", true )
					
					if CH_ADVKeys.Config.LockUnlockNotify then
						DarkRP.notify( self:GetOwner(), 1, 3, "Вы заперли дверь" )
					end
				end
			end)
				
			if CH_ADVKeys.Config.UsePrimaryAnims then
				self:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
			else
				self:SendWeaponAnim( ACT_VM_PICKUP )
			end
		end
		
		timer.Simple( ( CH_ADVKeys.Config.LockUnlockDelay - 0.15 ), function()
			if IsValid( self ) then
				self:SendWeaponAnim( ACT_VM_IDLE )
			end
		end)
    elseif trace.Entity:IsVehicle() then
        DarkRP.notify( self:GetOwner(), 1, 3, "You do not own this vehicle!" )
    else
        ADVWEP_DoKnock( self:GetOwner() )
    end
end

function SWEP:SecondaryAttack()
    local trace = self:GetOwner():GetEyeTrace()

	if not lookingAtLockable( self:GetOwner(), trace.Entity, trace.HitPos ) then 
		return 
	end
	
	if self:GetOwner().CantUse then
		return
	end
	
    if CLIENT then return end
	
	self:SetNextPrimaryFire( CurTime() + CH_ADVKeys.Config.KnockDoorDelay )
	self:SetNextSecondaryFire( CurTime() + CH_ADVKeys.Config.KnockDoorDelay )
	
    if self:GetOwner():canKeysLock( trace.Entity ) then
		self:GetOwner().CantUse = true
		timer.Simple( CH_ADVKeys.Config.LockUnlockDelay, function()
			if IsValid( self ) then
				self:GetOwner().CantUse = false
			end
		end )
	
		if trace.Entity:IsVehicle() then
			timer.Simple( 0.4, function()
				if IsValid( self ) then
					self:SetHoldType( "pistol" )
					self:GetOwner():EmitSound( CH_ADVKeys.Config.CarBipSound )
					trace.Entity:keysUnLock()
					
					if trace.Entity.VC_setHazardLights then -- VCMod Check
						trace.Entity:VC_setHazardLights( true )
					end
					
					--trace.Entity:SetNWBool( "ADVKEYS_IsLocked", false )
					
					if CH_ADVKeys.Config.LockUnlockNotify then
						DarkRP.notify( self:GetOwner(), 1, 3, "Вы открыли дверь в своем автомобиле" )
					end
					
					-- Stop alarm
					if trace.Entity.AlarmOn then
						timer.Remove( "ALARM_HazardLightsFlash" )
						trace.Entity.AlarmOn = false
						trace.Entity.AlarmSound:Stop() -- stops the sound
					end
				end
			end)
			timer.Simple( 0.8, function()
				if IsValid( self ) then
					self:SetHoldType( "slam" )
					
					if trace.Entity.VC_setHazardLights then -- VCMod Check
						trace.Entity:VC_setHazardLights( false )
					end
				end
			end)
			
			self:SendWeaponAnim( ACT_VM_HITCENTER2 )
		else
			self:EmitSound("npc/metropolice/gear" .. math.floor( math.Rand( 1, 7 ) ) .. ".wav")
			timer.Simple( 1.1, function()
				if IsValid( self ) then
					self:EmitSound( CH_ADVKeys.Config.UnlockDoorSound )
					trace.Entity:keysUnLock()
					ADVWEP_LockUnlockAnim( self:GetOwner() )
					--trace.Entity:SetNWBool( "ADVKEYS_IsLocked", false )
					
					if CH_ADVKeys.Config.LockUnlockNotify then
						DarkRP.notify( self:GetOwner(), 1, 3, "Вы открыли дверь" )
					end
				end
			end )
			
			if CH_ADVKeys.Config.UsePrimaryAnims then
				self:SendWeaponAnim( ACT_VM_SECONDARYATTACK )
			else
				self:SendWeaponAnim( ACT_VM_RELEASE )
			end
		end
		
		timer.Simple( ( CH_ADVKeys.Config.LockUnlockDelay - 0.15 ), function()
			if IsValid( self ) then
				self:SendWeaponAnim( ACT_VM_IDLE )
			end
		end )
    elseif trace.Entity:IsVehicle() then
        DarkRP.notify( self:GetOwner(), 1, 3, "Вы не являетесь владельцем!" )
    else
        ADVWEP_DoKnock( self:GetOwner(), "physics/wood/wood_crate_impact_hard3.wav" )
    end
end

-- Default DarkRP code
function SWEP:Reload()
    local trace = self:GetOwner():GetEyeTrace()
	
    if not IsValid(trace.Entity) or (IsValid(trace.Entity) and ((not trace.Entity:isDoor() and not trace.Entity:IsVehicle()) or self.Owner:EyePos():DistToSqr(trace.HitPos) > 40000)) then
        if CLIENT and not DarkRP.disabledDefaults["modules"]["animations"] then 
			RunConsoleCommand("_DarkRP_AnimationMenu")
			RunConsoleCommand("_DarkRP_Flex")
			RunConsoleCommand("_DarkRP_Gsit")
		end
        return
    end
	
    if SERVER then
		net.Start("KeysMenu")
        net.Send(self:GetOwner())
    end
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
--PATH addons/cigarette_swep/lua/weapons/weapon_ciga_pachka_cheap.lua:
-- MODEL WITH UNKNOWN AUTHOR! PM ME!!! QUICK :D -- 
SWEP.PrintName = "Pack Belomorkanal"
SWEP.Author = "Mordestein"
SWEP.Purpose = "Pick one out."

SWEP.Category = "Cigarette"
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo		= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo		= "none"

SWEP.HoldType = "slam"
SWEP.ViewModelFOV = 49.849246231156
SWEP.ViewModelFlip = false
SWEP.UseHands = false
SWEP.ViewModel = "models/weapons/c_grenade.mdl"
SWEP.WorldModel = "models/mordeciga/mordes/pachkacig.mdl"
SWEP.UseHands = true
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
	
SWEP.ViewModelBoneMods = {
	["ValveBiped.Grenade_body"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}
SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/mordeciga/mordes/pachkacig.mdl", bone = "ValveBiped.Grenade_body", rel = "", pos = Vector(0, 0, -2.597), angle = Angle(-15.195, 180, 180), size = Vector(1.34, 1.7, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/mordeciga/mordes/pachkacig.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.635, 3.635, -0.519), angle = Angle(-26.883, 178.83, 180), size = Vector(1.728, 1.7, 1.7), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.IronSightsPos = Vector(0, 0, 0)
SWEP.IronSightsAng = Vector(0, 0, 0)

local ShootSound = Sound("physics/cardboard/cardboard_box_impact_soft7.wav")

function SWEP:PrimaryAttack()
if ( !SERVER ) then return end
self:SetNextPrimaryFire( CurTime() + 1.50 )
self:EmitSound( ShootSound )
timer.Simple( 0.3, function() 
self:EmitSound("weapons/smg1/switch_single.wav")
 end )
self.Owner:Give( "weapon_ciga_cheap" )
 timer.Simple( 0.4, function() 
  
self.Owner:StripWeapon("weapon_ciga_pachka_cheap")

end )
 end
 
function SWEP:Deploy()
self:SetNextPrimaryFire( CurTime() + 1 )
self:SetNextSecondaryFire( CurTime() + 1 ) 
self:SendWeaponAnim(ACT_VM_DRAW)
return true
end	


-- 

function SWEP:SecondaryAttack()
  return false 
end 

function SWEP:Reload()
return false   
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





--PATH gamemodes/darkrp/entities/weapons/weapon_cs_base2/shared.lua:
AddCSLuaFile()

if SERVER then
    include("sv_commands.lua")
    include("sh_commands.lua")
    SWEP.Weight = 5
    SWEP.AutoSwitchTo = false
    SWEP.AutoSwitchFrom = false
end

if CLIENT then
    SWEP.DrawAmmo           = true
    SWEP.DrawCrosshair      = false
    SWEP.ViewModelFOV       = 82
    SWEP.ViewModelFlip      = false
    SWEP.CSMuzzleFlashes    = true

    -- This is the font that's used to draw the death icons
    surface.CreateFont("CSKillIcons", {
        size = ScreenScale(30),
        weight = 500,
        antialias = true,
        shadow = true,
        font = "csd"
    })
    surface.CreateFont("CSSelectIcons", {
        size = ScreenScale(60),
        weight = 500,
        antialias = true,
        shadow = true,
        font = "csd"
    })
end

SWEP.Base = "weapon_base"

SWEP.Author = "DarkRP Developers"
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.Instructions = ""

SWEP.Spawnable = false
SWEP.AdminOnly = false
SWEP.UseHands = true

SWEP.HoldType = "normal"

SWEP.Primary.Sound = Sound("Weapon_AK47.Single")
SWEP.Primary.Recoil = 1.5
SWEP.Primary.Damage = 40
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.02
SWEP.Primary.Delay = 0.15

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.MultiMode = false

SWEP.DarkRPBased = true

function SWEP:Initialize()
    if CLIENT and IsValid(self:GetOwner()) then
        local vm = self:GetOwner():GetViewModel()
        self:ResetDarkRPBones(vm)
    end

    self:SetHoldType("normal")
    if SERVER then
        self:SetNPCMinBurst(30)
        self:SetNPCMaxBurst(30)
        self:SetNPCFireRate(0.01)
    end

    self.dt.Ironsights = false
    self.dt.TotalUsedMagCount = 0
    self.dt.FireMode = self.Primary.Automatic and "auto" or "semi"
end

function SWEP:SetupDataTables()
    self:NetworkVar("Bool", 0, "Ironsights")
    self:NetworkVar("Bool", 1, "Reloading")
    self:NetworkVar("Float", 0, "LastPrimaryAttack")
    self:NetworkVar("Float", 1, "ReloadEndTime")
    self:NetworkVar("Float", 2, "BurstTime")
    self:NetworkVar("Float", 3, "LastNonBurst")
    self:NetworkVar("Int", 0, "BurstBulletNum")
    self:NetworkVar("Int", 1, "TotalUsedMagCount")
    self:NetworkVar("String", 0, "FireMode")
    self:NetworkVar("Entity", 0, "LastOwner")
    self:NetworkVarNotify("Ironsights", fc{self.IronsightsChanged, fp{fn.Id, self}, fp{select, 4}})
end

function SWEP:Deploy()
    self:SetHoldType("normal")

    self:IronsightsChanged(self:GetIronsights())

    return true
end

function SWEP:OwnerChanged()
    if IsValid(self:GetOwner()) then self:SetLastOwner(self:GetOwner()) end
end

function SWEP:Holster()
    self.dt.Ironsights = false
    if CLIENT then self.hasShot = false end

    if not IsValid(self:GetOwner()) then return true end
    if CLIENT then
        local vm = self:GetOwner():GetViewModel()
        self:ResetDarkRPBones(vm)
    end

    return true
end

function SWEP:OnRemove()
    self.dt.Ironsights = false

    if CLIENT and IsValid(self:GetOwner()) then
        local vm = self:GetOwner():GetViewModel()
        self:ResetDarkRPBones(vm)
    end
end

--[[---------------------------------------------------------
Reload does nothing
---------------------------------------------------------]]
function SWEP:Reload()
    if not self:DefaultReload(ACT_VM_RELOAD) then return end
    self:SetReloading(true)
    self:SetIronsights(false)
    self:SetHoldType(self.HoldType)
    self:GetOwner():SetAnimation(PLAYER_RELOAD)
    self:SetReloadEndTime(CurTime() + 2)
    self:SetTotalUsedMagCount(self:GetTotalUsedMagCount() + 1)
end

function SWEP:PrimaryAttack()
    self.Primary.Automatic = self:GetFireMode() == "auto"

    if self:GetBurstBulletNum() == 0 and (self:GetLastNonBurst() or 0) > CurTime() - 0.6 then return end

    if self.MultiMode and self:GetOwner():KeyDown(IN_USE) then
        if self:GetFireMode() == "semi" then
            self:SetFireMode("burst")
            self.Primary.Automatic = false
            self:GetOwner():PrintMessage(HUD_PRINTCENTER, DarkRP.getPhrase("switched_burst"))
        elseif self:GetFireMode() == "burst" then
            self:SetFireMode("auto")
            self.Primary.Automatic = true
            self:GetOwner():PrintMessage(HUD_PRINTCENTER, DarkRP.getPhrase("switched_fully_auto"))
        elseif self:GetFireMode() == "auto" then
            self:SetFireMode("semi")
            self.Primary.Automatic = false
            self:GetOwner():PrintMessage(HUD_PRINTCENTER, DarkRP.getPhrase("switched_semi_auto"))
        end
        self:SetNextPrimaryFire(CurTime() + 0.5)
        self:SetNextSecondaryFire(CurTime() + 0.5)
        return
    end

    if self:GetHoldType() == "normal" and not GAMEMODE.Config.ironshoot then
        self:SetHoldType(self.HoldType)
    end

    if self:GetFireMode() ~= "burst" then
        self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
    end

    self:SetNextSecondaryFire(CurTime() + self.Primary.Delay)

    if self:Clip1() <= 0 then
        self:EmitSound("weapons/clipempty_rifle.wav")
        self:SetNextPrimaryFire(CurTime() + 2)
        return
    end

    if not self:CanPrimaryAttack() then self:SetIronsights(false) return end
    if not self:GetIronsights() and GAMEMODE.Config.ironshoot then return end
    -- Play shoot sound
    self:EmitSound(self.Primary.Sound)

    -- Shoot the bullet
    self:CSShootBullet(self.Primary.Damage, self.Primary.Recoil + 3, self.Primary.NumShots, self.Primary.Cone + .05)

    if self:GetFireMode() == "burst" then
        self:SetBurstBulletNum(self:GetBurstBulletNum() + 1)
        if self:GetBurstBulletNum() == 1 then
            self:SetLastNonBurst(CurTime())
        end
        if self:GetBurstBulletNum() == 3 then
            self:SetBurstTime(0)
            self:SetBurstBulletNum(0)
        else
            self:SetBurstTime(CurTime() + 0.1)
        end
    end

    -- Remove 1 bullet from our clip
    self:TakePrimaryAmmo(1)

    self:SetLastPrimaryAttack(CurTime())

    if self:GetOwner():IsNPC() then return end

    -- Punch the player's view
    self:GetOwner():ViewPunch(Angle(util.SharedRandom("DarkRP_CSBase" .. self:EntIndex() .. "Mag" .. self:GetTotalUsedMagCount() .. "p" .. self:Clip1(), -1.2, -1.1) * self.Primary.Recoil, util.SharedRandom("DarkRP_CSBase" .. self:EntIndex() .. "Mag" .. self:GetTotalUsedMagCount() .. "y" .. self:Clip1(), -1.1, 1.1) * self.Primary.Recoil, 0))
end

function SWEP:CSShootBullet(dmg, recoil, numbul, cone)
    if not IsValid(self:GetOwner()) then return end
    numbul = numbul or 1
    cone = cone or 0.01

    local bullet = {}
    bullet.Num = numbul or 1
    bullet.Src = self:GetOwner():GetShootPos()  -- Source
    bullet.Dir = (self:GetOwner():GetAimVector():Angle() + self:GetOwner():GetViewPunchAngles()):Forward() -- Dir of bullet
    bullet.Spread = Vector(cone, cone, 0)       -- Aim Cone
    bullet.Tracer = 4                           -- Show a tracer on every x bullets
    bullet.Force = 5                            -- Amount of force to give to phys objects
    bullet.Damage = dmg

    self:GetOwner():FireBullets(bullet)
    self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)      -- View model animation
    self:GetOwner():MuzzleFlash()        -- Crappy muzzle light
    self:GetOwner():SetAnimation(PLAYER_ATTACK1)       -- 3rd Person Animation

    if self:GetOwner():IsNPC() then return end

    -- Part of workaround, different viewmodel position if shots have been fired
    if CLIENT then self.hasShot = true end
end

function SWEP:DrawWeaponSelection(x, y, wide, tall, alpha)
    if self.IconLetter and string.find(self.IconLetter, "^[0-9a-wA-Z]$") then
        draw.DrawNonParsedSimpleText(self.IconLetter, "CSSelectIcons", x + wide / 2, y + tall * 0.2, Color(255, 210, 0, 255), TEXT_ALIGN_CENTER)

        -- try to fool them into thinking they're playing a Tony Hawks game
        draw.DrawNonParsedSimpleText(self.IconLetter, "CSSelectIcons", x + wide / 2 + math.Rand(-4, 4), y + tall * 0.2 + math.Rand(-14, 14), Color(255, 210, 0, math.Rand(10, 120)), TEXT_ALIGN_CENTER)
        draw.DrawNonParsedSimpleText(self.IconLetter, "CSSelectIcons", x + wide / 2 + math.Rand(-4, 4), y + tall * 0.2 + math.Rand(-9, 9), Color(255, 210, 0, math.Rand(10, 120)), TEXT_ALIGN_CENTER)
    else
        -- Set us up the texture
        surface.SetDrawColor(255, 255, 255, alpha)
        surface.SetTexture(self.WepSelectIcon)

        -- Lets get a sin wave to make it bounce
        local fsin = 0

        if self.BounceWeaponIcon then
            fsin = math.sin(CurTime() * 10) * 5
        end

        -- Borders
        y = y + 10
        x = x + 10
        wide = wide - 20

        -- Draw that motherfucker
        surface.DrawTexturedRect(x + fsin, y - fsin, wide - fsin * 2, (wide / 2) + fsin)

        -- Draw weapon info box
        self:PrintWeaponInfo(x + wide + 20, y + tall * 0.95, alpha)
    end
end

local IRONSIGHT_TIME = 0.25

function SWEP:GetViewModelPosition(pos, ang)
    if not self.IronSightsPos then return pos, ang end

    local bIron = self:GetIronsights()

    if bIron ~= self.bLastIron then
        self.bLastIron = bIron
        self.fIronTime = CurTime()

        if bIron then
            self.SwayScale  = 0.3
            self.BobScale   = 0.1
        else
            self.SwayScale  = 1.0
            self.BobScale   = 1.0
        end
    end

    local fIronTime = self.fIronTime or 0

    pos = pos + ang:Forward() * -5
    if GAMEMODE.Config.ironshoot then
        ang:RotateAroundAxis(ang:Right(), -15)
    end

    if not bIron and fIronTime < CurTime() - IRONSIGHT_TIME then
        return pos, ang
    end

    local Mul = 1.0

    if fIronTime > CurTime() - IRONSIGHT_TIME then
        Mul = math.Clamp((CurTime() - fIronTime) / IRONSIGHT_TIME, 0, 1)

        if not bIron then Mul = 1 - Mul end
    end

    local Offset    = self.IronSightsPos

    if self.IronSightsAng then
        ang = ang * 1
        ang:RotateAroundAxis(ang:Right(),   self.IronSightsAng.x * Mul)
        ang:RotateAroundAxis(ang:Up(),      self.IronSightsAng.y * Mul)
        ang:RotateAroundAxis(ang:Forward(), self.IronSightsAng.z * Mul)
    end

    if GAMEMODE.Config.ironshoot then
        ang:RotateAroundAxis(ang:Right(), Mul * 15)
    else
        ang:RotateAroundAxis(ang:Right(), Mul)
    end

    local Right     = ang:Right()
    local Up        = ang:Up()
    local Forward   = ang:Forward()

    pos = pos + Offset.x * Right * Mul
    pos = pos + Offset.y * Forward * Mul
    pos = pos + Offset.z * Up * Mul

    if not self.hasShot then
        if self.IronSightsAngAfterShootingAdjustment then
            ang:RotateAroundAxis(ang:Right(),   self.IronSightsAngAfterShootingAdjustment.x * Mul)
            ang:RotateAroundAxis(ang:Up(),      self.IronSightsAngAfterShootingAdjustment.y * Mul)
            ang:RotateAroundAxis(ang:Forward(), self.IronSightsAngAfterShootingAdjustment.z * Mul)
        end

        if self.IronSightsPosAfterShootingAdjustment then
            Offset = self.IronSightsPosAfterShootingAdjustment
            Right = ang:Right()
            Up = ang:Up()
            Forward = ang:Forward()

            pos = pos + Offset.x * Right * Mul
            pos = pos + Offset.y * Forward * Mul
            pos = pos + Offset.z * Up * Mul
        end
    end

    return pos, ang
end


function SWEP:IronsightsChanged(b)
    self:SetHoldType(b and self.HoldType or "normal")
end

function SWEP:SecondaryAttack()
    if not self.IronSightsPos then return end

    if self:GetReloading() then return end

    self:SetIronsights(not self:GetIronsights())

    self:SetNextSecondaryFire(CurTime() + 0.3)
end

function SWEP:OnRestore()
    self:SetNextSecondaryFire(0)
    self.dt.Ironsights = false
end

function SWEP:OnDrop()
    self.PrimaryClipLeft = self:Clip1()
    self.SecondaryClipLeft = self:Clip2()

    if not IsValid(self:GetLastOwner()) then return end
    self.PrimaryAmmoLeft = self:GetLastOwner():GetAmmoCount(self:GetPrimaryAmmoType())
    self.SecondaryAmmoLeft = self:GetLastOwner():GetAmmoCount(self:GetSecondaryAmmoType())
    self:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE_DEBRIS)
end

function SWEP:Equip(NewOwner)
    if self.PrimaryClipLeft and self.SecondaryClipLeft and self.PrimaryAmmoLeft and self.SecondaryAmmoLeft then
        NewOwner:SetAmmo(self.PrimaryAmmoLeft, self:GetPrimaryAmmoType())
        NewOwner:SetAmmo(self.SecondaryAmmoLeft, self:GetSecondaryAmmoType())

        self:SetClip1(self.PrimaryClipLeft)
        self:SetClip2(self.SecondaryClipLeft)
    end
end

function SWEP:Think()
    if self.Primary.ClipSize ~= -1 and not self:GetReloading() and not self:GetIronsights() and self:GetLastPrimaryAttack() + 1 < CurTime() and self:GetHoldType() == self.HoldType then
        self:SetHoldType("normal")
    end
    if self:GetReloadEndTime() ~= 0 and CurTime() >= self:GetReloadEndTime() then
        self:SetReloadEndTime(0)
        self:SetReloading(false)
        self:SetHoldType("normal")
        if CLIENT then self.hasShot = false end
    end
    if self:GetBurstTime() ~= 0 and CurTime() >= self:GetBurstTime() then
        self:PrimaryAttack()
    end
end

if CLIENT then
    function SWEP:ViewModelDrawn(vm)
        if self.DarkRPViewModelBoneManipulations and not self:GetReloading() then
            self:UpdateDarkRPBones(vm, self.DarkRPViewModelBoneManipulations)
        else
            self:ResetDarkRPBones(vm)
        end
    end

    function SWEP:UpdateDarkRPBones(vm, manipulations)
        if not IsValid(vm) or not vm:GetBoneCount() then return end

        -- Fill in missing bone names. Things fuck up when we workaround the scale bug and bones are missing.
        local bones = {}
        for i = 0, vm:GetBoneCount() - 1 do
            local bonename = vm:GetBoneName(i)
            if manipulations[bonename] then
                bones[bonename] = manipulations[bonename]
            else
                bones[bonename] = {
                    scale = Vector(1,1,1),
                    pos = Vector(0,0,0),
                    angle = Angle(0,0,0)
                }
            end
        end

        for k, v in pairs(bones) do
            local bone = vm:LookupBone(k)
            if not bone then continue end

            -- Bone scaling seems to be buggy. Workaround.
            local scale = Vector(v.scale.x, v.scale.y, v.scale.z)
            local ms = Vector(1,1,1)
            local cur = vm:GetBoneParent(bone)
            while cur >= 0 do
                local pscale = bones[vm:GetBoneName(cur)].scale
                ms = ms * pscale
                cur = vm:GetBoneParent(cur)
            end
            scale = scale * ms

            if vm:GetManipulateBoneScale(bone) ~= scale then
                vm:ManipulateBoneScale(bone, scale)
            end
            if vm:GetManipulateBonePosition(bone) ~= v.pos then
                vm:ManipulateBonePosition(bone, v.pos)
            end
            if vm:GetManipulateBoneAngles(bone) ~= v.angle then
                vm:ManipulateBoneAngles(bone, v.angle)
            end
        end
    end

    function SWEP:ResetDarkRPBones(vm)
        if not IsValid(vm) or not vm:GetBoneCount() then return end
        for i = 0, vm:GetBoneCount() - 1 do
            vm:ManipulateBoneScale(i, Vector(1, 1, 1))
            vm:ManipulateBoneAngles(i, Angle(0, 0, 0))
            vm:ManipulateBonePosition(i, Vector(0, 0, 0))
        end
    end
end

-- hook.Add("SetupMove", "DarkRP_WeaponSpeed", function(ply, mv)
    -- local wep = ply:GetActiveWeapon()
    -- if not wep:IsValid() or not wep.DarkRPBased or not wep.GetIronsights or not wep:GetIronsights() then return end

    -- mv:SetMaxClientSpeed(mv:GetMaxClientSpeed() / 3)
-- end)

--PATH addons/cuffs/lua/weapons/weapon_cuff_base.lua:
-------------------------------------
---------------- Cuffs --------------
-------------------------------------
-- Copyright (c) 2015 Nathan Healy --
-------- All rights reserved --------
-------------------------------------
-- weapon_cuff_base.lua     SHARED --
--                                 --
-- Base swep for handcuffs.        --
-------------------------------------

AddCSLuaFile()

SWEP.Base = "weapon_base"

SWEP.Category = "Handcuffs"
SWEP.Author = "my_hat_stinks"
SWEP.Instructions = ""

SWEP.Spawnable = false
SWEP.AdminOnly = false
SWEP.AdminSpawnable = false

SWEP.Slot = 3
SWEP.PrintName = "UnnamedHandcuff"

SWEP.ViewModelFOV = 60
SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.WorldModel = "models/weapons/w_toolgun.mdl"
SWEP.ViewModel = "models/weapons/c_bugbait.mdl"
SWEP.UseHands = true

SWEP.Primary.Recoil = 1
SWEP.Primary.Damage = 5
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0
SWEP.Primary.Delay = 0.25

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"
SWEP.Primary.ClipMax = -1

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.ClipMax = -1

SWEP.DeploySpeed = 1.5

SWEP.Spawnable = false
SWEP.AdminSpawnable = false
SWEP.AdminOnly = false

SWEP.PrimaryAnim = ACT_VM_PRIMARYATTACK
SWEP.ReloadAnim = ACT_VM_RELOAD
SWEP.HoldType = "slam"

SWEP.Spawnable = false
SWEP.AdminSpawnable = false
SWEP.AdminOnly = false

//
// Handcuff Vars
SWEP.CuffTime = 1 // Seconds to handcuff
SWEP.CuffSound = Sound( "buttons/lever7.wav" )

SWEP.CuffMaterial = "phoenix_storms/metalfloor_2-3"
SWEP.CuffRope = "cable/cable2"

SWEP.CuffStrength = 1
SWEP.CuffRegen = 1
SWEP.RopeLength = 0

SWEP.CuffReusable = true // Can reuse (ie, not removed on use)
SWEP.CuffRecharge = 1 // Time before re-use

SWEP.CuffBlindfold = false
SWEP.CuffGag = false

SWEP.CuffStrengthVariance = 0 // Randomise strangth
SWEP.CuffRegenVariance = 0 // Randomise regen

//
// Network Vars
function SWEP:SetupDataTables()
	self:NetworkVar( "Bool", 0, "IsCuffing" )
	self:NetworkVar( "Entity", 0, "Cuffing" )
	self:NetworkVar( "Float", 0, "CuffTime" )
end

//
// Standard SWEP functions
function SWEP:PrimaryAttack()
	if self:GetIsCuffing() then return end
	
	self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
	self:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
	
	if CLIENT then return end
	if self:GetCuffTime()>CurTime() then return end // On cooldown
	
	local tr = self:TargetTrace()
	if not tr then return end
	
	self:SetCuffTime( CurTime() + self.CuffTime )
	self:SetIsCuffing( true )
	self:SetCuffing( tr.Entity )
	
	sound.Play( self.CuffSound, self.Owner:GetShootPos(), 75, 100, 1 )
	tr.Entity:SetNW2Bool("SitGroundSitting", false)
end
function SWEP:SecondaryAttack()
end
function SWEP:Reload()
end

function SWEP:Initialize()
	self:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
	self:SetHoldType( self.HoldType )
	
	if engine.ActiveGamemode()=="dayz" then self.CuffReusable = false end
end
function SWEP:Holster()
	if CLIENT and IsValid(self.Owner) and self.Owner==LocalPlayer() then
		local vm = self.Owner:GetViewModel()
		if not IsValid(vm) then return end
		
		vm:SetMaterial( "" )
	end
	if IsValid(self.cmdl_RightCuff) then self.cmdl_RightCuff:Remove() end
	if IsValid(self.cmdl_LeftCuff) then self.cmdl_LeftCuff:Remove() end
	
	return true
end
SWEP.OnRemove = SWEP.Holster

//
// Handcuff
function SWEP:DoHandcuff( target )
	if not (target and IsValid(target)) then return end
	if target:IsHandcuffed() then return end
	if not IsValid(self.Owner) then return end
	//if target:IsCP() then return end
	
	local cuff = target:Give( "weapon_handcuffed" )
	cuff:SetCuffStrength( self.CuffStrength + (math.Rand(-self.CuffStrengthVariance,self.CuffStrengthVariance)) or 1.5)
	cuff:SetCuffRegen( self.CuffRegen + (math.Rand(-self.CuffRegenVariance,self.CuffRegenVariance)) or 1)
	
	cuff:SetCuffMaterial( self.CuffMaterial )
	cuff:SetRopeMaterial( self.CuffRope )
	
	cuff:SetKidnapper( self.Owner )
	cuff:SetRopeLength( self.RopeLength )
	
	cuff:SetCanBlind( self.CuffBlindfold )
	cuff:SetCanGag( self.CuffGag )
	
	cuff.CuffType = self:GetClass() or ""
	cuff.CuffsArrestable = self.CuffsCanArrest
	hook.Call( "OnHandcuffed", GAMEMODE, self.Owner, target, cuff,target)
	hook.Call('PlayerHandCuffs',nil,target,self.Owner)
	hook.Run('playerCuff_BattlePass', self.Owner)


	if not self.CuffReusable then
		if IsValid(self.Owner) then self.Owner:ConCommand( "lastinv" ) end
		self:Remove()
	end
end

//
// Think
function SWEP:Think()
	if SERVER then
		if self:GetIsCuffing() then
			local tr = self:TargetTrace()
			if (not tr) or tr.Entity~=self:GetCuffing() then
				self:SetIsCuffing(false)
				self:SetCuffTime( 0 )
				return
			end
			
			if CurTime()>self:GetCuffTime() then
				self:SetIsCuffing( false )
				self:SetCuffTime( CurTime() + self.CuffRecharge )
				self:DoHandcuff( self:GetCuffing() )
			end
		end
	end
end


//
// Get Target
function SWEP:TargetTrace()
	if not IsValid(self.Owner) then return end
	
	local tr = util.TraceLine( {start=self.Owner:GetShootPos(), endpos=(self.Owner:GetShootPos() + (self.Owner:GetAimVector()*150)), filter={self, self.Owner}} )
	if IsValid(tr.Entity) and tr.Entity:IsPlayer() and tr.Entity~=self.Owner and not tr.Entity:IsHandcuffed() then
		if hook.Run( "CuffsCanHandcuff", self.Owner, tr.Entity )==false then return end
		return tr
	end
end

//
// HUD
local Col = {
	Text = Color(255,255,255), TextShadow = Color(0,0,0),
	
	BoxOutline = Color(0,0,0), BoxBackground = Color(255,255,255,20), BoxLeft = Color(255,0,0), BoxRight = Color(0,255,0),
}
local matGrad = Material( "gui/gradient" )
function SWEP:DrawHUD()
	if not self:GetIsCuffing() then
		if self:GetCuffTime()<=CurTime() then return end
		
		local w,h = (ScrW()/2), (ScrH()/2)
		
		surface.SetDrawColor( Col.BoxOutline )
		surface.DrawOutlinedRect( w-101, h+54, 202, 22 )
		surface.SetDrawColor( Col.BoxBackground )
		surface.DrawRect( w-100, h+55, 200, 20 )
		
		local CuffingPercent = math.Clamp( ((self:GetCuffTime()-CurTime())/self.CuffRecharge), 0, 1 )
		render.SetScissorRect( w-100, h+55, (w-100)+(CuffingPercent*200), h+75, true )
			surface.SetDrawColor( Col.BoxRight )
			surface.DrawRect( w-100,h+55, 200,20 )
			
			surface.SetMaterial( matGrad )
			surface.SetDrawColor( Col.BoxLeft )
			surface.DrawTexturedRect( w-100,h+55, 200,20 )
		render.SetScissorRect( 0,0,0,0, false )
		
		return
	end
	
	local w,h = (ScrW()/2), (ScrH()/2)
	
	draw.SimpleText( "Вяжем цель...", "HandcuffsText", w+1, h+31, Col.TextShadow, TEXT_ALIGN_CENTER )
	draw.SimpleText( "Вяжем цель...", "HandcuffsText", w, h+30, Col.Text, TEXT_ALIGN_CENTER )
	
	surface.SetDrawColor( Col.BoxOutline )
	surface.DrawOutlinedRect( w-101, h+54, 202, 22 )
	surface.SetDrawColor( Col.BoxBackground )
	surface.DrawRect( w-100, h+55, 200, 20 )
	
	local CuffingPercent = math.Clamp( 1-((self:GetCuffTime()-CurTime())/self.CuffTime), 0, 1 )
	
	render.SetScissorRect( w-100, h+55, (w-100)+(CuffingPercent*200), h+75, true )
		surface.SetDrawColor( Col.BoxRight )
		surface.DrawRect( w-100,h+55, 200,20 )
		
		surface.SetMaterial( matGrad )
		surface.SetDrawColor( Col.BoxLeft )
		surface.DrawTexturedRect( w-100,h+55, 200,20 )
	render.SetScissorRect( 0,0,0,0, false )
end

//
// Rendering
local renderpos = {
	left = {pos=Vector(0,0,0), vel=Vector(0,0,0), gravity=1, ang=Angle(0,30,90)},
	right = {bone = "ValveBiped.Bip01_R_Hand", pos=Vector(3.2,2.1,0.4), ang=Angle(-2,0,80), scale = Vector(0.045,0.045,0.03)},
	rope = {l = Vector(0,0,2.0), r = Vector(2.3,-1.9,2.7)},
}
local CuffMdl = "models/hunter/tubes/tube2x2x1.mdl"
local RopeCol = Color(255,255,255)
function SWEP:ViewModelDrawn( vm )
	if not IsValid(vm) then return end
	
	vm:SetMaterial( "engine/occlusionproxy" )
	
	if not IsValid(self.cmdl_LeftCuff) then
		self.cmdl_LeftCuff = ClientsideModel( CuffMdl, RENDER_GROUP_VIEW_MODEL_OPAQUE )
		self.cmdl_LeftCuff:SetNoDraw( true )
		self.cmdl_LeftCuff:SetParent( vm )
		
		renderpos.left.pos = self.Owner:GetPos()
	end
	if not IsValid(self.cmdl_RightCuff) then
		self.cmdl_RightCuff = ClientsideModel( CuffMdl, RENDER_GROUP_VIEW_MODEL_OPAQUE )
		self.cmdl_RightCuff:SetNoDraw( true )
		self.cmdl_RightCuff:SetParent( vm )
	end
	
	-- local lpos, lang = self:GetBonePos( renderpos.left.bone, vm )
	local rpos, rang = self:GetBonePos( renderpos.right.bone, vm )
	if not (rpos and rang) then return end
	
	// Right
	local fixed_rpos = rpos + (rang:Forward()*renderpos.right.pos.x) + (rang:Right()*renderpos.right.pos.y) + (rang:Up()*renderpos.right.pos.z)
	self.cmdl_RightCuff:SetPos( fixed_rpos )
	local u,r,f = rang:Up(), rang:Right(), rang:Forward() // Prevents moving axes
	rang:RotateAroundAxis( u, renderpos.right.ang.y )
	rang:RotateAroundAxis( r, renderpos.right.ang.p )
	rang:RotateAroundAxis( f, renderpos.right.ang.r )
	self.cmdl_RightCuff:SetAngles( rang )
	
	local matrix = Matrix()
	matrix:Scale( renderpos.right.scale )
	self.cmdl_RightCuff:EnableMatrix( "RenderMultiply", matrix )
	
	self.cmdl_RightCuff:SetMaterial( self.CuffMaterial )
	self.cmdl_RightCuff:DrawModel()
	
	// Left
	if CurTime()>(renderpos.left.NextThink or 0) then
		local dist = renderpos.left.pos:Distance( fixed_rpos )
		if dist>100 then
			renderpos.left.pos = fixed_rpos
			renderpos.left.vel = Vector(0,0,0)
		elseif dist > 10 then
			local target = (fixed_rpos - renderpos.left.pos)*0.3
			renderpos.left.vel.x = math.Approach( renderpos.left.vel.x, target.x, 1 )
			renderpos.left.vel.y = math.Approach( renderpos.left.vel.y, target.y, 1 )
			renderpos.left.vel.z = math.Approach( renderpos.left.vel.z, target.z, 3 )
		end
		
		renderpos.left.vel.x = math.Approach( renderpos.left.vel.x, 0, 0.5 )
		renderpos.left.vel.y = math.Approach( renderpos.left.vel.y, 0, 0.5 )
		renderpos.left.vel.z = math.Approach( renderpos.left.vel.z, 0, 0.5 )
		-- if renderpos.left.vel:Length()>10 then renderpos.left.vel:Mul(0.1) end
		
		local targetZ = ((fixed_rpos.z - 10) - renderpos.left.pos.z) * renderpos.left.gravity
		renderpos.left.vel.z = math.Approach( renderpos.left.vel.z, targetZ, 3 )
		
		renderpos.left.pos:Add( renderpos.left.vel )
		
		-- renderpos.left.NextThink = CurTime()+0.01
	end
	
	self.cmdl_LeftCuff:SetPos( renderpos.left.pos )
	self.cmdl_LeftCuff:SetAngles( renderpos.left.ang )
	
	-- self.cmdl_LeftCuff:SetAngles( rang )
	local matrix = Matrix()
	matrix:Scale( renderpos.right.scale )
	self.cmdl_LeftCuff:EnableMatrix( "RenderMultiply", matrix )
	
	self.cmdl_LeftCuff:SetMaterial( self.CuffMaterial )
	self.cmdl_LeftCuff:DrawModel()
	
	// Rope
	if not self.RopeMat then self.RopeMat = Material(self.CuffRope) end
	
	render.SetMaterial( self.RopeMat )
	render.DrawBeam( renderpos.left.pos + renderpos.rope.l,
		rpos + (rang:Forward()*renderpos.rope.r.x) + (rang:Right()*renderpos.rope.r.y) + (rang:Up()*renderpos.rope.r.z),
		0.7, 0, 5, RopeCol )
end

SWEP.wrender = {
	left = {pos=Vector(0,0,0), vel=Vector(0,0,0), gravity=1, ang=Angle(0,30,90)},
	right = {bone = "ValveBiped.Bip01_R_Hand", pos=Vector(2.95,2.5,-0.2), ang=Angle(30,0,90), scale = Vector(0.044,0.044,0.044)},
	rope = {l = Vector(0,0,2), r = Vector(3,-1.65,1)},
}
function SWEP:DrawWorldModel()
	if not IsValid(self.Owner) then return end
	local wrender = self.wrender
	
	if not IsValid(self.cmdl_LeftCuff) then
		self.cmdl_LeftCuff = ClientsideModel( CuffMdl, RENDER_GROUP_VIEW_MODEL_OPAQUE )
		self.cmdl_LeftCuff:SetNoDraw( true )
	end
	if not IsValid(self.cmdl_RightCuff) then
		self.cmdl_RightCuff = ClientsideModel( CuffMdl, RENDER_GROUP_VIEW_MODEL_OPAQUE )
		self.cmdl_RightCuff:SetNoDraw( true )
	end
	
	local rpos, rang = self:GetBonePos( wrender.right.bone, self.Owner )
	if not (rpos and rang) then return end
	
	// Right
	local fixed_rpos = rpos + (rang:Forward()*wrender.right.pos.x) + (rang:Right()*wrender.right.pos.y) + (rang:Up()*wrender.right.pos.z)
	self.cmdl_RightCuff:SetPos( fixed_rpos )
	local u,r,f = rang:Up(), rang:Right(), rang:Forward() // Prevents moving axes
	rang:RotateAroundAxis( u, wrender.right.ang.y )
	rang:RotateAroundAxis( r, wrender.right.ang.p )
	rang:RotateAroundAxis( f, wrender.right.ang.r )
	self.cmdl_RightCuff:SetAngles( rang )
	
	local matrix = Matrix()
	matrix:Scale( wrender.right.scale )
	self.cmdl_RightCuff:EnableMatrix( "RenderMultiply", matrix )
	
	self.cmdl_RightCuff:SetMaterial( self.CuffMaterial )
	self.cmdl_RightCuff:DrawModel()
	
	// Left
	if CurTime()>(wrender.left.NextThink or 0) then
		local dist = wrender.left.pos:Distance( fixed_rpos )
		if dist>100 then
			wrender.left.pos = fixed_rpos
			wrender.left.vel = Vector(0,0,0)
		elseif dist > 10 then
			local target = (fixed_rpos - wrender.left.pos)*0.3
			wrender.left.vel.x = math.Approach( wrender.left.vel.x, target.x, 1 )
			wrender.left.vel.y = math.Approach( wrender.left.vel.y, target.y, 1 )
			wrender.left.vel.z = math.Approach( wrender.left.vel.z, target.z, 3 )
		end
		
		wrender.left.vel.x = math.Approach( wrender.left.vel.x, 0, 0.5 )
		wrender.left.vel.y = math.Approach( wrender.left.vel.y, 0, 0.5 )
		wrender.left.vel.z = math.Approach( wrender.left.vel.z, 0, 0.5 )
		-- if wrender.left.vel:Length()>10 then wrender.left.vel:Mul(0.1) end
		
		local targetZ = ((fixed_rpos.z - 10) - wrender.left.pos.z) * wrender.left.gravity
		wrender.left.vel.z = math.Approach( wrender.left.vel.z, targetZ, 3 )
		
		wrender.left.pos:Add( wrender.left.vel )
		
		-- wrender.left.NextThink = CurTime()+0
	end
	
	self.cmdl_LeftCuff:SetPos( wrender.left.pos )
	self.cmdl_LeftCuff:SetAngles( wrender.left.ang )
	
	local matrix = Matrix()
	matrix:Scale( wrender.right.scale )
	self.cmdl_LeftCuff:EnableMatrix( "RenderMultiply", matrix )
	
	self.cmdl_LeftCuff:SetMaterial( self.CuffMaterial )
	self.cmdl_LeftCuff:DrawModel()
	
	// Rope
	if not self.RopeMat then self.RopeMat = Material(self.CuffRope) end
	
	render.SetMaterial( self.RopeMat )
	render.DrawBeam( wrender.left.pos + wrender.rope.l,
		rpos + (rang:Forward()*wrender.rope.r.x) + (rang:Right()*wrender.rope.r.y) + (rang:Up()*wrender.rope.r.z),
		0.7, 0, 5, RopeCol )
end

//
// Bones
function SWEP:GetBonePos( bonename, vm )
	local bone = vm:LookupBone( bonename )
	if not bone then return end
	
	local pos,ang = Vector(0,0,0),Angle(0,0,0)
	local matrix = vm:GetBoneMatrix( bone )
	if matrix then
		pos = matrix:GetTranslation()
		ang = matrix:GetAngles()
	end
	
	if self.ViewModelFlip then ang.r = -ang.r end
	
	-- if pos.x==0 and pos.y==0 and pos.z==0 then print( bonename, vm ) end
	return pos, ang
end

--PATH addons/cuffs/lua/weapons/weapon_handcuffed.lua:
-------------------------------------
---------------- Cuffs --------------
-------------------------------------
-- Copyright (c) 2015 Nathan Healy --
-------- All rights reserved --------
-------------------------------------
-- weapon_handcuffed.lua    SHARED --
--                                 --
-- Handcuffed. Limits what         --
-- equipping player can do.        --
-------------------------------------

AddCSLuaFile()

SWEP.Base = "weapon_base"

SWEP.Category = "Наручники"
SWEP.Author = "my_hat_stinks"
SWEP.Instructions = ""

SWEP.Spawnable = false
SWEP.AdminSpawnable = false
SWEP.AdminOnly = false

SWEP.Slot = 4
SWEP.PrintName = "Закован"

SWEP.ViewModelFOV = 60
SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.WorldModel = "models/weapons/w_toolgun.mdl"
SWEP.ViewModel = "models/weapons/c_arms_citizen.mdl"
SWEP.UseHands = true

SWEP.Primary.Recoil = 1
SWEP.Primary.Damage = 5
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0
SWEP.Primary.Delay = 1

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"
SWEP.Primary.ClipMax = -1

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.ClipMax = -1

SWEP.DeploySpeed = 1.5

SWEP.PrimaryAnim = ACT_VM_PRIMARYATTACK
SWEP.ReloadAnim = ACT_VM_RELOAD
SWEP.HoldType = "duel"

SWEP.IsHandcuffs = true
SWEP.CuffType = ""

CreateConVar( "cuffs_allowbreakout", 1, {FCVAR_ARCHIVE,FCVAR_SERVER_CAN_EXECUTE,FCVAR_REPLICATED,FCVAR_NOTIFY} )

// For anything that might try to drop this
SWEP.CanDrop = false
SWEP.PreventDrop = true
-- Missing anything?

//
// DataTables
function SWEP:SetupDataTables()
	self:NetworkVar( "Entity", 0, "Kidnapper" )
	self:NetworkVar( "Entity", 1, "FriendBreaking" )
	
	self:NetworkVar( "Float", 0, "RopeLength" )
	self:NetworkVar( "Float", 1, "CuffBroken" )
	self:NetworkVar( "Float", 2, "CuffStrength" )
	self:NetworkVar( "Float", 3, "CuffRegen" )
	
	self:NetworkVar( "String", 0, "RopeMaterial" )
	self:NetworkVar( "String", 1, "CuffMaterial" )
	
	self:NetworkVar( "Bool", 0, "CanGag" )
	self:NetworkVar( "Bool", 1, "IsGagged" )
	
	self:NetworkVar( "Bool", 2, "CanBlind" )
	self:NetworkVar( "Bool", 3, "IsBlind" )
	self:NetworkVar( "Bool", 4, "IsLeash" )
end

//
// Initialize
function SWEP:Initialize()
	-- hook.Add( "canDropWeapon", self, function(wep, ply) if wep==self then return false end end) // Thank you DarkRP, your code is terrible
	
	if self:GetCuffStrength()<=0 then self:SetCuffStrength(1) end
	if self:GetCuffRegen()<=0 then self:SetCuffRegen(1) end
	self:SetCuffBroken( 0 )
	
	self:SetHoldType( self.HoldType )
end

//
// Standard SWEP functions
function SWEP:PrimaryAttack()
	if SERVER then self:AttemptBreak() end
end
function SWEP:SecondaryAttack() end
function SWEP:Reload() end

//
// Equip and Holster
function SWEP:Equip( newOwner )
	newOwner:SelectWeapon( self:GetClass() )
	
	timer.Simple( 0.1, function() // Fucking FA:S
		if IsValid(self) and  IsValid(newOwner) and newOwner:GetActiveWeapon()~=self then
			local wep = newOwner:GetActiveWeapon()
			if not IsValid(wep) then return end
			
			local oHolster = wep.Holster
			wep.Holster = function() return true end
			newOwner:SelectWeapon( self:GetClass() )
			wep.Holster = oHolster
		end
	end)
	
	return true
end
function SWEP:Holster()
	return false
end

//
// Deploy
function SWEP:Deploy()
	local viewModel = self.Owner:GetViewModel()
	viewModel:SendViewModelMatchingSequence( viewModel:LookupSequence("fists_idle_01") )
	
	return true
end
function SWEP:PreDrawViewModel( viewModel ) // Fixes visible base hands
	viewModel:SetMaterial( "engine/occlusionproxy" )
end
function SWEP:OnRemove() // Fixes invisible other weapons
	if IsValid(self.Owner) then
		local viewModel = self.Owner:GetViewModel()
		if IsValid(viewModel) then viewModel:SetMaterial("") end
	end
	if IsValid( self.cmdl_LeftCuff ) then self.cmdl_LeftCuff:Remove() end
	if IsValid( self.cmdl_RightCuff ) then self.cmdl_RightCuff:Remove() end
	return true
end

//
// Release
function SWEP:Uncuff()
	local ply = IsValid(self.Owner) and self.Owner
	
	self:Remove()
	
	ply:ConCommand( "lastinv1" )
end

//
// Breakout
if SERVER then

	concommand.Add('lastinv1',function(pl) -- FIX SCRIPT STUPID DEV
		pl:SelectWeapon( "weapon_physgun" )
	end)

	local BreakSound = Sound( "physics/metal/metal_barrel_impact_soft4.wav" )
	local ResistSounds = {
		Sound( "physics/metal/metal_box_strain1.wav" ), Sound( "physics/metal/metal_box_strain2.wav" ),
		Sound( "physics/metal/metal_box_strain3.wav" ), Sound( "physics/metal/metal_box_strain4.wav" ),
	}
	local ReleaseSounds = {
		Sound( "physics/cardboard/cardboard_box_impact_soft1.wav" ), Sound( "physics/cardboard/cardboard_box_impact_soft2.wav" ),
		Sound( "physics/cardboard/cardboard_box_impact_soft3.wav" ), Sound( "physics/cardboard/cardboard_box_impact_soft4.wav" ),
		Sound( "physics/cardboard/cardboard_box_impact_soft5.wav" ), Sound( "physics/cardboard/cardboard_box_impact_soft6.wav" ),
	}
	function SWEP:Breakout()
		if IsValid(self.Owner) then
			sound.Play( BreakSound, self.Owner:GetShootPos(), 75, 100, 1 )
			if IsValid( self:GetFriendBreaking() ) then
				hook.Call( "OnHandcuffBreak", GAMEMODE, self.Owner, self, self:GetFriendBreaking() )
			else
				hook.Call( "OnHandcuffBreak", GAMEMODE, self.Owner, self )
			end
		end
		
		self:Uncuff()
	end
	function SWEP:AttemptBreak()
		if not cvars.Bool( "cuffs_allowbreakout" ) then return end
		
		self:SetCuffBroken( self:GetCuffBroken() + math.abs(4/self:GetCuffStrength()) )
		
		if self:GetCuffBroken()>=100 then
			self:Breakout()
		end
		
		if CurTime()>(self.NextResistSound or 0) then
			sound.Play( table.Random( ResistSounds ), self.Owner:GetShootPos(), 75, 100, math.Clamp((self:GetCuffStrength()-0.5)/2, 0.1, 1) )
			self.NextResistSound = CurTime()+0.5
		end
		
	end
	
	local function GetTrace( ply )
		local tr = util.TraceLine( {start=ply:EyePos(), endpos=ply:EyePos()+(ply:GetAimVector()*100), filter=ply} )
		if IsValid(tr.Entity) and tr.Entity:IsPlayer() then
			local cuffed,wep = tr.Entity:IsHandcuffed()
			if cuffed then return tr,wep end
		end
	end
	function SWEP:Think()
		if (self.NextRegen or 0)<=CurTime() then
			local regen = self:GetCuffRegen()
			local friend = self:GetFriendBreaking()
			if IsValid(friend) and friend:IsPlayer() then
				local tr = GetTrace(friend)
				if tr and tr.Entity==self.Owner then
					regen = (regen*0.5) - (2/self:GetCuffStrength())
				else
					self:SetFriendBreaking( nil )
				end
				
				if CurTime()>(self.NextReleaseSound or 0) then
					sound.Play( table.Random( ReleaseSounds ), self.Owner:GetShootPos(), 75, 100, self:GetCuffStrength()/1.5 )
					self.NextReleaseSound = CurTime()+0.25
				end
			end
			
			self:SetCuffBroken( math.Approach( self:GetCuffBroken(), regen<0 and 100 or 0, math.abs(regen) ) )
			self.NextRegen = CurTime()+0.05
			
			if self:GetCuffBroken()>=100 then self:Breakout() end
		end
		if IsValid(self:GetKidnapper()) and (self:GetKidnapper():IsPlayer() and not self:GetKidnapper():Alive()) then
			self:SetKidnapper( nil )
		end
		if IsValid(self.Owner) then
			self.Owner.KnockoutTimer = CurTime()+10 // Fucking DarkRP
		end
	end
end

//
// UI
if CLIENT then
	surface.CreateFont( "HandcuffsText", {
		font = "Arial",
		size = 20,
		weight = 700,
	})
	local Col = {
		Text = Color(255,255,255), TextShadow = Color(0,0,0),
		
		BoxOutline = Color(0,0,0), BoxBackground = Color(255,255,255,20), BoxLeft = Color(255,0,0), BoxRight = Color(0,255,0),
		
		Blind = Color(0,0,0, 253), Blind2 = Color(0,0,0, 255),
	}
	local matGrad = Material( "gui/gradient" )
	function SWEP:DrawHUD()
		local w,h = (ScrW()/2), (ScrH()/2)
		
		local TextPos = h+30
		local str = string.format( "Ваши руки связаны",
			((self:GetCuffStrength()>1.2) and " tightly") or ((self:GetCuffStrength()<0.8) and " loosely") or ""
		)
		if self:GetCuffRegen()>1.2 or self:GetCuffRegen()<0.8 then
			str = str.. string.format( "", ((self:GetCuffRegen()>1.2) and "sturdy") or "flimsy" )
		end
		
		draw.SimpleText( str, "HandcuffsText", w+1, TextPos+1, Col.TextShadow, TEXT_ALIGN_CENTER )
		draw.SimpleText( str, "HandcuffsText", w, TextPos, Col.Text, TEXT_ALIGN_CENTER )
		
		if self:GetIsBlind() then
			TextPos = TextPos+20
			draw.SimpleText( "Вам завязали глаза", "HandcuffsText", w+1, TextPos+1, Col.TextShadow, TEXT_ALIGN_CENTER )
			draw.SimpleText( "Вам завязали глаза", "HandcuffsText", w, TextPos, Col.Text, TEXT_ALIGN_CENTER )
		end
		if self:GetIsGagged() then
			TextPos = TextPos+20
			draw.SimpleText( "Вам вставили кляп", "HandcuffsText", w+1, TextPos+1, Col.TextShadow, TEXT_ALIGN_CENTER )
			draw.SimpleText( "Вам вставили кляп", "HandcuffsText", w, TextPos, Col.Text, TEXT_ALIGN_CENTER )
		end
		
		if cvars.Bool( "cuffs_allowbreakout" ) then
			TextPos = TextPos+20
			str = string.format("ЛКМ чтобы сопротивляться", (input.LookupBinding("+attack") or "[Primary Fire]"):upper())
			draw.SimpleText( str, "HandcuffsText", w+1, TextPos+1, Col.TextShadow, TEXT_ALIGN_CENTER )
			draw.SimpleText( str, "HandcuffsText", w, TextPos, Col.Text, TEXT_ALIGN_CENTER )
		end
		
		TextPos = TextPos+25
		surface.SetDrawColor( Col.BoxOutline )
		surface.DrawOutlinedRect( w-101, TextPos-1, 202, 22 )
		surface.SetDrawColor( Col.BoxBackground )
		surface.DrawRect( w-100, TextPos, 200, 20 )
		
		render.SetScissorRect( w-100, TextPos, (w-100)+((self:GetCuffBroken()/100)*200), TextPos+20, true )
			surface.SetDrawColor( Col.BoxRight )
			surface.DrawRect( w-100,TextPos, 200,20 )
			
			surface.SetMaterial( matGrad )
			surface.SetDrawColor( Col.BoxLeft )
			surface.DrawTexturedRect( w-100,TextPos, 200,20 )
		render.SetScissorRect( 0,0,0,0, false )
	end
	function SWEP:DrawHUDBackground()
		if self:GetIsBlind() then
			surface.SetDrawColor( Col.Blind )
			surface.DrawRect( 0,0, ScrW(), ScrH() )
			
			surface.SetDrawColor( Col.Blind2 )
			for i=1,ScrH(),5 do
				surface.DrawRect( 0,i, ScrW(), 4 )
			end
			for i=1,ScrW(),5 do
				surface.DrawRect( i,0, 4,ScrH() )
			end
		end
	end
end

//
// Rendering
local renderpos = {
	left = {bone = "ValveBiped.Bip01_L_Wrist", pos=Vector(0.4,-0.15,-0.45), ang=Angle(90,0,0), scale = Vector(0.035,0.035,0.015)},
	right = {bone = "ValveBiped.Bip01_R_Wrist", pos=Vector(0.2,-0.15,0.35), ang=Angle(100,0,0), scale = Vector(0.035,0.035,0.015)},
	rope = {l = Vector(-0.2,1.3,-0.25), r = Vector(0.4,1.4,-0.2)},
}
local CuffMdl = "models/hunter/tubes/tube2x2x1.mdl"
local DefaultRope = "cable/cable2"
local RopeCol = Color(255,255,255)
function SWEP:ViewModelDrawn( vm )
	if not IsValid(vm) then return end
	
	if not IsValid(self.cmdl_LeftCuff) then
		self.cmdl_LeftCuff = ClientsideModel( CuffMdl, RENDER_GROUP_VIEW_MODEL_OPAQUE )
		self.cmdl_LeftCuff:SetNoDraw( true )
		self.cmdl_LeftCuff:SetParent( vm )
	end
	if not IsValid(self.cmdl_RightCuff) then
		self.cmdl_RightCuff = ClientsideModel( CuffMdl, RENDER_GROUP_VIEW_MODEL_OPAQUE )
		self.cmdl_RightCuff:SetNoDraw( true )
		self.cmdl_RightCuff:SetParent( vm )
	end
	
	local lpos, lang = self:GetBonePos( renderpos.left.bone, vm )
	local rpos, rang = self:GetBonePos( renderpos.right.bone, vm )
	if not (lpos and rpos and lang and rang) then return end
	
	// Left
	self.cmdl_LeftCuff:SetPos( lpos + (lang:Forward()*renderpos.left.pos.x) + (lang:Right()*renderpos.left.pos.y) + (lang:Up()*renderpos.left.pos.z) )
	local u,r,f = lang:Up(), lang:Right(), lang:Forward() // Prevents moving axes
	lang:RotateAroundAxis( u, renderpos.left.ang.y )
	lang:RotateAroundAxis( r, renderpos.left.ang.p )
	lang:RotateAroundAxis( f, renderpos.left.ang.r )
	self.cmdl_LeftCuff:SetAngles( lang )
	
	local matrix = Matrix()
	matrix:Scale( renderpos.left.scale )
	self.cmdl_LeftCuff:EnableMatrix( "RenderMultiply", matrix )
	
	self.cmdl_LeftCuff:SetMaterial( self:GetCuffMaterial() or "" )
	self.cmdl_LeftCuff:DrawModel()
	
	// Right
	self.cmdl_RightCuff:SetPos( rpos + (rang:Forward()*renderpos.right.pos.x) + (rang:Right()*renderpos.right.pos.y) + (rang:Up()*renderpos.right.pos.z) )
	local u,r,f = rang:Up(), rang:Right(), rang:Forward() // Prevents moving axes
	rang:RotateAroundAxis( u, renderpos.right.ang.y )
	rang:RotateAroundAxis( r, renderpos.right.ang.p )
	rang:RotateAroundAxis( f, renderpos.right.ang.r )
	self.cmdl_RightCuff:SetAngles( rang )
	
	local matrix = Matrix()
	matrix:Scale( renderpos.right.scale )
	self.cmdl_RightCuff:EnableMatrix( "RenderMultiply", matrix )
	
	self.cmdl_RightCuff:SetMaterial( self:GetCuffMaterial() or "" )
	self.cmdl_RightCuff:DrawModel()
	
	// Rope
	if self:GetRopeMaterial()~=self.LastMatStr then
		self.RopeMat = Material( self:GetRopeMaterial() )
		self.LastMatStr = self:GetRopeMaterial()
	end
	if not self.RopeMat then self.RopeMat = Material(DefaultRope) end
	
	render.SetMaterial( self.RopeMat )
	render.DrawBeam( lpos + (lang:Forward()*renderpos.rope.l.x) + (lang:Right()*renderpos.rope.l.y) + (lang:Up()*renderpos.rope.l.z),
		rpos + (rang:Forward()*renderpos.rope.r.x) + (rang:Right()*renderpos.rope.r.y) + (rang:Up()*renderpos.rope.r.z),
		0.7, 0, 5, RopeCol )
end

local wrender = {
	left = {bone = "ValveBiped.Bip01_L_Hand", pos=Vector(0,0,0), ang=Angle(90,0,0), scale = Vector(0.035,0.035,0.035)},
	right = {bone = "ValveBiped.Bip01_R_Hand", pos=Vector(0.2,0,0), ang=Angle(90,0,0), scale = Vector(0.035,0.035,0.035)},
	rope = {l = Vector(-0.2,1.3,-0.25), r = Vector(0.4,1.4,-0.2)},
}
function SWEP:DrawWorldModel()
	if not IsValid(self.Owner) then return end
	
	if not IsValid(self.cmdl_LeftCuff) then
		self.cmdl_LeftCuff = ClientsideModel( CuffMdl, RENDER_GROUP_VIEW_MODEL_OPAQUE )
		self.cmdl_LeftCuff:SetNoDraw( true )
		-- self.cmdl_LeftCuff:SetParent( vm )
	end
	if not IsValid(self.cmdl_RightCuff) then
		self.cmdl_RightCuff = ClientsideModel( CuffMdl, RENDER_GROUP_VIEW_MODEL_OPAQUE )
		self.cmdl_RightCuff:SetNoDraw( true )
		-- self.cmdl_RightCuff:SetParent( vm )
	end
	
	local lpos, lang = self:GetBonePos( wrender.left.bone, self.Owner )
	local rpos, rang = self:GetBonePos( wrender.right.bone, self.Owner )
	if not (lpos and rpos and lang and rang) then return end
	
	// Left
	self.cmdl_LeftCuff:SetPos( lpos + (lang:Forward()*wrender.left.pos.x) + (lang:Right()*wrender.left.pos.y) + (lang:Up()*wrender.left.pos.z) )
	local u,r,f = lang:Up(), lang:Right(), lang:Forward() // Prevents moving axes
	lang:RotateAroundAxis( u, wrender.left.ang.y )
	lang:RotateAroundAxis( r, wrender.left.ang.p )
	lang:RotateAroundAxis( f, wrender.left.ang.r )
	self.cmdl_LeftCuff:SetAngles( lang )
	
	local matrix = Matrix()
	matrix:Scale( wrender.left.scale )
	self.cmdl_LeftCuff:EnableMatrix( "RenderMultiply", matrix )
	
	self.cmdl_LeftCuff:SetMaterial( self:GetCuffMaterial() or "" )
	self.cmdl_LeftCuff:DrawModel()
	
	// Right
	self.cmdl_RightCuff:SetPos( rpos + (rang:Forward()*wrender.right.pos.x) + (rang:Right()*wrender.right.pos.y) + (rang:Up()*wrender.right.pos.z) )
	local u,r,f = rang:Up(), rang:Right(), rang:Forward() // Prevents moving axes
	rang:RotateAroundAxis( u, wrender.right.ang.y )
	rang:RotateAroundAxis( r, wrender.right.ang.p )
	rang:RotateAroundAxis( f, wrender.right.ang.r )
	self.cmdl_RightCuff:SetAngles( rang )
	
	local matrix = Matrix()
	matrix:Scale( wrender.right.scale )
	self.cmdl_RightCuff:EnableMatrix( "RenderMultiply", matrix )
	
	self.cmdl_RightCuff:SetMaterial( self:GetCuffMaterial() or "" )
	self.cmdl_RightCuff:DrawModel()
	
	// Rope
	if (lpos.x==0 and lpos.y==0 and lpos.z==0) or (rpos.x==0 and rpos.y==0 and rpos.z==0) then return end // Rope accross half the map...
	
	if self:GetRopeMaterial()~=self.LastMatStr then
		self.RopeMat = Material( self:GetRopeMaterial() )
		self.LastMatStr = self:GetRopeMaterial()
	end
	if not self.RopeMat then self.RopeMat = Material(DefaultRope) end
	
	render.SetMaterial( self.RopeMat )
	render.DrawBeam( lpos + (lang:Forward()*wrender.rope.l.x) + (lang:Right()*wrender.rope.l.y) + (lang:Up()*wrender.rope.l.z),
		rpos + (rang:Forward()*wrender.rope.r.x) + (rang:Right()*wrender.rope.r.y) + (rang:Up()*wrender.rope.r.z),
		0.7, 0, 5, RopeCol )
end

//
// Bones
function SWEP:GetBonePos( bonename, vm )
	local bone = vm:LookupBone( bonename )
	if not bone then return end
	
	local pos,ang = Vector(0,0,0),Angle(0,0,0)
	local matrix = vm:GetBoneMatrix( bone )
	if matrix then
		pos = matrix:GetTranslation()
		ang = matrix:GetAngles()
	end
	
	if self.ViewModelFlip then ang.r = -ang.r end
	
	-- if pos.x==0 and pos.y==0 and pos.z==0 then print( bonename, vm ) end
	return pos, ang
end

--PATH addons/111mod/lua/weapons/weapon_parkour.lua:
require 'nw'

SWEP.Distance = 75
SWEP.Count = 7
SWEP.RefreshRate = 2
SWEP.PushDistance = 100
SWEP.AllowedWeaponTypes = {
	['pistol'] = true,
	['melee'] = true,
	['melee2'] = true,
	['knife'] = true
}
SWEP.Cooldown = 1
if (SERVER) then
	AddCSLuaFile()

	SWEP.Weight = 0
	SWEP.AutoSwitchFrom = false
	SWEP.AutoSwitchTo = false

	util.AddNetworkString('ShouldRoll')
	util.AddNetworkString('ShouldSlide')

else
	SWEP.PrintName = 'Паркур'
	SWEP.Slot = 2
	SWEP.SlotPos = 2
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end

SWEP.Author = ''
SWEP.Purpose = 'To Climb'
SWEP.Instructions = 'Jump with left click\nHold/let go with right click\nPush with left click\nRoll with reload'
SWEP.Category = 'RP'

SWEP.Spawnable = true
SWEP.ViewModel = 'models/weapons/v_hands.mdl'
SWEP.WorldModel = 'models/weapons/w_hands.mdl'

SWEP.Base = 'weapon_rp_base'

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = 'none'

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = 'none'

SWEP.HoldType = 'normal'


if (CLIENT) then
	local mat = Material('icon16/add.png')
	local lasttime = os.time()
	function SWEP:DrawHUD()
 		if (self.Owner != LocalPlayer()) then return end

		local count = self.Owner:GetNetVar('Jumps', 0) or 0

		surface.SetDrawColor(Color(255, 255, 255))
		surface.SetMaterial(mat)
		local m = self.Count * 32 //max width, so we can just subtract #yolo
		for i=1, count do
			local x = i * 32

			surface.DrawTexturedRect(ScrW() - x, ScrH() - 42, 32, 32)
		end

		if (count == self.Count or self.Owner:GetNetVar('IsHolding', 0) == 1) then return end

		local progress = os.time() - lasttime
		if ((os.time() - lasttime) >= self.RefreshRate) then
			lasttime = os.time()
		end
	end

	local roll = false
	local pi, tp = 0, 0
	net.Receive('ShouldRoll', function()
		roll = true
		tp = LocalPlayer():EyeAngles().p
		pi = tp - 360
	end)

	local orig, sliding = false, false
	local origa, s1, s2 = 0, 0, 0
	net.Receive('ShouldSlide', function()
		sliding = net.ReadBool()
		origa = LocalPlayer():EyeAngles().p
		s1 = LocalPlayer():EyeAngles().p
		s2 = 90
	end)

	hook.Add('CalcView', 'DoTheROll', function(ply, pos, ang, fov)
		if (roll) then
			local view = GAMEMODE:CalcView(ply, pos, ang, fov)
			pi = math.Approach(pi, tp, FrameTime() * 625)
			if (pi == tp) then roll = false end
			view.angles.p = pi
			return view
		end

		if (sliding) then //start effect
			orig = true

			local view = GAMEMODE:CalcView(ply, pos, ang, fov)
			s1 = math.Approach(s1, s2, FrameTime() * 625)
			view.angles.p = s1
			return view
		end

		if (sliding != orig) then //end effect
			local view = GAMEMODE:CalcView(ply, pos, ang, fov)
			s1 = math.Approach(s1, origa, FrameTime() * 625)
			if (s1 == origa) then sliding = false orig = false end
			view.angles.p = s1
			return view
		end
	end)

else

	function SWEP:ResetVelocity()
		self.Owner:SetLocalVelocity(Vector(0, 0, 0))
	end

	function SWEP:IsOnWall()

		if (!IsValid(self.Owner)) then return false end
		if (self.Owner.IsHolding) then return true end

		local tr = self.Owner:GetEyeTrace()//util.TraceLine(trace)
		if (IsValid(tr.Entity) and tr.Entity:IsPlayer()) then  return false end
		if (tr.HitPos:DistToSqr(self.Owner:EyePos()) <= math.pow(self.Distance, 2)) then  return true end


		return false
	end

	function SWEP:CanJump()
		if (!IsValid(self.Owner) or self.Owner:OnGround()) then return false end
		local ang = self.Owner:EyeAngles()
		if (ang.p > 0) then return false end

		self.LastUsed = self.LastUsed or os.time()
		if ((os.time() - self.LastUsed) >= self.Cooldown and self.Owner.Count > 0 and self:IsOnWall()) then
			self.LastUsed = os.time()
			return true
		end

		return false
	end

	local lasttime = os.time()
	function SWEP:Think()
		if (!IsValid(self.Owner)) then return end

		if (self.Owner.IsHolding) then
			if (self.Owner:KeyPressed(IN_JUMP)) then //jump off
				self.Owner.IsHolding = false
				if (self.Owner:GetNetVar('IsHolding') ~= 0) then
					self.Owner:SetNetVar('IsHolding', 0)
				end
				self.Owner:SetMoveType(MOVETYPE_WALK)
				self:ResetVelocity()
			elseif (self.Owner:KeyPressed(IN_SPEED)) then //slide
				self.Owner.IsHolding = false
				if (self.Owner:GetNetVar('IsHolding') ~= 0) then
					self.Owner:SetNetVar('IsHolding', 0)
				end
				self.Owner:SetMoveType(MOVETYPE_WALK)
				self:ResetVelocity()
				self.Owner:EmitSound(Sound('npc/zombie/foot_slide1.wav'))

				self.Owner.IsSliding = true
				net.Start('ShouldSlide')
					net.WriteBool(true)
				net.Send(self.Owner)
			end
		end
		
		if ( self.Owner.IsHolding or self.Owner.InJump or self.Owner.IsSliding or !self.Owner:IsOnGround()) then return end
		
		if self.Owner:GetNW2Int('gmb') > 1 then 
			self.Owner.count_gmb = 7
		else
			self.Owner.count_gmb = 5
		end
		
		if (self.Owner.Count >= self.Owner.count_gmb) then return end
		
		self.Lasttime = self.Lasttime or os.time()
		local progress = os.time() - self.Lasttime
		if ((os.time() - self.Lasttime) >= self.RefreshRate) then
			self.Lasttime = os.time()

			self.Owner.Count = self.Owner.Count + 1
			self.Owner:SetNetVar('Jumps', self.Owner.Count)
		end
	end

	hook.Add('OnPlayerHitGround', 'DoRoll', function(ply)
		if (ply.ShouldRoll) then
			net.Start('ShouldRoll')
			net.Send(ply)

			timer.Simple(2, function()
				ply.ShouldRoll = false
			end)
		end

		if (ply.IsSliding) then
			net.Start('ShouldSlide')
				net.WriteBool(false)
			net.Send(ply)

			timer.Simple(2, function()
				ply.IsSliding = false
			end)
		end

		ply.IsHolding = false
		ply.InJump = false
	end)

	hook.Add('GetFallDamage', 'StopRollSlideDamage', function(ply, hit, dmg)
		if (ply.IsSliding or ply.ShouldRoll) then
			return 0
		end
	end)

	hook.Add('PlayerDeath', 'StopStuck', function(ply)
		ply.IsHolding = false
		if (ply:GetNetVar('IsHolding') ~= 0) then
			ply:SetNetVar('IsHolding', 0)
		end
		ply:SetMoveType(MOVETYPE_WALK)
	end)

	hook.Add('PlayerSpawn', 'SetCOunt', function(ply)
		if ply:GetNW2Int('gmb') > 1 then 
			ply.Count = 7 -- GambitPlus
		else
			ply.Count = 5
		end
	end)

	hook.Add('KeyPress', 'DropPlayer', function(ply, key)
		if (!IsFirstTimePredicted()) then return end

		if (ply.IsHolding and key == IN_JUMP) then
			ply.IsHolding = false
			if (ply:GetNetVar('IsHolding') ~= 0) then
				ply:SetNetVar('IsHolding', 0)
			end
			ply:SetMoveType(MOVETYPE_WALK)
			//self:ResetVelocity()
		end
	end)
	hook.Remove('ShouldCollide', 'CHeckIfPlayerIsBeingAWhoreAndHOldingTHemselves')
	/*hook.Add('ShouldCollide', 'CHeckIfPlayerIsBeingAWhoreAndHOldingTHemselves', function(ent1, ent2)
		if (ent1:IsPlayer() and ent1.IsHolding and ent2:GetClass() == 'prop_physics' or ent2:IsPlayer() and ent2.IsHolding and ent1:GetClass() == 'prop_physics') then
			return false
		end
	end)*/
end
function SWEP:Equip()
	if (SERVER) then
		self.Owner.IsHolding = false
		self.Owner:SetNetVar('IsHolding', 0)
		self.Owner:SetMoveType(MOVETYPE_WALK)
		self:ResetVelocity()

		self.Owner.Count = self.Owner.Count or self.Count
		self.Owner:SetNetVar('Jumps', self.Owner.Count)
	end
end

function SWEP:Holster() //for switching
	if (SERVER) then
		self.Owner:DrawViewModel(true)

		if (!self.Owner.IsHolding) then
			self.Owner:DropToFloor()
		end
	end

	return true
end

function SWEP:PrimaryAttack()
	if (SERVER) then
		if (!IsFirstTimePredicted()) then return end

		local tr = self.Owner:GetEyeTrace()
		if (tr.Entity and tr.Entity:IsPlayer() and tr.Entity.IsHolding and (tr.Entity:GetPos():DistToSqr(self.Owner:GetPos()) <= math.pow(self.PushDistance, 2))) then
			tr.Entity:SetNetVar('IsHolding', 0)
			tr.Entity.IsHolding = false
			self.Owner:SetMoveType(MOVETYPE_WALK)
			self:ResetVelocity()

			return
		end

		if (!self:CanJump()) then  return end

		if (IsValid(tr.Entity) and tr.Entity:IsPlayer() or tr.Entity:IsVehicle()) then  return end

		self.Owner.Count = self.Owner.Count - 1
		self.Owner:SetNetVar('Jumps', self.Owner.Count)

		self.Owner.IsHolding = false
		self.Owner:SetNetVar('IsHolding', 0)
		self.Owner:SetMoveType(MOVETYPE_WALK)
		self:ResetVelocity()

		self.Owner:EmitSound(Sound('npc/combine_soldier/gear4.wav'), 75, 100)
		self.Owner:ViewPunch(Angle(-10, 0, 0))
		self.Owner:SetLocalVelocity(self.Owner:GetVelocity() * -1) //reset

		self.Owner:SetLocalVelocity(self.Owner:GetAimVector() * 370)
			//self.Owner:SetLocalVelocity((self.Owner:GetForward() * self.Owner:GetJumpPower()) + Vector(0, 0, self.Owner:GetJumpPower()))
		self.Owner.InJump = true
	end
end

function SWEP:SecondaryAttack()
	if (SERVER) then
		if (!IsFirstTimePredicted()) then return end

		if (self.Owner:IsOnGround() or !IsValid(self.Owner)) then return end

		local tr = self.Owner:GetEyeTrace()
		if (!self.Owner.IsHolding) then
			if (tr.HitPos:DistToSqr(self.Owner:GetPos()) > math.pow(self.Distance, 2)) then  return end
		end

		if (tr.Entity and tr.Entity:IsPlayer()) then  return end

		self.Owner.IsHolding = !self.Owner.IsHolding

		local int = self.Owner.IsHolding and 1 or 0
		if (int == 1) then
			self.Owner:ViewPunch(Angle(10, 0, 0))
			self.Owner:SetCustomCollisionCheck(true)


			self.Owner.MoveType = self.Owner:GetMoveType()
			self.Owner:SetMoveType(MOVETYPE_NONE)

			if (IsValid(tr.Entity) and tr.Entity:GetClass() == 'prop_physics') then
				self.Owner.HoldingOnto = tr.Entity:EntIndex()
				self.Owner.LastEntityPos = tr.Entity:GetPos()
			end
		else

			self.Owner:SetMoveType(MOVETYPE_WALK)
			self:ResetVelocity()
			self.Owner:SetCustomCollisionCheck(false)
		end

			//self.Owner:SetNetVar('IsHolding', int)
		self.Owner.InJump = !self.Owner.IsHolding
	end
end

function SWEP:Reload()
	if (SERVER) then
		if (!IsFirstTimePredicted()) then return end

		if (self.Owner.InJump) then
			self.Owner.ShouldRoll = !self.Owner.ShouldRoll
		end
	end

	return true
end

function SWEP:Deploy()
	self.Owner:DrawViewModel(false)
end

function SWEP:DrawWorldModel()
	return false
end

function SWEP:DrawViewModel()
	return false
end

function SWEP:Initialize()
	self:SetWeaponHoldType(self.HoldType)
	self:DrawShadow(false)

	self.Count = hook.Call('GetClimbs', GAMEMODE, self.Owner) or self.Count
end

/*hook.Add('Move', 'ShouldChangePosition', function(ply, data)
	if (ply:GetNetVar('IsHolding', 0) == 1) then
		data:SetLocalVelocity(Vector(0, 0, 0))
		return true
	end
end)*/

hook.Add('PlayerSwitchWeapon', 'AllowSwitchingWhenOnLedge', function(pl, wep1, wep2)
	if IsValid(pl) and IsValid(wep1) and IsValid(wep2) and pl.IsHolding and (wep1:GetClass() == 'weapon_climb') then
		if (not wep1.AllowedWeaponTypes[(wep2:GetHoldType() or 'normal')]) then
			return true
		end
	end
end)

nw.Register 'IsHolding'
	:Write(net.WriteBool)
	:Read(net.ReadBool)
	:SetLocalPlayer()

nw.Register 'Jumps'
	:Write(net.WriteUInt, 8)
	:Read(net.ReadUInt, 8)
	:SetLocalPlayer()
--PATH addons/vapeswep/lua/weapons/weapon_vape_golden.lua:
-- weapon_vape_golden.lua
-- Defines a vape with gold accent and shaded tank

-- Vape SWEP by Swamp Onions - http://steamcommunity.com/id/swamponions/

if CLIENT then
	include('weapon_vape/cl_init.lua')
else
	include('weapon_vape/shared.lua')
end

SWEP.PrintName = "Golden Vape"

SWEP.Instructions = "LMB: Rip Fat Clouds\n (Hold and release)\nRMB & Reload: Play Sounds\n\nAn elegant, golden vape for the classy cloud chaser."

SWEP.VapeAccentColor = Vector(1,0.8,0)
SWEP.VapeTankColor = Vector(0.1,0.1,0.1)
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
--PATH addons/vapeswep/lua/weapons/weapon_vape_medicinal.lua:
-- weapon_vape_medicinal.lua
-- Defines a vape that heals the player

-- Vape SWEP by Swamp Onions - http://steamcommunity.com/id/swamponions/

if CLIENT then
	include('weapon_vape/cl_init.lua')
else
	include('weapon_vape/shared.lua')
end

SWEP.PrintName = "Medicinal Vape"

SWEP.Instructions = "LMB: Rip Fat Clouds\n (Hold and release)\nRMB & Reload: Play Sounds\n\nThis healthy, organic juice has amazing healing abilities."

SWEP.VapeID = 3

SWEP.VapeAccentColor = Vector(0,1,0.5)
SWEP.VapeTankColor = Vector(0,0.5,0.25)

-- note: healing functionality is in weapon_vape/init.lua
--PATH addons/snowball/lua/weapons/zck_snowballswep/cl_init.lua:
include("shared.lua")
SWEP.PrintName = "Снежки"
SWEP.Slot = 1
SWEP.SlotPos = 2
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
end

function SWEP:SecondaryAttack()
	-- self:SendWeaponAnim(ACT_VM_SECONDARYATTACK)
	-- self.Owner:SetAnimation(PLAYER_ATTACK1)

	-- local tr = self.Owner:GetEyeTrace()

	-- if tr.Hit and tr.HitWorld and tr.MatType == 74 and self.Owner:GetPos():Distance(tr.HitPos) < 300 then
		-- local snowballCount = self:GetSnowballCount()

		-- if snowballCount < zck.config.Swep.MaxAmmo then
			-- self.Owner:EmitSound("zck_snowball_pickup")
			-- ParticleEffect("zck_snowball_pickup", tr.HitPos, Angle(0, 0, 0), NULL)
		-- end
	-- end
	self:SetNextSecondaryFire(CurTime() + self.Secondary.Delay)
end

function SWEP:PrimaryAttack()
	self:SendWeaponAnim(ACT_VM_THROW)
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	timer.Simple(0.5, function()
		if IsValid(self) then
			self:SendWeaponAnim(ACT_VM_DRAW)
		end
	end)
end

function SWEP:Deploy()
	self:SendWeaponAnim(ACT_VM_DRAW)
end

local wMod = ScrW() / 1920
local hMod = ScrH() / 1080
local snowball_icon = Material("materials/zerochain/zck/ui/zck_snowball.png", "smooth")
function SWEP:DrawHUD()
	-- //draw.RoundedBox(5, 900 * wMod, 975 * hMod, 100 * wMod, 100 * hMod, Color(0, 0, 0,200))

	-- surface.SetDrawColor(Color(255,255,255))
	-- surface.SetMaterial(snowball_icon)
	-- surface.DrawTexturedRect(850 * wMod, 880 * hMod, 200 * wMod, 200 * hMod)

	-- draw.DrawText(self:GetSnowballCount(), "zck_font01",950 * wMod, 910 * hMod, Color(0, 0, 0,125), TEXT_ALIGN_CENTER)
end

function SWEP:Holster(ent)
	self:SendWeaponAnim(ACT_VM_HOLSTER)
end

--PATH addons/zeros_weedfarm/lua/weapons/zwf_joint/shared.lua:
SWEP.PrintName = "Joint" // The name of your SWEP
SWEP.Author = "ZeroChain" // Your name
SWEP.Instructions = "Hold LMB: Smoke Weed | Reload: Delete Joint | MMB: Drop / Share" // How do people use your SWEP?
SWEP.Contact = "https://www.gmodstore.com/users/ZeroChain" // How people should contact you if they find bugs, errors, etc
SWEP.Purpose = "Used to smoke weed." // What is the purpose of the SWEP?
SWEP.IconLetter	= "V"

SWEP.AutomaticFrameAdvance = true

SWEP.AdminSpawnable = false // Is the SWEP spawnable for admins?
SWEP.Spawnable = false // Can everybody spawn this SWEP? - If you want only admins to spawn it, keep this false and admin spawnable true.

SWEP.ViewModelFOV = 90 // How much of the weapon do you see?
SWEP.UseHands = true
SWEP.ViewModel = "models/zerochain/props_weedfarm/zwf_joint_vm.mdl"
SWEP.WorldModel = "models/zerochain/props_weedfarm/zwf_joint_vm.mdl"


SWEP.AutoSwitchTo = true // When someone picks up the SWEP, should it automatically change to your SWEP?
SWEP.AutoSwitchFrom = false // Should the weapon change to the a different SWEP if another SWEP is picked up?
SWEP.Slot = 3 // Which weapon slot you want your SWEP to be in? (1 2 3 4 5 6)
SWEP.SlotPos = 1 // Which part of that slot do you want the SWEP to be in? (1 2 3 4 5 6)
SWEP.HoldType = "slam" // How is the SWEP held? (Pistol SMG Grenade Melee)
SWEP.FiresUnderwater = false // Does your SWEP fire under water?
SWEP.Weight = 5 // Set the weight of your SWEP.
SWEP.DrawCrosshair = true // Do you want the SWEP to have a crosshair?
SWEP.Category = "Zeros GrowOP"
SWEP.DrawAmmo = false // Does the ammo show up when you are using it? True / False
SWEP.base = "weapon_base" //What your weapon is based on.

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"
SWEP.Primary.Recoil = 1
SWEP.Primary.Delay = 1

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.Recoil = 1
SWEP.Secondary.Delay = 1


function SWEP:SetupDataTables()
    self:NetworkVar("Int", 1, "WeedID")
    self:NetworkVar("String", 0, "Weed_Name")
    self:NetworkVar("Int", 2, "Weed_THC")
    self:NetworkVar("Int", 3, "Weed_Amount")
    self:NetworkVar("Bool", 0, "IsBusy")
    self:NetworkVar("Bool", 2, "IsBurning")
    self:NetworkVar("Bool", 3, "IsSmoking")

    if (SERVER) then
        self:SetWeedID(-1)
        self:SetWeed_THC(-1)
        self:SetIsBusy(false)
        self:SetWeed_Name("NILL")
        self:SetWeed_Amount(0)
        self:SetIsBurning(false)

        self:SetIsSmoking(false)
    end
end

--PATH gamemodes/darkrp/entities/entities/arsenal/shared.lua:

-----------------------------------------------------
ENT.Base = 'base_ai'
ENT.Type = 'ai'
ENT.PrintName = 'Арсенал'
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true
ENT.Category = '@GambitEnts'

CopItems = {
	["1"] = {
		Name = "Пистолеты",
		Model = "models/Items/BoxSRounds.mdl",
		type = "pistol"
	},
	["2"] = {
		Name = "Пистолеты-пулеметы",
		Model = "models/Items/BoxMRounds.mdl",
		type = "smg1"
	},
	["3"] = {
		Name = "Дробовики",
		Model = "models/Items/BoxBuckshot.mdl",
		type = "buckshot"
	},
	["4"] = {
		Name = "Винтовки/снайперки",
		Model = "models/Items/BoxMRounds.mdl",
		type = "ar2"
	},
	
	["5"] = {
		Name = "M9K | Крупнокалиберные патроны",
		Model = "models/Items/BoxMRounds.mdl",
		type = "Rifle"
	},

	["6"] = {
		Name = "M9K | 357 Патроны",
		Model = "models/Items/BoxMRounds.mdl",
		type = "357"
	},

	['m9k_m16a4_acog'] = {
		Name = 'M16 ACOG',
		Model = 'models/weapons/w_dmg_m16ag.mdl',
		weapon = 'm9k_m16a4_acog',
		price = 9600
	},

	['m9k_f2000'] = {
		Name = 'F2000',
		Model = 'models/weapons/w_fn_f2000.mdl',
		weapon = 'm9k_f2000',
		price = 9000
	},

	['m9k_amd65'] = {
		Name = 'AMD-65',
		Model = 'models/weapons/w_amd_65.mdl',
		weapon = 'm9k_amd65',
		price = 9200
	},

	['m9k_acr'] = {
		Name = 'ACR',
		Model = 'models/weapons/w_masada_acr.mdl',
		weapon = 'm9k_acr',
		price = 9450
	},

	['m9k_val'] = {
		Name = 'AS VAL',
		Model = 'models/weapons/w_dmg_vally.mdl',
		weapon = 'm9k_val',
		price = 8500
	},

	['m9k_ithacam37'] = {
		Name = 'Ithaca M37',
		Model = 'models/weapons/w_ithaca_m37.mdl',
		weapon = 'm9k_ithacam37',
		price = 10500
	},

	['m9k_remington870'] = {
		Name = 'Remington 870',
		Model = 'models/weapons/w_remington_870_tact.mdl',
		weapon = 'm9k_remington870',
		price = 10050
	},

	['m9k_m98b'] = {
		Name = 'Barret M98B',
		Model = 'models/weapons/w_barrett_m98b.mdl',
		weapon = 'm9k_m98b',
		price = 21500
	},

	['m9k_intervention'] = {
		Name = 'Intervention',
		Model = 'models/weapons/w_snip_int.mdl',
		weapon = 'm9k_intervention',
		price = 25000
	},

	['m9k_m24'] = {
		Name = 'M24',
		Model = 'models/weapons/w_snip_m24_6.mdl',
		weapon = 'm9k_m24',
		price = 19500
	},

	['m9k_mp5sd'] = {
		Name = 'MP5SD',
		Model = 'models/weapons/w_hk_mp5sd.mdl',
		weapon = 'm9k_mp5sd',
		price = 6000
	},

	['m9k_ump45'] = {
		Name = 'UMP',
		Model = 'models/weapons/w_smg_ump45.mdl',
		weapon = 'm9k_ump45',
		price = 6300
	},

	['m9k_magpulpdr'] = {
		Name = 'Magpul PDR',
		Model = 'models/weapons/w_magpul_pdr.mdl',
		weapon = 'm9k_magpulpdr',
		price = 7800
	},

}
--PATH gamemodes/darkrp/entities/entities/base_rp/cl_init.lua:
plib.IncludeSH 'shared.lua'

function ENT:Draw()
	self:DrawModel()
	if self.Draw3D2D and self:InSight() then
		self:Draw3D2D()
	end
end

function ENT:SendPlayerUse(ignoreValidate)
	net.Start 'rp.EntityUse'
		net.WriteEntity(self)
		net.WriteBool(ignoreValidate == true)
	net.SendToServer()
end

function ENT:ReadPlayerUse()

end

function ENT:BasicPriceMenu()
	if IsValid(self.Menu) then self.Menu:Close() end

	local ent = self

	if (ent:GetPos():Distance(LocalPlayer():GetPos()) >= 80) then return end

	local w, h = 160, 160
	self.Menu = ui.Create('ui_frame', function(self)
		self:SetTitle(ent.PrintName)
		self:SetSize(w, h)
		self:Center()
		self:MakePopup()
		self.Think = function()
			if (not IsValid(ent)) or (ent:GetPos():Distance(LocalPlayer():GetPos()) >= 80) then
				ent.Menu:Close()
			end
		end
		self:Center()
	end)

	ui.Create('rp_entity_priceset', function(self, p)
		self:SetEntity(ent)
		self:SetPos(p:GetDockPos())
		self:SetWide(w - 10)
	end, self.Menu)

	ui.Create('DButton', function(self, p)
		self:SetPos(5, h - 35)
		self:SetSize(w - 10, 30)
		self:SetText('Buy')
		self.DoClick = function()
			ent:SendPlayerUse()
		end
	end, self.Menu)
end

net('rp.EntityUse', function()
	local ent = net.ReadEntity()

	if ent.PlayerUse then
		ent:PlayerUse(ent:ReadPlayerUse())
	end
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
--PATH addons/mod_bitminers2/lua/entities/bm2_bitminer_1/shared.lua:
ENT.Type = "anim"

ENT.PrintName = "Bitminer 1"
ENT.Spawnable = true
ENT.Category = "Bitminers 2"

ENT.upgrades = {
	CPU = {name = "CPU Speed +256MHz", cost = {2000,400,8000,16000,320000, 64000, 128000}, amountPerUpgrade = 0.256},
	CORES = {name = "Adds an extra core", cost = {2500, 10000, 25000}}
}

function ENT:SetupDataTables()
	self:NetworkVar( "Bool", 1, "HasPower" )
	self:NetworkVar( "Bool", 2, "IsOn")
	self:NetworkVar( "Bool", 3, "IsMining")
	self:NetworkVar( "Float", 1, "BitcoinAmount")
	self:NetworkVar( "Int", 1, "CPUUpgrade")
	self:NetworkVar( "Int", 2, "CoreUpgrade")  
	self:NetworkVar( "Float", 3, "ClockSpeed")
	self:NetworkVar( "Int", 4, "CoreCount")
	//A string table of all the updates that have been purchased.
	self:NetworkVar( "String", 1, "Updates") 
	self:NetworkVar("Entity", 0, "owning_ent")
end


--PATH addons/bricks_gangs/lua/entities/bricks_server_gangprinter/cl_init.lua:
include('shared.lua')
local refreshPanel = true
local backMat = Material( "bricks_server/back.png" )
local cursorMat = Material( "bricks_server/cursor.png" )
function ENT:CreateVGUI()
	if( IsValid( self.printerVGUI )  ) then
		self.printerVGUI:Remove()
	end

	if( not IsValid( self.printerVGUI )  ) then
		local outerMargin, innerSpacing = 15*0.8, 10*0.8
		
		self.printerVGUI = vgui.Create( "DPanel" )
		self.printerVGUI:SetPos( 0, 0 )
		self.printerVGUI:SetSize( BRICKS_SERVER.DEVCONFIG.GangPrinterW, BRICKS_SERVER.DEVCONFIG.GangPrinterH )
		local cursorX, cursorY = 0, 0
		self.printerVGUI.Paint = function( self2, w, h )
			surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 1 ) )
			surface.DrawRect( 0, 0, w, h )

			if( IsValid( self.printerVGUI.Cursor ) ) then
				local lerpPercent = RealFrameTime()*10
				cursorX = Lerp( lerpPercent, cursorX, gui.MouseX()+1 )
				cursorY = Lerp( lerpPercent, cursorY, gui.MouseY()+1 )

				self.printerVGUI.Cursor:SetPos( cursorX, cursorY )
			end
		end
		self.printerVGUI.CreateCursor = function( self2 )
			if( IsValid( self.printerVGUI.Cursor ) ) then
				self.printerVGUI.Cursor:Remove()
			end

			self.printerVGUI.Cursor = vgui.Create( "DPanel", self.printerVGUI )
			self.printerVGUI.Cursor:SetSize( 16*0.8, 16*0.8 )
			self.printerVGUI.Cursor.Paint = function( self2, w, h )
				surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
				surface.SetMaterial( cursorMat )
				surface.DrawTexturedRect( 0, 0, w, h )
			end
		end

		local topPanel = vgui.Create( "DPanel", self.printerVGUI )
		topPanel:Dock( TOP )
		topPanel:DockMargin( outerMargin, outerMargin, outerMargin, 0 )
		topPanel:SetTall( 88*0.8 )
		topPanel.Paint = function( self2, w, h ) end

		local gangTable = (BRICKS_SERVER_GANGS or {})[self:GetGangID()]
		local printerConfigTable = BRICKS_SERVER.CONFIG.GANGPRINTERS.Printers[self:GetPrinterID()] or {}

		local gangPanel = vgui.Create( "DPanel", topPanel )
		gangPanel:Dock( LEFT )
		gangPanel:SetWide( (self.printerVGUI:GetWide()-(2*outerMargin)-innerSpacing)/2 )
		local greyTextCol = Color( BRICKS_SERVER.Func.GetTheme( 6 ).r, BRICKS_SERVER.Func.GetTheme( 6 ).g, BRICKS_SERVER.Func.GetTheme( 6 ).b, 25 )
		local iconMat
		BRICKS_SERVER.Func.GetImage( (gangTable or {}).Icon or "question.png", function( mat ) 
			iconMat = mat 
		end )
		gangPanel.Paint = function( self2, w, h )
			draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )

			local iconBackSize, iconBackSpacing, iconSize = h-22, 11, ((gangTable or {}).Icon and h-22-10) or 32
			draw.RoundedBox( 8, iconBackSpacing, iconBackSpacing, iconBackSize, iconBackSize, BRICKS_SERVER.Func.GetTheme( 2 ) )

			draw.SimpleText( ((gangTable or {}).Name or "Unknown"), "BRICKS_SERVER_NoSC_Font33", iconBackSpacing+iconBackSize+20, h/2+2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_BOTTOM )
			draw.SimpleText( (printerConfigTable.Name or "Printer 0"), "BRICKS_SERVER_NoSC_Font24", iconBackSpacing+iconBackSize+20, h/2-2, greyTextCol, 0, 0 )

			if( iconMat ) then
				surface.SetDrawColor( 255, 255, 255, 255 )
				surface.SetMaterial( iconMat )
				surface.DrawTexturedRect( (h/2)-(iconSize/2), (h/2)-(iconSize/2), iconSize, iconSize )
			end
		end

		local healthPercents = {
			{ 0.75, Color( 182, 209, 42 ) },
			{ 0.50, Color( 209, 131, 42 ) },
			{ 0.25, Color( 209, 87, 42 ) },
			{ 0.10, Color( 209, 42, 42 ) }
		}

		local healthPanel = vgui.Create( "DPanel", topPanel )
		healthPanel:Dock( FILL )
		healthPanel:DockMargin( innerSpacing, 0, 0, 0 )
		healthPanel.Paint = function( self2, w, h )
			draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )

			draw.SimpleText( "HEALTH", "BRICKS_SERVER_NoSC_Font24", 23*0.8, 15*0.8, Color( 255, 255, 255, 25 ), 0, 0 )

			local barH, barSideMargin = 13*0.8, 23*0.8
			draw.RoundedBox( barH/2, barSideMargin, 45*0.8, w-(2*barSideMargin), barH, BRICKS_SERVER.Func.GetTheme( 3 ) )

			local healthPercent = math.Clamp( self:Health()/self:GetTotalHealth(), 0, 1 )

			local healthColor = Color( 70, 200, 112 )
			for k, v in ipairs( healthPercents ) do
				if( healthPercent <= v[1] ) then
					healthColor = v[2]
				else
					break
				end
			end

			draw.RoundedBox( 8, barSideMargin, 45*0.8, (w-(2*barSideMargin))*healthPercent, barH, healthColor )
		end

		-- Progress Bars
		local ProgressBars = {}
		table.insert( ProgressBars, { "MONEY", function() 
			return DarkRP.formatMoney( self:GetHolding() or 0 )
		end, function()
			return 1
		end, true } )

		table.insert( ProgressBars, { "INCOME", function() 
			return DarkRP.formatMoney( self:GetPrintAmount() ) .. " / " .. self:GetPrintTime() .. "s"
		end, function()
			if( self:GetPrintTime() <= 0 ) then return 1 end

			return (self:GetNextPrint() > 0 and 1-((self:GetNextPrint()-CurTime())/self:GetPrintTime())) or 1
		end } )

		table.insert( ProgressBars, { "TEMPERATURE", function() 
			return self:GetTemperature() .. "°C"
		end, function()
			return 1
		end, true } )

		local radius, arcWidth, mainArcWidth = 80*0.8, 2, 6
		local spacing = ((self.printerVGUI:GetWide()-(2*outerMargin))-(#ProgressBars*radius*2))/(#ProgressBars+1)

		local statisticsPanel = vgui.Create( "DPanel", self.printerVGUI )
		statisticsPanel:Dock( TOP )
		statisticsPanel:DockMargin( outerMargin, innerSpacing, outerMargin, 0 )
		statisticsPanel:SetTall( (radius+spacing)*2 )
		statisticsPanel.Paint = function( self2, w, h )
			draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )
		end

		for k, v in ipairs( ProgressBars ) do
			local progressPanel = vgui.Create( "DPanel", statisticsPanel )
			progressPanel:Dock( LEFT )
			progressPanel:DockMargin( spacing, 0, 0, 0 )
			progressPanel:SetWide( radius*2 )
			local cachedArc, oldValue, cachedArcBack
			progressPanel.Paint = function( self2, w, h )
				BRICKS_SERVER.Func.DrawCircle( w/2, h/2, w/2-(mainArcWidth/2)+(arcWidth/2), BRICKS_SERVER.Func.GetTheme( 2 ) )
				BRICKS_SERVER.Func.DrawCircle( w/2, h/2, (w/2-(mainArcWidth/2)+(arcWidth/2))-arcWidth, BRICKS_SERVER.Func.GetTheme( 0 ) )

				if( not v[4] and 360*v[3]() < 360 ) then
					local newValue = v[3]()
					if( newValue != oldValue ) then
						cachedArc = BRICKS_SERVER.Func.PrecachedArc( w/2, h/2, w/2, mainArcWidth, 90-(360*v[3]()), 90 )
						oldValue = newValue
					end
					
					BRICKS_SERVER.Func.DrawCachedArc( cachedArc, BRICKS_SERVER.Func.GetTheme( 5 ) )
				else
					BRICKS_SERVER.Func.DrawCircle( w/2, h/2, w/2, BRICKS_SERVER.Func.GetTheme( 5 ) )
					BRICKS_SERVER.Func.DrawCircle( w/2, h/2, (w/2)-mainArcWidth, BRICKS_SERVER.Func.GetTheme( 0 ) )
				end
				
				draw.SimpleText( v[2](), "BRICKS_SERVER_NoSC_Font24", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				draw.SimpleText( v[1], "BRICKS_SERVER_NoSC_Font24", w/2, h/2+radius+15, Color( 255, 255, 255, 25 ), TEXT_ALIGN_CENTER, 0 )
			end
		end

		local graphPanel = vgui.Create( "DPanel", self.printerVGUI )
		graphPanel:Dock( TOP )
		graphPanel:DockMargin( outerMargin, innerSpacing, outerMargin, 0 )
		graphPanel:SetTall( 333*0.8 )
		graphPanel.Paint = function( self2, w, h )
			draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )

			draw.SimpleText( "INCOME", "BRICKS_SERVER_NoSC_Font24", 23, 21, Color( 255, 255, 255, 25 ), 0, 0 )
		end

		local income, lineDistance
		function self.printerVGUI.RefreshIncomeGraph()
			income = self.IncomeTrackTable or {}
			lineDistance = 30

			for k, v in ipairs( income ) do
				surface.SetFont( "BRICKS_SERVER_NoSC_Font17" )
				local displayValue = math.ceil( (v >= 100 and v/1000) or v )
				local textX, textY = surface.GetTextSize( ((v >= 100 and displayValue .. "k") or displayValue) )
				local newLineDistance = textX+20
	
				if( newLineDistance > lineDistance ) then
					lineDistance = newLineDistance
				end
			end
		end
		self.printerVGUI.RefreshIncomeGraph()

		local lineCount, circleRadius = 11, 4
		local graphLinesPanel = vgui.Create( "DPanel", graphPanel )
		graphLinesPanel:Dock( FILL )
		graphLinesPanel:DockMargin( 25, 65, 25, 0 )
		graphLinesPanel.Paint = function( self2, w, h )
			local sortedIncome = table.Copy( income )
			table.sort( sortedIncome, function(a, b) return a < b end )
			local lowestValue = sortedIncome[1] or 0
			local highestValue = sortedIncome[#sortedIncome] or 0

			local lineDifference = (highestValue-lowestValue)/(lineCount-1)
			local lowerBound = lowestValue
			local upperBound = highestValue

			for i = 1, lineCount do
				local lineValue = lowerBound+((i-1)*lineDifference)
				
				surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
				surface.DrawRect( lineDistance, (i-1)*(h/lineCount), w-lineDistance, 1 )

				local displayValue = math.ceil( (lineValue >= 100 and lineValue/1000) or lineValue )
				draw.SimpleText( ((lineValue >= 100 and displayValue .. "k") or displayValue), "BRICKS_SERVER_NoSC_Font17", lineDistance/2, h-(i*(h/lineCount))-1, BRICKS_SERVER.Func.GetTheme( 5 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			end

			local lineTotalH = h-(h/lineCount)
			local previousCircleX, previousCircleY
			for k, v in ipairs( income ) do
				local circleX, circleY = lineDistance+(((w-lineDistance)/(self.IncomeTrackAmount-1))*(k-1)), lineTotalH-(((v-lowerBound)/(upperBound-lowerBound))*lineTotalH)

				draw.NoTexture()
				surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 5 ) )
				BRICKS_SERVER.Func.DrawCircle( circleX, circleY, circleRadius, 45 )	
					
				if( previousCircleX and previousCircleY ) then
					surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 5 ) )
					surface.DrawLine( previousCircleX, previousCircleY, circleX, circleY )
				end

				previousCircleX, previousCircleY = circleX, circleY
			end

			for k, v in ipairs( income ) do
				local circleX, circleY = lineDistance+(((w-lineDistance)/(self.IncomeTrackAmount-1))*(k-1)), lineTotalH-(((v-lowerBound)/(upperBound-lowerBound))*lineTotalH)

				draw.NoTexture()
				surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
				BRICKS_SERVER.Func.DrawCircle( circleX, circleY, circleRadius-2, 45 )	
			end
		end

		local bottomPanel = vgui.Create( "DPanel", self.printerVGUI )
		bottomPanel:Dock( FILL )
		bottomPanel.Paint = function( self2, w, h ) end

		local bottomLeftPanel = vgui.Create( "DPanel", bottomPanel )
		bottomLeftPanel:Dock( LEFT )
		bottomLeftPanel:DockMargin( outerMargin, innerSpacing, 0, outerMargin )
		bottomLeftPanel:SetWide( (self.printerVGUI:GetWide()-(2*outerMargin)-innerSpacing)/2 )
		bottomLeftPanel.Paint = function( self2, w, h )
			draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )

			draw.SimpleText( "HISTORY", "BRICKS_SERVER_NoSC_Font24", 23, 21, Color( 255, 255, 255, 25 ), 0, 0 )
		end

		local bottomRightPanel = vgui.Create( "DPanel", bottomPanel )
		bottomRightPanel:Dock( RIGHT )
		bottomRightPanel:DockMargin( 0, innerSpacing, outerMargin, outerMargin )
		bottomRightPanel:SetWide( (self.printerVGUI:GetWide()-(2*outerMargin)-innerSpacing)/2 )
		bottomRightPanel.Paint = function( self2, w, h ) end

		local buttonBack = vgui.Create( "DPanel", bottomRightPanel )
		buttonBack:Dock( TOP )
		buttonBack:SetTall( 46*0.8 )
		buttonBack.Paint = function( self2, w, h ) end

		local toggleButton = vgui.Create( "DButton", buttonBack )
		toggleButton:Dock( RIGHT )
		toggleButton:DockMargin( innerSpacing, 0, 0, 0 )
		toggleButton:SetWide( 150*0.8 )
		toggleButton:SetText( "" )
		toggleButton.Paint = function( self2, w, h )
			draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )

			local buttonColor = Color( 70, 200, 112 )
			local poly = {
				{ x = w/2-10, y = h },
				{ x = w/2-10, y = 0 },
				{ x = w/2+10, y = 0 }
			}

			if( self:GetStatus() ) then
				draw.RoundedBoxEx( 8, 0, 0, w/2-10, h, buttonColor, true, false, true, false )
			else
				buttonColor = Color( 218, 51, 56 )
				draw.RoundedBoxEx( 8, w/2+10, 0, w/2-10, h, buttonColor, false, true, false, true )

				poly = {
					{ x = w/2-10, y = h },
					{ x = w/2+10, y = 0 },
					{ x = w/2+10, y = h }
				}
			end

			surface.SetDrawColor( buttonColor )
			draw.NoTexture()
			surface.DrawPoly( poly )

			draw.SimpleText( "ON", "BRICKS_SERVER_NoSC_Font20", w/4, h/2, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			draw.SimpleText( "OFF", "BRICKS_SERVER_NoSC_Font20", w/4*3, h/2, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
		toggleButton.DoClick = function()
			net.Start( "BRS.Net.GangPrinterToggle" )
				net.WriteEntity( self )
			net.SendToServer()
		end

		local withdrawButton = vgui.Create( "DButton", buttonBack )
		withdrawButton:Dock( FILL )
		withdrawButton:SetText( "" )
		withdrawButton.Paint = function( self2, w, h )
			draw.RoundedBox( 8, 0, 0, w, h, Color( 218, 51, 56 ) )

			draw.SimpleText( "WITHDRAW MONEY", "BRICKS_SERVER_NoSC_Font20", w/2, h/2, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
		withdrawButton.DoClick = function()
			net.Start( "BRS.Net.GangPrinterWithdraw" )
				net.WriteEntity( self )
			net.SendToServer()
		end

		local menuPanel = vgui.Create( "DPanel", bottomRightPanel )
		menuPanel:Dock( FILL )
		menuPanel:DockMargin( 0, innerSpacing, 0, 0 )
		menuPanel:DockPadding( 0, 21+40, 0, 0 )
		menuPanel.Paint = function( self2, w, h )
			draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 0 ) )

			draw.SimpleText( "MENU", "BRICKS_SERVER_NoSC_Font24", 23, 21, Color( 255, 255, 255, 25 ), 0, 0 )
		end

		local pages = {
			{
				Name = "UPGRADES",
				Icon = Material( "bricks_server/printer_upgrade.png" ),
				Element = "bricks_server_gangprinter_upgrades"
			}
		}

		for k, v in ipairs( pages ) do
			surface.SetFont( "BRICKS_SERVER_NoSC_Font20" )
			local textX, textY = surface.GetTextSize( v.Name )

			local button = vgui.Create( "DButton", menuPanel )
			button:Dock( TOP )
			button:DockMargin( 20, 0, 20, 12 )
			button:SetTall( 40*0.8 )
			button:SetText( "" )
			local Alpha = 0
			button.Paint = function( self2, w, h ) 
				if( self2.Hovered ) then
					Alpha = math.Clamp( Alpha+10, 0, 255 )
				else
					Alpha = math.Clamp( Alpha-10, 0, 255 )
				end
			
				draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )

				surface.SetAlphaMultiplier( Alpha/255 )
				draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
				surface.SetAlphaMultiplier( 1 )

				local iconSize = 16
				surface.SetDrawColor( 255, 255, 255, 50 )
				surface.SetMaterial( v.Icon )
				surface.DrawTexturedRect( (w/2)-(textX/2)-5-iconSize, (h/2)-(iconSize/2), iconSize, iconSize )

				draw.SimpleText( v.Name, "BRICKS_SERVER_NoSC_Font20", w/2, h/2, Color( 255, 255, 255, 50 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			end
			button.DoClick = function()
				if( IsValid( self.printerVGUI.printerPage ) ) then
					self.printerVGUI.printerPage:Remove()
				end

				surface.SetFont( "BRICKS_SERVER_NoSC_Font40" )
				local textX, textY = surface.GetTextSize( v.Name )

				self.printerVGUI.printerPage = vgui.Create( "DPanel", self.printerVGUI )
				self.printerVGUI.printerPage:SetSize( self.printerVGUI:GetWide(), self.printerVGUI:GetTall() )
				self.printerVGUI.printerPage:SetPos( 0, 0 )
				self.printerVGUI.printerPage.Paint = function( self2, w, h )
					surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 1 ) )
					surface.DrawRect( 0, 0, w, h )

					draw.RoundedBox( 8, 12, 12, 75+textX+36, 75, BRICKS_SERVER.Func.GetTheme( 0 ) )
		
					draw.SimpleText( v.Name, "BRICKS_SERVER_NoSC_Font40", 24+51+25, 12+(75/2)-2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
				end

				local backButton = vgui.Create( "DButton", self.printerVGUI.printerPage )
				backButton:SetSize( 51, 51 )
				backButton:SetPos( 24, 24 )
				backButton:SetText( "" )
				local Alpha = 0
				backButton.Paint = function( self2, w, h ) 
					if( self2.Hovered ) then
						Alpha = math.Clamp( Alpha+10, 0, 255 )
					else
						Alpha = math.Clamp( Alpha-10, 0, 255 )
					end
				
					draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
	
					surface.SetAlphaMultiplier( Alpha/255 )
					draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 5 ) )
					surface.SetAlphaMultiplier( 1 )
	
					surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
					surface.SetMaterial( backMat )
					local iconSize = 24
					surface.DrawTexturedRect( (w/2)-(iconSize/2), (h/2)-(iconSize/2), iconSize, iconSize )
				end
				backButton.DoClick = function()
					self.printerVGUI.printerPage:Remove()
				end

				local pageContent = vgui.Create( v.Element, self.printerVGUI.printerPage )
				pageContent:Dock( FILL )
				pageContent:DockMargin( 0, 12+75, 0, 0 )
				pageContent:FillPanel( self )

				self.printerVGUI.CreateCursor()
			end
		end

		self.printerVGUI.CreateCursor()
	end
end

function ENT:OnRemove()
	if( IsValid( self.printerVGUI ) ) then
		self.printerVGUI:Remove()
	end
end

function ENT:Draw()
	self:DrawModel()

	local Distance = LocalPlayer():GetPos():DistToSqr( self:GetPos() )

	if( Distance >= BRICKS_SERVER.CONFIG.GENERAL["3D2D Display Distance"] ) then return end

	if( not IsValid( self.printerVGUI ) or refreshPanel ) then
		self:CreateVGUI()
		refreshPanel = false
	end

	local Pos = self:GetPos()
	local Ang = self:GetAngles()

	//TOP PANEL
	Ang:RotateAroundAxis(Ang:Up(), 90)
	Ang:RotateAroundAxis(Ang:Up(), 90)
	Ang:RotateAroundAxis(Ang:Forward(), 90)
	Ang:RotateAroundAxis(Ang:Right(), 270)
	Ang:RotateAroundAxis(Ang:Forward(), -5.6)

	vgui.Start3D2D( Pos+(Ang:Up() * 30.55)-(Ang:Forward()*11.35)-(Ang:Right()*45.03), Ang, 0.03/0.8 )
		self.printerVGUI:Paint3D2D()
	vgui.End3D2D()

	if( not self:HasRequestTimer() ) then
		self:CreateRequestTimer()
	end
end

function ENT:HasRequestTimer()
	return timer.Exists( tostring( self ) .. "_GangPrinterRequestTimer" )
end

function ENT:CreateRequestTimer()
	net.Start( "BRS.Net.GangPrinterIncomeTrackRequest" )
		net.WriteEntity( self )
	net.SendToServer()

	local timerID = tostring( self ) .. "_GangPrinterRequestTimer"
	timer.Create( timerID, (BRICKS_SERVER.CONFIG.GANGPRINTERS["Income Update Time"] or 10), 0, function()
		if( not IsValid( self ) or not IsValid( LocalPlayer() ) or LocalPlayer():GetPos():DistToSqr( self:GetPos() ) >= BRICKS_SERVER.CONFIG.GENERAL["3D2D Display Distance"] ) then 
			timer.Remove( timerID )
			return 
		end

		net.Start( "BRS.Net.GangPrinterIncomeTrackRequest" )
			net.WriteEntity( self )
		net.SendToServer()
	end )
end

net.Receive( "BRS.Net.GangPrinterIncomeTrackSend", function()
	local printerEntity = net.ReadEntity()

	if( not IsValid( printerEntity ) ) then return end

	printerEntity.IncomeTrackTable = net.ReadTable() or {}

	if( IsValid( printerEntity.printerVGUI  ) and printerEntity.printerVGUI.RefreshIncomeGraph ) then
		printerEntity.printerVGUI.RefreshIncomeGraph()
	end
end )
--PATH addons/bricks_gangs/lua/entities/bricks_server_territory/cl_init.lua:
include('shared.lua')

function ENT:Initialize()
	self.flagMaterial = CreateMaterial( "brs_flag_material_entid" .. self:EntIndex(), "UnlitGeneric", {} )
	self.flagRenderTarget = GetRenderTarget( "brs_flag_rendertarget_entid" .. self:EntIndex(), 1004, 704, false )

	self.flagMaterial:SetTexture( "$basetexture", self.flagRenderTarget )
end

local iconMat
local iconRequested = false
local displayDistance = 500000
function ENT:Draw()
	self:DrawModel()

    local position = self:GetPos()
    local angles = self:GetAngles()

	angles:RotateAroundAxis( angles:Forward(), 90)

	angles.y = LocalPlayer():EyeAngles().y - 90

	local Distance = LocalPlayer():GetPos():DistToSqr( self:GetPos() )

	local w, h = 200, 50
	local x, y = 25, 0

	local territoryKey = self:GetTerritoryKey()
	local territoryTable = BRICKS_SERVER.Func.GangTerritoryExists( territoryKey )

	if( not territoryTable ) then return end
	
	local territoryConfig = BRICKS_SERVER.CONFIG.GANGS.Territories[territoryKey] or {}
	local territoryGangTable = (BRICKS_SERVER_GANGNAMES or {})[(territoryTable or {}).GangID or 0] or {}

	if( Distance < displayDistance ) then
		surface.SetAlphaMultiplier( math.Clamp( 1-(Distance/displayDistance), 0, 1 ) )
		cam.Start3D2D( self:GetPos()+self:GetUp()*55, angles, 0.1 )
			draw.RoundedBox( 5, x, y, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )

			local capturePercent = (territoryTable.Claimed and 1) or 0

			if( IsValid( self:GetCaptor() ) ) then
				if( (self:GetCaptureEndTime() or 0) > 0 ) then
					capturePercent = math.Clamp( (BRICKS_SERVER.CONFIG.GANGS["Territory Capture Time"]-(self:GetCaptureEndTime()-CurTime()))/BRICKS_SERVER.CONFIG.GANGS["Territory Capture Time"], 0, 1 )
				else
					capturePercent = math.Clamp( 1-((BRICKS_SERVER.CONFIG.GANGS["Territory Capture Time"]-(self:GetUnCaptureEndTime()-CurTime()))/BRICKS_SERVER.CONFIG.GANGS["Territory Capture Time"]), 0, 1 )
				end
			end

			local border = 5
			draw.RoundedBox( 5, x+border, y+border, (w-2*border)*capturePercent, h-(2*border), territoryConfig.Color or BRICKS_SERVER.Func.GetTheme( 5 ) )
		cam.End3D2D()

		local bottomW, bottomH, iconSize = 240, 310, 128
		local bottomX, bottomY = -(bottomW/2), 0

		local function drawBottomInfo()
			surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 0 ) )
			surface.DrawRect( bottomX, bottomY, bottomW, bottomH )
			draw.SimpleText( territoryConfig.Name, "BRICKS_SERVER_Font50", bottomX+bottomW/2, 65, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
			draw.SimpleText( BRICKS_SERVER.Func.L( "gangTerritoryUpper" ), "BRICKS_SERVER_Font25", bottomX+bottomW/2, 65, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, 0 )

			if( territoryTable.Claimed ) then
				draw.SimpleText( BRICKS_SERVER.Func.L( "gangCaptured" ), "BRICKS_SERVER_Font30", bottomX+bottomW/2, bottomY+(bottomH/2)-(iconSize/2)+25-5, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )

				if( territoryTable.IconMat ) then
					surface.SetDrawColor( 255, 255, 255, 255 )
					surface.SetMaterial( territoryTable.IconMat )
					surface.DrawTexturedRect( bottomX+(bottomW/2)-(iconSize/2), bottomY+(bottomH/2)-(iconSize/2)+25, iconSize, iconSize )
				else
					BRICKS_SERVER.Func.RequestTerritoryIconMat( territoryKey )
				end

				draw.SimpleText( (territoryGangTable.Name or BRICKS_SERVER.Func.L( "nil" )), "BRICKS_SERVER_Font40", bottomX+bottomW/2, bottomY+(bottomH/2)+(iconSize/2)+25+5, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, 0 )
			end
		end

		local angles = self:GetAngles()
		angles:RotateAroundAxis( angles:Forward(), 90)

		cam.Start3D2D( self:GetPos()+self:GetUp()*17.4+self:GetRight()*12.8, angles, 0.05 )
			drawBottomInfo()
		cam.End3D2D()

		angles:RotateAroundAxis( angles:Right(), 90)

		cam.Start3D2D( self:GetPos()+self:GetUp()*17.4-self:GetForward()*12.8, angles, 0.05 )
			drawBottomInfo()
		cam.End3D2D()
		
		angles:RotateAroundAxis( angles:Right(), 90)

		cam.Start3D2D( self:GetPos()+self:GetUp()*17.4-self:GetRight()*12.8, angles, 0.05 )
			drawBottomInfo()
		cam.End3D2D()

		angles:RotateAroundAxis( angles:Right(), 90)

		cam.Start3D2D( self:GetPos()+self:GetUp()*17.4+self:GetForward()*12.8, angles, 0.05 )
			drawBottomInfo()
		cam.End3D2D()
		surface.SetAlphaMultiplier( 1 )

		-- Draw flag color and logo
		local w, h, iconSize = 1004, 704, 600
		render.PushRenderTarget( self.flagRenderTarget )
			render.Clear( 0, 0, 0, 0, true, true ) 
			cam.Start2D()
				surface.SetDrawColor( territoryConfig.Color or BRICKS_SERVER.Func.GetTheme( 5 ) )
				surface.DrawRect( 0, 0, w, h )

				if( territoryTable.Claimed ) then
					if( territoryTable.IconMat ) then
						surface.SetDrawColor( 255, 255, 255, 255 )
						surface.SetMaterial( territoryTable.IconMat )
						surface.DrawTexturedRect( (w/2)-(900/2), (h/2)-(650/2), 900, 650 )
					else
						BRICKS_SERVER.Func.RequestTerritoryIconMat( territoryKey )
					end
				end
			cam.End2D()
		render.PopRenderTarget()
		
		self:SetSubMaterial( 2, "!brs_flag_material_entid" .. self:EntIndex() )
	end
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

--PATH addons/the_cocaine_factory/lua/entities/cocaine_battery/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Battery"
ENT.Author = "Crap-Head"
ENT.Category = "The Cocaine Factory"
ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:SetupDataTables()	
	self:NetworkVar( "Int", 0, "HP" )
	
	self:NetworkVar( "Entity", 0, "owning_ent" ) -- darkrp owner support
end
--PATH addons/the_cocaine_factory/lua/entities/cocaine_stove/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Stove"
ENT.Author = "Mikael, Nvs2000 & Crap-Head"
ENT.Category = "The Cocaine Factory"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:SetupDataTables()
	self:NetworkVar( "Bool", 1, "Plate1" )
	self:NetworkVar( "Bool", 2, "Plate2" )
	self:NetworkVar( "Bool", 3, "Plate3" )
	self:NetworkVar( "Bool", 4, "Plate4" )

	self:NetworkVar( "Int", 0, "Celious1" )
	self:NetworkVar( "Int", 1, "Celious2" )
	self:NetworkVar( "Int", 2, "Celious3" )
	self:NetworkVar( "Int", 3, "Celious4" )
	self:NetworkVar( "Int", 5, "GasAmount" )
	
	self:NetworkVar( "Int", 6, "HP" )
	
	self:NetworkVar( "Entity", 0, "owning_ent" ) -- darkrp owner support
end

TCF.Config.StovePos = {
	dpos1 = Vector(19.000000, -16.000000, 43.000000),
	dpos2 = Vector(22.000000, -11.000000, 33.000000),
	dpos3 = Vector(19.000000, -9.000000, 43.000000),
	dpos4 = Vector(22.000000, -4.000000, 33.000000), 
	dpos5 = Vector(19.000000, -3.000000, 43.000000),
	dpos6 = Vector(22.000000, 1.000000,33.000000), 
	dpos7 = Vector(19.000000, 2.000000, 43.000000),
	dpos8 = Vector(22.000000, 7.000000,33.000000)
}
--PATH addons/111mod/lua/entities/donation_box/cl_init.lua:
include("shared.lua")

if CLIENT then 
surface.CreateFont("xuy",{font = "Tahoma",size = 32,weight = 1700,shadow = true, antialias = true}) -- or eto)0
end

function ENT:Initialize()
end

function ENT:Draw()
	self:DrawModel()

	local Pos = self:GetPos()
	local Ang = self:GetAngles()

	local owner = self:Getowning_ent()
	owner = (IsValid(owner) and owner:Nick()) or DarkRP.getPhrase("unknown")
	owner = owner
	
	surface.SetFont("xuy")
	local TextWidth = surface.GetTextSize(owner)
	local TextWidth2 = surface.GetTextSize("Donations: $" .. self:Getmoneys())

	Ang:RotateAroundAxis(Ang:Up(), 90)
	Ang:RotateAroundAxis(Ang:Forward(), 76.5)

	cam.Start3D2D(Pos + (Ang:Right() * -20) + (Ang:Up() * -14.51) , Ang, 0.11)
		stext( owner, "xuy", 0, -30, Color(255,255,255,255), TEXT_ALIGN_CENTER )
		stext( "Баланс: " .. self:Getmoneys().."$", "xuy", 0, 0, Color(255,255,255,255), TEXT_ALIGN_CENTER )
	cam.End3D2D()
end

function ENT:Think()
end

--PATH addons/bricks_gangs/lua/entities/ent_npcorg/cl_init.lua:
include('shared.lua')

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
		draw_SimpleTextOutlined('Организации', '3d2d', 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, color_black)
		cam_End3D2D()
	end
end
--PATH addons/bricks_gangs/lua/entities/ent_npcorg/shared.lua:
ENT.Type = 'ai'
ENT.Base = 'base_ai'
ENT.PrintName = 'Создание банды'
ENT.Spawnable = true
ENT.Category = 'GambitRP | Банды'
--PATH addons/111mod/lua/entities/ent_picture1/shared.lua:
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
--PATH addons/truefishing/lua/entities/fish_bait/shared.lua:
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Fish Bait"
ENT.Author			= "Tomasas"

--PATH addons/casino/lua/entities/gambling_machine_basicslots/shared.lua:
ENT.Type 		= 'anim'
ENT.Base 		= 'base_gmodentity'
ENT.PrintName 	= 'Казино - Слоты'
ENT.Spawnable 	= true
ENT.Category 	= 'RP Machines'

ENT.CanSetPrice = true
ENT.Casino = true
ENT.MinPrice = 500
ENT.MaxPrice = 1000000
function ENT:SetupDataTables()
	self:NetworkVar('Bool', 0, 'InService')
	self:NetworkVar('Bool', 1, 'IsPayingOut')
	self:NetworkVar('Entity', 1, 'owning_ent')
	self:NetworkVar('Int', 1, 'Roll1')
	self:NetworkVar('Int', 2, 'Roll2')
	self:NetworkVar('Int', 3, 'Roll3')
	self:NetworkVar('Int', 4, 'price')
end

--PATH gamemodes/darkrp/entities/entities/gmod_cameraprop.lua:
AddCSLuaFile()

if (CLIENT) then
    CreateConVar("cl_drawcameras", "1", 0, "Should the cameras be visible?")
end

ENT.Type = "anim"
ENT.PrintName = "Camera"
local CAMERA_MODEL = Model("models/dav0r/camera.mdl")

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "Key")
    self:NetworkVar("Bool", 0, "On")
    self:NetworkVar("Vector", 0, "vecTrack")
    self:NetworkVar("Entity", 0, "entTrack")
    self:NetworkVar("Entity", 1, "Player")
end

-- Custom drive mode
function ENT:GetEntityDriveMode()
    return "drive_noclip"
end

function ENT:Initialize()
    if (SERVER) then
        self:SetModel(CAMERA_MODEL)
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:DrawShadow(false)
        -- Don't collide with the player
        self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
        local phys = self:GetPhysicsObject()

        if (IsValid(phys)) then
            phys:Sleep()
        end
    end
end

function ENT:SetTracking(Ent, LPos)
    if (IsValid(Ent)) then
        self:SetMoveType(MOVETYPE_NONE)
        self:SetSolid(SOLID_BBOX)
    else
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
    end

    self:NextThink(CurTime())
    self:SetvecTrack(LPos)
    self:SetentTrack(Ent)
end

function ENT:SetLocked(locked)
    if (locked == 1) then
        self.PhysgunDisabled = true
        self:SetMoveType(MOVETYPE_NONE)
        self:SetSolid(SOLID_BBOX)
        self:SetCollisionGroup(COLLISION_GROUP_WORLD)
    else
        self.PhysgunDisabled = false
    end

    self.locked = locked
end

function ENT:OnTakeDamage(dmginfo)
    if (self.locked) then return end
    self:TakePhysicsDamage(dmginfo)
end

function ENT:OnRemove()
    if (IsValid(self.UsingPlayer)) then
        self.UsingPlayer:SetViewEntity(self.UsingPlayer)
    end
end

if (SERVER) then
    numpad.Register("Camera_On", function(pl, ent)
        if (not IsValid(ent)) then return false end
        pl:SetViewEntity(ent)
        pl.UsingCamera = ent
        ent.UsingPlayer = pl
    end)

    numpad.Register("Camera_Toggle", function(pl, ent, idx, buttoned)
        -- The camera was deleted or something - return false to remove this entry
        if (not IsValid(ent)) then return false end
        if (not IsValid(pl)) then return false end

        -- Something else changed players view entity
        if (pl.UsingCamera and pl.UsingCamera == ent and pl:GetViewEntity() ~= ent) then
            pl.UsingCamera = nil
            ent.UsingPlayer = nil
        end

        if (pl.UsingCamera and pl.UsingCamera == ent) then
            pl:SetViewEntity(pl)
            pl.UsingCamera = nil
            ent.UsingPlayer = nil
        else
            pl:SetViewEntity(ent)
            pl.UsingCamera = ent
            ent.UsingPlayer = pl
        end
    end)

    numpad.Register("Camera_Off", function(pl, ent)
        if (not IsValid(ent)) then return false end

        if (pl.UsingCamera and pl.UsingCamera == ent) then
            pl:SetViewEntity(pl)
            pl.UsingCamera = nil
            ent.UsingPlayer = nil
        end
    end)
end

function ENT:Think()
    if (CLIENT) then
        self:TrackEntity(self:GetentTrack(), self:GetvecTrack())
    end
end

function ENT:TrackEntity(ent, lpos)
    if (not IsValid(ent)) then return end
    local WPos = ent:LocalToWorld(lpos)

    if (ent:IsPlayer()) then
        WPos = WPos + ent:GetViewOffset() * 0.85
    end

    local CamPos = self:GetPos()
    local Ang = WPos - CamPos
    Ang = Ang:Angle()
    self:SetAngles(Ang)
end

function ENT:CanTool(ply, trace, mode, tool, click)
    if (self:GetMoveType() == MOVETYPE_NONE) then return false end

    return true
end

function ENT:Draw(flags)
    if (GetConVarNumber("cl_drawcameras") == 0) then return end
    -- Don't draw the camera if we're taking pics
    local wep = LocalPlayer():GetActiveWeapon()
    if (IsValid(wep) and wep:GetClass() == "gmod_camera") then return end
    self:DrawModel(flags)
end

function ENT:OnTakeDamage(dmg)
	if self.burningup then return end
	self.damage = (self.damage or 100) - dmg:GetDamage()
	if self.damage <= 0 then
		self:Destruct()
		self:Remove()
	end
end

function ENT:Destruct()
	local vPoint = self:GetPos()
	local effectdata = EffectData()
	effectdata:SetStart(vPoint)
	effectdata:SetOrigin(vPoint)
	effectdata:SetScale(1)
	util.Effect("Explosion", effectdata)

	if self:GetPlayer():IsValid() then
		DarkRP.notify(self:GetPlayer(), 1, 4, "Ваша камера была уничтожена")
	end
end
--PATH addons/111mod/lua/entities/moneyevent/shared.lua:
ENT.Base = "base_gmodentity";
ENT.Type = "anim";

ENT.PrintName		= "Деньги";
ENT.Category 		= "@GambitEnts";
ENT.Author			= "TravkaCode";

ENT.Purpose 		= "";
ENT.Instructions 	= "Just drag and drop into addon folder!" ;


ENT.Spawnable			= true;
ENT.AdminSpawnable		= true;

--PATH addons/rptip/lua/entities/rp_box/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Коробка"
ENT.Author = "Arthur"
ENT.Category = "@GambitEnts"
ENT.Spawnable = true
ENT.AdminSpawnable = true
--PATH addons/111mod/lua/entities/spawn_trash/cl_init.lua:
include('shared.lua')

function ENT:Draw()

    self:DrawModel()
	
	local Pos = self:GetPos()
	local Ang = self:GetAngles()
	local color = Color( 229,228,226 )
	local color_two = Color( 44,15,226 )

	Ang:RotateAroundAxis(Ang:Up(), 90)

	Ang:RotateAroundAxis(Ang:Right(), 0)
	

	cam.Start3D2D(Pos + Ang:Up() * 17, Ang, 0.2)
	
		surface.SetDrawColor( 0, 0, 0, 150)
		
		surface.DrawRect( -200, -90, 405, 178 )
		
		surface.SetDrawColor( color )
		
		surface.DrawOutlinedRect(-200, -90, 405, 178 )


		draw.SimpleText( "Конфискат", "DermaLarge",-110, -80, color, 0, 0 )
		
		draw.SimpleText( "Принтеры : 500 - 1500 Р", "Trebuchet24",-185, -30, color_two, 0, 0 )
		
		draw.SimpleText( "Наркотики : 70 - 150 Р", "Trebuchet24",-185, 0, color_two, 0, 0 )
		
		draw.SimpleText( "Оружие : 600 - 3500 Р", "Trebuchet24",-185, 30, color_two, 0, 0 )

		
		surface.SetDrawColor( color )
		
		surface.DrawOutlinedRect( -175, -45, 350, 0 )

	cam.End3D2D()
	
end

--PATH addons/111mod/lua/entities/travka_ent/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
end

function ENT:Draw()
	self:DrawModel()

	local Pos = self:GetPos()
	local Ang = self:GetAngles()

	Ang:RotateAroundAxis(Ang:Forward(), 90)
	Ang:RotateAroundAxis(Ang:Right(), -90)
end

function ENT:Think()
end
--PATH addons/111mod/lua/entities/travka_stol/cl_init.lua:
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

function ENT:Draw()
    self:DrawModel()
    local Pos = self:GetPos()
	local Ang = self:GetAngles()
	local pAng = EyeAngles()

	Ang:RotateAroundAxis(Ang:Forward(), 90)
	Ang:RotateAroundAxis(Ang:Right(), -90)

	local text = "Стол"
	local text2 = "Нажми Е что бы положить"
	local text3 = ""

	if LocalPlayer():GetPos():Distance(self:GetPos()) < 300 then
		cam.Start3D2D(Pos + Ang:Up() * 1 + Ang:Right() * -25, Ang, 0.1)
			draw.SimpleText( text, "npc", 0,0, Color(70,130,208), 1,1 )
		cam.End3D2D()
		if LocalPlayer():GetPos():Distance(self:GetPos()) < 300 then
			cam.Start3D2D(Pos + Ang:Up() * 1 + Ang:Right() * -20, Ang, 0.1)
				local x,y = draw.SimpleText( text2, "npc2", 0,0, Color(255,255,255), 1,1 )
				surface.SetDrawColor(255, 255, 255, 255)
				draw.SimpleText( text3, "npc", 0,45, Color(255,255,255), 1,1 )
			cam.End3D2D()
		end
	end
end

ENT.RenderGroup = RENDERGROUP_OPAQUE
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_fuel_nozzle/cl_init.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

include('shared.lua')

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Initialize() self.VC_PVsb = util.GetPixelVisibleHandle() end
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_pickup_exhaust/shared.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.
ENT.Base 		= "base_anim"
ENT.Type 		= "anim"
ENT.PrintName	= "Vehicle part: exhaust"
ENT.Author		= "freemmaann"
ENT.Category	= "VCMod"

ENT.Spawnable = true
ENT.AdminSpawnable = true

ENT.VC_Type = "carpart"
ENT.VC_Method = "exhaust"
ENT.VC_CanBeDamaged = false
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_pickup_fuel_electricity/cl_init.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

include('shared.lua')

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Initialize() self.VC_Color = Color(0,255,255,255) self.VC_Length = 142 self.VC_Text = "Vehicle Fuel 25%" self.VC_PVsb = util.GetPixelVisibleHandle() end
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_pickup_fuel_electricity/shared.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.
ENT.Base 		= "base_anim"
ENT.Type 		= "anim"
ENT.PrintName	= "Car battery, 1.3 kWh"
ENT.Author		= "freemmaann"
ENT.Category	= "VCMod"

ENT.Spawnable = true
ENT.AdminSpawnable = true

ENT.VC_Type = "fuel"
ENT.VC_FuelType = 2
ENT.VC_Storage = 0.7645
ENT.VC_MaxStorage = 0.7645
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_pickup_healthkit_100/cl_init.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

include('shared.lua')

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Initialize() self.VC_Color = Color(100, 255, 55, 255) self.VC_Length = 225 self.VC_Text = "Vehicle Repair 100%" self.VC_PVsb = util.GetPixelVisibleHandle() end
--PATH addons/zeros_methlab2/lua/entities/zmlab2_dropoff/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Model = "models/zerochain/props_methlab/zmlab2_dropoff.mdl"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "DropOff"
ENT.Category = "Zeros Methlab 2"
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 1, "IsClosed")

    if (SERVER) then
        self:SetIsClosed(true)
    end
end

function ENT:GravGunPunt()
	return false
end
function ENT:GravGunPickupAllowed()
	return false
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

--PATH addons/zeros_methlab2/lua/entities/zmlab2_item_frezzertray/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zmlab2.FrezzerTray.Initialize(self)
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	self:DrawModel()
	zmlab2.FrezzerTray.Draw(self)
end

--PATH addons/zeros_methlab2/lua/entities/zmlab2_machine_furnace/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Model = "models/zerochain/props_methlab/zmlab2_furnance.mdl"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Furnace"
ENT.Category = "Zeros Methlab 2"
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:SetupDataTables()
    self:NetworkVar("Int", 1, "AcidAmount")
    self:NetworkVar("Int", 2, "Temperatur")
    self:NetworkVar("Int", 3, "Heater")

    self:NetworkVar("Int", 4, "ProcessState")
    self:NetworkVar("Int", 5, "HeatingStart")

    /*
        0 = Needs more Acid
        1 = Press the Start Button
        2 = Is Heating Acid
        3 = Requieres heat change
        4 = Acid is ready and needs to be pumped to next machine
        5 = Moving Acid (Loading)
        6 = Needs to be cleaned
    */

    if (SERVER) then
        self:SetAcidAmount(0)
        self:SetTemperatur(0)
        self:SetHeater(0)
        self:SetProcessState(0)
        self:SetHeatingStart(0)
    end
end

function ENT:OnIncrease(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)

    if lp.x > -25 and lp.x < -22 and lp.y < 14 and lp.y > 10 and lp.z > 52 and lp.z < 55 then
        return true
    else
        return false
    end
end

function ENT:OnDecrease(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)

    if lp.x > -12.7 and lp.x < -11 and lp.y < 14 and lp.y > 10 and lp.z > 52 and lp.z < 55 then
        return true
    else
        return false
    end
end

function ENT:OnStart(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)

    if lp.x > -23 and lp.x < -12 and lp.y < 14 and lp.y > 10 and lp.z > 51 and lp.z < 56.5 then
        return true
    else
        return false
    end
end

function ENT:OnErrorButton(ply)
    local trace = ply:GetEyeTrace()
    local lp = self:WorldToLocal(trace.HitPos)

    if lp.x > -23 and lp.x < -12 and lp.y < 14 and lp.y > 10 and lp.z > 51 and lp.z < 56.5 then
        return true
    else
        return false
    end
end


// Returns the start position and direction for a hose
function ENT:GetHose_Out()
    local attach = self:GetAttachment(1)
    local ang = attach.Ang
    ang:RotateAroundAxis(ang:Up(),90)
    return attach.Pos - ang:Up() * 1,ang
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

--PATH addons/zeros_methlab2/lua/entities/zmlab2_npc/shared.lua:
ENT.Base = "base_ai"
ENT.Type = "ai"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/Humans/Group03/male_07.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "NPC"
ENT.Category = "Zeros Methlab 2"
ENT.RenderGroup = RENDERGROUP_BOTH

--PATH addons/zeros_methlab2/lua/entities/zmlab2_tent_door/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zmlab2.TentDoor.Initialize(self)
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	self:DrawModel()
	zmlab2.TentDoor.Draw(self)
end

function ENT:Think()
	self:SetNextClientThink(CurTime())
	zmlab2.TentDoor.Think(self)

	return true
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_bong_ent/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Model = "models/zerochain/props_weedfarm/zwf_bong01.mdl"
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.PrintName = "Bong"
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

--PATH addons/zeros_weedfarm/lua/entities/zwf_mixer/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_mixer.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Mixer"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_OPAQUE


function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "HasBowl")
    self:NetworkVar("Bool", 1, "HasDough")

    self:NetworkVar("Int", 0, "WeedID")
    self:NetworkVar("Float", 0, "WeedAmount")
    self:NetworkVar("Float", 1, "THC")

    // 0 = idle, 1 = open , 2 = close , 3 = run
    self:NetworkVar("Int", 1, "WorkState")

    if (SERVER) then
        self:SetWorkState(0)
        self:SetHasBowl(true)
        self:SetHasDough(false)

        self:SetWeedID(-1)
        self:SetWeedAmount(0)
        self:SetTHC(0)
    end
end

function ENT:OnRemoveButton(ply)
    local trace = ply:GetEyeTrace()

    local lp = self:WorldToLocal(trace.HitPos)

    if lp.x > -12 and lp.x < 4 and lp.y < 12 and lp.y > 11 and lp.z > 9 and lp.z < 20 then
        return true
    else
        return false
    end
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_mixer_bowl/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zwf.f.EntList_Add(self)
end

function ENT:Draw()
	self:DrawModel()
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_seed/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_weedseed.mdl"
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.PrintName = "Seed"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "SeedID")

    self:NetworkVar("Int", 1, "Perf_Time")
    self:NetworkVar("Int", 2, "Perf_Amount")
    self:NetworkVar("Int", 3, "Perf_THC")

    self:NetworkVar("Int", 4, "SeedCount")

    self:NetworkVar("String", 0, "SeedName")


    if (SERVER) then
        self:SetSeedID(0)
    end
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_soil/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zwf.f.EntList_Add(self)
end

function ENT:Draw()
	self:DrawModel()
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_watertank/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zwf.f.EntList_Add(self)
	self.Cached_Rope = false
	self.RopeRefresh = true
	self.LastWater = -1
end

function ENT:Draw()
	self:DrawModel()

	if GetConVar("zwf_cl_vfx_drawui"):GetInt() == 1 and zwf.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 700) then
		self:DrawUI()
	end
end


function ENT:DrawUI()
	local Pos = self:GetPos() + self:GetRight() * -33 + self:GetUp() * 33

	local Ang = self:GetAngles()
	Ang:RotateAroundAxis(self:GetRight(),-180)
	Ang:RotateAroundAxis(self:GetForward(),-90)
	Ang:RotateAroundAxis(self:GetForward(),180)


	local _water = self:GetWater()

	cam.Start3D2D(Pos, Ang, 0.1)

		//BG
		draw.RoundedBox(5, -140 , -25, 280, 50,  zwf.default_colors["gray02"])

		//Water Bar
		if _water > 0 then

			local newWaterLvl = (280 / zwf.config.WaterTank.Capacity) * _water
			if self.LastWater ~= newWaterLvl then
				self.LastWater = self.LastWater + 100 * FrameTime()
				self.LastWater = math.Clamp(self.LastWater, 0, newWaterLvl)
			end

			draw.RoundedBox(5, -140 , -25,  self.LastWater, 50, zwf.default_colors["water"])
		end

		draw.SimpleText( _water .. zwf.config.UoL,"zwf_watertank_font01", 0, 0, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)


		if self:RefillButton(LocalPlayer()) then
			draw.RoundedBox(15, -280 / 2 , -90, 280, 50,  zwf.default_colors["orange03"])

			local cost =  (zwf.config.WaterTank.Capacity - _water) * zwf.config.WaterTank.RefillCostPerUnit

			draw.SimpleText( zwf.config.Currency .. cost, "zwf_watertank_font01", 0, -65, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		else

			draw.RoundedBox(15,  -280 / 2 , -90, 280, 50,  zwf.default_colors["gray01"])
			draw.SimpleText(zwf.language.General["watertank_refill"],"zwf_watertank_font01", 0, -65, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		end

		draw.SimpleTextOutlined( zwf.language.General["watertank_title"], "zwf_watertank_font01", 0, -125,zwf.default_colors["white01"], TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER, 2,zwf.default_colors["water"] )

		//draw.SimpleText( zwf.language.General["watertank_title"],"zwf_watertank_font01", 0, -125, zwf.default_colors["gray01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	cam.End3D2D()

end

--PATH addons/zeros_weedfarm/lua/entities/zwf_weedstick/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_weedstick.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "WeedStick"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:SetupDataTables()
    self:NetworkVar("Float", 0, "WeedAmount")
    self:NetworkVar("Float", 1, "StartDryTime")
    self:NetworkVar("Int",1,"Progress")
    if (SERVER) then
        self:SetWeedAmount(50)
        self:SetStartDryTime(-1)
        self:SetProgress(-1)
    end
end

--PATH addons/m9k/lua/effects/m9k_effect_mad_ricochet_trace/init.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/effects/m9k_effect_mad_ricochet_trace/init.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

EFFECT.Mat = Material("effects/yellowflare")

/*---------------------------------------------------------
   EFFECT:Init(data)
---------------------------------------------------------*/
function EFFECT:Init(data)

	self.StartPos 	= data:GetStart()	
	self.EndPos 	= data:GetOrigin()
	self.Dir 		= self.EndPos - self.StartPos
	self.Entity:SetRenderBoundsWS(self.StartPos, self.EndPos)
	
	self.TracerTime 	= 0.4
	
	// Die when it reaches its target
	self.DieTime 	= CurTime() + self.TracerTime
	
	// Play ricochet sound with random pitch
	
	local vGrav 	= Vector(0, 0, -450)
	local Dir 		= self.Dir:GetNormalized()
	
	local emitter = ParticleEmitter(self.StartPos)
	
	for i = 1, 10 do
	
		local particle = emitter:Add("effects/yellowflare", self.StartPos)
		
			particle:SetVelocity((Dir + VectorRand() * 0.5) * math.Rand(50, 150))
			particle:SetDieTime(math.Rand(0.5, 2))
			particle:SetStartAlpha(255)
			particle:SetStartSize(math.Rand(2, 4))
			particle:SetEndSize(0)
			particle:SetRoll(0)
			particle:SetGravity(vGrav * 0.4)
			particle:SetCollide(true)
			particle:SetBounce(0.8)
			particle:SetAirResistance(50)
			particle:SetStartLength(0.2)
			particle:SetEndLength(0)
			particle:SetVelocityScale(true)
			particle:SetCollide(true)
	end
	
		local particle = emitter:Add("effects/yellowflare", self.StartPos)

			particle:SetDieTime(0.1)
			particle:SetStartAlpha(255)
			particle:SetStartSize(128)
			particle:SetEndSize(0)
			particle:SetRoll(math.Rand(0, 360))
			
		local particle = emitter:Add("effects/yellowflare", self.StartPos)

			particle:SetDieTime(0.4)
			particle:SetStartAlpha(255)
			particle:SetStartSize(32)
			particle:SetEndSize(0)
			particle:SetRoll(math.Rand(0, 360))
				
	emitter:Finish()
	
	local dlight = DynamicLight(0)
		if (dlight) then
			dlight.Pos 		= self.StartPos
			dlight.r 		= 255
			dlight.g 		= 255
			dlight.b 		= 255
			dlight.Brightness = 4
			dlight.size 	= 64
			dlight.DieTime 	= CurTime() + 0.1
		end
end

/*---------------------------------------------------------
   THINK
---------------------------------------------------------*/
function EFFECT:Think()

	if (CurTime() > self.DieTime) then return false end
	
	return true
end

/*---------------------------------------------------------
   Draw the effect
---------------------------------------------------------*/
function EFFECT:Render()

	local fDelta = (self.DieTime - CurTime()) / self.TracerTime
	fDelta = math.Clamp(fDelta, 0, 1)
			
	render.SetMaterial(self.Mat)
	
	local sinWave = math.sin(fDelta * math.pi)
	
	local color = Color(255, 255, 255, 255 * fDelta)
	
	render.DrawBeam(self.StartPos, self.EndPos, 8 * fDelta, 0.5, 0.5, color)
end
--PATH addons/enc_scripts/lua/es/_vgui/cl_esbutton.lua:
local PANEL = {} // new panel without unnecessary functions

function PANEL:OnCursorEntered()
    self:SetCursor('hand')
    chat.PlaySound() // hover sound
end

function PANEL:OnCursorExited()
    self:SetCursor('arrow')
    chat.PlaySound() // hover sound
end

function PANEL:OnMousePressed(key)
    if key ~= MOUSE_LEFT then return end
    if not self.DoClick then return end // no function??

    self:DoClick()
end

vgui.Register('GButton', PANEL, 'Panel')
--PATH addons/itemstore_new/lua/itemstore/language.lua:
﻿itemstore.Language = {}
LANGUAGE = {}
include("languages/" .. itemstore.config.Language .. ".lua")

if SERVER then
    AddCSLuaFile("languages/" .. itemstore.config.Language .. ".lua")
end

itemstore.Language = LANGUAGE
LANGUAGE = nil
assert(itemstore.Language, "[ItemStore] Language not found")

function itemstore.Translate(trans, ...)
    return string.format(itemstore.Language[trans] or trans, ...)
end
--PATH addons/itemstore_new/lua/itemstore/items/microwave.lua:
﻿ITEM.Name = itemstore.Translate("microwave_name")
ITEM.Description = itemstore.Translate("microwave_desc")
ITEM.Model = "models/props/cs_office/microwave.mdl"
ITEM.HighlightColor = itemstore.config.HighlightColours.Factories
ITEM.Base = "base_darkrp"

function ITEM:SaveData(ent)
    self:SetData("Price", ent:Getprice())
    self:SetData("Owner", ent:Getowning_ent())
end

function ITEM:LoadData(ent)
    ent:Setprice(self:GetData("Price"))
    local owner = self:GetData("Owner")

    if not IsValid(owner) then
        owner = player.GetAll()[1]
    end

    ent:Setowning_ent(owner)
end
--PATH addons/itemstore_new/lua/itemstore/items/spawned_money.lua:
﻿ITEM.Name = itemstore.Translate("money_name")
ITEM.Description = itemstore.Translate("money_desc")
ITEM.Model = "models/props/cs_assault/money.mdl"
ITEM.HighlightColor = itemstore.config.HighlightColours.Money
ITEM.Base = "base_darkrp"
ITEM.Stackable = true
ITEM.DropStack = true
ITEM.MaxStack = math.huge

function ITEM:FormatAmount()
    return GAMEMODE.Config.currency .. self:GetAmount()
end

function ITEM:Use(pl)
    itemstore.gamemodes.GiveMoney(pl, self:GetAmount())

    return true
end

function ITEM:SaveData(ent)
    self:SetAmount(ent:Getamount())
end

function ITEM:LoadData(ent)
    ent:Setamount(self:GetAmount())
end
--PATH addons/itemstore_new/lua/itemstore/items/spawned_weapon.lua:
﻿ITEM.Name = itemstore.Translate("weapon_name")
ITEM.Description = itemstore.Translate("weapon_desc")
ITEM.Model = "models/weapons/w_pistol.mdl"
ITEM.HighlightColor = itemstore.config.HighlightColours.Weapons
ITEM.Base = "base_darkrp"
ITEM.Stackable = true

ITEM.Weapons = {
    weapon_physgun = itemstore.Translate("weapon_physgun"),
    weapon_physcannon = itemstore.Translate("weapon_physcannon"),
    weapon_crowbar = itemstore.Translate("weapon_crowbar"),
    weapon_stunstick = itemstore.Translate("weapon_stunstick"),
    weapon_pistol = itemstore.Translate("weapon_pistol"),
    weapon_357 = itemstore.Translate("weapon_357"),
    weapon_smg1 = itemstore.Translate("weapon_smg1"),
    weapon_ar2 = itemstore.Translate("weapon_ar2"),
    weapon_annabelle = itemstore.Translate("weapon_annabelle"),
    weapon_shotgun = itemstore.Translate("weapon_shotgun"),
    weapon_crossbow = itemstore.Translate("weapon_crossbow"),
    weapon_frag = itemstore.Translate("weapon_frag"),
    weapon_rpg = itemstore.Translate("weapon_rpg"),
    weapon_slam = itemstore.Translate("weapon_slam"),
    weapon_bugbait = itemstore.Translate("weapon_bugbait")
}

function ITEM:IsValid()
    return self.Weapons[self:GetData("Class")] or weapons.Get(self:GetData("Class"))
end

function ITEM:GetWeaponClass(wep)
    return wep.GetWeaponClass and wep:GetWeaponClass() or wep.weaponclass
end

function ITEM:GetName()
    local name = self.Name

    if self.Weapons[self:GetData("Class")] then
        name = self.Weapons[self:GetData("Class")]
    end

    local wep_class = weapons.Get(self:GetData("Class"))

    if wep_class and wep_class.PrintName then
        name = wep_class.PrintName
    end

    return self:GetData("Name", name)
end

function ITEM:GetDescription()
    local desc = self.Description
    local clip = self:GetData("Clip1", 0)
    local reserve = self:GetData("Ammo", 0)

    return self:GetData("Description", string.format(desc, clip, reserve))
end

function ITEM:CanPickup(pl, ent)
    if self.MaxStack < ent:Getamount() then return false end
    if ent.PlayerUse then return false end
    if not weapons.Get(self:GetData("Class")) and not self.Weapons[self:GetData("Class")] then return false end
    if itemstore.config.DisabledItems[self:GetData("Class")] then return false end

    return true
end

function ITEM:CanMerge(item)
    return self.Stackable and item:GetClass() == self:GetClass() and item:GetData("Class") == self:GetData("Class") and self.MaxStack >= self:GetAmount() + item:GetAmount()
end

function ITEM:Merge(item)
    self:SetAmount(self:GetAmount() + item:GetAmount())
    self:SetData("Clip2", item:GetData("Clip2", 0) + self:GetData("Clip2", 0))
    self:SetData("Ammo", item:GetData("Ammo", 0) + self:GetData("Ammo", 0) + item:GetData("Clip1", 0))
end

-- 76561198255721288
function ITEM:Split(amount)
    self:SetAmount(self:GetAmount() - amount)
    local item = self:Copy()
    item:SetAmount(amount)
    self:SetData("Clip1", 0)
    self:SetData("Clip2", 0)
    self:SetData("Ammo", 0)

    return item
end

function ITEM:SaveData(ent)
    self:SetData("Class", self:GetWeaponClass(ent))
    self:SetData("Amount", ent:Getamount())
    self:SetData("Model", ent:GetModel())

    if ent.clip1 then
        self:SetData("Clip1", ent.clip1)
    end

    if ent.clip2 then
        self:SetData("Clip2", ent.clip2)
    end

    self:SetData("Ammo", ent.ammoadd and ent.ammoadd or 0)
    --[[local reserve = 0

    if ent.clip1 and ent:Getamount() > 1 then
        reserve = reserve + ent.clip1 * (ent:Getamount() - 1)
    end

    if ent.ammoadd then
        reserve = reserve + ent.ammoadd * ent:Getamount()
    end

    self:SetData("Ammo", reserve)]]
end

function ITEM:LoadData(ent)
    ent:SetModel(self:GetData("Model"))
    ent:Setamount(1)

    if ent.GetWeaponClass then
        ent:SetWeaponClass(self:GetData("Class"))
    else
        ent.weaponclass = self:GetData("Class")
    end

    ent.clip1 = math.floor(self:GetData("Clip1", 0) / ent:Getamount())
    ent.clip2 = math.floor(self:GetData("Clip2", 0) / ent:Getamount())
    ent.ammoadd = math.floor(self:GetData("Ammo", 0) / ent:Getamount())
    self:SetData("Clip1", 0)
    self:SetData("Clip2", 0)
    self:SetData("Ammo", 0)

    function ent:Initialize()
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:SetUseType(SIMPLE_USE)
        self:GetPhysicsObject():Wake()
        self:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE_DEBRIS)
    end
end

local hl2_ammo = {
    weapon_pistol = 3,
    weapon_357 = 5,
    weapon_smg1 = 4,
    weapon_ar2 = 1,
    weapon_annabelle = 7,
    weapon_shotgun = 7,
    weapon_crossbow = 6,
    weapon_frag = 10,
    weapon_rpg = 8,
}

function ITEM:Use(pl)
	if pl:isArrested() then return false end
    local class = self:GetData("Class")
    if not self.Weapons[class] and not weapons.Get(class) then return false end
    local has_weapon = pl:HasWeapon(class)
    local wep_table = weapons.Get(class)
    local ammo, ammo_type

    if wep_table then
        ammo_type = wep_table.Primary.Ammo
    else
        ammo_type = hl2_ammo[class]
    end

    if ammo_type then
        ammo = pl:GetAmmoCount(ammo_type)
    end

    pl:Give(class)

    if ammo and ammo_type then
        pl:SetAmmo(ammo, ammo_type)
    end

    local wep = pl:GetWeapon(class)
    -- make sure we actually gave the weapon before we start deducting stuff
    if not IsValid(wep) then return end

    if self:GetData("Clip1") then
        if has_weapon then
            pl:GiveAmmo(self:GetData("Clip1"), wep:GetPrimaryAmmoType())
        else
            wep:SetClip1(self:GetData("Clip1"))
        end
    end

    if self:GetData("Clip2") then
        if has_weapon then
            pl:GiveAmmo(self:GetData("Clip2"), wep:GetSecondaryAmmoType())
        else
            wep:SetClip2(self:GetData("Clip2"))
        end
    end

    self:SetData("Clip1", 0)
    self:SetData("Clip2", 0)

    if itemstore.config.SplitWeaponAmmo then
        if self:GetData("Ammo") then
            local reserve = self:GetData("Ammo")
            local amount = self:GetAmount()
            local ammo = math.min(math.ceil(reserve / amount), reserve)
            pl:GiveAmmo(ammo, wep:GetPrimaryAmmoType())
            self:SetData("Ammo", reserve - ammo)
        end
    else
        pl:GiveAmmo(self:GetData("Ammo", 0), wep:GetPrimaryAmmoType())
        self:SetData("Ammo", 0)
    end

    return self:TakeOne()
end
--PATH addons/itemstore_new/lua/itemstore/modules/shops/config.lua:
-- The size of playermade shop items
itemstore.config.ShopSize = { 4, 4, 1 }

-- The default size of admin made NPC shops. This is changable!
itemstore.config.NPCShopSize = { 8, 4, 1 }
--PATH addons/itemstore_new/lua/itemstore/cl_gui.lua:
﻿include("skins/" .. itemstore.config.Skin .. ".lua")

for _, filename in ipairs(file.Find("itemstore/vgui/*.lua", "LUA")) do
    include("vgui/" .. filename)
end

itemstore.ContextInventory = nil

function itemstore.CreateContextInventory()
    if not itemstore.config.ContextInventory then return end
    if not IsValid(g_ContextMenu) then return end
    local inv = vgui.Create("ItemStoreContainerWindow", g_ContextMenu)
    inv:SetTitle(itemstore.Translate("inventory"))
    inv:SetContainerID(LocalPlayer().InventoryID)
    inv:ShowCloseButton(false)
    inv:SetDraggable(false)
    inv:InvalidateLayout(true)
    local side = itemstore.config.ContextInventoryPosition

    if side == "bottom" then
        inv:SetPos(ScrW() / 2 - inv:GetWide() / 2, ScrH() - inv:GetTall())
    elseif side == "bottomleft" then
        inv:SetPos(0, ScrH() - inv:GetTall())
    elseif side == "bottomright" then
        inv:SetPos(ScrW() - inv:GetWide(), ScrH() - inv:GetTall())
    elseif side == "top" then
        inv:SetPos(ScrW() / 2 - inv:GetWide() / 2, 0)
    elseif side == "topleft" then
        inv:SetPos(0, 0)
    elseif side == "topright" then
        inv:SetPos(ScrW() - inv:GetWide(), 0)
    elseif side == "left" then
        inv:SetPos(0, ScrH() / 2 - inv:GetTall() / 2)
    elseif side == "right" then
        inv:SetPos(ScrW() - inv:GetWide(), ScrH() / 2 - inv:GetTall() / 2)
    end

    itemstore.ContextInventory = inv
end

hook.Add("Tick", "ItemStoreHideContextInventory", function()
    if not IsValid(LocalPlayer()) then return end

    if IsValid(itemstore.ContextInventory) then
        itemstore.ContextInventory:SetVisible(LocalPlayer():CanUseInventory())
    else
        if LocalPlayer().InventoryID then
            itemstore.CreateContextInventory()
        end
    end
end)

hook.Add("ContextMenuCreated", "ItemStoreInventory", function(context)
    if not IsValid(context) then return end

    context:Receiver("ItemStore", function(receiver, droppable, dropped)
        local container_id = droppable[1]:GetContainerID()
        local slot = droppable[1]:GetSlot()

        if dropped then
            LocalPlayer():DropItem(container_id, slot)
        end
    end)
end)

net.Receive("ItemStoreRecreateContextMenu", function()
    if IsValid(itemstore.ContextInventory) then
        itemstore.ContextInventory:Remove()
        itemstore.ContextInventory = nil
    end
end)
--PATH addons/itemstore_new/lua/itemstore/vgui/slot.lua:
﻿local PANEL = {}

surface.CreateFont("ItemStoreAmount", {
    font = system.IsLinux() and "DejaVu Sans" or "Tahoma",
    size = 11,
    weight = 500
})

local GradientUp = Material("gui/gradient_up")
local GradientDown = Material("gui/gradient_down")
AccessorFunc(PANEL, "Item", "Item")
AccessorFunc(PANEL, "ContainerID", "ContainerID", FORCE_NUMBER)
AccessorFunc(PANEL, "Slot", "Slot", FORCE_NUMBER)

function PANEL:Init()
    self.BaseClass.Init(self)
    self:Droppable("ItemStore")

    self:Receiver("ItemStore", function(receiver, droptable, dropped)
        local droppable = droptable[1]
        if not dropped then return end
        local droppable = droptable[1]
        local from_con = droppable:GetContainerID()
        local to_con = droppable:GetContainerID()
        if not from_con then return end
        if not to_con then return end
        local from_slot = droppable:GetSlot()
        local to_slot = receiver:GetSlot()
        if not from_slot then return end
        if not to_slot then return end
        local from_item = droppable:GetItem()
        local to_item = receiver:GetItem()

        if from_item and to_item and (from_item:CanMerge(to_item) or from_item:CanUseWith(to_item)) then
            local menu = DermaMenu()

            if from_item:CanUseWith(to_item) then
                menu:AddOption(itemstore.Translate("usewith"), function()
                    LocalPlayer():UseItemWith(droppable:GetContainerID(), droppable:GetSlot(), receiver:GetContainerID(), receiver:GetSlot())
                end):SetIcon("icon16/wrench_orange.png")

                menu:AddSpacer()
            end

            menu:AddOption(itemstore.Translate("move"), function()
                LocalPlayer():MoveItem(droppable:GetContainerID(), droppable:GetSlot(), receiver:GetContainerID(), receiver:GetSlot())
            end):SetIcon("icon16/arrow_switch.png")

            if from_item:CanMerge(to_item) then
                menu:AddOption(itemstore.Translate("merge"), function()
                    LocalPlayer():MergeItem(droppable:GetContainerID(), droppable:GetSlot(), receiver:GetContainerID(), receiver:GetSlot())
                end):SetIcon("icon16/arrow_join.png")
            end

            menu:Open()
        else
            LocalPlayer():MoveItem(droppable:GetContainerID(), droppable:GetSlot(), receiver:GetContainerID(), receiver:GetSlot())
        end
    end)
end

function PANEL:Paint(w, h)
    if itemstore.config.HighlightStyle == "old" or itemstore.config.HighlightStyle == "border" then
        surface.SetDrawColor(self.Hovered and itemstore.config.Colours.HoveredSlot or itemstore.config.Colours.Slot)
    else
        surface.SetDrawColor(itemstore.config.Colours.Slot)
    end

    surface.DrawRect(0, 0, w, h)
    local item = self:GetItem()

    if item and item.HighlightColor then
        local col = Color(item.HighlightColor.r, item.HighlightColor.g, item.HighlightColor.b)
        local bright = Color(col.r * 1.25, col.g * 1.25, col.b * 1.25)
        local dark = Color(bright.r / 2, bright.g / 2, bright.b / 2)

        if itemstore.config.HighlightStyle == "full" then
            surface.SetDrawColor(dark)
            surface.DrawRect(0, 0, w, h)
            surface.SetMaterial(GradientDown)
            surface.SetDrawColor(self.Hovered and bright or col)
            surface.DrawTexturedRect(0, 0, w, h)
        elseif itemstore.config.HighlightStyle == "subtle" then
            surface.SetMaterial(GradientUp)
            surface.SetDrawColor(self.Hovered and bright or col)
            surface.DrawTexturedRect(0, 0, w, h)
        elseif itemstore.config.HighlightStyle == "corner" then
            surface.SetMaterial(GradientUp)
            surface.SetDrawColor(self.Hovered and bright or col)
            surface.DrawTexturedRectRotated(w, h, w * 1.25, h * 1.25, 45)
        elseif itemstore.config.HighlightStyle == "border" then
            surface.SetDrawColor(col)
            surface.DrawOutlinedRect(0, 0, w, h)
        end
    end

    if not itemstore.config.HighlightStyle ~= "border" or not item then
        surface.SetDrawColor(itemstore.config.Colours.OuterBorder)
        surface.DrawOutlinedRect(0, 0, w, h)
    end

    surface.SetDrawColor(itemstore.config.Colours.InnerBorder)
    surface.DrawOutlinedRect(1, 1, w - 2, h - 2)
    self.BaseClass.Paint(self, w, h)
    local item = self:GetItem()

    if item and item:GetAmount() > 1 then
        draw.SimpleTextOutlined(item:FormatAmount(), "ItemStoreAmount", 4, h - 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, color_black)
    end
end

function PANEL:Refresh()
    local item = self:GetItem()

    if item then
        self:SetModel(item:GetModel())
        self:SetColor(item:GetColor() or color_white)

        if IsValid(self.Entity) then
            self.Entity:SetMaterial(item:GetMaterial())
            local min, max = self.Entity:GetRenderBounds()
            self:SetCamPos(Vector(0.55, 0.55, 0.55) * min:Distance(max))
            self:SetLookAt((min + max) / 2)
        end
    else
        self.Entity = nil
        self:SetTooltip(nil)
    end
end

function PANEL:DoDoubleClick()
    local con_id = self:GetContainerID()
    local slot = self:GetSlot()
    local item = self:GetItem()
    if not con_id then return end
    if not slot then return end
    if not item then return end
    if not item.Use then return end
    LocalPlayer():UseItem(con_id, slot)
end

function PANEL:DoMiddleClick()
    local con_id = self:GetContainerID()
    local slot = self:GetSlot()
    local item = self:GetItem()
    if not con_id then return end
    if not slot then return end
    if not item then return end
    LocalPlayer():DropItem(con_id, slot)
end

function PANEL:DoRightClick()
    local con_id = self:GetContainerID()
    local slot = self:GetSlot()
    local item = self:GetItem()
    if not con_id then return end
    if not slot then return end
    if not item then return end
    local menu = DermaMenu()

    if item.Use then
        menu:AddOption(itemstore.Translate("use"), function()
            LocalPlayer():UseItem(con_id, slot)
        end):SetIcon("icon16/wrench.png")

        menu:AddSpacer()
    end

    menu:AddOption(itemstore.Translate("drop"), function()
        LocalPlayer():DropItem(con_id, slot)
    end):SetIcon("icon16/arrow_out.png")

    menu:AddOption(itemstore.Translate("destroy"), function()
        Derma_Query(itemstore.Translate("destroy_confirmation"), itemstore.Translate("destroy_title"), itemstore.Translate("ok"), function()
            LocalPlayer():DestroyItem(con_id, slot)
        end, itemstore.Translate("cancel")):SetSkin("itemstore")
    end):SetIcon("icon16/delete.png")

    if item:CanSplit(1) then
        menu:AddSpacer()
        local submenu, entry = menu:AddSubMenu(itemstore.Translate("split"))
        entry:SetIcon("icon16/arrow_divide.png")
        local half = math.floor(item:GetAmount() / 2)

        submenu:AddOption(itemstore.Translate("split_half", half), function()
            LocalPlayer():SplitItem(con_id, slot, half)
        end)

        submenu:AddSpacer()

        for _, amount in ipairs({1, 2, 5, 10, 25, 50, 100, 250, 1000}) do
            if item:CanSplit(amount) then
                submenu:AddOption(amount, function()
                    LocalPlayer():SplitItem(con_id, slot, amount)
                end)
            end
        end

        menu:Open()
    end

    item:Run("PopulateMenu", menu)
    menu:Open()
end

local Tooltip

function PANEL:CreateTooltip()
    if IsValid(Tooltip) then
        Tooltip:SetVisible(true)

        return
    end

    Tooltip = vgui.Create("ItemStoreTooltip")
    self:UpdateTooltip()
end

function PANEL:UpdateTooltip()
    if not IsValid(Tooltip) then return end
    Tooltip:SetContainerID(self:GetContainerID())
    Tooltip:SetSlot(self:GetSlot())
    Tooltip:SetItem(self:GetItem())
    Tooltip:Refresh()
end

function PANEL:HideTooltip()
    if IsValid(Tooltip) then
        Tooltip:SetVisible(false)
    end
end

function PANEL:OnCursorEntered()
    if not self:GetItem() then return end
    self:CreateTooltip()
    self:UpdateTooltip()
end

function PANEL:OnCursorMoved()
    if not IsValid(Tooltip) then return end
    local x, y = gui.MousePos()
    Tooltip:SetPos(x, y - Tooltip:GetTall())
end

function PANEL:OnCursorExited()
    self:HideTooltip()
end

vgui.Register("ItemStoreSlot", PANEL, "DModelPanel")
--PATH addons/zeros_methlab2/lua/zmlab2_languages/sh_language_ptbr.lua:
zmlab2 = zmlab2 or {}
zmlab2.language = zmlab2.language or {}

if (zmlab2.config.SelectedLanguage == "ptbr") then
    zmlab2.language["YouDontOwnThis"] = "Você não é o dono desta entidade!"
    zmlab2.language["Minutes"] = "Minutos"
    zmlab2.language["Seconds"] = "Segundos"
    zmlab2.language["CratePickupFail"] = "A caixa está vazia!"
    zmlab2.language["CratePickupSuccess"] = "Coletou $MethAmount $MethName, Qualidade: $MethQuality%"
    zmlab2.language["Interaction_Fail_Job"] = "Job incorreta!"
    zmlab2.language["Interaction_Fail_Dropoff"] = "Você tá no ponto errado mané!"
    zmlab2.language["Dropoff_assinged"] = "Ponto de entrega marcado!"
    zmlab2.language["Dropoff_cooldown"] = "Volte mais tarde!"
    zmlab2.language["Equipment"] = "Equipamentos"
    zmlab2.language["Equipment_Build"] = "Construir"
    zmlab2.language["Equipment_Move"] = "Mover"
    zmlab2.language["Equipment_Repair"] = "Reparar"
    zmlab2.language["Equipment_Remove"] = "Remover"
    zmlab2.language["NotEnoughMoney"] = "Dinheiro insuficiente!"
    zmlab2.language["ExtinguisherFail"] = "O objeto não esta pegando fogo!"
    zmlab2.language["Start"] = "Iniciar"
    zmlab2.language["Drop"] = "Drop"
    zmlab2.language["Move Liquid"] = "Mover o liquido"
    zmlab2.language["Frezzer_NeedTray"] = "Nenhuma bandeja disponível!"
    zmlab2.language["ERROR"] = "ERRO"
    zmlab2.language["SPACE"] = "Aperte espaço"
    zmlab2.language["NPC_InteractionFail01"] = "Rala daqui o pé rapado! [Job Errada]"
    zmlab2.language["NPC_InteractionFail02"] = "Você não tá com o produto!"
    zmlab2.language["NPC_InteractionFail03"] = "Os meus pontos de entregas tão tudo cheio, volta mais tarde."
    zmlab2.language["PoliceWanted"] = "Venda de metanfetamina!"
    zmlab2.language["MissingCrate"] = "Você não tem nenhuma caixa!"
    zmlab2.language["Storage"] = "Armazém"
    zmlab2.language["ItemLimit"] = "Você atingiu o limite de $ItemName!"
    zmlab2.language["TentFoldInfo01"] = "Quer mesmo remover a tenda?"
    zmlab2.language["TentFoldInfo02"] = "Todos os equipamentos dentro da tenda serão removidos!"
    zmlab2.language["TentFoldAction"] = "Dobrar"
    zmlab2.language["TentType_None"] = "NENHUM"
    zmlab2.language["TentAction_Build"] = "CONSTRUIR"
    zmlab2.language["TentBuild_Info"] = "Limpe a área!"
    zmlab2.language["TentBuild_Abort"] = "Algo estava no caminho!"
    zmlab2.language["Enabled"] = "Habilitado"
    zmlab2.language["Disabled"] = "Desabilitado"
    zmlab2.language["MethTypeRestricted"] = "Você não pode fabricar esse tipo de metanfetamina!"
    zmlab2.language["SelectMethType"] = "Selecione o tipo de metanfetamina"
    zmlab2.language["SelectTentType"] = "Selecione o tipo de tenda"
    zmlab2.language["LightColor"] = "Cor da luz"
    zmlab2.language["Cancel"] = "Cancelar"
    zmlab2.language["Deconstruct"] = "Desconstruir"
    zmlab2.language["Construct"] = "Construir"
    zmlab2.language["Choosepostion"] = "Escolha uma nova posição"
    zmlab2.language["ChooseMachine"] = "Escolha uma maquina"
    zmlab2.language["Extinguish"] = "Apagar fogo"
    zmlab2.language["PumpTo"] = "Bombear para"
    zmlab2.language["ConstructionCompleted"] = "Construção completa!"
    zmlab2.language["Duration"] = "Duração"
    zmlab2.language["Amount"] = "Quantidade"
    zmlab2.language["Difficulty"] = "Dificuldade"
    zmlab2.language["Money"] = "Dinheiro"
    zmlab2.language["Difficulty_Easy"] = "Fácil"
    zmlab2.language["Difficulty_Medium"] = "Médio"
    zmlab2.language["Difficulty_Hard"] = "Difícil"
    zmlab2.language["Difficulty_Expert"] = "Expert"
    zmlab2.language["Connected"] = "Conectado!"
    zmlab2.language["Missed"] = "Errou!"

    // Tent Config
    // Note: "Vamonos Pest" and "Crystale Castle" are the names of those tents so you dont need to translate them if you dont want
    zmlab2.language["tent01_title"] = "Vamonos Pest Tenda - Pequena"
    zmlab2.language["tent01_desc"] = "Essa tenda tem espaço para 6 maquinas."
    zmlab2.language["tent02_title"] = "Vamonos Pest Tenda - Media"
    zmlab2.language["tent02_desc"] = "Essa tenda tem espaço para 9 maquinas."
    zmlab2.language["tent03_title"] = "Vamonos Pest Tenda - Grande"
    zmlab2.language["tent03_desc"] = "Essa tenda tem espaço para 16 maquinas."
    zmlab2.language["tent04_title"] = "Castelo Crystale"
    zmlab2.language["tent04_desc"] = "Algum mané roubou isso do circo, tem espaço pra 24 maquinas"

    // Equipment Config
    zmlab2.language["ventilation_title"] = "Ventilação"
    zmlab2.language["ventilation_desc"] = "Limpa as áreas por perto da poluição."
    zmlab2.language["storage_title"] = "Armazém"
    zmlab2.language["storage_desc"] = "Tem produtos químicos e equipamentos."
    zmlab2.language["furnace_title"] = "Forno"
    zmlab2.language["furnace_desc"] = "Usado para aquecer o ácido."
    zmlab2.language["mixer_title"] = "Batedor"
    zmlab2.language["mixer_desc"] = "Usado para misturar os componentes."
    zmlab2.language["filter_title"] = "Filtro"
    zmlab2.language["filter_desc"] = "Usado para remover impurezas da mistura final."
    zmlab2.language["filler_title"] = "Despejador"
    zmlab2.language["filler_desc"] = "Usado para preencher as bandejas com metanfetamina."
    zmlab2.language["frezzer_title"] = "Geladeira"
    zmlab2.language["frezzer_desc"] = "Usado para consolidar a mistura da metanfetamina."
    zmlab2.language["packingtable_title"] = "Empacotadora"
    zmlab2.language["packingtable_desc"] = "Usada para quebrar/embalar a metanfetamina."

    // Storage Config
    zmlab2.language["acid_title"] = "Ácido Hydrofluoric"
    zmlab2.language["acid_desc"] = "Um catalisador para aumentar os níveis de reação."
    zmlab2.language["methylamine_title"] = "Metilamina"
    zmlab2.language["methylamine_desc"] = "Metilamina (CH3NH2) é um composto orgânico usado na fabricação da metanfetamina."
    zmlab2.language["aluminum_title"] = "Aluminio"
    zmlab2.language["aluminum_desc"] = "Aluminio é usado como um reagente químico para reduzir as impurezas."
    zmlab2.language["lox_title"] = "Oxigénio líquido"
    zmlab2.language["lox_desc"] = "Oxigénio líquido é usado na Geladeira para consolidar a mistura da metanfetamina."
    zmlab2.language["crate_title"] = "Caixa"
    zmlab2.language["crate_desc"] = "Usada para transportar grandes quantidades de metanfetamina."
    zmlab2.language["palette_title"] = "Pallet"
    zmlab2.language["palette_desc"] = "Usada para transportar grandes quantidades de metanfetamina."
    zmlab2.language["crusher_title"] = "Quebra Gelo"
    zmlab2.language["crusher_desc"] = "Quebra e empacota a metanfetamina automaticamente quando instalado na Empacotadora."

    // Meth Config
    // Note: Hard to say what about the meth should be translated and what not. Decide for yourself whats important here.
    zmlab2.language["meth_title"] = "Metanfetamina"
    zmlab2.language["meth_desc"] = "Produto genérico das ruas."
    zmlab2.language["bluemeth_title"] = "Cristal Azul"
    zmlab2.language["bluemeth_desc"] = "A formula original do Heisenberg."
    zmlab2.language["kalaxi_title"] = "Cristal Kalaxiano"
    zmlab2.language["kalaxi_desc"] = "O Cristal Kalaxiano é bem similar a muitas drogas, seu efeito principal e causar prazer nas pessoas."
    zmlab2.language["glitter_title"] = "Glitter"
    zmlab2.language["glitter_desc"] = "Glitter é uma droga altamente psicodélica e recente chegada às ruas de Night City. É uma coisa realmente forte, mesmo para os maiores noiados de Night City."
    zmlab2.language["kronole_title"] = "Kronole"
    zmlab2.language["kronole_desc"] = "Kronole é uma droga de rua vendida a bordo do Snowpiercer no mercado negro. A droga tem a capacidade de bloquear os receptores da dor, o Kronole é tão poderoso que bloqueia todos os sentimentos, não apenas a dor."
    zmlab2.language["melange_title"] = "Melange"
    zmlab2.language["melange_desc"] = "Melange (Spice) é uma droga capaz de prolongar a vida, profere vitalidade e consciência aumentadas e desbloquear a presciência em alguns humanos."
    zmlab2.language["mdma_title"] = "MDMA"
    zmlab2.language["mdma_desc"] = "MDMA foi desenvolvido em 1912 pela Merck. Foi usado para aprimorar a psicoterapia no início da década de 1970 e virou uma droga popular nas ruas em 1980."

    // Update 1.0.5
    zmlab2.language["tent05_title"] = "Round Tent"
    zmlab2.language["tent05_desc"] = "This round tent provides room for 8 machines."
end

--PATH addons/zeros_methlab2/lua/zmlab2/sh_tent_config.lua:
zmlab2 = zmlab2 or {}
zmlab2.config = zmlab2.config or {}

zmlab2.config.Tent = {
	[1] = {
		name = zmlab2.language["tent05_title"],
		desc = zmlab2.language["tent05_desc"],
		price = 3000,
		model = "models/zerochain/props_methlab/zmlab2_tent05.mdl",
		tex_diff = "zerochain/props_methlab/tent05/tent05_diff",
		tex_nrm = "zerochain/props_methlab/tent05/tent05_nrm",
		tex_em = "zerochain/props_methlab/tent05/tent05_em",
		mat_id = 3,
		min = Vector(-120,-120,0),
		max = Vector(120,120,95),
		construction_time = 4,
		light = {
			pos = Vector(0, 0, 80),
			size = 512,
			brightness = 3,
		},
		color = Color(255,191,0)
	},
	[2] = {
		name = zmlab2.language["tent02_title"],
		desc = zmlab2.language["tent02_desc"],
		price = 5000,
		model = "models/zerochain/props_methlab/zmlab2_tent01.mdl",
		tex_diff = "zerochain/props_methlab/tent01/tent01_diff",
		tex_nrm = "zerochain/props_methlab/tent01/tent01_nrm",
		tex_em = "zerochain/props_methlab/tent01/tent01_em",
		mat_id = 5,
		min = Vector(-90,-147,0),
		max = Vector(90,147,95),
		construction_time = 4,
		light = {
			pos = Vector(0, 0, 100),
			size = 256,
			brightness = 4,
		},
		color = Color(255,191,0)
	},
}

--PATH addons/zeros_methlab2/lua/zmlab2/tent/cl_door.lua:
if not CLIENT then return end
zmlab2 = zmlab2 or {}
zmlab2.TentDoor = zmlab2.TentDoor or {}

function zmlab2.TentDoor.Initialize(TentDoor)
    TentDoor.SmoothAnim = 0
end

function zmlab2.TentDoor.Draw(TentDoor)

    if TentDoor:GetIsPublic() == false and zmlab2.util.InDistance(TentDoor:GetPos(), LocalPlayer():GetPos(), 500) and TentDoor.SmoothAnim < 1 then
        zmlab2.TentDoor.DrawIndicator(TentDoor, Vector(-2, 0, 30), Angle(0, -90, 90), TentDoor:GetIsLocked())
        zmlab2.TentDoor.DrawIndicator(TentDoor, Vector(2, 0, 30), Angle(0, 90, 90), TentDoor:GetIsLocked())
    end
end

function zmlab2.TentDoor.DrawIndicator(TentDoor, pos, ang, state)
    cam.Start3D2D(TentDoor:LocalToWorld(pos), TentDoor:LocalToWorldAngles(ang), 0.1)

        local NextInteraction = TentDoor:GetNextInteraction()

        if NextInteraction > CurTime() then

            local wipe = math.Clamp((1 / 10) * (NextInteraction - CurTime()), 0, 1)

            surface.SetDrawColor(zmlab2.colors["black02"])
            surface.SetMaterial(zmlab2.materials["icon_locked"])
            surface.DrawTexturedRectRotated(0, 0, 200, 200, 0)

            surface.SetDrawColor(color_white)
            surface.SetMaterial(zmlab2.materials["icon_locked"])
        	// Draws right half of the texture
        	// Note that we also change the width of the rectangle to avoid stetcing of the texture
        	// This is for demonstration purposes, you can do whatever it is you need
        	surface.DrawTexturedRectUV( -100, -100, 200, 200 * wipe, 0, 0, 1,wipe )
        else

            if TentDoor:OnLockButton(LocalPlayer()) then
                surface.SetDrawColor(zmlab2.colors["orange01"])
                surface.SetMaterial(zmlab2.materials["icon_locked_outline"])
                surface.DrawTexturedRectRotated(0, 0, 200, 200, 0)
            end

            if state then
                surface.SetDrawColor(color_white)
                surface.SetMaterial(zmlab2.materials["icon_locked"])
                surface.DrawTexturedRectRotated(0, 0, 200, 200, 0)
            else
                surface.SetDrawColor(zmlab2.colors["black02"])
                surface.SetMaterial(zmlab2.materials["icon_locked"])
                surface.DrawTexturedRectRotated(0, 0, 200, 200, 0)
            end
        end

    cam.End3D2D()
end

function zmlab2.TentDoor.Think(TentDoor)
    if TentDoor:GetIsLocked() then
        TentDoor.SmoothAnim = Lerp(15 * FrameTime(), TentDoor.SmoothAnim, 0)
    else
        if zmlab2.util.InDistance(TentDoor:GetPos(), LocalPlayer():GetPos(), 75) then
            TentDoor.SmoothAnim = Lerp(5 * FrameTime(), TentDoor.SmoothAnim, 1)
        else
            TentDoor.SmoothAnim = Lerp(5 * FrameTime(), TentDoor.SmoothAnim, 0)
        end
    end

    TentDoor:SetPoseParameter("zmlab2_doormover", TentDoor.SmoothAnim)
    TentDoor:InvalidateBoneCache()
end

--PATH addons/zeros_methlab2/lua/zmlab2/minigame/sh_minigame.lua:
zmlab2 = zmlab2 or {}
zmlab2.MiniGame = zmlab2.MiniGame or {}


function zmlab2.MiniGame.GetPenalty(Machine)
    local val = zmlab2.config.MiniGame.Quality_Penalty
    /*
    local m_data = zmlab2.config.MethTypes[Machine:GetMethType()]

    // Higher difficulty means more penality
    if m_data and m_data.difficulty then
        val = (zmlab2.config.MiniGame.Quality_Penalty / 10) * m_data.difficulty
    end
    print("GetPenalty: " .. val)
    */
    return math.Round(val)
end

function zmlab2.MiniGame.GetReward(Machine)
    local val = zmlab2.config.MiniGame.Quality_Reward
    /*
    local m_data = zmlab2.config.MethTypes[Machine:GetMethType()]

    // Higher difficulty means less reward
    if m_data and m_data.difficulty then
        val = (zmlab2.config.MiniGame.Quality_Reward / 10) * (10 - m_data.difficulty)
    end
    print("GetReward: " .. val)
    */
    return math.Round(val)
end

--PATH addons/zeros_methlab2/lua/zmlab2/storage/cl_storage_vgui.lua:
if not CLIENT then return end
net.Receive("zmlab2_Storage_OpenInterface", function(len)
    zmlab2.Debug_Net("zmlab2_Storage_OpenInterface",len)

    LocalPlayer().zmlab2_Storage = net.ReadEntity()

    zmlab2.Interface.Create(600,365,zmlab2.language["Storage"],function(pnl)

        zmlab2.Interface.AddModelList(pnl,zmlab2.config.Storage.Shop,function(id)
            // IsLocked
            return zmlab2.Storage.BuyCheck(LocalPlayer(),id) == false
        end,
        function(id)
            // IsSelected
            return false
        end,
        function(id)
            // OnClick
            if LocalPlayer().zmlab2_Storage:GetNextPurchase() > CurTime() then return end

            net.Start("zmlab2_Storage_Buy")
            net.WriteEntity(LocalPlayer().zmlab2_Storage)
            net.WriteUInt(id,16)
            net.SendToServer()
        end,
        function(raw_data)
            return {model = raw_data.model,render = {FOV = 35},color = raw_data.color,bodygroup = {[0] = 5}} , raw_data.name , zmlab2.Money.Display(raw_data.price)
        end)
    end)
end)

--PATH addons/zeros_methlab2/lua/zmlab2/filter/cl_filter.lua:
if not CLIENT then return end
zmlab2 = zmlab2 or {}
zmlab2.Filter = zmlab2.Filter or {}


function zmlab2.Filter.Initialize(Filter)

end

function zmlab2.Filter.Draw(Filter)
    zmlab2.util.LoopedSound(Filter, "zmlab2_machine_mixing", Filter:GetProcessState() == 2)

    if Filter:GetProcessState() == 2 and (Filter.NextEffect == nil or (Filter.NextEffect and CurTime() > Filter.NextEffect)) then
        zmlab2.Effect.ParticleEffect("zmlab2_filter_exhaust", Filter:LocalToWorld(Vector(25,0,46)), Filter:GetAngles(), Filter)
        Filter.NextEffect = CurTime() + 1
    end

    if zmlab2.util.InDistance(LocalPlayer():GetPos(),Filter:GetPos(), 500) then
        if zmlab2.Convar.Get("zmlab2_cl_drawui") == 1 then zmlab2.Filter.DrawUI(Filter) end

        // Vibrates certain bones of the machine
        zmlab2.VibrationSystem.Run(Filter,Filter:GetProcessState() == 2,0.5)
    end
end

function zmlab2.Filter.OnRemove(Filter)
    Filter:StopSound("zmlab2_machine_mixing")
end

function zmlab2.Filter.DrawUI_Liquid(Filter)

    local _state = Filter:GetProcessState()

    local amount = 1000
    if _state == 0 or _state >= 5 then amount = 0 end

    local dat = zmlab2.config.MethTypes[Filter:GetMethType()]
    local color = zmlab2.colors["mixer_liquid05"]
    if dat and dat.color then
        color = zmlab2.util.LerpColor((1 / 100) * Filter:GetMethQuality(), zmlab2.colors["mixer_liquid01"], dat.color)
    end

    if Filter.SmoothBar == nil then Filter.SmoothBar = 0 end
    Filter.SmoothBar = Lerp(0.5 * FrameTime(),Filter.SmoothBar,amount)

    local turbulence = 0
    if _state > 1 then turbulence = 0.5 end

    cam.Start3D2D(Filter:LocalToWorld(Vector(-15, 10.2, 25)), Filter:LocalToWorldAngles(Angle(0, 0, -90)), 0.1)
        zmlab2.Interface.DrawLiquid(Filter, -50, -20, 40, 260, (1 / 1000) * Filter.SmoothBar, color, turbulence)
    cam.End3D2D()
end

local ScreenData = {
    pos = Vector(3.2, 12.1, 29.6),
    ang = Angle(0, 180, 90),
    x = 0,
    y = 0,
    w = 200,
    h = 220,
    pages = {
        [0] = function(Filter)
            zmlab2.Interface.DrawPipe(200,200,zmlab2.colors["mixer_liquid01"])
        end,
        [1] = function(Filter)
            zmlab2.Interface.DrawButton(0, 0, 180, 80, zmlab2.language["Start"], Filter:OnStart(LocalPlayer()))
        end,
        [2] = function(Filter)
            zmlab2.Interface.DrawProgress(zmlab2.Meth.GetFilterTime(Filter:GetMethType()),Filter:GetProgress(),-30)
            draw.SimpleText(Filter:GetMethQuality() .. "%", zmlab2.GetFont("zmlab2_font02"), 0, 45, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end,
        [4] = function(Filter)
            zmlab2.Interface.DrawButton(0, 0, 180, 80, zmlab2.language["Move Liquid"], Filter:OnStart(LocalPlayer()))
        end,
        [6] = function(Filter)
            surface.SetDrawColor(color_white )
            surface.SetMaterial(zmlab2.materials["icon_sponge"])
            surface.DrawTexturedRectRotated(0, 0, 140, 140, 0 )
        end
    }
}

function zmlab2.Filter.DrawUI(Filter)

    local _state = Filter:GetProcessState()

    // Draw liquid
    zmlab2.Filter.DrawUI_Liquid(Filter)

    // Draws the current status
    zmlab2.Interface.Draw(Filter,ScreenData)

    // A little animated pointer
    zmlab2.Interface.DrawScalar(Filter,Vector(-18, 1, 63.2),Angle(0, 0, -90),_state > 1 and _state < 6)
end

--PATH addons/zeros_methlab2/lua/zmlab2/frezzer/cl_frezzer.lua:
if not CLIENT then return end
zmlab2 = zmlab2 or {}
zmlab2.Frezzer = zmlab2.Frezzer or {}


function zmlab2.Frezzer.Initialize(Frezzer)
    Frezzer.Initialize = true
    timer.Simple(1,function()
        if IsValid(Frezzer) then Frezzer.Initialize = false end
    end)
    Frezzer.NextFrezzeSound = 0
    Frezzer.NextFrezzeEffect = 0
end

function zmlab2.Frezzer.Think(Frezzer)
    if Frezzer.Initialize == true then return end
    if zmlab2.util.InDistance(LocalPlayer():GetPos(),Frezzer:GetPos(), 500) then
        local _state = Frezzer:GetProcessState()

        if _state == 2 and CurTime() >= Frezzer.NextFrezzeSound then
            zmlab2.Sound.EmitFromEntity("frezzing_crack", Frezzer)
            Frezzer.NextFrezzeSound = CurTime() + math.random(1,3)
        end

        /*
        if _state == 2 and CurTime() >= Frezzer.NextFrezzeEffect then
            Frezzer.NextFrezzeEffect = CurTime() + 1
            zmlab2.Effect.ParticleEffect("zmlab2_frozen_gas", Frezzer:LocalToWorld(Vector(17,0,41.5)), Frezzer:GetAngles(), Frezzer)
        end
        */

        if _state ~= Frezzer.LastState then

            if Frezzer.LastState ~= 0 then
                if _state >= 2 then
                    zmlab2.Animation.Play(Frezzer, "close", 1)
                else
                    zmlab2.Animation.Play(Frezzer, "open", 1)
                end
            end

            Frezzer.LastState = _state
        end
    else
        Frezzer.LastState = nil
    end
end

function zmlab2.Frezzer.OnRemove(Frezzer)
    Frezzer:StopSound("zmlab2_machine_compressing")
end

function zmlab2.Frezzer.DrawLight(Frezzer)
    if zmlab2.Convar.Get("zmlab2_cl_vfx_dynamiclight") == 0 then return end
    local dlight = DynamicLight(Frezzer:EntIndex())
    if (dlight) then
        dlight.pos = Frezzer:LocalToWorld(Vector(17,-5,35))
        dlight.r = 126
        dlight.g = 181
        dlight.b = 239
        dlight.brightness = 1
        dlight.style = 0
        dlight.Decay = 1000
        dlight.Size = 128
        dlight.DieTime = CurTime() + 1
    end
end

local ScreenData = {
    pos = Vector(12.3, 10.66, 52.5),
    ang = Angle(0, 180, 90),
    x = 0,
    y = 0,
    w = 160,
    h = 140,
    pages = {
        [0] = function(Frezzer)
            zmlab2.Interface.DrawIngredient(0, 0, 160, 140, zmlab2.materials["icon_lox"],1,zmlab2.GetFont("zmlab2_font02"))
        end,
        [1] = function(Frezzer)
            zmlab2.Interface.DrawButton(0, -35, 150, 60, zmlab2.language["Start"], Frezzer:OnStart(LocalPlayer()))
            zmlab2.Interface.DrawButton(0, 35, 150, 60, zmlab2.language["Drop"], Frezzer:OnDropTray(LocalPlayer()))
        end,
        [2] = function(Frezzer)
            zmlab2.Interface.DrawProgress(zmlab2.config.Frezzer.Time,CurTime() - Frezzer:GetFrezzeStart())
        end
    }
}

function zmlab2.Frezzer.Draw(Frezzer)
    if Frezzer.Initialize == true then return end
    zmlab2.util.LoopedSound(Frezzer, "zmlab2_machine_compressing", Frezzer:GetProcessState() == 2)

    if zmlab2.util.InDistance(LocalPlayer():GetPos(),Frezzer:GetPos(), 500) and zmlab2.Convar.Get("zmlab2_cl_drawui") == 1 then

        zmlab2.Interface.Draw(Frezzer,ScreenData)

        if Frezzer:GetProcessState() == 2 then
            zmlab2.Frezzer.DrawLight(Frezzer)
        end
    end

    // Update the material once it gets drawn
    if Frezzer.LastDraw and CurTime() > (Frezzer.LastDraw + 0.1) then
        if Frezzer:GetProcessState() ~= 2 and Frezzer:GetSequence() ~= Frezzer:LookupSequence("open") then
            Frezzer.LastState = nil
        end
    end

    Frezzer.LastDraw = CurTime()
end

--PATH addons/zeros_methlab2/lua/zmlab2/extinguisher/cl_extinguisher.lua:
if not CLIENT then return end
zmlab2 = zmlab2 or {}
zmlab2.Extinguisher = zmlab2.Extinguisher or {}

net.Receive("zmlab2_Extinguisher_Use", function(len, ply)
    zmlab2.Debug_Net("zmlab2_Extinguisher_Use", len)
    local Tent = net.ReadEntity()
    if not IsValid(Tent) then return end

    zmlab2.PointerSystem.Start(Tent,function()

        // OnInit
        zmlab2.PointerSystem.Data.MainColor = zmlab2.colors["blue01"]

        zmlab2.PointerSystem.Data.ActionName = zmlab2.language["Extinguish"]

    end,function()

        // OnLeftClick

        //if not IsValid(zmlab2.PointerSystem.Data.Target) then return end
        /*
        if zmlab2.PointerSystem.Data.Target:IsOnFire() == false then
            zmlab2.vgui.Notify( zmlab2.language["ExtinguisherFail"],NOTIFY_ERROR)
            return
        end
        */

        // Send the target to the SERVER
        net.Start("zmlab2_Extinguisher_Use")
        net.WriteEntity(zmlab2.PointerSystem.Data.Target)
        net.WriteEntity(Tent)
        net.SendToServer()

        zmlab2.PointerSystem.Stop()
    end,function()

        // MainLogic

        // Catch the Target
        if IsValid(zmlab2.PointerSystem.Data.HitEntity) and zmlab2.PointerSystem.Data.HitEntity:GetClass() ~= "zmlab2_tent" then
            zmlab2.PointerSystem.Data.Target = zmlab2.PointerSystem.Data.HitEntity
        else
            zmlab2.PointerSystem.Data.Target = nil
        end

        // Update PreviewModel
        if IsValid(zmlab2.PointerSystem.Data.PreviewModel) then
            if IsValid(zmlab2.PointerSystem.Data.Target) then
                local eyeTraceEntityClass = LocalPlayer():GetEyeTrace().Entity:GetClass()
                if not string.StartWith(eyeTraceEntityClass, "zmlab") then return end
                zmlab2.PointerSystem.Data.PreviewModel:SetColor(zmlab2.PointerSystem.Data.MainColor)
                zmlab2.PointerSystem.Data.PreviewModel:SetPos(zmlab2.PointerSystem.Data.Target:GetPos())
                zmlab2.PointerSystem.Data.PreviewModel:SetAngles(zmlab2.PointerSystem.Data.Target:GetAngles())
                zmlab2.PointerSystem.Data.PreviewModel:SetModel(zmlab2.PointerSystem.Data.Target:GetModel())
                zmlab2.PointerSystem.Data.PreviewModel:SetNoDraw(false)
            else
                zmlab2.PointerSystem.Data.PreviewModel:SetNoDraw(true)
            end
        end
    end)
end)

--PATH addons/zeros_methlab2/lua/zmlab2/generic/cl_interface.lua:
if SERVER then return end

zmlab2 = zmlab2 or {}
zmlab2.Interface = zmlab2.Interface or {}

function zmlab2.Interface.DrawIngredient(x, y, w, h, icon,amount,font)

    //draw.RoundedBox(0, -w/2, -h/2, w, h, zmlab2.colors["red02"])

    local rot = 15 * math.sin(CurTime() * 4)
    rot = zmlab2.util.SnapValue(15,rot)

    local icon_size =  math.Clamp(w * 0.7,0,h * 0.8)
    surface.SetDrawColor(color_white)
    surface.SetMaterial(icon)
    surface.DrawTexturedRectRotated(x, y, icon_size, icon_size, rot)

    local tri_size = math.Clamp(w * 0.5,0,h * 0.75)
    local tri_x = x - w / 2
    surface.SetDrawColor(color_white)
    surface.SetMaterial(zmlab2.materials["icon_triangle"])
    surface.DrawTexturedRect(tri_x, y + ((h / 2) - tri_size), tri_size, tri_size)

    draw.SimpleText(amount .. "x", font, tri_x + 10,y + (h / 2) + 5, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
end

function zmlab2.Interface.DrawPipe(w, h, color)
    local rot = 10 * math.sin(CurTime() * 1)
    rot = zmlab2.util.SnapValue(15, rot)
    surface.SetDrawColor(color_white)
    if rot == 0 then
        surface.SetMaterial(zmlab2.materials["icon_pipe_on"])
    else
        surface.SetMaterial(zmlab2.materials["icon_pipe_off"])
    end
    surface.DrawTexturedRectRotated(0, h * 0.25, w, h, 0)

    surface.SetDrawColor(color)
    surface.SetMaterial(zmlab2.materials["icon_liquid"])
    surface.DrawTexturedRectRotated(0, -h * 0.25, w * 0.4, h * 0.4, 0)
end

function zmlab2.Interface.DrawButton(x, y, w, h, txt, hover)
    zmlab2.util.DrawOutlinedBox(x - (w / 2), y - (h / 2), w, h, 2, color_white)
    local font = zmlab2.GetFont("zmlab2_font02")
    local txtSize = zmlab2.util.GetTextSize(txt,font)
    if txtSize > w then
        // Does this slightly smaller font work?
        font = zmlab2.GetFont("zmlab2_font05")
        txtSize = zmlab2.util.GetTextSize(txt,font)
        if txtSize > w then
            // If not then use the really small one
            font = zmlab2.GetFont("zmlab2_font01")
        end
    end
    draw.SimpleText(txt, font, x, y, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    if hover then
        draw.RoundedBox(0, x - (w / 2), y - (h / 2), w, h, zmlab2.colors["white02"])
    end
end

function zmlab2.Interface.DrawProgress(Duration,TimePassed,YOffset)
    local time = (100 / Duration) * TimePassed
    draw.SimpleText(math.Clamp(math.Round(time), 0, 100) .. "%", zmlab2.GetFont("zmlab2_font03"), 0, 0 + (YOffset or 0), color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

local wave_res = 16
local cWhite = color_white
function zmlab2.Interface.DrawLiquid(Machine,ax,ay,w,h,size,color,turbulence)
    draw.RoundedBox(0, ax, ay, w, h, zmlab2.colors["black04"])

    // Change the wave according to turbulence
    local wave_height = 1 + 5 * turbulence
    local wave_length = 0.5 + 0.1 * turbulence
    local wave_speed = 2 + 8 * turbulence

    if Machine.Verts == nil then Machine.Verts = {} end

    local BarSize = h * size

    Machine.Verts[1] = { x = ax, y = math.Clamp(ay + BarSize - 50, ay, ay + h) } // Right Top
    Machine.Verts[2] = { x = ax, y = ay } // Right Bottom
    Machine.Verts[3] = { x = ax + w, y = ay } // Left Bottom
    Machine.Verts[4] = { x = ax + w, y = math.Clamp(ay + BarSize - 50, ay, ay + h) } // Left Top

    for i = 1, wave_res do

        local xIncrease = ((w + 5) / wave_res) * (i - 1)
        local nx = ax - xIncrease + w
        nx = math.Clamp(nx, ax, ax + w)

        local yIncrease = math.sin((i * wave_length) + CurTime() * wave_speed)
        yIncrease = yIncrease * wave_height

        local ny = ay + BarSize + yIncrease - wave_height - h * 0.06
        ny = math.Clamp(ny, ay, ay + h)

        // Make it wavey
        Machine.Verts[4 + i] = {
            x = nx,
            y = ny,
        }
    end

    if size > 0.01 then
        local GlowPos = math.sin(wave_length + CurTime() * wave_speed)
        GlowPos = GlowPos * wave_height
        GlowPos = ay + BarSize + GlowPos - wave_height - h * 0.05
        GlowPos = math.Clamp(GlowPos, ay + w * 0.5, ay + h)

        surface.SetDrawColor(color)
        surface.SetMaterial(zmlab2.materials["liquid_glow_top"])
        surface.DrawTexturedRectRotated(ax + w / 2, GlowPos, w * 0.9, w * 0.8,180)
    end

    surface.SetDrawColor( color )
    draw.NoTexture()
    surface.DrawPoly( Machine.Verts )

    // Colors the metal overlay depending on the baked / dynamic light
    local light = (render.ComputeDynamicLighting(Machine:GetPos(), Machine:GetUp()) + render.ComputeLighting(Machine:GetPos(), Machine:GetUp())) / 2 + Vector(0.25,0.25,0.25)
    //local light = Vector(1,1,1)

    surface.SetDrawColor(Color(cWhite.r * light.x, cWhite.g * light.y, cWhite.b * light.z))

    //surface.SetDrawColor(zmlab2.colors["grey02"])
    surface.SetMaterial(zmlab2.materials["tank_overlay"])
    surface.DrawTexturedRectRotated(ax + w / 2, ay + h / 2, w, h, 180)
end

function zmlab2.Interface.DrawScalar(Machine,Pos,Ang,Active)
    cam.Start3D2D(Machine:LocalToWorld(Pos), Machine:LocalToWorldAngles(Ang), 1)
        local target = 52
        if Active then target = 180 + 10 * math.sin(CurTime() * 15) end
        Machine.PointerSmooth = Lerp(5 * FrameTime(),Machine.PointerSmooth or 0,target)

        surface.SetDrawColor( color_white )
        surface.SetMaterial(zmlab2.materials["air_pressure_pointer"])
        surface.DrawTexturedRectRotated(0, 0, 4, 4,  -Machine.PointerSmooth )

        surface.SetDrawColor(zmlab2.colors["black03"])
        surface.SetMaterial(zmlab2.materials["radial_invert_glow"])
        surface.DrawTexturedRectRotated(0, 0, 5 , 5 , 0)
    cam.End3D2D()
end

local CursorSize = 2
local maxrange = 0
local s_ang = Angle(0, 0, 0)
local function getCursorPos(origin,angle)

    local normal = angle:Up()

    local p = util.IntersectRayWithPlane(LocalPlayer():EyePos(), LocalPlayer():GetAimVector(), origin, normal)

    // if there wasn't an intersection, don't calculate anything.
    if not p then return end

    // If we are too close then stop
    local hPos = WorldToLocal(LocalPlayer():GetShootPos(), s_ang, origin, angle)

    if hPos.z < 0 then
        return
    end

    if maxrange > 0 and p:Distance(LocalPlayer():EyePos()) > maxrange then return end

    local pos = WorldToLocal(p, s_ang, origin, angle)
    local _x = (pos.x or 0) / (0.05 or 1)
    local _y = (pos.y or 0) / (0.05 or 1)

    return _x, -_y
end

function zmlab2.Interface.Draw(Machine,data)
    local _state = Machine:GetProcessState()
    cam.Start3D2D(Machine:LocalToWorld(data.pos), Machine:LocalToWorldAngles(data.ang), 0.05)

        if Machine.GetErrorStart == nil or Machine:GetErrorStart() < 0 then
            surface.SetDrawColor( data.OverwriteColor or zmlab2.colors["blue02"] )
            surface.SetMaterial(zmlab2.materials["item_bg"])
            surface.DrawTexturedRectRotated(data.x, data.y, data.w, data.h, 0 )

            if data.pages[_state] then
                data.pages[_state](Machine)
            else

                local rot = CurTime() * -700
                rot = zmlab2.util.SnapValue(36, rot)

                // If no ui data is specified for the current state then just display the loading symbol
                surface.SetDrawColor( color_white )
                surface.SetMaterial(zmlab2.materials["icon_loading"])
                surface.DrawTexturedRectRotated(0,0, 160, 160, rot )
            end
        else
            surface.SetDrawColor( zmlab2.colors["red02"] )
            surface.SetMaterial(zmlab2.materials["item_bg"])
            surface.DrawTexturedRectRotated(data.x, data.y, data.w, data.h, 0 )

            local error_width = data.w * 0.5
            local error_height = math.Clamp(data.h * 0.3,80,150)
            //zmlab2.Interface.DrawButton(0, 0,error_width, error_height, zmlab2.language["ERROR"], Machine:OnErrorButton(LocalPlayer()))

            if Machine:OnErrorButton(LocalPlayer()) then
                surface.SetDrawColor(color_white)
                surface.SetMaterial(zmlab2.materials["icon_E"])
                surface.DrawTexturedRectRotated(0, 0, error_width, error_width, 0)

                local hover_size = error_width * 0.9
                draw.RoundedBox(10, -hover_size / 2, -hover_size / 2, hover_size, hover_size, zmlab2.colors["white02"])

                Machine.Pulse = (Machine.Pulse or 0) + (1 * FrameTime())
                if Machine.Pulse > 1 then Machine.Pulse = 0 end


                local mul = 1 + math.abs(0.7 * Machine.Pulse)
                surface.SetDrawColor(Color(255, 255, 255, 200 - 200 * Machine.Pulse))
                surface.SetMaterial(zmlab2.materials["icon_box01"])
                surface.DrawTexturedRectRotated(0, 0, error_width * mul, error_width * mul, 0)
            else
                surface.SetDrawColor(color_white)
                surface.SetMaterial(zmlab2.materials["icon_error"])
                surface.DrawTexturedRectRotated(0, 0, error_width, error_width, 0)
            end


            draw.SimpleText(zmlab2.language["ERROR"], zmlab2.GetFont("zmlab2_font02"), 0, -80, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            local barMax = data.w * 0.9
            local barSize = math.Clamp((barMax / zmlab2.config.MiniGame.RespondTime) * (CurTime() - Machine:GetErrorStart()),0,barMax)
            draw.RoundedBox(0, data.w * 0.05 - (data.w / 2), error_height * 0.8, barMax - barSize, 20, color_white)
        end

        // Draws the cursor if its inside the screen
        local cx,cy = getCursorPos(Machine:LocalToWorld(data.pos), Machine:LocalToWorldAngles(data.ang))
        if cx and cy and math.abs(cx) < (data.w / 2) and math.abs(cy) < (data.h / 2)  then
            draw.RoundedBox(2 * CursorSize, cx - (2 * CursorSize), cy - (2 * CursorSize), 4 * CursorSize, 4 * CursorSize, color_white)
        end

        surface.SetDrawColor(zmlab2.colors["black02"])
        surface.SetMaterial(zmlab2.materials["scanlines"])
        surface.DrawTexturedRectRotated(data.x, data.y, data.w, data.h, 0)

    cam.End3D2D()

    data.OverwriteColor = nil
end

--PATH addons/zeros_methlab2/lua/zmlab2/dropoff/cl_dropoff.lua:
if not CLIENT then return end
zmlab2 = zmlab2 or {}
zmlab2.Dropoff = zmlab2.Dropoff or {}
zmlab2.Dropoff.Stencils = zmlab2.Dropoff.Stencils or {}

function zmlab2.Dropoff.Initialize(Dropoff)
    Dropoff.IsClosed = true
    Dropoff.RenderStencil = false
    Dropoff.SmoothAnim = 0
    zmlab2.Dropoff.Stencils[Dropoff:EntIndex()] = Dropoff
end

function zmlab2.Dropoff.Draw(Dropoff)
    Dropoff:DrawModel()
end

function zmlab2.Dropoff.OnRemove(Dropoff)
    if IsValid(Dropoff.csModel) then Dropoff.csModel:Remove() end
end

function zmlab2.Dropoff.Think(Dropoff)

    if Dropoff.IsClosed ~= Dropoff:GetIsClosed() then
        Dropoff.IsClosed = Dropoff:GetIsClosed()

        if Dropoff.IsClosed == true then
            zmlab2.Animation.Play(Dropoff, "close", 1)
            Dropoff:EmitSound("zmlab2_dropoff_door")
            timer.Simple(1, function()
                if not IsValid(Dropoff) then return end
                Dropoff.RenderStencil = false
            end)
        else
            Dropoff.RenderStencil = true
            zmlab2.Animation.Play(Dropoff, "open", 1)
            Dropoff:EmitSound("zmlab2_dropoff_door")
        end
    end

    if IsValid(Dropoff.csModel) then
        Dropoff.csModel:SetPos(Dropoff:GetPos())
        Dropoff.csModel:SetAngles(Dropoff:GetAngles())
    else
        Dropoff.csModel = zmlab2.ClientModel.Add("models/zerochain/props_methlab/zmlab2_dropoff_shaft.mdl",RENDERGROUP_OTHER)
        Dropoff.csModel:SetPos(Dropoff:GetPos())
        Dropoff.csModel:SetAngles(Dropoff:GetAngles())
        Dropoff.csModel:SetParent(Dropoff)
        Dropoff.csModel:SetNoDraw(true)
    end
end

zmlab2.Hook.Add("PreDrawTranslucentRenderables", "DropOff", function(depth, skybox)
    if zmlab2 and zmlab2.Dropoff and zmlab2.Dropoff.Stencils then
    	for k, s in pairs(zmlab2.Dropoff.Stencils) do
    		if not IsValid(s) then continue end
    		if (s.RenderStencil == false) then continue end

            -- Reset everything to known good
        	render.SetStencilWriteMask( 0xFF )
        	render.SetStencilTestMask( 0xFF )
        	render.SetStencilReferenceValue( 0 )
        	render.SetStencilCompareFunction( STENCIL_ALWAYS )
        	render.SetStencilPassOperation( STENCIL_KEEP )
        	render.SetStencilFailOperation( STENCIL_KEEP )
        	render.SetStencilZFailOperation( STENCIL_KEEP )
        	render.ClearStencil()

    		render.SetStencilEnable(true)
    		render.SetStencilWriteMask(255)
    		render.SetStencilTestMask(255)
    		render.SetStencilReferenceValue(57)
    		render.SetStencilCompareFunction(STENCIL_NOTEQUAL)
    		render.SetStencilPassOperation(STENCIL_REPLACE)
    		render.SetStencilFailOperation(STENCIL_ZERO)
    		render.SetStencilZFailOperation(STENCIL_KEEP)


            cam.Start3D2D(s:GetPos() + s:GetUp() * 1, s:GetAngles(), 0.5)
    			draw.RoundedBox(0, -75, -100, 150, 200, zmlab2.colors["black01"])
    		cam.End3D2D()

    		render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)

    		//render.SuppressEngineLighting(true)
    		render.DepthRange(0, 0.7)

    		if IsValid(s.csModel) then
    			s.csModel:DrawModel()
                if s.IsClosed then
                    s.SmoothAnim = Lerp(1 * FrameTime(),s.SmoothAnim,0)
                    s.csModel:SetPoseParameter("zmlab2_mover",s.SmoothAnim)
                else
                    s.SmoothAnim = Lerp(1 * FrameTime(),s.SmoothAnim,1)
                    s.csModel:SetPoseParameter("zmlab2_mover",s.SmoothAnim)
                end
    		end

    		//render.SuppressEngineLighting(false)
    		render.SetStencilEnable(false)
    		render.DepthRange(0, 1)
    	end
    end
end)


//zmlab2.Dropoff.Indicator = nil
local function AddHint(pos)
    zmlab2.Dropoff.Indicator = {
        pos = pos,
        created = CurTime()
    }

    zmlab2.Hook.Remove("HUDPaint", "Indicator")
    zmlab2.Hook.Add("HUDPaint", "Indicator", zmlab2.Dropoff.DrawIndicator)
end
net.Receive("zmlab2_DropOff_AddHint", function()
    local pos = net.ReadVector()
    if pos == nil then return end
    AddHint(pos)
end)

net.Receive("zmlab2_DropOff_RemoveHint", function()
    zmlab2.Hook.Remove("HUDPaint", "Indicator")
    zmlab2.Dropoff.Indicator = nil
end)

local function DrawBox(x,y,w,h,txt)
    draw.RoundedBox(0, x - (w / 2), y - (h / 2), w, h, zmlab2.colors["black02"])
    draw.SimpleText(txt, zmlab2.GetFont("zmlab2_font00"), x, y, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    zmlab2.util.DrawOutlinedBox(x - (w / 2), y - (h / 2), w, h, 2, color_white)
end

function zmlab2.Dropoff.DrawIndicator()
    local ply = LocalPlayer()

    if IsValid(ply) and ply:Alive() and zmlab2.Dropoff and zmlab2.Dropoff.Indicator and zmlab2.Dropoff.Indicator.pos and zmlab2.Dropoff.Indicator.created then

        if CurTime() >= (zmlab2.Dropoff.Indicator.created + zmlab2.config.DropOffPoint.DeliverTime) then
            zmlab2.Dropoff.Indicator = nil
            zmlab2.Hook.Remove("HUDPaint", "Indicator")
            return
        end

        if zmlab2.util.InDistance(ply:GetPos(), zmlab2.Dropoff.Indicator.pos, 100) then return end

        local pos = zmlab2.Dropoff.Indicator.pos:ToScreen()

        if zmlab2.config.DropOffPoint.Draw_Time then
            local time = math.Round((zmlab2.Dropoff.Indicator.created + zmlab2.config.DropOffPoint.DeliverTime) - CurTime())
            DrawBox(pos.x, pos.y + 60,140,30,string.FormattedTime(time, "%02i:%02i"))
        end

        if zmlab2.config.DropOffPoint.Draw_Icon then
            surface.SetDrawColor(color_white )
            surface.SetMaterial(zmlab2.materials["icon_meth"])
            surface.DrawTexturedRectRotated(pos.x, pos.y, 100, 100, 0 )
        end
    end
end

--PATH addons/_adminmodules/lua/ulx/xgui/settings/server.lua:
--Server settings module for ULX GUI -- by Stickly Man!
--A settings module for modifying server and ULX based settings. Also has the base code for loading the server settings modules.

local server = xlib.makepanel{ parent=xgui.null }

--------------------------GMOD Settings--------------------------
xlib.makecheckbox{ x=10, y=10, label="Enable Voice Chat", repconvar="rep_sv_voiceenable", parent=server }
xlib.makelabel{ x=10, y=33, label="Alltalk setting:", parent=server }
xlib.makecombobox{ x=10, y=50, w=120, repconvar="rep_sv_alltalk", isNumberConvar=true, choices={ "Team near you", "Team only", "Everyone near you", "Everyone" }, parent=server }
xlib.makecheckbox{ x=10, y=75, label="Disable AI", repconvar="rep_ai_disabled", parent=server }
xlib.makecheckbox{ x=10, y=95, label="AI Ignore Players", repconvar="rep_ai_ignoreplayers", parent=server }
local offset = 0
if game.SinglePlayer() then
	offset = 20
	xlib.makecheckbox{ x=10, y=115, label="Keep AI Ragdolls", repconvar="rep_ai_keepragdolls", parent=server }
end
xlib.makelabel{ x=10, y=120+offset, label="sv_gravity", parent=server }
xlib.makeslider{ x=10, y=135+offset, label="<--->", w=125, min=-1000, max=1000, repconvar="rep_sv_gravity", parent=server }
xlib.makelabel{ x=10, y=165+offset, label="phys_timescale", parent=server }
xlib.makeslider{ x=10, y=180+offset, label="<--->", w=125, min=0, max=4, decimal=2, repconvar="rep_phys_timescale", parent=server }

------------------------ULX Category Menu------------------------
server.mask = xlib.makepanel{ x=295, y=5, w=290, h=322, parent=server }
server.panel = xlib.makepanel{ x=5, w=285, h=322, parent=server.mask }

server.catList = xlib.makelistview{ x=145, y=5, w=150, h=322, parent=server }
server.catList:AddColumn( "Server Setting Modules" )
server.catList.Columns[1].DoClick = function() end
server.catList.OnRowSelected = function( self, LineID, Line )
	local nPanel = xgui.modules.submodule[Line:GetValue(2)].panel
	if nPanel ~= server.curPanel then
		if server.curPanel then
			local temppanel = server.curPanel
			--Close before opening new one
			xlib.addToAnimQueue( "pnlSlide", { panel=server.panel, startx=5, starty=0, endx=-285, endy=0, setvisible=false } )
			xlib.addToAnimQueue( function()	temppanel:SetVisible( false ) end )
		end
		--Open
		server.curPanel = nPanel
		xlib.addToAnimQueue( function() nPanel:SetVisible( true ) end )
		if nPanel.onOpen then xlib.addToAnimQueue( nPanel.onOpen ) end --If the panel has it, call a function when it's opened
		xlib.addToAnimQueue( "pnlSlide", { panel=server.panel, startx=-285, starty=0, endx=5, endy=0, setvisible=true } )
	else
		--Close
		server.curPanel = nil
		self:ClearSelection()
		xlib.addToAnimQueue( "pnlSlide", { panel=server.panel, startx=5, starty=0, endx=-285, endy=0, setvisible=false } )
		xlib.addToAnimQueue( function() nPanel:SetVisible( false ) end )
	end
	xlib.animQueue_start()
end

function xgui.openServerModule( name )
	name = string.lower( name )
	for i = 1, #xgui.modules.submodule do
		local module = xgui.modules.submodule[i]
		if module.mtype == "server" and string.lower(module.name) == name then
			if module.panel ~= server.curPanel then
				server.catList:ClearSelection()
				for i=1, #server.catList.Lines do
					local line = server.catList.Lines[i]
					if string.lower(line:GetColumnText(1)) == name then
						server.catList:SelectItem( line )
						break
					end
				end
			end
			break
		end
	end
end

--Process modular settings
function server.processModules()
	server.catList:Clear()
	for i, module in ipairs( xgui.modules.submodule ) do
		if module.mtype == "server" and ( not module.access or LocalPlayer():query( module.access ) ) then
			local w,h = module.panel:GetSize()
			if w == h and h == 0 then module.panel:SetSize( 275, 322 ) end

			if module.panel.scroll then --For DListLayouts
				module.panel.scroll.panel = module.panel
				module.panel = module.panel.scroll
			end
			module.panel:SetParent( server.panel )

			local line = server.catList:AddLine( module.name, i )
			if ( module.panel == server.curPanel ) then
				server.curPanel = nil
				server.catList:SelectItem( line )
			else
				module.panel:SetVisible( false )
			end
		end
	end
	server.catList:SortByColumn( 1, false )
end
server.processModules()

xgui.hookEvent( "onProcessModules", nil, server.processModules, "serverSettingsProcessModules" )
xgui.addSettingModule( "Server", server, "icon16/server.png", "xgui_svsettings" )


---------------------------
--Server Settings Modules--
---------------------------
--These are submodules that load into the server settings module above.

-------------------------Admin Votemaps--------------------------
local plist = xlib.makelistlayout{ w=275, h=322, parent=xgui.null }
plist:Add( xlib.makelabel{ label="Admin Votemap Settings" } )
plist:Add( xlib.makelabel{ label="Ratio of votes needed to accept a mapchange" } )
--plist:Add( xlib.makeslider{ label="<--->", min=0, max=1, decimal=2, repconvar="ulx_votemap2Successratio" } )
plist:Add( xlib.makelabel{ label="Minimum votes for a successful mapchange" } )
--plist:Add( xlib.makeslider{ label="<--->", min=0, max=10, repconvar="ulx_votemap2Minvotes" } )
xgui.addSubModule( "ULX Admin Votemaps", plist, nil, "server" )

-----------------------------Adverts-----------------------------
xgui.prepareDataType( "adverts" )
local adverts = xlib.makepanel{ parent=xgui.null }
adverts.tree = xlib.maketree{ w=120, h=296, parent=adverts }
adverts.tree.DoClick = function( self, node )
	adverts.removebutton:SetDisabled( false )
	adverts.updatebutton:SetDisabled( not node.data )
	adverts.nodeup:SetDisabled( not node.data or type( node.group ) == "number" )
	adverts.nodedown:SetDisabled( not node.data or not type( node.group ) == "number" or adverts.isBottomNode( node ) )
	adverts.group:SetText( type(node.group) ~= "number" and node.group or "<No Group>" )
	if node.data then
		adverts.message:SetText( node.data.message )
		adverts.time:SetValue( node.data.rpt )
		adverts.color:SetColor( node.data.color )
		adverts.csay:SetOpen( node.data.len )
		adverts.csay:InvalidateLayout()
		adverts.display:SetValue( node.data.len or 10 )
	end
end
function adverts.isBottomNode( node )
	local parentnode = node:GetParentNode()
	local parentchildren = parentnode.ChildNodes:GetChildren()

	if parentnode:GetParentNode().ChildNodes then --Is node within a subgroup?
		local parentparentchildren = parentnode:GetParentNode().ChildNodes:GetChildren()
		return parentchildren[#parentchildren] == node and parentparentchildren[#parentparentchildren] == parentnode
	else
		return not adverts.hasGroups or parentchildren[#parentchildren] == node
	end
end
--0 middle, 1 bottom, 2 top, 3 top and bottom
function adverts.getNodePos( node )
	if type( node.group ) == "number" then return 1 end
	local parentchildren = node:GetParentNode().ChildNodes:GetChildren()
	local output = 0
	if parentchildren[#parentchildren] == node then output = 1 end
	if parentchildren[1] == node then output = output + 2 end
	return output
end
adverts.tree.DoRightClick = function( self, node )
	self:SetSelectedItem( node )
	local menu = DermaMenu()
	menu:SetSkin(xgui.settings.skin)
	if not node.data then
		menu:AddOption( "Rename Group...", function() adverts.RenameAdvert( node:GetText() ) end )
	end
	menu:AddOption( "Delete", function() adverts.removeAdvert( node ) end )
	menu:Open()
end
adverts.seloffset = 0
--adverts.message = xlib.maketextbox{ x=125, w=150, h=20, text="Enter a message...", parent=adverts, selectall=true }
xlib.makelabel{ x=125, y=25, label="Time until advert repeats:", parent=adverts }
adverts.time = xlib.makeslider{ x=125, y=40, w=150, label="<--->", value=60, min=1, max=1000, tooltip="Time in seconds till the advert is shown/repeated.", parent=adverts }
adverts.group = xlib.makecombobox{ x=125, y=65, w=100, enableinput=true, parent=adverts, tooltip="Select or create a new advert group." }
adverts.color = xlib.makecolorpicker{ x=135, y=90, parent=adverts }
local panel = xlib.makelistlayout{ w=150, h=45, spacing=4, parent=xgui.null }
panel:Add( xlib.makelabel{ label="Display Time (seconds)" } )
adverts.display = xlib.makeslider{ label="<--->", min=1, max=60, value=10, tooltip="The time in seconds the CSay advert is displayed" }
-- panel:Add( adverts.display )
adverts.csay = xlib.makecat{ x=125, y=230, w=150, label="Display in center", checkbox=true, contents=panel, parent=adverts, expanded=false }
xlib.makebutton{ x=200, y=302, w=75, label="Create", parent=adverts }.DoClick = function()
	local col = adverts.color:GetColor()
	local rpt = tonumber( adverts.time:GetValue() )
	RunConsoleCommand( "xgui", "addAdvert", adverts.message:GetValue(), ( rpt < 0.1 ) and 0.1 or rpt, adverts.group:GetValue(), col.r, col.g, col.b, adverts.csay:GetExpanded() and adverts.display:GetValue() or nil)
end
adverts.removebutton = xlib.makebutton{ y=302, w=75, label="Remove", disabled=true, parent=adverts }
adverts.removebutton.DoClick = function( node )
	adverts.removeAdvert( adverts.tree:GetSelectedItem() )
end
adverts.updatebutton = xlib.makebutton{ x=125, y=302, w=75, label="Update", parent=adverts, disabled=true }
adverts.updatebutton.DoClick = function( node )
	local node = adverts.tree:GetSelectedItem()
	local col = adverts.color:GetColor()
	if ((( type( node.group ) == "number" ) and "<No Group>" or node.group ) == adverts.group:GetValue() ) then
		RunConsoleCommand( "xgui", "updateAdvert", type( node.group ), node.group, node.number, adverts.message:GetValue(), ( adverts.time:GetValue() < 0.1 ) and 0.1 or adverts.time:GetValue(), col.r, col.g, col.b, adverts.csay:GetExpanded() and adverts.display:GetValue() or nil )
	else
		RunConsoleCommand( "xgui", "removeAdvert", node.group, node.number, type( node.group ), "hold" )
		RunConsoleCommand( "xgui", "addAdvert", adverts.message:GetValue(), ( adverts.time:GetValue() < 0.1 ) and 0.1 or adverts.time:GetValue(), adverts.group:GetValue(), col.r, col.g, col.b, adverts.csay:GetExpanded() and adverts.display:GetValue() or nil)
		adverts.selnewgroup = adverts.group:GetValue()
		if xgui.data.adverts[adverts.group:GetValue()] then
			adverts.seloffset = #xgui.data.adverts[adverts.group:GetValue()]+1
		else
			adverts.seloffset = 1
		end
	end
end
adverts.nodeup = xlib.makebutton{ x=80, y=302, w=20, icon="icon16/bullet_arrow_up.png", centericon=true, parent=adverts, disabled=true }
adverts.nodeup.DoClick = function()
	adverts.nodedown:SetDisabled( true )
	adverts.nodeup:SetDisabled( true )
	local node = adverts.tree:GetSelectedItem()
	local state = adverts.getNodePos( node )
	if state <= 1 then
		RunConsoleCommand( "xgui", "moveAdvert", type( node.group ), node.group, node.number, node.number-1 )
		adverts.seloffset = adverts.seloffset - 1
	else
		local parentnode = node:GetParentNode()
		local parentparentchildren = parentnode:GetParentNode().ChildNodes:GetChildren()
		local newgroup = "<No Group>"
		for i,v in ipairs( parentparentchildren ) do
			if v == parentnode then
				if parentparentchildren[i-1] and type( parentparentchildren[i-1].group ) ~= "number" then
					newgroup = parentparentchildren[i-1].group
					adverts.selnewgroup = newgroup
					adverts.seloffset = #xgui.data.adverts[newgroup]+1
				end
				break
			end
		end
		RunConsoleCommand( "xgui", "removeAdvert", node.group, node.number, type( node.group ), "hold" )
		RunConsoleCommand( "xgui", "addAdvert", node.data.message, node.data.rpt, newgroup, node.data.color.r, node.data.color.g, node.data.color.b, node.data.len)
		if newgroup == "<No Group>" then
			adverts.selnewgroup = #xgui.data.adverts+1
			adverts.seloffset = 1
		end
	end
end
adverts.nodedown = xlib.makebutton{ x=100, y=302, w=20, icon="icon16/bullet_arrow_down.png", centericon=true, parent=adverts, disabled=true }
adverts.nodedown.DoClick = function()
	adverts.nodedown:SetDisabled( true )
	adverts.nodeup:SetDisabled( true )
	local node = adverts.tree:GetSelectedItem()
	local state = adverts.getNodePos( node )
	if state == 1 or state == 3 then
		local parentnode = type( node.group ) == "string" and node:GetParentNode() or node
		local parentchildren = parentnode:GetParentNode().ChildNodes:GetChildren()
		local newgroup = "<No Group>"
		for index,v in ipairs( parentchildren ) do
			if v == parentnode then
				local temp = 1
				while( type( parentchildren[index+temp].group ) == "number" ) do
					temp = temp + 1
				end
				if type( parentchildren[index+temp].group ) ~= "number" then
					newgroup = parentchildren[index+temp].group
					adverts.selnewgroup = newgroup
					adverts.seloffset = 1
				end
				break
			end
		end
		RunConsoleCommand( "xgui", "removeAdvert", node.group, node.number, type( node.group ), "hold" )
		RunConsoleCommand( "xgui", "addAdvert", node.data.message, node.data.rpt, newgroup, node.data.color.r, node.data.color.g, node.data.color.b, node.data.len or "", "hold" )
		RunConsoleCommand( "xgui", "moveAdvert", type( newgroup ), newgroup, #xgui.data.adverts[newgroup]+1, 1 )
	else
		RunConsoleCommand( "xgui", "moveAdvert", type( node.group ), node.group, node.number, node.number+1 )
		adverts.seloffset = adverts.seloffset + 1
	end
end
function adverts.removeAdvert( node )
	if node then
		Derma_Query( "Are you sure you want to delete this " .. ( node.data and "advert?" or "advert group?" ), "XGUI WARNING", 
		"Delete", function()
			if node.data then --Remove a single advert
				RunConsoleCommand( "xgui", "removeAdvert", node.group, node.number, type( node.group ) )
			else --Remove an advert group
				RunConsoleCommand( "xgui", "removeAdvertGroup", node.group, type( node.group ) )
			end
			adverts.tree:SetSelectedItem( nil )
		end, "Cancel", function() end )
	end
end
function adverts.RenameAdvert( old )
	advertRename = xlib.makeframe{ label="Set Name of Advert Group - " .. old, w=400, h=80, showclose=true, skin=xgui.settings.skin }
	advertRename.text = xlib.maketextbox{ x=10, y=30, w=380, h=20, text=old, parent=advertRename }
	advertRename.text.OnEnter = function( self )
		RunConsoleCommand( "xgui", "renameAdvertGroup", old, self:GetValue() )
		advertRename:Remove()
	end
	xlib.makebutton{ x=175, y=55, w=50, label="OK", parent=advertRename }.DoClick = function()
		advertRename.text:OnEnter()
	end
end
function adverts.updateAdverts()
	adverts.updatebutton:SetDisabled( true )
	adverts.nodeup:SetDisabled( true )
	adverts.nodedown:SetDisabled( true )
	adverts.removebutton:SetDisabled( true )
	--Store the currently selected node, if any
	local lastNode = adverts.tree:GetSelectedItem()
	if adverts.selnewgroup then
		lastNode.group = adverts.selnewgroup
		lastNode.number = adverts.seloffset
		adverts.selnewgroup = nil
		adverts.seloffset = 0
	end
	--Check for any previously expanded group nodes
	local groupStates = {}
	if adverts.tree.RootNode.ChildNodes then
		for _, node in ipairs( adverts.tree.RootNode.ChildNodes:GetChildren() ) do
			if node.m_bExpanded then
				groupStates[node:GetText()] = true
			end
		end
	end
	adverts.hasGroups = false
	adverts.tree:Clear()
	adverts.group:Clear()
	adverts.group:AddChoice( "<No Group>" )
	adverts.group:ChooseOptionID( 1 )

	local sortGroups = {}
	local sortSingle = {}
	for group, advertgroup in pairs( xgui.data.adverts ) do
		if type( group ) == "string" then --Check if it's a group or a single advert
			table.insert( sortGroups, group )
		else
			table.insert( sortSingle, { group=group, message=advertgroup[1].message } )
		end
	end
	table.sort( sortSingle, function(a,b) return string.lower( a.message ) < string.lower( b.message ) end )
	table.sort( sortGroups, function(a,b) return string.lower( a ) < string.lower( b ) end )
	for _, advert in ipairs( sortSingle ) do
		adverts.createNode( adverts.tree, xgui.data.adverts[advert.group][1], advert.group, 1, xgui.data.adverts[advert.group][1].message, lastNode )
	end
	for _, group in ipairs( sortGroups ) do
		advertgroup = xgui.data.adverts[group]
		adverts.hasGroups = true
		local foldernode = adverts.tree:AddNode( group, "icon16/folder.png" )
		adverts.group:AddChoice( group )
		foldernode.group = group
		--Check if folder was previously selected
		if lastNode and not lastNode.data and lastNode:GetValue() == group then
			adverts.tree:SetSelectedItem( foldernode )
			adverts.removebutton:SetDisabled( false )
		end
		for advert, data in ipairs( advertgroup ) do
			adverts.createNode( foldernode, data, group, advert, data.message, lastNode )
		end
		--Expand folder if it was expanded previously
		if groupStates[group] then foldernode:SetExpanded( true, true ) end
	end

	adverts.tree:InvalidateLayout()
	local node = adverts.tree:GetSelectedItem()
	if node then
		if adverts.seloffset ~= 0 then
			for i,v in ipairs( node:GetParentNode().ChildNodes:GetChildren() ) do
				if v == node then
					node = node:GetParentNode().ChildNodes:GetChildren()[i+adverts.seloffset]
					adverts.tree:SetSelectedItem( node )
					break
				end
			end
			adverts.seloffset = 0
		end
		if adverts.isBottomNode( node ) then adverts.nodedown:SetDisabled( true ) end
		adverts.nodeup:SetDisabled( type( node.group ) == "number" )
	end
end
function adverts.createNode( parent, data, group, number, message, lastNode )
	local node = parent:AddNode( message, data.len and "icon16/style.png" or "icon16/text_smallcaps.png" )
	node.data = data
	node.group = group
	node.number = number
	node:SetTooltip( xlib.wordWrap( message, 250, "Default" ) )
	if lastNode and lastNode.data then
		--Check if node was previously selected
		if lastNode.group == group and lastNode.number == number then
			adverts.tree:SetSelectedItem( node )
			adverts.group:SetText( type(node.group) ~= "number" and node.group or "<No Group>" )
			adverts.updatebutton:SetDisabled( false )
			adverts.nodeup:SetDisabled( false )
			adverts.nodedown:SetDisabled( false )
			adverts.removebutton:SetDisabled( false )
		end
	end
end
function adverts.onOpen()
	ULib.queueFunctionCall( adverts.tree.InvalidateLayout, adverts.tree )
end
adverts.updateAdverts() -- For autorefresh
xgui.hookEvent( "adverts", "process", adverts.updateAdverts, "serverUpdateAdverts" )
xgui.addSubModule( "ULX Adverts", adverts, nil, "server" )

---------------------------Ban Message---------------------------
xgui.prepareDataType( "banmessage" )
local plist = xlib.makelistlayout{ w=275, h=322, parent=xgui.null }
plist:Add( xlib.makelabel{ label="Message Shown to Banned Users", zpos=1 } )
plist.txtBanMessage = xlib.maketextbox{ zpos=2, h=236, multiline=true }
plist:Add( plist.txtBanMessage )
plist:Add( xlib.makelabel{ label="Insert variable:", zpos=3 } )
plist.variablePicker = xlib.makecombobox{ choices={ "Banned By - Admin:SteamID who created the ban", "Ban Start - Date/Time the ban was created", "Reason", "Time Left", "SteamID (excluding non-number characters)", "SteamID64 (useful for constructing URLs for appealing bans)" }, zpos=4 }
plist:Add( plist.variablePicker )

plist.btnPreview = xlib.makebutton{ label="Preview Ban Message", zpos=4 }
plist.btnPreview.DoClick = function()
	net.Start( "XGUI.PreviewBanMessage" )
		net.WriteString( plist.txtBanMessage:GetText() )
	net.SendToServer()
end
xgui.handleBanPreview = function( message )
	local preview = xlib.makeframe{ w=380, h=200 }
	local message = xlib.makelabel{ x=20, y=35, label=message, textcolor=Color( 191, 191, 191, 255 ), font="DefaultLarge", parent=preview }
	message:SizeToContents()
	local close = xlib.makebutton{ x=288, y=message:GetTall()+42, w=72, h=24, label="Close", font="DefaultLarge", parent=preview }
	close.DoClick = function()
		preview:Remove()
	end
	preview:SetTall( message:GetTall() + 85 )
end
plist:Add( plist.btnPreview )
plist.btnSave = xlib.makebutton{ label="Save Ban Message", zpos=5 }
plist.btnSave.DoClick = function()
	net.Start( "XGUI.SaveBanMessage" )
		net.WriteString( plist.txtBanMessage:GetText() )
	net.SendToServer()
end
plist:Add( plist.btnSave )

plist.variablePicker.OnSelect = function( self, index, value, data )
	self:SetValue( "" )
	local newVariable = ""
	if index == 1 then
		newVariable = "{{BANNED_BY}}"
	elseif index == 2 then
		newVariable = "{{BAN_START}}"
	elseif index == 3 then
		newVariable = "{{REASON}}"
	elseif index == 4 then
		newVariable = "{{TIME_LEFT}}"
	elseif index == 5 then
		newVariable = "{{STEAMID}}"
	elseif index == 6 then
		newVariable = "{{STEAMID64}}"
	end
	plist.txtBanMessage:SetText( plist.txtBanMessage:GetText() .. newVariable )
end

plist.updateBanMessage = function()
	plist.txtBanMessage:SetText( xgui.data.banmessage.message or "" )
end
plist.updateBanMessage()
xgui.hookEvent( "banmessage", "process", plist.updateBanMessage, "serverUpdateBanMessage" )

xgui.addSubModule( "ULX Ban Message", plist, nil, "server" )

------------------------------Echo-------------------------------
local plist = xlib.makelistlayout{ w=275, h=322, parent=xgui.null }
plist:Add( xlib.makelabel{ label="Command/Event echo settings" } )
plist:Add( xlib.makecheckbox{ label="Echo players vote choices", repconvar="ulx_voteEcho" } )
plist:Add( xlib.makecombobox{ repconvar="ulx_logEcho", isNumberConvar=true, choices={ "Do not echo admin commands", "Echo admin commands anonymously", "Echo commands and identify admin" } } )
plist:Add( xlib.makecombobox{ repconvar="ulx_logSpawnsEcho", isNumberConvar=true, choices={ "Do not echo spawns", "Echo spawns to admins only", "Echo spawns to everyone" } } )
plist:Add( xlib.makecheckbox{ label="Enable colored event echoes", repconvar="ulx_logEchoColors" } )

plist:Add( xlib.makelabel{ label="Default text color" } )
plist:Add( xlib.makecolorpicker{ repconvar="ulx_logEchoColorDefault", noalphamodetwo=true } )
plist:Add( xlib.makelabel{ label="Color for console" } )
plist:Add( xlib.makecolorpicker{ repconvar="ulx_logEchoColorConsole", noalphamodetwo=true } )
plist:Add( xlib.makelabel{ label="Color for self" } )
plist:Add( xlib.makecolorpicker{ repconvar="ulx_logEchoColorSelf", noalphamodetwo=true } )
plist:Add( xlib.makelabel{ label="Color for everyone" } )
plist:Add( xlib.makecolorpicker{ repconvar="ulx_logEchoColorEveryone", noalphamodetwo=true } )
plist:Add( xlib.makecheckbox{ label="Show team colors for players", repconvar="ulx_logEchoColorPlayerAsGroup" } )
plist:Add( xlib.makelabel{ label="Color for players (when above is disabled)" } )
plist:Add( xlib.makecolorpicker{ repconvar="ulx_logEchoColorPlayer", noalphamodetwo=true } )
plist:Add( xlib.makelabel{ label="Color for everything else" } )
plist:Add( xlib.makecolorpicker{ repconvar="ulx_logEchoColorMisc", noalphamodetwo=true } )
xgui.addSubModule( "ULX Command/Event Echoes", plist, nil, "server" )

------------------------General Settings-------------------------
local plist = xlib.makelistlayout{ w=275, h=322, parent=xgui.null }
plist:Add( xlib.makelabel{ label="General ULX Settings" } )
--plist:Add( xlib.makeslider{ label="Chat spam time", min=0, max=5, decimal=1, repconvar="ulx_chattime" } )
plist:Add( xlib.makelabel{ label="\nAllow '/me' chat feature" } )
plist:Add( xlib.makecombobox{ repconvar="ulx_meChatEnabled", isNumberConvar=true, choices={ "Disabled", "Sandbox Only", "Enabled" } } )
plist:Add( xlib.makelabel{ label="\nWelcome Message" } )
plist:Add( xlib.maketextbox{ repconvar="ulx_welcomemessage", selectall=true } )
plist:Add( xlib.makelabel{ label="Allowed variables: %curmap%, %host%" } )
plist:Add( xlib.makelabel{ label="\nAuto Name-Changing Kicker" } )
plist:Add( xlib.makelabel{ label="Number of name changes till kicked (0 disables)" } )
--plist:Add( xlib.makeslider{ label="<--->", min=0, max=10, decimal=0, repconvar="ulx_kickAfterNameChanges" } )
--plist:Add( xlib.makeslider{ label="Cooldown time (seconds)", min=0, max=600, decimal=0, repconvar="ulx_kickAfterNameChangesCooldown" } )
plist:Add( xlib.makecheckbox{ label="Warn players how many name-changes remain", repconvar="ulx_kickAfterNameChangesWarning" } )

xgui.addSubModule( "ULX General Settings", plist, nil, "server" )

------------------------------Gimps------------------------------
xgui.prepareDataType( "gimps" )
local gimps = xlib.makepanel{ parent=xgui.null }
gimps.textbox = xlib.maketextbox{ w=225, h=20, parent=gimps, selectall=true }
gimps.textbox.OnEnter = function( self )
	if self:GetValue() then
		RunConsoleCommand( "xgui", "addGimp", self:GetValue() )
		self:SetText( "" )
	end
end
gimps.textbox.OnGetFocus = function( self )
	gimps.button:SetText( "Add" )
	self:SelectAllText()
	xgui.anchor:SetKeyboardInputEnabled( true )
end
gimps.button = xlib.makebutton{ x=225, w=50, label="Add", parent=gimps }
gimps.button.DoClick = function( self )
	if self:GetValue() == "Add" then
		gimps.textbox:OnEnter()
	elseif gimps.list:GetSelectedLine() then
		RunConsoleCommand( "xgui", "removeGimp", gimps.list:GetSelected()[1]:GetColumnText(1) )
	end
end
-- gimps.list = xlib.makelistview{ y=20, w=275, h=302, multiselect=false, headerheight=0, parent=gimps }
-- gimps.list:AddColumn( "Gimp Sayings" )
-- gimps.list.OnRowSelected = function( self, LineID, Line )
-- 	gimps.button:SetText( "Remove" )
-- end
gimps.updateGimps = function()
--	gimps.list:Clear()
	for k, v in pairs( xgui.data.gimps ) do
		gimps.list:AddLine( v )
	end
end
gimps.updateGimps()
xgui.hookEvent( "gimps", "process", gimps.updateGimps, "serverUpdateGimps" )
xgui.addSubModule( "ULX Gimps", gimps, nil, "server" )

------------------------Kick/Ban Reasons-------------------------
xgui.prepareDataType( "banreasons", ulx.common_kick_reasons )
local panel = xlib.makepanel{ parent=xgui.null }
panel.textbox = xlib.maketextbox{ w=225, h=20, parent=panel, selectall=true }
panel.textbox.OnEnter = function( self )
	if self:GetValue() then
		RunConsoleCommand( "xgui", "addBanReason", self:GetValue() )
		self:SetText( "" )
	end
end
panel.textbox.OnGetFocus = function( self )
	panel.button:SetText( "Add" )
	self:SelectAllText()
	xgui.anchor:SetKeyboardInputEnabled( true )
end
panel.button = xlib.makebutton{ x=225, w=50, label="Add", parent=panel }
panel.button.DoClick = function( self )
	if self:GetValue() == "Add" then
		panel.textbox:OnEnter()
	elseif panel.list:GetSelectedLine() then
		RunConsoleCommand( "xgui", "removeBanReason", panel.list:GetSelected()[1]:GetColumnText(1) )
	end
end
panel.list = xlib.makelistview{ y=20, w=275, h=302, multiselect=false, headerheight=0, parent=panel }
panel.list:AddColumn( "Kick/Ban Reasons" )
panel.list.OnRowSelected = function()
	panel.button:SetText( "Remove" )
end
panel.updateBanReasons = function()
	panel.list:Clear()
	for k, v in pairs( ulx.common_kick_reasons ) do
		panel.list:AddLine( v )
	end
end
panel.updateBanReasons()
xgui.hookEvent( "banreasons", "process", panel.updateBanReasons, "serverUpdateBanReasons" )
xgui.addSubModule( "ULX Kick/Ban Reasons", panel, "xgui_managebans", "server" )

--------------------------Log Settings---------------------------
local plist = xlib.makelistlayout{ w=275, h=322, parent=xgui.null }
plist:Add( xlib.makelabel{ label="Logging Settings" } )
plist:Add( xlib.makecheckbox{ label="Enable Logging to Files", repconvar="ulx_logFile" } )
plist:Add( xlib.makecheckbox{ label="Log Chat", repconvar="ulx_logChat" } )
plist:Add( xlib.makecheckbox{ label="Log Player Events (Connects, Deaths, etc.)", repconvar="ulx_logEvents" } )
plist:Add( xlib.makecheckbox{ label="Log Spawns (Props, Effects, Ragdolls, etc.)", repconvar="ulx_logSpawns" } )
plist:Add( xlib.makelabel{ label="Save log files to this directory:" } )
local logdirbutton = xlib.makebutton{}
xlib.checkRepCvarCreated( "ulx_logdir" )
logdirbutton:SetText( "data/" .. GetConVar( "ulx_logDir" ):GetString() )

function logdirbutton.ConVarUpdated( sv_cvar, cl_cvar, ply, old_val, new_val )
	if cl_cvar == "ulx_logdir" then
		logdirbutton:SetText( "data/" .. new_val )
	end
end
hook.Add( "ULibReplicatedCvarChanged", "XGUI_ulx_logDir", logdirbutton.ConVarUpdated )
plist:Add( logdirbutton )
xgui.addSubModule( "ULX Logs", plist, nil, "server" )

------------------------------Motd-------------------------------
xgui.prepareDataType( "motdsettings" )
local motdpnl = xlib.makepanel{ w=275, h=322, parent=xgui.null }
local plist = xlib.makelistlayout{ w=275, h=298, parent=motdpnl }

local fontWeights = { "normal", "bold", "100", "200", "300", "400", "500", "600", "700", "800", "900", "lighter", "bolder" }
local commonFonts = { "Arial", "Arial Black", "Calibri", "Candara", "Cambria", "Consolas", "Courier New", "Fraklin Gothic Medium", "Futura", "Georgia", "Helvetica", "Impact", "Lucida Console", "Segoe UI", "Tahoma", "Times New Roman", "Trebuchet MS", "Verdana" }


plist:Add( xlib.makelabel{ label="MOTD Mode:", zpos=0 } )
plist:Add( xlib.makecombobox{ repconvar="ulx_showmotd", isNumberConvar=true, choices={ "0 - Disabled", "1 - Local File", "2 - MOTD Generator", "3 - URL" }, zpos=1 } )
plist.txtMotdFile = xlib.maketextbox{ repconvar="ulx_motdfile", zpos=2 }
plist:Add( plist.txtMotdFile )
plist.txtMotdURL = xlib.maketextbox{ repconvar="ulx_motdurl", zpos=3 }
plist:Add( plist.txtMotdURL )
plist.lblDescription = xlib.makelabel{ zpos=4 }
plist:Add( plist.lblDescription )


----- MOTD Generator helper methods
local function unitToNumber(value)
	return tonumber( string.gsub(value, "[^%d]", "" ), _ )
end

local function hexToColor(value)
	value = string.gsub(value, "#","")
	return Color(tonumber("0x"..value:sub(1,2)), tonumber("0x"..value:sub(3,4)), tonumber("0x"..value:sub(5,6)))
end

local function colorToHex(color)
	return string.format("#%02x%02x%02x", color.r, color.g, color.b )
end

local didPressEnter = false
local selectedPanelTag = nil
-- local function registerMOTDChangeEventsTextbox( textbox, setting, sendTable )
-- 	textbox.hasChanged = false

-- 	textbox.OnEnter = function( self )
-- 		didPressEnter = true
-- 	end

-- 	textbox.OnLoseFocus = function( self )
-- 		selectedPanelTag = nil
-- 		hook.Call( "OnTextEntryLoseFocus", nil, self )

-- 		-- OnLoseFocus gets called twice when pressing enter. This will hackishly take care of one of them.
-- 		if didPressEnter then
-- 			didPressEnter = false
-- 			return
-- 		end

-- 		if self:GetValue() and textbox.hasChanged then
-- 			textbox.hasChanged = false
-- 			if sendTable then
-- 				net.Start( "XGUI.SetMotdData" )
-- 					net.WriteString( setting )
-- 					net.WriteTable( ULib.explode( "\n", self:GetValue() ) )
-- 				net.SendToServer()
-- 			else
-- 				net.Start( "XGUI.UpdateMotdData" )
-- 					net.WriteString( setting )
-- 					net.WriteString( self:GetValue() )
-- 				net.SendToServer()
-- 			end
-- 		end
-- 	end

-- 	-- Don't submit the data if the text hasn't changed.
-- 	textbox:SetUpdateOnType( true )
-- 	textbox.OnValueChange = function( self, strValue )
-- 		textbox.hasChanged = true
-- 	end

-- 	-- Store focused setting so we can re-set the focused element when the panels are recreated.
-- 	textbox.OnGetFocus = function( self )
-- 		hook.Run( "OnTextEntryGetFocus", self )
-- 		selectedPanelTag = setting
-- 	end
-- 	if selectedPanelTag == setting then
-- 		timer.Simple( 0, function() textbox:RequestFocus() end )
-- 	end

-- end

local function registerMOTDChangeEventsCombobox( combobox, setting )
	-- registerMOTDChangeEventsTextbox( combobox.TextEntry, setting )

	combobox.OnSelect = function( self )
		net.Start( "XGUI.UpdateMotdData" )
			net.WriteString( setting )
			net.WriteString( self:GetValue() )
		net.SendToServer()
	end
end

local function registerMOTDChangeEventsSlider( slider, setting )
	-- registerMOTDChangeEventsTextbox( slider.TextArea, setting )

	-- local tmpfunc = slider.Slider.SetDragging
	-- slider.Slider.SetDragging = function( self, bval )
	-- 	tmpfunc( self, bval )
	-- 	if ( !bval ) then
	-- 		net.Start( "XGUI.UpdateMotdData" )
	-- 			net.WriteString( setting )
	-- 			net.WriteString( slider.TextArea:GetValue() )
	-- 		net.SendToServer()
	-- 	end
	-- end

	-- local tmpfunc2 = slider.Scratch.OnMouseReleased
	-- slider.Scratch.OnMouseReleased = function( self, mousecode )
	-- 	tmpfunc2( self, mousecode )
	-- 	net.Start( "XGUI.UpdateMotdData" )
	-- 		net.WriteString( setting )
	-- 		net.WriteString( slider.TextArea:GetValue() )
	-- 	net.SendToServer()
	-- end
end

local function registerMOTDChangeEventsColor( colorpicker, setting )
	colorpicker.OnChange = function( self, color )
		net.Start( "XGUI.UpdateMotdData" )
			net.WriteString( setting )
			net.WriteString( colorToHex( color ) )
		net.SendToServer()
	end
end

local function performMOTDInfoUpdate( data, setting )
	net.Start( "XGUI.SetMotdData" )
		net.WriteString( setting )
		net.WriteTable( data )
	net.SendToServer()
end


-- MOTD Generator UI
plist.generator = xlib.makelistlayout{ w=255, h=250, zpos=6 }
plist:Add( plist.generator )
plist.generator:SetVisible( false )

plist.generator:Add( xlib.makelabel{ label="MOTD Generator Title:", zpos=-2 } )

local txtServerDescription = xlib.maketextbox{ zpos=-1 }
plist.generator:Add( txtServerDescription )

plist.generator:Add( xlib.makelabel{ label="\nMOTD Generator Info" } )
local pnlInfo = xlib.makelistlayout{ w=271 }
plist.generator:Add( pnlInfo )

plist.generator:Add( xlib.makelabel{} )

local btnAddSection = xlib.makebutton{ label="Add a New Section..." }
btnAddSection.DoClick = function()
	local menu = DermaMenu()
	menu:SetSkin(xgui.settings.skin)
	menu:AddOption( "Text Content", function()
		local info = xgui.data.motdsettings.info
		table.insert( info, {
			type="text",
			title="About This Server",
			contents={"Enter server description here!"}
		})
		performMOTDInfoUpdate( info[#info], "info["..#info.."]" )
	end )
	menu:AddOption( "Bulleted List", function()
		local info = xgui.data.motdsettings.info
		table.insert( info, {
			type="list",
			title="Example List",
			contents={"Each newline becomes its own bullet point.", "You can add as many as you need!"}
		})
		performMOTDInfoUpdate( info[#info], "info["..#info.."]" )
	end )
	menu:AddOption( "Numbered List", function()
		local info = xgui.data.motdsettings.info
		table.insert( info, {
			type="ordered_list",
			title="Example Numbered List",
			contents={"Each newline becomes its own numbered item.", "You can add as many as you need!"}
		})
		performMOTDInfoUpdate( info[#info], "info["..#info.."]" )
	end )
	menu:AddOption( "Installed Addons", function()
		local info = xgui.data.motdsettings.info
		table.insert( info, {
			type="mods",
			title="Installed Addons"
		})
		performMOTDInfoUpdate( info[#info], "info["..#info.."]" )
	end )
	menu:AddOption( "List Users in Group", function()
		local info = xgui.data.motdsettings.info
		table.insert( info, {
			type="admins",
			title="Our Admins",
			contents={"superadmin", "admin"}
		})
		performMOTDInfoUpdate( info[#info], "info["..#info.."]" )
	end )
	menu:Open()
end
plist.generator:Add( btnAddSection )

plist.generator:Add( xlib.makelabel{ label="\nMOTD Generator Fonts" } )

plist.generator:Add( xlib.makelabel{ label="\nServer Name (Title)" } )
local pnlFontServerName = xlib.makepanel{h=80, parent=xgui.null }
xlib.makelabel{ x=5, y=8, label="Font Name", parent=pnlFontServerName }
pnlFontServerName.name = xlib.makecombobox{ x=65, y=5, w=190, enableinput=true, selectall=true, choices=commonFonts, parent=pnlFontServerName }
pnlFontServerName.size = xlib.makeslider{ x=5, y=30, w=250, label="Font Size (Pixels)", value=16, min=4, max=72, parent=pnlFontServerName }
xlib.makelabel{ x=5, y=58, label="Font Weight", parent=pnlFontServerName }
pnlFontServerName.weight = xlib.makecombobox{ x=72, y=55, w=183, enableinput=true, selectall=true, choices=fontWeights, parent=pnlFontServerName }
plist.generator:Add( pnlFontServerName )

plist.generator:Add( xlib.makelabel{ label="\nServer Description (Subtitle)" } )
local pnlFontSubtitle = xlib.makepanel{h=80, parent=xgui.null }
xlib.makelabel{ x=5, y=8, label="Font Name", parent=pnlFontSubtitle }
pnlFontSubtitle.name = xlib.makecombobox{ x=65, y=5, w=190, enableinput=true, selectall=true, choices=commonFonts, parent=pnlFontSubtitle }
pnlFontSubtitle.size = xlib.makeslider{ x=5, y=30, w=250, label="Font Size (Pixels)", value=16, min=4, max=72, parent=pnlFontSubtitle }
xlib.makelabel{ x=5, y=58, label="Font Weight", parent=pnlFontSubtitle }
pnlFontSubtitle.weight = xlib.makecombobox{ x=72, y=55, w=183, enableinput=true, selectall=true, choices=fontWeights, parent=pnlFontSubtitle }
plist.generator:Add( pnlFontSubtitle )

plist.generator:Add( xlib.makelabel{ label="\nSection Title" } )
local pnlFontSection = xlib.makepanel{h=80, parent=xgui.null }
xlib.makelabel{ x=5, y=8, label="Font Name", parent=pnlFontSection }
pnlFontSection.name = xlib.makecombobox{ x=65, y=5, w=190, enableinput=true, selectall=true, choices=commonFonts, parent=pnlFontSection }
pnlFontSection.size = xlib.makeslider{ x=5, y=30, w=250, label="Font Size (Pixels)", value=16, min=4, max=72, parent=pnlFontSection }
xlib.makelabel{ x=5, y=58, label="Font Weight", parent=pnlFontSection }
pnlFontSection.weight = xlib.makecombobox{ x=72, y=55, w=183, enableinput=true, selectall=true, choices=fontWeights, parent=pnlFontSection }
plist.generator:Add( pnlFontSection )

plist.generator:Add( xlib.makelabel{ label="\nRegular Text" } )
local pnlFontRegular = xlib.makepanel{ h=80, parent=xgui.null }
xlib.makelabel{ x=5, y=8, label="Font Name", parent=pnlFontRegular }
pnlFontRegular.name = xlib.makecombobox{ x=65, y=5, w=190, enableinput=true, selectall=true, choices=commonFonts, parent=pnlFontRegular }
pnlFontRegular.size = xlib.makeslider{ x=5, y=30, w=250, label="Font Size (Pixels)", value=16, min=4, max=72, parent=pnlFontRegular }
xlib.makelabel{ x=5, y=58, label="Font Weight", parent=pnlFontRegular }
pnlFontRegular.weight = xlib.makecombobox{ x=72, y=55, w=183, enableinput=true, selectall=true, choices=fontWeights, parent=pnlFontRegular }
plist.generator:Add( pnlFontRegular )


plist.generator:Add( xlib.makelabel{ label="\nMOTD Generator Colors\n" } )

plist.generator:Add( xlib.makelabel{ label="Background Color" } )
local pnlColorBackground = xlib.makecolorpicker{ noalphamodetwo=true }
plist.generator:Add( pnlColorBackground )
plist.generator:Add( xlib.makelabel{ label="Header Color" } )
local pnlColorHeaderBackground = xlib.makecolorpicker{ noalphamodetwo=true }
plist.generator:Add( pnlColorHeaderBackground )
plist.generator:Add( xlib.makelabel{ label="Header Text Color" } )
local pnlColorHeader = xlib.makecolorpicker{ noalphamodetwo=true }
plist.generator:Add( pnlColorHeader )
plist.generator:Add( xlib.makelabel{ label="Section Header Text Color" } )
local pnlColorSection = xlib.makecolorpicker{ noalphamodetwo=true }
plist.generator:Add( pnlColorSection )
plist.generator:Add( xlib.makelabel{ label="Default Text Color" } )
local pnlColorText = xlib.makecolorpicker{ noalphamodetwo=true }
plist.generator:Add( pnlColorText )

plist.generator:Add( xlib.makelabel{ label="\nMOTD Generator Top/Bottom Borders\n" } )

local pnlBorderThickness = xlib.makeslider{ label="Border Thickness (Pixels)", w=200, value=1, min=0, max=32 }
-- plist.generator:Add( pnlBorderThickness )
plist.generator:Add( xlib.makelabel{ label="Border Color" } )
local pnlBorderColor = xlib.makecolorpicker{ noalphamodetwo=true }
plist.generator:Add( pnlBorderColor )

-- registerMOTDChangeEventsTextbox( txtServerDescription, "info.description" )

registerMOTDChangeEventsCombobox( pnlFontServerName.name, "style.fonts.server_name.family" )
registerMOTDChangeEventsSlider( pnlFontServerName.size, "style.fonts.server_name.size" )
registerMOTDChangeEventsCombobox( pnlFontServerName.weight, "style.fonts.server_name.weight" )
registerMOTDChangeEventsCombobox( pnlFontSubtitle.name, "style.fonts.subtitle.family" )
registerMOTDChangeEventsSlider( pnlFontSubtitle.size, "style.fonts.subtitle.size" )
registerMOTDChangeEventsCombobox( pnlFontSubtitle.weight, "style.fonts.subtitle.weight" )
registerMOTDChangeEventsCombobox( pnlFontSection.name, "style.fonts.section_title.family" )
registerMOTDChangeEventsSlider( pnlFontSection.size, "style.fonts.section_title.size" )
registerMOTDChangeEventsCombobox( pnlFontSection.weight, "style.fonts.section_title.weight" )
registerMOTDChangeEventsCombobox( pnlFontRegular.name, "style.fonts.regular.family" )
registerMOTDChangeEventsSlider( pnlFontRegular.size, "style.fonts.regular.size" )
registerMOTDChangeEventsCombobox( pnlFontRegular.weight, "style.fonts.regular.weight" )

registerMOTDChangeEventsColor( pnlColorBackground, "style.colors.background_color" )
registerMOTDChangeEventsColor( pnlColorHeaderBackground, "style.colors.header_color" )
registerMOTDChangeEventsColor( pnlColorHeader, "style.colors.header_text_color" )
registerMOTDChangeEventsColor( pnlColorSection, "style.colors.section_text_color" )
registerMOTDChangeEventsColor( pnlColorText, "style.colors.text_color" )

registerMOTDChangeEventsColor( pnlBorderColor, "style.borders.border_color" )
registerMOTDChangeEventsSlider( pnlBorderThickness, "style.borders.border_thickness" )



-- MOTD Cvar and data handling
plist.updateGeneratorSettings = function( data )
	if not data then data = xgui.data.motdsettings end
	if not data or not data.style or not data.info then return end
	if not plist.generator:IsVisible() then return end

	local borders = data.style.borders
	local colors = data.style.colors
	local fonts = data.style.fonts

	-- Description
	txtServerDescription:SetText( data.info.description )

	-- Section panels
	pnlInfo:Clear()
	for i=1, #data.info do
		local section = data.info[i]
		local sectionPanel = xlib.makelistlayout{ w=270 }

		if section.type == "text" then
			sectionPanel:Add( xlib.makelabel{ label="\n"..i..": Text Content", zpos=0 } )

			local sectionTitle = xlib.maketextbox{ zpos=1 }
			registerMOTDChangeEventsTextbox( sectionTitle, "info["..i.."].title" )
			sectionTitle:SetText( section.title )
			sectionPanel:Add( sectionTitle )

			local sectionText = xlib.maketextbox{ h=100, multiline=true, zpos=2 }
			registerMOTDChangeEventsTextbox( sectionText, "info["..i.."].contents", true )
			sectionText:SetText( table.concat( section.contents, "\n" ) )
			sectionPanel:Add( sectionText )

		elseif section.type == "ordered_list" then
			sectionPanel:Add( xlib.makelabel{ label="\n"..i..": Numbered List" } )

			local sectionTitle = xlib.maketextbox{ zpos=1 }
			registerMOTDChangeEventsTextbox( sectionTitle, "info["..i.."].title" )
			sectionTitle:SetText( section.title )
			sectionPanel:Add( sectionTitle )

			local sectionOrderedList = xlib.maketextbox{ h=110, multiline=true, zpos=2 }
			registerMOTDChangeEventsTextbox( sectionOrderedList, "info["..i.."].contents", true )
			sectionOrderedList:SetText( table.concat( section.contents, "\n" ) )
			sectionPanel:Add( sectionOrderedList )

		elseif section.type == "list" then
			sectionPanel:Add( xlib.makelabel{ label="\n"..i..": Bulleted List" } )

			local sectionTitle = xlib.maketextbox{ zpos=1 }
			registerMOTDChangeEventsTextbox( sectionTitle, "info["..i.."].title" )
			sectionTitle:SetText( section.title )
			sectionPanel:Add( sectionTitle )

			local sectionList = xlib.maketextbox{ h=100, multiline=true, zpos=2 }
			registerMOTDChangeEventsTextbox( sectionList, "info["..i.."].contents", true )
			sectionList:SetText( table.concat( section.contents, "\n" ) )
			sectionPanel:Add( sectionList )

		elseif section.type == "mods" then
			sectionPanel:Add( xlib.makelabel{ label="\n"..i..": Installed Addons" } )

			local modsTitle = xlib.maketextbox{ zpos=1 }
			registerMOTDChangeEventsTextbox( modsTitle, "info["..i.."].title" )
			modsTitle:SetText( section.title )
			sectionPanel:Add( modsTitle )

		elseif section.type == "admins" then
			sectionPanel:Add( xlib.makelabel{ label="\n"..i..": List Users in Group" } )

			local adminsTitle = xlib.maketextbox{ zpos=1 }
			registerMOTDChangeEventsTextbox( adminsTitle, "info["..i.."].title" )
			adminsTitle:SetText( section.title )
			sectionPanel:Add( adminsTitle )

			for j=1, #section.contents do
				local group = section.contents[j]
				local adminPnl = xlib.makepanel{ h=20, w=270, zpos=i+j }
				xlib.makelabel{ h=20, w=200, label=group, parent=adminPnl }
				local adminBtn = xlib.makebutton{ x=204, w=50, label="Remove", parent=adminPnl }
				adminBtn.DoClick = function()
					table.remove( section.contents, j )
					performMOTDInfoUpdate( section.contents, "info["..i.."].contents" )
				end
				sectionPanel:Add( adminPnl )
			end

			local adminAddPnl = xlib.makepanel{ h=20, w=270, zpos=99 }
			local adminBtn = xlib.makebutton{ w=100, label="Add Group...", parent=adminAddPnl }
			adminBtn.DoClick = function()
				local menu = DermaMenu()
				menu:SetSkin(xgui.settings.skin)
				for j=1, #xgui.data.groups do
					local group = xgui.data.groups[j]
					if not table.HasValue( section.contents, group ) then
						menu:AddOption( group, function()
							table.insert( section.contents, group )
							performMOTDInfoUpdate( section.contents, "info["..i.."].contents" )
						end )
					end
				end
				menu:Open()
			end
			sectionPanel:Add( adminAddPnl )

		end

		local actionPnl = xlib.makepanel{ w=270, h=20, zpos=100 }
		local btnRemove = xlib.makebutton{ w=100, label="Remove Section", parent=actionPnl }
		btnRemove.DoClick = function()
			Derma_Query( "Are you sure you want to remove the section \"" .. section.title .. "\"?", "XGUI WARNING",
				"Remove",	function()
								table.remove( data.info, i )
								performMOTDInfoUpdate( data.info, "info" )
							end,
				"Cancel", 	function() end )
		end
		local btnUp = xlib.makebutton{ x=214, w=20, icon="icon16/bullet_arrow_up.png", centericon=true, disabled=(i==1), parent=actionPnl }
		btnUp.DoClick = function()
			local tmp = data.info[i-1]
			data.info[i-1] = data.info[i]
			data.info[i] = tmp
			performMOTDInfoUpdate( data.info, "info" )
		end
		local btnDown = xlib.makebutton{ x=234, w=20, icon="icon16/bullet_arrow_down.png", centericon=true, disabled=(i==#data.info), parent=actionPnl }
		btnDown.DoClick = function()
			local tmp = data.info[i+1]
			data.info[i+1] = data.info[i]
			data.info[i] = tmp
			performMOTDInfoUpdate( data.info, "info" )
		end
		sectionPanel:Add( actionPnl )

		pnlInfo:Add( sectionPanel )
	end

	-- Fonts
	pnlFontServerName.name:SetText( fonts.server_name.family )
	pnlFontServerName.size:SetValue( unitToNumber( fonts.server_name.size ) )
	pnlFontServerName.weight:SetText( fonts.server_name.weight )
	pnlFontSubtitle.name:SetText( fonts.subtitle.family )
	pnlFontSubtitle.size:SetValue( unitToNumber( fonts.subtitle.size ) )
	pnlFontSubtitle.weight:SetText( fonts.subtitle.weight )
	pnlFontSection.name:SetText( fonts.section_title.family )
	pnlFontSection.size:SetValue( unitToNumber( fonts.section_title.size ) )
	pnlFontSection.weight:SetText( fonts.section_title.weight )
	pnlFontRegular.name:SetText( fonts.regular.family )
	pnlFontRegular.size:SetValue( unitToNumber( fonts.regular.size ) )
	pnlFontRegular.weight:SetText( fonts.regular.weight )

	-- Colors
	pnlColorBackground:SetColor( hexToColor( colors.background_color ) )
	pnlColorHeaderBackground:SetColor( hexToColor( colors.header_color ) )
	pnlColorHeader:SetColor( hexToColor( colors.header_text_color ) )
	pnlColorSection:SetColor( hexToColor( colors.section_text_color ) )
	pnlColorText:SetColor( hexToColor( colors.text_color ) )

	-- Borders
	pnlBorderThickness:SetValue( unitToNumber( borders.border_thickness ) )
	pnlBorderColor:SetColor( hexToColor( borders.border_color ) )
end
xgui.hookEvent( "motdsettings", "process", plist.updateGeneratorSettings, "serverUpdateGeneratorSettings" )
plist.updateGeneratorSettings()

plist.btnPreview = xlib.makebutton{ label="Preview MOTD", w=275, y=302, parent=motdpnl }
plist.btnPreview.DoClick = function()
	RunConsoleCommand( "ulx", "motd" )
end

function plist.ConVarUpdated( sv_cvar, cl_cvar, ply, old_val, new_val )
	if string.lower( cl_cvar ) == "ulx_showmotd" then
		local previewDisabled = false
		local showMotdFile = false
		local showGenerator = false
		local showURL = false

		if new_val == "0" then
			previewDisabled = true
			plist.lblDescription:SetText( "MOTD is completely disabled.\n" )
		elseif new_val == "1" then
			showMotdFile = true
			plist.lblDescription:SetText( "MOTD is the contents of the given file.\nFile is located in the server's garrysmod root.\n" )
		elseif new_val == "2" then
			showGenerator = true
			plist.lblDescription:SetText( "MOTD is generated using a basic template and the\nsettings below.\n" )
		elseif new_val == "3" then
			showURL = true
			plist.lblDescription:SetText( "MOTD is the given URL.\nYou can use %curmap% nand %steamid%\n(eg, server.com/?map=%curmap%&id=%steamid%)\n" )
		end

		plist.btnPreview:SetDisabled( previewDisabled )
		plist.txtMotdFile:SetVisible( showMotdFile )
		plist.generator:SetVisible( showGenerator )
		plist.txtMotdURL:SetVisible( showURL )
		plist.lblDescription:SizeToContents()
		plist.updateGeneratorSettings()

		plist.scroll:InvalidateChildren()
	end
end
hook.Add( "ULibReplicatedCvarChanged", "XGUI_ulx_showMotd", plist.ConVarUpdated )

xlib.checkRepCvarCreated( "ulx_showMotd" )
plist.ConVarUpdated( nil, "ulx_showMotd", nil, nil, GetConVar( "ulx_showMotd" ):GetString() )

xgui.addSubModule( "ULX MOTD", motdpnl, "ulx showmotd", "server" )

-----------------------Player Votemap List-----------------------
xgui.prepareDataType( "votemaps", ulx.votemaps )
local panel = xlib.makepanel{ w=285, h=322, parent=xgui.null }
xlib.makelabel{ label="Allowed Votemaps", x=5, y=3, parent=panel }
xlib.makelabel{ label="Excluded Votemaps", x=150, y=3, parent=panel }
panel.votemaps = xlib.makelistview{ y=20, w=135, h=262, multiselect=true, headerheight=0, parent=panel }
panel.votemaps:AddColumn( "" )
panel.votemaps.OnRowSelected = function( self, LineID, Line )
	panel.add:SetDisabled( true )
	panel.remove:SetDisabled( false )
	panel.remainingmaps:ClearSelection()
end
panel.remainingmaps = xlib.makelistview{ x=140, y=20, w=135, h=262, multiselect=true, headerheight=0, parent=panel }
panel.remainingmaps:AddColumn( "" )
panel.remainingmaps.OnRowSelected = function( self, LineID, Line )
	panel.add:SetDisabled( false )
	panel.remove:SetDisabled( true )
	panel.votemaps:ClearSelection()
end
panel.remove = xlib.makebutton{ y=282, w=135, label="Remove -->", disabled=true, parent=panel }
panel.remove.DoClick = function()
	panel.remove:SetDisabled( true )
	local temp = {}
	for _, v in ipairs( panel.votemaps:GetSelected() ) do
		table.insert( temp, v:GetColumnText(1) )
	end
	net.Start( "XGUI.RemoveVotemaps" )
		net.WriteTable( temp )
	net.SendToServer()
end
panel.add = xlib.makebutton{ x=140, y=282, w=135, label="<-- Add", disabled=true, parent=panel }
panel.add.DoClick = function()
	panel.add:SetDisabled( true )
	local temp = {}
	for _, v in ipairs( panel.remainingmaps:GetSelected() ) do
		table.insert( temp, v:GetColumnText(1) )
	end
	net.Start( "XGUI.AddVotemaps" )
		net.WriteTable( temp )
	net.SendToServer()
end
panel.votemapmode = xlib.makecombobox{ y=302, w=275, repconvar="ulx_votemapMapmode", isNumberConvar=true, numOffset=0, choices={ "Include new maps by default", "Exclude new maps by default" }, parent=panel }
panel.updateList = function()
	if #ulx.maps ~= 0 then
		panel.votemaps:Clear()
		panel.remainingmaps:Clear()
		panel.add:SetDisabled( true )
		panel.remove:SetDisabled( true )
		for _, v in ipairs( ulx.maps ) do
			if table.HasValue( ulx.votemaps, v ) then
				panel.votemaps:AddLine( v )
			else
				panel.remainingmaps:AddLine( v )
			end
		end
	end
end
panel.updateList()
xgui.hookEvent( "votemaps", "process", panel.updateList, "serverUpdateVotemapList" )
xgui.addSubModule( "ULX Player Votemap List", panel, nil, "server" )

---------------------Player Votemap Settings---------------------
local plist = xlib.makelistlayout{ w=275, h=322, parent=xgui.null }
plist:Add( xlib.makelabel{ label="Player Votemap Settings" } )
plist:Add( xlib.makecheckbox{ label="Enable Player Votemaps", repconvar="ulx_votemapEnabled" } )
plist:Add( xlib.makelabel{ label="Time (min) before a user can vote for a map" } )
-- plist:Add( xlib.makeslider{ label="<--->", min=0, max=300, repconvar="ulx_votemapMintime" } )
plist:Add( xlib.makelabel{ label="Time (min) until a user can change their vote" } )
-- plist:Add( xlib.makeslider{ label="<--->", min=0, max=60, decimal=1, repconvar="ulx_votemapWaittime" } )
plist:Add( xlib.makelabel{ label="Ratio of votes needed to accept mapchange" } )
-- plist:Add( xlib.makeslider{ label="<--->", min=0, max=1, decimal=2, repconvar="ulx_votemapSuccessratio" } )
plist:Add( xlib.makelabel{ label="Minimum votes for a successful mapchange" } )
-- plist:Add( xlib.makeslider{ label="<--->", min=0, max=10, repconvar="ulx_votemapMinvotes" } )
plist:Add( xlib.makelabel{ label="Time (sec) for an admin to veto a mapchange" } )
-- plist:Add( xlib.makeslider{ label="<--->", min=0, max=300, repconvar="ulx_votemapVetotime" } )
xgui.addSubModule( "ULX Player Votemap Settings", plist, nil, "server" )

-------------------------Reserved Slots--------------------------
local plist = xlib.makelistlayout{ w=275, h=322, parent=xgui.null }
plist:Add( xlib.makelabel{ label="Reserved Slots Settings" } )
plist:Add( xlib.makecombobox{ repconvar="ulx_rslotsMode", isNumberConvar=true, choices={ "0 - Reserved slots disabled", "1 - Admins fill slots", "2 - Admins don't fill slots", "3 - Admins kick newest player" } } )
-- plist:Add( xlib.makeslider{ label="Number of Reserved Slots", min=0, max=game.MaxPlayers(), repconvar="ulx_rslots" } )
plist:Add( xlib.makecheckbox{ label="Reserved Slots Visible", repconvar="ulx_rslotsVisible" } )
plist:Add( xlib.makelabel{ w=265, wordwrap=true, label="Reserved slots mode info:\n1 - Set a certain number of slots reserved for admins-- As admins join, they will fill up these slots.\n2 - Same as #1, but admins will not fill the slots-- they'll be freed when players leave.\n3 - Always keep 1 slot open for admins, and, if full, kick the user with the shortest connection time when an admin joins, thus keeping 1 slot open.\n\nReserved Slots Visible:\nWhen enabled, if there are no regular player slots available in your server, it will appear that the server is full. The major downside to this is that admins can't connect to the server using the 'find server' dialog. Instead, they have to go to console and use the command 'connect <ip>'" } )
xgui.addSubModule( "ULX Reserved Slots", plist, nil, "server" )

------------------------Votekick/Voteban-------------------------
local plist = xlib.makelistlayout{ w=275, h=322, parent=xgui.null }
plist:Add( xlib.makelabel{ label="Votekick Settings" } )
plist:Add( xlib.makelabel{ label="Ratio of votes needed to accept votekick" } )
-- plist:Add( xlib.makeslider{ label="<--->", min=0, max=1, decimal=2, repconvar="ulx_votekickSuccessratio" } )
plist:Add( xlib.makelabel{ label="Minimum votes required for a successful votekick" } )
-- plist:Add( xlib.makeslider{ label="<--->", min=0, max=10, repconvar="ulx_votekickMinvotes" } )
plist:Add( xlib.makelabel{ label="\nVoteban Settings" } )
plist:Add( xlib.makelabel{ label="Ratio of votes needed to accept voteban" } )
-- plist:Add( xlib.makeslider{ label="<--->", min=0, max=1, decimal=2, repconvar="ulx_votebanSuccessratio" } )
plist:Add( xlib.makelabel{ label="Minimum votes required for a successful voteban" } )
-- plist:Add( xlib.makeslider{ label="<--->", min=0, max=10, repconvar="ulx_votebanMinvotes" } )
xgui.addSubModule( "ULX Votekick/Voteban", plist, nil, "server" )

--PATH addons/zeros_weedfarm/lua/zwf_languages/sh_zwf_language_fr.lua:
zwf = zwf or {}
zwf.language = zwf.language or {}

zwf.language.General = zwf.language.General or {}
zwf.language.Shop = zwf.language.Shop or {}
zwf.language.NPC = zwf.language.NPC or {}
zwf.language.VGUI = zwf.language.VGUI or {}
zwf.language.Settings = zwf.language.Settings or {}

---------------------------------------------
-- French Translation with love by Samgaze --
---------------------------------------------
if (zwf.config.SelectedLanguage == "fr") then

    zwf.language.General["Fuel"] = "Carburant"

    zwf.language.General["THC"] = "THC"
    zwf.language.General["Remove"] = "Retirer"
    zwf.language.General["Splice"] = "Rechercher" // The splice button on the seed lab for creating new seeds

    zwf.language.General["Bad"] = "Mauvais"
    zwf.language.General["Good"] = "Bon"

    zwf.language.General["Collect"] = "Collecter"

    zwf.language.General["Speed"] = "Vitesse"
    zwf.language.General["Productivity"] = "Productivité"
    zwf.language.General["AntiPlague"] = "Anti peste"

    zwf.language.General["Water"] = "Eau"

    zwf.language.General["invalid_character"] = "Le nom a des caractères invalides!"
    zwf.language.General["name_too_short"] = "Nom trop court!"
    zwf.language.General["name_too_long"] = "Nom trop long!"

    zwf.language.General["Cancel"] = "Annuler"
    zwf.language.General["Enter"] = "Entrer"

    zwf.language.General["ItemBought"] = "Vous avez acheté $itemname pour $currency$price!"


    zwf.language.General["seedlab_titlescreen"] = "Laboratoire de semences"
    zwf.language.General["seedlab_help"] = "Entrez le nom de la plante"

    zwf.language.General["watertank_refill"] = "Recharge"
    zwf.language.General["watertank_title"] = "Réservoir d'eau"

    zwf.language.General["bong_pickup_fail"] = "Vous avez déjà ce bong!"
    zwf.language.General["bong_no_weed"] = "Pas de Weed!"

    zwf.language.General["generator_repair"] = "Réparer!"
    zwf.language.General["generator_start"] = "Démarer"
    zwf.language.General["generator_stop"] = "Stopper"
    zwf.language.General["generator_nofuel"] = "Pas de carburant!"

    zwf.language.General["packingstation_info"] = "Ajouter des pots de Weed."
    zwf.language.General["packingstation_weedmix"] = "Mix de Weed" // If the player mixes diffrent sorts of weed together then we change the name of the weed to this

    zwf.language.General["seedbank_full"] = "La banque de semences est pleine!"

    zwf.language.General["plant_heal"] = "Guérir" // The heal button
    zwf.language.General["plant_harvest"] = "Récolte" // The harvest button
    zwf.language.General["plant_infected"] = "Infecté!" // Tells us that the plant is infected
    zwf.language.General["plant_postgrow"] = "Post croissance" // Tells us that the plant is in the post grow phase where it keeps growing till it reaches its max weedamount
    zwf.language.General["plant_empty"] = "Vide" // Tells the player that the flowerpot is empty

    zwf.language.General["not_enough_money"] = "Vous ne pouvez pas vous permettre ceci!"
    zwf.language.General["not_correct_rank"] = "Vous n'avez pas le rang requis pour ceci!"
    zwf.language.General["entity_limit"] = "Vous avez atteint le nombre limite d'entités pour $itemname!"


    zwf.language.General["CableDistanceFail"] = "Les objets sont trop éloignés les uns des autres!"

    zwf.language.General["BongSharingFail"] = "$PlayerName a déjà ce genre de bang!"

    zwf.language.General["WeedBlock"] = "Bloc de herbes"

    zwf.language.General["WrongJob"] = "Mauvais travail!"


    zwf.language.VGUI["Purchase"] = "Acheter"
    zwf.language.VGUI["SellWeed"] = "Vendre Weed"
    zwf.language.VGUI["Drop"] = "Lâcher"
    zwf.language.VGUI["Delete"] = "Supprimer"
    zwf.language.VGUI["weedbuyer_title"] = "Acheteur de weed"
    zwf.language.VGUI["seedbank_title"] = "Banque de semences"
    zwf.language.VGUI["Strain"] = "Souche"
    zwf.language.VGUI["Duration"] = "Durée"
    zwf.language.VGUI["Difficulty"] = "Difficulté"
    zwf.language.VGUI["HarvestAmount"] = "Quantité récolté"
    zwf.language.VGUI["THCBoost"] = "THC Boost"
    zwf.language.VGUI["GrowTimeBoost"] = "Boost de temps de croissance"
    zwf.language.VGUI["GrowAmountBoost"] = "Boost de récolte"
    zwf.language.VGUI["THCBoost"] = "THC Boost"
    zwf.language.VGUI["SeedCount"] = "Nombre de semences"
    zwf.language.VGUI["PowerUsage"] = "Puissance utilisée"
    zwf.language.VGUI["HeatProduction"] = "Production de chaleur"
    zwf.language.VGUI["Ranks"] = "Rangs"
    zwf.language.VGUI["SeedName"] = "Nom de semence"




    zwf.language.NPC["title"] = "Acheteur de Weed"
    zwf.language.NPC["profit"] = "Profit"
    zwf.language.NPC["interact_fail"] = "Dégage de là!"
    zwf.language.NPC["interact_noweed"] = "Reviens quand tu as quelque chose pour moi!"


    zwf.language.Shop["title"] = "Magasin de semences"

    zwf.language.Shop["category_Equipment"] = "Equipement"

    zwf.language.Shop["item_generator_title"] = "Générateur"
    zwf.language.Shop["item_generator_desc"] = "Génère de l'énergie en utilisant du carburant."

    zwf.language.Shop["item_fuel_title"] = "Carburant"
    zwf.language.Shop["item_fuel_desc"] = "Carburant pour le générateur."

    zwf.language.Shop["item_lamp01_desc"] = "Fournit de la lumière aux plantes mais augmente leur température."
    zwf.language.Shop["item_lamp02_desc"] = "Fournit de la lumière aux plantes sans augmenter leur température."

    zwf.language.Shop["item_ventilator_title"] = "Ventilateur"
    zwf.language.Shop["item_ventilator_desc"] = "Diminue la température des plantes."

    zwf.language.Shop["item_outlet_title"] = "Bande de puissance"
    zwf.language.Shop["item_outlet_desc"] = "Vous permet d'alimenter plusieurs machines en énergie."

    zwf.language.Shop["item_flowerpot01_title"] = "Pôt de fleur"
    zwf.language.Shop["item_flowerpot01_desc"] = "Pôt de fleurs normal pour la culture de plantes."

    zwf.language.Shop["item_flowerpot02_title"] = "Pôt de fleur à eau"
    zwf.language.Shop["item_flowerpot02_desc"] = "Utilisé pour faire pousser des plantes. Peut être connecté à un réservoir d'eau pour l'alimentation automatique en eau."

    zwf.language.Shop["item_soil_title"] = "Terre"
    zwf.language.Shop["item_soil_desc"] = "Matière de base pour la culture de plantes."

    zwf.language.Shop["item_watertank_title"] = "Réservoir d'eau"
    zwf.language.Shop["item_watertank_desc"] = "Produit de l'eau pour les plantes."

    zwf.language.Shop["item_drystation_title"] = "Station sèche"
    zwf.language.Shop["item_drystation_desc"] = "Utilisé pour sécher les mauvaises herbes."

    zwf.language.Shop["item_packingtable_title"] = "Table d'emballage"
    zwf.language.Shop["item_packingtable_desc"] = "Utilisé pour emballer les pots de weed dans un bloc pour le transport."

    zwf.language.Shop["item_autopacker_title"] = "Emballeur automatique"
    zwf.language.Shop["item_autopacker_desc"] = "Peut être installé dans la table d'emballage pour automatiser le processus."

    zwf.language.Shop["item_seedlab_title"] = "Laboratoire de semences"
    zwf.language.Shop["item_seedlab_desc"] = "Vous permet de créer de nouvelles graines à partir de weed."

    zwf.language.Shop["item_seedbank_title"] = "Banque de semences"
    zwf.language.Shop["item_seedbank_desc"] = "Vous permet de stocker des graines."

    zwf.language.Shop["item_palette_title"] = "Palette"
    zwf.language.Shop["item_palette_desc"] = "Utilisé pour vendre des blocs de weed à l'acheteur de mauvaises herbes."


    zwf.language.Shop["item_seed01_desc"] = "OG Kush est une variété légendaire dont le nom est reconnu même en dehors du monde du cannabis."
    zwf.language.Shop["item_seed02_desc"] = "Bubba Kush est un hybride Indica lourd qui à une très grande popularité."
    zwf.language.Shop["item_seed03_desc"] = "Sour Diesel’s plein d'énergie et positif, il est facile de voir pourquoi elle est populaire à travers les États-Unis."
    zwf.language.Shop["item_seed04_desc"] = "AK-47 est un hybride à dominante Sativa à la couleur blanche éclatante."
    zwf.language.Shop["item_seed05_desc"] = "La génétique du Super Lemon Haze combine douceur et acidité."
    zwf.language.Shop["item_seed06_desc"] = "Strawberry Cough est un hybride sativa stimulant et axé sur le goût."
    zwf.language.Shop["item_seed07_desc"] = "La caractéristique pourpre de cette souche est héritée de ses ancêtres de la région de Chitral dans le Pakistanais Hindu Kush."

    zwf.language.Shop["category_Nutritions"] = "Engrais"

    zwf.language.Shop["item_nutrition01_desc"] = "Un petit coup de pouce pour votre plante."
    zwf.language.Shop["item_nutrition02_desc"] = "Augmente beaucoup la vitesse de croissance de la plante."
    zwf.language.Shop["item_nutrition03_desc"] = "Un petit coup de pouce de récolte pour votre plante."
    zwf.language.Shop["item_nutrition04_desc"] = "Augmente beaucoup la quantité de récolte de la plante."
    zwf.language.Shop["item_nutrition05_desc"] = "Augmente à la fois la quantité récoltée et la vitesse de croissance."
    zwf.language.Shop["item_nutrition06_desc"] = "Augmente beaucoup la quantité récoltée et la vitesse de croissance."

    zwf.language.Shop["category_Seeds"] = "Graines"


    // Joint UPDATE
    zwf.language.General["joint_pickup_fail"] = "Vous avez déjà un joint!"
    zwf.language.General["JointSharingFail"] = "$PlayerName a déjà un joint!"

    zwf.language.NPC["question_01"] = "Qu'est ce que tu veux?"
    zwf.language.NPC["question_01_answer01"] = "Je veux acheter un Bong"
    zwf.language.NPC["question_01_answer02"] = "J'ai de la weed pour toi"
    zwf.language.NPC["question_01_answer03"] = "Rien"

    zwf.language.NPC["question_02"] = "Lequel veux-tu?"
    zwf.language.NPC["question_02_answer01"] = "Retour" // This is the Back button on the NPC BongShop interface

end

--PATH addons/zeros_weedfarm/lua/zwf_languages/sh_zwf_language_ru.lua:
zwf = zwf or {}
zwf.language = zwf.language or {}

zwf.language.General = zwf.language.General or {}
zwf.language.Shop = zwf.language.Shop or {}
zwf.language.NPC = zwf.language.NPC or {}
zwf.language.VGUI = zwf.language.VGUI or {}
zwf.language.Settings = zwf.language.Settings or {}


if (zwf.config.SelectedLanguage == "ru") then

    zwf.language.General["Fuel"] = "Топливо"

    zwf.language.General["THC"] = "THC"
    zwf.language.General["Remove"] = "Удалить"
    zwf.language.General["Splice"] = "Соединить" // The splice button on the seed lab for creating new seeds

    zwf.language.General["Bad"] = "Плохо"
    zwf.language.General["Good"] = "Хорошо"

    zwf.language.General["Collect"] = "Собрать"

    zwf.language.General["Speed"] = "Скорость"
    zwf.language.General["Productivity"] = "Производительность"
    zwf.language.General["AntiPlague"] = "Анти чума"

    zwf.language.General["Water"] = "Вода"

    zwf.language.General["invalid_character"] = "Имя содержит недопустимые символы!"
    zwf.language.General["name_too_short"] = "Имя слишком короткое!"
    zwf.language.General["name_too_long"] = "Имя слишком длинное!"

    zwf.language.General["Cancel"] = "Отменить"
    zwf.language.General["Enter"] = "Войти"

    zwf.language.General["ItemBought"] = "Вы купили $itemname за $currency$price!"


    zwf.language.General["seedlab_titlescreen"] = "Семенная Лаборатория"
    zwf.language.General["seedlab_help"] = "Введите имя растения"

    zwf.language.General["watertank_refill"] = "Пополнить"
    zwf.language.General["watertank_title"] = "Водный бак"

    zwf.language.General["bong_pickup_fail"] = "У вас уже есть этот бонг!"
    zwf.language.General["bong_no_weed"] = "Нет конопли!"

    zwf.language.General["generator_repair"] = "Починить!"
    zwf.language.General["generator_start"] = "Начать"
    zwf.language.General["generator_stop"] = "Остановить"
    zwf.language.General["generator_nofuel"] = "Нет топлива!"

    zwf.language.General["packingstation_info"] = "Добавить баночки с травкой."
    zwf.language.General["packingstation_weedmix"] = "Микс конопли" // If the player mixes diffrent sorts of weed together then we change the name of the weed to this

    zwf.language.General["seedbank_full"] = "Бак с семенами полон!"

    zwf.language.General["plant_heal"] = "Исцеление" // The heal button
    zwf.language.General["plant_harvest"] = "Урожай" // The harvest button
    zwf.language.General["plant_infected"] = "Заражен!" // Tells us that the plant is infected
    zwf.language.General["plant_postgrow"] = "Пост-выращивание" // Tells us that the plant is in the post grow phase where it keeps growing till it reaches its max weedamount
    zwf.language.General["plant_empty"] = "Пусто" // Tells the player that the flowerpot is empty

    zwf.language.General["not_enough_money"] = "Вы не можете себе это позволить!"
    zwf.language.General["not_correct_rank"] = "У вас нет необходимого звания для этого!"
    zwf.language.General["entity_limit"] = "Вы достигли предела ентити для $itemname!"


    zwf.language.General["CableDistanceFail"] = "Объекты находятся далеко друг от друга!"

    zwf.language.General["BongSharingFail"] = "У $PlayerName уже есть этот вид бонга!"

    zwf.language.General["WeedBlock"] = "Блок трав"

    zwf.language.General["WrongJob"] = "Неверная работа!"



    zwf.language.VGUI["Purchase"] = "Купить"
    zwf.language.VGUI["SellWeed"] = "Продать коноплю"
    zwf.language.VGUI["Drop"] = "Выбросить"
    zwf.language.VGUI["Delete"] = "Удалить"
    zwf.language.VGUI["weedbuyer_title"] = "Скупщик конопли"
    zwf.language.VGUI["seedbank_title"] = "Бак для семян"
    zwf.language.VGUI["Strain"] = "Сорт"
    zwf.language.VGUI["Duration"] = "Продолжительность"
    zwf.language.VGUI["Difficulty"] = "Сложность"
    zwf.language.VGUI["HarvestAmount"] = "Сумма урожая"
    zwf.language.VGUI["THCBoost"] = "Ускорение"
    zwf.language.VGUI["GrowTimeBoost"] = "Ускорение роста"
    zwf.language.VGUI["GrowAmountBoost"] = "Увеличение урожая"
    zwf.language.VGUI["THCBoost"] = "Ускорения"
    zwf.language.VGUI["SeedCount"] = "Кол-во семян"
    zwf.language.VGUI["PowerUsage"] = "Использование энергии"
    zwf.language.VGUI["HeatProduction"] = "Производство тепла"
    zwf.language.VGUI["Ranks"] = "Ранги"
    zwf.language.VGUI["SeedName"] = "Имя семени"




    zwf.language.NPC["title"] = "Скупщик конопли"
    zwf.language.NPC["profit"] = "Выручка"
    zwf.language.NPC["interact_fail"] = "Отбой!"
    zwf.language.NPC["interact_noweed"] = "Вернись, когда у тебя будет что-то для меня!"


    zwf.language.Shop["title"] = "Магазин растений"

    zwf.language.Shop["category_Equipment"] = "Оборудование"

    zwf.language.Shop["item_generator_title"] = "Генератор"
    zwf.language.Shop["item_generator_desc"] = "Вырабатывает энергию, используя топливо."

    zwf.language.Shop["item_fuel_title"] = "Топливо"
    zwf.language.Shop["item_fuel_desc"] = "Топливо для генератора."

    zwf.language.Shop["item_lamp01_desc"] = "Обеспечивает свет для растений, но повышает их температуру."
    zwf.language.Shop["item_lamp02_desc"] = "Обеспечивает свет для растений без повышения их температуры."

    zwf.language.Shop["item_ventilator_title"] = "Вентилятор"
    zwf.language.Shop["item_ventilator_desc"] = "Уменьшает температуру растений."

    zwf.language.Shop["item_outlet_title"] = "Удлинитель"
    zwf.language.Shop["item_outlet_desc"] = "Позволяет вам подавать питание на несколько машин."

    zwf.language.Shop["item_flowerpot01_title"] = "Цветочный горшок"
    zwf.language.Shop["item_flowerpot01_desc"] = "Обычный цветочный горшок для выращивания растений."

    zwf.language.Shop["item_flowerpot02_title"] = "Гидро Цветочный горшок"
    zwf.language.Shop["item_flowerpot02_desc"] = "Используется для выращивания растений. Может быть подключен к резервуару для автоматической подачи воды."

    zwf.language.Shop["item_soil_title"] = "Почва"
    zwf.language.Shop["item_soil_desc"] = "Основное вещество для выращивания растений."

    zwf.language.Shop["item_watertank_title"] = "Бак для воды"
    zwf.language.Shop["item_watertank_desc"] = "Производит воду для растений."

    zwf.language.Shop["item_drystation_title"] = "Сухая станция"
    zwf.language.Shop["item_drystation_desc"] = "Используется для сушки конопли."

    zwf.language.Shop["item_packingtable_title"] = "Упаковочный стол"
    zwf.language.Shop["item_packingtable_desc"] = "Используется для упаковки банок с коноплей в блок для транспорта."

    zwf.language.Shop["item_autopacker_title"] = "Авто упаковщик"
    zwf.language.Shop["item_autopacker_desc"] = "Может быть установлен в упаковочном столе для автоматизации процесса."

    zwf.language.Shop["item_seedlab_title"] = "Семенная лаборатория"
    zwf.language.Shop["item_seedlab_desc"] = "Позволяет создавать новые семена из конопли."

    zwf.language.Shop["item_seedbank_title"] = "Семенной банк"
    zwf.language.Shop["item_seedbank_desc"] = "Позволяет хранить семена."

    zwf.language.Shop["item_palette_title"] = "Палитра"
    zwf.language.Shop["item_palette_desc"] = "Используется для продажи блоков конопли скупщику."


    zwf.language.Shop["item_seed01_desc"] = "OG Kush - легендарный сорт с именем, которое имеет признание даже за пределами мира каннабиса."
    zwf.language.Shop["item_seed02_desc"] = "Bubba Kush - это тяжелый индиковый гибрид, который пользуется очень большой популярностью.."
    zwf.language.Shop["item_seed03_desc"] = "Энергетический и положительный максимум нашего дизеля позволяет легко понять, почему штамм пользуется популярностью в Соединенных Штатах."
    zwf.language.Shop["item_seed04_desc"] = "АК-47 - гибрид сативы с ярко-белой окраской."
    zwf.language.Shop["item_seed05_desc"] = "Генетика Super Lemon Haze сочетает в себе сладкое и терпкое."
    zwf.language.Shop["item_seed06_desc"] = "Клубничный кашель - это бодрящий, сосредоточенный на вкусе гибрид сативы."
    zwf.language.Shop["item_seed07_desc"] = "Фиолетовая характеристика этого штамма унаследована от его предков из области Читрал в пакистанском Гиндукуше."

    zwf.language.Shop["category_Nutritions"] = "Удобрение"

    zwf.language.Shop["item_nutrition01_desc"] = "Небольшой прирост для вашего растения."
    zwf.language.Shop["item_nutrition02_desc"] = "Значительно увеличивает скорость роста растения."
    zwf.language.Shop["item_nutrition03_desc"] = "Небольшое повышение урожая для вашего растения."
    zwf.language.Shop["item_nutrition04_desc"] = "Значительно увеличивает урожайность растения."
    zwf.language.Shop["item_nutrition05_desc"] = "Немного увеличивает количество урожая и скорость роста."
    zwf.language.Shop["item_nutrition06_desc"] = "Значительно увеличивает как урожай, так и скорость роста."

    zwf.language.Shop["category_Seeds"] = "Семена"


    // Joint UPDATE
    zwf.language.General["joint_pickup_fail"] = "У вас уже есть косяк!"
    zwf.language.General["JointSharingFail"] = "$PlayerName уже имеет косяк!"

    zwf.language.NPC["question_01"] = "Что ты хотел??"
    zwf.language.NPC["question_01_answer01"] = "Я хочу купить Бонг"
    zwf.language.NPC["question_01_answer02"] = "У меня есть трава для тебя"
    zwf.language.NPC["question_01_answer03"] = "Ничего"

    zwf.language.NPC["question_02"] = "Какой вы хотите?"
    zwf.language.NPC["question_02_answer01"] = "Назад" // This is the Back button on the NPC BongShop interface

end

--PATH mlogs/logger/loggers/mlogs/__category.lua:
   mLogs.addCategory( 	"mLogs",   	"mlogs",  	Color(230, 126, 34),   	nil, 	true   )  mLogs.addCategoryDefinitions("mlogs", { 	open = function(data) return mLogs.doLogReplace(mLogs.getLogTranslation("mlogs_open"),data) end, }) 
--PATH mlogs/elements/logs/cl_logsposition.lua:
   local PANEL = {} AccessorFunc(PANEL, "m_sFont", "Font") AccessorFunc(PANEL, "m_sPosName", "PositionName")  local mLogsMat = CreateMaterial( "mlogs_viewmat", "UnlitGeneric", { } ) local mMdl, mMdl2 = Model("models/gman_high.mdl")  function PANEL:Init() 	self:SetFont("mLogs_help")     self:SetPositionName("Unknown") 	self:SetMouseInputEnabled(true)  	self.close = self:Add("mLogs_button") 	self.close:SetText("X") 	self.close.DoClick = function() self:Remove() end      self:CreateRT()     self.vw, self.vh = 512,512     self.speed = 5     self.mdls = {} end  function PANEL:CreateRT()     self.rt = GetRenderTarget("mlogs_positionview",512,512) end  function PANEL:RenderRT(rt)     render.PushRenderTarget(rt, 0, 0, self.vw, self.vh)     render.ClearDepth()     render.Clear(0, 0, 0, 0)         cam.Start2D()             render.RenderView( {                 origin = self.origin,                 angles = self.ang,                 x = 0, y = 0,                 w = self.vw, h = self.vh,                 fov = 70,                  dopostprocess = false,                 drawhud = false,                 drawmonitors = false,                 drawviewmodel = false             } )          cam.End2D()     render.PopRenderTarget() end  function PANEL:DrawRT(x,y,rt)     mLogsMat:SetTexture("$basetexture", self.rt)     surface.SetDrawColor( 255, 255, 255, 100 )     surface.SetMaterial( mLogsMat )     surface.DrawTexturedRect(         x, y, self.vw, self.vh     ) end  function PANEL:OnRemove()     for k,v in pairs(self.mdls)do         if(IsValid(v))then             v:Remove()         end     end end  function PANEL:SetPositionData(data)     data = mLogs.decompress(data)     if(not data[1])then return end     local pos = data[1].pos - Vector(100,100,-100)     self.original = pos     self.origin = pos     self.ang = (data[1].pos - self.origin):Angle()     for k,v in pairs(data)do         local ply = ClientsideModel(util.IsValidModel(v.mdl) and v.mdl or mMdl)         if(not IsValid(ply)) then return end         ply:SetPos(v.pos)         ply:SetAngles(v.ang)         ply:SetSequence(v.seq)         ply:SetCycle(v.cyc)         ply.mLogs_3DLabel = v.nme          ply:SetPoseParameter("aim_yaw", v.aim_yaw)         ply:SetPoseParameter("aim_pitch", v.aim_pitch)         ply:SetPoseParameter("move_yaw", v.move_yaw)         table.insert(self.mdls,ply)     end      self.data = data end function PANEL:GetPositionData(data)     return self.data or {} end  function PANEL:Paint(w,h) 	draw.RoundedBox(0,0,0,w,h,mLogs.config.colors.border) 	draw.RoundedBox(0,1,1,w-2,h-2,mLogs.config.colors.bg)  	draw.SimpleText(mLogs.getLang("x_position",self:GetPositionName()), "mLogs_large", 4, h*0.05, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER) 	draw.RoundedBox(0,0,h*0.1,w,1,mLogs.config.colors.border)      self:RenderRT(self.rt)      self:DrawRT(1, h*0.1+1,self.rt)      draw.RoundedBox(0,1,h*0.95,w-2,h*0.05,Color(0,0,0,200))     draw.SimpleText(mLogs.getLang("position_instructions"), "mLogs_clearText", 4, h*0.975, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER) end  function PANEL:PerformLayout(w,h) 	self.close:SetSize(h*0.1,h*0.1) 	self.close:SetPos(w-self.close:GetWide(),0) end  function PANEL:Think()     if(input.IsKeyDown(KEY_LSHIFT))then         self.speed = 10     else         self.speed = 5     end      local originDiff = Vector(0,0,0)      if(input.IsKeyDown(KEY_W))then         originDiff = originDiff + self.ang:Forward()*self.speed     end     if(input.IsKeyDown(KEY_D))then         originDiff = originDiff + self.ang:Right()*self.speed     end     if(input.IsKeyDown(KEY_S))then         originDiff = originDiff - self.ang:Forward()*self.speed     end     if(input.IsKeyDown(KEY_A))then         originDiff = originDiff - self.ang:Right()*self.speed     end     if(input.IsKeyDown(KEY_SPACE))then         originDiff = originDiff + self.ang:Up()*self.speed     end     if(input.IsKeyDown(KEY_LCONTROL))then         originDiff = originDiff - self.ang:Up()*self.speed     end      local newOrigin = self.origin + originDiff     if(self.original:DistToSqr(newOrigin) > 500000)then return end     self.origin = newOrigin      if(input.IsKeyDown(KEY_UP))then         self.ang.pitch = self.ang.pitch - 100*FrameTime()         if(self.ang.pitch >= 90 or self.ang.pitch <=-90)then self.ang.pitch = self.ang.pitch > 0 and 90 or -90 end     end     if(input.IsKeyDown(KEY_DOWN))then         self.ang.pitch = self.ang.pitch + 100*FrameTime()         if(self.ang.pitch >= 90 or self.ang.pitch <=-90)then self.ang.pitch = self.ang.pitch > 0 and 90 or -90 end     end     if(input.IsKeyDown(KEY_LEFT))then         self.ang.yaw = self.ang.yaw + 100*FrameTime()         if(self.ang.yaw >= 360 or self.ang.yaw <= -360)then self.ang.yaw = 0 end     end     if(input.IsKeyDown(KEY_RIGHT))then         self.ang.yaw = self.ang.yaw - 100*FrameTime()         if(self.ang.yaw >= 360 or self.ang.yaw <= -360) then self.ang.yaw = 0 end     end  	local mousex = math.Clamp( gui.MouseX(), 1, ScrW() - 1 ) 	local mousey = math.Clamp( gui.MouseY(), 1, ScrH() - 1 )      local x,y = self:GetPos()     local w,h = self:GetSize()     local localx = mousex - x     local localy = mousey - y          if((localx >= 0 and localx <= w) and (localy >= h*0.1 and localy <= h))then 		self:SetCursor( "hand" )                  if(input.IsMouseDown(MOUSE_LEFT))then             local fracX, fracY = (localx/(w*0.5)) -1, (localy/(h*0.5)) -1              local newPitch = self.ang.pitch + (math.Clamp(fracY,-0.1,0.1)*5)             if(newPitch > 90)then newPitch = 90 end             if(newPitch < -90)then newPitch = -90 end              local newYaw = self.ang.yaw - (math.Clamp(fracX,-0.1,0.1)*5)             if(newYaw > 360)then newYaw = 0 end             if(newYaw < -360)then newYaw = 0 end              if(fracX > 0.3)then input.SetCursorPos(ScrW()*0.5+(0.1*w), mousey)              elseif(fracX < -0.3)then input.SetCursorPos(ScrW()*0.5-(0.1*w), mousey) end              if(fracY > 0.3)then input.SetCursorPos(mousex, ScrH()*0.5+(0.1*h))             elseif(fracY < -0.3)then input.SetCursorPos(mousex, ScrH()*0.5-(0.1*h)) end              self.ang = Angle(newPitch,newYaw,self.ang.roll)             self:SetCursor("blank")         end          return     end  	if ( self.Dragging ) then  		local x = mousex - self.Dragging[1] 		local y = mousey - self.Dragging[2]   		x = math.Clamp( x, 0, ScrW() - self:GetWide() ) 		y = math.Clamp( y, 0, ScrH() - self:GetTall() )  		self:SetPos( x, y ) 	end 	 	if ( self.Hovered && mousey < ( self.y + 24 ) ) then 		self:SetCursor( "sizeall" ) 		return 	end  	self:SetCursor( "arrow" ) end  function PANEL:OnMousePressed() 	if ( gui.MouseY() < (self.y + 24) ) then 		self.Dragging = { gui.MouseX() - self.x, gui.MouseY() - self.y } 		self:MouseCapture( true ) 		return 	end end function PANEL:OnMouseReleased()  	self.Dragging = nil 	self:MouseCapture( false )  end vgui.Register( "mLogs_positionView", PANEL, "EditablePanel" )  hook.Add("PostDrawTranslucentRenderables", "mLogs_LogsPosition",function()     if(not ValidPanel(mLogs.positionView) or not mLogs.positionView.mdls)then return end     for k,v in pairs(mLogs.positionView.mdls or {})do         if(IsValid(v) and v.mLogs_3DLabel)then             surface.SetFont("mLogs_positionView")             local sizeW = select(1,surface.GetTextSize(v.mLogs_3DLabel))             local pos = (v:GetPos() + Vector(sizeW*0.06,0,85 ))             for _,yaw in pairs({0, 180}) do 				local a = Angle(0, 0, 0)                 a = (pos - mLogs.positionView.origin):GetNormal():Angle() 				a:RotateAroundAxis(a:Forward(), 90) 				  				a:RotateAroundAxis(a:Right(), 90) 			 				cam.Start3D2D(pos, a, 0.1) 					draw.DrawText(v.mLogs_3DLabel or "", "mLogs_positionView", 0, 0, Color(200,50,50)) 				cam.End3D2D()             end         end     end end) 
--PATH mlogs/elements/settings/types/cl_permissions.lua:
   local PANEL = {}   function PANEL:Init()     self.selection = self:Add("DComboBox")     self.cs = {"a","b"}      self.selection.OnSelect = function( s, _i, _v, data )         if(not data) then return end         if(self.currentChoice == _i)then return end         if(data[1] and data[1] == "action")then             self:DoAction(data[2].tag)             self.selection:ChooseOptionID(self.currentChoice)             return         end         self.currentChoice = _i         self:SelectOption(data)     end      self.removeEntry = self:Add("mLogs_button")     self.removeEntry:SetText("Remove Entry")     self.removeEntry:SetFont("mLogs_smaller")     self.removeEntry:SetBGColor(Color(240,52,52))     self.removeEntry:SetHoverColor(Color(220,32,32))     self.removeEntry:SetDisabled(true)     self.removeEntry.DoClick = function()         self:RemoveEntry(self.cs[1],self.cs[2])     end      self.saveButton = self:Add("mLogs_button")     self.saveButton:SetText("Save Permissions")     self.saveButton:SetFont("mLogs_smaller")     self.saveButton:SetBGColor(Color(46,204,113))     self.saveButton:SetHoverColor(Color(26,184,93))     self.saveButton.oVisible = self.saveButton.SetVisible     self.saveButton.SetVisible = function(s,bool)         self.removeEntry:SetVisible(not bool)         s.oVisible(s,bool)     end     self.saveButton:SetVisible(false)     self.saveButton.DoClick = function()         mLogs.InteractInterface("permissions_save",function()             net.WriteString(self.cs[1])             net.WriteString(self.cs[2])             net.WriteTable(self.aPermissions:GetPermissions())         end)         self.saveButton:SetDisabled(true)         timer.Simple(2, function()             if not ValidPanel(self.saveButton) then return end             self.saveButton:SetDisabled(false)         end)     end      self.direction = ">"      self.aPermissions = self:Add("mLogs_settingsOption_permissions_list")     self.aPermissions:SetTitle("Disabled Permissions")     self.aPermissions.OnPermissionSelect = function(s,key)         self.sPermissions:AddPermission(key)         self.saveButton:SetVisible(true)     end      self.sPermissions = self:Add("mLogs_settingsOption_permissions_list")     self.sPermissions:SetTitle("Enabled Permissions")     self.sPermissions.OnPermissionSelect = function(s,key)         self.aPermissions:AddPermission(key)         self.saveButton:SetVisible(true)     end      	self.loading = self:Add("DPanel") 	self.loading.Paint = function(s,w,h) 		  		if((CurTime() - s.ShowTime) > 0.2)then 			draw.RoundedBox(0,0,0,w,h,Color(0,0,0,100)) 			draw.SimpleText(mLogs.getLang("loading"), "mLogs_large", w*0.5, h*0.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER) 		end 	end 	self.loading.OldVisible = self.loading.SetVisible 	self.loading.SetVisible = function(s,bool) 		if(bool)then s.ShowTime = CurTime() end 		s.OldVisible(s,bool) 	end 	self.loading:SetVisible(false)      mLogs.permissions.generateConversions()      mLogs.addPermissionsRequestListener(self)      self:GetTargets() end  function PANEL:GetTargets()     self:Clear()     self.selection:Clear()     self.loading:SetVisible(true)     mLogs.InteractInterface("permissions_targets",function()end) end  function PANEL:OnReceiveTargets(targets)     self:Clear()     self.selection:Clear()     self.loading:SetVisible(false)     self.selection:AddChoice("** Add SteamID **",{"action",{tag="SteamID"}})     self.selection:AddChoice("** Add Group **",{"action",{tag="Group"}})      local target      for type,data in pairs(mLogs.permissions.targets)do         for tag,info in pairs(data.children) do             local idx = self.selection:AddChoice(string.format(data.format,info.name),{type,info})             if(self.selectTarget and self.selectTarget == tag)then                 self.selectTarget = nil                 target = idx             end         end     end      timer.Simple(0.1, function()         if not ValidPanel(self) then return end         self.selection:ChooseOptionID(target or 3)     end) end  function PANEL:OnRemove()     mLogs.removePermissionsRequestListener(self) end  function PANEL:Clear()     self.aPermissions:Clear()     self.sPermissions:Clear()     self.saveButton:SetVisible(false)     self.removeEntry:SetDisabled(true) end  function PANEL:DoAction(action)     mLogs.stringRequest( "Add " .. action, "Enter a " .. action, "", function(txt)         mLogs.InteractInterface("permissions_add",function()             net.WriteString(string.lower(action))             net.WriteString(txt)         end)         self.selectTarget = txt     end, function() end) end  function PANEL:RemoveEntry(_type,target)     mLogs.query( mLogs.getLang("are_you_sure"), "Are you sure you want to remove " .. target .. " from permissions?", "Yes", function()         mLogs.InteractInterface("permissions_remove", function()             net.WriteString(_type)             net.WriteString(target)         end)     end, "No", function() end ) end  function PANEL:SelectOption(data)     local type,extra = unpack(data)      self.cs = {type,extra.tag,extra}     self:Clear()     mLogs.InteractInterface("permissions_get",function()         net.WriteString(type)         net.WriteString(extra.tag)     end) end  function PANEL:OnReceivePerms(_type,tag,perms)     if(self.cs[1] != _type or self.cs[2] != tag) then return end     local disabled = {}     local oPerms = table.GetKeys(perms)     local others = table.GetKeys(mLogs.permissions.conversions)     table.sort(oPerms, function(a,b)         return a>b     end)     table.sort(others, function(a,b)         return a>b     end)     for k,v in pairs(oPerms) do         self.aPermissions:AddPermission(v)         disabled[v] = true     end     for k,v in pairs(others)do         if(disabled[v])then continue end         self.sPermissions:AddPermission(v)      end          if(self.cs[3] and not self.cs[3].perm)then         self.removeEntry:SetDisabled(false)     end end  function PANEL:Paint(w,h) 	      local mF = mLogs.mainFrame     if(not ValidPanel(mF))then return end 	local mouseX = select(1,gui.MousePos()) 	local panelX = select(1,mF:GetPos()) + mF:GetWide()*0.2 	local panelHalfX = w*0.5 	local panelXTotal = panelX+panelHalfX 	if(mouseX >= panelX and mouseX <= panelXTotal)then 		self.direction = ">" 	elseif(mouseX >= panelXTotal and mouseX <= panelX+w)then 		self.direction = "<" 	end  	draw.SimpleText(self.direction, "DermaDefault", w*0.5, h*0.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)  end  function PANEL:SetOption(option,cat) end function PANEL:PerformLayout(w,h)     self.selection:SetSize(w*0.78,h*0.05)      self.removeEntry:SetPos(w*0.78+4,0)     self.removeEntry:SetSize(w*0.22-4,h*0.05)     self.saveButton:SetPos(w*0.78+4,0)     self.saveButton:SetSize(w*0.22-4,h*0.05)  	self.aPermissions:SetPos(0,h*0.07) 	self.aPermissions:SetSize(w*0.45, h*0.93)  	self.aPermissions:SetPos(0,h*0.07) 	self.aPermissions:SetSize(w*0.47, h*0.93)      self.sPermissions:SetPos(w*0.53,h*0.07) 	self.sPermissions:SetSize(w*0.47,h*0.93)      self.loading:SetSize(w,h)      self.sH = 0.85 end  vgui.Register( "mLogs_settingsOption_permissions", PANEL, "DPanel" ) 
--PATH mlogs/elements/ui/cl_sidebar.lua:
   local PANEL = {}  function PANEL:Init() 	self.items = {} 	 	self.scroll = self:Add("mLogs_scrollPanel") 	 	self.layout = self.scroll:Add("DIconLayout") 	self.layout:SetSpaceY(4) end  function PANEL:ResetLayout() 	self.layout:Clear() 	self:InvalidateLayout() end  function PANEL:AddItem(pnl,w,h,wMul,hMul) 	table.insert(self.items, {pnl=self.layout:Add(pnl),wMul=wMul,hMul=hMul,w=w,h=h}) end  function PANEL:GetItems() 	return self.items end  function PANEL:Paint(w,h) 	draw.RoundedBox(0,0,0,w,h,mLogs.config.colors.sidebar) end function PANEL:PerformLayout(w,h) 	self.scroll:SetSize(w,h) 	self.layout:SetSize(w,h) 	 	if(#self.items > 0)then 		for k,v in pairs(self.items) do 			v.pnl:SetSize(v.pnl.prefWidth or v.w or w*v.wMul,v.pnl.prefHeight or v.h or h*v.hMul) 		end 	end 	 	self.layout:SetSize(w,select(2,self.layout:ChildrenSize())) 	self.layout:Layout() end  function PANEL:SetView(pnl) 	self.view = pnl end  vgui.Register( "mLogs_sidebar", PANEL, "DPanel" ) 
--PATH mlogs/elements/ui/cl_navbuttons.lua:
   local PANEL = {}  function PANEL:Init() 	self.back = self:Add("mLogs_button") 	self.back:SetText("<") 	self.back.DoClick = function() 		if(self.OnBack)then self.OnBack() end 	end  	self.forward = self:Add("mLogs_button") 	self.forward:SetText(">") 	self.forward.DoClick = function() 		if(self.OnForward)then self.OnForward() end 	end end  function PANEL:Paint(w,h) end function PANEL:PerformLayout(w,h) 	self.back:SetSize(w*0.5 - 1,h) 	self.forward:SetPos(w*0.5 + 1) 	self.forward:SetSize(w*0.5 - 1,h) end vgui.Register( "mLogs_navButtons", PANEL, "DPanel" )  