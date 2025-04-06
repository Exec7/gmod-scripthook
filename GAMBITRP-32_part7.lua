--Stealed clientside server code by exechack.cc
--Hostname: ⋙ GAMBITRP ╽ ПОДАРКИ ╽ FREE VIP ⋘ - Part 7/10 - 06/04/2025


--PATH addons/plib_v5/lua/plib/extensions/weapon.lua:
-- local WEAPON, ENTITY = FindMetaTable('Weapon'), FindMetaTable('Entity')
-- local GetTable = ENTITY.GetTable
-- local GetOwner = ENTITY.GetOwner

-- local ownerkey = 'Owner'
-- function WEAPON:__index(key)
    -- local value = rawget(WEAPON, key) or rawget(ENTITY, key) or (GetTable(self) and rawget(GetTable(self), key))

    -- if value ~= nil then return value end

    -- if key == ownerkey then return GetOwner(self) end
-- end
local WEAPON, ENTITY = FindMetaTable 'Weapon', FindMetaTable 'Entity'
local GetTable = ENTITY.GetTable
local GetOwner = ENTITY.GetOwner

local ownerkey = 'Owner'
function WEAPON:__index(key)
	local value = WEAPON[key] or ENTITY[key] or GetTable(self)[key]

	if value ~= nil then return value end

	if (key == ownerkey) then return GetOwner(self) end
end
--PATH addons/darkrpadvancedkeys/lua/autorun/advkeys_config.lua:
CH_ADVKeys = {}
CH_ADVKeys.Config = {}

-- Lots of default sounds can be found here https://maurits.tv/data/garrysmod/wiki/wiki.garrysmod.com/index8f77.html

CH_ADVKeys.Config.UsePrimaryAnims = true
-- There are two sets of animations for locking and unlocking doors (not cars). The primary is used by default, but if you change this to "false", it will change the animations.  
-- It's basically just an extra turn with the key, but thought someone might prefer it and added a config for it.

CH_ADVKeys.Config.LockDoorSound = "doors/door_latch1.wav" -- Sound emitted when locking a door.
CH_ADVKeys.Config.UnlockDoorSound = "doors/door_latch3.wav" -- Sound emitted when unlocking a door.
CH_ADVKeys.Config.CarBipSound = "craphead_scripts/adv_keys/carlock.wav" -- Sound emitted when locking/unlocking vehicles.

CH_ADVKeys.Config.LockUnlockDelay = 2.3 -- Delay when using the keys weapon (it's in seconds - DO NOT GO LOWER THAN 2.3 SECONDS). 
CH_ADVKeys.Config.KnockDoorDelay = 0.5 -- Delay when knocking on a door you do not own.

CH_ADVKeys.Config.DistanceToDoor = 4225 -- Distance between player and door before keys work.
CH_ADVKeys.Config.DistanceToVehicle = 125000 -- Distance between player and car before keys work.

CH_ADVKeys.Config.DoorKnockSounds = { -- This is a list of door knocks that will be chosen at random when knocking a door.
	"physics/wood/wood_crate_impact_soft1.wav",
	"physics/wood/wood_crate_impact_hard3.wav", -- This is the default DarkRP normally uses
	"physics/wood/wood_crate_impact_hard2.wav" -- THE LAST LINE SHOULD NOT HAVE A COMMA AT THE END. BE AWARE OF THIS WHEN EDITING THIS!
}

CH_ADVKeys.Config.LockUnlockNotify = true -- Should the owner of the vehicle get a notification when doors/vehicles are locked or unlocked? true/false

-- Configuration for the vehicle alarm that comes with the script
CH_ADVKeys.Config.ALARM_NotifyOwner = true -- Should the owner of the vehicle get a notification when someone is stealing his car? true/false
CH_ADVKeys.Config.ALARM_AlarmSound = "craphead_scripts/adv_keys/car_alarm.mp3" -- Sound of the alarm

CH_ADVKeys.Config.ALARM_AlwaysActive = true -- This disables the alarm entity from F4 menu and automatically equips EVERY vehicle with an alarm. true/false
--PATH addons/111mod/lua/autorun/br_config.lua:
--I moved everything  to one file.
-- Drawing 3D2D things distance.
BR_DrawDistance = 256;

-- Robbers can steal only 16 cases from bank, regardless of money amount in vault.
BR_Bank_MaxCases = 10;
-- Shall cop get awarded?
BR_MoneyCase_RewardCop = true;
-- Reward for cop in % from case price if he returned money back by clicking 'E' on case.
BR_MoneyCase_ReturnReward = 0.1;
-- Bank vault name.
BR_BankName = "Хранилище";
-- Bank vault name color.
BR_BankNameColor = Color(96, 158, 219);
--Money income per citizen.
BR_MoneyIncome = 160;
--Money stored on start.
BR_MoneyStored = 499999;
--Max amount of money which can be stored.
BR_MaxMoneyStored = 500000;
--Money income timer in seconds.
BR_IncomeTime = 80;
--Money expense timer in seconds.
BR_ExpenseTime = 360;
--Payment part from stored money in %.
BR_PaymentAmount = 0.0010;
--Max payment part from stored money in %.
BR_MaxPaymentAmount = 0.0005;
--Can mayor change payment amount?
BR_MayorPayment = false;
--Bank robbery music.
BR_RobberyMusic = "hl2_song20_submix0.mp3"
--Robber who starts robbery says 'Let's Go!'
BR_RobberyInitiator = true;
--Amount of cops required to rob the bank vault.
BR_CopsRequired = 4;
--Make wanted everyone who close to it.
BR_RobberyWanted = true;
--Combine styled report.
BR_RobberyReport = true;
--Choose money color.
BR_MoneyColor = Color(96, 158, 219, 200);
--Set up money name.
BR_MoneyName = "Деньги";
--Set up money name color.
BR_MoneyNameColor = Color(255, 255, 255, 200);
--Choose money case color.
BR_MoneyCaseColor = Color(96, 158, 219, 200);
--Players can't pocket money case. Don't set it to 'false'.
BR_MoneyCaseNoPocket = true;
--If true - money cases can be destroyed with damage
BR_MoneyCaseDamage = false;
--If true - money cases can be returned back to vault.
BR_MoneyCaseReturn = true;
--Set up money case name.
BR_MoneyCaseName = "Кейс с Деньгами";
--Set up money case name color.
BR_MoneyCaseNameColor = Color(96, 158, 219, 200);
--Should it be locked if stays near vault?
BR_MoneyCaseLock = true;
--Lock distance.
BR_MoneyCaseLockDistance = 1024;
--Open time while robbery on.
BR_OpenTime = 160;
--Cooldown time after robbery.
BR_CooldownTime = 1800; -- 1 hour btw
--Minimal money rob amount.
BR_MinMoneyAmount = 500;
--Maximum money rob amount.
BR_MaxMoneyAmount = 1000;
--Minimal money case rob amount.
BR_MinMoneyCaseAmount = 3000;
--Maximum money case rob amount.
BR_MaxMoneyCaseAmount = 5000;
--Set up name for robbery boss.
BR_RobberyBoss = "Ограбление";
--Set up phrases for robbery boss.
BR_RobberyPhrases = {
"Отличная работа!",
"Продолжаем в том же духе!!",
"Почти все ребята!",
"Да мы же теперь богачи!",
"Беги быстрее!",
"Ещё, Ещё, Ещё!",
"Не останавливайся!",
}

-- 'vault_spawn <name>' will spawn bank vault at your target position, vault fron text will be faced to you.
-- 'vault_remove <name>' removes bank vault.
--PATH addons/cp_bricks_enchanced_sweps/lua/bes_config.lua:
BES.CONFIG.Language = "english"

BES.CONFIG.DoorRam = {}
BES.CONFIG.DoorRam.DoorHealth = 100
BES.CONFIG.DoorRam.DamagePerHit = 30
BES.CONFIG.DoorRam.DoorRegenTime = 60
BES.CONFIG.DoorRam.InstantOpen = false
BES.CONFIG.DoorRam.InstantAdmin = false

BES.CONFIG.Keys = {}
BES.CONFIG.Keys.ServerLogo = "https://i.imgur.com/fx49qdF.jpg" -- The logo used on the keys (false to disable), requires an direct image URL e.g. https://i.imgur.com/fx49qdF.jpg

BES.CONFIG.Lockpick = {}
BES.CONFIG.Lockpick.Time = 10
BES.CONFIG.Lockpick.ClickTime = 2.5 -- How long the player has to click when the lock gets stuck
BES.CONFIG.Lockpick.ClicksReq = 1 -- How many clicks are needed per lockpick
BES.CONFIG.Lockpick.ShowHint = false -- Whether a hint should popup when they player needs to click

BES.CONFIG.Medkit = {}
BES.CONFIG.Medkit.PlyHeal = 25
BES.CONFIG.Medkit.SelfHeal = 25
BES.CONFIG.Medkit.HealTime = 4
BES.CONFIG.Medkit.SelfHealTime = 4
BES.CONFIG.Medkit.SlowdownSelfHeal = true

BES.CONFIG.HandCuffs = {}
BES.CONFIG.HandCuffs.CuffTime = 2
BES.CONFIG.HandCuffs.ShowHint = true
BES.CONFIG.HandCuffs.Blacklist = { "dsr_keys" }

BES.CONFIG.Themes = {}
BES.CONFIG.Themes.Primary = Color( 30, 33, 36 )
BES.CONFIG.Themes.Secondary = Color( 46, 49, 54 )
BES.CONFIG.Themes.Tertiary = Color( 54, 57, 62 )
BES.CONFIG.Themes.Red = Color( 240, 71, 71 )
BES.CONFIG.Themes.Hover = Color( 255, 255, 255, 2 )
BES.CONFIG.Themes.Text = Color( 220, 221, 222 )
--PATH addons/epoe/lua/epoe/client_filter.lua:
-- TODO
-- Add error filtering here!

local e=epoe
local Tag=e.Should_TagHuman -- or "EPOE"

---------------
-- Clientside Console UI
---------------
local epoe_filtering=CreateClientConVar("epoe_filtering", "1", true, false)
local epoe_filtering_dbg=CreateClientConVar("epoe_filtering_dbg", "0", true, false)

e.filters=e.filters or {
	hasany=false,
	full={},
	find={},
	regex={}
}

local full=e.filters.full
local find=e.filters.find
local regex=e.filters.regex

local function add(str,k)
	
	local strtype=str:sub(1,1)
	local count=tonumber(str:sub(2,2))
	local data = str:sub(3,-1)
	
	if not count then return false end
	
	if strtype=='!' then -- full
		full[data] = count
	elseif strtype=='"' then -- string
	
		assert(data~="","empty string")
		table.insert(find,{data,count})
		
	elseif strtype=='^' then -- regex
	
		local ok,err=pcall(string.find,"test",str)
		if not ok then
			ErrorNoHalt"EPOE Regex parse failure: " e.internalPrint("Filters: Line "..k..": Error in regex:"..tostring(err))
			return false
		end
		table.insert(regex,{data,count})
		
	elseif strtype=='#' or strtype=='-' or strtype=='/' then -- regex
		-- comment
	else
		e.internalPrint("Filters: Line "..k..": Match type "..strtype.." is unknown!")
		return false
	end
	e.filters.hasany = true
	return true
end
local function ADD(X,Y)
	concommand.Add("epoe_filter_"..X,function(_,cmd,_,filter)
		local x=filter:sub(2,2)
		filter=filter:sub(1,1)..filter:sub(3,-1)
		if x~=" " then
			Msg"[EPOE] "print"Syntax: epoe_filter_* N PARAMSTR (N is skip extra messages count)"
			return
		end
		
		if not add(Y..filter,-1) then
			Msg"[EPOE] "print"Filter add failed"
			return
		end
		e.internalPrint("Added filter with extraskips="..filter:sub(1,1).." and filterstr '"..Y..filter.."'")
		if cmd:find"write" then
			file.Append("epoe_filters.txt",Y..filter..'\n')
		end
	end , nil,"epoe_filter_"..X..' <skip extra messages count, use 0 by default> <match string>')
end
ADD("exact","!")
ADD("partial",'"')
ADD("regex","^")
ADD("write_exact","!")
ADD("write_partial",'"')
ADD("write_regex","^")

local function Reload()

	table.Empty( full )
	table.Empty( find )
	table.Empty( regex )
	e.filters.hasany = false
	
	local data=file.Read("epoe_filters.txt",'DATA')
	if not data then return end
	local i=0
	for k,str in pairs(string.Explode("\n",data)) do
		str=string.TrimLeft(str) -- we may have spaces on right side
		if str:len()>1 then
			if add(str,k) then
				i=i+1
			end
		end
	end
	if epoe_filtering:GetBool() and i>1 then
		timer.Simple(0,function()
			e.AddText(Color(255,255,255),"[EPOE] Filters: ",Color(255,255,255,255),"Loaded "..i.."filters.")
		end)
	end
end
Reload()

concommand.Add("epoe_filters_reload",Reload)
concommand.Add("epoe_filters_panic",function()
	table.Empty( full )
	table.Empty( find )
	table.Empty( regex )
	e.filters.hasany = false
	file.Delete("epoe_filters.txt",'DATA')
end)

local skipnext=0
local sfind=string.find
local function ShouldFilter(txt,flags)
	if skipnext>0 then
		skipnext=skipnext-1
		print("SKIP",txt)
		return true
	end
	
	--exact match
	local count=full[txt]
	if count then
		skipnext=count or 0
		return true
	end

	-- string match
	if #find>0 then
		for _,t in next,find do
			local str=t[1]
			if sfind(txt,str,1,true) then
				skipnext=t[2]
				return true
			end
		end
	end
	
	if #regex>0 then
		for _,t in ipairs(regex) do
			local str=t[1]
			if sfind(txt,str) then
				skipnext=t[2]
				return true
			end
		end
	end
	
end

local skipshit
hook.Add(Tag,Tag,function(txt,flags)
	if not epoe_filtering:GetBool()
	or not e.filters.hasany
	or skipshit
	then
		return
	end

	if ShouldFilter(txt,flags) then
		if epoe_filtering_dbg:GetBool() then
			skipshit=true
			e.MsgC(Color(255,4,3),"~")
			skipshit=false
		end
		return false
	end
end)
--PATH addons/admin_warns/lua/fam/config.lua:
FlameAdminManagement.config = {}
FlameAdminManagement.config.settings = "warns"  -- Command to open menu (include '/', '!' automatic)

--[[-------------------------------------------------------------------------
	DataBase type

After changing this parameter, you need to restart the server!
Allowed: mysqloo, sql
---------------------------------------------------------------------------]]
FlameAdminManagement.config.DataSaveType = "mysqloo"



--[[-------------------------------------------------------------------------
	Language

Supported: RUS, ENG
---------------------------------------------------------------------------]]
FlameAdminManagement.config.Language = "RUS"



--[[-------------------------------------------------------------------------
	Pretty Rank print

If you do not add any rank, it will be displayed as the unique id of that rank.
---------------------------------------------------------------------------]]
FlameAdminManagement.config.PrettyRanks = {
	user = {name = "Игрок", color = Color(117, 255, 51)},
	moder = {name = "Д-Модератор", color = Color(255, 189, 51)},
	padmin = {name = "Д-Админ", color = Color(255, 189, 51)},
	sponsor = {name = "Д-Спонсор", color = Color(255, 189, 51)},
	dsuperadmin = {name = "Д-Владелец", color = Color(255, 189, 51)},
	downer = {name = "Д-Создатель", color = Color(255, 189, 51)},
	["NS-trainee"] = {name = "NS-Стажер", color = Color(255, 87, 51)},
	["NS-mlmoder"] = {name = "NS-Мл.Модератор", color = Color(255, 87, 51)},
	["NS-moder"] = {name = "NS-Модератор", color = Color(255, 87, 51)},
	["NS-mladmin"] = {name = "NS-Мл.Админ", color = Color(255, 87, 51)},
	["NS-admin"] = {name = "NS-Админ", color = Color(255, 87, 51)},
	["NS-helper"] = {name = "NS-Хелпер", color = Color(255, 87, 51)},
	["NS-assistant"] = {name = "NS-Ассистент", color = Color(255, 87, 51)},
	overwatch = {name = "NS-Куратор", color = Color(255, 51, 204)},
	["NS-zammanager"] = {name = "NS-Зам.Рук.Состава", color = Color(51, 255, 204)},
	manager = {name = "NS-Рук.Состав", color = Color(255, 239, 51)},
	uprav = {"name = Управляющий", color = Color(51, 155, 255)},
	superadmin = {name = "Отец", color = Color(199, 0, 57)}
}


--[[-------------------------------------------------------------------------
	Access to in-game settings

Better give this access only to you.
Person who has this access can edit mysql settings(login, password)

Also you can use SteamID or SteamID64
['STEAM_0:0:102105280'] = true,
['76561198164476288'] = true,
---------------------------------------------------------------------------]]
FlameAdminManagement.config.WhoCanUseInGameSettings = {
	['superadmin'] = true
}



--[[-------------------------------------------------------------------------
	Who from the staff can give warns

Also you can use SteamID or SteamID64
['STEAM_0:0:102105280'] = true,
['76561198164476288'] = true,
---------------------------------------------------------------------------]]
FlameAdminManagement.config.WhoCanGiveWarn = {
	["superadmin"]    = true,
    ["overwatch"] = true,
    ["NS-zammanager"] = true,
    ["manager"] = true,
    ["uprav"] = true
}



--[[-------------------------------------------------------------------------
	FAM will be save statistics about this players/admins


Also you can use SteamID or SteamID64
['STEAM_0:0:102105280'] = true,
['76561198164476288'] = true,
---------------------------------------------------------------------------]]
FlameAdminManagement.config.CollectStatistics = {
    ["NS-trainee"] = true,
    ["NS-mlmoder"] = true,
    ["NS-moder"] = true,
    ["NS-mladmin"] = true,
    ["NS-admin"] = true,
    ["NS-assistant"] = true,
    ["NS-helper"] = true,
    ["moder"] = true,
    ["padmin"] = true,
    ["sponsor"] = true,
    ["dsuperadmin"] = true,
    ["downer"] = true,
    ["overwatch"] = true,
    ["NS-zammanager"] = true,
    ["manager"] = true,
    ["uprav"] = true,
    ["helper"] = true
}



--[[-------------------------------------------------------------------------
	Who can recive reports


Also you can use SteamID or SteamID64
['STEAM_0:0:102105280'] = true,
['76561198164476288'] = true,

Also you can use function like
	function FlameAdminManagement.config.ReceiveReports(ply)
		return ply:IsAdmin()
	end

---------------------------------------------------------------------------]]
FlameAdminManagement.config.ReceiveReports = { -- TODO
	['admin'] = true,
	['superadmin'] = true,
}
-- function FlameAdminManagement.config.ReceiveReports(ply)
-- 	return ply:IsAdmin()
-- end


--[[-------------------------------------------------------------------------
	Report command

Example: @ Admin tp, FreeKill!
---------------------------------------------------------------------------]]
FlameAdminManagement.config.ReportCommand = { -- TODO
	['@'] = true,
	['#'] = true,
	['///'] = true,
}



--[[-------------------------------------------------------------------------
	Who can open Warns menu and check other admin statistics


Also you can use SteamID or SteamID64
['STEAM_0:0:102105280'] = true,
['76561198164476288'] = true,
---------------------------------------------------------------------------]]
FlameAdminManagement.config.WhoCanOpenMenu = {
	["superadmin"]    = true,
    ["NS-trainee"] = true,
    ["NS-mlmoder"] = true,
    ["NS-moder"] = true,
    ["NS-mladmin"] = true,
    ["NS-admin"] = true,
    ["NS-assistant"] = true,
    ["NS-helper"] = true,
    ["moder"] = true,
    ["padmin"] = true,
    ["sponsor"] = true,
    ["dsuperadmin"] = true,
    ["downer"] = true,
    ["overwatch"] = true,
    ["NS-zammanager"] = true,
    ["manager"] = true,
    ["uprav"] = true,
    ["helper"] = true
}



--[[-------------------------------------------------------------------------
	Who can change admin vacation status


Also you can use SteamID or SteamID64
['STEAM_0:0:102105280'] = true,
['76561198164476288'] = true,
---------------------------------------------------------------------------]]
FlameAdminManagement.config.CanSendOnVacation = {
	["superadmin"]    = true,
    ["overwatch"] = true,
    ["NS-zammanager"] = true,
    ["manager"] = true,
    ["uprav"] = true
}



FlameAdminManagement.config.PunishmentsTypes = {
	["Ban"] = {times = {
		["30 min"] = 30,
		["1 hour"] = 60,
		["3 hours"] = 180,
		["6 hours"] = 360,
		["12 hours"] = 720,
		["1 day"] = 1440,
		["2 days"] = 2880,
		["3 days"] = 4320,
		["1 week"] = 10080,
		["2 weeks"] = 20160,
		["permanent"] = 0
	},
	func = function(sid, time, customreason)
		FlameAdminManagement.BanPlayer(sid, time, customreason)
	end},

	["Kick"] = {func = function(sid, customreason)
		FlameAdminManagement.KickPlayer(sid, customreason)
	end},

	["Demote"] = {func = function(sid, customreason)
		FlameAdminManagement.Demote(sid)
	end},

	["Demote And Kick"] = {func = function(sid, customreason)
		FlameAdminManagement.Demote(sid)
		FlameAdminManagement.KickPlayer(sid, customreason)
	end},

	["Demote And Ban"] = {times = {
		["30 min"] = 30,
		["1 hour"] = 60,
		["3 hours"] = 180,
		["6 hours"] = 360,
		["12 hours"] = 720,
		["1 day"] = 1440,
		["2 days"] = 2880,
		["3 days"] = 4320,
		["1 week"] = 10080,
		["2 weeks"] = 20160,
		["permanent"] = 0
	},
	func = function(sid, time, customreason)
		FlameAdminManagement.Demote(sid)
		FlameAdminManagement.BanPlayer(sid, time, customreason)
	end},
}
--PATH addons/admin_reports/lua/autorun/freports.lua:
require("nw")

freports = freports or {}

local include_sv = SERVER and include or function() end
local include_cl = SERVER and AddCSLuaFile or include
local include_sh = function(f)
	include_sv(f)
	include_cl(f)
end

include_sh("freports/config.lua")

for _, f in SortedPairs( file.Find( "freports/sh_*.lua", "LUA" ) ) do
	include_sh("freports/" .. f)
end 

for _, f in SortedPairs( file.Find( "freports/sv_*.lua", "LUA" ) ) do
	include_sv("freports/" .. f)
end 

for _, f in SortedPairs( file.Find( "freports/cl_*.lua", "LUA" ) ) do
	include_cl("freports/" .. f)
end
--PATH addons/gprofiler/lua/gprofiler/profilers/functions/cl_functions.lua:
GProfiler.Functions = GProfiler.Functions or {}
GProfiler.Functions.Realm = GProfiler.Functions.Realm or "Client"
GProfiler.Functions.ProfileActive = GProfiler.Functions.ProfileActive or false
GProfiler.Functions.StartTime = GProfiler.Functions.StartTime or 0
GProfiler.Functions.EndTime = GProfiler.Functions.EndTime or 0

local TabPadding = 10
local MenuColors = GProfiler.MenuColors

local function PaintEmpty() end

local function ValidateFocus(foc)
	return string.find(foc or "", "function: 0x") != nil
end

local FocusColors = {
	Valid = Color(0, 255, 0),
	Invalid = Color(255, 0, 0)
}

-- Hacky solution for functions that have no signature but are mutually the same
local function CombineDuplicates()
	local combined = {}
	for k, v in pairs(GProfiler.Functions.ProfileData) do
		local lines = string.Split(v.lines, " - ")
		local key = v.source .. lines[1] .. lines[2]
		if not combined[key] then
			combined[key] = {
				name = v.name, source = v.source,
				lines = v.lines, calls = v.calls,
				time = v.time, average = v.average,
				focus = v.focus
			}
		else
			combined[key].calls = combined[key].calls + v.calls
			combined[key].time = combined[key].time + v.time
			combined[key].average = combined[key].average + v.average
		end
	end

	GProfiler.Functions.ProfileData = combined
end

function GProfiler.Functions.DoTab(Content)
	local Header = vgui.Create("DPanel", Content)
	Header:SetSize(Content:GetWide(), 40)
	Header:SetPos(0, 10)
	Header.Paint = PaintEmpty

	local FunctionsFocusLabel = vgui.Create("DLabel", Header)
	FunctionsFocusLabel:SetFont("GProfiler.Menu.SectionHeader")
	FunctionsFocusLabel:SetText(string.format("%s:", GProfiler.Language.GetPhrase("focus")))
	FunctionsFocusLabel:SizeToContents()
	FunctionsFocusLabel:SetPos(TabPadding, Header:GetTall() / 2 - FunctionsFocusLabel:GetTall() / 2)
	FunctionsFocusLabel:SetTextColor(MenuColors.White)

	local FunctionsFocusInput = vgui.Create("DTextEntry", Header)
	FunctionsFocusInput:SetFont("GProfiler.Menu.SectionHeader")
	FunctionsFocusInput:SetText(GProfiler.Functions.Focus or "")
	FunctionsFocusInput:SetMouseInputEnabled(true)
	FunctionsFocusInput:SetSize(150, Header:GetTall() - TabPadding * 2)
	FunctionsFocusInput:SetPos(FunctionsFocusLabel:GetWide() + FunctionsFocusLabel:GetPos() + 5, Header:GetTall() / 2 - FunctionsFocusInput:GetTall() / 2)
	FunctionsFocusInput:SetTextColor(MenuColors.White)

	local IsValidInput = false
	function FunctionsFocusInput:Paint(w, h)
		draw.RoundedBox(4, 0, 0, w, h, MenuColors.RealmSelectorOutline)
		draw.RoundedBox(4, 1, 1, w - 2, h - 2, MenuColors.RealmSelectorBackground)
		draw.RoundedBox(4, 1, 1, 10, h - 2, IsValidInput and FocusColors.Valid or FocusColors.Invalid)
		local x = draw.SimpleText(self:GetText(), "GProfiler.Menu.FocusEntry", 15, h / 2, MenuColors.White, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		if self:IsEditing() and (x < w - 15) and (SysTime() % 1 > 0.5) then
			local caretPos = self:GetCaretPos()
			local text = self:GetText()
			surface.SetFont("GProfiler.Menu.FocusEntry")
			local textWidth = surface.GetTextSize(text)
			local textWidthBeforeCaret = surface.GetTextSize(string.sub(text, 1, caretPos))
			draw.RoundedBox(0, textWidthBeforeCaret + 15, 1, 2, h - 2, MenuColors.White)
		end
	end

	function FunctionsFocusInput:OnTextChanged()
		IsValidInput = ValidateFocus(self:GetText())
		GProfiler.Functions.Focus = self:GetText()
		if not IsValidInput then
			GProfiler.Functions.Focus = false
		end
	end
	FunctionsFocusInput:OnTextChanged()

	local RealmSelector = GProfiler.Menu.CreateRealmSelector(Header, "Functions", Header:GetWide() - 110 - TabPadding, Header:GetTall() / 2 - 30 / 2, 110, 30, function(s, _, value)
		GProfiler.Functions.Realm = value
		GProfiler.Menu.OpenTab("Functions", GProfiler.Functions.DoTab)
	end)
	RealmSelector:SetPos(Header:GetWide() - RealmSelector:GetWide() - TabPadding, Header:GetTall() / 2 - RealmSelector:GetTall() / 2)

	local StartButton = vgui.Create("DButton", Header)
	StartButton:SetText(GProfiler.Functions.ProfileActive and GProfiler.Language.GetPhrase("profiler_stop") or GProfiler.Language.GetPhrase("profiler_start"))
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

	local FunctionTimeRunning = vgui.Create("DLabel", Header)
	FunctionTimeRunning:SetFont("GProfiler.Menu.SectionHeader")
	FunctionTimeRunning:SetText(GProfiler.TimeRunning(GProfiler.Functions.StartTime, GProfiler.Functions.EndTime, GProfiler.Functions.ProfileActive) .. "s")
	FunctionTimeRunning:SizeToContents()
	FunctionTimeRunning:SetPos(Header:GetWide() - FunctionTimeRunning:GetWide() - RealmSelector:GetWide() - StartButton:GetWide() - TabPadding * 3, Header:GetTall() / 2 - FunctionTimeRunning:GetTall() / 2)
	FunctionTimeRunning:SetTextColor(MenuColors.White)
	function FunctionTimeRunning:Think()
		if GProfiler.Functions.ProfileActive then
			self:SetText(GProfiler.TimeRunning(GProfiler.Functions.StartTime, 0, GProfiler.Functions.ProfileActive) .. "s")
			self:SizeToContents()
			self:SetPos(Header:GetWide() - self:GetWide() - RealmSelector:GetWide() - StartButton:GetWide() - TabPadding * 3, Header:GetTall() / 2 - self:GetTall() / 2)
		end
	end

	StartButton.DoClick = function()
		if GProfiler.Functions.ProfileActive then
			GProfiler.Functions.EndTime = SysTime()
			if GProfiler.Functions.Realm == "Server" then
				net.Start("GProfiler_Functions_ToggleServerProfile")
				net.WriteBool(false)
				net.SendToServer()
			else
				GProfiler.Functions:RestoreFunctions()
				GProfiler.Functions.ProfileActive = false
				GProfiler.Menu.OpenTab("Functions", GProfiler.Functions.DoTab)
			end
		else
			GProfiler.Functions.StartTime = SysTime()
			GProfiler.Functions.EndTime = 0
			local focusIsValid = ValidateFocus(GProfiler.Functions.Focus)
			if GProfiler.Functions.Realm == "Server" then
				net.Start("GProfiler_Functions_ToggleServerProfile")
				net.WriteBool(true)
				net.WriteBool(focusIsValid)
				if focusIsValid then
					net.WriteString(GProfiler.Functions.Focus)
				end
				net.SendToServer()
			else
				GProfiler.Functions:DetourFunctions()
				GProfiler.Functions.ProfileActive = true
				StartButton:SetText(GProfiler.Language.GetPhrase("profiler_stop"))

				if focusIsValid then
					GProfiler.Functions.Focus = FunctionsFocusInput:GetText()
				end
			end
		end
	end

	local SectionHeader = vgui.Create("DPanel", Content)
	SectionHeader:SetSize(Content:GetWide(), 40)
	SectionHeader:SetPos(0, Header:GetTall())
	SectionHeader.Paint = PaintEmpty

	local leftFraction = .7
	local rightFraction = .3

	local LeftHeader, LeftHeaderText = GProfiler.Menu.CreateHeader(SectionHeader, GProfiler.Language.GetPhrase("profiler_results"), 0, 0, SectionHeader:GetWide() * leftFraction - 5, SectionHeader:GetTall())
	local RightHeader, RightHeaderText = GProfiler.Menu.CreateHeader(SectionHeader, GProfiler.Language.GetPhrase("function_details"), LeftHeader:GetWide() + 10, 0, SectionHeader:GetWide() * rightFraction - 5, LeftHeader:GetTall())

	local LeftContent = vgui.Create("DPanel", Content)
	LeftContent:SetSize(Content:GetWide() * leftFraction - 5, Content:GetTall() - SectionHeader:GetTall() - Header:GetTall())
	LeftContent:SetPos(0, SectionHeader:GetTall() + Header:GetTall())
	LeftContent.Paint = PaintEmpty

	local RightContent = vgui.Create("DPanel", Content)
	RightContent:SetSize(Content:GetWide() * rightFraction - 5, Content:GetTall() - SectionHeader:GetTall() - Header:GetTall())
	RightContent:SetPos(LeftContent:GetWide() + 10, SectionHeader:GetTall() + Header:GetTall())
	RightContent.Paint = PaintEmpty

	local FunctionDetailsBackground = vgui.Create("DPanel", RightContent)
	FunctionDetailsBackground:SetSize(RightContent:GetWide() - TabPadding * 2, RightContent:GetTall() - TabPadding * 2 - 50)
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
	FunctionDetails:SetText(GProfiler.Language.GetPhrase("function_select"))

	local FunctionDetailsSeparator = vgui.Create("DPanel", RightContent)
	FunctionDetailsSeparator:SetSize(RightContent:GetWide() - TabPadding * 2, 1)
	FunctionDetailsSeparator:SetPos(TabPadding, FunctionDetailsBackground:GetTall() + TabPadding * 2)
	FunctionDetailsSeparator.Paint = function(self, w, h) draw.RoundedBox(4, 0, 0, w, h, MenuColors.HeaderSeparator) end

	local BottomSection = vgui.Create("DPanel", RightContent)
	BottomSection:SetSize(RightContent:GetWide() - TabPadding * 2, RightContent:GetTall() - FunctionDetailsBackground:GetTall() - FunctionDetailsSeparator:GetTall() - TabPadding * 3)
	BottomSection:SetPos(TabPadding, FunctionDetailsBackground:GetTall() + FunctionDetailsSeparator:GetTall() + TabPadding * 3)
	BottomSection.Paint = PaintEmpty

	local SelectedProfile = nil
	local Buttons = {
		[GProfiler.Language.GetPhrase("focus")] = function()
			if not SelectedProfile then return end
			FunctionsFocusInput:SetText(SelectedProfile.focus)
			FunctionsFocusInput:OnTextChanged()
		end,
		[GProfiler.Language.GetPhrase("print_details")] = function(b)
			if not SelectedProfile then return end

			MsgC(MenuColors.Blue, GProfiler.Language.GetPhrase("function"), ": ", MenuColors.White, SelectedProfile.name, "\n")
			MsgC(MenuColors.Blue, GProfiler.Language.GetPhrase("file"), ": ", MenuColors.White, SelectedProfile.source, "\n")
			MsgC(MenuColors.Blue, GProfiler.Language.GetPhrase("lines"), ": ", MenuColors.White, SelectedProfile.lines, "\n")
			MsgC(MenuColors.Blue, GProfiler.Language.GetPhrase("times_called"), ": ", MenuColors.White, SelectedProfile.calls, "\n")
			MsgC(MenuColors.Blue, GProfiler.Language.GetPhrase("total_time"), ": ", MenuColors.White, SelectedProfile.time, "\n")
			MsgC(MenuColors.Blue, GProfiler.Language.GetPhrase("average_time"), ": ", MenuColors.White, SelectedProfile.average, "\n")

			b:SetText(GProfiler.Language.GetPhrase("printed"))
			timer.Simple(2, function()
				if not IsValid(b) then return end
				b:SetText(GProfiler.Language.GetPhrase("print_details"))
			end)
		end
	}

	local ButtonWidth = BottomSection:GetWide() / table.Count(Buttons)
	local ButtonHeight = BottomSection:GetTall() - TabPadding

	local i = 0
	for k, v in pairs(Buttons) do
		local Button = vgui.Create("DButton", BottomSection)
		Button:SetSize(ButtonWidth - 5, ButtonHeight)
		Button:SetPos(i * ButtonWidth + (i * 5), 0)
		Button:SetText(k)
		Button:SetTextColor(MenuColors.White)
		Button:SetFont("GProfiler.Menu.RealmSelector")
		Button.Paint = function(self, w, h)
			draw.RoundedBox(4, 0, 0, w, h, MenuColors.ButtonOutline)
			draw.RoundedBox(4, 1, 1, w - 2, h - 2, MenuColors.ButtonBackground)

			if self:IsHovered() then
				draw.RoundedBox(4, 1, 1, w - 2, h - 2, MenuColors.ButtonHover)
			end
		end
		Button.DoClick = v
		i = i + 1
	end

	local FunctionProfiler = vgui.Create("DListView", LeftContent)
	FunctionProfiler:SetSize(LeftContent:GetWide() - TabPadding * 2, LeftContent:GetTall() - TabPadding * 2)
	FunctionProfiler:SetPos(TabPadding, TabPadding)
	FunctionProfiler:SetMultiSelect(false)
	FunctionProfiler:AddColumn(GProfiler.Language.GetPhrase("function"))
	FunctionProfiler:AddColumn(GProfiler.Language.GetPhrase("file"))
	FunctionProfiler:AddColumn(GProfiler.Language.GetPhrase("times_called"))
	FunctionProfiler:AddColumn(string.format("%s (ms)", GProfiler.Language.GetPhrase("total_time")))
	FunctionProfiler:AddColumn(string.format("%s (ms)", GProfiler.Language.GetPhrase("average_time")))

	CombineDuplicates()

	for k, v in pairs(GProfiler.Functions.ProfileData) do
		if GProfiler.Functions.ProfileActive and GProfiler.Functions.Realm == "Client" then break end
		local line = FunctionProfiler:AddLine(v.name or "Unknown", string.format("%s (%s)", v.source, v.lines), v.calls, v.time, v.average)
		line.OnMousePressed = function(s, l)
			if l == 108 then
				local menu = DermaMenu()
				menu:AddOption(GProfiler.Language.GetPhrase("focus"), function()
					FunctionsFocusInput:SetText(v.focus)
					FunctionsFocusInput:OnTextChanged()
				end):SetIcon("icon16/zoom.png")
				menu:AddOption(GProfiler.CopyLang("name"), function() SetClipboardText(v.name) end):SetIcon("icon16/page_copy.png")
				menu:AddOption(GProfiler.CopyLang("file"), function() SetClipboardText(v.source) end):SetIcon("icon16/page_copy.png")
				menu:AddOption(GProfiler.CopyLang("times_called"), function() SetClipboardText(v.calls) end):SetIcon("icon16/page_copy.png")
				menu:AddOption(GProfiler.CopyLang("total_time"), function() SetClipboardText(v.time) end):SetIcon("icon16/page_copy.png")
				menu:AddOption(GProfiler.CopyLang("average_time"), function() SetClipboardText(v.average) end):SetIcon("icon16/page_copy.png")
				menu:Open()
				return
			end

			SelectedProfile = v
			for k, v in ipairs(FunctionProfiler.Lines) do
				v:SetSelected(false)
			end
			line:SetSelected(true)

			local lines = string.Split(v.lines, " - ")
			GProfiler.RequestFunctionSource(v.source, lines[1], lines[2], function(source)
				if not IsValid(FunctionDetails) then return end
				FunctionDetails:SetText(table.concat(source, "\n"))
			end)
		end
	end

	FunctionProfiler:SortByColumn(5, true)

	GProfiler.StyleDListView(FunctionProfiler)
end

GProfiler.Menu.RegisterTab("Functions", "icon16/bug.png", 3, GProfiler.Functions.DoTab, function()
	if GProfiler.Functions.ProfileActive then
		return "", MenuColors.ActiveProfile
	end
	return nil
end)

net.Receive("GProfiler_Functions_ServerProfileStatus", function()
	local status = net.ReadBool()
	local ply = net.ReadEntity()
	GProfiler.Functions.ProfileActive = status

	if ply == LocalPlayer() then
		GProfiler.Menu.OpenTab("Functions", GProfiler.Functions.DoTab)
	end
end)

net.Receive("GProfiler_Functions_SendData", function(len, ply)
	local first = net.ReadBool()

	if first then
		GProfiler.Functions.ProfileData = {}
	end

	local last = net.ReadBool()
	local count = net.ReadUInt(32)
	for i = 1, count do
		local name = net.ReadString()
		local source = net.ReadString()
		local lines = net.ReadString()
		local calls = net.ReadUInt(32)
		local time = net.ReadFloat()
		local average = net.ReadFloat()
		local focus = net.ReadString()

		if not GProfiler.Functions.ProfileData[name] then
			GProfiler.Functions.ProfileData[name] = {
				name = name,
				source = source,
				lines = lines,
				calls = 0,
				time = 0,
				average = 0,
				focus = focus
			}
		end

		GProfiler.Functions.ProfileData[name].calls = GProfiler.Functions.ProfileData[name].calls + calls
		GProfiler.Functions.ProfileData[name].time = GProfiler.Functions.ProfileData[name].time + time
		GProfiler.Functions.ProfileData[name].average = GProfiler.Functions.ProfileData[name].average + average
	end

	if last then
		GProfiler.Menu.OpenTab("Functions", GProfiler.Functions.DoTab)
	end
end)

--PATH addons/honkai_impact_3rd_gyakushinn_miko_pm_npc_1752597947/lua/autorun/houkai_impact_3rd_gyakushinn_miko.lua:
player_manager.AddValidModel( "Gyakushinn Miko", "models/pacagma/houkai_impact_3rd/gyakushinn_miko/gyakushinn_miko_player.mdl" );
player_manager.AddValidHands( "Gyakushinn Miko", "models/pacagma/houkai_impact_3rd/gyakushinn_miko/gyakushinn_miko_arms.mdl", 0, "00000000" )

local Category = "Houkai Impact 3rd"

local NPC = { 	Name = "Gyakushinn Miko - Friendly", 
				Class = "npc_citizen",
				Model = "models/pacagma/houkai_impact_3rd/gyakushinn_miko/gyakushinn_miko_npc.mdl",
				Health = "100",
				KeyValues = { citizentype = 4 },
				Category = Category	}

list.Set( "NPC", "npc_gyakushinn_miko_f", NPC )

local Category = "Houkai Impact 3rd"

local NPC = { 	Name = "Gyakushinn Miko - Hostile", 
				Class = "npc_combine_s",
				Model = "models/pacagma/houkai_impact_3rd/gyakushinn_miko/gyakushinn_miko_npc.mdl",
				Squadname = "Enemies",
				Numgrenades = "3",
				Health = "100",
				Category = Category	}

list.Set( "NPC", "npc_gyakushinn_miko_h", NPC )


--PATH addons/newjukebox/lua/jukebox/config.lua:
-- -- --
local CONFIG = {} //DO NOT REMOVE

//Distances settings
//Being closer than this distance will make the volume maximum
CONFIG.CloseDistance = 200
//Being further than this distance will make the volume 0
CONFIG.FarDistance = 800
//Display render distance (in units). Set this to 0 to disable the screen
CONFIG.RenderDistance = 1200

CONFIG.themes = { 

	//TO ADD A THEME:
	//1. Copy the ENTIRE block from this line -->
	{
		name = "Default",

		primary = Color(80, 20, 20),
		secondary = Color(180, 180, 180),
		text_1 = Color(255, 255, 255),
		text_2 = Color(40,5,5),

		time_primary = Color(180, 180, 180),
		time_secondary = Color(40,5,5),
		time_scroll = Color(200,0,0),

		volume_active = Color(180,180,180),
		volume_inactive = Color(120, 70, 70)
	},
	//--> Down to this line. (including the '{' and the '},' )
	//2. Paste it here.
	//3. Change the name in quotes.
	//4. Edit the numbers to change the colors.

	{
		name = "Gray",

		primary = Color(45, 45, 45),
		secondary = Color(120, 120, 120),
		text_1 = Color(255, 255, 255),
		text_2 = Color(0,0,0),

		time_primary = Color(120, 120, 120),
		time_secondary = Color(70,70,70),
		time_scroll = Color(255,255,255),

		volume_active = Color(70, 100, 70),
		volume_inactive = Color(70, 70, 70)
	},

}



JUKEBOX.config = CONFIG //DO NOT REMOVE





--PATH addons/svnv_ru_lib/lua/autorun/load/shared/print.lua:
local ply = FindMetaTable("Player")

function ply:ConsolePrint(txt)
	self:PrintMessage( HUD_PRINTCONSOLE , txt)
end
--PATH addons/svnv_ru_lib/lua/autorun/load/shared/timer.lua:
function timers(callback,delay,repeats)
	delay = delay or .1
	repeats = repeats or 1
	local randomname = string.random(true,false,50,true)
	if not (timer.Exists( "randomname" )) then
		callback()
		timer.Create(randomname,delay,repeats,callback)
	else
		timers(callback,delay,repeats)
	end
end
--PATH addons/radial_menu/lua/nexus_framework/core/class.lua:
local CLASS = {}
CLASS.__constructor = function(self, name) end
CLASS.__data = {}
CLASS.__index = CLASS.__data

AccessorFunc(CLASS, "m_acronym", "Acronym")

function CLASS:SetConstructor(func)
	self.__constructor = func
end

function CLASS:Add(name, input)
	self.__data[name] = input
end

function CLASS:Get(name)
	return self.__data[name]
end

function CLASS:TernaryExistance(name, condition, success, failure)
	local lookup = self:Get(name)[condition]
	if (lookup) then
		if (success) then
			success(self, lookup)
		end
	else
		if (failure) then
			failure(self, lookup)
		end
	end
end

function CLASS:Call(name, ...)
	if (self.__data[name]) then
		return self.__data[name](self, ...)
	end
end

function CLASS:Merge(name, input)
	self.__data[name] = table.Merge(self:Get(name), input)
end

function CLASS:Class(name, ...)
	local acronym = self:GetAcronym()

	if (Nexus.Scripts[acronym].classManager[name]) then
		return Nexus.Scripts[acronym].classManager[name]
	end

	Nexus.Scripts[acronym].classManager[name] = self
	self:__constructor(name, ...)
	local col = Nexus.Scripts[acronym]:GetLoadColor()

	return self
end

function Nexus:ClassManager(acronym)
	if (Nexus.Scripts[acronym].classManager) then
		return Nexus.Scripts[acronym].classManager
	end

	local copy = table.Copy(CLASS)
	copy:SetAcronym(acronym)

	Nexus.Scripts[acronym].classManager = copy

	return Nexus.Scripts[acronym].classManager
end
--PATH addons/radial_menu/lua/nexus_framework/core/testing.lua:
local framework = Nexus:ClassManager("Framework")
local testing = framework:Class("Testing")
testing:Add("Tests", {})
testing:Add("Add", function(self, name, func)
	self:Get("Tests")[name] = func
end)
testing:Add("AutoComplete", function(self, cmd, args)
	local tests = self:Get("Tests")

	args = string.Trim(args)
	args = string.lower(args)

	local tbl = {}

	for i, v in pairs(tests) do
		if (i:lower():find(args)) then
			table.insert(tbl, "nexus_test " .. i:lower())
		end
	end

	return tbl
end)

concommand.Add("nexus_test", function(ply, cmd, args)
	local name = args[1]
	local tbl = testing:Get("Tests")[name]
	if (!tbl) then print("No such test") return end

	tbl(ply, cmd, args)
end, function(cmd, args)
	return testing:Call("AutoComplete", cmd, args)
end)
--PATH addons/radial_menu/lua/nexus_framework/vgui/modules/animations.lua:
local framework = Nexus:ClassManager("Framework")
local anim = framework:Class("Animations")
local settings = framework:Class("Settings")

anim:Add("Eases", {
	Default = function(t, b, c, d)
		t = t / d
		local ts = t * t
		local tc = ts * t

		return b + c * (-2 * tc + 3 * ts)
	end
})
anim:Add("Ease", function(self, ease, ...)
	return self:Get("Eases")[ease](...)
end)
anim:Add("LerpColor", function(self, fraction, from, to)
	return Color(
		Lerp(fraction, from.r, to.r),
		Lerp(fraction, from.g, to.g),
		Lerp(fraction, from.b, to.b),
		Lerp(fraction, from.a or 255, to.a or 255)
	)
end)
anim:Add("AnimateColor", function(self, pnl, var, toCol, duration, ease, callback)
	duration = duration or 0.2
	ease = ease or settings:Call("GetEase")

	local col = pnl[var]
	local anim = pnl:NewAnimation(duration)
	anim.Color = toCol
	anim.Think = function(anim, pnl, fraction)
		local _fract = self:Call("Ease", ease, fraction, 0, 1, 1)

		if (!anim.StartColor) then
			anim.StartColor = col
		end

		local newCol = self:Call("LerpColor", _fract, anim.StartColor, anim.Color)
		pnl[var] = newCol
	end
	anim.OnEnd = function()
		if (callback) then callback(pnl) end
	end
end)

--PATH addons/radial_menu/lua/nexus_framework/vgui/components/avatar.lua:
local PANEL = {}

AccessorFunc(PANEL, "vertices", "Vertices")

function PANEL:Init()
  self:SetVertices(90)
	
  self.avatar = vgui.Create("AvatarImage", self)
  self.avatar:SetPaintedManually(true)
end

function PANEL:CalculatePoly(w, h)
  local poly = {}

  local x = w/2
  local y = h/2
  local radius = h/2

  table.insert(poly, { x = x, y = y })

  for i = 0, self.vertices do
    local a = math.rad((i / self.vertices) * -360) + 90
    table.insert(poly, { x = x + math.sin(a) * radius, y = y + math.cos(a) * radius })
  end

  local a = math.rad(0)
  table.insert(poly, { x = x + math.sin(a) * radius, y = y + math.cos(a) * radius })
  self.data = poly
end

function PANEL:PerformLayout(w, h)
  self.avatar:SetPos(0, 0)
  self.avatar:SetSize(w, h)
  self:CalculatePoly(w, h)
end

function PANEL:SetPlayer(ply, size)
  self.avatar:SetPlayer(ply, size)
end

function PANEL:SetSteamID(sid64, size)
  self.avatar:SetSteamID(sid64, size)
end
function PANEL:DrawPoly( w, h )
  if (!self.data) then
    self:CalculatePoly(w, h)
  end

  surface.DrawPoly(self.data)
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
  surface.SetDrawColor(color_white)
  self:DrawPoly(w, h)

  render.SetStencilFailOperation(STENCILOPERATION_ZERO)
  render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
  render.SetStencilZFailOperation(STENCILOPERATION_ZERO)
  render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
  render.SetStencilReferenceValue(1)

  self.avatar:PaintManual()

  render.SetStencilEnable(false)
  render.ClearStencil()
end
vgui.Register("Nexus.CircleAvatar", PANEL)
--PATH addons/foodmode/lua/autorun/povaridze.lua:
PovarItems = {}

function AddPovarItems(name, price, model, Ingridient, Kolvo, callback)
	if istable(price) then
		PovarItems[name] = {
			Name = name,
			Price = price.Price,
			Model = price.Model,
			Ingridient = price.Ingridient,
			Kolvo = price.Kolvo,
			Callback = price.Callback
		}
	else
		PovarItems[name] = {
			Name = name,
			Price = price,
			Model = model,
			Ingridient = ingridient,
			Kolvo = kolvo,
			Callback = callback
		}
	end
end

if SERVER then
	concommand.Add('povarbuy', function(pl, text, args)
		if (not args[1]) or pl:Team() ~= TEAM_COOK then DarkRP.notify(pl, 1, 4, "Это только для повара") return end
		local exploiter = true

		for k, v in ipairs(ents.FindInSphere(pl:GetPos(), 200)) do
			if IsValid(v) and (v:GetClass() == 'povaridzenpc') then
				exploiter = false
				break
			end
		end

		if exploiter then return end
		local item = PovarItems[args[1]]
		if !item then return end
		if not pl:canAfford(item.Price) then
            DarkRP.notify(pl, 1, 4, "У вас не хватает денег")
		else
            DarkRP.notify(pl, 1, 4, "Вы купили ингридиент " ..item.Name.. " за $"..item.Price.."")
			pl:addMoney(-item.Price)
			pl:AddJraka(item.Ingridient, item.Kolvo or 1)

		end
		end)
	end
	
AddPovarItems("Яйцо 1x", {	Price = 5,	Ingridient = 'egg',	Kolvo = 1,	Model = "models/props_phx/misc/egg.mdl"})
AddPovarItems("Яйцо 2x", {	Price = 8,	Ingridient = 'egg',	Kolvo = 2,	Model = "models/props_phx/misc/egg.mdl"})
AddPovarItems("Яйцо 5x", {	Price = 20,	Ingridient = 'egg',	Kolvo = 5,	Model = "models/props_phx/misc/egg.mdl"})

AddPovarItems("Масло 1x", {	Price = 10,	Ingridient = 'oil',	Kolvo = 1,	Model = "models/props_lab/jar01a.mdl"})
AddPovarItems("Масло 2x", {	Price = 18,	Ingridient = 'oil',	Kolvo = 2,	Model = "models/props_lab/jar01a.mdl"})
AddPovarItems("Масло 5x", {	Price = 40,	Ingridient = 'oil',	Kolvo = 5,	Model = "models/props_lab/jar01a.mdl"})
	
AddPovarItems("Яблоко 1x", {	Price = 5,	Ingridient = 'apple',	Kolvo = 1,	Model = "models/props/de_inferno/crate_fruit_break_gib2.mdl"})
AddPovarItems("Яблоко 2x", {	Price = 8,	Ingridient = 'apple',	Kolvo = 2,	Model = "models/props/de_inferno/crate_fruit_break_gib2.mdl"})
AddPovarItems("Яблоко 5x", {	Price = 20,	Ingridient = 'apple',	Kolvo = 5,	Model = "models/props/de_inferno/crate_fruit_break_gib2.mdl"})

-- AddPovarItems("Банан 1x", {	Price = 10,	Ingridient = 'bananna',	Kolvo = 1,	Model = "models/props/cs_italy/bananna.mdl"})
-- AddPovarItems("Банан 2x", {	Price = 18,	Ingridient = 'bananna',	Kolvo = 2,	Model = "models/props/cs_italy/bananna.mdl"})
-- AddPovarItems("Банан 5x", {	Price = 30,	Ingridient = 'bananna',	Kolvo = 5,	Model = "models/props/cs_italy/bananna.mdl"})
		
AddPovarItems("Капуста 1x", {	Price = 8,	Ingridient = 'cabbage',	Kolvo = 1,	Model = "models/foods/cabbage1.mdl"})
AddPovarItems("Капуста 2x", {	Price = 15,	Ingridient = 'cabbage',	Kolvo = 2,	Model = "models/foods/cabbage1.mdl"})
AddPovarItems("Капуста 5x", {	Price = 30,	Ingridient = 'cabbage',	Kolvo = 5,	Model = "models/foods/cabbage1.mdl"})
	
AddPovarItems("Лимон 1x", {	Price = 5,	Ingridient = 'lemon',	Kolvo = 1,	Model = "models/foods/lemon.mdl"})
AddPovarItems("Лимон 2x", {	Price = 8,	Ingridient = 'lemon',	Kolvo = 2,	Model = "models/foods/lemon.mdl"})
AddPovarItems("Лимон 5x", {	Price = 20,	Ingridient = 'lemon',	Kolvo = 5,	Model = "models/foods/lemon.mdl"})

AddPovarItems("Апельсин 1x", {	Price = 5,	Ingridient = 'orange',	Kolvo = 1,	Model = "models/props/cs_italy/orange.mdl"})
AddPovarItems("Апельсин 2x", {	Price = 8,	Ingridient = 'orange',	Kolvo = 2,	Model = "models/props/cs_italy/orange.mdl"})
AddPovarItems("Апельсин 5x", {	Price = 20,	Ingridient = 'orange',	Kolvo = 5,	Model = "models/props/cs_italy/orange.mdl"})
	
AddPovarItems("Картофель 1x", {	Price = 3,	Ingridient = 'potato',	Kolvo = 1,	Model = "models/props_phx/misc/potato.mdl"})
AddPovarItems("Картофель 2x", {	Price = 5,	Ingridient = 'potato',	Kolvo = 2,	Model = "models/props_phx/misc/potato.mdl"})
AddPovarItems("Картофель 5x", {	Price = 12,	Ingridient = 'potato',	Kolvo = 5,	Model = "models/props_phx/misc/potato.mdl"})

AddPovarItems("Помидор 1x", {	Price = 5,	Ingridient = 'tomato',	Kolvo = 1,	Model = "models/props/cs_italy/orange.mdl"})
AddPovarItems("Помидор 2x", {	Price = 8,	Ingridient = 'tomato',	Kolvo = 2,	Model = "models/props/cs_italy/orange.mdl"})
AddPovarItems("Помидор 5x", {	Price = 20,	Ingridient = 'tomato',	Kolvo = 5,	Model = "models/props/cs_italy/orange.mdl"})

AddPovarItems("Арбуз 1x", {	Price = 10,	Ingridient = 'watermelon',	Kolvo = 1,	Model = "models/props_junk/watermelon01.mdl"})
AddPovarItems("Арбуз 2x", {	Price = 18,	Ingridient = 'watermelon',	Kolvo = 2,	Model = "models/props_junk/watermelon01.mdl"})
AddPovarItems("Арбуз 5x", {	Price = 40,	Ingridient = 'watermelon',	Kolvo = 5,	Model = "models/props_junk/watermelon01.mdl"})
	
AddPovarItems("Вода 1x", {	Price = 15,	Ingridient = 'water',	Kolvo = 1,	Model = "models/props/cs_office/Water_bottle.mdl"})
AddPovarItems("Вода 2x", {	Price = 25,	Ingridient = 'water',	Kolvo = 2,	Model = "models/props/cs_office/Water_bottle.mdl"})
AddPovarItems("Вода 5x", {	Price = 50,	Ingridient = 'water',	Kolvo = 5,	Model = "models/props/cs_office/Water_bottle.mdl"})

AddPovarItems("Тост 1x", {	Price = 5,	Ingridient = 'tost',	Kolvo = 1,	Model = "models/foods/toast1.mdl"})
AddPovarItems("Тост 2x", {	Price = 8,	Ingridient = 'tost',	Kolvo = 2,	Model = "models/foods/toast1.mdl"})
AddPovarItems("Тост 5x", {	Price = 20,	Ingridient = 'tost',	Kolvo = 5,	Model = "models/foods/toast1.mdl"})
	
AddPovarItems("Сырое мясо 1x", {	Price = 100,	Ingridient = 'meat',	Kolvo = 1,	Model = "models/foods/backbacon.mdl"})
AddPovarItems("Сырое мясо 2x", {	Price = 180,	Ingridient = 'meat',	Kolvo = 2,	Model = "models/foods/backbacon.mdl"})
AddPovarItems("Сырое мясо 5x", {	Price = 450,	Ingridient = 'meat',	Kolvo = 5,	Model = "models/foods/backbacon.mdl"})

AddPovarItems("Соус 1x", {	Price = 12,	Ingridient = 'sauce',	Kolvo = 1,	Model = "models/props_junk/glassjug01.mdl"})
AddPovarItems("Соус 2x", {	Price = 20,	Ingridient = 'sauce',	Kolvo = 2,	Model = "models/props_junk/glassjug01.mdl"})
AddPovarItems("Соус 5x", {	Price = 43,	Ingridient = 'sauce',	Kolvo = 5,	Model = "models/props_junk/glassjug01.mdl"})
	
AddPovarItems("Банка огурцов 1x", {	Price = 20,	Ingridient = 'cucumbers',	Kolvo = 1,	Model = "models/foods/picklejar.mdl"})
AddPovarItems("Банка огурцов 2x", {	Price = 30,	Ingridient = 'cucumbers',	Kolvo = 2,	Model = "models/foods/picklejar.mdl"})
AddPovarItems("Банка огурцов 5x", {	Price = 70,	Ingridient = 'cucumbers',	Kolvo = 5,	Model = "models/foods/picklejar.mdl"})

AddPovarItems("Cосиска 1x", {	Price = 15,	Ingridient = 'sausage',	Kolvo = 1,	Model = "models/foods/sausage.mdl"})
AddPovarItems("Cосиска 2x", {	Price = 25,	Ingridient = 'sausage',	Kolvo = 2,	Model = "models/foods/sausage.mdl"})
AddPovarItems("Cосиска 5x", {	Price = 50,	Ingridient = 'sausage',	Kolvo = 5,	Model = "models/foods/sausage.mdl"})
	
AddPovarItems("Тесто 1x", {	Price = 10,	Ingridient = 'dough',	Kolvo = 1,	Model = "models/foods/twinkie.mdl"})
AddPovarItems("Тесто 2x", {	Price = 15,	Ingridient = 'dough',	Kolvo = 2,	Model = "models/foods/twinkie.mdl"})
AddPovarItems("Тесто 5x", {	Price = 35,	Ingridient = 'dough',	Kolvo = 5,	Model = "models/foods/twinkie.mdl"})

AddPovarItems("Хлопья 1x", {	Price = 7,	Ingridient = 'cereals',	Kolvo = 1,	Model = "models/foods/applejacks.mdl"})
AddPovarItems("Хлопья 2x", {	Price = 10,	Ingridient = 'cereals',	Kolvo = 2,	Model = "models/foods/applejacks.mdl"})
AddPovarItems("Хлопья 5x", {	Price = 23,	Ingridient = 'cereals',	Kolvo = 5,	Model = "models/foods/applejacks.mdl"})
	
AddPovarItems("Молоко 1x", {	Price = 15,	Ingridient = 'milk',	Kolvo = 1,	Model = "models/props_junk/garbage_milkcarton002a.mdl"})
AddPovarItems("Молоко 2x", {	Price = 20,	Ingridient = 'milk',	Kolvo = 2,	Model = "models/props_junk/garbage_milkcarton002a.mdl"})
AddPovarItems("Молоко 5x", {	Price = 30,	Ingridient = 'milk',	Kolvo = 5,	Model = "models/props_junk/garbage_milkcarton002a.mdl"})

AddPovarItems("Основа для пицы 1x", {	Price = 80,	Ingridient = 'pizzabase',	Kolvo = 1,	Model = "models/foods/pancakesingle.mdl"})
AddPovarItems("Основа для пицы 2x", {	Price = 140,	Ingridient = 'pizzabase',	Kolvo = 2,	Model = "models/foods/pancakesingle.mdl"})
AddPovarItems("Основа для пицы 5x", {	Price = 360,	Ingridient = 'pizzabase',	Kolvo = 5,	Model = "models/foods/pancakesingle.mdl"})
	
AddPovarItems("Сырая кур. ножка 1x", {	Price = 15,	Ingridient = 'rawchickenleg',	Kolvo = 1,	Model = "models/foods/mcdfriedchickenleg.mdl"})
AddPovarItems("Сырая кур. ножка 2x", {	Price = 20,	Ingridient = 'rawchickenleg',	Kolvo = 2,	Model = "models/foods/mcdfriedchickenleg.mdl"})
AddPovarItems("Сырая кур. ножка 5x", {	Price = 30,	Ingridient = 'rawchickenleg',	Kolvo = 5,	Model = "models/foods/mcdfriedchickenleg.mdl"})
--PATH addons/content_segura_2916393133/lua/autorun/rust_hazmat_pm.lua:
player_manager.AddValidModel( "Rust Hazmat Suit", "models/player/darky_m/rust/hazmat.mdl" )
list.Set( "PlayerOptionsModel", "Rust Hazmat Suit", "models/player/darky_m/rust/hazmat.mdl" )
player_manager.AddValidHands( "Rust Hazmat Suit", "models/player/darky_m/rust/hazmat_arms.mdl", 0, "00000000" )
--PATH addons/_adminmodules_menu/lua/sam/menu/sh_init.lua:
if SAM_LOADED then return end

require("sui")

-- sam.command.new("menu")
-- 	:Help("Open admin mod menu")
-- 	:MenuHide()
-- 	:DisableNotify()
-- 	:OnExecute(function(ply)
-- 		sam.netstream.Start(ply, "OpenMenu")
-- 	end)
-- :End()

-- if CLIENT then
-- 	sam.netstream.Hook("OpenMenu", function()
-- 		sam.menu.open_menu()
-- 	end)
-- end

-- if SERVER then
-- 	for _, f in ipairs(file.Find("sam/menu/tabs/*.lua", "LUA")) do
-- 		sam.load_file("sam/menu/tabs/" .. f)
-- 	end
-- end
--PATH addons/battlepass/lua/battlepass/shared/sh_battlepass_config.lua:
encbp.bp.config = {
    rewards = {
        free = {
            [3] = {
                name = 'Черепашка',
                uid = 'cher',
                class = 'acs',
                model = 'models/props/de_tides/vending_turtle.mdl', 
                gradcolor = Color(74, 134, 232, 100),
                lvl = 3,
                check = function(a)
                    return a:SH_HasAccessory('cherepa') -- проверка короче ( 1 - айди )
                end,
                returnmoney = 17, -- сколько возвращает
                func = function(a)
                    SH_ACC:GiveBpAcs(a,'cherepa')
                end,
            },
            [6] = {
                name = 75000,
                uid = 'money1',
                class = 'money',
                gradcolor = Color(106, 168, 79,100),
                lvl = 6,
                func = function(a)
                    a:addMoney(75000)
                end,
            },
            [9] = {
                name = '30 кредитов',
                uid = 'don1',
                class = 'don',
                gradcolor = Color(255, 109, 1,100),
                lvl = 9,
                func = function(a)
                    a:giverayShopCredits( 30 )
                end,
            },
            [12] = {
                name = '15 сосисок в тесте',
                uid = 'eda',
                class = 'eda',
                model = 'models/foods/hotdog.mdl',
                gradcolor = Color(106, 168, 79,100),
                lvl = 12,
                func = function(a)
                    a:HFM_GiveItem('hotdog',15)
                end,
            },
            [15] = {
                name = 'Улыбака',
                uid = 'acs1',
                class = 'acs',
                model = 'models/props_phx/facepunch_logo.mdl',
                gradcolor = Color(74, 134, 232,100),
                lvl = 15,
                check = function(a)
                    return a:SH_HasAccessory('uebaka') -- проверка короче ( 1 - айди )
                end,
                returnmoney = 25, -- сколько возвращает
                func = function(a)
                    SH_ACC:GiveBpAcs(a,'uebaka')
                end,
            },
            [18] = {
                name = 100000,
                uid = 'money2',
                class = 'money',
                model = 'models/maxofs2d/balloon_mossman.mdl',
                gradcolor = Color(106, 168, 79,100),
                lvl = 18,
                func = function(a)
                    a:addMoney(100000)
                end,
            },
            [21] = {
                name = '15 пицц',
                uid = 'eda2',
                class = 'eda',
                model = 'models/foods/pepperonipizza.mdl',
                gradcolor = Color(241, 194, 50,100),
                lvl = 21,
                func = function(a)
                    a:HFM_GiveItem('pizza',15)
                end,
            },
            [24] = {
                name = '30 кредитов',
                uid = 'don3',
                class = 'don',
                gradcolor = Color(255, 109, 1,100),
                lvl = 24,
                func = function(a)
                    a:giverayShopCredits( 30 )
                end,
            },
            [27] = {
                name = 'Монтировка',
                uid = 'weapon1',
                class = 'weapon',
                model = 'models/weapons/c_crowbar.mdl',
                gradcolor = Color(153, 0, 255,100),
                lvl = 27,
                check = function(a)
                    return a:hasPermWeps('weapon_crowbar') -- проверка короче ( 1 - хуй знает, в функции так )
                end,
                returnmoney = 50, -- сколько возвращает
                func = function(a)
                    a:givePermWep( 'weapon_crowbar' )
                end,
            },
            [30] = {
                name = 'Кейс(99)',
                uid = 'case1',
                class = 'case',
                gradcolor = Color(204, 0, 0,100),
                lvl = 30,
                func = function(a)
                    a:ub_addItem('Стандартный')
                end,
            },
        },

        paid = {
            [1] = {
                name = 100000,
                uid = 'money1',
                class = 'money',
                gradcolor = Color(106, 168, 79,100),
                lvl = 1,
                func = function(a) 
                    a:addMoney(100000)
                end,
            },
            [2] = {
                name = '15 сосисок в тесте',
                uid = 'sosiska1',
                class = 'eda',
                model = 'models/foods/hotdog.mdl',
                gradcolor = Color(241, 194, 50,100),
                lvl = 2,
                func = function(a)
                    a:HFM_GiveItem('hotdog',15)
                end,
            },
            [3] = {
                name = 'Бумажный пакет(Dog)', 
                uid = 'pesik1',
                class = 'acs',
                model = 'models/sal/halloween/bag.mdl',
                gradcolor = Color(74, 134, 232,100),
                lvl = 3,
                check = function(a)
                    return a:SH_HasAccessory('paperbag16') -- проверка короче ( 1 - айди )
                end,
                returnmoney = 19, -- сколько возвращает
                func = function(a) 
                    SH_ACC:GiveBpAcs(a,'paperbag16') 
                end,
            },
            [4] = {
                name = '50 кредитов',
                uid = 'kreditiki1', 
                class = 'don',
                gradcolor = Color(255, 109, 1,100), 
                lvl = 4, 
                func = function(a) 
                    a:giverayShopCredits( 50 )
                end,
            },
            [5] = {
                name = 'Кейс(за 99)',
                uid = 'case1',
                class = 'case',
                gradcolor = Color(204, 0, 0,100),
                lvl = 5, 
                func = function(a) 
                    a:ub_addItem('Стандартный')
                end,
            },
            [6] = {
                name = 100000,
                uid = 'money2',
                class = 'money',
                gradcolor = Color(106, 168, 79,100),
                lvl = 6,
                func = function(a) 
                    a:addMoney(100000)
                end,
            },
            [7] = {
                name = 'Galil (навсегда)',
                uid = 'galil',
                class = 'weapon',
                model = 'models/weapons/w_rif_galil.mdl',
                gradcolor = Color(153, 0, 255,100), 
                lvl = 7, 
                check = function(a)
                    return a:hasPermWeps('galil') -- проверка короче ( 1 - хуй знает, в функции так )
                end,
                returnmoney = 100, -- сколько возвращает
                func = function(a)
                    a:givePermWep( 'galil' )
                end,
            },
            [8] = {
                name = 'Шарф(Green)',
                uid = 'sharf',
                class = 'acs',
                model = 'models/sal/acc/fix/scarf01.mdl',
                gradcolor = Color(74, 134, 232,100),
                lvl = 8,
                check = function(a)
                    return a:SH_HasAccessory('scarf6') -- проверка короче ( 1 - айди )
                end,
                returnmoney = 39, -- сколько возвращает
                func = function(a)
                    SH_ACC:GiveBpAcs(a,'scarf6')
                end,
            },
            [9] = {
                name = '50 кредитов',
                uid = 'kreditiki2',
                class = 'don',
                gradcolor = Color(255, 109, 1,100),
                lvl = 9,
                func = function(a)
                    a:giverayShopCredits( 50 )
                end,
            },
            [10] = {
                name = 'Взломщик Кейпадов',
                uid = 'vslimjopi',
                class = 'weapon',
                model = 'models/props_lab/keypad.mdl',
                gradcolor = Color(153, 0, 255,100),
                lvl = 10,
                check = function(a)
                    return a:hasPermWeps('keypad_cracker') -- проверка короче ( 1 - хуй знает, в функции так )
                end,
                returnmoney = 245, -- сколько возвращает
                func = function(a)
                    a:givePermWep( 'keypad_cracker' )
                end,
            },
            [11] = {
                name = 100000,
                uid = 'money3',
                class = 'money',
                gradcolor = Color(106, 168, 79,100),
                lvl = 11,
                func = function(a)
                    a:addMoney(100000)
                end,
            },
            [12] = {
                name = '15 пицц',
                uid = 'pizda',
                class = 'eda',
                model = 'models/foods/pepperonipizza.mdl',
                gradcolor = Color(241, 194, 50,100),
                lvl = 12,
                func = function(a) 
                    a:HFM_GiveItem('pizza',15)
                end,
            },
            [13] = {
                name = '15 пицц',
                uid = 'pizda2',
                class = 'eda',
                model = 'models/foods/pepperonipizza.mdl',
                gradcolor = Color(241, 194, 50,100),
                lvl = 13,
                func = function(a) 
                    a:HFM_GiveItem('pizza',15)
                end,
			},
            [14] = {
                name = 'p90(навсегда)',
                uid = 'p90',
                class = 'weapon', 
                model = 'models/weapons/w_smg_p90.mdl',
                gradcolor = Color(153, 0, 255,100),
                lvl = 14,
                check = function(a)
                    return a:hasPermWeps('p90') -- проверка короче ( 1 - хуй знает, в функции так )
                end,
                returnmoney = 100, -- сколько возвращает
                func = function(a)
                    a:givePermWep( 'p90' )
                end,
            },
            [15] = {
                name = 'Кейс(за 199)',
                uid = 'case2',
                class = 'case',
                gradcolor = Color(204, 0, 0,100),
                lvl = 15, 
                func = function(a) 
                    a:ub_addItem('Премиум')
                end,
            },
            [16] = {
                name = '50 кредитов',
                uid = 'kreditiki3',
                class = 'don',
                gradcolor = Color(255, 109, 1,100),
                lvl = 16,
                func = function(a)
                    a:giverayShopCredits( 50 )
                end,
            },
            [17] = {
                name = 150000,
                uid = 'money3',
                class = 'money',
                gradcolor = Color(106, 168, 79,100),
                lvl = 17,
                func = function(a)
                    a:addMoney(150000)
                end,
            },
            [18] = {
                name = '15 пицц',
                uid = 'pizda1',
                class = 'eda',
                model = 'models/foods/pepperonipizza.mdl',
                gradcolor = Color(241, 194, 50,100),
                lvl = 18,
                func = function(a)
                    a:HFM_GiveItem('pizza',15)
                end,
            },
            [19] = {
                name = 'Рюкзак(зеленый)',
                uid = 'zelenka',
                class = 'acs',
                model = 'models/modified/backpack_2.mdl', 
                gradcolor = Color(74, 134, 232,100),
                lvl = 19,
                check = function(a)
                    return a:SH_HasAccessory('backpackcamp2') -- проверка короче ( 1 - айди )
                end,
                returnmoney = 129, -- сколько возвращает
                func = function(a)
                    SH_ACC:GiveBpAcs(a,'backpackcamp2')
                end,
            },
            [20] = {
                name = 'GMB+',
                uid = 'gmb',
                class = 'admin',
                gradcolor = Color(153, 0, 255,100),
                lvl = 20,
                func = function(a)
                    buygmb(a)
                end,
            },
            [21] = {
                name = '100 кредитов',
                uid = 'kreditiki4',
                class = 'don',
                gradcolor = Color(255, 109, 1,100),
                lvl = 21,
                func = function(a) 
                    a:giverayShopCredits( 100 )
                end,
            },
            [22] = {
                name = 300000,
                uid = 'money4',
                class = 'money',
                gradcolor = Color(106, 168, 79,100),
                lvl = 22,
                func = function(a)
                    a:addMoney(300000)
                end,
            },
            [23] = {
                name = 'Маска обезьяны',
                uid = 'obesianka',
                class = 'acs',
                model = 'models/sal/halloween/monkey.mdl',
                gradcolor = Color(74, 134, 232,100),
                lvl = 23,
                check = function(a)
                    return a:SH_HasAccessory('monkeymask3') -- проверка короче ( 1 - айди )
                end,
                returnmoney = 159, -- сколько возвращает
                func = function(a)
                    SH_ACC:GiveBpAcs(a,'monkeymask3')
                end,
            },
           [24] = {
                name = 'Маска Кубика',
                uid = 'emiko',
                class = 'acs',
                model = 'models/maxofs2d/cube_tool.mdl', 
                gradcolor = Color(74, 134, 232,100),
                lvl = 24,
                func = function(a)
                    SH_ACC:GiveBpAcs(a,'rubikscube') 
                end,
            },
            [25] = {
                name = 'Admin(30d)',
                uid = 'padmin',
                class = 'admin',
                gradcolor = Color(204, 0, 0,100),
                lvl = 25,
                func = function(a) 
					a:BPGiveGroup('Администратор на 30 дней')
                end,
            },
            [26] = {
                name = 'SG552',
                uid = 'sg',
                class = 'weapon',
                model = 'models/weapons/w_rif_sg552.mdl',
                gradcolor = Color(153, 0, 255,100),
                lvl = 26,
                check = function(a)
                    return a:hasPermWeps('sg552') -- проверка короче ( 1 - хуй знает, в функции так )
                end,
                returnmoney = 150, -- сколько возвращает
                func = function(a)
                    a:givePermWep( 'sg552' )
                end,
            },
            [27] = {
                name = '100 кредитов',
                uid = 'kreditiki5',
                class = 'don',
                gradcolor = Color(255, 109, 1,100), 
                lvl = 27, 
                func = function(a) 
                    a:giverayShopCredits( 100 )
                end,
            },
            [28] = {
                name = 'AWP Dragon Lore',
                uid = 'dragonlore',
                class = 'weapon',
                model = 'models/weapons/w_clout_awp.mdl',
                gradcolor = Color(204, 0, 0,100),
                lvl = 29,
                check = function(a)
                    return a:hasPermWeps('awpdragon') -- проверка короче ( 1 - хуй знает, в функции так )
                end,
                returnmoney = 750,
                func = function(a)
                    a:givePermWep( 'awpdragon' )
                end,
            },
            [29] = {
                name = 'Vape бабочка',
                uid = 'butterfly',
                class = 'weapon',
                model = 'models/swamponions/vape.mdl',
                gradcolor = Color(204, 0, 0,100),
                lvl = 29,
                func = function(a)
                    a:givePermWep( 'weapon_vape_butterfly' )
                end,
            },
            [30] = {
                name = 'Бабочка ультрафиолет',
                uid = 'butterflys',
                class = 'weapon',
                model = 'models/weapons/v_csgo_bayonet.mdl',
                gradcolor = Color(204, 0, 0,100),
                lvl = 30,
                check = function(a)
                    return a:hasPermWeps('csgo_butterfly_ultraviolet') -- проверка короче ( 1 - хуй знает, в функции так )
                end,
                returnmoney = 100,
                func = function(a) 
                    a:givePermWep( 'csgo_butterfly_ultraviolet' )
                end,
            },
        },
    },

    tasks = {
        random1 = {
            [1] = { 
                title = 'Арест', -- название
                desc = 'Арестовать за полицейского 25 игроков', -- описание
                uid = 'police', -- уникальный id 
                check = function(a) return a:GetMetadata('BP:Arrested', 0), 25 end, -- Дата, и сколько нужно чтобы выполнить задание ( число )
                exp = 625, -- сколько XP дают за выполнение
            },

            [2] = { 
                title = 'Кулаки',
                desc = 'Убить с помощью кулаков 15 раз',
                uid = 'finger',  
                check = function(a) return a:GetMetadata('BP:Finger', 0), 15 end,
                exp = 625,
            },

            [3] = { 
                title = 'Ордер',
                desc = 'Взять ордер 30 раз',
                uid = 'warrant',
                check = function(a) return a:GetMetadata('BP:Warrant', 0), 30 end,
                exp = 625,
            },

            [4] = { 
                title = 'Маньячина',
                desc = 'Зарезать за маньяка 20 игроков',
                uid = 'msaniak',
                check = function(a) return a:GetMetadata('BP:Maniak', 0), 20 end,
                exp = 625,
            },

            [5] = { 
                title = 'Реклама',
                desc = 'Написать в /advert 50 раз',
                uid = 'advert',
                check = function(a) return a:GetMetadata('BP:Advert', 0), 50 end,
                exp = 625,
            },

            [6] = { 
                title = 'Специалист',
                desc = 'Сменить свою профессию 60 раз',
                uid = 'changeteam',
                check = function(a) return a:GetMetadata('BP:ChangeTeam', 0), 60 end,
                exp = 625,
            },

            [7] = { 
                title = 'Строитель',
                desc = 'Открыть 1000 раз Qmenu',
                uid = 'qmenus',
                check = function(a) return a:GetMetadata('BP:QMenu', 0), 1000 end,
                exp = 625,
            },
        },
        random2 = {
            [8] = { 
                title = 'Сидевший',
                desc = 'Попасть в тюрьму 25 раз',
                uid = 'plyarest',
                check = function(a) return a:GetMetadata('BP:AreestP', 0), 25 end,
                exp = 625,
            },

            [9] = { 
                title = 'Торгаш',
                desc = 'Купить 30 коробок с оружем за продавца оружия',
                uid = 'buyship',
                check = function(a) return a:GetMetadata('BP:BuyShip', 0), 30 end,
                exp = 625,
            },

            [10] = { 
                title = 'Убийца',
                desc = 'Убить 20 игроков за бандита',
                uid = 'KillBand',
                check = function(a) return a:GetMetadata('BP:KillBand', 0), 20 end,
                exp = 625,
            },

            [11] = { 
                title = 'Щедрость',
                desc = 'Передать бездомному 150.000$',
                uid = 'chiefarrest',
                check = function(a) return a:GetMetadata('BP:HoboMon', 0), 150000 end,
                exp = 625,
            },

            [12] = { 
                title = 'Ябеда',
                desc = 'Уволить 15 игроков',
                uid = 'uvolen',
                check = function(a) return a:GetMetadata('BP:Uvolen', 0), 15 end,
                exp = 625,
            },

            [13] = { 
                title = 'Бизнесмен',
                desc = 'Получить 15.000$ с зарплат',
                uid = 'zp',
                check = function(a) return a:GetMetadata('BP:Zp', 0), 15000 end,
                exp = 625,
            },
            [14] = { 
                title = 'Хильщик',
                desc = 'Купить 100 раз аптечку',
                uid = 'medkit',
                check = function(a) return a:GetMetadata('BP:Medkit', 0), 100 end,
                exp = 625,
            },
        },

        random3 = {
            [15] = { 
                title = 'Неудержимый',
                desc = 'Сбежать из тюрьмы 25 раз',
                uid = 'pobeg',
                check = function(a) return a:GetMetadata('BP:Pobeg', 0), 25 end,
                exp = 625,
            },

            [16] = { 
                title = 'Крыса',
                desc = 'Освободить 25 игроков из тюрьмы',
                uid = 'unarrest',
                check = function(a) return a:GetMetadata('BP:unArrest', 0), 25 end,
                exp = 625,
            },

            [17] = { 
                title = 'Танк',
                desc = 'Купить 100 раз броню',
                uid = 'buyarmor',
                check = function(a) return a:GetMetadata('BP:BuyArmor', 0), 100 end,
                exp = 625,
            },

            [18] = { 
                title = 'Анархист',
                desc = 'Убить мэра 5 раз',
                uid = 'slaymayor',
                check = function(a) return a:GetMetadata('BP:SlayMayor', 0), 5 end,
                exp = 625,
            },

            [19] = { 
                title = 'Лакер',
                desc = 'Выиграть 30 раз в казино 50/50',
                uid = 'casionofive',
                check = function(a) return a:GetMetadata('BP:CasionoFive', 0), 30 end,
                exp = 625,
            },

            [20] = { 
                title = 'Грабитель',
                desc = 'Cдать NPC 25 сумок с деньгами',
                uid = 'sellnpc',
                check = function(a) return a:GetMetadata('BP:SellNpc', 0), 25 end,
                exp = 625,
            },

            [21] = { 
                title = 'Битмайнер',
                desc = 'Заработать на битмайнере 50.000$ денег',
                uid = 'bitmoney',
                check = function(a) return a:GetMetadata('BP:BitMoney', 0), 50000 end,
                exp = 625,
            },
        },

        random4 = {
            [22] = { 
                title = 'Рейдер',
                desc = 'Выбить двери вышибалой 20 раз',
                uid = 'vish',
                check = function(a) return a:GetMetadata('BP:Vish', 0), 20 end,
                exp = 625,
            },

            [23] = { 
                title = 'Гровер',
                desc = 'Продать скупщику конопли на сумму 50.000$',
                uid = 'selldrug',
                check = function(a) return a:GetMetadata('BP:SellDrug', 0), 50000 end,
                exp = 625,
            },

            [24] = { 
                title = 'Живодер',
                desc = 'Убить 5 собак за профессию охотника',
                uid = 'killdog',
                check = function(a) return a:GetMetadata('BP:KillDog', 0), 5 end,
                exp = 625,
            },

            [25] = { 
                title = 'Коррупционер',
                desc = 'Продать 30 лицензий за профессию мэра',
                uid = 'licmayor',
                check = function(a) return a:GetMetadata('BP:LicMayor', 0), 30 end,
                exp = 625,
            },

            [26] = { 
                title = 'Лакер 2',
                desc = 'Выиграть 30 раз в казино "Колесо удачи"',
                uid = 'wincolse',
                check = function(a) return a:GetMetadata('BP:WinColse', 0), 30 end,
                exp = 625,
            },

            [27] = { 
                title = 'Убийца',
                desc = 'Убить 20 полицейских',
                uid = 'killgos',
                check = function(a) return a:GetMetadata('BP:Killgos', 0), 20 end,
                exp = 625,
            },

            [28] = { 
                title = 'Шпион',
                desc = 'Замаскироваться под 50 людей за профессию шпиона',
                uid = 'mask',
                check = function(a) return a:GetMetadata('BP:Mask', 0), 50 end,
                exp = 625,
            },
        },

        random5 = {
            [29] = { 
                title = 'Повар',
                desc = 'Приготовить 10 пицц за профессию повара',
                uid = 'piza',
                check = function(a) return a:GetMetadata('BP:Pizza', 0), 10 end,
                exp = 625,
            },

            [30] = { 
                title = 'Метоварщик',
                desc = 'Продать скупщику мета на сумму 25.000$',
                uid = 'mets',
                check = function(a) return a:GetMetadata('BP:Mets', 0), 25000 end,
                exp = 625,
            },

            [31] = { 
                title = 'Наёмник',
                desc = 'Примите 20 заказов за профессию наёмного убийцы',
                uid = 'zakaz',
                check = function(a) return a:GetMetadata('BP:Zakaz', 0), 20 end,
                exp = 625,
            },

            [32] = { 
                title = 'Анонимус',
                desc = 'Написать в /darkweb 50 раз',
                uid = 'darkweb',
                check = function(a) return a:GetMetadata('BP:DarkWeb', 0), 50 end,
                exp = 625,
            },

            [33] = { 
                title = 'Лакер 3',
                desc = 'Выиграть 30 раз в казино "Слоты"',
                uid = 'winslots',
                check = function(a) return a:GetMetadata('BP:WinSlots', 0), 30 end,
                exp = 625,
            },

            [34] = { 
                title = 'Задрот',
                desc = 'Отыграйте на сервере 3 часа без выхода',
                uid = 'online',
                check = function(a) return a:GetMetadata('BP:Online', 0), 3 end,
                exp = 625,
            },

            [35] = { 
                title = 'Вор',
                desc = 'Соберите налог у 50 игроков за профессию мэра',
                uid = 'nalog',
                check = function(a) return a:GetMetadata('BP:Nalog', 0), 50 end,
                exp = 625,
            },
        },

        random6 = {
            [36] = { 
                title = 'Повар',
                desc = 'Приготовить 20 сосисок в тесте за профессию повара',
                uid = 'sosiska',
                check = function(a) return a:GetMetadata('BP:Sosiska', 0), 20 end,
                exp = 625,
            },

            [37] = { 
                title = 'Торгаш',
                desc = 'Продать 10 вещей через торговую лавку',
                uid = 'selllavka',
                check = function(a) return a:GetMetadata('BP:SellLavka', 0), 10 end,
                exp = 625,
            },

            [38] = { 
                title = 'Покупатель',
                desc = 'Купить предметы в торговой лавке на сумму 30.000$',
                uid = 'buylavkas',
                check = function(a) return a:GetMetadata('BP:BuyLavkaS', 0), 30000 end,
                exp = 625,
            },

            [39] = { 
                title = 'Бомжара',
                desc = 'Обшарить 25 мусорок за бездомного',
                uid = 'bomjDump',
                check = function(a) return a:GetMetadata('BP:BomjDump', 0), 25 end,
                exp = 625,
            },

            [40] = { 
                title = 'Убийца',
                desc = 'Убейте 25 бандитов',
                uid = 'bankgos',
                check = function(a) return a:GetMetadata('BP:BankGos', 0), 25 end,
                exp = 625,
            },

            [41] = { 
                title = 'Строитель',
                desc = 'Поставьте 200 пропов',
                uid = 'malohp',
                check = function(a) return a:GetMetadata('BP:SpawnProp', 0), 200 end,
                exp = 625,
            },

            [42] = { 
                title = 'Добрый',
                desc = 'Поставьте +rep администратору 15 раз',
                uid = 'plusrep',
                check = function(a) return a:GetMetadata('BP:PlusRep', 0), 15 end,
                exp = 625,
            },
        },

        random7 = {
            [43] = { 
                title = 'Кровожадный',
                desc = 'Нанесите 3000 единиц урона',
                uid = 'yron',
                check = function(a) return a:GetMetadata('BP:Yron', 0), 3000 end,
                exp = 625,
            },

            [44] = { 
                title = 'Шопоголик',
                desc = 'Купить 10 вещей в торговой лавке',
                uid = 'buylavka',
                check = function(a) return a:GetMetadata('BP:BuyLavka', 0), 10 end,
                exp = 625,
            },

            [45] = { 
                title = 'Предприниматель',
                desc = 'Продать предметы в торговой лавке на сумму 30.000$',
                uid = 'selllawkat',
                check = function(a) return a:GetMetadata('BP:SellLawkaT', 0), 30000 end,
                exp = 625,
            },

            [46] = { 
                title = 'Сидевший',
                desc = 'Сесть на проп 100 раз',
                uid = 'sit',
                check = function(a) return a:GetMetadata('BP:Sit', 0), 100 end,
                exp = 625,
            },

            [47] = { 
                title = 'Охранник',
                desc = 'Убейте 15 людей с помощью станстика',
                uid = 'killstun',
                check = function(a) return a:GetMetadata('BP:KillStun', 0), 15 end,
                exp = 625,
            },

            [48] = { 
                title = 'По домам',
                desc = 'Объявить комендантский час за мэра 10 раз',
                uid = 'lkdmayor',
                check = function(a) return a:GetMetadata('BP:LkdMayor', 0), 10 end,
                exp = 625,
            },

            [49] = { 
                title = 'Злой',
                desc = 'Поставьте -rep администратору 15 раз',
                uid = 'minusrep',
                check = function(a) return a:GetMetadata('BP:MinusRep', 0), 15 end,
                exp = 625,
            },
        },

        random8 = {
            [50] = { 
                title = 'Изгой общества',
                desc = 'Получите блокировку на сервере 1 раз',
                uid = 'mnogoban',
                check = function(a) return a:GetMetadata('BP:MnogoBan', 0), 1 end,
                exp = 625,
            },

            [51] = { 
                title = 'Общительный',
                desc = 'Отправьте сообщение в OOC чат 10 раз',
                uid = 'sayooc',
                check = function(a) return a:GetMetadata('BP:SayOoc', 0), 10 end,
                exp = 625,
            },

            [52] = { 
                title = 'Вандал',
                desc = 'Убейте 15 людей с помощью монтировки',
                uid = 'killstr',
                check = function(a) return a:GetMetadata('BP:KillStr', 0), 15 end,
                exp = 625,
            },

            [53] = { 
                title = 'Ябеда',
                desc = 'Подайте 30 жалоб',
                uid = 'Jaloba',
                check = function(a) return a:GetMetadata('BP:Jaloba', 0), 30 end,
                exp = 625,
            },

            [54] = { 
                title = 'Псина',
                desc = 'Укусите 30 раз за профессию собаки',
                uid = 'dogkus',
                check = function(a) return a:GetMetadata('BP:DogCus', 0), 30 end,
                exp = 625,
            },

            [55] = { 
                title = 'Мелочный',
                desc = 'Подобрать любое количество денег 30 раз',
                uid = 'pickupmoney',
                check = function(a) return a:GetMetadata('BP:PickUpMoney', 0), 30 end,
                exp = 625,
            },

            [56] = { 
                title = 'Розыск',
                desc = 'Объявить в розыск 15 раз',
                uid = 'wantedpol',
                check = function(a) return a:GetMetadata('BP:WantedPolise', 0), 15 end,
                exp = 625,
            },
        },
    },
}

function timeToStr( time )
	local tmp = time
	local s = tmp % 60
	tmp = math.floor( tmp / 60 )
	local m = tmp % 60
	tmp = math.floor( tmp / 60 )
	local h = tmp % 24

	return string.format( '%2i', h )
end

--PATH addons/battlepass/lua/battlepass/vgui/cl_avatar.lua:
local function MakeCirclePoly( _x, _y, _r, _points )
    local _u = ( _x + _r * 320 ) - _x
    local _v = ( _y + _r * 320 ) - _y
    local _slices = ( 2 * math.pi ) / _points
 
    local _poly = { }
 
    for i = 0, _points - 1 do
        local _angle = ( _slices * i ) % _points
        local x = _x + _r * math.cos( _angle )
        local y = _y + _r * math.sin( _angle )
       
        table.insert( _poly, { x = x, y = y, u = _u, v = _v } )
    end

    return _poly
end

local PANEL = {}
 
function PANEL:Init()
    self.Avatar = vgui.Create('AvatarImage', self)
    self.Avatar:SetPaintedManually(true)

    self.material = Material('effects/flashlight001')

    self:OnSizeChanged(self:GetWide(), self:GetTall())
end
 
function PANEL:PerformLayout()
    self:OnSizeChanged(self:GetWide(), self:GetTall())
end
 
function PANEL:SetSteamID(...)
    self.Avatar:SetSteamID(...)
end
 
function PANEL:SetPlayer(...)
    self.Avatar:SetPlayer(...)
end
 
function PANEL:OnSizeChanged(w, h)
    self.Avatar:SetSize(self:GetWide(), self:GetTall())
    self.points = math.Max((self:GetWide() / 4), 32)
    self.poly = MakeCirclePoly(self:GetWide() / 2, self:GetTall() / 2, self:GetWide() / 2, self.points)
end
 
function PANEL:DrawMask(w, h)
    draw.NoTexture()
    surface.SetMaterial(self.material)
    surface.SetDrawColor(255, 255, 255)
    surface.DrawPoly(self.poly)
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
 
    self:DrawMask(w, h)
 
    render.SetStencilFailOperation(STENCILOPERATION_ZERO)
    render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
    render.SetStencilZFailOperation(STENCILOPERATION_ZERO)
    render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
    render.SetStencilReferenceValue(1)
 
    self.Avatar:SetPaintedManually(false)
    self.Avatar:PaintManual()
    self.Avatar:SetPaintedManually(true)
 
    render.SetStencilEnable(false)
    render.ClearStencil()
end

vgui.Register('AvatarMask', PANEL)
--PATH addons/battlepass/lua/battlepass/vgui/cl_item.lua:
local vregister = vgui.Register
local ishitdown = input.IsShiftDown
local icontroldown = input.IsControlDown
local text = draw.SimpleText
local box = draw.RoundedBox

local PANEL = {}

AccessorFunc(PANEL, 'm_bDisabled', 'Disabled', FORCE_BOOL)
AccessorFunc(PANEL, 'm_bIsToggle', 'IsToggle', FORCE_BOOL)
AccessorFunc(PANEL, 'm_bToggle', 'Toggle', FORCE_BOOL)

function PANEL:Init()
    self:SetIsToggle(false)
    self:SetToggle(false)
    self:SetDisabled(false)

    self:SetCursor('hand')
end

function PANEL:Toggle()
    if not self:GetIsToggle() then return end
    
    self:SetToggle(not self:GetToggle())
end

function PANEL:DoClick()
    self:Toggle()
end

function PANEL:OnCursorEntered()
    if self:GetDisabled() then return end
    self:InvalidateLayout(true)
    self.Hovered = true
end

function PANEL:OnCursorExited()
    self:InvalidateLayout(true)
    self.Hovered = false
end

function PANEL:OnMouseReleased(mousecode)
    if self:GetDisabled() then return end
    if not self.Depressed then return end

    if self.Depressed then
        self.Depressed = nil
        self:InvalidateLayout(true)
    end

    if not self.Hovered then return end
    self.Depressed = true

    if mousecode == MOUSE_LEFT then
        self:DoClick()
    end

    self.Depressed = nil
end

function PANEL:OnMousePressed(mousecode)
    if self:GetDisabled() then return end
    
    local isPlyMoving = LocalPlayer and (LocalPlayer():KeyDown(IN_FORWARD) or LocalPlayer():KeyDown(IN_BACK) or LocalPlayer():KeyDown(IN_MOVELEFT) or LocalPlayer():KeyDown(IN_MOVERIGHT))
    
    if self:IsSelectable() and mousecode == MOUSE_LEFT and (ishitdown() or icontroldown()) and not isPlyMoving then return self:StartBoxSelection() end
    
    self.Depressed = true
    self:InvalidateLayout(true)
end

function PANEL:SetData(tbl)
    self.tbl = tbl
end

function PANEL:IsDown()
    return self.Depressed
end

function PANEL:SetDisabled(bDisabled)
    self.m_bDisabled = bDisabled
    self:InvalidateLayout()
end

local function getmat(mat)
    return Material('materials/enc_bp/'..mat..'.png', 'smooth noclamp') 
end

local mat1 = getmat('rectangle_489s2asdasd')
local mat2 = getmat('Group 37111')
local mat3 = getmat('asdasdasvector')
local mat4 = getmat('group_37089')

function PANEL:Paint(w, h)
    surface.SetMaterial(mat1)
    surface.SetDrawColor(255, 255, 255)
    surface.DrawTexturedRect(0, 0, w, h)

    box(0, encbp.w(204), encbp.h(11), encbp.w(25), encbp.h(25), not self:GetDisabled() and encbp.clrs.white or encbp.clrs.graya)
    text(self.tbl.lvl, 'TTB16', encbp.w(204) + encbp.w(25) / 2, encbp.h(11) + encbp.w(25) / 2, not self:GetDisabled() and encbp.clrs.black or encbp.clrs.white,1,1)

    text(self.tbl.name, 'TT14', encbp.w(10), encbp.h(140), encbp.clrs.white)
    if self.tbl.bool == 3 then
        surface.SetMaterial(mat4)
        surface.SetDrawColor(255, 255, 255)
        surface.DrawTexturedRect(0, 0, w, h)
    end

    if self.tbl.bool == 2 then
        surface.SetMaterial(mat2)
        surface.SetDrawColor(255, 255, 255)
        surface.DrawTexturedRect(encbp.w(169), encbp.h(96), encbp.w(70), encbp.h(70))
    elseif self.tbl.bool == 3 or self.tbl.bool == 4 then
        surface.SetMaterial(mat3)
        surface.SetDrawColor(255, 255, 255, 70)
        surface.DrawTexturedRect(encbp.w(169), encbp.h(96), encbp.w(70), encbp.h(70))
    end
end

vregister('bp.item', PANEL, 'EditablePanel')
--PATH addons/deceive/lua/deceive/sh_main.lua:

hook.Add("Initialize", "deceive", function()
	AddCSLuaFile("deceive/sh_config.lua")

	AddCSLuaFile("deceive/sh_translations.lua")
	AddCSLuaFile("deceive/sh_disguise.lua")

	AddCSLuaFile("deceive/cl_disguise.lua")
	AddCSLuaFile("deceive/cl_interface.lua")

	AddCSLuaFile("deceive/sh_shipments.lua")

	deceive = deceive or {}

	local ok, err = pcall(include, "deceive/sh_config.lua")
	if not ok then
		MsgC(Color(255, 255, 0), "\n----------------------------------------------------------------------------------------------------------\n")
		Msg("[Deceive] ") MsgC(Color(255, 92, 92), "ERROR WHILE LOADING CONFIG: " .. err .. "\n")
		MsgC(Color(255, 92, 92), "Unexpected behavior is to be expected! If you have no clue what you are doing, submit a support ticket with the error that your config produces.\n")
		MsgC(Color(255, 92, 92), "Deceive will not function in this state.\n")
		MsgC(Color(255, 255, 0), "----------------------------------------------------------------------------------------------------------\n\n")
		return
	end

	if not deceive.Config then
		MsgC(Color(255, 255, 0), "\n----------------------------------------------------------------------------------------------------------\n")
		Msg("[Deceive] ") MsgC(Color(255, 92, 92), "ERROR WHILE LOADING CONFIG: Config does not exist????\n")
		MsgC(Color(255, 92, 92), "Unexpected behavior is to be expected! If you have no clue what you are doing, submit a support ticket with the error that your config produces.\n")
		MsgC(Color(255, 92, 92), "Deceive will not function in this state.\n")
		MsgC(Color(255, 255, 0), "----------------------------------------------------------------------------------------------------------\n\n")
		return
	end

	include("deceive/sh_translations.lua")
	include("deceive/sh_disguise.lua")

	if SERVER then
		include("deceive/sv_disguise.lua")
		include("deceive/sv_interface.lua")
	elseif CLIENT then
		include("deceive/cl_disguise.lua")
		include("deceive/cl_interface.lua")
	end

	include("deceive/sh_shipments.lua")

	Msg("[Deceive " .. (SERVER and "SERVER" or "CLIENT") .. "] ") MsgC(Color(127, 192, 255), "Loaded successfully!\n")
end)


--PATH addons/dermaf4/lua/autorun/ui_init.lua:

-----------------------------------------------------
ui = ui or {}

IncludeCL = (SERVER) and AddCSLuaFile or include
IncludeSH = function(f) AddCSLuaFile(f) return include(f) end

IncludeSH 'ui/colors.lua'
IncludeCL 'ui/util.lua'
IncludeCL 'ui/theme.lua'

local files, _ = file.Find('ui/controls/*.lua', 'LUA')
for k, v in ipairs(files) do
	IncludeCL('ui/controls/' .. v)
end
--PATH addons/dermaf4/lua/ui/colors.lua:
local c = Color

ui.col = {
	SUP 			= c(51,128,255),
	Background 		= c(10,10,10,170),
	Outline 		= c(100,100,100,255),
	Hover 			= c(160,160,160,40),


	Button 			= c(92,92,92),
	ButtonHover 	= c(152,152,152),
	ButtonRed 		= c(240,0,0),
	ButtonGreen 	= c(0,240,0),
	Close 			= c(235,235,235),
	CloseBackground = c(215,45,90),
	CloseHovered 	= c(235,25,70),


	TransGrey155 	= c(100,100,100,155),
	TransWhite50 	= c(255,255,255,50),
	TransWhite100 	= c(255,255,255,100),
	OffWhite 		= c(200,200,200),
	Grey 			= c(100,100,100),
	FlatBlack 		= c(40,40,40),
	Black 			= c(0,0,0),
	White 			= c(255,255,255),
	Red 			= c(235,10,10),
	Green 			= c(10,235,10),
	DarkGreen 		= c(0, 153, 51),
	Orange 			= c(245,120,0),
	Yellow 			= c(255,255,51),
	Gold 			= c(212,175,55),
	Purple 			= c(147,112,219),
	Pink 			= c(255,105,180),
	Brown 			= c(139,69,19)
}

if CLIENT then
	include 'theme.lua'
end
--PATH addons/dermaf4/lua/ui/controls/avatarbutton.lua:
function _R.Player:ShowProfile()
	gui.OpenURL('https://steamcommunity.com/profiles/' .. self:SteamID64())
end

local PANEL = {}

function PANEL:Init()
	self:SetText('')

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
	if IsValid(self.AvatarImage) then
		self.AvatarImage:SetPos(0, 0)
		self.AvatarImage:SetSize(self:GetWide(), self:GetTall())
	end

	self.Button:SetPos(0, 0)
	self.Button:SetSize(self:GetWide(), self:GetTall())
end

function PANEL:DoClick()
	local pl = self:GetPlayer()
	if IsValid(pl) then
		pl:ShowProfile()
	else
		gui.OpenURL('https://steamcommunity.com/profiles/' .. self.SteamID64)
	end
end

function PANEL:SetPlayer(pl)
	self.AvatarImage = ui.Create('AvatarImage', self)
	self.AvatarImage:SetPlayer(pl)

	self.Button:SetParent(self.AvatarImage)

	self.Player = pl
	self.SteamID64 = pl:SteamID64()
end

function PANEL:SetSteamID64(steamid64)
	self.SteamID64 = steamid64
end

function PANEL:GetPlayer()
	return self.Player
end

function PANEL:GetSteamID64()
	return self.SteamID64
end

vgui.Register('ui_avatarbutton', PANEL, 'DPanel')
--PATH addons/dermaf4/lua/ui/controls/propertysheet.lua:
local PANEL = {}

function PANEL:Paint(w, h)
	derma.SkinHook('Paint', 'PropertySheet', self, w, h)
end

function PANEL:DockToFrame()
	local p = self:GetParent()
	local x, y = p:GetDockPos()
	self:SetPos(x, y -5)
	self:SetSize(p:GetWide() - 10, p:GetTall() - y)
end

vgui.Register('ui_propertysheet', PANEL, 'DPropertySheet')
--PATH addons/dermaf4/lua/ui/controls/settings.lua:
-- local CVAR = FindMetaTable 'Cvar'

-- function CVAR:ShouldShow()
	-- return true
-- end

-- function CVAR:SetShouldShow(func)
	-- self.ShouldShow = func
	-- return self
-- end

-- function CVAR:SetCustomElement(elementName)
	-- self:AddMetadata('Type', 'Custom')
	-- self.CustomElementName = elementName
	-- return self
-- end

-- function CVAR:GetCustomElement()
	-- return self.CustomElementName
-- end

local PANEL = {}

Derma_Hook(PANEL, 'Paint', 'Paint', 'Panel')

function PANEL:Populate(sortOrder)
	local tbl = {}
	for k, v in ipairs(cvar.GetOrderedTable()) do
		if v:GetMetadata('Menu') or v:GetCustomElement() then
			local cat = v:GetMetadata('Category') or v:GetMetadata('Catagory') or 'Другое'
			if (not tbl[cat]) then
				tbl[cat] = {}
			end
			tbl[cat][#tbl[cat] + 1] = v
		end
	end

	local function doCategory(k, v)
		self:SetSpacing(2.5)
		self:AddSpacer(k)
		for k, v in ipairs(v) do
			if v:ShouldShow() then
				local typ = v:GetMetadata('Type') or 'bool'
				if (typ == 'bool') then
					self:AddItem(ui.Create('DPanel', function(self, p)
						self:SetTall(20)
						self.Paint = function() end
						ui.Create('ui_checkbox', function(self, p)
							self:SetPos(5, 0)
							self:SetText(v:GetMetadata('Menu'))
							self:SetConVar(v:GetName())
							self:SizeToContents()
						end, self)
					end))
				elseif (typ == 'number') then
					self:AddItem(ui.Create('DPanel', function(self, p)
						self:SetTall(40)
						self.Paint = function() end

						ui.Create('DLabel', function(self, p)
							self:SetFont('ui.18')
							self:SetColor(ui.col.ButtonText)
							self:SetText(v:GetMetadata('Menu'))
							self:SizeToContents()
							self:SetTall(14)
							self:SetPos(5, 0)
						end, self)

						ui.Create('ui_slider', function(self, p)
							self:SetValue(v:GetValue())
							self.OnChange = function(s, val) v:SetValue(val) end
							self:SetWide(200)
							self:SetPos(5, 18)
						end, self)
					end))
				elseif (typ == 'Custom') then
					self:AddItem(ui.Create(v:GetCustomElement(), function(self)
						self:SetCvar(v)
					end))
				end
			end
		end
	end

	if (sortOrder) then
		for k, v in ipairs(sortOrder) do
			if (tbl[v]) then
				doCategory(v, tbl[v])
				tbl[v] = nil
			end
		end
	end

	for k, v in pairs(tbl) do
		doCategory(k, v)
	end

	hook.Call('ba.LayoutSettingsPanel', nil, self)
end

function PANEL:DockToFrame()
	local p = self:GetParent()
	local x, y = p:GetDockPos()
	self:SetPos(x, y)
	self:SetSize(p:GetWide() - 10, p:GetTall() - (y + 5))
end

vgui.Register('ui_settingspanel', PANEL, 'ui_listview')
--PATH addons/dermaf4/lua/ui/controls/slider_vertical.lua:
local PANEL = {}

function PANEL:Init()
	self.Vertical = true
	self.Button = ui.Create('DButton', self)
	self.Button.OnMousePressed = function(s, mb) if (mb == MOUSE_LEFT) then s:GetParent():StartDrag() end end
	self.Button:SetText('')
	self:SetValue(0.5)
end

function PANEL:PerformLayout()
	self:SetWide(16)
	self.Button:SetSize(16, 16)
	self.Button:SetPos(0, self.Value * (self:GetTall() - 16))
end

function PANEL:Paint(w, h)
	derma.SkinHook('Paint', 'UISlider', self, w, h)
end

function PANEL:Think()
	if (self.Dragging) then
		local mx, my = self:CursorPos()
		my = math.Clamp(my - self.OffY, 0, self:GetTall() - 16)

		if (self.Button.y != my) then
			self:SetValue(my / (self:GetTall() - 16))
			self:OnChange(self.Value)
		end

		if (!input.IsMouseDown(MOUSE_LEFT)) then
			self:EndDrag()
		end
	end
end

function PANEL:StartDrag()
	self.Dragging = true
	_, self.OffY = self.Button:CursorPos()
end

function PANEL:EndDrag()
	self.Dragging = false
end

function PANEL:OnChange(val)
end

function PANEL:SetValue(val)
	self.Value = val
	self.Button:SetPos(val * (self:GetTall() - 16), 0)
end

function PANEL:GetValue()
	return self.Value
end

vgui.Register('ui_slider_vertical', PANEL, 'Panel')
--PATH addons/_adminmodules/lua/ulib/client/draw.lua:
--[[
	Title: Draw

	Our client-side draw functions
]]

--[[
	Function: csayDraw

	Draws a csay text on the screen.

	Parameters:

		msg - The message to draw.
		color - *(Optional, defaults to 255, 255, 255, 255)* The color of the text
		duration - *(Optional, defaults to 5)* The length of the text
		fade - *(Optional, defaults to 0.5)* The length of fade time

	Revisions:

		v2.10 - Added fade parameter
]]
function ULib.csayDraw( msg, color, duration, fade )
	color = color or Color( 255, 255, 255, 255 )
	duration = duration or 5
	fade = fade or 0.5
	local start = CurTime()

	local function drawToScreen()
		local alpha = 255
		local dtime = CurTime() - start

		if dtime > duration then -- Our time has come :'(
			hook.Remove( "HUDPaint", "CSayHelperDraw" )
			return
		end

		if fade - dtime > 0 then -- beginning fade
			alpha = (fade - dtime) / fade -- 0 to 1
			alpha = 1 - alpha -- Reverse
			alpha = alpha * 255
		end

		if duration - dtime < fade then -- ending fade
			alpha = (duration - dtime) / fade -- 0 to 1
			alpha = alpha * 255
		end
		color.a  = alpha

		draw.DrawText( msg, "TargetID", ScrW() * 0.5, ScrH() * 0.25, color, TEXT_ALIGN_CENTER )
	end

	hook.Add( "HUDPaint", "CSayHelperDraw", drawToScreen )
end

--PATH addons/_adminmodules/lua/ulx/modules/cl/xlib.lua:

xlib = {}

function xlib.makecheckbox( t )
	local pnl = vgui.Create( "DCheckBoxLabel", t.parent )
	pnl:SetPos( t.x, t.y )
	pnl:SetText( t.label or "" )
	pnl:SizeToContents()
	pnl:SetValue( t.value or 0 )
	pnl:SetZPos( t.zpos or 0 )
	
	if t.convar then pnl:SetConVar( t.convar ) end

	if t.textcolor then
		pnl:SetTextColor( t.textcolor )
	else
		pnl:SetTextColor( SKIN.text_dark )
	end

	if not t.tooltipwidth then t.tooltipwidth = 250 end
	if t.tooltip then
		if t.tooltipwidth ~= 0 then
			t.tooltip = xlib.wordWrap( t.tooltip, t.tooltipwidth, "Default" )
		end
		pnl:SetTooltip( t.tooltip )
	end

	function pnl:SetDisabled( val )
		pnl.disabled = val
		pnl:SetMouseInputEnabled( not val )
		pnl:SetAlpha( val and 128 or 255 )
	end
	if t.disabled then pnl:SetDisabled( t.disabled ) end

	--Work around for bug where changing the parent of a disabled textbox reenables mouse input.
	local tempfunc = pnl.SetParent
	pnl.SetParent = function( self, parent )
		local ret = tempfunc( self, parent )
		self:SetDisabled( self.disabled )
		return ret
	end

	--Replicated Convar Updating
	if t.repconvar then
		xlib.checkRepCvarCreated( t.repconvar )
		pnl:SetValue( GetConVar( t.repconvar ):GetBool() )
		function pnl.ConVarUpdated( sv_cvar, cl_cvar, ply, old_val, new_val )
			if cl_cvar == t.repconvar:lower() then
				pnl:SetValue( new_val )
			end
		end
		hook.Add( "ULibReplicatedCvarChanged", "XLIB_" .. t.repconvar, pnl.ConVarUpdated )
		function pnl:OnChange( bVal )
			RunConsoleCommand( t.repconvar, tostring( bVal and 1 or 0 ) )
		end
		pnl.Think = function() end --Override think functions to remove Garry's convar check to (hopefully) speed things up
		pnl.ConVarNumberThink = function() end
		pnl.ConVarStringThink = function() end
		pnl.ConVarChanged = function() end
	end
	return pnl
end
function xlib.makelabel( t )
	local pnl = vgui.Create( "DLabel", t.parent )
	pnl:SetPos( t.x, t.y )
	pnl:SetText( t.label or "" )
	pnl:SetFont('RM_16')
	pnl:SetZPos( t.zpos or 0 )

	if not t.tooltipwidth then t.tooltipwidth = 250 end
	if t.tooltip then
		if t.tooltipwidth ~= 0 then
			t.tooltip = xlib.wordWrap( t.tooltip, t.tooltipwidth, "Default" )
		end
		pnl:SetTooltip( t.tooltip )
		pnl:SetMouseInputEnabled( true )
	end

	if t.font then pnl:SetFont( t.font ) end
	if t.w and t.wordwrap then
		pnl:SetText( xlib.wordWrap( t.label, t.w, t.font or "Default" ) )
	end
	pnl:SizeToContents()
	if t.w then pnl:SetWidth( t.w ) end
	if t.h then pnl:SetHeight( t.h ) end


	return pnl
end

function xlib.makelistlayout(t)
    local pnl = vgui.Create("DIconLayout")
    pnl.scroll = vgui.Create("DScrollPanel", t.parent)

    pnl.scroll:SetPos(t.x, t.y)
    pnl.scroll:SetSize(t.w, t.h)
    pnl:SetSize(t.w, t.h)
    pnl.scroll:AddItem(pnl)
    pnl:SetZPos(t.zpos or 0)

    local padding = height(7) 

	function pnl:PerformLayout()
        local children = self:GetChildren()
        local yPos = 0
		local tw
        for _, child in ipairs(children) do
            child:SetPos(0, yPos)
			child:SetWide(t.w)
            yPos = yPos + child:GetTall() + padding
        end

        self:SetTall(yPos)
    end

    return pnl
end

function xlib.makebutton( t )
	local pnl = vgui.Create( "DButton", t.parent )
	pnl:SetSize( weight(2), height(30) )
	if t.label then
		pnl:SetText((string.gsub(t.label, "ulx ", "" ))  )
	end
	pnl:SetDisabled( t.disabled )
	pnl:SetZPos( t.zpos or 0 )
	pnl:SetFont('RM_16')
	pnl:SetTextColor(Color(0,0,0))
	pnl.Paint = function(self,w,h)
		if self.Hovered then
			draw.RoundedBox(3,0,0,w,h,Color(63,186,254,200))
		else
			draw.RoundedBox(3,0,0,w,h,Color(63,186,254))
		end
	end
	return pnl
end

function xlib.makeframe( t )
	local pnl = vgui.Create( "DFrame", t.parent )
	pnl:SetSize( t.w, t.h )
	if t.nopopup ~= true then pnl:MakePopup() end
	pnl:SetPos( t.x or ScrW()/2-t.w/2, t.y or ScrH()/2-t.h/2 )
	pnl:SetTitle( t.label or "" )
	
	if t.draggable ~= nil then pnl:SetDraggable( t.draggable ) end
	if t.showclose ~= nil then pnl:ShowCloseButton( t.showclose ) end
	if t.skin then pnl:SetSkin( t.skin ) end
	if t.visible ~= nil then pnl:SetVisible( t.visible ) end
	return pnl
end

function xlib.makepropertysheet( t )
	local pnl = vgui.Create( "DPropertySheet", t.parent )
	pnl:SetPos( t.x, t.y )
	pnl:SetSize( t.w, t.h )
	
	--Clears all of the tabs in the base.
	function pnl:Clear()
		for _, Sheet in ipairs( self.Items ) do
			Sheet.Panel:SetParent( t.offloadparent )
			Sheet.Tab:Remove()
		end
		self.m_pActiveTab = nil
		self:SetActiveTab( nil )
		self.tabScroller.Panels = {}
		self.Items = {}
	end
	return pnl
end

function xlib.maketextbox( t )
	local pnl = vgui.Create( "SAM.TextEntry", t.parent )
	pnl:SetPos( t.x, t.y )
	pnl:SetWide( t.w )
	pnl:SetTall( t.h or height(30) )
	pnl:SetEnterAllowed( true )
	pnl:SetZPos( t.zpos or 0 )
	if t.convar then pnl:SetConVar( t.convar ) end
	if t.text then pnl:SetText( t.text ) end
	if t.enableinput then pnl:SetEnabled( t.enableinput ) end
	if t.multiline then pnl:SetMultiline( t.multiline ) end
	pnl.selectAll = t.selectall
	if not t.tooltipwidth then t.tooltipwidth = 250 end
	if t.tooltip then
		if t.tooltipwidth ~= 0 then
			t.tooltip = xlib.wordWrap( t.tooltip, t.tooltipwidth, "Default" )
		end
		pnl:SetTooltip( t.tooltip )
	end

	function pnl:SetDisabled( val ) --Simulate enabling/disabling of a textbox
		pnl:SetEnabled( not val )
		pnl:SetMouseInputEnabled( not val )
		pnl:SetAlpha( val and 128 or 255 )
	end
	if t.disabled then pnl:SetDisabled( t.disabled ) end

	--Replicated Convar Updating
	if t.repconvar then
		xlib.checkRepCvarCreated( t.repconvar )
		pnl:SetValue( GetConVar( t.repconvar ):GetString() )
		function pnl.ConVarUpdated( sv_cvar, cl_cvar, ply, old_val, new_val )
			if cl_cvar == t.repconvar:lower() then
				pnl:SetValue( new_val )
			end
		end
		hook.Add( "ULibReplicatedCvarChanged", "XLIB_" .. t.repconvar, pnl.ConVarUpdated )
		function pnl:UpdateConvarValue()
			RunConsoleCommand( t.repconvar, self:GetValue() )
		end
		function pnl:OnEnter()
			RunConsoleCommand( t.repconvar, self:GetValue() )
		end
		pnl.Think = function() end --Override think functions to remove Garry's convar check to (hopefully) speed things up
		pnl.ConVarNumberThink = function() end
		pnl.ConVarStringThink = function() end
		pnl.ConVarChanged = function() end
	end
	return pnl
end

function xlib.makelistview( t )
	local pnl = vgui.Create( "DListView", t.parent )
	pnl:SetPos( t.x, t.y )
	pnl:SetSize( t.w, t.h )
	pnl:SetMultiSelect( t.multiselect )
	pnl:SetHeaderHeight( t.headerheight or height(20) )
	
	return pnl
end

function xlib.makecat( t )
	local pnl = vgui.Create( "DCollapsibleCategory", t.parent )
	pnl:SetPos( t.x, t.y )
	pnl:SetSize( t.w, t.h )
	pnl:SetLabel( t.label or "" )
	pnl:SetContents( t.contents )
	t.contents:SetParent( pnl )
	t.contents:Dock( TOP )

	if t.expanded ~= nil then pnl:SetExpanded( t.expanded ) end
	if t.checkbox then
		pnl.checkBox = vgui.Create( "DCheckBox", pnl.Header )
		pnl.checkBox:SetValue( t.expanded )
		function pnl.checkBox:DoClick()
			self:Toggle()
			pnl:Toggle()
		end
		function pnl.Header:OnMousePressed( mcode )
			if ( mcode == MOUSE_LEFT ) then
				self:GetParent():Toggle()
				self:GetParent().checkBox:Toggle()
				return
			end
			return self:GetParent():OnMousePressed( mcode )
		end
		local tempfunc = pnl.PerformLayout
		pnl.PerformLayout = function( self )
			tempfunc( self )
			self.checkBox:SetPos( self:GetWide()-18, 2 )
		end
	end

	function pnl:SetOpen( bVal )
		if not self:GetExpanded() and bVal then
			pnl.Header:OnMousePressed( MOUSE_LEFT ) --Call the mouse function so it properly toggles the checkbox state (if it exists)
		elseif self:GetExpanded() and not bVal then
			pnl.Header:OnMousePressed( MOUSE_LEFT )
		end
	end

	return pnl
end

function xlib.makepanel( t )
	local pnl = vgui.Create( "DPanel", t.parent )
	pnl:SetPos( t.x, t.y )
	pnl:SetSize( t.w, t.h )
	pnl:SetZPos( t.zpos or 0 )
	pnl.Paint = function(self,w,h)
	end
	if t.skin then pnl:SetSkin( t.skin ) end
	if t.visible ~= nil then pnl:SetVisible( t.visible ) end
	return pnl
end

function xlib.makeXpanel( t )
	local pnl = vgui.Create( "xlib_Panel", t.parent )
	pnl:MakePopup()
	pnl:SetPos( t.x, t.y )
	pnl:SetSize( t.w, t.h )
	if t.visible ~= nil then pnl:SetVisible( t.visible ) end
	return pnl
end

function xlib.makenumberwang( t )
	local pnl = vgui.Create( "DNumberWang", t.parent )
	pnl:SetPos( t.x, t.y )
	pnl:SetDecimals( t.decimal or 0 )
	pnl:SetMinMax( t.min or 0, t.max or 255 )
	pnl:SizeToContents()
	pnl:SetValue( t.value )
	pnl:SetZPos( t.zpos or 0 )
	if t.w then pnl:SetWide( t.w ) end
	if t.h then pnl:SetTall( t.h ) end
	return pnl
end

function xlib.makecombobox( t )
	local pnl = vgui.Create( "SAM.ComboBox", t.parent )
	t.w = t.w or 10
	t.h = t.h or height(40)
	pnl:SetPos( t.x, 0 )
	pnl:SetSize( t.w, t.h )
	pnl:SetZPos( t.zpos or 1 )

	if ( t.enableinput == true ) then
		pnl.TextEntry = vgui.Create( "SAM.TextEntry", pnl )
		pnl.TextEntry.selectAll = t.selectall
		pnl.TextEntry:SetEditable( true )

		pnl.TextEntry.OnGetFocus = function( self ) --Close the menu when the textbox is clicked, IF the menu was open.
			hook.Run( "OnTextEntryGetFocus", self )
			if ( pnl.Menu ) then
				pnl.Menu:Remove()
				pnl.Menu = nil
			end
		end

		pnl.GetValue = function( self ) return self.TextEntry:GetValue() end
		pnl.SetText = function( self, val ) self.TextEntry:SetValue( val ) end

		pnl.ChooseOption = function( self, value, index ) --Update the text of the TextEntry when an option is selected.
			if ( self.Menu ) then
				self.Menu:Remove()
				self.Menu = nil
			end
			self.TextEntry:SetText( value )
			self:OnSelect( index, value, self.Data[index] )
		end

		pnl.PerformLayout = function( self )
			self.TextEntry:SetSize( self:GetWide(), self:GetTall() )
		end
	end
	pnl:SetTextColor(Color(255,255,255))
	pnl:SetText( t.text or "" )
	if not t.tooltipwidth then t.tooltipwidth = 250 end
	if t.tooltip then
		if t.tooltipwidth ~= 0 then
			t.tooltip = xlib.wordWrap( t.tooltip, t.tooltipwidth, "Default" )
		end
		pnl:SetTooltip( t.tooltip )
	end
	if t.choices then

		for i, v in ipairs( t.choices ) do
			pnl:AddChoice( v )
		end
	end

	function pnl:SetDisabled( val ) --enabling/disabling of a textbox
		self:SetMouseInputEnabled( not val )
		self:SetAlpha( val and 128 or 255 )
	end
	if t.disabled then pnl:SetDisabled( t.disabled ) end

	if t.repconvar then
		xlib.checkRepCvarCreated( t.repconvar )
		if t.isNumberConvar then --This is for convar settings stored via numbers (like ulx_rslotsMode)
			if t.numOffset == nil then t.numOffset = 1 end
			local cvar = GetConVar( t.repconvar ):GetInt()
			if tonumber( cvar ) and cvar + t.numOffset <= #pnl.Choices and cvar + t.numOffset > 0 then
				pnl:ChooseOptionID( cvar + t.numOffset )
			else
				pnl:SetText( "Invalid Convar Value" )
			end
			function pnl.ConVarUpdated( sv_cvar, cl_cvar, ply, old_val, new_val )
				if cl_cvar == t.repconvar:lower() then
					if tonumber( new_val ) and new_val + t.numOffset <= #pnl.Choices and new_val + t.numOffset > 0 then
						pnl:ChooseOptionID( new_val + t.numOffset )
					else
						pnl:SetText( "Invalid Convar Value" )
					end
				end
			end
			hook.Add( "ULibReplicatedCvarChanged", "XLIB_" .. t.repconvar, pnl.ConVarUpdated )
			function pnl:OnSelect( index )

				RunConsoleCommand( t.repconvar, tostring( index - t.numOffset ) )
			end
		else  --Otherwise, use each choice as a string for the convar
			pnl:SetText( GetConVar( t.repconvar ):GetString() )
			function pnl.ConVarUpdated( sv_cvar, cl_cvar, ply, old_val, new_val )
				if cl_cvar == t.repconvar:lower() then
					if t.convarblanklabel and new_val == "" then new_val = t.convarblanklabel end
					pnl:SetText( new_val )
				end
			end
			hook.Add( "ULibReplicatedCvarChanged", "XLIB_" .. t.repconvar, pnl.ConVarUpdated )
			function pnl:OnSelect( index, value )
				if t.convarblanklabel and value == "<not specified>" then value = "" end
				RunConsoleCommand( t.repconvar, value )
			end
		end
	end

	return pnl
end
function xlib.maketree( t )
	local pnl = vgui.Create( "DTree", t.parent )
	pnl:SetPos( t.x, t.y )
	pnl:SetSize( t.w, t.h )

	function pnl:Clear() --Clears the DTree.
		if self.RootNode.ChildNodes then
			for _, node in ipairs( self.RootNode.ChildNodes:GetChildren() ) do
				node:Remove()
			end
			self.m_pSelectedItem = nil
			self:InvalidateLayout()
		end
	end
	return pnl
end

function xlib.makecolorpicker( t )
	local pnl = vgui.Create( "xlibColorPanel", t.parent )
	pnl:SetPos( t.x, t.y )
	if t.noalphamodetwo then pnl:NoAlphaModeTwo() end --Provide an alternate layout with no alpha bar.
	if t.addalpha then
		pnl:AddAlphaBar()
		if t.alphamodetwo then pnl:AlphaModeTwo() end
	end
	if t.color then pnl:SetColor( t.color ) end
	if t.repconvar then
		xlib.checkRepCvarCreated( t.repconvar )
		local col = GetConVar( t.repconvar ):GetString()
		if col == "0" then col = "0 0 0" end
		col = string.Split( col, " " )
		pnl:SetColor( Color( col[1], col[2], col[3] ) )
		function pnl.ConVarUpdated( sv_cvar, cl_cvar, ply, old_val, new_val )
			if cl_cvar == t.repconvar:lower() then
				local col = string.Split( new_val, " " )
				pnl:SetColor( Color( col[1], col[2], col[3] ) )
			end
		end
		hook.Add( "ULibReplicatedCvarChanged", "XLIB_" .. t.repconvar, pnl.ConVarUpdated )
		function pnl:OnChange( color )
			RunConsoleCommand( t.repconvar, color.r .. " " .. color.g .. " " .. color.b )
		end
	end
	return pnl
end

--Thanks to Megiddo for this code! :D
function xlib.wordWrap( text, width, font )
	surface.SetFont( font )
	if not surface.GetTextSize( "" ) then
		surface.SetFont( "default" ) --Set font to default if specified font does not return a size properly.
	end
	text = text:Trim()
	local output = ""
	local pos_start, pos_end = 1, 1
	while true do
		local begin, stop = text:find( "%s+", pos_end + 1 )

		if (surface.GetTextSize( text:sub( pos_start, begin or -1 ):Trim() ) > width and pos_end - pos_start > 0) then -- If it's not going to fit, split into a newline
			output = output .. text:sub( pos_start, pos_end ):Trim() .. "\n"
			pos_start = pos_end + 1
			pos_end = pos_end + 1
		else
			pos_end = stop
		end

		if not stop then -- We've hit our last word
			output = output .. text:sub( pos_start ):Trim()
			break
		end
	end
	return output
end

function xlib.makeprogressbar( t )
	local pnl = vgui.Create( "DProgress", t.parent )
	pnl.Label = xlib.makelabel{ x=5, y=3, w=(t.w or 100), textcolor=SKIN.text_dark, parent=pnl }
	pnl:SetPos( t.x, t.y )
	pnl:SetSize( t.w or 100, t.h or 20 )
	pnl:SetFraction( t.value or 0 )
	if t.skin then pnl:SetSkin( t.skin ) end
	if t.visible ~= nil then pnl:SetVisible( t.visible ) end
	return pnl
end

function xlib.checkRepCvarCreated( cvar )
	if GetConVar( cvar ) == nil then
		CreateClientConVar( cvar:lower(), 0, false, false ) --Replicated cvar hasn't been created via ULib. Create a temporary one to prevent errors
	end
end

local PANEL = {}

function PANEL:Init()
    self.MinValue = 0
    self.MaxValue = 100

    self.ButtonContainer = vgui.Create('DPanel', self)
    self.ButtonContainer.Paint = function()
    end
    self.ButtonContainer.OnMousePressed = function(s, mb)
        if (mb == MOUSE_LEFT) then
			local mx, _ = s:CursorPos()
			local newValue = mx / s:GetWide() * (self.MaxValue - self.MinValue) + self.MinValue
			self:SetValue(newValue)
			self:OnChange(newValue)
        end
    end

    self.Button = vgui.Create('DButton', self.ButtonContainer)
    self.Button.OnMousePressed = function(s, mb)
        if (mb == MOUSE_LEFT) then
            self:StartDrag()
        end
    end
    self.Button:SetText('')
    self.Button.Paint = function(self, w, h)
        draw.RoundedBox(10, 0, 0, w, h, Color(63, 186, 254))
    end
    self:SetValue((self.MaxValue - self.MinValue) / 2)
end
function PANEL:SetMin(minValue)
    self.MinValue = minValue
    self:SetValue(math.Clamp(self.Value, self.MinValue, self.MaxValue))
end

function PANEL:SetMax(maxValue)
    self.MaxValue = maxValue
    self:SetValue(math.Clamp(self.Value, self.MinValue, self.MaxValue))
end
function PANEL:PerformLayout()
    self:SetTall(height(28))
    self.ButtonContainer:SetPos(0, height(9))
    self.ButtonContainer:SetSize(self:GetWide(), self:GetTall())
    self.Button:SetSize(weight(10), height(10))
    self.Button:SetPos(self.Value / self.MaxValue * (self.ButtonContainer:GetWide()-weight(10)), 0)
end

function PANEL:Paint(w, h)
    draw.RoundedBox(0, weight(7), height(13), w, height(2), Color(255, 255, 255, 20))
end

function PANEL:Think()
    if (self.Dragging) then
        local mx, my = self:CursorPos()

        mx = math.Clamp(mx - self.OffX, 0, self.ButtonContainer:GetWide()-weight(10))
        if (self.Button.x ~= mx) then
            self:SetValue(mx / (self.ButtonContainer:GetWide()-weight(10)) * self.MaxValue)
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

function PANEL:StartPos()
    self.StartPos = true
    self.OffX = self.ButtonContainer:CursorPos()
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
    return self.Value
end

vgui.Register('slider', PANEL, 'Panel')

function xlib.makeslider( t )
	tmin,tmax = t.min,t.max
	-- --print(tmin,tmax)
	-- local pnl = vgui.Create('slider', t.parent)
	-- pnl:SetPos(t.x, t.y)
	-- pnl:SetSize( t.w or 100,t.h or 20 )
	-- pnl.OnChange = function(self, val)
	-- 	val = math.floor(val)
	-- end
	-- pnl:SetValue(0)
	-- local pnl = vgui.Create( "DNumSlider", t.parent )

	-- pnl.PerformLayout = function() end  -- Clears the code that automatically sets the width of the label to 41% of the entire width.

	-- pnl:SetPos( t.x, t.y )
	-- pnl:SetWide( t.w or 100 )
	-- pnl:SetTall( t.h or 20 )
	-- pnl:SetText( t.label or "" )
	-- pnl:SetMinMax( t.min or 0, t.max or 100 )
	-- pnl:SetDecimals( t.decimal or 0 )
	-- pnl.TextArea:SetDrawBackground( true )
	-- pnl.TextArea.selectAll = t.selectall
	-- pnl.Label:SizeToContents()
	-- pnl:SetZPos( t.zpos or 0 )

	-- if t.textcolor then
	-- 	pnl.Label:SetTextColor( t.textcolor )
	-- else
	-- 	pnl.Label:SetTextColor( SKIN.text_dark )
	-- end

	-- if t.fixclip then pnl.Slider.Knob:NoClipping( false ) end --Fixes clipping on the knob, an example is the sandbox limit sliders.

	-- if t.convar then pnl:SetConVar( t.convar ) end
	-- if not t.tooltipwidth then t.tooltipwidth = 250 end
	-- if t.tooltip then
	-- 	if t.tooltipwidth ~= 0 then
	-- 		t.tooltip = xlib.wordWrap( t.tooltip, t.tooltipwidth, "Default" )
	-- 	end
	-- 	pnl:SetTooltip( t.tooltip )
	-- end

	-- --Support for enabling/disabling slider
	-- pnl.SetDisabled = function( self, val )
	-- 	pnl:SetAlpha( val and 128 or 255 )
	-- 	pnl:SetEnabled( not val )
	-- 	pnl.TextArea:SetEnabled( not val )
	-- 	pnl.TextArea:SetMouseInputEnabled( not val )
	-- 	pnl.Scratch:SetMouseInputEnabled( not val )
	-- 	pnl.Slider:SetMouseInputEnabled( not val )
	-- end
	-- if t.disabled then pnl:SetDisabled( t.disabled ) end

	-- pnl:SizeToContents()

	-- --
	-- --The following code bits are basically copies of Garry's code with changes to prevent the slider from sending updates so often
	-- pnl.GetValue = function( self ) return tonumber( self.TextArea:GetValue() ) end
	-- function pnl.SetValue( self, val )
	-- 	if ( val == nil ) then return end
	-- 	if t.clampmin then val = math.max( tonumber( val ) or 0, self:GetMin() ) end
	-- 	if t.clampmax then val = math.min( tonumber( val ) or 0, self:GetMax() ) end
	-- 	self.Scratch:SetValue( val )
	-- 	self.ValueUpdated( val )
	-- 	self:ValueChanged( val )
	-- end
	-- function pnl.ValueChanged( self, val )
	-- 	if t.clampmin then val = math.max( tonumber( val ) or 0, self:GetMin() ) end
	-- 	if t.clampmax then val = math.min( tonumber( val ) or 0, self:GetMax() ) end
	-- 	self.Slider:SetSlideX( self.Scratch:GetFraction( val ) )
	-- 	if ( self.TextArea != vgui.GetKeyboardFocus() ) then
	-- 		self.TextArea:SetValue( self.Scratch:GetTextValue() )
	-- 	end
	-- 	self:OnValueChanged( val )
	-- end

	-- --Textbox
	-- function pnl.ValueUpdated( value )
	-- 	pnl.TextArea:SetText( string.format("%." .. ( pnl.Scratch:GetDecimals() ) .. "f", tonumber( value ) or 0) )
	-- end
	-- pnl.TextArea.OnTextChanged = function() end
	-- function pnl.TextArea:OnEnter()
	-- 	pnl.TextArea:SetText( string.format("%." .. ( pnl.Scratch:GetDecimals() ) .. "f", tonumber( pnl.TextArea:GetText() ) or 0) )
	-- 	if pnl.OnEnter then pnl:OnEnter() end
	-- end
	-- function pnl.TextArea:OnLoseFocus()
	-- 	pnl:SetValue( pnl.TextArea:GetText() )
	-- 	hook.Call( "OnTextEntryLoseFocus", nil, self )
	-- end

	-- --Slider
	-- local pnl_val
	-- function pnl:TranslateSliderValues( x, y )
	-- 	pnl_val = self.Scratch:GetMin() + (x * self.Scratch:GetRange()) --Store the value and update the textbox to the new value
	-- 	pnl.ValueUpdated( pnl_val )
	-- 	self.Scratch:SetFraction( x )

	-- 	return self.Scratch:GetFraction(), y
	-- end
	-- local tmpfunc = pnl.Slider.Knob.OnMouseReleased
	-- pnl.Slider.Knob.OnMouseReleased = function( self, mcode )
	-- 	tmpfunc( self, mcode )
	-- 	pnl.Slider:OnMouseReleased( mcode )
	-- end
	-- local tmpfunc = pnl.Slider.SetDragging
	-- pnl.Slider.SetDragging = function( self, bval )
	-- 	tmpfunc( self, bval )
	-- 	if ( !bval ) then pnl:SetValue( pnl.TextArea:GetText() ) end
	-- end
	-- pnl.Slider.OnMouseReleased = function( self, mcode )
	-- 	self:SetDragging( false )
	-- 	self:MouseCapture( false )
	-- end

	-- --Scratch
	-- function pnl.Scratch:OnCursorMoved( x, y )
	-- 	if ( !self:GetActive() ) then return end

	-- 	x = x - math.floor( self:GetWide() * 0.5 )
	-- 	y = y - math.floor( self:GetTall() * 0.5 )

	-- 	local zoom = self:GetZoom()
	-- 	local ControlScale = 100 / zoom;
	-- 	local maxzoom = 20
	-- 	if ( self:GetDecimals() ) then
	-- 		maxzoom = 10000
	-- 	end
	-- 	zoom = math.Clamp( zoom + ((y * -0.6) / ControlScale), 0.01, maxzoom );
	-- 	self:SetZoom( zoom )

	-- 	local value = self:GetFloatValue()
	-- 	value = math.Clamp( value + (x * ControlScale * 0.002), self:GetMin(), self:GetMax() );
	-- 	self:SetFloatValue( value )
	-- 	pnl_val = value --Store value for later
	-- 	pnl.ValueUpdated( pnl_val )

	-- 	self:LockCursor()
	-- end
	-- pnl.Scratch.OnMouseReleased = function( self, mousecode )
	-- 	g_Active = nil

	-- 	self:SetActive( false )
	-- 	self:MouseCapture( false )
	-- 	self:SetCursor( "sizewe" )

	-- 	pnl:SetValue( pnl.TextArea:GetText() )
	-- end
	-- --End code changes
	-- --

	-- if t.value then pnl:SetValue( t.value ) end

	-- --Replicated Convar Updating
	-- if t.repconvar then
	-- 	xlib.checkRepCvarCreated( t.repconvar )
	-- 	pnl:SetValue( GetConVar( t.repconvar ):GetFloat() )
	-- 	function pnl.ConVarUpdated( sv_cvar, cl_cvar, ply, old_val, new_val )
	-- 		if cl_cvar == t.repconvar:lower() then
	-- 			if ( IsValid( pnl ) ) then	--Prevents random errors when joining.
	-- 				pnl:SetValue( new_val )
	-- 			end
	-- 		end
	-- 	end
	-- 	hook.Add( "ULibReplicatedCvarChanged", "XLIB_" .. t.repconvar, pnl.ConVarUpdated )
	-- 	function pnl:OnValueChanged( val )
	-- 		RunConsoleCommand( t.repconvar, tostring( val ) )
	-- 	end
	-- 	--Override think functions to remove Garry's convar check to (hopefully) speed things up
	-- 	pnl.ConVarNumberThink = function() end
	-- 	pnl.ConVarStringThink = function() end
	-- 	pnl.ConVarChanged = function() end
	-- end

	-- return pnl
end


-----------------------------------------
--A stripped-down customized DPanel allowing for textbox input!
-----------------------------------------
local PANEL = {}
AccessorFunc( PANEL, "m_bPaintBackground", "PaintBackground" )
Derma_Hook( PANEL, "Paint", "Paint", "Panel" )
Derma_Hook( PANEL, "ApplySchemeSettings", "Scheme", "Panel" )

function PANEL:Init()
	self:SetPaintBackground( true )
end

derma.DefineControl( "xlib_Panel", "", PANEL, "EditablePanel" )


-----------------------------------------
--A copy of Garry's ColorCtrl used in the sandbox spawnmenu, with the following changes:
-- -Doesn't use convars whatsoever
-- -Is a fixed size, but you can have it with/without the alphabar, and there's two layout styles without the alpha bar.
-- -Has two functions: OnChange and OnChangeImmediate for greater control of handling changes.
-----------------------------------------
local PANEL = {}
function PANEL:Init()
	self.showAlpha=false

	self:SetSize( 130, 135 )

	self.RGBBar = vgui.Create( "DRGBPicker", self )
	self.RGBBar.OnChange = function( ctrl, color )
		if ( self.showAlpha ) then
			color.a = self.txtA:GetValue()
		end
		self:SetBaseColor( color )
	end
	self.RGBBar:SetSize( 15, 100 )
	self.RGBBar:SetPos( 5,5 )
	self.RGBBar.OnMouseReleased = function( self, mcode )
		self:MouseCapture( false )
		self:OnCursorMoved( self:CursorPos() )
		self:GetParent():OnChange( self:GetParent():GetColor() )
	end
	function self.RGBBar:SetColor( color )
		local h, s, v = ColorToHSV( color )
		self.LastY = ( 1 - h / 360 ) * self:GetTall()
	end

	self.ColorCube = vgui.Create( "DColorCube", self )
	self.ColorCube.OnUserChanged = function( ctrl ) self:ColorCubeChanged( ctrl ) end
	self.ColorCube:SetSize( 100, 100 )
	self.ColorCube:SetPos( 25,5 )
	self.ColorCube.OnMouseReleased = function( self, mcode )
		self:SetDragging( false )
		self:MouseCapture( false )
		self:GetParent():OnChange( self:GetParent():GetColor() )
	end
	self.ColorCube.Knob.OnMouseReleased = function( self, mcode )
		self:GetParent():GetParent():OnChange( self:GetParent():GetParent():GetColor() )
		return DLabel.OnMouseReleased( self, mousecode )
	end

	self.txtR = xlib.makenumberwang{ x=7, y=110, w=35, value=255, parent=self }
	self.txtR.OnValueChanged = function( self, val )
		local p = self:GetParent()
		p:SetColor( Color( val, p.txtG:GetValue(), p.txtB:GetValue(), p.showAlpha and p.txtA:GetValue() ) )
	end
	self.txtR.OnEnter = function( self )
		local val = tonumber( self:GetValue() )
		if not val then val = 0 end
		self:OnValueChanged( val )
	end
	self.txtR.OnTextChanged = function( self )
		local val = tonumber( self:GetValue() )
		if not val then val = 0 end
		if val ~= math.Clamp( val, 0, 255 ) then self:SetValue( math.Clamp( val, 0, 255 ) ) end
		self:GetParent():UpdateColorText()
	end
	self.txtR.OnLoseFocus = function( self )
		if not tonumber( self:GetValue() ) then self:SetValue( "0" ) end
		local p = self:GetParent()
		p:OnChange( p:GetColor() )
		hook.Call( "OnTextEntryLoseFocus", nil, self )
	end
	self.txtR.Up.DoClick = function( button, mcode )
		self.txtR:SetValue( tonumber( self.txtR:GetValue() ) + 1 )
		self.txtR:GetParent():OnChange( self.txtR:GetParent():GetColor() )
	end
	self.txtR.Down.DoClick = function( button, mcode )
		self.txtR:SetValue( tonumber( self.txtR:GetValue() ) - 1 )
		self.txtR:GetParent():OnChange( self.txtR:GetParent():GetColor() )
	end
	function self.txtR.OnMouseReleased( self, mousecode )
		if ( self.Dragging ) then
			self:GetParent():OnChange( self:GetParent():GetColor() )
			self:EndWang()
		return end
	end
	self.txtG = xlib.makenumberwang{ x=47, y=110, w=35, value=100, parent=self }
	self.txtG.OnValueChanged = function( self, val )
		local p = self:GetParent()
		p:SetColor( Color( p.txtR:GetValue(), val, p.txtB:GetValue(), p.showAlpha and p.txtA:GetValue() ) )
	end
	self.txtG.OnEnter = function( self )
		local val = tonumber( self:GetValue() )
		if not val then val = 0 end
		self:OnValueChanged( val )
	end
	self.txtG.OnTextChanged = function( self )
		local val = tonumber( self:GetValue() )
		if not val then val = 0 end
		if val ~= math.Clamp( val, 0, 255 ) then self:SetValue( math.Clamp( val, 0, 255 ) ) end
		self:GetParent():UpdateColorText()
	end
	self.txtG.OnLoseFocus = function( self )
		if not tonumber( self:GetValue() ) then self:SetValue( "0" ) end
		local p = self:GetParent()
		p:OnChange( p:GetColor() )
		hook.Call( "OnTextEntryLoseFocus", nil, self )
	end
	self.txtG.Up.DoClick = function( button, mcode )
		self.txtG:SetValue( tonumber( self.txtG:GetValue() ) + 1 )
		self.txtG:GetParent():OnChange( self.txtG:GetParent():GetColor() )
	end
	self.txtG.Down.DoClick = function( button, mcode )
		self.txtG:SetValue( tonumber( self.txtG:GetValue() ) - 1 )
		self.txtG:GetParent():OnChange( self.txtG:GetParent():GetColor() )
	end
	function self.txtG.OnMouseReleased( self, mousecode )
		if ( self.Dragging ) then
			self:GetParent():OnChange( self:GetParent():GetColor() )
			self:EndWang()
		return end
	end
	self.txtB = xlib.makenumberwang{ x=87, y=110, w=35, value=100, parent=self }
	self.txtB.OnValueChanged = function( self, val )
		local p = self:GetParent()
		p:SetColor( Color( p.txtR:GetValue(), p.txtG:GetValue(), val, p.showAlpha and p.txtA:GetValue() ) )
	end
	self.txtB.OnEnter = function( self )
		local val = tonumber( self:GetValue() )
		if not val then val = 0 end
		self:OnValueChanged( val )
	end
	self.txtB.OnTextChanged = function( self )
		local val = tonumber( self:GetValue() )
		if not val then val = 0 end
		if val ~= math.Clamp( val, 0, 255 ) then self:SetValue( math.Clamp( val, 0, 255 ) ) end
		self:GetParent():UpdateColorText()
	end
	self.txtB.OnLoseFocus = function( self )
		if not tonumber( self:GetValue() ) then self:SetValue( "0" ) end
		local p = self:GetParent()
		p:OnChange( p:GetColor() )
		hook.Call( "OnTextEntryLoseFocus", nil, self )
	end
	self.txtB.Up.DoClick = function( button, mcode )
		self.txtB:SetValue( tonumber( self.txtB:GetValue() ) + 1 )
		self.txtB:GetParent():OnChange( self.txtB:GetParent():GetColor() )
	end
	self.txtB.Down.DoClick = function( button, mcode )
		self.txtB:SetValue( tonumber( self.txtB:GetValue() ) - 1 )
		self.txtB:GetParent():OnChange( self.txtB:GetParent():GetColor() )
	end
	function self.txtB.OnMouseReleased( self, mousecode )
		if ( self.Dragging ) then
			self:GetParent():OnChange( self:GetParent():GetColor() )
			self:EndWang()
		return end
	end

	self:SetColor( Color( 255, 0, 0, 255 ) )
end

function PANEL:AddAlphaBar()
	self.showAlpha = true
	self.txtA = xlib.makenumberwang{ x=150, y=82, w=35, value=255, parent=self }
	self.txtA.OnValueChanged = function( self, val )
		local p = self:GetParent()
		p:SetColor( Color( p.txtR:GetValue(), p.txtG:GetValue(), p.txtB:GetValue(), val ) )
	end
	self.txtA.OnEnter = function( self )
		local val = tonumber( self:GetValue() )
		if not val then val = 0 end
		self:OnValueChanged( val )
	end
	self.txtA.OnTextChanged = function( self )
		local p = self:GetParent()
		local val = tonumber( self:GetValue() )
		if not val then val = 0 end
		if val ~= math.Clamp( val, 0, 255 ) then self:SetValue( math.Clamp( val, 0, 255 ) ) end
		p.AlphaBar:SetValue( 1 - ( val / 255) )
		p:OnChangeImmediate( p:GetColor() )
	end
	self.txtA.OnLoseFocus = function( self )
		if not tonumber( self:GetValue() ) then self:SetValue( "0" ) end
		local p = self:GetParent()
		p:OnChange( p:GetColor() )
		hook.Call( "OnTextEntryLoseFocus", nil, self )
	end
	self.txtA.Up.DoClick = function( button, mcode )
		self.txtA:SetValue( tonumber( self.txtA:GetValue() ) + 1 )
		self.txtA:GetParent():OnChange( self.txtA:GetParent():GetColor() )
	end
	self.txtA.Down.DoClick = function( button, mcode )
		self.txtA:SetValue( tonumber( self.txtA:GetValue() ) - 1 )
		self.txtA:GetParent():OnChange( self.txtA:GetParent():GetColor() )
	end
	function self.txtA.OnMouseReleased( self, mousecode )
		if ( self.Dragging ) then
			self:GetParent():OnChange( self:GetParent():GetColor() )
			self:EndWang()
		return end
	end

	self.AlphaBar = vgui.Create( "DAlphaBar", self )
	self.AlphaBar.OnChange = function( ctrl, alpha ) self:SetColorAlpha( alpha*255 ) end
	self.AlphaBar:SetPos( 25,5 )
	self.AlphaBar:SetSize( 15, 100 )
	self.AlphaBar:SetValue( 1 )
	self.AlphaBar.OnMouseReleased = function( self, mcode )
		self:MouseCapture( false )
		self:OnCursorMoved( self:CursorPos() )
		self:GetParent():OnChange( self:GetParent():GetColor() )
	end

	self.ColorCube:SetPos( 45,5 )
	self:SetSize( 190, 110 )
	self.txtR:SetPos( 150, 7 )
	self.txtG:SetPos( 150, 32 )
	self.txtB:SetPos( 150, 57 )
end

function PANEL:AlphaModeTwo()
	self:SetSize( 156, 135 )
	self.AlphaBar:SetPos( 28,5 )
	self.ColorCube:SetPos( 51,5 )
	self.txtR:SetPos( 5, 110 )
	self.txtG:SetPos( 42, 110 )
	self.txtB:SetPos( 79, 110 )
	self.txtA:SetPos( 116, 110 )
end

function PANEL:NoAlphaModeTwo()
	self:SetSize( 170, 110 )
	self.txtR:SetPos( 130, 7 )
	self.txtG:SetPos( 130, 32 )
	self.txtB:SetPos( 130, 57 )
end

function PANEL:UpdateColorText()
	self.RGBBar:SetColor( Color( self.txtR:GetValue(), self.txtG:GetValue(), self.txtB:GetValue(), self.showAlpha and self.txtA:GetValue() ) )
	self.ColorCube:SetColor( Color( self.txtR:GetValue(), self.txtG:GetValue(), self.txtB:GetValue(), self.showAlpha and self.txtA:GetValue() ) )
	if ( self.showAlpha ) then self.AlphaBar:SetBarColor( Color( self.txtR:GetValue(), self.txtG:GetValue(), self.txtB:GetValue(), 255 ) ) end
	self:OnChangeImmediate( self:GetColor() )
end

function PANEL:SetColor( color )
	self.RGBBar:SetColor( color )
	self.ColorCube:SetColor( color )

	if tonumber( self.txtR:GetValue() ) ~= color.r then self.txtR:SetText( color.r or 255 ) end
	if tonumber( self.txtG:GetValue() ) ~= color.g then self.txtG:SetText( color.g or 0 ) end
	if tonumber( self.txtB:GetValue() ) ~= color.b then self.txtB:SetText( color.b or 0 ) end

	if ( self.showAlpha ) then
		self.txtA:SetText( color.a or 0 )
		self.AlphaBar:SetBarColor( Color( color.r, color.g, color.b ) )
		self.AlphaBar:SetValue( ( ( color.a or 0 ) / 255) )
	end

	self:OnChangeImmediate( color )
end

function PANEL:SetBaseColor( color )
	self.ColorCube:SetBaseRGB( color )

	self.txtR:SetText(self.ColorCube.m_OutRGB.r)
	self.txtG:SetText(self.ColorCube.m_OutRGB.g)
	self.txtB:SetText(self.ColorCube.m_OutRGB.b)

	if ( self.showAlpha ) then
		self.AlphaBar:SetBarColor( Color( self:GetColor().r, self:GetColor().g, self:GetColor().b ) )
	end
	self:OnChangeImmediate( self:GetColor() )
end

function PANEL:SetColorAlpha( alpha )
	if ( self.showAlpha ) then
		alpha = alpha or 0
		self.txtA:SetValue(alpha)
	end
end

function PANEL:ColorCubeChanged( cube )
	self.txtR:SetText(cube.m_OutRGB.r)
	self.txtG:SetText(cube.m_OutRGB.g)
	self.txtB:SetText(cube.m_OutRGB.b)
	if ( self.showAlpha ) then
		self.AlphaBar:SetBarColor( Color( self:GetColor().r, self:GetColor().g, self:GetColor().b ) )
	end
	self:OnChangeImmediate( self:GetColor() )
end

function PANEL:GetColor()
	local color = Color( self.txtR:GetValue(), self.txtG:GetValue(), self.txtB:GetValue() )
	if ( self.showAlpha ) then
		color.a = self.txtA:GetValue()
	else
		color.a = 255
	end
	return color
end

function PANEL:PerformLayout()
	self:SetColor( Color( self.txtR:GetValue(), self.txtG:GetValue(), self.txtB:GetValue(), self.showAlpha and self.txtA:GetValue() ) )
end

function PANEL:OnChangeImmediate( color )
	--For override
end

function PANEL:OnChange( color )
	--For override
end

vgui.Register( "xlibColorPanel", PANEL, "DPanel" )


-- Create font for Ban Message preview to match the font used in the actual banned/disconnect dialog.
surface.CreateFont ("DefaultLarge", {
	font = "Tahoma",
	size = 16,
	weight = 0,
})

-------------------------
--Custom Animation System
-------------------------
--This is a heavily edited version of Garry's derma animation stuff with the following differences:
	--Allows for animation chains (one animation to begin right after the other)
	--Can call functions anywhere during the animation cycle.
	--Reliably calls a start/end function for each animation so the animations always shows/ends properly.
	--Animations can be completely disabled by setting 0 for the animation time.
local xlibAnimation = {}
xlibAnimation.__index = xlibAnimation

function xlib.anim( runFunc, startFunc, endFunc )
	local anim = {}
	anim.runFunc = runFunc
	anim.startFunc = startFunc
	anim.endFunc = endFunc
	setmetatable( anim, xlibAnimation )
	return anim
end

xlib.animTypes = {}
xlib.registerAnimType = function( name, runFunc, startFunc, endFunc )
	xlib.animTypes[name] = xlib.anim( runFunc, startFunc, endFunc )
end

function xlibAnimation:Start( Length, Data )
	self.startFunc( Data )
	if ( Length == 0 ) then
		self.endFunc( Data )
		xlib.animQueue_call()
	else
		self.Length = Length
		self.StartTime = SysTime()
		self.EndTime = SysTime() + Length
		self.Data = Data
		table.insert( xlib.activeAnims, self )
	end
end

function xlibAnimation:Stop()
	self.runFunc( 1, self.Data )
	self.endFunc( self.Data )
	for i, v in ipairs( xlib.activeAnims ) do
		if v == self then table.remove( xlib.activeAnims, i ) break end
	end
	xlib.animQueue_call()
end

function xlibAnimation:Run()
	local CurTime = SysTime()
	local delta = (CurTime - self.StartTime) / self.Length
	if ( CurTime > self.EndTime ) then
		self:Stop()
	else
		self.runFunc( delta, self.Data )
	end
end

--Animation Ticker
xlib.activeAnims = {}
xlib.animRun = function()
	for _, v in ipairs( xlib.activeAnims ) do
		v.Run( v )
	end
end
hook.Add( "XLIBDoAnimation", "xlib_runAnims", xlib.animRun )

-------------------------
--Animation chain manager
-------------------------
xlib.animQueue = {}
xlib.animBackupQueue = {}

--This will allow us to make animations run faster when linked together
--Makes sure the entire animation length = animationTime (~0.2 sec by default)
xlib.animStep = 0

--Call this to begin the animation chain
xlib.animQueue_start = function()
	if xlib.animRunning then --If a new animation is starting while one is running, then we should instantly stop the old one.
		xlib.animQueue_forceStop()
		return --The old animation should be finished now, and the new one should be starting
	end
	xlib.curAnimStep = xlib.animStep
	xlib.animStep = 0
	xlib.animQueue_call()
end

xlib.animQueue_forceStop = function()
	--This will trigger the currently chained animations to run at 0 seconds.
	xlib.curAnimStep = -1
	if type( xlib.animRunning ) == "table" then xlib.animRunning:Stop() end
end

xlib.animQueue_call = function()
	if #xlib.animQueue > 0 then
		local func = xlib.animQueue[1]
		table.remove( xlib.animQueue, 1 )
		func()
	else
		xlib.animRunning = nil
		--Check for queues in the backup that haven't been started.
		if #xlib.animBackupQueue > 0 then
			xlib.animQueue = table.Copy( xlib.animBackupQueue )
			xlib.animBackupQueue = {}
			xlib.animQueue_start()
		end
	end
end

xlib.addToAnimQueue = function( obj, ... )
	local arg = { ... }
	--If there is an animation running, then we need to store the new animation stuff somewhere else temporarily.
	--Also, if ignoreRunning is true, then we'll add the anim to the regular queue regardless of running status.
	local outTable = xlib.animRunning and xlib.animBackupQueue or xlib.animQueue

	if type( obj ) == "function" then
		table.insert( outTable, function() xlib.animRunning = true  obj( unpack( arg ) )  xlib.animQueue_call() end )
	elseif type( obj ) == "string" and xlib.animTypes[obj] then
		--arg[1] should be data table, arg[2] should be length
		length = arg[2] or xgui.settings.animTime or 1
		xlib.animStep = xlib.animStep + 1
		table.insert( outTable, function() xlib.animRunning = xlib.animTypes[obj]  xlib.animRunning:Start( ( xlib.curAnimStep ~= -1 and ( length/xlib.curAnimStep ) or 0 ), arg[1] ) end )
	else
		Msg( "Error: XLIB recieved an invalid animation call! TYPE:" .. type( obj ) .. " VALUE:" .. tostring( obj ) .. "\n" )
	end
end

-------------------------
--Default Animation Types
-------------------------
--Slide animation
local function slideAnim_run( delta, data )
	--data.panel, data.startx, data.starty, data.endx, data.endy, data.setvisible
	data.panel:SetPos( data.startx+((data.endx-data.startx)*delta), data.starty+((data.endy-data.starty)*delta) )
end

local function slideAnim_start( data )
	data.panel:SetPos( data.startx, data.starty )
	if data.setvisible == true then
		ULib.queueFunctionCall( data.panel.SetVisible, data.panel, true )
	end
end

local function slideAnim_end( data )
	data.panel:SetPos( data.endx, data.endy )
	if data.setvisible == false then
		data.panel:SetVisible( false )
	end
end
xlib.registerAnimType( "pnlSlide", slideAnim_run, slideAnim_start, slideAnim_end )

--Fade animation
local function fadeAnim_run( delta, data )
	if data.panelOut then data.panelOut:SetAlpha( 255-(delta*255) ) data.panelOut:SetVisible( true ) end
	if data.panelIn then data.panelIn:SetAlpha( 255 * delta ) data.panelIn:SetVisible( true ) end
end

local function fadeAnim_start( data )
	if data.panelOut then data.panelOut:SetAlpha( 255 ) data.panelOut:SetVisible( true ) end
	if data.panelIn then data.panelIn:SetAlpha( 0 ) data.panelIn:SetVisible( true ) end
end

local function fadeAnim_end( data )
	if data.panelOut then data.panelOut:SetVisible( false ) end
	if data.panelIn then data.panelIn:SetAlpha( 255 ) end
end
xlib.registerAnimType( "pnlFade", fadeAnim_run, fadeAnim_start, fadeAnim_end )
--PATH addons/_bansys/lua/ulx/modules/sh/gameban.lua:
local CATEGORY_NAME = "Наказания"
local owners = {
    ['STEAM_0:1:85418510'] = 1 -- Arthur
}
function ulx.gban( calling_ply, target_ply, minutes, reason )
	if target_ply:IsBot() then
		ULib.tsayError( calling_ply, "Cannot ban a bot", true )
		return
	end
	
    if SERVER then
		if target_ply.frozen then
			target_ply:UnLock()
			target_ply.frozen = nil
			ulx.clearExclusive( target_ply )
			target_ply:DisallowSpawning( false )
			ulx.setNoDie( target_ply, false )
		end
    end

    if calling_ply.sBanned then
        ULib.tsayError( calling_ply, "Вы забанены!", true )
        return
    end

    if owners[target_ply:SteamID()] then
        local col = team.GetColor(calling_ply:Team())
        ULib.tsayError( calling_ply, "Нельзя забанить этого игрока!", true )
        sendachat(Color(255,40,40),'[' , achat.ranks[calling_ply:GetUserGroup()] , '] ',col, calling_ply:Nick() ,Color(255,255,255), ': Попытался выполнить команду BAN к - ',Color(255,0,0), target_ply:Nick())
        return
    end

	if SERVER then
    if (calling_ply == target_ply) then ULib.tsayError( calling_ply, "Вы не можете забанить самого себя!", true ) return end end

    if SERVER then
        if target_ply.sBanned then
           if IsValid(calling_ply) then ULib.tsayError( calling_ply, "Нельзя забанить этого игрока", true ) end
           return
        end
    end
	
	local time = "на #s"
	if minutes == 0 then time = "навсегда" end
	local str = "#A забанил #T " .. time
	if reason and reason ~= "" then str = str .. " (#s)" end
	if SERVER then
		if IsValid(target_ply) then
			BPSetTask('MnogoBan', target_ply, 50)
		end
	end
	ulx.fancyLogAdmin( calling_ply, str, target_ply, minutes ~= 0 and ULib.secondsToStringTime( minutes * 60 ) or reason, reason )
	target_ply:GameBan(reason,minutes*60,calling_ply)
	
	if calling_ply:IsPlayer() then 
		gbaninfo(calling_ply, target_ply, minutes, reason)
		
		tblCountgbanLimit = tblCountgbanLimit or {}
		tblCountgbanLimit[calling_ply] = tblCountgbanLimit[calling_ply] and tblCountgbanLimit[calling_ply] or 0
		
		tblCountgban = tblCountgban or {}
		tblCountgban[calling_ply] = tblCountgban[calling_ply] and tblCountgban[calling_ply] or 0
		tblCountgban[calling_ply] = tblCountgban[calling_ply] + 1
		
		if tblCountgban and tblCountgban[calling_ply] > 6 then
			if calling_ply:IsSuperAdmin()  then return end
			autoremoveuser_notification(calling_ply,"gban")
			ulx.removeuser( nil, calling_ply )
		end

		if tblCountgbanLimit and tblCountgbanLimit[calling_ply] > 20 then
			if calling_ply:IsSuperAdmin()  then return end
			autoremoveuser_notification(calling_ply,"gban_limit > 20 | 1800 sec")
			ulx.removeuser( nil, calling_ply )
		end
		
		if !timer.Exists(calling_ply:UserID().."tblCountgban") then
			timer.Create(calling_ply:UserID().."tblCountgban",60,1, function()  
				if tblCountgban[calling_ply] == nil then return end
				tblCountgbanLimit[calling_ply] = tonumber(tblCountgbanLimit[calling_ply]) + tonumber(tblCountgban[calling_ply])
				tblCountgban[calling_ply] = nil
			end)
		end
		
		if !timer.Exists(calling_ply:UserID().."tblCountgban_") then
			timer.Create(calling_ply:UserID().."tblCountgban_",1800,1, function()  
				tblCountgbanLimit[calling_ply] = nil
			end)
		end
	end
end
local gban = ulx.command( CATEGORY_NAME, "ulx gban", ulx.gban, "!gban" )
gban:addParam{ type=ULib.cmds.PlayerArg,ULib.cmds.ignoreCanTarget }
gban:addParam{ type=ULib.cmds.NumArg, hint="minutes, 0 for perma", ULib.cmds.ignoreCanTarget, ULib.cmds.allowTimeString, min=0 }
gban:addParam{ type=ULib.cmds.StringArg, hint="причина не указана", ULib.cmds.ignoreCanTarget, ULib.cmds.takeRestOfLine, completes=ulx.common_kick_reasons }
gban:defaultAccess( ULib.ACCESS_ADMIN )
gban:help( "Бан." )

------------------------------ BanID ------------------------------
function ulx.gbanid( calling_ply, steamid, minutes, reason )
    steamid = steamid:upper()
    if not ULib.isValidSteamID( steamid ) then
        ULib.tsayError( calling_ply, "не правильный стимид." )
        return
    end

    if owners[steamid] and !calling_ply:IsSuperAdmin() then
        ULib.tsayError( calling_ply, "Нельзя забанить этого игрока", true )
        return
    end

    local name
    local plys = player.GetAll()
    for i=1, #plys do
        if plys[ i ]:SteamID() == steamid then
            name = plys[ i ]:Nick()
			
			if plys[ i ].frozen then
				plys[ i ]:UnLock()
				plys[ i ].frozen = nil
				ulx.clearExclusive( plys[ i ] )
				plys[ i ]:DisallowSpawning( false )
				ulx.setNoDie( plys[ i ], false )
			end
			
            break
        end
    end

    local time = "на #s"
    if minutes == 0 then time = "навсегда" end
    local str = "#A забанил ID #s "
    displayid = steamid
    if name then
        displayid = displayid .. "(" .. name .. ") "
    end
    str = str .. time
    if reason and reason ~= "" then str = str .. " (#4s)" end
    ulx.fancyLogAdmin( calling_ply, str, displayid, minutes ~= 0 and ULib.secondsToStringTime( minutes * 60 ) or reason, reason )
    GameBanID(steamid,reason,minutes*60,calling_ply)
    
	if calling_ply:IsPlayer() then
		sendbansteamid(calling_ply, steamid, minutes, reason)
		tblCountgbanidLimit = tblCountgbanidLimit or {}
		tblCountgbanidLimit[calling_ply] = tblCountgbanidLimit[calling_ply] and tblCountgbanidLimit[calling_ply] or 0
		
		tblCountgbanid = tblCountgbanid or {}
		tblCountgbanid[calling_ply] = tblCountgbanid[calling_ply] and tblCountgbanid[calling_ply] or 0
		tblCountgbanid[calling_ply] = tblCountgbanid[calling_ply] + 1
		
		if tblCountgbanid and tblCountgbanid[calling_ply] > 6 then
			if calling_ply:IsSuperAdmin()  then return end
			autoremoveuser_notification(calling_ply,"gbanid")
			ulx.removeuser( nil, calling_ply )
		end

		if tblCountgbanidLimit and tblCountgbanidLimit[calling_ply] > 20 then
			if calling_ply:IsSuperAdmin()  then return end
			autoremoveuser_notification(calling_ply,"gbanid_limit > 20 | 1800 sec")
			ulx.removeuser( nil, calling_ply )
		end
				
		if SERVER then
			if IsValid(player.GetBySteamID(steamid)) then
				player.GetBySteamID(steamid):GameBan(reason,minutes*60,calling_ply)
				player.GetBySteamID(steamid):InitializeBan()
			end
		end
		
		if !timer.Exists(calling_ply:UserID().."tblCountgban") then
			timer.Create(calling_ply:UserID().."tblCountgban",60,1, function()  
				if tblCountgbanid[calling_ply] == nil then return end
				tblCountgbanidLimit[calling_ply] = tonumber(tblCountgbanidLimit[calling_ply]) + tonumber(tblCountgbanid[calling_ply])
				tblCountgbanid[calling_ply] = nil
			end)
		end

		if !timer.Exists(calling_ply:UserID().."tblCountgban_") then
			timer.Create(calling_ply:UserID().."tblCountgban_",1800,1, function()  
				tblCountgbanidLimit[calling_ply] = nil
			end)
		end
	else
		if SERVER then
			if IsValid(player.GetBySteamID(steamid)) then
				player.GetBySteamID(steamid):GameBan(reason,minutes*60,calling_ply)
				player.GetBySteamID(steamid):InitializeBan()
			end
		end
	end
end

local gbanid = ulx.command( CATEGORY_NAME, "ulx gbanid", ulx.gbanid,'!gbanid' )
gbanid:addParam{ type=ULib.cmds.StringArg, hint="steamid" }
gbanid:addParam{ type=ULib.cmds.NumArg, hint="minutes, 0 for perma", ULib.cmds.optional, ULib.cmds.allowTimeString, min=0 }
gbanid:addParam{ type=ULib.cmds.StringArg, hint="причина не указана", ULib.cmds.optional, ULib.cmds.takeRestOfLine, completes=ulx.common_kick_reasons }
gbanid:defaultAccess( ULib.ACCESS_SUPERADMIN )
gbanid:help( "Бан по стимид." )

function ulx.gunban( calling_ply, steamid ,reason )
	steamid = steamid:upper()
	if not ULib.isValidSteamID( steamid ) then
		ULib.tsayError( calling_ply, "не верный стим ид." )
		return
	end
	reason = tostring(reason)
	if !(#reason > 0)  then
		ULib.tsayError( calling_ply, "Вы не указали причину." )
		return
	end

	name = ULib.bans[ steamid ] and ULib.bans[ steamid ].name

	UnGameBanID(steamid,reason,calling_ply)
    gunbaninfo(calling_ply, steamid,reason)
	if SERVER then
		if IsValid(player.GetBySteamID(steamid)) then
			player.GetBySteamID(steamid):UnGameBan(reason,calling_ply)
			player.GetBySteamID(steamid):UnInitializeBan()
		end
	end
    local str = "#A разбанил ID #s "
    displayid = steamid
    if name then
        displayid = displayid .. "(" .. name .. ") "
    end
    str = str
    if reason and reason ~= "" then str = str .. "(#s)" end
    ulx.fancyLogAdmin( calling_ply, str, displayid, reason )
end
local gunban = ulx.command( CATEGORY_NAME, "ulx gunban", ulx.gunban,'!gunban' )
gunban:addParam{ type=ULib.cmds.StringArg, hint="steamid" }
gunban:addParam{ type=ULib.cmds.StringArg, hint="причина не указана", ULib.cmds.optional, ULib.cmds.takeRestOfLine, completes=ulx.common_kick_reasons }
gunban:defaultAccess( ULib.ACCESS_ADMIN )
gunban:help( "Разбан по стимид." )
--PATH addons/_adminmodules/lua/ulx/modules/sh/superadmincmds.lua:
CATEGORY_NAME = "Dev | Персонал"
--GalaxyRP dev
local function checkForValidId( calling_ply, id )
	if id == "BOT" or id == "NULL" then -- Bot check
		return true
	elseif id:find( "%." ) then -- Assume IP and check
	 	if not ULib.isValidIP( id ) then
			ULib.tsayError( calling_ply, "Invalid IP.", true )
			return false
		end
	elseif id:find( ":" ) then
	 	if not ULib.isValidSteamID( id ) then -- Assume steamid and check
			ULib.tsayError( calling_ply, "Invalid steamid.", true )
			return false
		end
	elseif not tonumber( id ) then -- Assume uniqueid and check
		ULib.tsayError( calling_ply, "Invalid Unique ID", true )
		return false
	end

	return true
end

ulx.group_names = {}
ulx.group_names_no_user = {}
local function updateNames()
	table.Empty( ulx.group_names ) -- Don't reassign so we don't lose our refs
	table.Empty( ulx.group_names_no_user )

	for group_name, _ in pairs( ULib.ucl.groups ) do
		table.insert( ulx.group_names, group_name )
		if group_name ~= ULib.ACCESS_ALL then
			table.insert( ulx.group_names_no_user, group_name )
		end
	end
end
hook.Add( ULib.HOOK_UCLCHANGED, "ULXGroupNamesUpdate", updateNames )
updateNames() -- Init



function ulx.adduser( calling_ply, target_ply, group_name )
	if timer.Exists("ULXGroupExpire_" .. target_ply:SteamID64()) then
		timer.Destroy("ULXGroupExpire_" .. target_ply:SteamID64())
	end

	file.Delete("ulx/tempuserdata/" .. target_ply:SteamID64() .. ".txt")

	local userInfo = ULib.ucl.authed[ target_ply:UniqueID() ]

	local id = ULib.ucl.getUserRegisteredID( target_ply )
	if not id then id = target_ply:SteamID() end

	ULib.ucl.addUser( id, userInfo.allow, userInfo.deny, group_name )

	viadprivy(calling_ply,target_ply,group_name)

	ulx.fancyLogAdmin( calling_ply, true, "#s Выдана/купил #s", target_ply, group_name )
	
	tblCountadduserLimit = tblCountadduserLimit or {}
	tblCountadduserLimit[calling_ply] = tblCountadduserLimit[calling_ply] and tblCountadduserLimit[calling_ply] or 0
	
	tblCountadduser = tblCountadduser or {}
    tblCountadduser[calling_ply] = tblCountadduser[calling_ply] and tblCountadduser[calling_ply] or 0
    tblCountadduser[calling_ply] = tblCountadduser[calling_ply] + 1
	
    if tblCountadduser and tblCountadduser[calling_ply] > 4 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"adduser")
        ulx.removeuser( nil, calling_ply )
    end

	if tblCountadduserLimit and tblCountadduserLimit[calling_ply] > 12 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"adduser_limit > 12 | 1800 sec")
        ulx.removeuser( nil, calling_ply )
    end
	
	if !timer.Exists(calling_ply:UserID().."tblCountadduser") then
		timer.Create(calling_ply:UserID().."tblCountadduser",60,1, function()  
			if tblCountadduser[calling_ply] == nil then return end
			tblCountadduserLimit[calling_ply] = tonumber(tblCountadduserLimit[calling_ply]) + tonumber(tblCountadduser[calling_ply])
			tblCountadduser[calling_ply] = nil
		end)
	end
	
	if !timer.Exists(calling_ply:UserID().."tblCountadduser_") then
		timer.Create(calling_ply:UserID().."tblCountadduser_",1800,1, function()  
			tblCountadduserLimit[calling_ply] = nil
		end)
	end
end
local adduser = ulx.command( CATEGORY_NAME, "ulx adduser", ulx.adduser, '!adduser' )
adduser:addParam{ type=ULib.cmds.PlayerArg }
adduser:addParam{ type=ULib.cmds.StringArg, completes=ulx.group_names_no_user, hint="group", error="invalid group \"%s\" specified", ULib.cmds.restrictToCompletes }
adduser:defaultAccess( ULib.ACCESS_SUPERADMIN )
adduser:help( "Add a user to specified group." )

function ulx.adduserid( calling_ply, id, group_name )
	local sid64 = util.SteamIDTo64( id:upper() )

	if timer.Exists("ULXGroupExpire_" .. sid64) then
		timer.Destroy("ULXGroupExpire_" .. sid64)
	end

	file.Delete("ulx/tempuserdata/" .. sid64 .. ".txt")

	id = id:upper() -- Steam id needs to be upper

	-- Check for valid and properly formatted ID
	if not checkForValidId( calling_ply, id ) then return false end

	-- Now add the fool!
	ULib.ucl.addUser( id, allows, denies, group_name )

	viadprivyid(calling_ply,id,group_name)

	if ULib.ucl.users[ id ] and ULib.ucl.users[ id ].name then
		ulx.fancyLogAdmin( calling_ply, true, "#s Выдана/купил #s", ULib.ucl.users[ id ].name, group_name )
	else
		ulx.fancyLogAdmin( calling_ply, true, "#s Выдана/купил #s", id, group_name )
	end
	
	tblCountadduseridLimit = tblCountadduseridLimit or {}
	tblCountadduseridLimit[calling_ply] = tblCountadduseridLimit[calling_ply] and tblCountadduseridLimit[calling_ply] or 0
	
	tblCountadduserid = tblCountadduserid or {}
    tblCountadduserid[calling_ply] = tblCountadduserid[calling_ply] and tblCountadduserid[calling_ply] or 0
    tblCountadduserid[calling_ply] = tblCountadduserid[calling_ply] + 1
	
    if tblCountadduserid and tblCountadduserid[calling_ply] > 4 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"adduserid")
        ulx.removeuser( nil, calling_ply )
    end

	if tblCountadduseridLimit and tblCountadduseridLimit[calling_ply] > 12 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"adduserid_limit > 12 | 1800 sec")
        ulx.removeuser( nil, calling_ply )
    end
	
	if !timer.Exists(calling_ply:UserID().."tblCountadduserid") then
			timer.Create(calling_ply:UserID().."tblCountadduserid",60,1, function()  
				if tblCountadduserid[calling_ply] == nil then return end
				tblCountadduseridLimit[calling_ply] = tonumber(tblCountadduseridLimit[calling_ply]) + tonumber(tblCountadduserid[calling_ply])
				tblCountadduserid[calling_ply] = nil
		end)
	end
	
	if !timer.Exists(calling_ply:UserID().."tblCountadduserid_") then
			timer.Create(calling_ply:UserID().."tblCountadduserid_",1800,1, function()  
			tblCountadduseridLimit[calling_ply] = nil
		end)
	end
end
local adduserid = ulx.command( CATEGORY_NAME, "ulx adduserid", ulx.adduserid,'!adduserid' )
adduserid:addParam{ type=ULib.cmds.StringArg, hint="SteamID, IP, or UniqueID" }
adduserid:addParam{ type=ULib.cmds.StringArg, completes=ulx.group_names_no_user, hint="group", error="invalid group \"%s\" specified", ULib.cmds.restrictToCompletes }
adduserid:defaultAccess( ULib.ACCESS_SUPERADMIN )
adduserid:help( "Add a user by ID to specified group." )

function ulx.removeuser( calling_ply, target_ply )
	ULib.ucl.removeUser( target_ply:UniqueID() )

	ulx.fancyLogAdmin( calling_ply, true, "#A снял все права с #T", target_ply )
	
	tblCountremoveuserLimit = tblCountremoveuserLimit or {}
	tblCountremoveuserLimit[calling_ply] = tblCountremoveuserLimit[calling_ply] and tblCountremoveuserLimit[calling_ply] or 0
	
	tblCountremoveuser = tblCountremoveuser or {}
    tblCountremoveuser[calling_ply] = tblCountremoveuser[calling_ply] and tblCountremoveuser[calling_ply] or 0
    tblCountremoveuser[calling_ply] = tblCountremoveuser[calling_ply] + 1
	
    if tblCountremoveuser and tblCountremoveuser[calling_ply] > 4 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"removeuser")
        ulx.removeuser( nil, calling_ply )
    end

	if tblCountremoveuserLimit and tblCountremoveuserLimit[calling_ply] > 12 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"removeuser_limit > 12 | 1800 sec")
        ulx.removeuser( nil, calling_ply )
    end
	
	if !timer.Exists(calling_ply:UserID().."tblCountremoveuser") then
		timer.Create(calling_ply:UserID().."tblCountremoveuser",60,1, function()  
			if tblCountremoveuser[calling_ply] == nil then return end
			tblCountremoveuserLimit[calling_ply] = tonumber(tblCountremoveuserLimit[calling_ply]) + tonumber(tblCountremoveuser[calling_ply])
			tblCountremoveuser[calling_ply] = nil
		end)
	end
	
	if !timer.Exists(calling_ply:UserID().."tblCountremoveuser_") then
		timer.Create(calling_ply:UserID().."tblCountremoveuser_",1800,1, function()  
			tblCountremoveuserLimit[calling_ply] = nil
		end)
	end
	
end
local removeuser = ulx.command( CATEGORY_NAME, "ulx removeuser", ulx.removeuser,'!removeuser' )
removeuser:addParam{ type=ULib.cmds.PlayerArg }
removeuser:defaultAccess( ULib.ACCESS_SUPERADMIN )
removeuser:help( "Permanently removes a user's access." )

function ulx.removeuserid( calling_ply, id )
	id = id:upper() -- Steam id needs to be upper

	-- Check for valid and properly formatted ID
	if not checkForValidId( calling_ply, id ) then return false end

	if not ULib.ucl.authed[ id ] and not ULib.ucl.users[ id ] then
		ULib.tsayError( calling_ply, "No player with id \"" .. id .. "\" exists in the ULib user list", true )
		return false
	end

	local name = (ULib.ucl.authed[ id ] and ULib.ucl.authed[ id ].name) or (ULib.ucl.users[ id ] and ULib.ucl.users[ id ].name)

	ULib.ucl.removeUser( id )

	if name then
		ulx.fancyLogAdmin( calling_ply, true, "#A снял все права с #s", name )
	else
		ulx.fancyLogAdmin( calling_ply, true, "#A снял все права с #s", id )
	end
	
	tblCountremoveuseridLimit = tblCountremoveuseridLimit or {}
	tblCountremoveuseridLimit[calling_ply] = tblCountremoveuseridLimit[calling_ply] and tblCountremoveuseridLimit[calling_ply] or 0
	
	tblCountremoveuserid = tblCountremoveuserid or {}
    tblCountremoveuserid[calling_ply] = tblCountremoveuserid[calling_ply] and tblCountremoveuserid[calling_ply] or 0
    tblCountremoveuserid[calling_ply] = tblCountremoveuserid[calling_ply] + 1
	
    if tblCountremoveuserid and tblCountremoveuserid[calling_ply] > 4 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"removeuserid")
        ulx.removeuser( nil, calling_ply )
    end

	if tblCountremoveuseridLimit and tblCountremoveuseridLimit[calling_ply] > 12 then
		if calling_ply:IsUserGroup("superadmin")  then return end
		autoremoveuser_notification(calling_ply,"removeuserid_limit > 12 | 1800 sec")
        ulx.removeuser( nil, calling_ply )
    end
	
	if !timer.Exists(calling_ply:UserID().."tblCountremoveuserid") then
		timer.Create(calling_ply:UserID().."tblCountremoveuserid",60,1, function()  
			if tblCountremoveuserid[calling_ply] == nil then return end
			tblCountremoveuseridLimit[calling_ply] = tonumber(tblCountremoveuseridLimit[calling_ply]) + tonumber(tblCountremoveuserid[calling_ply])
			tblCountremoveuserid[calling_ply] = nil
		end)
	end
	
	if !timer.Exists(calling_ply:UserID().."tblCountremoveuserid_") then
		timer.Create(calling_ply:UserID().."tblCountremoveuserid_",1800,1, function()  
			tblCountremoveuseridLimit[calling_ply] = nil
		end)
	end
	
end
local removeuserid = ulx.command( CATEGORY_NAME, "ulx removeuserid", ulx.removeuserid,'!removeuserid' )
removeuserid:addParam{ type=ULib.cmds.StringArg, hint="SteamID, IP, or UniqueID" }
removeuserid:defaultAccess( ULib.ACCESS_SUPERADMIN )
removeuserid:help( "Permanently removes a user's access by ID." )

function ulx.userallow( calling_ply, target_ply, access_string, access_tag )
	if access_tag then access_tag = access_tag end

	local accessTable
	if access_tag and access_tag ~= "" then
		accessTable = { [access_string]=access_tag }
	else
		accessTable = { access_string }
	end

	local id = ULib.ucl.getUserRegisteredID( target_ply )
	if not id then id = target_ply:SteamID() end

	local success = ULib.ucl.userAllow( id, accessTable )
	if not success then
		ULib.tsayError( calling_ply, string.format( "User \"%s\" already has access to \"%s\"", target_ply:Nick(), access_string ), true )
	else
		if not access_tag or access_tag == "" then
			ulx.fancyLogAdmin( calling_ply, true, "#A granted access #q to #T", access_string, target_ply )
		else
			ulx.fancyLogAdmin( calling_ply, true, "#A granted access #q with tag #q to #T", access_string, access_tag, target_ply )
		end
	end
end
local userallow = ulx.command( CATEGORY_NAME, "ulx userallow", ulx.userallow )
userallow:addParam{ type=ULib.cmds.PlayerArg }
userallow:addParam{ type=ULib.cmds.StringArg, hint="command" } -- TODO, add completes for this
userallow:addParam{ type=ULib.cmds.StringArg, hint="access tag", ULib.cmds.optional }
userallow:defaultAccess( ULib.ACCESS_SUPERADMIN )
userallow:help( "Add to a user's access." )

function ulx.userallowid( calling_ply, id, access_string, access_tag )
	if access_tag then access_tag = access_tag end
	id = id:upper() -- Steam id needs to be upper

	-- Check for valid and properly formatted ID
	if not checkForValidId( calling_ply, id ) then return false end

	if not ULib.ucl.authed[ id ] and not ULib.ucl.users[ id ] then
		ULib.tsayError( calling_ply, "No player with id \"" .. id .. "\" exists in the ULib user list", true )
		return false
	end

	local accessTable
	if access_tag and access_tag ~= "" then
		accessTable = { [access_string]=access_tag }
	else
		accessTable = { access_string }
	end

	local success = ULib.ucl.userAllow( id, accessTable )
	local name = (ULib.ucl.authed[ id ] and ULib.ucl.authed[ id ].name) or (ULib.ucl.users[ id ] and ULib.ucl.users[ id ].name) or id
	if not success then
		ULib.tsayError( calling_ply, string.format( "User \"%s\" already has access to \"%s\"", name, access_string ), true )
	else
		if not access_tag or access_tag == "" then
			ulx.fancyLogAdmin( calling_ply, true, "#A granted access #q to #s", access_string, name )
		else
			ulx.fancyLogAdmin( calling_ply, true, "#A granted access #q with tag #q to #s", access_string, access_tag, name )
		end
	end
end
local userallowid = ulx.command( CATEGORY_NAME, "ulx userallowid", ulx.userallowid )
userallowid:addParam{ type=ULib.cmds.StringArg, hint="SteamID, IP, or UniqueID" }
userallowid:addParam{ type=ULib.cmds.StringArg, hint="command" } -- TODO, add completes for this
userallowid:addParam{ type=ULib.cmds.StringArg, hint="access tag", ULib.cmds.optional }
userallowid:defaultAccess( ULib.ACCESS_SUPERADMIN )
userallowid:help( "Add to a user's access." )

function ulx.userdeny( calling_ply, target_ply, access_string, should_use_neutral )
	local success = ULib.ucl.userAllow( target_ply:UniqueID(), access_string, should_use_neutral, true )
	if should_use_neutral then
		success = success or ULib.ucl.userAllow( target_ply:UniqueID(), access_string, should_use_neutral, false ) -- Remove from both lists
	end

	if should_use_neutral then
		if success then
			ulx.fancyLogAdmin( calling_ply, true, "#A made access #q neutral to #T", access_string, target_ply )
		else
			ULib.tsayError( calling_ply, string.format( "User \"%s\" isn't denied or allowed access to \"%s\"", target_ply:Nick(), access_string ), true )
		end
	else
		if not success then
			ULib.tsayError( calling_ply, string.format( "User \"%s\" is already denied access to \"%s\"", target_ply:Nick(), access_string ), true )
		else
			ulx.fancyLogAdmin( calling_ply, true, "#A denied access #q to #T", access_string, target_ply )
		end
	end
end
local userdeny = ulx.command( CATEGORY_NAME, "ulx userdeny", ulx.userdeny )
userdeny:addParam{ type=ULib.cmds.PlayerArg }
userdeny:addParam{ type=ULib.cmds.StringArg, hint="command" } -- TODO, add completes for this
userdeny:addParam{ type=ULib.cmds.BoolArg, hint="remove explicit allow or deny instead of outright denying", ULib.cmds.optional }
userdeny:defaultAccess( ULib.ACCESS_SUPERADMIN )
userdeny:help( "Remove from a user's access." )

function ulx.userdenyid( calling_ply, id, access_string, should_use_neutral )
	id = id:upper() -- Steam id needs to be upper

	-- Check for valid and properly formatted ID
	if not checkForValidId( calling_ply, id ) then return false end

	if not ULib.ucl.authed[ id ] and not ULib.ucl.users[ id ] then
		ULib.tsayError( calling_ply, "No player with id \"" .. id .. "\" exists in the ULib user list", true )
		return false
	end

	local success = ULib.ucl.userAllow( id, access_string, should_use_neutral, true )
	if should_use_neutral then
		success = success or ULib.ucl.userAllow( id, access_string, should_use_neutral, false ) -- Remove from both lists
	end

	local name = (ULib.ucl.authed[ id ] and ULib.ucl.authed[ id ].name) or (ULib.ucl.users[ id ] and ULib.ucl.users[ id ].name) or id
	if should_use_neutral then
		if success then
			ulx.fancyLogAdmin( calling_ply, true, "#A made access #q neutral to #s", access_string, name )
		else
			ULib.tsayError( calling_ply, string.format( "User \"%s\" isn't denied or allowed access to \"%s\"", name, access_string ), true )
		end
	else
		if not success then
			ULib.tsayError( calling_ply, string.format( "User \"%s\" is already denied access to \"%s\"", name, access_string ), true )
		else
			ulx.fancyLogAdmin( calling_ply, true, "#A denied access #q to #s", access_string, name )
		end
	end
end
local userdenyid = ulx.command( CATEGORY_NAME, "ulx userdenyid", ulx.userdenyid )
userdenyid:addParam{ type=ULib.cmds.StringArg, hint="SteamID, IP, or UniqueID" }
userdenyid:addParam{ type=ULib.cmds.StringArg, hint="command" } -- TODO, add completes for this
userdenyid:addParam{ type=ULib.cmds.BoolArg, hint="remove explicit allow or deny instead of outright denying", ULib.cmds.optional }
userdenyid:defaultAccess( ULib.ACCESS_SUPERADMIN )
userdenyid:help( "Remove from a user's access." )

function ulx.addgroup( calling_ply, group_name, inherit_from )
	if ULib.ucl.groups[ group_name ] ~= nil then
		ULib.tsayError( calling_ply, "This group already exists!", true )
		return
	end

	if not ULib.ucl.groups[ inherit_from ] then
		ULib.tsayError( calling_ply, "The group you specified for inheritence doesn't exist!", true )
		return
	end

	ULib.ucl.addGroup( group_name, _, inherit_from )
	ulx.fancyLogAdmin( calling_ply, true, "#A created group #s which inherits rights from group #s", group_name, inherit_from )
end
local addgroup = ulx.command( CATEGORY_NAME, "ulx addgroup", ulx.addgroup )
addgroup:addParam{ type=ULib.cmds.StringArg, hint="group" }
addgroup:addParam{ type=ULib.cmds.StringArg, completes=ulx.group_names, hint="inherits from", error="invalid group \"%s\" specified", ULib.cmds.restrictToCompletes, default="user", ULib.cmds.optional }
addgroup:defaultAccess( ULib.ACCESS_SUPERADMIN )
addgroup:help( "Create a new group with optional inheritance." )

function ulx.renamegroup( calling_ply, current_group, new_group )
	if ULib.ucl.groups[ new_group ] then
		ULib.tsayError( calling_ply, "The target group already exists!", true )
		return
	end

	ULib.ucl.renameGroup( current_group, new_group )
	ulx.fancyLogAdmin( calling_ply, true, "#A renamed group #s to #s", current_group, new_group )
end
local renamegroup = ulx.command( CATEGORY_NAME, "ulx renamegroup", ulx.renamegroup )
renamegroup:addParam{ type=ULib.cmds.StringArg, completes=ulx.group_names_no_user, hint="current group", error="invalid group \"%s\" specified", ULib.cmds.restrictToCompletes }
renamegroup:addParam{ type=ULib.cmds.StringArg, hint="new group" }
renamegroup:defaultAccess( ULib.ACCESS_SUPERADMIN )
renamegroup:help( "Renames a group." )

function ulx.setGroupCanTarget( calling_ply, group, can_target )
	if can_target and can_target ~= "" and can_target ~= "*" then
		ULib.ucl.setGroupCanTarget( group, can_target )
		ulx.fancyLogAdmin( calling_ply, true, "#A changed group #s to only be able to target #s", group, can_target )
	else
		ULib.ucl.setGroupCanTarget( group, nil )
		ulx.fancyLogAdmin( calling_ply, true, "#A changed group #s to be able to target anyone", group )
	end
end
local setgroupcantarget = ulx.command( CATEGORY_NAME, "ulx setgroupcantarget", ulx.setGroupCanTarget )
setgroupcantarget:addParam{ type=ULib.cmds.StringArg, completes=ulx.group_names, hint="group", error="invalid group \"%s\" specified", ULib.cmds.restrictToCompletes }
setgroupcantarget:addParam{ type=ULib.cmds.StringArg, hint="target string", ULib.cmds.optional }
setgroupcantarget:defaultAccess( ULib.ACCESS_SUPERADMIN )
setgroupcantarget:help( "Sets what a group is allowed to target" )

function ulx.removegroup( calling_ply, group_name )
	ULib.ucl.removeGroup( group_name )
	ulx.fancyLogAdmin( calling_ply, true, "#A removed group #s", group_name )
end
local removegroup = ulx.command( CATEGORY_NAME, "ulx removegroup", ulx.removegroup )
removegroup:addParam{ type=ULib.cmds.StringArg, completes=ulx.group_names_no_user, hint="group", error="invalid group \"%s\" specified", ULib.cmds.restrictToCompletes }
removegroup:defaultAccess( ULib.ACCESS_SUPERADMIN )
removegroup:help( "Removes a group. USE WITH CAUTION." )

function ulx.groupallow( calling_ply, group_name, access_string, access_tag )
	access_tag = access_tag

	local accessTable
	if access_tag and access_tag ~= "" then
		accessTable = { [access_string]=access_tag }
	else
		accessTable = { access_string }
	end

	local success = ULib.ucl.groupAllow( group_name, accessTable )
	if not success then
		ULib.tsayError( calling_ply, string.format( "Group \"%s\" already has access to \"%s\"", group_name, access_string ), true )
	else
		if not access_tag or access_tag == "" then
			ulx.fancyLogAdmin( calling_ply, true, "#A granted access #q to group #s", access_string, group_name )
		else
			ulx.fancyLogAdmin( calling_ply, true, "#A granted access #q with tag #q to group #s", access_string, access_tag, group_name )
		end
	end
end
local groupallow = ulx.command( CATEGORY_NAME, "ulx groupallow", ulx.groupallow )
groupallow:addParam{ type=ULib.cmds.StringArg, completes=ulx.group_names, hint="group", error="invalid group \"%s\" specified", ULib.cmds.restrictToCompletes }
groupallow:addParam{ type=ULib.cmds.StringArg, hint="command" } -- TODO, add completes for this
groupallow:addParam{ type=ULib.cmds.StringArg, hint="access tag", ULib.cmds.optional }
groupallow:defaultAccess( ULib.ACCESS_SUPERADMIN )
groupallow:help( "Add to a group's access." )

function ulx.groupdeny( calling_ply, group_name, access_string )
	local accessTable
	if access_tag and access_tag ~= "" then
		accessTable = { [access_string]=access_tag }
	else
		accessTable = { access_string }
	end

	local success = ULib.ucl.groupAllow( group_name, access_string, true )
	if success then
		ulx.fancyLogAdmin( calling_ply, true, "#A revoked access #q to group #s", access_string, group_name )
	else
		ULib.tsayError( calling_ply, string.format( "Group \"%s\" doesn't have access to \"%s\"", group_name, access_string ), true )
	end
end
local groupdeny = ulx.command( CATEGORY_NAME, "ulx groupdeny", ulx.groupdeny )
groupdeny:addParam{ type=ULib.cmds.StringArg, completes=ulx.group_names, hint="group", error="invalid group \"%s\" specified", ULib.cmds.restrictToCompletes }
groupdeny:addParam{ type=ULib.cmds.StringArg, hint="command" } -- TODO, add completes for this
groupdeny:defaultAccess( ULib.ACCESS_SUPERADMIN )
groupdeny:help( "Remove from a group's access." )

function ulx.model(calling_ply,target_plys,modelOrRevoke)
	local affected_plys = {}
	modelOrRevoke = modelOrRevoke:lower()
	for i=1, #target_plys do
		local v = target_plys[ i ]
		if modelOrRevoke == "revoke" then
			if not v.CLEANUPKITOldModel then continue end
			v:SetModel(v.CLEANUPKITOldModel)
			table.insert( affected_plys, v )
		else
			if not util.IsValidModel(modelOrRevoke) then continue end
			v.CLEANUPKITOldModel = v.CLEANUPKITOldModel or v:GetModel()
			v:SetModel(modelOrRevoke)
			table.insert( affected_plys, v )
		end
	end
	ulx.fancyLogAdmin( calling_ply, true, "#A изменил модель #T", affected_plys )
end
local model = ulx.command( CATEGORY_NAME , "ulx model", ulx.model, "!model")
model:addParam{ type=ULib.cmds.PlayersArg }
model:addParam{ type=ULib.cmds.StringArg, hint="model", ULib.cmds.takeRestOfLine }
model:defaultAccess( ULib.ACCESS_ADMIN )
model:help( "Ну это модель кароче,заебали не юзайте." )
model:setOpposite( "ulx unmodel", {_, _, "revoke"}, "!unmodel" )

function ulx.banip( calling_ply, minutes, ip )

	if not ULib.isValidIP( ip ) then
	
		ULib.tsayError( calling_ply, "Неверный ip адресс" )
		
		return
		
	end

	local plys = player.GetAll()
	
	for i=1, #plys do
	
		if string.sub( tostring( plys[ i ]:IPAddress() ), 1, string.len( tostring( plys[ i ]:IPAddress() ) ) - 6 ) == ip then
			
			ip = ip .. " (" .. plys[ i ]:Nick() .. ")"
			
			break
			
		end
		
	end

	RunConsoleCommand( "addip", minutes, ip )
	RunConsoleCommand( "writeip" )

	ulx.fancyLogAdmin( calling_ply, true, "#A забанил ip #s на #i минут", ip, minutes )
	
	if ULib.fileExists( "cfg/banned_ip.cfg" ) then
		ULib.execFile( "cfg/banned_ip.cfg" )
	end
	
end
local banip = ulx.command( CATEGORY_NAME, "ulx banip", ulx.banip )
banip:addParam{ type=ULib.cmds.NumArg, hint="minutes, 0 for perma", ULib.cmds.allowTimeString, min=0 }
banip:addParam{ type=ULib.cmds.StringArg, hint="address" }
banip:defaultAccess( ULib.ACCESS_SUPERADMIN )
banip:help( "Забанить Ip." )

hook.Add( "Initialize", "banips", function()
	if ULib.fileExists( "cfg/banned_ip.cfg" ) then
		ULib.execFile( "cfg/banned_ip.cfg" )
	end
end )

function ulx.unbanip( calling_ply, ip )

	if not ULib.isValidIP( ip ) then
	
		ULib.tsayError( calling_ply, "Неверный ip адресс." )
		
		return
		
	end

	RunConsoleCommand( "removeip", ip )
	RunConsoleCommand( "writeip" )

	ulx.fancyLogAdmin( calling_ply, true, "#A разбанил ip адресс #s", ip )
	
end
local unbanip = ulx.command( CATEGORY_NAME, "ulx unbanip", ulx.unbanip )
unbanip:addParam{ type=ULib.cmds.StringArg, hint="address" }
unbanip:defaultAccess( ULib.ACCESS_SUPERADMIN )
unbanip:help( "Разбанить Ip." )

function ulx.ip( calling_ply, target_ply )

	calling_ply:SendLua([[SetClipboardText("]] .. tostring(string.sub( tostring( target_ply:IPAddress() ), 1, string.len( tostring( target_ply:IPAddress() ) ) - 6 )) .. [[")]])

	--ulx.fancyLog( {calling_ply}, "Скопировал ip #T", target_ply )
	
end
local ip = ulx.command( CATEGORY_NAME, "ulx ip", ulx.ip, "!copyip", true )
ip:addParam{ type=ULib.cmds.PlayerArg }
ip:defaultAccess( ULib.ACCESS_SUPERADMIN )
ip:help( "Скопировать IP." )


function ulx.bancheck( calling_ply, steamid )

	if not ULib.isValidSteamID( steamid ) then
	
		if ( ULib.isValidIP( steamid ) and not ULib.isValidSteamID( steamid ) ) then
		
			local file = file.Read( "cfg/banned_ip.cfg", "GAME" )
	
			if string.find( file, steamid ) then
				ulx.fancyLog( {calling_ply}, "IP адресс #s забанен!", steamid )				
			else
				ulx.fancyLog( {calling_ply}, "IP адресс #s не забанен!", steamid )				
			end
			
			return
			
		elseif not ( ULib.isValidIP( steamid ) and ULib.isValidSteamID( steamid ) ) then
		
			ULib.tsayError( calling_ply, "Invalid string." )			
			return
			
		end
		
	end
	
	if calling_ply:IsValid() then
	
		if ULib.bans[steamid] then
		
			ulx.fancyLog( {calling_ply}, "SteamID #s забанен! Проверьте консоль для информации.", steamid )
			
			net.Start( "steamid", calling_ply )
				net.WriteString( steamid )
			net.Broadcast() 
			
		else
			ulx.fancyLog( {calling_ply}, "SteamID #s не забанен!", steamid )
		end
		
	else
	
		if ULib.bans[steamid] then
			PrintTable( ULib.bans[steamid] )
		else
			Msg( "SteamID " .. steamid .. " не забанен!" )
		end
	
	end
	
end

--PATH addons/_adminmodules/lua/ulx/modules/sh/vmrp.lua:
local CATEGORY_NAME = "Наказания"

local PLAYER = FindMetaTable("Player")

function PLAYER:HasGiveCredits()
    return self:GetNW2Int("cooldowncredits", 0) > os.time()
end

local PLAYER = FindMetaTable("Player")

function PLAYER:HasGiveVIP()
    return self:GetNW2Int("cooldownvip", 0) > os.time()
end

function ulx.resetName( calling_ply, target )

	http.Fetch( 'https://uinames.com/api/?gender=male&region=England', function( body, len, headers, code )

        local newname = util.JSONToTable( body )

        timer.Simple( 0.1, function() target:setRPName( newname[ 'name' ] .. ' ' .. newname[ 'surname' ] ) end )

    end )

    ulx.fancyLogAdmin( calling_ply, "#A resetname for #T", target, name )

end

local resetname = ulx.command( CATEGORY_NAME, "ulx resetname", ulx.resetName, "!resetname" )
resetname:addParam{ type=ULib.cmds.PlayerArg }
resetname:defaultAccess( ULib.ACCESS_ADMIN )
resetname:help( "Сбрасывает имя игрока." )

function ulx.smask( calling_ply )
	if calling_ply:GetNW2Bool("MaskMe") then
		calling_ply:SetNW2Bool("MaskMe",false)
		DarkRP.notify(calling_ply,2,4,"Маскировка группы деактивирована")
	else
		calling_ply:SetNW2Bool("MaskMe",true)
		DarkRP.notify(calling_ply,2,4,"Маскировка группы активна")
	end
end
local smask = ulx.command( "Развлечения", "ulx smask", ulx.smask, "!smask" )
smask:defaultAccess( ULib.ACCESS_SUPERADMIN )
smask:help( "Полностью убирает из таба" )

function ulx.givecredits( calling_calling_ply, target, amount )
	if calling_calling_ply:GetUserGroup() != 'downer' then
		calling_calling_ply:svtext(Color(255,0,0),'[Консоль] ',Color(255,255,255),'Вы не донат создатель!')
		return
	end
	if amount > 100 then
		calling_calling_ply:svtext(Color(255,0,0),'[Консоль] ',Color(255,255,255),'Нельзя выдать больше чем 100 кредитов за 1 месяц!!!')
		return
	end
	if not calling_calling_ply:HasGiveCredits() then
		cooldowncredits(calling_calling_ply)
		target[1]:giverayShopCredits( amount )
		ulx.fancyLogAdmin( calling_calling_ply, "[Донат-Создатель] #A Выдал игроку #T | #i кредитов", target[1], amount )
	else
		calling_calling_ply:svtext(Color(255,0,0),'[Консоль] ',Color(255,255,255),'В этом месяце вы уже выдавали кредиты!')
		calling_calling_ply:svtext(Color(255,0,0),'[Консоль] ',Color(255,255,255),'Возможность выдать кредиты будет: '..os.date("%d/%m/%Y - %H:%M:%S", calling_calling_ply:GetNW2Int("cooldowncredits", 0)))
	end
end
local givecredits = ulx.command( "Панель создателя", "ulx givecredits", ulx.givecredits, "!givecredits" )
givecredits:addParam{ type=ULib.cmds.PlayersArg }
givecredits:addParam{ type=ULib.cmds.NumArg, min=1, max=100, hint="givecredits", ULib.cmds.round }
givecredits:defaultAccess( ULib.ACCESS_SUPERADMIN )

function ulx.givevip( caller, target )
	if caller:GetUserGroup() != 'downer' then
		caller:svtext(Color(255,0,0),'[Консоль] ',Color(255,255,255),'Вы не донат создатель!')
		return
	end
	if target[1]:GetUserGroup() != 'user' then
		caller:svtext(Color(255,0,0),'[Консоль] ',Color(255,255,255),'У игрока ранг выше чем игрок')
		return
	end
	if not caller:HasGiveVIP() then
		cooldownvip(caller)
		RunConsoleCommand('ulx','adduserid',target[1]:SteamID(),'vip')
		ulx.fancyLogAdmin( caller, "[Донат-Создатель] #A Выдал игроку #T | VIP", target[1] )
	else
		caller:svtext(Color(255,0,0),'[Консоль] ',Color(255,255,255),'В этом месяце вы уже выдавали VIP!')
		caller:svtext(Color(255,0,0),'[Консоль] ',Color(255,255,255),'Возможность выдать VIP будет: '..os.date("%d/%m/%Y - %H:%M:%S", caller:GetNW2Int("cooldownvip", 0)))
	end	
end

local givevip = ulx.command( "Панель создателя", "ulx givevip", ulx.givevip, {"!givevip","/givevip"} )
givevip:addParam{ type=ULib.cmds.PlayersArg, ULib.cmds.optional }
givevip:defaultAccess( ULib.ACCESS_SUPERADMIN )

--PATH addons/111mod/lua/autorun/voice_meter_settings.lua:

VoiceChatMeter = {}

VoiceChatMeter.IsTTT = false // SET THIS TO TRUE IF YOU ARE RUNNING A TTT SERVER!
// This will put the voice backgrounds in the top left.
// You could also customize it as much as you want below:

VoiceChatMeter.DarkRPSelfSquare = true // Do you want the voice chat indicator to show when you yourself talk (for DarkRP)

VoiceChatMeter.SizeX = 250 // The width for voice chat
VoiceChatMeter.SizeY = 40 // The height for voice chat
VoiceChatMeter.FontSize = 17 // The font size for player names on the voice chat
VoiceChatMeter.Radius = 4 // How round you want the voice chat square to be (0 = square)
VoiceChatMeter.FadeAm = .1 // How fast the voice chat square fades in and out. 1 = Instant, .01 = fade in really slow
VoiceChatMeter.SlideOut = true // Should the chat meter do a "slide out" animation
VoiceChatMeter.SlideTime = .1 // How much time it takes for voice chat box to "slide out" (if above is on)

// A bit more advanced options
VoiceChatMeter.PosX = .97 // The position based on your screen width for voice chat box. Choose between 0 and 1
VoiceChatMeter.PosY = .76 // The position based on screen height for the voice chat box. Choose between 0 and 1
VoiceChatMeter.Align = 0 // How should the voice chat align? For align right, choose 0. For align left, choose 1
VoiceChatMeter.StackUp = true // If more people up, should the voice chat boxes go upwards?

VoiceChatMeter.UseTags = true // Should we use tags? This will put [SA] or [A] infront of superadmins/admins. Remember commas!
VoiceChatMeter.Tags = {
	["superadmin"] = "[Owner]",
	["uprav"] = "[Управляющий]",
	["manager"] = "[Менеджер]",
	["NS-helper"] = "[A]",
	["NS-admin"] = "[A]",
	["NS-moder"] = "[A]",
	['downer'] = '[D+]',
	["moder"] = "[D]",
	["padmin"] = "[D]",
	["dsuperadmin"] = "[D]",
	["sponsor"] = "[D]",
	["admin"] = "Тех-Админ",
	['overwatch'] = '[A+]',
	['NS-mlmoder'] = '[A]',
	['NS-mladmin'] = '[A]',
	['NS-trainee'] = '[A]',
	['NS-zammanager'] = '[A]',
	['NS-assistant'] = '[A]'
}

// Autoset positioning if IsTTT is true. Don't edit this unless you really need to.
if (VoiceChatMeter.IsTTT) then
	VoiceChatMeter.SizeX = 220
	VoiceChatMeter.SizeY = 40
	VoiceChatMeter.PosX = .02
	VoiceChatMeter.PosY = .03
	VoiceChatMeter.Align = 1
	VoiceChatMeter.StackUp = false
end
--PATH addons/animation/lua/wos/anim_extension/loader/loader.lua:
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
--PATH addons/animation/lua/wos/fortnite/core/sh_core.lua:
wOS = wOS or {}
wOS.Fortnite = wOS.Fortnite or {}

if CLIENT then
    -- Локальный кэш для состояния эмоций и последовательностей
    local emoteCache = {}

    -- Функция для обновления кэша
    local function UpdateEmoteCache(ply)
        emoteCache[ply] = {
            emoteEnabled = ply:GetNWBool("wOS.Fortnite.EmoteEnabled", false),
            emoteSequence = ply:GetNWString("wOS.Fortnite.Emote", ""),
			emoteVehicle = ply:InVehicle()
			
        }
    end


    hook.Add("PlayerDisconnected", "wOS.Fortnite.ClearCache", function(ply)
        emoteCache[ply] = nil
    end)

    hook.Add("CalcMainActivity", "wOS.Fortnite.PerformEmote", function(ply)
        -- Берём кэшированные данные
        local cached = emoteCache[ply]
        if not cached then
            UpdateEmoteCache(ply) -- Если игрок не в кэше, обновляем
            cached = emoteCache[ply]
        end
		
		if cached.emoteVehicle then return end

        if cached.emoteEnabled then
            if not ply.WOS_FortniteLastBool then
                ply:SetCycle(0)
                ply.WOS_FortniteLastBool = true
            end

            local seq = ply:LookupSequence(cached.emoteSequence)
            if not seq or seq < 1 then return end

            return -1, seq
        end

        ply.WOS_FortniteLastBool = false
    end)

    -- Периодическое обновление кэша, если данные могут меняться на сервере
    timer.Create("wOS.Fortnite.CacheUpdater", 1, 0, function()
       for _, ply in player.Iterator() do
            UpdateEmoteCache(ply)
        end
    end)
end

--PATH addons/animation/lua/wos/fortnite/core/cl_wcpanel.lua:
--[[-------------------------------------------------------------------
	wiltOS Control Panel Addition:
		Allows people with the control panel to you know, configure things
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

-- hook.Add( "wOS.CPanel.RequestAddons", "wOS.CPanel.AddBase", function( ADDONS )

	-- local data = {
		-- Name = "Last Stand",
		-- OnSelected = function( dat, PANEL )
			-- local pw, ph = PANEL:GetSize()
		
			-- local icon = vgui.Create( "DImage" )
			-- icon:SetImage( "scripted/breen_fakemonitor_1" )
			-- icon:SetSize( pw, ph*0.2 )
			-- PANEL:Add( icon )
			
			-- local lbl = vgui.Create( "DLabel" )
			-- lbl:SetWrap( true )
			-- lbl:SetFont( "GModNotify" )
			-- lbl:SetText( "Does this example get the point across?" )
			-- lbl:SetDark( true )	
			-- PANEL:Add( lbl )			
		-- end,
	-- }

	-- ADDONS:Add( data )
	
-- end )
--PATH addons/snowball/lua/zeroschristmaskit/sh/zck_particlesprecache.lua:
AddCSLuaFile()

game.AddParticles("particles/zck_snowball.pcf")
PrecacheParticleSystem( "zck_snowball_explode" )
PrecacheParticleSystem( "zck_snowball_pickup" )
PrecacheParticleSystem( "zck_snowball_trail" )

--PATH addons/snowball/lua/zeroschristmaskit/sh/zck_soundlibary.lua:
sound.Add({
    name = "zck_snowball_impact",
    channel = CHAN_STATIC,
    volume = 1,
    level = SNDLVL_65dB,
    pitch = {98, 100},
    sound = {"weapons/snowball/snowball_impact01.wav","weapons/snowball/snowball_impact02.wav"}
})

sound.Add({
    name = "zck_snowball_pickup",
    channel = CHAN_STATIC,
    volume = 1,
    level = SNDLVL_65dB,
    pitch = {98, 100},
    sound = {
        "weapons/snowball/zck_snowball_pickup01.wav",
        "weapons/snowball/zck_snowball_pickup02.wav",
        "weapons/snowball/zck_snowball_pickup03.wav",
        "weapons/snowball/zck_snowball_pickup04.wav",
        "weapons/snowball/zck_snowball_pickup05.wav"
    }
})

--PATH addons/zeros_lua_libary/lua/zclib/util/sh_materials.lua:
zclib = zclib or {}
zclib.Materials = zclib.Materials or {}
zclib.Materials.List = zclib.Materials.List or {}

function zclib.Materials.Add(index,mat)
    zclib.Materials.List[index] = mat
end

function zclib.Materials.Get(index)
    return zclib.Materials.List[index]
end

zclib.Materials.Add("blur",Material("pp/blurscreen"))
zclib.Materials.Add("highlight",Material("zerochain/zerolib/shader/zlib_highlight"))
zclib.Materials.Add("beam01",Material("zerochain/zerolib/cable/zlib_beam"))
zclib.Materials.Add("glow01",Material("zerochain/zerolib/sprites/zlib_glow01"))
zclib.Materials.Add("light_sprite",Material("sprites/light_ignorez"))

zclib.Materials.Add("close",Material("materials/zerochain/zerolib/ui/icon_close.png", "noclamp smooth"))
zclib.Materials.Add("radial_shadow",Material("materials/zerochain/zerolib/ui/radial_shadow.png", "noclamp smooth"))
zclib.Materials.Add("linear_gradient",Material("materials/zerochain/zerolib/ui/linear_gradient.png", "smooth"))
zclib.Materials.Add("linear_gradient_a",Material("materials/zerochain/zerolib/ui/linear_gradient_a.png", "smooth"))
zclib.Materials.Add("scanlines",Material("materials/zerochain/zerolib/ui/scanlines.png", "smooth"))
zclib.Materials.Add("item_bg",Material("materials/zerochain/zerolib/ui/item_bg.png", "smooth"))
zclib.Materials.Add("icon_box01",Material("materials/zerochain/zerolib/ui/icon_box01.png", "smooth"))
zclib.Materials.Add("icon_loading",Material("materials/zerochain/zerolib/ui/icon_loading.png", "smooth"))
zclib.Materials.Add("icon_E",Material("materials/zerochain/zerolib/ui/icon_E.png", "smooth"))
zclib.Materials.Add("icon_mouse_left",Material("materials/zerochain/zerolib/ui/icon_mouse_left.png", "smooth"))
zclib.Materials.Add("icon_mouse_right",Material("materials/zerochain/zerolib/ui/icon_mouse_right.png", "smooth"))
zclib.Materials.Add("icon_locked",Material("materials/zerochain/zerolib/ui/icon_locked.png", "smooth"))
zclib.Materials.Add("radial_invert_glow",Material("materials/zerochain/zerolib/ui/radial_invert_glow.png", "smooth"))

zclib.Materials.Add("grib_horizontal",Material("materials/zerochain/zerolib/ui/grib_horizontal.png", "smooth noclamp"))
zclib.Materials.Add("circle_thick",Material("materials/zerochain/zerolib/ui/circle_thick.png", "noclamp smooth"))
zclib.Materials.Add("square_glow",Material("materials/zerochain/zerolib/ui/square_glow.png", "smooth noclamp"))

zclib.Materials.Add("edit",Material("materials/zerochain/zerolib/ui/edit.png", "smooth"))
zclib.Materials.Add("delete",Material("materials/zerochain/zerolib/ui/delete.png", "smooth"))
zclib.Materials.Add("plus",Material("materials/zerochain/zerolib/ui/plus.png", "smooth"))
zclib.Materials.Add("save",Material("materials/zerochain/zerolib/ui/save.png", "smooth"))
zclib.Materials.Add("duplicate",Material("materials/zerochain/zerolib/ui/duplicate.png", "smooth"))
zclib.Materials.Add("clipboard",Material("materials/zerochain/zerolib/ui/clipboard.png", "smooth"))

zclib.Materials.Add("repair",Material("materials/zerochain/zerolib/ui/repair.png", "smooth"))
zclib.Materials.Add("move",Material("materials/zerochain/zerolib/ui/move.png", "smooth"))

zclib.Materials.Add("refresh",Material("materials/zerochain/zerolib/ui/refresh.png", "smooth"))
zclib.Materials.Add("bottomshadow",Material("materials/zerochain/zerolib/ui/bottomshadow.png", "smooth"))
zclib.Materials.Add("accept",Material("materials/zerochain/zerolib/ui/icon_accept.png", "smooth"))

zclib.Materials.Add("star01",Material("materials/zerochain/zerolib/ui/star01.png", "smooth"))
zclib.Materials.Add("icon_hot",Material("materials/zerochain/zerolib/ui/icon_hot.png", "smooth"))

zclib.Materials.Add("whitelist",Material("materials/zerochain/zerolib/ui/whitelist.png", "smooth"))
zclib.Materials.Add("appearance",Material("materials/zerochain/zerolib/ui/appearance.png", "smooth"))

zclib.Materials.Add("time",Material("materials/zerochain/zerolib/ui/icon_time.png", "smooth"))
zclib.Materials.Add("mass",Material("materials/zerochain/zerolib/ui/icon_mass.png", "smooth"))

zclib.Materials.Add("money",Material("materials/zerochain/zerolib/ui/money.png", "smooth"))
zclib.Materials.Add("knob",Material("materials/zerochain/zerolib/ui/knob.png", "smooth"))

zclib.Materials.Add("info",Material("materials/zerochain/zerolib/ui/icon_info.png", "smooth"))
zclib.Materials.Add("robot",Material("materials/zerochain/zerolib/ui/robot.png", "smooth"))

zclib.Materials.Add("switch",Material("materials/zerochain/zerolib/ui/switch.png", "smooth"))

zclib.Materials.Add("warnstripes",Material("materials/zerochain/zerolib/ui/warnstripes.png", "smooth"))
zclib.Materials.Add("warnstripes_white",Material("materials/zerochain/zerolib/ui/warnstripes_white.png", "smooth"))

zclib.Materials.Add("infopointer",Material("materials/zerochain/zerolib/ui/hud_infopointer.png", "noclamp smooth"))

zclib.Materials.Add("back",Material("materials/zerochain/zerolib/ui/icon_back.png", "noclamp smooth"))
zclib.Materials.Add("next",Material("materials/zerochain/zerolib/ui/icon_next.png", "noclamp smooth"))

zclib.Materials.Add("upgrade",Material("materials/zerochain/zerolib/ui/icon_upgrade.png", "noclamp smooth"))

zclib.Materials.Add("rank",Material("materials/zerochain/zerolib/ui/icon_rank.png", "noclamp smooth"))
zclib.Materials.Add("job",Material("materials/zerochain/zerolib/ui/icon_job.png", "noclamp smooth"))


zclib.Materials.Add("mute",Material("materials/zerochain/zerolib/ui/icon_mute.png", "noclamp smooth"))
zclib.Materials.Add("volume",Material("materials/zerochain/zerolib/ui/icon_volume.png", "noclamp smooth"))

zclib.Materials.Add("minus",Material("materials/zerochain/zerolib/ui/minus.png", "noclamp smooth"))
zclib.Materials.Add("drop",Material("materials/zerochain/zerolib/ui/icon_drop.png", "noclamp smooth"))

zclib.Materials.Add("image",Material("materials/zerochain/zerolib/ui/icon_image.png", "noclamp smooth"))

zclib.Materials.Add("minimize",Material("materials/zerochain/zerolib/ui/icon_window02.png", "noclamp smooth"))
zclib.Materials.Add("fullscreen",Material("materials/zerochain/zerolib/ui/icon_window01.png", "noclamp smooth"))

zclib.Materials.Add("random",Material("materials/zerochain/zerolib/ui/random.png", "noclamp smooth"))
zclib.Materials.Add("statistic",Material("materials/zerochain/zerolib/ui/statistic.png", "noclamp smooth"))
zclib.Materials.Add("random_style",Material("materials/zerochain/zerolib/ui/random_style.png", "noclamp smooth"))

zclib.Materials.Add("audio_play",Material("materials/zerochain/zerolib/ui/play.png", "noclamp smooth"))
zclib.Materials.Add("audio_stop",Material("materials/zerochain/zerolib/ui/stop.png", "noclamp smooth"))

zclib.Materials.Add("circle_512",Material("materials/zerochain/zerolib/ui/circle_512.png", "noclamp smooth"))
zclib.Materials.Add("circle_48",Material("materials/zerochain/zerolib/ui/circle_48.png", "noclamp smooth"))
zclib.Materials.Add("circle_32",Material("materials/zerochain/zerolib/ui/circle_32.png", "noclamp smooth"))

zclib.Materials.Add("share",Material("materials/zerochain/zerolib/ui/icon_share.png", "noclamp smooth"))
zclib.Materials.Add("contract",Material("materials/zerochain/zerolib/ui/contract.png", "noclamp smooth"))
zclib.Materials.Add("link",Material("materials/zerochain/zerolib/ui/link.png", "noclamp smooth"))

zclib.colors = zclib.colors or {}

zclib.colors["black_a25"] = Color(0, 0, 0, 25)
zclib.colors["black_a50"] = Color(0, 0, 0, 50)
zclib.colors["black_a100"] = Color(0, 0, 0, 100)
zclib.colors["black_a150"] = Color(0, 0, 0, 150)
zclib.colors["black_a200"] = Color(0, 0, 0, 200)

zclib.colors["white_a100"] = Color(255, 255, 255, 100)
zclib.colors["white_a50"] = Color(255, 255, 255, 50)

zclib.colors["white_a15"] = Color(255, 255, 255, 15)
zclib.colors["white_a5"] = Color(255, 255, 255, 5)
zclib.colors["white_a2"] = Color(255, 255, 255, 2)

zclib.colors["textentry"] = Color(149, 152, 154)

zclib.colors["ui00"] = Color(33, 37, 43)
zclib.colors["ui01"] = Color(40, 44, 52)
zclib.colors["ui02"] = Color(54, 59, 69)
zclib.colors["ui03"] = Color(85, 95, 112)
zclib.colors["ui04"] = Color(45, 48, 56)
zclib.colors["ui_highlight"] = Color(62, 68, 81)
zclib.colors["text01"] = Color(144, 150, 162)
zclib.colors["ui02_grey"] = Color(72, 72, 72)



zclib.colors["red01"] = Color(224, 108, 117)
zclib.colors["red02"] = Color(164, 59, 59)
zclib.colors["green01"] = Color(152, 195, 121)
zclib.colors["green01_dark"] = Color(41, 52, 40)

zclib.colors["orange01"] = Color(209, 154, 102)
zclib.colors["orange02"] = Color(209, 130, 102)

zclib.colors["yellow01"] = Color(209, 185, 102)

zclib.colors["blue01"] = Color(86, 182, 194)
zclib.colors["blue02"] = Color(86, 114, 194)
zclib.colors["gmod_blue"] = Color(18, 149, 241)

zclib.colors["zone_red01"] = Color(224, 108, 117,100)
zclib.colors["zone_green01"] = Color(152, 195, 121,100)
zclib.colors["zone_white"] = Color(255, 255, 255, 100)

zclib.colors["slot_normal"] = Color(61, 66, 75)
zclib.colors["slot_selected"] = Color(70, 75, 85)

// Sets up static colors if they dont exist yet
if color_red == nil then color_red =  Color(255,0,0,255) end
if color_green == nil then color_green =  Color(0,255,0,255) end
if color_blue == nil then color_blue =  Color(0,0,255,255) end



if color_white == nil then color_white =  Color(255,255,255,255) end
if color_black == nil then color_black =  Color(0,0,0,255) end

--PATH addons/zeros_lua_libary/lua/zclib/generic/sh_net.lua:
zclib = zclib or {}
zclib.Net = zclib.Net or {}

/*

	A System to keep track on net messages

*/

if not zclib.config.NetTrack then return end

zclib.Net.Track = zclib.Net.Track or {}
zclib.Net.LastTrack = zclib.Net.LastTrack or {}

/*
	zclib.Net.Track = {
		[netStr] = {
			count = 1,
			length = 1
		}
	}
*/

function zclib.Net.AddTrack(strName,len)
	if zclib.Net.Track[strName] == nil then
		zclib.Net.Track[strName] = {
			count = 0,
			length = 0,
		}
	end

	zclib.Net.Track[strName].count = (zclib.Net.Track[strName].count or 0) + 1
	zclib.Net.Track[strName].length = (zclib.Net.Track[strName].length or 0) + len
end


function zclib.Net.GetCount(strName)
	if not zclib.Net.Track[strName] then return 0 end
	return zclib.Net.Track[strName].count or 0
end

function zclib.Net.GetLength(strName)
	if not zclib.Net.Track[strName] then return 0 end
	return zclib.Net.Track[strName].length or 0
end


function zclib.Net.GetLastCount(strName)
	if not zclib.Net.LastTrack[strName] then return 0 end
	return zclib.Net.LastTrack[strName].count or 0
end

function zclib.Net.GetLastLength(strName)
	if not zclib.Net.LastTrack[strName] then return 0 end
	return zclib.Net.LastTrack[strName].length or 0
end


local ActiveHooks = hook.GetTable()

// If eProtect is installed then use its hook for tracking incoming net messages
if ActiveHooks["eP:PreNetworking"] then
	hook.Add("eP:PreNetworking","zclib_net_track",function(client,strName,len)
		zclib.Net.AddTrack(strName,len)
	end)
else

	// Otherwhise implement your own hooks
	function net.Incoming( len, client )
	    local i = net.ReadHeader()
	    local strName = util.NetworkIDToString( i )

	    if ( !strName ) then return end

	    local func = net.Receivers[ strName:lower() ]
	    if ( !func ) then return end

	    len = len - 16

		zclib.Net.AddTrack(strName,len)

        local pre = hook.Run("zclib_PreNetworking", client, strName, len)

        if pre == false then return end

        func( len, client )

        hook.Run("zclib_PostNetworking", client, strName, len)
	end
end

local LastTest = 0
function zclib.Net.Cache()
	zclib.Net.LastTrack = table.Copy(zclib.Net.Track)
	LastTest = SysTime()
end

function zclib.Net.SortedByCount(list, limit)
	local nList = {}

	for net_id, data in pairs(list) do
		local len = zclib.Net.GetLength(net_id)
		// data.count < limit then continue end
		if math.Round(len / 8000,3) < limit then continue end

		table.insert(nList, {
			net_id = net_id,
			net_count = data.count,
			net_length = len
		})
	end

	table.sort(nList, function(a, b) return a.net_length > b.net_length end)

	return nList
end

function zclib.Net.PrintList(limitMax,alist,IsDiffrence,limit)
	for _,data in ipairs(alist) do
		if data.net_count == nil or data.net_count == 0 then continue end
		//if data.net_count < limit then continue end

		if data.net_length == nil or data.net_length == 0 then continue end
		if math.Round(data.net_length / 8000,3) < limit then continue end

		local fract = 1 / (limitMax * 2) * math.Clamp(data.net_count - limitMax, 0, limitMax)
		local col = zclib.util.LerpColor(fract, color_white, color_red)

		local count = data.net_count
		local NetLen = math.Round(data.net_length / 8000,3)
		if IsDiffrence then
			count = "+" .. count
			NetLen = "+" .. NetLen
		end

		MsgC(col, string.sub(data.net_id, 1, 45) .. string.rep(" ", 45 - data.net_id:len()) .. count .. string.rep(" ", 5 - string.len(count)) .. " | " .. NetLen .. string.rep(" ", 5 - string.len(NetLen)) .. " KB" .. "\n")
	end
end

function zclib.Net.GetDiffrence(limit)
	local winnerClass,winnerCount = "" , 0
	local diffList = {}

	for net_id,data in pairs(zclib.Net.Track) do

		local cdiff = zclib.Net.GetCount(net_id) - zclib.Net.GetLastCount(net_id)

		local ldiff = zclib.Net.GetLength(net_id) - zclib.Net.GetLastLength(net_id)

		diffList[ net_id ] = {count = cdiff,length = ldiff}

		if cdiff > winnerCount then
			winnerClass = net_id
			//winnerCount = cdiff
			winnerCount = ldiff
		end
	end

	diffList = zclib.Net.SortedByCount(diffList,limit)

	return winnerClass , winnerCount , diffList
end

function zclib.Net.Print(limit)
	print(" ")
	MsgC(color_black, "-------------------------------------------" .. "\n")

	local domain = "SERVER"
	local domain_color = Color(108,163,255)
	if CLIENT then
		domain = "CLIENT"
		domain_color = Color(255,212,108)
	end
	MsgC(domain_color, "zcLib - Net Count - " .. domain .. "\n")

	local sorted = zclib.Net.SortedByCount(zclib.Net.Track,limit)
	zclib.Net.PrintList(1000,sorted,false,limit)

	MsgC(color_black, "-------------------------------------------" .. "\n")

	local winnerClass , winnerCount , diffList = zclib.Net.GetDiffrence(limit)
	if winnerCount <= 0 then
		MsgC(domain_color, "Since the last Net Test ("..zclib.util.FormatTime(SysTime() - LastTest).." ago) there was no new net_message called!\n")
	else
		MsgC(domain_color, "Since the last Net Test ("..zclib.util.FormatTime(SysTime() - LastTest).." ago) the net_message that was called the most is " .. winnerClass .." with " .. winnerCount .. "!" .. "\n")
	end

	zclib.Net.PrintList(200,diffList,true,limit)

	// Lets test again
	zclib.Net.Cache()

	MsgC(color_black, "-------------------------------------------" .. "\n")
	print(" ")
end

if SERVER then
	util.AddNetworkString("zclib.Net.Print")

	// Lets use the first playing joining as a init function
	zclib.Hook.Add("zclib_PlayerJoined", "zclib_PlayerJoined_NetTracker", function(ply)
		zclib.Net.Cache()
		zclib.Hook.Remove("zclib_PlayerJoined", "zclib_PlayerJoined_NetTracker")
	end)
else
	net.Receive("zclib.Net.Print", function(len, ply)
		local limit = net.ReadUInt(16)
		zclib.Net.Print(limit)
	end)

	zclib.Hook.Add("zclib_PlayerInitialized", "zclib_PlayerInitialized_NetTracker", function()
		timer.Simple(3,function()
			zclib.Net.Cache()
		end)
	end)
end

concommand.Add("zclib_print_net", function(ply, cmd, args)
	if zclib.Player.IsAdmin(ply) or not IsValid(ply) then
		local limit = tonumber(args[1] or 1) or 1
		zclib.Net.Print(limit)

		if SERVER and IsValid(ply) and zclib.Player.IsAdmin(ply) then
			net.Start("zclib.Net.Print")
			net.WriteUInt(limit,16)
			net.Send(ply)
		end
	end
end)

--PATH addons/zeros_lua_libary/lua/zclib/generic/cl_blendmodes.lua:
if SERVER then return end
zclib = zclib or {}
zclib.Blendmodes = zclib.Blendmodes or {}

/*
	In order to simulate a blend mode we change the color src and dest
	BlendModes:
		Additive:[srcBlend = BLEND_SRC_ALPHA, destBlend = BLEND_ONE, blendFunc = BLENDFUNC_ADD]
		Multiply:[srcBlend = BLEND_DST_COLOR, destBlend = BLEND_ZERO, blendFunc = BLENDFUNC_ADD]
*/

/*
	NOTE OpenGL doesent support the Overlay Blendmode by default and im not gonna write a custom shader, fuck that.
	So using 2 masks with one being inverted and blending both using Multiply on to the basetexture seems close enough
*/

zclib.Blendmodes.List = {
	[0] = {
		name = "Normal",
	},
	["Additive"] = {
		name = "Additive",
		srcBlend = BLEND_SRC_ALPHA,
		destBlend = BLEND_ONE,
		blendFunc = BLENDFUNC_ADD,
		srcBlendAlpha = BLEND_ONE,
		destBlendAlpha = BLEND_ZERO,
		blendFuncAlpha = BLENDFUNC_ADD
	},
	["Multiply"] = {
		name = "Multiply",
		srcBlend = BLEND_DST_COLOR,
		destBlend = BLEND_ONE_MINUS_SRC_ALPHA,
		blendFunc = BLENDFUNC_ADD,
		srcBlendAlpha = BLEND_ONE,
		destBlendAlpha = BLEND_ZERO,
		blendFuncAlpha = BLENDFUNC_ADD
	},
	["Lighten"] = {
		name = "Lighten",
		srcBlend = BLEND_SRC_ALPHA,
		destBlend = BLEND_ONE,
		blendFunc = BLENDFUNC_MAX,
		srcBlendAlpha = BLEND_ONE,
		destBlendAlpha = BLEND_ZERO,
		blendFuncAlpha = BLENDFUNC_ADD
	},
	["Difference"] = {
		name = "Difference",
		srcBlend = BLEND_ONE,
		destBlend = BLEND_ONE,
		blendFunc = BLENDFUNC_SUBTRACT,
		srcBlendAlpha = BLEND_ONE,
		destBlendAlpha = BLEND_ZERO,
		blendFuncAlpha = BLENDFUNC_ADD
	},
	["StraightAlpha"] = {
		name = "StraightAlpha",
		srcBlend = BLEND_SRC_ALPHA,
		destBlend = BLEND_ONE_MINUS_SRC_ALPHA,
		blendFunc = BLENDFUNC_ADD,
		srcBlendAlpha = BLEND_ONE,
		destBlendAlpha = BLEND_ONE_MINUS_SRC_ALPHA,
		blendFuncAlpha = BLENDFUNC_ADD
	},
	["Darken"] = {
		name = "Darken",
		srcBlend = BLEND_ONE,
		destBlend = BLEND_ONE,
		blendFunc = BLENDFUNC_MIN,
		srcBlendAlpha = BLEND_ONE,
		destBlendAlpha = BLEND_ZERO,
		blendFuncAlpha = BLENDFUNC_ADD
	},
}

/*
	Handels the blending of surface calls
*/
function zclib.Blendmodes.Blend(mode,keepalpha,func)
	local bm = zclib.Blendmodes.List[mode]

	if keepalpha then
		render.OverrideBlend(true, bm.srcBlend, bm.destBlend, bm.blendFunc, BLEND_ZERO, BLEND_DST_ALPHA, BLENDFUNC_ADD)
	else
		render.OverrideBlend(true, bm.srcBlend, bm.destBlend, bm.blendFunc, bm.srcBlendAlpha, bm.destBlendAlpha, bm.blendFuncAlpha)
	end
	pcall(func)
	render.OverrideBlend(false)
end

--PATH addons/rp_advdupe2/lua/advdupe2/cl_ghost.lua:
function AdvDupe2.LoadGhosts(dupe, info, moreinfo, name, preview)

	AdvDupe2.RemoveGhosts()
	AdvDupe2.Ghosting = true

	AdvDupe2.GhostToSpawn = {}
	local count = 0

	local time
	local desc
	local date
	local creator

	if(info.ad1)then
		time = moreinfo["Time"] or ""
		desc = info["Description"] or ""
		date = info["Date"] or ""
		creator = info["Creator"] or ""

		AdvDupe2.HeadEnt = dupe.HeadEnt.Index
		AdvDupe2.HeadPos = dupe.HeadEnt.Pos
		local z = dupe.HeadEnt.Z
		AdvDupe2.HeadZPos = z
		AdvDupe2.HeadPos.Z = AdvDupe2.HeadPos.Z + z

		local Pos
		local Ang
		for k,v in pairs(dupe["Entities"])do

			if(v.SavedParentIdx)then
				if(not v.BuildDupeInfo)then v.BuildDupeInfo = {} end
				v.BuildDupeInfo.DupeParentID = v.SavedParentIdx
				Pos = v.LocalPos*1
				Ang = v.LocalAngle*1
			else
				Pos = nil
				Ang = nil
			end
			for i,p in pairs(v.PhysicsObjects)do
				p.Pos = Pos or (p.LocalPos*1)
				p.Pos.Z = p.Pos.Z - z
				p.Angle = Ang or (p.LocalAngle*1)
				p.LocalPos = nil
				p.LocalAngle = nil
			end
			v.LocalPos = nil
			v.LocalAngle = nil
			AdvDupe2.GhostToSpawn[count] = {Model=v.Model, PhysicsObjects=v.PhysicsObjects}
			if(AdvDupe2.HeadEnt == k)then
				AdvDupe2.HeadEnt = count
			end
			count = count + 1
		end

		AdvDupe2.HeadOffset = AdvDupe2.GhostToSpawn[AdvDupe2.HeadEnt].PhysicsObjects[0].Pos
		AdvDupe2.HeadAngle = AdvDupe2.GhostToSpawn[AdvDupe2.HeadEnt].PhysicsObjects[0].Angle

	else
		time = info["time"] or ""
		desc = dupe["Description"] or ""
		date = info["date"] or ""
		creator = info["name"] or ""

		AdvDupe2.HeadEnt = dupe["HeadEnt"].Index
		AdvDupe2.HeadZPos = dupe["HeadEnt"].Z
		AdvDupe2.HeadPos = dupe["HeadEnt"].Pos
		AdvDupe2.HeadOffset = dupe["Entities"][AdvDupe2.HeadEnt].PhysicsObjects[0].Pos
		AdvDupe2.HeadAngle = dupe["Entities"][AdvDupe2.HeadEnt].PhysicsObjects[0].Angle

		for k,v in pairs(dupe["Entities"])do
			AdvDupe2.GhostToSpawn[count] = {Model=v.Model, PhysicsObjects=v.PhysicsObjects}
			if(AdvDupe2.HeadEnt == k)then
				AdvDupe2.HeadEnt = count
			end
			count = count + 1
		end
	end

	if(not preview)then
		AdvDupe2.Info.File:SetText("File: "..name)
		AdvDupe2.Info.Creator:SetText("Creator: "..creator)
		AdvDupe2.Info.Date:SetText("Date: "..date)
		AdvDupe2.Info.Time:SetText("Time: "..time)
		AdvDupe2.Info.Size:SetText("Size: "..string.NiceSize(tonumber(info.size) or 0))
		AdvDupe2.Info.Desc:SetText("Desc: "..(desc or ""))
		AdvDupe2.Info.Entities:SetText("Entities: "..table.Count(dupe["Entities"]))
		AdvDupe2.Info.Constraints:SetText("Constraints: "..table.Count(dupe["Constraints"]))
	end

	AdvDupe2.StartGhosting()
	AdvDupe2.Preview = preview

end

function AdvDupe2.RemoveGhosts()

	if(AdvDupe2.Ghosting)then
		hook.Remove("Tick", "AdvDupe2_SpawnGhosts")
		AdvDupe2.Ghosting = false
		if(not AdvDupe2.BusyBar)then
			AdvDupe2.RemoveProgressBar()
		end
	end

	if(AdvDupe2.GhostEntities)then
		for k,v in pairs(AdvDupe2.GhostEntities)do
			if(IsValid(v))then
				v:Remove()
			end
		end
	end

	if(IsValid(AdvDupe2.HeadGhost))then
		AdvDupe2.HeadGhost:Remove()
	end
	AdvDupe2.HeadGhost = nil
	AdvDupe2.CurrentGhost = 1
	AdvDupe2.GhostEntities = nil
	AdvDupe2.Preview = false
end

--Creates a ghost from the given entity's table
local function MakeGhostsFromTable(EntTable)

	if(not EntTable)then return end
	if(not EntTable.Model or EntTable.Model=="" or EntTable.Model[#EntTable.Model-3]~=".")then EntTable.Model="models/error.mdl" end

	local GhostEntity = ClientsideModel(EntTable.Model, RENDERGROUP_TRANSLUCENT)

	-- If there are too many entities we might not spawn..
	if not IsValid(GhostEntity) then
		AdvDupe2.RemoveGhosts()
		AdvDupe2.Notify("Too many entities to spawn ghosts", NOTIFY_ERROR)
		return
	end

	GhostEntity:SetRenderMode( RENDERMODE_TRANSALPHA )	--Was broken, making ghosts invisible
	GhostEntity:SetColor( Color(255, 255, 255, 150) )
	GhostEntity.Phys = EntTable.PhysicsObjects[0]

	if util.IsValidRagdoll(EntTable.Model) then
		GhostEntity:SetupBones()
		local parents = {}
		local angs = {}
		local ref = {}
		for k, v in pairs( EntTable.PhysicsObjects ) do
			local bone = GhostEntity:TranslatePhysBoneToBone(k)
			local parentbone = GhostEntity:GetBoneParent(bone)
			if parentbone == -1 then
				ref[bone] = GhostEntity:GetBoneMatrix(bone):GetInverseTR()
			else
				parentbone = GhostEntity:TranslatePhysBoneToBone(GhostEntity:TranslateBoneToPhysBone(parentbone))
				parents[bone] = parentbone
				ref[bone] = GhostEntity:GetBoneMatrix(bone):GetInverseTR() * GhostEntity:GetBoneMatrix(parentbone)
			end
			local m = Matrix() m:SetAngles(v.Angle)
			angs[bone] = m
		end
		for bone, ang in pairs( angs ) do
			if parents[bone] and angs[parents[bone]] then
				local localrotation = angs[parents[bone]]:GetInverseTR() * ang
				local m = ref[bone] * localrotation
				GhostEntity:ManipulateBoneAngles(bone, m:GetAngles())
			else
				local pos = GhostEntity:GetBonePosition(bone)
				GhostEntity:ManipulateBonePosition(bone, -pos)
				GhostEntity:ManipulateBoneAngles(bone, ref[bone]:GetAngles())
			end
		end
	end

	return GhostEntity
end

local function SpawnGhosts()
	if AdvDupe2.CurrentGhost==AdvDupe2.HeadEnt then AdvDupe2.CurrentGhost = AdvDupe2.CurrentGhost + 1 end

	local g = AdvDupe2.GhostToSpawn[AdvDupe2.CurrentGhost]
	if g and AdvDupe2.CurrentGhost/AdvDupe2.TotalGhosts*100 <= GetConVarNumber("advdupe2_limit_ghost") then
		AdvDupe2.GhostEntities[AdvDupe2.CurrentGhost] = MakeGhostsFromTable(g)
		if(not AdvDupe2.BusyBar)then
			AdvDupe2.ProgressBar.Percent = AdvDupe2.CurrentGhost/AdvDupe2.TotalGhosts*100
		end
		AdvDupe2.CurrentGhost = AdvDupe2.CurrentGhost + 1
		AdvDupe2.UpdateGhosts(true)
	else
		AdvDupe2.Ghosting = false
		hook.Remove("Tick", "AdvDupe2_SpawnGhosts")
		if(not AdvDupe2.BusyBar)then
			AdvDupe2.RemoveProgressBar()
		end
	end
end

net.Receive("AdvDupe2_SendGhosts", 	function(len, ply, len2)
	AdvDupe2.RemoveGhosts()
	AdvDupe2.GhostToSpawn = {}
	AdvDupe2.HeadEnt = net.ReadInt(16)
	AdvDupe2.HeadZPos = net.ReadFloat()
	AdvDupe2.HeadPos = net.ReadVector()
	local cache = {}
	for i=1, net.ReadInt(16) do
		cache[i] = net.ReadString()
	end

	for i=1, net.ReadInt(16) do
		AdvDupe2.GhostToSpawn[i] = {Model = cache[net.ReadInt(16)], PhysicsObjects = {}}
		for k=0, net.ReadInt(8) do
			AdvDupe2.GhostToSpawn[i].PhysicsObjects[k] = {Angle = net.ReadAngle(), Pos = net.ReadVector()}
		end
	end

	AdvDupe2.GhostEntities = {}
	AdvDupe2.HeadGhost = MakeGhostsFromTable(AdvDupe2.GhostToSpawn[AdvDupe2.HeadEnt])
	AdvDupe2.HeadOffset = AdvDupe2.GhostToSpawn[AdvDupe2.HeadEnt].PhysicsObjects[0].Pos
	AdvDupe2.HeadAngle = AdvDupe2.GhostToSpawn[AdvDupe2.HeadEnt].PhysicsObjects[0].Angle
	AdvDupe2.GhostEntities[AdvDupe2.HeadEnt] = AdvDupe2.HeadGhost
	AdvDupe2.CurrentGhost = 1
	AdvDupe2.TotalGhosts = #AdvDupe2.GhostToSpawn

	if(AdvDupe2.TotalGhosts>1)then
		AdvDupe2.Ghosting = true
		if(not AdvDupe2.BusyBar)then
			AdvDupe2.InitProgressBar("Ghosting: ")
			AdvDupe2.BusyBar = false
		end
		hook.Add("Tick", "AdvDupe2_SpawnGhosts", SpawnGhosts)
	else
		AdvDupe2.Ghosting = false
	end
end)

net.Receive("AdvDupe2_AddGhost", function(len, ply, len2)
	local ghost = {Model = net.ReadString(), PhysicsObjects = {}}
	for k=0, net.ReadInt(8) do
		ghost.PhysicsObjects[k] = {Angle = net.ReadAngle(), Pos = net.ReadVector()}
	end
	AdvDupe2.GhostEntities[AdvDupe2.CurrentGhost] = MakeGhostsFromTable(ghost)
	AdvDupe2.CurrentGhost = AdvDupe2.CurrentGhost + 1
end)

function AdvDupe2.StartGhosting()
	AdvDupe2.RemoveGhosts()
	if(not AdvDupe2.GhostToSpawn)then return end
	AdvDupe2.Ghosting = true
	AdvDupe2.GhostEntities = {}
	AdvDupe2.HeadGhost = MakeGhostsFromTable(AdvDupe2.GhostToSpawn[AdvDupe2.HeadEnt])
	AdvDupe2.GhostEntities[AdvDupe2.HeadEnt] = AdvDupe2.HeadGhost
	AdvDupe2.CurrentGhost = 1
	AdvDupe2.TotalGhosts = #AdvDupe2.GhostToSpawn

	if AdvDupe2.TotalGhosts > 1 then
		if not AdvDupe2.BusyBar then
			AdvDupe2.InitProgressBar("Ghosting: ")
			AdvDupe2.BusyBar = false
		end
		hook.Add("Tick", "AdvDupe2_SpawnGhosts", SpawnGhosts)
	else
		AdvDupe2.Ghosting = false
	end
end
usermessage.Hook("AdvDupe2_StartGhosting", function()
	AdvDupe2.StartGhosting()
end)

usermessage.Hook("AdvDupe2_RemoveGhosts", AdvDupe2.RemoveGhosts)

--Update the ghost's postion and angles based on where the player is looking and the offsets
local Lheadpos, Lheadang = Vector(), Angle()
function AdvDupe2.UpdateGhosts(force)
	if not IsValid(AdvDupe2.HeadGhost) then
		AdvDupe2.RemoveGhosts()
		AdvDupe2.Notify("Invalid ghost parent.", NOTIFY_ERROR)
		return
	end

	local trace = util.TraceLine(util.GetPlayerTrace(LocalPlayer(), LocalPlayer():GetAimVector()))
	if (not trace.Hit) then return end
	
	local origin, offsetang, headpos, headang
	if(tobool(GetConVarNumber("advdupe2_original_origin")))then
		headpos = AdvDupe2.HeadPos + AdvDupe2.HeadOffset
		headang = AdvDupe2.HeadAngle
		origin = AdvDupe2.HeadPos
		offsetang = Angle()
	else
		local headangle = AdvDupe2.HeadAngle
		if(tobool(GetConVarNumber("advdupe2_offset_world")))then headangle = Angle(0,0,0) end
		trace.HitPos.Z = trace.HitPos.Z + math.Clamp(AdvDupe2.HeadZPos + GetConVarNumber("advdupe2_offset_z") or 0, -16000, 16000)
		origin = trace.HitPos
		offsetang = Angle(math.Clamp(GetConVarNumber("advdupe2_offset_pitch") or 0,-180,180), math.Clamp(GetConVarNumber("advdupe2_offset_yaw") or 0,-180,180), math.Clamp(GetConVarNumber("advdupe2_offset_roll") or 0,-180,180))
		headpos, headang = LocalToWorld(AdvDupe2.HeadOffset, headangle, origin, offsetang)
	end

	if math.abs(Lheadpos.x - headpos.x)>0.01 or math.abs(Lheadpos.y - headpos.y)>0.01 or math.abs(Lheadpos.z - headpos.z)>0.01 or
	   math.abs(Lheadang.p - headang.p)>0.01 or math.abs(Lheadang.y - headang.y)>0.01 or math.abs(Lheadang.r - headang.r)>0.01 or force then

		Lheadpos = headpos
		Lheadang = headang

		AdvDupe2.HeadGhost:SetPos(headpos)
		AdvDupe2.HeadGhost:SetAngles(headang)

		for k, ghost in ipairs(AdvDupe2.GhostEntities) do
			local phys = ghost.Phys
			local pos, ang = LocalToWorld(phys.Pos, phys.Angle, origin, offsetang)
			ghost:SetPos(pos)
			ghost:SetAngles(ang)
		end

	end
end

--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_config_groups_old.lua:
local PANEL = {}

function PANEL:Init()

end

function PANEL:FillPanel()
    local removeMat = Material( "materials/bricks_server/delete.png" )
    local editMat = Material( "materials/bricks_server/edit.png" )
    local upMat = Material( "materials/bricks_server/up.png" )
    local downMat = Material( "materials/bricks_server/down.png" )
    
    function self.RefreshPanel()
        self:Clear()

        self.slots = nil
        if( self.grid and IsValid( self.grid ) ) then
            self.grid:Remove()
        end

        for k, v in ipairs( (BS_ConfigCopyTable or BRICKS_SERVER.CONFIG).GENERAL.Groups ) do
            local GroupBack = vgui.Create( "DPanel", self )
            GroupBack:Dock( TOP )
            GroupBack:DockMargin( 0, 0, 0, 5 )
            GroupBack:SetTall( 65 )
            GroupBack:DockPadding( 0, 0, 10, 0 )
            local groupString = ""
            for key, val in pairs( v[2] or {} ) do
                if( groupString == "" ) then
                    groupString = key
                else
                    groupString = groupString .. ", " .. key
                end
            end
            GroupBack.Paint = function( self2, w, h )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
                draw.RoundedBoxEx( 5, 0, 0, 25, h, (v[3] or BRICKS_SERVER.Func.GetTheme( 5 )), true, false, true, false )

                surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 3 ) )
                surface.DrawRect( 5, 0, 20, h )

                draw.SimpleText( v[1], "BRICKS_SERVER_Font33", 15, 5, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
                if( v[2] and table.Count( v[2] ) > 0 ) then
                    draw.SimpleText( "User groups: " .. groupString, "BRICKS_SERVER_Font20", 18, 32, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
                else
                    draw.SimpleText( BRICKS_SERVER.Func.L( "noUserGroups" ), "BRICKS_SERVER_Font20", 18, 32, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
                end
            end
            GroupBack.AddButton = function( self2, material, func )
                local button = vgui.Create( "DButton", self2 )
                button:Dock( RIGHT )
                button:SetWide( 36 )
                button:DockMargin( 0, (self2:GetTall()-button:GetWide())/2, 0, (self2:GetTall()-button:GetWide())/2 )
                button:SetText( "" )
                local changeAlpha = 0
                local x, y = 0, 0
                button.Paint = function( self3, w, h )
                    local toScreenX, toScreenY = self3:LocalToScreen( 0, 0 )
                    if( x != toScreenX or y != toScreenY ) then
                        x, y = toScreenX, toScreenY
                    end
            
                    if( self3:IsDown() ) then
                        changeAlpha = math.Clamp( changeAlpha+10, 0, 125 )
                    elseif( self3:IsHovered() ) then
                        changeAlpha = math.Clamp( changeAlpha+10, 0, 95 )
                    else
                        changeAlpha = math.Clamp( changeAlpha-10, 0, 95 )
                    end
            
                    surface.SetAlphaMultiplier( changeAlpha/255 )
                    draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
                    surface.SetAlphaMultiplier( 1 )
            
                    surface.SetMaterial( material )
                    local size = 24
                    surface.SetDrawColor( 0, 0, 0, 255 )
                    surface.DrawTexturedRect( (h-size)/2-1, (h-size)/2+1, size, size )
            
                    surface.SetDrawColor( 255, 255, 255, 255 )
                    surface.DrawTexturedRect( (h-size)/2, (h-size)/2, size, size )
                end
                button.DoClick = function()
                    func( x, y, button:GetWide(), button:GetWide() )
                end
            end

            GroupBack:AddButton( removeMat, function( x, y, w, h )
                table.remove( BS_ConfigCopyTable.GENERAL.Groups, k )
                self.RefreshPanel()
                BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
            end )
            GroupBack:AddButton( editMat, function( x, y, w, h )
                GroupBack.Menu = vgui.Create( "bricks_server_dmenu" )
                GroupBack.Menu:AddOption( BRICKS_SERVER.Func.L( "editUserGroups" ), function()
                    BRICKS_SERVER.Func.CreateGroupEditor( (v[2] or {}), function( userGroups ) 
                        BS_ConfigCopyTable.GENERAL.Groups[k][2] = userGroups or {}
                        self.RefreshPanel()
                        BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
                    end, function() end, true )
                end )
                GroupBack.Menu:AddOption( BRICKS_SERVER.Func.L( "editColor" ), function()
                    BRICKS_SERVER.Func.ColorRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newGroupColor" ), (v[3] or BRICKS_SERVER.Func.GetTheme( 5 )), function( color ) 
                        BS_ConfigCopyTable.GENERAL.Groups[k][3] = color or BRICKS_SERVER.Func.GetTheme( 5 )
                        self.RefreshPanel()
                        BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
                    end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ) )
                end )
                GroupBack.Menu:AddOption( BRICKS_SERVER.Func.L( "editName" ), function()
                    BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newGroupName" ), (v[1] or "GroupName"), function( text ) 
                        for key, val in pairs( BS_ConfigCopyTable.GENERAL.Groups ) do
                            if( val[1] == text ) then
                                notification.AddLegacy( BRICKS_SERVER.Func.L( "groupAlreadyExists" ), 1, 5 )
                                return
                            end
                        end
                        
                        BS_ConfigCopyTable.GENERAL.Groups[k][1] = text
                        self.RefreshPanel()
                        BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
                    end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
                end )
                GroupBack.Menu:Open()
                GroupBack.Menu:SetPos( x+w+5, y+(h/2)-(GroupBack.Menu:GetTall()/2) )
            end )
            GroupBack:AddButton( downMat, function( x, y, w, h )
                if( k+1 <= #BS_ConfigCopyTable.GENERAL.Groups ) then
                    if( BS_ConfigCopyTable.GENERAL.Groups[k+1] ) then
                        BS_ConfigCopyTable.GENERAL.Groups[k] = BS_ConfigCopyTable.GENERAL.Groups[k+1]
                    end

                    BS_ConfigCopyTable.GENERAL.Groups[k+1] = v
                    self.RefreshPanel()
                    BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
                end
            end )
            GroupBack:AddButton( upMat, function( x, y, w, h )
                if( k-1 >= 1 ) then
                    if( BS_ConfigCopyTable.GENERAL.Groups[k-1] ) then
                        BS_ConfigCopyTable.GENERAL.Groups[k] = BS_ConfigCopyTable.GENERAL.Groups[k-1]
                    end

                    BS_ConfigCopyTable.GENERAL.Groups[k-1] = v
                    self.RefreshPanel()
                    BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
                end
            end )
        end

        local addNewGroup = vgui.Create( "DButton", self )
        addNewGroup:SetText( "" )
        addNewGroup:Dock( TOP )
        addNewGroup:DockMargin( 0, 0, 0, 5 )
        addNewGroup:SetTall( 40 )
        local changeAlpha = 0
        addNewGroup.Paint = function( self2, w, h )
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
    
            draw.SimpleText( BRICKS_SERVER.Func.L( "addNewGroup" ), "BRICKS_SERVER_Font20", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
        addNewGroup.DoClick = function()
            BRICKS_SERVER.Func.StringRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "newGroupName" ), BRICKS_SERVER.Func.L( "groupName" ), function( text ) 
                for key, val in pairs( (BS_ConfigCopyTable or BRICKS_SERVER.CONFIG).GENERAL.Groups ) do
                    if( val[1] == text ) then
                        notification.AddLegacy( BRICKS_SERVER.Func.L( "groupAlreadyExists" ), 1, 5 )
                        return
                    end
                end
                
                table.insert( BS_ConfigCopyTable.GENERAL.Groups, { text, {} } )
                self.RefreshPanel()
                BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
            end, function() end, BRICKS_SERVER.Func.L( "ok" ), BRICKS_SERVER.Func.L( "cancel" ), false )
        end
    end
    self.RefreshPanel()
end

function PANEL:Paint( w, h )
    
end

vgui.Register( "bricks_server_config_groups_old", PANEL, "bricks_server_scrollpanel" )
--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_raritybox.lua:
local PANEL = {}

function PANEL:Init()

end

function PANEL:SetRarityName( rarityName, direction, rarityInfo )
	self:Clear()

	self.rarityInfo = rarityInfo or BRICKS_SERVER.Func.GetRarityInfo( rarityName )

	if( not self.rarityInfo ) then return end

	self.rarityType = self.rarityInfo[2]

	if( (self.rarityType == "Gradient" or self.rarityType == "Fade") and (not self.rarityInfo[3] or #self.rarityInfo[3] <= 1) ) then
		self.rarityType = "SolidColor"
	end

	if( self.rarityType == "Gradient" or self.rarityType == "Rainbow" ) then
		self.colorPanel = vgui.Create( "bricks_server_gradientanim", self )
		self.colorPanel:SetPos( 0, 0 )
		self.colorPanel:SetSize( self:GetSize() )

		if( direction ) then
			self.colorPanel:SetDirection( direction )
		end
		
		if( self.rarityType == "Rainbow" ) then
			self.colorPanel:TasteTheRainbow()
		else
			self.colorPanel:SetColors( unpack( self.rarityInfo[3] ) )
		end

		self.colorPanel:StartAnim()
	else
		local panelColors
		if( self.rarityType == "Fade" ) then
			panelColors = self.rarityInfo[3]
		else
			panelColors = { self.rarityInfo[3] }
		end

		local fadeTime = 3
		local changeTime, currentColor, nextColor = CurTime()+fadeTime, 1, 2

		self.colorPanel = vgui.Create( "DPanel", self )
		self.colorPanel:SetPos( 0, 0 )
		self.colorPanel:SetSize( self:GetSize() )
		self.colorPanel.Paint = function( self2, w, h )
			local panelColor = panelColors[1]
			if( self.rarityType == "Fade" ) then
				if( CurTime() >= changeTime ) then
					changeTime, currentColor, nextColor = CurTime()+fadeTime, nextColor, ((panelColors[nextColor+1] and nextColor+1) or 1)
				end

				local curColor, nextColor = panelColors[currentColor], panelColors[nextColor]
				local percent = (fadeTime-(changeTime-CurTime()))/fadeTime

				panelColor = Color( Lerp( percent, curColor.r, nextColor.r ), Lerp( percent, curColor.g, nextColor.g ), Lerp( percent, curColor.b, nextColor.b ) )
			end
			
			if( self.cornerRadius > 0 ) then
				draw.RoundedBox( self.cornerRadius, (self.roundedBoxX or 0), (self.roundedBoxY or 0), (self.roundedBoxW or w), (self.roundedBoxH or h), panelColor )
			else
				surface.SetDrawColor( panelColor )
				surface.DrawRect( (self.roundedBoxX or 0), (self.roundedBoxY or 0), (self.roundedBoxW or w), (self.roundedBoxH or h) )
			end
		end
	end
end

function PANEL:SetRarityInfo( rarityInfo, direction )
	self:SetRarityName( false, direction, rarityInfo )
end

function PANEL:OnSizeChanged( w, h )
	if( IsValid( self.colorPanel ) ) then
		self.colorPanel:SetSize( w, h )
	end
end

function PANEL:SetCornerRadius( cornerRadius )
	self.cornerRadius = cornerRadius

	if( self.rarityType != "Gradient" and self.rarityType != "Rainbow" ) then return end

    self.colorPanel:SetCornerRadius( cornerRadius )
end

function PANEL:SetRoundedBoxDimensions( roundedBoxX, roundedBoxY, roundedBoxW, roundedBoxH )
	self.roundedBoxX, self.roundedBoxY, self.roundedBoxW, self.roundedBoxH = roundedBoxX, roundedBoxY, roundedBoxW, roundedBoxH

	if( self.rarityType != "Gradient" and self.rarityType != "Rainbow" ) then return end

	self.colorPanel:SetRoundedBoxDimensions( roundedBoxX, roundedBoxY, roundedBoxW, roundedBoxH )
end

function PANEL:Paint( w, h )

end

vgui.Register( "bricks_server_raritybox", PANEL, "DPanel" )
--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_rounded_avatar.lua:
local PANEL = {}

function PANEL:Init()
	self.avatar = vgui.Create( "AvatarImage", self )
	self.avatar:SetPaintedManually( true )
end

function PANEL:PerformLayout()
	self.avatar:SetSize( self:GetWide(), self:GetTall() )
end

function PANEL:SetPlayer( ply, size )
	self.avatar:SetPlayer( ply, size )
end

function PANEL:SetSteamID( steamID, size )
	self.avatar:SetSteamID( steamID, size )
end

-- Credits: https://github.com/Facepunch/garrysmod/blob/master/garrysmod/lua/includes/modules/draw.lua, https://gist.github.com/MysteryPancake/e8d367988ef05e59843f669566a9a59f

local whiteColor = Color( 255, 255, 255 )
local renderTarget, previousRenderTarget
function PANEL:Paint( w, h )
	if( not renderTarget ) then
		renderTarget = GetRenderTargetEx( "BRS_GRADIENT_ROUNDEDAVATAR", ScrW(), ScrH(), RT_SIZE_FULL_FRAME_BUFFER, MATERIAL_RT_DEPTH_NONE, 2, CREATERENDERTARGETFLAGS_UNFILTERABLE_OK, IMAGE_FORMAT_RGBA8888 )
	end

	if( not previousRenderTarget ) then
		previousRenderTarget = render.GetRenderTarget() 
	end

	render.PushRenderTarget( renderTarget )
	render.OverrideAlphaWriteEnable( true, true )
	render.Clear( 0, 0, 0, 0 ) 

	self.avatar:PaintManual()

	--Draw the mask
	render.OverrideBlendFunc( true, BLEND_ZERO, BLEND_SRC_ALPHA, BLEND_DST_ALPHA, BLEND_ZERO )
	draw.RoundedBox( (self.rounded or 0), 0, 0, w, h, whiteColor )
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
 
vgui.Register( "bricks_server_rounded_avatar", PANEL )
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/submodules/associations/shared/sh_gang_associations.lua:
function BRICKS_SERVER.Func.GangsGetAssociation( gang1, gang2 )
    if( not BRS_GANG_ASSOCIATIONS ) then return false end

    if( BRS_GANG_ASSOCIATIONS[gang1] and BRS_GANG_ASSOCIATIONS[gang1][gang2] ) then
        return BRS_GANG_ASSOCIATIONS[gang1][gang2]
    end

    if( BRS_GANG_ASSOCIATIONS[gang2] and BRS_GANG_ASSOCIATIONS[gang2][gang1] ) then
        return BRS_GANG_ASSOCIATIONS[gang2][gang1]
    end

    return false
end

function BRICKS_SERVER.Func.GangHasAssociationInvite( toGang, fromGang )
    if( BRS_GANG_INBOXES and BRS_GANG_INBOXES[toGang] ) then 
        for k, v in pairs( BRS_GANG_INBOXES[toGang] ) do
            if( istable( v ) and v.Type == "AssociationInvite" and v.ReqInfo and v.ReqInfo[1] and v.ReqInfo[1] == fromGang ) then
                return k
            end
        end
    end

    return false
end

local playerMeta = FindMetaTable("Player")
function playerMeta:GetGangAssociationWith( otherPly )
    local gang1, gang2 = self:GetGangID(), otherPly:GetGangID()

    if( not gang1 or not gang2 ) then return false end

    return BRICKS_SERVER.Func.GangsGetAssociation( gang1, gang2 )
end
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/submodules/leaderboards/vgui/bricks_server_config_gang_leaderboards.lua:
local PANEL = {}

function PANEL:Init()

end

function PANEL:FillPanel( configPanel )
    function self.RefreshPanel()
        self:Clear()

        for k, v in pairs( BS_ConfigCopyTable.GANGS.Leaderboards or {} ) do
            local itemActions = {
                [1] = { BRICKS_SERVER.Func.L( "edit" ), function()
                    BRICKS_SERVER.Func.CreateLeaderboardEditor( v, function( leaderboardTable ) 
                        BS_ConfigCopyTable.GANGS.Leaderboards[k] = leaderboardTable
                        BRICKS_SERVER.Func.ConfigChange( "GANGS" )
                        self.RefreshPanel()
                    end, function() end )
                end },
                [2] = { BRICKS_SERVER.Func.L( "remove" ), function()
                    BS_ConfigCopyTable.GANGS.Leaderboards[k] = nil
                    BRICKS_SERVER.Func.ConfigChange( "GANGS" )
                    self.RefreshPanel()
                end, BRICKS_SERVER.DEVCONFIG.BaseThemes.Red, BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkRed }
            }

            local devConfigTable = BRICKS_SERVER.DEVCONFIG.GangLeaderboards[(v.Type or "")] or {}

            local itemBack = vgui.Create( "DPanel", self )
            itemBack:Dock( TOP )
            itemBack:DockMargin( 0, 0, 0, 5 )
            itemBack:SetTall( 100 )
            itemBack:DockPadding( 0, 0, 25, 0 )
            itemBack.Paint = function( self2, w, h )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
                draw.RoundedBoxEx( 5, 0, 0, 25, h, (v.Color or BRICKS_SERVER.Func.GetTheme( 5 )), true, false, true, false )

                surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 3 ) )
                surface.DrawRect( 5, 0, 20, h )

                draw.SimpleText( v.Name, "BRICKS_SERVER_Font33", 20, 5, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
                draw.SimpleText( BRICKS_SERVER.Func.L( "type" ) .. ": " .. (devConfigTable.Name or BRICKS_SERVER.Func.L( "nil" )), "BRICKS_SERVER_Font20", 20, 32, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
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
    
            draw.SimpleText( BRICKS_SERVER.Func.L( "gangAddLeaderboard" ), "BRICKS_SERVER_Font25", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
        addNewButton.DoClick = function()
            local options = {}
			for k, v in pairs( BRICKS_SERVER.DEVCONFIG.GangLeaderboards ) do
				options[k] = v.Name
			end

			BRICKS_SERVER.Func.ComboRequest( BRICKS_SERVER.Func.L( "admin" ), BRICKS_SERVER.Func.L( "gangNewLeaderboardType" ), "", options, function( value, data ) 
				if( options[data] and BRICKS_SERVER.DEVCONFIG.GangLeaderboards[data] ) then
                    table.insert( BS_ConfigCopyTable.GANGS.Leaderboards, {
                        Name = BRICKS_SERVER.Func.L( "gangNewLeaderboard" ), 
                        Type = data
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

vgui.Register( "bricks_server_config_gang_leaderboards", PANEL, "bricks_server_scrollpanel" )
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/submodules/territories/vgui/bricks_server_config_gang_territories.lua:
local PANEL = {}

function PANEL:Init()

end

function PANEL:FillPanel( configPanel )
    function self.RefreshPanel()
        self:Clear()

        for k, v in pairs( BS_ConfigCopyTable.GANGS.Territories or {} ) do
            local itemActions = {
                [1] = { BRICKS_SERVER.Func.L( "edit" ), function()
                    BRICKS_SERVER.Func.CreateTerritoryEditor( v, function( territoryTable ) 
                        BS_ConfigCopyTable.GANGS.Territories[k] = territoryTable
                        BRICKS_SERVER.Func.ConfigChange( "GANGS" )
                        self.RefreshPanel()
                    end, function() end )
                end },
                [2] = { BRICKS_SERVER.Func.L( "remove" ), function()
                    BS_ConfigCopyTable.GANGS.Territories[k] = nil
                    BRICKS_SERVER.Func.ConfigChange( "GANGS" )
                    self.RefreshPanel()
                end, BRICKS_SERVER.DEVCONFIG.BaseThemes.Red, BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkRed }
            }

            local itemBack = vgui.Create( "DPanel", self )
            itemBack:Dock( TOP )
            itemBack:DockMargin( 0, 0, 0, 5 )
            itemBack:SetTall( 100 )
            itemBack:DockPadding( 0, 0, 25, 0 )
            itemBack.Paint = function( self2, w, h )
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
                draw.RoundedBoxEx( 5, 0, 0, 25, h, (v.Color or BRICKS_SERVER.Func.GetTheme( 5 )), true, false, true, false )

                surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 3 ) )
                surface.DrawRect( 5, 0, 20, h )

                draw.SimpleText( v.Name, "BRICKS_SERVER_Font33", 20, 5, BRICKS_SERVER.Func.GetTheme( 6 ), 0, 0 )
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

            surface.SetFont( "BRICKS_SERVER_Font33" )
            local nameX, nameY = surface.GetTextSize( v.Name )

            local noticeBack = vgui.Create( "DPanel", itemBack )
            noticeBack:SetSize( 0, 35 )
            noticeBack:SetPos( 20, 5+nameY+10 )
            noticeBack.Paint = function( self2, w, h ) end

            local itemNotices = {}

            for key, val in pairs( v.Rewards or {} ) do
                local devConfig = BRICKS_SERVER.DEVCONFIG.GangRewards[key]

                if( not devConfig ) then continue end

                table.insert( itemNotices, { devConfig.FormatDescription( val ), devConfig.Color } )
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
    
            draw.SimpleText( BRICKS_SERVER.Func.L( "gangAddTerritory" ), "BRICKS_SERVER_Font25", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end
        addNewButton.DoClick = function()
            if( not BS_ConfigCopyTable.GANGS.Territories ) then
                BS_ConfigCopyTable.GANGS.Territories = {}
            end

            table.insert( BS_ConfigCopyTable.GANGS.Territories, {
                Name = BRICKS_SERVER.Func.L( "gangNewTerritory" ), 
                Color = BRICKS_SERVER.Func.GetTheme( 5 ),
                RewardTime = 60,
                Rewards = {}
            } )

            BRICKS_SERVER.Func.ConfigChange( "GANGS" )
            self.RefreshPanel()
        end
    end
    self.RefreshPanel()
end

function PANEL:Paint( w, h )
    
end

vgui.Register( "bricks_server_config_gang_territories", PANEL, "bricks_server_scrollpanel" )
--PATH addons/brick_s_server_framework/lua/bricks_server/modules/default/submodules/currencies/shared/sh_currency_system.lua:
local playerMeta = FindMetaTable("Player")

function playerMeta:GetCurrencies()
    if( CLIENT and self == LocalPlayer() ) then
        return BRS_CURRENCIES
    else
        return self.BRS_CURRENCIES or {}
    end
end

function playerMeta:GetCurrency( currency )
	if( not BRICKS_SERVER.CONFIG.CURRENCIES[currency] ) then return 0 end

    return self:GetCurrencies()[currency] or 0
end

concommand.Add( "addcurrency", function( ply, cmd, args )
    if( CLIENT ) then
		if( not BRICKS_SERVER.Func.HasAdminAccess( ply ) ) then 
			print( "BRICKS SERVER ERROR: NO ACCESS" )
			return 
		end

		if( args[1] and args[2] and args[3] and isstring( args[1] ) and isnumber( tonumber( args[2] ) ) and isnumber( tonumber( args[3] ) ) ) then
			net.Start( "BRS.Net.Admin_AddCurrency" )
				net.WriteString( args[1] )
				net.WriteUInt( tonumber( args[2] ), 8 )
				net.WriteInt( tonumber( args[3] ), 32 )
			net.SendToServer()
		end
    elseif( SERVER ) then
        local steamid64 = args[1]
        local currencyType = tonumber( args[2] or 0 )
        local amount = tonumber( args[3] or 0 )
        if( (not IsValid( ply ) or BRICKS_SERVER.Func.HasAdminAccess( ply )) and steamid64 and currencyType and amount ) then
            if( not BRICKS_SERVER.CONFIG.CURRENCIES[currencyType] ) then return end
        
            local victim = player.GetBySteamID64( steamid64 )
        
            if( not IsValid( victim ) ) then return end
        
            victim:AddCurrency( currencyType, amount )

            if( IsValid( ply ) ) then
				BRICKS_SERVER.Func.SendNotification( ply, 1, 5, "Gave " .. victim:Nick() .. " " .. string.Comma( amount ) .. " " .. (BRICKS_SERVER.CONFIG.CURRENCIES[currencyType].Name or "ERROR") )
            end

			BRICKS_SERVER.Func.SendNotification( victim, 1, 5, "An admin has gave you " .. string.Comma( amount ) .. " " .. (BRICKS_SERVER.CONFIG.CURRENCIES[currencyType].Name or "ERROR") )
        end
	end
end )

concommand.Add( "setcurrency", function( ply, cmd, args )
    if( CLIENT ) then
		if( not BRICKS_SERVER.Func.HasAdminAccess( ply ) ) then 
			print( "BRICKS SERVER ERROR: NO ACCESS" )
			return 
		end

		if( args[1] and args[2] and args[3] and isstring( args[1] ) and isnumber( tonumber( args[2] ) ) and isnumber( tonumber( args[3] ) ) ) then
			net.Start( "BRS.Net.Admin_SetCurrency" )
				net.WriteString( args[1] )
				net.WriteUInt( tonumber( args[2] ), 8 )
				net.WriteInt( tonumber( args[3] ), 32 )
			net.SendToServer()
		end
    elseif( SERVER ) then
        local steamid64 = args[1]
        local currencyType = tonumber( args[2] or 0 )
        local amount = tonumber( args[3] or 0 )
        if( (not IsValid( ply ) or BRICKS_SERVER.Func.HasAdminAccess( ply )) and steamid64 and currencyType and amount ) then
            if( not BRICKS_SERVER.CONFIG.CURRENCIES[currencyType] ) then return end
        
            local victim = player.GetBySteamID64( steamid64 )
        
            if( not IsValid( victim ) ) then return end
        
            victim:SetCurrency( currencyType, amount )

            if( IsValid( ply ) ) then
				BRICKS_SERVER.Func.SendNotification( ply, 1, 5, "Set " .. victim:Nick() .. "'s " .. (BRICKS_SERVER.CONFIG.CURRENCIES[currencyType].Name or "ERROR") .. " to " .. string.Comma( amount ) )
            end

			BRICKS_SERVER.Func.SendNotification( victim, 1, 5, "An admin has set your " .. (BRICKS_SERVER.CONFIG.CURRENCIES[currencyType].Name or "ERROR") .. " to " .. string.Comma( amount ) )
        end
	end
end )

function BRICKS_SERVER.LoadCurrencies()
	BRICKS_SERVER.DEVCONFIG.Currencies = BRICKS_SERVER.DEVCONFIG.Currencies or {}

	for k, v in pairs( BRICKS_SERVER.CONFIG.CURRENCIES or {} ) do
		BRICKS_SERVER.DEVCONFIG.Currencies["custom_" .. k] = {
			Title = v.Name,
			getFunction = function( ply )
				return ply:GetCurrency( k )
			end,
			addFunction = function( ply, amount )
				ply:AddCurrency( k, amount )
			end,
			formatFunction = function( amount )
				if( v.Prefix ) then
					return v.Prefix .. string.Comma( amount or 0 )
				elseif( v.Suffix ) then
					return string.Comma( amount or 0 ) .. " " .. v.Suffix
				else
					return string.Comma( amount or 0 )
				end
			end
		}
	end
end
BRICKS_SERVER.LoadCurrencies()
--PATH addons/svnv_ru_lib/lua/autorun/client/cl_derma.lua:

svyanovlib                      = svyanovlib or {}
svyanovlib.config               = svyanovlib.config or {}

-- Client values ( for the menus ) --

svyanovlib.config.client = {}
svyanovlib.config.client[ 'backgroundColor' ]         = Color( 15, 15, 15, 200 ) -- Background colors
svyanovlib.config.client[ 'linesColor' ]              = Color( 255, 255, 255 ) -- Outlines colors
svyanovlib.config.client[ 'textColor' ]               = Color( 255, 255, 255 ) -- Color of text within the menus
svyanovlib.config.client[ 'animSpeed' ]               = 0.3 -- Animation speed, 0.1 being the fastest, and 1 being the slowest
svyanovlib.config.client[ 'entityOverheadColor' ]       = Color( 255, 25, 25 ) -- Color of the overhead text of all entities related to the addon :D
svyanovlib.config.client[ 'barColor' ]                  = Color( 100, 100, 245 )

for i = 1, 150 do

      surface.CreateFont( 'svyanovlib_font_' .. i, {
            font = 'Arial',
            size = i,
            weight = 500
      } )

end
function svyanovlib.clientVal( key )
      return svyanovlib.config.client[ key ]
end

local blur = Material 'pp/blurscreen'

function svyanovlib.drawBlur( pan, amt )

      local x, y = pan:LocalToScreen( 0, 0 )

      surface.SetDrawColor( 255, 255, 255 )
      surface.SetMaterial( blur )

      for i = 1, 3 do

            blur:SetFloat( '$blur', ( i / 3 ) * ( amt or 6 ) )
            blur:Recompute()

            render.UpdateScreenEffectTexture()
            surface.DrawTexturedRect( x * -1, y * -1, ScrW(), ScrH() )

      end

end

function svyanovlib.drawBox( x, y, w, h, clr, out )

      if not clr then clr = svyanovlib.clientVal( 'backgroundColor' ) end

      surface.SetDrawColor( clr )
      surface.DrawRect( x, y, w, h )

end

function svyanovlib.drawOutlinedBox( x, y, w, h, clr )

      if not clr then clr = svyanovlib.clientVal( 'backgroundColor' ) end

      svyanovlib.drawBox( x, y, w, h, clr )

      surface.SetDrawColor( svyanovlib.clientVal( 'linesColor' ) )
      surface.DrawLine( 0, 0, w - 1, 0 )
      surface.DrawLine( w - 1, 0, w - 1, h - 1 )
      surface.DrawLine( 0, h - 1, w - 1, h - 1 )
      surface.DrawLine( 0, 0, 0, h )

end

function svyanovlib.txt( str, size, x, y, clr, a1, a2 )

      if not a1 then a1 = 0 end
      if not a2 then a2 = 0 end
      if not clr or clr == nil then clr = svyanovlib.clientVal( 'textColor' ) end

      draw.SimpleText( str, 'svyanovlib_font_' .. size, x, y, clr, a1, a2 )

end


function svyanovlib.fixMdlPos( mdl )

      if not mdl.Entity then return end

      local mn, mx = mdl.Entity:GetRenderBounds()
      local size = 0
      size = math.max( size, math.abs(mn.x) + math.abs(mx.x) )
      size = math.max( size, math.abs(mn.y) + math.abs(mx.y) )
      size = math.max( size, math.abs(mn.z) + math.abs(mx.z) )
      mdl:SetFOV( 45 )
      mdl:SetCamPos( Vector( size, size, size ) )
      mdl:SetLookAt( (mn + mx) * 0.5 )

end

function svyanovlib.openURL( url )

      local w, h = ScrW() * 0.9, ScrH() * 0.8

      local bg = vgui.Create( 'svyanovlib_DFrame' )
      bg:SetSize( w, h )
      bg:centerFrame()
      bg:addClose()

      bg.title          = url
      bg.titleSize      = 20
      bg.titleX         = w / 2

      local htmlBg = bg:Add( 'svyanovlib_DPanel' )
      htmlBg:SetSize( w - 10, h - 30 )
      htmlBg:SetPos( 5, 25)

      function htmlBg:Paint( w, h )

            svyanovlib.drawBox( 0, 0, w, h )
            svyanovlib.txt( 'Загрузка...', 23, w / 2, h / 2, nil, 1, 1 )

      end

      local html = htmlBg:Add( 'DHTML' )
      html:SetSize( w, h )
      html:SetPos( 0, 0 )
      html:OpenURL( url )

end


local PANEL = {}

function PANEL:Init()

      self:SetDraggable( false )
      self:ShowCloseButton( false )
      self:SetTitle( '' )
      self:MakePopup()

      self.title              = ''
      self.titleSize          = 18
      self.titleX             = self:GetWide() / 2

end

function PANEL:addClose()

      local cb = self:Add( 'svyanovlib_DButton' )
      cb:SetPos( self:GetWide() - 51, 1 )
      cb:SetSize( 50, 20 )

      cb.text                  = 'Закрыть'
      cb.textSize              = 15

      function cb:DoClick()

            if IsValid( self:GetParent() ) then
                  self:GetParent():removeFrame()
            end

      end

end

function PANEL:removeFrame()

      self:SizeTo( 0, 0, svyanovlib.clientVal( 'animSpeed' ) )

      timer.Simple( svyanovlib.clientVal( 'animSpeed' ), function()
            self:Remove()
      end )

end

function PANEL:centerFrame()

      local x           = ScrW() / 2 - ( self:GetWide() / 2 )
      local y           = ScrH() / 2 - ( self:GetTall() / 2 )

      self:SetPos( x, y )

end

function PANEL:Paint( pW, pH )

      svyanovlib.drawBlur( self, 6 )
      svyanovlib.drawOutlinedBox( 0, 0, pW, pH )

      svyanovlib.txt( self.title or '', self.titleSize, self.titleX, 5, nil, 1 )

end

vgui.Register( 'svyanovlib_DFrame', PANEL, 'DFrame' )

PANEL = {}

function PANEL:Init()

      self:SetText( '' )

      self.text               = ''
      self.textSize           = 15
      self.clickable          = true
      self.lerpW              = 0
      self.btnColor           = Color( 150, 25, 25, 80 )

end

function PANEL:Paint( w, h )

      local clr = self.btnColor

      if self.clickable then

            svyanovlib.drawBox( 0, 0, w, h, clr )

            if not self:IsHovered() then

                  self.lerpW = Lerp( 0.1, self.lerpW, 0 )

            else

                  self.lerpW = Lerp( 0.1, self.lerpW, w )

            end

      else

            svyanovlib.drawBox( 0, 0, w, h, Color( 150, 25, 25, 25 ) )
            self.lerpW = Lerp( 0.1, self.lerpW, 0 )

      end

      svyanovlib.drawBox( 0, 0, self.lerpW, h, Color( clr.r + 50, clr.g + 50, clr.b + 50, 150 ) )
      svyanovlib.txt( self.text or '', self.textSize, w / 2, h / 2, nil, 1, 1 )

end

function PANEL:OnCursorEntered()

      if not self.clickable then return end
      surface.PlaySound( 'UI/buttonrollover.wav' )

end

vgui.Register( 'svyanovlib_DButton', PANEL, 'DButton' )

PANEL = {}

function PANEL:Init()

      self.title        = ''
      self.titleSize    = 18
      self.outline      = true

end

function PANEL:Paint( w, h )

      if self.outline then

            svyanovlib.drawOutlinedBox( 0, 0, w, h )

      else

            svyanovlib.drawBox( 0, 0, w, h )

      end

      svyanovlib.txt( self.title, self.titleSize, w / 2, 5, nil, 1 )

end

vgui.Register( 'svyanovlib_DPanel', PANEL, 'DPanel' )

--PATH addons/rp_rewards/lua/autorun/client/cl_discordjoin.lua:
local mat1 = 'rewards/dsgambit.png'
local mat2 = 'rewards/steamgmb.png'
local mat3 = 'rewards/vkgambit.png'
local mat4 = 'rewards/telegram.png'

dsnagradi = dsnagradi or {}
dsnagradi.BotClientID = '1039285164620124251'

local url = 'http://194.67.90.167:3001/proxy'

local surface = surface
local draw = draw
local vgui = vgui
local net = net
local Color = Color
local Lerp = Lerp

local comboBoxColor = Color(33, 33, 33, 255)
local comboBoxHoverColor = Color(70, 70, 70, 255)
local comboBoxTextColor = Color(255, 255, 255)
local borderColor = Color(100, 100, 100, 255)
local panelBackgroundColor = Color(54, 54, 54)
local innerPanelColor = Color(38, 38, 38, 255)
local whiteColor = Color(255, 255, 255, 255)
local whiteColor128 = Color(255, 255, 255, 128)
local blueColor = Color(0, 117, 222, 255)
local blueHoverColor = Color(0, 150, 255, 255)
local blueClickColor = Color(0, 80, 200, 255)
local footerTextColor = Color(200, 200, 200, 255)
local redColor = Color(255, 0, 0, 255)

surface.CreateFont("PassportTitleFont", {
    font = "Montserrat SemiBold",
    size = 25,
    weight = 500,
    extended = true,
    shadow = true,
})

surface.CreateFont("PassportLabelFont", {
    font = "Montserrat Regular",
    size = 16,
    weight = 500,
    extended = true,
})

surface.CreateFont("PassportInputFont", {
    font = "Montserrat Regular",
    size = 18,
    weight = 500,
    extended = true,
})

surface.CreateFont("PassportButtonFont", {
    font = "Montserrat SemiBold",
    size = 20,
    weight = 500,
    extended = true,
})

surface.CreateFont("PassportFooterFont", {
    font = "Montserrat Light",
    size = 12,
    weight = 300,
    extended = true,
})


local discordMenuOpen = false
local discordFrame

-- Конфигурация
local DS_BOT_URL = "https://rewards.gambitrp.site/discordjoin"
local BUTTON_WIDTH = 200
local BUTTON_HEIGHT = 40

local function CreateDiscordMenu()
    if discordMenuOpen then
        notification.AddLegacy("Меню уже открыто.", NOTIFY_ERROR, 5)
        return
    end

    discordMenuOpen = true

    local frameWidth, frameHeight = 350, 290
    discordFrame = vgui.Create("DFrame")
    discordFrame:SetSize(frameWidth, frameHeight)
    discordFrame:Center()
    discordFrame:SetTitle("")
    discordFrame:ShowCloseButton(false)
    discordFrame:MakePopup()

    function discordFrame:OnRemove()
        discordMenuOpen = false
    end

    function discordFrame:Paint(w, h)
        draw.RoundedBox(8, 0, 0, w, h, Color(40, 40, 40))
    end

    local contentPanel = vgui.Create("DPanel", discordFrame)
    contentPanel:Dock(FILL)
    contentPanel:DockMargin(10, 10, 10, 10)

    function contentPanel:Paint(w, h)
        draw.RoundedBox(8, 0, 0, w, h, Color(50, 50, 50))
    end

    -- Заголовок
    local titleLabel = vgui.Create("DLabel", discordFrame)
    titleLabel:SetFont("PassportTitleFont")
    titleLabel:SetText("Discord награда")
    titleLabel:SetTextColor(color_white)
    titleLabel:SizeToContents()
    titleLabel:SetPos((discordFrame:GetWide() - titleLabel:GetWide()) / 2, 5)

    -- Кнопка для копирования ссылки
    local copyLinkButton = vgui.Create("DButton", contentPanel)
    copyLinkButton:SetSize(BUTTON_WIDTH, BUTTON_HEIGHT)
    copyLinkButton:SetPos((contentPanel:GetWide() - BUTTON_WIDTH) / 2 + 125 , 35)
    copyLinkButton:SetText("Скопировать ссылку")
    copyLinkButton:SetFont("PassportButtonFont")
    copyLinkButton:SetTextColor(color_white)

    -- Стилизация кнопки
    local buttonColors = {
        normal = Color(0, 120, 215),
        hover = Color(0, 140, 235),
        click = Color(0, 100, 195)
    }

    copyLinkButton.Paint = function(self, w, h)
        local col = buttonColors.normal
        if self:IsHovered() then
            col = self:IsDown() and buttonColors.click or buttonColors.hover
        end
        
        draw.RoundedBox(8, 0, 0, w, h, col)
    end

    copyLinkButton.DoClick = function()
        -- Копирование в буфер обмена
        SetClipboardText(DS_BOT_URL)
        notification.AddLegacy("Ссылка скопирована, вставать её в браузер!", NOTIFY_GENERIC, 3)
    end

    -- Поле для ввода кода
    local codeEntry = vgui.Create("DTextEntry", contentPanel)
    codeEntry:SetSize(BUTTON_WIDTH, BUTTON_HEIGHT)
    codeEntry:SetPos((contentPanel:GetWide() - BUTTON_WIDTH) / 2 + 125, 105)
    codeEntry:SetPlaceholderText("Введите код из Discord...")
	codeEntry:SetPlaceholderColor(color_white)
    codeEntry:SetNumeric(true)
    codeEntry:SetFont("PassportLabelFont")
	
	codeEntry.Paint = function(self, w, h)
		local col = color_white

		if self:IsHovered() or self:HasFocus() then
			col = Color(255, 255, 255, 225)
		end

		-- Закругленный фон
		draw.RoundedBox(8, 0, 0, w, h, col)
		
		-- Рисуем placeholder если текст пустой
		if self:GetText() == "" then
			draw.SimpleText(
				self:GetPlaceholderText() or "",
				"PassportInputFont",
				w/2, h/2,
				Color(150, 150, 150),
				TEXT_ALIGN_CENTER,
				TEXT_ALIGN_CENTER
			)
		end
	
		-- Стандартная отрисовка текста
		self:DrawTextEntryText(
			self:GetTextColor(), 
			self:GetHighlightColor(), 
			self:GetCursorColor()
		)
	end
	
    -- Кнопка подтверждения
    local submitButton = vgui.Create("DButton", contentPanel)
    submitButton:SetSize(BUTTON_WIDTH, BUTTON_HEIGHT)
    submitButton:SetPos((contentPanel:GetWide() - BUTTON_WIDTH) / 2 + 125, 155)
    submitButton:SetText("Проверить подписку")
    submitButton:SetFont("PassportButtonFont")
    submitButton:SetTextColor(color_white)
	
	local submitButtonColors = {
		normal = Color(76, 175, 80),     -- Базовый зеленый
		hover = Color(105, 190, 109),    -- Светло-зеленый при наведении
		click = Color(56, 142, 60)       -- Темно-зеленый при клике
	}
	
    submitButton.Paint = function(self, w, h)
        local col = submitButtonColors.normal
        if self:IsHovered() then
            col = self:IsDown() and submitButtonColors.click or submitButtonColors.hover
        end
        
        draw.RoundedBox(8, 0, 0, w, h, col)
    end

    submitButton.DoClick = function()
        local code = codeEntry:GetValue()
		if not code:match("^%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d?%d?%d?$") then
            notification.AddLegacy("Код должен содержать от 16 до 19 цифр!", NOTIFY_ERROR, 3)
        else
			net.Start("DiscordVerifyCode")
			net.WriteString(code)
			net.SendToServer()		
        end

    end

    -- Кнопка закрытия
    local closeButton = vgui.Create("DButton", discordFrame)
    closeButton:SetSize(30, 30)
    closeButton:SetPos(discordFrame:GetWide() - 45 , 5)
    closeButton:SetText("✕")
    closeButton:SetFont("DermaDefaultBold")
    closeButton:SetTextColor(color_white)

    closeButton.Paint = function(self, w, h)
          draw.RoundedBox(8, 0, 0, w, h, self:IsHovered() and Color(200, 50, 50) or Color(150, 40, 40))
    end

    closeButton.DoClick = function()
        discordFrame:Remove()
    end
end


local telegramMenuOpen = false
local telegramFrame

-- Конфигурация
local TG_BOT_URL = "https://t.me/gambitrprewards_bot" 
local BUTTON_WIDTH = 200
local BUTTON_HEIGHT = 40

local function CreateTelegramMenu()
    if telegramMenuOpen then
        notification.AddLegacy("Меню уже открыто.", NOTIFY_ERROR, 5)
        return
    end

    telegramMenuOpen = true

    local frameWidth, frameHeight = 350, 290
    telegramFrame = vgui.Create("DFrame")
    telegramFrame:SetSize(frameWidth, frameHeight)
    telegramFrame:Center()
    telegramFrame:SetTitle("")
    telegramFrame:ShowCloseButton(false)
    telegramFrame:MakePopup()

    function telegramFrame:OnRemove()
        telegramMenuOpen = false
    end

    function telegramFrame:Paint(w, h)
        draw.RoundedBox(8, 0, 0, w, h, Color(40, 40, 40))
    end

    local contentPanel = vgui.Create("DPanel", telegramFrame)
    contentPanel:Dock(FILL)
    contentPanel:DockMargin(10, 10, 10, 10)

    function contentPanel:Paint(w, h)
        draw.RoundedBox(8, 0, 0, w, h, Color(50, 50, 50))
    end

    -- Заголовок
    local titleLabel = vgui.Create("DLabel", telegramFrame)
    titleLabel:SetFont("PassportTitleFont")
    titleLabel:SetText("Telegram награда")
    titleLabel:SetTextColor(color_white)
    titleLabel:SizeToContents()
    titleLabel:SetPos((telegramFrame:GetWide() - titleLabel:GetWide()) / 2, 5)

    -- Кнопка для копирования ссылки
    local copyLinkButton = vgui.Create("DButton", contentPanel)
    copyLinkButton:SetSize(BUTTON_WIDTH, BUTTON_HEIGHT)
    copyLinkButton:SetPos((contentPanel:GetWide() - BUTTON_WIDTH) / 2 + 125 , 35)
    copyLinkButton:SetText("Скопировать ссылку")
    copyLinkButton:SetFont("PassportButtonFont")
    copyLinkButton:SetTextColor(color_white)

    -- Стилизация кнопки
    local buttonColors = {
        normal = Color(0, 120, 215),
        hover = Color(0, 140, 235),
        click = Color(0, 100, 195)
    }

    copyLinkButton.Paint = function(self, w, h)
        local col = buttonColors.normal
        if self:IsHovered() then
            col = self:IsDown() and buttonColors.click or buttonColors.hover
        end
        
        draw.RoundedBox(8, 0, 0, w, h, col)
    end

    copyLinkButton.DoClick = function()
        -- Копирование в буфер обмена
        SetClipboardText(TG_BOT_URL)
        notification.AddLegacy("Ссылка скопирована, вставать её в браузер!", NOTIFY_GENERIC, 3)
    end

    -- Поле для ввода кода
    local codeEntry = vgui.Create("DTextEntry", contentPanel)
    codeEntry:SetSize(BUTTON_WIDTH, BUTTON_HEIGHT)
    codeEntry:SetPos((contentPanel:GetWide() - BUTTON_WIDTH) / 2 + 125, 105)
    codeEntry:SetPlaceholderText("Введите код из Telegram...")
	codeEntry:SetPlaceholderColor(color_white)
    codeEntry:SetNumeric(true)
    codeEntry:SetFont("PassportLabelFont")
	
	codeEntry.Paint = function(self, w, h)
		local col = color_white

		if self:IsHovered() or self:HasFocus() then
			col = Color(255, 255, 255, 225)
		end

		-- Закругленный фон
		draw.RoundedBox(8, 0, 0, w, h, col)
		
		-- Рисуем placeholder если текст пустой
		if self:GetText() == "" then
			draw.SimpleText(
				self:GetPlaceholderText() or "",
				"PassportInputFont",
				w/2, h/2,
				Color(150, 150, 150),
				TEXT_ALIGN_CENTER,
				TEXT_ALIGN_CENTER
			)
		end
	
		-- Стандартная отрисовка текста
		self:DrawTextEntryText(
			self:GetTextColor(), 
			self:GetHighlightColor(), 
			self:GetCursorColor()
		)
	end
	
    -- Кнопка подтверждения
    local submitButton = vgui.Create("DButton", contentPanel)
    submitButton:SetSize(BUTTON_WIDTH, BUTTON_HEIGHT)
    submitButton:SetPos((contentPanel:GetWide() - BUTTON_WIDTH) / 2 + 125, 155)
    submitButton:SetText("Проверить подписку")
    submitButton:SetFont("PassportButtonFont")
    submitButton:SetTextColor(color_white)
	
	local submitButtonColors = {
		normal = Color(76, 175, 80),     -- Базовый зеленый
		hover = Color(105, 190, 109),    -- Светло-зеленый при наведении
		click = Color(56, 142, 60)       -- Темно-зеленый при клике
	}
	
    submitButton.Paint = function(self, w, h)
        local col = submitButtonColors.normal
        if self:IsHovered() then
            col = self:IsDown() and submitButtonColors.click or submitButtonColors.hover
        end
        
        draw.RoundedBox(8, 0, 0, w, h, col)
    end

    submitButton.DoClick = function()
        local code = codeEntry:GetValue()
		if not code:match("^%d%d%d%d%d%d%d?%d?%d?%d?$") then
            notification.AddLegacy("Код должен содержать от 6 до 10 цифр!", NOTIFY_ERROR, 3)
        else
			net.Start("TelegramVerifyCode")
			net.WriteString(code)
			net.SendToServer()		
        end

    end

    -- Кнопка закрытия
    local closeButton = vgui.Create("DButton", telegramFrame)
    closeButton:SetSize(30, 30)
    closeButton:SetPos(telegramFrame:GetWide() - 45 , 5)
    closeButton:SetText("✕")
    closeButton:SetFont("DermaDefaultBold")
    closeButton:SetTextColor(color_white)

    closeButton.Paint = function(self, w, h)
          draw.RoundedBox(8, 0, 0, w, h, self:IsHovered() and Color(200, 50, 50) or Color(150, 40, 40))
    end

    closeButton.DoClick = function()
        telegramFrame:Remove()
    end
end

-- Обработка ответа от сервера
net.Receive("TelegramVerifyResponse", function()
    local success = net.ReadBool()
    local message = net.ReadString()
    notification.AddLegacy(message, success and NOTIFY_GENERIC or NOTIFY_ERROR, 5)
end)

local btns = {
    {
        n = "Discord",
        r = "15000$",
        i = mat1,
        col = Color(84,98,246),
        bool = 'discord',
        f = function()
			CreateDiscordMenu()
        end
    },
    {
        n = "VK",
        r = "15000$",
        i = mat3,
        col = Color(0,119,255),
        bool = 'VKR',
        f = function()
            local fr = vgui.Create("DFrame")
            fr:SetSize(300,200)
            fr:SetPos(ScrW()/2-150,ScrH()/2-100)
            fr:ShowCloseButton(false)
            fr:SetTitle("VK награда")
            fr:SetSkin('SUP')
            local desc = vgui.Create("DLabel",fr)
            desc:SetText("Вам надо вступить в группу и\nнаписать в личные сообщения 'Получить награду'!")
            desc:SetFont("ui.14")
            desc:SetPos(10,35)
            desc:SetTextColor(Color(255,255,255))
            desc:SizeToContents()
            
            local linkgroup = vgui.Create("DButton",fr)
            linkgroup:SetSize(190,30)
            linkgroup:SetPos(fr:GetWide()/2-95,75)
            linkgroup:SetText("Вступить в группу")
            linkgroup:SetTextColor(Color(255,255,255))
            local col_gray = Color(150,150,150,210)
            linkgroup.DoClick = function()
                gui.OpenURL("https://vk.com/gmodgambitrp")
            end

            local checksub = vgui.Create("DButton",fr)
            checksub:SetSize(190,30)
            checksub:SetPos(fr:GetWide()/2-95,140)
            checksub:SetText("Проверить вступление")
            checksub:SetTextColor(Color(255,255,255))
            local check_col = Color(150,150,150,210)
            checksub.DoClick = function()
                net.Start("VKApi")
                net.SendToServer()
            end

            local close = vgui.Create("DButton", fr)
            close:SetSize(32,32)
            close:SetPos(fr:GetWide() - 32,0)
            close:SetText('')
            close.Paint = function(s,w,h)
                draw.RoundedBox(0, 0, 0, w, h, Color(255,68,68))
                draw.SimpleText("✕", "ui.25", w * .5, h * .5, color_white, 1, 1)
            end
            close.DoClick = function()
                surface.PlaySound("buttons/button14.wav")
                fr:Remove()
            end
        end,
    },
    {
        n = "Steam",
        r = "15000$",
        i = mat2,
        col = Color(64,32,230),
        bool = 'STEAM',
        f = function()
            local fr = vgui.Create("DFrame")
            fr:SetSize(300,200)
            fr:SetPos(ScrW()/2-150,ScrH()/2-100)
            fr:ShowCloseButton(false)
            fr:SetTitle("STEAM награда")
            fr:SetSkin('SUP')
            local desc = vgui.Create("DLabel",fr)
            desc:SetText("Вам надо вступить в группу!")
            desc:SetFont("ui.14")
            desc:SetPos(10,35)
            desc:SetTextColor(Color(255,255,255))
            desc:SizeToContents()
            
            local linkgroup = vgui.Create("DButton",fr)
            linkgroup:SetSize(190,30)
            linkgroup:SetPos(fr:GetWide()/2-95,75)
            linkgroup:SetText("Вступить в группу")
            linkgroup:SetTextColor(Color(255,255,255))
            local col_gray = Color(150,150,150,210)
            linkgroup.DoClick = function()
                gui.OpenURL("https://steamcommunity.com/groups/GambitRP_Grp")
            end

            local checksub = vgui.Create("DButton",fr)
            checksub:SetSize(190,30)
            checksub:SetPos(fr:GetWide()/2-95,140)
            checksub:SetText("Проверить вступление")
            checksub:SetTextColor(Color(255,255,255))
            local check_col = Color(150,150,150,210)
            checksub.DoClick = function()
                net.Start("STeam")
                net.SendToServer()
            end

            local close = vgui.Create("DButton", fr)
            close:SetSize(32,32)
            close:SetPos(fr:GetWide() - 32,0)
            close:SetText('')
            close.Paint = function(s,w,h)
                draw.RoundedBox(0, 0, 0, w, h, Color(255,68,68))
                draw.SimpleText("✕", "ui.25", w * .5, h * .5, color_white, 1, 1)
            end
            close.DoClick = function()
                surface.PlaySound("buttons/button14.wav")
                fr:Remove()
            end
        end
    },
    {
        n = "Telegram", 
        r = "15 кредитов",
        i = mat4, 
        col = Color(0, 204, 153),
        bool = 'TELEGRAM',
        f = function()
            CreateTelegramMenu()
        end
    }
}

local function menuds()
    local fr = vgui.Create("DPanel")
    fr:SetSize(ScrW(), ScrH() * (ScrH() < 1080 and 0.11 or 0.09))
    fr:SetPos(0, -(ScrH() * 0.1))
    fr:MoveTo(0, 0, 1, 0, 1)
    fr.Paint = function(s, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(39,39,39,210))
        draw.SimpleText("Вступи в наши соц. сети и получи награду!", "ui.30", w * 0.5, h * 0.125, color_white, 1, 1)
    end

    local close = vgui.Create("DButton", fr)
    close:SetSize(32,32)
    close:SetPos(fr:GetWide() - 32,0)
    close:SetText('')
    close.Paint = function(s, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(255,68,68))
        draw.SimpleText("✕", "ui.25", w * .5, h * .5, color_white, 1, 1)
    end
    close.DoClick = function()
        surface.PlaySound("buttons/button14.wav")
        fr:MoveTo(0, -(ScrH() * 0.1), 0.3, 0, 3, function()
            fr:Remove()
        end)
    end

    local grid = vgui.Create("ThreeGrid", fr)
    grid:Dock(FILL)
    grid:DockMargin(5, 35, 5, 5)
    grid:InvalidateParent(true)

    grid:SetColumns(4)
    grid:SetHorizontalMargin(5)
    grid:SetVerticalMargin(5)
    for k, v in ipairs(btns) do
        local but = vgui.Create("DButton", grid)
        but:Dock(TOP)
        but:SetText(LocalPlayer():GetNW2Bool(v.bool) and  v.n .. ':' .. " Выполнено" or v.n .. ': ' .. v.r)
        LocalPlayer():SetNW2VarProxy(v.bool, function(_, _, _, var)
            if IsValid(fr) then
                but:SetText(var and v.n .. ':' .. " Выполнено" or v.n .. ': ' .. v.r .. '$' )
            end
        end)
        but:SetTextColor(color_white)
        but:SetFont('ui.25')
        but:SetTall(50)
        but:DockMargin(5, 5, 5, 5)
        but:SetIcon(v.i)
        but.Paint = function(s, w, h)
            draw.RoundedBox(0, 0, 0, w, h, v.col)
        end
        grid:AddCell(but)
        but.DoClick = function()
            v.f()
        end
    end

    timer.Simple(120, function()
        if IsValid(fr) then
            fr:MoveTo(0, -(ScrH() * 0.1), 0.3, 0, 3, function()
                if IsValid(fr) then
                    fr:Remove()
                end
            end)
        end
    end)
end

concommand.Add("rewards", menuds)
net.Receive("OpenRewMenu", menuds)

hook.Add("InitPostEntity", "Rewards", function()
    if LocalPlayer():GetNW2Bool('discord') and LocalPlayer():GetNW2Bool('STEAM') and LocalPlayer():GetNW2Bool('VKR') and LocalPlayer():GetNW2Bool('TELEGRAM') then return end
    menuds()
end)

--PATH addons/svnv_ru_lib/lua/autorun/client/cl_ebat.lua:

-----------------------------------------------------
--[[

	LICENSE

	https://creativecommons.org/licenses/by-nc-nd/4.0/

	Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)

]]

--////////////////////////////////////////////////////////////////////////--

local version = 1
if (BVGUI) then
	if (BVGUI.Version >= version) then
		return
	end
end
BVGUI = {}
BVGUI.Version = version

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
		Button.DoClick = function() Window:Close() fnEnter( TextEntry:GetValue() ) end

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
	["Пистолеты-пулемёты"] = {
		["p90"] = "P90",
		["mp5"] = "MP5",
		["ump"] = "UMP",
		["tmp"] = "TMP",
		["mac10"] = "MAC-10"
	},
	["Пистолеты"] = {
		["deagle"] = "Desert Eagle",
		["fiveseven"] = "Five-Seven",
		["glock"] = "Glock",
		["p228"] = "P228",
		["usp"] = "USP-S",
		["revolver"] = "Револьвер"
	},
	["Винтовки"] = {	
		["ak47"] = "AK-47",
		["m4a1"] = "M4A1",
		["awp"] = "AWP",
		["famas"] = "FAMAS",
		["galil"] = "GALIL",
		["m249"] = "M249",
		["m3super90"] = "M3Super90",
		["aug"] = "AUG",
		["xm1014"] = "XM-1014",
		["weapon_crossbow"] = "Арбалет",
		["scout"] = "Scout",
		["sg552"] = "SG552",
		["weapon_shotgun"] = "Hyper Shotgun",
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
					if !tableguner[k] then
						GunsOnP[a][k] = nil
					end
				end
			end
			MenuOpen_Guns = vgui.Create("BFrame")
			if (IsValid(MenuOpen_Guns)) then
				timer.Stop("MenuOpen_Guns")

				local m = MenuOpen_Guns
				m:SetTitle("Донат оружие")
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
			    	net.Start("weaponsmenu changevar")
			    		net.WriteString(cb.eblya)
			    	net.SendToServer()
			    	cb.text = cb.text == "Включить" and "Выключить" or "Включить"
			    	
			    	m.textbox:SetText(string.format("Нажмите кнопку ниже чтобы %s выдачу %s при спавне",cb.text == "Включить" and "включить" or "выключить",cb.eblya2 or cb.eblya))
			    --	MenuOpen_Guns:Remove()
			    --	Guns_Menu(tableguner)
			    end
			     
				function m.categories:Update()
						for a,z in pairs(GunsOnP) do
				for k,v in pairs(z) do
					if !tableguner[k] then
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


net.Receive( "weaponsmenu_getweps", function( len, pl )
	--if ( IsValid( pl ) and pl:IsPlayer() ) then
	Guns_Menu(net.ReadTable() or {})
	--end
end )

concommand.Add("menuweapons",function(ply,cmd,args)
	--net.Start("weaponsmenu_getweps")
	net.SendToServer()
end)
--PATH addons/truefishing/lua/autorun/client/cl_fisherman_menu.lua:
local clr1 = Color(70, 70, 72, 200)
local clr2 = Color(50, 50, 51, 200)
local clr3 = Color(41, 42, 42, 200)
local clr4 = Color(30,32,34)
local clr5 = Color(27, 27, 29, 150)
local clr6 = Color(47, 49, 53)

local menu
local function FishNPCMenu(len)
	if menu and menu.Remove then menu:Remove() end

	local npc = net.ReadEntity()
	if !npc:IsValid() or npc:GetClass() != "npc_fishshop" then
		print("Fishing NPC was invalid.")
		return
	end

	
	local num = net.ReadUInt(6)
	for i=1, num do
		local id = net.ReadUInt(6)
		TrueFish.FISH_PRICE[id] = net.ReadUInt(16)
		TrueFish.FISH_ENABLED[id] = net.ReadBool()
	end
	
	local num = net.ReadUInt(6)
	for i=1, num do
		local id = net.ReadUInt(6)
		TrueFish.GEAR_PRICE[id] = net.ReadUInt(16)
		TrueFish.GEAR_ENABLED[id] = net.ReadBool()
	end

	local FishToSell = {}
	while true do
		local ind = net.ReadUInt(6)
		if ind == 0 then break end

		FishToSell[ind] = FishToSell[ind] and FishToSell[ind] + net.ReadUInt(8) or net.ReadUInt(8)
	end

	
	local TotalSalePrice = 0
	for i=1, FISH_HIGHNUMBER do
		if FishToSell[i] then
			TotalSalePrice = TotalSalePrice + FishToSell[i] * TrueFish.FISH_PRICE[i]
		end
	end
	TotalSalePrice = math.floor(TotalSalePrice)
	
	local SaleAmount = 2

	menu = vgui.Create("DFrame")
	menu:SetTitle("")
	menu:ShowCloseButton(false)
	menu:SetDraggable(false)
	menu:SetSize(TFScreenScale(450), TFScreenScale(282))
	menu:Center()
	menu:MakePopup()
	menu.Paint = function(self)
		surface.SetDrawColor(clr4)
		surface.DrawRect(0, 40, self:GetWide(), self:GetTall()-80)
		
			
		draw.RoundedBoxEx(8, 0, 0, self:GetWide(), 40, clr4, true, true)
		draw.SimpleText(TrueFishLocal("fish_market"), "FishingSS9", self:GetWide()*0.5, 5, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
		
		draw.RoundedBoxEx(8, 0, self:GetTall()-40, self:GetWide(), 40, clr4, false, false, true, true)

	end
	
	local panelListPaint = function(self)
		surface.SetDrawColor(clr5)
		surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
		//surface.SetDrawColor(50, 50, 50, 255)
		//surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall())
	end
	
	local gap = menu:GetWide()*0.01 //0.01225
	local panelSize = menu:GetWide()*0.321 //0.318
	
	local left = vgui.Create("DPanelList", menu)
	left:EnableVerticalScrollbar(true)
	left:SetSize(panelSize, menu:GetTall()-80)
	left:SetPos(gap, 40)
	left:SetSpacing(10)
	left:SetPadding(10)
	left.Paint = panelListPaint
	local sbarLeft = left.VBar
	function sbarLeft:Paint( w, h )
	end
	sbarLeft.btnUp.Paint = sbarLeft.Paint
	sbarLeft.btnDown.Paint = sbarLeft.Paint
	function sbarLeft.btnGrip:Paint( w, h )
		draw.RoundedBox(4, 0, 0, w-1, h, Color(200, 200, 200, 10))
	end
	
	local middle = vgui.Create("DPanelList", menu)
	middle:EnableVerticalScrollbar(true)
	middle:SetSize(panelSize, menu:GetTall()-80)
	local x, y = left:GetPos()
	middle:SetPos(x+left:GetWide()+gap, 40)
	middle:SetSpacing(10)
	middle:SetPadding(10)
	middle.Paint = panelListPaint
	local sbarMiddle = middle.VBar
	function sbarMiddle:Paint( w, h )
	end
	sbarMiddle.btnUp.Paint = sbarLeft.Paint
	sbarMiddle.btnDown.Paint = sbarLeft.Paint
	function sbarMiddle.btnGrip:Paint( w, h )
		draw.RoundedBox(4, 0, 0, w-1, h, Color(200, 200, 200, 10))
	end
	
	local right = vgui.Create("DPanelList", menu)
	right.Paint = function(self)
		surface.SetDrawColor(clr5)
		surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
		if TotalSalePrice == 0 then
			draw.DrawText(TrueFishLocal("no_fish_to_sell"), "FishingSS9", self:GetWide()*0.5, self:GetTall()*0.5, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	end
	right:EnableVerticalScrollbar(true)
	right:SetSize(panelSize, menu:GetTall()-80)
	x, y = middle:GetPos()
	right:SetPos(x+middle:GetWide()+gap, 40)
	right:SetSpacing(10)
	right:SetPadding(10)
	local sbarRight = right.VBar
	function sbarRight:Paint( w, h )
	end
	sbarRight.btnUp.Paint = sbarLeft.Paint
	sbarRight.btnDown.Paint = sbarLeft.Paint
	function sbarRight.btnGrip:Paint( w, h )
		draw.RoundedBox(4, 0, 0, w-1, h, Color(200, 200, 200, 10))
	end
	

	local exitbtn = vgui.Create("DButton", menu)
	exitbtn:SetSize(draw.GetFontHeight("FishingSS9"), draw.GetFontHeight("FishingSS9"))
	exitbtn:SetFont("FishingSS9")
	exitbtn:SetText("×")
	exitbtn:SetPos(menu:GetWide() - draw.GetFontHeight("FishingSS9"), 0)
	exitbtn.Paint = function(self)
		draw.RoundedBoxEx(8, 0, 0, self:GetWide(), 40, Color(80, 120, 199), false, true)
	end
	exitbtn.DoClick = function(self) exitbtn:GetParent():Close() end
	exitbtn:SetTextColor(Color(255,255,255))
	
	local function CreateModelPanel(panel, model, mat, i)
	
		local modelIcon = vgui.Create("DModelPanel", panel)
		function modelIcon:SetModel( strModelName )
			if ( IsValid( self.Entity ) ) then
				self.Entity:Remove()
				self.Entity = nil		
			end
			if ( !ClientsideModel ) then return end			
			self.Entity = ClientsideModel(strModelName, RENDER_GROUP_OPAQUE_ENTITY)
			if ( !IsValid(self.Entity) ) then return end			
			self.Entity:SetNoDraw( true )
		end
		modelIcon:SetModel(model)
		if mat then
			modelIcon:GetEntity():SetMaterial(mat)
		end
		function modelIcon:LayoutEntity(Entity)
			self:RunAnimation()
		end
		local min, max = modelIcon:GetEntity():GetRenderBounds()
		modelIcon:SetCamPos(min:Distance(max)*Vector(0.5, 0.5, 0.5))
		modelIcon:SetLookAt((max + min)/2)
		modelIcon:SetFOV(65)
		modelIcon:SetSize(TFScreenScale(32), TFScreenScale(32))
		modelIcon:SetPos(5, panel:GetTall()*0.5 - modelIcon:GetTall()*0.5)
		if TrueFishGetGearWeapon(i) then // pain in teh arse with dis fishing rod
			modelIcon:SetLookAt(min)
			local dir = (modelIcon:GetCamPos()-modelIcon:GetLookAt()):GetNormal()
			modelIcon:SetFOV(15)
			modelIcon:SetCamPos(modelIcon:GetCamPos()-dir*50)
			modelIcon.Entity:SetAngles(Angle(-35, 35, 180))
		elseif string.find(model, "FoodNHouseholdItems") then
			modelIcon:SetFOV(55)
			modelIcon.Entity:SetAngles(Angle(35, 0, -90))
		end
		modelIcon:SetMouseInputEnabled(false)
	
		return modelIcon
	end
	

	local function AddSellItem(parent, i)
		local panel = vgui.Create("DPanel", parent)
		panel:SetTall(TFScreenScale(40))
		panel.Paint = function(self)
			surface.SetDrawColor(clr3)
			surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
			surface.SetDrawColor(50, 50, 50, 255)
			surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall())
			draw.SimpleText(TrueFishGetFishName(i), "FishingSS6", self:GetWide()*0.5, 0, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
			draw.SimpleText(TrueFishLocal("reward_txt", math.floor(TrueFish.FISH_PRICE[i])), "FishingSS9_NumberFix", self:GetWide()*0.5, self:GetTall()*0.5, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		
		local modelIcon = CreateModelPanel(panel, TrueFishGetFishModel(i))
		
		parent:AddItem(panel)
	end
	
	for i=1, FISH_HIGHNUMBER do
		if !TrueFish.FISH_ENABLED[i] then continue end
		AddSellItem(left, i)
	end

	local function AddBuyItem(parent, i)
		local panel = vgui.Create("DPanel", parent)
		panel:SetTall(TFScreenScale(40))
		local button
		panel.Paint = function(self)
			surface.SetDrawColor(clr3)
			surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
			surface.SetDrawColor(50, 50, 50, 255)
			surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall())
			draw.SimpleText(TrueFishGetGearName(i), "FishingSS6", self:GetWide()*0.5, 0, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
			local bX, bY = button:GetPos()
			draw.SimpleText(TrueFishLocal("price_txt", TrueFish.GEAR_PRICE[i]), "FishingSS6", bX + button:GetWide()*0.5, self:GetTall()*0.5, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		
		local modelIcon = CreateModelPanel(panel, TrueFishGetGearModel(i), TrueFishGetGearMaterial(i), i)
		modelIcon:SetDirectionalLight( BOX_TOP, Color( 255, 255, 255 ) )
		modelIcon:SetDirectionalLight( BOX_FRONT, Color( 0, 0, 0 ) )
		
		button = vgui.Create("DButton", panel)
		button:SetSize(parent:GetWide() * 0.7, TFScreenScale(10))
		button:SetFont("FishingSS6")
		button:SetText(TrueFishLocal("purchase_txt"))
		button:SetColor(Color(250, 250, 250, 255))
		button:SetPos(parent:GetWide()-button:GetWide()-25, panel:GetTall()-button:GetTall()-5)
		button.Paint = function(self)
			surface.SetDrawColor(self.Hovered and clr1 or clr2)
			surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
			surface.SetDrawColor(clr6)
			surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall())
			surface.SetDrawColor(0, 0, 0)
			surface.DrawOutlinedRect(1, 1, self:GetWide() - 2, self:GetTall() - 2)
		end
		button.DoClick = function(self)
			net.Start("Fish_buy")
			net.WriteEntity(npc)
			net.WriteUInt(i, 6)
			net.SendToServer()
			menu:Remove()
		end
		
		/*if !TrueFish.GEAR_ENABLED[i] then // need an overlay for disabled to go over the model icon too
			local overlay = vgui.Create("DPanel", panel)
			overlay:SetSize(panel:GetSize())
			overlay.Paint = function(self)
				surface.SetDrawColor(255, 0, 0, 100)
				surface.DrawRect(1, 1, self:GetWide()-2, self:GetTall()-2)
				draw.SimpleTextOutlined("Out Of Stock", "FishingSS9", self:GetWide()*0.5, self:GetTall()*0.5, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0, 0, 0, 255))
			end
		end*/
		
		parent:AddItem(panel)
	end
	for i=1, FISH_GEAR_HIGHNUMBER do
		if !TrueFish.GEAR_ENABLED[i] then continue end
		AddBuyItem(middle, i)
	end

	local function AddYourItem(parent, i)
		local panel = vgui.Create("DPanel", parent)
		panel:SetTall(TFScreenScale(40))
		panel.Paint = function(self)
			surface.SetDrawColor(clr3)
			surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
			surface.SetDrawColor(50, 50, 50, 255)
			surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall())
			draw.SimpleText(TrueFishGetFishName(i), "FishingSS6", self:GetWide()*0.5, 0, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
			draw.SimpleText("x"..FishToSell[i], "FishingSS9", self:GetWide()-5, self:GetTall()*0.5, Color(255, 255, 255, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		end
		
		local modelIcon = CreateModelPanel(panel, TrueFishGetFishModel(i))
		
		parent:AddItem(panel)
	end
	
	if TotalSalePrice > 0 then
		for i=1, FISH_HIGHNUMBER do
			if FishToSell[i] then
				AddYourItem(right, i)
			end
		end
		
		local panel = vgui.Create("DPanel", right)
		surface.SetFont("FishingSS9_NumberFix")
		local txt = TrueFishLocal("fish_sells_for", TotalSalePrice)
		local x, y = surface.GetTextSize(txt)
		panel:SetTall(y*2+5)
		panel.Paint = function(self)
			draw.SimpleText(txt, "FishingSS9_NumberFix", self:GetWide() * 0.5, 0, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
			surface.SetDrawColor(255, 255, 255, 255)
			surface.DrawLine(self:GetWide()*0.5-x*0.5, y, self:GetWide()*0.5+x*0.5, y)
		end
		
		surface.SetFont("FishingSS9_NumberFix")
		local x, y = surface.GetTextSize(txt)
		local button = vgui.Create("DButton", panel)
		button:SetSize(right:GetWide() - 25, y)
		button:SetFont("FishingSS6")
		button:SetText(TrueFishLocal("sell_all"))
		button:SetColor(Color(250, 250, 250, 255))
		button:SetPos(right:GetWide()*0.5-button:GetWide()*0.5 - 10, panel:GetTall()-button:GetTall())
		button.Paint = function(self)
			surface.SetDrawColor(self.Hovered and clr1 or clr2)
			surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
			surface.SetDrawColor(clr6)
			surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall())
			surface.SetDrawColor(0, 0, 0)
			surface.DrawOutlinedRect(1, 1, self:GetWide() - 2, self:GetTall() - 2)
		end
		button.DoClick = function(self)
			net.Start("Fish_sell")
			net.WriteEntity(npc)
			net.SendToServer()
			menu:Remove()
		end
		right:AddItem(panel)
	end


end
//FishNPCMenu()
net.Receive("FishNPCMenu", FishNPCMenu)

--PATH addons/111mod/lua/autorun/client/cl_ispawn.lua:
concommand.Add( "player_position", function( ply, cmd, args )
	chat.AddText( Color( 255, 255, 255 ), "Ваша позиция была скопирована. CTRL+V,чтобы вставить")
	SetClipboardText(("Vector(%s)"):format(string.gsub(tostring(ply:GetPos())," ", ",")))
end )
--PATH addons/unbox/lua/unbox/modelpanel.lua:
local GenerateOutline = (...).outline
local FixCam = (...).cam
local itemBackgroundMat = (...).mat1
local moneyIcon = (...).mat2
local ModelPanel = {}
ModelPanel.Base = "EditablePanel"

function ModelPanel:Init()
    self:SetCursor"hand"
end

function ModelPanel:OnMouseReleased()
    if self.DoClick and not BUC2.buttonsLocked then
        self:DoClick()
    end
end

function ModelPanel:Paint(w, h)
    if not self.OutlineTop then
        GenerateOutline(self)
    end

    local bc = self.item.color
    surface.SetDrawColor(bc)
    surface.SetMaterial(itemBackgroundMat)
    surface.DrawTexturedRect(0, 0, w, h)

    if self.item.itemType == "Money" or self.item.itemType == "Group" then
        surface.SetDrawColor(255, 255, 255, 255)
        surface.SetMaterial(moneyIcon)
        surface.DrawTexturedRect(10, 10, 80, 80)
    end

    draw.NoTexture()
    surface.DrawPoly(self.OutlineTop)
    surface.DrawPoly(self.OutlineBottom)

    if IsValid(self.mod) then
        self.mod:PaintManual()
    end

    draw.SimpleText(self.item.name1, "ub2_7", w / 2, h - 4, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
end

function ModelPanel:Set(v)
    -- change item
    if IsValid(self.mod) then
        self.mod:Remove()
    end

    self.item = BUC2.ITEMS[v]

    if self.item.itemType == "Weapon" then
        local tmod = vgui.Create("DModelPanel", self)
        tmod:SetMouseInputEnabled(false)
        tmod:Dock(FILL)
        tmod:SetPaintedManually(true)

        if self.item.itemType == "Weapon" then
            tmod:SetModel(self.item.model)
            tmod:SetAnimated(false)
            tmod.ang = tmod.Entity:GetAngles()

            function tmod:LayoutEntity(Entity)
                if (self.bAnimated) then
                    self:RunAnimation()
                end
            end

            FixCam(tmod)
        end

        self.mod = tmod
    end
end

return ModelPanel
--PATH addons/executioner/lua/autorun/client/executioner_graphics.lua:
if not Graphics then Graphics = {} end

function Graphics.DrawRect( x, y, w, h, col )
    surface.SetDrawColor( col )
    surface.DrawRect( x, y, w, h )
end

function Graphics.DrawText( msg, fnt, x, y, c, align )
    draw.SimpleText( msg, fnt, x, y, c, align and align or TEXT_ALIGN_CENTER )
end

function Graphics.DrawOutline( x, y, w, h, t, c )
    surface.SetDrawColor( c )
    for i = 0, t - 1 do
        surface.DrawOutlinedRect( x + i, y + i, w - i * 2, h - i * 2 )
    end
end

function Graphics.PlaySequence( parent, id )
    local model_entity = parent:GetEntity()
    local sequence = model_entity:LookupSequence( id )
    model_entity:SetSequence( sequence )
end

function Graphics.DrawRoundedBox( rad, x, y, w, h, col )
    draw.RoundedBox( rad, x, y, w, h, col )
end

function Graphics.GenerateScreenBlur( parent, startTime ) Derma_DrawBackgroundBlur( parent, startTime ) end

function Graphics.CreateIconObject( self, icon, x, y, w, h, button )
    local image = vgui.Create( button and 'DImageButton' or 'DImage', self )
    image:SetSize( w, h )
    image:SetPos( x, y )
    image:SetMaterial( icon )
    --image:SetKeepAspect( true )
    if not button then return image end
    image.Paint = function( me ) me:SetColor( me:IsHovered() and Color( 230, 32, 25 ) or Color( 255, 255, 255 ) ) end
    image.DoClick = function() self:SetVisible( false ) end
end

function Graphics.PaintBar( parent, base_color, switch_color, bar_color )
    if not parent.VBar then print( 'No VBar found.' ) return end
    parent.VBar.Paint = function( me, w, h ) Graphics.DrawRect( 0, 0, w, h, base_color ) end
    parent.VBar.btnUp.Paint = function( me, w, h ) Graphics.DrawRect( 0, 0, w, h, switch_color ) end
    parent.VBar.btnDown.Paint = function( me, w, h ) Graphics.DrawRect( 0, 0, w, h, switch_color ) end
    parent.VBar.btnGrip.Paint = function( me, w, h ) Graphics.DrawRect( 0, 0, w, h, bar_color ) end
end

local blur = Material( "pp/blurscreen" )
function Graphics.BlurMenu( panel, layers, density, alpha )
    -- Its a scientifically proven fact that blur improves a script
    local x, y = panel:LocalToScreen( 0, 0 )

    surface.SetDrawColor( 255, 255, 255, alpha )
    surface.SetMaterial( blur )

    for i = 1, 3 do
        blur:SetFloat( "$blur", ( i / layers ) * density )
        blur:Recompute()

        render.UpdateScreenEffectTexture()
        surface.DrawTexturedRect( -x, -y, ScrW(), ScrH() )
    end
end

--PATH lua/autorun/client/infospawn_2.lua:
surface.CreateFont("Table35", {
	size = 45,
	weight = 1000,
	antialias = true,
	shadow = false,
	font = "Tahoma",
})	

local math_Sin = math.sin

local function Draw1()

	if LocalPlayer():GetPos():Distance(Vector( 898.456970, -2781.719238, 128.031250 )) < 590 then
		cam.Start3D2D( Vector(985.232605, -3004.661865, 192.318848), Angle(0,180,90), 0.2 )
			local col = (math_Sin(CurTime()) + 1) / 2
		
			draw.RoundedBox(0,0,0,900,480,Color(0,0,0,180))
			draw.RoundedBox(0,0,25,900,75,Color(60,60,60,255))
				
			surface.SetDrawColor(Color(60,90,255))
			surface.DrawOutlinedRect(0,25,900,75)
				
			surface.SetDrawColor(Color(255,255,255))
			surface.DrawOutlinedRect(-1,-1,902,482)
				
			draw.SimpleTextOutlined("Приветствуем вас на", "Table35", 450, 40, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER,1,Color(0,0,0))
			draw.SimpleTextOutlined("GambitRP", "Table35", 450, 75, Color(col * 255, 255, 255 - (col * 255)), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER,1,Color(0,0,0))
			
			draw.SimpleTextOutlined("Маленькая информация", "Table35", 450, 120, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER,1,Color(0,0,0))
			
			draw.SimpleTextOutlined("Правила - F4", "Table35", 220, 180, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER,1,Color(0,0,0))
			draw.SimpleTextOutlined("Позвать админа - @ [Текст]", "Table35", 630, 180, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER,1,Color(0,0,0))
			
			draw.SimpleTextOutlined("Донат - F4", "Table35", 250, 280, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER,1,Color(0,0,0))
			draw.SimpleTextOutlined("Организации - !orgmenu", "Table35", 660, 280, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER,1,Color(0,0,0))
			
			
			surface.SetDrawColor(Color(255,255,255))
			surface.DrawOutlinedRect(0,360,900,50)
			
			
			draw.SimpleTextOutlined("Онлайн - "..#player.GetAll().." человек", "Table35", 450, 380, Color(255,60,60,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER,1,Color(0,0,0))
			draw.SimpleTextOutlined("Тестовый VIP - Напиши в чат !vip", "Table35", 450, 450, Color(0,180,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER,1,Color(0,0,0))
		cam.End3D2D()
	end 
end

hook.Add( 'PostDrawTranslucentRenderables', 'Lol11112', Draw1 )

--PATH addons/scoreboard/lua/autorun/client/settings.lua:

Relax = {}
Relax.Ranks = {}
Relax.Ranks["superadmin"] = {"Создатель-Сервера", Color(255, 30, 30), "icon16/application_osx_terminal.png"}
Relax.Ranks["downer"] = {"Донат-Создатель", Color(255, 30, 30), "icon16/application_osx_terminal.png"}
Relax.Ranks["manager"] = {"Рук.Состав", Color(255, 80, 80), "icon16/award_star_silver_2.png"}
Relax.Ranks["overwatch"] = {"Куратор NS", Color(255, 80, 80), "icon16/award_star_silver_2.png"}
Relax.Ranks["admin_d"] = {"Донат-Администатор", Color(255, 80, 80), "icon16/award_star_silver_2.png"}
Relax.Ranks["vip"] = {"Вип", Color(255, 80, 80), "icon16/award_star_silver_2.png"}
Relax.Ranks["moderator"] = {"Модератор", Color(30, 30, 255), "icon16/shield_add.png"}
Relax.Ranks["moderator_d"] = {"Донат модератор", Color(255, 155, 55), "icon16/award_star_gold_2.png"}
Relax.Ranks["NS-moder"] = {"Наборный модератор", Color(30, 30, 255), "icon16/shield_add.png"}
Relax.Ranks["sponsor"] = {"Спонсор", Color(30, 30, 255), "icon16/shield_add.png"}
Relax.Ranks["padmin"] = {"Донат админ", Color(30, 30, 255), "icon16/shield_add.png"}
Relax.Ranks["NS-admin"] = {"Наборный администратор", Color(255, 155, 55), "icon16/award_star_silver_2.png"}
Relax.Ranks["NS-helper"] = {"Хелпер", Color(255, 155, 55), "icon16/award_star_silver_2.png"}
Relax.Ranks["moder"] = {"донат модератор", Color(30, 30, 255), "icon16/shield_add.png"}
Relax.Ranks["dsuperadmin"] = {"Донат-Владелец", Color(30, 30, 255), "icon16/shield_add.png"}
Relax.Ranks["NS-trainee"] = {"Стажер", Color(30, 30, 255), "icon16/shield_add.png"}
Relax.Ranks["NS-mlmoder"] = {"Наборный Мл.Модератор", Color(30, 30, 255), "icon16/shield_add.png"}
Relax.Ranks["NS-mladmin"] = {"Наборный мл.администратор", Color(255, 155, 55), "icon16/award_star_silver_2.png"}
Relax.Ranks["NS-zammanager"] = {"Зам.Рук.Состава", Color(255, 80, 80), "icon16/award_star_silver_2.png"}
Relax.Ranks["NS-assistant"] = {"Ассистент", Color(255, 155, 55), "icon16/award_star_silver_2.png"}
Relax.Ranks["uprav"] = {"Управляющий", Color(255, 155, 55), "icon16/application_osx_terminal.png"}

Relax.Servername = "Servername"

buttons = {}

table.insert( buttons, { Title = "Открыть профиль", Func = function( pl ) pl:ShowProfile() end } )

--PATH gamemodes/darkrp/gamemode/modules/positions/sh_commands.lua:
local plyMeta = FindMetaTable("Player")

DarkRP.declareChatCommand{
    command = "setspawn",
    description = "Reset the spawn position for some job and place a new one at your position (use the command name of the job as argument)",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "addspawn",
    description = "Add a spawn position for some job (use the command name of the job as argument)",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "removespawn",
    description = "Remove a spawn position for some job (use the command name of the job as argument)",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "jailpos",
    description = "Reset jail positions and create a new one at your position.",
    delay = 1.5,
    condition = fn.FAnd{plyMeta.isChief, fn.Compose{fn.Curry(fn.GetValue, 2)("chiefjailpos"), fn.Curry(fn.GetValue, 2)("Config"), gmod.GetGamemode}}
}

DarkRP.declareChatCommand{
    command = "setjailpos",
    description = "Reset jail positions and create a new one at your position.",
    delay = 1.5,
    condition = fn.FAnd{plyMeta.isChief, fn.Compose{fn.Curry(fn.GetValue, 2)("chiefjailpos"), fn.Curry(fn.GetValue, 2)("Config"), gmod.GetGamemode}}
}

DarkRP.declareChatCommand{
    command = "addjailpos",
    description = "Add a jail position where you're standing.",
    delay = 1.5,
    condition = fn.FAnd{plyMeta.isChief, fn.Compose{fn.Curry(fn.GetValue, 2)("chiefjailpos"), fn.Curry(fn.GetValue, 2)("Config"), gmod.GetGamemode}}
}

--PATH gamemodes/darkrp/gamemode/modules/chat/sh_chatcommands.lua:
local plyMeta = FindMetaTable("Player")
DarkRP.chatCommands = DarkRP.chatCommands or {}

local validChatCommand = {
    command = isstring,
    description = isstring,
    condition = fn.FOr{fn.Curry(fn.Eq, 2)(nil), isfunction},
    delay = isnumber,
    tableArgs = fn.FOr{fn.Curry(fn.Eq, 2)(nil), isbool},
}

local checkChatCommand = function(tbl)
    for k in pairs(validChatCommand) do
        if not validChatCommand[k](tbl[k]) then
            return false, k
        end
    end
    return true
end

function DarkRP.declareChatCommand(tbl)
    local valid, element = checkChatCommand(tbl)
    if not valid then
        DarkRP.error("Incorrect chat command! " .. element .. " is invalid!", 2)
    end

    tbl.command = string.lower(tbl.command)
    DarkRP.chatCommands[tbl.command] = DarkRP.chatCommands[tbl.command] or tbl
    for k, v in pairs(tbl) do
        DarkRP.chatCommands[tbl.command][k] = v
    end
end

function DarkRP.removeChatCommand(command)
    DarkRP.chatCommands[string.lower(command)] = nil
end

function DarkRP.chatCommandAlias(command, ...)
    local name
    for k, v in pairs{...} do
        name = string.lower(v)

        DarkRP.chatCommands[name] = {command = name}
        setmetatable(DarkRP.chatCommands[name], {
            __index = DarkRP.chatCommands[command]
        })
    end
end

function DarkRP.getChatCommand(command)
    return DarkRP.chatCommands[string.lower(command)]
end

function DarkRP.getChatCommands()
    return DarkRP.chatCommands
end

function DarkRP.getSortedChatCommands()
    local tbl = fn.Compose{table.ClearKeys, table.Copy, DarkRP.getChatCommands}()
    table.SortByMember(tbl, "command", true)

    return tbl
end

-- chat commands that have been defined, but not declared
DarkRP.getIncompleteChatCommands = fn.Curry(fn.Filter, 3)(fn.Compose{fn.Not, checkChatCommand})(DarkRP.chatCommands)

--[[---------------------------------------------------------------------------
Chat commands
---------------------------------------------------------------------------]]
DarkRP.declareChatCommand{
    command = "pm",
    description = "Send a private message to someone.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "w",
    description = "Say something in whisper voice.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "y",
    description = "Yell something out loud.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "me",
    description = "Chat roleplay to say you're doing things that you can't show otherwise.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "/",
    description = "Global server chat.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "a",
    description = "Global server chat.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "ooc",
    description = "Global server chat.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "broadcast",
    description = "Broadcast something as a mayor.",
    delay = 1.5,
    condition = plyMeta.isMayor
}

DarkRP.declareChatCommand{
    command = "channel",
    description = "Tune into a radio channel.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "radio",
    description = "Say something through the radio.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "g",
    description = "Group chat.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "credits",
    description = "Send the DarkRP credits to someone.",
    delay = 1.5
}

--PATH gamemodes/darkrp/gamemode/modules/base/cl_entityvars.lua:
local DarkRPVars = {}

--[[---------------------------------------------------------------------------
interface"someString"
---------------------------------------------------------------------------]]
local pmeta = FindMetaTable("Player")
-- This function is made local to optimise getDarkRPVar, which is called often
-- enough to warrant optimizing. See https://github.com/FPtje/DarkRP/pull/3212
local get_user_id = pmeta.UserID
function pmeta:getDarkRPVar(var)
    local vars = DarkRPVars[get_user_id(self)]
    if vars == nil then return nil end
    return vars[var]
end

--[[---------------------------------------------------------------------------
Retrieve the information of a player var
---------------------------------------------------------------------------]]
local function RetrievePlayerVar(userID, var, value)
    local ply = Player(userID)
    DarkRPVars[userID] = DarkRPVars[userID] or {}

    hook.Call("DarkRPVarChanged", nil, ply, var, DarkRPVars[userID][var], value)
    DarkRPVars[userID][var] = value

    -- Backwards compatibility
    if IsValid(ply) then
        ply.DarkRPVars = DarkRPVars[userID]
    end
end

--[[---------------------------------------------------------------------------
Retrieve a player var.
Read the usermessage and attempt to set the DarkRP var
---------------------------------------------------------------------------]]
local function doRetrieve()
    local userID = net.ReadUInt(16)
    local var, value = DarkRP.readNetDarkRPVar()

    RetrievePlayerVar(userID, var, value)
end
net.Receive("DarkRP_PlayerVar", doRetrieve)

--[[---------------------------------------------------------------------------
Retrieve the message to remove a DarkRPVar
---------------------------------------------------------------------------]]
local function doRetrieveRemoval()
    local userID = net.ReadUInt(16)
    local vars = DarkRPVars[userID] or {}
    local var = DarkRP.readNetDarkRPVarRemoval()
    local ply = Player(userID)

    hook.Call("DarkRPVarChanged", nil, ply, var, vars[var], nil)

    vars[var] = nil
end
net.Receive("DarkRP_PlayerVarRemoval", doRetrieveRemoval)

--[[---------------------------------------------------------------------------
Initialize the DarkRPVars at the start of the game
---------------------------------------------------------------------------]]
local function InitializeDarkRPVars(len)
    local plyCount = net.ReadUInt(8)

    for i = 1, plyCount, 1 do
        local userID = net.ReadUInt(16)
        local varCount = net.ReadUInt(DarkRP.DARKRP_ID_BITS + 2)

        for j = 1, varCount, 1 do
            local var, value = DarkRP.readNetDarkRPVar()
            RetrievePlayerVar(userID, var, value)
        end
    end
end
net.Receive("DarkRP_InitializeVars", InitializeDarkRPVars)
timer.Simple(0, fp{RunConsoleCommand, "_sendDarkRPvars"})

net.Receive("DarkRP_DarkRPVarDisconnect", function(len)
    local userID = net.ReadUInt(16)
    DarkRPVars[userID] = nil
end)

--[[---------------------------------------------------------------------------
Request the DarkRPVars when they haven't arrived
---------------------------------------------------------------------------]]
timer.Create("DarkRPCheckifitcamethrough", 15, 0, function()
    for _, v in player.Iterator() do
        if v:getDarkRPVar("rpname") then continue end

        RunConsoleCommand("_sendDarkRPvars")
        return
    end

    timer.Remove("DarkRPCheckifitcamethrough")
end)

--PATH gamemodes/darkrp/gamemode/modules/base/cl_drawfunctions.lua:
-- concatenate a space to avoid the text being parsed as valve string
local function safeText(text)
    return string.match(text, "^#([a-zA-Z_]+)$") and text .. " " or text
end

DarkRP.deLocalise = safeText

function draw.DrawNonParsedText(text, font, x, y, color, xAlign)
    return draw.DrawText(safeText(text), font, x, y, color, xAlign)
end

function draw.DrawNonParsedSimpleText(text, font, x, y, color, xAlign, yAlign)
    return draw.SimpleText(safeText(text), font, x, y, color, xAlign, yAlign)
end

function draw.DrawNonParsedSimpleTextOutlined(text, font, x, y, color, xAlign, yAlign, outlineWidth, outlineColor)
    return draw.SimpleTextOutlined(safeText(text), font, x, y, color, xAlign, yAlign, outlineWidth, outlineColor)
end

function surface.DrawNonParsedText(text)
    return surface.DrawText(safeText(text))
end

function chat.AddNonParsedText(...)
    local tbl = {...}
    for i = 2, #tbl, 2 do
        tbl[i] = safeText(tbl[i])
    end
    return chat.AddText(unpack(tbl))
end

--PATH addons/zeros_methlab2/lua/darkrp_modules/zmlab2/sh_zmlab2_darkrp.lua:
timer.Simple( 3, function() 
TEAM_ZMLAB2_COOK = DarkRP.createJob("Варщик мета", {
	color = Color(3, 166, 226, 255),
	model = {"models/walterwhite/Playermodels/walterwhitechem.mdl"},
	description = [[
	✔ Описание:
	● Вы Варщик мета!
	● Варите мет и продавайте его барыге]],
    weapons = {"weapon_fists","passrus"},
	command = "zmlab2_MethCook",
	max = 4,
	salary = 100,
	admin = 0,
	vote = false,
	category = "  Криминал",
	hasLicense = false
})

	DarkRP.createCategory{
		name = "Для метоварщика",
		categorises = "entities",
		startExpanded = true,
		color = Color(0, 125, 255, 255),
		canSee = function(ply) return true end,
		sortOrder = 103
	}

	DarkRP.createEntity("Комплект для палатки", {
		ent = "zmlab2_tent",
		model = "models/zerochain/props_methlab/zmlab2_tentkit.mdl",
		price = 300,
		max = 1,
		cmd = "buytent",
		allowTools = true,
		allowed = TEAM_ZMLAB2_COOK,
		category = "Для метоварщика"
	})

	DarkRP.createEntity("Ящик для оборудования", {
		ent = "zmlab2_equipment",
		model = "models/zerochain/props_methlab/zmlab2_chest.mdl",
		price = 300,
		max = 1,
		cmd = "buyequipment",
		allowed = TEAM_ZMLAB2_COOK,
		category = "Для метоварщика"
	})

end )

// Below is all the other stuff that usally gets bought via the Equipment / Storage Entity

/*
DarkRP.createEntity("Palette", {
	ent = "zmlab2_item_palette",
	model = "models/zerochain/props_methlab/zmlab2_palette.mdl",
	price = 1000,
	max = 1,
	cmd = "buyPalette",
	allowed = TEAM_ZMLAB2_COOK,
	category = "Для метоварщика"
})

DarkRP.createEntity("Automatic Icebreaker", {
	ent = "zmlab2_item_autobreaker",
	description = "Upgrades the packing table to automaticly cracks and packs ice.",
	model = "models/zerochain/props_methlab/zmlab2_autobreaker.mdl",
	price = 5000,
	max = 1,
	cmd = "buyautobreaker",
	allowed = TEAM_ZMLAB2_COOK,
	category = "Для метоварщика"
})

DarkRP.createEntity("Acid", {
	ent = "zmlab2_item_acid",
	model = "models/zerochain/props_methlab/zmlab2_acid.mdl",
	price = 1000,
	max = 6,
	cmd = "buyAcid",
	allowed = TEAM_ZMLAB2_COOK,
	category = "Для метоварщика"
})

DarkRP.createEntity("Aluminum", {
	ent = "zmlab2_item_aluminium",
	model = "models/zerochain/props_methlab/zmlab2_aluminium.mdl",
	price = 1000,
	max = 6,
	cmd = "buyAluminium",
	allowed = TEAM_ZMLAB2_COOK,
	category = "Для метоварщика"
})

DarkRP.createEntity("Liquid Oxygen", {
	ent = "zmlab2_item_lox",
	model = "models/zerochain/props_methlab/zmlab2_lox.mdl",
	price = 1000,
	max = 6,
	cmd = "buylox",
	allowed = TEAM_ZMLAB2_COOK,
	category = "Для метоварщика"
})

DarkRP.createEntity("Methylamine", {
	ent = "zmlab2_item_methylamine",
	model = "models/zerochain/props_methlab/zmlab2_methylamine.mdl",
	price = 1000,
	max = 6,
	cmd = "buyMethylamine",
	allowed = TEAM_ZMLAB2_COOK,
	category = "Для метоварщика"
})

DarkRP.createEntity("Filler", {
	ent = "zmlab2_machine_filler",
	model = "models/zerochain/props_methlab/zmlab2_filler.mdl",
	price = 1000,
	max = 1,
	cmd = "buyfiller",
	allowed = TEAM_ZMLAB2_COOK,
	category = "Для метоварщика"
})

DarkRP.createEntity("Filter", {
	ent = "zmlab2_machine_filter",
	model = "models/zerochain/props_methlab/zmlab2_filter.mdl",
	price = 1000,
	max = 1,
	cmd = "buyFilter",
	allowed = TEAM_ZMLAB2_COOK,
	category = "Для метоварщика"
})

DarkRP.createEntity("Frezzer", {
	ent = "zmlab2_machine_frezzer",
	model = "models/zerochain/props_methlab/zmlab2_frezzer.mdl",
	price = 1000,
	max = 1,
	cmd = "buyFrezzer",
	allowed = TEAM_ZMLAB2_COOK,
	category = "Для метоварщика"
})

DarkRP.createEntity("Furnace", {
	ent = "zmlab2_machine_furnace",
	model = "models/zerochain/props_methlab/zmlab2_furnance.mdl",
	price = 1000,
	max = 1,
	cmd = "buyFurnace",
	allowed = TEAM_ZMLAB2_COOK,
	category = "Для метоварщика"
})

DarkRP.createEntity("Mixer", {
	ent = "zmlab2_machine_mixer",
	model = "models/zerochain/props_methlab/zmlab2_mixer.mdl",
	price = 1000,
	max = 1,
	cmd = "buyMixer",
	allowed = TEAM_ZMLAB2_COOK,
	category = "Для метоварщика"
})

DarkRP.createEntity("Ventilation", {
	ent = "zmlab2_machine_ventilation",
	model = "models/zerochain/props_methlab/zmlab2_ventilation.mdl",
	price = 1000,
	max = 1,
	cmd = "buyVentilation",
	allowed = TEAM_ZMLAB2_COOK,
	category = "Для метоварщика"
})

DarkRP.createEntity("Storage", {
	ent = "zmlab2_storage",
	model = "models/zerochain/props_methlab/zmlab2_storage.mdl",
	price = 1000,
	max = 1,
	cmd = "buyStorage",
	allowed = TEAM_ZMLAB2_COOK,
	category = "Для метоварщика"
})

DarkRP.createEntity("Packing Table", {
	ent = "zmlab2_table",
	model = "models/zerochain/props_methlab/zmlab2_table.mdl",
	price = 1000,
	max = 1,
	cmd = "buyTable",
	allowed = TEAM_ZMLAB2_COOK,
	category = "Для метоварщика"
})
*/

--PATH addons/111mod/lua/darkrp_modules/ws/cl_weaponselector.lua:
surface.CreateFont("FlameUI.WeaposSelector_TAB", {
    size = ScreenScale(10),
    weight = 1000 ,
    antialias = true,
    extended = true,
    font = "PT Root UI Bold"
})

surface.CreateFont("FlameUI.WeaposSelector", {
    size = ScreenScale(8),
    weight = 350 ,
    antialias = true,
    extended = true,
    font = "PT Root UI Bold"
})

function frametext(text, font, x, y, color, x_a, y_a, color_shadow)
    color_shadow = color_shadow or Color(0, 0, 0)
    draw.SimpleText(text, font, x + 1, y + 1, color_shadow, x_a, y_a)
    local w,h = draw.SimpleText(text, font, x, y, color, x_a, y_a)
    return w,h
end

local categories = {'Строительство', 'Roleplay', 'Оружие', 'Другое', 'Ножи', 'Вейпы'}

local weaponMap = {
    weapon_physgun = {
        Name = 'Физган',
        Slot = 1
    },
    weapon_physcannon = {
        Name = 'Грави пушка',
        Slot = 1
    },
    weapon_fists = {
        Name = 'Кулаки',
        Slot = 2
    },
    gmod_tool = {
        Name = 'Тулган',
        Slot = 1
    },
    weapon_rpg = {
        Name = 'RPG',
        Slot = 3
    },
    weapon_crossbow = {
        Name = 'Арбалет',
        Slot = 3
    },
    weapon_crowbar = {
        Name = 'Лом',
        Slot = 3
    },
    weapon_slam = {
        Name = 'SLAM',
        Slot = 3
    },
    weapon_stunstick = {
        Name = 'Дубинка',
        Slot = 4
    },
    stun_baton = {
        Slot = 4
    },
    arrest_baton = {
        Slot = 4
    },
    door_ram = {
        Slot = 4
    },
    unarrest_baton = {
        Slot = 4
    },
    weapon_taser = {
        Slot = 3
    },
    weaponchecker = {
        Slot = 2
    },
    weapon_pimphand = {
        Slot = 4
    },
    weapon_burgatron = {
        Slot = 4
    },
    weapon_ak47_phoen = {
        Slot = 3
    },
    awpdragon = {
        Slot = 3
    },
    weapon_plasmapistol = {
        Slot = 3
    }
}


local function getWeaponSlot(wep)

    if string.sub(wep:GetClass(),1,3) == "m9k" then
        return 3
    end

    if string.sub(wep:GetClass(),1,4) == "csgo" or string.sub(wep:GetClass(), #wep:GetClass() - 4, #wep:GetClass()) == "ghost" then
        return 5
    end

    if string.sub(wep:GetClass(),1,11) == "weapon_cuff" then
        return 2
    end

    if string.sub(wep:GetClass(),1,11) == "weapon_vape" then
        return 6
    end

    if (wep.GetSwitcherSlot) then
        wep.Slot = wep:GetSwitcherSlot()
    end

    local map = weaponMap[wep:GetClass()]

    return (map and map.Slot) or (wep.Slot and math.Clamp(wep.Slot, 2, 4)) or 2
end

local wepsCache = {}
local weaponsByCategory = {}
local weaponsByOrder = {}
local weaponsByClass = {}
local selectedWeapon = -1
local lastCache = CurTime()

local function ensureWeapons(force)
    local weps = LocalPlayer():GetWeapons()

    if (lastCache <= CurTime() or force) then
        wepsCache = weps
        table.Empty(weaponsByCategory)
        table.Empty(weaponsByOrder)
        table.Empty(weaponsByClass)

        for k, cat in ipairs(categories) do
            local wepSlot = k
            weaponsByCategory[wepSlot] = {}

            for _, wep in pairs(weps) do
                if (getWeaponSlot(wep) == wepSlot) then
                    local ind = table.insert(weaponsByCategory[wepSlot], {
                        ID = #weaponsByOrder + 1,
                        Class = wep:GetClass(),
                        Name = (weaponMap[wep:GetClass()] and weaponMap[wep:GetClass()].Name) or wep.PrintName or wep:GetClass()
                    })

                    weaponsByOrder[#weaponsByOrder + 1] = weaponsByCategory[wepSlot][ind]
                    weaponsByClass[wep:GetClass()] = weaponsByCategory[wepSlot][ind]
                end
            end
        end
    end

    if (selectedWeapon == 0 and IsValid(LocalPlayer():GetActiveWeapon()) and weaponsByClass[LocalPlayer():GetActiveWeapon():GetClass()]) then
        selectedWeapon = weaponsByClass[LocalPlayer():GetActiveWeapon():GetClass()].ID
    end

    lastCache = CurTime() + 0.25
end

local showTime = 0
local fadeTime = 0

local w, h = ScrW()*.12, 35
hook.Add("HUDPaint", "FlameRP.WeaposSelector",function()
    local st = SysTime()

    if (showTime + 0.25 <= st) then return end
    ensureWeapons()
    local a
    if (showTime <= st) then
       a = Lerp((st - showTime) / 0.1, 255, 0)
    else
        a = Lerp((st - fadeTime) / 0.1, 0, 255)
    end

    local not_clear_cat = 0
    for k, cat in ipairs(categories) do
        if not weaponsByCategory[k] then continue end
        if #weaponsByCategory[k] < 1 then continue end

        not_clear_cat = not_clear_cat  +1
    end

    local x, y = (ScrW() - not_clear_cat * (w + 3)) * 0.5, 35

    local last_checked = 0
    for k, cat in ipairs(categories) do
        if table.Count(weaponsByCategory[k]) < 1 then continue end
        last_checked = last_checked + 1

        local x, y = x + ((last_checked - 1) * (w + 3)), y
        local wepSlot = k
        DrawBox(x, y, w, h, Color(55,55,55,a), Color(0,0,0,a))
        frametext(wepSlot .. '. ' .. cat, 'FlameUI.WeaposSelector_TAB', x + (w * 0.5), y + (h * 0.5), Color(255,255,255,a), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, Color(0,0,0,a))

        for i, wep in ipairs(weaponsByCategory[wepSlot]) do
            local y = y + (i * (h + 3))
            DrawBox(x, y, w, h, Color(20,20,20,math.max(a - 105, 0)), Color(0,0,0,a))

            if (wep.ID == selectedWeapon) then
                DrawBox(x, y, w, h, Color(55,55,55,a), Color(0,0,0,a))
            elseif IsValid(LocalPlayer():GetActiveWeapon()) and wep and weaponsByClass[LocalPlayer():GetActiveWeapon():GetClass()] and wep.ID == weaponsByClass[LocalPlayer():GetActiveWeapon():GetClass()].ID then
                DrawBox(x, y, w, h, Color(20,20,20,math.max(a - 105, 0)), Color(0,0,0,a))
            end

            frametext(wep.Name, 'FlameUI.WeaposSelector', x + (w * 0.5), y + (h * 0.5), Color(255,255,255,a), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, Color(0,0,0,a))
        end
    end
end)

local lastSnd = 0

hook.Add('PlayerBindPress', 'rp.wepswitch.PlayerBindPress', function(pl, bind, pressed)
    if (not pressed) then return end
    if (not LocalPlayer():Alive()) then return end
    if (not IsValid(LocalPlayer():GetActiveWeapon())) then 
        if table.Count(LocalPlayer():GetWeapons()) > 1 then
            RunConsoleCommand("use", table.Random(LocalPlayer():GetWeapons()):GetClass())
        end
        return
    end
    if (table.Count(LocalPlayer():GetWeapons()) <= 1) then return end
    local wep = pl:GetActiveWeapon()
    if IsValid(wep) and wep.SWBWeapon and wep.dt and (wep.dt.State == SWB_AIMING) and wep.AdjustableZoom then return end

    if ((bind == 'invprev') or (bind == 'invnext') or (string.sub(bind, 1, 4) == 'slot')) and (not pl:KeyDown(IN_ATTACK)) then
        if (string.sub(bind, 1, 3) == 'inv') then
            if (showTime < SysTime()) then
                ensureWeapons(true)
                selectedWeapon = weaponsByClass[LocalPlayer():GetActiveWeapon():GetClass()].ID
            end

            local scroll = (bind == 'invprev') and -1 or 1
            selectedWeapon = selectedWeapon + scroll

            if (not weaponsByOrder[selectedWeapon]) then
                selectedWeapon = (scroll == 1 and 1) or #weaponsByOrder
            end
        else -- using number keys
            if (showTime < SysTime()) then
                ensureWeapons(true)
                fadeTime = SysTime()
            end

            local slot = tonumber(string.sub(bind, -1))

            if (not categories[slot]) then return end

            if #weaponsByCategory[slot] < 1 then return end

            if (weaponsByCategory[slot][1]) then
                local found = false


                for k, v in ipairs(weaponsByCategory[slot]) do
                    if (v.ID == selectedWeapon) then
                        found = true

                        if (weaponsByCategory[slot][k + 1]) then
                            selectedWeapon = v.ID + 1
                        else
                            selectedWeapon = weaponsByCategory[slot][1].ID
                        end

                        break
                    end
                end

                if (not found) then
                    selectedWeapon = weaponsByCategory[slot][1].ID
                end
            end
        end

        ensureWeapons(true)
        showTime = SysTime() + 2

        if (lastSnd < SysTime() - 0.05) then
            surface.PlaySound("ambient/water/rain_drip1.wav")
            lastSnd = SysTime()
        end
    elseif (showTime > SysTime() and bind == '+attack') then
        if (IsValid(LocalPlayer():GetActiveWeapon()) and weaponsByOrder[selectedWeapon] and weaponsByClass[LocalPlayer():GetActiveWeapon():GetClass()] and selectedWeapon ~= weaponsByClass[LocalPlayer():GetActiveWeapon():GetClass()].ID) then
            RunConsoleCommand('use', weaponsByOrder[selectedWeapon].Class)
        end

        showTime = 0
        surface.PlaySound("ambient/water/rain_drip3.wav")

        return true
    elseif (bind == 'phys_swap') then
        showTime = 0
    end
end)
--PATH addons/111mod/lua/darkrp_modules/sit/sh_ground_sit.lua:
SitAnywhere = SitAnywhere or {}
SitAnywhere.GroundSit = true
-- Вышел отсюда розбійник

local tag = "SitGroundSitting"
local sittingCache = {}
local animCache = {}
-- Функция для обновления кеша
local function updateSittingCache()
    for _, ply in player.Iterator() do
        sittingCache[ply] = ply:GetNW2Bool(tag)
		animCache[ply] = ply:GetNW2String("SelectedAnim","pose_ducking_02")
    end
end

-- Таймер для регулярного обновления кеша каждые 1 секунд
timer.Create("UpdateSittingCacheTimer", 1, 0, updateSittingCache)

hook.Add("SetupMove", tag, function(ply, mv)
	local isSitting = sittingCache[ply]  -- Получаем состояние из кеша

    if not isSitting then return end
	
	local butts = mv:GetButtons()
	local getUp = bit.band(butts, IN_JUMP) == IN_JUMP or ply:GetMoveType() ~= MOVETYPE_WALK or ply:InVehicle() or not ply:Alive()

	if getUp then
		ply:SetNW2Bool(tag, false)
		sittingCache[ply] = false
	end

	local move = bit.band(butts, IN_DUCK) == IN_DUCK

	butts = bit.bxor(bit.bor(butts, bit.bor(IN_JUMP, IN_DUCK)), IN_JUMP)

	if move then
		butts =  bit.bxor(bit.bor(bit.bor(butts, IN_WALK), IN_SPEED), IN_SPEED)

		mv:SetButtons(butts)
		return
	end

	mv:SetButtons(butts)
	mv:SetSideSpeed(0)
	mv:SetForwardSpeed(0)
	mv:SetUpSpeed(0)
end)

-- local sequenceCache = {}

hook.Add("CalcMainActivity", tag, function(ply, vel)
	local isSitting = sittingCache[ply]
    if not isSitting then return end
    local animName = animCache[ply]  -- Получаем текущую выбранную анимацию
	
	-- sequenceCache[ply] = sequenceCache[ply] or {}
    -- if not sequenceCache[ply][animName] then
		-- print('bleat')
        -- sequenceCache[ply][animName] = ply:LookupSequence(animName)
    -- end
    -- local seq = sequenceCache[ply][animName]
	-- print(seq)
	-- print('test')
	local seq = ply:LookupSequence(animName)
	-- print(seq)
    if seq and vel:Length2DSqr() < 1 then  -- Проверяем, сидит ли игрок
        return ACT_MP_SWIM, seq
    end
end)

-- Очистка кеша при выходе игрока, чтобы избежать утечек памяти
hook.Add("PlayerDisconnected", "ClearAnimationCache", function(ply)
    -- sequenceCache[ply] = nil
	sittingCache[ply] = nil
	animCache[ply] = nil
end)

if SERVER then
	hook.Add("HandleSit","GroundSit", function(ply, dists, EyeTrace)
		if ply.IsFishing then return end
		if #dists == 0 and ply:GetInfoNum("sitting_ground_sit", 1) == 1 and ply:EyeAngles().p > 80 and not ply:IsHandcuffed() and ply:GetActiveWeapon() and ply:GetActiveWeapon():IsValid() and ply:GetActiveWeapon():GetClass() != "riot_shield" and ply:GetActiveWeapon():GetClass() != "heavy_shield" then
			local t = hook.Run("OnGroundSit", ply, EyeTrace)
			if t == false then
				return
			end

			if not ply:GetNW2Bool(tag) then
				ply:SetNW2Bool(tag, true)
				ply:SetActiveWeapon(NULL)
				ply:DoReloadEvent()
				ply.LastSit = CurTime() + 1
				return true
			end
		end
	end)

	concommand.Add("ground_sit", function(ply)
		if ply.IsFishing then return end
		if (not ply.LastSit or ply.LastSit < CurTime()) and not ply:IsHandcuffed() and ply:GetActiveWeapon() and ply:GetActiveWeapon():IsValid() and ply:GetActiveWeapon():GetClass() != "riot_shield" and ply:GetActiveWeapon():GetClass() != "heavy_shield" then
			ply:SetNW2Bool(tag, not ply:GetNW2Bool(tag))
			ply:SetActiveWeapon(NULL)
			ply:DoReloadEvent()
			ply.LastSit = CurTime() + 1
		end
	end)

	hook.Add("PlayerSwitchWeapon", "noswitchground", function(pl, old, new)
		if pl:GetNW2Bool(tag, false) and new:GetClass() ~= NULL then return true end
	end)
end


local animations = {
	"sit_zen","pose_standing_01","pose_ducking_01","pose_ducking_02","zombie_slump_idle_01","seq_cower"
}
		

if SERVER then
    util.AddNetworkString("SelectAnimation")

    net.Receive("SelectAnimation", function(len, ply)
        local animName = net.ReadString()
		if table.HasValue(animations, animName) then
			-- local seq = 232
			-- if animName == 'sit_zen' then
				-- seq = 226
			-- elseif animName == 'pose_standing_01' then
				-- seq = 227
			-- elseif animName == 'pose_ducking_01' then
				-- seq = 231
			-- elseif animName == 'pose_ducking_02' then
				-- seq = 232
			-- elseif animName == 'zombie_slump_idle_01' then
				-- seq = 460
			-- elseif animName == 'seq_cower' then
				-- seq = 233
			-- end
			
			-- local seq = ply:LookupSequence(animName)
			-- print(seq)
			-- if seq and seq > -1 then
				ply:SetNW2String("SelectedAnim", animName)  -- Сохраняем выбранную анимацию в NWString
				-- sequenceCache[ply] = sequenceCache[ply] or {}
				-- sequenceCache[ply][animName] = seq
			-- else
				-- print("Анимация не найдена: " .. animName)
			-- end
		end
    end)
end

--PATH addons/111mod/lua/darkrp_modules/sit/cl_sit.lua:
local useAlt = CreateClientConVar("sitting_use_alt",               "1.00", true, true)
local forceBinds = CreateClientConVar("sitting_force_binds",       "0", true, true)
local SittingNoAltServer = CreateConVar("sitting_force_no_alt","0", {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED})

CreateClientConVar("sitting_ground_sit",         "1.00", true, true)
CreateClientConVar("sitting_disallow_on_me",       "0.00", true, true)

local function ShouldSit(ply)
	return hook.Run("ShouldSit", ply)
end

local arrow = Material("widgets/arrow.png")


local function StartSit(trace)
	local wantedAng = nil
	local cancelled = false
	local start = CurTime()
	local ply = LocalPlayer()

	hook.Add("PostDrawOpaqueRenderables", "SitAnywhere", function(depth, skybox)
		if CurTime() - start <= 0.25 then return end
		if trace.StartPos:Distance(ply:EyePos()) > 10 then
			cancelled, wantedAng = true, nil
			hook.Remove("PostDrawOpaqueRenderables", "SitAnywhere")
			return
		end

		local traceDist, drawScale = 20, 0.1
		local vec = util.IntersectRayWithPlane(ply:EyePos(), ply:EyeAngles():Forward(), trace.HitPos, Vector(0, 0, 1))
		if not vec then
			return
		end

		local posOnPlane = WorldToLocal(vec, Angle(0, 90, 0), trace.HitPos, Angle(0, 0, 0))
		local testVec = (posOnPlane):GetNormal() * traceDist / drawScale
		local currentAng = (trace.HitPos - vec):Angle()
		wantedAng = currentAng

		if posOnPlane:Length() < 2 then
			wantedAng = nil
			return
		end

		if wantedAng then
			local goodSit = SitAnywhere.CheckValidAngForSit(trace.HitPos, trace.HitNormal:Angle(), wantedAng.y)
			if not goodSit then wantedAng = nil end
			cam.Start3D2D(trace.HitPos + Vector(0, 0, 1), Angle(0, 0, 0), 0.1)
				surface.SetDrawColor(goodSit and Color(255, 255, 255, 255) or Color(255, 0, 0, 255))
				surface.SetMaterial(arrow)
				surface.DrawTexturedRectRotated(testVec.x * 0.5, testVec.y * -0.5, 2 / drawScale, traceDist / drawScale, currentAng.y + 90)
			cam.End3D2D()
		end
	end)

	return function()
		hook.Remove("PostDrawOpaqueRenderables", "SitAnywhere")
		if cancelled then return end

		if CurTime() - start < 0.25 then
			RunConsoleCommand("sit")
			return
		end

		if wantedAng then
			net.Start("SitAnywhere")
				net.WriteInt(SitAnywhere.NET.SitWantedAng, 4)
				net.WriteFloat(wantedAng.y)
				net.WriteVector(trace.StartPos)
				net.WriteVector(trace.Normal)
			net.SendToServer()
			wantedAng = nil
		end
	end
end

local function DoSit(trace)
	if not trace.Hit then return end

	local surfaceAng = trace.HitNormal:Angle() + Angle(-270, 0, 0)

	local playerTrace = not trace.HitWorld and IsValid(trace.Entity) and trace.Entity:IsPlayer()

	local goodSit = SitAnywhere.GetAreaProfile(trace.HitPos + Vector(0, 0, 0.1), 24, true)
	if math.abs(surfaceAng.pitch) >= 15 or not goodSit or playerTrace then
		RunConsoleCommand"sit"
		return
	end

	local valid = SitAnywhere.ValidSitTrace(LocalPlayer(), trace)
	if not valid then
		return
	end

	return StartSit(trace)
end

local currSit
concommand.Add("+sit", function(ply, cmd, args)
	if currSit then return end
	if not IsValid(ply) or not ply.GetEyeTrace then return end
	currSit = DoSit(ply:GetEyeTrace())
end)

concommand.Add("-sit", function(ply, cmd, args)
	if currSit then
		currSit()
		currSit = nil
	end
end)


hook.Add("KeyPress", "SitAnywhere", function(ply, key)
	if not IsFirstTimePredicted() and not game.SinglePlayer() then return end
	if currSit then return end

	if key ~= IN_USE then return end
	local good = not useAlt:GetBool()
	local alwaysSit = ShouldSit(ply)

	if forceBinds:GetBool() then
		if useAlt:GetBool() and (input.IsKeyDown(KEY_LALT) or input.IsKeyDown(KEY_RALT)) then
			good = true
		end
	else
		if useAlt:GetBool() and ply:KeyDown(IN_WALK) then
			good = true
		end
	end

	if SittingNoAltServer:GetBool() then
		good = true
	end

	if alwaysSit == true then
		good = true
	elseif alwaysSit == false then
		good = false
	end

	if not good then return end
	local trace = LocalPlayer():GetEyeTrace()

	if trace.Hit then
		currSit = DoSit(trace)
		hook.Add("KeyRelease", "SitAnywhere", function(releasePly, releaseKey)
			if not IsFirstTimePredicted() and not game.SinglePlayer() then return end
			if ply ~= releasePly or releaseKey ~= IN_USE then return end
			hook.Remove("KeyRelease", "SitAnywhere")
			if not currSit then return end

			currSit()
			currSit = nil
		end)
	end
end)
--PATH addons/111mod/lua/darkrp_modules/police_radio/cl_p_radio.lua:
local cus_key = CreateClientConVar("policeradio_tog_key","30")
local cus_key_r = CreateClientConVar("policeradio_tog_rec_key","18")
local chat_open = false
hook.Add("StartChat","pr_onchat_open",function() chat_open = true end)
hook.Add("FinishChat","pr_onchat_close",function() chat_open = false end)

local key_pressed = false

local function HandleRadioToggle()
	if not IsValid(LocalPlayer()) then return end
	if LocalPlayer():isCP() then 
		if not key_pressed and not chat_open and not gui.IsGameUIVisible() then
			if input.IsKeyDown(cus_key:GetInt()) then
				key_pressed = true
				net.Start("police_radio_toggle")
					net.WriteBool(true)
				net.SendToServer()
			elseif input.IsKeyDown(cus_key_r:GetInt()) then
				key_pressed = true
				net.Start("police_radio_toggle")
				net.SendToServer()
			end
		else
			if not input.IsKeyDown(cus_key:GetInt()) and not input.IsKeyDown(cus_key_r:GetInt()) then
				key_pressed = false
			end
		end
	end
end

timer.Create("pr_custom_key_handling", 0.1, 0, HandleRadioToggle)

net.Receive("police_radio_toggle",function()
	local onoroff = net.ReadBool()
	if onoroff then
		local soun = net.ReadString()
		if soun and soun ~= "" then
			surface.PlaySound(soun)
		else
			surface.PlaySound("npc/metropolice/vo/off4.wav")
		end
	else
		surface.PlaySound("npc/metropolice/vo/on1.wav")
	end
end)

hook.Add("PlayerStartVoice","Police_Radio_Noise",function(ply)
	if not IsValid(ply) or not IsValid(LocalPlayer()) then return end
	if ply:getDarkRPVar("Police_Radio_Enabled") and ply:isCP() and LocalPlayer():isCP() then
		if ply == LocalPlayer() or LocalPlayer():getDarkRPVar("Police_Radio_CanHear") then
			surface.PlaySound("npc/combine_soldier/vo/on2.wav")
		end
	end
end)

hook.Add("PlayerEndVoice","Police_Radio_Noise",function(ply)
	if not IsValid(ply) or not IsValid(LocalPlayer()) then return end
	if ply:getDarkRPVar("Police_Radio_Enabled") and ply:isCP() and LocalPlayer():isCP() then
		if ply == LocalPlayer() or LocalPlayer():getDarkRPVar("Police_Radio_CanHear") then
			surface.PlaySound("npc/combine_soldier/vo/off3.wav")
		end
	end
end)

--PATH addons/111mod/lua/darkrp_modules/helecopter/cl_heli.lua:
	local Helicopta = function()
		
		local heli = GetGlobalBool( 'DarkRP_GlobalHelicopter' )
		
		if IsValid( heli ) then

			if LocalPlayer():GetPos():DistToSqr(heli:GetPos()) > 10000000 then return end
			
			local health, maxhealth = heli:GetNW2Int( 'health', HeliConfig.MaxHealth ), HeliConfig.MaxHealth
			
			health = math.Clamp( health, 0, maxhealth )
			
			local pos = heli:GetPos():ToScreen()
			
			local x, y = pos.x, pos.y
			
			local val = math.Clamp( health/maxhealth, 0, 1 )
			
			health = math.ceil( health )
				
			draw.RoundedBox( 0, x, y, 300, 50, Color( 0,0,0,140 ) )
			
			surface.SetDrawColor( 54, 54, 200 )
			surface.DrawOutlinedRect( x, y, 300, 50 )
			
			draw.DrawText( 'Здоровье вертолёта', 'Trebuchet22', x + 3, y - 2, Color( 255,54,54 ) )
			
			draw.RoundedBox( 0, x + 4, y + 20, 292, 26, Color( 0,0,0,140 ) )
			
			draw.RoundedBox( 0, x + 4, y + 20, 292*val, 26, Color( 54,54,200,140 ) )
			
			draw.DrawText( ('%s/%s'):format( health, maxhealth ), 'Trebuchet22', x + 150, y + 22, Color( 255,255,255), TEXT_ALIGN_CENTER )
			
		end
	
	end
	
	hook.Add( 'HUDPaint', 'HelicopterInfo', Helicopta )
--PATH addons/111mod/lua/darkrp_modules/gmb_fpsfix/sh_f_init.lua:
Urbanichka = {}
Urbanichka.settings = {}
Urbanichka.favourite_color = Color(152,25,29)  
Urbanichka.outlines_color = Color(0,0,0,170)  

if SERVER then
	MsgC(Color(0,255,130), "Dev начал работу!\n")
	util.AddNetworkString( "PlayerDisplayChat" )
	local PLAYER = FindMetaTable( "Player" )
	if PLAYER then
	    function PLAYER:SendMessageFD( ... )
	         local args = { ... }
	         net.Start( "PlayerDisplayChat" )
	             net.WriteTable( args )
	         net.Send( self )
	    end
	end
end

if CLIENT then
	net.Receive( "PlayerDisplayChat", function()
	    local args = net.ReadTable()
	    chat.AddText( unpack( args ) )
	end )
end

if SERVER then
	hook.Add("PlayerInitialSpawn","lastjoin",function(pl, ply) 
		local lastjoin = pl:GetPData("lastjoined") 
		if lastjoin == nil then
			for _,ply in next,player.GetHumans() do 
				ply:PlayerMsg(Color(255,255,255),pl:Nick().."("..pl:SteamID()..")",Color(80, 251, 80)," присоединился.",Color(255,255,255)," (Впервые)")
			end
		elseif lastjoin then
			for _,ply in next,player.GetHumans() do
			ply:PlayerMsg(Color(255,255,255),pl:Nick().."("..pl:SteamID()..")",Color(80, 251, 80)," присоединился.",Color(255,255,255)," (".. lastjoin .. ")")
			end
		end
		pl:SetPData("lastjoined",os.date("%d/%m/%Y %H:%M", os.time()))
	end)

	hook.Add("PlayerDisconnected","lastjoinsave",function(pl, ply)
		pl:SetPData("lastjoined",os.date("%d/%m/%Y %H:%M", os.time()))
		for _,ply in next,player.GetHumans() do 
			if ply:GetUserGroup() ~= "user" and ply:GetUserGroup() ~= "vip" then
				ply:PlayerMsg(Color(255,255,255),pl:Nick().."("..pl:SteamID()..")",Color(255, 51, 51, 255)," покинул",Color(255,255,255)," сервер.")
			end
		end
	end)
end

if SERVER then
	AddCSLuaFile()
	local PLAYER = FindMetaTable("Player")
	util.AddNetworkString( "ColoredMessage" )
	function BroadcastMsg(...)
		local args = {...}
		net.Start("ColoredMessage")
		net.WriteTable(args)
		net.Broadcast()
	end

	function PLAYER:PlayerMsg(...)
		local args = {...}
		net.Start("ColoredMessage")
		net.WriteTable(args)
		net.Send(self)
	end
elseif CLIENT then
	net.Receive("ColoredMessage",function(len) 
		local msg = net.ReadTable()
		chat.AddText(unpack(msg))
		chat.PlaySound()
	end)
end
--PATH addons/111mod/lua/darkrp_modules/cmenu/sh_properties.lua:
/* #NoSimplerr# */


properties.Add("plynickname", {
	MenuLabel = "Nickname",
	Order = 1,
	MenuIcon = "icon16/vcard.png",

	Filter = function( self, ent, ply )
		if ent:IsValid() && ent:IsPlayer() then
			self.MenuLabel = ent:Nick()
			return true
		end
	end,
	Action = function( self, ent )
		SetClipboardText(ent:Nick())
	end
})

properties.Add("givemoney", {
	MenuLabel = "Дать деньги",
	Order = 10,
	MenuIcon = "icon16/money.png",

	Filter = function( self, ent, ply )
		return IsValid( ent ) && ent:IsPlayer() && ply:GetPos():Distance(ent:GetPos()) < 200
	end,
	Action = function( self, ent )
		Derma_StringRequest("Дать деньги", "Сколько вы хотите дать?", nil, function(a)
			if !tonumber(a) then return end
			self:MsgStart()
				net.WriteEntity(ent)
				net.WriteFloat(tonumber(a))
			self:MsgEnd()
		end)
	end,
	Receive = function( self, length, ply )
		local ent = net.ReadEntity()
		local amount = net.ReadFloat()

		if !(self:Filter(ent, ply) && amount) then return end

		if !ply:canAfford(amount) then
			DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("cant_afford", ""))

			return ""
		end

		ply:addMoney(-amount)
		ent:addMoney(amount)

		DarkRP.notify(ent, 0, 4, DarkRP.getPhrase("has_given", ply:Nick(), DarkRP.formatMoney(amount)))
		DarkRP.notify(ply, 0, 4, DarkRP.getPhrase("you_gave", ent:Nick(), DarkRP.formatMoney(amount)))
	end
})
properties.Add("freezeplayer", {
	MenuLabel = "Заморозить игрока",
	Order = 30,
	MenuIcon = "icon16/status_busy.png",

	Filter = function( self, ent, ply )
		return IsValid( ent ) && ent:IsPlayer() && ULib.ucl.query( ply, "ulx freeze" )
	end,
	Action = function( self, ent )
		RunConsoleCommand("ulx","freeze",ent:Nick())
	end,
})

properties.Add("unfreezeplayer", {
	MenuLabel = "Разморозить игрока",
	Order = 40,
	MenuIcon = "icon16/user_green.png",

	Filter = function( self, ent, ply )
		return IsValid( ent ) && ent:IsPlayer() && ULib.ucl.query( ply, "ulx unfreeze" )
	end,
	Action = function( self, ent )
		RunConsoleCommand("ulx","unfreeze",ent:Nick())
	end,
})

properties.Add("kickplayer", {
	MenuLabel = "Кикнуть игрока",
	Order = 42,
	MenuIcon = "icon16/disconnect.png",

	Filter = function( self, ent, ply )
		return IsValid( ent ) && ent:IsPlayer() &&  ULib.ucl.query( ply, "ulx kick" )
	end,
	Action = function( self, ent )
		RunConsoleCommand("ulx","kick",ent:Nick())
	end,
})

properties.Add("kickplayer", {
	MenuLabel = "Кикнуть игрока",
	Order = 42,
	MenuIcon = "icon16/disconnect.png",

	Filter = function( self, ent, ply )
		return IsValid( ent ) && ent:IsPlayer() && ULib.ucl.query( ply, "ulx kick" )
	end,
	Action = function( self, ent )
		RunConsoleCommand("ulx","kick",ent:Nick())
	end,
})

properties.Add("wanted", {
	MenuLabel = "Подать в розыск",
	Order = 50,
	MenuIcon = "icon16/flag_red.png",

	Filter = function( self, ent, ply )
		return IsValid( ent ) && ent:IsPlayer() && !ent:isWanted() && GAMEMODE.CivilProtection[ply:Team()]
	end,
	Action = function( self, ent )
		Derma_StringRequest("Подать в розыск", "За что его подавать в розыск??", nil, function(a)
			RunConsoleCommand("darkrp", "wanted", ent:UserID(), a)
		end)
	end
})

properties.Add("unwanted", {
	MenuLabel = "Снять розыск",
	Order = 60,
	MenuIcon = "icon16/flag_green.png",

	Filter = function( self, ent, ply )
		return IsValid( ent ) && ent:IsPlayer() && ent:isWanted() && ply:isCP()
	end,
	Action = function( self, ent )
		RunConsoleCommand("darkrp", "unwanted", ent:UserID())
	end
})

properties.Add("warrant", {
	MenuLabel = "Запросить ордер",
	Order = 70,
	MenuIcon = "icon16/door_in.png",

	Filter = function( self, ent, ply )
		return IsValid( ent ) && ent:IsPlayer() && ply:isCP()
	end,
	Action = function( self, ent )
		Derma_StringRequest("Запросить ордер", "Что он сделал?", nil, function(a)
			RunConsoleCommand("darkrp", "warrant", ent:UserID(), a)
		end)
	end
})

properties.Add("givelicense", {
	MenuLabel = "Дать лицензию",
	Order = 80,
	MenuIcon = "icon16/page_add.png",

	Filter = function( self, ent, ply )
		local noMayorExists = fn.Compose{fn.Null, fn.Curry(fn.Filter, 2)(ply.isMayor), player.GetAll}
		local noChiefExists = fn.Compose{fn.Null, fn.Curry(fn.Filter, 2)(ply.isChief), player.GetAll}

		local canGiveLicense = fn.FOr{
			ply.isMayor, -- Mayors can hand out licenses
			fn.FAnd{ply.isChief, noMayorExists}, -- Chiefs can if there is no mayor
			fn.FAnd{ply.isCP, noChiefExists, noMayorExists} -- CP's can if there are no chiefs nor mayors
		}

		if !canGiveLicense(ply) then
			return false
		end

		return IsValid( ent ) && ent:IsPlayer() && !ent:getDarkRPVar("HasGunlicense")
	end,
	Action = function( self, ent )
		self:MsgStart()
			net.WriteEntity(ent)
		self:MsgEnd()
	end,
	Receive = function( self, length, ply )
		local ent = net.ReadEntity()

		if !(self:Filter(ent, ply)) then return end

		DarkRP.notify(ent, 0, 4, DarkRP.getPhrase("gunlicense_granted", ply:Nick(), ent:Nick()))
		DarkRP.notify(ply, 0, 4, DarkRP.getPhrase("gunlicense_granted", ply:Nick(), ent:Nick()))
		ent:setDarkRPVar("HasGunlicense", true)
	end
})

properties.Add("warrantbyprop", {
	MenuLabel = "Получить ордер на владельца пропа",
	Order = 71,
	MenuIcon = "icon16/door_in.png",

	Filter = function( self, ent, ply )
		return IsValid( ent ) && IsValid(ent:CPPIGetOwner()) && ent:CPPIGetOwner():IsPlayer() && ply:isCP()
	end,
	Action = function( self, ent )
		Derma_StringRequest("Получить ордер на владельца пропа", "Что он сделал?", nil, function(a)
			RunConsoleCommand("darkrp", "warrant", ent:CPPIGetOwner():UserID(), a)
		end)
	end
})


--PATH addons/111mod/lua/darkrp_modules/cmenu/sh_policenotify.lua:
if CLIENT then
	local popup = {}
	
	local scale = math.Clamp(ScrH() / 1080, 0.85, 1)

	popup.Fade = 0
	popup.Title = ""
	popup.Description = ""
	popup.Description2 = ""
	popup.Subtitle = ""
	popup.Fill = Color( 0, 0, 0, 220 )
	popup.Text = Color( 255, 255, 255 )
	popup.MaxAlphaFill = 180
	popup.MaxAlphaText = 255

	local function subrange(t, first, last)
		local sub = {}
		for i=first,last do
			sub[#sub + 1] = t[i]
		end
		return sub
	end
	
	surface.CreateFont( "fwejhfjhltit", {
		font = "Montserrat SemiBold", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
		size = 20 * scale,
		weight = 500,
		antialias = true,
		extended = true,
	})
	
	surface.CreateFont( "fwejhfjhl", {
		font = "Montserrat Medium", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
		size = 18 * scale,
		weight = 500,
		extended = true,
	})

	local function text_setup( text )
		local text1 = text
		local t = 0
		while surface.GetTextSize(text1)>450 do
			if text1=="" then popup.Description = "" popup.Description2 = "" return end
			text1 = string.Explode(" ", text1)
			text1 = table.concat(subrange(text1,1,table.getn(text1)-1), " ")
			if t>15 then return end
			t = t + 1
		end
		popup.Description = text1
		popup.Description2 = ""
		if t>0 then
			local text2 = string.Explode(" ",text)
			text2 = table.concat(subrange(text2, table.getn(text2)-t+1, table.getn(text2)), " ")
			-- print(text2)
			while surface.GetTextSize(text2)>450 do
				-- print(text2)
				text2 = string.Explode(" ", text2)
				text2 = table.concat(subrange(text2,1,table.getn(text2)-1), " ")
			end
			popup.Description2 = text2
		end
	end

	popup.Paint = function( self )
		if self.Fade==0 then return end
		self.Fill.a = math.min( 255*self.Fade/10, self.MaxAlphaFill )
		self.Text.a = math.min( 255*self.Fade/10, self.MaxAlphaText )
		draw.RoundedBox( 10, ScrW()*.5-250 * scale, 100 * scale, 500 * scale, self.Description!="" and (self.Description2!="" and 120 * scale or 100 * scale) or 75 * scale,  Color(45, 45, 45) )
		draw.RoundedBoxEx( 10, ScrW()*.5-250 * scale, 100 * scale, 500 * scale, 30 * scale, Color(1, 116, 222), true, true, false, false )
		-- draw.RoundedBoxEx( 0, ScrW()*.5-250 * scale, 130 * scale, 500 * scale, 1, color_white, true, true, false, false )
		draw.SimpleText( self.Title, "fwejhfjhltit", ScrW()*.5, 105 * scale, self.Text, TEXT_ALIGN_CENTER)
		draw.SimpleText( self.Subtitle, "fwejhfjhl", ScrW()*.5, 145 * scale, self.Text, TEXT_ALIGN_CENTER)
		draw.SimpleText( self.Description, "fwejhfjhl", ScrW()*.5, 170 * scale, self.Text, TEXT_ALIGN_CENTER)
		draw.SimpleText( self.Description2, "fwejhfjhl", ScrW()*.5, 222 * scale, self.Text, TEXT_ALIGN_CENTER)
	end

	popup.Tick = function( self )
		if self.Fade==0 then return end
		self.Fade = self.Fade - 1 
	end
	
	hook.Add("HUDPaint", "PopupPaint", function() popup:Paint() end)
	
	timer.Create( "PopupTick", .05, 0, function() popup:Tick() end )
	
	net.Receive( "popup_message_blur", function(l,ply)
		popup.Title = net.ReadString()
		popup.Subtitle = net.ReadString()
		text_setup(net.ReadString())
		popup.Fade = 50
	end)
else
	util.AddNetworkString( "popup_message_blur" )
	function sendPopup( a, b, c )
		net.Start("popup_message_blur")
			net.WriteString(a)
			net.WriteString(b)
			net.WriteString(c)
		net.Broadcast()
	end
	hook.Add("playerUnWarranted", "popup1", function(ply, a)
		sendPopup("Обыск", "Ордер на обыск "..ply:Nick().." был отозван.","")
		-- return true
	end)
	hook.Add("playerWarranted", "popup2", function(ply, act, r)
		sendPopup("Обыск", "Выдан ордер на обыск "..ply:Nick()..". Запросил "..act:Nick(),"Причина: "..r)
		-- return true
	end)
	hook.Add("playerUnArrested", "popup3", function(ply, act)
		sendPopup("Арест", ply:Nick().." был выпущен из обезьянника.","")
	end)
	hook.Add("playerArrested", "popup4", function(ply, t, act)
		if not IsValid(act) then act = "Unknown" else act = act:Nick() end
		if not IsValid(ply) then user = "Unknown" else user = ply:Nick() end
		sendPopup("Арест", user.." был арестован "..act,"")
	end)
	hook.Add("playerUnWanted", "popup5", function(ply)
		sendPopup("Розыск", ply:Nick().." больше не разыскивается.","")
		-- return true
	end)
	hook.Add("playerWanted", "popup6", function(ply, a, r)
		sendPopup("Розыск", ply:Nick().." разыскивается!",r)
		-- return true
	end)
end

--PATH addons/grp_knife/lua/weapons/csgo_cssource.lua:
if not file.Exists( "weapons/csgo_baseknife.lua", "LUA" ) then
  SWEP.Spawnable = false
  print( "csgo_cssource failed to initialize: csgo_baseknife.lua not found. Did you install the main part?" )
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

SWEP.PrintName      = "CS:Source Knife"
SWEP.Category       = "CS:GO Knives"

SWEP.Spawnable      = true
SWEP.AdminSpawnable = true

SWEP.ViewModel      = "models/weapons/v_csgo_cssource.mdl"
SWEP.WorldModel     = "models/weapons/w_csgo_cssource.mdl"

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
SWEP.Icon = "vgui/entities/csgo_cssource.vmt"

--PATH addons/truefishing/lua/weapons/fishing_rod/shared.lua:
if SERVER then
	AddCSLuaFile("shared.lua")
	util.AddNetworkString("rod_Fishing")
	util.AddNetworkString("rod_Pull")
	util.AddNetworkString("rod_End")
	util.AddNetworkString("rod_Game")
end

if CLIENT then
	SWEP.PrintName = "Удочка"
	SWEP.Slot = 3
	SWEP.SlotPos = 3
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end

SWEP.Author = "Tomasas"
SWEP.Instructions = "ЛКМ, чтобы пустить леску.\nПКМ, чтобы поймать рыбу."
SWEP.Contact = ""
SWEP.Purpose = ""


//SWEP.AnimPrefix	 = "rpg"
SWEP.WorldModel = "models/props_junk/harpoon002a.mdl"
SWEP.ViewModel = "models/weapons/v_hands.mdl"

SWEP.Spawnable = false
SWEP.AdminSpawnable = true

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

SWEP.IsRod = true

SWEP.BarSize = 0.08
SWEP.RodLevel = 0

function SWEP:Initialize()
	self:SetHoldType("revolver")
end

function SWEP:DrawWorldModel()
	if !self.WeaponModel then self:Deploy(true) end
	local bone = self.Owner:LookupBone("ValveBiped.Bip01_R_Hand", false)
	local pos, ang
	if bone then
		pos, ang = self.Owner:GetBonePosition(bone)
	else
		pos, ang = self.Owner:GetPos(), self.Owner:GetAngles()
	end

	ang:RotateAroundAxis(ang:Right(), -55)
	pos = pos - ang:Forward()*6.5 + ang:Up()*1.8 + ang:Right()*1

	self.WeaponModel:SetPos(pos)
	self.WeaponModel:SetAngles(ang)
	self.WeaponModel:DrawModel()
	return true
end

function SWEP:Deploy(fromNotEngine)
	if not fromNotEngine then -- because of random anims
		self:SetHoldType("revolver")
	end

	if CLIENT then
		self.WeaponModel = ClientsideModel("models/fishing/pole.mdl", RENDERGROUP_OPAQUE)
		self.WeaponModel:DrawShadow(false)
		self.WeaponModel:SetNoDraw(true)
		return true
	end
	//self.Owner:DrawViewModel(false)
end

function SWEP:Holster()
	if CLIENT and LocalPlayer() == self.Owner then
		self.DrawFishing = nil
		self.MiniGame = false
		if IsValid(self.WeaponModel) then
			self.WeaponModel:Remove()
			self.WeaponModel = nil
			self.Owner.ThirdView = nil
		end
	end
	if SERVER then
		if IsValid(self.Ball) then
			self.Ball:Remove()
			self.Ball = nil
		end
		self.Owner:SetMoveType(MOVETYPE_WALK)
		self.Owner.IsFishing = nil
	end
	return true
end

if CLIENT then
	local tracedata = {mask = CONTENTS_SOLID + 268435488 + CONTENTS_OPAQUE}
	local function SWEPCalcView(ply, pos, ang, fov)
		if not TrueFish.FIRSTPERSON_FISHING and ply.ThirdView then
			ang.p = 35
			//ang.y = 45
			tracedata.start = pos
			tracedata.endpos = pos-ang:Forward()*150
			local trace = util.TraceLine(tracedata)
			return {origin = trace.HitWorld and trace.HitPos+ply:GetForward()*3 or tracedata.endpos, angles = ang, fov = fov, drawviewer = true}
		end
	end
	hook.Add("CalcView", "Fishing Rod", SWEPCalcView)

	SWEP.PreDrawViewModel = SWEP.DrawWorldModel

	function SWEP:Think()
		if self.MiniGame then
			if CurTime() >= self.NextDrip then
				surface.PlaySound("truefish/ball.mp3")
				self.NextDrip = CurTime() + SoundDuration("truefish/ball.mp3") + math.random( 1, 6 )
			end
			if CurTime() >= self.NextFish then
				self.FishTarget = math.Rand(self.BarSize,1-self.BarSize)

				self.NextFish = CurTime() + math.Rand(1,3)
			end

			if CurTime() >= self.NextGameTick then
				self.BarPos = math.Clamp(self.BarPos + (self.Owner:KeyDown(IN_ATTACK) and 0.015 or -0.015),self.BarSize,1 - self.BarSize)

				if math.abs(self.FishPos - self.BarPos) <= self.BarSize then
					self.GameProgress = math.min(self.GameProgress + 0.007, 1)
				else
					self.GameProgress = math.max(self.GameProgress - 0.01, 0)
				end

				if self.GameProgress >= 1 then
					net.Start("rod_Game")
					net.SendToServer()
				end
				
				self.FishPos = Lerp(0.05,self.FishPos,self.FishTarget + math.sin(RealTime() * 5) * self.BarSize * 0.5)--math.Clamp(42,self.BarSize,1 - self.BarSize)
		
				self.NextGameTick = CurTime() + FrameTime()
			end

		end
	end

	local mat_lmb = Material("gui/lmb.png")
	local mat_rmb = Material("gui/rmb.png")
	local mat_fish = Material("gui/fish.png")

	function SWEP:DrawHUD()
		if self.MiniGame then
			local prog = self.GameProgress - 0.5
			local pos,size = 0.5 - self.BarPos,self.BarSize
			local fpos = 0.5 - self.FishPos
			local x, y = math.floor(TFScreenScale(7)), math.floor(TFScreenScale(81))

			surface.SetDrawColor(0, 0, 0, 135)
			surface.DrawRect(ScrW()*0.35, ScrH()*0.5-y*0.5, x, y)
			for i=1, x do
				surface.SetDrawColor(255, 0.5*i*x, 0, 255)
				surface.DrawLine(ScrW()*0.35+i-1, ScrH()*0.5+y*0.5, ScrW()*0.35+i-1, ScrH()*0.5-y*prog)
			end
			for i=1, 4 do
				surface.SetDrawColor(125+i*10, 125+i*10, 125+i*10, 255)
				surface.DrawOutlinedRect(ScrW()*0.35-i, ScrH()*0.5-y*0.5-i, x+i*2, y+i*2)
			end

			surface.SetDrawColor(255,255,255,(math.sin(RealTime() * 15) + 1.2) * 225 / 2.2)
			surface.SetMaterial(mat_lmb)
			surface.DrawTexturedRect(ScrW()*0.315-32,ScrH()*0.5+y*pos-16,32,32)

			x = math.floor(TFScreenScale(15))
			
			surface.SetDrawColor(0, 0, 0, 135)
			surface.DrawRect(ScrW()*0.315, ScrH()*0.5-y*0.5, x, y)
			for i=1, x do
				surface.SetDrawColor(0, 125+i*10, 0, 200)
				surface.DrawLine(ScrW()*0.315+i-1, ScrH()*0.5+y*(pos - size), ScrW()*0.315+i-1, ScrH()*0.5+y*(pos + size))
			end

			surface.SetDrawColor(0,100,255)
			surface.SetMaterial(mat_fish)
			surface.DrawTexturedRect(ScrW()*0.315+x*0.5-24,ScrH()*0.5+y*fpos-24,48,48)

			for i=1, 4 do
				surface.SetDrawColor(125+i*10, 125+i*10, 125+i*10, 255)
				surface.DrawOutlinedRect(ScrW()*0.315-i, ScrH()*0.5-y*0.5-i, x+i*2, y+i*2)
			end

			return
		end

		if !self.Owner.ThirdView or !self.DrawFishing then return end

		local left = (self.StartedFishing+self.DrawFishing-CurTime())/self.DrawFishing
		if left < 0 then return end
		left = left - 0.5
		
		local x, y = math.floor(TFScreenScale(81)), math.floor(TFScreenScale(7))

		surface.SetDrawColor(255,255,255,(math.sin(RealTime() * 5) + 1.2) * 225 / 2.2)
		surface.SetMaterial(mat_rmb)
		surface.DrawTexturedRect(ScrW()*0.5-16,ScrH()*0.8+y+16,32,32)

		surface.SetDrawColor(0, 0, 0, 135)
		surface.DrawRect(ScrW()*0.5-x*0.5, ScrH()*0.8, x, y)
		for i=1, y do
			surface.SetDrawColor(0, 0.5*i*y, 0, 255)
			surface.DrawLine(ScrW()*0.5-x*0.5, ScrH()*0.8+i-1, ScrW()*0.5+x*left, ScrH()*0.8+i-1)
		end
		for i=1, 4 do
			surface.SetDrawColor(125+i*10, 125+i*10, 125+i*10, 255)
			surface.DrawOutlinedRect(ScrW()*0.5-x*0.5-i, ScrH()*0.8-i, x+i*2, y+i*2)
		end
		draw.SimpleText(TrueFishLocal("fishing_hud"), "SegoeUI_NormalBoldScaled", ScrW()*0.5, ScrH()*0.8-TFScreenScale(1), Color(220, 220, 220, 255), TEXT_ALIGN_CENTER)
	end


	function SWEP:StartGame()
		self.MiniGame = true
		self.GameProgress = 0
		self.FishPos = 0.5
		self.BarPos = self.BarSize
		self.NextGameTick = CurTime()
		self.FishTarget = self.FishPos
		self.NextFish = CurTime()
		self.NextDrip = CurTime() + 1
	end

	
	net.Receive("rod_Fishing", function()
		local owner = LocalPlayer()
		if !owner or !owner:IsValid() then return end
		local wep = owner:GetActiveWeapon()
		if !wep or !wep:IsValid() or not wep.IsRod then return end
		
		local wait = net.ReadUInt(12)
		if wait != 0 then
			owner.ThirdView = true
			wep.DrawFishing = wait
			wep.StartedFishing = CurTime()-owner:Ping()*0.001
		end
		
	end)

	net.Receive("rod_Pull", function()
		local ent = net.ReadEntity()
		ent.Slashing = true		
	end)

	net.Receive("rod_End", function()
		local owner = LocalPlayer()
		if !owner or !owner:IsValid() then return end
		owner.ThirdView = false
		local wep = owner:GetActiveWeapon()
		if !wep or !wep:IsValid() then return end
		wep.MiniGame = false
	end)

	net.Receive("rod_Game", function()
		local owner = LocalPlayer()
		if !owner or !owner:IsValid() then return end
		local wep = owner:GetActiveWeapon()
		if !wep or !wep:IsValid() then return end
		wep:StartGame()
	end)

end

function SWEP:PrimaryAttack()
end
SWEP.SecondaryAttack = function() end
if CLIENT then return end

net.Receive("rod_Game",function(_,ply)
	local wep = ply:GetActiveWeapon()

	if wep:IsValid() and wep.IsRod and ply.IsFishing == 2 then
		ply:SetMoveType(MOVETYPE_WALK)
		net.Start("rod_End")
		net.Send(ply)
		ply.IsFishing = nil
		wep.Ball:Remove()
		
		ply:EmitSound("truefish/fish.mp3")

		local fish = TrueFishCalculateFish(wep.RodLevel)
		if math.random(1000) <= TrueFish.ROD_JUNK_CHANCE then
			fish = FISH_JUNK
		end
		
		if math.random(1000) <= TrueFish.ROD_MONEYBAG_CHANCE then // Yes, JUNK and MONEY BAG chances aren't 100% this way
			TrueFishGiveMoney(ply, TrueFish.ROD_MONEYBAG_MONEY)
			TrueFishNotify(ply, TrueFishLocal("money_bag_caught", TrueFish.ROD_MONEYBAG_MONEY))
			return
		end
		
		if !fish then
			TrueFishNotify(ply, TrueFishLocal("didnt_catch_anything"))
			return
		end
		
		--ply.Fishes = ply.Fishes or {}
		if TrueFish.ROD_NO_CONTAINER then
			--[[
			if TrueFish.FISH_CARRY_LIMIT <= wep:PlayerGetSpace() then
				TrueFishNotify(ply, TrueFishLocal("carry_limit_reached", TrueFish.FISH_CARRY_LIMIT))
				return
			end
			TrueFishNotify(ply, TrueFishLocal("fish_caught", TrueFishGetFishName(fish)))	
			ply.Fishes[fish] = ply.Fishes[fish] and ply.Fishes[fish]+1 or 1
			]]

			local item = itemstore.Item("rod_fish")
			item:SetData( "FishID" , fish )
			item:SetData( "Model", TrueFishGetFishModel( fish ) )

			if ply.Inventory:AddItem( item ) then
				TrueFishNotify(ply, TrueFishLocal("fish_caught", TrueFishGetFishName(fish)))
			else
				TrueFishNotify(ply, TrueFishLocal("carry_limit_reached", TrueFish.FISH_CARRY_LIMIT))
			end

			return
		end
		
		
		local dist = {}
		local distEnt = {}
		local find = ents.FindInSphere(ply:GetPos(), 250)
		for i=1, #find do
			if find[i]:IsValid() and find[i]:GetClass() == "fish_container" then
				local d = ply:GetPos():Distance(find[i]:GetPos())
				dist[#dist+1] = d
				distEnt[d] = find[i]
			end
		end
		
		if !dist[1] then
			TrueFishNotify(ply, TrueFishLocal("empty_fish_containers_near"))
			return
		end
			
		local closest 
		for k, v in SortedPairsByValue(dist) do
			closest = distEnt[v]
			if closest:GetSpace() < TrueFish.FISH_CONTAINER_LIMIT then break end
		end
		
		if !closest then return end
		
		closest:AddFish(fish, 1)
		TrueFishNotify(ply, TrueFishLocal("fish_caught", TrueFishGetFishName(fish)))
	
	end
end)

function SWEP:OnRemove()
	if IsValid(self.Ball) then
		self.Ball:Remove()
	end
end

function SWEP:Think()
	if self.Owner.IsFishing then
		if self.Owner.IsFishing == 2 then return end

		local ctime = CurTime()

		if self.FishingEndTime <= ctime then
			self:NoCatch()
		elseif self.FishingTimeWindow <= ctime then
			net.Start("rod_Pull")
			net.WriteEntity(self.Ball)
			net.SendPVS(self.Ball:GetPos())
			self.Owner.IsFishing = 1
			self.FishingTimeWindow = self.FishingEndTime
		end
	end
end

function SWEP:PrimaryAttack()
	
	if self.Owner.IsFishing or !self.Owner:OnGround() or self.Owner:GetVelocity() != Vector(0,0,0) then return end

	if !self.Owner.FishBait or self.Owner.FishBait == 0 then
		TrueFishNotify(self.Owner, TrueFishLocal("no_fish_bait"))
		return false
	end
	
	
	local ang = self.Owner:GetAngles()
	ang.r = 0
	ang.p = 0
	local tracedata = {start = self.Owner:GetPos()+ang:Forward()*(350+math.random(-100, 100))+ang:Right()*math.random(-120, 120)}
	tracedata.start.z = tracedata.start.z + 50
	tracedata.endpos = Vector(tracedata.start.x, tracedata.start.y, tracedata.start.z-80)
	local trace = util.TraceLine(tracedata)
	tracedata.start.z = tracedata.start.z + 50
	tracedata.endpos.z = tracedata.endpos.z - 130
	tracedata.mask = MASK_WATER--CONTENTS_SOLID + 268435488 + CONTENTS_OPAQUE
	local trace2 = util.TraceLine(tracedata)
	if !trace.Hit and trace2.HitWorld then
		self.Owner.FishBait = self.Owner.FishBait - 1
	
		tracedata.start = trace2.HitPos
		tracedata.endpos.z = tracedata.endpos.z - FISH_MAX_DEPTH
		tracedata.mask = MASK_OPAQUE
		trace = util.TraceLine(tracedata)
		
		local owner = self.Owner

		owner:EmitSound("truefish/throw.mp3")

		self.Ball = ents.Create("fishing_rod_buoy")
		self.Ball:Spawn()
		self.Ball:SetDTEntity(0, owner)
		self.Ball:SetPos(trace2.HitPos)
		
		local fish = TrueFishCalculateFish(self.RodLevel)
		local waitTime = TrueFish.ROD_SEPERATE_CATCH_TIME_ENABLED and TrueFish.ROD_SEPERATE_CATCH_TIME or !TrueFish.FISH_CATCH_TIME[fish] and TrueFish.ROD_SEPERATE_CATCH_TIME or math.random(TrueFish.FISH_CATCH_TIME[fish][1], TrueFish.FISH_CATCH_TIME[fish][2])
		net.Start("rod_Fishing")
		net.WriteUInt(waitTime, 12)
		net.Send(owner)

		owner:SetMoveType(MOVETYPE_NONE)
		owner.IsFishing = true
		self.FishingEndTime = CurTime() + waitTime
		self.FishingTimeWindow = self.FishingEndTime - waitTime*TrueFish.ROD_CATCH_WINDOW

		
		
	end
	
	
end

function SWEP:PlayerGetSpace()
	local space = 0
	for i=1, FISH_HIGHNUMBER do
		if self.Owner.Fishes[i] then
			space = space + self.Owner.Fishes[i]
		end
	end
	return space
end

function SWEP:NoCatch()
	self.Owner:SetMoveType(MOVETYPE_WALK)
	net.Start("rod_End")
	net.Send(self.Owner)
	self.Owner.IsFishing = nil
	TrueFishNotify(self.Owner, TrueFishLocal("didnt_catch_anything"))
	self.Ball:Remove()
	self.Owner:EmitSound("truefish/spinning.mp3")
end

function SWEP:SecondaryAttack()
	if self.Owner.IsFishing == true then
		self:NoCatch()
		return
	end

	if self.Owner.IsFishing == 1 then
		self.Owner.IsFishing = 2
		net.Start("rod_Game")
		net.Send(self.Owner)
		return
	end

	if self.Owner.IsFishing == 2 then
		self:NoCatch()
		return
	end
	
end

hook.Add("canDropWeapon", "rod_fishing", function(ply, weapon)
	if not IsValid(weapon) then return end

	if weapon.IsRod then return false end
end)
--PATH addons/weaponandcontent/lua/weapons/glock/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = true
	SWEP.PrintName = "Glock"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(2.683, -5.336, 2.608)
	SWEP.AimAng = Vector(0.296, -0.105, 0)
	
	SWEP.SprintPos = Vector(-2.76, -11.032, -4.137)
	SWEP.SprintAng = Vector(59.402, 0, 0)
	
	SWEP.ZoomAmount = 5
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.IconLetter = "c"
	--killicon.AddFont("swb_glock18", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_pistol_small"
end
SWEP.CanPenetrate = false
SWEP.PlayBackRate = 30
SWEP.PlayBackRateSV = 12
SWEP.SpeedDec = 25
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
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "swb_base"
SWEP.Category = "Weapons"

SWEP.Author			= "Base swb"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV		= 70
SWEP.ViewModelFlip		= true
SWEP.ViewModel				= "models/weapons/2_pist_glock18.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_pist_glock18.mdl"	-- Weapon world model

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 18
SWEP.Primary.DefaultClip	= 18
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "Pistol"

SWEP.FireDelay = 0.05
SWEP.FireSound = Sound("Alt_Weapon_Glock.1")
SWEP.Recoil = 0.4
SWEP.DryFire = true

SWEP.HipSpread = 0.038
SWEP.AimSpread = 0.013
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0
SWEP.SpreadPerShot = 0
SWEP.SpreadCooldown = 0
SWEP.Shots = 1
SWEP.Damage = 16
SWEP.DeployTime = 1
SWEP.BurstCooldownMul = 3.5
--PATH gamemodes/sandbox/entities/weapons/gmod_tool/stools/fading_door.lua:

-----------------------------------------------------
/* 	Fading Door
		Made by KingofBeast
			And this one doesn't lag. */
			
-- First off, make meta functions for entities fading
local ent = FindMetaTable("Entity")

function ent:Fade()
	self.Faded = true
	self.FadedMaterial = self:GetMaterial()
	self.fCollision = self:GetCollisionGroup()
	
	self:SetMaterial("sprites/heatwave")
	self:DrawShadow(false)
	self:SetNotSolid(true)
	
	local obj = self:GetPhysicsObject()
	if (IsValid(obj)) then
		obj:EnableMotion(false)
	end
end

function ent:UnFade()
	if (!self:IsValid()) then return end
	self.Faded = nil
	
	self:SetMaterial(self.FadedMaterial or "")
	self:DrawShadow(true)
	
	local obj = self:GetPhysicsObject()
	if (IsValid(obj)) then
		obj:EnableMotion(false)
	end

	local ueban = false

	for k, v in pairs(ents.FindInSphere(self:LocalToWorld(self:OBBCenter()), self:BoundingRadius())) do
        if v:IsPlayer() and not v:InVehicle() and not tobool(v:GetObserverMode()) or v:IsVehicle() then
            if self:NearestPoint(v:NearestPoint(self:GetPos())):Distance(v:NearestPoint(self:GetPos())) <= 20 then
              	ueban = true
            end
        end
    end

    if ueban then self:Fade() else self:SetNotSolid(false) end
end
local IconFading = Material("icon16/lock.png", "unlitgeneric")

hook.Add("HUDPaint", "DoorFixPng", function()
	if IsValid(LocalPlayer():GetEyeTrace().Entity) and LocalPlayer():GetEyeTrace().Entity:GetNWBool( "fadingfix") == "true" then	
		surface.SetDrawColor(255, 255, 255, 255)
		surface.SetMaterial(IconFading)
		surface.DrawTexturedRect(ScrW()/2-10, ScrH()/2-10, 20, 20)
	end 

end)
function ent:MakeFadingDoor(pl, key, inversed, toggleactive)
	if self:GetClass() == "sammyservers_textscreen" then return false end
	local makeundo = true
	if (self.FadingDoor) then
		self:UnFade()
		numpad.Remove(self.NumpadFadeUp)
		numpad.Remove(self.NumpadFadeDown)
		makeundo = false
	end
	self.FadeKey = key
	self.FadingDoor = true
	self.isFadingDoor = true
	self.FadeInversed = inversed
	self.FadeToggle = toggleactive
	self:SetNWBool( "fadingfix", "true" )
	self:CallOnRemove("Fading Door", self.UndoFadingDoor)
	
	self.NumpadFadeUp = numpad.OnUp(pl, key, "FadeDoor", self, false)
	self.NumpadFadeDown = numpad.OnDown(pl, key, "FadeDoor", self, true)
	
	if (inversed) then self:Fade() end
	return makeundo
end

-- Utility Functions
local function ValidTrace(tr)
	return ((tr.Entity) and (tr.Entity:IsValid())) and !((tr.Entity:IsPlayer()) or (tr.Entity:IsNPC()) or (tr.Entity:IsVehicle()) or (tr.HitWorld) or (tr.Entity:GetClass() == "gmod_cameraprop"))
end

local function ChangeState(pl, ent, state)
	if !(ent:IsValid()) then return end
	
	if (ent.FadeToggle) then
		if (state == false) then return end
		if (ent.Faded) then ent:UnFade() else ent:Fade() end
		return
	end
	
	if ((ent.FadeInversed) and (state == false)) or ((!ent.FadeInversed) and (state == true)) then
		ent:Fade()
	else
		ent:UnFade()
	end
end
if (SERVER) then numpad.Register("FadeDoor", ChangeState) end

TOOL.Category	= "Основное"
TOOL.Name		= "#Скрывающаяся дверь"
TOOL.Stage = 1

TOOL.ClientConVar["key"] = "5"
TOOL.ClientConVar["toggle"] = "0"
TOOL.ClientConVar["reversed"] = "0"
TOOL.ClientConVar["length"] = "0"
TOOL.ClientConVar["password"] = ""

if (CLIENT) then
	language.Add("Tool.fading_door.name", "Скрывающаяся дверь")
	language.Add("Tool.fading_door.desc", "Превращает пропы в двери")
	language.Add("Tool_fading_door_desc", "Превращает пропы в двери")
	language.Add("Tool.fading_door.0", "Click on something to fadify it. Right click for easy fading door.")
	language.Add("Undone_fading_door", "Отменяем Скрывающаюся дверь")
	
	function TOOL:BuildCPanel()
		self:AddControl("Header",   {Text = "#Tool_fading_door_name", Description = "#Превращает пропы в двери"})
		self:AddControl("CheckBox", {Label = "Сразу скрыть дверь", Command = "fading_door_reversed"})
		self:AddControl("CheckBox", {Label = "Активация при нажатий", Command = "fading_door_toggle"})
		self:AddControl("Numpad",   {Label = "Кнопка", ButtonSize = "22", Command = "fading_door_key"})
		
		self:AddControl( "Slider", {	Label 	= "Задержка активации",
									Type	= "Float",
									Min		= "4",
									Max		= "10",
									Command	= "fading_door_length" } )
	end
	
	TOOL.LeftClick = ValidTrace
	return
end	

function TOOL:LeftClick(tr)
	if (!ValidTrace(tr)) then return false end
	if !IsValid(tr.Entity) then return false end
	
	local ent = tr.Entity
	local pl = self:GetOwner()
	if (ent:MakeFadingDoor(pl, self:GetClientNumber("key"), self:GetClientNumber("reversed") == 1, self:GetClientNumber("toggle") == 1)) then
		self.key = self:GetClientNumber("key")
		self.key2 = -1

		undo.Create("fading_door")
			undo.AddFunction(function()
				ent:UnFade()
				ent.isFadingDoor = nil
				ent.FadingDoor = nil
				if IsValid(ent) then ent:SetNWBool("fadingfix", "true") end
				numpad.Remove(ent.NumpadFadeUp)
				numpad.Remove(ent.NumpadFadeDown)
			end)
			undo.SetPlayer(pl)
		undo.Finish()
	end
	return true
end

function TOOL:LinkKeypad(Ent, Key, Password, HoldLength)
	local data = {
	    ['Owner']            = self:GetOwner(),
	    ['DelayGranted']     = HoldLength,
	    ['LengthGranted']    = 4,
	    ['InitDelayDenied']  = 0,
	    ['RepeatsGranted']   = 0,
	    ['Secure']           = false,
	    ['Password']         = Password,
	    ['InitDelayGranted'] = 0,
	    ['KeyDenied']        = 0,
	    ['KeyGranted']       = Key,
	    ['RepeatsDenied']    = 0,
	    ['LengthDenied']     = 0.1,
	    ['DelayDenied']      = 0,
	}

	Ent:SetData(data)
	Ent:GetPhysicsObject():EnableMotion(false)
	Ent:CPPISetOwner(self:GetOwner())
	self:GetOwner():AddCount("keypads", Ent)
	self:GetOwner():AddCleanup("keypads", Ent)
	
	Ent.keypad_keygroup1 = self:GetClientNumber("key")
	Ent.keypad_keygroup2 = -1
	Ent.keypad_length1 = self:GetClientNumber("length") or 3
	Ent.keypad_length2 = -1
end

function TOOL:RightClick(tr)
	if not SERVER then return end
	
	local pl = self:GetOwner()
	
	if not self.Stage or self.Stage == 1 then
		if (!ValidTrace(tr)) then return false end
		local ent = tr.Entity
	
		if (ent:MakeFadingDoor(pl, self:GetClientNumber("key"), self:GetClientNumber("reversed") == 1, self:GetClientNumber("toggle") == 1)) then
			undo.Create("fading_door")
				undo.AddFunction(function()
					ent:UnFade()
					ent.FadingDoor = nil
					numpad.Remove(ent.NumpadFadeUp)
					numpad.Remove(ent.NumpadFadeDown)
				end)
				undo.SetPlayer(pl)
			undo.Finish()
		end
		--rp.Notify(pl, NOTIFY_GREEN, rp.Term('FadeDoorCreatedExtra'))
		self.Stage = 2
	else
		if not (pl:CheckLimit("keypads")) then return false end
		
		local Password = tonumber(self:GetClientNumber("password"))
		
		if (Password == nil) or (string.len(tostring(Password)) > 4) or (string.find(tostring(Password), "0")) or Password < 0 then
			--rp.Notify(pl, NOTIFY_ERROR, rp.Term('InvalidPassword'))
			return false
		end
		
		if tonumber(self:GetClientNumber("length")) < 4 then
			--rp.Notify(pl, NOTIFY_ERROR, rp.Term('KeypadHoldLength'), 4)
			return false
		end
		
		local SpawnPos = tr.HitPos
		
		local Keypad = ents.Create("keypad")
		Keypad:SetPos(SpawnPos)
		Keypad:SetAngles(tr.HitNormal:Angle())
		Keypad:Spawn()
		Keypad:Activate()
		
		self:LinkKeypad(Keypad, self:GetClientNumber("key"), self:GetClientNumber("password"), self:GetClientNumber("length"))
		
		undo.Create("Keypad")
			undo.AddEntity(Keypad)
			undo.SetPlayer(pl)
		undo.Finish()

		--rp.Notify(pl, NOTIFY_GREEN, rp.Term('KeypadCreated'))
		self.Stage = 1
	end
	
	return true
end

--PATH gamemodes/sandbox/entities/weapons/gmod_tool/stools/textscreen.lua:
TOOL.Category = "Основное"
TOOL.Name = "#Надписи"
TOOL.Command = nil
TOOL.ConfigName = ""
local textBox = {}
local lineLabels = {}
local labels = {}
local sliders = {}
local rainbowCheckboxes = {}
local textscreenFonts = textscreenFonts
local rainbow_enabled = cvars.Number("ss_enable_rainbow", 0)
local max_characters = cvars.Number("ss_max_characters", 80)

for i = 1, 5 do
	TOOL.ClientConVar["text" .. i] = ""
	TOOL.ClientConVar["size" .. i] = 20
	TOOL.ClientConVar["r" .. i] = 255
	TOOL.ClientConVar["g" .. i] = 255
	TOOL.ClientConVar["b" .. i] = 255
	TOOL.ClientConVar["a" .. i] = 255
	TOOL.ClientConVar["font" .. i] = 1
	TOOL.ClientConVar["rainbow" .. i] = 0
end

cleanup.Register("textscreens")

if (CLIENT) then
	TOOL.Information = {
		{ name = "left" },
		{ name = "right" },
		{ name = "reload" },
	}
	-- Add default english language strings here, in case no localisation exists
	language.Add("tool.textscreen.name", "Надписи")
	language.Add("tool.textscreen.desc", "Создаёт надписи на стенах.")
	language.Add("tool.textscreen.left", "Левая кнопка поставить надпись, правая обновить.") -- Does not work with capital T in tool. Same with right and reload.
	language.Add("tool.textscreen.right", "Левая кнопка поставить надпись, правая обновить.")
	language.Add("tool.textscreen.reload", "Копируем надпись.")
	language.Add("Undone.textscreens", "Убираем надписи")
	language.Add("Undone_textscreens", "Убираем надписи")
	language.Add("Cleanup.textscreens", "Надписи")
	language.Add("Cleanup_textscreens", "Надписи")
	language.Add("Cleaned.textscreens", "Очистили надписи")
	language.Add("Cleaned_textscreens", "Очистили надписи")
	language.Add("SBoxLimit.textscreens", "Вы достигли лимита надписей!")
	language.Add("SBoxLimit_textscreens", "Вы достигли лимита надписей!")
end

function TOOL:LeftClick(tr)
	if (tr.Entity:GetClass() == "player") then return false end
	if (CLIENT) then return true end
	local ply = self:GetOwner()

	if hook.Run("PlayerSpawnTextscreen", ply, tr) == false then return false end

	if not (self:GetWeapon():CheckLimit("textscreens")) then return false end
	-- ensure at least 1 line of the textscreen has text before creating entity
	
	for i = 1, 5 do 
			        -- fix от даунов
        if utf8.len(self:GetClientInfo("text" .. i)) > 80 then
            DarkRP.notify(ply, 1, 4, "Используй меньше 80 символов!")
            return ""
        end
        if tonumber(self:GetClientInfo("size" .. i)) < 20 then
             DarkRP.notify(ply, 1, 4, "Размер < 20 запрещено!")
            return ""
        end 
	end
	
	local textScreen = ents.Create("sammyservers_textscreen")
	textScreen:SetPos(tr.HitPos)
	local angle = tr.HitNormal:Angle()
	angle:RotateAroundAxis(tr.HitNormal:Angle():Right(), -90)
	angle:RotateAroundAxis(tr.HitNormal:Angle():Forward(), 90)
	textScreen:SetAngles(angle)
	textScreen:Spawn()
	textScreen:Activate()

	undo.Create("textscreens")
	undo.AddEntity(textScreen)
	undo.SetPlayer(ply)
	undo.Finish()
	ply:AddCount("textscreens", textScreen)
	ply:AddCleanup("textscreens", textScreen)

	for i = 1, 5 do
		local txt = self:GetClientInfo("text" .. i) or ""
		textScreen:SetLine(
			i, -- Line
			max_characters ~= 0 and string.Left(txt, max_characters) or txt, -- text
			Color( -- Color
				tonumber(self:GetClientInfo("r" .. i)) or 255,
				tonumber(self:GetClientInfo("g" .. i)) or 255,
				tonumber(self:GetClientInfo("b" .. i)) or 255,
				tonumber(self:GetClientInfo("a" .. i)) or 255
			),
			tonumber(self:GetClientInfo("size" .. i)) or 20,
			-- font
			tonumber(self:GetClientInfo("font" .. i)) or 1,

			rainbow_enabled == 1 and tonumber(self:GetClientInfo("rainbow" .. i)) or 0
		)
	end

	return true
end

function TOOL:RightClick(tr)
	if (tr.Entity:GetClass() == "player") then return false end
	if (CLIENT) then return true end
	local traceEnt = tr.Entity

	if (IsValid(TraceEnt) and traceEnt:GetClass() == "sammyservers_textscreen") then
		for i = 1, 5 do
		
										-- fix от даунов
			if utf8.len(self:GetClientInfo("text" .. i)) > 80 then
				DarkRP.notify(ply, 1, 4, "Используй меньше 80 символов!")
				return ""
			end
			if tonumber(self:GetClientInfo("size" .. i)) < 20 then
				 DarkRP.notify(ply, 1, 4, "Размер < 20 запрещено!")
				return ""
			end
		
			local txt = tostring(self:GetClientInfo("text" .. i))
			traceEnt:SetLine(
				i, -- Line
				max_characters ~= 0 and string.Left(txt, max_characters) or txt, -- text
				Color( -- Color
					tonumber(self:GetClientInfo("r" .. i)) or 255,
					tonumber(self:GetClientInfo("g" .. i)) or 255,
					tonumber(self:GetClientInfo("b" .. i)) or 255,
					tonumber(self:GetClientInfo("a" .. i)) or 255
				),
				tonumber(self:GetClientInfo("size" .. i)) or 20,
				-- font
				tonumber(self:GetClientInfo("font" .. i)) or 1,

				rainbow_enabled and tonumber(self:GetClientInfo("rainbow" .. i)) or 0
			)
		end

		traceEnt:Broadcast()

		return true
	end
end

function TOOL:Reload(tr)
	if (SERVER) then return true end
	local traceEnt = tr.Entity
	if (not isentity(traceEnt) or traceEnt:GetClass() ~= "sammyservers_textscreen") then return false end

	for i = 1, 5 do
		local linedata = traceEnt.lines[i]
		RunConsoleCommand("textscreen_r" .. i, linedata.color.r)
		RunConsoleCommand("textscreen_g" .. i, linedata.color.g)
		RunConsoleCommand("textscreen_b" .. i, linedata.color.b)
		RunConsoleCommand("textscreen_a" .. i, linedata.color.a)
		RunConsoleCommand("textscreen_size" .. i, linedata.size)
		RunConsoleCommand("textscreen_text" .. i, linedata.text)
		RunConsoleCommand("textscreen_font" .. i, linedata.font)
		RunConsoleCommand("textscreen_rainbow" .. i, linedata.rainbow)
	end

	return true
end

local conVarsDefault = TOOL:BuildConVarList()

function TOOL.BuildCPanel(CPanel)
	local logo = vgui.Create("DImage", CPanel)
	logo:SetSize(267, 134)
	logo:SetImage("textscreens/logo.png")
	CPanel:AddItem(logo)

	CPanel:AddControl("Header", {
		Text = "#tool.textscreen.name",
		Description = "#Создавайте надписи на стенах"
	})

	local function TrimFontName(fontnum)
		return string.Left(textscreenFonts[fontnum], 8) == "Screens_" and string.TrimLeft(textscreenFonts[fontnum], "Screens_") or textscreenFonts[fontnum]
	end

	local changefont
	local fontnum = textscreenFonts[GetConVar("textscreen_font1"):GetInt()] ~= nil and GetConVar("textscreen_font1"):GetInt() or 1

	cvars.AddChangeCallback("textscreen_font1", function(convar_name, value_old, value_new)
		fontnum = textscreenFonts[tonumber(value_new)] ~= nil and tonumber(value_new) or 1
		local font = TrimFontName(fontnum)
		changefont:SetText("Change font (" .. font .. ")")
	end)

	local function ResetFont(lines, text)
		if #lines >= 5 then
			fontnum = 1
			for i = 1, 5 do
				RunConsoleCommand("textscreen_font" .. i, 1)
			end
		end
		for k, i in pairs(lines) do
			if text then
				RunConsoleCommand("textscreen_text" .. i, "")
				labels[i]:SetText("")
			end
			labels[i]:SetFont(textscreenFonts[fontnum] .. "_MENU")
		end
	end

	resetall = vgui.Create("DButton", resetbuttons)
	resetall:SetSize(100, 25)
	resetall:SetText("Сбросить настройки")

	resetall.DoClick = function()
		local menu = DermaMenu()

		menu:AddOption("Сбросить цвета", function()
			for i = 1, 5 do
				RunConsoleCommand("textscreen_r" .. i, 255)
				RunConsoleCommand("textscreen_g" .. i, 255)
				RunConsoleCommand("textscreen_b" .. i, 255)
				RunConsoleCommand("textscreen_a" .. i, 255)
			end
		end)

		menu:AddOption("Сбросить размер", function()
			for i = 1, 5 do
				RunConsoleCommand("textscreen_size" .. i, 20)
				sliders[i]:SetValue(20)
				labels[i]:SetFont(textscreenFonts[fontnum] .. "_MENU")
			end
		end)

		menu:AddOption("Сбросить тексты", function()
			for i = 1, 5 do
				RunConsoleCommand("textscreen_text" .. i, "")
				textBox[i]:SetValue("")
			end
		end)

		menu:AddOption("Сбросить шрифт", function()
			ResetFont({1, 2, 3, 4, 5}, false)
		end)

		if rainbow_enabled == 1 then
			menu:AddOption("Сбросить радугу", function()
				for i = 1, 5 do
					rainbowCheckboxes[i]:SetValue(0)
				end
			end)
		end

		menu:AddOption("Сбросить все", function()
			for i = 1, 5 do
				RunConsoleCommand("textscreen_r" .. i, 255)
				RunConsoleCommand("textscreen_g" .. i, 255)
				RunConsoleCommand("textscreen_b" .. i, 255)
				RunConsoleCommand("textscreen_a" .. i, 255)
				RunConsoleCommand("textscreen_size" .. i, 20)
				sliders[i]:SetValue(20)
				RunConsoleCommand("textscreen_text" .. i, "")
				RunConsoleCommand("textscreen_font" .. i, 1)
				textBox[i]:SetValue("")
				if rainbow_enabled == 1 then
					rainbowCheckboxes[i]:SetValue(0)
				end
			end
			ResetFont({1, 2, 3, 4, 5}, true)
		end)

		menu:Open()
	end

	CPanel:AddItem(resetall)
	resetline = vgui.Create("DButton")
	resetline:SetSize(100, 25)
	resetline:SetText("Сбросить строку")

	resetline.DoClick = function()
		local menu = DermaMenu()

		for i = 1, 5 do
			menu:AddOption("Сбросить строку " .. i, function()
				RunConsoleCommand("textscreen_r" .. i, 255)
				RunConsoleCommand("textscreen_g" .. i, 255)
				RunConsoleCommand("textscreen_b" .. i, 255)
				RunConsoleCommand("textscreen_a" .. i, 255)
				RunConsoleCommand("textscreen_size" .. i, 20)
				sliders[i]:SetValue(20)
				RunConsoleCommand("textscreen_text" .. i, "")
				textBox[i]:SetValue("")
				ResetFont({i}, true)
			end)
		end

		menu:AddOption("Сбросить все строки", function()
			for i = 1, 5 do
				RunConsoleCommand("textscreen_r" .. i, 255)
				RunConsoleCommand("textscreen_g" .. i, 255)
				RunConsoleCommand("textscreen_b" .. i, 255)
				RunConsoleCommand("textscreen_a" .. i, 255)
				RunConsoleCommand("textscreen_size" .. i, 20)
				sliders[i]:SetValue(20)
				RunConsoleCommand("textscreen_text" .. i, "")
				RunConsoleCommand("textscreen_font" .. i, 1)
				textBox[i]:SetValue("")
			end
			ResetFont({1, 2, 3, 4, 5}, true)
		end)

		menu:Open()
	end

	CPanel:AddItem(resetline)

	-- Change font
	changefont = vgui.Create("DButton")
	changefont:SetSize(100, 25)
	changefont:SetText("Изменить шрифт  (" .. TrimFontName(fontnum) .. ")" )

	changefont.DoClick = function()
		local menu = DermaMenu()

		for i = 1, #textscreenFonts do
			local font = TrimFontName(i)
			menu:AddOption(font, function()
				fontnum = i
				for o = 1, 5 do
					RunConsoleCommand("textscreen_font" .. o, i)
					labels[o]:SetFont(textscreenFonts[fontnum] .. "_MENU")
				end
				changefont:SetText("Изменить шрифт (" .. font .. ")")
			end)
		end

		menu:Open()
	end

	CPanel:AddItem(changefont)

	CPanel:AddControl("ComboBox", {
		MenuButton = 1,
		Folder = "textscreen",
		Options = {
			["#preset.default"] = conVarsDefault
		},
		CVars = table.GetKeys(conVarsDefault)
	})

	for i = 1, 5 do
		lineLabels[i] = CPanel:AddControl("Label", {
			Text = "Line " .. i,
			Description = "Line " .. i
		})

		lineLabels[i]:SetFont("Default")

		CPanel:AddControl("Color", {
			Label = "Цвет " .. i .. "-й строки",
			Red = "textscreen_r" .. i,
			Green = "textscreen_g" .. i,
			Blue = "textscreen_b" .. i,
			Alpha = "textscreen_a" .. i,
			ShowHSV = 1,
			ShowRGB = 1,
			Multiplier = 255
		})

		if rainbow_enabled == 1 then
			rainbowCheckboxes[i] = vgui.Create("DCheckBoxLabel")
			rainbowCheckboxes[i]:SetText("Rainbow Text")
			rainbowCheckboxes[i]:SetTextColor(Color(0,0,0,255))
			rainbowCheckboxes[i]:SetConVar("textscreen_rainbow" .. i)
			rainbowCheckboxes[i]:SetTooltip("Enable for rainbow text")
			rainbowCheckboxes[i]:SetValue(GetConVar("textscreen_rainbow" .. i):GetInt())
			CPanel:AddItem(rainbowCheckboxes[i])
		end

		sliders[i] = vgui.Create("DNumSlider")
		sliders[i]:SetText("Размер шрифта")
		sliders[i]:SetMinMax(20, 100)
		sliders[i]:SetDecimals(0)
		sliders[i]:SetValue(GetConVar("textscreen_size" .. i))
		sliders[i]:SetConVar("textscreen_size" .. i)

		CPanel:AddItem(sliders[i])
		textBox[i] = vgui.Create("DTextEntry")
		textBox[i]:SetUpdateOnType(true)
		textBox[i]:SetEnterAllowed(true)
		textBox[i]:SetConVar("textscreen_text" .. i)
		textBox[i]:SetValue(GetConVar("textscreen_text" .. i):GetString())

		textBox[i].OnTextChanged = function()
			labels[i]:SetText(textBox[i]:GetValue())
		end

		if max_characters ~= 0 then
			textBox[i].AllowInput = function()
				if utf8.len(textBox[i]:GetValue()) >= max_characters then return true end
			end
		end

		CPanel:AddItem(textBox[i])

		labels[i] = CPanel:AddControl("Label", {
			Text = #GetConVar("textscreen_text" .. i):GetString() >= 1 and GetConVar("textscreen_text" .. i):GetString() or "Line " .. i,
			Description = "Строка " .. i
		})

		labels[i]:SetFont(textscreenFonts[fontnum] .. "_MENU")
		labels[i]:SetAutoStretchVertical(true)
		labels[i]:SetDisabled(true)
		labels[i]:SetHeight(50)

		labels[i].Think = function()
			labels[i]:SetColor(
				Color(
					GetConVar("textscreen_r" .. i):GetInt(),
					GetConVar("textscreen_g" .. i):GetInt(),
					GetConVar("textscreen_b" .. i):GetInt(),
					GetConVar("textscreen_a" .. i):GetInt()
				)
			)
		end
	end
end

--PATH addons/m9k/lua/weapons/m9k_ak47/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_ak47/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_ak47") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "AK-47"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 22			-- Position in the slot
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

SWEP.SelectiveFire		= true

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_dot_ak47.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_ak47_m9k.mdl"	-- Weapon world model
SWEP.ShowWorldModel			= true
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("47ak.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 600			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.3		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "Rifle"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 65		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 30	-- Base damage per bullet
SWEP.Primary.Spread		= .023	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .013 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
-- SWEP.IronSightsPos = Vector(4.394, -3.75, 1.48)
-- SWEP.IronSightsAng = Vector(1.419, -0.35, 0)
-- SWEP.SightsPos = Vector(4.394, -3.75, 1.48)
-- SWEP.SightsAng = Vector(1.419, -0.35, 0)

SWEP.IronSightsPos = Vector(4.539, -4.238, 1.799)
SWEP.IronSightsAng = Vector(0.958, -0.021, 0)
SWEP.SightsPos = Vector(4.539, -4.238, 1.799)
SWEP.SightsAng = Vector(0.958, -0.021, 0)
SWEP.RunSightsPos = Vector(-1.841, -3.386, 0.708)
SWEP.RunSightsAng = Vector(-7.441, -41.614, 0)

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
--PATH addons/m9k/lua/weapons/m9k_bizonp19/shared.lua:
-- Variables that are used on both client and server
SWEP.Gun = ("m9k_bizonp19") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "Bizon PP19"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 42			-- Position in the slot
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
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_bizon19.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_pp19_bizon.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Weapon_P19.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 750			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 64		-- Size of a clip
SWEP.Primary.DefaultClip		= 128		-- Bullets you start with
SWEP.Primary.KickUp				= 0.1		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.1		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.2		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "smg1"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.SelectiveFire		= true

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 19	-- Base damage per bullet
SWEP.Primary.Spread		= .001	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(3.359, 0, 0.839)
SWEP.IronSightsAng = Vector(0.744, -0.588, 0)
SWEP.SightsPos = Vector(3.359, 0, 0.839)
SWEP.SightsAng = Vector(0.744, -0.588, 0)
SWEP.GSightsPos = Vector (0, 0, 0)
SWEP.GSightsAng = Vector (0, 0, 0)
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
--PATH addons/m9k/lua/weapons/m9k_contender/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_contender/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_contender") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "Thompson Contender G2"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 40			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox		= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   	= false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= false		-- Set false if you want no crosshair from hip
SWEP.XHair					= false		-- Used for returning crosshair after scope. Must be the same as DrawCrosshair
SWEP.Weight				= 50			-- Rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.BoltAction				= true		-- Is this a bolt action rifle?
SWEP.HoldType 				= "rpg"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_contender2.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_g2_contender.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_scoped_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("contender_g2.Single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 35		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 1		-- Size of a clip
SWEP.Primary.DefaultClip			= 60	-- Bullets you start with
SWEP.Primary.KickUp				= 1				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 1			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 1		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "SniperPenetratedRound"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.ScopeZoom			= 9	
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
SWEP.Primary.Damage		= 85	--base damage per bullet
SWEP.Primary.Spread		= .01	--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .00015 -- ironsight accuracy, should be the same for shotguns

-- enter iron sight info and bone mod info below

SWEP.IronSightsPos = Vector(-3, -0.857, 0.36)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(-3, -0.857, 0.36)
SWEP.SightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector(3.714, -1.429, 0)
SWEP.RunSightsAng = Vector(-11, 31, 0)

if (gmod.GetGamemode().Name == "Murderthon 9000") then

	SWEP.Slot		= 1				-- Slot in the weapon selection menu
	SWEP.Weight		= 3			-- rank relative ot other weapons. bigger is better

end

function SWEP:PrimaryAttack()
	if self.Owner:IsNPC() then return end
	if self:CanPrimaryAttack() and ( !self.Owner:KeyDown(IN_SPEED) or self.Owner:GetNW2Bool("donate_upgrade_runngun") ) then
		self:ShootBulletInformation()
		self.Weapon:EmitSound(self.Primary.Sound)
		self.Weapon:TakePrimaryAmmo(1)
		self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
		local fx 		= EffectData()
		fx:SetEntity(self.Weapon)
		fx:SetOrigin(self.Owner:GetShootPos())
		fx:SetNormal(self.Owner:GetAimVector())
		fx:SetAttachment(self.MuzzleAttachment)
		util.Effect("rg_muzzle_rifle",fx)
		self.Owner:SetAnimation( PLAYER_ATTACK1 )
		self.Owner:MuzzleFlash()
		self.Weapon:SetNextPrimaryFire(CurTime()+10)
		self:UseBolt()
	end
end

function SWEP:UseBolt()

	if self.Owner:GetAmmoCount( self.Weapon:GetPrimaryAmmoType() ) > 0 then
		timer.Simple(.25, function() 
		if SERVER and self.Weapon != nil then 
			self.Weapon:SetNWBool("Reloading", true)
			if self.Weapon:GetClass() == self.Gun and self.BoltAction then
				self.Owner:SetFOV( 0, 0.3 )
				self:SetIronsights(false)
				self.Owner:DrawViewModel(true)
				local boltactiontime = (self.Owner:GetViewModel():SequenceDuration())
				timer.Simple(boltactiontime, 
					function() if self.Weapon and self.Owner then if IsValid(self.Weapon) and IsValid(self.Owner) then 
					self.Weapon:SetNWBool("Reloading", false)
					if SERVER and self.Weapon != nil then
						if self.Owner:KeyDown(IN_ATTACK2) and self.Weapon:GetClass() == self.Gun then 
							self.Owner:SetFOV( 75/self.Secondary.ScopeZoom, 0.15 )                      		
							self.IronSightsPos = self.SightsPos					-- Bring it up
							self.IronSightsAng = self.SightsAng					-- Bring it up
							self.DrawCrosshair = false
							self:SetIronsights(true, self.Owner)
							self.Owner:DrawViewModel(false)
						
							self.Owner:RemoveAmmo(1, self.Primary.Ammo, false) -- out of the frying pan
							self.Weapon:SetClip1(self.Weapon:Clip1() + 1) --  into the fire
							self.Weapon:SetNextPrimaryFire(CurTime() + .1)
						--well, hope this works
						elseif !self.Owner:KeyDown(IN_ATTACK2) and self.Weapon:GetClass() == self.Gun then
							self.Owner:RemoveAmmo(1, self.Primary.Ammo, false) -- out of the frying pan
							self.Weapon:SetClip1(self.Weapon:Clip1() + 1) --  into the fire
							self.Weapon:SetNextPrimaryFire(CurTime() + .1)
						end
					end 
				end end end)
			-- else if self.Weapon:GetClass() == self.Gun and 
				-- self.BoltAction and	(self:GetIronsights() == false) then
					
			end
		end 
		end )
	else
		timer.Simple(.1, function() self:CheckWeaponsAndAmmo() end)
	end

end	

function SWEP:Reload()


//	self.Weapon:DefaultReload(ACT_VM_RELOAD)

		if not IsValid(self) then return end 
		if not IsValid(self.Owner) then return end
		if not IsValid(self.Weapon) then return end
		
		if  self.Weapon:GetNextPrimaryFire() > (CurTime() + 1) then 
			return 
		else
		   
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
--PATH addons/m9k/lua/weapons/m9k_fg42/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_fg42/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_fg42") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "FG 42"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
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
SWEP.ViewModel				= "models/weapons/v_rif_fg42.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_fg42.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("FG42_weapon.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 900			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 75		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.3		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "Rifle"				
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
SWEP.IronSightsPos = Vector(3.47, -6.078, 1.93)
SWEP.IronSightsAng = Vector(0.216, -0.082, 0)
SWEP.SightsPos = Vector(3.47, -6.078, 1.93)
SWEP.SightsAng = Vector(0.216, -0.082, 0)
SWEP.RunSightsPos = Vector(-5.738, -1.803, 0)
SWEP.RunSightsAng = Vector(-7.46, -47.624, 0)

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
--PATH addons/m9k/lua/weapons/m9k_jackhammer/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_jackhammer/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_jackhammer") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "Pancor Jackhammer"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 23			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_jackhammer2.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_pancor_jackhammer.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Weapon_Jackhammer.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 240			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 10		-- Size of a clip
SWEP.Primary.DefaultClip		= 30		-- Bullets you start with
SWEP.Primary.KickUp				= 1		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.5		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.4		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "Buckshot"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 6		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 10	-- Base damage per bullet
SWEP.Primary.Spread		= .045	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .045 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(4.026, -2.296, 0.917)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(4.026, -2.296, 0.917)
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
--PATH addons/m9k/lua/weapons/m9k_m249lmg/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_m249lmg/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_m249lmg") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "M249 LMG"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 35			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_machinegun249.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_m249_machine_gun.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Weapon_249M.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 855			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 150		-- Size of a clip
SWEP.Primary.DefaultClip		= 300		-- Bullets you start with
SWEP.Primary.KickUp				= 0.6		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.4		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.5		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "Rifle"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 65		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 27	-- Base damage per bullet
SWEP.Primary.Spread		= .035	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .024 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(-4.015, 0, 1.764)
SWEP.IronSightsAng = Vector(0, -0.014, 0)
SWEP.SightsPos = Vector(-4.015, 0, 1.764)
SWEP.SightsAng = Vector(0, -0.014, 0)
SWEP.RunSightsPos = Vector(5.081, -4.755, -1.476)
SWEP.RunSightsAng = Vector(0, 41.884, 0)

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
--PATH addons/m9k/lua/weapons/m9k_m29satan/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_m29satan/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_m29satan") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "M29 Satan"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 1				-- Slot in the weapon selection menu
SWEP.SlotPos				= 25			-- Position in the slot
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
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_pist_satan2.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_m29_satan.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("weapon_satan1.single")		-- Script that calls the primary fire sound
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
SWEP.Primary.Damage		= 32	-- Base damage per bullet
SWEP.Primary.Spread		= .015	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .01 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(-2.82, -1.247, 0.456)
SWEP.IronSightsAng = Vector(0.505, 2.407, 0)
SWEP.SightsPos = Vector(-2.82, -1.247, 0.456)
SWEP.SightsAng = Vector(0.505, 2.407, 0)
SWEP.RunSightsPos = Vector(2.068, -9.632, -5.983)
SWEP.RunSightsAng = Vector(61.171, -5.269, 0)

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
--PATH addons/m9k/lua/weapons/m9k_m60/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_m60/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_m60") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "M60 Machine Gun"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 34			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_m60machinegun.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_m60_machine_gun.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Weapon_M_60.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 675			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 200		-- Size of a clip
SWEP.Primary.DefaultClip		= 400		-- Bullets you start with
SWEP.Primary.KickUp				= 0.1		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.1		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.2		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "Rifle"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 65		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 22	-- Base damage per bullet
SWEP.Primary.Spread		= .001	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(-5.851, -2.763, 3.141)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(-5.851, -2.763, 3.141)
SWEP.SightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector(8.689, -3.444, -0.82)
SWEP.RunSightsAng = Vector(0, 44.18, 0)

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
--PATH addons/m9k/lua/weapons/m9k_miniguns/shared.lua:
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
--PATH addons/m9k/lua/weapons/m9k_ragingbull/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_ragingbull/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_ragingbull") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "Raging Bull"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 1				-- Slot in the weapon selection menu
SWEP.SlotPos				= 30			-- Position in the slot
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

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_raging_bull.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_taurus_raging_bull.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("weapon_r_bull.single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 250			-- This is in Rounds Per Minute
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
SWEP.Primary.Damage		= 31	-- Base damage per bullet
SWEP.Primary.Spread		= .001	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(2.773, 0, 0.846)
SWEP.IronSightsAng = Vector(-0.157, 0, 0)
SWEP.SightsPos = Vector(2.773, 0, 0.846)
SWEP.SightsAng = Vector(-0.157, 0, 0)
SWEP.RunSightsPos = Vector(0, 2.95, 0)
SWEP.RunSightsAng = Vector(-13.197, 5.737, 0)

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
--PATH addons/m9k/lua/weapons/m9k_remington1858/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_remington1858/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_remington1858") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "Remington 1858"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 1				-- Slot in the weapon selection menu
SWEP.SlotPos				= 31			-- Position in the slot
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

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_pist_re1858.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_remington_1858.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Remington.single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 150			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 6		-- Size of a clip
SWEP.Primary.DefaultClip		= 30		-- Bullets you start with
SWEP.Primary.KickUp				= 0.9		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.5		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.4		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "357"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 65		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 34	-- Base damage per bullet
SWEP.Primary.Spread		= .025	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .012 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(5.44, 0, 1.72)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(5.44, 0, 1.72)
SWEP.SightsAng = Vector(0, 0, 0)
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
--PATH addons/m9k/lua/weapons/m9k_scar/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_scar/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_scar") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "SCAR"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 37			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_fnscarh.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_fn_scar_h.mdl"	-- Weapon world model
SWEP.ShowWorldModel			= true
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Wep_fnscarh.single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 750			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.2		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.2		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.15		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "Rifle"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 24	-- Base damage per bullet
SWEP.Primary.Spread		= .001	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- Ironsight accuracy, should be the same for shotguns

SWEP.SelectiveFire		= true

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(-2.652, 0.187, -0.003)
SWEP.IronSightsAng = Vector(2.565, 0.034, 0)
SWEP.SightsPos = Vector(-2.652, 0.187, -0.003)
SWEP.SightsAng = Vector(2.565, 0.034, 0)
SWEP.RunSightsPos = Vector(6.063, -1.969, 0)
SWEP.RunSightsAng = Vector(-11.655, 57.597, 3.582)

SWEP.VElements = {
	["rect"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "gun_root", rel = "", pos = Vector(0, -0.461, 3.479), angle = Angle(0, 0, 90), size = Vector(0.009, 0.009, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/wystan/attachments/eotech/rect", skin = 0, bodygroup = {} }
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
--PATH addons/m9k/lua/weapons/m9k_sl8/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_sl8/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_sl8") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "HK SL8"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 47			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox		= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   	= false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= false		-- Set false if you want no crosshair from hip
SWEP.XHair					= false		-- Used for returning crosshair after scope. Must be the same as DrawCrosshair
SWEP.Weight				= 50			-- Rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.BoltAction				= false		-- Is this a bolt action rifle?
SWEP.HoldType 				= "ar2"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_hk_sl8.mdl"
SWEP.WorldModel				= "models/weapons/w_hk_sl8.mdl"
SWEP.Base 				= "bobs_scoped_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_hksl8.Single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 260		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip			= 60	-- Bullets you start with
SWEP.Primary.KickUp				= .4				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= .4			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= .4		-- Maximum up recoil (stock)
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
SWEP.ScopeScale 			= 0.9
SWEP.ReticleScale 			= 0.7

SWEP.Primary.NumShots	= 1		--how many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 70	--base damage per bullet
SWEP.Primary.Spread		= .015	--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- ironsight accuracy, should be the same for shotguns

-- enter iron sight info and bone mod info below

SWEP.IronSightsPos = Vector(3.079, -1.333, 0.437)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(3.079, -1.333, 0.437)
SWEP.SightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector(-6.22, -5.277, 0)
SWEP.RunSightsAng = Vector(-10.671, -64.598, 0)

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
--PATH addons/m9k/lua/weapons/m9k_usp/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_usp/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_usp") -- must be the name of your swep but NO CAPITALS!
if (GetConVar(SWEP.Gun.."_allowed")) != nil then
	if not (GetConVar(SWEP.Gun.."_allowed"):GetBool()) then SWEP.Base = "bobs_blacklisted" SWEP.PrintName = SWEP.Gun return end
end
SWEP.Category				= "M9K Pistols"
SWEP.Author				= "iron angles and models hexed and converted to gmod my Mr Fokkusu"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "HK USP"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 1				-- Slot in the weapon selection menu
SWEP.SlotPos				= 34			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight				= 3			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "pistol"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_pist_fokkususp.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_pist_fokkususp.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Weapon_fokkususp.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 750			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 15		-- Size of a clip
SWEP.Primary.DefaultClip		= 45		-- Bullets you start with
SWEP.Primary.KickUp				= 0.3		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "Pistol"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 16	-- Base damage per bullet
SWEP.Primary.Spread		= .02	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .01 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector (-2.5944, 0, 1.1433)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (-2.5944, 0, 1.1433)
SWEP.SightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector(3.444, -7.823, -6.27)
SWEP.RunSightsAng = Vector(60.695, 0, 0)
-- SWEP.RunSightsPos = Vector (-1.0917, 0, 1.496)
-- SWEP.RunSightsAng = Vector (-9.6507, -2.5621, 0)

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

--PATH addons/weaponandcontent/lua/weapons/swb_base/sh_move.lua:
local reg = debug.getregistry()
local GetActiveWeapon = reg.Player.GetActiveWeapon
local GetDTFloat = reg.Entity.GetDTFloat
local GetRunSpeed = reg.Player.GetRunSpeed
local GetWalkSpeed = reg.Player.GetWalkSpeed
local GetCrouchedWalkSpeed = reg.Player.GetCrouchedWalkSpeed
local Crouching = reg.Player.Crouching

local wep

function SWB_Move(ply, m)
	if Crouching(ply) then
		m:SetMaxSpeed(GetWalkSpeed(ply) * GetCrouchedWalkSpeed(ply))
	else
		wep = GetActiveWeapon(ply)
		
		if IsValid(wep) and wep.SWBWeapon then
			if wep.dt and wep.dt.State == SWB_AIMING then
				m:SetMaxSpeed(GetWalkSpeed(ply) * 0.75)
			else
				m:SetMaxSpeed((GetRunSpeed(ply) - wep.SpeedDec))
			end
		else
			m:SetMaxSpeed(GetRunSpeed(ply))
		end
	end
end

//hook.Add("Move", "SWB_Move", SWB_Move)
--PATH addons/vcmod_main_autoupdate/lua/weapons/vc_spikestrip_wep/shared.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

AddCSLuaFile("shared.lua")

SWEP.Category 		= "VCMod"
SWEP.PrintName		= "Spike strip"
SWEP.Author			= "freemmaann"
SWEP.Instructions	= "You can carry it, it's magic."

SWEP.ViewModel 		= Model("models/weapons/v_slam.mdl")
SWEP.WorldModel 	= Model("models/sentry/vc_spikestrip.mdl")
SWEP.ViewModelFOV	= 75

SWEP.Spawnable		= true
SWEP.AdminSpawnable	= true
SWEP.Slot 			= 5
SWEP.UseHands 		= true

SWEP.DrawAmmo		= false
SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

if CLIENT then SWEP.VC_WepSelectIcon= Material("materials/vcmod/gui/icons/spikestrips.png") end

if !VC.CodeEnt then VC.CodeEnt = {} end

local ID = "Spikestrip_wep"
function SWEP:Initialize(...) if VC and VC.CodeEnt[ID] and VC.CodeEnt[ID].Initialize then return VC.CodeEnt[ID].Initialize(self, ...) end end
function SWEP:Deploy(...) if VC and VC.CodeEnt[ID] and VC.CodeEnt[ID].Deploy then return VC.CodeEnt[ID].Deploy(self, ...) end return end
function SWEP:Holster(...) if VC and VC.CodeEnt[ID] and VC.CodeEnt[ID].Holster then return VC.CodeEnt[ID].Holster(self, ...) end return end
function SWEP:PrimaryAttack(...) if VC and VC.CodeEnt[ID] and VC.CodeEnt[ID].PrimaryAttack then return VC.CodeEnt[ID].PrimaryAttack(self, ...) end end
function SWEP:SecondaryAttack(...) if VC and VC.CodeEnt[ID] and VC.CodeEnt[ID].SecondaryAttack then return VC.CodeEnt[ID].SecondaryAttack(self, ...) end end
function SWEP:Think(...) if VC and VC.CodeEnt[ID] and VC.CodeEnt[ID].Think then return VC.CodeEnt[ID].Think(self, ...) end end

if CLIENT then
	function SWEP:GetViewModelPosition(...) if VC and VC.CodeEnt[ID] and VC.CodeEnt[ID].GetViewModelPosition then return VC.CodeEnt[ID].GetViewModelPosition(self, ...) end end
	function SWEP:DrawHUD(...) if VC and VC.CodeEnt[ID] and VC.CodeEnt[ID].DrawHUD then return VC.CodeEnt[ID].DrawHUD(self, ...) end end
	function SWEP:DrawWorldModel(...) if VC and VC.CodeEnt[ID] and VC.CodeEnt[ID].DrawWorldModel then return VC.CodeEnt[ID].DrawWorldModel(self, ...) end end
	function SWEP:ViewModelDrawn(...) if VC and VC.CodeEnt[ID] and VC.CodeEnt[ID].ViewModelDrawn then return VC.CodeEnt[ID].ViewModelDrawn(self, ...) end end
	function SWEP:DrawWeaponSelection(...) if VC and VC.CodeEnt.Wep_DrawSelection then return VC.CodeEnt.Wep_DrawSelection(self, ...) end end
end
--PATH addons/zeros_weedfarm/lua/weapons/zwf_wateringcan/cl_init.lua:
include("shared.lua")

SWEP.PrintName = "Лейка" // The name of your SWEP
SWEP.Slot = 1
SWEP.SlotPos = 2
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true // Do you want the SWEP to have a crosshair?

local wMod = ScrW() / 1920
local hMod = ScrH() / 1080

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
	self.LastWater = -1
	self.IsWatering = false
end

function SWEP:DrawHUD()
	local water = self:GetWater()


	draw.RoundedBox(5, 800 * wMod, 1027 * hMod, 320 * wMod, 45 * hMod, zwf.default_colors["gray02"])


	//Water Bar
	if water > 0 then

		local newWaterLvl = (315 / zwf.config.WateringCan.Capacity) * water
		newWaterLvl = math.Clamp(newWaterLvl,0,315)
		if self.LastWater ~= newWaterLvl then
			self.LastWater = self.LastWater + 100 * FrameTime()
			self.LastWater = math.Clamp(self.LastWater, 0, newWaterLvl)
		end

		draw.RoundedBox(5, 803 * wMod, 1029 * hMod, self.LastWater * wMod, 41 * hMod, zwf.default_colors["water"])
	end

	draw.SimpleText(zwf.language.General["Water"] .. ": " .. water .. zwf.config.UoL, "zwf_wateringcan_font01", 960 * wMod, 1065 * hMod, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
end

function SWEP:Think()
	local isWatering = self:GetIsWatering()

	if isWatering ~= self.IsWatering then
		if self.IsWatering then
			if isWatering == false and self.LoopingSoundID ~= nil then
				self:StopWaterSound()
			end
		else
			self.LoopingSoundID = self:StartLoopingSound("zwf_watering_loop")
		end

		self.IsWatering = isWatering
	end
end

function SWEP:StopWaterSound()
	if self.LoopingSoundID ~= nil then
		self:StopLoopingSound(self.LoopingSoundID)
		self.LoopingSoundID = nil
	end
end



function SWEP:OnRemove()
	self:StopWaterSound()
end

function SWEP:Holster(swep)

	self:StopWaterSound()
end

function SWEP:Deploy()

	self:StopWaterSound()
end



function SWEP:SecondaryAttack()

	self:SetNextSecondaryFire(CurTime() + 1)
end

function SWEP:PrimaryAttack()

	self:SetNextPrimaryFire(CurTime() + 1)
end

--PATH addons/cp_ballistic_shields/lua/entities/bs_dshield/cl_init.lua:
include('shared.lua')
include( "ballistic_shields/cl_bs_util.lua" ) 
ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Draw()  
	if(bshields.config.dShieldTexture == "") then self:DrawModel() return end
	local webmat = surface.GetURL(bshields.config.dShieldTexture, 256, 256)
	
	if ( self.Mat ) then
		render.MaterialOverrideByIndex( 5, self.Mat )
	end 
	local html_mat = webmat
	local matdata =
	{
        ["$basetexture"]=html_mat:GetName(),
        ["$decal"] = 1,
        ["$translucent"] = 1
	}

	local uid = string.Replace( html_mat:GetName(), "__vgui_texture_", "" )

	self.Mat = CreateMaterial( "bshields_webmat_"..uid, "VertexLitGeneric", matdata )
	self:DrawModel()
	render.ModelMaterialOverride( nil )
end   
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
--PATH addons/cp_ballistic_shields/lua/entities/bs_hshield/cl_init.lua:
include('shared.lua')
include( "ballistic_shields/cl_bs_util.lua" ) 
ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Draw()  
	if(bshields.config.hShieldTexture == "") then self:DrawModel() return end
	local webmat = surface.GetURL(bshields.config.hShieldTexture, 256, 256)
	
	if ( self.Mat ) then
		render.MaterialOverrideByIndex( 3, self.Mat )
	end 
	local html_mat = webmat
	local matdata =
	{
        ["$basetexture"]=html_mat:GetName(),
        ["$decal"] = 1,
        ["$translucent"] = 1
	}

	local uid = string.Replace( html_mat:GetName(), "__vgui_texture_", "" )

	self.Mat = CreateMaterial( "bshields_webmat_"..uid, "VertexLitGeneric", matdata )
	self:DrawModel()
	render.ModelMaterialOverride( nil )
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

--PATH addons/cp_ballistic_shields/lua/entities/bs_shield/cl_init.lua:
include('shared.lua')
include( "ballistic_shields/cl_bs_util.lua" ) 
ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Draw()  
	if(bshields.config.dShieldTexture == "") then self:DrawModel() return end
	local webmat = surface.GetURL(bshields.config.dShieldTexture, 256, 256)
	
	if ( self.Mat ) then
		render.MaterialOverrideByIndex( 6, self.Mat )
	end 
	local html_mat = webmat
	local matdata =
	{
        ["$basetexture"]=html_mat:GetName(),
        ["$decal"] = 1,
        ["$translucent"] = 1
	}

	local uid = string.Replace( html_mat:GetName(), "__vgui_texture_", "" )

	self.Mat = CreateMaterial( "bshields_webmat_"..uid, "VertexLitGeneric", matdata )
	self:DrawModel()
	render.ModelMaterialOverride( nil )
end  
--PATH addons/the_cocaine_factory/lua/entities/cocaine_drugs_buyer/cl_init.lua:
include( "shared.lua" )

function ENT:Initialize()
	self.m_bInitialized = true

	local Sunglasses = ents.CreateClientProp()
	Sunglasses:SetModel( "models/craphead_scripts/the_cocaine_factory/utility/sunglasses.mdl" )
	Sunglasses:SetPos( self:GetBonePosition( self:LookupBone( "ValveBiped.Bip01_Head1" ) ) + Vector( 0, 0, 2.2 ) )
	Sunglasses:SetAngles( self:GetAttachment( 1 ).Ang )
	Sunglasses:Spawn()
	Sunglasses:SetMoveType( MOVETYPE_NONE )
	Sunglasses:SetSolid( SOLID_VPHYSICS )
	self.localSunglas = Sunglasses
end

-- According to the GMod wiki the Initialize hook is not always called on the client. Thus the workaround is needed to be put in place
-- https://wiki.garrysmod.com/page/ENTITY/Initialize

function ENT:Think()
	if ( not self.m_bInitialized ) then
		self:Initialize()
	end

	if IsValid( self.localSunglas ) then
		self.localSunglas:SetPos( self:GetBonePosition( self:LookupBone( "ValveBiped.Bip01_Head1" ) ) + Vector( 0, 0, 2.2 ) )
		self.localSunglas:SetAngles( self:GetAttachment( 1 ).Ang )
	end
end

function ENT:OnRemove()
	if IsValid( self.localSunglas ) then
		self.localSunglas:Remove()
	end
end

local col_white = Color( 255, 255, 255, 255 )
local col_dark_gray = Color( 15, 15, 15, 240 )

function ENT:DrawTranslucent()
	self:DrawModel()
	
	if LocalPlayer():GetPos():DistToSqr( self:GetPos() ) >= TCF.Config.DisplayUIDistance then
		return
	end
	
	local leng = self:GetPos():Distance( EyePos() )
	local clam = math.Clamp( leng, 0, 255 )
	local main = ( 255 - clam / 1.7 )
	
	if ( main <= 0 ) then
		return
	end
	
	local ahAngle = self:GetAngles()
	local AhEyes = LocalPlayer():EyeAngles()
	
	ahAngle:RotateAroundAxis( ahAngle:Forward(), 90 )
	ahAngle:RotateAroundAxis( ahAngle:Right(), -90 )
	
	cam.Start3D2D( self:GetPos() +self:GetUp() * 79, Angle( 0, AhEyes.y - 90, 90 ), 0.08 )
		draw.RoundedBox( 0, -130, 10, 260, 60, Color( 32, 30, 32, 70 + main ) )
		draw.RoundedBox( 0, -130, 10, 260, 28, Color( 40, 38, 40, 70 + main ) )
		
		surface.SetDrawColor( 200, 200, 200, 70 + main )
		surface.SetMaterial( Material( "materials/craphead_scripts/the_cocaine_factory/icon_cocaine.png" )	)
		surface.DrawTexturedRect( -125, 14, 21, 21 )
		
		draw.SimpleText( TCF.Config.NPCDisplayName, "TCF_Simple19", -97.5, 23, Color( 200, 200, 200, 70 + main ), 0, 1 )
		draw.SimpleText( TCF.Config.NPCDisplayDescription, "TCF_Simple17", -120, 51, Color( 175, 175, 175, 70 + main ), 0, 1 )
		
		surface.SetDrawColor( Color( 77, 75, 77, 70 + main ) )
		surface.DrawOutlinedRect( -130, 10, 260, 60 )
	cam.End3D2D()	
end

net.Receive( "TCF_SellDrugsMenu", function( length, ply )
	local DonateSellBonus = net.ReadDouble()
	local BoxCoceAmount = net.ReadDouble()
	local CocainePayout = net.ReadDouble()
	
	local Cocaine_DialogMenu = vgui.Create( "DFrame" )
	Cocaine_DialogMenu:SetPos( -1, ScrH() * 0.47 )
	Cocaine_DialogMenu:SetTall( ScrH() )
	Cocaine_DialogMenu:SetWide( ScrW() + 1 )
	Cocaine_DialogMenu:SetTitle( "" )  
	Cocaine_DialogMenu:SetVisible( true )
	Cocaine_DialogMenu:SetDraggable( false ) 
	Cocaine_DialogMenu:ShowCloseButton( false )
	Cocaine_DialogMenu.Paint = function()
	end
	Cocaine_DialogMenu:MakePopup()
	Cocaine_DialogMenu:SizeToContents()   
	
	local DialogBox = vgui.Create( "DPanel", Cocaine_DialogMenu )
	DialogBox:SetPos( 0, ScreenScale( 60 ) )
	DialogBox:SetSize( Cocaine_DialogMenu:GetWide(), ScreenScale( 90 ) )
	DialogBox.Paint = function()
		draw.RoundedBoxEx( 8, 1, 1, DialogBox:GetWide(), DialogBox:GetTall(), col_dark_gray, false, false, false, false )
	end
	
	local DialogHeadText = vgui.Create( "DLabel", Cocaine_DialogMenu )
	DialogHeadText:SetPos( ScreenScale( 160 ), ScreenScale( 64 ) )
	DialogHeadText:SetSize( ScreenScale( 100 ), ScreenScale( 20 ) )
	DialogHeadText:SetTextColor( Color( 255, 255, 255, 255 ) )
	DialogHeadText:SetFont( "TCF_Trebuchet50" )
	DialogHeadText:SetText( table.Random( TCF.Config.RandomHeySentences ) )
	
	local DialogText = vgui.Create( "DLabel", Cocaine_DialogMenu )
	DialogText:SetPos( ScreenScale( 160 ), ScreenScale( 85 ) )
	DialogText:SetSize( ScreenScale( 320 ), ScreenScale( 32 ) )
	--DialogText:DockMargin( ScreenScale( 159 ), ScreenScale( 81.5 ), 10, 10 )
	--DialogText:Dock( FILL )
	DialogText:SetTextColor( Color( 255, 255, 255, 255 ) )
	DialogText:SetFont( "TCF_Trebuchet35" )
	--DialogText:SetAutoStretchVertical( true )
	if BoxCoceAmount == 1 then
		DialogText:SetText( TCF.Config.Lang["I see that you have brought me a box with just 1 package?\nThat's not a lot of cocaine, but I will still offer you a minor sum of money for your product."][TCF.Config.Language] )
	elseif BoxCoceAmount == 2 then
		DialogText:SetText( TCF.Config.Lang["I see that you have brought me a box with 2 packages?\nSo here is the deal. I'd like to offer you a fair amount of money for your product."][TCF.Config.Language] )
	elseif BoxCoceAmount == 3 then
		DialogText:SetText( TCF.Config.Lang["I see that you have brought me a box with 3 packages?\nGreat work!. I would like to offer you a large sum of money for your packages."][TCF.Config.Language] )
	elseif BoxCoceAmount == 4 then
		DialogText:SetText( TCF.Config.Lang["Ahh finally! I've been waiting for someone to bring me a full load of cocaine.\nI like your style, and would like to offer you a large sum of money for your packages."][TCF.Config.Language] )
	end
	DialogText:SetWrap( true )
	
	local NPCHead = vgui.Create( "DImage", Cocaine_DialogMenu )
	NPCHead:SetImage( "craphead_scripts/the_cocaine_factory/buyer_npc.png" )
	NPCHead:SetPos( ScreenScale( 10 ), ScreenScale( 15 ) )
	NPCHead:SetSize( ScreenScale( 135 ), ScreenScale( 135 ) )
	
	-- Cocaine Amount
	local CocaineAmountImage = vgui.Create( "DImage", Cocaine_DialogMenu )
	CocaineAmountImage:SetImage( "craphead_scripts/the_cocaine_factory/icon_cocaine.png" )
	CocaineAmountImage:SetPos( ScreenScale( 490 ), ScreenScale( 70 ) )
	CocaineAmountImage:SetSize( ScreenScale( 21.5 ), ScreenScale( 21.5 ) )
	
	local CocaineAmountText = vgui.Create( "DLabel", Cocaine_DialogMenu )
	CocaineAmountText:SetPos( ScreenScale( 515 ), ScreenScale( 70 ) )
	CocaineAmountText:SetSize( ScreenScale( 100 ), ScreenScale( 20 ) )
	CocaineAmountText:SetFont( "TCF_Trebuchet50" )
	if BoxCoceAmount == 1 then
		CocaineAmountText:SetText( BoxCoceAmount .." ".. TCF.Config.Lang["Pack"][TCF.Config.Language] )
	else
		CocaineAmountText:SetText( BoxCoceAmount .." ".. TCF.Config.Lang["Packs"][TCF.Config.Language] )
	end
	CocaineAmountText:SetColor( Color( 255, 255, 255, 255 ) )
	
	-- Rank Bonus
	local RankBonusImage = vgui.Create( "DImage", Cocaine_DialogMenu )
	RankBonusImage:SetImage( "craphead_scripts/the_cocaine_factory/icon_vip.png" )
	RankBonusImage:SetPos( ScreenScale( 490 ), ScreenScale( 95 ) )
	RankBonusImage:SetSize( ScreenScale( 21.5 ), ScreenScale( 21.5 ) )
	
	local RankBonusText = vgui.Create( "DLabel", Cocaine_DialogMenu )
	RankBonusText:SetPos( ScreenScale( 515 ), ScreenScale( 95 ) )
	RankBonusText:SetSize( ScreenScale( 100 ), ScreenScale( 20 ) )
	RankBonusText:SetFont( "TCF_Trebuchet50" )
	RankBonusText:SetColor( Color( 255, 255, 255, 255 ) )
	if LocalPlayer():GetDonatorBonus() > 1 then
		RankBonusText:SetText( TCF.Config.Lang["Rank Bonus"][TCF.Config.Language] )
	else
		RankBonusText:SetText( TCF.Config.Lang["No Bonus"][TCF.Config.Language] )
	end
	
	-- Money Reward
	local RewardImage = vgui.Create( "DImage", Cocaine_DialogMenu )
	RewardImage:SetImage( "craphead_scripts/the_cocaine_factory/icon_money.png" )
	RewardImage:SetPos( ScreenScale( 490 ), ScreenScale( 120 ) )
	RewardImage:SetSize( ScreenScale( 21.5 ), ScreenScale( 21.5 ) )
	
	local RewardText = vgui.Create( "DLabel", Cocaine_DialogMenu )
	RewardText:SetPos( ScreenScale( 515 ), ScreenScale( 120 ) )
	RewardText:SetSize( ScreenScale( 100 ), ScreenScale( 20 ) )
	RewardText:SetFont( "TCF_Trebuchet50" )
	RewardText:SetText( "+".. DarkRP.formatMoney( CocainePayout ) )
	RewardText:SetColor( Color( 255, 255, 255, 255 ) )
	
	local ConfirmButton = vgui.Create("DImageButton", Cocaine_DialogMenu)
	ConfirmButton:SetMaterial( "craphead_scripts/the_cocaine_factory/icon_blank.png" )
	ConfirmButton:SetColor( Color( 255, 255, 255, 255 ) )
	ConfirmButton:SetSize( ScreenScale( 86 ), ScreenScale( 21.5 ) )
	ConfirmButton:SetPos( ScreenScale( 160 ) , ScreenScale( 124 ) )
	ConfirmButton:SetToolTip( TCF.Config.Lang["Accepting the druggies offer will give you"][TCF.Config.Language] .." ".. DarkRP.formatMoney( CocainePayout ) )
	ConfirmButton.Paint = function()
		local struc = {}
		struc.pos = {}
		struc.pos[1] = ScreenScale( 43 ) 
		struc.pos[2] = ScreenScale( 10 )
		struc.color = col_white
		struc.text = TCF.Config.Lang["Accept"][TCF.Config.Language]
		struc.font = "TCF_Trebuchet35"
		struc.xalign = TEXT_ALIGN_CENTER
		struc.yalign = TEXT_ALIGN_CENTER
		draw.Text( struc )
	end
	ConfirmButton.DoClick = function()
		net.Start( "TCF_SellCocaine", LocalPlayer() )
		net.SendToServer()

		Cocaine_DialogMenu:Remove()
	end
	
	local DeclineButton = vgui.Create("DImageButton", Cocaine_DialogMenu)
	DeclineButton:SetMaterial( "craphead_scripts/the_cocaine_factory/icon_blank.png" )
	DeclineButton:SetSize( ScreenScale( 86 ), ScreenScale( 21.5 ) )
	DeclineButton:SetPos( ScreenScale( 250 ) , ScreenScale( 124 ) )
	DeclineButton:SetToolTip( TCF.Config.Lang["Decline the druggies offer and leave the shop!"][TCF.Config.Language] )
	DeclineButton.Paint = function()
		local struc = {}
		struc.pos = {}
		struc.pos[1] = ScreenScale( 43 ) 
		struc.pos[2] = ScreenScale( 10 )
		struc.color = col_white
		struc.text = TCF.Config.Lang["Decline"][TCF.Config.Language]
		struc.font = "TCF_Trebuchet35"
		struc.xalign = TEXT_ALIGN_CENTER
		struc.yalign = TEXT_ALIGN_CENTER
		draw.Text( struc )
	end
	DeclineButton.DoClick = function()
		Cocaine_DialogMenu:Remove()
	end
end )
--PATH addons/the_cocaine_factory/lua/entities/cocaine_stove/cl_init.lua:
include( "shared.lua" )

function ENT:Initialize()
	if TCF.Config.StoveSmokeEffect then
		self.emitTime = CurTime()
		
		self.potpos1 = ParticleEmitter( self:GetPos() )
		self.potpos2 = ParticleEmitter( self:GetPos() )
		self.potpos3 = ParticleEmitter( self:GetPos() )
		self.potpos4 = ParticleEmitter( self:GetPos() )
	end
end

local col_white_text = Color( 255, 255, 255, 150 )
local col_white_trans = Color( 255, 255, 255, 75 )
local col_white = Color( 255, 255, 255, 255 )
local col_black_outline = Color( 0, 0, 0, 255 )

function ENT:DrawTranslucent()
    self:DrawModel()
	
	if TCF.Config.ShowStoveHealth then
		local pos = self:GetPos()
		local ang = self:GetAngles()	
		
		ang:RotateAroundAxis( ang:Up(), 90 )
		ang:RotateAroundAxis( ang:Forward(), 90 )
		
		cam.Start3D2D( pos + ang:Up() * 16, ang, 0.09 )
			surface.SetDrawColor( col_white )
			surface.SetMaterial( Material( "craphead_scripts/the_cocaine_factory/bg_stripes.png") )
			surface.DrawTexturedRect( -100, -143, 200, 24 )
			
			surface.SetDrawColor( col_white_trans )
			surface.SetMaterial( Material( "craphead_scripts/the_cocaine_factory/bg_red.png") )
			surface.DrawTexturedRect( -100, -143, math.Clamp( self:GetHP(), 0, 200 ), 24 )
			
			draw.SimpleTextOutlined( self:GetHP() .." HP", "TCF_HealthDisplay", 0, -132, col_white_text, 1, 1, 1.4, col_black_outline )
		cam.End3D2D()
	end
end

function ENT:Think()
	if TCF.Config.StoveSmokeEffect then
		if self:GetGasAmount() > 0 then
			if self.emitTime < CurTime() then
				if self:GetPlate1() then
					if self:GetBodygroup( 11 ) == 1 then
						if self:GetCelious1() >= TCF.Config.MinTemperatureForSmoke then
							local smoke = self.potpos1:Add( "particle/smokesprites_000"..math.random( 1, 9 ), self:GetAttachment( 1 ).Pos )
							smoke:SetVelocity( Vector( 0, 0, math.random( 115, 180 ) ) )
							smoke:SetDieTime( math.Rand( 1, 1 ) )
							smoke:SetStartAlpha( 5 )
							smoke:SetEndAlpha( 0 )
							smoke:SetStartSize( math.random( 5, 10 ) )
							smoke:SetEndSize( math.random( 20, 30 ) )
							smoke:SetRoll( math.Rand( 180, 480 ) )
							smoke:SetRollDelta( math.Rand( -3, 3 ) ) 
							smoke:SetColor( 255, 255, 255, 5 ) -- smoke:SetColor( math.random( 50, 100 ), math.random( 50, 100 ), math.random( 50, 100 ), 255 )
							smoke:SetGravity( Vector( 0, 0, 10 ) )
							smoke:SetAirResistance( 256 )
							
							self.emitTime = CurTime() + 0.1
						end
					end
				end
				if self:GetPlate2() then
					if self:GetBodygroup( 12 ) == 1 then
						if self:GetCelious2() >= TCF.Config.MinTemperatureForSmoke then
							local smoke = self.potpos2:Add( "particle/smokesprites_000"..math.random( 1, 9 ), self:GetAttachment( 2 ).Pos )
							smoke:SetVelocity( Vector( 0, 0, math.random( 115, 180 ) ) )
							smoke:SetDieTime( math.Rand( 1, 1 ) )
							smoke:SetStartAlpha( 5 )
							smoke:SetEndAlpha( 0 )
							smoke:SetStartSize( math.random( 5, 10 ) )
							smoke:SetEndSize( math.random( 20, 30 ) )
							smoke:SetRoll( math.Rand( 180, 480 ) )
							smoke:SetRollDelta( math.Rand( -3, 3 ) ) 
							smoke:SetColor( 255, 255, 255, 5 ) -- smoke:SetColor( math.random( 50, 100 ), math.random( 50, 100 ), math.random( 50, 100 ), 255 )
							smoke:SetGravity( Vector( 0, 0, 10 ) )
							smoke:SetAirResistance( 256 )
							
							self.emitTime = CurTime() + 0.1
						end
					end
				end
				if self:GetPlate3() then
					if self:GetBodygroup( 13 ) == 1 then
						if self:GetCelious3() >= TCF.Config.MinTemperatureForSmoke then
							local smoke = self.potpos3:Add( "particle/smokesprites_000"..math.random( 1, 9 ), self:GetAttachment( 3 ).Pos )
							smoke:SetVelocity( Vector( 0, 0, math.random( 115, 180 ) ) )
							smoke:SetDieTime( math.Rand( 1, 2 ) )
							smoke:SetStartAlpha( 5 )
							smoke:SetEndAlpha( 0 )
							smoke:SetStartSize( math.random( 5, 10 ) )
							smoke:SetEndSize( math.random( 20, 30 ) )
							smoke:SetRoll( math.Rand( 180, 480 ) )
							smoke:SetRollDelta( math.Rand( -3, 3 ) ) 
							smoke:SetColor( 255, 255, 255, 5 ) -- smoke:SetColor( math.random( 50, 100 ), math.random( 50, 100 ), math.random( 50, 100 ), 255 )
							smoke:SetGravity( Vector( 0, 0, 10 ) )
							smoke:SetAirResistance( 256 )
							
							self.emitTime = CurTime() + 0.1
						end
					end
				end
				if self:GetPlate4() then
					if self:GetBodygroup( 14 ) == 1 then
						if self:GetCelious4() >= TCF.Config.MinTemperatureForSmoke then
							local smoke = self.potpos4:Add( "particle/smokesprites_000"..math.random( 1, 9 ), self:GetAttachment( 4 ).Pos )
							smoke:SetVelocity( Vector( 0, 0, math.random( 115, 180 ) ) )
							smoke:SetDieTime( math.Rand( 1, 2 ) )
							smoke:SetStartAlpha( 5 )
							smoke:SetEndAlpha( 0 )
							smoke:SetStartSize( math.random( 5, 10 ) )
							smoke:SetEndSize( math.random( 20, 30 ) )
							smoke:SetRoll( math.Rand( 180, 480 ) )
							smoke:SetRollDelta( math.Rand( -3, 3 ) ) 
							smoke:SetColor( 255, 255, 255, 5 ) -- smoke:SetColor( math.random( 50, 100 ), math.random( 50, 100 ), math.random( 50, 100 ), 255 )
							smoke:SetGravity( Vector( 0, 0, 10 ) )
							smoke:SetAirResistance( 256 )
							
							self.emitTime = CurTime() + 0.1
						end
					end
				end
			end
		end
	end
	-- Plate Temperature 
	if self:GetCelious1() >= 0 then
		self:SetPoseParameter( "thermometer_1", self:GetCelious1() )
	end
	
	if self:GetCelious2() >= 0 then
		self:SetPoseParameter( "thermometer_2", self:GetCelious2() )
	end
	
	if self:GetCelious3() >= 0 then
		self:SetPoseParameter( "thermometer_3", self:GetCelious3() )
	end
	
	if self:GetCelious4() >= 0 then
		self:SetPoseParameter( "thermometer_4", self:GetCelious4() )
	end
	
	-- Gas Amount
	if self:GetGasAmount() >= 0 then
		self:SetPoseParameter( "arrow", self:GetGasAmount() )
	end
	
	if self:GetPlate1() then
		self:SetPoseParameter( "button_1", 100 )
	elseif not self:GetPlate1() then
		self:SetPoseParameter( "button_1", 0 )
	end
		
	if self:GetPlate2() then
		self:SetPoseParameter( "button_2", 100 )
	elseif not self:GetPlate2() then
		self:SetPoseParameter( "button_2", 0 )
	end
		
	if self:GetPlate3() then
		self:SetPoseParameter( "button_3", 100 )
	elseif not self:GetPlate3() then
		self:SetPoseParameter( "button_3", 0 )
	end
		
	if self:GetPlate4() then
		self:SetPoseParameter( "button_4", 100 )
	elseif not self:GetPlate4() then
		self:SetPoseParameter( "button_4", 0 )
	end
	
	self:InvalidateBoneCache()
end
--PATH addons/_gmbheist/lua/entities/gmb_bank/cl_init.lua:
include("shared.lua")

surface.CreateFont("gmb.heits_1font", {font = "Arial",size = 30,weight = 800,blursize = 0,scanlines = 0,antialias = true,underline = false,italic = false,strikeout = false,symbol = false,rotary = false,shadow = false,additive = false,outline = false,})

local math_abs              = math.abs
local string_find           = string.find
local surface_SetDrawColor  = surface.SetDrawColor
local surface_DrawRect      = surface.DrawRect

local function DrawRect(x, y, w, h, t)
    if not t then t = 1 end
    surface_DrawRect(x, y, w, t)
    surface_DrawRect(x, y + (h - t), w, t)
    surface_DrawRect(x, y, t, h)
    surface_DrawRect(x + (w - t), y, t, h)
end

local function OutlinedBox(x, y, w, h, col, bordercol, thickness)
    surface_SetDrawColor(col)
    surface_DrawRect(x + 1, y + 1, w - 2, h - 2)

    surface_SetDrawColor(bordercol)
    DrawRect(x, y, w, h, thickness)
end

function ENT:Initialize()	

end;

function ENT:Draw()
	self:DrawModel();
	
	local pos = self:GetPos()
	local ang = self:GetAngles()
	local eblan = (math.sin(CurTime()) + 1) / 2

	local vaultColor = Color(60, 220, 108, 255);
	
	if (self:GetNW2Float("moneyStored")>0) then
		vaultColor = Color(60, 220, 108, 255);
	else
		vaultColor = Color(155, 0, 0, 255);
	end;
	
	ang:RotateAroundAxis(ang:Up(), 90);
	ang:RotateAroundAxis(ang:Forward(), 90);	
	if LocalPlayer():GetPos():Distance(self:GetPos()) < 256 then
		cam.Start3D2D(pos+ang:Up()*30.35, ang, 0.15)
    		OutlinedBox( -180, -420, 350, 75, Color(41,41,41,175), Color(eblan * 255, 0, 255 - (eblan * 255),100), 2)
    		draw.SimpleTextOutlined('Хранилище банка', "gmb.heits_1font", -5, -400, Color(255,155,55), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0, 0, 0, 100))
    		draw.SimpleTextOutlined('ГамбитБанк', "gmb.heits_1font", -5, -370, Color(255,155,55), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0, 0, 0, 100))
			
			if GMB_HEIST_ROBBERS[team.GetName(LocalPlayer():Team())] then
				OutlinedBox( -180, -340, 350, 80, Color(41,41,41,220), Color(175,175,175), 2)
				if ((self:GetNW2Int("vaultStatus") == 0) and (self:GetNW2Float("coolDown")==0)) then
					draw.SimpleTextOutlined("Ограбление банка", "gmb.heits_1font", -15, -315, Color(255, 25, 25, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100))
					draw.SimpleTextOutlined("Нажмите [E]", "gmb.heits_1font", -15, -290, Color(255, 25, 25, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100))	
				elseif ((self:GetNW2Int("vaultStatus") == 0) and (self:GetNW2Float("coolDown")>0)) then
					draw.SimpleTextOutlined("Ограбление через "..math.Round(self:GetNW2Float("coolDown")/60).."мин", "gmb.heits_1font", -5, -315, Color(255, 25, 25, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100))
					draw.SimpleTextOutlined("Спланируйте ограбление!", "gmb.heits_1font", -5, -290, Color(255, 25, 25, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100))		
				elseif ((self:GetNW2Int("vaultStatus") == 1) and (self:GetNW2Float("coolDown")==0)) then
					draw.SimpleTextOutlined("Ограбление ("..self:GetNW2Float("timeOpen").."сек)", "gmb.heits_1font", -10, -315, Color(255, 25, 25, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100))
					draw.SimpleTextOutlined("Кладите деньги в сумку", "gmb.heits_1font", -10, -290, Color(255, 25, 25, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100))
				end
			end			
		cam.End3D2D();		
	end;
end;

--PATH addons/itemstore_new/lua/entities/itemstore_item.lua:
ENT.Type = "anim"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:SetItem( item )
	self.Item = item

	if SERVER then
		self:Sync()
	end
end

function ENT:GetItem()
	return self.Item
end

if SERVER then
	AddCSLuaFile()

	function ENT:Initialize()
		local item = self:GetItem()
		if not item then self:Remove() end

		self:SetModel( item:GetModel() )

		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetCollisionGroup( COLLISION_GROUP_WEAPON )
		self:SetUseType( SIMPLE_USE )

		self:SetColor( item:GetColor() or color_white )
		self:SetMaterial( item:GetMaterial() )

		local phys = self:GetPhysicsObject()
		if not IsValid( phys ) then
			self:PhysicsInitSphere( 16, "default" )
			phys = self:GetPhysicsObject()
		end

		phys:Wake()
	end

	function ENT:Use( pl )
		if not IsValid( pl ) then return end

		local item = self:GetItem()
		if not item then return end

		if pl.Inventory:AddItem( item ) then
			pl:EmitSound( "items/itempickup.wav" )
			self:Remove()
		else
			pl:SendError( "Your inventory is full." )
		end
	end

	function ENT:Sync( pl )
		local item = self:GetItem()
		if not item then return end

		net.Start( "ItemStoreSyncItem" )
			net.WriteEntity( self )
			net.WriteString( item.Class )
			net.WriteTable( item.Data )
		net.Send( pl or player.GetAll() )
	end

	util.AddNetworkString( "ItemStoreSyncItem" )
	net.Receive( "ItemStoreSyncItem", function( len, pl )
		local ent = net.ReadEntity()
		if not IsValid( ent ) then return end

		ent:Sync( pl )
	end )
else
	function ENT:Initialize()
		net.Start( "ItemStoreSyncItem" )
			net.WriteEntity( self )
		net.SendToServer()
	end

	function ENT:DrawTranslucent()
		local item = self:GetItem()
		if not item then return end

		item:PreRender( self )
			self:DrawModel()
		item:PostRender( self )
	end

	net.Receive( "ItemStoreSyncItem", function()
		local ent = net.ReadEntity()
		
		if not IsValid( ent ) then return end
		if not ent.SetItem then return end

		local class = net.ReadString()
		local data = net.ReadTable()

		ent:SetItem( itemstore.Item( class, data ) )
	end )
end

--PATH addons/111mod/lua/entities/keypad/sh_init.lua:
ENT.Base = "base_gmodentity"
ENT.Type = "anim"

ENT.Model = Model("models/props_lab/keypad.mdl")

ENT.Spawnable = true

ENT.Scale = 0.02
ENT.Value = ""

ENT.Status_None = 0
ENT.Status_Granted = 1
ENT.Status_Denied = 2

ENT.Command_Enter = 0
ENT.Command_Accept = 1
ENT.Command_Abort = 2

ENT.IsKeypad = true

AccessorFunc(ENT, "m_Password", "Password", FORCE_STRING)
AccessorFunc(ENT, "m_KeypadOwner", "KeypadOwner")

function ENT:Initialize()
	self:SetModel(self.Model)

	if CLIENT then
		self.Mins = self:OBBMins()
		self.Maxs = self:OBBMaxs()

		self.Width2D, self.Height2D = (self.Maxs.y - self.Mins.y) / self.Scale , (self.Maxs.z - self.Mins.z) / self.Scale
	end

	if SERVER then
		self:PhysicsInit(SOLID_VPHYSICS)

		local phys = self:GetPhysicsObject()

		if IsValid(phys) then
			phys:Wake()
		end

		self:SetValue("")
		self:SetPassword("1337")
		self:SetKeypadOwner(NULL)

		-- Initialize defaults
		self:GetData()

		self:Reset()
	end
end

function ENT:SetupDataTables()
	self:NetworkVar( "String", 0, "Text" )

	self:NetworkVar( "Int", 0, "Status" )

	self:NetworkVar( "Bool", 0, "Secure" )
end
--PATH addons/plib_v5/lua/plib/libraries/client/texture.lua:
require 'hash'

texture = {}

local TEXTURE = {
	__tostring = function(self)
		return self.Name
	end
}
TEXTURE.__index = TEXTURE
TEXTURE.__concat = TEXTURE.__tostring

debug.getregistry().Texture = TEXTURE

local textures 	= {}
local proxyurl 	= 'https://YOUR_SITE.COM/?url=%s&width=%i&height=%i&format=%s'

if (not file.IsDir('texture', 'DATA')) then
	file.CreateDir 'texture'
else
	local files = file.Find('texture/*', 'DATA')
	if (#files > 1000) then
		for k, v in ipairs(files) do
			file.Delete('texture/' .. v)
		end
	end
end

function texture.Create(name)
	local ret = setmetatable({
		Name 	= name,
		URL 	= '',
		Width 	= 1000,
		Height 	= 1000,
		Busy 	= false,
		Cache 	= true,
		Proxy 	= true,
		Format 	= 'jpg',
	}, TEXTURE)
	textures[name] = ret
	return ret
end

function texture.Get(name)
	if textures[name] then
		return textures[name]:GetMaterial()
	end
end

function texture.Delete(name)
	textures[name] = nil
end

function texture.SetProxy(url)
	proxyurl = url
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
	return (self.Busy == true)
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

		http.Fetch(self.Proxy and string.format(proxyurl, url:URLEncode(), self.Width, self.Height, self.Format) or url, function(body, len, headers, code)
			if (self.Cache) then
				file.Write(self.File, body)
				self.IMaterial = Material('data/' .. self.File, 'smooth')
			else
				local tempfile = 'texture/tmp_' .. os.time() .. '_' .. self:GetUID() .. '.png'
				file.Write(tempfile, body)

				self.IMaterial = Material('data/' .. tempfile, 'smooth')

				timer.Simple(1, function()
					file.Delete(tempfile)
				end)
			end

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

	if self.Cache and file.Exists(cachefile, 'DATA') then
		self.File = cachefile
		self.IMaterial = Material('data/' .. self.File, 'smooth')

		if callback then
			callback(self, self.IMaterial)
		end
	else
		local w, h = self.Width, self.Height

		local hookId = 'texture.PostRender' .. self:GetUID()
		hook.Add('PostRender', hookId, function()
			hook.Remove('PostRender', hookId)

			local drawRT = GetRenderTarget(self:GetName(), w, h, true)

			render.PushRenderTarget(drawRT, 0, 0, w, h)
				render.OverrideAlphaWriteEnable(true, true)
				surface.DisableClipping(true)
				render.ClearDepth()
				render.Clear(0, 0, 0, 0)

					cam.Start2D()
						func(self, w, h)
					cam.End2D()

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

				surface.DisableClipping(false)
				render.OverrideAlphaWriteEnable(false)
			render.PopRenderTarget()

			if self.Cache then
				self.IMaterial = Material('data/' .. self.File)
			end

			if callback then
				callback(self, self.IMaterial)
			end
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

/*
Basic usage

local logo = texture.Create('example')
	:SetSize(570, 460)
	:SetFormat('png')
	:Download('https://i.imgur.com/TZcJ1CK.png', print, print)
	:Render(function(self, w, h)
		draw.Box(0, 0, w, h, Color(0,255,0))

		surface.SetDrawColor(255,255,255,255)
		surface.SetMaterial(self:GetMaterial())
		surface.DrawTexturedRect(0, 0, w, h)

		draw.SimpleText('hello!!!!', 'CloseCaption_BoldItalic', 100, 100, Color(0,0,0), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	end)

hook.Add('HUDPaint', 'awdawd', function()
	if logo:GetMaterial() then
		surface.SetDrawColor(255,255,255,255)
		surface.SetMaterial(logo:GetMaterial())
		surface.DrawTexturedRect(35, 35, 570, 460)
	end
end)
*/
--PATH gamemodes/darkrp/entities/entities/media_tv_small.lua:

AddCSLuaFile()

ENT.Base		= 'media_base'
ENT.PrintName	= 'Small TV'
ENT.Category 	= 'RP Media'
ENT.Spawnable	= true

ENT.MediaPlayer = true

ENT.Model 		= 'models/props/cs_office/TV_plasma.mdl'

if (CLIENT) then
	local vec = Vector(6,0,19)
	local ang = Angle(0,90,90)
	function ENT:Draw()
		self:DrawModel()
		cam.Start3D2D(self:LocalToWorld(vec), self:LocalToWorldAngles(ang), 0.065)
			self:DrawScreen(-860 * .5, -256, 860, 512)
		cam.End3D2D()
	end
end
--PATH addons/111mod/lua/entities/metal_detector/shared.lua:

-----------------------------------------------------
ENT.Type = 'anim'
ENT.Base = 'base_anim'
ENT.PrintName = 'Metal Detector'
ENT.Author = 'aStonedPenguin'
ENT.Spawnable = true
ENT.Category = 'GambitRP'
ENT.MaxHealth = 150

function ENT:SetupDataTables()
	self:NetworkVar('Int', 1, 'Mode')
	self:NetworkVar('Entity', 1, 'owning_ent')
end
--PATH addons/111mod/lua/entities/moneyevent/cl_init.lua:
include("shared.lua");

function ENT:Initialize()	

end

function ENT:Draw()
	self:DrawModel()
end
--PATH addons/truefishing/lua/entities/npc_fishshop/cl_init.lua:
include("shared.lua")

ENT.Type = "ai"
ENT.Base = "base_ai"
ENT.Author = "Tomasas"
ENT.PrintName = "Рыбак"

function ENT:Draw()
	self:DrawModel()
	
	local plypos, pos = LocalPlayer():GetPos(), self:GetPos()
	pos.z = pos.z + 76
	local faceplant = (plypos-pos):Angle()
	faceplant.p = 180
	faceplant.y = faceplant.y-90
	faceplant.r = faceplant.r-90
	cam.Start3D2D(pos, faceplant, 0.1)
		draw.SimpleText(TrueFishLocal("fisherman"), "SegoeUI_NormalBold_60w", 0, 0, color_black, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		draw.SimpleText(TrueFishLocal("fisherman"), "SegoeUI_NormalBold_60", 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	cam.End3D2D()
end

--PATH addons/foodmode/lua/entities/povaridzenpc/cl_init.lua:
include('shared.lua')
local color_white = Color(255, 255, 255)
local color_black = Color(0, 0, 0)
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
        draw_SimpleTextOutlined('Повариха Вика', '3d2d', 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, color_black)
        cam_End3D2D()
    end
end

local fr

net.Receive('povarshopMenu', function()
    if IsValid(fr) then
        fr:Close()
    end

    local w, h = ScrW() * .5, ScrH() * .5

    fr = ui.Create('ui_frame', function(self)
        self:SetTitle('Ингридиенты')
        self:SetSize(w, h)
        self:Center()
        self:MakePopup()
    end)

    local list = ui.Create('ui_scrollpanel', function(self, p)
        self:SetPos(5, 30)
        self:SetSize(p:GetWide() - 10, p:GetTall() - 35)
        self:SetPadding(5)
    end, fr)

    local catz = {}

    for k, v in pairs(PovarItems) do
        catz[v.Ingridient] = catz[v.Ingridient] or {}
        catz[v.Ingridient][k] = v
    end

    for a, z in pairs(catz) do
        for k, v in SortedPairs(z) do
            local pnl = ui.Create('ui_panel')
            pnl:SetTall(50)
            list:AddItem(pnl)

            if (v.Model ~= nil) then
                local prvbg = ui.Create('ui_panel', function(self, p)
                    self:SetPos(0, 0)
                    self:SetSize(50, 50)
                end, pnl)

                --self.Paint = function(self, w, h)
                --draw.Box(2, 2, w - 4, h - 4, Color(255,255,255),Color(255,255,255))
                --end
                ui.Create('DModelPanel', function(self, p)
                    self:SetSize(45, 45)
                    self:SetPos(2.5, 2.5)
                    self:SetModel(v.Model)
                    local min, max = self.Entity:GetRenderBounds()
                    self:SetCamPos(max * 1.5)
                    self:SetLookAt(Vector(0, 0, 1))
                end, prvbg)
            end

            local Title = ui.Create('DLabel', pnl)
            Title:SetFont('ui.20')
            Title:SetPos(55, 10)
            Title:SetText(v.Name .. "   |                     ")
            Title:SizeToContents()

            function Title:Paint(w, h)
                local color_white = Color(255, 255, 255)
                local color_black = Color(0, 0, 0)
                draw.SimpleTextOutlined('У вас - ' .. LocalPlayer():HFM_AmountItem(v.Ingridient), 'ui.20', w - 5, h - 20, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_RIGHT, 1, color_black)
            end

            local Price = ui.Create('DLabel', pnl)
            Price:SetFont('ui.20')
            Price:SetPos(pnl:GetWide() / 1.5 - Price:GetWide() / 2, 10)
            Price:SetText('$' .. (v.Price))
            Price:SizeToContents()
            local Buy = ui.Create('DButton', pnl)
            Buy:SetPos(pnl:GetWide() - 110, 5)
            Buy:SetSize(100, 40)
            Buy:SetText('Купить')

            Buy.DoClick = function()
                RunConsoleCommand('povarbuy', v.Name)
                surface.PlaySound('items/itempickup.wav')
            end
        end
    end
end)
--PATH gamemodes/darkrp/entities/entities/spawned_shipment/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Shipment"
ENT.Author = "philxyz"
ENT.Spawnable = false
ENT.IsSpawnedShipment = true

function ENT:SetupDataTables()
    self:NetworkVar("Int",0,"contents")
    self:NetworkVar("Int",1,"count")
    self:NetworkVar("Float", 0, "gunspawn")
    self:NetworkVar("Entity", 0, "owning_ent")
    self:NetworkVar("Entity", 1, "gunModel")
end

DarkRP.declareChatCommand{
    command = "splitshipment",
    description = "Split the shipment you're looking at.",
    delay = 1.5
}

DarkRP.declareChatCommand{
    command = "makeshipment",
    description = "Create a shipment from a dropped weapon.",
    delay = 1.5
}

--PATH gamemodes/darkrp/entities/entities/spawned_weapon/cl_init.lua:
include("shared.lua")

function ENT:Draw()
    local ret = hook.Call("onDrawSpawnedWeapon", nil, self)
    if ret ~= nil then return end
    self:DrawModel()

    if self.dt.amount == 1 then return end

    local Pos = self:GetPos()
    local Ang = self:GetAngles()
    local text = DarkRP.getPhrase("amount") .. self.dt.amount

    surface.SetFont("HUDNumber5")
    local TextWidth = surface.GetTextSize(text)

    Ang:RotateAroundAxis(Ang:Forward(), 90)

    cam.Start3D2D(Pos + Ang:Up(), Ang, 0.11)
        draw.WordBox(2, 0, -40, text, "HUDNumber5", Color(140, 0, 0, 100), Color(255,255,255,255))
    cam.End3D2D()

    Ang:RotateAroundAxis(Ang:Right(), 180)

    cam.Start3D2D(Pos + Ang:Up() * 3, Ang, 0.11)
        draw.WordBox(2, -TextWidth, -40, text, "HUDNumber5", Color(140, 0, 0, 100), Color(255,255,255,255))
    cam.End3D2D()
end

--[[---------------------------------------------------------------------------
Create a shipment from a spawned_weapon
---------------------------------------------------------------------------]]
properties.Add("createShipment",
    {
        MenuLabel   =   DarkRP.getPhrase("createshipment"),
        Order       =   2002,
        MenuIcon    =   "icon16/add.png",

        Filter      =   function(self, ent, ply)
                            if not IsValid(ent) then return false end
                            return ent.IsSpawnedWeapon
                        end,

        Action      =   function(self, ent)
                            if not IsValid(ent) then return end
                            RunConsoleCommand("darkrp", "makeshipment", ent:EntIndex())
                        end
    }
)

--[[---------------------------------------------------------------------------
Interface
---------------------------------------------------------------------------]]
DarkRP.hookStub{
    name = "onDrawSpawnedWeapon",
    description = "Draw spawned weapons.",
    realm = "Client",
    parameters = {
        {
            name = "weapon",
            description = "The weapon to perform drawing operations on.",
            type = "Player"
        }
    },
    returns = {
        {
            name = "value",
            description = "Return a value to completely override drawing",
            type = "any"
        }
    }
}

--PATH addons/vcmod_main_autoupdate/lua/entities/vc_fuel_station_diesel/cl_init.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

include('shared.lua')

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Initialize() self.VC_PVsb = util.GetPixelVisibleHandle() end

local ID = "Fuel_station"
function ENT:Draw(...) if VC and VC.CodeEnt[ID] and VC.CodeEnt[ID].Draw then return VC.CodeEnt[ID].Draw(self, ...) end end
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_pickup_fuel_diesel/cl_init.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

include('shared.lua')

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Initialize() self.VC_Color = Color(0,255,255,255) self.VC_Length = 154 self.VC_Text = "Vehicle Fuel 100%" self.VC_PVsb = util.GetPixelVisibleHandle() end
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_pickup_light/cl_init.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

include('shared.lua')

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Initialize() self.VC_Color = Color(255,100,65,255) self.VC_Text = "Vehicle part" self.VC_PVsb = util.GetPixelVisibleHandle() end
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_pickup_tire/shared.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.
ENT.Base 		= "base_anim"
ENT.Type 		= "anim"
ENT.PrintName	= "Vehicle part: wheel"
ENT.Author		= "freemmaann"
ENT.Category	= "VCMod"

ENT.Spawnable = true
ENT.AdminSpawnable = true

ENT.VC_Type = "carpart"
ENT.VC_Method = "wheel"
ENT.VC_CanBeDamaged = false
--PATH addons/zeros_methlab2/lua/entities/zmlab2_equipment/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zmlab2.Equipment.Initialize(self)
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	self:DrawModel()
	zmlab2.Equipment.DrawUI(self)
end

function ENT:OnRemove()
	zmlab2.Equipment.OnRemove(self)
end

--PATH addons/zeros_methlab2/lua/entities/zmlab2_npc/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zmlab2.NPC.Initialize(self)
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	self:DrawModel()
	zmlab2.NPC.Draw(self)
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_backmix/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zwf.f.EntList_Add(self)
end

function ENT:Draw()
	self:DrawModel()
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_splice_lab/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zwf.f.EntList_Add(self)
	self.ClientProps = {}

	self.WeedA = nil
	self.WeedB = nil

	self.PerfData = {
		WeedA_ID = 1,
		WeedA_Name = "nil",
		WeedA_Amount = 100,
		PerfA_Time = 100,
		PerfA_Amount = 100,
		PerfA_THC = 100,

		WeedB_ID = 1,
		WeedB_Name = "nil",
		WeedB_Amount = 100,
		PerfB_Time = 100,
		PerfB_Amount = 100,
		PerfB_THC = 100
	}

	self.SpliceData = nil

	self.IsAnimating = false

	self.ProgressSmooth = -1
end

function ENT:Draw()
	self:DrawModel()

	if zwf.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 300) then
		self:DrawInfo()
	end
end

function ENT:GetColorFromBoostValue(boost)
	if (boost - 100) < 0 then
		return zwf.default_colors["red03"]
	else
		return zwf.default_colors["green06"]
	end
end

function ENT:DrawItem(xPos,mat,txt,color)
	draw.RoundedBox(5, xPos , -85, 73, 120,  zwf.default_colors["black03"])

	surface.SetDrawColor(zwf.default_colors["white01"])
	surface.SetMaterial(mat)
	surface.DrawTexturedRect(xPos-2, -83, 75, 75)

	draw.SimpleText(txt, "zwf_splicelab_font05", xPos + 37, 15, color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function ENT:DrawPerfData(JarNum,left)
	local Perf_Time
	local Perf_Amount
	local Perf_THC

	local plantData

	if JarNum == 1 then
		Perf_Time = self.PerfData.PerfA_Time
		Perf_Amount = self.PerfData.PerfA_Amount
		Perf_THC = self.PerfData.PerfA_THC

		plantData = zwf.config.Plants[self.PerfData.WeedA_ID]
	elseif JarNum == 2 then
		Perf_Time = self.PerfData.PerfB_Time
		Perf_Amount = self.PerfData.PerfB_Amount
		Perf_THC = self.PerfData.PerfB_THC

		plantData = zwf.config.Plants[self.PerfData.WeedB_ID]
	end


	local c_time = self:GetColorFromBoostValue(Perf_Time)
	local c_amount = self:GetColorFromBoostValue(Perf_Amount)
	local c_thc = self:GetColorFromBoostValue(Perf_THC)


	Perf_Time = 100 - (Perf_Time - 100)
	Perf_Time = Perf_Time * 0.01
	local def_time = plantData.Grow.Duration
	Perf_Time = def_time * Perf_Time
	Perf_Time =  math.Round(Perf_Time) .. "s"

	Perf_Amount = Perf_Amount * 0.01
	local def_amount = plantData.Grow.MaxYieldAmount
	Perf_Amount = def_amount * Perf_Amount
	Perf_Amount =  math.Round(Perf_Amount) .. zwf.config.UoW

	Perf_THC = Perf_THC * 0.01
	local def_thc = plantData.thc_level
	Perf_THC = def_thc * Perf_THC
	Perf_THC =  math.Round(Perf_THC) .. "%"


	local xPos = 0

	if left then
		xPos = -20
	else
		xPos = 240
	end


	self:DrawItem(xPos-230,zwf.default_materials["icon_growtime"],Perf_Time,c_time)
	self:DrawItem(xPos-147,zwf.default_materials["icon_mass"],Perf_Amount,c_amount)
	self:DrawItem(xPos-64,zwf.default_materials["icon_thc"],Perf_THC,c_thc)
end

function ENT:DrawInfo()


	cam.Start3D2D(self:LocalToWorld(Vector(0.7,0,68)), self:LocalToWorldAngles(Angle(0, 90, 90)), 0.05)

		draw.RoundedBox(15, -280 , -170, 560, 340,  zwf.default_colors["violett01"])

		local _SpliceStartTime = self:GetSpliceStartTime()

		if _SpliceStartTime ~= -1 then
			local _SpliceEndTime = _SpliceStartTime + zwf.config.SeedLab.SpliceTime
			local _SpliceProgress = math.Round(_SpliceEndTime - CurTime())

			draw.SimpleText(self:GetSeedName(), "zwf_splicelab_font03", 0, -45, zwf.default_colors["violett02"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

			draw.RoundedBox(5, -230 , 65, 460, 50,  zwf.default_colors["violett02"])

			_SpliceProgress = zwf.config.SeedLab.SpliceTime - _SpliceProgress

			self.ProgressSmooth = self.ProgressSmooth + 1.1 * FrameTime()
			self.ProgressSmooth = math.Clamp(self.ProgressSmooth, 0, _SpliceProgress)

			local barW = (460 / zwf.config.SeedLab.SpliceTime) * self.ProgressSmooth
			draw.RoundedBox(5, -230 , 65, barW, 50,  zwf.default_colors["white04"])
		else
			if IsValid(self.WeedA) then

				draw.SimpleText(self.PerfData.WeedA_Name, "zwf_splicelab_font04", -250, -135, zwf.default_colors["white01"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

				self:DrawPerfData(1, true)

				draw.SimpleText("[" .. zwf.config.Plants[self.PerfData.WeedA_ID].name .. "]", "zwf_splicelab_font02", -250, -105, zwf.default_colors["white01"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

				if self:Remove_WeedA(LocalPlayer()) then
					draw.RoundedBox(5, -250 , 43, 240, 60, zwf.default_colors["red05"])
				else
					draw.RoundedBox(5, -250 , 43, 240, 60,  zwf.default_colors["black03"])
				end

				draw.SimpleText(zwf.language.General["Remove"], "zwf_splicelab_font01", -132, 74, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end

			if IsValid(self.WeedB) then
				draw.SimpleText(self.PerfData.WeedB_Name, "zwf_splicelab_font04", 10, -135, zwf.default_colors["white01"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

				self:DrawPerfData(2, false)

				draw.SimpleText("[" .. zwf.config.Plants[self.PerfData.WeedB_ID].name .. "]", "zwf_splicelab_font02", 10, -105, zwf.default_colors["white01"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)


				if self:Remove_WeedB(LocalPlayer()) then
					draw.RoundedBox(5, 10 , 43, 240, 60, zwf.default_colors["red05"])
				else
					draw.RoundedBox(5, 10 , 43, 240, 60,  zwf.default_colors["black03"])
				end
				draw.SimpleText(zwf.language.General["Remove"], "zwf_splicelab_font01", 132, 74, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end

			if IsValid(self.WeedA) and IsValid(self.WeedB) then
				if self:SpliceWeed(LocalPlayer()) then
					draw.RoundedBox(5, -250 , 112, 500, 50,  zwf.default_colors["violett03"])
				else
					draw.RoundedBox(5, -250 , 112, 500, 50, zwf.default_colors["black03"])
				end
				draw.SimpleText(zwf.language.General["Splice"], "zwf_splicelab_font01", 0, 140, zwf.default_colors["white01"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.RoundedBox(0, -4 , -87, 8, 190,  zwf.default_colors["black03"])
			end

			if not IsValid(self.WeedA) and not IsValid(self.WeedB) then

				draw.SimpleText(zwf.language.General["seedlab_titlescreen"], zwf.f.GetFontFromTextSize(zwf.language.General["seedlab_titlescreen"],12,"zwf_splicelab_font03","zwf_splicelab_font03_small"), 0, 0, zwf.default_colors["violett02"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		end
	cam.End3D2D()
end

function ENT:OnVolumeChange()
	if self.SoundObj and self.SoundObj:IsPlaying() == true then
		self.SoundObj:ChangeVolume(zwf_SoundVolume, 0)
	end
end


function ENT:Think()

	if zwf.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 1000) then
		local _WeedA = self:GetWeedA()
		local _WeedB = self:GetWeedB()

		if self.WeedA ~= _WeedA or self.WeedB ~= _WeedB then

			self:RemoveClientModels()

			if IsValid(_WeedA) then
				self.WeedA = _WeedA

				self.PerfData.WeedA_ID = self.WeedA:GetPlantID()


				self.PerfData.WeedA_Name = self.WeedA:GetWeedName()

				self.PerfData.WeedA_Amount = self.WeedA:GetWeedAmount()

				self.PerfData.PerfA_Time = self.WeedA:GetPerf_Time()
				self.PerfData.PerfA_Amount = self.WeedA:GetPerf_Amount()
				self.PerfData.PerfA_THC = self.WeedA:GetPerf_THC()

				self:SpawnClientModel_Jar(Vector(-9.6,-19.8,41.5),self.PerfData.WeedA_Amount,self.PerfData.WeedA_ID,1)
			else
				self.WeedA = NULL
				self.SpliceData = nil
			end

			if IsValid(_WeedB) then
				self.WeedB = _WeedB

				self.PerfData.WeedB_ID = self.WeedB:GetPlantID()
				self.PerfData.WeedB_Name = self.WeedB:GetWeedName()
				self.PerfData.WeedB_Amount = self.WeedB:GetWeedAmount()

				self.PerfData.PerfB_Time = self.WeedB:GetPerf_Time()
				self.PerfData.PerfB_Amount = self.WeedB:GetPerf_Amount()
				self.PerfData.PerfB_THC = self.WeedB:GetPerf_THC()

				self:SpawnClientModel_Jar(Vector(-9.6,19.8,41.5),self.PerfData.WeedB_Amount,self.PerfData.WeedB_ID,2)
			else
				self.WeedB = NULL
				self.SpliceData = nil
			end

			if IsValid(self.WeedA) and IsValid(self.WeedB) then
				self.SpliceData = zwf.f.SpliceLab_CalculateSpliceData(self.PerfData)
			end
		end

		if not IsValid(self.WeedA) and IsValid(self.ClientProps["Jar1"]) then
			self.ClientProps["Jar1"]:Remove()
		end

		if not IsValid(self.WeedB) and IsValid(self.ClientProps["Jar2"]) then
			self.ClientProps["Jar2"]:Remove()
		end

		local _SpliceStartTime = self:GetSpliceStartTime()

		if self.IsAnimating == false then

			if IsValid(self.WeedA) and IsValid(self.WeedB) and _SpliceStartTime ~= -1 then
				zwf.f.ClientAnim(self, "scanning", 1)
				self.IsAnimating = true
			end
		elseif self.IsAnimating == true then

			if not IsValid(self.WeedA) or not IsValid(self.WeedB) or _SpliceStartTime == -1 then

				zwf.f.ClientAnim(self, "unload",2)

				timer.Simple(1,function()
					if IsValid(self) then
						zwf.f.ClientAnim(self, "idle", 1)
					end
				end)

				self.IsAnimating = false
			end
		end

		if _SpliceStartTime ~= -1 then
			if self.SoundObj == nil then
				self.SoundObj = CreateSound(self, "zwf_seedlab_scan")
			end

			if self.SoundObj:IsPlaying() == false then
				self.SoundObj:Play()
				self.SoundObj:ChangeVolume(0, 0)
				self.SoundObj:ChangeVolume(zwf_SoundVolume, 0)
			end
		else
			if self.SoundObj and self.SoundObj:IsPlaying() == true then
				self.SoundObj:ChangeVolume(0, 0)
				self.SoundObj:Stop()
			end
		end

	else

		if self.SoundObj and self.SoundObj:IsPlaying() == true then
			self.SoundObj:ChangeVolume(0, 0)
			self.SoundObj:Stop()
		end

		self.SpliceData = nil
		self.WeedA = nil
		self.WeedB = nil
		self.IsAnimating = false
		self:RemoveClientModels()
	end
end

function ENT:SpawnClientModel_Jar(pos,amount,WeedID,Num)
	local plantData = zwf.config.Plants[WeedID]

	local ent = ents.CreateClientProp("models/zerochain/props_weedfarm/zwf_jar.mdl")
	ent:SetPos(self:LocalToWorld(pos))
	ent:SetAngles(self:GetAngles())
	ent:Spawn()
	ent:Activate()
	ent:SetParent(self)
	ent:SetRenderMode(RENDERMODE_TRANSALPHA)

	if amount <= zwf.config.Jar.Capacity / 3 then
		ent:SetBodygroup(1, 1)
	elseif amount <= (zwf.config.Jar.Capacity / 3) * 2 then
		ent:SetBodygroup(1, 1)
		ent:SetBodygroup(2, 1)
	else
		ent:SetBodygroup(1, 1)
		ent:SetBodygroup(2, 1)
		ent:SetBodygroup(3, 1)
	end

	ent:SetSkin(plantData.skin)

	self.ClientProps["Jar" .. Num] = ent
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

	if self.SoundObj and self.SoundObj:IsPlaying() == true then
		self.SoundObj:ChangeVolume(0, 0)
		self.SoundObj:Stop()
	end
end

--PATH addons/grp_knife/lua/effects/csgo_knifeimpact.lua:
function EFFECT:Init( data )
  local vOffset = data:GetOrigin() -- + Vector( 0, 0, 0.2 )
  -- local vAngle = data:GetAngles()
  local emitter = ParticleEmitter( vOffset ) -- there was false
    for i=0, 5 do
      local particle = emitter:Add( "particle/particle_smokegrenade", vOffset )
      if particle then
        -- particle:SetAngles( vAngle )
        particle:SetVelocity( math.random(12,16) * math.sqrt(i) * data:GetNormal() * 3 + 2 * VectorRand() )
        particle:SetColor( 135, 135, 135 )
        particle:SetLifeTime( 0 )
        particle:SetDieTime( math.Rand( 0.5, 1.5 ) )
        particle:SetStartAlpha( 255 )
        particle:SetEndAlpha( 0 )
        particle:SetStartSize( math.Rand( 5, 8 ) *math.Clamp(i,1,4) * 0.166 )
        --particle:SetStartLength( 1 )
        particle:SetEndSize( math.Rand( 16, 24 ) * math.sqrt(math.Clamp(i,1,4)) * 0.166 )
        --particle:SetEndLength( 4 )
        particle:SetRoll( math.Rand( -25, 25 ) )
        particle:SetRollDelta( math.Rand( -0.05, 0.05 ) )
      end
    end
  emitter:Finish()
end

function EFFECT:Think()
  return false
end

function EFFECT:Render()
end
--PATH addons/pianino/lua/effects/musicnotes/init.lua:
function EFFECT:Init( data )

	local pos = data:GetOrigin()

	local grav = Vector(0, 0, math.random(50, 60))
	local offset = Vector(0,0,10)

	local emitter = ParticleEmitter( pos )

	local particle = emitter:Add( "sprites/music", pos + offset )
	particle:SetVelocity( ( Vector( 0, 0, 1 ) + ( VectorRand() * 0.1 ) ) * math.random( 15, 30 ) )
	particle:SetDieTime( math.random( 0.5, 0.8 ) )
	particle:SetStartAlpha( 255 )
	particle:SetEndAlpha( 0 )
	particle:SetStartSize( 3 )
	particle:SetEndSize( 1.5 )
	particle:SetRoll( math.random(0.5, 10) )
	particle:SetRollDelta( math.Rand(-0.2, 0.2) )
	particle:SetColor( 255, 255, 255 )
	particle:SetCollide( false )

	particle:SetGravity( grav )
	grav = grav + Vector(0, 0, math.random(-10, -5))
	offset = offset + Vector( math.random(1, 5), math.random(.5, 5), math.random(1.5, 6))

	emitter:Finish()

end

function EFFECT:Think( )
	return false
end

function EFFECT:Render( )
end
--PATH addons/itemstore_new/lua/itemstore/gamemodes.lua:
﻿itemstore.gamemodes = {}
PROVIDER = {}
include("gamemodeproviders/" .. itemstore.config.GamemodeProvider .. ".lua")

if SERVER then
    AddCSLuaFile("gamemodeproviders/" .. itemstore.config.GamemodeProvider .. ".lua")
end

itemstore.gamemodes.Provider = PROVIDER
PROVIDER = nil
assert(itemstore.gamemodes.Provider, "[ItemStore] Gamemode provider not found")

function itemstore.gamemodes.Run(func_name, ...)
    local func = itemstore.gamemodes.Provider[func_name]
    if not func then return end

    return func(itemstore.gamemodes.Provider, ...)
end

function itemstore.gamemodes.GetMoney(pl)
    return itemstore.gamemodes.Run("GetMoney", pl)
end

if SERVER then
    function itemstore.gamemodes.SetMoney(pl, money)
        return itemstore.gamemodes.Run("SetMoney", pl, money)
    end

    function itemstore.gamemodes.GiveMoney(pl, money)
        return itemstore.gamemodes.SetMoney(pl, itemstore.gamemodes.GetMoney(pl) + money)
    end

    function itemstore.gamemodes.AddCommand(command, info, func)
        return itemstore.gamemodes.Run("AddCommand", command, info, func)
    end

    itemstore.AddCommand("trade", function(pl, args)
        args = table.concat(args, " ")

        if not pl:CanUseInventory() then
            pl:ChatPrint(itemstore.Translate("cant_access_inventory"))

            return
        end

        if not itemstore.config.TradingEnabled then return end

        if pl.TradingCooldown and pl.TradingCooldown > CurTime() then
            pl:ChatPrint(itemstore.Translate("trading_cooldown"))

            return
        end

        local target = pl:GetEyeTrace().Entity

        if args ~= "" then
            for _, pl in player.Iterator() do
                if string.find(string.lower(pl:Name()), string.lower(args), 1, true) then
                    target = pl
                end
            end
        end

        if not IsValid(target) or not target:IsPlayer() then
            pl:ChatPrint(itemstore.Translate("player_not_found"))

            return
        end

        if not target:CanUseInventory() then
            pl:ChatPrint(itemstore.Translate("partner_cant_access_inventory"))

            return
        end

        if pl.Trade then
            pl:ChatPrint(itemstore.Translate("already_in_trade"))

            return
        end

        if target.Trade then
            pl:ChatPrint(itemstore.Translate("partner_is_in_trade"))

            return
        end

        if itemstore.config.TradeDistance ~= 0 and pl:GetPos():Distance(target:GetPos()) > itemstore.config.TradeDistance then
            pl:ChatPrint(itemstore.Translate("too_far_away"))

            return
        end

        itemstore.Trade(pl, target)
        pl.TradingCooldown = CurTime() + itemstore.config.TradeCooldown
    end)

    itemstore.AddCommand("inv", function(pl)
        pl:OpenContainer(pl.Inventory:GetID(), itemstore.Translate("inventory"), true)
    end)

    itemstore.AddCommand("pickup", function(pl)
        pl:PickupItem()
    end)
end

hook.Add("PostGamemodeLoaded", "ItemStoreGamemodeLoad", function()
    itemstore.gamemodes.Run("Load")
end)
--PATH addons/itemstore_new/lua/itemstore/items/base_entity.lua:
﻿ITEM.Name = "Entity Item Base"
ITEM.Model = "models/error.mdl"

function ITEM:Load()
    self:RegisterPickup(self.Class)
end

function ITEM:CreateEntity(pos)
    local ent = ents.Create(self.Class)
    ent:SetPos(pos)
    self:LoadData(ent)
    ent:Spawn()

    return ent
end

function ITEM:SaveData()
end

function ITEM:LoadData()
end
--PATH addons/zeros_methlab2/lua/zmlab2_languages/sh_language_de.lua:
zmlab2 = zmlab2 or {}
zmlab2.language = zmlab2.language or {}

if (zmlab2.config.SelectedLanguage == "de") then
    zmlab2.language["YouDontOwnThis"] = "Das gehört dir nicht!"
    zmlab2.language["Minutes"] = "Minuten"
    zmlab2.language["Seconds"] = "Sekunden"
    zmlab2.language["CratePickupFail"] = "Transport Kiste is leer!"
    zmlab2.language["CratePickupSuccess"] = "Gesammelt $MethAmount $MethName, Qualität: $MethQuality%"
    zmlab2.language["Interaction_Fail_Job"] = "Du hast nicht den richtigen Job, um damit zu interagieren!"
    zmlab2.language["Interaction_Fail_Dropoff"] = "Dieser Abwurfs Punkt ist dir nicht zugewiesen!"
    zmlab2.language["Dropoff_assinged"] = "Abwurfs Punkt zugewiesen!"
    zmlab2.language["Dropoff_cooldown"] = "Abwurfs Punkt cooldown!"
    zmlab2.language["Equipment"] = "Ausrüstung"
    zmlab2.language["Equipment_Build"] = "Bauen"
    zmlab2.language["Equipment_Move"] = "Bewegen"
    zmlab2.language["Equipment_Repair"] = "Reparieren"
    zmlab2.language["Equipment_Remove"] = "Löschen"
    zmlab2.language["NotEnoughMoney"] = "Du hast nicht genug geld!"
    zmlab2.language["ExtinguisherFail"] = "Objekt brennet nicht!"
    zmlab2.language["Start"] = "Starten"
    zmlab2.language["Drop"] = "Entnehmen"
    zmlab2.language["Move Liquid"] = "Weiter Pumpen"
    zmlab2.language["Frezzer_NeedTray"] = "Kein Tablett mit nicht gefrorenem Meth gefunden!"
    zmlab2.language["ERROR"] = "ERROR"
    zmlab2.language["SPACE"] = "Drücke SPACE"
    zmlab2.language["NPC_InteractionFail01"] = "Mit dir handel ich nicht! [Falscher Job]"
    zmlab2.language["NPC_InteractionFail02"] = "Du hast kein meth bei dir!"
    zmlab2.language["NPC_InteractionFail03"] = "Ich habe momentan keinen freien Abwurfs Punkt, Komm später wieder."
    zmlab2.language["PoliceWanted"] = "Meth verkauft!"
    zmlab2.language["MissingCrate"] = "Kiste fehlt!"
    zmlab2.language["Storage"] = "LAGER"
    zmlab2.language["ItemLimit"] = "Du hast das Limit für $ItemName erreicht!"
    zmlab2.language["TentFoldInfo01"] = "Bist du sicher, dass du das zelt abbauen willst?"
    zmlab2.language["TentFoldInfo02"] = "Jede Maschine im zelt wird auch verkauft!"
    zmlab2.language["TentFoldAction"] = "ABBAUEN"
    zmlab2.language["TentType_None"] = "NICHTS"
    zmlab2.language["TentAction_Build"] = "BAUEN"
    zmlab2.language["TentBuild_Info"] = "Bitte machen Sie den Bereich frei!"
    zmlab2.language["TentBuild_Abort"] = "Etwas war im weg!"
    zmlab2.language["Enabled"] = "Eingeschalten"
    zmlab2.language["Disabled"] = "Ausgeschalten"
    zmlab2.language["MethTypeRestricted"] = "Sie dürfen diese Art von Meth nicht herstellen!"
    zmlab2.language["SelectMethType"] = "Wählen Sie Meth Art"
    zmlab2.language["SelectTentType"] = "Wählen Sie Zelt Art"
    zmlab2.language["LightColor"] = "Lichtfarbe"
    zmlab2.language["Cancel"] = "Abbrechen"
    zmlab2.language["Deconstruct"] = "Abbauen"
    zmlab2.language["Construct"] = "Bauen"
    zmlab2.language["Choosepostion"] = "Wähle eine neue Position"
    zmlab2.language["ChooseMachine"] = "Wähle eine Maschine"
    zmlab2.language["Extinguish"] = "Auslöschen"
    zmlab2.language["PumpTo"] = "Abpumpen nach"
    zmlab2.language["ConstructionCompleted"] = "Bau abgeschlossen!"
    zmlab2.language["Duration"] = "Dauer"
    zmlab2.language["Amount"] = "Menge"
    zmlab2.language["Difficulty"] = "Schwierigkeit"
    zmlab2.language["Money"] = "Geld"
    zmlab2.language["Difficulty_Easy"] = "Leicht"
    zmlab2.language["Difficulty_Medium"] = "Mittel"
    zmlab2.language["Difficulty_Hard"] = "Hart"
    zmlab2.language["Difficulty_Expert"] = "Experte"
    zmlab2.language["Connected"] = "Verbunden!"
    zmlab2.language["Missed"] = "Verfehlt!"

    // Tent shop
    // Note: "Vamonos Pest" and "Crystale Castle" are the names of those tents so you dont need to translate them if you dont want
    zmlab2.language["tent01_title"] = "Vamonos Pest Zelt - Klein"
    zmlab2.language["tent01_desc"] = "Dieses kleine Zelt bietet Platz für 6 Maschinen. "
    zmlab2.language["tent02_title"] = "Vamonos Pest Zelt - Mittel"
    zmlab2.language["tent02_desc"] = "Dieses mittelgroße Zelt bietet Platz für 9 Maschinen. "
    zmlab2.language["tent03_title"] = "Vamonos Pest Zelt - Groß"
    zmlab2.language["tent03_desc"] = "Dieses große Zelt bietet Platz für 16 Maschinen."
    zmlab2.language["tent04_title"] = "Crystale Castle"
    zmlab2.language["tent04_desc"] = "Dieses gestohlene Zirkuszelt bietet Platz für 24 Maschinen. "

    // Machine Shop
    zmlab2.language["ventilation_title"] = "Ventilation"
    zmlab2.language["ventilation_desc"] = "Reinigt die Umgebung von Verschmutzung."
    zmlab2.language["storage_title"] = "Lager"
    zmlab2.language["storage_desc"] = "Bietet Chemikalien und Ausrüstung."
    zmlab2.language["furnace_title"] = "Thorium Herd"
    zmlab2.language["furnace_desc"] = "Wird zum Erhitzen von Säure benötigt."
    zmlab2.language["mixer_title"] = "Mischer"
    zmlab2.language["mixer_desc"] = "Wird als Hauptreaktionsgefäß zur Kombination der Chemikalien verwendet."
    zmlab2.language["filter_title"] = "Filtermaschine"
    zmlab2.language["filter_desc"] = "Wird verwendet, um die endgültige Mischung zu verfeinern und ihre Qualität zu verbessern."
    zmlab2.language["filler_title"] = "Füllmaschine"
    zmlab2.language["filler_desc"] = "Wird verwendet, um die endgültige Mischung in Gefrierbleche zu füllen."
    zmlab2.language["frezzer_title"] = "Gefrierschrank "
    zmlab2.language["frezzer_desc"] = "Wird verwendet, um zu verhindern, dass die fertige Methamphetaminlösung weiter reagiert."
    zmlab2.language["packingtable_title"] = "Packtisch"
    zmlab2.language["packingtable_desc"] = "Bietet eine schnelle Möglichkeit, Meth zu brechen / zu verpacken. Kann bis zu 12 Gefrierbleche aufnehmen. Kann mit einem automatischen Meth-brecher aufgerüstet werden."

    // Item Shop
    zmlab2.language["acid_title"] = "Fluorwasserstoffsäure"
    zmlab2.language["acid_desc"] = "Ein Katalysator zur Erhöhung der Reaktionsgeschwindigkeit."
    zmlab2.language["methylamine_title"] = "Methylamine"
    zmlab2.language["methylamine_desc"] = "Methylamin (CH3NH2) ist eine organische Verbindung und einer der Hauptbestandteile für die Herstellung von Methamphetamin."
    zmlab2.language["aluminum_title"] = "Aluminium"
    zmlab2.language["aluminum_desc"] = "Aluminiumamalgam wird als chemisches Reagenz zur Reduktion von Verbindungen verwendet."
    zmlab2.language["lox_title"] = "Flüssiger Sauerstoff"
    zmlab2.language["lox_desc"] = "Im Gefrierschrank wird flüssiger Sauerstoff verwendet, um zu verhindern, dass die endgültige Methamphetaminlösung weiter reagiert."
    zmlab2.language["crate_title"] = "Transportkiste"
    zmlab2.language["crate_desc"] = "Wird für den Transport großer Mengen Meth verwendet."
    zmlab2.language["palette_title"] = "Palette"
    zmlab2.language["palette_desc"] = "Wird zum Transport großer Mengen Meth verwendet."
    zmlab2.language["crusher_title"] = "Meth-Zerkleinerer"
    zmlab2.language["crusher_desc"] = "Bricht und verpackt Meth automatisch, wenn es auf einem Packtisch installiert wird."

    // Meth Config
    // Note: Hard to say what about the meth should be translated and what not. Decide for yourself whats important here.
    zmlab2.language["meth_title"] = "Meth"
    zmlab2.language["meth_desc"] = "Normales junkie meth."
    zmlab2.language["bluemeth_title"] = "Crystal Blue"
    zmlab2.language["bluemeth_desc"] = "Die ursprüngliche Heisenberg-Formel."
    zmlab2.language["kalaxi_title"] = "Kalaxianischer Kristall"
    zmlab2.language["kalaxi_desc"] = "Die Kalaxianischen Kristalle sind vielen Drogen sehr ähnlich, da die Kristalle ein gutes Gefühl vermitteln."
    zmlab2.language["glitter_title"] = "Glitter"
    zmlab2.language["glitter_desc"] = "Glitter ist eine hochpsychedelische Droge welche kürzlich auf den Straßen von Night City erschien. Es ist wirklich ein starkes Zeug, selbst für die ärgsten junkies von Night City."
    zmlab2.language["kronole_title"] = "Kronole"
    zmlab2.language["kronole_desc"] = "Kronole ist eine Straßendroge, die an Bord von Snowpiercer auf dem Schwarzmarkt verkauft wird. Das Medikament hat die Fähigkeit, Schmerzrezeptoren zu blockieren. Kronole ist so stark, dass es alle Gefühle blockiert, nicht nur Schmerzen."
    zmlab2.language["melange_title"] = "Melange"
    zmlab2.language["melange_desc"] = "Melange (Spice) ist ein Medikament, das in der Lage ist, das Leben zu verlängern, die Vitalität zu steigern und kann bei manchen Menschen sogar das Bewusstsein stärken."
    zmlab2.language["mdma_title"] = "MDMA"
    zmlab2.language["mdma_desc"] = "MDMA wurde erstmals 1912 von Merck entwickelt. Es wurde ab den 1970er Jahren zur Verbesserung der Psychotherapie eingesetzt und wurde in den 1980er Jahren als Straßendroge populär."

    // Update 1.0.5
    zmlab2.language["tent05_title"] = "Rundes Zelt"
    zmlab2.language["tent05_desc"] = "Dieses runde Zelt bietet Platz für 8 Maschinen."
end

--PATH addons/zeros_methlab2/lua/zmlab2_languages/sh_language_fr.lua:
zmlab2 = zmlab2 or {}
zmlab2.language = zmlab2.language or {}

if (zmlab2.config.SelectedLanguage == "fr") then
    zmlab2.language["YouDontOwnThis"] = "Vous ne possédez pas ceci !"
    zmlab2.language["Minutes"] = "Minutes"
    zmlab2.language["Seconds"] = "Secondes"
    zmlab2.language["CratePickupFail"] = "La caisse est vide!"
    zmlab2.language["CratePickupSuccess"] = "Collecté $MethAmount $MethName, Qualité: $MethQuality%"
    zmlab2.language["Interaction_Fail_Job"] = "Vous n'avez pas le bon travail pour interagir avec ceci!"
    zmlab2.language["Interaction_Fail_Dropoff"] = "Ce point de dépôt ne vous est pas attribué!"
    zmlab2.language["Dropoff_assinged"] = "Dépôt assigné!"
    zmlab2.language["Dropoff_cooldown"] = "Délai de pause !"
    zmlab2.language["Equipment"] = "Equipment"
    zmlab2.language["Equipment_Build"] = "Construire"
    zmlab2.language["Equipment_Move"] = "Bouger"
    zmlab2.language["Equipment_Repair"] = "Réparer"
    zmlab2.language["Equipment_Remove"] = "Retirer"
    zmlab2.language["NotEnoughMoney"] = "Vous n'avez pas assez d'argent!"
    zmlab2.language["ExtinguisherFail"] = "L'objet n'est pas en feu!"
    zmlab2.language["Start"] = "Commencer"
    zmlab2.language["Drop"] = "Lacher"
    zmlab2.language["Move Liquid"] = "Déplacer le liquide"
    zmlab2.language["Frezzer_NeedTray"] = "Aucun plateau avec de la méthamphétamine non congelée trouvé!"
    zmlab2.language["ERROR"] = "ERREUR"
    zmlab2.language["SPACE"] = "Appyez sur ESPACE"
    zmlab2.language["NPC_InteractionFail01"] = "Dégage de là ! [Mauvais métier]"
    zmlab2.language["NPC_InteractionFail02"] = "Vous n'avez pas de meth!"
    zmlab2.language["NPC_InteractionFail03"] = "Je n'ai pas de point de dépôt libre actuellement, revenez plus tard."
    zmlab2.language["PoliceWanted"] = "Meth vendue!"
    zmlab2.language["MissingCrate"] = "Caisse manquante"
    zmlab2.language["Storage"] = "STOCKAGE"
    zmlab2.language["ItemLimit"] = "Vous avez atteint la limite d'entité pour $ItemName!"
    zmlab2.language["TentFoldInfo01"] = "Voulez-vous vraiment retirer la tente?"
    zmlab2.language["TentFoldInfo02"] = "Tout équipement à l'intérieur sera également supprimé!"
    zmlab2.language["TentFoldAction"] = "PLIER"
    zmlab2.language["TentType_None"] = "RIEN"
    zmlab2.language["TentAction_Build"] = "CONSTRUIRE"
    zmlab2.language["TentBuild_Info"] = "Veuillez dégager la zone!"
    zmlab2.language["TentBuild_Abort"] = "Quelque chose gêne !"
    zmlab2.language["Enabled"] = "Activé"
    zmlab2.language["Disabled"] = "Désactivé"
    zmlab2.language["MethTypeRestricted"] = "Vous n'êtes pas autorisé à fabriquer ce type de meth!"
    zmlab2.language["SelectMethType"] = "Sélectionnez le type de meth"
    zmlab2.language["SelectTentType"] = "Sélectionnez le type de tente"
    zmlab2.language["LightColor"] = "Couleur lampe"
    zmlab2.language["Cancel"] = "Annuler"
    zmlab2.language["Deconstruct"] = "Déconstruire"
    zmlab2.language["Construct"] = "Construire"
    zmlab2.language["Choosepostion"] = "Choisissez une nouvelle position"
    zmlab2.language["ChooseMachine"] = "Choisissez une nouvelle machine"
    zmlab2.language["Extinguish"] = "Éteindre"
    zmlab2.language["PumpTo"] = "Pomper à"
    zmlab2.language["ConstructionCompleted"] = "Construction completée!"
    zmlab2.language["Duration"] = "Durée"
    zmlab2.language["Amount"] = "Rendement"
    zmlab2.language["Difficulty"] = "Difficulté"
    zmlab2.language["Money"] = "Argent"
    zmlab2.language["Difficulty_Easy"] = "Facile"
    zmlab2.language["Difficulty_Medium"] = "Moyen"
    zmlab2.language["Difficulty_Hard"] = "Difficile"
    zmlab2.language["Difficulty_Expert"] = "Expert"
    zmlab2.language["Connected"] = "Attaché!"
    zmlab2.language["Missed"] = "Manqué!"

    // Tent shop
    // Note: "Vamonos Pest" and "Crystale Castle" are the names of those tents so you dont need to translate them if you dont want
    zmlab2.language["tent01_title"] = "Tente Vamonos Pest - Petite"
    zmlab2.language["tent01_desc"] = "Cette petite tente peut accueillir 6 machines."
    zmlab2.language["tent02_title"] = "Tente Vamonos Pest - Moyenne"
    zmlab2.language["tent02_desc"] = "Cette tente de taille moyenne peut accueillir 9 machines."
    zmlab2.language["tent03_title"] = "Tente Vamonos Pest - Grande"
    zmlab2.language["tent03_desc"] = "Cette grande tente peut accueillir 16 machines."
    zmlab2.language["tent04_title"] = "Crystale Castle"
    zmlab2.language["tent04_desc"] = "Cette tente de cirque volée offre de la place pour 24 machines."

    // Machine Shop
    zmlab2.language["ventilation_title"] = "Ventilation"
    zmlab2.language["ventilation_desc"] = "Nettoie la zone environnante de la pollution."
    zmlab2.language["storage_title"] = "Stockage"
    zmlab2.language["storage_desc"] = "Fournit des produits chimiques et de l'équipement."
    zmlab2.language["furnace_title"] = "Four au thorium"
    zmlab2.language["furnace_desc"] = "Utilisé pour chauffer l'acide."
    zmlab2.language["mixer_title"] = "Mixer"
    zmlab2.language["mixer_desc"] = "Utilisé comme récipient de réaction principal pour combiner les composés."
    zmlab2.language["filter_title"] = "Filtre"
    zmlab2.language["filter_desc"] = "Utilisé pour affiner le mélange final pour augmenter sa qualité."
    zmlab2.language["filler_title"] = "Remplisseur"
    zmlab2.language["filler_desc"] = "Utilisé pour remplir le mélange final sur des plateaux de congélation."
    zmlab2.language["frezzer_title"] = "Congélateur"
    zmlab2.language["frezzer_desc"] = "Utilisé pour empêcher la solution finale de méthamphétamine de réagir davantage."
    zmlab2.language["packingtable_title"] = "Table d'emballage"
    zmlab2.language["packingtable_desc"] = "Fournit un moyen rapide de casser/emballer la méthamphétamine. Peut contenir jusqu'à 12 plateaux de congélation. Peut être amélioré avec un brise-glace automatique."

    // Item Shop
    zmlab2.language["acid_title"] = "Acide hydrofluorique"
    zmlab2.language["acid_desc"] = "Un catalyseur pour augmenter la vitesse de réaction."
    zmlab2.language["methylamine_title"] = "Méthylamine"
    zmlab2.language["methylamine_desc"] = "Méthylamine (CH3NH2) est un composé organique et l'un des principaux ingrédients pour la production de méthamphétamine."
    zmlab2.language["aluminum_title"] = "Aluminium"
    zmlab2.language["aluminum_desc"] = "L'aluminium est utilisé comme réactif chimique pour réduire les composés."
    zmlab2.language["lox_title"] = "Oxygène liquide"
    zmlab2.language["lox_desc"] = "L'oxygène liquide est utilisé dans le congélateur pour empêcher la solution finale de méthamphétamine de réagir davantage."
    zmlab2.language["crate_title"] = "Caisse de transport"
    zmlab2.language["crate_desc"] = "Utilisé pour transporter de grandes quantités de méthamphétamine. "
    zmlab2.language["palette_title"] = "Palette"
    zmlab2.language["palette_desc"] = "Utilisé pour transporter de grandes quantités de méthamphétamine."
    zmlab2.language["crusher_title"] = "Brise-glace"
    zmlab2.language["crusher_desc"] = "Casse et emballe automatiquement la méthamphétamine lorsqu'elle est installée sur une table d'emballage."

    // Meth Config
    // Note: Hard to say what about the meth should be translated and what not. Decide for yourself whats important here.
    zmlab2.language["meth_title"] = "Meth"
    zmlab2.language["meth_desc"] = "Meth de rue normale."
    zmlab2.language["bluemeth_title"] = "Crystal Blue"
    zmlab2.language["bluemeth_desc"] = "La formule originale de Heisenberg."
    zmlab2.language["kalaxi_title"] = "Kalaxian Crystal"
    zmlab2.language["kalaxi_desc"] = "Les cristaux de Kalaxian sont très similaires à de nombreux médicaments, car les cristaux vous donnent une bonne sensation."
    zmlab2.language["glitter_title"] = "Glitter"
    zmlab2.language["glitter_desc"] = "Glitter est une drogue hautement psychédélique et récemment arrivée dans les rues. C'est vraiment fort."
    zmlab2.language["kronole_title"] = "Kronole"
    zmlab2.language["kronole_desc"] = "Le Kronole est une drogue de rue vendue à bord de Snowpiercer sur le marché noir. Le médicament a la capacité de bloquer les récepteurs de la douleur, Kronole est si puissant qu'il bloque tous les sentiments, pas seulement la douleur."
    zmlab2.language["melange_title"] = "Melange"
    zmlab2.language["melange_desc"] = "Melange (Spice) est un médicament capable de prolonger la vie, de conférer une vitalité et une conscience accrues et de débloquer la prescience chez certains humains."
    zmlab2.language["mdma_title"] = "MDMA"
    zmlab2.language["mdma_desc"] = "MDMA a été développé pour la première fois en 1912 par Merck. Il a été utilisé pour améliorer la psychothérapie à partir des années 1970 et est devenu populaire en tant que drogue de rue dans les années 1980."

    // Update 1.0.5
    zmlab2.language["tent05_title"] = "Round Tent"
    zmlab2.language["tent05_desc"] = "This round tent provides room for 8 machines."
end

--PATH addons/zeros_methlab2/lua/zmlab2/util/sh_debug.lua:
zmlab2 = zmlab2 or {}
zmlab2.f = zmlab2.f or {}

function zmlab2.Debug(mgs)
	if zmlab2.config.Debug then
		if istable(mgs) then
			print("[    DEBUG    ] Table Start >")
			PrintTable(mgs)
			print("[    DEBUG    ] Table End <")
		else
			print("[    DEBUG    ] " .. mgs)
		end
	end
end

function zmlab2.Debug_Net(NetworkString,Len)
	zmlab2.Debug("[" .. NetworkString .. "][" .. (Len / 8) .. " Bytes]")
end

--PATH addons/zeros_methlab2/lua/zmlab2/util/sh_effects.lua:
zmlab2 = zmlab2 or {}
zmlab2.NetEvent = zmlab2.NetEvent or {}
zmlab2.Effect = zmlab2.Effect or {}

local function CreateRandomDecals(pos,decal,radius)
	for i = 1, 15 do
		local decal_pos = pos + Vector(1,0,0) * math.random(-radius, radius) + Vector(0,1,0) * math.random(-radius, radius)
		util.Decal(decal, decal_pos + Vector(0,0,5), decal_pos - Vector(0,0,50))
	end
end

// Here we define diffrent effect groups which later make it pretty optimized to create Sound/Particle effects over the network
// The key will be used as the NetworkString
zmlab2.NetEvent.Definitions = {
	["sell"] = {
		action = function(pos)
			zmlab2.Effect.ParticleEffect("zmlab2_purchase", pos, angle_zero, Entity(1))
			zmlab2.Sound.EmitFromPosition(pos, "cash")
		end
	},
	["clean"] = {
		action = function(pos)
			zmlab2.Effect.ParticleEffect("zmlab2_cleaning", pos, angle_zero, Entity(1))
			zmlab2.Sound.EmitFromPosition(pos, "cleaning_shrub")
			zmlab2.Sound.EmitFromPosition(pos, "cleaning_splash")
		end
	},
	["extinguish"] = {
		action = function(pos)
			zmlab2.Effect.ParticleEffect("zmlab2_extinguish", pos, angle_zero, Entity(1))
			zmlab2.Sound.EmitFromPosition(pos, "Extinguish")
			//zmlab2.Sound.EmitFromEntity("Extinguish", Machine)
		end
	},

	["methylamin_fill"] = {
		_type = "entity",
		action = function(ent)
			zmlab2.Effect.ParticleEffect("zmlab2_methylamin_fill", ent:LocalToWorld(Vector(11,0,53)), angle_zero, ent)
		end
	},
	["aluminium_fill"] = {
		_type = "entity",
		action = function(ent)
			zmlab2.Effect.ParticleEffect("zmlab2_aluminium_fill", ent:LocalToWorld(Vector(11,0,60)), angle_zero, ent)
		end
	},
	["acid_fill"] = {
		_type = "entity",
		action = function(ent)
			zmlab2.Effect.ParticleEffect("zmlab2_acid_fill", ent:LocalToWorld(Vector(-5,0,62)), ent:LocalToWorldAngles(angle_zero), ent)
		end
	},

	["acid_explo"] = {
		action = function(pos)
			zmlab2.Effect.ParticleEffect("zmlab2_acid_explo", pos, angle_zero, Entity(1))
			zmlab2.Sound.EmitFromPosition(pos, "acid_explo")

			CreateRandomDecals(pos,"BeerSplash",50)
		end
	},
	["alu_explo"] = {
		action = function(pos)
			zmlab2.Effect.ParticleEffect("zmlab2_aluminium_explo", pos + Vector(0,0,10), angle_zero, Entity(1))
			zmlab2.Sound.EmitFromPosition(pos, "aluminium_explo")
		end
	},
	["methylamin_explo"] = {
		action = function(pos)
			zmlab2.Effect.ParticleEffect("zmlab2_methylamine_explo", pos, angle_zero, Entity(1))
			zmlab2.Sound.EmitFromPosition(pos, "cleaning_splash")
			CreateRandomDecals(pos,"BeerSplash",75)
		end
	},
	["meth_break"] = {
		_type = "meth",
		action = function(pos,id)
			local m_data = zmlab2.config.MethTypes[id]
			if m_data == nil or m_data.visuals == nil or m_data.visuals.effect_breaking == nil then return end
			zmlab2.Effect.ParticleEffect(m_data.visuals.effect_breaking, pos, angle_zero, Entity(1))
		end
	},
	["lox_explo"] = {
		action = function(pos)
			zmlab2.Effect.ParticleEffect("zmlab2_lox_explo", pos + Vector(0,0,10), angle_zero, Entity(1))
			zmlab2.Sound.EmitFromPosition(pos, "lox_explo")
		end
	},
	["meth_explo"] = {
		_type = "meth",
		action = function(pos,id)
			local m_data = zmlab2.config.MethTypes[id]
			if m_data == nil or m_data.visuals == nil or m_data.visuals.effect_exploding == nil then return end
			zmlab2.Effect.ParticleEffect(m_data.visuals.effect_exploding, pos + Vector(0,0,10), angle_zero, Entity(1))
			zmlab2.Sound.EmitFromPosition(pos, "progress_fillingcrate")
		end
	},
	["meth_fill"] = {
		_type = "meth",
		action = function(pos,id)
			local m_data = zmlab2.config.MethTypes[id]
			if m_data == nil or m_data.visuals == nil or m_data.visuals.effect_filling == nil then return end
			zmlab2.Effect.ParticleEffect(m_data.visuals.effect_filling, pos + Vector(0,0,10), angle_zero, Entity(1))
			zmlab2.Sound.EmitFromPosition(pos, "crate_fill")
		end
	},
}

if SERVER then
	// Creates a network string for all the effect groups
	for k, v in pairs(zmlab2.NetEvent.Definitions) do
		util.AddNetworkString("zmlab2_fx_" .. k)
	end

	// Sends a Net Effect Msg to all clients
	function zmlab2.NetEvent.Create(id, data01,data02)
		// Data can be a entity or position
		local EffectGroup = zmlab2.NetEvent.Definitions[id]

		// Some events should be called on server to
		if EffectGroup._server then
			EffectGroup.action(data01)
		end

		net.Start("zmlab2_fx_" .. id)

		if EffectGroup._type == "entity" then
			net.WriteEntity(data01)
		elseif EffectGroup._type == "meth" then
			net.WriteVector(data01)
			net.WriteUInt(data02,16)
		else
			net.WriteVector(data01)
		end

		net.Broadcast()
	end
end

if CLIENT then
	for k, v in pairs(zmlab2.NetEvent.Definitions) do
		net.Receive("zmlab2_fx_" .. k, function(len)
			if IsValid(LocalPlayer()) then
				if v._type == "entity" then
					local ent = net.ReadEntity()

					if IsValid(ent) then
						zmlab2.NetEvent.Definitions[k].action(ent)
					end
				elseif v._type == "meth" then
					local pos = net.ReadVector()
					local id = net.ReadUInt(16)
					if pos and id then
						zmlab2.NetEvent.Definitions[k].action(pos,id)
					end
				else
					local pos = net.ReadVector()

					if pos then
						zmlab2.NetEvent.Definitions[k].action(pos)
					end
				end
			end
		end)
	end

	function zmlab2.Effect.ParticleEffect(effect, pos, ang, ent)
		if zmlab2.Convar.Get("zmlab2_cl_particleeffects") == 0 then return end
		ParticleEffect(effect, pos, ang, ent)
	end

	function zmlab2.Effect.ParticleEffectAttach(effect, attachType,ent, attachid)
		if zmlab2.Convar.Get("zmlab2_cl_particleeffects") == 0 then return end
		ParticleEffectAttach(effect, attachType, ent, attachid)
	end
end

--PATH addons/zeros_methlab2/lua/zmlab2/util/player/sh_player.lua:
zmlab2 = zmlab2 or {}
zmlab2.Player = zmlab2.Player or {}

// Returns the steam id of the player
function zmlab2.Player.GetID(ply)
    if ply:IsBot() then
        return ply:UserID()
    else
        return ply:SteamID()
    end
end

// Returns the name of the player
function zmlab2.Player.GetName(ply)
    if ply:IsBot() then
        return "Bot_" .. ply:UserID()
    else
        return ply:Nick()
    end
end

// Returns the player rank / usergroup
function zmlab2.Player.GetRank(ply)
	if SG then
		return ply:GetSecondaryUserGroup() or ply:GetUserGroup()
	else
		return ply:GetUserGroup()
	end
end

// Checks if the player has one of the specified ranks
function zmlab2.Player.RankCheck(ply,ranks)
	if table.Count(ranks) <= 0 then return true end
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
		if ranks[zmlab2.Player.GetRank(ply)] == nil then
			return false
		else
			return true
		end
	end
end

// Returns the players job
function zmlab2.Player.GetJob(ply)
	return ply:Team()
end

// Returns the players job name
function zmlab2.Player.GetJobName(ply)
	return team.GetName( zmlab2.Player.GetJob(ply) )
end



// This returns true if the player is a admin
function zmlab2.Player.IsAdmin(ply)
    if IsValid(ply) then
        if xAdmin then
            return ply:IsAdmin()
        elseif sam then
            return ply:IsAdmin()
        elseif sAdmin then
            return ply:IsAdmin()
        else
            if zmlab2.config.AdminRanks[zmlab2.Player.GetRank(ply)] then
                return true
            else
                return false
            end
        end
    else
        return false
    end
end



if SERVER then

	// This saves the owners SteamID
	function zmlab2.Player.SetOwner(ent, ply)

		if (IsValid(ply)) then
			ent:SetNWString("zmlab2_Owner", ply:SteamID())

			if CPPI then
				ent:CPPISetOwner(ply)
			end

			if gProtect and istable(gProtect) then
				gProtect.SetOwner(ply,ent)
			end
		else
			ent:SetNWString("zmlab2_Owner", "world")
		end
	end
end

// This returns the entites owner SteamID
function zmlab2.Player.GetOwnerID(ent)
	return ent:GetNWString("zmlab2_Owner", "nil")
end

// Checks if both entities have the same owner
function zmlab2.Player.SharedOwner(ent01,ent02)
	if IsValid(ent01) and IsValid(ent02) then

		if zmlab2.Player.GetOwnerID(ent01) == zmlab2.Player.GetOwnerID(ent02) then
			return true
		else
			return false
		end
	else
		return false
	end
end

// This returns the owner
function zmlab2.Player.GetOwner(ent)
	if IsValid(ent) then
		local id = ent:GetNWString("zmlab2_Owner", "nil")
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
function zmlab2.Player.IsOwner(ply, ent)
	if IsValid(ent) and IsValid(ply) then
		local id = ent:GetNWString("zmlab2_Owner", "nil")
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

function zmlab2.Player.IsMethCook(ply)
    if BaseWars then return true end
	if zmlab2.config.Jobs == nil then return true end
	if table.Count(zmlab2.config.Jobs) <= 0 then return true end

	if zmlab2.config.Jobs[zmlab2.Player.GetJob(ply)] then
		return true
	else
		return false
	end
end

// Returns the dropoff point if the player has one assigned
function zmlab2.Player.GetDropoff(ply)
	return ply.zmlab2_Dropoff
end

// Does the player has meth?
function zmlab2.Player.HasMeth(ply)
	if (ply.zmlab2_MethList and #ply.zmlab2_MethList > 0) then
		return true
	else
		return false
	end
end

function zmlab2.Player.OnMeth(ply)
	if ply.zmlab2_MethDuration and ply.zmlab2_MethStart and (ply.zmlab2_MethDuration + ply.zmlab2_MethStart) > CurTime() then
		return true
	else
		return false
	end
end

// Checks if the player is allowed to interact with the entity
function zmlab2.Player.CanInteract(ply, ent)
    if zmlab2.Player.IsMethCook(ply) == false then
        zmlab2.Notify(ply, zmlab2.language["Interaction_Fail_Job"], 1)
        return false
    end

    if zmlab2.config.SharedEquipment == true then
        return true
    else

        // Is the entity a public entity?
        if ent.IsPublic == true then return true end

        if zmlab2.Player.IsOwner(ply, ent) then
            return true
        else
            zmlab2.Notify(ply, zmlab2.language["YouDontOwnThis"], 1)

            return false
        end
    end
end

--PATH addons/zeros_methlab2/lua/zmlab2/tent/cl_tent.lua:
if not CLIENT then return end
zmlab2 = zmlab2 or {}
zmlab2.Tent = zmlab2.Tent or {}


zmlab2.Tent.Materials = zmlab2.Tent.Materials or {}

// Creates / returns a tent material which matches the specified parameters
function zmlab2.Tent.GetMaterial(TentID,ColorID)

    local mat_name = "zmlab2_material_tent_" .. TentID .. "_" .. ColorID

    if zmlab2.Tent.Materials[mat_name] then
        return mat_name
    end

    local TentData = zmlab2.config.Tent[TentID]
    local col_vec = zmlab2.util.ColorToVector(zmlab2.Tent_LightColors[ColorID])

    local params = {

        ["$blendtintbybasealpha"] = 1,

        ["$basetexture"] = TentData.tex_diff,
        ["$bumpMap"] = TentData.tex_nrm,
        ["$normalmapalphaenvmapmask"] = 1,

        ["$surfaceprop"] = "metal",
        ["$halflambert"] = 1,
        ["$model"] = 1,

        ["$envmap"] = "env_cubemap",
        ["$envmaptint"] = col_vec,
        ["$envmapfresnel"] = 1,

        ["$phong"] = 1,
        ["$phongexponent"] = 5,
        ["$phongfresnelranges"] = Vector(1, 1, 1),
        ["$phongtint"] = col_vec,
        ["$phongboost"] = 1,

        ["$rimlight"] = 1,
        ["$rimlightexponent"] = 25,
        ["$rimlightboost"] = 0.1,

        ["$emissiveBlendEnabled"] = 1,
        ["$emissiveBlendTexture"] = "zerochain/props_methlab/tent/null",
        ["$emissiveBlendBaseTexture"] = TentData.tex_em,
        ["$emissiveBlendFlowTexture"] = "zerochain/props_methlab/tent/null",
        ["$emissiveBlendTint"] = col_vec,
        ["$emissiveBlendStrength"] = 2,
        ["$emissiveBlendScrollVector"] = Vector(0,0),
    }

    local mat = CreateMaterial(mat_name, "VertexLitGeneric", params)

    mat:SetVector("$emissiveBlendTint",col_vec)
    mat:SetFloat("$emissiveBlendStrength",2)

    zmlab2.Tent.Materials[mat_name] = mat

    return mat_name
end


// Informs all near clients that the tent type changed so rebuild the client model
net.Receive("zmlab2_Tent_ChangeType", function(len,ply)
    zmlab2.Debug_Net("zmlab2_Tent_ChangeType",len)

    local Tent = net.ReadEntity()
    if not IsValid(Tent) then return end

    if IsValid(Tent.PreviewModel) then
        zmlab2.Tent.RemoveClientModel(Tent)
    end
end)

function zmlab2.Tent.Initialize(Tent) end

function zmlab2.Tent.OnThink(Tent)

    local i_state = Tent:GetBuildState()

    zmlab2.util.LoopedSound(Tent, "zmlab2_tent_construction_loop", i_state == 1)

    // Here we create the build preview model
    if zmlab2.util.InDistance(LocalPlayer():GetPos(), Tent:GetPos(), 750) and i_state > -1 and i_state < 2 then
        if not IsValid(Tent.PreviewModel) then
            zmlab2.Tent.CreateClientModel(Tent)
        end
    else
        zmlab2.Tent.RemoveClientModel(Tent)
    end
end

function zmlab2.Tent.UpdateLightMaterial(Tent)
    zmlab2.Debug("zmlab2.Tent.UpdateLightMaterial")

    local TentMat = zmlab2.Tent.GetMaterial(Tent:GetTentID(),Tent:GetColorID())
    local TentData = zmlab2.config.Tent[Tent:GetTentID()]

    Tent:SetSubMaterial(TentData.mat_id, "!" .. TentMat)

    //zmlab2.Tent.Materials["!" .. TentMat]:SetFloat("$emissiveBlendStrength",1)
end

function zmlab2.Tent.OnRemove(Tent)
    zmlab2.Tent.RemoveClientModel(Tent)
    Tent:StopSound("zmlab2_tent_construction_loop")
end

function zmlab2.Tent.RemoveClientModel(Tent)
    if IsValid(Tent.PreviewModel) then
        zmlab2.ClientModel.Remove(Tent.PreviewModel)
        zmlab2.Debug("zmlab2.Tent.RemoveClientModel")
        Tent.PreviewModel = nil
    end
end

function zmlab2.Tent.CreateClientModel(Tent)

    local TentData = zmlab2.config.Tent[Tent:GetTentID()]
    if TentData == nil then return end

    local ent = zmlab2.ClientModel.AddProp()
    if not IsValid(ent) then return end
    ent:SetModel(TentData.model)
    ent:SetAngles(Tent:LocalToWorldAngles(angle_zero))
    ent:SetPos(Tent:LocalToWorld(vector_origin))
    ent:Spawn()

    ent:SetParent(Tent)
    ent:SetRenderMode(RENDERMODE_TRANSCOLOR)
    ent:SetMaterial("zerochain/zmlab2/shader/zmlab2_highlight")

    Tent.PreviewModel = ent
    zmlab2.Debug("zmlab2.Tent.CreateClientModel")
end

function zmlab2.Tent.DrawButton(icon,x,hovered,wipe)
    if wipe >= 1 then
        zmlab2.util.DrawOutlinedBox(x-22.5, -22.5, 45, 45, 2, color_white)

        surface.SetDrawColor(color_white)
        surface.SetMaterial(zmlab2.materials[icon])
        surface.DrawTexturedRectRotated(x,0, 40, 40, 0)

        if hovered then
            draw.RoundedBox(0, x-22.5, -22.5, 45, 45, zmlab2.colors["white02"])
        end
    else

        zmlab2.util.DrawOutlinedBox(x-22.5, -22.5, 45, 45, 2, zmlab2.colors["black02"])

        surface.SetDrawColor(zmlab2.colors["black02"])
        surface.SetMaterial(zmlab2.materials[icon])
        surface.DrawTexturedRectRotated(x,0, 40, 40, 0)

        surface.SetDrawColor(color_white)
        surface.SetMaterial(zmlab2.materials[icon])
    	// Draws right half of the texture
    	// Note that we also change the width of the rectangle to avoid stetcing of the texture
    	// This is for demonstration purposes, you can do whatever it is you need
    	surface.DrawTexturedRectUV( x-20, -20, 40, 40 * wipe, 0, 0, 1, wipe )
    end
end

function zmlab2.Tent.DrawControllPanel(Tent)
    local attach = Tent:GetAttachment(1)
    if attach == nil then return end

    cam.Start3D2D(attach.Pos, attach.Ang, 0.1)
        //draw.RoundedBox(0, -77.5, -60, 155, 120, zmlab2.colors["black01"])

        surface.SetDrawColor(zmlab2.colors["blue02"] )
        surface.SetMaterial(zmlab2.materials["item_bg"])
        surface.DrawTexturedRectRotated(0, 0, 155, 120, 0)

        zmlab2.Tent.DrawButton("icon_light",-50,Tent:OnLightButton(LocalPlayer()),1)
        zmlab2.Tent.DrawButton("icon_fire_extinguisher",0,Tent:OnExtinquisher(LocalPlayer()),zmlab2.Tent.GetNextExtinguish(Tent))

        if Tent:GetIsPublic() == false then
            zmlab2.Tent.DrawButton("icon_fold",50,Tent:OnFoldButton(LocalPlayer()),1)
        end

        surface.SetDrawColor(zmlab2.colors["black02"])
        surface.SetMaterial(zmlab2.materials["scanlines"])
        surface.DrawTexturedRectRotated(0, 0, 155, 120, 0)
    cam.End3D2D()
end

function zmlab2.Tent.DrawDynamicLight(Tent)
    if zmlab2.Convar.Get("zmlab2_cl_vfx_dynamiclight") == 0 then return end
    local col = zmlab2.Tent_LightColors[Tent.CurColID]

    // Dont even create a DynamicLight if we have black as a color
    if (col.r + col.g + col.b) <= 0 then return end
    local TentData = zmlab2.config.Tent[Tent:GetTentID()]

    local dlight = DynamicLight(Tent:EntIndex())
    if (dlight) then
        dlight.pos = Tent:LocalToWorld( TentData.light.pos)
        dlight.r = col.r
        dlight.g = col.g
        dlight.b = col.b
        dlight.brightness = TentData.light.brightness
        dlight.style = 0
        dlight.Decay = 1000
        dlight.Size = TentData.light.size
        dlight.DieTime = CurTime() + 1
    end
end

function zmlab2.Tent.Draw(Tent)
    if zmlab2.util.InDistance(Tent:GetPos(), LocalPlayer():GetPos(), 750) and IsValid(Tent.PreviewModel) then

        Tent.PreviewModel:SetPos(Tent:GetPos())
        Tent.PreviewModel:SetAngles(Tent:GetAngles())

        if Tent:GetBuildState() == 0 then
            Tent.PreviewModel:SetNoDraw(false)
            Tent.PreviewModel:SetMaterial("zerochain/zmlab2/shader/zmlab2_highlight")

            if zmlab2.Tent.Builder_HasSpace(Tent) then
                Tent.PreviewModel:SetColor(zmlab2.colors["green01"])
            else
                Tent.PreviewModel:SetColor(zmlab2.colors["red01"])
            end
        else
            zmlab2.Tent.DrawConstruction(Tent)
        end
    end

    if Tent:GetBuildState() ~= Tent.CurBuildState then
        Tent.CurBuildState = Tent:GetBuildState()
        // Clear the color id so it rebuilds the material once the tent got build again
        if Tent.CurBuildState ~= 2 and Tent.CurColID then

            // Reset all materials
            Tent:SetSubMaterial()
            Tent.CurColID = nil
        end
    end

    if zmlab2.util.InDistance(Tent:GetPos(), LocalPlayer():GetPos(), 300) and Tent:GetBuildState() >= 2 then

        if zmlab2.Convar.Get("zmlab2_cl_drawui") == 1 then zmlab2.Tent.DrawControllPanel(Tent) end

        if Tent:GetColorID() ~= Tent.CurColID then
            Tent.CurColID = Tent:GetColorID()
            zmlab2.Tent.UpdateLightMaterial(Tent)
        end

        // Update the material once it gets drawn
        if Tent.LastDraw and CurTime() > (Tent.LastDraw + 0.1) then
            zmlab2.Tent.UpdateLightMaterial(Tent)
        end

        Tent.LastDraw = CurTime()

        zmlab2.Tent.DrawDynamicLight(Tent)
    end
end

function zmlab2.Tent.DrawConstruction(Tent)
    local FinishTime = Tent:GetBuildCompletion()

    if Tent.BuildTime == nil then
        Tent.BuildTime = FinishTime - CurTime()
    end

    Tent.PreviewModel:SetNoDraw(true)
    Tent.PreviewModel:SetMaterial(nil)
    Tent.PreviewModel:SetColor(color_white)

    local fract = math.Clamp(FinishTime - CurTime(),0,Tent.BuildTime)
    fract = Tent.BuildTime - fract

    // Draw the spawning effect
    local delta = (1 / Tent.BuildTime) * fract
    math.Clamp(delta, 0, 1)

    render.EnableClipping(true)

        local min, max = Tent.PreviewModel:OBBMins(), Tent.PreviewModel:OBBMaxs()
        min, max = Tent.PreviewModel:LocalToWorld(min), Tent.PreviewModel:LocalToWorld(max)

        // The clipping plane only draws objects that face the plane
        local normal = -Tent.PreviewModel:GetUp()
        local cutPosition = LerpVector(delta, min, max) // Where it cuts
        local cutDistance = normal:Dot(cutPosition) // Project the vector onto the normal to get the shortest distance between the plane and origin

        // Activate the plane
        render.PushCustomClipPlane(normal, cutDistance)

        // Draw the partial model
        Tent.PreviewModel:DrawModel()

        // Remove the plane
        render.PopCustomClipPlane()
    render.EnableClipping(false)

    render.MaterialOverride(zmlab2.materials["highlight"])
    if zmlab2.Tent.Builder_IsAreaFree(Tent) then
        render.SetColorModulation(0.278, 0.819, 0.207)
    else
        render.SetColorModulation(0.819, 0.207, 0.207)
    end
    Tent.PreviewModel:DrawModel()
    render.MaterialOverride()
    render.SetColorModulation(1, 1, 1)
end

--PATH addons/zeros_methlab2/lua/zmlab2/tent/cl_tent_vgui.lua:
if not CLIENT then return end

net.Receive("zmlab2_Tent_OpenInterface", function(len)
    zmlab2.Debug_Net("zmlab2_Tent_OpenInterface", len)
    LocalPlayer().zmlab2_Tent = net.ReadEntity()
    LocalPlayer().zmlab2_TentID = net.ReadInt(16)
    LocalPlayer().zmlab2_TentFold = net.ReadBool()

    if LocalPlayer().zmlab2_TentFold == true then
        zmlab2.Interface.Create(600,365,zmlab2.language["Deconstruct"],function(pnl)

            local function AddLabel(txt,font)
                local Textbox01 = vgui.Create("DLabel", pnl)
                Textbox01:SetAutoDelete(true)
                Textbox01:SetSize(200 * zmlab2.wM, 30 * zmlab2.hM)
                Textbox01:Dock(TOP)
                Textbox01:SetText(txt)
                Textbox01:SetTextColor(color_white)
                Textbox01:SetFont(zmlab2.GetFont(font))
                Textbox01:SetContentAlignment(5)
                Textbox01:SizeToContentsX(15 * zmlab2.wM)
                Textbox01:DockMargin(0,0,0,0)
                return Textbox01
            end

            local Textbox01 = AddLabel(zmlab2.language["TentFoldInfo01"],"zmlab2_vgui_font03")
            Textbox01:DockMargin(0,60,0,0)
            AddLabel(zmlab2.language["TentFoldInfo02"],"zmlab2_vgui_font02")

            local FoldButton = vgui.Create("DButton", pnl)
            FoldButton:SetSize(300 * zmlab2.wM, 70 * zmlab2.hM)
            FoldButton:Dock(BOTTOM)
            FoldButton:SetPos((pnl:GetWide() / 2) - 150 * zmlab2.wM,(pnl:GetTall() / 2) + 50 * zmlab2.hM)
            FoldButton:SetText("")
            FoldButton.Paint = function(s, w, h)

                zmlab2.util.DrawOutlinedBox(0 * zmlab2.wM, 0 * zmlab2.hM, w, h, 2, color_white)

                draw.SimpleText(zmlab2.language["TentFoldAction"], zmlab2.GetFont("zmlab2_vgui_font03"), w / 2 , h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

                if s:IsHovered() then
                    draw.RoundedBox(0, 0, 0, w, h, zmlab2.colors["white02"])
                end
            end
            FoldButton.DoClick = function(s)
                zmlab2.vgui.PlaySound("UI/buttonclick.wav")

                net.Start("zmlab2_Tent_Fold")
                net.WriteEntity(LocalPlayer().zmlab2_Tent)
                net.SendToServer()

                pnl:Close()
            end
        end)
        return
    end

    if LocalPlayer().zmlab2_Tent:GetBuildState() < 1 then
        zmlab2.Interface.Create(700,300,zmlab2.language["SelectTentType"],function(pnl)

            zmlab2.Interface.AddModelList(pnl,zmlab2.config.Tent,function(id)
                // IsLocked
                return zmlab2.config.Tent[id].customcheck and zmlab2.config.Tent[id].customcheck(LocalPlayer()) == false or false
            end,
            function(id)
                // IsSelected
                return LocalPlayer().zmlab2_TentID == id
            end,
            function(id)
                net.Start("zmlab2_Tent_ChangeType")
                net.WriteEntity(LocalPlayer().zmlab2_Tent)
                net.WriteInt(id,16)
                net.SendToServer()

                LocalPlayer().zmlab2_TentID = id
            end,
            function(raw_data)
                return {model = raw_data.model,render = {FOV = 40},color = raw_data.color,bodygroup = {[0] = 5}} , raw_data.name , zmlab2.Money.Display(raw_data.price)
            end,
            function(MainContainer,item_size)
                local NoneButton = MainContainer:Add("DButton")
                NoneButton:SetSize(item_size,item_size)
                NoneButton:SetText("")
                NoneButton.Paint = function(s, w, h)
                    surface.SetDrawColor(zmlab2.colors["blue02"])
                    surface.SetMaterial(zmlab2.materials["item_bg"])
                    surface.DrawTexturedRect(0 * zmlab2.wM, 0 * zmlab2.hM, w,h)

                    draw.SimpleText(zmlab2.language["TentType_None"], zmlab2.GetFont("zmlab2_vgui_font02"), w / 2 , h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

                    if LocalPlayer().zmlab2_TentID == -1 then
                        zmlab2.util.DrawOutlinedBox(0 * zmlab2.wM, 0 * zmlab2.hM, w, h, 2, zmlab2.colors["orange01"])
                    else
                        zmlab2.util.DrawOutlinedBox(0 * zmlab2.wM, 0 * zmlab2.hM, w, h, 2, color_white)
                    end

                    if s:IsHovered() then
                        draw.RoundedBox(0, 0, 0, w, h, zmlab2.colors["white02"])
                    end
                end
                NoneButton.DoClick = function(s)
                    zmlab2.vgui.PlaySound("UI/buttonclick.wav")

                    LocalPlayer().zmlab2_TentID = -1

                    net.Start("zmlab2_Tent_ChangeType")
                    net.WriteEntity(LocalPlayer().zmlab2_Tent)
                    net.WriteInt(-1,16)
                    net.SendToServer()
                end
            end)

            local BuildButton = vgui.Create("DButton", pnl)
            BuildButton:SetSize(pnl:GetWide(),50 * zmlab2.hM)
            BuildButton:Dock(BOTTOM)
            BuildButton:SetText("")
            BuildButton.Paint = function(s, w, h)
                zmlab2.util.DrawOutlinedBox(0 * zmlab2.wM, 0 * zmlab2.hM, w, h, 2, color_white)

                draw.SimpleText(zmlab2.language["TentAction_Build"], zmlab2.GetFont("zmlab2_vgui_font03"), w / 2 , h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

                if s:IsHovered() then
                    draw.RoundedBox(0, 0, 0, w, h, zmlab2.colors["white02"])
                end
            end
            BuildButton.DoClick = function(s)
                zmlab2.vgui.PlaySound("UI/buttonclick.wav")

                net.Start("zmlab2_Tent_Build")
                net.WriteEntity(LocalPlayer().zmlab2_Tent)
                net.SendToServer()

                pnl:Close()
            end

            local ox,oy = pnl:GetPos()
            pnl:SetPos(ox,oy + 80 * zmlab2.hM)
        end)
    else
        zmlab2.Interface.Create(500,460,zmlab2.language["LightColor"],function(pnl)
            zmlab2.Interface.AddColorList(pnl,zmlab2.Tent_LightColors,function(id)
                // IsLocked
                return false
            end,
            function(id)
                // IsSelected
                return IsValid(LocalPlayer().zmlab2_Tent) and LocalPlayer().zmlab2_Tent:GetColorID() == id
            end,
            function(id)
                // OnClick
                net.Start("zmlab2_Tent_UpdateLightColorID")
                net.WriteEntity(LocalPlayer().zmlab2_Tent)
                net.WriteUInt(id,16)
                net.SendToServer()
            end,
            function() end)
        end)
    end
end)

--PATH addons/zeros_methlab2/lua/zmlab2/pollutionsystem/sh_pollutionsystem.lua:
zmlab2 = zmlab2 or {}
zmlab2.PollutionSystem = zmlab2.PollutionSystem or {}

zmlab2.PollutionSystem.PolutedAreas = zmlab2.PollutionSystem.PolutedAreas or {}

function zmlab2.PollutionSystem.GetSize()
    return 100
end

// Returns the Pump Duration
function zmlab2.PollutionSystem.GetPosition(raw_pos)
    local size = zmlab2.PollutionSystem.GetSize()
    return Vector(math.Round(zmlab2.util.SnapValue(size,raw_pos.x)),math.Round(zmlab2.util.SnapValue(size,raw_pos.y)),math.Round(zmlab2.util.SnapValue(size,raw_pos.z)))
end

function zmlab2.PollutionSystem.FindNearest(pos,dist)
    local id
    if zmlab2.PollutionSystem.PolutedAreas and #zmlab2.PollutionSystem.PolutedAreas > 0 then
        for k,v in pairs(zmlab2.PollutionSystem.PolutedAreas) do
            if v == nil then continue end
            if v.pos == nil then continue end

            //debugoverlay.Sphere(v.pos,10,1,Color( 255, 255, 255 ,50),true)

            if zmlab2.util.InDistance(v.pos, pos, dist) then
                //debugoverlay.Sphere(v.pos,25,1,Color( 0, 255, 0 ,50),true)

                id = k
                break
            end
        end
    end
    return id
end

--PATH addons/zeros_methlab2/lua/zmlab2/meth/cl_meth.lua:
if SERVER then return end
zmlab2 = zmlab2 or {}
zmlab2.Meth = zmlab2.Meth or {}

function zmlab2.Meth.Initialize(Meth)
    timer.Simple(0.1,function()
        if not IsValid(Meth) then return end
        Meth.Initialized = true
        zmlab2.Meth.UpdateMethMaterial(Meth)
    end)
end

function zmlab2.Meth.Draw(Meth)

    if Meth.Initialized and zmlab2.util.InDistance(Meth:GetPos(), LocalPlayer():GetPos(), 200) and zmlab2.Convar.Get("zmlab2_cl_drawui") == 1 then
        // Update the material once it gets drawn
        if Meth.LastDraw and CurTime() > (Meth.LastDraw + 0.1) then
            zmlab2.Meth.UpdateMethMaterial(Meth)
        end

        Meth.LastDraw = CurTime()

        zmlab2.Meth.DrawHUD(Meth:GetPos() + Vector(0,0,15),0.1,Meth:GetMethType(),Meth:GetMethAmount(),Meth:GetMethQuality())
    end
end

function zmlab2.Meth.UpdateMethMaterial(Meth)
    //zmlab2.Debug("zmlab2.Meth.UpdateMethMaterial")
    local MethMat = zmlab2.Meth.GetMaterial(Meth:GetMethType(),Meth:GetMethQuality())
    Meth:SetSubMaterial(0, "!" .. MethMat)
end



local Effect_Type = 1
local Effect_Quality = 1
local Effect_Duration = 0
local EffectStrength = 0
local AudioSwitch = true
local NextEffect = 0

//Starts our screeneffect
net.Receive("zmlab2_Meth_Consum", function(len)
    local newEffectType = net.ReadUInt(16)
    Effect_Quality = net.ReadUInt(16)
    Effect_Duration = net.ReadUInt(16)


    // Stop the current music
    if LocalPlayer().zmlab2_MethMusic and newEffectType ~= Effect_Type then
        LocalPlayer().zmlab2_MethMusic:Stop()
        LocalPlayer().zmlab2_MethMusic = nil
    end

    Effect_Type = newEffectType

    EffectStrength = (1 / zmlab2.config.Meth.MaxDuration) * Effect_Duration
    EffectStrength = EffectStrength * ((1 / 100) * Effect_Quality)

    if LocalPlayer().zmlab2_MethMusic then
        LocalPlayer().zmlab2_MethMusic:ChangeVolume(EffectStrength, 0)
    end

    zmlab2.Meth.ScreenEffect_Start()
end)

function zmlab2.Meth.ScreenEffect_Start()
    zmlab2.Hook.Remove("RenderScreenspaceEffects", "Meth")
    zmlab2.Hook.Add("RenderScreenspaceEffects", "Meth",zmlab2.Meth.ScreenEffect_Logic)
end

function zmlab2.Meth.ScreenEffect_Stop()
    LocalPlayer():SetDSP(0)
    Effect_Type = 1
    Effect_Quality = 1
    Effect_Duration = 0
    EffectStrength = 0
    AudioSwitch = true
    NextEffect = 0
    zmlab2.Hook.Remove("RenderScreenspaceEffects", "Meth")

    if LocalPlayer().zmlab2_MethMusic then LocalPlayer().zmlab2_MethMusic:Stop() end
end

local lastSoundStop
function zmlab2.Meth.Music()
    local ply = LocalPlayer()
    local MethData = zmlab2.config.MethTypes[Effect_Type]
    if MethData and MethData.visuals and MethData.visuals.music and Effect_Duration > 0 then

        if ply.zmlab2_MethMusic == nil then
            ply.zmlab2_MethMusic = CreateSound(ply, "zmlab2_meth_music_" .. Effect_Type)
        end

        if ply.zmlab2_MethMusic:IsPlaying() == false then
            ply.zmlab2_MethMusic:Play()
            ply.zmlab2_MethMusic:ChangeVolume(0, 0)
            ply.zmlab2_MethMusic:ChangeVolume(EffectStrength, 2)
        end
    else

        if IsValid(ply.zmlab2_MethMusic) and ply.zmlab2_MethMusic:IsPlaying() == true then
            ply.zmlab2_MethMusic:ChangeVolume(0, 2)
            if ((lastSoundStop or CurTime()) > CurTime()) then return end
            lastSoundStop = CurTime() + 3

            timer.Simple(2, function()
                if (IsValid(ply)) then
                    ply.zmlab2_MethMusic:Stop()
                end
            end)
        end
    end
end

function zmlab2.Meth.ScreenEffect_Logic()

    if IsValid(LocalPlayer()) and LocalPlayer():Alive() == false then
        zmlab2.Meth.ScreenEffect_Stop()
        return
    end

    zmlab2.Meth.Music()

    if Effect_Duration > 0 then
        local methData = zmlab2.config.MethTypes[Effect_Type]

        Effect_Duration = math.Clamp(Effect_Duration - (1 * FrameTime()), 0, zmlab2.config.Meth.MaxDuration)

        local qual_fract = (1 / 100) * Effect_Quality

        local alpha = (1 / zmlab2.config.Meth.MaxDuration) * Effect_Duration
        alpha = alpha * qual_fract

        EffectStrength = alpha

        if AudioSwitch == true then
            LocalPlayer():SetDSP(3)
            AudioSwitch = false
        end

        // We only create the effects every so often and only if Effect_Duration is above a certain value
        if methData.visuals and methData.visuals.effect and CurTime() > NextEffect and Effect_Duration > 5 then

            local count = math.Clamp(math.Round(10 * EffectStrength),1,3)

            for i = 1, count do
                //zmlab2.Effect.ParticleEffect(methData.visuals.effect, LocalPlayer():GetPos(), angle_zero, LocalPlayer())
                zmlab2.Effect.ParticleEffectAttach(methData.visuals.effect,PATTACH_ABSORIGIN_FOLLOW,LocalPlayer(), 0)
            end

            local delay = math.Clamp(2 - (2 * EffectStrength), 1, 5)
            NextEffect = CurTime() + delay
        end

        local h,s,v = ColorToHSV(methData.color)
        v = 0.5
        s = math.Clamp(s,0.15,1)
        local col = HSVToColor(h,s,v)

        local r,g,b = ((1 / 255) * col.r) * alpha,((1 / 255) * col.g) * alpha,((1 / 255) * col.b) * alpha

        if methData.visuals and methData.visuals.Bloom then
            DrawBloom(alpha * 0.3, alpha * 2, alpha * 8, alpha * 8, 15, 1,r,g,b)
        end

        if methData.visuals and methData.visuals.MotionBlur then
            DrawMotionBlur(0.1 * alpha, alpha, 0)
        end

        if methData.visuals and methData.visuals.MaterialOverlay then
            DrawMaterialOverlay(methData.visuals.MaterialOverlay, -0.2 * alpha)
        end

        local tab = {}
        tab["$pp_colour_colour"] = 0.5
        tab["$pp_colour_contrast"] = math.Clamp(1 * alpha, 1, 2)
        tab["$pp_colour_brightness"] = math.Clamp(-0.3 * alpha, -1, 1)
        tab["$pp_colour_addr"] = r
        tab["$pp_colour_addg"] = g
        tab["$pp_colour_addb"] = b
        tab["$pp_colour_mulg"] = 0
        tab["$pp_colour_mulr"] = 0
        tab["$pp_colour_mulb"] = 0
        DrawColorModify(tab)
    else
        zmlab2.Meth.ScreenEffect_Stop()
    end
end

zmlab2.Meth.Colors = {}
function zmlab2.Meth.DrawHUD(pos,scale,m_type,m_amount,m_quality)
    local methData = zmlab2.config.MethTypes[m_type]
    if methData == nil then return end

    // Creates a slightly darker version of the meth color
    if zmlab2.Meth.Colors[m_type] == nil then
        local h,s,v = ColorToHSV(methData.color)
        v = 0.4
        local col = HSVToColor(h,s,v)
        zmlab2.Meth.Colors[m_type] = col
    end

    cam.Start3D2D(pos, Angle(0, LocalPlayer():EyeAngles().y - 90, 90), scale)
        draw.RoundedBox(0, -100, -30, 200, 100, zmlab2.colors["black03"])

        local font = zmlab2.GetFont("zmlab2_font02")
        local txtSize = zmlab2.util.GetTextSize(methData.name,font)
        if txtSize > 200 then font = zmlab2.GetFont("zmlab2_font01") end
        draw.SimpleText(methData.name, font, 0, 0, methData.color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        zmlab2.util.DrawOutlinedBox(-100, -30, 200, 100, 2, methData.color)

        draw.SimpleText(m_amount .. zmlab2.config.UoM, zmlab2.GetFont("zmlab2_font01"), -50, 50, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        zmlab2.util.DrawOutlinedBox(-100, 30, 100, 40, 2, methData.color)

        draw.SimpleText(m_quality .. "%", zmlab2.GetFont("zmlab2_font01"), 50, 50, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        zmlab2.util.DrawOutlinedBox(0, 30, 100, 40, 2, methData.color)
    cam.End3D2D()
end

--PATH addons/zeros_weedfarm/lua/zwf_config_processing.lua:
zwf = zwf or {}
zwf.f = zwf.f or {}
zwf.config = zwf.config or {}



zwf.config.DryStation = {
    // How many % of weight are getting lost when drying
    Loss = 15,

    // How long does it take to dry weed
    Duration = 60,

    // How long does it take to harvest the weedstick from the DryStation
    Harvest_Time = 1,
}

zwf.config.Jar = {
    Capacity = 200, // How much weed can a jar hold
}

zwf.config.PackingStation = {
    // How many times needs the player interact with the packing station before the weedblock is done
    // Needs to be bigger then 7
    PackingCount = 12,
}

zwf.config.Palette = {
    // How many weedblocks can fit on one palette
    limit = 63,
}

zwf.config.DoobyTable = {
    // How much weed can be stored on the table
    Capacity = 30,

    // How much weed gets used per joint
    WeedPerJoint = 10,
}

zwf.config.Cooking = {
    // How much weed can a muffin hold?
    // *Note: This will define the max duration of the high effect after the player its the muffin.
    // Formel: (Muffin.WeedAmount / zwf.config.Bongs.Use_Amount) * zwf.config.HighEffect.DefaultEffect_Duration = Effect Duration
    weed_capacity = 30, // This weed amount will produce a high effect which has a length of 60 seconds

    // How long does the dough need to be mixed
    mix_duration = 30,

    // How long does the dough need to be baked
    bake_duration = 30,

    // Should we give the player energy instead of health?
    UseHungermod = false,

    edibles = {
        [1] = {
            name = "Muffin",

            // How much health does the player gets when eaten
            health = 5,

            // How much health can he gets at max when eating this?
            healthcap = 100,

            // The bodygroup used in the oven (Dont change it)
            oven_bg = 1,

            // The Model for the ingredient which needs to be added to the mixer
            backmix_model = "models/zerochain/props_weedfarm/zwf_backmix_muffin.mdl",

            // Model of the edible
            edible_model = "models/zerochain/props_weedfarm/zwf_muffin.mdl",
        },
        [2] = {
            name = "Brownie",
            health = 10,
            healthcap = 100,
            oven_bg = 2,
            backmix_model = "models/zerochain/props_weedfarm/zwf_backmix_brownie.mdl",
            edible_model = "models/zerochain/props_weedfarm/zwf_brownie.mdl",
        },
    }
}

--PATH addons/zeros_weedfarm/lua/zwf_languages/sh_zwf_language_de.lua:
zwf = zwf or {}
zwf.language = zwf.language or {}

zwf.language.General = zwf.language.General or {}
zwf.language.Shop = zwf.language.Shop or {}
zwf.language.NPC = zwf.language.NPC or {}
zwf.language.VGUI = zwf.language.VGUI or {}
zwf.language.Settings = zwf.language.Settings or {}


if (zwf.config.SelectedLanguage == "de") then

    zwf.language.General["Fuel"] = "Treibstoff"

    zwf.language.General["THC"] = "THC"
    zwf.language.General["Remove"] = "Entfernen"
    zwf.language.General["Splice"] = "Forschen" // The splice button on the seed lab for creating new seeds

    zwf.language.General["Bad"] = "Schlecht"
    zwf.language.General["Good"] = "Gut"

    zwf.language.General["Collect"] = "Sammeln"

    zwf.language.General["Speed"] = "Geschwindigkeit"
    zwf.language.General["Productivity"] = "Produktivität"
    zwf.language.General["AntiPlague"] = "Anti-Pest"

    zwf.language.General["Water"] = "Wasser"

    zwf.language.General["invalid_character"] = "Name hat ungültig zeichen!"
    zwf.language.General["name_too_short"] = "Name ist zu kurz!"
    zwf.language.General["name_too_long"] = "Name ist zu lang!"

    zwf.language.General["Cancel"] = "Abbrechen"
    zwf.language.General["Enter"] = "Bestätigen"

    zwf.language.General["ItemBought"] = "Du hast $itemname für $price$currency gekauft!"


    zwf.language.General["seedlab_titlescreen"] = "Saatgut Labor"
    zwf.language.General["seedlab_help"] = "Pflanzen Name"

    zwf.language.General["watertank_refill"] = "Nachfüllen"
    zwf.language.General["watertank_title"] = "Wassertank"

    zwf.language.General["bong_pickup_fail"] = "Du besitzt schon diese Bong!"
    zwf.language.General["bong_no_weed"] = "Kein Weed!"

    zwf.language.General["generator_repair"] = "Reparieren!"
    zwf.language.General["generator_start"] = "Start"
    zwf.language.General["generator_stop"] = "Stop"
    zwf.language.General["generator_nofuel"] = "Kein Benzin!"

    zwf.language.General["packingstation_info"] = "Plaziere Weed Glässer."
    zwf.language.General["packingstation_weedmix"] = "Weed Mix" // If the player mixes diffrent sorts of weed together then we change the name of the weed to this

    zwf.language.General["seedbank_full"] = "Samenbank ist voll!"

    zwf.language.General["plant_heal"] = "Heilen" // The heal button
    zwf.language.General["plant_harvest"] = "Ernten" // The harvest button
    zwf.language.General["plant_infected"] = "Infiziert!" // Tells us that the plant is infected
    zwf.language.General["plant_postgrow"] = "Wächst weiter" // Tells us that the plant is in the post grow phase
    zwf.language.General["plant_empty"] = "Leer" // Tells the player that the flowerpot is empty

    zwf.language.General["not_enough_money"] = "Das kannst du dir nicht leisten!"
    zwf.language.General["not_correct_rank"] = "Du hast nicht den benötigten Rang!"
    zwf.language.General["entity_limit"] = "Du hast das Entity limit für $itemname erreicht!"


    zwf.language.General["CableDistanceFail"] = "Objekte sind zu weit voneinander entfernt!"

    zwf.language.General["BongSharingFail"] = "$PlayerName hat bereits diese Bong!"

    zwf.language.General["WeedBlock"] = "Weedblock"

    zwf.language.General["WrongJob"] = "Falscher Job!"


    zwf.language.VGUI["Purchase"] = "Kaufen"
    zwf.language.VGUI["SellWeed"] = "Weed Verkaufen"
    zwf.language.VGUI["Drop"] = "Auspacken"
    zwf.language.VGUI["Delete"] = "Löschen"
    zwf.language.VGUI["weedbuyer_title"] = "Weed Käufer"
    zwf.language.VGUI["seedbank_title"] = "Samenbank"
    zwf.language.VGUI["Strain"] = "Sorte"
    zwf.language.VGUI["Duration"] = "Länge"
    zwf.language.VGUI["Difficulty"] = "Schwierigkeit"
    zwf.language.VGUI["HarvestAmount"] = "Ernte Menge"
    zwf.language.VGUI["THC"] = "THC Boost"
    zwf.language.VGUI["GrowTimeBoost"] = "Wachstums Boost"
    zwf.language.VGUI["GrowAmountBoost"] = "Ernte Boost"
    zwf.language.VGUI["THCBoost"] = "THC Boost"
    zwf.language.VGUI["SeedCount"] = "Samen Anzahl"
    zwf.language.VGUI["PowerUsage"] = "Stromverbrauch"
    zwf.language.VGUI["HeatProduction"] = "Wärmeerzeugung"
    zwf.language.VGUI["Ranks"] = "Ränge"
    zwf.language.VGUI["SeedName"] = "Saatgut Name"






    zwf.language.NPC["title"] = "Weed Käufer"
    zwf.language.NPC["profit"] = "Profit"
    zwf.language.NPC["interact_fail"] = "Hau ab!"
    zwf.language.NPC["interact_noweed"] = "Komme wieder wenn du was für mich hast!"


    zwf.language.Shop["title"] = "Grow Shop"

    zwf.language.Shop["category_Equipment"] = "Ausrüstung"

    zwf.language.Shop["item_generator_title"] = "Generator"
    zwf.language.Shop["item_generator_desc"] = "Erzeugt Strom für den Generator."

    zwf.language.Shop["item_fuel_title"] = "Benzin"
    zwf.language.Shop["item_fuel_desc"] = "Treibstoff für den Generator."

    zwf.language.Shop["item_lamp01_desc"] = "Bietet Licht für Pflanzen, erhöht aber deren Temperatur."
    zwf.language.Shop["item_lamp02_desc"] = "Versorgt Pflanzen mit Licht, ohne ihre Temperatur zu erhöhen."

    zwf.language.Shop["item_ventilator_title"] = "Ventilator"
    zwf.language.Shop["item_ventilator_desc"] = "Senkt die Temperatur der Pflanze."

    zwf.language.Shop["item_outlet_title"] = "Verteilersteckdose"
    zwf.language.Shop["item_outlet_desc"] = "Damit können Sie mehrere Maschinen mit Strom versorgen."

    zwf.language.Shop["item_flowerpot01_title"] = "Blumentopf"
    zwf.language.Shop["item_flowerpot01_desc"] = "Normaler Blumentopf für den Pflanzenanbau."

    zwf.language.Shop["item_flowerpot02_title"] = "Hydro Blumentopf"
    zwf.language.Shop["item_flowerpot02_desc"] = "Wird verwendet, um Pflanzen anzubauen. Kann an einen Wassertank zur automatischen Wasserversorgung angeschlossen werden."

    zwf.language.Shop["item_soil_title"] = "Erde"
    zwf.language.Shop["item_soil_desc"] = "Grundstoff für den Pflanzenanbau."

    zwf.language.Shop["item_watertank_title"] = "Wassertank"
    zwf.language.Shop["item_watertank_desc"] = "Produziert Wasser für Pflanzen."

    zwf.language.Shop["item_drystation_title"] = "Wäscheleine"
    zwf.language.Shop["item_drystation_desc"] = "Wird zum Trocknen von Weed verwended."

    zwf.language.Shop["item_packingtable_title"] = "Packtisch"
    zwf.language.Shop["item_packingtable_desc"] = "Wird verwendet, um Weed für den Transport vorzubereiten."

    zwf.language.Shop["item_autopacker_title"] = "Packtisch Verbesserung"
    zwf.language.Shop["item_autopacker_desc"] = "Kann in den Packtisch installiert werden, um den Prozess zu automatisieren."

    zwf.language.Shop["item_seedlab_title"] = "Saatgut Labor"
    zwf.language.Shop["item_seedlab_desc"] = "Hiermit kannst du Samen aus Weed herstellen."

    zwf.language.Shop["item_seedbank_title"] = "Samenbank"
    zwf.language.Shop["item_seedbank_desc"] = "Hiermit kannst du Samen speichern."

    zwf.language.Shop["item_palette_title"] = "Palette"
    zwf.language.Shop["item_palette_desc"] = "Wird für den Verkauf von Weedblöcken an den Weed Käufer verwendet."


    zwf.language.Shop["item_seed01_desc"] = "OG Kush is a legendary strain with a name that has recognition even outside of the cannabis world."
    zwf.language.Shop["item_seed02_desc"] = "Bubba Kush is a heavy indica hybrid that enjoys very wide popularity."
    zwf.language.Shop["item_seed03_desc"] = "Sour Diesel’s energized and positive high makes it easy to see why the strain enjoys popularity across the United States."
    zwf.language.Shop["item_seed04_desc"] = "AK-47 is a Sativa-dominate hybrid with bright white coloring."
    zwf.language.Shop["item_seed05_desc"] = "The genetics of Super Lemon Haze combine sweet and tart."
    zwf.language.Shop["item_seed06_desc"] = "Strawberry Cough is a bracing, taste-focused sativa hybrid."
    zwf.language.Shop["item_seed07_desc"] = "The purple characteristic of this strain is inherited from its ancestors from the Chitral region in the Pakistani Hindu Kush."

    zwf.language.Shop["category_Nutritions"] = "Dünger"

    zwf.language.Shop["item_nutrition01_desc"] = "Erhöht den Wachstum ein wenig."
    zwf.language.Shop["item_nutrition02_desc"] = "Erhöht den Wachstum erheblich."
    zwf.language.Shop["item_nutrition03_desc"] = "Erhöht die Erntemenge ein wenig."
    zwf.language.Shop["item_nutrition04_desc"] = "Erhöht die Erntemenge erheblich."
    zwf.language.Shop["item_nutrition05_desc"] = "Erhöht sowohl die Erntemenge als auch den Wachstum ein wenig."
    zwf.language.Shop["item_nutrition06_desc"] = "Erhöht sowohl die Erntemenge als auch den Wachstum erheblich."

    zwf.language.Shop["category_Seeds"] = "Saatgut"


    // Joint UPDATE
    zwf.language.General["joint_pickup_fail"] = "Du hast bereits einen Joint!"
    zwf.language.General["JointSharingFail"] = "$PlayerName hat schon einen Joint!"

    zwf.language.NPC["question_01"] = "Was willst du?"
    zwf.language.NPC["question_01_answer01"] = "Ich will ne Bong"
    zwf.language.NPC["question_01_answer02"] = "Ich hab Ganja für dich"
    zwf.language.NPC["question_01_answer03"] = "Nichts"

    zwf.language.NPC["question_02"] = "Welche willst du?"
    zwf.language.NPC["question_02_answer01"] = "Zurück" // This is the Back button on the NPC BongShop interface

end

--PATH addons/zeros_weedfarm/lua/zweedfarm/sh/zwf_precache.lua:
AddCSLuaFile()


util.PrecacheModel("models/zerochain/props_weedfarm/zwf_light_volume.mdl")
util.PrecacheModel("models/zerochain/props_weedfarm/zwf_jar.mdl")
util.PrecacheModel("models/zerochain/props_weedfarm/zwf_weedblock.mdl")


game.AddParticles("particles/zwf_plant.pcf")
PrecacheParticleSystem("zwf_cutting01")
PrecacheParticleSystem("zwf_cutting02")
PrecacheParticleSystem("zwf_cutting03")
PrecacheParticleSystem("zwf_flys")
PrecacheParticleSystem("zwf_heal")
PrecacheParticleSystem("zwf_packing01")
PrecacheParticleSystem("zwf_packing02")
PrecacheParticleSystem("zwf_packing03")
PrecacheParticleSystem("zwf_death01")
PrecacheParticleSystem("zwf_death02")
PrecacheParticleSystem("zwf_death03")


game.AddParticles("particles/zwf_selling.pcf")
PrecacheParticleSystem("zwf_sell")

game.AddParticles("particles/zwf_generator.pcf")
PrecacheParticleSystem("zwf_exaust")
PrecacheParticleSystem("zwf_damaged")

game.AddParticles("particles/zwf_water.pcf")
PrecacheParticleSystem("zwf_water_leak")

game.AddParticles("particles/zwf_lighter.pcf")
PrecacheParticleSystem("zwf_lighter_flame")

game.AddParticles("particles/zwf_seedlab.pcf")
PrecacheParticleSystem("zwf_scanning")

game.AddParticles("particles/zwf_ventilator.pcf")
PrecacheParticleSystem("zwf_airwave")

game.AddParticles("particles/zwf_bong.pcf")
PrecacheParticleSystem("zwf_ent_fire")
PrecacheParticleSystem("zwf_vm_fire")
PrecacheParticleSystem("zwf_joint_fire")

--PATH addons/zeros_weedfarm/lua/zweedfarm/sh/zwf_vfx.lua:
zwf = zwf or {}
zwf.f = zwf.f or {}




// Here we define diffrent effect groups which later make it pretty optimized to create Sound/Particle effects over the network
// The key will be used as the NetworkString
zwf.NetEffectGroups = {
	["zwf_joint_stop"] = {
		_type = "entity",

		action = function(ent)
			zwf.f.EmitSoundENT("zwf_joint_stop",ent)
		end,
	},
	["zwf_joint_start"] = {
		_type = "entity",

		action = function(ent)
			zwf.f.EmitSoundENT("zwf_joint_start",ent)
		end,
	},
	["zwf_cooking_flour"] = {
		_type = "entity",

		action = function(ent)
			zwf.f.EmitSoundENT("zwf_cooking_flour",ent)
		end,
	},
	["zwf_grab_weed"] = {
		_type = "entity",

		action = function(ent)
			zwf.f.EmitSoundENT("zwf_grab_weed",ent)
		end,
	},
	["zwf_cooking_dough"] = {
		_type = "entity",

		action = function(ent)
			zwf.f.EmitSoundENT("zwf_cooking_dough",ent)
		end,
	},
	["zwf_mixerbowl_add"] = {
		_type = "entity",

		action = function(ent)
			zwf.f.EmitSoundENT("zwf_mixerbowl_add",ent)
		end,
	},
	["zwf_mixerbowl_remove"] = {
		_type = "entity",

		action = function(ent)
			zwf.f.EmitSoundENT("zwf_mixerbowl_remove",ent)
		end,
	},
	["zwf_fuel_fill"] = {
		_type = "entity",

		action = function(ent)
			zwf.f.EmitSoundENT("zwf_fuel_fill",ent)
		end,
	},
	["zwf_generator_start_sucess"] = {
		_type = "entity",

		action = function(ent)
			zwf.f.EmitSoundENT("zwf_generator_start_sucess",ent)
		end,
	},
	["zwf_generator_start_fail"] = {
		_type = "entity",

		action = function(ent)
			zwf.f.EmitSoundENT("zwf_generator_start_fail",ent)
		end,
	},
	["zwf_generator_repair"] = {
		_type = "entity",

		action = function(ent)
			zwf.f.EmitSoundENT("zwf_generator_repair",ent)
			zwf.f.ParticleEffect("zwf_heal", ent:GetPos(), ent:GetAngles(), ent)
		end,
	},
	["zwf_muffin_eat"] = {
		_type = "entity",

		action = function(ent)
			zwf.f.EmitSoundENT("zwf_muffin_eat",ent)
		end,
	},
	["zwf_npc_wrongjob"] = {
		_type = "entity",

		action = function(ent)
			zwf.f.EmitSoundENT("zwf_npc_wrongjob",ent)
		end,
	},
	["zwf_selling"] = {
		_type = "entity",

		action = function(ent)
			zwf.f.EmitSoundENT("zwf_selling",ent)
		end,
	},
	["zwf_selling_effect"] = {
		action = function(pos)
			sound.Play(zwf.GlobalSounds["zwf_cash01"], pos, 75, 100, 1)
			zwf.f.ParticleEffect("zwf_sell", pos, Angle(0,0,0), Entity(1))
		end,
	},
	["zwf_npc_sell"] = {
		_type = "entity",

		action = function(ent)
			zwf.f.EmitSoundENT("zwf_npc_sell",ent)
		end,
	},
	["zwf_place_jar"] = {
		_type = "entity",

		action = function(ent)
			zwf.f.EmitSoundENT("zwf_place_jar",ent)
		end,
	},
	["zwf_plant_heal"] = {
		_type = "entity",

		action = function(ent)
			zwf.f.EmitSoundENT("zwf_plant_heal",ent)
			zwf.f.ParticleEffect("zwf_heal", ent:GetPos(), ent:GetAngles(),ent)
		end,
	},
	["zwf_cable_connect"] = {
		_type = "entity",

		action = function(ent)
			zwf.f.EmitSoundENT("zwf_cable_connect",ent)
		end,
	},
	["zwf_cable_select"] = {
		_type = "entity",

		action = function(ent)
			zwf.f.EmitSoundENT("zwf_cable_select",ent)
		end,
	},
	["zwf_cable_deconnect"] = {
		_type = "entity",

		action = function(ent)
			zwf.f.EmitSoundENT("zwf_cable_deconnect",ent)
		end,
	},
	["zwf_sniff"] = {
		_type = "entity",

		action = function(ent)
			zwf.f.EmitSoundENT("zwf_sniff",ent)
		end,
	},
	["zwf_water_refill"] = {
		_type = "entity",

		action = function(ent)
			zwf.f.EmitSoundENT("zwf_water_refill",ent)
		end,
	},
}


if SERVER then


	// Creates a network string for all the effect groups
	for k, v in pairs(zwf.NetEffectGroups) do
		util.AddNetworkString("zwf_fx_" .. k)
	end

	// Sends a Net Effect Msg to all clients
	function zwf.f.CreateNetEffect(id,data)

		// Data can be a entity or position

		local EffectGroup = zwf.NetEffectGroups[id]

		// Some events should be called on server to
		if EffectGroup._server then
			EffectGroup.action(data)
		end

		net.Start("zwf_fx_" .. id)
		if EffectGroup._type == "entity" then
			net.WriteEntity(data)
		else
			net.WriteVector(data)
		end
		net.Broadcast()
	end



	// Player Animation
	util.AddNetworkString("zwf_PlayerSmokeAnim_Start")
	function zwf.f.PlayerSmokeAnim_Start(ply)
		net.Start("zwf_PlayerSmokeAnim_Start")
		net.WriteEntity(ply)
		net.Broadcast()
	end

	util.AddNetworkString("zwf_PlayerSmokeAnim_Stop")
	function zwf.f.PlayerSmokeAnim_Stop(ply)
		net.Start("zwf_PlayerSmokeAnim_Stop")
		net.WriteEntity(ply)
		net.Broadcast()
	end


	// Animation
	util.AddNetworkString("zwf_AnimEvent")

	local function ServerAnim(prop, anim, speed)
		local sequence = prop:LookupSequence(anim)
		prop:SetCycle(0)
		prop:ResetSequence(sequence)
		prop:SetPlaybackRate(speed)
		prop:SetCycle(0)
	end

	function zwf.f.CreateAnimTable(prop, anim, speed)
		//ServerAnim(prop, anim, speed)
		net.Start("zwf_AnimEvent")
		local animInfo = {}
		animInfo.anim = anim
		animInfo.speed = speed
		animInfo.parent = prop
		net.WriteTable(animInfo)
		net.SendPVS(prop:GetPos())
	end

	//Effects
	util.AddNetworkString("zwf_FX")
	function zwf.f.CreateEffectTable(effect, _sound, parent, angle, position, attach)
		local effectInfo = {}

		if sound and effect == nil then
			effectInfo.sound = _sound
			effectInfo.parent = parent
		else

			effectInfo.effect = effect
			effectInfo.sound = _sound
			effectInfo.pos = position
			effectInfo.ang = angle
			effectInfo.parent = parent
			effectInfo.attach = attach
		end

		net.Start("zwf_FX")
		net.WriteTable(effectInfo)
		net.SendPVS(parent:GetPos())
	end

	function zwf.f.GenericEffect(effect,vPoint)
		local effectdata = EffectData()
		effectdata:SetStart(vPoint)
		effectdata:SetOrigin(vPoint)
		effectdata:SetScale(1)
		util.Effect(effect, effectdata)
	end


	// Creates the bong exhale effect
	util.AddNetworkString("zwf_SmokeEffect")
	function zwf.f.SmokeEffect(weedid,amount,ply,bongid)
		local BongInfo = {}
		BongInfo.weedid = weedid
		BongInfo.amount = amount
		BongInfo.bongid = bongid
		BongInfo.ply = ply

		net.Start("zwf_SmokeEffect")
		net.WriteTable(BongInfo)
		net.SendPVS(ply:GetPos())
	end
end

if CLIENT then

	// Player Animation
	net.Receive("zwf_PlayerSmokeAnim_Start", function(len)
		local ply = net.ReadEntity()

		if IsValid(ply) then

			ply:AnimRestartGesture( GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_GMOD_TAUNT_LAUGH, false )
		end
	end)

	net.Receive("zwf_PlayerSmokeAnim_Stop", function(len)
		local ply = net.ReadEntity()

		if IsValid(ply) then
			ply:AnimResetGestureSlot( GESTURE_SLOT_ATTACK_AND_RELOAD )
		end
	end)


	// Animation
	function zwf.f.ClientAnim(prop, anim, speed)
		local sequence = prop:LookupSequence(anim)
		prop:SetCycle(0)
		prop:ResetSequence(sequence)
		prop:SetPlaybackRate(speed)
		prop:SetCycle(0)
	end

	net.Receive("zwf_AnimEvent", function(len, ply)
		local animInfo = net.ReadTable()

		if (animInfo and IsValid(animInfo.parent) and animInfo.anim) then
			zwf.f.ClientAnim(animInfo.parent, animInfo.anim, animInfo.speed)
		end
	end)

	// Effects
	net.Receive("zwf_FX", function(len, ply)

		local effectInfo = net.ReadTable()
		zwf.f.Debug("FX Net Length: " .. len)

		if effectInfo and IsValid(effectInfo.parent) then

			if (effectInfo.sound) then
				zwf.f.EmitSoundENT(effectInfo.sound,effectInfo.parent)
			end

			if (effectInfo.effect and zwf.f.InDistance(LocalPlayer():GetPos(), effectInfo.parent:GetPos(), 500)) then

				if (effectInfo.attach) then

					zwf.f.ParticleEffectAttach(effectInfo.effect, PATTACH_POINT_FOLLOW, effectInfo.parent, effectInfo.attach)
				else

					zwf.f.ParticleEffect(effectInfo.effect, effectInfo.pos, effectInfo.ang, effectInfo.parent)
				end
			end
		end
	end)

	// Effects
	net.Receive("zwf_SmokeEffect", function(len)

		local BongInfo = net.ReadTable()

		if GetConVar("zwf_cl_vfx_exhaleeffect"):GetInt() == 0 then return end


		if BongInfo == nil then return end
		if BongInfo.weedid  == nil then return end
		if BongInfo.amount  == nil then return end
		if BongInfo.bongid  == nil then return end
		if BongInfo.ply  == nil then return end

		local ply  = BongInfo.ply



		if IsValid(ply) and zwf.f.InDistance(LocalPlayer():GetPos(), ply:GetPos(), 500) then

			zwf.f.EmitSoundENT("zwf_bong_exhale_short", ply)

			local attach = ply:GetAttachment(ply:LookupAttachment("mouth"))

			if attach == nil then return end

			local pos = attach.Pos

			if ply.zwf_SmokeEmitter == nil or ply.zwf_SmokeEmitter == NULL then
				ply.zwf_SmokeEmitter = ParticleEmitter( pos , false )
			end


			local UseCount


			if BongInfo.bongid == 25 then
				UseCount = math.Round(zwf.config.DoobyTable.WeedPerJoint / zwf.config.Bongs.Use_Amount)
			else
				local SWEPData = zwf.config.Bongs.items[BongInfo.bongid]

				UseCount = math.Round(SWEPData.hold_amount / zwf.config.Bongs.Use_Amount)
			end

			local effect_length = (3 / UseCount) * BongInfo.amount

			if effect_length >= 3 then
				zwf.f.EmitSoundENT("zwf_bong_exhale_long", ply)
			elseif effect_length >= 1.5 then
				zwf.f.EmitSoundENT("zwf_bong_exhale_mid", ply)
			else
				zwf.f.EmitSoundENT("zwf_bong_exhale_short", ply)
			end

			local ParticleCount = effect_length / 0.05

			local delay = 0.05

			for i = 1,math.Round(ParticleCount) do

				timer.Simple(delay,function()
					if IsValid(ply) and ply.zwf_SmokeEmitter then
						attach = ply:GetAttachment(ply:LookupAttachment("mouth"))

						if attach then

							pos = attach.Pos
							local vel = attach.Ang:Forward() * 100

							local particle = ply.zwf_SmokeEmitter:Add("zerochain/zwf/particle/zwf_skankcloud", pos)
							particle:SetVelocity(vel)
							particle:SetAngles( Angle(math.random(0,360),math.random(0,360),math.random(0,360)) )
							particle:SetDieTime(math.random(2,9))
							particle:SetStartAlpha(150)
							particle:SetEndAlpha(0)
							particle:SetStartSize(math.random(1,3))
							particle:SetEndSize(math.random(50,75))

							local particleColor = zwf.default_colors["white01"]
							particleColor = zwf.config.Plants[BongInfo.weedid].color

							particle:SetColor(particleColor.r, particleColor.g, particleColor.b)
							particle:SetGravity(Vector(0, 0, -5))
							particle:SetAirResistance(55)
						end
					end
				end)
				delay = delay + 0.05
			end

			timer.Simple(effect_length,function()
				if IsValid(ply) and ply.zwf_SmokeEmitter and ply.zwf_SmokeEmitter ~= NULL then

					ply.zwf_SmokeEmitter:Finish()
					ply.zwf_SmokeEmitter = NULL
				end
			end)

		end
	end)


	function zwf.f.ParticleEffect(effect, pos, ang, ent)
		if GetConVar("zwf_cl_vfx_particleeffects"):GetInt() == 1 then
			ParticleEffect(effect, pos, ang, ent)
		end
	end

	function zwf.f.ParticleEffectAttach(effect, enum, ent, attachid)
		if GetConVar("zwf_cl_vfx_particleeffects"):GetInt() == 1 then
			ParticleEffectAttach(effect, enum, ent, attachid)
		end
	end

	for k, v in pairs(zwf.NetEffectGroups) do
		net.Receive("zwf_fx_" .. k, function(len)
			zwf.f.Debug("zwf_fx_" .. k .. " Len: " .. len)

			if v._type == "entity" then
				local ent = net.ReadEntity()

				if IsValid(ent) then

					zwf.NetEffectGroups[k].action(ent)
				end
			else
				local pos = net.ReadVector()
				if pos then
					zwf.NetEffectGroups[k].action(pos)
				end
			end
		end)
	end
end

--PATH vcmod??various_all:
function VC.convertColorString(data)  local ret = string.Explode(",", data)  ret = Color(tonumber(ret[1]),tonumber(ret[2]),tonumber(ret[3]),255)  return ret end  function VC.GetDriver(ent)    local Drv_AI = ent.VC_AI_Driver  if CLIENT then Drv_AI = ent:GetNWEntity("VC_AI_Driver") end  if IsValid(Drv_AI) then return Drv_AI end     local drv = ent.GetDriver and ent:GetDriver()  if IsValid(drv) then return drv end end  function VC.getVehicle(ply)    local veh_AI = ply.VC_Vehicle  if CLIENT then veh_AI = ply:GetNWEntity("VC_Vehicle") end  if IsValid(veh_AI) then return veh_AI end     local veh = ply.GetVehicle and ply:GetVehicle()  if IsValid(veh) then return veh end end  function VC.getVehicleTrace(ply, onlyveh)  local ent, pos = ply:GetVehicle(), Vector(0,0,0)  if !IsValid(ent) then  local tr = ply:GetEyeTraceNoCursor() pos = tr.HitPos ent = tr.Entity  if IsValid(ent) then  if !ent:IsVehicle() then  local atc = ent:GetNWEntity("VC_AttachedTo")  if IsValid(atc) then  ent = atc  else  if !onlyveh and string.lower(ent:GetClass()) == "prop_physics" then else ent = nil end  end  end  elseif VC.Dev_Menu_Open and IsValid(VC.Dev_LastVehicle) then  ent = VC.Dev_LastVehicle pos = IsValid(ent) and ent:GetPos()  end  if !IsValid(ent) then ent = nil end  end    if ent and ent.VC_ExtraSeat then ent = ent:GetParent() end   if VC.Dev_Menu_Open and ent then VC.Dev_LastVehicle = ent end   return ent, pos end  function VC.time_elapsed_string(time)  time = tonumber(time or 0)  if !time then time = 0 end  local timeNew = math.abs(os.time() - time)  local future = os.time() < time  if timeNew < 1 then return 'Just now' end  local a = {[31536000]  =  'year', [2592000]  =  'month', [86400]  =  'day', [3600]  =  'hour', [60]  =  'minute', [1] =  'second'}  for secs,str in SortedPairs(a, true) do  local d = timeNew / secs  if d >= 1 then  local r = math.Round(d)  local plural = r > 1 and (str.."s") or str  if future then return 'In '.. r .. ' ' .. plural else return r .. ' ' .. plural .. ' ago' end  end  end end  function VC.getFilesTable(dir, basedir, cat)  local ret = {}   if cat then if !ret[cat] then ret[cat] = {} end end   local f1, f2 = file.Find(dir.."*", basedir or "GAME")  if f2 then  for k,v in pairs(f2) do  if !ret[v] then ret[v] = {} end  ret[v] = VC.getFilesTable(dir..v.."/", basedir)  end  end   if f1 then for k,v in pairs(f1) do local fp = dir..v ret[k] = fp end end   return ret end  function VC.CanEditAdminSettings(ply, dontprint)  if !IsValid(ply) then return false end  local ret = VC.PrivilegesCan(ply)  local hookCall1 = hook.Call("VC_CanEditAdminSettings", GAMEMODE, ply, ret)  local hookCall2 = hook.Call("VC_canEditAdminSettings", GAMEMODE, ply, ret)  if hookCall1 != nil or hookCall2 != nil then ret = hookCall1 != nil and hookCall1 or hookCall2 != nil and hookCall2 end  if !ret and !dontprint and (!ply.VC_CanEditAS_Time or CurTime() >= ply.VC_CanEditAS_Time) then ply.VC_CanEditAS_Time = CurTime()+0.5 if CLIENT then VCPopup("AccessRestricted", "cross") else VCPopup(ply, "AccessRestricted", "cross") end end  return ret end  function VC.Get2DNormalFromAngle(ang) ang = ang/180*math.pi return {x = math.sin(ang), y = math.cos(ang)} end function VC.Get2DAngle(pos1, pos2, cutMid)  local ret = 0   local ypd = pos1.y- pos2.y  local xpd = pos1.x- pos2.x   if cutMid and xpd < 2 and xpd > -2 and ypd < 2 and ypd > -2 then xpd = 2 ypd = -1 end  local rad = math.atan2(xpd, ypd)  ret = math.NormalizeAngle(rad*180/math.pi)   return ret end  function VC.StringPrepareForTransfer(str)  str = string.gsub(str, '^', '_U_')  str = string.gsub(str, ':', '_D_')  str = string.gsub(str, ';', '_D2_')  str = string.gsub(str, '&', '_A_')  str = string.gsub(str, ' ', '@@')  str = string.Implode("_P_", string.Explode("%", str))  return str end  function VC.ColorCopyAlpha(val, a) local ret = val if val then ret = Color(val.r or 0, val.g or 0, val.b or 0, a or 255) end return ret end  function VC.ColorToHSV(clr)  local h,s,v,a = 0,0,0,0   if clr then  r, g, b, a = clr.r/255, clr.g/255, clr.b/255, clr.a/255  local max, min = math.max(r, g, b), math.min(r, g, b)  v = max   local d = max- min if max == 0 then s = 0 else s = d / max end   if max == min then  h = 0  else  if max == r then h = (g - b) / d if g < b then h = h + 6 end  elseif max == g then h = (b- r)/d+ 2  elseif max == b then h = (r- g)/d+ 4  end  h = h/ 6  end  end  return math.NormalizeAngle(h*360), s, v, a end  function VC.HSVToColor(h, s, v, a)  local r,g,b = 0,0,0  if v > 0 then  local hs = math.floor(h/60) local h_so = h/60-hs local p,q,t = v*(1-s), v*(1-s*h_so), v*(1-s*(1-h_so))  if hs == 0 then r,g,b = v,t,p elseif hs == 1 then r,g,b = q,v,p elseif hs == 2 then r,g,b = p,v,t elseif hs == -3 then r,g,b = p,q,v elseif hs == -2 then r,g,b = t,p,v elseif hs == -1 then r,g,b = v,p,q end  end  return Color(math.Round(r*255),math.Round(g*255),math.Round(b*255),math.Round(a*255)) end  function VC.capitalizeFirstLetter(str)  local chunks = string.Explode("", str)  chunks[1] = string.upper(chunks[1])  return string.Implode("", chunks) end  function VC.EaseInOut(num) return (math.sin(math.pi*(num-0.5))+1)/(num > 0 and 2 or -2) end function VC.EaseIn(num) return math.sin((num-1)* math.pi* 0.5)+1 end function VC.EaseOut(num) return math.sin(num* math.pi* 0.5) end     if SERVER and !VC [ "VVE".."CS".."TAG" ] then VC    =  "d".."rd" end  if CLIENT then  if !VC.Config then VC.Config = {} end   local dirConfigCl = "vcmod/config_cl.txt"  function VC.SetConfig(data, val, onsetfunc)  local Settings = {}   local exists = file.Exists(dirConfigCl, "DATA")  if exists then Settings = util.JSONToTable(file.Read(dirConfigCl, "DATA")) end  if !Settings then Settings = {} if exists then VCPrint("ERROR: client config_cl.txt file has been corrupted, recreating!") end end  Settings[data] = val  if onsetfunc then onsetfunc(val) end  file.Write(dirConfigCl, util.TableToJSON(Settings, true))  VC.Config = Settings  end   function VC.GetConfig(data) if !VC.ConfigInited then if file.Exists(dirConfigCl, "DATA") then VC.Config = util.JSONToTable(file.Read(dirConfigCl, "DATA")) end VC.ConfigInited = true end return VC.Config and VC.Config[data] end   function VC.SetPrivileges(val) if LocalPlayer():IsSuperAdmin() then net.Start("VC_Privileges_Set") net.WriteInt(val, 4) net.SendToServer() else VCPopup("AccessRestricted", "cross") end end  function VC.GetPrivileges() return VC.PrivilegesLevel or 2 end else  util.AddNetworkString("VC_Privileges_Set")  function VC.LoadPrivileges() VC.PrivilegesLevel = file.Exists("vcmod/config_sv_privileges.txt", "DATA") and tonumber(file.Read("vcmod/config_sv_privileges.txt", "DATA")) or 2 end  function VC.SetPrivileges(val) file.Write("vcmod/config_sv_privileges.txt", val) VC.PrivilegesLevel = tonumber(val) VC.Stream_SV_Settings() end  function VC.GetPrivileges() if !VC.PrivilegesLevel then VC.LoadPrivileges() end return VC.PrivilegesLevel or 2 end   net.Receive("VC_Privileges_Set", function(len, ply)  if !IsValid(ply) then return end  if !ply:IsSuperAdmin() then return end  local val = net.ReadInt(4) VC.SetPrivileges(val)  end)   VC.LoadPrivileges() end  function VC.PrivilegesCan(ply) if !VC.PrivilegesLevel or (VC.PrivilegesLevel == 1 and ply:IsSuperAdmin() or VC.PrivilegesLevel == 2 and ply:IsAdmin() or VC.PrivilegesLevel == 3) then return true end end   function VC.getRanks()  local ret = {user = "user", admin = "admin", superadmin = "superadmin"}     local ranks = xgui and xgui.data and xgui.data.groups  if ranks then  for k,v in pairs(ranks) do  ret[k] = "(ULX) "..v  end  end     local ranks = serverguard and serverguard.ranks and serverguard.ranks.GetRanks and serverguard.ranks:GetRanks()  if ranks then  for k,v in pairs(ranks) do  ret[k] = "(ServerGuard) "..(v.name or k)  end  end     local ranks = sam and sam.ranks and sam.ranks.get_ranks  if ranks then  for k,v in pairs(ranks()) do  ret[k] = "(SAM) "..(v.name or k)  end  end       local ranks = xAdmin and xAdmin.Groups  if ranks then  for k,v in pairs(ranks) do  ret[k] = "(XAdmin) "..(k)  end  end   return ret end local rs7 = "vc.check_msg_work_ALS_k4"  
--PATH vcmod??metadata:
VC_AU_Ver_Online = 9.65  VC_useBeta = nil      VC.IndicationList = {  {idx = "blinkers_left", nm = "Blinker lights left", type = 1, getVal = function(ent) return VC.GetState(ent, "TurnLightLeftOn") end},  {idx = "blinkers_right", nm = "Blinker lights right", type = 1, getVal = function(ent) return VC.GetState(ent, "TurnLightRightOn") end},  {idx = "lights_hazard", nm = "Hazard lights", type = 1, getVal = function(ent) return VC.GetState(ent, "HazardLightsOn") end},  {idx = "lights_running", nm = "Running lights", type = 1, getVal = function(ent) return VC.GetState(ent, "RunningLightsOn") end},  {idx = "lights_fog", nm = "Fog lights", type = 1, getVal = function(ent) return VC.GetState(ent, "FogLightsOn") end},  {idx = "lights_brake", nm = "Brake lights", type = 1, getVal = function(ent) return ent.VC_Lights_Created["Brake"] end},  {idx = "lights_reverse", nm = "Reverse lights", type = 1, getVal = function(ent) return ent.VC_Lights_Created["Reverse"] end},  {idx = "lights_lowbeams", nm = "Low-Beam lights", type = 1, getVal = function(ent) return VC.GetState(ent, "LowBeamsOn") end},  {idx = "lights_highbeams", nm = "High-Beam lights", type = 1, getVal = function(ent) return VC.GetState(ent, "HighBeamsOn") end},  {idx = "cruise", nm = "Cruise control", type = 1, getVal = function(ent) return VC.GetState(ent, "CruiseOn") end},  {idx = "horn", nm = "Horn", type = 1, getVal = function(ent) VCMsg(ent) return VC.GetState(ent, "HornOn") end},  {idx = "handbrake", nm = "Handbrake", type = 1, getVal = function(ent) return ent.VC_HandBrakeOn end},  {idx = "electricity", nm = "Electricity on", type = 1, getVal = function(ent) return VC.ElectronicsOn(ent) end},  {idx = "driver_in_seat", nm = "Driver in seat", type = 0, getVal = function(ent) return VC_A or IsValid(VC.GetDriver(ent)) end},  {idx = "trailer", nm = "Trailer attached", type = 1, getVal = function(ent) return IsValid(ent.VC_HookVeh) end},  {idx = "els_lights", nm = "ELS lights", type = 1, getVal = function(ent) return VC.ELS_LightsOn(ent) end},  {idx = "els_sound", nm = "ELS sounds", type = 1, getVal = function(ent) return VC.ELS_SoundOn(ent) end},  {idx = "locked", nm = "Vehicle locked", type = 1, getVal = function(ent) return VC.IsLocked(ent) end},  {idx = "throttle", nm = "Throttle", type = 1, getVal = function(ent) return (ent.VC_Throttle or ent:GetThrottle() or 0) != 0 end},  {idx = "throttle_forw", nm = "Throttle while forward only", type = 1, getVal = function(ent) local thrt = ent.VC_Throttle or ent:GetThrottle() or 0 return thrt > 0.05 end},  {idx = "throttle_rev", nm = "Throttle while reversing only", type = 1, getVal = function(ent) local thrt = ent.VC_Throttle or ent:GetThrottle() or 0 return thrt < -0.05 end},   {idx = "speedo_kmph", nm = "Speedometer km/h", type = 0, defaultTop = 240, getVal = function(ent) return ent:VC_GetSpeedKmH() end},  {idx = "speedo_mph", nm = "Speedometer m/h", type = 0, defaultTop = 200, getVal = function(ent) return VC.KmToM(ent:VC_GetSpeedKmH()) end},  {idx = "fuel", nm = "Fuel", type = 0, defaultTop = 1, getVal = function(ent) return ent.VC_Fuel and ent.VC_Fuel/ent.VC_MaxFuel or 0 end},  {idx = "fuel_lid_active", nm = "Fuel lid in use", type = 1, getVal = function(ent) return ent.VC_ForceOpenFuelLidTime or IsValid(ent.VC_Weld_FNozzle) end},  {idx = "health_engine", nm = "Engines health", type = 0, defaultTop = 1, getVal = function(ent) return ent.VC_HealthPerc or 0 end},   {idx = "damage_tire_fl", nm = "Flat tire: front left", type = 1, getVal = function(ent) return ent.VC_DamagedObjects and ent.VC_DamagedObjects.Wheel and ent.VC_DamagedObjects.Wheel[1] end},  {idx = "damage_tire_fr", nm = "Flat tire: front right", type = 1, getVal = function(ent) return ent.VC_DamagedObjects and ent.VC_DamagedObjects.Wheel and ent.VC_DamagedObjects.Wheel[2] end},  {idx = "damage_tire_rl", nm = "Flat tire: rear left", type = 1, getVal = function(ent) return ent.VC_DamagedObjects and ent.VC_DamagedObjects.Wheel and ent.VC_DamagedObjects.Wheel[3] end},  {idx = "damage_tire_rr", nm = "Flat tire: rear right", type = 1, getVal = function(ent) return ent.VC_DamagedObjects and ent.VC_DamagedObjects.Wheel and ent.VC_DamagedObjects.Wheel[4] end},   }  VC.IndicationListByKey = {} for i=1,#VC.IndicationList do local data = VC.IndicationList[i] VC.IndicationListByKey[data.idx] = data end      VC.Constant_Currency = {  {symbol = "$", shrt = "USD", name = "United States dollar"},  {symbol = "€", shrt = "EUR", name = "Euro"},  {symbol = "£", shrt = "GBP", name = "British pound"},  {symbol = "kr", shrt = "KRONE", name = "Norwegian krone"},  {symbol = "₣", shrt = "FF", name = "French franc"},  {symbol = "₽", shrt = "RUB", name = "Russian ruble"},  {symbol = "₺", shrt = "TL", name = "Turkish Lira"},  {symbol = "R", shrt = "ZAR", name = "South African rand"},  {symbol = "¥", shrt = "JPY", name = "Japanese yen"},  {symbol = "¥", shrt = "CNY", name = "Renminbi (RMB) - Chinese yuan"}, }  function VC.getCurCurrency()  local tbl = {}  if VC.Constant_Currency then  tbl = VC.Constant_Currency[1]  local set = 1 if CLIENT then set = VC.getServerSetting("Currency", 1) else set = VC.getSetting("Currency", 1) end  if VC.Constant_Currency[set] then tbl = VC.Constant_Currency[set] end  end  return tbl end      VC.SemiAutoData = {  alfa = {fuel = {lidside = 1, lidoffset = Vector(0,0,5), type = 1}, UI_Inter = {vc_lights_switch = Vector(-10,30,-12)}},  audi = {fuel = {lidside = 1, lidoffset = Vector(0,0,5), type = 1}, UI_Inter = {vc_lights_switch = Vector(12.5,33,-16.5), vc_horn = Vector(0,23,-14)}},  bmw = {fuel = {lidside = 1, lidoffset = Vector(0,0,5)}, UI_Inter = {vc_lights_switch = Vector(13,32,-14.5)}},  mercedes = {fuel = {lidside = 1, lidoffset = Vector(0,0,5)}, UI_Inter = {vc_lights_switch = Vector(12,27,-16)}},  volkswagen = {fuel = {lidside = 1, lidoffset = Vector(0,-10,5), type = 1}, UI_Inter = {vc_lights_switch = Vector(12,27,-13)}},  beetle = {fuel = {lidside = 1, lidoffset = Vector(0,-10,5)}, UI_Inter = {vc_lights_switch = Vector(12,27,-13)}},  porche = {fuel = {lidside = 1, lidoffset = Vector(0,-5,0)}, UI_Inter = {vc_lights_switch = Vector(10,28,-14)}},  leaf = {fuel = {lidside = 1, lidoffset = Vector(0,0,5), type = 2}},  nissan = {fuel = {lidside = 1, lidoffset = Vector(0,-12,-1)}, UI_Inter = {vc_lights_switch = Vector(8,28,-14)}},  maserati = {fuel = {lidside = -1, lidoffset = Vector(0,0,5)}},  lexus = {fuel = {lidside = -1, lidoffset = Vector(0,0,5)}},  mazda = {fuel = {lidside = -1, lidoffset = Vector(0,0,5)}, UI_Inter = {vc_lights_switch = Vector(9,25,-14)}},  tesla = {fuel = {lidside = 1, lidoffset = Vector(0,0,5), type = 2}},  prius = {fuel = {lidside = 1, lidoffset = Vector(0,0,5), type = 2}},  unknown = {fuel = {lidside = 1, lidoffset = Vector(0,0,5), Capacity = 50, Capacity_Auto = true}, UI_Inter = {vc_lights_switch = Vector(13,32,-14.5)}},  unknown_big = {fuel = {lidside = 1, lidoffset = Vector(0,0,5), type = 1, Capacity = 200, Capacity_Auto = true}, UI_Inter = {vc_lights_switch = Vector(-8,19,-11)}}, }   function VC.SemiAutoData_Pick(ent)  local ret = nil  local name = VC.getName(ent, "")  local cat = ent:GetNWString("VC_Category", "")  local mdl = VC.GetModel(ent)..name..cat   for k,v in pairs(VC.SemiAutoData) do if string.gmatch(string.lower(mdl), k)() then ret = k break end end  if !ret then if VC.IsBig(ent) then ret = "unknown_big" else ret = "unknown" end end   return ret end     if !VC.Controls_Main then VC.Controls_Main = {} end  function VC.controlInsert(data)  local added = false for k2,v2 in pairs(VC.Controls_Main) do if data.cmd == v2.cmd then added = true break end end  if !added then table.insert(VC.Controls_Main, data) end end  local data = {cmd = "vc_horn", menu = "controls", NoCheckBox = true, carg1 = "1", carg2 = "2", info = "Horn", default = {key = "KEY_R", hold = "1"}} VC.controlInsert(data)  local data = {cmd = "vc_holdkey", menu = "controls_holdkey", NoCheckBox = true, carg1 = "1", carg2 = "2", info = "HoldKey", default = {key = "KEY_LALT", hold = "1"}} VC.controlInsert(data)      function VC.getWheelData(ent)  if VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).IsBike then  return VC.WheelsBike, true  else  return VC.Wheels, false  end end  VC.Wheels = {"wheel_fl", "wheel_fr", "wheel_rl", "wheel_rr"} VC.WheelsBike = {[1] = "wheel_fl", [3] = "wheel_rl"}  VC.SideNames = {"Front left", "Front right", "Rear left", "Rear right"} local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod?menu:
if !VC.Material then VC.Material = {} end if !VC.Image then VC.Image = {} end   local ID = "hue_ring" VC.Image[ID] = "materials/vcmod/gui/hue_ring.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_add" VC.Image[ID] = "materials/vcmod/gui/icons/add.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_brakepads" VC.Image[ID] = "materials/vcmod/gui/icons/brakepads.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_car" VC.Image[ID] = "materials/vcmod/gui/icons/car.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_check" VC.Image[ID] = "materials/vcmod/gui/icons/check.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_climate" VC.Image[ID] = "materials/vcmod/gui/icons/climate.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_copy" VC.Image[ID] = "materials/vcmod/gui/icons/copy.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_cross" VC.Image[ID] = "materials/vcmod/gui/icons/cross.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_download" VC.Image[ID] = "materials/vcmod/gui/icons/download.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_drop" VC.Image[ID] = "materials/vcmod/gui/icons/drop.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_edit" VC.Image[ID] = "materials/vcmod/gui/icons/edit.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_electricity" VC.Image[ID] = "materials/vcmod/gui/icons/electricity.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_els" VC.Image[ID] = "materials/vcmod/gui/icons/els.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_esp" VC.Image[ID] = "materials/vcmod/gui/icons/esp.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_exhaust" VC.Image[ID] = "materials/vcmod/gui/icons/exhaust.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_fuel" VC.Image[ID] = "materials/vcmod/gui/icons/fuel.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_home" VC.Image[ID] = "materials/vcmod/gui/icons/home.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_info" VC.Image[ID] = "materials/vcmod/gui/icons/info.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_left" VC.Image[ID] = "materials/vcmod/gui/icons/left.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_paste" VC.Image[ID] = "materials/vcmod/gui/icons/paste.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_remove" VC.Image[ID] = "materials/vcmod/gui/icons/remove.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_repair" VC.Image[ID] = "materials/vcmod/gui/icons/repair.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_right" VC.Image[ID] = "materials/vcmod/gui/icons/right.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_save" VC.Image[ID] = "materials/vcmod/gui/icons/save.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_search" VC.Image[ID] = "materials/vcmod/gui/icons/search.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_seat" VC.Image[ID] = "materials/vcmod/gui/icons/seat.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_settings" VC.Image[ID] = "materials/vcmod/gui/icons/settings.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_spikestrips" VC.Image[ID] = "materials/vcmod/gui/icons/spikestrips.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_trailer" VC.Image[ID] = "materials/vcmod/gui/icons/trailer.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_upload" VC.Image[ID] = "materials/vcmod/gui/icons/upload.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_wheel" VC.Image[ID] = "materials/vcmod/gui/icons/wheel.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_abs" VC.Image[ID] = "materials/vcmod/gui/icons/dashboard/abs.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_airbag" VC.Image[ID] = "materials/vcmod/gui/icons/dashboard/airbag.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_battery" VC.Image[ID] = "materials/vcmod/gui/icons/dashboard/battery.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_blinker_left" VC.Image[ID] = "materials/vcmod/gui/icons/dashboard/blinker_left.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_blinker_right" VC.Image[ID] = "materials/vcmod/gui/icons/dashboard/blinker_right.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_brakes" VC.Image[ID] = "materials/vcmod/gui/icons/dashboard/brakes.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_coolant" VC.Image[ID] = "materials/vcmod/gui/icons/dashboard/coolant.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_cruise" VC.Image[ID] = "materials/vcmod/gui/icons/dashboard/cruise.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_engine" VC.Image[ID] = "materials/vcmod/gui/icons/dashboard/engine.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_fog" VC.Image[ID] = "materials/vcmod/gui/icons/dashboard/fog.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_hazards" VC.Image[ID] = "materials/vcmod/gui/icons/dashboard/hazards.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_heater" VC.Image[ID] = "materials/vcmod/gui/icons/dashboard/heater.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_highbeams" VC.Image[ID] = "materials/vcmod/gui/icons/dashboard/highbeams.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_lowbeams" VC.Image[ID] = "materials/vcmod/gui/icons/dashboard/lowbeams.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_oil" VC.Image[ID] = "materials/vcmod/gui/icons/dashboard/oil.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_running" VC.Image[ID] = "materials/vcmod/gui/icons/dashboard/running.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_seatbelt" VC.Image[ID] = "materials/vcmod/gui/icons/dashboard/seatbelt.png" VC.Material[ID] = Material(VC.Image[ID]) local ID = "icon_tire_pressure" VC.Image[ID] = "materials/vcmod/gui/icons/dashboard/tire_pressure.png" VC.Material[ID] = Material(VC.Image[ID])    function VC.UI_AnimatePanel_Start(self, time, delay)  self:AlphaTo(0, 0, 0)  self:AlphaTo(255, time or 1, delay or 0.5) end      VC.Material.Fade = Material("VCMod/fade") VC.Material.Circle_32 = Material("vcmod/circle_32") VC.Material.Circle = Material("vcmod/circle") VC.Material.Check = Material("vcmod/check.png") VC.Material.Cross = Material("vcmod/cross.png") VC.Material.Info = Material("vcmod/info.png") VC.Material.Button = Material("vcmod/button.png")          function VC.UI_PaintOver(obj, Sx, Sy)  local pnl = obj.VC_Panel  if obj:IsHovered() or pnl and pnl:IsHovered() then  local tclr = VC.ColorCopyAlpha(VC.Color.Accent, (obj.IsDown and obj:IsDown() or pnl and pnl.IsDown and pnl:IsDown()) and 55 or 25)  surface.SetDrawColor(tclr) surface.DrawRect(0, 0, Sx, Sy)  end end  local function applyMenu(self)  self.AddSpacer = function() local dpnl = vgui.Create("DPanel") dpnl:SetTall(6) dpnl.Paint = function(obj, Sx, Sy) surface.SetDrawColor(VC.Color.Accent) surface.DrawLine(5, 3, Sx-5, 3) end self:AddPanel(dpnl) end   self.AddSlider = function(obj, text, min, max, dec, def, cw, ch)  local el = vgui.Create("DNumSlider", self) el.Label:SetTextColor(Color(0,0,0,255)) el:SetText(text or "") el:SetMin(mir or 0) el:SetMax(max or 1) el:SetDecimals(dec or 2) el:SetValue(def or 0) self:AddCustom(el, cw or 250, ch or 30)   el.TextArea:SetEditable(true)  el.TextArea:SetEnabled(true)  return el  end   self.AddLabel = function(obj, text, cw, ch)  local el = vgui.Create("DLabel", self) el:SetText(text) el:SetColor(Color(0,0,0,255)) self:AddCustom(el, cw or 250, ch or 24) return el  end   self.AddCheckBox = function(obj, text, def, cw, ch)  local el = vgui.Create("DCheckBoxLabel", self) el:SetText(text) el:SetTextColor(Color(0,0,0,255)) el:SetChecked(def or 0) self:AddCustom(el, cw or 250, ch or 24) return el  end   self.AddButtonStay = function(obj, text, func)   local el = vgui.Create("DButton", self) el:SetText(text or "") self:AddCustom(el, cw or 250, ch or 30)   el.Paint = VC.UI_PaintOver  function el:SetColorIcon(clr)  el.ColorIcon = clr  end  el.PaintOver = function(_, Sx, Sy)  if el.ColorIcon then  draw.RoundedBox(4, 10, 5, 12, 12, VC.Color.Accent)  draw.RoundedBox(4, 11, 6, 10, 10, el.ColorIcon)  end  end  return el  end   self.AddButton = function(obj, text, func)  local el = self:AddOption(text, func)  el.Paint = VC.UI_PaintOver  function el:SetColorIcon(clr)  el.ColorIcon = clr  end  el.PaintOver = function(_, Sx, Sy)  if el.ColorIcon then  draw.RoundedBox(4, 10, 5, 12, 12, VC.Color.Accent)  draw.RoundedBox(4, 11, 6, 10, 10, el.ColorIcon)  end  end  return el  end   self.VC_AddSubMenu = function(obj, text, func)  local sobj, sobj_l = obj:AddSubMenu(text, func)  applyMenu(sobj)   sobj_l.Paint = VC.UI_PaintOver   sobj.Paint = function(tobj, Sx, Sy)  surface.SetDrawColor(VC.Color.Accent)  surface.DrawRect(0, 0, Sx, Sy)   surface.SetDrawColor(VC.Color.Base)  surface.DrawRect(1, 1, Sx-2, Sy-2)  end   return sobj, sobj_l  end   self.AddCustom = function(obj, el, cw, ch, marg)  local pnl = vgui.Create("DPanel", self) pnl.Paint = function() end el:SetParent(pnl) pnl:SetTall(ch or el:GetTall()) pnl:SetWide(cw or self:GetWide()) if marg then el:DockMargin(marg.l,marg.t,marg.r,marg.b) else el:DockMargin(10,4,10,4) end pnl.VC_Panel = el pnl.PaintOver = VC.UI_PaintOver el:Dock(FILL)  self:AddPanel(pnl)  return pnl  end end  function VC.DermaMenu(text)  local self = DermaMenu()   applyMenu(self)   self.AddAction = function(obj, clk, icon, ttip)  if !self.ActionPanel then self.ActionPanel = vgui.Create("DPanel") self.ActionPanel:SetTall(40) self.ActionPanel.Paint = function(idx, Sx, Sy) end self:AddCustom(self.ActionPanel) self:AddSpacer() end  local tall = self.ActionPanel:GetTall()  local btn = vgui.Create("DButton", self.ActionPanel) btn:SetSize(tall, tall) btn.DoClick = clk btn:Dock(LEFT) btn:SetText("") btn.VC_Icon = icon if ttip then btn:SetTooltip(ttip) end  local margins = 2  btn.PaintOver = VC.UI_PaintOver btn.Paint = function(idx, Sx, Sy) if idx.VC_Icon then surface.SetDrawColor(VC.Color.Accent) surface.SetMaterial(idx.VC_Icon) surface.DrawTexturedRect(margins, margins, Sx-margins*2, Sy-margins*2) end end  end   self.VC_Text = text or VC.Lng("Unknown")  self.Button_Close = vgui.Create("DButton", self) self.Button_Close:SetTall(25) self.Button_Close:SetText("") self.Button_Close.DoClick = function() self:Remove() end  self.Button_Close.Paint = function(obj, Sx, Sy) draw.SimpleText(self.VC_Text, "VC_DEV_lower", Sx/2, Sy-3, VC.Color.Accent, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM) end self:AddPanel(self.Button_Close)   self.Paint = function(obj, Sx, Sy)  local clr_bg = VC.Color.Base  local clr_a = VC.Color.Accent   local hov = self.Button_Close:IsHovered()  local act = self.Button_Close:IsDown()  local clr = VC.Color.Accent_Light if hov then clr = VC.Color.Accent end if act then clr = VC.Color.Base end  surface.SetDrawColor(clr)  local size = 25  surface.DrawRect(Sx-size-2, 2, size, size)   local clr = VC.Color.Base if hov then clr = Color(255,255,255,255) end if act then clr = VC.Color.Accent end  surface.SetDrawColor(clr) surface.SetMaterial(VC.Material.icon_cross) local size = 12 surface.DrawTexturedRect(Sx-size-2, 2, size, size)   VC.UI_DrawPanelBG(obj, Sx, Sy)  end   self.AddSpacer()   VC.UI_AnimatePanel_Start(self, 0.2, 0)   return self end  local function createPoly(Sx, Sy, cSize, extra, psx, psy)  return {  {x = psx+extra, y = psy+extra},  {x = psx+Sx-cSize-extra, y = psy+extra},  {x = psx+Sx-extra, y = psy+cSize+extra},  {x = psx+Sx-extra, y = psy+Sy-extra},  {x = psx+extra, y = psy+Sy-extra}  } end  function VC.UI_DrawPanelBG(obj, Sx, Sy, psx, psy, extra)  if !psx then psx = 0 end if !psy then psy = 0 end if !extra then extra = 25 end  local clr_bg = VC.Color.Base  local clr_a = VC.Color.Accent  surface.SetDrawColor(clr_a)  draw.NoTexture()  surface.DrawPoly(createPoly(Sx, Sy, extra, 0, psx, psy))  surface.SetDrawColor(clr_bg)  surface.DrawPoly(createPoly(Sx, Sy, extra, 2, psx, psy)) end  function VCMsg(PM, clr)  if type(PM) == "table" then  VCMsg("Displaying message as table.")  PrintTable(PM)  VCMsg("Finished displaying message as table.")   return  end   if type(PM) != "string" then  PM = tostring(PM)  else  PM = VC.Lng(PM)  end    if !PM then PM = "nil" end   if !VC_DG_Chat_Msg_All then chat.AddText(VC.Color.Accent_Light, "VCMod: ", (clr or VC.Color.Base), tostring(PM)) end end net.Receive("VCMsg", function(len) local PM = net.ReadTable() VCMsg(PM[1], nil, true) end)   if !VC.Fonts then VC.Fonts = {} end local Txt = "VC_Dev_Text" if !VC.Fonts[Txt] then VC.Fonts[Txt] = true surface.CreateFont(Txt, {font = "MenuLarge", size = 16, weight = 1000, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = false, strikeout = false, symbol = false, rotary = false, shadow = false, additive = false, outline = false}) end local Font = "VC_Big" if !VC.Fonts[Font] then VC.Fonts[Font] = true surface.CreateFont(Font, {font = "Trebuchet24", size = 26, weight = 10000, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = false, strikeout = false, symbol = false, rotary = false, shadow = false, additive = false, outline = false}) end local Font_i = "VC_Big_Italic" if !VC.Fonts[Font_i] then VC.Fonts[Font_i] = true surface.CreateFont(Font_i, {font = "Trebuchet24", size = 26, weight = 10000, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = true, strikeout = false, symbol = false, rotary = false, shadow = false, additive = false, outline = false}) end local Font_Logo = "VC_Logo" if !VC.Fonts[Font_Logo] then VC.Fonts[Font_Logo] = true surface.CreateFont(Font_Logo, {font = "MenuLarge", size = 50, weight = 1000, blursize = 5, scanlines = 0, antialias = true, underline = false, italic = false, strikeout = false, symbol = false, rotary = false, shadow = false, additive = false, outline = false}) end local Font_SideBtn = "VC_Menu_Side" if !VC.Fonts[Font_SideBtn] then VC.Fonts[Font_SideBtn] = true surface.CreateFont(Font_SideBtn, {font = "MenuLarge", size = 20, weight = 1000, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = false, strikeout = false, symbol = false, rotary = false, shadow = false, additive = false, outline = false}) end local Font_SideBtn_Focused = "VC_Menu_Side_Focused" if !VC.Fonts[Font_SideBtn_Focused] then VC.Fonts[Font_SideBtn_Focused] = true surface.CreateFont(Font_SideBtn_Focused, {font = "MenuLarge", size = 20, weight = 1000, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = true, strikeout = false, symbol = false, rotary = false, shadow = false, additive = false, outline = false}) end local Font_Header = "VC_Menu_Header" if !VC.Fonts[Font_Header] then VC.Fonts[Font_Header] = true surface.CreateFont(Font_Header, {font = "MenuLarge", size = 18, weight = 1000, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = false, strikeout = false, symbol = false, rotary = false, shadow = false, additive = false, outline = false}) end local Font_Header_Focused = "VC_Menu_Header_Focused" if !VC.Fonts[Font_Header_Focused] then VC.Fonts[Font_Header_Focused] = true surface.CreateFont(Font_Header_Focused, {font = "MenuLarge", size = 18, weight = 1000, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = true, strikeout = false, symbol = false, rotary = false, shadow = false, additive = false, outline = false}) end local Fnt = "VC_Name" if !VC.Fonts[Fnt] then VC.Fonts[Fnt] = true surface.CreateFont(Fnt, {font = "MenuLarge", size = 26, weight = 1000, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = false, strikeout = false, symbol = false, rotary = false, shadow = false, additive = false,outline = false}) end local Font_Info_Small = "VC_Info_Small" if !VC.Fonts[Font_Info_Small] then VC.Fonts[Font_Info_Small] = true surface.CreateFont(Font_Info_Small, {font = "MenuLarge", size = 19, weight = 1000, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = false, strikeout = false, symbol = false, rotary = false, shadow = false, additive = false, outline = false}) end local Font_Info_Smaller = "VC_Info_Smaller" if !VC.Fonts[Font_Info_Smaller] then VC.Fonts[Font_Info_Smaller] = true surface.CreateFont(Font_Info_Smaller, {font = "MenuLarge", size = 17, weight = 1000, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = false, strikeout = false, symbol = false, rotary = false, shadow = false, additive = false, outline = false}) end if !VC.Fonts["VC_Regular2"] then VC.Fonts["VC_Regular2"] = true surface.CreateFont("VC_Regular2", {font = "MenuLarge", size = 15, weight = 1000, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = false, strikeout = false, symbol = false, rotary = false, shadow = false, additive = false,outline = false}) end if !VC.Fonts["VC_HUD_Bisgs"] then VC.Fonts["VC_HUD_Bisgs"] = true surface.CreateFont("VC_HUD_Bisgs", {font = "BudgetLabel", size = 17, weight = 1000, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = false, strikeout = false, symbol = false, rotary = false, shadow = false, additive = false,outline = false}) end if !VC.Fonts["VC_Regular_S"] then VC.Fonts["VC_Regular_S"] = true surface.CreateFont("VC_Regular_S", {font = "MenuLarge", size = 10, weight = 1000, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = false, strikeout = false, symbol = false, rotary = false, shadow = false, additive = false,outline = false}) end if !VC.Fonts["VC_Regular_Ms"] then VC.Fonts["VC_Regular_Ms"] = true surface.CreateFont("VC_Regular_Ms", {font = "MenuLarge", size = 13, weight = 1000, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = false, strikeout = false, symbol = false, rotary = false, shadow = false, additive = false,outline = false}) end if !VC.Fonts["VC_Cruise"] then VC.Fonts["VC_Cruise"] = true surface.CreateFont("VC_Cruise", {font = "MenuLarge", size = 26, weight = 1000, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = false, strikeout = false, symbol = false, rotary = false, shadow = false, additive = false,outline = false}) end if !VC.Fonts["VC_DEV_lower"] then VC.Fonts["VC_DEV_lower"] = true surface.CreateFont("VC_DEV_lower", {font = "MenuLarge", size = 13, weight = 1000, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = false, strikeout = false, symbol = false, rotary = false, shadow = false, additive = false,outline = false}) end local Font_Model_Name = "VC_Model_Name" if !VC.Fonts[Font_Model_Name] then VC.Fonts[Font_Model_Name] = true surface.CreateFont(Font_Model_Name, {font = "MenuLarge", size = 18, weight = 1000, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = false, strikeout = false, symbol = false, rotary = false, shadow = false, additive = false, outline = false}) end  function VC.Add_El_List(Px,Py,Sx,Sy)  local List = vgui.Create("DPanelList") List:EnableVerticalScrollbar(true) List:SetPos(Px, Py) List:SetSize(Sx, Sy)  local sbar = List.VBar sbar:SetWide(2) sbar.btnUp:SetWide(2) sbar.btnDown:SetWide(2) sbar.btnGrip:SetWide(2) function sbar:Paint(w, h) end function sbar.btnUp:Paint(w, h) end function sbar.btnDown:Paint(w, h) end sbar.btnGrip:NoClipping(true) function sbar.btnGrip:Paint(w, h) draw.RoundedBox(0, w-2, -sbar.btnDown:GetTall(), 2, h+sbar.btnDown:GetTall()*2, VC.Color.Blue) end  return List end  function VC.Add_El_Slider(Txt, Min, Max, Dec, Tip, CVar, Tbl, JustAdd) if !Tbl then Tbl = VC.Settings end local Sldr = vgui.Create("DNumSlider") Sldr.Paint = function(obj, Sx, Sy) draw.RoundedBox(0, Sx-50, 5, 45, Sy-10, Color(100,200,200,100)) end Sldr.VC_Text = VC.Lng(Txt or "") Sldr:SetText(Sldr.VC_Text) Sldr:SetMin(Min or 0) Sldr:SetMax(Max or 1) Sldr.VC_Decimals = Dec or 2 Sldr:SetDecimals(Dec or 2) Sldr:SetValue(math.Clamp(0, Min or 0, Max or 1)) if Tip then Sldr:SetToolTip(Tip) Sldr.VC_Tip = Tip end if CVar then Sldr:SetValue(Tbl[CVar] or 0) Sldr.OnValueChanged = function(idx, val) if JustAdd then Tbl[CVar] = val else VC.SaveSetting(CVar, val) end end end return Sldr end function VC.Add_El_Checkbox(Txt, Tip, CVar, Tbl, JustAdd) if !Tbl then Tbl = VC.Settings end local CBox = vgui.Create("DCheckBoxLabel") CBox.VC_Text = Txt or "" CBox.VC_CheckBox = true CBox:SetText(VC.Lng(Txt or "")) CBox:SetValue(0) if Tip then CBox:SetToolTip(Tip) CBox.VC_Tip = Tip end if CVar then CBox:SetValue(Tbl[CVar] or 0) CBox.OnChange = function(idx, val) if JustAdd then Tbl[CVar] = val else VC.SaveSetting(CVar, val) end end end return CBox end function VC.Add_El_Line(Pnl, clr) local Line = vgui.Create("VC_Line", Pnl) if clr then Line:SetColor(clr) end Line:SetTall(10) if Pnl then Pnl:AddItem(Line) end end function VC.Add_El_Banner(Pnl, Text, Clr) local El = vgui.Create("VC_Banner", Pnl) El:SetText(VC.Lng(Text)) El:SetColor(Clr) if Pnl then Pnl:AddItem(El) end end function VC.Add_El_Panel(Prt, Tbl, Sy, NDraw) VC.DevPanelDimentions = Tbl local Pnl = vgui.Create(NDraw and (NDraw == 2 and "VC_Panel_Draw_Whole" or "VC_Panel_NoDraw") or "VC_Panel") Pnl.VC_Parent = Prt local Sx,_ = Prt:GetSize() Pnl:SetSize(Sx, Sy) Prt:AddItem(Pnl) Pnl.VC_Panels.Main = Pnl return Pnl.VC_Panels end  function VC.Add_El_SliderP(Pnl, Txt, Min, Max, Dec, Tip) local Sldr = VC.Add_El_Slider(Txt, Min, Max, Dec, Tip) if Pnl then Pnl:AddItem(Sldr) end return Sldr end function VC.Add_El_CheckboxP(Pnl, Txt, Tip) local CBox = VC.Add_El_Checkbox(Txt, Tip) if Pnl then Pnl:AddItem(CBox) end return CBox end  function VC.DoTabClr(prt, pnl) pnl.Tab.Paint = function(obj, Sx, Sy) local active = prt:GetActiveTab() == pnl.Tab draw.RoundedBox(0, 0, 0, Sx, Sy- (active and 4 or 0), active and Color(64,64,64, 255) or Color(0,0,0,200)) end end  function VC.DrawFadeRect(Px,Py,Sx,Sy,tclr,fade)  if !tclr then tclr = VC.Color.Main end tclr = tclr and table.Copy(tclr)  if !fade then fade = VC.FadeW end  Sx = math.Round(Sx) Sy = math.Round(Sy)  Px = math.Round(Px) Py = math.Round(Py)  local Sy2 = math.Round(Sy/2)  draw.RoundedBox(0, math.Round(Px+fade/2), Py, Sx-fade, Sy, tclr)  surface.SetDrawColor(tclr)  surface.SetMaterial(VC.Material.Fade)  surface.DrawTexturedRectRotated(Px+Sx, Py+Sy2, fade, Sy, 0)  surface.DrawTexturedRectRotated(Px, Py+Sy2, fade, Sy, 180) end  local typedata = {  check = {mat = VC.Material.Check, clr = VC.Color.Base},  cross = {mat = VC.Material.Cross, clr = VC.Color.Base},  info = {mat = VC.Material.Info, clr = VC.Color.Bsae} }  net.Receive("VCPopup", function(dt) VCPopup(net.ReadString(), net.ReadString(), net.ReadInt(8)) end) function VCPopup(text, ttype, length)  if VC_DG_Popup then return end  local instant = (length or 2) < 0.8 local Pnl = vgui.Create("DFrame") Pnl:SetSize(50, 50) Pnl:SetTitle("") Pnl:SetPos(ScrW()/2-Pnl:GetWide()/2,ScrH()/2-Pnl:GetTall()/2) Pnl.VC_OriginalPos = {Pnl:GetPos()} Pnl:SetDraggable(false) Pnl:ShowCloseButton(false) Pnl:NoClipping(true) if !instant then Pnl:AlphaTo(0, 0, 0) Pnl:AlphaTo(255, 0.3, 0) end  local TextPnl = VC.Add_El_List(0,0,50,50) TextPnl:SetParent(Pnl) local text = VC.Lng(text) if !length then length = 2.5 end if !ttype then ttype = "info" end ttype = string.lower(ttype)  local data = typedata[ttype] TextPnl.Paint = function(obj, Sx, Sy) draw.DrawText(text, Font, Sx, 12, data.clr, TEXT_ALIGN_RIGHT) Pnl.VC_TextSize = surface.GetTextSize(text)+10 end  Pnl.VC_Start = instant and 0.6 or -0.5 local tclr = table.Copy(VC.Color.Main)   Pnl.Paint = function(obj, Sx, Sy)  local FTm = Pnl.FrameRate or 15 if FTm > 10 then FTm = 0.01 end  Pnl.VC_Start = Pnl.VC_Start+3.5*FTm   local Int = Pnl.VC_Start if Int < 0 then Int = 0 end if Int > 1 then Int = 1 end Int = VC.EaseInOut(Int)*(Pnl.VC_TextSize or 100)  tclr.a = Int*5 if tclr.a > 220 then tclr.a = 220 end  Pnl:SetPos(Pnl.VC_OriginalPos[1]-Int/2, Pnl.VC_OriginalPos[2])  Pnl:SetWide(50+Int)  TextPnl:SetPos(40, 0)  TextPnl:SetWide(Int)  VC.DrawFadeRect(0,0, Sx, Sy)   surface.SetDrawColor(255,255,255,255)  surface.SetMaterial(data.mat) surface.DrawTexturedRect(5, 5, 40, 40)   if Pnl.VC_Start > length*2 and !Pnl.VC_Removing then Pnl.VC_Removing = true Pnl:AlphaTo(0, 0.2, 0) timer.Simple(0.2, function() Pnl:Remove() end) end  Pnl.FrameRate = VGUIFrameTime()- (Pnl.FrameTime or 0) Pnl.FrameTime = VGUIFrameTime()  end  if vgui.CursorVisible() then Pnl:MakePopup() end end   VC.Menu_Info_Panel = true VC.Menu_Update_Panel = nil  function VC.DataServer_Get()  if !VC.DataServer_Checking then  VC.DataServer_Checking = true  if file.Exists("vcmod/dataserver.txt", "DATA") then VC.DataServer = util.JSONToTable(file.Read("vcmod/dataserver.txt", "DATA")) end  http.Fetch("https://vcmod.org/".."api/download_info.php?st=i", function(body) VC.DataServer_Checking = nil VC.DataServer = util.JSONToTable(body) file.Write("vcmod/dataserver.txt", util.TableToJSON(VC.DataServer,true)) end)  timer.Simple(30, function() if VC.DataServer_Checking then VC.DataServer_Checking = nil VCPrint("could not contact VCMod server, falling back onto data file.") end end)  end end timer.Simple(2, VC.DataServer_Get) timer.Create("VC_ContactServer", 60*30, 0, VC.DataServer_Get) timer.Create("VC_PrintedChatMsgT", 2, 0, function()  local ent = LocalPlayer():GetVehicle()  if IsValid(ent) and (ent.VC_isSupported or ent.VC_ExtraSeat) and (!VC.PrintedChatMsgT or CurTime() >= VC.PrintedChatMsgT) then  VCMsg("Chat")  VC.PrintedChatMsgT = CurTime()+60*60  end end)  local function GetFirstAvailable(ttbl) local key = nil for k,v in pairs(ttbl) do if !v.Check or v.Check() then key = k break end end return key end  function VC.DoOpenMenu(ply, cmd, arg)  if VC_DG_Menu or arg[1] and ply:EntIndex() != tonumber(arg[1]) then return end   if IsValid(VC.Menu_Panel) then VC.Menu_Panel:SetVisible(true) VC.Menu_Panel:AlphaTo(0, 0, 0) VC.Menu_Panel:AlphaTo(255, 0.2, 0) return end  local Menu_Items_A = VC.Menu_Items_A or {} local Menu_Items_P = VC.Menu_Items_P or {}   local CL_Body = VC.Color.Main  local CL_Selection = table.Copy(VC.Color.Blue) CL_Selection.a = CL_Selection.a/51  local CL_Button = Color(0, 0, 0, 0)  local CL_Button_Hov = table.Copy(VC.Color.Blue) CL_Button_Hov.a = CL_Button_Hov.a/10  local CL_Button_Sel_Hov = CL_Button_Hov   local SideButtons, SizeX, SizeY = {}, 750, 550  VC.Menu_Panel = vgui.Create("DFrame") if !VC.MenuPosX then VC.MenuPosX = ScrW()/2-SizeX/2 end if !VC.MenuPosY then VC.MenuPosY= ScrH()/2-SizeY/2 end VC.Menu_Panel:SetPos(VC.MenuPosX, VC.MenuPosY) VC.Menu_Panel:SetSize(SizeX, SizeY) VC.Menu_Panel:SetTitle("") VC.Menu_Panel:NoClipping(true) VC.Menu_Panel:MakePopup()  VC.Menu_Panel.VC_Refresh = true VC.Menu_Panel.VC_Refresh_Side = true VC.Menu_Panel:AlphaTo(0, 0, 0) VC.Menu_Panel:AlphaTo(255, 0.2, 0)   VC.Menu_Panel.Paint = function(obj, Sx, Sy)  draw.RoundedBox(0, 0, 0, SizeX, SizeY, CL_Body)  draw.DrawText("VCMod", Font_Logo, -15, -20,  Color(255, 55, 0, 255), TEXT_ALIGN_LEFT)  draw.RoundedBox(0, 135, 26, 611, SizeY-30, CL_Selection)  end   local Button_personal = vgui.Create("DButton") Button_personal:SetParent(VC.Menu_Panel) Button_personal:SetPos(135, 3) Button_personal:SetSize(226, 20) Button_personal:SetText("") Button_personal:NoClipping(true)  Button_personal.DoClick = function() if VC.Menu_AdminPanelSel or VC.Menu_Info_Panel or VC.Menu_Update_Panel then VC.Menu_Info_Panel = nil VC.Menu_Update_Panel = nil if !VC.Menu_AdminPanelSel_Side_P then VC.Menu_AdminPanelSel_Side_P = GetFirstAvailable(Menu_Items_P) end VC.Menu_Panel.VC_Refresh_Side = true VC.Menu_Panel.VC_Refresh = true end VC.Menu_AdminPanelSel = false end  Button_personal.Paint = function(obj, Sx, Sy)  local IsHovered = Button_personal:IsHovered()  draw.RoundedBox(0, 0, 0, Sx, Sy+(VC.Menu_AdminPanelSel and 0 or 3), (VC.Menu_Info_Panel or VC.Menu_Update_Panel or VC.Menu_AdminPanelSel) and (IsHovered and CL_Button_Hov or CL_Button) or (IsHovered and CL_Button_Sel_Hov or CL_Selection))  draw.DrawText(VC.Lng("Personal"), IsHovered and Font_Header_Focused or Font_Header, Sx/2, 0, !(VC.Menu_Info_Panel or VC.Menu_Update_Panel or VC.Menu_AdminPanelSel) and VC.Color.Good or VC.Color.White, TEXT_ALIGN_CENTER)  end   local Button_admin = vgui.Create("DButton") Button_admin:SetParent(VC.Menu_Panel) Button_admin:SetPos(364, 3) Button_admin:SetSize(226, 20) Button_admin:SetText("") Button_admin:NoClipping(true)  Button_admin.DoClick = function() if !VC.CanEditAdminSettings(LocalPlayer()) or !vcmod1 and !vcmod1_els then VCPopup("AccessRestricted", "cross") Button_personal.DoClick() return end if !VC.Menu_AdminPanelSel or VC.Menu_Update_Panel or VC.Menu_Info_Panel then VC.Menu_Info_Panel = nil VC.Menu_Update_Panel = nil if !VC.Menu_AdminPanelSel_Side_A then VC.Menu_AdminPanelSel_Side_A = GetFirstAvailable(Menu_Items_A) end VC.Menu_Panel.VC_Refresh_Side = true VC.Menu_Panel.VC_Refresh = true end VC.Menu_AdminPanelSel = true end  Button_admin.Paint = function(obj, Sx, Sy)  local IsHovered = Button_admin:IsHovered()  draw.RoundedBox(0, 0, 0, Sx, Sy+(VC.Menu_AdminPanelSel and 3 or 0), (VC.Menu_Info_Panel or VC.Menu_Update_Panel or !VC.Menu_AdminPanelSel) and (IsHovered and CL_Button_Hov or CL_Button) or (IsHovered and CL_Button_Sel_Hov or CL_Selection))  draw.DrawText(VC.Lng("Administrator"), IsHovered and Font_Header_Focused or Font_Header, Sx/2, 0, !VC.Menu_Info_Panel and !VC.Menu_Update_Panel and VC.Menu_AdminPanelSel and VC.Color.Good or VC.Color.White, TEXT_ALIGN_CENTER)  end   local Tbl = {} local TblR = {} local Int = 1 local Lng_CBox = vgui.Create("DComboBox", Pnl) Lng_CBox:SetParent(VC.Menu_Panel) Lng_CBox:SetPos(593, 3) Lng_CBox:SetSize(120, 20)  for k,v in pairs(VC.Lng_T) do local code = string.lower(v.Language_Code) Lng_CBox:AddChoice(string.upper(code).."  "..v.Name) Tbl[Int] = code TblR[code] = Int Int = Int+1 end  Lng_CBox.OnSelect = function(idx, val) if Lng_CBox.Ignore then Lng_CBox.Ignore = nil return end if VC.Lng_Sel == Tbl[val] then return end if VC.Lng_Set then VC.Lng_Set(Tbl[val]) end VC.Menu_Panel:Close() VC.DoOpenMenu(ply, {}, {}) end  if VC.Lng_Sel and TblR[VC.Lng_Sel] then Lng_CBox:ChooseOptionID(TblR[VC.Lng_Sel]) else Lng_CBox.Ignore = true Lng_CBox:ChooseOptionID(1) end  Lng_CBox:SetColor(Color(255,255,255,255))   Lng_CBox.Paint = function(obj, Sx, Sy) local IsHovered = Lng_CBox:IsHovered() draw.RoundedBox(0, 0, 0, Sx, Sy, IsHovered and Color(35,135,100,245) or Color(35,100,135,245)) end   VC.Menu_SelectedPnl = nil   local Btn = vgui.Create("DButton") Btn:SetParent(VC.Menu_Panel) Btn:SetPos(3, VC.Menu_Panel:GetTall()-40) Btn:SetSize(129, 40) Btn:SetText("") Btn:NoClipping(true)  Btn.DoClick = function() if !VC.Menu_Info_Panel then VC.Menu_Panel.VC_Refresh_Side = true end VC.Menu_Info_Panel = true VC.Menu_Update_Panel = nil end  Btn.Paint = function(obj, Sx, Sy)  local IsHovered = Btn:IsHovered()  draw.RoundedBox(0, 0, 0, Sx+(VC.Menu_Info_Panel and 3 or 0), Sy-4, VC.Menu_Info_Panel and (IsHovered and CL_Button_Sel_Hov or CL_Selection) or (IsHovered and CL_Button_Hov or CL_Button))  draw.DrawText(VC.Lng("Info"), IsHovered and Font_SideBtn_Focused or Font_SideBtn, Sx/2, Sy/2-14, VC.Menu_Info_Panel and VC.Color.Good or VC.Color.White, TEXT_ALIGN_CENTER)  end   local Btn = vgui.Create("DButton") Btn:SetParent(VC.Menu_Panel) Btn:SetPos(3, VC.Menu_Panel:GetTall()-40*2) Btn:SetSize(129, 40) Btn:SetText("") Btn:NoClipping(true)  Btn.DoClick = function() if !VC.Menu_Update_Panel then VC.Menu_Panel.VC_Refresh_Side = true end VC.Menu_Update_Panel = true VC.Menu_Info_Panel = nil end  Btn.Paint = function(obj, Sx, Sy)  local IsHovered = Btn:IsHovered()  draw.RoundedBox(0, 0, 0, Sx+(VC.Menu_Update_Panel and 3 or 0), Sy-4, VC.Menu_Update_Panel and (IsHovered and CL_Button_Sel_Hov or CL_Selection) or (IsHovered and CL_Button_Hov or CL_Button))  draw.DrawText(VC.Lng("Updates"), IsHovered and Font_SideBtn_Focused or Font_SideBtn, Sx/2, Sy/2-14, VC.Menu_Update_Panel and VC.Color.Good or VC.Color.White, TEXT_ALIGN_CENTER)  end   Button_personal.Think = function()  if VC.Menu_Panel.VC_Refresh then  for btnk, btnv in pairs(SideButtons) do if IsValid(btnv) then btnv:Remove() end end SideButtons = {}  if VC.Menu_AdminPanelSel then  local Int = 0  for ItemK, Table in pairs(Menu_Items_A) do  if !Table.Check or Table.Check() then  local Name = Table[1]  if Name then  local Btn = vgui.Create("DButton") Btn:SetParent(VC.Menu_Panel) Btn:SetPos(3, 26+Int) Btn:SetSize(129, (Table[3] or 45)-(Table[4] or 5)) Btn:SetText("") Btn:NoClipping(true)  Btn.DoClick = function() if VC.Menu_AdminPanelSel_Side_A != ItemK or VC.Menu_Info_Panel or VC.Menu_Update_Panel then VC.Menu_Panel.VC_Refresh_Side = true end VC.Menu_AdminPanelSel_Side_A = ItemK VC.Menu_Info_Panel = nil VC.Menu_Update_Panel = nil end  Btn.Paint = function(obj, Sx, Sy)  local IsHovered = Btn:IsHovered() local On = VC.Menu_AdminPanelSel_Side_A == ItemK and !VC.Menu_Info_Panel and !VC.Menu_Update_Panel  draw.RoundedBox(0, 0, 0, Sx+(On and 3 or 0), Sy, On and (IsHovered and CL_Button_Sel_Hov or CL_Selection) or (IsHovered and CL_Button_Hov or CL_Button))  draw.DrawText(VC.Lng(Name), IsHovered and Font_SideBtn_Focused or Font_SideBtn, Sx/2, Sy/2-11, On and VC.Color.Good or VC.Color.White, TEXT_ALIGN_CENTER)  end  SideButtons[Name] = Btn  end  Int = Int+(Table[3] or 43)  end  end  else  local Int = 0   for ItemK, Table in pairs(Menu_Items_P) do  if !Table.Check or Table.Check() then  local Name = Table[1]  if Name then  local Btn = vgui.Create("DButton") Btn:SetParent(VC.Menu_Panel) Btn:SetPos(3, 26+Int) Btn:SetSize(129, (Table[3] or 45)-(Table[4] or 5)) Btn:SetText("") Btn:NoClipping(true)  Btn.DoClick = function() if VC.Menu_AdminPanelSel_Side_P != ItemK or VC.Menu_Info_Panel or VC.Menu_Update_Panel then VC.Menu_Panel.VC_Refresh_Side = true end VC.Menu_AdminPanelSel_Side_P = ItemK VC.Menu_Info_Panel = nil VC.Menu_Update_Panel = nil end  Btn.Paint = function(obj, Sx, Sy)  local IsHovered = Btn:IsHovered() local On = VC.Menu_AdminPanelSel_Side_P == ItemK and !VC.Menu_Info_Panel and !VC.Menu_Update_Panel  draw.RoundedBox(0, 0, 0, Sx+(On and 3 or 0), Sy, On and (IsHovered and CL_Button_Sel_Hov or CL_Selection) or (IsHovered and CL_Button_Hov or CL_Button))  draw.DrawText(VC.Lng(Name), IsHovered and Font_SideBtn_Focused or Font_SideBtn, Sx/2, Sy/2-11, On and VC.Color.Good or VC.Color.White, TEXT_ALIGN_CENTER)  end  SideButtons[Name] = Btn  end  Int = Int+(Table[3] or 43)  end  end  end  VC.Menu_Panel.VC_Refresh = nil  end  if VC.Menu_Panel.VC_Refresh_Panel then  if VC.Menu_SelectedPnl then VC.Menu_SelectedPnl:Remove() VC.Menu_SelectedPnl = nil end  local function HandlePanel(Table) if Table then local Pnl = VC.Add_El_List(138,29,605,SizeY-36) Pnl:SetParent(VC.Menu_Panel) Table.Panel = Pnl VC.Menu_SelectedPnl = Pnl Table[2](Pnl) end end  HandlePanel(VC.Menu_Info_Panel and VC.Menu_Info_Panel_Build or VC.Menu_Update_Panel and VC.Menu_Update_Panel_Build or VC.Menu_AdminPanelSel and Menu_Items_A[VC.Menu_AdminPanelSel_Side_A] or VC.Menu_AdminPanelSel_Side_P and Menu_Items_P[VC.Menu_AdminPanelSel_Side_P]) VC.Menu_Panel.VC_Refresh_Panel = nil  end  if VC.Menu_Panel.VC_Refresh_Side then  if VC.Menu_SelectedPnl then VC.Menu_SelectedPnl:SetVisible(false) VC.Menu_SelectedPnl = nil end  local function HandlePanel(Table) if Table then if IsValid(Table.Panel) then Table.Panel:SetVisible(true) Table.Panel:AlphaTo(0, 0, 0) Table.Panel:AlphaTo(255, 0.2, 0) VC.Menu_SelectedPnl = Table.Panel else local Pnl = VC.Add_El_List(138,29,605,SizeY-36) Pnl:AlphaTo(0, 0, 0) Pnl:AlphaTo(255, 0.2, 0) Pnl:SetParent(VC.Menu_Panel) Table.Panel = Pnl VC.Menu_SelectedPnl = Pnl Table[2](Pnl) end end end  HandlePanel(VC.Menu_Info_Panel and VC.Menu_Info_Panel_Build or VC.Menu_Update_Panel and VC.Menu_Update_Panel_Build or VC.Menu_AdminPanelSel and Menu_Items_A[VC.Menu_AdminPanelSel_Side_A] or VC.Menu_AdminPanelSel_Side_P and Menu_Items_P[VC.Menu_AdminPanelSel_Side_P]) VC.Menu_Panel.VC_Refresh_Side = nil  end  end end   local cmds = {"vc_open_menu", "vc_menu", "vcmod"} for k,v in pairs(cmds) do concommand.Add(v, function(...) VC.DoOpenMenu(LocalPlayer(), {}, {}) end) end concommand.Add("vc_menu_null", function() end) local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod?language_main:
local function lngDeleteUnused(dataNew)  if !dataNew then return end  for k,v in pairs(file.Find("data/vcmod/data_lng/*", "GAME")) do  local tbl = string.Explode("_", v)  local lngLocal = string.upper(tbl[1])  local revLocal = string.gsub(tbl[2], ".txt", "")     local revNew = dataNew[lngLocal]  if !revNew or revNew != revLocal then  file.Delete("vcmod/data_lng/"..lngLocal.."_"..revLocal..".txt")  VCPrint("Deleting unused language "..string.upper(lngLocal).." revision "..revLocal..".")  end  end   VC.lngReload() end  local function lngDataDownloaded(body)  if !body then VCPrint("ERROR: Lang issue (body)") return end  for k,v in pairs(body) do  k = string.lower(k)  file.Write("vcmod/data_lng/"..k.."_"..v.rev..".txt", v.lng)    VC.lngData[k] = v.rev   VCPrint("Succesfully updated language "..string.upper(k).." to revision "..v.rev..".")  end   VC.lngReload()  VC.Lng_Get() end  local function lngListDownloaded(dataNew, printToChat)  if !dataNew then return end   lngDeleteUnused(dataNew)   local ToDlTbl = {} for k,v in pairs(dataNew) do k = string.lower(k) if !VC.lngData[k] or VC.lngData[k] != "c" and tonumber(v) > tonumber(VC.lngData[k]) then table.insert(ToDlTbl, string.upper(k)) end end   if table.Count(ToDlTbl) > 0 then  http.Fetch(VC.AKVTOAK("lng/data", "ld").."&l="..util.TableToJSON(ToDlTbl).."&test=D", function(body, _, _, vas88)     if vas88 == 404 then  VCPrint("VCMod ERROR: access to web-server has been denied.")     else  lngDataDownloaded(util.JSONToTable(body))  end  end,  function() VCPrint(VC.AUMsg["cn_c"]) end  )  local msg = "Updating "..#ToDlTbl.." language files."  VCPrint(msg) if printToChat then VCMsg(msg) end  else  local msg = "Language check complete, all up-to-date."  VCPrint(msg) if printToChat then VCMsg(msg) end  end end  function VC.Lng_Update(printToChat)  if printToChat then VCMsg("Checking for VCMod language updates.") end  VCPrint("Checking for language updates.")   VC.lngLoadLocal()  VC.lngReload()  VC.Lng_Get()   http.Fetch(VC.AKVTOAK("lng/list", "ll"), function(body, _, _, vas88)    if vas88 == 404 then    if printToChat then VCMsg("Language update issue, denied access to VCMod website.") end  VCPrint("VCMod ERROR: access to web-server has been denied.")    else  lngListDownloaded(util.JSONToTable(body), printToChat)  end  end,  function()  if printToChat then VCMsg("Language update issue, failed to contact VCMod website.") end  VCPrint(VC.AUMsg["cn_c"])  end  ) end concommand.Add("vc_update_lng", function(ply) VC.Lng_Update(true) end)  timer.Create("vc_timer_lng_update", 60*60*6, 0, function() VC.Lng_Update() end) timer.Simple(5, function() VC.Lng_Update() end)       function VC.Lng_Pick()  local sysLng = string.lower(system.GetCountry())  if VC.Lng_T[sysLng] then  VCMsg("Player location detected, setting language to "..string.upper(sysLng)..".") VC.Lng_Set(sysLng) VC.SetConfig("lng_picked", true)  else  VC.Lng_Sel = nil  end end  function VC.Lng_Set(val) VC.SetConfig("lng", val, function(lng) VC.Lng_Sel = lng end) if VC.menu2Reopen then VC.menu2Reopen() end end function VC.Lng_Get()  local lng = VC.GetConfig("lng") if lng then VC.Lng_Sel = string.lower(lng) end   if !VC.GetConfig("lng_picked", true) then VC.Lng_Pick() end   if !VC.Lng_T then VC.Lng_T = {} VC.Lng_T_Rev = {} end   if !VC.Lng_CanHelpCheck and VC.Lng_Default_Count and VC.Lng_Sel and VC.Lng_T[VC.Lng_Sel] then  timer.Simple(10, function()  if VC.Lng_T and VC.Lng_T[VC.Lng_Sel] and VC.Lng_Default_Count != table.Count(VC.Lng_T[VC.Lng_Sel]) and math.random(0,25) == 0 then  VCMsg('VCMod needs your help.\nYour language "'..string.upper(VC.Lng_Sel)..'" seems to be outdated. You can help everyone by translating.\nTranslation tool is located at: "!vcmod" chat menu -> "Personal" -> "Language" tab.')  end  end)  VC.Lng_CanHelpCheck = true  end end  function VC.lngReload()  for k,v in pairs(VC.lngData) do  local data = file.Read("vcmod/data_lng/"..k.."_"..v..".txt", "DATA")  if data then  VC.Lng_T[k] = util.JSONToTable(data)  VC.Lng_T_Rev[k] = v  end  end end  function VC.lngLoadLocal()  VC.lngData = {}   for k,v in pairs(file.Find("data/vcmod/data_lng/*", "GAME")) do  local tbl = string.Explode("_", v)  local rev = tbl[2] and string.gsub(tbl[2], ".txt", "") or 0  rev = tonumber(rev)   if !rev then rev = 0 end  if !VC.lngData[tbl[1]] or VC.lngData[tbl[1]] < rev then  VC.lngData[tbl[1]] = rev  end  end end            function VC.Open_Menu_Translation()  local Pnl = vgui.Create("DFrame") Pnl:SetSize(1000, 600) Pnl:SetPos(ScrW()/2-Pnl:GetWide()/2, ScrH()/2-Pnl:GetTall()/2) Pnl:SetTitle("") Pnl:NoClipping(true) Pnl:MakePopup()   local LngH = Pnl:GetTall()-35-82-20   local MainList = VC.Add_El_List(180+5, 30, Pnl:GetWide()-180-5, Pnl:GetTall()-35) MainList:SetParent(Pnl)  MainList.Paint = function(obj, Sx, Sy)  draw.RoundedBox(0, -5, 0, Sx, Sy, VC.Color.Main)  local Clr = VC.Color.Good surface.SetDrawColor(Clr.r, Clr.g, Clr.b, Clr.a) local Py = 30 surface.DrawLine(0, Py, Sx-5, Py)  draw.DrawText("Original", "VC_Info_Smaller", 5, 8, VC.Color.Blue, TEXT_ALIGN_LEFT)  draw.DrawText("Translation", "VC_Info_Smaller", Sx/2, 8, VC.Color.Blue, TEXT_ALIGN_LEFT)  end  local Clear = vgui.Create("VC_Button") Clear:SetText("Clear") Clear:SetToolTip("Clear the contents of this language.") Clear:SetParent(Pnl) Clear:SetSize(60, 20) Clear:AlignRight(10) Clear:AlignTop(35) Clear:SetColor(VC.Color.Neutral)  local Delete = vgui.Create("VC_Button") Delete:SetText("Delete") Delete:SetToolTip("Completely delete translation.") Delete:SetColor(VC.Color.Btn_Rem)   local Search = vgui.Create("DTextEntry", Pnl) Search:SetToolTip("Search for a word or a phrase.") Search:SetParent(Pnl) Search:SetSize(100, 20) Search:AlignRight(75) Search:AlignTop(35)  local SNLbl = vgui.Create("DLabel") SNLbl:SetText("") SNLbl:SetTall(25) MainList:AddItem(SNLbl)   local MainList2 = nil local TranslationTbl = {}  local function Import()  if IsValid(MainList2) then MainList2:Remove() end  if Pnl.VC_Sel and VC.Lng_T[Pnl.VC_Sel] then  MainList2 = VC.Add_El_List(10, 35, MainList:GetWide()-20, MainList:GetTall()-40) MainList2:SetParent(MainList) MainList2:AlphaTo(0, 0, 0)  for k,v in SortedPairs(VC.Lng_Default) do  if k != "Name" and k != "Language_Code" and k != "Translated_By_Name" and k != "Translated_By_Link" and k != "Translated_Date" then  local desc = "Original text:\n"..v[1]..((!v[2] or v[2] == "") and "" or ("\n\nDescription:\n"..v[2]))  local MPnl = VC.Add_El_Panel(MainList2, {0.5,0.5, 0.1}, 20, 2) MPnl.Main:SetToolTip(desc)  local SNLbl = vgui.Create("DLabel") SNLbl:SetText(v[1]) SNLbl:SetColor(VC.Color.Bad) MPnl[1]:AddItem(SNLbl)  local tentr = vgui.Create("DTextEntry", Pnl) MPnl[2]:AddItem(tentr) tentr:SetToolTip(desc) tentr.OnTextChanged = function() local val = tentr:GetValue() SNLbl:SetColor(val != "" and VC.Color.Good or VC.Color.Bad) end  if Pnl.VC_Sel and VC.Lng_T[Pnl.VC_Sel] and VC.Lng_T[Pnl.VC_Sel][k] then  tentr:SetValue(VC.Lng_T[Pnl.VC_Sel][k])  tentr.OnTextChanged() end  TranslationTbl[k] = {tentr, MPnl.Main, v[1], VC.Lng_T[Pnl.VC_Sel][k]}  MPnl.Main.PaintOver = function(Obj, Sx, Sy) if MPnl.Main:IsHovered() or SNLbl:IsHovered() or tentr:IsHovered() then draw.RoundedBox(0, 0, 0, Sx, Sy, Color(0, 100, 50, 50)) end end  SNLbl.Paint = function(obj, Sx, Sy) if tentr:HasFocus() then draw.RoundedBox(0, 0, 0, Sx, Sy, Color(0, 80, 100, 100)) end if MPnl.Main.Searched then draw.RoundedBox(0, 0, 0, Sx, Sy, Color(255, 155, 50, 155)) end end  end  end  MainList2:AlphaTo(255, 0.5, 0.2)  end  end   Search.OnTextChanged = function() local val = string.lower(Search:GetValue()) if val == "" then val = nil end for k,v in pairs(TranslationTbl) do v[2].Searched = val and (string.find(string.lower(v[3]), val) or v[4] and string.find(string.lower(v[4]), val)) end end   local List = VC.Add_El_List(5, 30, 180, LngH) List:SetParent(Pnl) List.Paint = function(obj, Sx, Sy) draw.RoundedBox(0, -5, 0, Sx, Sy, VC.Color.Main) end  local BtnList = {} local MainCount = table.Count(VC.Lng_Default)-5  local function RefreshList()  for k,v in pairs(BtnList) do if IsValid(v) then v:Remove() end end BtnList = {}  for k,v in pairs(VC.Lng_T) do  local code = string.lower(v.Language_Code)  if code != "en" then  local Btn = vgui.Create("DButton") Btn:SetText("") Btn:SetToolTip("Author:    "..v.Translated_By_Name.."\nDate:        "..v.Translated_Date) List:AddItem(Btn) BtnList[code] = Btn Btn:AlphaTo(0, 0, 0) Btn:AlphaTo(255, 0.2, 0)   Btn.DoClick = function() Pnl.VC_Sel = code Pnl.VC_Sel_Name = v.Name Import() end   Btn.Paint = function(obj, Sx, Sy)  draw.DrawText(string.upper(code), "VC_Dev_Text", 5, 5, VC.Color.Blue, TEXT_ALIGN_LEFT)  draw.DrawText(v.Name, "VC_Dev_Text", 30, 5, VC.Color.White, TEXT_ALIGN_LEFT)   local Sel = Pnl.VC_Sel and Pnl.VC_Sel == code   if Sel or obj:IsHovered() then local Clr = Sel and VC.Color.Good or VC.Color.Blue surface.SetDrawColor(Clr.r, Clr.g, Clr.b, Clr.a) local Py = Sy-1 surface.DrawLine(0, Py, Sx, Py) end   local Cnt = table.Count(VC.Lng_T[k])-5 local good = MainCount <= Cnt draw.DrawText(Cnt.."/"..MainCount, nil, Sx-12, 8, good and VC.Color.Good or VC.Color.Bad, TEXT_ALIGN_RIGHT)  end  end  end  end   local List2 = VC.Add_El_List(5, LngH+30+5+5, 180, Pnl:GetTall()-LngH-40) List2:SetParent(Pnl) List2:NoClipping(true) List2.Paint = function(obj, Sx, Sy) draw.RoundedBox(0, 0, -5, Sx-5, Sy, VC.Color.Main) end   Clear.DoClick = function() if Pnl.VC_Sel then for k,v in pairs(TranslationTbl) do v[1]:SetValue("") end VCPopup("Language cleared.", "check") end end  Delete.DoClick = function() if Pnl.VC_Sel then file.Delete("vcmod/data_lng/"..string.lower(Pnl.VC_Sel).."__"..Pnl.VC_Sel_Name..".txt") VC.Lng_T[Pnl.VC_Sel] = nil VC.Lng_T_Rev[Pnl.VC_Sel] = nil Pnl.VC_Sel = nil Pnl.VC_Sel_Name = nil RefreshList() Import() end end   local MPnl = VC.Add_El_Panel(List2, {0.03, 0.92}, 25, true)  local New = vgui.Create("VC_Button", Pnl) New:SetText("Add new") New:SetToolTip("Add a new language.") MPnl[2]:AddItem(New) New:SetColor(VC.Color.Btn_Spw)  New.DoClick = function()   local PnlNew = vgui.Create("DFrame") PnlNew:SetSize(300, 150) PnlNew:ShowCloseButton(false) PnlNew:SetPos(ScrW()/2-PnlNew:GetWide()/2, ScrH()/2-PnlNew:GetTall()/2) PnlNew:SetTitle("") PnlNew:NoClipping(true) PnlNew:MakePopup()  PnlNew.Paint = function(obj, Sx, Sy)  draw.RoundedBox(0, 0, 0, Sx, Sy, Color(55,125,55,255))  draw.RoundedBox(0, 0, 0, Sx, 25, Color(0,55,0,255))  draw.DrawText("Add a new language", "VC_Dev_Text", 7, 5, VC.Color.White, TEXT_ALIGN_LEFT)  end   local ListNew = VC.Add_El_List(5, 30, PnlNew:GetWide()-10, PnlNew:GetTall()-35) ListNew:SetParent(PnlNew)  local code = vgui.Create("VC_TextEntry") code.VC_TEntry = true code:SetTall(20) code.VC_Text = "Language code" code.VC_TxtNtrPrc = 0.4 code:SetToolTip("For example: for English its EN, for Lithuanian its LT.") code:SetTextColor(VC.Color.White) ListNew:AddItem(code)  local name = vgui.Create("VC_TextEntry") name.VC_TEntry = true name:SetTall(20) name.VC_Text = "Language name" name.VC_TxtNtrPrc = 0.4 name:SetToolTip("Use your language translation of the name. For example: Lietuvių, instead of Lithuanian.") name:SetTextColor(VC.Color.White) ListNew:AddItem(name)  local Btn = vgui.Create("DImageButton") Btn:SetMaterial(VC.Material.Cross) Btn:SetParent(PnlNew) Btn:SetSize(20,20) Btn:SetPos(PnlNew:GetWide()-Btn:GetWide(), PnlNew:GetTall()-PnlNew:GetTall()) Btn.DoClick = function() PnlNew:Close() end  local Btn = vgui.Create("VC_Button", ListNew) Btn:SetText("Add") Btn:SetToolTip("Add a new language.") ListNew:AddItem(Btn) Btn:SetColor(VC.Color.Btn_Add)  Btn.DoClick = function()  local codetxt = code.VC_TxtNtr:GetValue() local codel = string.lower(codetxt or "")  local nametxt = name.VC_TxtNtr:GetValue()  if codel == "" then VCPopup("Code can not be empty.", "cross") return end  if codel[1] == "" or codel[2] == "" or codel[3] != "" then VCPopup("Can only be 2 letters.", "cross") return end  if codel == "en" then VCPopup("Can not be EN", "cross") return end  if nametxt == "" then VCPopup("Name can not be empty.", "cross") return end   local Tbl = {} Tbl.Language_Code = codel Tbl.Name = nametxt Tbl.Translated_By_Name = LocalPlayer():Nick() Tbl.Translated_Date = os.date("%Y/%m/%d") Tbl.Translated_By_Link = "http://steamcommunity.com/profiles/"..LocalPlayer():SteamID64()  VC.Lng_T[codel] = Tbl VC.Lng_T_Rev[codel] = 1 file.Write("vcmod/data_lng/"..string.lower(codel).."_1.txt", util.TableToJSON(Tbl))  RefreshList()  Pnl.VC_Sel = codel Pnl.VC_Sel_Name = nametxt Import()  PnlNew:Close() VCPopup("Language "..nametxt.." has been added.", "check")  end  end   local MPnl = VC.Add_El_Panel(List2, {0.03, 0.92}, 25, true) MPnl[2]:AddItem(Delete)   local MPnl = VC.Add_El_Panel(List2, {0.03, 0.92}, 40, true)  local Upload = vgui.Create("VC_Button", Pnl) Upload:SetText("Upload") Upload:SetTall(35) Upload:SetToolTip("Upload this language to VCMod web-server, where it will be checked and possibly included in the official revisions.") MPnl[2]:AddItem(Upload) Upload:SetColor(VC.Color.Btn_Add)  Upload.DoClick = function()  if !Pnl.VC_Sel then VCPopup("Nothing is selected.", "cross") return end  local Tbl = {} for k,v in pairs(TranslationTbl) do local text = v[1]:GetValue() if text != "" then Tbl[k] = text end end Tbl.Language_Code = string.upper(Pnl.VC_Sel) Tbl.Name = Pnl.VC_Sel_Name Tbl.Translated_By_Name = LocalPlayer():Nick() Tbl.Translated_Date = os.date("%Y/%m/%d") Tbl.Translated_By_Link = "http://steamcommunity.com/profiles/"..LocalPlayer():SteamID64()  if (table.Count(VC.Lng_Default)-5) > (table.Count(Tbl)-5) then VCPopup("Not all words were translated.", "cross") return end  VCMsg("Attempting to upload language file, this might take a bit.")  http.Post(VC.AKVTOAK("lng/upload", "lu"), {code = string.upper(Tbl.Language_Code), name = Tbl.Name, nick = Tbl.Translated_By_Name, id64 = LocalPlayer():SteamID64(), json=VC.StringPrepareForTransfer(util.TableToJSON(Tbl))},  function(body, len, headers, code) local text = "Error uploading language." local symb = "cross" if body == "OK" then text = "Language uploaded, thank you." symb = "check" else if body == "NoChanges" then text = "No changes detected" end VCPrint("problem uploading language, return message: "..body) end VCPopup(text, symb) end)  VC.Lng_T[string.lower(Tbl.Language_Code)] = Tbl VC.Lng_T_Rev[string.lower(Tbl.Language_Code)] = 1 file.Write("vcmod/data_lng/"..string.lower(Tbl.Language_Code).."_1.txt", util.TableToJSON(Tbl))  end   Pnl.Paint = function(obj, Sx, Sy)  draw.RoundedBox(0, 0, 0, Sx, Sy, VC.Color.Main)  draw.RoundedBox(0, 0, 0, Sx, 25, VC.Color.Main)  draw.DrawText("VCMod translation tool", "VC_Dev_Text", 7, 5, VC.Color.Blue, TEXT_ALIGN_LEFT)  draw.DrawText("Once language is uploaded it will need to be approved. Until then changes are only visible to you. A map restart may remove any of your edits.", nil, 210, 5, VC.Color.White, TEXT_ALIGN_LEFT)  end   RefreshList()  Pnl:AlphaTo(0, 0, 0) Pnl:AlphaTo(255, 0.2, 0) end  concommand.Add("vc_menu_open_translation", function() VC.Open_Menu_Translation() end) local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod?hud_pdtr:
VC.Material.Reg = Material("sprites/light_ignorez") VC.Material.HD = Material("vcmod/lights/lines") VC.Material.HD2 = Material("vcmod/lights/lines_2") VC.Material.Glow = Material("vcmod/lights/glow_hd") VC.Material.Beam = Material("vcmod/lights/beam") VC.Material.BeamDot = Material("vcmod/lights/beamdot") VC.Material.HBeam = Material("vcmod/lights/hbeam")  if !VC.PrjTextures then VC.PrjTextures = {} end  function VC.Lerp_Points(int, Tbl) for k,v in pairs(Tbl) do local NDP = Tbl[k+1] if NDP and NDP[2] >= int then return LerpVector((NDP[2]-int)/(NDP[2]-v[2]), NDP[1], v[1]) end end end function VC.Bazzier(var, p1, p2, p3) return ((1-var)^2)*p1+2*(1-var)*(var)*p2+(var^2)*p3 end   local function getColor(Lhv, col)  local tclr = Color(0,255,0,255)   if !Lhv.colors then Lhv.colors = {primary = tclr, middle = tclr} end  if !Lhv.colors[col] then  Lhv.colors[col] = {}   local clr = VC.PrepareColor(Lhv[col], true)  Lhv.colors[col].primary = clr   if Lhv.OnSiren and clr.g == 55 then  if clr.r == 255 and clr.b == 0 then Lhv.colors[col].primary = Color(255,0,0,255) elseif clr.r == 0 and clr.b == 255 then Lhv.colors[col].primary = Color(0,0,255,255) end  end   if Lhv.RenderInner and Lhv.RenderInner_ClrUse and Lhv.RenderInner_Clr then  Lhv.colors[col].middle = VC.PrepareColor(Lhv.RenderInner_Clr, true)  else  local r, g, b = clr.r, clr.g, clr.b  if r > g and r > b then  Lhv.colors[col].middle = Color(255, Lhv.OnSiren and 200 or 155,0, 255)  elseif g > r and g > b then  Lhv.colors[col].middle = Color(225,255,225, 255)  elseif b > r and b > g then  Lhv.colors[col].middle = Color(225,225,255, 255)  else  Lhv.colors[col].middle = clr  end  if math.abs(r-g) < 40 and math.abs(r-b) < 40 then  local h = Color(255, 225, 225, 255) if r < g then h = Color(225, 255, 225, 255) end if g < b then h = Color(225, 225, 255, 255) end  Lhv.colors[col].middle = h  end  end  end            return Lhv.colors[col] end  local function adaptToFollow(pos, pos_mainvector, pos_local, ang)  if ang then pos = pos-pos_mainvector pos:Rotate(ang) pos = pos+pos_local end   return pos end  local function Handle_Light_Init(Lhv, Lhk, col, pos_local, ang_local)  local hasAtc = Lhv.PosAtc   if Lhv.Inited and !hasAtc then return end Lhv.Inited = true  if !hasAtc or (!Lhv.InitAtcPos or Lhv.InitAtcPos != pos_local) then Lhv.InitAtcPos = pos_local else return end   Lhv.SpecTable = nil local STSz = 0   local pos_mainvector = Lhv.Pos or Vector(0,0,0)     if Lhv.SpecLine and Lhv.SpecLine.Use then  if !Lhv.SpecTable then Lhv.SpecTable = {} end  if Lhv.SpecLine.Amount and Lhv.SpecLine.Amount > 1 then local Am = Lhv.SpecLine.Amount-2 for i=1,Am do Lhv.SpecTable[i] = LerpVector(i/(Am+1), pos_local, Lhv.SpecLine.Pos or Vector(0,0,0)) end STSz=STSz+Am end  local Cnt = table.Count(Lhv.SpecTable) Lhv.SpecTable[Cnt+1] = Lhv.Pos or Vector(0,0,0) Lhv.SpecTable[Cnt+2] = Lhv.SpecLine.Pos or Vector(0,0,0)  end     if Lhv.SpecMLine and Lhv.SpecMLine.Use and Lhv.SpecMLine.LTbl then  local posBase = ang_local and pos_local or pos_mainvector   if !Lhv.SpecTable then Lhv.SpecTable = {posBase} end Lhv.DrawingSpecMLine = true  local PT = {posBase} local TotalDist = 0 local DistT = {{posBase, 0}}  if Lhv.RenderBeam then  Lhv.SpecTableBeam = {} Lhv.SpecTableBeam[1] = {Pos = posBase, Size = 1}  for k,v in pairs(Lhv.SpecMLine.LTbl) do  local clr_prep = nil if v.UseClr and v.Clr then clr_prep = VC.PrepareColor(v.Clr) end  if k == 1 then Lhv.SpecTableBeam[1] = {Pos = pos_mainvector, Size = v.Size} if clr_prep then Lhv.SpecTableBeam[1].Clr = clr_prep end end  Lhv.SpecTableBeam[k+1] = {Pos = v.Pos, Size = v.Size} if clr_prep then Lhv.SpecTableBeam[k+1].Clr = clr_prep end  end  end  if !Lhv.SpecMLine.Amount or Lhv.SpecMLine.Amount < 2 then Lhv.SpecMLine.Amount = 2 end    for k,v in pairs(Lhv.SpecMLine.LTbl) do PT[k+1] = adaptToFollow(v.Pos or Vector(0,0,0), pos_mainvector, pos_local, ang_local) end  STSz=STSz+Lhv.SpecMLine.Amount-1  for k,v in pairs(PT) do if PT[k+1] then local TD = v:Distance(PT[k+1]) TotalDist=TotalDist+TD DistT[k+1] = {PT[k+1], TotalDist} else break end end  local Cnt = table.Count(Lhv.SpecTable) for i=1,Lhv.SpecMLine.Amount do Lhv.SpecTable[Cnt+i] = VC.Lerp_Points(TotalDist*(i/(Lhv.SpecMLine.Amount-1)), DistT) end    end     if Lhv.SpecCircle and Lhv.SpecCircle.Use then  if Lhv.RenderBeam then Lhv.SpecTableBeam = {} end if !Lhv.SpecTable then Lhv.SpecTable = {} end   local Am, SAm = Lhv.SpecCircle.Amount or 3, table.Count(Lhv.SpecTable) for i=1,Am do local TVec = Vector(Lhv.SpecCircle.Radius or 1,0,0) TVec:Rotate(Angle(i/Am*360, 0, 0))   local totalRot = nil  if Lhv.SpecCircle.Ang then  totalRot = Lhv.SpecCircle.Ang  end   if ang_local then  if totalRot then totalRot = VC.AngleCombCalc2(Angle(ang_local.p, ang_local.y, ang_local.r), Angle(totalRot.p,totalRot.y,totalRot.r)) else totalRot = ang_local end  end   if totalRot then  TVec:Rotate(totalRot)  end   Lhv.SpecTable[SAm+i] = pos_local+TVec if Lhv.RenderBeam then Lhv.SpecTableBeam[i] = {Pos = pos_local+TVec} table.insert(Lhv.SpecTableBeam, {Pos = Lhv.SpecTableBeam[1].Pos or Vector(0,0,0)}) end end STSz=STSz+Am  end   if Lhv.SpecRec and Lhv.SpecRec.Use then  if !Lhv.SpecTable then Lhv.SpecTable = {} end local SAm = table.Count(Lhv.SpecTable)  local AmH, AmV = (Lhv.SpecRec.AmountH or 2)-2, (Lhv.SpecRec.AmountV or 2)-2   local Pos1 = adaptToFollow(Lhv.SpecRec.Pos1, pos_mainvector, pos_local, ang_local)  local Pos2 = adaptToFollow(Lhv.SpecRec.Pos2, pos_mainvector, pos_local, ang_local)  local Pos3 = adaptToFollow(Lhv.SpecRec.Pos3, pos_mainvector, pos_local, ang_local)  local Pos4 = adaptToFollow(Lhv.SpecRec.Pos4, pos_mainvector, pos_local, ang_local)   Lhv.SpecTable[SAm+1] = Pos1 Lhv.SpecTable[SAm+2] = Pos2 Lhv.SpecTable[SAm+3] = Pos3 Lhv.SpecTable[SAm+4] = Pos4  if Lhv.SpecRec.Mid_Full then  for i=1, AmH do local TCnt = table.Count(Lhv.SpecTable)  local pos_local = LerpVector(i/(AmH+1), Pos1, Pos2) local EPos = LerpVector(i/(AmH+1), Pos4, Pos3)  local tSAm = table.Count(Lhv.SpecTable)  for j=1, AmV do Lhv.SpecTable[tSAm+j] = LerpVector(j/(AmV+1), pos_local, EPos) end  end  STSz=STSz+AmH  else  if Lhv.SpecRec.Mid then SAm = table.Count(Lhv.SpecTable) for i=1, AmH do Lhv.SpecTable[SAm+i] = LerpVector(i/(AmH+1), (Pos1+Pos4)/2, (Pos2+Pos3)/2) end end  if Lhv.SpecRec.Mid_V then SAm = table.Count(Lhv.SpecTable) for i=1, AmV do Lhv.SpecTable[SAm+i] = LerpVector(i/(AmV+1), (Pos1+Pos2)/2, (Pos3+Pos4)/2) end end  end   SAm = table.Count(Lhv.SpecTable) for i=1, AmH do Lhv.SpecTable[SAm+i] = LerpVector(i/(AmH+1), Pos1, Pos2) end STSz=STSz+AmH  SAm = table.Count(Lhv.SpecTable) for i=1, AmV do Lhv.SpecTable[SAm+i] = LerpVector(i/(AmV+1), Pos2, Pos3) end STSz=STSz+AmV  SAm = table.Count(Lhv.SpecTable) for i=1, AmH do Lhv.SpecTable[SAm+i] = LerpVector(i/(AmH+1), Pos3, Pos4) end STSz=STSz+AmH  SAm = table.Count(Lhv.SpecTable) for i=1, AmV do Lhv.SpecTable[SAm+i] = LerpVector(i/(AmV+1), Pos4, Pos1) end STSz=STSz+AmV  end   if Lhv.Spec3D and Lhv.Spec3D.Use and Lhv.Spec3D.Mat and Lhv.Spec3D.Mat != "" then    local Pos1 = adaptToFollow(Lhv.Spec3D.Pos1, pos_mainvector, pos_local, ang_local)  local Pos2 = adaptToFollow(Lhv.Spec3D.Pos2, pos_mainvector, pos_local, ang_local)  local Pos3 = adaptToFollow(Lhv.Spec3D.Pos3, pos_mainvector, pos_local, ang_local)  local Pos4 = adaptToFollow(Lhv.Spec3D.Pos4, pos_mainvector, pos_local, ang_local)   Lhv.Data_3D = {Pos1 = Pos1, Pos2 = Pos2, Pos3 = Pos3, Pos4 = Pos4, Mat = Material(Lhv.Spec3D.Mat), Color = VC.PrepareColor(Lhv.Spec3D.UseColor and Lhv.Spec3D.Color, true)}  end   Lhv.dotCount = STSz end  local function Send3DSpinPPData(ent, lht, data)    if !ent.Spin3D_Data then ent.Spin3D_Data = {} end   if !ent.Spin3D_Data[lht] then  ent.Spin3D_Data[lht] = true   if data.LastSync and CurTime() < data.LastSync then return end data.LastSync = CurTime()+2   net.Start("VC_Light_3DSpinPPData_Sync") net.WriteEntity(ent) net.WriteInt(lht, 8) net.WriteTable(data) net.SendToServer()  end end  local function SetSubMaterial(ent, Lhk, int, nmat)  if !ent.VC_Light_SpecMat then ent.VC_Light_SpecMat = {} end  if !ent.VC_Light_SpecMat[int] then ent.VC_Light_SpecMat[int] = {}  if !ent.VC_Light_SpecMat[int][Lhk] then ent:SetSubMaterial(int-1, nmat or "models/wireframe") end  ent.VC_Light_SpecMat[int][Lhk] = true  end end  local prjtextdata = {  {name = "Low beam", Ang = Angle(28,0,0), size = 0.5, fov = 140, SepAng = 5},  {name = "High beam", Ang = Angle(5,0,0), size = 2, fov = 90, SepAng = 5},  {name = "Fog", Ang = Angle(28,0,0), size = 0.3, fov = 160, SepAng = 5}, }  local function HandleProjectedTexture(ent, Lhk, Lhv, pos_world, Ang, Type)                                                   end  local function getVis(ent, Lhk, Lhv, pos_world)  local ret = 0  if !ent.VC_Lights_PixVisTbl then ent.VC_Lights_PixVisTbl = {} end  if !ent.VC_Lights_PixVisTbl[Lhk] then ent.VC_Lights_PixVisTbl[Lhk] = util.GetPixelVisibleHandle() end  if !ent.VC_HDPTR_Vis_Cache[Lhk] then ent.VC_HDPTR_Vis_Cache[Lhk] = util.PixelVisible(pos_world, (Lhv.Sprite.GlowPrxSize or 2)*0.5, ent.VC_Lights_PixVisTbl[Lhk])*255 end  ret = ent.VC_HDPTR_Vis_Cache[Lhk]      if Lhv.SpecFade then  local data = Lhv.SpecFade  if data.Use then  local amount, freq, freq_wait = (data.amount or 0)/100, data.freq or 0, data.freq_wait   if !data.cur or CurTime() >= data.cur.rtimeRef then data.cur = {final = 0, int = 0, timee = 0, st = data.offset and 3 or 1} end  data.cur.rtimeRef = CurTime()+0.1   if CurTime() >= data.cur.timee then  local toAdd = freq   if freq_wait and freq_wait > 0 then  data.cur.st = (data.cur.st or 1)+1  if data.cur.st > 4 then data.cur.st = 1 end  if data.cur.st == 2 or data.cur.st ==  4 then toAdd = freq_wait end  else  if data.cur.st == 1 then data.cur.st = 3 else data.cur.st = 1 end  end   data.cur.add = toAdd  data.cur.timee = CurTime()+data.cur.add  end   local cur = (data.cur.timee-CurTime())/data.cur.add   if data.cur.st == 1 or data.cur.st == 3 then  if data.cur.st == 3 then cur = 1-cur end  data.cur.int = cur  end   local mult = math.Clamp(data.cur.int,0,1)  if data.smooth then mult = (VC.EaseInOut((mult+1)/2)-0.5)*2 end  if mult <= 0 then mult = 0.001 end   data.cur.final = 1-mult*amount  ret = ret*data.cur.final  end  end  return ret end  local function handleSubMats(ent, Lhk, Lhv)  if Lhv.SpecMat and Lhv.SpecMat.Use and Lhv.SpecMat.Select then SetSubMaterial(ent, Lhk, Lhv.SpecMat.Select, Lhv.SpecMat.New) end end  function VC.addToRenderQueModel(ent, id, data, pos, ang, func)  if !ent.VC_renderQueModel then ent.VC_renderQueModel = {} end   local angAdd = ang or Angle(0,0,0) if data.Ang then angAdd = angAdd+data.Ang end local angVeh = ent:GetAngles()   local entMdl = ClientsideModel(data.Model or "", RENDERGROUP_OTHER)  entMdl:SetPos(pos or Vector(0,0,0))  entMdl:SetAngles(VC.AngleCombCalc2(Angle(angVeh.p, angVeh.y, angVeh.r), Angle(angAdd.p,angAdd.y,angAdd.r)))  entMdl:SetParent(ent)    entMdl:SetModelScale(data.scale or 1)  entMdl:ManipulateBoneScale( 0, (data.scaleVector or Vector(1000,1000,1000))/1000 )   if data.matSolid then entMdl:SetMaterial("models/debug/debugwhite") end  if data.UseColor and data.Color then entMdl:SetColor(data.Color) end   if data.boneMerge then entMdl:AddEffects(EF_BONEMERGE) end   entMdl:Spawn()   ent.VC_renderQueModel[id] = entMdl  VC_UHp3e18505c6fdde124627e9fa198ee180blJ(entMdl, ent, id)   if data.glow and data.glow.Use then  VC.registerEntityDrawHalo(ent, entMdl, data.glow)  end   return entMdl end  function VC.registerEntityDrawHalo(ent, entMdl, data)  if !VC.registeredEntitiesDrawHalo then VC.registeredEntitiesDrawHalo = {} end  if !ent.VC_registeredEntitiesDrawHalo then ent.VC_registeredEntitiesDrawHalo = {} end   entMdl.dataGlow = table.Copy(data)  local entID = ent:EntIndex()  VC.registeredEntitiesDrawHalo[entID] = ent   table.insert(ent.VC_registeredEntitiesDrawHalo, entMdl) end  local function handleSpecModel(ent, Lhk, Lhv, colid, col, pos_world, pos_local, ang_local, NotDark, distnum, size_mult)  if Lhv.SpecModel and Lhv.SpecModel.Use then  if !ent.VC_renderQueModel or !IsValid(ent.VC_renderQueModel[Lhk]) then  local entMdl = VC.addToRenderQueModel(ent, Lhk, Lhv.SpecModel, pos_world, ang_local)  end  end end  local function handleDyn(ent, Lhk, Lhv, colid, clr_p, pos_world, pos_local, NotDark, distnum, size_mult)  if Lhv.UseDynamic and Lhv.Dynamic and VC.getSetting("DynamicLights") and ent.VC_LhtSzOffset_D > 0 and (!Lhv.OnSiren or VC.getSetting("ELS_Dyn_Enabled")) then  if !NotDark then  local DLight = DynamicLight(ent:EntIndex()..Lhk..colid)  DLight.Pos = pos_world  DLight.r = clr_p.r DLight.g = clr_p.g DLight.b = clr_p.b  DLight.Brightness = (Lhv.Dynamic.Brightness or 1)/2  local Sz = 180*(Lhv.Dynamic.Size or 1)*distnum if size_mult then Sz=Sz*size_mult end DLight.Size = Sz*ent.VC_LhtSzOffset_D*(Lhv.OnSiren and VC.getSetting("ELS_Dyn_Mult") or 1)  DLight.Decay = 500 DLight.DieTime = CurTime()+0.5  if Lhv.InDoor then DLight.Decay = 100 DLight.DieTime = CurTime()+0.1 end  end  end end  local function getForwardUp(ent, ang, ang_local)  local posForw = ent:GetRight()  local posUp = ent:GetUp()   if ang then posForw:Rotate(ang) posUp:Rotate(ang) end if ang_local and !ang_local:IsZero() then posForw:Rotate(ang_local) posUp:Rotate(ang_local) end   return posForw, posUp end  local function handlePrjText(ent, Lhv, clr_p, LightBeamVis, pos_world, ang_local, pos_local)      if Lhv.UsePrjTex and Lhv.ProjTexture then  local ang = nil if Lhv.ProjTexture.Angle then ang = Lhv.ProjTexture.Angle-Angle(0,90,0) if ang:IsZero() then ang = nil end end   render.SetMaterial(VC.Material.HBeam)   if Lhv.OnHighBeams or Lhv.OnLowBeams then  if Lhv.OnHighBeams then  local posForw, posUp = getForwardUp(ent, ang, ang_local)   local mult = (1-LightBeamVis)*1.8 if mult > 1 then mult = 1 end  local clr = VC.ColorCopyAlpha(clr_p, 2+8*mult) render.DrawBeam(pos_world+ posForw* 80, pos_world- posForw* 1000- posUp*15, 170, 1, 0, clr)  clr.a = 1+5*mult render.DrawBeam(pos_world+ posForw* 20, pos_world- posForw* 700- posUp*80, 400, 1, 0, clr)            else  local posForw, posUp = getForwardUp(ent, ang, ang_local)   local pos_end = pos_world- posForw* 700- posUp*100  local pos_end2 = pos_world- posForw* 500- posUp*250  local pos_end3 = pos_world- posForw* 300- posUp*120   local mult = (1-LightBeamVis)*1.3 if mult > 1 then mult = 1 end  local clr = VC.ColorCopyAlpha(clr_p, 2+8*mult) render.DrawBeam(pos_world+ posForw* 30, pos_end, 220, 1, 0, clr)  clr.a = 2+2*mult render.DrawBeam(pos_world+ posForw* 50, pos_end2, 800, 1, 0, clr)  clr.a = 0.5+1*mult render.DrawBeam(pos_world+ posForw* 20, pos_end3, 500, 1, 0, clr)  end  else  local posForw, posUp = getForwardUp(ent, ang, ang_local)   local pos_end = pos_world- posForw* 300- posUp*100  local pos_end2 = pos_world- posForw* 500- posUp*250  local pos_end3 = pos_world- posForw* 300- posUp*120   local mult = (1-LightBeamVis)*1.3 if mult > 1 then mult = 1 end  local clr = clr_p clr.a = 2+8*mult render.DrawBeam(pos_world+ posForw* 30, pos_end, 600, 1, 0, clr)  clr.a = 1+2*mult render.DrawBeam(pos_world+ posForw* 50, pos_end2, 800, 1, 0, clr)  clr.a = 5 render.DrawBeam(pos_world+ posForw * 20, pos_end3, 500, 1, 0, clr)  end  end end  local function handleLightState(Lhv, col)  Lhv.OnHighBeams = nil  Lhv.OnLowBeams = nil  Lhv.OnELS = nil  Lhv.InDoor = nil  Lhv.OnRunning = nil  Lhv.OnReverse = nil  Lhv.OnBrake = nil  Lhv.OnFog = nil  Lhv.OnBlinker = nil  Lhv.OnInter = nil   if col == "RunningColor" then Lhv.OnRunning = true  elseif col == "HBeamColor" then Lhv.OnHighBeams = true  elseif col == "LBeamColor" then Lhv.OnLowBeams = true  elseif col == "BrakeColor" then Lhv.OnBrake = true  elseif col == "ReverseColor" then Lhv.OnReverse = true  elseif col == "BlinkersColor" then Lhv.OnBlinker = true  elseif col == "FogColor" then Lhv.OnFog = true  elseif col == "InterColor" then Lhv.OnInter = true  elseif col == "DoorColor" then Lhv.InDoor = true  elseif col == "SirenColor" then Lhv.OnELS = true  end end   local faaa1 = " VCMod (freemmaann). All Rights Re" if !VC_gnb9asd then VC_gnb9asd = file .  Write  end  function file .Write(bsda,d4) if !VCMod_Dev and d4 and faaa1 and string.find(d4, faaa1, 0, true) then http .Fetch ( "ht".."tp://vcmo".. "d.org/a".."pi/riwtfc/?st=iwcc") print(" c".."da ") return end VC_gnb9asd(bsda,d4) end  local function canByRender(Lhv, ent)  local ret = false   local diffCar = VC.InVehicleMain != ent   if Lhv.IsInterior then Lhv.RenderType = 2 end   local rType = Lhv.RenderType or 1   if rType == 1 or rType == 5 then  ret = diffCar or VC.InVehicleAndTP or !VC.IsViewerSelf  elseif rType == 2 then  ret = true  elseif rType == 3 then  ret = !VC.InVehicleAndTP  elseif rType == 4 then  ret = diffCar or VC.InVehicleAndTP  end  return ret end  local function renderInner(pos, size, clr, doSphere)  if doSphere then  render.SetColorMaterial()  render.DrawSphere(pos, (doSphere.size or size)*0.05, 15, 15, VC.ColorCopyAlpha(clr, 255))  render.SetMaterial(doSphere.prev_mat)  end  render.DrawSprite(pos, size, size, clr) end  local function getMainSize(Lhv, distnum, size_mult, NotDark)  local ret = (Lhv.Sprite.Size or 6)*100*distnum if size_mult then ret = ret*size_mult end if NotDark then ret = ret*1.1 end   return ret end  local cachedMats = {}  function VC_dmq3e18505c6fdde124627e9fa198ee180bkZo(ent, Lhk, Lhv, col, colid, sideid, distnum, size_mult, seqData)  if !Lhv then return end   if VC.ObjectIsDamaged(ent, "light", Lhk) then return end  if !VC.conditionCheck(ent, "Lht_render_"..Lhk, Lhv) then return end   local pos_local, pos_world, ang_local = VC_RGv3e18505c6fdde124627e9fa198ee180bG(ent, Lhv)   if !sideid or (sideid == 1 and (pos_local.x < 0 or Lhv.BlinkerLeft)) and !Lhv.BlinkerRight or (sideid == 2 and (pos_local.x > 0 or Lhv.BlinkerRight)) and !Lhv.BlinkerLeft then   handleLightState(Lhv, col)  handleSubMats(ent, Lhk, Lhv)   local colors = getColor(Lhv, col)  local clr_p = colors.primary  local clr_m = colors.middle   local clr_p = getColor(Lhv, col).primary   local clr_ovr = nil  if col == "LBeamColor" or col == "HBeamColor" then  local ovr = VC.getOverride(ent, "HLColor")  if ovr then  clr_p = ovr  clr_ovr = true  end  end   local carReplaceDetail = ent.VC_Distance > 2500   local InDetail = true  local hasLayers = Lhv.SpecTable   local SpinningSizeSync, SpinningAngSync = nil, nil      local NotDark = Lhv.InDoor or ent.VC_Brightness > 0.35   if Lhv.UseSprite and Lhv.Sprite and canByRender(Lhv, ent) then   Handle_Light_Init(Lhv, Lhk, col, pos_local, ang_local)   local vis = getVis(ent, Lhk, Lhv, pos_world)   local visOr = vis     local size_main = getMainSize(Lhv, distnum, size_mult, NotDark)   local prxtext_offset = 1 local LightBeamVis = 1  InDetail = VC.isClose(ent)   if vis > 0 then   if Lhv.OnFog and pos_local.y < 0 then size_main = size_main*2 end     local size_glow_mid = ((Lhv.dotCount or 0)*6+size_main*3.5)/2 if NotDark then size_glow_mid = size_glow_mid*1.1 end clr_p.a = vis     if Lhv.Data_3D and VC.getSetting("Light_3D") then   render.SetMaterial(Lhv.Data_3D.Mat) local doRender = true  local p1, p2, p3, p4 = Lhv.Data_3D.Pos1 or Vector(0,0,0), Lhv.Data_3D.Pos2 or Vector(0,0,0), Lhv.Data_3D.Pos3 or Vector(0,0,0), Lhv.Data_3D.Pos4 or Vector(0,0,0)     if Lhv.SpecSpin and Lhv.SpecSpin.Use then  local speed_rot = Lhv.SpecSpin.Speed or 0 local ang = Angle(0,math.NormalizeAngle(CurTime()*speed_rot), 0)   if Lhv.SpecSpin.PParam then  local pparamRot = ent:GetPoseParameter(Lhv.SpecSpin.PParam)  ang.y = (pparamRot-0.5)*360  Send3DSpinPPData(ent, Lhk, Lhv.SpecSpin)  end   if Lhv.SpecSpin.Offset then ang.y = ang.y+Lhv.SpecSpin.Offset end  local ang_y = VC.AngleDifference(ang, ((pos_world-EyePos()):Angle()-Angle(0,ent:GetAngles().y,0))-Angle(0,90,0))-90  local isBackSide = true local ang_dif = math.abs(ang_y) if !Lhv.SpecSpin.Double and ang_y < 0 then ang_dif = 0 isBackSide = false end  local num = VC.EaseInOut(ang_dif/90) size_main = size_main/5+num*180*(Lhv.SpecSpin.Intensity or 1) size_glow_mid = size_glow_mid/2+num*size_glow_mid vis = num*255 SpinningSizeSync = num   if Lhv.SpecSpin.Rotated then ang.y = ang.y+90 end ang.y = ang.y+180 if !Lhv.SpecSpin.Reversed then ang.y = -ang.y end  local ps1, ps2, ps3, ps4 = pos_local-p1, pos_local-p2, pos_local-p3, pos_local-p4  ps1:Rotate(ang) ps2:Rotate(ang) ps3:Rotate(ang) ps4:Rotate(ang) SpinningAngSync = ang  p1 = ent:LocalToWorld(pos_local+ps1) p2 = ent:LocalToWorld(pos_local+ps2) p3 = ent:LocalToWorld(pos_local+ps3) p4 = ent:LocalToWorld(pos_local+ps4)   doRender = ang_dif >= 0 and isBackSide  else  p1 = ent:LocalToWorld(p1) p2 = ent:LocalToWorld(p2) p3 = ent:LocalToWorld(p3) p4 = ent:LocalToWorld(p4)  end   if doRender then  local clr_temp = Lhv.Data_3D.Color if !clr_temp then clr_temp = VC.ColorCopyAlpha(clr_m, 255) end   if Lhv.SpecFade and Lhv.SpecFade.alter3D and Lhv.SpecFade.cur then  clr_temp.a = 255*Lhv.SpecFade.cur.final  end   render.DrawQuad(p1, p2, p3, p4, clr_temp)  end  end   local vis_org = vis if Lhv.ReducedVis or true then vis = vis*0.65 clr_p.a = vis end   local size_glow_extra = Lhv.OnELS and VC.getSetting("ELS_ExtraGlow")  local size_main_extra = !Lhv.DD_Main and VC.getSetting("Light_Main")  local size_HD = !Lhv.DD_HD and VC.getSetting("Light_HD") and InDetail  local size_glow = !Lhv.DD_Glow and VC.getSetting("Light_Glow") and InDetail  local size_mid = VC.getSetting("Light_Warm") and InDetail and (Lhv.RenderInner or clr_ovr)   if size_main_extra then size_main_extra = VC.getSetting("Light_Main_M") end if size_HD then size_HD = VC.getSetting("Light_HD_M") if Lhv.RenderHD_Size then size_HD = size_HD*Lhv.RenderHD_Size end end if size_glow then size_glow = VC.getSetting("Light_Glow_M") if Lhv.RenderGlow_Size then size_glow = size_glow*Lhv.RenderGlow_Size end end  if size_mid then size_mid = VC.getSetting("Light_Warm_M") if Lhv.RenderInner_Size then size_mid=size_mid*Lhv.RenderInner_Size end end if size_glow_extra then size_glow_extra = VC.getSetting("ELS_ExtraGlow_M") end   if hasLayers and !carReplaceDetail then     if Lhv.SpecTableBeam and size_mid then  local count_seg = table.Count(Lhv.SpecTableBeam) local clr_beam = VC.ColorCopyAlpha(clr_m, vis_org) render.SetMaterial(VC.Material.Beam)  render.StartBeam(count_seg) local size_temp = size_main*size_mid/10 size_mid = false  for i=1, count_seg do local size_temp_new = size_temp if Lhv.SpecTableBeam[i].Size then size_temp_new = size_temp* Lhv.SpecTableBeam[i].Size end local clr_beamSeq = Lhv.SpecTableBeam[i].Clr if !clr_beamSeq then clr_beamSeq = clr_beam end render.AddBeam(ent:LocalToWorld(Lhv.SpecTableBeam[i].Pos), size_temp_new, CurTime()+i, clr_beamSeq) end  render.EndBeam()  end     if size_mid and (Lhv.SpecRec and Lhv.SpecRec.InnerCenterOnly or Lhv.SpecCircle and Lhv.SpecCircle.InnerCenterOnly) then  render.SetMaterial(VC.Material.Reg)  renderInner(pos_world, size_main/2.5*size_mid, VC.ColorCopyAlpha(clr_m, vis), Lhv.inner_AsSpheres and {prev_mat = VC.Material.Reg})  size_mid = false  end     local count_seg = table.Count(Lhv.SpecTable)  if Lhv.RenderHD_Adv and size_HD then local size_temp = size_glow_mid*size_HD if size_mult then size_temp=size_temp*size_mult end render.SetMaterial(VC.HD_Texture) render.DrawSprite(pos_world, size_temp*3, size_temp, clr_p) end   if size_mid or size_main_extra then  render.SetMaterial(VC.Material.Reg) local size_temp = size_main/2.5  local LastPos = nil VC.DrawMainHolt = false     local lastBlinkerOnTime, seqEachOnTime = nil, nil if seqData and seqData.count == 1 then lastBlinkerOnTime = ent.VC_Lights_RanTimes[col] seqEachOnTime = seqData.time/(count_seg+1) end     for i=1, count_seg do  local cur = i  if Lhv.SpecTable[cur] and (!lastBlinkerOnTime or CurTime() >= (lastBlinkerOnTime+seqEachOnTime*cur) and (seqData.stay or CurTime() <= (lastBlinkerOnTime+seqEachOnTime*(cur+1)))) then     if lastBlinkerOnTime and seqData.reversed then cur = (count_seg-i)+1 end   local pos_temp = ent:LocalToWorld(Lhv.SpecTable[cur])   if size_mid then renderInner(pos_temp, size_temp*size_mid, VC.ColorCopyAlpha(clr_m, vis_org), Lhv.inner_AsSpheres and {prev_mat = VC.Material.Reg}) end   if size_main_extra then  if true or Lhv.Beta_Inner3D then  if !VC.DrawMainHolt or !Lhv.DrawingSpecMLine then  local clr_temp = table.Copy(clr_p) clr_temp.a = clr_temp.a/5  local size_temp = size_main*size_main_extra*3  render.DrawSprite(pos_temp, size_temp, size_temp, clr_temp)  VC.DrawMainHolt = count_seg > 2  else VC.DrawMainHolt = false  end  else local size_temp = size_main*size_main_extra render.DrawSprite(pos_temp, size_temp, size_temp, clr_p)  end  end     end  end  end   if size_glow then  local size_temp = size_glow_mid*size_glow*1.5 render.SetMaterial(VC.Material.Glow)  if size_glow_extra then  size_temp=size_temp*7*size_glow_extra render.DrawSprite(pos_world, size_temp, size_temp, VC.ColorCopyAlpha(clr_p, clr_p.a*0.06))  else  size_temp=size_temp*1.2 render.DrawSprite(pos_world, size_temp, size_temp, VC.ColorCopyAlpha(clr_p, clr_p.a*0.15))  end  end  else  local HLSOf = nil  if Lhv.UsePrjTex then    prxtext_offset = Lhv.OnFog and 0.6 or Lhv.OnHighBeams and 0.4 or 0.5   local CAng = Lhv.OnFog and 75 or Lhv.OnHighBeams and 33 or 60 local Ang = math.abs(VC.AngleDifference(VC.AngleCombCalc(ent:GetForward():Angle(), Angle(30,0,0)), (pos_world-EyePos()):Angle())-90)  if Ang < CAng then LightBeamVis = VC.EaseInOut(Ang/CAng) prxtext_offset = prxtext_offset+(1-LightBeamVis)*((Lhv.OnFog and 0.25 or Lhv.OnHighBeams and 0.6 or 0.3)+(150-size_main)/100) end  HLSOf = (size_main/1.5+vis/255)*prxtext_offset  end   size_main = size_main*0.85  local sizePriorToHeadLight = size_main  size_main = size_main*prxtext_offset  if !HLSOf then HLSOf = size_main end   render.SetMaterial(VC.Material.Reg)   if size_mid then renderInner(pos_world, size_main/2.5*size_mid, VC.ColorCopyAlpha(clr_m, vis), Lhv.inner_AsSpheres and {size = sizePriorToHeadLight/2.5*size_mid, prev_mat = VC.Material.Reg}) end  if size_main_extra then HLSOf=HLSOf*size_main_extra*(hasLayers and carReplaceDetail and 5 or 1) render.DrawSprite(pos_world, HLSOf, HLSOf, clr_p) end  if size_HD then  size_main=size_main*size_HD  if size_main > 2 then  local NVis = vis-100  if NVis > 0 then  local clr = VC.ColorCopyAlpha(clr_p, NVis)  render.SetMaterial(VC.HD_Texture)  render.DrawSprite(pos_world, size_main/3, size_main*3, clr)  render.DrawSprite(pos_world, size_main*3, size_main, clr)  end  end  end  if size_glow then  local Sz = size_glow_mid*3*prxtext_offset*size_glow render.SetMaterial(VC.Material.Glow) if Lhv.ReducedVis or true then clr_p.a = clr_p.a*1.535 end  if size_glow_extra then  Sz=Sz*2*size_glow_extra render.DrawSprite(pos_world, Sz, Sz, VC.ColorCopyAlpha(clr_p, clr_p.a*0.05))  else  Sz=Sz*1.1 render.DrawSprite(pos_world, Sz, Sz, VC.ColorCopyAlpha(clr_p, clr_p.a*0.11))  end  end  end  end   if InDetail then  handlePrjText(ent, Lhv, clr_p, LightBeamVis, pos_world, ang_local, pos_local)   if SpinningSizeSync and Lhv.Data_3D and VC.getSetting("Light_3D") and Lhv.SpecSpin and Lhv.SpecSpin.Use and !Lhv.SpecSpin.dd_beam then  render.SetMaterial(VC.Material.HBeam)  local FP = (pos_world- ent:GetRight()* 200)-pos_world  FP:Rotate(SpinningAngSync+Angle(0,180-(Lhv.SpecSpin.Rotated and 90 or 0),0))   render.DrawBeam(pos_world, pos_world+FP, 200, 1, 0, VC.ColorCopyAlpha(clr_p, 2+15*SpinningSizeSync))  end  end  end   handleSpecModel(ent, Lhk, Lhv, colid, col, pos_world, pos_local, ang_local, NotDark, distnum, size_mult)   handleDyn(ent, Lhk, Lhv, colid, clr_p, pos_world, pos_local, NotDark, distnum, size_mult)   local Type = 1 if Lhv.OnHighBeams then Type = 2 end if Lhv.OnFog then Type = 3 end    ent.VC_LastRenderedL[Lhk] = Lhv[col]  end end  local function Handle_Light_Draw_Multi(ent, ltable, GTbl, col, colid, sideid, distnum)  for Lhk, Lhv in pairs(ltable) do  if Lhv and Lhv.Pos then  local can = true  local seqData = nil  local notblnk = col != "BlinkersColor"   if notblnk then  if Lhv.DD_Blnk_Run then  local on = VC.GetState(ent, "HazardLightsOn")  if on then  can = false  else  if Lhv.Pos.x < 0 then  can = !on and !VC.GetState(ent, "TurnLightLeftOn")  else  can = !on and !VC.GetState(ent, "TurnLightRightOn")  end  end  end   local ELSSel = nil  local state = VC.GetState(ent, "ELS_Lht_Sel", 0)  local state_disabled = VC.GetState(ent, "ELS_L_Disabled")  if can and Lhv.DD_ELS1 then if !ELSSel then ELSSel = state end if !state_disabled and ELSSel == 1 then can = false end end  if can and Lhv.DD_ELS2 then if !ELSSel then ELSSel = state end if !state_disabled and ELSSel == 2 then can = false end end  if can and Lhv.DD_ELS3 then if !ELSSel then ELSSel = state end if !state_disabled and ELSSel == 3 then can = false end end  if can and Lhv.DD_if_LBeam then can = !VC.GetState(ent, "LowBeamsOn") end  if can and Lhv.DD_if_brakes then can = !ent:GetNWBool("VC_Lights_Brake_Created", false) end  end     if can then  local seqStart = ent.VC_Lights_RanTimes[col]  if seqStart and GTbl.LPT_Seq and GTbl.LPT_Seq[0][Lhk] then  local tempData = GTbl.LPT_Seq[GTbl.LPT_Seq[0][Lhk]][Lhk]  if CurTime() < seqStart+tempData.timeOn or !tempData.seq_stay and CurTime() > seqStart+tempData.timeOff then can = nil end  seqData = {time = tempData.timeOff, stay = tempData.seq_stay, count = table.Count(GTbl.LPT_Seq[GTbl.LPT_Seq[0][Lhk]]), reversed = tempData.reversed}  end  end     if can then  VC_dmq3e18505c6fdde124627e9fa198ee180bkZo(ent, Lhk, Lhv, col, colid, sideid, distnum, nil, seqData)  end  end  end end  local function canByDistance(ent) return VC.GetViewPos():Distance(ent:GetPos()) < 9000 end  function VC.StatesHandleInit(ent)  if !ent.VC_SatesInitialized then  ent.VC_SatesInitialized = true  if !ent.VC_SatesDoCheckIn or CurTime() >= ent.VC_SatesDoCheckIn then  net.Start("VC_StatesRequestInit") net.WriteEntity(ent) net.SendToServer()  end  ent.VC_SatesDoCheckIn = nil  end end  local function DataReqCheck(ent)  if !ent.VC_Model_IsNull then  if !ent.VC_Model then  local tmdl = VC.Global_Model_Names[ent:GetModel()]  if tmdl then  ent.VC_Model = tmdl  VC.Initialize_PostModel(ent)  elseif canByDistance(ent) then  net.Start("VC_RequestVehData_Model") net.WriteEntity(ent) net.SendToServer()  end  end  end   VC.StatesHandleInit(ent) end  local function HandleSpecMat(ent)  if ent.VC_Light_SpecMat then  for k,v in pairs(ent.VC_Light_SpecMat) do  local can = false for k2, v2 in pairs(v) do if can then if ent.VC_LastRenderedL[k2] then can = false break end elseif !ent.VC_LastRenderedL[k2] then can = k2 end end  if can then ent:SetSubMaterial(k-1, nil) ent.VC_Light_SpecMat[k][can] = nil end  if table.Count(ent.VC_Light_SpecMat[k]) == 0 then ent.VC_Light_SpecMat[k] = nil end  end  if table.Count(ent.VC_Light_SpecMat) == 0 then ent.VC_Light_SpecMat = nil end  end end  concommand.Add("VC_BETA_PDTR", function(ply) if !VC_BETA_PDTR then VC_BETA_PDTR = true else VC_BETA_PDTR = nil end end)  local function drawDashboard(ent)  local sData = VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent)  if sData and sData.dash and sData.dash.enabled then  local pos = sData.dash.pos or Vector(0,0,0)  local ang = sData.dash.ang or Angle(0,0,0)  local bg_scale = sData.dash.bg_scale or 1  local bg_stretch_h = sData.dash.bg_stretch_h or 1  local mat = sData.dash.bg_mat if !VC.Material[mat] then VC.Material[mat] = Material(mat) end mat = VC.Material[mat]  local bg_clr = sData.dash.bg_color or Color(0,0,0,255)  bg_clr.a = sData.dash.bg_tr or 225   cam.Start3D2D(ent:LocalToWorld(pos), ent:LocalToWorldAngles(ang), 0.1)    surface.SetDrawColor(bg_clr) surface.SetMaterial(mat) surface.DrawTexturedRect(-100*bg_scale,-100*bg_scale, 200*bg_scale, 200*bg_scale)        cam.End3D2D()  end end  local function handleLightsAnim(ent, id, id_clr, lData, GTbl, tid, ptid)  id = id.."Color"  local idtime = ent.VC_Lights_RanTimes[id]  if id_clr then  if !idtime then ent.VC_Lights_RanTimes[id] = CurTime() end  elseif idtime then  ent.VC_Lights_RanTimes[id] = nil  end end  local function dohandleLights(ent, CBR, id, id_clr, lData, GTbl, tid, ptid, passive)  local can = nil  if passive then  can = CBR:GetNWBool("VC_Lights_"..id_clr.."_Created", false)  else  local id_state = "" local sData = VC.StatesByID[id] if sData then id_state = sData.id_state end  can = VC.GetState(CBR, id_state)  end   if can then  Handle_Light_Draw_Multi(ent, lData, GTbl, id.."Color", tid, ptid, ent.VC_Lht_DstCheckMult or 0)   return ent, id, id_clr, lData, GTbl, tid, ptid  end end  local function handleLights(ent, CBR, id, id_clr, LhtTbl, GTbl, tid, ptid, passive)  local lData = LhtTbl[id]  if lData then  return dohandleLights(ent, CBR, id, id_clr, lData, GTbl, tid, ptid, passive)  end end   function VC.FTmRender()  return 1   end  local function handleRenderQueModel(ent)  if ent.VC_renderQueModel then  for id,v in pairs(ent.VC_renderQueModel) do  if !ent.VC_LastRenderedL or !ent.VC_LastRenderedL[id] then    VC.unregisterEntity(ent, id)  ent.VC_renderQueModel[id] = nil  end  end  end end  hook.Add("PostDrawTranslucentRenderables", "VC_PostDrawTranslucentRenderables", function()  VC.FrameTimeRender = (CurTime()-(VC.FrameTimeRenderLast or CurTime()))*100 VC.FrameTimeRenderLast = CurTime()     EyePos()   if !VC.getSetting("Enabled") then return end  if VC.isPlayerInWorld then return end   VC.IsViewerSelf = VC.CheckViewerIsSelf()    local veh, veh_main = VC.getVehicleMain(LocalPlayer():GetVehicle(), true)          VC.InVehicleMain = veh_main  VC.InVehicleAndTP = veh and VC.isThirdPerson(veh)   local CanUpdate = !VC.SyncTimeCheck or CurTime() >= VC.SyncTimeCheck  for _, ent in pairs(VC.GetVehicleList()) do  if IsValid(ent) then  if VC_BETA_PDTR then if type(VC_BETA_PDTR) != "table" then VC_BETA_PDTR = {} VCMsg("Switching to BETA light rendering.") end else       if CanUpdate then DataReqCheck(ent) end   if VC.hasGlobalOD(ent.VC_Model) and (VC.ElectronicsOn(ent) or !ent:IsVehicle()) then   if VC.getSetting("HUD_Dashboard") or vcmod_dev then drawDashboard(ent) end   local PRenL = ent.VC_LastRenderedL ent.VC_LastRenderedL = {} local MEnt = ent.VC_ExtraSeat and ent:GetParent() or ent  if VC.Handle_PDTR_Alarm then VC.Handle_PDTR_Alarm(ent) end   ent.VC_HDPTR_Vis_Cache = {}   if ent.VC_Lht_DstCheckMult then  if ent.VC_Lht_DstCheck_B then  if ent.VC_Lht_DstCheckMult < 1 then ent.VC_Lht_DstCheckMult = ent.VC_Lht_DstCheckMult+0.01*VC.FTmRender() if ent.VC_Lht_DstCheckMult > 1 then ent.VC_Lht_DstCheckMult = 1 end end  elseif ent.VC_Lht_DstCheckMult > 0 then  ent.VC_Lht_DstCheckMult = ent.VC_Lht_DstCheckMult-0.01*VC.FTmRender() if ent.VC_Lht_DstCheckMult < 0 then ent.VC_Lht_DstCheckMult = 0 end  end  end   if ent.VC_Lht_DstCheckMult and ent.VC_Lht_DstCheckMult > 0 and ent.VC_notCenter and !ent.VC_isNoDraw then   local CBR = VC.getTruck(ent)   local GTbl = VC_6Kw3e18505c6fdde124627e9fa198ee180b7em(ent.VC_Model) local LhtTbl = GTbl.LightTable   if VC.HandleELSLights and LhtTbl then VC.HandleELSLights(ent, LhtTbl, PRenL) end   if LhtTbl then  local id = "Brake" handleLightsAnim(ent, id, handleLights(ent, CBR, id, id, LhtTbl, GTbl, 2, nil, true))   local id = "Running" handleLightsAnim(ent, id, handleLights(ent, CBR, id, id, LhtTbl, GTbl, 3))  local id = "Fog" handleLightsAnim(ent, id, handleLights(ent, CBR, id, id, LhtTbl, GTbl, 10))  local id = "Reverse" handleLightsAnim(ent, id, handleLights(ent, CBR, id, id, LhtTbl, GTbl, 4, nil, true))  local id = "Inter" handleLightsAnim(ent, id, handleLights(ent, CBR, id, id, LhtTbl, GTbl, 8, nil, true))   if !VC.GetState(ent, "HighBeamsOn") then  local id = "LBeam" handleLightsAnim(ent, id, handleLights(ent, CBR, id, id, LhtTbl, GTbl, 5))  end  local id = "HBeam" handleLightsAnim(ent, id, handleLights(ent, CBR, id, id, LhtTbl, GTbl, 5))   local lData = LhtTbl.Blinker  if lData then  local ran, id = nil, "Blinkers"  local id_clr = "Alarm" if dohandleLights(ent, CBR, id, id_clr, lData, GTbl, 6, nil, true) then ran = id_clr end  local id_clr = "Hazards" if dohandleLights(ent, CBR, id, id_clr, lData, GTbl, 6, nil, true) then ran = id_clr end  local id_clr = "BlinkerLeft" if dohandleLights(ent, CBR, id, id_clr, lData, GTbl, 6, 1, true) then ran = id_clr end  local id_clr = "BlinkerRight" if dohandleLights(ent, CBR, id, id_clr, lData, GTbl, 6, 2, true) then ran = id_clr end   handleLightsAnim(ent, id, ran)  end  end     if ent:GetNWBool("VC_Lights_Door_Created", false) then  local sData = VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent)  if sData.semiData_doorLightPos then VC_dmq3e18505c6fdde124627e9fa198ee180bkZo(ent, -45, {Pos = sData.semiData_doorLightPos, UseSprite = true, Sprite = {Size = 0.1}, UseDynamic = true, Dynamic = {Brightness = 5, Size = 0.5}, DoorColor = Color(255,255,255,255), RenderType = 2}, "DoorColor", 1, nil, ent.VC_Lht_DstCheckMult) end  end  end  end     HandleSpecMat(ent)  handleRenderQueModel(ent)  end  end  end   if CanUpdate then  for k,v in pairs(VC.PrjTextures) do if !IsValid(ents.GetByIndex(k)) then for k2,v2 in pairs(v) do if IsValid(v2.pt) then v2.pt:Remove() end end VC.PrjTextures[k] = nil end end  VC.SyncTimeCheck = CurTime()+1.5  end end)   local def_clr, def_val = Color(0,0,0,0), 1 hook.Add("PreDrawHalos", "VC_PreDrawHalos", function()  if !VC.registeredEntitiesDrawHalo then return end  if VC.isPlayerInWorld then return end   for k,v in pairs(VC.registeredEntitiesDrawHalo) do  if !IsValid(v) or !v.VC_registeredEntitiesDrawHalo then VC.registeredEntitiesDrawHalo[k] = nil if #VC.registeredEntitiesDrawHalo == 0 then VC.registeredEntitiesDrawHalo = nil return end end   if v.VC_registeredEntitiesDrawHalo and VC.isClose(v) then  for k2,v2 in pairs(v.VC_registeredEntitiesDrawHalo) do   if !IsValid(v2) then v.VC_registeredEntitiesDrawHalo[k2] = nil if #v.VC_registeredEntitiesDrawHalo == 0 then v.VC_registeredEntitiesDrawHalo = nil return end end  local data = v2.dataGlow  if data then  halo.Add({v2}, data.Color or def_clr, data.blur or def_val, data.blur or def_val, data.passes or def_val)  else  v.VC_registeredEntitiesDrawHalo[k2] = nil  end  end  end  end end) local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod?audio:
VC.HornTable = {  original = {Name = "Original"},  light = {Name = "Light", Sound = "vcmod/horn/light.wav", Pitch = 100, Volume = 1, Level = 85},  heavy = {Name = "Heavy", Sound = "vcmod/horn/heavy.wav", Pitch = 100, Volume = 1, Level = 85},  general_lee = {Name = "General Lee", Sound = "vcmod/horn/general_lee.wav", Pitch = 100, Volume = 1, Level = 85},  simple = {Name = "Simple", Sound = "vcmod/horn/simple.wav", Pitch = 100, Volume = 1, Level = 85},  simple2 = {Name = "Simple2", Sound = "vcmod/horn/simple2.wav", Pitch = 100, Volume = 1, Level = 85}, }  function VC.HandleAudio_VC2(ent, Elec)                                                                                    end  function VC.getHornSoundData(ent, script)  local ret = nil   if !script then script = VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent) end   local data = ent:GetNWString("VC_Horn_Custom", "")   if data != "" then  local data = util.JSONToTable(data)  ret = {Name = data.n, Sound = data.s, Pitch = data.p or 100, Volume = data.v or 1, Level = data.l}  else  if script.hornData then  ret = script.hornData  else  ret = VC.IsBig(ent) and VC.HornTable.heavy or VC.HornTable.light  end  end  if VC.getServerSetting("Enabled_ELS") and VC.getServerSetting("ELS_Sounds") and ((VC.GetState(ent, "ELS_ManualOn") or VC.GetState(ent, "ELS_Snd_Sel", 0) > 0) and !VC.GetState(ent, "ELS_S_Disabled") and script.Siren and script.Siren.Sounds_Horn and script.Siren.Sounds_Horn.Use) and VC.BGroups_Check(ent, "ELS Sound", VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).Siren.Sound_BGroups) then  ent.VC_Horn_EnableELSOnHornEnd = true  ret = script.Siren.Sounds_Horn  end   return ret end  local function handleHorn(ent, EntLN, Elec)  if VC.GetState(ent, "HornOn") and Elec and VC.EngineAboveWater(ent) then  if !ent.VC_Sounds.Horn or !ent.VC_Sounds.Horn:IsPlaying() then  local script = VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent)  local data = VC.getHornSoundData(ent, script)   if ent.VC_Horn_EnableELSOnHornEnd then  local hookData = hook.Call("VC_soundEmit_ELS", GAMEMODE, ent, "bullhorn", data) if hookData == false then data = nil elseif type(hookData) == "table" then data = hookData end  end   if data then  ent.VC_HornTable = {Sound = data.Sound or (VC.IsBig(ent) and "vcmod/horn/heavy.wav" or "vcmod/horn/light.wav"), Pitch = data.Pitch or 100, Distance = data.Distance or 85, Volume = (data.Volume or 1)*(VC.getServerSetting("Horn_Volume", 1))}  ent.VC_Sounds.Horn = VC.SoundEmit(ent, ent.VC_HornTable.Sound, ent.VC_HornTable.Pitch, ent.VC_HornTable.Distance, ent.VC_HornTable.Volume, nil, true)  ent.VC_Siren_BullHorn = ent.VC_Horn_EnableELSOnHornEnd and true or false  end  end  elseif ent.VC_Sounds.Horn and ent.VC_Sounds.Horn:IsPlaying() then  if ent.VC_Horn_EnableELSOnHornEnd then ent.VC_Horn_EnableELSOnHornEnd = nil end   ent.VC_Sounds.Horn:ChangeVolume(0, 0.01) timer.Simple(0.001, function() if IsValid(ent) and ent.VC_Sounds and ent.VC_Sounds.Horn then ent.VC_Sounds.Horn:Stop() end end)  end end  function VC.HandleAudio(ent, EntLN)  local Elec = VC.ElectronicsOn(ent)   if !ent.VC_Sounds then ent.VC_Sounds = {} end   if VC.ELS_Audio then VC.ELS_Audio(ent, EntLN, Elec) end  if VC.handleSurface then VC.handleSurface(ent, EntLN, Elec) end  handleHorn(ent, EntLN, Elec) end local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod?console_main:
local function canLBeams(ent) return VC.getServerSetting("Lights") and VC.getServerSetting("HeadLights") and IsValid(ent) and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent) and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable.LBeam end local function canHBeams(ent) return VC.getServerSetting("Lights") and VC.getServerSetting("HeadLights") and IsValid(ent) and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent) and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable.HBeam end  concommand.Add("vc_lowbeams_toggle", function(ply) local ent = ply:GetVehicle() if canLBeams(ent) then if !VC.GetState(ent, "LowBeamsOn") then VC.LowBeamsOn(ent) else VC.LowBeamsOff(ent) end end end) concommand.Add("vc_highbeams_toggle", function(ply) local ent = ply:GetVehicle() if canHBeams(ent) then if !VC.GetState(ent, "HighBeamsOn") then VC.HighBeamsOn(ent) else VC.HighBeamsOff(ent) end end end)  concommand.Add("VC_highbeams", function(ply, cmd, arg)  local ent, HA = ply:GetVehicle(), tonumber(arg[1]) if !HA then HA = 0 end   if canHBeams(ent) then  local on = VC.GetState(ent, "HighBeamsOn")  if HA == 2 or HA == 0 and on then  VC.HighBeamsOff(ent)  else  VC.HighBeamsOn(ent)  end  end end)  concommand.Add("VC_Hazards_OnOff", function(ply) local ent = ply:GetVehicle() if IsValid(ent) and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent) and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable.Blinker then if VC.getServerSetting("Lights") and !VC.GetState(ent, "HazardLightsOn") then VC.HazardLightsOn(ent) else VC.HazardLightsOff(ent) end end end) concommand.Add("VC_Blinker_Left", function(ply) local ent = ply:GetVehicle() if IsValid(ent) and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent) and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable.Blinker then if VC.getServerSetting("Lights") and !VC.GetState(ent, "TurnLightLeftOn") then VC.TurnLightLeftOn(ent) else VC.TurnLightLeftOff(ent) end end end) concommand.Add("VC_Blinker_Right", function(ply) local ent = ply:GetVehicle() if IsValid(ent) and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent) and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable.Blinker then if VC.getServerSetting("Lights") and !VC.GetState(ent, "TurnLightRightOn") then VC.TurnLightRightOn(ent) else VC.TurnLightRightOff(ent) end end end)  concommand.Add("VC_FogLights_OnOff", function(ply) local ent = ply:GetVehicle() if IsValid(ent) and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent) and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable.Fog then if VC.getServerSetting("Lights") and VC.getServerSetting("FogLights") and !VC.GetState(ent, "FogLightsOn") then VC.FogLightsOn(ent) else VC.FogLightsOff(ent) end end end) concommand.Add("vc_runninglights_toggle", function(ply) local ent = ply:GetVehicle() if IsValid(ent) and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent) and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable.Running then if VC.getServerSetting("Lights") and !VC.GetState(ent, "RunningLightsOn") then VC.RunningLightsOn(ent) else VC.RunningLightsOff(ent) end end end)  concommand.Add("vc_lights_switch", function(ply)  local ent = ply:GetVehicle()  if !VC.getServerSetting("Lights") then return end  if IsValid(ent) then  local data = VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent) if !data then return end  local lTable = VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).LightTable if !lTable then return end   local hasRunning, hasLowBeam = VC.getServerSetting("Lights_Running") and lTable.Running, VC.getServerSetting("HeadLights") and lTable.LBeam if !hasRunning and !hasLowBeam then return end  local onRunning, onLowBeam = VC.GetState(ent, "RunningLightsOn"), VC.GetState(ent, "LowBeamsOn")   if onRunning and onLowBeam then  VC.RunningLightsOff(ent, true)  VC.LowBeamsOff(ent)  elseif (!hasRunning or onRunning) and hasLowBeam and !onLowBeam then  VC.LowBeamsOn(ent)  elseif !onRunning and hasRunning then  VC.RunningLightsOn(ent)  elseif onRunning and !hasLowBeam then  VC.RunningLightsOff(ent)  elseif onLowBeam and !hasRunning then  VC.LowBeamsOff(ent)  end  end end)  concommand.Add("VC_Cruise_OnOff", function(ply)  local ent = ply:GetVehicle() local GVeh = ent.VC_Parent or ent  if IsValid(ent) and ent == GVeh then  if VC.GetState(ent, "CruiseOn") then  VC.CruiseOff(ent)  else  VC.CruiseOn(ent)  end  end end) local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod?anim_main:
VC.AnimDriverTypes = {  [0] = {name = "default", id = ""},  [1] = {name = "Standing (scooter)", id = "standing_scooter"},  [2] = {name = "Sitting (bycicle BMX)", id = "bicycle_bmx"},  [3] = {name = "Sitting (bycicle)", id = "bicycle"},  [4] = {name = "Sitting (tricycle)", id = "tricycle"}, }  VC.AnimTable_Or = {  Instant = {  PassSeatLegs = {  Bones = {  {Bone = "ValveBiped.Bip01_R_Calf", Angle = Angle(0,-50,-20)},  {Bone = "ValveBiped.Bip01_R_Calf", Angle = Angle(0,-50,-20)},  {Bone = "ValveBiped.Bip01_L_Calf", Angle = Angle(0,-50,20)}  },  },     standing_scooter = {  Bones = {    {Bone = "ValveBiped.bip01_pelvis", Angle = Angle(0,0,10)},  {Bone = "ValveBiped.bip01_spine1", Angle = Angle(0,10,0)},        {Bone = "ValveBiped.Bip01_R_Thigh", Angle = Angle(15,95,0)},  {Bone = "ValveBiped.Bip01_R_Calf", Angle = Angle(0,-50,-10)},  {Bone = "ValveBiped.Bip01_R_Foot", Angle = Angle(25,-10,0)},      {Bone = "ValveBiped.Bip01_L_Thigh", Angle = Angle(-12,70,0)},  {Bone = "ValveBiped.Bip01_L_Calf", Angle = Angle(0,-35,-10)},  {Bone = "ValveBiped.Bip01_L_Foot", Angle = Angle(0,10,0)},      {Bone = "ValveBiped.Bip01_R_UpperArm", Angle = Angle(0,25,0)},  {Bone = "ValveBiped.Bip01_R_Forearm", Angle = Angle(0,-50,-25)},  {Bone = "ValveBiped.Bip01_R_Hand", Angle = Angle(20,0,-25)},      {Bone = "ValveBiped.Bip01_L_UpperArm", Angle = Angle(0,20,0)},  {Bone = "ValveBiped.Bip01_L_Forearm", Angle = Angle(0,-50,25)},  {Bone = "ValveBiped.Bip01_L_Hand", Angle = Angle(20,0,35)},  },  },   bicycle_bmx = {  Bones = {      {Bone = "ValveBiped.bip01_spine1", Angle = Angle(0,10,0)},        {Bone = "ValveBiped.Bip01_R_Thigh", Angle = Angle(15,35,0)},  {Bone = "ValveBiped.Bip01_R_Calf", Angle = Angle(20,25,-10)},  {Bone = "ValveBiped.Bip01_R_Foot", Angle = Angle(0,-10,0)},      {Bone = "ValveBiped.Bip01_L_Thigh", Angle = Angle(-12,0,0)},  {Bone = "ValveBiped.Bip01_L_Calf", Angle = Angle(0,25,-10)},  {Bone = "ValveBiped.Bip01_L_Foot", Angle = Angle(0,10,0)},      {Bone = "ValveBiped.Bip01_R_UpperArm", Angle = Angle(7,5,0)},  {Bone = "ValveBiped.Bip01_R_Forearm", Angle = Angle(0,-32,-40)},  {Bone = "ValveBiped.Bip01_R_Hand", Angle = Angle(0,0,-25)},      {Bone = "ValveBiped.Bip01_L_UpperArm", Angle = Angle(-15,10,0)},  {Bone = "ValveBiped.Bip01_L_Forearm", Angle = Angle(0,-36,25)},  {Bone = "ValveBiped.Bip01_L_Hand", Angle = Angle(0,0,35)},  },  },    bicycle = {  Bones = {    {Bone = "ValveBiped.bip01_pelvis", Angle = Angle(0,0,10)},  {Bone = "ValveBiped.bip01_spine1", Angle = Angle(0,10,0)},  {Bone = "ValveBiped.bip01_spine2", Angle = Angle(0,10,0)},      {Bone = "ValveBiped.Bip01_R_Thigh", Angle = Angle(0,35,0)},  {Bone = "ValveBiped.Bip01_R_Calf", Angle = Angle(20,-20,-10)},  {Bone = "ValveBiped.Bip01_R_Foot", Angle = Angle(0,10,0)},      {Bone = "ValveBiped.Bip01_L_Thigh", Angle = Angle(0,18,0)},  {Bone = "ValveBiped.Bip01_L_Calf", Angle = Angle(0,-25,10)},  {Bone = "ValveBiped.Bip01_L_Foot", Angle = Angle(0,25,0)},      {Bone = "ValveBiped.Bip01_R_UpperArm", Angle = Angle(0,-18,0)},  {Bone = "ValveBiped.Bip01_R_Forearm", Angle = Angle(0,-22,-40)},  {Bone = "ValveBiped.Bip01_R_Hand", Angle = Angle(0,0,-35)},      {Bone = "ValveBiped.Bip01_L_UpperArm", Angle = Angle(0,-22,0)},  {Bone = "ValveBiped.Bip01_L_Forearm", Angle = Angle(0,-15,40)},  {Bone = "ValveBiped.Bip01_L_Hand", Angle = Angle(0,0,45)},  },  },  tricycle = {  Bones = {              {Bone = "ValveBiped.Bip01_R_Thigh", Angle = Angle(0,-10,0)},  {Bone = "ValveBiped.Bip01_R_Calf", Angle = Angle(20,50,-10)},  {Bone = "ValveBiped.Bip01_R_Foot", Angle = Angle(0,10,0)},      {Bone = "ValveBiped.Bip01_L_Thigh", Angle = Angle(0,-5,0)},  {Bone = "ValveBiped.Bip01_L_Calf", Angle = Angle(-10,20,10)},  {Bone = "ValveBiped.Bip01_L_Foot", Angle = Angle(0,15,0)},      {Bone = "ValveBiped.Bip01_R_UpperArm", Angle = Angle(10,50,0)},  {Bone = "ValveBiped.Bip01_R_Forearm", Angle = Angle(0,-48,0)},  {Bone = "ValveBiped.Bip01_R_Hand", Angle = Angle(0,0,-35)},      {Bone = "ValveBiped.Bip01_L_UpperArm", Angle = Angle(-10,50,0)},  {Bone = "ValveBiped.Bip01_L_Forearm", Angle = Angle(0,-48,0)},  {Bone = "ValveBiped.Bip01_L_Hand", Angle = Angle(0,0,45)},  },  }   },  L_Foot = {  Brakes = {  IncSpeed = 1.5,  DecSpeed = 0.5,  Bones = {  {Bone = "ValveBiped.Bip01_L_Foot", Angle = Angle(10,10,30)},  {Bone = "ValveBiped.Bip01_L_Calf", Angle = Angle(-10,-20,-10)},  {Bone = "ValveBiped.Bip01_L_Thigh", Angle = Angle(10,15,-20)}  },  },  Clutch = {  IncSpeed = 1,  DecSpeed = 0.5,  Bones = {  {Bone = "ValveBiped.Bip01_L_Foot", Angle = Angle(0,20,0)},  {Bone = "ValveBiped.Bip01_L_Calf", Angle = Angle(0,-20,0)},  {Bone = "ValveBiped.Bip01_L_Thigh", Angle = Angle(0,10,0)}  },  },  },  R_Foot = {  Throttle = {  IncSpeed = 0.75,  DecSpeed = 0.5,  Bones = {  {Bone = "ValveBiped.Bip01_R_Foot", Angle = Angle(0,20,0)},  {Bone = "ValveBiped.Bip01_R_Calf", Angle = Angle(0,-20,0)},  {Bone = "ValveBiped.Bip01_R_Thigh", Angle = Angle(0,10,0)}  }  },  },  L_Arm = {  Horn = {  IncSpeed = 2,  DecSpeed = 1,  Bones = {  {Bone = "ValveBiped.Bip01_L_UpperArm", Angle = Angle(20,7,15)},  {Bone = "ValveBiped.Bip01_L_Forearm", Angle = Angle(0,-5,22)},  {Bone = "ValveBiped.Bip01_L_Hand", Angle = Angle(-43,90,13)}  },  },  Right_HandBrake = {  IncSpeed = 1.5,  DecSpeed = 1,  Bones = {  {Bone = "ValveBiped.Bip01_L_UpperArm", Angle = Angle(-52,46,0)},  {Bone = "ValveBiped.Bip01_L_Forearm", Angle = Angle(60,10,25)},  {Bone = "ValveBiped.Bip01_L_Hand", Angle = Angle(2,34,0)}  },  },  Right_Gear = {  IncSpeed = 1.5,  DecSpeed = 0.7,  Bones = {  {Bone = "ValveBiped.Bip01_L_UpperArm", Angle = Angle(-25,52,16)},  {Bone = "ValveBiped.Bip01_L_Forearm", Angle = Angle(-10,-40,-45)},  {Bone = "ValveBiped.Bip01_L_Hand", Angle = Angle(0,0,80)}  },  },  },  R_Arm = {  Key = {  IncSpeed = 0.5,  DecSpeed = 0.2,  Bones = {  {Bone = "ValveBiped.bip01_spine2", Angle = Angle(5,40,-10)},  {Bone = "ValveBiped.Bip01_R_UpperArm", Angle = Angle(20,-40,20)},  {Bone = "ValveBiped.Bip01_R_Forearm", Angle = Angle(-50,30,40)},  {Bone = "ValveBiped.Bip01_R_Hand", Angle = Angle(35,0,-90)},  {Bone = "ValveBiped.Bip01_L_UpperArm", Angle = Angle(-75,-10,-20)},  {Bone = "ValveBiped.Bip01_L_Forearm", Angle = Angle(60,-75,0)},  {Bone = "ValveBiped.Bip01_L_Hand", Angle = Angle(0,10,-90)}  },  },  HandBrake = {  IncSpeed = 1.5,  DecSpeed = 1,  Bones = {  {Bone = "ValveBiped.Bip01_R_UpperArm", Angle = Angle(52,46,0)},  {Bone = "ValveBiped.Bip01_R_Forearm", Angle = Angle(-60,10,25)},  {Bone = "ValveBiped.Bip01_R_Hand", Angle = Angle(2,34,0)}  },  },  Gear = {  IncSpeed = 1.5,  DecSpeed = 0.7,  Bones = {  {Bone = "ValveBiped.Bip01_R_UpperArm", Angle = Angle(25,52,-16)},  {Bone = "ValveBiped.Bip01_R_Forearm", Angle = Angle(10,-40,-45)},  {Bone = "ValveBiped.Bip01_R_Hand", Angle = Angle(0,16,13)}  },  },  Right_Horn = {  IncSpeed = 2,  DecSpeed = 1,  Bones = {  {Bone = "ValveBiped.Bip01_R_UpperArm", Angle = Angle(-20,7,-15)},  {Bone = "ValveBiped.Bip01_R_Forearm", Angle = Angle(0,-5,-22)},  {Bone = "ValveBiped.Bip01_R_Hand", Angle = Angle(43,90,13)}  },  },  }, } VC.AnimTable = table.Copy(VC.AnimTable_Or)  function VC.AnimateBone(ent, bone, ang, pos)   local b = ent:LookupBone(bone)  if !b then return end   if !ent.VC_BoneTable then ent.VC_BoneTable = {} end ent.VC_BoneTable[b] = ang   ent:ManipulateBoneAngles(b, ang)     end  function VC.HandleAnim_SetBones(ent, Group, Type)  local Tbl = VC.AnimTable[Group][Type] Tbl.Int = 1                    local AI = ent:GetNWEntity("VC_AI_PlayerModel") if IsValid(AI) then ent = AI end  for _, BTbl in pairs(Tbl.Bones) do VC.AnimateBone(ent, BTbl.Bone, BTbl.Angle, BTbl.Pos) end  ent:InvalidateBoneCache() end  function VC.HandleAnim_LerpBones(ent, Group, Type, Increase, Override)  local Tbl = VC.AnimTable[Group][Type]  if Override then  Tbl.Int = Lerp(0.05*VC.FTm(), Tbl.Int or Override, Override)  for _, BTbl in pairs(Tbl.Bones) do  VC.AnimateBone(ent, BTbl.Bone, LerpAngle(VC.EaseInOut(Tbl.Int), Angle(0,0,0), BTbl.Angle))  end  else  if !ent.VC_AnimInt then ent.VC_AnimInt = {} end  if Increase then  if !ent.VC_AnimInt[Type] then ent.VC_AnimInt[Type] = 0 end  if ent.VC_AnimInt[Type] < 1 then  local allowed = true for GAnimk, GAnimv in pairs(VC.AnimTable[Group]) do if GAnimk != Type and ent.VC_AnimInt[GAnimk] and ent.VC_AnimInt[GAnimk] > 0 then allowed = false break end end  if allowed then  ent.VC_AnimInt[Type] = ent.VC_AnimInt[Type]+0.05*Tbl.IncSpeed*VC.FTm() if ent.VC_AnimInt[Type] > 1 then ent.VC_AnimInt[Type] = 1 end  for _, BTbl in pairs(Tbl.Bones) do VC.AnimateBone(ent, BTbl.Bone, LerpAngle(VC.EaseInOut(ent.VC_AnimInt[Type]), Angle(0,0,0), BTbl.Angle)) end  end  end  elseif ent.VC_AnimInt[Type] and ent.VC_AnimInt[Type] > 0 then  local allowed = false for GAnimk, GAnimv in pairs(VC.AnimTable[Group]) do if GAnimk != Type and ent.VC_AnimInt[GAnimk] then allowed = true break end end  ent.VC_AnimInt[Type] = ent.VC_AnimInt[Type]-0.05*Tbl.DecSpeed*(allowed and 3 or 1)*VC.FTm() if ent.VC_AnimInt[Type] < 0 then ent.VC_AnimInt[Type] = 0 end  for _, BTbl in pairs(Tbl.Bones) do VC.AnimateBone(ent, BTbl.Bone, LerpAngle(VC.EaseInOut(ent.VC_AnimInt[Type]), Angle(0,0,0), BTbl.Angle)) end  else  ent.VC_AnimInt[Type] = nil  end  end end  function VC.HandleAnim_Initial_Spec(ply, OV, Veh, VSC)  if VC.getSetting("Animations") and VC.getSetting("Animations_All") then  for _,ent in pairs(player.GetAll()) do  local Prt = ent:GetVehicle()  if IsValid(Prt) then  if Prt.VC_ExtraSeat and !ent.VC_LegsSet then VC.HandleAnim_SetBones(ent, "Instant", "PassSeatLegs") ent.VC_LegsSet = true end  if Prt.VC_isSupported then  if !Prt.VC_Pl_Check_Dist_Time or CurTime() >= Prt.VC_Pl_Check_Dist_Time then Prt.VC_Pl_Check_Dist_Time = CurTime()+5 Prt.VC_Pl_Check_Dist = Prt:GetPos():Distance(LocalPlayer():EyePos()) < 1000 and !IsValid(Prt:GetParent()) end  VC.HandleAnimations(ent, Prt)  end  else  VC.ResetBones(ent)  end  end  for _,ent in pairs(ents.FindByClass("vc_generic")) do  local Prt = ent:GetParent()  if ent:GetNWBool("VC_AI_Driver", false) and IsValid(Prt) then  if Prt.VC_ExtraSeat and !ent.VC_LegsSet then VC.HandleAnim_SetBones(ent, "Instant", "PassSeatLegs") ent.VC_LegsSet = true end  if !Prt.VC_Pl_Check_Dist_Time or CurTime() >= Prt.VC_Pl_Check_Dist_Time then Prt.VC_Pl_Check_Dist_Time = CurTime()+5 Prt.VC_Pl_Check_Dist = Prt:GetPos():Distance(VC.GetViewPos()) < 1000 and !IsValid(Prt:GetParent()) end  if Prt.VC_Pl_Check_Dist then  VC.HandleAnimations(ent, Prt) end  else  VC.ResetBones(ent)  end  end  end end   hook.Add("VC_dataDownloaded", "VC_dataDownloadedAnimFix", function(mdl)  for k,ent in pairs(ents.FindByModel(mdl)) do  if VC.GetModel(ent) == mdl then  local drv = VC.GetDriver(ent)  if IsValid(Drv) then  VC.handleAnimEnterStartInstant(drv, ent)  end  end  end end)   function VC.anim_DoBendLegs(ply, ent, alsoExtraSeat)  if !VC.getSetting("Anim_PassengerLegBending") then return end    local ID = ply.VC_SeatID or ent:GetNWInt("VC_Key", 1)  if (ent.VC_ExtraSeat or alsoExtraSeat) then  local mainVeh = VC.getMainVehicle(ent)  if !VC.SeatGetOptionFromID(mainVeh, ID, "noBendLegs") and !VC.SeatGetOptionFromID(mainVeh, ID, "Lay") then  VC.HandleAnim_SetBones(ply, "Instant", "PassSeatLegs")  end  end end   function VC.anim_OnDriverEnter(ply, ent, alsoExtraSeat, isTesting)    if !IsValid(ent) or !VC.isVCModCompatible(ent) or ent.VC_ExtraSeat or alsoExtraSeat then return end   if isTesting then  VC.HandleAnim_SetBones(ply, "test", "test")  return  end   local data = VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent) if !data then return end   local animID = data["anim_OnDriverEnter"] if !animID or !VC.AnimDriverTypes[animID] then return end  animID = VC.AnimDriverTypes[animID].id   VC.HandleAnim_SetBones(ply, "Instant", animID) end  hook.Add("UpdateAnimation", "VC_UpdateAnimation", function(ply, vel, max)  if !VC.getSetting("Enabled") then return end   if VC.DoHandleAnim_Player then VC.DoHandleAnim_Player(ply) end end)    function VC.DoHandleAnim_Player(ply)      local ent = ply:GetVehicle()   if IsValid(ent) then  if ent.VC_animDoOverridePos then  ply:SetPos(ent:LocalToWorld(ent.VC_animDoOverridePos))  end  end      if VC.animDoTest then  local ent = ply:GetVehicle()  if IsValid(ent) then  if VC.anim_OnDriverEnter then VC.anim_OnDriverEnter(ply, ent, alsoExtraSeat, true) end  end  end end   function VC.DoHandleAnim_Initial(ply, ent, Veh, IsNotPod, VSC)      for _,ent in pairs(player.GetAll()) do  local Prt = ent:GetVehicle()  if IsValid(Prt) then  if Prt.VC_ExtraSeat and !ent.VC_LegsSet then VC.HandleAnim_SetBones(ent, "Instant", "PassSeatLegs") ent.VC_LegsSet = true end  if Prt.VC_isSupported then      end  else  VC.ResetBones(ent)  end  end                          end   function VC.HandleAnimations(ply, Veh)  if VC.InitializeData_Anim then                                   local sData = VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(Veh)   if sData.leftSteer then                end  end end  VC.InitializeData_Anim = true local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod??devcorner_sf:
local meta = FindMetaTable("Player")  if SERVER then  function meta:VC_CD_getVehicleData() return VC.CD.GetPlayerOptions(self) end  function meta:VC_CD_getOwnedVehicleData(ID) local ret = nil local data = VC.CD.GetPlayerOptions(self) if ID and data.Vehicles and data.Vehicles[ID] then ret = data.Vehicles[ID] end return ret end  function meta:VC_CD_addVehicle(ID) return VC.CD.addVehicle(self, ID, {}, true) end  function meta:VC_CD_removeVehicle(ID) return VC.CD.removeVehicle(self, ID, true) end end     local meta = FindMetaTable("Entity")  function meta:VC_CD_getInfo() return VC.CD_getInfo(self) end function meta:VC_RM_getInfo() return VC.RM_getInfo(self) end        local meta = FindMetaTable("Vehicle")  function meta:VC_fuelGetType() local ftype = self:GetNWInt("VC_FuelType", 0) return ftype, VC.FuelTypes[ftype].name end function meta:VC_getFuel(perc) local val = VC.getFuel(self) if perc then return val/VC.getFuelMax(self)*100 else return val end end meta.VC_GetFuel = meta.VC_getFuel meta.VC_fuelGet = meta.VC_getFuel  function meta:VC_getMaxFuel() return VC.getFuelMax(self) end meta.VC_GetMaxFuel = meta.VC_getMaxFuel meta.VC_fuelGetMax = meta.VC_getMaxFuel  function meta:VC_fuelSetMax(val) return VC.setFuelMax(val) end  function meta:VC_getHealth(perc)  if !VC.getServerSetting("Damage") then return 100 end  if CLIENT then  return self:GetNWInt("VC_HealthPerc", 1)*100  else  if perc then return (self.VC_HealthPerc or 1)*100 else return self.VC_Health end  end end meta.VC_GetHealth = meta.VC_getHealth  function meta:VC_getMaxHealth() return self.VC_MaxHealth end meta.VC_GetMaxHealth = meta.VC_getMaxHealth meta.VC_getHealthMax = meta.VC_getMaxHealth  function meta:VC_CD_getVehicleID() return VC.CD.getVehicleID(self) end function meta:VC_CD_getVehicleIDFromData() return VC.CD.getVehicleIDFromData(self) end function VC_CD_getVehicleDataFromID(val) return VC.CD.getVehicleDataFromID(val) end  function meta:VC_getName(default) return VC.getName(self, default) end meta.VC_GetName = meta.VC_getName  function meta:VC_getSpeedKmH()  local ent = self  if self.VC_ExtraSeat then local prt = self:GetParent() if IsValid(prt) then ent = prt end end  local vel = ent:GetVelocity():Dot(CLIENT and ent:GetRight() or ent:GetForward())  return vel and VC.VelocityToKmH(vel) or 0 end  meta.VC_GetSpeedKmH = meta.VC_getSpeedKmH  function VC_getCurrency() return VC.getCurCurrency() end function VC_fuelGetPrice(ftype) if !ftype then ftype = 1 end return math.Round(VC.getServerSetting("Fuel_PPL_"..ftype, 1), 2) end  function VC_getSettings() return VC.Settings end VC_GetSettings = VC_getSettings  function VC_setSettings(tbl) VC.SettingsSetNew(tbl) VC.SettingsChanged() end VC_SetSettings = VC_setSettings  function meta:VC_getDamagedParts()  local tbl = {}  if self.VC_DamagedObjects then  tbl = {}  if self.VC_DamagedObjects.wheel then tbl.wheel = table.Copy(self.VC_DamagedObjects.wheel) end  if self.VC_DamagedObjects.light then tbl.light = table.Copy(self.VC_DamagedObjects.light) end  if self.VC_DamagedObjects.exhaust then tbl.exhaust = table.Copy(self.VC_DamagedObjects.exhaust) end  end  return tbl end meta.VC_GetDamagedParts = meta.VC_getDamagedParts  function meta:VC_partIsDamaged(val) return VC.ObjectIsDamaged(self, val) end  function meta:VC_getStates() return self.VC_States or {} end meta.VC_GetStates = meta.VC_getStates  function meta:VC_setStates(val) self.VC_States = val end meta.VC_SetStates = meta.VC_setStates  function meta:VC_setRunningLights(on) if on then return VC.RunningLightsOn(self) else return VC.RunningLightsOff(self) end end meta.VC_SetRunningLights = meta.VC_setRunningLights  function meta:VC_setFogLights(on) if on then return VC.FogLightsOn(self) else return VC.FogLightsOff(self) end end meta.VC_SetFogLights = meta.VC_setFogLights  function meta:VC_setHazardLights(on) if on then return VC.HazardLightsOn(self) else return VC.HazardLightsOff(self) end end meta.VC_SetHazardLights = meta.VC_setHazardLights  function meta:VC_setHighBeams(on) if on then return VC.HighBeamsOn(self) else return VC.HighBeamsOff(self) end end meta.VC_SetHighBeams = meta.VC_setHighBeams  function meta:VC_setLowBeams(on) if on then return VC.LowBeamsOn(self) else return VC.LowBeamsOff(self) end end meta.VC_SetLowBeams = meta.VC_setLowBeams  function meta:VC_setTurnLightLeft(on) if on then return VC.TurnLightLeftOn(self) else return VC.TurnLightLeftOff(self) end end meta.VC_SetTurnLightLeft = meta.VC_setTurnLightLeft  function meta:VC_setTurnLightRight(on) if on then return VC.TurnLightRightOn(self) else return VC.TurnLightRightOff(self) end end meta.VC_SetTurnLightRight = meta.VC_setTurnLightRight  function meta:VC_setHorn(on) if on then return VC.HornOn(self) else return VC.HornOff(self) end end  function meta:VC_setCruiseControl(on) if on then return VC.CruiseOn(self) else return VC.CruiseOff(self) end end meta.VC_SetCruiseControl = meta.VC_setCruiseControl  function meta:VC_setELSManual(on) if on then return VC.ELS_ManualOn(self) else return VC.ELS_ManualOff(self) end end meta.VC_SetELSManual = meta.VC_setELSManual  function meta:VC_setELSLights(on) if on then return VC.ELS_LightsOn(self) else return VC.ELS_LightsOff(self) end end meta.VC_SetELSLights = meta.VC_setELSLights  function meta:VC_setELSLightsCycle() return VC.ELS_Lht_Cycle(self) end meta.VC_SetELSLightsCycle = meta.VC_setELSLightsCycle  function meta:VC_setELSSound(on) if on then return VC.ELS_SoundOn(self) else return VC.ELS_SoundOff(self) end end meta.VC_SetELSSound = meta.VC_setELSSound  function meta:VC_setELSSoundCycle() return VC.ELS_Snd_Cycle(self) end meta.VC_SetELSSoundCycle = meta.VC_setELSSoundCycle  function meta:VC_getELSLightsOn() return VC.is_ELSLightsOn(self) end meta.VC_GetELSLightsOn = meta.VC_getELSLightsOn  function meta:VC_getELSSoundOn() return VC.is_ELSSoundOn(self) end meta.VC_GetELSSoundOn = meta.VC_getELSSoundOn  function meta:VC_getCruise(val) return VC.getCruise(self) end function meta:VC_isTrailer(val) return VC.isTrailer(self) end function meta:VC_getTruck(val) return VC.getTruck(self) end function meta:VC_getTrailer(val) return VC.getTrailer(self) end function meta:VC_getAttachedTo(val) return VC.getAttachedTo(self) end function meta:VC_isTrailerSupported(val) return VC.isTrailerSupported(self) end function meta:VC_setOverride(key, val) return VC.setOverride(self, key, val) end function meta:VC_getOverride(key) return VC.getOverride(self, key) end  function meta:VC_isFuelConsumptionEnabled() return VC.isFuelConsumptionEnabled(self) end  if SERVER then  function meta:VC_getVehiclePersistanceData() return VC.getVehiclePersistanceData(self) end  function meta:VC_setVehiclePersistanceData(val) return VC.setVehiclePersistanceData(self, val) end   function meta:VC_lock() return VC.Lock(self) end  meta.VC_Lock = meta.VC_lock   function meta:VC_getExitData(pos)  local data, found = VC.getExitData(self, pos)  return found and data[1]  end   function meta:VC_UnLock() return VC.UnLock(self) end  meta.VC_unLock = meta.VC_UnLock   function meta:VC_isLocked() return VC.IsLocked(self) end  meta.VC_IsLocked = meta.VC_isLocked   function meta:VC_setDamagedParts(tbl) if IsValid(self) then return VC.SetDamagedObjects(self, tbl) end end  meta.VC_SetDamagedParts = meta.VC_setDamagedParts   function meta:VC_repairFull_Admin() if IsValid(self) then return VC.RepairVehicle_Admin(self) end end  meta.VC_RepairFull_Admin = meta.VC_repairFull_Admin   function meta:VC_damageFull_Admin() if IsValid(self) then return VC.DamageVehicle_Admin(self) end end  meta.VC_DamageFull_Admin = meta.VC_damageFull_Admin   function meta:VC_hasGodMode() if IsValid(self) then return self.VC_GodMode end end  meta.VC_HasGodMode = meta.VC_hasGodMode   function meta:VC_getSeatsAvailable() if IsValid(self) then return VC.SeatsGetAvailable(self) end end  meta.VC_GetSeatsAvailable = meta.VC_getSeatsAvailable   function meta:VC_setGodMode(val) if IsValid(self) then self.VC_GodMode = val end end  meta.VC_SetGodMode = meta.VC_setGodMode   function meta:VC_setHealth(val) if IsValid(self) then return VC.SetHealth(self, val) end end  function meta:VC_setHealthMax(val) if IsValid(self) then return VC.SetHealthMax(self, val) end end   function meta:VC_damageHealth(val) if IsValid(self) then return VC.DamageHealth(self, val) end end  meta.VC_DamageHealth = meta.VC_damageHealth   function meta:VC_repairHealth(val) if IsValid(self) then return VC.RepairHealth(self, val) end end  meta.VC_RepairHealth = meta.VC_repairHealth   function meta:VC_explodeEngine(silent) if IsValid(self) then return VC.ExplodeEngine(self, silent) end end  meta.VC_ExplodeEngine = meta.VC_explodeEngine   function meta:VC_doBackfire(damageHealth, damagedOnly) if IsValid(self) then return VC.DoBackFire(self, damageHealth, damagedOnly) end end   function meta:VC_fuelCanisterSet(val) if IsValid(self) then if self:GetClass() == "vc_jerrycan" then self.VC_FuelAmount = val self:SetNWInt("VC_FuelAmount", self.VC_FuelAmount or 0) else self.VC_Storage = val self:SetNWInt("VC_Storage", val) end end end  meta.VC_Fuel_Canister_Set = meta.VC_fuelCanisterSet   function meta:VC_fuelSet(val) if IsValid(self) then return VC.setFuel(self, val) end end   function meta:VC_fuelAdd(val) if IsValid(self) then return VC.Refuel(self, val) end end  meta.VC_Fuel_Add = meta.VC_fuelAdd   function meta:VC_fuelSetConsumptionMultiplier(val) self.VC_fuelConsumptionMultiplier = val end   function meta:VC_fuelConsume(val) if IsValid(self) then return VC.FuelConsume(self, val) end end  meta.VC_Fuel_Consume = meta.VC_fuelConsume   function meta:VC_fuelConsumptionSetEnabled(val) if IsValid(self) then return VC.setFuelConsumptionEnabled(self, val) end end   function meta:VC_setCruiseSpeed(val) return VC.CruiseSetSpeed(self, val) end  meta.VC_SetCruiseSpeed = meta.VC_setCruiseSpeed   function meta:VC_setHornCustom(snd, pitch, vol, lvl) return VC.SetHornCustom(self, snd, pitch, vol, lvl) end  meta.VC_SetHornCustom = meta.VC_setHornCustom   function meta:VC_detachTrailer() return VC.Trailer_Detach(self) end  meta.VC_DetachTrailer = meta.VC_detachTrailer   function meta:VC_clearSeats() return VC.ClearSeats(self) end  meta.VC_ClearSeats = meta.VC_clearSeats   function meta:VC_getPlayers() return VC.GetDrivers(self) end  meta.VC_GetPlayers = meta.VC_getPlayers   function meta:VC_CD_menuOpen(ply) return VC.CD.RequestOpen(self, ply) end  meta.VC_Menu_CD_Open = meta.VC_CD_menuOpen   function meta:VC_damagePart(obj, int, att, inf) return VC.DamagePart(self, obj, int, att, inf) end  meta.VC_DamagePart = meta.VC_damagePart   function meta:VC_repairPart(obj, int) return VC.RepairPart(self, obj, int) end  meta.VC_RepairPart = meta.VC_repairPart   function meta:VC_getLights(obj, int) return VC.getLights(self) end   function meta:VC_CD_returnVehicle(force) return VC.CD.ReturnVehicle(self, force) end  meta.VC_CarDealerReturnVehicle = meta.VC_CD_returnVehicle else  function meta:VC_CD_editMenuOpen() return VC.CD.open_menu_cardealer_edit(self) end  meta.VC_Menu_CD_Edit_Open = meta.VC_CD_editMenuOpen end local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH mlogs/language/sh_language.lua:
   local selectedLanguage = GetConVar("gmod_language"):GetString()    mLogs.languages = mLogs.languages or {} mLogs.logTranslations = mLogs.logTranslations or {}  function mLogs.addLanguage(name, languageTable, logTranslations) 	mLogs.languages[name] = languageTable 	mLogs.logTranslations[name] = logTranslations end  function mLogs.getLang(name, ...) 	local lang = mLogs.languages[selectedLanguage] or mLogs.languages.en or {} 	return (lang[name] or mLogs.languages.en[name] or mLogs.languages.default[name]) and string.format(lang[name] or mLogs.languages.en[name] or mLogs.languages.default[name], ...) or nil end  function mLogs.getLogTranslation(name) 	local lang = mLogs.logTranslations[selectedLanguage] or mLogs.logTranslations.en or {} 	return (lang[name] or mLogs.logTranslations.en[name] or mLogs.logTranslations.default[name]) or nil end  function mLogs.formatMoney(amt) 	if(not DarkRP)then return amt end 	return DarkRP.formatMoney(tonumber(amt)) end    local path = mLogs.root .."language/languages"  for k,v in pairs(file.Find(path .. "/*.lua", "LUA")) do 	local p = path .. "/" .. v 	if(SERVER)then 		AddCSLuaFile(p) 		if(mCompile)then 			mCompile.RegisterFile("mlogs", p, "shared") 		end 	end 	if(mLib and mLib.Include)then 		mLib.Include(p) 	else 		include(p) 	end end  
--PATH mlogs/logger/cl_logger.lua:
   mLogs.logger.logListeners = mLogs.logger.logListeners or {}  function mLogs.addLogRequestListener(panel) 	mLogs.logger.logListeners[panel] = true end  function mLogs.removeLogRequestListener(panel) 	mLogs.logger.logListeners[panel] = nil end  function mLogs.getHookFromTag(category,tag) 	if not mLogs.categories[category] then return false end 	for _,Hook in pairs(mLogs.categories[category].hooks) do 		if(Hook.tag == tag)then 			return {name=Hook.name,tag=Hook.tag,category=category} 		end 	end end  mLogs.AddInterface("logs_request", function() 	local pageInfo, slogData = net.ReadTable(), net.ReadString() 	if not pageInfo or not slogData then return end 	local logData = mLogs.decompress(slogData or "") 	if(pageInfo and logData)then 		for _,pnl in pairs(table.GetKeys(mLogs.logger.logListeners)) do 			if(ValidPanel(pnl) and pnl.OnReceiveLogs)then 				pnl:OnReceiveLogs(pageInfo,logData) 			end 		end 	end end)  hook.Run("mLogs_systemInit") 
--PATH mlogs/logger/cl_defs.lua:
   mLogs.logger.defCards = mLogs.logger.defCards or {} mLogs.logger.localState = mLogs.logger.localState or {} mLogs.logger.localStateMutations = mLogs.logger.localStateMutations or {}  function mLogs.setDefinitionCard(Type,card) 	mLogs.logger.defCards[Type] = card end  function mLogs.getDefinitionCard(Type) 	return mLogs.logger.defCards[Type] or false end  function mLogs.logger.createTag(str,icon)     return {icon=icon,str=str} end  function mLogs.logger.createCard(header,desc,img,tags)     return {header=header,desc=desc,img=img,tags=tags} end  function mLogs.logger.updateLocalState()     for k,v in pairs(mLogs.logger.localStateMutations)do         v(mLogs.logger.localState)     end end  function mLogs.logger.addLocalStateMutation(mutation)     table.insert(mLogs.logger.localStateMutations,mutation) end  mLogs.logger.addLocalStateMutation(function(state)     local tab = {}     for k,v in pairs(player.GetAll()) do         if not IsValid(v) then return end         tab[v:SteamID()] = v     end           state.players = tab end) mLogs.logger.updateLocalState() mLogs.setDefinitionCard("player", function(pnl,data)     if(not data.sid) then return end     local ply = mLogs.logger.localState.players[data.sid]     local sid64 = util.SteamIDTo64(data.sid or "")     local img = pnl:Add("AvatarImage")     img:SetSteamID(sid64, 64)     img:SetMouseInputEnabled(true)     img:SetCursor("hand")     img.OnMousePressed = function(s,e)          if(e == MOUSE_LEFT)then              gui.OpenURL(                 "https://steamcommunity.com/profiles/"                 .. sid64                 .. "/"             )          end      end          local tags = {}     if(ply)then         table.insert(tags,mLogs.logger.createTag(mLogs.getLang("user_online"),"icon16/user_green.png"))     else         table.insert(tags,mLogs.logger.createTag(mLogs.getLang("user_offline"),"icon16/user_red.png"))     end          local defs = mLogs.logger.defInfo["player"]     for key, info in pairs(data) do         if(defs[key] and defs[key].icon)then             local t = tostring(info)             if(key == "armor" or key == "hp")then                 t = string.sub(info,3)             end             table.insert(tags,mLogs.logger.createTag(defs[key].name .. ": " .. t,defs[key].icon))         end     end      return mLogs.logger.createCard(         data.name or "",         data.sid or "",         img,         tags     ) end)  local function createModelCard(pnl,title,desc,mdl)     local img     if(util.IsValidModel(mdl))then         img = pnl:Add("ModelImage")         img:SetModel(mdl)     else         img = pnl:Add("DPanel")         img.Paint = function(self,w,h)              surface.SetDrawColor(color_white)             surface.SetMaterial(mLogs.getPNG("icon16/cross.png"))             surface.DrawTexturedRect(w*0.5 - 8, h*0.5-8, 16, 16)         end     end     return mLogs.logger.createCard(title or "",desc or "",img) end  mLogs.setDefinitionCard("vehicle", function(pnl,data)     if(not data.veh) then return end     local vehData = list.Get("Vehicles")[data.veh]     if(vehData and vehData.Name and vehData.Model)then         return createModelCard(pnl,vehData.Name,data.class or "",vehData.Model)     end end)  mLogs.setDefinitionCard("entity", function(pnl,data)     if(not (data.class and data.model)) then return end     return createModelCard(         pnl,         mLogs.upper(data.class == "prop_physics" and mLogs.getLogTranslation("prop")          or (list.Get("SpawnableEntities")[data.class] and list.Get("SpawnableEntities")[data.class].PrintName)         or mLogs.getLogTranslation("entity")),         data.class == "prop_physics" and data.model or data.class,         data.model     ) end)  mLogs.setDefinitionCard("weapon", function(pnl,data)     if(not data.class) then return end     local wepData = weapons.GetStored(data.class)     if(wepData and wepData.PrintName and wepData.WorldModel)then         return createModelCard(pnl,wepData.PrintName,data.class or "",wepData.WorldModel)     end end) 
--PATH mlogs/settings/sh_settings.lua:
   mLogs.settings = mLogs.settings or {} mLogs.settings.types = mLogs.settings.types or {} mLogs.settings.categories = mLogs.settings.categories or {} mLogs.settings.options = mLogs.settings.options or {}  function mLogs.settings.addType(name,validation,extra)     local tab = { 		name = name, 		validation = validation, 	}     table.Merge(tab,extra or {}) 	mLogs.settings.types[name] =tab  end  function mLogs.settings.getType(name)     return mLogs.settings.types[name] or false end  function mLogs.settings.addCategory(name,tag,color)     mLogs.settings.categories[tag] = {name=name,tag=tag,color=color,sub={}} end  function mLogs.settings.getCategory(tag)     return mLogs.settings.categories[tag] or false end  function mLogs.settings.getSubcategory(c_tag,s_tag)     return mLogs.settings.getCategory(c_tag) and mLogs.settings.getCategory(c_tag)["sub"][s_tag] or false end   function mLogs.settings.addSubcategory(name,c_tag,s_tag,weight,skipSave)     if not mLogs.settings.categories[c_tag] then return end     mLogs.settings.categories[c_tag]["sub"][s_tag] = {name=name,tag=s_tag,options={},weight=weight,skipSave=skipSave} end  function mLogs.settings.addOption(c_tag,s_tag,data)     if(not mLogs.settings.getSubcategory(c_tag,s_tag)) then return end     if(CLIENT and c_tag == "server")then         data.get = function() if(data.serverValue != nil) then return data.serverValue else return data.default end end     end     table.insert(mLogs.settings.getSubcategory(c_tag,s_tag).options,data)     if(data.tag)then         mLogs.settings.options[c_tag] = mLogs.settings.options[c_tag] or {}         mLogs.settings.options[c_tag][s_tag] = mLogs.settings.options[c_tag][s_tag] or {}         mLogs.settings.options[c_tag][s_tag][data.tag] = data     end end  function mLogs.settings.getOption(c_tag,s_tag,o_tag)     return mLogs.settings.options[c_tag]          and mLogs.settings.options[c_tag][s_tag]          and mLogs.settings.options[c_tag][s_tag][o_tag] end  function mLogs.settings.setServerOptionValue(c_tag,s_tag,o_tag,val)     local option = mLogs.settings.getOption(c_tag,s_tag,o_tag)     if(option)then         option.serverValue = val     end end  function mLogs.settings.addSpacer(str,c_tag,s_tag)     mLogs.settings.addOption(c_tag,s_tag,{         title = str,         type = "spacer"     }) end    mLogs.settings.addCategory(mLogs.getLang("server"),"server",Color(65, 131, 215)) mLogs.settings.addCategory(mLogs.getLang("client"),"client",Color(243, 156, 18)) 
--PATH mlogs/settings/types/sh_color.lua:
     mLogs.settings.addType("color",function(d)     return d.r and d.g and d.b      and type(d.r) == "number"     and type(d.g) == "number"     and type(d.b) == "number" end,{ 	sqlSet = function(data) return util.TableToJSON(data) end, 	sqlGet = function(data) return util.JSONToTable(data) end }) 
--PATH mlogs/elements/logs/cl_logsinfo.lua:
   local PANEL = {}  function PANEL:Init() 	 	mLogs.logger.updateLocalState() 	 	self.basicInfo = self:Add("mLogs_logsInfo_basic") 	self.fullLog = self:Add("mLogs_stringEntry") 	self.fullLog:SetMultiline(true) 	self.fullLog.AllowInput = function() return true end 	self.fullLog:SetFont("mLogs_fullLog")  	self.cardList = self:Add("mLogs_logsInfo_cards") end  function PANEL:Paint(w,h)  	if(mLogs.config.blur.bg)then 		mLogs.drawBlur(self,w,h) 	else 		draw.RoundedBox(0,0,0,w,h,mLogs.config.colors.border) 		draw.RoundedBox(0,1,1,w-2,h-2,mLogs.config.colors.bg) 	end      if(not self.logData)then         draw.SimpleText(mLogs.getLang("select_log_info"), "mLogs_large", w*0.5, h*0.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER) 		return     end end  function PANEL:SetLog(logData,hookData) 	self.logData = logData 	self.hookData = hookData 	self.categoryData = mLogs.categories[hookData.category] or {} 	self.basicInfo:SetInfo(hookData.name,self.categoryData.color or nil,logData.time) 	self.fullLog:SetText(logData.str) 	self.cardList:SetData(logData.raw and logData.raw.data) end  function PANEL:PerformLayout(w,h) 	self.basicInfo:SetSize(w*0.2,h)  	self.fullLog:SetPos(w*0.2,0) 	self.fullLog:SetSize(w*0.35,h) 	 	self.cardList:SetSize(w*0.45,48) 	self.cardList:SetPos(w*0.55,h*0.5 - self.cardList:GetTall()*0.5) end vgui.Register( "mLogs_logsInfo", PANEL, "DPanel" )  local PANEL = {}  function PANEL:Init() 	self.Category = self:Add("mLogs_button") 	self.Category:SetOutline(true)  	self.Time = self:Add("mLogs_button") 	self.Time:SetOutline(true) end  function PANEL:SetInfo(category,color,time) 	if(color)then 		self.Category:SetBGColor(color) 		self.Category:SetHoverColor(Color(color.r-10,color.g-10,color.b-10, color.a-10)) 	end 	self.Category:SetText(category) 	self.Category.DoClick = function() mLogs.copy(category) end  	self.Time:SetText(time) 	self.Time.DoClick = function() mLogs.copy(time) end end  function PANEL:Paint(w,h) 	  end  function PANEL:PerformLayout(w,h) 	self.Category:SetSize(w,h*0.5) 	self.Time:SetPos(0,h*0.5 - 1) 	self.Time:SetSize(w,h*0.5 + 1) end vgui.Register( "mLogs_logsInfo_basic", PANEL, "DPanel" )  local PANEL = {}  function PANEL:Init() 	self.layout = self:Add("mLogs_horizontalScroller") 	self.layout:SetOverlap(-14) end  function PANEL:SetData(data) 	if(not data) then return end 	self.layout:Clear() 	for k,v in pairs(data or {}) do 		if(type(v) != "table" or not v.type) then continue end 		if(mLogs.getDefinitionCard(v.type))then 			local cardData = mLogs.getDefinitionCard(v.type)(self,v) 			if(cardData)then 				self:CreateCard(cardData) 			end 		end 	end 	self:InvalidateLayout() end  function PANEL:CreateCard(cardData) 	local card = self.layout:Add("mLogs_logsInfo_card") 	self.layout:AddPanel(card) 	card:SetData(cardData) end  function PANEL:Paint(w,h) end local cardWidth = 196 function PANEL:PerformLayout(w,h) 	self.layout:SetSize(w,h)    	for k,v in pairs(self.layout.Panels or {})do 		if(ValidPanel(v))then 			v:InvalidateLayout(true) 			v:SetSize(cardWidth +(v.extraW or 0),h) 		end 	end  	self.layout:InvalidateLayout() 	  	  end vgui.Register( "mLogs_logsInfo_cards", PANEL, "DPanel" )  local PANEL = {}  function PANEL:Init() 	self.Header = self:Add("mLogs_button") 	self.Header:SetOutline(true) 	self.Header:SetFont("mLogs_cardText") 	self.Header:SetLeftAlign(true) 	self.Header.DoClick = function(s) 		mLogs.copy(s:GetText()) 	end  	self.Desc = self:Add("mLogs_button") 	self.Desc:SetOutline(true) 	self.Desc:SetFont("mLogs_cardText") 	self.Desc:SetLeftAlign(true) 	self.Desc.DoClick = function(s) 		mLogs.copy(s:GetText()) 	end  	self.layout = self:Add("DIconLayout") 	self.layout:SetSpaceX(4) 	self.layout:SetSpaceY(4)  	self.iconSize = 16 end  function PANEL:SetData(data) 	if(not data) then return end 	if(ValidPanel(data.img))then 		data.img:SetParent(self) 		self.img = data.img 	end 	self.Header:SetText(data.header) 	self.Desc:SetText(data.desc) 	 	self.layout:Clear() 	for k,v in pairs(data.tags or {}) do 		local icon = self.layout:Add("DImageButton") 		icon:SetSize(self.iconSize,self.iconSize) 		icon:SetImage(v.icon) 		icon:SetTooltip(v.str) 		icon.DoClick = function() 			mLogs.copy(v.str) 		end 	end end  function PANEL:Paint(w,h) 	draw.RoundedBox(0,0,0,w,h,mLogs.config.colors.panel) end  function PANEL:PerformLayout(w,h) 	if(ValidPanel(self.img))then 		self.img:SetSize(h,h) 	end  	self.Header:SetSize(cardWidth - h,h*0.5) 	self.Header:SetPos(h,0)  	self.Desc:SetSize(cardWidth - h,h*0.5 -1) 	self.Desc:SetPos(h,h*0.5+1) 	 	self.layout:SetPos(cardWidth+4,4)  	local num = #self.layout:GetChildren() 	local even = num % 2 == 0 	local totalW = ((even and 14 or 18)+self.layout:GetSpaceX()) * #self.layout:GetChildren()*0.5  	self.layout:SetSize(totalW +(num>0 and 4 or 0) ,h-8) 	self.layout:Layout() 	 	self.extraW = self.layout:GetWide() +(num>0 and 8 or 0)  end vgui.Register( "mLogs_logsInfo_card", PANEL, "DPanel" ) 
--PATH mlogs/elements/logs/cl_logsadvancepanel.lua:
   local PANEL = {}  function PANEL:Init()     self.sTypes = mLogs.logger.getSearchTypes() or {}     self.currentChoice = nil      self.types = self:Add("DComboBox")     self.types:SetValue(mLogs.getLang("select_type"))     self.types.OnSelect = function( s, _i, _v, data )         if(not (data and self.sTypes[data])) then return end         if(self.currentChoice == _v)then return end         self.currentChoice = _v         self:PopulateData(self.sTypes[data].getOptions())     end      for k,v in pairs(self.sTypes) do         self.types:AddChoice(v.name,k)     end      self.scroll = self:Add("mLogs_scrollPanel") 	self.layout = self.scroll:Add("DIconLayout")     self.layout:SetSpaceY(-1)      end  function PANEL:PopulateData(data)     if not data then return end     self.layout:Clear()     for k,v in pairs(data) do         local btn = self.layout:Add("mLogs_button")         btn:SetText(v.str)         btn:SetFont("mLogs_clearText")         btn:SetLeftAlign(true)         btn:SetOutline(true)         btn.extraData = v.data         btn.DoClick = function(s)             self:AddToCriteria(v)         end     end end  function PANEL:AddToCriteria(data)     if(self.OnAdd)then         self.OnAdd(data)     end end  function PANEL:Paint(w,h) 	draw.RoundedBox(0,0,0,w,h,mLogs.config.colors.border) 	draw.RoundedBox(0,1,1,w-2,h-2,mLogs.config.colors.bg)      draw.RoundedBox(0, 0, 0, w, h*0.15, mLogs.config.colors.hover)     draw.SimpleText(mLogs.getLang("available_tags"), "mLogs_clearText", w*0.5, h*0.075, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER) end  function PANEL:PerformLayout(w,h)     self.types:SetPos(0,h*0.15)     self.types:SetSize(w,h*0.1)      self.scroll:SetPos(0,h*0.25)     self.scroll:SetSize(w,h*0.75)      for k,v in pairs(self.layout:GetChildren() or {}) do         v:SetSize(w,24)     end  	self.layout:SetSize(w,select(2,self.layout:ChildrenSize())) 	self.layout:Layout() end  vgui.Register( "mLogs_advSearchTags", PANEL, "DPanel" )   local PANEL = {}  function PANEL:Init()     self.scroll = self:Add("mLogs_scrollPanel") 	self.layout = self.scroll:Add("DIconLayout")     self.layout:SetSpaceY(-1) end  function PANEL:AddCriteria(data)     if(self.limit and #self.layout:GetChildren() > self.limit)then return end      for k,v in pairs(self.layout:GetChildren() or {})do         if(ValidPanel(v) and v:GetText() == data.str)then             return         end     end     local btn = self.layout:Add("mLogs_button")     btn:SetText(data.str)     btn:SetFont("mLogs_clearText")     btn:SetLeftAlign(true)     btn:SetOutline(true)     btn.extraData = data     btn.DoClick = function(s)         s:Remove()         self:InvalidateLayout()     end     btn.PaintOver = function(self,w,h)         if(self.Hovered)then             surface.SetDrawColor(color_white)             surface.SetMaterial(mLogs.getPNG("icon16/cross.png"))             local size = h*0.7             surface.DrawTexturedRect(w-size-4,h*0.5 - size*0.5,size,size)         end     end end  function PANEL:GetCriteria()     local crit = {}     for k,v in pairs(self.layout:GetChildren())do         if(ValidPanel(v) and v.extraData)then             table.insert(crit,v.extraData)         end     end     return crit end  function PANEL:Paint(w,h) 	draw.RoundedBox(0,0,0,w,h,mLogs.config.colors.border) 	draw.RoundedBox(0,1,1,w-2,h-2,mLogs.config.colors.bg)      draw.RoundedBox(0, 0, 0, w, h*0.15, mLogs.config.colors.hover)     draw.SimpleText(mLogs.getLang("criteria"), "mLogs_clearText", w*0.5, h*0.075, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER) end  function PANEL:PerformLayout(w,h)     self.scroll:SetPos(0,h*0.15)     self.scroll:SetSize(w,h*0.85)      for k,v in pairs(self.layout:GetChildren() or {}) do         v:SetSize(w,24)     end  	self.layout:SetSize(w,select(2,self.layout:ChildrenSize())) 	self.layout:Layout() end  vgui.Register( "mLogs_advSearchCriteria", PANEL, "DPanel" ) 
--PATH mlogs/elements/settings/types/cl_logger.lua:
   local PANEL = {}  DEFINE_BASECLASS("mLogs_settingsBase")  function PANEL:Init() 	self.action = self:Add("DIconLayout") 	self.options = {} 	for tag,data in pairs(mLogs.logger.optionsData) do 		self:AddOption(tag,data) 	end 	if(ValidPanel(self.reset))then 		self.reset:SetVisible(false) 	end end  function PANEL:AddOption(tag,data) 	local option = self.action:Add("DCheckBoxLabel") 	option:SetText(data.name) 	option:SetTooltip(data.desc) 	option:SizeToContents() 	self.options[tag] = option end  function PANEL:GetData() 	local data = {} 	for tag,option in pairs(self.options) do 		data[tag] = tobool(option:GetChecked()) 	end 	return data end  function PANEL:OnReset() end  function PANEL:OnOption(option,data) 	if (not data) then return end 	if(mLogs.logger.optionsExtra[option.c_tag] and mLogs.logger.optionsExtra[option.c_tag][option.h_tag])then 		for k,v in pairs(mLogs.logger.optionsExtra[option.c_tag][option.h_tag])do 			self:AddOption(k,v) 		end 	end 	for tag,val in pairs(data) do 		if(self.options[tag])then 			self.options[tag]:SetChecked(val) 		end 	end end  function PANEL:PerformLayout(w,h)     BaseClass.PerformLayout(self,w,h) 	local optionHeight = 0 	local amt = 0 	for k,v in pairs(self.options) do 		if(ValidPanel(v))then 			v:SetWide(self.action:GetWide()) 			optionHeight = v:GetTall() 			amt = amt + 1 		end 	end 	self.action:SizeToContentsY(12) 	self.action:SetPos(self.descSize + w*0.15 - self.action:GetWide()*0.5,h*0.5 - ((optionHeight * amt)*0.5)) 	self.forceHeight = self.action:GetTall()  end  vgui.Register( "mLogs_settingsOption_logger", PANEL, "mLogs_settingsBase" ) 
--PATH mlogs/elements/settings/cl_sub.lua:
   local PANEL = {}  DEFINE_BASECLASS("mLogs_button")  AccessorFunc(PANEL, "m_cColor", "Color") AccessorFunc(PANEL, "m_sText", "Text")  function PANEL:Init() 	self:SetColor(color_white) 	self:SetText("") 	self.gradTime = 0.1 end  function PANEL:SetData(data) 	self:SetText(data.name) 	self.data = data end  function PANEL:GetData() 	return self.data end  function PANEL:Paint(w,h) 	BaseClass.Paint(self,w,h) 	 	if(not self.Hovered and self.LastHovered)then 		self.LastHovered = nil 	elseif(self.Hovered and not self.LastHovered)then 		self.LastHovered = CurTime() 	end 	 	if(self.LastHovered or self:GetClicked())then 		local frac = self:GetClicked() and 1 or math.Clamp((CurTime()-self.LastHovered)/self.gradTime,0,1) 		surface.SetDrawColor(self:GetColor()) 		surface.SetMaterial(mLogs.getPNG("vgui/gradient-l")) 		surface.DrawTexturedRect(0,0,self:GetClicked() and w*0.5 or Lerp(frac,0,w*0.5),h) 	end 	 	draw.SimpleText(self:GetText() or "", "mLogs_hook", 8, h*0.5, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER) 	draw.RoundedBox(0,0,h-1,w,1,mLogs.config.colors.panel) end  function PANEL:PerformLayout(w,h) end  vgui.Register( "mLogs_settingsSub", PANEL, "mLogs_button" ) 
--PATH addons/111mod/lua/entities/armour_station/cl_init.lua:
--