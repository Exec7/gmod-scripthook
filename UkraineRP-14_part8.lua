--Stealed clientside server code by exechack.cc
--Hostname: Ψ UkraineRP #1 ◈ Оновлення◈ Набiр ◈ M9K - Part 8/10 - 06/04/2025


--PATH addons/dash/lua/includes/_init.lua:
--[[---------------------------------------------------------
	Non-Module includes
-----------------------------------------------------------]]

include ("util.lua")			-- Misc Utilities
include ("util/sql.lua")		-- Include sql here so it's
								-- available at loadtime to modules.

include("extensions/net.lua")

--[[---------------------------------------------------------
	Shared Modules
-----------------------------------------------------------]]

require ("baseclass")
require ("concommand")		-- Console Commands
require ("saverestore")		-- Save/Restore
require ("hook")				-- Gamemode hooks
require ("gamemode")			-- Gamemode manager
require ("weapons")			-- SWEP manager
require ("scripted_ents")		-- Scripted Entities
require ("player_manager")	-- Player models/class manager
require ("numpad")
require ("team")
require ("undo")
require ("cleanup")
require ("duplicator")
require ("constraint")
require ("construct")
require ("usermessage")
require ("list")
require ("cvars")
require ("http")
require ("properties")
require ("widget")
require ("cookie")
require ("utf8")

require ("drive")
include ("drive/drive_base.lua")
include ("drive/drive_noclip.lua")

--[[---------------------------------------------------------
	Serverside only modules
-----------------------------------------------------------]]

if (SERVER) then

	require("ai_task")
	require("ai_schedule")
	--
	AddCSLuaFile("extensions/math/ease.lua")

end


--[[---------------------------------------------------------
	Clientside only modules
-----------------------------------------------------------]]

if (CLIENT) then

	require ("draw")			-- 2D Draw library
	require ("markup")		-- Text markup library
	require ("effects")
	require ("halo")
	require ("killicon")
	require ("spawnmenu")
	require ("controlpanel")
	require ("presets")
	require ("menubar")
	require ("matproxy")

	include("util/model_database.lua")	-- Store information on models as they're loaded
	include("util/vgui_showlayout.lua") 	-- VGUI Performance Debug
	include("util/tooltips.lua")
	include("util/client.lua")
	include("util/javascript_util.lua")
	include("util/workshop_files.lua")
	include("gui/icon_progress.lua")

end


--[[---------------------------------------------------------
	Shared modules
-----------------------------------------------------------]]
include("gmsave.lua")

--[[---------------------------------------------------------
	Extensions

	Load extensions that we specifically need for the menu,
	to reduce the chances of loading something that might
	cause errors.
-----------------------------------------------------------]]

include ("extensions/file.lua")
include ("extensions/angle.lua")
include ("extensions/debug.lua")
include ("extensions/entity.lua")
include ("extensions/ents.lua")
include ("extensions/math.lua")
include ("extensions/player.lua")
include ("extensions/player_auth.lua")
include ("extensions/string.lua")
include ("extensions/table.lua")
include ("extensions/util.lua")
include ("extensions/vector.lua")
include ("extensions/game.lua")
include ("extensions/motionsensor.lua")
include ("extensions/weapon.lua")
include ("extensions/coroutine.lua")

if (CLIENT) then

	include ("extensions/client/entity.lua")
	include ("extensions/client/globals.lua")
	include ("extensions/client/panel.lua")
	include ("extensions/client/player.lua")
	include ("extensions/client/render.lua")

	require ("search")

end
--PATH addons/dash/lua/dash/libraries/client/utf8.lua:

-----------------------------------------------------

_require("utf8")

local function utf8_charbytes(s, i)
   -- argument defaults
   i = i or 1
   local c = string.byte(s, i)
   
   -- determine bytes needed for character, based on RFC 3629
   if c > 0 and c <= 127 then
      -- UTF8-1
      return 1
   elseif c >= 194 and c <= 223 then
      -- UTF8-2
      local c2 = string.byte(s, i + 1)
      return 2
   elseif c >= 224 and c <= 239 then
      -- UTF8-3
      local c2 = s:byte(i + 1)
      local c3 = s:byte(i + 2)
      return 3
   elseif c >= 240 and c <= 244 then
      -- UTF8-4
      local c2 = s:byte(i + 1)
      local c3 = s:byte(i + 2)
      local c4 = s:byte(i + 3)
      return 4
   end
end

function utf8_sub(s, i, j)
   j = j or -1

   if i == nil then
      return ""
   end
   
   local pos = 1
   local bytes = string.len(s)
   local len = 0

   -- only set l if i or j is negative
   local l = (i >= 0 and j >= 0) or utf8.len(s)
   local startChar = (i >= 0) and i or l + i + 1
   local endChar = (j >= 0) and j or l + j + 1

   -- can't have start before end!
   if startChar > endChar then
      return ""
   end
   
   -- byte offsets to pass to string.sub
   local startByte, endByte = 1, bytes
   
   while pos <= bytes do
      len = len + 1
      
      if len == startChar then
	 startByte = pos
      end
      
      pos = pos + utf8_charbytes(s, pos)
      
      if len == endChar then
	 endByte = pos - 1
	 break
      end
   end
   
   return string.sub(s, startByte, endByte)
end


--PATH addons/shaccessorysystem/lua/autorun/autorun_accessory.lua:
SH_ACC = {}

-- Don't modify this.
-- The script won't explode if you do but it's better for everyone if you don't mislead players.
_SH_ACC_VERSION = "1.0.5"

if (SERVER) then
	AddCSLuaFile("autorun/autorun_accessory.lua")
	AddCSLuaFile("accessory/cl_accessory.lua")
	AddCSLuaFile("accessory/cl_interface.lua")
	AddCSLuaFile("accessory/cl_notify.lua")
	AddCSLuaFile("accessory/cl_editor.lua")
	AddCSLuaFile("accessory/cl_obj_player_extend.lua")
	AddCSLuaFile("accessory/sh_obj_player_extend.lua")
	AddCSLuaFile("accessory_addons.lua")
	AddCSLuaFile("accessory_list.lua")
	AddCSLuaFile("accessory_offsets.lua")
	AddCSLuaFile("accessory_config.lua")

	include("accessory/sv_accessory.lua")
	include("accessory/sv_database.lua")
	include("accessory/sv_obj_player_extend.lua")
else
	include("accessory/cl_accessory.lua")
	include("accessory/cl_interface.lua")
	include("accessory/cl_notify.lua")
	include("accessory/cl_editor.lua")
	include("accessory/cl_obj_player_extend.lua")

	include("accessory_offsets.lua")
end

include("accessory_addons.lua")
include("accessory_list.lua")
include("accessory_config.lua")
include("accessory/sh_obj_player_extend.lua")

if (SERVER) then
	--if (SH_ACC.UseWorkshop) then
		--resource.AddWorkshop("881305303")
	--[[else
		resource.AddFile("materials/shenesis/accessory/backpack.png")
		resource.AddFile("materials/shenesis/accessory/close.png")
		resource.AddFile("materials/shenesis/accessory/hat.png")
		resource.AddFile("materials/shenesis/accessory/info.png")
		resource.AddFile("materials/shenesis/accessory/list.png")
		resource.AddFile("materials/shenesis/accessory/mask.png")
		resource.AddFile("materials/shenesis/accessory/previous.png")
		resource.AddFile("materials/shenesis/accessory/scarf.png")
		resource.AddFile("materials/shenesis/accessory/search.png")
		resource.AddFile("materials/shenesis/accessory/stop.png")
		resource.AddFile("materials/shenesis/accessory/sunglasses.png")
		resource.AddFile("materials/shenesis/accessory/user.png")
		resource.AddFile("resource/fonts/circular.ttf")
		resource.AddFile("resource/fonts/circular_bold.ttf")

		for i = 1, 16 do
			resource.AddFile("sound/shenesis/generic_cloth_movement" .. i .. ".ogg")
		end
	end]]
end

--PATH addons/_farmer/lua/autorun/ba_config.lua:

 
B_Animals_Config = {}
B_Animals_Config.DrawDistance = 128; -- Draw distance for things.
B_Animals_Config.TimeDelay = 1; -- Draw distance for things.
B_Animals_Config.Profit_Scale = 2; -- Scale profit from products by 2.

B_Animals_Config.Animal_IdleDelay = 8; -- Idle sounds delay for Animal.
B_Animals_Config.Animal_FeedingDelay = 8; -- Feeding sounds delay for Animal.
B_Animals_Config.Animal_AngryDelay = 4; -- Angry sounds delay for Animal.

B_Animals_Config.Eat_Fillrate = 2; -- Multiplies food fillrate by 2.
B_Animals_Config.Drink_Fillrate = 4; -- Multiplies water fillrate by 2.

B_Animals_Config.Hunger_Modifier = 1; -- Multiplies hunger consumption by 1.
B_Animals_Config.Thirst_Modifier = 1; -- Multiplies thirst consumption by 1.

B_Animals_Config.Age_Modifier = 1; -- Multiplies age gain by 1.
B_Animals_Config.Production_Modifier = 2; -- Multiplies production gain by 2.

B_Animals_Config.SmallCage_Breakable = true; -- Damage affects small cage.
B_Animals_Config.SmallCage_Health = 400; -- A health of small cage.

B_Animals_Config.Food_TimeEnable = true; -- Enable destroy time for food.
B_Animals_Config.Food_TimeLimit = 300; -- Food will be removed in 300 seconds.
B_Animals_Config.Food_BoxLimit = 6; -- If player has more than 6 food in-game, then he will be unable to open new box.

B_Animals_Config.Product_UseDistance = 96; -- A use distance for product.

B_Animals_Config.Product_Limit = 1; -- A product limit for 1 cage. Animal stops production when reaches 1 product.

B_Animals_Config.Product_TimeEnable = false; -- Enable destroy time for product.
B_Animals_Config.Product_TimeLimit = 60; -- Product will be removed in 60 seconds.

B_Animals_Config.Product_Color = Color(222, 122, 46) -- A color of product name at chat.
B_Animals_Config.Product_Color_Income = Color(12, 213, 99) -- A color of product income at chat.



B_Animals_Config.Boxes_Library =
	{
		LowQuality_Meals =
			{
				name = "Низька якість харчування", -- Name for low quality meal type.
				color = "127,95,0", -- Color for low quality meal type.
				contents =
					{
						rotten_pork =
							{
								class = "food", -- Use "food" for food and "water" for water (so obvious).
								amount = 1, -- Amount of this food in box.
							
								name = "Свинина гнила", -- Name of food object.
								model = "models/props_junk/garbage_metalcan001a.mdl", -- Model of food object.
								color = "127,111,63", -- Color of food object.
								bites = 14, -- Amount of bites in food object.
								fillrate = 8 -- How much hunger/thirst it restores per bite.
							},
						rotten_beef =
							{
								class = "food",
								amount = 1,
							
								name = "Гнила яловичина",
								model = "models/props_junk/garbage_metalcan002a.mdl",
								color = "127,87,63",
								bites = 12,
								fillrate = 8
								
							},
						rotten_chicken =
							{
								class = "food",
								amount = 1,
							
								name = "Гниле куряче м'ясо",
								model = "models/props_junk/garbage_metalcan002a.mdl",
								color = "108,106,49",
								bites = 8,
								fillrate = 8
								
							},
						soggy_noodles =
							{
								class = "food",
								amount = 1,
							
								name = "Мокра локшина",
								model = "models/props_junk/garbage_bag001a.mdl",
								color = "161,131,39",
								bites = 8,
								fillrate = 6
								
							},
						murky_water =
							{
								class = "water",
								amount = 2,
							
								name = "Каламутна вода",
								model = "models/props_junk/GlassBottle01a.mdl",
								color = "0,127,82",
								bites = 6,
								fillrate = 6
							},
						sour_milk =
							{
								class = "water",
								amount = 2,
							
								name = "Кисле молоко",
								model = "models/props_junk/garbage_milkcarton002a.mdl",
								color = "212,215,127",
								bites = 12,
								fillrate = 2
							}
					}
			},
			
		MedQuality_Meals =
			{
				name = "Харчування середньої якості",
				color = "155,230,105",
				contents =
					{
						canned_beans =
							{
								class = "food",
								amount = 1,
							
								name = "Консерви з квасолі",
								model = "models/props_lab/jar01b.mdl",
								color = "240,113,49",
								bites = 8,
								fillrate = 10
								
							},
						canned_cucumbers =
							{
								class = "food",
								amount = 1,
							
								name = "Огірки консервовані",
								model = "models/props_lab/jar01b.mdl",
								color = "6,132,27",
								bites = 8,
								fillrate = 6
								
							},
						canned_tomatoes =
							{
								class = "food",
								amount = 1,
							
								name = "Консервовані томати",
								model = "models/props_lab/jar01b.mdl",
								color = "201,59,59",
								bites = 9,
								fillrate = 16
								
							},
						chinese_noodles =
							{
								class = "food",
								amount = 1,
							
								name = "Китайська локшина",
								model = "models/props_junk/garbage_takeoutcarton001a.mdl",
								color = "231,118,105",
								bites = 12,
								fillrate = 4
								
							},
						watermelon =
							{
								class = "food",
								amount = 1,
							
								name = "Кавун",
								model = "models/props_junk/watermelon01_chunk01b.mdl",
								color = "156,232,105",
								bites = 9,
								fillrate = 12
								
							},
						fine_milk =
							{
								class = "water",
								amount = 2,
							
								name = "Вишукане молоко",
								model = "models/props_junk/garbage_milkcarton001a.mdl",
								color = "148,216,191",
								bites = 12,
								fillrate = 6
							},
						clean_water =
							{
								class = "water",
								amount = 2,
							
								name = "Чиста вода",
								model = "models/props_junk/glassbottle01a.mdl",
								color = "184,195,213",
								bites = 16,
								fillrate = 2
							},
						lemon_squash =
							{
								class = "water",
								amount = 2,
							
								name = "Лимонний сквош",
								model = "models/props_junk/garbage_plasticbottle003a.mdl",
								color = "233,228,62",
								bites = 24,
								fillrate = 2
							}
					}
			},
			
		TopQuality_Meals =
			{
				name = "Харчування найвищої якості",
				color = "29,153,198",
				contents =
					{
						pure_protein =
							{
								class = "food",
								amount = 2,
							
								name = "Чистий протеїн",
								model = "models/props_lab/jar01a.mdl",
								color = "182,141,69",
								bites = 32,
								fillrate = 4
								
							},
						fresh_beans =
							{
								class = "food",
								amount = 1,
							
								name = "Свіжа квасоля",
								model = "models/props/cs_italy/it_mkt_container3a.mdl",
								color = "139,49,49",
								bites = 64,
								fillrate = 7
								
							},
						peas =
							{
								class = "food",
								amount = 1,
							
								name = "Свіжий горошок",
								model = "models/props/cs_italy/it_mkt_container1a.mdl",
								color = "71,185,71",
								bites = 64,
								fillrate = 6
								
							},
						orange =
							{
								class = "food",
								amount = 2,
							
								name = "Помаранчевий",
								model = "models/props/cs_italy/orange.mdl",
								color = "247,130,40",
								bites = 8,
								fillrate = 12
								
							},
						peach =
							{
								class = "food",
								amount = 2,
							
								name = "Персик",
								model = "models/props/de_inferno/crate_fruit_break_gib2.mdl",
								color = "246,178,101",
								bites = 12,
								fillrate = 8
								
							},
						whiskey =
							{
								class = "water",
								amount = 1,
							
								name = "Віскі",
								model = "models/props_junk/garbage_glassbottle002a.mdl",
								color = "183,22,161",
								bites = 16,
								fillrate = 9
							},
						vodka =
							{
								class = "water",
								amount = 1,
							
								name = "Приголомшлива горілка",
								model = "models/props_junk/glassjug01.mdl",
								color = "182,44,22",
								bites = 32,
								fillrate = 4
							},
						light_beer =
							{
								class = "water",
								amount = 2,
							
								name = "Світле пиво",
								model = "models/props_junk/garbage_glassbottle003a.mdl",
								color = "162,162,58",
								bites = 12,
								fillrate = 4
							},
						dark_beer =
							{
								class = "water",
								amount = 1,
							
								name = "Темне пиво",
								model = "models/props_junk/garbage_glassbottle001a.mdl",
								color = "122,73,18",
								bites = 24,
								fillrate = 12
							},
						rum =
							{
								class = "water",
								amount = 1,
							
								name = "Старий добрий ром",
								model = "models/props/cs_militia/bottle03.mdl",
								color = "141,89,59",
								bites = 16,
								fillrate = 12
							},
					}
			}
	}

B_Animals_Config.Animal_Library =
	{
		animal	=	
			{
				class = "animal", -- A class for Animal (mostly for dev purposes).
				spawn_chance = 100, -- A chance for this pet to appear (1 minimum, 100 maximum in %).
				
				name = "Бродяга", -- A name for Animal.
				
				models = {"models/player/corpse1.mdl"}, -- A models for this Animal.
				
				anim = {"sit_zen"}, -- An animation for this Animal.
				pos = Vector(0, 0, 4), -- Position adjustments for Animal. Vector(forward, right, up)
				spawn_function = function(entity)
					-- Feel free and let your inner coder come out here.
				end,
				
				start_size = 0.35, -- Starting size of monster.
				final_size = 0.95, -- Final size of monster.
			
				time_togrow = 300, -- Time required for monster to grow up.
				
				time_toeat = 180, -- Monster wants to eat every 60 seconds.
				time_todrink = 120, -- Monster wants to drink every 30 seconds.
				time_toprofit = 180, -- Monster will profit you every 30 seconds.
				profit_function = function(entity)
					local poop = ents.Create("ba_product");
					poop:SetPos(entity:GetPos()+(entity:GetUp()*16));
					poop:SetAngles(entity:GetAngles());
					poop:Spawn();

					poop.baID = entity:EntIndex();
					
					poop:GetPhysicsObject():SetMass(10);
					
					poop:SetModel("models/gibs/hgibs_spine.mdl"); -- Model of product.
					poop:SetMaterial("models/props_pipes/GutterMetal01a"); -- Material of product.
					poop:SetColor(Color(129, 87, 68)); -- Color of product.
					
					poop:PhysicsInit(SOLID_VPHYSICS);
					
					poop:SetMoveType(MOVETYPE_VPHYSICS);
					poop:SetSolid(SOLID_VPHYSICS);
					
					poop:EmitSound("physics/flesh/flesh_squishy_impact_hard3.wav", 70); -- What sound product makes on spawn.
					poop:EmitSound("physics/flesh/flesh_strider_impact_bullet2.wav", 70); -- What sound product makes on spawn.
					
					poop:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 70, 90); -- What sound product makes on spawn.
					poop:GetPhysicsObject():SetVelocity((entity:GetForward()*entity:GetNWInt("damage")*1.5)); -- How much force applied to product on spawn.
					
					poop:SetNWString("name", "Какашки бомжа"); -- NAME OF PRODUCT, CHANGE TO WHATEVER YOU WANT.
					poop:SetNWString("color", "144,68,33"); -- NAME COLOR OF PRODUCT, CHANGE TO WHATEVER YOU WANT.
					poop:SetNWInt("price", math.random(200, 400)*B_Animals_Config.Profit_Scale); -- IT'S THE MOST IMPORTANT THING, IT'S HOW MUCH MONEY PRODUCT IS GOING TO COST.
				end,
				
				start_damage = 10, -- Starting damage to cage. (damage is rounded)
				final_damage = 100, -- Final damage to cage. (damage is rounded)
				
				start_pitch = 150, -- Starting sound pitch from 1-255.
				final_pitch = 90, -- Starting sound pitch from 1-255.

				can_eatdrink = -- What Animal gonna eat or drink. If you remove can_eatdrink table, then Animal will be able to eat and drink anything.
					{
						"Свинина гнила",
						"Гнила яловичина",
						"Каламутна вода",
						"Кисле молоко"
					},	
				bonus_multiplier = 4; -- What hunger or thirst multiplier will be applied to bonus food.
				bonus_eatdrink = -- Bonus food list obviously.
					{
						"Гнила яловичина",
						"Кисле молоко",
						"Чистий протеїн",
						"Приголомшлива горілка"
					},
				moan_sounds = -- These are looped sounds. They are annoying as hell. But it's asylum, come on :D
					{
						"npc/zombie/moan_loop1.wav",
						"npc/zombie/moan_loop2.wav",
						"npc/zombie/moan_loop3.wav",
						"npc/zombie/moan_loop4.wav"
					},
				idle_sounds = -- Idle sounds for Animal.
					{
						"npc/zombie/zombie_voice_idle1.wav",
						"npc/zombie/zombie_voice_idle2.wav",
						"npc/zombie/zombie_voice_idle3.wav",
						"npc/zombie/zombie_voice_idle4.wav",
						"npc/zombie/zombie_voice_idle5.wav",
						"npc/zombie/zombie_voice_idle6.wav",
						"npc/zombie/zombie_voice_idle7.wav",
						"npc/zombie/zombie_voice_idle8.wav",
						"npc/zombie/zombie_voice_idle9.wav",
						"npc/zombie/zombie_voice_idle10.wav",
						"npc/zombie/zombie_voice_idle11.wav",
						"npc/zombie/zombie_voice_idle12.wav",
						"npc/zombie/zombie_voice_idle13.wav",
						"npc/zombie/zombie_voice_idle14.wav"
					},
				feeding_sounds = -- Feeding sounds for Animal.
					{
						"npc/zombie/zombie_pain1.wav",
						"npc/zombie/zombie_pain2.wav",
						"npc/zombie/zombie_pain3.wav",
						"npc/zombie/zombie_pain4.wav",
						"npc/zombie/zombie_pain5.wav",
						"npc/zombie/zombie_pain6.wav"
					},
				angry_sounds = -- Angry sounds for Animal.
					{
						"npc/zombie/zombie_alert1.wav",
						"npc/zombie/zombie_alert2.wav",
						"npc/zombie/zombie_alert3.wav"
					}
			},
			
		headcrab	=	
			{
				class = "headcrab",
				spawn_chance = 90,

				name = "Головний краб",
				
				models = {"models/headcrabclassic.mdl"},
				
				anim = {"idleb"},
				pos = Vector(0, 0, 4),
				spawn_function = function(entity)
					-- Feel free and let your inner coder come out here.
				end,
				
				start_size = 0.35,
				final_size = 0.95,
			
				time_togrow = 120,
				
				time_toeat = 150,
				time_todrink = 90,
				time_toprofit = 180,
				profit_function = function(entity)
					local poop = ents.Create("ba_product");
					poop:SetPos(entity:GetPos()+(entity:GetUp()*16));
					poop:SetAngles(entity:GetAngles());
					poop:Spawn();

					poop.baID = entity:EntIndex();
					
					poop:GetPhysicsObject():SetMass(10);
					
					poop:SetModel("models/props_phx/misc/egg.mdl");
					poop:SetColor(table.Random{Color(232, 222, 130), Color(192, 233, 131), Color(234, 172, 132), Color(138, 226, 217)});
					
					poop:PhysicsInit(SOLID_VPHYSICS);
					
					poop:SetMoveType(MOVETYPE_VPHYSICS);
					poop:SetSolid(SOLID_VPHYSICS);
					
					poop:EmitSound("physics/flesh/flesh_squishy_impact_hard3.wav", 70);
					poop:EmitSound("npc/headcrab/die1.wav", entity.pitch);
					
					poop:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 70, 90);
					poop:GetPhysicsObject():SetVelocity(entity:GetForward()*128);
					
					poop:SetNWString("name", "Яйце краба-стригуна");
					poop:SetNWString("color", "232,222,130");
					poop:SetNWInt("price", math.random(100, 600)*B_Animals_Config.Profit_Scale);
				end,
				
				start_damage = 1,
				final_damage = 20,
				
				start_pitch = 120,
				final_pitch = 100,

				bonus_multiplier = 2;
				bonus_eatdrink =
					{
						"Гнила яловичина",
						"Гниле куряче м'ясо",
						"Огірки консервовані",
						"Вишукане молоко",
						"Чистий протеїн",
						"Приголомшлива горілка"
					},
				idle_sounds =
					{
						"npc/headcrab/idle1.wav",
						"npc/headcrab/idle2.wav",
						"npc/headcrab/idle3.wav"
					},
				feeding_sounds =
					{
						"npc/headcrab/pain1.wav",
						"npc/headcrab/pain2.wav",
						"npc/headcrab/pain3.wav"
					},
				angry_sounds =
					{
						"npc/headcrab/attack1.wav",
						"npc/headcrab/attack2.wav",
						"npc/headcrab/attack3.wav"
					}
			},
			
		blackcrab	=	
			{
				class = "blackcrab",
				spawn_chance = 80,
				
				name = "Отруйний краб",
				
				models = {"models/headcrabblack.mdl"},
				
				anim = {"idlesniff", "idle01", "idle01fast", "idlesumo"},
				pos = Vector(0, 0, 4),
				spawn_function = function(entity)
					-- Feel free and let your inner coder come out here.
				end,
				
				start_size = 0.35,
				final_size = 0.85,
			
				time_togrow = 240,
				
				time_toeat = 200,
				time_todrink = 160,
				time_toprofit = 220,
				profit_function = function(entity)
					local poop = ents.Create("ba_product");
					poop:SetPos(entity:GetPos()+(entity:GetUp()*16));
					poop:SetAngles(entity:GetAngles());
					poop:Spawn();
					
					poop.baID = entity:EntIndex();	

					poop:GetPhysicsObject():SetMass(10);
					
					poop:SetModel("models/props_phx/misc/egg.mdl");
					poop:SetColor(table.Random{Color(74, 16, 74), Color(45, 16, 74), Color(74, 16, 45), Color(16, 74, 16)});
					
					poop:PhysicsInit(SOLID_VPHYSICS);
					
					poop:SetMoveType(MOVETYPE_VPHYSICS);
					poop:SetSolid(SOLID_VPHYSICS);
					
					poop:EmitSound("physics/flesh/flesh_squishy_impact_hard3.wav", 70);
					poop:EmitSound("npc/headcrab_poison/ph_wallpain"..math.random(1, 3)..".wav", entity.pitch);
					
					poop:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 70, 90);
					poop:GetPhysicsObject():SetVelocity(entity:GetForward()*128);
					
					poop:SetNWString("name", "Яйце чорного краба");
					poop:SetNWString("color", "74,16,74");
					poop:SetNWInt("price", math.random(200, 800)*B_Animals_Config.Profit_Scale);
				end,
				
				start_damage = 10,
				final_damage = 40,
				
				start_pitch = 120,
				final_pitch = 95,

				bonus_multiplier = 2;
				bonus_eatdrink =
					{
						"Canned Beans",
						"Свинина гнила",
						"Каламутна вода",
						"Чистий протеїн",
						"Персик",
						"Приголомшлива горілка"
					},
				idle_sounds =
					{
						"npc/headcrab_poison/ph_talk1.wav",
						"npc/headcrab_poison/ph_talk2.wav",
						"npc/headcrab_poison/ph_talk3.wav",
						"npc/headcrab_poison/ph_idle1.wav",
						"npc/headcrab_poison/ph_idle2.wav",
						"npc/headcrab_poison/ph_idle3.wav"
					},
				feeding_sounds =
					{
						"npc/headcrab_poison/ph_poisonbite1.wav",
						"npc/headcrab_poison/ph_poisonbite2.wav",
						"npc/headcrab_poison/ph_poisonbite3.wav"
					},
				angry_sounds =
					{
						"npc/headcrab_poison/ph_scream1.wav",
						"npc/headcrab_poison/ph_scream2.wav",
						"npc/headcrab_poison/ph_scream3.wav"
					}
			},
			
		antlion	=	
			{
				class = "antlion",
				spawn_chance = 90,
				
				name = "Антліон",
				
				models = {"models/AntLion.mdl"},
				
				anim = {"distractidle2", "distractidle3", "distractidle4", "idle"},
				pos = Vector(0, 0, 4),
				spawn_function = function(entity)
					entity.animal:SetSkin(math.random(0, 3));
				end,
				
				start_size = 0.10,
				final_size = 0.30,
			
				time_togrow = 200,
				
				time_toeat = 130,
				time_todrink = 80,
				time_toprofit = 150,
				profit_function = function(entity)
					local poop = ents.Create("ba_product");
					poop:SetPos(entity:GetPos()+(entity:GetUp()*16));
					poop:SetAngles(entity:GetAngles());
					poop:Spawn();

					poop.baID = entity:EntIndex();
					
					poop:GetPhysicsObject():SetMass(10);
					
					poop:SetModel("models/weapons/w_bugbait.mdl");
					
					poop:PhysicsInit(SOLID_VPHYSICS);
					
					poop:SetMoveType(MOVETYPE_VPHYSICS);
					poop:SetSolid(SOLID_VPHYSICS);
					
					poop:EmitSound("physics/flesh/flesh_squishy_impact_hard3.wav", 70);
					poop:EmitSound("npc/antlion/distract1.wav", entity.pitch);
					
					poop:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 70, 90);
					poop:GetPhysicsObject():SetVelocity(entity:GetForward()*128);
					
					poop:SetNWString("name", "Есенція мурашника");
					poop:SetNWString("color", "220,188,56");
					poop:SetNWInt("price", math.random(400, 600)*B_Animals_Config.Profit_Scale);
				end,
				
				start_damage = 10,
				final_damage = 40,
				
				start_pitch = 120,
				final_pitch = 95,

				bonus_multiplier = 2;
				bonus_eatdrink =
					{
						"Вишукане молоко",
						"Кавун",
						"Помаранчевий",
						"Світле пиво",
						"Чистий протеїн",
						"Приголомшлива горілка"
					},
				idle_sounds =
					{
						"npc/antlion/idle1.wav",
						"npc/antlion/idle2.wav",
						"npc/antlion/idle3.wav",
						"npc/antlion/idle4.wav",
						"npc/antlion/idle5.wav"
					},
				feeding_sounds =
					{
						"npc/antlion/pain1.wav",
						"npc/antlion/pain2.wav"
					},
				angry_sounds =
					{
						"npc/antlion/attack_single1.wav",
						"npc/antlion/attack_single2.wav",
						"npc/antlion/attack_single3.wav"
					}
			},
			
		ant_guard	=	
			{
				class = "ant_guard",
				spawn_chance = 80,

				name = "Антльонська гвардія",
				
				models = {"models/antlion_guard.mdl"},
				
				anim = {"alertidle", "idle"},
				pos = Vector(0, 0, 4),
				spawn_function = function(entity)
					-- Nothing here.
				end,
				
				start_size = 0.075,
				final_size = 0.25,
			
				time_togrow = 280,
				
				time_toeat = 140,
				time_todrink = 70,
				time_toprofit = 180,
				profit_function = function(entity)
					local poop = ents.Create("ba_product");
					poop:SetPos(entity:GetPos()+(entity:GetUp()*16));
					poop:SetAngles(entity:GetAngles());
					poop:Spawn();
					
					poop.baID = entity:EntIndex();	

					poop:GetPhysicsObject():SetMass(10);
					
					poop:SetModel("models/props_junk/watermelon01.mdl");
					poop:SetMaterial("models/flesh");
					poop:SetColor(Color(255, 255, 0));
					poop:GetPhysicsObject():SetMaterial("flesh");
					
					poop:PhysicsInit(SOLID_VPHYSICS);
					
					poop:SetMoveType(MOVETYPE_VPHYSICS);
					poop:SetSolid(SOLID_VPHYSICS);
					
					poop:EmitSound("physics/body/body_medium_break2.wav", 70);
					poop:EmitSound("physics/flesh/flesh_squishy_impact_hard3.wav", 70);
					
					poop:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 70, 90);
					poop:GetPhysicsObject():SetVelocity(entity:GetForward()*64);
					
					poop:SetNWString("name", "Надзвичайно Велика Сутність");
					poop:SetNWString("color", "255,162,56");
					poop:SetNWInt("price", math.random(900, 1200)*B_Animals_Config.Profit_Scale);
				end,
				
				start_damage = 40,
				final_damage = 60,
				
				start_pitch = 120,
				final_pitch = 95,

				bonus_multiplier = 2;
				bonus_eatdrink =
					{
						"Мокра локшина",
						"Canned Beans",
						"Китайська локшина",
						"Свіжа квасоля",
						"Чистий протеїн",
						"Приголомшлива горілка"
					},
				moan_sounds =
					{
						"npc/antlion_guard/growl_idle.wav"
					},
				idle_sounds =
					{
						"npc/antlion_guard/angry1.wav",
						"npc/antlion_guard/angry2.wav",
						"npc/antlion_guard/angry3.wav"
					},
				feeding_sounds =
					{
						"npc/antlion_guard/angry1.wav",
						"npc/antlion_guard/angry2.wav",
						"npc/antlion_guard/angry3.wav"
					},
				angry_sounds =
					{
						"npc/antlion_guard/angry1.wav",
						"npc/antlion_guard/angry2.wav",
						"npc/antlion_guard/angry3.wav"
					}
			},
			
		combine_ad	=	
			{
				class = "combine_ad",
				spawn_chance = 80,
				
				name = "Личинка комбайна",
				
				models = {"models/Advisor.mdl"},
				
				anim = {"idle01"},
				pos = Vector(0, 0, 24),
				spawn_function = function(entity)
					-- Nothing here.
				end,
				
				start_size = 0.075,
				final_size = 0.325,
			
				time_togrow = 260,
				
				time_toeat = 190,
				time_todrink = 140,
				time_toprofit = 170,
				profit_function = function(entity)
					local poop = ents.Create("ba_product");
					poop:SetPos(entity:GetPos()+(entity:GetUp()*16));
					poop:SetAngles(entity:GetAngles());
					poop:Spawn();
					
					poop.baID = entity:EntIndex();	

					poop:GetPhysicsObject():SetMass(10);
					
					poop:SetModel("models/gibs/shield_scanner_gib1.mdl");
					poop:SetMaterial("models/props_debris/building_template010a");
					poop:SetColor(Color(126, 193, 18));
					poop:GetPhysicsObject():SetMaterial("flesh");
					
					poop:PhysicsInit(SOLID_VPHYSICS);
					
					poop:SetMoveType(MOVETYPE_VPHYSICS);
					poop:SetSolid(SOLID_VPHYSICS);
					
					poop:EmitSound("physics/flesh/flesh_squishy_impact_hard3.wav", 70);
					
					poop:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 70, 90);
					poop:GetPhysicsObject():SetVelocity(entity:GetForward()*128);
					
					poop:SetNWString("name", "Какашки личинок");
					poop:SetNWString("color", "126,193,28");
					poop:SetNWInt("price", math.random(400, 500)*B_Animals_Config.Profit_Scale);
				end,
				
				start_damage = 10,
				final_damage = 25,
				
				start_pitch = 120,
				final_pitch = 110,

				bonus_multiplier = 3;
				bonus_eatdrink =
					{
						"Консервовані томати",
						"Canned Beans",
						"Лимонний сквош",
						"Чиста вода",
						"Чистий протеїн",
						"Приголомшлива горілка"
					},
				moan_sounds =
					{
						"npc/zombie_poison/pz_breathe_loop1.wav"
					},
				idle_sounds =
					{
						"npc/strider/creak1.wav",
						"npc/strider/creak2.wav",
						"npc/strider/creak3.wav",
						"npc/strider/creak4.wav"
					},
				feeding_sounds =
					{
						"npc/strider/striderx_alert2.wav",
						"npc/strider/striderx_alert4.wav",
						"npc/strider/striderx_alert5.wav",
						"npc/strider/striderx_alert6.wav"
					},
				angry_sounds =
					{
						"npc/strider/striderx_pain2.wav",
						"npc/strider/striderx_pain5.wav",
						"npc/strider/striderx_pain7.wav",
						"npc/strider/striderx_pain8.wav"
					}
			},
			
		big_pigeon	=	
			{
				class = "big_pigeon",
				spawn_chance = 80,
				
				name = "Мутований голуб",
				
				models = {"models/pigeon.mdl"},
				
				anim = {"idle01"},
				pos = Vector(10, 0, 4),
				spawn_function = function(entity)
					-- Nothing here.
				end,
				
				start_size = 0.5,
				final_size = 3.325,
			
				time_togrow = 210,
				
				time_toeat = 110,
				time_todrink = 65,
				time_toprofit = 170,
				profit_function = function(entity)
					local poop = ents.Create("ba_product");
					poop:SetPos(entity:GetPos()+(entity:GetUp()*16));
					poop:SetAngles(entity:GetAngles());
					poop:Spawn();
					
					poop.baID = entity:EntIndex();	

					poop:GetPhysicsObject():SetMass(10);
					
					poop:SetModel("models/props_junk/watermelon01.mdl");
					poop:SetMaterial("models/props_c17/metalladder003");
					poop:GetPhysicsObject():SetMaterial("flesh");
					
					poop:PhysicsInit(SOLID_VPHYSICS);
					
					poop:SetMoveType(MOVETYPE_VPHYSICS);
					poop:SetSolid(SOLID_VPHYSICS);
					
					poop:EmitSound("physics/body/body_medium_break2.wav", 70);
					poop:EmitSound("physics/flesh/flesh_squishy_impact_hard3.wav", 70);
					
					poop:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 70, 90);
					poop:GetPhysicsObject():SetVelocity(entity:GetForward()*128);
					
					poop:SetNWString("name", "Голубине яйце");
					poop:SetNWString("color", "126,155,175");
					poop:SetNWInt("price", math.random(600, 900)*B_Animals_Config.Profit_Scale);
				end,
				
				start_damage = 20,
				final_damage = 50,
				
				start_pitch = 100,
				final_pitch = 60,

				bonus_multiplier = 2;
				bonus_eatdrink =
					{
						"Кисле молоко",
						"Canned Beans",
						"Мокра локшина",
						"Чистий протеїн",
						"Приголомшлива горілка",
						"Свіжа квасоля"
					},
				idle_sounds =
					{
						"ambient/creatures/pigeon_idle1.wav",
						"ambient/creatures/pigeon_idle2.wav",
						"ambient/creatures/pigeon_idle3.wav",
						"ambient/creatures/pigeon_idle4.wav"
					},
				feeding_sounds =
					{
						"ambient/creatures/pigeon_idle1.wav",
						"ambient/creatures/pigeon_idle2.wav",
						"ambient/creatures/pigeon_idle3.wav",
						"ambient/creatures/pigeon_idle4.wav"
					},
				angry_sounds =
					{
						"ambient/creatures/pigeon_idle1.wav",
						"ambient/creatures/pigeon_idle2.wav",
						"ambient/creatures/pigeon_idle3.wav",
						"ambient/creatures/pigeon_idle4.wav"
					}
			},
			
		big_crow	=	
			{
				class = "big_crow",
				spawn_chance = 80,
				
				name = "Мутована ворона",
				
				models = {"models/crow.mdl"},
				
				anim = {"idle01"},
				pos = Vector(10, 0, 4),
				spawn_function = function(entity)
					-- Nothing here.
				end,
				
				start_size = 0.5,
				final_size = 3.225,
			
				time_togrow = 260,
				
				time_toeat = 100,
				time_todrink = 110,
				time_toprofit = 190,
				profit_function = function(entity)
					local poop = ents.Create("ba_product");
					poop:SetPos(entity:GetPos()+(entity:GetUp()*16));
					poop:SetAngles(entity:GetAngles());
					poop:Spawn();
					
					poop.baID = entity:EntIndex();

					poop:GetPhysicsObject():SetMass(10);
					
					poop:SetModel("models/props_junk/watermelon01.mdl");
					poop:SetMaterial("models/props_c17/metalladder003");
					poop:SetColor(Color(133, 91, 91));
					poop:GetPhysicsObject():SetMaterial("flesh");
					
					poop:PhysicsInit(SOLID_VPHYSICS);
					
					poop:SetMoveType(MOVETYPE_VPHYSICS);
					poop:SetSolid(SOLID_VPHYSICS);
					
					poop:EmitSound("npc/crow/pain"..math.random(1, 2)..".wav", 70);
					poop:EmitSound("physics/flesh/flesh_squishy_impact_hard3.wav", 70);
					
					poop:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 70, 90);
					poop:GetPhysicsObject():SetVelocity(entity:GetForward()*128);
					
					poop:SetNWString("name", "Вороняче яйце");
					poop:SetNWString("color", "133,91,91");
					poop:SetNWInt("price", math.random(800, 1100)*B_Animals_Config.Profit_Scale);
				end,
				
				start_damage = 20,
				final_damage = 50,
				
				start_pitch = 100,
				final_pitch = 60,

				bonus_multiplier = 2;
				bonus_eatdrink =
					{
						"Темне пиво",
						"Віскі",
						"Мокра локшина",
						"Чистий протеїн",
						"Свіжа квасоля",
						"Приголомшлива горілка"
					},
				idle_sounds =
					{
						"npc/crow/alert1.wav",
						"npc/crow/alert2.wav",
						"npc/crow/alert3.wav"
					},
				feeding_sounds =
					{
						"npc/crow/pain1.wav",
						"npc/crow/pain2.wav"
					},
				angry_sounds =
					{
						"npc/crow/idle1.wav",
						"npc/crow/idle2.wav",
						"npc/crow/idle3.wav"
					}
			},

		flesh_pigeon	=	
			{
				class = "flesh_pigeon",
				spawn_chance = 80,
				
				name = "М'ясистий голуб",
				
				models = {"models/pigeon.mdl"},
				
				anim = {"idle01"},
				pos = Vector(10, 0, 4),
				spawn_function = function(entity)
					-- Nothing here.
					entity.animal:SetMaterial("models/flesh");
					entity.animal:SetColor(Color(128, 128, 0));
				end,
				
				start_size = 0.35,
				final_size = 3.125,
			
				time_togrow = 360,
				
				time_toeat = 260,
				time_todrink = 220,
				time_toprofit = 180,
				profit_function = function(entity)
					local poop = ents.Create("ba_product");
					poop:SetPos(entity:GetPos()+(entity:GetUp()*16));
					poop:SetAngles(entity:GetAngles());
					poop:Spawn();
					
					poop.baID = entity:EntIndex();	

					poop:GetPhysicsObject():SetMass(10);
					
					poop:SetModel("models/props_junk/watermelon01.mdl");
					poop:SetMaterial("models/flesh");
					poop:GetPhysicsObject():SetMaterial("flesh");

					
					poop:PhysicsInit(SOLID_VPHYSICS);
					
					poop:SetMoveType(MOVETYPE_VPHYSICS);
					poop:SetSolid(SOLID_VPHYSICS);
					
					poop:EmitSound("physics/body/body_medium_break2.wav", 70);
					poop:EmitSound("physics/flesh/flesh_squishy_impact_hard3.wav", 70);
					
					poop:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 70, 90);
					poop:GetPhysicsObject():SetVelocity(entity:GetForward()*128);
					
					poop:SetNWString("name", "Яйце з м'ясом");
					poop:SetNWString("color", "176,39,39");
					poop:SetNWInt("price", math.random(1200, 1500)*B_Animals_Config.Profit_Scale);
				end,
				
				start_damage = 40,
				final_damage = 90,
				
				start_pitch = 80,
				final_pitch = 60,

				bonus_multiplier = 2;
				bonus_eatdrink =
					{
						"Приголомшлива горілка",
						"Свіжа квасоля"
					},
				idle_sounds =
					{
						"ambient/creatures/pigeon_idle1.wav",
						"ambient/creatures/pigeon_idle2.wav",
						"ambient/creatures/pigeon_idle3.wav",
						"ambient/creatures/pigeon_idle4.wav"
					},
				feeding_sounds =
					{
						"ambient/creatures/pigeon_idle1.wav",
						"ambient/creatures/pigeon_idle2.wav",
						"ambient/creatures/pigeon_idle3.wav",
						"ambient/creatures/pigeon_idle4.wav"
					},
				angry_sounds =
					{
						"ambient/creatures/pigeon_idle1.wav",
						"ambient/creatures/pigeon_idle2.wav",
						"ambient/creatures/pigeon_idle3.wav",
						"ambient/creatures/pigeon_idle4.wav"
					}
			},

		fast_zombie	=	
			{
				class = "fast_zombie",
				spawn_chance = 60,
				
				name = "Швидкий зомбі",
				
				models = {"models/Zombie/Fast.mdl"},
				
				anim = {"idle_angry"},
				pos = Vector(4, 0, 4),
				spawn_function = function(entity)
					-- Nothing here.

					entity.animal:SetBodygroup(1, 1);
					entity.animal:EmitSound("npc/fast_zombie/fz_scream1.wav", 160);
				end,
				
				start_size = 0.25,
				final_size = 0.425,
			
				time_togrow = 230,
				
				time_toeat = 190,
				time_todrink = 110,
				time_toprofit = 180,
				profit_function = function(entity)
					local poop = ents.Create("ba_product");
					poop:SetPos(entity:GetPos()+(entity:GetUp()*16));
					poop:SetAngles(entity:GetAngles());
					poop:Spawn();
					
					poop.baID = entity:EntIndex();

					poop:GetPhysicsObject():SetMass(10);
					
					poop:SetModel("models/props_c17/doll01.mdl");
					poop:SetMaterial("models/flesh");
					poop:SetColor(Color(128, 255, 128));
					poop:GetPhysicsObject():SetMaterial("flesh");

					poop:PhysicsInit(SOLID_VPHYSICS);
					
					poop:SetMoveType(MOVETYPE_VPHYSICS);
					poop:SetSolid(SOLID_VPHYSICS);
					
					poop:EmitSound("npc/fast_zombie/claw_strike"..math.random(1, 3)..".wav", 70);
					poop:EmitSound("physics/flesh/flesh_squishy_impact_hard3.wav", 70);
					
					poop:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 70, 90);
					poop:GetPhysicsObject():SetVelocity(entity:GetForward()*128);
					
					poop:SetNWString("name", "Гнилий плід");
					poop:SetNWString("color", "91,12,15");
					poop:SetNWInt("price", math.random(900, 1600)*B_Animals_Config.Profit_Scale);
				end,
				
				start_damage = 40,
				final_damage = 90,
				
				start_pitch = 160,
				final_pitch = 120,

				bonus_multiplier = 2;
				bonus_eatdrink =
					{
						"Приголомшлива горілка",
						"Свіжий горошок",
						"Старий добрий ром"
					},
				idle_sounds =
					{
						"npc/fast_zombie/idle1.wav",
						"npc/fast_zombie/idle2.wav",
						"npc/fast_zombie/idle3.wav"
					},
				moan_sounds =
					{
						"npc/fast_zombie/breathe_loop1.wav"
					},
				feeding_sounds =
					{
						"npc/fast_zombie/wake1.wav"
					},
				angry_sounds =
					{
						"npc/fast_zombie/fz_frenzy1.wav"
					}
			},

		half_pirate	=	
			{
				class = "half_pirate",
				spawn_chance = 40,
				
				name = "Половина пірата",
				
				models = {"models/Zombie/Classic_torso.mdl"},
				
				anim = {"idle01", "idle02"},
				pos = Vector(4, 0, 4),
				spawn_function = function(entity)
					-- Nothing here.

					entity.animal:SetBodygroup(1, 1);
					entity.animal:SetColor(Color(166, 136, 66));
				end,
				
				start_size = 0.25,
				final_size = 0.765,
			
				time_togrow = 290,
				
				time_toeat = 190,
				time_todrink = 120,
				time_toprofit = 220,
				profit_function = function(entity)
					local chance = math.random(1, 10);
					if (chance < 10) then
						local poop = ents.Create("ba_product");
						poop:SetPos(entity:GetPos()+(entity:GetUp()*16));
						poop:SetAngles(entity:GetAngles());
						poop:Spawn();
						
						poop.baID = entity:EntIndex();

						poop:GetPhysicsObject():SetMass(10);
						
						poop:SetModel("models/props/cs_militia/bottle0"..math.random(1, 3)..".mdl");
						poop:GetPhysicsObject():SetMaterial("flesh");

						poop:PhysicsInit(SOLID_VPHYSICS);
						
						poop:SetMoveType(MOVETYPE_VPHYSICS);
						poop:SetSolid(SOLID_VPHYSICS);
						
						poop:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 70, 90);
						poop:GetPhysicsObject():SetVelocity(entity:GetForward()*128);
					
						poop:SetNWString("name", "Старий добрий ром");
						poop:SetNWString("color", "141,89,59");
						poop:SetNWInt("price", math.random(900, 1200)*B_Animals_Config.Profit_Scale);
					else
						local poop = ents.Create("ba_product");
						poop:SetPos(entity:GetPos()+(entity:GetUp()*16));
						poop:SetAngles(entity:GetAngles());
						poop:Spawn();
						
						poop.baID = entity:EntIndex();

						poop:GetPhysicsObject():SetMass(10);
						
						poop:SetModel("models/gibs/manhack_gib04.mdl");

						poop:SetMaterial("models/shiny");
						poop:SetColor(Color(243, 184, 45));

						poop:GetPhysicsObject():SetMaterial("metal");

						poop:PhysicsInit(SOLID_VPHYSICS);
						
						poop:SetMoveType(MOVETYPE_VPHYSICS);
						poop:SetSolid(SOLID_VPHYSICS);
						
						poop:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 70, 90);
						poop:GetPhysicsObject():SetVelocity(entity:GetForward()*128);
					
						poop:SetNWString("name", "Золотий самородок");
						poop:SetNWString("color", "243,184,45");
						poop:SetNWInt("price", math.random(2000, 2400)*B_Animals_Config.Profit_Scale);
					end;
				end,
				
				start_damage = 80,
				final_damage = 160,
				
				start_pitch = 120,
				final_pitch = 80,

				bonus_multiplier = 2;
				bonus_eatdrink =
					{
						"Приголомшлива горілка",
						"Свіжий горошок",
						"Старий добрий ром"
					},
				idle_sounds =
					{
						"npc/zombie_poison/pz_idle3.wav",
						"npc/zombie_poison/pz_idle4.wav"
					},
				moan_sounds =
					{
						"npc/zombie_poison/pz_breathe_loop2.wav"
					},
				feeding_sounds =
					{
						"npc/zombie_poison/pz_pain1.wav",
						"npc/zombie_poison/pz_pain2.wav",
						"npc/zombie_poison/pz_pain3.wav"
					},
				angry_sounds =
					{
						"npc/zombie_poison/pz_warn1.wav",
						"npc/zombie_poison/pz_warn2.wav"
					}
			},

		flesher	=	
			{
				class = "flesher",
				spawn_chance = 40,
				
				name = "Краб м'ясний",
				
				models = {"models/Lamarr.mdl"},
				
				anim = {"sleeploop"},
				pos = Vector(18, 9, 4),
				spawn_function = function(entity)
					entity.animal:SetAngles(Angle(0, -25, 0));

					entity.animal:SetMaterial("models/flesh");
					entity.animal:SetColor(Color(166, 136, 66));
				end,
				
				start_size = 0.25,
				final_size = 1.65,
			
				time_togrow = 210,
				
				time_toeat = 110,
				time_todrink = 80,
				time_toprofit = 170,
				profit_function = function(entity)
					local chance = math.random(1, 10);
					if (chance < 10) then
						local poop = ents.Create("ba_product");
						poop:SetPos(entity:GetPos()+(entity:GetForward()*8)+(entity:GetUp()*8));
						poop:SetAngles(entity:GetAngles());
						poop:Spawn();
						
						poop.baID = entity:EntIndex();

						poop:GetPhysicsObject():SetMass(1);
						
						poop:SetModel("models/props_phx/misc/egg.mdl");
						poop:SetMaterial("models/flesh");
						poop:GetPhysicsObject():SetMaterial("flesh");
						
						poop:PhysicsInit(SOLID_VPHYSICS);
						
						poop:SetMoveType(MOVETYPE_VPHYSICS);
						poop:SetSolid(SOLID_VPHYSICS);
						
						poop:EmitSound("physics/body/body_medium_break2.wav", 70);
						poop:EmitSound("physics/flesh/flesh_squishy_impact_hard3.wav", 70);
						
						poop:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 70, 90);
						poop:GetPhysicsObject():SetVelocity(entity:GetForward()*128);
						
						poop:SetNWString("name", "Яйце краба-стригуна");
						poop:SetNWString("color", "178,22,22");
						poop:SetNWInt("price", math.random(900, 1200)*B_Animals_Config.Profit_Scale);
					else
						local poop = ents.Create("ba_product");
						poop:SetPos(entity:GetPos()+(entity:GetForward()*8)+(entity:GetUp()*8));
						poop:SetAngles(entity:GetAngles());
						poop:Spawn();
						
						poop.baID = entity:EntIndex();

						poop:GetPhysicsObject():SetMass(10);
						
						poop:SetModel("models/props_junk/watermelon01.mdl");
						poop:SetMaterial("models/flesh");
						poop:GetPhysicsObject():SetMaterial("flesh");
						
						poop:PhysicsInit(SOLID_VPHYSICS);
						
						poop:SetMoveType(MOVETYPE_VPHYSICS);
						poop:SetSolid(SOLID_VPHYSICS);
						
						poop:EmitSound("physics/body/body_medium_break2.wav", 70);
						poop:EmitSound("physics/flesh/flesh_squishy_impact_hard3.wav", 70);
						
						poop:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 70, 90);
						poop:GetPhysicsObject():SetVelocity(entity:GetForward()*64);
						
						poop:SetNWString("name", "Велике яйце м'ясного краба");
						poop:SetNWString("color", "178,22,22");
						poop:SetNWInt("price", math.random(2200, 2400)*B_Animals_Config.Profit_Scale);
					end;
				end,
				
				start_damage = 60,
				final_damage = 120,
				
				start_pitch = 120,
				final_pitch = 130,

				bonus_multiplier = 2;
				bonus_eatdrink =
					{
						"Приголомшлива горілка",
						"Свіжий горошок",
						"Старий добрий ром"
					},
				moan_sounds =
					{
						"npc/zombie_poison/pz_breathe_loop2.wav"
					}
			}
	}


--PATH addons/battlepass/lua/autorun/battlepass_load.lua:
BATTLEPASS = {}
local number = 2
BATTLEPASS.Materials = {
	money1 = 'battlepass/all/money1.png',
	money2 = 'battlepass/all/money2.png',
	money3 = 'battlepass/all/money3.png',
	case = 'battlepass/all/case.png',
	--
	postdraw = Material('battlepass/' .. number .. '/postdraw.png'),
	bord = Material('battlepass/' .. number .. '/bord.png'),
	name = Material('battlepass/' .. number .. '/name.png'),
	bgpass = Material('battlepass/' .. number .. '/bgpass.png'),
	bgchallenge = Material('battlepass/' .. number .. '/bgchallenge.png'),
	bordinfo = Material('battlepass/' .. number .. '/bordinfo.png'),
	buybtn = Material('battlepass/' .. number .. '/buybtn.png'),
	bpoverhailfree = Material('battlepass/' .. number .. '/bpoverhailfree.png'),
	bpoverhailpremium = Material('battlepass/' .. number .. '/bpoverhailpremium.png'),
	bpoverhail = Material('battlepass/' .. number .. '/bpoverhail.png'),
	challenge = Material('battlepass/' .. number .. '/challenge.png'),
	freepropusk = Material('battlepass/' .. number .. '/freepropusk.png'),
	premiumpropusk = Material('battlepass/' .. number .. '/premiumpropusk.png'),
	--
	new1 = Material('battlepass/' .. number .. '/new1.png'),
	new2 = Material('battlepass/' .. number .. '/new2.png'),
	new3 = Material('battlepass/' .. number .. '/temp_season.png'),
}

BATTLEPASS.Colors = {
	black = Color(15, 17, 18),
	yellow = Color(226, 180, 69),
	yellow2 = Color(255, 204, 0),
	pink = Color(254, 94, 233),
	salat = Color(255, 255, 0),
	orange = Color(237, 198, 108),
	--
	zoloto1 = Color(255, 246, 77),
	zoloto2 = Color(126, 129, 5),
}

BATTLEPASS.Season = 6
BATTLEPASS.TimeCountdown = 1746825965 -- https://www.unixtimestamp.com/ or false
BATTLEPASS.Database = {}
BATTLEPASS.Challenges = {}
BATTLEPASS.ChallengeCategories = {}
BATTLEPASS.Rewards = {}
BATTLEPASS.ActiveChallenges = {}
if CLIENT then
	function W(w)
		return ScrW() * (w / 1920)
	end

	function H(h)
		return ScrH() * (h / 1080)
	end

	function DrawFlexText(colors, font, x, y)
		surface.SetFont(font)
		surface.SetTextPos(x, y)
		for k, v in ipairs(colors) do
			local col = v[2] or color_white
			surface.SetTextColor(col.r or 255, col.g or 255, col.b or 255, col.a or 255)
			surface.DrawText(tostring(v[1]) .. (not v[3] and ' ' or ''))
		end
	end

	function draw.Icon(x, y, w, h, m, c)
		surface.SetDrawColor(c or color_white)
		surface.SetMaterial(m or Material('icon16/user_go.png'))
		surface.DrawTexturedRect(x, y, w, h)
	end

	local function font()
		surface.CreateFont('font_bpcategory', {
			font = 'Benzin-Bold',
			size = W(22),
			weight = 400,
			extended = true,
		})

		surface.CreateFont('font_bplevel', {
			font = 'Benzin-Regular',
			size = W(22),
			weight = 400,
			extended = true,
		})

		surface.CreateFont('font_bpname', {
			font = 'Golos Text',
			size = W(19),
			weight = 600,
			extended = true,
		})

		surface.CreateFont('font_bpnameD', {
			font = 'Golos Text',
			size = W(19),
			weight = 400,
			extended = true,
		})

		surface.CreateFont('font_faq', {
			font = 'Golos Text',
			size = W(18),
			weight = 600,
			extended = true,
		})

		surface.CreateFont('font_bplevelmini', {
			font = 'Golos Text',
			size = W(14),
			weight = 600,
			extended = true,
		})

		-- surface.CreateFont('font_buylvltext', {
		-- 	font = 'Golos Text',
		-- 	size = W(12),
		-- 	weight = 600,
		-- 	extended = true,
		-- })
		surface.CreateFont('font_number', {
			font = 'Benzin-Bold',
			size = W(33),
			weight = 400,
			extended = true,
		})

		surface.CreateFont('font_season', {
			font = 'Bob Sponge',
			size = W(17),
			weight = 400,
			extended = true,
		})

		surface.CreateFont('font_xp', {
			font = 'Benzin-Bold',
			size = W(22),
			weight = 400,
			extended = true,
		})
		surface.CreateFont('font_numberslot', {
			font = 'Bob Sponge',
			size = W(26),
			weight = 400
		})

		-- new font
		-- surface.CreateFont('font_xp', {
		-- 	font = 'Gang of Three[RUS by Daymarius]',
		-- 	size = W(22),
		-- 	weight = 400,
		-- 	extended = true,
		-- })

		surface.CreateFont('font_buylvltext', {
			font = 'Gang of Three[RUS by Daymarius]',
			size = W(16),
			weight = 600,
			extended = true,
		})
	end

	hook.Add('OnScreenSizeChanged', 'FixFontBP', font)
	font()
end

local function IncludeClient(str)
	if SERVER then
		AddCSLuaFile("battlepass/" .. str .. ".lua")
	elseif CLIENT then
		include("battlepass/" .. str .. ".lua")
	end
end

local function IncludeServer(str)
	if SERVER then include("battlepass/" .. str .. ".lua") end
end

local function IncludeShared(str)
	IncludeClient(str)
	IncludeServer(str)
end

local function Load()
	BATTLEPASS.FinishedLoading = nil
	IncludeShared("shared/helper")
	IncludeShared("shared/challenges")
	for i, v in pairs(file.Find("battlepass/challenges/*.lua", "LUA")) do
		IncludeShared("challenges/" .. v:sub(1, v:len() - 4))
	end

	IncludeShared("shared/language")
	for i, v in pairs(file.Find("battlepass/languages/*.lua", "LUA")) do
		IncludeShared("languages/" .. v:sub(1, v:len() - 4))
	end

	IncludeShared("shared/rewards")
	for i, v in pairs(file.Find("battlepass/rewards/*.lua", "LUA")) do
		IncludeShared("rewards/" .. v:sub(1, v:len() - 4))
	end

	IncludeShared("shared/bp_builder")
	IncludeShared("configuration/config")
	IncludeServer("configuration/mysql")
	-- Include Database elements
	IncludeServer("database/sql")
	IncludeServer("database/mysqlite")
	-- Include UI elements
	IncludeClient("ui/button")
	IncludeClient("ui/tooltip")
	-- Include script UI
	IncludeClient("menu/navbar")
	IncludeClient("menu/battlepass")
	IncludeClient("menu/challenges")
	IncludeClient("menu/main")
	-- Include shared elements
	-- Include networking
	IncludeClient("network/client")
	IncludeServer("network/server")
	-- Include essentials
	IncludeServer("server/player")
	IncludeShared("server/perm_vars")
	IncludeShared("server/perm_weps")
	BATTLEPASS.FinishedLoading = true
	hook.Run("BATTLEPASS.FinishedLoading")
	if SERVER then
		hook.Add("Think", "BATTLEPASS.InitializeMySQL", function()
			timer.Simple(0, function() XBPMySQLite.initialize(BATTLEPASS.Config.MySQL) end)
			hook.Remove("Think", "BATTLEPASS.InitializeMySQL")
		end)
	end
end

if XeninUI then
	Load()
else
	hook.Add("XeninUI.Loaded", "BattlePass", Load)
end
--PATH addons/__main_only_1st/lua/autorun/bleach_grimmjow.lua:
player_manager.AddValidModel( "Bleach Grimmjow", "models/Grimmjow/Bleach/rstar/Grimmjow/Grimmjow.mdl" )
player_manager.AddValidHands( "Bleach Grimmjow", "models/Grimmjow/Bleach/rstar/Grimmjow/arms/Grimmjow_arms.mdl", 0, "00000000" )
--PATH addons/__main/lua/autorun/cf_beast_pack.lua:
local tbl = { "Magnum.ClipOut", "weapons/deagle_beast/de_clipout.wav", "Magnum.ClipIn", "weapons/deagle_beast/de_clipin.wav", "Magnum.SlideForward", "weapons/deagle_beast/de_slideback.wav", "Magnum.Deploy", "weapons/deagle_beast/de_deploy.wav", "Rifle.FullAutoButton", "weapons/m4a1_beast/rifle_fullautobutton_1.wav", "Rifle.ClipOut", "weapons/m4a1_beast/rifle_clip_out_1.wav", "Rifle.Clipin", "weapons/m4a1_beast/rifle_clip_in_1.wav", "Rifle.ClipLocked", "weapons/m4a1_beast/rifle_clip_locked_1.wav", "AK47.SlideBack", "weapons/ak47_beast/rifle_slideback.wav", "AK47.ClipIn", "weapons/ak47_beast/rifle_clip_in_1.wav", "AK47.SlideForward", "weapons/ak47_beast/rifle_slideforward.wav", "AK47.Deploy", "weapons/ak47_beast/rifle_deploy_1.wav" }
for i = 1, #tbl, 2 do
	sound.Add( {
		name = tbl[i],
		channel = CHAN_WEAPON,
		volume = 1.0,
		soundlevel = 80,
		sound = tbl[i + 1]
	} )
end
--PATH addons/_drones/lua/autorun/dronesrewrite.lua:
if SERVER then
	AddCSLuaFile("dronesrewrite/main.lua")
end

include("dronesrewrite/main.lua")


DRONES_ACCESS = {
	["STEAM_0:0:629004634"] = true,
	["STEAM_0:0:566244461"] = true
}
--PATH addons/_drones/lua/dronesrewrite/client/hud.lua:
hook.Add("HUDPaint", "dronesrewrite_hud", function()
	local ply = LocalPlayer()
	local drone = ply:GetNWEntity("DronesRewriteDrone")

	if drone:IsValid() then
		if drone:DoCamEffects() and drone.HUD_shouldDrawHud then
			if DRONES_REWRITE.HUD[drone:GetHUDName()] then DRONES_REWRITE.HUD[drone:GetHUDName()](drone) end
		end

		if drone.HUD_shouldDrawCrosshair and drone:GetNWBool("ThirdPerson") then
			local pos = drone:GetCameraTraceLine().HitPos:ToScreen()
			local x, y = pos.x, pos.y

			surface.SetDrawColor(Color(255, 255, 255))
			surface.DrawLine(x - 5, y - 5, x - 10, y - 10)
			surface.DrawLine(x + 5, y - 5, x + 10, y - 10)
			surface.SetDrawColor(Color(0, 0, 0))
			surface.DrawLine(x - 5, y + 5, x - 10, y + 10)
			surface.DrawLine(x + 5, y + 5, x + 10, y + 10)

			surface.SetMaterial(Material("stuff/crosshair1"))
			surface.SetDrawColor(Color(255, 255, 255, 64))
			surface.DrawTexturedRect(x - 16, y - 16, 32, 32)
		end

		drone:CallHook("HUD")
	end
end)

local no_drawing = {
	CHudHealth = true,
	CHudBattery = true,
	CHudCrosshair = true,
	CHudAmmo = true,
	CHudSecondaryAmmo = true
}

hook.Add("HUDShouldDraw", "dronesrewrite_nohuddraw", function(name)
	local ply = LocalPlayer()
	if not IsValid(ply) then return false end

	local drone = ply:GetNWEntity("DronesRewriteDrone")
	if IsValid(drone) then
		if no_drawing[name] then return false end
	end
end)
--PATH addons/_drones/lua/dronesrewrite/client/hud/scifi.lua:
local oldWep
local wepChanged
local oldHealth = 0

DRONES_REWRITE.HUD["Sci Fi 2"] = function(drone)
	local shouldDrawCrosshair = drone.HUD_shouldDrawCrosshair
	local shouldDrawHealth = drone.HUD_shouldDrawHealth
	local shouldDrawTargets = drone.HUD_shouldDrawTargets
	local shouldDrawFuel = drone.HUD_shouldDrawFuel
	local shouldDetectDamage = drone.HUD_shouldDetectDamage
	local shouldDrawCenter = drone.HUD_shouldDrawCenter
	local shouldDrawWeps = drone.HUD_shouldDrawWeps

	local x, y = ScrW(), ScrH()
	local pos = (drone:GetForward() * 10 + drone:LocalToWorld(drone.FirstPersonCam_pos)):ToScreen()

	--surface.SetDrawColor(Color(0, 255, 255))
	--surface.DrawOutlinedRect(50, 50, x - 100, y - 100)

	surface.SetDrawColor(Color(0, 255, 255, 50))

	for i = -2, 2 do
		surface.DrawLine(330, pos.y + i * 2, pos.x - 420, pos.y + i * 2)
		surface.DrawLine(pos.x + 420, pos.y + i * 2, ScrW() - 50, pos.y + i * 2)
	end

	if shouldDrawCrosshair then
		surface.SetMaterial(Material("effects/select_ring"))
		surface.SetDrawColor(Color(0, 255, 255, 100))
		surface.DrawTexturedRect(x * 0.5 - 20, y * 0.5 - 20, 40, 40)
		surface.DrawTexturedRect(x * 0.5 - 2, y * 0.5 - 2, 4, 4)
	end

	if drone:GetHealth() <= drone:GetDefaultHealth() / 5 then
		surface.SetMaterial(Material("stuff/console/broken4"))
		surface.SetDrawColor(Color(255, 255, 255, math.Clamp(255 - (drone:GetHealth() / drone:GetDefaultHealth()) * 255, 0, 50)))
		surface.DrawTexturedRect(0, 0, x, y)
	end

	if shouldDrawCenter then 
		surface.SetMaterial(Material("stuff/target"))
		surface.SetDrawColor(Color(0, 255, 255, 100))
		surface.DrawTexturedRect(pos.x - 40, pos.y - 40, 80, 80)

		surface.DrawCircle(pos.x, pos.y, 200, Color(0, 255, 255, 50))
		surface.DrawCircle(pos.x, pos.y, 400, Color(0, 255, 255, 150))
		surface.DrawCircle(pos.x, pos.y, 410, Color(0, 255, 255, 150))
		surface.DrawCircle(pos.x, pos.y, 420, Color(0, 255, 255, 250))

		local pos = (drone:LocalToWorld(drone.FirstPersonCam_pos) - drone:GetUp() * 10):ToScreen()
		surface.DrawCircle(pos.x, pos.y, 20, Color(0, 255, 255, 70))
		surface.DrawCircle(pos.x, pos.y, 22, Color(0, 255, 255, 50))
		surface.DrawCircle(pos.x, pos.y, 200, Color(0, 255, 255, 50))
		surface.DrawCircle(pos.x, pos.y, 400, Color(0, 255, 255, 150))
		surface.DrawCircle(pos.x, pos.y, 410, Color(0, 255, 255, 150))
		surface.DrawCircle(pos.x, pos.y, 420, Color(0, 255, 255, 250))
	end

	if shouldDrawHealth then
		local hp = (drone:GetHealth() / drone:GetDefaultHealth()) * 200
		surface.SetDrawColor(Color(255, 255, 255, 20))
		surface.DrawRect(100, ScrH() - 104, 200, 20)
		surface.SetDrawColor(Color(0, 255, 255, 100))
		surface.DrawRect(100, ScrH() - 104, hp, 20)
		surface.SetDrawColor(Color(0, 0, 0, 100))
		surface.DrawOutlinedRect(100, ScrH() - 104, 200, 20)

		draw.SimpleText("HP", "DronesRewrite_font2", 310, ScrH() - 100, Color(255, 255, 255, 100))
	end

	if shouldDrawFuel then
		local fuel = (drone:GetFuel() / drone.MaxFuel) * 200
		surface.SetDrawColor(Color(255, 255, 255, 20))
		surface.DrawRect(100, ScrH() - 64, 200, 20)
		surface.SetDrawColor(Color(255, 125, 0, 100))
		surface.DrawRect(100, ScrH() - 64, fuel, 20)
		surface.SetDrawColor(Color(0, 0, 0, 100))
		surface.DrawOutlinedRect(100, ScrH() - 64, 200, 20)

		draw.SimpleText("Fuel", "DronesRewrite_font2", 310, ScrH() - 60, Color(255, 255, 255, 100))
	end

	if shouldDrawTargets then
		local tr = drone:GetCameraTraceLine(nil, Vector(-32, -32, 0), Vector(32, 32, 0))

		for k, v in ipairs(ents.FindInSphere(tr.HitPos, 500)) do
			if v:IsPlayer() or v:IsNPC() or v.IS_DRONE then
				local pos = v:GetPos()
				local bone = v:LookupBone("ValveBiped.Bip01_Head1")
				if bone then pos = v:GetBonePosition(bone) end

				local size = (64 - math.Clamp(drone:GetPos():Distance(pos) * 0.04, 20, 64))
				pos = pos:ToScreen()

				surface.SetMaterial(Material("stuff/center"))
				surface.SetDrawColor(Color(0, 155, 255, math.abs(math.sin(CurTime() * 2)) * 200))
				surface.DrawTexturedRectRotated(pos.x, pos.y, size, size, CurTime() * math.sin(CurTime() * 2) * 2)

				--surface.DrawLine(pos.x + 20, pos.y - size * 0.3, pos.x + 120, pos.y - size * 0.3)
				draw.SimpleText(v:GetClass(), "DronesRewrite_font4", pos.x + 25, pos.y - 10, Color(0, 0, 255, 130))
			end
		end
	end

	if shouldDrawWeps then
		local curWep = drone:GetNWString("CurrentWeapon")

		if oldWep != curWep then
			wepChanged = true

			timer.Create("dronesrewrite_changedwep", 3, 1, function() wepChanged = false end)
		end

		if wepChanged then
			draw.SimpleText("CURRENT WEAPON [" .. curWep .. "]", "DronesRewrite_font1", ScrW() * 0.5, ScrH() - 128, Color(255, 255, 255, 150), TEXT_ALIGN_CENTER)
		end

		oldWep = curWep

		local ammo = (drone:GetPrimaryAmmo() / drone:GetPrimaryMax()) * 200
		surface.SetDrawColor(Color(255, 255, 255, 20))
		surface.DrawRect(100, ScrH() - 204, 200, 20)
		surface.SetDrawColor(Color(255, 255, 0, 100))
		surface.DrawRect(100, ScrH() - 204, ammo, 20)
		surface.SetDrawColor(Color(0, 0, 0, 100))
		surface.DrawOutlinedRect(100, ScrH() - 204, 200, 20)
		draw.SimpleText("Primary ammo", "DronesRewrite_font2", 310, ScrH() - 200, Color(255, 255, 255, 100))

		local ammo = (drone:GetSecondaryAmmo() / drone:GetSecondaryMax()) * 200
		surface.SetDrawColor(Color(255, 255, 255, 20))
		surface.DrawRect(100, ScrH() - 244, 200, 20)
		surface.SetDrawColor(Color(255, 255, 0, 100))
		surface.DrawRect(100, ScrH() - 244, ammo, 20)
		surface.SetDrawColor(Color(0, 0, 0, 100))
		surface.DrawOutlinedRect(100, ScrH() - 244, 200, 20)
		draw.SimpleText("Secondary ammo", "DronesRewrite_font2", 310, ScrH() - 240, Color(255, 255, 255, 100))
	end

	if shouldDetectDamage then
		if oldHealth > drone:GetHealth() then
			droneDamaged = true
			timer.Create("dronesrewrite_changedamaged", 2, 1, function() droneDamaged = false end)
		end

		if droneDamaged then
			draw.SimpleText("DAMAGED", "DronesRewrite_font1", x * 0.5, y * 0.5 + 200, Color(255, 0, 0, 120), TEXT_ALIGN_CENTER)
		end

		oldHealth = drone:GetHealth()
	end
end
--PATH addons/_drones/lua/dronesrewrite/client/hud/simple.lua:
local oldWep
local wepChanged

DRONES_REWRITE.HUD["Simple"] = function(drone)
	local shouldDrawCrosshair = drone.HUD_shouldDrawCrosshair
	local shouldDrawHealth = drone.HUD_shouldDrawHealth
	local shouldDrawTargets = drone.HUD_shouldDrawTargets
	local shouldDrawFuel = drone.HUD_shouldDrawFuel
	local shouldDrawCenter = drone.HUD_shouldDrawCenter
	local shouldDrawWeps = drone.HUD_shouldDrawWeps

	local x, y = ScrW(), ScrH()

	local pos = (drone:GetForward() * 10 + drone:LocalToWorld(drone.FirstPersonCam_pos)):ToScreen()

	if shouldDrawCrosshair then
		surface.SetMaterial(Material("stuff/circle"))
		surface.SetDrawColor(Color(255, 255, 255))
		surface.DrawTexturedRect(x * 0.5 - 12, y * 0.5 - 12, 24, 24)
	end

	if shouldDrawTargets then
		for k, v in ipairs(ents.FindInSphere(drone:GetCameraTraceLine(nil, Vector(-50, -50, 0), Vector(50, 50, 0)).HitPos, 400)) do
			if not v:IsPlayer() and not v:IsNPC() and not v.IS_DRONE then continue end
			if v.IS_DRONE and v:IsDroneDestroyed() then continue end
			if v == drone then continue end

			-- Calculating target position
			local pos = v:LocalToWorld(v:OBBCenter())
			local bone = v:LookupBone("ValveBiped.Bip01_Head1")
			if bone then pos = v:GetBonePosition(bone) end

			pos = pos:ToScreen()

			surface.SetMaterial(Material("stuff/dronestwo_crossring"))
			surface.SetDrawColor(Color(255, 255, 255, 100))
			surface.DrawTexturedRect(pos.x - 8, pos.y - 8, 16, 16)
		end
	end

	if shouldDrawCenter then
		surface.SetMaterial(Material("stuff/whiteboxhud/circlerot"))
		surface.SetDrawColor(Color(255, 255, 255, math.abs(math.sin(CurTime()) * 150)))

		local x = CurTime() * 0.6
		local delta = (math.sin(x) ^ 3 - math.cos(x) ^ 2) * 360
		surface.DrawTexturedRectRotated(pos.x, pos.y, 256, 256, delta)


		surface.SetMaterial(Material("stuff/whiteboxhud/center"))
		surface.DrawTexturedRectRotated(pos.x, pos.y, 256, 256, -delta * 2)

		local newy = 30

		if shouldDrawHealth then
			surface.SetMaterial(Material("stuff/bar"))
			surface.SetDrawColor(Color(255, 100, 100, 200))
			
			surface.DrawOutlinedRect(pos.x - 378, pos.y - 15 + newy, 251, 30)
			for i = 1, (drone:GetHealth() / drone:GetDefaultHealth()) * 16 do
				surface.DrawTexturedRect(pos.x + i * 15 - 400, pos.y - 15 + newy, 40, 30)
			end

			draw.SimpleText("HEALTH", "DronesRewrite_font1", pos.x - 378, pos.y + 15 + newy, Color(255, 255, 255, 200), TEXT_ALIGN_LEFT)
		end

		if shouldDrawFuel then
			surface.SetMaterial(Material("stuff/bar"))
			surface.SetDrawColor(Color(255, 200, 100, 200))
			
			surface.DrawOutlinedRect(pos.x + 127, pos.y - 15 + newy, 251, 30)
			for i = 1, (drone:GetFuel() / drone.MaxFuel) * 16 do
				surface.DrawTexturedRect(pos.x + i * 15 + 105, pos.y - 15 + newy, 40, 30)
			end

			draw.SimpleText("FUEL", "DronesRewrite_font1", pos.x + 375, pos.y + 15 + newy, Color(255, 255, 255, 200), TEXT_ALIGN_RIGHT)
		end

		if shouldDrawWeps then
			-- Primary
			surface.SetMaterial(Material("stuff/bar"))
			surface.SetDrawColor(Color(100, 255, 100, 200))
			
			surface.DrawOutlinedRect(pos.x - 378, pos.y - 15 - newy, 251, 30)
			for i = 1, (drone:GetPrimaryAmmo() / drone:GetPrimaryMax()) * 16 do
				surface.DrawTexturedRect(pos.x + i * 15 - 400, pos.y - 15 - newy, 40, 30)
			end

			draw.SimpleText("PRM AMMO", "DronesRewrite_font1", pos.x - 378, pos.y - 60 - newy, Color(255, 255, 255, 200), TEXT_ALIGN_LEFT)


			-- Secondary
			surface.SetMaterial(Material("stuff/bar"))
			surface.SetDrawColor(Color(100, 255, 100, 200))
			
			surface.DrawOutlinedRect(pos.x + 127, pos.y - 15 - newy, 251, 30)
			for i = 1, (drone:GetSecondaryAmmo() / drone:GetSecondaryMax()) * 16 do
				surface.DrawTexturedRect(pos.x + i * 15 + 105, pos.y - 15 - newy, 40, 30)
			end

			draw.SimpleText("SCND AMMO", "DronesRewrite_font1", pos.x + 375, pos.y - 60 - newy, Color(255, 255, 255, 200), TEXT_ALIGN_RIGHT)

			local curWep = drone:GetNWString("CurrentWeapon")

			if oldWep != curWep then
				wepChanged = true

				timer.Create("dronesrewrite_changedwep", 2, 1, function() wepChanged = false end)
			end

			if wepChanged then
				draw.SimpleText("WEAPON: " .. curWep, "DronesRewrite_font1", ScrW() * 0.5, ScrH() * 0.5 + 100, Color(255, 255, 255, 200), TEXT_ALIGN_CENTER)
			end

			oldWep = curWep
		end
	end
end
--PATH addons/_drones/lua/dronesrewrite/client/hud/whitebox.lua:
local oldWep
local wepChanged
local oldHealth = 0
local area = 70

local doSound = true

local warn, warn2

local warning = nil
local function Warning(text, delay)
	if SERVER then return end

	warning = nil -- ??
	warning = { text = text, delay = delay }

	timer.Create("dronesrewrite_whitebox_warning", delay, 1, function()
		warning = nil
	end)

	surface.PlaySound("drones/whiteboxhud/warning.wav")
end

DRONES_REWRITE.HUD["White Box"] = function(drone)
	local shouldDrawCrosshair = drone.HUD_shouldDrawCrosshair
	local shouldDrawHealth = drone.HUD_shouldDrawHealth
	local shouldDrawTargets = drone.HUD_shouldDrawTargets
	local shouldDrawFuel = drone.HUD_shouldDrawFuel
	local shouldDrawCenter = drone.HUD_shouldDrawCenter
	local shouldDrawWeps = drone.HUD_shouldDrawWeps

	local alpha = 100 + math.abs(math.tan(CurTime() * 2) * 100)
	local w, h = ScrW(), ScrH()
	local pos = (drone:GetForward() * 10 + drone:LocalToWorld(drone.FirstPersonCam_pos)):ToScreen()

	surface.SetDrawColor(Color(255, 255, 255, 1))
	surface.SetMaterial(Material("stuff/whiteboxhud/lines"))
	surface.DrawTexturedRect(0, 0, w, h)

	if shouldDrawCenter then
		surface.SetDrawColor(Color(0, 0, 0, 200))
		surface.SetMaterial(Material("stuff/whiteboxhud/center"))
		surface.DrawTexturedRectRotated(pos.x, pos.y, 256, 256, drone:GetAngles().r)

		surface.SetMaterial(Material("stuff/whiteboxhud/center_lines"))
		surface.DrawTexturedRect(pos.x - 128, pos.y - 128, 256, 256)

		surface.SetMaterial(Material("stuff/whiteboxhud/circlerot"))

		local x = CurTime() * 0.6
		local delta = (math.sin(x) ^ 3 - math.cos(x) ^ 2) * 360
		surface.SetDrawColor(Color(255, 255, 255, alpha))
		surface.DrawTexturedRectRotated(pos.x, pos.y, 256, 256, delta)
	end

	if shouldDrawCrosshair then
		surface.SetDrawColor(Color(255, 200, 0, 100))

		surface.DrawLine(w * 0.5, 0, w * 0.5, h * 0.5 - 64)
		surface.DrawLine(w * 0.5, h * 0.5 + 64, w * 0.5, h)
		surface.DrawLine(256, h * 0.5, w * 0.5 - 64, h * 0.5)
		surface.DrawLine(w * 0.5 + 64, h * 0.5, ScrW() - 256, h * 0.5)

		surface.SetMaterial(Material("stuff/whiteboxhud/crosshair"))
		surface.DrawTexturedRect(w * 0.5 - 64, h * 0.5 - 64, 128, 128)

		surface.SetMaterial(Material("stuff/whiteboxhud/sidecirc"))

		local neww = h * 1.5
		surface.DrawTexturedRect((w - neww) * 0.5, (h - neww) * 0.5, neww, neww)

		local color = Color(200, 250, 250, alpha)
		draw.SimpleText("Scanning...", "DronesRewrite_font5", ScrW() - 160, 32, color, TEXT_ALIGNT_LEFT)
		draw.SimpleText("UNIT " .. drone:GetUnit(), "DronesRewrite_font5", ScrW() - 160, 52, color, TEXT_ALIGNT_LEFT)

		draw.SimpleText("Powered by DRR", "DronesRewrite_font5", 32, 32, color, TEXT_ALIGNT_LEFT)
		draw.SimpleText("Weapon: " .. drone:GetNWString("CurrentWeapon"), "DronesRewrite_font5", 32, 52, color, TEXT_ALIGNT_LEFT)

		local text = "[" .. math.floor(drone:GetPos():Distance(drone:GetCameraTraceLine().HitPos)) ..  "]"
		draw.SimpleText(text, "DronesRewrite_font5", 32, 72, Color(200, 250, 250, alpha), TEXT_ALIGNT_LEFT)
	end

	if shouldDrawTargets then
		local tr = drone:GetCameraTraceLine(nil, Vector(-32, -32, 0), Vector(32, 32, 0))

		for k, v in ipairs(ents.FindInSphere(tr.HitPos, 640)) do
			if v:IsPlayer() or v:IsNPC() or v.IS_DRONE then
				local pos = v:LocalToWorld(v:OBBCenter())
				local bone = v:LookupBone("ValveBiped.Bip01_Head1")
				if bone then pos = v:GetBonePosition(bone) end

				local tr = util.TraceLine({
					start = drone:GetPos(),
					endpos = pos,
					filter = drone
				})

				if tr.Entity != v then continue end

				local size = (64 - math.Clamp(drone:GetPos():Distance(pos) * 0.025, 16, 50))
				pos = pos:ToScreen()

				local class = v:GetClass()
				local alpha = math.abs(math.sin(CurTime() * 3)) * 200
				local color = Color(0, 255, 0, alpha)
				if IsEnemyEntityName(class) then color = Color(255, 0, 0, alpha) end

				surface.SetMaterial(Material("stuff/whiteboxhud/target"))
				surface.SetDrawColor(color)
				surface.DrawTexturedRect(pos.x - size * 0.5, pos.y - size * 0.5, size, size)

				draw.SimpleText(class:upper(), "DronesRewrite_font2", pos.x - size + 16, pos.y, color, TEXT_ALIGN_RIGHT)
			end
		end
	end

	if shouldDrawHealth then
		local h = h * 0.5

		local hp = (drone:GetHealth() / drone:GetDefaultHealth()) * 255
		surface.SetDrawColor(Color(255 - hp, hp, 0, alpha))
		surface.SetMaterial(Material("stuff/whiteboxhud/armor"))

		local x = w * 0.5 - 256
		local y = h - 64

		surface.DrawTexturedRect(x, y, 64, 64)

		draw.SimpleText(drone:GetHealth(), "DronesRewrite_font3", x - 8, y + 16, Color(255 - hp, hp, 0), TEXT_ALIGN_RIGHT)
	
		if drone:GetHealth() <= drone:GetDefaultHealth() / 4 then
			--[[if doSound then
				timer.Create("drr_playsnd_wb" .. drone:EntIndex(), 0.7, 1, function()
					surface.PlaySound("drones/alarm.wav")
					doSound = true
				end)

				doSound = false
			end]]

			surface.SetMaterial(Material("stuff/console/broken4"))
			surface.SetDrawColor(Color(255, 255, 255, 8 + math.Clamp(math.tan(CurTime()), 0, 8)))
			surface.DrawTexturedRect(0, 0, ScrW(), ScrH())

			if not warn then
				Warning("LOW HEALTH !!!", 5)
				surface.PlaySound("drones/whiteboxhud/alarm.wav")
				warn = true
			end
		else
			if warn then
				warn = false
			end
		end
	end

	if shouldDrawFuel then
		local h = h * 0.5

		local fuel = (drone:GetFuel() / drone.MaxFuel) * 255
		surface.SetDrawColor(Color(255 - fuel, fuel, 0, alpha))
		surface.SetMaterial(Material("stuff/whiteboxhud/can"))

		local x = w * 0.5 - 256
		local y = h + 16

		surface.DrawTexturedRect(x, y, 64, 64)

		draw.SimpleText(drone:GetFuel(), "DronesRewrite_font3", x - 8, y + 16, Color(255 - fuel, fuel, 0), TEXT_ALIGN_RIGHT)

		if drone:GetFuel() <= drone.MaxFuel / 4 then
			if not warn2 then
				Warning("LOW FUEL !!!", 5)
				warn2 = true
			end
		else
			if warn2 then
				warn2 = false
			end
		end
	end

	if shouldDrawWeps then
		local h = h * 0.5

		local ammo = (drone:GetPrimaryAmmo() / drone:GetPrimaryMax()) * 255
		local color = Color(255 - ammo, ammo, 0, alpha)

		surface.SetDrawColor(color)
		surface.SetMaterial(Material("stuff/whiteboxhud/ammo"))

		local x = w * 0.5 + 192
		local y = h - 64

		surface.DrawTexturedRect(x, y, 64, 64)
		draw.SimpleText("1", "DronesRewrite_font3", x + 64, y + 32, color)
		draw.SimpleText(drone:GetPrimaryAmmo(), "DronesRewrite_font3", x + 86, y + 16, color)

		local ammo = (drone:GetSecondaryAmmo() / drone:GetSecondaryMax()) * 255
		local color = Color(255 - ammo, ammo, 0, alpha)

		local y = h + 16

		surface.SetDrawColor(color)
		surface.SetMaterial(Material("stuff/whiteboxhud/ammo"))
		surface.DrawTexturedRect(x, y, 64, 64)

		draw.SimpleText(drone:GetSecondaryAmmo(), "DronesRewrite_font3", x + 86, y + 16, color)
		draw.SimpleText("2", "DronesRewrite_font3", x + 64, y + 32, color)
	end

	if warning then
		local x, y = w*0.5, h*0.5
		local a = 120 + math.sin(CurTime() * 6) * 80

		draw.SimpleText("WARNING", "DronesRewrite_customfont1big", x, y + 40, Color(255, 0, 0, a), TEXT_ALIGN_CENTER)
		draw.SimpleText(warning.text, "DronesRewrite_customfont1big2", x, y + 120, Color(255, 0, 0, a), TEXT_ALIGN_CENTER)
	end
end

--PATH addons/_drones/lua/dronesrewrite/client/overlay/drones1.lua:
DRONES_REWRITE.Overlay["Drones 1"] = function(drone)
	local tab = {
		["$pp_colour_addr"] = 0,
		["$pp_colour_addg"] = 0,
		["$pp_colour_addb"] = 0,
		["$pp_colour_brightness"] = 0,
		["$pp_colour_contrast"] = 1,
		["$pp_colour_colour"] = 1,
		["$pp_colour_mulr"] = 0,
		["$pp_colour_mulg"] = 0,
		["$pp_colour_mulb"] = 0
	}
	
	DrawColorModify(tab)
	DrawMaterialOverlay("effects/combine_binocoverlay.vmt", 0)
end
--PATH addons/_drones/lua/dronesrewrite/weapons/blaster.lua:
DRONES_REWRITE.Weapons["Electric Blaster"] = {
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

			local ammo = ents.Create("dronesrewrite_bl_laser")
			ammo:SetPos(src)
			ammo:SetAngles(gun:GetAngles() + AngleRand() * 0.004)
			ammo:Spawn()
			ammo.Owner = self:GetDriver()
			
			constraint.NoCollide(ammo, self, 0, 0)

			ammo:EmitSound("drones/eblade_shock_01.wav", 85, 110, 1, CHAN_WEAPON)

			local ef = EffectData()
			ef:SetOrigin(src - gun:GetForward() * 20)
			ef:SetNormal(gun:GetForward())
			util.Effect("dronesrewrite_muzzleflashblaster", ef)
	
			gun:SetPrimaryAmmo(-1)
			gun.NextShoot = CurTime() + 0.1
		end
	end,

	Attack2 = function(self, gun)
		if not self:IsKeyDown("Fire1") and CurTime() > gun.NextShoot2 and gun:HasPrimaryAmmo() then
			local src = gun:GetPos() + gun:GetForward() * 64 - gun:GetUp() * 2.5

			local ammo = ents.Create("dronesrewrite_bl_laser")
			ammo:SetPos(src)
			ammo:SetAngles(gun:GetAngles() + AngleRand() * 0.02)
			ammo:Spawn()
			ammo.Owner = self:GetDriver()
			
			constraint.NoCollide(ammo, self, 0, 0)

			ammo:EmitSound("drones/eblade_shock_01.wav", 85, math.random(130, 160), 1, CHAN_WEAPON)

			local ef = EffectData()
			ef:SetOrigin(src - gun:GetForward() * 21)
			ef:SetNormal(gun:GetForward())
			util.Effect("dronesrewrite_muzzleflashblaster", ef)	

			gun:SetPrimaryAmmo(-1)
			gun.NextShoot2 = CurTime() + 0.02

			gun.WaitTime = math.Approach(gun.WaitTime, 1, 0.1)
			if gun.WaitTime >= 1 then 
				gun.PlaySound = true
				gun.NextShoot2 = CurTime() + 3.6
				gun.WaitTime = 0
			end
		end
	end
}
--PATH addons/_drones/lua/dronesrewrite/weapons/camera.lua:
DRONES_REWRITE.Weapons["Camera"] = {
	Initialize = function(self)
		return DRONES_REWRITE.Weapons["Template"].InitializeNoDraw(self)
	end,

	Think = function(self, gun)
		DRONES_REWRITE.Weapons["Template"].Think(self, gun)
	end,
	
	Attack = function(self, gun)
		if self:WasKeyPressed("Fire1") then
			if self:GetDriver():IsValid() then
				local tr = util.TraceLine({
					start = gun:GetPos(),
					endpos = gun:GetPos() + gun:GetForward() * 256,
					filter = self
				})

				if self:GetNWBool("camera_flashen", true) then
					local ef = EffectData()
					ef:SetOrigin(tr.HitPos)
					util.Effect("camera_flash", ef, true)
				end

				gun:EmitSound("drones/camerawep.wav", 80, 100, 1, CHAN_WEAPON)
				self:GetDriver():ConCommand("jpeg")
			end
		end
	end,

	Attack2 = function(self, gun)
		if self:WasKeyPressed("Fire2") then
			self:SetNWBool("camera_flashen", not self:GetNWBool("camera_flashen", true))
		end
	end
}
--PATH addons/_drones/lua/dronesrewrite/weapons/healer.lua:
DRONES_REWRITE.Weapons["Healer"] = {
	Initialize = function(self, pos, ang)
		local ent = DRONES_REWRITE.Weapons["Template"].Initialize(self, "models/dronesrewrite/laser/laser.mdl", pos, ang, "models/dronesrewrite/attachment4/attachment4.mdl", pos)
		ent:SetMaterial("models/dronesrewrite/guns/laserh_mat")

		DRONES_REWRITE.Weapons["Template"].SpawnSource(ent, Vector(40, 0, -1.75))
		
		return ent	
	end,

	Think = function(self, gun)
		DRONES_REWRITE.Weapons["Template"].Think(self, gun)
	end,
	
	OnAttackStopped = function(self, gun)
		self:SwitchLoopSound("Laser", false)
	end,

	Holster = function(self, gun)
		self:SwitchLoopSound("Laser", false)
	end,

	OnRemove = function(self, gun)
		self:SwitchLoopSound("Laser", false)
	end,

	Attack = function(self, gun)
		local tr = self:GetCameraTraceLine()
		
		util.ParticleTracerEx("laser_beam_g_drr", gun.Source:GetPos(), tr.HitPos, false, gun:EntIndex(), -1)
		ParticleEffect("laser_hit_g_drr", tr.HitPos, gun:GetLocalCamAng())

		if CurTime() > gun.NextShoot then
			local ent = tr.Entity
			if ent:IsValid() and ent:IsPlayer() or ent:IsNPC() then
				ent:SetHealth(math.min(ent:GetMaxHealth(), ent:Health() + 1))
			end

			gun.NextShoot = CurTime() + 0.05
		end
		
		self:SwitchLoopSound("Laser", true, "ambient/energy/force_field_loop1.wav", 150, 1)
	end
}
--PATH addons/_drones/lua/dronesrewrite/weapons/invis_tur.lua:
DRONES_REWRITE.Weapons["Turret's Gun"] = {
	Initialize = function(self, pos, ang)
		local ent = DRONES_REWRITE.Weapons["Template"].InitializeNoDraw(self)
		
		DRONES_REWRITE.Weapons["Template"].SpawnSource(ent, pos)

		ent.PrimaryAmmo = 500
		ent.PrimaryAmmoMax = 500
		ent.PrimaryAmmoType = { DRONES_REWRITE.AmmoTypes.Pistol }

		return ent
	end,

	Think = function(self, gun)
		DRONES_REWRITE.Weapons["Template"].Think(self, gun)
	end,

	Attack = function(self, gun)
		if CurTime() > gun.NextShoot and gun:HasPrimaryAmmo() then
			local damage = 11
			local force = 4

			local bullet = {}
			bullet.Num = 1
			bullet.Src = gun.Source:GetPos()
			bullet.Dir = gun:GetLocalCamDir()
			bullet.Spread = Vector(0.03, 0.03, 0.03)
			bullet.Tracer = 1
			bullet.TracerName = "AR2Tracer"
			bullet.Force = force
			bullet.Damage = damage
			bullet.Attacker = self:GetDriver()
			
			gun.Source:FireBullets(bullet)
			gun:EmitSound("npc/turret_floor/shoot" .. math.random(1, 3) .. ".wav", 82, 100, 1, CHAN_WEAPON)

			self:SetSequence(self:LookupSequence("Fire"))

			gun:SetPrimaryAmmo(-1)
			gun.NextShoot = CurTime() + 0.07
		end
	end
}
--PATH addons/_drones/lua/dronesrewrite/weapons/laser.lua:
DRONES_REWRITE.Weapons["Laser"] = {
	Initialize = function(self, pos, ang)
		local ent = DRONES_REWRITE.Weapons["Template"].Initialize(self, "models/dronesrewrite/laser/laser.mdl", pos, ang, "models/dronesrewrite/attachment4/attachment4.mdl", pos)
		ent:SetMaterial("models/dronesrewrite/guns/laserd_mat")
		
		DRONES_REWRITE.Weapons["Template"].SpawnSource(ent, Vector(40, 0, -1.75))
		
		return ent
	end,

	Think = function(self, gun)
		DRONES_REWRITE.Weapons["Template"].Think(self, gun)
	end,

	OnAttackStopped = function(self, gun)
		self:SwitchLoopSound("Laser", false)
	end,

	Holster = function(self, gun)
		self:SwitchLoopSound("Laser", false)
	end,

	OnRemove = function(self, gun)
		self:SwitchLoopSound("Laser", false)
	end,

	Attack = function(self, gun)
		local damage = 0.7
		local tr = self:GetCameraTraceLine()

		util.ParticleTracerEx("laser_beam_r_drr", gun.Source:GetPos(), tr.HitPos, false, gun:EntIndex(), -1)
		ParticleEffect("laser_hit_r_drr", tr.HitPos, gun:GetLocalCamAng())

		local ent = tr.Entity
		if ent:IsValid() then
			ent:TakeDamage(damage, self:GetDriver(), self)
		end

		util.Decal("FadingScorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)

		self:SwitchLoopSound("Laser", true, "ambient/energy/force_field_loop1.wav", 150, 1)
	end
}
--PATH addons/_drones/lua/dronesrewrite/weapons/minigunlaser.lua:
DRONES_REWRITE.Weapons["Laser Minigun"] = {
	Initialize = function(self, pos, ang)
		local ent = DRONES_REWRITE.Weapons["Template"].Initialize(self, "models/dronesrewrite/minigunlsr/minigunlsr.mdl", pos, ang, "models/dronesrewrite/attachment4/attachment4.mdl", pos)

		DRONES_REWRITE.Weapons["Template"].SpawnSource(ent, Vector(55, 0, 3))

		ent.Rotate = 0
		ent.Angle = 0

		ent.PrimaryAmmo = 1500
		ent.PrimaryAmmoMax = 1500
		ent.PrimaryAmmoType = { DRONES_REWRITE.AmmoTypes.Blaster }

		return ent
	end,

	Think = function(self, gun)
		DRONES_REWRITE.Weapons["Template"].Think(self, gun)

		if gun.StopRotating then
			gun.Rotate = math.Approach(gun.Rotate, 0, 0.025)
		end

		gun.Angle = gun.Angle + (gun.Rotate * 20)
		gun:ManipulateBoneAngles(gun:LookupBone("barrel"), Angle(0, gun.Angle, 0))
	end,

	Attack = function(self, gun)
		if CurTime() > gun.NextShoot then
			if gun.Rotate >= 1 and gun:HasPrimaryAmmo() then
				local tr = self:GetCameraTraceLine()

				local src = gun:GetPos() + gun:GetForward() * 64 + gun:GetUp()

				local ammo = ents.Create("dronesrewrite_rd_laser_sm")
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
			else
				self:SwitchLoopSound("Minigun", false)
			end

			self:SetFuel(self:GetFuel() - 0.01)
			self:SwitchLoopSound("MinigunSpin", true, "vehicles/crane/crane_idle_loop3.wav", 100, 1, 90)

			gun.StopRotating = false
			gun.Rotate = math.Approach(gun.Rotate, 1, 0.025)
			gun.NextShoot = CurTime() + 0.02
		end
	end,

	OnAttackStopped = function(self, gun)
		gun.StopRotating = true
		gun:EmitSound("vehicles/apc/apc_shutdown.wav")

		self:SwitchLoopSound("MinigunSpin", false)
	end,

	Holster = function(self, gun)
		gun.StopRotating = true
		gun:EmitSound("vehicles/apc/apc_shutdown.wav")

		self:SwitchLoopSound("MinigunSpin", false)
	end,

	OnRemove = function(self, gun)
		self:SwitchLoopSound("MinigunSpin", false)
	end
}
--PATH addons/_drones/lua/dronesrewrite/weapons/multitool.lua:
local modes = {
	[1] = "Keypad hacking mode",
	[2] = "Physgun mode"
}

local modesfunc = {
	[1] = function(self, gun, tr)
		local ent = tr.Entity

		if IsValid(ent) then
			if ent:GetClass() == "keypad" or ent:GetClass() == "keypad_wire" or ent:GetClass() == "gmod_wire_keypad" then
				if not ent.DrrHackProcess then ent.DrrHackProcess = 0 end
				ent.DrrHackProcess = ent.DrrHackProcess + 1

				ent:EmitSound("buttons/button1" .. math.random(7, 9) .. ".wav", 60)

				if ent.DrrHackProcess > 10 then
					ent.DrrHackProcess = nil
					
					if ent.Process then 
						ent:Process(true) 
					elseif ent.IsWire and Wire_TriggerOutput then
						ent:SetNetworkedString("keypad_display", "y")
						Wire_TriggerOutput(ent, "Valid", 1)
						ent:EmitSound("buttons/button9.wav")
					end
				end
			end
		end

		gun.NextShoot = CurTime() + 0.3
	end,

	[2] = function(self, gun, tr)
		local ent = tr.Entity

		if ent != gun.Physgun then
			gun.Physgun = ent
			gun.Dist = gun.Physgun:GetPos():Distance(gun:GetPos())
		elseif IsValid(gun.Physgun) and gun.Dist then
			local phys = gun.Physgun:GetPhysicsObject()

			if phys:IsValid() then
				local newtr = util.TraceLine({
					start = gun:GetPos(),
					endpos = gun:GetPos() + gun:GetForward() * gun.Dist,
					filter = gun.Physgun
				})
				
				local propPos = gun.Physgun:LocalToWorld(gun.Physgun:OBBCenter())
				
				phys:ApplyForceCenter((newtr.HitPos - propPos):GetNormal() * newtr.HitPos:Distance(propPos) * phys:GetMass() * 600)
				phys:ApplyForceCenter(-phys:GetVelocity() * phys:GetMass() * 0.9)
				phys:AddAngleVelocity(-phys:GetAngleVelocity() * 0.3)
			end
		end

		gun.NextShoot = CurTime()
	end
}

DRONES_REWRITE.Weapons["Multitool"] = {
	Initialize = function(self, pos, ang)
		local ent = DRONES_REWRITE.Weapons["Template"].Initialize(self, "models/dronesrewrite/multitool/multitool.mdl", pos, ang, "models/dronesrewrite/attachment2/attachment2.mdl", pos + Vector(0, 0, 4.8))

		ent.Mode = 1

		DRONES_REWRITE.Weapons["Template"].SpawnSource(ent, Vector(20, 0, 0))

		return ent
	end,

	Think = function(self, gun)
		DRONES_REWRITE.Weapons["Template"].Think(self, gun)
	end,

	OnAttackStopped = function(self, gun)
		self:SwitchLoopSound("Laser", false)
	end,

	Holster = function(self, gun)
		self:SwitchLoopSound("Laser", false)
	end,

	OnRemove = function(self, gun)
		self:SwitchLoopSound("Laser", false)
	end,

	Attack = function(self, gun)
		local tr = self:GetCameraTraceLine()

		util.ParticleTracerEx("laser_beam_drr", gun.Source:GetPos(), tr.HitPos, false, gun:EntIndex(), -1)
		ParticleEffect("laser_hit_drr", tr.HitPos, gun:GetLocalCamAng())

		if CurTime() > gun.NextShoot then
			if modesfunc[gun.Mode] then
				modesfunc[gun.Mode](self, gun, tr)
			end
		end

		self:SwitchLoopSound("Laser", true, "ambient/energy/force_field_loop1.wav", 150, 1)
	end,

	Attack2 = function(self, gun)
		if self:WasKeyPressed("Fire2") then
			gun.Mode = gun.Mode + 1
			if gun.Mode > 2 then gun.Mode = 1 end

			local driver = self:GetDriver()
			if IsValid(driver) then driver:ChatPrint("[Drones] " .. modes[gun.Mode]) end
		end
	end
}
--PATH addons/_drones/lua/dronesrewrite/weapons/plasma_gun.lua:
DRONES_REWRITE.Weapons["Plasma Rifle"] = {
	Initialize = function(self, pos, ang)
		local ent = DRONES_REWRITE.Weapons["Template"].Initialize(self, "models/dronesrewrite/plasmagun/plasmagun.mdl", pos, ang)

		DRONES_REWRITE.Weapons["Template"].SpawnSource(ent, Vector(17.5, 2, -3.5))

		ent.PrimaryAmmo = 800
		ent.PrimaryAmmoMax = 1200
		ent.PrimaryAmmoType = { DRONES_REWRITE.AmmoTypes.Plasma }

		return ent
	end,

	Think = function(self, gun)
		DRONES_REWRITE.Weapons["Template"].Think(self, gun)
	end,

	Attack = function(self, gun)
		if CurTime() > gun.NextShoot and gun:HasPrimaryAmmo() then
			local damage = math.random(8,12)
			local force = 5

			local tr = self:GetCameraTraceLine()

			local bullet = {}
			bullet.Num = 1
			bullet.Src = gun.Source:GetPos()
			bullet.Dir = gun:GetLocalCamDir()
			bullet.Spread = Vector(0.04, 0.03, 0.03)
			bullet.Tracer = 1
			bullet.TracerName = "nrg_tracer_drr"
			bullet.Force = force
			bullet.Damage = damage
			bullet.Attacker = self:GetDriver()
			bullet.Callback = function(ply, tr)
				ParticleEffect("blade_glow_drr", tr.HitPos, Angle(0, 0, 0))

				sound.Play("drones/eblade_shock_01.wav", tr.HitPos, 60, 160)

				if math.random(1, 20) == 1 then
					ParticleEffect("electrical_arc_01_system", tr.HitPos, Angle(0, 0, 0))
				end

				util.Decal("FadingScorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
			end

			gun:FireBullets(bullet)
			gun:EmitSound("drones/nio_dissolve.wav", 85, math.random(150, 180), 1, CHAN_WEAPON)

			local ef = EffectData()
			ef:SetOrigin(gun.Source:LocalToWorld(Vector(0, -2, 0)))
			ef:SetNormal(gun:GetForward())
			util.Effect("dronesrewrite_muzzleflashplasma", ef)

			local phys = self:GetPhysicsObject()
			phys:ApplyForceCenter((gun:GetPos() - tr.HitPos):GetNormal() * 50000 / self.Weight)
			phys:AddAngleVelocity(VectorRand() * 200 / self.Weight)
	
			gun:SetPrimaryAmmo(-1)
			gun.NextShoot = CurTime() + 0.1
		end
	end
}
--PATH addons/_drones/lua/dronesrewrite/weapons/sniperrifle.lua:
DRONES_REWRITE.Weapons["Sniper Rifle"] = {
	Initialize = function(self, pos, ang)
		local ent = DRONES_REWRITE.Weapons["Template"].Initialize(self, "models/dronesrewrite/sniper_rifle/sniper_rifle.mdl", pos, ang)

		ent.SetZoom = function(ent, fov, fovn)
			local driver = self:GetDriver()

			if driver:IsValid() then
				if fov then
					self:SetCamera(ent, true, true, Vector(8, 0, -4))
					self:SetNWBool("ThirdPerson", false)
					driver:SetFOV(fovn, 0)

					net.Start("dronesrewrite_sniperrifle")
						net.WriteEntity(self)
						net.WriteBit(true)
					net.Send(driver)
				else
					self:SetCamera()
					ent.Mode = 0
					driver:SetFOV(90, 0)

					net.Start("dronesrewrite_sniperrifle")
						net.WriteEntity(self)
						net.WriteBit(false)
					net.Send(driver)
				end
			end
		end

		self:AddHook("DriverExit", "sniper_zoom", function()
			ent:SetZoom(false)
		end)

		DRONES_REWRITE.Weapons["Template"].SpawnSource(ent, Vector(40, 0, -4))

		ent.PrimaryAmmo = 50
		ent.PrimaryAmmoMax = 50
		ent.PrimaryAmmoType = { DRONES_REWRITE.AmmoTypes.Rifle }

		ent.Mode = 0

		return ent
	end,

	Think = function(self, gun)
		DRONES_REWRITE.Weapons["Template"].Think(self, gun)
	end,

	Attack = function(self, gun)
		if self:WasKeyPressed("Fire1") and CurTime() > gun.NextShoot and gun:HasPrimaryAmmo() then
			local damage = math.random(245, 270)
			local force = 20

			local bullet = {}
			bullet.Num = 1
			bullet.Src = gun.Source:GetPos()
			bullet.Dir = gun:GetLocalCamDir()
			bullet.Spread = Vector(0.001, 0.001, 0.001) * math.Clamp((self:GetVelocity():Length() * 0.1) - 1, 0, 60)
			bullet.Tracer = 1
			bullet.Force = force
			bullet.Damage = damage
			bullet.Attacker = self:GetDriver()
			
			gun.Source:FireBullets(bullet)
			gun:EmitSound("weapons/awp/awp1.wav", 80, 180, 1, CHAN_WEAPON)

			local tr = self:GetCameraTraceLine()
			
			local phys = self:GetPhysicsObject()
			phys:ApplyForceCenter((gun:GetPos() - tr.HitPos):GetNormal() * 120000 / self.Weight)
			phys:AddAngleVelocity(VectorRand() * 2000 / self.Weight)
			
			local ef = EffectData()
			ef:SetOrigin(gun.Source:GetPos())
			ef:SetNormal(gun:GetForward())
			util.Effect("dronesrewrite_muzzleflash", ef)

			gun:SetPrimaryAmmo(-1)
			gun.NextShoot = CurTime() + 1
		end
	end,

	Attack2 = function(self, gun)
		if CurTime() > gun.NextShoot2 then
			gun.Mode = gun.Mode + 1

			if gun.Mode == 1 then
				gun:SetZoom(true, 40)
			elseif gun.Mode == 2 then
				gun:SetZoom(true, 10)
			else
				gun:SetZoom(false)
			end

			gun.NextShoot2 = CurTime() + 0.2
		end
	end,

	Deploy = function(self, gun)
		net.Start("dronesrewrite_sniperrifle_crosshair")
			net.WriteEntity(self)
			net.WriteBit(false)
		net.Broadcast()
	end,

	Holster = function(self, gun)
		net.Start("dronesrewrite_sniperrifle_crosshair")
			net.WriteEntity(self)
			net.WriteBit(true)
		net.Broadcast()
		
		gun:SetZoom(false)
	end,

	OnRemove = function(self, gun)
		gun:SetZoom(false)
		self:RemoveHook("DriverExit", "sniper_zoom")
	end
}
--PATH addons/_fpr/lua/fprofiler/report.lua:
local function getData()
    local callCounts = FProfiler.Internal.getCallCounts()
    local inclusiveTimes = FProfiler.Internal.getInclusiveTimes()
    local funcNames = FProfiler.Internal.getFunctionNames()

    local data = {}
    for func, called in pairs(callCounts) do
        local row = {}
        row.func = func
        row.info = debug.getinfo(func, "nfS")
        row.total_called = called
        row.total_time = inclusiveTimes[func] or 0
        row.average_time = row.total_time / row.total_called

        row.name, row.namewhat = nil, nil

        row.names = {}
        for name, namedata in pairs(funcNames[func]) do
            table.insert(row.names, {name = name, namewhat = namedata.namewhat, nparams = namedata.nparams})
        end

        table.insert(data, row)
    end

    return data
end

local function cull(data, count)
    if not count then return data end

    for i = count + 1, #data do
        data[i] = nil
    end

    return data
end

--[[-------------------------------------------------------------------------
The functions that are called most often
Their implementations are O(n lg n),
which is probably suboptimal but not worth my time optimising.
---------------------------------------------------------------------------]]
function FProfiler.Internal.mostOftenCalled(count)
    local sorted = getData()

    table.SortByMember(sorted, "total_called")

    return cull(sorted, count)
end

--[[-------------------------------------------------------------------------
The functions that take the longest time in total
---------------------------------------------------------------------------]]
function FProfiler.Internal.mostTimeInclusive(count)
    local sorted = getData()

    table.SortByMember(sorted, "total_time")

    return cull(sorted, count)
end

--[[-------------------------------------------------------------------------
The functions that take the longest average time
---------------------------------------------------------------------------]]
function FProfiler.Internal.mostTimeInclusiveAverage(count)
    local sorted = getData()

    table.SortByMember(sorted, "average_time")

    return cull(sorted, count)
end

--[[-------------------------------------------------------------------------
Get the top <count> of most often called, time inclusive and average
NOTE: This will almost definitely return more than <count> results.
Up to three times <count> is possible.
---------------------------------------------------------------------------]]
function FProfiler.Internal.getAggregatedResults(count)
    count = count or 100

    local dict = {}
    local mostTime = FProfiler.Internal.mostTimeInclusive(count)
    for i = 1, #mostTime do dict[mostTime[i].func] = true end

    local mostAvg = FProfiler.Internal.mostTimeInclusiveAverage(count)

    for i = 1, #mostAvg do
        if dict[mostAvg[i].func] then continue end
        dict[mostAvg[i].func] = true
        table.insert(mostTime, mostAvg[i])
    end

    local mostCalled = FProfiler.Internal.mostOftenCalled(count)

    for i = 1, #mostCalled do
        if dict[mostCalled[i].func] then continue end
        dict[mostCalled[i].func] = true
        table.insert(mostTime, mostCalled[i])
    end

    table.SortByMember(mostTime, "total_time")

    return mostTime
end

--PATH addons/__main/lua/fspectate/sh_init.lua:
if not CAMI then return end

CAMI.RegisterPrivilege{
    Name = "FSpectate",
    MinAccess = "admin"
}

CAMI.RegisterPrivilege{
    Name = "FSpectateTeleport",
    MinAccess = "admin"
}

--PATH addons/__main/lua/autorun/fun_shared.lua:
local sadd = sound.Add
local ups = util.PrecacheSound

local FUN_STUFF_SOUNDS = {}

FUN_STUFF_SOUNDS["CLAW_SCREAM"] = "npc/fast_zombie/fz_alert_close1.wav"
FUN_STUFF_SOUNDS["CLAW_HIT"] = {"physics/flesh/flesh_squishy_impact_hard1.wav","physics/flesh/flesh_squishy_impact_hard2.wav","physics/flesh/flesh_squishy_impact_hard3.wav","physics/flesh/flesh_squishy_impact_hard4.wav"}
FUN_STUFF_SOUNDS["CLAW_SWING"] = "npc/fast_zombie/claw_miss2.wav" 


local tbl = {channel = CHAN_STATIC,
	volume = 1,
	level = 75,
	pitchstart = 100,
	pitchend = 100}

for k, v in pairs(FUN_STUFF_SOUNDS) do
	tbl.name = k
	tbl.sound = v
		
	sadd(tbl)
	
	if type(v) == "table" then
		for k2, v2 in pairs(v) do
			ups(v2)
		end
	else
		ups(v)
	end
end	
--PATH addons/ukrp_1_content/lua/autorun/krsn_dd2_grave_robber_pm.lua:
player_manager.AddValidModel( "Darkest Dungeon 2 - Grave Robber", "models/kerosenn/darkest_dungeon/heroes/grave_robber/playermodel/dd2_grave_robber_pm.mdl" )
player_manager.AddValidHands( "Darkest Dungeon 2 - Grave Robber", "models/kerosenn/darkest_dungeon/heroes/grave_robber/viewmodel/dd2_grave_robber_vm.mdl", 0, "00000000" )

hook.Add("PreDrawPlayerHands", "dd2_grave_robber_vm", function(hands, vm, ply, wpn)
    if IsValid(hands) and hands:GetModel() == "models/kerosenn/darkest_dungeon/heroes/grave_robber/viewmodel/dd2_grave_robber_vm.mdl" then
        hands:SetSkin(ply:GetSkin())
    end
end)
--PATH addons/igs-core/lua/igs/dependencies/bib.lua:
bib = bib or {} -- Не знаю, почему я решил дать ему именно такое название

function bib.set(key,value)
	sql.Query([[
		REPLACE INTO `bib`(`key`,`value`)
		VALUES (]] .. sql.SQLStr(key) .. "," .. sql.SQLStr(value) .. [[)
	]])
end

function bib.get(key,fallback)
	return sql.QueryValue([[
		SELECT `value`
		FROM `bib`
		WHERE `key` = ]] .. sql.SQLStr(key)
	) or fallback
end

function bib.delete(key)
	sql.Query([[
		DELETE FROM `bib`
		WHERE `key` = ]] .. sql.SQLStr(key)
	)
end

function bib.getAll()
	local t = sql.Query([[
		SELECT `key`,`value`
		FROM `bib`
	]]) or {}

	local kv = {}
	for _,v in ipairs(t) do
		kv[v.key] = v.value
	end

	return kv
end

function bib.reset()
	sql.Query([[
		DELETE FROM `bib`
	]])
end

sql.Query([[
	CREATE TABLE IF NOT EXISTS `bib` (
		`key`   TEXT NOT NULL UNIQUE,
		`value` TEXT,
		PRIMARY KEY(key)
	);
]])





--[[-------------------------------------------------------------------------
	Bools
---------------------------------------------------------------------------]]
function bib.getBool(k, bFallback)
	local v = bib.get(k)
	if v == nil then
		return bFallback
	end

	return v == "t"
end

function bib.setBool(k,b)
	bib.set(k,b and "t" or "f")
end

-- local function g() return bib.getBool("foo") end
-- local function s(b) bib.setBool("foo",b) end
-- s(nil)   print("false",g())
-- s(true)  print("true",g())
-- s(false) print("false",g())
-- s(1)     print("true",g())


--[[-------------------------------------------------------------------------
	Numbers
---------------------------------------------------------------------------]]
function bib.getNum(k,iFallback)
	return tonumber(bib.get(k,iFallback))
end

function bib.setNum(k,i)
	bib.set(k,i)
end

function bib.increment(k, i_)
	local i = bib.getNum(k, 0) + (i_ or 1)
	bib.setNum(k, i)
	return i
end


--PATH addons/igs-core/lua/igs/utils/ut_cl.lua:
-- Норм название сервера по его ИД
-- Если вернут "-", значит сервер скорее всего, отключен
function IGS.ServerName(iID)
	local serv_name = iID == 0 and "Відк." or IGS.SERVERS(iID)
	      serv_name = serv_name or "Глоб." -- IGS.SERVERS(iID) вернул nil = везде
	      -- serv_name = serv_name[1]:upper() .. serv_name:sub(2) -- апперкейсит первую букву

	return serv_name
end


function IGS.ProcessActivate(dbID, cb)
	IGS.Activate(dbID,function(ok, iPurchID, sMsg_)
		sMsg_ = sMsg_ or "Предмет активований. Дякуємо вам!"
		IGS.ShowNotify(sMsg_, ok and "Успішна активація" or "Помилка активації")

		if cb then
			cb(ok, iPurchID, sMsg_)
		end
	end)
end

--PATH addons/igs-core/lua/igs/extensions/badmin.lua:
local STORE_ITEM = FindMetaTable("IGSItem")

function STORE_ITEM:SetBAdminGroup(rank)
	return self:SetInstaller(function(pl)
		assert(rank, "IGS Rank expected, got " .. type(rank))
		local RANK = assert(ba.ranks.Get(rank), "IGS Rank " .. rank .. " invalid")
		pl:SetNetVar("UserGroup", RANK:GetID())
	end):AddHook("IGS.PlayerPurchasesLoaded", function(pl, purchases) -- #TODO упростить хук. sam использует тот же
		if CLIENT or not purchases then return end

		local priority_item = self

		for uid in pairs(purchases) do
			local ITEM = IGS.GetItemByUID(uid)
			if ITEM:GetMeta("bagroup") and ITEM.id > self.id then
				priority_item = ITEM
			end
		end

		if priority_item == self then
			self:Setup(pl)

		end
	end):SetMeta("bagroup", sUserGroup)
end

--PATH addons/igs-core/lua/igs/extensions/darkrp.lua:
IGS.ITEMS.DRP = IGS.ITEMS.DRP or {
	ITEMS = {},
	JOBS  = {}
}


local STORE_ITEM = FindMetaTable("IGSItem")

-- Делает итем в магазине покупаемым только за донат
-- Это может быть ящик оружия, отдельная пушка или даже отдельная энтити
function STORE_ITEM:SetDarkRPItem(sEntClass)
	self.dpr_item = self:Insert(IGS.ITEMS.DRP.ITEMS, sEntClass)
	return self
end

-- Доступ к профессиям только тем, кто ее покупал
function STORE_ITEM:SetDarkRPTeams(...)
	-- https://trello.com/c/xxGiGpb2/319-улучшить-setdarkrpteam
	local tTeams = {...}
	for i,team in ipairs(tTeams) do
		if isnumber(team) then -- обратная совместимость (20.03.2019)
			local TEAM = RPExtraTeams[team]
			self:Insert(IGS.ITEMS.DRP.JOBS, TEAM.command)
			tTeams[i] = TEAM.command -- заменяем ENUM на cmd для ITEM.dpr_teams
		else -- строка (team.command) https://trello.com/c/BcbYbAb7/512
			self:Insert(IGS.ITEMS.DRP.JOBS, team)
		end
	end
	self.dpr_teams = tTeams
	return self
end
STORE_ITEM.SetDarkRPTeam = STORE_ITEM.SetDarkRPTeams -- обратная совместимость (20.03.2019)

function STORE_ITEM:SetDarkRPMoney(iSum)
	self:SetDescription("Миттєво та без проблем поповнює баланс игрової валюти на " .. string.Comma(iSum) .. " валюти")
	self:SetInstaller(function(pl) pl:addMoney(iSum,"IGS") end)
	self:SetStackable()

	self.dpr_money = iSum
	return self
end

hook.Add("canBuyShipment", "IGS", function(pl, tItem)
	local ITEM = IGS.PlayerHasOneOf(pl, IGS.ITEMS.DRP.ITEMS[tItem.entity])
	if ITEM ~= nil then -- донатный итем
		local allow, message = hook.Run("IGS.canBuyShipment", pl, tItem)
		return allow or tobool(ITEM), false, message or "Це для донатерів (/donate)"
	end
end)

hook.Add("canBuyPistol", "IGS", function(pl, tItem)
	local ITEM = IGS.PlayerHasOneOf(pl, IGS.ITEMS.DRP.ITEMS[tItem.entity])
	if ITEM ~= nil then -- донатный итем
		local allow, message = hook.Run("IGS.canBuyPistol", pl, tItem)
		return allow or tobool(ITEM), false, message or "Це для донатерів (/donate)"
	end
end)

-- в DarkRP.hooks нет такого
-- https://img.qweqwe.ovh/1528097550183.png
hook.Add("canBuyCustomEntity", "IGS", function(pl, tItem)
	local ITEM = IGS.PlayerHasOneOf(pl, IGS.ITEMS.DRP.ITEMS[tItem.ent])
	if ITEM ~= nil then -- донатный итем
		local allow, message = hook.Run("IGS.canBuyCustomEntity", pl, tItem)
		return allow or tobool(ITEM), false, message or "Це для донатерів (/donate)"
	end
end)

-- нет suppress
-- print(IGS.PlayerHasOneOf(AMD(), IGS.ITEMS.DRP.JOBS[TEAM_LOCK]))
hook.Add("playerCanChangeTeam", "IGS", function(pl, iTeam, bForce)
	local TEAM = RPExtraTeams[iTeam]
	local ITEM = IGS.PlayerHasOneOf(pl, IGS.ITEMS.DRP.JOBS[TEAM.command])
	if ITEM ~= nil then -- донатный итем
		local allow, message = hook.Run("IGS.playerCanChangeTeam", pl, iTeam, bForce)
		return allow or tobool(ITEM), message or "Це для донатерів (/donate)"
	end
end)


-- Hunger
function STORE_ITEM:DisablePlayerHunger()
	return self:SetInstaller(function(pl)
		pl.igs_disable_hunger = true
	end):SetValidator(function(pl)
		return false
	end)
end

hook.Add("hungerUpdate", "IGS", function(pl)
	if pl.igs_disable_hunger then
		pl:setSelfDarkRPVar("Energy", 100)
		return true
	end
end)

--PATH addons/igs-core/lua/igs/extensions/infammo.lua:
-- IGS("Бесконечные патроны", "infammo", 100)
-- 	:SetInfAmmo()
-- 	:SetTerm(10)

local ITEM = FindMetaTable("IGSItem")

local function setInfAmmo(pl)
	local weapon = pl:GetActiveWeapon()
	if not IsValid(weapon) then return end

	local maxClip      = weapon:GetMaxClip1()
	local maxClip2     = weapon:GetMaxClip2()
	local primAmmoType = weapon:GetPrimaryAmmoType()
	local secAmmoType  = weapon:GetSecondaryAmmoType()

	if maxClip == -1 and maxClip2 == -1 then
		maxClip = 100
		maxClip2 = 100
	end

	if maxClip <= 0 and primAmmoType ~= -1 then
		maxClip = 1
	end

	if maxClip2 == -1 and secAmmoType ~= -1 then
		maxClip2 = 1
	end

	if maxClip > 0 then
		weapon:SetClip1(maxClip)
	end

	if maxClip2 > 0 then
		weapon:SetClip2(maxClip2)
	end

	if primAmmoType ~= -1 then
		pl:SetAmmo( maxClip, primAmmoType, true)
	end

	if secAmmoType ~= -1 and secAmmoType ~= primAmmoType then
		pl:SetAmmo( maxClip2, secAmmoType, true)
	end
end


infammo_players = {}

timer.Create("igs_infammo", 1, 0, function()
	if not infammo_players[1] then return end

	for i = #infammo_players, 0, -1 do -- reversed ipairs
		local pl = infammo_players[i]
		if IsValid(pl) then
			setInfAmmo(pl)
		else
			table.remove(infammo_players, i)
		end
	end
end)

function ITEM:SetInfAmmo()
	return self:SetInstaller(function(pl)
		if not table.HasValue(infammo_players, pl) then
			table.insert(infammo_players, pl) 
		end
	end):SetValidator(function(pl)
		return false
	end)
end

--PATH addons/igs-core/lua/igs/interface/vgui/igs_iteminfo.lua:
local PANEL = {}

local dock = 5

function PANEL:Init()
	self.head = uigs.Create("Panel", self)
	self.head:SetTall(100)
	self.head:Dock(TOP)
	self.head:DockPadding(dock,dock,dock,dock)
	self.head.Paint = function(s,w,h)
		IGS.S.Panel(s,w,h, nil,nil,nil,true)
	end

	self.scroll = uigs.Create("igs_scroll", self)
	self.scroll:Dock(FILL)
end

function PANEL:SetName(sName)
	self.name = self.name or uigs.Create("DLabel", function(lbl)
		lbl:Dock(TOP)
		--lbl:SetTall(22)
		lbl:SetFont("igs.22")
		lbl:SetTextColor(IGS.col.TEXT_HARD)
		lbl:SetWrap(true)
		lbl:SetAutoStretchVertical(true)
		lbl:SizeToContents()
	end, self.head)

	self.name:SetText(sName)
end

-- Добавляет иконку рядом с названием инфо панели
function PANEL:SetIcon(sIco, bIsModel) -- url, Material or Model path
	-- bIsModel = true
	-- sIco = "models/weapons/w_npcnade.mdl"

	self.icon_bg = self.icon_bg or uigs.Create("Panel", function(bg)
		bg.Paint = IGS.S.RoundedPanel
		bg:SetWide(self.head:GetTall() - dock * 2)
		bg:Dock(LEFT)
		bg:DockPadding(3,3,3,3)
		bg:DockMargin(0,0,dock,0)

		bg:InvalidateParent(true) -- true bg:GetSize()
	end, self.head)

	if IsValid(self.icon) and
		((self.model and not bIsModel) or   -- Если раньше была установлена моделька, а сейчас надо поставить иконку
		(not self.model and bIsModel)) then -- Наоборот. Нужно поставить модельку, но стаяла картинка

		self.icon:Remove()
		self.icon = nil
	end

	self.model = bIsModel and sIco
	self.icon  = self.icon or (bIsModel and uigs.Create("DModelPanel", function(mdl)
		mdl:SetSize(self.icon_bg:GetSize())
		mdl:SetModel(sIco)

		if not IsValid(mdl.Entity) then return end
		local mn, mx = mdl.Entity:GetRenderBounds()
		local size = 0
		size = math.max(size, math.abs(mn.x) + math.abs(mx.x))
		size = math.max(size, math.abs(mn.y) + math.abs(mx.y))
		size = math.max(size, math.abs(mn.z) + math.abs(mx.z))

		mdl:SetFOV(30)
		mdl:SetCamPos(Vector(size, size, size))
		mdl:SetLookAt((mn + mx) * 0.5)
		mdl.LayoutEntity = function() return false end

	end, self.icon_bg)) or uigs.Create("igs_wmat", function(ico)
		ico:SetSize(self.icon_bg:GetSize())
		ico.AutoSize = false
	end, self.icon_bg) -- НЕ моделька (Ссылка на иконку)


	if bIsModel then
		self.icon:SetModel(sIco)
	else
		self.icon:SetURL(sIco) -- nil = сброс
	end
end

-- Кнопка под названием инфо панели
function PANEL:SetSubNameButton(sName,func)
	if not sName then return end

	self.sub = self.sub or uigs.Create("DButton", function(btn)
		btn:Dock(TOP)
		btn:SetTall(20)
		btn:SetFont("igs.20")
		btn:SetTextColor(IGS.col.TEXT_SOFT)
		btn:SetContentAlignment(4)
		btn.DoClick = func
		btn.Paint = function() end
	end, self.head)

	self.sub:SetText(sName .. "⯈")
end

-- Создает невидимую панельку вот тут:
-- https://img.qweqwe.ovh/1486589180000.png
function PANEL:CreateActivity()
	self.activity = self.activity or uigs.Create("Panel", function(btn)
		btn:Dock(FILL)
	end, self.head)

	return self.activity
end

-- Описание, информация, картинка
function PANEL:AddPanel(sTitle,panel)
	-- https://img.qweqwe.ovh/1486595573943.png
	local background = uigs.Create("Panel", function(bg)
		bg:DockPadding(10,0,10,0) -- отступы по краям внутри скролла
		bg.Paint = function(s,w,h) -- линия снизу посередине панели https://img.qweqwe.ovh/1491948928484.png
			surface.SetDrawColor(IGS.col.SOFT_LINE)
			surface.DrawLine(10,h - 1,w - 10,h - 1)
		end
	end) -- для отступов

	local y = panel:GetTall() -- с доками не вышло, пришлось сетить вручную

	uigs.Create("DLabel", function(title)
		title:Dock(TOP)
		title:SetTall(22)
		title:DockMargin(0,10,0,5)
		title:SetText(sTitle)
		title:SetFont("igs.22")
		title:SetTextColor(IGS.col.TEXT_HARD)

		y = y + 22 + 5 + 5
	end, background)

	panel:SetParent(background)
	panel:Dock(TOP)

	self.scroll:AddItem(background)

	background:SetTall(y + 5 + 10) -- 5 хз че, а 10 - отступ от текста к бортику снизу
end

function PANEL:Reset()
	self.scroll:Reset()

	if self.name then
		self.name:SetText("")
	end

	if self.sub then
		self.sub:SetText("")
	end

	if self.icon then
		self.icon:SetURL() -- IGS.C.DefaultIcon
	end
end


--[[-------------------------------------------------------------------------
Не обязательные методы. Их тут не должно быть с точки зрения правильности кода
Но так как я панель больше нигде, кроме IGS не юзаю, то мне так будет удобнее
---------------------------------------------------------------------------]]
-- Добавляет панель с описанием
function PANEL:SetDescription(sDescription)
	if self.description then return end

	local pnl = uigs.Create("Panel")

	self:InvalidateParent(true)
	local w = self:GetWide()
	local txt = string.Wrap("igs.15", sDescription, w - 10 - 10)
	local y   = 0

	for _,line in ipairs(txt) do
		uigs.Create("DLabel", function(d)
			d:SetPos(0,y)
			d:SetSize(w,15)
			d:SetFont("igs.15")
			d:SetTextColor(IGS.col.TEXT_SOFT)
			d:SetText(line)

			y = y + 15
		end, pnl)
	end

	pnl:SetTall(y)
	self:AddPanel("Опис",pnl)
end

function PANEL:SetInfo(tInf)
	local pnl = uigs.Create("Panel")
	local y = 0

	for k,v in pairs(tInf) do
		local line_bg = uigs.Create("Panel", pnl)
		line_bg:SetTall(15)
		line_bg:Dock(TOP)

		uigs.Create("DLabel", function(key)
			key:Dock(LEFT)
			key:SetWide(80)
			key:SetFont("igs.15")
			key:SetTextColor(IGS.col.TEXT_SOFT)
			key:SetText(k)
			key:SetContentAlignment(6)
		end, line_bg)

		uigs.Create("DLabel", function(key)
			key:Dock(FILL)
			key:SetFont("igs.15")
			key:SetTextColor(IGS.col.TEXT_HARD)
			key:SetText("  " .. v)
			key:SetContentAlignment(4)
		end, line_bg)

		y = y + 15
	end

	pnl:SetTall(y)
	self:AddPanel("Інформація",pnl)
end

-- Добавляет панель с указанным изображением
function PANEL:SetImage(sUrl)
	if not sUrl then return end

	self:InvalidateParent(true) -- self:GetWide()

	local pnl = uigs.Create("igs_wmat")
	pnl:SetSize(self:GetWide(),self:GetWide() / 5 * 2) -- соотношение 5:2
	pnl:SetURL(sUrl)

	self:AddPanel("Зображення",pnl)
end

vgui.Register("igs_iteminfo",PANEL,"Panel")

-- IGS.WIN.Item("group_premium_15d")

--PATH addons/igs-core/lua/igs/interface/vgui/igs_multipanel.lua:
--[[-------------------------------------------------------------------------
Панель, на которой можно разместить несколько других и переключаться между ними
Используется в igs_tabbar и может использоваться по отдельности

Обращаем внимание на pnl:OnOpen()
---------------------------------------------------------------------------]]

local PANEL = {}

function PANEL:Init()
	self.Panels = {}
end

function PANEL:AddPanel(panel,bActive)
	panel:SetSize(self:GetWide(),self:GetTall())
	panel:SetVisible(false)
	panel:SetParent(self)
	-- panel.Paint = function(s,w,h) end -- АХТУНГ. Уже дважды на грабли встал
	-- Не понимал, почему не добавляется панель. Потом дошло, что этот хук ее просто прячет

	panel.ID = table.insert(self.Panels,panel)

	if (bActive) then
		self:SetActivePanel(panel.ID)
	end

	return panel.ID
end

function PANEL:SetActivePanel(iID)
	for i,pnl in ipairs(self.Panels) do
		pnl.Active = iID == i

		if (pnl:IsVisible()) then
			pnl:Dock(NODOCK)
			pnl:SetVisible(false)
		end

		if (iID == i) then
			pnl:SetVisible(true)
			pnl:DockMargin(0, 0, 0, 0)
			pnl:Dock(FILL)

			if pnl.OnOpen then
				pnl:OnOpen()
			end
		end
	end
end

function PANEL:GetActivePanel()
	for i,pnl in ipairs(self.Panels) do
		if pnl.Active then
			return pnl
		end
	end
end

vgui.Register("igs_multipanel", PANEL, "Panel")
-- IGS.UI()

--PATH addons/igs-core/lua/igs/interface/core.lua:
IGS.WIN = IGS.WIN or {}

surface.CreateFont("igs.40", {font = "roboto", extended = true, size = 40, weight = 500})
surface.CreateFont("igs.24", {font = "roboto", extended = true, size = 24, weight = 400})
surface.CreateFont("igs.22", {font = "roboto", extended = true, size = 22, weight = 400})
surface.CreateFont("igs.20", {font = "roboto", extended = true, size = 20, weight = 400})
surface.CreateFont("igs.19", {font = "roboto", extended = true, size = 19, weight = 400})
surface.CreateFont("igs.18", {font = "roboto", extended = true, size = 18, weight = 400})
surface.CreateFont("igs.17", {font = "roboto", extended = true, size = 15, weight = 550})
surface.CreateFont("igs.15", {font = "roboto", extended = true, size = 15, weight = 550})


uigs = uigs or {}
function uigs.Create(t, f, p)
	local cb, parent = f, p

	if not isfunction(f) then -- nil or panel
		parent, cb = f, nil
	end

	local v = vgui.Create(t, parent)
	if cb then cb(v, parent) end
	return v
end
-- uigs.Create("name")
-- uigs.Create("name", parent)
-- uigs.Create("name", func, parent)
-- uigs.Create("name", func)

local function f1()
	local GM = GM or GAMEMODE
	if GM and IGS.C.MENUBUTTON == KEY_F1 then
		function GM:ShowHelp() end
	end
end

-- Чтобы не открывало F1 менюшку даркрпшевскую ебучую
hook.Add("DarkRPFinishedLoading","SupressDarkRPF1",f1) -- с addons
hook.Add("IGS.Initialized","SupressDarkRPF1",f1) -- git загрузка






-- чтобы аргументом не передалась панель
local function dep() IGS.WIN.Deposit() end


local mf -- антидубликат
function IGS.UI()
	if not IGS.IsLoaded() then
		LocalPlayer():ChatPrint("[IGS] Автодонат не завантажений")
		return
	end

	if not IGS.C then -- Проблема AddCSLua. В консоли клиента должны быть ошибки инклюда нескольких базовых файлов
		LocalPlayer():ChatPrint("[IGS] Автодонат встановлено невірно. Зверніться до адміністрації")
		return
	end

	if IsValid(mf) then
		if not mf:IsVisible() then
			IGS.ShowUI()
		end
		return
	end

	mf = uigs.Create("igs_frame", function(self)
		-- 580 = (items_in_line * item_pan_wide) + (10(margin) * (items_in_line + 1))
		self:SetSize(math.min(ScrW(), 800), math.min(ScrH(), 500)) -- позволяет закрыть окно на ущербных разрешениях
		self:RememberLocation("igs")
		self:MakePopup()

		-- если повесить на фрейм, то драг сломается
		local init = CurTime() -- https://t.me/c/1353676159/7185
		function self.btnClose:Think()
			if CurTime() - init > 1 and input.IsKeyDown(IGS.C.MENUBUTTON) then
				IGS.HideUI()
			end
		end
	end)

	-- Баланс
	uigs.Create("igs_button", function(self)
		function self:UPDBalance()
			self.bal = LocalPlayer():IGSFunds()
			self:SetText("Баланс: " .. IGS.SignPrice(self.bal))
		end

		self:SetPos(20,0)
		self:SetSize(150,27)
		self:UPDBalance()
		self:SetTooltip("Відкрити список покупок")
		self.Think = function(s)
			if s.bal ~= LocalPlayer():IGSFunds() then
				s:UPDBalance()
			end
		end

		local add = uigs.Create("igs_button", mf)
		add:SetPos(20 + 150 + 2,0)
		add:SetSize(27,27)
		add:SetText("+")
		add:SetTooltip("Поповнення рахунку")
		add:SetActive(true)

		 add.DoClick = dep
		self.DoClick = dep
	end,mf)

	mf.activity = uigs.Create("igs_tabbar", function(self)
		self:SetPos(0,mf:GetTitleHeight())
		self:SetSize(580,mf:GetTall() - mf:GetTitleHeight())
	end, mf)

	-- Херня справа от лэйаута с услугами http://joxi.ru/52aQQ8Efzov120
	-- Вид без нее: http://joxi.ru/eAO44lGcXORlro
	local x,y = mf.activity:GetPos()
	mf.sidebar = uigs.Create("igs_sidebar", mf)
	mf.sidebar:SetSize(mf:GetWide() - mf.activity:GetWide(), mf.activity:GetTall() + 1 + 1)
	mf.sidebar:SetPos(x + mf.activity:GetWide(),y - 1) -- -1 чтобы перекрыть подчеркивание хэдера
	mf.sidebar.PaintOver = function(_,_,h)
		surface.SetDrawColor(IGS.col.HARD_LINE)
		surface.DrawLine(0,0,0,h) -- линия слева
	end
	mf.sidebar.header.Paint = function(_,w,h)
		draw.RoundedBox(0,0,0,w,h,IGS.col.FRAME_HEADER)

		surface.SetDrawColor(IGS.col.HARD_LINE)
		surface.DrawLine(0,h - 1,w,h - 1)
	end

	mf.sidebar.activity = uigs.Create("igs_multipanel", mf.sidebar.sidebar)
	mf.sidebar.activity:Dock(FILL)

	function mf.sidebar:AddPanel(panel,active)
		return self.activity:AddPanel(panel,active)
	end

	function mf.sidebar:Show(iPanelID)
		return self.activity:SetActivePanel(iPanelID)
	end

	function mf.sidebar:AddPage(sTitle)
		return uigs.Create("Panel", function(bg)
			bg.side = uigs.Create("igs_scroll")

			bg.SidePanelID = self:AddPanel(bg.side)
			bg.side:SetSize(self:GetSize()) -- если указать раньше, то сбросится
			bg.OnOpen = function(s)
				self:SetTitle(sTitle)
				self:Show(s.SidePanelID)

				-- Не знаю как сделать лучше.
				-- ЧТобы не оверрайдить полностью - сделал дополнительный метод
				if bg.OnOpenOver then
					bg.OnOpenOver()
				end
			end
		end, self)
	end

	-- Немного не правильно, но эта штука отключает
	for hook_name in pairs(IGS.C.DisabledFrames) do
		hook.Remove("IGS.CatchActivities",hook_name)
	end

	-- Собираем кнопочки в футере
	hook.Run("IGS.CatchActivities",mf.activity,mf.sidebar)

	return mf
end

function IGS.GetUI()
	return IsValid(mf) and mf or nil
end

function IGS.CloseUI()
	if IsValid(mf) then
		mf:Close()
	end
end

local lastX,lastY -- remember
function IGS.HideUI()
	if not mf.moving then
		mf.moving = true
		lastX,lastY = mf:GetPos()
		mf:MoveTo(-mf:GetWide(), lastY, .2)
		timer.Simple(.2, function()
			mf:SetVisible(false)
			mf.moving = false
		end)
	end
end

function IGS.ShowUI()
	if not mf.moving then
		mf.moving = true
		mf:SetVisible(true)
		mf:MoveTo(lastX, lastY, .2)
		timer.Simple(.2, function() mf.moving = false end)
	end
end

function IGS.OpenUITab(sName)
	local iui = IGS.GetUI() or IGS.UI()

	for _,btn in ipairs(iui.activity.Buttons) do
		if btn:Name() == sName then
			btn:DoClick()
		end
	end
end

-- Добавляет блок текста к скролл панели. К обычной не вижу смысла
-- scroll Должен иметь статический размер. Никаких доков!
-- Сетка: https://img.qweqwe.ovh/1487023074990.png
function IGS.AddTextBlock(scroll,sTitle,sText) -- используется в фрейме хелпа и чартов
	-- \/ вставленная панель
	return scroll:AddItem(uigs.Create("Panel", function(pnl)
		local y = 3

		-- Title
		if sTitle then
			for _,line in ipairs( string.Wrap("igs.20",sTitle,scroll:GetWide() - 5 - 5) ) do
				local t = uigs.Create("DLabel", pnl)
				t:SetPos(5,y)
				t:SetFont("igs.20")
				t:SetText(line)
				t:SetTextColor(IGS.col.TEXT_HARD)
				t:SizeToContents()

				y = y + t:GetTall()
			end

			y = y + 2
		end

		for _,line in ipairs( string.Wrap("igs.18",sText,scroll:GetWide() - 5 - 5) ) do
			local lbl = uigs.Create("DLabel", pnl)
			lbl:SetPos(5,y)
			lbl:SetFont("igs.18")
			lbl:SetText(line)
			lbl:SetTextColor(IGS.col.TEXT_SOFT)
			lbl:SizeToContents()

			y = y + lbl:GetTall()
		end

		pnl:SetTall(y + 10)
	end))
end

function IGS.AddButton(pScroll,sName,fDoClick) -- используется в инвентаре и профиле для юза купонов
	-- \/ вставленная панель
	return pScroll:AddItem(uigs.Create("Panel", function(pan)
		pan.button = uigs.Create("igs_button", function(s)
			s:SetSize(pScroll:GetWide() - 5 - 5,50)
			s:SetPos(5,5)
			s:SetText(sName)
			s.DoClick = fDoClick
		end, pan)

		pan:SetTall(pan.button:GetTall() + 5)
	end))
end

-- IGS.UI()

-- timer.Create("IGSUI",30,1,function()
-- 	if IsValid(mf) then
-- 		mf:Close()
-- 	end
-- end)

--PATH addons/lvs_base-main/lua/lvs_framework/autorun/cl_menu.lua:

local icon_load_version = Material("gui/html/refresh")

local bgMat = Material( "lvs/controlpanel_bg.png" )
local adminMat = Material( "icon16/shield.png" )
local gradient_mat = Material( "gui/gradient" )
local gradient_down = Material( "gui/gradient_down" )

local FrameSizeX = 600
local FrameSizeY = 400

local function ClientSettings( Canvas )
	local TopPanel = vgui.Create( "DPanel", Canvas )
	TopPanel:SetSize( FrameSizeX, FrameSizeY * 0.35 )
	TopPanel.Paint = function( self, w, h )
		surface.SetDrawColor( 80, 80, 80, 255 )
		surface.SetMaterial( gradient_mat )
		surface.DrawTexturedRect( 1, 0, w, 1 )

		draw.DrawText( "Mouse", "LVS_FONT", 4, 4, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
	end
	TopPanel:Dock( BOTTOM )

	local RightPanel = vgui.Create( "DPanel", Canvas )
	RightPanel:SetSize( FrameSizeX * 0.5, FrameSizeY )
	RightPanel.Paint = function( self, w, h )
		surface.SetDrawColor( 80, 80, 80, 255 )
		surface.SetMaterial( gradient_down )
		surface.DrawTexturedRect( 0, 0, 1, h )
		draw.DrawText( "Misc/Performance", "LVS_FONT", 4, 4, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
	end
	RightPanel:Dock( RIGHT )

	local RightPanelRight = vgui.Create( "DPanel", RightPanel )
	RightPanelRight:SetSize( FrameSizeX * 0.25, FrameSizeY )
	RightPanelRight.Paint = function() end
	RightPanelRight:Dock( RIGHT )

	local LeftPanel = vgui.Create( "DPanel", Canvas )
	LeftPanel:SetSize( FrameSizeX * 0.5, FrameSizeY )
	LeftPanel.Paint = function( self, w, h )
		draw.DrawText( "Preferences", "LVS_FONT", 4, 4, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
	end
	LeftPanel:Dock( LEFT )

	local CheckBoxPanel = vgui.Create( "DPanel", TopPanel )
	CheckBoxPanel:DockMargin( 0, 0, 0, 0 )
	CheckBoxPanel:SetSize( FrameSizeX, 55 )
	CheckBoxPanel.Paint = function() end
	CheckBoxPanel:Dock( TOP )

	if GetConVar( "lvs_mouseaim_type" ):GetInt() == 1 and not LVS:IsDirectInputForced() then
		local CheckBoxType = vgui.Create( "DCheckBoxLabel", CheckBoxPanel )
		CheckBoxType:SetSize( FrameSizeX * 0.5, 55 )
		CheckBoxType:DockMargin( 16, 36, 0, 0 )
		CheckBoxType:Dock( LEFT )
		CheckBoxType:SetText( "Mouse-Aim for:" )
		CheckBoxType:SetConVar("lvs_mouseaim_type") 
		CheckBoxType.OnChange = function( self, bVal )
			if not isbool( self.first ) then self.first = true return end
			timer.Simple(0.1, function() LVS:OpenMenu( true ) end )
		end

		local DScrollPanel = vgui.Create("DScrollPanel", CheckBoxPanel )
		DScrollPanel:SetSize( FrameSizeX * 0.25, 55 )
		DScrollPanel:DockMargin( 8, 0, 8, 0 )
		DScrollPanel:Dock( LEFT )

		for _, vehicletype in pairs( LVS:GetVehicleTypes() ) do
			local ScrollOption = vgui.Create( "DCheckBoxLabel", DScrollPanel )
			ScrollOption:SetText( vehicletype )
			ScrollOption:Dock( TOP )
			ScrollOption:DockMargin( 0, 0, 0, 5 )
			ScrollOption:SetConVar("lvs_mouseaim_type_"..vehicletype) 
		end
	else
		local CheckBox = vgui.Create( "DCheckBoxLabel", CheckBoxPanel )
		CheckBox:SetSize( FrameSizeX * 0.5, 55 )
		CheckBox:DockMargin( 16, 36, 0, 0 )
		CheckBox:Dock( LEFT )
		CheckBox:SetText( "Mouse-Aim Steering" )
		CheckBox:SetConVar("lvs_mouseaim") 
		CheckBox.OnChange = function( self, bVal )
			if not isbool( self.first ) then self.first = true return end
			timer.Simple(0.1, function() LVS:OpenMenu( true ) end )
		end
		if LVS:IsDirectInputForced() then
			CheckBox:SetText( "[DISABLED] Use Mouse-Aim Steering" )
			CheckBox:SetDisabled( true )
		end

		if not LVS:IsDirectInputForced() then
			local CheckBoxType = vgui.Create( "DCheckBoxLabel", CheckBoxPanel )
			CheckBoxType:SetSize( FrameSizeX * 0.5, 55 )
			CheckBoxType:DockMargin( 16, 36, 0, 0 )
			CheckBoxType:Dock( LEFT )
			CheckBoxType:SetText( "Edit Mouse-Aim per Type" )
			CheckBoxType:SetConVar("lvs_mouseaim_type") 
			CheckBoxType.OnChange = function( self, bVal )
				if not isbool( self.first ) then self.first = true return end
				timer.Simple(0.1, function() LVS:OpenMenu( true ) end )
			end
		end
	end

	if GetConVar( "lvs_mouseaim" ):GetInt() == 0 or LVS:IsDirectInputForced() then
		local L = vgui.Create( "DPanel", TopPanel )
		L:SetSize( FrameSizeX * 0.5, FrameSizeY )
		L.Paint = function() end
		L:Dock( LEFT )

		local R = vgui.Create( "DPanel", TopPanel )
		R:SetSize( FrameSizeX * 0.5, FrameSizeY )
		R.Paint = function() end
		R:Dock( RIGHT )

		local slider = vgui.Create( "DNumSlider", R )
		slider:DockMargin( 16, 4, 16, 4 )
		slider:Dock( TOP )
		slider:SetText( "Y Sensitivity" )
		slider:SetMin( -10 )
		slider:SetMax( 10 )
		slider:SetDecimals( 3 )
		slider:SetConVar( "lvs_sensitivity_y" )

		local slider = vgui.Create( "DNumSlider", L )
		slider:DockMargin( 16, 4, 16, 4 )
		slider:Dock( TOP )
		slider:SetText( "X Sensitivity" )
		slider:SetMin( 0 )
		slider:SetMax( 10 )
		slider:SetDecimals( 3 )
		slider:SetConVar( "lvs_sensitivity_x" )

		local slider = vgui.Create( "DNumSlider", L )
		slider:DockMargin( 16, 4, 16, 4 )
		slider:Dock( TOP )
		slider:SetText( "Return Delta" )
		slider:SetMin( 0 )
		slider:SetMax( 10 )
		slider:SetDecimals( 3 )
		slider:SetConVar( "lvs_return_delta" )
	else
		local slider = vgui.Create( "DNumSlider", TopPanel )
		slider:DockMargin( 16, 4, 16, 4 )
		slider:Dock( TOP )
		slider:SetText( "Camera Focus" )
		slider:SetMin( -1 )
		slider:SetMax( 1 )
		slider:SetDecimals( 2 )
		slider:SetConVar( "lvs_camerafocus" )
	end

	local slider = vgui.Create( "DNumSlider", LeftPanel )
	slider:DockMargin( 16, 36, 16, 4 )
	slider:Dock( TOP )
	slider:SetText( "Engine Volume" )
	slider:SetMin( 0 )
	slider:SetMax( 1 )
	slider:SetDecimals( 2 )
	slider:SetConVar( "lvs_volume" )

	local CheckBox = vgui.Create( "DCheckBoxLabel", RightPanel )
	CheckBox:DockMargin( 16, 43, 4, 4 )
	CheckBox:SetSize( FrameSizeX, 30 )
	CheckBox:Dock( TOP )
	CheckBox:SetText( "Show Team Identifier" )
	CheckBox:SetConVar("lvs_show_identifier") 
	if LVS:IsIndicatorForced() then
		CheckBox:SetText( "[DISABLED] Team Identifier" )
		CheckBox:SetDisabled( true )
	end

	local CheckBox = vgui.Create( "DCheckBoxLabel", RightPanel )
	CheckBox:DockMargin( 16, 16, 4, 4 )
	CheckBox:SetSize( FrameSizeX, 30 )
	CheckBox:Dock( TOP )
	CheckBox:SetText( "Show Hit/Kill Marker" )
	CheckBox:SetConVar("lvs_hitmarker") 

	local CheckBox = vgui.Create( "DCheckBoxLabel", RightPanel )
	CheckBox:DockMargin( 16, 16, 4, 4 )
	CheckBox:SetSize( FrameSizeX, 30 )
	CheckBox:Dock( TOP )
	CheckBox:SetText( "Enable HUD Editor" )
	CheckBox:SetConVar("lvs_edit_hud") 

	local CheckBox = vgui.Create( "DCheckBoxLabel", RightPanelRight )
	CheckBox:DockMargin( 16, 43, 4, 4 )
	CheckBox:SetSize( FrameSizeX, 30 )
	CheckBox:Dock( TOP )
	CheckBox:SetText( "Trail Effects" )
	CheckBox:SetConVar("lvs_show_traileffects") 

	local CheckBox = vgui.Create( "DCheckBoxLabel", RightPanelRight )
	CheckBox:DockMargin( 16, 16, 4, 4 )
	CheckBox:SetSize( FrameSizeX, 30 )
	CheckBox:Dock( TOP )
	CheckBox:SetText( "Wind/Dust FX/SFX" )
	CheckBox:SetConVar("lvs_show_effects") 

	local CheckBox = vgui.Create( "DCheckBoxLabel", RightPanelRight )
	CheckBox:DockMargin( 16, 16, 4, 4 )
	CheckBox:SetSize( FrameSizeX, 30 )
	CheckBox:Dock( TOP )
	CheckBox:SetText( "Scrape/Impact FX" )
	CheckBox:SetConVar("lvs_show_physicseffects") 

	local CheckBox = vgui.Create( "DCheckBoxLabel", RightPanelRight )
	CheckBox:DockMargin( 16, 16, 4, 4 )
	CheckBox:SetSize( FrameSizeX, 30 )
	CheckBox:Dock( TOP )
	CheckBox:SetText( "Bullet near miss SFX" )
	CheckBox:SetConVar("lvs_bullet_nearmiss")
end

local function ClientControls( Canvas )
	local TextHint = vgui.Create("DPanel", Canvas)
	TextHint:DockMargin( 4, 20, 4, 2 )
	TextHint:SetText("")
	TextHint:Dock( TOP )
	TextHint.Paint = function(self, w, h ) 
		draw.DrawText( "You need to re-enter the vehicle in order for the changes to take effect!", "LVS_FONT_PANEL", w * 0.5, -1, Color( 255, 50, 50, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local DScrollPanel = vgui.Create("DScrollPanel", Canvas)
	DScrollPanel:DockMargin( 0, 0, 0, 24 )
	DScrollPanel:Dock( FILL )

	for category, _ in pairs( LVS.KEYS_CATEGORIES ) do
		local Header = vgui.Create("DPanel", DScrollPanel )
		Header:DockMargin( 0, 4, 4, 2 )
		Header:SetText("")
		Header:Dock( TOP )
		Header.Paint = function(self, w, h ) 
			surface.SetMaterial( gradient_mat )
			surface.SetDrawColor( 80, 80, 80, 255 )
			surface.DrawTexturedRect( 0, 0, w, 1 )
	
			draw.DrawText( category, "LVS_FONT", 4, 0, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		end

		for _, entry in pairs( LVS.KEYS_REGISTERED ) do
			if entry.category ~= category then continue end

			local DPanel = vgui.Create( "DPanel", DScrollPanel )
			DPanel.Paint = function(self, w, h ) end
			DPanel:DockMargin( 4, 2, 4, 2 )
			DPanel:SetSize( FrameSizeX, 25 )
			DPanel:Dock( TOP )

			local ConVar = GetConVar( entry.cmd )

			local DLabel = vgui.Create("DLabel", DPanel)
			DLabel:DockMargin( 16, 0, 0, 0 )
			DLabel:SetText( entry.printname )
			DLabel:SetSize( FrameSizeX * 0.5, 32 )
			DLabel:Dock( LEFT )

			local DBinder = vgui.Create("DBinder", DPanel)
			DBinder:DockMargin( 0, 0, 0, 0 )
			DBinder:SetValue( ConVar:GetInt() )
			DBinder:SetSize( FrameSizeX * 0.5, 32 )
			DBinder:Dock( RIGHT )
			DBinder.ConVar = ConVar
			DBinder.OnChange = function(self,iNum)
				self.ConVar:SetInt(iNum)

				LocalPlayer():lvsBuildControls()
			end
		end
	end

	local Header = vgui.Create("DPanel", DScrollPanel )
	Header:DockMargin( 0, 16, 0, 0 )
	Header:SetText("")
	Header:Dock( TOP )
	Header.Paint = function(self, w, h ) 
		surface.SetMaterial( gradient_mat )
		surface.SetDrawColor( 80, 80, 80, 255 )
		surface.DrawTexturedRect( 0, 0, w, 1 )
	end

	local DButton = vgui.Create("DButton",DScrollPanel)
	DButton:SetText("Reset")
	DButton:DockMargin( 4, 0, 4, 4 )
	DButton:SetSize( FrameSizeX, 32 )
	DButton:Dock( TOP )
	DButton.DoClick = function() 
		surface.PlaySound( "buttons/button14.wav" )

		for _, entry in pairs( LVS.KEYS_REGISTERED ) do
			GetConVar( entry.cmd ):SetInt( entry.default ) 
		end

		LocalPlayer():lvsBuildControls()

		LVS:OpenClientControls()
	end
end

local function ServerSettings( Canvas )
	local slider = vgui.Create( "DNumSlider", Canvas )
	slider:DockMargin( 16, 32, 16, 4 )
	slider:Dock( TOP )
	slider:SetText( "Player Default AI-Team" )
	slider:SetMin( 0 )
	slider:SetMax( 3 )
	slider:SetDecimals( 0 )
	slider:SetConVar( "lvs_default_teams" )
	function slider:OnValueChanged( val )
		net.Start("lvs_admin_setconvar")
			net.WriteString("lvs_default_teams")
			net.WriteString( tostring( math.Round(val,0) ) )
		net.SendToServer()
	end

	local CheckBox = vgui.Create( "DCheckBoxLabel", Canvas )
	CheckBox:DockMargin( 16, 16, 4, 4 )
	CheckBox:SetSize( FrameSizeX, 30 )
	CheckBox:Dock( TOP )
	CheckBox:SetText( "Freeze Player AI-Team" )
	CheckBox:SetValue( GetConVar( "lvs_freeze_teams" ):GetInt() )
	CheckBox:SizeToContents()
	function CheckBox:OnChange( val )
		net.Start("lvs_admin_setconvar")
			net.WriteString("lvs_freeze_teams")
			net.WriteString( tostring( val and 1 or 0 ) )
		net.SendToServer()
	end

	local CheckBox = vgui.Create( "DCheckBoxLabel", Canvas )
	CheckBox:DockMargin( 16, 16, 4, 4 )
	CheckBox:SetSize( FrameSizeX, 30 )
	CheckBox:Dock( TOP )
	CheckBox:SetText( "Only allow Players of matching AI-Team to enter Vehicles" )
	CheckBox:SetValue( GetConVar( "lvs_teampassenger" ):GetInt() )
	CheckBox:SizeToContents()
	function CheckBox:OnChange( val )
		net.Start("lvs_admin_setconvar")
			net.WriteString("lvs_teampassenger")
			net.WriteString( tostring( val and 1 or 0 ) )
		net.SendToServer()
	end

	local CheckBox = vgui.Create( "DCheckBoxLabel", Canvas )
	CheckBox:DockMargin( 16, 16, 4, 4 )
	CheckBox:SetSize( FrameSizeX, 30 )
	CheckBox:Dock( TOP )
	CheckBox:SetText( "LVS-AI ignore NPC's" )
	CheckBox:SetValue( GetConVar( "lvs_ai_ignorenpcs" ):GetInt() )
	CheckBox:SizeToContents()
	function CheckBox:OnChange( val )
		net.Start("lvs_admin_setconvar")
			net.WriteString("lvs_ai_ignorenpcs")
			net.WriteString( tostring( val and 1 or 0 ) )
		net.SendToServer()
	end

	local CheckBox = vgui.Create( "DCheckBoxLabel", Canvas )
	CheckBox:DockMargin( 16, 16, 4, 4 )
	CheckBox:SetSize( FrameSizeX, 30 )
	CheckBox:Dock( TOP )
	CheckBox:SetText( "LVS-AI ignore Players's" )
	CheckBox:SetValue( GetConVar( "lvs_ai_ignoreplayers" ):GetInt() )
	CheckBox:SizeToContents()
	function CheckBox:OnChange( val )
		net.Start("lvs_admin_setconvar")
			net.WriteString("lvs_ai_ignoreplayers")
			net.WriteString( tostring( val and 1 or 0 ) )
		net.SendToServer()
	end

	local CheckBox = vgui.Create( "DCheckBoxLabel", Canvas )
	CheckBox:DockMargin( 16, 16, 4, 4 )
	CheckBox:SetSize( FrameSizeX, 30 )
	CheckBox:Dock( TOP )
	CheckBox:SetText( "Disable Mouse Aim" )
	CheckBox:SetValue( GetConVar( "lvs_force_directinput" ):GetInt() )
	CheckBox:SizeToContents()
	function CheckBox:OnChange( val )
		net.Start("lvs_admin_setconvar")
			net.WriteString("lvs_force_directinput")
			net.WriteString( tostring( val and 1 or 0 ) )
		net.SendToServer()
	end

	local CheckBox = vgui.Create( "DCheckBoxLabel", Canvas )
	CheckBox:DockMargin( 16, 16, 4, 4 )
	CheckBox:SetSize( FrameSizeX, 30 )
	CheckBox:Dock( TOP )
	CheckBox:SetText( "Hide Team Identifier" )
	CheckBox:SetValue( GetConVar( "lvs_force_forceindicator" ):GetInt() )
	CheckBox:SizeToContents()
	function CheckBox:OnChange( val )
		net.Start("lvs_admin_setconvar")
			net.WriteString("lvs_force_forceindicator")
			net.WriteString( tostring( val and 1 or 0 ) )
		net.SendToServer()
	end
end

function LVS:OpenClientSettings()
	if not IsValid( LVS.Frame ) then return end

	local BasePanel = LVS.Frame:CreatePanel()

	local DPanel = vgui.Create( "DPanel", BasePanel )
	DPanel.Paint = function(self, w, h ) end
	DPanel:DockMargin( 0, 0, 0, 0 )
	DPanel:SetSize( FrameSizeX, 25 )
	DPanel:Dock( TOP )

	local TabPanel = vgui.Create( "DPanel", BasePanel )
	TabPanel.Paint = function(self, w, h ) end
	TabPanel:DockMargin( 0, 0, 0, 0 )
	TabPanel:SetSize( FrameSizeX, 25 )
	TabPanel:Dock( TOP )

	local SettingsPanel = vgui.Create( "DPanel", TabPanel )
	SettingsPanel:DockMargin( 0, 0, 0, 0 )
	SettingsPanel:SetSize( FrameSizeX * 0.5, 32 )
	SettingsPanel:Dock( LEFT )
	SettingsPanel.Paint = function(self, w, h ) 
		draw.DrawText( "SETTINGS", "LVS_FONT", w * 0.5, 0, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local DButton = vgui.Create( "DButton", TabPanel )
	DButton:DockMargin( 0, 0, 0, 0 )
	DButton:SetText( "" )
	DButton:SetSize( FrameSizeX * 0.5, 32 )
	DButton:Dock( RIGHT )
	DButton.DoClick = function()
		surface.PlaySound( "buttons/button14.wav" )
		LVS:OpenClientControls()
	end
	DButton.Paint = function(self, w, h ) 
		surface.SetDrawColor(0, 0, 0, 255)
		surface.DrawRect(0, 0, w, h)

		local Hovered = self:IsHovered()

		if Hovered then
			surface.SetDrawColor( 120, 120, 120, 255 )
		else
			surface.SetDrawColor( 80, 80, 80, 255 )
		end

		surface.DrawRect(1, 0, w-2, h-1)

		local Col = Hovered and Color( 255, 255, 255, 255 ) or Color( 150, 150, 150, 255 )
		draw.DrawText( "CONTROLS", "LVS_FONT", w * 0.5, 0, Col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local DButton = vgui.Create( "DButton", DPanel )
	DButton:DockMargin( 0, 0, 0, 0 )
	DButton:SetText( "" )
	DButton:SetSize( FrameSizeX * 0.5, 32 )
	DButton:Dock( RIGHT )
	DButton.DoClick = function()
		if LocalPlayer():IsSuperAdmin() then
			surface.PlaySound( "buttons/button14.wav" )
			LVS:OpenServerMenu()
		else
			surface.PlaySound( "buttons/button11.wav" )
		end
	end
	DButton.Paint = function(self, w, h ) 
		surface.SetDrawColor(0, 0, 0, 255)
		surface.DrawRect(0, 0, w, h)

		local Hovered = self:IsHovered()

		if Hovered then
			draw.RoundedBox( 4, 1, 1, w-2, h-2, Color( 120, 120, 120, 255 ) )
		else
			draw.RoundedBox( 4, 1, 1, w-2, h-2, Color( 80, 80, 80, 255 ) )
		end

		surface.SetDrawColor( 255, 255, 255, Hovered and 255 or 50 )
		surface.SetMaterial( adminMat )
		surface.DrawTexturedRect( 3, 2, 16, 16 )

		local Col = Hovered and Color( 255, 255, 255, 255 ) or Color( 150, 150, 150, 255 )
		draw.DrawText( "SERVER", "LVS_FONT", w * 0.5, 0, Col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local ClientPanel = vgui.Create( "DPanel", DPanel )
	ClientPanel.Paint = function(self, w, h ) end
	ClientPanel:DockMargin( 0, 0, 0, 0 )
	ClientPanel:SetSize( FrameSizeX * 0.5, 32 )
	ClientPanel:Dock( LEFT )
	ClientPanel.Paint = function(self, w, h ) 
		draw.DrawText( "CLIENT", "LVS_FONT", w * 0.5, 0, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local Canvas = vgui.Create( "DPanel", BasePanel )
	Canvas.Paint = function(self, w, h ) end
	Canvas:DockMargin( 0, 0, 0, 0 )
	Canvas:SetSize( FrameSizeX, 25 )
	Canvas:Dock( FILL )

	ClientSettings( Canvas )
end

function LVS:OpenClientControls()
	if not IsValid( LVS.Frame ) then return end

	local BasePanel = LVS.Frame:CreatePanel()

	local DPanel = vgui.Create( "DPanel", BasePanel )
	DPanel.Paint = function(self, w, h ) end
	DPanel:DockMargin( 0, 0, 0, 0 )
	DPanel:SetSize( FrameSizeX, 25 )
	DPanel:Dock( TOP )

	local TabPanel = vgui.Create( "DPanel", BasePanel )
	TabPanel.Paint = function(self, w, h ) end
	TabPanel:DockMargin( 0, 0, 0, 0 )
	TabPanel:SetSize( FrameSizeX, 25 )
	TabPanel:Dock( TOP )

	local SettingsPanel = vgui.Create( "DPanel", TabPanel )
	SettingsPanel:DockMargin( 0, 0, 0, 0 )
	SettingsPanel:SetSize( FrameSizeX * 0.5, 32 )
	SettingsPanel:Dock( RIGHT )
	SettingsPanel.Paint = function(self, w, h ) 
		draw.DrawText( "CONTROLS", "LVS_FONT", w * 0.5, 0, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local DButton = vgui.Create( "DButton", TabPanel )
	DButton:DockMargin( 0, 0, 0, 0 )
	DButton:SetText( "" )
	DButton:SetSize( FrameSizeX * 0.5, 32 )
	DButton:Dock( LEFT )
	DButton.DoClick = function()
		surface.PlaySound( "buttons/button14.wav" )
		LVS:OpenClientSettings()
	end
	DButton.Paint = function(self, w, h ) 
		surface.SetDrawColor(0, 0, 0, 255)
		surface.DrawRect(0, 0, w, h)

		local Hovered = self:IsHovered()

		if Hovered then
			surface.SetDrawColor( 120, 120, 120, 255 )
		else
			surface.SetDrawColor( 80, 80, 80, 255 )
		end

		surface.DrawRect(1, 1, w-2, h-2)

		local Col = Hovered and Color( 255, 255, 255, 255 ) or Color( 150, 150, 150, 255 )
		draw.DrawText( "SETTINGS", "LVS_FONT", w * 0.5, 0, Col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local DButton = vgui.Create( "DButton", DPanel )
	DButton:DockMargin( 0, 0, 0, 0 )
	DButton:SetText( "" )
	DButton:SetSize( FrameSizeX * 0.5, 32 )
	DButton:Dock( RIGHT )
	DButton.DoClick = function()
		if LocalPlayer():IsSuperAdmin() then
			surface.PlaySound( "buttons/button14.wav" )
			LVS:OpenServerMenu()
		else
			surface.PlaySound( "buttons/button11.wav" )
		end
	end
	DButton.Paint = function(self, w, h ) 
		surface.SetDrawColor(0, 0, 0, 255)
		surface.DrawRect(0, 0, w, h)

		local Hovered = self:IsHovered()

		if Hovered then
			draw.RoundedBox( 4, 1, 1, w-2, h-2, Color( 120, 120, 120, 255 ) )
		else
			draw.RoundedBox( 4, 1, 1, w-2, h-2, Color( 80, 80, 80, 255 ) )
		end

		surface.SetDrawColor( 255, 255, 255, Hovered and 255 or 50 )
		surface.SetMaterial( adminMat )
		surface.DrawTexturedRect( 3, 2, 16, 16 )

		local Col = Hovered and Color( 255, 255, 255, 255 ) or Color( 150, 150, 150, 255 )
		draw.DrawText( "SERVER", "LVS_FONT", w * 0.5, 0, Col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local ClientPanel = vgui.Create( "DPanel", DPanel )
	ClientPanel.Paint = function(self, w, h ) end
	ClientPanel:DockMargin( 0, 0, 0, 0 )
	ClientPanel:SetSize( FrameSizeX * 0.5, 32 )
	ClientPanel:Dock( LEFT )
	ClientPanel.Paint = function(self, w, h ) 
		draw.DrawText( "CLIENT", "LVS_FONT", w * 0.5, 0, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local Canvas = vgui.Create( "DPanel", BasePanel )
	Canvas.Paint = function(self, w, h ) end
	Canvas:DockMargin( 0, 0, 0, 0 )
	Canvas:SetSize( FrameSizeX, 25 )
	Canvas:Dock( FILL )

	ClientControls( Canvas )
end

function LVS:OpenServerMenu()
	if not IsValid( LVS.Frame ) then return end

	local BasePanel = LVS.Frame:CreatePanel()

	local DPanel = vgui.Create( "DPanel", BasePanel )
	DPanel.Paint = function(self, w, h ) end
	DPanel:DockMargin( 0, 0, 0, 0 )
	DPanel:SetSize( FrameSizeX, 25 )
	DPanel:Dock( TOP )

	local ServerPanel = vgui.Create( "DPanel", DPanel )
	ServerPanel.Paint = function(self, w, h ) end
	ServerPanel:DockMargin( 0, 0, 0, 0 )
	ServerPanel:SetSize( FrameSizeX * 0.5, 32 )
	ServerPanel:Dock( RIGHT )
	ServerPanel.Paint = function(self, w, h ) 
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetMaterial( adminMat )
		surface.DrawTexturedRect( 3, 2, 16, 16 )
		draw.DrawText( "SERVER", "LVS_FONT", w * 0.5, 0, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local DButton = vgui.Create( "DButton", DPanel )
	DButton:DockMargin( 0, 0, 0, 0 )
	DButton:SetText( "" )
	DButton:SetSize( FrameSizeX * 0.5, 32 )
	DButton:Dock( LEFT )
	DButton.DoClick = function()
		surface.PlaySound( "buttons/button14.wav" )
		LVS:OpenClientSettings()
	end
	DButton.Paint = function(self, w, h ) 
		surface.SetDrawColor(0, 0, 0, 255)
		surface.DrawRect(0, 0, w, h)

		local Hovered = self:IsHovered()

		if Hovered then
			draw.RoundedBox( 4, 1, 1, w-2, h-2, Color( 120, 120, 120, 255 ) )
		else
			draw.RoundedBox( 4, 1, 1, w-2, h-2, Color( 80, 80, 80, 255 ) )
		end

		local Col = Hovered and Color( 255, 255, 255, 255 ) or Color( 150, 150, 150, 255 )
		draw.DrawText( "CLIENT", "LVS_FONT", w * 0.5, 0, Col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end

	local Canvas = vgui.Create( "DPanel", BasePanel )
	Canvas.Paint = function(self, w, h ) end
	Canvas:DockMargin( 0, 0, 0, 0 )
	Canvas:SetSize( FrameSizeX, 25 )
	Canvas:Dock( FILL )

	ServerSettings( Canvas )
end

function LVS:CloseMenu()
	if not IsValid( LVS.Frame ) then return end

	LVS.Frame:Close()
	LVS.Frame = nil
end

function LVS:OpenMenu( keep_position )
	local xPos
	local yPos

	if IsValid( LVS.Frame ) then
		if keep_position then
			xPos = LVS.Frame:GetX()
			yPos = LVS.Frame:GetY()
		end

		LVS:CloseMenu()
	end

	LVS.Frame = vgui.Create( "DFrame" )
	LVS.Frame:SetSize( FrameSizeX, FrameSizeY )
	LVS.Frame:SetTitle( "" )
	LVS.Frame:SetDraggable( true )
	LVS.Frame:SetScreenLock( true )
	LVS.Frame:MakePopup()
	LVS.Frame:Center()
	if keep_position and xPos and yPos then
		LVS.Frame:SetPos( xPos, yPos )
	end

	LVS.Frame.Paint = function(self, w, h )
		draw.RoundedBox( 8, 0, 0, w, h, Color( 0, 0, 0, 255 ) )
		draw.RoundedBoxEx( 8, 1, 26, w-2, h-27, Color( 120, 120, 120, 255 ), false, false, true, true )
		draw.RoundedBoxEx( 8, 0, 0, w, 25, LVS.ThemeColor, true, true )

		draw.SimpleText( "[LVS] - Control Panel ", "LVS_FONT", 5, 11, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

		surface.SetDrawColor( 255, 255, 255, 50 )
		surface.SetMaterial( bgMat )
		surface.DrawTexturedRect( 0, -50, w, w )
	end
	LVS.Frame.CreatePanel = function( self )

		if IsValid( self.OldPanel ) then
			self.OldPanel:Remove()
			self.OldPanel = nil
		end

		local DPanel = vgui.Create( "DPanel", LVS.Frame )
		DPanel:SetPos( 0, 25 )
		DPanel:SetSize( FrameSizeX, FrameSizeY - 25 )
		DPanel.Paint = function(self, w, h )
			local Col = Color( 255, 191, 0, 255 ) 

			if LVS.VERSION_GITHUB == 0 then
				surface.SetMaterial( icon_load_version )
				surface.SetDrawColor( Col )
				surface.DrawTexturedRectRotated( w - 14, h - 14, 16, 16, -CurTime() * 200 )

				draw.SimpleText( "v"..LVS:GetVersion()..LVS.VERSION_TYPE, "LVS_VERSION", w - 23, h - 14, Col, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )

				return
			end

			local Current = LVS:GetVersion()
			local Latest = LVS.VERSION_GITHUB

			local Pref = "v"

			if Current >= Latest and not LVS.VERSION_ADDONS_OUTDATED then
				Col = Color(0,255,0,255)
			else
				Col = Color(255,0,0,255)
				Pref = "OUTDATED v"
			end

			draw.SimpleText( Pref..LVS:GetVersion()..LVS.VERSION_TYPE, "LVS_VERSION", w - 7, h - 14, Col, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
		end

		self.OldPanel = DPanel

		return DPanel
	end

	LVS:OpenClientSettings()
end

list.Set( "DesktopWindows", "LVSMenu", {
	title = "[LVS] Settings",
	icon = "icon64/iconlvs.png",
	init = function( icon, window )
		LVS:OpenMenu()
	end
} )

concommand.Add( "lvs_openmenu", function( ply, cmd, args ) LVS:OpenMenu() end )
--PATH addons/media_player/lua/autorun/includes/extensions/sh_url.lua:
-----------------------------------------------------------------------------
-- URI parsing, composition and relative URL resolution
-- LuaSocket toolkit.
-- Author: Diego Nehab
-- RCS ID: $Id: url.lua,v 1.38 2006/04/03 04:45:42 diego Exp $
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
-- Declare module
-----------------------------------------------------------------------------
local string = string
local base = _G
local table = table
local pairs = pairs
local ipairs = ipairs
local tonumber = tonumber
local type = type
module("url")

-----------------------------------------------------------------------------
-- Module version
-----------------------------------------------------------------------------
_VERSION = "URL 1.0.1"

-----------------------------------------------------------------------------
-- HTML Entity Translation Table
-- http://lua-users.org/lists/lua-l/2005-10/msg00328.html
-----------------------------------------------------------------------------
local entities = {
	[' '] = '&nbsp;',
	['¡'] = '&iexcl;',
	['¢'] = '&cent;',
	['£'] = '&pound;',
	['¤'] = '&curren;',
	['¥'] = '&yen;',
	['¦'] = '&brvbar;',
	['§'] = '&sect;',
	['¨'] = '&uml;',
	['©'] = '&copy;',
	['ª'] = '&ordf;',
	['«'] = '&laquo;',
	['¬'] = '&not;',
	['­'] = '&shy;',
	['®'] = '&reg;',
	['¯'] = '&macr;',
	['°'] = '&deg;',
	['±'] = '&plusmn;',
	['²'] = '&sup2;',
	['³'] = '&sup3;',
	['´'] = '&acute;',
	['µ'] = '&micro;',
	['¶'] = '&para;',
	['·'] = '&middot;',
	['¸'] = '&cedil;',
	['¹'] = '&sup1;',
	['º'] = '&ordm;',
	['»'] = '&raquo;',
	['¼'] = '&frac14;',
	['½'] = '&frac12;',
	['¾'] = '&frac34;',
	['¿'] = '&iquest;',
	['À'] = '&Agrave;',
	['Á'] = '&Aacute;',
	['Â'] = '&Acirc;',
	['Ã'] = '&Atilde;',
	['Ä'] = '&Auml;',
	['Å'] = '&Aring;',
	['Æ'] = '&AElig;',
	['Ç'] = '&Ccedil;',
	['È'] = '&Egrave;',
	['É'] = '&Eacute;',
	['Ê'] = '&Ecirc;',
	['Ë'] = '&Euml;',
	['Ì'] = '&Igrave;',
	['Í'] = '&Iacute;',
	['Î'] = '&Icirc;',
	['Ï'] = '&Iuml;',
	['Ð'] = '&ETH;',
	['Ñ'] = '&Ntilde;',
	['Ò'] = '&Ograve;',
	['Ó'] = '&Oacute;',
	['Ô'] = '&Ocirc;',
	['Õ'] = '&Otilde;',
	['Ö'] = '&Ouml;',
	['×'] = '&times;',
	['Ø'] = '&Oslash;',
	['Ù'] = '&Ugrave;',
	['Ú'] = '&Uacute;',
	['Û'] = '&Ucirc;',
	['Ü'] = '&Uuml;',
	['Ý'] = '&Yacute;',
	['Þ'] = '&THORN;',
	['ß'] = '&szlig;',
	['à'] = '&agrave;',
	['á'] = '&aacute;',
	['â'] = '&acirc;',
	['ã'] = '&atilde;',
	['ä'] = '&auml;',
	['å'] = '&aring;',
	['æ'] = '&aelig;',
	['ç'] = '&ccedil;',
	['è'] = '&egrave;',
	['é'] = '&eacute;',
	['ê'] = '&ecirc;',
	['ë'] = '&euml;',
	['ì'] = '&igrave;',
	['í'] = '&iacute;',
	['î'] = '&icirc;',
	['ï'] = '&iuml;',
	['ð'] = '&eth;',
	['ñ'] = '&ntilde;',
	['ò'] = '&ograve;',
	['ó'] = '&oacute;',
	['ô'] = '&ocirc;',
	['õ'] = '&otilde;',
	['ö'] = '&ouml;',
	['÷'] = '&divide;',
	['ø'] = '&oslash;',
	['ù'] = '&ugrave;',
	['ú'] = '&uacute;',
	['û'] = '&ucirc;',
	['ü'] = '&uuml;',
	['ý'] = '&yacute;',
	['þ'] = '&thorn;',
	['ÿ'] = '&yuml;',
	['"'] = '&quot;',
	["'"] = '&#39;',
	['<'] = '&lt;',
	['>'] = '&gt;',
	['&'] = '&amp;'
}

function htmlentities(s)
	for k, v in pairs(entities) do
		s = string.gsub(s, k, v)
	end
	return s
end

function htmlentities_decode(s)
	for k, v in pairs(entities) do
		s = string.gsub(s, v, k)
	end
	return s
end

-----------------------------------------------------------------------------
-- Encodes a string into its escaped hexadecimal representation
-- Input
--   s: binary string to be encoded
-- Returns
--   escaped representation of string binary
-----------------------------------------------------------------------------
function escape(s)
	return string.gsub(s, "([^A-Za-z0-9_])", function(c)
		return string.format("%%%02x", string.byte(c))
	end)
end

-----------------------------------------------------------------------------
-- Protects a path segment, to prevent it from interfering with the
-- url parsing.
-- Input
--   s: binary string to be encoded
-- Returns
--   escaped representation of string binary
-----------------------------------------------------------------------------
local function make_set(t)
	local s = {}
	for i,v in ipairs(t) do
		s[t[i]] = 1
	end
	return s
end

-- these are allowed withing a path segment, along with alphanum
-- other characters must be escaped
local segment_set = make_set {
	"-", "_", ".", "!", "~", "*", "'", "(",
	")", ":", "@", "&", "=", "+", "$", ",",
}

local function protect_segment(s)
	return string.gsub(s, "([^A-Za-z0-9_])", function (c)
		if segment_set[c] then return c
		else return string.format("%%%02x", string.byte(c)) end
	end)
end

-----------------------------------------------------------------------------
-- Encodes a string into its escaped hexadecimal representation
-- Input
--   s: binary string to be encoded
-- Returns
--   escaped representation of string binary
-----------------------------------------------------------------------------
function unescape(s)
	return string.gsub(s, "%%(%x%x)", function(hex)
		return string.char(tonumber(hex, 16))
	end)
end

-----------------------------------------------------------------------------
-- Builds a path from a base path and a relative path
-- Input
--   base_path
--   relative_path
-- Returns
--   corresponding absolute path
-----------------------------------------------------------------------------
local function absolute_path(base_path, relative_path)
	if string.sub(relative_path, 1, 1) == "/" then return relative_path end
	local path = string.gsub(base_path, "[^/]*$", "")
	path = path .. relative_path
	path = string.gsub(path, "([^/]*%./)", function (s)
		if s ~= "./" then return s else return "" end
	end)
	path = string.gsub(path, "/%.$", "/")
	local reduced
	while reduced ~= path do
		reduced = path
		path = string.gsub(reduced, "([^/]*/%.%./)", function (s)
			if s ~= "../../" then return "" else return s end
		end)
	end
	path = string.gsub(reduced, "([^/]*/%.%.)$", function (s)
		if s ~= "../.." then return "" else return s end
	end)
	return path
end

-----------------------------------------------------------------------------
-- Parses a url and returns a table with all its parts according to RFC 2396
-- The following grammar describes the names given to the URL parts
-- <url> ::= <scheme>://<authority>/<path>;<params>?<query>#<fragment>
-- <authority> ::= <userinfo>@<host>:<port>
-- <userinfo> ::= <user>[:<password>]
-- <path> :: = {<segment>/}<segment>
-- Input
--   url: uniform resource locator of request
--   default: table with default values for each field
-- Returns
--   table with the following fields, where RFC naming conventions have
--   been preserved:
--     scheme, authority, userinfo, user, password, host, port,
--     path, params, query, fragment
-- Obs:
--   the leading '/' in {/<path>} is considered part of <path>
-----------------------------------------------------------------------------
function parse(url, default)
	-- initialize default parameters
	local parsed = {}
	for i,v in pairs(default or parsed) do parsed[i] = v end
	-- empty url is parsed to nil
	if not url or url == "" then return nil, "invalid url" end
	-- remove whitespace
	-- url = string.gsub(url, "%s", "")
	-- get fragment
	url = string.gsub(url, "#(.*)$", function(f)
		parsed.fragment = f
		return ""
	end)
	-- get scheme
	url = string.gsub(url, "^([%w][%w%+%-%.]*)%://",
		function(s) parsed.scheme = s; return "" end)
	-- get authority
	url = string.gsub(url, "^([^/%?]*)", function(n)
		parsed.authority = n
		return ""
	end)
	-- get query stringing
	url = string.gsub(url, "%?(.*)", function(q)
		parsed.query = q
		return ""
	end)
	-- get params
	url = string.gsub(url, "%;(.*)", function(p)
		parsed.params = p
		return ""
	end)
	-- path is whatever was left
	if url ~= "" then parsed.path = url else parsed.path = "/" end
	local authority = parsed.authority
	if not authority then return parsed end
	authority = string.gsub(authority,"^([^@]*)@",
		function(u) parsed.userinfo = u; return "" end)
	authority = string.gsub(authority, ":([^:]*)$",
		function(p) parsed.port = p; return "" end)
	if authority ~= "" then parsed.host = authority end
	local userinfo = parsed.userinfo
	if not userinfo then return parsed end
	userinfo = string.gsub(userinfo, ":([^:]*)$",
		function(p) parsed.password = p; return "" end)
	parsed.user = userinfo
	return parsed
end

-----------------------------------------------------------------------------
-- Parses the url and also seperates the query terms into a table
-----------------------------------------------------------------------------
function parse2(url, default)
	local parsed = parse(url, default)

	if parsed.query then
		local prmstr = parsed.query
		local prmarr = string.Explode("&", prmstr)
		local params = {}

		for i = 1, #prmarr do
			local tmparr = string.Explode("=", prmarr[i])
			params[tmparr[1]] = tmparr[2]
		end

		parsed.query = params
	end

	if parsed.fragment then
		local prmstr = parsed.fragment
		local prmarr = string.Explode("&", prmstr)
		local params = {}

		for i = 1, #prmarr do
			local tmparr = string.Explode("=", prmarr[i])
			params[tmparr[1]] = tmparr[2]
		end

		parsed.fragment = params
	end

	return parsed
end

-----------------------------------------------------------------------------
-- Rebuilds a parsed URL from its components.
-- Components are protected if any reserved or unallowed characters are found
-- Input
--   parsed: parsed URL, as returned by parse
-- Returns
--   a stringing with the corresponding URL
-----------------------------------------------------------------------------
function build(parsed)
	local ppath = parse_path(parsed.path or "")
	local url = build_path(ppath)
	local url = (parsed.path or ""):gsub("[^/]+", unescape)
	local url = url:gsub("[^/]*", protect_segment)
	if parsed.params then url = url .. ";" .. parsed.params end
	if parsed.query then url = url .. "?" .. parsed.query end
	local authority = parsed.authority
	if parsed.host then
		authority = parsed.host
		if parsed.port then authority = authority .. ":" .. parsed.port end
		local userinfo = parsed.userinfo
		if parsed.user then
			userinfo = parsed.user
			if parsed.password then
				userinfo = userinfo .. ":" .. parsed.password
			end
		end
		if userinfo then authority = userinfo .. "@" .. authority end
	end
	if authority then url = "//" .. authority .. url end
	if parsed.scheme then url = parsed.scheme .. ":" .. url end
	if parsed.fragment then url = url .. "#" .. parsed.fragment end
	-- url = string.gsub(url, "%s", "")
	return url
end

-----------------------------------------------------------------------------
-- Builds a absolute URL from a base and a relative URL according to RFC 2396
-- Input
--   base_url
--   relative_url
-- Returns
--   corresponding absolute url
-----------------------------------------------------------------------------
function absolute(base_url, relative_url)
	if type(base_url) == "table" then
		base_parsed = base_url
		base_url = build(base_parsed)
	else
		base_parsed = parse(base_url)
	end
	local relative_parsed = parse(relative_url)
	if not base_parsed then return relative_url
	elseif not relative_parsed then return base_url
	elseif relative_parsed.scheme then return relative_url
	else
		relative_parsed.scheme = base_parsed.scheme
		if not relative_parsed.authority or relative_parsed.authority == "" then
			relative_parsed.authority = base_parsed.authority
			if not relative_parsed.path then
				relative_parsed.path = base_parsed.path
				if not relative_parsed.params then
					relative_parsed.params = base_parsed.params
					if not relative_parsed.query then
						relative_parsed.query = base_parsed.query
					end
				end
			else    
				relative_parsed.path = absolute_path(base_parsed.path or "",
					relative_parsed.path)
			end
		end
		return build(relative_parsed)
	end
end

-----------------------------------------------------------------------------
-- Breaks a path into its segments, unescaping the segments
-- Input
--   path
-- Returns
--   segment: a table with one entry per segment
-----------------------------------------------------------------------------
function parse_path(path)
	local parsed = {}
	path = path or ""
	--path = string.gsub(path, "%s", "")
	string.gsub(path, "([^/]*)", function (s) table.insert(parsed, s) end)
	for i = 1, table.getn(parsed) do
		parsed[i] = unescape(parsed[i])
	end
	if string.sub(path, 1, 1) == "/" then parsed.is_absolute = 1 end
	if string.sub(path, -1, -1) == "/" then parsed.is_directory = 1 end
	return parsed
end

-----------------------------------------------------------------------------
-- Builds a path component from its segments, escaping protected characters.
-- Input
--   parsed: path segments
--   unsafe: if true, segments are not protected before path is built
-- Returns
--   path: corresponding path stringing
-----------------------------------------------------------------------------
function build_path(parsed, unsafe)
	local path = ""
  local escape = unsafe and function(x) return x end or protect_segment
	local n = table.getn(parsed)
  for i = 1, n-1 do
	if parsed[i]~= "" or parsed[i+1] == "" then
	  path = path .. escape(parsed[i])
	  if i < n - 1 or parsed[i+1] ~= "" then path = path .. "/" end
	end
  end
  if n > 0 then
	path = path .. escape(parsed[n])
	if parsed.is_directory then path = path .. "/" end
  end
	if parsed.is_absolute then path = "/" .. path end
	return path
end
--PATH addons/media_player/lua/autorun/includes/modules/inputhook.lua:
local IsValid = IsValid
local pairs = pairs
local RealTime = RealTime
local type = type
local IsKeyDown = input.IsKeyDown
local IsMouseDown = input.IsMouseDown
local IsGameUIVisible = gui.IsGameUIVisible
local IsConsoleVisible = gui.IsConsoleVisible

_G.inputhook = {}

local HoldTime = 0.3

local LastPress = nil
local LastKey = nil
local KeyControls = {}

local function getEventArgs( a, b, c )
	if c == nil then
		return a, b
	else
		return b, c
	end
end

local function InputThink()

	if IsGameUIVisible() or IsConsoleVisible() then return end

	local dispatch, down, held, downFunc

	for key, handles in pairs( KeyControls ) do
		for name, tbl in pairs( handles ) do

			dispatch = false
			downFunc = tbl.Mouse and IsMouseDown or IsKeyDown

			if tbl.Enabled then

				-- Key hold (repeat press)
				if tbl.LastPress and tbl.LastPress + HoldTime < RealTime() then
					dispatch = true
					down = true
					held = true

					tbl.LastPress = RealTime()
				end

				-- Key release
				if not downFunc( key ) then
					dispatch = true
					down = false

					tbl.Enabled = false
				end

			else

				-- Key press
				if downFunc( key ) then
					dispatch = true
					down = true

					tbl.Enabled = true
					tbl.LastPress = RealTime()
				end

			end

			if dispatch then
				-- Use same behavior as the hook system
				if type(name) == 'table' then
					if IsValid(name) then
						tbl.Toggle( name, down, held, key )
					else
						handles[ name ] = nil
					end
				else
					tbl.Toggle( down, held, key )
				end
			end

		end
	end

end
hook.Add( "Think", "InputManagerThink", InputThink )

---
-- Adds a callback to be dispatched when a key is pressed.
--
-- @param key		`KEY_` enum.
-- @param name		Unique identifier or a valid object.
-- @param onToggle	Callback function.
--
function inputhook.Add( key, name, onToggle, isMouse )

	if not (key and onToggle) then return end

	if not KeyControls[ key ] then
		KeyControls[ key ] = {}
	end

	KeyControls[ key ][ name ] = {
		Enabled = false,
		LastPress = 0,
		Toggle = onToggle,
		Mouse = isMouse
	}

end

function inputhook.AddKeyPress( key, name, onToggle )

	inputhook.Add( key, name, function( a, b, c )
		local down, held = getEventArgs(a, b, c)

		-- ignore if key down, but held OR key is not down
		if down then
			if held then return end
		else
			return
		end

		onToggle( a, b, c )
	end )

end

function inputhook.AddKeyRelease( key, name, onToggle )

	inputhook.Add( key, name, function( a, b, c )
		local down, held = getEventArgs(a, b, c)

		-- ignore if key is down
		if down then return end

		onToggle( a, b, c )
	end )

end

---
-- Removes a registered key callback.
--
-- @param key	`KEY_` enum.
-- @param name	Unique identifier or a valid object.
--
function inputhook.Remove( key, name )

	if not KeyControls[ key ] then return end

	KeyControls[ key ][ name ] = nil

end

--PATH addons/media_player/lua/mediaplayer/controls/dmediaplayerrequest.lua:
local PANEL = {}
PANEL.HistoryWidth = 300
PANEL.BackgroundColor = Color(22, 22, 22)

local CloseTexture = Material( "theater/close.png" )

AccessorFunc( PANEL, "m_MediaPlayer", "MediaPlayer" )

function PANEL:Init()

	self:SetPaintBackgroundEnabled( true )
	self:SetFocusTopLevel( true )

	local w = math.Clamp( ScrW() - 100, 800, 1152 + self.HistoryWidth )
	local h = ScrH()
	if h > 800 then
		h = h * 3/4
	elseif h > 600 then
		h = h * 7/8
	end
	self:SetSize( w, h )

	self.CloseButton = vgui.Create( "DIconButton", self )
	self.CloseButton:SetSize( 32, 32 )
	self.CloseButton:SetIcon( "mp-close" )
	self.CloseButton:SetColor( Color( 250, 250, 250, 200 ) )
	self.CloseButton:SetZPos( 5 )
	self.CloseButton:SetText( "" )
	self.CloseButton.DoClick = function ( button )
		self:Close()
	end

	self.BrowserContainer = vgui.Create( "DPanel", self )
	self.BrowserContainer:Dock( FILL )

	self.Browser = vgui.Create( "DMediaPlayerHTML", self.BrowserContainer )
	self.Browser:Dock( FILL )

	self.Browser:AddFunction( "gmod", "requestUrl", function (url)
		MediaPlayer.MenuRequest( url )
		self:Close()
	end )

	self.Browser:AddFunction( "gmod", "openUrl", function (url)
		gui.OpenURL( url )
	end )

	self.Browser:AddFunction( "gmod", "getServices", function ()
		local mp = self.m_MediaPlayer

		if mp then
			self:SendServices( mp )
		end
	end )

	local requestUrl = MediaPlayer.GetConfigValue( 'request.url' )
	self.Browser:OpenURL( requestUrl )

	self.Controls = vgui.Create( "MPHTMLControls", self.BrowserContainer )
	self.Controls:Dock( TOP )
	self.Controls:DockPadding( 0, 0, 32, 0 )
	self.Controls:SetHTML( self.Browser )
	self.Controls.BorderSize = 0

	-- Listen for all mouse press events
	hook.Add( "GUIMousePressed", self, self.OnGUIMousePressed )

end

local function GetServiceIDs( mp )
	-- Send list of supported services to the request page for filtering out
	-- service icons
	local serviceIDs = mp:GetSupportedServiceIDs()
	serviceIDs = table.concat( serviceIDs, "," )

	return serviceIDs
end

function PANEL:SendServices( mp )
	local js = "if (typeof window.setServices === 'function') { setServices('%s'); }"
	js = js:format( GetServiceIDs(mp) )

	self.Browser:RunJavascript( js )
	self.Browser:QueueJavascript( js )
end

function PANEL:SetMediaPlayer( mp )
	self.m_MediaPlayer = mp

	self:SendServices( mp )
end

function PANEL:Paint( w, h )

	-- Draw background for fully transparent webpages
	surface.SetDrawColor( self.BackgroundColor )
	surface.DrawRect( 0, 0, w, h )

	return true

end

function PANEL:OnRemove()
	hook.Remove( "GUIMousePressed", self )
end

function PANEL:Close()
	if ValidPanel(self.Browser) then
		self.Browser:Remove()
	end

	self:OnClose()
	self:Remove()
end

function PANEL:OnClose()

end

function PANEL:CheckClose()

	local x, y = self:CursorPos()

	-- Remove panel if mouse is clicked outside of itself
	if not (gui.IsGameUIVisible() or gui.IsConsoleVisible()) and
		( x < 0 or x > self:GetWide() or y < 0 or y > self:GetTall() ) then
		self:Close()
	end

end

function PANEL:PerformLayout( w, h )

	self.CloseButton:SetPos( w - 36, 2 )

end

---
-- Close the panel when the mouse has been pressed outside of the panel.
--
function PANEL:OnGUIMousePressed( key )

	if key == MOUSE_LEFT then
		self:CheckClose()
	end

end

vgui.Register( "MPRequestFrame", PANEL, "EditablePanel" )

--PATH addons/media_player/lua/mediaplayer/services/shoutcast.lua:
SERVICE.Name	= "SHOUTcast"
SERVICE.Id		= "shc"
SERVICE.Base	= "af"

-- DEFINE_BASECLASS( "mp_service_af" )

local StationUrlPattern = "yp.shoutcast.com/sbin/tunein%-station%.pls%?id=%d+"

function SERVICE:Match( url )
	return url:match( StationUrlPattern )
end

function SERVICE:IsTimed()
	return false
end

--PATH addons/media_player/lua/mediaplayer/cl_requests.lua:
local function GetMediaPlayerId( obj )
	local mpId

	-- Determine mp parameter type and get the associated ID.
	if isentity(obj) and obj.IsMediaPlayerEntity then
		mpId = obj:GetMediaPlayerID()
	-- elseif isentity(obj) and IsValid( obj:GetMediaPlayer() ) then
	-- 	local mp = mp:GetMediaPlayer()
	-- 	mpId = mp:GetId()
	elseif istable(obj) and obj.IsMediaPlayer then
		mpId = obj:GetId()
	elseif isstring(obj) then
		mpId = obj
	else
		return false -- Invalid parameters
	end

	return mpId
end

---
-- Request to begin listening to a media player.
--
-- @param Entity|Table|String	Media player reference.
--
function MediaPlayer.RequestListen( obj )

	local mpId = GetMediaPlayerId(obj)
	if not mpId then return end

	net.Start( "MEDIAPLAYER.RequestListen" )
		net.WriteString( mpId )
	net.SendToServer()

end

---
-- Request mediaplayer update.
--
-- @param Entity|Table|String	Media player reference.
--
function MediaPlayer.RequestUpdate( obj )

	local mpId = GetMediaPlayerId(obj)
	if not mpId then return end

	net.Start( "MEDIAPLAYER.RequestUpdate" )
		net.WriteString( mpId )
	net.SendToServer()

end

---
-- Request a URL to be played on the given media player.
--
-- @param Entity|Table|String	Media player reference.
-- @param String				Requested media URL.
--
function MediaPlayer.Request( obj, url )

	local mpId = GetMediaPlayerId( obj )
	if not mpId then return end

	if MediaPlayer.DEBUG then
		print("MEDIAPLAYER.Request:", url, mpId)
	end

	local mp = MediaPlayer.GetById( mpId )

	local allowWebpage = MediaPlayer.Cvars.AllowWebpages:GetBool()

	-- Verify valid URL as to not waste time networking
	if not MediaPlayer.ValidUrl( url ) and not allowWebpage then
		LocalPlayer():ChatPrint("The requested URL was invalid.")
		return false
	end

	local media = MediaPlayer.GetMediaForUrl( url, allowWebpage )

	local function request( err )
		if err then
			-- TODO: don't use chatprint to notify the user
			LocalPlayer():ChatPrint( "Request failed: " .. err )
			return
		end

		if not IsValid( mp ) then
			-- media player may have been removed before we could finish the
			-- async prerequest action
			return
		end

		net.Start( "MEDIAPLAYER.RequestMedia" )
			net.WriteString( mpId )
			net.WriteString( url )
			media:NetWriteRequest() -- send any additional data
		net.SendToServer()

		if MediaPlayer.DEBUG then
			print("MEDIAPLAYER.Request sent to server")
		end
	end

	-- Prepare any data prior to requesting if necessary
	if media.PrefetchMetadata then
		media:PreRequest(request) -- async
	else
		request() -- sync
	end

end

function MediaPlayer.Pause( mp )

	local mpId = GetMediaPlayerId( mp )
	if not mpId then return end

	net.Start( "MEDIAPLAYER.RequestPause" )
		net.WriteString( mpId )
	net.SendToServer()

end

function MediaPlayer.Skip( mp )

	local mpId = GetMediaPlayerId( mp )
	if not mpId then return end

	net.Start( "MEDIAPLAYER.RequestSkip" )
		net.WriteString( mpId )
	net.SendToServer()

end

---
-- Seek to a specific time in the current media.
--
-- @param Entity|Table|String	Media player reference.
-- @param String				Seek time; HH:MM:SS
--
function MediaPlayer.Seek( mp, time )

	local mpId = GetMediaPlayerId( mp )
	if not mpId then return end

	-- always convert to time in seconds before sending
	if type(time) == 'string' then
		time = MediaPlayerUtils.ParseHHMMSS(time) or 0
	end

	net.Start( "MEDIAPLAYER.RequestSeek" )
		net.WriteString( mpId )
		net.WriteInt( time, 32 )
	net.SendToServer()

end

---
-- Remove the given media.
--
-- @param Entity|Table|String	Media player reference.
-- @param String				Media unique ID.
--
function MediaPlayer.RequestRemove( mp, mediaUID )

	local mpId = GetMediaPlayerId( mp )
	if not mpId then return end

	net.Start( "MEDIAPLAYER.RequestRemove" )
		net.WriteString( mpId )
		net.WriteString( mediaUID )
	net.SendToServer()

end

function MediaPlayer.RequestRepeat( mp )

	local mpId = GetMediaPlayerId( mp )
	if not mpId then return end

	net.Start( "MEDIAPLAYER.RequestRepeat" )
		net.WriteString( mpId )
	net.SendToServer()

end

function MediaPlayer.RequestShuffle( mp )

	local mpId = GetMediaPlayerId( mp )
	if not mpId then return end

	net.Start( "MEDIAPLAYER.RequestShuffle" )
		net.WriteString( mpId )
	net.SendToServer()

end

function MediaPlayer.RequestLock( mp )

	local mpId = GetMediaPlayerId( mp )
	if not mpId then return end

	net.Start( "MEDIAPLAYER.RequestLock" )
		net.WriteString( mpId )
	net.SendToServer()

end

--PATH addons/media_player/lua/mediaplayer/cl_idlescreen.lua:
local DefaultIdlescreen = [[
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>MediaPlayer Idlescreen</title>
	<style type="text/css">
	html, body {
		margin: 0;
		padding: 0;
		width: 100%%;
		height: 100%%;
	}
	html {
		background: #fff;
	}
	body {
		overflow: hidden;
		display: -webkit-box;
		display: -moz-box;
		display: box;
		-webkit-box-orient: horizontal;
		-moz-box-orient: horizontal;
		-box-orient: horizontal;
		-webkit-box-pack: center;
		-webkit-box-align: center;
		background: -webkit-radial-gradient(center, ellipse cover,
			transparent 0%%, rgba(0, 0, 0, 0.7) 100%%);
	}
	h1 {
		margin: 0;
		padding: 0;
	}
	.background {
		position: absolute;
		display: block;
		width: 100%%;
		z-index: -1;
		-webkit-filter: blur(8px);
		-webkit-transform: scale(1.2);
		opacity: 0.66;
	}
	.content {
		color: rgba(255, 255, 255, 0.66);
		font-family: sans-serif;
		font-size: 1.5em;
		text-align: center;
		-webkit-box-flex: 1;
		-moz-box-flex: 1;
		box-flex: 1;
	}

	.metastream {
		display: block;
		max-width: 80%%;
		font-size: 18pt;
		font-weight: bold;
		margin: 20px auto 0 auto;
		padding: 16px 24px;
		text-align: center;
		text-decoration: none;
		color: white;
		line-height: 28pt;
		letter-spacing: 0.5px;
		text-shadow: 1px 1px 1px rgba(0,0,0,0.2);
		border-radius: 4px;
		background: -webkit-linear-gradient(
			-20deg,
			#20202f 0%%,
			#273550 40%%,
			#416081 100%%
		);
	}
	.metastream-link {
		color: #f98673;
		text-decoration: underline;
	}
	</style>
</head>
<body>
	<img src="asset://mapimage/gm_construct" class="background">
	<div class="content">
		<h1>No media playing</h1>
		<p>Hold %s while looking at the media player to reveal the queue menu.</p>

		<div class="metastream">
			Hey Media Player fans! The creator of this mod is making something new.
			Check out <span class="metastream-link">getmetastream.com</span>!
		</div>
	</div>
</body>
</html>
]]

local function GetIdlescreenHTML()
	local contextMenuBind = input.LookupBinding( "+menu_context" ) or "C"
	contextMenuBind = contextMenuBind:upper()
	return DefaultIdlescreen:format( contextMenuBind )
end

function MediaPlayer.GetIdlescreen()

	if not MediaPlayer._idlescreen then
		local browser = vgui.Create( "DMediaPlayerHTML" )
		browser:SetPaintedManually(true)
		browser:SetKeyBoardInputEnabled(false)
		browser:SetMouseInputEnabled(false)
		browser:SetPos(0,0)

		local resolution = MediaPlayer.Resolution()
		browser:SetSize( resolution * 16/9, resolution )

		-- TODO: set proper browser size

		MediaPlayer._idlescreen = browser

		local setup = hook.Run( "MediaPlayerSetupIdlescreen", browser )
		if not setup then
			MediaPlayer._idlescreen:SetHTML( GetIdlescreenHTML() )
		end
	end

	return MediaPlayer._idlescreen

end

--PATH addons/media_player/lua/autorun/mediaplayer_spawnables.lua:
local MediaPlayerClass = "mediaplayer_tv"

local function AddMediaPlayerModel( spawnName, name, model, playerConfig )
	list.Set( "SpawnableEntities", spawnName, {
		PrintName = name,
		ClassName = MediaPlayerClass,
		Category = "Media Player",
		DropToFloor = true,
		KeyValues = {
			model = model
		}
	} )

	list.Set( "MediaPlayerModelConfigs", model, playerConfig )
end

AddMediaPlayerModel(
	"../spawnicons/models/hunter/plates/plate5x8",
	"Huge Billboard",
	"models/hunter/plates/plate5x8.mdl",
	{
		angle = Angle(0, 90, 0),
		offset = Vector(-118.8, 189.8, 2.5),
		width = 380,
		height = 238
	}
)

AddMediaPlayerModel(
	"../spawnicons/models/props_phx/rt_screen",
	"Small TV",
	"models/props_phx/rt_screen.mdl",
	{
		angle = Angle(-90, 90, 0),
		offset = Vector(6.5, 27.9, 35.3),
		width = 56,
		height = 33
	}
)

if SERVER then

	-- fix for media player owner not getting set on alternate model spawn
	hook.Add( "PlayerSpawnedSENT", "MediaPlayer.SetOwner", function(ply, ent)
		if not ent.IsMediaPlayerEntity then return end
		ent:SetCreator(ply)
		local mp = ent:GetMediaPlayer()
		mp:SetOwner(ply)
	end )

end

--PATH addons/__main/lua/autorun/mp_weapon_smart_pistol_sounds.lua:
sound.Add( {
    name = "Weapon_SmartPistol.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    soundlevel = SNDLVL_GUNFIRE,
    sound = "weapons/smartpistol/wpn_smartpistol_1p_wpnfire_core_6ch_v1_01.wav"
} )

sound.Add( {
    name = "Weapon_SmartPistol.Lock",
    channel = CHAN_ITEM,
    volume = 1.0,
    soundlevel = SNDLVL_NORM,
    sound = "weapons/smartpistol/wpn_smartpistol_1p_wpnfire_servomech_1ch_v1_02.wav"
} )

sound.Add( {
    name = "Weapon_SmartPistol.TargetLock",
    channel = CHAN_ITEM,
    volume = 1.0,
    soundlevel = SNDLVL_NORM,
    sound = "weapons/smartpistol/smartpistol_targetlock_test_04.wav"
} )
--PATH addons/ukrp_main_content/lua/autorun/naruto_sixpath.lua:
list.Set( "PlayerOptionsModel", "Naruto Six Path Sage Mode", "models/player/naruto_sixpath/naruto_sixpath.mdl" );
player_manager.AddValidModel( "Naruto Six Path Sage Mode", "models/player/naruto_sixpath/naruto_sixpath.mdl" );
list.Set( "PlayerOptionsModel", "Gudoudama Ball", "models/sphere_naruto/sphere_naruto.mdl" );
list.Set( "PlayerOptionsModel", "Gudoudama Kernel", "models/naruto_stick/naruto_stick.mdl" );

--PATH addons/____onyx_framework_2/lua/onyx/ui/libs/cl_spoly.lua:
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

onyx.spoly = onyx.spoly or {}
onyx.spoly.materials = onyx.spoly.materials or {}
onyx.spoly.queue = onyx.spoly.queue or {}
onyx.spoly.status = STATUS_IDLE

local spoly = onyx.spoly
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
    local tmpPath = 'spoly/' .. util.SHA256(SysTime() .. path) .. '.png'
    local start = SysTime()

    spoly.status = STATUS_BUSY

    render.PushRenderTarget(RT)

        render.SetWriteDepthToDestAlpha(false)
        render.Clear(0, 0, 0, 0)

        cam.Start2D()
            surface.SetDrawColor(color_white)
            draw.NoTexture()
            local success, errorText = pcall(funcDraw, SIZE, SIZE)
        cam.End2D()

        local capture_data = CAPTURE_DATA
        if success and errorText then
            capture_data = errorText
        end

        local content = render.Capture(capture_data)

        file.Delete(tmpPath)
        file.Write(tmpPath, content)

    render.PopRenderTarget()

    -- gmod refuses to load the material from the file if it was an error before (till you disconnect/map changes)
    -- so we use a temporary file to check if it's valid, this is only useful when your developing
    materials[id] = Material('data/' .. tmpPath, 'mips')
    if (materials[id]:IsError()) then
        materials[id] = nil
        file.Delete(tmpPath)
    else
        file.Rename(tmpPath, path)
    end

    spoly.status = STATUS_IDLE

    local endtime = SysTime()
    local delta = tostring(math.Round(endtime - start, 3))

    if (not success) then
        spoly.PrintError('Failed to render \'%s\', error text: %s', id, errorText)
    else
        spoly.Print('Rendered \'%s\' in %ss', id, delta)
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
        if (not materials[id]:IsError()) then
            return
        end
    end

    queued[id] = true

    table.insert(queue, {
        id = id,
        funcDraw = funcDraw
    })
end

do
    local thinkRate = 1 / 5
    local nextThink = 0
    hook.Add('Think', 'spoly.QueueController', function()
        if (spoly.status == STATUS_IDLE and queue[1] and nextThink <= CurTime()) then
            nextThink = CurTime() + thinkRate

            -- if game ui is visible, hide it, as render.Capture won't work if it's visible
            if (gui.IsGameUIVisible()) then
                gui.HideGameUI()
                return
            end

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
--PATH addons/____onyx_framework_2/lua/onyx/ui/libs/cl_wimg.lua:
--[[

Copyright (c) 2022 Aleksandrs Filipovskis

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

--]]

onyx.wimg = onyx.wimg or {}
onyx.wimg.cache = onyx.wimg.cache or {}
-- onyx.wimg.proxy = 'https://proxy.duckduckgo.com/iu/?u=' -- it seems imgur has banned duckduckgo's proxy at 29/04/2023, you can try to enable it
onyx.wimg.proxy = ''

local wimg = onyx.wimg

local function printWarning(text)
    MsgC(color_white, '(', Color(153, 0, 255), 'wimg', color_white, ') ', text, '\n')
end

-- ANCHOR Queue

local addInQueue
do
    local http_Fetch = http.Fetch
    local table_remove = table.remove
    local file_Exists = file.Exists
    local file_Write = file.Write
    local insert = table.insert

    local basePath = 'wimg'
    local queue = {}
    local rate = 1 / 5

    if not file_Exists(basePath, 'DATA') then
        file.CreateDir(basePath)
    end

    local function findMaterial(name, format, parameters)
        local path = basePath .. '/' .. name .. format

        if file_Exists(path, 'DATA') then
            return Material('data/' .. path, parameters)
        end
    end

    local function saveMaterial(name, format, body)
        local path = basePath .. '/' .. name .. format

        file_Write(path, body)
    end

    function addInQueue(wimgObject)
        local name = wimgObject:GetName()
        local url = wimgObject:GetURL()
        local format = wimgObject:GetFormat()
        local parameters = wimgObject:GetParameters()
        local mat = findMaterial(name, format, parameters)

        if mat then
            wimgObject:SetMaterial(mat)
        else
            insert(queue, {
                name = name,
                url = url,
                format = format,
                parameters = parameters,
                wimgObject = wimgObject
            })
        end
    end

    timer.Create('onyx.wimg.ProcessQueue', rate, 0, function()
        local data = queue[1]
        if (data) then
            table_remove(queue, 1)

            local name = data.name
            local url = data.url
            local format = data.format
            local parameters = data.parameters
            local wimgObject = data.wimgObject

            local success, errorString = pcall(function()
                local mat = findMaterial(name, format, parameters)
                if mat then
                    wimgObject:SetMaterial(mat)
                else
                    http_Fetch(wimg.proxy .. url, function(body, size, headers, code)
                        if (code > 200) then
                            printWarning('Failed to fetch material (code: ' .. tostring(code) .. '), url: ' .. url)
                            return
                        end

                        saveMaterial(name, format, body)

                        local mat = findMaterial(name, format, parameters)
                        if (mat) then
                            if (wimgObject) then
                                wimgObject:SetMaterial(mat)
                            end
                        else
                            printWarning('Failed to fetch material after download! (url: ' .. url .. ')')
                        end
                    end, function(err)
                        printWarning(Format('Failed to download the image with name: \"%s\", url: %s, error: %s', name, url, err))
                    end)
                end
            end)

            if (not success) then
                printWarning('Error occured during image catchup: ' .. errorString)
            end
        end
    end)
end

-- ANCHOR Class

local WIMAGE = {}
WIMAGE.__index = WIMAGE

function WIMAGE.__eq(a, b)
    return a:GetName() == b:GetName()
end

AccessorFunc(WIMAGE, 'm_Name', 'Name')
AccessorFunc(WIMAGE, 'm_URL', 'URL')
AccessorFunc(WIMAGE, 'm_Format', 'Format')
AccessorFunc(WIMAGE, 'm_Material', 'Material')
AccessorFunc(WIMAGE, 'm_Parameters', 'Parameters')

do
    local SetDrawColor = surface.SetDrawColor
    local DrawTexturedRect = surface.DrawTexturedRect
    local SetMaterial = surface.SetMaterial
    local DrawTexturedRectRotated = surface.DrawTexturedRectRotated

    function WIMAGE:Draw(x, y, w, h, color)
        color = color or color_white

        local mat = self.m_Material

        if mat then
            SetDrawColor(color)
            SetMaterial(mat)
            DrawTexturedRect(x, y, w, h)
        end
    end

    function WIMAGE:DrawRotated(x, y, w, h, r, color)
        color = color or color_white

        local mat = self.m_Material

        if mat then
            SetDrawColor(color)
            SetMaterial(mat)
            DrawTexturedRectRotated(x, y, w, h, r)
        end
    end
end

function WIMAGE:Download()
    addInQueue(self)
end

function WIMAGE:GetWidth()
    return self.m_Material and self.m_Material:Width() or 0
end

function WIMAGE:GetTall()
    return self.m_Material and self.m_Material:Height() or 0
end

WIMAGE.__call = WIMAGE.Draw

-- ANCHOR Library

function wimg.Register(name, url)
    assert(name, 'No name provided')
    assert(url, 'No URL provided')
    wimg.cache[name] = url
end

function wimg.Create(name, parameters)
    assert(name, 'No name provided')

    local url = wimg.cache[name]
    local invalid = false

    if (not url) then
        ErrorNoHalt('There\'s no web image registered with name: ' .. name)
        invalid = true
    end

    local format = invalid and '_INVALID_' or string.match(url, '.%w+$')
    assert(format, 'wrong format for this url: ' .. url .. ' (' .. name ..  ')')

    local obj = setmetatable({
        m_Name = name,
        m_URL = url,
        m_Format = format,
        m_Parameters = parameters
    }, WIMAGE)

    if (not invalid) then
        obj:Download()
    end

    return obj
end

do
    local urlCache = {}

    local function encodeURL(url)
        return util.CRC(url)
    end

    function wimg.Simple(url, parameters)
        assert(url, 'No URL provided')
        assert(isstring(url), 'URL should be string!')

        if not urlCache[url] then
            urlCache[url] = encodeURL(url)
        end

        local uid = urlCache[url]

        wimg.Register(uid, url)

        return wimg.Create(uid, parameters)
    end
end

-- ANCHOR Test Section
--[[
    do
        wimg.Register('user', 'https://i.imgur.com/Q3OHblv.png')

        local userSmooth = wimg.Create('user', 'smooth mips')
        local userSharp = wimg.Create('user')
        local userQuick = wimg.Simple('https://i.imgur.com/Q3OHblv.png')

        print(userSharp == userSmooth)

        hook.Add('HUDPaint', 'wimg.Test', function()
            local size = math.abs(math.sin(CurTime() * .5)) * 256

            userSmooth:Draw(0, 0, size, size)
            userSharp:Draw(size, 0, size, size)
            userQuick:Draw(size * 2, 0, size, size)
            userQuick(size * 3, 0, size, size)
        end)
    end
]]

--PATH addons/____onyx_framework_2/lua/onyx/ui/elements/cl_navbar.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

31/12/2023

--]]

local colorSecondary = onyx:Config('colors.secondary')
local colorAccent = onyx:Config('colors.accent')
local colorGray = Color(197, 197, 197)
local colorGradient = onyx.LerpColor(.5, colorAccent, colorSecondary)

do
    local PANEL = {}

    AccessorFunc(PANEL, 'm_Name', 'Name')
    AccessorFunc(PANEL, 'm_Font', 'Font')
    AccessorFunc(PANEL, 'm_iRoundness', 'Roundness')
    AccessorFunc(PANEL, 'm_iIconSize', 'IconSize')
    AccessorFunc(PANEL, 'm_iIconMargin', 'IconMargin')
    AccessorFunc(PANEL, 'm_bMasking', 'Masking')
    AccessorFunc(PANEL, 'm_matMaterial', 'Material')
    AccessorFunc(PANEL, 'm_wimgObject', 'WebImage')

    function PANEL:Init()
        self:SetWide(onyx.ScaleWide(120))
        self:SetName('Tab')
        self:SetFont(onyx.Font('Comfortaa Bold@16'))
        self:SetRoundness(8)
        self:SetIconSize(onyx.ScaleTall(14))
        self:SetIconMargin(onyx.ScaleTall(5))
        self:Import('click')
        self.animActiveFraction = 0
    end

    function PANEL:Paint(w, h)
        local x0, y0 = w * .5, h * .5
        local textColor = self:IsHovered() and color_white or colorGray
        local animActiveFraction = self.animActiveFraction
        local screenX, screenY = self:LocalToScreen(0, 0)

        -- unactive text
        if (animActiveFraction < 1) then
            self:DrawContent(x0, y0, ColorAlpha(textColor, (1 - animActiveFraction) * 255))
        end

        -- active text
        if (animActiveFraction > 0) then
            local animHeight = h * animActiveFraction
            local animHeightHalf = animHeight * .5

            render.SetScissorRect(screenX, screenY + h * .5 - animHeightHalf, screenX + w, screenY + h * .5 + animHeightHalf, true)
                self:DrawContent(x0, y0, colorAccent)
            render.SetScissorRect(0, 0, 0, 0, false)
        end
    end

    function PANEL:DrawContent(x0, y0, color)
        local name = self.m_Name
        local font = self.m_Font
        local material = self.m_matMaterial
        local webimage = self.m_wimgObject
        local iconSize = self.m_iIconSize
        local iconMargin = self.m_iIconMargin

        if (material or webimage) then
            local textW = onyx.GetTextSize(name, font)
            local totalW = textW + iconSize + iconMargin
            local x = x0 - totalW * .5

            if (material) then
                onyx.DrawMaterial(material, x, y0 - iconSize * .5, iconSize, iconSize, color)
            else
                webimage:Draw(x, y0 - iconSize * .5, iconSize, iconSize, color)
            end

            draw.SimpleText(name, font, x + iconSize + iconMargin, y0, color, 0, 1)
        else
            draw.SimpleText(name, font, x0, y0, color, 1, 1)
        end
    end

    function PANEL:SetupTab(data)
        self:SetName(data.name)
        self:SetMaterial(data.material)

        if (data.icon) then
            self:SetWebImage(onyx.wimg.Simple(data.icon, 'smooth mips'))
        elseif (data.wimg) then
            self:SetWebImage(data.wimg)
        end
    end

    function PANEL:SizeToContents(space)
        local space = space or 0
        local textW = onyx.GetTextSize(self.m_Name, self.m_Font)
        local totalW = textW + space

        if (self:HasIcon()) then
            totalW = totalW + self:GetIconSize() + self:GetIconMargin()
        end

        self:SetWide(totalW)
    end

    function PANEL:HasIcon()
        return (self.m_matMaterial ~= nil)
    end

    function PANEL:SetActive(bActiveBool)
        self.active = bActiveBool

        onyx.anim.Create(self, .33, {
            index = 1,
            target = {
                animActiveFraction = (bActiveBool and 1 or 0)
            }
        })
    end

    function PANEL:PerformLayout(w, h)
        if (self.m_bMasking) then
            self.mask = onyx.CalculateRoundedBoxEx(self.m_iRoundness, 0, 0, w, h, false, false, true)
        end
    end

    onyx.gui.Register('onyx.Navbar.Tab', PANEL)
end

do
    local PANEL = {}

    AccessorFunc(PANEL, 'm_pnlContainer', 'Container')
    AccessorFunc(PANEL, 'm_pnlActiveTab', 'ActiveTab')
    AccessorFunc(PANEL, 'm_iRoundness', 'Roundness')
    AccessorFunc(PANEL, 'm_bKeepTabContent', 'KeepTabContent')
    AccessorFunc(PANEL, 'm_iSpace', 'Space')

    function PANEL:Init()
        self.tabs = {}
        self:SetRoundness(0)
        self:SetSpace(0)
        self.animLineCurrent = 0
        self.animLineTarget = 0

        self.animLineX = 0
        self.animLineW = 0
    end

    function PANEL:AddTab(data)
        local tab = self:Add('onyx.Navbar.Tab')
        tab:Dock(LEFT)
        tab:DockMargin(0, 0, self.m_iSpace, 0)
        tab:SetupTab(data)
        tab.DoClick = function(panel)
            self:SelectTab(panel)
        end

        tab.tabData = data
        tab.tabIndex = table.insert(self.tabs, tab)
        tab.cornerTab = tab.tabIndex == 1
        tab:SetMasking(tab.cornerTab)
        tab:SetRoundness(self:GetRoundness())

        self:Call('OnTabAdded', nil, tab)

        return tab
    end

    function PANEL:GetTabs()
        return self.tabs
    end

    function PANEL:ChooseTab(index, force)
        local tab = self.tabs[index]
        assert(IsValid(tab), 'tried to choose invalid tab')
        self:SelectTab(tab, force)
    end

    function PANEL:SelectTab(tab, force)
        local shouldKeepTabContent = self.m_bKeepTabContent
        local container = self:GetContainer()
        assert(IsValid(container), string.format('Invalid container (%s) linked to the NavBar', tostring(container)))

        local data = tab.tabData

        if (data.onClick and not data.onClick()) then
            return
        end

        local currentActiveTab = self:GetActiveTab()
        if (IsValid(currentActiveTab)) then
            if (currentActiveTab == tab and not force) then
                return
            end

            currentActiveTab:SetActive(false)
        end

        self:SetActiveTab(tab)
        tab:SetActive(true)

        if (IsValid(currentActiveTab) and IsValid(currentActiveTab.content)) then
            if (shouldKeepTabContent) then
                currentActiveTab.content:Hide()
            else
                currentActiveTab.content:Remove()
            end
        end

        if (IsValid(tab.content)) then
            tab.content:Show()
        else
            tab.content = container:Add(data.class)
            tab.content:Dock(FILL)
            tab.content.tab = tab

            if (data.onBuild) then
                data.onBuild(tab.content)
            end
        end

        self:Call('OnTabSelected', nil, tab, tab.content)

        self.animLineTarget = tab.tabIndex

        if (not self.animLineStart) then
            self.animLineCurrent = self.animLineTarget
            self.animLineX = tab:GetPos()
            self.animLineW = tab:GetWide()
        else
            onyx.anim.Create(self, .33, {
                index = 1,
                easing = 'inOutSine',
                target = {
                    animLineCurrent = self.animLineTarget,
                    animLineX = tab:GetPos(),
                    animLineW = tab:GetWide()
                }
            })
        end

        self.animLineStart = self.animLineCurrent
    end

    function PANEL:PaintOver(w, h)
        local current = self.animLineCurrent
        if (current <= 0) then return end

        local target = self.animLineTarget
        if (target <= 0) then return end

        local gradientHeight = h * .25

        local x = self.animLineX
        local wide = self.animLineW
        if (wide == 0 and current == target) then
            local tab = self:GetChild(target - 1)

            x = tab:GetPos()
            wide = tab:GetWide()
        end

        surface.SetDrawColor(colorAccent)
        surface.DrawRect(x, h - 2, wide, 2)

        onyx.DrawMatGradient(x, h - gradientHeight, wide, gradientHeight, TOP, ColorAlpha(colorGradient, 25))
    end

    onyx.gui.Register('onyx.Navbar', PANEL)
end

-- ANCHOR Test

-- onyx.gui.Test('onyx.Frame', .65, .65, function(self, w, h)
--     self:MakePopup()

--     local content = self:Add('Panel')
--     content:DockPadding(10, 10, 10, 10)
--     content:Dock(FILL)

--     -- local sidebar = self:Add('onyx.Sidebar')
--     local navbar = content:Add('onyx.Navbar')
--     navbar:SetTall(48)
--     navbar:Dock(TOP)
--     navbar.Paint = function(panel, w, h)
--         draw.RoundedBox(8, 0, 0, w, h, colorSecondary)
--     end

--     local container = content:Add('Panel')
--     container:Dock(FILL)

--     navbar:SetContainer(container)
--     navbar:AddTab({
--         name = 'DASHBOARD',
--         desc = 'Main things',
--         class = 'DButton',
--         onSelected = function(panel)
--             panel:SetText('Meow')
--         end
--     })
--     navbar:AddTab({
--         name = 'JOBS',
--         desc = 'Choose your destiny',
--         material = Material('ut_darkrp/ui/box.png', 'mips smooth'),
--         class = 'DButton',
--     })
--     navbar:AddTab({
--         name = 'SHOP',
--         desc = 'Find items you need',
--         material = Material('ut_darkrp/ui/hat.png', 'mips smooth'),
--         class = 'DButton',
--     })
--     navbar:AddTab({
--         name = 'SETTINGS',
--         desc = 'Configure the game as you wish',
--         material = Material('ut_darkrp/ui/gear.png', 'mips smooth'),
--         class = 'DButton',
--     })
-- end)
--PATH addons/____onyx_framework_2/lua/onyx/ui/elements/cl_scrollpanel.lua:
--[[

Author: tochonement
Email: tochonement@gmail.com

22.08.2021

--]]

local PANEL = {}

function PANEL:Init()
    self.canvas = vgui.Create('onyx.ScrollPanel.Canvas', self)

    self.scroll = vgui.Create('onyx.Scroll', self)

    self.canvas:On('OnContainerTallUpdated', function(panel, canvasTall, containerTall)
        self.scroll:SetUp(canvasTall, containerTall)
    end)

    self:Combine(self.canvas, 'AddPanel')
    self:Combine(self.canvas, 'OnPanelAdded')
    self:Combine(self.scroll, 'OnMouseWheeled')
    self:CombineMutator(self.canvas, 'Space')
end

function PANEL:PerformLayout(w, h)
    self.canvas:Dock(FILL)

    self.scroll:Dock(RIGHT)
    self.scroll:SetWide(onyx.ScaleWide(6))
    self.scroll:DockMargin(ScreenScale(2), 0, 0, 0)
end

function PANEL:OnVScroll(offset)
    self:GetContainer():SetY(offset)
end

function PANEL:GetContainer()
    return self.canvas.container
end

function PANEL:GetItems()
    return self:GetContainer():GetChildren()
end

function PANEL:Add(class)
    local panel = vgui.Create(class)

    assert(panel, 'Panel class \"' .. class .. '\" doesn\'t exist')

    self:AddPanel(panel)

    return panel
end

-- hack
function PANEL:Think()
    local scroll = self.scroll:GetScroll()
    local canvasSize = self.scroll.CanvasSize
    if (scroll ~= canvasSize) then
        local target = math.min(scroll, canvasSize)
        self.scroll:SetScroll(target)
        if (canvasSize <= 1) then
            self.canvas.container:SetPos(0, -scroll)
            self.scroll.Current = 0
            self.scroll.Scroll = 0
        end
    end
end

onyx.gui.Register('onyx.ScrollPanel', PANEL)

-- ANCHOR Test

-- onyx.gui.Test('onyx.Frame', .66, .66, function(self)
--     self:MakePopup()

--     local list = self:Add('onyx.ScrollPanel')
--     list:Dock(FILL)

--     for i = 1, 32 do
--         local button = list:Add('onyx.Button')
--         button:SetText('Button #' .. i)
--     end
-- end)
--PATH addons/____onyx_creditstore/lua/onyx/modules/creditstore/languages/cl_ukrainian.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

18/05/2023

--]]

local LANG = {}

-- TABS
LANG.store_u = 'МАГАЗИН'
LANG.inventory_u = 'ІНВЕНТАР'
LANG.refunds_u = 'ПОВЕРНЕННЯ'
LANG.convert_u = 'ОБМІННИК'
LANG.admin_u = 'АДМІН'
LANG.donate_u = 'ПОПОВНИТИ'

-- ADMIN TABS
LANG.players_u = 'ГРАВЦІ'
LANG.items_u = 'ПРЕДМЕТИ'
LANG.settings_u = 'НАЛАШТУВАННЯ'
LANG.return_u = 'НАЗАД'

-- WORDS
LANG.active_u = 'АКТИВНО'
LANG.unactive_u = 'НЕАКТИВНО'
LANG.owned_u = 'ПРИДБАНО'
LANG.credits = 'Кредити'
LANG.money = 'Гроші'
LANG.both = 'Обидва'
LANG.convert = 'Конвертувати'
LANG.single = 'Одиниця'
LANG.half = 'Половина'
LANG.all = 'Усі'
LANG.icon = 'Значок'
LANG.model = 'Модель'

-- OPTIONS
LANG.use = 'Використати'
LANG.equip = 'Екіпірувати'
LANG.unequip = 'Зняти'
LANG.spawn = 'Заспавнити'
LANG.confirm = 'Підтвердити'
LANG.cancel = 'Скасування'
LANG.delete = 'Видалити'

-- PHRASES
LANG.purchaseItem = 'Придбати "{item}"'
LANG.notEnoughCredits = 'Недостатньо кредитів!'
LANG.youMustBeAlive = 'Ви повинні бути живими!'
LANG.requestRefund = 'Запросити повернення коштів'
LANG.refundableUntil = 'МОЖНА ПОВЕРНУТИ ДО'
LANG.currentRate = 'Поточний курс: 1 кредит = {rate}'
LANG.youGive = 'ВИ ДАЄТЕ'
LANG.youReceive = 'ВИ ОТРИМАЄТЕ'
LANG.giveItem = 'ВИДАТИ ПРЕДМЕТ'
LANG.nothingToRefund = 'НЕМАЄ ПРЕДМЕТІВ'
LANG.healthIsFull = 'Ваше здоров\'я повне!'
LANG.armorIsFull = 'Ваша броня повна!'
LANG.youRefunded = 'Ви повернули {item} та отримали {price} кредитів!'
LANG.youPurchased = 'Ви придбали {item}!'
LANG.youConverted = 'Ви конвертували {A} у {B}!'
LANG.cantAfford = 'Ви не можете дозволити собі це!'

LANG.createCategory = 'СТВОРТИ КАТЕГОРІЮ'
LANG.newItem = 'НОВЫЙ ПРЕДМЕТ'
LANG.edit_u = 'ИЗМЕНИТЬ'
LANG.delete_u = 'ВИДАЛИТИ'
LANG.create_u = 'СТВОРИТИ'

LANG.searchName = 'Шукати на ім\'я...'
LANG.searchNameSteamID = 'Шукати на ім\'я/SteamID...'

-- ERRORS
LANG.idMustBeUnique = 'Ідентифікатор має бути унікальним!'
LANG.fieldMustNumber = '{field} має бути числом!'
LANG.fieldMustPositive = '{field} має бути позитивним числом!'
LANG.fieldMustChoose = 'Ви повинні вибрати {field}!'
LANG.fieldEnter = 'Ви повинні ввести {field}!'
LANG.invalidModel = 'Модель невірна!'
LANG.iconMustURL = 'Іконка має бути URL!'
LANG.invalidIconFormat = 'Іконка підтримує тільки .jpg та .png формати!'
LANG.notEnoughSymbols = '{field} має містити мінімум {min} символів!'
LANG.tooManySymbols = '{field} не повинно перевищувати {max} символів!'

--[[------------------------------
FOR OTHER LANGUAGES
--------------------------------]]

LANG['Select an option'] = 'Виберіть опцію'

-- Types
LANG['Vehicle'] = 'Автомобіль'
LANG['Health'] = 'Здоров\'я'
LANG['Armor'] = 'Броня'
LANG['Tool'] = 'Інструмент'
LANG['Trail'] = 'Слід'
LANG['Permanent Booster'] = 'Перманентний буст'
LANG['Permanent Weapon'] = 'Перманентна зброя'
LANG['Permanent Rank'] = 'Перманентний ранг'
LANG['Permanent Suit'] = 'Перманентний костюм'
LANG['Permanent Model'] = 'Перманентна модель'
LANG['Suit'] = 'Костюм'
LANG['Accessory'] = 'Аксессуар'
LANG['Entity'] = 'Предмет'
LANG['Experience'] = 'Досвід'
LANG['Job'] = 'Професія'
LANG['Money'] = 'Гроші'
LANG['Weapon'] = 'Зброя'
LANG['Console Command'] = 'Консольна команда'
LANG['Key'] = 'Ключ'
LANG['Case'] = 'Кейс'

-- Fields
LANG['IDENTIFIER'] = 'ІДЕНТИФІКАТОР'
LANG['TYPE'] = 'ТИП'
LANG['NAME'] = 'ІМ\'Я'
LANG['PRICE'] = 'ВАРТІСТЬ'
LANG['ICON'] = 'ЗОБРАЖЕННЯ'
LANG['ORDER'] = 'ПОРЯДОК'
LANG['CATEGORY'] = 'КАТЕГОРІЯ'

LANG['IDENTIFIER_Desc'] = 'Введіть унікальний ідентифікатор.'
LANG['TYPE_Desc'] = 'Виберіть тип предмета.'
LANG['NAME_Desc'] = 'Введіть назву.'
LANG['PRICE_Desc'] = 'Введіть вартість предмета.'
LANG['ICON_Desc'] = 'Введіть зображення.'
LANG['ORDER_Desc'] = 'Введіть номер для упорядкування категорій.'
LANG['CATEGORY_Desc'] = 'Виберіть категорію предмета.'

onyx.lang:AddPhrases('ukrainian', LANG)
--PATH addons/____onyx_creditstore/lua/onyx/modules/creditstore/core/inv/sh_inventory.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com
Licensee: 76561198843434426

23/04/2023

--]]

netchunk.Register('onyx.creditstore:SyncInventory')

local creditstore = onyx.creditstore

function creditstore:GetPlayerInventory(ply)
    return ply:GetVar('onyx_CreditstoreInventory', {})
end

function creditstore:GetPlayerItemAmount(ply, itemID)
    local inventory = self:GetPlayerInventory(ply)
    local amount = 0
    for _, it in ipairs(inventory) do
        if (it.id == itemID) then
            amount = amount + 1
        end
    end
    return amount
end

function creditstore:GetCredits(ply)
    return ply:onyx_GetNetVar('credits', 0)
end

onyx.netvar:Register('credits', {
    type = TYPE_NUMBER,
    bits = 32,
    unsigned = true,
    public = false
})

onyx.netvar:Register('store_busy', {
    type = TYPE_BOOL,
    public = false
})

onyx.netvar:Register('store_loaded', {
    type = TYPE_BOOL,
    public = false
})

creditstore.GetBalance = creditstore.GetCredits
--PATH addons/____onyx_creditstore/lua/onyx/modules/creditstore/core/refund/cl_refund.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

02/05/2023

--]]
--PATH addons/____onyx_creditstore/lua/onyx/modules/creditstore/cfg/integrations/sh_darkrp.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

01/05/2023

--]]

local INTEGRATION = {}

INTEGRATION.Name = 'DarkRP'
INTEGRATION.Color = Color(73, 184, 63)
INTEGRATION.Desc = 'The DarkRP gamemode'

function INTEGRATION:Check()
    return rp ~= nil
end

function INTEGRATION:Load()
    self:CreateMoneyType()
    self:CreateJobType()
end

function INTEGRATION:CreateMoneyType()
    onyx.creditstore:RegisterType('darkrp_money', {
        name = 'Money',
        color = Color(97, 212, 82),
        stacking = true,
        options = {
            ['use'] = {
                removeItem = true,
                check = function(ply, data)
                    if (not ply:Alive()) then
                        return false, onyx.lang:Get('youMustBeAlive')
                    end
    
                    return true
                end,
                func = function(ply, data)
                    local amount = tonumber(data.amount)
                    if (amount and amount > 0) then
                        ply:addMoney(amount)
                        return true
                    end
                end
            }
        },
        settings = {
            {
                key = 'amount',
                name = 'AMOUNT',
                desc = 'Сума грошей, яку потрібно віддати.',
                icon = 'https://i.imgur.com/zgt3zea.png',
                type = 'number',
                validateOption = function(value)
                    if (not isnumber(value)) then
                        return false, 'Сума має бути числом!'
                    end
                    if (value < 1) then
                        return false, 'Сума має бути більше 0!'
                    end
                    return true
                end
            }
        }
    })
end

local function findJobByCommand(command)
    for i, job in pairs(rp.Team) do
        if (job.Command == command) then
            return job, i
        end
    end
end

function INTEGRATION:CreateJobType()
    local ITEMTYPE = {}
    ITEMTYPE.name = 'Job'
    ITEMTYPE.color = Color(82, 175, 212)
    ITEMTYPE.noDuplicates = true

    ITEMTYPE.equip = true
    ITEMTYPE.onEquip = function(ply, itemTableData)
        
    end
    ITEMTYPE.onUnequip = function(ply, itemTableData)
        
    end

    ITEMTYPE.settings = {
        {
            key = 'jobcommand',
            name = 'JOB',
            desc = 'Робота, пов’язана з предметом.',
            icon = 'https://i.imgur.com/zgt3zea.png',
            type = 'combo',
            getOptions = function()
                local options = {}

                for _, job in pairs(rp.Team) do
                    table.insert(options, {
                        text = job.name,
                        data = job.Command
                    })
                end

                table.sort(options, function(a, b)
                    return a.text < b.text
                end)

                return options
            end,
            onChoose = function(index, text, data, fields)
                local job = findJobByCommand(data)
                if (job) then
                    local model = istable(job.Model) and job.Model[1] or job.Model
                    fields.icon.picker:ChooseOptionID(2)

                    fields.icon.entry:SetValue(model)
                    fields.icon.entry:Highlight(onyx.GetOppositeAccentColor(), 3)

                    fields.name.entry:SetValue(job.name)
                    fields.name.entry:Highlight(onyx.GetOppositeAccentColor(), 3)
                end
            end,
            validateOption = function(data)
                -- do not be lazy to do this function, it is also used on the server side to validate value
                if (not data) then return false, 'Треба вибрати роботу!' end
                if (not findJobByCommand(data)) then return false end

                return true
            end
        }
    }

    onyx.creditstore:RegisterType('darkrp_job', ITEMTYPE)

    hook.Add('playerRPCanChangeTeam', 'onyx.creditstore.whitelist', function(ply, teamIndex)
        local teamData = rp.Team[teamIndex]

        if not teamData then return end
        for id, itemTable in pairs(onyx.creditstore.items) do
            if (itemTable.type == 'darkrp_job' and itemTable.data.jobcommand == teamData.Command) then
                
                local inventory = onyx.creditstore:GetPlayerInventory(ply)
                local hasItem = false
                local itemActivated = false

                for _, it in ipairs(inventory) do
                    if (it.id == id) then
                        hasItem = true
                        itemActivated = it.data and it.data.equipped
                        break
                    end
                end

                if teamData.customCheck and teamData.customCheck( ply ) then
                    return true
                end
                
                local bCanUse = hasItem and itemActivated or false
                local reason

                if (not bCanUse and IsFirstTimePredicted()) then
                    if (hasItem) then
                        reason = 'Робота обмежена, активуйте в інвентарі !store'
                    else
                        reason = 'Робота обмежена, купуйте доступ у !store'
                    end
                end

                return bCanUse, reason
            end
        end
    end)
end

onyx.creditstore:RegisterIntegration('darkrp', INTEGRATION)
--PATH addons/____onyx_creditstore/lua/onyx/modules/creditstore/cfg/types/sh_rank.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

08/05/2023

--]]

local setRank
if (SERVER) then
    function setRank(ply, group)
        assert(IsEntity(ply), Format('bad argument #1 to `setRank` (expected player, got %s)', type(ply)))
        assert(isstring(group), Format('bad argument #2 to `setRank` (expected string, got %s)', type(group)))

        local oldGroup = ply:GetUserGroup()

        onyx.creditstore:PrintDebug('Attempting to set a new group # to # (old: #)', group, ply, oldGroup)

        if (sam) then
            ply:SetUserGroup(group)
            if (ply.sam_setrank) then
                ply:sam_setrank(group)
            end
            return true
        elseif (ulx) then
            ply:SetUserGroup(group)
            return true
        elseif (sAdmin) then
            sAdmin.setRank(ply, group)
            return true
        end
    end

    local function applyStoreRank(ply)
        local inventory = onyx.creditstore:GetPlayerInventory(ply)
        for _, it in ipairs(inventory) do
            local item = onyx.creditstore.items[it.id]
            if (item and item.type == 'permrank' and it.data and it.data.equipped) then
                setRank(ply, item.data.rank)
                break
            end
        end
    end

    hook.Add('onyx.creditstore.PlayerLoaded', 'onyx.creditstore.rank', function(ply)
        timer.Simple(10, function() -- timer to evade override from admin mode
            if (IsValid(ply)) then
                ply.onyx_InitRank = ply:GetUserGroup()
                applyStoreRank(ply)
            end
        end)
    end)

    hook.Add('CAMI.PlayerUsergroupChanged', 'onyx.creditstore.rank', function(ply, old, new)
        ply.onyx_InitRank = new
        applyStoreRank(ply)
    end)
end

do
    local ITEMTYPE = {}
    ITEMTYPE.name = 'Permanent Rank'
    ITEMTYPE.color = Color(0, 102, 255)
    ITEMTYPE.noDuplicates = true

    ITEMTYPE.equip = true
    ITEMTYPE.uniqueEquip = true
    ITEMTYPE.onEquip = function(ply, itemTableData)
        setRank(ply, itemTableData.rank)
    end
    ITEMTYPE.onUnequip = function(ply, itemTableData)
        if (ply.onyx_InitRank) then
            setRank(ply, ply.onyx_InitRank)
        end
        -- ply.onyx_OldRank = nil
    end

    ITEMTYPE.settings = {
        {
            key = 'rank',
            name = 'RANK',
            desc = 'The rank identifier.',
            icon = 'https://i.imgur.com/zgt3zea.png',
            type = 'string',
            validateOption = function(value)
                if (value == '') then
                    return false, 'You must enter the rank id!'
                end
        
                return true
            end
        }
    }

    onyx.creditstore:RegisterType('permrank', ITEMTYPE)
end
--PATH addons/____onyx_creditstore/lua/onyx/modules/creditstore/cfg/types/sh_weapon.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

01/05/2023

--]]

local tWeaponOption = {
    key = 'wpnclass',
    name = 'WEAPON',
    desc = 'The weapon linked to the item.',
    icon = 'https://i.imgur.com/zgt3zea.png',
    type = 'combo',
    getOptions = function()
        local options = {}

        for _, data in pairs(weapons.GetList()) do
            local class = data.ClassName
            if (class and not class:find('base') and data.PrintName) then
                local category = data.Category or 'Other'
                local printName = language.GetPhrase(data.PrintName)
                local name = category and (category .. ' | ' .. printName) or printName

                table.insert(options, {
                    text = name,
                    data = class
                })
            end
        end

        table.sort(options, function(a, b)
            return a.text < b.text
        end)

        return options
    end,
    onChoose = function(index, text, data, fields)
        local wep = weapons.Get(data)   
        if (wep) then
            local model = wep.WorldModel and (wep.WorldModel ~= '' and wep.WorldModel or 'models/error.mdl') or 'models/error.mdl'
            fields.icon.picker:ChooseOptionID(2)

            fields.icon.entry:SetValue(model)
            fields.icon.entry:Highlight(onyx.GetOppositeAccentColor(), 3)

            fields.name.entry:SetValue(wep.PrintName or 'UNKNOWN')
            fields.name.entry:Highlight(onyx.GetOppositeAccentColor(), 3)
        end
    end,
    validateOption = function(data)
        -- do not be lazy to do this function, it is also used on the server side to validate value
        if (not data) then return false, 'You must choose a weapon!' end
        if (not weapons.Get(data)) then return false end

        return true
    end
}

onyx.creditstore:RegisterType('weapon', {
    name = 'Weapon',
    color = Color(252, 97, 97),
    stacking = true,
    options = {
        ['use'] = {
            removeItem = true,
            check = function(ply, data)
                if (not ply:Alive()) then
                    return false, onyx.lang:Get('youMustBeAlive')
                end

                if (ply:HasWeapon(data.wpnclass)) then
                    return false, 'You already have this weapon!'
                end

                return true
            end,
            func = function(ply, data)
                local class = data.wpnclass
                if (class) then
                    ply:Give(class)
                    return true
                end
            end
        }
    },
    settings = {
        tWeaponOption
    }
})

onyx.creditstore:RegisterType('permweapon', {
    name = 'Permanent Weapon',
    color = Color(233, 148, 69),
    noDuplicates = true,
    equip = true,
    onEquip = function(ply, itemTableData)
        local weapon = ply:Give(itemTableData.wpnclass)

        weapon.onyx_Permanent = true
        weapon.ignoreInv = true -- for xenin
    end,
    onUnequip = function(ply, itemTableData)
        ply:StripWeapon(itemTableData.wpnclass)
    end,
    onLoadout = function(ply, itemTableData)
        local weapon = ply:Give(itemTableData.wpnclass)

        weapon.onyx_Permanent = true
        weapon.ignoreInv = true -- for xenin
    end,
    options = {},
    generateItemData = function(itemTable)
        return {}
    end,
    settings = {
        tWeaponOption
    }
})

if (SERVER) then
    hook.Add('canDropWeapon', 'onyx.creditstore', function(ply, weapon)
        if (IsValid(weapon) and weapon.onyx_Permanent) then
            return false
        end
    end)
end
--PATH addons/____onyx_creditstore/lua/onyx/modules/creditstore/ui/cl_admin_item_configurator.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

19/04/2023

--]]

local PANEL = {}

local colorPrimary = onyx:Config('colors.primary')
local colorSecondary = onyx:Config('colors.secondary')
local colorAccent = onyx:Config('colors.accent')
local colorTertiary = onyx:Config('colors.tertiary')
local colorQuaternary = onyx:Config('colors.quaternary')
local colorGray = Color(155, 155, 155)
local colorRed = Color(196, 77, 77)

local font0 = onyx.Font('Comfortaa Bold@16')
local font1 = onyx.Font('Comfortaa Bold@20')
local wimgLinked = onyx.wimg.Simple('https://i.imgur.com/jSCI5Ma.png', 'smooth mips')
local wimgLock = onyx.wimg.Simple('https://i.imgur.com/R9B3Zm3.png', 'smooth mips')

function PANEL:Init()
    local margin = onyx.ScaleTall(10)

    self.typeSettingsPanels = {}
    self.fields = {}

    self.list = self:Add('onyx.ScrollPanel')
    self.list:Dock(FILL)
    self.list:DockMargin(margin, margin, margin, margin)

    -- IDENTIFIER
    self:AddField({
        key = 'id',
        name = 'IDENTIFIER',
        desc = 'The unique identifier of the item.',
        icon = 'https://i.imgur.com/GUrwAHN.png',
        type = 'string',
        placeholder = 'money10k'
    })
    -- TYPE
    do
        local options = {}

        for id, data in pairs(onyx.creditstore.types) do
            table.insert(options, {
                text = onyx.lang:Get(data.fullName or data.name),
                data = id
            })
        end

        table.sort(options, function(a, b)
            return a.text < b.text
        end)
    
        self:AddField({
            key = 'type',
            name = 'TYPE',
            desc = 'The type of the item.',
            icon = 'https://i.imgur.com/4sjUcaV.png',
            type = 'combo',
            options = options,
            onChoose = function(index, text, data)
                self:OnTypeChanged(data)
            end
        })
    end
    -- NAME
    self:AddField({
        key = 'name',
        name = 'NAME',
        desc = 'The name of the item.',
        icon = 'https://i.imgur.com/tRA1npP.png',
        type = 'string',
        placeholder = '$10 000'
    })
    -- PRICE
    self:AddField({
        key = 'price',
        name = 'PRICE',
        desc = 'The price of the item.',
        webImage = 'creditstore_currency',
        type = 'number',
        placeholder = '10000'
    })
    -- ICON
    self:AddField({
        key = 'icon',
        name = 'ICON',
        desc = 'The icon/model of the item.',
        icon = 'https://i.imgur.com/hiJ6Qft.png',
        type = 'icon/model'
    })
    -- CATEGORY
    do
        local options = {}

        for id, data in pairs(onyx.creditstore.categories) do
            table.insert(options, {
                text = data.name,
                data = id,
                iconURL = data.icon,
                iconParams = 'smooth mips'
            })
        end

        self:AddField({
            key = 'category',
            name = 'CATEGORY',
            desc = 'The category of the item.',
            icon = 'https://i.imgur.com/tXOFRPL.png',
            type = 'combo',
            options = options
        })
    end

    self.btnCreate = self.list:Add('onyx.Button')
    self.btnCreate:SetText(onyx.lang:Get('create_u'))
    self.btnCreate:SetZPos(99)
end

function PANEL:PerformLayout(w, h)

end

function PANEL:ItemCreation()
    self.fields.category.combo:ChooseOptionID(1)
    self.btnCreate.DoClick = function(panel)
        local itemData = self:GenerateItemData()
        if (itemData) then
            net.Start('onyx.creditstore:CreateItem')
                onyx.net.WriteTable(itemData)
            net.SendToServer()

            self:Call('OnEditRequested')

            surface.PlaySound('onyx/ui/on_affirm/echo_affirm1.wav')
        else
            surface.PlaySound('onyx/ui/on_deny/echo_deny.wav')
        end
    end
end

function PANEL:GenerateItemData(bEdit)
    local fields = self.fields
    local item = {}

    item.id = fields.id.entry:GetValue()
    item.name = fields.name.entry:GetValue()
    item.price = fields.price.entry:GetValue()
    item.type = fields.type.combo:GetOptionData() or ''
    item.category = fields.category.combo:GetOptionData() or ''
    
    local isIcon3D = fields.icon.picker:GetOptionData()

    if (isIcon3D) then
        item.model = fields.icon.entry:GetValue()
    else
        item.icon = fields.icon.entry:GetValue()
    end

    local sorted = {'id', 'type', 'name', 'price', 'model', 'icon', 'category'}

    if (bEdit) then
        table.RemoveByValue(sorted, 'id')
    end
    
    for _, key in ipairs(sorted) do
        local value = item[key]
        if not value then continue end

        local valid, reason = onyx.creditstore:ValidateFieldValue(key, value)
        -- print(key, valid, reason)
        if (not valid) then
            notification.AddLegacy(reason, 1, 3)

            local fieldKey = key
            if (fieldKey == 'model') then
                fieldKey = 'icon'
            end

            if (fields[fieldKey]) then
                if (fields[fieldKey].entry) then
                    fields[fieldKey].entry:Highlight(Color(179, 70, 70))
                elseif (fields[fieldKey].combo) then
                    fields[fieldKey].combo:Highlight(Color(179, 70, 70))
                end
            end

            return false
        end
    end

    --[[------------------------------
    Go through item's type required data
    --------------------------------]]
    item.data = {}

    local typeData = onyx.creditstore.types[item.type]

    for _, option in ipairs(typeData.settings or {}) do
        local key = option.key
        local field = self.typeSettingsPanels[key]
        assert(field, 'no field found for type settings (' .. key .. ')')

        local value
        local highlightPanel
        if (option.type == 'string') then
            value = field.entry:GetValue()
            highlightPanel = field.entry
        elseif (option.type == 'number') then
            value = tonumber(field.entry:GetValue())
            highlightPanel = field.entry
        elseif (option.type == 'combo') then
            value = field.combo:GetOptionData()
            highlightPanel = field.combo
        end

        local valid, reason = option.validateOption(value)
        if (not valid) then
            if (reason) then
                notification.AddLegacy(reason, 1, 5)
            else
                notification.AddLegacy('Something wrong with ' .. option.name .. ' field.', 1, 5)
            end
            if (highlightPanel) then
                highlightPanel:Highlight(Color(179, 70, 70))
            end
            return false
        end

        item.data[key] = value
    end

    return item
end

function PANEL:AddField(data, attached)
    local padding = onyx.ScaleTall(7)

    data.desc = onyx.lang:GetWFallback(data.name .. '_Desc', data.desc)
    data.name = onyx.lang:Get(data.name)

    local field = self.list:Add('DPanel')
    field:SetTall(onyx.ScaleTall(85))
    field:Dock(TOP)
    field:DockMargin(0, 0, 0, onyx.ScaleTall(5))
    field.Paint = function(p, w, h)
        draw.RoundedBox(8, 0, 0, w, h, colorSecondary)
    end
    self.fields[data.key] = field

    local info = field:Add('Panel')
    info:Dock(TOP)
    info:SetTall(field:GetTall() * .5)
    info:DockPadding(padding, padding, padding, padding)
    info.Paint = function(p, w, h)
        draw.RoundedBoxEx(8, 0, 0, w, h, colorTertiary, true, true)
        
        -- surface.SetDrawColor(0, 0, 0, 100)
        surface.SetDrawColor(255, 255, 255, 10)
        surface.DrawRect(0, h - 1, w, 1)

        local child = field.entry or field.combo
        local locked = child:GetDisabled()
        local size = onyx.ScaleTall(12)

        if (locked) then
            wimgLock:Draw(w - h * .5 - size * .5, h * .5 - size * .5, size, size, colorRed)
        elseif (attached) then
            wimgLinked:Draw(w - h * .5 - size * .5, h * .5 - size * .5, size, size, colorGray)
        end
    end

    local icon = info:Add('onyx.Image')
    icon:Dock(LEFT)
    icon:SetWide(info:GetTall() - padding * 2)
    if (data.webImage) then
        icon:SetWebImage(data.webImage, 'smooth mips')
    else
        icon:SetURL(data.icon, 'smooth mips')
    end
    icon:SetImageWide(onyx.ScaleTall(16))
    icon:SetImageTall(icon:GetImageWide())

    local lblName = info:Add('onyx.Label')
    lblName:Font('Comfortaa Bold@14')
    lblName:SetText(data.name)
    lblName:Color(colorAccent)
    lblName:Dock(FILL)

    if (attached) then
        lblName:Color(onyx.GetOppositeAccentColor())
    end

    local lblDesc = info:Add('onyx.Label')
    lblDesc:Font('Comfortaa@14')
    lblDesc:SetText(data.desc)
    lblDesc:SizeToContentsY()
    lblDesc:Dock(BOTTOM)

    local content = field:Add('Panel')
    content:Dock(FILL)
    content:DockPadding(padding, padding, padding, padding)

    if (data.type == 'combo') then
        local combo = content:Add('onyx.ComboBox')
        combo:Dock(FILL)
        combo.OnSelect = function(panel, index, text, optionData)
            if (data.onChoose) then
                data.onChoose(index, text, optionData, self.fields)
            end
        end

        local options = data.getOptions and data.getOptions() or data.options

        for _, option in pairs(options) do
            combo:AddOptionAdvanced(option)
        end

        field.combo = combo
    elseif (data.type == 'icon/model') then
        local divider = content:Add('Panel')
        divider:Dock(FILL)

        local entry = divider:Add('onyx.TextEntry')
        entry:Dock(FILL)

        field.entry = entry

        local picker = divider:Add('onyx.ComboBox')
        picker:Dock(LEFT)
        picker:SetWide(onyx.ScaleWide(100))
        picker:DockMargin(0, 0, onyx.ScaleWide(5), 0)
        picker:AddOptionAdvanced({
            text = onyx.lang:Get('icon'),
            iconURL = 'https://i.imgur.com/QhuSK6f.png',
            iconParams = 'smooth mips',
            data = false
        })
        picker:AddOptionAdvanced({
            text = onyx.lang:Get('model'),
            iconURL = 'https://i.imgur.com/9mcE5Ge.png',
            iconParams = 'smooth mips',
            data = true
        })
        picker.OnSelect = function(panel, index, text, data)
            entry:SetValue('')
            if (data) then
                entry:SetPlaceholderText('Write the path to the model')
            else
                entry:SetPlaceholderText('Write the URL to the icon')
            end
        end

        picker:ChooseOptionID(1)

        field.picker = picker
    else
        local entry = content:Add('onyx.TextEntry')
        entry:Dock(FILL)
        entry:SetPlaceholderText(data.placeholder)

        field.entry = entry
    end

    return field
end

function PANEL:OnTypeChanged(typeName)
    for key, child in pairs(self.typeSettingsPanels) do
        child:Remove()
    end

    self.typeSettingsPanels = {}

    local data = onyx.creditstore.types[typeName]

    local iconValue = self.fields.icon.entry:GetValue()
    if (iconValue == '' or iconValue == (self.fields.icon.oldModel or '')) then
        if (data.defaultIcon) then
            self.fields.icon.picker:ChooseOptionID(1)
            self.fields.icon.entry:SetValue(data.defaultIcon)
            self.fields.icon.oldModel = data.defaultIcon
        else
            self.fields.icon.entry:SetValue('')
            self.fields.icon.oldModel = nil
        end
    end

    for _, option in ipairs(data.settings or {}) do
        local field = self:AddField(option, true)

        self.typeSettingsPanels[option.key] = field
    end

    self.oldTypeData = data
end

function PANEL:ItemEditor(itemID, itemTable)
    local fields = self.fields

    -- PrintTable(itemTable)

    fields.id.entry:SetValue(itemTable.id)
    fields.id.entry:SetDisabled(true)

    fields.name.entry:SetValue(itemTable.name)

    fields.price.entry:SetValue(tostring(itemTable.price))

    if (itemTable.model) then
        fields.icon.picker:ChooseOptionID(2)
        fields.icon.entry:SetValue(itemTable.model)
    else
        fields.icon.picker:ChooseOptionID(1)
        fields.icon.entry:SetValue(itemTable.icon)
    end

    local itemType = itemTable.type
    local _, index = fields.type.combo:FindOptionByData(itemType)

    if (index) then
        fields.type.combo:ChooseOptionID(index)

        local itemTypeData = onyx.creditstore.types[itemType]

        for _, option in ipairs(itemTypeData.settings or {}) do
            local key = option.key
            local field = self.typeSettingsPanels[key]
            local value = itemTable.data[key]

            if (option.type == 'string' or option.type == 'number') then
                field.entry:SetValue(value)
            elseif (option.type == 'combo') then
                local _, index2 = field.combo:FindOptionByData(value)
                if (index2) then
                    field.combo:ChooseOptionID(index2, true) -- ignores `OnSelect` event
                    field.combo:Highlight(onyx:Config('colors.positive'), 3)
                else
                    field.combo:SetCurrentOptionText('NOT FOUND: ' .. tostring(value))
                    field.combo:Highlight(onyx:Config('colors.negative'))
                end
            end
        end
    else
        fields.type.combo:SetCurrentOptionText('INVALID ITEM TYPE: ' .. itemType)
        fields.type.combo:Highlight(onyx:Config('colors.negative'))

        self.btnCreate:SetDisabled(true)
    end

    local category = itemTable.category
    local _, index = fields.category.combo:FindOptionByData(category)
    if (index) then
        fields.category.combo:ChooseOptionID(index)
    else
        fields.category.combo:SetCurrentOptionText('INVALID CATEGORY: ' .. category)
        fields.category.combo:Highlight(onyx:Config('colors.negative'))
    end

    -- fields.type.combo:SetDisabled(true)

    self.btnDelete = self.list:Add('onyx.Button')
    self.btnDelete:SetText(onyx.lang:Get('delete_u'))
    self.btnDelete:SetZPos(100)
    self.btnDelete:SetColorIdle(onyx:Config('colors.negative'))
    self.btnDelete:SetColorHover(onyx.OffsetColor(self.btnDelete:GetColorIdle(), -30))
    self.btnDelete.DoClick = function()
        net.Start('onyx.creditstore:DeleteItem')
            net.WriteString(itemID)
        net.SendToServer()

        self:Call('OnEditRequested')
    end

    self.btnCreate:SetText(onyx.lang:Get('edit_u'))
    self.btnCreate.DoClick = function(panel)
        local itemData = self:GenerateItemData(true)
        if (itemData) then
            local id = itemData.id

            itemData.id = nil
            -- itemData.type = nil

            net.Start('onyx.creditstore:EditItem')
                net.WriteString(id)
                onyx.net.WriteTable(itemData)
            net.SendToServer()

            self:Call('OnEditRequested')

            surface.PlaySound('onyx/ui/on_affirm/echo_affirm1.wav')
        else
            surface.PlaySound('onyx/ui/on_deny/echo_deny.wav')
        end
    end
end

onyx.gui.Register('onyx.creditstore.AdminItemConfigurator', PANEL)

-- ANCHOR Test

-- onyx.gui.Test('onyx.Frame', .33, .5, function(self)
--     self:MakePopup()

--     local content = self:Add('onyx.creditstore.AdminItemConfigurator')
--     content:Dock(FILL)
--     content.OnEditRequested = function()
--         self:Remove()
--     end
-- end)
--PATH addons/____onyx_creditstore/lua/onyx/modules/creditstore/ui/cl_shop.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

02/03/2023

--]]

local PANEL = {}

local colorPrimary = onyx:Config('colors.primary')
local colorSecondary = onyx:Config('colors.secondary')

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

    self.list = self:Add('onyx.ScrollPanel')
    self.list:Dock(FILL)

    self.categories = {}
    self:LoadItems()
end

function PANEL:LoadItems()
    local items = onyx.creditstore.items
    local cats = onyx.creditstore.categories
    local sortedItems = {}
    local sortedCategories = {}
    local bFound = {}

    for id in pairs(items) do
        table.insert(sortedItems ,id)
    end

    table.sort(sortedItems, function(a, b)
        return items[a].price < items[b].price
    end)

    for id in pairs(cats) do
        table.insert(sortedCategories ,id)
    end

    table.sort(sortedCategories, function(a, b)
        local aOrder = (cats[a].order or 98)
        local bOrder = (cats[b].order or 98)
        return aOrder < bOrder
    end)

    for catIndex, catID in ipairs(sortedCategories) do
        for _, id in ipairs(sortedItems) do
            local item = items[id]
            if (item.category and item.category == catID) then
                bFound[id] = true
            end
        end
    end

    for catIndex, catID in ipairs(sortedCategories) do
        local catData = cats[catID]
        local cat = self.list:Add('onyx.Category')
        cat:Dock(TOP)
        cat:SetIcon(catData.icon, 'smooth mips')
        cat:SetTitle(onyx.utf8.upper(catData.name))
        cat:SetSpace(0)
        cat:SetInset(onyx.ScaleTall(15))
        cat:DockMargin(0, 0, 0, onyx.ScaleTall(10))
        cat.catID = catID

        table.insert(self.categories, cat)

        local content = cat:Add('onyx.Grid')
        content:Dock(TOP)
        content:SetTall(0)
        content:SetSpaceX(onyx.ScaleTall(10))
        content:SetSpaceY(content:GetSpaceX())
        content:SetColumnCount(5)
        content:SetSizeRatio(1.25)

        cat.content = content

        cat.canvas.Paint = function(p, w, h)
            draw.RoundedBox(8, 0, 0, w, h, colorPrimary)
        end

        cat.sortedItems = {}
        cat.itemPanels = {}

        for _, id in ipairs(sortedItems) do
            local item = items[id]
            if ((item.category and item.category == catID) or (catData.nocategory and not bFound[id])) then
                table.insert(cat.sortedItems, item)
            end
        end

        if (#cat.sortedItems > 0 or not catData.nocategory) then
            cat:SetExpanded(true)
        else
            cat:Remove()
        end
    end

    self:LazyLoading()
end

function PANEL:LazyLoading()
    self.lazyLoadingEnabled = true
end

local precached = {}
function PANEL:Think()
    if (not self.lazyLoadingEnabled) then return end
    if ((self.nextThink or 0) > CurTime()) then return end

    local cheapMode = onyx.creditstore:GetOptionValue('cheap_icon_mode')
    local interval = .05

    self.nextThink = CurTime() + interval -- safeguard

    for index, category in ipairs(self.categories) do
        local itemTables = category.sortedItems
        local itemPanels = category.itemPanels
        local loaded = false

        if (itemTables) then
            for itemIndex, item in ipairs(itemTables) do
                local id = item.id
                local model = item.model
                if (not itemPanels[id]) then
                    if (model and not cheapMode and not precached[model]) then
                        interval = .2
                        precached[model] = true
                    end

                    local slot = category.content:Add('onyx.creditstore.Item')
                    slot:SetItem(id, {})
                    slot:SetPriceTagVisible(true)
                    slot:SetAlpha(0)
                    slot:AlphaTo(255, .33)
                    slot.store = true
                    slot.DoClick = function(panel)
                        if (panel.owned) then return end

                        local price = item.price
                        if (onyx.creditstore:GetCredits(LocalPlayer()) < price) then
                            notification.AddLegacy(onyx.lang:Get('notEnoughCredits'), 1, 5)
                            return
                        end

                        local dmenu = vgui.Create('onyx.Menu')
                        dmenu:ToCursor()

                        local sub = dmenu:AddSubMenu(onyx.lang:Get('purchaseItem', {item = item.name}))
                        sub:AddOption(onyx.lang:Get('confirm'), function()
                            net.Start('onyx.creditstore:PurchaseItem')
                                net.WriteString(id)
                            net.SendToServer()
                        end)

                        sub:AddOption(onyx.lang:Get('cancel'), function() end)

                        dmenu:Open()
                    end

                    itemPanels[id] = slot
                    category:UpdateInTick()

                    local typeData = onyx.creditstore.types[item.type]
                    if (typeData) then
                        local customCheck = typeData.customCheck
                        if (customCheck) then
                            local allowed, status = customCheck(LocalPlayer(), item)
                            if (allowed == false) then
                                slot.DoClick = nil
                                slot.status = status
                            end
                        end
                    end

                    loaded = true
                    break
                end
            end
        end

        if (loaded) then
            break
        end
    end

    self.nextThink = CurTime() + interval
end

onyx.gui.Register('onyx.creditstore.Shop', PANEL)
--PATH addons/____onyx_f4/lua/onyx/modules/f4/ui/cl_frame.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

25/12/2023

--]]

local colorPrimary = onyx:Config('colors.primary')
local colorTertiary = onyx:Config('colors.tertiary')
local wimgLoading = onyx.wimg.Simple('https://i.imgur.com/VVswRpx.png', 'smooth mips')
local lastChosenTab = 1

local L = function(...) return onyx.lang:Get(...) end

DEFINE_BASECLASS('onyx.Frame')

local PANEL = {}

function PANEL:Init()
    onyx.f4.frame = self

    local padding = onyx.ScaleTall(10)
    self.containerPadding = padding

    self.container = self:Add('Panel')
    self.container:DockPadding(padding, padding, padding, padding)

    self.sidebar = self:Add('onyx.Sidebar')
    self.sidebar:SetDescriptionEnabled(true)
    self.sidebar:SetContainer(self.container)
    self.sidebar:SetKeepTabContent(true)
    self:Combine(self.sidebar, 'ChooseTab')
    self.sidebar:On('OnTabSwitched', function(panel, tab)
        if (tab.data.class ~= 'HTML') then
            lastChosenTab = tab.tabIndex
        end
    end)

    self.profile = self:InitProfile()

    self:SetTitle(onyx.f4:GetOptionValue('title'))
    self:LoadTabs()
    self:ChooseTab(lastChosenTab)
    self.currentJob = LocalPlayer():Team()
end

function PANEL:PerformLayout(w, h)
    BaseClass.PerformLayout(self, w, h)

    self.sidebar:Dock(LEFT)
    self.sidebar:SetWide(w * .2)

    self.container:Dock(FILL)
end

function PANEL:InitProfile()
    local sidebar = self.sidebar
    local padding = onyx.ScaleTall(7.5)
    local client = LocalPlayer()

    local labelText = team.GetName(client:Team())
    local labelColor = onyx.f4.ConvertJobColor(team.GetColor(client:Team()))
    local labelFont = onyx.Font('Comfortaa@14')

    local profile = sidebar:Add('Panel')
    profile:SetTall(onyx.ScaleTall(50))
    profile:Dock(TOP)
    profile:DockMargin(0, 0, 0, onyx.ScaleTall(5))
    profile:DockPadding(padding, padding, padding, padding)
    profile.Paint = function(panel, w, h)
        draw.RoundedBox(8, 0, 0, w, h, colorTertiary)
        draw.RoundedBox(8, 1, 1, w - 2, h - 2, colorPrimary)
    end
    profile.Think = function(panel)
        if ((panel.nextThink or 0) > CurTime()) then return end
        panel.nextThink = CurTime() + .25

        local lblJob = panel.lblJob

        labelColor = onyx.f4.ConvertJobColor(team.GetColor(client:Team()))                                                                                                                                                                            -- 9bd46d08-b472-493c-8cb7-294505375bac
        labelText = team.GetName(client:Team())

        if (IsValid(lblJob)) then
            lblJob:SetText(labelText)
        end
    end

    local avatar = profile:Add('onyx.RoundedAvatar')
    avatar:Dock(LEFT)
    avatar:SetWide(profile:GetTall() - padding * 2)
    avatar:SetPlayer(LocalPlayer(), 64)
    avatar:DockMargin(0, 0, onyx.ScaleWide(10), 0)
    avatar.PaintOver = function(panel, w, h)
        onyx.DrawOutlinedCircle(w * .5, h * .5, w * .5, 4, labelColor)
    end

    local lblTitle = profile:Add('onyx.Label')
    lblTitle:Dock(TOP)
    lblTitle:SetText(client:Name())
    lblTitle:Font('Comfortaa Bold@16')
    lblTitle:SetContentAlignment(4)

    local lblJob = profile:Add('onyx.Label')
    lblJob:Dock(FILL)
    lblJob:SetText(labelText)
    lblJob:SetTextColor(labelColor)
    lblJob:SetFont(labelFont)
    lblJob:SetContentAlignment(7)
    profile.lblJob = lblJob

    profile.PerformLayout = function(panel, w, h)
        lblTitle:SetTall((h - padding * 2) * 0.5)
    end

    return profile
end

do
    local LINKS = {
        {
            name = 'discord_url',
            desc = 'f4.discord_url.desc',
            icon = 'https://i.imgur.com/tYNtgoR.png'
        },
        {
            name = 'forum_url',
            desc = 'f4.forum_url.desc',
            icon = 'https://i.imgur.com/RH3sx4q.png'
        },
        {
            name = 'steam_url',
            desc = 'f4.steam_url.desc',
            icon = 'https://i.imgur.com/jB5T1Wo.png'
        },
        {
            name = 'rules_url',
            desc = 'f4.rules_url.desc',
            icon = 'https://i.imgur.com/JFhx1xW.png'
        },
        {
            name = 'donate_url',
            icon = 'https://i.imgur.com/MrgKOkL.png',
            desc = 'f4_donate_desc',
            donate = true
        },
    }

    function PANEL:LoadTabs()
        local tabs = onyx.f4:GetSortedTabs()
        local hideDonateTab = onyx.f4:GetOptionValue('hide_donate_tab')
        local donateTabAdded = false

        for _, tab in ipairs(tabs) do
            self.sidebar:AddTab({
                name = L(tab.name),
                desc = L(tab.desc),
                icon = tab.icon,
                class = tab.class,
                onClick = tab.onClick,
                nameColor = tab.nameColor,
                descColor = tab.descColor,
                iconColor = tab.iconColor,
            })
        end

        if (onyx.creditstore and not hideDonateTab) then
            local colorGold = Color(255, 225, 106)
            local colorGoldDesc = Color(157, 143, 84)

            self.sidebar:AddTab({
                name = onyx.lang:Get('f4_donate_u'),
                desc = onyx.lang:Get('f4_donate_desc'),
                wimg = 'creditstore_currency',
                nameColor = colorGold,
                descColor = colorGoldDesc,
                iconColor = colorGold,
                onClick = function()
                    RunConsoleCommand('say', '/donate')
                    self:Close()
                    return false
                end
            })

            donateTabAdded = true
        end

        local allowedLinks = {}
        for _, link in ipairs(LINKS) do
            local url = onyx.f4:GetOptionValue(link.name):Trim()
            if (link.donate and donateTabAdded) then continue end

            if (url ~= '') then
                table.insert(allowedLinks, link)
            end
        end

        if (#allowedLinks > 0) then
            local spacer = self.sidebar:Add('Panel')
            spacer:Dock(TOP)
            spacer:SetTall(1)
            spacer:DockMargin(0, 0, 0, onyx.ScaleTall(5))
            spacer.Paint = function(panel, w, h)
                surface.SetDrawColor(0, 0, 0, 50)
                surface.DrawRect(0, 0, w, h)
            end
        end

        for _, link in ipairs(allowedLinks) do
            local option = onyx.inconfig.options['f4_' .. link.name]
            local name = L(option.title)
            local url = onyx.f4:GetOptionValue(link.name):Trim()

            self.sidebar:AddTab({
                name = name:upper(),
                desc = (link.desc and L(link.desc) or ''),
                icon = link.icon,
                wimg = link.wimg,
                class = 'HTML',
                onSelected = function(content)
                    content:OpenURL(url)
                    content.OnBeginLoadingDocument = function(panel)
                        if (not panel.bLoaded) then
                            panel.bLoading = true
                        end
                    end
                    content.OnFinishLoadingDocument = function(panel)
                        panel.bLoading = nil
                        panel.bLoaded = true
                    end
                    content.PaintOver = function(panel, w, h)
                        if (panel.bLoading) then
                            local maxSize = onyx.ScaleTall(64)
                            local size = maxSize * .5 + maxSize * .5 * math.abs(math.sin(CurTime()))

                            wimgLoading:DrawRotated(w * .5, h * .5, size, size, (CurTime() * 100) % 360)
                        end
                    end
                end,
                onClick = function()
                    if ( not onyx.f4:GetOptionValue('website_ingame') or url:find( 'discord.gg/' ) ) then
                        gui.OpenURL(url)
                        self:Close()
                        return false
                    end
                
                    return true
                end
            })
        end

        CAMI.PlayerHasAccess(LocalPlayer(), 'onyx_f4_edit', function(bAllowed)
            if (not bAllowed) then return end
            self.sidebar:AddTab({
                name = L('f4_admin_u'),
                desc = L('f4_admin_desc'),
                icon = 'https://i.imgur.com/l4M12dO.png',
                onClick = function()
                    onyx.f4.OpenAdminSettings()
                    self:Remove()
                    return false
                end
            })
        end)
    end
end

function PANEL:Think()
    if (self.currentJob ~= LocalPlayer():Team() and not self.jobRemoveCalled) then
        self:Remove()
        self.jobRemoveCalled = true
    end

    local keyName = input.LookupBinding('gm_showspare2', true)
    if (keyName) then
        local keyIndex = input.GetKeyCode(keyName)
        if (keyIndex and keyIndex > 0) then
            local keyDown = input.IsKeyDown(keyIndex)

            if (self.keyDown == nil) then
                self.keyDown = keyDown
            elseif (self.keyDown ~= keyDown) then
                self.keyDown = keyDown
                if (keyDown) then
                    self:Remove()
                end
            end
        end
    end
end

onyx.gui.Register('onyx.f4.Frame', PANEL, 'onyx.Frame')

--[[------------------------------
DEBUG
--------------------------------]]
-- onyx.gui.Test('onyx.f4.Frame', .65, .65, function(panel)
--     panel:MakePopup()
-- end)
--PATH addons/____onyx_f4/lua/onyx/modules/f4/ui/cl_job_preview.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

30/12/2023

--]]

local colorPrimary = onyx:Config('colors.primary')
local colorSecondary = onyx:Config('colors.secondary')
local colorAccent = onyx:Config('colors.accent')
local colorTertiary = onyx:Config('colors.tertiary')
local colorLine = Color(75, 75, 75)
local colorBG = onyx.OffsetColor(colorPrimary, -3)
local colorFavoriteIconIdle = Color(235, 235, 235)
local colorFavoriteIconActive = Color(255, 241, 93)
local COLOR_NEGATIVE = Color(221, 107, 107)
local COLOR_LABEL = Color(161, 161, 161)

local L = function(...) return onyx.lang:Get(...) end

local function generateDescHTML(desc)
    -- white-space: pre-wrap -- supports /t aswell
    local size = onyx.ScaleTall(12)
    local html = [[
        <head>
            <meta charset="UTF-8">
            <style>
                @import url('https://fonts.googleapis.com/css2?family=Comfortaa&family=Overpass:wght@400;600&display=swap');
                body {
                    color: white;
                    font-family: 'Comfortaa';
                    font-size: %dpx;
                    opacity: 0.999;
                    padding: 0;
                    margin: 0;
                    white-space: pre-line;
                    scroll-margin: 20px;
                    line-height: 1.5;
                }

                li {
                    line-height: 5px;
                }

                img {
                    text-align: center;
                    vertical-align: middle;
                    width: 24px;
                    height: 24px;
                }

                /* width */
                ::-webkit-scrollbar {
                    width: 4px;
                }

                /* Track */
                ::-webkit-scrollbar-track {
                    background: rgba(0, 0, 0, 0.1);
                    border-radius: 5px;
                }

                /* Handle */
                ::-webkit-scrollbar-thumb {
                    background: ]] .. onyx.ColorToHex(colorAccent) .. [[;
                    border-radius: 5px;
                }

                /* Handle on hover */
                ::-webkit-scrollbar-thumb:hover {
                    background: ]] .. onyx.ColorToHex(onyx.OffsetColor(colorAccent, -30)) .. [[;
                }
            </style>
        </head>
        <body>
            %s
        </body>
    ]]
    return string.format(html, size, desc)
end

local PANEL = {}

function PANEL:Init()
    self.colorSlightGradient = colorTertiary

    self.divInfo = self:Add('Panel')

    self.divModel = self:Add('Panel')

    self.iconModel = self.divModel:Add('DModelPanel')
    self.iconModel:Dock(FILL)
    self.iconModel:SetCursor('arrow')
    self.iconModel.LayoutEntity = function(panel, ent) end
    self.iconModel.slots = {}
    self.iconModel.PerformLayout = function(panel, w, h)
        local children = panel.slots
        local amount = #children
        local columns = 2
        local rows = math.ceil(amount / columns)
        local size = onyx.ScaleTall(36)
        local padding = onyx.ScaleTall(10)
        local space = onyx.ScaleTall(5)
        local X = w - size * columns - padding - space
        local Y = h - size * rows - padding - space * (rows - 1)

        local x = X
        for index = 1, amount do
            local button = children[index]

            button:SetSize(size, size)
            button:SetPos(x, Y)

            if (index % columns == 0) then
                x = X
                Y = Y + size + space
            else
                x = x + size + space
            end
        end
    end

    self.lblName = self.divInfo:Add('onyx.Label')
    self.lblName:Font('Comfortaa Bold@20')
    self.lblName:SetWrap(true)
    self.lblName:SetTextColor(color_white)
    self.lblName:SetAutoStretchVertical(true)
    self.lblName:Dock(TOP)

    self.lblSalary = self.divInfo:Add('onyx.Label')
    self.lblSalary:Font('Comfortaa Bold@16')
    self.lblSalary:SetTextColor(COLOR_LABEL)
    self.lblSalary:Dock(TOP)
    self.lblSalary:DockMargin(0, 0, 0, onyx.ScaleTall(20))

    self.navbar = self.divInfo:Add('onyx.Navbar')
    self.navbar:Dock(TOP)
    self.navbar:SetTall(onyx.ScaleTall(35))
    self.navbar:DockMargin(0, 0, 0, onyx.ScaleTall(5))
    self.navbar:SetSpace(onyx.ScaleWide(15))
    self.navbar.Paint = function(panel, w, h)
        local x1 = -self.padding
        local w1 = w + self.padding * 2

        local parent = self:GetParent()
        local x, y = parent:LocalToScreen(0, 0)
        local realW, realH = parent:GetSize()

        DisableClipping(true)
            render.SetScissorRect(x, y, x + realW, y + realH, true)
                surface.SetDrawColor(colorLine)
                surface.DrawRect(x1, h - 1, w1, 1)
            render.SetScissorRect(0, 0, 0, 0, false)
        DisableClipping(false)
    end
    self.navbar.OnTabAdded = function(panel, tab)
        tab:SizeToContents()
        tab:SetFont(onyx.Font('Comfortaa Bold@14'))
    end

    self.navbarContent = self.divInfo:Add('Panel')
    self.navbarContent:Dock(FILL)

    self.navbar:SetKeepTabContent(true)
    self.navbar:SetContainer(self.navbarContent)

    self.footer = self.divInfo:Add('Panel')
    self.footer:Dock(BOTTOM)
    self.footer:SetTall(onyx.ScaleTall(30))

    self.btnChoose = self.footer:Add('onyx.Button')
    self.btnChoose:SetText(L('f4_become_u'))
    self.btnChoose:SetGradientColor(onyx.OffsetColor(colorAccent, -50))
    self.btnChoose:SetMasking(true)
    self.btnChoose:Font('Comfortaa Bold@16')
    self.btnChoose:Dock(FILL)

    self.btnFavorite = self.footer:Add('onyx.ImageButton')
    self.btnFavorite:Dock(RIGHT)
    self.btnFavorite:SetWide(self.footer:GetTall( ))
    self.btnFavorite:DockMargin(onyx.ScaleTall(10), 0, 0, 0)
    self.btnFavorite.SetState = function(panel, state, ignore)
        panel.bState = state

        if (not ignore) then
            onyx.f4:SetFavorite(self.teamCommand, state)
            self:Call('OnFavoriteStateSwitched', nil, self.teamCommand, state)
        end

        local targetColor = state and colorFavoriteIconActive or colorFavoriteIconIdle

        if (state) then
            panel:SetWebImage('favorite_fill', 'smooth mips')
        else
            panel:SetWebImage('favorite_outline', 'smooth mips')
        end

        onyx.anim.Create(panel, .33, {
            index = onyx.anim.ANIM_HOVER,
            target = {
                m_colColor = targetColor
            }
        })
    end

    self.btnFavorite.m_Angle = 0
    self.btnFavorite.onyxEvents['OnCursorEntered'] = nil
    self.btnFavorite.onyxEvents['OnCursorExited'] = nil
    self.btnFavorite.onyxEvents['OnRelease'] = nil
    self.btnFavorite.onyxEvents['OnPress'] = nil
    self.btnFavorite:InstallRotationAnim()
    self.btnFavorite.m_iImageScale = 1
    self.btnFavorite.m_iImageScaleInitial = 1

    self.btnFavorite.DoClick = function(panel)
        panel:SetState(not panel.bState)
    end

    self.spacer = self.divInfo:Add('Panel')
    self.spacer:Dock(BOTTOM)
    self.spacer:DockMargin(0, onyx.ScaleTall(10), 0, onyx.ScaleTall(5))
    self.spacer.Paint = function(panel, w, h)
        local x1 = -self.padding
        local w1 = w + self.padding * 2

        local parent = self:GetParent()
        local x, y = parent:LocalToScreen(0, 0)
        local realW, realH = parent:GetSize()

        DisableClipping(true)
            render.SetScissorRect(x, y, x + realW, y + realH, true)
                surface.SetDrawColor(colorLine)
                surface.DrawRect(x1, h * .5, w1, 1)
            render.SetScissorRect(0, 0, 0, 0, false)
        DisableClipping(false)
    end

    self.navbar:AddTab({
        name = L('f4_description_u'),
        class = 'DHTML',
        onBuild = function(content)
            content:SetHTML(generateDescHTML(''))
        end
    })

    self.navbar:AddTab({
        name = L('f4_weapons_u'),
        class = 'onyx.ScrollPanel'
    })
end

function PANEL:SetupJob(job)
    local models = job.Model
    local multipleModels = istable(models) and #models > 1
    local model = istable(models) and models[1] or models
    local desc = job.Description:Trim()
    local weaponsList = job.Weapons or {}
    local teamIndex = job.team
    local level = job.level

    local navbar = self.navbar
    local tabs = navbar.tabs
    local descTab = tabs[1]
    local weaponsTab = tabs[2]
    local btnChoose = self.btnChoose

    self.teamIndex = teamIndex
    self.teamCommand = job.Command
    self.teamData = job

    self.btnFavorite:SetState(onyx.f4:IsFavorite(job.Command), true)

    if (job.vote or job.RequiresVote and job.RequiresVote(LocalPlayer(), job.team)) then
        btnChoose:SetText(L('f4_create_vote_u'))
        btnChoose.DoClick = function(panel)
            LocalPlayer():ConCommand('job ' .. self.teamCommand .. ' ' .. self.curmodel)
        end
    else
        btnChoose:SetText(L('f4_become_u'))
        btnChoose.DoClick = function(panel)
            LocalPlayer():ConCommand('job ' .. self.teamCommand .. ' ' .. self.curmodel)
        end
    end

    self.lblName:SetText(onyx.utf8.upper(job.name))

    if (level and onyx.f4.GetPlayerLevel(LocalPlayer(), math.huge) < level) then
        self.lblSalary:SetText(L('requires_level', {level = string.Comma(level)}))
        self.lblSalary:SetTextColor(COLOR_NEGATIVE)
        self.hideButton = true
    else
        self.lblSalary:SetText(L('f4_salary') .. ': ' .. rp.FormatMoney(job.Salary))
        self.lblSalary:SetTextColor(COLOR_LABEL)
        self.hideButton = false
    end

    self.colorSlightGradient = onyx.LerpColor(.1, colorSecondary, job.Color)

    self.iconModel:SetModel(model)
    self.iconModel:SetCamPos(Vector(50, 0, 50))
    self.iconModel:SetFOV(45)

    self.iconModel:Clear()
    self.iconModel.slots = {}

    self.curmodel = 0
    if (multipleModels) then
        local oldActiveModel
        for index, model in ipairs(models) do
            if (index > 14) then break end

            local button = self.iconModel:Add('DButton')
            button:SetText('')
            button.active = index == 1
            button.PerformLayout = function(panel, w, h)
                panel.mask = onyx.CalculateCircle(w * .5, h * .5, h * .5 - 2, 16)
            end
            button.idmodel = self.curmodel + 1
            button.Paint = function(panel, w, h)
                local child = panel:GetChild(0)

                onyx.DrawCircle(w * .5, h * .5, h * .5, colorSecondary)

                if (IsValid(child)) then
                    onyx.DrawWithPolyMask(panel.mask, function()
                        child:PaintManual()
                    end)
                end

                onyx.DrawOutlinedCircle(w * .5, h * .5, h * .5, 3, panel.active and colorAccent or color_white)
            end
            button.DoClick = function(panel)
                if (oldActiveModel) then
                    oldActiveModel.active = false
                end

                self.iconModel:SetModel(model)
                panel.active = true
                oldActiveModel = panel

                self.curmodel = panel.idmodel
            end

            if (index == 1) then
                oldActiveModel = button
            end

            local modelicon = button:Add('SpawnIcon')
            modelicon:Dock(FILL)
            modelicon:SetModel(model)
            modelicon:SetMouseInputEnabled(false)
            modelicon:SetPaintedManually(true)

            table.insert(self.iconModel.slots, button)

            self.curmodel = self.curmodel + 1
        end
    end

    navbar:SelectTab(descTab, true)

    if (IsValid(descTab.content)) then
        desc = desc:gsub('\t', '')
        desc = string.JavascriptSafe(desc)

        descTab.content:QueueJavascript([[
            document.body.innerHTML = ']] .. desc .. [[';
        ]])
    end

    weaponsTab:SetVisible(#weaponsList > 0)
    weaponsTab.tabData.onBuild = function(content)
        for _, class in ipairs(weaponsList) do
            local swepTable = weapons.Get(class)
            local name
            if (swepTable) then
                name = language.GetPhrase(swepTable.PrintName)
            else
                name = language.GetPhrase(class)
            end

            local panel = content:Add('onyx.Label')
            panel:Dock(TOP)
            panel:SetText(name)
            panel:SetTall(onyx.ScaleTall(30))
            panel:SetContentAlignment(5)
            panel:SetFont(onyx.Font('Comfortaa Bold@16'))
            panel.Paint = function(this, w, h)
                draw.RoundedBox(8, 0, 0, w, h, colorPrimary)
                draw.RoundedBox(8, 1, 1, w - 2, h - 2, colorTertiary)
            end
        end
    end

    if (IsValid(weaponsTab.content)) then
        weaponsTab.content:Remove()
    end
end

function PANEL:PerformLayout(w, h)
    local padding = onyx.ScaleTall(15)
    self.padding = padding

    self.divInfo:Dock(FILL)
    self.divInfo:DockPadding(padding, padding, padding, onyx.ScaleTall(5))

    self.divModel:Dock(RIGHT)
    self.divModel:SetWide(w * .5)
end

function PANEL:Paint(w, h)
    local x, y = self:LocalToScreen(0, 0)

    local frame = onyx.f4.frame
    if (not IsValid(frame)) then return end -- just in case

    local realX, realY = frame.container:LocalToScreen(0, 0)
    local realW, realH = frame.container:GetSize()
    local padding = frame.containerPadding

    local divModel = self.divModel
    local Y = -padding
    local H = h + padding * 2
    local W = w + padding

    if (self.enabled) then
        onyx.bshadows.BeginShadow()
            surface.SetDrawColor(colorSecondary)
            surface.DrawRect(x, y, w, h)
        onyx.bshadows.EndShadow(1, 2, 2, nil, 90, 2, true)
    end

    DisableClipping(true)
        render.SetScissorRect(realX, realY, realX + realW, realY + realH, true)
            draw.RoundedBoxEx(8, 0, Y, W, H, colorSecondary, false, false, false, true)

            draw.RoundedBoxEx(8, divModel:GetPos(), Y, divModel:GetWide() + padding, H, colorBG, false, false, false, true)

            onyx.DrawMatGradient(0, Y, self.divInfo:GetWide(), H * .5, BOTTOM, self.colorSlightGradient)
        render.SetScissorRect(0, 0, 0, 0, false)
    DisableClipping(false)
end

onyx.gui.Register('onyx.f4.JobPreview', PANEL)
--PATH addons/____onyx_hud/lua/onyx/modules/hud/languages/cl_turkish.lua:
--[[

Yazar: tochnonement
E-posta: tochnonement@gmail.com
Çevirmen: shazzam0

04/09/2024

--]]

local LANG = {}

--[[
    .............
    Genel Kelimeler
]]--

LANG[ 'hud_status_wanted' ] = 'Aranıyor'
LANG[ 'hud_status_speaking' ] = 'Konuşuyor'
LANG[ 'hud_status_typing' ] = 'Yazıyor'
LANG[ 'props' ] = 'Eşyalar'
LANG[ 'close' ] = 'Kapat'
LANG[ 'alert' ] = 'Uyarı'
LANG[ 'message' ] = 'Mesaj'
LANG[ 'unknown' ] = 'Bilinmiyor'
LANG[ 'accept' ] = 'Kabul Et'
LANG[ 'deny' ] = 'Reddet'
LANG[ 'none' ] = 'Yok'
LANG[ 'add' ] = 'Ekle'
LANG[ 'remove' ] = 'Kaldır'
LANG[ 'jobs' ] = 'Meslekler'
LANG[ 'door' ] = 'Kapı'
LANG[ 'vehicle' ] = 'Araç'
LANG[ 'door_groups' ] = 'Kapı Grupları'
LANG[ 'display' ] = 'Görüntüle'
LANG[ 'general' ] = 'Genel'
LANG[ 'speedometer' ] = 'Hız Göstergesi'
LANG[ 'fuel' ] = 'Yakıt'
LANG[ 'vote' ] = 'Oy'
LANG[ 'question' ] = 'Soru'

--[[
    .......
    Bağlantı Süresi Aşımı
]]--

LANG[ 'timeout_title' ] = 'BAĞLANTI KAYBEDİLDİ'
LANG[ 'timeout_info' ] = 'Sunucu şu anda kullanılamıyor, özür dileriz'
LANG[ 'timeout_status' ] = '%d saniye içinde yeniden bağlanacaksınız'

--[[
    ......
    Temalar
]]--

LANG[ 'hud.theme.default.name' ] = 'Varsayılan'
LANG[ 'hud.theme.forest.name' ] = 'Orman'
LANG[ 'hud.theme.violet_night.name' ] = 'Mor Gece'
LANG[ 'hud.theme.rustic_ember.name' ] = 'Rustik Kor'
LANG[ 'hud.theme.green_apple.name' ] = 'Yeşil Elma'
LANG[ 'hud.theme.lavender.name' ] = 'Lavanta'
LANG[ 'hud.theme.elegance.name' ] = 'Zarafet'
LANG[ 'hud.theme.mint_light.name' ] = 'Nane'
LANG[ 'hud.theme.gray.name' ] = 'Gri'
LANG[ 'hud.theme.rose_garden.name' ] = 'Gül Bahçesi'
LANG[ 'hud.theme.ocean_wave.name' ] = 'Okyanus Dalgası'
LANG[ 'hud.theme.sky_blue.name' ] = 'Gökyüzü Mavisi'
LANG[ 'hud.theme.golden_dawn.name' ] = 'Altın Şafak'

--[[
    ....
    Yardım
    - Tam cümle: "Ayarları açmak için <komut> yazın"
]]

LANG[ 'hud_help_type' ] = 'Yazın'
LANG[ 'hud_help_to' ] = 'ayarları açmak için'

--[[
    .............
    3D2D Kapılar
]]--

LANG[ 'door_purchase' ] = '{object} Satın Al'
LANG[ 'door_sell' ] = '{object} Sat'
LANG[ 'door_addowner' ] = 'Sahip Ekle'
LANG[ 'door_rmowner' ] = 'Sahip Kaldır'
LANG[ 'door_rmowner_help' ] = 'Sahipliğini iptal etmek istediğiniz oyuncuyu seçin'
LANG[ 'door_addowner_help' ] = 'Sahiplik vermek istediğiniz oyuncuyu seçin'
LANG[ 'door_title' ] = 'Başlık Ayarla'
LANG[ 'door_title_help' ] = 'Hangi başlığı ayarlamak istiyorsunuz?'
LANG[ 'door_admin_disallow' ] = 'Sahipliği Reddet'
LANG[ 'door_admin_allow' ] = 'Sahipliğe İzin Ver'
LANG[ 'door_admin_edit' ] = 'Erişimi Düzenle'
LANG[ 'door_owned' ] = 'Özel Mülk'
LANG[ 'door_unowned' ] = 'Satılık'

LANG[ 'hud_door_help' ] = '{price} için {bind} tuşuna basarak satın alın'
LANG[ 'hud_door_owner' ] = 'Sahibi: {name}'
LANG[ 'hud_door_allowed' ] = 'Sahip Olmasına İzin Verilenler'
LANG[ 'hud_door_coowners' ] = 'Ortak Sahipler'
LANG[ 'hud_and_more' ] = 've daha fazlası...'

--[[
    .........
    Büyük Harf
]]--

LANG[ 'reconnect_u' ] = 'YENİDEN BAĞLAN'
LANG[ 'disconnect_u' ] = 'BAĞLANTISINI KES'
LANG[ 'settings_u' ] = 'AYARLAR'
LANG[ 'configuration_u' ] = 'KONFİGÜRASYON'
LANG[ 'introduction_u' ] = 'GİRİŞ'

--[[
    .........
    Küçük Harf
]]--

LANG[ 'seconds_l' ] = 'saniye'
LANG[ 'minutes_l' ] = 'dakika'

--[[
    .............
    Konfigürasyon
]]--

LANG[ 'hud.timeout.name' ] = 'Zaman Aşımı Süresi'
LANG[ 'hud.timeout.desc' ] = 'Otomatik yeniden bağlantıdan önceki saniye sayısı'

LANG[ 'hud.alert_queue.name' ] = 'Uyarı Sırası'
LANG[ 'hud.alert_queue.desc' ] = 'Uyarılar sıraya yerleştirilsin mi?'

LANG[ 'hud.props_counter.name' ] = 'Eşya Sayacı'
LANG[ 'hud.props_counter.desc' ] = 'Eşya sayacını göster'

LANG[ 'hud.main_avatar_mode.name' ] = 'Ana Avatar Türü'
LANG[ 'hud.main_avatar_mode.desc' ] = 'Türü seçin'

LANG[ 'hud.voice_avatar_mode.name' ] = 'Ses Avatar Türü'
LANG[ 'hud.voice_avatar_mode.desc' ] = 'Türü seçin'

LANG[ 'hud.restrict_themes.name' ] = 'Tema Kısıtla'
LANG[ 'hud.restrict_themes.desc' ] = 'Oyuncuların tema seçimini kısıtla'

LANG[ 'hud.speedometer_mph.name' ] = 'Mil Kullan'
LANG[ 'hud.speedometer_mph.desc' ] = 'Birimi mil/saat olarak değiştir'

LANG[ 'hud.speedometer_max_speed.name' ] = 'Maksimum Varsayılan Hız'
LANG[ 'hud.speedometer_max_speed.desc' ] = 'Hız göstergesi için maksimum hız'

LANG[ 'hud_should_draw' ] = 'Öğeyi çizmelisin'
LANG[ 'hud.main.name' ] = 'Ana HUD'
LANG[ 'hud.ammo.name' ] = 'Mermi'
LANG[ 'hud.agenda.name' ] = 'Gündem'
LANG[ 'hud.alerts.name' ] = 'Uyarılar'
LANG[ 'hud.pickup_history.name' ] = 'Toplama Geçmişi'
LANG[ 'hud.level.name' ] = 'Seviye'
LANG[ 'hud.voice.name' ] = 'Ses Panelleri'
LANG[ 'hud.overhead_health.name' ] = '3D2D Üst Sağlık'
LANG[ 'hud.overhead_armor.name' ] = '3D2D Üst Zırh'
LANG[ 'hud.vehicle.name' ] = 'Araç HUD'

--[[
    ........
    Ayarlar
]]--

LANG[ 'hud.theme.name' ] = 'Tema'
LANG[ 'hud.theme.desc' ] = 'HUD temasını seç'

LANG[ 'hud.scale.name' ] = 'Ölçek'
LANG[ 'hud.scale.desc' ] = 'HUD ölçeğini ayarla'

LANG[ 'hud.roundness.name' ] = 'Yuvarlaklık'
LANG[ 'hud.roundness.desc' ] = 'HUD\'un yuvarlaklığını ayarla'

LANG[ 'hud.margin.name' ] = 'Kenar Boşluğu'
LANG[ 'hud.margin.desc' ] = 'HUD ile kenarlar arasındaki mesafe'

LANG[ 'hud.icons_3d.name' ] = '3D Modeller'
LANG[ 'hud.icons_3d.desc' ] = 'Model simgelerini 3D olarak render et'

LANG[ 'hud.compact.name' ] = 'Kompakt Mod'
LANG[ 'hud.compact.desc' ] = 'Kompakt modu etkinleştir'

LANG[ 'hud.speedometer_blur.name' ] = 'Hız Göstergesi Bulanıklığı'
LANG[ 'hud.speedometer_blur.desc' ] = 'Hız göstergesi için bulanıklığı etkinleştir'

LANG[ 'hud.3d2d_max_details.name' ] = 'Maksimum 3D2D Detaylar'
LANG[ 'hud.3d2d_max_details.desc' ] = 'Maksimum detaylı bilgi render sayısı'

--[[
    ......
    Durum
]]--

LANG[ 'hud_lockdown' ] = 'SOKAĞA ÇIKMA YASAĞI'
LANG[ 'hud_lockdown_help' ] = 'Lütfen evlerinize dönün!'

LANG[ 'hud_wanted' ] = 'ARANIYOR'
LANG[ 'hud_wanted_help' ] = 'Sebep: {reason}'

LANG[ 'hud_arrested' ] = 'TUTUKLU'
LANG[ 'hud_arrested_help' ] = '{time} içinde serbest bırakılacaksınız'

onyx.lang:AddPhrases( 'turkish', LANG )
--PATH addons/____onyx_hud/lua/onyx/modules/hud/core/cl_settings.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

14/08/2024

--]]

local L = function( ... ) return onyx.lang:Get( ... ) end

local COLOR_PRIMARY = onyx:Config( 'colors.primary' )
local COLOR_SECONDARY = onyx:Config( 'colors.secondary' )
local COLOR_BG = onyx.LerpColor( .1, COLOR_PRIMARY, color_black )

function onyx.hud.OpenSettings()
    local padding = onyx.ScaleTall( 15 )
    local conPadding = onyx.ScaleTall( 10 )

    RunConsoleCommand( 'cl_onyx_hud_show_help', 0 )
    
    local frame = vgui.Create( 'onyx.Frame' )
    frame:SetSize( ScrW() * .5, ScrH() * .65 )
    frame:Center()
    frame:MakePopup()
    frame:SetTitle( 'ONYX HUD' )

    local content = frame:Add( 'Panel' )
    content:DockPadding( padding, padding, padding, padding )
    content:Dock( FILL )

    local navbar = content:Add( 'onyx.Navbar' )
    navbar:SetTall( onyx.ScaleTall( 30 ) )
    navbar:Dock( TOP )
    navbar.Paint = function(panel, w, h)
        draw.RoundedBoxEx( 8, 0, 0, w, h, COLOR_SECONDARY, true, true )
    end

    local container = content:Add( 'Panel' )
    container:Dock( FILL )
    container:DockPadding( conPadding, conPadding, conPadding, conPadding )
    container.Paint = function( panel, w, h )
        draw.RoundedBoxEx( 8, 0, 0, w, h, COLOR_SECONDARY, false, false, true, true )
        draw.RoundedBoxEx( 8, 1, 1, w - 2, h - 2, COLOR_BG, false, false, true, true )
    end

    navbar:SetContainer( container )

    CAMI.PlayerHasAccess( LocalPlayer(), 'onyx_hud_edit', function( bHasAccess )
        if ( IsValid( frame ) ) then
            local tabsAmount = bHasAccess and 2 or 1
            local tabWidth = ( frame:GetWide() - padding * 2 ) / tabsAmount

            navbar:AddTab({
                name = L( 'settings_u' ),
                class = 'onyx.hud.ClientSettings',
                icon = 'https://i.imgur.com/41kCW0x.png'
            }):SetWide( tabWidth )
        
            if ( bHasAccess ) then
                navbar:AddTab({
                    name = L( 'configuration_u' ),
                    icon = 'https://i.imgur.com/Wg3syNS.png',
                    class = 'onyx.Configuration',
                    onBuild = function( panel )
                        panel:LoadAddonSettings( 'hud' )
                        panel:OpenCategories()
                    end
                }):SetWide( tabWidth )
            end

            navbar:ChooseTab( 1 )
            navbar:SetVisible( bHasAccess )
        end
    end )

    return frame
end

concommand.Add( 'onyx_hud', function() onyx.hud.OpenSettings() end )
--PATH addons/____onyx_hud/lua/onyx/modules/hud/elements/cl_alerts.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

17/08/2024

--]]

local DURATION = 5

local hud = onyx.hud
local alerts = {}

local function addAlert( text )
    local useQueue = hud:GetOptionValue( 'alert_queue' )
    local data = {
        title = onyx.utf8.upper( onyx.lang:Get( 'message' ) ),
        text = text,
        duration = DURATION
    }

    if ( useQueue ) then
        table.insert( alerts, data )
    else
        alerts[ 1 ] = data
    end
end

local function drawAlerts( element, client, scrW, scrH )
    local alert = alerts[ 1 ]

    if ( not alert ) then return end
    if ( not alert.endtime ) then alert.endtime = CurTime() + alert.duration end

    local maxW = hud.ScaleWide( 500 )
    local font = hud.fonts.Small
    local roundness = hud.GetRoundness()
    local colorPrimary = hud:GetColor( 'primary' )
    local colorText = hud:GetColor( 'textPrimary' )
    local colorTitle = hud:GetColor( 'textSecondary' )
    local colorAccent = hud:GetColor( 'accent' )
    local alertSpace = hud.ScaleTall( 5 )
    local baseY = ScrH() * .25
    local posY = baseY

    if ( not alert.wrapText ) then
        alert.wrapText = surface.textWrap( alert.text, font, maxW )
    end
    
    local text = alert.wrapText
    local title = alert.title

    surface.SetFont( font )
    local textW, textH = surface.GetTextSize( text )
    local titleH = hud.ScaleTall( 20 )

    local padding = hud.ScaleTall( 10 )
    local x0, y0 = scrW * .5, scrH * .5
    local w = textW + padding * 2
    local h = textH + titleH + padding * 2
    local x = x0 - w * .5
    local y = posY
    local lineH = hud.ScaleTall( 3 )
    local timeLeft = math.max( 0, ( alert.endtime - CurTime() ) )
    local lifeFraction = timeLeft / alert.duration
    local isExpired = lifeFraction <= 0
    
    alert.alpha = Lerp( FrameTime() * 8, alert.alpha or 0, isExpired and 0 or 1 )

    surface.SetAlphaMultiplier( alert.alpha )

        hud.DrawRoundedBox( x, y, w, h, colorPrimary )

        render.SetScissorRect( x, y + h - lineH, x + w, y + h, true )
            hud.DrawRoundedBox( x, y, w, h, onyx.LerpColor( .75, colorAccent, colorPrimary ) )
        render.SetScissorRect( x, y + h - lineH, x + w * lifeFraction, y + h, true )
            hud.DrawRoundedBox( x, y, w, h, colorAccent )
        render.SetScissorRect( 0, 0, 0, 0, false )

        draw.SimpleText( title, hud.fonts.TinyBold, x0, y + padding, colorTitle, 1 )

        draw.DrawText( text, font, x0, y + padding + titleH, colorText, 1 )

    surface.SetAlphaMultiplier( 1 )
    
    if ( isExpired and math.Round( alert.alpha, 1 ) == 0 ) then
        table.remove( alerts, 1 )
    end
end

net.Receive( 'onyx.hud::SendAlert', function()
    if ( onyx.hud.IsElementEnabled( 'alerts' ) ) then
        addAlert( net.ReadString() )
    end
end )

hook.Add( 'onyx.inconfig.Updated', 'onyx.hud.ClearAlerts', function( id, old, new )
    if ( id and id == 'hud_display_alerts' ) then
        alerts = {}
    end
end )

onyx.hud:RegisterElement( 'alerts', { drawFn = drawAlerts } )
--PATH addons/____onyx_hud/lua/onyx/modules/hud/elements/cl_door_info.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

16/08/2024

--]]

local RANGE = 400
local FONT_NAME = onyx.hud.CreateFont3D2D( 'DoorName', 'Comfortaa SemiBold', 70 )
local FONT_SMALL_NAME = onyx.hud.CreateFont3D2D( 'DoorSmallName', 'Comfortaa SemiBold', 50 )
local FONT_HELP = onyx.hud.CreateFont3D2D( 'DoorHelp', 'Comfortaa', 32 )
local COLOR_GRAY = Color( 200, 200, 200 )
local COLOR_GREEN = Color( 147, 255, 108)
local COLOR_RED = Color( 255, 87, 87)
local L = function( ... ) return onyx.lang:Get( ... ) end

local nearest = {}
local traceOut = {}
local traceIn = { output = traceOut, mask = MASK_SHOT }

local bindKey = ''

-- To get a nice string containing players' name from DarkRP
local function getPlayersStr( players, maxNames )
    local maxNames = maxNames or 2
    local result = {}
    local added = 0
    local limitExceeded = false

    for playerIndex in pairs( players ) do
        local ply = Player( playerIndex )
        if ( IsValid( ply ) ) then
            added = added + 1
            if ( added > maxNames ) then
                limitExceeded = true
                break
            end

            result[ added ] = ply:Name()
        end
    end

    local finalStr = table.concat( result, ', ' )

    if ( limitExceeded ) then
        finalStr = finalStr .. ', ...'
    end

    return finalStr 
end

local function drawInfo( ent, client )
    local screenPos = ent:LocalToWorld( ent:OBBCenter() ) + Vector( 0, 0, 16 )
    
    -- I wish I could put this in a timer, but it would look bad when the door is moving
    traceIn.start = client:GetShootPos()
    traceIn.endpos = screenPos
    traceIn.filter = client
    util.TraceLine( traceIn )

    if ( traceOut.Entity ~= ent ) then return end

    local hitPos = traceOut.HitPos
    local hitNormal = traceOut.HitNormal
    local length = ( hitPos - screenPos ):Length2D()

    if ( length > 6 ) then return end

    local renderPos = hitPos + hitNormal
    local renderAng = hitNormal:Angle() + Angle( 0, 90, 90 )

    local doorGroup = ent:DoorGetGroup()
    local doorCoowners = ent:DoorGetCoOwners() or {}
    local doorPrice = client:Wealth(rp.Setting.DoorCostMin, rp.Setting.DoorCostMax)
    local playerOwned = ent:DoorGetOwner() or table.GetFirstValue( doorCoowners ) ~= nil
    local isOwned = playerOwned or doorGroup

    local title = ''
    local subtitle = ''
    local color = color_white
    local titleFont = FONT_NAME

    if ( isOwned ) then
        local doorOwner = ent:DoorGetOwner()
        local ownedByClient = playerOwned and ( doorOwner == client or table.HasValue(doorCoowners, client) )
    
        title = ent:DoorGetTitle()

        if ( not title ) then
            if ( playerOwned ) then
                title = L( 'door_owned' )
                color = ownedByClient and COLOR_GREEN or COLOR_RED
            else
                if ( doorGroup ) then
                    title = doorGroup
                    titleFont = FONT_SMALL_NAME
                else
                    title = L( 'door_owned' )
                end
            end
        elseif ( not playerOwned ) then
            if ( doorGroup ) then
                subtitle = doorGroup
            end
        end

        if ( playerOwned ) then
            subtitle = L( 'hud_door_owner', { name = IsValid( doorOwner ) and doorOwner:Name() or '' } )

            if ( not table.IsEmpty( doorCoowners ) ) then
                subtitle = subtitle .. Format( '\n%s: %s', L( 'hud_door_coowners' ), getPlayersStr( doorCoowners ) )
            end
        end
    else
        title = L( 'door_unowned' )
        subtitle = L( 'hud_door_help', { bind = bindKey, price = rp.FormatMoney( doorPrice ) } )
    end

    cam.Start3D2D( renderPos, renderAng, .085 )

        onyx.hud.DrawShadowText( title, titleFont, 0, 0, color, 1, 0 )
        draw.DrawText( subtitle, FONT_HELP .. '.Blur', 2, 60 + 2, color_black, 1 )
        draw.DrawText( subtitle, FONT_HELP, 0, 60, COLOR_GRAY, 1 )

    cam.End3D2D()
end

do
    local DOORS = {
        [ 'prop_door_rotating' ] = true,
        [ 'func_door_rotating' ] = true,
        [ 'func_door' ] = true,
    }
    timer.Create( 'onyx.hud.CatchNearestDoors', 1 / 5, 0, function()
        local client = LocalPlayer()
        if ( IsValid( client ) ) then
            local entities = ents.FindInCone( client:GetShootPos(), client:GetAimVector(), RANGE, math.cos( math.rad( 45 ) ) )
    
            nearest = {}
            bindKey = input.LookupBinding( 'gm_showteam' ) or ''
    
            for _, ent in ipairs( entities ) do
                if ( IsValid( ent ) and ent:IsDoor() and sam.player.get_nwvar(ent, 'DoorData') ~= false and DOORS[ ent:GetClass() ] and not ent:GetNoDraw() ) then
                    table.insert( nearest, ent )
                end
            end
        end
    end )
end

hook.Add( 'PostDrawTranslucentRenderables', 'onyx.hud.DrawDoors', function()
    local client = LocalPlayer()
    for _, ent in ipairs( nearest ) do
        if ( IsValid( ent ) ) then
            drawInfo( ent, client )
        end
    end
end )
--PATH addons/____onyx_hud/lua/onyx/modules/hud/elements/cl_notifications.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

11/08/2024

--]]

local hud = onyx.hud
local cache = {}

local COLOR_BAR = Color( 0, 0, 0, 200 ) -- Only for light themes
local FONT_TEXT = 'onyx.hud.Small'
local NOTIFICATION_TYPES = {
    [ NOTIFY_GENERIC ] = {
        color = Color( 255, 228, 52),
        wimg = onyx.wimg.Simple( 'https://i.imgur.com/2muiD5k.png', 'smooth mips' )
    },
    [ NOTIFY_ERROR ] = {
        color = Color( 235, 57, 57),
        wimg = onyx.wimg.Simple( 'https://i.imgur.com/vNzFBlK.png', 'smooth mips' )
    },
    [ NOTIFY_UNDO ] = {
        color = Color( 69, 78, 255),
        wimg = onyx.wimg.Simple( 'https://i.imgur.com/sgLeDjb.png', 'smooth mips' )
    },
    [ NOTIFY_HINT ] = {
        color = Color( 37, 222, 225),
        wimg = onyx.wimg.Simple( 'https://i.imgur.com/vAjbKzK.png', 'smooth mips' )
    },
    [ NOTIFY_CLEANUP ] = {
        color = Color( 235, 81, 255),
        wimg = onyx.wimg.Simple( 'https://i.imgur.com/V3TyKJ9.png', 'smooth mips' )
    },
}

local function addNotification( text, type, length )
    table.insert( cache, 1, {
        text = text,
        type = type,
        endtime = CurTime() + length,
        duration = length
    } )
end

local function overrideNotifications()
    hud.original_AddLegacy = hud.original_AddLegacy or notification.AddLegacy

    function notification.AddLegacy( text, type, length )
        local text = tostring( text )
        local type = type or NOTIFY_GENERIC
        local length = length or 3
        local isEnabled = onyx.hud.IsElementEnabled( 'notifications' )
        
        if ( isEnabled ) then
            addNotification( text:Trim():gsub('\n', ' '), type, length )
        else
            hud.original_AddLegacy( text, type, length )
        end
    end
end
onyx.hud.OverrideGamemode( 'onyx.hud.OverrideNotifications', overrideNotifications )

local function drawNotifications( self, client, scrW, scrH )
    local theme = hud:GetCurrentTheme()
    local colorPrimary = theme.colors.primary
    local colorSecondary = theme.colors.secondary
    local colorTertiary = theme.colors.tertiary
    local colorText = theme.colors.textPrimary
    local isDark = theme.dark

    local space = onyx.hud.GetScreenPadding()
    local horPadding = onyx.hud.ScaleTall( 10 )
    local notifH = onyx.hud.ScaleTall( 30 )
    local hudRoundness = onyx.hud.GetRoundness()
    local notifSpace = onyx.hud.ScaleTall( 5 )
    local iconSpace = onyx.hud.ScaleTall( 10 )
    local iconSize = onyx.hud.ScaleTall( 18 )
    local lineH = onyx.hud.ScaleTall( 2 )

    local amount = #cache
    local posY = scrH * .75
    local speed = FrameTime() * 8

    -- to avoid overlapping
    if ( #onyx.hud.VoicePanels > 0 ) then
        for _, data in ipairs( onyx.hud.VoicePanels ) do
            local panel = data.panel
            if ( IsValid( panel ) and panel:IsVisible() ) then
                posY = math.min( posY, select( 2, panel:GetPos() ) )
            end
        end
        posY = posY - notifSpace
    end
    
    posY = posY - notifH

    for index = 1, amount do
        local data = cache[ index ]
        if ( not data ) then continue end

        local notifText = data.text
        local notifType = data.type or 0
        local notifTypeData = NOTIFICATION_TYPES[ notifType ] or NOTIFICATION_TYPES[ NOTIFY_GENERIC ]
        local notifColor = notifTypeData.color
        local timeLeft = math.max( 0, data.endtime - CurTime() )
        local lifeFraction = timeLeft / data.duration
        local expired = lifeFraction == 0
        local targetFraction = expired and 0 or 1
        local wimgObject = notifTypeData.wimg

        -- Get size
        surface.SetFont( FONT_TEXT )
        local textW, textH = surface.GetTextSize( notifText )
        local notifW = textW + horPadding * 2 + iconSize + iconSpace

        -- Calculate pos
        local posX = expired and scrW or ( scrW - notifW - space )

        data.x = Lerp( speed, data.x or scrW, posX )
        data.y = Lerp( speed, data.y or posY, posY )
        data.fraction = math.Approach( data.fraction or 0, targetFraction, speed )

        local x = data.x
        local y = math.ceil( data.y )

        -- Draw
        local prevAlpha = surface.GetAlphaMultiplier()
        local lineColor = isDark and ColorAlpha( notifColor, 20 ) or COLOR_BAR

        surface.SetAlphaMultiplier( data.fraction )

            onyx.hud.DrawRoundedBox( x, y, notifW, notifH, colorPrimary )

            wimgObject:Draw( x + horPadding, y + notifH * .5 - iconSize * .5, iconSize, iconSize, notifColor )

            render.SetScissorRect( x, y + notifH - lineH, x + notifW, y + notifH, true )
                onyx.hud.DrawRoundedBox( x, y, notifW, notifH, lineColor )
            render.SetScissorRect( x, y + notifH - lineH, x + notifW * lifeFraction, y + notifH, true )
                onyx.hud.DrawRoundedBox( x, y, notifW, notifH, notifColor )
            render.SetScissorRect( 0, 0, 0, 0, false )

            onyx.hud.DrawCheapText( notifText, FONT_TEXT, x + horPadding + iconSize + iconSpace, y + notifH * .5 - textH * .5, colorText )

        surface.SetAlphaMultiplier( prevAlpha )

        posY = posY - notifH - notifSpace

        if ( expired and data.fraction == 0 ) then
            table.remove( cache, index )
        end
    end
end

onyx.hud:RegisterElement( 'notifications', {
    priority = 90,
    drawFn = drawNotifications,
    hideElements = {}
} )

concommand.Add( 'onyx_hud_test_notifications', function( ply )
    if ( ply:IsAdmin() ) then
        local index = 0
        for type in pairs( NOTIFICATION_TYPES ) do
            index = index + 1
            notification.AddLegacy( 'Onyx HUD Notification', type, 10 - index )
        end
    end
end )
--PATH addons/____onyx_scoreboard/lua/onyx/modules/scoreboard/ui/cl_frame.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

28/02/2024

--]]

local COLOR_PRIMARY = onyx:Config('colors.primary')
local COLOR_SECONDARY = onyx:Config('colors.secondary')
local COLOR_TERTIARY = onyx:Config('colors.tertiary')
local COLOR_ACCENT = onyx:Config('colors.accent')
local COLOR_GRAY = Color(149, 149, 149)

--[[------------------------------
// ANCHOR Frame
--------------------------------]]
local PANEL = {}

function PANEL:Init()
    self:SetTitle(onyx.utf8.upper(onyx.scoreboard:GetOptionValue('title')))

    self.blur = onyx.scoreboard.IsBlurActive()

    self.container = self:Add('onyx.Panel')

    self.sidebar = self:Add('onyx.MiniSidebar')
    self.sidebar:SetContainer(self.container)
    self.sidebar:SetWide(onyx.ScaleTall(45)) -- it's important to set width at this point

    self.sidebar:AddTab({
        name = '<PLAYERS>',
        desc = '',
        icon = 'https://i.imgur.com/1dE2q2H.png',
        class = 'onyx.Scoreboard.PlayerList'
    })

    CAMI.PlayerHasAccess(LocalPlayer(), 'onyx_scoreboard_edit', function(bAllowed)
        if (bAllowed) then
            self.sidebar:AddTab({
                name = '<ADMIN>',
                desc = '',
                icon = 'https://i.imgur.com/l4M12dO.png',
                onClick = function()
                    onyx.scoreboard.OpenAdminSettings()
                    self:Remove()
                    return false
                end
            })
        end
    end)

    self.sidebar:ChooseTab(1)
end

function PANEL:PerformLayout(w, h)
    local margin = onyx.ScaleTall(10)

    self.BaseClass.PerformLayout(self, w, h)

    self.container:Dock(FILL)
    self.container:DockMargin(margin, margin, margin, margin)

    self.sidebar:Dock(LEFT)
end

function PANEL:Paint(w, h)
    if (self.blur) then
        onyx.DrawBlurExpensive(self, 9)
        draw.RoundedBox(8, 0, 0, w, h, ColorAlpha(onyx.ColorBetween(COLOR_PRIMARY, color_black), 230))
    else
        self.BaseClass.Paint(self, w, h)
    end
end

function PANEL:Think()
    if (self.closeDisabled) then
        local bindButtonName = input.LookupBinding('+showscores', true)
        local bindButtonInt = bindButtonName and input.GetKeyCode(bindButtonName)
        if (not bindButtonInt) then return end

        local newState = input.IsKeyDown(bindButtonInt)
        if (self.oldState == nil) then
            self.oldState = newState
        elseif (self.oldState ~= newState) then
            if (newState) then
                self:Remove()
            end
            self.oldState = newState
        end
    end
end

onyx.gui.Register('onyx.Scoreboard.Frame', PANEL, 'onyx.Frame')

--[[------------------------------
// ANCHOR Debug
--------------------------------]]
-- onyx.gui.Test('onyx.Scoreboard.Frame', .6, .6, function(self)
--     onyx.scoreboard.Frame = self
--     self:Center()
--     self:MakePopup()
-- end)
--PATH addons/____onyx_scoreboard/lua/onyx/modules/scoreboard/ui/cl_player.lua:
--[[

Author: tochnonement
Email: tochnonement@gmail.com

28/02/2024

--]]

local COLOR_PRIMARY = onyx:Config('colors.primary')
local COLOR_SECONDARY = onyx:Config('colors.secondary')
local COLOR_TERTIARY = onyx:Config('colors.tertiary')
local COLOR_HOVERED = onyx.ColorBetween(COLOR_PRIMARY, COLOR_SECONDARY)

local COLOR_HIGH_PING = Color(196, 0, 0)
local COLOR_LOW_PING = Color(98, 255, 108)
local COLOR_PING_BG = onyx.OffsetColor(COLOR_PRIMARY, -10)

-- local COLOR_MUTED = Color(195, 147, 147)
-- local COLOR_SHADOW = Color(0, 0, 0, 100)

local WIMG_PING = onyx.wimg.Simple('https://i.imgur.com/z9OfU9m.png', 'smooth mips')
-- local WIMG_MIC_COMMON = onyx.wimg.Simple('https://i.imgur.com/WOBOLh8.png', 'smooth mips')
-- local WIMG_MIC_MUTE = onyx.wimg.Simple('https://i.imgur.com/eSYvIFa.png', 'smooth mips')

local SHADOW_DISTANCE = 2

local drawPlayerName do
    local fontCommon = onyx.Font('Comfortaa SemiBold@16') -- the size got dynamically changed
    local fontGlow = onyx.Font('Comfortaa SemiBold@16', 'blursize:2') -- the size got dynamically changed

    local draw_SimpleText = draw.SimpleText

    function drawPlayerName(text, x, y, rankData, ax, ay, realX, realY)
        local color = istable(rankData) and rankData.color or color_white
        local effectIndex = istable(rankData) and rankData.effect or 1
        local effectData = onyx.scoreboard.nameEffects[effectIndex] or onyx.scoreboard.nameEffects[1]
        local effectDrawFn = effectData.func

        -- common
        effectDrawFn(text, x, y, color, ax, ay, realX + x, realY + y)
    end
end

--[[------------------------------
PANEL
--------------------------------]]
local PANEL = {}

AccessorFunc(PANEL, 'm_ePlayer', 'Player')

function PANEL:Init()
    local font = onyx.Font('Comfortaa SemiBold@16')
    local fontPing = onyx.Font('Comfortaa@14')

    surface.SetFont(fontPing)
    local _, fontCharH = surface.GetTextSize( '5' )

    self.lineThickness = 1
    self.colorOutline = COLOR_TERTIARY
    self.blur = onyx.scoreboard.IsBlurActive()

    self.avatar = self:Add('onyx.RoundedAvatar')
    self.avatar:SetMouseInputEnabled(false)
    self.avatar.PaintOver = function(panel, w, h)
        onyx.DrawOutlinedCircle(w * .5, h * .5, math.Round(h * .5), 5, panel.color or color_white)
    end

    self.lblName = self:Add('Panel')
    self.lblName:SetMouseInputEnabled(false)
    AccessorFunc(self.lblName, 'Text', 'Text')
    self.lblName.Paint = function(panel, w, h)
        drawPlayerName(panel.Text, 0, h * .5, self.rankData, 0, 1, panel:LocalToScreen(0, 0))
    end

    -- self.buttonMute = self:AddMuteButton()

    self.pingIcon = self:Add('Panel')
    self.pingIcon.count = 4
    self.pingIcon.labelAlpha = 0
    self.pingIcon.Paint = function(panel, w, h)
        local maxLines = 4
        local curLines = math.min(maxLines, panel.count)
        local fraction = (curLines / maxLines)
        local scissorWidth = w * fraction -- the image has perfect element distance
        local color = onyx.LerpColor(1 - fraction, COLOR_LOW_PING, COLOR_HIGH_PING)
        local x, y = panel:LocalToScreen(0, 0)
        local isHovered = panel:IsHovered() and ( CurTime() - ( panel.hoverStartTime or 0 ) > .33 )

        self.pingIcon.labelAlpha = math.Approach( self.pingIcon.labelAlpha, isHovered and 1 or 0, FrameTime() * 4 )

        local labelAlpha = self.pingIcon.labelAlpha

        WIMG_PING:Draw(0, 0, w, h, COLOR_PING_BG)

        render.SetScissorRect(x, y, x + scissorWidth, y + h, true)
            WIMG_PING:Draw(0, 0, w, h, color)
        render.SetScissorRect(0, 0, 0, 0, false)

        if (labelAlpha > 0) then
            local labelH = fontCharH
            local labelW = onyx.ScaleWide(50)
            local labelY = -labelH
            local labelX = w * .5 - labelW * .5
            local prev = surface.GetAlphaMultiplier()

            surface.SetAlphaMultiplier(math.min(prev, labelAlpha))
    
            if (labelAlpha > .1) then
                onyx.bshadows.BeginShadow()
                    draw.RoundedBox(8, x + labelX, y + labelY, labelW, labelH, COLOR_PRIMARY)
                onyx.bshadows.EndShadow(labelAlpha, 1, 1)
            else
                draw.RoundedBox(8, labelX, labelY, labelW, labelH, COLOR_PRIMARY)
            end

            DisableClipping(true)
                draw.SimpleText((panel.ping or 0) .. 'ms', fontPing, labelX + labelW * .5, labelY, color, 1, 0)
            DisableClipping(false)
    
            surface.SetAlphaMultiplier(prev)
        end
    end
    self.pingIcon.OnCursorEntered = function(panel)
        panel.hoverStartTime = CurTime()
    end

    self.content = self:Add('onyx.Scoreboard.ColumnsRow')
    self.content:SetMouseInputEnabled(false)
    self.content:Dock(FILL)
    self.content:InitColumns()
end

function PANEL:GetPingLineCount(playerPing)
    -- calculations on how many lines

    local goodPing = 95
    local step = 50
    local maxLines = 4

    for index = 0, (maxLines - 1) do
        local lineCount = maxLines - index
        local iterPing = goodPing + (index * step)
        if (playerPing < iterPing) then
            return lineCount
        end
    end

    return 1
end

function PANEL:AddMuteButton(url)
    -- muted: https://i.imgur.com/eSYvIFa.png

    local button = self:Add('onyx.ImageButton')
    button.DoClick = function(panel)
        local ply = self:GetPlayer()
        if (IsValid(ply)) then
            ply:SetMuted(not ply:IsMuted())
            panel:Update()
        end
    end
    button.Update = function(panel)
        local ply = self:GetPlayer()
        if (IsValid(ply)) then
            local state = ply:IsMuted()
            panel:SetColor(state and COLOR_MUTED or color_white)
            panel.m_WebImage = (state and WIMG_MIC_MUTE or WIMG_MIC_COMMON)
        end
    end

    return button
end

function PANEL:Paint(w, h)
    local lineThickness = self.lineThickness
    local category = self.category
    local isExpanded = category:GetExpanded()
    local rounded = category.canvas:GetTall() < 1
    local isHovered = self:IsHovered()
    local color = isHovered and COLOR_HOVERED or COLOR_PRIMARY

    if (self.blur) then
        draw.RoundedBoxEx(8, 0, 0, w, h, ColorAlpha(color, 230), true, true, rounded, rounded)
    else
        draw.RoundedBoxEx(8, 0, 0, w, h, self.colorOutline, true, true, rounded, rounded)
        draw.RoundedBoxEx(8, lineThickness, lineThickness, w - lineThickness * 2, h - lineThickness * 2, color, true, true, rounded, rounded)
    end

    local mask = rounded and self.maskAllRounded or self.maskExpanded
    if (mask) then
        onyx.DrawWithPolyMask(mask, function()
            onyx.DrawMatGradient(0, 0, w, h, TOP, self.colorGradient)
        end)
    end
end

function PANEL:PerformLayout(w, h)
    local padding = self.padding
    local height = h - padding * 2
    local paddingX = self.paddingX + 1 -- this got set in cl_frame.lua
    local firstElementWidth = self.firstElementWidth
    local avatarMargin = onyx.ScaleTall(5)
    local lineThickness = self.lineThickness

    self:DockPadding(paddingX, padding, paddingX, padding)

    self.avatar:Dock(LEFT)
    self.avatar:SetWide(height)
    self.avatar:DockMargin(0, 0, avatarMargin, 0)

    self.lblName:Dock(LEFT)
    self.lblName:SetWide(firstElementWidth - height - avatarMargin)
    self.lblName:DockMargin(0, 0, self.paddingX, 0)

    -- self.buttonMute:SetWide(height)
    -- self.buttonMute:Dock(RIGHT)
    -- self.buttonMute:DockMargin(self.paddingX, 0, 0, 0)

    self.pingIcon:SetWide(height)
    self.pingIcon:Dock(RIGHT)
    self.pingIcon:DockMargin(self.paddingX, 0, 0, 0)

    if (onyx.scoreboard:GetOptionValue('colored_players') or onyx.scoreboard.IsTTT()) then
        self.maskAllRounded = onyx.CalculateRoundedBox(8, lineThickness, lineThickness, w - lineThickness * 2, h - lineThickness * 2)
        self.maskExpanded = onyx.CalculateRoundedBoxEx(8, lineThickness, lineThickness, w - lineThickness * 2, h - lineThickness * 2, true, false, false, true)
    end
end

function PANEL:SetupPlayer(ply)
    local teamColor = ply:GetJobColor()
    if ply:onyx_GetNetVar('Disguise_G') then
        teamColor = sam.player.get_nwvar(ply, 'Job_Color') or color_white
    end

    if (onyx.scoreboard.IsTTT()) then
        teamColor = onyx.scoreboard.GetRoleColorTTT(ply)
    end

    local convertedColor = onyx.scoreboard.ConvertTeamColor(teamColor)
    local usergroup = ply:GetUserGroup()

    self:SetPlayer(ply)

    self.colorGradient = ColorAlpha(onyx.LerpColor(.5, teamColor, color_black), 40) -- lerp makes gradients look better
    self.rankData = onyx.scoreboard:GetRankData(usergroup)

    self.avatar.color = convertedColor
    self.avatar:SetPlayer(ply, 64)

    self.lblName:SetText(ply:Name())

    -- self.buttonMute:Update()

    self:UpdateColumnValues(self.rankData)
end

function PANEL:UpdateColumnValues()
    local ply = self:GetPlayer()
    if (not IsValid(ply)) then return end

    for index, data in ipairs(onyx.scoreboard:GetActiveColumns()) do
        local value = data.getValue(ply)
        local formatted = data.formatValue and data.formatValue(value) or value

        self.content:SetValue(index, formatted, value)

        if (data.getColor) then
            self.content:SetColor(index, data.getColor(ply))
        end

        if (data.buildFunc) then
            data.buildFunc(self.content.columns[index], ply)
        end
    end
end

function PANEL:Think()
    if ( ( self.nextPingUpdate or 0 ) > CurTime() ) then return end
    self.nextPingUpdate = CurTime() + .5
    
    local ply = self:GetPlayer()
    if (IsValid(ply)) then
        self.pingIcon.ping = ply:Ping()
        self.pingIcon.count = self:GetPingLineCount(self.pingIcon.ping)
    end
end

onyx.gui.Register('onyx.Scoreboard.PlayerLine', PANEL)

--[[------------------------------
// ANCHOR Debug
--------------------------------]]
-- onyx.gui.Test('onyx.Scoreboard.Frame', .66, .66, function(self)
--     self:Center()
--     self:MakePopup()
-- end)
--PATH addons/_outfitter/lua/includes/modules/hookextras.lua:
if SERVER then
	AddCSLuaFile()
end


local functions = { }
local added = false
local function Stop()
	hook.Remove("Think", "NextThinkHelper")
end

local function error_func(line)
	ErrorNoHalt("NextThink: "..debug.traceback(line,2))
end

local function Think()
	local n = #functions
	if n == 0 then
		Stop()
		return
	end

	for i = 1, n do
		local func = table.remove(functions, 1)
		xpcall(func,error_func)
	end

end

local function Start()
	if added then
		return
	end

	hook.Add("Think", "NextThinkHelper", Think)
end

function RunNextThink(func)
	if not isfunction(func) then
		error("Expected function", 2)
	end

	functions[#functions + 1] = func
	Start()
end

NextThink = RunNextThink
util.NextThink = NextThink
util.NextFrame = NextThink

do
	-- OnInitialize

	local functions = { }
	local initialized = false

	local function error_func(line)
		ErrorNoHalt("OnInitialize: " .. debug.traceback(line, 2))
	end

	local function Initialize()
		if initialized then return end
		initialized = true
		-- HACK: Make sure RunOnInit works even inside RunOnInit
		local overflow = true
	
		for i = 1, #functions + 262140 do
			local func = functions[i]
	
			if not func then
				overflow = false
				break
			end
	
			xpcall(func, error_func)
		end
	
		if overflow then
			ErrorNoHalt("[WARN] RunOnInit hook list overflowed? ", #functions, "\n")
		end
	
		functions = nil
		hook.Remove("Initialize", "RunOnInitializeHelper")
	end


	function RunOnInit(func)
		if not isfunction(func) then
			error("Expected function", 2)
		end

		if not functions then
			timer.Simple(0,func)
			return
		end

		functions[#functions + 1] = func
	end
	RunOnInitialize = RunOnInit
	OnInitialize = RunOnInit
	util.OnInitialize = RunOnInit

	hook.Add("Initialize", "RunOnInitializeHelper", Initialize)
	hook.Add("InitPostEntity", "RunOnInitializeHelper", function()
		if initialized then return end
		ErrorNoHalt("[WARN] 'Initialize' hook 'RunOnInitializeHelper' did not run! (bugs in other addons? Possibly adding Initialize hooks while in Initialize hook?)\n")
		Initialize()
	end)
end

if CLIENT then

	-- OnLocalPlayer

	local functions = { }
	local initialized = false

	local function error_func(line)
		ErrorNoHalt("OnLocalPlayer: " .. debug.traceback(line, 2))
	end

	local function OnEntityCreated(ent)

		local me = LocalPlayer()
		if ent~=me then return end
		assert(not initialized)
		initialized = true
		
		for i = 1, #functions do
			local func = functions[i]
			xpcall(func, error_func, me)
		end

		functions = nil
		hook.Remove("OnEntityCreated", "OnLocalPlayer")
		hook.Remove("NetworkEntityCreated", "OnLocalPlayer")
	end


	local function util_OnLocalPlayer(func)
		if not isfunction(func) then
			error("Expected function", 2)
		end
		
		if not functions then
			timer.Simple(0,function() func(LocalPlayer()) end)
			return
		end
		
		functions[#functions + 1] = func
	end

	util.OnLocalPlayer = util_OnLocalPlayer
	if IsValid(LocalPlayer()) then
		OnEntityCreated(LocalPlayer()) 
	else
		hook.Add("OnEntityCreated", "OnLocalPlayer", OnEntityCreated)
		hook.Add("NetworkEntityCreated", "OnLocalPlayer", OnEntityCreated)
		
		timer.Simple(1, function()
			if LocalPlayer():IsValid() and not initialized then
				error_func"OnEntityCreated did not catch LocalPlayer??"
				OnEntityCreated(LocalPlayer())
			end
		end)
	end
	
end

--PATH addons/_outfitter/lua/includes/modules/mdlinspect.lua:
local Tag='mdlinspect'

module(Tag,package.seeall)

local function from_int(s,...)
	local size = 4
	local n = from_u_int(s,...)
	if n >= 2^(size*8-1) then
		return n - 2^(size*8)
	end
	return n
end


-- Format: https:--developer.valvesoftware.com/wiki/MDL#File_format
local vstruct
local needvstruct needvstruct = function()
	vstruct = vstruct or _G.vstruct
	if not vstruct then
		local ok,ret = pcall(require,'vstruct')
		if ok then vstruct=ret or _G.vstruct end
	end
	
	needvstruct=function() return vstruct end
	
	return vstruct
end

MAX_FORMAT = 49
local MDL = {}
local _M = {__index = MDL,__tostring=function(self) return "MDL Parser" end}
function Open(f)
	if isstring(f) then
		f = file.Open(f,'rb','GAME')
	end
	
	if not f then error"invalid file" end
	
	local initial_offset = f:Tell()
	
	local hdr = f:Read(4)
	if hdr~='IDST' then
		return nil,"notmdl"
	end
	
	local version = from_int(f:Read(4),true)
	
	if version>MAX_FORMAT then
		return nil,'newformat',version
	end
	
	local T = {
		file = f,
		version = version,
		initial_offset=initial_offset
	}
	
	return setmetatable(T,_M)
	
end

function MDL:IsValid()
	return self.file and true or false
end

function MDL:GetFile()
	return self.file
end

function MDL:Close()
	local f = self.file
	f:Close()
	self.file = false
end

function MDL:_ParseFail(reason)
	self.parsed_header = false
	self.parse_error = reason or "?"
	self.error = "Parsing failed: "..tostring(reason)
	return nil,reason
end

function MDL:GetError()
	return self.error
end

function MDL:HasFlag(f)
	local bit=ubit or bit
	return bit.band(self.flags,f)==f
end



local flaglist={
[0]="AUTOGENERATED_HITBOX",
"USES_ENV_CUBEMAP",
"FORCE_OPAQUE",
"TRANSLUCENT_TWOPASS",
"STATIC_PROP",
"USES_FB_TEXTURE",
"HASSHADOWLOD",
"USES_BUMPMAPPING",
"USE_SHADOWLOD_MATERIALS",
"OBSOLETE",
"UNUSED",
"NO_FORCED_FADE",
"FORCE_PHONEME_CROSSFADE",
"CONSTANT_DIRECTIONAL_LIGHT_DOT",
"FLEXES_CONVERTED",
"BUILT_IN_PREVIEW_MODE",
"AMBIENT_BOOST",
"DO_NOT_CAST_SHADOWS",
"CAST_TEXTURE_SHADOWS",
}

function MDL:ListFlags()
	local t = {}
	for i=0,#flaglist do
		if self:HasFlag(2^i) then
			t[flaglist[i]] = true
		end
	end
	return t
end

function MDL:Validate(filesize)
	local size = self.dataLength
	
	local f=self.file
	--TODO: can be wrong
	local fsize = filesize or (f:Size()-self.initial_offset)
	

	if fsize ~=size then
		return nil,"size"
	end
	
	--local checksum = from_int(self.checksum,true)
	--local crc = util.CRC(dat)
	--dat = nil
	--
	--if tostring(checksum)~=tostring(crc) then
	--	return nil,"checksum","("..tostring(crc)..','..tostring(checksum)..")"
	--end
	
	return true
end

function MDL:ParseHeader()
	if self.parsed_header~=nil then
		return self.parsed_header
	end
	self.parsed_header = false
	
	local f = self.file
	local res = self
	
	res.checksum = f:Read(4)
	
	local name = f:Read(64)
	name = name:match'^[^%z]*' or ""
	res.name = name
	
	local dataLength = from_int(f:Read(4),true)
	res.dataLength = dataLength
	
	-- TODO: skip Vectors, read elsewhere
	f:Seek( f:Tell()+4 * 3 *6 )
	
	res.flags=from_int(f:Read(4),true)
	
	-- mstudiobone_t
	res.bone_count = from_int(f:Read(4),true)	-- Number of data sections (of type mstudiobone_t)
	res.bone_offset = from_int(f:Read(4),true)	-- Offset of first data section
 
	-- mstudiobonecontroller_t
	res.bonecontroller_count = from_int(f:Read(4),true)
	res.bonecontroller_offset = from_int(f:Read(4),true)
 
	-- mstudiohitboxset_t
	res.hitbox_count = from_int(f:Read(4),true)
	res.hitbox_offset = from_int(f:Read(4),true)
 
	-- mstudioanimdesc_t
	res.localanim_count = from_int(f:Read(4),true)
	res.localanim_offset = from_int(f:Read(4),true)
 
	-- mstudioseqdesc_t
	res.localseq_count = from_int(f:Read(4),true)
	res.localseq_offset = from_int(f:Read(4),true)
 
	res.activitylistversion = from_int(f:Read(4),true) -- ??
	res.eventsindexed = from_int(f:Read(4),true)	-- ??
 
	-- VMT texture filenames
	-- mstudiotexture_t
	res.texture_count = from_int(f:Read(4),true)
	res.texture_offset = from_int(f:Read(4),true)
 
	-- This offset points to a series of ints.
		-- Each int value, in turn, is an offset relative to the start of this header/the-file,
		-- At which there is a null-terminated string.
	res.texturedir_count = from_int(f:Read(4),true)
	res.texturedir_offset = from_int(f:Read(4),true)
 
	-- Each skin-family assigns a texture-id to a skin location
	res.skinreference_count = from_int(f:Read(4),true)
	res.skinrfamily_count = from_int(f:Read(4),true)
	res.skinreference_index = from_int(f:Read(4),true)
 
	-- mstudiobodyparts_t
	res.bodypart_count = from_int(f:Read(4),true)
	res.bodypart_offset = from_int(f:Read(4),true)
 
	-- Local attachment points
	-- mstudioattachment_t
	res.attachment_count = from_int(f:Read(4),true)
	res.attachment_offset = from_int(f:Read(4),true)
 
	-- Node values appear to be single bytes, while their names are null-terminated strings.
	res.localnode_count = from_int(f:Read(4),true)
	res.localnode_index = from_int(f:Read(4),true)
	res.localnode_name_index = from_int(f:Read(4),true)
 
	-- mstudioflexdesc_t
	res.flexdesc_count = from_int(f:Read(4),true)
	res.flexdesc_index = from_int(f:Read(4),true)
 
	-- mstudioflexcontroller_t
	res.flexcontroller_count = from_int(f:Read(4),true)
	res.flexcontroller_index = from_int(f:Read(4),true)
 
	-- mstudioflexrule_t
	res.flexrules_count = from_int(f:Read(4),true)
	res.flexrules_index = from_int(f:Read(4),true)
 
	-- IK probably referse to inverse kinematics
	-- mstudioikchain_t
	res.ikchain_count = from_int(f:Read(4),true)
	res.ikchain_index = from_int(f:Read(4),true)
 
	-- Information about any "mouth" on the model for speech animation
	-- More than one sounds pretty creepy.
	-- mstudiomouth_t
	res.mouths_count = from_int(f:Read(4),true)
	res.mouths_index = from_int(f:Read(4),true)
 
	-- mstudioposeparamdesc_t
	res.localposeparam_count = from_int(f:Read(4),true)
	res.localposeparam_index = from_int(f:Read(4),true)
 
	--[[
	 * For anyone trying to follow along, as of this writing,
	 * the next "surfaceprop_index" value is at position 0x0134 (308)
	 * from the start of the file.
	 --]]
 
	-- Surface property value (single null-terminated string)
	res.surfaceprop_index = from_int(f:Read(4),true)
 
	-- Unusual: In this one index comes first, then count.
	-- Key-value data is a series of strings. If you can't find
	-- what you're interested in, check the associated PHY file as well.
	res.keyvalue_index = from_int(f:Read(4),true)
	res.keyvalue_count = from_int(f:Read(4),true)
 
	-- More inverse-kinematics
	-- mstudioiklock_t
	res.iklock_count = from_int(f:Read(4),true)
	res.iklock_index = from_int(f:Read(4),true)
 
 
	res.mass = f:ReadFloat() -- Mass of object (4-bytes)
	res.contents = from_int(f:Read(4),true)	-- ??
 
	-- Other models can be referenced for re-used sequences and animations
	-- (See also: The $includemodel QC option.)
	-- mstudiomodelgroup_t
	res.includemodel_count = from_int(f:Read(4),true)
	res.includemodel_index = from_int(f:Read(4),true)
 
	res.virtualModel = from_int(f:Read(4),true)	-- Placeholder for mutable-void*
 
	-- mstudioanimblock_t
	res.animblocks_name_index = from_int(f:Read(4),true)
	res.animblocks_count = from_int(f:Read(4),true)
	res.animblocks_index = from_int(f:Read(4),true)
 
	res.animblockModel = from_int(f:Read(4),true) -- Placeholder for mutable-void*
 
	-- Points to a series of bytes?
	res.bonetablename_index = from_int(f:Read(4),true)
 
	res.vertex_base = from_int(f:Read(4),true)	-- Placeholder for void*
	res.offset_base = from_int(f:Read(4),true)	-- Placeholder for void*
 
	-- Used with $constantdirectionallight from the QC
	-- Model should have flag #13 set if enabled
	res.directionaldotproduct = f:Read(1)
 
	res.rootLod = f:Read(1)	-- Preferred rather than clamped
 
	-- 0 means any allowed, N means Lod 0 -> (N-1)
	res.numAllowedRootLods = f:Read(1);
 
	f:Read(1)--		unused; -- ??
	res.unused = from_int(f:Read(4),true) -- ??
 
	-- mstudioflexcontrollerui_t
	res.flexcontrollerui_count = from_int(f:Read(4),true)
	res.flexcontrollerui_index = from_int(f:Read(4),true)
 
	--[[*
	 * Offset for additional header information.
	 * May be zero if not present, or also 408 if it immediately
	 * follows this studiohdr_t
	 --]]
	-- studiohdr2_t
	res.studiohdr2index = from_int(f:Read(4),true)
	
	return true
	
end

local offsetreaderinfo_1 = {}
local offsetreaderinfo_2 = {}
function MDL:IncludedModels()
	local f = self.file
	local t = self.included_models
	if t then return t end
	
	local ok = self:SeekTo(self.includemodel_index)
	assert(ok)
	
	t = {}
	
	for i=1,self.includemodel_count do
	
		local pos = self:Tell()
		
		local labelOffset = from_int(f:Read(4),true)
		local fileNameOffset = from_int(f:Read(4),true)
		offsetreaderinfo_1[i]=labelOffset 		+ pos
		offsetreaderinfo_2[i]=fileNameOffset	+ pos
	end
	for i=1,self.includemodel_count do
		
		
		local labelOffset = offsetreaderinfo_1[i]
		local fileNameOffset = offsetreaderinfo_2[i]
		
		--print(i,labelOffset,fileNameOffset)
		
		assert(self:SeekTo(labelOffset))
		local label = f:ReadString()

		assert(self:SeekTo(fileNameOffset))
		
		local fileName = f:ReadString()

		t[i] = {label,fileName}
		
	end
	
	self.included_models = t
	
	return t
end


local mstudioattachment_t_size =
	4 			-- int					sznameindex;
	+4 			-- unsigned int			flags;
	+4			-- int					localbone;
	+(3*4)*4	-- matrix3x4_t			local; // attachment point
	+4*8    	-- int					unused[8];

function MDL:offsetAttachment( i )
	assert(i>=0 and i<=self.attachment_count)
	return self.attachment_offset + mstudioattachment_t_size * i
end


function MDL:SurfaceName()
	local f = self.file
	local name = self.surfaceprop_name
	if name then return name end
	
	assert(self:SeekTo(self.surfaceprop_index))
	name = f:ReadString()
	assert(name)
	self.surfaceprop_name = name
	return name
end
	
function MDL:Attachments()
	local f = self.file
	local t = self.attachment_nameslist
	if t then return t end
	
	t = {}
	
	for i=0,self.attachment_count-1 do -- mstudioattachment_t --
		
			local thispos = self:offsetAttachment(i)
			assert(self:SeekTo(thispos))
			
			local sznameindex = from_int(f:Read(4),true)
			
			local flags = from_u_int(f:Read(4),true)
			
			assert(self:SeekTo(thispos + sznameindex))
			local name = f:ReadString()
			
			t[#t+1] = {name,flags}
			
	end

	self.attachment_nameslist = t
	
	return t
end
-----------------------------


local mstudiotexture_t_size =
	4  -- int		sznameindex;
	+4 -- int		flags;
	+4 -- int		used;
	+4 -- int		unused1;
	+4 -- int		material;
	+4 -- int		client_material;
	+4*10 -- int	unused[10];

function MDL:offsetTexture( i )
	assert(i>=0 and i<=self.texture_count)
	return self.texture_offset + mstudiotexture_t_size * i
end

function MDL:Textures()
	local f = self.file
	local t = self.texture_nameslist
	if t then return t end
	
	t = {}
	
	for i=0,self.texture_count-1 do -- mstudiotexture_t --
	
		local thispos = self:offsetTexture(i)
		assert(self:SeekTo(thispos))
		
		local sznameindex = from_int(f:Read(4),true)
		
		assert(self:SeekTo(thispos + sznameindex))
		local name = f:ReadString()
		
		t[#t+1] = {name}
		
	end

	self.texture_nameslist = t
	
	return t
end
-----------------------------
function MDL:ParseSkins()
	if self.skintable then return self.skintable end
	local f = self.file
	local textures = self:Textures()
	local skintable = {}
	assert(self:SeekTo(self.skinreference_index))

	for i = 1, self.skinrfamily_count do
		skintable[i] = {}

		for j = 1, self.skinreference_count do
			local textureid = f:Read(1):byte() + f:Read(1):byte() * 256
			skintable[i][j] = textures[textureid + 1]
		end
	end

	self.skintable = skintable

	return skintable
end

-----------------------------

function MDL:TextureDirs()
	local f = self.file
	local t = self.texturedirs
	if t then return t end

	t = {}

	assert(self:SeekTo(self.texturedir_offset))
	local offsets={}
	for i=1,self.texturedir_count do
		local offset = from_int(f:Read(4),true)
		offsets[i]=offset
	end
	
	for _,offset in next,offsets do
		assert(self:SeekTo(offset))
		local name = f:ReadString()

		t[#t+1] = name

	end

	self.texturedirs = t

	return t
end






-----------------------------

local mstudiobodyparts_t_size =
	4 -- int	sznameindex;
	+ 4 -- int	nummodels;
	+ 4 -- int	base;
	+ 4 -- int	modelindex; 
	
function MDL:offsetBodyPart( i )
	assert(i>=0 and i<=self.bodypart_count)
	return self.bodypart_offset + mstudiobodyparts_t_size * i
end



function MDL:BodyParts()
	local f = self.file
	local t = self.bodyparts
	if t then return t end
	
	t = {}
	
	self:ParseHeader()
	for i=0,self.bodypart_count-1 do -- mstudiobodyparts_t --
		
			local thispos = self:offsetBodyPart(i)
			assert(self:SeekTo(thispos))
			
			local sznameindex = from_int(f:Read(4),true)
			
			local nummodels = from_u_int(f:Read(4),true)
			local base = from_u_int(f:Read(4),true)
			local modelindex = from_u_int(f:Read(4),true)
			
			assert(self:SeekTo(thispos + sznameindex))
			local name = f:ReadString()
			
			
			t[#t+1] = {this=thispos,name=name,base=base,nummodels=nummodels,modelindex=modelindex}
			
	end

	self.bodyparts = t
	
	return t
end




-- bodypart model

local  mstudiomodel_t_size =
 64 -- char		name[64];
+ 4 -- int		type;
+ 4 -- float	boundingradius;
+ 4 -- int		nummeshes;	
+ 4 -- int		meshindex;
+ 4 -- int		numvertices;		
+ 4 -- int		vertexindex;		
+ 4 -- int		tangentsindex;		
+ 4 -- int		numattachments;
+ 4 -- int		attachmentindex;
+ 4 -- int		numeyeballs;
+ 4 -- int		eyeballindex;
+ 4 -- void		*pVertexData;
+ 4 -- void		*pTangentData;
+ 4*8 -- int	unused[8];

function MDL:offsetBodyPartModel( part, i )
	local f = self.file
	assert(i>=0 and i < part.nummodels)
	return part.this + part.modelindex + mstudiomodel_t_size * i
	
end

function MDL:BodyPartModel(part,i)
	local f = self.file
	
	local thispos = self:offsetBodyPartModel(part, i)
	assert(self:SeekTo(thispos))
	
	local name = f:Read(64):gsub("%z*$","")
	local modeltype = from_u_int(f:Read(4),true)
	local boundingradius = f:ReadFloat()
	local nummeshes = from_u_int(f:Read(4),true)
	local meshindex = from_u_int(f:Read(4),true)
	local numvertices = from_u_int(f:Read(4),true)
	local vertexindex = from_u_int(f:Read(4),true)
	local tangentsindex = from_u_int(f:Read(4),true)
	local numattachments = from_u_int(f:Read(4),true)
	local attachmentindex = from_u_int(f:Read(4),true)
	local numeyeballs = from_u_int(f:Read(4),true)
	local eyeballindex = from_u_int(f:Read(4),true)
	local pVertexData = from_u_int(f:Read(4),true)
	local pTangentData = from_u_int(f:Read(4),true)
	f:Skip(4*8) -- unused
	
	local t = {
		name = name,
		modeltype = modeltype,
		boundingradius = boundingradius,
		nummeshes = nummeshes,
		meshindex = meshindex,
		numvertices = numvertices,
		vertexindex = vertexindex,
		tangentsindex = tangentsindex,
		numattachments = numattachments,
		attachmentindex = attachmentindex,
		numeyeballs = numeyeballs,
		eyeballindex = eyeballindex,
		pVertexData = pVertexData,
		pTangentData = pTangentData
	}
	return t
end


function MDL:BodyPartsEx()
	local t = self.bodypartsx
	if t then return t end
	
	self:ParseHeader()
	t = table.Copy(self:BodyParts())
	
	for _,part in next,t do
		for i=0,part.nummodels-1 do
			
			part.models=part.models or {}
			part.models[i+1] = self:BodyPartModel(part,i)
			
		end
	end

	self.bodypartsx = t
	
	return t
end

-- bones


local bone_section_size =
	  4 -- int
	+ 4  -- int parent
	+ 4*6 --int					bonecontroller[6];	// bone controller index, -1 == none

	+ 4*3 --Vector				pos;
	+ 4*4 --Quaternion			quat;
	+ 4*3 --RadianEuler			rot;

	+ 4*3 --Vector				posscale;
	+ 4*3 --Vector				rotscale;
	+ 48 --matrix3x4_t			poseToBone;

	+ 4*4 --Quaternion			qAlignment;
	+ 4 --int					flags;
	+ 4 --int					proctype;
	+ 4 --int					procindex;		// procedural rule
	+ 4 --mutable int			physicsbone;	// index into physically simulated bone
	+ 4 --int					surfacepropidx;	// index into string tablefor property name
	+ 4 --int					contents;		// See BSPFlags.h for the contents flags
	+ 4 --int 					surfacepropLookup
	+ 4*7 --int					unused[7];		// remove as appropriate
	
function MDL:offsetBone( i )
	assert(i>=0 and i<=self.bone_count)
	return self.bone_offset + bone_section_size * i
end


function MDL:BoneNames()
	local f = self.file
	local t = self.bone_nameslist
	if t then return t end
	
	t = {}
	
	for i=0,self.bone_count-1 do -- mstudiobone_t --
	
		local thispos = self:offsetBone(i)
		assert(self:SeekTo(thispos))
		
		local nameoffset = from_int(f:Read(4),true)
		
		assert(self:SeekTo(thispos + nameoffset))
		local name = f:ReadString()
		
		t[#t+1] = name
		
		
	end

	self.bone_nameslist = t
	
	return t
end


function MDL:SeekTo(offset)
	
	local f = self.file
	local off = self.initial_offset + offset
	
	if off>f:Size() then
		--print("offset too big",off-f:Size())
		return false
	end
	
	f:Seek(off)
	return f:Tell()==off
	
end

function MDL:Tell()
	return self.file:Tell()-self.initial_offset
end


-- bodygroup builder

local MT={}
function MT:SetBodygroup( group, val )
	assert(group)
	assert(val)
	local bodypart = self.data[group]
	
	if not bodypart then
		for _, candidate in next, self.data do
			if candidate.name == group then
				-- there can be duplicates, choose the last one
				if candidate.nummodels > 1 then
					bodypart = candidate
				else
					bodypart = bodypart or candidate
				end
			end
		end
	
		if not bodypart then return false, 1, 'bodypart missing' end
	end
	
	assert(bodypart.nummodels,"malformed data")
	if bodypart.base == 0 or bodypart.nummodels == 0 then return false,2,'no such part' end

	local cur = math.floor(self.bodynum / bodypart.base) % bodypart.nummodels

	if val >= bodypart.nummodels then
		return false,3,"no such model numberr",cur -- we could not set the right one
	end
	
	self.bodynum = math.floor(self.bodynum - math.floor(cur * bodypart.base) + math.floor(val * bodypart.base))

	return true
end

MT.Set = MT.SetBodygroup
function MT:GetValue()
	return self.bodynum
end
function MT:Reset(m)
	self.bodynum = m or 0
end

function MT:GetData()
	return self.data
end

function BodyPartBuilder(t,cur)
	assert(t,"need bodypart data")
	return setmetatable({data=t,bodynum=cur or 0},{__index=MT})
end

--

local TEST = false

if TEST then
	local mdl = mdlinspect.Open(LocalPlayer():GetModel())
	local bodyparts = mdl:BodyParts()
	local bp = mdlinspect.BodyPartBuilder(bodyparts, 0)
	PrintTable(bp)
end

return _M

--PATH addons/_outfitter/lua/includes/modules/urlimage.lua:
if SERVER then
	AddCSLuaFile() 
	return
end

module("urlimage",package.seeall)
_M._MM = setmetatable({},{__index=function(s,k) return rawget(_M,k) end,__newindex=_M})
local inDebug
function setDebug(d)
	inDebug = d
end

if _MM.getDebug then
	setDebug(getDebug())
end

function getDebug()
	return inDebug
end

function dbg(...) 
	if not inDebug then return end
	Msg"[UrlImg] "print(...) 
end

function DBG(...) Msg"[UrlImg] "print(...) end

FindMetaTable"IMaterial".ReloadTexture = function(self,name)
	self:GetTexture(name or "$basetexture"):Download()
end

-- texture parsers for real w/h
local IsPNG = string.IsPNG
if not IsPNG then require'imgparse' IsPNG = string.IsPNG end
local IsJPG = string.IsJPG
local IsVTF = string.IsVTF

local PNG = file.ParsePNG
local VTF = file.ParseVTF
local JPG = file.ParseJPG
local assert_ = assert

local assert = function(a,b)
	if a==nil and b=='nodb' then return end
	return assert_(a,b)
end

if not sql.obj then pcall(require,'sqlext') end
--
local db
function db_init()
	local _db = assert(sql.obj("urlimage"))
	assert(_db.migrate,"Please upgrade urlimage dependencies")
	
	_db=assert(_db:create([[
			`url`		TEXT NOT NULL CHECK(url <> '') UNIQUE,
			`ext`		TEXT NOT NULL CHECK(ext = 'vtf' OR ext = 'png' OR ext = 'jpg'),
			`last_used`	INTEGER NOT NULL DEFAULT 0,
			`fetched`	INTEGER NOT NULL DEFAULT (cast(strftime('%%s', 'now') as int) - 1477777422),
			`locked`	BOOLEAN NOT NULL DEFAULT 1,
			`size`		INTEGER DEFAULT 0,
			`w`			INTEGER(2) NOT NULL DEFAULT 0,
			`h`			INTEGER(2) NOT NULL DEFAULT 0,
			`fileid`	INTEGER PRIMARY KEY AUTOINCREMENT]])
		:migrate(function(db)
			db:alter("ADD COLUMN file_size INTEGER;")
		end)
		:coerce{last_used=tonumber, fileid=tonumber,w=tonumber,file_size=tonumber,h=tonumber, locked=function(l) return l=='1' end })
	local l = assert(_db:update("locked = 0 WHERE locked != 0"))

	if l>0 then dbg("unlocked entries: ",l) end
	db = _db
end

-- print(db:columns())

--  Msg"insert " 		print(assert(		db:insert{url = "http://asd.com/0", last_used = os.time()}))
--  Msg"replace " 		print(				db:insert({url = "http://asd.com/0", last_used = 1337},true))
--  Msg"insert " 		print(assert(		db:insert{url = "http://asd.com/1", last_used = os.time()-123}))
--  Msg"count " 		print(tonumber(		db:select1"count(*) as count".count))
--  Msg"Delete none " 	PrintTable(assert(	db:delete("url = %s",'derp')))
--  Msg"count " 		print(tonumber(		db:select1"count(*) as count".count))
--  Msg"list "			PrintTable(			db:select("*","WHERE URL != %s","http://asd.co"))
--  Msg"update "		PrintTable(			db:update("locked = 1 WHERE fileid=%d",123))
--  Msg"list"			PrintTable(			db:select("*","WHERE URL != %s","http://asd.co"))
--  Msg"raw"			PrintTable(assert(	db:sql1("select * from %s limit %d",db,1)))
--  Msg"Delete all " 	print(assert(		db:delete("url != %s",'derp')))
--do return end
---------------


MAX_ENTRIES = 2048
function find_purgeable()
	if not db then return nil,'nodb' end
	dbg("find_purgeable()")
	local a,b = db:select('*','WHERE locked != 1 ORDER BY last_used ASC LIMIT(select max(0,count(*) - %d) from %s)',MAX_ENTRIES,db)
	if a==true then return false end
	return a,b
end

function get_cache_info()
	if not db then return nil,'nodb' end
	return {
		
		count = tonumber(db:select('count(*) as count')[1].count or -1),
		bytes = db:select('sum(file_size) as file_size')[1].file_size or -1,
		
	}
end


--function find_oldest()
--	if not db then return nil,'nodb' end
--	dbg("find_oldest()")
--	local a,b = db:select('*','WHERE locked != 1 ORDER BY last_used ASC LIMIT(1)')
--	return a,b
--end

function update_dimensions(fileid,w,h)
	if not db then return nil,'nodb' end

	dbg("update_dimensions()",fileid,w,h)
	assert(tonumber(fileid))
	return db:update("w = %d, h=%d WHERE fileid=%d",w,h,fileid)
end
function update_size(fileid,sz)
	if not db then return nil,'nodb' end
	assert(tonumber(fileid))
	assert(tonumber(sz))

	dbg("update_size()",fileid,sz)
	return db:update("file_size = %d WHERE fileid=%d",sz,fileid)
end

function record_use(fileid,nolock)
	if not db then return nil,'nodb' end

	dbg("record_use()",fileid,nolock)
	assert(tonumber(fileid))
	nolock = nolock and "" or ", locked = 1"
	return db:update("last_used = (cast(strftime('%%s', 'now') as int) - 1477777422)"..nolock.." WHERE fileid=%d",fileid)
end

function get_record(urlid)
	if not db then return nil,'nodb' end

	dbg("get_record()",urlid)
	local record = assert(db:select1('*',isnumber(urlid) and "WHERE fileid = %d" or "WHERE url = %s",urlid))
	return record~=true and record
end

function record_validate(r)
	local err
	if not istable(r) then r,err = get_record(r) end
	dbg("record_validate()",r,r and r.url or r.fileid,err)
	if not r or not r.w or r.w==0 then return false end
	
	return r and file.Exists(FPATH(r.fileid,r.ext),'DATA') and r
end

function new_record(url,ext)
	if not db then return nil,'nodb' end

	dbg("new_record()",url,ext)
	local fileid = assert(db:insert{url = url,ext = ext})
	return fileid
end

--print(update_last_used(db:insert{url = "f"}))
--db:insert{url = "http://asd.com/1",last_used = 1}
--db:insert{url = "http://asd.com/2",ext="jpg"}
--db:insert{url = "http://asd.com/3",last_used = 3}
--db:insert{url = "http://asd.com/4"}
--Msg"list "			PrintTable(			db:select("*","WHERE URL != %s","http://asd.co"))

BASE = "cache/uimg"
file.CreateDir("cache",'DATA')
file.CreateDir(BASE,'DATA')
function FPATH(a,ext,open_as)
	--Msg(("FPATH %q %q %q -> "):format(a or "",ext or "",tostring(open_as or "")))
	if ext=="vmt" then
		a=a..'_vmt'
		ext="txt"
	end
	
	local ret =("%s/%s%s%s%s%s"):format(BASE,tostring(a),
		ext and "." or "",
		ext or "",
		open_as and "\n." or "",
		open_as or "")
	--print(ret)
	return ret
end

function ToMaterialPath(...)
	return ("../data/%s"):format(FPATH(...))
end
FPATH_R=ToMaterialPath

local generated = {}
function Material(fileid, ext, isSurface, pngParameters)
	dbg("Material()",fileid,ext,pngParameters)
	local path = ToMaterialPath(fileid,ext )
	local a,b
	
	if ext == 'vtf' or ext == 'VTF' then
		path = ToMaterialPath(fileid)
		local matid = "uimgg".. fileid .. (isSurface and "surface" or "render")
		dbg("_G.CreateMaterial()",("%q"):format(path),isSurface and "UnlitGeneric" or "VertexLitGeneric",matid)
		a,b = CreateMaterial(matid, isSurface and "UnlitGeneric" or "VertexLitGeneric", {
			["$vertexcolor"] = "1",
			["$vertexalpha"] = "1",
			["$nolod"] = "1",
			["$basetexture"] = path,
			["Proxies"] =
			{
				["AnimatedTexture"] =
				{
					["animatedTextureVar"] = "$basetexture",
					["animatedTextureFrameNumVar"] = "$frame",
					["animatedTextureFrameRate"] = 8,
				}
			}
		})
	else
		dbg("_G.Material()",("%q"):format(path),pngParameters)
		a,b = _G.Material(path,pngParameters)
	end
	
	-- should no longer be needed, if it even works
	--if a then a:ReloadTexture() end
	
	return a,b,path,matid
end

function fwrite(fileid,ext,data)
	dbg("fwrite()",fileid,ext,#data)
	local path = FPATH(fileid,ext)
	file.Write(path,data)
	return path
end
function fopen(fileid,ext)
	dbg("fopen()",fileid,ext)
	return file.Open(FPATH(fileid,ext),'rb','DATA')
end

local delete_record delete_record = function(record)
	dbg("delete_record()",record)
	if istable(record) then
		
		if next(record)==nil then return 0 end
		
		if record[1] then
			local aggr = 0
			for k,record in next,record do
				aggr = aggr + assert(delete_record(record))
			end
			return aggr
		else
			return delete_record(record.fileid or record.fileid)
		end
	elseif isnumber(record) then
		if not db then return nil,'nodb' end
		return db:delete('fileid = %d',record)
	elseif isstring(record) then
		if not db then return nil,'nodb' end
		return db:delete('url = %s',record)
	else error"wtf" end
end

function delete_fileid(fileid,ext)
	dbg("delete_fileid()",fileid,ext)
	
	local deleted = false
	local function D(path,place)
		if file.Exists(path,place) then
			deleted = true
			file.Delete(path,place)
			return deleted
		end
	end
	
	if ext then
		D(FPATH(fileid,ext),'DATA')
	end
	D(FPATH(fileid,'vmt'),'DATA')
	D(FPATH(fileid,'jpg'),'DATA')
	D(FPATH(fileid,'png'),'DATA')
	D(FPATH(fileid,'vtf'),'DATA')
	
	return deleted
end



function data_format(bytes)
	if 		IsJPG(bytes) then return 'jpg'
	elseif 	IsPNG(bytes) then return 'png'
	elseif 	IsVTF(bytes) then return 'vtf'
	end
	dbg("data_format()","FAILURE",("%q"):format(bytes))
end

local mw,mh = 	render.MaxTextureWidth(),render.MaxTextureHeight()
mw=mw>2048 and 2048 mh=mh>2048 and 2048
function read_image_dimensions(fh,fmt)
	dbg("read_image_dimensions()",fh,fmt)
	local reader = fmt=='png' and PNG or fmt=='jpg' and JPG or fmt=='vtf' and VTF
	if not reader then return nil,'No reader for format: '..tostring(fmt) end
	
	local w,h
	local t = reader(fh)
	
	w = t.width
	h = t.height
	if not w or not h then
		return nil,'invalid file'
	end
	if w>mw or h>mh then
		return nil,'excessive dimensions'
	end
	return w,h
end

function record_to_material(r, data, isSurface)
	dbg("record_to_material()",r and r.fileid)
	if not r.used then
		assert(record_use(r.fileid))
		r.used = true
	end
	return Material(r.fileid, r.ext, isSurface, data), r.w, r.h
end

local function remove_error(cached,...)
	cached.error = nil
	return ...
end

cache = _MM.cache or {}
local cache = cache

fastdl_override = false
local fastdl = GetConVarString"sv_downloadurl":gsub("/$","")..'/'
function GetFastDL()
	return fastdl_override or fastdl
end

function FixupURL(url)
	if not url:sub(3,10):find("://",1,true) then
		url = GetFastDL()..url
	else

		url = url:gsub([[^http%://onedrive%.live%.com/redir?]],[[https://onedrive.live.com/download?]])
		url = url:gsub( "github.com/([a-zA-Z0-9_]+)/([a-zA-Z0-9_]+)/blob/", "github.com/%1/%2/raw/")

		if url:find("dropbox",1,true) then
			url = url:gsub([[^http%://dl%.dropboxusercontent%.com/]],[[https://dl.dropboxusercontent.com/]])
			url = url:gsub([[^https?://www.dropbox.com/s/(.+)%?dl%=[01]$]],[[https://dl.dropboxusercontent.com/s/%1]])
		end

	end
	
	return url
end



function URLFetchHead(url,cb,headers)
	HTTP{
		url			= url,
		method		= "HEAD",
		parameters = headers,
		success = function( code, body, headers )
			cb(code==200 and assert(headers) or nil,code,headers,body)
		end,
		failed = function( reason )
			cb(nil,reason)
		end
	}
end
function HeadContentSize(t)
	return t['Content-Length']
end



local n = URLIMAGE_EMERGENCY_UID or (10000-1)
local function get_uid()
	n = n + 1
	URLIMAGE_EMERGENCY_UID = n
	DBG("Emergency UID",n)
	return n
end
-- Returns: mat,w,h
-- Returns: false = processing, nil = error
function GetURLImage(url, data, isSurface)
	
	url = FixupURL(url)
	
	local cached = cache[url]
	if cached then
		if cached.processing then
			return false
		elseif cached.error then
			return nil,cached.error
		elseif cached.record then
			return record_to_material(cached.record, data, isSurface)
		else
			cached.error = "invalid cache state"
			error(cached.error)
		end
	end
	
	-- find if record exists --
	
	cached = {error = "failure"}
	cache[url] = cached
	
	local cached_record = get_record(url)
	if cached_record then
		
		assert(next(cached_record)~=nil)
		
		if record_validate(url) then
			record_use(cached_record.fileid)
			cached.record = cached_record
			return remove_error(cached, record_to_material(cached_record, data, isSurface) )
		else
			DBG("INVALID RECORD","DELETING",url)
			assert(delete_record(url))
		end
	end
	
	-- it's a new url --
	dbg("Fetching",url)
	
	local function fail(err)
		delete_record(url)
		cached.processing = false
		cached.error = tostring(err)
		dbg("Fetch failed for",url,": "..cached.error)
	end
	
	local function fetched(data,len,hdr,code)
		
		dbg("fetched()",url,string.NiceSize(len),code)
		
		if code~=200 then
			return fail(code)
		end
		if len<=8 or len>1024*1024*25 then -- 26MB
			return fail'invalid filesize'
		end
		
		local ext = data_format(data)
		if not ext then
			return fail'unknown format'
		end
		
		-- build a new record --
		
		local fileid = assert(new_record(url,ext))
		local nodb
		
		if not fileid then 
			nodb = true
			fileid = get_uid()
		end
		
		assert(fileid)
		
		local record = {fileid = fileid}
		
		fwrite(fileid,ext,data) data = nil
		local fh = fopen(fileid,ext)
		
		local w,h = read_image_dimensions(fh,ext)
		fh:Close()
		if not w then return fail(h) end
		
		if not nodb then
			assert(update_dimensions(fileid,w,h))
			assert(update_size(fileid,len))
				
			-- We don't have to build the record manually, we can just get it again
			record = assert(get_record(url))
			
			assert(record)
			
			cached.record = record
			
		else
			record.url = url
			record.ext = 		ext
			record.last_used = 	os.time()
			record.fetched = 	os.time()
			record.locked = 	true
			record.w = 	w
			record.h = 		h
			record.fileid = fileid
			cached.record = record
		end
	
		if not record_validate(cached.record) then
			return fail'record_validate()'
		end
			
		if not nodb then
			-- we now have some sort of record, so let's use it so it's top of LRU
			record_use(fileid,true) -- maybe remove?
		end
			
		cached.processing = false
		remove_error(cached)
		
		
	end
	URLFetchHead(url,function(h,err)
		if h then
			local sz = HeadContentSize(h)
			if sz and tonumber(sz) then
				
				if tonumber(sz)>15*1000*1000 then
					return fail'filesize'
				end
			end
		else
			dbg("Head query failed",err)
		end
		http.Fetch(url,fetched,fail)	
	end)
	
	cached.processing = true
	
	return false
	
end

local lastFrameCalled = -1
local frameCount
local IKNOWWHATIMDOING=false
local errored = false

function SuppressSanityChecks(s)
	IKNOWWHATIMDOING = s ~= false
end

function URLImage(url, data)
	local fn = FrameNumber()
	if lastFrameCalled == fn - 1 then
		frameCount=frameCount+1
		if frameCount > 18 then
			if not errored then
				errored = true
				if not IKNOWWHATIMDOING then 
					ErrorNoHalt("URLImage called every frame, you must keep a reference to the result of URLImage, url="..tostring(url))
					debug.Trace()
				end
			end
		end
	
	elseif lastFrameCalled ~= fn then
		frameCount = 0
	end
	lastFrameCalled=fn
	
	local mat,w,h = GetURLImage(url, data, true)
	dbg("URLImage",fn,url,mat,w)
	
	local function setmat()
		surface.SetMaterial(mat)
		return w,h, mat
	end
	
	if mat then
		dbg("URLImage",url,"instant mat",mat)
		return setmat
	end
	
	local trampoline trampoline = function()
		mat,w,h = GetURLImage(url, data, true)
		if not mat then
			if mat==nil then
				trampoline = function() return mat,w,h end
				DBG("URLImage failed for ",url,": ",w,h)
			end
			
			return mat
		end
		trampoline = setmat
		return setmat()
	end
	
	local function return_trampoline()
		return trampoline()
	end
	return return_trampoline
end

local WTF=function()end

-- Only start downloading when first called
function LazyURLImage(url, data)
	local cb 
	cb = function(...)
		cb = WTF
		cb = surface.URLImage(url, data)
		return cb(...)
	end
	return function(...)
		return cb(...)
	end
end
local lastFrameCalled = -1
local frameCount
local errored = false

function URLMaterial(url, data)
	local fn = FrameNumber()
	if lastFrameCalled == fn - 1 then
		frameCount=frameCount+1
		if frameCount > 18 then
			if not errored then
				errored = true
				if not IKNOWWHATIMDOING then 
					ErrorNoHalt("URLMaterial called every frame, you must keep a reference to the result of URLMaterial, url="..tostring(url))
					debug.Trace()
				end
			end
		end
	elseif lastFrameCalled ~= fn then
		frameCount = 0
	end
	lastFrameCalled=fn
	
	
	local mat,w,h = GetURLImage(url, "vertexlitgeneric " .. (data or ""), false)
	local function setmat()
		render.SetMaterial(mat)
		return w,h, mat
	end
	
	if mat then
		dbg("URLImage",url,"instant mat",mat)
		return setmat
	end
	
	local trampoline trampoline = function()
		mat,w,h = GetURLImage(url, "vertexlitgeneric " .. (data or ""), false)
		if not mat then
			if mat==nil then
				trampoline = function() return mat,w,h end
				DBG("URLMaterial failed for ",url,": ",w,h)
			end
			
			return mat
		end
		trampoline = setmat
		return setmat()
	end
	
	local function return_trampoline()
		return trampoline()
	end
	return return_trampoline
	
end

surface.URLImage = URLImage
surface.LazyURLImage = LazyURLImage
render.URLMaterial = URLMaterial

function do_purge()
	--TODO: Purge
	local purgeables = find_purgeable()
	if not purgeables or purgeables == true or #purgeables == 0 then return end
	local purgestart = SysTime()

	for _, purgeable in next, purgeables do
		if not delete_fileid(purgeable.fileid) then
			dbg("already deleted?", table.ToString(purgeable))
		end

		if not delete_record(purgeable.url) then
			DBG("Could not delete", table.ToString(purgeable))
		end
	end

	local purgelen = SysTime() - purgestart
	DBG("Images purged: ", #purgeables, ". took ", math.Round(purgelen*1000), "ms")
end

local ok,err = xpcall(db_init,debug.traceback)

if not ok then
	ErrorNoHalt(err..'\n')
end


local ok2,err2 = xpcall(do_purge,debug.traceback)

if not ok2 then
	ErrorNoHalt(err2..'\n')
end

function GetStartupFailure()
	return not ok and (err or "Unknown")
end

do return end

local test1 = surface.URLImage "materials/silk_icon_flags.png?b=cdq"
local test2 = surface.URLImage "http://g1.metastruct.net:2095/jpg.jpg?c=dqd"
local test3 = surface.URLImage "http://g1.metastruct.net:2095/vtf.vtf?c=qdq"
hook.Add("DrawOverlay","a",function()
	surface.SetDrawColor(255,255,255,255)
 
	local w,h = test1()
	if w then
		--print(w)
		surface.DrawTexturedRect(0,0,w,h)
	end
	local w1,h1 = test2()
	if w1 then
		surface.DrawTexturedRect(1+(w or 0),0,w1,h1)
	end
	local w2,h2 = test3()
	if w2 then
		surface.DrawTexturedRect(2+(w or 0)+(w1 or 0),0,w2,h2)
	end
end)
 

--PATH addons/_outfitter/lua/outfitter/cl_hacks.lua:
local Tag='outfitter'

module(Tag,package.seeall)


local function FixNPCWrongAnim(pl,slot,act)
	local seq_bad = pl:LookupSequence("jump_holding_land")
	if seq_bad<=0 then return end

	local seq_ok = pl:LookupSequence("jump_land")
	if seq_ok<=0 then return end
	pl:AnimSetGestureSequence(slot,seq_ok)
	
end

local Player = FindMetaTable"Player"
local Player_AnimRestartGesture = Player.AnimRestartGesture
function Player:AnimRestartGesture(slot,act,...)
	local ret = Player_AnimRestartGesture(self,slot,act,...)
	if act == ACT_LAND then
		FixNPCWrongAnim(self,slot,act)
	end
	return ret
end





-- fix non-tweening anims
do
	local Tag = Tag..'_fix_anims'

	local fixing

	local function DoFix()
		fixing = false
		FixLocalPlayerAnimations()
	end

	local function QueueFix()
		if fixing then return end
		timer.Create(Tag, 0.678, 1, DoFix)
		fixing = true
		dbgn(5,"Queueing local player animation fixing due to changed model")
	end

	local last_model_index
	local last_model_name

	local function CreateMove()
		--if not IsFirstTimePredicted() then return end
		local pl = LocalPlayer()
		--local model = pl:GetModel()
		--
		--if last_model_name ~= model then
		--	last_model_name = model
		--end

		local m_nModelIndex = pl:GetInternalVariable"m_nModelIndex"
		if last_model_index == m_nModelIndex then return end
		last_model_index = m_nModelIndex
		QueueFix()
		
	end

	hook.Add("CreateMove", Tag, CreateMove)
end
--PATH addons/__main/lua/autorun/revan_opt_playermodel.lua:
player_manager.AddValidModel( "revan_opt", "models/epangelmatikes/revan/revan_opt.mdl" )
player_manager.AddValidHands( "revan_opt", "models/epangelmatikes/revan/revan_hands_opt.mdl", 0, "00000000" )
--PATH addons/____sam/lua/sam/libs/sh_netstream.lua:
if SAM_LOADED then return end

--[[
	NetStream - 2.0.1
	https://github.com/alexgrist/NetStream/blob/master/netstream2.lua

	Alexander Grist-Hucker
	http://www.revotech.org
]]--

--[[
	if SERVER then
		netstream.Hook("Hi", function(ply, ...) -- Third argument is called to check if the player has permission to send the net message before decoding
			print(...)
		end, function(ply)
			if not ply:IsAdmin() then
				return false
			end
		end)
		-- OR
		netstream.Hook("Hi", function(ply, ...)
			print(...)
		end)
		netstream.Start(Entity(1), "Hi", "a", 1, {}, true, false, nil, "!") -- First argument player or table of players or any other argument to send to all players
		netstream.Start({Entity(1), Entity(2)}, "Hi", "a", 1, {}, true, false, nil, "!")
		netstream.Start(nil, "Hi", "a", 1, {}, true, false, nil, "!")
	end
	if CLIENT then
		netstream.Hook("Hi", function(...)
			print(...)
		end)
		netstream.Start("Hi", "a", 1, {}, true, false, nil, "!")
	end
]]--

-- Config

local addonName = "SAM"
local mainTable = sam -- _G.netstream = netstream

local sfs = sam.sfs
local encode_array = sfs.encode_array
local decode = sfs.decode

--

local type = sam.type
local unpack = unpack

local net = net
local compress = util.Compress
local decompress = util.Decompress

local netStreamSend = addonName .. ".NetStreamDS.Sending"

local netstream = {}
if istable(mainTable) then
	mainTable.netstream = netstream
end

local checks = {}
local receivers = {}

if SERVER then
	util.AddNetworkString(netStreamSend)

	local player_GetAll = player.GetAll
	function netstream.Start(ply, name, ...)
		if #name > 31 then
			error("netstream.Start name too long")
		end

		local ply_type = type(ply)
		if ply_type ~= "Player" and ply_type ~= "table" then
			ply = player_GetAll()
		end

		local array_length = select("#", ...)
		local encoded_data = encode_array({name, array_length, ...}, array_length + 2)

		net.Start(netStreamSend)
			net.WriteBool(false)
			net.WriteData(encoded_data)
		net.Send(ply)
	end

	function netstream.StartCompressed(ply, name, ...)
		if #name > 31 then
			error("netstream.Start name too long")
		end

		local ply_type = type(ply)
		if ply_type ~= "Player" and ply_type ~= "table" then
			ply = player_GetAll()
		end

		local array_length = select("#", ...)
		local encoded_data = encode_array({name, array_length, ...}, array_length + 2)

		local compressed_data = compress(encoded_data)

		net.Start(netStreamSend)
			net.WriteBool(true)
			net.WriteData(compressed_data)
		net.Send(ply)
	end

	function netstream.Hook(name, callback, check)
		if #name > 31 then
			error("netstream.Hook name too long")
		end

		receivers[name] = callback
		if type(check) == "function" then
			checks[name] = check
		end
	end

	net.Receive(netStreamSend, function(_, ply)
		local name = net.ReadString()

		local callback = receivers[name]
		if not callback then return end

		local length = net.ReadUInt(16)

		local check = checks[name]
		if check and check(ply, length) == false then return end

		local binary_data = net.ReadData(length)

		local decoded_data = decode(binary_data)
		if type(decoded_data) ~= "table" then return end

		local array_length = decoded_data[1]
		if type(array_length) ~= "number" then return end
		if array_length < 0 then return end

		callback(ply, unpack(decoded_data, 2, array_length + 1))
	end)
else
	checks = nil

	function netstream.Start(name, ...)
		if #name > 31 then
			error("netstream.Start name too long")
		end

		local array_length = select("#", ...)
		local encoded_data = encode_array({array_length, ...}, array_length + 1)

		local length = #encoded_data

		net.Start(netStreamSend)
			net.WriteString(name)
			net.WriteUInt(length, 16)
			net.WriteData(encoded_data, length)
		net.SendToServer()
	end

	function netstream.Hook(name, callback)
		receivers[name] = callback
	end

	net.Receive(netStreamSend, function(len)
		local compressed = net.ReadBool()
		local binary_data = net.ReadData((len - 1) / 8)

		if compressed then
			binary_data = decompress(binary_data)
			if not binary_data then return end
		end

		local decoded_data, err, err2 = decode(binary_data)
		if err ~= nil then
			sam.print("NetStream error: " .. err .. err2)
			return
		end

		local name = decoded_data[1]

		local callback = receivers[name]
		if not callback then return end

		callback(unpack(decoded_data, 3, decoded_data[2] + 2))
	end)
end

return netstream

--PATH addons/____sam/lua/sam_languages/ukrainian.lua:
return {
	You = "Ви",
	Yourself = "Ви самі",
	Themself = "Він/вона сам",
	Everyone = "Усі",

	cant_use_as_console = "Ви повинні бути гравцем, щоб використовувати команду {S Червоний}!",
	no_permission = "У вас немає дозволу використовувати '{S Червоний}'!",

	cant_target_multi_players = "Ви не можете вибрати кількох гравців за допомогою цієї команди!",
	invalid_id = "Невірний ідентифікатор ({S Червоний})!",
	cant_target_player = "Ви не можете вибрати {S Червоний}!",
	cant_target_self = "Ви не можете вибрати себе за допомогою команди {S Червоний}!",
	player_id_not_found = "Гравець з ідентифікатором {S Червоний} не знайдений!",
	found_multi_players = "Знайдено кілька гравців: {T}!",
	cant_find_target = "Не можу знайти гравця для вибору ({S Червоний})!",

	invalid = "Невірний {S} ({S_2 Червоний})",
	default_reason = "немає",

	menu_help = "Відкрити меню адміністратора.",

	-- Chat Commands
	pm_to = "PM для {T}: {V}",
	pm_from = "PM від {A}: {V}",
	pm_help = "Надіслати приватне повідомлення (PM) гравцю.",

	to_admins = "{A} до адміністраторів: {V}",
	asay_help = "Надіслати повідомлення адміністраторам.",

	mute = "{A} заглушив чат {T} на {V}. ({V_2})",
	mute_help = "Заборонити гравцям надсилати повідомлення в чаті.",

	unmute = "{A} зняв блокування чату з {T}.",
	unmute_help = "Розблокувати чат гравця(ів).",

	you_muted = "Вас заглушено.",

	gag = "{A} заглушив {T} на {V}. ({V_2})",
	gag_help = "Зупинити гравця(ів) від говоріння.",
	
	ungag = "{A} зняв блокування голосу з {T}.",
	ungag_help = "Розблокувати голос гравця(ів).",

	-- Fun Commands
	slap = "{A} дав ляпас {T}.",
	slap_damage = "{A} дав ляпас {T} з пошкодженням {V}.",
	slap_help = "Дати ляпас.",
	
	slay = "{A} вбив {T}.",
	slay_help = "Вбити гравця(ів).",
	
	set_hp = "{A} встановив здоров'я для {T} на {V}.",
	hp_help = "Встановити здоров'я для гравця(ів).",
	
	set_armor = "{A} встановив броню для {T} на {V}.",
	armor_help = "Встановити броню для гравця(ів).",
	
	ignite = "{A} підпалив {T} на {V}.",
	ignite_help = "Підпалити гравця(ів).",
	
	unignite = "{A} погасив {T}.",
	unignite_help = "Загасити гравця(ів).",
	
	god = "{A} увімкнув режим бога для {T}.",
	god_help = "Увімкнути режим бога для гравця(ів).",
	
	ungod = "{A} вимкнув режим бога для {T}.",
	ungod_help = "Вимкнути режим бога для гравця(ів).",
	
	freeze = "{A} заморозив {T}.",
	freeze_help = "Заморозити гравця(ів).",
	
	unfreeze = "{A} розморозив {T}.",
	unfreeze_help = "Розморозити гравця(ів).",
	
	cloak = "{A} зробив невидимим {T}.",
	cloak_help = "Зробити гравця(ів) невидимим(и).",
	
	uncloak = "{A} зняв невидимість з {T}.",
	uncloak_help = "Зняти невидимість з гравця(ів).",
	
	jail = "{A} посадив у тюрму {T} на {V}. ({V_2})",
	jail_help = "Посадити гравця(ів) у тюрму.",
	
	unjail = "{A} випустив з тюрми {T}.",
	unjail_help = "Випустити гравця(ів) з тюрми.",
	
	strip = "{A} позбавив зброї {T}.",
	strip_help = "Позбавити зброї гравця(ів).",
	
	respawn = "{A} відродив {T}.",
	respawn_help = "Відродити гравця(ів).",
	
	setmodel = "{A} змінив модель для {T} на {V}.",
	setmodel_help = "Змінити модель гравця(ів).",
	
	giveammo = "{A} дав {T} {V} боєприпасів.",
	giveammo_help = "Дати гравцю(ям) боєприпаси.",
	
	scale = "{A} встановив масштаб моделі для {T} на {V}.",
	scale_help = "Змінити масштаб гравця(ів).",
	
	freezeprops = "{A} заморозив усі предмети.",
	freezeprops_help = "Заморозити всі предмети на мапі.",
	
	-- Teleport Commands
	dead = "Ви мертві!",
	leave_car = "Спочатку вийдіть з транспортного засобу!",
	
	bring = "{A} телепортував до себе {T}.",
	bring_help = "телепортувати гравця до себе.",
	
	goto = "{A} телепортувався до {T}.",
	goto_help = "Телепортуватися до гравця.",
	
	no_location = "Немає попереднього місця для повернення {T}.",
	returned = "{A} повернув {T}.",
	return_help = "Повернути гравця туди, де він був.",

	-- User Management Commands
	setrank = "{A} встановив ранг для {T} на {V} на {V_2}.",
	setrank_help = "Встановити ранг для гравця.",
	setrankid_help = "Встановити ранг гравцю за його SteamID/SteamID64.",
	
	addrank = "{A} створив новий ранг {V}.",
	addrank_help = "Створити новий ранг.",
	
	removerank = "{A} видалив ранг {V}.",
	removerank_help = "Видалити ранг.",
	
	super_admin_access = "superadmin має доступ до всього!",
	
	giveaccess = "{A} надав доступ {V} до {T}.",
	givepermission_help = "Надати дозвіл рангу.",
	
	takeaccess = "{A} забрав доступ {V} від {T}.",
	takepermission_help = "Забрати дозвіл у рангу.",
	
	renamerank = "{A} перейменував ранг {T} на {V}.",
	renamerank_help = "Перейменувати ранг.",
	
	changeinherit = "{A} змінив ранг для наслідування для {T} на {V}.",
	changeinherit_help = "Змінити ранг для наслідування.",
	
	rank_immunity = "{A} змінив імунітет рангу {T} на {V}.",
	changerankimmunity_help = "Змінити імунітет рангу.",
	
	rank_ban_limit = "{A} змінив ліміт бану рангу {T} на {V}.",
	changerankbanlimit_help = "Змінити ліміт бану рангу.",
	
	changeranklimit = "{A} змінив ліміт {V} для {T} на {V_2}.",
	changeranklimit_help = "Змінити ліміти рангу.",
	
	-- Utility Commands
	map_change = "{A} змінює мапу на {V} за 10 секунд.",
	map_change2 = "{A} змінює мапу на {V} з режимом {V_2} за 10 секунд.",
	map_help = "Змінити поточну мапу та режим гри.",

	map_restart = "{A} перезапускає мапу за 10 секунд.",
	map_restart_help = "Перезапустити поточну мапу.",

	mapreset = "{A} скинув мапу.",
	mapreset_help = "Скинути мапу.",

	kick = "{A} вигнав {T}. Причина: {V}.",
	kick_help = "Вигнати гравця.",

	ban = "{A} заблокував {T} на {V} ({V_2}).",
	ban_help = "Заблокувати гравця.",

	banid = "{A} заблокував ${T} на {V} ({V_2}).",
	banid_help = "Заблокувати гравця за його SteamID.",
	-- ban message when admin name doesn't exists
	ban_message = [[

		Вас заблоковано: {S}
	
		Причина: {S_2}
	
		Вас буде розбанено через: {S_3}]],

	-- ban message when admin name exists
	ban_message_2 = [[

		Вас забалоковано: {S} ({S_2})
	
		Причина: {S_3}
	
		Вас буде розбанено через: {S_4}]],

	unban = "{A} розбанив {T}.",
	unban_help = "Розбанити гравця за його SteamID.",

	noclip = "{A} змінив режим польоту для {T}.",
	noclip_help = "Увімкнути/вимкнути noclip для гравця(ів).",
	
	cleardecals = "{A} очистив всі рагдолли та декалі для всіх гравців.",
	cleardecals_help = "Очистити всі рагдолли та декалі для всіх гравців.",
	
	stopsound = "{A} вимкнув усі звуки.",
	stopsound_help = "Зупинити всі звуки для всіх гравців.",
	
	not_in_vehicle = "Ви не в транспорті!",
	not_in_vehicle2 = "{S Синій} не в транспорті!",
	exit_vehicle = "{A} змусив {T} вийти з транспортного засобу.",
	exit_vehicle_help = "Змусити гравця вийти з транспортного засобу.",
	
	time_your = "Ваш загальний час: {V}.",
	time_player = "{T} загальний час: {V}.",
	time_help = "Перевірити час гравця.",
	
	admin_help = "Активувати режим адміністратора.",
	unadmin_help = "Вимкнути режим адміністратора.",

	buddha = "{A} увімкнув режим Будди для {T}.",
	buddha_help = "Зробити гравця(ів) невразливим(и), коли їх здоров'я досягає 1.",
	
	unbuddha = "{A} вимкнув режим Будди для {T}.",
	unbuddha_help = "Вимкнути режим Будди для гравця(ів).",
	
	give = "{A} дав {T} {V}.",
	give_help = "Дати гравцю(ям) зброю/об'єкт.",

	-- DarkRP Commands
	arrest = "{A} заарештував {T} назавжди.",
	arrest2 = "{A} заарештував {T} на {V} секунд.",
	arrest_help = "Заарештувати гравця(ів).",
	
	unarrest = "{A} випустив з тюрми {T}.",
	unarrest_help = "Впиустити з тюрьми гравця(ів).",
	
	setmoney = "{A} встановив гроші для {T} на {V}.",
	setmoney_help = "Встановити суму грошей для гравця.",
	
	addmoney = "{A} додав {V} для {T}.",
	addmoney_help = "Додати гроші для гравця.",
	
	door_invalid = "Невірні двері для продажу.",
	door_no_owner = "Ніхто не володіє цими дверима.",
	
	selldoor = "{A} продав двері/транспортний засіб для {T}.",
	selldoor_help = "Продати двері/транспортний засіб, на які ви дивитеся.",
	
	sellall = "{A} продав усі двері/транспортний засіб для {T}.",
	sellall_help = "Продати всі двері/транспортний засіб, що належать гравцеві.",
	
	s_jail_pos = "{A} встановив нову позицію для в’язниці.",
	setjailpos_help = "Скинути всі позиції в’язниць і встановити нову на вашій поточній позиції.",
	
	a_jail_pos = "{A} додав нову позицію для в’язниці.",
	addjailpos_help = "Додати нову позицію для в’язниці на вашій поточній локації.",
	
	setjob = "{A} змінив роботу для {T} на {V}.",
	setjob_help = "Змінити роботу гравця.",
	
	shipment = "{A} створив постачання {V}.",
	shipment_help = "Створити постачання.",
	
	forcename = "{A} змінив ім’я для {T} на {V}.",
	forcename_taken = "Ім'я вже зайнято. ({V})",
	forcename_help = "Примусово змінити ім’я гравця.",
	
	report_claimed = "{A} відповів на скаргу {T}.",
	report_closed = "{A} закрив скаргу, поданий {T}.",
	report_aclosed = "Вашу скаргу закрито. (Час минув)",
	
	rank_expired = "Ранг {V} для {T} закінчився.",
	
	-- TTT Commands
	setslays = "{A} встановив кількість автоматичних вбивств для {T} на {V}.",
	setslays_help = "Встановити кількість раундів для автоматичного вбивства гравця.",
	
	setslays_slayed = "{T} автоматично вбито, залишилось вбивств: {V}.",
	
	removeslays = "{A} зняв автоматичні вбивства для {T}.",
	removeslays_help = "Зняти автоматичні вбивства для гравця.",
	
	exitadminmode = "{A} вимкнув Адмін-мод.",
	enteradminmode = "{A} увімкнув Адмін-мод.",
	adminmode_help = "Увімкнути можливість літати та взаємодіяти з предметами.",
	--
	tellall_help = "Відправляє повідомлення на сервер",
	tellall = "{A} Написав оголошення: {T}."
}
--PATH addons/____sui/lua/includes/modules/sui.lua:
if sui then return end

AddCSLuaFile()

sui = {}

do
	local wspace_chs = {} -- whitespace  characters except a normal space " "
	for k, v in ipairs({0x0c, 0x0a, 0x0d, 0x09, 0x0b}) do
		wspace_chs[string.char(v)] = true
	end
	sui.wspace_chs = wspace_chs

	local cntrl_chs = {string.char(0x7f)} -- control characters
	for i = 0x00, 0x1f do
		cntrl_chs[string.char(i)] = true
	end
	sui.cntrl_chs = cntrl_chs
end

if SERVER then
	AddCSLuaFile("sui/libs/tdlib/cl_tdlib.lua")
	AddCSLuaFile("sui/libs/bshadows.lua")
	AddCSLuaFile("sui/libs/gif_loader.lua")
	AddCSLuaFile("sui/libs/png_encoder.lua")
	AddCSLuaFile("sui/libs/types.lua")
	AddCSLuaFile("sui/cl_base.lua")
else
	include("sui/libs/tdlib/cl_tdlib.lua")
	include("sui/libs/bshadows.lua")
	include("sui/libs/types.lua")
	include("sui/cl_base.lua")
end

if SERVER then
	for _, f in ipairs(file.Find("sui/vgui/*.lua", "LUA")) do
		AddCSLuaFile("sui/vgui/" .. f)
	end
end
--PATH addons/____sui/lua/sui/vgui/sui_scroll_panel.lua:
local math = math
local table = table

local pairs = pairs

local TDLib = sui.TDLib
local SUI, NAME = CURRENT_SUI, CURRENT_SUI.name
local RoundedBox = sui.TDLib.LibClasses.RoundedBox

local Panel = {}

AccessorFunc(Panel, "m_bFromBottom", "FromBottom", FORCE_BOOL)
AccessorFunc(Panel, "m_bVBarPadding", "VBarPadding", FORCE_NUMBER)

Panel:SetVBarPadding(0)

Panel.NoOverrideClear = true

-- VBar
local starting_scroll_speed = 3

local vbar_OnMouseWheeled = function(s, delta)
	s.scroll_speed = s.scroll_speed + 20 * 0.012 --[[ slowly increase scroll speed ]]
	s:AddScroll(delta * -s.scroll_speed)
end

-- default set scroll clamps amount
local vbar_SetScroll = function(s, amount)
	if not s.Enabled then s.Scroll = 0 return end

	s.scroll_target = amount
	s:InvalidateLayout()
end

-- ¯\_(ツ)_/¯ https://github.com/Facepunch/garrysmod/blob/cd3d894288b847e3d081570129963d4089e36261/garrysmod/lua/vgui/dvscrollbar.lua#L234
local vbar_OnCursorMoved = function(s, _, y)
	if s.Dragging then
		y = y - s.HoldPos
		y = y / (s:GetTall() - s:GetWide() * 2 - s.btnGrip:GetTall())
		s.scroll_target = y * s.CanvasSize
	end
end

local vbar_Think = function(s)
	local frame_time = RealFrameTime() * 17
	local scroll_target = s.scroll_target

	s.Scroll = Lerp(frame_time, s.Scroll, scroll_target)

	if not s.Dragging then
		s.scroll_target = Lerp(frame_time, scroll_target, math.Clamp(scroll_target, 0, s.CanvasSize))
	end

	-- now start slowing it down!!!
	s.scroll_speed = Lerp(frame_time / 10, s.scroll_speed, starting_scroll_speed)
end

local vbar_Paint = function(s, w, h)
	TDLib.RoundedBox(s.vertices, 3, 0, 0, w, h, SUI.GetColor("scroll"))
end

local vbarGrip_Paint = function(s, w, h)
	TDLib.RoundedBox(s.vertices, 3, 0, 0, w, h, SUI.GetColor("scroll_grip"))
end

local vbar_PerformLayout = function(s, w, h)
	local scroll = s:GetScroll() / s.CanvasSize
	local bar_size = math.max(s:BarScale() * h, 10)

	local track = (h - bar_size) + 1
	scroll = scroll * track

	s.btnGrip.y = scroll
	s.btnGrip:SetSize(w, bar_size)
end
--

function Panel:Init()
	local canvas = self:GetCanvas()
	canvas:SUI_TDLib()

	local children = {}
	function canvas:OnChildAdded(child)
		table.insert(children, child)
	end
	function canvas:OnChildRemoved(child)
		for i = 1, #children do
			local v = children[i]
			if v == child then
				table.remove(children, i)
				return
			end
		end
	end
	canvas.GetChildren = function()
		return children
	end
	canvas.children = children

	local vbar = self.VBar
	vbar:SetHideButtons(true)
	vbar.btnUp:SetVisible(false)
	vbar.btnDown:SetVisible(false)

	vbar.vertices = {}
	vbar.scroll_target = 0
	vbar.scroll_speed = starting_scroll_speed

	vbar.OnMouseWheeled = vbar_OnMouseWheeled
	vbar.SetScroll = vbar_SetScroll
	vbar.OnCursorMoved = vbar_OnCursorMoved
	vbar.Think = vbar_Think
	vbar.Paint = vbar_Paint
	vbar.PerformLayout = vbar_PerformLayout

	vbar.btnGrip.vertices = {}
	vbar.btnGrip.Paint = vbarGrip_Paint

	self:ScaleChanged()
	SUI.OnScaleChanged(self, self.ScaleChanged)
end

function Panel:OnChildAdded(child)
	self:AddItem(child)
	self:ChildAdded(child)
end

function Panel:ChildAdded()
end

function Panel:ScaleChanged()
	local w = SUI.Scale(4)

	self.VBar:SetWide(w)
	self.VBar.btnDown:SetSize(w, 0)
	self.VBar.btnUp:SetSize(w, 0)
end

function Panel:Paint(w, h)
	local outline = SUI.GetColor("scroll_panel_outline")
	if outline then
		TDLib.DrawOutlinedBox(3, 0, 0, w, h, SUI.GetColor("scroll_panel"), outline, 1)
	else
		RoundedBox(self, "Background", 3, 0, 0, w, h, SUI.GetColor("scroll_panel"))
	end
end

function Panel:ScrollToBottom()
	local vbar = self.VBar
	for k, anim in pairs(vbar.m_AnimList or {}) do
		anim:Think(vbar, 1)
		vbar.m_AnimList[k] = nil
	end

	self:InvalidateParent(true)
	self:InvalidateChildren(true)

	vbar:SetScroll(vbar.CanvasSize)
end

function Panel:PerformLayoutInternal(w, h)
	w = w or self:GetWide()
	h = h or self:GetTall()

	local canvas = self.pnlCanvas

	self:Rebuild()

	local vbar = self.VBar
	vbar:SetUp(h, canvas:GetTall())

	if vbar.Enabled then
		w = w - vbar:GetWide() - self.m_bVBarPadding
	end

	canvas:SetWide(w)

	self:Rebuild()
end

function Panel:Think()
	local canvas = self.pnlCanvas

	local vbar = self.VBar
	if vbar.Enabled then
		canvas.y = -vbar.Scroll
	else
		if self:GetFromBottom() then
			canvas._y = Lerp(10 * RealFrameTime(), canvas._y or canvas.y, self:GetTall() - canvas:GetTall())
		else
			canvas._y = Lerp(10 * RealFrameTime(), canvas._y or canvas.y, -vbar.Scroll)
		end
		canvas.y = canvas._y
	end
end

sui.register("ScrollPanel", Panel, "DScrollPanel")

--PATH addons/____sam/lua/sam/menu/tabs/bans.lua:
if SAM_LOADED then return end

local sam = sam
local SQL = sam.SQL
local SUI = sam.SUI
local netstream = sam.netstream

sam.permissions.add("manage_bans", nil, "superadmin")

local get_pages_count = function(bans_count)
	bans_count = bans_count / 35
	local i2 = math.floor(bans_count)
	return bans_count ~= i2 and i2 + 1 or bans_count
end

if SERVER then
	local check = function(ply)
		return ply:HasPermission("manage_bans") and ply:sam_check_cooldown("MenuManageBans", 0.1)
	end

	local limit = 35

	local get_page_count = function(res, callback, page, order_by, keyword)
		local current_time = os.time()
		local query = [[
			SELECT
				COUNT(`steamid`) AS `count`
			FROM
				`sam_bans`
			WHERE
				(`unban_date` >= %d OR `unban_date` = 0)]]

		query = query:format(current_time)

		if keyword then
			query = query .. " AND `steamid` LIKE " .. SQL.Escape("%" .. keyword .. "%")
		end

		SQL.Query(query, callback, true, {res, page, order_by, keyword, current_time})
	end

	local resolve_promise = function(data, arguments)
		local res = arguments[1]
		arguments[1] = data
		res(arguments)
	end

	local get_bans = function(count_data, arguments)
		local res, page, order_by, keyword, current_time = unpack(arguments)
		local count = count_data.count

		local current_page
		if page < 1 then
			page, current_page = 1, 1
		end

		local pages_count = get_pages_count(count)
		if page > pages_count then
			page, current_page = pages_count, pages_count
		end

		local query = [[
			SELECT
				`sam_bans`.*,
				IFNULL(`p1`.`name`, '') AS `name`,
				IFNULL(`p2`.`name`, '') AS `admin_name`
			FROM
				`sam_bans`
			LEFT OUTER JOIN
				`sam_players` AS `p1`
			ON
				`sam_bans`.`steamid` = `p1`.`steamid`
			LEFT OUTER JOIN
				`sam_players` AS `p2`
			ON
				`sam_bans`.`admin` = `p2`.`steamid`
			WHERE
				(`sam_bans`.`unban_date` >= %d OR `sam_bans`.`unban_date` = 0)]]

		query = query:format(current_time)

		if keyword then
			query = query .. " AND `sam_bans`.`steamid` LIKE " .. SQL.Escape("%" .. keyword .. "%")
		end

		local offset = math.abs(limit * (page - 1))
		query = query .. ([[
			ORDER BY
				`sam_bans`.`id` %s
			LIMIT
				%d OFFSET %d]]):format(order_by, limit, offset)

		SQL.Query(query, resolve_promise, nil, {res, count, current_page})
	end

	netstream.async.Hook("SAM.GetBans", function(res, ply, page, order_by, keyword)
		if not isnumber(page) then return end
		if order_by ~= "ASC" and order_by ~= "DESC" then return end
		if keyword ~= nil and not sam.isstring(keyword) then return end

		get_page_count(res, get_bans, page, order_by, keyword)
	end, check)

	return
end

local GetColor = SUI.GetColor
local Line = sui.TDLib.LibClasses.Line

local COLUMN_FONT = SUI.CreateFont("Column", "Roboto", 18)
local LINE_FONT = SUI.CreateFont("Line", "Roboto", 16)
local NEXT_FONT = SUI.CreateFont("NextButton", "Roboto", 18)

sam.menu.add_tab("https://raw.githubusercontent.com/Srlion/Addons-Data/main/icons/sam/ban-user.png", function(column_sheet)
	local refresh, pages
	local current_page, current_order, keyword = nil, "DESC", nil

	local bans_body = column_sheet:Add("Panel")
	bans_body:Dock(FILL)
	bans_body:DockMargin(0, 1, 0, 0)
	bans_body:DockPadding(10, 10, 10, 10)

	local toggle_loading, is_loading = sam.menu.add_loading_panel(bans_body)

	local title = bans_body:Add("SAM.Label")
	title:Dock(TOP)
	title:SetFont(SAM_TAB_TITLE_FONT)
	title:SetText("Bans")
	title:SetTextColor(GetColor("menu_tabs_title"))
	title:SizeToContents()

	local total = bans_body:Add("SAM.Label")
	total:Dock(TOP)
	total:DockMargin(0, 6, 0, 0)
	total:SetFont(SAM_TAB_DESC_FONT)
	total:SetText("60 total bans")
	total:SetTextColor(GetColor("menu_tabs_title"))
	total:SetPos(10, SUI.Scale(40))
	total:SizeToContents()

	do
		local container = bans_body:Add("SAM.Panel")
		container:Dock(TOP)
		container:DockMargin(0, 6, 10, 0)
		container:SetTall(30)

		local sort_order = container:Add("SAM.ComboBox")
		sort_order:Dock(RIGHT)
		sort_order:SetWide(96)
		sort_order:SetValue("Desc")
		sort_order:AddChoice("Desc")
		sort_order:AddChoice("Asc")

		function sort_order:OnSelect(_, value)
			value = value:upper()
			if current_order ~= value then
				current_order = value
				refresh()
			end
		end

		local search_entry = container:Add("SAM.TextEntry")
		search_entry:Dock(LEFT)
		search_entry:SetNoBar(true)
		search_entry:SetPlaceholder("Search...")
		search_entry:SetRadius(4)
		search_entry:SetWide(220)

		function search_entry:OnEnter()
			local value = self:GetValue()
			if keyword ~= value then
				keyword = value ~= "" and value or nil
				refresh()
			end
		end
	end

	Line(bans_body, nil, -5, 15, -5, 0)

	do
		local columns = bans_body:Add("Panel")
		columns:Dock(TOP)
		columns:DockMargin(0, 10, 0, 0)

		local info = columns:Add("SAM.Label")
		info:Dock(LEFT)
		info:DockMargin(4, 0, 0, 0)
		info:SetFont(COLUMN_FONT)
		info:SetText("Player")
		info:SetTextColor(GetColor("player_list_titles"))
		info:SetWide(SUI.Scale(280) + SUI.Scale(34))
		info:SizeToContentsY(3)

		local time_left = columns:Add("SAM.Label")
		time_left:Dock(LEFT)
		time_left:DockMargin(-4, 0, 0, 0)
		time_left:SetFont(COLUMN_FONT)
		time_left:SetText("Time Left")
		time_left:SetTextColor(GetColor("player_list_titles"))
		time_left:SetWide(SUI.Scale(180))
		time_left:SizeToContentsY(3)

		local reason = columns:Add("SAM.Label")
		reason:Dock(LEFT)
		reason:DockMargin(-4, 0, 0, 0)
		reason:SetFont(COLUMN_FONT)
		reason:SetText("Reason")
		reason:SetTextColor(GetColor("player_list_titles"))
		reason:SetWide(SUI.Scale(280))
		reason:SizeToContentsY(3)

		columns:SizeToChildren(false, true)
	end

	local body = bans_body:Add("SAM.ScrollPanel")
	body:Dock(FILL)
	body:DockMargin(0, 10, 0, 0)
	body:SetVBarPadding(6)

	local set_data = function(data)
		body:GetCanvas():Clear()
		body.VBar.Scroll = 0

		local bans, bans_count, current_page_2 = unpack(data)
		total:SetText(bans_count .. " total bans")

		pages = get_pages_count(bans_count)
		current_page.i = pages == 0 and 0 or current_page_2 or current_page.i
		current_page:SetText(current_page.i .. "/" .. pages)

		body:Line()

		for k, v in ipairs(bans) do
			local line = body:Add("SAM.PlayerLine")
			line:DockMargin(0, 0, 0, 10)

			local name = v.name ~= "" and v.name or nil
			local admin_name = v.admin_name ~= "" and v.admin_name or nil
			line:SetInfo({
				steamid = v.steamid,
				name = name,
				rank = admin_name or (v.admin == "Console" and "Console"),
				rank_bg = not admin_name and GetColor("player_list_console")
			})

			local unban_date = tonumber(v.unban_date)
			local time_left = line:Add("SAM.Label")
			time_left:Dock(LEFT)
			time_left:DockMargin(-3, 0, 0, 0)
			time_left:SetFont(LINE_FONT)
			time_left:SetText(unban_date == 0 and "Never" or sam.reverse_parse_length((unban_date - os.time()) / 60))
			time_left:SetTextColor(GetColor("player_list_data"))
			time_left:SetContentAlignment(4)
			time_left:SetWide(SUI.Scale(180))

			local reason = line:Add("SAM.Label")
			reason:Dock(LEFT)
			reason:DockMargin(4, 0, 0, 0)
			reason:SetFont(LINE_FONT)
			reason:SetText(v.reason)
			reason:SetTextColor(GetColor("player_list_data"))
			reason:SetContentAlignment(4)
			reason:SetWrap(true)
			reason:SetWide(SUI.Scale(200))

			local old_tall = line.size
			function reason:PerformLayout()
				local _, h = self:GetTextSize()
				if old_tall < h then
					line:SetTall(h)
				end
			end

			local but = line:Actions()
			but:On("DoClick", function()
				local dmenu = vgui.Create("SAM.Menu")
				dmenu:SetInternal(but)
				if name then
					dmenu:AddOption("Copy Name", function()
						SetClipboardText(name)
					end)
				end
				dmenu:AddOption("Copy SteamID", function()
					SetClipboardText(v.steamid)
				end)
				dmenu:AddOption("Copy Reason", function()
					SetClipboardText(v.reason)
				end)
				dmenu:AddOption("Copy Time Left", function()
					SetClipboardText(time_left:GetText())
				end)

				if v.admin ~= "Console" then
					dmenu:AddSpacer()

					if admin_name then
						dmenu:AddOption("Copy Admin Name", function()
							SetClipboardText(admin_name)
						end)
					end

					dmenu:AddOption("Copy Admin SteamID", function()
						SetClipboardText(v.admin)
					end)
				end

				if LocalPlayer():HasPermission("unban") then
					dmenu:AddSpacer()
					dmenu:AddOption("Unban", function()
						local user = name and ("%s (%s)"):format(name, v.steamid) or v.steamid
						local querybox = vgui.Create("SAM.QueryBox")
						querybox:SetWide(350)
						querybox:SetTitle(user)

						local check = querybox:Add("SAM.Label")
						check:SetText(sui.wrap_text("Are you sure that you want to unban\n" .. user, LINE_FONT, SUI.Scale(350)))
						check:SetFont(LINE_FONT)
						check:SizeToContents()

						querybox:Done()
						querybox.save:SetEnabled(true)
						querybox.save:SetText("UNBAN")

						querybox.save:SetContained(false)
						querybox.save:SetColors(GetColor("query_box_cancel"), GetColor("query_box_cancel_text"))

						querybox.cancel:SetContained(true)
						querybox.cancel:SetColors()

						querybox:SetCallback(function()
							RunConsoleCommand("sam", "unban", v.steamid)
						end)
					end)
				end
				dmenu:Open()
			end)

			body:Line()
		end

		body:InvalidateLayout(true)
		body:GetCanvas():InvalidateLayout(true)
	end

	refresh = function()
		if not is_loading() and LocalPlayer():HasPermission("manage_bans") then
			local refresh_query = netstream.async.Start("SAM.GetBans", toggle_loading, current_page.i, current_order, keyword)
			refresh_query:done(set_data)
		end
	end

	local bottom_panel = bans_body:Add("SAM.Panel")
	bottom_panel:Dock(BOTTOM)
	bottom_panel:DockMargin(0, 6, 0, 0)
	bottom_panel:SetTall(30)
	bottom_panel:Background(GetColor("page_switch_bg"))

	local previous_page = bottom_panel:Add("SAM.Button")
	previous_page:Dock(LEFT)
	previous_page:SetWide(30)
	previous_page:SetText("<")
	previous_page:SetFont(NEXT_FONT)

	previous_page:On("DoClick", function()
		if current_page.i <= 1 then return end

		current_page.i = current_page.i - 1
		refresh()
	end)

	current_page = bottom_panel:Add("SAM.Label")
	current_page:Dock(FILL)
	current_page:SetContentAlignment(5)
	current_page:SetFont(SAM_TAB_DESC_FONT)
	current_page:SetText("loading...")
	current_page.i = 1

	local next_page = bottom_panel:Add("SAM.Button")
	next_page:Dock(RIGHT)
	next_page:SetWide(30)
	next_page:SetText(">")
	next_page:SetFont(NEXT_FONT)

	next_page:On("DoClick", function()
		if current_page.i == pages then return end

		current_page.i = current_page.i + 1
		refresh()
	end)

	function bottom_panel:Think()
		next_page:SetEnabled(current_page.i ~= pages)
		previous_page:SetEnabled(current_page.i > 1)
	end

	for k, v in ipairs({"SAM.BannedPlayer", "SAM.BannedSteamID", "SAM.EditedBan", "SAM.UnbannedSteamID"}) do
		hook.Add(v, "SAM.MenuBans", function()
			if IsValid(body) then
				refresh()
			end
		end)
	end

	refresh()

	return bans_body
end, function()
	return LocalPlayer():HasPermission("manage_bans")
end, 4)
--PATH addons/____sam/lua/sam/menu/tabs/players.lua:
if SAM_LOADED then return end

local sam = sam
local SQL = sam.SQL
local SUI = sam.SUI
local netstream = sam.netstream

sam.permissions.add("manage_players", nil, "superadmin")

local get_pages_count = function(count)
	count = count / 35
	local i2 = math.floor(count)
	return count ~= i2 and i2 + 1 or count
end

if SERVER then
	local check = function(ply)
		return ply:HasPermission("manage_players") and ply:sam_check_cooldown("MenuViewPlayers", 0.1)
	end

	local limit = 35

	local get_page_count = function(callback, res, page, column, order_by, sort_by, keyword)
		local query = [[
			SELECT
				COUNT(`steamid`) AS `count`
			FROM
				`sam_players`]]
		if keyword then
			if column == "steamid" and sam.is_steamid64(keyword) then
				keyword = util.SteamIDFrom64(keyword)
			end

			query = string.format("%s WHERE `%s` LIKE %s", query, column, SQL.Escape("%" .. keyword .. "%"))
		end
		SQL.Query(query, callback, true, {res, page, column, order_by, sort_by, keyword})
	end

	local valid_columns = {
		steamid = true,
		name = true,
		rank = true
	}

	local valid_sorts = {
		id = true,
		name = true,
		rank = true,
		play_time = true,
		last_join = true
	}

	local resolve_promise = function(data, arguments)
		local res = arguments[1]
		arguments[1] = data
		res(arguments)
	end

	local get_players = function(count_data, arguments)
		local res, page, column, order_by, sort_by, keyword = unpack(arguments)
		local count = count_data.count

		local current_page
		if page < 1 then
			page, current_page = 1, 1
		end

		local pages_count = get_pages_count(count)
		if page > pages_count then
			page, current_page = pages_count, pages_count
		end

		local query = [[
			SELECT
				`steamid`,
				`name`,
				`rank`,
				`expiry_date`,
				`first_join`,
				`last_join`,
				`play_time`
			FROM
				`sam_players`
		]]

		local args = {}

		if keyword then
			args[1] = column
			args[2] = "%" .. keyword .. "%"

			query = query .. [[
				WHERE
					`{1f}` LIKE {2}
			]]
		end

		args[3] = sort_by
		if order_by == "DESC" then
			query = query .. [[
				ORDER BY `{3f}` DESC
			]]
		else
			query = query .. [[
				ORDER BY `{3f}` ASC
			]]
		end

		args[4] = limit
		args[5] = math.abs(limit * (page - 1))

		query = query .. [[
			LIMIT {4} OFFSET {5}
		]]

		SQL.FQuery(query, args, resolve_promise, false, {res, count, current_page})
	end

	netstream.async.Hook("SAM.GetPlayers", function(res, ply, page, column, order_by, sort_by, keyword)
		if not isnumber(page) then return end
		if not valid_columns[column] then return end
		if order_by ~= "ASC" and order_by ~= "DESC" then return end
		if not valid_sorts[sort_by] then return end
		if keyword ~= nil and not sam.isstring(keyword) then return end

		get_page_count(get_players, res, page, column, order_by, sort_by, keyword)
	end, check)

	return
end

local GetColor = SUI.GetColor
local Line = sui.TDLib.LibClasses.Line

local COLUMN_FONT = SUI.CreateFont("Column", "Roboto", 18)
local LINE_FONT = SUI.CreateFont("Line", "Roboto", 16)
local NEXT_FONT = SUI.CreateFont("NextButton", "Roboto", 18)

local button_click = function(s)
	local v = s.v

	local dmenu = vgui.Create("SAM.Menu")
	dmenu:SetInternal(s)
	if v.name and v.name ~= "" then
		dmenu:AddOption("Copy Name", function()
			SetClipboardText(v.name)
		end)
	end

	dmenu:AddOption("Copy SteamID", function()
		SetClipboardText(v.steamid)
	end)

	dmenu:AddOption("Copy Rank", function()
		SetClipboardText(v.rank)
	end)

	dmenu:AddOption("Copy Play Time", function()
		SetClipboardText(sam.reverse_parse_length(tonumber(v.play_time) / 60))
	end)

	dmenu:AddSpacer()

	dmenu:AddOption("Change Rank", function()
		local querybox = vgui.Create("SAM.QueryBox")
		querybox:SetTitle(string.format("Change rank for '%s'", v.name or v.steamid))
		querybox:SetWide(360)

		local ranks = querybox:Add("SAM.ComboBox")
		ranks:SetTall(28)

		for rank_name in SortedPairsByMemberValue(sam.ranks.get_ranks(), "immunity", true) do
			if v.rank ~= rank_name then
				ranks:AddChoice(rank_name, nil, true)
			end
		end

		querybox:Done()
		querybox.save:SetEnabled(true)

		querybox:SetCallback(function()
			RunConsoleCommand("sam", "setrankid", v.steamid, ranks:GetValue())
		end)
	end)

	dmenu:Open()
end

sam.menu.add_tab("https://raw.githubusercontent.com/Srlion/Addons-Data/main/icons/sam/user.png", function(column_sheet)
	local refresh, pages
	local current_page, current_column, current_order, current_sort, keyword = nil, "steamid", "DESC", "id", nil

	local players_body = column_sheet:Add("Panel")
	players_body:Dock(FILL)
	players_body:DockMargin(0, 1, 0, 0)
	players_body:DockPadding(10, 10, 10, 10)

	local toggle_loading, is_loading = sam.menu.add_loading_panel(players_body)

	local title = players_body:Add("SAM.Label")
	title:Dock(TOP)
	title:SetFont(SAM_TAB_TITLE_FONT)
	title:SetText("Players")
	title:SetTextColor(GetColor("menu_tabs_title"))
	title:SizeToContents()

	local total = players_body:Add("SAM.Label")
	total:Dock(TOP)
	total:DockMargin(0, 6, 0, 0)
	total:SetFont(SAM_TAB_DESC_FONT)
	total:SetText("60 total players")
	total:SetTextColor(GetColor("menu_tabs_title"))
	total:SetPos(10, SUI.Scale(40))
	total:SizeToContents()

	local search_entry
	do
		local container = players_body:Add("SAM.Panel")
		container:Dock(TOP)
		container:DockMargin(0, 6, 10, 0)
		container:SetTall(30)

		local sort_by = container:Add("SAM.ComboBox")
		sort_by:Dock(RIGHT)
		sort_by:DockMargin(4, 0, 0, 0)
		sort_by:SetWide(106)
		sort_by:SetValue("Sort By (ID)")
		sort_by:AddChoice("ID")
		sort_by:AddChoice("Name")
		sort_by:AddChoice("Rank")
		sort_by:AddChoice("Play Time")

		function sort_by:OnSelect(_, value)
			value = value:lower():gsub(" ", "_")
			if current_sort ~= value then
				current_sort = value
				refresh()
			end
		end

		local sort_order = container:Add("SAM.ComboBox")
		sort_order:Dock(RIGHT)
		sort_order:SetWide(96)
		sort_order:SetValue("Desc")
		sort_order:AddChoice("Desc")
		sort_order:AddChoice("Asc")

		function sort_order:OnSelect(_, value)
			value = value:upper()
			if current_order ~= value then
				current_order = value
				refresh()
			end
		end

		local column = container:Add("SAM.ComboBox")
		column:Dock(RIGHT)
		column:DockMargin(0, 0, 4, 0)
		column:SetWide(140)

		column:SetValue("Search (SteamID)")
		column:AddChoice("SteamID")
		column:AddChoice("Name")
		column:AddChoice("Rank")

		function column:OnSelect(_, value)
			value = value:lower()
			if current_column ~= value then
				current_column = value
				refresh()
			end
		end

		search_entry = container:Add("SAM.TextEntry")
		search_entry:Dock(LEFT)
		search_entry:SetNoBar(true)
		search_entry:SetPlaceholder("Search...")
		search_entry:SetRadius(4)
		search_entry:SetWide(220)

		function search_entry:OnEnter(no_refresh)
			local value = self:GetValue()
			if keyword ~= value then
				keyword = value ~= "" and value or nil
				if not no_refresh then
					refresh()
				end
			end
		end
	end

	Line(players_body, nil, -5, SUI.Scale(15), -5, 0)

	do
		local columns = players_body:Add("Panel")
		columns:Dock(TOP)
		columns:DockMargin(0, 10, 0, 0)

		local info = columns:Add("SAM.Label")
		info:Dock(LEFT)
		info:DockMargin(4, 0, 0, 0)
		info:SetFont(COLUMN_FONT)
		info:SetText("Player")
		info:SetTextColor(GetColor("player_list_titles"))
		info:SetWide(SUI.Scale(280) + SUI.Scale(34))
		info:SizeToContentsY(3)

		local play_time = columns:Add("SAM.Label")
		play_time:Dock(LEFT)
		play_time:DockMargin(-4, 0, 0, 0)
		play_time:SetFont(COLUMN_FONT)
		play_time:SetText("Play Time")
		play_time:SetTextColor(GetColor("player_list_titles"))
		play_time:SetWide(SUI.Scale(180))
		play_time:SizeToContentsY(3)

		local rank_expiry = columns:Add("SAM.Label")
		rank_expiry:Dock(LEFT)
		rank_expiry:DockMargin(-4, 0, 0, 0)
		rank_expiry:SetFont(COLUMN_FONT)
		rank_expiry:SetText("Rank Expiry")
		rank_expiry:SetTextColor(GetColor("player_list_titles"))
		rank_expiry:SetWide(SUI.Scale(280))
		rank_expiry:SizeToContentsY(3)

		columns:SizeToChildren(false, true)
	end

	local body = players_body:Add("SAM.ScrollPanel")
	body:Dock(FILL)
	body:DockMargin(0, 10, 0, 0)
	body:SetVBarPadding(6)

	local set_data = function(data)
		body:GetCanvas():Clear()
		body.VBar.Scroll = 0

		local players, players_count, current_page_2 = unpack(data)
		total:SetText(players_count .. " total players")

		pages = get_pages_count(players_count)
		current_page.i = pages == 0 and 0 or current_page_2 or current_page.i
		current_page:SetText(current_page.i .. "/" .. pages)

		body:Line()

		for k, v in ipairs(players) do
			local line = body:Add("SAM.PlayerLine")
			line:DockMargin(0, 0, 0, 10)

			local name = v.name ~= "" and v.name or nil
			line:SetInfo({
				steamid = v.steamid,
				name = name,
				rank = v.rank
			})

			local play_time = line:Add("SAM.Label")
			play_time:Dock(LEFT)
			play_time:DockMargin(4, 0, 0, 0)
			play_time:SetFont(LINE_FONT)
			play_time:SetText(sam.reverse_parse_length_vasilisk(tonumber(v.play_time) / 60))
			play_time:SetTextColor(GetColor("player_list_data"))
			play_time:SetContentAlignment(4)
			play_time:SetWide(SUI.Scale(180))

			local expiry_date = tonumber(v.expiry_date)
			local rank_expiry = line:Add("SAM.Label")
			rank_expiry:Dock(LEFT)
			rank_expiry:DockMargin(-3, 0, 0, 0)
			rank_expiry:SetFont(LINE_FONT)
			rank_expiry:SetText(expiry_date == 0 and "Never" or sam.reverse_parse_length((expiry_date - os.time()) / 60))
			rank_expiry:SetTextColor(GetColor("player_list_data"))
			rank_expiry:SetContentAlignment(4)
			rank_expiry:SizeToContents()

			local but = line:Actions()
			but.v = v
			but:On("DoClick", button_click)

			body:Line()
		end
	end

	refresh = function()
		if not is_loading() and LocalPlayer():HasPermission("manage_players") then
			search_entry:OnEnter(true)
			local refresh_query = netstream.async.Start("SAM.GetPlayers", toggle_loading, current_page.i, current_column, current_order, current_sort, keyword)
			refresh_query:done(set_data)
		end
	end

	local bottom_panel = players_body:Add("SAM.Panel")
	bottom_panel:Dock(BOTTOM)
	bottom_panel:DockMargin(0, 6, 0, 0)
	bottom_panel:SetTall(30)
	bottom_panel:Background(GetColor("page_switch_bg"))

	local previous_page = bottom_panel:Add("SAM.Button")
	previous_page:Dock(LEFT)
	previous_page:SetWide(30)
	previous_page:SetText("<")
	previous_page:SetFont(NEXT_FONT)

	previous_page:On("DoClick", function()
		if current_page.i <= 1 then return end

		current_page.i = current_page.i - 1
		refresh()
	end)

	current_page = bottom_panel:Add("SAM.Label")
	current_page:Dock(FILL)
	current_page:SetContentAlignment(5)
	current_page:SetFont(SAM_TAB_DESC_FONT)
	current_page:SetText("loading...")
	current_page.i = 1

	local next_page = bottom_panel:Add("SAM.Button")
	next_page:Dock(RIGHT)
	next_page:SetWide(30)
	next_page:SetText(">")
	next_page:SetFont(NEXT_FONT)

	next_page:On("DoClick", function()
		if current_page.i == pages then return end

		current_page.i = current_page.i + 1
		refresh()
	end)

	function bottom_panel:Think()
		next_page:SetEnabled(current_page.i ~= pages)
		previous_page:SetEnabled(current_page.i > 1)
	end

	do
		local refresh_2 = function()
			timer.Simple(1, refresh)
		end

		for k, v in ipairs({"SAM.AuthedPlayer", "SAM.ChangedPlayerRank", "SAM.ChangedSteamIDRank"}) do
			hook.Add(v, "SAM.MenuPlayers", refresh_2)
		end
	end

	refresh()

	return players_body
end, function()
	return LocalPlayer():HasPermission("manage_players")
end, 2)
--PATH addons/__________911emergencyresponse/lua/emergencyresponse/client/cl_functions.lua:
function EmergencyResponse:SendNotification( text, time )
	local timer = time
	emergencymodNotificationSave[#emergencymodNotificationSave + 1] = {
		text = text,
		wtime = CurTime() + 0.2,
		ytimer = CurTime() + 0.2 + 1 + timer,
	}
end

function EmergencyResponse:SlideTextDLabel( Base, font, text, x, y, xpos, ypos, color, time )
	Base = Base or ''
	font = font or 'Roboto'
	text = text or ''
	x = x or 100
	y = y or 100
	xpos = xpos or 0
	ypos = ypos or 0
	color = color or color_white
	time = time or 0
	local TimeSTOP = CurTime() + time
	local MeterString = string.len( text )
	local Label = vgui.Create( 'onyx.Label', Base )
	Label:SetPos( xpos, ypos )
	Label:SetSize( x, y )
	if time == 0 then
		Label:SetText( text )
	else
		Label:SetText( '' )
	end

	Label:SetWrap( true )
	Label:SetTextColor( color )
	Label:SetFont( font )
	function Label.Think()
		if Label:GetText() == text then return end
		local TimeLeft = TimeSTOP - CurTime()
		local StringSizeP1 = ( TimeLeft / ( time / 100 ) ) / 100
		local StringLong = 1 - StringSizeP1
		Label:SetText( string.sub( text, 0, MeterString * StringLong ) )
	end
	return Label
end

local col1 = Color( 230, 230, 230 )
local col2 = Color( 25, 25, 25 )
function EmergencyResponse:CreateGPSHUDPaint( vector, emergency )
	local gpsMatType = ''
	if emergency == 'Police' then
		gpsMatType = onyx.wimg.Simple( 'https://i.imgur.com/aA76rDh.png', 'smooth' )
	elseif emergency == 'medic' then
		gpsMatType = onyx.wimg.Simple( 'https://i.imgur.com/QGTniCX.png', 'smooth' )
	end

	if not rp.Team[LocalPlayer():Team()] or not rp.Team[LocalPlayer():Team()][emergency] then return end
	hook.Add( 'HUDPaint', 'EmergencyMod:GPSPoint:Callout', function()
		if not rp.Team[LocalPlayer():Team()] or not rp.Team[LocalPlayer():Team()][emergency] or not LocalPlayer():Alive() then return end
		local nearPosition = ''
		local callLocation = Vector( vector )
		local gpsPosition = ( callLocation + Vector( 0, 0, 100 ) ):ToScreen()
		local gpsDistance = math.Round( LocalPlayer():GetPos():Distance( callLocation ) / 20 )
		if gpsDistance < 150 then
			nearPosition = 'Поряд..'
		elseif gpsDistance > 150 and gpsDistance < 500 then
			nearPosition = 'Не дуже далеко..'
		elseif gpsDistance > 500 then
			nearPosition = 'Дуже далеко..'
		end

		timer.Simple( 120, function() hook.Remove( 'HUDPaint', 'EmergencyMod:GPSPoint:Callout' ) end )
		gpsMatType( gpsPosition.x - 20, gpsPosition.y - 45, 32, 32 )
		draw.SimpleTextOutlined( nearPosition, onyx.Font( 'Comfortaa@22' ), gpsPosition.x, gpsPosition.y, col1, 1, 1, 0, col2 )
	end )
end

function EmergencyResponse:GetPlayersInJob( id )
	local tupinambas = 0
	for _, v in ipairs( player.GetAll() ) do
		if rp.Team[v:Team()] and rp.Team[v:Team()][id] then tupinambas = tupinambas + 1 end
	end
	return tupinambas
end
--PATH addons/__________911emergencyresponse/lua/emergencyresponse/client/cl_victim_interface.lua:
local allPanicButtonFrames = allPanicButtonFrames or {}
local col1 = ColorAlpha( color_white, 200 )
local col3 = Color( 30, 30, 30 )
local c_RED = Color( 204, 19, 19 )
local c_GREEN = Color( 20, 187, 18 )
function EmergencyResponse:VictimSendEmergency( emergency )
	local x, y = 700, 400
	local rX, rY = ( ScrW() - x ) * 0.5, ( ScrH() - y ) * 0.5
	local UIEmergency = vgui.Create( 'onyx.Frame' )
	UIEmergency:SetSize( x, y )
	UIEmergency:SetPos( rX, rY )
	UIEmergency:SetTitle( 'Диспетчер: Добре, що сталося?' )
	UIEmergency:MakePopup()
	local UIMessage = vgui.Create( 'onyx.TextEntry', UIEmergency )
	UIMessage:SetSize( x * 0.9, y * 0.38 )
	UIMessage:SetPos( x * 0.05, y * 0.25 )
	UIMessage:SetMultiline( true )
	UIMessage:SetDrawLanguageID( false )
	UIMessage:SetFont( onyx.Font( 'Comfortaa@24' ) )
	UIMessage:SetTextColor( col1 )
	local UISend = vgui.Create( 'onyx.Button', UIEmergency )
	UISend:SetSize( UIMessage:GetWide(), y * 0.175 )
	UISend:SetPos( x * 0.05, y * 0.725 )
	UISend:SetText( 'Відправити' )
	UISend:SetFont( onyx.Font( 'Comfortaa@30' ) )
	UISend.Slide = 0
	UISend.OnCursorEntered = function( s )
		surface.PlaySound( 'emergencyresponse/callouts/buttons/blip.wav' )
		s.hover = true
	end

	function UISend.OnCursorExited( s )
		s.hover = false
	end

	UISend.DoClick = function()
		LocalPlayer().use112 = LocalPlayer().use112 or 0
		local nUse = LocalPlayer().use112
		local nTime = os.time()
		if nTime < nUse then return end
		if string.len( UIMessage:GetValue() ) < 4 then
			EmergencyResponse:SendNotification( 'Ви маєте написати причину!', 3 )
			LocalPlayer().use112 = nTime + 5
			return
		end

		UIEmergency:MoveTo( ScrW() * 3, rY, 0.2, 0, 1, function( _, s ) s:Remove() end )
		net.Start( 'EmergencyDispatch:DispatchCallout:ServerReception' )
		net.WriteString( emergency )
		net.WriteString( UIMessage:GetValue() )
		net.SendToServer()
		EmergencyResponse:SendNotification( 'Запит успішно прийнято, служби виїхали!', 3 )
	end
end

function EmergencyResponse:CreateVictimInterface( bool, text )
	--
	local x, y = 700, 425
	local rX, rY = ( ScrW() - x ) * 0.5, ( ScrH() - ( y - 100 ) ) * 0.5
	local FrameUI = vgui.Create( 'onyx.Frame' )
	FrameUI:SetSize( x, y - 100 )
	FrameUI:SetPos( ScrW() * 3, rY )
	FrameUI:MoveTo( rX, rY, 0.2, 0, 1, function() surface.PlaySound( 'garrysmod/balloon_pop_cute.wav' ) end )
	FrameUI:SetTitle( 'Диспетчер: Служба порятунку, що сталося?' )
	FrameUI:MakePopup()
	local serverEmergencyServices = { 'Поліція', 'Медична служба' }
	timer.Simple( 0.65, function()
		if not IsValid( FrameUI ) then return end
		local TimeSTOP = CurTime() + 5
		local DScrollPanel = vgui.Create( 'onyx.Panel', FrameUI )
		DScrollPanel:SetSize( x * 0.9, 0 )
		DScrollPanel:SetPos( x * 0.05, y * 0.15 )
		DScrollPanel.Paint = nil
		function DScrollPanel.Think()
			if CurTime() > TimeSTOP then return end
			local TimeLeft = TimeSTOP - CurTime()
			local PanelSizeP1 = ( TimeLeft / ( 5 / 100 ) ) / 100
			local PanelLong = 1 - PanelSizeP1
			DScrollPanel:SetSize( x * 0.9, y * 5 * PanelLong )
		end

		for k, v in ipairs( serverEmergencyServices ) do
			local mat_Services = k == 1 and onyx.wimg.Simple( 'https://i.imgur.com/QHqrGVS.png', 'smooth' ) or k == 2 and onyx.wimg.Simple( 'https://i.imgur.com/6Y3P7sh.png', 'smooth' )
			local SPanel = vgui.Create( 'onyx.Panel', DScrollPanel )
			SPanel:SetSize( x * 0.9, y * 0.2 )
			SPanel:Dock( TOP )
			SPanel:DockMargin( 10, 10, 10, 10 )
			function SPanel.Paint( s, w, h )
				draw.RoundedBox( 2, 0, 0, w, h, col3 )
				mat_Services( SPanel:GetWide() * 0.01, SPanel:GetTall() - 75, 75, 75 )
				draw.SimpleText( string.upper( v ), onyx.Font( 'Comfortaa@30' ), w * 0.15, s:GetTall() * 0.2, EmergencyDispatch.ColorsConfiguration.TitlesFramesColors, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
			end

			local SDesc = vgui.Create( 'onyx.Label', SPanel )
			SDesc:SetSize( x * 0.6, y * 0.1 )
			SDesc:SetPos( SPanel:GetWide() * 0.1475, SPanel:GetTall() * 0.475 )
			SDesc:SetFont( onyx.Font( 'Comfortaa@24' ) )
			local id
			if v == 'Поліція' then
				id = 'Police'
			elseif v == 'Медична служба' then
				id = 'medic'
			end

			SDesc:SetText( 'Доступно: ' .. EmergencyResponse:GetPlayersInJob( id ) )
			SDesc.Status = EmergencyResponse:GetPlayersInJob( id )
			SDesc:SetTextColor( SDesc.Status > 0 and c_GREEN or c_RED )
			local SChoice = vgui.Create( 'onyx.Button', SPanel )
			SChoice:SetSize( SPanel:GetWide() * 0.21, SPanel:GetTall() * 0.5 )
			SChoice:SetPos( SPanel:GetWide() * 0.93 - SChoice:GetWide(), y * 0.05 )
			SChoice:SetFont( onyx.Font( 'Comfortaa@30' ) )
			SChoice.Slide = 0
			if SDesc.Status > 0 then
				function SChoice.OnCursorEntered( s )
					s.hover = true
					surface.PlaySound( 'emergencyresponse/callouts/buttons/blip.wav' )
				end

				function SChoice.OnCursorExited( s )
					s.hover = false
				end

				SChoice:SetText( 'Виберіть' )
			else
				SChoice:SetDisabled( true )
				SChoice:SetText( 'N/A' )
			end

			function SChoice.DoClick()
				if SDesc.Status > 0 then
					FrameUI:Remove()
					local vibor = 'Police'
					if v == 'Поліція' then
						vibor = 'Police'
					elseif v == 'Медична служба' then
						vibor = 'medic'
					end

					if bool and string.len( text ) > 3 then
						net.Start( 'EmergencyDispatch:DispatchCallout:ServerReception' )
						net.WriteString( vibor )
						net.WriteString( text )
						net.SendToServer()
						EmergencyResponse:SendNotification( 'Запит успішно прийнято, служби виїхали!', 3 )
					else
						EmergencyResponse:VictimSendEmergency( vibor )
					end
				end
			end
		end
	end )
end

net.Receive( 'EmergencyDispatch:DispatchCallout:VictimMenu', function()
	local bool = net.ReadBool()
	EmergencyResponse:SendNotification( 'З\'єднання з диспетчером, зачекайте...', 6 )
	timer.Simple( 7, function()
		if not bool then
			EmergencyResponse:SendNotification( 'З\'єднання неможливо встановити, спробуйте ще раз пізніше.', 6 )
			return
		end

		EmergencyResponse:CreateVictimInterface( false, nil )
	end )
end )
--PATH addons/____sprinter/lua/s_printer/integration/sh_cartrunk.lua:
hook.Add("PostGamemodeLoaded", "sP:CarTrunkIntegration", function()
    if CarTrunk and CarTrunk.Config then
        CarTrunk.Config.SpecificEntities["sprinter_rack"] = {
            isBlacklisted = true,
        }
    end
end)
--PATH addons/____sprinter/lua/s_printer/languages/sh_german.lua:
if CLIENT then
    slib.setLang("sprinter", "de", "main", "Main")
    slib.setLang("sprinter", "de", "logs", "Logs")
    slib.setLang("sprinter", "de", "upgrades", "Verbesserungen")
    slib.setLang("sprinter", "de", "settings", "Einstellungen")
    slib.setLang("sprinter", "de", "overclocking", "Übertakten")
    slib.setLang("sprinter", "de", "noisereduction", "Lärmdämmung")
    slib.setLang("sprinter", "de", "dmgresistance", "Schadensresistenz")
    slib.setLang("sprinter", "de", "notifications", "Notifications")

    slib.setLang("sprinter", "de", "notify-withdraw", "Beim Abheben benachrichtigen")
    slib.setLang("sprinter", "de", "notify-on-damage", "Bei Beschädigung benachrichtigen")
    slib.setLang("sprinter", "de", "notify-low-hp", "Bei niedrigen HP benachrichtigen")
    slib.setLang("sprinter", "de", "notify-low-battery", "Bei schwacher Batterie benachrichtigen")

    slib.setLang("sprinter", "de", "withdrawn-money", "Geld abgehoben")
    slib.setLang("sprinter", "de", "received-damage", "Schaden Erhalten")
    slib.setLang("sprinter", "de", "upgraded-printer", "Drucker Verbessert")
    slib.setLang("sprinter", "de", "turned-on", "Eingeschaltet")
    slib.setLang("sprinter", "de", "turned-off", "Ausgeschaltet")

    slib.setLang("sprinter", "de", "are-you-sure", "Bist du sicher?")
    slib.setLang("sprinter", "de", "this-will-cost", "Dies kostet %s")

    slib.setLang("sprinter", "de", "nothing-to-show", "Hier gibt es nichts zu sehen")

    slib.setLang("sprinter", "de", "condition", "Zustand")
    slib.setLang("sprinter", "de", "temperature", "Temperatur")
    slib.setLang("sprinter", "de", "clockspeed", "Taktfrequenz")
    slib.setLang("sprinter", "de", "income", "Einkommen(min)")
    slib.setLang("sprinter", "de", "eject", "Auswerfen")
    slib.setLang("sprinter", "de", "withdraw", "Abheben")
    slib.setLang("sprinter", "de", "repair", "Reparieren")
    slib.setLang("sprinter", "de", "recharge", "Aufladen")

    slib.setLang("sprinter", "de", "empty", "Leer")
else
    slib.setLang("sprinter", "de", "upgraded", "Du hast einen Drucker für %s aktualisiert")
    slib.setLang("sprinter", "de", "recharged", "Du hast einen Drucker für %s aufgeladen")
    slib.setLang("sprinter", "de", "repaired", "Du hast einen Drucker für %s repariert")
    slib.setLang("sprinter", "de", "repaired-rack", "Du hast einen Schrank für %s repariert")
    slib.setLang("sprinter", "de", "withdrawn", "Du hast %s Abgehoben")
    slib.setLang("sprinter", "de", "recharged-all", "Du hast jeden Drucker in diesem Schrank für %s aufgeladen")
    slib.setLang("sprinter", "de", "recharged-this-many", "Du hast %s Drucker in diesem Schrank für %s aufgeladen")
    slib.setLang("sprinter", "de", "repaired-all", "Du hast jeden Drucker in diesem Schrank für %s repariert")
    slib.setLang("sprinter", "de", "repaired-this-many", "Du hast %s Drucker in diesem Schrank für %s repariert")
    slib.setLang("sprinter", "de", "no-eject-space", "Es ist kein Platz zum Auswerfen des Druckers vorhanden")
    slib.setLang("sprinter", "de", "printer-was-damaged", "Dein %s Drucker wurde beschädigt!")
    slib.setLang("sprinter", "de", "printer-low-hp", "Dein %s Drucker hat wenig HP!")
    slib.setLang("sprinter", "de", "someone-has-withdrawn", "Jemand hat Geld von deinem %s Drucker abgehoben!")
    slib.setLang("sprinter", "de", "battery-low", "Dein %s Drucker hat einen niedrigen Akku. Du solltest ihn aufladen!")
    slib.setLang("sprinter", "de", "rewarded-on-destroy", "Du hast %s als Belohnung für die Zerstörung eines Druckers erhalten!")
end

slib.setLang("sprinter", "de", "rack", "Drucker Schrank")
slib.setLang("sprinter", "de", "insufficient-permissions", "Du hast dazu unzureichende Berechtigungen!")
--PATH addons/____sprinter/lua/s_printer/screens/cl_sidescreen.lua:
local margin, accent_col, successcolor, main_col, shade_10, shade_min10, text_col, text_colmin40, white = 8, slib.getTheme("accentcolor"), slib.getTheme("successcolor"), slib.getTheme("maincolor"), slib.getTheme("maincolor", 10), slib.getTheme("maincolor", -10), slib.getTheme("textcolor"), slib.getTheme("textcolor", -40), Color(255,255,255)
local cursor, money, income, temperature, clockspeed, withdraw, eject, repair_ico = Material("sprinter/cursor.png", "smooth"), Material("sprinter/money.png", "smooth"), Material("sprinter/income.png", "smooth"), Material("sprinter/temperature.png", "smooth"), Material("sprinter/chip.png", "smooth"), Material("sprinter/withdraw.png", "smooth"), Material("sprinter/eject.png", "smooth"), Material("sprinter/repair.png", "smooth")
local stats = {}

local function addSplitterFrame(parent)
    local frame = vgui.Create("EditablePanel", parent)
    frame:Dock(TOP)
    frame:SetTall(80)
    frame:DockPadding(0,0,0,margin)

    frame.ResizeChilds = function()
        for k,v in pairs(stats[frame]) do
            k.Resize()
        end
    end

    frame.OnSizeChanged = function(width)
        frame.ResizeChilds()
    end

    return frame
end

local function addStatToParent(ent, parent, icon, title, amount, prefix, suffix, identifier, lerpmultiplier)
    stats[parent] = stats[parent] or {}

    local stat = vgui.Create("EditablePanel", parent)
    stat:Dock(LEFT)
    stat:SetWide(50)
    stat.val = ""
    if table.Count(stats[parent]) < 1 then
        stat:DockMargin(0,0,margin,0)
    end

    stat.updateNum = function()
        stat.val = isfunction(amount) and amount() or amount
        stat.title = isfunction(title) and title() or title

        if isnumber(stat.val) then
            stat.val = slib.lerpNum(stat.title..tostring(icon)..identifier, stat.val, lerpmultiplier or 1)
            stat.val = string.Comma(stat.val)
        end
    end

    stat.Paint = function(s,w,h)
        if ent:drawingOverlay() then return end
        surface.SetDrawColor(shade_min10)
        surface.DrawRect(0,0,w,h)

        surface.SetDrawColor(shade_10)
        surface.DrawRect(0,0,h,h)

        surface.SetDrawColor(accent_col)
        surface.SetMaterial(icon)
        local iconsize = h * .7
        surface.DrawTexturedRect( h * .5 - iconsize * .5, h * .5 - iconsize * .5, iconsize, iconsize )

        local workarea = w - h
        s.updateNum()
        
        draw.SimpleText((prefix and prefix or "")..s.val..(suffix and suffix or ""), slib.createFont("NasalizationRg-Regular", 38, nil, true), h + margin, margin * .5, text_col, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
        draw.SimpleText(s.title, slib.createFont("NasalizationRg-Regular", 26, nil, true), h + margin, h - margin * .5, text_colmin40, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
    end

    stat.Resize = function()
        stat:SetWide(parent:GetWide() / math.Clamp(table.Count(stats[parent]), 1, 99) - (margin / table.Count(stats[parent])))
    end

    stats[parent][stat] = true

    parent.ResizeChilds()
end

sPrinter.drawSideScreen = function(ent, opacity)
    if !IsValid(ent.sideScreen) then
        ent.sideScreen = vgui.Create("EditablePanel")
        ent.sideScreen:SetSize(630, 263)
        ent.sideScreen:DockPadding(margin,margin + 45,margin,margin)
        ent.sideScreen:SetPaintedManually(true)

        local hookName = "sP:DisableScreen_"..ent:EntIndex()
        hook.Add("sP:MouseEnabled", hookName, function(enabled)
            if !IsValid(ent) or !IsValid(ent.sideScreen) then hook.Remove("sP:MouseEnabled", hookName) return end

            ent.sideScreen:SetMouseInputEnabled(!enabled)
        end)

        ent.sideScreen.Paint = function(s,w,h)
            surface.SetDrawColor(main_col)
            surface.DrawRect(0,0,w,h)
        end

        ent.sideScreen.PaintOver = function(s,w,h)
            if ent:GetLocked() then
                sPrinter.DrawLocked(w,h)
            end


            sPrinter.DrawCursor(w, h, ent, 20)
        end

        sPrinter.addTopbar(ent.sideScreen, ent)

        local mainstats = addSplitterFrame(ent.sideScreen)
        addStatToParent(ent, mainstats, money, function() return "/"..string.Comma(ent:GetMaxStorage()) end, function() return ent:GetWithdrawAmount() end, sPrinter.config["currency"], nil,tostring(function() end))
        addStatToParent(ent, mainstats, income, slib.getLang("sprinter", sPrinter.config["language"], "income"), function() local clockspeed = ent:GetUpgrade("overclocking") return (ent.data.baseincome * (clockspeed + ent.data.clockspeed)) * 6 end, "+", nil, tostring(function() end))

        local miscstats = addSplitterFrame(ent.sideScreen)
        addStatToParent(ent, miscstats, clockspeed, slib.getLang("sprinter", sPrinter.config["language"], "clockspeed"), function() local clockspeed = ent:GetUpgrade("overclocking") return ent.data.clockspeed + clockspeed end, nil, " Ghz", tostring(function() end))
        addStatToParent(ent, miscstats, temperature, slib.getLang("sprinter", sPrinter.config["language"], "temperature"), function() return ent:GetTemperature() end, nil, "°", tostring(function() end), .1)

        local buttons = vgui.Create("EditablePanel", ent.sideScreen)
        buttons:Dock(FILL)

        sPrinter.addButton(buttons, ent, slib.getLang("sprinter", sPrinter.config["language"], "withdraw"), function() net.Start("sP:Networking") net.WriteEntity(ent) net.WriteUInt(1,3) net.WriteUInt(1,2) net.SendToServer() end, withdraw, RIGHT)
        sPrinter.addButton(buttons, ent, slib.getLang("sprinter", sPrinter.config["language"], "eject"), function() net.Start("sP:Networking") net.WriteEntity(ent) net.WriteUInt(1,3) net.WriteUInt(2,2) net.SendToServer() end, eject, RIGHT, margin, function() return IsValid(ent:GetRack()) end)
        
        local condition = vgui.Create("EditablePanel", buttons)
        condition:Dock(FILL)
        condition:DockMargin(0,0,margin,0)

        condition.Paint = function(s,w,h)
            if ent:drawingOverlay() then return end

            surface.SetDrawColor(shade_10)
            surface.DrawRect(0, 0, w, h)
            
            local statusbarx, statusbary, statusbarw, statusbarh = margin + (h * .8) + margin, h * .10, w - ((h * .8) + margin) - margin - 3, 20

            surface.SetDrawColor(main_col)
            surface.DrawRect(statusbarx, statusbary, statusbarw, statusbarh)

            surface.SetDrawColor(successcolor)
            surface.DrawRect(statusbarx, statusbary, statusbarw * (ent:Health() / 100), statusbarh)

            draw.SimpleText(math.Round(ent:Health()).."%", slib.createFont("NasalizationRg-Regular", 22, nil, true), statusbarx + 3, statusbary + statusbarh * .5, white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

            draw.SimpleText(slib.getLang("sprinter", sPrinter.config["language"], "condition"), slib.createFont("NasalizationRg-Regular", 17, nil, true), margin + (h * .8) + margin, h * .3 + 12, text_colmin40, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
        end

        local repair = vgui.Create("SButton", condition)
        repair.Paint = function(s,w,h)
            if ent:drawingOverlay() then return end
            if s.Hovered and !sPrinter.ShouldDraw(ent) then s.Hovered = false end
            surface.SetDrawColor(slib.lerpColor(s, s.Hovered and accent_col or white))
            surface.SetMaterial(repair_ico)
            local iconsize = h * .8
            surface.DrawTexturedRect(margin, h * .5 - iconsize * .5, iconsize, iconsize)
        end

        repair.DoClick = function()
            surface.PlaySound("buttons/button15.wav")
            
            sPrinter.MakePopup(ent, ent.sideScreen, slib.getLang("sprinter", sPrinter.config["language"], "this-will-cost", sPrinter.config["currency"]..string.Comma(ent.data.repairprice)), function()
                net.Start("sP:Networking")
                net.WriteEntity(ent)
                net.WriteUInt(2,3)
                net.WriteUInt(2,2)
                net.SendToServer()
            end)
        end

        condition.OnSizeChanged = function(s,w,h)
            repair:SetSize(h,h)
        end

        return
    else
        ent.sideScreen:SetAlpha(opacity)
    end

    local pos = ent:LocalToWorld(Vector(-22.83, -0.080310, 3.837402))
	local ang = ent:LocalToWorldAngles(Angle(0,0,90))

	vgui.Start3D2DS( pos, ang, .03 )
        ent.sideScreen:SPaint3D2D(ent)
    vgui.End3D2DS()
end
--PATH addons/____plogs/lua/autorun/ui_init.lua:
--[[
addons/lgos/lua/autorun/ui_init.lua
--]]

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


--PATH addons/xenin_the_xenin_framework_1900562881/lua/xeninui/libs/animations.lua:
local PNL = FindMetaTable("Panel")

function PNL:LerpColor(var, to, duration, callback)
	if (!duration) then duration = XeninUI.TransitionTime end

	local color = self[var]
	local anim = self:NewAnimation(duration)
	anim.Color = to
	anim.Think = function(anim, pnl, fract)
		local newFract = XeninUI:Ease(fract, 0, 1, 1)

		if (!anim.StartColor) then
			anim.StartColor = color
		end

		local newColor = XeninUI:LerpColor(newFract, anim.StartColor, anim.Color)
		self[var] = newColor
	end
	anim.OnEnd = function()
		if callback then
			callback(self)
		end
	end
end

function PNL:LerpVector(var, to, duration, callback)
	if (!duration) then duration = XeninUI.TransitionTime end

	local vector = self[var]
	local anim = self:NewAnimation(duration)
	anim.Vector = to
	anim.Think = function(anim, pnl, fract)
		local newFract = XeninUI:Ease(fract, 0, 1, 1)

		if (!anim.StartVector) then
			anim.StartVector = vector
		end

		local newColor = XeninUI:LerpVector(newFract, anim.StartVector, anim.Vector)
		self[var] = newColor
	end
	anim.OnEnd = function()
		if callback then
			callback(self)
		end
	end
end

function PNL:LerpAngle(var, to, duration, callback)
	if (!duration) then duration = XeninUI.TransitionTime end

	local angle = self[var]
	local anim = self:NewAnimation(duration)
	anim.Angle = to
	anim.Think = function(anim, pnl, fract)
		local newFract = XeninUI:Ease(fract, 0, 1, 1)

		if (!anim.StartAngle) then
			anim.StartAngle = angle
		end

		local newColor = XeninUI:LerpAngle(newFract, anim.StartAngle, anim.Angle)
		self[var] = newColor
	end
	anim.OnEnd = function()
		if callback then
			callback(self)
		end
	end
end

function PNL:EndAnimations()
	for i, v in pairs(self.m_AnimList or {}) do
		if v.OnEnd then v:OnEnd(self)end
		self.m_AnimList[i] = nil
	end
end

function PNL:Lerp(var, to, duration, callback)
	if (!duration) then duration = XeninUI.TransitionTime end

	local varStart = self[var]
	local anim = self:NewAnimation(duration)
	anim.Goal = to
	anim.Think = function(anim, pnl, fract)
		local newFract = XeninUI:Ease(fract, 0, 1, 1)

		if (!anim.Start) then
			anim.Start = varStart
		end

		local new = Lerp(newFract, anim.Start, anim.Goal)
		self[var] = new
	end
	anim.OnEnd = function()
		if callback then
			callback(self)
		end
	end
end

function PNL:LerpMove(x, y, duration, callback)
	if (!duration) then duration = XeninUI.TransitionTime end

	local anim = self:NewAnimation(duration)
	anim.Pos = Vector(x, y)
	anim.Think = function(anim, pnl, fract)
		local newFract = XeninUI:Ease(fract, 0, 1, 1)

		if (!anim.StartPos) then
			anim.StartPos = Vector(pnl.x, pnl.y, 0)
		end

		local new = LerpVector(newFract, anim.StartPos, anim.Pos)
		self:SetPos(new.x, new.y)
	end
	anim.OnEnd = function()
		if callback then
			callback(self)
		end
	end
end

function PNL:LerpMoveY(y, duration, callback)
	if (!duration) then duration = XeninUI.TransitionTime end

	local anim = self:NewAnimation(duration)
	anim.Pos = y
	anim.Think = function(anim, pnl, fract)
		local newFract = XeninUI:Ease(fract, 0, 1, 1)

		if (!anim.StartPos) then
			anim.StartPos = pnl.y
		end

		local new = Lerp(newFract, anim.StartPos, anim.Pos)
		self:SetPos(pnl.x, new)
	end
	anim.OnEnd = function()
		if callback then
			callback(self)
		end
	end
end

function PNL:LerpMoveX(x, duration, callback)
	if (!duration) then duration = XeninUI.TransitionTime end

	local anim = self:NewAnimation(duration)
	anim.Pos = x
	anim.Think = function(anim, pnl, fract)
		local newFract = XeninUI:Ease(fract, 0, 1, 1)

		if (!anim.StartPos) then
			anim.StartPos = pnl.x
		end

		local new = Lerp(newFract, anim.StartPos, anim.Pos)
		self:SetPos(new, pnl.y)
	end
	anim.OnEnd = function()
		if callback then
			callback(self)
		end
	end
end

function PNL:LerpHeight(height, duration, callback, easeFunc)
	if (!duration) then duration = XeninUI.TransitionTime end
	if (!easeFunc) then easeFunc = function(a, b, c, d)
			return XeninUI:Ease(a, b, c, d)end end

	local anim = self:NewAnimation(duration)
	anim.Height = height
	anim.Think = function(anim, pnl, fract)
		local newFract = easeFunc(fract, 0, 1, 1)

		if (!anim.StartHeight) then
			anim.StartHeight = pnl:GetTall()
		end

		local new = Lerp(newFract, anim.StartHeight, anim.Height)
		self:SetTall(new)
	end
	anim.OnEnd = function()
		if callback then
			callback(self)
		end
	end
end

function PNL:LerpWidth(width, duration, callback, easeFunc)
	if (!duration) then duration = XeninUI.TransitionTime end
	if (!easeFunc) then easeFunc = function(a, b, c, d)
			return XeninUI:Ease(a, b, c, d)end end

	local anim = self:NewAnimation(duration)
	anim.Width = width
	anim.Think = function(anim, pnl, fract)
		local newFract = easeFunc(fract, 0, 1, 1)

		if (!anim.StartWidth) then
			anim.StartWidth = pnl:GetWide()
		end

		local new = Lerp(newFract, anim.StartWidth, anim.Width)
		self:SetWide(new)
	end
	anim.OnEnd = function()
		if callback then
			callback(self)
		end
	end
end

function PNL:LerpSize(w, h, duration, callback)
	if (!duration) then duration = XeninUI.TransitionTime end

	local anim = self:NewAnimation(duration)
	anim.Size = Vector(w, h)
	anim.Think = function(anim, pnl, fract)
		local newFract = XeninUI:Ease(fract, 0, 1, 1)

		if (!anim.StartSize) then
			anim.StartSize = Vector(pnl:GetWide(), pnl:GetWide(), 0)
		end

		local new = LerpVector(newFract, anim.StartSize, anim.Size)
		self:SetSize(new.x, new.y)
	end
	anim.OnEnd = function()
		if callback then
			callback()
		end
	end
end

--PATH addons/xenin_the_xenin_framework_1900562881/lua/xeninui/libs/promises.lua:
local M = {}

local deferred = {}
deferred.__index = deferred

local PENDING = 0
local RESOLVING = 1
local REJECTING = 2
local RESOLVED = 3
local REJECTED = 4

local function finish(deferred, state)
	state = state or REJECTED
	for i, f in ipairs(deferred.queue) do
		if state == RESOLVED then
			f:resolve(deferred.value)
		else
			f:reject(deferred.value)
		end
	end
	deferred.state = state
end

local function isfunction(f)
	if type(f) == 'table' then
		local mt = getmetatable(f)
		return mt ~= nil and type(mt.__call) == 'function'
	end
	return type(f) == 'function'
end

local function promise(deferred, next, success, failure, nonpromisecb)
	if type(deferred) == 'table' and type(deferred.value) == 'table' and isfunction(next) then
		local called = false
		local ok, err = pcall(next, deferred.value, function(v)
			if called then return end
			called = true
			deferred.value = v
			success()
		end, function(v)
			if called then return end
			called = true
			deferred.value = v
			failure()
		end)
		if not ok and not called then
			deferred.value = err
			failure()
		end
	else
		nonpromisecb()
	end
end

local function fire(deferred)
	local next
	if type(deferred.value) == 'table' then
		next = deferred.value.next
	end
	promise(deferred, next, function()
		deferred.state = RESOLVING
		fire(deferred)
	end, function()
		deferred.state = REJECTING
		fire(deferred)
	end, function()
		local ok
		local v
		if deferred.state == RESOLVING and isfunction(deferred.success) then
			ok, v = pcall(deferred.success, deferred.value)
		elseif deferred.state == REJECTING and isfunction(deferred.failure) then
			ok, v = pcall(deferred.failure, deferred.value)
			if ok then
				deferred.state = RESOLVING
			end
		end

		if ok ~= nil then
			if ok then
				deferred.value = v
			else
				deferred.value = v
				return finish(deferred)
			end
		end

		if deferred.value == deferred then
			deferred.value = pcall(error, 'resolving promise with itself')
			return finish(deferred)
		else
			promise(deferred, next, function()
				finish(deferred, RESOLVED)
			end, function(state)
				finish(deferred, state)
			end, function()
				finish(deferred, deferred.state == RESOLVING and RESOLVED)
			end)
		end
	end)
end

local function resolve(deferred, state, value)
	if deferred.state == 0 then
		deferred.value = value
		deferred.state = state
		fire(deferred)
	end
	return deferred
end




function deferred:resolve(value)
	return resolve(self, RESOLVING, value)
end

function deferred:reject(value)
	return resolve(self, REJECTING, value)
end





function M.new(options)
	if isfunction(options) then
		local d = M.new()
		local ok, err = pcall(options, d)
		if not ok then
			d:reject(err)
		end
		return d
	end
	options = options or {}
	local d
	d = {
		next = function(self, success, failure)
			local next = M.new({
				success = success,
				failure = failure,
				extend = options.extend
			})
			if d.state == RESOLVED then
				next:resolve(d.value)
			elseif d.state == REJECTED then
				next:reject(d.value)
			else
				table.insert(d.queue, next)
			end
			return next
		end,
		state = 0,
		queue = {},
		success = options.success,
		failure = options.failure
	}
	d = setmetatable(d, deferred)
	if isfunction(options.extend) then
		options.extend(d)
	end
	return d
end





function M.all(args)
	local d = M.new()
	if #args == 0 then
		return d:resolve({})
	end
	local method = "resolve"
	local pending = #args
	local results = {}

	local function synchronizer(i, resolved)
		return function(value)
			results[i] = value
			if not resolved then
				method = "reject"
			end
			pending = pending - 1
			if pending == 0 then
				d[method](d, results)
			end
			return value
		end
	end

	for i = 1, pending do
		args[i]:next(synchronizer(i, true), synchronizer(i, false))
	end
	return d
end





function M.map(args, fn)
	local d = M.new()
	local results = {}
	local function donext(i)
		if i > #args then
			d:resolve(results)
		else
			fn(args[i]):next(function(res)
				table.insert(results, res)
				donext(i + 1)
			end, function(err)
				d:reject(err)
			end)
		end
	end
	donext(1)
	return d
end





function M.first(args)
	local d = M.new()
	for _, v in ipairs(args) do
		v:next(function(res)
			d:resolve(res)
		end, function(err)
			d:reject(err)
		end)
	end
	return d
end





XeninUI.Promises = M

--PATH addons/xenin_the_xenin_framework_1900562881/lua/xeninui/libs/network/core.lua:
do
  local _class_0
  local _base_0 = {
    __name = "XeninUI.Network",
    setPrefix = function(self, prefix)
      self.prefix = prefix
      return self
    end,
    getPrefix = function(self)
      return self.prefix
    end,
    prepare = function(self, str)
      if istable(str) then
        for i, v in ipairs(str) do
          util.AddNetworkString(self:getPrefix() .. v)
        end
      else
        util.AddNetworkString(self:getPrefix() .. str)
      end
    end,
    receiver = function(self, name, func)
      if func == nil then func = function() end
      end
      net.Receive(self:getPrefix() .. name, function(len, ply)
        func(self, ply or LocalPlayer(), len)
      end)
    end,
    send = function(self, name, target, func)
      net.Start(self:getPrefix() .. name)

      if CLIENT then
        target(self)

        net.SendToServer()
      else
        func(self)

        net.Send(target)
      end
    end,
    compress = function(self, data)
      local tbl = false
      if istable(data) then
        data = util.TableToJSON(data)
        tbl = true
      end

      data = util.Compress(data)
      local len = data:len()

      net.WriteUInt(len, 32)
      net.WriteBool(tbl)
      net.WriteData(data, len)
    end,
    decompress = function(self)
      local len = net.ReadUInt(32)
      local tbl = net.ReadBool()
      local data = net.ReadData(len)
      data = util.Decompress(data)

      if tbl then
        data = util.JSONToTable(data)
      end

      return data
    end,
    getNetworkType = function(self, input)
      if isnumber(input) then
        local int, frac = math.modf(input)
        if (frac != 0) then
          return self.FLOAT
        end

        return self.INTEGER
      elseif (isbool(input) or input == nil) then
        return self.BOOL
      elseif isstring(input) then
        return self.STRING
      elseif istable(input) then
        return self.TABLE
      end
    end,
    writeType = function(self, input)
      local type = self:getNetworkType(input)
      net.WriteUInt(type, self.DYNAMIC_DATA_SIZE)

      return type
    end,
    readType = function(self, input)
      return net.ReadUInt(self.DYNAMIC_DATA_SIZE)end,
    write = function(self, input, ...)
      local type = self:writeType(input)
      self:writeFromType(type, input, ...)

      return type
    end,
    read = function(self, ...)
      local type = self:readType()
      return self:readFromType(type, ...)
    end,
    writeFromType = function(self, type, input, ...)
      self.writeTypes[type](input, ...)end,
    readFromType = function(self, type, ...)
      return self.readTypes[type](...)end,
    __type = function(self)
      return self.__name
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self)
      self.TABLE = 4
      self.STRING = 3
      self.BOOL = 2
      self.INTEGER = 1
      self.FLOAT = 0
      self.DYNAMIC_DATA_SIZE = 3
      self:setPrefix("")

      self.writeTypes = {
        [self.FLOAT] = function(i)
          net.WriteFloat(i)end,
        [self.INTEGER] = function(i)
          net.WriteInt(i, 16)end,
        [self.BOOL] = function(i)
          net.WriteBool(i)end,
        [self.STRING] = function(i)
          net.WriteString(i)end,

        [self.TABLE] = function(i)
          net.WriteTable(i)end
      }
      self.readTypes = {
        [self.FLOAT] = function()
          return math.Round(net.ReadFloat(), 5)end,
        [self.INTEGER] = function()
          return net.ReadInt(16)end,
        [self.BOOL] = function()
          return net.ReadBool()end,
        [self.STRING] = function()
          return net.ReadString()end,
        [self.TABLE] = function()
          return net.ReadTable()end
      }
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
  XeninUI.Network = _class_0
end

--PATH addons/xenin_the_xenin_framework_1900562881/lua/xeninui/libs/configurator/main.lua:
XeninUI.Configurator = XeninUI.Configurator || {}

function XeninUI.Configurator:PrintMessage(msg)
  MsgC(XeninUI.Theme.Yellow, "[Xenin Configurator] ", color_white, msg .. "\n")
end

--PATH addons/xenin_the_xenin_framework_1900562881/lua/xeninui/libs/configurator/classes/entities.lua:
local Entities
do
  local _class_0
  local _base_0 = {
    __name = "Entities",
    getEntities = function(self)
      return self.entities
    end,
    register = function(self, name, entity)
      self.entities[name] = entity
    end,
    get = function(self, name)
      return self.entities[name]
    end,
    create = function(self, name)
      return self:get(name)()
    end,
    createSQLTable = function(self, entity)
      local inst = entity()
      local name = inst:getDatabaseEntity()
      XeninUI.Configurator:PrintMessage("Creating SQL table for entity " .. tostring(name))
      inst:createSQLTable()
    end,
    __type = function(self)
      return "XeninUI.Configurator.Entities"end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self)
      self.entities = {}
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
  Entities = _class_0
end
XeninUI.Configurator.Entities = XeninUI.Configurator.Entities || Entities()

hook.Add("Xenin.Configurator.InitialisedDatabase", "XeninUI.Configurator.Entities", function()
  local ents = XeninUI.Configurator.Entities
  for i, v in pairs(ents:getEntities()) do
    ents:createSQLTable(v)
  end
end)

--PATH addons/xenin_the_xenin_framework_1900562881/lua/xeninui/libs/configurator/ui/sidebar.lua:
local PANEL = {}

XeninUI:CreateFont("Xenin.Configurator.Admin.Sidebar", 20)

function PANEL:Init()
  self.Tabs = {}
  self.Panels = {}

  self:DockPadding(5, 8, 16, 16)

end

function PANEL:SetActiveByName(name)
  for i, v in ipairs(self.Tabs) do
    if (v.Name != name) then continue end

    self:SetActive(v.Id)
    break
  end
end

function PANEL:GetActivePanel()
  return self.Panels[self.Active]
end

function PANEL:SetActive(id)
  local active = self.Active
  self.Active = id

  local tab = self.Tabs[active]
  local pnl = self.Panels[active]
  if IsValid(tab) then
    tab:OnCursorExited()
  end
  if IsValid(pnl) then
    pnl:SetVisible(false)
  end

  tab = self.Tabs[id]
  pnl = self.Panels[id]
  if IsValid(tab) then
    tab:OnCursorEntered()
  end
  if IsValid(pnl) then
    pnl:SetVisible(true)
  end
end

function PANEL:AddTab(name, icon, color, panel, script, rawData)
  local btn = self:Add("DButton")
  btn:Dock(TOP)
  btn:DockMargin(0, 0, 0, -4)
  btn:SetText("")
  btn:SetTall(42)
  btn.Name = name
  btn.Color = color
  btn.TextColor = Color(208, 208, 208)
  XeninUI:DownloadIcon(btn, icon)
  btn.Paint = function(pnl, w, h)
    XeninUI:DrawIcon(11, 11, h - 22, h - 22, pnl, color, color)

    draw.SimpleText(pnl.Name, "Xenin.Configurator.Admin.Sidebar", h, h * 0.5, pnl.TextColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
  end
  btn.OnCursorEntered = function(pnl)
    pnl:LerpColor("TextColor", pnl.Color)
  end
  btn.OnCursorExited = function(pnl)
    if (self.Active == pnl.Id) then return end

    pnl:LerpColor("TextColor", Color(208, 208, 208))
  end
  btn.DoClick = function(pnl)
    self:SetActive(pnl.Id)
  end

  local panel = self:GetParent():Add(panel)
  panel:Dock(FILL)
  panel:SetVisible(false)
  if panel.SetScript then
    panel:SetScript(script)
  end
  if panel.SetData then
    panel:SetData(rawData)
  end

  local id = table.insert(self.Tabs, btn)
  self.Tabs[id].Id = id
  self.Panels[id] = panel
  self.Panels[id].Id = id
end

function PANEL:Paint(w, h)
  XeninUI:DrawRoundedBoxEx(6, 0, 0, w, h, XeninUI.Theme.Navbar, false, false, true, false)
end

vgui.Register("Xenin.Configurator.Admin.Sidebar", PANEL)

--PATH addons/xenin_the_xenin_framework_1900562881/lua/xeninui/libs/configurator/ui/inputs/color.lua:
local x

--PATH addons/xenin_the_xenin_framework_1900562881/lua/xeninui/libs/config/class.lua:
local Config
do
  local _class_0
  local _base_0 = {
    __name = "Config",
    load = function(self)
      if SERVER then
        self:loadServer()
      else
        self:loadClient()
      end
    end,
    loadServer = function(self)
      hook.Add("XeninDB.Connected", "Xenin.Config", function()
        self:loadConfig()
      end)

      local db = file.Read("xenin/mysql.txt")
      MsgC(XeninUI.Theme.Red, "[Xenin Framework] ", color_white, "Using " .. (db and "MySQL" or "SQLite") .. " connection\n")
      if db then
        local tbl = util.JSONToTable(db)
        XeninDB.initialize(tbl)
        self.serverId = tbl.serverId or 1
      else
        XeninDB.initialize({
          EnableMySQL = false,
          Host = "ip",
          Username = "root",
          Password = "password",
          Database_name = "gmod_server",
          Database_port = 3306,
          MultiStatements = false
        })
      end
    end,
    loadConfig = function(self)
      XeninUI.ORM.DB = XeninUI.ORM.ORM("xeninui/server/migrations/")


      timer.Simple(3, function()
        self.db = XeninUI.ORM.DB
        self.builder = XeninUI.ORM.Builder
        local id = self.serverId or 1

        self.db:orm("xenin_framework_settings"):select():where("server_id", "=", self.builder.raw(tostring(id) .. " or NULL")):run():next(function(result)
          for i, v in ipairs(result or {}) do
            local val = v.json and util.JSONToTable(v.value) or v.value

            self:register(v.id, val)
          end

          self.loaded = true

          hook.Run("Xenin.ConfigLoaded")
        end)
      end)
    end,
    loadClient = function(self, selector)
      if selector == nil then selector = "scripts"
      end
      net.Start("Xenin.RequestConfig")
      net.WriteString(selector)
      net.SendToServer()
    end,
    getIndex = function(self, selector)
      local tbl = self.config
      local split = string.Explode(".", selector)

      for i, v in ipairs(split) do
        if (v == "") then continue end
        if (!tbl[v]) then return end

        tbl = tbl[v]
      end

      return tbl
    end,
    save = function(self, scriptId, tbl)
      if tbl == nil then tbl = {}
      end
      if CLIENT then
        tbl = von.serialize(tbl)
        local len = tbl:len()

        net.Start("Xenin.Config")
        net.WriteString(scriptId)
        net.WriteUInt(len, 32)
        net.WriteData(tbl, len)
        net.SendToServer()
      else
        local tbl = XeninUI.Config:get("scripts")[scriptId]
        if (!tbl) then return end

        local id = self.serverId or 1

        for i, v in pairs(tbl) do
          local json = istable(v)
          local val = json and util.TableToJSON(v) or v

          self.db:orm("xenin_framework_settings"):upsert({
            id = tostring(scriptId) .. "." .. tostring(i),
            value = val,
            json = json,
            server_id = id
          }, {
          "id" }):run()
        end
      end
    end,
    get = function(self, selector, default)
      return self:getIndex(selector) or default
    end,
    set = function(self, selector, key, value)
      local tbl = self:getIndex(selector)
      tbl[key] = value

      return self
    end,
    __type = function(self)
      return "XeninUI.Config"end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self)
      self.config = {}
      self:load()
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
  Config = _class_0
end

XeninUI.Config = Config()
XeninUI.Config:set("", "scripts", {})

--PATH addons/xenin_the_xenin_framework_1900562881/lua/xeninui/elements/dropdown_player.lua:
local PANEL = {}

AccessorFunc(PANEL, "m_parentPanel", "ParentPanel")

function PANEL:Init()
  self.Choices = {}

  self.Search = self:Add("XeninUI.TextEntry")
  self.Search:Dock(TOP)
  self.Search:DockMargin(8, 0, 0, 8)
  self.Search:SetTall(36)
  self.Search:SetPlaceholder("Search by name")
  self.Search:SetIcon(XeninUI.Materials.Search, true)
  self.Search.textentry:SetUpdateOnType(true)
  self.Search.textentry.OnValueChange = function(pnl, text)
    local tbl = {}
    text = text:lower()
    for i, v in pairs(self.Data) do
      if (!IsValid(v)) then continue end
      if (!v:Nick():lower():find(text)) then continue end

      table.insert(tbl, v)
    end

    self:SetData(tbl)
  end
  self.Search.textentry.OnEnter = function(pnl, text)
    local children = self.Layout:GetChildren()
    if IsValid(children[1]) then
      children[1]:DoClick()

      return
    end

    self:Remove()
  end

  self.Scroll = self:Add("XeninUI.Scrollpanel.Wyvern")
  self.Scroll:Dock(FILL)

  self.Layout = self.Scroll:Add("DListLayout")
  self.Layout:Dock(TOP)

  self.Alpha = 0
  self:LerpAlpha(255, 0.15)

  self:DockPadding(0, 8, 8, 8)
end

function PANEL:OnSelected() end

XeninUI:CreateFont("XeninUI.DropdownPopup.Small", 12)

function PANEL:SetData(tbl)
  if (!self.Data) then
    self.Data = tbl
  end

  self.Layout:Clear()

  self.Choices = {}

  for i, v in ipairs(tbl) do
    if (!IsValid(v)) then return end

    local panel = self.Layout:Add("DButton")
    panel:Dock(TOP)
    panel:DockMargin(8, 0, 8, 0)
    panel:SetTall(48)
    panel:SetText("")
    panel.Text = v:Nick()
    panel.Sid64 = v:SteamID64()
    panel.Sid = v:IsBot() and "BOT" or v:SteamID()
    panel.Usergroup = v:GetUserGroup():sub(1, 1):upper() .. v:GetUserGroup():sub(2)
    panel.Background = XeninUI.Theme.Primary
    panel.TextColor = Color(222, 222, 222)
    panel.Paint = function(pnl, w, h)
      XeninUI:DrawRoundedBox(6, 0, 0, w, h, pnl.Background)

      XeninUI:DrawShadowText(pnl.Text, "XeninUI.DropdownPopup", h + 6, h * 0.5 + 1, pnl.TextColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, 150)
      XeninUI:DrawShadowText(pnl.Sid, "XeninUI.DropdownPopup.Small", h + 6, h * 0.5 + 1, ColorAlpha(pnl.TextColor, 100), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, 150)
    end
    panel.OnCursorEntered = function(pnl)
      pnl:LerpColor("Background", XeninUI.Theme.Navbar)
      pnl:LerpColor("TextColor", color_white)
    end
    panel.OnCursorExited = function(pnl)
      pnl:LerpColor("Background", XeninUI.Theme.Primary)
      pnl:LerpColor("TextColor", Color(222, 222, 222))
    end
    panel.DoClick = function(pnl)
      self:OnSelected(pnl.Sid64)
      self:Remove()
    end

    panel.Avatar = panel:Add("XeninUI.Avatar")
    panel.Avatar:SetVertices(30)
    panel.Avatar:SetPlayer(v, 64)

    panel.PerformLayout = function(pnl, w, h)
      panel.Avatar:SetPos(6, 6)
      panel.Avatar:SetSize(h - 12, h - 12)
    end

    table.insert(self.Choices, panel)
  end
end

function PANEL:Paint(w, h)
  local aX, aY = self:LocalToScreen()

  BSHADOWS.BeginShadow()
  draw.RoundedBox(6, aX, aY, w, h, XeninUI.Theme.Primary)
  BSHADOWS.EndShadow(1, 1, 1, 150)
end

function PANEL:OnFocusChanged(gained)
  if gained then
    self.HasGained = true
  end
end


function PANEL:Think()
  if (!IsValid(self)) then return end
  if (!self.HasGained) then return end
  if self:HasHierarchicalFocus() then return end

  self:Remove()
end

function PANEL:PerformLayout(w, h)
  local longest = 0

  surface.SetFont("XeninUI.DropdownPopup")
  for i, v in pairs(self.Choices) do
    local tw = surface.GetTextSize(v.Text)
    tw = tw + 16
    tw = tw + 16
    tw = tw + 48

    if (tw > longest) then
      longest = math.max(112, tw)
    end
  end

  self:SetWide(math.max(self:GetParentPanel():GetWide(), longest))
  self:SetTall(math.min(#self.Choices * 48, 6 * 48) + 16 + 44)
end

vgui.Register("XeninUI.PlayerDropdown", PANEL, "EditablePanel")

--PATH addons/xenin_the_xenin_framework_1900562881/lua/xeninui/elements/popup.lua:
local PANEL = {}

AccessorFunc(PANEL, "m_bgWidth", "BackgroundWidth")
AccessorFunc(PANEL, "m_bgHeight", "BackgroundHeight")

function PANEL:Init()
  self.background = vgui.Create("XeninUI.Frame", self)
  self.background.Paint = function(pnl, w, h)
    local x, y = pnl:LocalToScreen(0, 0)

    BSHADOWS.BeginShadow()
    draw.RoundedBox(6, x, y, w, h, XeninUI.Theme.Background)
    BSHADOWS.EndShadow(1, 2, 2, 150, 0, 0)
  end
  self.background.closeBtn.DoClick = function(pnl)
    self:Remove()
  end
end

function PANEL:Paint(w, h)
  surface.SetDrawColor(20, 20, 20, 160)
  surface.DrawRect(0, 0, w, h)
end

function PANEL:PerformLayout(w, h)
  self.background:SetSize(self:GetBackgroundWidth(), self:GetBackgroundHeight())
  self.background:Center()
end

function PANEL:SetTitle(str)
  self.background:SetTitle(str)
end

vgui.Register("XeninUI.Popup", PANEL, "EditablePanel")

--PATH addons/xenin_the_xenin_framework_1900562881/lua/xeninui/elements/sidebar_player.lua:
local PANEL = {}

XeninUI:CreateFont("XeninUI.Sidebar.Player.Name", 20)
XeninUI:CreateFont("XeninUI.Sidebar.Player.Job", 16)

function PANEL:Init()
  self:SetColors({
    startColor = Color(208, 62, 106),
    endColor = Color(200, 60, 123)
  }, {
    startColor = Color(251, 211, 50),
    endColor = Color(69, 198, 103)
  })

  self.Avatar = self:Add("XeninUI.Avatar")
  self.Avatar:SetPlayer(LocalPlayer(), 64)
  self.Avatar:SetVertices(30)

  self.Text = self:Add("DPanel")
  self.Text:SetMouseInputEnabled(false)
  self.Text.TextHeight = 0
  self.Text.Paint = function(pnl, w, h)
    local ply = LocalPlayer()

    pnl.TextHeight = 0
    for i, v in pairs(pnl.Rows) do
      XeninUI:DrawShadowText(v.text, v.font, 0, pnl.TextHeight, v.color, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, 255)

      pnl.TextHeight = pnl.TextHeight + draw.GetFontHeight(v.font) - 2
    end
  end

  local ply = LocalPlayer()
  self:SetRows({
    {
      font = "XeninUI.Sidebar.Player.Name",
      text = ply:Nick(),
      color = color_white
    },
    {
      font = "XeninUI.Sidebar.Player.Job",
      text = ply:GetUserGroup():gsub("^%l", string.upper),
      color = XeninUI.Theme.Green
    }
  })
end

function PANEL:SetColors(startGradient, endGradient)
  self.startGradient = startGradient
  self.endGradient = endGradient
end

function PANEL:SetRows(rows)
  self.Text.Rows = rows
end

function PANEL:Paint(w, h)
  local aX, aY = self:LocalToScreen()
  draw.SimpleLinearGradient(aX, aY, w, h, self.startGradient.startColor, self.startGradient.endColor)

  XeninUI:Mask(function()
    XeninUI:DrawRoundedBox((h - 24) * 0.5, 12, 12, h - 24, h - 24, color_white)
  end, function()
    draw.SimpleLinearGradient(aX + 12, aY + 12, h - 24, h - 24, self.endGradient.startColor, self.endGradient.endColor, true)
  end)
end

function PANEL:PerformLayout(w, h)
  self.Avatar:SetPos(14, 14)
  self.Avatar:SetSize(h - 28, h - 28)

  self.Text:MoveRightOf(self.Avatar, 10)
  local textH = 1
  for i, v in pairs(self.Text.Rows) do
    textH = textH + draw.GetFontHeight(v.font)
  end
  self.Text:SetTall(textH)
  self.Text:CenterVertical()
  self.Text:SetWide(w - self.Text.x)
end

vgui.Register("XeninUI.Sidebar.Player", PANEL)

--PATH addons/battlepass/lua/battlepass/challenges/prodai_5_avtomatov_za_prodavza_zbroi.lua:
local CHALLENGE = BATTLEPASS:CreateTemplateChallenge()
CHALLENGE:SetName("Продай 5 автоматів, за продавця зброї")
CHALLENGE:SetIcon("battlepass/challenges/shipments.png") -- <- ??
CHALLENGE:SetDesc("")
CHALLENGE:SetProgressDesc("---")
CHALLENGE:SetFinishedDesc("---")
CHALLENGE:SetID("prodai_5_avtomatov_za_prodavza_zbroi")

local itm = {
  ['M92 Beretta'] = true,
  ['HK USP'] = true,
  ['TEC-9'] = true,
  ['HK UMP45'] = true,
  ['AK-47'] = true,
  ['F2000'] = true,
  ['M4A1 Iron'] = true,
  ['G36'] = true,
  ['L85'] = true,
  ['Ares Shrike'] = true,
  ['FG 42'] = true,
  ['Benelli M3'] = true,
  ['Browning Auto 5'] = true,
  ['M24'] = true,
  ['HK SL8'] = true,
}

CHALLENGE:AddHook("playerBuyWeapon_BattlePass", function(self, ply, _ply, name)
  if IsValid( _ply ) and ply == _ply and _ply:Team() == TEAM_GUN and (itm[name] or false) then
    self:AddProgress(1)
    self:NetworkProgress()
  end
end)

BATTLEPASS:RegisterChallenge(CHALLENGE)
--PATH addons/battlepass/lua/battlepass/shared/language.lua:
BATTLEPASS.Languages = BATTLEPASS.Languages or {}

function BATTLEPASS:SetLanguage(id)
  self.ActiveLanguage = id
end

function BATTLEPASS:AddLanguage(name, tbl)
  self.Languages[name] = tbl
end

function BATTLEPASS:GetPhrase(phrase, replace)
  local active = self.ActiveLanguage
  if (!self.Languages[active]) then return "No " .. active .. " language found" end
  active = self.Languages[active]
  if (!active[phrase]) then return "No " .. phrase .. " phrase found" end
  local str = active[phrase]

  for i, v in pairs(replace or {}) do
    str = str:Replace(":" .. i .. ":", v)
  end

  return str
end
--PATH addons/battlepass/lua/battlepass/rewards/donatemoney.lua:
local REWARD = BATTLEPASS:CreateReward()

function REWARD:CanUnlock(ply, reward)
	return true
end

function REWARD:GetTooltip(reward)
	return reward
end

local materialid = BATTLEPASS.Materials
function REWARD:GetModel(reward)
	return reward < 10 and materialid.money1 or materialid.money2
end

function REWARD:GetName(reward)
	return string.Comma(reward, '.') .. ' грн'
end

function REWARD:Unlock(ply, reward)
	if (SERVER) then
		ply:AddIGSFunds(reward, "БП")
	end
end

REWARD:Register("donatemoney")
--PATH addons/battlepass/lua/battlepass/rewards/givedonateitem.lua:
local REWARD = BATTLEPASS:CreateReward()

function REWARD:CanUnlock(ply, reward)
    return true
end

function REWARD:GetTooltip(reward)
    return reward.name
end

function REWARD:GetModel(reward)
    return reward.model
end

function REWARD:GetName(reward)
    return reward.name
end

function REWARD:Unlock(ply, reward)
    if CLIENT then return end
    IGS.AddToInventory(ply, reward.id)
end

REWARD:Register("givedonateitem")
--PATH addons/battlepass/lua/battlepass/rewards/givehat.lua:
local REWARD = BATTLEPASS:CreateReward()

function REWARD:CanUnlock(ply, reward)
    return true
end

function REWARD:GetTooltip(reward)
    return reward
end

function REWARD:GetModel(reward)
    return reward.model
end

function REWARD:GetName(reward)
    return reward.name
end

function REWARD:Unlock(ply, reward)
    if SERVER then
        ply:SH_AddAccessory(reward.id)
    end
end

REWARD:Register("givehat")
--PATH addons/battlepass/lua/battlepass/shared/bp_builder.lua:
local BUILDER = {}
BUILDER.RewardData = {
	free = {},
	premium = {}
}
BUILDER.ChallengesData = {}

function BUILDER:ID(id)
	self.Id = id

	return self
end

function BUILDER:Name(name)
	self.Name = name

	return self
end

function BUILDER:Subtitle(subtitle)
	self.Subtitle = subtitle

	return self
end

function BUILDER:Tiers(tiers)
	self.Tiers = tiers

	return self
end

function BUILDER:Tier(tier)
	self.CurrentTier = tier

	return self
end

function BUILDER:Rewards()
	-- don't do anything, syntax sugar
	
	return self
end

function BUILDER:Challenges()
	-- don't do anything, syntax sugar
	
	return self
end

function BUILDER:ConstructReward(reward, premium)
	local tbl = self.RewardData[premium and "premium" or "free"]
	tbl[self.CurrentTier] = tbl[self.CurrentTier] or {}
	local tier = tbl[self.CurrentTier]

	if (!premium) then
		tier[1] = reward
	else
		table.insert(tier, reward)
	end
end

function BUILDER:Free(tbl)
	self:ConstructReward(tbl)

	return self
end

function BUILDER:Paid(tbl)
	self:ConstructReward(tbl, true)

	return self
end

function BUILDER:Category(name)
	self.CurrentCategory = name

	self.ChallengesData[name] = {}

	return self
end

function BUILDER:Challenge(id)
	local catName = self.CurrentCategory
	local cat = self.ChallengesData[catName]
	if (!cat) then return end

	local tblId = table.insert(cat, { id = id, goal = {}, reward = {} })
	self.CurrentChallengeID = tblId

	return self
end

function BUILDER:Stage(tbl)
	local catName = self.CurrentCategory
	local cat = self.ChallengesData[catName]
	if (!cat) then return end
	local id = self.CurrentChallengeID
	if (!id) then return end
	local challenge = cat[id]
	if (!challenge) then return end

	table.insert(challenge.goal, tbl.Progress)
	table.insert(challenge.reward, tbl.Reward)

	return self
end

function BUILDER:Construct()
	local tbl = {
		name = self.Name,
		ends = self.Subtitle,
		tiers = self.Tiers,
		rewards = self.RewardData,
		challenges = self.ChallengesData
	}

	BATTLEPASS:AddPass(self.Id, tbl)
end

function BATTLEPASS:CreateBuilderPass()
	return table.Copy(BUILDER)
end
--PATH addons/battlepass/lua/battlepass/configuration/config.lua:
BATTLEPASS.Pass = {}
BATTLEPASS.Config = BATTLEPASS.Config or {}

-- The URL that the prompt redicts you to if you are trying to purchase the Battle Pass
BATTLEPASS.Config.PurchasePassURL = ""
-- The URL that the prompt redicts you to if you are trying to purchase tiers
BATTLEPASS.Config.PurchaseTiersURL = ""

-- The top left corner of the menu
BATTLEPASS.Config.FrameTitle = "Community Name - Battle Pass"

-- The chat prefix text
BATTLEPASS.Config.ChatPrefixText = "[BATTLE PASS] "
-- The chat prefix color
-- You can use Color(r, g, b)
BATTLEPASS.Config.ChatPrefixColor = XeninUI.Theme.Green

BATTLEPASS.Config.NPC = {
	-- What text should be able the NPC?
	Title = "Battle Pass",
	-- The color of the NPC?
	-- Example: Color(255, 0, 0)
	OutlineColor = XeninUI.Theme.Purple
}

-- How should money be formatted? Used for a few challenges.
BATTLEPASS.Config.FormatMoney = function(amt)
	if (DarkRP) then
		return DarkRP.formatMoney(amt)
	elseif (PS) then
		return string.Comma(amt) .. " points"
	else
		return "Unknown money formatting " .. amt
	end
end

-- Should the Battle Pass menu open whenever a player joins?
BATTLEPASS.Config.OpenMenuOnJoin = false

-- If you haven't set a rewards color, what color should the background be?
BATTLEPASS.DefaultItemColor = Color(100, 100, 100)

-- What language? By default only English until more have been added
BATTLEPASS:SetLanguage("English")

----------------- IMPORTANT 
-- If you add ANY new challenges you have to rejoin the server after.
-- This is due to performance reasons for the player, making it run much faster normally.
----------------- IMPORTANT ^

-- Start the Battle Pass config process
local BP = BATTLEPASS:CreateBuilderPass()
	-- The ID in the database for the pass! For every unique pass you create make sure its unique!
	:ID("gubkabob2024")
	-- How many tiers should the battle pass have?
	:Tiers(100)
	-- To start rewards we use :Rewards()
	:Rewards()
		:Tier(1)
			:Free({ Type = "money", Reward = 15000})
			:Paid({ Type = "unbox", Reward = "Кейс Богач"})
		:Tier(2)
			:Paid({ Type = "money", Reward = 15000})
		:Tier(3)
			:Free({ Type = "unbox", Reward = "Кейс Бомж"})
			:Paid({ Type = "money", Reward = 25000})
		:Tier(4)
			:Paid({ Type = "unbox", Reward = "Кейс Бомж"})
		:Tier(5)
			:Free({ Type = "giveweapon", Reward = {name = "Mossberg 590", model = "models/weapons/w_mossberg_590.mdl", entity = "m9k_mossberg590", current = 3}})
			:Paid({ Type = "giveweapon", Reward = {name = "Balrog V G36C", model = "models/weapons/w_smg_ump45.mdl", entity = "g36_balrog", current = 2}})
		:Tier(6)
			:Paid({ Type = "money", Reward = 25000})
		:Tier(7)
			:Free({ Type = "money", Reward = 20000})
			:Paid({ Type = "money", Reward = 25000})
		:Tier(8)
			:Paid({ Type = "giveweapon", Reward = {name = "Thompson Contender G2", model = "models/weapons/w_g2_contender.mdl", entity = "m9k_contender", current = 2}})
		:Tier(9)
			:Free({ Type = "donatemoney", Reward = 5})
			:Paid({ Type = "donatemoney", Reward = 5})
		:Tier(10)
			:Paid({ Type = "money", Reward = 25000})
		:Tier(11)
			:Paid({ Type = "giveweapon", Reward = {name = "Thompson Contender G2", model = "models/weapons/w_g2_contender.mdl", entity = "m9k_contender", current = 2}})
		:Tier(12)
			:Free({ Type = "giveweapon", Reward = {name = "FAMAS F1", model = "models/weapons/w_rif_famas.mdl", entity = "swb_famas", current = 2}})
			:Paid({ Type = "donatemoney", Reward = 5})
		:Tier(13)
			:Paid({ Type = "money", Reward = 35000})
		:Tier(14)
			:Free({ Type = "money", Reward = 25000})
			:Paid({ Type = "givedonateitem", Reward = {name = "+5 пропов", model = "models/props_phx/misc/soccerball.mdl", id = "5propov"}})
		:Tier(15)
			:Paid({ Type = "money", Reward = 35000})
		:Tier(16)
			:Free({ Type = "money", Reward = 25000})
			:Paid({ Type = "giveweapon", Reward = {name = "Crowbar", model = "models/props_phx/misc/soccerball.mdl", entity = "weapon_crowbar", current = 3}})
		:Tier(17)
			:Free({ Type = "giveweapon", Reward = {name = "Crowbar", model = "models/props_phx/misc/soccerball.mdl", entity = "weapon_crowbar", current = 3}})
			:Paid({ Type = "giveweapon", Reward = {name = "AK47 Beast", model = "models/weapons/w_rif_akmp.mdl", entity = "ak47_beast", current = 3}})
		:Tier(18)
			:Paid({ Type = "money", Reward = 35000})
		:Tier(19)
			:Free({ Type = "money", Reward = 25000})
			:Paid({ Type = "unbox", Reward = "Лотерейный Кейс"})
		:Tier(20)
			:Paid({ Type = "money", Reward = 35000})
		:Tier(21)
			:Free({ Type = "money", Reward = 30000})
			:Paid({ Type = "donatemoney", Reward = 5})
		:Tier(22)
			:Paid({ Type = "money", Reward = 40000})
		:Tier(23)
			:Paid({ Type = "unbox", Reward = "Кейс Бомж"})
		:Tier(24)
			:Free({ Type = "money", Reward = 30000})
			:Paid({ Type = "money", Reward = 40000})
		:Tier(25)
			:Free({ Type = "donatemoney", Reward = 10})
			:Paid({ Type = "money", Reward = 45000})
		:Tier(26)
			:Paid({ Type = "unbox", Reward = "Кейс Бомж"})
		:Tier(27)
			:Free({ Type = "giveweapon", Reward = {name = "AWP", model = "models/weapons/w_snip_awp.mdl", entity = "swb_awp", current = 2}})
			:Paid({ Type = "givedonateitem", Reward = {name = "S&W Model 500", model = "models/weapons/w_sw_model_500.mdl", id = "m9k_model500"}})
			--:Free({ Type = "perm_var", Reward = "jobgopnik", Name = "Гопник", Display = "models/celvivor2/survivor_teenangs2.mdl"})
		:Tier(28)
			:Paid({ Type = "money", Reward = 40000})
		:Tier(29)
			:Free({ Type = "money", Reward = 30000})
			:Paid({ Type = "donatemoney", Reward = 10})
		:Tier(30)
			:Free({ Type = "givedonateitem", Reward = {name = "+10 пропов", model = "models/props_phx/misc/soccerball.mdl", id = "10propov"}})
			--:Paid({ Type = "perm_var", Reward = "jobsaitama", Name = "Сайтама", Display = "models/pacagma/one_punch_man/saitama/saitama_player.mdl"})
		:Tier(31)
			:Paid({ Type = "money", Reward = 40000})
		:Tier(32)
			:Paid({ Type = "giveweapon", Reward = {name = "SF Ethereal", model = "models/weapons/w_rif_ethe.mdl", entity = "47_ethereal", current = 3}})
		:Tier(33)
			:Free({ Type = "giveweapon", Reward = {name = "Double Barrel Shotgun", model = "models/weapons/w_double_barrel_shotgun.mdl", entity = "m9k_dbarrel", current = 2}})
			:Paid({ Type = "unbox", Reward = "Кейс с Оружием"})
		:Tier(34)
			:Paid({ Type = "money", Reward = 40000})
		:Tier(35)
			:Free({ Type = "donatemoney", Reward = 5})
			:Paid({ Type = "donatemoney", Reward = 15})
		:Tier(36)
			:Paid({ Type = "giveweapon", Reward = {name = "Double Barrel Shotgun", model = "models/weapons/w_double_barrel_shotgun.mdl", entity = "m9k_dbarrel", current = 2}})
		:Tier(37)
			:Paid({ Type = "unbox", Reward = "Кейс с Оружием #2"})
		:Tier(38)
			:Paid({ Type = "unbox", Reward = "Кейс с Оружием #2"})
		:Tier(39)
			:Free({ Type = "unbox", Reward = "Лотерейный Кейс"})
			:Paid({ Type = "money", Reward = 40000})
		:Tier(40)
			:Paid({ Type = "giveweapon", Reward = {name = "Double Barrel", model = "models/weapons/w_double_barrel_shotgun.mdl", entity = "m9k_dbarrel", current = 2}})
		:Tier(41)
			:Paid({ Type = "donatemoney", Reward = 15})
		:Tier(42)
			:Free({ Type = "money", Reward = 35000})
			:Paid({ Type = "money", Reward = 40000})
		:Tier(43)
			:Paid({ Type = "money", Reward = 40000})
		:Tier(44)
			:Paid({ Type = "giveweapon", Reward = {name = "Crowbar", model = "models/props_phx/misc/soccerball.mdl", entity = "weapon_crowbar", current = 3}})
		:Tier(45)
			:Paid({ Type = "unbox", Reward = "Кейс Бомж"})
		:Tier(46)
			:Free({ Type = "givedonateitem", Reward = {name = "+10 пропов", model = "models/props_phx/misc/soccerball.mdl", id = "10propov"}})
		:Tier(47)
			:Free({ Type = "money", Reward = 45000})
			:Paid({ Type = "money", Reward = 45000})
		:Tier(48)
			:Paid({ Type = "unbox", Reward = "Кейс с Оружием #2"})
		:Tier(49)
			:Paid({ Type = "money", Reward = 45000})
		:Tier(50)
			:Free({ Type = "giveweapon", Reward = {name = "KRISS Vector", model = "models/weapons/w_kriss_vector.mdl", entity = "m9k_vector", current = 2}})
			:Paid({ Type = "unbox", Reward = "Лотерейный Кейс"})
		:Tier(51)
			:Free({ Type = "donatemoney", Reward = 15})
		:Tier(52)
			:Paid({ Type = "money", Reward = 45000})
		:Tier(53)
			:Free({ Type = "givedonateitem", Reward = {name = "S&W Model 500", model = "models/weapons/w_sw_model_500.mdl", id = "m9k_model500"}})
		:Tier(54)
			:Paid({ Type = "givedonateitem", Reward = {name = "+50 пропов", model = "models/props_phx/misc/soccerball.mdl", id = "50propov"}})
		:Tier(55)
			:Paid({ Type = "giveweapon", Reward = {name = "AK47 Beast (название меняй)", model = "models/props_phx/misc/soccerball.mdl", entity = "ak47_beast", current = 2}})
		:Tier(56)
			:Free({ Type = "money", Reward = 45000})
			:Paid({ Type = "money", Reward = 45000})
		:Tier(57)
			:Free({ Type = "money", Reward = 45000})
			:Paid({ Type = "unbox", Reward = "Лотерейный Кейс"})
		:Tier(58)
			:Free({ Type = "giveweapon", Reward = {name = "FG 42", model = "models/props_phx/misc/soccerball.mdl", entity = "m9k_fg42", current = 2}})
			:Paid({ Type = "givedonateitem", Reward = {name = "Сумка з патронами", model = "models/items/battery.mdl", id = "ammos"}})
		:Tier(59)
			:Paid({ Type = "unbox", Reward = "Кейс с Оружием #2"})
		:Tier(60)
			:Paid({ Type = "money", Reward = 45000})
		:Tier(61)
			:Paid({ Type = "givedonateitem", Reward = {name = "+25 пропов", model = "models/props_phx/misc/soccerball.mdl", id = "25propov"}})
		:Tier(62)
			:Free({ Type = "money", Reward = 45000})
			:Paid({ Type = "giveweapon", Reward = {name = "KRISS Vector", model = "models/weapons/w_kriss_vector.mdl", entity = "m9k_vector", current = 2}})
		:Tier(63)
			:Paid({ Type = "money", Reward = 45000})
		:Tier(64)
			:Free({ Type = "giveweapon", Reward = {name = "Thompson Contender G2", model = "models/props_phx/misc/soccerball.mdl", entity = "m9k_contender", current = 2}})
			:Paid({ Type = "money", Reward = 45000})
		:Tier(65)
			:Paid({ Type = "givedonateitem", Reward = {name = "Пистолет Deagle", model = "models/weapons/w_pist_deagle.mdl", id = "swb_deagle"}})
		:Tier(66)
			:Free({ Type = "giveweapon", Reward = {name = "m9k_ithacam37", model = "models/props_phx/misc/soccerball.mdl", entity = "m9k_ithacam37", current = 2}})
			:Paid({ Type = "givedonateitem", Reward = {name = "+75 пропов", model = "models/props_phx/misc/soccerball.mdl", id = "75propov"}})
		:Tier(67)
			:Paid({ Type = "money", Reward = 45000})
		:Tier(68)
			:Free({ Type = "money", Reward = 45000})
			:Paid({ Type = "money", Reward = 45000})
		:Tier(69)
			:Paid({ Type = "giveweapon", Reward = {name = "Balrog V G36C", model = "models/weapons/w_kriss_vector.mdl", entity = "g36_balrog", current = 3}})
		:Tier(70)
			:Free({ Type = "money", Reward = 45000})
			:Paid({ Type = "unbox", Reward = "Кейс Бомж"})
		:Tier(71)
			:Paid({ Type = "money", Reward = 55000})
		:Tier(72)
			:Paid({ Type = "givedonateitem", Reward = {name = "+25 пропов", model = "models/props_phx/misc/soccerball.mdl", id = "25propov"}})
		:Tier(73)
			:Free({ Type = "donatemoney", Reward = 5})
			:Paid({ Type = "money", Reward = 55000})
		:Tier(74)
			:Paid({ Type = "giveweapon", Reward = {name = "KRISS Vector", model = "models/weapons/w_kriss_vector.mdl", entity = "m9k_vector", current = 2}})
		:Tier(75)
			:Free({ Type = "perm_var", Reward = "jobsektant", Name = "Сектант", Display = "models/dejtriyev/cof/psycho.mdl"})
			:Paid({ Type = "donatemoney", Reward = 25})
		:Tier(76)
			:Free({ Type = "unbox", Reward = "Кейс с Оружием"})
			:Paid({ Type = "unbox", Reward = "Кейс Богач"})
		:Tier(77)
			:Paid({ Type = "money", Reward = 55000})
		:Tier(78)
			:Free({ Type = "giveweapon", Reward = {name = "Smart Pistol из Titanfall", model = "models/weapons/p2011sp/w_p2011sp.mdl", entity = "mp_weapon_smart_pistol", current = 3}})
			:Paid({ Type = "unbox", Reward = "Кейс Бомж"})
		:Tier(79)
			:Free({ Type = "money", Reward = 45000})
			:Paid({ Type = "unbox", Reward = "Лотерейный Кейс"})
		:Tier(80)
			:Free({ Type = "giveweapon", Reward = {name = "Smart Pistol из Titanfall", model = "models/weapons/p2011sp/w_p2011sp.mdl", entity = "mp_weapon_smart_pistol", current = 3}})
			:Paid({ Type = "money", Reward = 55000})
		:Tier(81)
			:Free({ Type = "money", Reward = 45000})
		:Tier(82)
			:Paid({ Type = "money", Reward = 55000})
		:Tier(83)
			:Paid({ Type = "unbox", Reward = "Лотерейный Кейс"})
		:Tier(84)
			:Free({ Type = "giveweapon", Reward = {name = "PKM", model = "models/weapons/w_mach_russ_pkm.mdl", entity = "m9k_pkm", current = 3}})
			:Paid({ Type = "unbox", Reward = "Лотерейный Кейс"})
		:Tier(85)
			:Free({ Type = "giveweapon", Reward = {name = "m9k_ithacam37", model = "models/props_phx/misc/soccerball.mdl", entity = "m9k_ithacam37", current = 4}})
			:Paid({ Type = "unbox", Reward = "Кейс Бомж"})
		:Tier(86)
			:Free({ Type = "money", Reward = 45000})
			:Paid({ Type = "money", Reward = 55000})
		:Tier(87)
			:Paid({ Type = "unbox", Reward = "Кейс Бомж"})
		:Tier(88)
			:Free({ Type = "donatemoney", Reward = 15})
			:Paid({ Type = "perm_var", Reward = "jobspongebob", Name = "Спанч Боб", Display = "models/larryeedwards/misc/drunksb/sb_drunk.mdl"})
		:Tier(89)
			:Paid({ Type = "givedonateitem", Reward = {name = "+25 пропов", model = "models/props_phx/misc/soccerball.mdl", id = "25propov"}})
		:Tier(90)
			:Free({ Type = "giveweapon", Reward = {name = "m9k_ithacam37", model = "models/props_phx/misc/soccerball.mdl", entity = "m9k_ithacam37", current = 2}})
			:Paid({ Type = "money", Reward = 55000})
		:Tier(91)
			:Paid({ Type = "giveweapon", Reward = {name = "Thompson Contender G2", model = "models/weapons/w_g2_contender.mdl", entity = "m9k_contender", current = 2}})
			:Paid({ Type = "money", Reward = 55000})
		:Tier(92)
			:Paid({ Type = "unbox", Reward = "Лотерейный Кейс"})
		:Tier(93)
			:Free({ Type = "money", Reward = 55000})
			:Paid({ Type = "unbox", Reward = "Кейс с Оружием #2"})
		:Tier(94)
			:Free({ Type = "giveweapon", Reward = {name = "FG 42", model = "models/props_phx/misc/soccerball.mdl", entity = "m9k_fg42", current = 2}})
			:Paid({ Type = "giveweapon", Reward = {name = "m9k_ithacam37", model = "models/props_phx/misc/soccerball.mdl", entity = "m9k_ithacam37", current = 2}})
		:Tier(95)
			:Paid({ Type = "money", Reward = 55000})
		:Tier(96)
			:Free({ Type = "money", Reward = 55000})
			:Paid({ Type = "givedonateitem", Reward = {name = "+50 пропов", model = "models/props_phx/misc/soccerball.mdl", id = "50propov"}})
		:Tier(97)
			:Free({ Type = "giveweapon", Reward = {name = "Balrog V G36C", model = "models/weapons/w_kriss_vector.mdl", entity = "g36_balrog", current = 2}})
			:Paid({ Type = "money", Reward = 65000})
		:Tier(98)
			:Paid({ Type = "unbox", Reward = "Кейс с Оружием #2"})
		:Tier(99)
			:Free({ Type = "giveweapon", Reward = {name = "FG 42", model = "models/props_phx/misc/soccerball.mdl", entity = "m9k_fg42", current = 2}})
			:Paid({ Type = "givedonateitem", Reward = {name = "Сумка з патронами", model = "models/items/battery.mdl", id = "ammos"}})
		:Tier(100)
			:Free({ Type = "unbox", Reward = "Кейс с Оружием #2"})
			:Paid({ Type = "givedonateitem", Reward = {name = "Cry Pistol", model = "models/w_models/w_pistol_dual_dmc3.mdl", id = "weapon_ebony_ivory"}})
			----------------------------------------------
			----------------------------------------------
			----------------------------------------------
			----------------------------------------------
			----------------------------------------------
			----------------------------------------------
			----------------------------------------------
			----------------------------------------------
			----------------------------------------------
			----------------------------------------------
			----------------------------------------------
			----------------------------------------------
			----------------------------------------------
			----------------------------------------------
			----------------------------------------------
		-- :Tier(38)
		-- 	:Paid({ Type = "money", Reward = 100000})
		-- :Tier(39)
		-- 	:Free({ Type = "giveweapon", Reward = {name = "FG 42", model = "models/weapons/w_fg42.mdl", entity = "m9k_fg42"}})
		-- 	:Paid({ Type = "money", Reward = 70000})
		-- :Tier(40)
		-- 	:Paid({ Type = "givehat", Reward = {name = "Cap [Gray F]", model = "models/modified/hat07.mdl", id = "symbolcap1"}})
		-- :Tier(41)
		-- 	:Paid({ Type = "giveweapon", Reward = {name = "Double Barrel", model = "models/weapons/w_double_barrel_shotgun.mdl", entity = "m9k_dbarrel"}})
		-- :Tier(42)
		-- 	:Free({ Type = "givedonateitem", Reward = {name = "+25 пропов", model = "models/props_phx/misc/soccerball.mdl", id = "25propov"}})
		-- 	:Paid({ Type = "unbox", Reward = "Кейс с Привилегиями"})
		-- :Tier(43)
		-- 	:Paid({ Type = "money", Reward = 50000})
		-- :Tier(44)
		-- 	:Free({ Type = "givedonateitem", Reward = {name = "Mauser M1896", model = "models/weapons/w_royl_p228.mdl", id = "mauserdragon"}})
		-- 	:Paid({ Type = "unbox", Reward = "Лотерейный Кейс"})
		-- :Tier(45)
		-- 	:Paid({ Type = "givedonateitem", Reward = {name = "Аанг планер", model = "models/avatar/Aang_Glider_Closed.mdl", id = "weapon_aang_glider"}})
		-- :Tier(46)
		-- 	:Free({ Type = "givedonateitem", Reward = {name = "+10 пропов", model = "models/props_phx/misc/soccerball.mdl", id = "10propov"}})
		-- 	:Paid({ Type = "money", Reward = 300000})
		-- :Tier(47)
		-- 	:Paid({ Type = "givedonateitem", Reward = {name = "+75 пропов", model = "models/props_phx/misc/soccerball.mdl", id = "75propov"}})
		-- :Tier(48)
		-- 	:Free({ Type = "givedonateitem", Reward = {name = "+25 пропов", model = "models/props_phx/misc/soccerball.mdl", id = "25propov"}})
		-- 	:Paid({ Type = "unbox", Reward = "Лотерейный Кейс"})
		-- :Tier(50)
		-- 	:Free({ Type = "money", Reward = 100000})
		-- 	:Paid({ Type = "donatemoney", Reward = 20})
		-- :Tier(52)
		-- 	:Free({ Type = "givedonateitem", Reward = {name = "Winchester 87", model = "models/weapons/w_winchester_1887.mdl", id = "m9k_1887winchester"}})
		-- 	:Paid({ Type = "perm_var", Reward = "antihunger", Name = "Анти голод", Display = "models/props_phx/misc/soccerball.mdl"})


	:Challenges()
		:Category("Free")
			:Challenge("buy_kvartir_10")
				:Stage({ Progress = 10, Reward = 5 })
			:Challenge("vzlom_kvartir_5")
				:Stage({ Progress = 5, Reward = 5 })
			:Challenge("mer_com4as_2")
				:Stage({ Progress = 2, Reward = 5 })
			:Challenge("zareshuite_5_ludey_za_professiy_policeiskiy")
				:Stage({ Progress = 5, Reward = 5 })
			:Challenge("zarobi_100000_za_profesiy_bitmainer")
				:Stage({ Progress = 100000, Reward = 5 })
			:Challenge("vikonai_5_zakazov_za_naemnika")
				:Stage({ Progress = 5, Reward = 5 })
			:Challenge("prodai_15_licenziy_buduchi_merom")
				:Stage({ Progress = 15, Reward = 5 })
			:Challenge("prodai_20_narcoti4_zacobiv_za_profeciy_narkodiller")
				:Stage({ Progress = 20, Reward = 5 })
			:Challenge("zarobi_100000_za_prodaj_meta")
				:Stage({ Progress = 100000, Reward = 5 })
			:Challenge("spimai_5tix_ludey_za_maniaka")
				:Stage({ Progress = 5, Reward = 5 })
			:Challenge("prodai_5_avtomatov_za_prodavza_zbroi")
				:Stage({ Progress = 5, Reward = 5 })
		:Category("PREMIUM")
			:Challenge("zakazi_5_chelovek")
				:Stage({ Progress = 5, Reward = 5 })
			:Challenge("podari_bezdomnomu_25000")
				:Stage({ Progress = 25000, Reward = 5 })
			:Challenge("posidet_v_turme_5_raz")
				:Stage({ Progress = 5, Reward = 5 })
			:Challenge("nakopit_250000")
				:Stage({ Progress = 250000, Reward = 5 })

-- When you're done make sure to have :Construct() at the end. This will make the config work!
:Construct()

-- Chat commands to open the menu
-- ["chatcommand"] = true
BATTLEPASS.Config.ChatCommands = {
}
--PATH addons/battlepass/lua/battlepass/menu/main.lua:
local materialid = BATTLEPASS.Materials
local colorid = BATTLEPASS.Colors
local function buildCircle( x, y, radius, seg )
    local cir = {}
    table.insert( cir, {
        x = x,
        y = y,
        u = 0.5,
        v = 0.5
    } )

    for i = 0, seg do
        local a = math.rad( i / seg * -360 )
        table.insert( cir, {
            x = x + math.sin( a ) * radius,
            y = y + math.cos( a ) * radius,
            u = math.sin( a ) * 0.5 + 0.5,
            v = math.cos( a ) * 0.5 + 0.5
        } )
    end

    local a = math.rad( 0 )
    table.insert( cir, {
        x = x + math.sin( a ) * radius,
        y = y + math.cos( a ) * radius,
        u = math.sin( a ) * 0.5 + 0.5,
        v = math.cos( a ) * 0.5 + 0.5
    } )
    return cir
end

local sndstation
concommand.Add( 'battlepass', function()
    local d = BATTLEPASS.TimeCountdown and isnumber( BATTLEPASS.TimeCountdown - CurTime() ) and string.FormattedTime( BATTLEPASS.TimeCountdown - os.time() ) or false
    if BATTLEPASS.TimeCountdown and math.Round( d.h / 24 ) < 0 then
        chat.AddText( "Час Battlepass прийшов до кінця, чекайте на новий." )
        return
    end

    local framesize1, framesize2 = W( 1493 ), H( 919 )
    local windowsize1, windowsize2 = W( 1424 ), H( 796 )
    if IsValid( frame ) then
        if sndstation then sndstation:Stop() end
        frame:Remove()
    end

    sound.PlayFile( "sound/battlepass_sound.mp3", "mono", function( station, errCode, errStr )
        if IsValid( station ) then
            sndstation = station
            station:Play()
        else
            print( "Error playing sound!", errCode, errStr )
        end
    end )

    frame = vgui.Create( 'EditablePanel' )
    frame:SetSize( framesize1, framesize2 )
    frame:Center()
    frame:MakePopup()
    frame.Paint = nil
    frame.OnRemove = function()
        if sndstation then sndstation:Stop() end
        hook.Remove( 'PreRender', 'BattlePass' )
    end

    frame.Think = function()
        if not hook.GetTable()['PreRender'] or not hook.GetTable()['PreRender']['BattlePass'] then
            hook.Add( 'PreRender', 'BattlePass', function()
                if not IsValid( frame ) then
                    hook.Remove( 'PreRender', 'BattlePass' )
                    return
                end

                if input.IsButtonDown( KEY_ESCAPE ) then
                    if gui.IsGameUIVisible() then
                        gui.HideGameUI()
                    else
                        gui.ActivateGameUI()
                    end

                    frame:Remove()
                end

                if input.IsButtonDown( KEY_F6 ) then frame:Remove() end
                if sndstation and sndstation:GetTime() >= sndstation:GetLength() - 0.001 then
                    sndstation:SetTime( 0 )
                    sndstation:Play()
                end
            end )
        end
    end

    local panel = vgui.Create( 'DPanel', frame )
    panel:SetSize( framesize1, framesize2 )
    panel.imagetype = 1
    panel.imagetbl = {
        ['РІВЕНЬ'] = materialid.bgpass,
        ['ЗАВДАННЯ'] = materialid.bgchallenge
    }

    panel.Paint = function( s, w, h )
        draw.Icon( 0, H( 65 ), windowsize1, windowsize2, s.imagetbl[s.imagetype] or materialid.bgpass )
        draw.Icon( W( 24 ), H( 20 ), W( 439 ), H( 165 ), materialid.name )
        draw.Icon( W( 316 ), H( 134 ), W( 105 ), H( 50 ), materialid.new3 )
        --
        -- draw.DrawText('СЕЗОН ' .. BATTLEPASS.Season, 'font_season', W(328), H(145), color_white) -- Ждём шрифт
        --
        draw.Icon( -3, H( 730 ), W( 1432 ), H( 139 ), materialid.bord )
        draw.Icon( W( 438 ), 0, W( 1055 ), h, materialid.postdraw )
    end

    panel.panel = vgui.Create( 'DPanel', panel )
    panel.panel:SetSize( W( 477 ), H( 131 ) )
    panel.panel:SetPos( W( 948 ), H( 74 ) )
    panel.panel.Paint = function( s, w, h )
        draw.Icon( 0, 0, w, h, materialid.bordinfo )
        local tbl = LocalPlayer().BattlePass.Owned
        draw.SimpleText( 'XP', 'font_xp', W( 41 ), h * 0.5 - H( 5 ), colorid.salat, nil, 1 )
        draw.SimpleText( tbl.progress, "font_bplevel", W( 80 ), h * 0.5 - H( 5 ), color_white, nil, 1 )
        draw.SimpleText( 'LVL', 'font_xp', W( 149 ), h * 0.5 - H( 5 ), colorid.salat, nil, 1 )
        draw.SimpleText( tbl.tier, "font_bplevel", W( 196 ), h * 0.5 - H( 5 ), color_white, nil, 1 )
    end

    panel.panel.btn = vgui.Create( 'DButton', panel.panel )
    panel.panel.btn:SetSize( W( 117 ), H( 33 ) )
    panel.panel.btn:SetPos( W( 320 ), H( 45 ) )
    panel.panel.btn:SetText( '' )
    panel.panel.btn.color = ColorAlpha( color_white )
    panel.panel.btn.Paint = function( s, w, h )
        s.color.a = Lerp( FrameTime() * 3, s.color.a or 255, s:IsHovered() and 50 or 255 )
        draw.Icon( 0, 0, w, h, materialid.new2, s.color )
    end

    panel.panel.btn.DoClick = function( s )
        frame:Remove()
        RunConsoleCommand( 'say', '/donate' )
    end

    local activepnl = vgui.Create( 'DPanel', panel )
    activepnl:SetPos( W( 24 ), H( 185 ) )
    activepnl:SetSize( W( 945 ), H( 531 ) )
    activepnl.Paint = nil
    local ply = LocalPlayer()
    BATTLEPASS:SetupPass( ply )
    local Navbar = panel:Add( 'BATTLEPASS.Navbar_' )
    Navbar:SetPos( W( 590 ), H( 125 ) )
    Navbar:SetSize( W( 250 ), H( 25 ) )
    Navbar:SetBody( activepnl, panel )
    Navbar:AddTab( 'РІВЕНЬ', 'BATTLEPASS_Pass' )
    Navbar:AddTab( 'ЗАВДАННЯ', 'BATTLEPASS.Challenges.Challenge' )
    Navbar:SetActive( 'РІВЕНЬ' )
    --
    local downpnl = vgui.Create( 'DPanel', panel )
    downpnl:SetSize( W( 1424 ), H( 124 ) )
    downpnl:SetPos( 0, H( 737 ) )
    downpnl.Paint = nil
    downpnl.btn = vgui.Create( 'DButton', downpnl )
    downpnl.btn:SetSize( W( 260 ), H( 82 ) )
    downpnl.btn:SetPos( W( 1424 ) * 0.5 - W( 260 ) * 0.5, H( 25 ) )
    downpnl.btn:SetText( '' )
    downpnl.btn.Paint = function( s, w, h )
        s.alpha = Lerp( FrameTime() * 3, s.alpha or 255, s:IsHovered() and 50 or 255 )
        draw.Icon( 0, 0, w, h, materialid.buybtn, ColorAlpha( color_white, s.alpha ) )
    end

    downpnl.btn.DoClick = function( s )
        if not LocalPlayer().BattlePass.Owned.owned then
            frame:Remove()
            RunConsoleCommand( 'say', '/donate' )
        end
    end

    panel.info = vgui.Create( 'DPanel', downpnl )
    panel.info:SetSize( W( 250 ), H( 100 ) )
    panel.info:SetPos( W( 1076 ), H( 1 ) )
    panel.info.Paint = function( s, w, h )
        draw.SimpleText( LocalPlayer():Name(), 'font_bpname', W( 92 ), H( 31 ), color_white )
        local tbl = LocalPlayer().BattlePass.Owned
        local str = tbl.tier
        DrawFlexText( { { 'У ВАС', ColorAlpha( color_white, 255 * .2 ) }, { str .. ' LVL', colorid.salat } }, 'font_bplevelmini', W( 92 ), H( 50 ) )
        if BATTLEPASS.TimeCountdown and BATTLEPASS.TimeCountdown > CurTime() then DrawFlexText( { { 'Подія закінчиться через:', ColorAlpha( color_white, 255 * .2 ) }, { math.Round( d.h / 24 ) }, { 'днів' } }, 'font_bplevelmini', W( 16 ), H( 85 ) ) end
    end

    panel.info.preavatar = vgui.Create( "EditablePanel", panel.info )
    panel.info.preavatar:SetSize( W( 64 ), W( 64 ) )
    panel.info.preavatar:SetPos( W( 16 ), W( 16 ) )
    panel.info.avatar = vgui.Create( "AvatarImage", panel.info.preavatar )
    panel.info.avatar:Dock( FILL )
    panel.info.avatar:SetPlayer( LocalPlayer(), W( 64 ) )
    panel.info.avatar:SetPaintedManually( true )
    panel.info.preavatar:InvalidateParent( true )
    local poly = buildCircle( panel.info.preavatar:GetWide() * 0.5, panel.info.preavatar:GetTall() * 0.5, panel.info.preavatar:GetWide() * 0.6, 100 )
    panel.info.preavatar.Paint = function( s, w, h )
        render.ClearStencil()
        render.SetStencilEnable( true )
        render.SetStencilWriteMask( 1 )
        render.SetStencilTestMask( 1 )
        render.SetStencilFailOperation( STENCILOPERATION_REPLACE )
        render.SetStencilPassOperation( STENCILOPERATION_ZERO )
        render.SetStencilZFailOperation( STENCILOPERATION_ZERO )
        render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_NEVER )
        render.SetStencilReferenceValue( 1 )
        draw.NoTexture()
        surface.DrawPoly( poly )
        render.SetStencilFailOperation( STENCILOPERATION_ZERO )
        render.SetStencilPassOperation( STENCILOPERATION_REPLACE )
        render.SetStencilZFailOperation( STENCILOPERATION_ZERO )
        render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_EQUAL )
        render.SetStencilReferenceValue( 1 )
        panel.info.avatar:PaintManual()
        render.SetStencilEnable( false )
        render.ClearStencil()
    end
end )
--PATH addons/________anticrash/lua/z_anticrash/panels/p_users.lua:
-- [[ CREATED BY ZOMBIE EXTINGUISHER ]]

local PANEL = {}
local lastOpenedUser = nil


function PANEL:InitOther()
		
	local pWide = self:GetSize()
	local filterPanels = {}
	
	// Search bar
	local searchInput = self:Add('onyx.TextEntry', self)
	searchInput:SetTall(30)
	searchInput:SetPlaceholderText(SH_ANTICRASH.Translate("search"))
    searchInput:Highlight(Color(150, 150, 150))
	
	CL_ANTICRASH.HookSearchInputFilter(searchInput,filterPanels)
	
	// Player panels
	local panelOffset = 10
	local plyPanelW = pWide-(panelOffset*2)
	local plyPanelH, plyPanelHE = 30, 194
	
	local startY = searchInput:GetBottomY()+panelOffset
	local prevPlyPanel = nil
		
	local function AddPlayerPanel(ply)
		
		local plyPanel = self:Add("DPanel")
		plyPanel:DockMargin(5, 10, 8, 5)
		plyPanel:SetTall(plyPanelH)
		local nick = ply:Nick()
		
		plyPanel.isExpanded = false
		plyPanel.prevPnl = prevPlyPanel
		plyPanel.panelOffset = panelOffset
		
		plyPanel.Think = function(self)
			
			if self.prevPnl then
				self:SetPos(panelOffset,self.prevPnl:GetBottomY()+panelOffset)
			else
				self:SetPos(panelOffset,startY)
			end
			
		end
		
		prevPlyPanel = plyPanel
		table.insert(filterPanels,{
			filterStr = nick,
			filterPanel = plyPanel
		})

		local plyBtn = vgui.Create("onyx.Button", plyPanel)
		plyBtn:SetSize(plyPanelW,plyPanelH)
		plyBtn:SetFont(onyx.Font('Comfortaa@22'))
		plyBtn:SetText(nick)
		plyBtn.icon = onyx.wimg.Simple('https://i.imgur.com/OolNq4H.png', 'smooth mips')
		
		local flagCol = ColorAlpha(onyx:Config('colors.negative'),150) 
		plyBtn.oldPaint = plyBtn.Paint
		plyBtn.Paint = function(self, w, h)
			self.oldPaint(self,w, h)

			
			local flagCount = ply:z_anticrashGetFlaggedCount()
			
			if 5 > 0 then
			
				-- Flag icon
				local flagOffset = 7
				local flagSize = h-(flagOffset*2)
				local flagX = w-flagSize-flagOffset
				self.icon( flagX, flagOffset, flagSize, flagSize, flagCol )
				
				-- Flag txt
				local flagTxtW, flagTxtH = onyx.GetTextSize(flagCount, onyx.Font('Comfortaa@20'))
				
				onyx.hud.DrawCheapText( flagCount, onyx.Font('Comfortaa@20'), flagX-flagTxtW, h*0.5-flagTxtH*0.5, flagCol )
				
				
			end
			
		end
		plyBtn.DoClick = function(self)
			
			local newH = plyPanelHE
			
			if plyPanel.isExpanded then
				newH = plyPanelH
				
				-- Only reset last choice when no other active panel was opened
				if lastOpenedUser == ply then
					lastOpenedUser = nil
				end
				
			else
				lastOpenedUser = ply
			end
			
			plyPanel:SizeTo( -1, newH, 0.25 )
			plyPanel.isExpanded = !plyPanel.isExpanded
			
		end
		
		if lastOpenedUser == ply then
			plyBtn:DoClick()
		end
		
		-- Info panels
		local infoPnlOffset = 6
		local infoPnlW, infoPnlH = plyPanelW*0.5 - (infoPnlOffset*1.5), 22
		
		local entInfoPanel = CL_ANTICRASH.CreateUserInfoPanel(infoPnlOffset, plyBtn:GetBottomY()+infoPnlOffset, infoPnlW, infoPnlH, SH_ANTICRASH.Translate("entities"), "ENTITIES", "GetEntityCount", ply, plyPanel)
		CL_ANTICRASH.CreateUserInfoPanel(entInfoPanel:GetRightX()+infoPnlOffset, plyBtn:GetBottomY()+infoPnlOffset, infoPnlW, infoPnlH, SH_ANTICRASH.Translate("spawned"), "SPAWNEDENTS", "GetSpawnedEntitiesCount", ply, plyPanel)
		
		local propInfoPanel = CL_ANTICRASH.CreateUserInfoPanel(infoPnlOffset, entInfoPanel:GetBottomY()+infoPnlOffset, infoPnlW, infoPnlH, SH_ANTICRASH.Translate("props"), "PROPS", "GetPropCount", ply, plyPanel)
		local constraintsInfoPanel = CL_ANTICRASH.CreateUserInfoPanel(propInfoPanel:GetRightX()+infoPnlOffset, entInfoPanel:GetBottomY()+infoPnlOffset, infoPnlW, infoPnlH, SH_ANTICRASH.Translate("constraints"), "CONSTRAINTS", "GetConstraintCount", ply, plyPanel)
		
		-- Entity vision button
		local buttonW, buttonH = plyPanelW - (infoPnlOffset*2), 20
		local entVisionHasPlayer = CL_ANTICRASH.ENTVISION.HasPlayer(ply)
		
		local function entVisionBtnText()
			return entVisionHasPlayer and SH_ANTICRASH.Translate("hideEntities") or SH_ANTICRASH.Translate("showEntities")
		end

		local entityVisionBtn = vgui.Create("onyx.Button", plyPanel)
		entityVisionBtn:SetPos(infoPnlOffset,constraintsInfoPanel:GetBottomY()+(infoPnlOffset*3))
		entityVisionBtn:SetSize(buttonW, buttonH)
		entityVisionBtn:SetText(entVisionBtnText())
		entityVisionBtn.DoClick = function(s)
			if !entVisionHasPlayer then
				CL_ANTICRASH.ENTVISION.AddPlayer(ply)
			else
				CL_ANTICRASH.ENTVISION.RemovePlayer(ply)
			end
			
			entVisionHasPlayer = !entVisionHasPlayer
			s:SetText(entVisionBtnText())
		end
		
		-- Entity Control buttons
		local freezeEntsBtn = vgui.Create("onyx.Button", plyPanel)
		freezeEntsBtn:SetPos(infoPnlOffset, entityVisionBtn:GetBottomY()+(infoPnlOffset*3))
		freezeEntsBtn:SetSize(buttonW, buttonH)
		freezeEntsBtn:SetText(SH_ANTICRASH.Translate("freezeEntities"))
		freezeEntsBtn.DoClick = function(s)
			net.Start("sv_anticrash_FreezeEntitiesFrom")
				net.WriteEntity(ply)
			net.SendToServer()
		end
	
		local removeEntsBtn = vgui.Create("onyx.Button", plyPanel)
		removeEntsBtn:SetPos(infoPnlOffset, freezeEntsBtn:GetBottomY()+infoPnlOffset)
		removeEntsBtn:SetSize(buttonW, buttonH)
		removeEntsBtn:SetText(SH_ANTICRASH.Translate("removeEntities"))
		removeEntsBtn.DoClick = function(s)
			net.Start("sv_anticrash_RemoveEntitiesFrom")
				net.WriteEntity(ply)
			net.SendToServer()
		end
		
		local userInfoDivider = constraintsInfoPanel:GetBottomY()+infoPnlOffset
		local entVisionDivider = entityVisionBtn:GetBottomY()+infoPnlOffset
		local col = onyx.OffsetColor(onyx:Config('colors.primary'), -5)
		plyPanel.Paint = function(self, w, h)
		
			-- Bg
			onyx.hud.DrawRoundedBox( 0, 0, buttonW + 12, h, onyx:Config('colors.primary') )
			
			-- Divider lines
			-- local dividerW = w*0.5
			-- local dividerX = w*0.5-(dividerW*0.5)
			onyx.hud.DrawRoundedBox( 0, userInfoDivider, buttonW + 12, 4, col )
			onyx.hud.DrawRoundedBox( 0, entVisionDivider, buttonW + 12, 4, col )
			
		end
	
	end
	

	local plys = player.GetAll()
	
	-- Sort players alphabetically & by flags
	table.sort( plys, function(a, b) 
		
		local aFlags = a:z_anticrashGetFlaggedCount()
		local bFlags = b:z_anticrashGetFlaggedCount()
		
		if aFlags == bFlags then
			return a:Nick():lower() < b:Nick():lower()
		end
		
		return aFlags > bFlags
		
	end )
	
	for i=1, #plys do
		AddPlayerPanel(plys[i])
	end
end
vgui.Register('p_anticrash_users',PANEL,'onyx.ScrollPanel')
--PATH addons/____bricks_framework/lua/bricks_server/vgui/bricks_server_admin.lua:
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
    for k, v in ipairs( player.GetAll() ) do
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
            draw.SimpleText( name, "BRICKS_SERVER_Font23", h+5, h*0.5+2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_BOTTOM )
            draw.SimpleText( steamID != "NULL" and steamID or "BOT", "BRICKS_SERVER_Font17", h+5, h*0.5-2, BRICKS_SERVER.Func.GetTheme( 6, 75 ), 0, 0 )

            draw.RoundedBox( 8, h+5+nameX+5, (h*0.5+2)-boxH-3, boxW, boxH, ((group or {})[3] or BRICKS_SERVER.Func.GetTheme( 5 )) )
            draw.SimpleText( rankName, "BRICKS_SERVER_Font18", h+5+nameX+5+(boxW*0.5), (h*0.5+2-3)-(boxH*0.5), BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
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
            
                    draw.SimpleText( key .. " " .. val2[1], "BRICKS_SERVER_Font21", w*0.5, h*0.5, BRICKS_SERVER.Func.GetTheme( 6, 75+((alpha/75)*180) ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
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
--PATH addons/____bricks_framework/lua/bricks_server/vgui/bricks_server_circle_avatar.lua:
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

function PANEL:Paint( w, h )
	render.ClearStencil()
	render.SetStencilEnable( true )

	render.SetStencilWriteMask( 1 )
	render.SetStencilTestMask( 1 )

	render.SetStencilFailOperation( STENCILOPERATION_REPLACE )
	render.SetStencilPassOperation( STENCILOPERATION_ZERO )
	render.SetStencilZFailOperation( STENCILOPERATION_ZERO )
	render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_NEVER )
	render.SetStencilReferenceValue( 1 )

	draw.NoTexture()
	surface.SetDrawColor( Color( 0, 0, 0, 255 ) )
    BRICKS_SERVER.Func.DrawCircle( w*0.5, h*0.5, h*0.5, w*0.5 )

	render.SetStencilFailOperation( STENCILOPERATION_ZERO )
	render.SetStencilPassOperation( STENCILOPERATION_REPLACE )
	render.SetStencilZFailOperation( STENCILOPERATION_ZERO )
	render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_EQUAL )
	render.SetStencilReferenceValue( 1 )

	self.avatar:PaintManual()

	render.SetStencilEnable( false )
	render.ClearStencil()
end
 
vgui.Register( "bricks_server_circle_avatar", PANEL )
--PATH addons/____bricks_framework/lua/bricks_server/vgui/bricks_server_config_modules.lua:
local PANEL = {}

function PANEL:Init()

end

function PANEL:FillPanel()
    self.panelWide = ScrW()*0.6-BRICKS_SERVER.DEVCONFIG.MainNavWidth

    surface.SetFont( "BRICKS_SERVER_Font20" )
    local headerX, headerY = surface.GetTextSize( BRICKS_SERVER.Func.L( "changesServerRestart" ) )
    local fullWidth = 60+headerX+35

    self.topBar = vgui.Create( "DPanel", self )
    self.topBar:Dock( TOP )
    self.topBar:SetTall( 60 )
    local noticeMat = Material( "bricks_server/warning.png" )
    self.topBar.Paint = function( self, w, h ) 
        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 2 ) )
        surface.DrawRect( 0, 0, w, h )

        -- Notice --
        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 3 ) )
        surface.DrawRect( w-fullWidth, 0, fullWidth, h )
        
        surface.SetDrawColor( BRICKS_SERVER.DEVCONFIG.BaseThemes.Red )
        surface.DrawRect( w-fullWidth, 0, h, h )

        surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
        surface.SetMaterial( noticeMat )
        local iconSize = 32
        surface.DrawTexturedRect( w-fullWidth+(h*0.5)-(iconSize*0.5), (h*0.5)-(iconSize*0.5), iconSize, iconSize )

        draw.SimpleText( BRICKS_SERVER.Func.L( "changesServerRestart" ), "BRICKS_SERVER_Font20", w-fullWidth+60+((fullWidth-60)*0.5), h*0.5, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
    end 

    self.searchBar = vgui.Create( "bricks_server_searchbar", self.topBar )
    self.searchBar:Dock( LEFT )
    self.searchBar:DockMargin( 25, 10, 10, 10 )
    self.searchBar:SetWide( math.min( ScrW()*0.2, self.panelWide-fullWidth-50 ) )
    self.searchBar:SetBackColor( BRICKS_SERVER.Func.GetTheme( 1 ) )
    self.searchBar:SetHighlightColor( BRICKS_SERVER.Func.GetTheme( 0 ) )
    self.searchBar.OnChange = function()
        self:Refresh()
    end

    self.scrollPanel = vgui.Create( "bricks_server_scrollpanel_bar", self )
    self.scrollPanel:Dock( FILL )
    self.scrollPanel:DockMargin( 25, 25, 25, 25 )
    self.scrollPanel.Paint = function( self, w, h ) end 

    local spacing = 10
    local gridWide = self.panelWide-50-10-spacing
    local slotSize = 320
    local slotsWide = math.floor( gridWide/slotSize )
    self.slotWide, self.slotTall = (gridWide-((slotsWide-1)*spacing))/slotsWide, 0

    self.grid = vgui.Create( "DIconLayout", self.scrollPanel )
    self.grid:Dock( TOP )
    self.grid:SetSpaceY( spacing )
    self.grid:SetSpaceX( spacing )
    self.grid:SetTall( ScrH()*0.65 )

    self:Refresh()
end

function PANEL:Refresh()
    self.grid:Clear()

    local modules = {}
    for k, v in pairs( BRICKS_SERVER.DLCMODULES or {} ) do
        if( self.searchBar:GetValue() != "" and not string.find( string.lower( v.Name ), string.lower( self.searchBar:GetValue() ) ) ) then
            continue
        end

        local addDLC = true

        for key, val in pairs( v.Modules ) do
            if( BRICKS_SERVER.Modules[val] ) then
                addDLC = false
                break
            end
        end

        if( not addDLC ) then continue end

        local module = v
        module.Key = k
        module.DLC = true

        table.insert( modules, module )
    end

    for k, v in pairs( BRICKS_SERVER.Modules or {} ) do
        if( self.searchBar:GetValue() != "" and not string.find( string.lower( v[1] ), string.lower( self.searchBar:GetValue() ) ) ) then
            continue
        end

        table.insert( modules, {
            Key = k,
            Name = v[1],
            Icon = v[2],
            SubModules = v[3]
        } )
    end

    local subModuleTall, subModuleSpacing, iconSpacing = 25, 10, 75
    for k, v in pairs( modules ) do
        surface.SetFont( "BRICKS_SERVER_Font25" )
        local textX, textY = surface.GetTextSize( v.Name )

        local defaultSize = 25+textY+5+iconSpacing+64+iconSpacing+40+10+40+25

        self.slotTall = math.max( defaultSize, self.slotTall )
    end

    for k, v in pairs( modules ) do
        local moduleBack = vgui.Create( "DPanel", self.grid )
        moduleBack:SetSize( self.slotWide, self.slotTall )
        moduleBack.Paint = function( self2, w, h )
            draw.RoundedBox( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 3 ) )
        end
        
        surface.SetFont( "BRICKS_SERVER_Font25" )
        local textX, textY = surface.GetTextSize( v.Name )

        local moduleName = vgui.Create( "DPanel", moduleBack )
        moduleName:Dock( TOP )
        moduleName:DockMargin( 0, 25, 0, 0 )
        moduleName:SetTall( textY+5 )
        local wide = textX+20
        moduleName.Paint = function( self2, w, h )
            draw.RoundedBox( 8, (w*0.5)-(wide*0.5), 0, wide, h, BRICKS_SERVER.Func.GetTheme( 5 ) )

            draw.SimpleText( v.Name, "BRICKS_SERVER_Font25", w*0.5, h*0.5-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end

        local moduleIcon = vgui.Create( "DPanel", moduleBack )
        moduleIcon:Dock( TOP )
        moduleIcon:DockMargin( 0, iconSpacing, 0, (not v.DLC and iconSpacing) or 0 )
        moduleIcon:SetTall( 64 )
        local iconMat = Material( v.Icon )
        moduleIcon.Paint = function( self2, w, h )
            surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
            surface.SetMaterial( iconMat )
            local iconSize = 64
            surface.DrawTexturedRect( (w*0.5)-(iconSize*0.5), (h*0.5)-(iconSize*0.5), iconSize, iconSize )
        end

        local subModulesBack
        if( not v.DLC and table.Count( v.SubModules or {} ) > 0 ) then
            subModulesBack = vgui.Create( "DPanel", moduleBack )
            subModulesBack:Dock( v.Key != "default" and TOP or BOTTOM )
            subModulesBack:DockMargin( 10, 0, 10, v.Key != "default" and 0 or 10 )
            subModulesBack:SetTall( 40 )
            subModulesBack.Paint = function( self2, w, h ) end
            subModulesBack.FillSubModules = function( self2 )
                subModulesBack.list:Clear()

                for key, val in pairs( v.SubModules or {} ) do
                    local subModuleBack = vgui.Create( "DPanel", subModulesBack.list )
                    subModuleBack:Dock( TOP )
                    subModuleBack:DockMargin( 20, 0, 20, subModuleSpacing )
                    subModuleBack:SetTall( subModuleTall )
                    subModuleBack.Paint = function( self2, w, h )
                        draw.SimpleText( val, "BRICKS_SERVER_Font20", 0, h*0.5, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
                    end
        
                    local moduleTable = BS_ConfigCopyTable.MODULES[v.Key]
                    local subModuleEnabled = moduleTable and moduleTable[1] == true and moduleTable[2] and moduleTable[2][key] and moduleTable[2][key] == true
        
                    local subModuleButton = vgui.Create( "bricks_server_dcheckbox", subModuleBack )
                    subModuleButton:Dock( RIGHT )
                    subModuleButton:SetValue( subModuleEnabled )
                    subModuleButton:SetTitle( "" )
                    subModuleButton.backgroundCol = BRICKS_SERVER.Func.GetTheme( 2 )
                    subModuleButton.OnChange = function( value )
                        BS_ConfigCopyTable.MODULES[v.Key][2][key] = value
                        BRICKS_SERVER.Func.ConfigChange( "MODULES" )
                    end

                    if( not moduleTable or moduleTable[1] != true ) then
                        subModuleButton:SetDisabled( true )
                    end
                end
            end

            local subModulesExpand = vgui.Create( "DButton", subModulesBack )
            subModulesExpand:Dock( TOP )
            subModulesExpand:SetTall( subModulesBack:GetTall() )
            subModulesExpand:SetText( "" )
            local alpha = 0
            local arrow = Material( "bricks_server/down_16.png" )
            subModulesExpand.textureRotation = -90
            subModulesExpand.Paint = function( self2, w, h )
                local expanded = subModulesBack:GetTall() > 40

                if( not self2:IsDown() and self2:IsHovered() ) then
                    alpha = math.Clamp( alpha+5, 0, 150 )
                else
                    alpha = math.Clamp( alpha-5, 0, 150 )
                end

                draw.RoundedBoxEx( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 2 ), true, true, not expanded, not expanded )

                surface.SetAlphaMultiplier( alpha/255 )
                draw.RoundedBoxEx( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ), true, true, not expanded, not expanded )
                surface.SetAlphaMultiplier( 1 )

                BRICKS_SERVER.Func.DrawClickCircle( self2, w, h, BRICKS_SERVER.Func.GetTheme( 1 ), 8 )

                draw.SimpleText( table.Count( v.SubModules or {} ) .. " Sub Modules", "BRICKS_SERVER_Font20", w*0.5, h*0.5-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

                surface.SetDrawColor( BRICKS_SERVER.Func.GetTheme( 6 ) )
                surface.SetMaterial( arrow )
                local iconSize = 16
                surface.DrawTexturedRectRotated( w-((h-iconSize)*0.5)-(iconSize*0.5), h*0.5, iconSize, iconSize, math.Clamp( (self2.textureRotation or 0), -90, 0 ) )
            end
            subModulesExpand.DoAnim = function( expanding )
                local anim = subModulesExpand:NewAnimation( 0.2, 0, -1 )
            
                anim.Think = function( anim, pnl, fraction )
                    if( expanding ) then
                        subModulesExpand.textureRotation = (1-fraction)*-90
                    else
                        subModulesExpand.textureRotation = fraction*-90
                    end
                end
            end
            subModulesExpand.DoClick = function()
                if( table.Count( v.SubModules or {} ) <= 0 ) then return end

                subModulesBack.Expanded = not subModulesBack.Expanded

                if( subModulesBack.Expanded ) then
                    subModulesBack.FillSubModules()

                    local listTall = (table.Count( v.SubModules or {} )*(subModuleTall+subModuleSpacing))+subModuleSpacing
                    subModulesBack:SizeTo( self.slotWide-20, 40+listTall, 0.2 )
                    moduleBack:SizeTo( self.slotWide, self.slotTall+listTall, 0.2 )
                    subModulesExpand.DoAnim( true )
                else
                    subModulesBack:SizeTo( self.slotWide-20, 40, 0.2, 0, -1, function() 
                        if( not IsValid( subModulesBack.list ) ) then return end

                        subModulesBack.list:Clear()
                    end )

                    moduleBack:SizeTo( self.slotWide, self.slotTall, 0.2 )

                    subModulesExpand.DoAnim( false )
                end
            end

            subModulesBack.list = vgui.Create( "DPanel", subModulesBack )
            subModulesBack.list:Dock( FILL )
            subModulesBack.list:DockPadding( 0, subModuleSpacing, 0, 0 )
            subModulesBack.list.Paint = function( self2, w, h ) 
                draw.RoundedBoxEx( 8, 0, 0, w, h, BRICKS_SERVER.Func.GetTheme( 1 ), false, false, true, true )
            end
        end
 
        if( v.Key != "default" ) then
            local moduleButton = vgui.Create( "DButton", moduleBack )
            moduleButton:Dock( BOTTOM )
            moduleButton:DockMargin( 10, 0, 10, 10 )
            moduleButton:SetTall( 40 )
            moduleButton:SetText( "" )
            local alpha = 0
            moduleButton.Paint = function( self2, w, h )
                local buttonText, buttonColor, buttonDownColor = BRICKS_SERVER.Func.L( "purchase" ), BRICKS_SERVER.Func.GetTheme( 5 ), BRICKS_SERVER.Func.GetTheme( 4 )

                if( not v.DLC ) then
                    local moduleEnabled = ((BS_ConfigCopyTable or BRICKS_SERVER.CONFIG).MODULES or {})[v.Key] and ((BS_ConfigCopyTable or BRICKS_SERVER.CONFIG).MODULES or {})[v.Key][1] == true

                    buttonText = (moduleEnabled and BRICKS_SERVER.Func.L( "enabled" )) or BRICKS_SERVER.Func.L( "disabled" )
                    buttonColor = (moduleEnabled and BRICKS_SERVER.DEVCONFIG.BaseThemes.Green) or BRICKS_SERVER.DEVCONFIG.BaseThemes.Red
                    buttonDownColor = (moduleEnabled and BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkGreen) or BRICKS_SERVER.DEVCONFIG.BaseThemes.DarkRed
                elseif( not v.Link ) then
                    buttonText = BRICKS_SERVER.Func.L( "comingSoon" )
                    buttonColor = BRICKS_SERVER.Func.GetTheme( 2 )
                    buttonDownColor = BRICKS_SERVER.Func.GetTheme( 1 )
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

                draw.SimpleText( buttonText, "BRICKS_SERVER_Font20", w*0.5, h*0.5-1, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
            end
            moduleButton.DoClick = function()
                if( not v.DLC ) then
                    BS_ConfigCopyTable.MODULES[v.Key] = BS_ConfigCopyTable.MODULES[v.Key] or {}
                    BS_ConfigCopyTable.MODULES[v.Key][1] = not BS_ConfigCopyTable.MODULES[v.Key][1]
                    BS_ConfigCopyTable.MODULES[v.Key][2] = BS_ConfigCopyTable.MODULES[v.Key][2] or {}
                    BRICKS_SERVER.Func.ConfigChange( "MODULES" )

                    if( IsValid( subModulesBack ) and subModulesBack.Expanded ) then
                        subModulesBack.FillSubModules()
                    end
                elseif( v.Link ) then
                    gui.OpenURL( v.Link )
                end
            end
        end

        if( v.Description ) then
            local moduleIcon = vgui.Create( "DPanel", moduleBack )
            moduleIcon:Dock( TOP )
            moduleIcon:DockMargin( 0, 35, 0, 0 )
            moduleIcon:SetTall( 20 )
            moduleIcon.Paint = function( self2, w, h )
                draw.SimpleText( BRICKS_SERVER.Func.L( "features" ), "BRICKS_SERVER_Font17", w*0.5, h*0.5-1, BRICKS_SERVER.Func.GetTheme( 5 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
            end

            local moduleDescription = vgui.Create( "DPanel" , moduleBack )
            moduleDescription:Dock( FILL )
            moduleDescription:DockMargin( 25, 5, 25, 5 )
            moduleDescription.Paint = function( self2, w, h )
                local description = BRICKS_SERVER.Func.TextWrap( v.Description, "BRICKS_SERVER_Font17", w )

                BRICKS_SERVER.Func.DrawNonParsedText( description, "BRICKS_SERVER_Font17", 0, 0, BRICKS_SERVER.Func.GetTheme( 6 ), 0 )
            end
        end
    end
end

function PANEL:Paint( w, h )

end

vgui.Register( "bricks_server_config_modules", PANEL, "DPanel" )
--PATH addons/____bricks_framework/lua/bricks_server/vgui/bricks_server_dframe.lua:
local PANEL = {}

function PANEL:Init()
    self:MakePopup()
    self:SetTitle( "" )
    self:SetDraggable( false )
    self:ShowCloseButton( false )
    self.headerHeight = 40
    self:DockPadding( 0, self.headerHeight, 0, 0 )

    self.removeOnClose = true
    self:CreateCloseButton()
end

function PANEL:CloseFrame()
    if( self.onCloseFunc ) then
        self.onCloseFunc()
    end

    if( self.removeOnClose or BRS_REMOVEONCLOSE ) then
        self:Remove()
    else
        self:SetVisible( false )
    end
end

function PANEL:CreateCloseButton()
    local size = 24

    if( IsValid( self.closeButton ) ) then
        self.closeButton:SetSize( size, size )
        self.closeButton:SetPos( self:GetWide()-size-((self.headerHeight-size)*0.5), (self.headerHeight*0.5)-(size*0.5) )
        return
    end

    self.closeButton = vgui.Create( "DButton", self )
	self.closeButton:SetSize( size, size )
	self.closeButton:SetPos( self:GetWide()-size-((self.headerHeight-size)*0.5), (self.headerHeight*0.5)-(size*0.5) )
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
        self:CloseFrame()
    end
end

function PANEL:OnSizeChanged( newW, newH )
    self:CreateCloseButton()

    if( self.centerOnSizeChanged ) then
        self:Center()
    end
end

function PANEL:SetHeader( header )
    self.header = header
end

local rounded = 5
function PANEL:Paint( w, h )
    BRICKS_SERVER.BSHADOWS.BeginShadow()
    local x, y = self:LocalToScreen( 0, 0 )
    draw.RoundedBox( rounded, x, y, w, h, BRICKS_SERVER.Func.GetTheme( 1 ) )			
    BRICKS_SERVER.BSHADOWS.EndShadow( 1, 2, 2, 255, 0, 0, false )

    draw.RoundedBoxEx( rounded, 0, 0, w, self.headerHeight, BRICKS_SERVER.Func.GetTheme( 0 ), true, true, false, false )

    draw.SimpleText( (self.header or BRICKS_SERVER.Func.L( "menu" )), "BRICKS_SERVER_Font30", 10, (self.headerHeight or 40)*0.5-2, BRICKS_SERVER.Func.GetTheme( 6 ), 0, TEXT_ALIGN_CENTER )
end

vgui.Register( "bricks_server_dframe", PANEL, "DFrame" )
--PATH addons/____bricks_framework/lua/bricks_server/vgui/bricks_server_dmenubar.lua:

local PANEL = {}

AccessorFunc( PANEL, "m_bBackground",		"PaintBackground",	FORCE_BOOL )
AccessorFunc( PANEL, "m_bBackground",		"DrawBackground",	FORCE_BOOL ) -- deprecated
AccessorFunc( PANEL, "m_bIsMenuComponent",	"IsMenu",			FORCE_BOOL )

Derma_Hook( PANEL, "Paint", "Paint", "MenuBar" )

function PANEL:Init()

	self:Dock( TOP )
	self:SetTall( 24 )

	self.Menus = {}

end

function PANEL:GetOpenMenu()

	for k, v in pairs( self.Menus ) do
		if ( v:IsVisible() ) then return v end
	end

	return nil

end

function PANEL:AddOrGetMenu( label )

	if ( self.Menus[ label ] ) then return self.Menus[ label ] end
	return self:AddMenu( label )

end

function PANEL:AddMenu( label )

	local m = DermaMenu()
	m:SetDeleteSelf( false )
	m:SetDrawColumn( true )
	m:Hide()
	self.Menus[ label ] = m

	local b = self:Add( "DButton" )
	b:SetText( label )
	b:Dock( LEFT )
	b:DockMargin( 5, 0, 0, 0 )
	b:SetIsMenu( true )
	b:SetPaintBackground( false )
	b:SizeToContentsX( 16 )
	b.DoClick = function()

		if ( m:IsVisible() ) then
			m:Hide()
			return
		end

		local x, y = b:LocalToScreen( 0, 0 )
		m:Open( x, y + b:GetTall(), false, b )

	end

	b.OnCursorEntered = function()
		local opened = self:GetOpenMenu()
		if ( !IsValid( opened ) || opened == m ) then return end
		opened:Hide()
		b:DoClick()
	end

	return m

end

function PANEL:OnRemove()

	for id, pnl in pairs( self.Menus ) do
		pnl:Remove()
	end

end

derma.DefineControl( "bricks_server_dmenubar", "", PANEL, "DPanel" )
--PATH addons/____bricks_gangs/lua/bricks_server/modules/gangs/client/cl_gang_admin.lua:
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
--PATH addons/mobile_phone/lua/autorun/client/cl_phone.lua:
Phone = {}
Phone.Accepted = false

surface.CreateFont('font_roboto_22', {
    font = 'roboto',
    size = 22,
    weight = 400,
    extended = true
})

surface.CreateFont('font_roboto_18', {
    font = 'roboto',
    size = 18,
    weight = 400,
    extended = true
})

function Phone.StartCall(ply)
    net.Start('phone')

    net.WriteTable{
        ply = ply,
        act = 'call'
    }

    net.SendToServer()
end

function Phone.Call(ply)
    if IsValid(Phone.ActiveFrame) then return end
    Phone.ActiveFrame = vgui.Create('onyx.Frame')
    Phone.ActiveFrame:SetSize(241, 102)
    Phone.ActiveFrame:SetPos(10, ScrH() * 0.5 - Phone.ActiveFrame:GetWide() * 0.5)
    local f = Phone.ActiveFrame
    f:SetTitle('Звонок')

    f.divHeader.btnClose.DoClick = function()
        local m = DermaMenu()

        m:AddOption('Бросить трубку').DoClick = function()
            Phone.Deny()
            if IsValid(f) then
                f:Remove()
            end
        end

        m:Open()
    end

    local accept = vgui.Create('DPanel', f)
    accept:SetWide(110)
    accept:SetPos(100, 50)
    accept:SetText('')
    local pt = nil

    function accept:Paint(w, h)
        if Phone.Accepted == true then
            if not pt then
                pt = CurTime()
            end

            local time = CurTime() - pt
            local ft = string.FormattedTime(math.floor(time))
            draw.DrawText(string.format('%s:%s:%s', ft.h, ft.m, ft.s), 'font_roboto_22', w * 0.5, h * 0.5 - 9, color_white, TEXT_ALIGN_CENTER)
        else
            draw.DrawText(string.rep('.', CurTime() % 4), 'font_roboto_22', w * 0.5, h * 0.5 - 9, color_white, TEXT_ALIGN_CENTER)
        end
    end

    slb = vgui.Create('onyx.Button', f)
    slb:SetSize(154, 20)
    slb:SetPos(78, 78)
    slb:SetText('Бросить')

    slb.DoClick = function(self)
        Phone.Deny()
        f:Remove()
    end

    local avatar = vgui.Create('AvatarImage', f)
    avatar:SetPos(5, 34)
    avatar:SetPlayer(ply, 128)
    avatar:SetSize(64, 64)
    local lbl = vgui.Create('DLabel', f)
    lbl:SetPos(78, 31)
    lbl:SetText('')
    lbl:SetSize(154, 20)

    lbl.Paint = function(self, w, h)
        local name = ply:Nick()

        if string.len(name) > 13 then
            name = string.sub(name, 1, 13) .. '...'
        end

        draw.DrawText(name, 'font_roboto_22', w * 0.5, h * 0.5 - 9, color_white, TEXT_ALIGN_CENTER)
    end
end

function Phone.InCall(ply)
    if IsValid(Phone.ActiveFrame) then return end
    Phone.ActiveFrame = vgui.Create('onyx.Frame')
    Phone.ActiveFrame:SetSize(241, 102)
    Phone.ActiveFrame:SetPos(10, ScrH() * 0.5 - Phone.ActiveFrame:GetWide() * 0.5)
    local f = Phone.ActiveFrame
    f:SetTitle('Звонок')

    f.divHeader.btnClose.DoClick = function()
        local m = DermaMenu()

        m:AddOption('Заглушить звонок').DoClick = function()
            if IsValid(f) then
                f:SetAlpha(100)
            end
            Phone.Mute()
        end

        m:AddSpacer()

        m:AddOption('Бросить трубку').DoClick = function()
            Phone.Deny()
            if IsValid(f) then
                f:Remove()
            end
        end

        m:Open()
    end

    local decline = vgui.Create('onyx.Button', f)
    decline:SetSize(154, 20)
    decline:SetPos(78, 78)
    decline:SetText('Бросить')


    function decline:DoClick()
        Phone.Deny()
        f:Remove()
    end

    local accept = vgui.Create('onyx.Button', f)
    accept:SetSize(154, 20)
    accept:SetPos(78, 54)
    accept:SetText('Принять')

    function accept:DoClick()
        net.Start'phone'

        net.WriteTable{
            act = 'accept'
        }

        net.SendToServer()
        f:_Remove()
        Phone.Call(ply)
    end

    local avatar = vgui.Create('AvatarImage', f)
    avatar:SetPos(5, 34)
    avatar:SetPlayer(ply, 128)
    avatar:SetSize(64, 64)
    local lbl = vgui.Create('DLabel', f)
    lbl:SetPos(78, 31)
    lbl:SetText('')
    lbl:SetSize(154, 20)

    lbl.Paint = function(self, w, h)
        local name = ply:Nick()

        if string.len(name) > 13 then
            name = string.sub(name, 1, 13) .. '...'
        end

        draw.DrawText(name, 'font_roboto_22', w * 0.5, h * 0.5 - 9, color_white, TEXT_ALIGN_CENTER)
    end
end

function Phone.Deny()
    net.Start('phone')

    net.WriteTable{
        act = 'deny'
    }

    net.SendToServer()
end

function Phone.MuteForever()
    net.Start('phone')

    net.WriteTable{
        act = 'muteforever'
    }

    net.SendToServer()
end

function Phone.Mute()
    net.Start('phone')

    net.WriteTable{
        act = 'mute'
    }

    net.SendToServer()
end

net.Receive('phone_client', function()
    local t = net.ReadTable()

    if t.act == 'in' then
        Phone.InCall(t.ply)
    end

    if t.act == 'out' then
        Phone.Call(t.ply)
    end

    if t.act == 'accept' then
        Phone.Accepted = true
    end

    if t.act == 'deny' then
        Phone.Accepted = false

        if IsValid(Phone.ActiveFrame) then
            Phone.ActiveFrame:Remove()
        end
    end
end)

net.Receive('PhonePlaySound', function()
    local targ = net.ReadEntity()

    sound.PlayFile('sound/umb/opening.mp3', '3d', function(s)
        if IsValid(s) and IsValid(targ) then
            s:SetPos(targ:GetPos())
            s:Play()
            s:SetVolume(.5)
            s:Set3DFadeDistance(50, 200)
            s:EnableLooping(true)
            targ.Sound = s

            timer.Create('PhonePlay_' .. targ:SteamID64(), 0, 0.1, function()
                if not IsValid(s) then return end
                if LocalPlayer():GetPos():Distance(s:GetPos()) < 300 then
                    s:SetVolume(.5)
                else
                    s:SetVolume(0)
                end

                if not IsValid(targ) then return end
                s:SetPos(targ:GetPos())
            end)
        end
    end)
end)

net.Receive('PhoneStopSound', function()
    local targ = net.ReadEntity()

    if IsValid(targ) and IsValid(targ.Sound) then
        targ.Sound:Stop()
        timer.Remove('PhonePlay_' .. targ:SteamID64())
    end
end)
--PATH addons/unbox/lua/unbox/crate.lua:
local CustomIcons = {}
local crateMat = Material("bu2/case.png", "smooth noclamp")
local keyMat = Material("bu2/key.png", "smooth noclamp")
local itemShadowMat = Material("bu2/item_shadow.png", "smooth noclamp")

return {
	Base = "EditablePanel",
	Init = function(self)
		self.outlinec = Color(0, 0, 0)
		self.PaintCase = true
	end,
	Set = function(self, itemTable)
		self.itemTable = itemTable
		self.itemType = itemTable.itemType
		self.customicon = itemTable.customicon and Material(itemTable.customicon, "smooth noclamp") or nil
		self:SetToolTip(itemTable.name2 or "")
	end,
	PaintBackground = function(self, w, h)
		surface.SetDrawColor(color_white)
		surface.SetMaterial(itemShadowMat)
		surface.DrawTexturedRect(0, 0, 180, 180)
		--Draw text
		draw.SimpleText(self.itemTable.name2, "ub2_1", w * 0.5, 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
	end,
	Paint = function(self, w, h)
		self:PaintBackground(w, h)

		if self.itemType == "Crate" then
			if self.customicon then
				local size = h
				surface.SetDrawColor(self.PaintCase and self.itemTable.color or color_white)
				surface.SetMaterial(self.customicon)
				surface.DrawTexturedRect(w * 0.5 - size * 0.5, h * 0.5 - size * 0.5 + 15, size, size)
			else
				local size = h
				surface.SetDrawColor(self.PaintCase and self.itemTable.color or color_white)
				surface.SetMaterial(crateMat)
				surface.DrawTexturedRect(w * 0.5 - size * 0.5, h * 0.5 - size * 0.5 + 15, size, size)
			end
		elseif self.itemType == "Key" then
			surface.SetDrawColor(self.itemTable.color)
			surface.SetMaterial(keyMat)
			surface.DrawTexturedRect(0, 0, 180, 180)
		end
	end
}
--PATH addons/dash/lua/dash/libraries/nw.lua:
--[[
local var = nw.Register 'MyVar' 	-- You MUST call this ALL shared
	var:Write(net.WriteUInt, 32) 	-- Write function
	var:Read(net.ReadUInt, 32) 		-- Read function
	var:SetPlayer() 				-- Registers the var for use on players
	var:SetLocalPlayer() 			-- Optionally set the var to only network to the player its set on, no need to call SetPlayer with this
	var:SetGlobal() 				-- Registers the var for use with nw.SetGlobal
	var:SetNoSync() 				-- Stops the var from syncing to new players, SetLocalPlayer does this for you.
	var:Filter(function(ent, value) -- Sets a var to only send to players you return in your callback
		return player.GetWhatever() -- return table players
	end)

nw.WaitForPlayer(player, callback) 	-- Calls your callback when the player is ready to recieve net messages

-- Set Functions
ENTITY:SetNetVar(var, value)
nw.SetGlobal(var, value)

-- Get functions
ENTITY:GetNetVar(var)
nw.GetGlobal(var)
]]


nw = nw or {
	Data = {
		[0] = {}
	},
	Vars = {},
	Mappings = {},
	Callbacks = {}
}

local vars 		= nw.Vars
local mappings 	= nw.Mappings
local data 		= nw.Data
local globals 	= data[0]
local callbacks = nw.Callbacks

local NETVAR 	= {}
NETVAR.__index 	= NETVAR

debug.getregistry().Netvar = NETVAR

local bitmap 	= {
	[3]		= 3,
	[7] 	= 4,
	[15] 	= 5,
	[31] 	= 6,
	[63] 	= 7,
	[127] 	= 8,
	[255] 	= 9,
	[511]	= 10
}

local bitcount 	= 2

local ENTITY 	= FindMetaTable 'Entity'

local pairs 	= pairs
local Entity 	= Entity

local net_WriteUInt = net.WriteUInt
local net_ReadUInt 	= net.ReadUInt
local net_Start 	= net.Start
local net_Send 		= (SERVER) and net.Send or net.SendToServer
local net_Broadcast = net.Broadcast
local player_GetAll = player.GetAll
local sorted_pairs 	= SortedPairsByMemberValue

function nw.Register(var) -- You must always call this on both the client and server. It will serioulsy break shit if you don't.
	local t = {
		Name = var,
		NetworkString = 'nw_' .. var,
		WriteFunc = net.WriteType,
		ReadFunc = net.ReadType,
		SendFunc = function(self, ent, value, recipients)
			if (recipients ~= nil) then
				net_Send(recipients)
			else
				net_Broadcast()
			end
		end,
	}
	setmetatable(t, NETVAR)
	vars[var] = t

	if (SERVER) then
		util.AddNetworkString(t.NetworkString)
	else
		net.Receive(t.NetworkString, function()
			local index, value = t:_Read()

			if (not data[index]) then
				data[index] = {}
			end

			local oldValue = data[index][var]
			data[index][var] = value

			t:_CallHook(index, value, oldValue)
		end)
	end

	return t:_Construct()
end

function NETVAR:Write(func, opt)
	self.WriteFunc = function(value)
		func(value, opt)
	end
	return self:_Construct()
end

function NETVAR:Read(func, opt)
	self.ReadFunc = function()
		return func(opt)
	end
	return self:_Construct()
end

function NETVAR:Filter(func)
	self.SendFunc = function(self, ent, value, recipients)
		net_Send(recipients or func(ent, value))
	end
	return self:_Construct()
end

function NETVAR:SetPlayer()
	self.PlayerVar = true
	return self:_Construct()
end

function NETVAR:SetLocalPlayer()
	self.LocalPlayerVar = true
	return self:_Construct()
end

function NETVAR:SetGlobal()
	self.GlobalVar = true
	return self:_Construct()
end

function NETVAR:SetNoSync()
	self.NoSync = true
	return self:_Construct()
end

function NETVAR:Accessor(name)
	name = name or self.Name
	if SERVER then
		ENTITY["Set" .. name] = function(ent, value)
			ent:SetNetVar(self.Name, value)
		end
	end
	ENTITY["Get" .. name] = function(ent)
		return ent:GetNetVar(self.Name)
	end
	return self
end

function NETVAR:SetHook(name)
	self.Hook = name
	return self
end

function NETVAR:_Send(ent, value, recipients)
	net_Start(self.NetworkString)
		self:_Write(ent, value)
	self:SendFunc(ent, value, recipients)
end

function NETVAR:_CallHook(index, value, oldValue)
	if self.Hook then
		if (index ~= 0) then
			hook.Call(self.Hook, GAMEMODE, Entity(index), value, oldValue)
		else
			hook.Call(self.Hook, GAMEMODE, value, oldValue)
		end
	end
end

function NETVAR:_Construct()
	local WriteFunc = self.WriteFunc
	local ReadFunc 	= self.ReadFunc

	if self.PlayerVar then
		self._Write = function(self, ent, value)
			net_WriteUInt(ent:EntIndex(), 8)
			WriteFunc(value)
		end
		self._Read = function(self)
			return net_ReadUInt(8), ReadFunc()
		end
	elseif self.LocalPlayerVar then
		self._Write = function(self, ent, value)
			WriteFunc(value)
		end
		self._Read = function(self)
			return LocalPlayer():EntIndex(), ReadFunc()
		end
		self.SendFunc = function(self, ent, value, recipients)
			net_Send(ent)
		end
	elseif self.GlobalVar then
		self._Write = function(self, ent, value)
			WriteFunc(value)
		end
		self._Read = function(self)
			return 0, ReadFunc()
		end
	else
		self._Write = function(self, ent, value)
			net_WriteUInt(ent:EntIndex(), 13)
			WriteFunc(value)
		end
		self._Read = function(self)
			return net_ReadUInt(13), ReadFunc()
		end
	end

	nw.Mappings = {}
	mappings = nw.Mappings
	for k, v in sorted_pairs(vars, 'Name', false) do
		local c = #mappings + 1
		vars[k].ID = c
		mappings[c] = v
		if bitmap[c] then
			bitcount = bitmap[c]
		end
	end

	return self
end

function nw.GetGlobal(var)
	return globals[var]
end

-- function ENTITY:GetNetVar(var)
-- 	local index = self:EntIndex()
-- 	return data[index] and data[index][var]
-- end

if (SERVER) then
	util.AddNetworkString 'nw.PlayerSync'
	util.AddNetworkString 'nw.NilEntityVar'
	util.AddNetworkString 'nw.NilPlayerVar'
	util.AddNetworkString 'nw.EntityRemoved'
	util.AddNetworkString 'nw.PlayerRemoved'

	net.Receive('nw.PlayerSync', function(len, pl)
		if (pl.EntityCreated ~= true) then
			hook.Call('PlayerEntityCreated', GAMEMODE, pl)

			pl.EntityCreated = true

			for index, _vars in pairs(data) do
				for var, value in pairs(_vars) do
					local ent = Entity(index)
					if (not vars[var].LocalPlayerVar and not vars[var].NoSync) or (ent == pl) then
						vars[var]:_Send(ent, value, pl)
					end
				end
			end

			if (callbacks[pl] ~= nil) then
				for i = 1, #callbacks[pl] do
					callbacks[pl][i](pl)
				end
			end
			callbacks[pl] = nil
		end
	end)
	hook.Add( "KeyPress", "nw.PlayerSync.hook", function( pl, key )
		if not pl.EntityCreated then
			hook.Call('PlayerEntityCreated', GAMEMODE, pl)
			pl.EntityCreated = true
			for index, _vars in pairs(data) do
				for var, value in pairs(_vars) do
					local ent = Entity(index)
					if (not vars[var].LocalPlayerVar and not vars[var].NoSync) or (ent == pl) then
						vars[var]:_Send(ent, value, pl)
					end
				end
			end

			if (callbacks[pl] ~= nil) then
				for i = 1, #callbacks[pl] do
					callbacks[pl][i](pl)
				end
			end
			callbacks[pl] = nil
		end
	end)

	hook.Add('EntityRemoved', 'nw.EntityRemoved', function(ent)
		local index = ent:EntIndex()

		if (index ~= 0) and (data[index] ~= nil) then -- For some reason this kept getting called on Entity(0), not sure why...
			if ent:IsPlayer() then
				net_Start('nw.PlayerRemoved')
					net_WriteUInt(index, 8)
				net_Broadcast()
			else
				net_Start('nw.EntityRemoved')
					net_WriteUInt(index, 13)
				net_Broadcast()
			end

			data[index] = nil
		end
	end)

	function nw.WaitForPlayer(pl, cback)
		if (pl.EntityCreated == true) then
			cback(pl)
		else
			if (callbacks[pl] == nil) then
				callbacks[pl] = {}
			end
			callbacks[pl][#callbacks[pl] + 1] = cback
		end
	end

	function nw.SetGlobal(var, value)
		//print('global',var,value)
		globals[var] = value
		if (value ~= nil) then
			vars[var]:_Send(0, value)
		else
			net_Start('nw.NilEntityVar')
				net_WriteUInt(0, 13)
				net_WriteUInt(vars[var].ID, bitcount)
			vars[var]:SendFunc(0, value)
		end
	end

	-- function ENTITY:SetNetVar(var, value)
	-- //	p//rint('nw_player',var,value)
	-- 	local index = self:EntIndex()

	-- 	if (not data[index]) then
	-- 		data[index] = {}
	-- 	end

	-- 	data[index][var] = value

	-- 	if (value ~= nil) then
	-- 		vars[var]:_Send(self, value)
	-- 	else
	-- 		if self:IsPlayer() then
	-- 			net_Start('nw.NilPlayerVar')
	-- 			net_WriteUInt(index, 8)
	-- 		else
	-- 			net_Start('nw.NilEntityVar')
	-- 			net_WriteUInt(index, 13)
	-- 		end
	-- 		net_WriteUInt(vars[var].ID, bitcount)
	-- 		vars[var]:SendFunc(self, value)
	-- 	end
	-- end
else
	hook.Add('InitPostEntity', 'nw.InitPostEntity', function()
		net_Start('nw.PlayerSync')
		net_Send()
	end)

	local function nwNilVar(index, id)
		if data[index] and mappings[id] then
			local oldValue = data[index][mappings[id].Name]
			data[index][mappings[id].Name] = nil
			mappings[id]:_CallHook(index, nil, oldValue)
		end
	end

	net.Receive('nw.NilEntityVar', function()
		nwNilVar(net_ReadUInt(13), net_ReadUInt(bitcount))
	end)

	net.Receive('nw.NilPlayerVar', function()
		nwNilVar(net_ReadUInt(8), net_ReadUInt(bitcount))
	end)

	net.Receive('nw.EntityRemoved', function()
		data[net_ReadUInt(13)] = nil
	end)

	net.Receive('nw.PlayerRemoved', function()
		data[net_ReadUInt(8)] = nil
	end)
end
--PATH gamemodes/darkrp/gamemode/cfg/ents_sh.lua:

rp.AddEntites('Телевизор',{
    Desc = [[]],
    Model = "models/props/cs_office/tv_plasma.mdl",
    ENT = "mediaplayer_tv",
    Command = "item_mediaplayertv",
    Max = 1,
    vip = true,
    Price = 15000,
    allowed = {},
    Inventory = false,    
    RemoveOnJobChange = false,
})

rp.AddEntites('Аптечка',{
    Desc = [[Для важких життєвих моментів.]],
    Model = "models/Items/HealthKit.mdl",
    ENT = "item_healthkit",
    Command = "item_healthkit",
    Max = 1,
    vip = true,
    Price = 2000,
    allowed = {},
    Inventory = true,    
    RemoveOnJobChange = false,
})

rp.AddEntites('Броня',{
    Desc = [[Для тяжких життєвих моментів.]],
    Model = "models/Items/battery.mdl",
    ENT = "item_battery",
    Command = "item_battery",
    Max = 1,
    vip = true,
    Price = 3500,
    allowed = {},
    Inventory = true,    
    RemoveOnJobChange = false,
})

rp.AddEntites("Паливо", { 
    ENT = "bm2_fuel", 
    Model = "models/props_junk/gascan001a.mdl", 
    Price = 750, 
    Max = 4, 
    Desc = [[Усе для майнінг ферми]], 
    Command = "Bitminer7", 
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223}, 
    Inventory = false,    
})

rp.AddEntites("Bitminer S1", {
    ENT = "bm2_bitminer_1",
    Model = "models/bitminers2/bitminer_1.mdl",
    Price = 5000,
    Max = 4,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer1",
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,   
}) 

rp.AddEntites("Bitminer S2", {
    ENT = "bm2_bitminer_2",
    Model = "models/bitminers2/bitminer_3.mdl",
    Price = 20000,
    Max = 4,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer2",
    vip = true,
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,   
})

rp.AddEntites("Bitminer Сервер", {
    ENT = "bm2_bitminer_server",
    Model = "models/bitminers2/bitminer_2.mdl",
    Price = 30000,
    Max = 16,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer3",
    vip = true,
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,   
})

rp.AddEntites("Серверна стійка", {
    ENT = "bm2_bitminer_rack",
    Model = "models/bitminers2/bitminer_rack.mdl",
    Price = 55000,
    Max = 2,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer4",
    vip = true,
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,   
})


rp.AddEntites("Провід", {
    ENT = "bm2_power_lead",
    Model = "models/bitminers2/bitminer_plug_2.mdl",
    Price = 750,
    Max = 10,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer5",
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,  
})

rp.AddEntites("Генератор", {
    ENT = "bm2_generator",
    Model = "models/bitminers2/generator.mdl",
    Price = 7500,
    Max = 3,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer6",
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,   
})

rp.AddEntites("Паливо провід", {
    ENT = "bm2_extra_fuel_line",
    Model = "models/bitminers2/bm2_extra_fuel_plug.mdl",
    Price = 750,
    Max = 2,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer8",
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,   
})

rp.AddEntites("Паливний бак", {
    ENT = "bm2_extra_fuel_tank",
    Model = "models/bitminers2/bm2_extra_fueltank.mdl",
    Price = 70000,
    Max = 2,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer9",
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,   
})

rp.AddEntites("Топливо для топливного бака", {
    ENT = "bm2_large_fuel",
    Model = "models/props_c17/oildrum001.mdl",
    Price = 3200,
    Max = 2,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer10",
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,   
})

rp.AddEntites("Сонячний кабель", {
    ENT = "bm2_solar_cable",
    Model = "models/bitminers2/bm2_solar_plug.mdl",
    Price = 3500,
    Max = 10,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer11",
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,   
})

rp.AddEntites("Перетворювач сонячної енергії", {
    ENT = "bm2_solarconverter",
    Model = "models/bitminers2/bm2_solar_converter.mdl",
    Price = 11500,
    Max = 10,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer12",
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,   
})

rp.AddEntites("Сонячна панель", {
    ENT = "bm2_solar_panel",
    Model = "models/bitminers2/bm2_solar_panel.mdl",
    Price = 22000,
    Max = 10,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer13",
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,   
})

rp.AddEntites('Мет',{
    Desc = [[]],
    Model = "models/props_junk/garbage_bag001a.mdl",
    ENT = "savav_meth",
    Command = "savav_meth",
    Max = 1,
    Price = 800,
    allowed = {TEAM_DRUGDiller},
    Inventory = true,    
})

rp.AddEntites('Пиво',{
    Desc = [[]],
    Model = "models/props_junk/garbage_glassbottle003a.mdl",
    ENT = "savav_beer",
    Command = "savav_beer",
    Max = 1,
    Price = 800,
    allowed = {TEAM_DRUGDiller},
    Inventory = true,    
})

rp.AddEntites('Кокаїн',{
    Desc = [[]],
    Model = "models/cocn.mdl",
    ENT = "savav_cocaine",
    Command = "savav_cocaine",
    Max = 1,
    Price = 1250,
    allowed = {TEAM_DRUGDiller},
    Inventory = true,    
})

rp.AddEntites('Кавун Віри',{
    Desc = [[]],
    Model = "models/props_junk/watermelon01.mdl",
    ENT = "savav_watermelon",
    Command = "savav_watermelon",
    Max = 1,
    Price = 2250,
    allowed = {TEAM_DRUGDiller},
    Inventory = true,    
})

rp.AddEntites("Банку", {
    ENT = "eml_jar",
    Desc = [[Для варіння Мета]],
    Model = "models/props_lab/jar01a.mdl",
    Price = 1200,
    Max = 5,
    Command = "eml_jar",
    allowed = {TEAM_DRUG},
    Inventory = true,    
    Desc = "",
})

rp.AddEntites("Газ", {
    ENT = "eml_gas",
    Desc = [[Для варіння Мета]],
    Model = "models/props_c17/canister01a.mdl",
    Price = 1600,
    Max = 5,
    Command = "eml_gas",
    allowed = {TEAM_DRUG},
    Inventory = true,    
    Desc = "",
})

rp.AddEntites("Плита", {
    ENT = "eml_stove",
    Desc = [[Для варіння Мета]],
    Model = "models/props_c17/furnitureStove001a.mdl",
    Price = 5500,
    Max = 2,
    Command = "eml_stove",
    allowed = {TEAM_DRUG},
    Inventory = true,    
    Desc = "",
})

rp.AddEntites("Рідка сірка", {
    ENT = "eml_sulfur",
    Desc = [[Для варіння Мета]],
    Model = "models/props_lab/jar01a.mdl",
    Price = 450,
    Max = 5,
    Command = "eml_sulfur",
    allowed = {TEAM_DRUG},
    Inventory = true,    
    Desc = "",
})

rp.AddEntites("Рідкий Йод", {
    ENT = "eml_iodine",
    Desc = [[Для варіння Мета]],
    Model = "models/props_lab/jar01a.mdl",
    Price = 750,
    Max = 5,
    Command = "eml_iodine",
    allowed = {TEAM_DRUG},
    Inventory = true,    
    Desc = "",
})

rp.AddEntites("Соляна Кислота", {
    ENT = "eml_macid",
    Desc = [[Для варіння Мета]],
    Model = "models/props_lab/jar01a.mdl",
    Price = 650,
    Max = 5,
    Command = "eml_macid",
    allowed = {TEAM_DRUG},
    Inventory = true,    
    Desc = "",
})

rp.AddEntites("Вода", {
    ENT = "eml_water",
    Desc = [[Для варіння Мета]],
    Model = "models/props_junk/garbage_plasticbottle003a.mdl",
    Price = 650,
    Max = 5,
    Command = "eml_water",
    allowed = {TEAM_DRUG},
    Inventory = true,    
    Desc = "",
})

rp.AddEntites("Каструля", {
    ENT = "eml_pot",
    Desc = [[Для варіння Мета]],
    Model = "models/props_c17/metalPot001a.mdl",
    Price = 1450,
    Max = 4,
    Command = "eml_pot",
    allowed = {TEAM_DRUG},
    Inventory = true,    
    Desc = "",
})

rp.AddEntites("Спеціальна Каструля", {
    ENT = "eml_spot",
    Desc = [[Для варіння Мета]],
    Model = "models/props_c17/metalPot001a.mdl",
    Price = 1450,
    Max = 4,
    Command = "eml_spot",
    allowed = {TEAM_DRUG},
    Inventory = true,    
    Desc = "",
})

rp.AddEntites('Радіо',{
    Desc = [[Влаштуй дискотеку]],
    Model = "models/props_lab/citizenradio.mdl",
    ENT = "radio",
    Command = "radio",
    Max = 6,
    CanTouch = true,
    Price = 2500,
    allowed = {TEAM_RADIO},
    Inventory = false,
})

rp.AddEntites('Радіо',{
    Desc = [[Щоб купити Радіо без VIP зайдіть за професію Радіомеханік]],
    Model = "models/props_lab/citizenradio.mdl",
    ENT = "radio",
    Command = "radiov",
    Max = 1,
    vip = true,
    CanTouch = true,
    Price = 15000,
    allowed = {},
    RemoveOnJobChange = false,
    Inventory = false,
})

rp.AddEntites('Вейп',{
    Desc = [[Парю де хочу, законом не заборонено]],
    Model = "models/swamponions/vape.mdl",
    ENT = "weapon_vape",
    Command = "vape",
    Max = 1,
    vip = false,
    Price = 6500,
    allowed = {},
    Inventory = false,
})

rp.AddEntites('Костюм Злодюжки',{
    Desc = [[У ньому тебе ніхто не впізнає!]],
    Model = "models/props_c17/SuitCase001a.mdl",
    ENT = "disgue",
    Command = "disgue",
    Max = 1,
    vip = false,
    Price = 15000,
    allowed = {TEAM_DRUG,TEAM_GANG,TEAM_GANGVIP,TEAM_THIEFF,TEAM_THIEFF_VIP,TEAM_KILL,TEAM_BANK,TEAM_GLCRIME,TEAM_NAIM,TEAM_ADMI3qwfqwNYASD44},
    Inventory = false,
    RemoveOnJobChange = false,
})

rp.AddWeapon("Відмичка",{
    Desc = "Зламуй замки",
    Model = "models/weapons/w_crowbar.mdl",
    ENT = "lockpick",
    Max = 5,
    Price = 1500,
    allowed = {TEAM_DARKGUN,TEAM_ADMI3qwfqwNYASD44},
    Inventory = true,    
})

rp.AddWeapon("SLAM",{
    Desc = "БадаБум",
    Model = "models/weapons/w_slam.mdl",
    ENT = "weapon_slam",
    Max = 1,
    Price = 75000,
    allowed = {TEAM_VENI,TEAM_VENI1},
    Inventory = true,    
})

rp.AddWeapon("Граната",{
    Desc = "БадаБум",
    Model = "models/weapons/w_grenade.mdl",
    ENT = "weapon_frag",
    Max = 1,
    Price = 35000,
    allowed = {TEAM_VENI,TEAM_VENI1},
    Inventory = true,    
})
    
rp.AddWeapon("Зломщик Кейпадів",{
    Desc = "Зламуй Кейпади",
    Model = "models/weapons/w_c4.mdl",
    ENT = "base_keypadcracker",
    Max = 5,
    Price = 4000,
    allowed = {TEAM_DARKGUN},
    Inventory = true,    
})  

rp.AddWeapon("С4",{
    Desc = "Підриває базу ворогам",
    Model = "models/weapons/w_c4.mdl",
    ENT = "weapon_c4",
    Max = 2,
    Price = 130000,
    allowed = {TEAM_DARKGUN},
    Inventory = true,    
})  

rp.AddEntites('Мікрохвильовка',{
    Desc = [[Їж, їж, їж, нікого не слухай.]],
    Model = "models/props/cs_office/microwave.mdl",
    ENT = "microwave",
    Command = "microwave",
    Max = 1,
    Price = 2500,
    allowed = {TEAM_COOK},
    Inventory = false, 
})

rp.AddWeapon("Щит",{
    Desc = "Щит",
    Model = "models/bshields/rshield.mdl",
    ENT = "riot_shield",
    Max = 1,
    Price = 15000,
    allowed = {TEAM_POLICE},
    Inventory = false,
})

rp.AddWeapon("Щит",{
    Desc = "Щит",
    Model = "models/bshields/hshield.mdl",
    ENT = "heavy_shield",
    Max = 1,
    Price = 15000,
    allowed = {TEAM_FBI},
    Inventory = false,
})

rp.AddWeapon("M92 Beretta", "models/weapons/w_beretta_m92.mdl", "m9k_m92beretta", 2100, 10, false, 750, false, {TEAM_GUN})
rp.AddWeapon("HK USP", "models/weapons/w_pist_fokkususp.mdl", "m9k_usp", 2700, 10, false, 800, false, {TEAM_GUN})
rp.AddWeapon("Sig Sauer", "models/weapons/w_sig_229r.mdl", "m9k_sig_p229r", 2800, 10, false, 2000, false, {TEAM_GUN})
rp.AddWeapon("Knife", "models/weapons/w_sig_229r.mdl", "swb_knife", 9500, 10, false, 750, false, {TEAM_DARKGUN})
rp.AddWeapon("Colt 1911", "models/weapons/s_dmgf_co1911.mdl", "m9k_colt1911", 3800, 10, false, 1000, false, {TEAM_DARKGUN})
rp.AddWeapon("Colt Python", "models/weapons/w_colt_python.mdl", "m9k_coltpython", 4800, 10, false, 2000, false, {TEAM_DARKGUN})
rp.AddWeapon("Glock 18", "models/weapons/w_dmg_glock.mdl", "m9k_glock", 40800, 10, false, 2000, false, {TEAM_DARKGUN})

rp.AddWeapon("TEC-9", "models/weapons/w_intratec_tec9.mdl", "m9k_tec9", 12000, 10, false, 2000, false, {TEAM_GUN})
rp.AddWeapon("HK UMP45", "models/weapons/w_hk_ump45.mdl", "m9k_ump45", 13900, 10, false, 2500, false, {TEAM_GUN})
rp.AddWeapon("Bizon PP19", "models/weapons/w_pp19_bizon.mdl", "m9k_bizonp19", 11900, 10, false, 2500, false, {TEAM_DARKGUN})
rp.AddWeapon("FN P90", "models/weapons/w_fn_p90.mdl", "m9k_smgp90", 13900, 10, false, 2500, false, {TEAM_DARKGUN})

rp.AddWeapon("AK-47", "models/weapons/w_ak47_m9k.mdl", "m9k_ak47", 24000, 10, false, 4000, false, {TEAM_DARKGUN})
rp.AddWeapon("F2000", "models/weapons/w_fn_f2000.mdl", "m9k_f2000", 30900, 10, false, 4000, false, {TEAM_GUN})
rp.AddWeapon("FAMAS", "models/weapons/w_tct_famas.mdl", "m9k_famas", 67900, 10, false, 4000, false, {TEAM_GUN})
rp.AddWeapon("TAR 21", "models/weapons/w_imi_tar21.mdl", "m9k_tar21", 25900, 10, false, 4000, false, {TEAM_GUN})
rp.AddWeapon("M4A1 Iron", "models/weapons/w_m4a1_iron.mdl", "m9k_m4a1", 25000, 10, false, 4500, false, {TEAM_GUN})
rp.AddWeapon("G36", "models/weapons/w_hk_g36c.mdl", "m9k_g36", 22900, 10, false, 3900, false, {TEAM_GUN})
rp.AddWeapon("L85", "models/weapons/w_l85a2.mdl", "m9k_l85", 34900, 10, false, 5500, false, {TEAM_GUN}) 
rp.AddWeapon("SCAR", "models/weapons/w_fn_scar_h.mdl", "m9k_scar", 30900, 10, false, 4000, false, {TEAM_DARKGUN})
rp.AddWeapon("M14", "models/weapons/w_snip_m14sp.mdl", "m9k_m14sp", 20900, 10, false, 7500, false, {TEAM_DARKGUN})
rp.AddWeapon("AN-94", "models/weapons/w_rif_an_94.mdl", "m9k_an94", 24900, 10, false, 7500, false, {TEAM_DARKGUN})
rp.AddWeapon("HK G3A3", "models/weapons/w_hk_g3.mdl", "m9k_g3a3", 18900, 10, false, 7500, false, {TEAM_DARKGUN})

rp.AddWeapon("Ares Shrike", "models/weapons/w_ares_shrike.mdl", "m9k_ares_shrike", 70900, 10, false, 75000, false, {TEAM_GUN})
rp.AddWeapon("FG 42", "models/weapons/w_fg42.mdl", "m9k_fg42", 42900, 10, false, 75000, false, {TEAM_GUN})
rp.AddWeapon("M249 LMG", "models/weapons/w_m249_machine_gun.mdl", "m9k_m249lmg", 58900, 10, false, 75000, false, {TEAM_DARKGUN})

rp.AddWeapon("Benelli M3", "models/weapons/w_benelli_m3.mdl", "m9k_m3", 17500, 10, false, 75000, false, {TEAM_GUN})
rp.AddWeapon("Browning Auto 5", "models/weapons/w_browning_auto.mdl", "m9k_browningauto5", 26000, 10, false, 75000, false, {TEAM_GUN})
rp.AddWeapon("SPAS 12", "models/weapons/w_spas_12.mdl", "m9k_spas12", 85000, 10, false, 175000, false, {TEAM_DARKGUN})
rp.AddWeapon("Mossberg590", "models/weapons/w_mossberg_590.mdl", "m9k_mossberg590", 34000, 10, false, 175000, false, {TEAM_DARKGUN})
rp.AddWeapon("AK47 Beast", "models/weapons/w_ak47_m9k.mdl", "weapon_ak47_beast", 175000, 10, false, 175000, false, {TEAM_DARKGUN})
rp.AddWeapon("G36 Balrog", "models/weapons/w_hk_g36c.mdl", "g36_balrog", 95000, 10, false, 175000, false, {TEAM_DARKGUN})
rp.AddWeapon("AC ВАЛ", "models/weapons/w_dmg_vally.mdl", "m9k_val", 45000, 10, false, 175000, false, {TEAM_DARKGUN})


rp.AddWeapon("M24", "models/weapons/w_snip_m24_6.mdl", "m9k_m24", 37500, 10, false, 175000, false, {TEAM_GUN})
rp.AddWeapon("HK SL8", "models/weapons/w_hk_sl8.mdl", "m9k_sl8", 43000, 10, false, 175000, false, {TEAM_GUN})
rp.AddWeapon("Intervention", "models/weapons/w_snip_int.mdl", "m9k_intervention", 87500, 10, false, 175000, false, {TEAM_DARKGUN})
rp.AddWeapon("AWP", "models/weapons/w_acc_int_aw50.mdl", "swb_awp", 87500, 10, false, 175000, false, {TEAM_GUN})
rp.AddWeapon("AI AW50", "models/weapons/w_acc_int_aw50.mdl", "m9k_aw50", 95000, 10, false, 175000, false, {TEAM_DARKGUN})

-- rp.AddEntites('Бронзовий Клікер',{
--     Desc = [[Друкує гроші]],
--     Model = "models/props_c17/consolebox01a.mdl",
--     ENT = "money_clicker",
--     Command = "buymoneyclicker1",
--      allowed = {TEAM_DRUG,TEAM_GANG,TEAM_GANGVIP,TEAM_THIEFF,TEAM_THIEFF_VIP,TEAM_KILL,TEAM_BANK,TEAM_GLCRIME,TEAM_NAIM,TEAM_ADMI3N},
--     Max = 1,
--     Price = 5000,
--     Inventory = false, 
--     mClickerInfo = {
--         pointsPerCycle = 15,
--         moneyPerCycle = 35,
--         maxPoints = 10000,
--         maxMoney = 100000,
--         health = 100,
--         indestructible = false,
--         repairHealthCost = 100,
--         maxCycles = 100,
--         repairBrokenCost = 450,

--         upgrades = {
--             autoClick = {
--                 name = "Авт.Клікер",
--                 stats = { 1, 2, 3, 4, 5 },
--                 prices = { 455, 550, 650, 765 },
--             },
--             clickPower = {
--                 name = "Сила Кліка",
--                 stats = { 10, 12, 14, 16 },
--                 prices = { 440, 520, 650 },
--             },
--             cooling = {
--                 name = "Охолодження",
--                 stats = { 3, 4, 6, 6 },
--                 prices = { 450, 550, 650 },
--             },
--             storage = {
--                 name = "Об'єм",
--                 stats = { 1, 2, 3, 4 },
--                 prices = { 530, 600, 720 },
--             },
--         },

--         enableHeat = true,
--         heatPerClick = 20,

--         colorPrimary = Color(185, 125, 0),
--         colorSecondary = Color(185, 125, 0),
--         colorText = Color(255, 255, 255),
--         colorHealth = Color(255, 255, 255),
--     },
-- })

-- rp.AddEntites('Срібний Клікер',{
--     Desc = [[Друкує гроші]],
--     Model = "models/props_c17/consolebox01a.mdl",
--     ENT = "money_clicker",
--     Command = "buymoneyclicker2",
--      allowed = {TEAM_DRUG,TEAM_GANG,TEAM_GANGVIP,TEAM_THIEFF,TEAM_THIEFF_VIP,TEAM_KILL,TEAM_BANK,TEAM_GLCRIME,TEAM_NAIM,TEAM_ADMI3N},
--     Max = 2,
--     Price = 10000,
--     Inventory = false, 
--     mClickerInfo = {
--         pointsPerCycle = 20,
--         moneyPerCycle = 45,
--         maxPoints = 20000,
--         maxMoney = 105000,
--         health = 100,
--         indestructible = false,
--         repairHealthCost = 100,
--         maxCycles = 100,
--         repairBrokenCost = 700,
--         upgrades = {
--             autoClick = {
--                 name = "Авт.клікер",
--                 stats = { 1, 2, 3, 4, 5 },
--                 prices = { 470, 555, 625, 750 },
--             },
--             clickPower = {
--                 name = "Сила Кліка",
--                 stats = { 15, 17, 19, 21 },
--                 prices = { 450, 675, 800 },
--             },
--             cooling = {
--                 name = "Охолодження",
--                 stats = { 2, 3, 4, 5 },
--                 prices = { 450, 575, 725 },
--             },
--             storage = {
--                 name = "Об'єм",
--                 stats = { 1, 2.5, 4, 6 },
--                 prices = { 450, 575, 625 },
--             },
--         },

--         enableHeat = true,
--         heatPerClick = 20,

--         colorPrimary = Color(150, 150, 150),
--         colorSecondary = Color(150, 150, 150),
--         colorText = Color(255, 255, 255),
--         colorHealth = Color(255, 255, 255),
--     },
-- })

-- rp.AddEntites('Срібний Клікер',{
--     Desc = [[Друкує гроші]],
--     Model = "models/props_c17/consolebox01a.mdl",
--     ENT = "money_clicker",
--     Command = "buymoneyclickersilver",
--      allowed = {TEAM_DRUG,TEAM_GANG,TEAM_GANGVIP,TEAM_THIEFF,TEAM_THIEFF_VIP,TEAM_KILL,TEAM_BANK,TEAM_GLCRIME,TEAM_NAIM,TEAM_ADMI3N},
--     Max = 1,
--     Price = 17000,
--     Inventory = false, 
--  mClickerInfo = {
--         pointsPerCycle = 35,
--         moneyPerCycle = 65,
--         maxPoints = 40000,
--         maxMoney = 100000,
--         health = 100,
--         indestructible = false,
--         repairHealthCost = 100,
--         maxCycles = 100,
--         repairBrokenCost = 900,

--         upgrades = {
--             autoClick = {
--                 name = "Авт.Клікер",
--                 stats = { 2, 3, 4, 5, 6 },
--                 prices = { 450, 565, 755, 870 },
--             },
--             clickPower = {
--                 name = "Сила Кліка",
--                 stats = { 20, 22, 24, 26 },
--                 prices = { 450, 665, 875 },
--             },
--             cooling = {
--                 name = "Охолодження",
--                 stats = { 3, 4, 5, 26 },
--                 prices = { 460, 625, 875 },
--             },
--             storage = {
--                 name = "Об'єм",
--                 stats = { 1, 3, 5, 20 },
--                 prices = { 1000, 1500, 5000 },
--             },
--         },

--         enableHeat = true,
--         heatPerClick = 20,

--         colorPrimary = Color(0, 220, 160),
--         colorSecondary = Color(0, 220, 160),
--         colorText = Color(255, 255, 255),
--         colorHealth = Color(255, 255, 255),
--     },
-- })

-- rp.AddEntites('Смарагдовий Клікер',{
--     Desc = [[Друкує гроші]],
--     Model = "models/props_c17/consolebox01a.mdl",
--     ENT = "money_clicker",
--     Command = "buyklickerizy",
--      allowed = {TEAM_DRUG,TEAM_GANG,TEAM_GANGVIP,TEAM_THIEFF,TEAM_THIEFF_VIP,TEAM_KILL,TEAM_BANK,TEAM_GLCRIME,TEAM_NAIM,TEAM_ADMI3N},
--     Max = 1,
--     Price = 25000,
--     Inventory = false, 
--  mClickerInfo = {
--         pointsPerCycle = 55,
--         moneyPerCycle = 75,
--         maxPoints = 70000,
--         maxMoney = 100000,
--         health = 100,
--         indestructible = false,
--         repairHealthCost = 100,
--         maxCycles = 100,
--         repairBrokenCost = 900,

--         upgrades = {
--             autoClick = {
--                 name = "Авт.Клікер",
--                 stats = { 2, 3, 4, 5, 6 },
--                 prices = { 450, 565, 755, 870 },
--             },
--             clickPower = {
--                 name = "Сила Кліка",
--                 stats = { 20, 22, 24, 26 },
--                 prices = { 450, 665, 875 },
--             },
--             cooling = {
--                 name = "Охолодження",
--                 stats = { 3, 4, 5, 26 },
--                 prices = { 460, 625, 875 },
--             },
--             storage = {
--                 name = "Об'єм",
--                 stats = { 1, 3, 5, 20 },
--                 prices = { 450, 525, 775 },
--             },
--         },

--         enableHeat = true,
--         heatPerClick = 20,

--         colorPrimary = Color(0, 165, 120),
--         colorSecondary = Color(0, 165, 120),
--         colorText = Color(255, 255, 255),
--         colorHealth = Color(255, 255, 255),
--     },
-- })

-- rp.AddEntites('Рубіновий клікер [VIP]',{
--     Desc = [[Друкує гроші]],
--     Model = "models/props_c17/consolebox01a.mdl",
--     ENT = "money_clicker",
--     Command = "buymoneyclickergold",
--      allowed = {TEAM_DRUG,TEAM_GANG,TEAM_GANGVIP,TEAM_THIEFF,TEAM_THIEFF_VIP,TEAM_KILL,TEAM_BANK,TEAM_GLCRIME,TEAM_NAIM,TEAM_ADMI3N},
--     Max = 2,
--     vip = true,
--     Price = 2750000,
--     Inventory = false, 
--     mClickerInfo = {
--         pointsPerCycle = 40,
--         moneyPerCycle = 700,
--         maxPoints = 70000,
--         maxMoney = 200000,
--         health = 250,
--         indestructible = false,
--         repairHealthCost = 50000,
--         maxCycles = 300,
--         repairBrokenCost = 50000,

--         upgrades = {
--             autoClick = {
--                 name = "Авт.Клікер",
--                 stats = { 2, 3, 4, 5, 6 },
--                 prices = { 450 * 4, 565 * 4, 755 * 4, 870 * 4 },
--             },
--             clickPower = {
--                 name = "Сила Кліка",
--                 stats = { 20, 22, 24, 26 },
--                 prices = { 450 * 4, 665 * 4, 875 * 4 },
--             },
--             cooling = {
--                 name = "Охолодження",
--                 stats = { 3, 4, 5, 26 },
--                 prices = { 460 * 4, 625 * 4, 875 * 4 },
--             },
--             storage = {
--                 name = "Об'єм",
--                 stats = { 1, 3, 5, 20 },
--                 prices = { 450 * 4, 525 * 4, 775 * 4 },
--             },
--         },

--         enableHeat = true,
--         heatPerClick = 20,

--         colorPrimary = Color(210, 0, 50),
--         colorSecondary = Color(210, 0, 50),
--         colorText = Color(255, 255, 255),
--         colorHealth = Color(255, 255, 255),
--     },
-- })

rp.AddEntites('Ферма тварин',{
    Desc = [[]],
    Model = "models/props_lab/kennel_physics.mdl",
    ENT = "ba_cage",
    Command = "buybacage",
    Max = 6,
    Price = 2000,
    Inventory = true, 
    allowed = {TEAM_BA_OWNER},
    category = "Ферма"
})
rp.AddEntites('Корм низької якості',{
    Desc = [[]],
    Model = "models/props_junk/cardboard_box002a.mdl",
    ENT = "ba_lowquality_meals",
    Command = "buylqmeals",
    Max = 1,
    Price = 1300,
    Inventory = true, 
    allowed = {TEAM_BA_OWNER},
    category = "Ферма"
})

rp.AddEntites('Корм середньої якості',{
    Desc = [[]],
    Model = "models/props_junk/cardboard_box002a.mdl",
    ENT = "ba_medquality_meals",
    Command = "buymqmeals",
    Max = 1,
    Price = 1600,
    Inventory = true, 
    allowed = {TEAM_BA_OWNER},
    category = "Ферма"
})

rp.AddEntites('Корм найвищої якості',{
    Desc = [[]],
    Model = "models/props_junk/cardboard_box002a.mdl",
    ENT = "ba_topquality_meals",
    Command = "buytqmeals",
    Max = 1,
    Price = 2400,
    Inventory = true, 
    allowed = {TEAM_BA_OWNER},
    category = "Ферма"
})
 
rp.AddEntites("Набої для Револьвера", { 
    ENT = "m9k_ammo_357", 
    Model = "models/Items/357ammo.mdl", 
    Price = 500, 
    Max = 8, 
    Desc = [[Набої]], 
    Command = "m9k_ammo_357_buy", 
    Inventory = true,    
})

rp.AddEntites("Набої для Автомату", { 
    ENT = "m9k_ammo_ar2", 
    Model = "models/Items/BoxMRounds.mdl", 
    Price = 2250, 
    Max = 8, 
    Desc = [[Набої]], 
    Command = "m9k_ammo_ar2_buy", 
    Inventory = true,    
})
rp.AddEntites("Набої для Пістолета-Пулімета", { 
    ENT = "m9k_ammo_smg", 
    Model = "models/Items/BoxSRounds.mdl", 
    Price = 850, 
    Max = 8, 
    Desc = [[Набої]], 
    Command = "m9k_ammo_smg_buy", 
    Inventory = true,    
})
rp.AddEntites("Набої для Дробовика", { 
    ENT = "m9k_ammo_buckshot", 
    Model = "models/Items/BoxBuckshot.mdl", 
    Price = 650, 
    Max = 8, 
    Desc = [[Набої]], 
    Command = "m9k_ammo_buckshot_buy", 
    Inventory = true,    
})
rp.AddEntites("Набої для пістолетів", { 
    ENT = "m9k_ammo_pistol", 
    Model = "models/Items/BoxSRounds.mdl", 
    Price = 550, 
    Max = 8, 
    Desc = [[Набої]], 
    Command = "m9k_ammo_pistol_buy", 
    Inventory = true,    
})
rp.AddEntites("Набої для Снайперки", { 
    ENT = "m9k_ammo_winchester", 
    Model = "models/Items/sniper_round_box.mdl", 
    Price = 3500, 
    Max = 8, 
    Desc = [[Набої]], 
    Command = "m9k_ammo_winchester_buy", 
    Inventory = true,    
})
---
rp.AddEntites("Батарейка", {
    ENT = "uweed_battery",
    Desc = [[]],
    Model = "models/base/battery.mdl",
    Price = 7500,
    Max = 4,
    Command = "uweed_battery",
    allowed = {TEAM_GROVER},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Папір", {
    ENT = "uweed_frontwoods",
    Desc = [[]],
    Model = "models/base/frontwoods.mdl",
    Price = 2500,
    Max = 1,
    Command = "uweed_frontwoods",
    allowed = {TEAM_GROVER},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Велика лампа", {
    ENT = "uweed_light_big",
    Desc = [[]],
    Model = "models/base/lamp2.mdl",
    Price = 42500,
    Max = 3,
    Command = "uweed_light_big",
    allowed = {TEAM_GROVER},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Лампа", {
    ENT = "uweed_light",
    Desc = [[]],
    Model = "models/base/lamp1.mdl",
    Price = 13500,
    Max = 3,
    Command = "uweed_light",
    allowed = {TEAM_GROVER},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Горщик", {
    ENT = "uweed_plant",
    Desc = [[]],
    Model = "models/base/weedplant.mdl",
    Price = 15000,
    Max = 9,
    Command = "uweed_plant",
    allowed = {TEAM_GROVER},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Ваги", {
    ENT = "uweed_scale",
    Desc = [[]],
    Model = "models/base/scale.mdl",
    Price = 25600,
    Max = 1,
    Command = "uweed_scale",
    allowed = {TEAM_GROVER},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Зерна", {
    ENT = "uweed_seed_box",
    Desc = [[]],
    Model = "models/base/weedbox.mdl",
    Price = 19000,
    Max = 1,
    Command = "uweed_seed_box",
    allowed = {TEAM_GROVER},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Пакет", {
    ENT = "uweed_bag",
    Desc = [[]],
    Model = "models/base/weedbag.mdl",
    Price = 8500,
    Max = 1,
    Command = "uweed_bag",
    allowed = {TEAM_GROVER},
    Inventory = false,
    Desc = "",
})

--
-- Doctor
--
rp.AddEntites("Путівник", {
    ENT = "bp_guide_book",
    Model = "models/blues_pharm/book.mdl",
    Price = 250,
    Max = 1,
    Command = "bp_guide_book",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

--Six is the max amount in a single freezer, so match this to the number of freezers allowed
rp.AddEntites("Стакан", {
    ENT = "bp_beaker",
    Model = "models/blues_pharm/beaker.mdl",
    Price = 1500,
    Max = 6,
    Command = "bp_beaker",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Пальник Бунзена", {
    ENT = "bp_bunsen_burner",
    Model = "models/blues_pharm/bunsen_burner.mdl",
    Price = 7000,
    Max = 4,
    Command = "bp_bunsen_burner",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Морозильна камера", {
    ENT = "bp_freezer",
    Model = "models/blues_pharm/freezer.mdl",
    Price = 30000,
    Max = 1,
    Command = "bp_freezer",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Прес для таблеток", {
    ENT = "bp_pill_press",
    Model = "models/blues_pharm/pill_presser.mdl",
    Price = 12000,
    Max = 2,
    Command = "bp_pill_press",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

--Chemicals below
rp.AddEntites("Кето кислота", {
    ENT = "bp_chemical_keto_acid",
    Model = "models/blues_pharm/jar_1.mdl",
    Price = 950,
    Max = 2,
    Command = "bp_chemical_keto_acid",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Пропіонова кислота", {
    ENT = "bp_chemical_prop_acid",
    Model = "models/blues_pharm/jar_2.mdl",
    Price = 950,
    Max = 2,
    Command = "bp_chemical_prop_acid",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Саліцилова кислота", {
    ENT = "bp_chemical_sali_acid",
    Model = "models/blues_pharm/jar_2.mdl",
    Price = 800,
    Max = 2,
    Command = "bp_chemical_sali_acid",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Метилтестостерон", {
    ENT = "bp_chemical_17alph",
    Model = "models/blues_pharm/jar_3.mdl",
    Price = 3000,
    Max = 2,
    Command = "bp_chemical_17alph",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("2-нафтол", {
    ENT = "bp_chemical_2nap",
    Model = "models/blues_pharm/jar_3.mdl",
    Price = 2250,
    Max = 2,
    Command = "bp_chemical_2nap",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Прогестерон", {
    ENT = "bp_chemical_prog",
    Model = "models/blues_pharm/jar_3.mdl",
    Price = 4000,
    Max = 2,
    Command = "bp_chemical_prog",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Aцетон", {
    ENT = "bp_chemical_acet2",
    Model = "models/blues_pharm/jar_3.mdl",
    Price = 950,
    Max = 2,
    Command = "bp_chemical_acet2",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Оцтовий ангідрид", {
    ENT = "bp_chemical_acet",
    Model = "models/blues_pharm/jar_4.mdl",
    Price = 1400,
    Max = 2,
    Command = "bp_chemical_acet",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Діоксид селену", {
    ENT = "bp_chemical_sele",
    Model = "models/blues_pharm/jar_4.mdl",
    Price = 2800,
    Max = 2,
    Command = "bp_chemical_sele",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Деіонізована вода", {
    ENT = "bp_chemical_deio",
    Model = "models/blues_pharm/jar_5.mdl",
    Price = 3500,
    Max = 2,
    Command = "bp_chemical_deio",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

hook.Run('LoadingEnts')
--PATH gamemodes/darkrp/gamemode/core/player/player/player_sh.lua:
function PLAYER:GetTeamTable()
	return rp.Team[self:Team()] or {}
end

function PLAYER:CanAfford( amount )
	if not amount then return false end
	return math.floor( amount ) >= 0 and self:GetMoney() - math.floor( amount ) >= 0
end

PLAYER.canAfford = PLAYER.CanAfford
PLAYER.SteamName = PLAYER.SteamName or PLAYER.Name
function PLAYER:Name()
	return IsValid( self ) and ( self:onyx_GetNetVar( 'Name' ) or self:SteamName() ) or 'NONE'
end

PLAYER.GetRPName = PLAYER.Name
PLAYER.Nick = PLAYER.Name
PLAYER.GetName = PLAYER.Name
function PLAYER:GetMoney()
	return IsValid( self ) and self:onyx_GetNetVar( 'Money' ) or 0
end

function PLAYER:GetSalary()
	if not IsValid( self ) or not rp.Team[self:Team()] then return 0 end
	local sal = rp.Team[self:Team()].Salary or 0
	return sal
end

function PLAYER:IsWanted()
	return IsValid( self ) and self:onyx_GetNetVar( 'Wanted' ) or false
end

function PLAYER:WantedReson()
	return IsValid( self ) and self:onyx_GetNetVar( 'WantedReson' ) or ''
end

function JobCategoryС( team )
	for _, v in pairs( rp.Team ) do
		if v.team == team then return v end
	end
end

function PLAYER:JobCat()
	return JobCategoryС( self:Team() ).category
end

rp.category_jobs = {}
function rp.JobCategory()
	for _, v in pairs( rp.Team ) do
		if not table.HasValue( rp.category_jobs, v.category ) then table.insert( rp.category_jobs, v.category ) end
	end
	return rp.category_jobs
end

---------------------------------------------
function PLAYER:GetJob()
	return IsValid( self ) and ( self:onyx_GetNetVar( 'Job' ) or rp.Team[self:Team()] and rp.Team[self:Team()].name or 'Nope' ) or 'Nope'
end

function PLAYER:IsPolice()
	return IsValid( self ) and rp.Team[self:Team()].Police or false
end

function PLAYER:GetJobColor()
	return IsValid( self ) and rp.Team[self:Team()] and rp.Team[self:Team()].Color or color_white
end

function PLAYER:GetJobModel()
	return IsValid( self ) and ( rp.Team[self:Team()] and rp.Team[self:Team()].Model or rp.Team[self:Team()].Model[1] ) or 'models/player/alyx.mdl'
end

function PLAYER:CanBuy( amount )
	if tonumber( self:GetMoney() ) >= tonumber( amount ) and tonumber( amount ) > 1 then
		return true
	else
		return false
	end
end

function PLAYER:IsAdminMode()
	return IsValid( self ) and self:onyx_GetNetVar( 'adminmode' ) or false
end

function GetPlayer( args )
	return player.Find( args ) or false
end
--PATH gamemodes/darkrp/gamemode/core/sandbox/spawnmenu/toolpanel_cl.lua:

local PANEL = {}

AccessorFunc(PANEL, "m_TabID", "TabID")
-- 215 
--[[---------------------------------------------------------
	Name: Paint
-----------------------------------------------------------]]
function PANEL:Init()

	self.List = vgui.Create("DCategoryList", self)
	self.List:Dock(LEFT)
	self.List:SetWidth(130)

	self.Content = vgui.Create("DCategoryList", self)
	self.Content:Dock(FILL)
	self.Content:DockMargin(6, 0, 0, 0)

	self:SetWide(390)

	if (ScrW() > 1280) then
		self:SetWide(460)
	end

end


--[[---------------------------------------------------------
	Name: LoadToolsFromTable
-----------------------------------------------------------]]
function PANEL:LoadToolsFromTable(inTable)

	local inTable = table.Copy(inTable)

	for k, v in pairs(inTable) do

		if (istable(v)) then

			-- Remove these from the table so we can
			-- send the rest of the table to the other
			-- function

			local Name = v.ItemName
			local Label = v.Text
			v.ItemName = nil
			v.Text = nil

			self:AddCategory(Name, Label, v)

		end

	end

end

--[[---------------------------------------------------------
	Name: AddCategory
-----------------------------------------------------------]]
function PANEL:AddCategory(Name, Label, tItems)

	local Category = self.List:Add(Label)

	Category:SetCookieName("ToolMenu." .. tostring(Name))

	local bAlt = true

	local tools = {}
	for k, v in pairs(tItems) do
		tools[ language.GetPhrase(v.Text:sub(2)) ] = v
	end

	for k, v in SortedPairs(tools) do

		local item = Category:Add(v.Text)

		item.DoClick = function(button)

			spawnmenu.ActivateTool(button.Name)

		end

		item.ControlPanelBuildFunction	= v.CPanelFunction
		item.Command					= v.Command
		item.Name						= v.ItemName
		item.Controls					= v.Controls
		item.Text						= v.Text

	end

	self:InvalidateLayout()

end

function PANEL:SetActive(cp)

	local kids = self.Content:GetCanvas():GetChildren()
	for k, v in pairs(kids) do
		v:SetVisible(false)
	end

	self.Content:AddItem(cp)
	cp:SetVisible(true)
	cp:Dock(TOP)

end

vgui.Register("ToolPanel", PANEL, "Panel")
--PATH gamemodes/darkrp/gamemode/core/sandbox/spawnmenu/creationmenu/content/contenticon_cl.lua:

AddCSLuaFile()

local PANEL = {}

local matOverlay_Normal = Material("gui/ContentIcon-normal.png")
local matOverlay_Hovered = Material("gui/ContentIcon-hovered.png")
local matOverlay_AdminOnly = Material("icon16/shield.png")

AccessorFunc(PANEL, "m_Color", 			"Color")
AccessorFunc(PANEL, "m_Type", 				"ContentType")
AccessorFunc(PANEL, "m_SpawnName", 		"SpawnName")
AccessorFunc(PANEL, "m_NPCWeapon", 		"NPCWeapon")

--[[---------------------------------------------------------
   Name: Paint
-----------------------------------------------------------]]
function PANEL:Init()

	self:SetDrawBackground(false)
	self:SetSize(128, 128)
	self:SetText("")
	self:SetDoubleClickingEnabled(false)

	self.Image = self:Add("DImage")
	self.Image:SetPos(3, 3)
	self.Image:SetSize(128 - 6, 128 - 6)
	self.Image:SetVisible(false)

	self.Label = self:Add("DLabel")
	self.Label:Dock(BOTTOM)
	self.Label:SetContentAlignment(2)
	self.Label:DockMargin(4, 0, 4, 10)
	self.Label:SetTextColor(Color(255, 255, 255, 255))
	self.Label:SetExpensiveShadow(1, Color(0, 0, 0, 200))

	self.Border = 0

end

function PANEL:SetName(name)

	self:SetTooltip(name)
	self.Label:SetText(name)
	self.m_NiceName = name

end

function PANEL:SetMaterial(name)

	self.m_MaterialName = name

	local mat = Material(name)

	-- Look for the old style material
	if (!mat || mat:IsError()) then

		name = name:Replace("entities/", "VGUI/entities/")
		name = name:Replace(".png", "")
		mat = Material(name)

	end

	-- Couldn't find any material.. just return
	if (!mat || mat:IsError()) then
		return
	end

	self.Image:SetMaterial(mat)

end

function PANEL:SetAdminOnly(b)
	self.AdminOnly = b
end

function PANEL:DoRightClick()

	local pCanvas = self:GetSelectionCanvas()
	if (IsValid(pCanvas) && pCanvas:NumSelectedChildren() > 0) then
		return hook.Run("SpawnlistOpenGenericMenu", pCanvas)
	end

	self:OpenMenu()
end

function PANEL:DoClick()
end

function PANEL:OpenMenu()
end

function PANEL:OnDepressionChanged(b)
end

function PANEL:Paint(w, h)

	if (self.Depressed && !self.Dragging) then
		if (self.Border != 8) then
			self.Border = 8
			self:OnDepressionChanged(true)
		end
	else
		if (self.Border != 0) then
			self.Border = 0
			self:OnDepressionChanged(false)
		end
	end

	render.PushFilterMag(TEXFILTER.ANISOTROPIC)
	render.PushFilterMin(TEXFILTER.ANISOTROPIC)

	self.Image:PaintAt(3 + self.Border, 3 + self.Border, 128-8-self.Border*2, 128-8-self.Border*2)

	render.PopFilterMag()
	render.PopFilterMin()

	surface.SetDrawColor(255, 255, 255, 255)

	if (!dragndrop.IsDragging() && (self:IsHovered() || self:IsChildHovered(2))) then

		surface.SetMaterial(matOverlay_Hovered)
		self.Label:Hide()

	else

		surface.SetMaterial(matOverlay_Normal)
		self.Label:Show()

	end

	surface.DrawTexturedRect(self.Border, self.Border, w-self.Border*2, h-self.Border*2)

	if (self.AdminOnly) then
		surface.SetMaterial(matOverlay_AdminOnly)
		surface.DrawTexturedRect(self.Border + 8, self.Border + 8, 16, 16)
	end
end

function PANEL:PaintOver(w, h)

	self:DrawSelections()

end

function PANEL:ToTable(bigtable)

	local tab = {}

	tab.type		= self:GetContentType()
	tab.nicename	= self.m_NiceName
	tab.material	= self.m_MaterialName
	tab.admin		= self.AdminOnly
	tab.spawnname	= self:GetSpawnName()
	tab.weapon		= self:GetNPCWeapon()

	table.insert(bigtable, tab)

end

function PANEL:Copy()

	local copy = vgui.Create("ContentIcon", self:GetParent())

	copy:SetContentType(self:GetContentType())
	copy:SetSpawnName(self:GetSpawnName())
	copy:SetName(self.m_NiceName)
	copy:SetMaterial(self.m_MaterialName)
	copy:SetNPCWeapon(self:GetNPCWeapon())
	copy:SetAdminOnly(self.AdminOnly)
	copy:CopyBase(self)
	copy.DoClick = self.DoClick
	copy.OpenMenu = self.OpenMenu

	return copy

end

vgui.Register("ContentIcon", PANEL, "DButton")


spawnmenu.AddContentType("entity", function(container, obj)

	if (!obj.material) then return end
	if (!obj.nicename) then return end
	if (!obj.spawnname) then return end

	local icon = vgui.Create("ContentIcon", container)
		icon:SetContentType("entity")
		icon:SetSpawnName(obj.spawnname)
		icon:SetName(obj.nicename)
		icon:SetMaterial(obj.material)
		icon:SetAdminOnly(obj.admin)
		icon:SetColor(Color(205, 92, 92, 255))
		icon.DoClick = function()
						RunConsoleCommand("gm_spawnsent", obj.spawnname)
						surface.PlaySound("ui/buttonclickrelease.wav")
					end
		icon.OpenMenu = function(icon)

						local menu = DermaMenu()
							menu:AddOption("Copy to Clipboard", function() SetClipboardText(obj.spawnname) end)
							menu:AddOption("Spawn Using Toolgun", function() RunConsoleCommand("gmod_tool", "creator" ) RunConsoleCommand("creator_type", "0") RunConsoleCommand("creator_name", obj.spawnname) end)
							menu:AddSpacer()
							menu:AddOption("Delete", function() icon:Remove() hook.Run("SpawnlistContentChanged", icon) end)
						menu:Open()

					end

	if (IsValid(container)) then
		container:Add(icon)
	end

	return icon

end )

spawnmenu.AddContentType("vehicle", function(container, obj)

	if (!obj.material) then return end
	if (!obj.nicename) then return end
	if (!obj.spawnname) then return end

	local icon = vgui.Create("ContentIcon", container)
		icon:SetContentType("vehicle")
		icon:SetSpawnName(obj.spawnname)
		icon:SetName(obj.nicename)
		icon:SetMaterial(obj.material)
		icon:SetAdminOnly(obj.admin)
		icon:SetColor(Color(0, 0, 0, 255))
		icon.DoClick = function()
						RunConsoleCommand("gm_spawnvehicle", obj.spawnname)
						surface.PlaySound("ui/buttonclickrelease.wav")
					end
		icon.OpenMenu = function(icon)

						local menu = DermaMenu()
							menu:AddOption("Copy to Clipboard", function() SetClipboardText(obj.spawnname) end)
							menu:AddOption("Spawn Using Toolgun", function() RunConsoleCommand("gmod_tool", "creator" ) RunConsoleCommand("creator_type", "1") RunConsoleCommand("creator_name", obj.spawnname) end)
							menu:AddSpacer()
							menu:AddOption("Delete", function() icon:Remove() hook.Run("SpawnlistContentChanged", icon) end)
						menu:Open()

					end

	if (IsValid(container)) then
		container:Add(icon)
	end

	return icon

end )

local gmod_npcweapon = CreateConVar("gmod_npcweapon", "", { FCVAR_ARCHIVE })

spawnmenu.AddContentType("npc", function(container, obj)

	if (!obj.material) then return end
	if (!obj.nicename) then return end
	if (!obj.spawnname) then return end

	if (!obj.weapon) then obj.weapon = { "" } end

	local icon = vgui.Create("ContentIcon", container)
		icon:SetContentType("npc")
		icon:SetSpawnName(obj.spawnname)
		icon:SetName(obj.nicename)
		icon:SetMaterial(obj.material)
		icon:SetAdminOnly(obj.admin)
		icon:SetNPCWeapon(obj.weapon)
		icon:SetColor(Color(244, 164, 96, 255))

		icon.DoClick = function()

						local weapon = table.Random(obj.weapon)
						if (gmod_npcweapon:GetString() != "") then weapon = gmod_npcweapon:GetString() end

						RunConsoleCommand("gmod_spawnnpc", obj.spawnname, weapon)
						surface.PlaySound("ui/buttonclickrelease.wav")
					end

		icon.OpenMenu = function(icon)

						local menu = DermaMenu()

							local weapon = table.Random(obj.weapon)
							if (gmod_npcweapon:GetString() != "") then weapon = gmod_npcweapon:GetString() end

							menu:AddOption("Copy to Clipboard", function() SetClipboardText(obj.spawnname) end)
							menu:AddOption("Spawn Using Toolgun", function() RunConsoleCommand("gmod_tool", "creator" ) RunConsoleCommand("creator_type", "2") RunConsoleCommand("creator_name", obj.spawnname) RunConsoleCommand("creator_arg", weapon) end)
							menu:AddSpacer()
							menu:AddOption("Delete", function() icon:Remove() hook.Run("SpawnlistContentChanged", icon) end)
						menu:Open()

					end



	if (IsValid(container)) then
		container:Add(icon)
	end

	return icon

end )

spawnmenu.AddContentType("weapon", function(container, obj)

	if (!obj.material) then return end
	if (!obj.nicename) then return end
	if (!obj.spawnname) then return end

	local icon = vgui.Create("ContentIcon", container)
		icon:SetContentType("weapon")
		icon:SetSpawnName(obj.spawnname)
		icon:SetName(obj.nicename)
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


		icon.OpenMenu = function(icon)

						local menu = DermaMenu()
							menu:AddOption("Copy to Clipboard", function() SetClipboardText(obj.spawnname) end)
							menu:AddOption("Заспавнить", function() RunConsoleCommand("gmod_tool", "creator" ) RunConsoleCommand("creator_type", "3") RunConsoleCommand("creator_name", obj.spawnname) end)
							menu:AddSpacer()
							menu:AddOption("Delete", function() icon:Remove() hook.Run("SpawnlistContentChanged", icon) end)
						menu:Open()

						end


	if (IsValid(container)) then
		container:Add(icon)
	end

	return icon

end )
--PATH gamemodes/darkrp/gamemode/cfg/ents_sh.lua:

rp.AddEntites('Телевизор',{
    Desc = [[]],
    Model = "models/props/cs_office/tv_plasma.mdl",
    ENT = "mediaplayer_tv",
    Command = "item_mediaplayertv",
    Max = 1,
    vip = true,
    Price = 15000,
    allowed = {},
    Inventory = false,    
    RemoveOnJobChange = false,
})

rp.AddEntites('Аптечка',{
    Desc = [[Для важких життєвих моментів.]],
    Model = "models/Items/HealthKit.mdl",
    ENT = "item_healthkit",
    Command = "item_healthkit",
    Max = 1,
    vip = true,
    Price = 2000,
    allowed = {},
    Inventory = true,    
    RemoveOnJobChange = false,
})

rp.AddEntites('Броня',{
    Desc = [[Для тяжких життєвих моментів.]],
    Model = "models/Items/battery.mdl",
    ENT = "item_battery",
    Command = "item_battery",
    Max = 1,
    vip = true,
    Price = 3500,
    allowed = {},
    Inventory = true,    
    RemoveOnJobChange = false,
})

rp.AddEntites("Паливо", { 
    ENT = "bm2_fuel", 
    Model = "models/props_junk/gascan001a.mdl", 
    Price = 750, 
    Max = 4, 
    Desc = [[Усе для майнінг ферми]], 
    Command = "Bitminer7", 
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223}, 
    Inventory = false,    
})

rp.AddEntites("Bitminer S1", {
    ENT = "bm2_bitminer_1",
    Model = "models/bitminers2/bitminer_1.mdl",
    Price = 5000,
    Max = 4,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer1",
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,   
}) 

rp.AddEntites("Bitminer S2", {
    ENT = "bm2_bitminer_2",
    Model = "models/bitminers2/bitminer_3.mdl",
    Price = 20000,
    Max = 4,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer2",
    vip = true,
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,   
})

rp.AddEntites("Bitminer Сервер", {
    ENT = "bm2_bitminer_server",
    Model = "models/bitminers2/bitminer_2.mdl",
    Price = 30000,
    Max = 16,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer3",
    vip = true,
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,   
})

rp.AddEntites("Серверна стійка", {
    ENT = "bm2_bitminer_rack",
    Model = "models/bitminers2/bitminer_rack.mdl",
    Price = 55000,
    Max = 2,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer4",
    vip = true,
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,   
})


rp.AddEntites("Провід", {
    ENT = "bm2_power_lead",
    Model = "models/bitminers2/bitminer_plug_2.mdl",
    Price = 750,
    Max = 10,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer5",
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,  
})

rp.AddEntites("Генератор", {
    ENT = "bm2_generator",
    Model = "models/bitminers2/generator.mdl",
    Price = 7500,
    Max = 3,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer6",
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,   
})

rp.AddEntites("Паливо провід", {
    ENT = "bm2_extra_fuel_line",
    Model = "models/bitminers2/bm2_extra_fuel_plug.mdl",
    Price = 750,
    Max = 2,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer8",
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,   
})

rp.AddEntites("Паливний бак", {
    ENT = "bm2_extra_fuel_tank",
    Model = "models/bitminers2/bm2_extra_fueltank.mdl",
    Price = 70000,
    Max = 2,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer9",
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,   
})

rp.AddEntites("Топливо для топливного бака", {
    ENT = "bm2_large_fuel",
    Model = "models/props_c17/oildrum001.mdl",
    Price = 3200,
    Max = 2,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer10",
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,   
})

rp.AddEntites("Сонячний кабель", {
    ENT = "bm2_solar_cable",
    Model = "models/bitminers2/bm2_solar_plug.mdl",
    Price = 3500,
    Max = 10,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer11",
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,   
})

rp.AddEntites("Перетворювач сонячної енергії", {
    ENT = "bm2_solarconverter",
    Model = "models/bitminers2/bm2_solar_converter.mdl",
    Price = 11500,
    Max = 10,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer12",
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,   
})

rp.AddEntites("Сонячна панель", {
    ENT = "bm2_solar_panel",
    Model = "models/bitminers2/bm2_solar_panel.mdl",
    Price = 22000,
    Max = 10,
    Desc = [[Усе для майнінг ферми]],
    Command = "Bitminer13",
    allowed = {TEAM_BITMINER,TEAM_ADMI3qwfqwN223},
    Inventory = false,   
})

rp.AddEntites('Мет',{
    Desc = [[]],
    Model = "models/props_junk/garbage_bag001a.mdl",
    ENT = "savav_meth",
    Command = "savav_meth",
    Max = 1,
    Price = 800,
    allowed = {TEAM_DRUGDiller},
    Inventory = true,    
})

rp.AddEntites('Пиво',{
    Desc = [[]],
    Model = "models/props_junk/garbage_glassbottle003a.mdl",
    ENT = "savav_beer",
    Command = "savav_beer",
    Max = 1,
    Price = 800,
    allowed = {TEAM_DRUGDiller},
    Inventory = true,    
})

rp.AddEntites('Кокаїн',{
    Desc = [[]],
    Model = "models/cocn.mdl",
    ENT = "savav_cocaine",
    Command = "savav_cocaine",
    Max = 1,
    Price = 1250,
    allowed = {TEAM_DRUGDiller},
    Inventory = true,    
})

rp.AddEntites('Кавун Віри',{
    Desc = [[]],
    Model = "models/props_junk/watermelon01.mdl",
    ENT = "savav_watermelon",
    Command = "savav_watermelon",
    Max = 1,
    Price = 2250,
    allowed = {TEAM_DRUGDiller},
    Inventory = true,    
})

rp.AddEntites("Банку", {
    ENT = "eml_jar",
    Desc = [[Для варіння Мета]],
    Model = "models/props_lab/jar01a.mdl",
    Price = 1200,
    Max = 5,
    Command = "eml_jar",
    allowed = {TEAM_DRUG},
    Inventory = true,    
    Desc = "",
})

rp.AddEntites("Газ", {
    ENT = "eml_gas",
    Desc = [[Для варіння Мета]],
    Model = "models/props_c17/canister01a.mdl",
    Price = 1600,
    Max = 5,
    Command = "eml_gas",
    allowed = {TEAM_DRUG},
    Inventory = true,    
    Desc = "",
})

rp.AddEntites("Плита", {
    ENT = "eml_stove",
    Desc = [[Для варіння Мета]],
    Model = "models/props_c17/furnitureStove001a.mdl",
    Price = 5500,
    Max = 2,
    Command = "eml_stove",
    allowed = {TEAM_DRUG},
    Inventory = true,    
    Desc = "",
})

rp.AddEntites("Рідка сірка", {
    ENT = "eml_sulfur",
    Desc = [[Для варіння Мета]],
    Model = "models/props_lab/jar01a.mdl",
    Price = 450,
    Max = 5,
    Command = "eml_sulfur",
    allowed = {TEAM_DRUG},
    Inventory = true,    
    Desc = "",
})

rp.AddEntites("Рідкий Йод", {
    ENT = "eml_iodine",
    Desc = [[Для варіння Мета]],
    Model = "models/props_lab/jar01a.mdl",
    Price = 750,
    Max = 5,
    Command = "eml_iodine",
    allowed = {TEAM_DRUG},
    Inventory = true,    
    Desc = "",
})

rp.AddEntites("Соляна Кислота", {
    ENT = "eml_macid",
    Desc = [[Для варіння Мета]],
    Model = "models/props_lab/jar01a.mdl",
    Price = 650,
    Max = 5,
    Command = "eml_macid",
    allowed = {TEAM_DRUG},
    Inventory = true,    
    Desc = "",
})

rp.AddEntites("Вода", {
    ENT = "eml_water",
    Desc = [[Для варіння Мета]],
    Model = "models/props_junk/garbage_plasticbottle003a.mdl",
    Price = 650,
    Max = 5,
    Command = "eml_water",
    allowed = {TEAM_DRUG},
    Inventory = true,    
    Desc = "",
})

rp.AddEntites("Каструля", {
    ENT = "eml_pot",
    Desc = [[Для варіння Мета]],
    Model = "models/props_c17/metalPot001a.mdl",
    Price = 1450,
    Max = 4,
    Command = "eml_pot",
    allowed = {TEAM_DRUG},
    Inventory = true,    
    Desc = "",
})

rp.AddEntites("Спеціальна Каструля", {
    ENT = "eml_spot",
    Desc = [[Для варіння Мета]],
    Model = "models/props_c17/metalPot001a.mdl",
    Price = 1450,
    Max = 4,
    Command = "eml_spot",
    allowed = {TEAM_DRUG},
    Inventory = true,    
    Desc = "",
})

rp.AddEntites('Радіо',{
    Desc = [[Влаштуй дискотеку]],
    Model = "models/props_lab/citizenradio.mdl",
    ENT = "radio",
    Command = "radio",
    Max = 6,
    CanTouch = true,
    Price = 2500,
    allowed = {TEAM_RADIO},
    Inventory = false,
})

rp.AddEntites('Радіо',{
    Desc = [[Щоб купити Радіо без VIP зайдіть за професію Радіомеханік]],
    Model = "models/props_lab/citizenradio.mdl",
    ENT = "radio",
    Command = "radiov",
    Max = 1,
    vip = true,
    CanTouch = true,
    Price = 15000,
    allowed = {},
    RemoveOnJobChange = false,
    Inventory = false,
})

rp.AddEntites('Вейп',{
    Desc = [[Парю де хочу, законом не заборонено]],
    Model = "models/swamponions/vape.mdl",
    ENT = "weapon_vape",
    Command = "vape",
    Max = 1,
    vip = false,
    Price = 6500,
    allowed = {},
    Inventory = false,
})

rp.AddEntites('Костюм Злодюжки',{
    Desc = [[У ньому тебе ніхто не впізнає!]],
    Model = "models/props_c17/SuitCase001a.mdl",
    ENT = "disgue",
    Command = "disgue",
    Max = 1,
    vip = false,
    Price = 15000,
    allowed = {TEAM_DRUG,TEAM_GANG,TEAM_GANGVIP,TEAM_THIEFF,TEAM_THIEFF_VIP,TEAM_KILL,TEAM_BANK,TEAM_GLCRIME,TEAM_NAIM,TEAM_ADMI3qwfqwNYASD44},
    Inventory = false,
    RemoveOnJobChange = false,
})

rp.AddWeapon("Відмичка",{
    Desc = "Зламуй замки",
    Model = "models/weapons/w_crowbar.mdl",
    ENT = "lockpick",
    Max = 5,
    Price = 1500,
    allowed = {TEAM_DARKGUN,TEAM_ADMI3qwfqwNYASD44},
    Inventory = true,    
})

rp.AddWeapon("SLAM",{
    Desc = "БадаБум",
    Model = "models/weapons/w_slam.mdl",
    ENT = "weapon_slam",
    Max = 1,
    Price = 75000,
    allowed = {TEAM_VENI,TEAM_VENI1},
    Inventory = true,    
})

rp.AddWeapon("Граната",{
    Desc = "БадаБум",
    Model = "models/weapons/w_grenade.mdl",
    ENT = "weapon_frag",
    Max = 1,
    Price = 35000,
    allowed = {TEAM_VENI,TEAM_VENI1},
    Inventory = true,    
})
    
rp.AddWeapon("Зломщик Кейпадів",{
    Desc = "Зламуй Кейпади",
    Model = "models/weapons/w_c4.mdl",
    ENT = "base_keypadcracker",
    Max = 5,
    Price = 4000,
    allowed = {TEAM_DARKGUN},
    Inventory = true,    
})  

rp.AddWeapon("С4",{
    Desc = "Підриває базу ворогам",
    Model = "models/weapons/w_c4.mdl",
    ENT = "weapon_c4",
    Max = 2,
    Price = 130000,
    allowed = {TEAM_DARKGUN},
    Inventory = true,    
})  

rp.AddEntites('Мікрохвильовка',{
    Desc = [[Їж, їж, їж, нікого не слухай.]],
    Model = "models/props/cs_office/microwave.mdl",
    ENT = "microwave",
    Command = "microwave",
    Max = 1,
    Price = 2500,
    allowed = {TEAM_COOK},
    Inventory = false, 
})

rp.AddWeapon("Щит",{
    Desc = "Щит",
    Model = "models/bshields/rshield.mdl",
    ENT = "riot_shield",
    Max = 1,
    Price = 15000,
    allowed = {TEAM_POLICE},
    Inventory = false,
})

rp.AddWeapon("Щит",{
    Desc = "Щит",
    Model = "models/bshields/hshield.mdl",
    ENT = "heavy_shield",
    Max = 1,
    Price = 15000,
    allowed = {TEAM_FBI},
    Inventory = false,
})

rp.AddWeapon("M92 Beretta", "models/weapons/w_beretta_m92.mdl", "m9k_m92beretta", 2100, 10, false, 750, false, {TEAM_GUN})
rp.AddWeapon("HK USP", "models/weapons/w_pist_fokkususp.mdl", "m9k_usp", 2700, 10, false, 800, false, {TEAM_GUN})
rp.AddWeapon("Sig Sauer", "models/weapons/w_sig_229r.mdl", "m9k_sig_p229r", 2800, 10, false, 2000, false, {TEAM_GUN})
rp.AddWeapon("Knife", "models/weapons/w_sig_229r.mdl", "swb_knife", 9500, 10, false, 750, false, {TEAM_DARKGUN})
rp.AddWeapon("Colt 1911", "models/weapons/s_dmgf_co1911.mdl", "m9k_colt1911", 3800, 10, false, 1000, false, {TEAM_DARKGUN})
rp.AddWeapon("Colt Python", "models/weapons/w_colt_python.mdl", "m9k_coltpython", 4800, 10, false, 2000, false, {TEAM_DARKGUN})
rp.AddWeapon("Glock 18", "models/weapons/w_dmg_glock.mdl", "m9k_glock", 40800, 10, false, 2000, false, {TEAM_DARKGUN})

rp.AddWeapon("TEC-9", "models/weapons/w_intratec_tec9.mdl", "m9k_tec9", 12000, 10, false, 2000, false, {TEAM_GUN})
rp.AddWeapon("HK UMP45", "models/weapons/w_hk_ump45.mdl", "m9k_ump45", 13900, 10, false, 2500, false, {TEAM_GUN})
rp.AddWeapon("Bizon PP19", "models/weapons/w_pp19_bizon.mdl", "m9k_bizonp19", 11900, 10, false, 2500, false, {TEAM_DARKGUN})
rp.AddWeapon("FN P90", "models/weapons/w_fn_p90.mdl", "m9k_smgp90", 13900, 10, false, 2500, false, {TEAM_DARKGUN})

rp.AddWeapon("AK-47", "models/weapons/w_ak47_m9k.mdl", "m9k_ak47", 24000, 10, false, 4000, false, {TEAM_DARKGUN})
rp.AddWeapon("F2000", "models/weapons/w_fn_f2000.mdl", "m9k_f2000", 30900, 10, false, 4000, false, {TEAM_GUN})
rp.AddWeapon("FAMAS", "models/weapons/w_tct_famas.mdl", "m9k_famas", 67900, 10, false, 4000, false, {TEAM_GUN})
rp.AddWeapon("TAR 21", "models/weapons/w_imi_tar21.mdl", "m9k_tar21", 25900, 10, false, 4000, false, {TEAM_GUN})
rp.AddWeapon("M4A1 Iron", "models/weapons/w_m4a1_iron.mdl", "m9k_m4a1", 25000, 10, false, 4500, false, {TEAM_GUN})
rp.AddWeapon("G36", "models/weapons/w_hk_g36c.mdl", "m9k_g36", 22900, 10, false, 3900, false, {TEAM_GUN})
rp.AddWeapon("L85", "models/weapons/w_l85a2.mdl", "m9k_l85", 34900, 10, false, 5500, false, {TEAM_GUN}) 
rp.AddWeapon("SCAR", "models/weapons/w_fn_scar_h.mdl", "m9k_scar", 30900, 10, false, 4000, false, {TEAM_DARKGUN})
rp.AddWeapon("M14", "models/weapons/w_snip_m14sp.mdl", "m9k_m14sp", 20900, 10, false, 7500, false, {TEAM_DARKGUN})
rp.AddWeapon("AN-94", "models/weapons/w_rif_an_94.mdl", "m9k_an94", 24900, 10, false, 7500, false, {TEAM_DARKGUN})
rp.AddWeapon("HK G3A3", "models/weapons/w_hk_g3.mdl", "m9k_g3a3", 18900, 10, false, 7500, false, {TEAM_DARKGUN})

rp.AddWeapon("Ares Shrike", "models/weapons/w_ares_shrike.mdl", "m9k_ares_shrike", 70900, 10, false, 75000, false, {TEAM_GUN})
rp.AddWeapon("FG 42", "models/weapons/w_fg42.mdl", "m9k_fg42", 42900, 10, false, 75000, false, {TEAM_GUN})
rp.AddWeapon("M249 LMG", "models/weapons/w_m249_machine_gun.mdl", "m9k_m249lmg", 58900, 10, false, 75000, false, {TEAM_DARKGUN})

rp.AddWeapon("Benelli M3", "models/weapons/w_benelli_m3.mdl", "m9k_m3", 17500, 10, false, 75000, false, {TEAM_GUN})
rp.AddWeapon("Browning Auto 5", "models/weapons/w_browning_auto.mdl", "m9k_browningauto5", 26000, 10, false, 75000, false, {TEAM_GUN})
rp.AddWeapon("SPAS 12", "models/weapons/w_spas_12.mdl", "m9k_spas12", 85000, 10, false, 175000, false, {TEAM_DARKGUN})
rp.AddWeapon("Mossberg590", "models/weapons/w_mossberg_590.mdl", "m9k_mossberg590", 34000, 10, false, 175000, false, {TEAM_DARKGUN})
rp.AddWeapon("AK47 Beast", "models/weapons/w_ak47_m9k.mdl", "weapon_ak47_beast", 175000, 10, false, 175000, false, {TEAM_DARKGUN})
rp.AddWeapon("G36 Balrog", "models/weapons/w_hk_g36c.mdl", "g36_balrog", 95000, 10, false, 175000, false, {TEAM_DARKGUN})
rp.AddWeapon("AC ВАЛ", "models/weapons/w_dmg_vally.mdl", "m9k_val", 45000, 10, false, 175000, false, {TEAM_DARKGUN})


rp.AddWeapon("M24", "models/weapons/w_snip_m24_6.mdl", "m9k_m24", 37500, 10, false, 175000, false, {TEAM_GUN})
rp.AddWeapon("HK SL8", "models/weapons/w_hk_sl8.mdl", "m9k_sl8", 43000, 10, false, 175000, false, {TEAM_GUN})
rp.AddWeapon("Intervention", "models/weapons/w_snip_int.mdl", "m9k_intervention", 87500, 10, false, 175000, false, {TEAM_DARKGUN})
rp.AddWeapon("AWP", "models/weapons/w_acc_int_aw50.mdl", "swb_awp", 87500, 10, false, 175000, false, {TEAM_GUN})
rp.AddWeapon("AI AW50", "models/weapons/w_acc_int_aw50.mdl", "m9k_aw50", 95000, 10, false, 175000, false, {TEAM_DARKGUN})

-- rp.AddEntites('Бронзовий Клікер',{
--     Desc = [[Друкує гроші]],
--     Model = "models/props_c17/consolebox01a.mdl",
--     ENT = "money_clicker",
--     Command = "buymoneyclicker1",
--      allowed = {TEAM_DRUG,TEAM_GANG,TEAM_GANGVIP,TEAM_THIEFF,TEAM_THIEFF_VIP,TEAM_KILL,TEAM_BANK,TEAM_GLCRIME,TEAM_NAIM,TEAM_ADMI3N},
--     Max = 1,
--     Price = 5000,
--     Inventory = false, 
--     mClickerInfo = {
--         pointsPerCycle = 15,
--         moneyPerCycle = 35,
--         maxPoints = 10000,
--         maxMoney = 100000,
--         health = 100,
--         indestructible = false,
--         repairHealthCost = 100,
--         maxCycles = 100,
--         repairBrokenCost = 450,

--         upgrades = {
--             autoClick = {
--                 name = "Авт.Клікер",
--                 stats = { 1, 2, 3, 4, 5 },
--                 prices = { 455, 550, 650, 765 },
--             },
--             clickPower = {
--                 name = "Сила Кліка",
--                 stats = { 10, 12, 14, 16 },
--                 prices = { 440, 520, 650 },
--             },
--             cooling = {
--                 name = "Охолодження",
--                 stats = { 3, 4, 6, 6 },
--                 prices = { 450, 550, 650 },
--             },
--             storage = {
--                 name = "Об'єм",
--                 stats = { 1, 2, 3, 4 },
--                 prices = { 530, 600, 720 },
--             },
--         },

--         enableHeat = true,
--         heatPerClick = 20,

--         colorPrimary = Color(185, 125, 0),
--         colorSecondary = Color(185, 125, 0),
--         colorText = Color(255, 255, 255),
--         colorHealth = Color(255, 255, 255),
--     },
-- })

-- rp.AddEntites('Срібний Клікер',{
--     Desc = [[Друкує гроші]],
--     Model = "models/props_c17/consolebox01a.mdl",
--     ENT = "money_clicker",
--     Command = "buymoneyclicker2",
--      allowed = {TEAM_DRUG,TEAM_GANG,TEAM_GANGVIP,TEAM_THIEFF,TEAM_THIEFF_VIP,TEAM_KILL,TEAM_BANK,TEAM_GLCRIME,TEAM_NAIM,TEAM_ADMI3N},
--     Max = 2,
--     Price = 10000,
--     Inventory = false, 
--     mClickerInfo = {
--         pointsPerCycle = 20,
--         moneyPerCycle = 45,
--         maxPoints = 20000,
--         maxMoney = 105000,
--         health = 100,
--         indestructible = false,
--         repairHealthCost = 100,
--         maxCycles = 100,
--         repairBrokenCost = 700,
--         upgrades = {
--             autoClick = {
--                 name = "Авт.клікер",
--                 stats = { 1, 2, 3, 4, 5 },
--                 prices = { 470, 555, 625, 750 },
--             },
--             clickPower = {
--                 name = "Сила Кліка",
--                 stats = { 15, 17, 19, 21 },
--                 prices = { 450, 675, 800 },
--             },
--             cooling = {
--                 name = "Охолодження",
--                 stats = { 2, 3, 4, 5 },
--                 prices = { 450, 575, 725 },
--             },
--             storage = {
--                 name = "Об'єм",
--                 stats = { 1, 2.5, 4, 6 },
--                 prices = { 450, 575, 625 },
--             },
--         },

--         enableHeat = true,
--         heatPerClick = 20,

--         colorPrimary = Color(150, 150, 150),
--         colorSecondary = Color(150, 150, 150),
--         colorText = Color(255, 255, 255),
--         colorHealth = Color(255, 255, 255),
--     },
-- })

-- rp.AddEntites('Срібний Клікер',{
--     Desc = [[Друкує гроші]],
--     Model = "models/props_c17/consolebox01a.mdl",
--     ENT = "money_clicker",
--     Command = "buymoneyclickersilver",
--      allowed = {TEAM_DRUG,TEAM_GANG,TEAM_GANGVIP,TEAM_THIEFF,TEAM_THIEFF_VIP,TEAM_KILL,TEAM_BANK,TEAM_GLCRIME,TEAM_NAIM,TEAM_ADMI3N},
--     Max = 1,
--     Price = 17000,
--     Inventory = false, 
--  mClickerInfo = {
--         pointsPerCycle = 35,
--         moneyPerCycle = 65,
--         maxPoints = 40000,
--         maxMoney = 100000,
--         health = 100,
--         indestructible = false,
--         repairHealthCost = 100,
--         maxCycles = 100,
--         repairBrokenCost = 900,

--         upgrades = {
--             autoClick = {
--                 name = "Авт.Клікер",
--                 stats = { 2, 3, 4, 5, 6 },
--                 prices = { 450, 565, 755, 870 },
--             },
--             clickPower = {
--                 name = "Сила Кліка",
--                 stats = { 20, 22, 24, 26 },
--                 prices = { 450, 665, 875 },
--             },
--             cooling = {
--                 name = "Охолодження",
--                 stats = { 3, 4, 5, 26 },
--                 prices = { 460, 625, 875 },
--             },
--             storage = {
--                 name = "Об'єм",
--                 stats = { 1, 3, 5, 20 },
--                 prices = { 1000, 1500, 5000 },
--             },
--         },

--         enableHeat = true,
--         heatPerClick = 20,

--         colorPrimary = Color(0, 220, 160),
--         colorSecondary = Color(0, 220, 160),
--         colorText = Color(255, 255, 255),
--         colorHealth = Color(255, 255, 255),
--     },
-- })

-- rp.AddEntites('Смарагдовий Клікер',{
--     Desc = [[Друкує гроші]],
--     Model = "models/props_c17/consolebox01a.mdl",
--     ENT = "money_clicker",
--     Command = "buyklickerizy",
--      allowed = {TEAM_DRUG,TEAM_GANG,TEAM_GANGVIP,TEAM_THIEFF,TEAM_THIEFF_VIP,TEAM_KILL,TEAM_BANK,TEAM_GLCRIME,TEAM_NAIM,TEAM_ADMI3N},
--     Max = 1,
--     Price = 25000,
--     Inventory = false, 
--  mClickerInfo = {
--         pointsPerCycle = 55,
--         moneyPerCycle = 75,
--         maxPoints = 70000,
--         maxMoney = 100000,
--         health = 100,
--         indestructible = false,
--         repairHealthCost = 100,
--         maxCycles = 100,
--         repairBrokenCost = 900,

--         upgrades = {
--             autoClick = {
--                 name = "Авт.Клікер",
--                 stats = { 2, 3, 4, 5, 6 },
--                 prices = { 450, 565, 755, 870 },
--             },
--             clickPower = {
--                 name = "Сила Кліка",
--                 stats = { 20, 22, 24, 26 },
--                 prices = { 450, 665, 875 },
--             },
--             cooling = {
--                 name = "Охолодження",
--                 stats = { 3, 4, 5, 26 },
--                 prices = { 460, 625, 875 },
--             },
--             storage = {
--                 name = "Об'єм",
--                 stats = { 1, 3, 5, 20 },
--                 prices = { 450, 525, 775 },
--             },
--         },

--         enableHeat = true,
--         heatPerClick = 20,

--         colorPrimary = Color(0, 165, 120),
--         colorSecondary = Color(0, 165, 120),
--         colorText = Color(255, 255, 255),
--         colorHealth = Color(255, 255, 255),
--     },
-- })

-- rp.AddEntites('Рубіновий клікер [VIP]',{
--     Desc = [[Друкує гроші]],
--     Model = "models/props_c17/consolebox01a.mdl",
--     ENT = "money_clicker",
--     Command = "buymoneyclickergold",
--      allowed = {TEAM_DRUG,TEAM_GANG,TEAM_GANGVIP,TEAM_THIEFF,TEAM_THIEFF_VIP,TEAM_KILL,TEAM_BANK,TEAM_GLCRIME,TEAM_NAIM,TEAM_ADMI3N},
--     Max = 2,
--     vip = true,
--     Price = 2750000,
--     Inventory = false, 
--     mClickerInfo = {
--         pointsPerCycle = 40,
--         moneyPerCycle = 700,
--         maxPoints = 70000,
--         maxMoney = 200000,
--         health = 250,
--         indestructible = false,
--         repairHealthCost = 50000,
--         maxCycles = 300,
--         repairBrokenCost = 50000,

--         upgrades = {
--             autoClick = {
--                 name = "Авт.Клікер",
--                 stats = { 2, 3, 4, 5, 6 },
--                 prices = { 450 * 4, 565 * 4, 755 * 4, 870 * 4 },
--             },
--             clickPower = {
--                 name = "Сила Кліка",
--                 stats = { 20, 22, 24, 26 },
--                 prices = { 450 * 4, 665 * 4, 875 * 4 },
--             },
--             cooling = {
--                 name = "Охолодження",
--                 stats = { 3, 4, 5, 26 },
--                 prices = { 460 * 4, 625 * 4, 875 * 4 },
--             },
--             storage = {
--                 name = "Об'єм",
--                 stats = { 1, 3, 5, 20 },
--                 prices = { 450 * 4, 525 * 4, 775 * 4 },
--             },
--         },

--         enableHeat = true,
--         heatPerClick = 20,

--         colorPrimary = Color(210, 0, 50),
--         colorSecondary = Color(210, 0, 50),
--         colorText = Color(255, 255, 255),
--         colorHealth = Color(255, 255, 255),
--     },
-- })

rp.AddEntites('Ферма тварин',{
    Desc = [[]],
    Model = "models/props_lab/kennel_physics.mdl",
    ENT = "ba_cage",
    Command = "buybacage",
    Max = 6,
    Price = 2000,
    Inventory = true, 
    allowed = {TEAM_BA_OWNER},
    category = "Ферма"
})
rp.AddEntites('Корм низької якості',{
    Desc = [[]],
    Model = "models/props_junk/cardboard_box002a.mdl",
    ENT = "ba_lowquality_meals",
    Command = "buylqmeals",
    Max = 1,
    Price = 1300,
    Inventory = true, 
    allowed = {TEAM_BA_OWNER},
    category = "Ферма"
})

rp.AddEntites('Корм середньої якості',{
    Desc = [[]],
    Model = "models/props_junk/cardboard_box002a.mdl",
    ENT = "ba_medquality_meals",
    Command = "buymqmeals",
    Max = 1,
    Price = 1600,
    Inventory = true, 
    allowed = {TEAM_BA_OWNER},
    category = "Ферма"
})

rp.AddEntites('Корм найвищої якості',{
    Desc = [[]],
    Model = "models/props_junk/cardboard_box002a.mdl",
    ENT = "ba_topquality_meals",
    Command = "buytqmeals",
    Max = 1,
    Price = 2400,
    Inventory = true, 
    allowed = {TEAM_BA_OWNER},
    category = "Ферма"
})
 
rp.AddEntites("Набої для Револьвера", { 
    ENT = "m9k_ammo_357", 
    Model = "models/Items/357ammo.mdl", 
    Price = 500, 
    Max = 8, 
    Desc = [[Набої]], 
    Command = "m9k_ammo_357_buy", 
    Inventory = true,    
})

rp.AddEntites("Набої для Автомату", { 
    ENT = "m9k_ammo_ar2", 
    Model = "models/Items/BoxMRounds.mdl", 
    Price = 2250, 
    Max = 8, 
    Desc = [[Набої]], 
    Command = "m9k_ammo_ar2_buy", 
    Inventory = true,    
})
rp.AddEntites("Набої для Пістолета-Пулімета", { 
    ENT = "m9k_ammo_smg", 
    Model = "models/Items/BoxSRounds.mdl", 
    Price = 850, 
    Max = 8, 
    Desc = [[Набої]], 
    Command = "m9k_ammo_smg_buy", 
    Inventory = true,    
})
rp.AddEntites("Набої для Дробовика", { 
    ENT = "m9k_ammo_buckshot", 
    Model = "models/Items/BoxBuckshot.mdl", 
    Price = 650, 
    Max = 8, 
    Desc = [[Набої]], 
    Command = "m9k_ammo_buckshot_buy", 
    Inventory = true,    
})
rp.AddEntites("Набої для пістолетів", { 
    ENT = "m9k_ammo_pistol", 
    Model = "models/Items/BoxSRounds.mdl", 
    Price = 550, 
    Max = 8, 
    Desc = [[Набої]], 
    Command = "m9k_ammo_pistol_buy", 
    Inventory = true,    
})
rp.AddEntites("Набої для Снайперки", { 
    ENT = "m9k_ammo_winchester", 
    Model = "models/Items/sniper_round_box.mdl", 
    Price = 3500, 
    Max = 8, 
    Desc = [[Набої]], 
    Command = "m9k_ammo_winchester_buy", 
    Inventory = true,    
})
---
rp.AddEntites("Батарейка", {
    ENT = "uweed_battery",
    Desc = [[]],
    Model = "models/base/battery.mdl",
    Price = 7500,
    Max = 4,
    Command = "uweed_battery",
    allowed = {TEAM_GROVER},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Папір", {
    ENT = "uweed_frontwoods",
    Desc = [[]],
    Model = "models/base/frontwoods.mdl",
    Price = 2500,
    Max = 1,
    Command = "uweed_frontwoods",
    allowed = {TEAM_GROVER},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Велика лампа", {
    ENT = "uweed_light_big",
    Desc = [[]],
    Model = "models/base/lamp2.mdl",
    Price = 42500,
    Max = 3,
    Command = "uweed_light_big",
    allowed = {TEAM_GROVER},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Лампа", {
    ENT = "uweed_light",
    Desc = [[]],
    Model = "models/base/lamp1.mdl",
    Price = 13500,
    Max = 3,
    Command = "uweed_light",
    allowed = {TEAM_GROVER},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Горщик", {
    ENT = "uweed_plant",
    Desc = [[]],
    Model = "models/base/weedplant.mdl",
    Price = 15000,
    Max = 9,
    Command = "uweed_plant",
    allowed = {TEAM_GROVER},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Ваги", {
    ENT = "uweed_scale",
    Desc = [[]],
    Model = "models/base/scale.mdl",
    Price = 25600,
    Max = 1,
    Command = "uweed_scale",
    allowed = {TEAM_GROVER},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Зерна", {
    ENT = "uweed_seed_box",
    Desc = [[]],
    Model = "models/base/weedbox.mdl",
    Price = 19000,
    Max = 1,
    Command = "uweed_seed_box",
    allowed = {TEAM_GROVER},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Пакет", {
    ENT = "uweed_bag",
    Desc = [[]],
    Model = "models/base/weedbag.mdl",
    Price = 8500,
    Max = 1,
    Command = "uweed_bag",
    allowed = {TEAM_GROVER},
    Inventory = false,
    Desc = "",
})

--
-- Doctor
--
rp.AddEntites("Путівник", {
    ENT = "bp_guide_book",
    Model = "models/blues_pharm/book.mdl",
    Price = 250,
    Max = 1,
    Command = "bp_guide_book",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

--Six is the max amount in a single freezer, so match this to the number of freezers allowed
rp.AddEntites("Стакан", {
    ENT = "bp_beaker",
    Model = "models/blues_pharm/beaker.mdl",
    Price = 1500,
    Max = 6,
    Command = "bp_beaker",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Пальник Бунзена", {
    ENT = "bp_bunsen_burner",
    Model = "models/blues_pharm/bunsen_burner.mdl",
    Price = 7000,
    Max = 4,
    Command = "bp_bunsen_burner",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Морозильна камера", {
    ENT = "bp_freezer",
    Model = "models/blues_pharm/freezer.mdl",
    Price = 30000,
    Max = 1,
    Command = "bp_freezer",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Прес для таблеток", {
    ENT = "bp_pill_press",
    Model = "models/blues_pharm/pill_presser.mdl",
    Price = 12000,
    Max = 2,
    Command = "bp_pill_press",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

--Chemicals below
rp.AddEntites("Кето кислота", {
    ENT = "bp_chemical_keto_acid",
    Model = "models/blues_pharm/jar_1.mdl",
    Price = 950,
    Max = 2,
    Command = "bp_chemical_keto_acid",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Пропіонова кислота", {
    ENT = "bp_chemical_prop_acid",
    Model = "models/blues_pharm/jar_2.mdl",
    Price = 950,
    Max = 2,
    Command = "bp_chemical_prop_acid",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Саліцилова кислота", {
    ENT = "bp_chemical_sali_acid",
    Model = "models/blues_pharm/jar_2.mdl",
    Price = 800,
    Max = 2,
    Command = "bp_chemical_sali_acid",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Метилтестостерон", {
    ENT = "bp_chemical_17alph",
    Model = "models/blues_pharm/jar_3.mdl",
    Price = 3000,
    Max = 2,
    Command = "bp_chemical_17alph",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("2-нафтол", {
    ENT = "bp_chemical_2nap",
    Model = "models/blues_pharm/jar_3.mdl",
    Price = 2250,
    Max = 2,
    Command = "bp_chemical_2nap",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Прогестерон", {
    ENT = "bp_chemical_prog",
    Model = "models/blues_pharm/jar_3.mdl",
    Price = 4000,
    Max = 2,
    Command = "bp_chemical_prog",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Aцетон", {
    ENT = "bp_chemical_acet2",
    Model = "models/blues_pharm/jar_3.mdl",
    Price = 950,
    Max = 2,
    Command = "bp_chemical_acet2",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Оцтовий ангідрид", {
    ENT = "bp_chemical_acet",
    Model = "models/blues_pharm/jar_4.mdl",
    Price = 1400,
    Max = 2,
    Command = "bp_chemical_acet",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Діоксид селену", {
    ENT = "bp_chemical_sele",
    Model = "models/blues_pharm/jar_4.mdl",
    Price = 2800,
    Max = 2,
    Command = "bp_chemical_sele",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

rp.AddEntites("Деіонізована вода", {
    ENT = "bp_chemical_deio",
    Model = "models/blues_pharm/jar_5.mdl",
    Price = 3500,
    Max = 2,
    Command = "bp_chemical_deio",
    allowed = {TEAM_MEDIC},
    Inventory = false,
    Desc = "",
})

hook.Run('LoadingEnts')
--PATH gamemodes/darkrp/gamemode/modules/info/cl_info.lua:
local function menu()
	local frame = vgui.Create( 'onyx.Frame' )
	frame:SetSize( 400, 36 )
	frame:SetTitle( 'Обов\'язковий' )
	frame:Center()
	frame:MakePopup()
	local tall = 36
	--
	for k, v in pairs( rp.Setting.Links ) do
		local button = vgui.Create( 'onyx.Button', frame )
		button:SetText( k )
		button:Dock( TOP )
		button:SetTall( 35 )
		button:DockMargin( 5, 5, 5, 0 )
		button.DoClick = function() gui.OpenURL( v ) end
		tall = tall + 35 + 5
	end

	tall = tall + 5
	frame:SetTall( tall )
end

hook.Add( 'InitPostEntity', 'LinkSpawn', menu )
concommand.Add( 'ukrp_info', menu )
--PATH addons/__main/lua/weapons/47_ethereal/shared.lua:
-- Variables that are used on both client and server
SWEP.Gun = ("ethereal_47") -- must be the name of your swep but NO CAPITALS!
SWEP.Category				= "CSO/CF Weapons" --Category where you will find your weapons
SWEP.Author				= "Zekeou"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.PrintName				= "SF Ethereal"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 3			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox		= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   	= false		-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight					= 30		-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "ar2"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg makes for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_rif_ethe.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_rif_ak47.mdl"	-- Weapon world model
SWEP.ShowWorldModel			= false
SWEP.Base				= "zekeou_gun_base" --the Base this weapon will work on. PLEASE RENAME THE BASE! 
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("weapons/E_Blaster/SF Ethereal Fire.wav")		-- Script that calls the primary fire sound
SWEP.Primary.SilencedSound 	= Sound("")		-- Sound if the weapon is silenced
SWEP.Primary.RPM			= 700			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.4		-- Maximum up recoil (rise)
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

SWEP.Primary.Damage		= 22	-- Base damage per bullet
SWEP.Primary.Spread		= .03	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .01 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(6.84, 0, -0.681)
SWEP.IronSightsAng = Vector(4.684, 4.684, 0)
SWEP.SightsPos = Vector(6.84, 0, -0.681)
SWEP.SightsAng = Vector(4.684, 4.684, 0)
SWEP.RunSightsPos = Vector(0,0,0)	--These are for the angles your viewmodel will be when running
SWEP.RunSightsAng = Vector(0,0,0)	--Again, use the Swep Construction Kit

SWEP.WElements = {
	["Ethereal_Blaster"] = { type = "Model", model = "models/weapons/w_rif_ethe.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.217, 0.643, 0.642), angle = Angle(-16.385, -0.57, 180), size = Vector(0.76, 0.76, 0.76), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

--PATH addons/_ballistic_shields/lua/bs_config.lua:
include( "ballistic_shields/sh_bs_util.lua" )
--------------------- BALLISTIC SHIELDS V1.1.9 -------------------------
---- CONFIG ----
-- AVALAIBLE LANGUAGES - English, German, French, Danish, Turkish, Ukrainian
bshields.config.language = "Ukrainian"
-- DISABLE HUD
bshields.config.disablehud = false
-- MINIMUM RIOT SHIELD DAMAGE
bshields.config.rshielddmgmin = 10
-- MAXIMUM RIOT SHIELD DAMAGE
bshields.config.rshielddmgmax = 10
-- HEAVY SHIELD EXPLOSION DAMAGE REDUCITON (IN %)
bshields.config.hshieldexpl = 50
-- HEAVY SHIELD MELEE DAMAGE REDUCTION (IN %)
bshields.config.hshieldmelee = 20
-- RIOT SHIELD MELEE DAMAGE REDUCTION (IN %)
bshields.config.rshieldmelee = 60
-- HEAVY SHIELD BREACH COOLDOWN (IN SECONDS)
bshields.config.hshieldcd = 20
-- DOOR RESPAWN TIMER (IN SECONDS)
bshields.config.doorrespawn = 30
-- MAXIMUM AMOUNT OF DEPLOYED SHIELDS
bshields.config.maxshields = 1
-- SHOULD FADING DOORS BE BREACHABLE?
bshields.config.breachfdoors = true
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
--PATH addons/__advdupe2/lua/weapons/gmod_tool/stools/advdupe2.lua:
--[[
	Title: Adv. Dupe 2 Tool

	Desc: Defines the AD2 tool and assorted functionalities.

	Author: TB

	Version: 1.0
]]

TOOL.Category = "Constraints"
TOOL.Name = "#Tool.advdupe2.name"
cleanup.Register( "AdvDupe2" )
require( "controlpanel" )

if(SERVER) then
	CreateConVar("sbox_maxgmod_contr_spawners",5)

	local phys_constraint_system_types = {
		Weld          = true,
		Rope          = true,
		Elastic       = true,
		Slider        = true,
		Axis          = true,
		AdvBallsocket = true,
		Motor         = true,
		Pulley        = true,
		Ballsocket    = true,
		Winch         = true,
		Hydraulic     = true,
		WireMotor     = true,
		WireHydraulic = true
	}
	--Orders constraints so that the dupe uses as little constraint systems as possible
	local function GroupConstraintOrder( ply, constraints )
		--First separate the nocollides, sorted, and unsorted constraints
		local sorted, unsorted = {}, {}
		for k, v in pairs(constraints) do
			if phys_constraint_system_types[v.Type] then
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
											if #system == 100 then
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
		for i = 1, #ret do
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

	-- Code from WireLib.CanTool
	local zero = Vector(0, 0, 0)
	local norm = Vector(1, 0, 0)

	local tr = { ---@type TraceResult
		Hit = true, HitNonWorld = true, HitNoDraw = false, HitSky = false, AllSolid = true,
		HitNormal = zero, Normal = norm,

		Fraction = 1, FractionLeftSolid = 0,
		HitBox = 0, HitGroup = 0, HitTexture = "**studio**",
		MatType = 0, PhysicsBone = 0, SurfaceProps = 0, DispFlags = 0, Contents = 0,

		Entity = NULL, HitPos = zero, StartPos = zero,
	}

	local function PlayerCanDupeTool(ply, ent)
		if not AdvDupe2.duplicator.IsCopyable(ent) or areacopy_classblacklist[ent:GetClass()] then return false end

		local pos = ent:GetPos()
		tr.Entity, tr.HitPos, tr.StartPos = ent, pos, pos

		return hook.Run( "CanTool", ply, tr, "advdupe2" ) ~= false
	end

	--Find all the entities in a box, given the adjacent corners and the player
	local function FindInBox(min, max, ply)
		local PPCheck = (tobool(ply:GetInfo("advdupe2_copy_only_mine")) and ply.CPPIGetOwner~=nil) and PlayerCanDupeCPPI or PlayerCanDupeTool
		local EntTable = {}
		for _, ent in ents.Iterator() do
			local pos = ent:GetPos()
			if (pos.X>=min.X) and (pos.X<=max.X) and
				 (pos.Y>=min.Y) and (pos.Y<=max.Y) and
				 (pos.Z>=min.Z) and (pos.Z<=max.Z) and PPCheck( ply, ent ) then
				EntTable[ent:EntIndex()] = ent
			end
		end

		return EntTable
	end

	--[[
		Name: GetDupeAngleOffset
		Desc: Retrieves duplication angle offsets from player
		Returns: <angle> Created angle
	]]
	local function GetDupeAngleOffset(ply)
		local p = math.Clamp(ply:GetInfoNum("advdupe2_offset_pitch", 0), -180, 180)
		local y = math.Clamp(ply:GetInfoNum("advdupe2_offset_yaw"  , 0), -180, 180)
		local r = math.Clamp(ply:GetInfoNum("advdupe2_offset_roll" , 0), -180, 180)
		return Angle(p, y, r)
	end

	--[[
		Name: GetDupeElevation
		Desc: Retrieves duplication Z elevation
		Returns: <number> Dupe elevation
	]]
	local function GetDupeElevation(ply)
		local con = ply:GetInfoNum("advdupe2_offset_z", 0)
		local enz = (tonumber(ply.AdvDupe2.HeadEnt.Z) or 0)
		return math.Clamp(con + enz, -32000, 32000)
	end

	--[[
		Name: LeftClick
		Desc: Defines the tool's behavior when the player left-clicks.
		Params: <trace> trace
		Returns: <boolean> success
	]]
	local messages = {
		["Pasting"] = "pasting.",
		["Downloading"] = "downloading.",
		["Uploading"] = "uploading."
	}
	function TOOL:LeftClick( trace )
		if(not trace) then return false end

		local ply = self:GetOwner()
		if not ply:IsVIP() then ply:ChatPrint('Только VIP игроки могут использовать Adv2') return false end 
		local dupe = ply.AdvDupe2

		if not (dupe and dupe.Entities) then return false end

		for key, msg in pairs(messages) do
			if dupe[key] then
				AdvDupe2.Notify(ply, "Advanced Duplicator 2 is busy " .. msg, NOTIFY_ERROR)
				return false
			end
		end

		dupe.Angle = GetDupeAngleOffset(ply)
		dupe.Position = Vector(trace.HitPos)
		dupe.Position.z = dupe.Position.z + GetDupeElevation(ply)

		if(tobool(ply:GetInfo("advdupe2_offset_world"))) then
			dupe.Angle = dupe.Angle - dupe.Entities[dupe.HeadEnt.Index].PhysicsObjects[0].Angle
		end

		dupe.Pasting = true
		AdvDupe2.Notify(ply,"Pasting...")
		local origin
		if(tobool(ply:GetInfo("advdupe2_original_origin"))) then
			origin = dupe.HeadEnt.Pos
		end

		AdvDupe2.InitPastingQueue(ply, dupe.Position, dupe.Angle, origin,
			tobool(ply:GetInfo("advdupe2_paste_constraints")),
			tobool(ply:GetInfo("advdupe2_paste_parents")),
			tobool(ply:GetInfo("advdupe2_paste_disparents")),
			tobool(ply:GetInfo("advdupe2_paste_protectoveride")))

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
		if not ply:IsVIP() then ply:ChatPrint('Только VIP игроки могут использовать Adv2') return false end 
		local dupe = ply.AdvDupe2

		if not dupe then dupe = {}; ply.AdvDupe2 = dupe end

		if(dupe.Pasting or dupe.Downloading) then
			AdvDupe2.Notify(ply,"Advanced Duplicator 2 is busy.", NOTIFY_ERROR)
			return false
		end

		--Set Area Copy on or off
		if( ply:KeyDown(IN_SPEED) and not ply:KeyDown(IN_WALK) ) then
			if(self:GetStage()==0) then
				AdvDupe2.DrawSelectBox(ply)
				self:SetStage(1)
				return false
			elseif(self:GetStage()==1) then
				AdvDupe2.RemoveSelectBox(ply)
				self:SetStage(0)
				return false
			end
		end

		if(not trace or not trace.Hit) then return false end

		local Entities, Constraints, AddOne
		local HeadEnt = {}
		--If area copy is on
		if(self:GetStage()==1) then
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

			Entities, Constraints = AdvDupe2.duplicator.AreaCopy(ply, Ents, HeadEnt.Pos, tobool(ply:GetInfo("advdupe2_copy_outside")))

			self:SetStage(0)
			AdvDupe2.RemoveSelectBox(ply)
		elseif trace.HitNonWorld then	--Area Copy is off
			-- Filter duplicator blocked entities out.
			if not AdvDupe2.duplicator.IsCopyable( trace.Entity ) then
				return false
			end

			--If Alt is being held, add a prop to the dupe
			if(ply:KeyDown(IN_WALK) and dupe.Entities~=nil and next(dupe.Entities)~=nil) then
				Entities = dupe.Entities
				Constraints = dupe.Constraints
				HeadEnt = dupe.HeadEnt

				AdvDupe2.duplicator.Copy( ply, trace.Entity, Entities, Constraints, HeadEnt.Pos)

				--Only add the one ghost
				AddOne = Entities[trace.Entity:EntIndex()]
			else
				Entities = {}
				Constraints = {}
				HeadEnt.Index = trace.Entity:EntIndex()
				HeadEnt.Pos = trace.HitPos

				AdvDupe2.duplicator.Copy( ply, trace.Entity, Entities, Constraints, trace.HitPos )
			end
		else --Non valid entity or clicked the world
			if dupe.Entities then
				--clear the dupe
				net.Start("AdvDupe2_RemoveGhosts")
				net.Send(ply)
				dupe.Entities = nil
				dupe.Constraints = nil
				net.Start("AdvDupe2_ResetDupeInfo")
				net.Send(ply)
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
				net.Start("AdvDupe2_RemoveGhosts")
				net.Send(ply)
					return true
				end

				HeadEnt.Index = Ent:EntIndex()
				HeadEnt.Pos = Ent:GetPos()

				Entities, Constraints = AdvDupe2.duplicator.AreaCopy(ply, Entities, HeadEnt.Pos, tobool(ply:GetInfo("advdupe2_copy_outside")))
			end
		end

		if not HeadEnt.Z then
			local WorldTrace = util.TraceLine({
				mask   = MASK_NPCWORLDSTATIC,
				start  = HeadEnt.Pos + Vector(0,0,1),
				endpos = HeadEnt.Pos-Vector(0,0,50000)
			})

			HeadEnt.Z = WorldTrace.Hit and math.abs(HeadEnt.Pos.Z - WorldTrace.HitPos.Z) or 0
		end

		dupe.HeadEnt = HeadEnt
		dupe.Entities = Entities
		dupe.Constraints = GetSortedConstraints(ply, Constraints)
		dupe.Revision = AdvDupe2.CodecRevision

		net.Start("AdvDupe2_SetDupeInfo")
			net.WriteString("")
			net.WriteString(ply:Nick())
			net.WriteString(os.date("%d %B %Y"))
			net.WriteString(os.date("%I:%M %p"))
			net.WriteString("")
			net.WriteString("")
			net.WriteString(table.Count(dupe.Entities))
			net.WriteString(#dupe.Constraints)
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
		local dupe = ply.AdvDupe2

		if not dupe then dupe = {}; ply.AdvDupe2 = dupe end

		if(not dupe.Entities) then return end

		net.Start("AdvDupe2_StartGhosting")
		net.Send(ply)

		if(dupe.Queued) then
			AdvDupe2.InitProgressBar(ply, "Queued: ")
			return
		end

		if(dupe.Pasting) then
			AdvDupe2.InitProgressBar(ply, "Pasting: ")
			return
		else
			if(dupe.Uploading) then
				AdvDupe2.InitProgressBar(ply, "Uploading: ")
				return
			elseif(dupe.Downloading) then
				AdvDupe2.InitProgressBar(ply, "Saving: ")
				return
			end
		end

	end

	--Removes progress bar
	function TOOL:Holster()
		AdvDupe2.RemoveProgressBar(self:GetOwner())
	end

	--Called to clean up the tool when pasting is finished or undo during pasting
	function AdvDupe2.FinishPasting(Player, Paste)
		Player.AdvDupe2.Pasting=false
		AdvDupe2.RemoveProgressBar(Player)
		if(Paste) then AdvDupe2.Notify(Player,"Finished Pasting!") end
	end

	--function for creating a contraption spawner
	function MakeContraptionSpawner( ply, Pos, Ang, HeadEnt, EntityTable, ConstraintTable, delay, undo_delay, model, key, undo_key, disgrav, disdrag, addvel, hideprops)

		if not ply:CheckLimit("gmod_contr_spawners") then return nil end

		if(not game.SinglePlayer()) then
			if(table.Count(EntityTable)>tonumber(GetConVarString("AdvDupe2_MaxContraptionEntities"))) then
				AdvDupe2.Notify(ply,"Contraption Spawner exceeds the maximum amount of "..GetConVarString("AdvDupe2_MaxContraptionEntities").." entities for a spawner!",NOTIFY_ERROR)
				return false
			end
			if(#ConstraintTable>tonumber(GetConVarString("AdvDupe2_MaxContraptionConstraints"))) then
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
		spawner:SetCreator(ply)
		spawner:Spawn()

		duplicator.ApplyEntityModifiers(ply, spawner)

		if IsValid(spawner:GetPhysicsObject()) then
			spawner:GetPhysicsObject():EnableMotion(false)
		end

		local min
		local max
		if(not delay) then
			delay = tonumber(GetConVarString("AdvDupe2_MinContraptionSpawnDelay")) or 0.2
		else
			if(not game.SinglePlayer()) then
				min = tonumber(GetConVarString("AdvDupe2_MinContraptionSpawnDelay")) or 0.2
				if (delay < min) then
					delay = min
				end
			elseif(delay<0) then
				delay = 0
			end
		end

		if(not undo_delay) then
			undo_delay = tonumber(GetConVarString("AdvDupe2_MinContraptionUndoDelay"))
		else
			if(not game.SinglePlayer()) then
				min = tonumber(GetConVarString("AdvDupe2_MinContraptionUndoDelay")) or 0.1
				max = tonumber(GetConVarString("AdvDupe2_MaxContraptionUndoDelay")) or 60
				if(undo_delay < min) then
					undo_delay = min
				elseif(undo_delay > max) then
					undo_delay = max
				end
			elseif(undo_delay < 0) then
				undo_delay = 0
			end
		end

		-- Set options
		spawner:SetPlayer(ply)
		spawner:GetTable():SetOptions(ply, delay, undo_delay, key, undo_key, disgrav, disdrag, addvel, hideprops)

		local tbl = {
			ply        = ply,
			delay      = delay,
			undo_delay = undo_delay,
			disgrav    = disgrav,
			disdrag    = disdrag,
			addvel     = addvel,
			hideprops  = hideprops
		}
		table.Merge(spawner:GetTable(), tbl)
		spawner:SetDupeInfo(HeadEnt, EntityTable, ConstraintTable)
		spawner:AddGhosts(ply)

		ply:AddCount("gmod_contr_spawners", spawner)
		ply:AddCleanup("gmod_contr_spawner", spawner)
		return spawner
	end

	duplicator.RegisterEntityClass("gmod_contr_spawner", MakeContraptionSpawner,
		"Pos", "Ang", "HeadEnt", "EntityTable", "ConstraintTable", "delay",
		"undo_delay", "model", "key", "undo_key", "disgrav", "disdrag", "addvel", "hideprops")

	function AdvDupe2.InitProgressBar(ply,label)
		net.Start("AdvDupe2_InitProgressBar")
			net.WriteString(label)
		net.Send(ply)
	end

	function AdvDupe2.DrawSelectBox(ply)
		net.Start("AdvDupe2_DrawSelectBox")
		net.Send(ply)
	end

	function AdvDupe2.RemoveSelectBox(ply)
		net.Start("AdvDupe2_RemoveSelectBox")
		net.Send(ply)
	end

	function AdvDupe2.UpdateProgressBar(ply,percent)
		net.Start("AdvDupe2_UpdateProgressBar")
			net.WriteFloat(percent)
		net.Send(ply)
	end

	function AdvDupe2.RemoveProgressBar(ply)
		net.Start("AdvDupe2_RemoveProgressBar")
		net.Send(ply)
	end

	--Reset the offsets of height, pitch, yaw, and roll back to default
	function AdvDupe2.ResetOffsets(ply, keep)

		if(not keep) then
			ply.AdvDupe2.Name = nil
		end
		net.Start("AdvDupe2_ResetOffsets")
		net.Send(ply)
	end

	concommand.Add("AdvDupe2_SetStage", function(ply, cmd, args)
		ply:GetTool("advdupe2"):SetStage(1)
	end)
end

if(CLIENT) then

	function TOOL:LeftClick(trace)
		if(trace and AdvDupe2.HeadGhost) then
			return true
		end
		return false
	end

	function TOOL:RightClick(trace)
		if( self:GetOwner():KeyDown(IN_SPEED) and not self:GetOwner():KeyDown(IN_WALK) ) then
			return false
		end
		return true
	end

	--Removes progress bar and removes ghosts when tool is put away
	function TOOL:ReleaseGhostEntity()
		AdvDupe2.RemoveGhosts()
		AdvDupe2.RemoveSelectBox()
		if(AdvDupe2.Rotation) then
			hook.Remove("PlayerBindPress", "AdvDupe2_BindPress")
			hook.Remove("CreateMove", "AdvDupe2_MouseControl")
		end
		return
	end

	function TOOL:Reload( trace )
		if(trace and (AdvDupe2.HeadGhost or self:GetStage() == 1)) then
			return true
		end
		return false
	end

	--Take control of the mouse wheel bind so the player can modify the height of the dupe
	local function MouseWheelScrolled(ply, bind, pressed)

		if IsValid(ply) and ply.GetTool then
			if(bind == "invprev") then
				if(ply:GetTool("advdupe2"):GetStage() == 1) then
					local size = math.min(tonumber(ply:GetInfo("advdupe2_area_copy_size")) + 25, 30720)
					RunConsoleCommand("advdupe2_area_copy_size",size)
				else
					local Z = tonumber(ply:GetInfo("advdupe2_offset_z")) + 5
					RunConsoleCommand("advdupe2_offset_z",Z)
				end
				return true
			elseif(bind == "invnext") then
				if(ply:GetTool("advdupe2"):GetStage() == 1) then
					local size = math.max(tonumber(ply:GetInfo("advdupe2_area_copy_size")) - 25, 25)
					RunConsoleCommand("advdupe2_area_copy_size",size)
				else
					local Z = tonumber(ply:GetInfo("advdupe2_offset_z")) - 5
					RunConsoleCommand("advdupe2_offset_z",Z)
				end
				return true
			end
		end

		GAMEMODE:PlayerBindPress(ply, bind, pressed)
	end

	local YawTo = 0
	local BsAng = Angle()

	local function GetRotationSign(ply)
		local VY = tonumber(ply:GetInfo("advdupe2_offset_yaw")) or 0
		BsAng:Zero(); BsAng:RotateAroundAxis(BsAng:Up(), VY)
		local PR = ply:GetRight()
		local DP = BsAng:Right():Dot(PR)
		local DR = BsAng:Forward():Dot(PR)
		if(math.abs(DR) > math.abs(DP)) then -- Roll priority
			if(DR >= 0) then return -1, 1 else return  1, -1 end
		else -- Pitch axis takes priority. Normal X-Y map
			if(DP >= 0) then return  1, 1 else return -1, -1 end
		end
	end

	local function MouseControl( cmd )
		local ply = LocalPlayer()
		local X =  cmd:GetMouseX() / 20
		local Y = -cmd:GetMouseY() / 20
		local ru = ply:KeyDown(IN_SPEED)
		local mm = input.IsMouseDown(MOUSE_MIDDLE)

		if(mm) then
			if(ru) then
				YawTo = 0 -- Reset total integrated yaw
				RunConsoleCommand("advdupe2_offset_pitch", 0)
				RunConsoleCommand("advdupe2_offset_yaw"  , 0)
				RunConsoleCommand("advdupe2_offset_roll" , 0)
			else
				if(Y ~= 0) then
					local VR = tonumber(ply:GetInfo("advdupe2_offset_roll"))  or 0
					local VP = tonumber(ply:GetInfo("advdupe2_offset_pitch")) or 0
					local SP, SR, P, R = GetRotationSign(ply)
					if(SP ~= SR) then
						P = math.NormalizeAngle(VP + X * SR)
						R = math.NormalizeAngle(VR + Y * SP)
					else
						P = math.NormalizeAngle(VP + Y * SP)
						R = math.NormalizeAngle(VR + X * SR)
					end
					RunConsoleCommand("advdupe2_offset_pitch", P)
					RunConsoleCommand("advdupe2_offset_roll" , R)
				end
			end
		else
			if(X ~= 0) then
				VY = tonumber(ply:GetInfo("advdupe2_offset_yaw")) or 0
				if(ru) then
					YawTo = YawTo + X -- Integrate the mouse on the X value from the mouse
					RunConsoleCommand("advdupe2_offset_yaw", math.SnapTo(math.NormalizeAngle(YawTo), 45))
				else
					YawTo = VY + X -- Update the last yaw with the current value from the mouse
					RunConsoleCommand("advdupe2_offset_yaw", math.NormalizeAngle(YawTo))
				end
			end
		end
	end

	--Checks binds to modify dupes position and angles
	function TOOL:Think()

		if AdvDupe2.HeadGhost then
			AdvDupe2.UpdateGhosts()
		end

		if(LocalPlayer():KeyDown(IN_USE)) then
			if(not AdvDupe2.Rotation) then
				hook.Add("PlayerBindPress", "AdvDupe2_BindPress", MouseWheelScrolled)
				hook.Add("CreateMove", "AdvDupe2_MouseControl", MouseControl)
				AdvDupe2.Rotation = true
			end
		else
			if(AdvDupe2.Rotation) then
				AdvDupe2.Rotation = false
				hook.Remove("PlayerBindPress", "AdvDupe2_BindPress")
				hook.Remove("CreateMove", "AdvDupe2_MouseControl")
			end
		end
	end

	--Hinder the player from looking to modify offsets with the mouse
	function TOOL:FreezeMovement()
		return AdvDupe2.Rotation
	end

	TOOL.Information = {
		{ name = "left" },
		{ name = "right", stage = 0 },
		{ name = "right_world", stage = 0, icon2 = "icon16/world.png" },
		{ name = "right_shift", stage = 0, icon2 = "gui/info" },
		{ name = "right_alt", stage = 1 },
		{ name = "reload_alt", stage = 1 },
		{ name = "right_shift_alt", stage = 1, icon2 = "gui/info" },
	}

	language.Add( "Tool.advdupe2.name",				"Advanced Duplicator 2" )
	language.Add( "Tool.advdupe2.desc",				"Duplicate things." )
	language.Add( "Tool.advdupe2.left",				"Paste" )
	language.Add( "Tool.advdupe2.right",			"Copy" )
	language.Add( "Tool.advdupe2.right_world",		"Hit the world to select/deselect all" )
	language.Add( "Tool.advdupe2.right_shift",		"Press Shift to area copy" )
	language.Add( "Tool.advdupe2.right_alt",		"Copy an area" )
	language.Add( "Tool.advdupe2.right_shift_alt",	"Press Shift to cancel" )
	language.Add( "Undone_AdvDupe2",				"Undone AdvDupe2 paste" )
	language.Add( "Cleanup_AdvDupe2",				"AdvDupe2 Duplications" )
	language.Add( "Cleaned_AdvDupe2",				"Cleaned up all AdvDupe2 Duplications" )
	language.Add( "SBoxLimit_AdvDupe2",				"You've reached the AdvDupe2 Duplicator limit!" )

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
	CreateClientConVar("advdupe2_limit_ghost", 100, false, true, nil, 0, 100)
	CreateClientConVar("advdupe2_ghost_rate", 5, true, true, nil, 1, 50)
	CreateClientConVar("advdupe2_area_copy_size", 300, false, true)

	--Experimental
	CreateClientConVar("advdupe2_paste_disparents", 0, false, true)
	CreateClientConVar("advdupe2_paste_protectoveride", 1, false, true)
	CreateClientConVar("advdupe2_debug_openfile", 1, false, true)

	local function BuildCPanel(CPanel)
		CPanel:ClearControls()

		local FileBrowser = vgui.Create("advdupe2_browser")
		CPanel:AddItem(FileBrowser)
		FileBrowser:SetSize(CPanel:GetWide(), 405)
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
			if(Check_1:GetChecked() and Check_2:GetChecked()) then
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
			if(Check_2:GetChecked() and Check_1:GetChecked()) then
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

		-- Ghost Percentage
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

		-- Ghost Rate
		NumSlider = vgui.Create( "DNumSlider" )
		NumSlider:SetText( "Ghost speed:" )
		NumSlider.Label:SetDark(true)
		NumSlider:SetMin( 1 )
		NumSlider:SetMax( 50 )
		NumSlider:SetDecimals( 0 )
		NumSlider:SetConVar( "advdupe2_ghost_rate" )
		NumSlider:SetToolTip("Change how quickly the ghosts are generated")
		CPanel:AddItem(NumSlider)

		-- Area Copy Size
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
		NumSlider:SetMin( -2500 )
		NumSlider:SetMax( 2500 )
		NumSlider:SetDefaultValue( 0 )
		NumSlider:SetDecimals( 3 )
		NumSlider:SetConVar("advdupe2_offset_z")
		NumSlider:SetToolTip("Changes the dupe Z offset")
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
		NumSlider:SetDefaultValue( 0 )
		NumSlider:SetDecimals( 3 )
		NumSlider:SetToolTip("Changes the dupe pitch offset")
		NumSlider:SetConVar("advdupe2_offset_pitch")
		CategoryContent1:AddItem(NumSlider)

		NumSlider = vgui.Create( "DNumSlider" )
		NumSlider:SetText( "Yaw Offset" )
		NumSlider.Label:SetDark(true)
		NumSlider:SetMin( -180 )
		NumSlider:SetMax( 180 )
		NumSlider:SetDefaultValue( 0 )
		NumSlider:SetDecimals( 3 )
		NumSlider:SetToolTip("Changes the dupe yaw offset")
		NumSlider:SetConVar("advdupe2_offset_yaw")
		CategoryContent1:AddItem(NumSlider)

		NumSlider = vgui.Create( "DNumSlider" )
		NumSlider:SetText( "Roll Offset" )
		NumSlider.Label:SetDark(true)
		NumSlider:SetMin( -180 )
		NumSlider:SetMax( 180 )
		NumSlider:SetDefaultValue( 0 )
		NumSlider:SetDecimals( 3 )
		NumSlider:SetToolTip("Changes the dupe roll offset")
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

	local StColor  = {r=130, g=25, b=40, a=255}
	local NoColor  = {r=25, g=100, b=40, a=255}
	local CurColor = {r=25, g=100, b=40, a=255}
	local CWhite   = Color(255,255,255,255)
	surface.CreateFont ("AD2Font", {font="Arial", size=40, weight=1000}) ---Remember to use gm_clearfonts
	surface.CreateFont ("AD2TitleFont", {font="Arial", size=24, weight=1000})

	function TOOL:DrawToolScreen()
		if(not AdvDupe2) then return true end

		local text = "Ready"
		local state, co = false
		local ply = LocalPlayer()

		if(AdvDupe2.Preview) then
			text = "Preview"
		end
		if(AdvDupe2.ProgressBar.Text) then
			state = true
			text = AdvDupe2.ProgressBar.Text
		end

		cam.Start2D()

			surface.SetDrawColor(32, 32, 32, 255)
			surface.DrawRect(0, 0, 256, 256)

			if(state) then
				co = StColor
			else
				co = NoColor
			end

			local rate = FrameTime() * 160
			CurColor.r = math.Approach( CurColor.r, co.r, rate )
			CurColor.g = math.Approach( CurColor.g, co.g, rate )

			surface.SetDrawColor(CurColor)
			surface.DrawRect(13, 13, 230, 230)

			surface.SetTextColor( 255, 255, 255, 255 )

			draw.SimpleText("Advanced Duplicator 2", "AD2TitleFont", 128, 50, CWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
			draw.SimpleText(text, "AD2Font", 128, 128, CWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			if(state) then
				draw.RoundedBox( 6, 32, 178, 192, 28, Color( 255, 255, 255, 150 ) )
				draw.RoundedBox( 6, 34, 180, 188*(AdvDupe2.ProgressBar.Percent / 100), 24, Color( 0, 255, 0, 255 ) )
			elseif(ply:KeyDown(IN_USE)) then
				local font, align = "AD2TitleFont", TEXT_ALIGN_BOTTOM
				draw.SimpleText("H: "..ply:GetInfo("advdupe2_offset_z")    , font, 20,  210, CWhite, TEXT_ALIGN_LEFT , align)
				draw.SimpleText("P: "..ply:GetInfo("advdupe2_offset_pitch"), font, 236, 210, CWhite, TEXT_ALIGN_RIGHT, align)
				draw.SimpleText("Y: "..ply:GetInfo("advdupe2_offset_yaw")  , font, 20 , 240, CWhite, TEXT_ALIGN_LEFT , align)
				draw.SimpleText("R: "..ply:GetInfo("advdupe2_offset_roll") , font, 236, 240, CWhite, TEXT_ALIGN_RIGHT, align)
			end

		cam.End2D()
	end


	local function FindInBox(min, max, ply)
		local EntTable = {}
		for _,ent in ents.Iterator() do
			local pos = ent:GetPos()
			if (pos.X>=min.X) and (pos.X<=max.X) and (pos.Y>=min.Y) and (pos.Y<=max.Y) and (pos.Z>=min.Z) and (pos.Z<=max.Z) then
				--if(ent:GetClass()~="C_BaseFlexclass") then
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
		local B1 = (Vector(-i,-i,-i) + TraceRes.HitPos)
		local B2 = (Vector(-i, i,-i) + TraceRes.HitPos)
		local B3 = (Vector( i, i,-i) + TraceRes.HitPos)
		local B4 = (Vector( i,-i,-i) + TraceRes.HitPos)

		--Top Points
		local T1 = (Vector(-i,-i, i) + TraceRes.HitPos):ToScreen()
		local T2 = (Vector(-i, i, i) + TraceRes.HitPos):ToScreen()
		local T3 = (Vector( i, i, i) + TraceRes.HitPos):ToScreen()
		local T4 = (Vector( i,-i, i) + TraceRes.HitPos):ToScreen()

		if(not AdvDupe2.LastUpdate or CurTime()>=AdvDupe2.LastUpdate) then

			if AdvDupe2.ColorEntities then
				for k,v in pairs(AdvDupe2.EntityColors)do
					local ent = AdvDupe2.ColorEntities[k]
					if(IsValid(ent)) then
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

	net.Receive("AdvDupe2_DrawSelectBox", function()
		hook.Add("HUDPaint", "AdvDupe2_DrawSelectionBox", AdvDupe2.DrawSelectionBox)
	end)

	function AdvDupe2.RemoveSelectBox()
		hook.Remove("HUDPaint", "AdvDupe2_DrawSelectionBox")
		if AdvDupe2.ColorEntities then
			for k,v in pairs(AdvDupe2.EntityColors)do
				if(not IsValid(AdvDupe2.ColorEntities[k])) then
					AdvDupe2.ColorEntities[k]=nil
				else
					AdvDupe2.ColorEntities[k]:SetColor(v)
				end
			end
			AdvDupe2.ColorEntities={}
			AdvDupe2.EntityColors={}
		end
	end
	net.Receive("AdvDupe2_RemoveSelectBox",function()
		AdvDupe2.RemoveSelectBox()
	end)

	function AdvDupe2.InitProgressBar(label)
		AdvDupe2.ProgressBar = {}
		AdvDupe2.ProgressBar.Text = label
		AdvDupe2.ProgressBar.Percent = 0
		AdvDupe2.BusyBar = true
	end
	net.Receive("AdvDupe2_InitProgressBar", function()
		AdvDupe2.InitProgressBar(net.ReadString())
	end)

	net.Receive("AdvDupe2_UpdateProgressBar", function()
		AdvDupe2.ProgressBar.Percent = net.ReadFloat()
	end)

	function AdvDupe2.RemoveProgressBar()
		AdvDupe2.ProgressBar = {}
		AdvDupe2.BusyBar = false
		if(AdvDupe2.Ghosting) then
			AdvDupe2.InitProgressBar("Ghosting: ")
			AdvDupe2.BusyBar = false
			AdvDupe2.ProgressBar.Percent = AdvDupe2.CurrentGhost/AdvDupe2.TotalGhosts*100
		end
	end
	net.Receive("AdvDupe2_RemoveProgressBar", function()
		AdvDupe2.RemoveProgressBar()
	end)

	net.Receive("AdvDupe2_ResetOffsets", function()
		RunConsoleCommand("advdupe2_original_origin", "0")
		RunConsoleCommand("advdupe2_paste_constraints","1")
		RunConsoleCommand("advdupe2_offset_z","0")
		RunConsoleCommand("advdupe2_offset_pitch","0")
		RunConsoleCommand("advdupe2_offset_yaw","0")
		RunConsoleCommand("advdupe2_offset_roll","0")
		RunConsoleCommand("advdupe2_paste_parents","1")
		RunConsoleCommand("advdupe2_paste_disparents","0")
	end)

	net.Receive("AdvDupe2_ReportModel", function()
		print("Advanced Duplicator 2: Invalid Model: "..net.ReadString())
	end)

	net.Receive("AdvDupe2_ReportClass", function()
		print("Advanced Duplicator 2: Invalid Class: "..net.ReadString())
	end)

	net.Receive("AdvDupe2_ResetDupeInfo", function()
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

--PATH addons/____bricks_gangs/lua/weapons/gmod_tool/stools/bricks_server_territory_placer.lua:
TOOL.Category = "Bricks Server"
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
	
	draw.SimpleText( language.GetPhrase( "tool.bricks_server_territory_placer.name" ), "BRICKS_SERVER_Font33", width*0.5, 30, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

	if( not BRICKS_SERVER.Func.IsSubModuleEnabled( "gangs", "territories" ) ) then return end

	local territorySelected = (BRICKS_SERVER.CONFIG.GANGS.Territories or {})[LocalPlayer():GetNW2Int( "bricks_server_tool_territorykey", 0 )]
	draw.SimpleText( BRICKS_SERVER.Func.L( "selected" ), "BRICKS_SERVER_Font33", width*0.5, 60+((height-60)*0.5)-15, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
	draw.SimpleText( ((territorySelected and (territorySelected.Name or BRICKS_SERVER.Func.L( "error" ))) or BRICKS_SERVER.Func.L( "none" )), "BRICKS_SERVER_Font25", width*0.5, 60+((height-60)*0.5)-15, BRICKS_SERVER.Func.GetTheme( 6 ), TEXT_ALIGN_CENTER, 0 )
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
--PATH gamemodes/darkrp/entities/weapons/gmod_tool/stools/camera.lua:
TOOL.Category = "Roleplay"
TOOL.Name = "#tool.camera.name"

TOOL.ClientConVar[ "locked" ] = "0"
TOOL.ClientConVar[ "key" ] = "37"
TOOL.ClientConVar[ "toggle" ] = "1"

cleanup.Register("cameras")
-- saf 
local function MakeCamera(ply, key, locked, toggle, Data)

		if ply:GetCount("cameras") >= rp.Setting.Limits["cameras"] then -- FIX
			return false
		end
		if (not ply:CheckLimit('cameras')) then
			return
		end

		local ent = ents.Create("gmod_cameraprop")

		if (!IsValid(ent)) then return end

		ply:AddCount("cameras", ent)

		duplicator.DoGeneric(ent, Data)

		if (key) then
			for id, camera in ipairs(ents.FindByClass("gmod_cameraprop")) do
				if (!camera.controlkey || camera.controlkey != key) then continue end
				if (IsValid(ply) && IsValid(camera:GetPlayer()) && ply != camera:GetPlayer()) then continue end
				camera:Remove()
			end

			ent:SetKey(key)
			ent.controlkey = key
		end

		ent:SetPlayer(ply)

		ent.toggle = toggle
		ent.locked = locked

		ent:Spawn()
		ent:CPPISetOwner(ply)

		ent:SetTracking(NULL, Vector(0))
		ent:SetLocked(locked)

		if (toggle == 1) then
			numpad.OnDown(ply, key, "Camera_Toggle", ent)
		else
			numpad.OnDown(ply, key, "Camera_On", ent)
			numpad.OnUp(ply, key, "Camera_Off", ent)
		end

		if (IsValid(ply)) then

			undo.Create("Camera")
				undo.AddEntity(ent)
				undo.SetPlayer(ply)
			undo.Finish()

			ply:AddCleanup("cameras", ent)
		end

	return ent

end
duplicator.RegisterEntityClass("gmod_cameraprop", MakeCamera, "controlkey", "locked", "toggle", "Data")

function TOOL:LeftClick(trace)

	local key = self:GetClientNumber("key")

	if (CLIENT) then return true end

	local ply = self:GetOwner()
	local locked = self:GetClientNumber("locked")
	local toggle = self:GetClientNumber("toggle")

    	local ent = MakeCamera(ply, key, locked, toggle, { Pos = trace.StartPos, Angle = ply:EyeAngles() })
		self.CameraCooldown = CurTime()


	return true, ent

end

function TOOL:RightClick(trace)

	self.CameraCooldown = self.CameraCooldown or 0
    if ( CurTime() > self.CameraCooldown + 2 ) then

		local _, camera = self:LeftClick(trace, true)
	
		if (CLIENT) then return true end
	
		if (!IsValid(camera)) then return end
	
		if (trace.Entity:IsWorld()) then
	
			trace.Entity = self:GetOwner()
			trace.HitPos = self:GetOwner():GetPos()
	
		end

    	camera:SetTracking(trace.Entity, trace.Entity:WorldToLocal(trace.HitPos))
		self.CameraCooldown = CurTime()
	end

	
	return true

end

function TOOL.BuildCPanel(CPanel)

	CPanel:AddControl("Numpad", { Label = "#tool.camera.key", Command = "camera_key" })
	CPanel:AddControl("CheckBox", { Label = "#tool.camera.static", Command = "camera_locked", Help = true })
	CPanel:AddControl("CheckBox", { Label = "#tool.toggle", Command = "camera_toggle" })

end
--PATH gamemodes/darkrp/entities/weapons/gmod_tool/stools/nocollide.lua:

TOOL.AddToMenu = false
TOOL.Category 	= 'Construction'
TOOL.Name 		= '#tool.nocollide.name'

function TOOL:LeftClick(trace)
	if (not IsValid(trace.Entity)) or (not trace.Entity:IsProp() and not trace.Entity:IsVehicle()) then return false end
	if CLIENT then return true end
		
	local succ = (trace.Entity:GetCollisionGroup() == (trace.Entity:IsVehicle() and COLLISION_GROUP_VEHICLE or COLLISION_GROUP_NONE))

	if succ then
		trace.Entity:SetCollisionGroup(COLLISION_GROUP_WORLD)
		//self:GetOwner():Notify(NOTIFY_GENERIC, term.Get('NoCollided'))
	end

	return succ
end

function TOOL:RightClick(trace)
	if (not IsValid(trace.Entity)) or (not trace.Entity:IsProp() and not trace.Entity:IsVehicle()) then return false end
	if CLIENT then return true end

	local succ = (trace.Entity:GetCollisionGroup() == COLLISION_GROUP_WORLD)

	if succ then
		trace.Entity:SetCollisionGroup((trace.Entity:IsVehicle() and COLLISION_GROUP_VEHICLE or COLLISION_GROUP_NONE))
		//self:GetOwner():Notify(NOTIFY_GENERIC, term.Get('Collided'))
	end
	
	return succ
end

TOOL.Reload = TOOL.RightClick

function TOOL.BuildCPanel(CPanel)
	CPanel:AddControl('Header', {Description = '#tool.nocollide.desc'})
end

hook('EntityRemoved', 'nocollide_fix', function(ent) -- garry is dum
	if (ent:GetClass() == 'logic_collision_pair') then
		ent:Fire('EnableCollisions')
	end
end)


--PATH gamemodes/darkrp/entities/weapons/lockpick.lua:
if SERVER then
	AddCSLuaFile()
end

if CLIENT then
	SWEP.PrintName = "Відмичка"
	SWEP.Slot = 3
	SWEP.SlotPos = 1
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end

SWEP.Instructions = "Нажми щоб взламати"
SWEP.Contact = "Jervisss"
SWEP.Purpose = ""

SWEP.ViewModelFOV = 60
SWEP.ViewModelFlip = false
SWEP.UseHands = true
SWEP.ViewModel = Model('models/weapons/v_crowbar.mdl')
SWEP.WorldModel = Model('models/weapons/w_crowbar.mdl')

SWEP.Spawnable = true
SWEP.Category = "RP"

SWEP.Sound = Sound("physics/wood/wood_box_impact_hard3.wav")

SWEP.Primary.ClipSize = -1      -- Size of a clip
SWEP.Primary.DefaultClip = 0        -- Default number of bullets in a clip
SWEP.Primary.Automatic = false      -- Automatic/Semi Auto
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1        -- Size of a clip
SWEP.Secondary.DefaultClip = -1     -- Default number of bullets in a clip
SWEP.Secondary.Automatic = false        -- Automatic/Semi Auto
SWEP.Secondary.Ammo = ""
SWEP.LockPickTime = 15

function SWEP:Initialize()

	self:SetHoldType("pistol")
end

function SWEP:PrimaryAttack()

	self.StartLockPick_s = self.StartLockPick_s or 0
    if ( CurTime() > self.StartLockPick_s + 1 ) then 

		local time = self.LockPickTime 

		if self.Owner:Team() == TEAM_THIEFF_VIP then
			self.LockPickTime = 5
		end

		self.EndPick = CurTime() + time
		self.StartPick = CurTime()
	
		self.Weapon:SetNextPrimaryFire(CurTime() + 2)
	
		if self.IsLockPicking then return end
	
		local trace = self.Owner:GetEyeTrace()
		local e = trace.Entity	
		if (not IsValid(e)) or trace.HitPos:Distance(self.Owner:GetShootPos()) > 100 then
			return
		end

		if e:GetNWBool('IsKeyLock') == true or e:IsDoor() or e:IsVehicle() or e.FadingDoor then

			self:SetHoldType("pistol")
		
			self.IsLockPicking = true
	
    		self.StartLockPick_s = CurTime()

			hook.Run('PlayerStartLockpicking', self.Owner, trace.Entity)
		end

		//if IsValid(self.Owner) and self.Owner:GetTeamTable().lockpicktime then
		//	self.LockPickTime = 30 * self.Owner:GetTeamTable().lockpicktime
		//else
		//	self.LockPickTime = 30
		//end
    end

end

function SWEP:Holster()
	self.IsLockPicking = false
	return true
end

function SWEP:SucceedDoor()
	self.IsLockPicking = false
	self:SetHoldType("normal")
	local trace = self.Owner:GetEyeTrace()

	if IsValid(trace.Entity) and trace.Entity.Fire then
		if (trace.Entity.Locked) then
			trace.Entity.PickedAt = CurTime()
		end
		trace.Entity:DoorLock(not trace.Entity.Locked)
		trace.Entity:Fire("open", "", .6)
		trace.Entity:Fire("setanimation","open",.6)
	
		hook.Run('PlayerFinishLockpicking', self.Owner, trace.Entity)
	end
end

function SWEP:Think()
	if self.IsLockPicking then
		local trace = self.Owner:GetEyeTrace()
		if not IsValid(trace.Entity) then
			self.IsLockPicking = false
			self:SetHoldType("normal")
		end

		self.LastSoundLock = self.LastSoundLock or 0

   		if ( CurTime() > self.LastSoundLock + 1 ) then 
        self.LastSoundLock = CurTime()
			local snd = {1,3,4}
			self:EmitSound("weapons/357/357_reload".. tostring(snd[math.random(1, #snd)]) ..".wav", 50, 100)
		end

		if trace.Entity:GetPos():Distance(self.Owner:GetPos()) > 100 then
			self.IsLockPicking = false
			self:SetHoldType("normal")
		end


		if self.EndPick <= CurTime() then
			if trace.Entity:IsDoor() or trace.Entity:IsVehicle() then
				self.IsLockPicking = false
				self:SucceedDoor()
			elseif trace.Entity.FadingDoor == true then
				self.IsLockPicking = false
				trace.Entity:Fade()
				timer.Simple(5,function()
					trace.Entity:UnFade()	
				end)
			elseif tostring(trace.Entity):find('br_money') then	
				self.IsLockPicking = false
				if (SERVER) then trace.Entity:StartRob(self.Owner) end
				self:SetHoldType("normal")
			elseif tostring(trace.Entity):find('money_printer') then	
				self.IsLockPicking = false
				if (SERVER) then trace.Entity:Hack(self.Owner) end
				self:SetHoldType("normal")	
			elseif tostring(trace.Entity):find('br_case') then	
				self.IsLockPicking = false
				if (SERVER) then Open_Case(trace.Entity,self.Owner) end
				self:SetHoldType("normal")	
			elseif tostring(trace.Entity):find('ent_c4') then	
				self.IsLockPicking = false
				if (SERVER) then
				   local money = math.random(50000,100000)
				   trace.Entity:Remove()
				   self.Owner:AddMoney(money)
				   rp.Notify(self.Owner,1,'Ви отримали з ящика #$',money)
				end
				self:SetHoldType("normal")					
			else
				self.IsLockPicking = false
				return false
			end
		end
	end
end

function SWEP:DrawHUD()
	if self.IsLockPicking then
		self.Dots = self.Dots or ""

		local x, y = (ScrW() * 0.5) - 150, (ScrH() * 0.5) - 25
		local w, h  = 300, 50

		local time = self.EndPick - self.StartPick
		local status = (CurTime() - self.StartPick)/time
		rp.LoadUTILMenu(self.LockPickTime,100)
	else
		if IsValid(v1255125v125) then
			RunConsoleCommand('HUD_RP',1)
			v1255125v125:Remove()
		end
	end
end
//
function SWEP:SecondaryAttack()
	self:PrimaryAttack()
end
//
function SWEP:DrawWorldModel()
	if (!IsValid(self.Owner)) then return end -- ?

	if (not self.Hand) then
		self.Hand = self.Owner:LookupAttachment("anim_attachment_rh")
	end

	if (not self.Hand) then
		self:DrawModel()
		return
	end

	local hand = self.Owner:GetAttachment(self.Hand)

	if hand then
		self:SetRenderOrigin(hand.Pos + (hand.Ang:Right() * 5.5) + (hand.Ang:Up() * -1.5))

		hand.Ang:RotateAroundAxis(hand.Ang:Right(), 90)
		hand.Ang:RotateAroundAxis(hand.Ang:Up(), 180)

		self:SetRenderAngles(hand.Ang)
	end

	self:DrawModel()
end
--PATH addons/__main/lua/weapons/m9k_acr/shared.lua:
-- Variables that are used on both client and server
SWEP.Gun = ("m9k_acr") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "ACR"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 21			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_rif_msda.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_masada_acr.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Masada.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 825			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.3		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "ar2"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 30	-- Base damage per bullet
SWEP.Primary.Spread		= .025	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .015 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(2.668, 0, 0.675)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(2.668, 0, 0.675)
SWEP.SightsAng = Vector(0, 0, 0)
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
--PATH addons/__main/lua/weapons/m9k_ak74/shared.lua:
-- Variables that are used on both client and server
SWEP.Gun = ("m9k_ak74") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "AK-74"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
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

SWEP.SelectiveFire		= true

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_tct_ak47.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_tct_ak47.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Tactic_AK47.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 600			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.4		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.4		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.4		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "ar2"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 31	-- Base damage per bullet
SWEP.Primary.Spread		= .02	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .01 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector (2.0378, -3.8941, 0.8809)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (2.0378, -3.8941, 0.8809)
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
--PATH addons/__main/lua/weapons/m9k_dbarrel/shared.lua:
-- Variables that are used on both client and server
SWEP.Gun = ("m9k_dbarrel") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "Double Barrel Shotgun"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 21			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_doublebarrl.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_double_barrel_shotgun.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_shotty_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Double_Barrel.Single")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 180		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 2			-- Size of a clip
SWEP.Primary.DefaultClip		= 30	-- Default number of bullets in a clip
SWEP.Primary.KickUp				= 10				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 5		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 5	-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "buckshot"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 0		-- How much you 'zoom' in. Less is more! 

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.ShellTime			= .5

SWEP.Primary.NumShots	= 18		-- How many bullets to shoot per trigger pull, AKA pellets
SWEP.Primary.Damage		= 10	-- Base damage per bullet
SWEP.Primary.Spread		= .03	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .03	-- Ironsight accuracy, should be the same for shotguns
-- Because irons don't magically give you less pellet spread!

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(0, 0, 0)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(0, 0, 0)
SWEP.SightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector(11.475, -7.705, -2.787)
SWEP.RunSightsAng = Vector(0.574, 51.638, 5.737)

SWEP.Secondary.Sound = Sound("dbarrel_dblast")

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

function NewM9KDamageMultiplierDB(cvar, previous, new)
		print("multiplier has been changed ")
		if GetConVar("M9KDamageMultiplier") == nil then
				PainMulti = 1
				print("M9KDamageMultiplier is missing! You may have hit the lua limit! Reverting multiplier to 1, you will notice no changes.")
		else
				PainMulti = GetConVar("M9KDamageMultiplier"):GetFloat()
				if PainMulti < 0 then
						PainMulti = PainMulti * -1
				end
		end
end
cvars.AddChangeCallback("M9KDamageMultiplier", NewM9KDamageMultiplierDB)

function SWEP:SecondaryAttack()
	local timerName = "ShotgunReload_" ..  self.Owner:UniqueID()
	if (timer.Exists(timerName)) then return end
	
	if self:CanPrimaryAttack() and self.Owner:IsPlayer() then
	if self.Weapon:Clip1() == 2 then
		if !self.Owner:KeyDown(IN_SPEED) and !self.Owner:KeyDown(IN_RELOAD) then
			self:ShootBulletInformation2()
			self.Weapon:TakePrimaryAmmo(2)
			self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
			self.Weapon:EmitSound(self.Secondary.Sound)
			--self.Owner:ViewPunch(Angle(-15, math.Rand(-20,-25), 0))
	
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
			self.Weapon:SetNextSecondaryFire(CurTime()+1/((self.Primary.RPM*0.5)/60))
			self:CheckWeaponsAndAmmo()
			self.RicochetCoin = (math.random(1,8))
		if self.BoltAction then self:BoltBack() end
		end
	elseif self.Weapon:Clip1() == 1 then
		self.Weapon:PrimaryAttack()
		self.Weapon:SetNextSecondaryFire(CurTime()+1/((self.Primary.RPM*0.5)/60))
	elseif self.Weapon:Clip1() == 0 then
		self:Reload()
	end	
	end
end

function SWEP:PrimaryAttack()
	local timerName = "ShotgunReload_" ..  self.Owner:UniqueID()
	if (timer.Exists(timerName)) then return end
	if self:CanPrimaryAttack() and self.Owner:IsPlayer() then
	if !self.Owner:KeyDown(IN_SPEED) and !self.Owner:KeyDown(IN_RELOAD) then
		self:ShootBulletInformation()
		self.Weapon:TakePrimaryAmmo(1)
		
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
		self.RicochetCoin = (math.random(1,4))
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
		self.RicochetCoin = (math.random(1,4))
	end
end


function SWEP:ShootBulletInformation2()

	local CurrentDamage
	local CurrentRecoil
	local CurrentCone
	local basedamage
	
	CurrentCone = self.Primary.Spread
	
	local damagedice = math.Rand(.85,1.3)
	
	basedamage = PainMulti * self.Primary.Damage
	CurrentDamage = basedamage * damagedice
	CurrentRecoil = self.Primary.Recoil
	
		self:ShootBullet(CurrentDamage, CurrentRecoil, 31, .06)
	
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

	if (timer.Exists("ShotgunReload")) or self.Owner.NextReload > CurTime() or maxcap == spaceavail then return end
	
	if self.Owner:IsPlayer() then 

		self.Weapon:SetNextPrimaryFire(CurTime() + 1) -- wait one second before you can shoot again
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

function SWEP:Think()
	if not IsValid(self) then return end
	if not IsValid(self.Owner) then return end
	if not self.Owner:IsPlayer() then return end
	if self.Owner.NextReload == nil then self.Owner.NextReload = CurTime() + 1 end
	local timerName = "ShotgunReload_" ..  self.Owner:UniqueID()
	--if the owner presses shoot while the timer is in effect, then...
	-- if (self.Owner:KeyPressed(IN_ATTACK)) and (timer.Exists(timerName)) and not (self.Owner:KeyDown(IN_SPEED)) then
		-- if self:CanPrimaryAttack() then --well first, if we actually can attack, then...
			-- timer.Destroy(timerName) -- kill the timer, and
			-- self:PrimaryAttack()-- ATTAAAAACK!
		-- end
	-- end
	
	if self.InsertingShell == true and self.Owner:Alive() then
		vm = self.Owner:GetViewModel()-- its a messy way to do it, but holy shit, it works!
		vm:ResetSequence(vm:LookupSequence("after_reload")) -- Fuck you, garry, why the hell can't I reset a sequence in multiplayer?
		vm:SetPlaybackRate(.01) -- or if I can, why does facepunch have to be such a shitty community, and your wiki have to be an unreadable goddamn mess?
		self.InsertingShell = false -- You get paid for this, what's your excuse?
	end
	
	self:IronSight()
	
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
			self.Weapon:SetNextPrimaryFire(CurTime()+.55)
			self.Weapon:SetNextSecondaryFire(CurTime()+.55)
		elseif (self.Weapon:Clip1() <= self.Primary.ClipSize and self.Owner:GetAmmoCount(self.Primary.Ammo) >= 0) then
			self.InsertingShell = true --well, I tried!
			timer.Simple( .05, function()
				if not IsValid(self) then return end
				self:ShellAnimCaller()
			end)
			self.Owner:RemoveAmmo(1, self.Primary.Ammo, false) -- out of the frying pan
			self.Weapon:SetClip1(self.Weapon:Clip1() + 1) --  into the fire
		end
	else
		timer.Destroy(timerName) -- kill the timer
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
--PATH addons/__main/lua/weapons/m9k_deagle/shared.lua:
-- Variables that are used on both client and server
SWEP.Gun = ("m9k_deagle") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "Desert Eagle"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 1				-- Slot in the weapon selection menu
SWEP.SlotPos				= 21			-- Position in the slot
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

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_tcom_deagle.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_tcom_deagle.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Weapon_TDegle.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 600			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 7		-- Size of a clip
SWEP.Primary.DefaultClip		= 30		-- Bullets you start with
SWEP.Primary.KickUp				= 1		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.5		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.5		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "357"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 30	-- Base damage per bullet
SWEP.Primary.Spread		= .025	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .015 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector (-1.7102, 0, 0.2585)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (-1.7102, 0, 0.2585)
SWEP.SightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector(3.444, -7.823, -6.27)
SWEP.RunSightsAng = Vector(60.695, 0, 0)
-- SWEP.RunSightsPos = Vector (-0.3967, 0, 2.2339)
-- SWEP.RunSightsAng = Vector (-17.3454, -2.6248, 0)

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
--PATH addons/__main/lua/weapons/m9k_honeybadger/shared.lua:
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
SWEP.Primary.RPM				= 791		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip			= 60	-- Bullets you start with
SWEP.Primary.KickUp			= .5				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= .3			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= .5		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "ar2"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
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
SWEP.Primary.Damage		= 24	--base damage per bullet
SWEP.Primary.Spread		= .023	--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .014 -- ironsight accuracy, should be the same for shotguns

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
--PATH addons/__main/lua/weapons/m9k_m1918bar/shared.lua:
-- Variables that are used on both client and server
SWEP.Gun = ("m9k_m1918bar") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "M1918 BAR"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
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

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_m1918bar.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_m1918_bar.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Weapon_bar1.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 450			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 20		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
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
SWEP.Primary.Damage		= 40	-- Base damage per bullet
SWEP.Primary.Spread		= .025	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .015 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(3.313, 0, 1.399)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(3.313, 0, 1.399)
SWEP.SightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector(-7.049, -8.525, -2.132)
SWEP.RunSightsAng = Vector(0, -58.526, 0)

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
--PATH addons/__main/lua/weapons/m9k_m29satan/shared.lua:
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
--PATH addons/__main/lua/weapons/m9k_ragingbull/shared.lua:
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
SWEP.Primary.Damage		= 31	-- Base damage per bullet
SWEP.Primary.Spread		= .02	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
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
--PATH addons/__main/lua/weapons/m9k_scar/shared.lua:
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
SWEP.Primary.RPM			= 625			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.4		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "ar2"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 30	-- Base damage per bullet
SWEP.Primary.Spread		= .02	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .01 -- Ironsight accuracy, should be the same for shotguns

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
--PATH addons/__main/lua/weapons/m9k_tar21/shared.lua:
-- Variables that are used on both client and server
SWEP.Gun = ("m9k_tar21") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "TAR-21"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 38			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight				= 30			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "rpg"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_imi_tavor.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_imi_tar21.mdl"	-- Weapon world model
SWEP.ShowWorldModel			= true
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Wep_imitavor.single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 900			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.3		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "ar2"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 30	-- Base damage per bullet
SWEP.Primary.Spread		= .027	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .016 -- Ironsight accuracy, should be the same for shotguns

SWEP.SelectiveFire		= true

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(-1.825, 0.685, 0.155)
SWEP.IronSightsAng = Vector(0.768, 0, 0)
SWEP.SightsPos = Vector(-1.825, 0.685, 0.155)
SWEP.SightsAng = Vector(0.768, 0, 0)
SWEP.RunSightsPos = Vector(3.858, 0.079, -1.025)
SWEP.RunSightsAng = Vector(-5.237, 49.648, 0)

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
--PATH addons/__main/lua/weapons/m9k_vikhr/shared.lua:
-- Variables that are used on both client and server
SWEP.Gun = ("m9k_vikhr") -- must be the name of your swep but NO CAPITALS!
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
SWEP.PrintName				= "SR-3M Vikhr"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 40			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_dmg_vikhr.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_dmg_vikhr.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Dmgfok_vikhr.Single")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 900			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.3		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.5		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "smg1"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.Secondary.IronFOV			= 60		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 29	-- Base damage per bullet
SWEP.Primary.Spread		= .02	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .014 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector (-2.2363, -1.0859, 0.5292)
SWEP.IronSightsAng = Vector (1.4076, 0.0907, 0)
SWEP.SightsPos = Vector (-2.2363, -1.0859, 0.5292)
SWEP.SightsAng = Vector (1.4076, 0.0907, 0)
SWEP.RunSightsPos = Vector (0.3339, -2.043, 0.6273)
SWEP.RunSightsAng = Vector (-11.5931, 48.4648, -19.7039)

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
--PATH addons/__main/lua/weapons/mac_lara/shared.lua:
-- Variables that are used on both client and server
SWEP.Gun = ("mac_lara") -- must be the name of your swep but NO CAPITALS!
SWEP.Category				= "CSO/CF Weapons" --Category where you will find your weapons
SWEP.Author				= "Zekeou"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.PrintName				= "Lightning LZ-1 Lara QQ"		-- Weapon name (Shown on HUD)	
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
SWEP.ViewModel				= "models/weapons/v_smg_macla.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_smg_mac10.mdl"	-- Weapon world model
SWEP.ShowWorldModel			= false
SWEP.Base				= "zekeou_gun_base" --the Base this weapon will work on. PLEASE RENAME THE BASE! 
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("weapons/MAC_Lara/Lara Fire.wav")		-- Script that calls the primary fire sound
SWEP.Primary.SilencedSound 	= Sound("")		-- Sound if the weapon is silenced
SWEP.Primary.RPM			= 1090			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.4		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "pistol"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. 
--Use AirboatGun for a light metal peircing shotgun pellets
SWEP.SelectiveFire		= true
SWEP.CanBeSilenced		= false

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 22	-- Base damage per bullet
SWEP.Primary.Spread		= .027	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .017 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(-0.32, 0, -0.52)
SWEP.IronSightsAng = Vector(7.992, -14.606, 0)
SWEP.SightsPos = Vector(-0.32, 0, -0.52)
SWEP.SightsAng = Vector(7.992, -14.606, 0)
SWEP.RunSightsPos = Vector(0,0,0)	--These are for the angles your viewmodel will be when running
SWEP.RunSightsAng = Vector(0,0,0)	--Again, use the Swep Construction Kit

SWEP.WElements = {
	["MAC_Lara"] = { type = "Model", model = "models/weapons/w_smg_macla.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-3.636, 0.802, 1.241), angle = Angle(-2.495, 0.263, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

--PATH addons/swb_css/lua/weapons/swb_m249/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M249"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(-5.941, -6.378, 2.322)
	SWEP.AimAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(0, 0, -0.7)
	SWEP.SprintAng = Vector(-7.739, 28.141, 0)
	
	SWEP.ZoomAmount = 15
	
	SWEP.IconLetter = "z"
	
	SWEP.MuzzleEffect = "swb_rifle_med"
	SWEP.InvertShellEjectAngle = true
end

SWEP.PlayBackRate = 1
SWEP.PlayBackRateSV = 1
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
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "swb_base"
SWEP.Category = "SUP Weapons"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 55
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/cstrike/c_mach_m249para.mdl"
SWEP.WorldModel		= "models/weapons/w_mach_m249para.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 100
SWEP.Primary.DefaultClip	= 100
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"

SWEP.FireDelay = 0.075
SWEP.FireSound = Sound("Weapon_M249.Single")
SWEP.Recoil = 1.1
SWEP.Chamberable = false

SWEP.HipSpread = 0.055
SWEP.AimSpread = 0.004
SWEP.VelocitySensitivity = 2.5
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.007
SWEP.SpreadCooldown = 0.1
SWEP.Shots = 1
SWEP.Damage = 24
SWEP.DeployTime = 1
--PATH addons/swb_css/lua/weapons/swb_mac10/shared.lua:
AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "MAC-10"
	SWEP.CSMuzzleFlashes = true

	SWEP.AimPos = Vector(-1.68, -2.089, 1.48)
	SWEP.AimAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(0.736, -3.971, 1.802)
	SWEP.SprintAng = Vector(-13.205, 37.048, 0)
	
	SWEP.ZoomAmount = 15
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.IconLetter = "l"
	
	SWEP.MuzzleEffect = "swb_rifle_small"
end

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
SWEP.Category = "SUP Weapons"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 55
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/cstrike/c_smg_mac10.mdl"
SWEP.WorldModel		= "models/weapons/w_smg_mac10.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 32
SWEP.Primary.DefaultClip	= 32
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"
SWEP.Chamberable = false

SWEP.FireDelay = 0.05
SWEP.FireSound = Sound("Weapon_MAC10.Single")
SWEP.Recoil = 1

SWEP.HipSpread = 0.037
SWEP.AimSpread = 0.015
SWEP.VelocitySensitivity = 1.4
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.1
SWEP.Shots = 1
SWEP.Damage = 20
SWEP.DeployTime = 1
SWEP.BurstCooldownMul = 3.5
--PATH addons/_drones/lua/weapons/weapon_drr_radar.lua:
AddCSLuaFile()

SWEP.PrintName	= "Radar"
SWEP.Category = "Drones Rewrite Tools"

SWEP.Spawnable	= true
SWEP.UseHands	= true
SWEP.DrawAmmo	= false

SWEP.ViewModelFOV	= 50
SWEP.Slot			= 0
SWEP.SlotPos		= 5

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= true
SWEP.Secondary.Ammo			= "none"

SWEP.ViewModel = "models/dronesrewrite/c_radar/c_radar.mdl"
SWEP.WorldModel = "models/dronesrewrite/c_radar/c_radar.mdl"

function SWEP:DoIdle()
	timer.Create("weapon_idle" .. self:EntIndex(), self:SequenceDuration(), 1, function()
		if IsValid(self) then 
			self:SendWeaponAnim(ACT_VM_IDLE) 
			self:DoIdle()
		end 
	end)
end

function SWEP:OnDrop() return false end

function SWEP:Initialize()
	self:SetHoldType("shotgun")

	if CLIENT then self.RangeRadar = 60 end
end

function SWEP:PrimaryAttack() end
function SWEP:SecondaryAttack() end

function SWEP:OnRemove()
	timer.Stop("weapon_idle" .. self:EntIndex())
	timer.Stop("weapon_active" .. self:EntIndex())

	self:SetNWBool("DRRActivated", false)
end

function SWEP:Holster()
	self:OnRemove()
	return true
end

function SWEP:Deploy()
	self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
	self:DoIdle()

	timer.Create("weapon_active" .. self:EntIndex(), 1.8, 1, function()
		if IsValid(self) then self:SetNWBool("DRRActivated", true) end
	end)

	return true
end

if CLIENT then
	local function Circle(x, y, radius, seg)
		-- Code from wiki.garrysmod.com

		local cir = { }

		table.insert(cir, { x = x, y = y, u = 0.5, v = 0.5 })
		for i = 0, seg do
			local a = math.rad((i / seg) * -360)
			table.insert(cir, { 
				x = x + math.sin(a) * radius, 
				y = y + math.cos(a) * radius, 
				u = math.sin(a) * 0.5 + 0.5, 
				v = math.cos(a) * 0.5 + 0.5 
			})
		end

		local a = math.rad(0) -- This is needed for non absolute segment counts

		table.insert( cir, { 
			x = x + math.sin(a) * radius, 
			y = y + math.cos(a) * radius, 
			u = math.sin(a) * 0.5 + 0.5, 
			v = math.cos(a) * 0.5 + 0.5 
		})

		--surface.SetMaterial(mat)
		--draw.NoTexture()
		surface.DrawPoly(cir)
	end

	function SWEP:ViewModelDrawn()
		if not self:GetNWBool("DRRActivated", false) then return end

		local vm = self.Owner:GetViewModel()

		local bone = vm:LookupBone("ValveBiped.Bip01_L_Hand")
		if not bone then return end

		local pos, ang
		local m = vm:GetBoneMatrix(bone)
		if m then
			pos, ang = m:GetTranslation(), m:GetAngles()
		end

		if not pos or not ang then return end

		ang:RotateAroundAxis(ang:Right(), -90)
		ang:RotateAroundAxis(ang:Forward(), -7)

		pos = pos + ang:Right() * 8.6
		pos = pos - ang:Forward() * 0.3
		pos = pos + ang:Up() * 2.4

		cam.Start3D2D(pos, ang, 0.012)
			surface.SetDrawColor(Color(0, 255, 0, 100))

			for i = 1, 15 do surface.DrawLine(i * 50 - 400, -250, i * 50 - 400, 250) end
			for i = 1, 15 do surface.DrawLine(-250, i * 50 - 400, 250, i * 50 - 400) end

			surface.SetDrawColor(Color(100, 255, 100))
			Circle(0, 0, 6, 6)

			surface.SetDrawColor(Color(0, 255, 0, 255))

			for k, v in ipairs(DRONES_REWRITE.GetDrones()) do
				if v:GetNWBool("NoDRRRadar", false) then continue end

				local dist = (v:GetPos() - self.Owner:GetPos()):GetNormal()
				dist:Rotate(Angle(0, -self.Owner:EyeAngles().y + 180, 0))

				dist = dist * (v:GetPos():Distance(self.Owner:GetPos()) / self.RangeRadar)
				if dist:Length() > 240 then continue end
					
				Circle(dist.x, dist.y, math.Clamp(12 - self.RangeRadar * 0.1, 4, 12) + math.sin(CurTime() * 10) * 0.5, 12)
			end
		cam.End3D2D()
	end

	function SWEP:Think()
		if IsValid(self.Owner) then
			if self.Owner:KeyDown(IN_ATTACK) then
				self.RangeRadar = math.Approach(self.RangeRadar, 10, 1)
			end

			if self.Owner:KeyDown(IN_ATTACK2) then
				self.RangeRadar = math.Approach(self.RangeRadar, 200, 1)
			end
		end
	end
end

--PATH addons/__main/lua/weapons/weapon_ebony_ivory.lua:
game.AddParticles("particles/muzzleflashes_test.pcf")
game.AddParticles("particles/muzzleflashes_test_b.pcf")

PrecacheParticleSystem("muzzleflash_1")
PrecacheParticleSystem("muzzleflash_6")

local ACT_RUN = 2
local ACT_WALK = 1
local ACT_IDLE = 0
local CLIENT, SERVER = CLIENT, SERVER

local anim = {
	[ACT_RUN] = "run",
	[ACT_WALK] = "walk_all",
	[ACT_IDLE] = "idle"
}

local function Noise( n )
	math.randomseed( math.Round( 100 * n ) )
	
	math.random()
	math.random()
	math.random()
	
	local a = math.random()
	math.randomseed(SysTime()+math.random())
	return a
end

local function CoherentNoise( n )
	local n1 = math.floor( n )
	local n2 = n1 + 1
	
	local t = n - n1
	local t2 = t * t
	local t3 = t * t2
	
	local p0 = Noise( n1 ) * ( 2 * t3 - 3 * t2 + 1 )
	local p1 = Noise( n2 ) * ( -2 * t3 + 3 * t2 )
	
	local t0 = Noise( n1 + 1337 ) * ( t3 - 2 * t2 + t )
	local t1 = Noise( n2 + 1337 ) * ( t3 - t2 )
	
	return p0 + t0 + p1 + t1
end

SWEP.Base = "weapon_base"
SWEP.Spawnable = true
SWEP.Category = "Weapons"
SWEP.AdminOnly = false
SWEP.UseHands = true
SWEP.DrawCrosshair = true
SWEP.PrintName = "Ebony & Ivory"
SWEP.DrawWeaponInfoBox = false
SWEP.BobScale = 0.5
SWEP.SwayScale = 0.5
SWEP.Slot = 1

SWEP.ViewModel = "models/c_models/v_dual_pistol_dmc3.mdl"
SWEP.WorldModel = "models/w_models/w_pistol_dual_dmc3.mdl"
SWEP.WorldModel_Dropped = "models/w_models/w_pistol_dual_dropped_dmc3.mdl"
SWEP.ViewModelFOV = 65

SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 120
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pistol"
SWEP.Primary.Damage = 38
SWEP.Primary.Delay = 0.12
SWEP.Primary.Force = 0.1

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

sound.Add( {
	name = "ebonyivory.Deploy",
	channel = CHAN_WEAPON,
	volume = {0.80, 0.77},
	level = 80,
	pitch = {95, 110},
	sound = ")weapons/ebonyivory/gunother/dualpistol_deploy_1.wav"
} )

sound.Add( {
	name = "ebonyivory.ClipIn",
	channel = CHAN_ITEM,
	volume = {0.80, 0.77},
	level = 75,
	pitch = {95, 110},
	sound = ")weapons/ebonyivory/gunother/dualpistol_clip_in_1.wav"
} )

sound.Add( {
	name = "ebonyivory.ClipOut",
	channel = CHAN_ITEM,
	volume = {0.80, 0.77},
	level = 75,
	pitch = {95, 110},
	sound = ")weapons/ebonyivory/gunother/dualpistol_clip_out_1.wav"
} )

sound.Add( {
	name = "ebonyivory.ClipLocked",
	channel = CHAN_ITEM,
	volume = {0.80, 0.77},
	level = 75,
	pitch = {95, 110},
	sound = ")weapons/ebonyivory/gunother/dualpistol_deploy_1.wav"
} )

sound.Add( {
	name = "ebonyivory.Slideback",
	channel = CHAN_ITEM,
	volume = {0.80, 0.77},
	level = 75,
	pitch = {95, 110},
	sound = ")weapons/ebonyivory/gunother/pistol_slideback_1.wav"
} )

sound.Add( {
	name = "ebonyivory.SlideForward",
	channel = CHAN_ITEM,
	volume = {0.80, 0.77},
	level = 75,
	pitch = {95, 110},
	sound = ")weapons/ebonyivory/gunother/pistol_slideforward_1.wav"
} )

local mat = Material("entities/weapon_ebony_ivory.png")

local ENTITY = FindMetaTable("Entity")
local LookupBone = ENTITY.LookupBone
local SetupBones = ENTITY.SetupBones
local GetBoneMatrix = ENTITY.GetBoneMatrix

local color_white = Color(255, 255, 255, 255)
local color_black = Color(0, 0, 0, 255)

local FOV = 0
local dot_right = 0

if CLIENT then
	hook.Add("DoAnimationEvent", "ma3516.DoAnimationEvent", function(ply, event, num)
		if event ~= PLAYERANIMEVENT_CUSTOM
			or ply:IsDormant()
			or (ply == LocalPlayer() and not ply:ShouldDrawLocalPlayer()) then
			return
		end

		local self = ply:GetActiveWeapon()

		if not self:IsValid() then
			return
		end

		if num == 523 then
			local att = self:LookupAttachment(self:GetLeft() and "muzzle_flash_r" or "muzzle_flash_l")
			local data = EffectData()
			data:SetFlags(0)
			data:SetEntity(self)
			data:SetAttachment(att)
			data:SetScale(0)

			util.Effect("CS_MuzzleFlash_X", data)

			ParticleEffectAttach("muzzleflash_6", PATTACH_POINT_FOLLOW, self, att)

			return ACT_INVALID
		end
	end)
end

local vec16 = Vector(16, 16, 0)

function SWEP:OnDrop() end

function SWEP:Initialize()
	self:SetHoldType("duel")

	self.RandomShake = 0
	self.LerpRandomShake = 0
	self.LerpedAng = Angle()
end

function SWEP:DrawWeaponSelection( x, y, wide, tall, alpha )
	local SC48 = ScreenScale(48)

	surface.SetDrawColor( 0, 0, 0, alpha )
	surface.SetMaterial( mat )
	surface.DrawTexturedRect( x + wide * 0.5 - SC48 * 0.5 - 4 , y - 4, SC48 + 8, SC48 + 6 )
	
	surface.SetDrawColor( 255, 255, 255, alpha )
	surface.SetMaterial( mat )
	surface.DrawTexturedRect( x + wide * 0.5 - SC48 * 0.5, y,  SC48, SC48 )

	self:PrintWeaponInfo( x + wide + 20, y + tall * 0.95, alpha )
end

function SWEP:GetTracerOrigin()
	local ply = self:GetOwner()
	local vm = ply:GetViewModel()

	if not vm:IsValid() then
		return
	end

	local att = vm:LookupAttachment(self:GetLeft() and "shell_r" or "shell_l")

	if att <= 0 then
		return
	end

	local attach = vm:GetAttachment(att)

	if not attach then
		return
	end

	return attach.Pos
end

local function DrawWorldModel(self)
	if not IsValid(self.WM_Dropped) then
		self.WM_Dropped = ClientsideModel(self.WorldModel_Dropped)
	end

	local ply = self:GetOwner()

	if not ply:IsValid() then
		self.WM_Dropped:SetupBones()
		self.WM_Dropped:SetNoDraw(true)
		self.WM_Dropped:SetPos(self:GetPos())
		self.WM_Dropped:SetAngles(self:GetAngles())
		self.WM_Dropped:DrawModel()

		return
	end

	local hand = LookupBone(ply, "ValveBiped.Bip01_R_Hand")

    if not hand then
        return
    end

	local mat = GetBoneMatrix(ply, hand)

	if not mat then
		return
	end

	self:SetModel(self.WorldModel)

	local pos, ang = mat:GetTranslation(), mat:GetAngles()

	ang:RotateAroundAxis(ang:Forward(), 180)

	self:SetRenderOrigin(pos - ang:Up() * 0.5 - ang:Forward() * -0.1 - ang:Right())
	self:SetRenderAngles(ang)
	self:DrawModel()
end

SWEP.DrawWorldModel = DrawWorldModel
SWEP.DrawWorldModelTranslucent = DrawWorldModel

function SWEP:DoDrawCrosshair(x, y)
	local ply = self:GetOwner()
	local ang = ply:GetViewPunchAngles()

	draw.SimpleTextOutlined("X", "DermaDefault", x - ang.y, y - ang.p * 2, color_white, 1, 1, 1, color_black)

	return true
end

function SWEP:PreDrawViewModel()
	local FT = FrameTime()

	FOV = math.Clamp(FOV + FT * 3 * (self:LastShootTime() + 0.1 > CurTime() and 1 or -1), 0, 1)

	local ply = self:GetOwner()

	if not ply:IsValid() then
		return
	end

	local eyeangles = ply:EyeAngles()
	local vel = ply:GetVelocity()
	local dot = vel:DotProduct(eyeangles:Right())

	dot_right = Lerp(FT * 14, dot_right, math.Clamp(dot / ply:GetMaxSpeed(), -1, 1))
end

function SWEP:TranslateFOV(fov)
	return fov - FOV
end

function SWEP:SetupDataTables()
	self:NetworkVar("Bool", 0, "Reloading")
	self:NetworkVar("Bool", 1, "Left")
	self:SetLeft(false)
	-- self:NetworkVar("Bool", 2, "Sprint")
	self:NetworkVar("Bool", 3, "PreLoaded")

	-- self:NetworkVar("String", 0, "LastSound")
	self:NetworkVar("String", 1, "LastAnim")

	self:NetworkVar("Float", 0, "ReloadTime")
	-- self:NetworkVar("Float", 1, "MinValue")
	self:NetworkVar("Float", 2, "NextIdle")
	-- self:NetworkVar("Float", 3, "LastPerk")
end

function SWEP:OnReloaded()
	self:SetupDataTables()
end

function SWEP:Deploy()
	local ply = self:GetOwner()

	if not ply:IsValid() then
		return
	end

	local vm = ply:GetViewModel()

	if not vm:IsValid() then
		return
	end

    self:SendWeaponAnim(ACT_VM_DEPLOY)

	local time = CurTime() + vm:SequenceDuration()

    self:SetNextPrimaryFire(time)
    self:SetNextSecondaryFire(time)
	self:SetNextIdle(time)

	self.MultSprinting = 0

    return true
end

function SWEP:Holster()
	self:SetReloading(false)
	self:SetPreLoaded(false)

	if CLIENT then
		FOV, dot_right = 0, 0
	end

	return true
end

function SWEP:OnRemove()
	if IsValid(self.WM_Dropped) then
		self.WM_Dropped:Remove()
	end

	return true
end


function SWEP:Think()
	local ply = self:GetOwner()

	if not ply:IsValid() then
		return
	end

	local vm = ply:GetViewModel()

	if not vm:IsValid() then
		return
	end

	if self:GetReloading()
		and vm:GetCycle() > 0.75 then
		if not self:GetPreLoaded() then
			self:SetPreLoaded(true)

			local ply = self:GetOwner()

			if not ply:IsValid() then
				return
			end

			if SERVER then
				local clipSize = self.Primary.ClipSize

				if self:Ammo1() > (clipSize - self:Clip1()) then
					ply:SetAmmo(self:Ammo1() - clipSize + self:Clip1(), self.Primary.Ammo)
					self:SetClip1(clipSize)
				end

				if (self:Ammo1() - clipSize + self:Clip1()) + self:Clip1() < clipSize then
					self:SetClip1(self:Clip1() + self:Ammo1())
					ply:SetAmmo(0, self.Primary.Ammo)
				end
			end
		end

		if vm:GetCycle() >= 0.9 then
			self:SetReloading(false)
			self:SetNextPrimaryFire(CurTime() + 0.1)
			self:SetPreLoaded(false)
		end
	end

	local vel = ply:GetVelocity():Length()
	local confirm = ply:OnGround()

	local state = confirm and vel > ply:GetRunSpeed() * 0.7 and ACT_RUN
		or confirm and vel > ply:GetWalkSpeed() * 0.7 and ACT_WALK
		or ACT_IDLE

	self.walkState = self.walkState or -1

	if self.walkState ~= state then
		self.walkState = state
		self:SetNextIdle(-1)
	end

	if self:GetNextPrimaryFire() < CurTime() 
		and not self:GetReloading()
		and not self:GetPreLoaded() then
		if self:GetNextIdle() < CurTime() then
			vm:SendViewModelMatchingSequence(vm:LookupSequence(anim[self.walkState]))
			self:SetNextIdle(CurTime() + vm:SequenceDuration() * 0.9)
		end
	end
end

function SWEP:ShootEffects()
	local ply = self:GetOwner()

	if not ply:IsValid() then
		return
	end

	local SP = game.SinglePlayer()
	local left = self:GetLeft()

	if (SP and not left) or (not SP and left) then
		self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	else
		self:SendWeaponAnim(ACT_VM_SECONDARYATTACK)
	end

	if CLIENT and IsFirstTimePredicted() then
		self:CreateShell()
	end

	ply:SetAnimation(PLAYER_ATTACK1)
    ply:MuzzleFlash()
end

local shellMins, shellMaxs = Vector(-0.5, -0.15, -0.5), Vector(0.5, 0.15, 0.5)
local angleVelocity = Vector()

hook.Add("EntityEmitSound", "ma3516.ShellSoundFix", function(data)
	local entity = data.Entity

	if not entity.l4d_IsShell
        or string.find(data.SoundName, "shell", 1, true) then
		return
	end

	return false
end)

function SWEP:CreateShell()
	local current_shell = "models/weapons/shell.mdl"

	local ply = self:GetOwner()

	if not ply:IsValid() then
		return
	end

	local vm = ply:GetViewModel()

	if not vm:IsValid() then
		return
	end

	local attach
	local att = vm:LookupAttachment(self:GetLeft() and "shell_r" or "shell_l")

	if att <= 0 then
		return
	end

	attach = vm:GetAttachment(att)

	if not attach then
		return
	end

	local pos, ang = attach.Pos, ply:GetAimVector():Angle()
	local abs_velocity = ply:GetAbsVelocity()

	local shell = ClientsideModel(current_shell)

	if not shell:IsValid() then
		return
	end

	if self.OverrideShellPosition
		and self.Base == "weapon_l4d_base" then
		pos, ang = self:OverrideShellPosition(shell, pos, ang)
	end

	shell:SetPos(pos)
	shell:SetAngles(ang)
	shell:SetMoveType(MOVETYPE_VPHYSICS) 
	shell:SetSolid(SOLID_VPHYSICS) 
	shell:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
	shell:SetModelScale(self.ShellScale or 0.8)
	shell:PhysicsInitBox(shellMins, shellMaxs, "gmod_silent")

	local phys = shell:GetPhysicsObject()
	phys:SetMaterial("gmod_silent")
	phys:SetMass(10)

	shell:Spawn()
	shell:Activate()

	shell.l4d_IsShell = true

	if self.OverrideShellSetVelocity then
		self:OverrideShellSetVelocity(phys, ang, abs_velocity)
	else
		phys:SetVelocity(ang:Right() * 100 + ang:Up() * 100 + ang:Forward() * math.Rand(-25, 25)
			+ abs_velocity)
	end

	angleVelocity.x = math.random(-500, 500)
	angleVelocity.y = math.random(-500, 500)
	angleVelocity.z = math.random(-500, 500)

	phys:AddAngleVelocity(ang:Right() * 500 + angleVelocity)

	local id
	id = shell:AddCallback("PhysicsCollide", function(ent)
		ent:RemoveCallback("PhysicsCollide", id)
		ent:EmitSound("player/pl_shell" .. math.random(1, 3) .. ".wav", 50, 100, 1)
	end)

	timer.Simple(1, function()
		if not shell:IsValid() then
			return
		end

		shell:SetRenderMode(RENDERMODE_TRANSALPHA)
		shell:SetRenderFX(kRenderFxFadeFast)

		SafeRemoveEntityDelayed(shell, 2)
	end)

	return true
end

local accuracy = 3
local obb = Vector(4, 4, 4)
local hullSize, pushVel = Vector(14, 14, 0), Vector(100, 100, 0)

function SWEP:PrimaryAttack()
	local ply = self:GetOwner()

	if self:Clip1() <= 0 then
		self:EmitSound(")weapons/ebonyivory/gunother/pistol_dryfire.wav", 75, 150, 0.4, 10, 1)

		return self:SetNextPrimaryFire(CurTime() + 0.25)
	end

	if self:GetReloading() then
		return
	end

	local viewpunch, getAimVector = ply:GetViewPunchAngles(), ply:GetAimVector()
    local aim, f1 = getAimVector:Angle(), 0.001
    local up, shootpos, right = aim:Up(), ply:GetShootPos(), aim:Right()

	local bullet = {}
	bullet.Num = 1
	bullet.Src = shootpos
	bullet.Dir = getAimVector + up * math.abs(viewpunch.p) / 100
	bullet.Spread = Vector(f1, f1, 0)
	bullet.Tracer = 1
	bullet.Force = self.Primary.Force
	bullet.Distance = 3000
	bullet.Damage = self.Primary.Damage
	bullet.AmmoType = self.Primary.Ammo

	bullet.Callback = function(attacker, tr, damageinfo)
		local min_dmg = 3000

		if waterlevel then
			min_dmg = min_dmg * 0.01
		end

		local dist = tr.HitPos:Distance(tr.StartPos)

		if waterlevel and dist > min_dmg then
			damageinfo:ScaleDamage(0)

			return
		end

		local dmg_multiplier = math.Remap(tr.HitPos:Distance(tr.StartPos), 0, min_dmg, 0, 1)
		dmg_multiplier = math.Clamp(dmg_multiplier * 0.3, 0, waterlevel and 0.99 or 0.75)
		damageinfo:ScaleDamage(1 - dmg_multiplier)

		return self:Ricochet(0, attacker, tr, damageinfo, bullet)
	end

	ply:FireBullets(bullet)

	local ang = Angle(util.SharedRandom("malorian.RandomPunchP", -2, -1), (1 - (util.SharedRandom("malorian.RandomPunchy", 0, 1) * 2)) * 0.5)
	ply:ViewPunchReset()
	ply:ViewPunch(ang)
	ply:SetEyeAngles(ply:EyeAngles() + ang * 0.5)

    self:ShootEffects()
	self:MuzzleFlash_Light()

	if game.SinglePlayer() then
		self:CallOnClient("MuzzleFlash_Light")
	end

	self:TakePrimaryAmmo(1)
	self:EmitSound(")weapons/ebonyivory/gunfire/pistol_dual_fire.wav", 75, 100 + math.random(-7, 4), 1, self:GetLeft() and CHAN_WEAPON or 16)

	local CT = CurTime()
    local nextprimaryfire = self:GetNextPrimaryFire()
    local diff = CT - nextprimaryfire

    if diff > engine.TickInterval()
		or diff < 0 then
        nextprimaryfire = CT
    end

    self:SetNextPrimaryFire(nextprimaryfire + self.Primary.Delay)
    self:SetNextSecondaryFire(nextprimaryfire + self.Primary.Delay)
	self:SetLeft(not self:GetLeft())
end

function SWEP:SecondaryAttack()
	local ply = self:GetOwner()

	if not self:GetReloading() then
		local CT = CurTime()
		local IFTP, SP = IsFirstTimePredicted(), game.SinglePlayer()

		if SP then
			self:CallOnClient("SecondaryAttack")
		end

		if not ply:IsValid() then
			return
		end

		local vm = ply:GetViewModel()

		if not vm:IsValid() then
			return
		end

		local isDefaultAnim = false

		if (SP and SERVER
			or not SP) then
			ply:LagCompensation(true)
				local count, detected = 0, false
				local shootpos, aimVector = ply:GetShootPos(), ply:GetAimVector()
				local eyeAng, absVel = aimVector:Angle(), ply:GetAbsVelocity()
				local forward, right = eyeAng:Forward(), eyeAng:Right()

				local dmg

				if SERVER then
					dmg = DamageInfo()
					dmg:SetAttacker(ply)
					dmg:SetInflictor(self)
					dmg:SetDamage(25)
					dmg:SetDamageType(DMG_CLUB)
					dmg:SetDamageForce(ply:GetForward() * 2)			
				end

				if not ply:GetNWBool("CAP.InBuildMode") then
					for i = -accuracy, accuracy do
						count = count + 0.7

						local val = (i / accuracy)
						local tr = util.TraceHull({
							["start"] = shootpos,
							["endpos"] = shootpos + forward * 78 * math.cos(val) - right * val * 14,
							["filter"] = ply,
							["mins"] = obb * -1,
							["maxs"] = obb,
							["mask"] = MASK_SHOT_HULL
						})

						local ent = tr.Entity

						if (ent.l4d_NextSecondaryAttack or 0) < CT then
							ent.l4d_NextSecondaryAttack = CT + 1

							if ent:IsPlayer()
								or ent:IsNPC()
								or ent:IsNextBot() then
								if SERVER then
									dmg:SetDamagePosition(tr.HitPos)

									ent:SetGroundEntity(NULL)
									ent:SetVelocity(aimVector * pushVel)
									ent:TakeDamageInfo(dmg)
								end

								detected = ent
							elseif ent:IsValid()
								or ent:IsWorld() then
								if SERVER then
									dmg:SetDamagePosition(tr.HitPos)

									ent:TakeDamageInfo(dmg)
									ent:SetGroundEntity(NULL)

									local phys = ent:GetPhysicsObject()

									if phys:IsValid() then
										phys:ApplyForceOffset(aimVector * pushVel * 10, tr.HitPos)
									end
								end

								if not isentity(detected) then
									detected = true
								end
							end
						end

						::skip::
					end
				end
			ply:LagCompensation(false)

			if IsFirstTimePredicted() then
				self.RandomShake = 1
			end

			if isentity(detected) then
				self:EmitSound(")weapons/ebonyivory/gunother/melee_hitbody.wav", 75, 100 + math.random(-3, 7), 0.5, 14)
			elseif detected then
				self:EmitSound(")weapons/ebonyivory/gunother/melee_hitworld.wav", 75, 100 + math.random(-3, 7), 0.5, 14)
			end

			self:EmitSound(")weapons/ebonyivory/gunother/melee_miss.wav", 75, 100 + math.random(-3, 7), 0.5, CHAN_WEAPON)
		end

		local m = vm:LookupSequence("melee")

		if m then
			vm:SendViewModelMatchingSequence(m)
		end

		self:SetNextIdle(CT + vm:SequenceDuration())
		self:SetNextPrimaryFire(CT + vm:SequenceDuration())
		self:SetNextSecondaryFire(CT + vm:SequenceDuration())

		ply:DoAnimationEvent(ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND)

		return
	end
end

local angle_zero = Angle()

function SWEP:PushMuzzleFlash()
	local ply = self:GetOwner()

	if not ply:IsValid() then
		return
	end

	ply:DoCustomAnimEvent(PLAYERANIMEVENT_CUSTOM, 523)
end

function SWEP:MuzzleFlash_Light()
	local ply = self:GetOwner()

	if not ply:IsValid() then
		return
	end

	local IFTP, SP = IsFirstTimePredicted(), game.SinglePlayer()
	local vm = ply:GetViewModel()

	if not vm:IsValid() then
		return
	end

	local att = vm:LookupAttachment(self:GetLeft() and "muzzle_flash_r" or "muzzle_flash_l")

	if att <= 0 then
		return
	end

	if CLIENT
		and (not SP and IFTP or SP)
		and not ply:ShouldDrawLocalPlayer() then
		local attach = vm:GetAttachment(att)

		if attach then
			local data = EffectData()
			data:SetFlags(0)
			data:SetEntity(vm)
			data:SetAttachment(att)
			data:SetScale(0)

			util.Effect("CS_MuzzleFlash_X", data)
			ParticleEffectAttach("muzzleflash_1", PATTACH_POINT_FOLLOW, vm, att)
		end
	end

	if CLIENT
		and (self:IsCarriedByLocalPlayer() and not ply:ShouldDrawLocalPlayer()) then
		return
	end

	if (not SP and IFTP) or SP then
		local att = self:LookupAttachment(self:GetLeft() and "muzzle_flash_r" or "muzzle_flash_l")

		if att then
			local effect = EffectData()
			effect:SetFlags(0)
			effect:SetEntity(self)
			effect:SetAttachment(att)
			effect:SetScale(0)

			if SERVER then
				local filter = RecipientFilter()
				filter:AddPVS(ply:GetPos())
				filter:RemovePlayer(ply)

				util.Effect("CS_MuzzleFlash_X", effect, true, filter)
			else
				util.Effect("CS_MuzzleFlash_X", effect)
			end

			if not SP and IFTP then
				self:PushMuzzleFlash()
			elseif SP then
				self:CallOnClient("PushMuzzleFlash")
			end
		end
	end
end

local angle_zero = Angle()

function SWEP:CalcViewModelView(a, b, c, vec, ang)
	ang.r = ang.r + dot_right * 4

	return vec, ang
end

function SWEP:CalcView(ply, vec, ang, fov)
	local FT = FrameTime()
	local vm = ply:GetViewModel()
	local CT = CurTime()

	if vm:IsValid() then
		local getAttach = vm:GetAttachment(2)

		if getAttach
			and ((self:GetNextPrimaryFire() >= CT and self:Clip1() > 0 and self:GetNextSecondaryFire() < CT) or self:GetReloading()) then
			self.LerpedAng = LerpAngle(FT * 4, self.LerpedAng, vm:WorldToLocalAngles(getAttach.Ang) / 25)

			ang.r = ang.r + (1 - math.Clamp((CT - self:LastShootTime()) * 2.5, 0, 1)) * math.random() * 2 + self.LerpRandomShake * CoherentNoise(CT * 5 + 9001) * 10
			ang.y = ang.y + self.LerpRandomShake * CoherentNoise(CT * 5 + 1492) * 10
			ang.p = ang.p + self.LerpRandomShake * CoherentNoise(CT * 5) * 10
		else
			self.LerpedAng = LerpAngle(FT * 4, self.LerpedAng, angle_zero)
		end
	else
		self.LerpedAng = LerpAngle(FT * 4, self.LerpedAng, angle_zero)
	end

	return vec, ang - self.LerpedAng, fov
end

function SWEP:AdjustMouseSensitivity()
	return 1 - ((self.MultLerp or 0) * 0.25)
end

local math_huge = math.huge

function SWEP:Reload()
	local ply = self:GetOwner()

	if not ply:IsValid()
		or self:GetNextPrimaryFire() > CurTime() then
		return
	end

	local vm = ply:GetViewModel()

	if not vm:IsValid() then
		return
	end

    if not self:GetReloading() and self:Clip1() < self.Primary.ClipSize and self:Ammo1() > 0 then
		if self:Clip1() == 0 then
			self:SendWeaponAnim(ACT_VM_RELOAD_EMPTY)
		else
			self:SendWeaponAnim(ACT_VM_RELOAD)
		end

		self:SetNextPrimaryFire(math_huge)
		self:SetReloading(true)
		self:SetHoldType("duel")

		vm:SetPlaybackRate(0.85)
		ply:SetAnimation(PLAYER_RELOAD)
    end
end


SWEP.NoRicochet = {[MAT_FLESH] = true, [MAT_ANTLION] = true, [MAT_BLOODYFLESH] = true, [MAT_DIRT] = true, [MAT_SAND] = true, [MAT_GLASS] = true, [MAT_ALIENFLESH] = true, [MAT_GRASS] = true, [MAT_WOOD] = true}
SWEP.PenetrationMaterialInteraction = {[MAT_SAND] = 1, [MAT_DIRT] = 0.8, [MAT_METAL] = 1.1, [MAT_TILE] = 0.9, [MAT_WOOD] = 1.2}

function SWEP:Ricochet(bnum, att, tr, dmg, bulletOld)
	if not IsFirstTimePredicted() then
		return
	end

	local diff = tr.Normal:Dot(tr.HitNormal)
	diff = diff / (tr.Normal:Length() * tr.HitNormal:Length())
	diff = math.deg(math.acos(diff))

	if diff ~= diff then
		return
	end

	if self:Penetrate(bnum, att, tr, dmg, bulletOld) then return end

	if (tr.Entity:IsValid() and diff > 125) then
		return
	elseif (not tr.Entity:IsValid()) and diff > 100 then
		return
	elseif tr.Entity:IsPlayer() or tr.Entity:IsNPC() or tr.Entity:IsNextBot() then
		return
	end

	if self.NoRicochet[tr.MatType] then return end
	if tr.HitSky then return end

	local maxricochet = 1

	if bnum > maxricochet then return end

	local DotProduct, damage = tr.HitNormal:Dot(tr.Normal * -1), dmg:GetDamage()

	local bullet = {}

	bullet.Num = bulletOld.Num or 1
	bullet.Src = tr.HitPos + (tr.HitNormal * 5)
	bullet.Dir = ((2 * tr.HitNormal * DotProduct) + tr.Normal) + (VectorRand() * 0.05)
	bullet.Spread = bulletOld.Spread * 2.5
	bullet.Tracer = 1
	bullet.TracerName = "Impact"
	bullet.Force = damage * (maxricochet - bnum) / 4
	bullet.Damage = damage * (maxricochet - bnum) / 2.5

	bullet.Callback = function(a, b, c)
		return self:Ricochet(bnum + 1, a, b, c, bullet)
	end

	att:FireBullets(bullet)
end

function SWEP:Penetrate(num, attacker, tr, damageinfo, bulletOld)
	if tr.MatType == MAT_SLOSH then
		return
	end

	local max_ricochet = self.PenetrationNumLayers or 1

	if num > max_ricochet then
		return
	end

	local penetrate = tr.HitPos + tr.Normal:Angle():Forward()
		* 6
		* (1 + (math.random() * 0.25))
		* ((tr.Entity:IsPlayer() or tr.Entity:IsNPC() or tr.Entity:IsNextBot()) and 6 or 1)

	local penetrate_trace = util.TraceLine({["start"] = penetrate, ["endpos"] = penetrate})

	if penetrate_trace.Entity == tr.Entity
        or bit.band(util.PointContents(penetrate_trace.HitPos), CONTENTS_WATER) == CONTENTS_WATER then
		return
	end

	local hit_pos = penetrate_trace.HitPos
	local getNormalized = tr.Normal:Angle()

	local fucky_wucky_pos_check = {
		["start"] = hit_pos,
		["endpos"] = hit_pos - getNormalized:Forward() * (self.PenetrationMaxDistance or 512)
	}

	local fucky_wucky_trace = util.TraceLine(fucky_wucky_pos_check)
	local hit_texture = fucky_wucky_trace.HitTexture

	if hit_texture == "**displacement**"
		or hit_texture == "TOOLS/TOOLSNODRAW" then

		return
	end

	local bullet = {}

	bullet.Num = bulletOld.Num or 1
	bullet.Src = penetrate_trace.HitPos
	bullet.Dir = tr.Normal
	bullet.Spread = bulletOld.Spread
	bullet.Tracer = 1
	bullet.TracerName = "Impact"
	bullet.Force =  damageinfo:GetDamageForce() / math.random(1.25, 2)
	bullet.Damage = damageinfo:GetDamage() / math.random(1.25, 2)
	bullet.Distance = self.PenetrationMaxDistance or 512

	attacker:FireBullets(bullet)

	bullet.Dir = -tr.Normal
	bullet.Damage = 0
	bullet.Distance = fucky_wucky_trace.HitPos:Distance(hit_pos) + 1

	attacker:FireBullets(bullet)

	return true
end
--PATH addons/__main/lua/weapons/weapon_long_golden_revolver_admin.lua:
SWEP.PrintName = "[Admin] Long Golden Revolver"
SWEP.Author = "DerHobbyRoller"
SWEP.Instructions = "Left Mouse Button to Shoot lol"
SWEP.Spawnable = true
SWEP.AdminOnly = true


SWEP.Primary.ClipSize = 6
SWEP.Primary.DefaultClip = 6
SWEP.Primary.Ammo = "357"
SWEP.Primary.Automatic = true
SWEP.Primary.Recoil = 0
SWEP.Primary.Damage = 200
SWEP.Primary.NumShots = 1
SWEP.Primary.Spread = 0
SWEP.Primary.Cone = 0
SWEP.Primary.Delay = 0


SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.Automatic = false


SWEP.Weight			= 7
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Slot			= 1
SWEP.SlotPos			= 2
SWEP.DrawAmmo			= true
SWEP.DrawCrosshair		= true


SWEP.ViewModel			= "models/weapons/golden/c_357.mdl"
SWEP.WorldModel			= "models/weapons/golden/w_357.mdl"

if CLIENT then
SWEP.WepSelectIcon = surface.GetTextureID("VGUI/entities/iconGold")
SWEP.IconOverride = "materials/entities/longRevolverGold.png"
end

SWEP.Category = "Long Revolver"
SWEP.UseHands = true

SWEP.SetHoldType = "pistol"

local ShootSound = Sound("Weapon_357.single")

function SWEP:PrimaryAttack()
	local ply = self:GetOwner()
	ply:LagCompensation(true)

	self:ShootBullet( 100000, 10, 0.01 )
	self:ShootEffects()
	self:EmitSound(ShootSound)
	self.BaseClass.ShootEffects(self)


	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

	
	ply:LagCompensation(false)
	

end
--PATH addons/__main/lua/weapons/weapon_long_revolver_admin.lua:
SWEP.PrintName = "[Admin] Long Revolver"
SWEP.Author = "DerHobbyRoller"
SWEP.Instructions = "Left Mouse Button to Shoot lol"
SWEP.Spawnable = true
SWEP.AdminOnly = true


SWEP.Primary.ClipSize = 6
SWEP.Primary.DefaultClip = 6
SWEP.Primary.Ammo = "357"
SWEP.Primary.Automatic = true
SWEP.Primary.Recoil = 0
SWEP.Primary.Damage = 200
SWEP.Primary.NumShots = 1
SWEP.Primary.Spread = 0
SWEP.Primary.Cone = 0
SWEP.Primary.Delay = 0


SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.Automatic = false


SWEP.Weight			= 7
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Slot			= 1
SWEP.SlotPos			= 2
SWEP.DrawAmmo			= true
SWEP.DrawCrosshair		= true


SWEP.ViewModel			= "models/weapons/default/c_357.mdl"
SWEP.WorldModel			= "models/weapons/default/w_357.mdl"

if CLIENT then
SWEP.WepSelectIcon = surface.GetTextureID("VGUI/entities/iconNormal")
SWEP.IconOverride = "materials/entities/longRevolverDefault.png"
end

SWEP.Category = "Long Revolver"
SWEP.UseHands = true

SWEP.SetHoldType = "pistol"

local ShootSound = Sound("Weapon_357.single")

function SWEP:PrimaryAttack()
	local ply = self:GetOwner()
	ply:LagCompensation(true)

	self:ShootBullet( 100000, 10, 0.01 )
	self:ShootEffects()
	self:EmitSound(ShootSound)
	self.BaseClass.ShootEffects(self)


	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

	
	ply:LagCompensation(false)
	

end
--PATH addons/__main/lua/weapons/weapon_m4a1_beast.lua:
if SERVER then
	AddCSLuaFile()
else
	SWEP.ViewModelFOV = 60
	SWEP.BounceWeaponIcon = false
end

SWEP.Category = "Weapons"
SWEP.PrintName = "M4A1-S-Beast"
SWEP.Slot = 2
SWEP.SlotPos = 1
SWEP.Base = "weapon_cf_base"
SWEP.Spawnable = true
SWEP.HoldType = "ar2"
SWEP.ViewModel = "models/cf/c_m4a1_beast.mdl"
SWEP.WorldModel = "models/cf/w_m4a1_beast.mdl"
SWEP.Primary.Sound = Sound( "weapons/m4a1_beast/rifle_fire_1.wav" )
SWEP.Primary.Damage = 50
SWEP.Primary.Cone = 0.0185
SWEP.Primary.ClipSize = 38
SWEP.Primary.Delay = 0.1
SWEP.Primary.DefaultClip = 152
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "smg1"
SWEP.MeleeRange = 38
SWEP.MeleeDamage = 55
SWEP.MeleeAttack = 0.15
SWEP.MeleeDuration = 0.95
SWEP.MeleeSound = "weapons/m4a1_beast/rifle_melee.wav"
SWEP.MuzzleScale = 0.75
SWEP.ReloadSequence = 8
--PATH addons/__main/lua/weapons/weapon_mse_katana/shared.lua:
if (SERVER) then
	AddCSLuaFile("shared.lua")
end

if( CLIENT ) then
	SWEP.BounceWeaponIcon = false
	SWEP.WepSelectIcon	= surface.GetTextureID("vgui/weapons/weapon_mse_katana")
end

SWEP.PrintName = "Катана"
SWEP.Slot = 0
SWEP.SlotPos = 0
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true

SWEP.Author			= "Akira."
SWEP.Instructions	= "Faites juste un clique gauche."
SWEP.Contact		= "N/A"
SWEP.Purpose		= ""
SWEP.Category		= "RP"

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.HoldType 		= "melee2"
SWEP.ViewModel      = "models/weapons/c_katana.mdl"
SWEP.WorldModel   	= "models/weapons/w_katana.mdl"
SWEP.UseHands = true

SWEP.Primary.Sound				= Sound( "" )
SWEP.Primary.Delay				= 0.4
SWEP.Primary.Recoil				= 0
SWEP.Primary.Damage				= 1
SWEP.Primary.NumShots			= 1
SWEP.Primary.Cone				= 0
SWEP.Primary.ClipSize			= -1
SWEP.Primary.DefaultClip		= -1
SWEP.Primary.Automatic   		= false
SWEP.Primary.Ammo         		= "none"

SWEP.Secondary.Ammo         	= "none"
SWEP.SwingSound = Sound("weapons/katana/katana_swing_miss1.wav")

function SWEP:Initialize()
	if (SERVER) then
		self:SetHoldType( self.HoldType )
	end
	
	SWoodHit = {
		Sound( "weapons/katana/katana_wood_hit_1.wav" ),
		Sound( "weapons/katana/katana_wood_hit_2.wav" ),
		Sound( "weapons/katana/katana_wood_hit_3.wav" )
	}
	
	SFleshHit = {
		Sound( "ambient/machines/slicer1.wav" ),
		Sound( "ambient/machines/slicer2.wav" ),
		Sound( "ambient/machines/slicer3.wav" ),
		Sound( "ambient/machines/slicer4.wav" )
	} 
	
	SGlassHit = {
		Sound( "weapons/katana/katana_glass_hit_1.wav" ),
		Sound( "weapons/katana/katana_glass_hit_2.wav" ),
		Sound( "weapons/katana/katana_glass_hit_3.wav" )
	}
	
	SMetalHit = {
		Sound( "weapons/katana/katana_metal_hit_1.wav" ),
		Sound( "weapons/katana/katana_metal_hit_2.wav" ),
		Sound( "weapons/katana/katana_metal_hit_3.wav" ),
		Sound( "weapons/katana/katana_metal_hit_4.wav" ),
		Sound( "weapons/katana/katana_metal_hit_5.wav" ),
		Sound( "weapons/katana/katana_metal_hit_6.wav" ),
		Sound( "weapons/katana/katana_metal_hit_7.wav" )
	}
	
	SGroundHit = {
		Sound( "weapons/katana/katana_ground_hit_1.wav" ),
		Sound( "weapons/katana/katana_ground_hit_2.wav" ),
		Sound( "weapons/katana/katana_ground_hit_3.wav" ),
		Sound( "weapons/katana/katana_ground_hit_4.wav" ),
		Sound( "weapons/katana/katana_ground_hit_5.wav" )
	}
	
	self.FleshHit = {
		Sound( "weapons/katana/melee_katana_01.wav" ),
		Sound( "weapons/katana/melee_katana_02.wav" ),
		Sound( "weapons/katana/melee_katana_03.wav" )
	}	
end

function SWEP:Precache()
end

function SWEP:Deploy()
	self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
	self:SetNextPrimaryFire(CurTime() + 0.7)
	self.Weapon:EmitSound("weapons/katana/katana_draw.wav")
	return true
end

function SWEP:PrimaryAttack()
	self.Weapon:SendWeaponAnim(ACT_VM_MISSCENTER)
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self.Weapon:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

	self.Weapon:EmitSound("Weapon_Knife.Slash")
	
	local trace = self.Owner:GetEyeTrace()

	if trace.HitPos:Distance(self.Owner:GetShootPos()) <= 70 then		
		bullet = {}
		bullet.Num    = 1
		bullet.Src    = self.Owner:GetShootPos()
		bullet.Dir    = self.Owner:GetAimVector()
		bullet.Spread = Vector(0, 0, 0)
		bullet.Tracer = 0
		bullet.Force  = 14
		bullet.Damage = 50
		
		
		self.Owner:FireBullets(bullet)
		self.Weapon:EmitSound("Weapon_Knife.Slash")
		
		if(trace.Entity:IsPlayer() or trace.Entity:IsNPC() or trace.Entity:GetClass() == "prop_ragdoll") then
			self.Weapon:EmitSound(SFleshHit[math.random(1,#SFleshHit)])
			
		else
			util.Decal("ManhackCut", trace.HitPos + trace.HitNormal, trace.HitPos - trace.HitNormal)
				if (trace.MatType == MAT_METAL or trace.MatType == MAT_VENT or trace.MatType == MAT_COMPUTER) then
					self.Weapon:EmitSound(SMetalHit[math.random(1,#SMetalHit)])
				elseif (trace.MatType == MAT_WOOD or trace.MatType == "MAT_FOLIAGE") then
					self.Weapon:EmitSound(SWoodHit[math.random(1,#SWoodHit)])
				elseif (trace.MatType == MAT_GLASS) then
					self.Weapon:EmitSound(SGlassHit[math.random(1,#SGlassHit)])
				elseif (trace.MatType == MAT_DIRT or trace.MatType == MAT_SAND or trace.MatType == MAT_SLOSH or trace.MatType == MAT_TILE or trace.MatType == MAT_PLASTIC or trace.MatType == MAT_CONCRETE) then
					self.Weapon:EmitSound(SGroundHit[math.random(1,#SGroundHit)])
				else 
					self.Weapon:EmitSound(SGroundHit[math.random(1,#SGroundHit)])
				end
			end
		
		if (SERVER) then
			local hitposent = ents.Create("info_target")
			local trace = self.Owner:GetEyeTrace()
			local hitpos = trace.HitPos	
		end	
	end
end

function SWEP:SecondaryAttack()
	return
end

-- Animations.
local ActIndex = {}
	ActIndex["pistol"] 			= ACT_HL2MP_IDLE_PISTOL
	ActIndex["smg"] 			= ACT_HL2MP_IDLE_SMG1
	ActIndex["grenade"] 		= ACT_HL2MP_IDLE_GRENADE
	ActIndex["ar2"] 			= ACT_HL2MP_IDLE_AR2
	ActIndex["shotgun"] 		= ACT_HL2MP_IDLE_SHOTGUN
	ActIndex["rpg"]	 			= ACT_HL2MP_IDLE_RPG
	ActIndex["physgun"] 		= ACT_HL2MP_IDLE_PHYSGUN
	ActIndex["crossbow"] 		= ACT_HL2MP_IDLE_CROSSBOW
	ActIndex["melee"] 			= ACT_HL2MP_IDLE_MELEE
	ActIndex["slam"] 			= ACT_HL2MP_IDLE_SLAM
	ActIndex["normal"]			= ACT_HL2MP_IDLE
	ActIndex["knife"]			= ACT_HL2MP_IDLE_KNIFE
	ActIndex["melee2"]			= ACT_HL2MP_IDLE_MELEE2
	ActIndex["passive"]			= ACT_HL2MP_IDLE_PASSIVE
	ActIndex["fist"]			= ACT_HL2MP_IDLE_FIST

function SWEP:SetHoldType(t)

	local index = ActIndex[t]
	
	if (index == nil) then
		Msg("SWEP:SetWeaponHoldType - ActIndex[ \""..t.."\" ] isn't set!\n")
		return
	end

self.ActivityTranslate = {}
self.ActivityTranslate [ ACT_MP_STAND_IDLE ]				= index
self.ActivityTranslate [ ACT_MP_WALK ]						= index+1
self.ActivityTranslate [ ACT_MP_RUN ]						= index+2        
self.ActivityTranslate [ ACT_MP_CROUCH_IDLE ]				= index+3
self.ActivityTranslate [ ACT_MP_CROUCHWALK ]				= index+4
self.ActivityTranslate [ ACT_MP_ATTACK_STAND_PRIMARYFIRE ]	= index+5
self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ]	= index+5
self.ActivityTranslate [ ACT_MP_RELOAD_STAND ]				= index+6
self.ActivityTranslate [ ACT_MP_RELOAD_CROUCH ]				= index+6
self.ActivityTranslate [ ACT_MP_JUMP ]						= index+7
self.ActivityTranslate [ ACT_RANGE_ATTACK1 ]				= index+8
	if t == "normal" then
		self.ActivityTranslate [ ACT_MP_JUMP ] = ACT_HL2MP_JUMP_SLAM
	end
	if t == "passive" then
		self.ActivityTranslate [ ACT_MP_CROUCH_IDLE ] = ACT_HL2MP_CROUCH_IDLE
	end	
	self:SetupWeaponHoldTypeForAI(t)
end

function SWEP:TranslateActivity(act)

	if (self.Owner:IsNPC()) then
		if (self.ActivityTranslateAI[act]) then
			return self.ActivityTranslateAI[act]
		end

		return -1
	end

	if (self.ActivityTranslate[act] != nil) then
		return self.ActivityTranslate[act]
	end
	
	return -1
end
--PATH addons/__main/lua/weapons/weapon_passport.lua:
SWEP.PrintName = "Паспорт"
SWEP.Author = "Kerry"
SWEP.Contact = "just add on Steam"
SWEP.Purpose = "Description"
SWEP.Instructions = "Kerry"
SWEP.Category = "RP"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.Base = "weapon_base"
SWEP.UseHands = true
SWEP.Slot = 3
SWEP.SlotPos = 1
SWEP.ViewModelFOV = 54
SWEP.ViewModel = "models/weapons/kerry/passport_g.mdl"
SWEP.WorldModel = "models/weapons/kerry/w_garrys_pass.mdl"
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"
SWEP.HoldType = "pistol"

local cattbl = {
	["Кримінал"] = true
}

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)

	if CLIENT then
		self.Passport = table.FullCopy(self.Passport)
		self:CreateModels(self.Passport)
	end

	self:SetupValue()
end

if CLIENT then
	surface.CreateFont("PassHud", {
		font = "Arial",
		size = 25,
		weight = 600,
	})

	surface.CreateFont("PassHud2", {
		font = "Arial",
		size = 15,
		weight = 600,
	})

	surface.CreateFont("PassHud3", {
		font = "Arial",
		size = 20,
		weight = 600,
	})

	function SWEP:ViewModelDrawn()
		local vm = self:GetOwner():GetViewModel()
		if not IsValid(vm) then return end
		local bone = vm:LookupBone("PBase")
		if not bone then return end
		pos, ang = Vector(0, 0, 0), Angle(0, 0, 0)
		local m = vm:GetBoneMatrix(bone)

		if m then
			pos, ang = m:GetTranslation(), m:GetAngles()
		else
			return
		end

		ang:RotateAroundAxis(ang:Forward(), 0)
		ang:RotateAroundAxis(ang:Right(), -130)
		ang:RotateAroundAxis(ang:Up(), 93)
		cam.Start3D2D(pos + ang:Right() * 3 + ang:Forward() * -1.80 + ang:Up() * 1.0, ang, 0.02)
		draw.SimpleText("Ім'я:", "PassHud2", 40, -50, Color(0, 0, 0, 255))
		draw.SimpleText(self:GetOwner():Name() or "Unknown", "PassHud", 40, -40, Color(0, 0, 0, 255))
		draw.SimpleText("Місце роботи:", "PassHud2", 40, -17, Color(0, 0, 0, 255))
		draw.SimpleText(cattbl[rp.Team[self:GetOwner():Team()].category] and 'Громадянин' or team.GetName(self:GetOwner():Team()) or "Unknown", "PassHud3", 40, -5, Color(0, 0, 0, 255))
		draw.SimpleText("Місто:", "PassHud2", 40, 15, Color(0, 0, 0, 255))
		--draw.SimpleText(GetHostName(), "PassHud3", 40, 30, Color(0, 0, 0, 255))
		draw.SimpleText('UkraineRP', "PassHud3", 40, 30, Color(0, 0, 0, 255))
		draw.SimpleText("<G<<<<<<<<<<<" .. self:GetOwner():SteamID() .. "<<<<", "PassHud2", -60, 60, Color(0, 0, 0, 200))
		draw.SimpleText("<G<<<2281337<<<<777<<<<06<<<<<<<<<<", "PassHud2", -60, 75, Color(0, 0, 0, 200))
		surface.SetDrawColor(255, 255, 255, 250)
		surface.SetMaterial(self.mat_ply)
		surface.DrawTexturedRect(-50, -42, 82, 82)
		cam.End3D2D()
	end
end

if CLIENT then
	SWEP.Passport = {
		["pass"] = {
			type = "Model",
			model = "models/weapons/kerry/w_garrys_pass.mdl",
			bone = "ValveBiped.Bip01_R_Hand",
			rel = "",
			pos = Vector(6, 3.5, -0.6),
			angle = Angle(0, 90, 120),
			size = Vector(0.699, 0.699, 0.699),
			color = Color(255, 255, 255, 255),
			surpresslightning = false,
			material = "",
			skin = 0,
			bodygroup = {}
		},
		["info_pass"] = {
			type = "Quad",
			bone = "ValveBiped.Bip01_R_Hand",
			rel = "pass",
			pos = Vector(0, 0, 0),
			angle = Angle(0, 0, 0),
			size = 0.5
		}
	}

	SWEP.wRenderOrder = nil

	function SWEP:DrawWorldModel()
		if not self.wRenderOrder then
			self.wRenderOrder = {}

			for k, v in pairs(self.Passport) do
				if v.type == "Model" then
					table.insert(self.wRenderOrder, 1, k)
				elseif v.type == "Quad" then
					table.insert(self.wRenderOrder, k)
				end
			end
		end

		if IsValid(self:GetOwner()) then
			bone_ent = self:GetOwner()
		else
			bone_ent = self
		end

		for k, name in pairs(self.wRenderOrder) do
			local v = self.Passport[name]

			if not v then
				self.wRenderOrder = nil
				break
			end

			if v.hide then continue end
			local pos, ang

			if v.bone then
				pos, ang = self:GetBoneOrientation(self.Passport, v, bone_ent)
			else
				pos, ang = self:GetBoneOrientation(self.Passport, v, bone_ent, "ValveBiped.Bip01_R_Hand")
			end

			if not pos then continue end
			local model = v.modelEnt

			if v.type == "Model" and IsValid(model) then
				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z)
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				model:SetAngles(ang)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix("RenderMultiply", matrix)

				if v.surpresslightning then
					render.SuppressEngineLighting(true)
				end

				render.SetColorModulation(v.color.r / 255, v.color.g / 255, v.color.b / 255)
				render.SetBlend(v.color.a / 255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)

				if v.surpresslightning then
					render.SuppressEngineLighting(false)
				end
			elseif v.type == "Quad" then
				if LocalPlayer():GetPos():Distance(self:GetPos()) >= 200 then return end
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * 0.08
				ang:RotateAroundAxis(ang:Up(), 180)
				cam.Start3D2D(drawpos, ang, 0.02)
				draw.SimpleText("Ім'я:", "PassHud2", 40, -50, Color(0, 0, 0, 255))
				draw.SimpleText(self:GetOwner():Name() or "Unknown", "PassHud", 40, -40, Color(0, 0, 0, 255))
				draw.SimpleText("Місце роботи:", "PassHud2", 40, -17, Color(0, 0, 0, 255))
				draw.SimpleText(cattbl[rp.Team[self:GetOwner():Team()].category] and 'Громадянин' or team.GetName(self:GetOwner():Team()) or "Unknown", "PassHud3", 40, -5, Color(0, 0, 0, 255))
				draw.SimpleText("Місто:", "PassHud2", 40, 15, Color(0, 0, 0, 255))
				--draw.SimpleText(GetHostName(), "PassHud3", 40, 30, Color(0, 0, 0, 255))
				draw.SimpleText('UkraineRP', "PassHud3", 40, 30, Color(0, 0, 0, 255))
				draw.SimpleText("<G<<<<<<<<<<<" .. self:GetOwner():SteamID() .. "<<<<", "PassHud2", -60, 60, Color(0, 0, 0, 200))
				draw.SimpleText("<G<<<2281337<<<<777<<<<06<<<<<<<<<<", "PassHud2", -60, 75, Color(0, 0, 0, 200))
				surface.SetDrawColor(255, 255, 255, 250)
				surface.SetMaterial(self.mat_ply)
				surface.DrawTexturedRect(-50, -42, 82, 82)
				cam.End3D2D()
			end
		end
	end

	function SWEP:GetBoneOrientation(basetab, tab, ent, bone_override)
		local bone, pos, ang

		if tab.rel and tab.rel ~= "" then
			local v = basetab[tab.rel]
			if not v then return end
			pos, ang = self:GetBoneOrientation(basetab, v, ent)
			if not pos then return end
			pos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)
		else
			bone = ent:LookupBone(bone_override or tab.bone)
			if not bone then return end
			pos, ang = Vector(0, 0, 0), Angle(0, 0, 0)
			local m = ent:GetBoneMatrix(bone)

			if m then
				pos, ang = m:GetTranslation(), m:GetAngles()
			end
		end

		return pos, ang
	end

	function SWEP:CreateModels(tab)
		if not tab then return end

		for k, v in pairs(tab) do
			if v.type == "Model" and v.model and v.model ~= "" and (not IsValid(v.modelEnt) or v.createdModel ~= v.model) and string.find(v.model, ".mdl") and file.Exists(v.model, "GAME") then
				v.modelEnt = ClientsideModel(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)

				if IsValid(v.modelEnt) then
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

	function table.FullCopy(tab)
		if not tab then return nil end
		local res = {}

		for k, v in pairs(tab) do
			if type(v) == "table" then
				res[k] = table.FullCopy(v) -- recursion ho!
			elseif type(v) == "Vector" then
				res[k] = Vector(v.x, v.y, v.z)
			elseif type(v) == "Angle" then
				res[k] = Angle(v.p, v.y, v.r)
			else
				res[k] = v
			end
		end

		return res
	end
end

function SWEP:PrimaryAttack()
end

function SWEP:SecondaryAttack()
end

function SWEP:Reload()
end

function SWEP:SetupValue()
	if not IsValid(self:GetOwner()) then return end
	if self:GetOwner():IsBot() then return end
	self.mat_ply = Material("spawnicons/" .. string.gsub(self:GetOwner():GetModel(), ".mdl", ".png"))
end

function SWEP:Holster()
	self:SetupValue()

	return true
end
--PATH addons/__main/lua/weapons/zekeou_shotty_base/cl_init.lua:
include('shared.lua')

SWEP.PrintName				= ""				// 'Nice' Weapon name (Shown on HUD)	
SWEP.Slot				= 4				// Slot in the weapon selection menu
SWEP.SlotPos				= 1				// Position in the slot
SWEP.DrawAmmo				= true				// Should draw the default HL2 ammo counter				// Should draw the default crosshair
SWEP.DrawWeaponInfoBox			= true				// Should draw the weapon info box
SWEP.BounceWeaponIcon   			= true				// Should the weapon icon bounce?
SWEP.CSMuzzleFlashes			= true
--PATH addons/__________scripts__loader/lua/entities/arierules/cl_init.lua:
include( 'shared.lua' )
function ENT:Initialize()
	self.BaseClass.Initialize( self )
	self.Rules = BOARDS.Rules[game.GetMap()]
	self.Speed = 0.3
	self.Mode = 0
	if #self.Rules > 12 then self.Mode = 1 end
	self.ToDraw = {}
	for i = 1, #self.Rules do
		table.insert( self.ToDraw, {
			rule = self.Rules[i],
			y = i * 40 + 35
		} )
	end

	if self.Mode == 1 then
		table.insert( self.ToDraw, {
			rule = '-',
			y = #self.Rules * 40 + 110
		} )
	end

	self.Min = 75
	self.Max = self.H - 50
	self.Last = self.Min - #self.Rules * 40
end

local FONT_TITLE = onyx.FontNoScale( 'Comfortaa Bold', 72 )
local FONT_TEXT = onyx.FontNoScale( 'Comfortaa SemiBold', 40 )
--
local renderDistance = 1024 ^ 2
local vectorOffset = Vector( 0, 0, 78 )
local vectorOffsetAnimated = Vector( 0, 0, 0 )
function ENT:Draw()
	local pos = self:GetPos() + vectorOffset + vectorOffsetAnimated
	--
	if pos:DistToSqr( LocalPlayer():GetPos() ) > renderDistance then return end
	--
	self.BaseClass.Draw( self )
	--
	local colorTextPrimary = self.theme.colors.textPrimary
	cam.Start3D2D( self.Pos, self.Ang, 0.2 )
	--
	draw.SimpleText( 'Правила', FONT_TITLE, self.W * 0.5, 0, colorTextPrimary, TEXT_ALIGN_CENTER )
	--
	if self.Mode == 0 then
		local y = 75
		for _, v in ipairs( self.Rules ) do
			onyx.hud.DrawCheapText( v, FONT_TEXT, 20, y, colorTextPrimary )
			y = y + 40
		end
	else
		for _, v in ipairs( self.ToDraw ) do
			if v.y < self.Min then
				v.y = v.y + self.Speed
				continue
			end

			if v.rule == '-' then
				onyx.hud.DrawRoundedBoxEx( 20, v.y, self.W - 40, 3, colorTextPrimary, false, false, false, false )
			else
				onyx.hud.DrawCheapText( v.rule, FONT_TEXT, 20, v.y, colorTextPrimary )
			end

			v.y = v.y + self.Speed
			if v.y > self.Max then v.y = self.Min - ( #self.Rules * 40 - v.y + 160 ) end
		end
	end

	cam.End3D2D()
end
--PATH addons/_farmer/lua/entities/ba_lowquality_meals/shared.lua:
ENT.Base = "base_gmodentity";
ENT.Type = "anim";

ENT.PrintName		= "Low Quality Meals";
ENT.Category 		= "Business: Animals";
ENT.Author			= "EnnX49";

ENT.Contact    		= "";
ENT.Purpose 		= "";
ENT.Instructions 	= "" ;

ENT.Spawnable			= true;
ENT.AdminSpawnable		= true;

--PATH gamemodes/darkrp/entities/entities/base_rp/shared.lua:
ENT.Type 				= 'anim'
ENT.Base				= 'base_anim' 
ENT.Category 			= 'RP'
ENT.Spawnable			= false

--[[
ENT.RemoceOnDisconnect 	= false
ENT.RemoveDelay 		= 300

ENT.RemoveOnJobChange 	= false

ENT.LazyFreeze 			= false
ENT.AllLazyFreeze 		= false

ENT.MaxHealth 			= 100
ENT.ExplodeOnRemove 	= false

ENT.SeizeReward 		= 100
ENT.WantReason 			= 'Some illagel item'

ENT.MinPrice 			= 1
ENT.MaxPrice 			= 5
]]
--PATH addons/battlepass/lua/entities/battlepass_npc/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_ai"
ENT.Type = "ai"
ENT.PrintName = "Battle Pass NPC"
ENT.Author = "sleeppyy"
ENT.Category = "Xenin"
ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:SetAutomaticFrameAdvance(bUsingAnim)
	self.AutomaticFrameAdvance = bUsingAnim
end
--PATH addons/_bitminers2/lua/entities/bm2_bitminer_2/shared.lua:
ENT.Type = "anim"
ENT.PrintName = "Bitminer 2"
ENT.Spawnable = true
ENT.Category = "Bitminers"
ENT.upgrades = {
	CPU = {
		name = "CPU Speed +256MHz",
		cost = { 2000, 4000, 5500, 8000, 12000, 18000, 20000 },
		amountPerUpgrade = 0.756
	},
	CORES = {
		name = "Adds an extra core",
		cost = { 15000, 19000, 22000 }
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
	self:NetworkVar( "Entity", 0, "owning_ent" )
end
--PATH addons/_bitminers2/lua/entities/bm2_bitminer_rack/cl_init.lua:
include( "shared.lua" )
local function __round( num, numDecimalPlaces )
	local mult = 10 ^ ( numDecimalPlaces or 0 )
	return math.floor( num * mult + 0.5 ) / mult
end

--Animate fan(s)
function ENT:Think()
	if LocalPlayer():GetPos():Distance( self:GetPos() ) < 500 then
		if self:GetIsMining() then
			self.fanAng = self.fanAng + FrameTime() * 400
			for i = 0, self:GetBoneCount() - 1 do
				if string.match( self:GetBoneName( i ), "fan" ) ~= nil then self:ManipulateBoneAngles( i, Angle( self.fanAng, 0, 0 ) ) end
			end
		end

		if self.prev ~= self:GetIsMining() then
			self:DestroyShadow()
			self:CreateShadow()
		end

		self.prev = self:GetIsMining()
	end
end

--Yuck I know but its to much effort to re-write the entire system
function ENT:Initialize()
	self.fanAng = 0
	self.prev = false
	--So each bitminer can have its own set of unique instructions. This is how we will do that
	self.customInstructions = {
		status = {
			--Outputs usefull runtime infomation
			command = "STATUS",
			description = "Outputs usefull infomation about the current device.",
			action = function( _, _, _, ent, consoleDisplay )
				consoleDisplay.history = consoleDisplay.history .. "\n------------------STATUS------------------\n"
				local firstPart = "IS MINING                                 "
				local secondPart = string.upper( tostring( ent:GetIsMining() ) )
				consoleDisplay.history = consoleDisplay.history .. string.sub( firstPart, 1, string.len( firstPart ) - string.len( secondPart ) ) .. secondPart .. "\n"
				firstPart = "HAS POWER                                 "
				secondPart = string.upper( tostring( ent:GetHasPower() ) )
				consoleDisplay.history = consoleDisplay.history .. string.sub( firstPart, 1, string.len( firstPart ) - string.len( secondPart ) ) .. secondPart .. "\n"
				consoleDisplay.history = consoleDisplay.history .. "------------------------------------------\n\n"
			end
		},
		info = {
			command = "INFO",
			description = "Outputs sepcifications for the device such as power usage.",
			action = function( _, _, _, ent, consoleDisplay )
				consoleDisplay.history = consoleDisplay.history .. "\n-------------------INFO------------------\n"
				local serverTable = util.JSONToTable( self:GetConnectedServers() )
				local serverCount = 0
				for i = 1, 8 do
					if serverTable[i] == true then serverCount = serverCount + 1 end
				end

				consoleDisplay.history = consoleDisplay.history .. "SERVER COUNT                            " .. serverCount .. "\n"
				local firstPart = "CLOCK SPEED                              "
				local secondPart = tostring( __round( ent:GetClockSpeed(), 3 ) ) .. "Ghz"
				consoleDisplay.history = consoleDisplay.history .. string.sub( firstPart, 1, string.len( firstPart ) - string.len( secondPart ) ) .. secondPart .. "\n"
				local firstPart = "CORES                                    "
				local secondPart = ent:GetCoreCount()
				consoleDisplay.history = consoleDisplay.history .. string.sub( firstPart, 1, string.len( firstPart ) - string.len( secondPart ) ) .. secondPart .. "\n"
				consoleDisplay.history = consoleDisplay.history .. "POWER REQUIREMENT          100-800W (MAX)\n"
				consoleDisplay.history = consoleDisplay.history .. "MODEL NAME                  Bitminer Rack\n"
				local playerName = self:Getowning_ent()
				if playerName ~= NULL then
					playerName = playerName:Name()
				else
					playerName = "Unknown"
				end

				consoleDisplay.history = consoleDisplay.history .. string.sub( "OWNER                                    ", 1, string.len( "OWNER                                    " ) - string.len( playerName ) ) .. playerName .. "\n"
				consoleDisplay.history = consoleDisplay.history .. "-----------------------------------------\n\n"
			end
		},
		mining = {
			command = "MINING",
			description = "Starts or stop the miner from mining.",
			action = function( arg1, _, _, ent, consoleDisplay )
				if arg1 == nil then
					consoleDisplay.history = consoleDisplay.history .. "To use this command please supply one of the following arguments, 'mining start' or 'mining stop'\n"
				elseif arg1 == "start" then
					net.Start( "BM2.Command.Mining" )
					net.WriteEntity( ent )
					net.WriteBool( true )
					net.SendToServer()
				elseif arg1 == "stop" then
					net.Start( "BM2.Command.Mining" )
					net.WriteEntity( ent )
					net.WriteBool( false )
					net.SendToServer()
				else
					consoleDisplay.history = consoleDisplay.history .. "The option '" .. arg1 .. "' is not a valid option, the options are 'mining start' or 'mining stop'\n"
				end
			end
		},
		bitcoin = {
			--Used for selling or getting info about bitcoins
			command = "BITCOIN",
			description = "Allows you to sell or see infomation about the stored bitcoins.",
			action = function( arg1, _, _, ent, consoleDisplay )
				if arg1 == "info" then
					consoleDisplay.history = consoleDisplay.history .. "\n-------------------BITCOIN------------------\n"
					local firstPart = "Bitcoin Amount                              "
					local secondPart = comma_value( __round( ent:GetBitcoinAmount(), 2 ) ) .. "btc"
					consoleDisplay.history = consoleDisplay.history .. string.sub( firstPart, 1, string.len( firstPart ) - string.len( secondPart ) ) .. secondPart .. "\n"
					firstPart = "Bitcoin Value ($)                           "
					secondPart = tostring( comma_value( __round( ent:GetBitcoinAmount() * BM2CONFIG.BitcoinValue, 2 ) ) )
					consoleDisplay.history = consoleDisplay.history .. string.sub( firstPart, 1, string.len( firstPart ) - string.len( secondPart ) ) .. secondPart .. "\n"
					consoleDisplay.history = consoleDisplay.history .. "--------------------------------------------\n\n"
				elseif arg1 == "sell" then
					net.Start( "BM2.Command.SellBitcoins" )
					net.WriteEntity( ent )
					net.SendToServer()
					local firstPart = "From                                        "
					local secondPart = tostring( comma_value( __round( ent:GetBitcoinAmount(), 2 ) ) ) .. "btc"
					consoleDisplay.history = consoleDisplay.history .. "\n-------------------RECEIPT------------------\n"
					consoleDisplay.history = consoleDisplay.history .. string.sub( firstPart, 1, string.len( firstPart ) - string.len( secondPart ) ) .. secondPart .. "\n"
					firstPart = "Convereted to                               "
					secondPart = "$" .. tostring( comma_value( __round( ent:GetBitcoinAmount() * BM2CONFIG.BitcoinValue, 2 ) ) )
					consoleDisplay.history = consoleDisplay.history .. string.sub( firstPart, 1, string.len( firstPart ) - string.len( secondPart ) ) .. secondPart .. "\n"
					consoleDisplay.history = consoleDisplay.history .. "The money has been transfered to your wallet\n"
					consoleDisplay.history = consoleDisplay.history .. "--------------------------------------------\n\n"
				else
					if arg1 == nil then
						consoleDisplay.history = consoleDisplay.history .. "To use this command please supply one of the following arguments, 'bitcoin info' or 'bticoin sell'\n"
					else
						consoleDisplay.history = consoleDisplay.history .. "The option '" .. arg1 .. "' is not a valid option, the options are 'bitcoin info' or 'bticoin sell'\n"
					end
				end
			end
		},
		upgrade = {
			--Used for selling or getting info about bitcoins
			command = "UPGRADE",
			description = "Shows available upgrades and allows you to purchase them.",
			action = function( arg1, _, _, ent, consoleDisplay )
				if arg1 == "1" then --CPU
					net.Start( "BM2.Command.Upgrade" )
					net.WriteEntity( ent )
					net.WriteBool( false )
					net.SendToServer()
				elseif arg1 == "2" then
					--Cores
					net.Start( "BM2.Command.Upgrade" )
					net.WriteEntity( ent )
					net.WriteBool( true )
					net.SendToServer()
				else
					if arg1 == nil then
						consoleDisplay.history = consoleDisplay.history .. "\n-------------------UPGRADES------------------\n"
						local i = 0
						if self.upgrades.CPU.cost[self:GetCPUUpgrade() + 1] ~= nil then
							i = i + 1
							firstPart = "[1] " .. self.upgrades.CPU.name .. "                                                              "
							secondPart = "                                             "
							thirdtPart = "$" .. comma_value( self.upgrades.CPU.cost[self:GetCPUUpgrade() + 1] )
							local str = string.sub( firstPart, 0, string.len( secondPart ) )
							consoleDisplay.history = consoleDisplay.history .. string.sub( str, 1, string.len( str ) - string.len( thirdtPart ) ) .. thirdtPart .. "\n"
						end

						if self.upgrades.CORES.cost[self:GetCoreUpgrade() + 1] ~= nil then
							i = i + 1
							firstPart = "[2] " .. self.upgrades.CORES.name .. "                                                              "
							secondPart = "                                             "
							thirdtPart = "$" .. comma_value( self.upgrades.CORES.cost[self:GetCoreUpgrade() + 1] )
							local str = string.sub( firstPart, 0, string.len( secondPart ) )
							consoleDisplay.history = consoleDisplay.history .. string.sub( str, 1, string.len( str ) - string.len( thirdtPart ) ) .. thirdtPart .. "\n"
						end

						if i == 0 then consoleDisplay.history = consoleDisplay.history .. "There are no more upgrade left for this device.\n" end
						consoleDisplay.history = consoleDisplay.history .. "---------------------------------------------\nType 'upgrade 1' or 'upgrade 2' to select one.\n"
					else
						consoleDisplay.history = consoleDisplay.history .. "The option '" .. arg1 .. "' is not a valid option, the options are 'upgrade 1' or 'upgrade 2'\n"
					end
				end
			end
		},
		eject = {
			command = "EJECT",
			description = "Ejects a server from the rack",
			action = function( arg1, _, _, ent, consoleDisplay )
				if arg1 == nil then
					consoleDisplay.history = consoleDisplay.history .. "To use this command please supply a server to eject, e.g 'eject 4'\n"
				elseif isnumber( tonumber( arg1 ) ) then
					net.Start( "BM2.Command.Eject" )
					net.WriteEntity( ent )
					net.WriteInt( tonumber( arg1 ), 8 )
					net.SendToServer()
				else
					consoleDisplay.history = consoleDisplay.history .. "The option '" .. arg1 .. "' is not a valid option, the options are 'eject 1-8'\n"
				end
			end
		},
		servers = {
			command = "SERVERS",
			description = "Outputs a list of server in the rack.",
			action = function( _, _, _, _, consoleDisplay )
				local servers = util.JSONToTable( self:GetConnectedServers() )
				consoleDisplay.history = consoleDisplay.history .. "\n-------------------SERVERS------------------\n"
				for i = 1, 8 do
					local firstPart = "#" .. i .. "                                          "
					secondPart = "EMPTY"
					if servers[i] then secondPart = "INSERTED" end
					consoleDisplay.history = consoleDisplay.history .. string.sub( firstPart, 1, string.len( firstPart ) - string.len( secondPart ) ) .. secondPart .. "\n"
				end

				consoleDisplay.history = consoleDisplay.history .. "--------------------------------------------\n"
			end
		},
	}

	--Only add if DLC is loaded
	if BITMINERS_2_EXTRAS_DLC then
		self.customInstructions.remote = {
			command = "REMOTE",
			description = "Allows you to install and uninstall and change the name of a remote access module that will allow you to access the bitminer remotely using " .. BM2EXTRACONFIG.RemoteAccessCommand .. ". Installing it costs $" .. string.Comma( BM2EXTRACONFIG.RemoteAccessPrice ) .. ".",
			action = function( arg1, arg2, _, ent, consoleDisplay )
				if arg1 == "install" then
					net.Start( "BM2.Command.RemoteInstall" )
					net.WriteEntity( ent )
					net.WriteBool( true )
					net.SendToServer()
					ent.remoteName = math.random( 10, 99 ) .. "." .. math.random( 100, 800 ) .. "." .. math.random( 10, 99 ) .. "." .. math.random( 100, 800 )
				elseif arg1 == "remove" then
					net.Start( "BM2.Command.RemoteInstall" )
					net.WriteEntity( ent )
					net.WriteBool( false )
					net.SendToServer()
				elseif arg1 == "setname" then
					local _string = arg2 or math.random( 10, 99 ) .. "." .. math.random( 100, 800 ) .. "." .. math.random( 10, 99 ) .. "." .. math.random( 100, 800 )
					ent.remoteName = _string
					consoleDisplay.history = consoleDisplay.history .. "Remote name changed to '" .. _string .. "'\n"
				else
					if arg1 == nil then
						consoleDisplay.history = consoleDisplay.history .. "---------------------------------------------\nType 'REMOTE INSTALL' to install the remote module. Installing costs $" .. string.Comma( BM2EXTRACONFIG.RemoteAccessPrice ) .. " and allows to bitminer to be remotely access using " .. BM2EXTRACONFIG.RemoteAccessCommand .. "\nType 'REMOTE REMOVE' to uninstall the remote module.\nType 'REMOTE SETNAME ExampleName' to change the remote name of the bitminer. The name cannot contain spaces!\n"
					else
						consoleDisplay.history = consoleDisplay.history .. "The option '" .. arg1 .. "' is not a valid option, the options are 'install', 'setname' or 'remove'\n"
					end
				end
			end
		}
	end
end

function ENT:Draw()
	self:DrawModel()
end
--PATH addons/_bitminers2ex/lua/entities/bm2_extra_fuel_tank/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Fuel Tank"
ENT.Spawnable = true
ENT.Category = "Bitminers"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT
function ENT:SetupDataTables()
	self:NetworkVar( "Bool", 3, "ShowNoFuelWarning" )
	self:NetworkVar( "Int", 0, "FuelLevel" )
end
--PATH addons/_bitminers2/lua/entities/bm2_generator/cl_init.lua:
include( "shared.lua" )

local fuelMaterial = onyx.wimg.Simple( "https://i.imgur.com/y4deo3q.png", "noclamp smooth" )
local outputMaterial = onyx.wimg.Simple( "https://i.imgur.com/CQKnDbD.png", "noclamp smooth" )
local warningMaterial = onyx.wimg.Simple( "https://i.imgur.com/bzOFQpr.png", "noclamp smooth" )
local function __round( num, numDecimalPlaces )
	local mult = 10 ^ ( numDecimalPlaces or 0 )
	return math.floor( num * mult + 0.5 ) / mult
end

local col3 = Color( 255, 80, 80 )
function ENT:DrawTranslucent()
	self:DrawModel()
	if LocalPlayer():GetPos():Distance( self:GetPos() ) < 350 then
		if self.cam2d3dAng == nil then
			self.cam2d3dAng = Angle( 0, LocalPlayer():GetAngles().y - 90, 90 )
		else
			self.cam2d3dAng = LerpAngle( 7 * FrameTime(), self.cam2d3dAng, Angle( 0, LocalPlayer():GetAngles().y - 90, 90 ) )
		end

		--Cam 2D3D for drawing infomation
		local ang = self:GetAngles()
		local pos = self:GetPos() + Vector( 0, 0, 40 ) - ang:Forward() * 5 + ang:Up() * 20
		local alpha = 1 - math.Clamp( LocalPlayer():GetPos():Distance( self:GetPos() ) / 350 * 1.1, 0, 1 )
		cam.Start3D2D( pos, self.cam2d3dAng, 0.05 )
		if not self:GetShowToMuchPowerWarning() then
			if not self:GetShowNoFuelWarning() then
				local col1 = Color( 200, 200, 0, 255 * alpha )
				local col2 = Color( 255, 165, 0, 255 * alpha )
				draw.RoundedBox( 8, -200, -10, 410, 70 * 2 + 10, Color( 0, 0, 0, 100 * alpha ) )
				outputMaterial( -200 + 4, 4, 64 - 8, 64 - 8, col1 )
				fuelMaterial( -200 + 4, 70 + 4, 64 - 8, 64 - 8, col2 )
				--Draw power ussage bar
				draw.RoundedBox( 4, -200 + 70, 4, 400 - 70, 60 - 8, Color( 36, 36, 36, 255 * alpha ) )
				draw.RoundedBox( 2, -200 + 70 + 2, 4 + 2, 400 - 70 - 4, 60 - 8 - 4, Color( 15, 15, 15, 255 * alpha ) )
				if self:GetPowerConsumpsion() > 0 then draw.RoundedBox( 2, -200 + 70 + 2, 4 + 2, ( 400 - 70 - 4 ) * self:GetPowerConsumpsion() / BM2CONFIG.GeneratorPowerOutput, 60 - 8 - 4, Color( 200, 200, 0, 255 * alpha ) ) end
				local powerLevel = __round( self:GetPowerConsumpsion(), 2 )
				draw.SimpleText( powerLevel * 100 .. "/" .. BM2CONFIG.GeneratorPowerOutput * 100 .. "W", onyx.FontNoScale( "Comfortaa", 40 ), 45, ( 60 - 8 - 4 ) * 0.5 + 6, Color( 0, 0, 0, 255 * alpha ), 1, 1 )
				draw.SimpleText( powerLevel * 100 .. "/" .. BM2CONFIG.GeneratorPowerOutput * 100 .. "W", onyx.FontNoScale( "Comfortaa", 40 ), 44, ( 60 - 8 - 4 ) * 0.5 + 5, Color( 255, 255, 255, 255 * alpha ), 1, 1 )
				draw.RoundedBox( 4, -200 + 70, 4 + 70, 400 - 70, 60 - 8, Color( 36, 36, 36, 255 * alpha ) )
				draw.RoundedBox( 2, -200 + 70 + 2, 4 + 2 + 70, 400 - 70 - 4, 60 - 8 - 4, Color( 15, 15, 15, 255 * alpha ) )
				draw.RoundedBox( 2, -200 + 70 + 2, 4 + 2 + 70, ( 400 - 70 - 4 ) * self:GetFuelLevel() / 1000, 60 - 8 - 4, Color( 255, 165, 0, 255 * alpha ) )
				draw.SimpleText( self:GetFuelLevel() .. "/1000 L", onyx.FontNoScale( "Comfortaa", 40 ), 45, ( 60 - 8 - 4 ) * 0.5 + 6 + 70, Color( 0, 0, 0, 255 * alpha ), 1, 1 )
				draw.SimpleText( self:GetFuelLevel() .. "/1000 L", onyx.FontNoScale( "Comfortaa", 40 ), 44, ( 60 - 8 - 4 ) * 0.5 + 5 + 70, Color( 255, 255, 255, 255 * alpha ), 1, 1 )
			else
				warningMaterial( -80, -20, 160, 160, col3 )
				draw.SimpleText( "Out of fuel!", onyx.FontNoScale( "Comfortaa", 40 ), 0, 170, Color( 0, 0, 0, 255 ), 1, 1 )
				draw.SimpleText( "Out of fuel!", onyx.FontNoScale( "Comfortaa", 40 ), -1, 170 - 1, Color( 255, 255, 255, 255 ), 1, 1 )
				draw.SimpleText( "Please purchase some fuel.", onyx.FontNoScale( "Comfortaa", 40 ), 0, 170 + 35, Color( 0, 0, 0, 255 ), 1, 1 )
				draw.SimpleText( "Please purchase some fuel.", onyx.FontNoScale( "Comfortaa", 40 ), -1, 170 - 1 + 35, Color( 255, 255, 255, 255 ), 1, 1 )
			end
		else
			warningMaterial( -80, -20, 160, 160 )
			draw.SimpleText( "You are using to much power!", onyx.FontNoScale( "Comfortaa", 40 ), 0, 170, Color( 0, 0, 0, 255 ), 1, 1 )
			draw.SimpleText( "You are using to much power!", onyx.FontNoScale( "Comfortaa", 40 ), -1, 170 - 1, Color( 255, 255, 255, 255 ), 1, 1 )
			draw.SimpleText( "Please disconnect some devices or find anouther power source.", onyx.FontNoScale( "Comfortaa", 40 ), 0, 170 + 35, Color( 0, 0, 0, 255 ), 1, 1 )
			draw.SimpleText( "Please disconnect some devices or find anouther power source.", onyx.FontNoScale( "Comfortaa", 40 ), -1, 170 - 1 + 35, Color( 255, 255, 255, 255 ), 1, 1 )
		end

		cam.End3D2D()
	end
end
--PATH addons/_doctor/lua/entities/bp_chemical_17alph/shared.lua:
ENT.Type = "anim"
ENT.Base = "bp_base"

ENT.PrintName = "17 Alpha-Methyltestosterone"
ENT.Spawnable = true
ENT.Category = "Blue's Pharmaceuticals"

ENT.RenderGroup = RENDERGROUP_BOTH

ENT.ChemicalID = 7


function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "LiquidAmount")
end
--PATH addons/_doctor/lua/entities/bp_chemical_keto_acid/cl_init.lua:
include("shared.lua")

local levelIcon = Material("blues_pharm/ui/level.png", "smooth")
local titleIcon = Material("blues_pharm/ui/title.png", "smooth")

function ENT:Draw()
	self:DrawModel()
end

function ENT:DrawTranslucent()
	if self:GetPos():DistToSqr(LocalPlayer():GetPos()) > BLUES_PHARMA.CONFIG.Cam3D2DRenderDist  then return end

	local ang = self:GetAngles()
	local pos = self:GetPos() + (ang:Up() * 6)

	local ang1 = self:WorldToLocalAngles((LocalPlayer():EyePos() - pos):Angle())
	local ang2 = self:LocalToWorldAngles(Angle(0, ang1.y + 90, 90))

	cam.Start3D2D(pos, ang2, 0.05)
		surface.SetMaterial(titleIcon)
		surface.SetDrawColor(Color(255, 255, 255, 255))
		surface.DrawTexturedRect(-140, -270, 280, 65)

		draw.RoundedBox(0, -140, -270, 20, 400, Color(43, 43, 43))

		draw.SimpleText(BLUES_PHARMA.Chemicals[self.ChemicalID].name, "BP_Chemical_Title",  -115, -270, Color(255, 255, 255), 0, 0)

		surface.SetMaterial(levelIcon)
		surface.SetDrawColor(Color(255, 255, 255, 60))
		surface.DrawTexturedRect(-115, -240, 32, 32)

		draw.SimpleText(self:GetLiquidAmount().."ml", "BP_Chemical_Amount",  -80, -240, Color(255, 255, 255, 60), 0, 0)
	cam.End3D2D()
end
--PATH addons/_doctor/lua/entities/bp_chemical_sele/shared.lua:
ENT.Type = "anim"
ENT.Base = "bp_base"

ENT.PrintName = "Selenium Dioxide"
ENT.Spawnable = true
ENT.Category = "Blue's Pharmaceuticals"

ENT.RenderGroup = RENDERGROUP_BOTH

ENT.ChemicalID = 5


function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "LiquidAmount")
end
--PATH addons/_doctor/lua/entities/bp_pill_market/shared.lua:
ENT.Base = "base_ai"
ENT.Type = "ai"
ENT.PrintName = "Pill Market"
ENT.Author = "<CODE BLUE>"
ENT.Contact = "Via Steam"
ENT.Spawnable = true
ENT.Category = "Blue's Pharmaceuticals"
ENT.AdminSpawnable = true
ENT.AutomaticFrameAdvance = true

function ENT:SetAutomaticFrameAdvance( anim )
	self.AutomaticFrameAdvance = anim
end 
--PATH addons/_doctor/lua/entities/bp_pill_press/cl_init.lua:
include("shared.lua")

function ENT:Initialize()
	-- 0-1 of animation
	self.animationProgress = 0
	self.currentAngle = 0
	self.animating = false
	self.lerpedPercent = 0

	self.csModel = ClientsideModel("models/blues_pharm/pill_bottle.mdl")
	if not IsValid(self.csModel) then return end
	self.csModel:SetNoDraw(true)

	self.pillCSModel = ClientsideModel("models/blues_pharm/pill.mdl")
	if not IsValid(self.pillCSModel) then return end
	self.pillCSModel:SetColor(Color(255,120,50))
	self.pillCSModel:SetNoDraw(true)
end 


--2 = WHEEL
function ENT:SetAnimationAng(ang)
	self:ManipulateBoneAngles(2, Angle(-ang,0,0))

	self:ManipulateBonePosition(1, LerpVector((math.sin(math.rad(ang - 90))+ 1) * 0.5,Vector(0,0,0), Vector(0,0,-7.9)))
	--self:ManipulateBoneAngles(3, Angle(ang,0,0))
end

function ENT:Think()
	--When changing settings
	if not IsValid(self.csModel) then
		self.csModel = ClientsideModel("models/blues_pharm/pill_bottle.mdl")
		self.pillCSModel = ClientsideModel("models/blues_pharm/pill.mdl")
	end

	if self.currentAngle < (self:GetAnimationAngle() * 360) then
		self.animationProgress = (self.currentAngle % 360) / 360
		self.currentAngle = math.Clamp(self.currentAngle + ( 200 * FrameTime()), 0, self:GetAnimationAngle() * 360)
		self:SetAnimationAng(self.currentAngle)
	else
		self.animationProgress = 0
	end
end
 
function ENT:Draw()
	self:DrawModel()
	--self:SetAnimationAng(CurTime() * 100)

	if self:GetRecipeID() >= 0 then
		
		local ang = self:GetAngles()
		local pos = self:GetPos() + (ang:Up() * 38) + (ang:Forward() * -15.8)
		
		if IsValid(self.csModel) then
			self.csModel:SetPos(self:GetPos() + (ang:Forward() * 6) + (ang:Right() * 6) + (ang:Up() * 3.2))
			self.csModel:SetAngles(ang)
			self.csModel:DrawModel()
		end


		local vec1 = self:GetPos() + (ang:Up() * 3) + (ang:Forward() * -0.1) + (ang:Up() * -0.1)
		local vec2 = self:LocalToWorld(Vector(6, -6, 10))
		local vec3 = BLUES_PHARMA:CalcCubicSpline(vec1, LerpVector(0.5, vec1, vec2) + (ang:Up() * 10), vec2, math.Clamp((self.animationProgress-0.75) * 4, 0, 1))

		if IsValid(self.pillCSModel) then
			self.pillCSModel:SetPos(vec3)
			self.pillCSModel:SetAngles(ang + Angle(-90,0,0))

			if self.animationProgress > 0.5 then
				self.pillCSModel:DrawModel()
			end
		end

		ang:RotateAroundAxis(ang:Right(), -90)
		ang:RotateAroundAxis(ang:Up(), 90)

		--Get the dot of the player, don't render if there behind
		local playerPos = LocalPlayer():GetPos() - self:GetPos()
		local ourPos = self:GetAngles():Forward()
		local dot = playerPos:Dot(ourPos:GetNormalized())

		if self:GetPos():DistToSqr(LocalPlayer():GetPos()) > BLUES_PHARMA.CONFIG.Cam3D2DRenderDist  then return end

		if dot > -13.6 then
			--Backdrop
			cam.Start3D2D(pos, ang, 0.03)
				draw.RoundedBox(0, -280, 0, 60, 1180, Color(43, 43, 43))
				draw.RoundedBox(0, 280 - 60, 0, 60, 1180, Color(43, 43, 43))	

				draw.RoundedBoxEx(32, -280, -100, 560, 200, Color(43, 43, 43), true, true, false, false)

				draw.SimpleText(BLUES_PHARMA.Medicines[self:GetRecipeID()].name, "BP_Chemical_UI_Name3",  0, -100, Color(255, 255, 255), 1, 0)
				draw.SimpleText("Press 'E' to press pills", "BP_Chemical_UI_Name",  0, -25, Color(255, 255, 255, 25), 1, 0)

				draw.RoundedBox(0, -220, 30, 440, 50, Color(255,255,255, 10))
				draw.RoundedBox(0, -220 + 4, 30 + 4, 440 - 8, 50 - 8, Color(20,20,20))

				self.lerpedPercent = Lerp(5 * FrameTime(), self.lerpedPercent, self:GetPressedAmount() / 100)
				local color = BLUES_PHARMA:LerpColor(Color(255,50,30, 80), Color(50,205,50, 80), self.lerpedPercent)

				draw.RoundedBox(0, -220 + 4, 30 + 4, (440 - 8) * self.lerpedPercent, 50 - 8, color)
			cam.End3D2D()
		end	
	end
end

function ENT:OnRemove()
	if IsValid(self.csModel) then
		self.csModel:Remove()
	end
	if IsValid(self.pillCSModel) then
		self.pillCSModel:Remove()
	end
end
--PATH addons/_ballistic_shields/lua/ballistic_shields/cl_bs_util.lua:
if SERVER then return end
include( "bs_config.lua" )
net.Receive( "bs_shield_info", function() LocalPlayer().bs_shieldIndex = net.ReadUInt( 16 ) end )
local Delay = 0
function bshields_materials_reload()
	for _, v in pairs( bshields.materialstoload ) do
		Delay = Delay + 0.2
		timer.Simple( Delay, function() surface.GetURL( v[1], v[2], v[3] ) end )
	end

	bshields.hshield_webmat = surface.GetURL( bshields.config.hShieldTexture, 256, 256 )
	bshields.rshield_webmat = surface.GetURL( bshields.config.rShieldTexture, 256, 256 )
	bshields.dshield_webmat = surface.GetURL( bshields.config.dShieldTexture, 256, 256 )
end

bshields.materialstoload = { { bshields.config.hShieldTexture, 256, 256 }, { bshields.config.rShieldTexture, 256, 256 }, { bshields.config.dShieldTexture, 256, 256 } }
hook.Add( "InitPostEntity", "bshields_init_client", function() bshields_materials_reload() end )
--PATH gamemodes/darkrp/entities/entities/disgue/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "[Police] Arrest"
ENT.Author = "Jerivssss"
ENT.Spawnable = true
ENT.AdminSpawnable = true 
ENT.Category = "RP"

--PATH addons/_drones/lua/entities/dronesrewrite_ai_healer/shared.lua:
ENT.Base = "base_anim"
ENT.Type = "anim"
ENT.PrintName = "btn"
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.Category = ""

--PATH addons/_drones/lua/entities/dronesrewrite_artillerymain/shared.lua:
ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Artillery Drone"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.AdminOnly = true
ENT.UNIT = "ARTM"

ENT.SpawnHeight = 150
ENT.Weight = 6000

ENT.HackValue = 5
ENT.ImmuneToJammer = true

ENT.Model = "models/dronesrewrite/artillerymain/artillerymain.mdl"

ENT.HealthAmount = 2000
ENT.DefaultHealth = 2000

ENT.ExplosionForce = 100
ENT.ExplosionAngForce = 0.01
ENT.DoExplosionEffect = "splode_big_drone_main"

ENT.FirstPersonCam_pos = Vector(215, 0, 20)
ENT.ThirdPersonCam_distance = 400
ENT.RenderCam = false

ENT.NoiseCoefficient = 0.1

ENT.Alignment = 0 --1.6
ENT.AlignmentRoll = 0.4
ENT.AlignmentPitch = 2

ENT.AngOffset = 1.3

ENT.SprintCoefficient = 2
ENT.Speed = 90000
ENT.UpSpeed = 500000
ENT.RotateSpeed = 2

ENT.Fuel = 800
ENT.MaxFuel = 800
ENT.FuelReduction = 0.6

ENT.PitchOffset = 0.01

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.AllowYawRestrictions = true
ENT.YawMin = -80
ENT.YawMax = 80
ENT.PitchMin = -60

ENT.Sounds = {
	PropellerSound = {
		Name = "ambient/machines/laundry_machine1_amb.wav",
		Pitch = 85,
		Level = 90,
		NoPitchChanges = true
	},
	
	ExplosionSound = {
		Name = "ambient/explosions/explode_8.wav",
		Level = 100,
		Pitch = 90
	}
}

ENT.NoPropellers = true
ENT.Propellers = {
	Model = "models/props_junk/PopCan01a.mdl",
	Info = { Vector(0, 0, 0) }
}

ENT.Attachments = {
	["Cannon"] = {
		Pos = Vector(0, 0, -35)
	}
}

ENT.Weapons = {
	["Artillery Cannon"] = {
		Name = "Artillery Cannon",
		Attachment = "Cannon"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()
--PATH addons/_drones/lua/entities/dronesrewrite_balltur/cl_init.lua:
include("shared.lua")

--PATH addons/_drones/lua/entities/dronesrewrite_bl2_laser_sm.lua:
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
			dlight.g = 0
			dlight.b = 255
			dlight.brightness = 1
			dlight.Decay = 1000
			dlight.Size = 150
			dlight.DieTime = CurTime() + 0.3
		end	

		render.SetMaterial(Material("particle/particle_glow_04_additive"))

		local color = Color(0, 0, 255, 255)
		local xs = 18
		
		render.DrawSprite(self:GetPos() - self:GetForward() * 12, xs, xs, color)
		render.DrawSprite(self:GetPos() - self:GetForward() * 6, xs, xs, color)
		render.DrawSprite(self:GetPos(), xs, xs, color)
		render.DrawSprite(self:GetPos() + self:GetForward() * 6, xs, xs, color)
		render.DrawSprite(self:GetPos() + self:GetForward() * 12, xs, xs, color)

		self:DrawModel()
	end
end
--PATH addons/_drones/lua/entities/dronesrewrite_console/shared.lua:
ENT.Base = "base_anim"
ENT.Type = "anim"
ENT.PrintName = "Console"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite Tools"

ENT.Useable = true
ENT.Hp = 120
ENT.MaxSymbols = 65

function ENT:ChangeLine(newstr, line)
	local line = line or #self.Cache
	local oldstr = self.Cache[line]

	if not oldstr then return end

	local max = self.MaxSymbols
	local len = string.len(newstr)

	oldstr.Text = string.sub(newstr, 0, max)

	if len > max then
		local newstr = string.sub(newstr, max + 1)
		self:AddLine(newstr, oldstr.Color, line + 1)
	end
end

function ENT:AddLine(str, color, pos)
	if CLIENT then
		if not self.Cache then self.Cache = { } end

		table.insert(self.Cache, pos or #self.Cache + 1, { Text = "", Color = color or Color(255, 255, 255) })
		self:ChangeLine(str)
	else
		color = color or Color(255, 255, 255)

		net.Start("dronesrewrite_addline")
			net.WriteEntity(self)
			net.WriteString(str)
			net.WriteColor(color)
		net.Broadcast()
	end
end

--PATH addons/_drones/lua/entities/dronesrewrite_drrwalker/shared.lua:
ENT.Base = "dronesrewrite_base"
ENT.DrrBaseType = "walker"
ENT.Type = "anim"
//ENT.PrintName = "DW 'Walker'"
ENT.PrintName = "Walker Drone"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "DW"

ENT.Model = "models/dronesrewrite/missiledrone/missiledrone.mdl" -- Totally not missile

ENT.Weight = 4000
ENT.SpawnHeight = 32

ENT.OverlayName = "No Overlay"
ENT.HUD_hudName = "White Box"

ENT.AI_AllowDown = false
ENT.AI_AllowUp = false

ENT.FirstPersonCam_pos = Vector(27, 0, 139)
ENT.ThirdPersonCam_pos = Vector(0, 0, 200)
ENT.ThirdPersonCam_distance = 260
ENT.RenderCam = false

ENT.Speed = 100000
ENT.SprintCoefficient = 1
ENT.RotateSpeed = 6
ENT.PitchOffset = 0
ENT.Hover = 116
ENT.AngOffset = 4

ENT.HackValue = 3

ENT.ExplosionForce = 2
ENT.ExplosionAngForce = 0
ENT.DoExplosionEffect = "splode_big_drone_main"

ENT.AllowPitchRestrictions = true
ENT.PitchMin = -90
ENT.PitchMax = 50

ENT.AllowYawRestrictions = true
ENT.YawMin = -70
ENT.YawMax = 70

ENT.NoiseCoefficient = 5

ENT.Fuel = 500
ENT.MaxFuel = 500
ENT.FuelReduction = 6

ENT.WaitForSound = 0.47

ENT.Slip = 170
ENT.AngSlip = 0.03

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()
ENT.KeysFuncs.Physics["Up"] = function(self)
	if self:IsDroneOnGround() then
		local up = self:GetUp()
		local phys = self:GetPhysicsObject()

		if not self.JumpPower then self.JumpPower = 0 end
		self.JumpPower = math.Approach(self.JumpPower, 700, 10)

		phys:ApplyForceCenter(-up * phys:GetMass() * 18)
	end
end

ENT.KeysFuncs.UnPressed["Up"] = function(self)
	if self:IsDroneOnGround() then
		local forward = self:GetForward()
		local up = self:GetUp()
		local phys = self:GetPhysicsObject()

		local ang = self:GetAngles()
		local angp = math.NormalizeAngle(ang.p)
		local angr = math.NormalizeAngle(ang.r)

		phys:ApplyForceCenter((forward * 200 + up * self.JumpPower) * phys:GetMass())
		phys:AddAngleVelocity(Vector(angr, angp, 0) * self.JumpPower * 0.01)

		self.JumpPower = 0
	end
end

ENT.KeysFuncs.Physics["Down"] = function(self)
	local up = self:GetUp()
	local phys = self:GetPhysicsObject()

	phys:ApplyForceCenter(-up * phys:GetMass() * 21)
end

ENT.HealthAmount = 1200
ENT.DefaultHealth = 1200

ENT.Sounds = {
	ExplosionSound = {
		Name = "ambient/explosions/explode_1.wav",
		Level = 82
	},

	FootSound = {
		Sounds = {
			--"physics/metal/metal_barrel_impact_hard1.wav",
			"physics/metal/metal_barrel_impact_hard2.wav"
		},

		Pitch = 40,
		Volume = 70
	}
}

ENT.Corners = {
	Vector(-47.25, -48, 100),
	Vector(-47.25, 49, 100),
	Vector(14, 47, 100),
	Vector(14, -48, 100)
}

ENT.Attachments = {
	["Minigun1"] = {
		Pos = Vector(0, -25, 126),
		Angle = Angle(0, 0, -97)
	},

	["Minigun2"] = {
		Pos = Vector(0, 25, 126),
		Angle = Angle(0, 0, 97)
	},

	["BackwardLeftUp"] = {
		Pos = Vector(-58, 12, 130),
		Angle = Angle(84, 0, 0)
	},

	["BackwardRightUp"] = {
		Pos = Vector(-58, -12, 130),
		Angle = Angle(84, 0, 0)
	}
}

ENT.Weapons = {
	["Heavy Miniguns"] = {
		Name = "Heavy Minigun",
		Sync = { ["2"] = { fire1 = "fire1" } },
		Attachment = "Minigun1"
	},

	["2"] = {
		Name = "Heavy Minigun",
		Select = false,
		Attachment = "Minigun2"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()
--PATH addons/_drones/lua/entities/dronesrewrite_exmac/shared.lua:
ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Deus Ex Machina"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.AdminOnly = true
ENT.UNIT = "DEM"

ENT.SpawnHeight = 300
ENT.Weight = 6000

ENT.HackValue = 5
ENT.ImmuneToJammer = true

ENT.Model = "models/dronesrewrite/exmac/exmac.mdl"

ENT.DoExplosionEffect = false

ENT.HealthAmount = 5000
ENT.DefaultHealth = 5000

ENT.ExplosionForce = 300
ENT.ExplosionAngForce = 0.03
ENT.DoExplosionEffect = "splode_big_drone_main"

ENT.FirstPersonCam_pos = Vector(150, 0, -90)
ENT.ThirdPersonCam_distance = 400
ENT.RenderCam = false

ENT.NoiseCoefficient = 0.1

ENT.Alignment = 0 --1.6
ENT.AlignmentRoll = 1.4
ENT.AlignmentPitch = 3

ENT.AngOffset = 1

ENT.SprintCoefficient = 1
ENT.Speed = 40000
ENT.UpSpeed = 200000
ENT.RotateSpeed = 2

ENT.Fuel = 1200
ENT.MaxFuel = 1200
ENT.FuelReduction = 0.6

ENT.PitchOffset = 0

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.AllowYawRestrictions = true
ENT.YawMin = -80
ENT.YawMax = 80

ENT.PitchMin = -60
ENT.AI_AirZ = 1000
ENT.AI_DistanceEnemy = 1
ENT.AI_MaxDistance = 400

ENT.Sounds = {
	PropellerSound = {
		Name = "ambient/machines/laundry_machine1_amb.wav",
		Pitch = 85,
		Level = 90,
		NoPitchChanges = true
	},
	
	ExplosionSound = {
		Name = "ambient/explosions/explode_8.wav",
		Level = 100,
		Pitch = 90
	}
}

ENT.Attachments = {
	["DownBack"] = {
		Pos = Vector(-187, -187, -73)
	},

	["DownForward"] = {
		Pos = Vector(187, 187, -73)
	},

	["UpRight"] = {
		Pos = Vector(260, -260, 33),
		Angle = Angle(0, 0, 180)
	},

	["UpLeft"] = {
		Pos = Vector(-260, 260, 33),
		Angle = Angle(0, 0, 180)
	}
}

ENT.NoPropellers = true
ENT.Propellers = {
	Model = "models/props_junk/PopCan01a.mdl",
	Info = { Vector(0, 0, 0) }
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()
--PATH addons/_drones/lua/entities/dronesrewrite_grenader/shared.lua:
ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
//ENT.PrintName = "EXS 'Explostorm'"
ENT.PrintName = "SIS Drone"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "SIS"

ENT.Model = "models/dronesrewrite/sisdr/sisdr.mdl"

ENT.Weight = 700

ENT.Speed = 5000
ENT.UpSpeed = 25000
ENT.RotateSpeed = 5
ENT.SprintCoefficient = 1.5

ENT.AngOffset = 2.4
ENT.PitchOffset = 0.2

ENT.Alignment = 0.45

ENT.ExplosionForce = 40
ENT.ExplosionAngForce = 0.7

ENT.FirstPersonCam_pos = Vector(19, 0, 2)
ENT.ThirdPersonCam_distance = 80
ENT.RenderCam = false

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.PitchMin = -46
ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.HackValue = 3

ENT.HealthAmount = 450
ENT.DefaultHealth = 450

ENT.Fuel = 300
ENT.MaxFuel = 300
ENT.FuelReduction = 0.9

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/manhack/mh_engine_loop1.wav",
		Pitch = 120,
		Level = 75,
		Volume = 0.6
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_1.wav",
		Pitch = 100,
		Level = 80
	}
}


ENT.Propellers = {
	Damage = 1,
	Health = 20,
	HitRange = 20,
	Scale = 1.15,
	Model = "models/dronesrewrite/propellers/propeller2_3.mdl",

	Info = {
		Vector(36.5, 35.5, 5),
		Vector(-36.5, -35.5, 5),
		Vector(-36.5, 35.5, 5),
		Vector(36.5, -35.5, 5)
	}
}

ENT.Attachments = {
	["GrenadeL"] = {
		Pos = Vector(0, 0, -2)
	}
}

ENT.Weapons = {
	["Grenade Launcher"] = {
		Name = "Grenade Launcher",
		Attachment = "GrenadeL"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()
--PATH addons/_drones/lua/entities/dronesrewrite_healer/shared.lua:
ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
//ENT.PrintName = "REP 'Repairer'"
ENT.PrintName = "Repairer"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.DoExplosionEffect = true

ENT.UNIT = "REP"

ENT.Weight = 150

ENT.Model = "models/dronesrewrite/repairer/repairer.mdl"

ENT.FirstPersonCam_pos = Vector(14, 0, 0)
ENT.RenderCam = false

ENT.NoiseCoefficient = 0
ENT.NoiseCoefficientAng = 0.6
ENT.NoiseCoefficientPos = 8
ENT.AngOffset = 4

ENT.Speed = 3000
ENT.UpSpeed = 15000
ENT.RotateSpeed = 8
ENT.Alignment = 2

ENT.Fuel = 90
ENT.MaxFuel = 90
ENT.FuelReduction = 0.2

ENT.HackValue = 2

ENT.HealthAmount = 90
ENT.DefaultHealth = 90

ENT.PitchMin = -35

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.AI_ReverseCheck = true
ENT.AI_CustomEnemyChecker = function(drone, v)
	return v.IS_DRR and v:GetHealth() < v:GetDefaultHealth()
end

ENT.Sounds = {
	PropellerSound = {
		Name = "npc/manhack/mh_engine_loop2.wav",
		Pitch = 150,
		Level = 68,
		Volume = 0.75
	},

	ExplosionSound = {
		Name = "ambient/explosions/explode_1.wav",
		Level = 80
	}
}

ENT.Propellers = {
	Scale = 1.05,
	Damage = 1,
	Health = 40,
	HitRange = 15,
	Model = "models/dronesrewrite/propellers/propeller2_3.mdl",

	Info = {
		Vector(-0.7, 26.8, 4.5),
		Vector(-0.7, -26.8, 4.5)
	}
}

ENT.Attachments = {
	["Repairer"] = { 
		Pos = Vector(0, 0, -4)
	}
}

ENT.Weapons = {
	["Repairer"] = {
		Name = "Repairer",
		Attachment = "Repairer"
	}
}

ENT.Modules = DRONES_REWRITE.GetBaseModules()
--PATH addons/_drones/lua/entities/dronesrewrite_nanodr/shared.lua:
ENT.Base = "dronesrewrite_base"
ENT.Type = "anim"
ENT.PrintName = "Nano Drone"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Category = "Drones Rewrite"

ENT.UNIT = "NANO"

ENT.HUD_hudName = "Simple"

ENT.Model = "models/dronesrewrite/nanonew/nanodr.mdl"

ENT.Weight = 20

ENT.DoExplosionEffect = false
ENT.ExplosionForce = 0
ENT.ExplosionAngForce = 0

ENT.Speed = 180
ENT.UpSpeed = 500
ENT.RotateSpeed = 4
ENT.AngOffset = 2
ENT.NoiseCoefficient = 0.3
ENT.Alignment = 3

ENT.Fuel = 5
ENT.MaxFuel = 5
ENT.FuelReduction = 0.004

ENT.FirstPersonCam_pos = Vector(0, 0, -1)
ENT.ThirdPersonCam_distance = 30
ENT.RenderCam = false

ENT.AllowYawRestrictions = true
ENT.YawMin = -60
ENT.YawMax = 60

ENT.KeysFuncs = DRONES_REWRITE.DefaultKeys()

ENT.AllowPitchRestrictions = false
ENT.UseFlashlight = false

ENT.HealthAmount = 25
ENT.DefaultHealth = 25

ENT.Sounds = {
	ExplosionSound = {
		Name = "ambient/energy/spark3.wav",
		Level = 80,
		Pitch = 150
	}
}

ENT.NoPropellers = true
ENT.Propellers = {
	Model = "models/props_junk/PopCan01a.mdl",
	Info = { Vector(0, 0, 0) }
}

ENT.Weapons = { }

ENT.Modules = DRONES_REWRITE.GetBaseModules()
--PATH addons/_drones/lua/entities/dronesrewrite_walkart/cl_init.lua:
include("shared.lua")


--PATH addons/_eml/lua/entities/eml_buyer_text/shared.lua:
ENT.Base = "base_rp";
ENT.Type = "anim";

ENT.PrintName		= "Надпис";
ENT.Category 		= "EML";
ENT.Author			= "EnnX49";

ENT.Contact    		= "";
ENT.Purpose 		= "";
ENT.Instructions 	= "" ;

ENT.Spawnable			= false;
ENT.AdminSpawnable		= false;

--PATH addons/_eml/lua/entities/eml_gas/shared.lua:
ENT.Base = "base_anim";
ENT.Type = "anim";

ENT.PrintName		= "Газ";
ENT.Category 		= "EML";
ENT.Author			= "EnnX49";

ENT.Contact    		= "";
ENT.Purpose 		= "";
ENT.Instructions 	= "" ;

ENT.Spawnable			= true;
ENT.AdminSpawnable		= true;

--PATH addons/_eml/lua/entities/eml_iodine/shared.lua:
ENT.Base = "base_anim";
ENT.Type = "anim";

ENT.PrintName		= "Рідкий Йод";
ENT.Category 		= "EML";
ENT.Author			= "EnnX49";

ENT.Contact    		= "";
ENT.Purpose 		= "";
ENT.Instructions 	= "" ;

ENT.Spawnable			= true;
ENT.AdminSpawnable		= true;

--PATH addons/_eml/lua/entities/eml_redp/shared.lua:
ENT.Base = "base_anim";
ENT.Type = "anim";

ENT.PrintName		= "Червоний фосфор";
ENT.Category 		= "EML";
ENT.Author			= "EnnX49";

ENT.Contact    		= "";
ENT.Purpose 		= "";
ENT.Instructions 	= "" ;

ENT.Spawnable			= true;
ENT.AdminSpawnable		= true;

--PATH addons/_eml/lua/entities/eml_spot/cl_init.lua:
include("shared.lua");



function ENT:Initialize()	

end;

function ENT:Draw()
	self:DrawModel();
	
	local pos = self:GetPos()
	local ang = self:GetAngles()
	local redpColor = Color(175, 0, 0, 255);
	local ciodineColor = Color(220, 134, 159, 255);
	
	local potTime = "Time: "..self:GetNWInt("time").."s";
	
	if (self:GetNWInt("status") == "inprogress") then
		potTime = "Час: "..self:GetNWInt("time").."сек";
	elseif (self:GetNWInt("status") == "ready") then	
		potTime = "Мет Готовий!";
	end;
	ang:RotateAroundAxis(ang:Up(), 90);
	ang:RotateAroundAxis(ang:Forward(), 90);	
	if LocalPlayer():GetPos():Distance(self:GetPos()) < self:GetNWInt("distance") then
		cam.Start3D2D(pos + ang:Up()*8, ang, 0.10)
			surface.SetDrawColor(Color(0, 0, 0, 200));
			surface.DrawRect(-64, -38, 128, 96);		
		cam.End3D2D();
		cam.Start3D2D(pos + ang:Up()*8, ang, 0.055)
			draw.ShadowText("Кристалічний Мет", "Roboto_31", 0, -56, Color(1, 241, 249, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100));
			draw.ShadowText("______________", "Roboto_31", 0, -54, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100));

			surface.SetDrawColor(Color(0, 0, 0, 200));
			surface.DrawRect(-104, -32, 204, 24);			
			surface.SetDrawColor(Color(1, 201, 209, 255));
			surface.DrawRect(-101.5, -30, math.Round((self:GetNWInt("time")*198)/self:GetNWInt("maxTime")), 20);		
			
			draw.ShadowText("Інгредієнти", "Roboto_31", -101, 8, Color(1, 241, 249, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100));
			draw.ShadowText("______________", "Roboto_31", 0, 10, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100));

			if (self:GetNWInt("redp")==0) then
				redpColor = Color(100, 100, 100, 255);
			else
				redpColor = Color(175, 0, 0, 255);
			end;
			
			if (self:GetNWInt("ciodine")==0) then
				ciodineColor = Color(100, 100, 100, 255);
			else
				ciodineColor = Color(220, 134, 159, 255);
			end;							
		cam.End3D2D();	
		cam.Start3D2D(pos + ang:Up()*8, ang, 0.040)		
			draw.ShadowText("Червоний Фосфор ("..self:GetNWInt("redp")..")", "Roboto_31", -138, 50, redpColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100));
			draw.ShadowText("Кристалічний Йод ("..self:GetNWInt("ciodine")..")", "Roboto_31", -138, 80, ciodineColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100));		
		cam.End3D2D();			
		cam.Start3D2D(pos + ang:Up()*8, ang, 0.035)		
			draw.ShadowText(potTime, "Roboto_31", -152, -32, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color(25, 25, 25, 100));		
		cam.End3D2D();		
		
	end;
end;


--PATH addons/__main_only_1st/lua/entities/ent_riotshield/cl_init.lua:
include("shared.lua")

--[[---------------------------------------------------------
   Name: ENT:Draw()
---------------------------------------------------------]]
function ENT:Draw()
	if(EyePos():Distance(self:GetPos())<1500)then
	self:DrawModel()
end
end
--PATH addons/_drones/lua/entities/item_drr_rockets.lua:
AddCSLuaFile()

ENT.Base = "item_drr_ammobase"
ENT.Type = "anim"
ENT.PrintName = "Rockets"
ENT.Category = "Drones Rewrite Ammo"
ENT.Spawnable = true
ENT.AdminSpaawnable = true

ENT.Amount = 10
ENT.Model = "models/dronesrewrite/ammobox/ammobox.mdl"
ENT.Material = "models/dronesrewrite/ammunition/ammo_rock"

--PATH addons/lvs_base-main/lua/entities/lvs_armor_bounce.lua:
AddCSLuaFile()

ENT.Type            = "anim"

ENT.PrintName = "88mm Round"
ENT.Author = "Luna"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars - Items"

ENT.Spawnable		= false
ENT.AdminOnly		= false

ENT.LifeTime = 10

if SERVER then
	function ENT:Initialize()
		self:SetModel( "models/misc/88mm_projectile.mdl" )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:PhysicsInit( SOLID_VPHYSICS)

		self.DieTime = CurTime() + self.LifeTime

		self:SetCollisionGroup( COLLISION_GROUP_WORLD )
	end

	function ENT:Think()
		if self.MarkForRemove then self:Remove() return false end

		self:NextThink( CurTime() + 0.1 )

		if (self.DieTime or 0) > CurTime() then return true end

		self:Remove()

		return false
	end

	
	function ENT:PhysicsCollide( data, physobj )
		self.MarkForRemove = true

		local effectdata = EffectData()
		effectdata:SetOrigin( data.HitPos )
		effectdata:SetNormal( -data.HitNormal )
		effectdata:SetMagnitude( 0.5 )
		util.Effect( "lvs_bullet_impact", effectdata )
	end

	return
end

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

function ENT:Initialize()
	self.DieTime = CurTime() + self.LifeTime

	self.emitter = ParticleEmitter( self:GetPos(), false )
end

function ENT:Smoke()
	local T = CurTime()

	if (self.DieTime or 0) < T then return end

	if not IsValid( self.emitter ) then return end

	if (self.NextFX or 0) < T then
		self.NextFX = T + 0.02

		local Timed = 1 - (self.DieTime - T) / self.LifeTime
		local Scale = math.max(math.min(2 - Timed * 2,1),0)

		local Pos = self:GetPos() 

		local particle = self.emitter:Add( self.MatSmoke[math.random(1,#self.MatSmoke)], Pos )

		local VecCol = (render.GetLightColor( Pos ) * 0.8 + Vector(0.2,0.2,0.2)) * 255

		if particle then
			particle:SetVelocity( VectorRand() * 10 )
			particle:SetDieTime( math.Rand(0.5,1) )
			particle:SetAirResistance( 100 ) 
			particle:SetStartAlpha( 100 * Scale )
			particle:SetEndAlpha( 0 )
			particle:SetStartSize( 10 )
			particle:SetEndSize( 20 )
			particle:SetRollDelta( 1 )
			particle:SetColor( VecCol.r, VecCol.g, VecCol.b )
			particle:SetGravity( Vector( 0, 0, 200 ) )
			particle:SetCollide( false )
		end
	end
end

function ENT:Think()
	self:Smoke()
end

function ENT:OnRemove()
	if not self.emitter then return end

	self.emitter:Finish()
end

function ENT:Draw()
	self:DrawModel()
end

--PATH addons/lvs_base-main/lua/entities/lvs_base/cl_seatswitcher.lua:

ENT.IconVehicleLocked = Material( "lvs/locked.png" )

LVS:AddHudEditor( "SeatSwitcher", ScrW() - 360, 10,  350, 60, 350, 60, "SEAT SWITCHER", 
	function( self, vehicle, X, Y, W, H, ScrX, ScrY, ply )
		if not vehicle.LVSHudPaintSeatSwitcher then return end

		vehicle:LVSHudPaintSeatSwitcher( X, Y, W, 30, ScrX, ScrY, ply )
	end
)

function ENT:LVSHudPaintSeatSwitcher( X, Y, w, h, ScrX, ScrY, ply )
	local pSeats = table.Copy( self:GetPassengerSeats() )
	local SeatCount = table.Count( pSeats ) 

	if SeatCount <= 0 then return end

	pSeats[0] = self:GetDriverSeat()

	draw.NoTexture() 

	local HasAI = self:GetAI()
	local HasAIGunners = self:GetAIGunners()

	local MySeat = ply:GetVehicle():lvsGetPodIndex()

	local Passengers = {}
	for _, player in pairs( player.GetAll() ) do
		if player:lvsGetVehicle() == self then
			local Pod = player:GetVehicle()
			Passengers[ Pod:lvsGetPodIndex() ] = player:GetName()
		end
	end

	if HasAI then
		Passengers[1] = "[AI] "..self.PrintName
	end

	if HasAIGunners then
		for _, Pod in pairs( self:GetPassengerSeats() ) do
			if IsValid( Pod:GetDriver() ) then continue end
	
			local weapon = Pod:lvsGetWeapon()

			if not IsValid( weapon ) then continue end

			Passengers[ weapon:GetPodIndex() ] = "[AI] Gunner"
		end
	end

	ply.SwitcherTime = ply.SwitcherTime or 0
	ply._lvsoldPassengers = ply._lvsoldPassengers or {}

	local Time = CurTime()
	for k, v in pairs( Passengers ) do
		if ply._lvsoldPassengers[k] ~= v then
			ply._lvsoldPassengers[k] = v
			ply.SwitcherTime = Time + 2
		end
	end
	for k, v in pairs( ply._lvsoldPassengers ) do
		if not Passengers[k] then
			ply._lvsoldPassengers[k] = nil
			ply.SwitcherTime = Time + 2
		end
	end
	for _, v in pairs( LVS.pSwitchKeysInv ) do
		if input.IsKeyDown(v) then
			ply.SwitcherTime = Time + 2
		end
	end

	local Hide = ply.SwitcherTime > Time

	ply.smHider = ply.smHider and (ply.smHider + ((Hide and 1 or 0) - ply.smHider) * RealFrameTime() * 15) or 0

	local Alpha1 = 135 + 110 * ply.smHider 
	local HiderOffset = 270 * ply.smHider
	local xPos = w - 35
	local yPos = Y - (SeatCount + 1) * 30 + h + 5

	local SwapY = false
	local SwapX = false

	local xHider = HiderOffset

	if X < (ScrX * 0.5 - w * 0.5) then
		SwapX = true
		xPos = 0
		xHider = 0
	end

	if Y < (ScrY * 0.5 - h * 0.5) then
		SwapY = true
		yPos = Y - h
	end

	for _, Pod in pairs( pSeats ) do
		if not IsValid( Pod ) then continue end

		local I = Pod:lvsGetPodIndex()

		if I <= 0 then continue end

		if I == MySeat then
			draw.RoundedBox(5, X + xPos - xHider, yPos + I * 30, 35 + HiderOffset, 25, Color(LVS.ThemeColor.r, LVS.ThemeColor.g, LVS.ThemeColor.b,100 + 50 * ply.smHider) )
		else
			draw.RoundedBox(5, X + xPos - xHider, yPos + I * 30, 35 + HiderOffset, 25, Color(0,0,0,100 + 50 * ply.smHider) )
		end

		if Hide then
			if Passengers[I] then
				draw.DrawText( Passengers[I], "LVS_FONT_SWITCHER", X + 40 + xPos - xHider, yPos + I * 30 + 2.5, Color( 255, 255, 255,  Alpha1 ), TEXT_ALIGN_LEFT )
			else
				draw.DrawText( "-", "LVS_FONT_SWITCHER", X + 40 + xPos - xHider, yPos + I * 30 + 2.5, Color( 255, 255, 255,  Alpha1 ), TEXT_ALIGN_LEFT )
			end
			
			draw.DrawText( "["..I.."]", "LVS_FONT_SWITCHER", X + 17 + xPos - xHider, yPos + I * 30 + 2.5, Color( 255, 255, 255, Alpha1 ), TEXT_ALIGN_CENTER )
		else
			if Passengers[I] then
				draw.DrawText( "[^"..I.."]", "LVS_FONT_SWITCHER", X + 17 + xPos - xHider, yPos + I * 30 + 2.5, Color( 255, 255, 255, Alpha1 ), TEXT_ALIGN_CENTER )
			else
				draw.DrawText( "["..I.."]", "LVS_FONT_SWITCHER", X + 17 + xPos - xHider, yPos + I * 30 + 2.5, Color( 255, 255, 255, Alpha1 ), TEXT_ALIGN_CENTER )
			end
		end

		if not self:GetlvsLockedStatus() then continue end

		local xLocker = SwapX and 35 + HiderOffset or -25 - HiderOffset

		if SwapY then
			if I == 1 then
				surface.SetDrawColor( 255, 255, 255, 255 )
				surface.SetMaterial( self.IconVehicleLocked  )
				surface.DrawTexturedRect( X + xPos + xLocker, yPos + I * 30, 25, 25 )
			end
		else
			if I == SeatCount then
				surface.SetDrawColor( 255, 255, 255, 255 )
				surface.SetMaterial( self.IconVehicleLocked  )
				surface.DrawTexturedRect( X + xPos + xLocker, yPos + I * 30, 25, 25 )
			end
		end
	end
end

--PATH addons/lvs_cars_3027255911/lua/entities/lvs_base_wheeldrive/cl_camera.lua:

function ENT:CalcViewOverride( ply, pos, angles, fov, pod )
	return pos, angles, fov
end

function ENT:CalcViewDirectInput( ply, pos, angles, fov, pod )
	return LVS:CalcView( self, ply, pos, angles,  fov, pod )
end

function ENT:CalcViewMouseAim( ply, pos, angles, fov, pod )
	return LVS:CalcView( self, ply, pos, angles,  fov, pod )
end

function ENT:CalcViewDriver( ply, pos, angles, fov, pod )
	pos = pos + pod:GetUp() * 7 - pod:GetRight() * 11

	if ply:lvsMouseAim() then
		angles = ply:EyeAngles()

		return self:CalcViewMouseAim( ply, pos, angles,  fov, pod )
	else
		return self:CalcViewDirectInput( ply, pos, angles,  fov, pod )
	end
end

function ENT:CalcViewPassenger( ply, pos, angles, fov, pod )
	return LVS:CalcView( self, ply, pos, angles, fov, pod )
end

function ENT:LVSCalcView( ply, original_pos, original_angles, original_fov, pod )
	local pos, angles, fov = self:CalcViewOverride( ply, original_pos, original_angles, original_fov, pod )

	local new_fov = math.min( fov + self:CalcViewPunch( ply, pos, angles, fov, pod ), 180 )

	if self:GetDriverSeat() == pod then
		return self:CalcViewDriver( ply, pos, angles, new_fov, pod )
	else
		return self:CalcViewPassenger( ply, pos, angles, new_fov, pod )
	end
end

function ENT:SuppressViewPunch( time )
	self._viewpunch_supressed_time = CurTime() + (time or 0.2)
end

function ENT:IsViewPunchSuppressed()
	return (self._viewpunch_supressed_time or 0) > CurTime()
end

function ENT:CalcViewPunch( ply, pos, angles, fov, pod )
	local Vel = self:GetVelocity()
	local VelLength = Vel:Length()
	local VelPercentMaxSpeed = math.min( VelLength / 1000, 1 )

	if ply:lvsMouseAim() then
		angles = ply:EyeAngles()
	end

	local direction = (90 - self:AngleBetweenNormal( angles:Forward(), Vel:GetNormalized() )) / 90

	local FovValue = math.min( VelPercentMaxSpeed ^ 2 * 100, 15 )

	local Throttle = self:GetThrottle()
	local Brake = self:GetBrake()

	if self:IsViewPunchSuppressed() then
		self._viewpunch_fov = self._viewpunch_fov and self._viewpunch_fov + (-VelPercentMaxSpeed * FovValue - self._viewpunch_fov) * RealFrameTime() or 0
	else
		local newFov =(1 - VelPercentMaxSpeed) * Throttle * FovValue - VelPercentMaxSpeed * Brake * FovValue

		self._viewpunch_fov = self._viewpunch_fov and self._viewpunch_fov + (newFov - self._viewpunch_fov) * RealFrameTime() * 10 or 0
	end

	return self._viewpunch_fov * (90 - self:AngleBetweenNormal( angles:Forward(), Vel:GetNormalized() )) / 90
end

--PATH addons/lvs_base-main/lua/includes/circles/circles.lua:
if SERVER then return false end

local _R = debug.getregistry()
if _R.Circles then return _R.Circles end

local CIRCLE = {}
CIRCLE.__index = CIRCLE

CIRCLE_FILLED = 0
CIRCLE_OUTLINED = 1
CIRCLE_BLURRED = 2

local New do
	local err_number = "bad argument #%i to 'New' (number expected, got %s)"

	function New(t, r, x, y, ...)
		assert(isnumber(t), string.format(err_number, 1, type(t)))
		assert(isnumber(r), string.format(err_number, 2, type(r)))
		assert(isnumber(x), string.format(err_number, 3, type(x)))
		assert(isnumber(y), string.format(err_number, 4, type(y)))

		local circle = setmetatable({}, CIRCLE)

		circle:SetType(t)
		circle:SetRadius(r)
		circle:SetX(x)
		circle:SetY(y)

		circle:SetVertices({[0] = 0})

		if t == CIRCLE_OUTLINED then
			local outline_width = ...
			assert(outline_width == nil or isnumber(outline_width), string.format(err_number, 5, type(outline_width)))

			circle:SetOutlineWidth(outline_width)
		elseif t == CIRCLE_BLURRED then
			local blur_layers, blur_density = ...
			assert(blur_layers == nil or isnumber(blur_layers), string.format(err_number, 5, type(blur_layers)))
			assert(blur_density == nil or isnumber(blur_density), string.format(err_number, 6, type(blur_density)))

			circle:SetBlurLayers(blur_layers)
			circle:SetBlurDensity(blur_density)
		end

		return circle
	end
end

local RotateVertices do
	local err_table = "bad argument #1 to 'RotateVertices' (table expected, got %s)"
	local err_number = "bad argument #%i to 'RotateVertices' (number expected, got %s)"

	function RotateVertices(vertices, ox, oy, rotation, rotate_uv)
		assert(istable(vertices), string.format(err_table, type(vertices)))
		assert(isnumber(ox), string.format(err_number, 2, type(ox)))
		assert(isnumber(oy), string.format(err_number, 3, type(oy)))
		assert(isnumber(rotation), string.format(err_number, 4, type(rotation)))

		local rotation = math.rad(rotation)
		local c = math.cos(rotation)
		local s = math.sin(rotation)

		for i = 1, vertices[0] or #vertices do
			local vertex = vertices[i]
			local vx, vy = vertex.x, vertex.y

			vx = vx - ox
			vy = vy - oy

			vertex.x = ox + (vx * c - vy * s)
			vertex.y = oy + (vx * s + vy * c)

			if rotate_uv == false then
				local u, v = vertex.u, vertex.v
				u, v = u - 0.5, v - 0.5

				vertex.u = 0.5 + (u * c - v * s)
				vertex.v = 0.5 + (u * s + v * c)
			end
		end
	end
end

local CalculateVertices do
	local err_number = "bad argument #%i to 'CalculateVertices' (number expected, got %s)"

	function CalculateVertices(x, y, radius, rotation, start_angle, end_angle, distance, rotate_uv)
		assert(isnumber(x), string.format(err_number, 1, type(x)))
		assert(isnumber(y), string.format(err_number, 2, type(y)))
		assert(isnumber(radius), string.format(err_number, 3, type(radius)))
		assert(isnumber(rotation), string.format(err_number, 4, type(rotation)))
		assert(isnumber(start_angle), string.format(err_number, 5, type(start_angle)))
		assert(isnumber(end_angle), string.format(err_number, 6, type(end_angle)))
		assert(isnumber(distance), string.format(err_number, 7, type(distance)))

		local vertices = {}
		local vertex_count = 0

		local step = distance / radius
		local rad_start_angle = math.rad(start_angle)
		local rad_end_angle = math.rad(end_angle)
		local rad_rotation = math.rad(rotation)

		for a = rad_start_angle, rad_end_angle + step, step do
			a = math.min(a, rad_end_angle)

			local c = math.cos(a + rad_rotation)
			local s = math.sin(a + rad_rotation)

			local vertex = {
				x = x + c * radius,
				y = y + s * radius,
			}

			if rotate_uv == false then
				vertex.u = 0.5 + math.cos(a) * 0.5
				vertex.v = 0.5 + math.sin(a) * 0.5
			else
				vertex.u = 0.5 + c * 0.5
				vertex.v = 0.5 + s * 0.5
			end

			vertex_count = vertex_count + 1
			vertices[vertex_count] = vertex
		end

		if end_angle - start_angle ~= 360 then
			table.insert(vertices, 1, {
				x = x, y = y,
				u = 0.5, v = 0.5,
			})

			vertex_count = vertex_count + 1
		else
			table.remove(vertices)
			vertex_count = vertex_count - 1
		end

		vertices[0] = vertex_count

		return vertices
	end
end

function CIRCLE:__tostring()
	return string.format("Circle: %p", self)
end

function CIRCLE:Copy()
	return table.Copy(self)
end

function CIRCLE:IsValid()
	return (
		not self.m_Dirty and
		self.m_Vertices[0] >= 3 and
		self.m_Radius >= 1 and
		self.m_Distance >= 1
	)
end

function CIRCLE:Calculate()
	local rotate_uv = self.m_RotateMaterial

	local radius = self.m_Radius
	local x, y = self.m_X, self.m_Y

	local rotation = self.m_Rotation
	local start_angle = self.m_StartAngle
	local end_angle = self.m_EndAngle

	local distance = self.m_Distance

	assert(radius >= 1, string.format("circle radius should be >= 1 (%.4f)", radius))
	assert(distance >= 1, string.format("circle distance should be >= 1 (%.4f)", distance))

	self:SetVertices(CalculateVertices(x, y, radius, rotation, start_angle, end_angle, distance, rotate_uv))

	if self.m_Type == CIRCLE_OUTLINED then
		local inner = self.m_ChildCircle or self:Copy()
		local inner_r = radius - self.m_OutlineWidth

		inner:SetType(CIRCLE_FILLED)

		inner:SetPos(x, y)
		inner:SetRadius(inner_r)
		inner:SetRotation(rotation)
		inner:SetAngles(start_angle, end_angle)
		inner:SetDistance(distance)

		inner:SetColor(false)
		inner:SetMaterial(false)

		inner:SetShouldRender(inner_r >= 1)
		inner:SetDirty(inner.m_ShouldRender)

		self:SetShouldRender(inner_r < radius)
		self:SetChildCircle(inner)
	elseif self.m_ChildCircle then
		self.m_ChildCircle = nil
	end

	self:SetDirty(false)

	return self
end

do
	local blur = Material("pp/blurscreen")

	function CIRCLE:__call()
		if self.m_Dirty then self:Calculate() end

		if not self:IsValid() then return false end
		if not self.m_ShouldRender then return false end

		do
			local col, mat = self.m_Color, self.m_Material

			if IsColor(col) then
				if col.a <= 0 then return end
				surface.SetDrawColor(col.r, col.g, col.b, col.a)
			end

			if mat == true then
				draw.NoTexture()
			elseif TypeID(mat) == TYPE_MATERIAL then
				surface.SetMaterial(mat)
			end
		end

		if self.m_Type == CIRCLE_OUTLINED then
			render.ClearStencil()

			render.SetStencilEnable(true)
				render.SetStencilTestMask(0xFF)
				render.SetStencilWriteMask(0xFF)
				render.SetStencilReferenceValue(0x01)

				render.SetStencilCompareFunction(STENCIL_NEVER)
				render.SetStencilFailOperation(STENCIL_REPLACE)
				render.SetStencilZFailOperation(STENCIL_REPLACE)

				self.m_ChildCircle()

				render.SetStencilCompareFunction(STENCIL_GREATER)
				render.SetStencilFailOperation(STENCIL_KEEP)
				render.SetStencilZFailOperation(STENCIL_KEEP)

				surface.DrawPoly(self.m_Vertices)
			render.SetStencilEnable(false)
		elseif self.m_Type == CIRCLE_BLURRED then
			render.ClearStencil()

			render.SetStencilEnable(true)
				render.SetStencilTestMask(0xFF)
				render.SetStencilWriteMask(0xFF)
				render.SetStencilReferenceValue(0x01)

				render.SetStencilCompareFunction(STENCIL_NEVER)
				render.SetStencilFailOperation(STENCIL_REPLACE)
				render.SetStencilZFailOperation(STENCIL_REPLACE)

				surface.DrawPoly(self.m_Vertices)

				render.SetStencilCompareFunction(STENCIL_LESSEQUAL)
				render.SetStencilFailOperation(STENCIL_KEEP)
				render.SetStencilZFailOperation(STENCIL_KEEP)

				surface.SetMaterial(blur)

				local sw, sh = ScrW(), ScrH()

				for i = 1, self.m_BlurLayers do
					blur:SetFloat("$blur", (i / self.m_BlurLayers) * self.m_BlurDensity)
					blur:Recompute()

					render.UpdateScreenEffectTexture()
					surface.DrawTexturedRect(0, 0, sw, sh)
				end
			render.SetStencilEnable(false)
		else
			surface.DrawPoly(self.m_Vertices)
		end

		return true
	end

	CIRCLE.Draw = CIRCLE.__call
end

do
	local err_number = "bad argument #%i to 'Translate' (number expected, got %s)"

	function CIRCLE:Translate(x, y)
		assert(isnumber(x), string.format(err_number, 1, type(x)))
		assert(isnumber(y), string.format(err_number, 2, type(y)))

		if x ~= 0 or y ~= 0 then
			self.m_X = self.m_X + x
			self.m_Y = self.m_Y + y

			if self:IsValid() then
				for i = 1, self.m_Vertices[0] do
					local vertex = self.m_Vertices[i]

					vertex.x = vertex.x + x
					vertex.y = vertex.y + y
				end

				if self.m_Type == CIRCLE_OUTLINED and self.m_ChildCircle then
					self.m_ChildCircle:Translate(x, y)
				end
			end
		end

		return self
	end
end

do
	local err_number = "bad argument #1 to 'Scale' (number expected, got %s)"

	function CIRCLE:Scale(scale)
		assert(isnumber(scale), string.format(err_number, type(scale)))

		if scale ~= 1 then
			self.m_Radius = self.m_Radius * scale

			if self:IsValid() then
				local x, y = self.m_X, self.m_Y

				for i = 1, self.m_Vertices[0] do
					local vertex = self.m_Vertices[i]

					vertex.x = x + (vertex.x - x) * scale
					vertex.y = y + (vertex.y - y) * scale
				end

				if self.m_Type == CIRCLE_OUTLINED and self.m_ChildCircle then
					self.m_ChildCircle:Scale(scale)
				end
			end
		end

		return self
	end
end

do
	local err_number = "bad argument #1 to 'Rotate' (number expected, got %s)"

	function CIRCLE:Rotate(rotation)
		assert(isnumber(rotation), string.format(err_number, type(rotation)))

		if rotation ~= 0 then
			self.m_Rotation = self.m_Rotation + rotation

			if self:IsValid() then
				local x, y = self.m_X, self.m_Y
				local vertices = self.m_Vertices
				local rotate_uv = self.m_RotateMaterial

				RotateVertices(vertices, x, y, rotation, rotate_uv)

				if self.m_Type == CIRCLE_OUTLINED and self.m_ChildCircle then
					self.m_ChildCircle:Rotate(rotation)
				end
			end
		end

		return self
	end
end

do
	local function AccessorFunc(name, default, dirty, callback)
		local varname = "m_" .. name

		CIRCLE["Get" .. name] = function(self)
			return self[varname]
		end

		CIRCLE["Set" .. name] = function(self, value)
			if default ~= nil and value == nil then
				value = default
			end

			if self[varname] ~= value then
				if dirty then
					self[dirty] = true
				end

				if callback ~= nil then
					local new = callback(self, self[varname], value)
					value = new ~= nil and new or value
				end

				self[varname] = value
			end

			return self
		end

		CIRCLE[varname] = default
	end

	local function OffsetVerticesX(circle, old, new)
		circle:Translate(new - old, 0)
	end

	local function OffsetVerticesY(circle, old, new)
		circle:Translate(0, new - old)
	end

	local function UpdateRotation(circle, old, new)
		circle:Rotate(new - old)
	end

	-- These are set internally. Only use them if you know what you're doing.
	AccessorFunc("Dirty", true)
	AccessorFunc("Vertices", false)
	AccessorFunc("ChildCircle", false)
	AccessorFunc("ShouldRender", true)

	AccessorFunc("Color", false)						-- The colour you want the circle to be. If set to false then surface.SetDrawColor's can be used.
	AccessorFunc("Material", false)						-- The material you want the circle to render. If set to false then surface.SetMaterial can be used.
	AccessorFunc("RotateMaterial", true)				-- Sets whether or not the circle's UV points should be rotated with the vertices.

	AccessorFunc("Type", CIRCLE_FILLED, "m_Dirty")		-- The circle's type.
	AccessorFunc("X", 0, false, OffsetVerticesX)		-- The circle's X position relative to the top left of the screen.
	AccessorFunc("Y", 0, false, OffsetVerticesY)		-- The circle's Y position relative to the top left of the screen.
	AccessorFunc("Radius", 8, "m_Dirty")				-- The circle's radius.
	AccessorFunc("Rotation", 0, false, UpdateRotation)	-- The circle's rotation, measured in degrees.
	AccessorFunc("StartAngle", 0, "m_Dirty")			-- The circle's start angle, measured in degrees.
	AccessorFunc("EndAngle", 360, "m_Dirty")			-- The circle's end angle, measured in degrees.
	AccessorFunc("Distance", 10, "m_Dirty")				-- The maximum distance between each of the circle's vertices. This should typically be used for large circles in 3D2D.

	AccessorFunc("BlurLayers", 3)						-- The circle's blur layers if Type is set to CIRCLE_BLURRED.
	AccessorFunc("BlurDensity", 2)						-- The circle's blur density if Type is set to CIRCLE_BLURRED.
	AccessorFunc("OutlineWidth", 10, "m_Dirty")			-- The circle's outline width if Type is set to CIRCLE_OUTLINED.

	function CIRCLE:SetPos(x, y)
		x = tonumber(x) or self.m_X
		y = tonumber(y) or self.m_Y

		if self:IsValid() then
			self:Translate(x - self.m_X, y - self.m_Y)
		else
			self.m_X = x
			self.m_Y = y
		end

		return self
	end

	function CIRCLE:SetAngles(s, e)
		s = tonumber(s) or self.m_StartAngle
		e = tonumber(e) or self.m_EndAngle

		self:SetDirty(self.m_Dirty or s ~= self.m_StartAngle or e ~= self.m_EndAngle)

		self.m_StartAngle = s
		self.m_EndAngle = e

		return self
	end

	function CIRCLE:GetPos()
		return self.m_X, self.m_Y
	end

	function CIRCLE:GetAngles()
		return self.m_StartAngle, self.m_EndAngle
	end

	function CIRCLE:SetVertexCount(count)
		self:SetDistance(math.tau * self.m_Radius / math.floor(0.5 + count))
		return self
	end

	function CIRCLE:GetVertexCount()
		if self.m_Dirty then
			return math.ceil(math.tau * self.m_Radius / self.m_Distance) -- rough estimate, only accounts for full circles, m_Vertices[0] will always be right.
		end

		return self.m_Vertices[0]
	end
end

_R.Circles = {
	_MT = CIRCLE,

	New = New,
	RotateVertices = RotateVertices,
	CalculateVertices = CalculateVertices,
}

return _R.Circles

--PATH addons/lvs_cars_3027255911/lua/entities/lvs_base_wheeldrive/cl_scrolltexture.lua:

ENT.ScrollTextureData = {
	["$alphatest"] = "1",
	["$translate"] = "[0.0 0.0 0.0]",
	["$colorfix"] = "{255 255 255}",
	["Proxies"] = {
		["TextureTransform"] = {
			["translateVar"] = "$translate",
			["centerVar"]    = "$center",
			["resultVar"]    = "$basetexturetransform",
		},
		["Equals"] = {
			["srcVar1"] =  "$colorfix",
			["resultVar"] = "$color",
		}
	}
}

function ENT:GetRotationDelta( name, rot )
	name =  "_deltaAng"..name

	if not self[ name ] then self[ name ] = Angle(0,0,0) end

	local ang = Angle(0,0,rot)
	local cur = ang:Right()
	local old = self[ name ]:Up()

	local delta = self:AngleBetweenNormal( cur, old ) - 90

	self[ name ] = ang

	return delta
end

function ENT:CalcScroll( name, rot )
	local delta = self:GetRotationDelta( name, rot )

	name =  "_deltaScroll"..name

	if not self[ name ] then self[ name ] = 0 end

	self[ name ] = self[ name ] + delta

	if self[ name ] > 32768 then
		self[ name ] = self[ name ] - 32768
	end

	if self[ name ] < -32768 then
		self[ name ] = self[ name ] + 32768
	end

	return self[ name ]
end

function ENT:ScrollTexture( name, material, pos )
	if not isstring( name ) or not isstring( material ) or not isvector( pos ) then return "" end

	local id = self:EntIndex()
	local class = self:GetClass()

	local EntTable = self:GetTable()

	local texture_name = class.."_["..id.."]_"..name

	if istable( EntTable._StoredScrollTextures ) then
		if EntTable._StoredScrollTextures[ texture_name ] then
			self._StoredScrollTextures[ texture_name ]:SetVector("$translate", pos )

			return "!"..texture_name
		end
	else
		EntTable._StoredScrollTextures = {}
	end

	local data = table.Copy( EntTable.ScrollTextureData )
	data["$basetexture"] = material

	local mat = CreateMaterial(texture_name, "VertexLitGeneric", data )

	EntTable._StoredScrollTextures[ texture_name ] = mat

	return "!"..texture_name
end
--PATH addons/lvs_base-main/lua/entities/lvs_bomb.lua:
AddCSLuaFile()

ENT.Type = "anim"

ENT.ExplosionEffect = "lvs_explosion_bomb"

ENT.lvsProjectile = true
ENT.VJ_ID_Danger = true

function ENT:SetupDataTables()
	self:NetworkVar( "Bool", 0, "Active" )
	self:NetworkVar( "Bool", 1, "MaskSolid" )

	self:NetworkVar( "Vector", 0, "Speed" )
end

if SERVER then
	util.AddNetworkString( "lvs_bomb_hud" )

	function ENT:SetEntityFilter( filter )
		if not istable( filter ) then return end

		self._FilterEnts = {}

		for _, ent in pairs( filter ) do
			self._FilterEnts[ ent ] = true
		end
	end
	function ENT:GetEntityFilter()
		return self._FilterEnts or {}
	end
	function ENT:SetDamage( num ) self._dmg = num end
	function ENT:SetForce( num ) self._force = num end
	function ENT:SetThrust( num ) self._thrust = num end
	function ENT:SetRadius( num ) self._radius = num end
	function ENT:SetAttacker( ent )
		self._attacker = ent

		if not IsValid( ent ) or not ent:IsPlayer() then return end

		net.Start( "lvs_bomb_hud", true )
			net.WriteEntity( self )
		net.Send( ent )
	end

	function ENT:GetAttacker() return self._attacker or NULL end
	function ENT:GetDamage() return (self._dmg or 2000) end
	function ENT:GetForce() return (self._force or 8000) end
	function ENT:GetRadius() return (self._radius or 400) end

	function ENT:Initialize()
		self:SetModel( "models/props_phx/ww2bomb.mdl" )
		self:SetMoveType( MOVETYPE_NONE )
	end

	function ENT:OnTakeDamage( dmginfo )
	end

	function ENT:Enable()
		if self.IsEnabled then return end

		local Parent = self:GetParent()

		if IsValid( Parent ) then
			self:SetOwner( Parent )
			self:SetParent( NULL )
		end

		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetCollisionGroup( COLLISION_GROUP_WORLD )
		self:PhysWake()

		timer.Simple(1, function()
			if not IsValid( self ) then return end

			self:SetCollisionGroup( COLLISION_GROUP_NONE )
		end )

		self.IsEnabled = true

		local pObj = self:GetPhysicsObject()
		
		if not IsValid( pObj ) then
			self:Remove()

			print("LVS: missing model. Missile terminated.")

			return
		end

		pObj:SetMass( 500 ) 
		pObj:EnableGravity( false ) 
		pObj:EnableMotion( true )
		pObj:EnableDrag( false )
		pObj:SetVelocityInstantaneous( self:GetSpeed() )

		self:SetTrigger( true )

		self:StartMotionController()

		self:PhysWake()

		self.SpawnTime = CurTime()

		self:SetActive( true )
	end

	function ENT:PhysicsSimulate( phys, deltatime )
		phys:Wake()

		local ForceLinear = physenv.GetGravity()

		local Pos = self:GetPos()
		local TargetPos = Pos + self:GetVelocity()

		local AngForce = -self:WorldToLocalAngles( (TargetPos - Pos):Angle() )

		local ForceAngle = (Vector(AngForce.r,-AngForce.p,-AngForce.y) * 10 - phys:GetAngleVelocity() * 5 ) * 250 * deltatime

		return ForceAngle, ForceLinear, SIM_GLOBAL_ACCELERATION
	end

	function ENT:Think()	
		local T = CurTime()

		self:NextThink( T )

		self:UpdateTrajectory()

		if not self.SpawnTime then return true end

		if (self.SpawnTime + 12) < T then
			self:Detonate()
		end

		return true
	end

	function ENT:UpdateTrajectory()
		local base = self:GetParent()

		if not IsValid( base ) then return end

		self:SetSpeed( base:GetVelocity() )
	end

	ENT.IgnoreCollisionGroup = {
		[COLLISION_GROUP_NONE] = true,
		[COLLISION_GROUP_WORLD] =  true,
		[COLLISION_GROUP_IN_VEHICLE] = true
	}

	function ENT:StartTouch( entity )
		if entity == self:GetAttacker() then return end

		if istable( self._FilterEnts ) and self._FilterEnts[ entity ] then return end

		if entity.GetCollisionGroup and self.IgnoreCollisionGroup[ entity:GetCollisionGroup() ] then return end

		if entity.lvsProjectile then return end

		self:Detonate( entity )
	end

	function ENT:EndTouch( entity )
	end

	function ENT:Touch( entity )
	end

	function ENT:PhysicsCollide( data )
		if istable( self._FilterEnts ) and self._FilterEnts[ data.HitEntity ] then return end

		self:Detonate( data.HitEntity )
	end

	function ENT:OnTakeDamage( dmginfo )	
	end

	function ENT:Detonate( target )
		if not self.IsEnabled or self.IsDetonated then return end

		self.IsDetonated = true

		local Pos =  self:GetPos() 

		local effectdata = EffectData()
			effectdata:SetOrigin( Pos )
		util.Effect( self.ExplosionEffect, effectdata )

		local attacker = self:GetAttacker()

		LVS:BlastDamage( Pos, self:GetForward(), IsValid( attacker ) and attacker or game.GetWorld(), self, self:GetDamage(), DMG_BLAST, self:GetRadius(), self:GetForce() )

		SafeRemoveEntityDelayed( self, FrameTime() )
	end

	return
end

function ENT:Enable()
	if self.IsEnabled then return end

	self.IsEnabled = true

	self.snd = CreateSound(self, "lvs/weapons/bomb_whistle_loop.wav")
	self.snd:SetSoundLevel( 110 )
	self.snd:PlayEx(0,150)
end

function ENT:CalcDoppler()
	local Ent = LocalPlayer()

	local ViewEnt = Ent:GetViewEntity()

	if Ent:lvsGetVehicle() == self then
		if ViewEnt == Ent then
			Ent = self
		else
			Ent = ViewEnt
		end
	else
		Ent = ViewEnt
	end

	local sVel = self:GetVelocity()
	local oVel = Ent:GetVelocity()

	local SubVel = oVel - sVel
	local SubPos = self:GetPos() - Ent:GetPos()

	local DirPos = SubPos:GetNormalized()
	local DirVel = SubVel:GetNormalized()

	local A = math.acos( math.Clamp( DirVel:Dot( DirPos ) ,-1,1) )

	return (1 + math.cos( A ) * SubVel:Length() / 13503.9)
end

function ENT:Think()
	if self.snd then
		self.snd:ChangePitch( 100 * self:CalcDoppler(), 1 )
		self.snd:ChangeVolume(math.Clamp(-(self:GetVelocity().z + 1000) / 3000,0,1), 2)
	end

	if self.IsEnabled then return end

	if self:GetActive() then
		self:Enable()
	end
end

function ENT:Draw()
	local T = CurTime()

	if not self:GetActive() then
		self._PreventDrawTime = T + 0.1
		return
	end

	if (self._PreventDrawTime or 0) > T then return end

	self:DrawModel()
end

function ENT:SoundStop()
	if self.snd then
		self.snd:Stop()
	end
end

function ENT:OnRemove()
	self:SoundStop()
end

local color_red = Color(255,0,0,255)
local color_red_blocked = Color(100,0,0,255)
local HudTargets = {}
hook.Add( "HUDPaint", "!!!!lvs_bomb_hud", function()
	for ID, _ in pairs( HudTargets ) do
		local Missile = Entity( ID )

		if not IsValid( Missile ) or Missile:GetActive() then
			HudTargets[ ID ] = nil

			continue
		end

		local Grav = physenv.GetGravity()
		local FT = 0.05
		local MissilePos = Missile:GetPos()
		local Pos = MissilePos
		local Vel = Missile:GetSpeed()

		local LastColor = color_red
		local Mask = Missile.GetMaskSolid and (Missile:GetMaskSolid() and MASK_SOLID or MASK_SOLID_BRUSHONLY) or MASK_SOLID_BRUSHONLY

		cam.Start3D()
		local Iteration = 0
		while Iteration < 1000 do
			Iteration = Iteration + 1

			Vel = Vel + Grav * FT

			local StartPos = Pos
			local EndPos = Pos + Vel * FT

			local trace = util.TraceLine( {
				start = StartPos,
				endpos = EndPos,
				mask = Mask,
			} )

			local traceVisible = util.TraceLine( {
				start = MissilePos,
				endpos = StartPos,
				mask = Mask,
			} )

			LastColor = traceVisible.Hit and color_red_blocked or color_red

			render.DrawLine( StartPos, EndPos, LastColor )

			Pos = EndPos

			if trace.Hit then
				break
			end
		end
		cam.End3D()

		local TargetPos = Pos:ToScreen()

		if not TargetPos.visible then continue end

		surface.DrawCircle( TargetPos.x, TargetPos.y, 20, LastColor )
	end
end )

net.Receive( "lvs_bomb_hud", function( len )
	local ent = net.ReadEntity()

	if not IsValid( ent ) then return end

	HudTargets[ ent:EntIndex() ] = true
end )

--PATH addons/lvs_cars_3027255911/lua/entities/lvs_tank_wheeldrive/modules/sh_turret.lua:
ENT.TurretPodIndex = 1 -- 1 = driver

ENT.TurretAimRate = 25

ENT.TurretRotationSound = "vehicles/tank_turret_loop1.wav"
ENT.TurretRotationSoundDamaged = "lvs/turret_damaged_loop.wav"

ENT.TurretFakeBarrel = false
ENT.TurretFakeBarrelRotationCenter = vector_origin

ENT.TurretPitchPoseParameterName = "turret_pitch"
ENT.TurretPitchMin = -15
ENT.TurretPitchMax = 15
ENT.TurretPitchMul = 1
ENT.TurretPitchOffset = 0

ENT.TurretYawPoseParameterName = "turret_yaw"
ENT.TurretYawMul = 1
ENT.TurretYawOffset = 0

ENT.TurretRateDestroyedMul = 0.25

function ENT:TurretSystemDT()
	self:AddDT( "Bool", "NWTurretEnabled" )
	self:AddDT( "Bool", "NWTurretDestroyed" )
	self:AddDT( "Bool", "TurretDamaged" )
	self:AddDT( "Entity", "NWTurretArmor" )

	if SERVER then
		self:SetTurretEnabled( true )
		self:SetTurretPitch( self.TurretPitchOffset )
		self:SetTurretYaw( self.TurretYawOffset )
	end
end

function ENT:SetTurretDestroyed( new )
	self:SetNWTurretDestroyed( new )
	self:SetTurretDamaged( new )
end

function ENT:GetTurretDestroyed( new )
	return self:GetNWTurretDestroyed()
end

function ENT:SetTurretEnabled( new )
	self:SetNWTurretEnabled( new )
end

function ENT:SetTurretArmor( TurretArmor )
	self:SetNWTurretArmor( TurretArmor )

	if CLIENT then return end

	TurretArmor.OnDestroyed = function( ent, dmginfo )
		if not IsValid( self ) then return end

		self:SetTurretDestroyed( true )
	end

	TurretArmor.OnRepaired = function( ent )
		if not IsValid( self ) then return end

		self:SetTurretDestroyed( false )
	end

	TurretArmor.OnHealthChanged = function( ent, dmginfo, old, new )
		if new >= old then return end

		self:SetTurretDamaged( true )
	end
end

function ENT:GetTurretArmor()
	return self:GetNWTurretArmor()
end
function ENT:GetTurretEnabled()
	if self:GetTurretDestroyed() then return false end

	return self:GetNWTurretEnabled()
end

function ENT:SetTurretPitch( num )
	self._turretPitch = num
end

function ENT:SetTurretYaw( num )
	self._turretYaw = num
end

function ENT:GetTurretPitch()
	return (self._turretPitch or self.TurretPitchOffset)
end

function ENT:GetTurretYaw()
	return (self._turretYaw or self.TurretYawOffset)
end

if CLIENT then
	function ENT:UpdatePoseParameters( steer, speed_kmh, engine_rpm, throttle, brake, handbrake, clutch, gear, temperature, fuel, oil, ammeter )
		self:CalcTurret()
	end

	function ENT:CalcTurret()
		local pod = self:GetPassengerSeat( self.TurretPodIndex )

		if not IsValid( pod ) then return end

		local plyL = LocalPlayer()
		local ply = pod:GetDriver()

		if ply ~= plyL then return end

		self:AimTurret()
	end

	net.Receive( "lvs_turret_sync_other", function( len )
		local veh = net.ReadEntity()

		if not IsValid( veh ) then return end

		local Pitch = net.ReadFloat()
		local Yaw = net.ReadFloat()

		if isfunction( veh.SetTurretPitch ) then
			veh:SetTurretPitch( Pitch )
		end

		if isfunction( veh.SetTurretYaw ) then
			veh:SetTurretYaw( Yaw )
		end
	end )
else
	util.AddNetworkString( "lvs_turret_sync_other" )

	function ENT:OnPassengerChanged( Old, New, PodIndex )
		if PodIndex ~= self.TurretPodIndex then return end

		if IsValid( New ) then return end

		net.Start( "lvs_turret_sync_other" )
			net.WriteEntity( self )
			net.WriteFloat( self:GetTurretPitch() )
			net.WriteFloat( self:GetTurretYaw() )
		net.Broadcast()
	end

	function ENT:CalcTurretSound( Pitch, Yaw, AimRate )
		local DeltaPitch = Pitch - self:GetTurretPitch()
		local DeltaYaw = Yaw - self:GetTurretYaw()

		local PitchVolume = math.abs( DeltaPitch ) / AimRate
		local YawVolume = math.abs( DeltaYaw ) / AimRate

		local PlayPitch = PitchVolume > 0.95
		local PlayYaw = YawVolume > 0.95

		local TurretArmor = self:GetTurretArmor()
		local Destroyed = self:GetTurretDamaged()

		if Destroyed and (PlayPitch or PlayYaw) and IsValid( TurretArmor ) then
			local T = CurTime()

			if (self._NextTurDMGfx or 0) < T then
				self._NextTurDMGfx = T + 0.1

				local effectdata = EffectData()
				effectdata:SetOrigin( TurretArmor:LocalToWorld( Vector(0,0,TurretArmor:GetMins().z) ) )
				effectdata:SetNormal( self:GetUp() )
				util.Effect( "lvs_physics_turretscraping", effectdata, true, true )
			end
		end

		if PlayPitch or PlayYaw then
			self:DoTurretSound()
		end

		local T = self:GetTurretSoundTime()

		if T > 0 then
			local volume = math.max( PitchVolume, YawVolume )
			local pitch = 90 + 10 * (1 - volume)

			if Destroyed then
				local sound = self:StartTurretSoundDMG()

				pitch = pitch * self.TurretRateDestroyedMul

				sound:ChangeVolume( volume * 0.25, 0.25 )
			end
	
			local sound = self:StartTurretSound()

			sound:ChangeVolume( volume * 0.25, 0.25 )
			sound:ChangePitch( pitch, 0.25 )
		else
			self:StopTurretSound()
			self:StopTurretSoundDMG()
		end
	end

	function ENT:DoTurretSound()
		if not self._TurretSound then self._TurretSound = 0 end

		self._TurretSound = CurTime() + 1.1
	end

	function ENT:GetTurretSoundTime()
		if not self._TurretSound then return 0 end

		return math.max(self._TurretSound - CurTime(),0) / 1
	end

	function ENT:StopTurretSound()
		if not self._turretSND then return end

		self._turretSND:Stop()
		self._turretSND = nil
	end

	function ENT:StartTurretSoundDMG()
		if self._turretSNDdmg then return self._turretSNDdmg end

		self._turretSNDdmg = CreateSound( self, self.TurretRotationSoundDamaged  )
		self._turretSNDdmg:PlayEx(0.5, 100)

		return self._turretSNDdmg
	end

	function ENT:StopTurretSoundDMG()
		if not self._turretSNDdmg then return end

		self._turretSNDdmg:Stop()
		self._turretSNDdmg = nil
	end

	function ENT:StartTurretSound()
		if self._turretSND then return self._turretSND end

		self._turretSND = CreateSound( self, self.TurretRotationSound  )
		self._turretSND:PlayEx(0,100)

		return self._turretSND
	end

	function ENT:OnRemoved()
		self:StopTurretSound()
		self:StopTurretSoundDMG()
	end

	function ENT:OnTick()
		self:AimTurret()
	end

	function ENT:CreateTurretPhysics( data )
		if not isstring( data.follow ) or not isstring( data.mdl ) then return NULL end

		local idFollow = self:LookupAttachment( data.follow )

		local attFollow = self:GetAttachment( idFollow )

		if not attFollow then return NULL end

		local Follower = ents.Create( "lvs_wheeldrive_attachment_follower" )

		if not IsValid( Follower ) then return NULL end

		local Master = ents.Create( "lvs_wheeldrive_steerhandler" )

		if not IsValid( Master ) then Follower:Remove() return NULL end

		Master:SetPos( attFollow.Pos )
		Master:SetAngles( attFollow.Ang )
		Master:Spawn()
		Master:Activate()
		self:DeleteOnRemove( Master )
		self:TransferCPPI( Master )
	
		Follower:SetModel( data.mdl )
		Follower:SetPos( attFollow.Pos )
		Follower:SetAngles( self:GetAngles() )
		Follower:Spawn()
		Follower:Activate()
		Follower:SetBase( self )
		Follower:SetFollowAttachment( idFollow )
		Follower:SetMaster( Master )
		self:TransferCPPI( Follower )
		self:DeleteOnRemove( Follower )

		local B1 = constraint.Ballsocket( Follower, self, 0, 0, self:WorldToLocal( attFollow.Pos ), 0, 0, 1 )
		B1.DoNotDuplicate = true

		local Lock = 0.0001
		local B2 = constraint.AdvBallsocket( Follower,Master,0,0,vector_origin,vector_origin,0,0,-Lock,-Lock,-Lock,Lock,Lock,Lock,0,0,0,1,1)
		B2.DoNotDuplicate = true

		return Follower
	end
end

function ENT:IsTurretEnabled()
	if self:GetHP() <= 0 then return false end

	if not self:GetTurretEnabled() then return false end

	return IsValid( self:GetPassenger( self.TurretPodIndex ) ) or self:GetAI()
end

function ENT:AimTurret()
	if not self:IsTurretEnabled() then if SERVER then self:StopTurretSound() self:StopTurretSoundDMG() end return end

	local EntTable = self:GetTable()

	local weapon = self:GetWeaponHandler( EntTable.TurretPodIndex )

	if not IsValid( weapon ) then return end

	local AimAngles = self:WorldToLocalAngles( weapon:GetAimVector():Angle() )

	if EntTable.TurretFakeBarrel then
		AimAngles = self:WorldToLocalAngles( (self:LocalToWorld( EntTable.TurretFakeBarrelRotationCenter ) - weapon:GetEyeTrace().HitPos):Angle() )
	end

	local AimRate = EntTable.TurretAimRate * FrameTime() 

	if self:GetTurretDamaged() then
		AimRate = AimRate * EntTable.TurretRateDestroyedMul
	end

	local Pitch = math.Clamp( math.ApproachAngle( self:GetTurretPitch(), AimAngles.p, AimRate ), EntTable.TurretPitchMin, EntTable.TurretPitchMax )
	local Yaw = math.ApproachAngle( self:GetTurretYaw(), AimAngles.y, AimRate )

	if EntTable.TurretYawMin and EntTable.TurretYawMax then
		Yaw = math.Clamp( Yaw, EntTable.TurretYawMin, EntTable.TurretYawMax )
	end

	if SERVER then
		self:CalcTurretSound( Pitch, Yaw, AimRate )
	end

	self:SetTurretPitch( Pitch )
	self:SetTurretYaw( Yaw )

	self:SetPoseParameter(EntTable.TurretPitchPoseParameterName, EntTable.TurretPitchOffset + self:GetTurretPitch() * EntTable.TurretPitchMul )
	self:SetPoseParameter(EntTable.TurretYawPoseParameterName, EntTable.TurretYawOffset + self:GetTurretYaw() * EntTable.TurretYawMul )
end

--PATH addons/lvs_base-main/lua/entities/lvs_vehicle_repair.lua:
AddCSLuaFile()

ENT.Type            = "anim"

ENT.PrintName = "Maintenance Station"
ENT.Author = "Luna"
ENT.Information = "Repairs Vehicles"
ENT.Category = "[LVS]"

ENT.Spawnable		= true
ENT.AdminOnly		= false

if SERVER then
	function ENT:SpawnFunction( ply, tr, ClassName )
		if not tr.Hit then return end

		local ent = ents.Create( ClassName )
		ent:SetPos( tr.HitPos + tr.HitNormal )
		ent:Spawn()
		ent:Activate()

		return ent
	end

	function ENT:OnTakeDamage( dmginfo )
	end

	function ENT:Initialize()	
		self:SetModel( "models/props_vehicles/generatortrailer01.mdl" )
		self:PhysicsInit( SOLID_VPHYSICS )
		self:DrawShadow( false )
		self:SetTrigger( true )
		self:SetCollisionGroup( COLLISION_GROUP_WORLD )
	end

	function ENT:Refil( entity )
		if not IsValid( entity ) then return end

		if not entity.LVS then return end

		local Repaired = false

		if entity:GetHP() ~= entity:GetMaxHP() then
			entity:SetHP( entity:GetMaxHP() )

			Repaired = true
		end

		if entity:OnArmorMaintenance() then
			Repaired = true
		end

		if Repaired then
			entity:EmitSound("npc/dog/dog_servo2.wav")
		end

		if entity:WeaponRestoreAmmo() then
			entity:EmitSound("items/ammo_pickup.wav")
		end

		entity:OnMaintenance()
	end

	function ENT:StartTouch( entity )
		self:Refil( entity )
	end

	function ENT:EndTouch( entity )
		self:Refil( entity )
	end

	function ENT:Touch( entity )
	end

	function ENT:Think()
		return false
	end
end

if CLIENT then
	local WhiteList = {
		["weapon_physgun"] = true,
		["weapon_physcannon"] = true,
		["gmod_tool"] = true,
	}

	local mat = Material( "models/wireframe" )
	local FrameMat = Material( "lvs/3d2dmats/frame.png" )
	local RepairMat = Material( "lvs/3d2dmats/repair.png" )
	function ENT:Draw()
		local ply = LocalPlayer()
		local Small = false

		if IsValid( ply ) and not IsValid( ply:lvsGetVehicle() ) then
			self:DrawModel()

			Small = true

			if GetConVarNumber( "cl_draweffectrings" ) == 0 then return end

			local ply = LocalPlayer()
			local wep = ply:GetActiveWeapon()

			if not IsValid( wep ) then return end

			local weapon_name = wep:GetClass()

			if not WhiteList[ weapon_name ] then
				return
			end
		end

		local Pos = self:GetPos()

		for i = 0, 180, 180 do
			cam.Start3D2D( self:LocalToWorld( Vector(0,0, self:OBBMins().z + 2 ) ), self:LocalToWorldAngles( Angle(i,90,0) ), 0.25 )
				surface.SetDrawColor( 255, 150, 0, 255 )

				surface.SetMaterial( FrameMat )
				surface.DrawTexturedRect( -512, -512, 1024, 1024 )

				surface.SetMaterial( RepairMat )
				if Small then
					surface.DrawTexturedRect( -256, 0, 512, 512 )
				else
					surface.DrawTexturedRect( -512, -512, 1024, 1024 )
				end
			cam.End3D2D()
		end
	end
end
--PATH addons/lvs_cars_3027255911/lua/entities/lvs_wheeldrive_vw_touareg_1/cl_init.lua:
include("shared.lua")

function ENT:UpdatePoseParameters( steer, speed_kmh, engine_rpm, throttle, brake, handbrake, clutch, gear, temperature, fuel, oil, ammeter )
	self:SetPoseParameter( "vehicle_steer", steer )
	self:SetPoseParameter( "tacho_gauge", engine_rpm / 6000 )
	self:SetPoseParameter( "temp_gauge", temperature )
	self:SetPoseParameter( "fuel_gauge", fuel )
	self:SetPoseParameter( "oil_gauge", oil )
	self:SetPoseParameter( "alt_gauge", ammeter )
	self:SetPoseParameter( "vehicle_gauge", speed_kmh / 280 )
	self:SetPoseParameter( "throttle_pedal", throttle )
	self:SetPoseParameter( "brake_pedal", brake )
	self:SetPoseParameter( "handbrake_pedal", handbrake )
	self:SetPoseParameter( "clutch_pedal", clutch )

	local GearIDtoPose = {
		[-1] = 0,
		[1] = 1,
	}

	self:SetPoseParameter( "gear",  self:QuickLerp( "gear", (GearIDtoPose[ gear ] or 1) ) )

	local hours = os.date( "%H" )
	local min = os.date( "%M" ) 

	local hourb  = hours % 10
	local houra =  ((hours - hourb) % 100) / 10

	local minb  = min % 10
	local mina =  ((min - minb) % 100) / 10

	self:SetPoseParameter( "digital_1", houra )
	self:SetPoseParameter( "digital_2", hourb )

	self:SetPoseParameter( "digital_3", mina )
	self:SetPoseParameter( "digital_4", minb )

end
--PATH addons/lvs_cars_3027255911/lua/entities/lvs_wheeldrive_wheel/shared.lua:

ENT.PrintName = "Wheel"

ENT.Type            = "anim"
ENT.DoNotDuplicate = true

ENT.RenderGroup = RENDERGROUP_BOTH 

ENT._lvsRepairToolLabel = "Wheel"

function ENT:SetupDataTables()
	self:NetworkVar( "Float", 0, "Radius")
	self:NetworkVar( "Float", 1, "Width")

	self:NetworkVar( "Float", 2, "Camber" )
	self:NetworkVar( "Float", 3, "Caster" )
	self:NetworkVar( "Float", 4, "Toe" )

	self:NetworkVar( "Float", 5, "RPM" )

	self:NetworkVar( "Float", 6, "HP" )
	self:NetworkVar( "Float", 7, "MaxHP" )

	self:NetworkVar( "Angle", 0, "AlignmentAngle" )

	self:NetworkVar( "Entity", 0, "Base" )

	self:NetworkVar( "Bool", 0, "HideModel" )
	self:NetworkVar( "Bool", 1, "Destroyed" )
	self:NetworkVar( "Bool", 2, "NWDamaged" )
	self:NetworkVar( "Bool", 3, "WheelChainMode" )

	if SERVER then
		self:SetMaxHP( 100 )
		self:SetHP( 100 )
		self:SetWidth( 3 )

		self:NetworkVarNotify( "HP", self.HealthValueChanged )
	end
end

function ENT:GetDamaged()
	return self:GetNWDamaged()
end

function ENT:VelToRPM( speed )
	if not speed then return 0 end

	return speed * 60 / math.pi / (self:GetRadius() * 2)
end

function ENT:RPMToVel( rpm )
	if not rpm then return 0 end

	return (math.pi * rpm * self:GetRadius() * 2) / 60
end

function ENT:CheckAlignment()
	self.CamberCasterToe = (math.abs( self:GetToe() ) + math.abs( self:GetCaster() ) + math.abs( self:GetCamber() )) ~= 0

	if CLIENT then return end

	local SteerType = self:GetSteerType()
	local Caster = self:GetCaster()

	local Camber = math.abs( self:GetCamber() )
	local CamberValue1 = (math.min( Camber, 15 ) / 15) * 0.3
	local CamberValue2 = (math.Clamp( Camber - 15, 0, 65 ) / 65) * 0.7

	local CasterValue = (math.min( math.abs( Caster ), 15 ) / 15) * math.max( 1 - Camber / 10, 0 )

	if SteerType == LVS.WHEEL_STEER_NONE then CasterValue = 0 end

	if SteerType == LVS.WHEEL_STEER_FRONT and Caster < 0 then CasterValue = 0 end

	if SteerType == LVS.WHEEL_STEER_REAR and Caster > 0 then CasterValue = 0 end

	local TractionValue = 1 - CamberValue1 -  CamberValue2 + CasterValue

	self:PhysicsMaterialUpdate( TractionValue )

	return TractionValue
end
--PATH addons/_mayor_voting_systems/lua/entities/npc_mayorvoting/shared.lua:
ENT.Type 				= "anim";
ENT.Base 				= "base_anim";
ENT.PrintName			= "Mayor Voting NPC";
ENT.Author				= "Chuteuk";
ENT.Purpose				= "Used for mayor election system.";

ENT.Spawnable			= false;
ENT.AdminSpawnable		= false;

function ENT:OnRemove()
end
--PATH addons/_pcasino/lua/entities/pcasino_sign_wall_logo/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Sign Wall Logo"
ENT.Author = "Owain Owjo & The One Free-Man"
ENT.Category = "pCasino"
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.noDrag = true

PerfectCasino.Core.RegisterEntity("pcasino_sign_wall_logo", {
},
"models/freeman/owain_casinosign_wall.mdl")
--PATH addons/__main/lua/entities/savav_antidtugs/shared.lua:
ENT.Base = "base_anim"
ENT.Type = "anim"

ENT.PrintName		= "Anti Drugs"
ENT.Author			= "SaVav"
ENT.Category 		= "SaVav's trash"
ENT.Contact    		= ""
ENT.Purpose 		= "take it"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true


--PATH gamemodes/darkrp/entities/entities/spawned_npc_quest/shared.lua:
ENT.Base = 'base_ai'
ENT.Type = 'ai'
ENT.PrintName = 'QUEST'
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true
ENT.Category = 'RP NPCs'
--PATH gamemodes/darkrp/entities/entities/spawned_weapon/cl_init.lua:

include('shared.lua')

function ENT:Draw()
	self:DrawModel()
end
--PATH addons/uweedadvancedcannabisgrowth/lua/entities/uweed_npc/cl_init.lua:
include("shared.lua")

local grn = Color(0, 0, 0, 255)
local xpos = 100
local ypos = -50
function ENT:Draw()
	self:DrawModel()
end

function ENT:DrawTranslucent()
	if self:GetPos():Distance(LocalPlayer():GetPos()) > 500 then return end
	local ang = LocalPlayer():EyeAngles()

	local pos
    if self:LookupBone("ValveBiped.Bip01_Head1") != nil then
    	pos = self:GetBonePosition(self:LookupBone("ValveBiped.Bip01_Head1")) + Vector(0,0,3)
    else 
    	pos = self:GetPos()+ Vector(0,0,68)
    end 

	surface.SetFont('uweed_font_60')
	local text = string.format(UWeed.Translation.NPC.Sell, DarkRP.formatMoney(self:GetSellPrice()))
	local size = surface.GetTextSize(text)

	ang:RotateAroundAxis(ang:Forward(), 90)
	ang:RotateAroundAxis(ang:Right(), 90)

	cam.Start3D2D(pos, ang, 0.06)
		-- Background
		draw.RoundedBox(0, xpos, ypos+0, 15 + size, 170, Color(0, 0, 0, 225))
		-- Side bar
		draw.RoundedBox(0, xpos, ypos+0, 10, 170, grn)
	
		draw.SimpleText(string.upper(UWeed.Translation.NPC.Title), "uweed_font_80", xpos+10, ypos+35, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		draw.SimpleText(text, "uweed_font_60", xpos+10, ypos+90, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		draw.SimpleText(UWeed.Translation.NPC.Holding.." "..DarkRP.formatMoney(self:GetHolding()*self:GetSellPrice()), "uweed_font_60", xpos+10, ypos+140, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	cam.End3D2D()
end
--PATH addons/uweedadvancedcannabisgrowth/lua/entities/uweed_npc/shared.lua:
-- More basic setup
ENT.Type = "ai"
ENT.Base = "base_ai"
ENT.PrintName = "[UWeed] NPC"
ENT.Author = "Owain Owjo"
ENT.Category = "UWeed"
ENT.Spawnable = true
ENT.RenderGroup = RENDERGROUP_BOTH
ENT.AdminSpawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "SellPrice")
	self:NetworkVar("Int", 1, "Holding")
end
--PATH addons/__snow_event/lua/entities/zck_snowball/cl_init.lua:
include( 'shared.lua' )
function ENT:Draw()
	self:DrawModel()
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Initialize()
	ParticleEffectAttach( 'zck_snowball_trail', PATTACH_POINT_FOLLOW, self, 0 )
end

function ENT:OnRemove()
	ParticleEffect( 'zck_snowball_explode', self:GetPos(), angle_zero, NULL )
	self:EmitSound( 'zck_snowball_impact' )
end
--PATH addons/__snow_event/lua/entities/zck_snowball/shared.lua:
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.PrintName = "Сніжок"
ENT.Category = "Main"
ENT.RenderGroup = RENDERGROUP_OPAQUE

--PATH addons/__snow_event/lua/entities/zck_snowballcrate/cl_init.lua:
include( 'shared.lua' )
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
		self:EmitSound( 'zck_snowball_pickup' )
		ParticleEffect( 'zck_snowball_pickup', self:GetPos() + self:GetUp() * 15, angle_zero, NULL )
		self.UsedCrateCount = used
	end
end
--PATH addons/_drones/lua/effects/dronesrewrite_muzzleflashblaster.lua:
AddCSLuaFile()

function EFFECT:Init(data)
	self.Start = data:GetOrigin()
	self.Forward = data:GetNormal()

	self.Emitter = ParticleEmitter(self.Start)

	local dlight = DynamicLight(self:EntIndex())
	if dlight then
		dlight.pos = self.Start
		dlight.r = 100
		dlight.g = 170
		dlight.b = 255
		dlight.brightness = 1
		dlight.Decay = 1
		dlight.Size = math.random(150, 300)
		dlight.DieTime = CurTime()
	end

	local p = self.Emitter:Add("sprites/heatwave", self.Start - self.Forward * 2)
	p:SetVelocity(120 * self.Forward + 20 * VectorRand() * 2)
	p:SetGravity(Vector(0, 0, 100))
	p:SetAirResistance(160)
	p:SetDieTime(math.Rand(0.1, 0.15))
	p:SetStartSize(30)
	p:SetEndSize(0)
	p:SetRoll(math.Rand(180, 480))
	p:SetRollDelta(math.Rand(-1, 1))

	for a = 1, 12 do
		for i = 1, 4 do
			local p = self.Emitter:Add("sprites/light_glow02_add", self.Start + i * 4 * self.Forward)

			p:SetAirResistance(200)
			p:SetVelocity(6 * VectorRand())
			p:SetDieTime(math.Rand(0.05, 0.15))
			p:SetStartAlpha(155)
			p:SetStartSize(0)
			p:SetEndSize(34 - i * 6)
			p:SetRoll(math.Rand(180, 480))
			p:SetRollDelta(math.Rand(-1, 1))
			p:SetColor(100, 170, 255)	
		end
	end
	
	self.Emitter:Finish()
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end






--PATH addons/_drones/lua/effects/dronesrewrite_muzzleflashgrn.lua:
AddCSLuaFile()

function EFFECT:Init(data)
	self.Start = data:GetOrigin()
	self.Forward = data:GetNormal()

	self.Emitter = ParticleEmitter(self.Start)

	for i = 1, 4 do
		local p = self.Emitter:Add("particle/smokesprites_000" .. math.random(1, 9), self.Start)

		p:SetAirResistance(100)
		p:SetVelocity(self.Forward * i * 20 + VectorRand() * 5)
		p:SetGravity(Vector(0, 0, 4))
		p:SetDieTime(math.Rand(0.5, 1))
		p:SetStartAlpha(64)
		p:SetEndAlpha(0)
		p:SetStartSize(0)
		p:SetEndSize(20)
		p:SetRollDelta(math.Rand(-2, 2))
		p:SetColor(120, 120, 120)
	end	

	self.Emitter:Finish()
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end






--PATH addons/_drones/lua/effects/dronesrewrite_obs_laser.lua:
AddCSLuaFile()

local mat3 = Material("sprites/orangecore1")
local mat2 = Material("particle/warp1_warp")

local mat = Material("cable/physbeam")

function EFFECT:Init(data)
	self.Start = data:GetOrigin()
	self.End = self.Start + vector_up * 90000
	self.Life = CurTime() + 1.4
	self.Size = 1000

	self:SetRenderBoundsWS(self.Start, self.End)
end

function EFFECT:Think()
	if CurTime() > self.Life then return false end
	self.Size = math.Approach(self.Size, 0, 15)

	return true
end

function EFFECT:Render()
	render.SetMaterial(mat)
	render.DrawBeam(self.Start, self.End, math.Rand(64, 256), 0, 0, Color(255, 255, 255, 255))

	render.SetMaterial(mat3)
	render.DrawSprite(self.Start, self.Size, self.Size, Color(255, 255, 255, 255 - (self.Size * 0.255)))

	render.SetMaterial(mat2)
	local new = 2000 - self.Size * 2
	render.DrawSprite(self.Start, new, new, Color(255, 255, 255, self.Size * 0.255))
end






--PATH addons/lvs_base-main/lua/effects/lvs_physics_impact.lua:

local Materials = {
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
	if not LVS.ShowPhysicsEffects then return end

	local dir = data:GetNormal()
	local pos  = data:GetOrigin() + dir

	local emitter = ParticleEmitter( pos, false )

	for i = 0, 10 do
		local particle = emitter:Add( "effects/spark", pos )

		local vel = VectorRand() * 75 + dir * 75 + Vector(0,0,100)

		if not particle then continue end

		particle:SetVelocity( vel )
		particle:SetDieTime( math.Rand(2.5,5) )
		particle:SetAirResistance( 10 ) 
		particle:SetStartAlpha( 255 )

		particle:SetStartLength( 6 )
		particle:SetEndLength(0)

		particle:SetStartSize( 3 )
		particle:SetEndSize( 0 )

		particle:SetRoll( math.Rand(-5,5) )
		particle:SetColor( 255, 200, 50 )
		particle:SetGravity( Vector(0,0,-600) )
		particle:SetCollide( true )
	end

	local smoke = emitter:Add( Materials[ math.random(1, #Materials ) ], pos )

	if smoke then
		smoke:SetVelocity( dir * 30 + VectorRand() * 15 )
		smoke:SetDieTime( math.Rand(1.5,3) )
		smoke:SetAirResistance( 100 ) 
		smoke:SetStartAlpha( 100 )
		smoke:SetEndAlpha( 0 )
		smoke:SetStartSize( 15 )
		smoke:SetEndSize( 30 )
		smoke:SetColor(30,30,30)
		smoke:SetGravity(Vector(0,0,40))
		smoke:SetCollide( false )
		smoke:SetRollDelta( math.Rand(-1,1) )
	end

	local flash = emitter:Add( "effects/yellowflare",pos )

	if flash then
		flash:SetPos( pos )
		flash:SetStartAlpha( 200 )
		flash:SetEndAlpha( 0 )
		flash:SetColor( 255, 200, 0 )
		flash:SetEndSize( 100 )
		flash:SetDieTime( 0.1 )
		flash:SetStartSize( 0 )
	end

	emitter:Finish()
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end

--PATH addons/lvs_cars_3027255911/lua/effects/lvs_physics_wheeldust.lua:

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

EFFECT.DustMat = {
	"effects/lvs_base/particle_debris_01",
	"effects/lvs_base/particle_debris_02",
}

function EFFECT:Init( data )
	local pos = data:GetOrigin()
	local ent = data:GetEntity()

	if not IsValid( ent ) then return end

	local dir = data:GetNormal()
	local scale = data:GetMagnitude()

	local underwater = data:GetFlags() == 1

	local emitter = ent:GetParticleEmitter( ent:GetPos() )

	local VecCol = render.GetLightColor( pos + dir ) * 0.5

	if underwater then
		VecCol = (VecCol * 0.25 + Vector(0.75,0.75,0.75)) * 255
	else
		VecCol = (VecCol + Vector(0.3,0.25,0.15)) * 255
	end

	local DieTime = math.Rand(0.8,1.6)

	for i = 1, 5 do
		local particle = emitter:Add( self.DustMat[ math.random(1,#self.DustMat) ] , pos )

		if not particle then continue end

		particle:SetVelocity( (dir * 50 * i + VectorRand() * 25) * scale )
		particle:SetDieTime( (i / 8) * DieTime )
		particle:SetAirResistance( 10 ) 
		particle:SetStartAlpha( 255 )
		particle:SetStartSize( 10 * scale )
		particle:SetEndSize( 20 * i * scale )
		particle:SetRollDelta( math.Rand(-1,1) )
		particle:SetColor( math.min( VecCol.r, 255 ), math.min( VecCol.g, 255 ), math.min( VecCol.b, 255 ) )
		particle:SetGravity( Vector(0,0,-600) * scale )
		particle:SetCollide( false )
	end

	for i = 1, 5 do
		local particle = emitter:Add( underwater and "effects/splash4" or self.SmokeMat[ math.random(1,#self.SmokeMat) ] , pos )

		if not particle then continue end

		particle:SetVelocity( (dir * 50 * i + VectorRand() * 40) * scale )
		particle:SetDieTime( (i / 8) * DieTime )
		particle:SetAirResistance( 10 ) 
		particle:SetStartAlpha( underwarter and 150 or 255 )
		particle:SetStartSize( 10 * scale )
		particle:SetEndSize( 20 * i * scale )
		particle:SetRollDelta( math.Rand(-1,1) )
		particle:SetColor( math.min( VecCol.r, 255 ), math.min( VecCol.g, 255 ), math.min( VecCol.b, 255 ) )
		particle:SetGravity( Vector(0,0,-600) * scale )
		particle:SetCollide( false )
	end
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end

--PATH addons/lvs_base-main/lua/effects/lvs_tracer_orange.lua:

EFFECT.MatBeam = Material( "effects/lvs_base/spark" )

function EFFECT:Init( data )
	local pos  = data:GetOrigin()
	local dir = data:GetNormal()

	self.ID = data:GetMaterialIndex()

	self:SetRenderBoundsWS( pos, pos + dir * 50000 )
end

function EFFECT:Think()
	if not LVS:GetBullet( self.ID ) then return false end

	return true
end

function EFFECT:Render()
	local bullet = LVS:GetBullet( self.ID )

	local endpos = bullet:GetPos()
	local dir = bullet:GetDir()

	local len = 1600 * bullet:GetLength()

	render.SetMaterial( self.MatBeam )
	render.DrawBeam( endpos - dir * len, endpos + dir * len, 3, 1, 0, Color( 255, 255, 0, 255 ) )
	render.DrawBeam( endpos - dir * len, endpos + dir * len, 10, 1, 0, Color( 125, 50, 0, 255 ) )
end

--PATH addons/lvs_base-main/lua/effects/lvs_tracer_yellow.lua:

EFFECT.MatBeam = Material( "effects/lvs_base/spark" )

function EFFECT:Init( data )
	local pos  = data:GetOrigin()
	local dir = data:GetNormal()

	self.ID = data:GetMaterialIndex()

	self:SetRenderBoundsWS( pos, pos + dir * 50000 )
end

function EFFECT:Think()
	if not LVS:GetBullet( self.ID ) then return false end

	return true
end

function EFFECT:Render()
	local bullet = LVS:GetBullet( self.ID )

	local endpos = bullet:GetPos()
	local dir = bullet:GetDir()

	local len = 1600 * bullet:GetLength()

	render.SetMaterial( self.MatBeam )
	render.DrawBeam( endpos - dir * len, endpos + dir * len, 3, 1, 0, Color( 255, 255, 125, 255 ) )
	render.DrawBeam( endpos - dir * len, endpos + dir * len, 10, 1, 0, Color( 125, 80, 0, 255 ) )
end

--PATH addons/____inventory/lua/itemstore/containers.lua:
itemstore.containers = {}
itemstore.containers.Active = {}

local Container = {}

AccessorFunc( Container, "Owner", "Owner" )
AccessorFunc( Container, "Suppressed", "Suppressed", FORCE_BOOL )
AccessorFunc( Container, "Width", "Width", FORCE_NUMBER )
AccessorFunc( Container, "Height", "Height", FORCE_NUMBER )
AccessorFunc( Container, "Pages", "Pages", FORCE_NUMBER )

function Container:GetID()
	return self.ID
end

function Container:IsValid()
	return self:GetID() and itemstore.containers.Active[ self:GetID() ] == self
end

function Container:Remove()
	itemstore.containers.Remove( self:GetID() )
end

function Container:GetPageSize()
	return self:GetWidth() * self:GetHeight()
end

function Container:GetPageFromSlot( slot )
	return math.ceil( slot / self:GetPageSize() )
end

function Container:SetSize( w, h, pages )
	self:SetWidth( w )
	self:SetHeight( h )
	self:SetPages( pages )

	self:QueueSync()
end

function Container:GetSize()
	return self:GetPageSize() * self:GetPages()
end

function Container:CoordsToSlot( x, y, p )
	return ( ( p - 1 ) * self:GetPageSize() ) + ( ( y - 1 ) * self:GetWidth() + x )
end

function Container:GetItems()
	return self.Items
end

function Container:GetItem( slot )
	return self.Items[ slot ]
end

function Container:SetItem( slot, item )
	if item and not item:IsValid() then return end

	slot = math.floor( slot )

	if slot >= 1 and slot <= self:GetSize() then
		if self:RunCallbacks( "set", slot, item ) == false then return end

		self.Items[ slot ] = item

		if item then
			item.Container = self
			item.Slot = slot
		end

		if SERVER then self:QueueSync() end
	end
end

function Container:FirstEmptySlot()
	for i = 1, self:GetSize() do
		if not self:GetItem( i ) then
			return i
		end
	end

	return false
end

function Container:CanFit( item )
	for i = 1, self:GetSize() do
		local merge_item = self:GetItem( i )

		if merge_item and merge_item:CanMerge( item ) then
			return true
		end
	end

	return self:FirstEmptySlot() ~= false
end

function Container:AddItem( item, dontmerge )
	if not dontmerge then
		for i = 1, self:GetSize() do
			local merge_item = self:GetItem( i )

			if merge_item and merge_item:CanMerge( item ) then
				merge_item:Merge( item )
				self:QueueSync()

				return i, merge_item
			end
		end
	end

	local slot = self:FirstEmptySlot()

	if slot then
		self:SetItem( slot, item )
		return slot
	end

	return false
end

function Container:HasItem( item_class )
	for k, v in pairs( self:GetItems() ) do
		if v:GetClass() == item_class then
			return k
		end
	end

	return false
end

function Container:CountItems( item_class )
	local amount = 0

	for _, item in pairs( self:GetItems() ) do
		if item:GetClass() == item_class then
			amount = amount + item:GetAmount()
		end
	end

	return amount
end

-- 76561198843434426

function Container:TakeItems( item_class, amount )
	local amount_taken = 0

	self:Suppress( function()
		for k, v in pairs( self:GetItems() ) do
			if v:GetClass() == item_class then
				local amount_to_take = v:GetAmount()
				amount_to_take = math.Clamp( amount_to_take, 0, amount )

				v:SetAmount( v:GetAmount() - amount_to_take )

				if v:GetAmount() <= 0 then
					self:SetItem( k, nil )
				end

				amount_taken = amount_taken + amount_to_take
				amount = amount - amount_to_take
			end
		end

		return true
	end )

	return amount_taken
end

function Container:GetDefaultPermissions()
	return self.DefaultPermissions
end

function Container:GetPermissions( pl )
	return self.Permissions[ pl ] or self:GetDefaultPermissions()
end

function Container:SetDefaultPermissions( read, write )
	self.DefaultPermissions = { Read = read, Write = write }
end

function Container:SetPermissions( pl, read, write )
	self.Permissions[ pl ] = { Read = read, Write = write }
end

function Container:CanRead( pl, ... )
	local res = hook.Call( "ItemStoreCanRead", nil, self, pl, ... )
	if res ~= nil then
		return res
	end

	if self.Permissions[ pl ] then
		return self.Permissions[ pl ].Read
	end

	local res = self:RunCallbacks( "read", pl, ... )
	if res ~= nil then
		return res
	end

	return self.DefaultPermissions.Read
end

function Container:CanWrite( pl, action, ... )
	local res = hook.Call( "ItemStoreCanWrite", nil, self, pl, action, ... )
	if res ~= nil then
		return res
	end

	if self.Permissions[ pl ] then
		return self.Permissions[ pl ].Write
	end

	local res = self:RunCallbacks( "write", pl, action, ... )
	if res ~= nil then
		return res
	end

	return self.DefaultPermissions.Write
end

function Container:AddCallback( name, func )
	if not self.Callbacks[ name ] then
		self.Callbacks[ name ] = {}
	end

	return table.insert( self.Callbacks[ name ], func )
end

function Container:RemoveCallback( name, id )
	if self.Callbacks[ name ] then
		self.Callbacks[ name ][ id ] = nil
	end
end

function Container:RunCallbacks( name, ... )
	if self.Callbacks[ name ] then
		for _, func in pairs( self.Callbacks[ name ] ) do
			local res = func( self, ... )

			if res ~= nil then
				return res
			end
		end
	end
end

function Container:GetSyncTargets()
	players = {}

	for _, pl in ipairs( player.GetAll() ) do
		if self:CanRead( pl ) then
			table.insert( players, pl )
		end
	end

	return players
end

function Container:Suppress( func )
	self:SetSuppressed( true )
		local sync = func()
	self:SetSuppressed( false )

	if sync then self:QueueSync() end
end

function Container:QueueSync()
	self.ShouldSync = true
end

function Container:Sync( pl )
	if SERVER then itemstore.containers.Sync( self:GetID(), pl ) end
end

function itemstore.Container( w, h, pages, dontnetwork )
	local con = {
		ShouldSync = false,

		Width = w or 4,
		Height = h or 4,
		Pages = pages or 1,

		Owner = nil,
		Callbacks = {},
		Permissions = {},
		DefaultPermissions = { Read = false, Write = false },

		Items = {}
	}

	setmetatable( con, { __index = Container } )

	if not dontnetwork then
		con.ID = table.insert( itemstore.containers.Active, con )
		con:Sync()
	end

	return con
end

function itemstore.containers.Get( id )
	return itemstore.containers.Active[ id ]
end

function itemstore.containers.Remove( id )
	itemstore.containers.Active[ id ] = nil
end

if SERVER then
	AddCSLuaFile()

	util.AddNetworkString( "ItemStoreSync" )
	function itemstore.containers.Sync( id, pl )
		local con = itemstore.containers.Active[ id ]

		if not con then return end
		if con:GetSuppressed() then return end

		-- No longer using WriteTable! Net usage has been cut to less than half
		-- This is still pretty damn unoptimized though
		-- Ideally we send only the item that's changing...
		-- But unfortunately it's a bit more complicated than that due to
		-- an item's ability to modify other slots in a container
		net.Start( "ItemStoreSync" )
			net.WriteUInt( con:GetID(), 32 )

			net.WriteUInt( con:GetWidth(), 8 )
			net.WriteUInt( con:GetHeight(), 8 )
			net.WriteUInt( con:GetPages(), 8 )

			net.WriteUInt( table.Count( con.Items ), 16 )

			for k, v in pairs( con.Items ) do
				net.WriteUInt( k, 16 )

				local id = util.NetworkStringToID( v.Class )

				if id == 0 then
					if v.Class then
						error( string.format( "[ItemStore] Tried to send data for unnetworked item %s", v.Class ) )
					else
						error( "[ItemStore] Tried to send data for a classless item" )
					end
				end

				net.WriteUInt( id, 16 )
				v:WriteNetworkData()
			end
		net.Send( pl or con:GetSyncTargets() )
	end

	hook.Add( "Tick", "ItemStoreSyncContainers", function()
		for k, v in pairs( itemstore.containers.Active ) do
			if v.ShouldSync then
				v.ShouldSync = false
				v:Sync()
			end
		end
	end )
else
	itemstore.containers.Panels = {}

	function itemstore.containers.UpdatePanels( id )
		for k, v in pairs( itemstore.containers.Panels ) do
			if IsValid( v ) then
				if v:GetContainerID() == id then
					v:Refresh()
				end
			else
				itemstore.containers.Panels[ k ] = nil
			end
		end
	end

	net.Receive( "ItemStoreSync", function()
		local id = net.ReadUInt( 32 )
		local w, h = net.ReadUInt( 8 ), net.ReadUInt( 8 )
		local pages = net.ReadUInt( 8 )

		local con = itemstore.Container( w, h, pages, true )

		for i = 1, net.ReadUInt( 16 ) do
			local slot = net.ReadUInt( 16 )

			local class = util.NetworkIDToString( net.ReadUInt( 16 ) )
			local item = itemstore.Item( class )
			
			item:ReadNetworkData()

			con:SetItem( slot, item )
		end

		con.ID = id
		itemstore.containers.Active[ id ] = con

		itemstore.containers.UpdatePanels( id )
	end )
end

--PATH addons/____plogs/lua/plogs_hooks/connections.lua:
--[[
addons/lgos/lua/plogs_hooks/connections.lua
--]]
plogs.Register('Коннекти', true, Color(0,255,0))

plogs.AddHook('PlayerInitialSpawn', function(pl)
	plogs.PlayerLog(pl, 'Коннекти', pl:NameID() .. ' зашёл', {
		['Name'] 	= pl:Name(),
		['SteamID']	= pl:SteamID()
	})

	if plogs.cfg.EnableMySQL then
		plogs.sql.LogIP(pl:SteamID64(), pl:IPAddress())
	end
end)

plogs.AddHook('PlayerDisconnected', function(pl)
	plogs.PlayerLog(pl, 'Коннекти', pl:NameID() .. ' вышел', {
		['Name'] 	= pl:Name(),
		['SteamID']	= pl:SteamID()
	})
end)


--PATH addons/____plogs/lua/plogs_hooks/nlr.lua:
--[[
addons/lgos/lua/plogs_hooks/nlr.lua
--]]
plogs.Register( 'NLR', false )
plogs.AddHook( 'PlayerEnterNLRZone', function( pl, time )
	plogs.PlayerLog( pl, 'NLR', pl:NameID() .. ' увійшов до зони NLR "' .. time .. '" секундами, що залишилися', {
		['Name'] = pl:Name(),
		['SteamID'] = pl:SteamID()
	} )
end )

plogs.AddHook( 'PlayerLeaveNLRZone', function( pl, time )
	plogs.PlayerLog( pl, 'NLR', pl:NameID() .. ' залишив зону NLR "' .. time .. '" секундами залишилось', {
		['Name'] = pl:Name(),
		['SteamID'] = pl:SteamID()
	} )
end )
--PATH addons/____esclib/lua/elib/vgui/esc_combolist.lua:
local PANEL = {}

function PANEL:Init()
	self.skin = esclib.addon:GetCurrentSkin()
	self.colors = self.skin.colors 

	self.list = {}
	self.seqlist = {}
	self.panels = {}
	self.navfont = esclib:AdaptiveFont("esclib", 18, 500)
	self.activetextcol = self.colors.button.text_hover
	self.textcol = self.colors.button.text
	self.textcolhover = self.colors.button.text_hover
	self.minsize = 30
	self.dock = LEFT

	local margin = esclib:AdaptiveSize(7)
	self.navbar = self:Add("DPanel")
	local navbar = self.navbar
	navbar:Dock(TOP)
	-- navbar:DockMargin(margin,0,0,margin)
	
	self.navbar.Accent = self.colors.frame.accent2
	self.navbar.PaintBG = false
	self.navbar.ColorBG = self.colors.frame.bg

	local xb2 = 0
	local wb2 = 0
	function navbar.Paint(pnl,w,h)
		if not self.activename then return end 

		local button = self.list[self.activename]
		if not IsValid(button) then return end

		if self.navbar.PaintBG then
			local clr = self.navbar.ColorBG
			surface.SetDrawColor(clr.r,clr.g,clr.b,clr.a)
			surface.DrawRect(0,0,w,h)
		end

		-- draw.RoundedBox(0,0,0,w,h,Color(255,0,0))

		-- surface.SetDrawColor(accent:Unpack())
		-- surface.DrawRect(0,h-3,w,3)

		local xb1,yb1,wb1,hb1 = button:GetBounds()
		
		xb2 = Lerp(0.1, xb2, xb1)
		wb2 = Lerp(0.1, xb2, wb1)

		local clr =  pnl.Accent
		-- surface.SetDrawColor(clr.r,clr.g,clr.b,clr.a)
		-- surface.DrawRect(xb2,0,wb1,h)
		draw.RoundedBox(6,xb2,4,wb1,h-8,clr)
		draw.RoundedBox(4,xb2+1,5,wb1-2,h-10,self.colors.button.main)
	end

	self.content = self:Add("EditablePanel")
end

function PANEL:InvalidateSize()
	local navsize = draw.GetFontHeight(self.navfont)
	self.navbar:SetTall(navsize+15)
	self.navbar:InvalidateParent(true)

	self.content:SetSize(self:GetWide(),self:GetTall()-self.navbar:GetTall())
	self.content:SetPos(0,self.navbar:GetTall())
end

function PANEL:EnableBG(bool)
	self.navbar.PaintBG = bool
end

function PANEL:SetBGColor(col)
	if IsColor(col) then
		self.navbar.ColorBG = col
	end
end

function PANEL:SetAccentColor(col)
	if IsColor(col) then
		self.navbar.Accent = col
	end
end


function PANEL:SetActiveTextColor(col)
	if IsColor(col) then
		self.activetextcol = col
	end
end


function PANEL:SetTextColor(col)
	if IsColor(col) then
		self.textcol = col
	end
end

function PANEL:SetTextHoverColor(col)
	if IsColor(col) then
		self.textcolhover = col
	end
end

function PANEL:SetFont(font)
	self.navfont = font
	self:InvalidateSize()
end

function PANEL:OnChange(active_name)
	--for override
end

function PANEL:RemoveTab(name)
	for k,seq_name in ipairs(self.seqlist) do
		if name == seq_name then
			table.remove(self.seqlist, k)
		end
	end
	if IsValid(self.list[name]) then
		self.list[name]:Remove()
	end
	self.list[name] = nil
end

function PANEL:AddTab(name,func,customCheck)
	if isfunction(customCheck) then
		if not customCheck() then return end
	end
	if not name then return end
	self:InvalidateSize()
	table.insert(self.seqlist,name)

	self.list[name] = vgui.Create("DButton",self.navbar)
	local button = self.list[name]
	button:SetText("")
	button:SetFont(self.navfont)
	button:SetTextColor(self.textcol)
	function button.Paint(pnl,w,h)
		local active = self.activename == name
		local hovered = pnl:IsHovered()
		local clr = hovered and self.textcolhover or (active and self.activetextcol or self.textcol)
		draw.SimpleText(name,self.navfont, w*0.5, h*0.5-1, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	local tsize = esclib.util.GetTextSize(name,self.navfont)
	button:SetWide(math.max(self.minsize,tsize.w+25))
	button:Dock(self.dock)

	function button.DoClick(pnl)
		self:SetActive(name)
		self:OnChange(name)
	end

	self.panels[name] = func

	if #self.seqlist == 1 then
		self:SetActive(name, true)
	end

	return button
end

function PANEL:GetCurrentPanel()
	return self.active
end

function PANEL:SetActive(name, skip_anim)
	if self.activename == name then return end
	if self.panels[name] then
		if IsValid(self.content) then

			local direction = 1
			for k,v in ipairs(self.seqlist) do
				if self.activename == v then
					direction = 1
					break
				elseif name == v then
					direction = -1
					break
				end
			end
			local duration = 0.1
			if skip_anim then duration = 0 end
			self.content:MoveTo(direction*self.content:GetWide(), self.content:GetY(), duration, 0, -1, function()
				if IsValid(self.content) then self.content:Remove() end
				if isfunction(self.panels[name]) then
					self.content = self:Add("EditablePanel")--self.panels[name](self.content)
					self:InvalidateSize()

					self.panels[name](self.content)

					if IsValid(self.content) then
						self.content:SetX(-direction*self.content:GetWide())
						self.content:MoveTo(0,self.content:GetY(),duration)

						self.activename = name
					end
				end
			end)

			return
		end

		self.content = self:Add("EditablePanel")
		self:InvalidateSize()

		self.panels[name](self.content)
		self.activename = name
	end
end

function PANEL:GetActive()
	return self.activename
end

function PANEL:GetNavBar()
	return self.navbar
end

function PANEL:GetContent()
	return self.content
end

function PANEL:Paint(w,h)

end

vgui.Register( "esclib.combolist", PANEL, "DPanel" )
--PATH addons/____esclib/lua/elib/vgui/esc_numslider.lua:
local PANEL = {}

function PANEL:Init()

	self.parent = self:GetParent()
	local clr = esclib.addon:GetColors()
	self:SetMouseInputEnabled(true)

	local textentry = self:Add("DTextEntry")
	self.textentry = textentry
	textentry:SetWidth(60)
	textentry:Dock(RIGHT)
	textentry:SetNumeric(true)
	textentry:SetFont(esclib:AdaptiveFont("esclib", 16, 500))

	local slider = self:Add("esclib.slider")
	self.slider = slider
	slider:Dock(FILL)
	slider:DockMargin(0,0,5,0)

	slider.OnValueChanged = function(pnl,new)
		textentry:SetValue(new)
		self:OnValueChanged(new)
	end
	textentry:SetValue(slider:GetValue())

	function textentry:Paint(w,h)
		draw.RoundedBox(4,0,0,w,h,clr.button.hover)
		self:DrawTextEntryText(clr.button.text,clr.button.apply,clr.button.text_hover)
	end

	textentry.OnChange = function(pnl)
		local new = pnl:GetFloat() or 0
		slider:SetValue(new)

		self:OnValueChanged(slider:GetValue())
	end

	function textentry:OnGetFocus()
		local pnl = self:GetParent()
		if IsValid(pnl.parent) then
			pnl.parent:SetKeyBoardInputEnabled(true)
		end
	end

	function textentry:OnLoseFocus()
		timer.Simple(0, function()
			if not IsValid(textentry) then return end 
			textentry:SetValue(slider:GetValue())
		end)
		local pnl = self:GetParent()
		if IsValid(pnl.parent) then
			pnl.parent:SetKeyBoardInputEnabled(false)
		end
	end

	self:InvalidateParent(true)

end

function PANEL:SetBG(panel)
	if ispanel(panel) then
		self.parent = panel
	end
end

function PANEL:SetValue(num)
	self.slider:SetValue(num)
	self.textentry:SetValue(num)
end

function PANEL:GetValue()
	return self.slider:GetValue()
end

--# SET GET #--
function PANEL:SetMin(num)
	self.slider:SetMin(num)
end

function PANEL:GetMin()
	return self.slider:GetMin()
end

function PANEL:SetMax(num)
	self.slider:SetMax(num)
end

function PANEL:GetMax()
	return self.slider:GetMin()
end

function PANEL:SetDecimals(num)
	self.slider:SetDecimals(num)
end

function PANEL:SetStep(num)
	self.slider:SetScrollStep(num)
end



function PANEL:OnValueChanged(new)
	--override me pls
end

function PANEL:OnSizeChanged( w,h )
	self:InvalidateParent(true)
end


derma.DefineControl("esclib.numslider", "ESClib numslider", PANEL, "EditablePanel")
--PATH addons/____esclib/lua/elib/essentials/settings_menu/settings_types/esc_type_choicelist.lua:
local draw_bg = esclib.settings_shared_funcs.draw_bg
local VarsIsEqual = esclib.settings_shared_funcs.VarsIsEqual
local SharedDoRightClick = esclib.settings_shared_funcs.SharedDoRightClick


------------------
--# CHOICELIST #--
------------------
local stype = esclib:RegisterSettingsType("choicelist")
stype:Require("values")
stype:Require("value")
stype:Require("SelectableCount")
stype:SoftRequire("TranslateValues")
stype:SoftRequire("SearchEnabled")
function stype:Build( parent )
	local addon     = parent.addon
	local varid     = parent.var_uid
	local varc      = parent.var
	local callback  = parent.ApplyValue
	local init_vals = parent.initial_values
	local settab    = parent.bg
	local def_val   = parent.default_value

	local button_wide = parent:GetWide()
	local button_tall = parent:GetTall()

	local clr = esclib.addon:GetColors()
	local name_tr  = varc.name or addon:Translate(varc.name_tr)
	local desc = varc.desc or addon:Translate(varc.desc_tr)
	
	local font = esclib:AdaptiveFont("esclib", 20, 500)
	local font2 = esclib:AdaptiveFont("esclib", 16, 500)
	local name = esclib.util:TextCutAccurate(name_tr, font, button_wide-5, "...")

	local selected = istable(varc.value) and varc.value or {varc.value}
	varc.value = selected --convert to table or do nothing

	local button = parent:Add("DButton")
	button:SetSize(button_wide, button_tall)
	button:SetText("")
	if desc then
		button:eAddHint(desc,font,TEXT_ALIGN_TOP,settab)
	end
	button.DoRightClick = function(self) SharedDoRightClick(self, settab, name, addon, varid, varc, def_val, callback) end
	

	function button:DoClick()

		local clr = esclib.addon:GetColors()

		if varc.SelectableCount == 1 then
			local mx, my = input.GetCursorPos()
			local context = settab:Add("esclib.contextmenu")
			context:SetPosClamped(mx+5,my+5)
			context:AddHeader(name)

			context:AddSeparator()

			local selected = {}
			for _,name in ipairs(varc.value) do
				selected[name] = true
			end

			for k,name in ipairs(varc.values) do
				local btn_name = name
				if varc.TranslateValues then
					btn_name = addon:Translate(btn_name)
				end

				local mat = nil
				if selected[name] then
					mat = esclib:GetMaterial("true.png")
				end

				local btn = context:AddButton(btn_name, function()
					varc.value = {name}
					callback()
				end, mat)

				btn.Color = clr.frame.bg

				if selected[name] then
					btn.TextColor = clr.button.accent
				end
			end
		else
			local value_paint = function(self,w,h,val,active)
				local hovered = self:IsHovered()
				if varc.TranslateValues then
					val = addon:Translate(val)
				end
				
				draw_bg(w,h,hovered,clr)
				if active then
					draw.RoundedBox(0,0,0,5,h,clr.button.accent)
				end
				
				draw.SimpleText(val,font,15,h*0.5,hovered and clr.button.text_hover or clr.button.text, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		
			end

			local return_result = function(result)
				local val = result and (istable(result) and result or {result}) or {}
				if not table.IsEmpty(val) then
					varc.value = val
					callback(varid,varc.value)
				end
			end

			esclib:ChoiceMenu(name, varc.values, varc.SelectableCount, value_paint, return_result, nil, varc.SearchEnabled ~= false, varc.value[1], button_wide)
		end
	end

	local wrench_mat = esclib:GetMaterial("wrench.png")
	local offset_x = esclib:AdaptiveSize(10)
	function button:Paint(w,h)
		local hovered = self:IsHovered()

		local value = ""
		if istable(varc.value) then
			for _, v in pairs(varc.value) do
				if varc.TranslateValues then v = addon:Translate(v) end
				value = value .. v .. " "
			end
		else
			if varc.TranslateValues then 
				value = addon:Translate(varc.value)
			else
				value = varc.value
			end
		end
		local copied_name = ""
		if istable(init_vals[varid]) then
			for _, v in pairs(init_vals[varid]) do
				if varc.TranslateValues then v = addon:Translate(v) end
				copied_name = copied_name .. v .. " "
			end
		else
			if varc.TranslateValues then 
				copied_name = addon:Translate(init_vals[varid])
			else
				copied_name = init_vals[varid]
			end
		end

		local is_changed = value ~= copied_name
		draw_bg(w,h,hovered,clr,is_changed)

		if hovered then
			offset_x = Lerp(0.1, offset_x, h)
			esclib.draw:MaterialCentered(offset_x-h*0.5, h*0.5, h*0.25, clr.button.text, wrench_mat)
		else
			offset_x = Lerp(0.1, offset_x, 10.0)
		end

		draw.SimpleText(name,font,offset_x,8,clr.button.text,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.SimpleText("["..value:TrimRight().."]",font2,offset_x,h-8,clr.button.accent,TEXT_ALIGN_LEFT,TEXT_ALIGN_BOTTOM)
		draw.SimpleText("p","Marlett",w-4,h-4,clr.button.text,TEXT_ALIGN_RIGHT,TEXT_ALIGN_BOTTOM)
	end
end
--PATH addons/____echat/lua/echat/core/tools/parsers_core.lua:
local PLAYER_META = FindMetaTable("Player")

local clr_white = Color(255,255,255)
function PLAYER_META:ChatPrint(text)
    msg = echat:FinalParse(clr_white, text)

	if SERVER then
		echat:SendMessageToPlayer(nil, self, msg)
	else
		echat:AddParsedText( echat:ParseText(msg) )
	end
end

echat.old_print_msg = echat.old_print_msg or PLAYER_META.PrintMessage
function PLAYER_META:PrintMessage(mtype, msg)
	if mtype == HUD_PRINTTALK then
		if SERVER then
			echat:SendMessageToPlayer(nil, self, msg)
		else
			echat:AddParsedText( echat:ParseText(msg) )
		end
	end

	if isfunction(echat.old_print_msg) then echat.old_print_msg(self, mtype, msg) end
end

function PLAYER_META:IsTyping()
	return self:GetNWBool("echat.IsTyping", false)
end

if CLIENT then
	hook.Add("StartChat", "echat.start_istyping", function()
		net.Start("echat.toggle_chat")
			net.WriteBool(true)
		net.SendToServer()
	end)

	hook.Add("FinishChat", "echat.finish_istyping", function()
		net.Start("echat.toggle_chat")
			net.WriteBool(false)
		net.SendToServer()
	end)
end


if SERVER then
	echat.old_print_msg_all = echat.old_print_msg_all or PrintMessage
	function PrintMessage(mtype, msg)
		if mtype == HUD_PRINTTALK then
			echat:SendMessageToPlayer(nil, player.GetAll(), msg)
		end

		if isfunction(echat.old_print_msg_all) then echat.old_print_msg_all(mtype, msg) end
	end
end

local max = math.max
local min = math.min
local getkeys = table.GetKeys
local format = string.format

--------------------------
--# Parsers definition #--
--------------------------
echat.parsers = echat.parsers or {}
--if parser return None then command will not work
function echat:AddParser(
	uid, 
	encode_fn, 
	decode_fn, 
	example, 
	description, 
	custom_check, 
	icon
)
	echat.parsers[uid] = {uid=uid, encode_fn=encode_fn, decode_fn=decode_fn, example=example, description=description, custom_check=custom_check, icon=icon}
end

function echat:GetParser(uid)
	return echat.parsers[uid]
end

function echat:GetParsers()
	return echat.parsers
end

function echat:GetParserList()
	return getkeys(echat.parsers)
end


--------------------------
--# EMOJI USEFUL FUNCS #--
--------------------------
local errormat = Material("error")
function echat:GetEmoji(uid)
	return echat.EmojiMaterials[uid] or errormat
end

function echat:GetEmojiList()
	return getkeys(echat.EmojiMaterials)
end

function echat:GetEmojiTable()
	return echat.EmojiMaterials
end


echat.COMMAND_BRACKET_1 = "<"
echat.COMMAND_BRACKET_2 = ">"
echat.ESCAPE_CHAR = "\\"


--------------------
--# TEXT PARSERS #--
--------------------

--converts usual chat.AddText to string
function echat:ParseVararg(...)
	local args = {...}
	local parsed_str = ""

	local rgb_ref = echat.COMMAND_BRACKET_1.."rgb:%d,%d,%d,%d"..echat.COMMAND_BRACKET_2

	for k, v in ipairs(args) do
		if type(v) == "table" then --if color
			if not (isnumber(v.r) and isnumber(v.g) and isnumber(v.b) and isnumber(v.a)) then
				continue 
			end
			parsed_str = parsed_str..(format(rgb_ref, v.r, v.g, v.b, v.a))
		elseif type(v) == "string" then --if text
			if v == "" then continue end
			parsed_str = parsed_str..v
		elseif type(v) == "Player" then
			if not IsValid(v) then return end

			local team_clr = team.GetColor(v:Team()) or color_white
			local rank = v:GetUserGroup() or "???"
			local format_str = echat.config.rank_formats["__default__"]
			
			--format by rank
			if echat.config.rank_formats[rank] then format_str = echat.config.rank_formats[rank] end

			--format by steamid
			local steam64 = v:SteamID64() or "???"
			if echat.config.rank_formats[steam64] then format_str = echat.config.rank_formats[steam64] end

			

			local nick = v:Nick()
			nick = nick ~= "" and nick or v:SteamName()
			nick = echat:EscapeParsed(nick)

			format_str = esclib.text:KeyFormat(format_str, {
				["rank"] = rank,
				["nick"] = nick,
				["job_color"] = format(rgb_ref, team_clr.r, team_clr.g, team_clr.b, team_clr.a),
				["steamid"] = v:SteamID(),
				["steamid64"] = v:SteamID64(),
			})

			parsed_str = parsed_str..format_str
		else
			parsed_str = parsed_str..tostring(v)
		end 
	end

	return parsed_str or ""
end

function echat:FinalParse(...)
	local vararg_parsed = echat:ParseVararg(...)

	local final_str = esclib.text:KeyFormat(echat.config.message_format, {
		["message"] = vararg_parsed,
	})

	return final_str
end


function echat:ParseCmd(txt, ply)
	if txt == "" then 
		return {type="text", value=echat.COMMAND_BRACKET_1..txt..echat.COMMAND_BRACKET_2}
	end 

	local delimiter = ":"
	local cmd_args = {}
	

	for substring in txt:gmatch("[^" .. delimiter .. "]+") do
		table.insert(cmd_args, substring)
	end

	--first cmd always should be command
	if #cmd_args < 1 then
		return {type="text", value=echat.COMMAND_BRACKET_1..txt..echat.COMMAND_BRACKET_2}
	else
		local command = cmd_args[1]
		local parser = echat:GetParser(command)
		if istable(parser) then
			if isfunction(parser.custom_check) and SERVER then
				if not parser.custom_check(ply, parser) then --custom check definition
					return {type="text", value=echat.COMMAND_BRACKET_1..txt..echat.COMMAND_BRACKET_2}
				end
			end

			local result = parser.encode_fn(cmd_args)

			if not result or result == "" then --if no finded
				return {type="text", value=echat.COMMAND_BRACKET_1..txt..echat.COMMAND_BRACKET_2}
			end
			
			return result
		else
			return {type="text", value=echat.COMMAND_BRACKET_1..txt..echat.COMMAND_BRACKET_2}
		end
	end

	--if nothing found return none
	return
end


function echat:ParseText(txt, ply)
	if not txt then return end

	if echat.config.multiline then
        txt = string.Replace(txt, "\\n", "\n")
    else
        txt = string.Replace(txt, "\n", "")
        txt = string.Replace(txt, "\\n", "")
    end

	local result = {}

	local prev_ind = -1
	local prev_char = ""
	local bracket_match = esclib.text:MatchSplit(txt, "<(.-)>")
	for k,v in ipairs(bracket_match) do
		if v.matched then
			if prev_char == echat.ESCAPE_CHAR then
				local val = result[prev_ind+1]
				if val and val.type == "text" then
					val.value = string.TrimRight(val.value, "\\")
				end
				table.insert(result, {type = "text", value = v.value})
			else
				local parsed_result = self:ParseCmd(string.gsub(v.value, "["..echat.COMMAND_BRACKET_1..echat.COMMAND_BRACKET_2.."]", ""), ply)
				table.insert(result, parsed_result)
				prev_char = ""
				prev_ind = -1
			end
		else
			local emoji_match = esclib.text:MatchSplit(v.value, ":([%w_]+):")

			for k,v in ipairs(emoji_match) do
				if v.matched then
					if prev_char == echat.ESCAPE_CHAR then
						local val = result[prev_ind+1]
						if val and val.type == "text" then
							val.value = string.TrimRight(val.value, "\\")
						end
						table.insert(result, {type = "text", value = v.value})
					else
						table.insert(result, {type = "emoji", value = string.Replace(v.value, ":", "")})
						prev_char = ""
						prev_ind = -1
					end
				else
					local text = v.value
					prev_char = string.sub(text, -1)
					prev_ind = #result
					table.insert(result, {type = "text", value = text})
				end
			end
		end
	end

	return result
end

function echat:ParsedToText(parsed)
	local text = ""

	for _, item in ipairs(parsed) do
		local _type = item.type
		local parser = self:GetParser(_type)

		local value = tostring(item.value or "")
		if parser then 
			value = format("%s%s%s", echat.COMMAND_BRACKET_1, parser.decode_fn(item), echat.COMMAND_BRACKET_2)
		end
		
		text = text .. value
	end

	return text
end

function echat:EscapeParsed(text)
	--command brackets
	local text = string.Replace(text, echat.COMMAND_BRACKET_1, echat.ESCAPE_CHAR..echat.COMMAND_BRACKET_1)

	--emojies
	for _,emoj_name in ipairs(echat:GetEmojiList()) do
		text = string.Replace(text, format(":%s:", emoj_name), format("\\:%s:", emoj_name))
	end
	return text
end

-----------------------
--# VARIABLE PARSER #--
-----------------------
local VARIABLE_PARSE_META = {}

function VARIABLE_PARSE_META:Init()
	self.data = {}
	self:AddText(nil, echat:FinalParse("")) --add time, and fonts to message
end

function VARIABLE_PARSE_META:AddText(ply, text)
    table.insert(self.data, {["text"] = text, ["ply"] = ply})
    return self
end

function VARIABLE_PARSE_META:AddVararg(ply, ...)
	self:AddText(ply, echat:ParseVararg(...))
    return self
end

function VARIABLE_PARSE_META:AddNonParsedText(text)
	table.insert(self.data, {["text"] = text, ["noparse"] = true})
end

function VARIABLE_PARSE_META:AddNonParsedVararg(...)
	self:AddNonParsedText(echat:ParseVararg(...))
    return self
end

VARIABLE_PARSE_META.__index = VARIABLE_PARSE_META

--returns parsed info
function VARIABLE_PARSE_META:Parse()
    local result = {}
    for k,v in ipairs(self.data) do
		if v.noparse then
			table.Add(result, {["type"] = "text", ["value"] = v.text})
		else
        	table.Add(result, echat:ParseText(v.text, v.ply))
		end
    end
    return result
end

-- === EXAMPLE ===
-- local parser = echat:NewVariableParser()
-- parser:AddVararg(nil, "<clr:green>[OOC] ", ply, color_white, ":") --no check for player (nil)
-- parser:AddVararg(ply, text) --protected (uses RBAC)
-- local parsed_data = parser:Parse()
-- ===============
function echat:NewVariableParser()
    local parse_meta = {}
    setmetatable(parse_meta, VARIABLE_PARSE_META)
	parse_meta:Init()
    return parse_meta
end
--PATH addons/__________scripts__loader/lua/scriptssss/disguise/cl_init.lua:
local col1 = ColorAlpha( color_black, 100 )
local col2 = Color( 225, 225, 225 )
local col3 = Color( 255, 215, 0 )
local col4 = ColorAlpha( color_black, 50 )
local draw = draw
local function disgue( v )
    if IsValid( dp_g ) then dp_g:Remove() end
    x_d, y_d = 0, 0
    dp_g = vgui.Create( 'onyx.Panel', dp_r )
    dp_g:Dock( 3 )
    dp_g:DockMargin( 1, 1, 1, 1 )
    dp_g:SetSize( 432 )
    local font1 = onyx.Font( 'Comfortaa@25' )
    local font2 = onyx.Font( 'Comfortaa@19' )
    dp_g.cost = 1
    name = vgui.Create( 'onyx.Button', dp_g )
    name:SetText( v.name )
    name:SetFont( font1 )
    name:Dock( 4 )
    name:DockMargin( 0, 2, 7, 0 )
    name:SetTall( 30 )
    name:SetDisabled( true )
    name:SetColorIdle( Color( v.Color.r, v.Color.g, v.Color.b, 125 ) )
    --
    local pl_mdl = vgui.Create( 'DModelPanel', dp_g )
    pl_mdl:TDLib()
    pl_mdl:Dock( 1 )
    pl_mdl:DockMargin( 0, 0, 7, 0 )
    pl_mdl:SetModel( v.Model[dp_g.cost] )
    pl_mdl:SetFOV( 30 )
    pl_mdl:FadeHover( col4 )
    pl_mdl.Sequences = { 'pose_standing_01', 'pose_standing_02', 'pose_standing_03', 'pose_standing_04' }
    if pl_mdl.Entity then
        local dance = pl_mdl.Entity:LookupSequence( table.Random( pl_mdl.Sequences ) )
        pl_mdl.Entity:SetSequence( dance )
    end

    local hz = 60
    function pl_mdl:LayoutEntity( Entity )
        if IsValid( Entity ) then
            local headBone = Entity:LookupBone( 'ValveBiped.Bip01_Head1' )
            if headBone then hz = Entity:GetBonePosition( headBone ).z end
        end

        if hz < 5 then hz = 40 end
        hz = hz * 0.6
        self:SetCamPos( Vector( 175, 0, hz ) )
        self:SetLookAt( Vector( 0, 0, hz ) )
    end

    local ok = vgui.Create( 'onyx.Button', dp_g )
    ok:SetText( 'Замаскуватися' )
    ok:SetFont( font1 )
    ok:Dock( 5 )
    ok:DockMargin( 0, 0, 7, 2 )
    ok:SetTall( 35 )
    ok.DoClick = function()
        RunConsoleCommand( 'play', 'z_anticrash/cat_press.mp3' )
        RunConsoleCommand( 'Disguise_ON', v.team )
        fr:Remove()
    end

    rpn = vgui.Create( 'RichText', dp_g )
    rpn:Dock( 5 )
    rpn:SetSize( 400, 200 )
    rpn:DockMargin( 0, 0, 7, 5 )
    rpn:SetText( v.Description )
    rpn.Paint = function( _, w, h ) draw.RoundedBox( 5, 0, 0, w, h, col1 ) end
    function rpn:PerformLayout()
        self:SetFontInternal( font2 )
        self:SetFGColor( col2 )
    end
end

-----------------------------------------------------
local PANEL = {}
function PANEL:Init()
    self:SetModel( LocalPlayer():GetModel() )
end

function PANEL:Paint()
end

function PANEL:PaintOver()
end

vgui.Register( 'rp_modelicon', PANEL, 'SpawnIcon' )
-----------------------------------------------------
PANEL = {}
rp.TModel = {}
function PANEL:Init()
    self:SetText( '' )
    self:SetTall( 50 )
    self:Import('click')
    self:Import('hovercolor')
    self:AddHoverSound()
    self:AddClickEffect()
    self.Model = vgui.Create( 'rp_modelicon', self )
    self.Model:SetModelName( '' )
    self.Job = rp.Team[1]
    self.gggg = true
    self.font1 = onyx.Font( 'Comfortaa@24' )
    self.font2 = onyx.Font( 'Comfortaa@20' )
end

function PANEL:Paint( w, h )
    local r, g, b = self.Job.Color.r, self.Job.Color.g, self.Job.Color.b
    draw.RoundedBox( 1, 0, 0, w, h, Color( r, g, b, 100 ) )
    draw.SimpleText( #team.GetPlayers( self.Job.team ) .. '/' .. ( self.Job.Max == 0 and '∞' or self.Job.Max ), self.font1, w - 30, h * 0.5, color_white, 1, 1 )
    if not self.Job.customCheck then rp.ShadowText( self.Job.name, self.font1, w * 0.5, h * 0.5, color_white, 1, 1, 1, color_black ) end
end

function PANEL:PerformLayout()
    table.insert( rp.TModel, self.Job.Model[1] )
    self.Model:SetModel( rp.TModel[#rp.TModel] )
    self.Model:SetModelName( '' )
    self.Model:SetPos( 0, 0 )
    self.Model:SetSize( 60, 60 )
    if self.Job.customCheck and self.gggg then
        self.gggg = false
        self:DualText( self.Job.name, self.font1, color_white, 'VIP', self.font2, col3 )
    end
end

function PANEL:OnCursorEntered()
end

function PANEL:DoClick()
    RunConsoleCommand( 'play', 'z_anticrash/cat_press.mp3' )
    disgue( self.Job )
end

function PANEL:SetJob()
end

vgui.Register( 'rp_disbutton', PANEL, 'onyx.Button' )
local bad = { 'Адміністратор', 'Солдат А-04', 'Мер', 'Ghost Rider', 'Смерть', }
local function diguemenu()
    if IsValid( dp_r ) then dp_r:Remove() end
    dp_r = vgui.Create( 'onyx.Panel', fr )
    dp_r:Dock( FILL )
    dp_r:DockMargin( 3, 0, 0, 0 )
    dp_j = vgui.Create( 'onyx.ScrollPanel', dp_r )
    dp_j:Dock( LEFT )
    dp_j:DockMargin( 1, 1, 1, 1 )
    dp_j:SetWide( 755 )
    for i = 1, #rp.Team do
        if not table.HasValue( bad, rp.Team[i].name ) and rp.Team[i].IsDisguse ~= true and rp.Team[i].mozhnovnegodisguse ~= false then
            timer.Simple( i * .07, function()
                local v = rp.Team[i]
                local jb = dp_j:Add( 'rp_disbutton' )
                jb:TDLib()
                jb:Dock( TOP )
                jb:SetTall( 60 )
                jb:DockMargin( 0, 0, 0, 3 )
                jb:SetAlpha( 0 )
                jb:AlphaTo( 255, .7 )
                jb.Job = v
                jb:SetColorHover(onyx.OffsetColor(col3, 5))
                if v.customCheck then
                    jb:BarHover( col3 )
                else
                    jb:FadeHover( col4 )
                end
            end )
        end
    end
end

concommand.Add( 'disg', function()
    if IsValid( fr ) then fr:Remove() end
    fr = vgui.Create( 'onyx.Frame' )
    fr:SetSize( 1200, 700 )
    fr:Center()
    fr:SetTitle( 'Маскування' )
    fr:MakePopup()
    diguemenu()
    disgue( rp.Team[1] )
end )
--PATH addons/__________scripts__loader/lua/scriptssss/old-hud-elements/cl_init.lua:
local Color = Color
local CurTime = CurTime
local draw = draw
local LocalPlayer = LocalPlayer
local IsValid = IsValid
local Material = Material
local ScrW = ScrW
local ScrH = ScrH
local tonumber = tonumber
--
local hud = onyx.hud
--
net.Receive( 'mervisral', function()
    mervisral = net.ReadString()
    timer.Create( 'mervisral', 15, 1, function() mervisral = false end )
end )

local col1 = Color( 100, 255, 100 )
local col2 = Color( 255, 100, 100 )
local col13 = ColorAlpha( Color( 255, 0, 0 ), 225 )
local col14 = Color( 50, 200, 50 )
local col15 = Color( 11, 11, 11, 210 )
local col16 = ColorAlpha( col13, 210 )
local localPlayer = LocalPlayer()
local deathMat = Material( 'ukrainerp/death.png' )
--
local function DrawWhoProp()
    local ent = localPlayer:GetEyeTrace().Entity
    if IsValid( ent ) then
        local who = ent:CPPIGetName()
        if who then
            draw.SimpleText( who, hud.fonts.Name, 10 - 1, ScrH() * 0.5 - 1, color_black, 0, 1 )
            draw.SimpleText( who, hud.fonts.Name, 10, ScrH() * 0.5, who == localPlayer:Name() and col1 or col2, 0, 1 )
        end
    end
end

local killent
net.Receive( 'KillYou', function() killent = net.ReadString() end )
hook.Add( 'RenderScreenspaceEffects', 'KillYou', function() if not localPlayer:Alive() then DrawMotionBlur( 0.01, 0.99, 9999 ) end end )
--
local clr = {
    ['$pp_colour_addr'] = 0,
    ['$pp_colour_addg'] = 0,
    ['$pp_colour_addb'] = 0,
    ['$pp_colour_brightness'] = 0,
    ['$pp_colour_contrast'] = 1,
    ['$pp_colour_colour'] = 1,
    ['$pp_colour_mulr'] = 0,
    ['$pp_colour_mulg'] = 0,
    ['$pp_colour_mulb'] = 0
}

hook.Add( 'HUDPaint', 'UKHUD___', function()
    localPlayer = LocalPlayer()
    health = localPlayer:Health()
    maxhealth = localPlayer:GetMaxHealth()
    percent = health / maxhealth
    --
    DrawWhoProp()
    --
    if not localPlayer:Alive() then
        local death_time = tonumber( localPlayer:GetNetVar( 'DeathTime' ) )
        local time = math.Clamp( math.ceil( death_time - CurTime() + 15 ), 0, 15 )
        surface.SetMaterial( deathMat )
        surface.SetDrawColor( col13 )
        surface.DrawTexturedRect( ScrW() * 0.5 - 512 * 0.5, ScrH() * 0.5 - 512 * 0.5 - 50, 512, 512 )
        hud.DrawRoundedBoxEx( 0, ScrH() - ScreenScale( 50 ), ScrW(), ScreenScale( 50 ), color_black, false, false, false, false )
        if time ~= 0 then
            draw.SimpleText( 'До відродження залишилося ' .. time .. ' секунд', hud.fonts.AmmoClip, ScrW() * 0.5, ScrH() - ScreenScale( 50 ) * 0.5, color_white, 1, 1 )
        else
            draw.SimpleText( 'Натисніть SPACE для відродження', hud.fonts.AmmoClip, ScrW() * 0.5, ScrH() - ScreenScale( 50 ) * 0.5, color_white, 1, 1 )
        end

        if killent and killent ~= '' then draw.SimpleText( 'Вас вбив ' .. killent, hud.fonts.AmmoClip, ScrW() * 0.5, ScrH() - ScreenScale( 50 ) * 0.8, color_white, 1, 1 ) end
    end

    if percent <= 0.4 then
        clr['$pp_colour_colour'] = percent
        DrawColorModify( clr )
    end

    --
    if not rp.Team[localPlayer:Team()] then return end
    if rp.Team[localPlayer:Team()].IsDisguse then
        rp.ShadowText( 'Натисніть [T] щоб надіти Маскування!', hud.fonts.Medium, 15, 17, col14, 0, 0 )
        if isnumber( localPlayer:GetNetVar( 'Disguise_Time', 0 ) ) and localPlayer:GetNetVar( 'Disguise_Time', 0 ) > 0 then rp.ShadowText( 'Залишилося часу: ' .. math.Round( localPlayer:GetNetVar( 'Disguise_Time', 0 ) - CurTime() ) .. ' секунд', hud.fonts.Medium, 15, 40, col14, 0, 0 ) end
    end

    --
    if mervisral then
        local w = onyx.GetTextSize( mervisral, hud.fonts.Big ) + 50
        if w < 450 then w = 450 end
        hud.DrawRoundedBoxEx( ScrW() * .5 - w * 0.5, 50, w, 75, col15, false, false, false, false )
        hud.DrawRoundedBoxEx( ScrW() * .5 - w * 0.5, 50, w, 35, col16, false, false, false, false )
        surface.SetDrawColor( col16 )
        surface.DrawOutlinedRect( ScrW() * .5 - w * 0.5, 50, w, 75, 1 )
        draw.SimpleText( 'Оголошення мера:', hud.fonts.Big, ScrW() * 0.5, 50, color_white, 1 )
        draw.SimpleText( mervisral, hud.fonts.Medium, ScrW() * 0.5, 90, color_white, 1 )
    end

    --
    if localPlayer:GetNetVar( 'Disgue' ) or localPlayer:GetNetVar( 'Disguise_G' ) then rp.ShadowText( 'Натисніть [G] щоб зняти маскування!', hud.fonts.Big, ScrW() * 0.5, 17, col14, 1 ) end
end )