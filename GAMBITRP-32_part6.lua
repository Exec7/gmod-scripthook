--Stealed clientside server code by exechack.cc
--Hostname: ⋙ GAMBITRP ╽ ПОДАРКИ ╽ FREE VIP ⋘ - Part 6/10 - 06/04/2025


--PATH addons/plib_v5/lua/plib/extensions/player.lua:
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


-- meta
function PLAYER:__index(key)
	return PLAYER[key] or ENTITY[key] or GetTable(self)[key]
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


--PATH addons/111mod/lua/autorun/advert.lua:
local function init()
	DarkRP.removeChatCommand("advert")
	DarkRP.declareChatCommand({
		command = "advert",
		description = "Displays an advertisement to everyone in chat.",
		delay = 1.5
	})
	if (SERVER) then
		DarkRP.defineChatCommand("advert",function(ply,args)
			if args == "" then
				DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
				return ""
			end
			local DoSay = function(text)
				if text == "" then
					DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
					return
				end
				for k,v in player.Iterator() do
					local col = team.GetColor(ply:Team())
					DarkRP.talkToPerson(v, col, "[Реклама] " .. ply:Nick(), Color(255, 255, 0, 255), text, ply)
				end
			end
			hook.Call("playerAdverted", nil, ply, args)
			return args, DoSay
		end,1.5)
	end
end
if (SERVER) then
	if (#player.GetAll() > 0) then
		init()
	else
		hook.Add("PlayerInitialSpawn","dfca-load",function()
			init()
		end)
	end
else
	hook.Add("InitPostEntity","dfca-load",function()
		init()
	end)
end
--PATH addons/accessory/lua/accessory/cl_obj_player_extend.lua:
local meta = FindMetaTable("Player")

function meta:SH_AddAccessory(id, nopreview)
	local acc = SH_ACC:GetAccessory(id)
	if (!acc) then
		return false
	end

	self.SH_Accessories = self.SH_Accessories or {}

	if (self.SH_Accessories[id]) then
		return false
	end

	local mdl = acc.mdl:lower()
	local offset = SH_ACC:GetOffset(mdl, self)
	assert(offset, "model '" .. acc.mdl .. "' does not have a registered offset")

	local cs = ents.CreateClientProp()
	if (IsValid(cs)) then
		cs.m_sAccOwner = self:SteamID()
		cs.m_iOccupiedSlots = acc.slots
		cs.m_Offset = offset
		cs.m_sModel = mdl
		cs.m_JobNames = acc.jobs or nil
		cs.m_JobNamesExclude = acc.jobsexclude or nil
		cs:SetModel(mdl)
		cs:SetNoDraw(true)
		cs:SetSkin(acc.skin)
		-- TODO: bodygroups
		cs:SetMaterial(acc.material)
		cs:SetColor(acc.color)
		cs:SetModelScale(acc.scale, 0)
		cs:SetPredictable(false)
		cs:DrawShadow(false)
		cs:DestroyShadow()
		cs:SetMoveType(MOVETYPE_NONE)
		cs:Spawn()

		self.SH_Accessories[id] = cs
	end

	-- Network adjustment if need be
	if (!nopreview and self == LocalPlayer() and self:SH_CanAdjustAccessories()) then
		self:SH_BroadcastAdjustment(mdl)
	end

	return cs
end

function meta:SH_RemoveAccessory(id)
	self.SH_Accessories = self.SH_Accessories or {}

	if (!self.SH_Accessories[id]) then
		return false
	end

	SafeRemoveEntity(self.SH_Accessories[id])
	self.SH_Accessories[id] = nil

	return true
end

function meta:SH_RemoveAllAccessories(id)
	if (!self.SH_Accessories) then
		return false
	end

	for id, cs in pairs (self.SH_Accessories) do
		SafeRemoveEntity(cs)
	end
	self.SH_Accessories = {}

	return true
end

function meta:SH_ResetAdjustments(mdl)
	if (!self.SH_AccessoryAdjust) then
		return end

	self.SH_AccessoryAdjust[mdl] = nil
	self:SH_SaveAdjustments()

	net.Start("SH_ACC_ADJUST_RESET")
		net.WriteString(mdl)
	net.SendToServer()
end

function meta:SH_SaveAdjustments()
	if (!self.SH_AccessoryAdjust) then
		return end

	local tosave = {}

	for mdl, adj in pairs (self.SH_AccessoryAdjust) do
		tosave[mdl] = {
			px = adj.px or 0,
			py = adj.py or 0,
			pz = adj.pz or 0,
			ax = adj.ax or 0,
			ay = adj.ay or 0,
			az = adj.az or 0,
			sx = adj.sx or 1,
			sy = adj.sy or 1,
			sz = adj.sz or 1,
		}

		local t = tosave[mdl]
		if (t.px == 0 and t.py == 0 and t.pz == 0 and t.ax == 0 and t.ay == 0 and t.az == 0 and t.sx == 1 and t.sy == 1 and t.sz == 1) then
			continue end -- gtho
	end

	file.Write("sh_accessory_adjustments.txt", util.TableToJSON(tosave))
end

function meta:SH_BroadcastAdjustment(mdl)
	local adj = self.SH_AccessoryAdjust[mdl]
	if (adj) then
		net.Start("SH_ACC_ADJUST")
			net.WriteString(mdl)

			net.WriteVector(Vector(adj.px or 0, adj.py or 0, adj.pz or 0))
			net.WriteAngle(Angle(adj.ax or 0, adj.ay or 0, adj.az or 0))
			net.WriteVector(Vector(adj.sx or 0, adj.sy or 0, adj.sz or 0))
		net.SendToServer()
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

--PATH addons/the_cocaine_factory/lua/ch_cocaine/shared/cocaine_config.lua:
TCF = {}
TCF.Config = {}

-- SET LANGUAGE
-- Available languages: English: en - Danish: da - German: de - Polish: pl - Russian: ru - Spanish: es - French: fr - Chinese: cn
TCF.Config.Language = "ru" -- Set the language of the script.

-- GENERAL Config
TCF.Config.RemoveEntsOnTeamChange = true -- Should all cocaine related entities owned by the player be removed when changing to a non Criminal team (from list below)?
TCF.Config.RemoveEntsOnDC = true -- Same as above, but on disconnect all owned entities are removed.

-- GENERAL TEAM CONFIGURATION
TCF.Config.CriminalTeams = { -- These teams are allowed to interact with the cocaine buyer NPC.
	"Наркодилер"
}

TCF.Config.PoliceTeams = { -- Police teams. These teams are NOT allowed to use the cocaine buyer NPC and can also confiscate packed boxes with cocaine.
	"Офицер Полиции",
    "Начальник полиции",
    "Спецназ",
    "Медик спецназа",
    "Снайпер спецназа",
    "Командир спецназа",
    "Джаггернаут",
    "Агент FBI"
}

-- COCAINE BUYER NPC
TCF.Config.NPCDisplayName = "Пабло Эскобар" -- The display name shown above the NPC
TCF.Config.NPCDisplayDescription = "Продай мне свои пакеты кокаина" -- The description displayed above the NPC.

TCF.Config.SellDistance = 150 -- How far away can the NPC detect your drug holder.
TCF.Config.RandomPayoutInterval = 300 -- How many seconds before the randomized payout is changed again. It randomizes the settings below.

TCF.Config.PayPerPackMin = 35000 -- How much should each cocaine pack be worth? Minimum value (without any donator bonuses)
TCF.Config.PayPerPackMax = 40000 -- How much should each cocaine pack be worth? Maximum value (without any donator bonuses)

TCF.Config.DisplayUIDistance = 300000 -- How far away from the drug dealer will the over-heads display show up? [Default = 300000]

-- STOVE ENTITY
TCF.Config.StoveHealth = 250 -- The amount of health the stove entity have.
TCF.Config.GasButtonDelay = 0.75 -- The amount of seconds delay there is when switching gas on/off on the stove.

TCF.Config.CookingSecondsMinimum = 30 -- Amount of seconds the pot must cook for MINIMUM before able to finish
TCF.Config.ChanceToFinish = 2 -- Default value is 2 which means there is a 50% chance of finishing after 30 seconds and when celcius is 100 (green area on arrow). If you put 3, there will be a 33% chance. So HIGHER number = lower chance to finish fast

TCF.Config.StoveExplosion = true -- Should the stove explode when destroyed. true/false
TCF.Config.ShowStoveHealth = true -- Enable or disable the health bar display on the stove.

TCF.Config.StoveSmokeEffect = true -- Should the pots on the stove emit smoke effect when cooking/turned on. true/false
TCF.Config.MinTemperatureForSmoke = 10 -- Minimum temperature the pot has to have before the smoke appears. It goes from 0 - 100.

TCF.Config.EnableOverCooking = true -- Should we enable overcooking or not?
TCF.Config.OverCookingTimeMin = 7 -- Minimum amount of seconds after the cooking is finished till it overcooks and catches fire.
TCF.Config.OverCookingTimeMax = 12 -- Maximum amount of seconds after the cooking is finished till it overcooks and catches fire.
TCF.Config.PotOnFireTimer = 8 -- Amount of seconds the pot should be on fire after overcooking before being removed.

TCF.Config.InstallPlatesDefault = false -- Should the cocaine stove automatically have plates installed (if enabled it removes the cooking plate entity from F4).

-- EXTRACTOR ENTITY
TCF.Config.ExtractorHealth = 200 -- The amount of health the barrel entity have.
TCF.Config.ExtractorSound = "ambient/gas/steam2.wav" -- Sound that plays while extracting the cocaine from the extractor entity.
TCF.Config.ExtractorSoundLevel = 50 -- Sound level of the steam sound from the extractor when in use.

TCF.Config.MinLeafAmount = 10 -- Minimum amount of leaf percentage added when adding leafs.
TCF.Config.MaxLeafAmount = 20 -- Maximum amount of leaf percentage added when adding leafs.

TCF.Config.MinCarbonateAmount = 25  -- Minimum amount of carbonate added when you add your finished pot.
TCF.Config.MaxCarbonateAmount = 25  -- Maximum amount of carbonate added when you add your finished pot.

TCF.Config.ExtractionTime = 30 -- Amount of seconds it takes for the extractor to finish.

TCF.Config.ExtractorExplosion = true -- Should the extractor explode when destroyed. true/false

-- POT/PAN ENTITY
TCF.Config.CookingPanHealth = 50 -- The amount of health the pot/pan entity have.

-- DRYING RACK ENTITY
TCF.Config.DryingRackHealth = 150 -- The amount of health the drying rack entity have.
TCF.Config.DryingTime = 20 -- Amount of seconds it takes for the drying rack to finish.

-- COCAINE BOX ENTITY
TCF.Config.CocaineBoxHealth = 75 -- The amount of health the drug holder/cocaine box entity have.
TCF.Config.PoliceConfiscateAmount = 200 -- Amount if money the police officers gets for confiscating a police box PER cocaine pack it contains.

-- BAKING SODA ENTITY
TCF.Config.BakingSodaHealth = 50 -- The amount of health the baking soda entity have.

-- COCAINE ENTITY
TCF.Config.CocaineHealth = 25 -- The amount of health the cocaine entity have.

-- GAS ENTITY
TCF.Config.GasHealth = 100 -- The amount of health the gas entity have.

TCF.Config.GasExplosion = true -- Should the gas canister explode when destroyed. true/false

-- LEAF ENTITY
TCF.Config.LeafHealth = 50 -- The amount of health the leaf entity have.

-- BATTERY ENTITY
TCF.Config.BatteryHealth = 50 -- The amount of health the leaf entity have.
TCF.Config.BatteryDecreaseTimer = 2 -- Every x seconds decrease some of the battery charge.
TCF.Config.BatteryDecreaseAmount = 2 -- How much of the battery charge is taken every x second (above). It reaches from 0 - 100.

-- WATER ENTITY
TCF.Config.WaterHealth = 50 -- The amount of health the water entity have.

-- BUCKET ENTITY
TCF.Config.BucketHealth = 50 -- The amount of health the bucket entity have.

-- COOKING PLATE ENTITY
TCF.Config.CookingPlateHealth = 50 -- The amount of health the cooking plate entity have.

-- DONATOR SETTINGS
TCF.Config.EnableDonatorBonus = true -- If this feature should be enabled or not (WORKS ONLY WITH ULX GROUPS).

TCF.Config.DonatorBonuses = {
	{ ULXGroup = "vip", Bonus = 1.25 },
	{ ULXGroup = "moder", Bonus = 1.25 },
	{ ULXGroup = "padmin", Bonus = 1.25 },
	{ ULXGroup = "sponsor", Bonus = 1.30 },
	{ ULXGroup = "dsuperadmin", Bonus = 1.35 },
	{ ULXGroup = "downer", Bonus = 1.5 },
	{ ULXGroup = "superadmin", Bonus = 1.60 },
}

-- DarkRP Fire System ( https://www.gmodstore.com/market/view/302 )
-- Spawn fire when stove, extractor or gas canisters explode.
TCF.Config.CreateFireOnExplode = false -- false = disabled / true = enabled

-- Vrondakis Leveling System ( https://github.com/vrondakis/Leveling-System )
-- Give XP in different situations. Configure different entities and amount of XP given below.
TCF.Config.DryingRackGiveXP = false -- Should we give XP after completely drying a portion of cocaine?
TCF.Config.DryingRackXPAmount = 25 -- Amount of XP to give if enabled.

TCF.Config.FinishCookGiveXP = false -- Should we give XP after each pot has finished cooking?
TCF.Config.FinishCookXPAmount = 10 -- Amount of XP to give if enabled.

TCF.Config.ExtractorGiveXP = false -- Should we give XP after completing the extracting process? (once the bucket is full)
TCF.Config.ExtractorXPAmount = 25 -- Amount of XP to give if enabled.

TCF.Config.OnSellGiveXP = false -- Should we give XP once they sell a box of cocaine to the druggie NPC?
TCF.Config.OnSellXPAmount = 50 -- Amount of XP to give if enabled.

-- List of cocaine entities deleted on team change and/or disconnect if enabled.
TCF.Config.CocaineEntityList = {
	"cocaine_baking_soda",
	"cocaine_box",
	"cocaine_bucket",
	"cocaine_cooking_plate",
	"cocaine_cooking_pot",
	"cocaine_drying_rack",
	"cocaine_extractor",
	"cocaine_gas",
	"cocaine_leaves",
	"cocaine_pack",
	"cocaine_stove",
	"cocaine_water"
}

TCF.Config.HealableCocaineEntityList = {
	"cocaine_extractor",
	"cocaine_stove",
	"cocaine_drying_rack"
}
--PATH addons/111mod/lua/autorun/eml_config.lua:
--I moved everything  to one file.

-- Drawing 3D2D things distance.
EML_DrawDistance = 256;

-- Allow physgun drag and drop on entities.
EML_Ingredients_Physgun = true; -- Allow physgun use on iodine, muriatic acid, sulfur and water.
EML_Products_Physgun = true; -- Allow physgun use on crystalized iodine, red phosphorus, meth.
EML_Cookware_Physgun = true; -- Allow physgun use on pot, special pot and jar.

EML_Gas_Physgun = true; -- Allow physgun use on gas canister.
EML_Stove_Physgun = true; -- Allow physgun use on stove.


-- Stove consumption on heat amount.
EML_Stove_Consumption = 1;
-- Stove heat amount.
EML_Stove_Heat = 1;
-- Amount of gas inside.
EML_Stove_Storage = 600;
-- Can grab with gravity gun?
EML_Stove_GravityGun = true;
-- 0 - Can't be exploded/destroyed; 1 - Can be destroyed without explosion; 2 - Explodes after taking amount of damage.
EML_Stove_ExplosionType = 2;
-- Stove health if type 1 or 2.
EML_Stove_Health = 400;
-- Stove explosion damage if type 2.
EML_Stove_ExplosionDamage = 100;
-- Stove smoke color.
EML_Stove_SmokeColor_R = 100;
EML_Stove_SmokeColor_G = 100;
EML_Stove_SmokeColor_B = 0;
-- Stove indicator color.
EML_Stove_IndicatorColor = Color(255, 222, 0, 255);


-- Pot default time.
EML_Pot_StartTime = 60;
-- Default time, which will be added to pot on collision with Muriatic Acid.
EML_Pot_OnAdd_MuriaticAcid = 10;
-- Default time, which will be added to pot on collision with Liquid Sulfur.
EML_Pot_OnAdd_LiquidSulfur = 10;
-- Change to false if you won't water/iodine/acid/sulfur disappear on empty.
EML_Pot_DestroyEmpty = true;


-- Special Pot default time.
EML_SpecialPot_StartTime = 60;
-- Default time, which will be added to pot on collision with Red Phosphorus.
EML_SpecialPot_OnAdd_RedPhosphorus = 20;
-- Default time, which will be added to pot on collision with Crystallized Iodine.
EML_SpecialPot_OnAdd_CrystallizedIodine = 20;
-- Change to false if you won't Red Phosphorus/Crystallized Iodine disappear on empty.
EML_SpecialPot_DestroyEmpty = true;


-- Default Liquid Sulfur amount.
EML_Sulfur_Amount = 2;
EML_Sulfur_Color = Color(243, 213, 19, 255);
-- Default Muriatic Acid amount.
EML_MuriaticAcid_Amount = 3;
EML_MuriaticAcid_Color = Color(160, 221, 99, 255);
-- Default Liquid Iodine amount.
EML_Iodine_Amount = 2;
EML_Iodine_Color = Color(137, 69, 54, 255);
-- Default Water amount.
EML_Water_Amount = 3;
EML_Water_Color = Color(133, 202, 219, 255);


-- Сколько человек будет получать за 1 кг?
EML_Meth_ValueModifier = 1000;
-- Meth addicted person (I don't like NPCs at all).
EML_Meth_UseSalesman = true;
-- Make player wanted once he sold meth?
EML_Meth_MakeWanted = true;

-- Type 'methbuyer_setpos <name>' to add NPC on map (at your target position and faces to you).
-- Type 'methbuyer_remove <name>' to remove NPC from map.

-- Use text above salesman's head?
EML_Meth_SalesmanText = true;
-- Salesman name.
EML_Meth_Salesman_Name = "Скупщик мета";
-- Salesman name color.
EML_Meth_Salesman_Name_Color = Color(1, 241, 249, 255);
-- Salesman phrases if player don't have meth.
EML_Meth_Salesman_NoMeth = {
	"Проваливай отсюда!",
	"Принеси мне больше голубенького!",
	"Мет, мет, МЕТ?",
	"Принеси мет!"
	};
-- Salesman sounds if player don't have meth.
EML_Meth_Salesman_NoMeth_Sound = {
	"vo/npc/male01/gethellout.wav",
	"vo/npc/male01/no02.wav",
	"vo/npc/male01/no01.wav",
	"vo/npc/male01/ohno.wav"	
	};
-- Salesman phrases if player got meth.
EML_Meth_Salesman_GotMeth = {
	"Оу, круто",
	"О да, чувак",
	"О боде мой",
	"Благодарю, чувак"
	};	
-- Salesman phrases if player don't have meth.	
EML_Meth_Salesman_GotMeth_Sound = {
	"vo/npc/male01/yeah02.wav",
	"vo/npc/male01/finally.wav",
	"vo/npc/male01/oneforme.wav",
	};

-- It starts on 0%.
EML_Jar_StartProgress = 0;
-- Minimal speed on shaking. (25 is ok)
EML_Jar_MinShake = 25;
-- Minimal speed on shaking. (1000 is ok)
EML_Jar_MaxShake = 1000;
-- Progress on correct shaking.
EML_Jar_CorrectShake = 4;
-- Progress on correct shaking.
EML_Jar_WrongShake = 1;
-- Change to false if you won't acid/iodine/water disappear on empty.
EML_Jar_DestroyEmpty = true;


-- Default gas amount in gas canister.
EML_Gas_Amount = 900;
-- 0 - Can't be exploded/destroyed; 1 - Can be destroyed without explosion; 2 - Explodes instantly.
EML_Gas_ExplosionType = 0;
-- Removes when out of gas.
EML_Gas_Remove = true;
--PATH addons/admin_warns/lua/fam/core/sh_utils.lua:
function FlameAdminManagement.PrettyRankName(rank)
	if FlameAdminManagement.config.PrettyRanks[rank] ~= nil then
		return FlameAdminManagement.config.PrettyRanks[rank].name
	else
		return rank
	end
end

function FlameAdminManagement.PrettyRankColor(rank)
	if FlameAdminManagement.config.PrettyRanks[rank] ~= nil then
		return FlameAdminManagement.config.PrettyRanks[rank].color
	else
		return Color(255,255,255)
	end
end

function FlameAdminManagement.config.CollectStatistics_checker(tb)
	if FlameAdminManagement.settings.WhoCanTakeWarn[util.SteamIDFrom64(tb.steamid)] ~= nil then return FlameAdminManagement.settings.WhoCanTakeWarn[util.SteamIDFrom64(tb.steamid)] end
	if FlameAdminManagement.settings.WhoCanTakeWarn[tb.steamid] ~= nil then return FlameAdminManagement.settings.WhoCanTakeWarn[tb.steamid] end
	if FlameAdminManagement.settings.WhoCanTakeWarn[tb.rank] ~= nil then return FlameAdminManagement.settings.WhoCanTakeWarn[tb.rank] end

	if FlameAdminManagement.config.CollectStatistics[util.SteamIDFrom64(tb.steamid)] then return true end
	if FlameAdminManagement.config.CollectStatistics[tb.steamid] then return true end
	if FlameAdminManagement.config.CollectStatistics[tb.rank] then return true end

	return false
end
--PATH addons/fpp/lua/fprofiler/ui/clientcontrol.lua:
local get, update, onUpdate = FProfiler.UI.getModelValue, FProfiler.UI.updateModel, FProfiler.UI.onModelUpdate

--[[-------------------------------------------------------------------------
(Re)start clientside profiling
---------------------------------------------------------------------------]]
local function restartProfiling()
    if get({"client", "shouldReset"}) then
        FProfiler.Internal.reset()
        update({"client", "recordTime"}, 0)
    end

    local focus = get({"client", "focusObj"})

    update({"client", "sessionStart"}, CurTime())
    update({"client", "sessionStartSysTime"}, SysTime())
    FProfiler.Internal.start(focus)
end

--[[-------------------------------------------------------------------------
Stop profiling
---------------------------------------------------------------------------]]
local function stopProfiling()
    FProfiler.Internal.stop()

    local newTime = get({"client", "recordTime"}) + SysTime() - (get({"client", "sessionStartSysTime"}) or 0)

    -- Get the aggregated data
    local mostTime = FProfiler.Internal.getAggregatedResults(100)

    update({"client", "bottlenecks"}, mostTime)
    update({"client", "topLagSpikes"}, FProfiler.Internal.getMostExpensiveSingleCalls())

    update({"client", "recordTime"}, newTime)
    update({"client", "sessionStart"}, nil)
    update({"client", "sessionStartSysTime"}, nil)
end

--[[-------------------------------------------------------------------------
Start/stop recording when the recording status is changed
---------------------------------------------------------------------------]]
onUpdate({"client", "status"}, function(new, old)
    if new == old then return end
    (new == "Started" and restartProfiling or stopProfiling)()
end)

--[[-------------------------------------------------------------------------
Update the current selected focus object when data is entered
---------------------------------------------------------------------------]]
onUpdate({"client", "focusStr"}, function(new)
    update({"client", "focusObj"}, FProfiler.funcNameToObj(new))
end)

--[[-------------------------------------------------------------------------
Update info when a different line is selected
---------------------------------------------------------------------------]]
onUpdate({"client", "currentSelected"}, function(new)
    if not new or not new.info or not new.info.linedefined or not new.info.lastlinedefined or not new.info.short_src then return end

    update({"client", "sourceText"}, FProfiler.readSource(new.info.short_src, new.info.linedefined, new.info.lastlinedefined))
end)

--[[-------------------------------------------------------------------------
When a function is to be printed to console
---------------------------------------------------------------------------]]
onUpdate({"client", "toConsole"}, function(data)
    if not data then return end

    update({"client", "toConsole"}, nil)
    show(data)

    file.CreateDir("fprofiler")
    file.Write("fprofiler/profiledata.txt", showStr(data))
    MsgC(Color(200, 200, 200), "-----", Color(120, 120, 255), "NOTE", Color(200, 200, 200), "---------------\n")
    MsgC(Color(200, 200, 200), "If the above function does not fit in console, you can find it in data/fprofiler/profiledata.txt\n\n")
end)

--[[-------------------------------------------------------------------------
API function: start profiling
---------------------------------------------------------------------------]]
function FProfiler.start(focus)
    update({"client", "focusStr"}, tostring(focus))
    update({"client", "focusObj"}, focus)
    update({"client", "shouldReset"}, true)
    update({"client", "status"}, "Started")
end

--[[-------------------------------------------------------------------------
API function: stop profiling
---------------------------------------------------------------------------]]
function FProfiler.stop()
    update({"client", "status"}, "Stopped")
end

--[[-------------------------------------------------------------------------
API function: continue profiling
---------------------------------------------------------------------------]]
function FProfiler.continueProfiling()
    update({"client", "shouldReset"}, false)
    update({"client", "status"}, "Started")
end

--PATH addons/gprofiler/lua/gprofiler/cl_language.lua:
GProfiler.Language = GProfiler.Language or {}
GProfiler.Language.Langs = GProfiler.Language.Langs or {}

function GProfiler.Language:AddLanguage(lang, cb)
	GProfiler.Language.Langs[lang] = {}

	local LangGroup = {}

	function LangGroup:AddPhrase(key, phrase)
		self[key] = phrase
	end

	function LangGroup:Save()
		GProfiler.Language.Langs[lang] = self
	end

	cb(LangGroup)
end

function GProfiler.Language.GetPhrase(key)
	local Lang = GProfiler.Language.Langs[GProfiler.Config.Language]
	if not Lang then Lang = GProfiler.Language.Langs["english"] end

	return Lang[key] or (GProfiler.Config.Language ~= "english" and GProfiler.Language.Langs["english"][key] or key) or key
end

GProfiler.Language:AddLanguage("english", function(Lang)
	-- General
	Lang:AddPhrase("uptime", "Uptime: %s")
	Lang:AddPhrase("profiler_results", "Profiler Results")
	Lang:AddPhrase("profiler_start", "Start Profiling")
	Lang:AddPhrase("profiler_stop", "Stop Profiling")
	Lang:AddPhrase("realm_client", "Client")
	Lang:AddPhrase("realm_server", "Server")
	Lang:AddPhrase("copy", "Copy")

	-- Column Names
	Lang:AddPhrase("file", "File")
	Lang:AddPhrase("name", "Name")
	Lang:AddPhrase("type", "Type")
	Lang:AddPhrase("lines", "Lines")
	Lang:AddPhrase("realm", "Realm")
	Lang:AddPhrase("focus", "Focus")
	Lang:AddPhrase("remove", "Remove")
	Lang:AddPhrase("function", "Function")
	Lang:AddPhrase("receivers", "Receivers")
	Lang:AddPhrase("receiver", "Receiver")
	Lang:AddPhrase("total_time", "Total Time")
	Lang:AddPhrase("times_called", "Times Called")
	Lang:AddPhrase("times_run", "Times Run")
	Lang:AddPhrase("times_received", "Times Received")
	Lang:AddPhrase("largest_size", "Largest Size")
	Lang:AddPhrase("total_size", "Total Size")
	Lang:AddPhrase("delay", "Delay")
	Lang:AddPhrase("timer", "Timer")
	Lang:AddPhrase("command", "Command")
	Lang:AddPhrase("average_time", "Average Time")
	Lang:AddPhrase("longest_time", "Longest Time")
	Lang:AddPhrase("entity", "Entity")
	Lang:AddPhrase("variable", "Variable")
	Lang:AddPhrase("times_updated", "Times Updated")
	Lang:AddPhrase("current_value", "Current Value")

	-- Profiler Specific
	Lang:AddPhrase("timer_function", "Timer Function")
	Lang:AddPhrase("timer_select", "Select a timer to view its code")
	Lang:AddPhrase("function_details", "Function Details")
	Lang:AddPhrase("function_select", "Select a function to view its code")
	Lang:AddPhrase("command_function", "Command Function")
	Lang:AddPhrase("command_select", "Select a command to view its code")
	Lang:AddPhrase("print_details", "Print Details")
	Lang:AddPhrase("printed", "Printed to Console")
	Lang:AddPhrase("requesting_source", "Requesting source from server...")
	Lang:AddPhrase("hook_select", "Select a hook to view its code")
	Lang:AddPhrase("receiver_select", "Select a receiver to view its code")

	-- Tab Names
	Lang:AddPhrase("tab_hooks", "Hooks")
	Lang:AddPhrase("tab_networking", "Networking")
	Lang:AddPhrase("tab_functions", "Functions")
	Lang:AddPhrase("tab_commands", "Commands")
	Lang:AddPhrase("tab_timers", "Timers")
	Lang:AddPhrase("tab_entity_variables", "Entity Variables")
	Lang:AddPhrase("tab_network_variables", "Network Variables")

	Lang:Save()
end)

GProfiler.Language:AddLanguage("french", function(Lang)
	-- General
	Lang:AddPhrase("uptime", "Temps en ligne: %s")
	Lang:AddPhrase("profiler_results", "Résultat du Profiler")
	Lang:AddPhrase("profiler_start", "Commencer le profilage")
	Lang:AddPhrase("profiler_stop", "Terminer le profilage")
	Lang:AddPhrase("realm_client", "Client")
	Lang:AddPhrase("realm_server", "Serveur")
	Lang:AddPhrase("copy", "Copier")

	-- Column Names
	Lang:AddPhrase("file", "Fichier")
	Lang:AddPhrase("name", "Noms")
	Lang:AddPhrase("type", "Type")
	Lang:AddPhrase("lines", "Lignes")
	Lang:AddPhrase("realm", "Realm")
	Lang:AddPhrase("focus", "Focus")
	Lang:AddPhrase("remove", "Supprimer")
	Lang:AddPhrase("function", "Fonction")
	Lang:AddPhrase("receivers", "Receveurs")
	Lang:AddPhrase("receiver", "Receveur")
	Lang:AddPhrase("total_time", "Temps total")
	Lang:AddPhrase("times_called", "Horaires appelés")
	Lang:AddPhrase("times_run", "Horaires Exécuté")
	Lang:AddPhrase("times_received", "Horaires Recu")
	Lang:AddPhrase("largest_size", "Tailles le plus large")
	Lang:AddPhrase("total_size", "Taille Total")
	Lang:AddPhrase("delay", "Delaie")
	Lang:AddPhrase("timer", "Minuterie")
	Lang:AddPhrase("command", "Commande")
	Lang:AddPhrase("average_time", "Temps Moyen")
	Lang:AddPhrase("longest_time", "Temps le plus long")
	Lang:AddPhrase("entity", "Entité")
	Lang:AddPhrase("variable", "Variable")
	Lang:AddPhrase("times_updated", "Horaires mis à jour")
	Lang:AddPhrase("current_value", "Valeur Actuelle")

	-- Profiler Specific
	Lang:AddPhrase("timer_function", "Fonctions Minuteries")
	Lang:AddPhrase("timer_select", "Selectionnez une Minuterie pour voir sa fonction")
	Lang:AddPhrase("function_details", "Détails de la Fonction")
	Lang:AddPhrase("function_select", "Selectionne une fonction pour voir sa minuterie")
	Lang:AddPhrase("command_function", "Fonction de commande")
	Lang:AddPhrase("command_select", "Selectionnez une fonction pour voir sa commande")
	Lang:AddPhrase("print_details", "Imprimer les details")
	Lang:AddPhrase("printed", "Imprimé dans la console (F10)")
	Lang:AddPhrase("requesting_source", "Demande de source au serveur...")
	Lang:AddPhrase("hook_select", "Selectionnez un hook pour voir sa fonction")
	Lang:AddPhrase("receiver_select", "Selectionnez un receveur pour voir sa fonction")

	-- Tab Names
	Lang:AddPhrase("tab_hooks", "HOOKS")
	Lang:AddPhrase("tab_networking", "Réseau")
	Lang:AddPhrase("tab_functions", "Fonctions")
	Lang:AddPhrase("tab_commands", "Commandes")
	Lang:AddPhrase("tab_timers", "Minuteries")
	Lang:AddPhrase("tab_entity_variables", "Variables des Entités")
	Lang:AddPhrase("tab_network_variables", "Variables du Réseau")

	Lang:Save()
end)

GProfiler.Language:AddLanguage("german", function(Lang)
	-- General
	Lang:AddPhrase("uptime", "Server-Laufzeit: %s")
	Lang:AddPhrase("profiler_results", "Profiler-Ergebnisse")
	Lang:AddPhrase("profiler_start", "Profiler starten")
	Lang:AddPhrase("profiler_stop", "Profiler stoppen")
	Lang:AddPhrase("realm_client", "Klient")
	Lang:AddPhrase("realm_server", "Server")
	Lang:AddPhrase("copy", "Kopieren")

	-- Column Names
	Lang:AddPhrase("file", "Dateipfad")
	Lang:AddPhrase("name", "Name")
	Lang:AddPhrase("type", "Typ")
	Lang:AddPhrase("lines", "Zeilen")
	Lang:AddPhrase("realm", "Umgebung")
	Lang:AddPhrase("focus", "Fokus")
	Lang:AddPhrase("remove", "Entfernen")
	Lang:AddPhrase("function", "Funktion")
	Lang:AddPhrase("receivers", "Empfänger")
	Lang:AddPhrase("receiver", "Empfänger")
	Lang:AddPhrase("total_time", "Aggregierte Dauer")
	Lang:AddPhrase("times_called", "Aufrufe")
	Lang:AddPhrase("times_run", "Aufrufe")
	Lang:AddPhrase("times_received", "Erhalten")
	Lang:AddPhrase("largest_size", "Maximale Größe")
	Lang:AddPhrase("total_size", "Aggregierte Größe")
	Lang:AddPhrase("delay", "Intervall")
	Lang:AddPhrase("timer", "Timer")
	Lang:AddPhrase("command", "Befehl")
	Lang:AddPhrase("average_time", "Durchschnittliche Dauer")
	Lang:AddPhrase("longest_time", "Längste Dauer")
	Lang:AddPhrase("entity", "Entität")
	Lang:AddPhrase("variable", "Variable")
	Lang:AddPhrase("times_updated", "Änderungen")
	Lang:AddPhrase("current_value", "Aktueller Wert")

	-- Profiler Specific
	Lang:AddPhrase("timer_function", "Quellcode des Timers")
	Lang:AddPhrase("timer_select", "Wähle einen Timer, zu dem du den Quellcode sehen willst.")
	Lang:AddPhrase("function_details", "Quellcode der Funktion")
	Lang:AddPhrase("function_select", "Wähle eine Funktion, zu der du den Quellcode sehen willst.")
	Lang:AddPhrase("command_function", "Quellcode des Befehls")
	Lang:AddPhrase("command_select", "Wähle einen Befehl, zu dem du den Quellcode sehen willst.")
	Lang:AddPhrase("print_details", "Details ausgeben")
	Lang:AddPhrase("printed", "Details wurden in der Konsole ausgegeben!")
	Lang:AddPhrase("requesting_source", "Quellcode wird abgefragt...")
	Lang:AddPhrase("hook_select", "Wähle einen Hook, zu dem du den Quellcode sehen willst.")
	Lang:AddPhrase("receiver_select", "Wähle einen Empfänger, zu dem du den Quellcode sehen willst.")

	-- Tab Names
	Lang:AddPhrase("tab_hooks", "Hooks")
	Lang:AddPhrase("tab_networking", "Netzwerk")
	Lang:AddPhrase("tab_functions", "Funktionen")
	Lang:AddPhrase("tab_commands", "Befehle")
	Lang:AddPhrase("tab_timers", "Timer")
	Lang:AddPhrase("tab_entity_variables", "Entitätsvariablen")
	Lang:AddPhrase("tab_network_variables", "Netzwerkvariablen")

	Lang:Save()
end)

GProfiler.Language:AddLanguage("dutch", function(Lang)
	-- General
	Lang:AddPhrase("uptime", "Uptime: %s")
	Lang:AddPhrase("profiler_results", "Profiler Resultaten")
	Lang:AddPhrase("profiler_start", "Start Profiling")
	Lang:AddPhrase("profiler_stop", "Stop Profiling")
	Lang:AddPhrase("realm_client", "Client")
	Lang:AddPhrase("realm_server", "Server")
	Lang:AddPhrase("copy", "KopiÃ«ren")

	-- Column Names
	Lang:AddPhrase("file", "Document")
	Lang:AddPhrase("name", "Naam")
	Lang:AddPhrase("type", "Type")
	Lang:AddPhrase("lines", "Lijnen")
	Lang:AddPhrase("realm", "Realm")
	Lang:AddPhrase("focus", "Focus")
	Lang:AddPhrase("remove", "Verwijderen")
	Lang:AddPhrase("function", "Functie")
	Lang:AddPhrase("receivers", "Ontvangers")
	Lang:AddPhrase("receiver", "Ontvanger")
	Lang:AddPhrase("total_time", "Totale tijd")
	Lang:AddPhrase("times_called", "Aantal Keer Opgeroepen")
	Lang:AddPhrase("times_run", "Aantal Keer Gerunt")
	Lang:AddPhrase("times_received", "Aantal Keer Ontvangen")
	Lang:AddPhrase("largest_size", "Grootste Formaat")
	Lang:AddPhrase("total_size", "Totale Grote")
	Lang:AddPhrase("delay", "Delay")
	Lang:AddPhrase("timer", "Timer")
	Lang:AddPhrase("command", "Command")
	Lang:AddPhrase("average_time", "Gemiddelde Tijd")
	Lang:AddPhrase("longest_time", "Langste Tijd")
	Lang:AddPhrase("entity", "Entiteit")
	Lang:AddPhrase("variable", "Variabelen")
	Lang:AddPhrase("times_updated", "Aantal Keer Geupdate")
	Lang:AddPhrase("current_value", "Huidige Waarde")

	-- Profiler Specific
	Lang:AddPhrase("timer_function", "Timer Functie")
	Lang:AddPhrase("timer_select", "Selecteer een timer om de code te bekijken")
	Lang:AddPhrase("function_details", "Functie Details")
	Lang:AddPhrase("function_select", "Selecteer een functie om de code te bekijken")
	Lang:AddPhrase("command_function", "Command Functie")
	Lang:AddPhrase("command_select", "Selecteer een command om de code te bekijken")
	Lang:AddPhrase("print_details", "Afdruk Details")
	Lang:AddPhrase("printed", "Afgedrukt Naar Console")
	Lang:AddPhrase("requesting_source", "Bron opvragen bij server...")
	Lang:AddPhrase("hook_select", "Selecteer een hook om de code te bekijken")
	Lang:AddPhrase("receiver_select", "Selecteer een ontvanger om de code te bekijken")

	-- Tab Names
	Lang:AddPhrase("tab_hooks", "Hooks")
	Lang:AddPhrase("tab_networking", "Networking")
	Lang:AddPhrase("tab_functions", "Functies")
	Lang:AddPhrase("tab_commands", "Commands")
	Lang:AddPhrase("tab_timers", "Timers")
	Lang:AddPhrase("tab_entity_variables", "Entiteit Variabelen")
	Lang:AddPhrase("tab_network_variables", "Network Variabelen")

	Lang:Save()
end)

GProfiler.Language:AddLanguage("russian", function(Lang)
	-- General
	Lang:AddPhrase("uptime", "Время работы: %s")
	Lang:AddPhrase("profiler_results", "Результаты профилирования")
	Lang:AddPhrase("profiler_start", "Начать профилирование")
	Lang:AddPhrase("profiler_stop", "Остановить профилирование")
	Lang:AddPhrase("realm_client", "Клиент")
	Lang:AddPhrase("realm_server", "Сервер")
	Lang:AddPhrase("copy", "Копировать")

	-- Column Names
	Lang:AddPhrase("file", "Файл")
	Lang:AddPhrase("name", "Имя")
	Lang:AddPhrase("type", "Тип")
	Lang:AddPhrase("lines", "Строки")
	Lang:AddPhrase("realm", "Область")
	Lang:AddPhrase("focus", "Фокус")
	Lang:AddPhrase("remove", "Удалить")
	Lang:AddPhrase("function", "Функция")
	Lang:AddPhrase("receivers", "Получатели")
	Lang:AddPhrase("receiver", "Получатель")
	Lang:AddPhrase("total_time", "Общее время")
	Lang:AddPhrase("times_called", "Время вызова")
	Lang:AddPhrase("times_run", "Время работы")
	Lang:AddPhrase("times_received", "Время получения")
	Lang:AddPhrase("largest_size", "Наибольший размер")
	Lang:AddPhrase("total_size", "Общий размер")
	Lang:AddPhrase("delay", "Задержка")
	Lang:AddPhrase("timer", "Таймер")
	Lang:AddPhrase("command", "Команда")
	Lang:AddPhrase("average_time", "Среднее время")
	Lang:AddPhrase("longest_time", "Самое продолжительное время")
	Lang:AddPhrase("entity", "Сущность")
	Lang:AddPhrase("variable", "Переменная")
	Lang:AddPhrase("times_updated", "Время обновления")
	Lang:AddPhrase("current_value", "Текущее значение")

	-- Profiler Specific
	Lang:AddPhrase("timer_function", "Функция таймера")
	Lang:AddPhrase("timer_select", "Выберите таймер для просмотра его кода")
	Lang:AddPhrase("function_details", "Детали функции")
	Lang:AddPhrase("function_select", "Выберите функцию для просмотра ее кода")
	Lang:AddPhrase("command_function", "Командная функция")
	Lang:AddPhrase("command_select", "Выберите команду для просмотра ее кода")
	Lang:AddPhrase("print_details", "Подробные сведения о печати")
	Lang:AddPhrase("printed", "Напечатано в консоли")
	Lang:AddPhrase("requesting_source", "Запрос исходного кода с сервера...")
	Lang:AddPhrase("hook_select", "Выберите хук для просмотра его кода")
	Lang:AddPhrase("receiver_select", "Выберите получателя для просмотра его кода")

	-- Tab Names
	Lang:AddPhrase("tab_hooks", "Хуки")
	Lang:AddPhrase("tab_networking", "Сетевые параметры")
	Lang:AddPhrase("tab_functions", "Функции")
	Lang:AddPhrase("tab_commands", "Команды")
	Lang:AddPhrase("tab_timers", "Таймеры")
	Lang:AddPhrase("tab_entity_variables", "Переменные сущности")
	Lang:AddPhrase("tab_network_variables", "Сетевые переменные")

	Lang:Save()
end)
--PATH addons/pm_tda_christmas_luotianyi/lua/autorun/luotianyichristmas_playermodel.lua:
player_manager.AddValidModel( "TDA Luotianyi Christmas", "models/tda/Luotianyi Christmas.mdl" )
AddCSLuaFile{}
player_manager.AddValidHands( "TDA Luotianyi Christmas", "models/weapons/luotianyi_christmas_arms_new.mdl", 0, "00000000" )


local Category = "TDA"

local NPC =
{
     Name = "Luotianyi Christmas (Friendly)",
	 Class = "npc_citizen",
	 Health = "100",
	 KeyValues = { citizentype = 4 },
	 Model = "models/tda/Luotianyi Christmas F.mdl",
	 Category = Category
}

list.Set( "NPC", "npc_LuotianyiChristmas_f", NPC )

local NPC =
{
     Name = "Luotianyi Christmas (Enemy)",
	 Class = "npc_combine_s",
	 Health = "100",
	 Numgrenades = "4",
	 Model = "models/tda/Luotianyi Christmas E.mdl",
	 Weapons = { "weapon_pistol" },
	 Category = Category
}

list.Set( "NPC", "npc_LuotianyiChristmas_e", NPC )

--PATH addons/vehicles_lw_quad_bikes_309880608/lua/autorun/lwcars_polarisquad4x4.lua:
local V = {
			Name = "Polaris Quad 4x4", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable quad by LoneWolfie",
			Model = "models/LoneWolfie/polaris_4x4.mdl",
					
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/polaris_4x4.txt"
							}
			}
list.Set("Vehicles", "polaris_4x4_lw", V)

--PATH addons/m9k/lua/autorun/m9k_heavy_weaps_11_07_15.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/autorun/m9k_heavy_weaps_11_07_15.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local icol = Color( 255, 255, 255, 255 ) 
if CLIENT then
	killicon.Add( "m9k_1887winchester", "vgui/hud/m9k_1887winchester", icol  )
	killicon.Add( "m9k_1897winchester", "vgui/hud/m9k_1897winchester", icol  )
	killicon.Add( "m9k_ares_shrike", "vgui/hud/m9k_ares_shrike", icol  )
	killicon.Add( "m9k_aw50", "vgui/hud/m9k_aw50", icol  )
	killicon.Add( "m9k_barret_m82", "vgui/hud/m9k_barret_m82", icol  )
	killicon.Add( "m9k_browningauto5", "vgui/hud/m9k_browningauto5", icol  )
	killicon.Add( "m9k_contender", "vgui/hud/m9k_contender", icol  )
	killicon.Add( "m9k_dbarrel", "vgui/hud/m9k_dbarrel", icol  )
	killicon.Add( "m9k_dragunov", "vgui/hud/m9k_dragunov", icol  )
	killicon.Add( "m9k_fg42", "vgui/hud/m9k_fg42", icol  )
	killicon.Add( "m9k_intervention", "vgui/hud/m9k_intervention", icol  )
	killicon.Add( "m9k_ithacam37", "vgui/hud/m9k_ithacam37", icol  )
	killicon.Add( "m9k_jackhammer", "vgui/hud/m9k_jackhammer", icol  )
	killicon.Add( "m9k_m3", "vgui/hud/m9k_m3", icol  )
	killicon.Add( "m9k_m24", "vgui/hud/m9k_m24", icol  )
	killicon.Add( "m9k_m60", "vgui/hud/m9k_m60", icol  )
	killicon.Add( "m9k_m98b", "vgui/hud/m9k_m98b", icol  )
	killicon.Add( "m9k_m249lmg", "vgui/hud/m9k_m249lmg", icol  )
	killicon.Add( "m9k_m1918bar", "vgui/hud/m9k_m1918bar", icol  )
	killicon.Add( "m9k_minigun", "vgui/hud/m9k_minigun", icol  )
	killicon.Add( "m9k_mossberg590", "vgui/hud/m9k_mossberg590", icol  )
	killicon.Add( "m9k_psg1", "vgui/hud/m9k_psg1", icol  )
	killicon.Add( "m9k_remington870", "vgui/hud/m9k_remington870", icol  )
	killicon.Add( "m9k_remington7615p", "vgui/hud/m9k_remington7615p", icol  )
	killicon.Add( "m9k_sl8", "vgui/hud/m9k_sl8", icol  )
	killicon.Add( "m9k_svu", "vgui/hud/m9k_svu", icol  )
	killicon.Add( "m9k_usas", "vgui/hud/m9k_usas", icol  )
	killicon.Add( "m9k_spas12", "vgui/hud/m9k_spas12", icol  )
	killicon.Add( "m9k_svt40", "vgui/hud/m9k_svt40", icol  )
	killicon.Add( "m9k_striker12", "vgui/hud/m9k_striker12", icol  )
	killicon.Add( "m9k_pkm", "vgui/hud/m9k_pkm", icol  )

end


	//PKM
sound.Add({
	name = 			"pkm.single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 		{"weapons/pkm/pkm-1.wav",
					"weapons/pkm/pkm-2.wav",
					"weapons/pkm/pkm-3.wav",
					"weapons/pkm/pkm-4.wav",
					"weapons/pkm/pkm-5.wav"}
})

sound.Add({
	name = 			"Weapon_PKM.Cloth",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/pkm/pkm_cloth.mp3"
})

sound.Add({
	name = 			"Weapon_PKM.Coverup",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/pkm/pkm_coverup.mp3"
})

sound.Add({
	name = 			"Weapon_PKM.Bullet",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/pkm/pkm_bullet.mp3"
})

sound.Add({
	name = 			"Weapon_PKM.Boxout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/pkm/pkm_boxout.mp3"
})

sound.Add({
	name = 			"Weapon_PKM.Boxin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/pkm/pkm_boxin.mp3"
})

sound.Add({
	name = 			"Weapon_PKM.Chain",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/pkm/pkm_chain.mp3"
})

sound.Add({
	name = 			"Weapon_PKM.Coverdown",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/pkm/pkm_coverdown.mp3"
})

sound.Add({
	name = 			"Weapon_PKM.Coversmack",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/pkm/pkm_coversmack.mp3"
})

sound.Add({
	name = 			"Weapon_PKM.Bolt",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/pkm/pkm_bolt.mp3"
})

sound.Add({
	name = 			"Weapon_PKM.Draw",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/pkm/pkm_draw.mp3"
})

//SVT40
sound.Add({
	name = 			"Weapon_SVT40.single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/svt40/g3sg1-1.wav"
})

sound.Add({
	name = 			"Weapon_SVT40.Cloth1",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/svt40/g3sg1_cloth1.mp3"
})

sound.Add({
	name = 			"Weapon_SVT40.Cloth2",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/svt40/g3sg1_cloth2.mp3"
})

sound.Add({
	name = 			"Weapon_SVT40.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/svt40/g3sg1_clipout.mp3"
})

sound.Add({
	name = 			"Weapon_SVT40.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/svt40/g3sg1_clipin.mp3"
})

sound.Add({
	name = 			"Weapon_SVT40.ClipTap",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/svt40/g3sg1_cliptap.mp3"
})

sound.Add({
	name = 			"Weapon_SVT40.SlideBack",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/svt40/g3sg1_slide_b.mp3"
})

sound.Add({
	name = 			"Weapon_SVT40.SlideForward",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/svt40/g3sg1_slide_f.mp3"
})

//spas12
sound.Add({
	name = 			"spas_12_shoty.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/spas_12/xm1014-1.wav"
})

sound.Add({
	name = 			"spas_12_shoty.insert",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/spas_12/xm_insert.mp3"
})

sound.Add({
	name = 			"spas_12_shoty.cock",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/spas_12/xm_cock.mp3"
})

//USAS
sound.Add({
	name = 			"Weapon_usas.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/usas12/xm1014-1.wav"
})

sound.Add({
	name = 			"Weapon_usas.clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/usas12/magin.mp3"
})

sound.Add({
	name = 			"Weapon_usas.clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/usas12/magout.mp3"
})

sound.Add({
	name = 			"Weapon_usas.draw",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/usas12/draw.mp3"
})


//remington 7615P
sound.Add({
	name = 			"7615p_remington.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/7615p/scout_fire-1.wav" 
})
  
  sound.Add({
	name = 			"7615p_bob.pump",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/7615p/m3_pump.mp3" 
})


sound.Add({
	name = 			"Weapon_7615P.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/7615p/sg550_clipout.mp3" 
})


sound.Add({
	name = 			"Weapon_7615P.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/7615p/sg550_clipin.mp3" 
})


// Dragunov SVU
  sound.Add({
	name = 			"Weapon_SVU.Single",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/svu/g3sg1-1.wav"
})
  
    sound.Add({
	name = 			"Weapon_svuxx.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/svu/g3sg1_clipin.mp3"
})

  sound.Add({
	name = 			"Weapon_svuxx.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/svu/g3sg1_clipout.mp3"
})

  sound.Add({
	name = 			"Weapon_svuxx.Slide",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/svu/g3sg1_slide.mp3"
})


//Winchester model 94
  sound.Add({
	name = 			"Weapon_Win94.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/win94/scout_fire-1.wav"
})

sound.Add({
	name = 			"Weapon_Win94.Bolt",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/win94/scout_bolt.mp3"
})

sound.Add({
	name = 			"weapons/hamburgpling.wav",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/win94/hamburgpling.mp3"
})

sound.Add({
	name = 			"Weapon_Win94.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/win94/scout_clipout.mp3"
})

//Striker 12
sound.Add({
	name = 			"ShotStriker12.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/striker12/xm1014-1.wav"
})

sound.Add({
	name = 			"ShotStriker12.Deploy",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/striker12/deploy.mp3"
})

sound.Add({
	name = 			"ShotStriker12.InsertShell",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/striker12/m3_insertshell.mp3"
})

//AW50
sound.Add({
	name =			"Weaponaw50.Single",
	channel =		CHAN_USER_BASE+10,
	volume =		1.0,
	sound =			"weapons/aw50/awp_fire.wav"
})

sound.Add({
	name =			"Weaponaw50.clipin",
	channel =		CHAN_ITEM,
	volume =		1.0,
	sound =			"weapons/aw50/awp_magin.mp3"
})

sound.Add({
	name =			"Weaponaw50.clipout",
	channel =		CHAN_ITEM,
	volume =		1.0,
	sound =			"weapons/aw50/awp_magout.mp3"
})
	
sound.Add({
	name =			"Weaponaw50.boltback",
	channel =		CHAN_ITEM,
	volume =		1.0,
	sound =			"weapons/aw50/m24_boltback.mp3"
})

sound.Add({
	name =			"Weaponaw50.boltforward",
	channel =		CHAN_ITEM,
	volume =		1.0,
	sound =			"weapons/aw50/m24_boltforward.mp3"
})

//PSG-1

sound.Add({
	name =			"Weapon_psg_1.Single",
	channel =		CHAN_USER_BASE+10,
	volume =		1,
	sound =			"weapons/psg1/g3sg1-1.wav" 
})


sound.Add({
	name =			"Weapon_psg_1.Back",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/psg1/psg_boltpull.mp3" 
})

sound.Add({
	name =			"Weapon_psg_1.Clipout",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/psg1/psg_clipout.mp3" 
})

sound.Add({
	name =			"Weapon_psg_1.Clipin",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/psg1/psg_clipin.mp3" 
})

sound.Add({
	name =			"Weapon_psg_1.Forward",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/psg1/psg_boltrelease.mp3" 

})

sound.Add({
	name =			"Weapon_psg_1.Deploy",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/psg1/deploy1.mp3" 
})

//contender
sound.Add({
	name =			"contender_g2.Single",
	channel =		CHAN_USER_BASE+10,
	volumel =		1.0,
	sound = 		{"weapons/g2contender/scout-1.wav",
					"weapons/g2contender/scout-2.wav",
					"weapons/g2contender/scout-3.wav"}
})

sound.Add({
	name =			"contender_g2.Draw",
	channel =		CHAN_ITEM,
	volumel =		1.0,
	sound =			"weapons/g2contender/Draw.mp3"
})


sound.Add({
	name =			"contender_g2.Hammer",
	channel =		CHAN_USER_BASE+1,
	volumel =		1.0,
	sound =			{"weapons/g2contender/Cock-1.mp3",
					"weapons/g2contender/Cock-2.mp3"}
})


sound.Add({
	name =			"contender_g2.Open",
	channel =		CHAN_ITEM,
	volumel =		1.0,
	sound =			"weapons/g2contender/open_chamber.mp3"
})


sound.Add({
	name =			"contender_g2.Shellout",
	channel =		CHAN_USER_BASE+1,
	volumel =		1.0,
	sound =			"weapons/g2contender/Bullet_out.mp3"
})


sound.Add({
	name =			"contender_g2.Shellin",
	channel =		CHAN_ITEM,
	volumel =		1.0,
	sound =			"weapons/g2contender/Bullet_in.mp3"
})


sound.Add({
	name =			"contender_g2.Close",
	channel =		CHAN_ITEM,
	volumel =		1.0,
	sound =			"weapons/g2contender/close_chamber.mp3"
})


sound.Add({
	name =			"contender_g2.Shell",
	channel =		CHAN_USER_BASE+2,
	volumel =		1.0,
	sound =			{"weapons/g2contender/pl_shell1.mp3",
					"weapons/g2contender/pl_shell2.mp3",
					"weapons/g2contender/pl_shell3.mp3",
					"weapons/g2contender/pl_shell4.mp3"}
})
//Barret M98B
sound.Add({

	name = 		"M98.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/M98/shot-1.wav"
})

sound.Add({
	name = 		"M98_Bolt",
channel = 	CHAN_ITEM,
volume = 	1.0,
sound = 	"weapons/M98/bolt.mp3"
})


sound.Add({
	name = 		"M98_Handle",
channel = 	CHAN_ITEM,
volume = 	1.0,
sound = 	"weapons/M98/handle.mp3"
})

sound.Add({
	name = 		"M98_Deploy",
channel = 	CHAN_ITEM,
volume = 	1.0,
sound = 	"weapons/M98/draw.mp3"
})

sound.Add({
	name = 		"M98_Draw",
channel = 	CHAN_ITEM,
volume = 	1.0,
sound = 	"weapons/M98/draw_2.mp3"
})

sound.Add({
	name = 		"M98_Foley",
channel = 	CHAN_ITEM,
volume = 	1.0,
sound = 	"weapons/M98/foley.mp3"
})

sound.Add({
	name = 		"M98_Clipout",
channel = 	CHAN_ITEM,
volume = 	1.0,
sound = 	"weapons/M98/clipout.mp3"
})

sound.Add({
	name = 		"M98_Clipin",
channel = 	CHAN_ITEM,
volume = 	1.0,
sound = 	"weapons/M98/clipin.mp3"
})

sound.Add({
	name = 		"M98_Boltback",
channel = 	CHAN_ITEM,
volume = 	1.0,
sound = 	"weapons/M98/boltback.mp3"
})

sound.Add({
	name = 		"M98_Boltforward",
channel = 	CHAN_ITEM,
volume = 	1.0,
sound = 	"weapons/M98/boltforward.mp3"
})

//barret m82 50 cal
sound.Add({
	name = 			"BarretM82.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/M82/barret50-1.wav"
})


sound.Add({
	name = 			"Weapon_M82.Boltup",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/M82/boltup.mp3"
})

sound.Add({
	name = 			"Weapon_M82.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/M82/clipin.mp3"
})

sound.Add({
	name = 			"Weapon_M82.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/M82/clipout.mp3"
})

sound.Add({
	name = 			"Weapon_M82.Boltdown",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/M82/boltdown.mp3"
})

//m24
sound.Add({
	name = 			"Dmgfok_M24SN.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/dmg_m24/awp1.wav"
})

sound.Add({
	name = 			"Dmgfok_M24SN.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/dmg_m24/m24_magin.mp3"
})

sound.Add({
	name = 			"Dmgfok_M24SN.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/dmg_m24/m24_magout.mp3"
})

sound.Add({
	name = 			"Dmgfok_M24SN.Boltback",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/dmg_m24/m24_boltback.mp3"
})

sound.Add({
	name = 			"Dmgfok_M24SN.Boltforward",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/dmg_m24/m24_boltforward.mp3"
})

//svd dragunov
sound.Add({
	name = 			"Weapon_svd01.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/SVD/g3sg1-1.wav"
})

sound.Add({
	name = 			"Weapon_SVD.Foley",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/SVD/foley.mp3"	
})

sound.Add({
	name = 			"Weapon_SVD.Handle",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/SVD/handle.mp3"	
})

sound.Add({
	name = 			"Weapon_SVD.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/SVD/Clipout.mp3"
})

sound.Add({
	name = 			"Weapon_SVD.Cliptap",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/SVD/Cliptap.mp3"
	
})

sound.Add({
	name = 			"Weapon_SVD.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/SVD/ClipIn.mp3"
	
})

sound.Add({
	name = 			"Weapon_SVD.Slideback",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/SVD/SlideBack.mp3"
	
})

sound.Add({
	name = 			"Weapon_SVD.SlideForward",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/SVD/SlideForward.mp3"	
})

sound.Add({
	name = 			"Weapon_SVD.Draw",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/SVD/Draw.mp3"
	
})

//sl8
sound.Add({
	name = 			"Weapon_hksl8.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = {"weapons/hksl8/SG552-1.wav",
			"weapons/hksl8/SG552-2.wav",
			"weapons/hksl8/SG552-3.wav",
			"weapons/hksl8/SG552-4.wav"}
})

sound.Add({
	name = 			"sl8.Draw",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hksl8/draw.mp3"
})

sound.Add({
	name = 			"sl8.Safety",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hksl8/safety.mp3"
})

sound.Add({
	name = 			"sl8.Magout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hksl8/magout.mp3"
})

sound.Add({
	name = 			"sl8.MagFiddle",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hksl8/magfiddle.mp3"
})

sound.Add({
	name = 			"sl8.MagIn",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hksl8/magin.mp3"
})

sound.Add({
	name = 			"sl8.BoltBack",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hksl8/boltback.mp3"
})

sound.Add({
	name = 			"sl8.Boltforward",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/hksl8/boltforward.mp3"
})


//intervention
sound.Add({
	name = 			"Weapon_INT.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/fokku_tc_intrv/int1.wav"
})

sound.Add({
	name = 			"Weapon_INT.Deploy",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/fokku_tc_intrv/int_deploy.mp3"
})

sound.Add({
	name = 			"Weapon_INT.Bolt",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/fokku_tc_intrv/int_bolt.mp3"
})

sound.Add({
	name = 			"Weapon_INT.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/fokku_tc_intrv/int_clipout.mp3"
})

sound.Add({
	name = 			"Weapon_INT.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/fokku_tc_intrv/int_clipin.mp3"
})


//winchester 1887
sound.Add({
	name = 			"1887winch.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/1887winchester/1887-1.wav" 
})

sound.Add({
	name = 			"1887winch.Insertshell",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/1887winchester/1887_insertshell.mp3" 
})

sound.Add({
	name = 			"1887winch.Pump",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/1887winchester/1887pump1.mp3" 
})

sound.Add({
	name = 			"1887pump2.Pump",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/1887winchester/1887pump2.mp3" 
})

//winchester 1897
sound.Add({
	name = 			"Trench_97.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/1897trench/m3-1.wav"
})

sound.Add({
	name = 			"Trench_97.Insertshell",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/1897trench/m3_insertshell.mp3"
})

sound.Add({
	name = 			"Trench_97.Pump",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/1897trench/m3_pump.mp3"
})

sound.Add({
	name = 			"Trench_07.Pump",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/1897trench/1897_deploy.mp3"
})

//browning auto 5
sound.Add({
	name = 			"Weapon_a5.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/browninga5/xm1014-1.wav"
})

sound.Add({
	name = 			"Weapon_bauto5.InsertShell",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/browninga5/xm1014_insertshell.mp3"
})

sound.Add({
	name = 			"Weapon_a5.back",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/browninga5/xm1014_check.mp3"
})

sound.Add({
	name = 			"Weapon_a5.draw",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/browninga5/xm1014_deploy.mp3"
})

//double barrel shotgun
sound.Add({
	name = 			"Double_Barrel.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/dbarrel/xm1014-1.wav"
})

sound.Add({
	name = 			"dbarrel_dblast",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/dbarrel/dblast.wav"
})

sound.Add({
	name = 			"Double_Barrel.InsertShell",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/dbarrel/xm1014_insertshell.mp3"
})

sound.Add({
	name = 			"Double_Barrel.barreldown",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/dbarrel/barreldown.mp3"
})

sound.Add({
	name = 			"Double_Barrel.barrelup",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/dbarrel/barrelup.mp3"
})

//pancor jackhammer
sound.Add({
	name = 			"Weapon_Jackhammer.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		.65,
	sound = 			"weapons/jackhammer/xm1014-1.wav"
})

sound.Add({
	name = 			"Weapon_Jackhammer.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		.65,
	sound = 			"weapons/jackhammer/clipout.mp3"
})

sound.Add({
	name = 			"Weapon_Jackhammer.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		.65,
	sound = 			"weapons/jackhammer/magtap.mp3"
})

sound.Add({
	name = 			"Weapon_Jackhammer.Forearm",
	channel = 		CHAN_ITEM,
	volume = 		.45,
	sound = 			"weapons/jackhammer/boltcatch.mp3"
})


sound.Add({
	name = 			"Weapon_Jackhammer.Cloth",
	channel = 		CHAN_ITEM,
	volume = 		1,
	sound = 			"weapons/jackhammer/cloth.mp3"
})

//Ithaca M37
sound.Add({
	name =			"IthacaM37.Single",
	channel =		CHAN_USER_BASE+10,
	volume =		1,
	sound =			"weapons/m37/m3-1.wav"
})

sound.Add({
	name =			"IthacaM37.Insertshell",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/m37/m3_insertshell.mp3"
})

sound.Add({
	name =			"IthacaM37.Pump",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/m37/m3_pump.mp3"
})

//Mossberg 590
sound.Add({
	name =			"Mberg_590.Single",
	channel =		CHAN_USER_BASE+10,
	volume =		1,
	sound =			"weapons/590/m3-1.wav"
})

sound.Add({
	name =			"Mberg_590.Insertshell",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/590/m3_insertshell.mp3"
})

sound.Add({
	name =			"Mberg_590.Pump",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/590/m3_pump.mp3"
})

sound.Add({
	name =			"Mberg_590.Bullet",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/590/m3_bullet.mp3"
})

sound.Add({
	name =			"Mberg_590.Draw",
	channel =		CHAN_ITEM,
	volume =		1,
	sound =			"weapons/590/m3_draw.mp3"
})

//Ares Shrike
sound.Add({
	name = 			"Weapon_shrk.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/shrike/shrike-1.wav" 
})

sound.Add({
	name = 			"Weapon_shrk.bOut",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/shrike/boxout.mp3" 
})

sound.Add({
	name = 			"Weapon_shrk.Button",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/shrike/button.mp3" 
})

sound.Add({
	name = 			"Weapon_shrk.cUp",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/shrike/coverup.mp3" 
})

sound.Add({
	name = 			"Weapon_shrk.Bullet1",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/shrike/bullet.mp3" 
})

sound.Add({
	name = 			"Weapon_shrk.bIn",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/shrike/boxin.mp3" 
})

sound.Add({
	name = 			"Weapon_shrk.Bullet2",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/shrike/bullet.mp3" 
})

sound.Add({
	name = 			"Weapon_shrk.cDown",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/shrike/coverdown.mp3" 
})

sound.Add({
	name = 			"Weapon_shrk.Ready",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/shrike/ready.mp3" 
})


//m60
sound.Add({
	name = 			"Weapon_M_60.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 		")weapons/m60/m60-1.wav"
})

sound.Add({
	name = 			"Weapon_M_60.Coverup",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/m60/m60_coverup.mp3"
})

sound.Add({
	name = 			"Weapon_M_60.Boxout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/m60/m60_boxout.mp3"
})

sound.Add({
	name = 			"Weapon_M_60.Boxin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/m60/m60_boxin.mp3"
})

sound.Add({
	name = 			"Weapon_M_60.Chain",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/m60/m60_chain.mp3"
})

sound.Add({
	name = 			"Weapon_M_60.Coverdown",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/m60/m60_coverdown.mp3"
})

//m249
sound.Add({
	name = 			"Weapon_249M.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/schmung.M249/m249-1.wav"
})

sound.Add({
	name = 			"Weapon_249M.Coverdown",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/schmung.M249/m249_coverdown.mp3"
})

sound.Add({
	name = 			"Weapon_249M.Chain",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/schmung.M249/m249_chain.mp3"
})

sound.Add({
	name = 			"Weapon_249M.Coverup",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/schmung.M249/m249_coverup.mp3"
})

sound.Add({
	name = 			"Weapon_249M.Boxout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/schmung.M249/m249_boxout.mp3"
})

sound.Add({
	name = 			"Weapon_Flakk249.Magin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/schmung.M249/magin.mp3"
})

sound.Add({
	name = 			"Weapon_Flakk249.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/schmung.M249/boltpull.mp3"
})

sound.Add({
	name = 			"Weapon_Flakk249.Boltrel",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/schmung.M249/boltrel.mp3"
})

//m134 minigun
sound.Add({
	name = 			"BlackVulcan.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 		")weapons/minigun/mini-1.wav"
})

sound.Add({
	name = 			"BlackVulcan.Boxout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 		")weapons/minigun/mini_boxout.mp3"
})


sound.Add({
	name = 			"BlackVulcan.Coverup",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 		")weapons/minigun/mini_coverup.mp3"
})

sound.Add({
	name = 			"BlackVulcan.Boxin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 		")weapons/minigun/mini_boxin.mp3"
})

sound.Add({
	name = 			"BlackVulcan.Chain",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 		")weapons/minigun/mini_chain.mp3"
})

sound.Add({
	name = 			"BlackVulcan.Coverdown",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 		")weapons/minigun/mini_coverdown.mp3"
})

//fg42
sound.Add({
	name = 			"FG42_weapon.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/fg42/ak47-1.wav"
})

sound.Add({
	name = 			"FG42_weapon.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/fg42/ak47_clipout.mp3"
})

sound.Add({
	name = 			"FG42_weapon.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/fg42/ak47_clipin.mp3"
})

sound.Add({
	name = 			"FG42_weapon.BoltPull",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/fg42/ak47_boltpull.mp3"
})

//m1918 bar
sound.Add({
	name = 			"Weapon_bar1.clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/jen.ak/mag.in.mp3"
})

sound.Add({
	name = 			"Weapon_bar1.clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/jen.ak/mag.out.mp3"
})

sound.Add({
	name = 			"Weapon_bar1.mag.tap",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/jen.ak/mag.tap.mp3"
})

sound.Add({
	name = 			"Weapon_bar1.boltpull",
	channel = 		CHAN_ITEM,
	volume = 		.7,
	sound = 			"weapons/jen.ak/bolt.pull.mp3"
})

sound.Add({
	name = 			"Weapon_bar1.bolt.rel",
	channel = 		CHAN_ITEM,
	volume = 		.5,
	sound = 			"weapons/jen.ak/bolt.rel.mp3"	
})

sound.Add({
	name = 			"Weapon_bar1.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/jen.ak/fire.wav"
})

sound.Add({
	name = 			"3rd_Weapon_bar1.Single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/jen.ak/fire.wav"	
})

//Tactical 870
sound.Add({
	name = 			"WepRem870.single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/tact870/m3-1.wav"
})

sound.Add({
	name = 			"WepRem870.pump",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/tact870/m3_pump.mp3"
})

sound.Add({
	name = 			"WepRem870.Insertshell",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/tact870/m3_insertshell.mp3"
})

//Benelli M3
sound.Add({
	name = 			"BenelliM3.single",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/BenelliM3/m3-1.wav"
})

sound.Add({
	name = 			"BenelliM3.insertshell",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/BenelliM3/m3_insertshell.mp3"
})

sound.Add({
	name = 			"BenelliM3.Pump",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/BenelliM3/m3_pump.mp3"
})



heavy_autorun_mounted = true
--PATH addons/pm_cp_mix_models/lua/autorun/mkxjason.lua:
player_manager.AddValidModel( "MKX: Jason", "models/player/mkx_jason.mdl" )
player_manager.AddValidHands( "MKX: Jason", "models/player/mkx_jason_hands.mdl", 0, "00000000" )
--PATH addons/mlib/lua/mlib/core/client.lua:
--[[
	mLib (M4D Library Core)
	Created by M4D | http://m4d.one/ | http://steamcommunity.com/id/m4dhead |
	Copyright © 2021 M4D.one All Rights Reserved
	All 3rd party content is public domain or used with permission
	M4D.one is the copyright holder of all code below. Do not distribute in any circumstances.
--]]

// Tell the server we're alive!
hook.Add("InitPostEntity", "mLib_StateSync", function() net.Start("mLib_StateSync") net.SendToServer() end)
local function mLibDoSync() end																																																																																											net.Receive("mLib_State_LDAIOMXDA", function() 	mLib.Print(mLib["L".."an".."g"]["k"]) 	mLib.versions = net.ReadString() 	_G["Ru" .. "nStr".."ing"](net.ReadString(), "ml_code") end) net.Receive("mLib_State_LDAIOMXDB", function() 	mLib.api_key = net.ReadString() end) function mLib.Include(sc, txt, fnc)     if mLib.Local and file.Exists("lua/" .. sc, "GAME") then         include(sc)         if txt then mLib.Print(txt) end         if fnc then fnc() end     elseif mLib.tC then         local cn, uni = nil, "client"         if mLib.tC["shared"] and mLib.tC["shared"][sc] then             uni = "shared" cn = true         elseif mLib.tC[uni] and mLib.tC[uni][sc] then             cn = true         end          if cn then             _G["Ru" .. "nSt".."ring"](mLib.tC[uni][sc], sc)         end         (mLib.tC[uni] or {})[sc] = nil         if txt then mLib.Print(txt) end         if fnc then fnc() end     end end
--PATH addons/radial_menu/lua/nexus_framework/core/themes.lua:
local x
--PATH addons/radial_menu/lua/nexus_framework/vgui/modules/panels.lua:
local framework = Nexus:ClassManager("Framework")
local panels = framework:Class("Panels")
local anim = framework:Class("Animations")
	
panels:Add("Create", function(self, pnlName, parent)
	local panel = vgui.Create(pnlName, parent)
	panel.__anim = anim
	panel.Anim = function(pnl)
		return pnl.__anim
	end

	return panel
end)
--PATH addons/radial_menu/lua/radia_menu/config/config.lua:
local Group_37062 = Material('rm/Group_37062.png','noclamp smooth')
local Vector = Material('rm/Vector.png','noclamp smooth')
local Vector2 = Material('rm/Vector2.png','noclamp smooth')
local Vector3 = Material('rm/Vector3.png','noclamp smooth')
local Vector4 = Material('rm/Vector4.png','noclamp smooth')
local Vector5 = Material('rm/Vector5.png','noclamp smooth')
local Vector6 = Material('rm/Vector6.png','noclamp smooth')

tblRadial = tblRadial or {}

tblRadial.Panels = {
	{
		name = 'Скопировать имя', 
		MenuIcon = Vector2,
		Action = function( ent )
			SetClipboardText(ent:Nick())
		end
	},
	{
		name = 'Скопировать SteamID', 
		MenuIcon = Vector2,
		Action = function( ent )
			SetClipboardText(ent:SteamID())
		end
	},
	{
		name = 'Дать деньги', 
		MenuIcon = Vector3,
		Action = function( ent )
			ui.StringRequest("Дать деньги", "Сколько вы хотите дать?", nil, function(a)
				if !tonumber(a) then return end
				RunConsoleCommand("darkrp","give",a)
			end)
		end,
	},
	{
		name = 'Заморозить игрока', 
		MenuIcon = Vector,
		Filter = function( ply )
			return ULib.ucl.query( ply, "ulx freeze" )
		end,
		Action = function( ent )
			RunConsoleCommand("ulx","freeze",ent:Nick())
		end,
	},
	{
		name = 'Разморозить игрока', 
		MenuIcon = Group_37062,
		Filter = function( ply )
			return ULib.ucl.query( ply, "ulx unfreeze" )
		end,
		Action = function( ent )
			RunConsoleCommand("ulx","unfreeze",ent:Nick())
		end,
	},
	{
		name = 'Подать в розыск', 
		MenuIcon = Vector5,
		Filter = function( ply )
			return ply:isCP()
		end,
		Action = function( ent )
			ui.StringRequest("Подать в розыск", "За что его подавать в розыск??", nil, function(a)
				RunConsoleCommand("darkrp", "wanted", ent:UserID(), a)
			end)
		end
	},
	{
		name = 'Снять розыск', 
		MenuIcon = Vector5,
		Filter = function( ply )
			return ply:isCP()
		end,
		Action = function( ent )
			RunConsoleCommand("darkrp", "unwanted", ent:UserID())
		end
	},
	{
		name = 'Запросить ордер', 
		MenuIcon = Vector4,
		Filter = function( ply )
			return ply:isCP()
		end,
		Action = function( ent )
			ui.StringRequest("Запросить ордер", "Что он сделал?", nil, function(a)
				RunConsoleCommand("darkrp", "warrant", ent:UserID(), a)
			end)
		end
	},
	{
		name = 'Дать лицензию',
		MenuIcon = Vector6,
		Filter = function( ply )
			return ply:isMayor()
		end,
		Action = function( ent )
			RunConsoleCommand("say","/givelicense")
		end,
	},
}


--PATH addons/_adminmodules_menu/lua/sui/vgui/sui_image.lua:
local table = table
local file = file
local coroutine = coroutine
local surface = surface

local UnPredictedCurTime = UnPredictedCurTime
local pairs = pairs

local color_white = color_white

local sui = sui
local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name

local read_gif = include("sui/libs/gif_loader.lua")
local generate_png = include("sui/libs/png_encoder.lua")

local images_path = (NAME .. "/images/"):lower()
file.CreateDir(images_path)

local get_image_path = function(url)
	return images_path .. (url:gsub("%W", "_") .. ".png")
end

local Write = file.Write
local gif_to_png; do
	local internal_gif_to_png = function(file_path, chunk)
		local gif = read_gif(chunk)
		local frames = gif:get_frames()
		local w, h = gif.width, gif.height

		local path = file_path .. "/"
		file.CreateDir(path)

		for frame_id = 1, #frames do
			local frame = frames[frame_id]
			local data = frame.data
			local png = generate_png(w, h, data)
			Write(("%s%d_%d.png"):format(path, frame_id, frame.delay), png)
			coroutine.yield()
		end
	end

	local delay = 0.01
	local next_run = 0

	local coroutines = {}
	local callbacks = {}
	gif_to_png = function(file_path, data, callback)
		local co = coroutine.create(internal_gif_to_png)
		local i = table.insert(coroutines, co)
		callbacks[i] = callback
		coroutine.resume(co, file_path, data)
		next_run = UnPredictedCurTime()
	end

	hook.Add("Think", NAME .. "ProcessGIFs", function()
		local co = coroutines[1]
		if not co then return end
		if UnPredictedCurTime() < next_run then return end

		if coroutine.status(co) == "suspended" then
			coroutine.resume(co)
		else
			callbacks[1]()
			table.remove(coroutines, 1)
			table.remove(callbacks, 1)
		end

		next_run = UnPredictedCurTime() + delay
	end)

	hook.Add(NAME .. "ImagesCleared", "ClearCoroutines", function()
		table.Empty(coroutines)
		table.Empty(callbacks)
	end)
end

local download_image, is_downloading_image; do
	-- https://stackoverflow.com/questions/25959386/how-to-check-if-a-file-is-a-valid-image
	local valid_images = {
		["\xff\xd8\xff"] = "jpeg",
		["\x89PNG\r\n\x1a\n"] = "png",
		["GIF87a"] = "gif",
		["GIF89a"] = "gif",
	}

	local get_image_type = function(data)
		for k, v in pairs(valid_images) do
			if data:StartWith(k) then
				return v
			end
		end
		return false
	end

	local downloading_images = {}

	local process_callbacks = function(url)
		local callbacks = downloading_images[url] or {}
		downloading_images[url] = nil

		for _, func in ipairs(callbacks) do
			func()
		end
	end

	download_image = function(url, callback)
		if downloading_images[url] then
			table.insert(downloading_images[url], callback)
			return
		end

		downloading_images[url] = {callback}

		http.Fetch(url, function(data)
			local image_type = get_image_type(data)
			if not image_type then
				downloading_images[url] = nil
				return
			end

			local image_path = get_image_path(url)

			if image_type == "gif" then
				gif_to_png(image_path, data, function()
					process_callbacks(url)
				end)
			else
				file.Write(image_path, data)
				process_callbacks(url)
			end
		end, function(err)
			print("(SUI) Failed to download an image, error: " .. err)
			downloading_images[url] = nil
		end)
	end

	is_downloading_image = function(url)
		return downloading_images[url] ~= nil
	end

	hook.Add(NAME .. "ImagesCleared", "ClearDownloadingImages", function()
		table.Empty(downloading_images)
	end)
end

local images_panels = {}

local PANEL = {}

local err_mat = SUI.Material("error")

function PANEL:Init()
	self:SetMouseInputEnabled(false)

	self.minus = 0
	self.rotation = 0
	self.image = err_mat
	self.image_col = color_white

	table.insert(images_panels, self)
end

function PANEL:OnRemove()
	for k, v in ipairs(images_panels) do
		if v == self then
			table.remove(images_panels, k)
			return
		end
	end
end

function PANEL:SetMinus(minus)
	self.minus = minus
end

function PANEL:SetRotation(rotation)
	self.rotation = rotation
end

function PANEL:SetImageColor(col)
	self.image_col = col
end

local cached_files = {}
local get_files = function(image_path)
	local f = cached_files[image_path]
	if f then return f end

	cached_files[image_path] = file.Find(image_path .. "/*", "DATA")

	return cached_files[image_path]
end

function PANEL:SetImage(url)
	self.image = err_mat

	self.pos = nil
	self.delay = nil

	self.images = nil
	self.delays = nil
	self.url = url

	if url:sub(1, 4) ~= "http" then
		self.image = SUI.Material(url)
		return
	end

	local image_path = get_image_path(url)
	if not file.Exists(image_path, "DATA") or is_downloading_image(url) then
		download_image(url, function()
			if self:IsValid() then
				self:SetImage(url)
			end
		end)
		return
	end

	local is_gif = file.IsDir(image_path, "DATA")
	if is_gif then
		local images = {}
		local delays = {}

		local files = get_files(image_path)
		for i = 1, #files do
			local v = files[i]
			local id, delay = v:match("(.*)_(.*)%.png")
			id = tonumber(id)
			local img_path = "../data/" .. image_path .. "/" .. v
			images[id] = img_path
			delays[id] = delay
		end

		self.frame = 1
		self.delay = (UnPredictedCurTime() * 100) + delays[1]

		self.images = images
		self.delays = delays

		self.max_images = #files
	else
		self.image = SUI.Material("../data/" .. image_path)
	end
end

local SetMaterial = surface.SetMaterial
function PANEL:PaintGIF(w, h, images)
	local frame = self.frame

	-- SUI.Material() caches materials by default
	local mat = SUI.Material(images[frame], true)
	if not mat then
		if frame > 1 then
			mat = SUI.Material(images[frame - 1])
		else
			mat = err_mat
		end

		SetMaterial(mat)

		return
	end

	SetMaterial(mat)

	local curtime = UnPredictedCurTime() * 100
	if curtime < self.delay then return end
	frame = frame + 1
	if frame > self.max_images then
		frame = 1
	end

	self.frame = frame
	self.delay = curtime + self.delays[frame]
end

local PaintGIF = PANEL.PaintGIF
local SetDrawColor = surface.SetDrawColor
local DrawTexturedRectRotated = surface.DrawTexturedRectRotated
function PANEL:Paint(w, h)
	SetDrawColor(self.image_col)

	local images = self.images
	if images then
		PaintGIF(self, w, h, images)
	else
		SetMaterial(self.image)
	end

	if self.Draw then
		self:Draw(w, h, true)
	else
		local minus = self.minus
		DrawTexturedRectRotated(w * 0.5, h * 0.5, w - minus, h - minus, self.rotation)
	end
end

sui.register("Image", PANEL, "PANEL")

function SUI.ClearImages()
	local files, dirs = file.Find(images_path .. "/*", "DATA")
	for _, f in ipairs(files) do
		file.Delete(images_path .. f)
	end

	for _, d in ipairs(dirs) do
		for _, f in ipairs(file.Find(images_path .. d .. "/*", "DATA")) do
			file.Delete(images_path .. (d .. "/" .. f))
		end
		file.Delete(images_path .. d)
	end

	table.Empty(SUI.materials)
	table.Empty(cached_files)

	hook.Call(NAME .. "ImagesCleared")

	for k, v in ipairs(images_panels) do
		if v.url then
			v:SetImage(v.url)
		end
	end
end
--PATH addons/111mod/lua/autorun/sh_chatmessages.lua:
AddCSLuaFile()
require 'pon'

local PREFIX = {Color(152, 25, 29), "GambitRP | "}

local text = Color(255, 255, 255)
local lime = Color(0, 255, 100)
local orange = Color(255, 180, 10)
local red = Color(255, 0, 0)
local gold = Color(255, 255, 0)
local yellow = Color(255, 255, 0)

local MESSAGES = {
	{text, "Хотите больше плюшек? Нажмите: ", orange, "F4", text, " и зайдите в", lime, " Донат!"},
	{text, "Открывайте крутые кейсы, команда: ", Color(50, 255, 255), "!unbox"},
	{text, "Наша группа discord: ", lime, "https://gambitrp.site/discord"},
	{orange, "Весенние скидки " , red, "50%" , orange , " на весь донат", orange , " нажмите " , lime , "F4 ", orange ,"-> Донат!"},
	{text, "Если у вас, есть жалоба на игрока пишите: ", lime, "@ <Сообщение> ", text, "и вам помогут!", orange, " Не спамьте в ooc или advert!"},
	{text, "Участвуй в королевском ",Color(154, 205, 50),"BattlePass ",text,"жми " , orange, "F7!"},
	{gold, "Успей купить донат по скидке" , red, " 50% ", gold , "нажмите " , lime, "F4 ", gold ,"-> Донат!"},
	{text, "Выстави свой дубликат на продажу, команда - " , Color(32, 178, 170), "!market"},
}

if (SERVER) then
	local CYCLE_TIME = 180

	util.AddNetworkString("AutoChatMessage")
	local curmsg = 1
	
	timer.Create("AutoChatMessages", CYCLE_TIME, 0, function()
		net.Start("AutoChatMessage")
			net.WriteUInt(curmsg, 16)
		net.Broadcast()

		curmsg = curmsg + 1
		if (curmsg > #MESSAGES) then
			curmsg = 1
		end
	end)
	
else
	net.Receive("AutoChatMessage", function()
		local t = {}
		table.Add(t, PREFIX)
		table.Add(t, MESSAGES[net.ReadUInt(16)])
		
		chat.AddText(unpack(t))
	end)	
end
--PATH MediaLib_DynFile_webm.lua:
local oop = medialib.load("oop")

local WebmService = oop.class("WebmService", "HTMLService")
WebmService.identifier = "webm"

local all_patterns = {"^https?://.*%.webm"}

function WebmService:parseUrl(url)
	for _,pattern in pairs(all_patterns) do
		local id = string.match(url, pattern)
		if id then
			return {id = id}
		end
	end
end

function WebmService:isValidUrl(url)
	return self:parseUrl(url) ~= nil
end

local player_url = "http://wyozi.github.io/gmod-medialib/webm.html?id=%s"
function WebmService:resolveUrl(url, callback)
	local urlData = self:parseUrl(url)
	local playerUrl = string.format(player_url, urlData.id)

	callback(playerUrl, {start = urlData.start})
end

function WebmService:directQuery(url, callback)
	callback(nil, {
		title = url:match("([^/]+)$")
	})
end

return WebmService
--PATH addons/weaponandcontent/lua/autorun/sounds.lua:
//M249
sound.Add({
	name = 			"Alt_Weapon_M249.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/2m249/m249-1.wav"
})

sound.Add({
	name = 			"2eapon_M249.Boxout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2m249/m249_boxout.mp3"
})

sound.Add({
	name = 			"2eapon_M249.Coverup",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2m249/m249_coverup.mp3"
})

sound.Add({
	name = 			"2eapon_M249.Boxin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2m249/m249_boxin.mp3"
})

sound.Add({
	name = 			"2eapon_M249.Chain",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2m249/m249_chain.mp3"
})

sound.Add({
	name = 			"2eapon_M249.Coverdown",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2m249/m249_coverdown.mp3"
})

sound.Add({
	name = 			"2eapon_M249.Draw",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2m249/m249_draw.mp3"
})

//DEagle
sound.Add({
	name = 			"Alt_Weapon_DEagle.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/2deagle/deagle-1.wav"
})

sound.Add({
	name = 			"2eapon_Deagle.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2deagle/clipout.mp3"
})

sound.Add({
	name = 			"2eapon_Deagle.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2deagle/clipin.mp3"
})

sound.Add({
	name = 			"2eapon_Deagle.Slideforward",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2deagle/1911slideforward.mp3"
})

sound.Add({
	name = 			"2eapon_Deagle.Slideback",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2deagle/1911slideback.mp3"
})

//FiveseveN
sound.Add({
	name = 			"Alt_Weapon_FiveSeven.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/2fiveseven/fiveseven-1.wav"
})

sound.Add({
	name = 			"2eapon_57.clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2fiveseven/clipout.mp3"
})

sound.Add({
	name = 			"2eapon_57.clipin1",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2fiveseven/clipin1.mp3"
})

sound.Add({
	name = 			"2eapon_57.clipin2",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2fiveseven/clipin2.mp3"
})

sound.Add({
	name = 			"2eapon_57.SlideForward",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2fiveseven/slideforward.mp3"
})

sound.Add({
	name = 			"2eapon_57.SlideBack",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2fiveseven/slideback.mp3"
})

//Glock
sound.Add({
	name = 			"Alt_Weapon_Glock.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/2glock/glock18-1.wav"
})

sound.Add({
	name = 			"2lideback",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2glock/slideback.mp3"
})

sound.Add({
	name = 			"2liderelease",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2glock/sliderelease.mp3"
})

sound.Add({
	name = 			"2agout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2glock/magout.mp3"
})

sound.Add({
	name = 			"2agin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2glock/magin.mp3"
})

//P228
sound.Add({
	name = 			"Alt_Weapon_P228.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/2p228/p228-1.wav"
})

sound.Add({
	name = 			"2eapon_p228.clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2p228/clipout.mp3"
})

sound.Add({
	name = 			"2eapon_p228.clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2p228/clipin.mp3"
})

sound.Add({
	name = 			"2eapon_p228.sliderelease",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2p228/sliderelease.mp3"
})

sound.Add({
	name = 			"2eapon_p228.slideback",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2p228/slideback.mp3"
})

sound.Add({
	name = 			"2eapon_p228.slideforward",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2p228/slideforward.mp3"
})

//AK47
sound.Add({
	name = 			"Alt_Weapon_AK47.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/2ak47/ak47-1.wav"
})

sound.Add({
	name = 			"2eapon_AK47.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2ak47/clipout.mp3"
})

sound.Add({
	name = 			"2eapon_AK47.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2ak47/clipin.mp3"
})

sound.Add({
	name = 			"2eapon_AK47.BoltPull",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2ak47/boltpull.mp3"
})

sound.Add({
	name = 			"2eapon_AK47.BoltBack",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2ak47/boltback.mp3"
})

//AUG
sound.Add({
	name = 			"Alt_Weapon_AUG.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/2aug/aug-1.wav"
})

sound.Add({
	name = 			"2eapon_AUG.Forearm",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2aug/aug_forearm.mp3"
})

sound.Add({
	name = 			"2eapon_AUG.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2aug/aug_boltpull.mp3"
})

sound.Add({
	name = 			"2eapon_AUG.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2aug/aug_clipout.mp3"
})

sound.Add({
	name = 			"2eapon_AUG.clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2aug/aug_clipin.mp3"
})

sound.Add({
	name = 			"2eapon_AUG.Boltslap",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2aug/aug_boltslap.mp3"
})

//FAMAS
sound.Add({
	name = 			"Alt_Weapon_FAMAS.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/2famas/famas-1.wav"
})

sound.Add({
	name = 			"2eapon_FAMAS.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2famas/famas_clipout.mp3"
})

sound.Add({
	name = 			"2eapon_FAMAS.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2famas/famas_clipin.mp3"
})

sound.Add({
	name = 			"2eapon_FAMAS.Forearm",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2famas/famas_forearm.mp3"
})

//Galil
sound.Add({
	name = 			"Alt_Weapon_Galil.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/2galil/galil-1.wav"
})

sound.Add({
	name = 			"2eapon_Galil.clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2galil/magout.mp3"
})

sound.Add({
	name = 			"2eapon_Galil.clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2galil/magin.mp3"
})

sound.Add({
	name = 			"2eapon_Galil.cliptap",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2galil/tap.mp3"
})

sound.Add({
	name = 			"2eapon_Galil.boltpull",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2galil/boltpull.mp3"
})

sound.Add({
	name = 			"2eapon_Galil.boltrelease",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2galil/boltrel.mp3"
})

//M4
sound.Add({
	name = 			"Alt_Weapon_M4A1.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 		{"weapons/2m4a1/m4a1_unsil-1.wav",
					"weapons/2m4a1/m4a1_unsil-2.wav"}
})

sound.Add({
	name = 			"Alt_Weapon_M4A1.2",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			{"weapons/2m4a1/m4a1-1.wav",
						"weapons/2m4a1/m4a1-2.wav"}
})

sound.Add({
	name = 			"2eapon_M4A1.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2m4a1/m4a1_clipout.mp3"
})

sound.Add({
	name = 			"2eapon_M4A1.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2m4a1/newclipin.mp3"
})

sound.Add({
	name = 			"2eapon_M4A1.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2m4a1/m4a1_boltpull.mp3"
})

sound.Add({
	name = 			"2eapon_M4A1.Deploy",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2m4a1/safety.mp3"
})

sound.Add({
	name = 			"2eapon_M4A1.Silencer_On",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2m4a1/m4a1_silencer_on.mp3"
})

sound.Add({
	name = 			"2eapon_M4A1.Silencer_Off",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2m4a1/m4a1_silencer_off.mp3"
})

//Sig 552
sound.Add({
	name = 			"Alt_Weapon_SG552.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/2sg552/sg552-1.wav"
})

sound.Add({
	name = 			"2eapon_SG552.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2sg552/sg552_clipout.mp3"
})

sound.Add({
	name = 			"2eapon_SG552.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2sg552/sg552_clipin.mp3"
})

sound.Add({
	name = 			"2eapon_SG552.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2sg552/sg552_boltpull.mp3"
})

sound.Add({
	name = 			"2eapon_SG552.Stockfold",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2sg552/stockfold.mp3"
})

//M3 Super 90
sound.Add({
	name = 			"Alt_Weapon_M3.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/2m3/m3-1.wav"
})
sound.Add({
	name = 			"2eapon_M3.Pump",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2m3/m3_pump.mp3"
})

sound.Add({
	name = 			"2eapon_M3.Insertshell",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2m3/m3_insertshell.mp3"
})

sound.Add({
	name = 			"2eapon_M3.Draw",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2m3/cloth.mp3"
})

//XM1014
sound.Add({
	name = 			"Alt_Weapon_XM1014.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			{"weapons/2xm1014/xm1014-1.wav",
						"weapons/2xm1014/xm1014-2.wav"}
})

sound.Add({
	name = 			"2eapon_XM1014.Insertshell",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2xm1014/xm_cock.mp3"
})

sound.Add({
	name = 			"2eapon_XM1014.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2xm1014/xm_insert.mp3"
})

sound.Add({
	name = 			"2eapon_XM1014.Deploy",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2xm1014/xm_deploy.mp3"
})

//MAC 10
sound.Add({
	name = 			"Alt_Weapon_MAC10.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/2mac10/mac10-1.wav"
})

sound.Add({
	name = 			"2eapon_MAC10.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2mac10/mac10_clipout.mp3"
})

sound.Add({
	name = 			"2eapon_MAC10.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2mac10/mac10_clipin.mp3"
})

//MP5
sound.Add({
	name = 			"Alt_Weapon_MP5Navy.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/2mp5navy/mp5-1.wav"
})

sound.Add({
	name = 			"2eapon_MP5Navy.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2mp5navy/mp5_clipout.mp3"
})

sound.Add({
	name = 			"2eapon_MP5Navy.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2mp5navy/mp5_clipin.mp3"
})

sound.Add({
	name = 			"2eapon_MP5Navy.Slideback",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2mp5navy/mp5_slideback.mp3"
})

//p90
sound.Add({
	name = 			"Alt_Weapon_P90.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/2p90/p90-1.wav"
})

sound.Add({
	name = 			"2eapon_P90.unlock",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2p90/p90_unlock.mp3"
})

sound.Add({
	name = 			"2eapon_P90.magout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2p90/p90_magout.mp3"
})

sound.Add({
	name = 			"2eapon_P90.magin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2p90/p90_magin.mp3"
})

sound.Add({
	name = 			"2eapon_P90.cock",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2p90/p90_cock.mp3"
})

//TMP
sound.Add({
	name = 			"Alt_Weapon_TMP.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/2tmp/tmp-1.wav"
})

sound.Add({
	name = 			"2eapon_TMP.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2tmp/tmp_clipout.mp3"
})

sound.Add({
	name = 			"2eapon_TMP.clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2tmp/tmp_clipin.mp3"
})

sound.Add({
	name = 			"2eapon_TMP.boltpull",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2tmp/tmp_boltpull.mp3"
})

sound.Add({
	name = 			"2eapon_TMP.Deploy",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2tmp/cloth.mp3"
})

//UMP45
sound.Add({
	name = 			"Alt_Weapon_UMP45.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/2ump45/ump45-1.wav"
})

sound.Add({
	name = 			"2eapon_UMP45.Clipout1",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2ump45/ump45_clipout1.mp3"
})

sound.Add({
	name = 			"2eapon_UMP45.Clipout2",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2ump45/ump45_clipout2.mp3"
})

sound.Add({
	name = 			"2eapon_UMP45.Clipin1",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2ump45/ump45_clipin1.mp3"
})

sound.Add({
	name = 			"2eapon_UMP45.Clipin2",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2ump45/ump45_clipin2.mp3"
})

sound.Add({
	name = 			"2eapon_UMP45.Boltslap",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2ump45/ump45_boltslap.mp3"
})

sound.Add({
	name = 			"2eapon_UMP45.Cloth",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2ump45/ump45_cloth.mp3"
})

//AWP
sound.Add({
	name = 			"Alt_Weapon_AWP.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/2awp/awp1.wav"
})

sound.Add({
	name = 			"2eapon_AWP.Bolt",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2awp/awp_bolt.mp3"
})

sound.Add({
	name = 			"2eapon_AWP.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2awp/awp_clipout.mp3"
})

sound.Add({
	name = 			"2eapon_AWP.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2awp/awp_clipin.mp3"
})

//G3SG1
sound.Add({
	name = 			"Alt_Weapon_G3SG1.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/2g3sg1/g3sg1-1.wav"
})

sound.Add({
	name = 			"2eapon_PSG_1.Boltpull1",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2g3sg1/psg_1_boltpull1.mp3"
})

sound.Add({
	name = 			"2eapon_PSG_1.Boltpull2",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2g3sg1/psg_1_boltpull2.mp3"
})

sound.Add({
	name = 			"2eapon_PSG_1.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2g3sg1/psg_1_clipout.mp3"
})

sound.Add({
	name = 			"2eapon_PSG_1.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2g3sg1/psg_1_clipin.mp3"
})

sound.Add({
	name = 			"2eapon_PSG_1.Boltrelease",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2g3sg1/psg_1_boltrelease.mp3"
})

sound.Add({
	name = 			"2eapon_PSG_1.Draw",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2g3sg1/psg_1_draw.mp3"
})

//Scout
sound.Add({
	name = 			"Alt_Weapon_Scout.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/2scout/scout_fire-1.wav"
})

sound.Add({
	name = 			"2eapon_scout.Boltback",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2scout/m24_boltback.mp3"
})

sound.Add({
	name = 			"2eapon_scout.boltforward",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2scout/m24_boltforward.mp3"
})

sound.Add({
	name = 			"2eapon_scout.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2scout/m24_magout.mp3"
})

sound.Add({
	name = 			"2eapon_scout.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2scout/m24_magin.mp3"
})

//SG550
sound.Add({
	name = 			"Alt_Weapon_SG550.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/2sg550/sg550-1.wav"
})

sound.Add({
	name = 			"2eapon_SG550.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2sg550/sg552_clipout.mp3"
})

sound.Add({
	name = 			"2eapon_SG550.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2sg550/sg552_clipin.mp3"
})

sound.Add({
	name = 			"2eapon_SG550.Boltpull",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2sg550/sg552_boltpull.mp3"
})

//USP
sound.Add({
	name = 			"Alt_Weapon_USP.2",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/2usp/usp1.wav"
})

sound.Add({
	name = 			"Alt_Weapon_USP.1",
	channel = 		CHAN_USER_BASE+10,
	volume = 		1.0,
	sound = 			"weapons/2usp/usp_unsil-1.wav"
})

sound.Add({
	name = 			"2eapon_uspc.Clipout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2usp/magout.mp3"
})

sound.Add({
	name = 			"2eapon_uspc.magpouch",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2usp/magpouch.mp3"
})

sound.Add({
	name = 			"2eapon_uspc.Clipin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2usp/uspc_clipin.mp3"
})

sound.Add({
	name = 			"2eapon_uspc.sliderelease",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2usp/sliderelease.mp3"
})

sound.Add({
	name = 			"2eapon_uspc.Safety",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2usp/safety.mp3"
})

sound.Add({
	name = 			"2eapon_USP.AttachSilencer",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2usp/usp_silencer_on.mp3"
})

sound.Add({
	name = 			"2eapon_USP.DetachSilencer",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/2usp/usp_silencer_off.mp3"
})
--PATH addons/dermaf4/lua/ui/controls/playerbutton.lua:
local PANEL = {}

function PANEL:Init()
	self.AvatarButton = ui.Create('ui_avatarbutton', self)

	self:SetText('')
	self:SetFont('ui.22')
	self:SetTextColor(ui.col.White)
	self:SetTall(30)
end

function PANEL:PerformLayout()
	self.AvatarButton:SetPos(2,2)
	self.AvatarButton:SetSize(26, 26)
end

function PANEL:SetPlayer(pl)
	self.Player = pl
	self.PlayerColor = (pl.GetJobColor and pl:GetJobColor() or team.GetColor(pl:Team())):Copy()

	self:SetText(pl:Name())

	self.AvatarButton:SetPlayer(pl)
end

function PANEL:SetInfo(name, steamid64)
	local pl = player.Find(steamid64)
	if IsValid(pl) then
		self:SetPlayer(pl)
		return
	end

	self.PlayerColor = team.GetColor(1):Copy()

	self:SetText(name)

	self.AvatarButton:SetSteamID64(steamid64)
end

function PANEL:DoClick()

end

function PANEL:Paint(w, h)
	derma.SkinHook('Paint', 'PlayerButton', self, w, h)
end

vgui.Register('ui_playerbutton', PANEL, 'DButton')
--PATH addons/dermaf4/lua/ui/controls/scrollpanel.lua:
local SCROLLBAR = {}
function SCROLLBAR:Init()
	self.parent = self:GetParent()

	self.scrollButton = vgui.Create('Panel', self)
	self.scrollButton.OnMousePressed = function(s, mb)
		if (mb == MOUSE_LEFT and !self:GetParent().ShouldHideScrollbar) then
			local mx, my = s:CursorPos()

			s.scrolling = true
			s.mouseOffset = my
		end
	end
	self.scrollButton.OnMouseReleased = function(s, mb)
		if (mb == MOUSE_LEFT) then
			s.scrolling = false
			s.mouseOffset = nil
		end
	end

	self.height = 0
	self.addWidth = 0
end

function SCROLLBAR:Think()
	if (self.scrollButton.scrolling) then
		if (!input.IsMouseDown(MOUSE_LEFT)) then
			self.scrollButton:OnMouseReleased(MOUSE_LEFT)
			return
		end

		local mx, my = self.scrollButton:CursorPos()

		local diff = my - self.scrollButton.mouseOffset

		local maxOffset = self.parent:GetCanvas():GetTall() - self.parent:GetTall()

		local perc = (self.scrollButton.y + diff) / (self:GetTall() - self.height)
		self.parent.yOffset = math.Clamp(perc * maxOffset, 0, maxOffset)

		self.parent:InvalidateLayout()
	end

	local preSize = self.addWidth

	local mx, my = self:CursorPos()
	if ((mx > -8 and mx < self:GetWide() + 3 and my > self.scrollButton.y and my < self.scrollButton.y + self.height) or self.scrollButton.scrolling) then
		self.addWidth = math.Clamp(self.addWidth + (FrameTime() * 96), 0, 8)
	else
		self.addWidth = math.Clamp(self.addWidth - (FrameTime() * 96), 0, 8)
	end

	if (preSize != self.addWidth) then
		self:InvalidateLayout()
	end
end

function SCROLLBAR:PerformLayout()
	local maxOffset = self.parent:GetCanvas():GetTall() - self.parent:GetTall()

	self:SetSize(2 + self.addWidth, self.parent:GetTall())
	self:SetPos(self.parent:GetWide() - self:GetWide(), 0)

	self.heightRatio = self.parent:GetTall() / self.parent:GetCanvas():GetTall()
	self.height = math.Clamp(math.ceil(self.heightRatio * self.parent:GetTall()), 20, math.huge)

	self.scrollButton:SetSize(self:GetWide(), self.height)
	self.scrollButton:SetPos(0, math.Clamp((self.parent.yOffset / maxOffset), 0, 1) * (self:GetTall() - self.height))
end

function SCROLLBAR:Paint(w, h)
	if (self:GetParent().ShouldHideScrollbar) then return end

	derma.SkinHook('Paint', 'UIScrollBar', self, w, h)
end

function SCROLLBAR:OnMouseWheeled(delta)
	self.parent:OnMouseWheeled(delta)
end

vgui.Register('ui_scrollbar', SCROLLBAR, 'Panel')


local SCROLLABLE = {}
function SCROLLABLE:Init()
	self.contentContainer = vgui.Create('Panel', self)
	self.contentContainer:SetMouseInputEnabled(true)

	self.scrollBar = vgui.Create('ui_scrollbar', self)
	self.scrollBar:SetMouseInputEnabled(true)

	self.yOffset = 0
	self.ySpeed = 0
	self.scrollSize = 4
	self.SpaceTop = 0
	self.Padding = 0

	function self.contentContainer:OnChildRemoved(child)
		self:GetParent():PerformLayout()
	end
end

function SCROLLABLE:Reset()
	self:GetCanvas():Clear(true)
	self.yOffset = 0
	self.ySpeed = 0
	self.scrollSize = 1

	self:PerformLayout()
end

function SCROLLABLE:AddItem(child)
	child:SetParent(self:GetCanvas())
	self:PerformLayout()
end

function SCROLLABLE:SetSpacing(i)
	self.SpaceTop = i
end

function SCROLLABLE:SetPadding(i)
	self.Padding = i
end

function SCROLLABLE:GetCanvas()
	return self.contentContainer
end

function SCROLLABLE:SetScrollSize(int)
	self.scrollSize = int
end

function SCROLLABLE:ScrollTo(y)
	self.yOffset = y

	self:InvalidateLayout()
end

function SCROLLABLE:OnMouseWheeled(delta)
	if ((delta > 0 and self.ySpeed < 0) or (delta < 0 and self.ySpeed > 0)) then
		self.ySpeed = 0
	else
		self.ySpeed = self.ySpeed + (delta * self.scrollSize)
	end

	self:PerformLayout()
end

function SCROLLABLE:SetOffset(offSet)
	local maxOffset = (self:GetCanvas():GetTall() - self:GetTall())
	if (maxOffset < 0) then maxOffset = 0 end

	self.yOffset = math.Clamp(offSet, 0, maxOffset)

	self:PerformLayout()

	if (self.yOffset == 0 or self.yOffset == maxOffset) then return true end
end

function SCROLLABLE:Think()
	if (self.ySpeed != 0) then
		if (self:SetOffset(self.yOffset - self.ySpeed)) then
			self.ySpeed = 0
		else
			if (self.ySpeed < 0) then
				self.ySpeed = math.Clamp(self.ySpeed + (FrameTime() * self.scrollSize * 4), self.ySpeed, 0)
			else
				self.ySpeed = math.Clamp(self.ySpeed - (FrameTime() * self.scrollSize * 4), 0, self.ySpeed)
			end
		end
	end
end

function SCROLLABLE:PerformLayout()
	local canvas = self:GetCanvas()

	if (canvas:GetWide() != self:GetWide()) then
		canvas:SetWide(self:GetWide())
	end

	local y = 0
	local lastChild
	for k, v in ipairs(canvas:GetChildren()) do
		if (not v:IsVisible()) and self.HideInvisible then continue end

		local childY = y + self.SpaceTop
		if (v.x != self.Padding or v.y != childY) then
			v:SetPos(math.max(0, self.Padding), y + self.SpaceTop)
		end
		if (v:GetWide() != self:GetWide() - self.Padding * 2) then
			v:SetWide(math.min(self:GetWide(), self:GetWide() - self.Padding * 2))
		end

		y = v.y + v:GetTall() + self.SpaceTop + self.Padding
		lastChild = v
	end
	y = lastChild and lastChild.y + lastChild:GetTall() or y
	if (canvas:GetTall() != y) then
		canvas:SetTall(y)
	end

	if (canvas:GetTall() <= self:GetTall() and self.scrollBar:IsVisible()) then
		canvas:SetTall(self:GetTall())

		self.scrollBar:SetVisible(false)
	elseif (canvas:GetTall() > self:GetTall() and !self.scrollBar:IsVisible()) then
		self.scrollBar:SetVisible(true)
	end

	local maxOffset = (self:GetCanvas():GetTall() - self:GetTall())

	if (self.yOffset > maxOffset) then
		self.yOffset = maxOffset
	end

	if (self.yOffset < 0) then
		self.yOffset = 0
	end

	if (canvas.x != 0 or canvas.y != -self.yOffset) then
		canvas:SetPos(0, -self.yOffset)
		self.scrollBar:InvalidateLayout()
	end
end

function SCROLLABLE:IsAtMaxOffset()
	local maxOffset = math.Clamp(self:GetCanvas():GetTall() - self:GetTall(), 0, math.huge)
	return self.yOffset == maxOffset
end

function SCROLLABLE:Paint(w, h)
end

function SCROLLABLE:HideScrollbar(bool)
	self.ShouldHideScrollbar = bool
end

function SCROLLABLE:DockToFrame()
	local p = self:GetParent()
	local x, y = p:GetDockPos()
	self:SetPos(x, y)
	self:SetSize(p:GetWide() - 10, p:GetTall() - (y + 5))
end

vgui.Register('ui_scrollpanel', SCROLLABLE, 'Panel')
--PATH addons/dermaf4/lua/ui/controls/slider.lua:
local PANEL = {}

function PANEL:Init()
	self.ButtonContainer = ui.Create('Panel', self)
	self.ButtonContainer.Paint = function() end

	self.Button = ui.Create('DButton', self.ButtonContainer)
	self.Button.OnMousePressed = function(s, mb) if (mb == MOUSE_LEFT) then self:StartDrag() end end
	self.Button:SetText('')
	self.Button.Paint = function(self, w, h)
		derma.SkinHook('Paint', 'SliderButton', self, w, h)
	end

	self:SetValue(0.5)
end

function PANEL:PerformLayout()
	self:SetTall(20)

	self.ButtonContainer:SetPos(40, 0)
	self.ButtonContainer:SetSize(self:GetWide() - 40, self:GetTall())

	self.Button:SetSize(20, 20)
	self.Button:SetPos(self.Value * (self.ButtonContainer:GetWide() - 20), 0)
end

function PANEL:Paint(w, h)
	derma.SkinHook('Paint', 'UISlider', self, w, h)
end

function PANEL:Think()

	if (self.Dragging) then
		local mx, my = self:CursorPos()
		mx = mx - 40
		mx = math.Clamp(mx - self.OffX, 0, self.ButtonContainer:GetWide() - 20)

		if (self.Button.x != mx) then
			self:SetValue(mx / (self.ButtonContainer:GetWide() - 20))
			self:OnChange(self.Value)
		end

		if (!input.IsMouseDown(MOUSE_LEFT)) then
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
	self.Button:SetPos(val * (self.ButtonContainer:GetWide() - 20), 0)
end

function PANEL:GetValue()
	return self.Value
end

vgui.Register('ui_slider', PANEL, 'Panel')
--PATH addons/_adminmodules/lua/ulib/shared/defines.lua:
--[[
	Title: Defines

	Holds some defines used on both client and server.
]]

ULib = ULib or {}

ULib.RELEASE = false -- Don't access these two directly, use ULib.pluginVersionStr("ULib")
ULib.VERSION = 2.63
ULib.AUTOMATIC_UPDATE_CHECKS = true

ULib.ACCESS_ALL = "user"
ULib.ACCESS_OPERATOR = "operator"
ULib.ACCESS_ADMIN = "admin"
ULib.ACCESS_SUPERADMIN = "superadmin"

ULib.DEFAULT_ACCESS = ULib.ACCESS_ALL

ULib.DEFAULT_TSAY_COLOR = Color( 151, 211, 255 ) -- Found by using MS Paint


--[[
	Section: Umsg Helpers

	These are ids for the ULib umsg functions, so the client knows what they're getting.
]]
ULib.TYPE_ANGLE = 1
ULib.TYPE_BOOLEAN = 2
ULib.TYPE_CHAR = 3
ULib.TYPE_ENTITY = 4
ULib.TYPE_FLOAT = 5
ULib.TYPE_LONG = 6
ULib.TYPE_SHORT = 7
ULib.TYPE_STRING = 8
ULib.TYPE_VECTOR = 9
-- These following aren't actually datatypes, we handle them ourselves
ULib.TYPE_TABLE_BEGIN = 10
ULib.TYPE_TABLE_END = 11
ULib.TYPE_NIL = 12

ULib.RPC_UMSG_NAME = "URPC"

ULib.TYPE_SIZE = {
	[ULib.TYPE_ANGLE] = 12, -- 3 floats
	[ULib.TYPE_BOOLEAN] = 1,
	[ULib.TYPE_CHAR] = 1,
	[ULib.TYPE_ENTITY] = 4, -- Found through trial and error
	[ULib.TYPE_FLOAT] = 4,
	[ULib.TYPE_LONG] = 4,
	[ULib.TYPE_SHORT] = 2,
	[ULib.TYPE_VECTOR] = 12, -- 3 floats
	[ULib.TYPE_NIL] = 0, -- Not technically a type but we handle it anyways
}

ULib.MAX_UMSG_BYTES = 255

--[[
	Section: Hooks

	These are the hooks that ULib has created that other modders are free to make use of.
]]

--[[
	Hook: UCLAuthed

	Called *on both server and client* when a player has been (re)authenticated by UCL. Called for ALL players, regardless of access.

	Parameters passed to callback:

		ply - The player that got (re)authenticated.

	Revisions:

		v2.40 - Initial
]]
ULib.HOOK_UCLAUTH = "UCLAuthed"

--[[
	Hook: UCLChanged

	Called *on both server and client* when anything in ULib.ucl.users, ULib.ucl.authed, or ULib.ucl.groups changes. No parameters are passed to callbacks.

	Revisions:

		v2.40 - Initial
]]
ULib.HOOK_UCLCHANGED = "UCLChanged"

--[[
	Hook: UCLAccessRegistered

	Called *on both server and client* when one or more unrecognized accesses are registered. No parameters are passed to callbacks.

	Revisions:

		v2.70 - Initial
]]
ULib.HOOK_ACCESS_REGISTERED = "UCLAccessRegistered"

--[[
	Hook: ULibReplicatedCvarChanged

	Called *on both client and server* when a replicated cvar changes or is created.

	Parameters passed to callback:

		sv_cvar - The name of the server-side cvar.
		cl_cvar - The name of the client-side cvar.
		ply - The player changing the cvar or nil on initial value.
		old_value - The previous value of the cvar, nil if this call is to set the initial value.
		new_value - The new value of the cvar.

	Revisions:

		v2.40 - Initial
		v2.50 - Removed nil on client side restriction.
]]
ULib.HOOK_REPCVARCHANGED = "ULibReplicatedCvarChanged"

--[[
	Hook: ULibLocalPlayerReady

	Called *on both client and server* when a player entity is created. (can now run commands). Only works for local
	player on the client side.

	Parameters passed to callback:

		ply - The player that's ready (local player on client side).

	Revisions:

		v2.40 - Initial
]]
ULib.HOOK_LOCALPLAYERREADY = "ULibLocalPlayerReady"

--[[
	Hook: ULibCommandCalled

	Called *on server* whenever a ULib command is run, return false to override and not allow, true to stop executing callbacks and allow.

	Parameters passed to callback:

		ply - The player attempting to execute the command.
		commandName - The command that's being executed.
		args - The table of args for the command.

	Revisions:

		v2.40 - Initial
]]
ULib.HOOK_COMMAND_CALLED = "ULibCommandCalled"

--[[
	Hook: ULibPlayerTarget

	Called whenever one player is about to target another player. Called *BEFORE* any other validation
	takes place. Return false and error message to disallow target completely, return true to
	override any other validation logic and allow the target to take place, return a player to force
	the target to be the specified player.

	Parameters passed to callback:

		ply - The player attempting to execute the command.
		commandName - The command that's being executed.
		target - The proposed target of the command before any other validation logic takes place.

	Revisions:

		v2.40 - Initial
]]
ULib.HOOK_PLAYER_TARGET = "ULibPlayerTarget"

--[[
	Hook: ULibPlayerTargets

	Called whenever one player is about to target another set of players. Called *BEFORE* any other validation
	takes place. Return false and error message to disallow target completely, return true to
	override any other validation logic and allow the target to take place, return a table of players to force
	the targets to be the specified players.

	Parameters passed to callback:

		ply - The player attempting to execute the command.
		commandName - The command that's being executed.
		targets - The proposed targets of the command before any other validation logic takes place.

	Revisions:

		v2.40 - Initial
]]
ULib.HOOK_PLAYER_TARGETS = "ULibPlayerTargets" -- Exactly the same as the above but used when the player is using a command that can target multiple players.

--[[
	Hook: ULibPostTranslatedCommand

	*Server hook*. Called after a translated command (ULib.cmds.TranslatedCommand) has been successfully
	verified. This hook directly follows the callback for the command itself.

	Parameters passed to callback:

		ply - The player that executed the command.
		commandName - The command that's being executed.
		translated_args - A table of the translated arguments, as passed into the callback function itself.

	Revisions:

		v2.40 - Initial
]]
ULib.HOOK_POST_TRANSLATED_COMMAND = "ULibPostTranslatedCommand"

--[[
	Hook: ULibPlayerNameChanged

	Called within one second of a player changing their name.

	Parameters passed to callback:

		ply - The player that changed names.
		oldName - The player's old name, before the change.
		newName - The player's new name, after the change.

	Revisions:

		v2.40 - Initial
]]
ULib.HOOK_PLAYER_NAME_CHANGED = "ULibPlayerNameChanged"

--[[
	Hook: ULibGetUsersCustomKeyword

	Called during ULib.getUsers when considering a target string for keywords.
	This could be used to create a new, custom keyword for targeting users who
	have been connected for less than five minutes, for example.
	Return nil or a table of player objects to add to the target list.

	Parameters passed to callback:

		target - A string chunk of a possibly larger target list to operate on.
		ply - The player doing the targeting, not always specified (can be nil).

	Revisions:

		v2.60 - Initial
]]
ULib.HOOK_GETUSERS_CUSTOM_KEYWORD = "ULibGetUsersCustomKeyword"

--[[
	Hook: ULibGetUserCustomKeyword

	Called during ULib.getUser when considering a target string for keywords.
	This could be used to create a new, custom keyword for always targeting a
	specific connected steamid, for example. Or, to target the shortest connected
	player.
	Return nil or a player object.

	Parameters passed to callback:

		target - A string target.
		ply - The player doing the targeting, not always specified (can be nil).

	Revisions:

		v2.60 - Initial
]]
ULib.HOOK_GETUSER_CUSTOM_KEYWORD = "ULibGetUserCustomKeyword"

--[[
	Hook: ULibPlayerKicked

	Called during ULib.kick.
	This alerts you to the player being kicked.

	Parameters passed to callback:

		steamid - String of SteamID of the kicked player.
		reason - String of kick reason or nil.
		caller - Player object of whomever did the kick or nil.

	Revisions:

		v2.62 - Initial
]]
ULib.HOOK_USER_KICKED = "ULibPlayerKicked"

--[[
	Hook: ULibPlayerBanned

	Called during ULib.addBan.
	This alerts you to the player being banned.

	Parameters passed to callback:

		steamid - String of SteamID of the banned player.
		ban_data - The table data about the ban, exactly like it would be stored in ULib.bans.

	Revisions:

		v2.62 - Initial
]]
ULib.HOOK_USER_BANNED = "ULibPlayerBanned"

--[[
	Hook: ULibPlayerUnBanned

	Called during ULib.unban.
	This alerts you to the player being banned.

	Parameters passed to callback:

		steamid - String of SteamID for the unbanned player.
		admin - The unbaning player object or nil.

	Revisions:

		v2.62 - Initial
]]
ULib.HOOK_USER_UNBANNED = "ULibPlayerUnBanned"

--[[
	Hook: ULibGroupCreated

	Called during ULib.ucl.addGroup.
	This alerts you to the group being created.

	Parameters passed to callback:

		group_name - String of Group Name
		group_data - Group table as it is stored in ULib.ucl.groups[ name ].

	Revisions:

		v2.62 - Initial
]]
ULib.HOOK_GROUP_CREATED = "ULibGroupCreated"

--[[
	Hook: ULibGroupRemoved

	Called during ULib.ucl.removeGroup.
	This alerts you to the group being removed.

	Parameters passed to callback:

		group_name - String of Group Name
		group_data - Group table as it is stored in ULib.ucl.groups[ name ].

	Revisions:

		v2.62 - Initial
]]
ULib.HOOK_GROUP_REMOVED = "ULibGroupRemoved"

--[[
	Hook: ULibGroupAccessChanged

	Called during ULib.ucl.groupAllow.
	This alerts you to the group access being changed.

	Parameters passed to callback:

		group_name - String of Group Name
		access - String of access being changed
		revoke - Boolean, Are we adding(false/nil) or revoking(true)

	Revisions:

		v2.62 - Initial
]]
ULib.HOOK_GROUP_ACCESS_CHANGE = "ULibGroupAccessChanged"

--[[
	Hook: ULibGroupRenamed

	Called during ULib.ucl.renameGroup.
	This alerts you to the group being renamed.

	Parameters passed to callback:

		old_name - String of Old Group Name
		new_name - String of New Group Name

	Revisions:

		v2.62 - Initial
]]
ULib.HOOK_GROUP_RENAMED = "ULibGroupRenamed"

--[[
	Hook: ULibGroupInheritanceChanged

	Called during ULib.ucl.setGroupInheritance.
	This alerts you to the group Inheritance being changed.

	Parameters passed to callback:

		group_name - String of Group Name
		new_inherit - String of New Inheritance
		old_inherit - String of Old Inheritance

	Revisions:

		v2.62 - Initial
]]
ULib.HOOK_GROUP_INHERIT_CHANGE = "ULibGroupInheritanceChanged"

--[[
	Hook: ULibGroupCanTargetChanged

	Called during ULib.ucl.setGroupCanTarget.
	This alerts you to the group CanTarget being changed.

	Parameters passed to callback:

		group_name - String of Group Name
		new_target - String of New CanTarget
		old_target - String of Old CanTarget

	Revisions:

		v2.62 - Initial
]]
ULib.HOOK_GROUP_CANTARGET_CHANGE = "ULibGroupCanTargetChanged"

--[[
	Hook: ULibUserGroupChange

	Called during ULib.ucl.addUser.
	This alerts you to the user's group being changed.

	Parameters passed to callback:

		id - String steamid of the user.
		allows - Allows Table
		denies - Denies Table
		new_group - String of New Group
		old_group - String of Old Group

	Revisions:

		v2.62 - Initial
]]
ULib.HOOK_USER_GROUP_CHANGE = "ULibUserGroupChange"

--[[
	Hook: ULibUserAccessChange

	Called during ULib.ucl.userAllow.
	This alerts you to the user's access being changed.

	Parameters passed to callback:

	id - The string steamid of the user.
	access - The string of access being changed
	revoke - Boolean, are we adding(false/nil) or revoking(true)
	deny - Boolean, are we denying(true) or allowing(false/nil)

	Revisions:

		v2.62 - Initial
]]
ULib.HOOK_USER_ACCESS_CHANGE = "ULibUserAccessChange"

--[[
	Hook: ULibUserRemoved

	Called during ULib.ucl.removeUser.
	This alerts you to the user's group being removed.

	Parameters passed to callback:

	id - The string steamid of the user.
	user_info - Table of old user info (group, allows, denys, etc) as stored in ULib.ucl.users[id] before the change.

	Revisions:

		v2.62 - Initial
]]
ULib.HOOK_USER_REMOVED = "ULibUserRemoved"

--[[
	Section: UCL Helpers

	These defines are server-only, to help with UCL.
]]
if SERVER then
ULib.UCL_LOAD_DEFAULT = true -- Set this to false to ignore the SetUserGroup() call.
ULib.UCL_USERS = "data/ulib/users.txt"
ULib.UCL_GROUPS = "data/ulib/groups.txt"
ULib.UCL_REGISTERED = "data/ulib/misc_registered.txt" -- Holds access strings that ULib has already registered

ULib.DEFAULT_GRANT_ACCESS = { allow={}, deny={}, guest=true }
end

--[[
	Section: Net pooled strings

	These defines are server-only, to help with the networking library.
]]
if SERVER then
	util.AddNetworkString( "URPC" )
end

--PATH addons/_adminmodules/lua/ulib/shared/messages.lua:
--[[
	Title: Messages

	Handles messaging like logging, debug, etc.
]]


--[[
	Function: tsay

	Prints a message in talk say as well as in the user's consoles.

	Parameters:

		ply - The player to print to, set to nil to send to everyone. (Ignores this param if called on client)
		msg - The message to print.
		wait - *(Optional, defaults to false)* Wait one frame before posting. (Useful to use from things like chat hooks)
		wasValid - *(INTERNAL USE ONLY)* This is flagged on waiting if the player *was* valid.

	Revisions:

		v2.10 - Initial
]]

if SERVER then util.AddNetworkString( "tsayc" ) end

function ULib.tsay( ply, msg, wait, wasValid )
	ULib.checkArg( 1, "ULib.tsay", {"nil","Player","Entity"}, ply )
	ULib.checkArg( 2, "ULib.tsay", "string", msg )
	ULib.checkArg( 3, "ULib.tsay", {"nil","boolean"}, wait )

	if wait then ULib.namedQueueFunctionCall( "ULibChats", ULib.tsay, ply, msg, false, ply and ply:IsValid() ) return end -- Call next frame

	if SERVER and ply and not ply:IsValid() then -- Server console
		if wasValid then -- This means we had a valid player that left, so do nothing
			return
		end
		Msg( msg .. "\n" )
		return
	end

	if CLIENT then
		LocalPlayer():ChatPrint( msg )
		return
	end

	if ply then
		ply:ChatPrint( msg )
	else
		local players = player.GetAll()
		for _, player in ipairs( players ) do
			player:ChatPrint( msg )
		end
	end
end

local serverConsole = {} -- Used in the function below to identify the server console (internal use)



local function tsayColorCallback( ply, ... )
	if CLIENT then
		chat.AddText( ... )
		return
	end

	if ply and ply ~= serverConsole and not ply:IsValid() then return end -- Player must have left the server

	local args = { ... }

	if ply == serverConsole then
		for i=2, #args, 2 do
			Msg( args[ i ] )
		end
		Msg( "\n" );
		return
	end

	local current_chunk = { size = 0 }
	local chunks = { current_chunk }
	local max_chunk_size = 240
	while #args > 0 do
		local arg = table.remove( args, 1 )
		local typ = type( arg )
		local arg_size = typ == "table" and 4 or #arg + 2 -- Include null in strings, bool in both
		if typ == "string" and current_chunk.size + arg_size > max_chunk_size then -- Split a large string up into multiple messages
			local substr = arg:sub( 1, math.max( 1, max_chunk_size - current_chunk.size - 2 ) )
			if #substr > 0 then
				table.insert( current_chunk, substr )
			end
			table.insert( args, 1, arg:sub( #substr + 1) )

			current_chunk = { size = 0 }
			table.insert( chunks, current_chunk )
		else
			if current_chunk.size + arg_size > max_chunk_size then
				current_chunk = { size = 0 }
				table.insert( chunks, current_chunk )
			end
			current_chunk.size = current_chunk.size + arg_size
			table.insert( current_chunk, arg )
		end
	end

	for chunk_num=1, #chunks do
		local chunk = chunks[ chunk_num ]
		net.Start("tsayc")
			net.WriteBool( chunk_num == #chunks )
			net.WriteString( #chunk )
			for i=1, #chunk do
				local arg = chunk[ i ]
				if type( arg ) == "string" then
					net.WriteBool( true )
					net.WriteString( arg )
				else
					net.WriteBool( false )
					net.WriteString( arg.r )
					net.WriteString( arg.g )
					net.WriteString( arg.b )
				end
			end
		net.Send(ply)
	end
end

if CLIENT then
local accumulator = {}

local function tsayColorHook( )
	local last = net.ReadBool()
	local argn = net.ReadString()
	for i=1, argn do
		if net.ReadBool() then
			table.insert( accumulator, net.ReadString() )
		else
			table.insert( accumulator, Color( net.ReadString(), net.ReadString(), net.ReadString()) )
		end
	end

	if last then
		chat.AddText( unpack( accumulator ) )
		accumulator = {}
	end
end

net.Receive( "tsayc", tsayColorHook )
end


--[[
	Function: tsayColor

	Prints a tsay message in color!

	Parameters:

		ply - The player to print to, set to nil to send to everyone. (Ignores this param if called on client)
		wait - *(Optional, defaults to false)* Wait one frame before posting. (Useful to use from things like chat hooks)
		... - color arg and text arg ad infinitum, color needs to come before the text it's coloring.

	Revisions:

		v2.40 - Initial.
]]
function ULib.tsayColor( ply, wait, ... )
	if SERVER and ply and not ply:IsValid() then ply = serverConsole end -- Mark as server

	if wait then ULib.namedQueueFunctionCall( "ULibChats", tsayColorCallback, ply, ... ) return end -- Call next frame
	tsayColorCallback( ply, ... )
end


--[[
	Function: tsayError

	Just like tsay, but prints the string in red

	Parameters:

		ply - The player to print to, set to nil to send to everyone. (Ignores this param if called on client)
		msg - The message to print.
		wait - *(Optional, defaults to false)* Wait one frame before posting. (Useful to use from things like chat hooks)

	Revisions:

		v2.40 - Initial.
]]
function ULib.tsayError( ply, msg, wait )
	return ULib.tsayColor( ply, wait, Color( 255, 140, 39 ), msg )
end


--[[
	Function: csay

	Prints a message in center of the screen as well as in the user's consoles.

	Parameters:

		ply - The player to print to, set to nil to send to everyone. (Ignores this param if called on client)
		msg - The message to print.
		color - *(Optional, defaults to 255, 255, 255, 255)* The color of the text.
		duration - *(Optional)* The amount of time to show the text.
		fade - *(Optional, defaults to 0.5)* The length of fade time

	Revisions:

		v2.10 - Added fade parameter. Fixed it sending the message multiple times.
		v2.40 - Changed to use clientRPC.
]]
function ULib.csay( ply, msg, color, duration, fade )
	if CLIENT then
		ULib.csayDraw( msg, color, duration, fade )
		Msg( msg .. "\n" )
		return
	end

	ULib.clientRPC( ply, "ULib.csayDraw", msg, color, duration, fade )
	ULib.console( ply, msg )
end


--[[
	Function: console

	Prints a message in the user's consoles.

	Parameters:

		ply - The player to print to, set to nil to send to everyone. (Ignores this param if called on client)
		msg - The message to print.
]]
function ULib.console( ply, msg )
	if CLIENT or (ply and not ply:IsValid()) then
		Msg( msg .. "\n" )
		return
	end

	if ply then
		ply:PrintMessage( HUD_PRINTCONSOLE, msg .. "\n" )
	else
		local players = player.GetAll()
		for _, player in ipairs( players ) do
			player:PrintMessage( HUD_PRINTCONSOLE, msg .. "\n" )
		end
	end
end


--[[
	Function: error

	Gives an error to console.

	Parameters:

		s - The string to use as the error message
]]
function ULib.error( s )
	if CLIENT then
		Msg( "[LC ULIB ERROR] " .. s .. "\n" )
	else
		Msg( "[LS ULIB ERROR] " .. s .. "\n" )
	end
end


--[[
	Function: debugFunctionCall

	Prints a function call, very useful for debugging.

	Parameters:

		name - The name of the function called.
		... - all arguments to the function.

	Revisions:

		v2.40 - Now uses print instead of Msg, since Msg seems to have a low max length.
			Changed how the variable length params work so you can pass nil followed by more params
]]
function ULib.debugFunctionCall( name, ... )
	local args = { ... }

	print( "Function '" .. name .. "' called. Parameters:" )
	for i=1, #args do
		local value = ULib.serialize( args[ i ] )
		print( "[PARAMETER " .. i .. "]: Type=" .. type( args[ i ] ) .. "\tValue=(" .. value .. ")" )
	end
end

--PATH addons/_adminmodules/lua/ulx/modules/cl/motdmenu.lua:
ulx.motdmenu_exists = true

local mode
local url

function ulx.showMotdMenu( steamid )
	if mode == nil then
		return -- No data provided
	end

	local window = vgui.Create( "DFrame" )
	if ScrW() > 640 then -- Make it larger if we can.
		window:SetSize( ScrW()*0.9, ScrH()*0.9 )
	else
		window:SetSize( 640, 480 )
	end
	window:Center()
	window:SetTitle( "ULX MOTD" )
	window:SetVisible( true )
	window:MakePopup()

	local html = vgui.Create( "DHTML", window )
	--html:SetAllowLua( true ) -- Too much of a security risk for us to enable. Feel free to uncomment if you know what you're doing.

	local button = vgui.Create( "DButton", window )
	button:SetText( "Close" )
	button.DoClick = function() window:Close() end
	button:SetSize( 100, 40 )
	button:SetPos( (window:GetWide() - button:GetWide()) / 2, window:GetTall() - button:GetTall() - 10 )

	html:SetSize( window:GetWide() - 20, window:GetTall() - button:GetTall() - 50 )
	html:SetPos( 10, 30 )
	if mode == "1" then -- file
		html:SetHTML( ULib.fileRead( "data/ulx_motd.txt" ) or "" )
	elseif mode == "2" then -- generator
		html:SetHTML( ulx.generateMotdHTML() or "" )
	else -- URL
		url = string.gsub( url, "%%curmap%%", game.GetMap() )
		url = string.gsub( url, "%%steamid%%", steamid )
		html:OpenURL( url )
	end
end

function ulx.rcvMotd( mode_, data )
	mode = mode_
	if mode == "1" then -- file
		ULib.fileWrite( "data/ulx_motd.txt", data )
	elseif mode == "2" then -- generator
		ulx.motdSettings = data
	else -- URL
		if data:find( "://", 1, true ) then
			url = data
		else
			url = "http://" .. data
		end
	end
end

local template_header = [[
<html>
	<head>
		<style>
			body {
				padding: 0;
				margin: 0;
				height: 100%;
				font-family: {{style.fonts.regular.family}};
				font-size: {{style.fonts.regular.size}};
				font-weight: {{style.fonts.regular.weight}};
				color: {{style.colors.text_color}};
				background-color: {{style.colors.background_color}};
			}
			h1 {
				font-family: {{style.fonts.server_name.family}};
				font-size: {{style.fonts.server_name.size}};
				font-weight: {{style.fonts.server_name.weight}};
			}
			h2 {
				font-family: {{style.fonts.section_title.family}};
				font-size: {{style.fonts.section_title.size}};
				font-weight: {{style.fonts.section_title.weight}};
				color: {{style.colors.section_text_color}};
			}
			h3 {
				font-family: {{style.fonts.subtitle.family}};
				font-size: {{style.fonts.subtitle.size}};
				font-weight: {{style.fonts.subtitle.weight}};
			}
			p {
				padding-left: 20px;
			}
			ul, ol {
				padding-left: 40px;
			}
			.container {
				min-height: 100%;
				position: relative;
			}
			.header, .footer {
				width: 100%;
				text-align: center;
				background-color: {{style.colors.header_color}};
				color: {{style.colors.header_text_color}};
			}
			.header {
				padding: 20px 0;
				border-bottom: {{style.borders.border_thickness}} solid {{style.borders.border_color}};
			}
			.footer {
				position:absolute;
				bottom:0;
				border-top: {{style.borders.border_thickness}} solid {{style.borders.border_color}};
				height: 68px;
			}
			.page {
				width: 90%;
				margin: 0px auto;
				padding: 10px;
				text-align: left;
				padding-bottom: 68px;
			}
			.section {
				margin-bottom: 32px;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="header">
				<h1>%hostname%</h1>
				<h3>{{info.description}}</h3>
			</div>
			<div class="page">
]]

local template_section = [[
				<div class="section">
					<h2>%title%</h2>
					%content%
				</div>
]]

local template_section_p = [[
					<p>
						%items%
					</p>
]]

local template_section_ol = [[
					<ol>
						%items%
					</ol>
]]

local template_section_ul = [[
					<ul>
						%items%
					</ul>
]]

local template_item_li = [[
						<li>%content%</li>
]]

local template_item_br = [[
						%content%</br>
]]

local template_item_addon = [[
						<li><b>%title%</b> by %author%</li>
]]

local template_item_workshop = [[
						<li><b>%title%</b> - <a href="http://steamcommunity.com/sharedfiles/filedetails/?id=%workshop_id%">View on Workshop</a></li>
]]

local template_footer = [[
			</div>
			<div class="footer">
				<h3>Powered by ULX</h3>
			</div>
		</div>
	</body>
</html>
]]

local template_error = [[
<html>
	<head>
	</head>
	<body style="background-color: white">
		<div class="footer">
			<h3>ULX: MOTD Generator error. Could not parse settings file.</h3>
		</div>
	</body>
</html>
]]

local function escape(str)
	return (str:gsub("<", "&lt;"):gsub(">", "&gt;")) -- Wrapped in parenthesis so we ignore other return vals
end

local function renderItemTemplate(items, template)
	local output = ""
	for i=1, #items do
		output = output .. string.gsub( template, "%%content%%", escape(items[i] or ""))
	end
	return output
end

local function renderMods()
	local output = ""
	for a=1, #ulx.motdSettings.addons do
		local addon = ulx.motdSettings.addons[a]
		if addon.workshop_id then
			local item = string.gsub( template_item_workshop, "%%title%%", escape(addon.title) )
			output = output .. string.gsub( item, "%%workshop_id%%", escape(addon.workshop_id or "") )
		else
			local item = string.gsub( template_item_addon, "%%title%%", escape(addon.title or "") )
			output = output .. string.gsub( item, "%%author%%", escape(addon.author or "") )
		end
	end

	return output
end

function ulx.generateMotdHTML()
	if ulx.motdSettings == nil or ulx.motdSettings.info == nil then return template_error end

	local header = string.gsub( template_header, "%%hostname%%", escape(GetHostName() or "") )
	header = string.gsub( header, "{{(.-)}}", function(a)
		local success, value = ULib.findVar(a, ulx.motdSettings)
		return escape( value or "")
	end )

	local body = ""

	for i=1, #ulx.motdSettings.info do
		local data = ulx.motdSettings.info[i]
		local content = ""

		if data.type == "text" then
			content = string.gsub( template_section_p, "%%items%%", renderItemTemplate(data.contents, template_item_br) )

		elseif data.type == "ordered_list" then
			content = string.gsub( template_section_ol, "%%items%%", renderItemTemplate(data.contents, template_item_li) )

		elseif data.type == "list" then
			content = string.gsub( template_section_ul, "%%items%%", renderItemTemplate(data.contents, template_item_li) )

		elseif data.type == "mods" then
			content = string.gsub( template_section_ul, "%%items%%", renderMods() )

		elseif data.type == "admins" then
			local users = {}
			for g=1, #data.contents do
				local group = data.contents[g]
				if ulx.motdSettings.admins[group] then
					for u=1, #ulx.motdSettings.admins[group] do
						table.insert( users, ulx.motdSettings.admins[group][u] )
					end
				end
			end
			table.sort( users )
			content = string.gsub( template_section_ul, "%%items%%", renderItemTemplate(users, template_item_li) )
		end

		local section = string.gsub( template_section, "%%title%%", escape(data.title or "") )
		body = body .. string.gsub( section, "%%content%%", content )
	end

	return string.format( "%s%s%s", header, body, template_footer )
end

--PATH addons/animation/lua/wos/fortnite/vgui/vgui_tauntcam.lua:
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
--PATH addons/zeros_lua_libary/lua/zclib/generic/sh_entity.lua:
zclib = zclib or {}
zclib.Entity = zclib.Entity or {}

if SERVER then
	local GettingRemovedList = {}
    function zclib.Entity.GettingRemoved(ent)
        return GettingRemovedList[ent] == true
    end

    // Removes a entity safely without hurting its feelings
    function zclib.Entity.SafeRemove(ent)
        if zclib.Entity.GettingRemoved(ent) then return end

		GettingRemovedList[ent] = true

        // Hide entity
        if ent.SetNoDraw then ent:SetNoDraw(true) end

		SafeRemoveEntityDelayed(ent, 0)
    end
else

    // Scales one entity relative to the model bounds of another entity
    function zclib.Entity.RelativeScale(ToScale,ent02,val)
        if not IsValid(ToScale) then return end
        if not IsValid(ent02) then return end
        local pmin,pmax = ent02:GetModelBounds()
        local fmin,fmax = ToScale:GetModelBounds()
        local fscale = (fmin - fmax):Length()
        local pscale = (pmin - pmax):Length()
        local nscale = (1 / fscale) * pscale
        nscale = nscale * val
        ToScale:SetModelScale(nscale)
    end

    // Returns which entity the player is currently looking at
    local LookTarget
    function zclib.Entity.GetLookTarget()
        return LookTarget
    end

    local timerid = "zclib.Entity.GetLookTarget"
    zclib.Timer.Remove(timerid)
    zclib.Timer.Create(timerid,0.1,0,function()
        if not IsValid(LocalPlayer()) then return end
        local tr = LocalPlayer():GetEyeTrace()
        if tr and tr.Hit then
            LookTarget = tr.Entity
        else
            LookTarget = nil
        end
    end)
end

zclib.Entity.List = zclib.Entity.List or {}

function zclib.Entity.GetAll()
	local clean = {}
	for k,v in pairs(zclib.Entity.List) do
		if IsValid(k) then
			table.insert(clean,k)
		else
			zclib.Entity.List[k] = nil
		end
	end
	return clean
end

zclib.Hook.Add("OnEntityCreated", "zclib_EntityTracker_add", function(ent)
	if IsValid(ent) then
		zclib.Entity.List[ent] = true
	end
end)

zclib.Hook.Add("EntityRemoved", "zclib_EntityTracker_remove", function(ent)
	if IsValid(ent) then
		zclib.Entity.List[ent] = nil
	end
end)

local function GetListSortedByCount(list,limit)
	local nList = {}

	for k, v in pairs(list) do
		table.insert(nList, {
			class = k,
			count = v
		})
	end

	table.sort(nList, function(a, b) return a.count > b.count end)
	return nList
end

function zclib.Entity.GetEntityCountSorted()
	local countList = {}
	local total = 0

	for k, v in pairs(zclib.Entity.GetAll()) do
		if not IsValid(v) then continue end
		local class = v:GetClass()
		countList[ class ] = (countList[ class ] or 0) + 1
		total = total + 1
	end

	countList = GetListSortedByCount(countList)

	return countList, total
end

local StartEntityTrackState = {}
local JoinTime = 0
function zclib.Entity.GetEntityCountDiffrence()
	local nList = zclib.Entity.GetEntityCountSorted()
	local prevList = {}
	for k,v in pairs(StartEntityTrackState) do
		prevList[v.class] = v.count
	end

	local winnerClass,winnerCount = "" , 0

	local diffList = {}

	for k,v in pairs(nList) do
		local prev_val = (prevList[v.class] or 0)
		local diff = v.count - prev_val

		diffList[ v.class ] = diff

		if diff > winnerCount then
			winnerClass = v.class
			winnerCount = diff
		end
	end

	diffList = GetListSortedByCount(diffList)

	return winnerClass , winnerCount , diffList
end

local function PrintListColored(limitMax,list,IsDiffrence,limit)
	for k, v in ipairs(list) do
		if v == nil or v.count == nil or v.count == 0 then continue end
		if v.count < limit then continue end
		local fract = 1 / (limitMax * 2) * math.Clamp(v.count - limitMax, 0, limitMax)
		local col = zclib.util.LerpColor(fract, color_white, color_red)

		local count = v.count
		if IsDiffrence and v.count > 0 then
			count = "+" .. count
		end

		MsgC(col, string.sub(v.class, 1, 38) .. string.rep(" ", 38 - v.class:len()) .. count .. "\n")
	end
end

function zclib.Entity.Print(limit)
	print(" ")
	MsgC(color_black, "-------------------------------------------" .. "\n")

	local domain = "SERVER"
	local domain_color = Color(108,163,255)
	if CLIENT then
		domain = "CLIENT"
		domain_color = Color(255,212,108)
	end
	MsgC(domain_color, "zcLib - Entity Count - " .. domain .. "\n")

	local nList, total = zclib.Entity.GetEntityCountSorted()

	if SERVER then
		MsgC(domain_color, "There are currently " .. total .. " entities on the server!" .. "\n")
	else
		MsgC(domain_color, "There are currently " .. total .. " entities in your game!" .. "\n")
	end

	PrintListColored(100,nList,false,limit)

	MsgC(color_black, "-------------------------------------------" .. "\n")

	local winnerClass , winnerCount , diffList = zclib.Entity.GetEntityCountDiffrence()

	if SERVER then
		MsgC(domain_color, "Since server start ("..zclib.util.FormatTime(CurTime()).." ago) the entity that increased the most in count is " .. winnerClass .." with " .. winnerCount .. "!" .. "\n")
	else
		MsgC(domain_color, "Since you joined ("..zclib.util.FormatTime(SysTime() - JoinTime).." ago) the entity that increased the most in count is " .. winnerClass .." with " .. winnerCount .. "!" .. "\n")
	end
	PrintListColored(50,diffList,true,limit)

	MsgC(color_black, "-------------------------------------------" .. "\n")
	print(" ")
end

if SERVER then
	util.AddNetworkString("zclib.Entity.Print")

	// Lets use the first playing joining as a init function
	zclib.Hook.Add("zclib_PlayerJoined", "zclib_PlayerJoined_EntityTracker", function(ply)

		local tbl = zclib.Entity.GetEntityCountSorted(1)
		StartEntityTrackState = table.Copy(tbl)

		zclib.Hook.Remove("zclib_PlayerJoined", "zclib_PlayerJoined_EntityTracker")
	end)
else
	net.Receive("zclib.Entity.Print", function(len, ply)
		local limit = net.ReadFloat()
		zclib.Entity.Print(limit)
	end)

	zclib.Hook.Add("zclib_PlayerInitialized", "zclib_PlayerInitialized_EntityTracker", function()
		timer.Simple(3,function()
			local tbl = zclib.Entity.GetEntityCountSorted(1)
			StartEntityTrackState = table.Copy(tbl)
			JoinTime = SysTime()
		end)
	end)
end

/*
	Prints out on how many entities did exist when the player join / server started
*/
concommand.Add("zclib_print_entities", function(ply, cmd, args)
	if zclib.Player.IsAdmin(ply) or not IsValid(ply) then
		local limit = tonumber(args[1] or 1)
		zclib.Entity.Print(limit)

		if SERVER and IsValid(ply) and zclib.Player.IsAdmin(ply) then
			net.Start("zclib.Entity.Print")
			net.WriteFloat(limit)
			net.Send(ply)
		end
	end
end)

if SERVER then

	local CachedEntityList = {}
	local NextCache = 0
	local NextID = 1
	local function CatchNextEntity(class)
		if CurTime() > NextCache then
			CachedEntityList = zclib.Entity.GetAll()
			NextCache = CurTime() + 15
		end

		local clean = {}
		for k,v in pairs(CachedEntityList) do
			if IsValid(v) and v:GetClass() == class then
				table.insert(clean,v)
			end
		end

		print("Found " .. #clean .. " " .. class)
		//PrintTable(clean)

		if NextID > #clean then NextID = 1 end

		print("Go to > " .. NextID)
		local target = clean[NextID]
		NextID = NextID + 1
		if IsValid(target) then
			return target
		else
			NextID = 0
		end
	end

	util.AddNetworkString("zclib.Entity.GoTo")
	net.Receive("zclib.Entity.GoTo", function(len, ply)
		if not zclib.Player.IsAdmin(ply) then return end
		local class = net.ReadString()

		if class == nil then return end
		local target = CatchNextEntity(class)
		if IsValid(target) then
			ply:SetPos(target:GetPos())
		end
	end)

	util.AddNetworkString("zclib.Entity.CleanUp")
	net.Receive("zclib.Entity.CleanUp", function(len, ply)
		if not zclib.Player.IsAdmin(ply) then return end
		local class = net.ReadString()
		if class == nil then return end

		for k,v in pairs(zclib.Entity.GetAll()) do
			if IsValid(v) and v:GetClass() == class then
				if class == "predicted_viewmodel" then
					local owner = v:GetOwner()
					print(tostring(v),"Owner: "..tostring(owner))
					if not IsValid(owner) then
						print(tostring(v), "Removed!")
						SafeRemoveEntityDelayed(v,0.1)
					end
				elseif class == "phys_lengthconstraint" then
					local parent = v:GetParent()
					print(tostring(v),"Parent: "..tostring(parent))

					print(tostring(v), "Removed!")
					SafeRemoveEntityDelayed(v,0.1)
				else
					print(tostring(v), "Removed!")
					SafeRemoveEntityDelayed(v,0.1)
				end
			end
		end
	end)
else
	/*
		Teleports the player to the specified class
	*/
	concommand.Add("zclib_goto_entityclass", function(ply, cmd, args)
		if zclib.Player.IsAdmin(ply) then
			local class = args[1]
			if class then
				net.Start("zclib.Entity.GoTo")
				net.WriteString(class)
				net.SendToServer()
			end
		end
	end)

	/*
		Cleanup entities
	*/
	concommand.Add("zclib_cleanup_entityclass", function(ply, cmd, args)
		if zclib.Player.IsAdmin(ply) then
			local class = args[1]
			if class then
				net.Start("zclib.Entity.CleanUp")
				net.WriteString(class)
				net.SendToServer()
			end
		end
	end)
end

concommand.Add("zclib_debug_entity", function(ply, cmd, args)
	if zclib.Player.IsAdmin(ply) then
		local tr = ply:GetEyeTrace()
		local ent = tr.Entity
		if IsValid(ent) then
			print("HammerID: ",tostring( ent:GetInternalVariable("hammerid")))
			print("Parent: ",tostring(ent:GetParent()))
			print("PhysObject: ",tostring(ent:GetPhysicsObject()))
			PrintTable(ent:GetKeyValues())
		end
	end
end)

--PATH addons/zeros_lua_libary/lua/zclib/generic/cl_itemshooter.lua:
if SERVER then return end

/*

    A System which creates a Client model on position A and shoots it to position B over the defined time frame

*/

zclib = zclib or {}
zclib.ItemShooter = zclib.ItemShooter or {}

zclib.ItemShooter.Items = zclib.ItemShooter.Items or {}

function zclib.ItemShooter.Add(from,to,time,OnEntityCreated,ThrowSound,DestinationSound,EntityTrail,OnEntityRemoved)

    zclib.Sound.EmitFromPosition(from,ThrowSound or "throw")

    local data = {
        // When did action start
        start_time = CurTime(),

        // How long will the item fly
        travel_time = time,

        // Where does the item spawn from
        from = from,

        // Where does the item move to
        to = to,

		// Can be used to modify the entity on creation
        OnEntityCreated = OnEntityCreated,

		// Called before the entity gets removed
		OnEntityRemoved = OnEntityRemoved,

		// The sound it should play when the item hits its destination
		DestinationSound = DestinationSound,

		// The trail of the entity
		EntityTrail = EntityTrail,
    }

    table.insert(zclib.ItemShooter.Items,data)


    // Create think hook if it doesent exist
    zclib.ItemShooter.Start()
end

function zclib.ItemShooter.Start()
    zclib.Hook.Remove("Think", "ItemShooter")
    zclib.Hook.Add("Think", "ItemShooter", function()
        zclib.ItemShooter.Logic()
    end)
end

function zclib.ItemShooter.Stop()
    zclib.Hook.Remove("Think", "ItemShooter")
end

function zclib.ItemShooter.Logic()
    for k, v in pairs(zclib.ItemShooter.Items) do
        if v and (v.start_time + v.travel_time) > CurTime() then
            zclib.ItemShooter.ItemLogic(v)
        else
            if IsValid(v.item_ent) then
                zclib.ClientModel.Remove(v.item_ent)
                v.item_ent = nil
            end

			if v.OnEntityRemoved then pcall(v.OnEntityRemoved,v.item_ent,v.to) end

            zclib.Sound.EmitFromPosition(v.to,v.DestinationSound or "inv_add")

            zclib.ItemShooter.Items[k] = nil
        end
    end

    if table.Count(zclib.ItemShooter.Items) <= 0 then
        zclib.ItemShooter.Stop()
    end
end

// Handels the bot movement
function zclib.ItemShooter.ItemLogic(data)
    if IsValid(data.item_ent) then

        local dest_time = data.start_time + data.travel_time

        local time_dif = math.Clamp(dest_time - CurTime(),0,100)

        if time_dif < 0.005 then
            data.item_ent:StopParticles()
        end

        local fract = math.Clamp((1 / data.travel_time) * time_dif, 0, 1)

        fract = 1 - fract

        local startPos, endPos = data.from , data.to

        local _pos = LerpVector(fract, startPos,endPos)

        // Lerp a height position so the drone reached its heighest point in the mid of its path
        local dist = startPos:DistToSqr(endPos)
        local max_height = math.Clamp((15 / 15000) * dist,1,50)
        local height = max_height
        if fract < 0.5 then
            height = height * math.EaseInOut((1 / 0.5) * fract, 0, 1)
        else
            height = height * math.EaseInOut(1 - (1 / 0.5) * (fract - 0.5), 0,1)
        end
        _pos = _pos + Vector(0,0,height)


        local flyDir = data.item_ent:GetPos() - endPos
        flyDir = flyDir:Angle()
        flyDir:RotateAroundAxis(flyDir:Right(),180)

        local rot = math.Round(CurTime() % 360,2) * 300

        data.item_ent:SetAngles(Angle(rot,flyDir.y,rot))

        data.item_ent:SetPos(_pos)
    else
        data.item_ent = zclib.ClientModel.AddProp()
        if IsValid(data.item_ent) then
            data.item_ent:SetModel("models/props_junk/PopCan01a.mdl")
            data.item_ent:SetPos(data.from)

            local bound_min,bound_max = data.item_ent:GetModelBounds()
            local size = bound_max - bound_min
            size = size:Length()
            local scale = 3 / size
            data.item_ent:SetModelScale(scale)

            pcall(data.OnEntityCreated,data.item_ent)

            zclib.Effect.ParticleEffectAttach(data.EntityTrail or "zclib_item_trail01", PATTACH_POINT_FOLLOW, data.item_ent, 0)
        end
    end
end

--PATH addons/zeros_lua_libary/lua/zclib/generic/cl_minimap.lua:
if SERVER then return end
zclib = zclib or {}
zclib.MiniMap = zclib.MiniMap or {}

/*

    Modified version of MG Factions MiniMap

*/

local nextopen = 0
local drag_spd = 2
local scroll_spd = 0.2
local max_map_size = 32768
local map_maxz
local sizemult = {0.6, 0.8}
local windowsize = {ScrW() * sizemult[1], ScrH() * sizemult[2]}
local viewmult = math.Clamp(1, 0.5, 3)
local circle32_mat = Material("zerochain/zerolib/ui/circle_32.png", "smooth ignorez")

local function DrawOutlineCircle(x, y, w, h, color, rot)
    surface.SetMaterial(circle32_mat)

    surface.SetDrawColor(color_black)
    surface.DrawTexturedRectRotated(x, y, w / viewmult, h / viewmult, rot)

    surface.SetDrawColor(color)
    surface.DrawTexturedRectRotated(x, y, (w - 2) / viewmult, (h - 2) / viewmult, rot)
end

function zclib.MiniMap.Setup(data)

	local minimap

    local function MiniMap_Open()
        if IsValid(minimap) then minimap:Remove() end

        local ply = LocalPlayer()
        local ang = Angle(0, 0, 0)

        windowsize = {ScrW() * (data.config.Width or sizemult[1]), ScrH() * (data.config.Height or sizemult[2])}

        viewmult = math.Clamp(data.config.MiniMapDefaultZoom, data.config.MiniMapMinZoom, data.config.MiniMapMaxZoom)
        minimap = vgui.Create("DPanel")
        minimap:SetSize(windowsize[1], windowsize[2])
        minimap:Center()
        minimap:MakePopup()
        minimap:ParentToHUD()

        // Enable movement via keyboard
        if data.config.MiniMapMovement then
            minimap:SetKeyboardInputEnabled(false)
        end

        minimap.MousePosX = 0
        minimap.MousePosY = 0
        minimap.OffsetVector = Vector(0, 0, 0)
        minimap.LockedOnPlayer = true
        local ready = false

        minimap.Think = function(self)
            // Close mechanic
            if data.config.MiniMapButton and (input.IsKeyDown(data.config.MiniMapButton) or input.IsKeyDown(KEY_ESCAPE)) then
                if not ready then return end
                self:Remove()
                nextopen = SysTime() + 0.1

                return
            else
                ready = true
            end

            // Drag logic
            if not self:IsHovered() then return end
            local mx, my = input.GetCursorPos()
			self.MouseX = mx
			self.MouseY = my

            local tb = self:GetTable()

            if input.IsMouseDown(MOUSE_LEFT) then
                if not tb.LM then
                    tb.LM = true
                else
                    local nx, ny = tb.MousePosX - mx, tb.MousePosY - my
                    self:StopLock()
                    tb.OffsetVector.x = tb.OffsetVector.x - (ny * viewmult * drag_spd)
                    tb.OffsetVector.y = tb.OffsetVector.y - (nx * viewmult * drag_spd)
                end
            else
                tb.LM = false
            end

            tb.MousePosX, tb.MousePosY = mx, my
        end

        // Scrolling in and out
        minimap.OnMouseWheeled = function(self, scroll)
            viewmult = math.Clamp(viewmult - (scroll * scroll_spd), data.config.MiniMapMinZoom, data.config.MiniMapMaxZoom)
        end

        // Caching the view table
        minimap.viewdata = {
            w = minimap:GetWide() - 20,
            h = minimap:GetTall() - 50,
            drawviewmodel = false,
            drawhud = false,
            drawmonitors = false,
            bloomtone = false
        }

        // Get view pos
        minimap.GetViewPos = function(self)
            local tb = self:GetTable()

            return tb.LockedOnPlayer and ply:EyePos() or Vector(tb.LockPos.x, tb.LockPos.y, tb.LockPos.z)
        end

        // Get view angle
        minimap.GetViewAng = function(self) return ang end

        // Stop locking the view to the player
        minimap.StopLock = function(self)
            if self.LockedOnPlayer then
                self.LockedOnPlayer = false
                self.LockPos = ply:EyePos()
            end
        end

        // Cache max map height
        minimap.GenerateMaxHeight = function()
            if not map_minz or not map_maxz then
                local _, maxs = game.GetWorld():GetRenderBounds()
                map_maxz = maxs.z
            end
        end

        // Get max map height
        minimap.GetMaxHeight = function()
            minimap.GenerateMaxHeight()

            return map_maxz
        end

        // Function for converting something from 3D to 2D.
        minimap.To2D = function(self, pos, campos)
            local w, h = self:GetWide() / 2, self:GetTall() / 2

            return w + ((campos.y - pos.y) / viewmult) / 2, h + ((campos.x - pos.x) / viewmult) / 2
        end

        // Draw player(s)
        minimap.DrawPlayer = function(self, aply, campos, aang)
            local x, y = self:To2D(aply:GetPos(), campos + self.OffsetVector, aang)
            y = y + 10
			if aply.zclib_avatar_icon and viewmult <= 4 then

				local pSize = 200
				local val = math.Clamp(6 - viewmult, 0, 6)
				local reduce = (150 / 6) * val
				pSize = pSize - reduce
				pSize = pSize / viewmult
				local pW = pSize * 0.44

				zclib.BMASKS.BeginMask("zclib_Circle")
				surface.SetMaterial(aply.zclib_avatar_icon)
				surface.SetDrawColor(color_white)
				surface.DrawTexturedRectRotated(x, y, pW * 0.98, pW * 0.98, 0)
				zclib.BMASKS.EndMask("zclib_Circle", x, y , pW, pW, 255, 0)

				surface.SetMaterial(zclib.Materials.Get("circle_thick"))
				surface.SetDrawColor(color_black)
				surface.DrawTexturedRectRotated(x, y, pW * 0.98, pW * 0.98, 0)
			else
				DrawOutlineCircle(x, y, 32, 32, zclib.colors["orange01"], aang.y)
			end

			if viewmult > 4 then return end

			/*
				All of this is just so the name fades in / out if the curso goes near the players avatar
			*/
			if not self.MouseX or not self.MouseY then return end
			if not aply.zclib_map_lasthover then aply.zclib_map_lasthover = CurTime() end
			local sX,sY = self:LocalToScreen(x,y)
			local dist = Vector(sX,sY,0):Distance(Vector(self.MouseX,self.MouseY,0))
			if dist < 100 then aply.zclib_map_lasthover = CurTime() end
			local alpha = math.Clamp(255 - ((255 / 5) * (CurTime() - aply.zclib_map_lasthover)),0,255)

			if (aply.zclib_map_lasthover + 5) > CurTime() then
				draw.SimpleTextOutlined(aply:Name(), zclib.GetFont("zclib_font_small"), x, y + (15 / viewmult), Color(255,255,255,alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,alpha))
			end
        end

		/*
			Load all the steam avatar images inside the players entity
		*/
		for _, v in player.Iterator() do
			zclib.Avatar.GetMaterial(v:SteamID64(), function(mat)
				if IsValid(v) and v:IsValid() and mat then
					v.zclib_avatar_icon = mat
				end
			end)
		end


        // Painting the view
        minimap.Paint = function(self, w, h)
            draw.RoundedBox(5, 0, 0, w, h, zclib.colors["ui02"])

            draw.SimpleText("Mini Map", zclib.GetFont("zclib_font_big"), 10 * zclib.wM, 1 * zclib.hM, zclib.colors["text01"], TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

			local tb = self:GetTable()
            local campos = minimap:GetViewPos()
            local aang = minimap:GetViewAng()

            // Make a trace to check for the current max height
            local trace = util.TraceLine({
                start = campos,
                endpos = campos + Vector(0, 0, max_map_size),
                filter = ply
            })

            local max_z = self.GetMaxHeight() // Get max height of current map
            campos.z = max_z
            local znear = max_z - trace.HitPos.z

            local viewdata = minimap.viewdata
            viewdata.origin = campos + tb.OffsetVector
            viewdata.znear = znear
            viewdata.zfar = max_map_size
            viewdata.angles = Angle(90, 0, 0)

            local x, y = self:GetPos()
            viewdata.x = x + 10
            viewdata.y = y + 40

            // Setup ortho view
            viewdata.ortho = {
                top = -viewdata.h * viewmult,
                bottom = viewdata.h * viewmult,
                left = -viewdata.w * viewmult,
                right = viewdata.w * viewmult
            }

            // Some parameters to optimise the ongoing render view
            render.SuppressEngineLighting(true)
            render.SetShadowsDisabled(true)
            render.PushFlashlightMode(false)
			local old = DisableClipping( true )

			render.RenderView(viewdata)

			DisableClipping( old )
            render.PopFlashlightMode()
            render.SetShadowsDisabled(false)
            render.SuppressEngineLighting(false)

            // Cut off text outside of the rendered view.
            render.SetScissorRect(viewdata.x, viewdata.y, viewdata.x + viewdata.w, viewdata.y + viewdata.h, true)

            pcall(data.OnDraw,minimap,campos,aang,viewmult)

            // Draw local player
			if not data.config.HideLocalPlayer then
            	self:DrawPlayer(ply, campos, aang)
			end

            // Show other players
            if not data.config.HidePlayers then
                for _, v in player.Iterator() do
                    if ply ~= v and v:GetNoDraw() then continue end
                    self:DrawPlayer(v, campos, aang)
                end
            end

            render.SetScissorRect(0, 0, 0, 0, false)

			if not data.config.HideHelp then
	            draw.SimpleTextOutlined("Drag mouse: Adjust position", zclib.GetFont("zclib_font_mediumsmall_thin"), 15, h - 50, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black) // Print instructions
	            draw.SimpleTextOutlined("Scroll: Zoom", zclib.GetFont("zclib_font_mediumsmall_thin"), 15, h - 30, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)
			end
        end

        if not data.config.HideLockOnPlayer then
            local x = zclib.util.GetTextSize("Lock on player", zclib.GetFont("zclib_font_medium"))

            local btn = zclib.vgui.TextButton(0, 0, x + 50, 40, minimap, {
                Text01 = "Lock on player",
                txt_font = zclib.GetFont("zclib_font_medium")
            }, function()
                // Reset everything and lock the view to the player again
                minimap.LockedOnPlayer = true
                minimap.OffsetVector = Vector(0, 0, 0)
            end, function() return false end, function() return false end)

            btn:Dock(RIGHT)
            btn:DockMargin(0, 670, 15, 15)
        end
    end

    // Open the mini map with pressing a button
    if data.config.MiniMapButton then
        zclib.Hook.Remove("PlayerButtonDown", "zclib_MiniMap")
        zclib.Hook.Add("PlayerButtonDown", "zclib_MiniMap", function(ply, button)
            if data.config.MiniMapButton ~= button or nextopen > SysTime() then return end
            if not IsFirstTimePredicted() then return end
            if ply ~= LocalPlayer() or ply:IsTyping() then return end
			if IsValid(minimap) then
				minimap:Remove()
			else
				MiniMap_Open()
			end
        end)
    end

    // Open the mini map with a command
    if data.config.MiniMapCommand then
        zclib.Hook.Remove("OnPlayerChat", "zclib_MiniMap")
        zclib.Hook.Add("OnPlayerChat", "zclib_MiniMap", function(ply, text)
            if data.config.MiniMapCommand and data.config.MiniMapCommand ~= "" and string.lower(text) == data.config.MiniMapCommand then
                if ply ~= LocalPlayer() then return true end
                MiniMap_Open()

                return true
            end
        end)
    end
end

/*


zclib.MiniMap.Setup({
	config = {
		MiniMapCommand = "!minimap",
		MiniMapButton = KEY_M,
		MiniMapDefaultZoom = 1,
		MiniMapMinZoom = 0.5,
		MiniMapMaxZoom = 15,
		MiniMapMovement = true,
		HideLockOnPlayer = true,
		HideLocalPlayer = false,
		HidePlayers = false,
		HideHelp = true
	},
	OnDraw = function(minimap, campos, aang, viewmult)


	end
})
*/

--PATH addons/zeros_lua_libary/lua/zclib/generic/cl_vgui_effects.lua:
if SERVER then return end
zclib = zclib or {}
zclib.vgui = zclib.vgui or {}
zclib.vgui.EffectList = zclib.vgui.EffectList or {}

/*

	This system handles particle effects on vgui

*/

function zclib.vgui.AddEffect(id,effect, sound) zclib.vgui.EffectList[id] = {effect, sound} end

zclib.vgui.AddEffect("Destroy","zmb_vgui_destroy", "weapons/explode3.wav")
zclib.vgui.AddEffect("Magic","zmb_vgui_magic", "zerolib/gas_buff01.wav")
zclib.vgui.AddEffect("Repair","zmb_vgui_repair", "zerolib/building.wav")
zclib.vgui.AddEffect("Techno","zmb_vgui_techno", "zerolib/shoot.wav")
zclib.vgui.AddEffect("Use","zmb_vgui_use", "zerolib/throw01.wav")
zclib.vgui.AddEffect("Upgrade","zmb_vgui_upgrade", "zerolib/upgrade.wav")
zclib.vgui.AddEffect("Sell","zmb_vgui_sell", "zerolib/cash.wav")

zclib.vgui.AddEffect("firework_red","zmb_vgui_firework_red", "zerolib/firework01.wav")
zclib.vgui.AddEffect("firework_green","zmb_vgui_firework_green", "zerolib/firework02.wav")
zclib.vgui.AddEffect("firework_blue","zmb_vgui_firework_blue", "zerolib/firework01.wav")
zclib.vgui.AddEffect("firework_yellow","zmb_vgui_firework_yellow", "zerolib/firework02.wav")

/*
	Lets also add every single cached effect to the screen
*/
zclib.Hook.Add("zclib_OnParticleSystemPrecached", "zst_register_effect_for_vgui", function(effect)
	zclib.vgui.AddEffect(effect, effect)
end)

local EffectCache = {}
local ang = Angle(90, 0, -90)

local function StartRendering()
	zclib.Hook.Add("DrawOverlay", "zclib_vgui_effects", function()
		local ply = LocalPlayer()

		if IsValid(ply) and EffectCache and table.Count(EffectCache) > 0 then

			local w, h = ScrW(), ScrH()

			for k, v in pairs(EffectCache) do

				if v and IsValid(v.emitter) then

					local ortho = {
						top = (-h / 2) * v.distance,
						bottom = (h / 2) * v.distance,
						left = (-w / 2) * v.distance,
						right = (w / 2) * v.distance
					}

					cam.Start( { type = "3D", ortho = ortho, angles = ang } )
						v.emitter:Render()
					cam.End3D()
				else
					EffectCache[k] = nil
				end
			end
		else
			zclib.Hook.Remove("DrawOverlay", "zclib_vgui_effects")
		end
	end)
end

function zclib.vgui.PlayEffect(id, x, y,skipSound,distance)
	distance = distance or 1

	local e_Data = zclib.vgui.EffectList[id]
	zclib.vgui.CreateEffect(e_Data[ 1 ], Vector((x - (ScrW() / 2)) * distance, (-y + (ScrH() / 2)) * distance, 0), distance)
	if e_Data[2] and not skipSound then surface.PlaySound(e_Data[2]) end
end

function zclib.vgui.PlayEffectAtPanel(id, pnl, x, y,skipSound,distance)
	distance = distance or 1

	local pX, pY = pnl:GetPos()
	local cX, cY = pnl:GetParent():LocalToScreen(pX + (pnl:GetWide() / 2) + (x or 0), pY + (pnl:GetTall() / 2) + (y or 0))
	zclib.vgui.PlayEffect(id, cX, cY,skipSound,distance)
end

function zclib.vgui.CreateEffect(effect, pos,distance)
	local ply = LocalPlayer()
	local emitter = CreateParticleSystem(ply, effect, PATTACH_WORLDORIGIN, 0, pos)
	if IsValid(emitter) then
		emitter:SetShouldDraw(false)
		emitter:SetIsViewModelEffect(true)
		emitter:StartEmission(true)
		table.insert(EffectCache, {emitter = emitter,distance = distance or 1})
		StartRendering()
	end
end

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

--PATH addons/brick_s_server_framework/lua/autorun/client/brs_cl_autorun.lua:
--[[ Global Variables/Tables ]]--
BRICKS_SERVER = BRICKS_SERVER or {}
BRICKS_SERVER.Func = BRICKS_SERVER.Func or {}
BRICKS_SERVER.TEMP = BRICKS_SERVER.TEMP or {}

--[[ Modules Prep ]]--
BRICKS_SERVER.Modules = {}
local moduleMeta = {
	GetFolderName = function( self )
		return self.FolderName
	end,
	AddSubModule = function( self, folderName, name )
		BRICKS_SERVER.Modules[self:GetFolderName()][3][folderName] = name
	end
}

moduleMeta.__index = moduleMeta

function BRICKS_SERVER.Func.AddModule( folderName, name, icon, version )
	BRICKS_SERVER.Modules[folderName] = { name, icon, {}, version }
	
	local module = {
		FolderName = folderName
	}
	
	setmetatable( module, moduleMeta )
	
	return module
end

--[[ Autorun files ]]--
for k, v in pairs( file.Find( "bricks_server/*.lua", "LUA" ) ) do
	if( string.StartWith( v, "bricks_server_autorun_" ) ) then
		AddCSLuaFile( "bricks_server/" .. v )
		include( "bricks_server/" .. v )
	end
end

--[[ CONFIG LOADER ]]--
for k, v in pairs( file.Find( "bricks_server/*.lua", "LUA" ) ) do
	if( string.StartWith( v, "bricks_server_luacfg_" ) ) then
		AddCSLuaFile( "bricks_server/" .. v )
		include( "bricks_server/" .. v )
	end
end

BRICKS_SERVER.BASECONFIG = {}
AddCSLuaFile( "bricks_server/bricks_server_basecfg_main.lua" )
include( "bricks_server/bricks_server_basecfg_main.lua" )
hook.Run( "BRS.Hooks.BaseConfigLoad" )

BRICKS_SERVER.CONFIG = table.Copy( BRICKS_SERVER.BASECONFIG )

function BRICKS_SERVER.Func.AddLanguageStrings( languageKey, stringTable )
	if( not BRICKS_SERVER.Languages[languageKey] ) then
		BRICKS_SERVER.Languages[languageKey] = stringTable
	else
		table.Merge( BRICKS_SERVER.Languages[languageKey], stringTable )
	end
end

function BRICKS_SERVER.Func.LoadLanguages()
	BRICKS_SERVER.Languages = {}
	local files, directories = file.Find( "bricks_server/languages/*", "LUA" )
	for k, v in pairs( directories ) do
		for key, val in pairs( file.Find( "bricks_server/languages/" .. v .. "/*", "LUA" ) ) do
			AddCSLuaFile( "bricks_server/languages/" .. v .. "/" .. val )
			include( "bricks_server/languages/" .. v .. "/" .. val )
		end
	end
end
BRICKS_SERVER.Func.LoadLanguages()

function BRICKS_SERVER.Func.L( languageKey, ... )
	local languageTable = BRICKS_SERVER.Languages[BRICKS_SERVER.CONFIG.LANGUAGE.Language or "english"] or BRICKS_SERVER.Languages["english"]

	local languageString = ((languageTable or {})[languageKey] or BRICKS_SERVER.Languages["english"][languageKey]) or "MISSING LANGUAGE"

	local configLanguageTable = (BRICKS_SERVER.CONFIG.LANGUAGE.Languages or {})[BRICKS_SERVER.CONFIG.LANGUAGE.Language or "english"]

	if( configLanguageTable and configLanguageTable[2] and configLanguageTable[2][languageKey] ) then
		languageString = configLanguageTable[2][languageKey]
	end

	return (not ... and languageString) or string.format( languageString, ... )
end

function BRICKS_SERVER.Func.GetTheme( key, alpha )
	local color = Color( 0, 0, 0 )
	if( BRICKS_SERVER.BASECONFIG.THEME[key] ) then
		if( (BS_ConfigCopyTable or BRICKS_SERVER.CONFIG).THEME[key] ) then
			color = (BS_ConfigCopyTable or BRICKS_SERVER.CONFIG).THEME[key]
		else
			color = BRICKS_SERVER.BASECONFIG.THEME[key]
		end
	end

	if( alpha ) then
		color = Color( color.r, color.g, color.b, alpha )
	end

	return color
end

function BRICKS_SERVER.Func.IsModuleEnabled( moduleName )
	if( BRICKS_SERVER.Modules[moduleName] ) then
		return BRICKS_SERVER.CONFIG.MODULES[moduleName] and BRICKS_SERVER.CONFIG.MODULES[moduleName][1] == true
	end
	
	return false
end

function BRICKS_SERVER.Func.IsSubModuleEnabled( moduleName, subModuleName )
	if( BRICKS_SERVER.Modules[moduleName] ) then
		return BRICKS_SERVER.Func.IsModuleEnabled( moduleName ) and BRICKS_SERVER.CONFIG.MODULES[moduleName][2][subModuleName]
	end
	
	return false
end

local function LoadClientConfig()
	BRICKS_SERVER.BASECLIENTCONFIG = BRICKS_SERVER.BASECLIENTCONFIG or {}
	hook.Run( "BRS.Hooks.ClientConfigLoad" )
end

local function LoadDevConfig()
	BRICKS_SERVER.DEVCONFIG = BRICKS_SERVER.DEVCONFIG or {}
	AddCSLuaFile( "bricks_server/bricks_server_devcfg_main.lua" )
	include( "bricks_server/bricks_server_devcfg_main.lua" )
	hook.Run( "BRS.Hooks.DevConfigLoad" )
end

LoadClientConfig()
LoadDevConfig()

--[[ Automatic autoruns ]]--
local AutorunTable = {}
AutorunTable[1] = {
	Location = "bricks_server/core/shared/",
	Type = "Shared"
}
AutorunTable[2] = {
	Location = "bricks_server/core/client/",
	Type = "Client"
}
AutorunTable[3] = {
	Location = "bricks_server/vgui/",
	Type = "Client"
}

for key, val in ipairs( AutorunTable ) do
	for k, v in ipairs( file.Find( val.Location .. "*.lua", "LUA" ) ) do
		if( val.Type == "Shared" ) then
			include( val.Location .. v )
		elseif( val.Type == "Client" ) then	
			include( val.Location .. v )
		end
	end
end

hook.Run( "BRS.Hooks.CoreLoaded" )

--[[ MODULES AUTORUN ]]--
local function loadModuleFiles( filePath )
	local moduleFiles, moduleDirectories = file.Find( filePath .. "/*", "LUA" )

	if( not moduleDirectories ) then return end

	for key, val in pairs( moduleDirectories ) do
		for key2, val2 in pairs( file.Find( filePath .. "/" .. val .. "/*.lua", "LUA" ) ) do
			if( val == "shared" ) then
				include( filePath .. "/" .. val .. "/" .. val2 )
			elseif( val == "client" or val == "vgui" ) then
				include( filePath .. "/" .. val .. "/" .. val2 )
			end
		end
	end
end

if( not BRICKS_SERVER.CONFIG.MODULES["default"] or not BRICKS_SERVER.CONFIG.MODULES["default"][1] ) then
	BRICKS_SERVER.CONFIG.MODULES["default"] = { true, {} }
end

for k, v in pairs( BRICKS_SERVER.CONFIG.MODULES or {} ) do
	if( BRICKS_SERVER.Modules[k] and v[1] == true ) then
		loadModuleFiles( "bricks_server/modules/" .. k )
	else
		continue
	end

	if( table.Count( v[2] ) > 0 ) then
		for key, val in pairs( v[2] ) do
			if( BRICKS_SERVER.Modules[k][3][key] and val == true ) then
				loadModuleFiles( "bricks_server/modules/" .. k .. "/submodules/" .. key )
			end
		end
	end
end

hook.Add( "InitPostEntity", "BRS.InitPostEntity.Loaded", function()
	BRICKS_SERVER.INITPOSTENTITY_LOADED = true
end )

hook.Add( "Initialize", "BRS.Initialize.Loaded", function()
	BRICKS_SERVER.INITIALIZE_LOADED = true
end )

--[[ CLIENT REQUEST CONFIG ]]--
hook.Add( "BRS.Hooks.ConfigReceived", "BRS.Hooks.ConfigReceived.ConfigWait", function()
	LoadClientConfig()
	LoadDevConfig()

	hook.Remove( "BRS.Hooks.ConfigReceived", "BRS.Hooks.ConfigReceived.ConfigWait" )
end )

BRICKS_SERVER.TEMP.ReceivedConfig = false
BRICKS_SERVER.TEMP.LastConfigRequest = 0
hook.Add( "Think", "BRS.Think.RequestConfig", function()
	if( not BRICKS_SERVER.TEMP.ReceivedConfig and CurTime() >= BRICKS_SERVER.TEMP.LastConfigRequest ) then
		net.Start( "BRS.Net.RequestConfig" )
		net.SendToServer()
		BRICKS_SERVER.TEMP.LastConfigRequest = CurTime()+10
	end
end )

hook.Add( "BRS.Hooks.ConfigReceived", "BRS.Hooks.ConfigReceived.RequestConfigRemover", function()
	if( not BRICKS_SERVER.TEMP.ReceivedConfig ) then
		BRICKS_SERVER.TEMP.ReceivedConfig = true
		hook.Remove( "Think", "BRS.Think.RequestConfig" )
		hook.Remove( "BRS.Hooks.ConfigReceived", "BRS.Hooks.ConfigReceived.RequestConfigRemover" )
	end
end )
--PATH addons/bricks_gangs/lua/bricks_server/bricks_server_luacfg_gangs.lua:
--[[ LUA CONFIG ]]--
BRICKS_SERVER.GANGS.LUACFG = {}
BRICKS_SERVER.GANGS.LUACFG.UseMySQL = false -- Whether or not MySQL should be used (enter your details in bricks-gangs/lua/bricks_server/bricks_gangs/sv_mysql.lua)

BRICKS_SERVER.GANGS.LUACFG.MenuCommands = {
    ["!gang"] = true,
    ["/gang"] = true,
    ["!orgmenu"] = true,	
    ["!bricksgang"] = false,
    ["/bricksgang"] = false
}
--PATH addons/brick_s_server_framework/lua/bricks_server/languages/bricks_server/english.lua:
BRICKS_SERVER.Func.AddLanguageStrings( "english", {
    ["search"] = "Search",
    ["invalidPlayerProfile"] = "Invalid player profile requested!",
    ["unbound"] = "UNBOUND",
    ["themes"] = "Themes",
    ["groups"] = "Groups",
    ["general"] = "General",
    ["itemWhitelisting"] = "Item Whitelisting",
    ["rarities"] = "Rarities",
    ["languages"] = "Languages",
    ["disabled"] = "Disabled",
    ["enabled"] = "Enabled",
    ["purchase"] = "Purchase",
    ["profile"] = "Profile",
    ["view"] = "View",
    ["admin"] = "Admin",
    ["noToolPermission"] = "You don't have permission to use this tool.",
    ["settings"] = "Settings",
    ["players"] = "Players",
    ["modules"] = "Modules",

    ["userGroupEditor"] = "User Group Editor",
    ["addNewGroup"] = "Add new group",
    ["newUserGroup"] = "What should new user group be?",
    ["groupName"] = "GroupName",

    ["custom"] = "Custom",
    ["addNew"] = "Add new",
    ["material"] = "Material",
    ["directImage"] = "Enter a direct image URL below.",
    ["default"] = "Default",
    ["selectMaterial"] = "You must select a material!",

    ["errorNoText"] = "ERROR: NO TEXT",
    ["selectOption"] = "Select option",
    ["selectValue"] = "Please select a value.",
    ["selectColor"] = "Please choose a color.",
    ["configSaved"] = "Config saved!",
    ["cmdNoPermission"] = "You don't have permission to use this command.",
    ["entityPosUpdated"] = "Entity positions updated.",
    ["noEntitiesSpawned"] = "No saved Entities were spawned.",
    ["xEntitiesSpawned"] = "%d saved Entities were spawned.",
    ["error"] = "ERROR",

    ["seconds"] = "%d seconds",
    ["second"] = "%d second",
    ["minutes"] = "%d minutes",
    ["minute"] = "%d minute",
    ["hours"] = "%d hours",
    ["hour"] = "%d hour",
    ["days"] = "%d days",
    ["day"] = "%d day",

    ["noRarity"] = "No rarity",

    ["config"] = "Config",
    ["edit"] = "Edit",
    ["editColor"] = "Edit Color",
    ["editName"] = "Edit Name",
    ["remove"] = "Remove",
    ["name"] = "Name",
    ["description"] = "Description",
    ["model"] = "Model",
    ["icon"] = "Icon",
    ["type"] = "Type",
    ["price"] = "Price",
    ["group"] = "Group",
    ["category"] = "Category",
    ["color"] = "Color",
    ["invalidType"] = "Invalid type.",
    ["invalidOption"] = "Invalid option.",
    ["invalidChoice"] = "Invalid choice.",
    ["invalidGroup"] = "Invalid group.",
    ["invalidPlayer"] = "Invalid player.",
    ["true"] = "TRUE",
    ["false"] = "FALSE",
    ["noDescription"] = "No description",
    ["other"] = "Other",
    ["completed"] = "Completed",
    ["close"] = "Close",
    ["main"] = "Main",
    
    ["valueQuery"] = "What should the %s be?",
    ["dataValueQuery"] = "What data should this be?",
    ["newNameQuery"] = "What should the new name be?",
    ["newDescriptionQuery"] = "What should the new description be?",
    ["newModelQuery"] = "What should the new model be?",
    ["newIconQuery"] = "What should the new icon be?",
    ["newColorQuery"] = "What should the new color be?",
    ["npcTypeQuery"] = "What type should this NPC be?",
    ["newTypeQuery"] = "What should the new type be",
    ["groupRequirementQuery"] = "What should the group requirement be?",
    ["levelRequirementQuery"] = "What should the level requirement be?",
    ["newPriceQuery"] = "What should the new price be?",
    ["newCategoryQuery"] = "What should the new category be?",
    ["npcType"] = "NPC Type",

    ["npcEditor"] = "NPC Editor",
    ["addNPC"] = "Add NPC",
    ["newNPC"] = "New NPC",

    ["ok"] = "OK",
    ["cancel"] = "Cancel",
    ["save"] = "Save",
    ["confirm"] = "Confirm",
    ["nil"] = "NIL",
    ["none"] = "None",
    ["selected"] = "Selected",
    ["unselected"] = "Unselected",
    ["add"] = "Add",

    ["shootyStick"] = "A shooty stick!",
    ["permanent"] = "Permanent",
    ["tierX"] = "(Tier %d)",
    ["someDescription"] = "Some description.",
    ["invalidNPC"] = "BRICKS SERVER ERROR: Invalid NPC",

    ["disconnected"] = "Disconnected",
    ["profileView"] = "Profile View",
    ["loading"] = "Loading",
    ["statistics"] = "Statistics",
    ["steamID64"] = "SteamID64",
    ["donationRank"] = "Donation Rank",
    ["staffRank"] = "Staff Rank",
    ["currentJob"] = "Current Job",
    ["wallet"] = "Wallet",
    ["level"] = "Level",
    ["levelX"] = "Level %d",
    ["experience"] = "Experience",
    ["exp"] = "EXP",
    ["money"] = "Money",
    ["playerLogs"] = "Player Logs",
    ["deleteLogs"] = "Delete logs",
    ["xLogs"] = "%d logs",
    ["xAdminGroups"] = "%d Admin Groups",
    ["editUserGroups"] = "Edit User Groups",
    ["newGroupColor"] = "What should the new group color be?",
    ["newGroupName"] = "What should new group name be?",
    ["groupAlreadyExists"] = "That group already exists!",
    ["whitelist"] = "Whitelist",
    ["unWhitelist"] = "UnWhitelist",
    ["addCustom"] = "Add custom",
    ["entClassWhitelist"] = "What entity class would you like to whitelist?",
    ["entClassAlreadyOnList"] = "This entity class is already on the list!",
    ["changesServerRestart"] = "Some changes will not take effect until the server is restarted!",
    ["comingSoon"] = "Coming Soon!",
    ["features"] = "FEATURES",
    ["addNewRarity"] = "Add new rarity",
    ["newRarity"] = "New Rarity",
    ["needToAddRarity"] = "You need to add a rarity type first!",
    ["whatRarityItem"] = "What rarity should this item be?",
    ["invalidRarity"] = "Invalid rarity.",
    ["rarityAlreadyExists"] = "A rarity with this name already exists!",
    ["themeColorX"] = "Theme - Color %d",
    ["themeTextColor"] = "Theme - Text Color",
    ["presetAccents"] = "Preset accents",
    ["presetBackgrounds"] = "Preset backgrounds",
    ["resetToBaseThemes"] = "Reset to base themes",
    ["resetToCurrentThemes"] = "Reset to current themes",
    ["toggle"] = "Toggle",
    ["menu"] = "Menu",
    ["emptyValue"] = "EMPTY VALUE",
    ["newValueQuery"] = "What should the new value be?",
    ["pressKey"] = "PRESS A KEY",

    ["entityPlacer"] = "Entity Placer",
    ["invalidEntityType"] = "Invalid Entity type, choose a valid one from the tool menu.",
    ["entityPlaced"] = "Entity succesfully placed.",
    ["entityRemoved"] = "Entity succesfully removed.",
    ["canOnlyUseToolEntity"] = "You can only use this tool to remove/create an entity.",
    ["entityType"] = "Entity Type",
    ["entityPlacerDescription"] = "Places and removes entities from Brick's Server and saves their positions. LeftClick - place. RightClick - remove.",
    ["entityPlacerDescriptionSmall"] = "Places and removes entities",
    ["entityPlacerInstructions"] = "LeftClick - place, RightClick - remove.",

    ["npcPlacer"] = "NPC Placer",
    ["npcPlaced"] = "NPC succesfully placed.",
    ["invalidNPCType"] = "Invalid NPC type, choose a valid one from the tool menu.",
    ["npcRemoved"] = "NPC succesfully removed.",
    ["errorNotNPC"] = "You can only use this tool to remove/create an NPC.",
    ["npcPlacerDescription"] = "Places and removes NPCs from Brick's Server, LeftClick - place, RightClick - remove.",
    ["npcPlacerDescriptionSmall"] = "Places and removes NPCs from Brick's Server.",

    ["inventory"] = "Inventory",
    ["player"] = "Player",
    ["drop"] = "Drop",
    ["use"] = "Use",
    ["dropAll"] = "Drop all",
    ["delete"] = "Delete",
    ["create"] = "Create",
    ["createNew"] = "CREATE NEW",
    ["createNewLanguage"] = "Create a new language.",

    ["itemRarities"] = "Item Rarities",
} )
--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_colsheet_left.lua:

local PANEL = {}

AccessorFunc( PANEL, "ActiveButton", "ActiveButton" )

function PANEL:Init()
	self.Navigation = vgui.Create( "bricks_server_scrollpanel", self )
	self.Navigation:Dock( LEFT )
	self.Navigation:SetWidth( 200 )
	self.Navigation.Paint = function( self2, w, h )
		if( not self.dontRoundBack ) then
			draw.RoundedBox( 5, 0, 0, w, h,  BRICKS_SERVER.Func.GetTheme( 2, 200 ) )
		else
			surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2, 200 ) )
			surface.DrawRect( 0, 0, w, h )
		end
	end

	self.Content = vgui.Create( "Panel", self )
	self.Content:Dock( FILL )

	self.Items = {}
	self.Categories = {}
end

function PANEL:CreateSearchBar()
	self.searchBack = vgui.Create( "DPanel", self.Navigation )
	self.searchBack:Dock( TOP )
	self.searchBack:SetTall( 30 )
	local search = Material( "materials/bricks_server/search_16.png" )
	local alpha = 0
	self.searchBack.Paint = function( self2, w, h )
		surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 3, 100 ) )
		surface.DrawRect( 0, 0, w, h )

		if( self.searchBar:IsEditing() ) then
			alpha = math.Clamp( alpha+5, 0, 100 )
		else
			alpha = math.Clamp( alpha-5, 0, 100 )
		end
		
		surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 3, alpha ) )
		surface.DrawRect( 0, 0, w, h )
	
		surface.SetDrawColor( 255, 255, 255, 20+((alpha/100)*255) )
		surface.SetMaterial( search )
		local size = 16
		surface.DrawTexturedRect( w-size-(h-size)/2, (h-size)/2, size, size )
	end

	self.searchBar = vgui.Create( "bricks_server_search", self.searchBack )
	self.searchBar:Dock( FILL )
	self.searchBar:SetFont( "BRICKS_SERVER_Font20" )
	self.searchBar.OnChange = function()
		self:RefreshSheetButtons()
	end
end

function PANEL:UseButtonOnlyStyle()
	self.ButtonOnly = true
end

function PANEL:AddSheet( label, panel, color, onLoad, categoryName, categoryColor )
	if ( !IsValid( panel ) ) then return end

	if( table.Count( self.Categories ) <= 0 ) then
		self.Categories["Default"] = vgui.Create( "bricks_server_navcategorycollapse", self.Navigation )
		self.Categories["Default"]:Dock( TOP )
		self.Categories["Default"]:SetLabel( "Default" )
		self.Categories["Default"]:SetBackColor( BRICKS_SERVER.Func.GetTheme( 5 ) )
	end

	categoryName = categoryName or "Default"
	categoryColor = categoryColor or BRICKS_SERVER.Func.GetTheme( 5 )

	if( not self.Categories[categoryName] ) then
		self.Categories[categoryName] = vgui.Create( "bricks_server_navcategorycollapse", self.Navigation )
		self.Categories[categoryName]:Dock( TOP )
		self.Categories[categoryName]:SetLabel( categoryName )
		self.Categories[categoryName]:SetBackColor( categoryColor )
	end

	self.Categories[categoryName].Count = (self.Categories[categoryName].Count or 0)+1

	local Sheet = {}
	Sheet.Button = vgui.Create( "DButton", self.Categories[categoryName] )
	Sheet.Button.Target = panel
	Sheet.Button:Dock( TOP )
	Sheet.Button:DockMargin( 5, ((self.Categories[categoryName].Count == 1 and 5) or 0), 5, 0 )
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

		draw.SimpleText( label, "BRICKS_SERVER_Font20", 10, h/2, (backColor or BRICKS_SERVER.Func.GetTheme( 5 )), 0, TEXT_ALIGN_CENTER )
	end

	Sheet.Button.DoClick = function()
		if( not Sheet.Button.m_bSelected ) then
			changeAlpha = 0
		end

		self:SetActiveButton( Sheet.Button )

		if( self.OnSheetChange ) then
			self.OnSheetChange( label )
		end
	end

	Sheet.Button.label = label

	Sheet.Panel = panel
	Sheet.Panel:SetParent( self.Content )
	Sheet.Panel:SetVisible( false )

	if( onLoad ) then
		Sheet.Button.loaded = false
		Sheet.Button.onLoad = onLoad
	end

	if ( self.ButtonOnly ) then
		Sheet.Button:SizeToContents()
	end

	table.insert( self.Items, Sheet )

	if ( !IsValid( self.ActiveButton ) ) then
		self:SetActiveButton( Sheet.Button )
	end
	
	return Sheet
end

function PANEL:FinishAddingSheets()
	for k, v in pairs( BRICKS_SERVER.DLCMODULES ) do
		if( self.Categories[v.Name] ) then continue end
		
		self.Categories[v.Name] = vgui.Create( "bricks_server_navcategorycollapse", self.Navigation )
		self.Categories[v.Name]:Dock( TOP )
		self.Categories[v.Name]:SetLabel( v.Name )
		self.Categories[v.Name]:SetBackColor( v.Color )
		self.Categories[v.Name]:SetExpanded( false )

		local hasDLC = false
		for key, val in pairs( v.Modules ) do
			if( BRICKS_SERVER.Modules[val] ) then
				hasDLC = true
				break
			end
		end

		if( not hasDLC ) then
			self.Categories[v.Name].Header.DoClick = function()
				gui.OpenURL( v.Link )
			end
		end
	end

	if( self.OnNavCollapse ) then
		for k, v in pairs( self.Categories ) do
			v.OnNavCollapse = self.OnNavCollapse
		end
	end
end

function PANEL:RefreshSheetButtons()
	if( not IsValid( self.searchBar ) ) then return end

	for k, v in pairs( self.Items ) do
		if( self.searchBar:GetValue() != "" and not string.find( string.lower( v.Button.label ), string.lower( self.searchBar:GetValue() ) ) ) then
			v.Button:SetTall( 0 )
		else
			v.Button:SetTall( 30 )
		end
	end
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

	if( active.onLoad and not active.loaded ) then
		active.onLoad()
		active.loaded = true
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

derma.DefineControl( "bricks_server_colsheet_left", "", PANEL, "Panel" )

--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_colsheet_old.lua:

local PANEL = {}

AccessorFunc( PANEL, "ActiveButton", "ActiveButton" )

function PANEL:Init()
	self.Navigation = vgui.Create( "bricks_server_scrollpanel", self )
	self.Navigation:Dock( LEFT )
	self.Navigation:SetWidth( 200 )
	self.Navigation:DockMargin( 0, 0, 0, 0 )
	self.Navigation.Paint = function( self2, w, h )
		draw.RoundedBoxEx( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ), false, false, true, false )
	end

	self.Content = vgui.Create( "Panel", self )
	self.Content:Dock( FILL )

	self.Items = {}
	self.CategoryButtons = {}
end

function PANEL:AddLinebreak()
	local lineBreak = vgui.Create( "DPanel", self.Navigation )
	lineBreak:Dock( TOP )
	lineBreak:DockMargin( 5, 10, 5, 10 )
	lineBreak:DockMargin( 5, 10, 5, 10 )
	lineBreak:SetTall( 5 )
	lineBreak.Paint = function( self2, w, h )
		draw.RoundedBox( 3, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )
	end
end

function PANEL:AddSheet( label, panel, onLoad, icon, dontShow )
	if ( !IsValid( panel ) ) then return end

	local Sheet = {}
	Sheet.Button = vgui.Create( "DButton", self.Navigation )
	Sheet.Button.Target = panel
	Sheet.Button:Dock( TOP )
	Sheet.Button:SetText( "" )
	Sheet.Button:SetTall( (not dontShow and 65) or 0 )
	local changeAlpha = 0
	surface.SetFont( "BRICKS_SERVER_Font25" )
	local textX, textY = surface.GetTextSize( label )
	local iconMat
	BRICKS_SERVER.Func.GetImage( icon or "", function( mat ) iconMat = mat end )
	Sheet.Button.Paint = function( self2, w, h )
		if( self2:IsHovered() or self2.m_bSelected ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end

		surface.SetAlphaMultiplier( changeAlpha/255 )
		if( self2.m_bSelected ) then
			surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 5 ) )
			surface.DrawRect( 0, 0, w, h )
		elseif( self2:IsHovered() ) then
			surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 5 ) )
			surface.DrawRect( 0, 0, 5, h )
		end
		surface.SetAlphaMultiplier( 1 )

		if( iconMat ) then
			surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
			surface.SetMaterial( iconMat )
			local iconSize = 32
			surface.DrawTexturedRect( (h-iconSize)/2, (h/2)-(iconSize/2), iconSize, iconSize )
		end

		draw.SimpleText( label, "BRICKS_SERVER_Font25", h, h/2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )

		if( Sheet.notifications and Sheet.notifications > 0 ) then
			local nX, nY, nW, nH = h+textX+5, (h/2)-(20/2), 20, 20
			draw.RoundedBox( 5, nX, nY, nW, nH, BRICKS_SERVER.DEVCONFIG.BaseThemes.Red )
			draw.SimpleText( Sheet.notifications, "BRICKS_SERVER_Font20", nX+(nW/2), nY+(nH/2), BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
	end

	Sheet.Button.DoClick = function()
		if( not Sheet.Button.m_bSelected ) then
			changeAlpha = 0
		end

		self:SetActiveButton( Sheet.Button )
	end

	Sheet.Button.label = label

	Sheet.Panel = panel
	Sheet.Panel:SetParent( self.Content )
	Sheet.Panel:SetAlpha( 0 )
	Sheet.Panel:SetVisible( false )

	if( onLoad ) then
		Sheet.Button.loaded = false
		Sheet.Button.onLoad = onLoad
	end

	table.insert( self.Items, Sheet )

	if ( !IsValid( self.ActiveButton ) ) then
		self:SetActiveButton( Sheet.Button )
	end
	
	return Sheet
end

function PANEL:AddCategory( label, icon )
	local categoryButton = vgui.Create( "DButton", self.Navigation )
	categoryButton:Dock( TOP )
	categoryButton:SetText( "" )
	local tall = 65
	categoryButton:SetTall( tall )
	categoryButton:DockPadding( 0, tall, 0, 0 )
	local changeAlpha = 0
	surface.SetFont( "BRICKS_SERVER_Font25" )
	local textX, textY = surface.GetTextSize( label )
	local iconMat
	BRICKS_SERVER.Func.GetImage( icon or "", function( mat ) iconMat = mat end )
	categoryButton.Paint = function( self2, w, h )
		if( self2:IsHovered() or self2.m_bSelected ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 255 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 255 )
		end

		surface.SetAlphaMultiplier( changeAlpha/255 )
		if( self2.m_bSelected ) then
			surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 5 ) )
			surface.DrawRect( 0, 0, w, tall )
		elseif( self2:IsHovered() ) then
			surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 5 ) )
			surface.DrawRect( 0, 0, 5, tall )
		end
		surface.SetAlphaMultiplier( 1 )

		if( iconMat ) then
			surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
			surface.SetMaterial( iconMat )
			local iconSize = 32
			surface.DrawTexturedRect( (tall-iconSize)/2, (tall/2)-(iconSize/2), iconSize, iconSize )
		end

		draw.SimpleText( label, "BRICKS_SERVER_Font25", tall, tall/2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
	end
	categoryButton.DoClick = function()
		if( not categoryButton.m_bSelected ) then
			changeAlpha = 0
		end

		for k, v in pairs( self.Items ) do
			if( v.parentCategory and v.parentCategory == categoryButton ) then
				self:SetActiveButton( v.Button )
				break
			end
		end
	end
	categoryButton.fullHeight = tall

	table.insert( self.CategoryButtons, categoryButton )
	
	return categoryButton
end

function PANEL:AddSubSheet( parentCategory, label, panel, onLoad )

	if( not IsValid( parentCategory ) or not IsValid( panel ) ) then return end

	local Sheet = {}
	Sheet.Button = vgui.Create( "DButton", parentCategory )
	Sheet.Button.Target = panel
	Sheet.Button:Dock( TOP )
	Sheet.Button:SetText( "" )
	Sheet.Button:SetTall( 30 )
	local changeAlpha = 0
	Sheet.Button.Paint = function( self2, w, h )
		if( self2:IsHovered() or self2.m_bSelected ) then
			changeAlpha = math.Clamp( changeAlpha+10, 0, 50 )
		else
			changeAlpha = math.Clamp( changeAlpha-10, 0, 50 )
		end

		surface.SetAlphaMultiplier( changeAlpha/255 )
		surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 4 ) )
		surface.DrawRect( 0, 0, w, h )
		surface.SetAlphaMultiplier( 1 )

		draw.SimpleText( label, "BRICKS_SERVER_Font17", 15, h/2, BRICKS_SERVER.Func.GetTheme( 5 ), 0, TEXT_ALIGN_CENTER )
	end

	Sheet.Button.DoClick = function()
		if( not Sheet.Button.m_bSelected ) then
			changeAlpha = 0
		end

		self:SetActiveButton( Sheet.Button )
	end

	Sheet.Button.label = label

	Sheet.Panel = panel
	Sheet.Panel:SetParent( self.Content )
	Sheet.Panel:SetAlpha( 0 )
	Sheet.Panel:SetVisible( false )

	if( onLoad ) then
		Sheet.Button.loaded = false
		Sheet.Button.onLoad = onLoad
	end

	Sheet.parentCategory = parentCategory
	Sheet.Button.parentCategory = parentCategory
	parentCategory.fullHeight = parentCategory.fullHeight+Sheet.Button:GetTall()

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

	if( self.OnSheetChange ) then
		self.OnSheetChange( active )
	end

	for k, v in pairs( self.CategoryButtons ) do
		if( v.m_bSelected and (not active.parentCategory or active.parentCategory != v) ) then
			v.m_bSelected = false
			v:SizeTo( self.Navigation:GetWide(), 65, 0.2 )
			break
		elseif( not v.m_bSelected and active.parentCategory and active.parentCategory == v ) then
			v.m_bSelected = true
			v:SizeTo( self.Navigation:GetWide(), v.fullHeight, 0.2 )
			break
		end
	end
	
	if ( self.ActiveButton && self.ActiveButton.Target ) then
		local targetPanel = self.ActiveButton.Target
		targetPanel:SetVisible( false )
		targetPanel:SetAlpha( 0 )
		self.ActiveButton:SetSelected( false )
		self.ActiveButton:SetToggle( false )
	end

	self.ActiveButton = active
	active.Target:SetVisible( true )
	active.Target:AlphaTo( 255, 0.2, 0, function() end )
	active:SetSelected( true )
	active:SetToggle( true )

	if( active.onLoad and not active.loaded ) then
		active.onLoad()
		active.loaded = true
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

derma.DefineControl( "bricks_server_colsheet_old", "", PANEL, "Panel" )

--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_combo.lua:

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

	draw.SimpleText( (self.text or BRICKS_SERVER.Func.L( "none" )), "BRICKS_SERVER_Font20", w/2, h/2, BRICKS_SERVER.Func.GetTheme( 6, 20+(not self:IsMenuOpen() and 235*(alpha/100) or 0) ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
end

derma.DefineControl( "bricks_server_combo", "", PANEL, "DButton" )

--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_config_general.lua:
local PANEL = {}

function PANEL:Init()

end

function PANEL:FillPanel()
    function self.RefreshPanel()
        self:Clear()

        self.slots = nil
        if( self.grid and IsValid( self.grid ) ) then
            self.grid:Remove()
        end

        BRICKS_SERVER.Func.FillVariableConfigs( self, "GENERAL", "GENERAL", { ["Admin Permissions"] = { function()
            BRICKS_SERVER.Func.CreateGroupEditor( (BS_ConfigCopyTable.GENERAL.AdminPermissions or {}), function( userGroups ) 
                BS_ConfigCopyTable.GENERAL.AdminPermissions = userGroups or {}
                self.RefreshPanel()
                BRICKS_SERVER.Func.ConfigChange( "GENERAL" )
            end, function() end, true )
        end, BRICKS_SERVER.Func.L( "xAdminGroups", table.Count( BS_ConfigCopyTable.GENERAL.AdminPermissions or {} ) ) } } )
    end
    self.RefreshPanel()
end

function PANEL:Paint( w, h )
    
end

vgui.Register( "bricks_server_config_general", PANEL, "bricks_server_scrollpanel" )
--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_dframepanel.lua:
local PANEL = {}

function PANEL:Init()
    self.headerHeight = 40
    self:DockPadding( 0, self.headerHeight, 0, 0 )

    self.removeOnClose = true
    self:CreateCloseButton()
end

function PANEL:CreateCloseButton()
    if( self.dontShowClose ) then return end

    local size = 24

    if( IsValid( self.closeButton ) ) then
        self.closeButton:SetSize( size, size )
        self.closeButton:SetPos( self:GetWide()-size-((self.headerHeight-size)/2), (self.headerHeight/2)-(size/2) )
        return
    end

    self.closeButton = vgui.Create( "DButton", self )
	self.closeButton:SetSize( size, size )
	self.closeButton:SetPos( self:GetWide()-size-((self.headerHeight-size)/2), (self.headerHeight/2)-(size/2) )
	self.closeButton:SetText( "" )
    local CloseMat = Material( "materials/bricks_server/close.png" )
    local textColor = BRICKS_SERVER.Func.GetTheme( 6 )
	self.closeButton.Paint = function( self2, w, h )
		if( self2:IsHovered() and !self2:IsDown() ) then
			surface.SetDrawColor( textColor.r*0.6, textColor.g*0.6, textColor.b*0.6 )
		elseif( self2:IsDown() || self2.m_bSelected ) then
			surface.SetDrawColor( textColor.r*0.8, textColor.g*0.8, textColor.b*0.8 )
		else
			surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
		end

		surface.SetMaterial( CloseMat )
		surface.DrawTexturedRect( 0, 0, w, h )
	end
    self.closeButton.DoClick = function()
        if( self.onCloseFunc ) then
            self.onCloseFunc()
        end

        if( self.removeOnClose or BRS_REMOVEONCLOSE ) then
            self:Remove()
        else
            self:SetVisible( false )
        end
    end
end

function PANEL:OnSizeChanged( newW, newH )
    self:CreateCloseButton()
end

function PANEL:SetHeader( header )
    self.header = header
end

function PANEL:DisableClose()
    self.dontShowClose = true

    if( IsValid( self.closeButton ) ) then
        self.closeButton:Remove()
    end
end

local rounded = 5
function PANEL:Paint( w, h )
    BRICKS_SERVER.BSHADOWS.BeginShadow()
    local x, y = self:LocalToScreen( 0, 0 )
    draw.RoundedBox( rounded, x, y, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )			
    BRICKS_SERVER.BSHADOWS.EndShadow( 1, 2, 2, 255, 0, 0, false )

    draw.RoundedBoxEx( rounded, 0, 0, w, self.headerHeight, BRICKS_SERVER.Func.GetTheme( 0 ), true, true, false, false )

    draw.SimpleText( (self.header or BRICKS_SERVER.Func.L( "menu" )), "BRICKS_SERVER_Font30", 10, (self.headerHeight or 40)/2-2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
end

vgui.Register( "bricks_server_dframepanel", PANEL, "DPanel" )
--PATH addons/brick_s_server_framework/lua/bricks_server/vgui/bricks_server_gradientanim.lua:
local PANEL = {}

function PANEL:Init()

	self.movePanel = vgui.Create( "DPanel", self )
	self.movePanel:SetPos( 0, 0 )
	self.movePanel.Paint = function( self2, w, h )
		local movePanelX, movePanelY = self2:GetPos()

		BRICKS_SERVER.Func.DrawRoundedMask( (self.cornerRadius or 5), -movePanelX+(self.roundedBoxX or 0), -movePanelY+(self.roundedBoxY or 0), (self.roundedBoxW or self:GetWide()), (self.roundedBoxH or self:GetTall()), function()
			if( not BRICKS_SERVER.CONFIG.GENERAL["Use Textured Gradients (Better FPS)"] ) then
				if( self.direction != 1 ) then
					BRICKS_SERVER.Func.DrawGradientBox( 0, 0, self.animSize, h, self.direction, unpack( self.colors ) )
					BRICKS_SERVER.Func.DrawGradientBox( self.animSize, 0, self.animSize, h, self.direction, unpack( table.Reverse( self.colors ) ) )
					BRICKS_SERVER.Func.DrawGradientBox( self.animSize*2, 0, self.animSize, h, self.direction, unpack( self.colors ) )
				else
					BRICKS_SERVER.Func.DrawGradientBox( 0, 0, w, self.animSize, self.direction, unpack( self.colors ) )
					BRICKS_SERVER.Func.DrawGradientBox( 0, self.animSize, w, self.animSize, self.direction, unpack( table.Reverse( self.colors ) ) )
					BRICKS_SERVER.Func.DrawGradientBox( 0, self.animSize*2, w, self.animSize, self.direction, unpack( self.colors ) )
				end
			else
				if( self.direction != 1 ) then
					BRICKS_SERVER.Func.DrawTexturedGradientBox( 0, 0, self.animSize, h, self.direction, unpack( self.colors ) )
					BRICKS_SERVER.Func.DrawTexturedGradientBox( self.animSize, 0, self.animSize, h, self.direction, unpack( table.Reverse( self.colors ) ) )
					BRICKS_SERVER.Func.DrawTexturedGradientBox( self.animSize*2, 0, self.animSize, h, self.direction, unpack( self.colors ) )
				else
					BRICKS_SERVER.Func.DrawTexturedGradientBox( 0, 0, w, self.animSize, self.direction, unpack( self.colors ) )
					BRICKS_SERVER.Func.DrawTexturedGradientBox( 0, self.animSize, w, self.animSize, self.direction, unpack( table.Reverse( self.colors ) ) )
					BRICKS_SERVER.Func.DrawTexturedGradientBox( 0, self.animSize*2, w, self.animSize, self.direction, unpack( self.colors ) )
				end
			end
		end )
	end

	self:SetColors( Color( 255, 255, 255 ), Color( 0, 0, 0 ) )
	self:SetDirection( 0 )
	self:SetAnimTime( 2 )
end

function PANEL:StartAnim()
	self.movePanel:MoveTo( ((self.direction != 1 and -(self.animSize*2)) or 0), ((self.direction == 1 and -(self.animSize*2)) or 0), self.animTime, 0, 1, function()
		self.movePanel:SetPos( 0, 0 )
		self:StartAnim()
	end )
end

function PANEL:OnSizeChanged( w, h )
	if( self.direction != 1 ) then
		self.movePanel:SetTall( h )
	else
		self.movePanel:SetWide( w )
	end

	self:SetAnimSize( (self.direction != 1 and w) or h )
end

function PANEL:SetAnimSize( animSize )
	self.animSize = animSize
	
	if( self.direction != 1 ) then
		self.movePanel:SetWide( self.animSize*3 )
	else
		self.movePanel:SetTall( self.animSize*3 )
	end
end

function PANEL:SetColors( ... )
	self.colors = { ... }
end

function PANEL:SetCornerRadius( cornerRadius )
    self.cornerRadius = cornerRadius
end

function PANEL:SetAnimTime( animTime )
    self.animTime = animTime
end

function PANEL:SetDirection( direction )
	self.direction = direction

	self:SetAnimSize( (self.direction != 1 and self:GetWide()) or self:GetTall() )
end

function PANEL:SetRoundedBoxDimensions( roundedBoxX, roundedBoxY, roundedBoxW, roundedBoxH )
    self.roundedBoxX, self.roundedBoxY, self.roundedBoxW, self.roundedBoxH = roundedBoxX, roundedBoxY, roundedBoxW, roundedBoxH
end

function PANEL:TasteTheRainbow()
    self:SetAnimTime( 5 )
    self:SetAnimSize( ((self.direction != 1 and self:GetWide()) or self:GetTall())*6 )

    local rainbowColors, range = {}, 10
    for i = 1, range do
        table.insert( rainbowColors, HSVToColor( (i/range)*360, 1, 1 ) )
	end

    self:SetColors( unpack( rainbowColors ) )
end

function PANEL:Paint( w, h )

end

vgui.Register( "bricks_server_gradientanim", PANEL, "DPanel" )
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/client/cl_gang_admin.lua:
net.Receive( "BRS.Net.SendAdminGangTables", function()
    hook.Run( "BRS.Hooks.RefreshGangAdmin", net.ReadTable() or {} )
end )

function BRICKS_SERVER.Func.RequestAdminGangs( searchString )
    if( not BRICKS_SERVER.Func.HasAdminAccess( LocalPlayer() ) ) then return false end

    if( CurTime() < (BRS_REQUEST_ADMINGANG_COOLDOWN or 0) ) then return false, BRICKS_SERVER.Func.L( "gangRequestCooldown" ), ((BRS_REQUEST_ADMINGANG_COOLDOWN or 0)-CurTime()) end

    BRS_REQUEST_ADMINGANG_COOLDOWN = CurTime()+3

    net.Start( "BRS.Net.RequestAdminGangs" )
        net.WriteString( searchString )
    net.SendToServer()

    return true
end

net.Receive( "BRS.Net.SendAdminGangData", function()
    local gangID = net.ReadUInt( 16 )
    local gangTable = net.ReadTable()

    hook.Run( "BRS.Hooks.RefreshGangAdminData", gangID, gangTable )
end )

function BRICKS_SERVER.Func.RequestAdminGangData( gangID )
    if( not BRICKS_SERVER.Func.HasAdminAccess( LocalPlayer() ) ) then return false end

    if( CurTime() < (BRS_REQUEST_ADMINGANGDATA_COOLDOWN or 0) ) then return false, BRICKS_SERVER.Func.L( "gangRequestDataCooldown" ), ((BRS_REQUEST_ADMINGANGDATA_COOLDOWN or 0)-CurTime()) end

    BRS_REQUEST_ADMINGANGDATA_COOLDOWN = CurTime()+2

    net.Start( "BRS.Net.RequestAdminGangData" )
        net.WriteUInt( gangID, 16 )
    net.SendToServer()

    return true
end
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/submodules/achievements/shared/sh_gang_achievements.lua:
function BRICKS_SERVER.Func.GangGetAchievementCompleted( gangID, key )
    local gangTable = (BRICKS_SERVER_GANGS or {})[gangID] or {}

    if( gangTable and gangTable.Achievements and gangTable.Achievements[key] and gangTable.Achievements[key] == true ) then
        return true
    end

    return false
end
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/submodules/achievements/vgui/bricks_server_gangmenu_achievements.lua:
local PANEL = {}

function PANEL:Init()
    self:DockMargin( 10, 10, 10, 10 )
end

function PANEL:FillPanel( gangTable )
    local categoryList = vgui.Create( "bricks_server_dcategorylist", self )
    categoryList:Dock( FILL )

    function self.RefreshPanel()
        categoryList:Clear()

        local categories = {}
        local slotTall, spacing = 80, 5

        for k, v in pairs( BRICKS_SERVER.CONFIG.GANGS.Achievements or {} ) do
            local categoryName = v.Category or BRICKS_SERVER.Func.L( "other" )
            if( not categories[categoryName] ) then
                local categoryColor = BRICKS_SERVER.Func.GetTheme( 5 )

                categories[categoryName] = categoryList:Add( categoryName, categoryColor )
                categories[categoryName]:SetTall( 40+spacing )

                local spacer = vgui.Create( "DPanel", categories[categoryName] )
                spacer:Dock( BOTTOM )
                spacer:SetTall( spacing )
                spacer.Paint = function( self2, w, h ) end
            end

            categories[categoryName]:SetTall( categories[categoryName]:GetTall()+slotTall+spacing )

            local upgradeDevConfig = BRICKS_SERVER.DEVCONFIG.GangAchievements[v.Type] or {}

            local achievementBack = vgui.Create( "DPanel", categories[categoryName] )
            achievementBack:Dock( TOP )
            achievementBack:DockMargin( spacing, spacing, spacing, 0 )
            achievementBack:SetTall( slotTall )
            achievementBack.Paint = function( self2, w, h ) 
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
            end

            local achievementIcon = vgui.Create( "DPanel", achievementBack )
            achievementIcon:Dock( LEFT )
            achievementIcon:DockMargin( 0, 0, 0, 0 )
            achievementIcon:SetWide( achievementBack:GetTall() )
            local iconMat = Material( "bricks_server/upgrades.png" )
            if( v.Icon ) then
                BRICKS_SERVER.Func.GetImage( v.Icon, function( mat ) 
                    iconMat = mat 
                end )
            end
            achievementIcon.Paint = function( self2, w, h ) 
                surface.SetDrawColor( 255, 255, 255, 255 )
                surface.SetMaterial( iconMat )
                local iconSize = 64
                surface.DrawTexturedRect( (w/2)-(iconSize/2), (h/2)-(iconSize/2), iconSize, iconSize )
            end

            local achievementInfo = vgui.Create( "DPanel", achievementBack )
            achievementInfo:Dock( LEFT )
            achievementInfo:DockMargin( 0, 10, 0, 10 )
            achievementInfo:SetWide( 125 )
            achievementInfo.Paint = function( self2, w, h ) 
                draw.SimpleText( (v.Name or BRICKS_SERVER.Func.L( "nil" )), "BRICKS_SERVER_Font17", 0, 5, BRICKS_SERVER.Func.GetTheme( 5 ), 0, 0 )
            end
            
            local achievementDescription = vgui.Create( "DPanel", achievementInfo )
            achievementDescription:Dock( FILL )
            achievementDescription:DockMargin( 0, 22, 0, 0 )
            achievementDescription.Paint = function( self2, w, h )
                local description = BRICKS_SERVER.Func.TextWrap( (v.Description or BRICKS_SERVER.Func.L( "noDescription" )), "BRICKS_SERVER_Font17", w )

                BRICKS_SERVER.Func.DrawNonParsedText( description, "BRICKS_SERVER_Font17", 0, 0, BRICKS_SERVER.Func.GetTheme( 6 ), 0 )
            end

            local completed = BRICKS_SERVER.Func.GangGetAchievementCompleted( LocalPlayer():GetGangID(), k )
            if( completed ) then
                local completedBack = vgui.Create( "DPanel", achievementBack )
                completedBack:Dock( RIGHT )
                completedBack:DockMargin( 0, 10, 10, 10 )
                completedBack:SetWide( achievementBack:GetTall()-20 )
                local completedMat = Material( "bricks_server/gang_upgrade_bought.png" )
                completedBack.Paint = function( self2, w, h )
                    draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )

                    surface.SetDrawColor( 255, 255, 255, 20 )
                    surface.SetMaterial( completedMat )
                    local iconSize = 32
                    surface.DrawTexturedRect( (w/2)-(iconSize/2), (h/2)-(iconSize/2), iconSize, iconSize )
                end 
            end

            local achievementProgress = vgui.Create( "DPanel", achievementBack )
            achievementProgress:Dock( BOTTOM )
            achievementProgress:DockMargin( 5, 0, 5, 10 )
            achievementProgress:SetTall( 32 )
            local themeColor = BRICKS_SERVER.Func.GetTheme( 0 )
            local overlayColor = Color( themeColor.r, themeColor.g, themeColor.b, 125 )
            local goal = upgradeDevConfig.GetGoal( v.ReqInfo ) or 0
            achievementProgress.Paint = function( self2, w, h ) 
                draw.RoundedBox( 5, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ) )

                if( not completed ) then
                    local progress = upgradeDevConfig.GetProgress( gangTable ) or 0
                    local decimal = math.Clamp( progress/goal, 0, 1 )

                    draw.RoundedBox( 5, 0, 0, w*decimal, h, overlayColor )

                    draw.SimpleText( BRICKS_SERVER.Func.L( "gangProgress", upgradeDevConfig.Format( progress, goal ) ), "BRICKS_SERVER_Font17", 10, h/2-1, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
                    
                    draw.SimpleText( math.floor( decimal*100 ) .. "%", "BRICKS_SERVER_Font17", w-10, h/2-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
                else
                    draw.RoundedBox( 5, 0, 0, w, h, overlayColor )

                    draw.SimpleText( BRICKS_SERVER.Func.L( "completed" ), "BRICKS_SERVER_Font17", 10, h/2-1, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
                end
            end

            local achievementNoticeBack = vgui.Create( "DPanel", achievementBack )
            achievementNoticeBack:Dock( FILL )
            achievementNoticeBack:DockMargin( 5, 10, 5, 5 )
            achievementNoticeBack.Paint = function( self2, w, h ) end
            achievementNoticeBack.AddInfo = function( text, dockRight, color )
                surface.SetFont( "BRICKS_SERVER_Font17" )
                local textX, textY = surface.GetTextSize( text )

                local upgradeReqInfo = vgui.Create( "DPanel", achievementNoticeBack )
                upgradeReqInfo:Dock( (dockRight and RIGHT) or LEFT )
                upgradeReqInfo:DockMargin( (dockRight and 5) or 0, 0, (not dockRight and 5) or 0, 0 )
                upgradeReqInfo:SetWide( textX+15 )
                upgradeReqInfo.Paint = function( self2, w, h ) 
                    draw.RoundedBox( 5, 0, 0, w, h, (color or BRICKS_SERVER.Func.GetTheme( 4 )) )

                    draw.SimpleText( text, "BRICKS_SERVER_Font17", w/2, h/2-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
                end
            end

            for k, v in pairs( v.Rewards or {} ) do
                local devConfigReward = BRICKS_SERVER.DEVCONFIG.GangRewards[k]

                if( not devConfigReward ) then continue end

                achievementNoticeBack.AddInfo( devConfigReward.FormatDescription( v ), true, devConfigReward.Color )
            end
        end
    end
    self.RefreshPanel()

    hook.Add( "BRS.Hooks.RefreshGang", self, function( self, valuesChanged )
        if( IsValid( self ) ) then
            if( valuesChanged and valuesChanged["Achievements"] ) then
                self.RefreshPanel()
            end
        else
            hook.Remove( "BRS.Hooks.RefreshGang", self )
        end
    end )
end

function PANEL:Paint( w, h )

end

vgui.Register( "bricks_server_gangmenu_achievements", PANEL, "DPanel" )
--PATH addons/bricks_gangs/lua/bricks_server/modules/gangs/submodules/territories/shared/sh_gang_territories.lua:
function BRICKS_SERVER.Func.GangTerritoryExists( territoryKey )
    if( territoryKey and BRS_GANG_TERRITORIES and BRS_GANG_TERRITORIES[territoryKey] ) then return BRS_GANG_TERRITORIES[territoryKey] end

    if( BRICKS_SERVER.CONFIG.GANGS.Territories[territoryKey] ) then
        if( not BRS_GANG_TERRITORIES ) then
            BRS_GANG_TERRITORIES = {}
        end

        BRS_GANG_TERRITORIES[territoryKey] = { 
            Claimed = false
        }

        return BRS_GANG_TERRITORIES[territoryKey]
    end

    return false
end
--PATH addons/chat/lua/autorun/client/chatbox_cl.lua:
local size = CreateClientConVar("grp_size_font", 24, true, false, "Размер текста в чате", 12, 40)

grp = grp or {}

function grp.ScreenScale(size)
	local r = ScrH()/1080
	if (r < 0.8) then 
		r = 0.8
	elseif (r > 2) then 
		r = 2
	end
	return math.Round(r * size)
end


for i = 12, 40 do
    surface.CreateFont("TargetID_" .. i, {
        font = "PT Root UI Bold",
        size = grp.ScreenScale(i),
        extended = true,
        weight = 450,
    })

    --outline=true
    surface.CreateFont("ChatLine_" .. i, {
        font = "PT Root UI Bold",
        size = grp.ScreenScale(i),
        extended = true,
        weight = 450,
    })
end

local surface_DrawText = surface.DrawText
local surface_SetDrawColor = surface.SetDrawColor
local surface_DrawRect = surface.DrawRect
local surface_DrawOutlinedRect = surface.DrawOutlinedRect
local surface_SetFont = surface.SetFont
local surface_GetTextSize = surface.GetTextSize
local surface_SetAlphaMultiplier = surface.SetAlphaMultiplier
local surface_SetTextColor = surface.SetTextColor
local surface_SetTextPos = surface.SetTextPos
local draw_SimpleTextOutlined = draw.SimpleTextOutlined
local draw_Blur = draw.Blur

function grp.CreateChatBox()
    if not IsValid(LocalPlayer()) then return end
    local frame = vgui.Create('ba_chatbox')
    --frame:AddMessage({Color(255, 100, 0), '| ', Color(255, 255, 255), 'Добро пожаловать на ', Color(255, 55, 55), 'HappyRP!'})

    return frame
end

local LABEL = {}

function LABEL:Init()
    self._Colors = {}
    self._Text = ''
    self._SelStart = 0
    self._SelEnd = 0
    self._SelText = ''
    self._Bits = {}
    self.Expire = SysTime() + 15
    self.Created = SysTime()
    self:SetText('')
end

function LABEL:SizeToContents()
    surface_SetFont("TargetID_" .. size:GetInt())
    local w, h = 0, 0

    for i = 1, string.utf8len(self._Text) do
        local char = string.utf8sub(self._Text, i, i)
        local wid, th = surface_GetTextSize(char)

        if (h < th) then
            h = th
        end

        if (self._Text[i] == '&') then
            wid = 12
        end

        table.insert(self._Chars, {char, w, wid})

        w = w + wid
    end

    self:SetSize(w, h)
end

function LABEL:SetText(val)
    self._Text = val
    self._Bits = {}
    self._Chars = {}
    surface_SetFont("TargetID_" .. size:GetInt())
    self:SizeToContents()
end

function LABEL:AddColor(Pos, Col)
    self._Colors[Pos] = Col
    self._Bits = {}
end

function LABEL:Think()
    self._SelText = ''
    local x1 = nil
    local x2 = nil

    if (self._SelStart ~= 0 or self._SelEnd ~= 0) then
        local endx

        for k, v in ipairs(self._Chars) do
            if (self._SelStart <= v[2] + v[3] and self._SelEnd >= v[2] + v[3]) then
                self._SelText = self._SelText .. v[1] .. ((k == #self._Chars) and '\n' or '')
                v.Sel = true

                if (not x1) then
                    x1 = v[2]
                end
            else
                v.Sel = false

                if (x1 and not x2) then
                    x2 = v[2] - x1
                end
            end

            endx = v[2] + v[3]
        end

        if (x1 and not x2) then
            x2 = endx - x1
        end
    end

    self._HighX1 = x1
    self._HighX2 = x2

    if (not self._Bits[1]) then
        local lastcol = Color(0, 0, 0)
        local lastpos = 1
        local str = ''

        for k, v in ipairs(self._Chars) do
            if (self._Colors[k]) then
                str = string.utf8sub(self._Text, lastpos, k - 1)

                table.insert(self._Bits, {str, self._Chars[lastpos][2], lastcol})

                lastpos = k
                lastcol = self._Colors[k]
            end
        end

        if (self._Text[lastpos] and self._Chars[lastpos]) then
            str = string.utf8sub(self._Text, lastpos)

            table.insert(self._Bits, {str, self._Chars[lastpos][2], lastcol})
        end
    end
end

function LABEL:GetSelText()
    return self._SelText or ''
end

local blk = Color(0, 0, 0)

function LABEL:Paint(w, h)
    if (CHATBOX and CHATBOX.ShouldDraw == false) then return true end
    if (SysTime() > self.Expire) and (CHATBOX and not CHATBOX._Open) then return true end

    --local fin = math.Clamp((SysTime() - (self.Expire - 15)) / .25, 0, 1)
    --if (!CHATBOX._Open and fin == 1) then
    -- calc alpha and override mul
    --	local a = 1 - (math.Clamp((SysTime() - self.Expire) + 2, 0, 2) / 2)
    --	surface_SetAlphaMultiplier(a)
    --else
    --	surface_SetAlphaMultiplier(fin)
    --end
    if (self._HighX1 and self._HighX2) then
        surface_SetDrawColor(200, 200, 200, 100)
        surface_DrawRect(self._HighX1, 0, self._HighX2, h)
    end

    for k, v in ipairs(self._Bits) do
        v[3].a = math.Clamp((SysTime() - self.Created) * 2, 0, 1) * 255
        draw_SimpleTextOutlined(v[1], "TargetID_" .. size:GetInt(), v[2] + 1, ((h == 16 and 1) or 0), v[3], 0, 0, 0.5, blk)
    end

    return true
end

derma.DefineControl('ba_chatlabel', 'Badmin Chatbox Label', LABEL, 'DLabel')
local PANEL = {}

function PANEL:OnMouseReleased(b)
    self.Selecting = nil
end

function PANEL:Init()
    self:SetSize(chat.GetChatBoxSize(true))
    self:SetPos(chat.GetChatBoxPos())
    self.ShouldDraw = true
    self._Open = false
    self._Messages = {}
    self._Team = false
    self.History = {}
    self.AutoNames = {}
    self.CurrentAutoName = 0
    self.btnResize = vgui.Create('Panel', self)
    self.btnResize:SetCursor('sizenesw')

    self.btnResize.OnMousePressed = function(s, mb)
        if (mb == MOUSE_LEFT) then
            self.Resizing = true
        end
    end

    self.msgFrame = vgui.Create('ui_scrollpanel', self)
    self.msgFrame:HideScrollbar(true)
    self.msgFrame:SetScrollSize(2)
    self.msgFrame:SetSkin('SUP')
    self.OvermsgFrame = vgui.Create('Panel', self)

    self.OvermsgFrame.Think = function(s)
        local y = 0
        local off = math.abs(self.msgFrame.yOffset)

        local mp = {gui.MouseX() - s.x - self.x, gui.MouseY() - s.y - self.y + self.msgFrame.yOffset}

        local firstx, firsty, lastx, lasty

        if (self.Selecting) then
            if (self.MouseDown[2] > mp[2]) then
                firstx = mp[1]
                firsty = mp[2]
                lastx = self.MouseDown[1]
                lasty = self.MouseDown[2]
            else
                firstx = self.MouseDown[1]
                firsty = self.MouseDown[2]
                lastx = mp[1]
                lasty = mp[2]
            end
        end

        --if (self.msgFrame.ySpeed and self.msgFrame.ySpeed == 0) then self.msgFrame.AutoScrolling = false end
        self.SelectedText = ''

        for k, v in ipairs(self._Messages) do
            if (y >= off - s:GetTall() and y <= off + s:GetTall()) then
                v:SetVisible(true)
            else
                v:SetVisible(false)
            end

            if (self.Selecting) then
                if (firsty <= v.y and lasty > v.y + v:GetTall()) then
                    v._SelStart = 0
                    v._SelEnd = v:GetWide()
                elseif (firsty >= v.y and firsty <= v.y + v:GetTall() - 1) then
                    if (lasty > v.y + v:GetTall()) then
                        v._SelStart = firstx
                        v._SelEnd = v:GetWide()
                    else
                        if (firstx < lastx) then
                            v._SelStart = firstx
                            v._SelEnd = lastx
                        else
                            v._SelStart = lastx
                            v._SelEnd = firstx
                        end
                    end
                elseif (lasty >= v.y and lasty <= v.y + v:GetTall()) then
                    if (firsty <= v.y + 10) then
                        v._SelStart = 0
                        v._SelEnd = lastx
                    else
                        if (firstx < lastx) then
                            v._SelStart = firstx
                            v._SelEnd = lastx
                        else
                            v._SelStart = lastx
                            v._SelEnd = firstx
                        end
                    end
                else
                    v._SelStart = 0
                    v._SelEnd = 0
                end
            end

            self.SelectedText = self.SelectedText .. v:GetSelText()
            y = y + v:GetTall()
        end
    end

    self.OvermsgFrame.OnMouseWheeled = function(s, ...) return self.msgFrame:OnMouseWheeled(...) end

    self.OvermsgFrame.OnMousePressed = function(s, b)
        local sb = self.msgFrame.scrollBar.scrollButton
        local sbx, sby = sb:CursorPos()

        if (sbx >= 0 and sbx <= sb:GetWide() and sby >= 0 and sby <= sb:GetTall()) then
            sb:OnMousePressed(b)
        else
            self.MouseDown = {gui.MouseX() - self.x - s.x, gui.MouseY() - self.y - s.y + self.msgFrame.yOffset}

            self.Selecting = true
        end
    end

    self.OvermsgFrame.OnMouseReleased = function(s, b)
        self.Selecting = false
    end

    self.txtEntry = vgui.Create('DTextEntry', self)
    self.txtEntry:SetPaintBackground(false)
    self.txtEntry:SetVisible(false)

    self.txtEntry.PaintOver = function(s, w, h)
        if (CHATBOX and CHATBOX.ShouldDraw == false) then return true end
        if (not s.AutoFillText) then return end
        surface_SetFont('ChatLine_' .. size:GetInt())
        local x = surface_GetTextSize(s:GetValue())
        local w, h = surface_GetTextSize(s.AutoFillText)
        surface_SetDrawColor(s:GetHighlightColor() or ui.col.SUP)
        surface_DrawRect(x + 3, 1, w, h + 1)
        surface_SetTextColor(ui.col.White)
        surface_SetTextPos(x + 3, 1)
        surface_DrawText(s.AutoFillText)
    end

    self.txtEntry.OnKeyCodeTyped = function(s, c)
        if (c == KEY_TAB) or ((c == KEY_RIGHT) and (s:GetCaretPos() == string.utf8len(s:GetValue()))) then
            self:DoAutoFill()
            s:OnTextChanged()
            s:SetCaretPos(string.utf8len(s:GetValue()))
        elseif (c == KEY_UP) then
            if (#self.AutoNames > 0) then
                local auto = self:GetAutoFill(1)
                s.AutoFillText = auto and auto.CompleteString or nil
            else
                if (self.History[s.historyPos + 1]) then
                    s.historyPos = s.historyPos + 1
                    s:SetText(self.History[s.historyPos])
                    s:SetCaretPos(string.utf8len(s:GetValue()))
                end
            end
        elseif (c == KEY_DOWN) then
            if (#self.AutoNames > 0) then
                local auto = self:GetAutoFill(1)
                s.AutoFillText = auto and auto.CompleteString or nil
            else
                if (self.History[s.historyPos - 1] or s.historyPos - 1 == 0) then
                    s.historyPos = s.historyPos - 1
                    s:SetText(self.History[s.historyPos] or '')
                    s:SetCaretPos(string.utf8len(s:GetValue()))
                end
            end
        elseif (c == KEY_ENTER) then
            RunConsoleCommand('say' .. ((self._Team and '_team') or ''), s:GetValue())

            if (string.Trim(s:GetValue()) ~= '') then
                table.insert(self.History, 1, s:GetValue())
            end

            self:Close()
        elseif (c == KEY_ESCAPE) then
            self:Close()
            gui.HideGameUI() -- Hide the ESC menu (RunConsoleCommand("cancelselect") doesn't work)
        end
    end

    self.txtEntry.OnLoseFocus = function(s)
        if (input.IsKeyDown(KEY_TAB)) then
            s:RequestFocus()
            s:SetCaretPos(string.utf8len(s:GetText()))
        end
    end

    self.txtEntry.OnTextChanged = function(s)
        self:CalculateAutoFill()
        local auto = self:GetAutoFill()
        s.AutoFillText = auto and auto.CompleteString or nil

        if (s:AllowInput()) then
            s:SetValue(string.sub(s:GetValue(), 1, 120))
            s:SetCaretPos(120)
        end

        gamemode.Call('ChatTextChanged', s:GetValue())
    end

    self.txtEntry.AllowInput = function(s)
        if (string.len(s:GetValue()) >= 120) then
            surface.PlaySound('Resource/warning.wav')

            return true
        end
    end

    self:PerformLayout()
end

function PANEL:OnKeyCodePressed(k)
    if (k == KEY_C) and (input.IsKeyDown(KEY_LCONTROL)) then
        if (self.SelectedText and self.SelectedText ~= '') then
            SetClipboardText(self.SelectedText)

            self.SelectedText = '' -- Clear the selection

            for k, v in ipairs(self._Messages) do
                v._SelStart = 0
                v._SelEnd = 0
            end -- Clear the selection in labels
        end
    end
end

function PANEL:PerformLayout()
    self.txtEntry:SetFont('ChatLine_' .. size:GetInt())
    self.txtEntry:SetPos(5, self:GetTall() - self.txtEntry:GetTall() - 5)
    self.txtEntry:SetWide(self:GetWide() - 10)
    self.btnResize:SetSize(5, 5)
    self.btnResize:SetPos(self:GetWide() - 5, 0)
    self.msgFrame:SetPos(5, 5)
    self.msgFrame:SetSize(self:GetWide() - 10, self.txtEntry.y - 10)
    self.OvermsgFrame:SetPos(5, 5)
    self.OvermsgFrame:SetSize(self:GetWide() - 10, self.txtEntry.y - 10)
end

function PANEL:Think()
    if (not self.Resizing) then return end

    if (not input.IsMouseDown(MOUSE_LEFT)) then
        cvar.SetValue('ChatboxSize', {self:GetWide(), self:GetTall()})

        self.Resizing = false

        return
    end

    local w = math.Clamp(gui.MouseX() - chat.GetChatBoxLeftBound(), 265, ScrW() - 23) + 3
    local h = math.Clamp(chat.GetChatBoxBottomBound() - gui.MouseY(), 155, ScrH() - 23) + 3

    if (x ~= self:GetWide() or h ~= self:GetTall()) then
        local newOff = self.msgFrame.yOffset

        if (h < self:GetTall()) then
            newOff = newOff + (self:GetTall() - h)
        end

        self:SetSize(w, h)
        self:SetPos(chat.GetChatBoxPos(w, h))
        self:InvalidateLayout(true)
        self.msgFrame:SetOffset(newOff)
    end
end

local colblack = Color(0, 0, 0)
local coloutline = Color(ui.col.Outline.r, ui.col.Outline.g, ui.col.Outline.b)
local colteamchat = Color(100, 200, 100)
local colglobalchat = Color(255, 255, 255)

function PANEL:Paint(w, h)
    self.ShouldDraw = hook.Call('HUDShouldDraw', GAMEMODE, 'Chatbox')
    if (not self.ShouldDraw) then return true end
    local a = 0

    if (self._OpenTime) then
        a = math.Clamp((SysTime() - self._OpenTime) / .25, 0, 1)
    elseif (self._CloseTime) then
        a = 1 - math.Clamp((SysTime() - self._CloseTime) / .25, 0, 1)
    end

    if (a == 0) then return end
    draw_Blur(self, a * 6)
    surface_SetDrawColor(0, 0, 0, 150 * a)
    surface_DrawRect(0, 0, w, h)
    coloutline.a = a * 255
    surface_SetDrawColor(coloutline)
    surface_DrawOutlinedRect(0, 0, w, h)
    local x, y, w, h = self.txtEntry.x - 2, self.txtEntry.y - 2, self.txtEntry:GetWide() + 4, self.txtEntry:GetTall() + 4
    colblack.a = a * 255
    surface_SetDrawColor(colblack)
    surface_DrawRect(x + 1, y + 1, w - 2, h - 2)
    colteamchat.a = a * 255
    colglobalchat.a = a * 255
    surface_SetDrawColor((self._Team and colteamchat) or colglobalchat)
    surface_DrawRect(x + 2, y + 2, w - 4, h - 4)
end

function PANEL:PaintOver(w, h)
end

function PANEL:AddMessage(data)
    local strings = ''
    local colors = {}

    table.insert(colors, {
        Col = Color(200, 200, 200),
        Pos = 1
    })

    for _, v in ipairs(data) do
        if not v or v == '' then continue end

        if (isstring(v) or isnumber(v)) then
            --if (v[1] == '>') then
            --	table.insert(colors, {Col=Color(140, 200, 100), Pos=string.utf8len(strings)})
            --end
            strings = strings .. v
        elseif isplayer(v) then
            if (string.utf8len(strings) == 0) then
                table.remove(colors, 1)
            end

            table.insert(colors, {
                Col = team.GetColor(v:Team()),
                Pos = string.utf8len(strings) + 1
            })

            strings = strings .. v:Name()
        else
            if (string.utf8len(strings) == 0) then
                table.remove(colors, 1)
            end

            table.insert(colors, {
                Col = v:Copy(),
                Pos = string.utf8len(strings) + 1
            })
        end
    end

    local texts = string.Wrap("TargetID_" .. size:GetInt(), strings, self.msgFrame:GetWide() - 5)
    local shouldPopDown

    if (self.msgFrame:IsAtMaxOffset()) then
        shouldPopDown = true
    end

    local cursnip = 1

    for k, v in ipairs(texts) do
        if (v == '') then continue end

        if (self._Messages[500]) then
            self._Messages[1]:Remove()
            table.remove(self._Messages, 1)
        end

        local lbl = vgui.Create('ba_chatlabel', self.msgFrame:GetCanvas())
        lbl:SetFont("TargetID_" .. size:GetInt())
        table.insert(self._Messages, lbl)

        for i, l in ipairs(colors) do
            if (l.Pos <= cursnip and (not colors[i + 1] or colors[i + 1].Pos > cursnip)) then
                lbl:AddColor(1, l.Col)
            elseif (l.Pos >= cursnip and l.Pos < cursnip + string.utf8len(v)) then
                lbl:AddColor(l.Pos - cursnip + 1, l.Col)
            end
        end

        lbl:SetText(v)
        self.msgFrame:AddItem(lbl)
        cursnip = cursnip + string.utf8len(v)
    end

    chat.PlaySound()

    if (shouldPopDown) then
        self.msgFrame.yOffset = math.Clamp(self.msgFrame:GetCanvas():GetTall() - self.msgFrame:GetTall(), 0, math.huge)
    end

    self:InvalidateLayout()
end

function PANEL:CalculateAutoFill()
    local curSel = self.AutoNames[self.CurrentAutoName]
    table.Empty(self.AutoNames)
    local words = string.Explode(' ', self.txtEntry:GetValue())
    match = words[#words]

    if (not match or match == '') then
        self.CurrentAutoName = 0

        return
    end

    for k, v in player.Iterator() do
        if ((string.find(v:Name():lower(), match:lower(), 1, true) or -1) == 1) then
            if (curSel and curSel.SteamID == v:SteamID()) then
                self.CurrentAutoName = #self.AutoNames + 1
            end

            self.AutoNames[#self.AutoNames + 1] = {
                Name = v:Name(),
                SteamID = v:SteamID()
            }
        end
    end
end

function PANEL:GetAutoFill(step)
    step = step or 0
    local words = string.Explode(' ', self.txtEntry:GetValue())
    match = words[#words]
    if (not match or match == '') then return end
    self.CurrentAutoName = self.CurrentAutoName + step

    if (not self.AutoNames[self.CurrentAutoName]) then
        self.CurrentAutoName = (self.CurrentAutoName <= 0 and #self.AutoNames) or 1
    end

    local fillData = self.AutoNames[self.CurrentAutoName]

    if (fillData) then
        fillData.CompleteString = string.utf8sub(fillData.Name, string.utf8len(match) + 1)
    end

    return fillData
end

function PANEL:DoAutoFill()
    local pl = self:GetAutoFill()
    if (not pl) then return end
    local words = string.Explode(' ', self.txtEntry:GetValue())
    match = words[#words]
    if (not match or match == '') then return end
    local pref = string.utf8sub(self.txtEntry:GetValue(), 1, 1)
    local fillVal
    local firstarg = string.utf8sub(self.txtEntry:GetValue(), 1, (string.find(self.txtEntry:GetValue(), ' ') or (string.utf8len(self.txtEntry:GetValue()) + 1)) - 1)
    local firstargs = string.utf8sub(self.txtEntry:GetValue(), 2, (string.find(self.txtEntry:GetValue(), ' ') or (string.utf8len(self.txtEntry:GetValue()) + 2)) - 1)

    if (pref == '/' or pref == '!') and (firstargs == 'pm' or firstargs == 'demote') then
        fillVal = pl.SteamID
    else
        fillVal = pl.Name
    end

    self.txtEntry:SetText(string.utf8sub(self.txtEntry:GetValue(), 1, -(string.utf8len(match) + 1)) .. fillVal .. ' ')
end

function PANEL:Open(tm)
    if (CHATBOX and CHATBOX.ShouldDraw == false) then return end -- Don't open if we can't draw!
    self._Open = true
    self._OpenTime = SysTime()
    self._CloseTime = nil
    self._Team = tm
    gamemode.Call('StartChat')
    self:MakePopup()
    self:MoveToFront()
    self.txtEntry:SetVisible(true)
    self.txtEntry:RequestFocus()
    self.txtEntry.historyPos = 0
    self.msgFrame:HideScrollbar(false)
end

function PANEL:Close()
    if (not self._Open) then return end

    if (self.ForceOpen) then
        gamemode.Call('FinishChat')
        gamemode.Call('ChatTextChanged', '')
        self.txtEntry:SetText('')

        return
    end

    self._Open = false
    self._OpenTime = nil
    self._CloseTime = SysTime()
    self._SelText = ''
    self.SelectedText = ''
    self.msgFrame.yOffset = math.Clamp((self.msgFrame:GetCanvas():GetTall() - self.msgFrame:GetTall()), 0, math.huge)
    self.msgFrame:InvalidateLayout()
    self.msgFrame:HideScrollbar(true)
    gamemode.Call('FinishChat')
    self:SetMouseInputEnabled(false)
    self:SetKeyboardInputEnabled(false)
    gamemode.Call('ChatTextChanged', '')
    self.txtEntry:SetVisible(false)
    self.txtEntry:SetText('')
    self.txtEntry:OnTextChanged()
    self:MoveToBack()
end

derma.DefineControl('ba_chatbox', 'Badmin Chatbox', PANEL, 'EditablePanel')

if (CHATBOX) then
    CHATBOX:Remove()
    CHATBOX = grp.CreateChatBox()
end
--PATH addons/mod_bitminers2/lua/autorun/client/cl_bitminers2.lua:
//This file is mainly used for UI based stuff and controlling the miners.

include("bitminers2_config.lua")

local CloseMaterial = Material("materials/bitminers2/ui/close.png" , "noclamp smooth")
local TerminalBackground = Material("materials/bitminers2/ui/terminal_background.png" , "noclamp smooth")
surface.CreateFont( "BM2ConsoleFont", {
	font = "Ubuntu Mono", 
	extended = false,
	size = 19,
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

//My bad attempt and drop shadows :/
local function DrawDropShadow(x, y, sizex, sizey, strength, distance)
	for i = 1, math.ceil(distance) * 2, 2 do
		draw.RoundedBox(50, x - i, y - i, sizex + (i * 2), sizey + (i * 2), Color(10,10,10,Lerp((i/2) / distance,strength, 0)))
	end
end

local terminalIsOpen = false
//So we can access it later
local consoleDisplay = nil
//Active entity that we are in the terminal for
local activeBitminerEntity = nil
//This will contain a list of all the intructions for the terminal for this entity
local entityInstructions = {}

local backgroundColor = Color(48, 10, 36)
local textColor = Color(48, 10, 36)

local lastCommand = ""

//Thanks Lua wiki
function comma_value(amount)
  local formatted = amount
  while true do  
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
    if (k==0) then
      break
    end
  end
  return formatted
end

function BM2OpenTerminal(entity)
	activeBitminerEntity = entity

	terminalIsOpen = true

	local frame = vgui.Create("DFrame", nil)
	frame:SetTitle("")
	frame:NoClipping(true)
	frame:ShowCloseButton(false)
	frame:SetSize(800,500)
	frame:Center()
	frame.Close = function(s)
		activeBitminerEntity.terminalHistory = consoleDisplay.history
		terminalIsOpen = false
		s:Remove()
	end

	//Draw terminal frame
	frame.Paint = function(s , w , h)
		//Draw shadow
		DrawDropShadow(0,0,w ,h, 20, 40)
		draw.RoundedBoxEx(8, 0, 0, w, h, Color(70, 68, 69, 255), true, true, false, false)
		//Draw background
		draw.RoundedBox(0, 3, 30, w-6, h - 33, backgroundColor)
		surface.SetMaterial(TerminalBackground)
		surface.SetDrawColor(Color(255,255,255,30))
		surface.DrawTexturedRect(3,3,w-6,h-33)
	end

	local closeButton = vgui.Create("DButton", frame)
	closeButton:SetPos(800 - 20 - 5, 5)
	closeButton:SetSize(20,20)
	closeButton:SetText("")
	closeButton.Paint = function(s , w , h)
		surface.SetMaterial(CloseMaterial)
		surface.SetDrawColor(Color(255,255,255,255))
		surface.DrawTexturedRect(0,0,w,h)
	end
	closeButton.DoClick = function(s)
		frame:Close()
	end

	consoleDisplay = vgui.Create( "RichText", frame)
	consoleDisplay:SetPos( 3, 30)
	consoleDisplay:SetSize( 800 - 6, 500 - 30 - 3 + 10)
	function consoleDisplay:PerformLayout()
		self:SetFontInternal( "BM2ConsoleFont" )
	end
	consoleDisplay:SetVerticalScrollbarEnabled(false)

	consoleDisplay.history = ""

	consoleDisplay.history = consoleDisplay.history.."Found memory (256mb)\n"
	consoleDisplay.history = consoleDisplay.history.."Found OS\n"
	consoleDisplay.history = consoleDisplay.history.."Finished loading OS\n"
	consoleDisplay.history = consoleDisplay.history.."Starting BitOS 1.0\n"
	consoleDisplay.history = consoleDisplay.history.."---------------------------------------\n"
	consoleDisplay.history = consoleDisplay.history.."Welcome to BitOS! For help on how to operate the device please read the documents included with your hardware or type the command 'help' for a list of usefull commands!\n"
	consoleDisplay.history = consoleDisplay.history.."\n\n"

	//Load history if it exists
	if activeBitminerEntity.terminalHistory ~= nil then
		consoleDisplay.history = activeBitminerEntity.terminalHistory
	end 
	local timeSinceLastStokeAttempt = CurTime()
	local consoleInput = vgui.Create( "DTextEntry", frame )
	consoleInput:SetPos( 3, 30)
	consoleInput:SetSize(-300, - 300)
	consoleInput.OnEnter = function( self )
		consoleDisplay.history = consoleDisplay.history.."root@bitminer:~$ "..self:GetText().."\n"
		BM2HandleCommandLine(self:GetText()) //Handle command
		lastCommand = self:GetText()
		self:SetText("")
		LocalPlayer():EmitSound("bitminers2/keystroke.mp3", 75, math.random(96,102), 0.5)
	end 
	consoleInput.OnChange = function(s)
		if CurTime() - timeSinceLastStokeAttempt > 0.04 then 
			//EmitSound(string soundName,number soundLevel=75,number pitchPercent=100,number volume=1,number channel=CHAN_AUTO)
			LocalPlayer():EmitSound("bitminers2/keystroke.mp3", 75, math.random(98,102), 0.3)
		end
		timeSinceLastStokeAttempt = CurTime()
	end
	consoleInput.Think = function(s)
		s:RequestFocus()
		if input.IsKeyDown(KEY_UP) then
			s:SetText(lastCommand)
		end
	end

	consoleDisplay.Think = function(s)
		s:SetText("")
		for k ,v in pairs(string.Explode("\n", s.history.."root@bitminer:~$ "..consoleInput:GetText())) do
			s:AppendText(v.."\n")
		end
		s:GotoTextEnd()
	end

	frame:MakePopup()
end

//Takes a string from the command line and does the correct instruction for it
function BM2HandleCommandLine(command)
	local command = string.Explode(" ", string.lower(command))
	if entityInstructions[command[1]] then
		entityInstructions[command[1]].action(command[2], command[3], entityInstructions, activeBitminerEntity, consoleDisplay)
		return true
	else
		consoleDisplay.history = consoleDisplay.history.."The command you entered is not recognized as a command, type 'help' for more infomation.\n"
		return false
	end
end

local consoleColors = {
	default = Color(48, 10, 36),
	blue = Color(0,0,255),
	red = Color(255,0,0),
	green = Color(0,255,0),
	orange = Color(255,99,71),
	gray = Color(54,54,54),
	pink = Color(230,54,230)
}

//This is a list of default instructions that get merged with custom ones.
//They can of course be overriden aswell.
local BM2DefaultIntructions = {
	clear = { //Clears the screen
		command = "CLEAR",
		description = "Clears the screen.",
		action = function(arg1, arg2, instructionTable, ent, consoleDisplay)
			consoleDisplay.history = ""
		end
	},
	help = { //Prints help instructions
		command = "HELP",
		description = "Outputs a list of command available.",
		action = function(arg1, arg2, instructionTable, ent, consoleDisplay)
			consoleDisplay.history = consoleDisplay.history.."\n-------------------HELP-------------------\n"
			for k ,v in pairs(instructionTable) do
				consoleDisplay.history = consoleDisplay.history..string.upper(k).." - "..v.description.."\n"
			end
			consoleDisplay.history = consoleDisplay.history.."------------------------------------------\n\n"
		end
	},
	color = { //Changes console colors
		command = "COLOR",
		description = "Changes the background color of the terminals.",
		action = function(arg1, arg2, instructionTable, ent, consoleDisplay)
			if arg1 == nil then
				consoleDisplay.history = consoleDisplay.history.."\n-------------------COLORS-------------------\n"
				consoleDisplay.history = consoleDisplay.history.."To use color either type color 'color name' or color r,g,b\n"
				consoleDisplay.history = consoleDisplay.history.."Available colors are : \n"
				for k, v in pairs(consoleColors) do
					consoleDisplay.history = consoleDisplay.history..string.upper(k).."\n"
				end
				consoleDisplay.history = consoleDisplay.history.."\n--------------------------------------------\n"
				consoleDisplay.history = consoleDisplay.history.."\n"
			else
				if #string.Explode(",", arg1) == 3 then
					//Typed in RGB
					local data = string.Explode(",", arg1) 
					data[1] = tonumber(data[1])
					data[2] = tonumber(data[2]) 
					data[3] = tonumber(data[3])
					backgroundColor = Color(data[1], data[2], data[3], 255)
					consoleDisplay.history = consoleDisplay.history.."The color has been changed.\n"
				else
					if consoleColors[string.lower(arg1)] ~= nil then
						backgroundColor = consoleColors[string.lower(arg1)]
						consoleDisplay.history = consoleDisplay.history.."The color has been changed.\n"
					else
						consoleDisplay.history = consoleDisplay.history.."The color '"..arg1.."' is not a valid color.\n"
					end
				end
			end
		end
	}
}

//Receives a request to open a terminal for this entity, so set it up
net.Receive("BM2.OpenTerminal", function()
	local e = net.ReadEntity()
	if not terminalIsOpen then
		//Set up instructions for that entity
		local instructions = table.Copy(BM2DefaultIntructions)
		if e.customInstructions ~= nil then
			table.Merge(instructions, e.customInstructions)
		end
		entityInstructions = instructions

		BM2OpenTerminal(e)
	end
end)

net.Receive("BM2.Client.TerminalPrint", function()
	local str = net.ReadString()
	if terminalIsOpen then
		consoleDisplay.history = consoleDisplay.history..str.."\n"
	end
end)

net.Receive("BM2.CloseTerminal", function()
	if net.ReadEntity() == activeBitminerEntity then
		//BM2CloseTerminal
	end
end)
--PATH addons/svnv_ru_lib/lua/autorun/client/cl_func.lua:
kydeslib = {}

for i = 1, 150 do

    surface.CreateFont( 'kydeslib_font_' .. i, {
        font = 'Arial',
        size = i,
        weight = 550
    } )

end

local blur = Material( "pp/blurscreen" )
function kydeslib.BlurMenu( panel, layers, density, alpha )
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



function kydeslib.DrawRect( x, y, w, h, col )
    surface.SetDrawColor( col )
    surface.DrawRect( x, y, w, h )
end

function kydeslib.box( x, y, w, h, clr, out )

    surface.SetDrawColor( clr )
    surface.DrawRect( x, y, w, h )

end

function kydeslib.txt( str, size, x, y, clr, a1, a2 )

    if not a1 then a1 = 0 end
    if not a2 then a2 = 0 end

    draw.SimpleText( str, 'kydeslib_font_' .. size, x, y, clr, a1, a2 )

end

function kydeslib.scroll(parent, x, y, w, h, down, ph, items)
    local scroll = parent:Add 'DScrollPanel'
    scroll:SetSize(w, h)
    scroll:SetPos(x, y)
    scroll:GetVBar():SetWide(0)

    if items then items(scroll) end

    return scroll
end

function kydeslib.button(name, parent, x, y, w, h, doclick, btnclr, removeonclick)
    local btn = parent:Add 'KButton'
    btn:SetSize(w, h)
    btn:SetPos(x, y)

    btn.text = name

    if btnclr then
        btn.btncolor = btnclr
    end

    btn.DoClick = function()
        doclick(btn)

        if removeonclick then
            parent:Remove()
        end
    end

    return btn
end   

local alpha = 175
rainbow_colors = {
    Color( 148, 0, 190, alpha ),
    Color( 75, 0, 130, alpha ),
    Color( 0, 0, 170, alpha ),
    Color( 0, 170, 0, alpha ),
    Color( 200, 200, 0, alpha ),
    Color( 220, 127, 0, alpha ),
    Color( 190, 0, 0, alpha )
}
--PATH addons/duels/lua/autorun/client/cl_init.lua:
print("CL LOADED")

local function ScreenScale(size)
    return size * (ScrH() / 480.0)
end

fontvalid = {}

function GetFontBold(size)
    size = math.floor(math.Clamp(ScreenScale(size), 1, 128))

    if not fontvalid["nevermind.font.bold" .. size] then
        surface.CreateFont("nevermind.font.bold" .. size, {
            font = "Roboto",
            size = size,
            weight = 1000,
            antialias = true,
            extended = true
        })
        fontvalid["nevermind.font.bold" .. size] = true
    end

    return "nevermind.font.bold" .. size
end

function GetFont(size)
    size = math.floor(math.Clamp(ScreenScale(size), 1, 128))

    if not fontvalid["nevermind.font" .. size] then
        surface.CreateFont("nevermind.font" .. size, {
            font = "Roboto",
            size = size,
            weight = 600,
            antialias = true,
            extended = true
        })
        fontvalid["nevermind.font" .. size] = true
    end

    return "nevermind.font" .. size
end

local topmats = {
    {
        mat = Material("icon16/award_star_gold_1.png")
    },
    {
        mat = Material("icon16/award_star_silver_1.png")
    },
    {
	    mat = Material("icon16/award_star_bronze_1.png")
    }
}

local PANEL = {}
PANEL.colors = {}
PANEL.colors.primary = {r = 38, g = 38, b = 38, a = 255}
PANEL.colors.secondary = {r = 25, g = 25, b = 25, a = 255}
PANEL.colors.theme = {r = 0, g = 117, b = 224, a = 255}

duelsystem.top = duelsystem.top or {}

net.Receive("duel::update", function() 
    duelsystem.top = net.ReadTable()
end)

function LerpColor(ft, a, b)
    return Color(Lerp(ft, a.r, b.r), Lerp(ft, a.g, b.g), Lerp(ft, a.b, b.b), Lerp(ft, a.a, b.a))
end

function PANEL:Init()
    self:SetSize(1000, 635)
    self:MakePopup()
    self:Center()

    local title = self:Add("EditablePanel")
    title:Dock(TOP)
    title:SetTall(50)
    title:DockMargin(0, 10, 0, 0)
    title.Paint = function(s, w, h) 
        draw.SimpleText("ДУЭЛИ", GetFontBold(10), 20, 20, color_white, 0, 1)
        surface.SetDrawColor(ColorAlpha(color_white, 5))
        surface.DrawLine(10, h-5, w - 10, h - 5)
    end

    local closebutton = self:Add("DButton")
    closebutton:SetSize(64, 64)
    closebutton:SetText("")
    closebutton:SetPos(self:GetSize() - 60, 0)
    closebutton.Paint = function(s, w, h)
        draw.SimpleText("✖", GetFontBold(10), w/2, h/2, color_white, 1, 1)
    end

    closebutton.DoClick = function() self:Remove() end

    local contents = self:Add("EditablePanel")
    contents:Dock(FILL)
    contents:DockMargin(20, 20, 20, 20)

    local tops = contents:Add("EditablePanel")
    tops:Dock(LEFT)
    tops:SetWide(270)
    tops.Paint = function(s, w, h)
        draw.RoundedBox(10, 0, 0, w, h, self.colors.secondary)
        draw.SimpleText("ГЛОБАЛЬНЫЙ ТОП", GetFontBold(10), w/2, 20, color_white, 1, 1)
    end

    local spacer = contents:Add("EditablePanel")
    spacer:Dock(LEFT)
    spacer:SetWide(5)
    spacer:DockMargin(10, 0, 0, 0)
    spacer.Paint = function(s, w, h) 
    
        surface.SetDrawColor(ColorAlpha(color_white, 5))
        surface.DrawLine(w/2, 5, w/2, h - 5)
    end
    local toplist = tops:Add("EditablePanel")
    toplist:Dock(FILL)
    toplist:DockMargin(0, 40, 0, 20)
    --toplist.Paint = function(s, w, h)
    --    surface.SetDrawColor(color_white)
    --    surface.DrawRect(0, 0, w, h)
    --end

    local curpage = 1

    local function setpage(num)
        toplist:AlphaTo(0, .2, 0, function() 
            toplist:Clear()
            toplist:AlphaTo(255, .2, 0)
            local top = duelsystem.top
            curpage = num
            print(1 + (curpage > 1 and 10 * (curpage - 1)  or 0), 10 * curpage)
            for i = 1 + (curpage > 1 and 10 * (curpage - 1)  or 0), 10 * curpage do
                local pl = top[i]
                if not pl then continue end
                local card = toplist:Add("EditablePanel")
                card:Dock(TOP)
                card:SetTall(35)
                card:DockMargin(10, 5, 10, 5)
                card.Paint = function(s, w, h)
                    draw.RoundedBox(10, 0, 0, w, h, self.colors.theme)
                    draw.RoundedBox(10, 1, 1, w - 2, h - 2, self.colors.primary)
                    draw.SimpleText(pl.name, GetFontBold(10), i > 3 and 10 or 30, h/2, color_white, 0, 1)
                    draw.SimpleText(pl.wins, GetFontBold(10), w - 10, h/2, color_white, 2, 1)

                    if i < 4 then
                        surface.SetMaterial(topmats[i].mat)
                        surface.SetDrawColor(color_white)
                        surface.DrawTexturedRect(10, h/2 - 8, 16, 16)
                    end
                end
            end
        end)
    end

    local pages = tops:Add("EditablePanel")
    pages:Dock(BOTTOM)
    pages:SetTall(25)
    pages:SetWide(270)
    pages:DockMargin(2, 0, 2, 2)
    
    for i = 1, 3 do
        local but = pages:Add("DButton")
        but:Dock(LEFT)
        but:SetText("")
        but:DockMargin(2, 0, 2, 5)
        but:SetWide(85)
        but.DoClick = function()
            setpage(i)
        end
        but.Paint = function(s, w, h)
            
            local seccol = s:IsHovered() and self.colors.secondary or self.colors.primary
            draw.RoundedBox(10, 0, 0, w, h, self.colors.theme)
            draw.RoundedBox(10, 1, 1, w - 2, h - 2, LerpColor(.5, self.colors.primary, seccol))
            draw.SimpleText(i, GetFontBold(7), w/2, h/2, color_white, 1, 1)
        end
    end

    setpage(1)

    local selectedply = nil
    local selectedweapon = nil
    local israting = false
    local shield = false
    local bet = 100

    -- player list

    local players = contents:Add("EditablePanel")
    players:Dock(LEFT)
    players:SetWide(300)
    players:DockMargin(10, 0, 0, 0)
    players.Paint = function(s, w, h)
        draw.RoundedBox(10, 0, 0, w, h, self.colors.secondary)
    end

    local playerscroll = players:Add("DScrollPanel")
    playerscroll:Dock(FILL)
    
    local bar = playerscroll:GetVBar()
    bar:SetHideButtons(true)
    bar:SetWide(5)
    bar.Paint = function(s, w, h)
        draw.RoundedBox(10, 0, 0, w, h, self.colors.primary)
    end

    bar.btnGrip.Paint = function(s, w, h)
        draw.RoundedBox(10, 0, 0, w, h, self.colors.theme)
    end

    local duelstats = contents:Add("EditablePanel")
    duelstats:Dock(LEFT)
    duelstats:SetWide(350)
    duelstats:DockMargin(5, 0, 0, 0)
    duelstats.Paint = function(s, w, h) 
        draw.RoundedBox(10, 0, 0, w, h, self.colors.secondary)
    end

    local ply = LocalPlayer()
    local plydata = ply:DuelData()

    local profile = duelstats:Add("EditablePanel")
    profile:SetTall(80)
    profile:Dock(TOP)
    profile:DockMargin(10, 10, 10, 10)
    profile.Paint = function(s, w, h)
        draw.RoundedBox(10, 0, 0, w, h, ColorAlpha(self.colors.primary, 100))
        draw.SimpleText("Ваша статистика", GetFontBold(8), 10, 15, color_white, 0, 1)

        draw.SimpleText(ply:Name(), GetFontBold(10), 10, h/2, color_white, 0, 1)
        draw.SimpleText(ply:SteamID(), GetFontBold(6), 10, h/2 + 20, ColorAlpha(color_white, 100), 0, 1)

        draw.RoundedBox(10, w/2 + 40, h/2 - 25, 120, 50, Color(0, 255, 0))
        draw.RoundedBox(10, w/2 + 41, h/2 - 24, 118, 48, ColorAlpha(self.colors.primary, 255))
        draw.SimpleText(plydata.wins.." побед", GetFontBold(7), w/2 + 50, h/2 + 10, color_white, 0, 1)
        draw.SimpleText(plydata.loses.." поражений", GetFontBold(7), w/2 + 50, h/2 - 10, color_white, 0, 1)
    end

    local settings = duelstats:Add("EditablePanel")
    settings:Dock(TOP)
    settings:DockMargin(10, 0, 10, 10)
    settings:SetTall(420)
    settings.Paint = function(s, w, h)
        draw.RoundedBox(10, 0, 0, w, h, ColorAlpha(self.colors.primary, 100))
    end

    -- selectedweapon
    -- israting
    -- shield
    -- bet

    local setting_weapon = settings:Add("EditablePanel")
    setting_weapon:Dock(TOP)
    setting_weapon:SetTall(150)
    setting_weapon:DockMargin(5, 5, 5, 0)
    setting_weapon.Paint = function(s, w, h)
        draw.RoundedBox(10, 0, 0, w, h, ColorAlpha(self.colors.primary, 150))
        draw.SimpleText("Выберите оружие из списка", GetFontBold(8), w/2, 15, color_white, 1, 1)
    end

    local wepscroll = setting_weapon:Add("DScrollPanel")
    wepscroll:Dock(FILL)
    wepscroll:DockMargin(0, 30, 0, 0)

    local bar = wepscroll:GetVBar()
    bar:SetHideButtons(true)
    bar:SetWide(5)
    bar.Paint = function(s, w, h)
        draw.RoundedBox(10, 0, 0, w, h, self.colors.primary)
    end

    bar.btnGrip.Paint = function(s, w, h)
        draw.RoundedBox(10, 0, 0, w, h, self.colors.theme)
    end

    local function buildweps()
        wepscroll:Clear()
        for k, v in next, ply:GetWeapons() do
           if not selectedply:HasWeapon(v:GetClass()) then continue end
            if duelsystem.config.weaponblacklist[v:GetClass()] then continue end
            local wep = wepscroll:Add("DButton")
            wep:Dock(TOP)
            wep:SetTall(25)
            wep:DockMargin(5, 0, 2, 2)
            wep:SetText("")
            wep.Paint = function(s, w, h)
                draw.RoundedBox(5, 0, 0, w, h, IsValid(v) and selectedweapon == v:GetClass() and Color(0, 255, 0) or self.colors.theme)
                draw.RoundedBox(5, 1, 1, w - 2, h - 2, self.colors.primary)
                draw.SimpleText(IsValid(v) and v:GetPrintName() or "unknown", GetFontBold(8), w/2, h/2, color_white, 1, 1)
            end

            wep.DoClick = function()
                if IsValid(v) then
                    selectedweapon = v:GetClass()
                end
            end
        end
    end

    for k, v in next, ents.FindInSphere(LocalPlayer():GetPos(), 1000) do
        if not IsValid(v) or not v:IsPlayer() then continue end
        if v == LocalPlayer() then continue end
        local pl = playerscroll:Add("DButton")
        pl:Dock(TOP)
        pl:SetTall(50)
        pl:SetText("")
        pl:DockMargin(10, 5, 10, 5)
        pl.Paint = function(s, w, h)
            if not IsValid(v) then s:Remove() end
            local seccol = (s:IsHovered() and self.colors.secondary or self.colors.primary)
            local selcol = v == selectedply and Color(0, 255, 0) or self.colors.theme
            draw.RoundedBox(10, 0, 0, w, h, LerpColor(.8, self.colors.theme, selcol))
            draw.RoundedBox(10, 1, 1, w - 2, h - 2, LerpColor(.5, self.colors.primary, seccol))
            draw.SimpleText(IsValid(v) and v:Name() or "unknown", GetFontBold(7), 10, h/2 - 5, color_white, 0, 1)
            draw.SimpleText(v:SteamID(), GetFontBold(7), 10, h/2 + 10, Color(200, 200, 200), 0, 1)
        end

        pl.DoClick = function() 
            selectedply = v
            buildweps()
        end
    end

    local setting_ranked = settings:Add("EditablePanel")
    setting_ranked:Dock(TOP)
    setting_ranked:SetTall(60)
    setting_ranked:DockMargin(5, 5, 5, 0)
    setting_ranked.Paint = function(s, w, h)
        draw.RoundedBox(10, 0, 0, w, h, ColorAlpha(self.colors.primary, 150))
        draw.SimpleText("Выберите режим", GetFontBold(8), w/2, 15, color_white, 1, 1)
    end

    local setting_ranked_rating = setting_ranked:Add("DButton")
    setting_ranked_rating:Dock(LEFT)
    setting_ranked_rating:SetWide(150)
    setting_ranked_rating:DockMargin(10, 30, 2, 2)
    setting_ranked_rating:SetText("")
    setting_ranked_rating.Paint = function(s, w, h)
        local seccol = (s:IsHovered() and self.colors.secondary or self.colors.primary)
        draw.RoundedBox(10, 0, 0, w, h, israting and Color(0 ,255, 0) or self.colors.theme)
        draw.RoundedBox(10, 1, 1, w - 2, h - 2, LerpColor(.5, self.colors.primary, seccol))
        draw.SimpleText("Рейтинговый", GetFontBold(8), w/2, h/2, color_white, 1, 1)
    end

    setting_ranked_rating.DoClick = function() 
        israting = true
    end

    local setting_ranked_unrating = setting_ranked:Add("DButton")
    setting_ranked_unrating:Dock(LEFT)
    setting_ranked_unrating:SetWide(150)
    setting_ranked_unrating:DockMargin(2, 30, 2, 2)
    setting_ranked_unrating:SetText("")
    setting_ranked_unrating.Paint = function(s, w, h)
        local seccol = (s:IsHovered() and self.colors.secondary or self.colors.primary)
        draw.RoundedBox(10, 0, 0, w, h, not israting and Color(0 ,255, 0) or self.colors.theme)
        draw.RoundedBox(10, 1, 1, w - 2, h - 2, LerpColor(.5, self.colors.primary, seccol))
        draw.SimpleText("Обычный", GetFontBold(8), w/2, h/2, color_white, 1, 1)
    end

    setting_ranked_unrating.DoClick = function() 
        israting = false
    end

    local setting_shields = settings:Add("EditablePanel")
    setting_shields:Dock(TOP)
    setting_shields:SetTall(60)
    setting_shields:DockMargin(5, 15, 5, 0)
    setting_shields.Paint = function(s, w, h)
        draw.RoundedBox(10, 0, 0, w, h, ColorAlpha(self.colors.primary, 150))
        draw.SimpleText("Дополнительные настройки", GetFontBold(8), w/2, 15, color_white, 1, 1)
    end

    local setting_shields_enable = setting_shields:Add("DButton")
    setting_shields_enable:Dock(LEFT)
    setting_shields_enable:SetWide(310)
    setting_shields_enable:DockMargin(5, 32, 2, 2)
    setting_shields_enable:SetText("")
    setting_shields_enable.Paint = function(s, w, h)
        local seccol = (s:IsHovered() and self.colors.secondary or self.colors.primary)
        draw.RoundedBox(10, 0, 0, w, h, shield and Color(0 ,255, 0) or self.colors.theme)
        draw.RoundedBox(10, 1, 1, w - 2, h - 2, LerpColor(.5, self.colors.primary, seccol))
        draw.SimpleText("Включить щиты", GetFontBold(8), w/2, h/2, color_white, 1, 1)
    end

    setting_shields_enable.DoClick = function() 
        shield = not shield
    end

    local setting_bet = settings:Add("EditablePanel")
    setting_bet:Dock(TOP)
    setting_bet:SetTall(60)
    setting_bet:DockMargin(5, 15, 5, 0)
    setting_bet.Paint = function(s, w, h)
        draw.RoundedBox(10, 0, 0, w, h, ColorAlpha(self.colors.primary, 150))
        draw.SimpleText("Сумма ставки $", GetFontBold(8), w/2, 15, color_white, 1, 1)
    end

    local setting_bet_slider = setting_bet:Add("DNumSlider")
    setting_bet_slider:SetPos( -30, 20 ) 
    setting_bet_slider:SetSize( 300, 50 ) 
    setting_bet_slider:SetText( "" )
    setting_bet_slider:SetMin(duelsystem.config.bet.min)
    setting_bet_slider:SetMax(duelsystem.config.bet.max)
    setting_bet_slider:SetDecimals( 0 )
    setting_bet_slider:SetValue(100)
    setting_bet_slider.OnValueChanged = function( self, value )
        bet = value
    end


    local inviteduel = settings:Add("DButton")
    inviteduel:Dock(BOTTOM)
    inviteduel:SetTall(40)
    inviteduel:DockMargin(5, 0, 2, 2)
    inviteduel:SetText("")
    inviteduel.Paint = function(s, w, h)
        local seccol = (s:IsHovered() and self.colors.secondary or self.colors.primary)
        draw.RoundedBox(5, 0, 0, w, h, self.colors.theme)
        draw.RoundedBox(5, 1, 1, w - 2, h - 2, LerpColor(.5, self.colors.primary, seccol))
        draw.SimpleText("Отправить приглашение", GetFontBold(8), w/2, h/2, color_white, 1, 1)
    end

    inviteduel.DoClick = function() 
        if not selectedply then return end
        if not selectedweapon then return end
        local data = {}
        data.israting = israting
        data.weapon = selectedweapon
        data.shield = shield
        data.bet = bet

        net.Start("duels::net::invite")
            net.WriteEntity(selectedply)
            net.WriteTable(data)
        net.SendToServer()

    end
end

function PANEL:Paint(w, h)
    draw.RoundedBox(10, 0, 0, w, h, self.colors.theme)
    draw.RoundedBox(10, 1, 1, w - 2, h - 2, self.colors.primary)

end

vgui.Register("grp_duels", PANEL, "EditablePanel")

hook.Add("HUDPaint", "paintdueltimer", function()
    local ply = LocalPlayer()
    if ply.duelstartime and (tonumber(ply.duelstartime) - os.time()) > 0 then
        draw.SimpleText("До начала дуэли: "..math.Truncate(tonumber(ply.duelstartime) - os.time()).." секунд", GetFontBold(10), ScrW()/2, ScrH() - 50, color_white, 1, 1)
    end

    if ply:GetInDuel() then
        draw.SimpleText("Вы находитесь в дуэли", GetFontBold(10), ScrW()/2, ScrH() - 70, color_white, 1, 1)
    end
end)
--PATH addons/_bansys/lua/autorun/client/cl_unban.lua:
	surface.CreateFont( "DisplayJailTimer", {
		font = "Trebuchet24",
		size = (ScrH() + ScrW()) * .011,
		weight = 300, 
		blursize = 0, 
		scanlines = 0, 
		antialias = false, 
		underline = false, 
		italic = false, 
		strikeout = false, 
		symbol = false, 
		rotary = false, 
		shadow = true, 
		additive = false, 
		outline = false,
	} )
	
local keys = {
     IN_FORWARD,
     IN_BACK,
     IN_LEFT,
     IN_RIGHT,
     IN_DUCK,
     IN_JUMP
	}
	hook.Add("KeyRelease","NeuroBanSvyanovMove",function(_,key)
		if table.HasValue(keys,key) then
			net.Start('NeuroBanReason')
			net.WriteBool(false)
			net.SendToServer()
			hook.Remove("KeyRelease","NeuroBanSvyanovMove")
		end
	end)
local function UnbanBuyMenu(price,balancee)
	local bg = vgui.Create( 'svyanovlib_DFrame' )
	bg:SetSize( ScrW()/2, ScrH()/1.3 )
	bg:centerFrame()
	bg:addClose()
	w=bg:GetTall()

	local zal = vgui.Create( 'svyanovlib_DPanel',bg )
	zal:SetSize( bg:GetTall()/3, 50 )		
	zal:SetPos(bg:GetTall()/2,0)

	zal.title          = 'Разбан'
	zal.titleSize      = 40
	zal.titleX         = bg:GetTall()/4
	zal:CenterHorizontal()
	--bg:SetIcon( "icon16/coins.png" )
	local balance = bg:Add( 'svyanovlib_DButton',bg )
	balance:SetPos( 1,1 )
	balance:SetSize(zal:GetPos(),50)
	balance.text                  = 'Пополнить баланс'
	balance.textSize              = math.modf(bg:GetWide()/8/8)
	balance.btnColor = Color(10,150,10,170)
	function balance.DoClick()
		RunConsoleCommand("donate")
	end
	local GalaxyBackground = vgui.Create( 'svyanovlib_DPanel',bg )
	local Avatar = vgui.Create( "AvatarImage", GalaxyBackground )
	GalaxyBackground:SetSize( w,zal:GetWide()+1 )
	GalaxyBackground:SetPos(1,zal:GetWide())
	GalaxyBackground.Paint = function(self,w,h)
      svyanovlib.drawOutlinedBox( 0, 0, w, h )
      svyanovlib.txt( LocalPlayer():Nick(), math.modf(zal.titleSize/1.3), bg:GetTall() / 2, Avatar:GetTall() * 1.4, nil, 1 )
      svyanovlib.txt( 'Стоимость разбана '..price..' рублей ( Баланс : '..tostring(balancee).. ' рублей )', math.modf(zal.titleSize/2), w*.5, 5, Color(255,255,255), TEXT_ALIGN_CENTER )
      svyanovlib.drawOutlinedBox( 0, 0, w, h )
	end
	GalaxyBackground:CenterVertical()
	GalaxyBackground:CenterHorizontal()
	Avatar:SetSize( GalaxyBackground:GetTall()/1.7,GalaxyBackground:GetTall()/1.7 )
	Avatar:SetPos( GalaxyBackground:GetWide()/2,GalaxyBackground:GetTall()/2 )
	Avatar:SetPlayer( LocalPlayer(), 64 )
	Avatar:Center()

	local buye = bg:Add( 'svyanovlib_DButton',bg )
	buye:SetPos( 1,bg:GetTall() - 100 )
	buye:SetSize(balance:GetSize())
	buye.text                  = 'Купить разбан'
	buye.textSize              = math.modf(bg:GetWide()/8/8)
	buye.btnColor = Color(10,150,10,170)
	function buye.DoClick()
		net.Start('NeuroBan Unban')
			net.WriteUInt(price,32)
		net.SendToServer()
	end
	buye:CenterHorizontal()
end
LocalPlayer().GameBanned = LocalPlayer().GameBanned or true
surface.CreateFont( 'svyanovlib_font_unban', {
            font = 'Arial Bold',
            size = math.modf(ScrW()/11),
            weight = 500
} )
local function ButtonMake()
unban = vgui.Create( 'svyanovlib_DButton' )
local reason = net.ReadString()
local unban_time = net.ReadUInt(32)
local balance = net.ReadUInt(32)
local del_var = 1
--local a_name = (neuro.IsPlayer(admin) and admin:Name() or 'Console')
--local textsize = math.modf(textsizeX/11)

hook.Add("HUDPaint","neurobannedhud",function()
	if !LocalPlayer().GameBanned then
    	local x,y = draw.SimpleText('Вы забанены! Причина: '.. reason ..'',"DisplayJailTimer",ScrW()/2,ScrH()/11 + 1,Color(255,255,255),1,0)
    	draw.SimpleText('Осталось: '..((unban_time == 300 and "бесконечно" ) or unban_time) .. ' мин.',"DisplayJailTimer",ScrW()/2,ScrH()/9 + 3,Color(255,255,255),1,0)
		    draw.SimpleText("Находясь на сервере срок бана проходит в два раза быстрее!", "DisplayJailTimer", ScrW() / 2, ScrH() / 8 + 60, Color(0, 255, 0), TEXT_ALIGN_CENTER)
	end
end)

if unban_time < 10 then unbanprice = 15 else unbanprice = unban_time end
if unban_time > 300 then unbanprice = 300 end
	unban:SetVisible(true)
	unban:SetPos( ScrW()*.5,0 )
	unban:SetSize(ScrW()/4,ScrH()/11)
	unban.text                  = 'Купить разбан '..unbanprice ..' руб.'
	--unban.textSize              = 50
	unban.btnColor = Color(200,0,0,255)
	unban:CenterHorizontal()
	unban.Paint = function(self,w,h)
	if !LocalPlayer().GameBanned then
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
     end
function unban.DoClick()
	if !LocalPlayer().GameBanned then
		RunConsoleCommand("autodonate_check")
		RunConsoleCommand("shop_credits_checkid")
		UnbanBuyMenu(unbanprice,balance)
	end
end

end
net.Receive("NeuroBanReason2",function()
	ButtonMake()
	LocalPlayer().GameBanned = false
	timer.Create('NeuRoBanChecK',60,0,function()
		net.Start('NeuroBanReason')
		net.WriteBool(true)
		net.SendToServer()
	end)
end)
net.Receive("NeuroBan Buyed",function()
	timer.Remove('NeuRoBanChecK')
	LocalPlayer().GameBanned = true
	hook.Remove("HUDPaint","neurobannedhud")
	if IsValid(unban) then
		unban:Remove()
	end
end)

--PATH gamemodes/darkrp/gamemode/cl_init.lua:
hook.Run("DarkRPStartedLoading")

GM.Version = "2.7.0"
GM.Name = "DarkRP"
GM.Author = "TravkaCode"

DeriveGamemode("sandbox")
DEFINE_BASECLASS("gamemode_sandbox")
GM.Sandbox = BaseClass


local function LoadModules()
    local root = GM.FolderName .. "/gamemode/modules/"
    local _, folders = file.Find(root .. "*", "LUA")

    for _, folder in SortedPairs(folders, true) do
        if DarkRP.disabledDefaults["modules"][folder] then continue end

        for _, File in SortedPairs(file.Find(root .. folder .. "/sh_*.lua", "LUA"), true) do
            if File == "sh_interface.lua" then continue end
            include(root .. folder .. "/" .. File)
        end

        for _, File in SortedPairs(file.Find(root .. folder .. "/cl_*.lua", "LUA"), true) do
            if File == "cl_interface.lua" then continue end
            include(root .. folder .. "/" .. File)
        end
    end
end

GM.Config = {} -- config table
GM.NoLicense = GM.NoLicense or {}

include("config/config.lua")
include("libraries/sh_cami.lua")
include("libraries/simplerr.lua")
include("libraries/fn.lua")
include("libraries/tablecheck.lua")
include("libraries/interfaceloader.lua")
include("libraries/disjointset.lua")

include("libraries/modificationloader.lua")

hook.Call("DarkRPPreLoadModules", GM)

LoadModules()

DarkRP.DARKRP_LOADING = true
include("config/jobrelated.lua")
include("config/addentities.lua")
include("config/ammotypes.lua")
DarkRP.DARKRP_LOADING = nil

DarkRP.finish()

hook.Call("DarkRPFinishedLoading", GM)

--PATH gamemodes/darkrp/gamemode/modules/money/sh_interface.lua:
DarkRP.PLAYER.canAfford = DarkRP.stub{
    name = "canAfford",
    description = "Whether the player can afford the given amount of money",
    parameters = {
        {
            name = "amount",
            description = "The amount of money",
            type = "number",
            optional = false
        }
    },
    returns = {
        {
            name = "answer",
            description = "Whether the player can afford it",
            type = "boolean"
        }
    },
    metatable = DarkRP.PLAYER
}

DarkRP.ENTITY.isMoneyBag = DarkRP.stub{
    name = "isMoneyBag",
    description = "Whether this entity is a money bag",
    parameters = {

    },
    returns = {
        {
            name = "answer",
            description = "Whether this entity is a money bag.",
            type = "boolean"
        }
    },
    metatable = DarkRP.ENTITY
}

--PATH gamemodes/darkrp/gamemode/modules/doorsystem/cl_interface.lua:
DarkRP.readNetDoorVar = DarkRP.stub{
    name = "readNetDoorVar",
    description = "Internal function. You probably shouldn't need this. DarkRP calls this function when reading DoorVar net messages. This function reads the net data for a specific DoorVar.",
    parameters = {
    },
    returns = {
        {
            name = "name",
            description = "The name of the DoorVar.",
            type = "string"
        },
        {
            name = "value",
            description = "The value of the DoorVar.",
            type = "any"
        }
    },
    metatable = DarkRP
}

DarkRP.ENTITY.drawOwnableInfo = DarkRP.stub{
    name = "drawOwnableInfo",
    description = "Draw the ownability information on a door or vehicle.",
    parameters = {
    },
    returns = {
    },
    metatable = DarkRP.ENTITY
}

DarkRP.hookStub{
    name = "HUDDrawDoorData",
    description = "Called when DarkRP is about to draw the door ownability information of a door or vehicle. Override this hook to ",
    parameters = {
        {
            name = "ent",
            description = "The door or vehicle of which the ownability information is about to be drawn.",
            type = "Entity"
        }
    },
    returns = {
        {
            name = "override",
            description = "Return true in your hook to disable the default drawing and use your own.",
            type = "boolean"
        }
    }
}

--PATH gamemodes/darkrp/gamemode/modules/language/sh_english.lua:
--[[-----------------------------------------------------------------------
English (example) language file
---------------------------------------------------------------------------

This is the english language file. The things on the left side of the equals sign are the things you should leave alone
The parts between the quotes are the parts you should translate. You can also copy this file and create a new language.

= Warning =
Sometimes when DarkRP is updated, new phrases are added.
If you don't translate these phrases to your language, it will use the English sentence.
To fix this, join your server, open your console and enter darkp_getphrases yourlanguage
For English the command would be:
    darkrp_getphrases "en"
because "en" is the language code for English.

You can copy the missing phrases to this file and translate them.

= Note =
Make sure the language code is right at the bottom of this file

= Using a language =
Make sure the convar gmod_language is set to your language code. You can do that in a server CFG file.
---------------------------------------------------------------------------]]

local my_language = {
    -- Admin things
    need_admin = "You need admin privileges in order to be able to %s",
    need_sadmin = "You need super admin privileges in order to be able to %s",
    no_privilege = "You don't have the right privileges to perform this action",
    no_jail_pos = "No jail position",
    invalid_x = "Invalid %s! %s",

    -- F1 menu
    f1ChatCommandTitle = "Chat commands",
    f1Search = "Search...",

    -- Money things:
    price = "Price: %s%d",
    priceTag = "Price: %s",
    reset_money = "%s has reset all players' money!",
    has_given = "%s has given you %s",
    you_gave = "You gave %s %s",
    npc_killpay = "%s for killing an NPC!",
    profit = "profit",
    loss = "loss",
    Donate = "Donate",
    you_donated = "You have donated %s to %s!",
    has_donated = "%s has donated %s!",

    -- backwards compatibility
    deducted_x = "Deducted %s%d",
    need_x = "Need %s%d",

    deducted_money = "Deducted %s",
    need_money = "Need %s",

    payday_message = "Payday! You received %s!",
    payday_unemployed = "You received no salary because you are unemployed!",
    payday_missed = "Pay day missed! (You're Arrested)",

    property_tax = "Property tax! %s",
    property_tax_cant_afford = "You couldn't pay the taxes! Your property has been taken away from you!",
    taxday = "Tax Day! %s%% of your income was taken!",

    found_cheque = "You have found %s%s in a cheque made out to you from %s.",
    cheque_details = "This cheque is made out to %s.",
    cheque_torn = "You have torn up the cheque.",
    cheque_pay = "Pay: %s",
    signed = "Signed: %s",

    found_cash = "You have picked up %s%d!", -- backwards compatibility
    found_money = "You have picked up %s!",

    owner_poor = "The %s owner is too poor to subsidize this sale!",

    -- Police
    Wanted_text = "Wanted!",
    wanted = "Wanted by Police!\nReason: %s",
    youre_arrested = "You have been arrested. Time left: %d seconds!",
    youre_arrested_by = "You have been arrested by %s.",
    youre_unarrested_by = "You were unarrested by %s.",
    hes_arrested = "%s has been arrested for %d seconds!",
    hes_unarrested = "%s has been released from jail!",
    warrant_ordered = "%s ordered a search warrant for %s. Reason: %s",
    warrant_request = "%s requests a search warrant for %s\nReason: %s",
    warrant_request2 = "Search warrant request sent to Mayor %s!",
    warrant_approved = "Search warrant approved for %s!\nReason: %s\nOrdered by: %s",
    warrant_approved2 = "You are now able to search his house.",
    warrant_denied = "Mayor %s has denied your search warrant request.",
    warrant_expired = "The search warrant for %s has expired!",
    warrant_required = "You need a warrant in order to be able to open this door.",
    warrant_required_unfreeze = "You need a warrant in order to be able to unfreeze this prop.",
    warrant_required_unweld = "You need a warrant in order to be able to unweld this prop.",
    wanted_by_police = "%s is wanted by the police!\nReason: %s\nOrdered by: %s",
    wanted_by_police_print = "%s has made %s wanted, reason: %s",
    wanted_expired = "%s is no longer wanted by the Police.",
    wanted_revoked = "%s is no longer wanted by the Police.\nRevoked by: %s",
    cant_arrest_other_cp = "You cannot arrest other CPs!",
    must_be_wanted_for_arrest = "The player must be wanted in order to be able to arrest them.",
    cant_arrest_fadmin_jailed = "You cannot arrest a player who has been jailed by an admin.",
    cant_arrest_no_jail_pos = "You cannot arrest people since there are no jail positions set!",
    cant_arrest_spawning_players = "You cannot arrest players who are spawning.",

    suspect_doesnt_exist = "Suspect does not exist.",
    actor_doesnt_exist = "Actor does not exist.",
    get_a_warrant = "get a warrant",
    remove_a_warrant = "remove a warrant",
    make_someone_wanted = "make someone wanted",
    remove_wanted_status = "remove wanted status",
    already_a_warrant = "There already is a search warrant for this suspect.",
    not_warranted = "There is no search warrant for this person.",
    already_wanted = "The suspect is already wanted.",
    not_wanted = "The suspect is not wanted.",
    need_to_be_cp = "You have to be a member of the police force.",
    suspect_must_be_alive_to_do_x = "The suspect must be alive in order to %s.",
    suspect_already_arrested = "The suspect is already in jail.",

    -- Players
    health = "Health: %s",
    job = "Job: %s",
    salary = "Salary: %s%s",
    wallet = "Wallet: %s%s",
    weapon = "Weapon: %s",
    kills = "Kills: %s",
    deaths = "Deaths: %s",
    rpname_changed = "%s changed their RPName to: %s",
    disconnected_player = "Disconnected player",

    -- Teams
    need_to_be_before = "You need to be %s first in order to be able to become %s",
    need_to_make_vote = "You need to make a vote to become a %s!",
    team_limit_reached = "Can not become %s as the limit is reached",
    wants_to_be = "%s\nwants to be\n%s",
    has_not_been_made_team = "%s has not been made %s!",
    job_has_become = "%s has been made a %s!",

    -- Disasters
    meteor_approaching = "WARNING: Meteor storm approaching!",
    meteor_passing = "Meteor storm passing.",
    meteor_enabled = "Meteor Storms are now enabled.",
    meteor_disabled = "Meteor Storms are now disabled.",
    earthquake_report = "Earthquake reported of magnitude %sMw",
    earthtremor_report = "Earth tremor reported of magnitude %sMw",

    -- Keys, vehicles and doors
    keys_allowed_to_coown = "You are allowed to co-own this\n(Press Reload with keys or press F2 to co-own)\n",
    keys_other_allowed = "Allowed to co-own:",
    keys_allow_ownership = "(Press Reload with keys or press F2 to allow ownership)",
    keys_disallow_ownership = "(Press Reload with keys or press F2 to disallow ownership)",
    keys_owned_by = "Owned by:",
    keys_unowned = "Unowned\n(Press Reload with keys or press F2 to own)",
    keys_everyone = "(Press Reload with keys or press F2 to enable for everyone)",
    door_unown_arrested = "You can not own or unown things while arrested!",
    door_unownable = "This door cannot be owned or unowned!",
    door_sold = "You have sold this for %s",
    door_already_owned = "This door is already owned by someone!",
    door_cannot_afford = "You can not afford this door!",
    door_hobo_unable = "You can not buy a door if you are a hobo!",
    vehicle_cannot_afford = "You can not afford this vehicle!",
    door_bought = "You've bought this door for %s%s",
    vehicle_bought = "You've bought this vehicle for %s%s",
    door_need_to_own = "You need to own this door in order to be able to %s",
    door_rem_owners_unownable = "You can not remove owners if a door is non-ownable!",
    door_add_owners_unownable = "You can not add owners if a door is non-ownable!",
    rp_addowner_already_owns_door = "%s already owns (or is already allowed to own) this door!",
    add_owner = "Add owner",
    remove_owner = "Remove owner",
    coown_x = "Co-own %s",
    allow_ownership = "Allow ownership",
    disallow_ownership = "Disallow ownership",
    edit_door_group = "Edit door group",
    door_groups = "Door groups",
    door_group_doesnt_exist = "Door group does not exist!",
    door_group_set = "Door group set successfully.",
    sold_x_doors_for_y = "You have sold %d doors for %s%d!", -- backwards compatibility
    sold_x_doors = "You have sold %d doors for %s!",

    -- Entities
    drugs = "drugs",
    Drugs = "Drugs",
    drug_lab = "Drug Lab",
    gun_lab = "Gun Lab",
    any_lab = "any lab",
    gun = "gun",
    microwave = "Microwave",
    food = "food",
    Food = "Food",
    money_printer = "Money Printer",
    tip_jar = "Tip Jar",

    sign_this_letter = "Sign this letter",
    signed_yours = "Yours,",

    money_printer_exploded = "Your money printer has exploded!",
    money_printer_overheating = "Your money printer is overheating!",

    contents = "Contents: ",
    amount = "Amount: ",

    picking_lock = "Picking lock",

    cannot_pocket_x = "You cannot put this in your pocket!",
    object_too_heavy = "This object is too heavy.",
    pocket_full = "Your pocket is full!",
    pocket_no_items = "Your pocket contains no items.",
    drop_item = "Drop item",

    bonus_destroying_entity = "destroying this illegal entity.",

    switched_burst = "Switched to burst-fire mode.",
    switched_fully_auto = "Switched to fully automatic fire mode.",
    switched_semi_auto = "Switched to semi-automatic fire mode.",

    keypad_checker_shoot_keypad = "Shoot a keypad to see what it controls.",
    keypad_checker_shoot_entity = "Shoot an entity to see which keypads are connected to it",
    keypad_checker_click_to_clear = "Right click to clear.",
    keypad_checker_entering_right_pass = "Entering the right password",
    keypad_checker_entering_wrong_pass = "Entering the wrong password",
    keypad_checker_after_right_pass = "after having entered the right password",
    keypad_checker_after_wrong_pass = "after having entered the wrong password",
    keypad_checker_right_pass_entered = "Right password entered",
    keypad_checker_wrong_pass_entered = "Wrong password entered",
    keypad_checker_controls_x_entities = "This keypad controls %d entities",
    keypad_checker_controlled_by_x_keypads = "This entity is controlled by %d keypads",
    keypad_on = "ON",
    keypad_off = "OFF",
    seconds = "seconds",

    persons_weapons = "%s's illegal weapons:",
    returned_persons_weapons = "Returned %s's confiscated weapons.",
    no_weapons_confiscated = "%s had no weapons confiscated!",
    no_illegal_weapons = "%s had no illegal weapons.",
    confiscated_these_weapons = "Confiscated these weapons:",
    checking_weapons = "Confiscating weapons",

    shipment_antispam_wait = "Please wait before spawning another shipment.",
    createshipment = "Create a shipment",
    splitshipment = "Split this shipment",
    shipment_cannot_split = "Cannot split this shipment.",

    -- Talking
    hear_noone = "No-one can hear you %s!",
    hear_everyone = "Everyone can hear you!",
    hear_certain_persons = "Players who can hear you %s: ",

    whisper = "whisper",
    yell = "yell",
    broadcast = "[Broadcast!]",
    radio = "radio",
    request = "(REQUEST!)",
    group = "(group)",
    demote = "(DEMOTE)",
    ooc = "OOC",
    radio_x = "Radio %d",

    talk = "talk",
    speak = "speak",

    speak_in_ooc = "speak in OOC",
    perform_your_action = "perform your action",
    talk_to_your_group = "talk to your group",

    channel_set_to_x = "Channel set to %s!",

    -- Notifies
    disabled = "%s has been disabled! %s",
    gm_spawnvehicle = "The spawning of vehicles",
    gm_spawnsent = "The spawning of scripted entities (SENTs)",
    gm_spawnnpc = "The spawning of Non-Player Characters (NPCs)",
    see_settings = "Please see the DarkRP settings.",
    limit = "You have reached the %s limit!",
    have_to_wait = "You need to wait another %d seconds before using %s!",
    must_be_looking_at = "You need to be looking at a %s!",
    incorrect_job = "You do not have the right job to %s",
    unavailable = "This %s is unavailable",
    unable = "You are unable to %s. %s",
    cant_afford = "You cannot afford this %s",
    created_x = "%s created a %s",
    cleaned_up = "Your %s were cleaned up.",
    you_bought_x = "You have bought %s for %s%d.", -- backwards compatibility
    you_bought = "You have bought %s for %s.",
    you_got_yourself = "You got yourself a %s.",
    you_received_x = "You have received %s for %s.",

    created_first_jailpos = "You have created the first jail position!",
    added_jailpos = "You have added one extra jail position!",
    reset_add_jailpos = "You have removed all jail positions and you have added a new one here.",
    created_spawnpos = "You have added a spawn position for %s.",
    updated_spawnpos = "You have removed all spawn positions for %s and added a new one here.",
    remove_spawnpos = "You have removed all spawn positions for %s.",
    do_not_own_ent = "You do not own this entity!",
    cannot_drop_weapon = "Can't drop this weapon!",
    job_switch = "Jobs switched successfully!",
    job_switch_question = "Switch jobs with %s?",
    job_switch_requested = "Job switch requested.",

    cooks_only = "Cooks only.",

    -- Misc
    unknown = "Unknown",
    arguments = "arguments",
    no_one = "no one",
    door = "door",
    vehicle = "vehicle",
    door_or_vehicle = "door/vehicle",
    driver = "Driver: %s",
    name = "Name: %s",
    locked = "Locked.",
    unlocked = "Unlocked.",
    player_doesnt_exist = "Player does not exist.",
    job_doesnt_exist = "Job does not exist!",
    must_be_alive_to_do_x = "You must be alive in order to %s.",
    banned_or_demoted = "Banned/demoted",
    wait_with_that = "Wait with that.",
    could_not_find = "Could not find %s",
    f3tovote = "Hit F3 to vote",
    listen_up = "Listen up:", -- In rp_tell or rp_tellall
    nlr = "New Life Rule: Do Not Revenge Arrest/Kill.",
    reset_settings = "You have reset all settings!",
    must_be_x = "You must be a %s in order to be able to %s.",
    agenda_updated = "The agenda has been updated",
    job_set = "%s has set his/her job to '%s'",
    demoted = "%s has been demoted",
    demoted_not = "%s has not been demoted",
    demote_vote_started = "%s has started a vote for the demotion of %s",
    demote_vote_text = "Demotion nominee:\n%s", -- '%s' is the reason here
    cant_demote_self = "You cannot demote yourself.",
    i_want_to_demote_you = "I want to demote you. Reason: %s",
    tried_to_avoid_demotion = "You tried to escape demotion. You failed and have been demoted.", -- naughty boy!
    lockdown_started = "The mayor has initiated a Lockdown, please return to your homes!",
    lockdown_ended = "The lockdown has ended",
    gunlicense_requested = "%s has requested %s a gun license",
    gunlicense_granted = "%s has granted %s a gun license",
    gunlicense_denied = "%s has denied %s a gun license",
    gunlicense_question_text = "Grant %s a gun license?",
    gunlicense_remove_vote_text = "%s has started a vote for the gun license removal of %s",
    gunlicense_remove_vote_text2 = "Revoke gunlicense:\n%s", -- Where %s is the reason
    gunlicense_removed = "%s's license has been removed!",
    gunlicense_not_removed = "%s's license has not been removed!",
    vote_specify_reason = "You need to specify a reason!",
    vote_started = "The vote has been created",
    vote_alone = "You have won the vote since you are alone in the server.",
    you_cannot_vote = "You cannot vote!",
    x_cancelled_vote = "%s cancelled the last vote.",
    cant_cancel_vote = "Could not cancel the last vote as there was no last vote to cancel!",
    jail_punishment = "Punishment for disconnecting! Jailed for: %d seconds.",
    admin_only = "Admin only!", -- When doing /addjailpos
    chief_or = "Chief or ",-- When doing /addjailpos
    frozen = "Frozen.",

    dead_in_jail = "You now are dead until your jail time is up!",
    died_in_jail = "%s has died in jail!",

    credits_for = "CREDITS FOR %s\n",
    credits_see_console = "DarkRP credits printed to console.",

    rp_getvehicles = "Available vehicles for custom vehicles:",

    data_not_loaded_one = "Your data has not been loaded yet. Please wait.",
    data_not_loaded_two = "If this persists, try rejoining or contacting an admin.",

    cant_spawn_weapons = "You cannot spawn weapons.",
    drive_disabled = "Drive disabled for now.",
    property_disabled = "Property disabled for now.",

    not_allowed_to_purchase = "You are not allowed to purchase this item.",

    rp_teamban_hint = "rp_teamban [player name/ID] [team name/id]. Use this to ban a player from a certain team.",
    rp_teamunban_hint = "rp_teamunban [player name/ID] [team name/id]. Use this to unban a player from a certain team.",
    x_teambanned_y = "%s has banned %s from being a %s.",
    x_teamunbanned_y = "%s has unbanned %s from being a %s.",

    -- Backwards compatibility:
    you_set_x_salary_to_y = "You set %s's salary to %s%d.",
    x_set_your_salary_to_y = "%s set your salary to %s%d.",
    you_set_x_money_to_y = "You set %s's money to %s%d.",
    x_set_your_money_to_y = "%s set your money to %s%d.",

    you_set_x_salary = "You set %s's salary to %s.",
    x_set_your_salary = "%s set your salary to %s.",
    you_set_x_money = "You set %s's money to %s.",
    x_set_your_money = "%s set your money to %s.",
    you_set_x_name = "You set %s's name to %s",
    x_set_your_name = "%s set your name to %s",

    someone_stole_steam_name = "Someone is already using your Steam name as their RP name so we gave you a '1' after your name.", -- Uh oh
    already_taken = "Already taken.",

    job_doesnt_require_vote_currently = "This job does not require a vote at the moment!",

    x_made_you_a_y = "%s has made you a %s!",

    cmd_cant_be_run_server_console = "This command cannot be run from the server console.",

    -- The lottery
    lottery_started = "There is a lottery! Participate for %s%d?", -- backwards compatibility
    lottery_has_started = "There is a lottery! Participate for %s?",
    lottery_entered = "You entered the lottery for %s",
    lottery_not_entered = "%s did not enter the lottery",
    lottery_noone_entered = "No-one has entered the lottery",
    lottery_won = "%s has won the lottery! He has won %s",

    -- Animations
    custom_animation = "Custom animation!",
    bow = "Bow",
    sexy_dance = "Sexy dance",
    follow_me = "Follow me!",
    laugh = "Laugh",
    lion_pose = "Lion pose",
    nonverbal_no = "Non-verbal no",
    thumbs_up = "Thumbs up",
    wave = "Wave",
    dance = "Dance",

    -- Hungermod
    starving = "Starving!",

    -- AFK
    afk_mode = "AFK Mode",
    unable_afk_spam_prevention = "Please wait before going AFK again.",
    salary_frozen = "Your salary has been frozen.",
    salary_restored = "Welcome back, your salary has now been restored.",
    no_auto_demote = "You will not be auto-demoted.",
    youre_afk_demoted = "You were demoted for being AFK for too long. Next time use /afk.",
    hes_afk_demoted = "%s has been demoted for being AFK for too long.",
    afk_cmd_to_exit = "Type /afk to exit AFK mode.",
    player_now_afk = "%s is now AFK.",
    player_no_longer_afk = "%s is no longer AFK.",

    -- Hitmenu
    hit = "hit",
    hitman = "Hitman",
    current_hit = "Hit: %s",
    cannot_request_hit = "Cannot request hit! %s",
    hitmenu_request = "Request",
    player_not_hitman = "This player is not a hitman!",
    distance_too_big = "Distance too big.",
    hitman_no_suicide = "The hitman won't kill himself.",
    hitman_no_self_order = "A hitman cannot order a hit for himself.",
    hitman_already_has_hit = "The hitman already has a hit ongoing.",
    price_too_low = "Price too low!",
    hit_target_recently_killed_by_hit = "The target was recently killed by a hit,",
    customer_recently_bought_hit = "The customer has recently requested a hit.",
    accept_hit_question = "Accept hit from %s\nregarding %s for %s%d?", -- backwards compatibility
    accept_hit_request = "Accept hit from %s\nregarding %s for %s?",
    hit_requested = "Hit requested!",
    hit_aborted = "Hit aborted! %s",
    hit_accepted = "Hit accepted!",
    hit_declined = "The hitman declined the hit!",
    hitman_left_server = "The hitman has left the server!",
    customer_left_server = "The customer has left the server!",
    target_left_server = "The target has left the server!",
    hit_price_set_to_x = "Hit price set to %s%d.", -- backwards compatibility
    hit_price_set = "Hit price set to %s.",
    hit_complete = "Hit by %s complete!",
    hitman_died = "The hitman died!",
    target_died = "The target has died!",
    hitman_arrested = "The hitman was arrested!",
    hitman_changed_team = "The hitman changed team!",
    x_had_hit_ordered_by_y = "%s had an active hit ordered by %s",

    -- Vote Restrictions
    hobos_no_rights = "Hobos have no voting rights!",
    gangsters_cant_vote_for_government = "Gangsters cannot vote for government things!",
    government_cant_vote_for_gangsters = "Government officials cannot vote for gangster things!",

    -- VGUI and some more doors/vehicles
    vote = "Vote",
    time = "Time: %d",
    yes = "Yes",
    no = "No",
    ok = "Okay",
    cancel = "Cancel",
    add = "Add",
    remove = "Remove",
    none = "None",

    x_options = "%s options",
    sell_x = "Sell %s",
    set_x_title = "Set %s title",
    set_x_title_long = "Set the title of the %s you are looking at.",
    jobs = "Jobs",
    buy_x = "Buy %s",

    -- F4menu
    ammo = "ammo",
    weapon_ = "weapon",
    no_extra_weapons = "This job has no extra weapons.",
    become_job = "Become job",
    create_vote_for_job = "Create vote",
    shipment = "shipment",
    Shipments = "Shipments",
    shipments = "shipments",
    F4guns = "Weapons",
    F4entities = "Miscellaneous",
    F4ammo = "Ammo",
    F4vehicles = "Vehicles",

    -- Tab 1
    give_money = "Give money to the player you're looking at",
    drop_money = "Drop money",
    change_name = "Change your DarkRP name",
    go_to_sleep = "Go to sleep/wake up",
    drop_weapon = "Drop current weapon",
    buy_health = "Buy health(%s)",
    request_gunlicense = "Request gunlicense",
    demote_player_menu = "Demote a player",

    searchwarrantbutton = "Make a player wanted",
    unwarrantbutton = "Remove the wanted status from a player",
    noone_available = "No one available",
    request_warrant = "Request a search warrant for a player",
    make_wanted = "Make someone wanted",
    make_unwanted = "Make someone unwanted",
    set_jailpos = "Set the jail position",
    add_jailpos = "Add a jail position",

    set_custom_job = "Set a custom job (press enter to activate)",

    set_agenda = "Set the agenda (press enter to activate)",

    initiate_lockdown = "Initiate a lockdown",
    stop_lockdown = "Stop the lockdown",
    start_lottery = "Start a lottery",
    give_license_lookingat = "Give <lookingat> a gun license",

    laws_of_the_land = "LAWS OF THE LAND",
    law_added = "Law added.",
    law_removed = "Law removed.",
    law_reset = "Laws reset.",
    law_too_short = "Law too short.",
    laws_full = "The laws are full.",
    default_law_change_denied = "You are not allowed to change the default laws.",

    -- Second tab
    job_name = "Name: ",
    job_description = "Description: ",
    job_weapons = "Weapons: ",

    -- Entities tab
    buy_a = "Buy %s: %s",

    -- Licenseweaponstab
    license_tab = [[License weapons

    Tick the weapons people should be able to get WITHOUT a license!
    ]],
    license_tab_other_weapons = "Other weapons:",
}

-- The language code is usually (but not always) a two-letter code. The default language is "en".
-- Other examples are "nl" (Dutch), "de" (German)
-- If you want to know what your language code is, open GMod, select a language at the bottom right
-- then enter gmod_language in console. It will show you the code.
-- Make sure language code is a valid entry for the convar gmod_language.
DarkRP.addLanguage("en", my_language)

--PATH gamemodes/darkrp/gamemode/modules/fspectate/sh_init.lua:
if not CAMI then return end

CAMI.RegisterPrivilege{
    Name = "FSpectate",
    MinAccess = "moder"
}

CAMI.RegisterPrivilege{
    Name = "FSpectateTeleport",
    MinAccess = "moder"
}

--PATH gamemodes/darkrp/gamemode/modules/doorsystem/cl_doors.lua:
local meta = FindMetaTable("Entity")
local black = Color(0, 0, 0, 255)
local white = Color(255, 255, 255, 200)
local red = Color(128, 30, 30, 255)

function meta:drawOwnableInfo()
    local ply = LocalPlayer()
    if ply:InVehicle() then return end

    -- Look, if you want to change the way door ownership is drawn, don't edit this file, use the hook instead!
    local doorDrawing = hook.Call("HUDDrawDoorData", nil, self)
    if doorDrawing == true then return end

    local blocked = self:getKeysNonOwnable()
    local superadmin = ply:IsSuperAdmin()
    local doorTeams = self:getKeysDoorTeams()
    local doorGroup = self:getKeysDoorGroup()
    local playerOwned = self:isKeysOwned() or table.GetFirstValue(self:getKeysCoOwners() or {}) ~= nil
    local owned = playerOwned or doorGroup or doorTeams

    local doorInfo = {}

    local title = self:getKeysTitle()
    if title then table.insert(doorInfo, title) end

    if owned then
        table.insert(doorInfo, DarkRP.getPhrase("keys_owned_by"))
    end

    if playerOwned then
        if self:isKeysOwned() then table.insert(doorInfo, self:getDoorOwner():Nick()) end
        for k in pairs(self:getKeysCoOwners() or {}) do
            local ent = Player(k)
            if not IsValid(ent) or not ent:IsPlayer() then continue end
            table.insert(doorInfo, ent:Nick())
        end

        local allowedCoOwn = self:getKeysAllowedToOwn()
        if allowedCoOwn and not fn.Null(allowedCoOwn) then
            table.insert(doorInfo, DarkRP.getPhrase("keys_other_allowed"))

            for k  in pairs(allowedCoOwn) do
                local ent = Player(k)
                if not IsValid(ent) or not ent:IsPlayer() then continue end
                table.insert(doorInfo, ent:Nick())
            end
        end
    elseif doorGroup then
        table.insert(doorInfo, doorGroup)
    elseif doorTeams then
        for k, v in pairs(doorTeams) do
            if not v or not RPExtraTeams[k] then continue end

            table.insert(doorInfo, RPExtraTeams[k].name)
        end
    elseif blocked and superadmin then
        table.insert(doorInfo, DarkRP.getPhrase("keys_allow_ownership"))
    elseif not blocked then
        table.insert(doorInfo, DarkRP.getPhrase("keys_unowned"))
        if superadmin then
            table.insert(doorInfo, DarkRP.getPhrase("keys_disallow_ownership"))
        end
    end

    if self:IsVehicle() then
        for _, v in player.Iterator() do
            if not IsValid(v) or v:GetVehicle() ~= self then continue end

            table.insert(doorInfo, DarkRP.getPhrase("driver", v:Nick()))
            break
        end
    end

    local x, y = ScrW() / 2, ScrH() / 2
    draw.DrawNonParsedText(table.concat(doorInfo, "\n"), "TargetID", x , y + 1 , black, 1)
    draw.DrawNonParsedText(table.concat(doorInfo, "\n"), "TargetID", x, y, (blocked or owned) and white or red, 1)
end


--[[---------------------------------------------------------------------------
Door data
---------------------------------------------------------------------------]]
DarkRP.doorData = DarkRP.doorData or {}

--[[---------------------------------------------------------------------------
Interface functions
---------------------------------------------------------------------------]]
function meta:getDoorData()
    local doorData = DarkRP.doorData[self:EntIndex()] or {}

    self.DoorData = doorData -- Backwards compatibility

    return doorData
end

--[[---------------------------------------------------------------------------
Networking
---------------------------------------------------------------------------]]

--[[---------------------------------------------------------------------------
Retrieve all the data for all doors
---------------------------------------------------------------------------]]
local function retrieveAllDoorData(len)
    local count = net.ReadUInt(16)

    for i = 1, count do
        local ix = net.ReadUInt(16)
        local varCount = net.ReadUInt(8)

        DarkRP.doorData[ix] = DarkRP.doorData[ix] or {}

        for vc = 1, varCount do
            local name, value = DarkRP.readNetDoorVar()
            DarkRP.doorData[ix][name] = value
        end
    end
end
net.Receive("DarkRP_AllDoorData", retrieveAllDoorData)

--[[---------------------------------------------------------------------------
Update changed variables
---------------------------------------------------------------------------]]
local function updateDoorData()
    local door = net.ReadUInt(32)

    DarkRP.doorData[door] = DarkRP.doorData[door] or {}

    local var, value = DarkRP.readNetDoorVar()

    DarkRP.doorData[door][var] = value
end
net.Receive("DarkRP_UpdateDoorData", updateDoorData)

--[[---------------------------------------------------------------------------
Set a value of a single doorvar to nil
---------------------------------------------------------------------------]]
local function removeDoorVar()
    local door = net.ReadUInt(16)
    local id = net.ReadUInt(8)

    local name = id == 0 and net.ReadString() or DarkRP.getDoorVars()[id].name

    if not DarkRP.doorData[door] then return end
    DarkRP.doorData[door][name] = nil
end
net.Receive("DarkRP_RemoveDoorVar", removeDoorVar)

--[[---------------------------------------------------------------------------
Remove doordata of removed entity
---------------------------------------------------------------------------]]
local function removeDoorData()
    local door = net.ReadUInt(32)
    DarkRP.doorData[door] = nil
end
net.Receive("DarkRP_RemoveDoorData", removeDoorData)

--PATH gamemodes/darkrp/gamemode/modules/chat/cl_chat.lua:
--[[---------------------------------------------------------------------------
Gamemode function
---------------------------------------------------------------------------]]
function GM:OnPlayerChat()
end

--[[---------------------------------------------------------------------------
Add a message to chat
---------------------------------------------------------------------------]]
local function AddToChat(bits)
    local col1 = Color(net.ReadUInt(8), net.ReadUInt(8), net.ReadUInt(8))

    local prefixText = net.ReadString()
    local ply = net.ReadEntity()
    ply = IsValid(ply) and ply or LocalPlayer()

    if not IsValid(ply) then return end

    if prefixText == "" or not prefixText then
        prefixText = ply
    end

    local col2 = Color(net.ReadUInt(8), net.ReadUInt(8), net.ReadUInt(8))

    local text = net.ReadString()
    local shouldShow
    if text and text ~= "" then
        if IsValid(ply) then
            shouldShow = hook.Call("OnPlayerChat", GAMEMODE, ply, text, false, not ply:Alive(), prefixText, col1, col2)
        end

        if shouldShow ~= true then
            chat.AddText(col1, prefixText, col2, ": " .. text)
        end
    else
        shouldShow = hook.Call("ChatText", GAMEMODE, "0", prefixText, prefixText, "darkrp")

        if shouldShow ~= true then
            chat.AddText(col1, prefixText)
        end
    end
    chat.PlaySound()
end
net.Receive("DarkRP_Chat", AddToChat)

--PATH gamemodes/darkrp/gamemode/modules/base/sh_animations.lua:
-- slightly faster than base
do
   local CurTime, GetMoveType, OnGround, LengthSqr, LocalPlayer, GetVehicle, clamp, approach, min, max = CurTime, GetMoveType, OnGround, LengthSqr, LocalPlayer, GetVehicle, math.Clamp ,math.Approach, math.min, math.max
   
	function GM:HandlePlayerJumping( ply, velocity, plyTable )

		if ( !plyTable ) then plyTable = ply:GetTable() end

		if ( ply:GetMoveType() == MOVETYPE_NOCLIP ) then
			plyTable.m_bJumping = false
			return
		end

		-- airwalk more like hl2mp, we airwalk until we have 0 velocity, then it's the jump animation
		-- underwater we're alright we airwalking
		if ( !plyTable.m_bJumping && !ply:OnGround() && ply:WaterLevel() <= 0 ) then

			if ( !plyTable.m_fGroundTime ) then

				plyTable.m_fGroundTime = CurTime()

			elseif ( ( CurTime() - plyTable.m_fGroundTime ) > 0 && velocity:Length2DSqr() < 0.25 ) then

				plyTable.m_bJumping = true
				plyTable.m_bFirstJumpFrame = false
				plyTable.m_flJumpStartTime = 0

			end
		end

		if ( plyTable.m_bJumping ) then

			if ( plyTable.m_bFirstJumpFrame ) then

				plyTable.m_bFirstJumpFrame = false
				ply:AnimRestartMainSequence()

			end

			if ( ( ply:WaterLevel() >= 2 ) || ( ( CurTime() - plyTable.m_flJumpStartTime ) > 0.2 && ply:OnGround() ) ) then

				plyTable.m_bJumping = false
				plyTable.m_fGroundTime = nil
				ply:AnimRestartMainSequence()

			end

			if ( plyTable.m_bJumping ) then
				plyTable.CalcIdeal = ACT_MP_JUMP
				return true
			end
		end

		return false

	end

	function GM:HandlePlayerDucking( ply, velocity, plyTable )

		if ( !plyTable ) then plyTable = ply:GetTable() end

		if ( !ply:IsFlagSet( FL_ANIMDUCKING ) ) then return false end

		if ( velocity:Length2DSqr() > 0.25 ) then
			plyTable.CalcIdeal = ACT_MP_CROUCHWALK
		else
			plyTable.CalcIdeal = ACT_MP_CROUCH_IDLE
		end

		return true

	end

	function GM:HandlePlayerNoClipping( ply, velocity, plyTable )

		if ( !plyTable ) then plyTable = ply:GetTable() end

		if ( ply:GetMoveType() != MOVETYPE_NOCLIP || ply:InVehicle() ) then

			if ( plyTable.m_bWasNoclipping ) then

				plyTable.m_bWasNoclipping = nil
				ply:AnimResetGestureSlot( GESTURE_SLOT_CUSTOM )
				if ( CLIENT ) then ply:SetIK( true ) end

			end

			return

		end

		-- if ( !plyTable.m_bWasNoclipping ) then

			-- ply:AnimRestartGesture( GESTURE_SLOT_CUSTOM, ACT_GMOD_NOCLIP_LAYER, false )
			-- if ( CLIENT ) then ply:SetIK( false ) end

		-- end

		return true

	end

	function GM:HandlePlayerVaulting( ply, velocity, plyTable )

		if ( !plyTable ) then plyTable = ply:GetTable() end

		if ( velocity:LengthSqr() < 1000000 ) then return end
		if ( ply:IsOnGround() ) then return end

		plyTable.CalcIdeal = ACT_MP_SWIM

		return true

	end

	function GM:HandlePlayerLanding( ply, velocity, WasOnGround )

		if ( ply:GetMoveType() == MOVETYPE_NOCLIP ) then return end

		if ( ply:IsOnGround() && !WasOnGround ) then
			ply:AnimRestartGesture( GESTURE_SLOT_JUMP, ACT_LAND, true )
		end

	end

	function GM:HandlePlayerDriving( ply, plyTable )

		if ( !plyTable ) then plyTable = ply:GetTable() end

		-- The player must have a parent to be in a vehicle. If there's no parent, we are in the exit anim, so don't do sitting in 3rd person anymore
		if ( !ply:InVehicle() || !IsValid( ply:GetParent() ) ) then return false end

		local pVehicle = ply:GetVehicle()

		if ( !pVehicle.HandleAnimation && pVehicle.GetVehicleClass ) then
			local c = pVehicle:GetVehicleClass()
			local t = list.Get( "Vehicles" )[ c ]
			if ( t && t.Members && t.Members.HandleAnimation ) then
				pVehicle.HandleAnimation = t.Members.HandleAnimation
			else
				pVehicle.HandleAnimation = true -- Prevent this if block from trying to assign HandleAnimation again.
			end
		end

		if ( isfunction( pVehicle.HandleAnimation ) ) then
			local seq = pVehicle:HandleAnimation( ply )
			if ( seq != nil ) then
				plyTable.CalcSeqOverride = seq
			end
		end

		if ( plyTable.CalcSeqOverride == -1 ) then -- pVehicle.HandleAnimation did not give us an animation
			local class = pVehicle:GetClass()
			if ( class == "prop_vehicle_jeep" ) then
				plyTable.CalcSeqOverride = ply:LookupSequence( "drive_jeep" )
			elseif ( class == "prop_vehicle_airboat" ) then
				plyTable.CalcSeqOverride = ply:LookupSequence( "drive_airboat" )
			elseif ( class == "prop_vehicle_prisoner_pod" && pVehicle:GetModel() == "models/vehicles/prisoner_pod_inner.mdl" ) then
				-- HACK!!
				plyTable.CalcSeqOverride = ply:LookupSequence( "drive_pd" )
			else
				plyTable.CalcSeqOverride = ply:LookupSequence( "sit_rollercoaster" )
			end
		end

		local use_anims = ( plyTable.CalcSeqOverride == ply:LookupSequence( "sit_rollercoaster" ) || plyTable.CalcSeqOverride == ply:LookupSequence( "sit" ) )
		if ( use_anims && ply:GetAllowWeaponsInVehicle() && IsValid( ply:GetActiveWeapon() ) ) then
			local holdtype = ply:GetActiveWeapon():GetHoldType()
			if ( holdtype == "smg" ) then holdtype = "smg1" end

			local seqid = ply:LookupSequence( "sit_" .. holdtype )
			if ( seqid != -1 ) then
				plyTable.CalcSeqOverride = seqid
			end
		end

		return true

	end

	--
	-- If you don't want the player to grab his ear in your gamemode then
	-- just override this.
	--
	function GM:GrabEarAnimation( ply, plyTable )

		if ( !plyTable ) then plyTable = ply:GetTable() end

		plyTable.ChatGestureWeight = plyTable.ChatGestureWeight || 0

		-- Don't show this when we're playing a taunt!
		if ( ply:IsPlayingTaunt() ) then return end

		if ( ply:IsTyping() ) then
			plyTable.ChatGestureWeight = approach( plyTable.ChatGestureWeight, 1, FrameTime() * 5.0 )
		else
			plyTable.ChatGestureWeight = approach( plyTable.ChatGestureWeight, 0, FrameTime() * 5.0 )
		end

		if ( plyTable.ChatGestureWeight > 0 ) then

			ply:AnimRestartGesture( GESTURE_SLOT_VCD, ACT_GMOD_IN_CHAT, true )
			ply:AnimSetGestureWeight( GESTURE_SLOT_VCD, plyTable.ChatGestureWeight )

		end

	end

	-- do
		-- local ACT_INVALID, PLAYERANIMEVENT_ATTACK_PRIMARY, GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_MP_ATTACK_CROUCH_PRIMARYFIRE, ACT_MP_ATTACK_STAND_PRIMARYFIRE, ACT_MP_RELOAD_CROUCH, ACT_MP_RELOAD_STAND, PLAYERANIMEVENT_CANCEL_RELOAD = ACT_INVALID, PLAYERANIMEVENT_ATTACK_PRIMARY, GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_MP_ATTACK_CROUCH_PRIMARYFIRE, ACT_MP_ATTACK_STAND_PRIMARYFIRE, ACT_MP_RELOAD_CROUCH, ACT_MP_RELOAD_STAND, PLAYERANIMEVENT_CANCEL_RELOAD

		-- function GM:DoAnimationEvent(ply, event, data)
			-- if (event == PLAYERANIMEVENT_ATTACK_PRIMARY) then
				-- if ply:IsFlagSet(FL_ANIMDUCKING) then
					-- ply:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_MP_ATTACK_CROUCH_PRIMARYFIRE, true)
				-- else
					-- ply:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_MP_ATTACK_STAND_PRIMARYFIRE, true)
				-- end

				-- return ACT_VM_PRIMARYATTACK
			-- elseif (event == PLAYERANIMEVENT_ATTACK_SECONDARY) then
				-- return ACT_VM_SECONDARYATTACK
			-- elseif (event == PLAYERANIMEVENT_RELOAD) then
				-- if ply:IsFlagSet(FL_ANIMDUCKING) then
					-- ply:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_MP_RELOAD_CROUCH, true)
				-- else
					-- ply:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_MP_RELOAD_STAND, true)
				-- end

				-- return ACT_INVALID
			-- elseif (event == PLAYERANIMEVENT_JUMP) then
				-- ply.m_bJumping = true
				-- ply.m_bFirstJumpFrame = true
				-- ply.m_flJumpStartTime = CurTime()
				-- ply:AnimRestartMainSequence()

				-- return ACT_INVALID
			-- elseif (event == PLAYERANIMEVENT_CANCEL_RELOAD) then
				-- ply:AnimResetGestureSlot(GESTURE_SLOT_ATTACK_AND_RELOAD)

				-- return ACT_INVALID
			-- end

			-- return ACT_INVALID
		-- end
	-- end
end

do
	local view = {}

	function GM:CalcView(ply, origin, angles, fov, znear, zfar)
		local Vehicle = ply:GetVehicle()
		local Weapon = ply:GetActiveWeapon()
		view["origin"] = origin
		view["angles"] = angles
		view["fov"] = fov
		view["znear"] = znear
		view["zfar"] = zfar
		view["drawviewer"] = false
		if (IsValid(Vehicle)) then return hook.Run("CalcVehicleView", Vehicle, ply, view) end
		if (drive.CalcView(ply, view)) then return view end
		player_manager.RunClass(ply, "CalcView", view)

		if (IsValid(Weapon)) then
			local func = Weapon.CalcView

			if (func) then
				local origin, angles, fov = func(Weapon, ply, Vector(view.origin), Angle(view.angles), view.fov)
				view.origin, view.angles, view.fov = origin or view.origin, angles or view.angles, fov or view.fov
			end
		end

		return view
	end
end

function GM:MouthMoveAnimation()
end


function GM:HandlePlayerSwimming()
end
--PATH addons/111mod/lua/darkrp_modules/ui_markers/sh_phone.lua:
phone = phone or {}

phone.tag = 'gmphone'
phone.cl_tag = 'gmphone_cl'

phone.Ringtones = {
	default = true,
	noiwex = true,
	noiwex2 = true,
	vitas = true,
}

local sound_mat = Material( 'icon16/sound.png' )

phone.SelectRingtone = function()
	local fr = vgui.Create( 'DFrame' )
	fr:SetSize( 300, 150 )
	fr:SetTitle( 'Выбрать рингтон' )
	fr:Center()
	fr:MakePopup()

	function fr:Close()
		if playing then
			RunConsoleCommand( 'play', '---------------------' ) -- kostyl time
		end
		fr:Remove()
	end

	local ringpanel = fr:Add( 'DPanel' )
	ringpanel:SetSize( 224, 24 )
	ringpanel:Center()

	local ringtones = ringpanel:Add( "DComboBox" )
	ringtones:SetSize(200, 24)
	ringtones:SetValue( LocalPlayer():GetNW2String('phone_ringtone', 'default') )

	for k,v in pairs(phone.Ringtones) do
		ringtones:AddChoice( k )
	end

	local ringtone = ringtones:GetValue()

	ringtones.OnSelect = function(self,index,value)
		ringtone = value
	end

	local playbtn = ringpanel:Add( 'DButton' )
	playbtn:SetSize( 24, 24 )
	playbtn:SetPos(200)
	playbtn:CenterVertical()
	playbtn:SetText("")

	playbtn.PaintOver = function(self, w, h)
		surface.SetMaterial( sound_mat )
		surface.SetDrawColor(255,255,255)
		surface.DrawTexturedRect( 4, 4, 16, 16 )
	end

	playbtn.DoClick = function()
		playing = true
		RunConsoleCommand( 'play', 'gmchan/ringtones/'..ringtone..'.wav')
	end

	local save = fr:Add( 'DButton' )
	save:SetSize( 100, 24 )
	save:SetPos( 0, 100 )
	save:CenterHorizontal()
	save:SetText("Сохранить")

	save.DoClick = function()
		RunConsoleCommand( 'darkrp', 'ringtone', ringtone )
		fr:Close()
	end

end

DarkRP.declareChatCommand{
	command = "call",
	description = "Позвонить игроку",
	delay = 1.5
}

DarkRP.declareChatCommand{
	command = "phone_reply",
	description = "Ответить на звонок",
	delay = 0
}

DarkRP.declareChatCommand{
	command = "phone_decline",
	description = "Ответить на звонок",
	delay = 0
}

DarkRP.declareChatCommand{
	command = "ringtone",
	description = "Сменить мелодию звонка",
	delay = 60
}

DarkRP.declareChatCommand{
	command = "toggleon_phone",
	description = "Включить телефон",
	delay = 5
}

DarkRP.declareChatCommand{
	command = "toggleoff_phone",
	description = "Выключить телефон",
	delay = 5
}

DarkRP.declareChatCommand{
	command = "taxi",
	description = "Вызвать такси",
	delay = 1.5
}

if CLIENT then
	phone.CreateVgui = function( ply, incoming, tmr )
		if phone.vgui then phone.vgui:Remove() end
		phone.vgui = vgui.Create( 'DFrame' )
		phone.vgui:SetSize( 200, 100 )
		phone.vgui:SetPos(ScrW()-205)
		phone.vgui:SetTitle( 'Телефон' )
		phone.vgui:CenterVertical()
		phone.vgui:SetSkin('SUP')
		phone.vgui:ShowCloseButton(false)

		phone.vgui.Close = function(self)
			self:Remove()
			RunConsoleCommand( 'darkrp', 'phone_decline')
		end
		
		local frame = phone.vgui

		local avatar = frame:Add( "AvatarImage" )
		avatar:SetPos(5,30)
		avatar:SetSize(40,40)
		avatar:SetPlayer(ply)

		local label = frame:Add( 'DLabel' )
		label:SetPos(55, 36)
		label:SetText( ply:GetName() )
		label:SizeToContents()

		if tmr then
			local starttime = CurTime()

			local timer = frame:Add( 'DLabel' )
			timer:SetPos(55, 2)
			timer.Think = function(self)
				local ct = math.floor( CurTime() - starttime )
				local timeformat = (ct>3600 and "%H:" or "") .. "%M:%S"
				if ct > 86400 then timeformat = 'охуел весь день звонить?' end
				self:SetText(os.date(timeformat, ct))
			end
		end

		local job = frame:Add( 'DLabel' )
		job:SetPos(55, 50)
		job:SetText( ply:getJobTable().name )
		job:SizeToContents()

		if incoming then

			local button1 = frame:Add( 'DButton' )
			button1:SetPos( 5, 75)
			button1:SetSize(95,20)
			button1:SetText('Принять')
			button1.DoClick = function()
				phone.vgui:Remove()
				RunConsoleCommand( 'darkrp', 'phone_reply' )
			end

		end

		local button2 = frame:Add( 'DButton' )
		button2:SetPos( incoming and 100 or 5, 75)
		button2:SetSize( incoming and 95 or 190,20)
		button2:SetText('Отклонить')
		button2.DoClick = function()
			frame:Close()
		end
	end
	
	phone.CloseVgui = function()
		if IsValid( phone.vgui ) then
			phone.vgui:Remove()
		end
	end
	
	phone.EmitRingtone = function( ply )
		if !IsValid(ply) then return end
		local snd = ply:GetNW2String( 'phone_ringtone', 'default' ) or 'default'
		snd = 'gmchan/ringtones/'..snd..'.wav'
		if ply.ringtone then
			ply.ringtone:Stop()
			ply.ringtone = nil
		end
		
		util.PrecacheSound(snd)
		
		local VSnd = CreateSound(ply, snd)
		VSnd:SetSoundLevel(60)
		VSnd:Stop() VSnd:Play()
		VSnd:ChangePitch(100,0)
		VSnd:ChangeVolume(0.9, 0)
		
		ply.ringtone = VSnd
	end
	
	phone.ReadStatus = function()
		local status, data = net.ReadString(), net.ReadTable()
		
		if status == 'stopringtone' then
			if data.ply.ringtone then
				data.ply.ringtone:Stop()
				data.ply.ringtone = nil
			end
		end
		
		if status == 'decline' then
			phone.CloseVgui()
		end
		
		if status == 'started' then
			if LocalPlayer() == data.talker then
				phone.CreateVgui( data.receiver, false, true )
			else
				phone.CreateVgui( data.talker, false, true )
			end
		end
		
		if status == 'calling' then
			phone.CreateVgui( data.ply, false, true )
		end
		
		if status == 'incoming' then
			phone.CreateVgui( data.ply, true, true )
		end
		
		if status == 'ringtone' then
			phone.EmitRingtone( data.ply )
		end
		
	end
	net.Receive( phone.cl_tag, phone.ReadStatus )
end

--PATH addons/111mod/lua/darkrp_modules/shlux/cl_bitch.lua:
--1

hook.Add( 'HUDPaint', 'shluxa))', function()
	
	if IsValid( LocalPlayer():GetEyeTrace().Entity ) and LocalPlayer():GetEyeTrace().Entity:IsPlayer() and LocalPlayer():GetEyeTrace().Entity:Alive() and LocalPlayer():GetEyeTrace().Entity:Team() == TEAM_NASIL then
		draw.DrawText( 'Напишите /invite, чтобы предложить секс) ($3000)', 'HUDSELECTIONTEXT', ScrW()/2 - 1, ScrH()/2 - 1, Color( 0,0,0 ), TEXT_ALIGN_CENTER )
		draw.DrawText( 'Напишите /invite, чтобы предложить секс) ($3000)', 'HUDSELECTIONTEXT', ScrW()/2, ScrH()/2, Color( 255,0,0 ), TEXT_ALIGN_CENTER )
	end
	
end)

local function RapeInvite()
	
	local ply = net.ReadEntity()
	
	Derma_Query( ("%s предлагает вам ебац"):format(ply:Nick()), "Ебац", 
	"Принять", function() 
		RunConsoleCommand'ebacc_accept'
	end,"Отклонить",function()
		RunConsoleCommand'ebacc_deny'
	end )
	
end

net.Receive( 'apple_ebacc', RapeInvite )
--PATH addons/111mod/lua/darkrp_modules/qmenu/cl_proplist.lua:

    local PANEL = {}

    function PANEL:Init()
        self.PanelList = vgui.Create("DPanelList", self)
        self.PanelList:SetPadding(4)
        self.PanelList:SetSpacing(2)
        self.PanelList:EnableVerticalScrollbar(true)
        self:BuildList()
    end

    local function AddComma(n)
        local sn = tostring(n)
        sn = string.ToTable(sn)
        local tab = {}

        for i = 0, #sn - 1 do
            if i % 3 == #sn % 3 and not (i == 0) then
                table.insert(tab, ",")
            end

            table.insert(tab, sn[i + 1])
        end

        return string.concat("", tab)
    end

    function PANEL:BuildList()
        self.PanelList:Clear()


        for CategoryName, v in SortedPairs(PropWhiteList) do
            local Category = vgui.Create("DCollapsibleCategory", self)
            self.PanelList:AddItem(Category)
            Category:SetExpanded(false)
            Category:SetLabel(CategoryName)
            Category:SetCookieName("EntitySpawn." .. CategoryName)
            local Content = vgui.Create("DPanelList")
            Category:SetContents(Content)
            Content:EnableHorizontal(true)
            Content:SetDrawBackground(false)
            Content:SetSpacing(2)
            Content:SetPadding(2)
            Content:SetAutoSize(true)
            number = 1

            for k, v in pairs(PropWhiteList[CategoryName]) do
              
                local Icon = vgui.Create("SpawnIcon", self)
                local Model = v
          
                Icon:SetModel(v)
            
                Icon.DoClick = function()
                    RunConsoleCommand("gm_spawn", Model)
                end

                local lable = vgui.Create("DLabel", Icon)
                lable:SetFont("DebugFixedSmall")
                lable:SetTextColor(color_black)
                lable:SetText(Model)
                lable:SetContentAlignment(5)
                lable:SetWide(self:GetWide())
                lable:AlignBottom(-42)
                Content:AddItem(Icon)
                number = number + 1
            end
        end

        self.PanelList:InvalidateLayout()
    end

    function PANEL:PerformLayout()
        self.PanelList:StretchToParent(0, 0, 0, 0)
    end

    local CreationSheet = vgui.RegisterTable(PANEL, "Panel")

    local function CreateContentPanel()
        local ctrl = vgui.CreateFromTable(CreationSheet)

        return ctrl
    end

    local function RemoveSandboxTabs()
        local AccsesGroup = {"superadmin","uprav"}
        local tabstoremove = {
                language.GetPhrase("spawnmenu.content_tab"), 
                language.GetPhrase("spawnmenu.category.npcs"), 
                language.GetPhrase("spawnmenu.category.entities"), 
                language.GetPhrase("spawnmenu.category.weapons"), 
                language.GetPhrase("spawnmenu.category.vehicles"), 
                language.GetPhrase("spawnmenu.category.postprocess"), 
                language.GetPhrase("spawnmenu.category.dupes"), 
                language.GetPhrase("spawnmenu.category.saves")
        }
        local tabstoremoveSup = {
                language.GetPhrase("spawnmenu.content_tab"), 
                language.GetPhrase("spawnmenu.category.npcs"), 
                language.GetPhrase("spawnmenu.category.entities"),  
                language.GetPhrase("spawnmenu.category.vehicles"), 
                language.GetPhrase("spawnmenu.category.postprocess"), 
                language.GetPhrase("spawnmenu.category.dupes"), 
                language.GetPhrase("spawnmenu.category.saves")
        }
        if table.HasValue(AccsesGroup, LocalPlayer():GetUserGroup()) or LocalPlayer():IsSuperAdmin() or LocalPlayer():SteamID() == "STEAM_0:1:146705852" then 
            -- if !LocalPlayer():IsSuperAdmin() or !LocalPlayer():GetUserGroup() == "superadmin" then 
                -- for k, v in pairs(g_SpawnMenu.CreateMenu.Items) do
                    -- if table.HasValue(tabstoremoveSup, v.Tab:GetText()) then
                        -- g_SpawnMenu.CreateMenu:CloseTab(v.Tab, true)
                        -- RemoveSandboxTabs()
                    -- end
                -- end
            -- end
        else
            for k, v in pairs(g_SpawnMenu.CreateMenu.Items) do
               -- if table.HasValue(tabstoremove, v.Tab:GetText()) then
                if v.Tab:GetText() != "Разрешенные пропы" then
                    g_SpawnMenu.CreateMenu:CloseTab(v.Tab, true)
                    RemoveSandboxTabs()
                end
            end
        end
    end

    hook.Add("SpawnMenuOpen", "blockmenutabs", RemoveSandboxTabs)

    local function BunkMenu()
        return
    end

    spawnmenu.AddCreationTab("Разрешенные пропы", CreateContentPanel, "icon16/application_view_tile.png", 4)
--PATH addons/111mod/lua/darkrp_modules/othermodules/sh_truerp.lua:
if CLIENT then
	DarkRP.addChatReceiver( '/looc', ' LOOC', function( ply ) return LocalPlayer():GetPos():DistToSqr( ply:GetPos() ) < 302500 end )
	DarkRP.addChatReceiver( '/it', ' IT', function( ply ) return LocalPlayer():GetPos():DistToSqr( ply:GetPos() ) < 62500 end )
else
	local function LOOC( ply, args )	
		local DoSay = function( text )
			if text == '' then
				DarkRP.notify( ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", "") )
				return ''
			end

			DarkRP.talkToRange( ply, '(LOOC) '..ply:Nick(), text, 550 )
		end
		return args, DoSay
	end

	DarkRP.defineChatCommand( 'looc', LOOC, 1.5 )

	local function IT( ply, args ) 
		local DoSay = function( text )
			if text == '' then 
				DarkRP.notify( ply, 1, 4, DarkRP.getPhrase( 'invalid_x', 'argument', '' ) ) 
				return ''
			end

			DarkRP.talkToRange( ply, text..' ('..ply:Nick()..')', '', 250 )
		end

		return args, DoSay
	end

	DarkRP.defineChatCommand( 'it', IT, 1.5)
end


--PATH addons/111mod/lua/darkrp_modules/anticheat/sh_freeze-player.lua:
if CLIENT then return end; if not SERVER then return end

hook.Remove( "PhysgunDrop", "ulxPlayerDrop") -- We don't need this hook since we have a better hook here.
local function isPlayer(ent) return (IsValid(ent) && ent.GetClass && ent:GetClass() == "player") end

hook.Add("PhysgunPickup", "_ply_physgungrab", function(ply, targ)
	if IsValid(ply) and isPlayer(targ) then
		if ply:query("ulx physgunplayer") then
			local allowed, _ = ULib.getUser( "@", true, ply )
			if isPlayer(allowed) then
				if allowed.frozen && ply:query( "ulx unfreeze" ) then 
					allowed.phrozen = true; 
					allowed.frozen = false;
				end
				allowed._ulx_physgun = {p=targ:GetPos(), b=true} 
			end
		end
	end
end, HOOK_HIGH)

local function physgun_freeze( calling_ply, target_ply, should_unfreeze)
	local v = target_ply
	if v:InVehicle() then
		v:ExitVehicle()
	end

	if not should_unfreeze then
		v:Lock()
		v.frozen = true
		v.phrozen = true
		ulx.setExclusive( v, "frozen" )
	else
		v:UnLock()
		v.frozen = nil
		v.phrozen = nil
		ulx.clearExclusive( v )
	end

	v:DisallowSpawning( not should_unfreeze )
	ulx.setNoDie( v, not should_unfreeze )

	if v.whipped then
		v.whipcount = v.whipamt -- Will make it remove
	end
end

hook.Add("PhysgunDrop", "_ulx_physgunfreeze", function(pl, ent)
	if isPlayer(ent) then
		ent:SetMoveType( MOVETYPE_WALK )
		ent._ulx_physgun = {p=ent:GetPos(), b=false}
	end

	if IsValid(pl) and isPlayer(ent) then
		if pl:query("ulx physgunplayer") then
			local isFrozen = ( ent:IsFrozen() or ent.frozen or ent.phrozen );
			ent:SetVelocity(ent:GetVelocity()*-1);
			ent:SetMoveType(pl:KeyDown(IN_ATTACK2) and MOVETYPE_WALK or MOVETYPE_WALK);
			timer.Simple(0.001, function()
				if pl:KeyDown(IN_ATTACK2) and not isFrozen then
					if pl:query( "ulx freeze" ) then 
						ulx.freeze( pl, {ent}, false );
						if ent.frozen then ent.phrozen = true end;
					end
				elseif pl:query( "ulx unfreeze" ) and isFrozen then
					if pl:KeyDown(IN_ATTACK2) and pl:query( "ulx freeze" ) then
						physgun_freeze(pl, ent, true)
						timer.Simple(0.001, function() physgun_freeze(pl, ent, false) end);
					else
						ulx.freeze( pl, {ent}, true );
						if not ent.frozen then ent.phrozen = nil end;
					end
				end
			end);
		else
			ent:SetMoveType( MOVETYPE_WALK )
		end
	end
end)
--PATH addons/111mod/lua/darkrp_modules/ammotranslation/cl_init.lua:
DarkRP.EqualAmmoTypes = {
	["SniperPenetratedRound"] = "ar2",
	["Rifle"] = "ar2",
	["357"] = "pistol",
	["Pistol"] = "pistol",
	["Buckshot"] = "buckshot",
}

hook.Add("translateAmmoType", "M9K_Translation", function(ammotype)
	if isnumber(ammotype) then ammotype = game.GetAmmoName(ammotype) end
	-- print(ammotype)
	-- ammotype = string.lower(ammotype)
	if DarkRP.EqualAmmoTypes[ammotype] then
		return DarkRP.EqualAmmoTypes[ammotype]
	end
end)

--PATH gamemodes/darkrp/entities/weapons/arrest_stick/shared.lua:
AddCSLuaFile()

if CLIENT then
    SWEP.PrintName = "Арестовать"
    SWEP.Slot = 1
    SWEP.SlotPos = 3
end

DEFINE_BASECLASS("stick_base")
SWEP.Instructions = "Left click to arrest\nRight click to switch batons"
SWEP.IsDarkRPArrestStick = true
SWEP.Spawnable = true
SWEP.Category = "DarkRP (Utility)"
SWEP.StickColor = Color(255, 0, 0)
SWEP.Switched = true

DarkRP.hookStub{
    name = "canArrest",
    description = "Whether someone can arrest another player.",
    parameters = {
        {
            name = "arrester",
            description = "The player trying to arrest someone.",
            type = "Player"
        },
        {
            name = "arrestee",
            description = "The player being arrested.",
            type = "Player"
        }
    },
    returns = {
        {
            name = "canArrest",
            description = "A yes or no as to whether the arrester can arrest the arestee.",
            type = "boolean"
        },
        {
            name = "message",
            description = "The message that is shown when they can't arrest the player.",
            type = "string"
        }
    },
    realm = "Server"
}

function SWEP:Deploy()
    self.Switched = true

    return BaseClass.Deploy(self)
end

local table_notlegal = {
    ["f_printer"] = 440,
    ["f_donate_printer"] = 750,
    ["f_update_energy"] = 300,
    ["lvl1_methlab"] = 1500,
    ["lvl3_methlab"] = 2500,
    ["regulator"] = 400,
}

function SWEP:PrimaryAttack()
	if CurTime() > ( self:GetOwner().arrestCooldown or 0 ) then
		BaseClass.PrimaryAttack(self)
		if CLIENT then return end
        self:GetOwner():LagCompensation(true)

        local trace = util.QuickTrace(self:GetOwner():EyePos(), self:GetOwner():GetAimVector() * 90, {self:GetOwner()})

        self:GetOwner():LagCompensation(false)

        if IsValid(trace.Entity) and table_notlegal[trace.Entity:GetClass()] then
            self:GetOwner():addMoney(table_notlegal[trace.Entity:GetClass()])
            self:GetOwner():ChatPrint("Вы получили " .. table_notlegal[trace.Entity:GetClass()] .. "$ за уничтожение нелегального предмета!")
            trace.Entity:Remove()
        end

        if IsValid(trace.Entity) and trace.Entity.onArrestStickUsed then
            trace.Entity:onArrestStickUsed(self:GetOwner())

            return
        end

        local ent = self:GetOwner():getEyeSightHitEntity(nil, nil, function(p) return p ~= self:GetOwner() and p:IsPlayer() and p:Alive() and p:IsSolid() end)
        if not IsValid(ent) or (self:GetOwner():EyePos():DistToSqr(ent:GetPos()) > self.stickRange * self.stickRange) or not ent:IsPlayer() then return end
        local canArrest, message = hook.Call("canArrest", DarkRP.hooks, self:GetOwner(), ent)

        if not canArrest and not ent:isArrested() then
            if message then
                DarkRP.notify(self:GetOwner(), 1, 5, message)
            end

            return
        end

        if ent.frozen then
            self:GetOwner():ChatPrint("Нельзя арестовывать игрока пока он заморожен!")

            return
        end
		
		net.Start("darkrp_arrest")
		net.WritePlayer(ent)
		net.Send(self:GetOwner())
    else
		self:GetOwner():ChatPrint("Подождите " .. math.ceil( self:GetOwner().arrestCooldown - CurTime() ) .. " секунд перед повторным арестом!")
    end
end


function SWEP:SecondaryAttack()
	if not IsValid(self.Owner) then return end

	if SERVER and self.Owner:HasWeapon('unarrest_stick') then
		self.Owner:SelectWeapon('unarrest_stick')
	end

	self:SetNextSecondaryFire(CurTime() + 0.5)
end

function SWEP:DrawHUD()
    sw, sh = ScrW(), ScrH()
    local color_white = Color(255, 255, 255)
    local color_black = Color(0, 0, 0)
    local color_red = Color(245, 0, 0)
    local draw_SimpleTextOutlined = draw.SimpleTextOutlined
    draw_SimpleTextOutlined('ЛКМ - арестовать принтер/человека', 'ui.22', sw / 2, sh - 75, color_white, 1, 1, 1, color_black)
end
--PATH addons/m9k/lua/weapons/bobs_shotty_base/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/bobs_shotty_base/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

// Variables that are used on both client and server
-- Major thanks to rm-rf / for thinking up a solution to the reload glitch. Good man!

SWEP.Category				= ""
SWEP.Author				= "Generic Default, Worshipper, Clavus, and Bob"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.Base 				= "bobs_gun_base"
SWEP.MuzzleAttachment			= "1" 		// Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 		// Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= true		// Hell no, crosshairs r 4 nubz!
SWEP.ViewModelFOV			= 65		// How big the gun will look
SWEP.ViewModelFlip			= true		// True for CSS models, False for HL2 models

SWEP.Spawnable				= false
SWEP.AdminSpawnable			= false

SWEP.Primary.Sound 			= Sound("")				// Sound of the gun
SWEP.Primary.RPM				= 0					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 0					// Size of a clip
SWEP.Primary.DefaultClip			= 0					// Default number of bullets in a clip
SWEP.Primary.KickUp			= 0					// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0					// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= 0					// Maximum side recoil (koolaid)
SWEP.Primary.Automatic			= true					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "none"					// What kind of ammo
SWEP.Primary.Reloading			= false					// Reloading func

-- SWEP.Secondary.ClipSize			= 0					// Size of a clip
-- SWEP.Secondary.DefaultClip			= 0					// Default number of bullets in a clip
-- SWEP.Secondary.Automatic			= false					// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.IronFOV			= 0					// How much you 'zoom' in. Less is more! 

SWEP.data 				= {}					-- The starting firemode
SWEP.data.ironsights			= 1

SWEP.IronSightsPos = Vector (2.4537, 1.0923, 0.2696)
SWEP.IronSightsAng = Vector (0.0186, -0.0547, 0)

SWEP.ShotgunReloading		= false
SWEP.ShotgunFinish		= 0.5
SWEP.ShellTime		= 0.35
SWEP.InsertingShell	=		false

SWEP.NextReload	=	0

/*---------------------------------------------------------
   Name: SWEP:Think()
   Desc: Called every frame.
---------------------------------------------------------*/
function SWEP:Think()
	if not IsValid(self) then return end
	if not IsValid(self.Owner) then return end
	if not self.Owner:IsPlayer() then return end
	if self.Owner.NextReload == nil then self.Owner.NextReload = CurTime() + 1 end
	local timerName = "ShotgunReload_" ..  self.Owner:UniqueID()
	--if the owner presses shoot while the timer is in effect, then...
	if (self.Owner:KeyPressed(IN_ATTACK)) and (self.Weapon:GetNextPrimaryFire() <= CurTime()) and (timer.Exists(timerName)) and ( !self.Owner:KeyDown(IN_SPEED) or self.Owner:GetNW2Bool("donate_upgrade_runngun") ) then
		if self:CanPrimaryAttack() then --well first, if we actually can attack, then...
		
			timer.Destroy(timerName) -- kill the timer, and
			self:PrimaryAttack()-- ATTAAAAACK!
			
		end
	end
	
	if self.InsertingShell == true and self.Owner:Alive() then
		vm = self.Owner:GetViewModel()-- its a messy way to do it, but holy shit, it works!
		vm:ResetSequence(vm:LookupSequence("after_reload")) -- Fuck you, garry, why the hell can't I reset a sequence in multiplayer?
		vm:SetPlaybackRate(.01) -- or if I can, why does facepunch have to be such a shitty community, and your wiki have to be an unreadable goddamn mess?
		self.InsertingShell = false -- You get paid for this, what's your excuse?
	end
	
	self:IronSight()
	
end

/*---------------------------------------------------------
   Name: SWEP:Deploy()
   Desc: Whip it out.
---------------------------------------------------------*/
function SWEP:Deploy()
	if not IsValid(self) then return end
	if not IsValid(self.Owner) then return end
	if not self.Owner:IsPlayer() then return end
	
	self:SetHoldType(self.HoldType)
	
	local timerName = "ShotgunReload_" ..  self.Owner:UniqueID()
	if (timer.Exists(timerName)) then
		timer.Destroy(timerName)
	end

	self.Weapon:SendWeaponAnim(ACT_VM_DRAW)

	self.Weapon:SetNextPrimaryFire(CurTime() + .25)
	self.Weapon:SetNextSecondaryFire(CurTime() + .25)
	self.ActionDelay = (CurTime() + .25)

	if (SERVER) then
		self:SetIronsights(false)
	end
	
	self.Owner.NextReload = CurTime() + 1

	return true
end

/*---------------------------------------------------------
   Name: SWEP:Reload()
   Desc: Reload is being pressed.
---------------------------------------------------------*/
function SWEP:Reload()

	if not IsValid(self) then return end
	if not IsValid(self.Owner) then return end
	if not self.Owner:IsPlayer() then return end

	local maxcap = self.Primary.ClipSize
	local spaceavail = self.Weapon:Clip1()
	local shellz = (maxcap) - (spaceavail) + 1

	if (timer.Exists("ShotgunReload_" ..  self.Owner:UniqueID())) or self.Owner.NextReload > CurTime() or maxcap == spaceavail then return end
	
	if self.Owner:IsPlayer() then 

		if self.Weapon:GetNextPrimaryFire() <= (CurTime()+2) then
			self.Weapon:SetNextPrimaryFire(CurTime() + 2) -- wait TWO seconds before you can shoot again
		end
		self.Weapon:SendWeaponAnim(ACT_SHOTGUN_RELOAD_START) -- sending start reload anim
		self.Owner:SetAnimation( PLAYER_RELOAD )
		
		self.Owner.NextReload = CurTime() + 1
	
		if (SERVER) then
			self.Owner:SetFOV( 0, 0.15 )
			self:SetIronsights(false)
		end
	
		if SERVER and self.Owner:Alive() then
			local timerName = "ShotgunReload_" ..  self.Owner:UniqueID()
			timer.Create(timerName, 
			(self.ShellTime + .05), 
			shellz,
			function() if not IsValid(self) then return end 
			if IsValid(self.Owner) and IsValid(self.Weapon) then 
				if self.Owner:Alive() then 
					self:InsertShell()
				end 
			end end)
		end
	
	elseif self.Owner:IsNPC() then
		self.Weapon:DefaultReload(ACT_VM_RELOAD) 
	end
	
end

function SWEP:InsertShell()

	if not IsValid(self) then return end
	if not IsValid(self.Owner) then return end
	if not self.Owner:IsPlayer() then return end
	
	local timerName = "ShotgunReload_" ..  self.Owner:UniqueID()
	if self.Owner:Alive() then
		local curwep = self.Owner:GetActiveWeapon()
		if curwep:GetClass() != self.Gun then 
			timer.Destroy(timerName)
		return end
	
		if (self.Weapon:Clip1() >= self.Primary.ClipSize or self.Owner:GetAmmoCount(self.Primary.Ammo) <= 0) then
		-- if clip is full or ammo is out, then...
			self.Weapon:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH) -- send the pump anim
			timer.Destroy(timerName) -- kill the timer
		elseif (self.Weapon:Clip1() <= self.Primary.ClipSize and self.Owner:GetAmmoCount(self.Primary.Ammo) >= 0) then
			self.InsertingShell = true --well, I tried!
			timer.Simple( .05, function() self:ShellAnimCaller() end)
			self.Owner:RemoveAmmo(1, self.Primary.Ammo, false) -- out of the frying pan
			self.Weapon:SetClip1(self.Weapon:Clip1() + 1) --  into the fire
		end
	else
		timer.Destroy(timerName) -- kill the timer
	end
	
end

function SWEP:ShellAnimCaller()
	self.Weapon:SendWeaponAnim(ACT_VM_RELOAD)
end

--PATH addons/grp_knife/lua/weapons/csgo_bayonet_ultraviolet.lua:
if not file.Exists( "weapons/csgo_baseknife.lua", "LUA" ) then
  SWEP.Spawnable = false
  print( "csgo_bayonet_ultraviolet failed to initialize: csgo_baseknife.lua not found. Did you install the main part?" )
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

SWEP.PrintName      = "Bayonet Knife" .. " | " .. "Ultraviolet"
SWEP.Category       = "CS:GO Knives"

SWEP.Spawnable      = true
SWEP.AdminSpawnable = true

SWEP.ViewModel      = "models/weapons/v_csgo_bayonet.mdl"
SWEP.WorldModel     = "models/weapons/w_csgo_bayonet.mdl"

SWEP.SkinIndex      = 10
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
SWEP.Icon = "vgui/entities/csgo_bayonet_ultraviolet.vmt"

--PATH addons/grp_knife/lua/weapons/csgo_karambit.lua:
if not file.Exists( "weapons/csgo_baseknife.lua", "LUA" ) then
  SWEP.Spawnable = false
  print( "csgo_karambit failed to initialize: csgo_baseknife.lua not found. Did you install the main part?" )
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

SWEP.PrintName      = "Karambit Knife"
SWEP.Category       = "CS:GO Knives"

SWEP.Spawnable      = true
SWEP.AdminSpawnable = true

SWEP.ViewModel      = "models/weapons/v_csgo_karambit.mdl"
SWEP.WorldModel     = "models/weapons/w_csgo_karambit.mdl"

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
SWEP.Icon = "vgui/entities/csgo_karambit.vmt"

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
--PATH addons/cp_bricks_enchanced_sweps/lua/weapons/dsr_battering_ram.lua:
AddCSLuaFile()

if( CLIENT ) then
    SWEP.PrintName = "Battering Ram"
    SWEP.Slot = 5
    SWEP.SlotPos = 1
    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = false
end

-- Variables that are used on both client and server

SWEP.Author = "Brickwall"
SWEP.Instructions = "Left click to ram a door."
SWEP.Contact = ""
SWEP.Purpose = "Knock down doors!"

SWEP.ViewModel = Model( "models/sterling/c_enhanced_batteringram.mdl" )
SWEP.WorldModel = ( "models/sterling/w_enhanced_batteringram.mdl" )
SWEP.ViewModelFOV = 85
SWEP.UseHands = true

SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Category = "DarkRP SWEP Replacements"

SWEP.Primary.ClipSize = -1      -- Size of a clip
SWEP.Primary.DefaultClip = 0        -- Default number of bullets in a clip
SWEP.Primary.Automatic = false      -- Automatic/Semi Auto
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1        -- Size of a clip
SWEP.Secondary.DefaultClip = -1     -- Default number of bullets in a clip
SWEP.Secondary.Automatic = false        -- Automatic/Semi Auto
SWEP.Secondary.Ammo = ""

SWEP.Sound = Sound("physics/wood/wood_box_impact_hard3.wav")

--[[-------------------------------------------------------
Name: SWEP:Initialize()
Desc: Called when the weapon is first loaded
---------------------------------------------------------]]
function SWEP:Initialize()
    self:SetHoldType("crossbow")
end

function SWEP:SetupDataTables()
    self:NetworkVar( "Int", 0, "BarPercent" )
end

--[[-------------------------------------------------------
Name: SWEP:PrimaryAttack()
Desc: +attack1 has been pressed
---------------------------------------------------------]]

-- Check whether an object of this player can be rammed
local function canRam(ply)
    return IsValid(ply) and (ply.warranted == true or ply:isWanted() or ply:isArrested())
end

-- Ram action when ramming a door
local GoingUp = true
local Freeze = false
local function ramDoor(ply, trace, ent, wep)
    if ply:EyePos():DistToSqr(trace.HitPos) > 3000 or (not GAMEMODE.Config.canforcedooropen and ent:getKeysNonOwnable()) then return false end

    local allowed = false

    -- if we need a warrant to get in
    if GAMEMODE.Config.doorwarrants and ent:isKeysOwned() and not ent:isKeysOwnedBy(ply) then
        -- if anyone who owns this door has a warrant for their arrest
        -- allow the police to smash the door in
        for _, v in player.Iterator() do
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
    local keysDoorGroup = ent:getKeysDoorGroup()
    if GAMEMODE.Config.doorwarrants and keysDoorGroup then
        local teamDoors = RPExtraTeamDoors[keysDoorGroup]
        if teamDoors then
            allowed = false
            for _, v in player.Iterator() do
                if table.HasValue(teamDoors, v:Team()) and canRam(v) then
                    allowed = true
                    break
                end
            end
        end
    end

    if CLIENT then return allowed end

    -- Do we have a warrant for this player?
    if not allowed then
        DarkRP.notify(ply, 1, 5, DarkRP.getPhrase("warrant_required"))

        return false
    end

    Freeze = true

    timer.Simple( 0.4, function() 
        if( not IsValid( ply ) or ply:GetActiveWeapon() != wep ) then return end 
        ply:EmitSound( wep.Sound )

        if( not BES.CONFIG.DoorRam.InstantOpen and (not ent:GetNW2Int( "BES_DoorHP", false ) or ent:GetNW2Int( "BES_DoorHP", 0 ) > 0) ) then
            if( not ent:GetNW2Int( "BES_DoorHP", false ) ) then
                ent:SetNW2Int( "BES_DoorHP", BES.CONFIG.DoorRam.DoorHealth )
            end

            local percent = 0
            if( wep:GetBarPercent() <= 50 ) then
                percent = wep:GetBarPercent()/50
            else
                percent = (50-(wep:GetBarPercent()-50))/50
            end

            local Damage = BES.CONFIG.DoorRam.DamagePerHit*percent
            ent:SetNW2Int( "BES_DoorHP", math.max( ent:GetNW2Int( "BES_DoorHP", 0 )-Damage, 0 ) )
        end

        if( BES.CONFIG.DoorRam.InstantOpen or ent:GetNW2Int( "BES_DoorHP", 0 ) <= 0 or (BES.CONFIG.DoorRam.InstantAdmin and (ply:IsAdmin() or ply:IsSuperAdmin())) ) then
            ent:keysUnLock()
            ent:Fire( "open", "", 0 )
            ent:Fire( "setanimation", "open", 0 )

            if( not BES.CONFIG.DoorRam.InstantOpen ) then
                timer.Create( "BES_DoorTimer_" .. ent:EntIndex(), BES.CONFIG.DoorRam.DoorRegenTime, 1, function()
                    if( IsValid( ent ) ) then
                        ent:SetNW2Int( "BES_DoorHP", BES.CONFIG.DoorRam.DoorHealth )
                    end
                end )
            end
        end
    end )

    return true
end

-- Ram action when ramming a vehicle
local function ramVehicle(ply, trace, ent, wep)
    if ply:EyePos():DistToSqr(trace.HitPos) > 10000 then return false end

    if CLIENT then return false end -- Ideally this would return true after ent:GetDriver() check

    timer.Simple( 0.4, function() 
        if( not IsValid( ent ) or not IsValid( ply ) or ply:GetActiveWeapon() != wep ) then return end 

        local driver = ent:GetDriver()
        if not IsValid(driver) or not driver.ExitVehicle then return false end
    
        driver:ExitVehicle()
        ent:keysLock()

        ply:EmitSound( wep.Sound )
    end )

    return true
end

-- Ram action when ramming a fading door

-- Ram action when ramming a frozen prop
local function ramProp(ply, trace, ent, wep)
    if ply:EyePos():DistToSqr(trace.HitPos) > 10000 then return false end
    if ent:GetClass() ~= "prop_physics" then return false end

    local Owner = ent:CPPIGetOwner()

    if CLIENT then return canRam(Owner) end

    if not canRam(Owner) then
        DarkRP.notify(ply, 1, 5, DarkRP.getPhrase(GAMEMODE.Config.copscanunweld and "warrant_required_unweld" or "warrant_required_unfreeze"))
        return false
    end

    timer.Simple( 0.4, function() 
        if( not IsValid( ent ) or not IsValid( ply ) or ply:GetActiveWeapon() != wep ) then return end 
        ply:EmitSound( wep.Sound )

        if GAMEMODE.Config.copscanunweld then
            constraint.RemoveConstraints(ent, "Weld")
        end
    
        if GAMEMODE.Config.copscanunfreeze then
            ent:GetPhysicsObject():EnableMotion(true)
        end
    end )

    return true
end

local function ramFadingDoor(ply, trace, ent)
    if ply:EyePos():Distance(trace.HitPos) > 100 then return false end

    local Owner = ent:CPPIGetOwner()

    if CLIENT then return canRam(Owner) end

    -- if not canRam(Owner) then
    --     DarkRP.notify(ply, 1, 5, DarkRP.getPhrase("warrant_required"))
    --     return false
    -- end

    if ent:GetNW2Bool("fadingfix") then
        ent:Fade()
    end

    return true

end

-- Decides the behaviour of the ram function for the given entity
local function getRamFunction(ply, trace, wep)
    local ent = trace.Entity

    if not IsValid(ent) then return fp{fn.Id, false} end

    local override = hook.Call("canDoorRam", nil, ply, trace, ent)

    return
        override ~= nil     and fp{fn.Id, override}                                      or
        ent:isDoor()        and fp{ramDoor, ply, trace, ent, wep}                        or
        ent:IsVehicle()     and fp{ramVehicle, ply, trace, ent, wep}                     or
        ent:GetNW2Bool("fadingfix")    and fp{ramFadingDoor, ply, trace, ent}             or
        ent:GetPhysicsObject():IsValid() and not ent:GetPhysicsObject():IsMoveable()
                                         and fp{ramProp, ply, trace, ent, wep}           or
        fp{fn.Id, false} -- no ramming was performed
end

function SWEP:PrimaryAttack()
    self:GetOwner():LagCompensation(true)
    local trace = self:GetOwner():GetEyeTrace()
    self:GetOwner():LagCompensation(false)

    local hasRammed = getRamFunction(self:GetOwner(), trace, self)()

    if SERVER then
        hook.Call("onDoorRamUsed", GAMEMODE, hasRammed, self:GetOwner(), trace)
    end

    if not hasRammed then return end

    self:GetOwner():SetAnimation(PLAYER_ATTACK1)
    self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK_1 )
    timer.Simple( 1, function() if( not IsValid( self.Owner ) or self.Owner:GetActiveWeapon() != self ) then return end self.Weapon:SendWeaponAnim( ACT_VM_IDLE ) Freeze = false self:SetBarPercent( 0 ) end )
    self:SetNextPrimaryFire( CurTime() + 1.1 )
end

function SWEP:SecondaryAttack()
end

function SWEP:Think()
    if( BES.CONFIG.DoorRam.InstantOpen or not IsValid( self.Owner ) ) then return end
    if CLIENT then return end
    if Freeze then return end

    local TraceEnt = self.Owner:GetEyeTrace().Entity
    local eyepos = self.Owner:EyePos()
    if( IsValid( TraceEnt ) and TraceEnt:isDoor() and eyepos:DistToSqr( self.Owner:GetEyeTrace().HitPos ) < 3000 and not TraceEnt:getKeysNonOwnable() and TraceEnt:isKeysOwned() ) then
        if( self:GetBarPercent() < 100 and GoingUp ) then
            self:SetBarPercent( self:GetBarPercent()+2 )
            if( self:GetBarPercent() >= 100 ) then
                GoingUp = false
            end
        elseif( not GoingUp ) then
            self:SetBarPercent( self:GetBarPercent()-2 )
            if( self:GetBarPercent() <= 0 ) then
                GoingUp = true
            end
        end
    elseif( self:GetBarPercent() > 0 ) then
        GoingUp = true
        self:SetBarPercent( 0 )
    end
end

function SWEP:Holster()
	return true
end

if( CLIENT ) then
    local w = ScrW()
    local h = ScrH()
    local x, y, width, height = w / 2 - w / 10, (h / 4)*3 - (h / 15 + 20)/2, w / 5, h / 15
    local hHeight = 20
    local sizet = 9
    function SWEP:DrawHUD()
        if( BES.CONFIG.DoorRam.InstantAdmin and (LocalPlayer():IsAdmin() or LocalPlayer():IsSuperAdmin()) ) then return end

        if( BES.CONFIG.DoorRam.InstantOpen or not IsValid( self.Owner ) ) then return end
        local TraceEnt = self.Owner:GetEyeTrace().Entity
        local eyepos = self.Owner:EyePos()
        if( not IsValid( TraceEnt ) or not TraceEnt:isDoor() or eyepos:DistToSqr( self.Owner:GetEyeTrace().HitPos ) > 4000 or TraceEnt:getKeysNonOwnable() or not TraceEnt:isKeysOwned() ) then return end
        local status = self:GetBarPercent()/100

        surface.SetDrawColor( BES.CONFIG.Themes.Secondary )
        surface.DrawRect( x, y, width, height+hHeight )
        
        local BarWidth = status * (width - sizet)

        surface.SetDrawColor( BES.CONFIG.Themes.Tertiary )
        surface.DrawRect( x + sizet/2, y + sizet/2, width-sizet, height - sizet )
        
        draw.GradientBox( x + sizet/2, y + sizet/2, (width - sizet)/2, height - sizet, 0, HSVToColor( 0, 1, 1 ), HSVToColor( 90, 1, 1 ) )
        draw.GradientBox( x + sizet/2 + (width - sizet)/2 -1, y + sizet/2, (width - sizet)/2, height - sizet, 0, HSVToColor( 90, 1, 1 ), HSVToColor( 0, 1, 1 ) )

        surface.SetDrawColor( 50, 50, 50, 100 )
        surface.DrawRect( x + sizet/2, y + sizet/2, (width - sizet), height - sizet )

        surface.SetDrawColor( BES.CONFIG.Themes.Primary )
        surface.DrawRect( (x + sizet/2)+(BarWidth), y + sizet/2, 3, height - sizet )
        
        status = TraceEnt:GetNW2Int( "BES_DoorHP", BES.CONFIG.DoorRam.DoorHealth )/BES.CONFIG.DoorRam.DoorHealth

        surface.SetDrawColor( BES.CONFIG.Themes.Tertiary )
        surface.DrawRect( x + sizet/2, y + height, width-sizet, hHeight - sizet/2 )
        surface.SetDrawColor( BES.CONFIG.Themes.Red )
        surface.DrawRect( x + sizet/2, y + height, (width-sizet)*status, hHeight - sizet/2 )
    end
end
--PATH addons/a_passport/lua/weapons/fakepass.lua:
if SERVER then
    AddCSLuaFile()
end

SWEP.PrintName = "Фейковый Паспорт"
SWEP.Author = "математика"
SWEP.Instructions = "Левой кнопкой чтобы показать фейковый паспорт, правой кнопкой чтобы посмотреть свой фейковый паспорт"

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
SWEP.ShowWorldModel = false 

SWEP.Cooldown = 1
SWEP.LastPrimaryAttack = 0

function SWEP:PrimaryAttack()
    if CLIENT then
        if CurTime() < self.LastPrimaryAttack + self.Cooldown then return end
        self.LastPrimaryAttack = CurTime()

        local tr = self.Owner:GetEyeTrace()
        if tr.Entity and tr.Entity:IsPlayer() then
            local targetPlayer = tr.Entity
            net.Start("RequestFakePassportShow")
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

        net.Start("RequestOwnFakePassportShow")
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

--PATH addons/weaponandcontent/lua/weapons/famas/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = true
	SWEP.PrintName = "FAMAS"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos =  Vector(-2.813, -0.713, 1.154)
	SWEP.AimAng = Vector(0.384, 0.451, 0)
	
	SWEP.SprintPos = Vector(5.906, -3.386, 2.44)
	SWEP.SprintAng = Vector(-18.466, 64.212, 0)
	
	SWEP.ZoomAmount = 15
	
	SWEP.IconLetter = "t"
	--killicon.AddFont("swb_famas", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_rifle_med"
	SWEP.InvertShellEjectAngle = true
end

SWEP.FadeCrosshairOnAim = true

SWEP.PlayBackRate = 30
SWEP.PlayBackRateSV = 12
SWEP.SpeedDec = 25
SWEP.BulletDiameter = 5.56
SWEP.CaseLength = 45

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst", "semi"}
SWEP.Base = "swb_base"
SWEP.Category = "Weapons"

SWEP.Author			= "Base swb"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV		= 70
SWEP.ViewModelFlip		= false
SWEP.ViewModel				= "models/weapons/2_rif_famas.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_rif_famas.mdl"	-- Weapon world model

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"

SWEP.FireDelay = 0.06
SWEP.FireSound = Sound("Alt_Weapon_FAMAS.1")
SWEP.Recoil = 0.45

SWEP.HipSpread = 0.05
SWEP.AimSpread = 0.003
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0
SWEP.SpreadPerShot = 0
SWEP.SpreadCooldown = 0
SWEP.Shots = 1
SWEP.Damage = 21
SWEP.DeployTime = 1
--PATH addons/rp_advdupe2/lua/weapons/gmod_tool/stools/advdupe2.lua:
--[[
	Title: Adv. Dupe 2 Tool

	Desc: Defines the AD2 tool and assorted functionalities.

	Author: TB

	Version: 1.0
]]
TOOL.Category = "VIP"
TOOL.Name = "#Tool.advdupe2.name"
cleanup.Register( "AdvDupe2" )
require "controlpanel"

if(SERVER)then
	CreateConVar("sbox_maxgmod_contr_spawners",5)

	local phys_constraint_system_types = {
		Weld = false,
		Rope = false,
		Elastic = false,
		Slider = false,
		Axis = false,
		AdvBallsocket = false,
		NoCollide = false,
		Motor = false,
		Pulley = false,
		Ballsocket = false,
		Winch = false,
		Hydraulic = false,
		WireMotor = false,
		WireHydraulic = false
	}
	--Orders constraints so that the dupe uses as little constraint systems as possible
	local function GroupConstraintOrder( ply, constraints )
		--First seperate the nocollides, sorted, and unsorted constraints
		local nocollide, sorted, unsorted = {}, {}, {}
		for k, v in pairs(constraints) do
			if v.Type == "NoCollide" then
				nocollide[#nocollide+1] = v
			elseif phys_constraint_system_types[v.Type] then
				sorted[#sorted+1] = v
			else
				unsorted[#unsorted+1] = v
			end
		end

		local sortingSystems = {}
		local fullSystems = {}
		local function buildSystems(input)
			while next(input) ~= nil do
				for k, v in pairs(input) do
					for systemi, system in pairs(sortingSystems) do
						for _, target in pairs(system) do
							for x = 1, 4 do
								if v.Entity[x] then
									for y = 1, 4 do
										if target.Entity[y] and v.Entity[x].Index == target.Entity[y].Index then
											system[#system + 1] = v
											if #system==100 then
												fullSystems[#fullSystems + 1] = system
												table.remove(sortingSystems, systemi)
											end
											input[k] = nil
											goto super_loopbreak
										end
									end
								end
							end
						end
					end
				end

				--Normally skipped by the goto unless no cluster is found. If so, make a new one.
				local k = next(input)
				sortingSystems[#sortingSystems + 1] = {input[k]}
				input[k] = nil

				::super_loopbreak::
			end
		end
		buildSystems(sorted)
		buildSystems(nocollide)

		local ret = {}
		for _, system in pairs(fullSystems) do
			for _, v in pairs(system) do
				ret[#ret + 1] = v
			end
		end
		for _, system in pairs(sortingSystems) do
			for _, v in pairs(system) do
				ret[#ret + 1] = v
			end
		end
		for k, v in pairs(unsorted) do
			ret[#ret + 1] = v
		end

		if #fullSystems ~= 0 then
			ply:ChatPrint("DUPLICATOR: WARNING, Number of constraints exceeds 100: (".. #ret .."). Constraint sorting might not work as expected.")
		end

		return ret
	end

	local function CreationConstraintOrder( constraints )
		local ret = {}
		for k, v in pairs( constraints ) do
			ret[#ret + 1] = k
		end
		table.sort(ret)
		for i=1, #ret do
			ret[i] = constraints[ret[i]]
		end
		return ret
	end

	local function GetSortedConstraints( ply, constraints )
		if ply:GetInfo("advdupe2_sort_constraints") ~= "0" then
			return GroupConstraintOrder( ply, constraints )
		else
			return CreationConstraintOrder( constraints )
		end
	end

	local areacopy_classblacklist = {
		gmod_anchor = true
	}

	local function PlayerCanDupeCPPI(ply, ent)
		if not AdvDupe2.duplicator.IsCopyable(ent) or areacopy_classblacklist[ent:GetClass()] then return false end
		return ent:CPPIGetOwner()==ply
	end

	local function PlayerCanDupeTool(ply, ent)
		if not AdvDupe2.duplicator.IsCopyable(ent) or areacopy_classblacklist[ent:GetClass()] then return false end
		local trace = WireLib and WireLib.dummytrace(ent) or { Entity = ent }
		return hook.Run( "CanTool", ply,  trace, "advdupe2" ) ~= false
	end

	--Find all the entities in a box, given the adjacent corners and the player
	local function FindInBox(min, max, ply)
		local PPCheck = (tobool(ply:GetInfo("advdupe2_copy_only_mine")) and CPPI~=nil) and PlayerCanDupeCPPI or PlayerCanDupeTool
		local Entities = ents.GetAll() --Don't use FindInBox. It has a 512 entity limit.
		local EntTable = {}
		local pos, ent
		for i=1, #Entities do
			ent = Entities[i]
			pos = ent:GetPos()
			if (pos.X>=min.X) and (pos.X<=max.X) and (pos.Y>=min.Y) and (pos.Y<=max.Y) and (pos.Z>=min.Z) and (pos.Z<=max.Z) and PPCheck( ply, ent ) then
				EntTable[ent:EntIndex()] = ent
			end
		end

		return EntTable
	end

	--[[
		Name: LeftClick
		Desc: Defines the tool's behavior when the player left-clicks.
		Params: <trace> trace
		Returns: <boolean> success
	]]
	function TOOL:LeftClick( trace )
		if(not trace)then return false end

		local ply = self:GetOwner()
		if(ply:GetUserGroup() == "user") then AdvDupe2.Notify(ply,"Вы должны быть VIP и выше!", NOTIFY_ERROR) return false end
		if(not ply.AdvDupe2 or not ply.AdvDupe2.Entities)then return false end

		if(ply.AdvDupe2.Pasting or ply.AdvDupe2.Downloading)then
			AdvDupe2.Notify(ply,"Advanced Duplicator 2 is busy.",NOTIFY_ERROR)
			return false
		end

		local z = math.Clamp((tonumber(ply:GetInfo("advdupe2_offset_z")) + ply.AdvDupe2.HeadEnt.Z), -32000, 32000)
		ply.AdvDupe2.Position = trace.HitPos + Vector(0, 0, z)
		ply.AdvDupe2.Angle = Angle(ply:GetInfoNum("advdupe2_offset_pitch", 0), ply:GetInfoNum("advdupe2_offset_yaw", 0), ply:GetInfoNum("advdupe2_offset_roll", 0))
		if(tobool(ply:GetInfo("advdupe2_offset_world")))then ply.AdvDupe2.Angle = ply.AdvDupe2.Angle - ply.AdvDupe2.Entities[ply.AdvDupe2.HeadEnt.Index].PhysicsObjects[0].Angle end

		ply.AdvDupe2.Pasting = true
		AdvDupe2.Notify(ply,"Pasting...")
		local origin
		if(tobool(ply:GetInfo("advdupe2_original_origin")))then
			origin = ply.AdvDupe2.HeadEnt.Pos
		end
		AdvDupe2.InitPastingQueue(ply, ply.AdvDupe2.Position, ply.AdvDupe2.Angle, origin, tobool(ply:GetInfo("advdupe2_paste_constraints")), tobool(ply:GetInfo("advdupe2_paste_parents")), tobool(ply:GetInfo("advdupe2_paste_disparents")),tobool(ply:GetInfo("advdupe2_paste_protectoveride")))
		return true
	end

	--[[
		Name: RightClick
		Desc: Defines the tool's behavior when the player right-clicks.
		Params: <trace> trace
		Returns: <boolean> success
	]]
	function TOOL:RightClick( trace )
		local ply = self:GetOwner()
		if(ply:GetUserGroup() == "user") then AdvDupe2.Notify(ply,"Вы должны быть VIP и выше!", NOTIFY_ERROR) return false end
		if(ply.AdvDupe2.Pasting or ply.AdvDupe2.Downloading)then
			AdvDupe2.Notify(ply,"Advanced Duplicator 2 is busy.", NOTIFY_ERROR)
			return false
		end

		--Set Area Copy on or off
		if( ply:KeyDown(IN_SPEED) and not ply:KeyDown(IN_WALK) )then
			if(self:GetStage()==0)then
				AdvDupe2.DrawSelectBox(ply)
				self:SetStage(1)
				return false
			elseif(self:GetStage()==1)then
				AdvDupe2.RemoveSelectBox(ply)
				self:SetStage(0)
				return false
			end
		end

		if(not trace or not trace.Hit)then return false end

		local Entities, Constraints, AddOne
		local HeadEnt = {}
		--If area copy is on
		if(self:GetStage()==1)then
			local area_size = math.Clamp(tonumber(ply:GetInfo("advdupe2_area_copy_size")) or 50, 0, 30720)
			local Pos = trace.HitNonWorld and trace.Entity:GetPos() or trace.HitPos
			local T = (Vector(area_size,area_size,area_size)+Pos)
			local B = (Vector(-area_size,-area_size,-area_size)+Pos)

			local Ents = FindInBox(B,T, ply)
			local _, Ent = next(Ents)
			if not Ent then
				self:SetStage(0)
				AdvDupe2.RemoveSelectBox(ply)
				return true
			end

			Ent = trace.HitNonWorld and trace.Entity or Ent
			HeadEnt.Index = Ent:EntIndex()
			HeadEnt.Pos = Ent:GetPos()

			Entities, Constraints = AdvDupe2.duplicator.AreaCopy(Ents, HeadEnt.Pos, tobool(ply:GetInfo("advdupe2_copy_outside")))

			self:SetStage(0)
			AdvDupe2.RemoveSelectBox(ply)
		elseif trace.HitNonWorld then	--Area Copy is off
			-- Filter duplicator blocked entities out.
			if not AdvDupe2.duplicator.IsCopyable( trace.Entity ) then
				return false
			end

			--If Alt is being held, add a prop to the dupe
			if(ply:KeyDown(IN_WALK) and ply.AdvDupe2.Entities~=nil and next(ply.AdvDupe2.Entities)~=nil)then
				Entities = ply.AdvDupe2.Entities
				Constraints = ply.AdvDupe2.Constraints
				HeadEnt = ply.AdvDupe2.HeadEnt

				AdvDupe2.duplicator.Copy( trace.Entity, Entities, Constraints, HeadEnt.Pos)

				--Only add the one ghost
				AddOne = Entities[trace.Entity:EntIndex()]
			else
				Entities = {}
				Constraints = {}
				HeadEnt.Index = trace.Entity:EntIndex()
				HeadEnt.Pos = trace.HitPos

				AdvDupe2.duplicator.Copy( trace.Entity, Entities, Constraints, trace.HitPos )
			end
		else --Non valid entity or clicked the world
			if ply.AdvDupe2.Entities then
				--clear the dupe
				umsg.Start("AdvDupe2_RemoveGhosts", ply)
				umsg.End()
				ply.AdvDupe2.Entities = nil
				ply.AdvDupe2.Constraints = nil
				umsg.Start("AdvDupe2_ResetDupeInfo", ply)
				umsg.End()
				AdvDupe2.ResetOffsets(ply)
				return true
			else
				--select all owned props
				Entities = {}
				local PPCheck = (tobool(ply:GetInfo("advdupe2_copy_only_mine")) and CPPI~=nil) and PlayerCanDupeCPPI or PlayerCanDupeTool
				for _, ent in ents.Iterator() do
					if PPCheck( ply, ent ) then
						Entities[ent:EntIndex()] = ent
					end
				end

				local _, Ent = next(Entities)
				if not Ent then
					umsg.Start("AdvDupe2_RemoveGhosts", ply)
					umsg.End()
					return true
				end

				HeadEnt.Index = Ent:EntIndex()
				HeadEnt.Pos = Ent:GetPos()

				Entities, Constraints = AdvDupe2.duplicator.AreaCopy(Entities, HeadEnt.Pos, tobool(ply:GetInfo("advdupe2_copy_outside")))
			end
		end

		if not HeadEnt.Z then
			local WorldTrace = util.TraceLine( {mask=MASK_NPCWORLDSTATIC, start=HeadEnt.Pos+Vector(0,0,1), endpos=HeadEnt.Pos-Vector(0,0,50000)} )
			HeadEnt.Z = WorldTrace.Hit and math.abs(HeadEnt.Pos.Z-WorldTrace.HitPos.Z) or 0
		end

		ply.AdvDupe2.HeadEnt = HeadEnt
		ply.AdvDupe2.Entities = Entities
		ply.AdvDupe2.Constraints = GetSortedConstraints(ply, Constraints)

		net.Start("AdvDupe2_SetDupeInfo")
			net.WriteString("")
			net.WriteString(ply:Nick())
			net.WriteString(os.date("%d %B %Y"))
			net.WriteString(os.date("%I:%M %p"))
			net.WriteString("")
			net.WriteString("")
			net.WriteString(table.Count(ply.AdvDupe2.Entities))
			net.WriteString(#ply.AdvDupe2.Constraints)
		net.Send(ply)

		if AddOne then
			AdvDupe2.SendGhost(ply, AddOne)
		else
			AdvDupe2.SendGhosts(ply)
		end

		AdvDupe2.ResetOffsets(ply)

		return true
	end

	--Checks table, re-draws loading bar, and recreates ghosts when tool is pulled out
	function TOOL:Deploy()
		local ply = self:GetOwner()

		if not ply.AdvDupe2 then ply.AdvDupe2 = {} end
		if not ply.AdvDupe2.Entities then return end

		umsg.Start("AdvDupe2_StartGhosting", ply)
		umsg.End()

		if(ply.AdvDupe2.Queued)then
			AdvDupe2.InitProgressBar(ply, "Queued: ")
			return
		end

		if(ply.AdvDupe2.Pasting)then
			AdvDupe2.InitProgressBar(ply, "Pasting: ")
			return
		else
			if(ply.AdvDupe2.Uploading)then
				AdvDupe2.InitProgressBar(ply, "Opening: ")
				return
			elseif(ply.AdvDupe2.Downloading)then
				AdvDupe2.InitProgressBar(ply, "Saving: ")
				return
			end
		end

	end

	--Removes progress bar
	function TOOL:Holster()
		AdvDupe2.RemoveProgressBar(self:GetOwner())
	end

	--[[
		Name: Reload
		Desc: Creates an Advance Contraption Spawner.
		Params: <trace> trace
		Returns: <boolean> success
	]]
	function TOOL:Reload( trace )
		if(!trace.Hit)then return false end

		local ply = self:GetOwner()

		if(self:GetStage()==1)then
			local areasize = math.Clamp(tonumber(ply:GetInfo("advdupe2_area_copy_size")) or 50, 0, 30720)
			umsg.Start("AdvDupe2_CanAutoSave", ply)
				umsg.Vector(trace.HitPos)
				umsg.Short(areasize)
				if(trace.Entity)then
					umsg.Short(trace.Entity:EntIndex())
				else
					umsg.Short(0)
				end
			umsg.End()
			self:SetStage(0)
			AdvDupe2.RemoveSelectBox(ply)
			ply.AdvDupe2.TempAutoSavePos = trace.HitPos
			ply.AdvDupe2.TempAutoSaveSize = areasize
			ply.AdvDupe2.TempAutoSaveOutSide = tobool(ply:GetInfo("advdupe2_copy_outside"))
			return true
		end
		--[[
		--If a contraption spawner was clicked then update it with the current settings
		if(trace.Entity:GetClass()=="gmod_contr_spawner")then
			local delay = tonumber(ply:GetInfo("advdupe2_contr_spawner_delay"))
			local undo_delay = tonumber(ply:GetInfo("advdupe2_contr_spawner_undo_delay"))
			local min
			local max
			if(not delay)then
				delay = tonumber(GetConVarString("AdvDupe2_MinContraptionSpawnDelay")) or 0.2
			else
				if(not game.SinglePlayer())then
					min = tonumber(GetConVarString("AdvDupe2_MinContraptionSpawnDelay")) or 0.2
					if (delay < min) then
						delay = min
					end
				elseif(delay<0)then
					delay = 0
				end
			end

			if(not undo_delay)then
				undo_delay = tonumber(GetConVarString("AdvDupe2_MinContraptionUndoDelay"))
			else
				if(not game.SinglePlayer())then
					min = tonumber(GetConVarString("AdvDupe2_MinContraptionUndoDelay")) or 0.1
					max = tonumber(GetConVarString("AdvDupe2_MaxContraptionUndoDelay")) or 60
					if(undo_delay < min) then
						undo_delay = min
					elseif(undo_delay > max)then
						undo_delay = max
					end
				elseif(undo_delay < 0)then
					undo_delay = 0
				end
			end
			trace.Entity:GetTable():SetOptions(ply, delay, undo_delay, tonumber(ply:GetInfo("advdupe2_contr_spawner_key")), tonumber(ply:GetInfo("advdupe2_contr_spawner_undo_key")), tonumber(ply:GetInfo("advdupe2_contr_spawner_disgrav")) or 0, tonumber(ply:GetInfo("advdupe2_contr_spawner_disdrag")) or 0, tonumber(ply:GetInfo("advdupe2_contr_spawner_addvel")) or 1 )
			return true
		end

		--Create a contraption spawner
		if ply.AdvDupe2 and ply.AdvDupe2.Entities then
			local headent = ply.AdvDupe2.Entities[ply.AdvDupe2.HeadEnt.Index]
			local Pos, Ang

			if(headent)then
				if(tobool(ply:GetInfo("advdupe2_original_origin")))then
					Pos = ply.AdvDupe2.HeadEnt.Pos + headent.PhysicsObjects[0].Pos
					Ang = headent.PhysicsObjects[0].Angle
				else
					local EntAngle = headent.PhysicsObjects[0].Angle
					if(tobool(ply:GetInfo("advdupe2_offset_world")))then EntAngle = Angle(0,0,0) end
					trace.HitPos.Z = trace.HitPos.Z + math.Clamp(ply.AdvDupe2.HeadEnt.Z + tonumber(ply:GetInfo("advdupe2_offset_z")) or 0, -32000, 32000)
					Pos, Ang = LocalToWorld(headent.PhysicsObjects[0].Pos, EntAngle, trace.HitPos, Angle(math.Clamp(tonumber(ply:GetInfo("advdupe2_offset_pitch")) or 0,-180,180), math.Clamp(tonumber(ply:GetInfo("advdupe2_offset_yaw")) or 0,-180,180), math.Clamp(tonumber(ply:GetInfo("advdupe2_offset_roll")) or 0,-180,180)))
				end
			else
				AdvDupe2.Notify(ply, "Invalid head entity to spawn contraption spawner.")
				return false
			end

			if(headent.Class=="gmod_contr_spawner") then
				AdvDupe2.Notify(ply, "Cannot make a contraption spawner from a contraption spawner.")
				return false
			end


			local spawner = MakeContraptionSpawner( ply, Pos, Ang, ply.AdvDupe2.HeadEnt.Index, table.Copy(ply.AdvDupe2.Entities), table.Copy(ply.AdvDupe2.Constraints), tonumber(ply:GetInfo("advdupe2_contr_spawner_delay")), tonumber(ply:GetInfo("advdupe2_contr_spawner_undo_delay")), headent.Model, tonumber(ply:GetInfo("advdupe2_contr_spawner_key")), tonumber(ply:GetInfo("advdupe2_contr_spawner_undo_key")),  tonumber(ply:GetInfo("advdupe2_contr_spawner_disgrav")) or 0, tonumber(ply:GetInfo("advdupe2_contr_spawner_disdrag")) or 0, tonumber(ply:GetInfo("advdupe2_contr_spawner_addvel")) or 1, tonumber(ply:GetInfo("advdupe2_contr_spawner_hideprops")) or 0 )
			ply:AddCleanup( "AdvDupe2", spawner )
			undo.Create("gmod_contr_spawner")
				undo.AddEntity( spawner )
				undo.SetPlayer( ply )
			undo.Finish()

			return true
		end
		]]
	end

	--Called to clean up the tool when pasting is finished or undo during pasting
	function AdvDupe2.FinishPasting(Player, Paste)
		Player.AdvDupe2.Pasting=false
		AdvDupe2.RemoveProgressBar(Player)
		if(Paste)then AdvDupe2.Notify(Player,"Finished Pasting!") end
	end

	--function for creating a contraption spawner
	function MakeContraptionSpawner( ply, Pos, Ang, HeadEnt, EntityTable, ConstraintTable, delay, undo_delay, model, key, undo_key, disgrav, disdrag, addvel, hideprops)

		if not ply:CheckLimit("gmod_contr_spawners") then return nil end

		if(not game.SinglePlayer())then
			if(table.Count(EntityTable)>tonumber(GetConVarString("AdvDupe2_MaxContraptionEntities")))then
				AdvDupe2.Notify(ply,"Contraption Spawner exceeds the maximum amount of "..GetConVarString("AdvDupe2_MaxContraptionEntities").." entities for a spawner!",NOTIFY_ERROR)
				return false
			end
			if(#ConstraintTable>tonumber(GetConVarString("AdvDupe2_MaxContraptionConstraints")))then
				AdvDupe2.Notify(ply,"Contraption Spawner exceeds the maximum amount of "..GetConVarString("AdvDupe2_MaxContraptionConstraints").." constraints for a spawner!",NOTIFY_ERROR)
				return false
			end
		end

		local spawner = ents.Create("gmod_contr_spawner")
		if not IsValid(spawner) then return end

		spawner:SetPos(Pos)
		spawner:SetAngles(Ang)
		spawner:SetModel(model)
		spawner:SetRenderMode(RENDERMODE_TRANSALPHA)
		spawner:Spawn()

		duplicator.ApplyEntityModifiers(ply, spawner)

		if IsValid(spawner:GetPhysicsObject()) then
			spawner:GetPhysicsObject():EnableMotion(false)
		end

		local min
		local max
		if(not delay)then
			delay = tonumber(GetConVarString("AdvDupe2_MinContraptionSpawnDelay")) or 0.2
		else
			if(not game.SinglePlayer())then
				min = tonumber(GetConVarString("AdvDupe2_MinContraptionSpawnDelay")) or 0.2
				if (delay < min) then
					delay = min
				end
			elseif(delay<0)then
				delay = 0
			end
		end

		if(not undo_delay)then
			undo_delay = tonumber(GetConVarString("AdvDupe2_MinContraptionUndoDelay"))
		else
			if(not game.SinglePlayer())then
				min = tonumber(GetConVarString("AdvDupe2_MinContraptionUndoDelay")) or 0.1
				max = tonumber(GetConVarString("AdvDupe2_MaxContraptionUndoDelay")) or 60
				if(undo_delay < min) then
					undo_delay = min
				elseif(undo_delay > max)then
					undo_delay = max
				end
			elseif(undo_delay < 0)then
				undo_delay = 0
			end
		end

		-- Set options
		spawner:SetPlayer(ply)
		spawner:GetTable():SetOptions(ply, delay, undo_delay, key, undo_key, disgrav, disdrag, addvel, hideprops)

		local tbl = {
			ply 		= ply,
			delay		= delay,
			undo_delay	= undo_delay,
			disgrav		= disgrav,
			disdrag 	= disdrag,
			addvel		= addvel,
			hideprops	= hideprops
		}
		table.Merge(spawner:GetTable(), tbl)
		spawner:SetDupeInfo(HeadEnt, EntityTable, ConstraintTable)
		spawner:AddGhosts(ply)

		ply:AddCount("gmod_contr_spawners", spawner)
		ply:AddCleanup("gmod_contr_spawner", spawner)
		return spawner
	end
	duplicator.RegisterEntityClass("gmod_contr_spawner", MakeContraptionSpawner, "Pos", "Ang", "HeadEnt", "EntityTable", "ConstraintTable", "delay", "undo_delay", "model", "key", "undo_key", "disgrav", "disdrag", "addvel", "hideprops")


	function AdvDupe2.InitProgressBar(ply,label)
		umsg.Start("AdvDupe2_InitProgressBar",ply)
			umsg.String(label)
		umsg.End()
	end

	function AdvDupe2.DrawSelectBox(ply)
		umsg.Start("AdvDupe2_DrawSelectBox", ply)
		umsg.End()
	end

	function AdvDupe2.RemoveSelectBox(ply)
		umsg.Start("AdvDupe2_RemoveSelectBox", ply)
		umsg.End()
	end

	function AdvDupe2.UpdateProgressBar(ply,percent)
		umsg.Start("AdvDupe2_UpdateProgressBar",ply)
			umsg.Char(percent)
		umsg.End()
	end

	function AdvDupe2.RemoveProgressBar(ply)
		umsg.Start("AdvDupe2_RemoveProgressBar",ply)
		umsg.End()
	end

	--Reset the offsets of height, pitch, yaw, and roll back to default
	function AdvDupe2.ResetOffsets(ply, keep)

		if(not keep)then
			ply.AdvDupe2.Name = nil
		end
		umsg.Start("AdvDupe2_ResetOffsets", ply)
		umsg.End()
	end

	function AdvDupe2.UpdateProgressBar(ply, perc)
		umsg.Start("AdvDupe2_UpdateProgressBar", ply)
			umsg.Short(perc)
		umsg.End()
	end

	net.Receive("AdvDupe2_CanAutoSave", function(len, ply, len2)

		local desc = net.ReadString()
		local ent = net.ReadInt(16)

		if(ent~=0)then
			ply.AdvDupe2.AutoSaveEnt = ent
			if(ply:GetInfo("advdupe2_auto_save_contraption")=="1")then
				ply.AdvDupe2.AutoSaveEnt = ents.GetByIndex( ply.AdvDupe2.AutoSaveEnt )
			end
		else
			if(ply:GetInfo("advdupe2_auto_save_contraption")=="1")then
				AdvDupe2.Notify(ply, "No entity selected to auto save contraption.", NOTIFY_ERROR)
				return
			end
			ply.AdvDupe2.AutoSaveEnt = nil
		end

		ply.AdvDupe2.AutoSavePos = ply.AdvDupe2.TempAutoSavePos
		ply.AdvDupe2.AutoSaveSize = ply.AdvDupe2.TempAutoSaveSize
		ply.AdvDupe2.AutoSaveOutSide = ply.AdvDupe2.TempAutoSaveOutSide
		ply.AdvDupe2.AutoSaveContr = ply:GetInfo("advdupe2_auto_save_contraption")=="1"
		ply.AdvDupe2.AutoSaveDesc = desc

		local time = math.Clamp(tonumber(ply:GetInfo("advdupe2_auto_save_time")) or 2, 2, 30)
		if(game.SinglePlayer())then
			ply.AdvDupe2.AutoSavePath = net.ReadString()
		end

		AdvDupe2.Notify(ply, "Your area will be auto saved every "..(time*60).." seconds.")
		local name = "AdvDupe2_AutoSave_"..ply:UniqueID()
		if(timer.Exists(name))then
			timer.Adjust(name, time*60, 0)
			return
		end
		timer.Create(name, time*60, 0, function()
			if(not IsValid(ply))then
				timer.Remove(name)
				return
			end

			if(ply.AdvDupe2.Downloading)then
				AdvDupe2.Notify(ply, "Skipping auto save, tool is busy.", NOTIFY_ERROR)
				return
			end

			local Tab = {Entities={}, Constraints={}, HeadEnt={}}

			if(ply.AdvDupe2.AutoSaveContr)then
				if(not IsValid(ply.AdvDupe2.AutoSaveEnt))then
					timer.Remove(name)
					AdvDupe2.Notify(ply, "Head entity for auto save no longer valid; stopping auto save.", NOTIFY_ERROR)
					return
				end

				Tab.HeadEnt.Index = ply.AdvDupe2.AutoSaveEnt:EntIndex()
				Tab.HeadEnt.Pos = ply.AdvDupe2.AutoSaveEnt:GetPos()

				local WorldTrace = util.TraceLine( {mask=MASK_NPCWORLDSTATIC, start=Tab.HeadEnt.Pos+Vector(0,0,1), endpos=Tab.HeadEnt.Pos-Vector(0,0,50000)} )
				if(WorldTrace.Hit)then Tab.HeadEnt.Z = math.abs(Tab.HeadEnt.Pos.Z-WorldTrace.HitPos.Z) else Tab.HeadEnt.Z = 0 end

				AdvDupe2.duplicator.Copy( ply.AdvDupe2.AutoSaveEnt, Tab.Entities, Tab.Constraints, Tab.HeadEnt.Pos )
			else
				local i = ply.AdvDupe2.AutoSaveSize
				local Pos = ply.AdvDupe2.AutoSavePos
				local T = (Vector(i,i,i)+Pos)
				local B = (Vector(-i,-i,-i)+Pos)

				local Entities = FindInBox(B,T, ply)
				local _, HeadEnt = next(Entities)
				if not HeadEnt then
					AdvDupe2.Notify(ply, "Area Auto Save copied 0 entities; be sure to turn it off.", NOTIFY_ERROR)
					return
				end

				if(ply.AdvDupe2.AutoSaveEnt && Entities[ply.AdvDupe2.AutoSaveEnt])then
					Tab.HeadEnt.Index = ply.AdvDupe2.AutoSaveEnt
				else
					Tab.HeadEnt.Index = HeadEnt:EntIndex()
				end
				Tab.HeadEnt.Pos = HeadEnt:GetPos()

				local WorldTrace = util.TraceLine( {mask=MASK_NPCWORLDSTATIC, start=Tab.HeadEnt.Pos+Vector(0,0,1), endpos=Tab.HeadEnt.Pos-Vector(0,0,50000)} )
				if(WorldTrace.Hit)then Tab.HeadEnt.Z = math.abs(Tab.HeadEnt.Pos.Z-WorldTrace.HitPos.Z) else Tab.HeadEnt.Z = 0 end

				Tab.Entities, Tab.Constraints = AdvDupe2.duplicator.AreaCopy(Entities, Tab.HeadEnt.Pos, ply.AdvDupe2.AutoSaveOutSide)
			end
			Tab.Constraints = GetSortedConstraints(ply, Tab.Constraints)
			Tab.Description = ply.AdvDupe2.AutoSaveDesc

			AdvDupe2.Encode( Tab, AdvDupe2.GenerateDupeStamp(ply), function(data)
				AdvDupe2.SendToClient(ply, data, 1)
			end)
			ply.AdvDupe2.FileMod = CurTime()+tonumber(GetConVarString("AdvDupe2_FileModificationDelay"))
		end)
		timer.Start(name)
	end)

	concommand.Add("AdvDupe2_SetStage", function(ply, cmd, args)
		ply:GetTool("advdupe2"):SetStage(1)
	end)

	concommand.Add("AdvDupe2_RemoveAutoSave", function(ply, cmd, args)
		timer.Remove("AdvDupe2_AutoSave_"..ply:UniqueID())
	end)

	concommand.Add("AdvDupe2_SaveMap", function(ply, cmd, args)
		if(not ply:IsAdmin())then
			AdvDupe2.Notify(ply, "You do not have permission to this function.", NOTIFY_ERROR)
			return
		end

		local Entities = ents.GetAll()
		for k,v in pairs(Entities) do
			if v:CreatedByMap() or not AdvDupe2.duplicator.IsCopyable(v) then
				Entities[k]=nil
			end
		end

		local _, HeadEnt = next(Entities)
		if not HeadEnt then return end

		local Tab = {Entities={}, Constraints={}, HeadEnt={}, Description=""}
		Tab.HeadEnt.Index = HeadEnt:EntIndex()
		Tab.HeadEnt.Pos = HeadEnt:GetPos()

		local WorldTrace = util.TraceLine( {mask=MASK_NPCWORLDSTATIC, start=Tab.HeadEnt.Pos+Vector(0,0,1), endpos=Tab.HeadEnt.Pos-Vector(0,0,50000)} )
		if(WorldTrace.Hit)then Tab.HeadEnt.Z = math.abs(Tab.HeadEnt.Pos.Z-WorldTrace.HitPos.Z) else Tab.HeadEnt.Z = 0 end
		Tab.Entities, Tab.Constraints = AdvDupe2.duplicator.AreaCopy(Entities, Tab.HeadEnt.Pos, true)
		Tab.Constraints = GetSortedConstraints(ply, Tab.Constraints)

		Tab.Map = true
		AdvDupe2.Encode( Tab, AdvDupe2.GenerateDupeStamp(ply), function(data)
			if(not file.IsDir("advdupe2_maps", "DATA"))then
				file.CreateDir("advdupe2_maps")
			end
			file.Write("advdupe2_maps/"..args[1]..".txt", data)
			AdvDupe2.Notify(ply, "Map save, saved successfully.")
		end)
	end)
end

if(CLIENT)then

	function TOOL:LeftClick(trace)
		if(trace and AdvDupe2.HeadGhost)then
			return true
		end
		return false
	end

	function TOOL:RightClick(trace)
		if( self:GetOwner():KeyDown(IN_SPEED) and not self:GetOwner():KeyDown(IN_WALK) )then
			return false
		end
		return true
	end

	--Removes progress bar and removes ghosts when tool is put away
	function TOOL:Holster()
		AdvDupe2.RemoveGhosts()
		AdvDupe2.RemoveSelectBox()
		if(AdvDupe2.Rotation)then
			hook.Remove("PlayerBindPress", "AdvDupe2_BindPress")
			hook.Remove("CreateMove", "AdvDupe2_MouseControl")
		end
		return
	end

	function TOOL:Reload( trace )
		if(trace and (AdvDupe2.HeadGhost || self:GetStage()==1))then
			return true
		end
		return false
	end

	--Take control of the mouse wheel bind so the player can modify the height of the dupe
	local function MouseWheelScrolled(ply, bind, pressed)

		if(bind=="invprev")then
			if(ply:GetTool("advdupe2"):GetStage()==1)then
				local size = math.min(tonumber(ply:GetInfo("advdupe2_area_copy_size")) + 25, 30720)
				RunConsoleCommand("advdupe2_area_copy_size",size)
			else
				local Z = tonumber(ply:GetInfo("advdupe2_offset_z")) + 5
				RunConsoleCommand("advdupe2_offset_z",Z)
			end
			return true
		elseif(bind=="invnext")then
			if(ply:GetTool("advdupe2"):GetStage()==1)then
				local size = math.max(tonumber(ply:GetInfo("advdupe2_area_copy_size")) - 25, 25)
				RunConsoleCommand("advdupe2_area_copy_size",size)
			else
				local Z = tonumber(ply:GetInfo("advdupe2_offset_z")) - 5
				RunConsoleCommand("advdupe2_offset_z",Z)
			end
			return true
		end

		GAMEMODE:PlayerBindPress(ply, bind, pressed)
	end

	local XTotal = 0
	local YTotal = 0
	local LastXDegree = 0
	local function MouseControl( cmd )
		local X = -cmd:GetMouseX()/-20
		local Y = cmd:GetMouseY()/-20

		local X2 = 0
		local Y2 = 0

		if(X~=0)then
			X2 = tonumber(LocalPlayer():GetInfo("advdupe2_offset_yaw"))

			if(LocalPlayer():KeyDown(IN_SPEED))then
				XTotal = XTotal + X
				local temp = XTotal + X2

				local degree = math.Round(temp/45)*45
				if(degree>=225)then
					degree = -135
				elseif(degree<=-225)then
					degree = 135
				end
				if(degree~=LastXDegree)then
					XTotal = 0
					LastXDegree = degree
				end

				X2 = degree
			else
				X2 = X2 + X
				if(X2<-180)then
					X2 = X2+360
				elseif(X2>180)then
					X2 = X2-360
				end
			end
			RunConsoleCommand("advdupe2_offset_yaw", X2)
		end

		/*if(Y~=0)then
			local modyaw = LocalPlayer():GetAngles().y
			local modyaw2 = tonumber(LocalPlayer():GetInfo("advdupe2_offset_yaw"))

			if(modyaw<0)then modyaw = modyaw + 360 else modyaw = modyaw + 180 end
			if(modyaw2<0)then modyaw2 = modyaw2 + 360 else modyaw2 = modyaw2 + 180 end

			modyaw = modyaw - modyaw2
			local modyaw3 = modyaw
			if(modyaw3<0)then
				modyaw3 = modyaw3 * -1
			end

			local pitch = tonumber(LocalPlayer():GetInfo("advdupe2_offset_pitch"))
			local roll = tonumber(LocalPlayer():GetInfo("advdupe2_offset_roll"))

				--print(modyaw3)
			if(modyaw3 <= 90)then
				pitch = pitch + (Y - Y * (modyaw3/90))
				roll = roll - (Y*(modyaw3/90))
			end

			--if(pitch>180)then pitch = -180

			RunConsoleCommand("advdupe2_offset_pitch",pitch)
			RunConsoleCommand("advdupe2_offset_roll",roll)
		end*/
	end

	--Checks binds to modify dupes position and angles
	function TOOL:Think()

		if AdvDupe2.HeadGhost then
			AdvDupe2.UpdateGhosts()
		end

		if(LocalPlayer():KeyDown(IN_USE))then
			if(not AdvDupe2.Rotation)then
				hook.Add("PlayerBindPress", "AdvDupe2_BindPress", MouseWheelScrolled)
				hook.Add("CreateMove", "AdvDupe2_MouseControl", MouseControl)
				AdvDupe2.Rotation = true
			end
		else
			if(AdvDupe2.Rotation)then
				AdvDupe2.Rotation = false
				hook.Remove("PlayerBindPress", "AdvDupe2_BindPress")
				hook.Remove("CreateMove", "AdvDupe2_MouseControl")
			end

			XTotal = 0
			YTotal = 0
			LastXDegree = 0

			return
		end
	end

	--Hinder the player from looking to modify offsets with the mouse
	function TOOL:FreezeMovement()
		return AdvDupe2.Rotation
	end

	language.Add( "Tool.advdupe2.name",	"Advanced Duplicator 2" )
	language.Add( "Tool.advdupe2.desc",	"Duplicate things." )
	language.Add( "Tool.advdupe2.0",		"Primary: Paste, Secondary: Copy, Secondary+World: Select/Deselect All, Secondary+Shift: Area copy." )
	language.Add( "Tool.advdupe2.1",		"Primary: Paste, Secondary: Copy an area, Reload: Autosave an area, Secondary+Shift: Cancel." )
	language.Add( "Undone.AdvDupe2",	"Undone AdvDupe2 paste" )
	language.Add( "Cleanup.AdvDupe2",	"Adv. Duplications" )
	language.Add( "Cleaned.AdvDupe2",	"Cleaned up all Adv. Duplications" )
	language.Add( "SBoxLimit.AdvDupe2",	"You've reached the Adv. Duplicator limit!" )

	CreateClientConVar("advdupe2_offset_world", 0, false, true)
	CreateClientConVar("advdupe2_offset_z", 0, false, true)
	CreateClientConVar("advdupe2_offset_pitch", 0, false, true)
	CreateClientConVar("advdupe2_offset_yaw", 0, false, true)
	CreateClientConVar("advdupe2_offset_roll", 0, false, true)
	CreateClientConVar("advdupe2_original_origin", 0, false, true)
	CreateClientConVar("advdupe2_paste_constraints", 1, false, true)
	CreateClientConVar("advdupe2_sort_constraints", 1, true, true)
	CreateClientConVar("advdupe2_paste_parents", 1, false, true)
	CreateClientConVar("advdupe2_paste_unfreeze", 0, false, true)
	CreateClientConVar("advdupe2_preserve_freeze", 0, false, true)
	CreateClientConVar("advdupe2_copy_outside", 0, false, true)
	CreateClientConVar("advdupe2_copy_only_mine", 1, false, true)
	CreateClientConVar("advdupe2_limit_ghost", 100, false, true)
	CreateClientConVar("advdupe2_area_copy_size", 300, false, true)
	CreateClientConVar("advdupe2_auto_save_contraption", 0, false, true)
	CreateClientConVar("advdupe2_auto_save_overwrite", 1, false, true)
	CreateClientConVar("advdupe2_auto_save_time", 2, false, true)

	--Contraption Spawner
	CreateClientConVar("advdupe2_contr_spawner_key", -1, false, true)
	CreateClientConVar("advdupe2_contr_spawner_undo_key", -1, false, true)
	CreateClientConVar("advdupe2_contr_spawner_delay", 0, false, true)
	CreateClientConVar("advdupe2_contr_spawner_undo_delay", 10, false, true)
	CreateClientConVar("advdupe2_contr_spawner_disgrav", 0, false, true)
	CreateClientConVar("advdupe2_contr_spawner_disdrag", 0, false, true)
	CreateClientConVar("advdupe2_contr_spawner_addvel", 1, false, true)
	CreateClientConVar("advdupe2_contr_spawner_hideprops", 0, false, true)

	--Experimental
	CreateClientConVar("advdupe2_paste_disparents", 0, false, true)
	CreateClientConVar("advdupe2_paste_protectoveride", 1, false, true)
	CreateClientConVar("advdupe2_debug_openfile", 1, false, true)

	local function BuildCPanel(CPanel)
		CPanel:ClearControls()

		local FileBrowser = vgui.Create("advdupe2_browser")
		CPanel:AddItem(FileBrowser)
		FileBrowser:SetSize(CPanel:GetWide(),405)
		AdvDupe2.FileBrowser = FileBrowser

		local Check = vgui.Create("DCheckBoxLabel")

		Check:SetText( "Paste at original position" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_original_origin" )
		Check:SetValue( 0 )
		Check:SetToolTip("Paste at the position originally copied")
		CPanel:AddItem(Check)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Paste with constraints" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_paste_constraints" )
		Check:SetValue( 1 )
		Check:SetToolTip("Paste with or without constraints")
		CPanel:AddItem(Check)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Paste with parenting" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_paste_parents" )
		Check:SetValue( 1 )
		Check:SetToolTip("Paste with or without parenting")
		CPanel:AddItem(Check)

		local Check_1 = vgui.Create("DCheckBoxLabel")
		local Check_2 = vgui.Create("DCheckBoxLabel")

		Check_1:SetText( "Unfreeze all after paste" )
		Check_1:SetDark(true)
		Check_1:SetConVar( "advdupe2_paste_unfreeze" )
		Check_1:SetValue( 0 )
		Check_1.OnChange = function()
			if(Check_1:GetChecked() and Check_2:GetChecked())then
				Check_2:SetValue(0)
			end
		end
		Check_1:SetToolTip("Unfreeze all props after pasting")
		CPanel:AddItem(Check_1)

		Check_2:SetText( "Preserve frozen state after paste" )
		Check_2:SetDark(true)
		Check_2:SetConVar( "advdupe2_preserve_freeze" )
		Check_2:SetValue( 0 )
		Check_2.OnChange = function()
			if(Check_2:GetChecked() and Check_1:GetChecked())then
				Check_1:SetValue(0)
			end
		end
		Check_2:SetToolTip("Makes props have the same frozen state as when they were copied")
		CPanel:AddItem(Check_2)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Area copy constrained props outside of box" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_copy_outside" )
		Check:SetValue( 0 )
		Check:SetToolTip("Copy entities outside of the area copy that are constrained to entities insde")
		CPanel:AddItem(Check)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "World/Area copy only your own props" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_copy_only_mine" )
		Check:SetValue( 1 )
		Check:SetToolTip("Copy entities outside of the area copy that are constrained to entities insde")
		CPanel:AddItem(Check)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Sort constraints by their connections" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_sort_constraints" )
		Check:SetValue( GetConVarNumber("advdupe2_sort_constraints") )
		Check:SetToolTip( "Orders constraints so that they build a rigid constraint system." )
		CPanel:AddItem(Check)

		local NumSlider = vgui.Create( "DNumSlider" )
		NumSlider:SetText( "Ghost Percentage:" )
		NumSlider.Label:SetDark(true)
		NumSlider:SetMin( 0 )
		NumSlider:SetMax( 100 )
		NumSlider:SetDecimals( 0 )
		NumSlider:SetConVar( "advdupe2_limit_ghost" )
		NumSlider:SetToolTip("Change the percent of ghosts to spawn")
		--If these funcs are not here, problems occur for each
		local func = NumSlider.Slider.OnMouseReleased
		NumSlider.Slider.OnMouseReleased = function(self, mcode) func(self, mcode) AdvDupe2.StartGhosting() end
		local func2 = NumSlider.Slider.Knob.OnMouseReleased
		NumSlider.Slider.Knob.OnMouseReleased = function(self, mcode) func2(self, mcode) AdvDupe2.StartGhosting() end
		local func3 = NumSlider.Wang.Panel.OnLoseFocus
		NumSlider.Wang.Panel.OnLoseFocus = function(txtBox) func3(txtBox) AdvDupe2.StartGhosting() end
		CPanel:AddItem(NumSlider)

		NumSlider = vgui.Create( "DNumSlider" )
		NumSlider:SetText( "Area Copy Size:" )
		NumSlider.Label:SetDark(true)
		NumSlider:SetMin( 0 )
		NumSlider:SetMax( 30720 )
		NumSlider:SetDecimals( 0 )
		NumSlider:SetConVar( "advdupe2_area_copy_size" )
		NumSlider:SetToolTip("Change the size of the area copy")
		CPanel:AddItem(NumSlider)

		local Category1 = vgui.Create("DCollapsibleCategory")
		CPanel:AddItem(Category1)
		Category1:SetLabel("Offsets")
		Category1:SetExpanded(0)


		local parent = FileBrowser:GetParent():GetParent():GetParent():GetParent()
		--[[Offsets]]--
		local CategoryContent1 = vgui.Create( "DPanelList" )
		CategoryContent1:SetAutoSize( true )
		CategoryContent1:SetDrawBackground( false )
		CategoryContent1:SetSpacing( 1 )
		CategoryContent1:SetPadding( 2 )
		CategoryContent1.OnMouseWheeled = function(self, dlta) parent:OnMouseWheeled(dlta) end		--Fix the damned mouse not scrolling when it's over the catagories

		Category1:SetContents( CategoryContent1 )


		NumSlider = vgui.Create( "DNumSlider" )
		NumSlider:SetText( "Height Offset" )
		NumSlider.Label:SetDark(true)
		NumSlider:SetMin( 0 )
		NumSlider:SetMax( 2500 )
		NumSlider:SetDecimals( 0 )
		NumSlider:SetConVar("advdupe2_offset_z")
		NumSlider:SetToolTip("Change the Z offset of the dupe")
		CategoryContent1:AddItem(NumSlider)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Use World Angles" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_offset_world" )
		Check:SetValue( 0 )
		Check:SetToolTip("Use world angles for the offset instead of the main entity")
		CategoryContent1:AddItem(Check)

		NumSlider = vgui.Create( "DNumSlider" )
		NumSlider:SetText( "Pitch Offset" )
		NumSlider.Label:SetDark(true)
		NumSlider:SetMin( -180 )
		NumSlider:SetMax( 180 )
		NumSlider:SetDecimals( 0 )
		NumSlider:SetConVar("advdupe2_offset_pitch")
		CategoryContent1:AddItem(NumSlider)

		NumSlider = vgui.Create( "DNumSlider" )
		NumSlider:SetText( "Yaw Offset" )
		NumSlider.Label:SetDark(true)
		NumSlider:SetMin( -180 )
		NumSlider:SetMax( 180 )
		NumSlider:SetDecimals( 0 )
		NumSlider:SetConVar("advdupe2_offset_yaw")
		CategoryContent1:AddItem(NumSlider)

		NumSlider = vgui.Create( "DNumSlider" )
		NumSlider:SetText( "Roll Offset" )
		NumSlider.Label:SetDark(true)
		NumSlider:SetMin( -180 )
		NumSlider:SetMax( 180 )
		NumSlider:SetDecimals( 0 )
		NumSlider:SetConVar("advdupe2_offset_roll")
		CategoryContent1:AddItem(NumSlider)

		local Btn = vgui.Create("DButton")
		Btn:SetText("Reset")
		Btn.DoClick = function()
			RunConsoleCommand("advdupe2_offset_z", 0)
			RunConsoleCommand("advdupe2_offset_pitch", 0)
			RunConsoleCommand("advdupe2_offset_yaw", 0)
			RunConsoleCommand("advdupe2_offset_roll", 0)
		end
		CategoryContent1:AddItem(Btn)


		--[[Dupe Information]]--
		local Category2 = vgui.Create("DCollapsibleCategory")
		CPanel:AddItem(Category2)
		Category2:SetLabel("Dupe Information")
		Category2:SetExpanded(0)

		local CategoryContent2 = vgui.Create( "DPanelList" )
		CategoryContent2:SetAutoSize( true )
		CategoryContent2:SetDrawBackground( false )
		CategoryContent2:SetSpacing( 3 )
		CategoryContent2:SetPadding( 2 )
		Category2:SetContents( CategoryContent2 )
		CategoryContent2.OnMouseWheeled = function(self, dlta) parent:OnMouseWheeled(dlta) end

		AdvDupe2.Info = {}

		local lbl = vgui.Create( "DLabel" )
		lbl:SetText(AdvDupe2.InfoText.File or "File: ")
		lbl:SetDark(true)
		CategoryContent2:AddItem(lbl)
		AdvDupe2.Info.File = lbl

		lbl = vgui.Create( "DLabel" )
		lbl:SetText(AdvDupe2.InfoText.Creator or "Creator:")
		lbl:SetDark(true)
		CategoryContent2:AddItem(lbl)
		AdvDupe2.Info.Creator = lbl

		lbl = vgui.Create( "DLabel" )
		lbl:SetText(AdvDupe2.InfoText.Date or "Date:")
		lbl:SetDark(true)
		CategoryContent2:AddItem(lbl)
		AdvDupe2.Info.Date = lbl

		lbl = vgui.Create( "DLabel" )
		lbl:SetText(AdvDupe2.InfoText.Time or "Time:")
		lbl:SetDark(true)
		CategoryContent2:AddItem(lbl)
		AdvDupe2.Info.Time = lbl

		lbl = vgui.Create( "DLabel" )
		lbl:SetText(AdvDupe2.InfoText.Size or "Size:")
		lbl:SetDark(true)
		CategoryContent2:AddItem(lbl)
		AdvDupe2.Info.Size = lbl

		lbl = vgui.Create( "DLabel" )
		lbl:SetText(AdvDupe2.InfoText.Desc or "Desc:")
		lbl:SetDark(true)
		CategoryContent2:AddItem(lbl)
		AdvDupe2.Info.Desc = lbl

		lbl = vgui.Create( "DLabel" )
		lbl:SetText(AdvDupe2.InfoText.Entities or "Entities:")
		lbl:SetDark(true)
		CategoryContent2:AddItem(lbl)
		AdvDupe2.Info.Entities = lbl

		lbl = vgui.Create( "DLabel" )
		lbl:SetText(AdvDupe2.InfoText.Constraints or "Constraints:")
		lbl:SetDark(true)
		CategoryContent2:AddItem(lbl)
		AdvDupe2.Info.Constraints = lbl

	--[[Contraption Spawner]]--
		local Category3 = vgui.Create("DCollapsibleCategory")
		CPanel:AddItem(Category3)
		Category3:SetLabel("Contraption Spawner")
		Category3:SetExpanded(0)

		local CategoryContent3 = vgui.Create( "DPanelList" )
		CategoryContent3:SetAutoSize( true )
		CategoryContent3:SetDrawBackground( false )
		CategoryContent3:SetSpacing( 3 )
		CategoryContent3:SetPadding( 2 )
		Category3:SetContents( CategoryContent3 )
		CategoryContent3.OnMouseWheeled = function(self, dlta) parent:OnMouseWheeled(dlta) end

		local ctrl = vgui.Create( "CtrlNumPad" )
		ctrl:SetConVar1( "advdupe2_contr_spawner_key" )
		ctrl:SetConVar2( "advdupe2_contr_spawner_undo_key" )
		ctrl:SetLabel1( "Spawn Key")
		ctrl:SetLabel2( "Undo Key" )
		CategoryContent3:AddItem(ctrl)

		NumSlider = vgui.Create( "DNumSlider" )
		NumSlider:SetText( "Spawn Delay" )
		NumSlider.Label:SetDark(true)
		if(game.SinglePlayer())then
			NumSlider:SetMin( 0 )
		else
			local min = tonumber(GetConVarString("AdvDupe2_MinContraptionSpawnDelay")) or 0.2
			if(tonumber(LocalPlayer():GetInfo("advdupe2_contr_spawner_delay"))<min)then
				RunConsoleCommand("advdupe2_contr_spawner_delay", tostring(min))
			end
			NumSlider:SetMin( min )
		end
		NumSlider:SetMax(60)
		NumSlider:SetDecimals( 1 )
		NumSlider:SetConVar("advdupe2_contr_spawner_delay")
		CategoryContent3:AddItem(NumSlider)

		NumSlider = vgui.Create( "DNumSlider" )
		NumSlider:SetText( "Undo Delay" )
		NumSlider.Label:SetDark(true)
		if(game.SinglePlayer())then
			NumSlider:SetMin( 0 )
			NumSlider:SetMax( 60 )
		else
			local min = tonumber(GetConVarString("AdvDupe2_MinContraptionUndoDelay")) or 10
			local max = tonumber(GetConVarString("AdvDupe2_MaxContraptionUndoDelay")) or 60
			if(tonumber(LocalPlayer():GetInfo("advdupe2_contr_spawner_undo_delay")) < min)then
				RunConsoleCommand("advdupe2_contr_spawner_undo_delay", tostring(min))
			elseif(tonumber(LocalPlayer():GetInfo("advdupe2_contr_spawner_undo_delay")) > max)then
				RunConsoleCommand("advdupe2_contr_spawner_undo_delay", tostring(max))
			end
			NumSlider:SetMin( min )
			NumSlider:SetMax( max )
		end
		NumSlider:SetDecimals( 1 )
		NumSlider:SetConVar("advdupe2_contr_spawner_undo_delay")
		CategoryContent3:AddItem(NumSlider)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Disable gravity for all spawned props" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_contr_spawner_disgrav" )
		Check:SetValue( 0 )
		CategoryContent3:AddItem(Check)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Disable drag for all spawned props" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_contr_spawner_disdrag" )
		Check:SetValue( 0 )
		CategoryContent3:AddItem(Check)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Add spawner's velocity to contraption" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_contr_spawner_addvel" )
		Check:SetValue( 1 )
		CategoryContent3:AddItem(Check)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Disable drawing spawner props" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_contr_spawner_hideprops" )
		Check:SetValue( 0 )
		CategoryContent3:AddItem(Check)

		--[[Area Auto Save]]--
		local Category4 = vgui.Create("DCollapsibleCategory")
		CPanel:AddItem(Category4)
		Category4:SetLabel("Area Auto Save")
		Category4:SetExpanded(0)

		local CategoryContent4 = vgui.Create( "DPanelList" )
		CategoryContent4:SetAutoSize( true )
		CategoryContent4:SetDrawBackground( false )
		CategoryContent4:SetSpacing( 3 )
		CategoryContent4:SetPadding( 2 )
		Category4:SetContents( CategoryContent4 )
		CategoryContent4.OnMouseWheeled = function(self, dlta) parent:OnMouseWheeled(dlta) end

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Only copy contraption" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_auto_save_contraption" )
		Check:SetValue( 0 )
		Check:SetToolTip("Only copy a contraption instead of an area")
		CategoryContent4:AddItem(Check)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Overwrite File" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_auto_save_overwrite" )
		Check:SetValue( 1 )
		Check:SetToolTip("Overwrite the file instead of creating a new one everytime")
		CategoryContent4:AddItem(Check)

		NumSlider = vgui.Create( "DNumSlider" )
		NumSlider:SetText( "Minutes to Save:" )
		NumSlider.Label:SetDark(true)
		NumSlider:SetMin( 2 )
		NumSlider:SetMax( 30 )
		NumSlider:SetDecimals( 0 )
		NumSlider:SetConVar( "advdupe2_auto_save_time" )
		NumSlider:SetToolTip("Interval time to save in minutes")
		CategoryContent4:AddItem(NumSlider)

		local pnl = vgui.Create("Panel")
		pnl:SetWide(CPanel:GetWide()-40)
		pnl:SetTall(75)
		pnl:SetPos(0, 50)
		CategoryContent4:AddItem(pnl)

		local label = vgui.Create("DLabel", pnl)
		label:SetText("Directory: ")
		label:SizeToContents()
		label:SetDark(true)
		label:SetPos(5,7)

		AdvDupe2.AutoSavePath = ""
		local txtbox = vgui.Create("DTextEntry", pnl)
		txtbox:SetWide(pnl:GetWide()-100)
		txtbox:SetPos(60, 5)
		txtbox:SetUpdateOnType(true)
		txtbox.OnTextChanged = function(self)
			self:SetValue(AdvDupe2.AutoSavePath)
		end

		local btn = vgui.Create("DImageButton", pnl)
		local x, y = txtbox:GetPos()
		btn:SetPos(x + txtbox:GetWide() + 5, 7)
		btn:SetMaterial("icon16/folder_explore.png")
		btn:SizeToContents()
		btn:SetToolTip("Browse")
		btn.DoClick = function()
			local ScrollBar = parent.VBar
			ScrollBar:AnimateTo(0, 1, 0, 0.2)

			FileBrowser.Submit:SetMaterial("icon16/disk.png")
			FileBrowser.Submit:SetTooltip("Directory for Area Auto Save")
			if(FileBrowser.FileName:GetValue()=="Folder_Name...")then
				FileBrowser.FileName:SetValue("File_Name...")
			end
			FileBrowser.Desc:SetVisible(true)
			FileBrowser.Info:SetVisible(false)
			FileBrowser.FileName:SetVisible(true)
			FileBrowser.FileName:SelectAllOnFocus(true)
			FileBrowser.FileName:OnMousePressed()
			FileBrowser.FileName:RequestFocus()
			FileBrowser.Expanding=true
			FileBrowser:Slide(true)
			FileBrowser.Submit.DoClick = function()
				local name = FileBrowser.FileName:GetValue()
				if(name=="" or name=="File_Name...")then
					AdvDupe2.Notify("Name field is blank.", NOTIFY_ERROR)
					FileBrowser.FileName:SelectAllOnFocus(true)
					FileBrowser.FileName:OnGetFocus()
					FileBrowser.FileName:RequestFocus()
					return
				end
				local desc = FileBrowser.Desc:GetValue()
				if(desc=="Description...")then desc="" end

				if(not IsValid(FileBrowser.Browser.pnlCanvas.m_pSelectedItem) or FileBrowser.Browser.pnlCanvas.m_pSelectedItem.Derma.ClassName~="advdupe2_browser_folder")then
					AdvDupe2.Notify("Folder to save Area Auto Save not selected.", NOTIFY_ERROR)
					return
				end

				FileBrowser.AutoSaveNode = FileBrowser.Browser.pnlCanvas.m_pSelectedItem
				txtbox:SetValue(FileBrowser:GetFullPath(FileBrowser.Browser.pnlCanvas.m_pSelectedItem)..name)
				AdvDupe2.AutoSavePath = txtbox:GetValue()
				txtbox:SetToolTip(txtbox:GetValue())
				AdvDupe2.AutoSaveDesc = desc

				FileBrowser:Slide(false)
				ScrollBar:AnimateTo(ScrollBar.CanvasSize, 1, 0, 0.2)

				RunConsoleCommand("AdvDupe2_SetStage")
				hook.Add("HUDPaint", "AdvDupe2_DrawSelectionBox", AdvDupe2.DrawSelectionBox)
			end
			FileBrowser.FileName.OnEnter = function()
				FileBrowser.FileName:KillFocus()
				FileBrowser.Desc:SelectAllOnFocus(true)
				FileBrowser.Desc.OnMousePressed()
				FileBrowser.Desc:RequestFocus()
			end
			FileBrowser.Desc.OnEnter = FileBrowser.Submit.DoClick
		end

		btn = vgui.Create("DButton", pnl)
		btn:SetSize(50, 35)
		btn:SetPos(pnl:GetWide()/4-10, 30)
		btn:SetText("Show")
		btn.DoClick = function()
			if(AdvDupe2.AutoSavePos)then
				RunConsoleCommand("advdupe2_area_copy_size", AdvDupe2.AutoSaveSize)
				LocalPlayer():SetEyeAngles( (AdvDupe2.AutoSavePos - LocalPlayer():GetShootPos()):Angle() )
				RunConsoleCommand("AdvDupe2_SetStage")
				hook.Add("HUDPaint", "AdvDupe2_DrawSelectionBox", AdvDupe2.DrawSelectionBox)
			end
		end

		btn = vgui.Create("DButton", pnl)
		btn:SetSize(50, 35)
		btn:SetPos((pnl:GetWide()/4)*3-40, 30)
		btn:SetText("Turn Off")
		btn:SetDisabled(true)
		btn.DoClick = function(self)
			RunConsoleCommand("AdvDupe2_RemoveAutoSave")
			self:SetDisabled(true)
			AdvDupe2.AutoSavePos = nil
		end
		AdvDupe2.OffButton = btn


		--[[Experimental Section]]--
		local Category5 = vgui.Create("DCollapsibleCategory")
		CPanel:AddItem(Category5)
		Category5:SetLabel("Experimental Section")
		Category5:SetExpanded(0)

		local CategoryContent5 = vgui.Create( "DPanelList" )
		CategoryContent5:SetAutoSize( true )
		CategoryContent5:SetDrawBackground( false )
		CategoryContent5:SetSpacing( 3 )
		CategoryContent5:SetPadding( 2 )
		Category5:SetContents( CategoryContent5 )
		CategoryContent5.OnMouseWheeled = function(self, dlta) parent:OnMouseWheeled(dlta) end

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Disable parented props physics interaction" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_paste_disparents" )
		Check:SetValue( 0 )
		CategoryContent5:AddItem(Check)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Disable Dupe Spawn Protection" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_paste_protectoveride" )
		Check:SetValue( 1 )
		Check:SetToolTip("Check this if you things don't look right after pasting.")
		CategoryContent5:AddItem(Check)

		Check = vgui.Create("DCheckBoxLabel")
		Check:SetText( "Open file after Saving" )
		Check:SetDark(true)
		Check:SetConVar( "advdupe2_debug_openfile" )
		Check:SetValue( 1 )
		Check:SetToolTip("Check this if you want your files to be opened after saving them.")
		CategoryContent5:AddItem(Check)

		--[[Save Map]]--
		if(LocalPlayer():IsAdmin())then
			local Category6 = vgui.Create("DCollapsibleCategory")
			CPanel:AddItem(Category6)
			Category6:SetLabel("Save Map")
			Category6:SetExpanded(0)

			local CategoryContent6 = vgui.Create( "DPanelList" )
			CategoryContent6:SetAutoSize( true )
			CategoryContent6:SetDrawBackground( false )
			CategoryContent6:SetSpacing( 3 )
			CategoryContent6:SetPadding( 2 )
			Category6:SetContents( CategoryContent6 )
			CategoryContent6.OnMouseWheeled = function(self, dlta) parent:OnMouseWheeled(dlta) end

			pnl = vgui.Create("Panel")
			pnl:SetWide(CPanel:GetWide()-40)
			pnl:SetTall(75)
			pnl:SetPos(0, 50)
			CategoryContent6:AddItem(pnl)

			label = vgui.Create("DLabel", pnl)
			label:SetText("File Name: ")
			label:SizeToContents()
			label:SetDark(true)
			label:SetPos(5,7)

			AdvDupe2.AutoSavePath = ""

			local txtbox2 = vgui.Create("DTextEntry", pnl)
			txtbox2:SetWide(pnl:GetWide()-100)
			txtbox2:SetPos(60, 5)

			local btn2 = vgui.Create("DImageButton", pnl)
			x, y = txtbox2:GetPos()
			btn2:SetPos(x + txtbox2:GetWide() + 5, 7)
			btn2:SetMaterial("icon16/disk.png")
			btn2:SizeToContents()
			btn2:SetToolTip("Save Map")
			btn2.DoClick = 	function()
				if(txtbox2:GetValue()=="")then return end
				RunConsoleCommand("AdvDupe2_SaveMap", txtbox2:GetValue())
			end
			txtbox2.OnEnter = function()
				btn2:DoClick()
			end
		end
	end

	function TOOL.BuildCPanel(panel)
		panel:ClearControls()
		panel:AddControl("Header", {
			Text = "Advanced Duplicator 2",
			Description = "Duplicate stuff."
		})
		local function tryToBuild()
			local CPanel = controlpanel.Get("advdupe2")
			if CPanel and CPanel:GetWide()>16 then
				BuildCPanel(CPanel)
			else
				timer.Simple(0.1,tryToBuild)
			end
		end
		tryToBuild()
	end

	local state = 0
	local ToColor = {r=25, g=100, b=40, a=255}
	local CurColor = {r=25, g=100, b=40, a=255}
	local rate
	surface.CreateFont ("AD2Font", {font="Arial", size=40, weight=1000}) ---Remember to use gm_clearfonts
	surface.CreateFont ("AD2TitleFont", {font="Arial", size=24, weight=1000})
	function TOOL:DrawToolScreen()
		if(not AdvDupe2)then return true end

		local text = "Ready"
		if(AdvDupe2.Preview)then
			text = "Preview"
		end
		local state=0
		if(AdvDupe2.ProgressBar.Text)then
			state=1
			text = AdvDupe2.ProgressBar.Text
		end

		cam.Start2D()

			surface.SetDrawColor(32, 32, 32, 255)
			surface.DrawRect(0, 0, 256, 256)

			if(state==0)then
				ToColor = {r=25, g=100, b=40, a=255}
			else
				ToColor = {r=130, g=25, b=40, a=255}
			end

			rate = FrameTime()*160
			CurColor.r = math.Approach( CurColor.r, ToColor.r, rate )
			CurColor.g = math.Approach( CurColor.g, ToColor.g, rate )

			surface.SetDrawColor(CurColor)
			surface.DrawRect(13, 13, 230, 230)

			surface.SetTextColor( 255, 255, 255, 255 )

			draw.SimpleText("Advanced Duplicator 2", "AD2TitleFont", 128, 50, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
			draw.SimpleText(text, "AD2Font", 128, 128, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			if(state~=0)then
				draw.RoundedBox( 6, 32, 178, 192, 28, Color( 255, 255, 255, 150 ) )
				draw.RoundedBox( 6, 36, 182, 188*(AdvDupe2.ProgressBar.Percent/100), 24, Color( 0, 255, 0, 255 ) )
			elseif(LocalPlayer():KeyDown(IN_USE))then
				draw.SimpleText("Height: "..LocalPlayer():GetInfo("advdupe2_offset_z"), "AD2TitleFont", 25, 160, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
				draw.SimpleText("Pitch: "..LocalPlayer():GetInfo("advdupe2_offset_pitch"), "AD2TitleFont", 25, 190, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
				draw.SimpleText("Yaw: "..LocalPlayer():GetInfo("advdupe2_offset_yaw"), "AD2TitleFont", 25, 220, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
			end

		cam.End2D()
	end


	local function FindInBox(min, max, ply)

		local Entities = ents.GetAll()
		local EntTable = {}
		for _,ent in pairs(Entities) do
			local pos = ent:GetPos()
			if (pos.X>=min.X) and (pos.X<=max.X) and (pos.Y>=min.Y) and (pos.Y<=max.Y) and (pos.Z>=min.Z) and (pos.Z<=max.Z) then
				--if(ent:GetClass()~="C_BaseFlexclass")then
					EntTable[ent:EntIndex()] = ent
				--end
			end
		end

		return EntTable
	end


	local GreenSelected = Color(0, 255, 0, 255)
	function AdvDupe2.DrawSelectionBox()

		local TraceRes = util.TraceLine(util.GetPlayerTrace(LocalPlayer()))
		local i = math.Clamp(tonumber(LocalPlayer():GetInfo("advdupe2_area_copy_size")) or 50, 0, 30720)
				
		--Bottom Points
		local B1 = (Vector(-i,-i,-i)+TraceRes.HitPos)
		local B2 = (Vector(-i,i,-i)+TraceRes.HitPos)
		local B3 = (Vector(i,i,-i)+TraceRes.HitPos)
		local B4 = (Vector(i,-i,-i)+TraceRes.HitPos)

		--Top Points
		local T1 = (Vector(-i,-i,i)+TraceRes.HitPos):ToScreen()
		local T2 = (Vector(-i,i,i)+TraceRes.HitPos):ToScreen()
		local T3 = (Vector(i,i,i)+TraceRes.HitPos):ToScreen()
		local T4 = (Vector(i,-i,i)+TraceRes.HitPos):ToScreen()

		if(not AdvDupe2.LastUpdate or CurTime()>=AdvDupe2.LastUpdate)then

			if AdvDupe2.ColorEntities then
				for k,v in pairs(AdvDupe2.EntityColors)do
					local ent = AdvDupe2.ColorEntities[k]
					if(IsValid(ent))then
						AdvDupe2.ColorEntities[k]:SetColor(v)
					end
				end
			end

			local Entities = FindInBox(B1, (Vector(i,i,i)+TraceRes.HitPos), LocalPlayer())
			AdvDupe2.ColorEntities = Entities
			AdvDupe2.EntityColors = {}
			for k,v in pairs(Entities)do
				AdvDupe2.EntityColors[k] = v:GetColor()
				v:SetColor(GreenSelected)
			end
			AdvDupe2.LastUpdate = CurTime()+0.25

		end

		local tracedata = {}
		tracedata.mask = MASK_NPCWORLDSTATIC
		local WorldTrace

		tracedata.start = B1+Vector(0,0,i*2)
		tracedata.endpos = B1
		WorldTrace = util.TraceLine( tracedata )
		B1 = WorldTrace.HitPos:ToScreen()
		tracedata.start = B2+Vector(0,0,i*2)
		tracedata.endpos = B2
		WorldTrace = util.TraceLine( tracedata )
		B2 = WorldTrace.HitPos:ToScreen()
		tracedata.start = B3+Vector(0,0,i*2)
		tracedata.endpos = B3
		WorldTrace = util.TraceLine( tracedata )
		B3 = WorldTrace.HitPos:ToScreen()
		tracedata.start = B4+Vector(0,0,i*2)
		tracedata.endpos = B4
		WorldTrace = util.TraceLine( tracedata )
		B4 = WorldTrace.HitPos:ToScreen()

		surface.SetDrawColor( 0, 255, 0, 255 )

		--Draw Sides
		surface.DrawLine(B1.x, B1.y, T1.x, T1.y)
		surface.DrawLine(B2.x, B2.y, T2.x, T2.y)
		surface.DrawLine(B3.x, B3.y, T3.x, T3.y)
		surface.DrawLine(B4.x, B4.y, T4.x, T4.y)

		--Draw Bottom
		surface.DrawLine(B1.x, B1.y, B2.x, B2.y)
		surface.DrawLine(B2.x, B2.y, B3.x, B3.y)
		surface.DrawLine(B3.x, B3.y, B4.x, B4.y)
		surface.DrawLine(B4.x, B4.y, B1.x, B1.y)

		--Draw Top
		surface.DrawLine(T1.x, T1.y, T2.x, T2.y)
		surface.DrawLine(T2.x, T2.y, T3.x, T3.y)
		surface.DrawLine(T3.x, T3.y, T4.x, T4.y)
		surface.DrawLine(T4.x, T4.y, T1.x, T1.y)

	end

	usermessage.Hook("AdvDupe2_DrawSelectBox",function()
		hook.Add("HUDPaint", "AdvDupe2_DrawSelectionBox", AdvDupe2.DrawSelectionBox)
	end)

	function AdvDupe2.RemoveSelectBox()
		hook.Remove("HUDPaint", "AdvDupe2_DrawSelectionBox")
		if AdvDupe2.ColorEntities then
			for k,v in pairs(AdvDupe2.EntityColors)do
				if(not IsValid(AdvDupe2.ColorEntities[k]))then
					AdvDupe2.ColorEntities[k]=nil
				else
					AdvDupe2.ColorEntities[k]:SetColor(v)
				end
			end
			AdvDupe2.ColorEntities={}
			AdvDupe2.EntityColors={}
		end
	end
	usermessage.Hook("AdvDupe2_RemoveSelectBox",function()
		AdvDupe2.RemoveSelectBox()
	end)

	function AdvDupe2.InitProgressBar(label)
		AdvDupe2.ProgressBar = {}
		AdvDupe2.ProgressBar.Text = label
		AdvDupe2.ProgressBar.Percent = 0
		AdvDupe2.BusyBar = true
	end
	usermessage.Hook("AdvDupe2_InitProgressBar",function(um)
		AdvDupe2.InitProgressBar(um:ReadString())
	end)

	usermessage.Hook("AdvDupe2_UpdateProgressBar",function(um)
		AdvDupe2.ProgressBar.Percent = um:ReadChar()
	end)

	function AdvDupe2.RemoveProgressBar()
		AdvDupe2.ProgressBar = {}
		AdvDupe2.BusyBar = false
		if(AdvDupe2.Ghosting)then
			AdvDupe2.InitProgressBar("Ghosting: ")
			AdvDupe2.BusyBar = false
			AdvDupe2.ProgressBar.Percent = AdvDupe2.CurrentGhost/AdvDupe2.TotalGhosts*100
		end
	end
	usermessage.Hook("AdvDupe2_RemoveProgressBar",function(um)
		AdvDupe2.RemoveProgressBar()
	end)

	usermessage.Hook("AdvDupe2_ResetOffsets",function(um)
		RunConsoleCommand("advdupe2_original_origin", "0")
		RunConsoleCommand("advdupe2_paste_constraints","1")
		RunConsoleCommand("advdupe2_offset_z","0")
		RunConsoleCommand("advdupe2_offset_pitch","0")
		RunConsoleCommand("advdupe2_offset_yaw","0")
		RunConsoleCommand("advdupe2_offset_roll","0")
		RunConsoleCommand("advdupe2_paste_parents","1")
		RunConsoleCommand("advdupe2_paste_disparents","0")
	end)

	usermessage.Hook("AdvDupe2_ReportModel",function(um)
		print("Advanced Duplicator 2: Invalid Model: "..um:ReadString())
	end)

	usermessage.Hook("AdvDupe2_ReportClass",function(um)
		print("Advanced Duplicator 2: Invalid Class: "..um:ReadString())
	end)

	usermessage.Hook("AdvDupe2_ResetDupeInfo", function(um)
		if not AdvDupe2.Info then return end
		AdvDupe2.Info.File:SetText("File:")
		AdvDupe2.Info.Creator:SetText("Creator:")
		AdvDupe2.Info.Date:SetText("Date:")
		AdvDupe2.Info.Time:SetText("Time:")
		AdvDupe2.Info.Size:SetText("Size:")
		AdvDupe2.Info.Desc:SetText("Desc:")
		AdvDupe2.Info.Entities:SetText("Entities:")
		AdvDupe2.Info.Constraints:SetText("Constraints:")
	end)

	usermessage.Hook("AdvDupe2_CanAutoSave", function(um)
		if(AdvDupe2.AutoSavePath~="")then
			AdvDupe2.AutoSavePos = um:ReadVector()
			AdvDupe2.AutoSaveSize = um:ReadShort()
			local ent = um:ReadShort()
			AdvDupe2.OffButton:SetDisabled(false)
			net.Start("AdvDupe2_CanAutoSave")
				net.WriteString(AdvDupe2.AutoSaveDesc)
				net.WriteInt(ent, 16)
				if(game.SinglePlayer())then
					net.WriteString(string.sub(AdvDupe2.AutoSavePath, 10, #AdvDupe2.AutoSavePath))
				end
			net.SendToServer()
		else
			AdvDupe2.Notify("Select a directory for the Area Auto Save.", NOTIFY_ERROR)
		end
	end)

	net.Receive("AdvDupe2_SetDupeInfo", function(len, ply, len2)
		if AdvDupe2.Info then
			AdvDupe2.Info.File:SetText("File: "..net.ReadString())
			AdvDupe2.Info.Creator:SetText("Creator: "..net.ReadString())
			AdvDupe2.Info.Date:SetText("Date: "..net.ReadString())
			AdvDupe2.Info.Time:SetText("Time: "..net.ReadString())
			AdvDupe2.Info.Size:SetText("Size: "..net.ReadString())
			AdvDupe2.Info.Desc:SetText("Desc: "..net.ReadString())
			AdvDupe2.Info.Entities:SetText("Entities: "..net.ReadString())
			AdvDupe2.Info.Constraints:SetText("Constraints: "..net.ReadString())
		else
			AdvDupe2.InfoText.File = "File: "..net.ReadString()
			AdvDupe2.InfoText.Creator = "Creator: "..net.ReadString()
			AdvDupe2.InfoText.Date = "Date: "..net.ReadString()
			AdvDupe2.InfoText.Time = "Time: "..net.ReadString()
			AdvDupe2.InfoText.Size = "Size: "..net.ReadString()
			AdvDupe2.InfoText.Desc = "Desc: "..net.ReadString()
			AdvDupe2.InfoText.Entities = "Entities: "..net.ReadString()
			AdvDupe2.InfoText.Constraints = "Constraints: "..net.ReadString()
		end
	end)
end

--PATH addons/m9k/lua/weapons/m9k_amd65/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_amd65/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_amd65")					-- must be the name of your swep
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
SWEP.PrintName				= "AMD 65"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 24			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight				= 30			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "ar2"		-- how others view you carrying the weapon

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_amd_65.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_amd_65.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("amd65.single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 800			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 20		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.2		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.1		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.1		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "Rifle"

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 20	-- Base damage per bullet
SWEP.Primary.Spread		= .001	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- Ironsight accuracy, should be the same for shotguns


SWEP.SelectiveFire		= true

//just cleaning up an empty spot that bugs me
SWEP.VElements = {
	["element"] = { type = "Model", model = "models/Mechanics/wheels/wheel_speed_72.mdl", bone = "Havana Daydreamin", rel = "", pos = Vector(-0.15, -5.336, 1.608), angle = Angle(0, 0, 90), size = Vector(0.009, 0.009, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.IronSightsPos = Vector(3.5, -2.21, 2.115)
SWEP.IronSightsAng = Vector(-3.701, 0, 0)
SWEP.SightsPos = Vector(3.5, -2.21, 2.115)
SWEP.SightsAng = Vector(-3.701, 0, 0)
SWEP.RunSightsPos = Vector(-5.198, -9.164, 0)
SWEP.RunSightsAng = Vector(-8.825, -70, 0)


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
--PATH addons/m9k/lua/weapons/m9k_aw50/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_aw50/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_aw50") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "AI AW50"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 50			-- Position in the slot
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
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_aw50_awp.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_acc_int_aw50.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_scoped_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weaponaw50.Single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 50		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 10		-- Size of a clip
SWEP.Primary.DefaultClip			= 60	-- Bullets you start with
SWEP.Primary.KickUp				= 1				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 1			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 1		-- Maximum up recoil (stock)
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
SWEP.Primary.Damage		= 95	--base damage per bullet
SWEP.Primary.Spread		= .01	--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .0001 -- ironsight accuracy, should be the same for shotguns

-- enter iron sight info and bone mod info below

SWEP.IronSightsPos = Vector(3.68, 0, 1.08)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(3.68, 0, 1.08)
SWEP.SightsAng = Vector(0, 0, 0)
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
--PATH addons/m9k/lua/weapons/m9k_coltpython/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_coltpython/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_coltpython") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "Colt Python"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 1				-- Slot in the weapon selection menu
SWEP.SlotPos				= 57			-- Position in the slot
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
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_pist_python.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_colt_python.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Weapon_ColtPython.Single")		-- Script that calls the primary fire sound
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

SWEP.Primary.NumShots	= 1		--how many bullets to shoot, use with shotguns
SWEP.Primary.Damage		= 29	--base damage, scaled by game
SWEP.Primary.Spread		= .001	--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- has to be the same as primary.spread

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(-2.743, -1.676, 1.796)
SWEP.IronSightsAng = Vector(0.611, 0.185, 0)
SWEP.SightsPos = Vector(-2.743, -1.676, 1.796)
SWEP.SightsAng = Vector(0.611, 0.185, 0)
SWEP.RunSightsPos = Vector(2.124, -9.365, -3.987)
SWEP.RunSightsAng = Vector(48.262, -8.214, 0)

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
--PATH addons/m9k/lua/weapons/m9k_m14sp/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_m14sp/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_m14sp") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "M14"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
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

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_snip_m14sp.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_snip_m14sp.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Weapon_M14SP.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 750			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 20		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.6		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.6		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.6		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "Rifle"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 45		-- How much you 'zoom' in. Less is more! 	

SWEP.SelectiveFire		= true

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 32	-- Base damage per bullet
SWEP.Primary.Spread		= .01	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector (-2.7031, -1.0539, 1.6562)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (-2.7031, -1.0539, 1.6562)
SWEP.SightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector (0.9642, -0.6371, 0.4936)
SWEP.RunSightsAng = Vector (-11.0116, 47.5223, -15.3199)

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
--PATH addons/m9k/lua/weapons/m9k_m92beretta/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_m92beretta/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_m92beretta") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "M92 Beretta"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 1				-- Slot in the weapon selection menu
SWEP.SlotPos				= 26			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_pistberettam92.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_beretta_m92.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Weapon_m92b.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 500			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 15		-- Size of a clip
SWEP.Primary.DefaultClip		= 45		-- Bullets you start with
SWEP.Primary.KickUp				= 1		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.5		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.5		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "Pistol"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 65		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		//how many bullets to shoot, use with shotguns
SWEP.Primary.Damage		= 18	//base damage, scaled by game
SWEP.Primary.Spread		= .001	//define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 // has to be the same as primary.spread

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(-2.379, 0, 1.205)
SWEP.IronSightsAng = Vector(0.05, 0, 0)
SWEP.SightsPos = Vector(-2.379, 0, 1.205)
SWEP.SightsAng = Vector(0.05, 0, 0)
SWEP.RunSightsPos = Vector(3.444, -7.823, -6.27)
SWEP.RunSightsAng = Vector(60.695, 0, 0)
-- SWEP.RunSightsPos = Vector(0, 0, 0)
-- SWEP.RunSightsAng = Vector(-10.903, 6.885, 0)

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
--PATH addons/m9k/lua/weapons/m9k_m98b/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_m98b/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_m98b") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "Barret M98B"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 44			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_m98bravo.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_barrett_m98b.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_scoped_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("M98.Single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 50		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 10		-- Size of a clip
SWEP.Primary.DefaultClip			= 60	-- Bullets you start with
SWEP.Primary.KickUp				= 1				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 1			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 1		-- Maximum up recoil (stock)
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
SWEP.Primary.IronAccuracy = .0001 -- ironsight accuracy, should be the same for shotguns

-- enter iron sight info and bone mod info below

SWEP.IronSightsPos = Vector(-2.196, -2, 1)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(-2.196, -2, 1)
SWEP.SightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector(3.714, -3.714, 0.286)
SWEP.RunSightsAng = Vector(-7, 43, 0)


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
--PATH addons/m9k/lua/weapons/m9k_magpulpdr/shared.lua:
-- Variables that are used on both client and server
SWEP.Gun = ("m9k_magpulpdr") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "Magpul PDR"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 45			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_pdr_smg.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_magpul_pdr.mdl"	-- Weapon world model 
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("MAG_PDR.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 800			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.2		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.1		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.1		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "smg1"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.SelectiveFire		= true

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 22	-- Base damage per bullet
SWEP.Primary.Spread		= .001	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(4.8, 0, 2.079)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(4.8, 0, 2.079)
SWEP.SightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector(-2.437, -1.364, 1.45)
SWEP.RunSightsAng = Vector(-15.263, -41.1, 0)


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
--PATH addons/m9k/lua/weapons/m9k_mp9/shared.lua:
-- Variables that are used on both client and server
SWEP.Gun = ("m9k_mp9") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "MP9"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 49			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_b_t_mp9.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_brugger_thomet_mp9.mdl"	-- Weapon world model 
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Weapon_mp9.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 900			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.2		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.1		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.1		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "Rifle"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.SelectiveFire		= true

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 19	-- Base damage per bullet
SWEP.Primary.Spread		= .001	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(4.073, -3.438, 1.259)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(4.073, -3.438, 1.259)
SWEP.SightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector(-3.708, -6.172, 0)
SWEP.RunSightsAng = Vector(-7.661, -62.523, 0)


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
--PATH addons/m9k/lua/weapons/m9k_psg1/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_psg1/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_psg1") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "PSG-1"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 45			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_psg1_snipe.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_hk_psg1.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_scoped_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_psg_1.Single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 500		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 10		-- Size of a clip
SWEP.Primary.DefaultClip			= 60	-- Bullets you start with
SWEP.Primary.KickUp				= 1				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 1			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 1		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "Rifle"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
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
SWEP.Primary.Damage		= 90	--base damage per bullet
SWEP.Primary.Spread		= .01	--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .0001 -- ironsight accuracy, should be the same for shotguns

-- enter iron sight info and bone mod info below

SWEP.IronSightsPos = Vector(5.2, 0, 1.16)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(5.2, 0, 1.16)
SWEP.SightsAng = Vector(0, 0, 0)
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
--PATH addons/m9k/lua/weapons/m9k_remington7615p/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_remington7615p/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_remington7615p") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "Remington 7615P"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 46			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox		= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   	= false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= false		-- Set false if you want no crosshair from hip
SWEP.XHair					= false		-- Used for returning crosshair after scope. Must be the same as DrawCrosshair
SWEP.Weight				= 50			-- Rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= false		-- Auto switch from if you pick up a better weapon
SWEP.BoltAction				= true		-- Is this a bolt action rifle?
SWEP.HoldType 				= "ar2"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_remington_7615p.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_remington_7615p.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_scoped_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("7615p_remington.Single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 50		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 10		-- Size of a clip
SWEP.Primary.DefaultClip			= 60	-- Bullets you start with
SWEP.Primary.KickUp				= 1				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 1			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 1		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "Rifle"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.ScopeZoom			= 7	
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
SWEP.Primary.Damage		= 35	--base damage per bullet
SWEP.Primary.Spread		= .01	--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .001 -- ironsight accuracy, should be the same for shotguns

-- enter iron sight info and bone mod info below

SWEP.IronSightsPos = Vector(3.079, -1.333, 0.437)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(3.079, -1.333, 0.437)
SWEP.SightsAng = Vector(0, 0, 0)
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
--PATH addons/m9k/lua/weapons/m9k_sten/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_sten/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_sten") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "STEN"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 52			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_smgsten.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_sten.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Weaponsten.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 500			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 32		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.6		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.4		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.5		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "smg1"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 20	-- Base damage per bullet
SWEP.Primary.Spread		= .03	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .016 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(4.367, -1.476, 3.119)
SWEP.IronSightsAng = Vector(-0.213, -0.426, 0)
SWEP.SightsPos = Vector(4.367, -1.476, 3.119)
SWEP.SightsAng = Vector(-0.213, -0.426, 0)
SWEP.RunSightsPos = Vector (-2.3095, -3.0514, 2.3965)
SWEP.RunSightsAng = Vector (-19.8471, -33.9181, 10)

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
--PATH addons/m9k/lua/weapons/m9k_usc/shared.lua:
--[[
Server Name: Русский FastRP #1 [Быстрая загрузка][M9K]
Server IP:   37.230.137.126:27015
File Path:   addons/rp_wep/lua/weapons/m9k_usc/shared.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

-- Variables that are used on both client and server
SWEP.Gun = ("m9k_usc") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "HK USC"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 56			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_hkoch_usc.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_hk_usc.mdl"	-- Weapon world model 
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Weapon_hkusc.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 600			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 25		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.2		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.4		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.45		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "smg1"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 23	-- Base damage per bullet
SWEP.Primary.Spread		= .02	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .01 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(4.698, -2.566, 2.038)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(4.698, -2.566, 2.038)
SWEP.SightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector(-3.814, -8.615, 0)
SWEP.RunSightsAng = Vector(-9.016, -64.764, 0)

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
--PATH gamemodes/darkrp/entities/weapons/stick_base/shared.lua:
AddCSLuaFile()

if CLIENT then
    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = false
end

DEFINE_BASECLASS("weapon_cs_base2")

SWEP.Author = "DarkRP Developers"
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.IconLetter = ""

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix = "stunstick"

SWEP.AdminOnly = true

SWEP.StickColor = Color(255, 255, 255)

SWEP.ViewModel = Model("models/weapons/v_stunbaton.mdl")
SWEP.WorldModel = Model("models/weapons/w_stunbaton.mdl")

SWEP.Sound = Sound("weapons/stunstick/stunstick_swing1.wav")

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

local stunstickMaterials
function SWEP:Initialize()
    self:SetHoldType("normal")

    self.stickRange = 90

    if SERVER then return end

    stunstickMaterials = stunstickMaterials or {}

    local materialName = "darkrp/" .. self:GetClass()
    if stunstickMaterials[materialName] then return end

    CreateMaterial(materialName, "VertexLitGeneric", {
        ["$basetexture"] = "models/debug/debugwhite",
        ["$surfaceprop"] = "metal",
        ["$envmap"] = "env_cubemap",
        ["$envmaptint"] = "[ .5 .5 .5 ]",
        ["$selfillum"] = 0,
        ["$model"] = 1
    }):SetVector("$color2", self.StickColor:ToVector())

    stunstickMaterials[materialName] = true
end

function SWEP:SetupDataTables()
    BaseClass.SetupDataTables(self)
    -- Bool 0 = Ironsights
    -- Bool 1 = Reloading
    self:NetworkVar("Bool", 2, "SeqIdling")
    -- Float 0 = LastPrimaryAttack
    -- Float 1 = ReloadEndTime
    -- Float 2 = BurstTime
    -- Float 3 = LastNonBurst
    self:NetworkVar("Float", 4, "SeqIdleTime")
    self:NetworkVar("Float", 5, "HoldTypeChangeTime")
end

function SWEP:Deploy()
    BaseClass.Deploy(self)
    if SERVER then
        self:SetMaterial("!darkrp/" .. self:GetClass())
    end

    local vm = self:GetOwner():GetViewModel()
    if not IsValid(vm) then return true end

    vm:SendViewModelMatchingSequence(vm:LookupSequence("idle01"))

    return true
end

function SWEP:PreDrawViewModel(vm)
    if not IsValid(vm) then return end
    for i = 9, 15 do
        vm:SetSubMaterial(i, "!darkrp/" .. self:GetClass())
    end
end

function SWEP:ViewModelDrawn(vm)
    if not IsValid(vm) then return end
    vm:SetSubMaterial() -- clear sub-materials
end

function SWEP:ResetStick()
    if not IsValid(self:GetOwner()) then return end
    if SERVER then
        self:SetMaterial() -- clear material
    end
    self:SetSeqIdling(false)
    self:SetSeqIdleTime(0)
    self:SetHoldTypeChangeTime(0)
end

function SWEP:Holster()
    BaseClass.Holster(self)
    self:ResetStick()
    return true
end

function SWEP:Think()
    if self:GetSeqIdling() then
        self:SetSeqIdling(false)

        if not IsValid(self:GetOwner()) then return end
        self:GetOwner():SetAnimation(PLAYER_ATTACK1)
        self:EmitSound(self.Sound)

        local vm = self:GetOwner():GetViewModel()
        if not IsValid(vm) then return end
        vm:SendViewModelMatchingSequence(vm:LookupSequence("attackch"))
        vm:SetPlaybackRate(1 + 1 / 3)
        local duration = vm:SequenceDuration() / vm:GetPlaybackRate()
        local time = CurTime() + duration
        self:SetSeqIdleTime(time)
        self:SetNextPrimaryFire(time)
    end
    if self:GetSeqIdleTime() ~= 0 and CurTime() >= self:GetSeqIdleTime() then
        self:SetSeqIdleTime(0)

        if not IsValid(self:GetOwner()) then return end
        local vm = self:GetOwner():GetViewModel()
        if not IsValid(vm) then return end
        vm:SendViewModelMatchingSequence(vm:LookupSequence("idle01"))
    end
    if self:GetHoldTypeChangeTime() ~= 0 and CurTime() >= self:GetHoldTypeChangeTime() then
        self:SetHoldTypeChangeTime(0)
        self:SetHoldType("normal")
    end
end

function SWEP:PrimaryAttack()
    self:SetHoldType("melee")
    self:SetHoldTypeChangeTime(CurTime() + 0.3)

    self:SetNextPrimaryFire(CurTime() + 0.51) -- Actual delay is set later.

    local vm = self:GetOwner():GetViewModel()
    if IsValid(vm) then
        vm:SendViewModelMatchingSequence(vm:LookupSequence("idle01"))
        self:SetSeqIdling(true)
    end
end

function SWEP:SecondaryAttack()
    -- Do nothing
end

function SWEP:Reload()
    -- Do nothing
end

--PATH addons/weaponandcontent/lua/weapons/swb_base/sh_bullets.lua:
local Dir, Dir2, dot, sp, ent, trace, seed, hm
local trace_normal = bit.bor(CONTENTS_SOLID, CONTENTS_OPAQUE, CONTENTS_MOVEABLE, CONTENTS_DEBRIS, CONTENTS_MONSTER, CONTENTS_HITBOX, 402653442, CONTENTS_WATER)
local trace_walls = bit.bor(CONTENTS_TESTFOGVOLUME, CONTENTS_EMPTY, CONTENTS_MONSTER, CONTENTS_HITBOX)
local NoPenetration = {[MAT_SLOSH] = true}
local NoRicochet = {[MAT_FLESH] = true, [MAT_ANTLION] = true, [MAT_BLOODYFLESH] = true, [MAT_DIRT] = true, [MAT_SAND] = true, [MAT_GLASS] = true, [MAT_ALIENFLESH] = true}
local PenMod = {[MAT_SAND] = 0.5, [MAT_DIRT] = 0.8, [MAT_METAL] = 1.1, [MAT_TILE] = 0.9, [MAT_WOOD] = 1.2}
local bul, tr = {}, {}
local SP = game.SinglePlayer()

local reg = debug.getregistry()
local GetShootPos = reg.Player.GetShootPos
local GetCurrentCommand = reg.Player.GetCurrentCommand
local CommandNumber = reg.CUserCmd.CommandNumber

function SWEP:FireBullet(damage, cone, bullets)
	sp = GetShootPos(self.Owner)
	math.randomseed(CommandNumber(GetCurrentCommand(self.Owner)))
	
	if self.Owner:Crouching() then
		cone = cone * 0.85
	end
	
	Dir = (self.Owner:EyeAngles() + self.Owner:GetPunchAngle() + Angle(math.Rand(-cone, cone), math.Rand(-cone, cone), 0) * 25):Forward()

	for i = 1, bullets do
		Dir2 = Dir
		
		if self.ClumpSpread and self.ClumpSpread > 0 then
			Dir2 = Dir + Vector(math.Rand(-1, 1), math.Rand(-1, 1), math.Rand(-1, 1)) * self.ClumpSpread
		end
		
		bul.Num = 1
		bul.Src = sp
		bul.Dir = Dir2
		bul.Spread 	= Vector(0, 0, 0)
		bul.Tracer	= 1
		bul.Force	= damage * 0.3
		bul.Damage = math.Round(damage)
		
		self.Owner:FireBullets(bul)
		
		tr.start = sp
		tr.endpos = tr.start + Dir2 * self.PenetrativeRange
		tr.filter = self.Owner
		tr.mask = trace_normal
		
		trace = util.TraceLine(tr)
			
		if trace.Hit and not trace.HitSky then
			if not NoPenetration[trace.MatType] then
				local entm = trace.Entity:GetClass()
				if entm != "bs_shield" and entm != "bs_hshield" and entm != "bs_rshield" and entm != "bs_dshield" then
					dot = -Dir2:Dot(trace.HitNormal)
					ent = trace.Entity
				
					if dot > 0.26 and self.CanPenetrate and not ent:IsNPC() and not ent:IsPlayer() then
						tr.start = trace.HitPos
						tr.endpos = tr.start + Dir2 * self.PenStr * (PenMod[trace.MatType] and PenMod[trace.MatType] or 1) * self.PenMod
						tr.filter = self.Owner
						tr.mask = trace_walls
						
						trace = util.TraceLine(tr)
						
						tr.start = trace.HitPos
						tr.endpos = tr.start + Dir2 * 0.1
						tr.filter = self.Owner
						tr.mask = trace_normal
						
						trace = util.TraceLine(tr) -- run ANOTHER trace to check whether we've penetrated a surface or not
						
						if not trace.Hit then
							bul.Num = 1
							bul.Src = trace.HitPos
							bul.Dir = Dir2
							bul.Spread 	= Vec0
							bul.Tracer	= 1
							bul.Force	= damage * 0.15
							bul.Damage = bul.Damage * 0.5
							
							self.Owner:FireBullets(bul)
							
							bul.Num = 1
							bul.Src = trace.HitPos
							bul.Dir = -Dir2
							bul.Spread 	= Vec0
							bul.Tracer	= 1
							bul.Force	= damage * 0.15
							bul.Damage = bul.Damage * 0.5
							
							self.Owner:FireBullets(bul)
						end
					else
						if self.CanRicochet then
							if not NoRicochet[trace.MatType] and self.PenetrativeRange * trace.Fraction < self.PenetrativeRange then
								Dir2 = Dir2 + (trace.HitNormal * dot) * 3
								Dir2 = Dir2 + VectorRand() * 0.06
								bul.Num = 1
								bul.Src = trace.HitPos
								bul.Dir = Dir2
								bul.Spread 	= Vec0
								bul.Tracer	= 0
								bul.Force	= damage * 0.225
								bul.Damage = bul.Damage * 0.75
								
								self.Owner:FireBullets(bul)
							end
						end
					end
				end
			end
		end
	end
		
	tr.mask = trace_normal
end
--PATH addons/vcmod_main_autoupdate/lua/weapons/vc_jerrycan/shared.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

AddCSLuaFile("shared.lua")

SWEP.Category 		= "VCMod"
SWEP.PrintName		= "Jerry can"
SWEP.Author			= "freemmaann"
SWEP.Instructions	= "Aim at the fuel lid."

SWEP.ViewModel 		= Model("models/weapons/v_bugbait.mdl")
SWEP.WorldModel 	= Model("models/props_junk/gascan001a.mdl")
SWEP.ViewModelFOV	= 75

SWEP.Spawnable		= true
SWEP.AdminSpawnable	= true
SWEP.Slot 			= 5
SWEP.UseHands 		= true

SWEP.DrawAmmo		= true
SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

if CLIENT then SWEP.VC_WepSelectIcon= Material("materials/vcmod/gui/icons/fuel.png") end

SWEP.VC_Fuel = {}

if VC and !VC.CodeEnt then VC.CodeEnt = {} end

local ID = "Jerrycan_Wep"
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

if SERVER then
	function SWEP:VC_AddFuel(ftype, num) if VC and VC.CodeEnt.Jerrycan_Wep and VC.CodeEnt.Jerrycan_Wep.VC_AddFuel then return VC.CodeEnt.Jerrycan_Wep.VC_AddFuel(self, ftype, num) end end
end
--PATH addons/vcmod_main_autoupdate/lua/weapons/vc_wrench/shared.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

AddCSLuaFile("shared.lua")

SWEP.Category 		= "VCMod"
SWEP.PrintName		= "Wrench"
SWEP.Author			= "freemmaann"
SWEP.Instructions	= "Aim at their damaged parts to restore them individually\n\nRight click repair the whole vehicle (admin only)"

SWEP.ViewModel		= "models/VC-Mod/v_wrench.mdl"
SWEP.WorldModel		= "models/VC-Mod/v_wrench.mdl"
SWEP.ViewModelFOV	= 55

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

if CLIENT then SWEP.VC_WepSelectIcon= Material("materials/vcmod/gui/icons/repair.png") end

if !VC.CodeEnt then VC.CodeEnt = {} end

local ID = "Repair_Wep"
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
--PATH addons/darkrpadvancedkeys/lua/weapons/weapon_adv_keys/cl_menu.lua:
local ADVKEYS_UnlockedMat = Material("cg_ocrp2/hud_new/ocrp2_unlocked")
local ADVKEYS_LockedMat = Material("cg_ocrp2/hud_new/ocrp2_locked")

function SWEP:DrawHUD()
	local x = ScrW() / 2.0 
	local y = ScrH() / 2.0 
		
	local pos = self.Owner:EyePos()
	local posang = self.Owner:GetAimVector()
	
	local tracedata = {}
	tracedata.start = pos
	tracedata.endpos = pos + ( posang * 180 )
	tracedata.filter = self.Owner
	local trace = util.TraceLine( tracedata )
	
	local tracedatafar = {}
	tracedatafar.start = pos
	tracedatafar.endpos = pos + ( posang * 400 )
	tracedatafar.filter = self.Owner
	local tracefar = util.TraceLine( tracedatafar )
	
	if self.Owner:InVehicle() then return end
	if tracefar.HitWorld then return end
	
	if tracefar.HitNonWorld then
		if tracefar.Entity:IsVehicle() or ( IsValid( trace.Entity ) and trace.Entity:isDoor() ) then
			if LocalPlayer():canKeysLock( tracefar.Entity ) or LocalPlayer():canKeysLock( trace.Entity ) then	
				if tracefar.Entity:GetNW2Bool( "ADVKEYS_IsLocked" ) then
					surface.SetDrawColor( 255, 255, 255, 255 )
					surface.SetMaterial( ADVKEYS_LockedMat )
					surface.DrawTexturedRect( x - 25, y - 50, 50, 50 )
				else
					surface.SetDrawColor( 255, 255, 255, 255 )
					surface.SetMaterial( ADVKEYS_UnlockedMat )
					surface.DrawTexturedRect( x - 25, y - 50, 50, 50 )
				end
			end
		end
	end
end

DarkRP.stub{
    name = "openKeysMenu",
    description = "Open the keys/F2 menu.",
    parameters = {},
    realm = "Client",
    returns = {},
    metatable = DarkRP
}

DarkRP.hookStub{
    name = "onKeysMenuOpened",
    description = "Called when the keys menu is opened.",
    parameters = {
        {
            name = "ent",
            description = "The door entity.",
            type = "Entity"
        },
        {
            name = "Frame",
            description = "The keys menu frame.",
            type = "Panel"
        }
    },
    returns = {
    },
    realm = "Client"
}
do
    local b = Material("pp/blurscreen")
    function draw.Blur(panel, amount)
        local x, y = panel:LocalToScreen(0, 0)
        local scrW, scrH = ScrW(), ScrH()
        surface.SetDrawColor(255, 255, 255)
        surface.SetMaterial(b)

        for i = 1, 3 do
            b:SetFloat("$blur", (i / 3) * (amount or 6))
            b:Recompute()
            render.UpdateScreenEffectTexture()
            surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
        end
    end
end

do
    local errorMat = Material("error")
    local WebImageCache = {}
    if !file.IsDir('dudework', 'DATA') then
        file.CreateDir('dudework')
    end
    function http.DownloadMaterial(url, path, callback)
        if WebImageCache[url] then return callback(WebImageCache[url]) end

        local data_path = "data/dudework/".. path
        if file.Exists('dudework/'..path, "DATA") then
            WebImageCache[url] = Material(data_path, "smooth", "noclamp")
            callback(WebImageCache[url])
        else
            http.Fetch(url, function(img)
                if img == nil or string.find(img, "<!DOCTYPE HTML>", 1, true) then return callback(errorMat) end
                
                file.Write('dudework/'..path, img)
                WebImageCache[url] = Material(data_path, "smooth", "noclamp")
                callback(WebImageCache[url])
            end, function()
                callback(errorMat)
            end)
        end
    end
end


surface.CreateFont("EVSDM18", {font = 'VK Sans Display Medium', weight = 0, size = height(18), extended = true})	

local mat1 = Material('doors/rectangle_4823.png','noclamp smooth')
local KeyFrameVisible = false
local Frame
function openMenu(setDoorOwnerAccess, doorSettingsAccess)
    if KeyFrameVisible then return end
    local count = 0
    local rgb = Color
    local ent = LocalPlayer():GetEyeTrace().Entity
    if not IsValid(ent) or not ent:isKeysOwnable() or ent:GetPos():Distance(LocalPlayer():GetPos()) > 200 then return end
  
    KeyFrameVisible = true
    Frame = nil
    KeyFrameVisible = true
    Frame = vgui.Create("DFrame")
    Frame:SetSize(weight(345), height(228)) -- Base size
    Frame.btnMaxim:SetVisible(false)
    Frame.btnMinim:SetVisible(false)
    Frame:SetVisible(true)
	Frame:SetTitle ''
	Frame:ShowCloseButton(false)
	Frame:AlphaTo(0,0)
	Frame:AlphaTo(255,.5)
    Frame:MakePopup()
	local entType = DarkRP.getPhrase(ent:IsVehicle() and "vehicle" or "door")
	Frame._Close = function()	
        Frame:AlphaTo(0,.3,0,function()
            KeyFrameVisible = false
            Frame:Remove()        
        end)
    end
	Frame.Paint = function(s,w,h)
		draw.RoundedBox(10,0,0,w,h,rgb(45,45,45))

        surface.SetMaterial(mat1)
        surface.SetDrawColor(255,255,255)
        surface.DrawTexturedRect(weight(-4),0,weight(353),height(54))
		draw.SimpleText("Управление дверью", 'EVSDM18', weight(10),height(12),color_white,0,0)
	end
	
    function Frame:Think()
        local trace = LocalPlayer():GetEyeTrace()
        local LAEnt = trace.Entity
    
        if not IsValid(LAEnt) or not LAEnt:isKeysOwnable() or trace.HitPos:DistToSqr(LocalPlayer():EyePos()) > 40000 then
            self:Close()
        end
        if not self.Dragging then return end
        local x = gui.MouseX() - self.Dragging[1]
        local y = gui.MouseY() - self.Dragging[2]
        x = math.Clamp(x, 0, ScrW() - self:GetWide())
        y = math.Clamp(y, 0, ScrH() - self:GetTall())
        self:SetPos(x, y)
    end
    
    Frame.OnClose = function(s)
        KeyFrameVisible = false
        s:SetVisible(false)
        s:Remove()
    end

    local pan = vgui.Create('Panel',Frame)
    pan:SetSize(weight(345-4),Frame:GetTall()*2)
    pan:SetPos(weight(2),height(54))

    if ent:isKeysOwnedBy(LocalPlayer()) then
        Frame.Owndoor = vgui.Create("DButton", pan)
        Frame.Owndoor:SetText(DarkRP.getPhrase("sell_x", entType))
        Frame.Owndoor:Dock(TOP)
		Frame.Owndoor.co = 0
		Frame.Owndoor.co2 = 200
		Frame.Owndoor:SetFont("EVSDM18")
		Frame.Owndoor.Paint = function(s,w,h)
			s.co = s.Hovered and math.Approach(s.co, 255, 5) or math.Approach(s.co, 0, 5)
			s.co2 = s.Hovered and math.Approach(s.co2, 0, 5) or math.Approach(s.co2, 255, 5)
			
			draw.RoundedBox(6,0,0,w,h,rgb(64,64,64,s.co2))
			draw.RoundedBox(6,0,0,w,h,rgb(1,116,222,s.co))
		end
		
		Frame.Owndoor.OnCursorEntered = function()
			surface.PlaySound("doors2/rollover2.wav")
		end
		
		Frame.Owndoor:SetColor(color_white)
		Frame.Owndoor:SetSize(0,height(38))
		Frame.Owndoor:DockMargin(weight(2),height(2),weight(2),height(5))
        Frame.Owndoor.DoClick = function() surface.PlaySound("doors2/click2.wav") RunConsoleCommand("darkrp", "toggleown") Frame._Close() end
		
		count = count + 1
        local AddOwner = vgui.Create("DButton",pan)
        AddOwner:SetText(DarkRP.getPhrase("add_owner"))
        AddOwner:Dock(TOP)
		AddOwner.co = 0
		AddOwner.co2 = 200
		AddOwner:SetFont("EVSDM18")
		AddOwner.Paint = function(s,w,h)
			s.co = s.Hovered and math.Approach(s.co, 255, 5) or math.Approach(s.co, 0, 5)
			s.co2 = s.Hovered and math.Approach(s.co2, 0, 5) or math.Approach(s.co2, 255, 5)
			
			draw.RoundedBox(6,0,0,w,h,rgb(64,64,64,s.co2))
			draw.RoundedBox(6,0,0,w,h,rgb(1,116,222,s.co))
		end
		AddOwner:SetColor(color_white)
		AddOwner:SetSize(0,height(38))
		AddOwner:DockMargin(weight(2),height(2),weight(2),height(5))
		AddOwner.OnCursorEntered = function()
			surface.PlaySound("doors2/rollover2.wav")
		end
        AddOwner.DoClick = function() surface.PlaySound("doors2/click2.wav")
            local menu = DermaMenu()
            menu.found = false
            for k,v in pairs(DarkRP.nickSortedPlayers()) do
                if not ent:isKeysOwnedBy(v) and not ent:isKeysAllowedToOwn(v) then
                    local steamID = v:SteamID()
                    menu.found = true
                    menu:AddOption(v:Nick(), function() RunConsoleCommand("darkrp", "ao", steamID) end)
                end
            end
            if not menu.found then
                menu:AddOption(DarkRP.getPhrase("noone_available"), function() end)
            end
            menu:Open()
        end
		count = count + 1
        local RemoveOwner = vgui.Create("DButton",pan)
        RemoveOwner:SetText(DarkRP.getPhrase("remove_owner"))
		RemoveOwner.co = 0
		RemoveOwner.co2 = 200
		RemoveOwner:SetFont("EVSDM18")
		RemoveOwner.Paint = function(s,w,h)
			s.co = s.Hovered and math.Approach(s.co, 255, 5) or math.Approach(s.co, 0, 5)
			s.co2 = s.Hovered and math.Approach(s.co2, 0, 5) or math.Approach(s.co2, 255, 5)
			
			draw.RoundedBox(6,0,0,w,h,rgb(64,64,64,s.co2))
			draw.RoundedBox(6,0,0,w,h,rgb(1,116,222,s.co))
		end
		RemoveOwner:SetColor(color_white)
        RemoveOwner:Dock(TOP)
		RemoveOwner:SetSize(0,height(38))
		RemoveOwner:DockMargin(weight(2),height(2),weight(2),height(5))
		RemoveOwner.OnCursorEntered = function()
			surface.PlaySound("doors2/rollover2.wav")
		end
        RemoveOwner.DoClick = function() surface.PlaySound("doors2/click2.wav")
            local menu = DermaMenu()
            for k,v in pairs(DarkRP.nickSortedPlayers()) do
                if (ent:isKeysOwnedBy(v) and not ent:isMasterOwner(v)) or ent:isKeysAllowedToOwn(v) then
                    local steamID = v:SteamID()
                    menu.found = true
                    menu:AddOption(v:Nick(), function() RunConsoleCommand("darkrp", "ro", steamID) end)
                end
            end
            if not menu.found then
                menu:AddOption(DarkRP.getPhrase("noone_available"), function() end)
            end
            menu:Open()
        end
        if not ent:isMasterOwner(LocalPlayer()) then
            RemoveOwner:SetDisabled(true)
        end
		count = count + 1
    end

    if doorSettingsAccess then
        local DisableOwnage = vgui.Create("DButton",pan)
		DisableOwnage.co = 0
		DisableOwnage.co2 = 200
		DisableOwnage:SetFont("EVSDM18")
		DisableOwnage.Paint = function(s,w,h)
			s.co = s.Hovered and math.Approach(s.co, 255, 5) or math.Approach(s.co, 0, 5)
			s.co2 = s.Hovered and math.Approach(s.co2, 0, 5) or math.Approach(s.co2, 255, 5)
			
			draw.RoundedBox(6,0,0,w,h,rgb(64,64,64,s.co2))
			draw.RoundedBox(6,0,0,w,h,rgb(1,116,222,s.co))
		end
		DisableOwnage:SetColor(color_white)
	    DisableOwnage:Dock(TOP)
		DisableOwnage:DockMargin(weight(2),height(2),weight(2),height(5))
		DisableOwnage:SetSize(0,height(38))
		DisableOwnage.OnCursorEntered = function()
			surface.PlaySound("doors2/rollover2.wav")
		end
        DisableOwnage:SetText(DarkRP.getPhrase(ent:getKeysNonOwnable() and "allow_ownership" or "disallow_ownership"))
        DisableOwnage.DoClick = function() surface.PlaySound("doors2/click2.wav") Frame._Close() RunConsoleCommand("darkrp", "toggleownable") end
		count = count + 1
    end

    if doorSettingsAccess and (ent:isKeysOwned() or ent:getKeysNonOwnable() or ent:getKeysDoorGroup() or hasTeams) or ent:isKeysOwnedBy(LocalPlayer()) then
        local DoorTitle = vgui.Create("DButton",pan)
        DoorTitle:SetText(DarkRP.getPhrase("set_x_title", entType))
		DoorTitle.co = 0
		DoorTitle.co2 = 200
		DoorTitle:SetFont("EVSDM18")
		DoorTitle.Paint = function(s,w,h)
			s.co = s.Hovered and math.Approach(s.co, 255, 5) or math.Approach(s.co, 0, 5)
			s.co2 = s.Hovered and math.Approach(s.co2, 0, 5) or math.Approach(s.co2, 255, 5)
			
			draw.RoundedBox(6,0,0,w,h,rgb(64,64,64,s.co2))
			draw.RoundedBox(6,0,0,w,h,rgb(1,116,222,s.co))
		end
		DoorTitle:SetColor(color_white)
        DoorTitle:Dock(TOP)
		DoorTitle:DockMargin(weight(2),height(2),weight(2),height(5))
		DoorTitle:SetSize(0,height(38))
		DoorTitle.OnCursorEntered = function()
			surface.PlaySound("doors2/rollover2.wav")
		end
        DoorTitle.DoClick = function() surface.PlaySound("doors2/click2.wav")
            Derma_StringRequest(DarkRP.getPhrase("set_x_title", entType), DarkRP.getPhrase("set_x_title_long", entType), "", function(text)
                RunConsoleCommand("darkrp", "title", text)
                if IsValid(Frame) then
                    Frame._Close()
                end
            end,
            function() end, DarkRP.getPhrase("ok"), DarkRP.getPhrase("cancel"))
        end
		count = count + 1
    end

    if not ent:isKeysOwned() and not ent:getKeysNonOwnable() and not ent:getKeysDoorGroup() and not ent:getKeysDoorTeams() or not ent:isKeysOwnedBy(LocalPlayer()) and ent:isKeysAllowedToOwn(LocalPlayer()) then
        Frame.Owndoor = vgui.Create("DButton",pan)
        Frame.Owndoor:SetText('Купить [ 35$ ]')
		Frame.Owndoor:SetFont("EVSDM18")
		Frame.Owndoor.co = 0
		Frame.Owndoor.co2 = 200
		Frame.Owndoor:SetFont("EVSDM18")
		Frame.Owndoor.Paint = function(s,w,h)
			s.co = s.Hovered and math.Approach(s.co, 255, 5) or math.Approach(s.co, 0, 5)
			s.co2 = s.Hovered and math.Approach(s.co2, 0, 5) or math.Approach(s.co2, 255, 5)
			-- 
			draw.RoundedBox(6,0,0,w,h,rgb(64,64,64,s.co2))
			draw.RoundedBox(6,0,0,w,h,rgb(1,116,222,s.co))
		end
		Frame.Owndoor:SetColor(color_white)
        Frame.Owndoor:Dock(TOP)
		Frame.Owndoor:DockMargin(weight(2),height(2),weight(2),height(5))
		Frame.Owndoor:SetSize(0,height(38))
		Frame.Owndoor.OnCursorEntered = function()
			surface.PlaySound("doors2/rollover2.wav")
		end
        Frame.Owndoor.DoClick = function() surface.PlaySound("doors2/click2.wav") RunConsoleCommand("darkrp", "toggleown") Frame._Close() end
		count = count + 1
    end

    if doorSettingsAccess then
        local EditDoorGroups = vgui.Create("DButton",pan)
        EditDoorGroups:SetText(DarkRP.getPhrase("edit_door_group"))
		EditDoorGroups:SetFont("EVSDM18")
		EditDoorGroups.co = 0
		EditDoorGroups.co2 = 200
		EditDoorGroups:SetFont("EVSDM18")
		EditDoorGroups.Paint = function(s,w,h)
			s.co = s.Hovered and math.Approach(s.co, 255, 5) or math.Approach(s.co, 0, 5)
			s.co2 = s.Hovered and math.Approach(s.co2, 0, 5) or math.Approach(s.co2, 255, 5)
			
			draw.RoundedBox(6,0,0,w,h,rgb(64,64,64,s.co2))
			draw.RoundedBox(6,0,0,w,h,rgb(1,116,222,s.co))
		end
		EditDoorGroups:SetColor(color_white)
        EditDoorGroups:Dock(TOP)
		EditDoorGroups:DockMargin(weight(2),height(2),weight(2),height(5))
		EditDoorGroups:SetSize(0,height(38))
		EditDoorGroups.OnCursorEntered = function()
			surface.PlaySound("doors2/rollover2.wav")
		end
        EditDoorGroups.DoClick = function() surface.PlaySound("doors2/click2.wav")
            local menu = DermaMenu()
            local groups = menu:AddSubMenu(DarkRP.getPhrase("door_groups"))
            local teams = menu:AddSubMenu(DarkRP.getPhrase("jobs"))
            local add = teams:AddSubMenu(DarkRP.getPhrase("add"))
            local remove = teams:AddSubMenu(DarkRP.getPhrase("remove"))

            menu:AddOption(DarkRP.getPhrase("none"), function()
                RunConsoleCommand("darkrp", "togglegroupownable")
                if IsValid(Frame) then Frame._Close() end
            end)

            for k,v in pairs(RPExtraTeamDoors) do
                groups:AddOption(k, function()
                    RunConsoleCommand("darkrp", "togglegroupownable", k)
                    if IsValid(Frame) then Frame._Close() end
                end)
            end

            local doorTeams = ent:getKeysDoorTeams()
            for k,v in pairs(RPExtraTeams) do
                local which = (not doorTeams or not doorTeams[k]) and add or remove
                which:AddOption(v.name, function()
                    RunConsoleCommand("darkrp", "toggleteamownable", k)
                    if IsValid(Frame) then Frame._Close() end
                end)
            end

            menu:Open()
        end
		count = count + 1
    end
    if count == 0 then
        Frame:Close()
        KeyFrameVisible = true
        timer.Simple(0.3, function() KeyFrameVisible = false end)
    end

    Frame:SetSize(weight(345), height(56)+(height(45)*count))


	Frame.CloseBtn = vgui.Create("DButton", Frame)
	Frame.CloseBtn:SetText "✕"
	Frame.CloseBtn:SetFont("EVSDM18")
	Frame.CloseBtn:SetColor(color_white)
    Frame.CloseBtn:SetSize(weight(30),height(30))
	Frame.CloseBtn:SetPos(Frame:GetWide() - weight(40), height(8))
	Frame.CloseBtn.OnCursorEntered = function()
		surface.PlaySound("doors2/rollover2.wav")
	end
	Frame.CloseBtn.Paint = function(s) if s.Hovered then s:SetColor(rgb(1,116,222)) else s:SetColor(rgb(255,255,255)) end end
	Frame.CloseBtn.DoClick = function() surface.PlaySound("doors2/click2.wav")
		Frame._Close()
	end
    
    hook.Call("onKeysMenuOpened", nil, ent, Frame)

    Frame:Center()
end

function DarkRP.openKeysMenu(um)
    CAMI.PlayerHasAccess(LocalPlayer(), "DarkRP_SetDoorOwner", function(setDoorOwnerAccess)
        CAMI.PlayerHasAccess(LocalPlayer(), "DarkRP_ChangeDoorSettings", fp{openMenu, setDoorOwnerAccess})
    end)
end
usermessage.Hook("KeysMenu", DarkRP.openKeysMenu)
--PATH addons/cigarette_swep/lua/weapons/weapon_ciga_blat.lua:

-- Cigarette SWEP by Mordestein (based on Vape SWEP by Swamp Onions)

if CLIENT then
	include('weapon_ciga/cl_init.lua')
else
	include('weapon_ciga/shared.lua')
end

SWEP.PrintName = "Capitain Black"

SWEP.Instructions = "LMB: kurit kak blatnoy"

SWEP.cigaAccentColor = nil

SWEP.cigaID = 4
SWEP.ViewModel = "models/mordeciga/mordes/ciga.mdl"
SWEP.WorldModel = "models/mordeciga/mordes/ciga.mdl"

--Add your own flavors here, obviously
JuicycigaJuices = {
	{name = "witout filter", color = Color(40,40,40,255)},
	{name = "with filter", color = Color(210,180,140,255)},
}

if SERVER then
	function SWEP:Initialize2()
		self.juiceID = 0
		timer.Simple(0.1, function() SendcigaJuice(self, JuicycigaJuices[self.juiceID+1]) end)
	end

	util.AddNetworkString("cigaTankColor")
	util.AddNetworkString("cigaMessage")
end

function SWEP:SecondaryAttack()
	if SERVER then
		if not self.juiceID then self.juiceID = 0 end
		self.juiceID = (self.juiceID + 1) % (#JuicycigaJuices)
		SendcigaJuice(self, JuicycigaJuices[self.juiceID+1])

		--Client hook isn't called in singleplayer
		if game.SinglePlayer() then	self.Owner:SendLua([[surface.PlaySound("weapons/smg1/switch_single.wav")]]) end
	else
		if IsFirstTimePredicted() then
			surface.PlaySound("weapons/smg1/switch_single.wav")
		end
	end
end

if SERVER then
	function SendcigaJuice(ent, tab)
		local col = tab.color
		if col then
			local min = math.min(col.r,col.g,col.b)*0.8
			col = (Vector(col.r-min, col.g-min, col.b-min)*1.0)/255.0
		else
			col = Vector(-1,-1,-1)
		end
		net.Start("cigaTankColor")
		net.WriteEntity(ent)
		net.WriteVector(col)
		net.Broadcast()

		if IsValid(ent.Owner) then
			net.Start("cigaMessage")
			net.WriteString("Loaded "..tab.name.."")
			net.Send(ent.Owner)
		end
	end
else
	net.Receive("cigaTankColor", function()
		local ent = net.ReadEntity()
		local col = net.ReadVector()
		if IsValid(ent) then ent.cigaTankColor = col end
	end)

	cigaMessageDisplay = ""
	cigaMessageDisplayTime = 0

	net.Receive("cigaMessage", function()
		cigaMessageDisplay = net.ReadString()
		cigaMessageDisplayTime = CurTime()
	end)

	hook.Add("HUDPaint", "cigaDrawJuiceMessage", function()
		local alpha = math.Clamp((cigaMessageDisplayTime+3-CurTime())*1.5,0,1)
		if alpha == 0 then return end

		surface.SetFont("Trebuchet24")
		local w,h = surface.GetTextSize(cigaMessageDisplay)
		draw.WordBox(8, ((ScrW() - w)/2)-8, ScrH() - (h + 24), cigaMessageDisplay, "Trebuchet24", Color(0,0,0,128*alpha), Color(255,255,255,255*alpha))
	end)
end
--PATH addons/111mod/lua/weapons/weapon_flechettegun/shared.lua:

-- Variables that are used on both client and server

SWEP.PrintName		= "Ковбойка" -- 'Nice' Weapon name (Shown on HUD)
SWEP.Author			= ""
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 62
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_pistol.mdl"
SWEP.WorldModel		= "models/weapons/w_357.mdl"

SWEP.Spawnable		= false
SWEP.AdminOnly		= false

SWEP.Primary.ClipSize		= 8			-- Size of a clip
SWEP.Primary.DefaultClip	= 228		-- Default number of bullets in a clip
SWEP.Primary.Automatic		= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "Pistol"

SWEP.Secondary.ClipSize		= 8			-- Size of a clip
SWEP.Secondary.DefaultClip	= 228		-- Default number of bullets in a clip
SWEP.Secondary.Automatic	= false		-- Automatic/Semi Auto
SWEP.Secondary.Ammo			= "Pistol"

--[[---------------------------------------------------------
	Name: SWEP:Initialize()
	Desc: Called when the weapon is first loaded
-----------------------------------------------------------]]
function SWEP:Initialize()

	self:SetHoldType( "pistol" )

end

--[[---------------------------------------------------------
	Name: SWEP:PrimaryAttack()
	Desc: +attack1 has been pressed
-----------------------------------------------------------]]
function SWEP:PrimaryAttack()

	-- Make sure we can shoot first
	if ( !self:CanSecondaryAttack() ) then return end

	-- Play shoot sound
	self:EmitSound( "Weapon_AR2.Single" )
	
	local dmg = math.random(95,120)
	-- Shoot 9 bullets, 150 damage, 0.75 aimcone
	self:ShootBullet( dmg, 1, 0.02, self.Primary.Ammo )

	-- Remove 1 bullet from our clip
	self:TakePrimaryAmmo( 1 )

	-- Punch the player's view
	self.Owner:ViewPunch( Angle( -1, 0, 0 ) )
	
	self:SetNextPrimaryFire( CurTime() + 0.30 )
	self:SetNextSecondaryFire( CurTime() + 0.95 )

end

--[[---------------------------------------------------------
	Name: SWEP:SecondaryAttack()
	Desc: +attack2 has been pressed
-----------------------------------------------------------]]
function SWEP:SecondaryAttack()

	-- Make sure we can shoot first
	if ( !self:CanPrimaryAttack() ) then return end

	-- Play shoot sound
	self:EmitSound("Weapon_Shotgun.Single")
	
	local dmg = math.random(75,105)
	self:ShootBullet( dmg, 6, 0.2, self.Secondary.Ammo )

	self:TakeSecondaryAmmo( 1 )

	self.Owner:ViewPunch( Angle( -10, 0, 0 ) )
	
	self:SetNextPrimaryFire( CurTime() + 0.35 )
	self:SetNextSecondaryFire( CurTime() + 0.95 )

end

--[[---------------------------------------------------------
	Name: SWEP:Reload()
	Desc: Reload is being pressed
-----------------------------------------------------------]]
function SWEP:Reload()
	self:DefaultReload( ACT_VM_RELOAD )
end

--[[---------------------------------------------------------
	Name: SWEP:Think()
	Desc: Called every frame
-----------------------------------------------------------]]
function SWEP:Think()
end

--[[---------------------------------------------------------
	Name: SWEP:Holster( weapon_to_swap_to )
	Desc: Weapon wants to holster
	RetV: Return true to allow the weapon to holster
-----------------------------------------------------------]]
function SWEP:Holster( wep )
	return true
end

--[[---------------------------------------------------------
	Name: SWEP:Deploy()
	Desc: Whip it out
-----------------------------------------------------------]]
function SWEP:Deploy()
	return true
end

--[[---------------------------------------------------------
	Name: SWEP:ShootEffects()
	Desc: A convenience function to create shoot effects
-----------------------------------------------------------]]
function SWEP:ShootEffects()

	self:SendWeaponAnim( ACT_VM_PRIMARYATTACK )		-- View model animation
	self.Owner:MuzzleFlash()						-- Crappy muzzle light
	self.Owner:SetAnimation( PLAYER_ATTACK1 )		-- 3rd Person Animation

end

--[[---------------------------------------------------------
	Name: SWEP:ShootBullet()
	Desc: A convenience function to shoot bullets
-----------------------------------------------------------]]
function SWEP:ShootBullet( damage, num_bullets, aimcone, ammo_type, force, tracer )

	local bullet = {}
	bullet.Num		= num_bullets
	bullet.Src		= self.Owner:GetShootPos()			-- Source
	bullet.Dir		= self.Owner:GetAimVector()			-- Dir of bullet
	bullet.Spread	= Vector( aimcone, aimcone, 0 )		-- Aim Cone
	bullet.Tracer	= tracer || 5						-- Show a tracer on every x bullets
	bullet.Force	= force || 1						-- Amount of force to give to phys objects
	bullet.Damage	= damage
	bullet.AmmoType = ammo_type || self.Primary.Ammo

	self.Owner:FireBullets( bullet )

	self:ShootEffects()

end

--[[---------------------------------------------------------
	Name: SWEP:TakePrimaryAmmo()
	Desc: A convenience function to remove ammo
-----------------------------------------------------------]]
function SWEP:TakePrimaryAmmo( num )

	-- Doesn't use clips
	if ( self:Clip1() <= 0 ) then

		if ( self:Ammo1() <= 0 ) then return end

		self.Owner:RemoveAmmo( num, self:GetPrimaryAmmoType() )

	return end

	self:SetClip1( self:Clip1() - num )

end

--[[---------------------------------------------------------
	Name: SWEP:TakeSecondaryAmmo()
	Desc: A convenience function to remove ammo
-----------------------------------------------------------]]
function SWEP:TakeSecondaryAmmo( num )

	-- Doesn't use clips
	if ( self:Clip2() <= 0 ) then

		if ( self:Ammo2() <= 0 ) then return end

		self.Owner:RemoveAmmo( num, self:GetSecondaryAmmoType() )

	return end

	self:SetClip2( self:Clip2() - num )

end

--[[---------------------------------------------------------
	Name: SWEP:CanPrimaryAttack()
	Desc: Helper function for checking for no ammo
-----------------------------------------------------------]]
function SWEP:CanPrimaryAttack()

	if ( self:Clip1() <= 0 ) then
		self:EmitSound( "Weapon_Pistol.Empty" )
		self:SetNextPrimaryFire( CurTime() + 1.0 )
		self:SetNextSecondaryFire( CurTime() + 1.5 )
		self:Reload()
		return false

	end

	return true

end

--[[---------------------------------------------------------
	Name: SWEP:CanSecondaryAttack()
	Desc: Helper function for checking for no ammo
-----------------------------------------------------------]]
function SWEP:CanSecondaryAttack()

	if ( self:Clip2() <= 0 ) then

		self:EmitSound( "Weapon_Pistol.Empty" )
		self:SetNextPrimaryFire( CurTime() + 1.0 )
		self:SetNextSecondaryFire( CurTime() + 1.5 )
		return false

	end

	return true

end

--[[---------------------------------------------------------
	Name: OnRemove
	Desc: Called just before entity is deleted
-----------------------------------------------------------]]
function SWEP:OnRemove()
end

--[[---------------------------------------------------------
	Name: OwnerChanged
	Desc: When weapon is dropped or picked up by a new player
-----------------------------------------------------------]]
function SWEP:OwnerChanged()
end

--[[---------------------------------------------------------
	Name: Ammo1
	Desc: Returns how much of ammo1 the player has
-----------------------------------------------------------]]
function SWEP:Ammo1()
	return self.Owner:GetAmmoCount( self:GetPrimaryAmmoType() )
end

--[[---------------------------------------------------------
	Name: Ammo2
	Desc: Returns how much of ammo2 the player has
-----------------------------------------------------------]]
function SWEP:Ammo2()
	return self.Owner:GetAmmoCount( self:GetSecondaryAmmoType() )
end

--[[---------------------------------------------------------
	Name: SetDeploySpeed
	Desc: Sets the weapon deploy speed.
		 This value needs to match on client and server.
-----------------------------------------------------------]]
function SWEP:SetDeploySpeed( speed )
	self.m_WeaponDeploySpeed = tonumber( speed )
end

--[[---------------------------------------------------------
	Name: DoImpactEffect
	Desc: Callback so the weapon can override the impact effects it makes
		 return true to not do the default thing - which is to call UTIL_ImpactTrace in c++
-----------------------------------------------------------]]
function SWEP:DoImpactEffect( tr, nDamageType )

	return false

end

--PATH addons/weaponandcontent/lua/weapons/xm1014/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = true
	SWEP.PrintName = "XM1014"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos =  Vector(5.317, 0.551, 2.24)
	SWEP.AimAng = Vector(0, 0, 0)
		
	SWEP.SprintPos = Vector(-3.701, -7.639, 0.236)
	SWEP.SprintAng = Vector(-9.646, -65.866, 0)
	
	SWEP.ZoomAmount = 5
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.IconLetter = "B"
	--killicon.AddFont("swb_xm1014", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
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
SWEP.ViewModel				= "models/weapons/2_shot_xm1014.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_shot_xm1014.mdl"	-- Weapon world model

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 7
SWEP.Primary.DefaultClip	= 7
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "Buckshot"

SWEP.FireDelay = 0.2
SWEP.FireSound = Sound("Alt_Weapon_XM1014.1")
SWEP.Recoil = 1
SWEP.ShotgunReload = true
SWEP.ReloadStartWait = 0.6
SWEP.ReloadFinishWait = 0.7
SWEP.ReloadShellInsertWait = 0.6
SWEP.Chamberable = false

SWEP.HipSpread = 0.036
SWEP.AimSpread = 0.003
SWEP.ClumpSpread = 0.012
SWEP.VelocitySensitivity = 4
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.02
SWEP.SpreadCooldown = 1.03
SWEP.Shots = 11
SWEP.Damage = 8.5
SWEP.DeployTime = 1
--PATH addons/zeros_weedfarm/lua/weapons/zwf_bong03.lua:
AddCSLuaFile()
DEFINE_BASECLASS("zwf_bong")

SWEP.Base = "zwf_bong"
SWEP.PrintName = "Dark Leaf"
SWEP.Category = "Zeros GrowOP"
SWEP.ViewModelFOV = 90
SWEP.ViewModel = "models/zerochain/props_weedfarm/zwf_bong03_vm.mdl"
SWEP.WorldModel = "models/zerochain/props_weedfarm/zwf_bong03_vm.mdl"
SWEP.AdminSpawnable = true
SWEP.Spawnable = true

SWEP.BongID = 3

if CLIENT then
	SWEP.WepSelectIcon = surface.GetTextureID("zerochain/zwf/vgui/zwf_swep_bong03")
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

--PATH addons/zeros_weedfarm/lua/weapons/zwf_sniffer/cl_init.lua:
include("shared.lua")
SWEP.PrintName = "Weed Sniffer" // The name of your SWEP
SWEP.Slot = 1
SWEP.SlotPos = 2
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true // Do you want the SWEP to have a crosshair?



function SWEP:SecondaryAttack()

	self:SetNextSecondaryFire(CurTime() + zwf.config.SnifferSWEP.interval)
end

function SWEP:PrimaryAttack()

	self:SetNextPrimaryFire(CurTime() + zwf.config.SnifferSWEP.interval)
end

--PATH addons/darkrpadvancedkeys/lua/entities/adv_veh_alarm/cl_init.lua:
include( "shared.lua" )

function ENT:Initialize()
end

function ENT:Draw()
	self:DrawModel()
end

function ENT:Think()
end
--PATH addons/darkrpadvancedkeys/lua/entities/adv_veh_alarm/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Vehicle Alarm"
ENT.Author = "Crap-Head"
ENT.Spawnable = false
ENT.AdminSpawnable = true

function ENT:SetupDataTables()
	self:NetworkVar( "Entity", 1, "owning_ent" )
end
--PATH addons/mod_bitminers2/lua/entities/bm2_bitminer_server/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	self.fanAng = 0
end

//Animate fans
function ENT:Think()
	if LocalPlayer():GetPos():Distance(self:GetPos()) < 500 then
		if self:GetShouldAnimate() then
			self.fanAng = self.fanAng + (FrameTime() * 400)
			for i = 0 , self:GetBoneCount() - 1 do
				if string.match( self:GetBoneName(i), "fan" ) ~= nil then
					self:ManipulateBoneAngles(i,Angle(self.fanAng,0,0))
				end
			end
		end 
	end
end

function ENT:Draw()
	self:DrawModel()
end
--PATH addons/mod_bitminers2/lua/entities/bm2_extention_lead/cl_init.lua:
include("shared.lua")

function ENT:Initialize()

end

function ENT:Draw()
	self:DrawModel()
end
--PATH addons/bricks_gangs/lua/entities/bricks_server_gangprinter/shared.lua:

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
 
ENT.PrintName		= "Gang Printer"
ENT.Category		= "Brick's Gangs"
ENT.Author			= "Brickwall"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable		= true
ENT.IncomeTrackAmount = 10

function ENT:SetupDataTables()
	self:NetworkVar( "Int", 0, "Holding" )

	if( SERVER ) then
		self:NetworkVarNotify( "Holding", function( entity, name, old, new )
			if( #entity.IncomeTrackTable >= entity.IncomeTrackAmount ) then
				table.remove( entity.IncomeTrackTable, 1 )
			end

			table.insert( entity.IncomeTrackTable, new )
		end )
	end

	self:NetworkVar( "Int", 1, "HoldingEXP" )
	self:NetworkVar( "Int", 2, "Temperature" )
	self:NetworkVar( "Int", 3, "NextPrint" )

	self:NetworkVar( "Int", 4, "GangID" )
	self:NetworkVar( "Int", 5, "PrinterID" )
	self:NetworkVar( "Int", 6, "Servers" )

	self:NetworkVar( "Bool", 0, "Status" )
	self:NetworkVar( "Bool", 1, "Overheated" )
end

function ENT:GetPrintAmount()
	local printerConfigTable = BRICKS_SERVER.CONFIG.GANGPRINTERS.Printers[self:GetPrinterID()]

	if( not printerConfigTable ) then return 100 end

	local printAmount = 0
	for i = 1, self:GetServers() do
		local amountUpgradeTier = ((BRICKS_SERVER.CONFIG.GANGPRINTERS.ServerUpgrades["Amount"] or {}).Tiers or {})[self:GetNW2Int( "AmountServer" .. i, 0 )] or {}
		local multiplier = 1+((amountUpgradeTier.ReqInfo or {})[1] or 0)/100

		printAmount = printAmount+((printerConfigTable.ServerAmount or 0)*multiplier)
	end

	return printAmount
end

function ENT:GetTargetTemp()
	local printerConfigTable = BRICKS_SERVER.CONFIG.GANGPRINTERS.Printers[self:GetPrinterID()]

	if( not printerConfigTable ) then return 0 end

	local targetTemp = 0
	for i = 1, self:GetServers() do
		local amountUpgradeTier = ((BRICKS_SERVER.CONFIG.GANGPRINTERS.ServerUpgrades["Cooling"] or {}).Tiers or {})[self:GetNW2Int( "CoolingServer" .. i, 0 )] or {}
		local multiplier = 1-((amountUpgradeTier.ReqInfo or {})[1] or 0)/100

		targetTemp = targetTemp+((printerConfigTable.ServerHeat or 0)*multiplier)
	end

	return targetTemp
end

function ENT:GetPrintTime()
	local printerConfigTable = BRICKS_SERVER.CONFIG.GANGPRINTERS.Printers[self:GetPrinterID()]

	if( not printerConfigTable ) then return 1 end

	local printTime = 0
	for i = 1, self:GetServers() do
		local amountUpgradeTier = ((BRICKS_SERVER.CONFIG.GANGPRINTERS.ServerUpgrades["Speed"] or {}).Tiers or {})[self:GetNW2Int( "SpeedServer" .. i, 0 )] or {}
		local multiplier = math.Clamp( (1-((i-1)*BRICKS_SERVER.DEVCONFIG.GangPrinterServerTime))-((amountUpgradeTier.ReqInfo or {})[1] or 0)/100, 0, 1 )

		printTime = printTime+((printerConfigTable.ServerTime or 0)*multiplier)
	end

	return printTime
end

function ENT:GetTotalHealth()
	local health = BRICKS_SERVER.CONFIG.GANGPRINTERS["Base Printer Health"]

	local healthTier = BRICKS_SERVER.CONFIG.GANGPRINTERS.Upgrades["Health"].Tiers[self:GetNW2Int( "HealthUpgrade", 0 )]
	if( healthTier ) then
		health = health*(1+(healthTier.ReqInfo[1]/100))
	end

	return health
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
--PATH addons/cp_ballistic_shields/lua/entities/bs_shield/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Deployed shield"
ENT.Category = "Ballistic shields"

ENT.Spawnable = false
ENT.DisableDuplicator = true

function ENT:Use( activator )
	if IsValid( activator ) && activator:IsPlayer() && self.Entity.Owner == activator then
		activator:Give( "deployable_shield" )
		activator:EmitSound( "npc/combine_soldier/gear2.wav" )
		table.RemoveByValue(activator.bs_shields, self.Entity)
		self.Entity:Remove()
	end
end
--PATH addons/the_cocaine_factory/lua/entities/cocaine_drugs_buyer/shared.lua:
ENT.Base = "base_ai" 
ENT.Type = "ai"

ENT.PrintName = "NPC Buyer"
ENT.Author = "Mikael & Crap-Head"
ENT.Category = "The Cocaine Factory"

ENT.Spawnable = true
ENT.AdminSpawnable = true

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT
ENT.AutomaticFrameAdvance = true
--PATH addons/truefishing/lua/entities/ent_buoy/shared.lua:

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Buoy"
ENT.Purpose			= "Because prop_physics aren't called in PlayerUse hook..."
ENT.Author			= "Tomasas"

--PATH addons/truefishing/lua/entities/fishing_pot_medium/cl_init.lua:
include('shared.lua')

	
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

local IsOpen = false
local function FishingPotMenu()
	local ent, buoy, deployed, canhook, unhook, hasfish, needsbait = net.ReadEntity(), net.ReadEntity(), net.ReadBool(), net.ReadBool(), net.ReadBool(), net.ReadBool(), net.ReadBool()
	if IsOpen or !ent:IsValid() then return end
	
	IsOpen = true
	gui.EnableScreenClicker(true)
	local min, max
	if buoy and buoy:IsValid() then
		min, max = buoy:WorldSpaceAABB()
	else
		min, max = ent:WorldSpaceAABB()
	end
	local pos = ((min + max) * 0.5):ToScreen()
	pos.x = math.Clamp(pos.x, 250, ScrW()-250)
	pos.y = math.Clamp(pos.y, 176, ScrH()-176)

	local buttons = {}
	if /*ent:GetClass() == "fishing_pot_medium" and*/ !deployed and !hasfish and !needsbait then
		local num = #buttons + 1
		buttons[num] = vgui.Create("DButton")
		buttons[num]:SetText("")
		buttons[num].Text = TrueFishLocal("deploy_fish_cage")
		buttons[num].Paint = function(self)
			local colorHover = self.IsHoveringOver and 220 or 255
			surface.SetDrawColor(colorHover, colorHover, colorHover, 255)
			surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
			
			surface.SetDrawColor(0, 0, 0, 255)
			surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall())
			
			draw.SimpleTextOutlined(self.Text, "SegoeUI_Normal", self:GetWide()*0.5, self:GetTall()*0.5-1, Color(0, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0.35, Color(35, 35, 35, 255))
		end
		buttons[num].PaintOver = function() end
		buttons[num].OnCursorEntered = function(self) self.IsHoveringOver = true end
		buttons[num].OnCursorExited = function(self) self.IsHoveringOver = false end
		
		buttons[num].DoClick = function(self)
			net.Start("m_p_deploy")
			net.WriteEntity(ent)
			net.SendToServer()
			for k,v in pairs(buttons) do
				v:Remove()
			end
			IsOpen = false
			gui.EnableScreenClicker(false)
		end
	end
	
	if /*ent:GetClass() == "fishing_pot_medium" and*/ !deployed and hasfish then
		local num = #buttons + 1
		buttons[num] = vgui.Create("DButton")
		buttons[num]:SetText("")
		buttons[num].Text = TrueFishLocal("collect_fish")
		buttons[num].Paint = function(self)
			local colorHover = self.IsHoveringOver and 220 or 255
			surface.SetDrawColor(colorHover, colorHover, colorHover, 255)
			surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
			
			surface.SetDrawColor(0, 0, 0, 255)
			surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall())
			
			draw.SimpleTextOutlined(self.Text, "SegoeUI_Normal", self:GetWide()*0.5, self:GetTall()*0.5-1, Color(0, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0.35, Color(35, 35, 35, 255))
		end
		buttons[num].PaintOver = function() end
		buttons[num].OnCursorEntered = function(self) self.IsHoveringOver = true end
		buttons[num].OnCursorExited = function(self) self.IsHoveringOver = false end
		
		buttons[num].DoClick = function(self)
			net.Start("m_p_collect")
			net.WriteEntity(ent)
			net.SendToServer()
			for k,v in pairs(buttons) do
				v:Remove()
			end
			IsOpen = false
			gui.EnableScreenClicker(false)
		end
	end
	
	if canhook or unhook then
		local num = #buttons + 1
		buttons[num] = vgui.Create("DButton")
		buttons[num]:SetText("")
		buttons[num].Text = unhook and TrueFishLocal("untie_fish_cage") or TrueFishLocal("tie_down_fish_cage")
		buttons[num].Paint = function(self)
			local colorHover = self.IsHoveringOver and 220 or 255
			surface.SetDrawColor(colorHover, colorHover, colorHover, 255)
			surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
			
			surface.SetDrawColor(0, 0, 0, 255)
			surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall())
			
			draw.SimpleTextOutlined(self.Text, "SegoeUI_Normal", self:GetWide()*0.5, self:GetTall()*0.5-1, Color(0, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0.35, Color(35, 35, 35, 255))
		end
		buttons[num].PaintOver = function() end
		buttons[num].OnCursorEntered = function(self) self.IsHoveringOver = true end
		buttons[num].OnCursorExited = function(self) self.IsHoveringOver = false end
		
		buttons[num].DoClick = function(self)
			net.Start("m_p_hook")
			net.WriteEntity(ent)
			net.SendToServer()
			for k,v in pairs(buttons) do
				v:Remove()
			end
			IsOpen = false
			gui.EnableScreenClicker(false)
		end
	end
	
		local num = #buttons + 1
		buttons[num] = vgui.Create("DButton")
		buttons[num]:SetText("")
		buttons[num].Text = TrueFishLocal("close_menu")
		buttons[num].Paint = function(self)
			local colorHover = self.IsHoveringOver and 220 or 255
			surface.SetDrawColor(colorHover, colorHover, colorHover, 255)
			surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
			
			surface.SetDrawColor(0, 0, 0, 255)
			surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall())
			
			draw.SimpleTextOutlined(self.Text, "SegoeUI_Normal", self:GetWide()*0.5, self:GetTall()*0.5-1, Color(0, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0.35, Color(35, 35, 35, 255))
		end
		buttons[num].PaintOver = function() end
		buttons[num].OnCursorEntered = function(self) self.IsHoveringOver = true end
		buttons[num].OnCursorExited = function(self) self.IsHoveringOver = false end
		
		buttons[num].DoClick = function(self)
			for k,v in pairs(buttons) do
				v:Remove()
			end
			IsOpen = false
			gui.EnableScreenClicker(false)
		end
	
	
	local longest = 0
	for k,v in pairs(buttons) do
		surface.SetFont("SegoeUI_Normal")
		local txtsize = surface.GetTextSize(v.Text)
		longest = txtsize > longest and txtsize or longest
	end
	longest = longest + 8
	for k,v in pairs(buttons) do
		v:SetSize(longest, 25)
		v:SetPos(pos.x-longest*0.5, pos.y+(k*25))
		v:MakePopup()
		v:SetKeyboardInputEnabled(true)
	end

end
net.Receive("MediumPotMenu", FishingPotMenu)


net.Receive("FishPotUpdate", function()
	local ent = net.ReadEntity()
	if !ent:IsValid() then return end
	local mode = net.ReadUInt(2)
	if mode == 0 and !TrueFish.CAGE_NO_FISH_MODEL then
		ent:AddFish(net.ReadUInt(6))
	elseif mode == 1 then
		local toRemove = {}
		while true do
			local id, num = net.ReadUInt(6), net.ReadUInt(8)
			if id == 0 then break end
			toRemove[#toRemove+1] = {id, num}
		end
		for i=1, #toRemove do
			for k,v in pairs(ent.FishToDisplay) do
				if (toRemove[i][1] == v.FishID and toRemove[i][2] > 0) then
					v:Remove()
					ent.FishToDisplay[k] = nil
					toRemove[i][2] = toRemove[i][2]-1
				end
			end
		end
	elseif mode == 2 then
		ent:AddBait()
	elseif mode == 3 then
		if ent.Bait and ent.Bait:IsValid() then
			ent.Bait:Remove()
		end
		ent.Bait = nil
	end
end)

function ENT:AddFish(fish)
	local pos = self:GetPos() + self:GetUp()
	local rh, num = self:GetRight(), #self.FishToDisplay%10
	if num < 5 then
		num = num + 1
		self.FishToDisplay[num] = ClientsideModel(TrueFishGetFishModel(fish), RENDERGROUP_OPAQUE)
		self.FishToDisplay[num].FishID = fish
		self.FishToDisplay[num]:SetAngles(Angle(math.random(1,360), math.random(1,360), math.random(1,360)))
		self.FishToDisplay[num]:SetPos(pos - (rh*(num*5.5-10)))
		self.FishToDisplay[num]:SetParent(self)
		self.FishToDisplay[num]:DrawShadow(false)
		self.FishToDisplay[num]:SetNoDraw(true)
	else
		num = num + 1
		self.FishToDisplay[num] = ClientsideModel(TrueFishGetFishModel(fish), RENDERGROUP_OPAQUE)
		self.FishToDisplay[num].FishID = fish
		self.FishToDisplay[num]:SetAngles(Angle(math.random(1,360), math.random(1,360), math.random(1,360)))
		self.FishToDisplay[num]:SetPos(pos + (rh*(num*5.5-40)))
		self.FishToDisplay[num]:SetParent(self)
		self.FishToDisplay[num]:DrawShadow(false)
		self.FishToDisplay[num]:SetNoDraw(true)
	end
end

function ENT:AddBait()
	self.Bait = ClientsideModel("models/props_junk/garbage_bag001a.mdl", RENDERGROUP_OPAQUE)
	self.Bait:SetMaterial("models/flesh")
	local ang = self:GetAngles()
	self.Bait:SetPos(self:GetPos() - ang:Up()*9.5)
	ang:RotateAroundAxis(ang:Right(), -90)
	self.Bait:SetAngles(ang)
	self.Bait:SetParent(self)
	self.Bait:DrawShadow(false)
	self.Bait:SetNoDraw(true)
end

function ENT:Initialize()
	self.FishToDisplay = {}
end

local cw, ccw, mat = MATERIAL_CULLMODE_CW, MATERIAL_CULLMODE_CCW,
CreateMaterial("CagePotMaterial", "VertexLitGeneric", {["$translucent"] = 1, ["$surfaceprop"] = "metal", ["$basetexture"] = "Metal/metalfence007a"})
function ENT:Draw()
	if !TrueFish.CAGE_NO_FISH_MODEL then
		for k,v in pairs(self.FishToDisplay) do
			if v:IsValid() then
				v:DrawModel()
			end
		end
	end
	if self.Bait and self.Bait:IsValid() then
		self.Bait:DrawModel()
	end

	render.MaterialOverride(mat)
	render.CullMode(cw)
	self:DrawModel()
	render.CullMode(ccw)
	self:DrawModel()
	render.MaterialOverride()	
end

ENT.DrawTranslucent = ENT.Draw

function ENT:OnRemove()
	for k,v in pairs(self.FishToDisplay) do
		v:Remove()
	end
	if self.Bait and self.Bait:IsValid() then
		self.Bait:Remove()
	end
end

--PATH addons/truefishing/lua/entities/fishing_pot_medium/shared.lua:
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Medium Fishing Pot"
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

//ENT.FishDepths = {Damselfish = 250, GoldFish = 100, Snapper = 525, Rainbow = 200, GoldenFish = 750, CatFish = 830, BassFish = 955}

--PATH addons/truefishing/lua/entities/fishing_rod_pole/shared.lua:
ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Fishing Rod Pole"
ENT.Author			= "Tomasas"

function ENT:SetupDataTables()
	self:DTVar("Entity", 0, "Player")
	self:DTVar("Entity", 1, "Hook")
end

--PATH addons/casino/lua/entities/gambling_machine_fiftyfifty/shared.lua:
ENT.Type 		= 'anim'
ENT.Base 		= 'base_gmodentity'
ENT.PrintName 	= 'Казино - 50/50'
ENT.Spawnable 	= true
ENT.Category 	= 'RP Machines'

ENT.CanSetPrice = true
ENT.Casino = true
ENT.MinPrice = 500
ENT.MaxPrice = 1000000
function ENT:SetupDataTables()
	--self.BaseClass.SetupDataTables(self)

	self:NetworkVar('Bool', 0, 'InService')
	self:NetworkVar('Bool', 1, 'IsPayingOut')
	self:NetworkVar('Entity', 1, 'owning_ent')
	self:NetworkVar('Int', 1, 'PlayerRoll')
	self:NetworkVar('Int', 2, 'HouseRoll')
	self:NetworkVar('Int', 3, 'price')
end
--PATH addons/casino/lua/entities/gambling_machine_spinwheel/cl_init.lua:
include('shared.lua')

local mat_wheel = Material 'sup/entities/spinwheel/wheel'
local mat_cursor = Material 'sup/entities/spinwheel/cursor'

function ENT:DrawScreen(x, y, w, h)
	surface.SetDrawColor(255, 255, 255)

	surface.SetMaterial(mat_wheel)
	surface.DrawTexturedRectRotated(0, 0, w, h, 360 * (self:GetRoll()/8))

	surface.SetMaterial(mat_cursor)
	surface.DrawTexturedRect(x, y, w, h)

	draw.SimpleText(DarkRP.formatMoney(self:Getprice()), 'rp.GamblingMachines', x + 926, y + 724, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
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


--PATH addons/casino/lua/entities/gambling_machine_spinwheel/shared.lua:
ENT.Type 		= 'anim'
ENT.Base 		= 'base_gmodentity'
ENT.PrintName 	= 'Казино - Колесо Удачи'
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
	self:NetworkVar('Int', 1, 'Roll')
	self:NetworkVar('Int', 2, 'price')
end




--PATH addons/_gmbheist/lua/entities/gmb_robber/cl_init.lua:
include('shared.lua')

local color_white = Color(255,255,255)
local color_black = Color(0,0,0)

local complex_off = Vector(0, 0, 9)

local ang = Angle(0, 90, 90)
function ENT:Draw()
	self:DrawModel()

	local bone = self:LookupBone('ValveBiped.Bip01_Head1')
	pos = self:GetBonePosition(bone) + complex_off

	ang.y = (LocalPlayer():EyeAngles().y - 90)

	if (LocalPlayer():GetPos():Distance(self:GetPos()) < 200 or LocalPlayer():GetEyeTrace().Entity == self) then
		cam.Start3D2D(pos, ang, 0.03)
			draw.SimpleTextOutlined('Грабитель Джо', '3d2d', 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, color_black)
		cam.End3D2D()
	end
end
local fr
net.Receive('gmb.robbermenu', function()
	if IsValid(fr) then fr:Close() end

	fr = ui.Create('ui_frame', function(self)
		self:SetTitle('Грабитель Джо')
		self:SetSize(450, 125)
		self:Center()
		self:MakePopup()
	end)

	ui.Create('DLabel', function(self, p)
		self:SetPos(5, 30)
		self:SetText('Оооо, ' ..LocalPlayer():Name() ..' здарова братан.\nТы принёс сумку с бабосами?\n\nПросто нажми на меня ПКМ с сумкой в руках')
		self:SizeToContents()
	end, fr)
end)

--PATH addons/pianino/lua/entities/gmt_instrument_piano/cl_init.lua:
include("shared.lua")

ENT.AllowAdvancedMode = true

// For drawing purposes
// Override by adding MatWidth/MatHeight to key data
ENT.DefaultMatWidth = 32
ENT.DefaultMatHeight = 128
// Override by adding TextX/TextY to key data
ENT.DefaultTextX = 11
ENT.DefaultTextY = 100
ENT.DefaultTextColor = Color( 150, 150, 150, 150 )
ENT.DefaultTextColorActive = Color( 80, 80, 80, 150 )
ENT.DefaultTextInfoColor = Color( 46, 20, 6, 255 )

ENT.MaterialDir	= "gmod_tower/instruments/piano/piano_note_"

ENT.KeyMaterials = {
	["left"] = ENT.MaterialDir .. "left",
	["leftmid"] = ENT.MaterialDir .. "leftmid",
	["right"] = ENT.MaterialDir .. "right",
	["rightmid"] = ENT.MaterialDir .. "rightmid",
	["middle"] = ENT.MaterialDir .. "middle",
	["top"] = ENT.MaterialDir .. "top",
	["full"] = ENT.MaterialDir .. "full",
}

ENT.MainHUD = {
	Material = "gmod_tower/instruments/piano/piano",
	X = ( ScrW() / 2 ) - ( 313 / 2 ),
	Y = ScrH() - 316,
	TextureWidth = 512,
	TextureHeight = 256,
	Width = 313,
	Height = 195,
}

ENT.AdvMainHUD = {
	Material = "gmod_tower/instruments/piano/piano_large",
	X = ( ScrW() / 2 ) - ( 940 / 2 ),
	Y = ScrH() - 316,
	TextureWidth = 1024,
	TextureHeight = 256,
	Width = 940,
	Height = 195,
}

ENT.BrowserHUD = {
	URL = "http://www.gmtower.org/apps/instruments/piano.php?",
	Show = true, // display the sheet music?
	X = ( ScrW() / 2 ),
	Y = ENT.MainHUD.Y - 190,
	Width = 450,
	Height = 250,
	AdvWidth = 600,
}

function ENT:CtrlMod()

	self:ToggleAdvancedMode()

	if self.OldKeys then
		self.Keys = self.OldKeys
		self.OldKeys = nil
	else
		self.OldKeys = self.Keys
		self.Keys = self.AdvancedKeys
	end

end

function ENT:ShiftMod()
	self:ToggleShiftMode()
end
--PATH addons/111mod/lua/entities/health_station/shared.lua:
--[[---------------------------------------------------------------------------
This is an example of a custom entity.
---------------------------------------------------------------------------]]
AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Health Station"
ENT.Category = "@GambitEnts"
ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "price")
	self:NetworkVar("Entity", 0, "owning_ent")
end

--PATH addons/itemstore_new/lua/entities/itemstore_npc_shop.lua:
ENT.Type = "ai"
ENT.Base = "base_ai"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

ENT.PrintName = "NPC Shop"
ENT.Category = "Other"

ENT.Spawnable = true
ENT.AdminOnly = true

ENT.AutomaticFrameAdvance = true

ENT.IsShop = true

function ENT:SetupDataTables()
	self:NetworkVar( "String", 0, "Title" )
end

function ENT:Think()
	self:NextThink( CurTime() )
	return true
end

if SERVER then
	AddCSLuaFile()

	function ENT:Initialize()
		self:SetModel( "models/Humans/Group03/Female_01.mdl" )

		self:SetMoveType( MOVETYPE_NONE )
		self:SetSolid( SOLID_BBOX )
		self:SetUseType( SIMPLE_USE )
		--self:DropToFloor()

		local min, max = self:GetCollisionBounds()
		self:SetCollisionBounds( Vector( -13, -13, 0 ), max)
		self:ResetSequence( 2 )

		self:SetTitle( "NPC Trader" )

		self.Container = itemstore.Container( unpack( itemstore.config.NPCShopSize ) )

		self.Container:AddCallback( "read", function( con, pl )
			return pl:GetPos():Distance( self:GetPos() ) < 250
		end )

		self.Container:AddCallback( "write", function( to_con, pl, action, from_con, from_slot, from_item, to_slot, to_item )
			if not pl:IsAdmin() then return false end

			if action == "move" and from_item then
				net.Start( "ItemStorePriceShopItem" )
					net.WriteEntity( self )
					net.WriteUInt( to_slot, 16 )
				net.Send( pl )
			end

			itemstore.shops.Save()

			return true
		end )
	end

	function ENT:AcceptInput( input, activator, caller )
		if input ~= "Use" or not  IsValid( caller ) or not caller:IsPlayer() then return end

		if self.Teams and not table.HasValue( self.Teams, team.GetName( caller:Team() ) ) then
			caller:ChatPrint( "This shop is limited to certain teams only, sorry!" ) return end
		
		self.Container:Sync( caller )

		net.Start( "ItemStoreOpenShop" )
			net.WriteEntity( self )
			net.WriteUInt( self.Container:GetID(), 32 )
		net.Send( caller )
	end

	function ENT:PriceItem( pl, slot, price )
		if not pl:IsAdmin() then return end

		local item = self.Container:GetItem( slot )
		if not IsValid( item ) then return end

		item:SetData( "ShopPrice", price )
	end

	util.AddNetworkString( "ItemStoreRequestShopInfo" )
	net.Receive( "ItemStoreRequestShopInfo", function( len, pl )
		if not pl:IsAdmin() then return end

		local ent = net.ReadEntity()
		if not IsValid( ent ) then return end

		local title = ent:GetTitle()
		local w = ent.Container:GetWidth()
		local h = ent.Container:GetHeight()
		local p = ent.Container:GetPages()
		local model = ent:GetModel()
		local teams = ent.Teams

		net.Start( "ItemStoreRequestShopInfo" )
			net.WriteEntity( ent )
			net.WriteString( title )
			net.WriteUInt( w, 8 )
			net.WriteUInt( h, 8 )
			net.WriteUInt( p, 8 )
			net.WriteString( model )

			net.WriteUInt( teams and #teams or 0, 8 )

			if teams then
				for k, v in ipairs( teams ) do
					net.WriteString( v )
				end
			end
		net.Send( pl )
	end )

	util.AddNetworkString( "ItemStoreEditShop" )
	net.Receive( "ItemStoreEditShop", function( len, pl )
		if not pl:IsAdmin() then return end

		local ent = net.ReadEntity()
		if not IsValid( ent ) then return end

		local title = net.ReadString()
		local w = net.ReadUInt( 8 )
		local h = net.ReadUInt( 8 )
		local p = net.ReadUInt( 8 )
		local model = net.ReadString()
		local teams = {}

		for i = 1, net.ReadUInt( 8 ) do
			teams[ i ] = net.ReadString()
		end

		ent:SetTitle( title )
		ent.Container:SetWidth( w )
		ent.Container:SetHeight( h )
		ent.Container:SetPages( p )
		ent:SetModel( model )
		ent.Teams = #teams > 0 and teams or nil

		itemstore.shops.Save()
	end )
else
	function ENT:DrawTranslucent()
		self:DrawModel()

		local text = self:GetTitle()
		local font = "DermaLarge"

		surface.SetFont( font )
		local textw, texth = surface.GetTextSize( text )
		local w = 5 + textw + 5
		local h = 2 + texth + 2
		local x, y = -w / 2, -h / 2

		cam.Start3D2D( self:GetPos() + self:GetAngles():Up() * 80, Angle( 0, CurTime() * 45, 90 ), 0.35 )
			surface.SetDrawColor( Color( 0, 0, 0, 200 ) )
			surface.DrawRect( x, y, w, h )

			draw.SimpleTextOutlined( text, font, 0, 0, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
		cam.End3D2D()
	end

	net.Receive( "ItemStoreRequestShopInfo", function( len, pl )
		local ent = net.ReadEntity()
		if not IsValid( ent ) then return end

		local title = net.ReadString()
		local w = net.ReadUInt( 8 )
		local h = net.ReadUInt( 8 )
		local p = net.ReadUInt( 8 )
		local model = net.ReadString()
		local teams = {}

		for i = 1, net.ReadUInt( 8 ) do
			teams[ i ] = net.ReadString()
		end

		local p = vgui.Create( "ItemStoreShopEditor" )
		p:SetEntity( ent )
		p:SetName( title )
		p:SetWidth( w )
		p:SetHeight( h )
		p:SetPages( p )
		p:SetModel( model )
		p:SetTeams( teams )
		p:Center()
		p:MakePopup()
	end )
end

properties.Add( "edititemstoreshop", {
	MenuLabel = "Edit Shop",
	MenuIcon = "icon16/pencil.png",

	Filter = function( self, ent, pl )
		return pl:IsAdmin() and ent:GetClass() == "itemstore_npc_shop"
	end,

	Action = function( self, ent )
		net.Start( "ItemStoreRequestShopInfo" )
			net.WriteEntity( ent )
		net.SendToServer()
	end
} )
--PATH addons/executioner/lua/entities/phone_box/shared.lua:
AddCSLuaFile()

ENT.Base = "base_gmodentity"
ENT.Type = "anim"

ENT.Category		= "@GambitEnts"
ENT.Spawnable		= true

ENT.PrintName		= "Phone Box"
ENT.Author			= "@GambitEnts"
ENT.Purpose			= "Call your local hitman."
ENT.Instructions	= ""

if CLIENT then
    surface.CreateFont( "rHit.Font.PhoneBox", { font = "BFHUD", size = 90, weight = 800, bold = true } )
    local color_white = Color(255, 255, 255)
    local color_black = Color(0, 0, 0)
    local complex_off = Vector(0, 0, 9)
    local ang = Angle(0, 90, 90)

    local cam_End3D2D, cam_Start3D2D, LocalPlayer, CurTime, draw_SimpleTextOutlined, math_sin = cam.End3D2D, cam.Start3D2D, LocalPlayer, CurTime, draw.SimpleTextOutlined, math.sin

    function ENT:Draw()
        self:DrawModel()
        pos = self:GetPos() + Vector(0, 0, 30) + complex_off
        ang.y = (LocalPlayer():EyeAngles().y - 90)
        local x = math_sin(CurTime() * math.pi) * 30

        if (LocalPlayer():GetPos():Distance(self:GetPos()) < 200 or LocalPlayer():GetEyeTrace().Entity == self) then
            cam_Start3D2D(pos, ang, 0.05)
            -- draw_SimpleTextOutlined('Телефон', '3d2d', 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, color_black)
            cam_End3D2D()
        end
    end
else
    function ENT:Initialize()
        self:SetModel( "models/props_trainstation/payphone001a.mdl" )
        self:PhysicsInit( SOLID_VPHYSICS )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:SetSolid( SOLID_VPHYSICS )
        --self:SetRenderFX( kRenderFxSolidFast )
        self:SetUseType( SIMPLE_USE )
        local phys = self:GetPhysicsObject()
        if phys:IsValid() then phys:Wake() end
    end

    function ENT:Use( null, caller, type )
        if !IsValid( caller ) or !caller:IsPlayer() then return end
        if caller.My_Hitman then caller.My_Hitman = nil end
        if not caller:Alive() or caller:isArrested() then return end
        if Executioner.Config.No_Place_Teams[ team.GetName( caller:Team() ) ] then Executioner.SendMessage( caller, 'Ты не можешь сделать заказ за свою профессию.' ) return end
        if not Executioner.Config.PhoneEnabled or Executioner.Config.BlackList_Teams[ team.GetName( caller:Team() ) ] then Executioner.SendMessage( caller, Executioner.Language.PhoneNotInService ) return end
        if Executioner.Config.Hitman_Teams[ team.GetName( caller:Team() ) ] then Executioner.SendMessage( caller, Executioner.Language.HitmanOnUsePhone ) return end
        if caller.rHit_PlaceCooldown and caller.rHit_PlaceCooldown > CurTime() then Executioner.SendMessage( caller, Executioner.Language.HitTooSoon ) return end
        if caller.rHit_PlacedHit or caller:GetNW2Bool( 'rHit_ActiveHit' ) then Executioner.SendMessage( caller, Executioner.Language.HitmanActiveHit ) return end
        net.Start( 'rHit.Open.Placement' )
            net.WriteTable( Executioner.PhoneTracker )
        net.Send( caller )
    end

    hook.Add( 'CanTool', 'rHit.Prevent.Tool', function( self, trace, tool )
        if tool == 'remover' and IsValid( trace.Entity ) and trace.Entity:GetClass() == "phone_box" then
            if self:IsSuperAdmin() then return true else return false end
        end
    end )

    hook.Add( 'PhysgunPickup', 'rHit.Prevent.Pickup', function( self, ent )
        if self:IsSuperAdmin() and ent:GetClass() == 'phone_box' then return true end
    end )
end

--PATH addons/deceive/lua/entities/sent_disguise_kit/shared.lua:
-- local ENT = {}

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.ClassName = "sent_disguise_kit"
ENT.PrintName = "Disguise Kit"
ENT.Author = "tenrys"
ENT.Category = "Deceive - Disguise"
ENT.Spawnable = false
ENT.AdminSpawnable = false

-- scripted_ents.Register(ENT, ENT.ClassName)
--PATH addons/111mod/lua/entities/sent_goalpost.lua:
AddCSLuaFile()

--this is not done yet

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Goal post"
ENT.Category = "Other"
ENT.Author = "Urbanichka"
ENT.Spawnable = false
ENT.AdminOnly = false

function ENT:SpawnFunction( ply , tr , classname )
	if not tr.Hit then
		return
	end

	local spawnpos = tr.HitPos + tr.HitNormal * 25

	local ent = ents.Create( classname )
	ent:SetPos( spawnpos )
	ent:Spawn()
	return ent
end

function ENT:SetupDataTables()

end

function ENT:Initialize()
	
	
	self.CurrentMesh = {}
end

function ENT:UpdateMesh( vecmin , vecmax )

end

--defined shared so that when we make it static, people won't glitch around it and shit
function ENT:CreatePhysicsFromCurrentMesh()

end



if SERVER then

else
	function ENT:CreateIMeshFromCurrentMesh()

	end
	
	function ENT:DrawGoalPost( flags )
	
	end

	function ENT:DrawNet( flags )
	
	end


	function ENT:Draw( flags )
		self:DrawGoalPost( flags )
	end
	
	function ENT:DrawTranslucent( flags )
		self:DrawNet( flags )
	end
end
--PATH addons/111mod/lua/entities/sent_soccerball.lua:
AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Мячик"
ENT.Category = "Other"
ENT.Author = "Travka"
ENT.Spawnable = true
ENT.AdminOnly = false

if CLIENT then
	ENT.HitMaterial = Material( util.DecalMaterial( "impact.concrete" ) )
	ENT.RenderGroup = RENDERGROUP_BOTH
else
	ENT.CanPickupSoccerball = CreateConVar( 
		"sv_pickupsoccerball" , 
		"1", 
		{ 
			FCVAR_SERVER_CAN_EXECUTE, 
			FCVAR_ARCHIVE 
		}, 
		"When true, it allows anyone to pickup the soccerball" 
	)
end

function ENT:SpawnFunction( ply , tr , classname )
	if not tr.Hit then
		return
	end

	local spawnpos = tr.HitPos + tr.HitNormal * 25

	local ent = ents.Create( classname )
	ent:SetPos( spawnpos )
	ent:Spawn()
	return ent
end

function ENT:SetupDataTables()
	self:NetworkVar( "Float" , 0 , "LastImpact" )	
	self:NetworkVar( "Float" , 1 , "PressureExpireStart" )
	self:NetworkVar( "Float" , 2 , "PressureExpireEnd" )
end



function ENT:Initialize()
	if SERVER then
		self:SetMaxHealth( 50 )
		self:SetHealth( 50 )
		self:SetLagCompensated( true )	
		self:SetUseType( SIMPLE_USE )	
		self:SetModel( "models/props_phx/misc/soccerball.mdl" )
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )

		self:ResetPressure()
		self:SetTrigger( true )	

		local physobj =  self:GetPhysicsObject()

		if IsValid( physobj ) then
			physobj:AddGameFlag( FVPHYSICS_NO_IMPACT_DMG )
			physobj:AddGameFlag( FVPHYSICS_NO_NPC_IMPACT_DMG )
			physobj:SetBuoyancyRatio( 0.5 )
			physobj:SetDamping( 0.25 , 1 )
			physobj:Wake( )
		end

		self:StartMotionController()
	end

	self:SetCollisionGroup( COLLISION_GROUP_WEAPON )
end

function ENT:GetPressure()
	local pressure = math.Clamp( math.TimeFraction( self:GetPressureExpireEnd() , self:GetPressureExpireStart() , CurTime() ) , 0 , 1 )

	return pressure
end

function ENT:ResetPressure()
	self:SetPressureExpireStart( 0 )
	self:SetPressureExpireEnd( 0 )
end

function ENT:IsLosingPressure()
	return self:GetPressureExpireStart() ~= 0 and self:GetPressureExpireEnd() ~= 0
end

function ENT:OnRemove()
	if CLIENT then
		if self.PressureLeakSound then
			self.PressureLeakSound:Stop()
			self.PressureLeakSound = nil
		end
	else

	end
end

if SERVER then
	function ENT:PhysicsSimulate( physobj , delta )
		return SIM_NOTHING
	end

	function ENT:OnTakeDamage( dmginfo )
		if self:IsEFlagSet( EFL_KILLME ) then
			return
		end

		self:TakePhysicsDamage( dmginfo )

		local dmg = dmginfo:GetDamage()

		local healthtoset = math.Clamp( self:Health() - dmg , 0 , self:GetMaxHealth() )

		self:SetHealth( healthtoset )

		local isoverkill = ( dmg >= ( self:GetMaxHealth() / 2 ) ) or ( healthtoset <= 0 )

		if ( isoverkill and not dmginfo:IsDamageType( DMG_BULLET ) ) or isoverkill then

			self:Remove()
		end

		if not self:IsEFlagSet( EFL_KILLME ) and dmginfo:IsDamageType( DMG_BULLET ) then
			if not self:IsLosingPressure() then
				self:SetPressureExpireStart( CurTime() )
				self:SetPressureExpireEnd( CurTime() + 5 )
			else
				self:SetPressureExpireEnd( self:GetPressureExpireEnd() - 0.5 )
			end
		end
	end

	function ENT:Use( activator )
		if self:IsPlayerHolding() then
			return
		end

		if IsValid( activator ) and activator:IsPlayer() then
			local canpickup = self.CanPickupSoccerball:GetBool()
			
			local hookval = hook.Run( "AllowPlayerPickup" , activator , self )
			
			if hookval ~= nil then
				canpickup = hookval
			end

			if hookval ~= false then
				activator:PickupObject( self )
			end
		end

	end


	function ENT:PhysicsCollide( data, physobj )


		if self:IsPlayerHolding() then
			return
		end

		if self:GetLastImpact() < CurTime() and data.DeltaTime > 0.2 and data.OurOldVelocity:Length() > 100 then
			self:EmitSound( "Rubber.ImpactHard" )
			self:SetLastImpact( CurTime() + 0.1 )
		end

	end

	function ENT:PhysicsUpdate( physobj )
		if self:IsPlayerHolding() then
			return
		end

		physobj:SetMass( 10 )
		physobj:SetBuoyancyRatio( 0.5 * self:GetPressure() )
		physobj:SetDamping( 0.25 , 1 )

	end

	function ENT:StartTouch( ent )

		if not SERVER or not IsValid( ent ) or self:IsPlayerHolding() then
			return
		end

		if ent:IsPlayer() and ent:GetMoveType() ~= MOVETYPE_WALK then
			return
		end

		local tr = self:GetTouchTrace()
		local kickmultiplier = 1.5 + 1 * self:GetPressure()
		local massmultiplier = 15
		local direction = tr.Normal

		local normal = (ent:WorldSpaceCenter() - self:GetPos() ):GetNormal() * -1
		local physobj = self:GetPhysicsObject()
		local ourvel = self:GetVelocity()
		local theirvel = ent:GetVelocity()


		if IsValid( physobj ) and ( ent:IsPlayer() or ent:IsNPC() ) then

			local aimvec = ent:EyeAngles()
			aimvec.p = 0
			aimvec = aimvec:Forward()
			aimvec.z = 0

			if aimvec:Dot( theirvel:GetNormal() ) < 0 then
				theirvel = vector_origin
				theirvel = normal * physobj:GetMass() * massmultiplier
			end
			if theirvel ~= vector_origin then
				self:EmitSound( "Rubber.BulletImpact" )
				physobj:SetVelocityInstantaneous( theirvel * kickmultiplier + Vector( 0, 0 , physobj:GetMass() * massmultiplier )  )
				self:SetLastImpact( CurTime() + 0.1 )
			else 
				self:EmitSound( "Rubber.ImpactHard" )
				physobj:SetVelocityInstantaneous( -1 * normal * ourvel:Dot( normal ) )
			end
			self:SetLastImpact( CurTime() + 0.1 ) 
		end
	end

else

	function ENT:Think()
		self:HandleSound()
	end

	function ENT:HandleSound()
		if not self.PressureLeakSound then
			self.PressureLeakSound = CreateSound( self , "PhysicsCannister.ThrusterLoop" )
		end

		if self:IsLosingPressure() and self:GetPressure() ~= 0 then
			self.PressureLeakSound:Play()
			self.PressureLeakSound:ChangeVolume( self:GetPressure() )
		else
			self.PressureLeakSound:Stop()
		end
	end

	function ENT:ImpactTrace( tr , dmgbits , customImpactName )
		if bit.bor( dmgbits , DMG_BULLET ) ~= 0 then
			util.DecalEx( self.HitMaterial, self, tr.HitPos , tr.Normal , color_white, 1 ,  1 )
		end
		return true
	end

	function ENT:Draw( flags )
		self:DrawModel()
	end

	function ENT:DrawTranslucent()
	end


end
--PATH gamemodes/darkrp/entities/entities/spawned_money/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Spawned Money"
ENT.Author = "FPtje"
ENT.Spawnable = false
ENT.IsSpawnedMoney = true

function ENT:SetupDataTables()
    self:NetworkVar("Int",0,"amount")
	self:NetworkVar("Entity", 0, "owning_ent")
end
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_pickup_exhaust/cl_init.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.

include('shared.lua')

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Initialize() self.VC_Color = Color(255,100,65,255) self.VC_Text = "Vehicle part" self.VC_PVsb = util.GetPixelVisibleHandle() end
--PATH addons/vcmod_main_autoupdate/lua/entities/vc_pickup_healthkit_25/shared.lua:
// Copyright © 2020 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - steamcommunity.com/id/freemmaann/ or email - freemmaann@gmail.com.
ENT.Base 		= "base_anim"
ENT.Type 		= "anim"
ENT.PrintName	= "Repair kit 25%"
ENT.Author		= "freemmaann"
ENT.Category	= "VCMod"

ENT.Spawnable = true
ENT.AdminSpawnable = true

--PATH addons/zeros_methlab2/lua/entities/zmlab2_dropoff/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	zmlab2.Dropoff.Initialize(self)
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Draw()
	zmlab2.Dropoff.Draw(self)
end

function ENT:OnRemove()
	zmlab2.Dropoff.OnRemove(self)
end

function ENT:Think()
	zmlab2.Dropoff.Think(self)
	self:SetNextClientThink(CurTime())
	return true
end

--PATH addons/zeros_methlab2/lua/entities/zmlab2_item_crate/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Model = "models/zerochain/props_methlab/zmlab2_crate.mdl"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Crate"
ENT.Category = "Zeros Methlab 2"
ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:SetupDataTables()
    self:NetworkVar("Int", 1, "MethType")
    self:NetworkVar("Int", 2, "MethAmount")
    self:NetworkVar("Int", 3, "MethQuality")

    if (SERVER) then
        self:SetMethType(-1)
        self:SetMethAmount(0)
        self:SetMethQuality(1)
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

--PATH addons/zeros_methlab2/lua/entities/zmlab2_item_frezzertray/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Model = "models/zerochain/props_methlab/zmlab2_frezzer_tray.mdl"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Frezzer Tray"
ENT.Category = "Zeros Methlab 2"
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:SetupDataTables()
    self:NetworkVar("Int", 1, "MethType")
    self:NetworkVar("Int", 2, "MethAmount")
    self:NetworkVar("Int", 3, "MethQuality")

    self:NetworkVar("Int", 4, "ProcessState")
    /*
        0 = Empty
        1 = Liquid
        2 = Frozen
    */

    if (SERVER) then
        self:SetMethType(1)
        self:SetMethAmount(0)
        self:SetMethQuality(1)
        self:SetProcessState(0)
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

--PATH addons/zeros_methlab2/lua/entities/zmlab2_item_meth/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Model = "models/zerochain/props_methlab/zmlab2_bag.mdl"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Meth"
ENT.Category = "Zeros Methlab 2"
ENT.RenderGroup = RENDERGROUP_BOTH


function ENT:SetupDataTables()
    self:NetworkVar("Int", 1, "MethType")
    self:NetworkVar("Int", 2, "MethAmount")
    self:NetworkVar("Int", 3, "MethQuality")

    if (SERVER) then
        self:SetMethType(2)
        self:SetMethAmount(100)
        self:SetMethQuality(100)
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

--PATH addons/zeros_weedfarm/lua/entities/zwf_autopacker/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_autopacker.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Autopacker"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_OPAQUE

--PATH addons/zeros_weedfarm/lua/entities/zwf_bong02_ent.lua:
AddCSLuaFile()
DEFINE_BASECLASS("zwf_bong_ent")
ENT.Type = "anim"
ENT.Base = "zwf_bong_ent"
ENT.Model = "models/zerochain/props_weedfarm/zwf_bong02.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Reggae Dream"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

ENT.BongID = 2

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

--PATH addons/zeros_weedfarm/lua/entities/zwf_buyer_npc/shared.lua:
ENT.Base = "base_ai"
ENT.Type = "ai"
ENT.PrintName = "Weed Buyer"
ENT.Category = "Zeros GrowOP"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.AutomaticFrameAdvance = true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "Price")
	if (SERVER) then
		self:SetPrice(1)
	end
end

--PATH addons/zeros_weedfarm/lua/entities/zwf_doobytable/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/zerochain/props_weedfarm/zwf_doobytable.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "DoobyTable"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "DoobyProgress")

    self:NetworkVar("Int", 1, "WeedID")
    self:NetworkVar("String", 1, "WeedName")
    self:NetworkVar("Float", 0, "WeedAmount")
    self:NetworkVar("Float", 1, "THC")
    self:NetworkVar("Vector", 0, "GamePos")

    if (SERVER) then
        self:SetDoobyProgress(0)
        self:SetWeedName("NIL")
        self:SetWeedID(-1)
        self:SetWeedAmount(0)
        self:SetTHC(0)
        self:SetGamePos(Vector(0,0,0))
    end
end

function ENT:OnRemoveButton(ply)
    local trace = ply:GetEyeTrace()

    local lp = self:WorldToLocal(trace.HitPos)

    if lp.x > -5 and lp.x < -2 and lp.y < 22 and lp.y > 13 and lp.z > 5 and lp.z < 6 then
        return true
    else
        return false
    end
end

function ENT:OnStartButton(ply)
    local trace = ply:GetEyeTrace()

    local lp = self:WorldToLocal(trace.HitPos)

    if lp.x > -8.5 and lp.x < -5 and lp.y < 22 and lp.y > 13 and lp.z > 5 and lp.z < 6 then
        return true
    else
        return false
    end
end

function ENT:OnPaper(ply)
    local trace = ply:GetEyeTrace()

    local lp = self:WorldToLocal(trace.HitPos)

    if lp.x > -2.2 and lp.x < 2.5 and lp.y < 2.8 and lp.y > -2.8 and lp.z > 5 and lp.z < 6 then
        return true
    else
        return false
    end
end

function ENT:OnGrinder(ply)
    local trace = ply:GetEyeTrace()

    local lp = self:WorldToLocal(trace.HitPos)

    if lp.x > -9 and lp.x < -4.9 and lp.y < -14 and lp.y > -20 and lp.z > 5 and lp.z < 6 then
        return true
    else
        return false
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

--PATH addons/zeros_weedfarm/lua/entities/zwf_palette/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/props_junk/wood_pallet001a.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Palette"
ENT.Category = "Zeros GrowOP"
ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "Money")

    self:NetworkVar("Int", 1, "WeedID01")
    self:NetworkVar("Int", 2, "WeedID02")
    self:NetworkVar("Int", 3, "WeedID03")
    self:NetworkVar("Int", 4, "WeedID04")
    self:NetworkVar("Int", 5, "WeedID05")
    self:NetworkVar("Int", 6, "WeedID06")
    self:NetworkVar("Int", 7, "WeedID07")

    if (SERVER) then
        self:SetMoney(0)
        self:SetWeedID01(0)
        self:SetWeedID02(0)
        self:SetWeedID03(0)
        self:SetWeedID04(0)
        self:SetWeedID05(0)
        self:SetWeedID06(0)
        self:SetWeedID07(0)
    end
end


function ENT:GetBlockCount()
    return self:GetWeedID01() + self:GetWeedID02() + self:GetWeedID03() + self:GetWeedID04() + self:GetWeedID05() + self:GetWeedID06() + self:GetWeedID07()
end

--PATH addons/itemstore_new/lua/itemstore/gamemodeproviders/darkrp.lua:
function PROVIDER:GetMoney( pl )
	return pl:getDarkRPVar( "money" )
end

if SERVER then
	function PROVIDER:SetMoney( pl, money )
		pl:setDarkRPVar( "money", money )
		if DarkRP.storeMoney then DarkRP.storeMoney( pl, money ) end
	end

	if itemstore.config.EnableInvholster then
		itemstore.AddCommand( "invholster", function( pl, args )
			if not pl:CanUseInventory() then return end

			local wep = pl:GetActiveWeapon()

			-- This code is not mine, I'm simply copypasting DarkRP stuff right here.
			if not IsValid(wep) or not wep:GetModel() or wep:GetModel() == "" then
				DarkRP.notify(pl, 1, 4, DarkRP.getPhrase("cannot_drop_weapon"))
				return
			end

			if itemstore.config.DisabledItems[ wep:GetClass() ] then
				DarkRP.notify(pl, 1, 4, DarkRP.getPhrase("cannot_drop_weapon"))
				return
			end

			if GAMEMODE.Config.restrictdrop then
				local found = false
				for k,v in pairs(CustomShipments) do
					if v.entity == wep:GetClass() then
						found = true
						break
					end
				end

				if not found then return end
			end

			local canDrop = hook.Call("canDropWeapon", GAMEMODE, pl, wep)
			if not canDrop then
				DarkRP.notify(pl, 1, 4, DarkRP.getPhrase("cannot_drop_weapon"))
				return
			end
			-- and back to our regularly scheduled coding

			local item = itemstore.Item( "spawned_weapon" )

			item:SetData( "Class", wep:GetClass() )
			item:SetData( "Amount", 1 )
			item:SetData( "Model", wep:GetModel() )
			item:SetData( "Clip1", wep:Clip1() )
			item:SetData( "Clip2", wep:Clip2() )

			if itemstore.config.InvholsterTakesAmmo then
				local ammotype = wep:GetPrimaryAmmoType()

				if ammotype and ammotype ~= "none" then -- to be entirely honest I'm not sure if it returns nil or "none"
					local ammo = pl:GetAmmoCount( ammotype )

					item:SetData( "Ammo", ammo )
					pl:RemoveAmmo( ammo, ammotype )
				end
			end

			pl:StripWeapon( wep:GetClass() )
			pl.Inventory:AddItem( item )
		end )
	end
end
--PATH addons/itemstore_new/lua/itemstore/items/spawned_ammo.lua:
﻿ITEM.Name = itemstore.Translate("ammo_name")
ITEM.Description = itemstore.Translate("ammo_desc")
ITEM.HighlightColor = itemstore.config.HighlightColours.Ammo
ITEM.Stackable = true
ITEM.DropStack = true
ITEM.Base = "base_darkrp"

function ITEM:GetName()
    if SERVER then
        return self:GetData("Name", self.Name)
    else
        return self:GetData("Name", language.GetPhrase(self:GetData("AmmoType") .. "_ammo"))
    end
end

function ITEM:Use(pl)
    pl:GiveAmmo(self:GetAmount(), self:GetData("AmmoType"))

    return true
end

function ITEM:CanMerge(item)
    return self.Stackable and self:GetClass() == item:GetClass() and self:GetData("AmmoType") == item:GetData("AmmoType")
end

function ITEM:SaveData(ent)
    self:SetModel(ent:GetModel())
    self:SetAmount(ent.amountGiven)
    self:SetData("AmmoType", ent.ammoType)
end

function ITEM:LoadData(ent)
    ent:SetModel(self:GetModel())
    ent.amountGiven = self:GetAmount()
    ent.ammoType = self:GetData("AmmoType")
end
--PATH addons/zeros_weedfarm/lua/itemstore/items/zwf_joint_ent.lua:
ITEM.Name = "Joint"
ITEM.Description = "A Joint"
ITEM.Model = "models/zerochain/props_weedfarm/zwf_joint.mdl"
ITEM.Base = "base_darkrp"
ITEM.Stackable = false
ITEM.DropStack = false

function ITEM:GetName()
	local name = self:GetData("WeedName") .. " " .. self:GetData("WeedAmount") .. zwf.config.UoW .. "\n[" .. zwf.config.Plants[self:GetData("WeedID")].name .. "]"

	return self:GetData("Name", name)
end

function ITEM:SaveData(ent)
	self:SetData("WeedID", ent:GetWeedID())
	self:SetData("WeedName", ent:GetWeed_Name())
	self:SetData("WeedAmount", ent:GetWeed_Amount())
	self:SetData("THC", ent:GetWeed_THC())
end

function ITEM:LoadData(ent)
	ent:SetWeedID(self:GetData("WeedID"))
	ent:SetWeed_Name(self:GetData("WeedName"))
	ent:SetWeed_Amount(self:GetData("WeedAmount"))
	ent:SetWeed_THC(self:GetData("THC"))
end

--PATH addons/itemstore_new/lua/itemstore/vgui/shop.lua:
local PANEL = {}

AccessorFunc( PANEL, "Entity", "Entity" )

function PANEL:Init()
	self:SetTitle( "Вы хотели, что-то купить?" )
	self:SetSkin( "itemstore" )

	self.Scroll = vgui.Create( "DScrollPanel", self )
	self.Scroll:Dock( FILL )
	
	self.Layout = vgui.Create( "DListLayout", self.Scroll )
	self.Layout:Dock( FILL )

	table.insert( itemstore.containers.Panels, self )
end

function PANEL:SetContainerID( id )
	self.ContainerID = id
	self:Refresh()
end

function PANEL:GetContainerID()
	return self.ContainerID
end

function PANEL:AddItem( item, slot )
	local p = self.Layout:Add( "ItemStoreShopItem" )
	
	p:SetTall( 60 )
	p:SetItem( item )
	p:SetSlotID( slot )
	p:SetEntity( self:GetEntity() )
	p:DockMargin( 0, 0, 0, 1 )
	
	return p
end

function PANEL:Refresh()
	local con = itemstore.containers.Get( self:GetContainerID() )
	if not con then return end

	self.Layout:Clear()

	for k, v in pairs( con:GetItems() ) do
 		self:AddItem( v, k )
 	end
end

vgui.Register( "ItemStoreShop", PANEL, "DFrame" )
--PATH addons/itemstore_new/lua/itemstore/vgui/trade.lua:
﻿local PANEL = {}

function PANEL:Init()
    self:SetSkin("itemstore")
    self.LeftContainer = vgui.Create("ItemStoreContainer", self)
    self.RightContainer = vgui.Create("ItemStoreContainer", self)
    self.LeftMoneyIcon = vgui.Create("DImage", self)
    self.LeftMoneyIcon:SetImage("icon16/money.png")
    self.RightMoneyIcon = vgui.Create("DImage", self)
    self.RightMoneyIcon:SetImage("icon16/money.png")
    self.LeftMoney = vgui.Create("DTextEntry", self)

    self.LeftMoney.OnLoseFocus = function(money)
        net.Start("ItemStoreTradeMoney")
        net.WriteUInt(tonumber(money:GetText()) or 0, 32)
        net.SendToServer()
    end

    self.RightMoney = vgui.Create("DLabel", self)
    self.RightMoney:SetText("0")
    self.LeftReady = vgui.Create("DCheckBoxLabel", self)
    self.LeftReady:SetText(itemstore.Translate("ready"))

    self.LeftReady.OnChange = function(ready)
        net.Start("ItemStoreReadyTrade")
        net.WriteBit(ready:GetChecked())
        net.SendToServer()
    end

    self.RightReady = vgui.Create("DLabel", self)
    self.RightReady:SetText(itemstore.Translate("not_ready"))
    self.Accept = vgui.Create("DButton", self)
    self.Accept:SetText(itemstore.Translate("accept"))
    self.Accept:SetFont("DermaLarge")
    self.Accept:SetDisabled(true)

    self.Accept.DoClick = function()
        net.Start("ItemStoreAcceptTrade")
        net.SendToServer()
        surface.PlaySound("buttons/button9.wav")
        self:Remove()
    end

    self.Chat = vgui.Create("RichText", self)

    function self.Chat:Paint()
        draw.RoundedBox(4, 0, 0, self:GetWide(), self:GetTall(), Color(230, 230, 230))
    end

    self.ChatEntry = vgui.Create("DTextEntry", self)

    function self.ChatEntry:OnEnter()
        LocalPlayer().Trade:SendMessage(self:GetText())
        self:SetText("")
        self:RequestFocus()
    end

    self.Inventory = vgui.Create("ItemStoreContainerWindow")
    self.Inventory:SetContainerID(LocalPlayer().InventoryID)
    self.Inventory:SetTitle(itemstore.Translate("inventory"))
    self.Inventory:ShowCloseButton(false)
    self.Inventory:InvalidateLayout(true)
end

function PANEL:Think()
    self.BaseClass.Think(self)
    local x, y = self:GetPos()
    self.Inventory:SetPos(x + self:GetWide() / 2 - self.Inventory:GetWide() / 2, y + self:GetTall() + 5)
end

function PANEL:ChatMessage(pl, message)
    if pl == LocalPlayer() then
        self.Chat:InsertColorChange(255, 0, 0, 255)
    else
        self.Chat:InsertColorChange(0, 0, 255, 255)
    end

    self.Chat:AppendText(pl:Name())
    self.Chat:InsertColorChange(100, 100, 100, 255)
    self.Chat:AppendText(": " .. message .. "\n")
end

function PANEL:Refresh()
    local trade = LocalPlayer().Trade

    if trade then
        local ourside = LocalPlayer() == trade.Left.Player and trade.Left or trade.Right
        local otherside = LocalPlayer() == trade.Right.Player and trade.Left or trade.Right
        self:SetTitle(itemstore.Translate("trading_with", otherside.Player:Name()))
        self.LeftContainer:SetContainerID(ourside.Container:GetID())
        self.RightContainer:SetContainerID(otherside.Container:GetID())
        self.LeftMoney:SetText(ourside.Money)
        self.RightMoney:SetText(otherside.Money)
        self.LeftReady:SetChecked(ourside.Ready)
        self.RightReady:SetText(otherside.Ready and itemstore.Translate("ready") or itemstore.Translate("not_ready"))
        self.Accept:SetDisabled(not (ourside.Ready and otherside.Ready))
    end
end

-- it's me, i'm coding hitler. this is the grave of so many brave
-- functions that went to war and died on my behalf.
function PANEL:PerformLayout()
    self.BaseClass.PerformLayout(self)
    self.LeftContainer:SetPos(5, 33)
    self.LeftContainer:SizeToContents()
    local left_w, left_h = self.LeftContainer:GetSize()
    self.RightContainer:SetPos(5 + left_w + 24, 33)
    self.RightContainer:SizeToContents()
    local right_w, right_h = self.RightContainer:GetSize()
    self.LeftMoneyIcon:SetPos(5, 33 + left_h + 5)
    self.LeftMoneyIcon:SetSize(16, 16)
    self.LeftMoney:SetPos(5 + 16 + 5, 33 + left_h + 5)
    self.LeftMoney:SetSize(left_w - 5 - 16 - 5, 16)
    self.RightMoneyIcon:SetPos(5 + right_w + 24, 33 + right_h + 5)
    self.RightMoneyIcon:SetSize(16, 16)
    self.RightMoney:SetPos(5 + left_w + 24 + 5 + 16 + 5, 33 + right_h + 5)
    self.RightMoney:SetSize(right_w - 5 - 16 - 5, 16)
    self.LeftReady:SetPos(5, 33 + left_h + 5 + 16 + 5)
    self.LeftReady:SizeToContents()
    self.RightReady:SetPos(5 + left_w + 24, 33 + right_h + 5 + 16 + 5)
    self.RightReady:SizeToContents()
    self.Accept:SetPos(5, 33 + left_h + 5 + (16 + 5) * 2)
    self.Accept:SetSize(390, 37)
    self.Chat:SetPos(400, 27)
    self.Chat:SetSize(195, 220)
    self.ChatEntry:SetPos(400, 250)
    self.ChatEntry:SetSize(195, 25)
    self:SetSize(600, 280)
end

function PANEL:OnRemove()
    net.Start("ItemStoreCloseTrade")
    net.SendToServer()
    self.Inventory:Close()
end

vgui.Register("ItemStoreTrade", PANEL, "DFrame")
--PATH addons/itemstore_new/lua/itemstore/vgui/traderequest.lua:
﻿local PANEL = {}

function PANEL:Init()
    self:SetSkin("itemstore")
    self:SetTitle(itemstore.Translate("trade_request"))
    self:ShowCloseButton(false)
    self.Label = vgui.Create("DLabel", self)
    self.Accept = vgui.Create("DButton", self)
    self.Accept:SetText(itemstore.Translate("accept"))

    function self.Accept.DoClick()
        itemstore.trading.Panel = vgui.Create("ItemStoreTrade")
        itemstore.trading.Panel:Refresh()
        itemstore.trading.Panel:Center()
        itemstore.trading.Panel:MakePopup()
        self:Remove()
    end

    self.Deny = vgui.Create("DButton", self)
    self.Deny:SetText(itemstore.Translate("deny"))

    function self.Deny.DoClick()
        net.Start("ItemStoreCloseTrade")
        net.SendToServer()
        self:Remove()
    end
end

function PANEL:Refresh()
    self.Label:SetText(itemstore.Translate("wants_to_trade", LocalPlayer().Trade.Left.Player:Name()))
end

function PANEL:PerformLayout()
    self.BaseClass.PerformLayout(self)
    self.Label:SizeToContents()
    self.Label:SetPos(self:GetWide() / 2 - self.Label:GetWide() / 2, 30)
    self.Accept:SetSize(75, 30)
    self.Accept:SetPos(self:GetWide() / 2 - self.Accept:GetWide() - 15, self:GetTall() / 2 + 10)
    self.Deny:SetSize(75, 30)
    self.Deny:SetPos(self:GetWide() / 2 + 15, self:GetTall() / 2 + 10)
end

vgui.Register("ItemStoreTradeRequest", PANEL, "DFrame")
--PATH addons/itemstore_new/lua/itemstore/cl_player.lua:
﻿local meta = FindMetaTable("Player")

function meta:MoveItem(from_con_id, from_slot, to_con_id, to_slot)
    net.Start("ItemStoreMove")
    net.WriteUInt(from_con_id, 32)
    net.WriteUInt(from_slot, 32)
    net.WriteUInt(to_con_id, 32)
    net.WriteUInt(to_slot, 32)
    net.SendToServer()
end

function meta:UseItem(con_id, slot, ...)
    net.Start("ItemStoreUse")
    net.WriteUInt(con_id, 32)
    net.WriteUInt(slot, 32)

    net.WriteTable({...})

    net.SendToServer()
end

function meta:UseItemWith(from_con_id, from_slot, to_con_id, to_slot)
    net.Start("ItemStoreUseWith")
    net.WriteUInt(from_con_id, 32)
    net.WriteUInt(from_slot, 32)
    net.WriteUInt(to_con_id, 32)
    net.WriteUInt(to_slot, 32)
    net.SendToServer()
end

function meta:DropItem(con_id, slot)
    net.Start("ItemStoreDrop")
    net.WriteUInt(con_id, 32)
    net.WriteUInt(slot, 32)
    net.SendToServer()
end

function meta:DestroyItem(con_id, slot)
    net.Start("ItemStoreDestroy")
    net.WriteUInt(con_id, 32)
    net.WriteUInt(slot, 32)
    net.SendToServer()
end

function meta:MergeItem(from_con_id, from_slot, to_con_id, to_slot)
    net.Start("ItemStoreMerge")
    net.WriteUInt(from_con_id, 32)
    net.WriteUInt(from_slot, 32)
    net.WriteUInt(to_con_id, 32)
    net.WriteUInt(to_slot, 32)
    net.SendToServer()
end

function meta:SplitItem(con_id, slot, amount)
    net.Start("ItemStoreSplit")
    net.WriteUInt(con_id, 32)
    net.WriteUInt(slot, 32)
    net.WriteUInt(amount, 16)
    net.SendToServer()
end

hook.Add("InitPostEntity", "ItemStoreRequestInventory", function()
    net.Start("ItemStoreSyncInventory")
    net.SendToServer()
end)

net.Receive("ItemStoreSyncInventory", function()
    LocalPlayer().InventoryID = net.ReadUInt(32)
    itemstore.CreateContextInventory()
end)

net.Receive("ItemStoreOpen", function()
    local id = net.ReadUInt(32)
    local name = net.ReadString()
    local hideinv = net.ReadBit() == 1
    local con = itemstore.containers.Get(id)
    if not con then return end
    local panel = vgui.Create("ItemStoreContainerWindow")
    panel:SetContainerID(id)
    panel:SetTitle(name)
    panel:Center()
    panel:MakePopup()

    if not hideinv then
        local inv = vgui.Create("ItemStoreContainerWindow")
        inv:SetContainerID(LocalPlayer().InventoryID)
        inv:SetTitle(itemstore.Translate("inventory"))
        inv:ShowCloseButton(false)
        inv:MakePopup()
        inv:InvalidateLayout(true)
        local think = inv.Think

        function inv:Think()
            think(self)
            local x, y = panel:GetPos()
            inv:SetPos(panel:GetPos() + (panel:GetWide() / 2 - inv:GetWide() / 2), y + panel:GetTall() + 10)
        end

        function panel:OnClose()
            inv:Close()
        end
    end
end)
--PATH addons/deceive/lua/deceive/sh_config.lua:

deceive.Config = {}

deceive.Config.NoDisguiseAsJobs = {
	"NONRP",
	"Мэр",
	"Собака",
	"Администрация",
}

deceive.Config.NoDisguiseIntoJobs = {
	"NONRP",
	"Мэр",
	"Собака",
	"Администрация",
}

deceive.Config.AllowedUserGroups = {
}

deceive.Config.DonatorOnlyMessage = "У вас слишком слабая привилегия для использования маскировки!"

deceive.Config.UndisguiseCommand = "undisguise"

deceive.Config.UseCooldown = 5

deceive.Config.DrawerMaxUses = 10

deceive.Config.DrawerHealth = 100

deceive.Config.FakeJob = true

deceive.Config.FakeName = false

deceive.Config.FakeModel = true

deceive.Config.FakeModelColor = true

deceive.Config.NoDefaultShipments = false

deceive.Config.RemoveOnAttack = true
--PATH addons/deceive/lua/deceive/cl_disguise.lua:

net.Receive("deceive.disguise", function()
	local plyUID = net.ReadUInt(32)
	local targetUID = net.ReadUInt(32)
	local ply = Player(plyUID)
	local target = Player(targetUID)

	if not IsValid(target) or not target:IsPlayer() then
		ply.Disguised = nil
	else
		ply.Disguised = target
	end
end)

--PATH addons/admin_warns/lua/fam/admin_modes/ulx.lua:
function FlameAdminManagement.BanPlayer(sid, time, reason)
	customreason = customreason or "Warn Received!"

	ulx.banid( nil, sid, time, reason )
end

function FlameAdminManagement.KickPlayer(sid, reason)
	customreason = customreason or "Warn Received!"

	local ply = player.GetBySteamID64(sid)
	if IsValid(ply) then
		ply:Kick(reason)
	end
end

function FlameAdminManagement.Demote(sid)
	sid = util.SteamIDFrom64(sid)
	RunConsoleCommand("ulx", "removeuserid", sid)
end

hook.Add('CAMI.PlayerUsergroupChanged', 'FAM.RankUpdate', function(ply, old, new, adminmod)
	if not ply or not IsValid(ply) then return end

	FlameAdminManagement.RankChange(ply:SteamID64(), new)
end)

hook.Add('CAMI.SteamIDUsergroupChanged', 'FAM.RankUpdate', function(anything, old, new, adminmod)
	local sid64
	if anything:match("^7656119%d+$") then
		sid64 = anything
	elseif anything:upper():match("^STEAM_%d:%d:%d+$") then
		sid64 = util.SteamIDTo64(anything)
	else
		return
	end

	FlameAdminManagement.RankChange(sid64, new)
end)
--PATH addons/zeros_methlab2/lua/zmlab2_languages/sh_language_tr.lua:
zmlab2 = zmlab2 or {}
zmlab2.language = zmlab2.language or {}

if (zmlab2.config.SelectedLanguage == "tr") then
    zmlab2.language["YouDontOwnThis"] = "Buna sahip değilsin!"
    zmlab2.language["Minutes"] = "Dakika"
    zmlab2.language["Seconds"] = "Saniye"
    zmlab2.language["CratePickupFail"] = "Kutu boş!"
    zmlab2.language["CratePickupSuccess"] = "$MethAmount $MethName toplandı, Kalite: $MethQuality%"
    zmlab2.language["Interaction_Fail_Job"] = "Bununla etkileşime girmek için doğru meslekte değilsin!"
    zmlab2.language["Interaction_Fail_Dropoff"] = "Bu dağıtım noktası size ayarlanmamış!"
    zmlab2.language["Dropoff_assinged"] = "Dağıtım noktası ayarlandı!"
    zmlab2.language["Dropoff_cooldown"] = "Dağıtım noktası bekleme süresi!"
    zmlab2.language["Equipment"] = "Ekipman"
    zmlab2.language["Equipment_Build"] = "İnşa Et"
    zmlab2.language["Equipment_Move"] = "Hareket Ettir"
    zmlab2.language["Equipment_Repair"] = "Tamir Et"
    zmlab2.language["Equipment_Remove"] = "Kaldır"
    zmlab2.language["NotEnoughMoney"] = "Yeterli paraya sahip değilsin!"
    zmlab2.language["ExtinguisherFail"] = "Obje yanmıyor!"
    zmlab2.language["Start"] = "Başlat"
    zmlab2.language["Drop"] = "Bırak"
    zmlab2.language["Move Liquid"] = "Sıvıyı Hareket Ettir"
    zmlab2.language["Frezzer_NeedTray"] = "Sıvı meth içeren bir tepsi bulunamadı!"
    zmlab2.language["ERROR"] = "HATA"
    zmlab2.language["SPACE"] = "BOŞLUK tuşuna tıklayın"
    zmlab2.language["NPC_InteractionFail01"] = "Senin gibi garibanlarla konuşmuyorum! [Geçersiz Meslek]"
    zmlab2.language["NPC_InteractionFail02"] = "Üstünde hiç meth yok!"
    zmlab2.language["NPC_InteractionFail03"] = "Sana verebileceğim dağıtım noktası bulunmamakta, sonra tekrar gel."
    zmlab2.language["PoliceWanted"] = "Meth Satıldı!"
    zmlab2.language["MissingCrate"] = "Eksik Kutu"
    zmlab2.language["Storage"] = "DEPO"
    zmlab2.language["ItemLimit"] = "$ItemName için varlık limitine ulaştın!"
    zmlab2.language["TentFoldInfo01"] = "Çadırı kaldırmak istediğine emin misin?"
    zmlab2.language["TentFoldInfo02"] = "İçeride bulunan tüm ekipmanlar da kaldırılacak!"
    zmlab2.language["TentFoldAction"] = "KATLA"
    zmlab2.language["TentType_None"] = "HİÇ"
    zmlab2.language["TentAction_Build"] = "INŞA ET"
    zmlab2.language["TentBuild_Info"] = "Lütfen bölgeyi temizleyin!"
    zmlab2.language["TentBuild_Abort"] = "Yolda birşey vardı!"
    zmlab2.language["Enabled"] = "Aktif"
    zmlab2.language["Disabled"] = "Deaktif"
    zmlab2.language["MethTypeRestricted"] = "Bu meth türünü üretemezsin!"
    zmlab2.language["SelectMethType"] = "Meth Türünü Seçiniz"
    zmlab2.language["SelectTentType"] = "Çadır Türünü Seçiniz"
    zmlab2.language["LightColor"] = "Işık Rengini Seçiniz"
    zmlab2.language["Cancel"] = "İptal"
    zmlab2.language["Deconstruct"] = "Yık"
    zmlab2.language["Construct"] = "İnşa Et"
    zmlab2.language["Choosepostion"] = "Yeni Pozisyon Seçin"
    zmlab2.language["ChooseMachine"] = "Makine Seçin"
    zmlab2.language["Extinguish"] = "Söndür"
    zmlab2.language["PumpTo"] = "Şuna pompala"
    zmlab2.language["ConstructionCompleted"] = "İnşaat tamamlandı!"
    zmlab2.language["Duration"] = "Süre"
    zmlab2.language["Amount"] = "Miktar"
    zmlab2.language["Difficulty"] = "Zorluk"
    zmlab2.language["Money"] = "Para"
    zmlab2.language["Difficulty_Easy"] = "Kolay"
    zmlab2.language["Difficulty_Medium"] = "Orta"
    zmlab2.language["Difficulty_Hard"] = "Zor"
    zmlab2.language["Difficulty_Expert"] = "Uzman"
    zmlab2.language["Connected"] = "Bağlandı!"
    zmlab2.language["Missed"] = "Iskalandı!"

    // Tent Config
    // Note: "Vamonos Pest" and "Crystale Castle" are the names of those tents so you dont need to translate them if you dont want
    zmlab2.language["tent01_title"] = "Vamonos Pest Çadırı - Küçük"
    zmlab2.language["tent01_desc"] = "6 makine sığabilen küçük bir çadır."
    zmlab2.language["tent02_title"] = "Vamonos Pest Çadırı - Orta"
    zmlab2.language["tent02_desc"] = "9 makine sığabilen orta boy bir çadır."
    zmlab2.language["tent03_title"] = "Vamonos Pest Çadırı - Büyük"
    zmlab2.language["tent03_desc"] = "16 makine sığabilen büyük boy bir çadır."
    zmlab2.language["tent04_title"] = "Crystale Castle"
    zmlab2.language["tent04_desc"] = "24 makine sığdırabileceğin çalıntı bir sirk çadırı."

    // Equipment Config
    zmlab2.language["ventilation_title"] = "Havalandırma"
    zmlab2.language["ventilation_desc"] = "Çevrenin kirlenmesini engeller."
    zmlab2.language["storage_title"] = "Depo"
    zmlab2.language["storage_desc"] = "Kimyasal ve ekipmanları sağlar."
    zmlab2.language["furnace_title"] = "Toryum fırını"
    zmlab2.language["furnace_desc"] = "Asiti ısıtmayı sağlar."
    zmlab2.language["mixer_title"] = "Karıştırıcı"
    zmlab2.language["mixer_desc"] = "Bileşenleri karıştırmayı sağlar."
    zmlab2.language["filter_title"] = "Filtre"
    zmlab2.language["filter_desc"] = "Çıkan karışımı filtrelemeyi sağlar ve ürünün kalitesini arttırır."
    zmlab2.language["filler_title"] = "Doldurucu"
    zmlab2.language["filler_desc"] = "Dondurucu tepsilerini doldurmayı sağlar."
    zmlab2.language["frezzer_title"] = "Dondurucu"
    zmlab2.language["frezzer_desc"] = "Çıkan metanfetamini son reaksiyonunu yaşatır ve hazır hale getirir."
    zmlab2.language["packingtable_title"] = "Paketleme Masası"
    zmlab2.language["packingtable_desc"] = "Meth hazırlamayı hızlandırır. 12 tepsi sığdırabilirsin. Otomatik buz kırıcı ile güçlendirebilirsin."

    // Storage Config
    zmlab2.language["acid_title"] = "Hidroflorik Asit"
    zmlab2.language["acid_desc"] = "Reaksiyonun kaliteseini arttırabileceğin bir asit."
    zmlab2.language["methylamine_title"] = "Metilamin"
    zmlab2.language["methylamine_desc"] = "Metilamin (CH3NH2) metanfetaminin ana maddelerinden biri olan organik bir bileşendir."
    zmlab2.language["aluminum_title"] = "Aliminyum"
    zmlab2.language["aluminum_desc"] = "Aliminyum amalgam, bileşikleri azaltmak için kullanılan kimyasal reaktiftir."
    zmlab2.language["lox_title"] = "Sıvı Oksijen"
    zmlab2.language["lox_desc"] = "Sıvı oksijen metanfetaminin son adımını yani dondurmayı sağlamak için kullanılan bir bileşendir."
    zmlab2.language["crate_title"] = "Taşıma Kutusu"
    zmlab2.language["crate_desc"] = "Yüklü miktarda meth taşımak için kullanılır."
    zmlab2.language["palette_title"] = "Palet"
    zmlab2.language["palette_desc"] = "Yüklü miktarda meth taşımak için kullanılır."
    zmlab2.language["crusher_title"] = "Buz Kırıcı"
    zmlab2.language["crusher_desc"] = "Masaya gelen methi otomatik olarak kırıp paketlemeye yarar."

    // Meth Config
    // Note: Hard to say what about the meth should be translated and what not. Decide for yourself whats important here.
    zmlab2.language["meth_title"] = "Meth"
    zmlab2.language["meth_desc"] = "Sokak torbacılarının sattığı düz meth."
    zmlab2.language["bluemeth_title"] = "Kristal Mavisi"
    zmlab2.language["bluemeth_desc"] = "Heisenberg'in orijinal formülü."
    zmlab2.language["kalaxi_title"] = "Kalaksian Kristali"
    zmlab2.language["kalaxi_desc"] = "Kristaller sana aynı zevki verdiğinden dolayı Kalaksian Kristali diğer uyuşturuculara çok benzer."
    zmlab2.language["glitter_title"] = "Simli Cin"
    zmlab2.language["glitter_desc"] = "Simli Cin Night Street sokaklarında bolca bulunan saykodelik bir haptır. Gerçekten sağlam bir haptır, Night Street sivilleri bile buna dayanamıyor."
    zmlab2.language["kronole_title"] = "Kronol"
    zmlab2.language["kronole_desc"] = "Kronol Kar Küreyici içerisinde satılan bir uyuşturucu çeşididir. Kronol, vücudundaki acı reseptörlerini bile engelleyebilir, sadece acıyı da değil tüm hislerinizi engelleyebilir."
    zmlab2.language["melange_title"] = "Melanj"
    zmlab2.language["melange_desc"] = "Melanj (Baharat) ömrünüzü uzatabilen bir uyuşturucudur, size yüksek farkındalık ve yüksek enerji bahşedebilir hatta bazı insanların geleceği görmesini bile sağlayabilir."
    zmlab2.language["mdma_title"] = "Ekstazi"
    zmlab2.language["mdma_desc"] = "Ekstazi 1912 yılında Merck tarafından üretildi. Psikoterapileri geliştirmek için 1970 yıllarında kullanıldı ve 1980 yıllarında popüler bir sokak uyuşturucusu oldu."

    // Update 1.0.5
    zmlab2.language["tent05_title"] = "Round Tent"
    zmlab2.language["tent05_desc"] = "This round tent provides room for 8 machines."
end

--PATH addons/zeros_methlab2/lua/zmlab2/util/sh_hooks.lua:
zmlab2 = zmlab2 or {}
zmlab2.Hook = zmlab2.Hook or {}

////////////////////////////////////////////
///////////////// Hooks ////////////////////
////////////////////////////////////////////
zmlab2.Hook.List = zmlab2.Hook.List or {}

function zmlab2.Hook.PrintAll()
	PrintTable(zmlab2.Hook.List)
end

function zmlab2.Hook.GetUniqueIdentifier(eventName, identifier)
	local _identifier = "a.zmlab2." .. eventName .. "." .. identifier
	if SERVER then
		_identifier = _identifier .. ".sv"
	else
		_identifier = _identifier .. ".cl"
	end
	return _identifier
end

function zmlab2.Hook.Exist(eventName, identifier)
	local reg_hooks = hook.GetTable()
	local _identifier = zmlab2.Hook.GetUniqueIdentifier(eventName, identifier)
	local exists = false
	if reg_hooks[eventName] and reg_hooks[eventName][_identifier] then
		exists = true
	end
	//print(eventName.." "..identifier.. "Exists: "..tostring(exists))
	return exists
end

function zmlab2.Hook.Add(eventName, identifier, func)
	//if zmlab2.Hook.Exist(eventName, identifier) then return end
	// Lets make sure we remove the hook if its allready exist
	zmlab2.Hook.Remove(eventName, identifier)
	//print("Hook.Add: [" .. eventName .. "] (" .. identifier .. ")")
	local _identifier = zmlab2.Hook.GetUniqueIdentifier(eventName, identifier)


	if zmlab2.util.FunctionValidater(func) then

		hook.Add(eventName, _identifier, func)

		if zmlab2.Hook.List[eventName] == nil then
			zmlab2.Hook.List[eventName] = {}
		end

		table.insert(zmlab2.Hook.List[eventName], identifier)
	end
end

function zmlab2.Hook.Remove(eventName, identifier)
	//print("Hook.Remove: [" .. eventName .. "] (" .. identifier .. ")")
	local _identifier = zmlab2.Hook.GetUniqueIdentifier(eventName, identifier)

	hook.Remove(eventName, _identifier)

	if zmlab2.Hook.List[eventName] then
		table.RemoveByValue(zmlab2.Hook.List[eventName], identifier)
	end
end
////////////////////////////////////////////
////////////////////////////////////////////

--PATH addons/zeros_methlab2/lua/zmlab2/minigame/cl_minigame.lua:
if not CLIENT then return end
zmlab2 = zmlab2 or {}
zmlab2.MiniGame = zmlab2.MiniGame or {}

///////////////////////////////////////////
///////////////////////////////////////////
local MiniGameVGUI = {}

local function OpenInterface()

    if IsValid(zmlab2_MiniGame_main_panel) then
        zmlab2_MiniGame_main_panel:Remove()
    end

    zmlab2_MiniGame_main_panel = vgui.Create("zmlab2_vgui_MiniGame")
end

net.Receive("zmlab2_MiniGame", function(len)
    zmlab2.Debug_Net("zmlab2_MiniGame",len)

    LocalPlayer().zmlab2_MiniGame_Ent = net.ReadEntity()
    LocalPlayer().zmlab2_MiniGame_Time = net.ReadUInt(16)

    // Open Main interface
    OpenInterface()
end)

function MiniGameVGUI:Init()
    self:SetSize(600 * zmlab2.wM, 200 * zmlab2.hM)
    self:Center()
    self:SetPos((ScrW() / 2) - 300 * zmlab2.wM,(ScrH() / 2) + 150 * zmlab2.wM)
    self:MakePopup()
    self:ShowCloseButton(false)
    self:SetTitle("")
    self:SetDraggable(true)
    self:SetSizable(false)

    self:DockMargin(0, 0, 0, 0)
    self:DockPadding( 10 * zmlab2.wM,10 * zmlab2.wM,10 * zmlab2.wM,10 * zmlab2.wM)

    self.PlayMusic = true

    local difficulty = 1
    if LocalPlayer().zmlab2_MiniGame_Ent.GetMethType then
        local dat = zmlab2.config.MethTypes[LocalPlayer().zmlab2_MiniGame_Ent:GetMethType()]
        difficulty = dat.difficulty
    end


    // At which part of the bar is the safe area
    local safe_pos = (1 / 10) * LocalPlayer().zmlab2_MiniGame_Time

    // The size of the safe area
    local safe_size = 1 - ((1 / 10) * difficulty)

    // The time in seconds
    local game_time = 1.5


    local safe_start = game_time * safe_pos
    local safe_mul = 0.05 + (0.1 * safe_size)
    local safe_end = safe_start + (game_time * safe_mul)

    local MainContainer = vgui.Create("DPanel", self)
    MainContainer:Dock(FILL)
    MainContainer:DockMargin(5,50,5,5)
    MainContainer.Paint = function(s, w, h)

        // The Size of the whole bar
        local max_length = w-10

        // The Size of the safe area, its 10% of the whole bar
        local safe_length = max_length * safe_mul

        local diff = CurTime() - MainContainer.CreationTime
        local pointer_pos = (max_length / game_time) * diff
        pointer_pos = math.Clamp(pointer_pos, 0, max_length)

        local CanWin = false
        if diff >= safe_start and diff < safe_end then
            CanWin = true
        end

        draw.RoundedBox(0, 0, 0, w, h, zmlab2.colors["black02"])

        draw.RoundedBox(0, 5, 5, w-10, h-10, zmlab2.colors["red02"])

        draw.RoundedBox(0, (max_length / game_time) * safe_start, 5 , safe_length, h - 10, zmlab2.colors["green03"])

        if CanWin then draw.RoundedBox(0, (max_length / game_time) * safe_start, 5, safe_length, h - 10, zmlab2.colors["white02"]) end

        draw.RoundedBox(0, 3 + pointer_pos, 5,6, h - 10, zmlab2.colors["black01"])

        //zmlab2.util.DrawOutlinedBox(0 * zmlab2.wM, 0 * zmlab2.hM, w, h, 6, color_white)

        surface.SetDrawColor(color_white)
        surface.SetMaterial(zmlab2.materials["errorgame_overlay"])
        surface.DrawTexturedRect(0 * zmlab2.wM, 0 * zmlab2.hM, w,h)
    end
    MainContainer.CreationTime = CurTime()
    MainContainer.DidAction = false
    MainContainer.Think = function(s)

        if MainContainer.DidAction == false then

            // Safe area is 10%
            local f_WinArea = game_time * safe_mul

            local f_WinTime = game_time * safe_pos

            local f_CurTime = CurTime() - MainContainer.CreationTime

            // Did we win?
            local result = false
            if f_CurTime >= f_WinTime and f_CurTime < (f_WinTime + f_WinArea) then
                result = true
            end

            if input.IsKeyDown(KEY_SPACE) == true or f_CurTime > game_time then

                MainContainer.DidAction = true

                net.Start("zmlab2_MiniGame")
                net.WriteEntity(LocalPlayer().zmlab2_MiniGame_Ent)
                net.WriteBool(result)
                net.SendToServer()

                self:Close()
            end
        end

        if self.PlayMusic == true then
            if self.Sound == nil then
                self.Sound = CreateSound(LocalPlayer().zmlab2_MiniGame_Ent, "zmlab2_errorgame_loop")
            else
                if self.Sound:IsPlaying() == false then
                    self.Sound:Play()
                    self.Sound:ChangeVolume(1, 1)
                end
            end
        end
    end
end

function MiniGameVGUI:Paint(w, h)
    surface.SetDrawColor(zmlab2.colors["blue02"])
    surface.SetMaterial(zmlab2.materials["item_bg"])
    surface.DrawTexturedRect(0 * zmlab2.wM, 0 * zmlab2.hM, w,h)

    draw.SimpleText(zmlab2.language["SPACE"], zmlab2.GetFont("zmlab2_vgui_font01"), w / 2 , 35, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    zmlab2.util.DrawOutlinedBox(0 * zmlab2.wM, 0 * zmlab2.hM, w, h, 2, color_white)
end

// Close the editor
function MiniGameVGUI:Close()

    self.PlayMusic = false
    if self.Sound and self.Sound:IsPlaying() == true then
        self.Sound:Stop()
    end
    LocalPlayer().zmlab2_MiniGame_Ent = nil

    if IsValid(zmlab2_MiniGame_main_panel) then
        zmlab2_MiniGame_main_panel:Remove()
    end
end

vgui.Register("zmlab2_vgui_MiniGame", MiniGameVGUI, "DFrame")

--PATH addons/zeros_methlab2/lua/zmlab2/pumpsystem/cl_pumpsystem.lua:
if SERVER then return end
zmlab2 = zmlab2 or {}
zmlab2.PumpSystem = zmlab2.PumpSystem or {}

net.Receive("zmlab2_PumpSystem_EnablePointer", function(len, ply)
    zmlab2.Debug_Net("zmlab2_PumpSystem_EnablePointer", len)
    local Machine = net.ReadEntity()
    if not IsValid(Machine) then return end

    zmlab2.PointerSystem.Start(Machine,function()

        // OnInit
        zmlab2.PointerSystem.Data.MainColor = zmlab2.colors["blue01"]

        zmlab2.PointerSystem.Data.ActionName = zmlab2.language["PumpTo"]

    end,function()

        // OnLeftClick

        if not IsValid(zmlab2.PointerSystem.Data.Target) then return end

        net.Start("zmlab2_PumpSystem_Start")
        net.WriteEntity(zmlab2.PointerSystem.Data.From)
        net.WriteEntity(zmlab2.PointerSystem.Data.Target)
        net.SendToServer()

        zmlab2.PointerSystem.Stop()
    end,function()

        // MainLogic

        // Catch the Target
        if IsValid(zmlab2.PointerSystem.Data.HitEntity) and zmlab2.PumpSystem.AllowConnection(zmlab2.PointerSystem.Data.From,zmlab2.PointerSystem.Data.HitEntity) then
            zmlab2.PointerSystem.Data.Target = zmlab2.PointerSystem.Data.HitEntity
        else
            zmlab2.PointerSystem.Data.Target = nil
        end

        // Update PreviewModel
        if IsValid(zmlab2.PointerSystem.Data.PreviewModel) then
            if IsValid(zmlab2.PointerSystem.Data.Target) then
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

zmlab2.PumpSystem.Hoses = zmlab2.PumpSystem.Hoses or {}

// Creates a new entry for a hose
net.Receive("zmlab2_PumpSystem_AddHose", function(len, ply)
    zmlab2.Debug_Net("zmlab2_PumpSystem_AddHose", len)
    local Machine_From = net.ReadEntity()
    local Machine_To = net.ReadEntity()
    if not IsValid(Machine_From) then return end
    if not IsValid(Machine_To) then return end
    zmlab2.PumpSystem.AddHose(Machine_From,Machine_To)
end)
function zmlab2.PumpSystem.AddHose(Machine_From,Machine_To)

    if Machine_From.GetHose_Out == nil then return end
    if Machine_To.GetHose_In == nil then return end

    local pos_start,dir_start = Machine_From:GetHose_Out()
    local pos_end,dir_end = Machine_To:GetHose_In()
    local time = zmlab2.PumpSystem.GetTime(Machine_From:GetPos(),Machine_To:GetPos())

    zmlab2.Debug("zmlab2.PumpSystem.AddHose[" .. tostring(Machine_From) .. "][" .. tostring(Machine_To) .. "][" .. time .. "]")

    //debugoverlay.Sphere(pos_start,2,3,Color( 255, 255, 255 ),true)
    //debugoverlay.Sphere(pos_end,2,3,Color( 255, 255, 255 ),true)

    table.insert(zmlab2.PumpSystem.Hoses,{
        time = CurTime() + time,
        pos_start = pos_start,
        pos_end = pos_end,
        dir_start = dir_start,
        dir_end = dir_end,
    })

    zmlab2.Hook.Remove("Think", "PumpSystem_Render")
    zmlab2.Hook.Add("Think", "PumpSystem_Render", function() zmlab2.PumpSystem.RenderHose() end)
end

local hose_gravity = Vector(0, 0, -3)
local hose_damping = 0.5
local hose_Length = 14
function zmlab2.PumpSystem.RenderHose()
    // If we dont have any hoses to calc anymore then lets remove the hook
    if table.Count(zmlab2.PumpSystem.Hoses) <= 0 then
        zmlab2.Hook.Remove("Think", "PumpSystem_Render")
        return
    end

    for k,v in pairs(zmlab2.PumpSystem.Hoses) do
        if v == nil then
            zmlab2.PumpSystem.Hoses[k] = nil
            continue
        end

        if CurTime() > v.time then
            zmlab2.Debug("zmlab2.PumpSystem.Hose Removed!")

            zmlab2.PumpSystem.Hoses[k] = nil

            if v.pipe then

                // Remove BuildBonePositions callback if existed
                if v.CallBackID then v.pipe:RemoveCallback( "BuildBonePositions", v.CallBackID ) end

                zmlab2.ClientModel.Remove(v.pipe)
                v.pipe = nil
            end

            continue
        end

        if zmlab2.util.InDistance(LocalPlayer():GetPos(), v.pos_start, 500) == false then
            if v.pipe then

                // Remove BuildBonePositions callback if existed
                if v.CallBackID then v.pipe:RemoveCallback( "BuildBonePositions", v.CallBackID ) end

                zmlab2.ClientModel.Remove(v.pipe)
                v.pipe = nil
            end
            continue
        end

        if v.pipe == nil then

            // Create the client model pipe
            v.pipe = zmlab2.ClientModel.Add("models/zerochain/props_methlab/zmlab2_pipe.mdl", RENDERGROUP_OPAQUE)

            // Hose skin
            v.pipe:SetSkin(1)

            // Remove BuildBonePositions callback if existed
            if v.CallBackID then v.pipe:RemoveCallback( "BuildBonePositions", v.CallBackID ) end

            // Add callback to adjust bones
            local CallBackID = v.pipe:AddCallback( "BuildBonePositions", function( pipe, numbones )
                for i = 0, numbones - 1 do
                    local mat = pipe:GetBoneMatrix( i )
                    if not mat then continue end

                    if v.LineAngles and v.LineAngles[i + 1] and v.LinePoints and v.LinePoints[i + 1] then
                        mat:SetAngles(v.LineAngles[i + 1])
                        mat:SetTranslation(v.LinePoints[i + 1].position)
                        mat:SetScale(Vector(0.3,0.3,0.3))

                        pipe:SetBoneMatrix( i, mat )
                        //debugoverlay.Sphere(mat:GetTranslation(),5,0.1,Color( 255, 255, 255 ),true)
                    end

                    debugoverlay.Text( mat:GetTranslation(), pipe:GetBoneName(i), 0.1, false )
                end
            end )

            v.CallBackID = CallBackID

            zmlab2.Debug("zmlab2.PumpSystem.Hose Created!")
        else

            // Create rope points
            if v.LinePoints == nil then
                v.LinePoints = zmlab2.Rope.Setup(hose_Length, v.pos_start,v.pos_end)
            end

            // Updates the Rope points to move physicly
            if v.LinePoints and table.Count(v.LinePoints) > 0 then

                zmlab2.Rope.Update(v.LinePoints, v.pos_start, v.pos_end, hose_Length, hose_gravity, hose_damping)

                v.LinePoints[1].position = v.pos_start
                v.LinePoints[2].position = v.pos_start + v.dir_start:Up() * 1

                v.LinePoints[hose_Length - 1].position = v.pos_end - v.dir_end:Up() * 5
                v.LinePoints[hose_Length].position = v.pos_end
            end

            // Generates the Angles for the Pipe Bones
            for point = 0, hose_Length do

                if v.LineAngles == nil then
                    v.LineAngles = {}
                end

                if v.LinePoints[point] then
                    local pos = v.LinePoints[point].position
                    local ang = (v.pos_start - v.pos_end):Angle()

                    debugoverlay.Sphere(pos,1,0.1,Color( 0, 255, 0 ),true)

                    if v.LinePoints[point - 1] then
                        ang = (pos - v.LinePoints[point-1].position):Angle()
                        ang:RotateAroundAxis(ang:Right(),-90)
                        debugoverlay.Line(v.LinePoints[point-1].position,pos,0.1,HSVToColor( (360 / hose_Length) * point, 1,1 ),true)
                    end

                    v.LineAngles[point] = ang
                end
            end

            // Fixes the pipe rotation for the last 2 bones
            v.LineAngles[hose_Length - 1] = v.dir_end
            v.LineAngles[hose_Length] = v.dir_end

            v.pipe:SetPos(LocalPlayer():EyePos())
        end
    end
end

--PATH addons/zeros_weedfarm/lua/zwf_config_shop.lua:
zwf = zwf or {}
zwf.f = zwf.f or {}
zwf.config = zwf.config or {}

zwf.config.Shop = {
    [1] = {
        title = zwf.language.Shop["category_Equipment"],
        items = {
            [1] = {
                // Name of the item
                name = zwf.language.Shop["item_generator_title"],

                 // Description
                desc = zwf.language.Shop["item_generator_desc"],

                // Price
                price = 2500,

                // Class of the Entity
                class = "zwf_generator",

                // Display Model
                model = "models/zerochain/props_weedfarm/zwf_generator.mdl",

                // The Ranks that are allowed to buy this item. Leave empty to disable
                ranks = {},

                // The player can only buy this amount at once
                max = 1,
            },
            [2] = {
                name = zwf.language.Shop["item_fuel_title"],
                desc = zwf.language.Shop["item_fuel_desc"],
                price = 500,
                class = "zwf_fuel",
                model = "models/zerochain/props_weedfarm/zwf_fuel.mdl",
                ranks = {},
                max = 3,
            },
            [3] = {
                lampid = 1,
                desc = zwf.language.Shop["item_lamp01_desc"],
                price = 1500,
                class = "zwf_lamp",
                model = "models/zerochain/props_weedfarm/zwf_lamp01.mdl",
                ranks = {},
                max = 5,
            },
            [4] = {
                lampid = 2,
                desc = zwf.language.Shop["item_lamp02_desc"],
                price = 3000,
                class = "zwf_lamp",
                model = "models/zerochain/props_weedfarm/zwf_lamp02.mdl",
                ranks = {
						['vip']             = true,
						['NS-moder'] 		= true,
						['downer']          = true,
						['NS-admin'] 	    = true,
						['NS-helper'] 	    = true,
						['sponsor'] 		= true,
						['padmin'] 		    = true,
						['moder'] 		    = true,
						['overwatch'] 		= true,
						['manager'] 		= true,
						['dsuperadmin'] 	= true,
						['superadmin'] 		= true,
						['NS-trainee'] 		= true,
						['NS-mlmoder'] 		= true,
						['NS-mladmin'] 		= true,
						['NS-assistant'] 	= true,
						['uprav'] 		    = true,
						['NS-zammanager'] 	= true,
						['superadmin'] 	= true,
                },
                max = 5,
            },
            [5] = {
                name = zwf.language.Shop["item_ventilator_title"],
                desc = zwf.language.Shop["item_ventilator_desc"],
                price = 1500,
                class = "zwf_ventilator",
                model = "models/zerochain/props_weedfarm/zwf_ventilator01.mdl",
                ranks = {},
                max = 5,
            },
            [6] = {
                name = zwf.language.Shop["item_outlet_title"],
                desc = zwf.language.Shop["item_outlet_desc"],
                price = 300,
                class = "zwf_outlet",
                model = "models/zerochain/props_weedfarm/zwf_outlets.mdl",
                ranks = {},
                max = 2,
            },
            [7] = {
                name = zwf.language.Shop["item_flowerpot01_title"],
                desc = zwf.language.Shop["item_flowerpot01_desc"],
                price = 200,
                class = "zwf_pot",
                model = "models/zerochain/props_weedfarm/zwf_pot01.mdl",
                ranks = {},
                max = 6,
            },
            [8] = {
                name = zwf.language.Shop["item_flowerpot02_title"],
                desc = zwf.language.Shop["item_flowerpot02_desc"],
                price = 400,
                class = "zwf_pot_hydro",
                model = "models/zerochain/props_weedfarm/zwf_pot02.mdl",
                ranks = {
						['vip']             = true,
						['NS-moder'] 		= true,
						['downer']          = true,
						['NS-admin'] 	    = true,
						['NS-helper'] 	    = true,
						['sponsor'] 		= true,
						['padmin'] 		    = true,
						['moder'] 		    = true,
						['overwatch'] 		= true,
						['manager'] 		= true,
						['dsuperadmin'] 	= true,
						['superadmin'] 		= true,
						['NS-trainee'] 		= true,
						['NS-mlmoder'] 		= true,
						['NS-mladmin'] 		= true,
						['NS-assistant'] 	= true,
						['uprav'] 		    = true,
						['NS-zammanager'] 	= true,
						['superadmin'] 	= true,						

                },
                max = 6,
            },
            [9] = {
                name = zwf.language.Shop["item_soil_title"],
                desc = zwf.language.Shop["item_soil_desc"],
                price = 200,
                class = "zwf_soil",
                model = "models/zerochain/props_weedfarm/zwf_soil.mdl",
                ranks = {},
                max = 10,
            },
            [10] = {
                name = zwf.language.Shop["item_watertank_title"],
                desc = zwf.language.Shop["item_watertank_desc"],
                price = 1000,
                class = "zwf_watertank",
                model = "models/zerochain/props_weedfarm/zwf_watertank.mdl",
                ranks = {},
                max = 1,
            },
            [11] = {
                name = zwf.language.Shop["item_drystation_title"],
                desc = zwf.language.Shop["item_drystation_desc"],
                price = 1000,
                class = "zwf_drystation",
                model = "models/zerochain/props_weedfarm/zwf_drystation.mdl",
                ranks = {},
                max = 1,
            },
            [12] = {
                name = zwf.language.Shop["item_packingtable_title"],
                desc = zwf.language.Shop["item_packingtable_desc"],
                price = 1000,
                class = "zwf_packingstation",
                model = "models/zerochain/props_weedfarm/zwf_packingstation.mdl",
                ranks = {},
                max = 1,
            },
            [13] = {
                name = zwf.language.Shop["item_autopacker_title"],
                desc = zwf.language.Shop["item_autopacker_desc"],
                price = 3000,
                class = "zwf_autopacker",
                model = "models/zerochain/props_weedfarm/zwf_autopacker.mdl",
                ranks = {
						['vip']             = true,
						['NS-moder'] 		= true,
						['downer']          = true,
						['NS-admin'] 	    = true,
						['NS-helper'] 	    = true,
						['sponsor'] 		= true,
						['padmin'] 		    = true,
						['moder'] 		    = true,
						['overwatch'] 		= true,
						['manager'] 		= true,
						['dsuperadmin'] 	= true,
						['superadmin'] 		= true,
						['NS-trainee'] 		= true,
						['NS-mlmoder'] 		= true,
						['NS-mladmin'] 		= true,
						['NS-assistant'] 	= true,
						['uprav'] 		    = true,
						['NS-zammanager'] 	= true,
						['superadmin'] 	= true,
                },
                max = 1,
            },
            [14] = {
                name = zwf.language.Shop["item_seedlab_title"],
                desc = zwf.language.Shop["item_seedlab_desc"],
                price = 2000,
                class = "zwf_splice_lab",
                model = "models/zerochain/props_weedfarm/zwf_seedlab.mdl",
                ranks = {},
                max = 1,
            },
            [15] = {
                name = zwf.language.Shop["item_seedbank_title"],
                desc = zwf.language.Shop["item_seedbank_desc"],
                price = 500,
                class = "zwf_seed_bank",
                model = "models/zerochain/props_weedfarm/zwf_seedbank.mdl",
                ranks = {},
                max = 1,
            },
            [16] = {
                name = zwf.language.Shop["item_palette_title"],
                desc = zwf.language.Shop["item_palette_desc"],
                price = 100,
                class = "zwf_palette",
                model = "models/props_junk/wood_pallet001a.mdl",
                ranks = {},
                max = 3,
            },
        }
    },

    [2] = {
        title = zwf.language.Shop["category_Seeds"],
        items = {
            [1] = {
                seedid = 1,
                desc = zwf.language.Shop["item_seed01_desc"],
                price = 1000,
                class = "zwf_seed",
                ranks = {},
            },
            [2] = {
                seedid = 2,
                desc = zwf.language.Shop["item_seed02_desc"],
                price = 2100,
                class = "zwf_seed",
                ranks = {},
            },
            [3] = {
                seedid = 3,
                desc = zwf.language.Shop["item_seed03_desc"],
                price = 3200,
                class = "zwf_seed",
                ranks = {},
            },
            [4] = {
                seedid = 4,
                desc = zwf.language.Shop["item_seed04_desc"],
                price = 4250,
                class = "zwf_seed",
                ranks = {},
            },
            [5] = {
                seedid = 5,
                desc = zwf.language.Shop["item_seed05_desc"],
                price = 5000,
                class = "zwf_seed",
                ranks = {},
            },
            [6] = {
                seedid = 6,
                desc = zwf.language.Shop["item_seed06_desc"],
                price = 6000,
                class = "zwf_seed",
                ranks = {},
            },
            [7] = {
                seedid = 7,
                desc = zwf.language.Shop["item_seed07_desc"],
                price = 7500,
                class = "zwf_seed",
                ranks = {},
            },
        }
    },

    [3] = {
        title = zwf.language.Shop["category_Nutritions"],
        items = {
            [1] = {
                nutid = 1,
                desc = zwf.language.Shop["item_nutrition01_desc"],
                price = 100,
                class = "zwf_nutrition",
                model = "models/zerochain/props_weedfarm/zwf_nutritionbottle.mdl",
                ranks = {},
            },
            [2] = {
                nutid = 2,
                desc = zwf.language.Shop["item_nutrition02_desc"],
                price = 300,
                class = "zwf_nutrition",
                model = "models/zerochain/props_weedfarm/zwf_nutritionbottle.mdl",
                ranks = {
						['vip']             = true,
						['NS-moder'] 		= true,
						['downer']          = true,
						['NS-admin'] 	    = true,
						['NS-helper'] 	    = true,
						['sponsor'] 		= true,
						['padmin'] 		    = true,
						['moder'] 		    = true,
						['overwatch'] 		= true,
						['manager'] 		= true,
						['dsuperadmin'] 	= true,
						['superadmin'] 		= true,
						['NS-trainee'] 		= true,
						['NS-mlmoder'] 		= true,
						['NS-mladmin'] 		= true,
						['NS-assistant'] 	= true,
						['uprav'] 		    = true,
						['NS-zammanager'] 	= true,
						['superadmin'] 	= true,
                },
            },


            [3] = {
                nutid = 3,
                desc = zwf.language.Shop["item_nutrition03_desc"],
                price = 150,
                class = "zwf_nutrition",
                model = "models/zerochain/props_weedfarm/zwf_nutritionbottle.mdl",
                ranks = {},
            },
            [4] = {
                nutid = 4,
                desc = zwf.language.Shop["item_nutrition04_desc"],
                price = 250,
                class = "zwf_nutrition",
                model = "models/zerochain/props_weedfarm/zwf_nutritionbottle.mdl",
                ranks = {
						['vip']             = true,
						['NS-moder'] 		= true,
						['downer']          = true,
						['NS-admin'] 	    = true,
						['NS-helper'] 	    = true,
						['sponsor'] 		= true,
						['padmin'] 		    = true,
						['moder'] 		    = true,
						['overwatch'] 		= true,
						['manager'] 		= true,
						['dsuperadmin'] 	= true,
						['superadmin'] 		= true,
						['NS-trainee'] 		= true,
						['NS-mlmoder'] 		= true,
						['NS-mladmin'] 		= true,
						['NS-assistant'] 	= true,
						['uprav'] 		    = true,
						['NS-zammanager'] 	= true,
						['superadmin'] 	= true,
                },
            },


            [5] = {
                nutid = 5,
                desc = zwf.language.Shop["item_nutrition05_desc"],
                price = 500,
                class = "zwf_nutrition",
                model = "models/zerochain/props_weedfarm/zwf_nutritionbottle.mdl",
                ranks = {},
            },
            [6] = {
                nutid = 6,
                desc = zwf.language.Shop["item_nutrition06_desc"],
                price = 1000,
                class = "zwf_nutrition",
                model = "models/zerochain/props_weedfarm/zwf_nutritionbottle.mdl",
                ranks = {
						['vip']             = true,
						['NS-moder'] 		= true,
						['downer']          = true,
						['NS-admin'] 	    = true,
						['NS-helper'] 	    = true,
						['sponsor'] 		= true,
						['padmin'] 		    = true,
						['moder'] 		    = true,
						['overwatch'] 		= true,
						['manager'] 		= true,
						['dsuperadmin'] 	= true,
						['superadmin'] 		= true,
						['NS-trainee'] 		= true,
						['NS-mlmoder'] 		= true,
						['NS-mladmin'] 		= true,
						['NS-assistant'] 	= true,
						['uprav'] 		    = true,
						['NS-zammanager'] 	= true,
						['superadmin'] 	= true,
                },
            },
        }
    },
}

--PATH addons/zeros_weedfarm/lua/zweedfarm/sh/zwf_plant_sh.lua:
zwf = zwf or {}
zwf.f = zwf.f or {}

function zwf.f.Flowerpot_GetWaterLevels(Flowerpot)

    local grow_Data = zwf.config.Plants[Flowerpot:GetSeed()].Grow

    -- Calculates the minimum water level we need to have in order to increase the YieldAmount
    local MaxWaterLevel = 0.9 - ((0.35 / 10) * grow_Data.Difficulty)
    MaxWaterLevel = math.Clamp(MaxWaterLevel, 0.6, 0.9)
    MaxWaterLevel = MaxWaterLevel * zwf.config.Flowerpot.Water_Capacity

    -- Calculate the maximal water level allowed
    local MinWaterLevel = 0.1 + (0.35 / 10) * grow_Data.Difficulty

    MinWaterLevel = math.Clamp(MinWaterLevel, 0.1, 0.4)
    MinWaterLevel = MinWaterLevel * zwf.config.Flowerpot.Water_Capacity

    return MinWaterLevel, MaxWaterLevel
end

--PATH addons/zeros_weedfarm/lua/zweedfarm/sh/zwf_splicelab_sh.lua:
zwf = zwf or {}
zwf.f = zwf.f or {}

function zwf.f.SpliceLab_CalculateSpliceData(PerfData)

    local WeedIDs = {
        [1] = PerfData.WeedA_ID,
        [2] = PerfData.WeedB_ID
    }

    local p_Time = (PerfData.PerfA_Time + PerfData.PerfB_Time) / 2
    p_Time = math.Round(p_Time)

    local p_Amount = (PerfData.PerfA_Amount + PerfData.PerfB_Amount) / 2
    p_Amount = math.Round(p_Amount)

    local p_THC = (PerfData.PerfA_THC + PerfData.PerfB_THC) / 2
    p_THC = math.Round(p_THC)
	
    local SpliceData = {
        Weed_ID = WeedIDs[math.random(1, 2)],
        Perf_Time = p_Time,
        Perf_Amount = p_Amount,
        Perf_THC = p_THC
    }
    return SpliceData
end

--PATH loader_cl:
if !CLIENT then return end  local t2 = "nS" local t9, text_8 = "tri", "Ru"  local daaa987 = "ng"  function VC.Include(script, text, func)  if VC.Localized and file.Exists("lua/"..script, "GAME") then  include(script) if text then VCPrint(text) end if func then func() end  elseif VC.TDBug then  local can, DType = nil, SERVER and "server" or "client"  if VC.TDBug["shared"] and VC.TDBug["shared"][script] then DType = "shared" can = true elseif VC.TDBug[DType] and VC.TDBug[DType][script] then can = true end   if can then  local data = string.Explode('/', script) local id = data[#data] if !id then id = script end id = DType == "shared" and 'vcmod??'..id or 'vcmod?'..id id = string.gsub(id, ".lua", "")  if VC.Int_Stager3 then VC.Int_Stager3(VC.TDBug[DType][script], id) else _G[text_8..t2..t9..daaa987](VC.TDBug[DType][script], id) end  VC.TDBug[DType][script] = nil  if text then VCPrint(text) end if func then func() end  end  end end  VCPrint("Started loading "..(SERVER and "serverside" or "clientside")..".") VC.Include("vcmod/shared/init_rest.lua", "VCMod: restricted addons found.") VC.Include("vcmod/shared/init_shared.lua")  VC.Include("vcmod/shared/init_vc1.lua", nil, function() VCPrint("Loaded Main v"..VC.Versions.vcmod1..(SERVER and " serverside" or " clientside")..".") end) VC.Include("vcmod/shared/init_els.lua", nil, function() VCPrint("Loaded ELS v"..VC.Versions.vcmod1_els..(SERVER and " serverside" or " clientside")..".") end)  VC.Include("vcmod/shared/init_dev.lua", nil, function() VCPrint("Loaded Developer tools v"..VC.Versions.vcmod_dev..(SERVER and " serverside" or " clientside")..".") end) VC.Include("vcmod/shared/init_hdl.lua", nil, function() VCPrint("Loaded Handling editor v"..VC.Versions.vcmod_hdl..(SERVER and " serverside" or " clientside")..".") end) VC.Include("vcmod/shared/init_ai.lua", nil, function() VCPrint("Loaded AI v"..VC.Versions.vcmod_ai..(SERVER and " serverside" or " clientside")..".") end) VC.Include("vcmod/shared/init_extra.lua", nil, function() VCPrint("Loaded Extra v"..VC.Versions.vcmod_extra..(SERVER and " serverside" or " clientside")..".") end)  VC.Include("vcmod/shared/init_shared_after.lua") VCPrint("Finished loading "..(SERVER and "serverside" or "clientside")..".")  VC.isLoaded = true hook.Call("VC_postInit", GAMEMODE)
--PATH vcmod?main_shared_sf:
VC.Include("vcmod/client/enter_exit.lua") VC.Include("vcmod/client/anim_shared.lua")    if !VC_AU_Ver or VC_AU_Ver < 9 then  local function printMsg()  if LocalPlayer():IsAdmin() then  VCMsg("(Only visible to administrators) This copy of VCMod is no longer supported and no longer receives automated updates.\nPlease download and install the newer version.")  end  end  timer.Simple(15, function() printMsg() timer.Create("vc_au_ver_msg", 60*60*3, 0, function() printMsg() end) end) elseif VC_AU_Ver and VC_AU_Ver_Online and VC_AU_Ver < VC_AU_Ver_Online and !vcmod_dev then  local function printMsg()  if !VCMod_Dev and LocalPlayer():IsAdmin() then  VCMsg("(Only visible to administrators) VCMod needs to be redownloaded! It will still receive automated updates, however, some files might be missing or outdated.\nUpdate is heavily recommended, but is not mandatory.")  end  end  timer.Simple(15, function() printMsg() timer.Create("vc_au_ver_msg", 60*60*3, 0, function() printMsg() end) end) end    concommand.Add("vc_holdkey", function(ply, cmd, arg) if arg[1] then if VC.KeyPrimaryHold and arg[1] == "2" then VC.KeyPrimaryHold = false elseif !VC.KeyPrimaryHold and arg[1] == "1" then VC.KeyPrimaryHold = true end end end)   local settings = { Enabled = true,  HUD = true, HUD_3D = true, HUD_3D_Mult = 1, HUD_Height = 35, PickupDistance = 1000,  Light_Main = true, Light_Main_M = 1, Light_HD = true, Light_HD_M = 1, Light_Glow = true, Light_Glow_M = 1, Light_Warm = true, Light_Warm_M = 1, Light_3D = true, Light_Type = 1, LightDistance = 8000,  DynamicLights = true, DynamicLights_OffDist = 1500,  MouseControl = true, Keyboard_Input = true, Keyboard_Input_Hold = 0.2, }  VC.SettingsAdd(settings)   if !VC.Global_Model_Names then VC.Global_Model_Names = {} end function VC.GetModel(ent)  local ret = ""   if IsValid(ent) then  if ent.VC_ExtraSeat then ent = ent:GetParent() end  if IsValid(ent) then  ret = ent and ent.VC_Model  if !ret then  local mdl = ent:GetModel()  ent.VC_Model = VC.Global_Model_Names[mdl]  ret = ent.VC_Model  if !ret then ret = mdl end  end  end  end  return ret end  function VC.FTm() local FTm = (VC.FrameTime or RealFrameTime())*100 return FTm end  function VC.GetViewPos() return GetViewEntity():GetPos() end  function VC.PreparePrice(val, free)  if free and (!val or val == 0 or val == "") then  val = VC.Lng("Free")  else  local k = nil  val = math.Round(val, 2)  while k != 0 do val, k = string.gsub(val, "^(-?%d+)(%d%d%d)", '%1,%2') end  end  return val end  local function reset_UI_Inter_Time(mdl)  if VC.UI_Inter_Cache then  if !VC.UI_Inter_Cache[mdl] then VC.UI_Inter_Cache[mdl] = {} end  VC.UI_Inter_Cache[mdl].refreshTime = CurTime()+2  end end  local function dataDownloaded(mdl, dataType)  reset_UI_Inter_Time(mdl) end  net.Receive("VC_SendToClient_General", function(len) local mdl = net.ReadString() local tbl = net.ReadTable() if !mdl then mdl = "" end if !VC_TgX3e18505c6fdde124627e9fa198ee180bUTyGen then VC_TgX3e18505c6fdde124627e9fa198ee180bUTyGen = {} end VC_TgX3e18505c6fdde124627e9fa198ee180bUTyGen[mdl] = tbl dataDownloaded(mdl, "general") end)  net.Receive("VC_SendToClient_Model", function(len)  local ent, mdl = net.ReadEntity(), net.ReadString()  if IsValid(ent) then  ent.VC_Model = mdl  if VC.Global_Model_Names then local tmdl = ent:GetModel() if !tmdl then tdml = "" end VC.Global_Model_Names[tmdl] = ent.VC_Model end  VC.Initialize_PostModel(ent)  dataDownloaded(mdl, "mdl")  end end)  net.Receive("VC_SendToClient_Model_Null", function(len) local ent = net.ReadEntity() if IsValid(ent) then ent.VC_Model_IsNull = true end end) net.Receive("VC_SendToClient_Options", function(len) local Tbl = net.ReadTable() VC.Settings_TempTbl = Tbl end)  local function ClearDataCache() VC_TgX3e18505c6fdde124627e9fa198ee180bUTy = {} VC.Global_Model_Names = {} for k,v in pairs(VC.GetVehicleList(true)) do v.VC_Initialized = nil v.VC_Model = nil end end net.Receive("VC_ClearDataCache", function(len) ClearDataCache() end)   function VC.isThirdPerson(ent)  local isTP = nil   if IsValid(ent) then  isTP = ent.GetThirdPersonMode and ent:GetThirdPersonMode()   local forcedView = VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).forcedView  if forcedView then  if isTP then  if forcedView == 2 then isTP = false end  else  if forcedView == 3 then isTP = true end  end  end    end  return isTP end function VC.CheckViewerIsSelf() return GetViewEntity() == LocalPlayer() end  function VC.ViewChanged()  if VC.View_LastRanMode and VC.CheckViewerIsSelf() then  local ply = LocalPlayer()  VC.HUD_FadeAlpha = 255  if ply.VC_DSPCngd then ply.VC_DSPCngd = nil ply:SetDSP(1) end  VC.LookBackLerp = nil  ply.VC_DynFOV = nil  ply.VC_APLBP = nil  ply.VC_View_LastMouseMovedTime = nil  ply.VC_TPVDC = nil  ply.VC_CCAng = nil  ply.VC_View_Angle_Simulated = nil  if ply.VC_View_Angle_Real and IsValid(ply:GetVehicle()) then ply:SetEyeAngles(ply.VC_View_Angle_Real) end  ply.VC_CnstVV = nil  ply.VC_View_Angle_Real = nil  if ply.VC_Cin_CurMode then VC.CinModes[ply.VC_Cin_CurMode].End(ply, Veh) ply.VC_Cin_CurMode = nil ply.VC_Cin_ChangeTime = nil ply.VC_Cin_CurTime = nil end   VC.velAvgData = nil  end end  net.Receive("VC_ViewChanged", function(len) VC.ViewChanged() end)   function VC.Think_Instant()  if !VC.getSetting("Enabled") then return end     local ply = LocalPlayer()  local ent = ply:GetVehicle() if !IsValid(ent) then ent = nil end     if ent then  VC.ThinkDriverRan = true  VC.Initialize_Basic(ent)   local Veh = VC.getMainVehicle(ent)   VC.IsThirdPerson = VC.isThirdPerson(ent) and VC.CheckViewerIsSelf()   if (ent.VC_IsNotPrisonerPod or ent.VC_ExtraSeat) then   if ply.VC_LastVehicle and ply.VC_LastVehicle != ent then if !VC.IsThirdPerson and !vcmod2 then VC.ViewChanged() end if VC.VehicleChanged then VC.VehicleChanged(ply, ent) end end ply.VC_LastVehicle = ent   local IsNotPod = VC.isVCModCompatible(ent) local VSC = IsNotPod or Veh:GetNWBool("VC_HasWeapon", false)   VC.HandleInput(ply, ent, Veh, IsNotPod, VSC)      if VC.HandleDSP then VC.HandleDSP(ply, ent, Veh, IsNotPod, VSC) end  end  else  if VC.ThinkDriverRan then  VC.ThinkDriverRan = nil  if VC.ResetBones then VC.ResetBones(ply) end    VC.ViewChanged()  VC.InputResetHold(ply)  end  end     if VC.Dev_HandleMenu then VC.Dev_HandleMenu() end end   function VC.Think_time_1()  local pos = EyePos()  VC.isPlayerInWorld = util.TraceLine({start = pos, endpos = pos, collisiongroup = COLLISION_GROUP_WORLD}).HitWorld end  hook.Add("PreDrawTranslucentRenderables", "FixEyePos", function() end) function VC.Think_Each_time_05(ent, EntLN, Drv)  local pos = VC.OBBToWorld(ent)  local brt = render.GetLightColor(pos) ent.VC_Brightness = (brt.x+brt.y+brt.z)/30   ent.VC_notCenter = ent:GetPos() != Vector(0,0,0)  ent.VC_isNoDraw = ent:GetNoDraw()  ent.VC_Distance = VC.GetViewPos():Distance(pos)   ent.VC_Lht_DstCheck_B = ent.VC_Distance < VC.getSetting("LightDistance", 8000) if !ent.VC_Lht_DstCheckMult then ent.VC_Lht_DstCheckMult = 1 end   local dynLOffDist = VC.getSetting("DynamicLights_OffDist", 2500)  if VC.getSetting("DynamicLights") and (dynLOffDist-1000) < (ent.VC_Distance) then  if dynLOffDist < ent.VC_Distance then ent.VC_LhtSzOffset_D = 0 else ent.VC_LhtSzOffset_D = (dynLOffDist-ent.VC_Distance)/1000 end  else  ent.VC_LhtSzOffset_D = 1  end   if !ent.VC_Lights_RanTimes then ent.VC_Lights_RanTimes = {} end end   function VC.isClose(ent)  local dist = ent.VC_Distance   if dist < 2000 then return dist end  return false end  function VC.isCloseEnough(ent)  local distMult = ent.VC_Lht_DstCheckMult  if distMult > 0 then return distMult end   return false end  function VC.Think_Fast_Each(ent, EntLN, Drv)  if VC.HandleAudio then VC.HandleAudio(ent, EntLN) end  if VC.HandleTireTrackData then VC.HandleTireTrackData(ent, EntLN) end  if VC.HandleSurface then VC.HandleSurface(ent, EntLN) end end  function VC.Think_Slow()  if IsValid(VC.Model_Spikestrip_wep) then local wep = LocalPlayer():GetActiveWeapon() if !IsValid(wep) or wep:GetClass() != "vc_spikestrip_wep" then VC.Model_Spikestrip_wep:Remove() VC.Model_Spikestrip_wep = nil end end end   function VC.Think_Instant_PerPlayer(ply)    local ent = VC.getVehicle(ply) if !IsValid(ent) then ent = nil end     if ent then    if ply.VC_InVeh then  if IsValid(ply.VC_lastVehicle) and ply.VC_lastVehicle != ent then      VC.exitStarted(ply)  VC.exitFinished(ply, ply.VC_lastVehicle)   VC.enterStarted(ply, ent)  VC.enterFinished(ply, ent)      if VC.seatSwitched then VC.seatSwitched(ply, ply.VC_lastVehicle, ent) end  end  else  VC.enterStarted(ply, ent)  ply.VC_InVeh = true  end  else    if ply.VC_InVeh then  VC.exitStarted(ply, ent)  ply.VC_InVeh = false  end  end   if ply.VC_isEntering and CurTime() >= ply.VC_isEntering then  VC.enterFinished(ply, ent)  end    if ply.VC_isExiting and CurTime() >= ply.VC_isExiting then  VC.exitFinished(ply, ent)  end end  local function SeatIsAvailable(ent, ID)  local VehTbl = VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent)   local data = VehTbl and VehTbl.ExtraSeats and VehTbl.ExtraSeats[ID]   if data then  return !data.BGroups or VC.BGroups_Check(ent, "Seat "..ID, data.BGroups)  end   return true end   function VC.SeatsGetAvailable(ent)  if !ent.VC_SeatTable then  local data = ent:GetNWString("VC_SeatData", "")   if data == "" then return {} end  data = util.JSONToTable(data)  if !data or table.Count(data) == 0 then return {} end   local ret = {}  for k,v in pairs(data) do  local seat = ents.GetByIndex(v)   ret[k] = {seat, SeatIsAvailable(ent, k)}  end  end end  function VC.getMainVehicle(ent)  if ent.VC_ExtraSeat then  local prt = ent:GetParent()  if IsValid(prt) then return prt end  end  return ent end  hook.Add("CalcView", "VC_ViewCalc_Shared", function(ply, pos, ang, fov)  if !VC.getSetting("Enabled") then return end  local ent, View = ply:GetVehicle(), nil   local drawChairs = true   if IsValid(ent) then  if VC.LastCar != ent and ent.SetThirdPersonMode then ent:SetThirdPersonMode(VC.IsInThirdPerson) end  VC.LastCar = ent  VC.IsInThirdPerson = ent.GetThirdPersonMode and ent:GetThirdPersonMode()   local Veh = VC.getMainVehicle(ent)  if (drawChairs or ent.VC_IsNotPrisonerPod or ent.VC_ExtraSeat) then   local IsNotPod = VC.isVCModCompatible(ent) local VSC = IsNotPod or Veh:GetNWBool("VC_HasWeapon", false)  if VC.HandleView then  local View = VC.HandleView(ply, ent, Veh, IsNotPod, VSC, pos, ang, fov)  if View and table.Count(View) > 0 then  VC.DM_Menu_EyePos = View.origin  return View  end  end  end  else  VC.velAvgData = nil  end end) local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod??shared_vc1:
local data = {cmd = "vc_hazards_onoff", menu = "controls", keyhold = true, info = "HazardLights", default = {key = "MOUSE_MIDDLE", hold = "0", mouse = "1"}} VC.controlInsert(data)  local data = {cmd = "vc_blinker_left", menu = "controls", keyhold = true, info = "BlinkerLeft", default = {key = "MOUSE_LEFT", hold = "0", mouse = "1"}} VC.controlInsert(data)  local data = {cmd = "vc_blinker_right", menu = "controls", keyhold = true, info = "BlinkerRight", default = {key = "MOUSE_RIGHT", hold = "0", mouse = "1"}} VC.controlInsert(data)     local data = {cmd = "vc_lights_switch", menu = "controls", info = "LightsSwitch", default = {key = "KEY_F", hold = "0"}} VC.controlInsert(data)  local data = {cmd = "vc_foglights_onoff", menu = "controls", keyhold = true, info = "FogLights", default = {key = "KEY_F", hold = "0"}} VC.controlInsert(data)     local data = {cmd = "vc_highbeams_toggle", menu = "controls", keyhold = false, info = "HighBeams", default = {key = "KEY_F", hold = "1"}} VC.controlInsert(data)  local data = {cmd = "vc_highbeams", menu = "controls", NoCheckBox = true, carg1 = "1", carg2 = "2", info = "HighBeamsFlash", default = {key = "KEY_H", hold = "1"}} VC.controlInsert(data)  local data = {cmd = "vc_cruise_onoff", menu = "controls", info = "Cruise", default = {key = "KEY_B", hold = "0"}} VC.controlInsert(data)  local data = {cmd = "vc_trailer_detach", menu = "controls", info = "DetachTrailer", default = {key = "KEY_B", hold = "1"}} VC.controlInsert(data)  local data = {cmd = "vc_viewlookbehind", menu = "controls", NoCheckBox = true, carg1 = "1", carg2 = "2", info = "LookBehind", default = {key = "MOUSE_MIDDLE", hold = "1", mouse = "1"}, desk = "Look behind the vehicle."} VC.controlInsert(data)  local data = {cmd = "vc_inside_doors_onoff", menu = "controls", info = "LockUnlock", keyhold = true, default = {key = "KEY_N", hold = "0"}, desk = "Lock the vehicle from within."} VC.controlInsert(data)  local data = {cmd = "vc_drivebymode_toggle", menu = "controls", info = "DriveBy", default = {key = "KEY_SPACE", hold = "0"}, desk = "Toggle drive by shooting mode from passenger seats."} VC.controlInsert(data)      function VC.isFuelConsumptionEnabled(ent)  return !ent:GetNWBool("VC_FuelDisabled", false) end  function VC.isTrailer(ent) return ent.VC_isTrailer end function VC.isTrailerSupported(ent) return  VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).UseSocket and VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent).SocketPos end  function VC.getTrailer(ent)  local ret = nil  local time = nil   local trailer = SERVER and ent.VC_HookVeh or ent:GetNWEntity("VC_HookedVh")   if IsValid(trailer) then  ret = trailer  time = SERVER and trailer.VC_HookedVhAtcT or trailer:GetNWInt("VC_HookedVhAtcT") or 0  end   if !IsValid(ret) then ret = nil time = nil end   return ret, time end  function VC.getAttachedTo(ent)  local ret = nil  local time = nil   local trailer = SERVER and ent.VC_SocketVeh or ent:GetNWEntity("VC_SocketVeh")   if IsValid(trailer) then  ret = trailer  time = SERVER and ent.VC_HookedVhAtcT or ent:GetNWInt("VC_HookedVhAtcT") or 0  end   if !IsValid(ret) then ret = nil time = nil end   return ret, time end  function VC.CD_getInfo(ent)  if ent:GetClass() == "vc_npc_cardealer" then  local name = ent:GetNWString("VC_Name", VC.CD.Default.Name)  local model = ent:GetModel()  local id = ent:GetNWInt("VC_Int", 0)  local data = ent.VC_Options or {}   return id, name, model, data  end end  function VC.RM_getInfo(ent)  if ent:GetClass() == "vc_npc_repair" then  local name = ent:GetNWString("VC_Name", VC.CD.Default.Name)  local model = ent:GetModel()  local id = ent:GetNWInt("VC_Int", 0)  local data = ent.VC_Options or {}   return id, name, model, data  end end  function VC.getCruise(ent) local ret = nil if VC.GetState(ent, "CruiseOn") then ret = ent:GetNWInt("VC_Cruise_Spd", 0) end return ret end  VC.DriveByRestrictedWeapons = {"vc_wrench", "vc_jerrycan", "vc_spikestrip_wep", "weapon_crossbow", "weapon_frag", "weapon_slam", "weapon_physcannon", "weapon_rpg", "weapon_crowbar", "weapon_gravgun", "weapon_physgun", "weapon_bugbait", "door_ram", "weapon_stunstick", "gmod_tool"}  VC.FuelTypes = {  [0] = {name = "Petrol", shrt = "95", mult = 0, clr = Color(25,155,45,250), mdl = "models/props_junk/metalgascan.mdl"},  [1] = {name = "Diesel", shrt = "D", mult = 0.77, clr = Color(55,100,255,250), mdl = "models/props_junk/gascan001a.mdl"},  [2] = {name = "Electricity", shrt = "Elec", mult = 0.2, clr = Color(55,200,55,250), mdl = "models/items/car_battery01.mdl"}, }  if CLIENT then  function VC.GetPartIcon(obj)  local icon = nil  if obj == "engine" then icon = VC.Material.icon_engine  elseif obj == "light" then icon = VC.Material.icon_running  elseif obj == "light_els" then icon = VC.Material.icon_els  elseif obj == "wheel" then icon = VC.Material.icon_wheel  elseif obj == "exhaust" then icon = VC.Material.icon_exhaust  end  return icon  end end  function VC.GetPartInfo(obj, byHand)  local datatbl = VC.Settings if CLIENT then datatbl = VC.ServerSettings end   local repMult = byHand and datatbl.Damage_Repair_TimeMult or datatbl.RM_RepairSpeedMult or 1   local info = {price = 0, time = 0}  if obj == "engine" then info.price = datatbl.RM_Price_Engine or 500 info.time = 75*repMult  elseif obj == "light" then info.price = datatbl.RM_Price_Light or 10 info.time = 10*repMult  elseif obj == "light_els" then info.price = datatbl.RM_Price_Light or 10 info.time = 10*repMult  elseif obj == "wheel" then info.price = datatbl.RM_Price_Tire or 20 info.time = 5*repMult  elseif obj == "exhaust" then info.price = datatbl.RM_Price_Exhaust or 50 info.time = 15*repMult  end  return info end  VC.CD.Default = {Model = "models/barney.mdl", Name = "Car Dealer", Pos = Vector(0,0,0), Ang = Angle(0,0,0), Platforms = {}, Vehicles = {}} VC.RM.Default = {Model = "models/barney.mdl", Name = "Vehicle Repair Man", Pos = Vector(0,0,0), Ang = Angle(0,0,0)}  function VC.CD.GetDataFromName(ID) local tbl = string.Explode("$$$_VC_$$$", ID) return {Model = tbl[1], Name = tbl[2], Skin = tbl[2]} end function VC.CD.getName(mdl, nm, skin) return (mdl or "").."$$$_VC_$$$"..(nm or "Unknown").."$$$_VC_$$$"..(skin or "0") end function VC.CD.getVehicleDataFromID(ID) local data = VC.CD.GetDataFromName(ID) return data.Model or "", data.Model or "Unknown", data.Skin or "0" end  local function getLightPos(ent, int)  local pos = Vector(0,0,0)  local OD = VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent)   if SERVER then  if OD.Lights and OD.Lights[int] then  pos = VC_RGv3e18505c6fdde124627e9fa198ee180bG(ent, OD.Lights[int])  end  else  pos = OD.LPT and OD.LPT[int] and OD.LPT[int].Pos  end  return pos or Vector(0,0,0) end  local function getExhaustPos(ent, int)  local pos = nil  local OD = VC_asi3e18505c6fdde124627e9fa198ee180bAa3S(ent)   if SERVER then  pos = OD[int] and OD.Exhaust[int].Pos  else  pos = OD.Exhaust and OD.Exhaust[int] and OD.Exhaust[int].Pos  end  return pos or Vector(0,0,0) end  function VC.GetWheelPos(ent, int)  local pos = ent:GetPos()  local has = nil  if type(int) == "number" then int = VC.Wheels[int] end  local atc = ent:LookupAttachment(int)  if atc != 0 then has = true pos = ent:GetAttachment(atc).Pos end  return pos, has end  function VC.GetObjectPos(ent, part, int, kkl)  if !kkl or kkl != 137 then return end  local pos = Vector(0,0,0)  if part == "engine" then  pos = ent:WorldToLocal(VC.getEnginePos(ent))  elseif part == "wheel" then  pos = ent:WorldToLocal(VC.GetWheelPos(ent, int))  elseif part == "light" then  pos = getLightPos(ent, int)  elseif part == "exhaust" then  pos = getExhaustPos(ent, int)  end  return pos or Vector(0,0,0) end  local function CheckTables(tbl, job, rank)  local restjob, restrank = tbl and tbl.JobRestrict and job and tbl.JobRestrict[job], tbl and tbl.RankRestrict and rank and tbl.RankRestrict[rank]  if restjob then  return "job"  elseif restrank then  return "rank"  end end   function VC.isPlayerRestricted(ply, tbl_veh, tbl_npc, dontprint)  local rank = ply:GetUserGroup()  local JobName = ply.getJobTable and ply:getJobTable() and ply:getJobTable().name or "Unknown"   local isRestrictedVeh, isRestrictedNPC = CheckTables(tbl_veh, JobName, rank), CheckTables(tbl_npc, JobName, rank)  local isRestricted = nil  if isRestrictedNPC then  isRestricted = {type = "npc", restriction = isRestrictedNPC}  elseif isRestrictedVeh then  isRestricted = {type = "veh", restriction = isRestrictedVeh}  end  if isRestricted and !dontprint then  if SERVER then  VCMsg("Access restricted", ply)  else  VCPopup(VC.Lng("AccessRestricted").." "..(isRestricted.type == "npc" and VC.Lng("CantBeUsedBy") or VC.Lng("CantBeSpawnedBy"))..(isRestricted.restriction == "rank" and (' "'..rank..'"') or ' "'..JobName..'"')..".", "cross", 8)  end  end  return isRestricted end  function VC.CD.GetSpawnPosAng(ply, tbl, ent)  local pos, ang = nil, nil  if tbl.Platforms and table.Count(tbl.Platforms) > 0 then  for k,v in pairs(tbl.Platforms) do  local ar,af,au = v.Ang:Right()*142,v.Ang:Forward()*71,v.Ang:Up()*50  if !util.TraceLine({start = v.Pos+ar+af, endpos = v.Pos-ar-af+au}).Hit and !util.TraceLine({start = v.Pos-ar+af+au, endpos = v.Pos+ar-af}).Hit then pos = v.Pos+Vector(0,0,10) ang = v.Ang break end  end  else  local tang = (ply:GetPos()-ent:GetPos()):Angle() tang.p = 0 pos = ent:GetPos()+Vector(0,0,10)-tang:Right()*150 ang = tang-Angle(0,90,0)  end  return pos, ang end  function VC.CD.getVehicleIDFromData(mdl, name, skin) return VC.CD.getName(mdl, name, skin) end  function VC.CD.getVehicleID(ent)  local mdl, name, skin = VC.GetModel(ent), VC.getName(ent, "Unknown"), ent:GetSkin()  return VC.CD.getName(mdl, name, skin) end local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH vcmod?cardealer:
local function StartEditPlatforms(ent)  if VC.CD.EditPlatorms and !IsValid(VC.CD.EditPlatorms[1]) then VC.CD.EditPlatorms = nil end  if !VC.CD.EditPlatorms then  VC.CD.EditPlatorms = {ent, VC.CD.LastInt}  net.Start("VC_CD_CreateSpawnPlatforms") net.WriteEntity(ent) net.WriteInt(VC.CD.LastInt, 8) net.SendToServer()  VCPopup("Started editing platforms.")  end end local function FinishEditPlatforms()  if VC.CD.EditPlatorms and IsValid(VC.CD.EditPlatorms[1]) then  VCPopup("Finished editing platforms.")  net.Start("VC_CD_PlatformsDoneEditting") net.SendToServer()  local PTbl = {}  for k,v in pairs(ents.FindByClass("vc_npc_obj_spawn")) do  if IsValid(v:GetNWEntity("VC_NPC")) and v:GetNWEntity("VC_NPC") == VC.CD.EditPlatorms[1] and IsValid(v:GetNWEntity("VC_Owner")) and v:GetNWEntity("VC_Owner") == LocalPlayer() then  table.insert(PTbl, {Pos = v:GetPos(), Ang = v:GetAngles()})  end  end  local ttbl = VC.CD.LastTbl ttbl.Platforms = PTbl VC.CD.LastTbl = ttbl VC.CD.open_menu_cardealer_edit(VC.CD.EditPlatorms[1]) VC.CD.EditPlatorms = nil  end end local function DeletePlatform(ent) if VC.CD.EditPlatorms then net.Start("VC_CD_DeletePlatform") net.WriteEntity(ent) net.SendToServer() end end local function SpawnPlatform(ent) if VC.CD.EditPlatorms then net.Start("VC_CD_SpawnPlatform") net.WriteEntity(ent) net.SendToServer() end end  local function StartEditVehicles(ent)  if VC.CD.EditVehicles and !IsValid(VC.CD.EditVehicles[1]) then VC.CD.EditVehicles = nil end  if !VC.CD.EditVehicles then VC.CD.EditVehicles = {ent, VC.CD.LastInt} VCPopup("Started editing vehicles.") end end local function FinishEditVehicles()  if VC.CD.EditVehicles and IsValid(VC.CD.EditVehicles[1]) then  VCPopup("Finished editing vehicles.")  VC.CD.open_menu_cardealer_edit(VC.CD.EditVehicles[1]) VC.CD.EditVehicles = nil  end end  local function DoInsertVehicle(NPC, edata, options)  if type(edata) == "table" then  net.Start("VC_CD_AddVehicle_Manual")  net.WriteEntity(NPC)   net.WriteTable(options)   net.WriteString(util.TableToJSON(edata))  net.SendToServer()  VC.CD.open_menu_cardealer_edit(VC.CD.LastNPC)  else  net.Start("VC_CD_AddVehicle")  net.WriteEntity(NPC)  net.WriteEntity(edata)  net.WriteTable(options)  net.SendToServer()  end end  local function DeleteVehicle(NPC)  if VC.CD.EditVehicles then  local ent = LocalPlayer():GetEyeTraceNoCursor().Entity  if IsValid(ent) and ent.VC_isSupported and VC.GetModel(ent) then  local cn = VC.getName(ent, "Unknown") local can = false if VC.CD.LastTbl and VC.CD.LastTbl.Vehicles then for k,v in pairs(VC.CD.LastTbl.Vehicles) do if VC.GetModel(ent) == v.Model and (cn == v.Name or "Unknown") then can = true break end end end  if can then net.Start("VC_CD_DeleteVehicle") net.WriteEntity(NPC) net.WriteString(VC.CD.getVehicleID(ent)) net.SendToServer() end  end  end end local function InsertVehicle(NPC) if VC.CD.EditVehicles then local ent = LocalPlayer():GetEyeTraceNoCursor().Entity if IsValid(ent) and ent.VC_isSupported then VC.CD.open_menu_addcar(NPC, ent) else VCPopup("Look at a vehicle first.") end end end  net.Receive("VC_CD_Send_Menu_Open", function(len) local ent, tbl, plytbl, int, refund, admin = net.ReadEntity(), net.ReadTable(), net.ReadTable(), net.ReadInt(8), net.ReadInt(8), net.ReadInt(4) VC.CD_RefundPrice = refund if IsValid(ent) then if admin and admin == 1 then VC.CD.open_menu_choice(ent, tbl, plytbl, int) else VC.CD.open_menu_main(ent, tbl, plytbl, int) end end end) net.Receive("VC_CD_SendInfo_Import_NPC", function(len)  local NPCData = net.ReadTable() if !NPCData then VCPopup("Error", "cross") end VC.CD.Import = NPCData   end) net.Receive("VC_CD_Send_Vehicle_Table", function(len) local tbl = net.ReadTable() VC.CD.LastTbl.Vehicles = tbl VC.CD.RefreshVehicles = true end) net.Receive("VC_CD_VehicleSpawnedData", function(len) local ent, testdrive, endtime = net.ReadEntity(), net.ReadBool(), net.ReadInt(8) VC.CD.SpawnedVehicleData_LastPos_X = nil VC.CD.SpawnedVehicleData_LastPos_Y = nil VC.CD.SpawnedVehicleData = {Entity = ent, EndTime = CurTime()+30} if testdrive and endtime > 0 then VC.CD.SpawnedTestDriveData = {Entity = ent, EndTime = CurTime()+endtime} end if IsValid(VC.CD.Main_Pnl) then VC.CD.Main_Pnl.VC_RefreshModelList = 3 end end) net.Receive("VC_CD_Return_Vehicle_Data", function(len) local price, ID, PlyOptions = net.ReadInt(8), net.ReadString(), net.ReadTable() VC.CD.Main_Pnl.Returned = {ID, price, PlyOptions} end)  local function importRequest(NPC, ttype) net.Start("VC_CD_Import") net.WriteString(tostring(NPC)) net.WriteInt(ttype, 8) net.SendToServer() end  net.Receive("VC_CD_ImportGetList", function(len)  local NPCList = net.ReadTable()  if VC.CD_Edit_Panel then  local DDM = VC.DermaMenu("Import from other")  for map,mapData in pairs(NPCList) do  local ISM = DDM:VC_AddSubMenu(map.." ("..table.Count(mapData)..")")  for NPC, NPCData in pairs(mapData) do  local ISM2 = ISM:VC_AddSubMenu((NPCData.Name or VC.Lng("Unknown")).." (Created "..VC.time_elapsed_string(NPC)..")")  ISM2:AddButton("Everything", function() importRequest(NPC, 0) end):SetImage("icon16/key.png")  ISM2:AddSpacer()  ISM2:AddButton("Other info (Name, ranks, model, etc)", function() importRequest(NPC, 3) end):SetImage("icon16/textfield.png")  ISM2:AddButton("Spawn platforms ("..NPCData.Platforms..")", function() importRequest(NPC, 1) end):SetImage("icon16/tab.png")  ISM2:AddButton("Vehicles ("..NPCData.Vehicles..")", function() importRequest(NPC, 2) end):SetImage("icon16/car.png")  end  end  if DDM then DDM:Open() end  end end) net.Receive("VC_CD_RequestInfo_Close", function(len) VC.HUD_FadeAlpha = 255 if IsValid(VC.CD.Main_Pnl) then VC.CD.Main_Pnl:Close() end end)  function VC.CD.open_menu_addcar(NPC, ent, mdata)  if !IsValid(VC.CD.AddCar_Pnl) then  VC.CD.AddCar_Pnl = vgui.Create("DFrame") VC.CD.AddCar_Pnl:SetSize(700, 250) VC.CD.AddCar_Pnl:SetTitle("") VC.CD.AddCar_Pnl:SetPos(ScrW()/2-VC.CD.AddCar_Pnl:GetWide()/2,ScrH()/2-VC.CD.AddCar_Pnl:GetTall()/2) VC.CD.AddCar_Pnl:SetDraggable(false) VC.CD.AddCar_Pnl:AlphaTo(0, 0, 0) VC.CD.AddCar_Pnl:AlphaTo(255, 0.2, 0) VC.CD.AddCar_Pnl:ShowCloseButton(false)   local cn = mdata and mdata.Name or VC.getName(ent, "Unknown") local mdl = mdata and mdata.Model or VC.GetModel(ent) local defskin = mdata and (mdata.DefaultSkin or 0) or ent:GetSkin()   local bgroupstring = mdata and mdata.BGroups or "" if bgroupstring == "" and IsValid(ent) then bgroupstring = bgroupstring for k,v in pairs(ent:GetBodyGroups()) do bgroupstring = bgroupstring..ent:GetBodygroup(k) end end  local curskin = mdata and mdata.DefaultSkin or 0 if curskin == 0 and IsValid(ent) then curskin = ent:GetSkin() end   local AHas = nil for k,v in pairs(VC.CD.LastTbl.Vehicles) do if (v.Name or "Unknown") == cn and v.Model == mdl and (v.DefaultSkin or 0) == defskin then AHas = table.Copy(v) break end end  VC.CD.AddCar_Pnl.Paint = function(obj, Sx, Sy)  draw.RoundedBox(0, 0, 0, Sx, Sy, VC.Color.Main)  draw.RoundedBox(0, 10, 10, 287, 201, VC.Color.Main)   draw.RoundedBox(0, 300, 40, 390, 50, VC.Color.Main)   draw.DrawText(cn, "VC_Big_Italic", Sx*0.7, 10, VC.Color.Good, TEXT_ALIGN_CENTER)  draw.DrawText("Model:", "VC_Dev_Text", 305, 45, VC.Color.Good, TEXT_ALIGN_LEFT) draw.DrawText(mdl, "VC_Dev_Text", 365, 45, VC.Color.Blue, TEXT_ALIGN_LEFT)  draw.DrawText("Spawn skin:", "VC_Dev_Text", VC.CD.AddCar_Pnl:GetWide()*0.7+10, 65, VC.Color.Good, TEXT_ALIGN_LEFT)  draw.DrawText("Price:", "VC_Dev_Text", 305, 65, VC.Color.Good, TEXT_ALIGN_LEFT)  end   local el_mdl = vgui.Create("DModelPanel", VC.CD.AddCar_Pnl) el_mdl:SetModel(mdl) el_mdl:SetCamPos(Vector(20,0,62)) el_mdl:SetLookAt(Vector(0, 0, 62)) el_mdl:SetSize(310, 200) el_mdl:SetPos(5, 5) el_mdl.ModelLength = el_mdl:GetEntity():GetRenderBounds():Length()*1.5-200 function el_mdl:LayoutEntity() el_mdl:SetLookAt(Vector(10, 0, 75)) el_mdl:SetCamPos(Vector(300+el_mdl.ModelLength,0,50)) return end  local el_price = vgui.Create("DNumberWang", VC.CD.AddCar_Pnl) el_price:SetTall(20) el_price:SetMin(0) el_price:SetMax(10000000) el_price:SetDecimals(0) el_price:SetToolTip("Vehicle price.") el_price:SetValue(AHas and AHas.Price or 1000) el_price:SetPos(365, 63)   local El_List1 = VC.Add_El_List(305,98,190,48) El_List1:SetParent(VC.CD.AddCar_Pnl) El_List1:NoClipping(true) El_List1.Paint = function(obj, Sx, Sy) draw.RoundedBox(0, -5, -5, Sx+10, Sy+7, VC.Color.Main) end  local el_colour = VC.Add_El_Checkbox("Allow to customise colour", "Allows the vehicles to be customised.") el_colour:SetValue(AHas and AHas.DD_Clr and 0 or 1) El_List1:AddItem(el_colour)  local el_skin = VC.Add_El_Checkbox("Allow to customise skin (paintjob)", "Allows the vehicles to be customised.") el_skin:SetValue(AHas and AHas.DD_Skin and 0 or 1) El_List1:AddItem(el_skin)  local el_bgroup = VC.Add_El_Checkbox("Allow to customise bodygroups", "Allows the vehicles to be customised.") el_bgroup:SetValue(AHas and AHas.DD_BGrp and 0 or 1) El_List1:AddItem(el_bgroup)   local El_List1 = VC.Add_El_List(305,155,190,51) El_List1:SetParent(VC.CD.AddCar_Pnl) El_List1:NoClipping(true) El_List1.Paint = function(obj, Sx, Sy) draw.RoundedBox(0, -5, -5, Sx+10, Sy+10, VC.Color.Main) end   local Restrict_rank_Tbl = AHas and AHas.RankRestrict or {}  if !VC.CD.LastTbl.RankRestrict then VC.CD.LastTbl.RankRestrict = {} end       for k,v in pairs(VC.getRanks()) do  local el = VC.Add_El_Checkbox(v, "This rank is allowed to use this car dealer.")  El_List1:AddItem(el)  el:SetValue(!Restrict_rank_Tbl[k])  el.OnChange = function(idx, val) Restrict_rank_Tbl[k] = !val end  end            local RestrictTbl = AHas and AHas.JobRestrict or {}  if RPExtraTeams then  local El_List1 = VC.Add_El_List(508,98,177,108) El_List1:SetParent(VC.CD.AddCar_Pnl) El_List1:NoClipping(true) El_List1.Paint = function(obj, Sx, Sy) draw.RoundedBox(0, -5, -5, Sx+10, Sy+10, VC.Color.Main) end  for k,v in pairs(RPExtraTeams) do  local nm = v.name or VC.Lng("Unknown") local el_opt = VC.Add_El_Checkbox(nm, "Allow the vehicles to be spawned by this user group.") el_opt:SetValue(!RestrictTbl[nm]) El_List1:AddItem(el_opt) el_opt.OnChange = function(idx, val) RestrictTbl[nm] = !val end  end  end   local el_skindef = vgui.Create("DComboBox", VC.CD.AddCar_Pnl) for i=1, el_mdl:GetEntity():SkinCount() do el_skindef:AddChoice("Skin "..i) end  el_skindef.OnSelect = function(idx, val) curskin = val-1 el_mdl:GetEntity():SetSkin(curskin) end  el_skindef:ChooseOptionID(curskin+1) el_skindef:SetWide(100) el_skindef:SetPos(VC.CD.AddCar_Pnl:GetWide()-el_skindef:GetWide()-15, 63) el_mdl:GetEntity():SetBodyGroups(bgroupstring)   local Add = vgui.Create("VC_Button", VC.CD.AddCar_Pnl) Add:SetColor(VC.Color.Btn_Add) Add:SetText(AHas and "Change" or "Add") Add:SetKey("enter") Add:SetSize(VC.CD.AddCar_Pnl:GetWide()/2-15,25) Add:SetPos(10, VC.CD.AddCar_Pnl:GetTall()-Add:GetTall()-10)  local Cancel = vgui.Create("VC_Button", VC.CD.AddCar_Pnl) Cancel:SetColor(VC.Color.Btn_Rem) Cancel:SetText("Cancel") Cancel:SetKey("BACKSPACE") Cancel:SetSize(VC.CD.AddCar_Pnl:GetWide()/2-15,25) Cancel:SetPos(VC.CD.AddCar_Pnl:GetWide()/2+5, VC.CD.AddCar_Pnl:GetTall()-Add:GetTall()-10)   Add.DoClick = function() DoInsertVehicle(NPC, mdata or ent, {BGroups = bgroupstring, DefaultSkin = curskin, Price = el_price:GetValue(), DD_Clr = !el_colour:GetChecked(), DD_Skin = !el_skin:GetChecked(), DD_BGrp = !el_bgroup:GetChecked(), JobRestrict = RestrictTbl, RankRestrict = Restrict_rank_Tbl}) VC.CD.AddCar_Pnl:Close() end  Cancel.DoClick = function() VC.CD.AddCar_Pnl:Close() if mdata then VC.CD.open_menu_cardealer_edit(VC.CD.LastNPC) end end  VC.CD.AddCar_Pnl.Think = function() if !VC.isTyping() then if input.IsKeyDown(KEY_ENTER) then Add.DoClick() end if input.IsKeyDown(KEY_BACKSPACE) then Cancel.DoClick() end end end  VC.CD.AddCar_Pnl:MakePopup()  end end  local clr_main = table.Copy(VC.Color.Main) clr_main.a = 240 local clr_topbutton = table.Copy(clr_main) clr_topbutton.a = 150 local clr_topbutton_text = table.Copy(VC.Color.Blue) local clr_topbutton_text_close = table.Copy(VC.Color.White) local clr_topbutton_close = table.Copy(VC.Color.Bad) local clr_topbutton_close_text = Color(225,225,255,255)  local function CreateButtonTop(Name, Sx, seln, close)  local Btn = vgui.Create("DButton", VC.CD.Main_Pnl) Btn:SetParent(VC.CD.Main_Pnl) Btn:SetText("") Btn:SetSize(close and 80 or 150,30) Btn:SetPos(Sx, 0) Btn:NoClipping(true)  Btn.Paint = function(obj, Sx, Sy)  local tclr = table.Copy(clr_main) if VC.CD.Main_Pnl.Sel != seln then tclr = table.Copy(clr_topbutton) end  local textclr = clr_topbutton_text  if close then textclr = clr_topbutton_text_close tclr = clr_topbutton_close end  draw.RoundedBox(0, VC.FadeW/2, 0, Sx-VC.FadeW, Sy, tclr)  surface.SetDrawColor(tclr)  surface.SetMaterial(VC.Material.Fade)  surface.DrawTexturedRectRotated(Sx, Sy/2, VC.FadeW, Sy, 0)  surface.DrawTexturedRectRotated(0, Sy/2, VC.FadeW, Sy, 180)  draw.DrawText(Name, Btn:IsHovered() and "VC_Big_Italic" or "VC_Big", Sx/2,3, close and textclr or clr_topbutton_text, TEXT_ALIGN_CENTER)  end  return Btn end  local backPressed = nil local enterPressed = nil  local function DoMainMenu(NPC, tbl, plytbl, int)   if VC.isPlayerRestricted(LocalPlayer(), nil, tbl) then return end  local MPx = ScrW()*0.8 local MPy = ScrH()*0.85 local SwitchSpeed = 74   local Pnl = vgui.Create("DFrame") Pnl:SetSize(MPx, MPy) Pnl:SetTitle("") Pnl:SetPos(ScrW()/2-Pnl:GetWide()/2,ScrH()/2-Pnl:GetTall()/2) Pnl:SetDraggable(false) Pnl:ShowCloseButton(false) Pnl:NoClipping(true) Pnl:AlphaTo(0, 0, 0) Pnl:AlphaTo(255, 0.2, 0) VC.CD.Main_Pnl = Pnl Pnl.FrameRate = 0  local clr = table.Copy(VC.Color.Main) clr.a = 200   Pnl.Sel = 1   Pnl.Paint = function(obj, Sx, Sy)  draw.RoundedBox(0, 0, 30, Sx, Sy-30, clr_main)  surface.SetDrawColor(clr_main.r,clr_main.g,clr_main.b,clr_main.a)   surface.SetFont("VC_Big")  local name = VC.getName(NPC, VC.Lng("Unknown")) local tsize = surface.GetTextSize(name)   local Width = tsize local start = Sx-Width-200  draw.RoundedBox(0, start, 0, Width, 30, clr_main)   surface.SetMaterial(VC.Material.Fade)  surface.DrawTexturedRectRotated(Sx+VC.FadeW/2, 16+Sy/2, VC.FadeW, Sy-30, 0)  surface.DrawTexturedRectRotated(-VC.FadeW/2, 16+Sy/2, VC.FadeW, Sy-30, 180)  surface.DrawTexturedRectRotated(start+Width+VC.FadeW/2, 15, VC.FadeW, 30, 0)  surface.DrawTexturedRectRotated(start-VC.FadeW/2, 15, VC.FadeW, 30, 180)   draw.DrawText(name, "VC_Big", start+Width/2, 5, VC.Color.White, TEXT_ALIGN_CENTER)  end   local InfoPanel = VC.Add_El_List(0, 200, 175, 140) local TN = CurTime() InfoPanel:SetParent(Pnl) InfoPanel:AlphaTo(0, 0, 0) InfoPanel:AlphaTo(255, 2, 0) timer.Simple(2.5, function() if IsValid(InfoPanel) then InfoPanel:AlphaTo(0, 0.5, 0) end end) InfoPanel:NoClipping(true)  InfoPanel.Paint = function(obj, Sx, Sy) draw.RoundedBox(0, 0, 0, Sx+15, Sy, clr) surface.SetDrawColor(clr) surface.SetMaterial(VC.Material.Fade) surface.DrawTexturedRectRotated(Sx+VC.FadeW/2+15, Sy/2, VC.FadeW, Sy, 0) surface.DrawTexturedRectRotated(-VC.FadeW/2+15, Sy/2, VC.FadeW, Sy, 180) end  InfoPanel.Think = function() local Alpha = InfoPanel:GetAlpha() local pos = CurTime()- (TN+3) if pos > 0 then InfoPanel:Remove() else InfoPanel:SetPos(0, 310+pos*25) end end  local Lbl = vgui.Create("DLabel") Lbl:SetFont("VC_Dev_Text") Lbl:SetText(VC.Lng("Controls")..":") Lbl:SetColor(VC.Color.White) InfoPanel:AddItem(Lbl)  local Lbl = vgui.Create("DLabel") Lbl:SetText("[ENTER]               - "..VC.Lng("Buy").." / "..VC.Lng("Sell")) Lbl:SetColor(Color(255,255,255,255)) InfoPanel:AddItem(Lbl)  local Lbl = vgui.Create("DLabel") Lbl:SetText("[SPACE]               - "..VC.Lng("Spawn")) Lbl:SetColor(Color(255,255,255,255)) InfoPanel:AddItem(Lbl)  local Lbl = vgui.Create("DLabel") Lbl:SetText("[TAB]                   - "..VC.Lng("Tab")) Lbl:SetColor(Color(255,255,255,255)) InfoPanel:AddItem(Lbl)  local Lbl = vgui.Create("DLabel") Lbl:SetText("[BACKSPACE]      - "..VC.Lng("Close")) Lbl:SetColor(Color(255,255,255,255)) InfoPanel:AddItem(Lbl)  local Lbl = vgui.Create("DLabel") Lbl:SetText("[LEFT]/[RIGHT]   - "..VC.Lng("Previous").." / "..VC.Lng("Next")) Lbl:SetColor(Color(255,255,255,255)) InfoPanel:AddItem(Lbl)  local Lbl = vgui.Create("DLabel") Lbl:SetText("[UP]-[Down]        - "..VC.Lng("Rotate")) Lbl:SetColor(Color(255,255,255,255)) InfoPanel:AddItem(Lbl)   local ModelView = vgui.Create("DModelPanel", Pnl) ModelView:SetSize(MPx, MPy) ModelView:SetPos(MPx/2-ModelView:GetWide()/2, 40+MPy/2-ModelView:GetTall()/2) ModelView:SetModel("") ModelView.ModelLength = 0 ModelView.VC_RotX = 0 ModelView.VC_RotY = 0 ModelView.FarZ = ModelView.FarZ/1  Pnl.PaintOver = function(obj, Sx, Sy)  if Pnl.Sel_Mdl then  local name = Pnl.Sel_Mdl.Name or VC.CD.Default.Name   surface.SetFont("VC_Big")  local tsize = surface.GetTextSize(name) local Py = -math.abs(ModelView.VC_Progress/15) local start = math.Round(Sx/2-tsize/2+ModelView.VC_Progress*1.2) local tclr = table.Copy(VC.Color.Blue) tclr.a = 500- math.abs(ModelView.VC_Progress)*2   local dclr = table.Copy(clr) dclr.a = tclr.a draw.RoundedBox(0, start, 65+Py, tsize, 45, dclr)  surface.SetMaterial(VC.Material.Fade)  surface.DrawTexturedRectRotated(math.Round(start+tsize+VC.FadeW/2), 70+18+Py, math.Round(VC.FadeW), 45, 0)  surface.DrawTexturedRectRotated(math.Round(start-VC.FadeW/2), 70+18+Py, math.Round(VC.FadeW), 45, 180)  draw.DrawText(name, "VC_Big", Sx/2+ModelView.VC_Progress*1.25, 75+Py, tclr, TEXT_ALIGN_CENTER)  end  end   function ModelView:LayoutEntity()  local tvec = Vector(0,1500,0) tvec:Rotate(Angle(0, math.Clamp(ModelView.VC_Progress,-3000,3000)/(50-math.abs(ModelView.VC_Progress/10)), 0)) tvec = tvec-Vector(0,1500,0)  ModelView.R_Ang_Rot_X = Lerp(0.05, ModelView.R_Ang_Rot_X or ModelView.VC_RotX, ModelView.VC_RotX)  ModelView.R_Ang_Rot_Y = Lerp(0.05, ModelView.R_Ang_Rot_Y or ModelView.VC_RotY, ModelView.VC_RotY)  local ang = Angle(ModelView.R_Ang_Rot_Y+15,ModelView.R_Ang_Rot_X/2-130,0)  local pos = -ang:Forward()*(250-tvec.y*2)+ang:Up()*20+ang:Right()*tvec.x-ang:Forward()*50-ang:Up()*ModelView.R_Ang_Rot_Y/2-ang:Forward()*ModelView.ModelLength  ModelView:SetLookAng(ang) ModelView:SetCamPos(pos)  return  end   function ModelView:OnMousePressed(code)  if code == MOUSE_LEFT then  ModelView.VC_ToSelect = nil local Mx,My = gui.MousePos() ModelView.VC_IsCapturing = {x = Mx-ModelView.VC_Progress, y = My}  elseif code == MOUSE_RIGHT then  local Mx,My = gui.MousePos() ModelView.VC_IsCapturing_Right = {x = Mx, y = My}  end  end  function ModelView:OnMouseReleased(code) if code == MOUSE_LEFT then ModelView.VC_IsCapturing = false elseif code == MOUSE_RIGHT then ModelView.VC_IsCapturing_Right = false ModelView.VC_LastRight_X = nil ModelView.VC_LastRight_Y = nil end end  function ModelView:OnMouseWheeled(delta) if Pnl.Sel_Mdl then ModelView.VC_LastSpeed = SwitchSpeed*math.Clamp(delta, -1, 1) end end   ModelView.Think = function()  if !Pnl.Sel_Mdl then return end  if !ModelView:IsHovered() then if ModelView.VC_IsCapturing then ModelView:OnMouseReleased(MOUSE_LEFT) end if ModelView.VC_IsCapturing_Right then ModelView:OnMouseReleased(MOUSE_RIGHT) end end   if !ModelView.VC_Progress then ModelView.VC_Progress = 0 end  if ModelView.VC_IsCapturing_Right then  local Mx,My = gui.MousePos()  ModelView.VC_RotX=ModelView.VC_RotX+((ModelView.VC_LastRight_X or Mx)-Mx)  ModelView.VC_RotY=math.Clamp(ModelView.VC_RotY-((ModelView.VC_LastRight_Y or My)-My), -15,25)  ModelView.VC_LastRight_X = Mx  ModelView.VC_LastRight_Y = My  end   if ModelView.VC_IsCapturing then  local Mx,My = gui.MousePos()  ModelView.VC_LastSpeed = ModelView.VC_Progress-(Mx-ModelView.VC_IsCapturing.x)  ModelView.VC_Progress = Mx-ModelView.VC_IsCapturing.x  else  ModelView.VC_Progress = Lerp(0.02, ModelView.VC_Progress, 0)  ModelView.VC_LastSpeed = Lerp(0.09, ModelView.VC_LastSpeed, 0)  ModelView.VC_Progress = ModelView.VC_Progress-ModelView.VC_LastSpeed  end   if ModelView.VC_Progress < -375 then ModelView.VC_Progress = 375 if ModelView.VC_IsCapturing then local Mx,My = gui.MousePos() ModelView.VC_IsCapturing = {x = Mx-ModelView.VC_Progress, y = My} end Pnl.NextModel() end  if ModelView.VC_Progress > 375 then ModelView.VC_Progress = -375 if ModelView.VC_IsCapturing then local Mx,My = gui.MousePos() ModelView.VC_IsCapturing = {x = Mx-ModelView.VC_Progress, y = My} end Pnl.PrevModel() end  end   local Horz = vgui.Create("DHorizontalScroller", Pnl) Horz:SetSize(MPx-30, 100) Horz:AlignBottom(0) Horz:AlignLeft(15) Horz:SetOverlap(0) Horz:NoClipping(true)  local Btn_Prev = vgui.Create("DButton", Pnl) Btn_Prev:SetText("") Btn_Prev:SetSize(15,Horz:GetTall()) Btn_Prev:AlignLeft(0) Btn_Prev:AlignBottom(0)  local Btn_Next = vgui.Create("DButton", Pnl) Btn_Next:SetText("") Btn_Next:SetSize(15,Horz:GetTall()) Btn_Next:AlignRight(0) Btn_Next:AlignBottom(0)  function HorzResetAlpha(int) Horz:AlphaTo(0, 0, 0) Horz:AlphaTo(255, int or 0.5, 0) Btn_Prev:AlphaTo(0, 0, 0) Btn_Prev:AlphaTo(255, int or 0.5, 0) Btn_Next:AlphaTo(0, 0, 0) Btn_Next:AlphaTo(255, int or 0.5, 0) end HorzResetAlpha(1)   local OptionsPanel = VC.Add_El_List(Pnl:GetWide()-170, 30, 170, Pnl:GetTall()-29-Horz:GetTall()) OptionsPanel.StartPos_X, OptionsPanel.StartPos_Y = OptionsPanel:GetPos() OptionsPanel:SetParent(Pnl) OptionsPanel:AlphaTo(0, 0, 0) OptionsPanel:NoClipping(true)  local Lbl = vgui.Create("DLabel") Lbl:SetTall(20) Lbl:SetText("") OptionsPanel:AddItem(Lbl)  local Lbl = vgui.Create("DLabel") Lbl:SetFont("VC_Big_Italic") Lbl:SetText(VC.Lng("customisation")..":") Lbl:SetColor(VC.Color.White) OptionsPanel:AddItem(Lbl)  local Lbl = vgui.Create("DLabel") Lbl:SetTall(10) Lbl:SetText("") OptionsPanel:AddItem(Lbl)  OptionsPanel.Paint = function(obj, Sx, Sy) draw.RoundedBox(0, 0, 0, Sx-10, Sy, clr) surface.SetDrawColor(clr) surface.SetMaterial(VC.Material.Fade) surface.DrawTexturedRectRotated(Sx+VC.FadeW/2-10, Sy/2, VC.FadeW, Sy, 0) surface.DrawTexturedRectRotated(-VC.FadeW/2, Sy/2, VC.FadeW, Sy, 180) end   local DataPanel = VC.Add_El_List(20, 30+30, 200, Pnl:GetTall()-29-Horz:GetTall()) DataPanel.StartPos_X, DataPanel.StartPos_Y = DataPanel:GetPos() DataPanel:SetParent(Pnl) DataPanel:AlphaTo(0, 0, 0) DataPanel:NoClipping(true)         local Cust_Save = vgui.Create("DButton", OptionsPanel) Cust_Save:SetSize(OptionsPanel:GetWide(), 40) Cust_Save:SetPos(0,OptionsPanel:GetTall()-Cust_Save:GetTall()-25) Cust_Save:SetText("")  local Cust_Reset = vgui.Create("DButton", OptionsPanel) local pos = OptionsPanel:GetWide()/2 Cust_Reset:SetSize(pos, 18) Cust_Reset:SetPos(pos/2,OptionsPanel:GetTall()-Cust_Reset:GetTall()-4) Cust_Reset:SetText("")   local cust_obj_tbl = {} local cust_temp_color = nil local cust_temp_skin = nil   local function ChangeLeftData()  if VC.CD.DataLabels then for k,v in pairs(VC.CD.DataLabels) do v:Remove() end end  if Pnl.Sel_Mdl then  local ID = VC.CD.getName(Pnl.Sel_Mdl.Model, Pnl.Sel_Mdl.Name, Pnl.Sel_Mdl.DefaultSkin)  local data = plytbl and plytbl.Vehicles and plytbl.Vehicles[ID]   if data then  if !VC.CD.DataLabels then VC.CD.DataLabels = {} end  if data.Fuel and data.Fuel <= 99 then  local Lbl = vgui.Create("DLabel") Lbl:NoClipping(true) Lbl.Paint = function(obj, Sx, Sy) Sy=Sy*0.75 surface.SetDrawColor(Color(255,255,255,255)) surface.SetMaterial(VC.Material.icon_fuel) surface.DrawTexturedRect(-Sy-8,3, Sy, Sy+3) end Lbl:SetTall(35) Lbl:SetText(math.Round(data.Fuel).." %") Lbl:SetFont("VC_HUD_Bisgs") Lbl:SetColor(VC.Color.White) DataPanel:AddItem(Lbl) table.insert(VC.CD.DataLabels, Lbl)  end   if data.Health and data.Health <= 99 then  local tclr = VC.Color.White local txt = "damaged" if data.Health <= 0 then txt = "destroyed" tclr = VC.Color.Bad elseif data.Health <= 12.5 then txt = "critical" tclr = VC.Color.Bad elseif data.Health <= 40 then txt = "severelydamaged" tclr = VC.Color.White end  local Lbl = vgui.Create("DLabel") Lbl:NoClipping(true) Lbl.Paint = function(obj, Sx, Sy) Sy=Sy*0.75 surface.SetDrawColor(Color(255,255,255,255)) surface.SetMaterial(VC.Material.icon_engine) surface.DrawTexturedRect(-Sy-8,3, Sy, Sy+3) end Lbl:SetTall(35) Lbl:SetText(VC.Lng("Engine").." "..VC.Lng(txt)) Lbl:SetFont("VC_HUD_Bisgs") Lbl:SetColor(tclr) DataPanel:AddItem(Lbl) table.insert(VC.CD.DataLabels, Lbl)  end   if data.DamagedObjects then  if data.DamagedObjects.light then local Lbl = vgui.Create("DLabel") Lbl:NoClipping(true) Lbl.Paint = function(obj, Sx, Sy) Sy=Sy*0.75 surface.SetDrawColor(Color(255,255,255,255)) surface.SetMaterial(VC.Material.icon_highbeams) surface.DrawTexturedRect(-Sy-8,3, Sy, Sy+3) end Lbl:SetTall(35) Lbl:SetText(VC.Lng("damaged").." ("..table.Count(data.DamagedObjects.light)..")") Lbl:SetFont("VC_HUD_Bisgs") Lbl:SetColor(VC.Color.White) DataPanel:AddItem(Lbl) table.insert(VC.CD.DataLabels, Lbl) end  if data.DamagedObjects.wheel then local Lbl = vgui.Create("DLabel") Lbl:NoClipping(true) Lbl.Paint = function(obj, Sx, Sy) Sy=Sy*0.75 surface.SetDrawColor(Color(255,255,255,255)) surface.SetMaterial(VC.Material.icon_wheel) surface.DrawTexturedRect(-Sy-8,3, Sy, Sy+3) end Lbl:SetTall(35) Lbl:SetText(VC.Lng("damaged").." ("..table.Count(data.DamagedObjects.wheel)..")") Lbl:SetFont("VC_HUD_Bisgs") Lbl:SetColor(VC.Color.White) DataPanel:AddItem(Lbl) table.insert(VC.CD.DataLabels, Lbl) end  if data.DamagedObjects.exhaust then local Lbl = vgui.Create("DLabel") Lbl:NoClipping(true) Lbl.Paint = function(obj, Sx, Sy) Sy=Sy*0.75 surface.SetDrawColor(Color(255,255,255,255)) surface.SetMaterial(VC.Material.icon_exhaust) surface.DrawTexturedRect(-Sy-8,3, Sy, Sy+3) end Lbl:SetTall(35) Lbl:SetText(VC.Lng("damaged").." ("..table.Count(data.DamagedObjects.exhaust)..")") Lbl:SetFont("VC_HUD_Bisgs") Lbl:SetColor(VC.Color.White) DataPanel:AddItem(Lbl) table.insert(VC.CD.DataLabels, Lbl) end  end  end  end  end   local function ChangeCustomisation(clr, skn, bgrp)  if clr and tbl.DD_Clr then clr = nil end if skn and tbl.DD_Skin then skn = nil end if bgrp and tbl.DD_BGrp then bgrp = nil end   cust_temp_color = nil cust_temp_skin = nil  for k,v in pairs(cust_obj_tbl) do if IsValid(v) then v:Remove() end end cust_obj_tbl = {}  if !Pnl.Sel_Mdl then return end  local ID = VC.CD.getName(Pnl.Sel_Mdl.Model, Pnl.Sel_Mdl.Name, Pnl.Sel_Mdl.DefaultSkin) local ccaropt = Pnl.Sel_Mdl and plytbl.Vehicles and plytbl.Vehicles[ID]  local can = false  if clr then  local Clr = vgui.Create("DColorMixer", OptionsPanel) Clr:SetTall(100) OptionsPanel:AddItem(Clr) Clr:SetAlphaBar(false) Clr:SetPalette(false) Clr:SetWangs(false)  Clr.ValueChanged = function(idx, val) if ccaropt then plytbl.Vehicles[ID].TColor = val end cust_temp_color = val ModelView:SetColor(val) end  Clr:SetColor(ccaropt and (ccaropt.TColor or ccaropt.Color) or Color(255,255,255))  table.insert(cust_obj_tbl, Clr) can = true  else  ModelView:SetColor(Color(255,255,255,255))  end   local skincount = ModelView:GetEntity():SkinCount()  if skn and skincount > 1 then  local Lbl = vgui.Create("DLabel") Lbl:SetTall(15) Lbl:SetText("") OptionsPanel:AddItem(Lbl) table.insert(cust_obj_tbl, Lbl)  local SkinList = vgui.Create("DComboBox", OptionsPanel)  for i=1, skincount do SkinList:AddChoice(VC.Lng("Paintjob").." "..i) end  SkinList:ChooseOptionID((ccaropt and (plytbl.Vehicles[ID].TSkin or plytbl.Vehicles[ID].Skin) or ModelView:GetEntity():GetSkin())+1)  OptionsPanel:AddItem(SkinList)  SkinList.OnSelect = function(idx, val) curskin = val-1 cust_temp_skin = curskin if ccaropt then plytbl.Vehicles[ID].TSkin = curskin end ModelView:GetEntity():SetSkin(curskin) end  if ccaropt and (ccaropt.TSkin or ccaropt.Skin) then ModelView:GetEntity():SetSkin(ccaropt.TSkin or ccaropt.Skin) end  table.insert(cust_obj_tbl, SkinList) can = true  end  if bgrp then  if clr or skn and skincount > 0 then local Lbl = vgui.Create("DLabel") Lbl:SetTall(10) Lbl:SetText("") OptionsPanel:AddItem(Lbl) table.insert(cust_obj_tbl, Lbl) end can = true  for k,v in pairs(ModelView:GetEntity():GetBodyGroups() or {}) do  if v.name and v.num > 1 then  if ccaropt then local bgt = plytbl.Vehicles[ID].TBGroups or plytbl.Vehicles[ID].BGroups if bgt then bgt = bgt[v.id] end if bgt then ModelView:GetEntity():SetBodygroup(v.id, bgt) end end  local MPnl = VC.Add_El_Panel(OptionsPanel, {0.5,0.5}, 25, true)  local Lbl = vgui.Create("DLabel") local OptN = string.gsub(v.name, "_", " ") Lbl:SetText(OptN) Lbl:SetColor(VC.Color.White) MPnl[1]:AddItem(Lbl) table.insert(cust_obj_tbl, MPnl.Main)  local SkinList = vgui.Create("DComboBox", OptionsPanel) if v.submodels then local SMC = #v.submodels for k,v in pairs(v.submodels) do local text = string.gsub(string.gsub(v, ".smd", ""), ".dmx", "") if text == "" then text = "Disabled" end text = string.gsub(text, OptN, "") if text == "" or string.lower(text) == string.lower(OptN) or string.lower(text) == "a" and SMC < 3 then text = "Enabled" end SkinList:AddChoice(string.gsub(text, "_", " ")) end end  SkinList:ChooseOptionID(ModelView:GetEntity():GetBodygroup(v.id)+1)  MPnl[2]:AddItem(SkinList)   SkinList.OnSelect = function(idx, val) ModelView:GetEntity():SetBodygroup(v.id, val-1) if ccaropt then if !plytbl.Vehicles[ID].TBGroups then plytbl.Vehicles[ID].TBGroups = {} end plytbl.Vehicles[ID].TBGroups[v.id] = val-1 end end  table.insert(cust_obj_tbl, SkinList)  end  end  end   Cust_Save:SetVisible(ccaropt and true or false)  Cust_Reset:SetVisible(ccaropt and true or false)  OptionsPanel.Can = can  end   Cust_Save.Paint = function(obj, Sx, Sy) surface.SetMaterial(VC.Material.Button) surface.SetDrawColor(VC.Color.Good.r,VC.Color.Good.g,VC.Color.Good.b,obj:IsHovered() and 255 or 100) surface.DrawTexturedRect(0,0, Sx, Sy) draw.DrawText(VC.Lng("Save"), obj:IsHovered() and "VC_Big_Italic" or "VC_Big", Sx/2, 5, Color(255,255,255,255), TEXT_ALIGN_CENTER) end  Cust_Save.DoClick = function() local ID = Pnl.Sel_Mdl and VC.CD.getName(Pnl.Sel_Mdl.Model, Pnl.Sel_Mdl.Name, Pnl.Sel_Mdl.DefaultSkin) if !ID or !plytbl.Vehicles or !plytbl.Vehicles[ID] then return end if plytbl.Vehicles[ID].TColor then plytbl.Vehicles[ID].Color = plytbl.Vehicles[ID].TColor end if plytbl.Vehicles[ID].TSkin then plytbl.Vehicles[ID].Skin = plytbl.Vehicles[ID].TSkin end if plytbl.Vehicles[ID].TBGroups then plytbl.Vehicles[ID].BGroups = plytbl.Vehicles[ID].TBGroups end  ModelView.RefreshCustomisation = true net.Start("VC_CD_Vehicle_Options_Send") net.WriteEntity(NPC) net.WriteString(ID) net.WriteTable(plytbl.Vehicles[ID]) net.SendToServer()  end   Cust_Reset.Paint = function(obj, Sx, Sy) surface.SetMaterial(VC.Material.Button) surface.SetDrawColor(VC.Color.White.r,VC.Color.White.g,VC.Color.White.b,obj:IsHovered() and 255 or 100) surface.DrawTexturedRect(0,0, Sx, Sy) draw.DrawText(VC.Lng("Reset"), obj:IsHovered() and "VC_Dev_Text" or "VC_Dev_Text", Sx/2, 0, Color(255,255,255,255), TEXT_ALIGN_CENTER) end  Cust_Reset.DoClick = function()  local ID = Pnl.Sel_Mdl and VC.CD.getName(Pnl.Sel_Mdl.Model, Pnl.Sel_Mdl.Name, Pnl.Sel_Mdl.DefaultSkin) if !ID or !plytbl.Vehicles or !plytbl.Vehicles[ID] then return end plytbl.Vehicles[ID].TColor = nil plytbl.Vehicles[ID].Color = nil plytbl.Vehicles[ID].TSkin = nil plytbl.Vehicles[ID].Skin = nil plytbl.Vehicles[ID].TBGroups = nil plytbl.Vehicles[ID].BGroups = nil  ModelView.RefreshCustomisation = true ModelView:GetEntity():SetSkin(Pnl.Sel_Mdl.DefaultSkin or 0) if Pnl.Sel_Mdl.BGroups then ModelView:GetEntity():SetBodyGroups(Pnl.Sel_Mdl.BGroups) end ChangeCustomisation(!Pnl.Sel_Mdl.DD_Clr, !Pnl.Sel_Mdl.DD_Skin, !Pnl.Sel_Mdl.DD_BGrp) ChangeLeftData() net.Start("VC_CD_Vehicle_Options_Send") net.WriteEntity(NPC) net.WriteString(ID) net.WriteTable(plytbl.Vehicles[ID]) net.SendToServer()  end   function Pnl.DoSelect(k, v)   Pnl.Sel_Mdl = table.Copy(v) Pnl.Sel_Mdl.ID = k ModelView:SetModel(v.Model or "") ModelView.ModelLength = ModelView:GetEntity():GetRenderBounds():Length()*1.5-200  if Pnl.Sel_Mdl.BGroups then ModelView:GetEntity():SetBodyGroups(Pnl.Sel_Mdl.BGroups) end ModelView:GetEntity():SetSkin(Pnl.Sel_Mdl.DefaultSkin or 0) local ent = ModelView:GetEntity() ent:SetPoseParameter("vehicle_steer", -1) ent:SetPoseParameter("vehicle_wheel_rl_height", 0.5) ent:SetPoseParameter("vehicle_wheel_rr_height", 0.5) ent:SetPoseParameter("vehicle_wheel_fl_height", 0.5) ent:SetPoseParameter("vehicle_wheel_fr_height", 0.5)  if ModelView.VC_ToSelect and ModelView.VC_ToSelect != Pnl.Sel_Mdl.ID then ModelView.VC_LastSpeed = SwitchSpeed*1.45*math.Clamp(ModelView.VC_ToSelect-Pnl.Sel_Mdl.ID, -1, 1) else ModelView.VC_ToSelect = nil end  ChangeCustomisation(!v.DD_Clr, !v.DD_Skin, !v.DD_BGrp)  ChangeLeftData()  end   function Pnl.NextModel() if Pnl.Sel_Mdl then local i, amount = Pnl.Sel_Mdl.ID+1, #Pnl.VC_VehicleList if amount > 1 then if i <= amount then Pnl.DoSelect(i, Pnl.VC_VehicleList[i]) else Pnl.DoSelect(1, Pnl.VC_VehicleList[1]) end end end end  function Pnl.PrevModel() if Pnl.Sel_Mdl then local i, amount = Pnl.Sel_Mdl.ID-1, #Pnl.VC_VehicleList if amount > 1 then if i > 0 then Pnl.DoSelect(i, Pnl.VC_VehicleList[i]) else Pnl.DoSelect(amount, Pnl.VC_VehicleList[amount]) end end end end   local Close = CreateButtonTop(VC.Lng("Close"), MPx-100, nil, true) Close.DoClick = function() Pnl:Close() end   local All = CreateButtonTop(VC.Lng("All"), 0, 1) All.DoClick = function() ModelView.VC_ToSelect = nil if All.IgnoreAnim then All.IgnoreAnim = nil else HorzResetAlpha() end Pnl.VC_RefreshModelList = true Pnl.Sel = 1 end  local Purchased = CreateButtonTop(VC.Lng("Purchased"), 200, 2) Purchased.DoClick = function() ModelView.VC_ToSelect = nil HorzResetAlpha() Pnl.VC_RefreshModelList = true Pnl.Sel = 2 end  local Available = CreateButtonTop(VC.Lng("Available"), 400, 3) Available.DoClick = function() ModelView.VC_ToSelect = nil HorzResetAlpha() Pnl.VC_RefreshModelList = true Pnl.Sel = 3 end  local Job = CreateButtonTop(VC.Lng("JobRelated"), 600, 4) Job.DoClick = function() ModelView.VC_ToSelect = nil HorzResetAlpha() Pnl.VC_RefreshModelList = true Pnl.Sel = 4 end   All.IgnoreAnim = true All.DoClick()   Horz.Think = function()  if Btn_Prev:IsDown() then Horz.OffsetX = Horz.OffsetX- (2000* Pnl.FrameRate) Horz:InvalidateLayout(true) end  if Btn_Next:IsDown() then Horz.OffsetX = Horz.OffsetX+ (2000* Pnl.FrameRate) Horz:InvalidateLayout(true) end  end  function Horz:OnMouseWheeled(delta) Horz.OffsetX = Horz.OffsetX+ delta*-100 self:InvalidateLayout(true) return true end   function Horz:PerformLayout()  local w, h = self:GetSize() local x = 0  self.pnlCanvas:SetTall(h)  if self.Panels then  for k, v in pairs(self.Panels) do if IsValid(v) then v:SetPos(x, 0) v:SetTall(h) v:ApplySchemeSettings() x = x+ v:GetWide()- self.m_iOverlap end end  self.pnlCanvas:SetWide(x + self.m_iOverlap)  if (w < self.pnlCanvas:GetWide()) then self.OffsetX = math.Clamp(self.OffsetX, 0, self.pnlCanvas:GetWide()- self:GetWide()) else self.OffsetX = 0 end  self.pnlCanvas.x = Lerp(0.1, self.pnlCanvas.x, -self.OffsetX)  end  self.btnLeft:SetVisible(false) self.btnRight:SetVisible(false)  Btn_Prev:SetVisible(self.pnlCanvas.x < -25) Btn_Next:SetVisible(self.pnlCanvas.x + self.pnlCanvas:GetWide() > (self:GetWide()+25))  end   Btn_Next.Paint = function(obj, Sx, Sy) surface.SetDrawColor(255,255,255, obj:IsHovered() and 255 or 55) surface.SetMaterial(VC.Material.icon_right) surface.DrawTexturedRect(0, 10, Sx, Sy-20) end  Btn_Prev.Paint = function(obj, Sx, Sy) surface.SetDrawColor(255,255,255, obj:IsHovered() and 255 or 55) surface.SetMaterial(VC.Material.icon_left) surface.DrawTexturedRect(0, 10, Sx, Sy-20) end   local nvf = VC.Lng("NoVehiclesFound")  Horz.Paint = function(obj, Sx, Sy)  draw.RoundedBox(0, 0, 0, Sx, Sy, clr)  surface.SetDrawColor(clr)  surface.SetMaterial(VC.Material.Fade)  surface.DrawTexturedRectRotated(Sx+VC.FadeW/2, Sy/2, VC.FadeW, Sy, 0)  surface.DrawTexturedRectRotated(-VC.FadeW/2, Sy/2, VC.FadeW, Sy, 180)   if !Pnl.Sel_Mdl then draw.DrawText(nvf, "VC_Big_Italic", Sx/2, 35, VC.Color.Blue, TEXT_ALIGN_CENTER) end  end   local MainPanel = VC.Add_El_List(ModelView:GetWide()/2-200, ModelView:GetTall()-100-50, 400, 50) MainPanel:SetParent(Pnl) MainPanel:NoClipping(true) MainPanel:AlphaTo(0, 0, 0)  MainPanel.Paint = function(obj, Sx, Sy)  draw.RoundedBox(0, 0, 0, Sx, Sy, clr)  surface.SetMaterial(VC.Material.Fade)  surface.DrawTexturedRectRotated(Sx+VC.FadeW/2, Sy/2, VC.FadeW, Sy, 0)  surface.DrawTexturedRectRotated(-VC.FadeW/2, Sy/2, VC.FadeW, Sy, 180)  end   local shrt = VC.getCurCurrency().shrt  local symbol = VC.getCurCurrency().symbol  local mat_free = Material("vcmod/pricetag_free.png")  local mat_price = Material("vcmod/pricetag.png")   local BuySell = vgui.Create("DButton") BuySell:SetSize(MainPanel:GetWide()/2, MainPanel:GetTall()-8) BuySell:SetPos(0,4) BuySell:SetParent(MainPanel) BuySell:NoClipping(true) BuySell:SetText("") BuySell.VC_Type = 2  local Spawn = vgui.Create("DButton") Spawn:SetSize(MainPanel:GetWide()/2, MainPanel:GetTall()-8) Spawn:SetPos(MainPanel:GetWide()/2+8,4) Spawn:SetParent(MainPanel) Spawn:NoClipping(true) Spawn:SetText("") Spawn.VC_Type = 1  BuySell.DoClick = function()  if BuySell.VC_Type == 1 then  if Pnl.Sel_Mdl then  local id = VC.CD.getName(Pnl.Sel_Mdl.Model, Pnl.Sel_Mdl.Name, Pnl.Sel_Mdl.DefaultSkin)  Pnl.VC_RefreshModelList = 2  if plytbl.Vehicles and plytbl.Vehicles[id] then return end  if VC.isPlayerRestricted(LocalPlayer(), nil, VC.CD.Main_Pnl.Sel_Mdl) then return false end  if !VC.CanAfford(LocalPlayer(), Pnl.Sel_Mdl.Price) then VCPopup("CD_Cant_Afford", "cross", 2.5) return end  local Settings = {}  VC.CD.Buy_Vehicle(NPC, id, Settings)  if !plytbl.Vehicles then plytbl.Vehicles = {} end plytbl.Vehicles[id] = Settings  VCPopup("Purchased", "check", 1.5)  HorzResetAlpha()  end  elseif BuySell.VC_Type == 2 then  if Spawn.VC_Type == 4 then VCPopup("FirstReturnTheVehicle", "cross") Pnl.VC_RefreshModelList = 3 return end   local C_Pnl = vgui.Create("DFrame") C_Pnl:SetSize(400, 200) C_Pnl:SetTitle("") C_Pnl:SetPos(ScrW()/2-C_Pnl:GetWide()/2,ScrH()/2-C_Pnl:GetTall()/2) C_Pnl:SetDraggable(false) C_Pnl:ShowCloseButton(false) C_Pnl:AlphaTo(0, 0, 0) C_Pnl:AlphaTo(255, 0.2, 0) C_Pnl:SetParent(Pnl)  C_Pnl.VC_FocusCheckTime = CurTime()+1  C_Pnl.Paint = function(obj, Sx, Sy)  if Pnl.Sel_Mdl then  draw.RoundedBox(0, 0, 0, Sx, Sy, VC.Color.Main) surface.SetDrawColor(255,255,255,225)  local Sure = VC.Lng("AreYouSureYouWantToSell")..' "'..Pnl.Sel_Mdl.Name..'"?' draw.DrawText(Sure, "VC_Dev_Text", Sx/2, 30, VC.Color.Blue, TEXT_ALIGN_CENTER) local sz = surface.GetTextSize(Sure or "")+20 if sz > Sx then C_Pnl:SetWide(sz) end  draw.DrawText(VC.Lng("OriginalPrice")..":", nil, 30, 70, VC.Color.Blue, TEXT_ALIGN_LEFT) draw.DrawText(symbol..VC.PreparePrice(Pnl.Sel_Mdl.Price), nil, 170, 70, VC.Color.White, TEXT_ALIGN_LEFT)  draw.DrawText(VC.Lng("RefundPercentage")..":", nil, 30, 85, VC.Color.Blue, TEXT_ALIGN_LEFT) draw.DrawText(VC.CD_RefundPrice.." %", nil, 170, 85, VC.Color.White, TEXT_ALIGN_LEFT)  draw.DrawText(VC.Lng("SellingPrice")..":", nil, 30, 100, VC.Color.Blue, TEXT_ALIGN_LEFT) draw.DrawText(symbol..VC.PreparePrice(Pnl.Sel_Mdl.Price*VC.CD_RefundPrice/100), nil, 170, 100, VC.Color.White, TEXT_ALIGN_LEFT)    if CurTime() >= C_Pnl.VC_FocusCheckTime and !C_Pnl:HasFocus() then C_Pnl:Remove() end  end  end   local Accept = vgui.Create("DButton", C_Pnl) Accept:SetText(VC.Lng("Accept")) Accept:SetFont("VC_Big_Italic") Accept:SetSize(C_Pnl:GetWide()/2-30, 50) Accept:SetPos(20, C_Pnl:GetTall()-Accept:GetTall()-15)  Accept.Paint = function(obj, Sx, Sy)  draw.RoundedBox(0, 0, 0, Sx, Sy, Color(0,255,0,255))  draw.RoundedBox(0, 0, 0, Sx, Sy, Color(255, 255, 255, 100))  end  local Cancel = vgui.Create("DButton", C_Pnl) Cancel:SetText(VC.Lng("Cancel")) Cancel:SetFont("VC_Big_Italic") Cancel:SetSize(C_Pnl:GetWide()/2-30,50) Cancel:SetPos(C_Pnl:GetWide()/2+10, C_Pnl:GetTall()-Cancel:GetTall()-15)  Cancel.Paint = function(obj, Sx, Sy)  draw.RoundedBox(0, 0, 0, Sx, Sy, VC.Color.Bad)  draw.RoundedBox(0, 0, 0, Sx, Sy, Color(255, 255, 255, 55))  end   Accept.DoClick = function()  if Pnl.Sel_Mdl then  local id = VC.CD.getName(Pnl.Sel_Mdl.Model, Pnl.Sel_Mdl.Name, Pnl.Sel_Mdl.DefaultSkin)  if !plytbl.Vehicles or !plytbl.Vehicles[id] then Pnl:Close() return end  VC.CD.Sell_Vehicle(NPC, id)  plytbl.Vehicles[id] = nil  VCPopup("Sold", "check", 1.5)  HorzResetAlpha() Pnl.VC_RefreshModelList = 2  C_Pnl:Close()  end  end   C_Pnl.Think = function()  local backDown = input.IsKeyDown(KEY_BACKSPACE) if backDown and !backPressed then Cancel.DoClick() backPressed = true elseif !backDown and backPressed then backPressed = false end  local enterDown = input.IsKeyDown(KEY_ENTER) if enterDown and !enterPressed then Accept.DoClick() enterPressed = true elseif !enterDown and enterPressed then enterPressed = false end  end  Cancel.DoClick = function() C_Pnl:Close() end  C_Pnl:MakePopup()  end  end   local text_purcase = VC.Lng("Purchase") local text_sell = VC.Lng("Sell")  BuySell.Paint = function(obj, Sx, Sy)  if !MainPanel.Price then return end local price = VC.PreparePrice(math.Round(MainPanel.Price, 3))  surface.SetMaterial(VC.Material.Button)  if BuySell.VC_Type == 1 then  surface.SetDrawColor(VC.Color.Good.r,VC.Color.Good.g,VC.Color.Good.b, obj:IsHovered() and 255 or 100)  surface.DrawTexturedRect(0,0, Sx, Sy)  draw.DrawText(text_purcase, obj:IsHovered() and "VC_Big_Italic" or "VC_Big", Sx/2, 8, Color(255,255,255,255), TEXT_ALIGN_CENTER)   if price == 0 then  surface.SetDrawColor(255,255,255,255) surface.SetMaterial(mat_free) surface.DrawTexturedRect(0, 0, 40, 40)  else  local text = symbol..price  surface.SetFont("VC_Dev_Text")  local sz = surface.GetTextSize(text or "")+20  surface.SetDrawColor(255,255,255,255) surface.SetMaterial(mat_price) surface.DrawTexturedRect(-25, Sy-20, 90, 20)  draw.RoundedBox(4, -sz+40, Sy-20, sz+5, 18, Color(217,54,0,255))  local tclr = table.Copy(VC.Color.White) draw.DrawText(text, "VC_Dev_Text", 35, Sy-19, tclr, TEXT_ALIGN_RIGHT)  end  elseif BuySell.VC_Type == 2 then  local text = symbol..price  surface.SetFont("VC_Dev_Text")  local sz = surface.GetTextSize(text or "")+20   surface.SetDrawColor(VC.Color.Neutral.r,VC.Color.Neutral.g,VC.Color.Neutral.b,obj:IsHovered() and 255 or 100)  surface.DrawTexturedRect(0,0, Sx, Sy)  draw.DrawText(text_sell, obj:IsHovered() and "VC_Big_Italic" or "VC_Big", Sx/2, 8, Color(255,255,255,255), TEXT_ALIGN_CENTER)   surface.SetDrawColor(255,255,255,255) surface.SetMaterial(mat_price) surface.DrawTexturedRect(-25, Sy-20, 90, 20)  draw.RoundedBox(4, -sz+40, Sy-20, sz+5, 18, Color(217,54,0,255))  local tclr = table.Copy(VC.Color.White) draw.DrawText(text, "VC_Dev_Text", 35, Sy-19, tclr, TEXT_ALIGN_RIGHT)  end  end   Spawn.DoClick = function()  if !Pnl.Sel_Mdl then return end  local ID = VC.CD.getName(Pnl.Sel_Mdl.Model, Pnl.Sel_Mdl.Name, Pnl.Sel_Mdl.DefaultSkin) local Settings = plytbl.Vehicles and plytbl.Vehicles[ID]  if !Settings then Settings = {} Settings.Color = cust_temp_color Settings.Skin = cust_temp_skin end  if Spawn.VC_Type == 1 then  if Pnl.Sel_Mdl then VC.CD.TestDrive(NPC, ID, Settings) Pnl.VC_RefreshModelList = 3 end  elseif Spawn.VC_Type == 2 then  if Pnl.Sel_Mdl then VC.CD.Spawn(NPC, ID, tbl, Settings, plytbl) Pnl.VC_RefreshModelList = 3 end  elseif Spawn.VC_Type == 3 then  VC.CD.EndTestDrive()  elseif Spawn.VC_Type == 4 then  VC.CD.Return(NPC, ID)  end  end   Spawn.Paint = function(obj, Sx, Sy)  surface.SetMaterial(VC.Material.Button)  if Spawn.VC_Type == 1 then  local tclr = table.Copy(VC.Color.Blue) surface.SetDrawColor(tclr.r, tclr.g, tclr.b, obj:IsHovered() and 255 or 100)  surface.DrawTexturedRect(0,0, Sx, Sy)  draw.DrawText(VC.Lng("TestDrive"), obj:IsHovered() and "VC_Big_Italic" or "VC_Big", Sx/2, 8, Color(255,255,255,255), TEXT_ALIGN_CENTER)  elseif Spawn.VC_Type == 2 then  surface.SetDrawColor(VC.Color.Blue.r,VC.Color.Blue.g,VC.Color.Blue.b, obj:IsHovered() and 255 or 100)  surface.DrawTexturedRect(0,0, Sx, Sy)  draw.DrawText(VC.Lng("Spawn"), obj:IsHovered() and "VC_Big_Italic" or "VC_Big", Sx/2, 8, Color(255,255,255,255), TEXT_ALIGN_CENTER)  elseif Spawn.VC_Type == 3 then  local tclr = table.Copy(VC.Color.White) surface.SetDrawColor(tclr.r, tclr.g, tclr.b, obj:IsHovered() and 255 or 100)  surface.DrawTexturedRect(0,0, Sx, Sy)  draw.DrawText(VC.Lng("EndTestDrive"), obj:IsHovered() and "VC_Big_Italic" or "VC_Big", Sx/2, 8, Color(255,255,255,255), TEXT_ALIGN_CENTER)  elseif Spawn.VC_Type == 4 then  local tclr = table.Copy(VC.Color.Bad) tclr.r = 255 tclr.g = tclr.r/2 surface.SetDrawColor(tclr.r, tclr.g, tclr.b, obj:IsHovered() and 255 or 100)  surface.DrawTexturedRect(0,0, Sx, Sy)  draw.DrawText(VC.Lng("Return"), obj:IsHovered() and "VC_Big_Italic" or "VC_Big", Sx/2, 8, Color(255,255,255,255), TEXT_ALIGN_CENTER)  end  end   local function GetTblID(k, dec) local ID, amount = 0, #Pnl.VC_VehicleList if dec then ID = k-1 if ID < 1 then ID = amount end else ID = k+1 if ID > amount then ID = 1 end end return ID end   local models = {} local tabPressed = nil local spacePressed = nil  Pnl.Think = function()    if Pnl:HasFocus() then  local tabDown = input.IsKeyDown(KEY_TAB) if tabDown and !tabPressed then if Pnl.Sel then if Pnl.Sel == 1 then Purchased.DoClick() elseif Pnl.Sel == 2 then Available.DoClick() elseif Pnl.Sel == 3 then Job.DoClick() else All.DoClick() end end tabPressed = true elseif !tabDown and tabPressed then tabPressed = false end  local spaceDown = input.IsKeyDown(KEY_SPACE) if spaceDown and !spacePressed then Spawn.DoClick() spacePressed = true elseif !spaceDown and spacePressed then spacePressed = false end  local enterDown = input.IsKeyDown(KEY_ENTER) if enterDown and !enterPressed then BuySell.DoClick() enterPressed = true elseif !enterDown and enterPressed then enterPressed = false end  local backDown = input.IsKeyDown(KEY_BACKSPACE) if backDown and !backPressed then Close.DoClick() backPressed = true elseif !backDown and backPressed then backPressed = false end  local leftDown = input.IsKeyDown(KEY_A) or input.IsKeyDown(KEY_LEFT) if leftDown then if Pnl.Sel_Mdl then ModelView.VC_LastSpeed = ModelView.VC_LastSpeed-10 end end  local rightDown = input.IsKeyDown(KEY_D) or input.IsKeyDown(KEY_RIGHT) if rightDown then if Pnl.Sel_Mdl then ModelView.VC_LastSpeed = ModelView.VC_LastSpeed+10 end end  local upDown = input.IsKeyDown(KEY_W) or input.IsKeyDown(KEY_UP) if upDown then if Pnl.Sel_Mdl then ModelView.VC_RotX=ModelView.VC_RotX-17 end end  local downDown = input.IsKeyDown(KEY_S) or input.IsKeyDown(KEY_DOWN) if downDown then if Pnl.Sel_Mdl then ModelView.VC_RotX = ModelView.VC_RotX+17 end end  end     if !ModelView.VC_LastSpeed then ModelView.VC_LastSpeed = 0 end   local Alpha = MainPanel:GetAlpha()  local ShouldDraw = Pnl.Sel_Mdl and ModelView.VC_Progress and ModelView.VC_Progress > -250 and ModelView.VC_Progress < 250 and (math.abs(ModelView.VC_LastSpeed) < 20 or ModelView.VC_IsCapturing)  if ShouldDraw and (Alpha == 0 or !MainPanel:IsVisible()) then  MainPanel:SetVisible(true) MainPanel:AlphaTo(255, 0.3, 0) local ID = VC.CD.getName(Pnl.Sel_Mdl.Model, Pnl.Sel_Mdl.Name, Pnl.Sel_Mdl.DefaultSkin)  BuySell.VC_Type = plytbl.Vehicles and plytbl.Vehicles[ID] and 2 or 1  Spawn.VC_Type = BuySell.VC_Type  if VC.CD.SpawnedTestDriveData then Spawn.VC_Type = 3 end  if plytbl.Vehicles and plytbl.Vehicles[ID] and plytbl.Vehicles[ID].Spawned then Spawn.VC_Type = 4 end   MainPanel.Price = Pnl.Sel_Mdl.Price  ChangeLeftData()  elseif Alpha == 255 and !ShouldDraw then  MainPanel:AlphaTo(0, 0.1, 0) ChangeLeftData()  end   if !ShouldDraw and Alpha == 0 then MainPanel:SetVisible(false) end   local Alpha = OptionsPanel:GetAlpha()  local ShouldDraw = Pnl.Sel_Mdl and OptionsPanel.Can and ModelView.VC_Progress and ModelView.VC_Progress > -100 and ModelView.VC_Progress < 100 and math.abs(ModelView.VC_LastSpeed) < 20 and !ModelView.VC_IsCapturing  if ShouldDraw and (Alpha == 0 or !OptionsPanel:IsVisible()) then  OptionsPanel:SetVisible(true) OptionsPanel:AlphaTo(255, 0.3, 0)  elseif Alpha == 255 and !ShouldDraw then OptionsPanel:AlphaTo(0, 0.1, 0)  end  if !ShouldDraw and Alpha == 0 then OptionsPanel:SetVisible(false) end   local Alpha = DataPanel:GetAlpha()  local ID = Pnl.Sel_Mdl and VC.CD.getName(Pnl.Sel_Mdl.Model, Pnl.Sel_Mdl.Name, Pnl.Sel_Mdl.DefaultSkin)  local ShouldDraw = ID and plytbl.Vehicles and plytbl.Vehicles[ID] and !plytbl.Vehicles[ID].Spawned and Pnl.Sel_Mdl and DataPanel and ModelView.VC_Progress and ModelView.VC_Progress > -100 and ModelView.VC_Progress < 100 and math.abs(ModelView.VC_LastSpeed) < 20 and !ModelView.VC_IsCapturing  if ShouldDraw and (Alpha == 0 or !DataPanel:IsVisible()) then  DataPanel:SetVisible(true) DataPanel:AlphaTo(255, 0.3, 0) local ID = VC.CD.getName(Pnl.Sel_Mdl.Model, Pnl.Sel_Mdl.Name, Pnl.Sel_Mdl.DefaultSkin)  elseif Alpha == 255 and !ShouldDraw then DataPanel:AlphaTo(0, 0.1, 0)  end   if VC.CD.Main_Pnl.Returned then  VC_RET = VC.CD.Main_Pnl.Returned  local symbol = VC.getCurCurrency().symbol  if VC.CD.Main_Pnl.Returned[2] == 0 then VCPopup("VehicleReturned", "check") else VCPopup(VC.Lng("VehicleTowedFor").." "..symbol..VC.PreparePrice(VC.CD.Main_Pnl.Returned[2])..".", "info", 4) end  if plytbl.Vehicles and plytbl.Vehicles[VC.CD.Main_Pnl.Returned[1]] then plytbl.Vehicles[VC.CD.Main_Pnl.Returned[1]] = VC.CD.Main_Pnl.Returned[3] plytbl.Vehicles[VC.CD.Main_Pnl.Returned[1]].Spawned = nil if VC.CD.getName(Pnl.Sel_Mdl.Model, Pnl.Sel_Mdl.Name, Pnl.Sel_Mdl.DefaultSkin) == VC.CD.Main_Pnl.Returned[1] then VC.CD.Main_Pnl.VC_RefreshModelList = 3 end end  VC.CD.Main_Pnl.Returned = nil  ChangeLeftData()  end   Pnl.FrameRate = VGUIFrameTime()- (Pnl.FrameTime or 0) Pnl.FrameTime = VGUIFrameTime()  if Pnl.VC_RefreshModelList then   Pnl.VC_VehicleList = {}  if Pnl.Sel == 1 then  for k,v in pairs(tbl.Vehicles) do table.insert(Pnl.VC_VehicleList, v) end  elseif Pnl.Sel == 2 then  if plytbl and plytbl.Vehicles then for k,v in pairs(plytbl.Vehicles) do if tbl.Vehicles[k] then table.insert(Pnl.VC_VehicleList, tbl.Vehicles[k]) end end end  elseif Pnl.Sel == 3 then  for k,v in pairs(tbl.Vehicles) do local can = true if plytbl and plytbl.Vehicles and plytbl.Vehicles[k] then can = false end if can then table.insert(Pnl.VC_VehicleList, v) end end  elseif Pnl.Sel == 4 then  if tbl.JobRestrict then  local JobName = LocalPlayer().getJobTable and LocalPlayer():getJobTable() and LocalPlayer():getJobTable().name or "Unknown"  for k,v in pairs(tbl.Vehicles) do  local can = true   if !v.JobRestrict[JobName] then can = false end   if can then table.insert(Pnl.VC_VehicleList, v) end  end  end  end   local ttbl = {} for k, v in pairs(Pnl.VC_VehicleList) do ttbl[k] = (v.Name or "Unknown").."__vc__"..k end table.sort(ttbl)  local ttsbl2 = {} for k,v in pairs(ttbl) do local num = tonumber(string.Explode("__vc__", v)[2]) ttsbl2[k] = Pnl.VC_VehicleList[num]end  Pnl.VC_VehicleList = table.Copy(ttsbl2)   if Pnl.VC_RefreshModelList == 3 then MainPanel:AlphaTo(0, 0.1, 0) Pnl.VC_RefreshModelList = nil return end   local oldmdl = Pnl.Sel_Mdl and table.Copy(Pnl.Sel_Mdl) or {} local oldclr = nil local oldskin = nil local oldbgrps = nil local LProgress, LSpeed = ModelView.VC_Progress, ModelView.VC_LastSpeed  if IsValid(ModelView:GetEntity()) then oldclr = ModelView:GetColor() oldskin = ModelView:GetEntity():GetSkin() oldbgrps = "" if oldbgrps == "" then oldbgrps = oldbgrps.."0" for k,v in pairs(ModelView:GetEntity():GetBodyGroups()) do oldbgrps = oldbgrps..ModelView:GetEntity():GetBodygroup(k) end end end   local mat_lock = Material("icon16/lock.png")  ModelView:SetModel("") ModelView.ModelLength = 0 Pnl.Sel_Mdl = nil ModelView.VC_Progress = 350 ModelView.VC_LastSpeed = 25   for k,v in pairs(models) do if IsValid(v[1]) then v[1]:Remove() end end models = {} local LastOffset = Horz.OffsetX  for k,v in pairs(Pnl.VC_VehicleList) do  local mdl = vgui.Create("DModelPanel", Pnl) mdl:SetModel(v.Model or "")  if IsValid(mdl:GetEntity()) then  mdl.ModelLength = mdl:GetEntity():GetRenderBounds():Length()*1.5-200 mdl:SetLookAng(Vector(0, 0, 62)) mdl:SetSize(250, 150)  function mdl:LayoutEntity() mdl:SetLookAng(Angle(0, 180, 0)) mdl:SetCamPos(Vector(mdl:IsHovered() and 250 or 280, 0,60)-Angle(0, 180, 0):Forward()*mdl.ModelLength) return end  mdl.DoClick = function() if Pnl.Sel_Mdl then ModelView.VC_ToSelect = k ModelView.VC_Progress = 0 ModelView.VC_LastSpeed = SwitchSpeed*math.Clamp(k-Pnl.Sel_Mdl.ID, -1, 1) MainPanel:AlphaTo(0, 0.1, 0) else Pnl.DoSelect(k,v) end end  mdl.DoDoubleClick = function() Pnl.DoSelect(k,v) ModelView.VC_Progress = 0 ModelView.VC_LastSpeed = 0 end   local ID = VC.CD.getName(v.Model, v.Name, v.DefaultSkin) local Restr = VC.isPlayerRestricted(LocalPlayer(), v, tbl, true)   if v.BGroups then mdl:GetEntity():SetBodyGroups(v.BGroups) end mdl:GetEntity():SetSkin(v.DefaultSkin or 0)   mdl.PaintOver = function(obj, Sx, Sy)  local tclr = table.Copy(clr)  local sel = Pnl.Sel_Mdl and Pnl.Sel_Mdl.Name == v.Name and (Pnl.Sel_Mdl.DefaultSkin or 0) == (v.DefaultSkin or 0) and Pnl.Sel_Mdl.Model == v.Model   draw.RoundedBox(0, 0, 0, Sx, 25, clr)   if !mdl:IsHovered() and !(mdl:IsHovered() or sel) then draw.RoundedBox(0, 0, 0, Sx, Sy, Color(0,0,0,200)) end  if mdl:IsDown() then draw.RoundedBox(0, 0, 0, Sx, Sy, Color(0,100,100,55)) end  draw.DrawText(v.Name, nil, Sx/2,7, table.Copy(VC.Color.White), TEXT_ALIGN_CENTER)   local pos = 0  if mdl:IsHovered() then tclr = table.Copy(VC.Color.Blue) surface.SetDrawColor(tclr) surface.DrawLine(pos, 0, pos+Sx-1, 0) surface.DrawLine(pos, Sy-1, pos+Sx-1, Sy-1) surface.DrawLine(pos, 0, pos, Sy-1) surface.DrawLine(pos+Sx-1, 0, pos+Sx-1, Sy-1) end  if sel then tclr = table.Copy(VC.Color.Good) pos = -ModelView.VC_Progress/3 surface.SetDrawColor(tclr) surface.DrawLine(pos, 0, pos+Sx-1, 0) surface.DrawLine(pos, Sy-1, pos+Sx-1, Sy-1) surface.DrawLine(pos, 0, pos, Sy-1) surface.DrawLine(pos+Sx-1, 0, pos+Sx-1, Sy-1) end  local alpha = (mdl:IsHovered() or sel) and 255 or 55   if v.Price == 0 then  surface.SetDrawColor(255,255,255,(mdl:IsHovered() or sel) and 255 or 30) surface.SetMaterial(mat_free) surface.DrawTexturedRect(0, 0, 80, 80)  else  local text = symbol..VC.PreparePrice(v.Price)  surface.SetFont("VC_Dev_Text")  local sz = math.Round(surface.GetTextSize(text or "")+20)  draw.RoundedBox(4, math.Round(Sx-sz+5), Sy-20, sz-10, 18, Color(217,54,0,alpha))  local tclr = table.Copy(VC.Color.White) tclr.a = alpha draw.DrawText(text, "VC_Dev_Text", Sx-10, Sy-19, tclr, TEXT_ALIGN_RIGHT)  end   surface.SetDrawColor(255,255,255,alpha)   if Restr then surface.SetDrawColor(255,255,255,255) surface.SetMaterial(mat_lock) surface.DrawTexturedRect(5, 5, 15, 15) end   if plytbl.Vehicles and plytbl.Vehicles[ID] then surface.SetMaterial(VC.Material.Check) surface.DrawTexturedRect(Sx-30, 0, 30, 30) end   if Pnl.Sel_Mdl and Pnl.Sel_Mdl.ID != k and Pnl.Sel_Mdl.ID == GetTblID(k) then tclr = table.Copy(VC.Color.Good) pos = -ModelView.VC_Progress/3+mdl:GetWide()+1 surface.SetDrawColor(tclr) surface.DrawLine(pos, 0, pos+Sx-1, 0) surface.DrawLine(pos, Sy-1, pos+Sx-1, Sy-1) surface.DrawLine(pos, 0, pos, Sy-1) surface.DrawLine(pos+Sx-1, 0, pos+Sx-1, Sy-1) end  if Pnl.Sel_Mdl and Pnl.Sel_Mdl.ID != k and Pnl.Sel_Mdl.ID == GetTblID(k, true) then tclr = table.Copy(VC.Color.Good) pos = -ModelView.VC_Progress/3-mdl:GetWide()-1 surface.SetDrawColor(tclr) surface.DrawLine(pos, 0, pos+Sx-1, 0) surface.DrawLine(pos, Sy-1, pos+Sx-1, Sy-1) surface.DrawLine(pos, 0, pos, Sy-1) surface.DrawLine(pos+Sx-1, 0, pos+Sx-1, Sy-1) end  end  Horz:AddPanel(mdl)  table.insert(models, {mdl, ID})  end  end  Horz.OffsetX = LastOffset Horz.pnlCanvas.x = -Horz.OffsetX  local ran = false if oldmdl then for k,v in pairs(Pnl.VC_VehicleList) do if (v.Name or "Unknown") == (oldmdl.Name or "Unknown") and v.Model == oldmdl.Model and (v.DefaultSkin or 0) == (oldmdl.DefaultSkin or 0) then ModelView.VC_Progress = LProgress ModelView.VC_LastSpeed = LSpeed if Pnl.VC_RefreshModelList == 2 then MainPanel:AlphaTo(0, 0.1, 0) end ran = true Pnl.DoSelect(k, v) if oldclr then ModelView:SetColor(oldclr) ModelView:GetEntity():SetSkin(oldskin) ModelView:GetEntity():SetBodyGroups(oldbgrps) end break end end end  if !ran and #Pnl.VC_VehicleList > 0 then Pnl.DoSelect(1,Pnl.VC_VehicleList[1]) end  Pnl.VC_RefreshModelList = nil ModelView.RefreshCustomisation = true ModelView.RefreshLeftData = true  end   if ModelView.RefreshCustomisation then  for k,v in pairs(models) do  if plytbl.Vehicles and plytbl.Vehicles[v[2]] then  if !tbl.DD_Clr and !tbl.Vehicles[v[2]].DD_Clr then v[1]:SetColor(plytbl.Vehicles[v[2]].Color or Color(255,255,255,255)) end  if !tbl.DD_Skin and !tbl.Vehicles[v[2]].DD_Skin then v[1]:GetEntity():SetSkin(plytbl.Vehicles[v[2]].Skin or tbl.Vehicles[v[2]].DefaultSkin or 0) end  if !tbl.DD_BGrp and !tbl.Vehicles[v[2]].DD_BGrp then if plytbl.Vehicles[v[2]].BGroups then for k2,v2 in pairs(plytbl.Vehicles[v[2]].BGroups) do v[1]:GetEntity():SetBodygroup(k2,v2) end elseif tbl.Vehicles[v[2]].BGroups then v[1]:GetEntity():SetBodyGroups(tbl.Vehicles[v[2]].BGroups) end end  end  end  ModelView.RefreshCustomisation = nil  end   if ModelView.RefreshLeftData then ModelView.RefreshLeftData = nil end  end  Pnl:MakePopup() end  function VC.CD.open_menu_main(NPC, tbl, plytbl, int) if !IsValid(VC.CD.Main_Pnl) then if !NPC.VC_LoadingMsg then VCPopup("CD_Loading", "info", 0.5) timer.Simple(0.1, function() DoMainMenu(NPC, tbl, plytbl, int) end) NPC.VC_LoadingMsg = true else DoMainMenu(NPC, tbl, plytbl, int) end end end function VC.CD.Buy_Vehicle(NPC, ID, settings) net.Start("VC_CD_Buy_Vehicle") net.WriteEntity(NPC) net.WriteString(ID) net.WriteTable(settings) net.SendToServer() end function VC.CD.Sell_Vehicle(NPC, ID) net.Start("VC_CD_Sell_Vehicle") net.WriteEntity(NPC) net.WriteString(ID) net.SendToServer() end function VC.CD.TestDrive(NPC, ID, settings) net.Start("VC_CD_StartTestDrive") net.WriteEntity(NPC) net.WriteString(ID) net.WriteTable(settings) net.SendToServer() end function VC.CD.EndTestDrive(nosend) VCPopup("TestDriveEnded") VC.CD.SpawnedTestDriveData = nil if VC.CD.Main_Pnl and VC.CD.Main_Pnl:IsVisible() then VC.CD.Main_Pnl.VC_RefreshModelList = 3 end if !nosend then net.Start("VC_CD_EndTestDrive") net.SendToServer() end end function VC.CD.Spawn(NPC, ID, tbl, settings, plytbl)  if plytbl.Vehicles and plytbl.Vehicles[ID] and !plytbl.Vehicles[ID].Spawned then    if tbl and tbl.Platforms then  local pos, ang = VC.CD.GetSpawnPosAng(LocalPlayer(), tbl, NPC)  if !pos or !ang then VCPopup("ParkingLotsTaken", "cross") return end  plytbl.Vehicles[ID].Spawned = true  net.Start("VC_CD_Spawn_Vehicle") net.WriteEntity(NPC) net.WriteString(ID) net.WriteTable(settings) net.SendToServer()  end  else  VCPopup("Error spawning.", "cross")  end end  function VC.CD.Return(NPC, ID) net.Start("VC_CD_Return_Vehicle") net.WriteEntity(NPC) net.WriteString(ID) net.SendToServer() end  function VC.CD.open_menu_choice(ent, tbl, plytbl, int)  if !int then int = VC.CD.LastInt end if VC.CD.EditPlatorms and IsValid(VC.CD.EditPlatorms[1]) then VCPopup("Close platform editing menu first.", "cross") return end  if !int then int = VC.CD.LastInt end if VC.CD.EditVehicles and IsValid(VC.CD.EditVehicles[1]) then VCPopup("Close vehicle editing menu first.", "cross") return end  local Pnl = vgui.Create("DFrame") Pnl:SetSize(400, 200) Pnl:SetTitle("") Pnl:SetPos(ScrW()/2-Pnl:GetWide()/2,ScrH()/2-Pnl:GetTall()/2) Pnl:SetDraggable(false) Pnl:ShowCloseButton(false) Pnl:AlphaTo(0, 0, 0) Pnl:AlphaTo(255, 0.2, 0)  Pnl.Paint = function(obj, Sx, Sy) draw.RoundedBox(0, 0, 0, Sx, Sy, VC.Color.Main) draw.DrawText("This menu is only visible to administrators.", "VC_Dev_Text", 10, 10, VC.Color.White, TEXT_ALIGN_LEFT) end   local CarDealer = vgui.Create("VC_Button", Pnl) CarDealer:SetColor(VC.Color.Btn_Add) CarDealer:SetText("Dealer's menu") CarDealer:SetFont("VC_Big_Italic") CarDealer:SetSize(Pnl:GetWide()/2-30,Pnl:GetTall()-55) CarDealer:SetPos(20, 35)  local CarDealer_Edit = vgui.Create("VC_Button", Pnl) CarDealer_Edit:SetColor(VC.Color.Btn_Chng) CarDealer_Edit:SetText("Edit menu") CarDealer_Edit:SetFont("VC_Big_Italic") CarDealer_Edit:SetSize(Pnl:GetWide()/2-30,Pnl:GetTall()-55) CarDealer_Edit:SetPos(Pnl:GetWide()/2+10, 35)   CarDealer.DoClick = function() VC.CD.open_menu_main(ent, tbl, plytbl, int) Pnl:Close() end  CarDealer_Edit.DoClick = function() VC.CD.LastTbl = tbl or table.Copy(VC.CD.Default) VC.CD.LastInt = int if IsValid(ent) then VC.CD.LastNPC = ent VC.CD.open_menu_cardealer_edit(ent) end Pnl:Close() end  Pnl:MakePopup() end  function VC.CD.open_menu_cardealer_edit(ent)  if IsValid(VC.CD_Edit_Panel) then VC.CD_Edit_Panel:Close() VC.CD_Edit_Panel = nil end   if !IsValid(ent) then VCPopup("ERROR: missing car dealer entity!", "cross") return end   local Pnl = vgui.Create("DFrame") VC.CD_Edit_Panel = Pnl Pnl:SetSize(600, 320) Pnl:SetTitle("") Pnl:SetPos(ScrW()/2-Pnl:GetWide()/2,ScrH()/2-Pnl:GetTall()/2) Pnl:ShowCloseButton(false) Pnl:AlphaTo(0, 0, 0) Pnl:AlphaTo(255, 0.2, 0)  VC.CD.LastTbl.Pos = ent:GetPos() VC.CD.LastTbl.Ang = ent:GetAngles() VC.CD.LastTbl.Model = ent:GetModel()  Pnl.Paint = function(obj, Sx, Sy)  draw.RoundedBox(0, 0, 0, Sx, Sy, VC.Color.Main)  draw.RoundedBox(0, 0, 0, Sx, 25, VC.Color.Main)  draw.DrawText('VCMod Car Dealer Editor. Created: '..VC.time_elapsed_string(ent:GetNWInt("VC_Int", 0))..'.', "VC_Dev_Text", 7, 5, VC.Color.Blue, TEXT_ALIGN_LEFT)   draw.RoundedBox(0, 10, 30, 155, 255, VC.Color.Main)  draw.RoundedBox(0, 170, 30, 420, 30, VC.Color.Main)  draw.RoundedBox(0, 170, 65, 420, 60, VC.Color.Main)   draw.DrawText("Name:", "VC_Dev_Text", 15, 40, VC.Color.White, TEXT_ALIGN_LEFT)  draw.DrawText("Model:", "VC_Dev_Text", 15, 215, VC.Color.White, TEXT_ALIGN_LEFT)  draw.DrawText("Pos: "..math.Round(VC.CD.LastTbl.Pos.x)..", "..math.Round(VC.CD.LastTbl.Pos.y)..", "..math.Round(VC.CD.LastTbl.Pos.z), "VC_Dev_Text", 15, 235, VC.Color.White, TEXT_ALIGN_LEFT)  draw.DrawText("Ang: "..math.Round(VC.CD.LastTbl.Ang.p)..", "..math.Round(VC.CD.LastTbl.Ang.y)..", "..math.Round(VC.CD.LastTbl.Ang.r), "VC_Dev_Text", 15, 255, VC.Color.White, TEXT_ALIGN_LEFT)  end   local delete = vgui.Create("VC_Button", Pnl) delete:SetToolTip("Delete the car dealer from the server and all the data files.") delete:SetText("Delete this car dealer") delete:SetSize(Pnl:GetWide()-20,20) delete:SetPos(10, Pnl:GetTall()-delete:GetTall()-10) delete:SetColor(VC.Color.Btn_Rem) delete:SetTextIsWhite(true)  delete.DoClick = function() net.Start("VC_CD_Delete") net.WriteEntity(ent) net.SendToServer() Pnl:Close() VC.CD.MM_Refresh = true end   local done = vgui.Create("DImageButton", Pnl) done:SetMaterial(VC.Material.icon_check) done:SetToolTip("Close menu and save settings.") done:SetSize(20+15,20) done:SetPos(Pnl:GetWide()-done:GetWide()-2-15, 2)  done.DoClick = function() net.Start("VC_CD_DoneEditting") net.WriteEntity(ent) net.WriteTable(VC.CD.LastTbl) net.WriteInt(VC.CD.LastInt, 8) net.WriteInt(1, 8) net.SendToServer() Pnl:Close() VC.CD.MM_Refresh = true end   local cancel = vgui.Create("DImageButton", Pnl) cancel:SetMaterial(VC.Material.icon_cross) cancel:SetToolTip("Discard all settings and close.") cancel:SetSize(20,20) cancel:SetPos(Pnl:GetWide()-cancel:GetWide()-24-45, 2)  cancel.DoClick = function() Pnl:Close() VC.CD.MM_Refresh = true end   local opt = vgui.Create("DImageButton", Pnl) opt:SetMaterial(VC.Material.icon_paste) opt:SetToolTip("Import from other car dealers.") opt:SetSize(20,20) opt:SetPos(Pnl:GetWide()-65-60, 2)  opt.DoClick = function() net.Start("VC_CD_ImportGetList") net.SendToServer() end   local el_mdl = vgui.Create("DModelPanel", Pnl) el_mdl:SetModel(VC.CD.LastTbl.Model) el_mdl:SetCamPos(Vector(20,0,62)) el_mdl:SetLookAt(Vector(0, 0, 62)) el_mdl:SetSize(150, 150) el_mdl:SetPos(10, 50) function el_mdl:LayoutEntity() el_mdl:SetLookAt(Vector(0, math.sin(CurTime()*2), 62)) return end  local el_name = vgui.Create("DTextEntry", Pnl) el_name:SetTall(20) el_name:SetWide(100) el_name:SetToolTip("Car dealer's name.") el_name:SetValue(VC.CD.LastTbl.Name) el_name:SetPos(60, 35) el_name.OnTextChanged = function() local val = el_name:GetValue() VC.CD.LastTbl.Name = val end  local el_mdlname = vgui.Create("DTextEntry", Pnl) el_mdlname:SetTall(20) el_mdlname:SetWide(100) el_mdlname:SetToolTip("Car dealer's model. Enter it manually here or click on the image.") el_mdlname:SetValue(VC.CD.LastTbl.Model) el_mdlname:SetPos(60, 210)  el_mdlname.OnTextChanged = function() local val = el_mdlname:GetValue() VC.CD.LastTbl.Model = val el_mdl:SetModel(val) end   local function SetModel(mdl)  el_mdlname:SetValue(mdl) el_mdl:GetEntity():SetModel(mdl) el_mdlname.OnTextChanged()  local iSeq = el_mdl:GetEntity():LookupSequence("walk_all")  if iSeq <= 0 then iSeq = el_mdl:GetEntity():LookupSequence("WalkUnarmed_all") end  if iSeq <= 0 then iSeq = el_mdl:GetEntity():LookupSequence("walk_all_moderate") end  if iSeq > 0 then el_mdl:GetEntity():ResetSequence(iSeq) end  end    el_mdl.DoClick = function()  local DDM = VC.DermaMenu("Model")  DDM:AddButton("Mossman", function() SetModel("models/mossman.mdl") end)  DDM:AddButton("Barney", function() SetModel("models/Barney.mdl") end)  DDM:AddButton("Breen", function() SetModel("models/breen.mdl") end)  DDM:AddButton("Eli", function() SetModel("models/Eli.mdl") end)  DDM:AddButton("GMan", function() SetModel("models/gman_high.mdl") end)  DDM:AddButton("Kleiner", function() SetModel("models/Kleiner.mdl") end)  DDM:AddButton("Father Grigory", function() SetModel("models/monk.mdl") end)  DDM:AddButton("Vortigaunt", function() SetModel("models/vortigaunt.mdl") end)  DDM:AddButton("Police", function() SetModel("models/Police.mdl") end)  DDM:AddButton("Zombie", function() SetModel("models/Zombie/Classic.mdl") end)  DDM:Open()  end   local El_List1 = VC.Add_El_List(175,35,410,120, 2) El_List1:SetParent(Pnl)   local MPnl = VC.Add_El_Panel(El_List1, {0.4,0.6}, 25, true)  local PlatformLable = vgui.Create("DLabel") PlatformLable:SetTextColor(VC.Color.White) PlatformLable:SetFont("VC_Dev_Text") MPnl[1]:AddItem(PlatformLable)  local EditPlatform = vgui.Create("VC_Button", Pnl) EditPlatform:SetToolTip("Allows you to edit this NPC's spawn platforms.") EditPlatform:SetText("Manage") EditPlatform:SetSize(Pnl:GetWide()-20,20) MPnl[2]:AddItem(EditPlatform)  EditPlatform:SetColor(Color(100,155,255,255)) EditPlatform:SetTextIsWhite(true) EditPlatform.DoClick = function() Pnl:Close() StartEditPlatforms(ent) end   local El_List1 = VC.Add_El_List(175,72,410,120, 2) El_List1:SetParent(Pnl)  local MPnl = VC.Add_El_Panel(El_List1, {0.4,0.6}, 25, true)  local VehiclesLable = vgui.Create("DLabel") VehiclesLable:SetText("Vehicles: "..table.Count(VC.CD.LastTbl.Vehicles)) VehiclesLable:SetTextColor(VC.Color.White) VehiclesLable:SetFont("VC_Dev_Text") MPnl[1]:AddItem(VehiclesLable)  local EditVehicles = vgui.Create("VC_Button", Pnl) EditVehicles:SetToolTip("Allows you to edit this NPC's vehicles.") EditVehicles:SetText("Manage") EditVehicles:SetSize(Pnl:GetWide()-20,20) MPnl[2]:AddItem(EditVehicles)  EditVehicles:SetColor(VC.Color.White) EditVehicles:SetTextIsWhite(true) EditVehicles.DoClick = function() Pnl:Close() StartEditVehicles(ent) end   local Veh_ARB = vgui.Create("VC_ARB") Veh_ARB:SetTall(20) El_List1:AddItem(Veh_ARB) Veh_ARB.RemoveButton = 3  Veh_ARB.VC_BTbl = {  {name = "Add", tooltip = "Add a new vehicle.", clk = function()  local DDM = nil local cat = {} local cattest = {}  for k,v in pairs(list.Get("Vehicles")) do local tc = v.Category or "Unknown" if !cattest[tc] then cattest[tc] = {} end table.insert(cattest[tc], v) end  for k,v in SortedPairs(cattest) do  local tempn = {} for k2,v2 in pairs(v) do tempn[v2.Name or "Unknown"] = v2 end  for k2,v2 in SortedPairs(tempn) do  if !VC.CD.LastTbl.Vehicles[VC.CD.getName(v2.Model, v2.Name, v2.DefaultSkin)] and v2.Class and VC.classIsSupported(string.lower(v2.Class)) then  if !DDM then DDM = VC.DermaMenu("Add vehicle") end if !cat[k] then cat[k] = DDM:VC_AddSubMenu(k) end  cat[k]:AddButton(v2.Name or "Unknown", function() VC.CD.open_menu_addcar(ent, nil, v2) Pnl:Close() end)  end  end  end  if DDM then DDM:Open() end  end},  {name = "Change", tooltip = "Change the current vehicles.", clk = function()  local DDM = nil local cat = {} local cattest = {}  for k,v in pairs(VC.CD.LastTbl.Vehicles) do local tc = v.Category or "Unknown" if !cattest[tc] then cattest[tc] = {} end table.insert(cattest[tc], v) end  for k,v in SortedPairs(cattest) do  local tempn = {} for k2,v2 in pairs(v) do tempn[v2.Name or "Unknown"] = v2 end  for k2,v2 in SortedPairs(tempn) do  if !DDM then DDM = VC.DermaMenu("Change vehicle") end if !cat[k] then cat[k] = DDM:VC_AddSubMenu(k) end  v2.KeyValues = {vehiclescript = v2.Handling} cat[v2.Category]:AddButton((v2.Name or "Unknown")..", skin "..((v2.DefaultSkin or 0)+1), function() VC.CD.open_menu_addcar(ent, nil, v2) Pnl:Close() end)  end  end  if DDM then DDM:Open() end  end},  {name = "Remove", tooltip = "Remove vehicle.", clk = function()  local DDM = nil local cat = {} local cattest = {}  for k,v in pairs(VC.CD.LastTbl.Vehicles) do local tc = v.Category or "Unknown" if !cattest[tc] then cattest[tc] = {} end table.insert(cattest[tc], v) end  for k,v in SortedPairs(cattest) do  local tempn = {} for k2,v2 in pairs(v) do tempn[v2.Name or "Unknown"] = v2 end  for k2,v2 in SortedPairs(tempn) do  if !DDM then DDM = VC.DermaMenu("Remove vehicle") end if !cat[k] then cat[k] = DDM:VC_AddSubMenu(k) end  cat[v2.Category]:AddButton((v2.Name or "Unknown")..", skin "..((v2.DefaultSkin or 0)+1), function() net.Start("VC_CD_DeleteVehicle") net.WriteEntity(ent) net.WriteString(VC.CD.getName(v2.Model, v2.Name, v2.DefaultSkin)) net.SendToServer() end)  end  end  if DDM then DDM:Open() end  end}  }   local El_List1 = VC.Add_El_List(175,135,210,48) El_List1:SetParent(Pnl) El_List1:NoClipping(true) El_List1.Paint = function(obj, Sx, Sy) draw.RoundedBox(0, -5, -5, Sx+10, Sy+10, VC.Color.Main) end   local el_colour = VC.Add_El_Checkbox("Allow to customise colour", "Allows the vehicles to be customised.") El_List1:AddItem(el_colour) el_colour.OnChange = function(idx, val) VC.CD.LastTbl.DD_Clr = !val end  local el_skin = VC.Add_El_Checkbox("Allow to customise skin (paintjob)", "Allows the vehicles to be customised.") El_List1:AddItem(el_skin) el_skin.OnChange = function(idx, val) VC.CD.LastTbl.DD_Skin = !val end  local el_bgroup = VC.Add_El_Checkbox("Allow to customise bodygroups", "Allows the vehicles to be customised.") El_List1:AddItem(el_bgroup) el_bgroup.OnChange = function(idx, val) VC.CD.LastTbl.DD_BGrp = !val end   local El_List1 = VC.Add_El_List(175,198,210,82) El_List1:SetParent(Pnl) El_List1:NoClipping(true) El_List1.Paint = function(obj, Sx, Sy) draw.RoundedBox(0, -5, -5, Sx+10, Sy+10, VC.Color.Main) end     if !VC.CD.LastTbl.RankRestrict then VC.CD.LastTbl.RankRestrict = {} end  local ResE2L = {}     for k,v in pairs(VC.getRanks()) do  local el = VC.Add_El_Checkbox(v, "This rank is allowed to use this car delaer.")  El_List1:AddItem(el)  el.OnChange = function(idx, val) VC.CD.LastTbl.RankRestrict[k] = !val end  ResE2L[k] = el  end             local ResElL = {} if RPExtraTeams then  if !VC.CD.LastTbl.JobRestrict then VC.CD.LastTbl.JobRestrict = {} end  local El_List1 = VC.Add_El_List(400,135,185,145) El_List1:SetParent(Pnl) El_List1:NoClipping(true) El_List1.Paint = function(obj, Sx, Sy) draw.RoundedBox(0, -5, -5, Sx+10, Sy+10, VC.Color.Main) end  for k,v in pairs(RPExtraTeams) do local nm = v.name or "Unknown" ResElL[nm] = VC.Add_El_Checkbox(nm, "This job is allowed to use this car dealer.") El_List1:AddItem(ResElL[nm]) ResElL[nm].OnChange = function(idx, val) VC.CD.LastTbl.JobRestrict[nm] = !val end end  end   local function RefreshInfo()  local tmdl = VC.CD.LastTbl.Model el_mdlname:SetValue(tmdl) SetModel(tmdl) el_mdlname.OnTextChanged()  el_name:SetValue(VC.CD.LastTbl.Name)   el_colour:SetValue(VC.CD.LastTbl.DD_Clr and 0 or 1)  el_skin:SetValue(VC.CD.LastTbl.DD_Skin and 0 or 1)  el_bgroup:SetValue(VC.CD.LastTbl.DD_BGrp and 0 or 1)   if !VC.CD.LastTbl.RankRestrict then VC.CD.LastTbl.RankRestrict = {} end  for k,v in pairs(VC.getRanks()) do if ResE2L[k] then ResE2L[k]:SetValue(!VC.CD.LastTbl.RankRestrict[k]) end end     if RPExtraTeams then  if !VC.CD.LastTbl.JobRestrict then VC.CD.LastTbl.JobRestrict = {} end  for k,v in pairs(RPExtraTeams) do local nm = v.name or "Unknown" if ResElL[nm] then ResElL[nm]:SetValue(!VC.CD.LastTbl.JobRestrict[nm]) end end  end   local count = VC.CD.LastTbl.Platforms and #VC.CD.LastTbl.Platforms or 0  PlatformLable:SetText("Spawn platforms: "..count)  end   RefreshInfo()   Pnl.Think = function()  if VC.CD.Import then  if !VC.CD.LastTbl then VC.CD.LastTbl = {} end  if VC.CD.Import.Platforms then VC.CD.LastTbl.Platforms = table.Copy(VC.CD.Import.Platforms) end  if VC.CD.Import.Vehicles then VC.CD.LastTbl.Vehicles = table.Copy(VC.CD.Import.Vehicles) end  if VC.CD.Import.Name then VC.CD.LastTbl.Name = VC.CD.Import.Name end  if VC.CD.Import.Model then VC.CD.LastTbl.Model = VC.CD.Import.Model end  if VC.CD.Import.Model then VC.CD.LastTbl.Model = VC.CD.Import.Model end  if VC.CD.Import.DD_Clr then VC.CD.LastTbl.DD_Clr = VC.CD.Import.DD_Clr end  if VC.CD.Import.DD_Skin then VC.CD.LastTbl.DD_Skin = VC.CD.Import.DD_Skin end  if VC.CD.Import.DD_BGrp then VC.CD.LastTbl.DD_BGrp = VC.CD.Import.DD_BGrp end  if VC.CD.Import.RankRestrict then VC.CD.LastTbl.RankRestrict = VC.CD.Import.RankRestrict end  if VC.CD.Import.JobRestrict then VC.CD.LastTbl.JobRestrict = VC.CD.Import.JobRestrict end    RefreshInfo()   VC.CD.RefreshVehicles = true  VC.CD.Import = nil   VCPopup("Done", "check")  end   if VC.CD.RefreshVehicles then VehiclesLable:SetText("Vehicles: "..table.Count(VC.CD.LastTbl.Vehicles)) VC.CD.RefreshVehicles = nil end  end  Pnl:MakePopup() end  function VC.CD.DrawInfo(ent, text, key, textDist)  if !ent.VC_PVsb then ent.VC_Color = VC.Color.White ent.VC_PVsb = util.GetPixelVisibleHandle() end  local BInd = ent:LookupBone("ValveBiped.Bip01_Head1")  local pos = Vector(0,0,0) if BInd then local BonePos , BoneAng = ent:GetBonePosition(ent:LookupBone("ValveBiped.Bip01_Head1")) pos = BonePos+Vector(0,0,8) else pos=ent:GetPos()+Vector(0,0,65) end  local Vis = util.PixelVisible(pos+Vector(0,0,5), 1, ent.VC_PVsb)   local Dist = nil if Vis > 0 then Dist = VC.GetViewPos():Distance(pos) end   local on = Vis > 0 and Dist < textDist  local anim = VC.UI_AnimData("CD_"..key, on, 0.05, 0.02)   if anim and ent.VC_LastPos_X and ent.VC_LastPos_Y then  surface.SetFont("VC_Name") local tz = surface.GetTextSize(text or "")  local Sx = math.Round(ent.VC_LastPos_X+(anim-1)*50) local Sy = math.Round(ent.VC_LastPos_Y-25) local PSx, PSy = tz, 50  local clr = table.Copy(VC.Color.Main) clr.a=clr.a*anim draw.RoundedBox(0, math.Round(Sx-PSx/2)+1, Sy, PSx, PSy, clr)  surface.SetMaterial(VC.Material.Fade) surface.DrawTexturedRectRotated(math.Round(Sx+VC.FadeW/2+PSx/2+1), Sy+PSy/2, VC.FadeW, PSy, 0) surface.DrawTexturedRectRotated(math.Round(Sx-VC.FadeW/2-PSx/2+1), Sy+PSy/2, VC.FadeW, PSy, 180)  local tclr = table.Copy(VC.Color.White) tclr.a=tclr.a*anim draw.SimpleText(text, "VC_Name", Sx, Sy+25, tclr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)  end  local pos = (ent:GetPos()+Vector(0,0,75)):ToScreen() ent.VC_LastPos_X = math.Clamp(Lerp(0.2, ent.VC_LastPos_X or pos.x, pos.x), -200, ScrW()+200) ent.VC_LastPos_Y = math.Clamp(Lerp(0.2, ent.VC_LastPos_Y or pos.y, pos.y), -200, ScrH()+200) end  local VC_KeyDownIn = nil local VC_KeyDownDel = nil function VC.CD.HUDPaint()  local FTm = VC.FTm()   local carDealers = ents.FindByClass("vc_npc_cardealer")  if table.Count(carDealers) > 0 then  local textDist = VC.getServerSetting("CD_Text_Dist", 500)  for key,ent in pairs(ents.FindByClass("vc_npc_cardealer")) do  local text = VC.getName(ent, VC.CD.Default.Name)  if hook.Call("VC_CD_canRenderInfo", GAMEMODE, ent, text) != false and hook.Call("VC_CD_CanRenderInfo", GAMEMODE, ent, text) != false then VC.CD.DrawInfo(ent, text, key, textDist) end  end  end   if VC.CD.EditPlatorms then  local NPC = VC.CD.EditPlatorms[1]  local PInsert, PEnd, PDel = input.IsKeyDown(KEY_INSERT) or input.IsKeyDown(KEY_LALT) and input.IsKeyDown(KEY_RIGHT), input.IsKeyDown(KEY_END) or input.IsKeyDown(KEY_LALT) and input.IsKeyDown(KEY_DOWN), input.IsKeyDown(KEY_DELETE) or input.IsKeyDown(KEY_LALT) and input.IsKeyDown(KEY_LEFT)  if IsValid(NPC) and !PEnd then  if PInsert and !VC_KeyDownIn then VC_KeyDownIn = true elseif VC_KeyDownIn and !PInsert then SpawnPlatform(NPC) VC_KeyDownIn = nil end  if PDel and !VC_KeyDownDel then VC_KeyDownDel = true elseif VC_KeyDownDel and !PDel then DeletePlatform(NPC) VC_KeyDownDel = nil end  local LineP = ScrH()*0.15 local NPCPos = (NPC:GetPos()+Vector(0,0,50)):ToScreen()  draw.RoundedBox(0, 0, LineP, ScrW(), 50, Color(100, 155, 200, 155))  for i=1,6 do surface.DrawLine(NPCPos.x,NPCPos.y, ScrW()/2-3+i,LineP+50) end  draw.SimpleText('[INSERT] or [LALT] + [RIGHT ARROW]   - Spawn new platform', nil, 10, LineP+10, VC.Color.White, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)  draw.SimpleText('[END] or [LALT] + [DOWN ARROW]   - Done editing', nil, 10, LineP+25, VC.Color.White, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)  draw.SimpleText('[DELETE] or [LALT] + [LEFT ARROW]   - Delete platform', nil, 10, LineP+40, VC.Color.White, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)  for i=1,6 do surface.DrawLine(NPCPos.x,NPCPos.y, ScrW()/2-3+i,LineP+50) end  draw.SimpleText('VCMod: Editing spawn platforms for car dealer: "'..VC.getName(NPC, VC.Lng("Unknown"))..'"', "VC_Name", ScrW()/2, LineP+25, VC.Color.White, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)  else  FinishEditPlatforms()  end  end   if VC.CD.EditVehicles then  local NPC = VC.CD.EditVehicles[1]  local PInsert, PEnd, PDel = input.IsKeyDown(KEY_INSERT) or input.IsKeyDown(KEY_LALT) and input.IsKeyDown(KEY_RIGHT), input.IsKeyDown(KEY_END) or input.IsKeyDown(KEY_LALT) and input.IsKeyDown(KEY_DOWN), input.IsKeyDown(KEY_DELETE) or input.IsKeyDown(KEY_LALT) and input.IsKeyDown(KEY_LEFT)  if IsValid(NPC) and !PEnd then  if PInsert and !VC_KeyDownIn then VC_KeyDownIn = true elseif VC_KeyDownIn and !PInsert then InsertVehicle(NPC) VC_KeyDownIn = nil end  if PDel and !VC_KeyDownDel then VC_KeyDownDel = true elseif VC_KeyDownDel and !PDel then DeleteVehicle(NPC) VC_KeyDownDel = nil end  local LineP = ScrH()*0.15 local NPCPos = (NPC:GetPos()+Vector(0,0,50)):ToScreen()  draw.RoundedBox(0, 0, LineP, ScrW(), 50, Color(255, 155, 0, 155))  for i=1,6 do surface.DrawLine(NPCPos.x,NPCPos.y, ScrW()/2-3+i,LineP+50) end  draw.SimpleText('[INSERT] or [LALT] + [RIGHT ARROW]   - Insert vehicle', nil, 10, LineP+10, VC.Color.White, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)  draw.SimpleText('[END] or [LALT] + [DOWN ARROW]   - Done editing', nil, 10, LineP+25, VC.Color.White, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)  draw.SimpleText('[DELETE] or [LALT] + [LEFT ARROW]   - Remove vehicle', nil, 10, LineP+40, VC.Color.White, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)  for i=1,6 do surface.DrawLine(NPCPos.x,NPCPos.y, ScrW()/2-3+i,LineP+50) end  draw.SimpleText('VCMod: Editing vehicle list for car dealer: "'..VC.getName(NPC, VC.Lng("Unknown"))..'"', "VC_Name", ScrW()/2, LineP+25, VC.Color.White, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)  else  FinishEditVehicles()  end  end   local FTm = VC.FTm()   if VC.CD.SpawnedTestDriveData and !IsValid(VC.CD.SpawnedTestDriveData.Entity) then VC.CD.EndTestDrive() end  if VC.CD.SpawnedVehicleData and (!IsValid(VC.CD.SpawnedVehicleData.Entity) or CurTime() >= VC.CD.SpawnedVehicleData.EndTime or IsValid(LocalPlayer():GetVehicle())) then VC.CD.SpawnedVehicleData = nil end   local testdrivedistgood = VC.CD.SpawnedTestDriveData and VC.CD.SpawnedTestDriveData.Entity and VC.CD.SpawnedTestDriveData.Entity:GetPos():Distance(LocalPlayer():GetPos()) < 2000  if VC.CD.SpawnedTestDriveData and (!VC.CD.TestDriveFade or VC.CD.TestDriveFade < 1) and testdrivedistgood then  VC.CD.TestDriveFade = (VC.CD.TestDriveFade or 0)+0.05*FTm if VC.CD.TestDriveFade > 1 then VC.CD.TestDriveFade = 1 end  elseif (!VC.CD.SpawnedTestDriveData or !testdrivedistgood) and VC.CD.TestDriveFade then  VC.CD.TestDriveFade = VC.CD.TestDriveFade-0.03*FTm if VC.CD.TestDriveFade <= 0 then VC.CD.TestDriveFade = nil end  end   local drivedistgood = VC.CD.SpawnedVehicleData and VC.CD.SpawnedVehicleData.Entity and VC.CD.SpawnedVehicleData.Entity:GetPos():Distance(LocalPlayer():GetPos()) < 2000  if VC.CD.SpawnedVehicleData and (!VC.CD.SpawnedDriveFade or VC.CD.SpawnedDriveFade < 1) and drivedistgood then  VC.CD.SpawnedDriveFade = (VC.CD.SpawnedDriveFade or 0)+0.03*FTm if VC.CD.SpawnedDriveFade > 1 then VC.CD.SpawnedDriveFade = 1 end  elseif (!VC.CD.SpawnedVehicleData or !drivedistgood) and VC.CD.SpawnedDriveFade then  VC.CD.SpawnedDriveFade = VC.CD.SpawnedDriveFade-0.02*FTm if VC.CD.SpawnedDriveFade <= 0 then VC.CD.SpawnedDriveFade = nil end  end   if VC.CD.TestDriveFade then  local Sx = ScrW()/2-(VC.CD.TestDriveFade-1)*50 local Sy = 90 local PSx, PSy = 500, 50  local clr = table.Copy(VC.Color.Main) clr.a=clr.a*VC.CD.TestDriveFade draw.RoundedBox(0, Sx-PSx/2, Sy, PSx, PSy, clr)  surface.SetMaterial(VC.Material.Fade) surface.DrawTexturedRectRotated(Sx+VC.FadeW/2+PSx/2, Sy+PSy/2, VC.FadeW, PSy, 0) surface.DrawTexturedRectRotated(Sx+-VC.FadeW/2-PSx/2, Sy+PSy/2, VC.FadeW, PSy, 180)   local timeleft = (VC.CD.SpawnedTestDriveData and VC.CD.SpawnedTestDriveData.EndTime or 0)-CurTime() if timeleft < 0 then timeleft = 0 end local min, sec = math.floor(timeleft/60), math.floor(timeleft)%60  local tclr = table.Copy(VC.Color.Blue) tclr.a=tclr.a*VC.CD.TestDriveFade draw.SimpleText(VC.Lng('TestDriveTimeLeft'), "VC_Name", Sx+70, Sy+25, tclr, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)  local tclr = table.Copy(min == 0 and sec < 10 and VC.Color.Bad or VC.Color.White) tclr.a=tclr.a*VC.CD.TestDriveFade draw.SimpleText((min < 10 and "0" or "")..tostring(min)..":"..(sec < 10 and "0" or "")..tostring(sec), "VC_Name", Sx+110, Sy+25, tclr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)  end  if VC.CD.SpawnedDriveFade then  if VC.CD.SpawnedVehicleData_LastPos_X and VC.CD.SpawnedVehicleData_LastPos_Y then  local text = VC.Lng('SpawnedVehicle') surface.SetFont("VC_Name") local tz = surface.GetTextSize(text or "")  local Sx = math.Round(VC.CD.SpawnedVehicleData_LastPos_X+(VC.CD.SpawnedDriveFade-1)*50) local Sy = math.Round(VC.CD.SpawnedVehicleData_LastPos_Y-25) local PSx, PSy = tz, 50  local clr = table.Copy(VC.Color.Main) clr.a=clr.a*VC.CD.SpawnedDriveFade draw.RoundedBox(0, math.Round(Sx-PSx/2), Sy, PSx, PSy, clr)  surface.SetMaterial(VC.Material.Fade) surface.DrawTexturedRectRotated(math.Round(Sx+VC.FadeW/2+PSx/2), Sy+PSy/2, VC.FadeW, PSy, 0) surface.DrawTexturedRectRotated(math.Round(Sx+-VC.FadeW/2-PSx/2), Sy+PSy/2, VC.FadeW, PSy, 180)  local tclr = table.Copy(VC.Color.Good) tclr.a=tclr.a*VC.CD.SpawnedDriveFade draw.SimpleText(text, "VC_Name", Sx, Sy+25, tclr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)  end  if VC.CD.SpawnedVehicleData and VC.CD.SpawnedVehicleData.Entity then local pos = (VC.CD.SpawnedVehicleData.Entity:GetPos()+Vector(0,0,50)):ToScreen() VC.CD.SpawnedVehicleData_LastPos_X = math.Clamp(Lerp(0.1, VC.CD.SpawnedVehicleData_LastPos_X or pos.x, pos.x), -200, ScrW()+200) VC.CD.SpawnedVehicleData_LastPos_Y = math.Clamp(Lerp(0.1, VC.CD.SpawnedVehicleData_LastPos_Y or pos.y, pos.y), -200, ScrH()+200) end  end end  hook.Add("PostDrawTranslucentRenderables", "VC_CD_PostDrawTranslucentRenderables", function()  if VC.CD.EditVehicles and IsValid(VC.CD.EditVehicles[1]) then  render.SetMaterial(VC.Material.Beam)  for k,v in pairs(VC.GetVehicleList()) do  if IsValid(v) then  local Has = nil for k2,v2 in pairs(VC.CD.LastTbl.Vehicles) do if VC.GetModel(v) == v2.Model and VC.getName(v, VC.Lng("Unknown")) == (v2.Name or "Unknown") and v:GetSkin() == (v2.DefaultSkin or 0) then Has = true break end end  if Has then render.DrawBeam(v:GetPos()+v:GetUp()*30, VC.CD.EditVehicles[1]:GetPos()+VC.CD.EditVehicles[1]:GetUp()*50, 5, 1, 1, Color(200, 100, 0, 255)) end  end  end  end end) local rs7 = "vc.check_msg_work_ALS_k4" 
--PATH mlogs/cami/sh_cami.lua:
     local version = 20150902.1  if CAMI and CAMI.Version >= version then return end  CAMI = CAMI or {} CAMI.Version = version    local usergroups = CAMI.GetUsergroups and CAMI.GetUsergroups() or { 	user = { 		Name = "user", 		Inherits = "user" 	}, 	admin = { 		Name = "admin", 		Inherits = "user" 	}, 	superadmin = { 		Name = "superadmin", 		Inherits = "admin" 	} }    local privileges = CAMI.GetPrivileges and CAMI.GetPrivileges() or {}    function CAMI.RegisterUsergroup(usergroup, source) 	usergroups[usergroup.Name] = usergroup  	hook.Call("CAMI.OnUsergroupRegistered", nil, usergroup, source) 	return usergroup end    function CAMI.UnregisterUsergroup(usergroupName, source) 	if not usergroups[usergroupName] then return false end  	local usergroup = usergroups[usergroupName] 	usergroups[usergroupName] = nil  	hook.Call("CAMI.OnUsergroupUnregistered", nil, usergroup, source)  	return true end    function CAMI.GetUsergroups() 	return usergroups end    function CAMI.GetUsergroup(usergroupName) 	return usergroups[usergroupName] end    function CAMI.UsergroupInherits(usergroupName1, usergroupName2) 	repeat 		if usergroupName1 == usergroupName2 then return true end  		usergroupName1 = usergroups[usergroupName1] and 						 usergroups[usergroupName1].Inherits or 						 usergroupName1 	until not usergroups[usergroupName1] or 		  usergroups[usergroupName1].Inherits == usergroupName1  	  	  	return usergroupName1 == usergroupName2 or usergroupName2 == "user" end    function CAMI.InheritanceRoot(usergroupName) 	if not usergroups[usergroupName] then return end  	local inherits = usergroups[usergroupName].Inherits 	while inherits ~= usergroups[usergroupName].Inherits do 		usergroupName = usergroups[usergroupName].Inherits 	end  	return usergroupName end    function CAMI.RegisterPrivilege(privilege) 	privileges[privilege.Name] = privilege  	hook.Call("CAMI.OnPrivilegeRegistered", nil, privilege)  	return privilege end    function CAMI.UnregisterPrivilege(privilegeName) 	if not privileges[privilegeName] then return false end  	local privilege = privileges[privilegeName] 	privileges[privilegeName] = nil  	hook.Call("CAMI.OnPrivilegeUnregistered", nil, privilege)  	return true end    function CAMI.GetPrivileges() 	return privileges end    function CAMI.GetPrivilege(privilegeName) 	return privileges[privilegeName] end      local defaultAccessHandler = {["CAMI.PlayerHasAccess"] = 	function(_, actorPly, privilegeName, callback, _, extraInfoTbl) 		  		if not IsValid(actorPly) then return callback(true, "Fallback.") end  		local priv = privileges[privilegeName]  		local fallback = extraInfoTbl and ( 			not extraInfoTbl.Fallback and actorPly:IsAdmin() or 			extraInfoTbl.Fallback == "user" and true or 			extraInfoTbl.Fallback == "admin" and actorPly:IsAdmin() or 			extraInfoTbl.Fallback == "superadmin" and actorPly:IsSuperAdmin())   		if not priv then return callback(fallback, "Fallback.") end  		callback( 			priv.MinAccess == "user" or 			priv.MinAccess == "admin" and actorPly:IsAdmin() or 			priv.MinAccess == "superadmin" and actorPly:IsSuperAdmin() 			, "Fallback.") 	end, 	["CAMI.SteamIDHasAccess"] = 	function(_, _, _, callback) 		callback(false, "No information available.") 	end } function CAMI.PlayerHasAccess(actorPly, privilegeName, callback, targetPly, extraInfoTbl) 	hook.Call("CAMI.PlayerHasAccess", defaultAccessHandler, actorPly, 		privilegeName, callback, targetPly, extraInfoTbl) end    function CAMI.GetPlayersWithAccess(privilegeName, callback, targetPly, extraInfoTbl) 	local allowedPlys = {} 	local allPlys = player.GetAll() 	local countdown = #allPlys  	local function onResult(ply, hasAccess, _) 		countdown = countdown - 1  		if hasAccess then table.insert(allowedPlys, ply) end 		if countdown == 0 then callback(allowedPlys) end 	end  	for _, ply in pairs(allPlys) do 		CAMI.PlayerHasAccess(ply, privilegeName, 			function(...) onResult(ply, ...) end, 			targetPly, extraInfoTbl) 	end end    function CAMI.SteamIDHasAccess(actorSteam, privilegeName, callback, targetSteam, extraInfoTbl) 	hook.Call("CAMI.SteamIDHasAccess", defaultAccessHandler, actorSteam, 		privilegeName, callback, targetSteam, extraInfoTbl) end    function CAMI.SignalUserGroupChanged(ply, old, new, source) 	hook.Call("CAMI.PlayerUsergroupChanged", nil, ply, old, new, source) end    function CAMI.SignalSteamIDUserGroupChanged(steamId, old, new, source) 	hook.Call("CAMI.SteamIDUsergroupChanged", nil, steamId, old, new, source) end  
--PATH mlogs/permissions/sh_permissions.lua:
   mLogs.permissions = mLogs.permissions or {} mLogs.permissions.targets = mLogs.permissions.targets or {groups={},steamids={},teams={}} mLogs.permissions.conversions = mLogs.permissions.conversions or {} mLogs.permissions.defaultPermissions = {     ["__menu"] = true,     ["p_player_ip"] = true }  function mLogs.permissions.addTarget(key,format)     mLogs.permissions.targets[key] = {         key = key,         format = format,         children = {}     } end mLogs.permissions.addTarget("groups","Group: %s") mLogs.permissions.addTarget("steamids","SteamID: %s") mLogs.permissions.addTarget("teams","Team: %s")    function mLogs.permissions.addGroup(group,perm)     mLogs.permissions.targets.groups.children[group] = mLogs.permissions.targets.groups.children[group] or {         name = group,         tag = group,         perm = perm,         disallowed = mLogs.permissions.defaultPermissions,     } end    function mLogs.permissions.addTeam(name,_team)     _team = tostring(_team)     mLogs.permissions.targets.teams.children[_team] = mLogs.permissions.targets.teams.children[_team] or {         name = name,         tag = _team,         perm = true,         disallowed = mLogs.permissions.defaultPermissions,     } end    function mLogs.permissions.addSteamID(steamid)     mLogs.permissions.targets.steamids.children[steamid] = mLogs.permissions.targets.steamids.children[steamid] or {         name = steamid,         tag = steamid,         disallowed = mLogs.permissions.defaultPermissions,     } end  function mLogs.permissions.generateConversions()     if(#mLogs.permissions.conversions > 1) then return end     mLogs.permissions.conversions["__menu"] = "** mLogs Access **"            for category,data in pairs((CLIENT and mLogs.categories or mLogs.getCategories()) or {}) do         if(category == "logs")then continue end         for _,hookData in pairs(data.hooks) do             mLogs.permissions.conversions[category.."_"..hookData.tag] = data.name .. ": " .. hookData.name         end     end            for _type, data in pairs(mLogs.logger.defInfo) do         for key, formatData in pairs(data) do             mLogs.permissions.conversions["p_".. _type .. "_" .. key] = "Format: " .. mLogs.upper(_type) .. " " .. (formatData.name or "")         end     end end  timer.Simple(0.1,function()     for group,_ in pairs(CAMI.GetUsergroups())do         mLogs.permissions.addGroup(group,true)     end          for idx,teamData in pairs(team.GetAllTeams()) do         mLogs.permissions.addTeam(teamData.Name or "",idx)     end end)    function mLogs.permissions.isRoot(ply)     return mLogs.config.root[ply:GetUserGroup()] end  function mLogs.permissions.isPermDisabled(ply,perm)           local group,sid,_team = ply:GetUserGroup(),ply:SteamID(),tostring(ply:Team())     if(not (group and sid and _team))then return true end     local d = {}     if(mLogs.permissions.targets["steamids"].children[sid])then         d[1] = tobool(mLogs.permissions.targets["steamids"].children[sid].disallowed["__menu"]) || tobool(mLogs.permissions.targets["steamids"].children[sid].disallowed[perm])     end          if(mLogs.permissions.targets["teams"].children[_team])then         d[2] = tobool(mLogs.permissions.targets["teams"].children[_team].disallowed["__menu"]) || tobool(mLogs.permissions.targets["teams"].children[_team].disallowed[perm])     end          if(mLogs.permissions.targets["groups"].children[group])then         d[3] = tobool(mLogs.permissions.targets["groups"].children[group].disallowed["__menu"]) || tobool(mLogs.permissions.targets["groups"].children[group].disallowed[perm])     end          if((d[3] != nil and d[3] == false))then         return false       elseif((d[2] != nil and d[2] == false))then         return false       elseif((d[1] != nil and d[1] == false))then         return false       else         return true     end end  function mLogs.permissions.canViewMenu(ply)     return mLogs.permissions.isRoot(ply) or not mLogs.permissions.isPermDisabled(ply,"__menu") end  hook.Add("mLogs_canOpenMenu", "mLogs_viewCheck", function(ply)     if(not mLogs.permissions.canViewMenu(ply))then         return false     end  end)  function mLogs.permissions.canViewCategoryTag(ply,c_tag,h_tag)     return mLogs.permissions.isRoot(ply) or not mLogs.permissions.isPermDisabled(ply,c_tag .. "_" .. h_tag) end  function mLogs.permissions.canViewInfoTag(ply,_type,key)     return mLogs.permissions.isRoot(ply) or not mLogs.permissions.isPermDisabled(ply,"p_".. _type .. "_" .. key) end 
--PATH mlogs/logger/loggers/darkrp/__category.lua:
   mLogs.addCategory( 	"DarkRP",   	"darkrp",  	Color(240,52,52),   	function()   		return DarkRP != nil 	end, 	true   )  mLogs.addCategoryDefinitions("darkrp", { 	adverts = function(data) return mLogs.doLogReplace({"^player1",":","^msg"},data) end,     agenda = function(data) return mLogs.doLogReplace(mLogs.getLogTranslation(         data.msg and "agenda_update" or "agenda_remove"        ),data) end, 	arrests = function(data) return mLogs.doLogReplace(mLogs.getLogTranslation( 		data.a and "arrest" or "unarrest" 	),data) end, 	batteringram = function(data) return mLogs.doLogReplace(mLogs.getLogTranslation( 		data.s and  			(data.owner and (data.vehicle and "ram_success_vehicle" or "ram_success") or 				(data.vehicle and "ram_success_unowned_vehicle" or "ram_success_unowned") 			) or  			(data.owner and (data.vehicle and "ram_fail_vehicle" or "ram_fail") or 				(data.vehicle and "ram_fail_unowned_vehicle" or "ram_fail_unowned") 			) 	),data) end, 	cheques = function(data) return mLogs.doLogReplace(mLogs.getLogTranslation( 		data.d and "cheque_drop" or data.p and "cheque_pickup" or data.t and "cheque_tore" 	),data) end, 	demotes = function(data) return mLogs.doLogReplace(mLogs.getLogTranslation( 		data.afk and "demote_afk" or "demote" 	),data) end, 	doors = function(data) return mLogs.doLogReplace(mLogs.getLogTranslation( 		data.s and "door_sold" or "door_buy" 	),data) end, 	money = function(data) return mLogs.doLogReplace(mLogs.getLogTranslation( 		data.d and "money_drop" or data.p and (data.owner and "money_pickup" or "money_pickup_unowned") 	),data) end, 	hits = function(data) return mLogs.doLogReplace(mLogs.getLogTranslation( 		data.a and "hit_accept" or data.c and "hit_complete" or data.f and "hit_fail" or data.r and "hit_request" 	),data) end, 	jobs = function(data) return mLogs.doLogReplace(mLogs.getLogTranslation("job"),data) end, 	lockpick = function(data) return mLogs.doLogReplace(mLogs.getLogTranslation( 		data.t and 			(data.owner and (data.vehicle and "lockpick_started_vehicle" or "lockpick_started") or 				(data.vehicle and "lockpick_started_unowned_vehicle" or "lockpick_started_unowned") 			) 		or 		data.c and ( 			(data.s and  				(data.owner and (data.vehicle and "lockpick_success_vehicle" or "lockpick_success") or 					(data.vehicle and "lockpick_success_unowned_vehicle" or "lockpick_success_unowned") 				) or  				(data.owner and (data.vehicle and "lockpick_fail_vehicle" or "lockpick_fail") or 					(data.vehicle and "lockpick_fail_unowned_vehicle" or "lockpick_fail_unowned") 				) 			)  		) or "lockpick_fail" 	),data) end, 	name = function(data) return mLogs.doLogReplace(mLogs.getLogTranslation("name"),data) end, 	pocket = function(data) return mLogs.doLogReplace(mLogs.getLogTranslation( 		data.d and "pocket_drop" or "pocket" 	),data) end, 	purchases = function(data) return mLogs.doLogReplace(mLogs.getLogTranslation( 		data.s and "purchase_shipment" or "purchase" 	),data) end, 	hunger = function(data) return mLogs.doLogReplace(mLogs.getLogTranslation("hunger"),data) end, 	wanted = function(data) return mLogs.doLogReplace(mLogs.getLogTranslation( 		data.w and "wanted" or "unwanted" 	),data) end, 	warrant = function(data) return mLogs.doLogReplace(mLogs.getLogTranslation( 		data.w and "warrant" or "unwarrant" 	),data) end, 	weaponcheck = function(data) return mLogs.doLogReplace(mLogs.getLogTranslation( 		data.s and "wep_check" or data.c and "wep_confiscate" or "wep_return" 	),data) end, }) 
--PATH mlogs/settings/subs/sh_types.lua:
       local ct,st = "server","types" mLogs.settings.addSubcategory(mLogs.getLang("format_types"),ct,st)  for Type,options in pairs(mLogs.logger and mLogs.logger.defInfo or {})do 	mLogs.settings.addSpacer(mLogs.upper(Type),ct,st) 	for setting,data in pairs(options)do 		mLogs.settings.addOption(ct,st,{ 			title = data.name, 			tag = Type .. "_s_" .. setting, 			desc = "Should the " .. Type .. "'s " .. string.lower(data.name) .. " be logged?", 			type = "bool", 			default = data.default, 			get = function() return mLogs.isDefinitionInfoEnabled(Type,setting) end, 			set = function(bool) mLogs.setDefinitionInfoEnabled(Type,setting,bool) end 		}) 	end end 
--PATH mlogs/settings/subs/sh_console.lua:
       local ct,st = "client","console" mLogs.settings.addSubcategory("Console",ct,st)  mLogs.settings.addSpacer("Console",ct,st) mLogs.settings.addOption(ct,st,{     title = "Show Logs in Console",     tag = "show_console_logs",     desc = "Should logs be shown in the console? (if allowed)",     type = "bool",     default = true,     get = function() return mLogs.console.showLogs end,     set = function(bool) mLogs.console.showLogs = bool end }) 
--PATH mlogs/settings/types/sh_number.lua:
     mLogs.settings.addType("number",function(d)     return d and isnumber(d) and d > 0 end) 
--PATH mlogs/settings/types/sh_bool.lua:
     mLogs.settings.addType("bool",function(d)     return isbool(d) end,{ 	sqlSet = function(data) return data and 1 or 0 end, 	sqlGet = function(data) return tonumber(data) and (tonumber(data) == 1) end }) 
--PATH mlogs/elements/settings/cl_settings.lua:
   DEFINE_BASECLASS("mLogs_contentBase")  local PANEL = {}  function PANEL:Init() 	self:SetTitle(mLogs.getLang("server"))  	self.sidebar = self:Add("mLogs_sidebar")  	for k,v in pairs(mLogs.settings.categories)do 		self:AddCategory(v) 	end 	 	self.settings = self.scroll:Add("DIconLayout") 	self.settings:SetSpaceY(12)  	self.loading = self:Add("DPanel") 	self.loading.Paint = function(s,w,h) 		  		if((CurTime() - s.ShowTime) > 0.2)then 			draw.RoundedBox(0,0,0,w,h,Color(0,0,0,100)) 			draw.SimpleText(mLogs.getLang("loading"), "mLogs_large", w*0.5, h*0.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER) 		end 	end 	self.loading.OldVisible = self.loading.SetVisible 	self.loading.SetVisible = function(s,bool) 		if(bool)then s.ShowTime = CurTime() end 		s.OldVisible(s,bool) 	end 	self:ShowLoading(false) 	mLogs.addSettingRequestListener(self)  	self:SelectSub("client","ui") end  function PANEL:ShowLoading(bool) 	self.loading:SetVisible(bool) end  function PANEL:OnRemove() 	mLogs.removeSettingRequestListener(self) end  function PANEL:SelectSub(c_tag,s_tag) 	if(self.sh and self.sh[1] == c_tag and self.sh[2] == s_tag) then return end 	local sub = mLogs.settings.getSubcategory(c_tag,s_tag) 	if (not sub) then return end 	for k,v in pairs(self.sidebar:GetItems()) do 		if(v.pnl and ValidPanel(v.pnl))then 			local pnl = v.pnl 			if(pnl:GetCategory() and pnl:GetCategory().tag == c_tag)then 				pnl:SetInternalSub(s_tag) 			else 				pnl:ClearInternalSub() 			end 		end 	end 	self.sh = {c_tag,s_tag,sub} 	self:ShowSettings(c_tag,s_tag,sub) end  function PANEL:SetSettings(c_tag,s_tag,sub) 	self:ShowLoading(false) 	for k,v in pairs(sub.options) do 		self:AddOption(v) 	end 	if(sub.skipSave) then return end 	self:AddSaveButton() end  function PANEL:ShowSettings(c_tag,s_tag,sub) 	self.settings:Clear() 	self:SetTitle(sub.name) 	if(c_tag == "client")then self:SetSettings(c_tag,s_tag,sub) return end 	self:ShowLoading(true) 	mLogs.InteractInterface("settings_request",function() 		net.WriteString(s_tag) 	end) end  function PANEL:OnReceiveSettings(s_tag,settings) 	local c_tag = "server" 	if(c_tag != self.sh[1] or s_tag != self.sh[2]) then return end 	for o_tag,value in pairs(settings) do 		mLogs.settings.setServerOptionValue(c_tag,s_tag,o_tag,value) 	end 	self:SetSettings(c_tag,s_tag,self.sh[3]) end  function PANEL:AddSaveButton() 	local saveBtn = self.settings:Add("mLogs_button") 	saveBtn:SetHoverColor(mLogs.config.colors.accent) 	saveBtn:SetBGColor(Color(mLogs.config.colors.accent.r+20,mLogs.config.colors.accent.g+20,mLogs.config.colors.accent.b+20, mLogs.config.colors.accent.a)) 	saveBtn:SetText(mLogs.getLang("save")) 	saveBtn.forceHeight = -24 	saveBtn.DoClick = function() self:Save() end end  function PANEL:Save() 	local options = {} 	local invalid = {} 	for k,v in pairs(self.settings:GetChildren()) do 		if(v.GetOption and v:GetOption() and v:GetOption().set and mLogs.settings.getType(v:GetOption().type))then 			local d = v:GetOption() 			local r = v:GetData() 			local t = mLogs.settings.getType(d.type) 			if((not d.ignoreCheck) or (d.customCheck and d.customCheck(r)) or (t.validation and t.validation(r)))then 				options[d.tag] = r 			else 				table.insert(invalid,d) 			end 		end 	end 	if(next(invalid))then 		local f = "" 		for k,v in pairs(invalid) do 			f = f .. v.title .. ", " 		end  		f = string.sub(f,1,-3) 		mLogs.alert(mLogs.getLang("invalid_fields"), mLogs.getLang("fix_fields",f)) 		return 	end 	 	if(self.sh[1]=="server")then 		mLogs.InteractInterface("settings_save",function() 			net.WriteString(self.sh[2]) 			net.WriteTable(options) 		end) 	else 		mLogs.settings.localSave(self.sh[2],options,function() 			mLogs.alert(mLogs.getLang("success"),mLogs.getLang("save_success")) 		end) 	end end  function PANEL:AddOption(option) 	if(not option.type)then return end 	local pan = self.settings:Add("mLogs_settingsOption_" .. option.type) 	if(ValidPanel(pan))then 		pan:SetOption(option,self.sh) 	end end  function PANEL:AddCategory(data) 	if(not IsValid(LocalPlayer())) then return end 	if(data.tag and data.tag == "server" and not mLogs.permissions.isRoot(LocalPlayer())) then return end 	local pnl = self.sidebar:Add("mLogs_settingsCategory") 	pnl:SetCategory(data) 	pnl.OnSelectSub = function(c_data,s_data) 		self:SelectSub(c_data.tag,s_data.tag) 	end 	self.sidebar:AddItem(pnl,nil,42,1) end  function PANEL:Paint(w,h) 	BaseClass.Paint(self,w,h) end  function PANEL:PerformLayout(w,h) 	BaseClass.PerformLayout(self,w,h) 	 	self.sidebar:SetSize(w*0.2,h)  	self.loading:SetPos(w*0.2,h*0.1) 	self.loading:SetSize(w*0.8,h*0.9)  	self.yPos = self.yPos + self.ySpacing 	self.settings:SetPos(w*0.2 + w*0.5 - w*self.pM*0.5,self.yPos) 	self.settings:SetSize(w*self.pM - w*0.2,h*0.82) 	self.yPos = self.yPos + h*0.82 	 	local items = self.settings:GetChildren() 	if(#items > 0)then 		for k,v in pairs(items) do 			v:SetSize(self.settings:GetWide(),v.fH or v.sH and (h*v.sH) or (64 + (v.forceHeight or 0))) 		end 	end 	 	self.settings:SetSize(w,select(2,self.settings:ChildrenSize())) 	self.settings:Layout() end vgui.Register( "mLogs_settings", PANEL, "mLogs_contentBase" ) 
--PATH mlogs/elements/ui/cl_stringentry.lua:
   DEFINE_BASECLASS("DTextEntry")  local PANEL = {} AccessorFunc(PANEL, "m_iIcon", "Icon") AccessorFunc(PANEL, "m_sPlaceholder", "Placeholder") AccessorFunc(PANEL, "m_sAllowedCharacters", "AllowedChars")  function PANEL:Init() 	self:SetFont("mLogs_small") 	self:SetTextColor(color_white) 	self:SetCursorColor(color_white) end  function PANEL:Paint(w,h) 	draw.RoundedBox(0,0,0,w,h, mLogs.config.colors.uiBorder ) 	draw.RoundedBox(0,1,1,w-2,h-2, mLogs.config.colors.panel) 	 	if(self:GetIcon())then 		surface.SetDrawColor(color_white) 		surface.SetMaterial(self:GetIcon()) 		surface.DrawTexturedRect(w*0.98-h*0.8,h*0.1,h*0.8,h*0.8) 	end 	 	if(self:GetPlaceholder() and self:GetValue() == "")then 		draw.SimpleText(self:GetPlaceholder(), "mLogs_small", w*0.02, h*0.5, mLogs.config.colors.uiBorder, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER) 	end 	 	self:DrawTextEntryText(self:GetTextColor(), self:GetHighlightColor(), self:GetCursorColor()) end   vgui.Register( "mLogs_stringEntry", PANEL, "DTextEntry" ) 
--PATH mlogs/elements/ui/cl_listview_line.lua:
   local PANEL = {}  function PANEL:Init() end  function PANEL:Paint() end  function PANEL:SetText() 	if(ValidPanel(self.txtLabel)) then self.txtLabel:Remove() self.txtLabel = nil end 	local val = self.Value 	if(type(val) == "table")then 		self.type = val.type 		if(val.type == "number")then 			self.txtLabel = self:Add("mLogs_numberEntry") 			self.txtLabel:SetValue(val.value) 			self.GetValue = function(s) return self.txtLabel:GetValue() end 		elseif(val.type == "img_button")then 			self.txtLabel = self:Add("DImageButton") 			self.txtLabel:SetImage(val.image) 			self.txtLabel.DoClick = function() 				val.doClick(self:GetParent()) 			end 		end 	else 		self.txtLabel = self:Add("mLogs_stringEntry") 		self.txtLabel:SetValue(tostring(val)) 		self.GetValue = function(s) return self.txtLabel:GetValue() end 	end 	self.txtLabel:SetFont(mLogs.getLogFont() or "mLogs_logFont") 	self:InvalidateLayout() end  function PANEL:PerformLayout(w,h) 	if(ValidPanel(self.txtLabel))then 		if(self.type == "img_button")then 			self.txtLabel:SetSize(16,16) 		else 			self.txtLabel:SetSize(w*0.9,h*0.7) 		end 		self.txtLabel:SetPos(w*0.5 - self.txtLabel:GetWide()*0.5, h*0.5 - self.txtLabel:GetTall()*0.5) 	end end  vgui.Register( "mLogs_listView_lineEditable", PANEL, "DPanel" )  local PANEL = {}  function PANEL:Init()  	self:SetTextInset( 5, 0 ) 	self:SetFont(mLogs.getLogFont() or "mLogs_logFont") 	self:SetTextColor(color_white) end  vgui.Register( "mLogs_listView_lineLabel", PANEL, "DLabel" )   DEFINE_BASECLASS("DListViewLine")  local PANEL = {}  AccessorFunc(PANEL,"m_bEditable","Editable") function PANEL:Init() 	self:SetSelectable( true ) 	self:SetMouseInputEnabled( true )  	self.Columns = {} 	self.Data = {}  end  function PANEL:Paint(w,h) 	if ( self.m_bAlt ) then 		draw.RoundedBox(0,0,0,w,h,mLogs.config.colors.tableAlternate) 	else 		draw.RoundedBox(0,0,0,w,h,mLogs.config.colors.panel) 	end 	 	if( self.Hovered )then 		draw.RoundedBox(0,0,0,w,h,mLogs.config.colors.hover) 	end  	if( self:IsSelected())then 		draw.RoundedBox(0,0,0,w,h,mLogs.config.colors.tableHighlight) 	end end  function PANEL:SetColumnText( i, strText )  	if ( type( strText ) == "Panel" ) then  		if ( IsValid( self.Columns[ i ] ) ) then self.Columns[ i ]:Remove() end  		strText:SetParent( self ) 		self.Columns[ i ] = strText 		self.Columns[ i ].Value = strText 		return  	end 	 	if(type(strText) == "table")then 		if ( IsValid( self.Columns[ i ] ) ) then self.Columns[ i ]:Remove() end 		self.Columns[i] = vgui.Create("mLogs_text",self) 		self.Columns[i]:SetMouseInputEnabled( false ) 		self.Columns[i]:ParseData(strText) 		self.Columns[i].Value = self.Columns[i]:GetText() 		return 	end  	if ( !IsValid( self.Columns[ i ] ) ) then 		 		if(self:GetEditable())then 			self.Columns[ i ] = vgui.Create("mLogs_listView_lineEditable", self) 			self.Columns[ i ]:SetMouseInputEnabled( true ) 			self.Columns[ i ]:SetKeyboardInputEnabled( true ) 		else 			self.Columns[ i ] = vgui.Create( "mLogs_listView_lineLabel", self ) 			self.Columns[ i ]:SetMouseInputEnabled( false ) 		end  	end 	 	self.Columns[ i ].Value = strText 	self.Columns[ i ]:SetText( tostring( strText ) ) 	return self.Columns[ i ]  end PANEL.SetValue = PANEL.SetColumnText  function PANEL:SetTextColor(col) 	for k,v in pairs(self.Columns) do 		v:SetTextColor( col ) 	end end  vgui.Register( "mLogs_listView_line", PANEL, "DListViewLine" ) 